G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'dawn',
    pos = {x = 4, y = 7},
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
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
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
    end,
    calculate = function(self, card, context)
        if context.repetition and context.cardarea == G.play
        and G.GAME.current_round.hands_left == 0 then
            local copies = {}
            for _, scored_card in ipairs(context.scoring_hand) do
                G.playing_card = (G.playing_card and G.playing_card + 1) or 1
                local copy_card = copy_card(scored_card, nil, nil, G.playing_card)
                copy_card:add_to_deck()
                G.deck.config.card_limit = G.deck.config.card_limit + 1
                table.insert(G.playing_cards, copy_card)
                G.hand:emplace(copy_card)
                copy_card.states.visible = nil
                G.E_MANAGER:add_event(Event({
                    func = function()
                        copy_card:start_materialize()
                        return true
                    end
                }))
                table.insert(copies, copy_card)
            end
            if #copies > 0 then
                return {
                    message = localize('k_copied_ex'),
                    colour = G.C.CHIPS,
                    repetitions = card.ability.extra.repetitions,
                    func = function()
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                SMODS.calculate_context({
                                    playing_card_added = true,
                                    cards = copies
                                })
                                hpfx_Transform(card, context)
                                return true
                            end
                        }))
                    end
                }
            end
        end
    end
}