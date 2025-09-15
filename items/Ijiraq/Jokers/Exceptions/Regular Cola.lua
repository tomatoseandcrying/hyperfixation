G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'cola',
    pos = { x = 2, y = 6 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    eternal_compat = false,
    perishable_compat = true,
    rarity = 2,
    cost = 6,
    atlas = 'IjiraqJokers',
    config = { extra = {} },
    loc_vars = function(self, info_queue, card)
        info_queue[#info_queue + 1] = { key = 'tag_double', set = 'Tag' }
        return {
            vars = {
                card.area and card.area == G.jokers and "...?" or "",
                localize { type = 'name_text', set = 'Tag', key = 'tag_double' }
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_cola",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_cola_alt"
        card:add_sticker('hpfx_priceless')
        local tag_pool = get_current_pool('Tag')
        local selected_tag = pseudorandom_element(tag_pool, pseudoseed('hpfx_cola'))
        local it = 1
        while selected_tag == 'UNAVAILABLE' do
            it = it + 1
            selected_tag = pseudorandom_element(tag_pool, pseudoseed('hpfx_cola_redip' .. it))
        end
        add_tag(Tag(selected_tag, false, 'Small'))
        play_sound('generic1', 0.9 + math.random() * 0.1, 0.8)
        play_sound('holo1', 1.2 + math.random() * 0.1, 0.4)
        func = function()
            hpfx_Transform(card)
        end
    end
}
