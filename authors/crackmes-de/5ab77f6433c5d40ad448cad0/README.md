# 4n006135 / forn00bies (borismilner)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6433c5d40ad448cad0) · id `5ab77f6433c5d40ad448cad0`  
> Import crackmes.de — auteur **borismilner** / « 60²15 ». Pack **levels 0–3** (le level 4 est un autre ID : [`…cad1`](../5ab77f6433c5d40ad448cad1/)).

ZIP `forn00bies.zip` → PE32 console MinGW (`original/_u/level-{0,1,2,3}.exe` + `msvcrt.dll`).

| Fichier | Rôle |
|---|---|
| [`original/forn00bies.zip`](original/forn00bies.zip) | archive d’origine |
| [`original/_u/level-0.exe`](original/_u/level-0.exe) … [`level-3.exe`](original/_u/level-3.exe) | binaires |
| [`tools/forn00bies-solve.py`](tools/forn00bies-solve.py) | soluces + `--check` Wine |

## Réponse

| Level | Entrée | Soluce |
|---|---|---|
| **0** | Password | **`Easy`** |
| **1** | Username / Password | **`petik`** / **`541`** (= somme ASCII) |
| **2** | User Id (`rdtsc`) / Password | keygen 32 octets (préfixe `*`/`O` + base26) |
| **3** | Guess (`scanf %d`) | ex. **`-1879046653`** (`0x90000603`) |

```bash
python3 tools/forn00bies-solve.py -q
python3 tools/forn00bies-solve.py --check
# L0: OK / L1: OK / L2: OK / L3: OK

printf 'Easy\n' | WINEDEBUG=-all wine original/_u/level-0.exe
printf 'petik\n541\n' | WINEDEBUG=-all wine original/_u/level-1.exe
printf '%s\n' -1879046653 | WINEDEBUG=-all wine original/_u/level-3.exe
```

Level 2 : le binaire affiche un **User Id** volatile (`rdtsc`) puis attend le password.  
`forn00bies-solve.py --level 2 --uid <id>` calcule la clé ; `--check` fige l’uid par patch local (hors `original/`).

## Premier regard

- PE32 console, strip PDB, MinGW (`level-N.asm` dans les strings).
- Lancer depuis `original/_u/` (DLL `msvcrt.dll` fournie).
- Banères `Crackme - Level N - by 60²15`.

## Flow / prédicats

### Level 0

Compare les 4 premiers octets du password (dword) à **`Easy`**.

### Level 1

1. `scanf %20s` username → buffer.
2. Somme signée des octets **jusqu’au NUL inclus** (le `0` n’ajoute rien).
3. `scanf %d` password ; égalité avec la somme.

`petik` → `112+101+116+105+107 = 541`.

### Level 2 (keygen)

1. Buffer 32 octets prérempli avec **`O`** (`0x4F`).
2. `User Id = rdtsc` (low 32) dans `ebx`, affiché en `%u`.
3. Préfixe :
   - `[0] = '*'` si bit0 de l’uid ;
   - `[1] = '*'` si `uid <= 0xB16B00B5` ;
   - `[2] = '*'` **toujours** : le `jnp` suit un `inc edi` qui met `edi=0x40D022` (PF pair) — le PF du `cmp` est perdu ;
   - une `'*'` forcée en `[3]` est **écrasée** par la première lettre.
4. 28 lettres (`ecx = 0x1C … 1`) : `shr uid` ; `uid % 26` ; **minuscule** si `ecx` pair, **majuscule** si impair.
5. `[31]` reste **`O`**. Comparaison octet à octet jusqu’au NUL (`scanf %50s`).

### Level 3 (EFLAGS)

Au runtime le format `"%s"` est patché en **`"%d"`** (`mov byte [fmt+1], 'd'`).

Sur le dword lu, chaîne de tests via `pushf` / `bt` :

| Étape | Contrainte |
|---|---|
| `xor eax,0` + PF | parité **paire** de `al` |
| `bt eax,30` | bit30 **clair** |
| `test eax,1` | bit0 **posé** (impair) |
| `shl eax,1` | bit31 **posé** (CF) |
| `add eax, 0x60000000` | **OF** posé |
| `or 0x20000000 ; and 0x70000` | résultat **0** ⇒ bits 15–17 de l’uid clairs |
| popcount → `xor` avec `[buf+1]` | byte1 == `popcount(uid)` |

Exemple : `0x90000603` → décimal signé **`-1879046653`** (ou unsigned `2415920643`, Wine accepte les deux).

## Vérification

```bash
python3 tools/forn00bies-solve.py --check
```

Reverse : **objdump + Wine** (pas de debugger).

## Notes

- Level 4 = challenge séparé [`5ab77f6433c5d40ad448cad1`](../5ab77f6433c5d40ad448cad1/).
- Solutions site (PDF aldeid) peu exploitables ; L0 « Easy » confirmé live.
- Piège L2 : croire que le 3ᵉ `*` dépend de la parité du `cmp` — en pratique c’est l’`inc edi`.
