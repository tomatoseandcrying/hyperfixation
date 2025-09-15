G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'shoebuckles',
    pos = { x = 9, y = 8 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 2,
            dollars = 5
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.dollars,
                card.ability.extra.mult *
                math.floor(((G.GAME.dollars or 0) +
                    (G.GAME.dollar_buffer or 0)) / card.ability.extra.dollars),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_shoebuckles",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_shoebuckles_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = 5
        local multdeux = math.floor(mult / 2)
        if multdeux > 0 then
            return bonus * multdeux,
                G.E_MANAGER:add_event(Event({
                    func = function()
                        hpfx_Transform(card, context)
                        return true
                    end
                }))
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult *
                    math.floor(((G.GAME.dollars or 0) +
                            (G.GAME.dollar_buffer or 0)) /
                        card.ability.extra.dollars)
            }
        end
    end
}
