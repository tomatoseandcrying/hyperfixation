local oldunlockcard = unlock_card
function unlock_card(card)
    local susiesidea = oldunlockcard(card)
    if card.key == 'j_hpfx_eternimbo' then discover_card(card) end
    return susiesidea
end
