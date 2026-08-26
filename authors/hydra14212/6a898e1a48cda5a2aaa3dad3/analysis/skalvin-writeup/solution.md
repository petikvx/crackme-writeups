# HYDRA VAULT — Solution

## TL;DR

```cmd
python hydra_win.py
```

Enter CHALLENGE/TOKEN/EPOCH when prompted. Tool reads the answer from process
memory and types it into the vault. **ACCESS GRANTED - VAULT OPEN.**

---

## How the vault works

```
HydraVault.exe (stub)
  │ spawns hvXXXXXXXX.exe as child
  ▼
hv*.exe = inner vault
  ├─ anti-debug (guardian, PEB, NtQuery, RDTSC, module scan)
  ├─ mints CHALLENGE + TOKEN from timing entropy
  ├─ derives expected-key block (hidden from display)
  ├─ waits for 32-hex KEY input
  ├─ compares: custom_AES(user_key) == expected_block
  └─ match → "ACCESS GRANTED - VAULT OPEN"
             else → "DENIED - crypto path rotated"
                     xor-lane shift, mem-scrub, reseed
                     (after 12 fails → LOCKED forever)
```

## The vulnerability

The verdict is a direct equality check:
```
custom_AES_128(user_typed_key, expanded_schedule) == expected_block_in_memory
```

The expected block lives in the same stack frame as a copy of the CHALLENGE bytes,
exactly 8 bytes after it. Finding one locates the other.

## The solution

`hydra_win.py` automates everything:

```cmd
python hydra_win.py
```

1. Kills old instances
2. Launches fresh vault (env `HYDRA_VAULT_NO_SELFDBG=1`)
3. Waits for prompt
4. You enter CHALLENGE / TOKEN / EPOCH from screen
5. Script opens the child process (`OpenProcess(PROCESS_VM_READ)`)
6. Walks memory with `VirtualQueryEx`, finds CHALLENGE bytes
7. Reads `+8..+24` → that IS the expected key
8. Sends it via `SendInput` keystrokes
9. Vault verifies through full crypto path → **ACCESS GRANTED**

## Requirements

- Windows
- Python 3 (stdlib only)
- Administrator terminal
- HydraVault.exe in current directory or provide path when asked

## Notes

- Expected keys rotate ~30 s per epoch; re-run per session
- If a key is DENIED, restart the vault (lanes shift on every failure)
- The tool handles everything else automatically
