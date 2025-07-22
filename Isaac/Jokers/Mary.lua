SMODS.Joker {
    key = 'mary',
    rarity = 1,
    atlas = 'IsaacJokers',
    pos = { x = 1, y = 0 },
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = {
        mult = 8,
        mult_gain = 2,
        rounds = 4,
        c_rounds = 0
    } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult_gain,
                card.ability.extra.rounds,
                card.ability.extra.c_rounds
            }
        }
    end,
    check_for_unlock = function(self, args)
        return (args.type == 'hpfx_7mult' and to_big(args.mult) >= to_big(7))
    end,
    remove_from_deck = function(self, card, from_debuff)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            G.GAME.current_round.hands_left == 0 and
            (to_big(card.ability.extra.mult) > to_big(1)) then
            return {
                func = function()
                    hpfx_isaacMult(card, context)
                end
            }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            if (to_big(card.ability.extra.mult) > to_big(1)) and (to_big(card.ability.extra.mult_gain) > to_big(1)) then
                card.ability.extra.c_rounds = card.ability.extra.c_rounds + 1
            end
            if card.ability.extra.c_rounds == card.ability.extra.rounds then
                card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                card.ability.extra.c_rounds = 0
                return {
                    message = 'Yum!',
                    sound = "hpfx_gulp",
                    colour = G.C.MULT,
                    card = card,
                }
            end
            print(card.ability.extra.c_rounds, card.ability.extra.rounds)
            if card.ability.extra.rounds - 1 == card.ability.extra.c_rounds then
                local eval = function(card) return card.ability.extra.c_rounds ~= 0 end
                juice_card_until(card, eval, true)
            end
        end
    end
    --[[     in_pool = function (self, args)
        return Hyperglobal.config.Isaac
    end, ]]

}
