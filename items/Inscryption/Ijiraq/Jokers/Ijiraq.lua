SMODS.Joker { --Ijiraq.
    key = 'ijiraq',
    pos = { x = 0, y = 0 },
    soul_pos = {
        x = 1,
        y = 0,
        draw = function(card, scale_mod, rotate_mod)
            scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) +
                0.00 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) *
                    math.pi * 14) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
            rotate_mod = 0.2 * math.sin(1.219 * G.TIMERS.REAL) +
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
    no_mod_badges = false,
    unlocked = true,
    discovered = false,
    rarity = 3,
    cost = 8,
    atlas = 'Ijiraq',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    display_size = { w = 71, h = 95 },
    config = {},
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
    -- loc_vars rewrite fix
    loc_vars = function(self, info_queue, card)
        if not (G.jokers and card and card.area == G.jokers) then return end
        local raq = Hyperfixation and Hyperfixation.raqeffects
        local saved = G.GAME and G.GAME.hpfx_ijiraq_savedvalues
        if not raq then return end

        for _, v in pairs(raq) do
            local vars = {}
            local center = G.P_CENTERS and G.P_CENTERS[v]

            if center then
                if center.loc_vars then
                    if not center.original_mod then
                        local out = center:loc_vars({}, center)
                        vars = (out and out.vars) or {}
                    else
                        local ability_entry = saved and saved[card.sort_id] and saved[card.sort_id][v]
                        local out = center:loc_vars({}, { ability = ability_entry })
                        vars = (out and out.vars) or {}
                    end
                else
                    local ability_entry = saved and saved[card.sort_id] and saved[card.sort_id][v]
                    local ok, out = pcall(function()
                        return Card.generate_UIBox_ability_table({
                            ability = ability_entry,
                            config = { center = center }
                        }, true)
                    end)
                    if ok and out then vars = out else vars = {} end
                end
            else
                -- missing center definition; keep vars empty to avoid nil indexing downstream
                vars = {}
            end

            if v == 'j_luchador' and G.GAME and G.GAME.blind and not G.GAME.blind.boss then
                info_queue[#info_queue + 1] = {
                    ijiraq = true,
                    key = 'hpfx_troll',
                    set = 'Other'
                }
            else
                info_queue[#info_queue + 1] = {
                    ijiraq = true,
                    set = "Joker",
                    key = v,
                    vars = vars
                }
            end
        end
    end,
    in_pool = function(self, args) return false end,
    update = function(self, card, dt)
        if Incognito and next(SMODS.find_card('j_hpfx_tetoraq', false)) then
            card.config.center.rarity = 'nic_teto'
        else
            card.config.center.rarity = 3
        end
    end,
    add_to_deck = function(self, card, from_debuff)
        if Incognito then
            check_for_unlock({ type = 'Incognito' })
        end
        -- Removes other copies of Ijiraq
        --
        card.ability.allgone = false
        card:remove_sticker('hpfx_priceless')
        local raqjug = 0
        local trigjug = 0
        for k, v in ipairs(SMODS.find_card('j_hpfx_ijiraq')) do --Only 1 Ijiraq.
            if v ~= card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end

                }))
                card.ability.allgone = true
            end
        end
        if card.ability.allgone and card:can_calculate() then --prevents message spam
            if SMODS.pseudorandom_probability(card, 'hpfx_ijiraq', 1, 10) then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.calculate_effect({
                                message = 'FAAHHH!',
                                colour = G.C.RED,
                                sound = 'hpfx_faaaah'
                            },
                            card)
                        card.ability.allgone = false
                        return true
                    end
                }))
            else
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.calculate_effect({
                                message = 'Fall.',
                                colour = G.C.RED,
                                sound = 'hpfx_fall'
                            },
                            card)
                        card.ability.allgone = false
                        return true
                    end
                }))
            end
        end

        --Applies effects that shouldn't stack in mass iterator
        --
        for _, v in pairs(Hyperfixation.raqeffects) do --juggler stacks
            if v == 'j_juggler' then
                raqjug = raqjug + 1
            end
        end
        for i, trig_v in ipairs(Hyperfixation.trig) do --juggler procs
            if trig_v == 'j_juggler' then
                trigjug = trigjug + 1
            end
        end
        local to_add = raqjug - trigjug
        for i = 1, to_add do --juggler increase
            G.hand:change_size(1)
            table.insert(Hyperfixation.trig, 'j_juggler')
        end
        for _, v in pairs(Hyperfixation.raqeffects) do
            if v == 'j_stuntman' then
                G.hand:change_size(-2)
                table.insert(Hyperfixation.trig, v)
            end
        end
        --Effects that can stack in mass iterator
        --
        for _, v in pairs(Hyperfixation.raqeffects) do
            if v == 'j_chaos' then
                SMODS.change_free_rerolls(1)
                table.insert(Hyperfixation.trig, v)
            end
            if v == 'j_turtle_bean' then
                G.hand:change_size(5)
                table.insert(Hyperfixation.trig, v)
            end
            if v == 'j_drunkard' then
                ease_discard(1, true, true)
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                table.insert(Hyperfixation.trig, v)
            end
            if v == 'j_troubadour' then
                G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
                G.hand:change_size(2)
                table.insert(Hyperfixation.trig, v)
            end
            if v == 'j_ring_master' then
                local ijishowman = SMODS.showman
                function SMODS.showman()
                    if next(SMODS.find_card('j_hpfx_ijiraq')) then return true end
                    return ijishowman()
                end

                table.insert(Hyperfixation.trig, v)
            end
            if v == 'j_four_fingers' then
                local ijifour = SMODS.four_fingers
                function SMODS.four_fingers()
                    if next(SMODS.find_card('j_hpfx_ijiraq')) then return 4 end
                    return ijifour()
                end

                table.insert(Hyperfixation.trig, v)
            else
                local ijifour = SMODS.four_fingers
                function SMODS.four_fingers()
                    if next(SMODS.find_card('j_hpfx_ijiraq')) then return 5 end
                    return ijifour()
                end
            end
            if v == 'j_pareidolia' then
                local ijiface = Card.is_face
                function Card:is_face(from_boss)
                    return ijiface(self, from_boss) or (self:get_id() and next(SMODS.find_card("j_hpfx_ijiraq")))
                end

                table.insert(Hyperfixation.trig, v)
            end
            if v == 'j_credit_card' then
                G.GAME.bankrupt_at = G.GAME.bankrupt_at - 20
                table.insert(Hyperfixation.trig, v)
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        local weAreTheIjilings = SMODS.find_card("j_hpfx_ijiraq")
        local GiveUsYourEffectStacks = 0
        for GETTHEFUCK, OUTOFMYHOUSE in ipairs(weAreTheIjilings) do
            if OUTOFMYHOUSE ~= card then
                GiveUsYourEffectStacks = GiveUsYourEffectStacks + 1
            end
        end
        for _, v in pairs(Hyperfixation.raqeffects) do
            if v == 'j_stuntman' then
                for eat, shit in ipairs(Hyperfixation.trig) do
                    if shit == v then
                        G.hand:change_size(-2)
                        table.remove(Hyperfixation.trig, eat)
                        break
                    end
                end
            end
            if v == 'j_juggler' then
                if GiveUsYourEffectStacks == 0 then
                    local to_remove = {}
                    for i, trig_v in ipairs(Hyperfixation.trig) do
                        if trig_v == 'j_juggler' then
                            table.insert(to_remove, i)
                        end
                    end
                    for i = #to_remove, 1, -1 do
                        G.hand:change_size(-1)
                        table.remove(Hyperfixation.trig, to_remove[i])
                    end
                end
            end
            if v == 'j_chaos' then
                for eat, shit in ipairs(Hyperfixation.trig) do
                    if shit == v then
                        SMODS.change_free_rerolls(-1)
                        table.remove(Hyperfixation.trig, eat)
                        break
                    end
                end
            end
            if v == 'j_turtle_bean' then
                for eat, shit in ipairs(Hyperfixation.trig) do
                    if shit == v then
                        G.hand:change_size(-5)
                        table.remove(Hyperfixation.trig, eat)
                        break
                    end
                end
            end
            if v == 'j_drunkard' then
                for eat, shit in ipairs(Hyperfixation.trig) do
                    if shit == v then
                        ease_discard(-1, true, true)
                        G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
                        table.remove(Hyperfixation.trig, eat)
                        break
                    end
                end
            end
            if v == 'j_troubadour' then
                for eat, shit in ipairs(Hyperfixation.trig) do
                    if shit == v then
                        G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                        G.hand:change_size(-2)
                        table.remove(Hyperfixation.trig, eat)
                        break
                    end
                end
            end
            if v == 'j_credit_card' then
                for eat, shit in ipairs(Hyperfixation.trig) do
                    if shit == v then
                        G.GAME.bankrupt_at = G.GAME.bankrupt_at + 20
                        table.remove(Hyperfixation.trig, eat)
                        break
                    end
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local totalcash = 0
        if not card:can_calculate() then return end
        for _, v in pairs(Hyperfixation.raqeffects) do
            local _card = SMODS.create_card({ key = v, no_edition = true, skip_materialize = true })
            -- makes the card riculously small and way offscreen
            _card:hard_set_T(420, 420, 0, 0)
            totalcash = totalcash + (_card:calculate_dollar_bonus() or 0)
        end
        if totalcash > 0 then return totalcash end
    end,
    calculate = function(self, card, context)
        if context.modify_scoring_hand and not context.blueprint then
            for _, v in pairs(Hyperfixation.raqeffects) do
                if v == 'j_splash' then
                    --print('Splash!')
                    return { add_to_hand = true }
                end
            end
        end
        if context.end_of_round then
            for _, v in pairs(Hyperfixation.raqeffects) do
                if v == 'j_turtle_bean' then
                    if context.game_over == false and context.main_eval then
                        if G.hand.config.card_limit - 1 <= 0 then
                            table.remove(Hyperfixation.raqeffects, _)
                            return {
                                message = localize('k_eaten_ex'),
                                colour = G.C.FILTER
                            }
                        else
                            G.hand.config.card_limit = G.hand.config.card_limit - 1
                            G.hand:change_size(-1)
                            return {
                                message = localize { type = 'variable', key = 'a_handsize_minus', vars = { 1 } },
                                colour = G.C.FILTER
                            }
                        end
                    end
                end
            end
        end
    end
}
