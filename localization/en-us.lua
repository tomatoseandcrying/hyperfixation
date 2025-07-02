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
                unlock = {
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_oops'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Obtain Oops! All 6s during a run{}"
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
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_7mult'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Score at least 7 Mult within a single hand{}",
                },
            },
            j_hpfx_farmer = {
                name = 'Farmer',
                text = {
                    "{C:attention}+#1#{} Joker slot",
                    "{C:attention}+#1#{} card selection limit"
                    --"Doubles the probabilities of {C:purple}certain consumables{}" (hidden effect, commented out on purpose)
                },
                unlock = {
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_nope'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Nope! on Wheel of Fortune 3 times in a row{}"
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
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_devil'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Use The Devil 3 times{}"
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
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_momheart'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Defeat Crimson Heart ten times{}",
                },
            },

            j_hpfx_chud = {
                name = 'chud joker',
                text = {
                    "{s:3,E:1,C:dark_edition}nothing ever happens{}",
                    "{C:inactive,s:0.7}(Currently {X:mult,C:white,s:0.7}X#1#{} {C:inactive,s:0.7}Mult){}",


                },
                unlock = {
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_chud'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Win a Boss Blind past Ante 2 without triggering your Jokers{}"
                },
            },

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
                text={
                    "{X:red,C:white}X#1#{} Mult on {C:attention}final",
                    "{C:attention}hand{} of round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_trapezoid_alt = {
                name = 'Acrobat{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{X:red,C:white}X#1#{} Mult on {C:attention}final",
                    "{C:attention}hand{} of round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_scaryandy = {
                name = 'Merry Andy',
                text={
                    "{C:red}+#1#{} discards",
                    "each round,",
                    "{C:red}#2#{} hand size{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_scaryandy_alt = {
                name = 'Merry Andy{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{C:red}+#1#{} discards",
                    "each round,",
                    "{C:red}#2#{} hand size{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_expired = {
                name = 'Credit Card',
                text={
                    "Go up to",
                    "{C:red}-$#1#{} in debt{C:hpfx_IjiGray,s:0.7}#2#{}",
                }
            },
            j_hpfx_expired_alt = {
                name = 'Credit Card{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "Go up to",
                    "{C:red}-$#1#{} in debt{C:hpfx_IjiGray,s:0.7}#2#{}",
                }
            },
            j_hpfx_bard = {
                name = 'Troubadour',
                text={
                    "{C:attention}+#1#{} hand size,",
                    "{C:blue}#2#{} hand each round{C:hpfx_IjiGray,s:0.7}#3#{}",
                }
            },
            j_hpfx_bard_alt = {
                name = 'Troubadour{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{C:attention}+#1#{} hand size,",
                    "{C:blue}#2#{} hand each round{C:hpfx_IjiGray,s:0.7}#3#{}",
                }
            },
            j_hpfx_flag = {
                name = 'Banner',
                text={
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard{}{C:hpfx_IjiGray,s:0.7}#2#{}",
                }
            },
            j_hpfx_flag_alt = {
                name = 'Banner{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard{}{C:hpfx_IjiGray,s:0.7}#2#{}",
                }
            },
            j_hpfx_twistit = {
                name = 'Mystic Summit',
                text={
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#2#{} discards",
                    "remaining{C:hpfx_IjiGray,s:0.7}#3#{}",
                }
            },
            j_hpfx_twistit_alt = {
                name = 'Mystic Summit{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#2#{} discards",
                    "remaining{C:hpfx_IjiGray,s:0.7}#3#{}",
                }
            },
            j_hpfx_porcelain ={
                name="Marble Joker",
                text={
                    "Adds one {C:attention}Stone{} card",
                    "to deck when",
                    "{C:attention}Blind{} is selected{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_porcelain_alt ={
                name="Marble Joker{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Adds one {C:attention}Stone{} card",
                    "to deck when",
                    "{C:attention}Blind{} is selected{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_redeemed = {
                name="Loyalty Card",
                text={
                    "{X:red,C:white}X#1#{} Mult every",
                    "{C:attention}6{} hands played{C:hpfx_IjiGray,s:0.7}#4#{}",
                    "{C:inactive}5 remaining",
                },
            },
            j_hpfx_redeemed_alt = {
                name="Loyalty Card{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{X:red,C:white}X#1#{} Mult every",
                    "{C:attention}6{} hands played{C:hpfx_IjiGray,s:0.7}#4#{}",
                    "{C:inactive}5 remaining",
                },
            },
            j_hpfx_whack = {
                name="Hack",
                text={
                    "Retrigger",
                    "each played",
                    "#4#, #5#, #6#, or #7#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_whack_alt = {
                name="Hack{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Retrigger",
                    "each played",
                    "#4#, #5#, #6#, or #7#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_reprint = {
                name="Misprint",
                text={
                    ""
                },
            },
            j_hpfx_reprint_alt = {
                name="Misprint{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    ""
                },
            },
            j_hpfx_iron = {
                name="Steel Joker",
                text={
                    "Gives {X:mult,C:white}X#1#{} Mult",
                    "for each {C:attention}Steel Card",
                    "in your {C:attention}full deck{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_iron_alt = {
                name="Steel Joker{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Gives {X:mult,C:white} X#1# {} Mult",
                    "for each {C:attention}Steel Card",
                    "in your {C:attention}full deck{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_braised = {
                name="Raised Fist",
                text={
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_braised_alt = {
                name="Raised Fist{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_pyramid = {
                name="Golden Joker",
                text={
                    "Earn {C:money}$#1#{} at",
                    "end of round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_pyramid_alt = {
                name="Golden Joker{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Earn {C:money}$#1#{} at",
                    "end of round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_bluebell = {
                name="Blueprint",
                text={
                    "Copies ability of",
                    "{C:attention}Joker{} to the right{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_bluebell_alt = {
                name="Blueprint{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Copies ability of",
                    "{C:attention}Joker{} to the right{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_chaoz = {
                name="Chaos the Clown",
                text={
                    "{C:attention}#1#{} free {C:green}Reroll",
                    "per shop{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_chaoz_alt = {
                name="Chaos the Clown{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{C:attention}#1#{} free {C:green}Reroll",
                    "per shop{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_jiggler = {
                name="Juggler",
                text={
                    "{C:attention}+#1#{} hand size{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_jiggler_alt = {
                name="Juggler{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{C:attention}+#1#{} hand size{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_scrumpy = {
                name="Drunkard",
                text={
                    "{C:red}+#1#{} discard",
                    "each round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_scrumpy_alt = {
                name="Drunkard{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{C:red}+#1#{} discard",
                    "each round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_fiberglass = {
                name="Glass Joker",
                text={
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Glass Card",
                    "that is destroyed{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_fiberglass_alt = {
                name="Glass Joker{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Glass Card",
                    "that is destroyed{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_pomni = {
                name = 'Abstract Joker',
                text={
                    "{C:mult}+#1#{} Mult for",
                    "each {C:attention}Joker{} card{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    "",
                    "{X:hpfx_IjiGray,s:0.75}{C:attention}#3#{}/{C:white}4{}{}"
                },
            },
            j_hpfx_pomni_alt = {
                name = 'Abstract Joker{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult for",
                    "each {C:attention}Joker{} card{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive} Mult)",
                    "",
                    "{X:hpfx_IjiGray,s:0.75}{C:attention}#3#{}/{C:white}4{}{}"
                },
            },
            j_hpfx_belated_grat = {
                name = 'Delayed Gratification',
                text={
                    "Earn {C:money}$#1#{} per {C:attention}discard{} if",
                    "no discards are used",
                    "by end of the round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_belated_grat_alt = {
                name = 'Delayed Gratification{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "Earn {C:money}$#1#{} per {C:attention}discard{} if",
                    "no discards are used",
                    "by end of the round{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_tocket = {
                name = 'Golden Ticket',
                text={
                    "Played {C:attention}Gold{} cards",
                    "earn {C:money}$#1#{} when scored{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_tocket_alt = {
                name = 'Golden Ticket{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "Played {C:attention}Gold{} cards",
                    "earn {C:money}$#1#{} when scored{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_apophenia = {
                name = 'Pareidolia',
                text={
                    "All cards are",
                    "considered",
                    "{C:attention}face{} cards{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_apophenia_alt = {
                name = 'Pareidolia{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "All cards are",
                    "considered",
                    "{C:attention}face{} cards{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_not_fortune_teller = {
                name = 'Cartomancer',
                text={
                    "Create a {C:tarot}Tarot{} card",
                    "when {C:attention}Blind{} is selected{C:hpfx_IjiGray,s:0.7}#1#{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_not_fortune_teller_alt = {
                name = 'Cartomancer{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "Create a {C:tarot}Tarot{} card",
                    "when {C:attention}Blind{} is selected{C:hpfx_IjiGray,s:0.7}#1#{}",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_odd_steven = {
                name = 'Even Steven',
                text = {
                    "Played cards with",
                    "{C:attention}even{} rank give",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(10, 8, 6, 4, 2)",
                },
            },
            j_hpfx_odd_steven_alt = {
                name = 'Even Steven{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "Played cards with",
                    "{C:attention}even{} rank give",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(10, 8, 6, 4, 2)",
                },
            },
            j_hpfx_even_todd = {
                name = 'Odd Todd',
                text = {
                    "Played cards with",
                    "{C:attention}odd{} rank give",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(A, 9, 7, 5, 3)",
                },
            },
            j_hpfx_even_todd_alt = {
                name = 'Odd Todd{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "Played cards with",
                    "{C:attention}odd{} rank give",
                    "{C:chips}+#1#{} Chips when scored{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(A, 9, 7, 5, 3)",
                },
            },
            j_hpfx_flunkie = {
                name = 'Scholar',
                text = {
                    "Played {C:attention}Aces{}",
                    "give {C:chips}+#2#{} Chips",
                    "and {C:mult}+#1#{} Mult",
                    "when scored{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_flunkie_alt = {
                name = 'Scholar{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "Played {C:attention}Aces{}",
                    "give {C:chips}+#2#{} Chips",
                    "and {C:mult}+#1#{} Mult",
                    "when scored{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_ribtickler = {
                name = 'Mr. Bones',
                text = {
                    "Prevents Death",
                    "if chips scored",
                    "are at least {C:attention}25%",
                    "of required chips",
                    "{S:1.1,C:red,E:2}self destructs{}{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_ribtickler_alt = {
                name = 'Mr. Bones{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "Prevents Death",
                    "if chips scored",
                    "are at least {C:attention}25%",
                    "of required chips",
                    "{S:1.1,C:red,E:2}self destructs{}{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_peeking_twice = {
                name = 'Seeing Double',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand has a scoring",
                    "{C:clubs}Club{} card and a scoring",
                    "card of any other {C:attention}suit{}{C:hpfx_IjiGray,s:0.7}#5#{}",
                    "",
                    "{s:0.5}[{C:diamonds}#2#{}, {C:hearts}#3#{}, {C:spades}#4#{}]{}",
                },
            },
            j_hpfx_peeking_twice_alt = {
                name = 'Seeing Double{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand has a scoring",
                    "{C:clubs}Club{} card and a scoring",
                    "card of any other {C:attention}suit{}{C:hpfx_IjiGray,s:0.7}#5#{}",
                    "",
                    "{s:0.5}[{C:diamonds}#2#{}, {C:hearts}#3#{}, {C:spades}#4#{}]{}",
                },
            },
            j_hpfx_dupla = {
                name = 'The Duo',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_dupla_alt = {
                name = 'The Duo{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_triada = {
                name = 'The Trio',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_triada_alt = {
                name = 'The Trio{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_familia = {
                name = 'The Family',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_familia_alt = {
                name = 'The Family{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_orden = {
                name = 'The Order',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_orden_alt = {
                name = 'The Order{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_tribu = {
                name = 'The Tribe',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_tribu_alt = {
                name = 'The Tribe{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:mult,C:white}X#1#{} Mult if played",
                    "hand contains",
                    "a {C:attention}#2#{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_7_ball = {
                name = '8 Ball',
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}#4#{} to create a",
                    "{C:tarot}Tarot{} card when scored",
                    "{C:inactive}(Must have room){C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_7_ball_alt = {
                name = '8 Ball{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{C:green}#1# in #2#{} chance for each",
                    "played {C:attention}#4#{} to create a",
                    "{C:tarot}Tarot{} card when scored",
                    "{C:inactive}(Must have room){C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_golden_ratio = {
                name = 'Fibonacci',
                text = {
                    "Each played #4#,",
                    "#5#, #6#, #7#, or #8# gives",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_golden_ratio_alt = {
                name = 'Fibonacci{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "Each played #4#,",
                    "#5#, #6#, #7#, or #8# gives",
                    "{C:mult}+#1#{} Mult when scored{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_cutout = {
                name = 'Joker Stencil',
                text = {
                    "{X:red,C:white}X1{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Joker Stencil included",
                    "{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive}{C:hpfx_IjiGray,s:0.7}#2#{})",
                },
            },
            j_hpfx_cutout_alt = {
                name = 'Joker Stencil{C:hpfx_IjiGray,s:0.7}...?{}',
                text = {
                    "{X:red,C:white}X1{} Mult for each",
                    "empty {C:attention}Joker{} slot",
                    "{s:0.8}Joker Stencil included",
                    "{C:inactive}(Currently {X:red,C:white}X#1#{C:inactive}{C:hpfx_IjiGray,s:0.7}#2#{})",
                },
            },
            j_hpfx_time = {
                name="Space Joker",
                text={
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_time_alt = {
                name="Space Joker{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{C:green}#1# in #2#{} chance to",
                    "upgrade level of",
                    "played {C:attention}poker hand{}{C:hpfx_IjiGray,s:0.7}#3#{}",
                },
            },
            j_hpfx_manolo = {
                name="Matador",
                text={
                    "Earn {C:money}$#1#{} if played",
                    "hand triggers the",
                    "{C:attention}Boss Blind{} ability{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_manolo_alt = {
                name="Matador{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "Earn {C:money}$#1#{} if played",
                    "hand triggers the",
                    "{C:attention}Boss Blind{} ability{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_ritual = {
                name="Ceremonial Dagger",
                text={
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and permanently add {C:attention}double",
                    "its sell value to this {C:red}Mult{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                }
            },
            j_hpfx_ritual_alt = {
                name="Ceremonial Dagger{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "When {C:attention}Blind{} is selected,",
                    "destroy Joker to the right",
                    "and permanently add {C:attention}double",
                    "its sell value to this {C:red}Mult{C:hpfx_IjiGray,s:0.7}#2#{}",
                    "{C:inactive}(Currently {C:mult}+#1#{C:inactive} Mult)",
                }
            },
            j_hpfx_showman = {
                name="Showman",
                text={
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_showman_alt = {
                name="Showman{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{C:attention}Joker{}, {C:tarot}Tarot{}, {C:planet}Planet{},",
                    "and {C:spectral}Spectral{} cards may",
                    "appear multiple times{C:hpfx_IjiGray,s:0.7}#1#{}",
                },
            },
            j_hpfx_nix_sense = {
                name="Sixth Sense",
                text={
                    "If {C:attention}first hand{} of round is",
                    "a single {C:attention}6{}, destroy it and",
                    "create a {C:spectral}Spectral{} card{C:hpfx_IjiGray,s:0.7}#1#",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_nix_sense_alt = {
                name="Sixth Sense{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "If {C:attention}first hand{} of round is",
                    "a single {C:attention}6{}, destroy it and",
                    "create a {C:spectral}Spectral{} card{C:hpfx_IjiGray,s:0.7}#1#",
                    "{C:inactive}(Must have room)",
                },
            },
            j_hpfx_not_cartomancer = {
                name="Fortune Teller",
                text={
                    "{C:red}+#1#{} Mult per {C:purple}Tarot{}",
                    "card used this run{C:hpfx_IjiGray,s:0.7}#5#",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
                },
            },
            j_hpfx_not_cartomancer_alt = {
                name="Fortune Teller{C:hpfx_IjiGray,s:0.7}...?",
                text={
                    "{C:red}+#1#{} Mult per {C:purple}Tarot{}",
                    "card used this run{C:hpfx_IjiGray,s:0.7}#5#",
                    "{C:inactive}(Currently {C:red}+#2#{C:inactive})",
                },
            },
            j_hpfx_dont_come_back = {
                name = 'Hit The Road',
                text={
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Jack{}",
                    "discarded this round{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "",
                    "#4#",
                },
            },
            j_hpfx_dont_come_back_alt = {
                name = 'Hit The Road{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "This Joker gains {X:mult,C:white}X#1#{} Mult",
                    "for every {C:attention}Jack{}",
                    "discarded this round{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white}X#2#{C:inactive} Mult)",
                    "",
                    "#4#",
                },
            },
            j_hpfx_daisy_vase = {
                name = 'Flower Pot',
                text={
                    "{X:mult,C:white}X#1#{} Mult if poker",
                    "hand contains a",
                    "#3# card, #4# card,",
                    "#5# card, and #6# card{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_daisy_vase_alt = {
                name = 'Flower Pot{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{X:mult,C:white}X#1#{} Mult if poker",
                    "hand contains a",
                    "#3# card, #4# card,",
                    "#5# card, and #6# card{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_get_an_uber = {
                name = 'Ride The Bus',
                text={
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "per {C:attention}consecutive{} hand",
                    "played without a",
                    "scoring {C:attention}face{} card{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_get_an_uber_alt = {
                name = 'Ride The Bus{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "This Joker gains {C:mult}+#1#{} Mult",
                    "per {C:attention}consecutive{} hand",
                    "played without a",
                    "scoring {C:attention}face{} card{C:hpfx_IjiGray,s:0.7}#3#{}",
                    "{C:inactive}(Currently {C:mult}+#2#{C:inactive} Mult)",
                },
            },
            j_hpfx_take_the_sun = {
                name = 'Shoot The Moon',
                text={
                    "Each {C:attention}Queen{}",
                    "held in hand",
                    "gives {C:mult}+#1#{} Mult{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_take_the_sun_alt = {
                name = 'Shoot The Moon{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "Each {C:attention}Queen{}",
                    "held in hand",
                    "gives {C:mult}+#1#{} Mult{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_smudged = {
                name = 'Smeared Joker',
                text={
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds",
                    "count as the same suit,",
                    "{C:spades}Spades{} and {C:clubs}Clubs",
                    "count as the same suit{C:hpfx_IjiGray,s:0.7}#2#{}",
                },
            },
            j_hpfx_smudged_alt = {
                name = 'Smeared Joker{C:hpfx_IjiGray,s:0.7}...?{}',
                text={
                    "{C:hearts}Hearts{} and {C:diamonds}Diamonds",
                    "count as the same suit,",
                    "{C:spades}Spades{} and {C:clubs}Clubs",
                    "count as the same suit{C:hpfx_IjiGray,s:0.7}#2#{}",
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
        }
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
            hpfx_missmiji = "Miss me?"
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
    },
}