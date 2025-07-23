G.C.hpfx_IjiGray = HEX('BFD7D5')
SMODS.Joker {
    key = 'dupla',
    pos = { x = 5, y = 4 },
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
            xmult = 2,
            type = 'Pair',
            lowest_count_destroyed = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                localize(card.ability.extra.type, 'poker_hands'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_dupla",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_dupla_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        extra = card.ability and card.ability.extra or {}
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.destroy_card and not context.blueprint and context.scoring_hand then
            -- Count occurrences of each rank in scoring_hand
            local rank_counts = {}
            for _, c in ipairs(context.scoring_hand) do
                local rank = c:get_id()
                rank_counts[rank] = (rank_counts[rank] or 0) + 1
            end

            -- Find the minimum count
            local min_count = math.huge
            for _, count in pairs(rank_counts) do
                if count < min_count then min_count = count end
            end

            -- If the destroyed card is one of the lowest count ranks, remove it
            local destroyed_rank = context.destroy_card:get_id()
            if rank_counts[destroyed_rank] == min_count then
                extra.lowest_count_destroyed = true
                return { remove = true }
            end
        end
        if context.after and extra.lowest_count_destroyed then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}

SMODS.Joker {
    key = 'triada',
    pos = { x = 6, y = 4 },
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
            xmult = 3,
            type = 'Three of a Kind',
            lowest_count_destroyed = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                localize(card.ability.extra.type, 'poker_hands'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_triada",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_triada_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        extra = card.ability and card.ability.extra or {}
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.destroy_card and not context.blueprint and context.scoring_hand then
            -- Count occurrences of each rank in scoring_hand
            local rank_counts = {}
            for _, c in ipairs(context.scoring_hand) do
                local rank = c:get_id()
                rank_counts[rank] = (rank_counts[rank] or 0) + 1
            end

            -- Find the minimum count
            local min_count = math.huge
            for _, count in pairs(rank_counts) do
                if count < min_count then min_count = count end
            end

            -- If the destroyed card is one of the lowest count ranks, remove it
            local destroyed_rank = context.destroy_card:get_id()
            if rank_counts[destroyed_rank] == min_count then
                extra.lowest_count_destroyed = true
                return { remove = true }
            end
        end
        if context.after and extra.lowest_count_destroyed then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}

SMODS.Joker {
    key = 'familia',
    pos = { x = 7, y = 4 },
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
            xmult = 4,
            type = 'Four of a Kind',
            lowest_count_destroyed = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                localize(card.ability.extra.type, 'poker_hands'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_familia",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_familia_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        extra = card.ability and card.ability.extra or {}
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.destroy_card and not context.blueprint and context.scoring_hand then
            -- Count occurrences of each rank in scoring_hand
            local rank_counts = {}
            for _, c in ipairs(context.scoring_hand) do
                local rank = c:get_id()
                rank_counts[rank] = (rank_counts[rank] or 0) + 1
            end

            -- Find the minimum count
            local min_count = math.huge
            for _, count in pairs(rank_counts) do
                if count < min_count then min_count = count end
            end

            -- If the destroyed card is one of the lowest count ranks, remove it
            local destroyed_rank = context.destroy_card:get_id()
            if rank_counts[destroyed_rank] == min_count then
                extra.lowest_count_destroyed = true
                return { remove = true }
            end
        end
        if context.after and extra.lowest_count_destroyed then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}

SMODS.Joker {
    key = 'orden',
    pos = { x = 8, y = 4 },
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
            xmult = 3,
            type = 'Straight',
            lowest_count_destroyed = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                localize(card.ability.extra.type, 'poker_hands'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_orden",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_orden_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        extra = card.ability and card.ability.extra or {}
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.destroy_card and not context.blueprint and context.scoring_hand then
            -- Count occurrences of each rank in scoring_hand
            local rank_counts = {}
            for _, c in ipairs(context.scoring_hand) do
                local rank = c:get_id()
                rank_counts[rank] = (rank_counts[rank] or 0) + 1
            end

            -- Find the minimum count
            local min_count = math.huge
            for _, count in pairs(rank_counts) do
                if count < min_count then min_count = count end
            end

            -- If the destroyed card is one of the lowest count ranks, remove it
            local destroyed_rank = context.destroy_card:get_id()
            if rank_counts[destroyed_rank] == min_count then
                extra.lowest_count_destroyed = true
                return { remove = true }
            end
        end
        if context.after and extra.lowest_count_destroyed then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}

SMODS.Joker {
    key = 'tribu',
    pos = { x = 9, y = 4 },
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
            xmult = 2,
            type = 'Flush',
            lowest_count_destroyed = false
        }
    },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.xmult,
                localize(card.ability.extra.type, 'poker_hands'),
                card.area and card.area == G.jokers and "...?" or ""
            }
        }
    end,
    generate_ui = function(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
        full_UI_table.name = localize {
            type = 'name',
            set = "Joker",
            key = card.ability and card.ability.extra.new_key or "j_hpfx_tribu",
            nodes = {}
        }
        SMODS.Center.generate_ui(self, info_queue, card, desc_nodes, specific_vars, full_UI_table)
    end,
    add_to_deck = function(self, card, from_debuff)
        card.ability.extra.new_key = "j_hpfx_tribu_alt"
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
    calculate = function(self, card, context)
        extra = card.ability and card.ability.extra or {}
        if context.joker_main and next(context.poker_hands[card.ability.extra.type]) then
            return {
                xmult = card.ability.extra.xmult,
            }
        end
        if context.destroy_card and not context.blueprint and context.scoring_hand then
            -- Count occurrences of each rank in scoring_hand
            local rank_counts = {}
            for _, c in ipairs(context.scoring_hand) do
                local rank = c:get_id()
                rank_counts[rank] = (rank_counts[rank] or 0) + 1
            end

            -- Find the minimum count
            local min_count = math.huge
            for _, count in pairs(rank_counts) do
                if count < min_count then min_count = count end
            end

            -- If the destroyed card is one of the lowest count ranks, remove it
            local destroyed_rank = context.destroy_card:get_id()
            if rank_counts[destroyed_rank] == min_count then
                extra.lowest_count_destroyed = true
                return { remove = true }
            end
        end
        if context.after and extra.lowest_count_destroyed then
            return {
                func = function()
                    hpfx_Transform(card, context)
                end
            }
        end
    end
}
