G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{--Mystic Summit?
    key = 'twistit',
    pos = {x = 2, y = 2},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {
            mult = 15,
            discards_remaining = 0
        },
    },
    loc_vars = function (self, info_queue, card)
        return {
            vars = {
                card.ability.extra.mult,
                card.ability.extra.discards_remaining,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize{
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_twistit",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_twistit_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    rarity = 1,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    calculate = function(self, card, context)
        if context.joker_main and
        G.GAME.current_round.discards_left ~=
        card.ability.extra.discards_remaining then
            return {
                mult = card.ability.extra.mult,
            }
        end
        if context.before and
        G.GAME.current_round.discards_left ==
        card.ability.extra.discards_remaining then
            return{
                func = function()
                    hpfx_Transform(card, context)
                end,
            }
        end
    end
}