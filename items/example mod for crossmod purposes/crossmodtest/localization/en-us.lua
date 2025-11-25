return {
    descriptions = {
        Joker = {
            j_test_broker = {
                name = 'Good!',
                text = {
                    'This Joker will give you {C:mult}40{} Mult',
                    "{C:attention}and that's it.{}",
                },
            },
            j_test_broken = {
                name = 'Bad!',
                text = {
                    '{C:attention}THIS{} Joker, however, will give you {C:mult}40{} Mult',
                    'and also {C:money}4{} dollars at the {C:attention}end of the round.{}',
                    "{C:hpfx_IjiGray}It's also evil.{}"
                },
            },
            j_test_broken_alt = {
                name = 'Bad!!!!!!!!',
                text = { --the descriptions must be identical!
                    '{C:attention}THIS{} Joker, however, will give you {C:mult}40{} Mult',
                    'and also {C:money}4{} dollars at the {C:attention}end of the round.{}',
                    "{C:hpfx_IjiGray}It's also evil.{}"
                },
            },
        },
    },
}
