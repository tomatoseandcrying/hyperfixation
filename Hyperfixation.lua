--Visual Libraries
SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
}):register()
SMODS.Atlas{
    key = 'IsaacJokers',
    path = "IsaacJokers.png",
    px = 71,
    py = 95
}
SMODS.Atlas{
	key = 'Jokers4Fun',
	path = "Jokers4Fun.png",
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

--File Loading
SMODS.load_file('src/overrides.lua')()
SMODS.load_file('Isaac/IsaacCenter.lua')()
--SMODS.load_file('Ijiraq/IjiraqJokers.lua')()
SMODS.load_file('4Fun/FunZone.lua')()
SMODS.load_file('Stickers.lua')()


--Custom Colors
loc_colour('red')
G.ARGS.LOC_COLOURS['IjiGray'] = HEX("BFD7D5")

--talisman conversion function
to_big = to_big or function(x) return x end

--General Refactor Functions
function chipGain(card, context)
	card.ability.extra.chips = card.ability.extra.chips + card.ability.extra.chip_gain
end
function isaacChip(card, context)
	SMODS.calculate_effect({
		chip_mod = card.ability.extra.chips,
		sound = "hpfx_thumbsup",
		colour = G.C.CHIPS,
		message = localize{type = 'variable', key = 'a_chips', vars = {card.ability.extra.chips}}
	}, card)
end
function isaacMult(card, context)
    SMODS.calculate_effect({
        mult_mod = card.ability.extra.mult,
        sound = 'hpfx_1up',
        message = localize{type = 'variable', key = 'a_mult', vars = {card.ability.extra.mult}}
    }, card)
end
function counterIncrement(card, context)
    if context.main_eval and (to_big{card.ability.extra.mult, card.ability.extra.mult_gain} > to_big(1)) then
        card.ability.extra.c_rounds = card.ability.extra.c_rounds + 1 --otherwise adds 1 to the counter
    end
end

--Ownerships (not unlock)
SMODS.Consumable:take_ownership('c_wheel_of_fortune', {
    use = function(self, card, area, copier)
        local testvar = G.GAME.probabilities.normal/(card.ability.extra*(next(SMODS.find_card('j_hpfx_farmer')) and 0.5 or 1))
        local used_tarot = copier or card
        local temp_pool = (card.ability.name == 'The Wheel of Fortune' and card.eligible_strength_jokers) or {}
        if pseudorandom('wheel_of_fortune') < testvar then
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function ()
				G.GAME.wheel_fails = 0
				SMODS.calculate_context{chudhit = true}
                local over = false
                local eligible_card = pseudorandom_element(temp_pool, pseudoseed(
                    (card.ability.name == 'The Wheel of Fortune' and 'wheel_of_fortune')
                ))
                local edition = nil
                if card.ability.name == 'The Wheel of Fortune' then
                    edition = poll_edition('wheel_of_fortune', nil, true, true)
                end
                eligible_card:set_edition(edition, true)
                if card.ability.name == 'The Wheel of Fortune' then check_for_unlock({type = 'have_edition'}) end
                used_tarot:juice_up(0.3, 0.5)
            return true end}))
		else
            G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.4, func = function()
				G.GAME.wheel_fails = G.GAME.wheel_fails + 1
                attention_text({
                    text = localize('k_nope_ex'),
                    scale = 1.3, 
                    hold = 1.4,
                    major = used_tarot,
                    backdrop_colour = G.C.SECONDARY_SET.Tarot,
                    align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and 'tm' or 'cm',
                    offset = {x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK or G.STATE == G.STATES.SMODS_BOOSTER_OPENED) and -0.2 or 0},
                    silent = true
                    })
                    G.E_MANAGER:add_event(Event({trigger = 'after', delay = 0.06*G.SETTINGS.GAMESPEED, blockable = false, blocking = false, func = function()
                        play_sound('tarot2', 0.76, 0.4);return true end}))
                    play_sound('tarot2', 1, 0.4)
                    used_tarot:juice_up(0.3, 0.5)
            return true end }))
        end
		if G.GAME.wheel_fails >= 2 then
			check_for_unlock({type = 'hpfx_nope'})
		end
    end,
}, true)
--Unlock Conditions
SMODS.Joker:take_ownership('oops', {
	add_to_deck = function(self, card, context)
		check_for_unlock({type = 'hpfx_oops'})
	end,
}, true)

G.PROFILES[G.SETTINGS.profile].crimsonCount = crimsonCount or 0
G.PROFILES[G.SETTINGS.profile].devilCount = devilCount or 0


--Config
Hyperglobal = SMODS.current_mod
local config = SMODS.current_mod.config
SMODS.current_mod.config_tab = function ()
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
end
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
G.FUNCS.hpfx_save_and_apply = function()
    G.ACTIVE_MOD_UI = nil
    SMODS.save_all_config()
    SMODS.IN_MODS_TAB = nil
end

--Quips
eternal_jimbo = Card_Character.add_speech_bubble
jEternal = jEternal or false
Card_Character.add_speech_bubble = function (self, arg1, arg2, arg3)
	for _, v in ipairs(SMODS.find_card('j_joker')) do
		if v.ability.eternal then jEternal = true break
		else jEternal = false
		end
	end
	if jEternal then
	eternal_jimbo(self, 'eternal_jimbo' .. pseudorandom("ejimbo", 1, 2), nil, {quip = true})
	else
	eternal_jimbo(self, arg1, arg2, arg3)
	end
end





--[[ 
People I Need To Credit ingame too:
------------------------
me for being awesome and shit

ggezsped for being my first tester!

BakersDozenBagels for Cyanosis's mult-decrease scoring context
misenrol for the Greedy Joker? tweaks done in the notes app at 3AM
someone23832 for the save button
Bepis for saving my ass like 12 times oml :sob:
Aikoyori for saving my ass like 6 other times oh god
Maxx for helping with the Ijiraq redesign, reformatting of Ijiraq's code to make it FAR less complicated
Delirium for also reformatting Ijiraq's code to make it far less complicated, helping me create and fix my sticker, helping me with unlock conditions
N' for help with the transformation and dynamic description code
Larswijn for helping me get Farmer functional!!
Hamester for helping me fix my sticker
Astra for fixing my file splitting/global function issues!
FoxDeploy for helping me with unlock conditions
revo

Thunk for having the worst code known to man someone kill me 
]]