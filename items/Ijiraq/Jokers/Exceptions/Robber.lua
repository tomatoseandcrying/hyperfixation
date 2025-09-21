G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'robber',
    pos = { x = 1, y = 10 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            hands = 3,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_robber",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_robber_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.setting_blind then
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            ease_discard(G.GAME.current_round.discards_left, nil, true)
                            ease_hands_played(-card.ability.extra.hands)
                            SMODS.calculate_effect(
                                {
                                    message = localize {
                                        type = 'variable',
                                        key = 'hpfx_m_hands',
                                        vars = { card.ability.extra.hands
                                        } }
                                },
                                context.blueprint_card or card)
                            return true
                        end
                    }))
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
