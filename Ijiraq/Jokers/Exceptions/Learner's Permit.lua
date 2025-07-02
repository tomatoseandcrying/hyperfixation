G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'learners_permit',
    pos = {x = 0, y = 7},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 7,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
        xmult = 3,
        cards = 16
        }
    },
    loc_vars = function (self, info_queue, card)
        return{
            vars = {
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
                card.ability.extra.cards
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_learners_permit",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_learners_permit_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
        G.E_MANAGER:add_event(Event({
            func = function ()
                local cards = {}
                for i = 1, card.ability.extra.cards do
                    local additions = {}
                    for _, rank_key in ipairs(SMODS.Rank.obj_buffer) do
                        local rank = SMODS.Ranks[rank_key]
                        table.insert(additions, rank)
                    end
                    local _suit, _rank =
                        pseudorandom_element(SMODS.Suits, pseudoseed('permit_schmermit')).card_key,
                        pseudorandom_element(additions, pseudoseed('permit_schmermit')).card_key
                    local cen_pool = {}
                    for _, enhancement_center in pairs(G.P_CENTER_POOLS["Enhanced"]) do
                        if enhancement_center.key ~= 'm_stone' and not enhancement_center.overrides_base_rank then
                            cen_pool[#cen_pool + 1] = enhancement_center
                        end
                    end
                    cards[i] = create_playing_card({
                        front = G.P_CARDS[_suit .. '_' .. _rank],
                        center = pseudorandom_element(cen_pool, pseudoseed('learner_per'))
                    }, G.hand, nil, i ~= 1, { G.C.SECONDARY_SET.Spectral })
                end
                SMODS.calculate_context({ playing_card_added = true, cards = cards })
                hpfx_Transform(card)
                return true
            end
        }))
    end
}