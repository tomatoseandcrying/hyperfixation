G.C.IjiGray = HEX('BFD7D5')     
SMODS.Joker{ --Raised Fist? 
    key = 'braised',
    pos = {x = 8, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        return{vars = {
            card.area and card.area == G.jokers and "...?" or ""
        }}
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_braised", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_braised_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.individual and 
        context.cardarea == G.hand and 
        not context.end_of_round then
            local tempMult, tempID = -1, -1
            local raised_card = nil
            for i = 1, #G.hand.cards do
                if tempID <= G.hand.cards[i].base.id and 
                not SMODS.has_no_rank(G.hand.cards[i]) then
                tempMult = G.hand.cards[i].base.nominal
                tempID = G.hand.cards[i].base.id
                raised_card = G.hand.cards[i]
                end
            end
            if raised_card == context.other_card then
                if context.other_card.debuff then
                    return {
                        message = localize('k_debuffed'),
                        colour = G.C.RED,
                    }
                else
                    return{
                    mult = 2 * tempMult,
                    func = function ()
                    Transform(card, context)    
                    end
                    }
                end
            end
        end
    end
}