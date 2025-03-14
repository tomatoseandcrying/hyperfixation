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
        if context.reroll_shop then
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
        if context.joker_main and next(context.poker_hands['Pair']) then
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
        if context.joker_main and next(context.poker_hands['Three of a Kind']) then
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
        if context.joker_main and next(context.poker_hands['Two Pair']) then
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
        if context.joker_main and next(context.poker_hands['Straight']) then
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
        if context.joker_main and next(context.poker_hands['Flush']) then
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
        if context.joker_main and #context.full_hand <= card.ability.extra.size then
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

--Conditional Chip Jokers


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