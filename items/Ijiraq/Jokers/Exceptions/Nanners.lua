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
    config = { extra = { mult = 15, dynadenom = 1, denomd = 1 } },
    loc_vars = function(self, info_queue, card)
        local new_num, new_denom = SMODS.get_probability_vars(card, 1, card.ability.extra.dynadenom,
            'hpfx_michelle_id')
        return {
            vars = {
                card.ability.extra.mult,
                new_num,
                card.area and card.area == G.jokers and new_denom or '6',
                card.area and card.area == G.jokers and "...?" or "",
                card.ability.extra.dynadenom,
                card.ability.extra.denomd

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
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        local endlist = 0
        if context.check_eternal and not context.blueprint and context.other_card == card then
            return { no_destroy = { override_compat = true } }
        end
        if context.end_of_round and context.game_over == false and context.main_eval and not context.blueprint then
            local numerator = tonumber(context.numerator) or 1
            local dynadenom = card.ability.extra.dynadenom
            if SMODS.pseudorandom_probability(card, 'hpfx_michelle_seed', numerator, dynadenom, 'hpfx_michelle_id') then
                G.E_MANAGER:add_event(Event({
                    func = function()
                        play_sound('tarot1')
                        card:juice_up(0.3, 0.4)
                        local candidates = {}
                        for _, j in ipairs(G.jokers.cards) do
                            if j ~= card and j.label ~= 'j_hpfx_ijiraq' and not Hyperglobal.brokejokes[j.label] then
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
                                    SMODS.scale_card(card, {
                                        ref_table = card.ability.extra,
                                        ref_value = 'dynadenom',
                                        scalar_value = 'denomd',
                                        operation = '+',
                                        block_overrides = {
                                            message = true
                                        }
                                    })
                                    return true
                                end
                            }))
                        end
                        return true
                    end
                }))
                if endlist == 4 then endlist = 1 else endlist = endlist + 1 end
                return {
                    message = localize('hpfx_spread_ex'),
                    sound = ('hpfx_end') .. endlist
                }
            else
                endlist = 1
                return {
                    message = localize('hpfx_wither_ex'),
                    sound = ('hpfx_boowomp'),
                    no_destroy = { override_compat = true },
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
