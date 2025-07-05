G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'flashforward',
    pos = {x = 5, y = 7},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        xmult = 0.25,
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_flashforward",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_flashforward_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.skip_blind and not context.blueprint then
            local anteskip = G.GAME.round_resets.ante % 8
            ease_ante(8 - anteskip)
            return {
                func = function ()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}