SMODS.Joker{ --Costume
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
        card.children.front = Sprite(card.T.x, card.T.y, card.T.w, card.T.h, G.ASSET_ATLAS[G.P_CENTERS[G.GAME.current_round.fodder_card.jkey].atlas], G.P_CENTERS[G.GAME.current_round.fodder_card.jkey].pos)
        card.children.front.states.hover = card.states.hover
        card.children.front.states.click = card.states.click
        card.children.front.states.drag = card.states.drag
        card.children.front.states.collide.can = false
        card.children.front:set_role({major = card, role_type = 'Glued', draw_major = card})
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