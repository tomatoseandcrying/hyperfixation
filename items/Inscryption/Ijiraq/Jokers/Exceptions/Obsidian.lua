G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'obsidian',
    pos = { x = 2, y = 8 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 7,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult = 7,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_obsidian",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_obsidian_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.individual and context.cardarea == G.play
            and context.other_card:is_suit("Clubs") then
            context.other_card.ability.perma_mult =
                (context.other_card.ability.perma_mult or 0) + card.ability.extra.mult
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
