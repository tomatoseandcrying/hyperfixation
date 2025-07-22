G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'close_michelle',
    pos = { x = 7, y = 6 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    config = { extra = { mult = 15, dynadenom = 1 } },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, card.ability.extra.dynadenom,
            'hpfx_michelle_id')
        return {
            vars = {
                card.ability.extra.mult,
                new_num,
                card.area and card.area == G.jokers and new_denom or '6',
                card.area and card.area == G.jokers and "...?" or "",
                card.ability.extra.dynadenom
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
        if context.check_eternal and not context.blueprint and context.other_card == card then
            return { no_destroy = { override_compat = true } }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local numerator = tonumber(context.numerator) or 1
            local dynadenom = card.ability.extra.dynadenom or 1

            if SMODS.pseudorandom_probability(card, 'hpfx_michelle_seed', numerator, dynadenom, 'hpfx_michelle_id') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.4)
                        local candidates = {}
                        for _, j in ipairs(G.jokers.cards) do
                            if j ~= card then
                                table.insert(candidates, j)
                            end
                        end
                        local michelleSacrifice = #candidates > 0 and
                            pseudorandom_element(candidates, pseudoseed("hpfx_close_michelle")) or nil
                        if michelleSacrifice then
                            G.E_MANAGER:add_event(Event({
                                trigger = 'after',
                                delay = 0.3,
                                blockable = false,
                                func = function()
                                    hpfx_Transform(michelleSacrifice, context)
                                    card.ability.extra.dynadenom = dynadenom + 1
                                    return true
                                end
                            }))
                        end
                        return true
                    end
                }))
                return {
                    message = localize('hpfx_spread_ex')
                }
            else
                return {
                    message = localize('hpfx_wither_ex'),
                    no_destroy = { override_compat = true },
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
