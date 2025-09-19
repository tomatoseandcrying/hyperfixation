G.C.hpfx_MarieRed = HEX('D4AF37')
SMODS.Joker {
    key = 'marie',
    rarity = 2,
    atlas = 'Jokers4Fun',
    pos = { x = 2, y = 1 },
    cost = 6,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    config = { extra = {
        xmult = 2,
        xmult_gain = 2,
    } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.xmult, card.ability.extra.xmult_gain } }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_head'
    end,
    calculate = function(self, card, context)
        if context.post_trigger and context.other_card == card and context.main_eval then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if card:is_rarity(2) then
                        card.config.center.rarity = 3
                        if card.set_cost then
                            card.ability.extra_value = (card.ability.extra_value or 0) + 2
                            card:set_cost()
                        end
                    else
                        card.config.center.rarity = 2
                        if card.set_cost then
                            card.ability.extra_value = (card.ability.extra_value or 0) - 2
                            card:set_cost()
                        end
                    end
                    attention_text({
                        text = '!',
                        scale = 0.8,
                        hold = 1,
                        major = card,
                        backdrop_colour = G.C.RARITY[card.config.center.rarity],
                        align = 'tr',
                        offset = {
                            x = -0.5,
                            y = 0.5
                        },
                        silent = true
                    })
                    return true
                end
            }))
        end
        if context.remove_playing_cards then
            for _, i in ipairs(context.removed) do
                if i:get_id() == 12 then
                    card.ability.extra.xmult = card.ability.extra.xmult + card.ability.extra.xmult_gain
                    return { message = localize('k_upgrade_ex'), colour = G.C.MULT, message_card = card }
                end
            end
        end
        if context.joker_main and (to_big(card.ability.extra.xmult) > to_big(1)) then
            return { x_mult = card.ability.extra.xmult }
        end
        if context.end_of_round and context.main_eval and context.beat_boss and not context.blueprint then
            if card.ability.extra.xmult > 2 then
                card.ability.extra.xmult = 2
                return { message = localize('k_reset'), colour = G.C.RED, message_card = card }
            end
        end
    end
}
