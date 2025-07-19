Hyperglobal = SMODS.current_mod
Hyperglobal.og_boostweight = Hyperglobal.og_boostweight or {}

--Visual Libraries
SMODS.Atlas({
    key = "modicon",
    path = "icon.png",
    px = 32,
    py = 32,
}):register()
SMODS.Atlas {
    key = 'IsaacJokers',
    path = "IsaacJokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'Jokers4Fun',
    path = "Jokers4Fun.png",
    px = 71,
    py = 95
}
SMODS.Atlas {
    key = 'IjiraqJokers',
    path = "IjiraqJokers.png",
    px = 71,
    py = 95
}

--Audio Libraries
SMODS.Sound({
    key = "hpfx_1up",
    path = "1up.ogg",
})
SMODS.Sound({
    key = "hpfx_thumbsup",
    path = "thumbsup.ogg",
})
SMODS.Sound({
    key = "hpfx_gulp",
    path = "gulp.ogg",
})
SMODS.Sound({
    key = "hpfx_silver",
    path = "dimedrop.ogg",
})
SMODS.Sound({
    key = "hpfx_death1",
    path = "Isaac_dies_new.ogg",
})
SMODS.Sound({
    key = "hpfx_death2",
    path = "Isaac_dies_new_1.ogg",
})
SMODS.Sound({
    key = "hpfx_death3",
    path = "Isaac_dies_new_2.ogg",
})
SMODS.Sound({
    key = "hpfx_fall",
    path = "lich-fall.ogg",
})
SMODS.Sound({
    key = "hpfx_pickup",
    path = "lastwishpickup.ogg",
    volume = 0.6,
})

--File Loading
mod_path = "" .. SMODS.current_mod.path
function load_folder(folder)
    files = NFS.getDirectoryItems(mod_path .. folder)
    for i, file in ipairs(files) do
        SMODS.load_file(folder .. "/" .. file)()
    end
end

SMODS.load_file('src/overrides.lua')()
SMODS.load_file('lib/ui.lua')()
SMODS.load_file('Isaac/IsaacCenter.lua')()
SMODS.load_file('Ijiraq/RaqShack.lua')()
SMODS.load_file('4Fun/FunZone.lua')()
SMODS.load_file('Stickers.lua')()


--Custom Colors
loc_colour('red')
G.ARGS.LOC_COLOURS['hpfx_IjiGray'] = HEX("BFD7D5")

--talisman conversion function
to_big = to_big or function(x) return x end

--Functions
function hpfx_chipGain(card, context)
    card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
end

function hpfx_isaacChip(card, context)
    SMODS.calculate_effect({
        chip_mod = card.ability.extra.chips,
        sound = "hpfx_thumbsup",
        colour = G.C.CHIPS,
        message = localize { type = 'variable', key = 'a_chips', vars = { card.ability.extra.chips } }
    }, card)
end

function hpfx_isaacMult(card, context)
    SMODS.calculate_effect({
        mult_mod = card.ability.extra.mult,
        sound = 'hpfx_1up',
        message = localize { type = 'variable', key = 'a_mult', vars = { card.ability.extra.mult } }
    }, card)
end

function counterIncrement(card, context)
    if context.main_eval and (to_big { card.ability.extra.mult, card.ability.extra.mult_gain } > to_big(1)) then
        card.ability.extra.c_rounds = card.ability.extra.c_rounds + 1 --otherwise adds 1 to the counter
    end
end

function stoneGeneration(card, context)
    local stone_card = create_playing_card(
        { center = G.P_CENTERS.m_stone },
        G.discard,
        true,
        false,
        nil,
        true
    )
    G.E_MANAGER:add_event(Event({
        func = function()
            stone_card:start_materialize({ G.C.SECONDARY_SET.Enhanced })
            G.play:emplace(stone_card)
            return true
        end
    }))
    return {
        message = localize('k_plus_stone'),
        colour = G.C.SECONDARY_SET.Enhanced,
        func = function()
            G.E_MANAGER:add_event(Event({
                func = function()
                    G.deck.config.card_limit =
                        G.deck.config.card_limit + 1
                    return true
                end
            }))
            draw_card(G.play, G.deck, 90, 'up')
            SMODS.calculate_context(
                {
                    playing_card_added = true,
                    cards = { stone_card }
                })
        end
    }
end

function hpfx_Transform(card, context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                for k, v in pairs(exceptions) do
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
    return true
end

function Card:Transfodd(context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if self.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = self.config.center.key
                for k, v in pairs(exceptions) do
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
    return true
end

function G.FUNCS.hpfx_Transbutt(e)
    local card = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                for k, v in pairs(exceptions) do
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
    --here?
    return true
    --or maybe here?
end

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

function Hyperglobal.safe_set_ability(self, center)
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
end

function Card:set_booster_weight(booster_kind, new_weight)
    for _, booster in pairs(G.P_CENTER_POOLS.Booster or {}) do
        if Hyperglobal.og_boostweight[booster.kind] == nil then
            Hyperglobal.og_boostweight[booster.kind] = booster.weight
        end
        local boostertable = Hyperglobal.og_boostweight[booster.kind]
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

function roundmyshitprettyplease(thingwearerounding, tothemultipleof)
    local getdivided = thingwearerounding / (tothemultipleof or 1)
    local getrounded = tothemultipleof * math.floor(getdivided)
    return getrounded
end

--Unlock Conditions
G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = hpfx_crimsonCount or 0
G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = hpfx_devilCount or 0
SMODS.Joker:take_ownership('oops', {
    add_to_deck = function(self, card, context)
        check_for_unlock({ type = 'hpfx_oops' })
    end,
}, true)

--Config
local config = SMODS.current_mod.config
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
SMODS.current_mod.optional_features = function()
    return {
        post_trigger = true,
        retrigger_joker = true,
        quantum_enhancements = true,
        cardareas = {
            discard = true,
            deck = true
        }
    }
end
--[[ G.FUNCS.hpfx_save_and_apply = function()
    G.ACTIVE_MOD_UI = nil
    SMODS.save_all_config()
    SMODS.IN_MODS_TAB = nil
end ]]

--Quips
hpfx_eternal_jimbo = Card_Character.add_speech_bubble
hpfx_jEternal = hpfx_jEternal or false
Card_Character.add_speech_bubble = function(self, arg1, arg2, arg3)
    for _, v in ipairs(SMODS.find_card('j_joker')) do
        if v.ability.eternal then
            hpfx_jEternal = true
            break
        else
            hpfx_jEternal = false
        end
    end
    if hpfx_jEternal then
        hpfx_eternal_jimbo(self, 'hpfx_eternal_jimbo' .. pseudorandom("ejimbo", 1, 2), nil, { quip = true })
    else
        hpfx_eternal_jimbo(self, arg1, arg2, arg3)
    end
end

--tables
exceptions = {
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
    j_drivers_license = 'j_learners_permit',
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
    j_joker = 'j_hpfx_jumbo',
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
    j_trading_card = 'j_hpfx_collecting',
    j_selzer = 'j_hpfx_seltzer',
    j_smiley = 'j_hpfx_frowny',
    j_walkie_talkie = 'j_hpfx_talkie_walkie',
}

--debug
function maxx_debug(txt)
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

function toma_debug_porcelaintest()
    for _, card in ipairs(G.playing_cards) do
        card:set_ability(G.P_CENTERS.m_stone)
    end
end

function tomadebugcostume(key)
    G.GAME.current_round.fodder_card.jkey = key
end
