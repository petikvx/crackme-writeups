# BadEngineer's BeginnerFriendly

| | |
|---|---|
| **ID** | [`69523463044ecfaf9923f9c5`](https://crackmes.one/crackme/69523463044ecfaf9923f9c5) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | BadEngineer (`badengineer`) |
| **Plateforme** | Windows PE32 x86, console, MinGW GCC 6.3.0 (symboles non strippés) |
| **SHA-256** (`original/download.bin`, c'est le ZIP) | `a5a23f290cffeba62c93a35396cd70528e3511b1fea43ae4e67b001e753debe3` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (mot de passe `crackmes.one`) contenant `beginnerfriendly.exe` — non modifié |
| `tools/beginnerfriendly-solve.py` | keygen (préfixe → mot de passe valide) |
| `tools/beginnerfriendly-emu.py` | preuve par émulation unicorn de `main` (pas de Wine sur la machine) |

## Réponse

Tout mot de passe de **≤ 16 caractères dont la somme des codes ASCII vaut 0x4d8 = 1240**.

| Préfixe | Mot de passe |
|---|---|
| `petik` | **`petikuuuttt`** (len 11, somme 1240) |

```bash
python3 tools/beginnerfriendly-solve.py            # petik -> petikuuuttt
python3 tools/beginnerfriendly-solve.py -q --prefix petik
```

## Premier regard

```bash
unzip -P crackmes.one original/download.bin -d /tmp/bf     # -> beginnerfriendly.exe (49 338 o)
objdump -f /tmp/bf/beginnerfriendly.exe                    # pei-i386, symboles présents
strings -n 4 /tmp/bf/beginnerfriendly.exe
```

Chaînes utiles : `Stop using debugger`, `Please enter your password!`, `%63s`,
`Try something smaller!`, `Wrong Password!`, `Congrats!`. Attention : `original/download.bin`
n'est pas le PE mais un ZIP (le SHA-256 de l'index est celui du ZIP).

## Flow

`main` (0x40146d) : `IsDebuggerPresent` → « Stop using debugger » ; `puts` invite ; `scanf("%63s")` ;
`strlen > 16` → « Try something smaller! » ; somme des octets ; `== 0x4d8` → « Congrats! » sinon « Wrong Password! ».

## Comment on trouve

Ancrage : binaire non strippé, `objdump -d -M intel --start-address=0x401460 --stop-address=0x401560`
donne directement `_CheckDebugger` et `_main`.

```asm
401466  call IsDebuggerPresent          ; _CheckDebugger (0x401460)
4014c1  call strlen                     ; buffer en [esp+0x14]
4014c6  cmp  eax,0x10 / jbe 4014de      ; len <= 16 sinon "Try something smaller!"
4014de  mov  [esp+0x5c],0               ; sum = 0
4014e6  mov  [esp+0x58],0               ; i = 0
4014f0  ...movsx eax,BYTE PTR [buf+i]   ; (signed char)
401508  add  [esp+0x5c],eax             ; sum += buf[i]
401525  ja   4014f0                     ; while (strlen(buf) > i)
401527  cmp  [esp+0x5c],0x4d8           ; sum == 1240 ?
40152f  je   40153f                     ; -> "Congrats!"
```

Le prédicat est donc `len ≤ 16 ∧ Σ buf[i] = 1240` : la contrainte est très lâche (moyenne ≈ 77–124 par
char, soit des caractères imprimables courants). Aucune notion d'ordre, donc des milliers de solutions.

Assemblage de `petik` : p=112, e=101, t=116, i=105, k=107 → 541 ; reste 1240−541 = 699 à répartir sur
6 caractères (limite 16 : on prend le plus petit nombre de chars de remplissage possible, ici 6 car
5×126 < 699) → 699 = 6×116 + 3 → `ttt` (116) + `uuu` (117) → `petik` + `uuuttt` = `petikuuuttt`.
(Le solveur répartit `divmod(reste, k)` sur k caractères imprimables.)

Pièges : `IsDebuggerPresent` (le check anti-debug ne gêne pas hors debugger) ; la longueur est testée
avec `jbe` (non signé, 16 inclus) ; `scanf("%63s")` dans un buffer plus petit que 64 octets (pile de 0x60) —
hors sujet ici, mais explique le « Try something smaller! » ; pas de GDB utilisé (reverse statique).

## Vérification

Pas de Wine sur la machine : preuve par émulation unicorn de `main` du vrai exe (imports `puts`,
`scanf`, `strlen`, `IsDebuggerPresent` hookés, code du binaire exécuté tel quel).

```bash
unzip -P crackmes.one original/download.bin -d /tmp/bf
python3 tools/beginnerfriendly-emu.py /tmp/bf/beginnerfriendly.exe petikuuuttt
```

| Entrée | Sortie |
|---|---|
| `petikuuuttt` | `Congrats!` ✅ |
| `petik` (somme 541) | `Wrong Password!` |
| `zzzzzzzzzzzzzzzz` (16 chars, somme 1952) | `Wrong Password!` |
| `aaaa…` (31 chars) | `Try something smaller!` |

## Notes

- Le crackme ne compare à aucun secret : c'est une simple contrainte de somme (très « beginner friendly »).
- Équivalent live : sous Windows/Wine, entrer `petikuuuttt` doit afficher `Congrats!` (non exécuté ici, Wine absent).
