G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'whoops',
    pos = {x = 5, y = 6},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 4,
    atlas = 'IjiraqJokers',
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_whoops",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_whoops_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v / 2
        end
    end,
    remove_from_deck = function (self, card, from_debuff)
        for k, v in pairs(G.GAME.probabilities) do
            G.GAME.probabilities[k] = v * 2
        end
    end,
    calculate = function(self, card, context)
        if context.hpfx_chudhit and context.post_trigger then
            return {
                func = function ()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}