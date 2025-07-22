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
        extra = { jkey = 'ijiraq', d_size = 1 }
    },
    loc_vars = function(self, info_queue, card)
        if G.jokers then
            for _, v in pairs(G.GAME.raqeffects) do
                if G.P_CENTERS[v].loc_vars then
                    vars = G.P_CENTERS[v]:loc_vars({}, G.P_CENTERS[v]).vars
                else
                    vars = Card.generate_UIBox_ability_table({
                        ability = G.GAME.hpfx_ijiraq_savedvalues[card.sort_id][v],
                        config = { center = G.P_CENTERS[v] }
                    }, true)
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
                card.ability.extra.d_size
            }
        }
    end,
    in_pool = function(self, args)
        return false
    end,
    add_to_deck = function(self, card, from_debuff)
        card:remove_sticker('hpfx_priceless')
        for k, v in ipairs(SMODS.find_card('j_hpfx_ijiraq')) do
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
        for _, v in pairs(G.GAME.raqeffects) do --Drunkard
            local found = false
            if v == 'j_drunkard' then
                found = true
            end
            if found then
                ease_discard(card.ability.extra.d_size, true, true)
                G.GAME.round_resets.discards = G.GAME.round_resets.discards + card.ability.extra.d_size
            end
        end
    end,
    remove_from_deck = function(self, card, from_debuff)
        for _, v in pairs(G.GAME.raqeffects) do
            local found = false
            if v == 'j_drunkard' then
                found = true
            end
            if found then
                ease_discard(-card.ability.extra.d_size, true, true)
                G.GAME.round_resets.discards = G.GAME.round_resets.discards - card.ability.extra.d_size
            end
        end
    end,
    calc_dollar_bonus = function(self, card)
        for _, v in pairs(G.GAME.raqeffects) do --And Golden Joker
            local bonus = 4
            local found = false
            if v == 'j_golden' then
                found = true
            end
            if found then return bonus end
        end
    end,
    calculate = function(self, card, context)
        if context.modify_scoring_hand and not context.blueprint then --And Splash
            for _, v in pairs(G.GAME.raqeffects) do
                local found = false
                if v == 'j_splash' then
                    found = true
                end
                if found then return { add_to_hand = true } end
            end
        end
        if context.check_eternal and not context.blueprint then --And Mr. Bones
            for _, v in pairs(G.GAME.raqeffects) do
                local found = false
                if v == 'j_mr_bones' then
                    found = true
                end
                if found then return { no_destroy = { override_compat = true } } end
            end
        end
    end
}
