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
                    "{C:mult}+#1#{} Mult in {C:attention}final",
                    "{C:attention}hand{} of round",
                    "Gains {C:mult}+#2#{} Mult",
                    "every {C:attention}#3#{} rounds",
                    "{C:inactive}(Currently {C:mult}+#1#{}{C:inactive} Mult)"
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
                    "each {C:attention}consecutive{} played card",
                    "that triggers the {C:attention}Boss Blind{}",
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
                    "Joker gains {X:chips, C:white}X10{} that amount of {C:chips}Chips{}",
                    "{s:0.7}I hate the Flint{}",
                    "{C:inactive}(Currently {C:chips}+#1#{} {C:inactive}Chips){}"
                },
                unlock = {
                    "{C:purple}if{} args.{C:red}type{} {C:purple}=={} {C:green}'hpfx_momheart'{} {C:purple}then{} {C:red}unlock_card{}{C:purple}({}{C:red}self{}{C:purple}) end{}",
                    "{C:inactive}--unlock condition: Defeat Crimson Heart ten times{}",
                },
            },

            j_hpfx_ijiraq = {
                name = 'Ijiraq',
                text = {
                    "{C:mult}Does nothing rn lmfao{}"
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
            j_hpfx_expired = {
                name = 'Credit Card',
                text={
                    "Go up to",
                    "{C:red}-$#1#{} in debt{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_expired_alt = {
                name = 'Credit Card{C:IjiGray, s:0.7}...?{}',
                text={
                    "Go up to",
                    "{C:red}-$#1#{} in debt{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_bard = {
                name = 'Troubadour',
                text={
                    "{C:attention}+#1#{} hand size,",
                    "{C:blue}#2#{} hand each round{C:IjiGray, s:0.7}#3#{}",
                }
            },
            j_hpfx_bard_alt = {
                name = 'Troubadour{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:attention}+#1#{} hand size,",
                    "{C:blue}#2#{} hand each round{C:IjiGray, s:0.7}#3#{}",
                }
            },
            j_hpfx_flag = {
                name = 'Banner',
                text={
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard{}{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_flag_alt = {
                name = 'Banner{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:chips}+#1#{} Chips for",
                    "each remaining",
                    "{C:attention}discard{}{C:IjiGray, s:0.7}#2#{}",
                }
            },
            j_hpfx_twistit = {
                name = 'Mystic Summit',
                text={
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#2#{} discards",
                    "remaining{C:IjiGray, s:0.7}#3#{}",
                }
            },
            j_hpfx_twistit_alt = {
                name = 'Mystic Summit{C:IjiGray, s:0.7}...?{}',
                text={
                    "{C:mult}+#1#{} Mult when",
                    "{C:attention}#2#{} discards",
                    "remaining{C:IjiGray, s:0.7}#3#{}",
                }
            },
            j_hpfx_porcelain ={
                name="Marble Joker",
                text={
                    "Adds one {C:attention}Stone{} card",
                    "to deck when",
                    "{C:attention}Blind{} is selected{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_porcelain_alt ={
                name="Marble Joker{C:IjiGray, s:0.7}...?",
                text={
                    "Adds one {C:attention}Stone{} card",
                    "to deck when",
                    "{C:attention}Blind{} is selected{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_redeemed = {
                name="Loyalty Card",
                text={
                    "{X:red,C:white} X#1# {} Mult every",
                    "{C:attention}6{} hands played",
                    "{C:inactive}5 remaining{C:IjiGray, s:0.7}#4#{}",
                },
            },
            j_hpfx_redeemed_alt = {
                name="Loyalty Card{C:IjiGray, s:0.7}...?",
                text={
                    "{X:red,C:white} X#1# {} Mult every",
                    "{C:attention}6{} hands played",
                    "{C:inactive}5 remaining{C:IjiGray, s:0.7}#4#{}",
                },
            },
            j_hpfx_whack = {
                name="Hack",
                text={
                    "Retrigger",
                    "each played",
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, or {C:attention}5{}{C:IjiGray, s:0.7}#3#{}",
                },
            },
            j_hpfx_whack_alt = {
                name="Hack{C:IjiGray, s:0.7}...?",
                text={
                    "Retrigger",
                    "each played",
                    "{C:attention}2{}, {C:attention}3{}, {C:attention}4{}, or {C:attention}5{}{C:IjiGray, s:0.7}#3#{}",
                },
            },
            j_hpfx_reprint = {
                name="Misprint",
                text={
                    ""
                },
            },
            j_hpfx_reprint_alt = {
                name="Misprint{C:IjiGray, s:0.7}...?",
                text={
                    ""
                },
            },
            j_hpfx_iron = {
                name="Steel Joker",
                text={
                    "Gives {X:mult,C:white} X#1# {} Mult",
                    "for each {C:attention}Steel Card",
                    "in your {C:attention}full deck{C:IjiGray, s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_hpfx_iron_alt = {
                name="Steel Joker{C:IjiGray, s:0.7}...?",
                text={
                    "Gives {X:mult,C:white} X#1# {} Mult",
                    "for each {C:attention}Steel Card",
                    "in your {C:attention}full deck{C:IjiGray, s:0.7}#3#{}",
                    "{C:inactive}(Currently {X:mult,C:white} X#2# {C:inactive} Mult)",
                },
            },
            j_hpfx_braised = {
                name="Raised Fist",
                text={
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult{C:IjiGray, s:0.7}#1#{}",
                },
            },
            j_hpfx_braised_alt = {
                name="Raised Fist{C:IjiGray, s:0.7}...?",
                text={
                    "Adds {C:attention}double{} the rank",
                    "of {C:attention}lowest{} ranked card",
                    "held in hand to Mult{C:IjiGray, s:0.7}#1#{}",
                },
            },
            j_hpfx_pyramid = {
                name="Golden Joker",
                text={
                    "Earn {C:money}$#1#{} at",
                    "end of round{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_pyramid_alt = {
                name="Golden Joker{C:IjiGray, s:0.7}...?",
                text={
                    "Earn {C:money}$#1#{} at",
                    "end of round{C:IjiGray, s:0.7}#2#{}",
                },
            },
            j_hpfx_blue = {
                name="Blueprint",
                text={
                    "Copies ability of",
                    "{C:attention}Joker{} to the right{C:IjiGray, s:0.7}#1#{}",
                },
            },
            j_hpfx_blue_alt = {
                name="Blueprint{C:IjiGray, s:0.7}...?",
                text={
                    "Copies ability of",
                    "{C:attention}Joker{} to the right{C:IjiGray, s:0.7}#1#{}",
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
        },
        Tag = {
            tag_hpfx_ijidebug = {
                name = 'Ijiraq Debug',
                text = {
                    "Debugging tag for Ijiraq",
                },
            },
        },
    },
    misc = {
        dictionary = {
            hpfx_isaac_option = "Play with my TBOI stuff!",
            hpfx_ijiraq_option = "Release the Ijiraq.",
        },
        labels = {
            hpfx_priceless = "Priceless",
        }
    },
}