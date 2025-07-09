G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'anglerais',
    pos = {x = 6, y = 8},
    soul_pos = {x = 6, y = 9},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 4,
    cost = 20,
    atlas = 'IjiraqJokers',
    config = {extra = {}},
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_anglerais",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_anglerais_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.setting_blind and not context.blueprint and #G.consumeables.cards
        + G.GAME.consumeable_buffer < G.consumeables.config.card_limit then
            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
            local b = G.GAME.blind.config.blind.key
            if b == 'bl_ox' then --Hermit | Ox
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_hermit',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_hook' then --Medium | Hook
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_medium',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
                            context.blueprint_card or card)
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_mouth' then --Planet Card (Telescope Effect) | Mouth
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            local m_planet, m_hand, m_tally = nil, nil, 0
                            for _, v in ipairs(G.handlist) do
                            if G.GAME.hands[v].visible and
                            G.GAME.hands[v].played > m_tally then
                            m_tally = G.GAME.hands[v].played
                            m_hand = v end end

                            if m_hand then for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                            if v.config.hand_type == m_hand then m_planet = v.key end end end

                            SMODS.add_card{
                            set = 'Planet', key = m_planet,
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_planet'),
                            colour = G.C.SECONDARY_SET.Planet},
                            context.blueprint_card or card)
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_fish' or b == 'bl_house' or b == 'bl_mark' then --Tarot Card (Enhancement) + Seal | Fish, House, Mark
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchicfish = {
                            'c_fool', 'c_highpriestess', 'c_emperor',
                            'c_hermit', 'c_wheel_of_fortune', 'c_strength',
                            'c_hanged_man', 'c_temperance', 'c_star',
                            'c_moon', 'c_sun', 'c_judgement', 'c_world',
                            'c_familiar', 'c_grim', 'c_incantation', 'c_aura',
                            'c_wraith', 'c_sigil', 'c_ouija', 'c_ectoplasm',
                            'c_immolate', 'c_ankh', 'c_hex', 'c_cryptid',
                            'c_soul', 'c_black_hole'
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchicfish do
                            hpfx_temp_ban(nonchicfish[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            for i = 1, #nonchicfish do
                            hpfx_temp_unban(nonchicfish[i]) end
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_club' then --Non-Club Suit-Tarot | Club
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchicclub = {
                                'c_fool', 'c_magician', 'c_highpriestess',
                                'c_empress', 'c_emperor', 'c_heirophant',
                                'c_lovers', 'c_chariot', 'c_justice',
                                'c_hermit', 'c_wheel_of_fortune',
                                'c_strength', 'c_hanged_man', 'c_temperance',
                                'c_devil', 'c_tower', 'c_judgement'
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchicclub do
                            hpfx_temp_ban(nonchicclub[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            for i = 1, #nonchicclub do
                            hpfx_temp_unban(nonchicclub[i]) end
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_manacle' then --Cryptid | Manacle
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_cryptid',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_tooth' then --2 Talisman | Tooth
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_talisman',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_talisman',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_wall' then --Jack and Shit | Wall
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.calculate_effect({
                            message = localize('k_nope_ex')},
                            context.blueprint_card or card)
                            G.GAME.consumeable_buffer = 0
                            return true end)
                        }))
                    end
                }
            else return nil, true end
            
        end
    end
}