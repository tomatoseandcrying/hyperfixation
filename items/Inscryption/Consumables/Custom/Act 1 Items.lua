SMODS.ConsumableType({
    key = 'hpfx_inscr_act1_items',
    primary_colour = HEX('F97717'),
    secondary_colour = G.C.BLACK,
    collection_rows = { 6, 6 },
    shop_rate = 0.3,
    text_colour = G.C.hpfx_LeshyOrange or HEX("F97717"),
    select_card = 'consumeables',
    loc_txt = {
        name = 'Leshy\'s Cabin',
        collection = 'Leshy\'s Cabin',
        undiscovered = {
            name = '???',
            text = { '{C:hpfx_LeshyOrange}\"You cannot use that now.\"{}' },
        }
    },
})

--Boulder in a Bottle
SMODS.Consumable({
    key = 'act1_boulderbottle',
    set = 'hpfx_inscr_act1_items',
    pos = { x = 0, y = 0 },
    config = { extra = { boulders = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.boulders } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.boulders do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Base', enhancement = 'm_hpfx_boulder' })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end,
    can_use = function(self, card)
        local is_in_blind = G.GAME.blind.in_blind
        return G.hand and is_in_blind
    end
})
