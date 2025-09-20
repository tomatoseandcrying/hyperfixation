SMODS.Joker { --Iscariot/Judas
    key = 'iscariot',
    config = { extra = { chips = 30, chip_gain = 4 } },
    rarity = 1,
    atlas = 'IsaacJokers',
    pos = { x = 3, y = 0 },
    cost = 3,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.chips, card.ability.extra.chip_gain } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_devil'
    end,
    remove_from_deck = function(self, card, from_debuff)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function(self, card, context)
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
            return {
                chip_mod = card.ability.extra.chips,
                sound = "hpfx_thumbsup",
                colour = G.C.CHIPS,
                message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
            }
        end
        if context.cardarea == G.play and context.main_eval then
            if G.GAME.blind.triggered and blind_keys[G.GAME.blind.config.blind.key] then
                SMODS.scale_card(card, {
                    operation = "+",
                    ref_table = card.ability.extra,
                    ref_value = "chips",
                    scalar_value = "chip_gain",
                    scaling_message = {
                        message = 'Silver!',
                        colour = G.C.CHIPS,
                        card = card,
                        sound = 'hpfx_silver'
                    }
                })
            end
        end
    end
}
