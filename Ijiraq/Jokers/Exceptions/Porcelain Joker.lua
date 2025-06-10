G.C.IjiGray = HEX('BFD7D5') 
SMODS.Joker{ --Marble Joker? 
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