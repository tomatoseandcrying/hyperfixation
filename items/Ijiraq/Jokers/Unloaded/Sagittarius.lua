G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'sagittarius',
    pos = { x = 9, y = 10 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            xmult = 1,
            xmult_gain = 0.1
        }
    },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 8, 88, 'hpfx_sagittarius_id')
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
                new_num,
                new_denom
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_sagittarius",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_sagittarius_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.using_consumeable and not context.blueprint and context.consumeable.ability.set == 'Planet' then
            SMODS.scale_card(card, {
                operation = "+",
                ref_table = card.ability.extra,
                ref_value = "xmult",
                scalar_value = "xmult_gain",
            })
            if SMODS.pseudorandom_probability(card, 'hpfx_sagittarius_seed', 8, 88, 'hpfx_sagittarius_id') then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            else
                return {
                    message = localize { type = 'variable', key = 'a_xmult', vars = { card.ability.extra.xmult } }
                }
            end
        end
        if context.joker_main then return { xmult = card.ability.extra.xmult } end
    end
}
