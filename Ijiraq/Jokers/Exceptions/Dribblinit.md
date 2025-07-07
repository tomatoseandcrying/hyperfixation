G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'dribblinit',
    pos = {x = 4, y = 8},
    soul_pos = {x = 4, y = 9},
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
        xmult = 2,
        xmult_gain = 2
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
                card.ability.extra.xmult_gain
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_dribblinit",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_dribblinit_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and not context.blueprint and
            (context.other_card:get_id() == 12 or context.other_card:get_id() == 13) then
                card.ability.extra.xmult = card.ability.extra.xmult *
                    card.ability.extra.xmult_gain
                return {
                message = localize{
                    type = 'variable',
                    key = 'a_xmult',
                    vars = {card.ability.extra.xmult
                }},
                colour = G.C.RED
            }
        end
        if context.joker_main then return {xmult = card.ability.extra.xmult} end
    end
}