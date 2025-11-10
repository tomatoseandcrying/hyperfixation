SMODS.Consumable({
    key = 'iji_deceit',
    set = 'Spectral',
    pos = { x = 5, y = 5 },
    config = { max_highlighted = 1 },
    unlocked = true,
    discovered = true,
    cost = 8,
    hidden = true,
    soul_set = 'Spectral',
    soul_rate = 0.015,
    can_repeat_soul = false,
    keep_on_use = function(self, card)
        if G.jokers and G.jokers.cards and #G.jokers.cards <= 0 then
            return G.jokers and #G.jokers.highlighted <= card.ability.max_highlighted and #G.jokers.highlighted > 0
        end
        return false
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.highlighted <= card.ability.max_highlighted and #G.jokers.highlighted > 0
    end,
    use = function(self, card, area, copier)
        G.E_MANAGER:add_event(Event({
            trigger = 'after',
            delay = 0.4,
            func = function()
                play_sound('tarot1')
                card:juice_up(0.3, 0.5)
                return true
            end
        }))
        for i = 1, #G.jokers.highlighted do
            local percent = 1.15 - (i - 0.999) / (#G.jokers.highlighted - 0.998) * 0.3
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.jokers.highlighted[i]:flip()
                    play_sound('card1', percent)
                    G.jokers.highlighted[i]:juice_up(0.3, 0.3)
                    return true
                end
            }))
        end
        delay(0.2)
        for i = 1, #G.jokers.highlighted do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.1,
                func = function()
                    if Hyperfixation.brokejokes[G.jokers.highlighted[i].config.center.key] then
                        attention_text({
                            text = localize('k_nope_ex'),
                            scale = 0.8,
                            hold = 1,
                            major = card,
                            backdrop_colour = G.C.SECONDARY_SET.Tarot,
                            align = (G.STATE == G.STATES.TAROT_PACK or
                                    G.STATE == G.STATES.SPECTRAL_PACK or
                                    G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and
                                'tm' or 'cm',
                            offset = {
                                x = 0,
                                y = (G.STATE == G.STATES.TAROT_PACK or
                                    G.STATE == G.STATES.SPECTRAL_PACK or
                                    G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0
                            },
                            silent = true
                        })
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.06 * G.SETTINGS.GAMESPEED,
                            blockable = false,
                            blocking = false,
                            func = function()
                                play_sound('tarot2', 0.76, 0.4)
                                return true
                            end
                        }))
                        play_sound('tarot2', 1, 0.4)
                        card:juice_up(0.3, 0.5)
                    else
                        G.GAME.current_round.fodder_card.jkey = G.jokers.highlighted[i].config.center.key
                        if JokerDisplay then
                            G.jokers.highlighted[i]:joker_display_remove()
                        end
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                G.jokers.highlighted[i]:flip()
                                return true
                            end,
                        }))
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                G.jokers.highlighted[i]:set_ability(G.P_CENTERS["j_hpfx_costume"])
                                play_sound("card1")
                                G.jokers.highlighted[i]:juice_up(0.3, 0.3)
                                return true
                            end,
                        }))
                        G.E_MANAGER:add_event(Event({
                            trigger = "after",
                            delay = 0.15,
                            func = function()
                                card:flip()
                                return true
                            end,
                        }))
                    end
                    return true
                end
            }))
        end
        --G.jokers:unhighlight_all()
    end
})
