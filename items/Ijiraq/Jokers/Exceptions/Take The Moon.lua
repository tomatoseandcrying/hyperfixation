G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'take_the_moon',
    pos = { x = 8, y = 13 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            interest = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.interest,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_take_the_moon",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount + 9999
        card.ability.extra.new_key = "j_hpfx_take_the_moon_alt"
        card:add_sticker('hpfx_priceless')
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.interest_amount = G.GAME.interest_amount - 9999
    end
}
