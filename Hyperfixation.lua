Hyperglobal = SMODS.current_mod

--Visual Libraries
SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
}):register()
SMODS.Atlas{
    key = 'IsaacJokers',
    path = "IsaacJokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
	key = 'Jokers4Fun',
	path = "Jokers4Fun.png",
	px = 71,
	py = 95
}
SMODS.Atlas{
    key = 'IjiraqJokers',
    path = "IjiraqJokers.png",
    px = 71,
    py = 95
}

--Audio Libraries
SMODS.Sound({
    key = "hpfx_1up",
    path = "1up.ogg",
})
SMODS.Sound({
    key = "hpfx_thumbsup",
    path = "thumbsup.ogg",
})
SMODS.Sound({
    key = "hpfx_gulp",
    path = "gulp.ogg",
})
SMODS.Sound({
	key = "hpfx_silver",
	path = "dimedrop.ogg",
})
SMODS.Sound({
	key = "hpfx_death1",
	path = "Isaac_dies_new.ogg",
})
SMODS.Sound({
	key = "hpfx_death2",
	path = "Isaac_dies_new_1.ogg",
})
SMODS.Sound({
	key = "hpfx_death3",
	path = "Isaac_dies_new_2.ogg",
})
SMODS.Sound({
    key = "hpfx_fall",
    path = "lich-fall.ogg",
})

--File Loading
mod_path = "" .. SMODS.current_mod.path
function load_folder(folder)
	files = NFS.getDirectoryItems(mod_path .. folder)
	for i, file in ipairs(files) do
		SMODS.load_file(folder .. "/" .. file)()
	end
end
SMODS.load_file('src/overrides.lua')()
--SMODS.load_file('Isaac/IsaacCenter.lua')()
SMODS.load_file('Ijiraq/RaqShack.lua')()
--SMODS.load_file('4Fun/FunZone.lua')()
SMODS.load_file('Stickers.lua')()


--Custom Colors
loc_colour('red')
G.ARGS.LOC_COLOURS['hpfx_IjiGray'] = HEX("BFD7D5")

--talisman conversion function
to_big = to_big or function(x) return x end

--Refactor Functions
function hpfx_chipGain(card, context)
	card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
end
function hpfx_isaacChip(card, context)
	SMODS.calculate_effect({
		chip_mod = card.ability.extra.chips,
		sound = "hpfx_thumbsup",
		colour = G.C.CHIPS,
		message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}
	}, card)
end
function hpfx_isaacMult(card, context)
    SMODS.calculate_effect({
        mult_mod = card.ability.extra.mult,
        sound = 'hpfx_1up',
        message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}
    }, card)
end
function counterIncrement(card, context)
    if context.main_eval and (to_big{card.ability.extra.mult, card.ability.extra.mult_gain} > to_big(1)) then
        card.ability.extra.c_rounds = card.ability.extra.c_rounds + 1 --otherwise adds 1 to the counter
    end
end
function stoneGeneration(card, context)
    local stone_card = create_playing_card(
        {center = G.P_CENTERS.m_stone},
        G.discard,
        true,
        false,
        nil,
        true
    )
    G.E_MANAGER:add_event(Event({
        func = function()
            stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
            G.play:emplace(stone_card)
            return true
        end
    }))
    return {
        message = localize('k_plus_stone'),
        colour = G.C.SECONDARY_SET.Enhanced,
        func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.deck.config.card_limit =
                    G.deck.config.card_limit + 1
                    return true
                end
            }))
            draw_card(G.play, G.deck, 90, 'up')
            SMODS.calculate_context(
            {
            playing_card_added = true,
            cards = { stone_card } })
        end
    }
end
function hpfx_Transform(card, context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function ()
            if card.config.center.blueprint_compat and card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                table.insert(G.GAME.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
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
	return true
end
function Card:Transfodd(context)
        G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function ()
            if self.config.center.blueprint_compat and self.config.center.key ~= 'j_hpfx_ijiraq' then
            local key = self.config.center.key
            for k, v in pairs(exceptions) do
                if key == v then
                    key = k
                end
            end
            table.insert(G.GAME.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            return true
        end,
    }))
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
            self.config.center = G.P_CENTERS['j_hpfx_ijiraq']
            self:set_ability(self.config.center,true)
            play_sound("card1")
            self:juice_up(0.3, 0.3)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self.isIjiraq = nil
            self.visiblyIjiraq = nil
            self:flip()
            return true
        end
    }))
	return true
