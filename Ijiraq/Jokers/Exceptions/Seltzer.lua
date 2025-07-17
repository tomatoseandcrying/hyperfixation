G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'seltzer',
    pos = { x = 3, y = 15 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            hands_left = 10,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.hands_left,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_seltzer",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_seltzer_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.scoring_hand and not context.blueprint then
            return {
                add_to_hand = true
            }
        end
        if context.repetition and context.cardarea == G.play then
            if SMODS.pseudorandom_probability(card, 'hpfx_seltzer_seed', 1, 4, 'hpfx_seltzer_id') then
                return {
                    repetitions = 1
                }
            else
                return {
                    message = localize('k_nope_ex')
                }
            end
        end
        if context.after and not context.blueprint then
            if card.ability.extra.hands_left - 1 <= 0 then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            else
                card.ability.extra.hands_left = card.ability.extra.hands_left - 1
                return {
                    message = card.ability.extra.hands_left .. '',
                    colour = G.C.FILTER
                }
            end
        end
    end
}
