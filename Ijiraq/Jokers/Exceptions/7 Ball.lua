G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = '7_ball',
    pos = {x = 0, y = 5},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {extra = {}},
    loc_vars = function (self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 4, '7ball')
        return{
            vars = {
                new_num,
                new_denom,
                card.area and card.area == G.jokers and "...?" or "",
                card.area and card.area == G.jokers and "7" or "8"
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_7_ball",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_7_ball_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play
        and #G.consumeables.cards + G.GAME.consumeable_buffer
        < G.consumeables.config.card_limit then
            if (context.other_card:get_id() == 7)
            and (pseudorandom('7_ball') < G.GAME.probabilities.normal
            / card.ability.extra.odds) then
                G.GAME.consumeable_buffer = G.GAME.consumeable_buffer + 1
                return {
                extra = {
                    message = localize('k_plus_tarot'),
                    message_card = card,
                    func = function ()
                    G.E_MANAGER:add_event(Event({
                        func = function ()
                        SMODS.add_card
                        {set = 'Tarot',
                        key_append = 'hpfx_7_ball'}
                        G.GAME.consumeable_buffer = 0
                        return true
                        end,
                    })) end
                },
                func = function ()
                    hpfx_Transform(card, context)
                end
                }
            end
        end
    end
}