SMODS.Joker{
    key = 'chud',
    rarity = 1,
    --atlas = 'LoveofTheGameJokers',
    pos = {x = 0, y = 0},
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = {extra = {
        xmult = 2,
        xmult_gain = 10,
    }},
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.extra.xmult_gain,
            }
        }
    end,
    add_to_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v/10
        end
    end,
    check_for_unlock = function(self, args)
        if args.type == 'hpfx_chud' then
            unlock_card(self)
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main and
           (to_big(card.ability.extra.xmult) > to_big(1)) then
            return {
                SMODS.calculate_effect({
                    mult_mod = card.ability.extra.xmult,
                    message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.xmult}}
                }, card),
            }
        end

    end,
}

local chudlast = 0
local chudnow = G.GAME.chudhit
function G.GAME.chudhit(...)
    local chudhitnow = chudnow(...)
    if to_big(chudhitnow) > to_big(chudlast) then
        SMODS.calculate_context({
            chudxmult = card.ability.extra.xmult * card.ability.extra.xmult_gain
        })
    end
    chudlast = chudhitnow
    return chudhitnow
end

local raw_G_FUNCS_evaluate_play = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(...)
    raw_G_FUNCS_evaluate_play(...)
    chudlast = 0
end