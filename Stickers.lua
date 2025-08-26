SMODS.Atlas {
    key = 'inscrstickers',
    path = "inscryption/jokers/inscrstickers.png",
    px = 71,
    py = 95
}

SMODS.Sticker {
    key = "priceless",
    default_compat = true,
    atlas = "inscrstickers",
    pos = { x = 0, y = 0 },
    badge_colour = HEX("FCB3EA"),
    sets = {
        Joker = true,
        Consumable = false
    },
    rate = 0,
    needs_enabled_flag = false,
    calculate = function(self, card, context)
    end,
    apply = function(self, card, val)
        if val then
            card.ability[self.key] = val
        else
            card.ability[self.key] = nil
        end
        card:set_cost()
    end
}
local nosellsticker_hook = Card.can_sell_card
function Card:can_sell_card(context)
    if self.ability.hpfx_priceless then
        return false
    end
    return nosellsticker_hook(self, context)
end
