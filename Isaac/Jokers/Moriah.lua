SMODS.Joker{
    key = 'moriah',
    config = {extra = {
        chips = 22, 
        mult = 2, 
        money = 1
    }},
    loc_vars = function (self, info_queue, card)
        return{
        vars = {
        card.ability.extra.chips, 
        card.ability.extra.mult, 
        card.ability.extra.money
    }}
    end,
    calc_dollar_bonus = function(self, card)
        local bonus = card.ability.extra.money
        if bonus > 0 then return bonus end
    end,
    rarity = 2,
    atlas = 'IsaacJokers',
    pos = {x = 0, y = 0}, 
    cost = 6,
    no_collection = (config and config.Isaac) or false,
    unlocked = false,
    check_for_unlock = function(self, args)
        if args.type == 'hpfx_oops' then
            unlock_card(self)
        end
    end,
    in_pool = function(self, args)
        return config.Isaac
    end,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    remove_from_deck = function (self, card, from_debuff)
        play_sound((('hpfx_death') .. pseudorandom("isold", 1, 3)), 1, 0.55)
    end,
    calculate = function(self, card, context)
        if context.joker_main and 
        (to_big(card.ability.extra.chips) > to_big(1)) and
        (to_big(card.ability.extra.mult) > to_big(1)) then
            return{
                isaacChip(card, context),
                extra = {
                isaacMult(card, context),
                },
            }
        end
    end
}--unlock condition: get Oops