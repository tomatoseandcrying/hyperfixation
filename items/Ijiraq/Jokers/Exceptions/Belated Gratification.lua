G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'belated_grat',
    pos = { x = 4, y = 3 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 1,
    cost = 4,
    atlas = 'IjiraqJokers',
    config = {
        trig = false,
        extra = {
            dollars = 2,
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.dollars,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_belated_grat",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_belated_grat_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calc_dollar_bonus = function(self, card)
        if G.GAME.current_round.discards_used == 0 and G.GAME.current_round.discards_left > 0 then
            return G.GAME.current_round.discards_left * card.ability.extra.dollars or nil
        else
            return -(G.GAME.current_round.discards_used * card.ability.extra.dollars) or nil
        end
    end,
    calculate = function(self, card, context)
        if context.end_of_round and G.GAME.current_round.discards_used > 0 and card.ability.trig == false then
            card.ability.trig = true
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
