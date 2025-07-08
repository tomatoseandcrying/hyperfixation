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
        dis = 23,
        dis_rem = 23
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
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
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.discard and not context.blueprint then
            if card.ability.extra.dis_rem <= 1 then
                card.ability.extra.dis_rem = card.ability.extra.dis
                card.ability.extra.xmult =
                card.ability.extra.xmult + card.ability.extra.xmult_gain
                return{
                    message = localize{
                        type = 'variable',
                        key = 'a_xmult',
                        vars = {card.ability.extra.xmult}
                    },
                    colour = G.C.RED
                }
            else
                return{
                    func = function()
                        card.ability.extra.dis_rem =
                        card.ability.extra.dis_rem - 1
                    end
                }
            end
        elseif context.hand_drawn and not context.blueprint then
            return{
                func = function()
                    local subtract = #context.hand_drawn
                    local dis_rem = card.ability.extra.dis_rem
                    if dis_rem - subtract <= 0 then
                        local overflow = subtract - dis_rem
                        card.ability.extra.dis_rem = card.ability.extra.dis
                        card.ability.extra.xmult =
                        card.ability.extra.xmult + card.ability.extra.xmult_gain
                        card.ability.extra.dis_rem =
                        card.ability.extra.dis_rem - overflow
                    else
                        card.ability.extra.dis_rem = dis_rem - subtract
                    end
                end
            }
        end
        if (context.discard or context.hand_drawn) and not context.blueprint then
            if card.ability.extra.dis_rem <= 1 then
                return{
                    message = localize{
                        type = 'variable',
                        key = 'a_xmult',
                        vars = {card.ability.extra.xmult}},
                    colour = G.C.RED
                }
            end
        end
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
    end
}