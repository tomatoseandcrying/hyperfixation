G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'dawn',
    pos = { x = 4, y = 7 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            repetitions = 1,
            saved_cards = {},
            duplicated_cards = {}
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.repetitions,
                card.area and card.area == G.jokers and "...?" or "",
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_dawn",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_dawn_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        if not card.ability then
            card.ability = { extra = { saved_cards = {}, duplicated_cards = {} } }
        elseif not card.ability.extra then
            card.ability.extra = { saved_cards = {}, duplicated_cards = {} }
        end
    end,
    calculate = function(self, card, context)
        local extra = card.ability.extra
        if context.before then
            extra.saved_cards = {}
            extra.duplicated_cards = {}
            for _, v in ipairs(context.full_hand or {}) do
                table.insert(extra.saved_cards, v)
            end
            return
        end
        if context.repetition and context.cardarea == G.play
            and G.GAME.current_round.hands_left == 0 then
            return { repetitions = extra.repetitions }
        end
        if context.individual and context.cardarea == G.play and G.GAME.current_round.hands_left == 0 then
            for _, saved in ipairs(extra.saved_cards) do
                if saved == context.other_card and not extra.duplicated_cards[saved] then
                    extra.duplicated_cards[saved] = true
                    G.E_MANAGER:add_event(Event({
                        trigger = 'after',
                        delay = 0.1,
                        func = function()
                            local _card = copy_card(saved, nil, nil, G.playing_card)
                            _card:add_to_deck()
                            G.deck.config.card_limit = G.deck.config.card_limit + 1
                            table.insert(G.playing_cards, _card)
                            G.deck:emplace(_card)
                            _card.states.visible = nil

                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    _card:start_materialize()
                                    return true
                                end
                            }))
                            SMODS.calculate_context({ playing_card_added = true, cards = _card })
                            return true
                        end
                    }))
                    break
                end
            end
        end
        if context.final_scoring_step then
            return { func = function() hpfx_Transform(card, context) end }
        end
        if context.end_of_round then
            extra.saved_cards = {}
            extra.duplicated_cards = {}
            return
        end
    end
}
