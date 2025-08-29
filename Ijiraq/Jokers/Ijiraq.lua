SMODS.Joker { --Ijiraq.
    key = 'ijiraq',
    pos = { x = 0, y = 9 },
    soul_pos = { x = 1, y = 9 },
    no_mod_badges = false,
    unlocked = true,
    discovered = false,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = false,
    display_size = { w = 71, h = 95 },
    config = {
        extra = {
            jkey = 'ijiraq',
        }
    },
    loc_vars = function(self, info_queue, card)
        if G.jokers and card.area == G.jokers then
            for _, v in pairs(G.GAME.raqeffects) do
                if G.P_CENTERS[v].loc_vars then
                    if not G.P_CENTERS[v].original_mod then
                        vars = G.P_CENTERS[v]:loc_vars({}, G.P_CENTERS[v]).vars
                    else
                        vars = G.P_CENTERS[v]:loc_vars({}, { ability = G.GAME.hpfx_ijiraq_savedvalues[card.sort_id][v] })
                            .vars
                    end
                else
                    vars = Card.generate_UIBox_ability_table({
                        ability = G.GAME.hpfx_ijiraq_savedvalues[card.sort_id][v],
                        config = { center = G.P_CENTERS[v] }
                    }, true)
                    --print(vars)
                    --print(G.GAME.hpfx_ijiraq_savedvalues[card.sort_id][v])
                end
                info_queue[#info_queue + 1] = {
                    ijiraq = true,
                    set = "Joker",
                    key = v,
                    vars = vars
                }
            end
        end
        return {
            vars = {
                card.ability.extra.jkey,
            }
        }
    end,
    in_pool = function(self, args)
        return false
    end,
    add_to_deck = function(self, card, from_debuff)
        card:remove_sticker('hpfx_priceless')
        for k, v in ipairs(SMODS.find_card('j_hpfx_ijiraq')) do --Only 1 Ijiraq.
            if v ~= card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        SMODS.calculate_effect({
                                message = 'Fall.',
                                colour = G.C.RED,
                                sound = 'hpfx_fall'
                            },
                            card)
                        return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function()
                        v:start_dissolve({ G.C.RED }, nil, 1.6)
                        return true
                    end
                }))
            end
        end
        for _, v in pairs(G.GAME.raqeffects) do
            local found = false
            if v == 'j_drunkard' or v == 'j_troubadour' or v == 'j_ring_master' or v == 'j_stuntman' then found = true end
            if found then
                if v == 'j_drunkard' then
                    ease_discard(1, true, true)
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards + 1
                elseif v == 'j_troubadour' then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands - 1
                    G.hand:change_size(2)
                elseif v == 'j_ring_master' then
                    local ijishowman = SMODS.showman
                    function SMODS.shortcut()
                        if next(SMODS.find_card('j_hpfx_ijiraq')) then
                            return true
                        end
                        return ijishowman()
                    end
                elseif v == 'j_stuntman' then
                    G.hand:change_size(-2)
                end
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, v in pairs(G.GAME.raqeffects) do
            local found = false
            if v == 'j_drunkard' or v == 'j_troubadour' or v == 'j_stuntman' then found = true end
            if found then
                if v == 'j_drunkard' then
                    ease_discard(-1, true, true)
                    G.GAME.round_resets.discards = G.GAME.round_resets.discards - 1
                elseif v == 'j_troubadour' then
                    G.GAME.round_resets.hands = G.GAME.round_resets.hands + 1
                    G.hand:change_size(-2)
                elseif v == 'j_stuntman' then
                    G.hand:change_size(-2)
                end
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        local totalcash = 0
        if not card:can_calculate() then return end
        for _, v in pairs(G.GAME.raqeffects) do
            local joker = G.P_CENTERS[v]
            if v == 'j_golden' then
                totalcash = totalcash + 4
            end
            if v == 'j_cloud_9' then
                local nine_tally = 0
                for _, pcard in ipairs(G.playing_cards) do
                    if pcard:get_id() == 9 then nine_tally = nine_tally + 1 end
                end
                if nine_tally > 0 then
                    totalcash = totalcash + (1 * nine_tally)
                end
            end
            if v == 'j_rocket' then
                totalcash = totalcash + 1
            end
            if v == 'j_satellite' then
                local planets_used = 0
                for k, _v in pairs(G.GAME.consumeable_usage) do
                    if _v.set == 'Planet' then planets_used = planets_used + 1 end
                end
                totalcash = totalcash + (1 * planets_used)
            end
            if v == 'j_delayed_grat' and G.GAME.current_round.discards_used == 0
                and G.GAME.current_round.discards_left > 0 then
                totalcash = totalcash + (2 * G.GAME.current_round.discards_left)
            end
            --Auto-setup for modded Jokers.
            if joker and joker.calc_dollar_bonus and type(joker.calc_dollar_bonus) == 'function' then
                local bonus = joker:calc_dollar_bonus(card)
                if bonus and bonus > 0 then
                    totalcash = totalcash + bonus
                end
            end
        end
        if totalcash > 0 then return totalcash end
    end,
    calculate = function(self, card, context)
        if context.modify_scoring_hand and not context.blueprint then --And Splash
            for _, v in pairs(G.GAME.raqeffects) do
                local found = false
                if v == 'j_splash' then found = true end
                if found then return { add_to_hand = true } end
            end
        end
        if context.check_eternal and not context.blueprint then --And Mr. Bones
            for _, v in pairs(G.GAME.raqeffects) do
                local found = false
                if v == 'j_mr_bones' then found = true end
                if found then return { no_destroy = { override_compat = true } } end
            end
        end
    end
}
