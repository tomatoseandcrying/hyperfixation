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
