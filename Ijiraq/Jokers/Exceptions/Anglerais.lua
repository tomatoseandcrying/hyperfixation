G.C.hpfx_IjiGray = HEX('BFD7D5')
--Taken from MoreFluff
function hpfx_temp_ban(key)
    if G.GAME.banned_keys[key] == true then
        G.GAME.banned_keys[key] = 214389
    end
    if not G.GAME.banned_keys[key] then
        G.GAME.banned_keys[key] = 214389
    elseif type(G.GAME.banned_keys[key]) == 'number'
    and G.GAME.banned_keys[key] % 214389 == 0 then
        G.GAME.banned_keys[key] = G.GAME.banned_keys[key] + 214389
    end
end
--This too
function hpfx_temp_unban(key)
    if G.GAME.banned_keys[key] == 214389 then
        G.GAME.banned_keys[key] = nil
    elseif type(G.GAME.banned_keys[key]) == "number"
    and G.GAME.banned_keys % 214389 == 0 then
        G.GAME.banned_keys[key] = G.GAME.banned_keys[key] - 214389
    end
end

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
                            'c_fool', 'c_high_priestess', 'c_emperor',
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

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
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
                                'c_fool', 'c_magician', 'c_high_priestess',
                                'c_empress', 'c_emperor', 'c_heirophant',
                                'c_lovers', 'c_chariot', 'c_justice',
                                'c_hermit', 'c_wheel_of_fortune',
                                'c_strength', 'c_hanged_man', 'c_temperance',
                                'c_devil', 'c_moon', 'c_judgement'
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
                            set = 'Spectral', key = 'c_cryptid',
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
            elseif b == 'bl_tooth' then --2 Talisman | Tooth
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_talisman',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_talisman',
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
            elseif b == 'bl_wall' or b == 'bl_water' or b == 'bl_plant' or b == 'bl_final_vessel' or b == 'bl_final_heart' then --Nope!
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            SMODS.calculate_effect({
                            message = localize('k_nope_ex'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)
                            G.GAME.consumeable_buffer = 0
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_final_bell' then --Death + Hanged Man | Cerulean Bell
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_death',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_hanged_man',
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
            elseif b == 'bl_wheel' then --Tarot Card (Enhancement) + Ouija + WOF | Wheel
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchicwheel = {
                            'c_fool', 'c_high_priestess', 'c_emperor',
                            'c_hermit', 'c_strength', 'c_hanged_man',
                            'c_temperance', 'c_star', 'c_moon', 'c_sun',
                            'c_judgement', 'c_world', 'c_familiar', 'c_grim',
                            'c_incantation', 'c_aura', 'c_wraith', 'c_sigil',
                            'c_ectoplasm', 'c_immolate', 'c_ankh', 'c_hex',
                            'c_cryptid', 'c_soul', 'c_black_hole'
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchicwheel do
                            hpfx_temp_ban(nonchicwheel[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_ouija',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_wheel_of_fortune',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)
                            for i = 1, #nonchicwheel do
                            hpfx_temp_unban(nonchicwheel[i]) end
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_arm' then --2 Black Hole | Arm
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_black_hole',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_black_hole',
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
            elseif b == 'bl_psychic' then --Familiar + Grim + Incantation | Psychic
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_familiar',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_grim',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_spectral'),
                            colour = G.C.SECONDARY_SET.Spectral},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_incantation',
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
            elseif b == 'bl_goad' then --Non-Spade Suit-Tarot | Goad
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchicgoad = {
                                'c_fool', 'c_magician', 'c_high_priestess',
                                'c_empress', 'c_emperor', 'c_heirophant',
                                'c_lovers', 'c_chariot', 'c_justice',
                                'c_hermit', 'c_wheel_of_fortune',
                                'c_strength', 'c_hanged_man', 'c_temperance',
                                'c_devil', 'c_world', 'c_judgement'
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchicgoad do
                            hpfx_temp_ban(nonchicgoad[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
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
            elseif b == 'bl_eye' then --Justice + Chariot | Eye
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_justice',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_chariot',
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
            elseif b == 'bl_needle' then --Justice | Needle
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_justice',
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
            elseif b == 'bl_head' then --Non-Heart Suit-Tarot | Head
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchichead = {
                                'c_fool', 'c_magician', 'c_high_priestess',
                                'c_empress', 'c_emperor', 'c_heirophant',
                                'c_lovers', 'c_chariot', 'c_justice',
                                'c_hermit', 'c_wheel_of_fortune',
                                'c_strength', 'c_hanged_man', 'c_temperance',
                                'c_devil', 'c_sun', 'c_judgement'
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchichead do
                            hpfx_temp_ban(nonchichead[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            for i = 1, #nonchichead do
                            hpfx_temp_unban(nonchichead[i]) end
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_final_leaf' then --Judgement + Wraith | Verdant Leaf
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_judgement',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_wraith',
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
            elseif b == 'bl_window' then --Non-Diamond Suit-Tarot | Window
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchicwindow = {
                                'c_fool', 'c_magician', 'c_high_priestess',
                                'c_empress', 'c_emperor', 'c_heirophant',
                                'c_lovers', 'c_chariot', 'c_justice',
                                'c_hermit', 'c_wheel_of_fortune',
                                'c_strength', 'c_hanged_man', 'c_temperance',
                                'c_devil', 'c_star', 'c_judgement'
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchicwindow do
                            hpfx_temp_ban(nonchicwindow[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            for i = 1, #nonchicwindow do
                            hpfx_temp_unban(nonchicwindow[i]) end
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_serpent' then --2 Justice | Serpent
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_justice',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_justice',
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
            elseif b == 'bl_pillar' then --Non-Suit Tarot | Pillar
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            local nonchicpillar = {
                                'c_star', 'c_moon', 'c_sun', 'c_world',
                                'c_fool', 'c_high_priestess', 'c_emperor',
                                'c_wheel_of_fortune', 'c_judgement',
                                'c_hanged_man', 'c_temperance', 'c_hermit',
                            }
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            for i = 1, #nonchicpillar do
                            hpfx_temp_ban(nonchicpillar[i]) end
                            SMODS.add_card{
                            set = 'Tarot',
                            key_append = 'hpfx_anglerais'}
                            G.GAME.consumeable_buffer = 0
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            for i = 1, #nonchicpillar do
                            hpfx_temp_unban(nonchicpillar[i]) end
                            return true end)
                        }))
                    end
                }
            elseif b == 'bl_flint' then --Empress and Hierophant | Flint
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_empress',
                            key_append = 'hpfx_anglerais'}
                            return true end}))

                            SMODS.calculate_effect({
                            message = localize('k_plus_tarot'),
                            colour = G.C.PURPLE},
                            context.blueprint_card or card)

                            G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Tarot', key = 'c_heirophant',
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
            elseif b == 'bl_final_acorn' then --Ankh | Amber Acorn
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                        func = (function()
                            G.E_MANAGER:add_event(Event({
                            func = function()
                            SMODS.add_card{
                            set = 'Spectral', key = 'c_ankh',
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
            else return nil, true end
            G.GAME.consumeable_buffer = 0
        end
    end
}