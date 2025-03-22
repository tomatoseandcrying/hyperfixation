SMODS.Atlas{
    key = 'IjiraqJokers',
    path = "IjiraqJokers.png",
    px = 71,
    py = 95
}


--Flat Mult Jokers

SMODS.Joker{ --Joker?
    key = 'choker',
    pos = {x = 0, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 4}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_choker", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_choker_alt"
    end,
    rarity = 1,
    cost = 2,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

--Conditional Mult Jokers

SMODS.Joker{--Jolly Joker?
    key = 'jaunty',
    pos = {x = 2, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 8}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_jaunty", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_jaunty_alt"
    end,
    rarity = 1,
    cost = 3,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Pair']) and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker{--Zany Joker?
    key = 'saney',
    pos = {x = 3, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 12}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_saney", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_saney_alt"
    end,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Three of a Kind']) and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker{--Mad Joker?
    key = 'angry',
    pos = {x = 4, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 10}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_angry", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_angry_alt"
    end,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Two Pair']) and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker{--Crazy Joker?
    key = 'homer',
    pos = {x = 5, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 12}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_homer", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_homer_alt"
    end,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Straight']) and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker{--Droll Joker?
    key = 'lockbird',
    pos = {x = 6, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 10}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_lockbird", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_lockbird_alt"
    end,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and next(context.poker_hands['Flush']) and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker{--Half Joker?
    key = 'otherhalf',
    pos = {x = 7, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {mult = 20, size = 3}
    },
    pixel_size = {w = 71, h = 95/1.7},
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.ability.extra.size, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_otherhalf", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_otherhalf_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and #context.full_hand <= card.ability.extra.size and to_big(card.ability.extra.mult) > to_big(1) then
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
            return{
                mult = card.ability.extra.mult,
            }
        end
    end
}

SMODS.Joker{ --Acrobat?
key = 'trapezoid',
atlas = 'IjiraqJokers',
pos = {x = 2, y = 1},
no_mod_badges = true,
config = {
    extra = {x_mult = 3}
},
unlocked = true,
discovered = true,
--no_collection = true,
loc_vars = function (self, info_queue, card)
    return{vars = {card.ability.extra.x_mult, card.area and card.area == G.jokers and "...?" or ""}}
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
end
}


--Flat Chip Jokers

--nothing yet


--Conditional Chip Jokers

SMODS.Joker{ --Stone Joker? when i figure it out
    key = 'rocky',
    pos = {x = 9, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {chips = 25}
    },
    loc_vars = function(self, info_queue, card)
        local stone_tally = 0
        for k, v in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, 'm_stone') then stone_tally = stone_tally + 1 end
        end
        return { vars = { card.ability.extra.chips, card.ability.extra.chips * (stone_tally or 0), card.area and card.area == G.jokers and "...?" or "" } }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_rocky", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_rocky_alt"
    end,
    rarity = 1,
    cost = 2,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.extra.chips) > to_big(1) then
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
            local stone_tally = 0
            for k, v in pairs(G.playing_cards or {}) do
                if SMODS.has_enhancement(v, 'm_stone') then stone_tally = stone_tally + 1 end
            end
            return{
                chips = (card.ability.extra.chips * stone_tally),
            }
        end
    end
}


--Hand n' Discard Jokers

SMODS.Joker{--Merry Andy?
    key = 'scaryandy',
    pos = {x = 8, y = 0},
    no_mod_badges = true,
    unlocked = true, --Set FALSE on release!!
    discovered = true,
    --no_collection = true,
    config = {
        extra = {discard_size = 3, hand_size = -1}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.discard_size, card.ability.extra.hand_size, card.area and card.area == G.jokers and "...?" or ""}}
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
    end
}

SMODS.Joker{ --Juggler?
    key = 'jiggler',
    atlas = 'IjiraqJokers',
    pos = {x = 0, y = 1},
    no_mod_badges = true,
    config = {
        extra = {hand_size = 1}
    },
    unlocked = true,
    discovered = true,
    --no_collection = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.hand_size, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_jiggler", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_jiggler_alt"
        G.hand:change_size(card.ability.extra.hand_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.hand_size)
    end,
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.after then
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
    end
}

SMODS.Joker{ --Drunkard?
    key = 'bubbly',
    atlas = 'IjiraqJokers',
    pos = {x = 1, y = 1},
    no_mod_badges = true,
    config = {
        extra = {discard_size = 1}
    },
    unlocked = true,
    discovered = true,
    --no_collection = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.discard_size, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_bubbly", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_bubbly_alt"
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
    end,
    rarity = 1,
    cost = 4,
    blueprint_compat = false,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.discard then
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
    end
}


--Retrigger Jokers

SMODS.Joker{ --Sock and Buskin?
    key = 'bustin',
    atlas = 'IjiraqJokers',
    pos = {x = 3, y = 1},
    no_mod_badges = true,
    config = {
        extra = {repetitions = 1}
    },
    unlocked = true,
    discovered = true,
    --no_collection = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.repetitions, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_bustin", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_bustin_alt"
    end,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.repetition then
            if context.other_card then
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
                return{
                    message = localize('k_again_ex'),
                    repetitions = card.ability.extra.repetitions,
                    card = self
                }
            end
        end
    end
}

SMODS.Joker{ --Mime?
    key = 'mute',
    atlas = 'IjiraqJokers',
    pos = {x = 4, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {repetitions = 1}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.repetitions, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_mute", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_mute_alt"
    end,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.repetition then
            if context.cardarea == G.hand then
                if next(context.card_effects[1]) or #context.card_effects > 1 then
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
                    return{
                        message = localize('k_again_ex'),
                        repetitions = card.ability.extra.repetitions,
                        card = self
                    }
                end
            end
        end
    end
}


--Shop Jokers

SMODS.Joker{ --Chaos the Clown?
    key = 'chaoz',
    pos = {x = 1, y = 0},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {reroll = 1}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.reroll, card.area and card.area == G.jokers and "...?" or ""}}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_chaoz", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_chaoz_alt"
        SMODS.change_free_rerolls(1)
    end,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function (self, card, context)
        if context.reroll_shop and to_big(card.ability.extra.reroll) > to_big(1) then
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
    end
}

SMODS.Joker{ --Credit Card?
    key = 'expired',
    pos = {x = 5, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {credit = 20}
    },
    loc_vars = function (self, info_queue, card)
        local valueToPutInIf = Talisman and to_big and to_big(G.GAME.dollars):lte(0) or G.GAME.dollars <= to_big(0)
        return{vars = {card.ability.extra.credit, card.area and card.area == G.jokers and "...?" or ""}}
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
    end
}


--Ijiraq. Just Ijiraq.

SMODS.Joker{ --Ijiraq
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
    perishable_compat = false
}