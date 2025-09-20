G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'yomorty',
    pos = { x = 5, y = 8 },
    soul_pos = { x = 5, y = 9 },
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
            dis = 23,
            dis_rem = 23
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.dis,
                card.ability.extra.dis_rem,
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
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if (context.discard or context.hand_drawn) and not context.blueprint then
            local subtract = context.hand_drawn and #context.hand_drawn or 1
            local dis_rem = card.ability.extra.dis_rem
            local will_trigger = dis_rem <= 1 or (dis_rem - subtract <= 0)
            return {
                func = function()
                    if will_trigger then
                        local overflow = subtract - dis_rem
                        card.ability.extra.dis_rem = card.ability.extra.dis
                        card.ability.extra.dis_rem =
                            card.ability.extra.dis_rem - overflow
                        SMODS.scale_card(card, {
                            operation = "+",
                            ref_table = card.ability.extra,
                            ref_value = "xmult",
                            scalar_value = "xmult_gain",
                            scaling_message = {
                                message = 'Something!?',
                                colour = G.C.MULT
                            }
                        })
                    else
                        card.ability.extra.dis_rem = dis_rem - subtract
                    end
                end,
                message = will_trigger and localize { type = 'variable', key = 'a_xmult',
                    vars = { card.ability.extra.xmult + card.ability.extra.xmult_gain } } or nil,
                colour = will_trigger and G.C.RED or nil
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
    end
}
