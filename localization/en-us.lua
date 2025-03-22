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


            j_hpfx_ijiraq = {
                name = 'Ijiraq',
                text = {
                    "{C:mult}Does nothing rn lmfao{}"
                },
            },


            j_hpfx_choker = {
                name = 'Joker',
                text = {
                    "{C:mult}+#1#{} Mult{C:IjiGray, s:0.7}#2#{}"
                },
            },
            j_hpfx_choker_alt = {
                name = 'Joker{C:IjiGray, s:0.7}...?{}',
                text = {
                    "{C:mult}+#1#{} Mult{C:IjiGray, s:0.7}#2#{}"
                },
            },
            j_hpfx_chaoz = {
                name = 'Chaos the Clown',
                text={
                    "{C:attention}#1#{} free {C:green}Reroll",
                    "per shop{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_chaoz_alt = {
                name = 'Chaos the Clown{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:attention}#1#{} free {C:green}Reroll",
                    "per shop{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_jaunty = {
                name = 'Jolly Joker',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Pair{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_jaunty_alt = {
                name = 'Jolly Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Pair{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_saney = {
                name = 'Zany Joker',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Three of a Kind{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_saney_alt = {
                name = 'Zany Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Three of a Kind{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_angry = {
                name = 'Mad Joker',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Two Pair{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_angry_alt = {
                name = 'Mad Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Two Pair{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_homer = {
                name = 'Crazy Joker',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Straight{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_homer_alt = {
                name = 'Crazy Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Straight{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_lockbird = {
                name = 'Droll Joker',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Flush{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_lockbird_alt = {
                name = 'Droll Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}Flush{}{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_otherhalf = {
                name = 'Half Joker',
                text={
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "{C:attention}#2#{} or fewer cards{C:IjiGray, s:0.7}#3#{}",
                },
            },
            j_hpfx_otherhalf_alt = {
                name = 'Half Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:red}+#1#{} Mult if played",
                    "hand contains",
                    "{C:attention}#2#{} or fewer cards{C:IjiGray, s:0.7}#3#{}",
                },
            },
            j_hpfx_scaryandy = {
                name = 'Merry Andy',
                text={
                    "{C:red}+#1#{} discards",
                    "each round,",
                    "{C:red}#2#{} hand size{C:IjiGray, s:0.7}#3#{}",
                },
            },
            j_hpfx_scaryandy_alt = {
                name = 'Merry Andy{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:red}+#1#{} discards",
                    "each round,",
                    "{C:red}#2#{} hand size{C:IjiGray, s:0.7}#3#{}",
                },
            },
            j_hpfx_rocky = {
                name = 'Stone Joker',
                text={
                    "Gives {C:chips}+#1#{} Chips for",
                    "each {C:attention}Stone Card",
                    "in your {C:attention}full deck{C:IjiGray, s:0.7}#3#{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                },
            },
            j_hpfx_rocky_alt = {
                name = 'Stone Joker{C:IjiGray, s:0.7}...?{}',
                text={
                    "Gives {C:chips}+#1#{} Chips for",
                    "each {C:attention}Stone Card",
                    "in your {C:attention}full deck{C:IjiGray, s:0.7}#3#{}",
                    "{C:inactive}(Currently {C:chips}+#2#{C:inactive} Chips)",
                },
            },
            j_hpfx_jiggler = {
                name = 'Juggler',
                text={
                    "{C:attention}+#1#{} hand size{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_jiggler_alt = {
                name = 'Juggler{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:attention}+#1#{} hand size{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_bubbly = {
                name = 'Drunkard',
                text={
                    "{C:red}+#1#{} discard",
                    "each round{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_bubbly_alt = {
                name = 'Drunkard{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:red}+#1#{} discard",
                    "each round{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_trapezoid = {
                name = 'Acrobat',
                text={
                    "{X:red,C:white} X#1# {} Mult on {C:attention}final",
                    "{C:attention}hand{} of round{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_trapezoid_alt = {
                name = 'Acrobat{C:IjiGray, s:0.7}...?{}',
                text={
                    "{X:red,C:white} X#1# {} Mult on {C:attention}final",
                    "{C:attention}hand{} of round{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_bustin = {
                name = 'Sock and Buskin',
                text={
                    "Retrigger all",
                    "played {C:attention}face{} cards{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_bustin_alt = {
                name = 'Sock and Buskin{C:IjiGray, s:0.7}...?{}',
                text={
                    "Retrigger all",
                    "played {C:attention}face{} cards{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_mute = {
                name = 'Mime',
                text={
                    "Retrigger all",
                    "card {C:attention}held in",
                    "{C:attention}hand{} abilities{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_mute_alt = {
                name = 'Mime{C:IjiGray, s:0.7}...?{}',
                text={
                    "Retrigger all",
                    "card {C:attention}held in",
                    "{C:attention}hand{} abilities{C:IjiGray, s:0.7}#2#{}",
                }
            },
        },
    },
    misc = {
        dictionary = {
            hpfx_isaac_option = "Play with my TBOI stuff!",
            hpfx_ijiraq_option = "Release the Ijiraq.",
        }
    },
}