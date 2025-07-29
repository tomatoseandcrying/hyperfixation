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
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 6, 'hpfxshowman_id')
        return {
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
        if context.buying_card then
            if SMODS.pseudorandom_probability(card, 'hpfxshowman_seed', 1, 6, 'hpfxshowman_id') then
                return { func = function() hpfx_Transform(card, context) end }
            else
                return {
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.4,
                        func = function()
                            attention_text({
                                text = localize('k_nope_ex'),
                                scale = 1.3,
                                hold = 1.4,
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
    end
}
