G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'flunkie',
    pos = { x = 0, y = 4 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 4,
            chips = 20
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_flunkie",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_flunkie_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and
            context.cardarea == G.play and
            context.other_card:get_id() == 14 then
            assert(SMODS.destroy_cards(context.other_card))()
            return {
                mult = card.ability.extra.mult,
                chips = card.ability.extra.chips,
            }
        end
        if context.after and ace_count == 0 then
            local ace_count = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 14 then
                        ace_count = ace_count + 1
                    end
                end
            end
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
