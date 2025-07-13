G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker{
    key = 'perknado',
    pos = {x = 7, y = 8},
    soul_pos = {
        x = 7,
        y = 9,
        draw = function (card, scale_mod, rotate_mod)
            if card.ability.extra.toggle then
                scale_mod = 0.07 + 0.02 * math.sin(1.8 * G.TIMERS.REAL) +
                    0.00 * math.sin((G.TIMERS.REAL - math.floor(G.TIMERS.REAL)) *
                    math.pi * 14) * (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 3
                rotate_mod = 0.05 * math.sin(1.219 * G.TIMERS.REAL) +
                    0.00 * math.sin((G.TIMERS.REAL) * math.pi * 5) *
                    (1 - (G.TIMERS.REAL - math.floor(G.TIMERS.REAL))) ^ 2

                card.children.hpfx_floating_sprite:draw_shader('dissolve',
                nil, nil, nil, card.children.center, scale_mod, rotate_mod)
            else
                card.children.floating_sprite:draw_shader('dissolve',
                nil, nil, nil, card.children.center, scale_mod, rotate_mod)
            end
        end
    },
    no_mod_badges = true,
    no_collection = true,
    unlocked = true,
    discovered = true,
    blueprint_compat = true,
    rarity = 4,
    cost = 20,
    atlas = 'IjiraqJokers',
    config = {extra = {toggle = false}},
    set_sprites = function(self, card, front)
        if self.discovered or card.bypass_discovery_center then
            card.children.hpfx_floating_sprite =
            Sprite(card.T.x, card.T.y, card.T.w, card.T.h,
                G.ASSET_ATLAS[card.config.center.atlas], {
                    x = 8,
                    y = 9
                })
            card.children.hpfx_floating_sprite.role.draw_major = card
            card.children.hpfx_floating_sprite.states.hover.can = false
            card.children.hpfx_floating_sprite.states.click.can = false
        end
    end,
    loc_vars = function (self, info_queue, card)
        info_queue[#info_queue + 1] = {
            key = 'e_negative_consumable',
            set = 'Edition',
            config = {extra = 1}}
        return{
            vars = {
                card.area and card.area == G.jokers and "...?" or "",
                card.ability.extra.toggle
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
        if card.area == G.jokers then
            card:highlight(false)
        else
            G.E_MANAGER:add_event(Event({
                func = function()
                    if card.area == G.jokers then
                        card:highlight(false)
                    end
                    return true
                end
            }))
        end
    end,
    calculate = function(self, card, context)
        if context.ending_shop then
            G.E_MANAGER:add_event(Event({
                func = function()
                    if card.ability.extra.toggle then
                        local copied_card =
                        copy_card(pseudorandom_element(G.consumeables.cards, pseudoseed('hpfx_perknado')))
                        copied_card:set_edition("e_negative", true)
                        copied_card:add_to_deck()
                        G.consumeables:emplace(copied_card)
                    elseif not card.ability.extra.toggle then
                        local copied_card =
                        copy_card(pseudorandom_element(G.jokers.cards, pseudoseed('hpfx_perknado')))
                        copied_card:set_edition("e_negative", true)
                        copied_card:add_to_deck()
                        G.jokers:emplace(copied_card)
                    end
                    return true
                end
            }))
            return {message = localize('k_duplicated_ex')}
        end
    end
}