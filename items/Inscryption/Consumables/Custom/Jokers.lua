SMODS.Joker({
    key = 'squirrel',
    pos = { x = 0, y = 0 },
    config = { extra = { mult = 1 } },
    rarity = 1,
    cost = 1,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    hpfx_priceless_compat = false,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end,
    in_pool = function(self, args)
        return false, { allow_duplicates = true }
    end

})
