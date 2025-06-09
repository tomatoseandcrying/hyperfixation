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

local calc_Ref = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = calc_Ref(self,context)
    if ret and self.isIjiraq then
        Card:Transfodd(context)
    end
    if context.setting_blind then
        G.E_MANAGER:add_event(Event({
            trigger = "after",
            delay = 0.15,
            func = function()
                play_sound("card1")
                self:juice_up(0.3, 0.3)
                return true
            end,
        }))
    end
    return ret 
end

local stupidRef = generate_card_ui
function generate_card_ui(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
   local ihatethis = nil
   local changed = false
    if card and (card.config.center and card.config.center.key == _c.key) and card.visiblyIjiraq then
        ihatethis = G.localization.descriptions[_c.set][_c.key]['name']
        ihatethis = ihatethis .. '{C:IjiGray}...?{}'
        G.localization.descriptions[_c.set][_c.key]['name'] = ihatethis
        desc = G.localization.descriptions[_c.set][_c.key]['text']
        desc[#desc] = desc[#desc] .. "{C:IjiGray}...?{}"
        G.localization.descriptions[_c.set][_c.key]['text'] = desc
		changed = true
        init_localization()
    end
    local hatethisonethemost = stupidRef(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    if changed then
        ihatethis = ihatethis:sub(1, ihatethis:len() - 17) --17 is the exact length of the string "{C:IjiGray}...?{}", change this only if you change the string's length
        G.localization.descriptions[_c.set][_c.key]['name'] = ihatethis
        desc[#desc] = desc[#desc]:sub(1, desc[#desc]:len() - 17)
        G.localization.descriptions[_c.set][_c.key]['text'] = desc
		init_localization()
    end
    return hatethisonethemost
end
local add2deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if self.isIjiraq then self.visiblyIjiraq = true end
    add2deck_ref(self, from_debuff)
end