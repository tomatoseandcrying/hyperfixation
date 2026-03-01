G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'flunkie',
    pos = { x = 0, y = 4 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 'hpfx_orthodox',
    cost = 4,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 4,
            chips = 20,
            dollars = 2
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.chips,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_flunkie",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_flunkie_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if next(SMODS.find_card('j_hpfx_dupla')) then
            if context.joker_main and next(context.poker_hands["Pair"]) then
                local ace = 0
                for _, c in pairs(context.scoring_hand) do
                    if c:get_id() == 14 then
                        ace = ace + 1
                    end
                end
                if ace >= 2 then
                    for i = 1, #G.playing_cards do
                        if G.playing_cards[i]:get_id() == 14 then
                            G.E_MANAGER:add_event(Event({
                                func = function()
                                    SMODS.destroy_cards(G.playing_cards[i], false, true, false)
                                    return true
                                end
                            }))
                            delay(0.1)
                        end
                    end
                end
            end
        end

        if context.individual and context.cardarea == G.play and context.other_card:get_id() == 14 then
            SMODS.destroy_cards(context.other_card, false, true, false)
            if next(SMODS.find_card('j_hpfx_pyramid')) then
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips,
                    dollars = card.ability.extra.dollars
                }
            else
                return {
                    mult = card.ability.extra.mult,
                    chips = card.ability.extra.chips,
                }
            end
        end
        if context.after then
            local ace_count = 0
            if G.playing_cards then
                for _, playing_card in ipairs(G.playing_cards) do
                    if playing_card:get_id() == 14 then
                        ace_count = ace_count + 1
                    end
                end
            end
            if ace_count == 0 then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
