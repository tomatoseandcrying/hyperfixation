SMODS.Joker({
    key = 'tetoraq',
    rarity = 'nic_teto',
    atlas = 'J!CrossMod',
    pos = { x = 0, y = 0 },
    soul_pos = { x = 1, y = 0 },
    cost = 8,
    unlocked = false,
    discovered = false,
    blueprint_compat = false,
    eternal_compat = true,
    perishable_compat = true,
    config = {
        extra_slots_used = 0,
        extra = { iji_retriggers = 0 },
    },
    dependencies = { 'incognito' },
    loc_vars = function(self, info_queue, card)
        return {
            vars = {
                card.ability.extra.iji_retriggers
            }
        }
    end,
    check_for_unlock = function(self, args)
        return args.type == 'incognito'
    end,
    add_to_deck = function(self, card, from_debuff)
        local retrigger_joker = 0
        for _, c in pairs(G.jokers.cards) do
            if c.config.center.rarity == 'nic_teto' then
                retrigger_joker = retrigger_joker + 1
            end
        end
        card.ability.extra.iji_retriggers = retrigger_joker
    end,
    calculate = function(self, card, context)
        if context.card_added then
            local retrigger_joker = 0
            for _, c in pairs(G.jokers.cards) do
                if c.config.center.rarity == 'nic_teto' then
                    retrigger_joker = retrigger_joker + 1
                end
            end
            card.ability.extra.iji_retriggers = retrigger_joker
        end
        if context.repetition and context.cardarea == G.jokers
            and context.other_card.config.center_key == 'j_hpfx_ijiraq' then
            return {
                repetitions = card.ability.extra.iji_retriggers
            }
        end
    end,
    in_pool = function(self, args)
        for _, j in ipairs(G.jokers.cards) do
            if next(SMODS.find_card('j_hpfx_ijiraq', true)) then
                return true
            else
                return false
            end
        end
    end
})
