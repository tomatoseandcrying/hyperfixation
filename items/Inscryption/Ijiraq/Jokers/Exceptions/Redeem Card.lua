G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker { --Loyalty Card?
    key = 'redeemed',
    pos = { x = 4, y = 2 },
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {
            x_mult = 4,
            every = 0,
            remaining = 0
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.x_mult,
                card.ability.extra.every,
                localize {
                    type = 'variable',
                    key = (card.ability.extra.remaining == 0 and 'loyalty_active' or 'loyalty_inactive'),
                    vars = { card.ability.extra.remaining }
                },
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_redeemed",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_redeemed_alt"
        card:add_sticker('hpfx_priceless')
    end,
    rarity = 2,
    cost = 5,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    calculate = function(self, card, context)
        local extra = card.ability and card.ability.extra
        if context.joker_main then
            card.ability.extra.remaining = (card.ability.extra.every - 1
                    - (G.GAME.hands_played - card.ability.hands_played_at_create))
                % (card.ability.extra.every + 1)
            if not context.blueprint then
                if card.ability.extra.remaining == 0 then
                    local eval = function(card)
                        return not G.RESET_JIGGLES and extra == true
                            and card.ability.extra.remaining == 0
                    end
                    juice_card_until(card, eval, true)
                end
            end
            if card.ability.extra.remaining == card.ability.extra.every then
                return {
                    x_mult = 1 / card.ability.extra.x_mult,
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
