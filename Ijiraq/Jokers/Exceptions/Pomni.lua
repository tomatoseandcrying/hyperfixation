G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'pomni',
    pos = { x = 3, y = 3 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 3,
        }
    },
    loc_vars = function(self, info_queue, card)
        local main_end
        if G.jokers and G.jokers.cards and card.area == G.jokers then
            if #G.jokers.cards > 0 then
                main_end = {}
                localize { type = 'other', key = 'hpfx_pomcount', nodes = main_end, vars = { #G.jokers.cards - 1 } }
                main_end = main_end[1]
            end
        end
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.mult * (G.jokers and #G.jokers.cards or 0),
                #G.jokers.cards,
                card.area and card.area == G.jokers and "...?" or ""
            },
            main_end = main_end
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_pomni",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_pomni_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        if #G.jokers.cards >= 4 then
            for k, v in ipairs(SMODS.find_card('j_hpfx_pomni')) do
                if v ~= card then
                    G.E_MANAGER:add_event(Event({
                        func = function()
                            v:start_dissolve({ G.C.RED }, nil, 1.6)
                            return true
                        end
                    }))
                end
            end
            hpfx_Transform(card, context)
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult * #G.jokers.cards
            }
        end
        if context.card_added and context.cardarea == G.jokers then
            if #G.jokers.cards >= 4 then
                for k, v in ipairs(SMODS.find_card('j_hpfx_pomni')) do
                    if v ~= card then
                        G.E_MANAGER:add_event(Event({
                            func = function()
                                v:start_dissolve({ G.C.RED }, nil, 1.6)
                                return true
                            end
                        }))
                    end
                end
                hpfx_Transform(card, context)
            end
        end
    end,
    in_pool = function(self, args)
        return true, { allow_duplicates = true }
    end
}
