return {
    descriptions = {
        Joker = {
            j_hpfx_moriah = {
                name = 'Moriah',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "and {C:mult}+#2#{} Mult",
                    "Earn {C:money}$#3#{} at",
                    "end of the round"
                },
            },
            j_hpfx_mary = {
                name = 'Mary',
                text = {
                    "{C:mult}+#1#{} Mult in {C:attention}final",
                    "{C:attention}hand{} of round",
                    "Gains {C:mult}+#2#{} Mult",
                    "every {C:attention}#3#{} rounds",
                    "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
                },
            },
            j_hpfx_farmer = {
                name = 'Farmer',
                text = {
                    "{C:attention}+#1#{} Joker slot",
                    "{C:attention}+#1#{} card selection limit"
                    --"Doubles the probabilities of {C:purple}certain consumables{}" (hidden effect, commented out on purpose)
                },
            },
            j_hpfx_iscariot = {
                name = 'Iscariot',
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips",
                    "if {C:attention}consecutive{} played hand",
                    "triggers the {C:attention}Boss Blind{}",
                    "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}",         
                    "Sell this card to create",
                    "a {C:attention}Dark Judas{}"
        
                },
            },
            j_hpfx_cyanosis = {
                name = 'Cyanosis',
                text = {
                    "Each time you lose scoring {C:mult}Mult{}, this",
                    "Joker gains {X:chips, C:white}X10{} that amount of {C:chips}Chips{}",
                    "{s:0.7}I hate the Flint{}",
                    "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}"
                },
            },
            j_hpfx_choker = {
                name = 'Joker',
                text = {
                    "{C:mult}+#1#{} Mult{C:IjiGray}#2#{}"
                },
            },
            j_hpfx_choker_alt = {
                name = 'Joker{C:IjiGray}...?{}',
                text = {
                    "{C:mult}+#1#{} Mult{C:IjiGray}#2#{}"
                }
            }
        },
    },
}