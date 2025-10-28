--Boulder
SMODS.Enhancement({
    key = 'boulder',
    pos = { x = 5, y = 0 },
    config = { bonus = 500 },
    replace_base_card = true,
    no_rank = true,
    no_suit = true,
    always_scores = true,
    loc_vars = function(self, info_queue, card)
        return { vars = { card.ability.bonus } }
    end,
    weight = 0
})
