return {
    descriptions = {
        Joker = {

            --Isaac
            j_hpfx_moriah = {
                name = 'Moriah',
                text = {
                    "{C:chips}+#1#{} Chips",
                    "and {C:mult}+#2#{} Mult",
                    "Earn {C:money}$#3#{} at",
                    "end of the round"
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_oops'{}",
                    "{C:inactive}--Obtain {C:hpfx_inattention}Oops! All 6s {C:inactive}during a run{}"
                },
            },
            j_hpfx_mary = {
                name = 'Mary',
                text = {
                    "{C:mult}+#1#{} Mult on {C:attention}final",
                    "{C:attention}hand{} of round",
                    "Gains {C:mult}+#2#{} Mult",
                    "every {C:attention}#3#{} rounds",
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_7mult'{}",
                    "{C:inactive}--Score at least {C:hpfx_multiball}7 {C:inactive}Mult within a {C:hpfx_inattention}single hand{}",
                },
            },
            j_hpfx_farmer = {
                name = 'Farmer',
                text = {
                    "{C:attention}+#1#{} Joker slot",
                    "{C:attention}+#1#{} card selection limit",
                    --"Doubles the probabilities of {C:purple}certain consumables{}" (hidden effect, commented out on purpose)
                    "{C:inactive,E:2}#2#",
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_nope'{}",
                    "{C:inactive}--{C:hpfx_inPURPLE}Nope!{} {C:inactive}on Wheel of Fortune {C:hpfx_inattention}3 {C:inactive}times {C:hpfx_inattention}in a row{}"
                },
            },
            j_hpfx_iscariot = {
                name = 'Iscariot',
                text = {
                    "This Joker gains {C:chips}+#2#{} Chips for",
                    "each played card if played hand",
                    "triggers the {C:attention}Boss Blind{}",
                    "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}",
                    --"Turns {C:attention}Traitor{} when sold",

                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_devil'{}",
                    "{C:inactive}--Use {C:hpfx_inattention}The Devil {C:inactive}on a card {C:hpfx_inattention}3 {C:inactive}times{}"
                },
            },
            j_hpfx_cyanosis = {
                name = 'Cyanosis',
                text = {
                    "Each time you lose scoring {C:mult}Mult{}, this",
                    "Joker gains {X:chips,C:white}X10{} that amount of {C:chips}Chips{}",
                    "{s:0.7}I hate the Flint{}",
                    "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}"
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_momheart'{}",
                    "{C:inactive}--Defeat the {C:hpfx_bossmute}Crimson Heart {C:hpfx_inattention}ten {C:inactive}times{}",
                },
            },

            --Non-Specific Additions
            j_hpfx_chud = {
                name = 'chud joker',
                text = {
                    "{s:3,E:1,C:dark_edition}nothing ever happens{}",
                    "{C:inactive,s:0.7}(Currently {X:mult,C:white,s:0.7}X#1#{} {C:inactive,s:0.7}Mult){}",


                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_chud'{}",
                    "{C:inactive}--Defeat a {C:hpfx_bossmute}Boss Blind {C:inactive}past Ante 2 {C:hpfx_inattention}without {C:inactive}triggering a Joker{}"
                },
            },
            j_hpfx_marie = {
                name = 'Marie Antoinette',
                text = {
                    "This Joker gains {X:mult,C:white}X#2#{} Mult when",
                    "a {C:attention}Queen{} is destroyed, resets",
                    "when {C:attention}Boss Blind{} is defeated",
                    "{C:inactive}(Currently {X:mult,C:white}X#1#{} {C:inactive}Mult){}",
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_head'{}",
                    "{C:inactive}--Destroy {C:hpfx_inattention}37 {C:inactive}Queens"
                }
            },
            j_hpfx_space_needle = {
                name = 'Space Needle',
                text = {
                    "{C:green}#1# in #2#{} chance to create the",
                    "{C:planet}Planet{} card of your {C:attention}most played{} hand",
                    "{C:inactive}(Timing changes on trigger and {E:1,C:dark_edition}per ante?{C:inactive}){}",
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_needle'{}",
                    "{C:inactive}--Win a run without upgrading your {C:hpfx_inattention}most played{} hand"
                },
            },
            j_hpfx_no_bitches = {
                name = 'No Bitches?',
                text = {
                    "{X:mult,C:white}X#1#{} Mult for every Queen",
                    "{C:attention}not{} in your {C:attention}full deck{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{} {C:inactive}Mult){}",
                },
                unlock = {
                    "{C:purple}return{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_no_bitches'{}",
                    "{C:inactive}--Win a run without scoring a {C:hpfx_inattention}Queen{}"
                },
            },

            --Ijiraq
            j_hpfx_ijiraq = {
                name = 'Ijiraq',
                text = {
                    "{C:attention}Inherits{} the ability of every Joker it disguised as {C:attention}this run.{}",
                    "{C:red,E:2}Destroys{} all other copies of Ijiraq."
                },
            },
            j_hpfx_costume = {
                name = 'whoops',
                text = {
                    'if you can see this i fucked up',
                }
            },
            j_hpfx_trapezoid = {
                name = 'Acrobat',
                text = {
                    "{X:red,C:white}X#1#{} Mult on {C:attention}final",
                    "{C:attention}hand{} of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_trapezoid_alt = {
                name = 'Acrobat{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:red,C:white}X#1#{} Mult on {C:attention}final",
                    "{C:attention}hand{} of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_scaryandy = {
                name = 'Merry Andy',
                text = {
                    "{C:red}+#1#{} discards",
                    "each round,",
                    "{C:red}#2#{} hand size{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_scaryandy_alt = {
                name = 'Merry Andy{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:red}+#1#{} discards",
                    "each round,",
                    "{C:red}#2#{} hand size{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_expired = {
                name = 'Credit Card',
                text = {
                    "Go up to",
                    "{C:red}-$#1#{} in debt{C:hpfx_IjiGray}#2#{}",
                }
            },
            j_hpfx_expired_alt = {
                name = 'Credit Card{C:hpfx_IjiGray}...?{}',
                text = {
                    "Go up to",
                    "{C:red}-$#1#{} in debt{C:hpfx_IjiGray}#2#{}",
                }
            },
            j_hpfx_bard = {
                name = 'Troubadour',
                text = {
                    "{C:attention}+#1#{} hand size,",
                    "{C:blue}#2#{} hand each round{C:hpfx_IjiGray}#3#{}",
                }
            },
            j_hpfx_bard_alt = {
                name = 'Troubadour{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:attention}+#1#{} hand size,",
                    "{C:blue}#2#{} hand each round{C:hpfx_IjiGray}#3#{}",
                }
            },
            j_hpfx_flag = {
                name = 'Banner',
                text = {
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard{}{C:hpfx_IjiGray}#2#{}",
                }
            },
            j_hpfx_flag_alt = {
                name = 'Banner{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard{}{C:hpfx_IjiGray}#2#{}",
                }
            },
            j_hpfx_twistit = {
                name = 'Mystic Summit',
                text = {
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#2#{} discards",
                    "remaining{C:hpfx_IjiGray}#3#{}",
                }
            },
            j_hpfx_twistit_alt = {
                name = 'Mystic Summit{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#2#{} discards",
                    "remaining{C:hpfx_IjiGray}#3#{}",
                }
            },
            j_hpfx_porcelain = {
                name = "Marble Joker",
                text = {
                    "Adds one {C:attention}Stone{} card",
                    "to deck when",
                    "{C:attention}Blind{} is selected{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_porcelain_alt = {
                name = "Marble Joker{C:hpfx_IjiGray}...?",
                text = {
                    "Adds one {C:attention}Stone{} card",
                    "to deck when",
                    "{C:attention}Blind{} is selected{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_redeemed = {
                name = "Loyalty Card",
                text = {
                    "{X:red,C:white}X#1#{} Mult every",
                    "{C:attention}6{} hands played{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}5 remaining",
                },
            },
            j_hpfx_redeemed_alt = {
                name = "Loyalty Card{C:hpfx_IjiGray}...?",
                text = {
                    "{X:red,C:white}X#1#{} Mult every",
                    "{C:attention}6{} hands played{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}5 remaining",
                },
            },
            j_hpfx_whack = {
                name = "Hack",
                text = {
                    "Retrigger",
                    "each played",
                    "{C:attention}#4#{}, {C:attention}#5#{}, {C:attention}#6#{}, or {C:attention}#7#{}{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_whack_alt = {
                name = "Hack{C:hpfx_IjiGray}...?",
                text = {
                    "Retrigger",
                    "each played",
                    "{C:attention}#4#{}, {C:attention}#5#{}, {C:attention}#6#{}, or {C:attention}#7#{}{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_reprint = {
                name = "Misprint",
                text = {
                    ""
                },
            },
            j_hpfx_reprint_alt = {
                name = "Misprint{C:hpfx_IjiGray}...?",
                text = {
                    ""
                },
            },
            j_hpfx_iron = {
                name = "Steel Joker",
                text = {
                    "Gives {X:mult,C:white}X#1#{} Mult",
                    "for each {C:attention}Steel Card",
                    "in your {C:attention}full deck{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_iron_alt = {
                name = "Steel Joker{C:hpfx_IjiGray}...?",
                text = {
                    "Gives {X:mult,C:white} X#1# {} Mult",
                    "for each {C:attention}Steel Card",
                    "in your {C:attention}full deck{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_braised = {
                name = "Raised Fist",
                text = {
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_braised_alt = {
                name = "Raised Fist{C:hpfx_IjiGray}...?",
                text = {
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_pyramid = {
                name = "Golden Joker",
                text = {
                    "Earn {C:money}$#1#{} at",
                    "end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_pyramid_alt = {
                name = "Golden Joker{C:hpfx_IjiGray}...?",
                text = {
                    "Earn {C:money}$#1#{} at",
                    "end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_bluebell = {
                name = "Blueprint",
                text = {
                    "Copies ability of",
                    "{C:attention}Joker{} to the right{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_bluebell_alt = {
                name = "Blueprint{C:hpfx_IjiGray}...?",
                text = {
                    "Copies ability of",
                    "{C:attention}Joker{} to the right{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_chaoz = {
                name = "Chaos the Clown",
                text = {
                    "{C:attention}#1#{} free {C:green}Reroll",
                    "per shop{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_chaoz_alt = {
                name = "Chaos the Clown{C:hpfx_IjiGray}...?",
                text = {
                    "{C:attention}#1#{} free {C:green}Reroll",
                    "per shop{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_jiggler = {
                name = "Juggler",
                text = {
                    "{C:attention}+#1#{} hand size{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_jiggler_alt = {
                name = "Juggler{C:hpfx_IjiGray}...?",
                text = {
                    "{C:attention}+#1#{} hand size{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_scrumpy = {
                name = "Drunkard",
                text = {
                    "{C:red}+#1#{} discard",
                    "each round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_scrumpy_alt = {
                name = "Drunkard{C:hpfx_IjiGray}...?",
                text = {
                    "{C:red}+#1#{} discard",
                    "each round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_fiberglass = {
                name = "Glass Joker",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Glass Card",
                    "that is destroyed{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_fiberglass_alt = {
                name = "Glass Joker{C:hpfx_IjiGray}...?",
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Glass Card",
                    "that is destroyed{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_pomni = {
                name = 'Abstract Joker',
                text = {
                    "{C:mult}+#1#{} Mult for",
                    "each {C:attention}Joker{} card{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    "",
                    "{X:hpfx_IjiGray,C:white}#3#/4{}"
                },
            },
            j_hpfx_pomni_alt = {
                name = 'Abstract Joker{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:mult}+#1#{} Mult for",
                    "each {C:attention}Joker{} card{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    "",
                    "{X:hpfx_IjiGray,C:white}#3#/4{}"
                },
            },
            j_hpfx_belated_grat = {
                name = 'Delayed Gratification',
                text = {
                    "Earn {C:money}$#1#{} per {C:attention}discard{} if",
                    "no discards are used",
                    "by end of the round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_belated_grat_alt = {
                name = 'Delayed Gratification{C:hpfx_IjiGray}...?{}',
                text = {
                    "Earn {C:money}$#1#{} per {C:attention}discard{} if",
                    "no discards are used",
                    "by end of the round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_tocket = {
                name = 'Golden Ticket',
                text = {
                    "Played {C:attention}Gold{} cards",
                    "earn {C:money}$#1#{} when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_tocket_alt = {
                name = 'Golden Ticket{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played {C:attention}Gold{} cards",
                    "earn {C:money}$#1#{} when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_apophenia = {
                name = 'Pareidolia',
                text = {
                    "All cards are",
                    "considered",
                    "{C:attention}face{} cards{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_apophenia_alt = {
                name = 'Pareidolia{C:hpfx_IjiGray}...?{}',
                text = {
                    "All cards are",
                    "considered",
                    "{C:attention}face{} cards{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_not_fortune_teller = {
                name = 'Cartomancer',
                text = {
                    "Create a {C:tarot}Tarot{} card",
                    "when {C:attention}Blind{} is selected{C:hpfx_IjiGray}#1#{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_not_fortune_teller_alt = {
                name = 'Cartomancer{C:hpfx_IjiGray}...?{}',
                text = {
                    "Create a {C:tarot}Tarot{} card",
                    "when {C:attention}Blind{} is selected{C:hpfx_IjiGray}#1#{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_odd_steven = {
                name = 'Even Steven',
                text = {
                    "Played cards with",
                    "{C:attention}even{} rank give",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(10, 8, 6, 4, 2)",
                },
            },
            j_hpfx_odd_steven_alt = {
                name = 'Even Steven{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played cards with",
                    "{C:attention}even{} rank give",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(10, 8, 6, 4, 2)",
                },
            },
            j_hpfx_even_todd = {
                name = 'Odd Todd',
                text = {
                    "Played cards with",
                    "{C:attention}odd{} rank give",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(A, 9, 7, 5, 3)",
                },
            },
            j_hpfx_even_todd_alt = {
                name = 'Odd Todd{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played cards with",
                    "{C:attention}odd{} rank give",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(A, 9, 7, 5, 3)",
                },
            },
            j_hpfx_flunkie = {
                name = 'Scholar',
                text = {
                    "Played {C:attention}Aces{}",
                    "give {C:chips}+#2#{} Chips",
                    "and {C:mult}+#1#{} Mult",
                    "when scored{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_flunkie_alt = {
                name = 'Scholar{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played {C:attention}Aces{}",
                    "give {C:chips}+#2#{} Chips",
                    "and {C:mult}+#1#{} Mult",
                    "when scored{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_ribtickler = {
                name = 'Mr. Bones',
                text = {
                    "Prevents Death",
                    "if chips scored",
                    "are at least {C:attention}25%",
                    "of required chips",
                    "{S:1.1,C:red,E:2}self destructs{}{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_ribtickler_alt = {
                name = 'Mr. Bones{C:hpfx_IjiGray}...?{}',
                text = {
                    "Prevents Death",
                    "if chips scored",
                    "are at least {C:attention}25%",
                    "of required chips",
                    "{S:1.1,C:red,E:2}self destructs{}{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_peeking_twice = {
                name = 'Seeing Double',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand has a scoring",
                    "{C:clubs}Club{} card and a scoring",
                    "card of any other {C:attention}suit{}{C:hpfx_IjiGray}#5#{}",
                    "",
                    "{s:0.5}[{C:diamonds}#2#{}, {C:hearts}#3#{}, {C:spades}#4#{}]{}",
                },
            },
            j_hpfx_peeking_twice_alt = {
                name = 'Seeing Double{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand has a scoring",
                    "{C:clubs}Club{} card and a scoring",
                    "card of any other {C:attention}suit{}{C:hpfx_IjiGray}#5#{}",
                    "",
                    "{s:0.5}[{C:diamonds}#2#{}, {C:hearts}#3#{}, {C:spades}#4#{}]{}",
                },
            },
            j_hpfx_dupla = {
                name = 'The Duo',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_dupla_alt = {
                name = 'The Duo{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_triada = {
                name = 'The Trio',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_triada_alt = {
                name = 'The Trio{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_familia = {
                name = 'The Family',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_familia_alt = {
                name = 'The Family{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_orden = {
                name = 'The Order',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_orden_alt = {
                name = 'The Order{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_tribu = {
                name = 'The Tribe',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_tribu_alt = {
                name = 'The Tribe{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_7_ball = {
                name = '8 Ball',
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}#4#{} to create a",
                    "{C:tarot}Tarot{} card when scored",
                    "{C:inactive}(Must have room){C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_7_ball_alt = {
                name = '8 Ball{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}#4#{} to create a",
                    "{C:tarot}Tarot{} card when scored",
                    "{C:inactive}(Must have room){C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_golden_ratio = {
                name = 'Fibonacci',
                text = {
                    "Each played {C:attention}#4#{},",
                    "{C:attention}#5#{}, {C:attention}#6#{}, {C:attention}#7#{}, or {C:attention}#8#{} gives",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_golden_ratio_alt = {
                name = 'Fibonacci{C:hpfx_IjiGray}...?{}',
                text = {
                    "Each played #4#,",
                    "#5#, #6#, #7#, or #8# gives",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_cutout = {
                name = 'Joker Stencil',
                text = {
                    "{X:red,C:white}X1{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Joker Stencil included",
                    "{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive}{C:hpfx_IjiGray}#2#{})",
                },
            },
            j_hpfx_cutout_alt = {
                name = 'Joker Stencil{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:red,C:white}X1{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Joker Stencil included",
                    "{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive}{C:hpfx_IjiGray}#2#{})",
                },
            },
            j_hpfx_time = {
                name = "Space Joker",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_time_alt = {
                name = "Space Joker{C:hpfx_IjiGray}...?",
                text = {
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_manolo = {
                name = "Matador",
                text = {
                    "Earn {C:mult}$#1#{} if played",
                    "hand triggers the",
                    "{C:attention}Boss Blind{} ability{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_manolo_alt = {
                name = "Matador{C:hpfx_IjiGray}...?",
                text = {
                    "Earn {C:mult}$#1#{} if played",
                    "hand triggers the",
                    "{C:attention}Boss Blind{} ability{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_ritual = {
                name = "Ceremonial Dagger",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and permanently add {C:attention}double",
                    "its sell value to this {C:red}Mult{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                }
            },
            j_hpfx_ritual_alt = {
                name = "Ceremonial Dagger{C:hpfx_IjiGray}...?",
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and permanently add {C:attention}double",
                    "its sell value to this {C:red}Mult{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                }
            },
            j_hpfx_showman = {
                name = "Showman",
                text = {
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_showman_alt = {
                name = "Showman{C:hpfx_IjiGray}...?",
                text = {
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_nix_sense = {
                name = "Sixth Sense",
                text = {
                    "If {C:attention}first hand{} of round is",
                    "a single {C:attention}6{}, destroy it and",
                    "create a {C:spectral}Spectral{} card{C:hpfx_IjiGray}#1#",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_nix_sense_alt = {
                name = "Sixth Sense{C:hpfx_IjiGray}...?",
                text = {
                    "If {C:attention}first hand{} of round is",
                    "a single {C:attention}6{}, destroy it and",
                    "create a {C:spectral}Spectral{} card{C:hpfx_IjiGray}#1#",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_not_cartomancer = {
                name = "Fortune Teller",
                text = {
                    "{C:red}+#1#{} Mult per {C:purple}Tarot{}",
                    "card used this run{C:hpfx_IjiGray}#5#",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
                },
            },
            j_hpfx_not_cartomancer_alt = {
                name = "Fortune Teller{C:hpfx_IjiGray}...?",
                text = {
                    "{C:red}+#1#{} Mult per {C:purple}Tarot{}",
                    "card used this run{C:hpfx_IjiGray}#5#",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
                },
            },
            j_hpfx_dont_come_back = {
                name = 'Hit The Road',
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Jack{}",
                    "discarded this round{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "{C:attention}#5#{} #6#",
                },
            },
            j_hpfx_dont_come_back_alt = {
                name = 'Hit The Road{C:hpfx_IjiGray}...?{}',
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Jack{}",
                    "discarded this round{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "{C:attention}#5#{} #6#",
                },
            },
            j_hpfx_daisy_vase = {
                name = 'Flower Pot',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if poker",
                    "hand contains a",
                    "{C:diamonds}#3#{} card, {C:hearts}#4#{} card,",
                    "{C:spades}#5#{} card, and {C:clubs}#6#{} card{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_daisy_vase_alt = {
                name = 'Flower Pot{C:hpfx_IjiGray}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if poker",
                    "hand contains a",
                    "{C:diamonds}#3#{} card, {C:hearts}#4#{} card,",
                    "{C:spades}#5#{} card, and {C:clubs}#6#{} card{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_get_an_uber = {
                name = 'Ride The Bus',
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "per {C:attention}consecutive{} hand",
                    "played without a",
                    "scoring {C:attention}face{} card{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_get_an_uber_alt = {
                name = 'Ride The Bus{C:hpfx_IjiGray}...?{}',
                text = {
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "per {C:attention}consecutive{} hand",
                    "played without a",
                    "scoring {C:attention}face{} card{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_take_the_sun = {
                name = 'Shoot The Moon',
                text = {
                    "Each {C:attention}Queen{}",
                    "held in hand",
                    "gives {C:mult}+#1#{} Mult{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_take_the_sun_alt = {
                name = 'Shoot The Moon{C:hpfx_IjiGray}...?{}',
                text = {
                    "Each {C:attention}Queen{}",
                    "held in hand",
                    "gives {C:mult}+#1#{} Mult{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_smudged = {
                name = 'Smeared Joker',
                text = {
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds",
                    "count as the same suit,",
                    "{C:spades}Spades{} and {C:clubs}Clubs",
                    "count as the same suit{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_smudged_alt = {
                name = 'Smeared Joker{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds",
                    "count as the same suit,",
                    "{C:spades}Spades{} and {C:clubs}Clubs",
                    "count as the same suit{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_whoops = {
                name = 'Oops! All 6s',
                text = {
                    "Doubles all {C:attention}listed",
                    "{C:green,E:1,S:1.1}probabilities{}{C:hpfx_IjiGray}#1#{}",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}2 in 3{C:inactive})",
                },
            },
            j_hpfx_whoops_alt = {
                name = 'Oops! All 6s{C:hpfx_IjiGray}...?{}',
                text = {
                    "Doubles all {C:attention}listed",
                    "{C:green,E:1,S:1.1}probabilities{}{C:hpfx_IjiGray}#1#{}",
                    "{C:inactive}(ex: {C:green}1 in 3{C:inactive} -> {C:green}2 in 3{C:inactive})",
                },
            },
            j_hpfx_and_thumb = {
                name = 'Four Fingers',
                text = {
                    "All {C:attention}Flushes{} and",
                    "{C:attention}Straights{} can be",
                    "made with {C:attention}4{} cards{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_and_thumb_alt = {
                name = 'Four Fingers{C:hpfx_IjiGray}...?{}',
                text = {
                    "All {C:attention}Flushes{} and",
                    "{C:attention}Straights{} can be",
                    "made with {C:attention}4{} cards{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_close_michelle = {
                name = 'Gros Michel',
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this",
                    "card is destroyed",
                    "at end of round{C:hpfx_IjiGray}#4#{}",
                },
            },
            j_hpfx_close_michelle_alt = {
                name = 'Gros Michel{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:mult}+#1#{} Mult",
                    "{C:green}#2# in #3#{} chance this",
                    "card is destroyed",
                    "at end of round{C:hpfx_IjiGray}#4#{}",
                },
            },
            j_hpfx_buttowski = {
                name = 'Stuntman',
                text = {
                    "{C:chips}+#1#{} Chips,",
                    "{C:attention}-#2#{} hand size{C:hpfx_IjiGray}#4#{}",
                },
            },
            j_hpfx_buttowski_alt = {
                name = 'Stuntman{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:chips}+#1#{} Chips,",
                    "{C:attention}#5##2#{} hand size{C:hpfx_IjiGray}#4#{}",
                },
            },
            j_hpfx_hung_chad = {
                name = 'Hanging Chad',
                text = {
                    "Retrigger {C:attention}first{} played",
                    "card used in scoring",
                    "{C:attention}#1#{} additional times{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_hung_chad_alt = {
                name = 'Hanging Chad{C:hpfx_IjiGray}...?{}',
                text = {
                    "Retrigger {C:attention}first{} played",
                    "card used in scoring",
                    "{C:attention}#1#{} additional times{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_learners_permit = {
                name = "Driver's License",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if you have",
                    "at least {C:attention}16{} Enhanced",
                    "cards in your full deck{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive})"
                },
            },
            j_hpfx_learners_permit_alt = {
                name = "Driver's License{C:hpfx_IjiGray}...?{}",
                text = {
                    "{X:mult,C:white} X#1# {} Mult if you have",
                    "at least {C:attention}16{} Enhanced",
                    "cards in your full deck{C:hpfx_IjiGray}#2#{}",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive})",
                },
            },
            j_hpfx_invincible = {
                name = 'Invisible Joker',
                text = {
                    "After {C:attention}#1#{} rounds,",
                    "sell this card to",
                    "{C:attention}Duplicate{} a random Joker{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)",
                },
            },
            j_hpfx_invincible_alt = {
                name = 'Invisible Joker{C:hpfx_IjiGray}...?{}',
                text = {
                    "After {C:attention}#1#{} rounds,",
                    "sell this card to",
                    "{C:attention}Duplicate{} a random Joker{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:attention}#2#{C:inactive}/#1#)",
                },
            },
            j_hpfx_galilimbo = {
                name = 'Astronomer',
                text = {
                    "All {C:planet}Planet{} cards and",
                    "{C:planet}Celestial Packs{} in",
                    "the shop are {C:attention}free{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_galilimbo_alt = {
                name = 'Astronomer{C:hpfx_IjiGray}...?{}',
                text = {
                    "All {C:planet}Planet{} cards and",
                    "{C:planet}Celestial Packs{} in",
                    "the shop are {C:attention}free{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_charred = {
                name = 'Burnt Joker',
                text = {
                    "Upgrade the level of",
                    "the first {C:attention}discarded",
                    "poker hand each round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_charred_alt = {
                name = 'Burnt Joker{C:hpfx_IjiGray}...?{}',
                text = {
                    "Upgrade the level of",
                    "the first {C:attention}discarded",
                    "poker hand each round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_dawn = {
                name = 'Dusk',
                text = {
                    "Retrigger all played",
                    "cards in {C:attention}final",
                    "{C:attention}hand{} of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_dawn_alt = {
                name = 'Dusk{C:hpfx_IjiGray}...?{}',
                text = {
                    "Retrigger all played",
                    "cards in {C:attention}final",
                    "{C:attention}hand{} of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_flashforward = {
                name = 'Throwback',
                text = {
                    "{X:mult,C:white}X#1#{} Mult for each",
                    "{C:attention}Blind{} skipped this run{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_flashforward_alt = {
                name = 'Throwback{C:hpfx_IjiGray,}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult for each",
                    "{C:attention}Blind{} skipped this run{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_stormcloud = {
                name = 'Brainstorm',
                text = {
                    "Copies the ability",
                    "of leftmost {C:attention}Joker{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_stormcloud_alt = {
                name = 'Brainstorm{C:hpfx_IjiGray,}...?{}',
                text = {
                    "Copies the ability",
                    "of leftmost {C:attention}Joker{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_apollo = {
                name = 'Satellite',
                text = {
                    "Earn {C:money}$#1#{} at end of",
                    "round per unique {C:planet}Planet",
                    "card used this run{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
                },
            },
            j_hpfx_apollo_alt = {
                name = 'Satellite{C:hpfx_IjiGray}...?{}',
                text = {
                    "Earn {C:money}$#1#{} at end of",
                    "round per unique {C:planet}Planet",
                    "card used this run{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:money}$#2#{C:inactive})",
                },
            },
            j_hpfx_snowgrave = {
                name = 'Rough Gem',
                text = {
                    "Played cards with",
                    "{C:diamonds}Diamond{} suit earn",
                    "{C:money}$#1#{} when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_snowgrave_alt = {
                name = 'Rough Gem{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played cards with",
                    "{C:diamonds}Diamond{} suit earn",
                    "{C:money}$#1#{} when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_sanguinerock = {
                name = 'Bloodstone',
                text = {
                    "{C:green}#1# in #2#{} chance for",
                    "played cards with",
                    "{C:hearts}Heart{} suit to give",
                    "{X:mult,C:white}X#3#{} Mult when scored{C:hpfx_IjiGray}#4#{}",
                },
            },
            j_hpfx_sanguinerock_alt = {
                name = 'Bloodstone{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:green}#1# in #2#{} chance for",
                    "played cards with",
                    "{C:hearts}Heart{} suit to give",
                    "{X:mult,C:white}X#3#{} Mult when scored{C:hpfx_IjiGray}#4#{}",
                },
            },
            j_hpfx_ahead = {
                name = 'Arrowhead',
                text = {
                    "Played cards with",
                    "{C:spades}Spade{} suit give",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_ahead_alt = {
                name = 'Arrowhead{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played cards with",
                    "{C:spades}Spade{} suit give",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_obsidian = {
                name = 'Onyx Agate',
                text = {
                    "Played cards with",
                    "{C:clubs}Club{} suit give",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_obsidian_alt = {
                name = 'Onyx Agate{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played cards with",
                    "{C:clubs}Club{} suit give",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_canio = {
                name = 'Canio',
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "when a {C:attention}face{} card",
                    "is destroyed{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_canio_alt = {
                name = 'Canio{C:hpfx_IjiGray}...?{}',
                text = {
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "when a {C:attention}face{} card",
                    "is destroyed{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_dribblinit = {
                name = 'Triboulet',
                text = {
                    "Played {C:attention}Kings{} and",
                    "{C:attention}Queens{} each give",
                    "{X:mult,C:white}X#1#{} Mult when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_dribblinit_alt = {
                name = 'Triboulet{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played {C:attention}Kings{} and",
                    "{C:attention}Queens{} each give",
                    "{X:mult,C:white}X#1#{} Mult when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_yomorty = {
                name = 'Yorick',
                text = {
                    "This Joker gains",
                    "{X:mult,C:white}X#1#{} Mult every {C:attention}#2#{C:inactive} [#3#]{}",
                    "cards discarded{C:hpfx_IjiGray}#5#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#4#{C:inactive} Mult)",
                },
            },
            j_hpfx_yomorty_alt = {
                name = 'Yorick{C:hpfx_IjiGray}...?{}',
                text = {
                    "This Joker gains",
                    "{X:mult,C:white} X#1# {} Mult every {C:attention}#2#{C:inactive} [#3#]{}",
                    "cards discarded{C:hpfx_IjiGray}#5#{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#4# {C:inactive} Mult)",
                },
            },
            j_hpfx_anglerais = {
                name = 'Chicot',
                text = {
                    "Disables effect of",
                    "every {C:attention}Boss Blind{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_anglerais_alt = {
                name = 'Chicot{C:hpfx_IjiGray}...?{}',
                text = {
                    "Disables effect of",
                    "every {C:attention}Boss Blind{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_perknado = {
                name = 'Perkeo',
                text = {
                    "Creates a {C:dark_edition}Negative{} copy of",
                    "{C:attention}1{} random {C:attention}#3#{}",
                    "card in your possession",
                    "at the end of the {C:attention}shop{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_perknado_alt = {
                name = 'Perkeo{C:hpfx_IjiGray}...?{}',
                text = {
                    "Creates a {C:dark_edition}Negative{} copy of",
                    "{C:attention}1{} random {C:attention}#3#{}",
                    "#4#in your possession",
                    "at the end of the {C:attention}shop{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_sirtificate = {
                name = 'Certificate',
                text = {
                    "When round begins,",
                    "add a random {C:attention}playing",
                    "{C:attention}card{} with a random",
                    "{C:attention}seal{} to your hand{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_sirtificate_alt = {
                name = 'Certificate{C:hpfx_IjiGray}...?{}',
                text = {
                    "When round begins,",
                    "add a random {C:attention}playing",
                    "{C:attention}card{} with a random",
                    "{C:attention}seal{} to your hand{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_shoebuckles = {
                name = 'Bootstraps',
                text = {
                    "{C:mult}+#1#{} Mult for every",
                    "{C:money}$#2#{} you have{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
                },
            },
            j_hpfx_shoebuckles_alt = {
                name = 'Bootstraps{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:mult}+#1#{} Mult for every",
                    "{C:money}$#2#{} you have{C:hpfx_IjiGray}#4#{}",
                    "{C:inactive}(Currently {C:mult}+#3#{C:inactive} Mult)",
                },
            },
            j_hpfx_chicken = {
                name = 'Egg',
                text = {
                    "Gains {C:money}$#1#{} of",
                    "{C:attention}sell value{} at",
                    "end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_chicken_alt = {
                name = 'Egg{C:hpfx_IjiGray}...?{}',
                text = {
                    "Gains {C:money}$#1#{} of",
                    "{C:attention}sell value{} at",
                    "end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_robber = {
                name = 'Burglar',
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:blue}+#1#{} Hands and",
                    "{C:attention}lose all discards{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_robber_alt = {
                name = 'Burglar{C:hpfx_IjiGray}...?{}',
                text = {
                    "When {C:attention}Blind{} is selected,",
                    "gain {C:blue}+#1#{} Hands and",
                    "{C:attention}lose all discards{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_splatter = {
                name = 'Splash',
                text = {
                    "Every {C:attention}played card",
                    "counts in scoring{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_splatter_alt = {
                name = 'Splash{C:hpfx_IjiGray}...?{}',
                text = {
                    "Every {C:attention}played card",
                    "counts in scoring{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_sagittarius = {
                name = 'Constellation',
                text = {
                    "This Joker gains",
                    "{X:mult,C:white}X#1#{} Mult every time",
                    "a {C:planet}Planet{} card is used{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_sagittarius_alt = {
                name = 'Constellation{C:hpfx_IjiGray}...?{}',
                text = {
                    "This Joker gains",
                    "{X:mult,C:white}X#1#{} Mult every time",
                    "a {C:planet}Planet{} card is used{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_hitchhiker = {
                name = 'Hiker',
                text = {
                    "Every played {C:attention}card{}",
                    "permanently gains",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_hitchhiker_alt = {
                name = 'Hiker{C:hpfx_IjiGray}...?{}',
                text = {
                    "Every played {C:attention}card{}",
                    "permanently gains",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_noface = {
                name = 'Faceless Joker',
                text = {
                    "Earn {C:money}$#1#{} if {C:attention}#2#{} or",
                    "more {C:attention}face cards{}",
                    "are discarded",
                    "at the same time{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_noface_alt = {
                name = 'Faceless Joker{C:hpfx_IjiGray}...?{}',
                text = {
                    "Earn {C:money}$#1#{} if {C:attention}#2#{} or",
                    "more {C:attention}face cards{}",
                    "are discarded",
                    "at the same time{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_rectangle = {
                name = 'Square Joker',
                text = {
                    "{C:inactive,s:0.85}Get me the hell out of here!{}",
                },
            },
            j_hpfx_rectangle_alt = {
                name = 'Prisoner.',
                text = {
                    "{C:inactive,s:0.85}Get me the hell out of here!{}",
                },
            },
            j_hpfx_jumbo = {
                name = 'Joker',
                text = {
                    "{C:red,s:1.1}+#1#{} Mult{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_jumbo_alt = {
                name = 'Joker{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:red,s:1.1}+#1#{} Mult{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_secretway = {
                name = 'Shortcut',
                text = {
                    "Allows {C:attention}Straights{} to be",
                    "made with gaps of {C:attention}1 rank{C:hpfx_IjiGray}#1#{}",
                    "{C:inactive}(ex: {C:attention}10 8 6 5 3{C:inactive})",
                },
            },
            j_hpfx_secretway_alt = {
                name = 'Shortcut{C:hpfx_IjiGray}...?{}',
                text = {
                    "Allows {C:attention}Straights{} to be",
                    "made with gaps of {C:attention}1 rank{C:hpfx_IjiGray}#1#{}",
                    "{C:inactive}(ex: {C:attention}10 8 6 5 3{C:inactive})",
                },
            },
            j_hpfx_earthbound = {
                name = 'Cloud 9',
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}9{} in your {C:attention}full deck",
                    "at end of round{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:money}$#2#{}{C:inactive})",
                },
            },
            j_hpfx_earthbound_alt = {
                name = 'Cloud 9{C:hpfx_IjiGray}...?{}',
                text = {
                    "Earn {C:money}$#1#{} for each",
                    "{C:attention}9{} in your {C:attention}full deck",
                    "at end of round{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Currently {C:money}$#2#{}{C:inactive})",
                },
            },
            j_hpfx_blastoff = {
                name = 'Rocket',
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "Payout increases by {C:money}$#2#{}",
                    "when {C:attention}Boss Blind{} is defeated{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_blastoff_alt = {
                name = 'Rocket{C:hpfx_IjiGray}...?{}',
                text = {
                    "Earn {C:money}$#1#{} at end of round",
                    "Payout increases by {C:money}$#2#{}",
                    "when {C:attention}Boss Blind{} is defeated{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_wrestler = {
                name = 'Luchador',
                text = {
                    "Sell this card to",
                    "disable the current",
                    "{C:attention}Boss Blind{}{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_wrestler_alt = {
                name = 'Luchador{C:hpfx_IjiGray}...?{}',
                text = {
                    "Sell this card to",
                    "disable the current",
                    "{C:attention}Boss Blind{}{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_card = {
                name = 'Gift Card',
                text = {
                    "Add {C:money}$#1#{} of {C:attention}sell value",
                    "to every {C:attention}Joker{} and",
                    "{C:attention}Consumable{} card at",
                    "end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_card_alt = {
                name = 'Gift Card{C:hpfx_IjiGray}...?{}',
                text = {
                    "Add {C:money}$#1#{} of {C:attention}sell value",
                    "to every {C:attention}Joker{} and",
                    "{C:attention}Consumable{} card at",
                    "end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_lima_bean = {
                name = 'Turtle Bean',
                text = {
                    "{C:attention}+#1#{} hand size,",
                    "reduces by",
                    "{C:red}#2#{} every round{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_lima_bean_alt = {
                name = 'Turtle Bean{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:attention}+#1#{} hand size,",
                    "reduces by",
                    "{C:red}#2#{} every round{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_take_the_moon = {
                name = 'To The Moon',
                text = {
                    "Earn an extra {C:money}$#1#{} of",
                    "{C:attention}interest{} for every {C:money}$5{} you",
                    "have at end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_take_the_moon_alt = {
                name = 'To The Moon{C:hpfx_IjiGray}...?{}',
                text = {
                    "Earn an extra {C:money}$#1#{} of",
                    "{C:attention}interest{} for every {C:money}$5{} you",
                    "have at end of round{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_illusion = {
                name = 'Hallucination',
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a {C:tarot}Tarot{} card when any",
                    "{C:attention}Booster Pack{} is opened{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_illusion_alt = {
                name = 'Hallucination{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:green}#1# in #2#{} chance to create",
                    "a {C:tarot}Tarot{} card when any",
                    "{C:attention}Booster Pack{} is opened{C:hpfx_IjiGray}#3#{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_softball = {
                name = 'Baseball Card',
                text = {
                    "{C:green}Uncommon{} Jokers",
                    "each give {X:mult,C:white}X#1#{} Mult{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_softball_alt = {
                name = 'Baseball Card{C:hpfx_IjiGray}...?{}',
                text = {
                    "{C:green}Uncommon{} Jokers",
                    "each give {X:mult,C:white}X#1#{} Mult{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_cola = {
                name = 'Diet Cola',
                text = {
                    "Sell this card to",
                    "create a free",
                    "{C:attention}#2#{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_cola_alt = {
                name = 'Diet Cola{C:hpfx_IjiGray}...?{}',
                text = {
                    "Sell this card to",
                    "create a free",
                    "{C:attention}#2#{C:hpfx_IjiGray}#1#{}",
                },
            },
            j_hpfx_collecting = {
                name = 'Trading Card',
                text = {
                    "If {C:attention}first discard{} of round",
                    "has only {C:attention}1{} card, destroy",
                    "it and earn {C:money}$#1#{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_collecting_alt = {
                name = 'Trading Card{C:hpfx_IjiGray}...?{}',
                text = {
                    "If {C:attention}first discard{} of round",
                    "has only {C:attention}1{} card, destroy",
                    "it and earn {C:money}$#1#{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_seltzer = {
                name = 'Seltzer',
                text = {
                    "Retrigger all",
                    "cards played for",
                    "the next {C:attention}#1#{} hands{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_seltzer_alt = {
                name = 'Seltzer{C:hpfx_IjiGray}...?{}',
                text = {
                    "Retrigger all",
                    "cards played for",
                    "the next {C:attention}#1#{} hands{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_frowny = {
                name = 'Smiley Face',
                text = {
                    "Played {C:attention}face{} cards",
                    "give {C:mult}+#1#{} Mult",
                    "when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_frowny_alt = {
                name = 'Smiley Face{C:hpfx_IjiGray}...?{}',
                text = {
                    "Played {C:attention}face{} cards",
                    "give {C:mult}+#1#{} Mult",
                    "when scored{C:hpfx_IjiGray}#2#{}",
                },
            },
            j_hpfx_talkie_walkie = {
                name = 'Walkie Talkie',
                text = {
                    "Each played {C:attention}10{} or {C:attention}4",
                    "gives {C:chips}+#1#{} Chips and",
                    "{C:mult}+#2#{} Mult when scored{C:hpfx_IjiGray}#3#{}",
                },
            },
            j_hpfx_talkie_walkie_alt = {
                name = 'Walkie Talkie{C:hpfx_IjiGray}...?{}',
                text = {
                    "Each played {C:attention}10{} or {C:attention}4",
                    "gives {C:chips}+#1#{} Chips and",
                    "{C:mult}+#2#{} Mult when scored{C:hpfx_IjiGray}#3#{}",
                },
            },
        },
        Other = {
            hpfx_priceless = {
                name = 'Priceless',
                text = {
                    "Cannot be sold, but",
                    "can still be destroyed.",
                },
            },
            hpfx_needlecon = {
                name = 'Current Context',
                text = {
                    "{E:2}context.{C:attention,E:2}#1#{}",
                },
            }
        },
    },
    misc = {
        dictionary = {
            --hpfx_isaac_option = "Play with my TBOI stuff!",
            --hpfx_ijiraq_option = "Release the Ijiraq.",

            hpfx_fakesaved_ex = "Saved?",
            hpfx_ribtickler = "Spared... for now.",
            hpfx_pickup1_ex = "Pick it up.",
            hpfx_pickup2_ex = "Pick.",
            hpfx_pickup3_ex = "It.",
            hpfx_pickup4_ex = "Up.",
            hpfx_missmiji = "Miss me?",
            hpfx_spread_ex = "Spread.",
            hpfx_wither_ex = "Wither.",
            hpfx_shed = "SHED",
            hpfx_perknado = "Refocus",
            hpfx_hey = "Don't worry about him.",
            hpfx_no = "No!",
            hpfx_wait = "Wait!",
            hpfx_val_down = "Value Down!?",
            hpfx_coward_ex = "Coward.",
        },
        labels = {
            hpfx_priceless = "Priceless",
        },
        quips = {
            hpfx_eternal_jimbo1 = {
                "They say you draw the",
                "hand life gives you...",
                "I drew eternity.",
            },
            hpfx_eternal_jimbo2 = {
                "Your luck remains fleeting,",
                "while Jimbo remains eternal."
            }
        },
        v_dictionary = {
            hpfx_m_hands = "-#1# Hands",
        },
    },
}
