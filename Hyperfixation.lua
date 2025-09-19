--File Loading
mod_path = "" .. SMODS.current_mod.path
---Loads all files in a folder (Will likely load unordered.)
---@param folder any The filepath to the folder you want to load. (ex: "Ijiraq/Exceptions")
function load_folder(folder)
    files = NFS.getDirectoryItems(mod_path .. folder)
    for i, file in ipairs(files) do
        SMODS.load_file(folder .. "/" .. file)()
    end
end

--singles
SMODS.load_file('lib/ui.lua')()
SMODS.load_file('items/Stickers.lua')()
--centers
SMODS.load_file('items/Isaac/IsaacCenter.lua')()
SMODS.load_file('items/4Fun/FunZone.lua')()
SMODS.load_file('items/Ijiraq/RaqShack.lua')()
--folders
load_folder('src')

--Mod Tech
to_big = to_big or function(x) return x end --talisman conversion function
--profile vars
G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount or 0
G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = G.PROFILES[G.SETTINGS.profile].hpfx_devilCount or 0
G.PROFILES[G.SETTINGS.profile].hpfx_queenCount = G.PROFILES[G.SETTINGS.profile].hpfx_queenCount or 0
G.PROFILES[G.SETTINGS.profile].hpfx_bitch = G.PROFILES[G.SETTINGS.profile].hpfx_bitch or false
--global tables/funcs
Hyperglobal = Hyperglobal or {
    path = mod_path,
    ---Used to store the original weights of boosters.
    og_boostweight = og_boostweight or {},

    --[[ keys Ijiraq will skip when deciding disguises
    Jokers that don't use hand calc or have custom conditions should be included here.
    Jokers that do use hand calc and do not have custom logic transform after a hand. ]]

    ---Jokesters that overwrite the automatic behavior Costume would use
    exceptions = exceptions or {
        j_misprint = 'j_hpfx_reprint',
        j_raised_fist = 'j_hpfx_braised',
        j_mystic_summit = 'j_hpfx_twistit',
        j_loyalty_card = 'j_hpfx_redeemed',
        j_steel_joker = 'j_hpfx_iron',
        j_acrobat = 'j_hpfx_trapezoid',
        j_banner = 'j_hpfx_flag',
        j_merry_andy = 'j_hpfx_scaryandy',
        j_troubadour = 'j_hpfx_bard',
        j_hack = 'j_hpfx_whack',
        j_marble = 'j_hpfx_porcelain',
        j_golden = 'j_hpfx_pyramid',
        j_credit_card = 'j_hpfx_expired',
        j_blueprint = 'j_hpfx_bluebell',
        j_chaos = 'j_hpfx_chaoz',
        j_juggler = 'j_hpfx_jiggler',
        j_drunkard = 'j_hpfx_scrumpy',
        j_glass = 'j_hpfx_fiberglass',
        j_abstract = 'j_hpfx_pomni',
        j_delayed_grat = 'j_hpfx_belated_grat',
        j_ticket = 'j_hpfx_tocket',
        j_pareidolia = 'j_hpfx_apophenia',
        j_cartomancer = 'j_hpfx_not_fortune_teller',
        j_even_steven = 'j_hpfx_odd_steven',
        j_odd_todd = 'j_hpfx_even_todd',
        j_scholar = 'j_hpfx_flunkie',
        j_mr_bones = 'j_hpfx_ribtickler',
        j_seeing_double = 'j_hpfx_peeking_twice',
        j_duo = 'j_hpfx_dupla',
        j_trio = 'j_hpfx_triada',
        j_family = 'j_hpfx_familia',
        j_order = 'j_hpfx_orden',
        j_tribe = 'j_hpfx_tribu',
        j_8_ball = 'j_hpfx_7_ball',
        j_fibonacci = 'j_hpfx_golden_ratio',
        j_stencil = 'j_hpfx_cutout',
        j_space = 'j_hpfx_time',
        j_matador = 'j_hpfx_manolo',
        j_ceremonial = 'j_hpfx_ritual',
        j_ring_master = 'j_hpfx_showman',
        j_sixth_sense = 'j_hpfx_nix_sense',
        j_fortune_teller = 'j_hpfx_not_cartomancer',
        j_hit_the_road = 'j_hpfx_dont_come_back',
        j_flower_pot = 'j_hpfx_daisy_vase',
        j_ride_the_bus = 'j_hpfx_get_an_uber',
        j_shoot_the_moon = 'j_hpfx_take_the_sun',
        j_smeared = 'j_hpfx_smudged',
        j_oops = 'j_hpfx_whoops',
        j_four_fingers = 'j_hpfx_and_thumb',
        j_gros_michel = 'j_hpfx_close_michelle',
        j_stuntman = 'j_hpfx_buttowski',
        j_hanging_chad = 'j_hpfx_hung_chad',
        j_drivers_license = 'j_hpfx_learners_permit',
        j_invisible = 'j_hpfx_invincible',
        j_astronomer = 'j_hpfx_galilimbo',
        j_burnt = 'j_hpfx_charred',
        j_dusk = 'j_hpfx_dawn',
        j_throwback = 'j_hpfx_flashforward',
        j_brainstorm = 'j_hpfx_stormcloud',
        j_satellite = 'j_hpfx_apollo',
        j_rough_gem = 'j_hpfx_snowgrave',
        j_bloodstone = 'j_hpfx_sanguinerock',
        j_arrowhead = 'j_hpfx_ahead',
        j_onyx_agate = 'j_hpfx_obsidian',
        j_caino = 'j_hpfx_canio',
        j_triboulet = 'j_hpfx_dribblinit',
        j_yorick = 'j_hpfx_yomorty',
        j_chicot = 'j_hpfx_anglerais',
        j_perkeo = 'j_hpfx_perknado',
        j_certificate = 'j_hpfx_sirtificate',
        j_bootstraps = 'j_hpfx_shoebuckles',
        j_egg = 'j_hpfx_chicken',
        j_burglar = 'j_hpfx_robber',
        j_splash = 'j_hpfx_splatter',
        j_constellation = 'j_hpfx_sagittarius',
        j_hiker = 'j_hpfx_hitchhiker',
        j_faceless = 'j_hpfx_noface',
        j_square = 'j_hpfx_rectangle',
        --j_joker = 'j_hpfx_jumbo',
        j_shortcut = 'j_hpfx_secretway',
        j_cloud_9 = 'j_hpfx_earthbound',
        j_rocket = 'j_hpfx_blastoff',
        j_luchador = 'j_hpfx_wrestler',
        j_gift = 'j_hpfx_card',
        j_turtle_bean = 'j_hpfx_lima_bean',
        j_to_the_moon = 'j_hpfx_take_the_moon',
        j_hallucination = 'j_hpfx_illusion',
        j_baseball = 'j_hpfx_softball',
        j_diet_cola = 'j_hpfx_cola',
        j_trading = 'j_hpfx_collecting',
        j_selzer = 'j_hpfx_seltzer',
        j_smiley = 'j_hpfx_frowny',
        j_walkie_talkie = 'j_hpfx_talkie_walkie',
    },

    --needle contexts
    allcalcs = allcalcs or {
        "main_eval",
        "beat_boss",
        "hook",
        "before",
        "after",
        "main_scoring",
        "individual",
        "repetition",
        "edition",
        "pre_joker",
        "post_joker",
        "joker_main",
        "final_scoring_step",
        "remove_playing_cards",
        "debuffed_hand",
        "end_of_round",
        "setting_blind",
        "pre_discard",
        "discard",
        "open_booster",
        "skipping_booster",
        "buying_card",
        "selling_card",
        "reroll_shop",
        "ending_shop",
        "first_hand_drawn",
        "hand_drawn",
        "using_consumeable",
        "skip_blind",
        "playing_card_added",
        "card_added",
        "check_enhancement",
        "post_trigger",
        "modify_scoring_hand",
        "ending_booster",
        "starting_shop",
        "blind_disabled",
        "blind_defeated",
        "press_play",
        "ignore_debuff",
        "debuff_hand",
        "check",
        "stay_flipped",
        "modify_hand",
        "drawing_cards",
        "pseudorandom_result",
        "from_roll",
        "result",
        "initial_scoring_step",
        "joker_type_destroyed",
        "check_eternal",
        "trigger",
        "change_rank",
        "change_suit",
        "rank_increase",
        "round_eval",
        "money_altered",
    },

    --iji make sure you dont pretend to be these
    brokejokes = brokejokes or {
        --basegame
        ['j_caino'] = true,
        ['j_constellation'] = true,
        ['j_hologram'] = true,
        ['j_madness'] = true,
        ['j_faceless'] = true,
        ['j_yorick'] = true,
        ['j_invisible'] = true,
        ['j_vampire'] = true,
        ['j_obelisk'] = true,
        ['j_lucky_cat'] = true,
        ['j_ramen'] = true,
        ['j_campfire'] = true,
        ['j_hit_the_road'] = true,
        ['j_todo_list'] = true,
        --hpfx
        ['j_hpfx_ijiraq'] = true,
        ['j_hpfx_moriah'] = true,
    },

    ---Jokesters that calculate dollar bonuses. Jokester is k, Joker is v
    calcdollarjokesters = calcdollarjokesters or {
        j_hpfx_pyramid = 'j_golden',
        j_hpfx_earthbound = 'j_cloud_9',
        j_hpfx_blastoff = 'j_rocket',
        j_hpfx_take_the_moon = 'j_to_the_moon',
        j_hpfx_apollo = 'j_satellite',
    },

    ---If certain mods are installed, add their crossmodded jokers to the exceptions table. Make sure to check if Hyperglobal exists and is a table.
    ---@param mod_id any The ID of the mod to check. Can be found in `metadata.json`.
    ---@param joker_key any The key of the Joker the Ijiraq will be mimicking.
    ---@param ijiraq_joker_key any The key of the Joker the Ijiraq will transform from. Make sure it calls `hpfx_Transform(card, context)`
    ---@param onpayout boolean Jokers in this table will transform after payout. Set to `false` to disable this.
    hypercross = function(mod_id, joker_key, ijiraq_joker_key, onpayout)
        if not next(SMODS.find_mod(mod_id)) then
            print("Hyperfixation: hypercross: Mod not found: " .. tostring(mod_id))
            return
        else
            local k, v = joker_key, ijiraq_joker_key
            -- Adds the joker to the exceptions table
            Hyperglobal.exceptions[k] = tostring(v)

            -- Check if the table has a calc_dollar_bonus function
            local obj = SMODS.Centers[v]
            if not obj then
                print("SMODS.Centers does not contain key: ", v)
                -- Optionally: return or skip further logic
            elseif obj and obj.calc_dollar_bonus and type(obj.calc_dollar_bonus) == 'function' then
                if onpayout == true then
                    Hyperglobal.calcdollarjokesters[v] = tostring(k)
                end
            else
                -- If the function does not exist, print a message to the console
                print("calc_dollar_bonus does not exist.")
                print("obj: " .. tostring(obj))
                print('key: ' .. tostring(k))
                print('value: ' .. tostring(v))
            end
        end
    end,

    ---Value storing for Ijiraq's abilities
    ---@param self any The card object with the values that you want to save. (ex: `card`, `self`, etc.)
    ---@param center any The center where values are being set. (ex: `G.P_CENTERS`, `SMODS.Centers`, etc.)
    safe_set_ability = function(self, center)
        if not self or not center then return nil end
        local oldcenter = self.config.center
        G.GAME.hpfx_ijiraq_savedvalues = G.GAME.hpfx_ijiraq_savedvalues or {}
        G.GAME.hpfx_ijiraq_savedvalues[self.sort_id] = G.GAME.hpfx_ijiraq_savedvalues[self.sort_id] or {}
        G.GAME.hpfx_ijiraq_savedvalues[self.sort_id][oldcenter.key] = copy_table(self.ability)
        for k, v in pairs(G.GAME.hpfx_ijiraq_savedvalues[self.sort_id][center.key] or center.config) do
            if type(v) == 'table' then
                self.ability[k] = copy_table(v)
            else
                self.ability[k] = v
                if k == "Xmult" then self.ability.x_mult = v end
            end
        end
        self.ability.x_mult = center.config.Xmult or center.config.x_mult or 1
        self.ability.name = center.name
        self.ability.set = center.set
        self.ability.effect = center.effect
        self.config.center = center
        for k, v in pairs(G.P_CENTERS) do
            if center == v then self.config.center_key = k end
        end
        if self.ability.name == "Invisible Joker" then
            self.ability.invis_rounds = 0
        end
        if self.ability.name == 'To Do List' then
            local _poker_hands = {}
            for k, v in pairs(G.GAME.hands) do
                if v.visible then _poker_hands[#_poker_hands + 1] = k end
            end
            local old_hand = self.ability.to_do_poker_hand
            self.ability.to_do_poker_hand = nil
            while not self.ability.to_do_poker_hand do
                self.ability.to_do_poker_hand = pseudorandom_element(_poker_hands,
                    pseudoseed((self.area and self.area.config.type == 'title') and 'false_to_do' or 'to_do'))
                if self.ability.to_do_poker_hand == old_hand then self.ability.to_do_poker_hand = nil end
            end
        end
        if self.ability.name == 'Caino' then
            self.ability.caino_xmult = 1
        end
        if self.ability.name == 'Yorick' then
            self.ability.yorick_discards = self.ability.extra.discards
        end
        if self.ability.name == 'Loyalty Card' then
            self.ability.burnt_hand = 0
            self.ability.loyalty_remaining = self.ability.extra.every
        end
    end,
}
--more features
SMODS.current_mod.optional_features = {
    post_trigger = true,
    retrigger_joker = true,
    quantum_enhancements = false,
    cardareas = {
        discard = true,
        deck = true
    }
}
--calcbased unlocks
SMODS.current_mod.calculate = function(self, context)
    --Iscariot
    if context.using_consumeable and context.consumeable.config.center.key == "c_devil" then
        if type(G.PROFILES[G.SETTINGS.profile].hpfx_devilCount) ~= "number" then
            G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = 0
        end
        G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = G.PROFILES[G.SETTINGS.profile].hpfx_devilCount + 1
        --print("Devil Count: " .. tostring(G.PROFILES[G.SETTINGS.profile].hpfx_devilCount))
        if G.PROFILES[G.SETTINGS.profile].hpfx_devilCount >= 3 then
            check_for_unlock({ type = 'hpfx_devil' })
            G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = 0
        end
    end
    --Marie Antoinette
    if context.remove_playing_cards then
        if type(G.PROFILES[G.SETTINGS.profile].hpfx_queenCount) ~= "number" then
            G.PROFILES[G.SETTINGS.profile].hpfx_queenCount = 0
        end
        for _, i in ipairs(context.removed) do
            if i:get_id() == 12 then
                G.PROFILES[G.SETTINGS.profile].hpfx_queenCount = G.PROFILES[G.SETTINGS.profile].hpfx_queenCount + 1
            end
        end
        if G.PROFILES[G.SETTINGS.profile].hpfx_queenCount >= 37 then
            check_for_unlock({ type = 'hpfx_head' })
            G.PROFILES[G.SETTINGS.profile].hpfx_queenCount = 0
        end
    end
    --No Bitches
    if context.before then
        for i = 1, #context.scoring_hand do
            if context.scoring_hand[i]:get_id() == 12 then
                G.PROFILES[G.SETTINGS.profile].hpfx_bitch = true
            end
        end
    end
    --Chud
    if context.post_trigger then
        G.GAME.hpfx_nothingEverHappens = false
    end
    if context.end_of_round and context.beat_boss and G.GAME.round_resets.ante >= 3 then
        if G.GAME.hpfx_nothingEverHappens then
            check_for_unlock({ type = 'hpfx_chud' })
        else
            G.GAME.hpfx_nothingEverHappens = true
        end
    end
end

--Visual Libraries
SMODS.Atlas({ --icon
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32,
})
--jokers
SMODS.Atlas {
    key = 'IsaacJokers',
    path = "TBOI/jokers/IsaacJokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'Jokers4Fun',
    path = "4Fun/jokers/Jokers4Fun.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'IjiraqJokers',
    path = "inscryption/jokers/IjiraqJokers.png",
    px = 71,
    py = 95
}

--Audio Libraries
SMODS.Sound({ --moriah
    key = "hpfx_1up",
    path = "TBOI/1up.ogg",
})
SMODS.Sound({
    key = "hpfx_thumbsup",
    path = "TBOI/thumbsup.ogg",
})
--mary
SMODS.Sound({
    key = "hpfx_gulp",
    path = "TBOI/mary/gulp.ogg",
})
--iscariot
SMODS.Sound({
    key = "hpfx_silver",
    path = "TBOI/iscariot/dimedrop.ogg",
})
--death noises
SMODS.Sound({
    key = "hpfx_death1",
    path = "TBOI/deathsounds/Isaac_dies_new.ogg",
})
SMODS.Sound({
    key = "hpfx_death2",
    path = "TBOI/deathsounds/Isaac_dies_new_1.ogg",
})
SMODS.Sound({
    key = "hpfx_death3",
    path = "TBOI/deathsounds/Isaac_dies_new_2.ogg",
})
--ijiraq
SMODS.Sound({
    key = "hpfx_fall",
    path = "inscryption/bigraq/lich-fall.ogg",
})
--not showman
SMODS.Sound({
    key = "hpfx_pickup",
    path = "inscryption/ringmaster/lastwishpickup.ogg",
    volume = 0.6,
})
--not gros michel
SMODS.Sound({
    key = "hpfx_end1",
    path = "inscryption/closemichelle/end1.ogg",
})
SMODS.Sound({
    key = "hpfx_end2",
    path = "inscryption/closemichelle/end2.ogg",
})
SMODS.Sound({
    key = "hpfx_end3",
    path = "inscryption/closemichelle/end3.ogg",
})
SMODS.Sound({
    key = "hpfx_end4",
    path = "inscryption/closemichelle/end4.ogg",
})
SMODS.Sound({
    key = "hpfx_boowomp",
    path = "inscryption/closemichelle/boowomp.ogg",
})
--not invisible
SMODS.Sound({
    key = "hpfx_discvc",
    path = "inscryption/invincible/discord-leave-noise.ogg",
})
--no bitches
SMODS.Sound({
    key = "hpfx_vineboom",
    path = "4Fun/bitchless/vineboom.ogg",
})
--he's old
SMODS.Sound({
    key = "hpfx_voice1",
    path = "4Fun/eternimbo/imold.ogg",
    volume = 2,
})

--Font Libraries
SMODS.Font({
    key = "roboto",
    path = "Roboto-Regular.ttf",
    render_scale = 450,
    TEXT_HEIGHT_SCALE = 0.5,
    TEXT_OFFSET = { x = 0, y = 0 },
    FONTSCALE = 0.12,
    squish = 1,
    DESCSCALE = 1,
    class_prefix = "hpfx_"
})
SMODS.Font({
    key = "ascii",
    path = "SawarabiMincho-Regular.ttf",
    render_scale = 200,
    TEXT_HEIGHT_SCALE = 0.5,
    TEXT_OFFSET = { x = 0, y = 0 },
    FONTSCALE = 0.07,
    squish = 1,
    DESCSCALE = 1,
    class_prefix = "hpfx_"
})

--Custom Colors
loc_colour('red')
--ijiraq
G.ARGS.LOC_COLOURS['hpfx_IjiGray'] = HEX("BFD7D5")
--unlock conditions
G.ARGS.LOC_COLOURS['hpfx_inPURPLE'] = HEX("B1A1C0")
G.ARGS.LOC_COLOURS['hpfx_inattention'] = HEX("ECB96D")
G.ARGS.LOC_COLOURS['hpfx_multiball'] = HEX("EC9C96")
G.ARGS.LOC_COLOURS['hpfx_bossmute'] = HEX("C78F85")
--other
G.ARGS.LOC_COLOURS['hpfx_oldgreen'] = HEX("009900")
G.ARGS.LOC_COLOURS['hpfx_black'] = HEX("000000")

--Ijiraq Funcs

---Function used for Jokesters with custom transformation logic.
---@param card Card|table The card being transformed.
---@param context any Must be `context`. Use only within a Card's `calculate` context.
function hpfx_Transform(card, context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                for k, v in pairs(Hyperglobal.exceptions) do
                    if key == v then
                        key = k
                    end
                end
                table.insert(G.GAME.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            SMODS.calculate_context({ hpfx_raqeffect_check = true })
            return true
        end,
    }))
    return true
