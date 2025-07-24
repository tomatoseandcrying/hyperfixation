G.C.hpfx_IjiGray = HEX('BFD7D5')
Testmod = SMODS.current_mod

SMODS.Joker {
    key = "broker",
    pos = { x = 0, y = 0 },
    rarity = 1,
    blueprint_compat = true,
    cost = 2,
    config = { extra = { mult = 40 }, },
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.extra.mult } }
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                mult = card.ability.extra.mult
            }
        end
    end
}

if next(SMODS.find_mod('hyperfixation_mod')) then
    if Hyperglobal and Hyperglobal.hypercross then
        if type(Hyperglobal) == "table" and type(Hyperglobal.hypercross) == "function" then
            Hyperglobal.hypercross('crosstest', 'j_test_broker', 'j_test_broken', true)
        end
    end
    SMODS.Joker {
        key = 'broken',
        pos = { x = 1, y = 0 },
        no_mod_badges = true,
        unlocked = true,
        discovered = true,
        blueprint_compat = true,
        eternal_compat = true,
        perishable_compat = true,
        rarity = 1,
        cost = 1,
        config = {
            extra = {
                mult = 40,
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
                key = card.ability and card.ability.extra.new_key or "j_test_broken",
                nodes = {}
            }
            SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        end,
        add_to_deck = function(self, card, from_debuff)
            card.ability.extra.new_key = "j_test_broken_alt"
            local sticker = SMODS.Stickers['hpfx_priceless']
            sticker.apply(sticker, card, true)
        end,
        calculate = function(self, card, context)
            if context.joker_main then
                return {
                    mult = card.ability.extra.mult,
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end,
        calc_dollar_bonus = function(self, card)
            return 4
        end

    }
end
