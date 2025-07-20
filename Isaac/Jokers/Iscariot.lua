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
        if args.type == 'hpfx_devil' then
            unlock_card(self)
        end
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
                func = function()
                    hpfx_isaacChip(card, context)
                end
            }
        end
        if context.cardarea == G.play and
            context.main_eval then
            if G.GAME.blind.triggered then
                if blind_keys[G.GAME.blind.config.blind.key] then
                    return {
                        message = 'Silver!',
                        sound = 'hpfx_silver',
                        colour = G.C.CHIPS,
                        card = card,
                        func = function()
                            hpfx_chipGain(card, context)
                        end
                    }
                end
            end
        end
    end
}
