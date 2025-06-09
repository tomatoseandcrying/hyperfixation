SMODS.Joker{
    key = 'chud',
    rarity = 2,
    --atlas = 'Jokers4Fun',
    pos = {x = 0, y = 0},
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {extra = {
        xmult = 2,
        xmult_gain = math.sqrt(10),
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
            G.GAME.probabilities[k] = v--/10
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v
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
                Xmult = card.ability.extra.xmult,
            }
        end
        if context.chudhit and context.main_eval then
            G.E_MANAGER:add_event(Event({trigger = 'immediate', delay = 0.4, func = function ()
                card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.xmult_gain
                SMODS.calculate_effect({message = localize{
                type = 'variable',
                key = 'a_xmult',
                vars = {card.ability.extra.xmult}},
                colour = G.C.MULT}, card)
                return true
            end
            }))
        end
        if context.individual then
            if context.other_card.lucky_trigger
            and not context.blueprint then
            SMODS.calculate_context{chudhit = true}
            end
        end
    end,
}