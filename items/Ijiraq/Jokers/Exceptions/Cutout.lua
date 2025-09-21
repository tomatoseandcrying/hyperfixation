G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'cutout',
    pos = { x = 2, y = 5 },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 2,
    cost = 8,
    atlas = 'IjiraqJokers',
    config = { trig = false, extra = {} },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                G.jokers and math.max(1, (G.jokers.config.card_limit - #G.jokers.cards)
                    + #SMODS.find_card("j_hpfx_cutout", true)) or 1,
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_cutout",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_cutout_alt"
        card:add_sticker('hpfx_priceless')
    end,
    update = function(self, card, dt)
        if math.max(1, (G.jokers.config.card_limit - #G.jokers.cards) +
                #SMODS.find_card("j_hpfx_cutout", true)) <= 1 and card.ability.trig == false then
            card.ability.trig = true
            G.E_MANAGER:add_event(Event({
                func = function()
                    hpfx_Transform(card)
                    return true
                end
            }))
        end
    end,
    calculate = function(self, card, context)
        if context.joker_main then
            return {
                xmult = math.max(1, (G.jokers.config.card_limit - #G.jokers.cards)
                    + #SMODS.find_card("j_hpfx_cutout", true)),
            }
        end
    end
}
