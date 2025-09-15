SMODS.Joker {
    key = 'chud',
    rarity = 2,
    atlas = 'Jokers4Fun',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = {
        xmult = 2,
        xmult_gain = 10,
    } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_chud'
    end,
    calculate = function(self, card, context)
        if context.mod_probability and not context.blueprint then
            return { denominator = context.denominator * 10 }
        end
        if context.pseudorandom_result and context.result and context.main_eval and not context.blueprint then
            card.ability.extra.xmult = card.ability.extra.xmult * card.ability.extra.xmult_gain
            return { message = localize('k_upgrade_ex'), colour = G.C.MULT, message_card = card }
        end
        if context.joker_main and (to_big(card.ability.extra.xmult) > to_big(1)) then
            return { x_mult = card.ability.extra.xmult }
        end
    end
}
