SMODS.Joker {
    key = 'no_bitches',
    rarity = 3,
    atlas = 'Jokers4Fun',
    pos = { x = 3, y = 0 },
    soul_pos = { x = 3, y = 1 },
    cost = 9,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        qc = 0,
        changes = 1,
        extra = {
            xmult_loss = 1,
            xmult = 4,
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.playing_cards and card.area == G.jokers then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 12 then
                    SMODS.scale_card(card, {
                        ref_table = card.ability,
                        ref_value = 'qc',
                        scalar_value = 'changes',
                        operation = '+',
                        block_overrides = {
                            message = true
                        }
                    })
                end
            end
        end
        if card.ability.extra.xmult - card.ability.qc < 0 then
            card.ability.extra.xmult = 0
        end
        return { vars = { card.ability.extra.xmult_loss, math.max(card.ability.extra.xmult - card.ability.qc, 0) } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 12 then
                        SMODS.scale_card(card, {
                            ref_table = card.ability,
                            ref_value = 'qc',
                            scalar_value = 'changes',
                            operation = '+',
                            block_overrides = {
                                message = true
                            }
                        })
                    end
                end
            end
            if math.max(card.ability.extra.xmult - card.ability.qc, 0) > 0 then
                return {
                    xmult = card.ability.extra.xmult - card.ability.qc
                }
            else
                play_sound("hpfx_vineboom")
                G.shobitches = 70
                return {
                    xmult = 0
                }
            end
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_no_bitches'
    end
}
