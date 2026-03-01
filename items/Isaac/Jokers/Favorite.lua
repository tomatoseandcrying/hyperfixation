SMODS.Joker {
    key = 'favorite',
    rarity = 2,
    atlas = "IsaacJokers",
    pos = { x = 4, y = 1 },
    hpfx_old_art_pos = { x = 4, y = 3 },
    cost = 5,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = { extra = {
        mult = 3,
        xmult = 0.75
    } },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.xmult
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == "hpfx_nomultjoker"
    end,
    remove_from_deck = function(self, card, from_debuff)
        play_sound((("hpfx_death") .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            (to_big(card.ability.extra.mult) > to_big(1)) and
            (to_big(card.ability.extra.xmult) > to_big(0)) then
            return {
                mult_mod = card.ability.extra.mult,
                sound = "hpfx_1up",
                colour = G.C.MULT,
                message = localize { type = "variable", key = "a_mult", vars = { card.ability.extra.mult } },
                extra = {
                    xmult_mod = card.ability.extra.xmult,
                    sound = "hpfx_1up",
                    message = localize { type = "variable", key = "a_xmult", vars = { card.ability.extra.xmult } }
                },
            }
        end
    end
}
