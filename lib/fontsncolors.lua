--Font Libraries
SMODS.Font({
    key = "roboto",
    path = "Roboto-Regular.ttf",
    render_scale = 450,
    TEXT_HEIGHT_SCALE = 0.5,
    TEXT_OFFSET = { x = 0, y = 0 },
    FONTSCALE = 0.12,
    squish = 1,
    DESCSCALE = 1,
    class_prefix = "hpfx_"
})
SMODS.Font({
    key = "ascii",
    path = "SawarabiMincho-Regular.ttf",
    render_scale = 200,
    TEXT_HEIGHT_SCALE = 0.5,
    TEXT_OFFSET = { x = 0, y = 0 },
    FONTSCALE = 0.07,
    squish = 1,
    DESCSCALE = 1,
    class_prefix = "hpfx_"
})

--Custom Colors
loc_colour('red')
--ijiraq
G.ARGS.LOC_COLOURS['hpfx_IjiGray'] = HEX("BFD7D5")
--unlock conditions
G.ARGS.LOC_COLOURS['hpfx_inPURPLE'] = HEX("B1A1C0")
G.ARGS.LOC_COLOURS['hpfx_inattention'] = HEX("ECB96D")
G.ARGS.LOC_COLOURS['hpfx_multiball'] = HEX("EC9C96")
G.ARGS.LOC_COLOURS['hpfx_bossmute'] = HEX("C78F85")
--other
G.ARGS.LOC_COLOURS['hpfx_oldgreen'] = HEX("009900")
G.ARGS.LOC_COLOURS['hpfx_black'] = HEX("000000")
