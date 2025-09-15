G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'get_an_uber',
    pos = { x = 1, y = 6 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    perishable_compat = false,
    rarity = 1,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            mult_gain = 1,
            mult = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult_gain,
                card.ability.extra.mult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_get_an_uber",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_get_an_uber_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        extra = card.ability and card.ability.extra
        if context.before and context.main_eval and not context.blueprint then
            local faces = false
            for _, playing_card in ipairs(context.scoring_hand) do
                if playing_card:is_face() then
                    faces = true
                    break
                end
            end
            if faces then
                local last_mult = extra.mult
                extra.mult = 0
                if last_mult > 0 then
                    return {
                        message = localize('hpfx_missmiji'),
                        func = function()
                            hpfx_Transform(card, context)
                        end
                    }
                end
            else
                extra.mult = extra.mult + extra.mult_gain
            end
        end
    end
}
