local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.fodder_card = { jkey = 'j_joker' }
    ret.wheel_fails = 0
	return ret
end

local bdf = Blind.defeat
function Blind:defeat(silent)
    if self.name == 'Crimson Heart' then
        G.PROFILES[G.SETTINGS.profile].crimsonCount = G.PROFILES[G.SETTINGS.profile].crimsonCount + 1
        if G.PROFILES[G.SETTINGS.profile].crimsonCount >= 10 then
            check_for_unlock({type = 'hpfx_momheart'})
        end
    end
    return bdf(self, silent)
end

local ccc = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    if context.using_consumeable and context.consumeable.config.center.key == "c_devil" then
        G.PROFILES[G.SETTINGS.profile].devilCount = G.PROFILES[G.SETTINGS.profile].devilCount + 1
        if G.PROFILES[G.SETTINGS.profile].devilCount >= 3 then
            check_for_unlock({type = 'hpfx_devil'})
        end
    end
    return ccc(self, return_table)
end

function SMODS.current_mod.reset_game_globals(run_start)
    local ijiraq_pool = get_current_pool("Joker")
    local jokester = pseudorandom_element(ijiraq_pool, pseudoseed('ijiraq'))
    G.GAME.current_round.fodder_card.jkey = jokester or 'j_joker'
end