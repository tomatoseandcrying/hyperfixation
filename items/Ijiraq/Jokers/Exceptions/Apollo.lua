G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'apollo',
    pos = {x = 8, y = 7},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        dollars = 1,
        }
    },
    loc_vars = function (self, info_queue, card)
        local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do if v.set == 'Planet' then planets_used = planets_used + 1 end end
        return{
            vars = {
                card.ability.extra.dollars,
                planets_used * card.ability.extra.dollars,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_apollo",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_apollo_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calc_dollar_bonus = function(self, card)
        local planets_used = 0
        for k, v in pairs(G.GAME.consumeable_usage) do
            if v.set == 'Planet' then planets_used = planets_used + 1 end
        end
        return planets_used > 0 and planets_used * card.ability.extra.dollars or nil
    end,
    calculate = function (self, card, context)
        if context.post_trigger and context.other_card == card then
            return{
                func = function ()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}