SMODS.Atlas{
    key = 'IjiraqJokers',
    path = "IjiraqJokers.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'ijiraq',
    pos = {x = 4, y = 12},
    no_mod_badges = false,
    unlocked = true,
    discovered = false,
    rarity = 4,
    cost = 8,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true
}

SMODS.Joker{
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
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.extra.mult) > to_big(1) then
            return{
                mult = card.ability.extra.mult,
                func = function()
                    card:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
                end
            }
        end
    end,
}