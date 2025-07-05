G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'canio',
    pos = {x = 3, y = 8},
    soul_pos = {x = 3, y = 9},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        xmult = 1,
        xmult_gain = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_canio",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_canio_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        for _, ccard in ipairs(G.playing_cards) do
            if ccard:is_face() then
                local destroyed = {} local face_cards = 0
                SMODS.destroy_cards(ccard) table.insert(ccard, destroyed)
                face_cards = face_cards + 1
                if face_cards > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult +
                    face_cards * card.ability.extra.xmult_gain
                end
            end
        end
    end,
    calculate = function(self, card, context)
        if context.remove_playing_cards and not context.blueprint then
            local face_cards = 0
            for _, removed_card in ipairs(context.removed) do
                if removed_card:is_face() then face_cards = face_cards + 1 end
            end
            if face_cards > 0 then
                card.ability.extra.xmult = card.ability.extra.xmult +
                    face_cards * card.ability.extra.xmult_gain
                return {
                    message = localize{
                        type = 'variable',
                        key = 'a_xmult',
                        vars = {
                            card.ability.extra.xmult
                    }}}
            end
        end
    end
}