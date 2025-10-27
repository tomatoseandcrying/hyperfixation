SMODS.Joker { --Costume (The costume setup only works before, during, or after hand calculations. Anything else will require creation of an exception.)
	key = 'costume',
	atlas = 'IjiraqJokers',
	rarity = 3,
	blueprint_compat = false,
	pos = { x = 0, y = 0 },
	config = {},
	no_collection = true,
	set_ability = function(self, card, initial, delay_sprites)
		card.isIjiraq = (Hyperfixation.exceptions[G.GAME.current_round.fodder_card.jkey] == nil)
		card.visiblyIjiraq = false
		card:set_ability(
			Hyperfixation.exceptions[G.GAME.current_round.fodder_card.jkey] or G.GAME.current_round.fodder_card.jkey or
			'j_joker', true)
		card:set_cost()
		card.children.center.sprite_pos = G.P_CENTERS[G.GAME.current_round.fodder_card.jkey].pos
		card.children.center.atlas.name = 'hpfx_IjiraqJokers'
		card.children.center:reset()
	end,
	add_to_deck = function(self, card, from_debuff)
		card:add_sticker('hpfx_priceless')
	end,
	--[[ 	calculate = function(self,card,context)
		if context.before and context.cardarea == G.jokers then
			maxx_debug(G.GAME.current_round.fodder_card.jkey)
		end
	end ]]
}
