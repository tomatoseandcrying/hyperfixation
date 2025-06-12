G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{--Loyalty Card? 
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