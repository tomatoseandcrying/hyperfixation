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
        G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount + 1
        if G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount >= 10 then
            check_for_unlock({type = 'hpfx_momheart'})
        end
    end
    return bdf(self, silent)
end

local ccc = SMODS.calculate_context
function SMODS.calculate_context(context, return_table)
    if context.using_consumeable and context.consumeable.config.center.key == "c_devil" then
        G.PROFILES[G.SETTINGS.profile].hpfx_devilCount = G.PROFILES[G.SETTINGS.profile].hpfx_devilCount + 1
        if G.PROFILES[G.SETTINGS.profile].hpfx_devilCount >= 3 then
            check_for_unlock({type = 'hpfx_devil'})
        end
    end
    return ccc(context, return_table)
end

function SMODS.current_mod.reset_game_globals(run_start)
    if run_start or G.GAME.round_resets.blind_states.Boss == "Defeated" then
        local ijiraq_pool = get_current_pool("Joker")
        local jokester = pseudorandom_element(ijiraq_pool, pseudoseed('ijiraq'))
        ---@diagnostic disable-next-line: cast-local-type
        if jokester and jokester == 'UNAVAILABLE' then jokester = 'j_joker' end
        G.GAME.current_round.fodder_card.jkey = jokester or 'j_joker'
    end
    for _, card in ipairs(G.jokers.cards) do
        if card.isIjiraq or exceptions[G.GAME.current_round.fodder_card.jkey] and
        not card.config.center.key == 'j_hpfx_ijiraq' then
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    G.P_CENTERS.j_hpfx_costume:set_ability(card)
                    play_sound("card1")
                    card:juice_up(0.3, 0.3)
                    return true
                end
            }))
            G.E_MANAGER:add_event(Event({
                trigger = 'after',
                delay = 0.15,
                func = function()
                    card:flip()
                    return true
                end
            }))
        end
    end
    if run_start then
        G.GAME.raqeffects = {}
    end
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
            SMODS.calculate_context{hpfx_chudhit = true}
        end
    return ret
end

local calc_Ref = Card.calculate_joker
function Card:calculate_joker(context)
    local ret = calc_Ref(self,context)
    if ret and self.isIjiraq then
        self.isIjiraq = false
        G.E_MANAGER:add_event(Event({
            func = function()
                self:Transfodd(context)
                return true
            end
        }))
    end
    if context.setting_blind and self.isIjiraq then
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
        ihatethis = ihatethis .. '{C:hpfx_IjiGray}...?{}'
        G.localization.descriptions[_c.set][_c.key]['name'] = ihatethis
        desc = G.localization.descriptions[_c.set][_c.key]['text']
        desc[#desc] = desc[#desc] .. "{C:hpfx_IjiGray,s:0.7}...?{}"
        G.localization.descriptions[_c.set][_c.key]['text'] = desc
		changed = true
        init_localization()
    end
    local hatethisonethemost = stupidRef(_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)
    if changed then
        ihatethis = ihatethis:sub(1, ihatethis:len() - 22) --22 is the exact length of the string "{C:hpfx_IjiGray}...?{}", change this only if you change the string's length
        G.localization.descriptions[_c.set][_c.key]['name'] = ihatethis
        desc[#desc] = desc[#desc]:sub(1, desc[#desc]:len() - 28) --same here but with "{C:hpfx_IjiGray,s:0.7}...?{}"
        G.localization.descriptions[_c.set][_c.key]['text'] = desc
		init_localization()
    end
    return hatethisonethemost
end
local add2deck_ref = Card.add_to_deck
function Card:add_to_deck(from_debuff)
    if self.isIjiraq then
        self.visiblyIjiraq = true
        local sticker = SMODS.Stickers['hpfx_priceless']
        sticker.apply(sticker, self, true)
        end
    add2deck_ref(self, from_debuff)
end

local ref_ease_hands = ease_hands_played
function ease_hands_played(mod, instant)
    local ret = ref_ease_hands(mod, instant)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({hpfx_change_hands = true})
            return true
        end
    }))

    return ret
