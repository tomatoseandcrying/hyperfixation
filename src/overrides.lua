local igo = Game.init_game_object
function Game:init_game_object()
	local ret = igo(self)
	ret.current_round.fodder_card = { jkey = 'j_joker' }
    ret.wheel_fails = 0
    ret.hpfx_nothingEverHappens = true
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
    return ccc(context, return_table)
end

function SMODS.current_mod.reset_game_globals(run_start)
    local ijiraq_pool = get_current_pool("Joker")
    local jokester = pseudorandom_element(ijiraq_pool, pseudoseed('ijiraq'))
    G.GAME.current_round.fodder_card.jkey = jokester or 'j_joker'
end

local chud = Card.calculate_joker
function Card:calculate_joker(context)
    local ret, trig = chud(self, context)
    if (ret and next(ret)) or trig then
        G.GAME.hpfx_nothingEverHappens = false
    end
    if context.end_of_round and context.main_eval and G.GAME.blind.boss and G.GAME.round_resets.ante >= 3 then
        if G.GAME.hpfx_nothingEverHappens then
            check_for_unlock({type = 'hpfx_chud'})
        else
            G.GAME.hpfx_nothingEverHappens = true
        end
    end
    return chud(self, context)
end

G.P_CENTERS.m_glass.calculate = G.P_CENTERS.m_glass.calculate or function() end
local hookTo = G.P_CENTERS.m_glass.calculate
function G.P_CENTERS.m_glass:calculate(card, context)
    local ret = hookTo(self, card, context)
        if ret and card.glass_trigger then
            SMODS.calculate_context{chudhit = true}
        end
    return ret
end

G.P_CENTERS.m_lucky.calculate = G.P_CENTERS.m_lucky.calculate or function() end
local hookTo = G.P_CENTERS.m_lucky.calculate
function G.P_CENTERS.m_lucky:calculate(card, context)
    local ret = hookTo(self, card, context)
        if ret and card.lucky_trigger then
            SMODS.calculate_context{chudhit = true}
        end
    return ret
end

--[[ local hyperrandom
function pseudorandom(seed)
local result = hyperrandom(seed)
local odds = nil
local self_ref = nil
for i = 1, 10 do
local name, value = debug.getlocal(2, i)
if name == "self" then
    self_ref = value
    break
end
if self_ref and self_ref.ability and self_ref.ability.extra then
local success = pcall(function() extra_odds = self_ref.ability.extra.odds end)
if not success then
local success = pcall(function() extra_odds = self_ref.ability.extra.odds_1 end)
end
if not success then
local success = pcall(function() extra_odds = self_ref.ability.extra end)
end
odds = G.GAME.probabilities.normal/extra_odds
    if result >= odds then
    print("failure on seed", seed, "resulting in", result, "with odds", odds)
    end
end
    return result end
end ]]