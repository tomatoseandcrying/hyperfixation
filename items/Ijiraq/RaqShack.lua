assert(SMODS.load_file('items/Ijiraq/Jokers/Ijiraq.lua'))()
assert(SMODS.load_file('items/Ijiraq/Jokers/Costume.lua'))()
load_folder('items/Ijiraq/Jokers/Exceptions')

--Ijiraq Funcs

---Function used for Jokesters with custom transformation logic.
---@param card Card|table The card being transformed.
---@param context any Must be `context`. Use only within a Card's `calculate` context.
function hpfx_Transform(card, context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                for k, v in pairs(Hyperfixation.exceptions) do
                    if key == v then
                        key = k
                    end
                end
                table.insert(Hyperfixation.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            SMODS.calculate_context({ hpfx_raqeffect_check = true })
            return true
        end,
    }))
    return true
end

---Function used for Jokesters with no custom/automatic logic. You will not need to use this function.
---@param context any Must be `context`. Use only within a Card's `calculate` context.
function Card:Transfodd(context)
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if self.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = self.config.center.key
                for k, v in pairs(Hyperfixation.exceptions) do
                    if key == v then
                        key = k
                    end
                end
                table.insert(Hyperfixation.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self:flip()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self.config.center = G.P_CENTERS['j_hpfx_ijiraq']
            self:set_ability(self.config.center, true)
            play_sound("card1")
            self:juice_up(0.3, 0.3)
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = 'after',
        delay = 0.15,
        func = function()
            self.isIjiraq = nil
            self.visiblyIjiraq = nil
            self:flip()
            return true
        end
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            SMODS.calculate_context({ hpfx_raqeffect_check = true })
            return true
        end,
    }))
    return true
end

---Function used for transformation from a UI button
---@param e any Leave this as `e`, this is a G.FUNC, and they can't use `card`
function G.FUNCS.hpfx_Transbutt(e)
    local card = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0,
        func = function()
            if card.config.center.key ~= 'j_hpfx_ijiraq' then
                local key = card.config.center.key
                for k, v in pairs(Hyperfixation.exceptions) do
                    if key == v then
                        key = k
                    end
                end
                table.insert(Hyperfixation.raqeffects, key or G.GAME.current_round.fodder_card.jkey)
            end
            G.jokers:unhighlight_all()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:set_ability(G.P_CENTERS["j_hpfx_ijiraq"])
            play_sound("card1")
            card:juice_up(0.3, 0.3)
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            card:flip()
            return true
        end,
    }))
    G.E_MANAGER:add_event(Event({
        trigger = "after",
        delay = 0.15,
        func = function()
            SMODS.calculate_context({ hpfx_raqeffect_check = true })
            return true
        end,
    }))
    return true
end

---Function used to toggle Perkeo?'s targeting flag.
---@param e any Leave this as `e`, this is a G.FUNC, and they can't use `card`
function G.FUNCS.hpfx_Perktoggle(e)
    local _card = e.config.ref_table
    G.E_MANAGER:add_event(Event({
        trigger = "immediate",
        delay = 0.1,
        func = function()
            _card.ability.extra.toggle = not _card.ability.extra.toggle
            return true
        end,
    }))
end

---Function used to de-render the toggle button if shown on Ijiraq.
---@param e any Leave this as `e`, this is a G.FUNC, and they can't use `card`
function G.FUNCS.hpfx_Perkcheck(e)
    local _card = e.config.ref_table
    if _card.config.center.key == 'j_hpfx_ijiraq' then
        _card.children.toggle_button:remove()
        _card.children.toggle_button = nil
    end
end

---Modifies the weights of boosters in the Booster pool. (`G.P_CENTER_POOLS.Booster`)\
---made by me! ^ u ^
---@param booster_kind string|true Booster to be modified. Set to `true` to affect all boosters in pool
---@param new_weight number? New weight of booster(s). Leave unspecified or `nil` to reset to default
---@param override boolean? If `true`, will override the first shop's guaranteed Buffoon Pack
---\
---__examples:__\
---All Boosters except Buffoon Packs disabled:\
---`Card:set_booster_weight(true, 0)`\
---`Card:set_booster_weight('Buffoon')` <- within an event\
---\
---Standard Packs reenabled at original weight:\
---`Card:set_booster_weight('Standard')`\
---\
---All Buffoon Packs (including the guaranteed) disabled:\
---`Card:set_booster_weight('Buffoon', 0, true)`
function Card:set_booster_weight(booster_kind, new_weight, override)
    for _, booster in pairs(G.P_CENTER_POOLS.Booster or {}) do
        if Hyperfixation.og_boostweight[booster.kind] == nil then
            Hyperfixation.og_boostweight[booster.kind] = booster.weight
        end
        local boostertable = Hyperfixation.og_boostweight[booster.kind]
        if override == true then G.GAME.first_shop_buffoon = true end
        if booster_kind == true or booster.kind == booster_kind then
            if boostertable == nil then boostertable = booster.weight end
            if new_weight == nil then
                booster.weight = boostertable
            elseif type(new_weight) == "number" then
                if new_weight >= 0 then
                    booster.weight = new_weight
                else
                    booster.weight = boostertable
                end
            else
                print('invalid use of set_booster_weight')
            end
        end
    end
end

---Modifies the weights (rates) of card objects. (`G.GAME.` ? `_rate`)\
---made by me! ^ u ^
---@param card_kind 'joker'|'tarot'|'planet'|'spectral'|'playing'|true Cardtype to be modified. Set to `true` to affect all cardtypes
---@param new_rate number? New weight of cardtype(s). Leave unspecified or `nil` to reset to default
---\
---__examples:__\
---Jokers don't appear, weight of Planets becomes 10:\
---`Card:set_card_rate('joker', 0)`\
---`Card:set_card_rate('planet', 10)` <- within an event
function Card:set_card_rate(card_kind, new_rate)
    local rate_map = {
        joker = "joker_rate",
        tarot = "tarot_rate",
        planet = "planet_rate",
        spectral = "spectral_rate",
        playing = "playing_card_rate"
    }
    if not G or not G.GAME then return end
    for rcard, rate in pairs(rate_map) do
        if card_kind == true or card_kind == rcard then
            if Hyperfixation.og_cardrate[rcard] == nil then
                Hyperfixation.og_cardrate[rcard] = G.GAME[rate]
            end
            if new_rate == nil then
                if type(Hyperfixation.og_cardrate[rcard]) == "number" then
                    G.GAME[rate] = Hyperfixation.og_cardrate[rcard]
                end
            elseif type(new_rate) == "number" then
                if new_rate >= 0 then
                    G.GAME[rate] = new_rate
                else
                    if type(Hyperfixation.og_cardrate[rcard]) == "number" then
                        G.GAME[rate] = Hyperfixation.og_cardrate[rcard]
                    end
                end
            end
        end
    end
end

---Rounds a number to the nearest multiple of another number.
---@param thingwearerounding any The number you want to round.
---@param tothemultipleof any The multiple you want to round to. Defaults to 1 if not provided.
function roundmyshitprettyplease(thingwearerounding, tothemultipleof)
    local getdivided = thingwearerounding / (tothemultipleof or 1)
    local getrounded = tothemultipleof * math.floor(getdivided)
    return getrounded
end
