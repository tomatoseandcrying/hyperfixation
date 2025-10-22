SMODS.Joker {
    key = 'farmer',
    config = {
        card_limit = 1,
        extra_slots_used = -1,
        extra = { size = 1 }
    },
    unlocked = false,
    discovered = false,
    rarity = 2,
    atlas = Hyperfixation.config and 'IsaacJokers' or 'OldIsaacJokers',
    pos = { x = 2, y = 0 },
    soul_pos = { x = 2, y = 1 },
    cost = 5,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    loc_vars = function(self, info_queue, card)
        local hint = pseudorandom("cainhint", 1, 7)
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
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit + card.ability.extra.size
        SMODS.change_play_limit(card.ability.extra.size)
        SMODS.change_discard_limit(card.ability.extra.size)
        card.ability.extra.size = math.floor(card.ability.extra.size)
    end,
    remove_from_deck = function(self, card, from_debuff)
        G.hand.config.highlighted_limit = G.hand.config.highlighted_limit - card.ability.extra.size
        G.hand:unhighlight_all()
        SMODS.change_play_limit(-card.ability.extra.size)
        SMODS.change_discard_limit(-card.ability.extra.size)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function(self, card, context)
        if context.mod_probability and context.identifier == 'wheel_of_fortune' then
            return {
                numerator = context.numerator * 2
            }
        end
    end,
}
