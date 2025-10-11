-- Mixes the 2 hex colors
local function hpfx_chexMix(hex1, hex2)
    local function hpfx_cathodeScreens(hex)
        hex = hex:gsub("#", "")
        return tonumber("0x" .. hex:sub(1, 2)),
            tonumber("0x" .. hex:sub(3, 4)),
            tonumber("0x" .. hex:sub(5, 6))
    end

    local function hpfx_cathodeScreams(r, g, b)
        return string.format("#%02X%02X%02X", r, g, b)
    end

    local r1, g1, b1 = hpfx_cathodeScreens(hex1)
    local r2, g2, b2 = hpfx_cathodeScreens(hex2)

    local r = math.floor((r1 + r2) / 2)
    local g = math.floor((g1 + g2) / 2)
    local b = math.floor((b1 + b2) / 2)

    return hpfx_cathodeScreams(r, g, b)
end
-- Merges two tables
local function hpfx_dudeThisTableKicksAss(t1, t2)
    local merged = {}
    for _, v in ipairs(t1) do
        table.insert(merged, v)
    end
    for _, v in ipairs(t2) do
        table.insert(merged, v)
    end
    return merged
end
SMODS.Blind {
    key = 'double_trouble',
    discovered = true, --Change to FALSE when completed
    dollars = (G.GAME.hpfxDT_idx1.dollars + G.GAME.hpfxDT_idx2.dollars / 2) or 1,
    mult = (G.GAME.hpfxDT_idx1.mult + G.GAME.hpfxDT_idx2.mult / 2) or 1,
    boss_colour = HEX(hpfx_chexMix(G.GAME.hpfxDT_idx1.boss_colour, G.GAME.hpfxDT_idx2.boss_colour)),
    debuff = hpfx_dudeThisTableKicksAss(G.GAME.hpfxDT_idx1.debuff or {}, G.GAME.hpfxDT_idx2.debuff or {}),
    pos = { x = 0, y = 0 },
    boss = {
        min = (G.GAME.hpfxDT_idx1.boss.min + G.GAME.hpfxDT_idx2.boss.min / 2) or 1,
        max = (G.GAME.hpfxDT_idx1.boss.max + G.GAME.hpfxDT_idx2.boss.max / 2) or 10,
    },

}
