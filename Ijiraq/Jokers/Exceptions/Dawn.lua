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
            has_logged = false
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
            card.ability = { extra = { saved_cards = {}, has_logged = false } }
        elseif not card.ability.extra then
            card.ability.extra = { saved_cards = {}, has_logged = false }
        end
    end,
    calculate = function(self, card, context)
        if not card.ability then
            card.ability = { extra = { saved_cards = {}, has_logged = false } }
        elseif not card.ability.extra then
            card.ability.extra = { saved_cards = {}, has_logged = false }
        end
        local extra = card.ability.extra

        if context.before then
            extra.saved_cards = {}
            for _, v in ipairs(context.full_hand or {}) do
                table.insert(extra.saved_cards, v)
            end
            extra.has_logged = false
            return
        end

        -- Only run duplication once per hand, after scoring
        if context.repetition and context.cardarea == G.play
            and G.GAME.current_round.hands_left == 0 and not extra.has_logged then
            extra.has_logged = true -- <--- Set this here to prevent double duplication

            G.E_MANAGER:add_event(Event({
                trigger = 'immediate',
                delay = 0.01,
                func = function()
                    for _, v in ipairs(extra.saved_cards) do
                        local _card = copy_card(v, nil, nil, G.playing_card)
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
                    end
                    return true
                end
            }))
            return {
                repetitions = card.ability.extra.repetitions,
                message = localize('k_copied_ex'),
                colour = G.C.CHIPS,
                func = function()
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            SMODS.calculate_context({
                                playing_card_added = true,
                                cards = _card
                            })
                            hpfx_Transform(card, context)
                            return true
                        end
                    }))
                end
            }
        end
        if context.end_of_round then
            extra.saved_cards = {}
            extra.has_logged = false
            return
        end
    end
}