end

---Function used for Jokesters with no custom/automatic logic. You will not need to use this function.
---@param context any Must be `context`. Use only within a Card's `calculate` context.
function Card:Transfodd(context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if self.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = self.config.center.key
                for k, v in pairs(Hyperglobal.exceptions) do
                    if key == v then
                        key = k
                    end
                end
                table.insert(G.GAME.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self:flip()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self.config.center = G.P_CENTERS['j_hpfx_ijiraq']
            self:set_ability(self.config.center, true)
            play_sound("card1")
            self:juice_up(0.3, 0.3)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self.isIjiraq = nil
            self.visiblyIjiraq = nil
            self:flip()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            SMODS.calculate_context({ hpfx_raqeffect_check = true })
            return true
        end,
    }))
    return true
end

---Function used for transformation from a UI button
---@param e any Leave this as `e`, this is a G.FUNC, and they can't use `card`
function G.FUNCS.hpfx_Transbutt(e)
    local card = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                for k, v in pairs(Hyperglobal.exceptions) do
                    if key == v then
                        key = k
                    end
                end
                table.insert(G.GAME.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            G.jokers:unhighlight_all()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            SMODS.calculate_context({ hpfx_raqeffect_check = true })
            return true
        end,
    }))
    return true
end

---Function used to toggle Perkeo?'s targeting flag.
---@param e any Leave this as `e`, this is a G.FUNC, and they can't use `card`
function G.FUNCS.hpfx_Perktoggle(e)
    local _card = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0.1,
        func = function()
            _card.ability.extra.toggle = not _card.ability.extra.toggle
            return true
        end,
    }))
