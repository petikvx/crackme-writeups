# CrackmesForBeginners (CFB) #7 — Shattered Mirror

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a5374710b25d281a65688e6) · id `6a5374710b25d281a65688e6`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a5374710b25d281a65688e6/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB7.exe`](original/CFB7.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb7-solve.py`](tools/cfb7-solve.py) | déchiffrement shellcode + password (`--check` / `--run`) |

## Réponse

| Input | Valeur |
|---|---|
| Activation password | **`Pwn.By_SMC_2026`** (15 caractères, casse exacte) |

```bash
python3 tools/cfb7-solve.py -q
# Pwn.By_SMC_2026

python3 tools/cfb7-solve.py --check
python3 tools/cfb7-solve.py --run    # wine + patch PAGE_EXECUTE_READWRITE
```

Le « miroir brisé » : le prédicat n’est **pas** une `strcmp` classique en `.rdata`, c’est un **mini-shellcode** XOR-déchiffré puis `call`é.

---

## 1. Premier regard

```text
file original/CFB7.exe
# PE32+ executable (console) x86-64, for MS Windows
```

```text
===================================================
            Crackme #7
           [+] by pwn.by [+]
         --> pwned.space <--
===================================================

[*] Welcome to CFB7 - Shattered Mirror.
[*] Enter activation password:
[+] Password: …
[*] Reassembling memory fragments...
   [+] ACCESS GRANTED! …   ou   [-] ACCESS DENIED! …
   Or debugger detected causing memory shatter...
```

Hashes :  
MD5 `1562094492f8da4a818f0800e75f8cc8` · SHA-256 `4f9fc45d510842edb48a247e617cca2786994880202bca0413d6dcc87c6e34b4`.

Contrainte : password **≥ 8** caractères après trim (`isspace`), sinon `Password is too short!`.

---

## 2. Flow

```text
main ~0x1400034c0
  banner + prompt
  getline → std::string, trim L/R
  si len < 8 → erreur
  VirtualAlloc(NULL, 0x25, MEM_COMMIT|RESERVE, PAGE_READWRITE)
  [*] Reassembling memory fragments...
  key = f(PEB.BeingDebugged, IsDebuggerPresent)   # clean → 0x5A
  XOR 0x25 octets depuis .rdata @ 0x1400213e0 → buffer alloué
  VirtualProtect(buf, 0x25, PAGE_EXECUTE_READ, …)
  call buf(password_ptr)   # shellcode → AL = 1/0
  ACCESS GRANTED / DENIED
  wipe buffer + VirtualFree
```

### Anti-debug → clé XOR

```text
cl  = PEB.BeingDebugged ^ 0x5A          ; gs:[0x60]+2
call IsDebuggerPresent
si retour == 0 : key = BeingDebugged ^ 0x5A
sinon          : key = ~(BeingDebugged ^ 0x5A)   ; byte
```

Sans debugger : `BeingDebugged == 0` → **`key = 0x5A`**.  
Avec debugger : mauvaise clé → shellcode illisible → DENIED + message « memory shatter ».

---

## 3. Prédicat (shellcode)

Blob chiffré (37 octets) @ `0x1400213e0`, XOR `0x5A` :

```text
48 b8 50 77 6e 2e 42 79 5f 53   mov rax, "Pwn.By_S"
48 39 01                       cmp qword [rcx], rax
75 13                          jne fail
48 b8 4d 43 5f 32 30 32 36 00   mov rax, "MC_2026\0"
48 39 41 08                    cmp qword [rcx+8], rax
75 03                          jne fail
b0 01                          mov al, 1
c3                             ret
32 c0                          xor al, al
c3                             ret
```

Donc le buffer password doit contenir exactement :

```text
Pwn.By_S MC_2026 \0
└── 8 ──┘└── 7 ──┘└NUL
→ Pwn.By_SMC_2026
```

Appel depuis le main (`0x140002840`) : `rax = shellcode`, `rcx = password.data()`, `call rax`.

---

## 4. Vérification

```bash
python3 tools/cfb7-solve.py --check
# check OK — Pwn.By_SMC_2026

python3 tools/cfb7-solve.py --run
# … ACCESS GRANTED! Congratulations!
```

Sous Wine, le binaire d’origine peut **pagefault** après le check : il passe le buffer en `PAGE_EXECUTE_READ` puis tente un wipe (`movups [rdi], 0`) avant `VirtualFree`. Le solveur `--run` patch temporairement `0x20` → `0x40` (`PAGE_EXECUTE_READWRITE`) ; le password et le shellcode restent ceux de l’original.

Mauvais password → `ACCESS DENIED` + hint debugger (même sans debugger : le message est partagé).

---

## 5. Notes

| Piège | Réalité |
|---|---|
| Chercher le password en clair dans les strings | Absent — seulement le blob XOR |
| `strcmp` / memcmp classique | Non : **shellcode** exécuté |
| Debugger attaché | XOR key ≠ `0x5A` → check cassé |
| Wine crash après GRANTED/DENIED | Wipe sur page RX — pas le prédicat |

Ce n’est **pas** un keygen multi-user : un seul password fixe.
