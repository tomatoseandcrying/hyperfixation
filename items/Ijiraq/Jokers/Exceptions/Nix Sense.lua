G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'nix_sense',
    pos = { x = 8, y = 10 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = { sixdes = false, extra = {} },
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
            key = card.ability and card.ability.extra.new_key or "j_hpfx_nix_sense",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_nix_sense_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.destroy_card and not context.blueprint then
            if #context.full_hand == 1 and context.destroy_card == context.full_hand[1]
                and context.full_hand[1]:get_id() == 6 and G.GAME.current_round.hands_played == 0 then
                if #G.consumeables.cards + G.GAME.consumeable_buffer < G.consumeables.config.card_limit
                    and card.ability.sixdes == false then
                    G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                    card.ability.sixdes = true
                    G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.add_card {
                                set = 'Spectral',
                                key_append = 'hpfx_nix_sense'
                            }
                            G.GAME.consumeable_buffer = 0
                            hpfx_Transform(card, context)
                            return true
                        end)
                    }))
                    return {
                        message = localize('k_plus_spectral'),
                        colour = G.C.SECONDARY_SET.Spectral,
                        remove = true
                    }
                end
                return {
                    remove = true,
                }
            end
        end
    end
}
