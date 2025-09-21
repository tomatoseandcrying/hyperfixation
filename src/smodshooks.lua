--and thumb mimic func
local bcofcthereis = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card('j_hpfx_and_thumb')) then
        return 4
    end
    return bcofcthereis()
end

--secret way mimic func
local whywouldnttherebe = SMODS.shortcut
function SMODS.shortcut()
    if next(SMODS.find_card('j_hpfx_secretway')) then
        return true
    end
    return whywouldnttherebe()
end
