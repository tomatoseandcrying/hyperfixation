G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'rectangle',
    pos = { x = 9, y = 11 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
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
            key = card.ability and card.ability.extra.new_key or "j_hpfx_rectangle",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_rectangle_alt"
        G.GAME.joker_buffer = G.GAME.joker_buffer + 1
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                local keey =
                    SMODS.add_card {
                        set = 'Joker',
                        key = "j_hpfx_jumbo",
                        key_append = 'hpfx_prisoner'
                    }
                SMODS.calculate_effect({
                    message = localize('hpfx_hey'),
                    colour = G.C.hpfx_IjiGray,
                }, keey)
                G.GAME.joker_buffer = 0
                return true
            end
        }))
        G.E_MANAGER:add_event(Event({
            delay = 0.3,
            func = function()
                SMODS.calculate_effect({
                    message = localize('hpfx_no'),
                    colour = G.C.hpfx_IjiGray,
                }, card)
                SMODS.destroy_cards(card)
                return true
            end
        }))
    end
}
