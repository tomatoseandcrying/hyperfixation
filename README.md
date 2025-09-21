#### Please report any issues here, or in my mod's [thread](https://discord.com/channels/1116389027176787968/1335324781528092672) in the Balatro Discord. Alternatively, report them as a tester in the mod's [official server](https://discord.gg/QwJtrdy4xS). Thank you for playing, and please enjoy...

<p align="center"><img width="568" height="400" alt="hyperfixation logo" src="https://github.com/user-attachments/assets/d03466b2-eb50-414e-bb8a-84dad4a61756" />
<p align="center">a content-ish mod.



## Patches:
### <ins>state_events.lua</ins>

__G.FUNCS.evaluate_play(e)__
- Mary's unlock condition
- calc_dollar_bonus Jokester transformations
- Ijiraq mimicking Splash

__G.FUNCS.discard_cards_from_highlighted(e, hook)__
- custom post-discard context

### <ins>card.lua</ins>

__Card:save()__
- adding self properties to vars


__Card:load()__
- cardTable conversion

__Card:open()__
- pack content manipulation (Astronomer?)


### <ins>common_events.lua</ins>

__eval_card(card, context)__
- storing and merging of Ijiraq's effect table

__generate_card_ui(\_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)__
- automatic Jokester descriptions

## Overrides:
### <ins>Game:init_game_object()</ins>

__The Binding of Isaac__
- Farmer's unlock condition

__Inscryption__
- automatic run seeding

__4Fun__
- Chud Joker's unlock condition

### <ins>Game:start_run(args)</ins>

__Inscryption__
- Card:set_card_rate(card_kind, new_rate)

### <ins>Blind:defeat(silent)</ins>

__The Binding of Isaac__
- Cyanosis' unlock condition

### <ins>Card:calculate_joker(context)</ins>

__Inscryption__
- automatic transformations (disguised)
- automatic animations (disguised)

### <ins>SMODS.pseudorandom_probability(trigger_obj, seed, base_numerator, base_denominator, identifier)</ins>

__The Binding of Isaac__
- Farmer's unlock condition

### <ins>win_game()</ins>

__4Fun__
- Space Needle's unlock condition
- No Bitches?' unlock condition

### <ins>ease_hands_played(mod, instant)</ins>

__Inscryption__
- custom hand change context

### <ins>ease_discard(mod, instant, silent)</ins>

__Inscryption__
- custom dollar change context

### <ins>Card:update(dt)</ins>

__Inscryption__
- Blueprint?'s transformation

### <ins>SMODS.current_mod.reset_game_globals(run_start)</ins>

__Inscryption__
- automatic run seeding
- Egg?'s effect

__4Fun__
- No Bitches?' unlock condition

### <ins>generate_card_ui(\_c, full_UI_table, specific_vars, card_type, badges, hide_desc, main_start, main_end, card)</ins>

__Inscryption__
- automatic Jokester descriptions

### <ins>Card:add_to_deck(from_debuff)</ins>

__The Binding of Isaac__
- Moriah's unlock condition

__Inscryption__
- automatic sticker application

### <ins>Card:set_cost()</ins>

__Inscryption__
- Astronomer?'s effect
- Ijiraq's Astronomer effect

### <ins>SMODS.four_fingers()</ins>

__Inscryption__
- Four Fingers?

### <ins>SMODS.shortcut()</ins>

__Inscryption__
- Shortcut?

### <ins>G.UIDEF.use_and_sell_buttons(card)</ins>

__Inscryption__
- Perkeo?'s button rendering

### <ins>Card:highlight(is_higlighted)</ins>

__Inscryption__
- Perkeo?'s button rendering

### <ins>get_new_boss()</ins>

__Inscryption__
- Pareidolia?'s effect

### <ins>Game:update(dt)</ins>

__4Fun__
- No Bitches?' effect

### <ins>love.draw()</ins>

__4Fun__
- No Bitches?' effect
