local jd_def = JokerDisplay.Definitions
--#region The Binding of Isaac

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
---@class JDJokerDefinition
jd_def["j_hpfx_iscariot"] = {
    text = {
        { text = "+", },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
    },
    text_config = { colour = G.C.CHIPS },
    reminder_text = { --Stolen from Matador
        { ref_table = "card.joker_display_values", ref_value = "active_text" },
    },
    calc_function = function(card)
        local boss_active = G.GAME and G.GAME.blind and G.GAME.blind.get_type and
            ((not G.GAME.blind.disabled) and (G.GAME.blind:get_type() == 'Boss'))
        card.joker_display_values.active = boss_active
        card.joker_display_values.active_text = localize(boss_active and 'k_active' or 'ph_no_boss_active')
    end,
    style_function = function(card, text, reminder_text, extra)
        if reminder_text and reminder_text.children[1] and card.joker_display_values then
            reminder_text.children[1].config.colour = card.joker_display_values.active and G.C.GREEN or
                G.C.RED
            reminder_text.children[1].config.scale = card.joker_display_values.active and 0.35 or 0.3
            return true
        end
        return false
    end
}
---@class JDJokerDefinition
jd_def["j_hpfx_cyanosis"] = {
    text = {
        { text = "+", },
        { ref_table = "card.ability.extra", ref_value = "chips", retrigger_type = "mult" },
    },
    text_config = { colour = G.C.CHIPS },
}
--#endregion
--#region 4Fun

---@class JDJokerDefinition
jd_def["j_hpfx_chud"] = {
    text = {
        {
            border_nodes = {
                { text = "X", },
                { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" },
            }
        }
    },
}
---@class JDJokerDefinition
jd_def["j_hpfx_marie"] = {
    text = {
        {
            border_nodes = {
                { text = "X", },
                { ref_table = "card.ability.extra", ref_value = "xmult", retrigger_type = "exp" },
            }
        }
    },
}
---@class JDJokerDefinition
jd_def["j_hpfx_no_bitches"] = {
    text = {
        {
            border_nodes = {
                { text = "X", },
                { ref_table = "Hyperfixation", ref_value = "bitchXM", retrigger_type = "exp" },
            }
        }
    },
}
---@class JDJokerDefinition
jd_def["j_hpfx_space_needle"] = {
    extra = {
        {
            { text = "(" },
            { ref_table = "card.joker_display_values", ref_value = "odds" },
            { text = ")" },
        }
    },
    extra_config = { colour = G.C.GREEN, scale = 0.3 },
    calc_function = function(card)
        local num, dem = SMODS.get_probability_vars(card, 1, card.ability.extra.odds, 'jdis_hpfx_needle')
        card.joker_display_values.odds = localize { type = 'variable', key = "jdis_odds", vars = { num, dem } }
    end
}
--#endregion
--#region Inscryption
---@class JDJokerDefinition
jd_def["j_hpfx_ijiraq"] = {
    text = {
        { text = "HELL", colour = G.C.MULT },
        { text = " no", },
    },
}
