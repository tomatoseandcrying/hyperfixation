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
    soul_pos = {
        x = 1,
        y = 0,
        draw = function(card, scale_mod, rotate_mod)
            scale_mod = 0.05 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) *
                    math.pi * 14) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL) * math.pi * 5) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2
            card.children.floating_sprite:draw_shader('dissolve',
                nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    },
    atlas = 'InscryptionAct1Items',
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

--Squirrel in a Bottle
SMODS.Consumable({
    key = 'act1_squirrelbottle',
    set = 'hpfx_inscr_act1_items',
    pos = { x = 0, y = 0 },
    soul_pos = {
        x = 2,
        y = 0,
        draw = function(card, scale_mod, rotate_mod)
            scale_mod = 0.05 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) *
                    math.pi * 14) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL) * math.pi * 5) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2
            card.children.floating_sprite:draw_shader('dissolve',
                nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    },
    atlas = 'InscryptionAct1Items',
    config = { extra = { squirrels = 1 } },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.squirrels } }
    end,
    use = function(self, card, area, copier)
        for i = 1, card.ability.extra.squirrels do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    SMODS.add_card({ set = 'Joker', key = 'j_hpfx_squirrel' })
                    card:juice_up(0.3, 0.5)
                    return true
                end
            }))
        end
        delay(0.6)
    end
})
