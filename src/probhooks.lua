--cain unlock
local farm = SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier)
    local ret = farm(trigger_obj, seed, base_numerator, base_denominator, identifier)
    if seed == 'wheel_of_fortune' then
        if ret then
            G.GAME.wheel_fails = 0
        else
            G.GAME.wheel_fails = G.GAME.wheel_fails + 1
            if G.GAME.wheel_fails >= 3 then
                check_for_unlock({ type = 'hpfx_nope' })
                G.GAME.wheel_fails = 0
            end
        end
    end
    return ret
end
