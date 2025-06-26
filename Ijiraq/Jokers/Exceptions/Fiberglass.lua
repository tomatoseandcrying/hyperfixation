G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'fiberglass',
    pos = {x = 1, y = 3},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            xmult_gain = 0.75,
            xmult = 4
        }
    },
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue+1] = G.P_CENTERS.m_glass
        return{
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or ""
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
        card.ability.extra.new_key = "j_hpfx_chaoz_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local glass_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card.shattered then glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                return {
                func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                    G.E_MANAGER:add_event(Event({
                    func = function()
                        card.ability.extra.xmult = 
                        card.ability.extra.xmult -
                        card.ability.extra.xmult_gain * 
                        glass_cards return true
                        end
                    }))
                    SMODS.calculate_effect(
                        {
                        message = localize
                        { 
                        type = 'variable', 
                        key = 'a_xmult', 
                        vars = { 
                            card.ability.extra.xmult -
                            card.ability.extra.xmult_gain * 
                            glass_cards 
                        } }
                        }, card)
                    return true
                    end
                    }))
                end
                }
            end
        end
        if context.using_consumeable and 
        not context.blueprint and 
        context.consumeable.config.center.key == 'c_hanged_man' then
            local glass_cards = 0
            for _, removed_card in ipairs(G.hand.highlighted) do
                if SMODS.has_enhancement(removed_card, 'm_glass') then 
                glass_cards = glass_cards + 1 end
            end
            if glass_cards > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult +
                    card.ability.extra.xmult_gain * glass_cards
                return {
                    message = localize {
                        type = 'variable', 
                        key = 'a_xmult', 
                        vars = {
                            card.ability.extra.xmult 
                        } }
                }
            end
        end
        if context.joker_main then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        local glassmultcount = (card.ability.extra.xmult - 
        card.ability.extra.xmult_gain * glass_cards)
        if context.main_eval and glassmultcount == 0 then
            return {
                func = function ()
                    hpfx_Transform(card, context)
                end
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