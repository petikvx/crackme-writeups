# SirCrackaLot -- The Order of the Crack

Hear ye, brave knights and noble scholars! The ancient Order of the Crack
beckons thee to prove thy worth. Only those who can forge a sacred key for
any given name shall be admitted to the hallowed halls.

This is a crackme challenge where you must discover the algorithm behind the
serial key generation. Given any username, you must produce a valid serial
key. A keygen is the ultimate proof of mastery.

**Difficulty:** 3 / 6
**Platform:** Linux x86\_64
**Language:** Rust

## How to Run

```bash
./SirCrackaLot
```

You will be prompted to enter your name and then the sacred key.

## Serial Format

The key consists of four sacred seals in the form:

```
XXXX-XXXX-XXXX-XXXX
```

Each group is a 4-digit uppercase hexadecimal value (0-9, A-F), separated by
dashes.

## Hints

1. "The first seal is born from thy name alone."
2. "Each seal feeds the next -- the chain must not be broken."
3. "The final seal guards them all."

## Rules

- Find a valid key for **any** username of your choosing.
- Writing a **keygen** is the ultimate solution and the true mark of mastery.
- **No patching.** The binary must remain unmodified. Bypassing the
  verification by patching the binary does not count as a valid solution.

## Metadata

| Field      | Value        |
|------------|--------------|
| Difficulty | 3 / 6       |
| Platform   | Linux x86\_64 |
| Language   | Rust         |
| Arch       | x86\_64      |
