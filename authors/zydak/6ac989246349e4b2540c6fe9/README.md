# Zydak's Tetris DRM

| | |
|---|---|
| **ID** | [`6ac989246349e4b2540c6fe9`](https://crackmes.one/crackme/6ac989246349e4b2540c6fe9) |
| **Auteur (site)** | Zydak |
| **Auteur (local)** | zydak |
| **SHA-256** | `b507cbce9f98e2ef5015682ee738e7fb83c93069d6d7253f47b3d69b47f5e336` (`original/Crackme`) |
| **Langage** | C/C++ |
| **Statut** | **parked** — handshake aplati, pas de flag |

## Origine

- Page : https://crackmes.one/crackme/6ac989246349e4b2540c6fe9
- Download : https://crackmes.one/download/crackme/6ac989246349e4b2540c6fe9
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/README.md` | Leurre du ZIP crackmes.one (« Nothing in here ») |
| `original/tetris-drm.7z` | Archive Google Drive (sans mot de passe) |
| `original/Crackme` | Client DRM, ELF64 PIE stripé, 2,6 Mio |
| `original/CXXD4` | Jeu (miniaudio, `socket`/`connect`), ELF64 PIE stripé, 8,4 Mio |
| `original/Assets/*.mp3` | Musiques |

Lien auteur : `https://drive.google.com/file/d/1jb7lm1kvMZ2PhxGiUYIsMSguiK6YODCA/view`

## Premier regard

`Crackme` lancé sans débogueur affiche `FUCKASSCORP SHITTY DRM CLIENT v1.0`, demande un username / password, puis :

```text
[-] Error: Oops! It seems like our servers are currently down, please try again later.
```

Code de sortie `1`. Sous `strace` le processus meurt en `SIGILL` (anti-debug, import `ptrace`).

`strings` ne contient presque rien du banner. La seule chaîne claire est `WATCHDOGTETRIS1984LEETDRMRATCHET` (32 octets, VA fichier `0x23902`).

Imports utiles : `memfd_create`, `ftruncate`, `mmap`, `fork`, `setenv`, `ptrace`, `execvp`, `prctl`, `kill`, `waitpid`. Aucun `call` direct (`E8`) vers ces PLT : les appels sont indirects.

## Ghidra

Importé dans le projet GUI ouvert **MalwareLab**, dossier `/crackmes/zydak-tetris/Crackme` (langage `x86:LE:64:default`, image base `0x100000`, 1097 fonctions). `CXXD4` n’est pas importé.

- `entry` @ `0x151000` appelle `__libc_start_main`.
- `main` créé à `0x224a00` (ELF `0x124a00`), corps 9135 octets. Le décompilateur timeout : prologue classique puis table de 256 dwords sur la pile, indexée par `(rsp>>4)` mélangé par XOR/OR/AND (aplatissement).
- `_INIT_8` @ `0x258140` recopie la clé vers le BSS `0x3b1280` : `WATCHDOGTETRIS1984LEETDRMRATCHET`.

## Park

Suspendu le 2026-10-10. Le client DRM se lance, l’auth locale échoue (`exit 1`), et le jeu `CXXD4` n’est pas atteint. Reprendre par `analysis/NOTES.md` : `main` @ `0x124a00`, saut chevauchant `EB FF` / `jmp rax`, bloc suivant `0xF6968`, anti-debug `SIGILL` sous `strace`.

## Status

- [x] binaire réel récupéré (le ZIP du site est vide)
- [x] prologue `main` décompilé (Ghidra + Hex-Rays)
- [ ] prédicat DRM / patch pour lancer `CXXD4`
- [ ] 5 niveaux + flag
- [ ] solveur / write-up solved
