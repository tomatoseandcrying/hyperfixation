SMODS.Joker {
    key = 'space_needle',
    rarity = 2,
    atlas = 'Jokers4Fun',
    pos = { x = 2, y = 0 },
    cost = 6,
    unlocked = false,
    discovered = false,
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        needled = ':3',
        trig == false,
        planetante = false,
        extra = { odds = 3 }
    },
    loc_vars = function(self, info_queue, card)
        local num, dem = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'hpfx_space_needle')
        if card.area and card.area == G.jokers then
            info_queue[#info_queue + 1] = {
                set = "Other",
                key = "hpfx_needlecon",
                vars = { card.ability.needled }
            }
        end
        return { vars = { num, dem } }
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.needled = (Hyperfixation and Hyperfixation.allcalcs[math.floor(pseudorandom('needle', 1, #Hyperfixation.allcalcs))]) or
            ':3'
    end,
    calculate = function(self, card, context)
        if context[card.ability.needled] then
            if SMODS.pseudorandom_probability(card, 'hpfx_space_needle', 1, card.ability.extra.odds) and card.ability.trig == false then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                card.ability.trig = true
                local _planet, _hand, _tally = nil, nil, 0
                for _, handname in ipairs(G.handlist) do
                    if SMODS.is_poker_hand_visible(handname) and G.GAME.hands[handname].played > _tally then
                        _hand = handname
                        _tally = G.GAME.hands[handname].played
                    end
                end
                if _hand then
                    for _, v in pairs(G.P_CENTER_POOLS.Planet) do
                        if v.config.hand_type == _hand then
                            _planet = v.key
                        end
                    end
                end
                G.E_MANAGER:add_event(Event({
                    trigger = 'before',
                    delay = 0.0,
                    func = (function()
                        SMODS.add_card {
                            set = 'Planet',
                            key_append = 'hpfx_space_needle',
                            key = _planet
                        }
                        G.GAME.consumeable_buffer = 0
                        card.ability.planetante = true
                        return true
                    end)
                }))
                return {
                    message = card.ability.needled,
                    colour = G.C.SECONDARY_SET.Planet
                }
            end
            return
        end
        if context.pseudorandom_result and context.identifier == 'hpfx_space_needle' then
            local lastneedle = card.ability.needled
            card.ability.needled = Hyperfixation.allcalcs
            [math.floor(pseudorandom('needle', 1, #Hyperfixation.allcalcs))]
            if lastneedle ~= card.ability.needled then
                card.ability.trig = false
            end
            return {
                message = localize('k_nope_ex'),
                colour = G.C.PURPLE
            }
        end
        if context.end_of_round and context.beat_boss and context.main_eval and card.ability.planetante == false then
            local hand_table = G.handlist
            local filtered_hand_table = {}
            for _, v in ipairs(hand_table) do
                table.insert(filtered_hand_table, v)
            end
            for _, v in ipairs(filtered_hand_table) do
                SMODS.smart_level_up_hand(card, v, true, 1)
            end
            return { message = 'Good Ol\' Seattle!', colour = G.C.SECONDARY_SET.Planet, message_card = card }
        else
            card.ability.planetante = false
        end
    end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_needle'
    end,
}
