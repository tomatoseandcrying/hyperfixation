G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'manolo',
    pos = { x = 4, y = 5 },
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
            mult = 8,
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
            key = card.ability and card.ability.extra.new_key or "j_hpfx_manolo",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_manolo_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.debuffed_hand or context.joker_main then
            if G.GAME.blind.triggered then
                return { mult = card.ability.extra.mult }
            end
        end
        if context.end_of_round and context.game_over == false then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
