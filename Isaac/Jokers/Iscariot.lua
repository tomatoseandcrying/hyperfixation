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
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.chips, card.ability.extra.chip_gain}}
    end,
    calculate = function (self, card, context)
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
        if context.joker_main and 
        (to_big(card.ability.extra.chips) > to_big(1)) and
        (to_big(card.ability.extra.chip_gain) > to_big(1)) then
            return{
                isaacChip(card, context) --chips scoring function
            }
            
        end
        if context.debuffed_hand then
            if blind_keys[G.GAME.blind.config.blind.key] then
                chipGain(card, context) --chips gain function
                return {
                    message = 'Silver!',
                    colour = G.C.CHIPS,
                    card = card
                }   
            end
        end
    end
}