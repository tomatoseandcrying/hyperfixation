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

if config.Isaac then
	SMODS.load_file('IsaacJokers.lua')()
end

if config.Ijiraq then
	SMODS.load_file('IjiraqJokers.lua')()
end

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

BakersDozenBagels for Cyanosis's mult-decrease scoring context
misenrol for the Greedy Joker? tweaks done in the notes app at 3AM
someone23832 for the save button
Bepis for saving my ass like 12 times oml :sob:
bakshotmaxx for helping with the Ijiraq redesign
N' for the Ijiraq transformation animation congregation code

Thunk for having the worst code known to man someone kill me 
]]