SMODS.Atlas{
    key = 'Hyperfixation',
    path = "IsaacJokers.png",
    px = 71,
    py = 95
}
--SMODS.Sound({
    --key = "hpfx_1up",
    --path = "1up.ogg"
--})
--SMODS.Sound({
    --key = "hpfx_thumbsup",
    --path = "thumbsup.ogg",
    --pitch = 1.3
--})
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
        if context.joker_main then
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
        if context.joker_main and G.GAME.current_round.hands_left == 0 then
          return{
            mult_mod = card.ability.extra.mult,
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult} }
          }
        elseif context.end_of_round then
            if context.main_eval then
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

--[[ SMODS.Joker{ --Iscariot/Judas
    key = 'iscariot',
    loc_txt = {
        name = 'Iscariot',
        text = {
            "This Joker gains {C:chips}+#2#{} Chips",
            "if {C:attention}consecutive{} played hand",
            "triggers the {C:attention}Boss Blind{}",
            "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}",         
            "Sell this card to create",
            "a {C:attention}Dark Judas{}"

        }
      },
    config = {extra = {chips = 30, chip_gain = 3}},
    rarity = 2,
    atlas = 'Hyperfixation',
    pos = {x = 4, y = 1},
    cost = 3,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    ScoreReset = true,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chip_gain}}
    end,
    calculate = function (self, card, context)
        if context.joker_main then
            SMODS.calculate_effect(context.blueprint_card or card, {
                chip_mod = card.ability.extra.chips,
                message = localize{
                    type = 'variable',
                    key = 'a_chips',
                    vars = {card.ability.extra.chips}
                },
            card = card
            })
        end    
        if context.debuffed_hand then
            card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
            ScoreReset = false
            return {
                message = 'Silver!',
                colour = G.C.CHIPS,
                card = card
            }
        end

        if context.end_of_round then
            local blind_keys = {
                bl_window = true,
                bl_head = true,
                bl_club = true,
                bl_goad = true,
                bl_plant = true,
                bl_tooth = true,
                bl_pillar = true,
                bl_flint = true,
                bl_eye = true,
                bl_mouth = true,
                bl_psychic = true,
                bl_arm = true,
                bl_ox = true,
                bl_final_leaf = true
            }  
            if blind_keys[G.GAME.blind.config.blind.key] then
                if ScoreReset then
                    print(ScoreReset)
                    return {
                        message = 'Oops!',
                        card = card
                    }
                end  
            else
                print(ScoreReset)
                return {
                    message = 'Greedy!',
                    card = card
                }
            end
            ScoreReset = false
        end
    end
} ]]

--[[ SMODS.Joker{
    key = 'defect',
    loc_txt = {
        name = 'Defect'
        text = {
            ""
        }
    }
} ]]