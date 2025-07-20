SMODS.Joker {
    key = 'moriah',
    rarity = 2,
    atlas = 'IsaacJokers',
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
        local bonus = card.ability.extra.money
        if bonus > 0 then return bonus end
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            (to_big(card.ability.extra.chips) > to_big(1)) and
            (to_big(card.ability.extra.mult) > to_big(1)) then
            return {
                func = function()
                    hpfx_isaacChip(card, context)
                end,
                extra = {
                    func = function()
                        hpfx_isaacMult(card, context)
                    end
                },
            }
        end
    end
    --[[     in_pool = function (self, args)
        return Hyperglobal.config.Isaac
    end, ]]
}
