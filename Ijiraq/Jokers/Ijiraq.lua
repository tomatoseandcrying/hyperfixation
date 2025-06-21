function Hyperglobal.create_fake_joker(ref, key, reason, juice)
    local center = G.P_CENTERS[key]
    local ability
    local messagecard = juice or ref
    if reason then
        if reason == "calculate" then
            ability = ref.ability.savedvalues[key]
        elseif reason == "add_to_deck" or 
        reason == "remove_from_deck" then
            ability = center.config
        end
    end
    if ability then
        ability.set = center.set
        ability.name = center.name
    end
    local fake_card = {
        ability = ability or ref.ability,
        config = {
            center = center
        },
        hpfxfaker = true,
        hpfxmessagecard = messagecard,
        T = copy_table(ref.T),
        VT = copy_table(ref.VT),
        kids = ref.kids,
        states = copy_table(ref.states),
        role = {
            roletype = 'Major',
            offset = {x = 0, y = 0},
            major = nil,
            majordraw = ref,
            xy_bond = 'Strong',
            wh_bond = 'Strong',
            r_bond = 'Strong',
            scale_bond = 'Strong'
        },
        alignment = {
            type = 'a',
            offset = {x = 0, y = 0},
            prev_type = '',
            prev_offset = {x = 0, y = 0},
        },
        base_cost = ref.base_cost,
        area = ref.area,
        CT = ref.CT,
        ambient_tilt = 0.2,
        tilt_var = {mx = 0, my = 0, dx = 0, dy = 0, amt = 0},
        params = ref.params,
        sell_cost = ref.sell_cost,
        cost = ref.cost,
        unique_val = ref.unique_val,
        zoom = true,
        discard_pos = {
            r = 0,
            x = 0,
            y = 0,
        },
        facing = 'front',
        sprite_facing = 'front',
        click_timeout = 0.3,
        original_T = copy_table(ref.T),
    }
    fake_card.ability.extra_value = ref.ability.extra_value or 0
    fake_card.ability.cry_prob = ref.ability.cry_prob or 1
    for k, v in pairs(Card) do
        if type(v) == "function" then
            fake_card[k] = v
        end
    end
    fake_card.juice_up = function(self, scale, rot_amount)
        return messagecard:juice_up(scale, rot_amount)
    end
    fake_card.remove = function(self)
        return nil
    end
    return fake_card
end

function Hyperglobal.get_joker_return(key, context, card, juice)
    local center = G.P_CENTERS[key]
    if center then
        card.ability.savedvalues = card.ability.savedvalues or {}
        card.ability.savedvalues[key] = card.ability.savedvalues[key] or copy_table(center.config)
        local fake_card = hpfx.create_fake_joker(card, key, "calculate", juice)
        if center.calculate and type(center.calculate) == "function" and not isvanilla then
            return center:calculate(fake_card, context), fake_card
        end
    end
end

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
        for k, v in pairs(G.GAME.raqeffects) do
            table.insert(G.GAME.raqeffects, Hyperglobal.get_joker_return)
        end
        return SMDOS.merge_effects(G.GAME.raqeffects)
    end
}

--Effect: Gains the ability of every Joker it disguised as this run. Destroys all other copies of Ijiraq.