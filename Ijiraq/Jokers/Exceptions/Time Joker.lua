G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'time',
    pos = { x = 3, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 4, 'hpfx_time_id')
        return {
            vars = {
                new_num,
                new_denom,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_time",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_time_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.before and context.main_eval and
            SMODS.pseudorandom_probability(card, 'hpfx_time_seed', 1, 4, 'hpfx_time_id') then
            local hand_table = G.handlist
            local played_hand = context.scoring_name
            local filtered_hand_table = {}
            for _, v in ipairs(hand_table) do
                if v ~= played_hand then table.insert(filtered_hand_table, v) end
            end
            for _, v in ipairs(filtered_hand_table) do
                SMODS.smart_level_up_hand(card, v, false, 1)
            end
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
