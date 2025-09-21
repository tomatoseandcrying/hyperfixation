G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'ribtickler',
    pos = { x = 3, y = 4 },
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
            key = card.ability and card.ability.extra.new_key or "j_hpfx_ribtickler",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_ribtickler_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.end_of_round
            and context.game_over
            and context.main_eval then
            if to_big(G.GAME.chips)
                / to_big(G.GAME.blind.chips)
                >= to_big(0.25) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        G.hand_text_area.blind_chips:juice_up()
                        G.hand_text_area.game_chips:juice_up()
                        hpfx_Transform(card, context)
                        return true
                    end
                }))
                return {
                    message = localize('hpfx_fakesaved_ex'),
                    saved = "Spared... for now.",
                    colour = G.C.RED
                }
            end
        end
    end
}
