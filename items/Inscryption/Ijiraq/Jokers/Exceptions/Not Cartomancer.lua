G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'not_cartomancer',
    pos = { x = 7, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = { extra = { mult = 1 } },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 6, 'hpfx_notcartomancer_id')
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult * (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0),
                new_num,
                new_denom,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_not_cartomancer",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_not_cartomancer_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == "Tarot" then
            if SMODS.pseudorandom_probability(card, 'hpfx_notcartomancer_seed', 1, 6, 'hpfx_notcartomancer_id') then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            else
                return {
                    message = localize { type = 'variable', key = 'a_mult', vars = { G.GAME.consumeable_usage_total.tarot } },
                }
            end
        end
        if context.joker_main then
            return {
                mult = card.ability.extra.mult *
                    (G.GAME.consumeable_usage_total and G.GAME.consumeable_usage_total.tarot or 0)
            }
        end
    end
}
