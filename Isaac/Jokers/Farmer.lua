SMODS.Joker {
    key = 'farmer',
    config = { extra = { size = 1 } },
    unlocked = false,
    discovered = false,
    rarity = 2,
    atlas = 'IsaacJokers',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        local hint = pseudorandom("secrethint", 1, 7)
        return {
            vars = {
                card.ability.extra.size,
                card.area and card.area == G.jokers and hint == 1 and
                "Fancy another go at the Big Six?" or "Skip devil deals, ain't worth it"
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_nope'
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.size = math.floor(card.ability.extra.size)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.size
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.size
        SMODS.change_play_limit(card.ability.extra.size)
        SMODS.change_discard_limit(card.ability.extra.size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        SMODS.change_play_limit(-card.ability.extra.size)
        SMODS.change_discard_limit(-card.ability.extra.size)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.size
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.size
        if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
        G.hand:unhighlight_all()
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
}
