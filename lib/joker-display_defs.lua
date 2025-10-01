local jd_def = JokerDisplay.Definitions
---@class JDJokerDefinition
jd_def["j_hpfx_moriah"] = {
    text = {
        { text = "+",                       colour = G.C.CHIPS },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult", colour = G.C.CHIPS },
        { text = " +",                      colour = G.C.MULT },
        { ref_table = "card.ability.extra", ref_value = "mult",  retrigger_type = "mult", colour = G.C.MULT },
    },

    extra = {
        {
            { text = "+$" },
            { ref_table = "card.ability.extra", ref_value = "money", retrigger_type = "mult" },
        },
    },
    extra_config = {
        colour = G.C.MONEY,
        scale = 0.3
    },
    reminder_text = {
        { text = "(Round)" }
    },
    reminder_text_config = {
        scale = 0.3
    },
}
---@class JDJokerDefinition
jd_def["j_hpfx_mary"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
    },
    text_config = {
        colour = G.C.MULT,
        scale = 0.4
    },
    reminder_text = {
        { text = "(" },
        { ref_table = "card.joker_display_values", ref_value = "active" },
        { text = ")" },
    },
    calc_function = function(card)
        card.joker_display_values.active = card.ability.extra.rounds - 1 == card.ability.extra.c_rounds and
            localize("k_active") or
            (card.ability.extra.c_rounds .. "/" .. card.ability.extra.rounds)
    end
}
