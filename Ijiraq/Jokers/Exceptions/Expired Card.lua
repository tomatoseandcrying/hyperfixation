G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{ --Credit Card?
    key = 'expired',
    pos = {x = 5, y = 1},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    --no_collection = true,
    config = {
        extra = {credit = 20, dollars = 0}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.credit,
            card.area and card.area == G.jokers and "...?" or "",
            card.ability.extra.dollars
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_expired", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_expired_alt"
        G.GAME.bankrupt_at = G.GAME.bankrupt_at - card.ability.extra.credit
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.GAME.bankrupt_at = G.GAME.bankrupt_at + card.ability.extra.credit
    end,
    rarity = 1,
    cost = 1,
    atlas = 'IjiraqJokers',
    blueprint_compat = false,
    calculate = function (self, card, context)
        if context.buying_card and
        not context.blueprint and
        to_big(G.GAME.dollars) -
        to_big(context.card.cost) <=
        to_big(card.ability.extra.dollars) then
            func = function ()
            hpfx_Transform(card, context)
            end
        end
    end
}