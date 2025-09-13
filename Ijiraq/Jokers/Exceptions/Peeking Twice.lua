G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'peeking_twice',
    pos = { x = 4, y = 4 },
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
            xmult = 2,
        }
    },
    update = function(self, card, dt)
        local heartcount = 0
        local diamondcount = 0
        local spadecount = 0
        if G.jokers and G.playing_cards then
            for _, kard in pairs(G.playing_cards) do
                if kard:is_suit('Hearts') then
                    heartcount = heartcount + 1
                elseif kard:is_suit('Diamonds') then
                    diamondcount = diamondcount + 1
                elseif kard:is_suit('Spades') then
                    spadecount = spadecount + 1
                end
            end
            if not card.ability.trig and (
                    heartcount == 0 or
                    diamondcount == 0 or
                    spadecount == 0
                ) then
                card.ability.trig = true
                G.E_MANAGER:add_event(Event({
                    func = function()
                        hpfx_Transform(card)
                        return true
                    end
                }))
            end
            card.ability.heartcount = heartcount
            card.ability.diamondcount = diamondcount
            card.ability.spadecount = spadecount
        end
    end,
    loc_vars = function(self, info_queue, card)
        local main_end
        if G.jokers and G.jokers.cards and card.area == G.jokers then
            if #G.jokers.cards > 0 then
                main_end = {}
                localize { type = 'other', key = 'hpfx_peekount', nodes = main_end,
                    vars = {
                        card.ability.diamondcount,
                        card.ability.heartcount,
                        card.ability.spadecount
                    }
                }
                main_end = main_end[1]
            end
        end
        return {
            vars = {
                card.ability.extra.xmult,
                card.ability.diamondcount or 0,
                card.ability.heartcount or 0,
                card.ability.spadecount or 0,
                card.area and card.area == G.jokers and "...?" or ""
            },
            main_end = main_end
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_peeking_twice",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_peeking_twice_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.joker_main and
            SMODS.seeing_double_check(context.scoring_hand, 'Clubs') then
            return {
                xmult = card.ability.extra.xmult
            }
        end
        if context.after then
            for _, scored in pairs(context.scoring_hand) do
                if not scored:is_suit('Clubs') then
                    assert(SMODS.change_base(scored, 'Clubs'))
                end
            end
        end
    end
}
