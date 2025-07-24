G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker { --Marble Joker?
    key = 'porcelain',
    atlas = 'IjiraqJokers',
    pos = { x = 3, y = 2 },
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = { additions = 1 }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_stone
        return {
            vars =
            {
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_porcelain",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_porcelain_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    rarity = 2,
    cost = 6,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function(self, card, context)
        if context.setting_blind then
            local stone_card = create_playing_card(
                { center = G.P_CENTERS.m_stone },
                G.discard,
                true,
                false,
                nil,
                true
            )
            G.E_MANAGER:add_event(Event({
                func = function()
                    stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
                    G.play:emplace(stone_card)
                    return true
                end
            }))
            return {
                message = localize('k_plus_stone'),
                colour = G.C.SECONDARY_SET.Enhanced,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.deck.config.card_limit =
                                G.deck.config.card_limit + 1
                            return true
                        end
                    }))
                    draw_card(G.play, G.deck, 90, 'up')
                    SMODS.calculate_context(
                        {
                            playing_card_added = true,
                            cards = { stone_card }
                        })
                end
            }
        end
        if context.hand_drawn then
            for _, card in ipairs(G.playing_cards) do
                if SMODS.has_enhancement(card, 'm_stone') then
                    card:set_ability(G.P_CENTERS.c_base)
                end
            end
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
