SMODS.Joker{
    key = 'farmer',
    loc_txt = {
    },
    config = {extra = {size = 1}},
    unlocked = false,
    discovered = false,
    loc_vars = function(self, info_queue, card)
        return {vars = {card.ability.extra.size}}
    end,
    rarity = 2,
    atlas = 'IsaacJokers',
    pos = {x = 4, y = 1},
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.size = math.floor(card.ability.extra.size)
        G.jokers.config.card_limit = G.jokers.config.card_limit + card.ability.extra.size
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.size
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.jokers.config.card_limit = G.jokers.config.card_limit - card.ability.extra.size
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.size
        if G.hand.config.highlighted_limit < 5 then G.hand.config.highlighted_limit = 5 end
		G.hand:unhighlight_all()
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end
}
--unlock condition: Nope! on Wheel of Fortune 3 times in a row