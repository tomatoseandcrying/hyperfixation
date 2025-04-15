--Visual Libraries
SMODS.Atlas{
    key = 'IjiraqJokers',
    path = "IjiraqJokers.png",
    px = 71,
    py = 95
}

G.C.IjiGray = HEX('BFD7D5')


--General Refactor Functions
local function stoneGeneration(card, context)
    G.E_MANAGER:add_event(Event({
        func = function() 
            local front = pseudorandom_element(G.P_CARDS, pseudoseed('marb_fr'))
            G.playing_card = (G.playing_card and G.playing_card + 1) or 1
            local card = Card(G.play.T.x + G.play.T.w/2, G.play.T.y, G.CARD_W, G.CARD_H, front, G.P_CENTERS.m_stone, {playing_card = G.playing_card})
            card:start_materialize({G.C.SECONDARY_SET.Enhanced})
            G.play:emplace(card)
            table.insert(G.playing_cards, card)
            return true
        end}))
    card_eval_status_text(context.blueprint_card or card, 'extra', nil, nil, nil, {message = localize('k_plus_stone'), colour = G.C.SECONDARY_SET.Enhanced})

    G.E_MANAGER:add_event(Event({
        func = function() 
            G.deck.config.card_limit = G.deck.config.card_limit + 1
            return true
        end}))
        draw_card(G.play,G.deck, 90,'up', nil)  

    playing_card_joker_effects({true})   
end

--Charater-Specific Refactor Functions
local function Transform(card, context)
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
end
local function Transfodd(self, context)
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self:flip()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
            play_sound("card1")
            self:juice_up(0.3, 0.3)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self:flip()
            self.isIjiraq = nil
            self.visiblyIjiraq = nil
            return true
        end
    }))
end
local function braisedMultCalc(card, context)
    local tempMult, tempID = -1, -1
    local raised_card = nil
    for i = 1, #G.hand.cards do
        if tempID <= G.hand.cards[i].base.id and G.hand.cards[i].ability.effect ~= 'Stone Card' then
            tempMult = G.hand.cards[i].base.nominal
            tempID = G.hand.cards[i].base.id
            raised_card = G.hand.cards[i]
        end
    end
    if raised_card == context.other_card then
        if context.other_card.debuff then
            return {
                message = localize('k_debuffed'),
                colour = G.C.RED,
            }
        else
            return Transform(card, context)
        end
    end
end
local function braisedHand(card, context)
    if context.cardarea == G.hand then
        braisedMultCalc(card, context)
    end
end
local function braisedInd(card, context)
    if context.individual then
        braisedHand(card, context)
    end
end
local function disloyalScoring2(card, context)
    if card.ability.loyalty_remaining == 0 then
        return {
            Transform(card, context),
            x_mult = 1/card.ability.extra.x_mult
        }
    end
end
local function disloyalBlueprint(card, context)
    if card.ability.loyalty_remaining == card.ability.extra.every then
        return {
            x_mult = card.ability.extra.x_mult
        } 
    end
end
local function disloyalScoring(card, context)
    if context.blueprint then
        disloyalBlueprint(card, context)
    else
        disloyalScoring2(card, context)
    end
end
local function disloyalMain(card, context)
    if context.joker_main then
        card.ability.loyalty_remaining = (card.ability.extra.every - 1)
        disloyalScoring(card, context)
    end
end
local function bannerScoring(card, context)
    if context.joker_main and to_big(card.ability.extra.chips) > to_big(1) then
        return{
            Transform(card, context),
            chips = -(card.ability.extra.chips*G.GAME.current_round.discards_left)
        }
    end
end
local function whackCardCheck(card, context)
    if (context.other_card:get_id() == 2 or
    context.other_card:get_id() == 3 or
    context.other_card:get_id() == 4 or
    context.other_card:get_id() == 5) then
        return {
            message = localize('k_again_ex'),
            repetitions = card.ability.extra.repetitions,
            card = card
        } 
    end
