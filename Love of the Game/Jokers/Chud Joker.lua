SMODS.Joker{
    key = 'chud',
    rarity = 1,
    --atlas = 'LoveofTheGameJokers',
    pos = {x = 0, y = 0},
    cost = 4,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    check_for_unlock = function(self, args)
        if args.type == 'hpfx_chud' then
            unlock_card(self)
        end
    end,
}