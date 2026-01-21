SMODS.Joker {
    key = 'eternimbo',
    atlas = 'Jokers4Fun',
    pos = { x = 4, y = 0 },
    unlocked = false,
    discovered = false,
    rarity = 4,
    in_pool = function(self, args) return false end,
    check_for_unlock = function(self, args)
        return args.type == 'hpfx_old'
    end
}
SMODS.Joker {
    key = 'jolyne',
    atlas = 'jolyne',
    pos = { x = 0, y = 0 },
    unlocked = true,
    discovered = true,
    rarity = 4,
    no_collection = true,
    in_pool = function(self, args) return false end,
}