end

---Function used to de-render the toggle button if shown on Ijiraq.
---@param e any Leave this as `e`, this is a G.FUNC, and they can't use `card`
function G.FUNCS.hpfx_Perkcheck(e)
    local _card = e.config.ref_table
    if _card.config.center.key == 'j_hpfx_ijiraq' then
        _card.children.toggle_button:remove()
        _card.children.toggle_button = nil
    end
end

---Modifies the weights of boosters in the Booster pool. (`G.P_CENTER_POOLS.Booster`)\
---made by me! ^ u ^
---@param booster_kind string|true Booster to be modified. Set to `true` to affect all boosters in pool
---@param new_weight number? New weight of booster(s). Leave unspecified or `nil` to reset to default
---@param override boolean? If `true`, will override the first shop's guaranteed Buffoon Pack
---\
---__examples:__\
---All Boosters except Buffoon Packs disabled:\
---`Card:set_booster_weight(true, 0)`\
---`Card:set_booster_weight('Buffoon')` <- within an event\
---\
---Standard Packs reenabled at original weight:\
---`Card:set_booster_weight('Standard')`\
---\
---All Buffoon Packs (including the guaranteed) disabled:\
---`Card:set_booster_weight('Buffoon', 0, true)`
function Card:set_booster_weight(booster_kind, new_weight, override)
    for _, booster in pairs(G.P_CENTER_POOLS.Booster or {}) do
        if Hyperglobal.og_boostweight[booster.kind] == nil then
            Hyperglobal.og_boostweight[booster.kind] = booster.weight
        end
        local boostertable = Hyperglobal.og_boostweight[booster.kind]
        if override == true then G.GAME.first_shop_buffoon = true end
        if booster_kind == true or booster.kind == booster_kind then
            if boostertable == nil then boostertable = booster.weight end
            if new_weight == nil then
                booster.weight = boostertable
            elseif type(new_weight) == "number" then
                if new_weight >= 0 then
                    booster.weight = new_weight
                else
                    booster.weight = boostertable
                end
            else
                print('invalid use of set_booster_weight')
            end
        end
    end
