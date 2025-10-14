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

--double trouble blind merging
local set = Blind.set_blind
function Blind:set_blind(blind, reset, silent)
    if not reset then
        self.names = blind and blind.names or nil
        self.boss_colour = blind and blind.boss_colour or nil
    end
    return set(self, blind, reset, silent)
end

local col = Blind.change_colour
function Blind:change_colour(blind_col)
    blind_col = blind_col or self.boss_colour or get_blind_main_colour(self.config.blind.key or '')
    return col(self, blind_col)
end

local orig_ease = ease_background_colour_blind
function ease_background_colour_blind(state, blind_override)
    local blind = blind_override or (G.GAME and G.GAME.blind)
    if blind and blind.boss_colour then
        ease_background_colour {
            new_colour = lighten(mix_colours(blind.boss_colour, G.C.BLACK, 0.3), 0.1),
            special_colour = blind.boss_colour,
            contrast = 2
        }
        return
    end
    return orig_ease(state, blind_override)
end

local extrachips = Blind.draw
function Blind:draw()
    if self.key == "bl_hpfx_double_trouble" and self.config.blind.positions[2] then
        --first icon
        self.children.animatedSprite:set_sprite_pos(self.config.blind.positions[1] or self.config.blind.pos or
            { x = 0, y = 0 })
        self.children.animatedSprite:draw_shader('dissolve', 0.1)
        self.children.animatedSprite:draw_shader('dissolve')
        --second icon
        local sprite2 = AnimatedSprite('blind_chips', 1)
        sprite2:set_sprite_pos(self.config.blind.positions[2])
        sprite2.VT.x = self.children.animatedSprite.VT.x + 0.5 -- Offset for visibility
        sprite2.VT.y = self.children.animatedSprite.VT.y
        sprite2:draw_shader('dissolve', 0.1)
        sprite2:draw_shader('dissolve')
    end
    return extrachips(self)
end
