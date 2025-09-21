SMODS.Atlas {
    key = 'inscrstickers',
    path = "inscryption/stickers/inscrstickers.png",
    px = 71,
    py = 95
}

SMODS.Sticker {
    key = "priceless",
    default_compat = true,
    atlas = "inscrstickers",
    badge_colour = HEX("FCB3EA"),
    needs_enable_flag = false,
    rate = 0,
    pos = { x = 0, y = 0 },
    sets = {
        Joker = true,
        Consumable = false
    }
}
