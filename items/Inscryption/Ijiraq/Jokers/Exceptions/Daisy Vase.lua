G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'daisy_vase',
    pos = { x = 0, y = 6 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            xmult = 3,
            played_suits = {},
            trig = {},
        }
    },
    loc_vars = function(self, info_queue, card)
        local pleart, pliamond, plade, plub = false, false, false, false
        for _, v in ipairs(card.ability.extra.played_suits) do
            if v:is_suit('Hearts') then
                pleart = true
            elseif v:is_suit('Diamonds') then
                pliamond = true
            elseif v:is_suit('Spades') then
                plade = true
            elseif v:is_suit('Clubs') then
                plub = true
            end
            if pleart and pliamond and plade and plub then
                break
            end
        end
        return {
            vars = {
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
                (pliamond and "■") or "Diamond",
                (pleart and "■") or "Heart",
                (plade and "■") or "Spade",
                (plub and "■") or "Club",
                card.ability.extra.played_suits,
                card.ability.extra.trig
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_daisy_vase",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_daisy_vase_alt"
        card:add_sticker('hpfx_priceless')
    end,
    calculate = function(self, card, context)
        if context.before and context.cardarea == G.jokers
            and context.main_eval and not context.blueprint then
            for _, suit in ipairs(context.scoring_hand) do
                if suit:is_suit('Hearts') or suit:is_suit('Diamonds') or
                    suit:is_suit('Spades') or suit:is_suit('Clubs') then
                    table.insert(card.ability.extra.played_suits, suit)
                    table.insert(card.ability.extra.trig, false)
                end
            end
        end
        if context.individual and context.cardarea == G.play and not context.blueprint then
            local ind
            for i, v in ipairs(card.ability.extra.played_suits) do
                if v == context.other_card then
                    ind = i
                end
            end
            if ind and card.ability.extra.trig[ind] == false then
                for _, suit in ipairs(card.ability.extra.played_suits) do
                    local other = context.other_card
                    if other:is_suit(suit.base.suit) then
                        G.E_MANAGER:add_event(Event({
                            delay = 0.8,
                            trigger = 'immediate',
                            blocking = false,
                            func = function()
                                SMODS.calculate_effect(
                                    {
                                        message = "?",
                                        colour = G.C.SUITS[other.base.suit],
                                        instant = true
                                    }, card)
                                return true
                            end
                        }))
                    end
                end
                card.ability.extra.trig[ind] = true
            end
        end
        if context.joker_main then
            local suits = {
                ['Hearts'] = 0,
                ['Diamonds'] = 0,
                ['Spades'] = 0,
                ['Clubs'] = 0
            }
            for i = 1, #context.scoring_hand do
                if not SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts', true) and suits["Hearts"] == 0 then
                        suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds', true) and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades', true) and suits["Spades"] == 0 then
                        suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs', true) and suits["Clubs"] == 0 then
                        suits["Clubs"] = suits["Clubs"] + 1
                    end
                end
            end
            for i = 1, #context.scoring_hand do
                if SMODS.has_any_suit(context.scoring_hand[i]) then
                    if context.scoring_hand[i]:is_suit('Hearts') and suits["Hearts"] == 0 then
                        suits["Hearts"] = suits["Hearts"] + 1
                    elseif context.scoring_hand[i]:is_suit('Diamonds') and suits["Diamonds"] == 0 then
                        suits["Diamonds"] = suits["Diamonds"] + 1
                    elseif context.scoring_hand[i]:is_suit('Spades') and suits["Spades"] == 0 then
                        suits["Spades"] = suits["Spades"] + 1
                    elseif context.scoring_hand[i]:is_suit('Clubs') and suits["Clubs"] == 0 then
                        suits["Clubs"] = suits["Clubs"] + 1
                    end
                end
            end
            if suits["Hearts"] > 0 and
                suits["Diamonds"] > 0 and
                suits["Spades"] > 0 and
                suits["Clubs"] > 0 then
                return {
                    xmult = card.ability.extra.xmult
                }
            end
        end
        if context.after then
            local pleart, pliamond, plade, plub = false, false, false, false
            for _, v in ipairs(card.ability.extra.played_suits) do
                if v:is_suit('Hearts') then
                    pleart = true
                elseif v:is_suit('Diamonds') then
                    pliamond = true
                elseif v:is_suit('Spades') then
                    plade = true
                elseif v:is_suit('Clubs') then
                    plub = true
                end
            end
            if pleart and pliamond and plade and plub then
                return {
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
    end
}