end

---Modifies the weights (rates) of card objects. (`G.GAME.` ? `_rate`)\
---made by me! ^ u ^
---@param card_kind 'joker'|'tarot'|'planet'|'spectral'|'playing'|true Cardtype to be modified. Set to `true` to affect all cardtypes
---@param new_rate number? New weight of cardtype(s). Leave unspecified or `nil` to reset to default
---\
---__examples:__\
---Jokers don't appear, weight of Planets becomes 10:\
---`Card:set_card_rate('joker', 0)`\
---`Card:set_card_rate('planet', 10)` <- within an event
function Card:set_card_rate(card_kind, new_rate)
    local rate_map = {
        joker = "joker_rate",
        tarot = "tarot_rate",
        planet = "planet_rate",
        spectral = "spectral_rate",
        playing = "playing_card_rate"
    }
    if not G or not G.GAME then return end
    for rcard, rate in pairs(rate_map) do
        if card_kind == true or card_kind == rcard then
            if Hyperglobal.og_cardrate[rcard] == nil then
                Hyperglobal.og_cardrate[rcard] = G.GAME[rate]
            end
            if new_rate == nil then
                if type(Hyperglobal.og_cardrate[rcard]) == "number" then
                    G.GAME[rate] = Hyperglobal.og_cardrate[rcard]
                end
            elseif type(new_rate) == "number" then
                if new_rate >= 0 then
                    G.GAME[rate] = new_rate
                else
                    if type(Hyperglobal.og_cardrate[rcard]) == "number" then
                        G.GAME[rate] = Hyperglobal.og_cardrate[rcard]
                    end
                end
            end
        end
    end
