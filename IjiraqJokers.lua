SMODS.Atlas{
    key = 'IjiraqJokers',
    path = "IjiraqJokers.png",
    px = 71,
    py = 95
}

SMODS.Joker{
    key = 'Choker',
    pos = {x = 0,y = 0},
    config = {
        unlocked = true,
        discovered = true,
        no_collection = true,
        {extra = {mult = 4}}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult}}
    end,
    rarity = 1,
    cost = 2,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.extra.mult) > to_big(1) then
            return{
                mult = card.ability.extra.mult
            }
        end
    end
}