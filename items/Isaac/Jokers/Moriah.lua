SMODS.Joker {
    key = 'moriah',
    rarity = 2,
    atlas = Hyperfixation.current_mod.config.rebirth and 'IsaacJokers' or 'OldIsaacJokers',
    pos = { x = 0, y = 0 },
    cost = 6,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = {
        chips = 22,
        mult = 2,
        money = 1
    } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.ability.extra.mult,
                card.ability.extra.money
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_oops'
    end,
    remove_from_deck = function(self, card, from_debuff)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calc_dollar_bonus = function(self, card)
        return card.ability.extra.money
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            (to_big(card.ability.extra.chips) > to_big(1)) and
            (to_big(card.ability.extra.mult) > to_big(1)) then
            return {
                chip_mod = card.ability.extra.chips,
                sound = "hpfx_thumbsup",
                colour = G.C.CHIPS,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } },
                extra = {
                    mult_mod = card.ability.extra.mult,
                    sound = 'hpfx_1up',
                    message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
                },
            }
        end
    end

}
