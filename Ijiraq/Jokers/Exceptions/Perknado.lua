G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'perknado',
    pos = {x = 7, y = 8},
    soul_pos = {x = 7, y = 9},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    atlas = 'IjiraqJokers',
    config = {extra = {}},
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = {
            key = 'e_negative_consumable',
            set = 'Edition',
            config = {extra = 1}}
        return{
            vars = {
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_perknado",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_perknado_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.ending_shop and G.consumeables.cards[1] then
            G.E_MANAGER:add_event(Event({
                func = function()
                    local copied_card = copy_card(
                        pseudorandom_element(G.consumeables.cards, pseudoseed('hpfx_perknado')))
                    copied_card:set_edition("e_negative", true)
                    copied_card:add_to_deck()
                    G.consumeables:emplace(copied_card)
                    return true
                end
            }))
            return {message = localize('k_duplicated_ex')}
        end
    end
}