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
--hex grabber with rgb handling
local function get_hex_string(col)
    if type(col) == "string" and col:match("^#?%x%x%x%x%x%x$") then
        return col:sub(1, 1) == "#" and col or "#" .. col
    end
    if type(col) == "table" and col.hex and type(col.hex) == "string" and col.hex:match("^#?%x%x%x%x%x%x$") then
        return col.hex:sub(1, 1) == "#" and col.hex or "#" .. col.hex
    end
    -- Handle RGB
    if type(col) == "table" and #col >= 3 then
        local r = math.floor((col[1] or 0) * 255)
        local g = math.floor((col[2] or 0) * 255)
        local b = math.floor((col[3] or 0) * 255)
        return string.format("#%02X%02X%02X", r, g, b)
    end
    return "#FCB3EA"
end

-- merges properties of two blind tables, Blind:set_blind tweak made to handle the merging
---@param idx1 SMODS.Blind|table First blind to merge
---@param idx2 SMODS.Blind|table Second blind to merge
---@param reset boolean If true, resets blind effects before applying new blind
---@param silent boolean If true, suppresses notifs
function Blind:set_double_trouble_blind(idx1, idx2, reset, silent)
    local merged_blind = {
        name = "Double Trouble",
        names = { idx1.name, idx2.name },
        dollars = (idx1.dollars or 0) + (idx2.dollars or 0),
        mult = (idx1.mult or 0) + (idx2.mult or 0),
        debuff = {},
        pos = idx1.pos or idx2.pos,
        boss = (idx1.boss or false) or (idx2.boss or false),
        boss_colour = hpfx_chexMix(
            get_hex_string(idx1.boss_colour),
            get_hex_string(idx2.boss_colour)
        ),
    }
    -- Merge the blind debuff tables
    for k, v in pairs(idx1.debuff or {}) do merged_blind.debuff[k] = v end
    for k, v in pairs(idx2.debuff or {}) do merged_blind.debuff[k] = v end
    -- Merge the boss blind ante table
    if idx1.boss and idx2.boss then
        merged_blind.boss = {
            min = (idx1.boss.min or 1) + (idx2.boss.min or 1),
            max = (idx1.boss.max or 10) + (idx2.boss.max or 10),
        }
    end
    -- sets itself to merged version of blind
    self:set_blind(merged_blind, reset, silent)
end

SMODS.Blind {
    key = 'double_trouble',
    discovered = true,
    pos = { x = 0, y = 0 },
    dollars = math.random(1, 20),
    mult = math.random(1, 100),
    debuff = {},
    boss = { min = 1, max = 10 },
    boss_colour = HEX("FCB3EA"),
    calculate = function(self, blind, context)
        local H = Hyperfixation
        local b = G.GAME and G.GAME.blind
        if context.setting_blind and b and H.hpfxDT_idx1 and H.hpfxDT_idx2 then
            b:set_double_trouble_blind(H.hpfxDT_idx1, H.hpfxDT_idx2, false, true)
        end
    end
}
