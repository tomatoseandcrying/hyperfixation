SMODS.Atlas({
	key = "modicon",
	path = "icon.png",
	px = 32,
	py = 32,
}):register()

--talisman conversion function
to_big = to_big or function(num)
    return num
end

loc_colour('red')
G.ARGS.LOC_COLOURS['IjiGray'] = HEX("BFD7D5")

assert(SMODS.load_file('IsaacJokers.lua'))()
assert(SMODS.load_file('IjiraqJokers.lua'))()