end

---Rounds a number to the nearest multiple of another number.
---@param thingwearerounding any The number you want to round.
---@param tothemultipleof any The multiple you want to round to. Defaults to 1 if not provided.
function roundmyshitprettyplease(thingwearerounding, tothemultipleof)
    local getdivided = thingwearerounding / (tothemultipleof or 1)
    local getrounded = tothemultipleof * math.floor(getdivided)
    return getrounded
end

--Config
local config = Hyperglobal.config
--[[ SMODS.current_mod.config_tab = function ()
	return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 4}, nodes = {
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, hover = true, ref_table = Hyperglobal.config, ref_value = "Isaac" },
			}},
			{n = G.UIT.C, config = {align = "c", padding = 0 }, nodes = {
				{n = G.UIT.T, config = {text = localize('hpfx_isaac_option'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
				create_toggle{col = true, label = "", scale = 0.85, w = 0, shadow = true, hover = true, ref_table = Hyperglobal.config, ref_value = "Ijiraq" },
			}},
			{n = G.UIT.C, config = {align = "c", padding = 0}, nodes = {
				{n = G.UIT.T, config = {text = localize('hpfx_ijiraq_option'), scale = 0.45, colour = G.C.RED}},
			}},
		}},
		{n = G.UIT.R, config = {align = "bm", padding = 0}, nodes = {
			{n=G.UIT.C, config={button = "hpfx_save_and_apply", hover = true, colour = HEX("FCB3EA"), minw = 4, minh = 1, align = "cm", r = 0.1}, nodes={
				{n=G.UIT.T, config={text = "Save", scale = 0.44, colour = G.C.UI.TEXT_LIGHT, align = "cm"}},
			}}
		}}
	}}
