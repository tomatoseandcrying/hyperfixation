G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'fiberglass',
    pos = { x = 1, y = 3 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        trig = false,
        extra = {
            xmult_gain = 0.75,
            xmult = 4,
        }
    },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = G.P_CENTERS.m_glass
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_fiberglass",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_fiberglass_alt"
        card:add_sticker('hpfx_priceless')
    end,
    update = function(self, card, dt)
        local extra = card.ability and card.ability.extra or {}
        if extra.xmult <= 0 and card.ability.trig == false then
            card.ability.trig = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    hpfx_Transform(card)
                    return true
                end
            }))
        end
    end,
    calculate = function(self, card, context)
        local extra = card.ability and card.ability.extra or {}
        if context.remove_playing_cards and not context.blueprint then
            local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then
                    glass_cards = glass_cards + 1
                end
            end
            if glass_cards > 0 then
                return {
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.E_MANAGER:add_event(Event({
                                    func = function()
                                        extra.xmult = extra.xmult - (extra.xmult_gain * glass_cards)
                                        return true
                                    end
                                }))
                                SMODS.calculate_effect({
                                    message = localize {
                                        type = 'variable', key = 'a_xmult',
                                        vars = { extra.xmult - (extra.xmult_gain * glass_cards) }
                                    }
                                }, card)
                                return true
                            end
                        }))
                    end
                }
            end
        end
        if context.using_consumeable and not context.blueprint and
            context.consumeable.config.center.key == 'c_hanged_man' then
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then
                    glass_cards = glass_cards + 1
                end
            end
            if glass_cards > 0 then
                extra.xmult = extra.xmult - (extra.xmult_gain * glass_cards)
                return {
                    message = localize {
                        type = 'variable', key = 'a_xmult', vars = { extra.xmult }
                    }
                }
            end
        end
        if context.joker_main then
            return {
                xmult = extra.xmult
            }
        end
    end,
    in_pool = function(self, args)
        for _, playing_card in ipairs(G.playing_cards or {}) do
            if SMODS.has_enhancement(playing_card, 'm_glass') then
                return true
            end
        end
        return false
    end,
}
