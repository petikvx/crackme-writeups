# n0sync_'s Complex

| | |
|---|---|
| **ID** | [`69435e300992a052ab222402`](https://crackmes.one/crackme/69435e300992a052ab222402) · [ORIGIN.yml](ORIGIN.yml) |
| **Auteur** | n0sync_ |
| **Plateforme** | Windows PE64 console, C++ (MinGW-w64, GCC 15.2, symboles COFF + DWARF présents) |
| **SHA-256** (`original/download.bin`) | `fe33e39f80f7c36f81baf1db67b8323a5cb3f5b9255f62e9b20181ac12b4c62d` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | en fait un **ZIP** (mdp `crackmes.one`) contenant `untitled1.exe` |
| `analysis/extract/untitled1.exe` | exe extrait (copie de travail) |
| `tools/n0sync-complex-solve.py` | solveur + `--check` (émulation Unicorn) |

## Réponse

Le programme demande deux nombres complexes (`std::complex<double>`) sur stdin :

| Prompt | Saisie |
|---|---|
| `Enter something:` | **`(1,1.1)`** |
| `Enter something again:` | **`(11,1.1)`** |

```bash
python3 tools/n0sync-complex-solve.py        # affiche les 2 entrées
python3 tools/n0sync-complex-solve.py -q     # une par ligne
python3 tools/n0sync-complex-solve.py --check
```

Pas de username dans ce challenge (donc pas d'exemple `petik`).

## Premier regard

- `original/download.bin` commence par `PK` : `unzip -P crackmes.one original/download.bin -d analysis/extract` → `untitled1.exe`.
- `objdump -x` : PE32+, `main.cpp` dans la table de symboles, noms C++ non strippés (`_Z3funv`, `_Z4efunv`), import `operator>>(istream&, complex<double>&)`.
- `strings` : `Enter something: `, `you got something`, `that didn't worked.try again`, `Enter something again: `, `Congratulations!,`, `try again`.

## Flow

`main` (`0x140002870`) → `__main` → `fun()` (`0x1400014F0`) :

1. affiche `Enter something: `, lit un `complex<double>` ;
2. si OK → `you got something` puis appelle `efun()` (`0x140001450`) ;
3. `efun()` : `Enter something again: `, lit un second complexe ; si OK → `Congratulations!,`.

## Comment on trouve

Ancrage : `objdump -d -M intel untitled1.exe --start-address=0x140001450 --stop-address=0x140001590`.

`fun()` après l'appel à `operator>>` (le complexe est sur la pile en `[rsp+0x20]` = re, `[rsp+0x28]` = im) :

```asm
movsd  xmm0,[rip+0x2b5d]      ; 0x140004090 -> 1.0
ucomisd xmm0,[rsp+0x20]       ; re == 1.0 ?
jp/jne  fail
movsd  xmm0,[rip+0x2b43]      ; 0x140004088 -> 1.1
ucomisd xmm0,[rsp+0x28]       ; im == 1.1 ?
jp/jne  fail
```

`efun()` est identique mais compare la partie réelle à la constante `0x140004080`.

Décodage des constantes dans `.rdata` (VA `0x140004000` = offset fichier `0x2200`) :

| VA | octets LE | double |
|---|---|---|
| `0x140004080` | `00 00 00 00 00 00 26 40` | `11.0` |
| `0x140004088` | `9a 99 99 99 99 99 f1 3f` | `1.1` |
| `0x140004090` | `00 00 00 00 00 00 f0 3f` | `1.0` |

Donc entrée 1 = `1.0 + 1.1i`, entrée 2 = `11.0 + 1.1i`.

Format de saisie : `operator>>` de libstdc++ accepte `re`, `(re)` ou `(re,im)` ; il faut donc la forme `(re,im)` pour fixer la partie imaginaire. Piège : `1.1` n'est pas exactement représentable, mais l'égalité `ucomisd` compare au même double (`0x3FF199999999999A`) que produit `strtod("1.1")`.

## Vérification

Ni Wine ni GDB ne sont disponibles dans l'environnement de résolution : le binaire **n'a pas été exécuté nativement**. La preuve est une émulation Unicorn du code x86-64 réel de `fun()`/`efun()` (le PE est mappé tel quel ; seuls `cin >> complex` et `cout <<` sont interceptés par des stubs Python, le parsing du complexe étant réimplémenté). Sortie de `--check` :

```
OK     ['(1,1.1)', '(11,1.1)'] -> Enter something: / you got something / Enter something again: / Congratulations!,
KO 1re ['(1,1)']               -> Enter something: / that didn't worked.try again
KO 2e  ['(1,1.1)', '(1,1.1)']  -> ... you got something / Enter something again: / try again
```

Preuve live à refaire avec Wine : `printf '(1,1.1)\n(11,1.1)\n' | xvfb-run -a wine analysis/extract/untitled1.exe`.

## Notes

- Aucune obfuscation ; le « Complex » du titre = `std::complex`.
- Section GDB non écrite : GDB n'a pas été utilisé.
