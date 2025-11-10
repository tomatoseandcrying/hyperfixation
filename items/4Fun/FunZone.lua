--JimboQuip
SMODS.JimboQuip({
    key = 'hpfx_eternal_jimbo',
    type = 'loss',
    extra = {
        center = 'j_hpfx_eternimbo',
        times = 5,
        pitch = 0.6,
        juice = { 0.3, 0.7 },
        delay = 0.25,
        particle_colours = {
            G.C.MULT,
            G.C.CHIPS,
            G.C.GOLD
        },
        materialize_colours = {
            G.C.MULT,
            G.C.CHIPS,
            G.C.GOLD
        },
    },

    filter = function(self, type)
        for _, v in ipairs(SMODS.find_card('j_joker', true)) do
            if v.ability.eternal then
                hpfx_jEternal = true
                break
            else
                hpfx_jEternal = false
            end
        end
        if hpfx_jEternal then
            self.extra.text_key = self.key .. pseudorandom('ejimbo', 1, 4)
            if self.extra.text_key == self.key .. 4 then
                self.extra.pitch = 0.6
                self.extra.times = 3
                self.extra.delay = 0.5
                hpfx_jOldternal = true
            else
                hpfx_jOldternal = false
            end
            return true, { weight = 100000000 }
        end
    end,
    play_sounds = function(self, times)
        if hpfx_jOldternal then
            self.hpfxvoxcount = (self.hpfxvoxcount or 0) + 1
            if self.hpfxvoxcount == 1 then
                play_sound('hpfx_voice1', 1, 1)
                G.gyahaha = 1
            else
                SMODS.Sound:create_stop_sound('voice1', 1)
                play_sound('voice1', 0.6, 0)
            end
            if self.hpfxvoxcount >= 3 then
                self.hpfxvoxcount = 0 -- resets after third call
            end
        else
            play_sound('voice1', 0.6, 1)
        end
    end
})
