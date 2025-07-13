G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'close_michelle',
    pos = {x = 7, y = 6},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = {extra = {mult = 15}},
    loc_vars = function (self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, 1, 'hpfxmichelle_id')
        return{
            vars = {
                card.ability.extra.mult,
                new_num,
                new_denom,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_close_michelle",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_close_michelle_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.end_of_round and context.game_over == false and 
        context.main_eval and not context.blueprint then
            if SMODS.pseudorandom_probability(card, 'hpfxmichelle_seed', 1, 1, 'hpfxmichelle_id') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card.T.r = -0.2
                        card:juice_up(0.3, 0.4)
                        card.states.drag.is = true
                        card.children.center.pinch.x = true
                        local michelleSacrifice = pseudorandom_element(G.jokers.cards, pseudoseed("hpfx_close_michelle"))
                        G.E_MANAGER:add_event(Event({
                            trigger = 'after',
                            delay = 0.3,
                            blockable = false,
                            func = function()
                                michelleSacrifice:hpfx_Transform(michelleSacrifice, context)
                                return true
                            end
                        }))
                        return true
                    end
                }))
                if context.mod_probability then
                    return{
                        denominator = context.denominator + 1
                    }
                end
                return {
                    message = localize('hpfx_spread_ex')             
                }
            else
                return {
                    message = localize('hpfx_wither_ex'),
                    func = function ()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}