# awaplay's OBSCURA (`ProjectOfEntrophy1.exe`)

| | |
|---|---|
| **ID** | [`69a0533c0b6d36e727710a87`](https://crackmes.one/crackme/69a0533c0b6d36e727710a87) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | awaplay |
| **Plateforme** | Windows PE64 console (MSVC 2022, C++) |
| **SHA-256** | `d4bbc5387f03d2a329938a40bd9951157256d72d205df1b95a587b42cbecb217` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/ProjectOfEntrophy1.exe` | binaire d'origine (non modifié) |
| `tools/awaplay-solve.py` | solveur (`-q` octets bruts, `--check` preuve sous Wine) |

## Réponse

Pas de login : une **ligne lue par `getline`** (16 octets, dont des caractères de contrôle, car la somme doit rester ≤ 0x100).

| Entrée | Valeur |
|---|---|
| hex | `32311304021114160101101501080102` |
| `t[i]^buf[i]` obtenu | `4H260w44E5x7AteF` (16 octets imprimables) |

```bash
python3 tools/awaplay-solve.py            # affiche ligne + hex
python3 tools/awaplay-solve.py -q | xvfb-run -a wine original/ProjectOfEntrophy1.exe
python3 tools/awaplay-solve.py --check    # preuve automatique
```

Sortie attendue : `[+] SYSTEM STABLE. FREQUENCY MATCHED.`

## Premier regard

- `file` : PE32+ console x86-64, MSVC 19.44 (non packé, non stripé côté CRT).
- Banner `OBSCURA THE ENTROPY COIL v0.1`, prompt `[INPUT_SIGNAL]>`.
- Messages : `Signal too weak.` (entrée < 8 caractères), `[+] SYSTEM STABLE. FREQUENCY MATCHED.` (OK), `[-] ERROR: 0x%llX - SYNC LOST.` (KO). Le nombre affiché dans l'erreur est un état interne **constant** (`0xFFF7FEFFF8DAB42F` sous Wine), pas un hash de la saisie.
- Leurres : `Kernel trap!`, boucle `GetTickCount`-like en `0x140003040`, `Beep` après le succès.

## Flow

`main` = `0x1400038b0` (IDA/MCP indisponibles dans cet environnement : lecture à `objdump -d -M intel`, ancrage par xref sur les chaînes de `.rdata`) :

1. banner, `getline(cin, str)` (`0x140003b70`, délimiteur `\n`) ;
2. `len(str) < 8` → `Signal too weak.` ;
3. `0x140003040(100)` : leurre ;
4. `0x140003150(str)` : transforme la saisie en 16 octets dans `buf` (`0x140041cac`) ;
5. `0x1400036c0()` : compte les `i<16` tels que `t[i]^buf[i]` ∈ [0x20,0x7e] ; **succès si ≥ 10**.

## Comment on trouve

### 1. Le test final (`0x1400036c0`)

```asm
mov BYTE PTR [rsp+0x30],0x57 ...   ; table t[16] = 57 12 33 1b 0e 19 42 5c 10 07 1f 0b 05 48 19 22
movzx eax,BYTE PTR [rsp+rax+0x30]  ; t[i]
xor   eax, BYTE PTR [0x140041cac+i]; ^ buf[i]
cmp al,0x20 / cmp al,0x7e          ; imprimable ?
...
cmp DWORD PTR [rsp+0x40],0xa       ; >= 10 imprimables -> "SYSTEM STABLE"
```

(La boucle interne `j<6` avec `~j == -1 && j == 0` est du bruit : le test n'est exécuté qu'une fois par `i`.)

### 2. Le calcul de `buf` (`0x140003150`)

- `0x140002cf0` fait un `idiv` par 0 volontaire (junk/anti-analyse), `0x140002d50` mélange l'état 64 bits global `S = [0x140041ca0]` (64 tours, lit `PEB->BeingDebugged`, `NtGlobalFlag` (`PEB+0xBC`), `rdtsc`, `sqrt`) ; sans debugger et machine rapide l'état est stable : **`S = 0xFFF7FEFFF8DAB42F`** (valeur lue dans le message d'erreur, identique pour toute saisie).
- `sum` = somme **signée** (`movsx`) des octets de la saisie, `len` = longueur.
- `mode = ((len & 1) << 1) | (sum > 0x100)`.
  - mode 0 ou 2 (`sum ≤ 0x100`) → `0x140003320` (chemin A) ;
  - mode 1 ou 3 (`sum > 0x100`) → chemin B : `rotl32(c,13) ^ S32` par caractère, 4 premiers dwords → `buf`, puis `ror8` par `S % 5` (`0x1400030b0`).

**Chemin B ne peut jamais réussir** : `c < 0x80` ⇒ `c<<13` ne touche que les octets 1-2 du dword, les octets 0 et 3 valent `S32` (constants) ; 8 octets sur 16 sont constants et (après `ror8`) donnent un `t^buf` non imprimable → max 8 imprimables < 10. Un test avec `petik12345`, `AAAAAAAAAAAAAAAA`, `abcdefgh` (tous `sum > 0x100`) donne bien `SYNC LOST` avec le même état.

### 3. Chemin A (`0x140003320` puis `0x1400033d0`)

```text
k[i]  = (S >> (2*i)) & 0xFF                 ; i < 16   (shr rax,cl avec cl = 2*i)
buf[i]= (str[i] if i<len else 0) ^ k[i]
buf[i]= rol8(buf[i],3) ^ H                  ; 0x1400033d0 ; H = octet bas de FNV-1a-64
                                            ; (0xcbf29ce484222325, *0x100000001b3) des 0x60 octets de code à 0x140003320
```

`H` = **0x8B** (checksum du code ⇒ patcher/poser un breakpoint `int3` dans la fonction change `H`, c'est l'anti-tamper). Les positions `i ≥ len` donnent `t[i]^H` : jamais imprimable ⇒ il faut **`len ≥ 10`**.

### 4. Assemblage de la réponse

Pour chaque `i` on cherche `c` tel que `t[i] ^ (rol8(c ^ k[i],3) ^ 0x8B)` soit imprimable (≈ 95 candidats par position, voir le solveur). Contrainte supplémentaire : `sum(c) ≤ 0x100` avec ≥ 10 octets ⇒ impossible avec uniquement des caractères imprimables (10 × 0x20 = 320 > 256) : on mélange donc des octets de contrôle (`0x01`…`0x16`). Le solveur prend le plus petit candidat par position, puis « remonte » en ASCII imprimable tant que le budget de somme le permet (ici sum = 234) et impose des résultats alphanumériques :

```text
ligne = "21" 13 04 02 11 14 16 01 01 10 15 01 08 01 02   (hex 3231 1304 0211 1416 0101 1015 0108 0102)
t^buf = 4H260w44E5x7AteF
```

(Le crackme est volontairement permissif : toute ligne vérifiant ces contraintes passe, pas d'unique solution.)

## Vérification

```bash
$ python3 tools/awaplay-solve.py -q | xvfb-run -a wine original/ProjectOfEntrophy1.exe
[INPUT_SIGNAL]>
[+] SYSTEM STABLE. FREQUENCY MATCHED.          # OK (--check : « wine: OK »)

$ echo petik12345 | xvfb-run -a wine original/ProjectOfEntrophy1.exe
[-] ERROR: 0xFFF7FEFFF8DAB42F - SYNC LOST.     # KO (sum > 0x100 → chemin B)

$ echo abc | xvfb-run -a wine original/ProjectOfEntrophy1.exe
Signal too weak.                                # KO (len < 8)
```

## Notes

- Pas de GDB ni de debug live : reverse statique (`objdump`) + preuve Wine. Les constantes `S` et `H` sont celles observées sans debugger ; sous debugger (`BeingDebugged`/`NtGlobalFlag`/timing `rdtsc`) ou avec un patch dans `0x140003320`, elles changent.
- Pas de username : l'exemple `petik` ne s'applique pas ; `petik12345` sert uniquement de cas KO.
- Le solveur dépend de `S` et `H` calculés sous Wine ; si le binaire s'exécute sur Windows natif avec des valeurs d'état différentes, relire `S` dans le message `SYNC LOST` d'une entrée quelconque et le reporter dans `tools/awaplay-solve.py`.
