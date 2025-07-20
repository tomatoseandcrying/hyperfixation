SMODS.Joker { --Cyanosis/Blue Baby
    key = 'cyanosis',
    config = { extra = { chips = 0 } },
    rarity = 1,
    atlas = 'IsaacJokers',
    pos = { x = 4, y = 0 },
    cost = -1,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_chud'
    end,
    remove_from_deck = function(self, card, from_debuff)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            (to_big(card.ability.extra.chips) > to_big(1)) then
            return {
                func = function()
                    hpfx_isaacChip(card, context)
                end
            }
        end
        if context.hyperfixation_mod_mult_decrease and
            not context.blueprint_card then
            card.ability.extra.chips = card.ability.extra.chips +
                (context.hyperfixation_mod_mult_decrease * 10)
            return {
                message = 'Soul...',
                colour = G.C.CHIPS,
                card = card
            }
        end
    end
}

--mult-decrease scoring context designed by BakersDozenBagels below!
local last_mult = 0
local raw_mod_mult = mod_mult
-- mod_mult is used after any mult change to apply effects like Rich Get Richer
function mod_mult(...)
    local new_mult = raw_mod_mult(...)
    if to_big(new_mult) < to_big(last_mult) and next(SMODS.find_card('j_hpfx_cyanosis')) then
        SMODS.calculate_context({
            hyperfixation_mod_mult_decrease = last_mult - new_mult
        })
    end
    last_mult = new_mult
    return new_mult
end

-- Reset our tracker at the end of the round so we don't see a fake decrease
local raw_G_FUNCS_evaluate_play = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(...)
    raw_G_FUNCS_evaluate_play(...)
    last_mult = 0
end