end ]]
--[[ G.FUNCS.hpfx_save_and_apply = function()
    G.ACTIVE_MOD_UI = nil
    SMODS.save_all_config()
    SMODS.IN_MODS_TAB = nil
end ]]

--Quips
SMODS.JimboQuip({
    key = 'hpfx_eternal_jimbo',
    type = 'loss',
    extra = {
        center = 'j_hpfx_eternimbo',
        times = 5,
        pitch = 0.6,
        juice = { 0.3, 0.7 },
        delay = 0.25,
        particle_colours = {
            G.C.MULT,
            G.C.CHIPS,
            G.C.GOLD
        },
        materialize_colours = {
            G.C.MULT,
            G.C.CHIPS,
            G.C.GOLD
        },
    },

    filter = function(self, type)
        for _, v in ipairs(SMODS.find_card('j_joker', true)) do
            if v.ability.eternal then
                hpfx_jEternal = true
                break
            else
                hpfx_jEternal = false
            end
        end
        if hpfx_jEternal then
            self.extra.text_key = self.key .. pseudorandom('ejimbo', 1, 4)
            if self.extra.text_key == self.key .. 4 then
                self.extra.pitch = 1
                self.extra.times = 3
                self.extra.delay = 0.5
                self.extra.sound = 'hpfx_voice1'
            else
                self.extra.sound = 'voice1'
            end
            return true, { weight = 100 }
        end
    end,

})

