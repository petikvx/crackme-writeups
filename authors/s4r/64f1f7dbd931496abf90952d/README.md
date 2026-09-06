# s4r — encrypted_box

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/64f1f7dbd931496abf90952d) · id `64f1f7dbd931496abf90952d`

Challenge **Barbhack CTF 2023** : ELF64 static/stripped, **AES-NI** (`aesdec`), code **auto-déchiffré** par couches, anti-debug `rdtsc` / junk `ror`.  
Auteur : [s4r](https://crackmes.one/user/s4r).

Dossier : `authors/s4r/64f1f7dbd931496abf90952d/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`encrypted_box`](original/encrypted_box) | binaire (~421 KiB, 1 PHDR RWE) |
| [`encrypted-box-password.bin`](tools/encrypted-box-password.bin) | stream de blocs 16 o (16016 o) |
| [`encrypted-box-solve.py`](tools/encrypted-box-solve.py) | `--check` live |

## Réponse

| | |
|---|---|
| Flag | **`BRB{as_deep_as_OceanGate}`** |
| Input | concat de **N × 16 octets** (voir `tools/encrypted-box-password.bin`) |

```bash
python3 tools/encrypted-box-solve.py --check
# BRB{as_deep_as_OceanGate}

cat tools/encrypted-box-password.bin | ./original/encrypted_box
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
entry 0x400078 · un seul LOAD RWE (fichier ≈ image)
sha256: f17318419da1c0815cf4bf3e4c2b94be99eacdd079b5035ef76c4495f666aed3
```

Comportement naïf : `read(0, rsp, 16)` puis silence / exit — le reste du code est **chiffré** jusqu’à validation du bloc.

Labels site : anti-debug timing, AES, self-modifying / runtime decrypt.

---

## 2. Flow (couches)

```text
stage 0:
  read 16 → stack
  construire clés/constantes (ror + mov r*b + rdtsc junk)
  xmm2 = password (2× pinsrq)
  aesdec xmm2, xmm1
  comiss xmm2, xmm0  → sinon exit

  # OK → déchiffre .text [0x400217 .. +0x66b80] par blocs 16 o (aesdec, clé = password)
  jmp code déchiffré

stages suivants (répétés) :
  même schéma : read 16, aesdec+comiss, decrypt tranche suivante…
jusqu’au puts du flag.
```

Le « password » n’est donc **pas** 16 caractères uniques : c’est la **concaténation** de tous les blocs attendus (~1001 × 16 = 16016 octets).

---

## 3. Récupération des blocs

Chaque check est une round `aesdec` (Equivalent Inverse Cipher Intel) dont l’inverse n’est pas une seule insn. Approches :

1. **Dynamique** : breakpoint sur `aesdec` / `comiss`, lire `xmm0`/`xmm1`, inverser la round (tables InvMixColumns / etc.).
2. **Instrumentation** (Pin, etc.) : patcher automatiquement chaque bloc correct dans le buffer d’entrée.

Le blob `tools/encrypted-box-password.bin` est le résultat de cette inversion multi-étages.

Premier bloc (hex) : `4ebd8e7627d66f7562ed5c13782c9333`.

---


## Debug GDB (pas à pas)

ELF64 **statique** strippé, un LOAD **RWE**. Entry live `0x400078` (`starti` → PC=`0x400078`) : `read` syscall puis couches AES-NI (`aesdec`).

```bash
export DEBUGINFOD_URLS=
gdb -nx -q ./original/encrypted_box
(gdb) set debuginfod enabled off
(gdb) starti
(gdb) x/20i $pc
# 0x400078: xor rdi,rdi ; mov rsi,rsp ; mov rdx,0x10 ; xor rax,rax ; syscall  (=read 16)
(gdb) catch syscall read
```

Inverser live : BP après chaque round / lire `xmm*` ; password final `BRB{as_deep_as_OceanGate}`.

`solution_summary` : `BRB{as_deep_as_OceanGate}` ; multi-stage AES-NI.

## 4. Vérification

```bash
wc -c tools/encrypted-box-password.bin
# 16016
cat tools/encrypted-box-password.bin | ./original/encrypted_box
# BRB{as_deep_as_OceanGate}
```

---

## 5. Notes

- Sans le bon 1er bloc, le process sort avant tout `write` — d’où l’impression de « binaire mort ».
- `rdtsc` / junk : bruit anti-analyse, pas le prédicat.
- x32dbg / x64dbg : **inutiles** ici (ELF Linux) → gdb / Pin.
