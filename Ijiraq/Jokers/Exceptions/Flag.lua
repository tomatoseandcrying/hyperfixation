G.C.hpfx_IjiGray = HEX('BFD7D5')      
SMODS.Joker{--Banner? 
    key = 'flag',
    pos = {x = 1, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {chips = 30},
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.chips,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_flag",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_flag_alt"
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and to_big(card.ability.extra.chips) > to_big(1) then
            return{
                chips = -(card.ability.extra.chips*G.GAME.current_round.discards_left),
                func = function ()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}