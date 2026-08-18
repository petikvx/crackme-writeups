# CrackmesForBeginners (CFB) #8 — Concurrently Yours

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a537490055757d3df60fcc3) · id `6a537490055757d3df60fcc3`

Crackme **PE32+ console** (x86-64), C++ MSVC (VS 2026 / toolset 19.50).  
Auteur site : **CrackNotMe** · tagline `pwn.by` / `pwned.space`.

Dossier : `authors/cracknotme/6a537490055757d3df60fcc3/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CFB8.exe`](original/CFB8.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/cfb8-solve.py`](tools/cfb8-solve.py) | scrape PID/TIDs + token (`--run` / `--check`) |

## Réponse

Le token est **éphémère** (dépend du PID Windows + des TIDs des workers au runtime).  
Formule → 32 caractères hex :

| Bloc (4 octets) | Clé XOR (low byte) |
|---|---|
| `[0..3]` | `GetCurrentProcessId() & 0xFF` |
| `[4..7]` | `TID[0] & 0xFF` |
| `[8..11]` | `TID[1] & 0xFF` |
| `[12..15]` | `TID[2] & 0xFF` |

Cible après XOR (fixe, `.rdata`) :

```text
de ad be ef | ca fe ba be | 13 37 13 37 | 42 42 42 42
```

```bash
python3 tools/cfb8-solve.py --run -q
# ex. fe8d9ecf2a1e5a5ef7d3f7d3aaaaaaaa   ← change à chaque run

python3 tools/cfb8-solve.py --run
python3 tools/cfb8-solve.py --check
# offline si tu as déjà dumpé :
python3 tools/cfb8-solve.py --pid 0x20 --tids 0xe0,0xe4,0xe8,0xf0
```

---

## 1. Premier regard

```text
file original/CFB8.exe
# PE32+ executable (console) x86-64, for MS Windows
```

```text
===================================================
            Crackme #8
           [+] by pwn.by [+]
         --> pwned.space <--
===================================================

[*] Welcome to CFB8 - Concurrently Yours.
[*] Initializing quantum threads...
[+] Threads initialized and waiting.
[*] Enter dynamic session token (32 hex characters):
[+] Token: …
   [+] ACCESS GRANTED! …   ou   [-] ACCESS DENIED! …
   Watch out for race conditions and watchdogs!
```

Hashes :  
MD5 `d7d112dc700a910effc21009bf7dd363` · SHA-256 `4a105f3deb996b174a890199fd375e25f8c788da014afc851f7ad1e59b5b42a8`.

Contrainte UI : exactement **32** caractères hex (après filtre `isspace`), sinon `Token must be exactly 32 hex characters!`.

Description site : validation répartie sur **4 workers**, clés mutantes selon les TIDs, **watchdog anti-stepping**.

---

## 2. Flow

```text
main ~0x140003da0
  banner
  CreateThread × 4  → stub 0x140001800 → worker 0x140003bc0
       param = { index: 0..3, fn: worker }
  CreateThread × 1  → stub 0x140001830 → watchdog 0x1400038e0
  Sleep(500)
  prompt token
  getline → strip spaces → len doit être 32 hex
  parse paires hex → std::vector<uint8_t> (16 octets) @ 0x140036368…
  g_ok_count = 0          # xchg [0x140035050], 0
  WakeAllConditionVariable
  join / cleanup handles
  si g_flag != 0 && g_ok_count == 4 → ACCESS GRANTED
  sinon ACCESS DENIED
```

Globals utiles :

| VA | Rôle |
|---|---|
| `0x140035050` | compteur succès workers (`lock inc`) — reset à 0 avant le wake |
| `0x140035054` | flag « session saine » (init `1` ; mis à `0` si XOR fail / timeout) |
| `0x140036358+4*i` | `TID[i]` écrit par chaque worker au démarrage |
| `0x140023440` | 16 octets cibles `deadbeef…4242` |

---

## 3. Prédicat (workers)

Chaque worker `i` :

1. `TID = GetCurrentThreadId()` → stocké @ `0x140036358 + 4*i`
2. Attend le `condition_variable` (timeout long `0x493e0` ms)
3. Choisit la clé :
   - `i == 0` → `key = GetCurrentProcessId()` (**au moment du check**, pas stocké)
   - `i >= 1` → `key = TID[i-1]` (lu dans la table ci-dessus)
4. Pour `j = 0..3` :

```text
(token[4*i + j] ^ (key & 0xFF)) == expected[4*i + j]
```

5. Si les 4 octets OK → `lock inc g_ok_count` + notify ; sinon `g_flag = 0`

`expected[16]` @ `0x140023440` :

```text
DE AD BE EF  CA FE BA BE  13 37 13 37  42 42 42 42
```

Donc :

```text
token[k] = expected[k] ^ key_byte(chunk)
```

**TID[3] est stocké mais jamais utilisé comme clé** — seul le PID + TID0..TID2 comptent.

### Watchdog

Thread dédié (`0x1400038e0`) : chrono + `SleepConditionVariableSRW`.  
Si le compteur n’atteint pas `4` assez vite (pause debugger trop longue) :

```text
[-] Watchdog Timeout! Debugger stepped too slowly.
```

puis `g_flag = 0`, `g_ok_count = -2` → DENIED même avec un bon token plus tard.

Astuce analyse : les TIDs sont déjà en `.data` **dès le prompt** (écrits avant le wait). Pas besoin de single-step dans le XOR — un dump mémoire / `winedbg` suffit, puis un script.

---

## 4. Vérification

```bash
python3 tools/cfb8-solve.py --check
# expected @ 0x140023440: deadbeefcafebabe1337133742424242  OK

python3 tools/cfb8-solve.py --run
# scrape /proc/<pid>/mem (TIDs) + winedbg info proc (PID Windows)
# … ACCESS GRANTED! Congratulations!
# You have successfully solved CFB8!
```

Sous Wine (testé `wine64`) : image souvent encore @ `0x140000000` ; le solveur lit `TID_VA` dans `/proc` et le PID via `winedbg --command 'info proc'`.

---

## 5. Notes

| Piège | Réalité |
|---|---|
| Chercher un serial fixe dans les strings | Aucun — seulement la cible XOR |
| Utiliser TID[3] comme 4ᵉ clé | Non : worker3 XOR avec **TID[2]** |
| Clé = TID entier | Seulement le **low byte** (`movzx` / `r9b`) |
| Static-only keygen | Impossible : PID/TIDs runtime |
| Breakpoint long sur le check | Watchdog → timeout |

Ce n’est **pas** un password fixe comme CFB7 : chaque session a son token.
