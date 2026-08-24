# Orrery

Five planets drift across a grid nobody can look at directly. Your telescope only
sends out probes: they come back absorbed, reflected, or they surface somewhere
else entirely. Work out the sky from the echoes alone.

```
orrery                       # telescope survey
orrery <name> <serial>       # validate a serial
```

## Windows

`orrery.exe`, 64-bit, statically linked — no runtime to install. Run it from a
terminal, not by double-clicking, or the window will close before you can read
anything.

```
orrery.exe
orrery.exe YourName XXXX-XXXX
```

## macOS

`orrery`, universal binary, Apple Silicon and Intel. It arrives quarantined like
anything downloaded, so clear the flag first or the system will refuse to start
it:

```
xattr -d com.apple.quarantine orrery
chmod +x orrery
./orrery
```

No dependencies either way. No network, no files written, no registry.

## Goal

Find the serial that matches your name.

Two things to understand, in this order:

1. **the physics of the probes** — how an echo betrays a planet;
2. **the encoding** — how five positions become eight characters.

And one thing to accept: **the program does not know where the planets are.**
It only carries what the telescope heard back. There is nothing to read out of
memory, nothing to breakpoint on, no branch worth flipping. The positions exist
nowhere but in the echoes — and in whatever you can infer from them.

## House rules

- A serial found today is worthless tomorrow. A keygen is the only honourable
  way out.
- The serial is never compared in the clear. Forcing the branch just prints a
  wrong fingerprint, and you will know it.
- The name matters. No two names ever share a serial.

## Hints

- The full survey is handed to you on every run: solving it by hand is doable,
  but a solver is faster.
- Your serial is checked by replaying it against the survey. That is the only
  test the program is capable of.
- Some planet layouts would be indistinguishable from one another. Those never
  come up — the program makes sure of it. Understanding *why* will help you
  write a solver that never guesses wrong.
- An environment variable pins the day. It is there so you can build your keygen
  in peace.

Happy hunting.
