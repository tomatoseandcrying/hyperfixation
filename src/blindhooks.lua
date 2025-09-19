--blue baby unlock
local bdf = Blind.defeat
function Blind:defeat(silent)
    if self.name == 'Crimson Heart' then
        G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount + 1
        if G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount >= 10 then
            check_for_unlock({ type = 'hpfx_momheart' })
            G.PROFILES[G.SETTINGS.profile].hpfx_crimsonCount = 0
        end
    end
    return bdf(self, silent)
end

--pareidolia? trolling (thanks Finity)
local boss = get_new_boss
function get_new_boss()
    local ret = boss()
    if next(SMODS.find_card('j_hpfx_apophenia')) then
        if G.GAME.round_resets.ante % G.GAME.win_ante ~= 0 then
            ret = "bl_plant"
        end
    end
    return ret
end

G.GAME.blind.effect {}
