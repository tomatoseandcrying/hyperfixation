--list of debug functions

function rendercheck(txt) --Test text printing here
    attention_text({
        text = txt,
        scale = 1.3,
        hold = 1.4,
        major = aura_card,
        backdrop_colour = G.C.RARITY[4],
        align = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and 'tm' or 'cm',
        offset = { x = 0, y = (G.STATE == G.STATES.TAROT_PACK or G.STATE == G.STATES.SPECTRAL_PACK) and -0.2 or 0 },
        silent = true
    })
end

function porctest() --Turns your entire deck into Stone cards
    for _, card in ipairs(G.playing_cards) do
        card:set_ability(G.P_CENTERS.m_stone)
    end
end

function cyanunlock(count) --Manually set the number of times Crimson Heart was defeated
    G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = count
end

function guh() --Convert the Joker you're hovering over into its Jokester variant
    local selected = G.CONTROLLER and
        (G.CONTROLLER.focused.target or G.CONTROLLER.hovering.target)
    if Hyperfixation.brokejokes[selected.config.center.key] then return print('This one\'s disabled until I can fix it!') end
    G.GAME.current_round.fodder_card.jkey = selected.config.center.key
    if JokerDisplay then
        selected:joker_display_remove()
    end
    selected:set_ability('j_hpfx_costume')
end

function guh2() -- just put the key in the table bro (inserts the hovered Joker's key into Ijiraq's effects table directly)
    local selected = G.CONTROLLER and
        (G.CONTROLLER.focused.target or G.CONTROLLER.hovering.target)
    if Hyperfixation.brokejokes[selected.config.center.key] then return print('This one\'s disabled until I can fix it!') end
    table.insert(Hyperfixation.raqeffects, selected.config.center.key)
end

function heold() --Test function to simulate the Ejimbo game over
    SMODS.add_card
    {
        set = 'Joker',
        stickers = { 'eternal' },
        key = 'j_joker',
        force_stickers = { 'eternal' }
    }
    G.STATE = G.STATES.GAME_OVER
    if not G.GAME.won and not G.GAME.seeded and not G.GAME.challenge then
        G.PROFILES[G.SETTINGS.profile].high_scores.current_streak.amt = 0
    end
    G:save_settings()
    G.FILE_HANDLER.force = true
    G.STATE_COMPLETE = false
end

function bitchslap() --Destroys all Queens in your deck
    for _, c in ipairs(G.playing_cards) do
        if c:get_id() == 12 then
            SMODS.destroy_cards(c, true, true, true)
        end
    end
end

function doubletrouble() --Prints the hpfx_idx keys for Double Trouble blind
    print("Double Trouble keys: " .. Hyperfixation.hpfxDT_idx1.key .. " and " .. Hyperfixation.hpfxDT_idx2.key)
end

debugs_one_line_long = { --other debug commands that just go into the console
    "eval Hyperfixation.raqeffects",
    -- prints all current effects Ijiraq has stored
    "eval Hyperfixation.exceptions",
    -- prints the current table of Jokesters with custom transformation logic
    "eval Hyperfixation.calcdollarjokesters",
    -- prints the current table of Jokesters that calculate dollar bonuses
    "eval G.jokers.cards[1].config.center.key",
    -- checks the first joker's key
    "eval G.GAME.current_round.fodder_card.jkey",
    -- checks the stored key of the fodder card
    "eval Hyperfixation.trig"
    -- prints current effects ijiraq has stored from add_to_deck. prevents effect resets if a different Ijiraq is removed
}
