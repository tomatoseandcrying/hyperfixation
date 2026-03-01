G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'card',
    pos = { x = 3, y = 13 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 'hpfx_infrequent',
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            sell_value = 1,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.sell_value,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_card",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_card_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and context.main_eval then
            if next(SMODS.find_card("j_hpfx_earthbound")) then
                for i = 1, #G.playing_cards do
                    if G.playing_cards[i]:get_id() == 9 then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                G.playing_cards[i]:juice_up()
                                play_sound('gold_seal')
                                G.playing_cards[i]:set_seal('Gold', nil, true)
                                return true
                            end
                        }))
                        delay(0.1)
                    end
                end
            end
            for _, area in ipairs({ G.jokers, G.consumeables }) do
                for _, other_card in ipairs(area.cards) do
                    if other_card.set_cost then
                        other_card.ability.extra_value = (other_card.ability.extra_value or 0) -
                            card.ability.extra.sell_value
                        other_card:set_cost()
                    end
                end
            end
            return {
                message = localize('hpfx_val_down'),
                colour = G.C.MONEY,
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
