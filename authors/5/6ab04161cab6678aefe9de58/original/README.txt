Quintessence -- a Linux x86-64 keygenme
=======================================

Run:  ./quintessence

Goal: find a valid serial for your name. Every name has exactly one valid
serial (format: XXXX-XXXX-XXXX-XXXX, hexadecimal, dashes optional,
case-insensitive). A keygen is the intended solution and earns the most
respect; posting a single working name/serial pair also counts.

Rules: patching is not a solution -- the success message only decrypts
correctly with the right serial, and tampering with the binary is detected.
Debugging tools are fair game, but a running debugger will always yield
"Invalid serial" (by design; the process never crashes or misbehaves
otherwise). Emulation is allowed and encouraged for the stubborn.

Everything is deterministic: no timing races, no environment-dependent
behavior, no network. Static x86-64 ELF, no dependencies.

Good luck, and have fun.
