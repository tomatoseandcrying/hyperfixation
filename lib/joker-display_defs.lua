local jd_def = JokerDisplay.Definitions
jd_def["j_hpfx_moriah"] = {
    text = {
        { text = "+" },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type },
    },
    text_config = {
        scale = 0.35,
        colour = G.C.CHIPS
    },
    extra = {
        {
            { text = "+" },
            { ref_table = "card.ability.extra", ref_value = "mult" }
        },
    },
    extra_config = {
        scale = 0.35,
        colour = G.C.MULT
    },
    reminder_text = {
        {
            { text = "$" },
            { ref_table = "card.ability.extra", ref_value = "money" }
        },
    },
    reminder_text_config = {
        scale = 0.35,
        colour = G.C.MONEY
    },
}
