# kcgaming's very simple keycheck

| | |
|---|---|
| **ID** | [`6a503f2ab1e3022155040e63`](https://crackmes.one/crackme/6a503f2ab1e3022155040e63) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | kcgaming |
| **Plateforme** | Windows PE64 console, MinGW-w64 / C++ (libstdc++) |
| **SHA-256** (`original/download.bin`) | `5b45d19e6e58e3dcc335490388cd436d718fdcae9ae7b2261e8571f22979608d` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (chiffré, mot de passe `crackmes.one`) contenant `password.exe` |
| `analysis/password.exe` | PE extrait du ZIP (non modifié) |
| `tools/kcgaming-keycheck-solve.py` | solveur + `--check` (émulation unicorn de `checkPassword`) |

## Réponse

**Nombre à saisir : `1234`** (`0x4d2`) — pas de username, donc pas d'exemple `petik`.

```bash
python3 tools/kcgaming-keycheck-solve.py        # Password: 1234  (0x4d2)
python3 tools/kcgaming-keycheck-solve.py -q     # 1234
python3 tools/kcgaming-keycheck-solve.py --check --exe analysis/password.exe
```

## Premier regard

- `original/download.bin` n'est pas un exe : c'est un ZIP chiffré (`PK\x03\x04`).
  Extraction : `python3 -I -c "import zipfile;zipfile.ZipFile('original/download.bin').extract('password.exe','analysis',pwd=b'crackmes.one')"`.
- `objdump -f` : `pei-x86-64`, entry `0x140001046`, symboles non strippés (MinGW).
- `strings` : `Enter number: `, `Access Granted`, `Access Denied` (+ messages du runtime MinGW) — ce sont les seules chaînes utiles.

## Flow

`main` (`0x140001726`) : affiche `Enter number: ` avec `cout`, lit un `int` avec `cin >> [rbp-4]`, appelle `checkPassword(int)` et affiche `Access Granted` ou `Access Denied` selon le retour. Il vide ensuite `cin` (`ignore`) et attend un `get()` (pause avant fermeture).

## Comment on trouve

Ancrage : symboles C++ non strippés, donc `objdump -d -M intel --no-show-raw-insn password.exe` puis recherche de `<_Z13checkPasswordi>` (nom mangled de `checkPassword(int)`), appelée depuis `main+0x3b` (`call 140001710`).

```asm
140001710 <_Z13checkPasswordi>:
  push rbp
  mov  rbp,rsp
  mov  DWORD PTR [rbp+0x10],ecx   ; argument int (x64 : 1er arg dans ecx)
  cmp  DWORD PTR [rbp+0x10],0x4d2 ; comparaison avec la constante
  sete al                         ; al = (n == 0x4d2)
  movzx eax,al
  pop  rbp
  ret
```

Prédicat : `checkPassword(n) = (n == 0x4d2)`, et `0x4d2 = 4·256 + 13·16 + 2 = 1234`. Aucun calcul, aucune transformation de l'entrée.

Piège : le fichier téléchargé est un ZIP (même avec l'extension `.bin`), à extraire avant d'analyser.

## Vérification

Wine n'est **pas installé** sur la machine d'analyse (`xvfb-run` présent, `wine` absent) : pas de run live du `.exe`. Preuve faite à la place en **émulant la vraie fonction `checkPassword` du PE avec unicorn** (sections mappées, `ecx` = entrée, exécution jusqu'au `ret`) :

```text
$ python3 tools/kcgaming-keycheck-solve.py --check --exe analysis/password.exe
checkPassword(1234) = 1 ; checkPassword(1235) = 0
```

OK (`1234` → vrai → `Access Granted`) et KO (`1235` → faux → `Access Denied`). Pas de GDB utilisé (reverse 100 % statique + émulation).

## Notes

- Le branchement `Access Granted`/`Denied` dans `main` est déduit du désassemblage (`test eax,eax ; setne al ; je`), pas observé en live.
- Rien de piégeux : pas d'anti-debug ni d'obfuscation.