--list of debug functions

function rendercheck(txt) --Test text printing here
    attention_text({
        text = txt,
        scale = 1.3,
        hold = 1.4,
        major = aura_card,
        backdrop_colour = G.C.RARITY[4],
        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0 },
        silent = true
    })
end

function porctest() --Turns your entire deck into Stone cards
    for _, card in ipairs(G.playing_cards) do
        card:set_ability(G.P_CENTERS.m_stone)
    end
end

function cyanunlock(count) --Manually set the number of times Crimson Heart was defeated
    G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = count
end

function guh() --Convert the Joker you're hovering over into its Jokester variant
    local selected = G.CONTROLLER and
        (G.CONTROLLER.focused.target or G.CONTROLLER.hovering.target)
    if Hyperglobal.brokejokes[selected.config.center.key] then return print('This one\'s disabled until I can fix it!') end
    G.GAME.current_round.fodder_card.jkey = selected.config.center.key
    if JokerDisplay then
        selected:joker_display_remove()
    end
    selected:set_ability('j_hpfx_costume')
end

function guh2() -- just put the key in the table bro (inserts the hovered Joker's key into Ijiraq's effects table directly)
    local selected = G.CONTROLLER and
        (G.CONTROLLER.focused.target or G.CONTROLLER.hovering.target)
    if Hyperglobal.brokejokes[selected.config.center.key] then return print('This one\'s disabled until I can fix it!') end
    table.insert(G.GAME.raqeffects, selected.config.center.key)
end

debugs_one_line_long = { --other debug commands that just go into the console
    "eval G.GAME.raqeffects",
    -- prints all current effects Ijiraq has stored
    "eval Hyperglobal.exceptions",
    -- prints the current table of Jokesters with custom transformation logic
    "eval Hyperglobal.calcdollarjokesters",
    -- prints the current table of Jokesters that calculate dollar bonuses
    "eval G.jokers.cards[1].config.center.key",
    -- checks the first joker's key
    "eval G.GAME.current_round.fodder_card.jkey",
    -- checks the stored key of the fodder card
    "eval G.GAME.trig"
    -- prints current effects ijiraq has stored from add_to_deck. prevents effect resets if a different Ijiraq is removed
}

function heold() --Test function to simulate the Ejimbo game over
    SMODS.add_card
    {
        set = 'Joker',
        stickers = { 'eternal' },
        key = 'j_joker',
        force_stickers = { 'eternal' }
    }
    G.STATE = G.STATES.GAME_OVER
    if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
        G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
    end
    G:save_settings()
    G.FILE_HANDLER.force = true
    G.STATE_COMPLETE = false
end
