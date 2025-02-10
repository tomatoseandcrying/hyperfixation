SMODS.Atlas{
    key = 'Hyperfixation',
    path = "IsaacJokers.png",
    px = 71,
    py = 95
}

SMODS.Joker{ --Moriah/Isaac
    key = 'moriah',
    loc_txt = {
        name = 'Moriah',
        text = {
            "{C:chips}+#1#{} Chips",
            "and {C:mult}+#2#{} Mult",
            "Earn {C:money}$#3#{} at",
            "end of the round"
        }
      },
    config = {extra = {chips = 22, mult = 2, money = 1}},
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.money}}
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        if bonus > 0 then return bonus end
    end,
    rarity = 2,
    atlas = 'Hyperfixation',
    pos = {x = 0, y = 0},
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and (to_big{card.ability.extra.chips, card.ability.extra.mult} > to_big(1)) then
            SMODS.calculate_effect(context.blueprint_card or card, {
            } )
            return{
                chips = card.ability.extra.chips,
                mult = card.ability.extra.mult,
            card = card
            }
        end
    end
}

SMODS.Joker{ --Mary/Magdalene
    key = 'mary',
    loc_txt = {
        name = 'Mary',
        text = {
            "{C:mult}+#1#{} Mult in {C:attention}final",
            "{C:attention}hand{} of round",
            "Gains {C:mult}+#2#{} Mult",
            "every {C:attention}#3#{} rounds",
            "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
        }
    },
    config = {extra = {mult = 8, mult_gain = 2, rounds = 3, c_rounds = 0}},
    rarity = 1,
    atlas = 'Hyperfixation',
    pos = {x = 1, y = 0},
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.mult, card.ability.extra.mult_gain, card.ability.extra.rounds, card.ability.extra.c_rounds}}
    end,
    calculate = function (self, card, context)
        if context.joker_main and G.GAME.current_round.hands_left == 0 and (to_big(card.ability.extra.mult) > to_big(1)) then
          return{
            mult_mod = card.ability.extra.mult,
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult} }
          }
        elseif context.end_of_round then
            if context.main_eval and (to_big{card.ability.extra.mult, card.ability.extra.mult_gain} > to_big(1)) then
                if not context.blueprint_card then
                    if card.ability.extra.c_rounds >= card.ability.extra.rounds then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                        card.ability.extra.c_rounds = 0
                        return {
                            message = 'Yum!',
                            colour = G.C.MULT,
                            card = card
                        }
                        
                    else
                        card.ability.extra.c_rounds = card.ability.extra.c_rounds + 1
                    end
                end
            end
        end
    end
}

SMODS.Joker{ --Farmer/Cain
    key = 'farmer',
    loc_txt = {
        name = 'Farmer',
        text = {
            "{C:attention}+#1#{} Joker slot",
            "{C:attention}+#1#{} card selection limit"
            ---"Doubles the properties of {C:purple}Wheel of Fortune{}"
        }
    },
    config = {extra = 1},
    unlocked = false,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra}
        }
    end,
    rarity = 3,
    atlas = 'Hyperfixation',
    pos = {x = 4, y = 1},
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra = math.floor(card.ability.extra)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra
        if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
    end
}


SMODS.Joker{ --Cyanosis/Blue Baby
    key = 'cyanosis',
    loc_txt = {
        name = 'Cyanosis',
        text = {
            "Each time you lose scoring {C:mult}Mult{}, this",
            "Joker gains {X:chips, C:white}X10{} that amount of {C:chips}Chips{}",
            "{s:0.7}I hate the Flint{}",
            "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}"
        }
    },
    config = {
        extra = {
            chips = 0
        }
    },
    rarity = 1,
    atlas = 'Hyperfixation',
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
        if context.hyperfixation_mod_mult_decrease and not context.blueprint_card then
            card.ability.extra.chips = card.ability.extra.chips + (context.hyperfixation_mod_mult_decrease*10)
            return{
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
    if new_mult < last_mult then
        for i = 1, #G.jokers.cards do
            G.jokers.cards[i]:calculate_joker({
               hyperfixation_mod_mult_decrease = last_mult - new_mult,
            })
        end
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