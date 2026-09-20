# victormeloasm's Simple Frog

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6aae098bcab6678aefe9de31) · id `6aae098bcab6678aefe9de31`

Crackme **ELF64 Linux** console (C/C++), sans table de sections.  
Auteur : [victormeloasm](https://crackmes.one/user/victormeloasm) · difficulté site **3.0**.  
Règles auteur : *NO PATCHING / NO AI / NO HOOKING / NO INJECTION* — **keygen**.

Dossier : `authors/victormeloasm/6aae098bcab6678aefe9de31/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/simplefrog`](original/simplefrog) | binaire d’origine |
| [`analysis/simplefrog.i64.c`](analysis/simplefrog.i64.c) | Hex-Rays (`decc`) |
| [`analysis/gdb-check.log`](analysis/gdb-check.log) | preuve GDB oracle |
| [`tools/simplefrog-solve.py`](tools/simplefrog-solve.py) | keygen HWID + `--check` |

## Réponse

Serial = **SHA-256** (64 hex) d’un blob HWID éphémère dérivé du **name**.

| | |
|---|---|
| **Name (exemple)** | `petik` |
| **Serial** | dépend de la session (souris + `CLOCK_REALTIME` + moniteur) |
| OK | `Croak! Correct serial.` |

```bash
# Keygen live (DISPLAY requis) — coller le serial au prompt du binaire *de la même* capture n’est
# pas possible cross-process ; le serial change à chaque run.
python3 tools/simplefrog-solve.py -q --name petik

# Preuve contre original/ : oracle GDB (lit le digest après SHA256, le renvoie)
python3 tools/simplefrog-solve.py --check --name petik
```

---

## 1. Premier regard

```text
simplefrog: ELF 64-bit LSB executable, x86-64, dynamically linked, no section header
sha256  95bae4727a528ac6583694b968ee29ca675d17891c0965c632750c41de26362e
size    7027
entry   0x2015a0
```

Imports utiles : `XOpenDisplay` / `XQueryPointer` / `XRRGetMonitors` / `SHA256` (`libcrypto.so.3`).

Strings : `Name:` / `Serial:` / `Croak! Correct serial.` / `Wrong serial.`  
Constantes ASCII en u64 : `SIMPLEFR`, `SimpleFr`, `SAT-FROG`, `FROG-SAT`, `RFESUAC3` (thème grenouille).

```bash
bash -ic 'decc original/simplefrog'
# → analysis/simplefrog.i64.c
```

---

## 2. Flow

1. Affiche `Simple Frog` / `Name:` — lit jusqu’à 0x80 octets (stop `\n`).
2. `XOpenDisplay` ; échantillonne le pointeur **~1,5 s** (nanosleep 10 ms) en mélangeant coords / mask / temps monotone (splitmix-like) → `v26`.
3. `CLOCK_REALTIME` → `tv_sec` ; moniteur XRandR sous le curseur → `(width, height)` (sinon `Screen`).
4. Hash FNV-1a 64 du name + finalizer splitmix → `v44`.
5. Construit le blob puis `SHA256(blob)` → digest 32 B.
6. (Table / permute 0x8000 entrées + chiffrement maison `sub_202650` — vérif secondaire.)
7. `Serial:` — attend **exactement 64 hex** ; décode en 32 B.
8. Succès ⇔ serial décodé **==** digest SHA-256 **et** checks secondaires OK.

---

## 3. Prédicat (blob → SHA-256)

```text
blob = name || 0x00 || v26:u64le || tv_sec:u64le || width:u32le || height:u32le || mix_a:u64le || mix_c:u64le
serial = hex(SHA256(blob))    # 64 chars lowercase
```

`mix_a` / `mix_c` : boucle splitmix/`ROL` alimentée par `v26`, `tv_sec`, dimensions et `v44` (constante `SimpleFr`).

Le serial est donc un **HWID keygen** : même name, autre instant / autre geste souris → autre serial.

---

## 4. Debug GDB (pas à pas)

Oracle utilisé par `tools/simplefrog-solve.py --check` :

```bash
gdb -q original/simplefrog
(gdb) set debuginfod enabled off
(gdb) break *0x201f8b          # call SHA256 (PLT)
(gdb) commands
> silent
> set $shaout=$rdx             # dest digest
> continue
> end
(gdb) break *0x201f90          # retour SHA256
(gdb) commands
> silent
> # lire 32 octets @ $shaout → hex = serial
> continue
> end
(gdb) run
# Name: petik
# … ~1,5 s …
# au break : x/32xb $shaout  → coller en hex au prompt Serial:
```

Exemple observé (`petik`) :

```text
INLEN 46
blob = 70 65 74 69 6b 00 | v26… | tv_sec… | 80 07 00 00 | 38 04 00 00 | …
       "petik\0"           …       …         1920          1080
SERIAL_HEX … (64 hex)
Croak! Correct serial.
```

Log : [`analysis/gdb-check.log`](analysis/gdb-check.log).

Pièges :

- **Pas de sections** → breakpoints en VA fixes (`EXEC` non-PIE, base `0x200000`).
- Sans `DISPLAY` / X11 : échec avant le prompt serial.
- Serial figé hors session : **inutile** (HWID temps + souris).

---

## 5. Vérification

```bash
python3 tools/simplefrog-solve.py --check --name petik
# … Croak! Correct serial. …
# OK
```

---

## 6. Notes

- Famille grenouille victormeloasm (cf. Froggate II, beaucoup plus dur).
- `sub_202650` + table 0x8000 : obfuscation autour du vrai prédicat `serial == SHA256(blob)`.
- Keygen Python (`-q`) réimplémente la capture HWID ; la preuve reproductible contre `original/` passe par l’oracle GDB (`--check`), sans patcher le binaire.
