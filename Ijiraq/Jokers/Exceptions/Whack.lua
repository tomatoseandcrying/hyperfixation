G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{ --Hack?
    key = 'whack',
    atlas = 'IjiraqJokers',
    pos = {x = 5, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {
            repetitions = 1,
            played_cards = {}
        }
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.ability.extra.repetitions + 1,
            card.ability.extra.played_cards,
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_whack",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_whack_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    calculate = function(self, card, context)
    if context.repetition and
    context.cardarea == G.play then
        if (context.other_card:get_id() == 2 or
        context.other_card:get_id() == 3 or
        context.other_card:get_id() == 4 or
        context.other_card:get_id() == 5) then
            return {
                repetitions = card.ability.extra.repetitions
            }
        end
    end
    if context.before and
    context.cardarea == G.jokers then
        for _, kard in ipairs(context.scoring_hand) do
            if kard:get_id() == 2 or
            kard:get_id() == 3 or
            kard:get_id() == 4 or
            kard:get_id() == 5 then
                table.insert(
                card.ability.extra.played_cards,
                kard
                )
            end
        end
    end
    if context.after then
    local played2, played3, played4, played5 = false, false, false, false
        for _, v in ipairs(card.ability.extra.played_cards) do
            if v:get_id() == 2 then played2 = true
            elseif v:get_id() == 3 then played3 = true
            elseif v:get_id() == 4 then played4 = true
            elseif v:get_id() == 5 then played5 = true end
            if played2 and played3 and played4 and played5 then
            break end
        end
        if played2 and played3 and played4 and played5 then
            return{
                func = function()
                hpfx_Transform(card, context)
                end
            }
        end
    end
end
}