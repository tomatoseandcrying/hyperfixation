G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'tocket',
    pos = {x = 5, y = 3},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        dollars = 4,
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.ability.extra.dollars,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_tocket",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_tocket_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play
        and SMODS.has_enhancement(context.other_card, 'm_gold') then
            return {
                dollars = card.ability.extra.dollars,
                func = function() -- This is for timing purposes, it runs after the dollar manipulation
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            G.GAME.dollar_buffer = G.GAME.dollar_buffer + card.ability.extra.dollars
                            return true
                        end
                    }))
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            for _, gard in ipairs(G.playing_cards) do
                                if SMODS.has_enhancement(gard, 'm_gold') then
                                gard:set_ability('c_base', nil, true)
                                end
                            end
                            return true
                        end
                    }))
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}