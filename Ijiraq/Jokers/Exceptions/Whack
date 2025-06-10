G.C.IjiGray = HEX('BFD7D5')    
SMODS.Joker{ --Hack? 
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