My 1st attempt to build a firmware with zmk, for a TOTEM split keyboard (38 keys), wireless BLE, without dongle for now.

Key mapping will be Ergo-L (keyboard pressed) to French layout (gotten by computer/OS), with HRM. Ideally, working on both Linux (with Fr-alt layout) and Windows (with Fr layout and alt+unicode macros).

Steps forward:
- getting a firmware working on a TOTEM keyboard
- Ergo-L main layers for Fr layout, excluding absent upper characters in that layout (Ç, É, etc.) (with joelspadin/zmk-locales repos)
- Ergo-L main layers for Fr-alt layout
- Ergo-L main layers for Fr layout on Windows (with urob/zmk-unicode repos)
- adjusting for best usage

Don't use this repos for now! It will change a lot in the next weeks.
