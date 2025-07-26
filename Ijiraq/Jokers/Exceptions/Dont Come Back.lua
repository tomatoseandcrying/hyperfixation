G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'dont_come_back',
    pos = { x = 8, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            xmult_gain = 0.5,
            xmult = 1,
            jackstack = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        local stackjack = 0
        if G.playing_cards then
            for _, jack in ipairs(G.playing_cards) do
                if jack:get_id() == 11 then
                    stackjack = stackjack + 1
                end
            end
        end
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.ability.extra.jackstack,
                card.area and card.area == G.jokers and "...?" or "",
                card.area and card.area == G.jokers and (card.ability.extra.jackstack * stackjack) or "",
                card.area and card.area == G.jokers and "remaining" or "",
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_dont_come_back",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_dont_come_back_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        local extra = card.ability and card.ability.extra or {}
        local stackjack = 0
        if G.playing_cards then
            for _, jack in ipairs(G.playing_cards) do
                if jack:get_id() == 11 then
                    stackjack = stackjack + 1
                end
            end
        end
        if context.discard and not context.blueprint and
            context.other_card:get_id() == 11 then
            extra.xmult = extra.xmult + extra.xmult_gain
            if (extra.jackstack * stackjack) <= 1 then
                return {
                    remove = true,
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            else
                return {
                    message = localize
                        {
                            type = 'variable',
                            key = 'a_xmult',
                            vars = { card.ability.extra.xmult }
                        },
                    colour = G.C.RED,
                    remove = true
                }
            end
        end
        if context.hpfx_post_discard and (extra.jackstack * stackjack) <= 0 then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and context.game_over == false and
            context.main_eval and not context.blueprint then
            extra.xmult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
}
