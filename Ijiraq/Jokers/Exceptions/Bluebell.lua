G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{ --Blueprint?
    key = 'bluebell',
    pos = {x = 0, y = 3},
    no_mod_badges = true,
    unlocked = true,
    discovered = true,
    no_collection = true,
    config = {
        extra = {}
    },
    loc_vars = function (self, info_queue, card)
        if card.area and card.area == G.jokers then
            local other_joker
            for i = 1, #G.jokers.cards do
                if G.jokers[i] == card then other_joker = G.jokers[i+1] end
            end
        local compatible = other_joker and other_joker ~= card and other_joker.config.center.blueprint_compat
        main_end = {
        {n = G.UIT.C, config = { align = "bm", minh = 0.4 }, nodes = {
        {n = G.UIT.C, config = {
            ref_table = card,
            align = "m",
            colour = compatible and
            mix_colours(G.C.GREEN, G.C.JOKER_GREY, 0.8) or
            mix_colours(G.C.RED, G.C.JOKER_GREY, 0.8),
            r = 0.05, padding = 0.06},
        nodes = {
            {n = G.UIT.T, config = {
                text = ' ' .. localize('k_' .. (compatible and 'compatible' or 'incompatible')) .. ' ',
                colour = G.C.UI.TEXT_LIGHT,
                scale = 0.32 * 0.8}
            },
        }}}}
        } end
        return{
        main_end = main_end,
        vars = {
            card.area and card.area == G.jokers and "...?" or ""
        }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize { 
            type = 'name', 
            set = "Joker", 
            key = card.ability and card.ability.extra.new_key or "j_hpfx_bluebell", 
            nodes = {} 
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_bluebell_alt"
    end,
    rarity = 3,
    cost = 10,
    atlas = 'IjiraqJokers',
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    -- manage reload manual replacement
    update = function(self, card, dt)
        if type(card.ability.current_area) ~= 'table' then
            card.ability.current_area = card.area
        end
        if not card.area or (card.area ~= G.jokers) then
            card.ability.current_area = nil
            return
        end
        local joker_idx = 1
        if not card.ability.current_cards then
        card.ability.current_cards = {} end
        local area_changed =
        #card.area.cards ~= #card.ability.current_cards
        for i, v in ipairs(card.area.cards) do
            if v == card then
                joker_idx = i
                if area_changed then
                    break
                end
            end
            if not area_changed and
            v.ID ~= card.ability.current_cards[i] then
                area_changed = true
            end
        end
        -- don't do potentially expensive sprite creation if nothing has changed
        if not area_changed and
        card.ability.current_area == card.area and
        joker_idx == card.ability.last_index then
            return
        end
        if G.STATE ~= G.STATES.HAND_PLAYED and
        G.STATE ~= G.STATES.DRAW_TO_HAND and
        G.STATE ~= G.STATES.PLAY_TAROT then
            if G.jokers.cards[joker_idx+1] then
                G.E_MANAGER:add_event(Event({
                    trigger = "immediate",
                    delay = 0,
                    func = function()
                    hpfx_Transform(card, context)
                    return true
                    end,
                }))
            end
        card.ability.current_cards = {}
        for _, v in ipairs(card.ability.current_area.cards) do
            card.ability.current_cards[#card.ability.current_cards+1] = v.ID
        end
        card.ability.current_area = card.area
        card.ability.last_index = joker_idx
        end
    end,
}

