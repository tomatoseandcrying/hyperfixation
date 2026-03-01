SMODS.ConsumableType({
    key = 'hpfx_inscr_act1_items',
    primary_colour = HEX('F97717'),
    secondary_colour = G.C.BLACK,
    collection_rows = { 6, 6 },
    shop_rate = 0.3,
    text_colour = G.C.hpfx_LeshyOrange or HEX("F97717"),
    select_card = 'consumeables',
    loc_txt = {
        name = 'Leshy\'s Cabin',
        collection = 'Leshy\'s Cabin',
        undiscovered = {
            name = '???',
            text = { '{C:hpfx_LeshyOrange}\"You cannot use that now.\"{}' },
        }
    },
})
HPFX_load_folder('items/Inscryption/Consumables/Custom/Acts')
