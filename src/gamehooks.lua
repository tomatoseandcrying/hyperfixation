--new run vars
local igo = Game.init_game_object
function Game:init_game_object()
    local ret = igo(self)
    ret.current_round.fodder_card = { jkey = 'j_joker' }
    ret.wheel_fails = 0
    ret.hpfx_nothingEverHappens = true
    return ret
end

--set_card_rate() storing
local cardRateStoring = Game.start_run
function Game:start_run(args)
    local ret = cardRateStoring(self, args)
    Hyperfixation.og_cardrate = Hyperfixation.og_cardrate or {}
    Hyperfixation.daggercheck = Hyperfixation.daggercheck or {}
    return ret
end

--funny image shit i stole from Yahimod
local upd = Game.update
function Game:update(dt)
    upd(self, dt)

    -- tick based events
    if Hyperfixation.ticks == nil then Hyperfixation.ticks = 0 end
    if Hyperfixation.dtcounter == nil then Hyperfixation.dtcounter = 0 end
    Hyperfixation.dtcounter = Hyperfixation.dtcounter + dt
    Hyperfixation.dt = dt

    while Hyperfixation.dtcounter >= 0.010 do
        Hyperfixation.ticks = Hyperfixation.ticks + 1
        Hyperfixation.dtcounter = Hyperfixation.dtcounter - 0.010
        if G.shobitches and G.shobitches > 0 then G.shobitches = G.shobitches - 1 end
    end
end

--win unlocks
local needleUnlockCon = win_game
function win_game()
    local ret = needleUnlockCon()
    local _handname, _played = 'High Card', -1
    for hand_key, hand in pairs(G.GAME.hands) do
        if hand.played > _played then
            _played = hand.played
            _handname = hand_key
        end
    end
    local most_played = _handname
    local handd = G.GAME.hands[most_played]
    if handd.level == 1 and most_played ~= 'None' then
        if handd.played ~= nil and handd.played >= 1 then
            check_for_unlock({ type = 'hpfx_needle' })
        end
    end
    return ret
end

local bitchlessUnlockCon = win_game
function win_game()
    local ret = bitchlessUnlockCon()
    if G.PROFILES[G.SETTINGS.profile].hpfx_bitch == false then
        check_for_unlock({ type = 'hpfx_no_bitches' })
    end
    return ret
end

--jokester translogic
function SMODS.current_mod.reset_game_globals(run_start)
    for _, card in ipairs(G.jokers.cards) do
        if card.isIjiraq or
            Hyperfixation.exceptions[G.GAME.current_round.fodder_card.jkey] and
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
end

function SMODS.current_mod.reset_game_globals(run_start)
    if run_start or G.GAME.round_resets.blind_states.Boss == "Defeated" then
        -- Joker pool logic
        local ijiraq_pool = get_current_pool("Joker")
        local filtered_pool = {}
        for _, key in ipairs(ijiraq_pool) do
            if not Hyperfixation.brokejokes[key] then
                table.insert(filtered_pool, key)
            end
        end
        local jokester = pseudorandom_element(filtered_pool, pseudoseed('ijiraq'))
        ---@diagnostic disable-next-line: cast-local-type
        if jokester and jokester == 'UNAVAILABLE' then jokester = 'j_joker' end
        G.GAME.current_round.fodder_card.jkey = jokester or 'j_joker'
        --Double Trouble
        local forbidden_keys = { "bl_hpfx_double_trouble", "bl_big", "bl_small" }

        local function is_forbidden(blind)
            return blind.key and Hyperfixation.table.contains(forbidden_keys, blind.key)
        end

        local idx1, idx2
        repeat
            idx1 = pseudorandom_element(G.P_BLINDS, "hpfx_double_trouble")
        until idx1 and not is_forbidden(idx1)

        repeat
            idx2 = pseudorandom_element(G.P_BLINDS, "hpfx_double_trouble_2")
        until idx2 and idx2 ~= idx1 and not is_forbidden(idx2)

        Hyperfixation.hpfxDT_idx1 = idx1
        Hyperfixation.hpfxDT_idx2 = idx2
        if run_start then
            -- Ijiraq
            Hyperfixation.raqeffects = {}
            Hyperfixation.trig = {}
            -- Egg?
            local chick = pseudorandom('hpfxchicken', 3, 123456789)
            Hyperfixation.nugget = roundmyshitprettyplease(chick, 3)
            -- No Bitches
            local bitchxl = 0
            G.PROFILES[G.SETTINGS.profile].hpfx_bitch = false
            for _, playing_card in ipairs(G.playing_cards) do
                if playing_card:get_id() == 12 then
                    bitchxl = bitchxl + 1
                end
            end
            Hyperfixation.bitchXM = bitchxl
        end
    end
end
