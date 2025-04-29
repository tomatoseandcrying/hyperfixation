SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
}):register()

--talisman conversion function
to_big = to_big or function(x) return x end

Hyperglobal = {}
local config = SMODS.current_mod.config

SMODS.current_mod.config_tab = function ()
	return {n = G.UIT.ROOT, config = {r = 0.1, align = "cm", padding = 0.1, colour = G.C.BLACK, minw = 8, minh = 4}, nodes = {
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
				create_toggle{ col = true, label = "", scale = 0.85, w = 0, shadow = true, hover = true, ref_table = config, ref_value = "Isaac" },
			}},
			{n = G.UIT.C, config = {align = "c", padding = 0 }, nodes = {
				{n = G.UIT.T, config = {text = localize('hpfx_isaac_option'), scale = 0.45, colour = G.C.UI.TEXT_LIGHT }},
			}},
		}},
		{n = G.UIT.R, config = {align = "cl", padding = 0}, nodes = {
			{n = G.UIT.C, config = {align = "cl", padding = 0.05}, nodes = {
				create_toggle{col = true, label = "", scale = 0.85, w = 0, shadow = true, hover = true, ref_table = config, ref_value = "Ijiraq" },
			}},
			{n = G.UIT.C, config = {align = "c", padding = 0}, nodes = {
				{n = G.UIT.T, config = {text = localize('hpfx_ijiraq_option'), scale = 0.45, colour = G.C.RED}},
			}},
		}},
		{n = G.UIT.R, config = {align = "bm", padding = 0}, nodes = {
			{n=G.UIT.C, config={button = "hpfx_save_and_apply", hover = true, colour = HEX("FCB3EA"), minw = 4, minh = 1, align = "cm", r = 0.1}, nodes={
				{n=G.UIT.T, config={text = "Save (restarts!)", scale = 0.44, colour = G.C.UI.TEXT_LIGHT, align = "cm"}},
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

if config.Isaac then
	SMODS.load_file('Isaac/IsaacCenter.lua')()
	SMODS.load_file('Isaac/Jokers/Moriah.lua')()
end
if config.Ijiraq then
	SMODS.load_file('Ijiraq/IjiraqJokers.lua')()
end

SMODS.load_file('Stickers.lua')()

loc_colour('red')
G.ARGS.LOC_COLOURS['IjiGray'] = HEX("BFD7D5")

G.FUNCS.hpfx_save_and_apply = function(e)
    G.ACTIVE_MOD_UI = nil
    SMODS.save_all_config()
    SMODS.restart_game()
    SMODS.IN_MODS_TAB = nil
end


--[[ 
People I Need To Credit:
------------------------
me for being awesome and shit

ggezsped for being my first tester!

BakersDozenBagels for Cyanosis's mult-decrease scoring context
misenrol for the Greedy Joker? tweaks done in the notes app at 3AM
someone23832 for the save button
Bepis for saving my ass like 12 times oml :sob:
Aikoyori for saving my ass like 6 other times oh god
Maxx for helping with the Ijiraq redesign, reformatting of Ijiraq's code to make it FAR less complicated
Delirium for also reformatting Ijiraq's code to make it far less complicated, helping me create and fix my sticker
N' for help with the transformation and dynamic description code
Larswijn for helping me get Farmer functional!!
Hamester for helping me fix my sticker
revo

Thunk for having the worst code known to man someone kill me 
]]

--

