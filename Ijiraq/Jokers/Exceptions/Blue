G.C.IjiGray = HEX('BFD7D5')     
SMODS.Joker{ --Blueprint? 
    key = 'blue',
    pos = {x = 0, y = 3},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        card.ability.blueprint_compat_ui = card.ability.blueprint_compat_ui or ''; card.ability.blueprint_compat_check = nil
        blueMainEnd(card, context)
        local other_joker
        if G.jokers then
            blueCompatible(card, context)
        end
        return{
            main_end = main_end,
            vars = {card.area and card.area == G.jokers and "...?" or ""}
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { type = 'name', set = "Joker", key = card.ability and card.ability.extra.new_key or "j_hpfx_blue", nodes = {} }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_blue_alt"
    end,
    rarity = 3,
    cost = 10,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    calculate = function (self, card, context)
        if context.post_trigger then
            return Transform(card, context)
        end
    end
}