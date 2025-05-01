assert(SMODS.load_file('Isaac/Jokers/Moriah.lua'))()
assert(SMODS.load_file('Isaac/Jokers/Mary.lua'))()
assert(SMODS.load_file('Isaac/Jokers/Farmer.lua'))()
assert(SMODS.load_file('Isaac/Jokers/Iscariot.lua'))()

--[[ SMODS.Joker{ --Cyanosis/Blue Baby
    key = 'cyanosis',
    config = {
        extra = {
            chips = 0
        }
    },
    rarity = 1,
    atlas = 'IsaacJokers',
    pos = {x = 4, y = 1},
    cost = -1,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.chips
        }}
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            return{
                chips = card.ability.extra.chips,
            card = card
            }
        end
        if context.hyperfixation_mod_mult_decrease and (to_big(card.ability.extra.chips) > to_big(1)) and not context.blueprint_card then
            card.ability.extra.chips = card.ability.extra.chips + (context.hyperfixation_mod_mult_decrease * 10)
            return{
                message = 'Soul...',
                colour = G.C.CHIPS,
                card = card
            }
        end
    end
} ]]

--mult-decrease scoring context designed by BakersDozenBagels below!
--[[ local last_mult = 0
local raw_mod_mult = mod_mult ]]
-- mod_mult is used after any mult change to apply effects like Rich Get Richer
--[[ function mod_mult(...)
    local new_mult = raw_mod_mult(...)
    if to_big(new_mult) < to_big(last_mult) then
        for i = 1, #G.jokers.cards do
            if G.jokers.cards[i].config.center_key == 'j_hpfx_cyanosis' then
                G.jokers.cards[i]:calculate_joker({
                    hyperfixation_mod_mult_decrease = last_mult - new_mult,
                })
            end          
        end
    end
    last_mult = new_mult
    return new_mult
end ]]

-- Reset our tracker at the end of the round so we don't see a fake decrease
--[[ local raw_G_FUNCS_evaluate_play = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(...)
    raw_G_FUNCS_evaluate_play(...)
    last_mult = 0
end ]]