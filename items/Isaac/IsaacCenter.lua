--I want them in the order they are in TBOI
assert(SMODS.load_file('items/Isaac/Jokers/Moriah.lua'))()
--tainted unlock condition: Win a run with no more than 3 Jokers from start to finish
assert(SMODS.load_file('items/Isaac/Jokers/Mary.lua'))()
--tainted unlock condition: Destroy Mary using Madness Joker
assert(SMODS.load_file('items/Isaac/Jokers/Farmer.lua'))()
--tainted unlock condition: Feed Swashbuckler to Ceremonial Dagger
assert(SMODS.load_file('items/Isaac/Jokers/Iscariot.lua'))()
--tainted unlock condition: Win a run with Dark Judas
assert(SMODS.load_file('items/Isaac/Jokers/Cyanosis.lua'))()
--tainted unlock condition: Have Blueprint copy Blue Joker
