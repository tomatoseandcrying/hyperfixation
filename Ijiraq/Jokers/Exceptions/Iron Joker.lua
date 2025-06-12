G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{--Steel Joker?
key = 'iron',
pos = {x = 7, y = 2},
no_mod_badges = true,
unlocked = true,
discovered = true,
no_collection = true,
config = {
    extra = {x_mult = 0.2}
},
loc_vars = function (self, info_queue, card)
    info_queue[#info_queue+1] = G.P_CENTERS.m_steel
    local steel_tally = 0
    if G.playing_cards then
        for _, playing_card in pairs(G.playing_cards) do
            if SMODS.has_enhancement(playing_card, 'm_steel') then
                steel_tally = steel_tally + 1 end
        end
    end
    return{vars =
    {
        card.ability.extra.x_mult,
        1 - card.ability.extra.x_mult * steel_tally,
        card.area and card.area == G.jokers and "...?" or ""
    }
}
end,
generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    full_UI_table.name = localize {
        type = 'name',
        set = "Joker",
        key = card.ability and card.ability.extra.new_key or "j_hpfx_iron",
        nodes = {}
    }
    SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
end,
add_to_deck = function(self, card, from_debuff)
    card.ability.extra.new_key = "j_hpfx_iron_alt"
end,
rarity = 2,
cost = 7,
atlas = 'IjiraqJokers',
blueprint_compat = true,
calculate = function(self, card, context)
    if context.joker_main and
    to_big(card.ability.extra.x_mult) > to_big(0) then
        local steel_tally = 0
        for k, v in pairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(v, 'm_steel') then steel_tally = steel_tally + 1 end
        end
        if 1 - card.ability.extra.x_mult * steel_tally <= 0 then
            return {
                func = function ()
                hpfx_Transform(card, context)
                end
            }
        else
            return{
            x_mult = 1 - card.ability.extra.x_mult * steel_tally
            }
        end
    end
end,
in_pool = function(self, args)
    for _, playing_card in ipairs(G.playing_cards or {}) do
        if SMODS.has_enhancement(playing_card, 'm_steel') then
            return true
        end
    end
    return false
end
}