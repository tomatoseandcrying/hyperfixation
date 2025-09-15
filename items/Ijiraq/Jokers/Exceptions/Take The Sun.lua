G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'take_the_sun',
    pos = { x = 2, y = 6 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 13,
            queen_destroyed = false,
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
            key = card.ability and card.ability.extra.new_key or "j_hpfx_take_the_sun",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_take_the_sun_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        local extra = card.ability and card.ability.extra or {}
        if context.individual and context.cardarea == G.hand
            and not context.end_of_round and
            context.other_card:get_id() == 12 then
            if context.other_card.debuff then
                return {
                    message = localize('k_debuffed'),
                    colour = G.C.RED
                }
            else
                return {
                    mult = extra.mult
                }
            end
        end
        if context.destroy_card and context.cardarea == G.hand then
            if context.destroy_card:get_id() == 12 then
                extra.queen_destroyed = true
                return { remove = true }
            end
        end
        if context.after and extra.queen_destroyed == true then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
