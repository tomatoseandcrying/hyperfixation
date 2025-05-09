local igo = Game.init_game_object
--Function that declares a variable that tracks what Joker the Costume will pretend to be. (1/3)
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.fodder_card = { jkey = 'j_joker' }
    ret.wheel_fails = 0
	return ret
end

--Function that has the Costume change its look and abilities each round. (2/3)
function SMODS.current_mod.reset_game_globals(run_start)
    local ijiraq_pool = get_current_pool("Joker")
    local jokester = pseudorandom_element(ijiraq_pool, pseudoseed('ijiraq'))
    G.GAME.current_round.fodder_card.jkey = jokester or 'j_joker'
end