local ref_ease_hands = ease_hands_played
function ease_hands_played(mod, instant)
    local ret = ref_ease_hands(mod, instant)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({ hpfx_change_hands = true })
            return true
        end
    }))

    return ret
end

local ref_ease_discards = ease_discard
function ease_discard(mod, instant, silent)
    local ret = ref_ease_discards(mod, instant, silent)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({ hpfx_change_discards = true })
            return true
        end
    }))
    return ret
end

local ref_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    local ret = ref_ease_dollars(mod, instant)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({ hpfx_change_dollars = true })
            return true
        end
    }))
    return ret
end

local ref_ease_ante = ease_ante
function ease_ante(mod)
    local ret = ref_ease_ante(mod)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({ hpfx_change_ante = true })
            return true
        end
    }))
    return ret
end
