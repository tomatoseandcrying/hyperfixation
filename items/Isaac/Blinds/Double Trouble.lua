SMODS.Blind {
    key = 'double_trouble',
    discovered = true,
    pos = { x = 0, y = 0 },
    atlas = "IsaacBlinds",

    dollars = G and G.GAME and G.GAME.blind.dollars or 1,
    mult = G and G.GAME and G.GAME.blind.dollars or 1,
    debuff = G and G.GAME and G.GAME.blind.debuff or {},
    boss = { min = 1, max = 1000 },
    boss_colour = G and G.GAME and G.GAME.blind.boss_colour or HEX("FCB3EA"),
    loc_vars = function(self)
        local nayme, naymer
        if self.names and (#self.names >= 2) then
            nayme = namingMyShitSafely(self.names[1])
            naymer = namingMyShitSafely(self.names[2])
        else
            local notGlobal = rawget(_G, 'Hyperfixation')
            if notGlobal and notGlobal.hpfxDT_idx1 and notGlobal.hpfxDT_idx2 then
                nayme = namingMyShitSafely(notGlobal.hpfxDT_idx1.name or
                    (notGlobal.hpfxDT_idx1.names and notGlobal.hpfxDT_idx1.names[1]))
                naymer = namingMyShitSafely(notGlobal.hpfxDT_idx2.name or
                    (notGlobal.hpfxDT_idx2.names and notGlobal.hpfxDT_idx2.names[1]))
            else
                nayme, naymer = "???", "???"
            end
        end
        return { vars = { nayme .. " & " .. naymer } }
    end,
    calculate = function(self, blind, context)
        local H = Hyperfixation
        local b = G.GAME and G.GAME.blind
        if context.setting_blind and b and H.hpfxDT_idx1 and H.hpfxDT_idx2 then
            b:set_double_trouble_blind(H.hpfxDT_idx1, H.hpfxDT_idx2, false, true)
        end
    end
}
