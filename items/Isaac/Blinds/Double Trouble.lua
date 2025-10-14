-- Mixes the 2 hex colors
local function hpfx_chexMix(hex1, hex2)
    -- make sure they're good
    local function valid_hex(s)
        return type(s) == "string" and s:match("^#?%x%x%x%x%x%x$")
    end
    if not valid_hex(hex1) then hex1 = "#FCB3EA" end
    if not valid_hex(hex2) then hex2 = "#FCB3EA" end

    local function hpfx_cathodeScreens(hex)
        hex = hex:gsub("#", "")
        -- 0 padding
        hex = hex .. string.rep("0", 6 - #hex)
        local r = tonumber("0x" .. hex:sub(1, 2)) or 0
        local g = tonumber("0x" .. hex:sub(3, 4)) or 0
        local b = tonumber("0x" .. hex:sub(5, 6)) or 0
        return r, g, b
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
    for k, v in pairs(t1) do merged[k] = v end
    for k, v in pairs(t2) do merged[k] = v end
    return merged
end
--hex grabber
local function get_hex_string(col)
    if type(col) == "string" and col:match("^#?%x%x%x%x%x%x$") then
        return col:sub(1, 1) == "#" and col or "#" .. col
    end
    if type(col) == "table" and col.hex and type(col.hex) == "string" and col.hex:match("^#?%x%x%x%x%x%x$") then
        return col.hex:sub(1, 1) == "#" and col.hex or "#" .. col.hex
    end
    return "#FCB3EA"
end

SMODS.Blind {
    key = 'double_trouble',
    discovered = true,
    pos = { x = 0, y = 0 },
    dollars = (Hyperfixation.hpfxDT_idx1.dollars or 0) + (Hyperfixation.hpfxDT_idx2.dollars or 0),
    mult = (Hyperfixation.hpfxDT_idx1.mult or 0) + (Hyperfixation.hpfxDT_idx2.mult or 0),
    debuff = hpfx_dudeThisTableKicksAss(Hyperfixation.hpfxDT_idx1.debuff or {}, Hyperfixation.hpfxDT_idx2.debuff or {}),
    boss = hpfx_dudeThisTableKicksAss(Hyperfixation.hpfxDT_idx1.boss or {}, Hyperfixation.hpfxDT_idx2.boss or {}),
    boss_colour = HEX(
        hpfx_chexMix(
            get_hex_string(Hyperfixation.hpfxDT_idx1.boss_colour),
            get_hex_string(Hyperfixation.hpfxDT_idx2.boss_colour)
        ):gsub("#", "")
    ),
}
