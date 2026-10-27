# crackmes.de's abcds_2nd_innings (`crackme.exe`) by abcd

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3b4`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3b4) |
| **Auteur (site)** | crackmes.de (abcd) |
| **Plateforme** | Windows PE32 console, MinGW (C++/libstdc++ statique) |
| **SHA-256 (zip)** | `5f022faa3d121172ef50642f5befc0331fd4acd8c5ddfc3078a47f63c7e4c8f2` |
| **SHA-256 (`crackme.exe`)** | `ec4ee2a205f1ce170fb10f814dcf9d65a5939054256e35a50bf41060daf3bec0` |

Voir [`ORIGIN.yml`](ORIGIN.yml). ZIP password : `crackmes.one`.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (non modifiée) |
| `analysis/x/crackme.exe` | exe extrait (`unzip -P crackmes.one`) |
| `analysis/crackme.asm` | `objdump -d -M intel` complet |
| `tools/abcds-2nd-innings-solve.py` | keygen username → password, `-q`, `--check` |

## Réponse

Le password est de la forme **`L` + `x` + `R`** (`L`, `R` de même longueur `n`, `L` sans `x`) et le username doit faire **exactement `2n` caractères, `n ≥ 4`**. `petik` seul (5 car.) est refusé (`len ≤ 7` → `Wrong!`), le solveur le complète.

| Username | Password | Résultat |
|---|---|---|
| `petik?@_~!#$%&` | `!!.Ws!bxkC~~~H~` | `Congrats!` |
| `petik?@_~!#$%&` | `!!.Ws!bxkC~~~I~` | `Wrong!` |
| `petik` | (n'importe lequel) | `Wrong!` |

```bash
python3 -I tools/abcds-2nd-innings-solve.py                    # petik?@_~!#$%& / !!.Ws!bxkC~~~H~
python3 -I tools/abcds-2nd-innings-solve.py --user petik -q
python3 -I tools/abcds-2nd-innings-solve.py --check 'petik?@_~!#$%&' '!!.Ws!bxkC~~~H~'   # OK
```

## Premier regard

```text
$ file crackme.exe → PE32 executable (console), Intel i386, 5 sections
$ diec crackme.exe → Compiler: MinGW
$ strings -n 4 …   → rien d'utile (seulement libstdc++) : les messages sont construits caractère par caractère
$ xvfb-run -a wine crackme.exe </dev/null → « Username: Pwd: Wrong! »
```

Tout le code utile est dans `_main` @ `0x401390` (`objdump -d -M intel`, `analysis/crackme.asm` l.306…). Aucune chaîne « Congrats » / « Wrong » en clair : chaque lettre est un `push imm` vers `operator<<(ostream&, char)` @ `0x43d258` (ex. `0x57 0x72 0x6f 0x6e 0x67 0x21` = `Wrong!`, `0x43 0x6f 0x6e 0x67 0x72 0x61 0x74 0x73 0x21` @ `0x401f56` = `Congrats!`).

## Flow

1. **Table `T[7]`** (`ebp-0x58`) : boucle `i = 0x20..0x7c` qui garde les `i` ∈ {`U`,`s`,`e`,`r`,`n`,`a`,`m`} (cmp @`0x4014a2…0x4014c6`) → `T = [U a e m n r s]` (ordre ASCII croissant). Le prompt `Username: ` est affiché à partir de `T`.
2. `cin >> user` (string `ebp-0xc8`).
3. Cinq `srand(seed); rand() - k` successifs écrasent `T[0..4]` et impriment `Pwd: ` :

   | seed | opération | char imprimé | valeur `T[j]` |
   |---|---|---|---|
   | 13 | `rand()-1` | `P` | `T[0]` = 80 |
   | 25 | `rand()-1` | `w` | `T[1]` |
   | 19 | `rand()` | `d` | `T[2]` |
   | 6 | `rand()` | `:` | `T[3]` |
   | 0 | `rand()-6` | ` ` | `T[4]` = 32 |

   `T[5]='r'`, `T[6]='s'` restent. `rand` MSVCRT = `s = s*214013+2531011 ; (s>>16)&0x7fff`. Les `T[j]` sont utilisés comme **int complets** (pas tronqués à l'octet) dans la suite — c'est le piège : on ne peut pas se contenter de `ord('P')`, etc.
4. `cin >> pwd` ; `x = pwd.find('x')` (`0x401690` `find(char 0x78)`).
5. Rejets (`Wrong!` + `exit(0)`) : `len(user) ≤ 7` (cmp @`0x4016d7`, `ja`), `x == npos` (@`0x40174c`), `len(user) < x` (@`0x4018ae`).
6. Découpe (`substr`) : `A = pwd[:x]` (`ebp-0xe8`), `B = pwd[x+1:]` (`ebp-0xf8`), `C = user[:x]` (`ebp-0x108`), `D = user[x:]` (`ebp-0x118`).
7. Tailles : `|A| == |B|` (@`0x401ba7`) et `|A| == |D|` (@`0x401bd5`). Comme `|A| = x`, on en déduit **`|user| = 2x`** et `|B| = x`.
8. `A.swap(D)` (@`0x401bf4`) : `A` = queue du username, `D` = partie gauche du password (appelons-la `L`, et `R = B`).
9. Boucle 1 (`0x401c00…0x401e5c`, `i = 0..n-1`).
10. Boucle 2 (`0x401e68…0x401f27`) : inversion de `A` (`swap A[i], A[n-1-i]`).
11. `A == B` (`operator==` @`0x43ced8`) → `Congrats!` (@`0x401f56`), sinon `Wrong!` (@`0x401ff6`).

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel analysis/x/crackme.exe` ; `_main` = `0x401390`, les 6 `call 42f4d0 <std::string::string()>` créent les 6 strings, puis le fil est linéaire. Le code est compilé par g++ 3.x/SjLj (nombreux `mov [ebp-0x168], n` = états d'unwinding et blocs `0x401a22…0x402233` = landing pads : **à ignorer**, ce n'est que du nettoyage d'exceptions).

**Boucle 1** — transformation du caractère `A[i]` (= `user[n+i]`) :

```asm
401c51  movsx eax, BYTE PTR [eax]     ; c = A[i]
401c54  shl   eax, 4                  ; c << 4
401c5d  mov   [edx], al               ; A[i] = (char)(c<<4)       → octet signé
401c74  cmp   BYTE PTR [eax], 0
401c77  jns   401cb6
401cac  neg   al                      ; si négatif : A[i] = -A[i] (octet)
401cc2..401cdf  imul 0x92492493 ... shl 3 ; sub   ; → k = i % 7 (réduction de force : x*7 = (x<<3)-x)
401d11  add   ecx, [ebp+edx*4-0x58]   ; v = (signed char)A[i] + T[k]
401d15  imul  0x81020409 ; sar 6      ; q = v / 127
401d49  shl   eax,7 ; sub eax,edx     ; q*127
401d4e  sub   ecx,eax                 ; r = v - 127*q  (= v % 127)
401d62  cmp   [..],0x1f ; jg 401d83   ; si r <= 31 : r += 0x20
401dae  mov   [edx], al               ; A[i] = (char)r
```

Donc `A[i] = f(D_user[i], i)` avec `f(c,i)` : `b = signed((c<<4)&0xff)` ; `si b<0 : b = signed(-b)` ; `r = (b + T[i%7]) % 127` (division C tronquée) ; `si r ≤ 31 : r += 32`.

Puis, dans la même boucle (`0x401dc0…0x401e55`), `B[i] = (C[i] + B[i] + L[i]) / 3` (`movsx` ×3, `add`, `imul 0x55555556` = division signée par 3) avec `C = user[:n]`, `L` = ex-`D` = `pwd[:n]`.

**Boucle 2** inverse `A`. Condition finale `A == B` :

```
f(user[n+(n-1-i)], n-1-i)  ==  (user[i] + R[i] + L[i]) / 3     pour i = 0..n-1
```

**Assemblage de la réponse (keygen)** : on choisit `user` de longueur `2n` ; pour chaque `i`, la cible `t[i] = f(user[2n-1-i], n-1-i)` est connue. Il faut `L[i] + R[i] ∈ [3·t[i] - user[i], 3·t[i] - user[i] + 2]` (division entière) : on prend deux caractères imprimables (33..126), `L[i] ≠ 'x'` (sinon `find` s'arrête plus tôt) et pas d'espace (`cin >>`). Le solveur remplit `petik` + padding (`?@_~!#$%&`) puis essaie des paddings/longueurs différents jusqu'à ce que tous les `i` aient une solution ; il valide avec une réimplémentation exacte du prédicat (`check`).

Exemple `petik` → username `petik?@_~!#$%&` (14 car., `n = 7`), password `!!.Ws!b` + `x` + `kC~~~H~`.

**Pièges** : (1) messages jamais en clair (`strings` inutile) ; (2) `T[0..4]` écrasés par `rand()` : il faut reproduire la LCG MSVCRT (Wine l'implémente à l'identique) ; (3) octets signés (`movsx`, `neg al`) et divisions `/127`, `/3` par magic numbers (signés, tronquées vers 0) ; (4) `find('x')` : le 1er `x` coupe, donc `L` ne doit pas en contenir ; (5) la contrainte `|user| = 2x` n'apparaît qu'en combinant les deux tests de taille et le `swap`.

## Vérification

Binaire d'origine (extrait de `original/crackme.zip`), sous Wine :

```bash
cd analysis/x
printf 'petik?@_~!#$%%&\n!!.Ws!bxkC~~~H~\n' | xvfb-run -a wine crackme.exe
# Username: Pwd: Congrats!
printf 'petik?@_~!#$%%&\nAAAAAAAAAAAAAAA\n' | xvfb-run -a wine crackme.exe   # mauvais mot de passe
# Username: Pwd: Wrong!
printf 'petik\n!!.Ws!bxkC~~~H~\n' | xvfb-run -a wine crackme.exe             # username trop court
# Username: Pwd: Wrong!
```

## Notes

- Analyse 100 % statique (`objdump`) + preuve Wine ; GDB / x64dbg / IDA MCP non utilisés, donc pas de section « Debug GDB ».
- Le crackme est la suite (« 2nd innings ») de `lil_crackme` du même auteur (`5ab77f5833c5d40ad448c3b3`), même style d'obfuscation (messages lettre par lettre) mais sans fichier `kernel32.dll` ni registre.
- Il existe une infinité de couples valides (la division par 3 laisse 3 sommes possibles par position).
