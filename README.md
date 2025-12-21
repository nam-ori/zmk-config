# ZMK firmware for TOTEM keyboard in BLE no-dongle mode, with Ergo-L layout

## Goals
My 1st attempt to build a firmware with zmk, for a TOTEM split keyboard (38 keys), wireless BLE, without dongle for now.

Key mapping will be Ergo-L (keyboard pressed) to French layout (gotten by computer/OS), with HRM.

## How-to - OS layout question
My goal was to get a working keyboard on both Linux and Windows. My first toughts were to use AZERTY legacy for the main letters; and AZERTY alt. for Linux (the most used layout on Linux in France) and ALT+unicode values for Windows, as separate keyboard layers maybe?

Since Windows 11 24H2, Windows is providing "AZERTY AFNOR" layout; most Linux distros are providing it to. The simplier the better: I will try to create a mapping to that layout, which would then work for both systems. Since most systems are still in AZERTY legacy or AZERTY alt., I plan to use a AZERTY alt. for the default layer and a unified layer as a second layer. So it will work fine by default (at best of each system - excluding some characters on AZERTY legacy - like æ or œ and upper accents like É), and can be easily improved with the second layer when needed.

_Warning:_ I do not aim to apply extensively the AFNOR-distributed layout. First of all, this layout is not open, and I do not have access to it. And second of all, my aim is only to provide characters mapping for those included in Ergo-L layout. The dead keys, managed by the OS, could give access to all of AFNOR layout mappings if the OS respect the AFNOR standard; I cannot and will not garanty that. I only comply to the observed behavior without any engineering.

I will not use the Ergo-L OS layout even for systems with it available; it would add complexity (having to deal with 2 totally different layouts), and probably mess with some ZMK behaviors.

## Steps forward

- getting a firmware working on a TOTEM keyboard, only in order to test the process and the keyboard itself (firmware generated, still waiting for my keyboard to test it!)
- tidy the repo to empty any file from a repo without license information, add licence information on this one
- Ergo-L main layers for "AZERTY AFNOR" layout (with joelspadin/zmk-locales repo, need for adaptation?)
- Ergo-L main layers for "AZERTY alt." layout on default layer, moving the last one on a secondary layer
- adjusting for best usage (behaviors, macros…)

Don't use this repos for now! It will change a lot in the next weeks.
