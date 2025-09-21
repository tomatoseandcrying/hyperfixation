G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'lima_bean',
    pos = { x = 4, y = 13 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    eternal_compat = false,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            h_size = 5,
            h_mod = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size,
                card.ability.extra.h_mod,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_lima_bean",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
        card.ability.extra.new_key = "j_hpfx_lima_bean_alt"
        card:add_sticker('hpfx_priceless')
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and
            context.main_eval and not context.blueprint then
            if card.ability.extra.h_size - card.ability.extra.h_mod <= 0 then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            else
                card.ability.extra.h_size = card.ability.extra.h_size - card.ability.extra.h_mod
                G.hand:change_size(-card.ability.extra.h_mod)
                return {
                    message = localize { type = 'variable', key = 'a_handsize_minus', vars = { card.ability.extra.h_mod } },
                    colour = G.C.FILTER
                }
            end
        end
    end
}
