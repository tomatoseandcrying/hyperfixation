G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'invincible',
    pos = {x = 1, y = 7},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = false,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    draw = function(self, card, layer)
        if card.config.center.discovered or card.bypass_discovery_center then
            card.children.center:draw_shader('voucher', nil, card.ARGS.send_to_shader)
        end
    end,
    config = {
        extra = {
        invis_rounds = 0,
        total_rounds = 2
        }
    },
    loc_vars = function (self, info_queue, card)
        local main_end
        if G.jokers and G.jokers.cards then
            for _, joker in ipairs(G.jokers.cards) do
                if joker.edition and joker.edition.negative then
                    main_end = {}
                    localize { type = 'other', key = 'remove_negative', nodes = main_end, vars = {} }
                    break
                end
            end
        end
        return{
            vars = {
                card.ability.extra.total_rounds,
                card.ability.extra.invis_rounds,
                card.area and card.area == G.jokers and "...?" or ""
            },
            main_end = main_end
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_invincible",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_invincible_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.selling_self and
        card.ability.extra.invis_rounds >=
        card.ability.extra.total_rounds and
        not context.blueprint then
            local jokers = {}
            for i = 1, #G.jokers.cards do
                if G.jokers.cards[i] ~= card then
                    jokers[#jokers + 1] = G.jokers.cards[i]
                end
            end
            if #jokers > 0 then
                if #G.jokers.cards <= G.jokers.config.card_limit then
                    local chosen_joker = card
                    local copied_joker = copy_card(chosen_joker, nil, nil, nil, nil)
                    copied_joker:add_to_deck()
                    copied_joker:set_edition('e_negative', true, true)
                    G.jokers:emplace(copied_joker)
                    return {
                        message = localize('k_duplicated_ex'),
                        func = function ()
                            hpfx_Transform(card, context)
                        end
                    }
                else
                    return { message = localize('k_no_room_ex') }
                end
            else
                return { message = localize('k_no_other_jokers') }
            end
        end
    end
}