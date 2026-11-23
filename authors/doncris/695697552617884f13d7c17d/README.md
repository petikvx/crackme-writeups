# DonCris's Party Protocol 2026

| | |
|---|---|
| **ID** | [`695697552617884f13d7c17d`](https://crackmes.one/crackme/695697552617884f13d7c17d) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | DonCris |
| **Plateforme** | Windows PE64 console, C++ MinGW GCC 13.2 |
| **SHA-256** | `4a5e424441566f7e47171183370d6beb3bdd1ce97906b14924277d2e93f9d8e9` |

| Fichier | Rôle |
|---|---|
| `original/PartyProtocol.exe` | binaire d'origine |
| `tools/partyprotocol-solve.py` | keygen handle → mix code (`-q`, `--check`) |

## Réponse

| DJ HANDLE | SECRET MIX CODE |
|---|---|
| `petik` | `126555142` |

```bash
python3 tools/partyprotocol-solve.py --user petik        # -q : code seul
python3 tools/partyprotocol-solve.py --check             # lance l'exe sous wine/xvfb
```

## Premier regard

`file` : PE32+ console x86-64 ; `diec` : MinGW GCC 13.2. `strings` : bannière « PARTY PROTOCOL 2026 », `Anti-Party Debugger Detected.`, `>> ENTER DJ HANDLE:`, `>> ENTER SECRET MIX CODE:`, `Invalid input.`, `PARTY HARD 2026`.

## Flow

`main` (`0x140071d40`) :
1. `GetLocalTime` ; si l'**année ≠ 0x7ea (2026)** → message d'erreur « anti-party » et sortie. Le crackme ne fonctionne donc qu'avec une horloge système en 2026.
2. `check_vibe` (`0x140001530`) : `rdtsc` avant/après une boucle de 10000 additions ; échoue si > `0x2faf080` cycles (anti-debug temporel).
3. Lecture du handle (`getline`), trim des espaces finaux ; longueur ≥ 2 sinon `Invalid input.`.
4. Hash du handle, lecture du code (`unsigned`), second `check_vibe`, comparaison.

## Comment on trouve

Ancrage : `objdump -d -M intel` + xref des `lea` vers les chaînes `.rdata` (`0x1400762ad` « ENTER DJ HANDLE »), d'où `main`.

Hash (`0x140071fa4`–`0x140071fc7`), commenté :

```asm
mov  esi,0xdeadbeef        ; h
movsx edx,BYTE PTR [rax]   ; c (signé)
xor  edx,esi               ; c ^ h
imul edx,edx,0x12345678    ; * 0x12345678 (32 bits)
mov  esi,edx
rol  esi,5                 ; h = rol(.,5)
```

Puis (`0x140072024`) :

```asm
imul esi,esi,0x7ea         ; h *= 2026
cmp  esi,0xcafebabe
setae al ; imul eax,eax,0xcafebabe ; sub esi,eax   ; si h >= 0xcafebabe : h -= 0xcafebabe (une seule fois)
cmp  [rsp+0x3c],esi        ; == code saisi
```

Exemple `petik` : h0 = `0xdeadbeef`, 5 itérations de `rol((c^h)*0x12345678, 5)`, puis `*0x7ea` et soustraction conditionnelle → `126555142`.

Pièges : `movsx` (caractères > 0x7f signés), trim des espaces/CR finaux avant le hash, la « soustraction modulo » n'est pas un vrai modulo, `check_vibe` peut échouer sous debugger/VM lente, et la date système.

## Vérification

- OK : `python3 tools/partyprotocol-solve.py --check` → `ACCESS GRANTED. YOU ARE THE RESIDENT DJ.` (`PARTY HARD 2026`), via `xvfb-run -a wine original/PartyProtocol.exe`.
- KO : `petik` + `123` → `[FAIL] TERRIBLE MIX. THE CROWD IS BOOING.`

Analyse 100 % statique (objdump) + preuve Wine ; pas de GDB.