end
local function whackRepetition(card, context)
    if context.repetition then
        if context.cardarea == G.play then
            whackCardCheck(card, context)
        end
    end
end
local function whackBefore(card, context)
    if context.before and context.cardarea == G.jokers then
        for _, kard in ipairs(context.scoring_hand) do
            if kard:get_id() == 2 or kard:get_id() == 3 or kard:get_id() == 4 or kard:get_id() == 5 then
                table.insert(card.ability.extra.played_cards, kard)
            end
        end
    end
end
local function whackAfter(card, context)
    if context.after then
        local played2, played3, played4, played5 = false, false, false, false
        for _, v in ipairs(card.ability.extra.played_cards) do
            if v:get_id() == 2 then played2 = true
            elseif v:get_id() == 3 then played3 = true
            elseif v:get_id() == 4 then played4 = true
            elseif v:get_id() == 5 then played5 = true end
            if played2 and played3 and played4 and played5 then break end
        end
        if played2 and played3 and played4 and played5 then
            return Transform(card, context)
        end
    end
end
local function porcelainBlind(card, context)
    if context.setting_blind and not card.getting_sliced then
        stoneGeneration(card, context)
    end
end
local function porcelainDrawn(card, context)
    if context.hand_drawn then
        for _, card in ipairs(G.playing_cards) do
            card:set_ability(G.P_CENTERS.c_base)
        end
        return Transform(card, context)
    end
end
local function blueMainEnd(card, context)
    main_end = (card.area and card.area == G.jokers) and {
        {n=G.UIT.C, config={align = "bm", minh = 0.4}, nodes={
            {n=G.UIT.C, config={ref_table = card, align = "m", colour = G.C.JOKER_GREY, r = 0.05, padding = 0.06, func = 'blueprint_compat'}, nodes={
                {n=G.UIT.T, config={ref_table = card.ability, ref_value = 'blueprint_compat_ui',colour = G.C.UI.TEXT_LIGHT, scale = 0.32*0.8}},
            }}
        }}
    } or nil
end
local function blueCompatible(card, context)
    for i = 1, #G.jokers.cards do
        if G.jokers[i] == card then other_joker = G.jokers[i+1] end
    end
    if other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat then
        card.ability.blueprint_compat = 'compatible'
    else
        card.ability.blueprint_compat = 'compatible'
    end
end

--Ijiraq Costume Functions
function maxx_debug(txt)
	attention_text({
		text = txt,
		scale = 1.3, 
		hold = 1.4,
		major = aura_card,
		backdrop_colour = G.C.RARITY[4],
		align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
		offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0},
		silent = true
	})
end
local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.fodder_card = { jkey = 'ijiraq' }
	return ret
end
function SMODS.current_mod.reset_game_globals(run_start)
    if G.GAME.current_round.fodder_card.jkey == 'ijiraq' then
        local ijiraq_pool = get_current_pool("Joker")
        local jokester = pseudorandom_element(ijiraq_pool, pseudoseed('ijiraq'))
        G.GAME.current_round.fodder_card.jkey = jokester or 'j_joker'
    end
