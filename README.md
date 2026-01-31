# ZMK firmware for TOTEM keyboard in BLE no-dongle mode, with Ergo-L layout

## Goals
My 1st attempt to build a firmware with zmk, for a TOTEM split keyboard (38 keys), wireless BLE, without dongle for now.

Key mapping will be (1) transparent Ergo-L and (2) Ergo-L (keyboard pressed) to French layout (gotten by computer/OS), with HRM.

## How-to - OS layout question
My goal was to get a working keyboard on both Linux and Windows. My first toughts were to use AZERTY legacy for the main letters; and AZERTY alt. for Linux (the most used layout on Linux in France) and ALT+unicode values for Windows, as separate keyboard layers maybe?

Since Windows 11 24H2, Windows is providing "AZERTY AFNOR" layout; most Linux distros are providing it to. The simplier the better: I created a mapping to that layout, which would then work for both systems. It is accessible by the LB 2-3-4 combo.

_Warning:_ I do not aim to apply extensively the AFNOR-distributed layout. First of all, this layout is not open, and I do not have access to it. And second of all, my aim is only to provide characters mapping for those included in Ergo-L layout. The dead keys, managed by the OS, could give access to all of AFNOR layout mappings if the OS respect the AFNOR standard; I cannot and will not garanty that. I only comply to the observed behavior without any engineering.

I use the Ergo-L OS layout by default. Qwerty will be inaccurate on NUM layer.

## Steps forward

- [done] getting a firmware working on a TOTEM keyboard, only in order to test the process and the keyboard itself
- [done] Ergo-L main layers for "AZERTY AFNOR" layout (note: except ALT/SYM on NUM layer)
- [done] Ergo-L main layers for "Ergo-L" layout on default layer, moving the last one on a secondary layer
- [in progress] adjusting for best usage (behaviors, macros…)
- [to do] tidy the repo (unused behaviors, better naming…)

This repos is based on many similar others. I won’t guaranty any paternity.
