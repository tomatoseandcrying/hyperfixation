local jd_def = JokerDisplay.Definitions
---@type JDJokerDefinition
jd_def["j_hpfx_moriah"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
    },
    text_config = {
        colour = G.C.CHIPS,
        scale = 0.4
    },
    extra = {
        {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult", retrigger_type = "mult" },
        },
    },
    extra_config = {
        colour = G.C.MULT,
        scale = 0.35
    },
    reminder_text = {
        { text = "+$" },
        { ref_table = "card.ability.extra", ref_value = "money", retrigger_type = "mult" },
    },
    reminder_text_config = {
        colour = G.C.MONEY,
        scale = 0.3
    },
}
