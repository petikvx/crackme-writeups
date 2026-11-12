# DonCris's Existential Vending Machine

| | |
|---|---|
| **ID** | [`696280f08cfebaa7f00e32b0`](https://crackmes.one/crackme/696280f08cfebaa7f00e32b0) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | DonCris |
| **Plateforme** | Windows PE32+ x86-64, C++ MinGW-w64 (GCC 15.1, ucrt), console, non strippé |
| **SHA-256** (`original/download.bin`, ZIP) | `b604f5840512560b22f433f8e66a30cd1547903419dfe9c4527c1f8d89181e3e` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`) contenant `existential_vending.exe` |
| `analysis/x/existential_vending.exe` | exe extrait du ZIP (copie de travail, `original/` intact) |
| `tools/existential-vending-solve.py` | keygen + `--check` (émulation unicorn du vrai code du PE) |

## Réponse

Le programme demande un **nom**, puis un **code d'accès** dérivé du nom :

```
weight = 13 * sum(octets du nom) + 7
code   = (weight XOR 0xFACE) - 0x7B        (int32 signé étendu en int64)
```

| Nom | weight | Code d'accès |
|---|---|---|
| `petik` | 7040 | **`57555`** |
| `a` | 1268 | `64959` |

```bash
python3 tools/existential-vending-solve.py --user petik      # -> 57555
python3 tools/existential-vending-solve.py -q --user petik   # 57555 seul
python3 tools/existential-vending-solve.py --check           # émule le PE
```

## Premier regard

```bash
unzip -P crackmes.one original/download.bin -d analysis/x   # (ou zipfile Python)
objdump -f analysis/x/existential_vending.exe                # pei-x86-64, symboles COFF présents
strings -n 6 analysis/x/existential_vending.exe | head -60
```

`strings` donne l'ASCII-art de la machine, `[ENTER YOUR NAME]`, `DETECTED SOUL WEIGHT:`,
`[ENTER ACCESS CODE]`, `ACCESS GRANTED!` / `ACCESS DENIED!`. Le hint « *or just basic math* »
annonce un calcul arithmétique pur. Le binaire garde ses symboles : `objdump -t` / `-d`
montre directement `main` (`0x140001867`) et `calculate_soul_weight(std::string const&)`
(`0x1400017cd`, nom C++ mangé `_Z21calculate_soul_weight…`).

## Flow

1. `print_machine`, puis bannière affichée caractère par caractère (`slow_print`, délais — pur décor).
2. `std::getline(cin, name)` ; nom vide → « VOID IDENTIFIED » et sortie.
3. `w = calculate_soul_weight(name)` ; affichage de « DETECTED SOUL WEIGHT: w cosmic units » (**le poids est donc affiché**, on le voit même sans reverse).
4. `cin >> long long code` ; échec de parsing → « INVALID INPUT ».
5. `expected = (int64)((w ^ 0xFACE) - 0x7B)` ; `code == expected` → `ACCESS GRANTED!`, sinon `ACCESS DENIED! Required Code was not: <code>`.

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --no-show-raw-insn existential_vending.exe --start-address=0x1400017cd --stop-address=0x140001867` (fonction nommée grâce aux symboles), puis `main` à `0x140001867`.

**`calculate_soul_weight`** : la boucle `begin()/end()` (0x14000180a–0x14000184e) fait
`movsx eax, BYTE PTR [rax]` puis `add [rbp-4], eax` → somme des octets (signés, `char`). Le
epilogue est de la réduction de force du compilateur :

```asm
mov  edx,[rbp-4]        ; edx = s
mov  eax,edx
add  eax,eax            ; 2s
add  eax,edx            ; 3s
shl  eax,2              ; 12s
add  eax,edx            ; 13s
add  eax,7              ; 13s + 7
```

**`main`** à `0x140001c29` :

```asm
mov  [rbp+0x228],0xface
mov  [rbp+0x224],0x7b
mov  eax,[rbp+0x22c]    ; w
xor  eax,[rbp+0x228]    ; w ^ 0xface
sub  eax,[rbp+0x224]    ; - 0x7b
cdqe                    ; sign-extend vers int64
mov  [rbp+0x218],rax    ; expected
...
mov  rax,[rbp-0x58]     ; code saisi (long long)
cmp  [rbp+0x218],rax
jne  denied (0x140001dda)
```

**Exemple `petik`** : `p=0x70(112) e=101 t=116 i=105 k=107` → somme `541` ; `13*541+7 = 7040` (`0x1B80`) ;
`0x1B80 ^ 0xFACE = 0xE14E` ; `0xE14E - 0x7B = 0xE0D3 = 57555`.

**Pièges** : le résultat est converti en int64 via `cdqe` (signé) — pour des noms où le résultat 32 bits
serait ≥ 2³¹ il faudrait taper la valeur négative ; le keygen gère ce cas. Les `slow_print` ralentissent
l'exécution mais ne participent pas au prédicat. Le « Required Code was not » affiche le code *saisi*, pas l'attendu.

## Vérification

- Pas de `gdb`, `wine` ni `diec` disponibles sur la machine de résolution : **pas de session GDB, pas d'exécution Wine** (donc pas de section Debug GDB, pas de screenshot).
- Preuve : `python3 tools/existential-vending-solve.py --check` charge `.text` du PE d'origine dans **unicorn**,
  exécute réellement `calculate_soul_weight` (avec une `std::string` SSO forgée en mémoire) puis le bloc
  `xor/sub/cdqe` de `main` (`0x140001c29`→`0x140001c58`) et compare avec la formule Python :

```
[check] binaire: weight=7040 code=57555 | python: weight=7040 code=57555 -> OK     (petik)
[check] binaire: weight=1268 code=64959 | python: weight=1268 code=64959 -> OK     (a)
[check] binaire: weight=4102 code=59981 | python: weight=4102 code=59981 -> OK     (Zz~é, octets non-ASCII/signés)
```

- Cas KO : tout autre code (ex. `1234` pour `petik`) fait diverger le `cmp` (`jne` → `ACCESS DENIED!`) — la comparaison finale
  est un `cmp` d'entiers 64 bits, non émulé mais trivial à lire.
- Limite honnête : le jeu complet console n'a pas été exécuté sous Wine ici.

## Notes

- Aucun anti-debug, aucun packer ; tout le challenge est la formule ci-dessus.
- Le poids affiché par le programme permet même de retrouver le code sans lire le binaire : `(w ^ 0xFACE) - 123`.
