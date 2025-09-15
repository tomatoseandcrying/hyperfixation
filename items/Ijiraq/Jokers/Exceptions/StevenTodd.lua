G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'odd_steven',
    pos = { x = 8, y = 3 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    config = {
        trig = false,
        extra = {
            mult = 4,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_odd_steven",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_odd_steven_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() <= 10
                and context.other_card:get_id() >= 0
                and context.other_card:get_id() % 2 == 0 then
                local rand = pseudorandom('oddeven', 0, 4)
                rand = (rand * 2) + 1
                assert(SMODS.modify_rank(context.other_card, rand))
                card.ability.trig = true
                return {
                    mult = card.ability.extra.mult,
                }
            end
        end
        if context.final_scoring_step and card.ability.trig then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
SMODS.Joker {
    key = 'even_todd',
    pos = { x = 9, y = 3 },
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
            chips = 31,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_even_todd",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_even_todd_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play then
            if (context.other_card:get_id() <= 10
                    and context.other_card:get_id() >= 0
                    and context.other_card:get_id() % 2 == 1)
                or (context.other_card:get_id() == 14) then
                local rand = pseudorandom('oddeven', 1, 5)
                rand = (rand * 2)
                assert(SMODS.modify_rank(context.other_card, rand))
                return {
                    chips = card.ability.extra.chips
                }
            end
        end
        if context.after then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
