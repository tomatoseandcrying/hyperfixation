G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'chaoz',
    pos = { x = 1, y = 0 },
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
            rerolls = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.rerolls,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_chaoz",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(card.ability.extra.rerolls)
        card.ability.extra.new_key = "j_hpfx_chaoz_alt"
        card:add_sticker('hpfx_priceless')
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_free_rerolls(-card.ability.extra.rerolls)
    end,
    calculate = function(self, card, context)
        if context.reroll_shop then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
