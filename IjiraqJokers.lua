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
        return{vars = {
            card.ability.extra.mult, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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

--Conditional Flat Mult Jokers

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
        return{vars = {
            card.ability.extra.mult, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
            card.ability.extra.mult, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
            card.ability.extra.mult, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
            card.ability.extra.mult, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
            card.ability.extra.mult, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
        card.ability.extra.mult, 
        card.ability.extra.size, 
        card.area and card.area == G.jokers and "...?" or ""
    }}
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

SMODS.Joker{--Greedy Joker? thanks to misenrol for the tweaks! notes app at 3:00 am
    key = 'keepah',
    pos = {x = 6, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    -- no_collection = true,
    config = {
        extra = {mult = 3, suit = 'Diamonds'},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                localize(card.ability.extra.suit, 'suits_singular'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_keepah",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_keepah_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then        
                return {
                    mult = card.ability.extra.mult,
                    card = card
                } 
            end
        end
        if context.after and context.cardarea == G.jokers then
            local suitFound = false
            for _, v in ipairs(context.scoring_hand) do
                if v:is_suit(card.ability.extra.suit) then
                    suitFound = true
                    break
                end
            end
            if suitFound then
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
    end
}

SMODS.Joker{--Lusty Joker?
    key = 'lustful',
    pos = {x = 7, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    -- no_collection = true,
    config = {
        extra = {mult = 3, suit = 'Hearts'},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                localize(card.ability.extra.suit, 'suits_singular'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_lustful",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_lustful_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then        
                return {
                    mult = card.ability.extra.mult,
                    card = card
                } 
            end
        end
        if context.after and context.cardarea == G.jokers then
            local suitFound = false
            for _, v in ipairs(context.scoring_hand) do
                if v:is_suit(card.ability.extra.suit) then
                    suitFound = true
                    break
                end
            end
            if suitFound then
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
    end
}

SMODS.Joker{--Wrathful Joker?
    key = 'rathalos',
    pos = {x = 8, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    -- no_collection = true,
    config = {
        extra = {mult = 3, suit = 'Spades'},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                localize(card.ability.extra.suit, 'suits_singular'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_rathalos",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_rathalos_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then        
                return {
                    mult = card.ability.extra.mult,
                    card = card
                } 
            end
        end
        if context.after and context.cardarea == G.jokers then
            local suitFound = false
            for _, v in ipairs(context.scoring_hand) do
                if v:is_suit(card.ability.extra.suit) then
                    suitFound = true
                    break
                end
            end
            if suitFound then
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
    end
}

SMODS.Joker{--Gluttonous Joker?
    key = 'hungry',
    pos = {x = 9, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    -- no_collection = true,
    config = {
        extra = {mult = 3, suit = 'Clubs'},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                localize(card.ability.extra.suit, 'suits_singular'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_hungry",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_hungry_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:is_suit(card.ability.extra.suit) then        
                return {
                    mult = card.ability.extra.mult,
                    card = card
                } 
            end
        end
        if context.after and context.cardarea == G.jokers then
            local suitFound = false
            for _, v in ipairs(context.scoring_hand) do
                if v:is_suit(card.ability.extra.suit) then
                    suitFound = true
                    break
                end
            end
            if suitFound then
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
    end
}

SMODS.Joker{--Mystic Summit?
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

--XMult Jokers

SMODS.Joker{--Loyalty Card?
key = 'redeemed',
pos = {x = 4, y = 2},
no_mod_badges = true,
unlocked = true,
discovered = true,
--no_collection = true,
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
    if context.joker_main then
        card.ability.loyalty_remaining = (card.ability.extra.every - 1)
        if context.blueprint then
            if card.ability.loyalty_remaining == card.ability.extra.every then
                return {
                    x_mult = card.ability.extra.x_mult
                } 
            end
        else
            if card.ability.loyalty_remaining == 0 then
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
                return {
                    x_mult = 1/card.ability.extra.x_mult
                }
            end
        end
    end
end
}
--Conditional XMult Jokers

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

--Conditional Chip Jokers

SMODS.Joker{ --Stone Joker?
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
        return { vars = {
             card.ability.extra.chips, 
             card.ability.extra.chips * (stone_tally or 0), 
             card.area and card.area == G.jokers and "...?" or "" 
            } }
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

SMODS.Joker{--Banner?
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
            return{
                chips = -(card.ability.extra.chips*G.GAME.current_round.discards_left),
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
        return{vars = {
            card.ability.extra.hand_size, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
            card.ability.extra.discard_size, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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

SMODS.Joker{ --Troubadour?
    key = 'bard',
    atlas = 'IjiraqJokers',
    pos = {x = 0, y = 2},
    no_mod_badges = true,
    config = {
        extra = {hand_size = 2, hand_plays = -1}
    },
    unlocked = true,
    discovered = true,
    --no_collection = true,
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
        return{vars = {
            card.ability.extra.repetitions, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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
        return{vars = {
            card.ability.extra.repetitions, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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

--Enhancement Jokers

SMODS.Joker{ --Marble Joker?
    key = 'porcelain',
    atlas = 'IjiraqJokers',
    pos = {x = 3, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
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
        if context.setting_blind and not card.getting_sliced then
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
        if context.hand_drawn then
            for _, card in ipairs(G.playing_cards) do
                card:set_ability(G.P_CENTERS.c_base)
            end
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
        return{vars = {
            card.ability.extra.reroll, 
            card.area and card.area == G.jokers and "...?" or ""
        }}
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