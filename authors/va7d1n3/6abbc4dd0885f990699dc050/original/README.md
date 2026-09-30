# NieR: Automata Simulation v3.0 (Crackme)

A lightweight Win32 reverse-engineering puzzle heavily inspired by the terminal hacking sub-games in *NieR: Automata*. 

## The Challenge
You control a core player rocket unit locked in an arena with accelerating threat vectors. Corrupted data packets scale rapidly in speed and volume over time. If your system integrity degrades to 0%, a fatal hardware exception occurs and the simulation self-terminates.

To survive the simulation and archive **ENDING [S]**, you must find a backdoor method to bypass local execution filters and force deploy the **Tactical Pod Recovery** system.

## Technical Details
- **Platform:** Windows (x86/x64 native executable)
- **Language:** C++ / Win32 API
- **Difficulty:** Beginner / Intermediate (1.5 / 6)
- **Binary Protections:** Anti-tamper execution branches, timing checks, and dynamic parameter scaling.

## Objectives
1. **Analyze the UI Layout:** Recover the 4-phase sequence hidden beneath the key entry interface.
2. **Defeat the Supervisor Check:** Locate the firmware override condition inside the binary that halts manual code redirection.

## Rules & Submission
- Do not disable the core loop framework or rendering parameters.
- Valid solutions must include either the exact 4-character console override string or a comprehensive walkthrough outlining a successful assembly patch/register modification bypassing the local security logic.

---
*Glory to mankind.*
