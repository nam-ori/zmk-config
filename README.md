# ZMK firmware for TOTEM keyboard in BLE no-dongle mode, with Ergo-L layout

## Goals

My 1st attempt to build a firmware with zmk, for a TOTEM split keyboard (38 keys), wireless BLE, without dongle for now.

Key mapping will be (1) transparent Ergo-L and (2) Ergo-L (keyboard pressed) to French layout (gotten by computer/OS), with HRM.


## How-to - OS layout question

My goal was to get a working keyboard on both Linux and Windows. My first toughts were to use AZERTY legacy for the main letters; and AZERTY alt. for Linux (the most used layout on Linux in France) and ALT+unicode values for Windows, as separate keyboard layers maybe?

Since Windows 11 24H2, Windows is providing "AZERTY AFNOR" layout; most Linux distros are providing it to. The simplier the better: I created a mapping to that layout, which would then work for both systems. It is accessible by the LB 2-3-4 combo.

_*Warning:*_ I do not aim to apply extensively the AFNOR-distributed layout. First of all, this layout is not open, and I do not have access to it. And second of all, my aim is only to provide characters mapping for those included in Ergo-L layout. The dead keys, managed by the OS, could give access to all of AFNOR layout mappings if the OS respect the AFNOR standard; I cannot and will not garanty that. I only comply to the observed behavior without any engineering.

I use the Ergo-L OS layout by default. Qwerty will be inaccurate on NUM layer.


## Steps forward

- [done] getting a firmware working on a TOTEM keyboard, only in order to test the process and the keyboard itself
- [done] Ergo-L main layers for "AZERTY AFNOR" layout (note: except ALT/SYM on NUM layer)
- [done] Ergo-L main layers for "Ergo-L" layout on default layer, moving the last one on a secondary layer
- [in progress] adjusting for best usage (behaviors, macros…)
- [to do] tidy the repo (unused behaviors, better naming…)

This repos is based on many similar others. I won’t guaranty any paternity.


## Layers

Drawings hereafter are made with [keymap-drawer](https://keymap-drawer.streamlit.app/) by [caksoylar](https://github.com/caksoylar). Here are the [drawings keymap and settings](/keymap-drawer/) used to generate them.

### Ergo-L - \[ERL] and \[ERG]

- \[ERL], or `ErgolBase`, is the default and is mapped to Ergo-L (no emulation).
- \[ERG], or `ErgolAz`, is activated with a 3-finger combo, usually once at startup, and Ergo-L is emulated here with a mapping to "Français (AZERTY, AFNOR)" (Linux) / "Français (Standard, AZERTY)" (Windows).

![Ergo-L base layer, all chars like in the official layout, on a TOTEM keyboard physical layout](/docs/images/my_keymap_ergol_base.png)

Texts at the bottom of the keys are the result of a hold action, if different.

Left thumb can do, from right to left:
- on tap: backspace, or delete with shift (symetrical); on hold: shift (which is also on HRM)
- on tap: enter (return); on hold: temporary activate the num layer (symetrical)
- on tap: backspace, or delete with shift; on hold: shift (which is also on HRM)

Right thumb can do, from left to right:
- on tap: backspace, or delete with shift (which is also present at the same place on the right thumb); no hold action here, so one can multi-tap backspace by holding (I know, it’s bad)
- on tap: space, or narrow no-break space with shif (as in Ergo-L layout); on hold: temporary activate the num layer (symetrical)
- on tap: tab, or right alt (AltGr); on hold: right alt (AltGr) (with AZERTY mapping: here is the real one, not the emulated one; emulated Ergo-L layout AltGr is the SYM layer accessible from HRM)

*Note:* the temporary hold actions on the thumbs can be toggled in combo with the extra pinky buttons. Those buttons do control on the left hand and left alt (Alt) on the right hand, without combo.


### Nav-Num - \[ERL] and \[ERG]

- \[NUM], or `NavNumBase`, from \[ERL], mapped to Ergo-L
- \[NUA], or `NavNumAz`, from \[ERG], mapped to AZERTY

![Nav-Num layer](/docs/images/my_keymap_num.png)

Nav is on the left hand and num on the right one, same layer.


### AltGr Symbols - \[SYM]

- \[SYM], or `Symbols`, from \[ERG], mapped to AZERTY

![AltGr Symbols layer, all chars like in the AltGr layer from the official layout](/docs/images/my_keymap_ergol_altgr.png)


### OneDeadKey - \[EAC]

- \[EAC], or `ErgAzAcc`, from \[ERG], mapped to AZERTY

![OneDeadKey layer, all chars like in the OneDeadKey layer from the official layout, with mainly accentuated characters](/docs/images/my_keymap_ergol_1dk.png)


### Function - \[FCT]

- \[FCT], or `Function`, from \[ERL] and \[ERG]

![Function layer: bluetooth actions on the left, function keys (`fn`) on the right, sound and brightness settings in the middle](/docs/images/my_keymap_fct.png)


### Game - \[GAM]

- \[GAM], or `Game`, from \[ERL] and \[ERG]

![Game layer: AZERTY left hand moved one column to the right, so that tab, shift and control are placed in the pinky column; numbers and function keys (`fn`) on the right hand; thumb keys are different from other layers](/docs/images/my_keymap_game.png)


### Combos

![Lots of combos with two or three fingers; I will detail them as soon as they are stabilized](/docs/images/my_keymap_combos.png)
