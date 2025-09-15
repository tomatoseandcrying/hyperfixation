G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'dont_come_back',
    pos = { x = 8, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    config = {
        jackstack = 1,
        extra = {
            xmult_gain = 0.5,
            xmult = 1,
        }
    },
    update = function(self, card, dt)
        local jerkoff = 0
        if G.playing_cards and G.jokers then
            for _, jack in ipairs(G.playing_cards) do
                if jack:get_id() == 11 then
                    jerkoff = jerkoff + 1
                end
            end
        end
        if not card.ability.trig and jerkoff == 0 then
            card.ability.trig = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    hpfx_Transform(card)
                    return true
                end
            }))
        end
        card.ability.jackstack = jerkoff
    end,
    loc_vars = function(self, info_queue, card)
        if G.jokers and G.jokers.cards and card.area == G.jokers then
            if #G.jokers.cards > 0 then
                main_end = {}
                localize { type = 'other', key = 'hpfx_dontcount', nodes = main_end, vars = { card.ability.jackstack } }
                main_end = main_end[1]
            end
        end
        return {
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
            },
            main_end = main_end
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_dont_come_back",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_dont_come_back_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        local extra = card.ability and card.ability.extra
        if context.discard and not context.blueprint and
            context.other_card:get_id() == 11 then
            extra.xmult = extra.xmult + extra.xmult_gain
            return {
                message = localize
                    {
                        type = 'variable',
                        key = 'a_xmult',
                        vars = { extra.xmult }
                    },
                colour = G.C.RED,
                remove = true
            }
        end
        if context.joker_main then
            return {
                xmult = extra.xmult
            }
        end
        if context.end_of_round and context.game_over == false and
            context.main_eval and not context.blueprint then
            extra.xmult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
}
