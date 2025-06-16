SMODS.Joker{ --Costume (The costume setup only works before, during, or after hand calculations. Anything else will require creation of an exception.)
	key = 'costume',
	atlas = 'IjiraqJokers',
	rarity = 3,
	blueprint_compat = false,
	pos = { x = 0, y = 0 },
	config = { extra = {
			jkey = 'fodder'
		}
	},
	no_collection = true,
	loc_vars = function(self,info_queue,card)
		return {vars = {card.ability.extra.jkey}}      
	end,
	set_ability = function(self, card, initial, delay_sprites)
        local exceptions = {
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
        }
        card.isIjiraq = (exceptions[G.GAME.current_round.fodder_card.jkey] == nil)
        card.visiblyIjiraq = false
        card:set_ability(exceptions[G.GAME.current_round.fodder_card.jkey] or G.GAME.current_round.fodder_card.jkey or 'j_joker', true)
        card:set_cost()
    end,
    add_to_deck = function (self, card, from_debuff)
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, card, true)
    end,
--[[ 	calculate = function(self,card,context)
		if context.before and context.cardarea == G.jokers then
			maxx_debug(G.GAME.current_round.fodder_card.jkey)
		end
	end ]]
}