G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'dont_come_back',
    pos = {x = 8, y = 5},
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 3,
    cost = 8,
    atlas = 'IjiraqJokers',
    config = {
        extra = {
            xmult_gain = 0.5,
            xmult = 1
        }
    },
    loc_vars = function (self, info_queue, card)
        local jackstack = 0
        if G.playing_cards then
            for _, jard in ipairs(G.playing_cards) do
                if jard:get_id() == 9 then
                jackstack = jackstack + 1 end
            end
        end
        return{
            vars = {
                card.ability.extra.xmult_gain,
                card.ability.extra.xmult,
                card.area and card.area == G.jokers and "...?" or "",
                card.area and card.area == G.jokers and "{C:inactive}({C:attention}#5#{C:inactive}remaining)" or "",
                jackstack
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_dont_come_back",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_dont_come_back_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        if context.pre_discard and context.cardarea == G.play then
            local jackstack = 0
            if G.playing_cards then
                for _, jard in ipairs(G.playing_cards) do
                    if jard:get_id() == 9 then
                    jackstack = jackstack + 1 end
                end
            end
            if jackstack <= 0 then
                return{
                    func = function()
                        hpfx_Transform(card, context)
                    end
                }
            end
        end
        if context.discard and
        not context.blueprint and
        not context.other_card.debuff and
        context.other_card:get_id() == 11 then
            card.ability.extra.xmult = card.ability.extra.xmult +
                card.ability.extra.xmult_gain
            return {
                colour = G.C.RED,
                message = localize{
                    type = 'variable', key = 'a_xmult',
                    vars = {card.ability.extra.xmult}
                },
                remove = true
            }
        end
        if context.joker_main then
            return{
                xmult = card.ability.extra.xmult
            }
        end
        if context.end_of_round and
        context.game_over == false and
        context.main_eval and not context.blueprint then
            card.ability.extra.xmult = 1
            return {
                message = localize('k_reset'),
                colour = G.C.RED
            }
        end
    end
}