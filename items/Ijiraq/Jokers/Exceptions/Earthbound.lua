G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'earthbound',
    pos = { x = 7, y = 12 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 1,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            dollars = 1
        }
    },
    loc_vars = function(self, info_queue, card)
        local nine_tally = 0
        if G.playing_cards then
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
            end
        end
        return {
            vars = {
                card.ability.extra.dollars,
                card.ability.extra.dollars * nine_tally,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_earthbound",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_earthbound_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calc_dollar_bonus = function(self, card)
        local nine_tally = 0
        for _, playing_card in ipairs(G.playing_cards) do
            if playing_card:get_id() == 9 then nine_tally = nine_tally + 1 end
        end
        return nine_tally > 0 and card.ability.extra.dollars * nine_tally or nil
    end
}