end
local stupidRef = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
   local ihatethis = nil
   local changed = false
    if card and (card.config.center and card.config.center.key == _c.key) and card.visiblyIjiraq then
        ihatethis = G.localization.descriptions[_c.set][_c.key]['name']
        ihatethis = ihatethis .. '{C:IjiGray}...?{}'
        G.localization.descriptions[_c.set][_c.key]['name'] = ihatethis
		changed = true
        init_localization()
    end
    local hatethisonethemost = stupidRef(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    if changed then
        ihatethis = ihatethis:sub(1, ihatethis:len() - 17)
        G.localization.descriptions[_c.set][_c.key]['name'] = ihatethis
		init_localization()
    end
    return hatethisonethemost
end
local add2deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if self.isIjiraq then self.visiblyIjiraq = true end
     add2deck_ref(self, from_debuff)
end

--Ijiraq. Just Ijiraq.
SMODS.Joker{
    key = 'ijiraq',
    pos = {x = 0, y = 9},
    soul_pos = {x = 1, y = 9},
    no_mod_badges = false,
    unlocked = true,
    discovered = false,
    rarity = 4,
    cost = 8,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = {
        extra = {jkey = 'ijiraq'}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.jkey
        }}
    end
}
SMODS.Joker{ --Costume
	key = 'costume',
	atlas = 'IjiraqJokers',
	rarity = 3,
	blueprint_compat = false,
	eternal_compat = false,
	pos = { x = 0, y = 0 },
	config = { extra = {
			jkey = 'fodder'
		}
	},
	no_collection = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.jkey}}
	end,
	set_ability = function(self, card, initial, delay_sprites)
        card.config.center = G.P_CENTERS[G.GAME.current_round.fodder_card.jkey or 'j_joker']
        card:set_ability(card.config.center,true)
        card:set_sprites(card.config.center)
        card:set_cost()
        card.isIjiraq = true
    end,
	calculate = function(self,card,context)
		if context.before and context.cardarea == G.jokers then
			maxx_debug(G.GAME.current_round.fodder_card.jkey)
		end
	end
}
local calc_Ref = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = calc_Ref(self,context)
    if ret and self.isIjiraq then
        Transfodd(self, context)
    end
    return ret 
end