end
function Hyperglobal.safe_set_ability(self, center)
    if not self or not center then return nil end
    local oldcenter = self.config.center
    G.GAME.hpfx_ijiraq_savedvalues = G.GAME.hpfx_ijiraq_savedvalues or {}
    G.GAME.hpfx_ijiraq_savedvalues[self.sort_id] = G.GAME.hpfx_ijiraq_savedvalues[self.sort_id] or {}
    G.GAME.hpfx_ijiraq_savedvalues[self.sort_id][oldcenter.key] = copy_table(self.ability)
    for k, v in pairs(G.GAME.hpfx_ijiraq_savedvalues[self.sort_id][center.key] or center.config) do
        if type(v) == 'table' then self.ability[k] = copy_table(v) else self.ability[k] = v
            if k == "Xmult" then self.ability.x_mult = v end
        end
    end
    self.ability.x_mult = center.config.Xmult or center.config.x_mult or 1
    self.ability.name = center.name
    self.ability.set = center.set
    self.ability.effect = center.effect
    self.config.center = center
    for k, v in pairs(G.P_CENTERS) do
        if center == v then self.config.center_key = k end
    end
    if self.ability.name == "Invisible Joker" then
        self.ability.invis_rounds = 0
    end
    if self.ability.name == 'To Do List' then
        local _poker_hands = {}
        for k, v in pairs(G.GAME.hands) do
            if v.visible then _poker_hands[#_poker_hands+1] = k end
        end
        local old_hand = self.ability.to_do_poker_hand
        self.ability.to_do_poker_hand = nil
        while not self.ability.to_do_poker_hand do
            self.ability.to_do_poker_hand = pseudorandom_element(_poker_hands, pseudoseed((self.area and self.area.config.type == 'title') and 'false_to_do' or 'to_do'))
            if self.ability.to_do_poker_hand == old_hand then self.ability.to_do_poker_hand = nil end
        end
    end
    if self.ability.name == 'Caino' then
        self.ability.caino_xmult = 1
    end
    if self.ability.name == 'Yorick' then
        self.ability.yorick_discards = self.ability.extra.discards
    end
    if self.ability.name == 'Loyalty Card' then
        self.ability.burnt_hand = 0
        self.ability.loyalty_remaining = self.ability.extra.every
    end
end

--Ownerships (not unlock)
SMODS.Consumable:take_ownership('c_wheel_of_fortune', {
    use = function(self, card, area, copier)
        local hpfx_testvar = G.GAME.probabilities.normal/(card.ability.extra*(next(SMODS.find_card('j_hpfx_farmer')) and 0.5 or 1))
        local used_tarot = copier or card
        local temp_pool = (card.ability.name == 'The Wheel of Fortune' and card.eligible_strength_jokers) or {}
        if pseudorandom('wheel_of_fortune') < hpfx_testvar then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function ()
				G.GAME.wheel_fails = 0
				SMODS.calculate_context{hpfx_chudhit = true}
                local over = false
                local eligible_card = pseudorandom_element(temp_pool, pseudoseed(
                    (card.ability.name == 'The Wheel of Fortune' and 'wheel_of_fortune')
                ))
                local edition = nil
                if card.ability.name == 'The Wheel of Fortune' then
                    edition = poll_edition('wheel_of_fortune', nil, true, true)
                end
                eligible_card:set_edition(edition, true)
                if card.ability.name == 'The Wheel of Fortune' then check_for_unlock({type = 'have_edition'}) end
                used_tarot:juice_up(0.3, 0.5)
            return true end}))
		else
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				G.GAME.wheel_fails = G.GAME.wheel_fails + 1
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3,
                    hold = 1.4,
                    major = used_tarot,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    used_tarot:juice_up(0.3, 0.5)
            return true end }))
        end
		if G.GAME.wheel_fails >= 2 then
			check_for_unlock({type = 'hpfx_nope'})
		end
    end,
}, true)
--Unlock Conditions
SMODS.Joker:take_ownership('oops', {
	add_to_deck = function(self, card, context)
		check_for_unlock({type = 'hpfx_oops'})
	end,
}, true)

