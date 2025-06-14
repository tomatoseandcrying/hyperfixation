G.C.hpfx_IjiGray = HEX('BFD7D5')     
SMODS.Joker{ --Acrobat? 
key = 'trapezoid',
atlas = 'IjiraqJokers',
pos = {x = 2, y = 1},
no_mod_badges = true,
config = {
    extra = {
        x_mult = 3
    }
},
unlocked = true,
discovered = true,
no_collection = true,
loc_vars = function (self, info_queue, card)
    return{vars = {
        card.ability.extra.x_mult, 
        card.area and card.area == G.jokers and "...?" or ""
    }
}
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
calculate = function(self, card, context)
    if context.after and G.GAME.current_round.hands_left == 1 then
        return{
            func = function()
                hpfx_Transform(card, context)
            end,
        }
    end
end
}