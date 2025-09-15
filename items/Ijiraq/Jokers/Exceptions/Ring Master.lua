G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'showman',
    pos = { x = 6, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = { denom = 6, deck = 0, extra = {} },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 6, 'hpfxshowman_id')
        return {
            card.ability.denom,
            card.ability.deck,
            vars = {
                card.area and card.area == G.jokers and "...?" or "",
                new_num,
                new_denom,
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
        Card:set_card_rate(true, 0)
        Card:set_booster_weight(true, 0, true)
        card.ability.extra.new_key = "j_hpfx_showman_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        G.E_MANAGER:add_event(Event({
            func = function()
                Card:set_booster_weight('Standard')
                Card:set_card_rate('playing', 1)
                return true
            end
        }))
    end,
    remove_from_deck = function(self, card, from_debuff)
        Card:set_booster_weight(true)
        Card:set_card_rate(true)
    end,
    calculate = function(self, card, context)
        if context.open_booster then card.ability.deck = #G.playing_cards end
        if context.buying_card or (context.ending_booster and card.ability.deck < #G.playing_cards) then
            if SMODS.pseudorandom_probability(card, 'hpfxshowman_seed', 1, card.ability.denom, 'hpfxshowman_id') then
                return { func = function() hpfx_Transform(card, context) end }
            else
                return {
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
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
                            return true
                        end
                    }))
                }
            end
        end
        if context.skipping_booster then
            card.ability.denom = card.ability.denom * 2
            return {
                G.E_MANAGER:add_event(Event({
                    trigger = 'after',
                    delay = 0.4,
                    func = function()
                        attention_text({
                            text = localize('hpfx_coward_ex'),
                            scale = 0.5,
                            hold = 1.4,
                            major = card,
                            --backdrop_colour = G.C.hpfx_IjiGray,
                            colour = G.C.RED,
                            align = 'bm',
                            offset = {
                                x = 0,
                                y = 0
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
                        return true
                    end
                }))
            }
        end
    end
}
