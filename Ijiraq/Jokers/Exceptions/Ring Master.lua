G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'showman',
    pos = {x = 6, y = 5},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            rate = 40, 
            odds = 6,
            og_rates = {}
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.area and card.area == G.jokers and "...?" or "",
                card.ability.extra.rate,
                G.GAME and G.GAME.probabilities.normal or 1,
                card.ability.extra.odds,
                card.ability.extra.og_rates
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_showman",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function ()
                card.ability.extra.og_rates = {
                joker = G.GAME.joker_rate,
                tarot = G.GAME.tarot_rate,
                planet = G.GAME.planet_rate,
                spectral = G.GAME.spectral_rate
                }
                G.GAME.joker_rate, G.GAME.tarot_rate, G.GAME.planet_rate, G.GAME.spectral_rate = 0,0,0,0
                Card:set_booster_weight(true, 0)
                Card:set_booster_weight('Standard')
                return true
            end
        }))
        card.ability.extra.new_key = "j_hpfx_showman_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.E_MANAGER:add_event(Event({
            func = function ()
                local ogr = card.ability.extra.og_rates
                G.GAME.joker_rate = ogr.joker
                G.GAME.tarot_rate = ogr.tarot
                G.GAME.planet_rate = ogr.planet
                G.GAME.spectral_rate = ogr.spectral
                Card:set_booster_weight(true)
                return true
            end
        }))
        card.ability.extra.new_key = "j_hpfx_showman"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.remove(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.starting_shop then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 5,
                blocking = false,
                blockable = false,
                func =  function ()
                    play_sound('hpfx_pickup', 0.7, 0.5)
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay = 7.269, --2sec
                blocking = false,
                blockable = false,
                func =  function ()
                    attention_text({
                        text = localize('hpfx_pickup1_ex'), scale = 1.3,
                        hold = 1.4, major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay = 9.142, --4sec
                blocking = false,
                blockable = false,
                func =  function ()
                    attention_text({
                        text = localize('hpfx_pickup2_ex'), scale = 1.3,
                        hold = 1.4, major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay = 9.851, --4sec
                blocking = false,
                blockable = false,
                func =  function ()
                    attention_text({
                        text = localize('hpfx_pickup3_ex'), scale = 1.3,
                        hold = 1.4, major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay = 10.696, --5sec
                blocking = false,
                blockable = false,
                func =  function ()
                    attention_text({
                        text = localize('hpfx_pickup4_ex'), scale = 1.3,
                        hold = 1.4, major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                end
            }))
        end
        if context.buying_card then
            if (pseudorandom('ring_master') < G.GAME.probabilities.normal / card.ability.extra.odds) then
                return {func = function () hpfx_Transform(card, context) end}
            else return {
                    G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                    attention_text({
                        text = localize('k_nope_ex'), scale = 1.3,
                        hold = 1.4, major = card,
                        backdrop_colour = G.C.SECONDARY_SET.Tarot,
                        align = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                            'tm' or 'cm',
                        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or
                        G.STATE == G.STATES.SPECTRAL_PACK or
                        G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0 },
                        silent = true
                    })
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after', delay = 0.06 * G.SETTINGS.GAMESPEED,
                        blockable = false, blocking = false,
                        func = function() play_sound('tarot2', 0.76, 0.4)
                        return true end
                    }))
                    play_sound('tarot2', 1, 0.4)
                    card:juice_up(0.3, 0.5)
                    return true end
                    }))
                }
            end
        end
    end
}