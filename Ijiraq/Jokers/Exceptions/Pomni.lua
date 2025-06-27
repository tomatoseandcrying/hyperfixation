G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'pomni',
    pos = {x = 3, y = 3},
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
        mult = 3,
        }
    },
    loc_vars = function (self, info_queue, card)
        if G.jokers then
            return{
                vars = {
                    card.ability.extra.mult,
                    card.ability.extra.mult * (G.jokers and #G.jokers.cards or 0),
                    card.ability.extra.joker_count == #G.jokers.cards,
                    card.area and card.area == G.jokers and "...?" or ""
                }
            }
        end
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_pomni",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_pomni_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        if card.ability.extra.joker_count >= 4 then
            func = function ()
                hpfx_Transform(card, context)
            end
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult * #G.jokers.cards
            }
        end
    end
}