G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = hpfx_crimsonCount or 0
G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = hpfx_devilCount or 0



--Config
local config = SMODS.current_mod.config
--[[ SMODS.current_mod.config_tab = function ()
	return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 4}, nodes = {
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, hover = true, ref_table = Hyperglobal.config, ref_value = "Isaac" },
			}},
			{n = G.UIT.C, config = {align = "c", padding = 0 }, nodes = {
				{n = G.UIT.T, config = {text = localize('hpfx_isaac_option'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
				create_toggle{col = true, label = "", scale = 0.85, w = 0, shadow = true, hover = true, ref_table = Hyperglobal.config, ref_value = "Ijiraq" },
			}},
			{n = G.UIT.C, config = {align = "c", padding = 0}, nodes = {
				{n = G.UIT.T, config = {text = localize('hpfx_ijiraq_option'), scale = 0.45, colour = G.C.RED}},
			}},
		}},
		{n = G.UIT.R, config = {align = "bm", padding = 0}, nodes = {
			{n=G.UIT.C, config={button = "hpfx_save_and_apply", hover = true, colour = HEX("FCB3EA"), minw = 4, minh = 1, align = "cm", r = 0.1}, nodes={
				{n=G.UIT.T, config={text = "Save", scale = 0.44, colour = G.C.UI.TEXT_LIGHT, align = "cm"}},
			}}
		}}
	}}
end ]]
SMODS.current_mod.optional_features = function()
	return {
		post_trigger = true,
		retrigger_joker = true,
		quantum_enhancements = true,
		cardareas = {
			discard = true,
			deck = true
		}
	}
end
--[[ G.FUNCS.hpfx_save_and_apply = function()
    G.ACTIVE_MOD_UI = nil
    SMODS.save_all_config()
    SMODS.IN_MODS_TAB = nil
end ]]

--Quips
hpfx_eternal_jimbo = Card_Character.add_speech_bubble
hpfx_jEternal = hpfx_jEternal or false
Card_Character.add_speech_bubble = function (self, arg1, arg2, arg3)
	for _, v in ipairs(SMODS.find_card('j_joker')) do
		if v.ability.eternal then hpfx_jEternal = true break
		else hpfx_jEternal = false
		end
	end
	if hpfx_jEternal then
	hpfx_eternal_jimbo(self, 'hpfx_eternal_jimbo' .. pseudorandom("ejimbo", 1, 2), nil, {quip = true})
	else
	hpfx_eternal_jimbo(self, arg1, arg2, arg3)
	end
end

--tables
exceptions = {
    j_misprint = 'j_hpfx_reprint',
    j_raised_fist = 'j_hpfx_braised',
    j_mystic_summit = 'j_hpfx_twistit',
    j_loyalty_card = 'j_hpfx_redeemed',
    j_steel_joker = 'j_hpfx_iron',
    j_acrobat = 'j_hpfx_trapezoid',
    j_banner = 'j_hpfx_flag',
    j_merry_andy = 'j_hpfx_scaryandy',
    j_troubadour = 'j_hpfx_bard',
    j_hack = 'j_hpfx_whack',
    j_marble = 'j_hpfx_porcelain',
    j_golden = 'j_hpfx_pyramid',
    j_credit_card = 'j_hpfx_expired',
    j_blueprint = 'j_hpfx_bluebell',
    j_chaos = 'j_hpfx_chaoz',
    j_juggler = 'j_hpfx_jiggler',
    j_drunkard = 'j_hpfx_scrumpy',
    j_glass = 'j_hpfx_fiberglass',
    j_abstract = 'j_hpfx_pomni',
    j_delayed_grat = 'j_hpfx_belated_grat',
    j_ticket = 'j_hpfx_tocket',
    j_pareidolia = 'j_hpfx_apophenia',
    j_cartomancer = 'j_hpfx_not_fortune_teller',
    j_even_steven = 'j_hpfx_odd_steven',
    j_odd_todd = 'j_hpfx_even_todd',
    j_scholar = 'j_hpfx_flunkie',
    j_mr_bones = 'j_hpfx_ribtickler'
}

--debug
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
function toma_debug_porcelaintest(context, card)
    for _, card in ipairs(G.playing_cards) do
        card:set_ability(G.P_CENTERS.m_stone)
    end
end