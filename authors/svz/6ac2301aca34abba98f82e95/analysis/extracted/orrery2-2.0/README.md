# Orrery 2

Eleven planets ride six turning rings of a grid nobody can look at directly. Your
telescope only sends out probes: they come back absorbed, reflected, or they
surface somewhere else entirely. The rings turn between one probe and the next,
so every shot sees a slightly different sky. Work out the orbits from the echoes
alone.

```
orrery2                       # telescope survey
orrery2 <name> <serial>       # validate a serial
```

## Windows

`orrery2.exe`, 64-bit, statically linked — no runtime to install. Run it from a
terminal, not by double-clicking, or the window will close before you can read
anything.

```
orrery2.exe
orrery2.exe YourName XXXXX-XXXXX-XXXXX
```

## macOS

`orrery2-macos`, universal binary, Apple Silicon and Intel. It arrives
quarantined like anything downloaded, so clear the flag first or the system will
refuse to start it:

```
xattr -d com.apple.quarantine orrery2-macos
chmod +x orrery2-macos
./orrery2-macos
```

## Linux

`orrery2-linux`, x86-64, statically linked — runs on any distribution, nothing
to install.

```
chmod +x orrery2-linux
./orrery2-linux
./orrery2-linux YourName XXXXX-XXXXX-XXXXX
```

No dependencies on any platform. No network, no files written, no registry.

## Goal

Find the serial that matches your name.

Three things to understand, in this order:

1. **the telescope** — the program does not compute the physics in the open. It
   runs it. Both the probe rules and the orbits live as bytecode for a small
   machine whose instruction set is reshuffled and re-encrypted every day;
2. **the sky** — how the rings turn, and how eleven moving positions reduce to
   one canonical number;
3. **the encoding** — how that number becomes fifteen characters, keyed to your
   name.

And one thing to accept: **the program does not know where the planets are.**
It only carries what the telescope heard back, and the physics to replay it.
There is nothing to read out of memory, nothing to breakpoint on, no branch
worth flipping. The positions exist nowhere but in the echoes — and in whatever
you can infer from them.

## House rules

- A serial found today is worthless tomorrow. A keygen is the only honourable
  way out. (And brute force will not help: by the time it finishes, the sky has
  turned.)
- The serial is never compared in the clear. Forcing the branch just prints a
  wrong fingerprint, and you will know it.
- The name matters. No two names ever share a serial.

## Hints

- The full survey is handed to you on every run. Solving it by hand is possible
  but slow; a solver that models the moving sky is the intended path.
- Your serial is checked by replaying it against the survey. That is the only
  test the program is capable of.
- Reading the daily bytecode is where it starts. What it computes is older and
  simpler than it looks.
- Some configurations would be indistinguishable from one another. Those never
  come up — the program makes sure of it.
- An environment variable pins the day. It is there so you can build your keygen
  in peace.

Happy hunting.
