G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'stormcloud',
    pos = { x = 7, y = 7 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 3,
    cost = 10,
    atlas = 'IjiraqJokers',
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        if card.area and card.area == G.jokers then
            local compatible = G.jokers.cards[1] and G.jokers.cards[1] ~= card and
                G.jokers.cards[1].config.center.blueprint_compat
            main_end = {
                {
                    n = G.UIT.C,
                    config = { align = "bm", minh = 0.4 },
                    nodes = {
                        {
                            n = G.UIT.C,
                            config = { ref_table = card, align = "m", colour = compatible and mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8), r = 0.05, padding = 0.06 },
                            nodes = {
                                { n = G.UIT.T, config = { text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ', colour = G.C.UI.TEXT_LIGHT, scale = 0.32 * 0.8 } },
                            }
                        }
                    }
                }
            }
        end
        return {
            main_end = main_end,
            vars = {
                card.area and card.area == G.jokers and "...?" or ""
            },
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_stormcloud",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_stormcloud_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.card_pos_changed and card.area.cards[1] and not card.hpfx_stormynight then
            card.hpfx_stormynight = true
            return {
                func = function()
                    hpfx_Transform(card)
                end
            }
        end
    end
}
