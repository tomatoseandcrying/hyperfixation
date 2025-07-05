G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'ahead',
    pos = {x = 1, y = 8},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        chips = 50,
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
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
            key = card.ability and card.ability.extra.new_key or "j_hpfx_ahead",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_ahead_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play
        and context.other_card:is_suit("Spades") then
            context.other_card.ability.perma_bonus =
            (context.other_card.ability.perma_bonus or 0) + card.ability.extra.chips
            return {
                message = localize('k_upgrade_ex'),
                colour = G.C.CHIPS,
                chips = card.ability.extra.chips,
                func = function ()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}