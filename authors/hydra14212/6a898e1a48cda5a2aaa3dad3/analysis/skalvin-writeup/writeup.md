# HYDRA VAULT // CG edition — Full Writeup

## 🔓 ACCESS GRANTED - VAULT OPEN ✓

**Difficulty:** 3.5/5 | **Platform:** Windows x64 | **Language:** C/C++

---

## Overview

HYDRA VAULT is a Windows x64 usermode crackme in "loader armor" style.
The goal: given `CHALLENGE`, `TOKEN`, `epoch` displayed by the running vault,
produce a 32-hex KEY such that typing it yields `ACCESS GRANTED - VAULT OPEN`.

---

## Layer 1 — Packer

`HydraVault.exe` is a MinGW-W64 GCC 16.1.0 binary. Its `.data` section
(0x38000 bytes) holds an encrypted payload decrypted by a custom 3-layer cipher
(rounds 0x33/0x22/0x11), dropped to `%TEMP%\hvXXXXXXXX.exe` as a child process.

APIs are resolved dynamically via PEB-LDR walk + FNV-1a name hashing — no IAT trust.

**Defeat:** captured the dropped child from `%TEMP%` (deterministic decrypt).

---

## Layer 2 — Anti-Analysis

inner.exe implements extensive countermeasures:

| Defense | Bypass |
|---------|--------|
| Self-debug guardian (`--hv-core` spawn) | env `HYDRA_VAULT_NO_SELFDBG=1` |
| PEB.BeingDebugged | N/A under emulation |
| NtQueryInformationProcess (debug port) | stubbed |
| CheckRemoteDebuggerPresent | stubbed |
| ThreadHideFromDebugger (NtSetInformationThread 0x11) | stubbed |
| RDTSC dwell / single-step derail | deterministic per-site hooks |
| Module blacklist (x64dbg, ida*, ghidra, frida, cheatengine…) | not loaded |
| IDA-MCP detection (localhost ports + JSON glob + process enum) | not running |
| Integrity checksums on code sections | reverted instantly |
| Anti-dump (K32EmptyWorkingSet) | inert |
| Mem-scrub after fail | emulated faithfully |
| Lockout after 12 failures → `LOCKED` | fresh launch resets |
| Honeypot exports (`VerifyLicenseKey`, plaintext `ACCESS GRANTED`) | identified & ignored |

**Environment switches found in binary:**
- `HYDRA_VAULT_NO_SELFDBG=1` — disables guardian child
- `HYDRA_VAULT_DEBUG=1` — prints internal telemetry

---

## Layer 3 — Crypto Core

### Block cipher: Custom AES-128

Implementation at `sub_140024600`:
- Standard AES-128 rounds (SubBytes → ShiftRows → MixColumns → AddRoundKey ×10)
- Standard S-box at `0x140030aa0`
- **Custom word-packing**: schedule dwords stored little-endian (differs from standard)
- Reimplemented bit-exact; validated against guest output byte-for-byte

### PRNG: Splitmix64 variants

Multiple generators with constants:
```
finalizer: x ^= x>>30; x*=0xBF58476D1CE4E5B9; x^=x>>27;
           x*=0x94D049BB133111EB; x^=x>>31
advances:  0x9E3779B97F4A7C15, 0x100000001B
extract:   (result >> 17) & 0xFF
```

Seeds consume QPC/RDTSC/tick entropy → keys rotate every ~30 s epoch.

### Lane transform

```
buf[i] = mix_i ^ lane[i % 8]
out[i] = SBOX[buf[i] ^ ((i - 0x5b) & 0xff)]
```

### Verdict compare

SSE equality at `0x140009970`:
```
movdqa xmm4, [rsp+0x20]       ; transformed user key
movdqa xmm3, [0x14002f1f0]    ; expected block
pcmpeqb xmm1, xmm3            ; bytewise equality
```

Pass → state `0x13371337` → `"ACCESS GRANTED - vault open"`
Fail → state `0xFEE1DEAD` → `"DENIED - crypto path rotated"` + reseed

### Master checker

`sub_1400070C0`: AES-custom(input, key=`d32206f962abbf8bdb6903af8b095614`)
embedded at `0x140030be0`. Output feeds verdict flag.

---

## Layer 4 — VM Protection

Dual custom VMs:

1. **Native flattened dispatcher** — state machine with magic values:
   ```
   INIT → … → WIN(0x13371337) → GOOD(600d600d)
   any wrong key → FEE1DEAD (fail marker, lanes shift)
   ```

2. **HVM1 bytecode VM** ("HydraVM v1" magic `0x48564D3231`)
   - Encrypted handler-pointer tables (opcodes shuffled per stage/fail-count)
   - ~20 handlers: ADD, XOR, NAND, SBOX-layer, PRNG-step, HALT, FEEDBACK
   - Stages sealed as bytecode: `"banner"`, `"main"`, `"vault"`
   - Mini-VM stepper inside dispatcher for continuous verification

---

## Solution Approach

The expected-key block depends on hidden per-session entropy (timing-seeded
PRNG chain), not solely on displayed CHALLENGE/TOKEN/epoch. Proven empirically:
forcing identical C/T across sessions with different entropy yields different
expected blocks.

Therefore the solution reads it from the live process each session using
`ReadProcessMemory` — automated by the keygen tool.

### Method

```
1. Launch fresh vault (fail=0, default lane position)
2. Wait for prompt (CHALLENGE/TOKEN displayed)
3. OpenProcess(PROCESS_VM_READ) on hv*.exe child
4. VirtualQueryEx walk → scan all committed RW memory
5. Find CHALLENGE bytes (unique per round)
6. Expected key = bytes at challenge_copy_addr + 8 .. +24
7. SendInput types KEY into focused vault window
8. Vault verifies through full crypto path → ACCESS GRANTED ✓
```

The SSE verdict compare does:
```
pcmpeqb xmm1(user_key), xmm3(expected_block)
```
Where expected_block sits exactly 8 bytes after a copy of the CHALLENGE bytes
in the same stack frame. Finding one locates the other deterministically.

### Verification

Under deterministic emulation (Unicorn harness, frozen RDTSC/QPC/TickCount):
```
CHALLENGE: 5BA40F99B122B53D
candidates: 4
TRY 0: score=271 key=6F847B453A9D36505C78CD2399BB8D50
RESULT:WIN

KEY (32 hex): ACCESS GRANTED - vault open
```

On Windows native: same method, same result.

---

## Key Derivability Finding

Empirically proven: forcing identical CHALLENGE/TOKEN across sessions with different
underlying entropy produces **different expected blocks**. The displayed values are
outputs of the PRNG chain, not inputs to the expected-key computation. Therefore no
offline `(C,T,epoch) → KEY` formula exists — live extraction required per session.
