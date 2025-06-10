G.C.IjiGray = HEX('BFD7D5')      
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