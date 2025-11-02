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
    end,
    can_use = function(self, card)
        return G.jokers and #G.jokers.cards >= 0
    end
})

--Special Dagger
SMODS.Consumable({
    key = 'act1_specialdagger',
    set = 'hpfx_inscr_act1_items',
    pos = { x = 0, y = 0 },
    soul_pos = {
        x = 3,
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
    use = function(self, card, area, copier)
        play_sound('timpani')
        G.GAME.chips = G.GAME.chips + math.floor(0.4 * G.GAME.blind.chips)
        G.GAME.chips_text = number_format(G.GAME.chips_text)
        delay(0.6)
        local function wrightworthJokers()
            local jpool = (G.jokers and G.jokers.cards) or {}
            local jn = #jpool
            local jcount = math.floor(jn / 2)
            --Shouldn't happen since can_use checks for >=0, but just in case yk?
            if jcount <= 0 then return {} end
            local selected = {}
            for i = jn - jcount + 1, jn do
                table.insert(selected, jpool[i])
            end
            return selected
        end
        local victims = wrightworthJokers()
        for _, j in pairs(victims) do
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.4,
                func = function()
                    play_sound('timpani')
                    card:juice_up(0.3, 0.5)
                    j:juice_up(0.3, 0.5)
                    SMODS.debuff_card(j, false, 'hpfx_daggered')
                    return true
                end
            }))
        end
    end,
    can_use = function(self, card)
        local is_in_blind = G.GAME.blind.in_blind
        return G.jokers and is_in_blind and #G.jokers.cards > 0
    end
})

--Scissors
SMODS.Consumable({
    key = 'act1_scissors',
    set = 'hpfx_inscr_act1_items',
    pos = { x = 0, y = 0 },
    soul_pos = {
        x = 4,
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
    use = function(self, card, area, copier)
        play_sound('slice1', 0.96 + math.random() * 0.08)
        G.GAME.blind.chips = math.floor(G.GAME.blind.chips - G.GAME.blind.chips * 0.5)
        G.GAME.blind.chip_text = number_format(G.GAME.blind.chips)
        delay(0.6)
    end,
    can_use = function(self, card)
        local is_in_blind = G.GAME.blind.in_blind
        return is_in_blind and G.GAME.blind.boss and G.GAME.blind.chips > 0
    end
})
