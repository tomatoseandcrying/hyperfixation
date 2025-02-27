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

assert(SMODS.load_file('IsaacJokers.lua'))()