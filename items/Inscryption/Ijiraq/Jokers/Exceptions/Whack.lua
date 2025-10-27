G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker { --Hack?
    key = 'whack',
    atlas = 'IjiraqJokers',
    pos = { x = 5, y = 2 },
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    rarity = 2,
    cost = 5,
    blueprint_compat = true,
    config = {
        extra = {
            repetitions = 1,
            played_cards = {},
            trig = {}
        }
    },
    loc_vars = function(self, info_queue, card)
        local p2, p3, p4, p5 = false, false, false, false
        for _, v in ipairs(card.ability.extra.played_cards) do
            if v:get_id() == 2 then
                p2 = true
            elseif v:get_id() == 3 then
                p3 = true
            elseif v:get_id() == 4 then
                p4 = true
            elseif v:get_id() == 5 then
                p5 = true
            end
            if p2 and p3 and p4 and p5 then
                break
            end
        end
        return {
            vars = {
                card.ability.extra.repetitions + 1,
                card.ability.extra.played_cards,
                (card.area and card.area == G.jokers and "...?") or "",
                (p2 and "■") or '2',
                (p3 and "■") or '3',
                (p4 and "■") or '4',
                (p5 and "■") or '5',
                card.ability.extra.trig
            }
        }
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
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers
            and context.main_eval and not context.blueprint then
            for _, kard in ipairs(context.scoring_hand) do
                if kard:get_id() == 2 or kard:get_id() == 3 or
                    kard:get_id() == 4 or kard:get_id() == 5 then
                    table.insert(card.ability.extra.played_cards, kard)
                    table.insert(card.ability.extra.trig, false)
                end
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local ind
            for i, v in ipairs(card.ability.extra.played_cards) do
                if v == context.other_card then
                    ind = i
                end
            end
            if ind and card.ability.extra.trig[ind] == false then
                for _, kaard in ipairs(card.ability.extra.played_cards) do
                    local other = context.other_card
                    if other:get_id() == kaard:get_id() then
                        G.E_MANAGER:add_event(Event({
                            delay = 0.8,
                            trigger = 'immediate',
                            blocking = false,
                            func = function()
                                SMODS.calculate_effect(
                                    {
                                        message = other:get_id() .. "...",
                                        colour = G.C.hpfx_IjiGray,
                                        instant = true
                                    }, card)
                                return true
                            end
                        }))
                    end
                end
                card.ability.extra.trig[ind] = true
            end
        end
        if context.repetition and context.cardarea == G.play then
            if context.other_card:get_id() == 2 or
                context.other_card:get_id() == 3 or
                context.other_card:get_id() == 4 or
                context.other_card:get_id() == 5 then
                return {
                    repetitions = card.ability.extra.repetitions
                }
            end
        end
        if context.after then
            local p2, p3, p4, p5 = false, false, false, false
            for i, v in ipairs(card.ability.extra.trig) do
                v = false
            end
            for _, v in ipairs(card.ability.extra.played_cards) do
                if v:get_id() == 2 then
                    p2 = true
                elseif v:get_id() == 3 then
                    p3 = true
                elseif v:get_id() == 4 then
                    p4 = true
                elseif v:get_id() == 5 then
                    p5 = true
                end
            end
            if p2 and p3 and p4 and p5 then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
