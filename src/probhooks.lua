--cain unlock
local farm = SMODS.pseudorandom_probability
function SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier)
    local ret = farm(trigger_obj, seed, base_numerator, base_denominator, identifier)
    if seed == 'wheel_of_fortune' then
        if ret then
            Hyperfixation.wheel_fails = 0
        else
            Hyperfixation.wheel_fails = Hyperfixation.wheel_fails + 1
            if Hyperfixation.wheel_fails >= 3 then
                check_for_unlock({ type = 'hpfx_nope' })
                Hyperfixation.wheel_fails = 0
            end
        end
    end
    return ret
end
