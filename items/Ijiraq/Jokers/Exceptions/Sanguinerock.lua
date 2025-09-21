G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'sanguinerock',
    pos = { x = 0, y = 8 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'IjiraqJokers',
    config = { trig = false, extra = { xmult = 1.5 } },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 2, 'hpfx_sanguinerock_id')
        return {
            vars = {
                new_num,
                new_denom,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_sanguinerock",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_sanguinerock_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play and context.other_card:is_suit("Hearts") and
            SMODS.pseudorandom_probability(card, 'hpfx_sanguinerock_seed', 1, 2, 'hpfx_sanguinerock_id')
            and card.ability.trig == false then
            card.ability.trig = true
            return {
                xmult = card.ability.extra.xmult,
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
