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
        return{
        vars = {
            card.ability.extra.mult, 
            card.ability.extra.mult_gain, 
            card.ability.extra.rounds, 
            card.ability.extra.c_rounds
        }}
    end,
    remove_from_deck = function (self, card, from_debuff)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function (self, card, context)
        if context.joker_main and 
        G.GAME.current_round.hands_left == 0 and 
        (to_big(card.ability.extra.mult) > to_big(1)) then --gives mult
            isaacMult(card, context) --mult scoring function
        end
        if context.end_of_round then --triggers at end of round
            counterIncrement(card, context) --increments the counter
            if not context.blueprint_card and 
            card.ability.extra.c_rounds >= card.ability.extra.rounds then  -- gains mult only if the req rounds
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                card.ability.extra.c_rounds = 0 --resets counter
                return { --custom message (for flavor <3)
                    message = 'Yum!',
                    sound = "hpfx_gulp",
                    colour = G.C.MULT
                }
            end
        end
    end
}