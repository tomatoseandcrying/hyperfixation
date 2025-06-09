SMODS.Joker{ --Ijiraq.
    key = 'ijiraq',
    pos = {x = 0, y = 9},
    soul_pos = {x = 1, y = 9},
    no_mod_badges = false,
    unlocked = true,
    discovered = false,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = { --
        extra = {jkey = 'ijiraq'}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.jkey
        }}
    end,
    in_pool = function(self, args)
        return false
    end,
    add_to_deck = function(self, card, from_debuff)
        card:remove_sticker('hpfx_priceless')
    end,
}