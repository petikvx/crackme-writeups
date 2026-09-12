# alpjs's custom vmp crackme

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aa4b6d3585e8875bcbebf80) · id `6aa4b6d3585e8875bcbebf80`

Crackme **PE64 console**, VMP custom + sponge keystretch + anti-debug.  
Auteur : [alpjs](https://crackmes.one/user/alpjs).

Dossier : `authors/alpjs/6aa4b6d3585e8875bcbebf80/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`crackme.exe`](original/crackme.exe) | binaire d’origine |
| [`crackme.exe.i64.c`](original/crackme.exe.i64.c) | Hex-Rays (`decc`) |
| [`vmp_brute_mt.c`](tools/vmp_brute_mt.c) | checker + brute OpenMP (référence CPU) |
| [`RESUME.md`](analysis/RESUME.md) | état des lieux / reprise |
| [`H100.md`](analysis/H100.md) | port CUDA / brute GPU |

## Status

**Pending** — prédicat crypto **reproduit et validé** (Unicorn + x64dbg), password **pas trouvé**.

| | |
|---|---|
| Tag | `e6a0ef2284734165` |
| Flag (bloc0, sans pwd) | UTF-16 `Doğru! F` |
| Brute CPU | a-z ≤4 épuisé ; a-z len5 ~68 % stoppé ; wordlists KO |

```bash
gcc -O3 -march=native -fopenmp -o tools/vmp_brute_mt tools/vmp_brute_mt.c
./tools/vmp_brute_mt 'candidate'
# Reprise GPU : voir analysis/H100.md
```

## Premier regard

```text
file original/crackme.exe
# PE32+ console x86-64, ~50 KiB

sha256: 3d271299dcf18418b3e2be1006845a3dc8f5199bcf6ebbf2b49e44d1197075e9
```

Wine : `password :` puis succès → affiche le flag UTF-16 (sinon exit 1).

## Flow (abrégé)

```text
init bytecode VM (opcodes shuffle / run)
anti-debug (PEB, fenêtres x64dbg/frida/…, INT3/VEH, timing…)
lit password (UTF-16 console → ASCII)
sub_1400065A0  keystretch 1000 rounds → MAC @ ctx+320
               + xor-dec C510/C560
VM sponge absorb + finalize + CMP tag
  OK → déchiffre flag @ ctx+384, print
  KO → exit 1
```

## Notes

- Patcher le check sans le bon MAC **empoisonne** le keystream du flag (sauf le bloc0 fixe).
- Pas de solveur `-q` tant que le password n’est pas connu.
- Doc reprise complète : [`analysis/RESUME.md`](analysis/RESUME.md).
