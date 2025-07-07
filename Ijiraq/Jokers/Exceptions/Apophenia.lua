G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'apophenia',
    pos = {x = 6, y = 3},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {extra = {}},
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_apophenia",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_apophenia_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        for _, pard in ipairs(G.playing_cards) do
            if not pard:get_id() == 11 or not pard:get_id() == 12 or not pard:get_id() == 13 then
                SMODS.destroy_cards(pard)
            end
        end
        func = function ()
            hpfx_Transform(card, context)
        end
    end
}