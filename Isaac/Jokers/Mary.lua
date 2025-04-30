SMODS.Joker{
    key = 'mary',
    config = {extra = {
        mult = 8, 
        mult_gain = 2, 
        rounds = 3, 
        c_rounds = 0
    }},
    rarity = 1,
    atlas = 'IsaacJokers',
    pos = {x = 1, y = 0},
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function (self, info_queue, card)    
        return{vars = {card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.rounds, card.ability.extra.c_rounds}}
    end,
    calculate = function (self, card, context)
        return maryMain(card, context) or maryEnd(card, context)
    end
}