SMODS.Joker({
    key = 'tetoraq',
    rarity = 'nic_teto',
    atlas = 'Tetoraq',
    pos = { x = 0, y = 0 },
    soul_pos = { 
        x = 1, 
        y = 0,
        draw = function(card, scale_mod, rotate_mod)
            scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) *
                    math.pi * 14) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            rotate_mod = 0.3 * math.sin(10 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL) * math.pi * 5) *
                (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

            card.children.hpfx_floating_sprite:draw_shader('dissolve',
                0, nil, nil, card.children.center, scale_mod, nil, nil, 0.1)
            card.children.hpfx_floating_sprite:draw_shader('dissolve',
                nil, nil, nil, card.children.center, scale_mod, nil)

            card.children.floating_sprite:draw_shader('dissolve',
                0, nil, nil, card.children.center, scale_mod, rotate_mod, nil, 0.1)
            card.children.floating_sprite:draw_shader('dissolve',
                nil, nil, nil, card.children.center, scale_mod, rotate_mod)
        end
    },
    cost = 8,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra_slots_used = -1,
        extra = { iji_retriggers = 0 },
    },
    dependencies = { 'Incognito' },
    -- sprite my ass >:(
    set_sprites = function(self, card, front)
        if self.discovered or card.bypass_discovery_center then
            card.children.hpfx_floating_sprite =
                Sprite(card.T.x, card.T.y, card.T.w, card.T.h,
                    G.ASSET_ATLAS[card.config.center.atlas], {
                        x = 2,
                        y = 0
                    })
            card.children.hpfx_floating_sprite.role.draw_major = card
            card.children.hpfx_floating_sprite.states.hover.can = false
            card.children.hpfx_floating_sprite.states.click.can = false
        end
    end,
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.iji_retriggers
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'Incognito'
    end,
    calculate = function(self, card, context)
        local retrigger_joker = 0
        for _, c in pairs(G.jokers.cards) do
            if c:is_rarity('nic_teto') or c.ability.nic_tetosticker then
                retrigger_joker = retrigger_joker + 1
            end
            card.ability.extra.iji_retriggers = retrigger_joker
        end
        if context.retrigger_joker_check
            and context.other_card.config.center_key == 'j_hpfx_ijiraq' then
            return {
                repetitions = card.ability.extra.iji_retriggers
            }
        end
    end,
    in_pool = function(self, args)
        if G.jokers then
            for _, j in ipairs(G.jokers.cards) do
                if next(SMODS.find_card('j_hpfx_ijiraq', true)) then
                    return true
                else
                    return false
                end
            end
        end
    end
})
