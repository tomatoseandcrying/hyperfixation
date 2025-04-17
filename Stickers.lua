SMODS.Atlas{
    key = 'hpfxstickers',
    path = "hpfxstickers.png",
    px = 71,
    py = 95
}

SMODS.Sticker{
key = "priceless",
atlas = 'hpfxstickers',
pos = {x = 0, y = 0},
badge_colour = HEX("FCB3EA"),
hide_badge = false,
rate = 1,
needs_enabled_flag = false,
}

local nosellsticker_hook = Card.can_sell_card
function Card:can_sell_card(context)
    if self.ability.priceless then
        return false
    end
    return nosellsticker_hook(self, context)
end