end
local ref_ease_discards = ease_discard
function ease_discard(mod, instant, silent)
    local ret = ref_ease_discards(mod, instant, silent)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({hpfx_change_discards = true})
            return true
        end
    }))
    return ret
end
local ref_ease_dollars = ease_dollars
function ease_dollars(mod, instant)
    local ret = ref_ease_dollars(mod, instant)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({hpfx_change_dollars = true})
            return true
        end
    }))
    return ret
end
local ref_ease_ante = ease_ante
function ease_ante(mod)
    local ret = ref_ease_ante(mod)
    G.E_MANAGER:add_event(Event({
        trigger = 'immediate',
        func = function()
            SMODS.calculate_context({hpfx_change_ante = true})
            return true
        end
    }))
    return ret
end

local card_set_cost_ref = Card.set_cost
function Card:set_cost()
    card_set_cost_ref(self)
    if next(SMODS.find_card("j_hpfx_galilimbo")) then
        if (self.ability.set == 'Planet' or (self.ability.set == 'Booster' and self.config.center.kind == 'Celestial')) then self.cost = 0 end
        self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
        self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
    end
    if G.GAME.raqeffects then
        for _, v in pairs(G.GAME.raqeffects) do
            local found = false
            if v == 'j_astronomer' then
                found = true
            end
            if next(SMODS.find_card("j_hpfx_ijiraq")) and found == true then
                if (self.ability.set == 'Planet' or (self.ability.set == 'Booster' and self.config.center.kind == 'Celestial')) then self.cost = 0 end
                self.sell_cost = math.max(1, math.floor(self.cost / 2)) + (self.ability.extra_value or 0)
                self.sell_cost_label = self.facing == 'back' and '?' or self.sell_cost
            end
        end
    end
end

function G.UIDEF.hpfx_transform_button(card) --UI of the actual button
    local transform = nil
    local key = card.config.center.key
    if card.area and card.area.config.type == 'joker' and key ~= 'j_hpfx_ijiraq'
    and card.config.center.rarity == 4 then local specil = nil
        for k, v in pairs(exceptions) do if key == v then specil = true break end end
        if specil or card.visiblyIjiraq then
            transform = {n=G.UIT.C, config={align = "cr"}, nodes={
            {n=G.UIT.C, config={ref_table = card, align = "cr", maxw = 1.25, padding = 0.1, r=0.08, minw = 1.25, hover = true,
            shadow = true, minh = (card.area and card.area.config.type == 'joker') and 0 or 1, colour = G.C.RED,
            one_press = true, button = 'hpfx_Transbutt'},
            nodes={
                {n=G.UIT.B, config = {w=0.1,h=0.6}},
                {n=G.UIT.T, config={text = localize('hpfx_shed'),colour = G.C.UI.TEXT_LIGHT, scale = 0.6, shadow = true}}
            }},
        }} end
        return transform
    end
end

local stupidfuckingbuttonref = G.UIDEF.use_and_sell_buttons
function G.UIDEF.use_and_sell_buttons(card) --hook into buttons to add more button
  local ret = stupidfuckingbuttonref(card)
  if card.area and card.area == G.jokers and card.ability.set == 'Joker' then
     local transbutton = G.UIDEF.hpfx_transform_button(card)
     ret.nodes[1].nodes[2].nodes = ret.nodes[1].nodes[2].nodes or {}
     table.insert(ret.nodes[1].nodes[2].nodes, transbutton)
     return ret
  end
  return ret
end

local bcofcthereis = SMODS.four_fingers
function SMODS.four_fingers()
    if next(SMODS.find_card('j_hpfx_and_thumb')) then
        return 4
    end
    return bcofcthereis()
end

local whywouldnttherebe = SMODS.shortcut
function SMODS.shortcut()
    if next(SMODS.find_card('j_hpfx_secretway')) then
        return true
    end
    return whywouldnttherebe()
end