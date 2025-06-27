G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'jiggler',
    pos = {x = 0, y = 1},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            h_size = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.h_size,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_jiggler",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.hand:change_size(card.ability.extra.h_size)
        card.ability.extra.new_key = "j_hpfx_jiggler_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    remove_from_deck = function (self, card, from_debuff)
        G.hand:change_size(-card.ability.extra.h_size)
    end,
    calculate = function (self, card, context)
        if context.after then
            return {
                func = function ()
                hpfx_Transform(card, context)
                end
            }
        end
    end
}