G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'sirtificate',
    pos = { x = 8, y = 8 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_sirtificate",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_sirtificate_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.first_hand_drawn then
            local scard = create_playing_card({
                front = pseudorandom_element(G.P_CARDS, pseudoseed('hpfx_certificate')),
                center = G.P_CENTERS.c_base
            }, G.discard, true, nil, { G.C.SECONDARY_SET.Enhanced }, true)
            scard:set_seal(SMODS.poll_seal({ guaranteed = true, type_key = 'hpfx_certificate_seal' }))
            return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.hand:emplace(scard)
                            scard:start_materialize()
                            G.GAME.blind:debuff_card(scard)
                            G.hand:sort()
                            if context.blueprint_card then
                                context.blueprint_card:juice_up()
                            else
                                card:juice_up()
                            end
                            return true
                        end
                    }))
                    SMODS.calculate_context({ playing_card_added = true, cards = { scard } })
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
