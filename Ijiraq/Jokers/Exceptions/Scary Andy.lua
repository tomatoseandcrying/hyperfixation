G.C.hpfx_IjiGray = HEX('BFD7D5')

SMODS.Joker { --Merry Andy?
    key = 'scaryandy',
    pos = { x = 8, y = 0 },
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        trig = false,
        extra = {
            discard_size = 3,
            hand_size = -1
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.discard_size,
                card.ability.extra.hand_size,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_scaryandy", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_scaryandy_alt"
        G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.discard_size
        ease_discard(card.ability.extra.discard_size)
        G.hand:change_size(card.ability.extra.hand_size)
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.discard_size
        ease_discard(-card.ability.extra.discard_size)
        G.hand:change_size(-card.ability.extra.hand_size)
    end,
    rarity = 2,
    cost = 7,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.discard and card.ability.trig == false then
            card.ability.trig = true
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
