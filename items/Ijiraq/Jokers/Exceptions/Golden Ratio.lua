G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'golden_ratio',
    pos = { x = 1, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 8,
            played_cards = {}
        }
    },
    loc_vars = function(self, info_queue, card)
        local p2, p3, p5, p8, pA = false, false, false, false, false
        for _, v in ipairs(card.ability.extra.played_cards) do
            if v:get_id() == 2 then
                p2 = true
            elseif v:get_id() == 3 then
                p3 = true
            elseif v:get_id() == 5 then
                p5 = true
            elseif v:get_id() == 8 then
                p8 = true
            elseif v:get_id() == 14 then
                pA = true
            end
            if p2 and p3 and p5 and p8 and pA then
                break
            end
        end
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.played_cards,
                card.area and card.area == G.jokers and "...?" or "",
                pA and "■" or "Ace",
                p2 and "■" or "2",
                p3 and "■" or "3",
                p5 and "■" or "5",
                p8 and "■" or "8"
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_golden_ratio",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_golden_ratio_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers then
            for _, gard in ipairs(context.scoring_hand) do
                if gard:get_id() == 2 or gard:get_id() == 3 or
                    gard:get_id() == 5 or gard:get_id() == 8 or
                    gard:get_id() == 14 then
                    table.insert(card.ability.extra.played_cards, gard)
                end
            end
        end
        if context.individual and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 5 or
                context.other_card:get_id() == 8 or
                context.other_card:get_id() == 14 then
                return {
                    mult = card.ability.extra.mult
                }
            end
        end
        if context.after then
            local p2, p3, p5, p8, pA = false, false, false, false, false
            for _, v in ipairs(card.ability.extra.played_cards) do
                if v:get_id() == 2 then
                    p2 = true
                elseif v:get_id() == 3 then
                    p3 = true
                elseif v:get_id() == 5 then
                    p5 = true
                elseif v:get_id() == 8 then
                    p8 = true
                elseif v:get_id() == 14 then
                    pA = true
                end
                if p2 and p3 and p5 and p8 and pA then
                    break
                end
            end
            if p2 and p3 and p5 and p8 and pA then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