--Jokers
SMODS.Joker{ --Misprint? REFACTORED
key = 'reprint',
pos = {x = 6, y = 2},
no_mod_badges = true,
unlocked = true,
discovered = true,
no_collection = true,
config = {
    extra = {max = 23, min = 0}
},
loc_vars = function (self, info_queue, card)
    local random_mult = {}
            for i = card.ability.extra.min, card.ability.extra.max do
                random_mult[#random_mult+1] = tostring(i)
            end
            local local_mult = ' '..(localize('k_mult'))..' '
    return{
    main_start = {
        {n=G.UIT.T, config={text = '  +',colour = G.C.MULT, scale = 0.32}},
        {n=G.UIT.O, config={object = DynaText({string = random_mult, colours = {G.C.RED},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.5, scale = 0.32, min_cycle_time = 0})}},
        {n=G.UIT.O, config={object = DynaText({string = {
            {string = 'toma()', colour = G.C.JOKER_GREY},{string = "#@"..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.id or 11)..(G.deck and G.deck.cards[1] and G.deck.cards[#G.deck.cards].base.suit:sub(1,1) or 'D'), colour = G.C.RED},
            local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult, local_mult},
        colours = {G.C.UI.TEXT_DARK},pop_in_rate = 9999999, silent = true, random_element = true, pop_delay = 0.2011, scale = 0.32, min_cycle_time = 0})}},
        card.area == G.jokers and {n=G.UIT.T, config={text = '...?', colour = G.C.IjiGray, scale = 0.32}} or nil,
    }}
end,
generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_reprint", nodes = {} }
    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
end,
add_to_deck = function(self, card, from_debuff)
    card.ability.extra.new_key = "j_hpfx_reprint_alt"
end,
rarity = 1,
cost = 4,
atlas = 'IjiraqJokers',
blueprint_compat = true,
eternal_compat = false,
perishable_compat = true,
calculate = function(self, card, context)
    if context.joker_main then
        return Transform(card, context)
    end
end
}
SMODS.Joker{ --Raised Fist? REFACTORED
    key = 'braised',
    pos = {x = 8, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_braised", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_braised_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        return braisedInd(card, context)
    end
}
SMODS.Joker{--Mystic Summit? REFACTORED
    key = 'twistit',
    pos = {x = 2, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    -- no_collection = true,
    config = {
        extra = {mult = 15, discards_remaining = 0},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.discards_remaining,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_twistit",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_twistit_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and G.GAME.current_round.discards_left ~= card.ability.extra.discards_remaining then
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.before and G.GAME.current_round.discards_left == card.ability.extra.discards_remaining then
            return Transform(card, context)
        end
    end
}
SMODS.Joker{--Loyalty Card? REFACTORED
key = 'redeemed',
pos = {x = 4, y = 2},
no_mod_badges = true,
unlocked = true,
discovered = true,
no_collection = true,
config = {
    extra = {x_mult = 4, every = 1, remaining = "5 remaining"}
},
loc_vars = function (self, info_queue, card)
    return{vars = {
        card.ability.extra.x_mult, 
        card.ability.extra.every,
        localize{type = 'variable', key = (card.ability.loyalty_remaining == 0 and 'loyalty_active' or 'loyalty_inactive'), vars = {card.ability.loyalty_remaining}}, 
        card.area and card.area == G.jokers and "...?" or ""
    }}
end,
generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_redeemed", nodes = {} }
    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    card.ability.burnt_hand = 0
    card.ability.loyalty_remaining = card.ability.extra.every
end,
add_to_deck = function(self, card, from_debuff)
    card.ability.extra.new_key = "j_hpfx_redeemed_alt"
end,
rarity = 2,
cost = 5,
atlas = 'IjiraqJokers',
blueprint_compat = true,
eternal_compat = false,
perishable_compat = true,
calculate = function (self, card, context)
    return disloyalMain(card, context)
end
}
SMODS.Joker{--Steel Joker? REFACTORED
key = 'iron',
pos = {x = 7, y = 2},
no_mod_badges = true,
unlocked = true,
discovered = true,
no_collection = true,
config = {
    extra = {x_mult = 0.2}
},
loc_vars = function (self, info_queue, card)
    local steel_tally = 0
    for k, v in pairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(v, 'm_steel') then steel_tally = steel_tally + 1 end
    end
    return{vars = {
        card.ability.extra.x_mult,
        1 + (card.ability.extra.x_mult * (steel_tally or 0)),
        card.area and card.area == G.jokers and "...?" or ""
    }}
end,
generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_iron", nodes = {} }
    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
end,
add_to_deck = function(self, card, from_debuff)
    card.ability.extra.new_key = "j_hpfx_iron_alt"
end,
rarity = 2,
cost = 7,
atlas = 'IjiraqJokers',
blueprint_compat = true,
eternal_compat = false,
perishable_compat = true,
calculate = function(self, card, context)
    if context.joker_main and to_big(card.ability.extra.x_mult) > to_big(0) then
        local steel_tally = 0
        for k, v in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, 'm_steel') then steel_tally = steel_tally + 1 end
        end
        return {
            Transform(card, context),
            x_mult = 1/(1 + card.ability.extra.x_mult*steel_tally)
        }
    end
end
}
SMODS.Joker{ --Acrobat? REFACTORED
key = 'trapezoid',
atlas = 'IjiraqJokers',
pos = {x = 2, y = 1},
no_mod_badges = true,
config = {
    extra = {x_mult = 3}
},
unlocked = true,
discovered = true,
no_collection = true,
loc_vars = function (self, info_queue, card)
    return{vars = {
        card.ability.extra.x_mult, 
        card.area and card.area == G.jokers and "...?" or ""
    }}
end,
generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_trapezoid", nodes = {} }
    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
end,
add_to_deck = function(self, card, from_debuff)
    card.ability.extra.new_key = "j_hpfx_trapezoid_alt"
end,
rarity = 2,
cost = 6,
blueprint_compat = true,
eternal_compat = false,
perishable_compat = true,
calculate = function(self, card, context)
    if context.after and G.GAME.current_round.hands_left == 1 then
        return Transform(card, context)
    end
end
}
SMODS.Joker{--Banner? REFACTORED
    key = 'flag',
    pos = {x = 1, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    -- no_collection = true,
    config = {
        extra = {chips = 30},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_flag",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_flag_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        bannerScoring(card, context)
    end
}
SMODS.Joker{--Merry Andy? REFACTORED
    key = 'scaryandy',
    pos = {x = 8, y = 0},
    no_mod_badges = true,
    unlocked = true, --Set FALSE on release!!
    discovered = true,
    no_collection = true,
    config = {
        extra = {discard_size = 3, hand_size = -1}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.discard_size, 
            card.ability.extra.hand_size, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_scaryandy", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_scaryandy_alt"
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
		G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
		G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
		G.hand:change_size(-card.ability.extra.hand_size)
	end,
    rarity = 2,
    cost = 7,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.discard then
            return Transform(card, context)
        end
    end
}
SMODS.Joker{ --Troubadour? REFACTORED
    key = 'bard',
    atlas = 'IjiraqJokers',
    pos = {x = 0, y = 2},
    no_mod_badges = true,
    config = {
        extra = {hand_size = 2, hand_plays = -1}
    },
    unlocked = true,
    discovered = true,
    no_collection = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.hand_size, 
            card.ability.extra.hand_plays, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_bard", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_bard_alt"
        G.hand:change_size(card.ability.extra.hand_size)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands + card.ability.extra.hand_plays
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size)
        G.GAME.round_resets.hands = G.GAME.round_resets.hands - card.ability.extra.hand_plays
    end,
    rarity = 2,
    cost = 6,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.after then
            return Transform(card, context)
        end
    end
}
SMODS.Joker{ --Hack? REFACTORED
    key = 'whack',
    atlas = 'IjiraqJokers',
    pos = {x = 5, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {repetitions = 1, played_cards = {}}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.repetitions + 1,
            card.ability.extra.played_cards,
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_whack", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_whack_alt"
    end,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        return whackRepetition(card, context) 
        or whackBefore(card, context) 
        or whackAfter(card, context)
    end
}
SMODS.Joker{ --Marble Joker? REFACTORED
    key = 'porcelain',
    atlas = 'IjiraqJokers',
    pos = {x = 3, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {additions = 1}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.additions, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_porcelain", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_porcelain_alt"
    end,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        return porcelainBlind(card, context) or porcelainDrawn(card, context)
    end
}
SMODS.Joker{ --Golden Joker? REFACTORED
    key = 'pyramid',
    atlas = 'IjiraqJokers',
    pos = {x = 9, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {money = 4}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.money, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_pyramid", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_pyramid_alt"
        G.GAME.dollars = G.GAME.dollars + card.ability.extra.money
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.dollars = G.GAME.dollars - card.ability.extra.money
    end,
    rarity = 1,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calc_dollar_bonus = function(self, card)
		local bonus = card.ability.extra.money
		if bonus > 0 then 
            return (bonus * -1)
        end
        return Transform(card, context)
	end,
}
SMODS.Joker{ --Credit Card? REFACTORED
    key = 'expired',
    pos = {x = 5, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {credit = 20}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.credit, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_expired", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_expired_alt"
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.credit
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.credit
    end,
    rarity = 1,
    cost = 1,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function (self, card, context)
        local valueToPutInIf = Talisman and to_big and to_big(G.GAME.dollars):lte(0) or G.GAME.dollars <= to_big(0)
        if context.buying_card and valueToPutInIf then
            return Transform(card, context)
        end
    end
}
SMODS.Joker{ --Blueprint? REFACTORED
    key = 'blue',
    pos = {x = 0, y = 3},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''; card.ability.blueprint_compat_check = nil
        blueMainEnd(card, context)
        local other_joker
        if G.jokers then
            blueCompatible(card, context)
        end
        return{
            main_end = main_end,
            vars = {card.area and card.area == G.jokers and "...?" or ""}
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_blue", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_blue_alt"
    end,
    rarity = 3,
    cost = 10,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function (self, card, context)
        if context.post_trigger then
            return Transform(card, context)
        end
    end
}