G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'yomorty',
    pos = {x = 5, y = 8},
    soul_pos = {x = 5, y = 9},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        xmult = 1,
        xmult_gain = 1,
        discards = 23,
        discards_remaining = 23
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.discards,
                card.ability.extra.discards_remaining,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_yomorty",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_yomorty_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if (context.discard or context.hand_drawn) and not context.blueprint then
        if card.ability.extra.discards_remaining <= 1 then
            card.ability.extra.discards_remaining = card.ability.extra.discards
            card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                return{
                colour = G.C.RED,
                message = localize{
                    type = 'variable', key = 'a_xmult',
                    vars = {card.ability.extra.xmult}}
                }
            else
                return{
                    func = function()
                        card.ability.extra.discards_remaining =
                        (card.ability.extra.discards_remaining - (1 + #context.hand_drawn))
                    end
                }
            end
        end
        if context.joker_main then return{xmult = card.ability.extra.xmult} end
    end
}