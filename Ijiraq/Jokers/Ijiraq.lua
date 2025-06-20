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
    config = { --
        extra = {jkey = 'ijiraq'}
    },
    loc_vars = function (self, info_queue, card)
        if G.GAME.raqeffects['j_blueprint'] then
            if card.area and card.area == G.jokers then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] == card then
                other_joker = G.jokers.cards[i + 1] end
            end
            local compatible = other_joker and
                other_joker ~= card and
                other_joker.config.center.blueprint_compat
            main_end = {{
                n = G.UIT.C,
                config = {
                    align = "bm",
                    minh = 0.4 },
            nodes = {{
                n = G.UIT.C,
                config = {
                    ref_table = card,
                    align = "m",
                    colour = compatible and
                    mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or
                    mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                    r = 0.05,
                    padding = 0.06 },
            nodes = {{
                n = G.UIT.T,
                config = {
                    text = ' ' .. localize('k_' .. (
                        compatible and
                        'compatible' or
                        'incompatible')) .. ' ',
                    colour = G.C.UI.TEXT_LIGHT,
                    scale = 0.32 * 0.8
                }},
                }}}}}
            end
        end
        if G.GAME.raqeffects['j_brainstorm'] then
            if card.area and card.area == G.jokers then
            local compatible = G.jokers.cards[1] and
            G.jokers.cards[1] ~= card and
                G.jokers.cards[1].config.center.blueprint_compat
            main_end = {{
                n = G.UIT.C,
                config = {
                    align = "bm",
                    minh = 0.4
                },
                nodes = {{
                    n = G.UIT.C,
                    config = {
                        ref_table = card,
                        align = "m",
                        colour = compatible and
                        mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or
                        mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
                        r = 0.05,
                        padding = 0.06
                    },
                nodes = {{
                    n = G.UIT.T,
                    config = {
                        text = ' ' .. localize('k_' ..
                        (compatible and
                        'compatible' or
                        'incompatible')) .. ' ',
                        colour = G.C.UI.TEXT_LIGHT,
                        scale = 0.32 * 0.8
            }},}}}}}
            end
        end
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
    calculate = function(self, card, context)
        local i = 1
        for _, card in ipairs(G.GAME.raqeffects) do
            return SMODS.blueprint_effect(card, G.GAME.raqeffects[i], context)
        end
        i = i + 1
    end
}

--Effect: Gains the ability of every Joker it disguised as this run. Destroys all other copies of Ijiraq.