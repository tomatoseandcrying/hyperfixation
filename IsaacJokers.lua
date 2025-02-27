--[[ G.farmerProb = G.GAME.probabilities ]]

SMODS.Atlas{
    key = 'IsaacJokers',
    path = "IsaacJokers.png",
    px = 71,
    py = 95
}
SMODS.Sound({
    key = "hpfx_1up",
    path = "1up.ogg",
})
SMODS.Sound({
    key = "hpfx_thumbsup",
    path = "thumbsup.ogg",
})
SMODS.Sound({
    key = "hpfx_gulp",
    path = "gulp.ogg",
})

SMODS.Joker{ --Moriah/Isaac
    key = 'moriah',
    config = {extra = {chips = 22, mult = 2, money = 1}},
    loc_vars = function (self, info_queue, card)
        return{vars = {card.ability.extra.chips, card.ability.extra.mult, card.ability.extra.money}}
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        if bonus > 0 then return bonus end
    end,
    rarity = 2,
    atlas = 'IsaacJokers',
    pos = {x = 0, y = 0},
    cost = 6,
    unlocked = true,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and (to_big(card.ability.extra.chips) > to_big(1)) and (to_big(card.ability.extra.mult) > to_big(1)) then
            return{
                chip_mod = card.ability.extra.chips,
                sound = "hpfx_thumbsup",
                colour = G.C.CHIPS,
                message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
                extra = {
                    mult_mod = card.ability.extra.mult,
                    sound = "hpfx_1up",
                    colour = G.C.MULT,
                    message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}},
                },
            card = card
            }
        end
    end
}

SMODS.Joker{ --Mary/Magdalene
    key = 'mary',
    config = {extra = {mult = 8, mult_gain = 2, rounds = 3, c_rounds = 0}},
    rarity = 1,
    atlas = 'IsaacJokers',
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
            sound = 'hpfx_1up',
            message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}
          }
        elseif context.end_of_round then
            if context.main_eval and (to_big{card.ability.extra.mult, card.ability.extra.mult_gain} > to_big(1)) then
                if not context.blueprint_card then
                    if card.ability.extra.c_rounds >= card.ability.extra.rounds then
                        card.ability.extra.mult = card.ability.extra.mult + card.ability.extra.mult_gain
                        card.ability.extra.c_rounds = 0
                        return {
                            message = 'Yum!',
                            sound = "hpfx_gulp",
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
    },
    config = {extra = {size = 1}},
    unlocked = false,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {card.ability.extra.size}
        }
    end,
    rarity = 3,
    atlas = 'IsaacJokers',
    pos = {x = 4, y = 1},
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.size = math.floor(card.ability.extra.size)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.size
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.size
    end,
--[[     calculate = function (self, card, context)
        if context.using_consumeable then
            if context.consumeable.config.center_key == "c_wheel" then
                if pseudorandom('farmer') < G.farmerProb/card.ability.extra.odds then
                    for k, v in pairs(G.farmerProb) do 
                    G.farmerProb[k] = v*2
                    end
                end
            end
        end
    end, ]]
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.size
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.size
        if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
    end
}

SMODS.Joker{ --Iscariot/Judas
    key = 'iscariot',
    config = {extra = {chips = 30, chip_gain = 3}},
    rarity = 2,
    atlas = 'IsaacJokers',
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
        if context.joker_main and (to_big{card.ability.extra.chips, card.ability.extra.chip_gain} > to_big(1)) then
            return{
                chip_mod = card.ability.extra.chips,
                message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}},
            card = card
            }
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
                    sendDebugMessage(ScoreReset)
                    return {
                        message = 'Oops!',
                        card = card
                    }
                end  
            else
                sendDebugMessage(ScoreReset)
                return {
                    message = 'Greedy!',
                    card = card
                }
            end
            ScoreReset = false
        end
    end
}

SMODS.Joker{ --Cyanosis/Blue Baby
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
}

--mult-decrease scoring context designed by BakersDozenBagels below!

local last_mult = 0
local raw_mod_mult = mod_mult
-- mod_mult is used after any mult change to apply effects like Rich Get Richer
function mod_mult(...)
    local new_mult = raw_mod_mult(...)
    if (to_big(new_mult):lt(to_big(last_mult))) or (not to_big and new_mult < last_mult) then
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
end

-- Reset our tracker at the end of the round so we don't see a fake decrease
local raw_G_FUNCS_evaluate_play = G.FUNCS.evaluate_play
function G.FUNCS.evaluate_play(...)
    raw_G_FUNCS_evaluate_play(...)
    last_mult = 0
end

--[[ local cuc = Card.use_consumeable
Card.use_consumeable = function(self, area, copier)
  local odds_mod = 1
  for _,v in ipairs(SMODS.find_card('j_hpfx_farmer')) do odds_mod = odds_mod * v.ability.extra.odds_mod end
  if self.config.center.key == 'c_wheel' then G.GAME.probabilities.normal = G.GAME.probabilities.normal * odds_mod end
  cuc(self, area, copier)
  if self.config.center.key == 'c_wheel' then G.GAME.probabilities.normal = G.GAME.probabilities.normal / odds_mod end
end ]]