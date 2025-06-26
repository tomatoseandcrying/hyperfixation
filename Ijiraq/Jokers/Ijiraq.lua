SMODS.Joker{ --Ijiraq.
    key = 'ijiraq',
    pos = {x = 0, y = 9},
    soul_pos = {x = 1, y = 9},
    no_mod_badges = false,
    unlocked = true,
    discovered = false,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = true,
    perishable_compat = false,
    config = { 
        extra = {jkey = 'ijiraq'}
    },
    loc_vars = function (self, info_queue, card)
        return{
            main_end = main_end,
        vars = {
            card.ability.extra.jkey
        }}
    end,
    in_pool = function(self, args)
        return false
    end,
    add_to_deck = function(self, card, from_debuff)
        card:remove_sticker('hpfx_priceless')
        for k, v in ipairs(SMODS.find_card('j_hpfx_ijiraq')) do
            if v ~= card then
                G.E_MANAGER:add_event(Event({
                    func = function()
                    SMODS.calculate_effect({
                        message = 'Fall.',
                        colour = G.C.RED,
                        sound = 'hpfx_fall'},
                        card)
                    return true
                    end
                }))
                G.E_MANAGER:add_event(Event({
                    func = function ()
                    v:start_dissolve({G.C.RED}, nil, 1.6)
                    return true
                    end
                }))
            end
        end
    end,
}

--Effect: Gains the ability of every Joker it disguised as this run. Destroys all other copies of Ijiraq.