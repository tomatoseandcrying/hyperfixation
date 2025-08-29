G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'buttowski',
    pos = { x = 8, y = 6 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            h_size = 2,
            h_mod = 1,
            chip_mod = 250
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chip_mod,
                card.ability.extra.h_size,
                card.ability.extra.h_mod,
                card.area and card.area == G.jokers and "...?" or "",
                card.ability and card.ability.extra.h_size < 1 and "" or "-"
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_buttowski",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_buttowski_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                chips = card.ability.extra.chip_mod
            }
        end
        if context.end_of_round and context.game_over == false
            and context.main_eval and not context.blueprint then
            if card.ability.extra.h_size >= 0 then
                card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
                G.hand:change_size(card.ability.extra.h_mod)
                return {
                    message = localize { type = 'variable', key = 'a_handsize', vars = { card.ability.extra.h_mod } },
                    colour = G.C.FILTER
                }
            else
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
