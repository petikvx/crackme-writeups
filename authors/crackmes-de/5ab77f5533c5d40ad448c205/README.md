# ribbere_1.4 by bswap (crackmes.de)

« Ribbere 1.4 » de Bswap (Hollande, 2008), « 100% written in ASM, not packed or really protected ». Goal : *try to make a key generator*.

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c205> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM 6.14, non packé, code « overlapping jumps ») — difficulté 2.0
- **Archive** : `original/Ribbere_1.4.zip` → `Ribbere 1.4/Ribbere 1.4.exe` + `NFO.txt`
- **SHA-256 zip** : `b9e4bc74d4fff78f0085d3f1be2561a398f39b1017ced743a24332faf8cbe665`
- **Statut** : résolu (keymaker), vérifié **sous wine/Xvfb** sur le binaire original : titre « Ribbere 1.4 (Registered) »

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Ribbere 1.4/Ribbere 1.4.exe` | binaire d’origine (non patché) |
| `tools/ribbere14-solve.py` | keymaker + `--check` (réimplémentation du check) |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + xdotool (saisie + clic « Register ») |
| `analysis/registered-petiki7mo.png` | capture OK |
| `analysis/ko-petik.png` | capture KO (`petik` seul) |

## Réponse

Un seul champ (« Enter your Key », contrôle `0xC9`) : la clé se valide **elle-même** (pas de couple nom/serial).
Le keymaker part d’un préfixe de 5 caractères (exemple **`petik`**) et calcule les 4 suivants :

| Préfixe | Clé valide |
|---|---|
| `petik` | **`petiki7mo`** (aussi `petikixmo`) |
| `petik` seul | KO |

```
$ python3 tools/ribbere14-solve.py
Name   = petik
Valide = petiki7mo
$ python3 tools/ribbere14-solve.py --check petik
KO
```

## Premier regard

```
$ file "original/Ribbere 1.4/Ribbere 1.4.exe"
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
$ diec …  → MASM 6.14 / MASM32, Microsoft Linker 5.12
```

- Même squelette que [morgana_1.49](../5ab77f5533c5d40ad448c204/) (même auteur) : DlgProc, boutons `0x12D` About /
  `0x12E` Register / `0x12F` Exit, chaînes de registre `Software\Keyg\Your Key` **inutilisées** (pas d’`advapi32`).
- Chaîne utile : « Your name must be at least one byte! » (seul contrôle d’erreur).

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel` + IAT (`pefile`) → seul `GetDlgItemTextA` (thunk `0x401c9c`) à `0x40149e`,
   dans la branche `cmp [ebp+0x10], 0x12e` (`0x401411`).

2. **Piège : désassemblage linéaire faux** après `0x4014fe`. L’auteur intercale des `jmp $+4` suivis de 2 octets
   poubelle (`eb 02 xx xx`), et `objdump` part en vrille (`adc al, [eax]`, `add [edx-0x15], dl`…). On suit le flux
   avec **capstone** en suivant chaque `jmp` (petit script Python : `disasm` à l’adresse cible à chaque saut) :

   ```asm
   4014a3 cmp eax, 1 / jge 0x4014fe        ; longueur >= 1, sinon MessageBox « Your name must be… »
   401502 push eax
   401507 call 0x40195a                    ; transforme le buffer → table 0x40334b
   401510 mov  edx, 1
   401523 mov  eax, [edx+0x40334b]         ; dword out[1..4]
   40152d add  edx, 4
   401534 mov  ebx, [edx+0x40334b]         ; dword out[5..8]
   40153f sub  eax, ebx
   401545 or   eax, eax / jne 0x401598     ; différent → rien
   40154d …EnableWindow / WM_SETTEXT « Ribbere 1.4 (Registered) »
   ```

   (La boucle `shrd dx, ax, 3` en `0x401462` qui remplit `0x40334b` **avant** la lecture est du bruit : la table est
   écrasée juste après par `0x40195a`.)

3. **`0x40195a`** : 16 tours, `ecx` = compteur `loop` (16 → 1), `out[i] = f(n[i], ecx)` écrit en `dword` à `edi`
   puis `edi++` (donc seul l’octet bas reste à chaque position) :

   ```asm
   mov esi, 0x40332c / mov edi, 0x40334b / mov ecx, 0x10
   l: movzx eax, byte [esi] / push ecx / push eax / call 0x40197e
      mov [edi], eax / inc edi / inc esi / loop l
   ```

4. **`0x40197e`** : un gros bloc de calcul **mort** (`mul`, `xchg`, constantes `0x2ef3a2d1`…) dont le résultat est
   écrasé par `mov eax, [ebp+8]`. Ce qui compte :

   ```asm
   mov eax, [ebp+8]     ; c
   add eax, ecx         ; + k (compteur loop)
   cmp eax, 0x21 / jae  ; < 0x21 → += 0x21
   cmp eax, 0x7b / jle  ; > 0x7b → >>= 1
   ```

   → `g(c, k)` ; pour l’octet d’indice `i`, `k = 16 - i`.

5. **Assemblage** : il faut `g(n[i], 16-i) == g(n[i+4], 12-i)` pour `i = 1..4`. Hors cas limites,
   `n[i+4] = n[i] + 4`. Exemple `petik` (`n[1..4] = e t i k`) :

   | i | n[i] | g(n[i], 16-i) | n[i+4] trouvé | g(n[i+4], 12-i) |
   |---|---|---|---|---|
   | 1 | `e` 0x65 | 0x65+15 = 0x74 | `i` 0x69 | 0x69+11 = 0x74 |
   | 2 | `t` 0x74 | 0x74+14 = 0x82 > 0x7B → **0x41** | `7` 0x37 | 0x37+10 = 0x41 |
   | 3 | `i` 0x69 | 0x69+13 = 0x76 | `m` 0x6D | 0x6D+9 = 0x76 |
   | 4 | `k` 0x6B | 0x6B+12 = 0x77 | `o` 0x6F | 0x6F+8 = 0x77 |

   → **`petiki7mo`** (le keymaker prend le plus petit caractère imprimable ; `x` marchait aussi en position 6 :
   0x78+10 = 0x82 → 0x41, d’où `petikixmo`). `n[0]` n’intervient pas.

## Prédicat consolidé

```
g(c, k) = c + k ; if < 0x21: += 0x21 ; if > 0x7B: >>= 1
1 <= len(n) ; n complété par des 0 ; pour i in 1..4 : g(n[i], 16-i) == g(n[i+4], 12-i)
```

## Vérification

```
$ tools/verify-wine.sh petiki7mo analysis/registered-petiki7mo.png
titre: Ribbere 1.4 (Registered)
$ tools/verify-wine.sh petikixmo
titre: Ribbere 1.4 (Registered)
$ tools/verify-wine.sh petik analysis/ko-petik.png
titre: Ribbere 1.4 (Unregistered)
```

- **Live** : binaire original sous wine + Xvfb (2026-10-12), saisie et clic `xdotool`.
  OK : [`analysis/registered-petiki7mo.png`](analysis/registered-petiki7mo.png) · KO : [`analysis/ko-petik.png`](analysis/ko-petik.png).
- Solveur : `keygen()` testé sur 2 000 préfixes aléatoires (tous `check()` OK).

## Notes

- Pas de GDB : reverse statique (objdump + capstone pour suivre les sauts obfusqués) + preuve wine.
- Une clé de moins de 9 caractères est complétée par des `0` (`g(0, k) = k + 0x21`) : il faudrait alors
  `n[i] = 0x1D` (non imprimable), donc en pratique une clé valide tapée au clavier fait au moins 9 caractères.
