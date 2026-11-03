# serialiseme_seasy — SerialMe v1 by d9a (pxor)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3dc`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3dc) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (pxor) — binaire signé « Coded in pure Win32Asm by d9a » |
| **Plateforme** | Windows PE32 GUI (dialogue), asm pur |
| **SHA-256 zip** | `56e28a3a5bccfaaaabfee1345cb3df78094d1dfda7cf47dc1f4567a3b248868b` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/serialme.zip` | archive d'origine (non modifiée) |
| `analysis/extracted/serialme.exe` | exe extrait (SHA-256 `609ba90b…36b2`) |
| `analysis/wine-verification.txt` | sortie du harness Wine (OK + KO) |
| `tools/serialme-solve.py` | keygen / `--check` (émulation de la VM) |
| `tools/wine-harness.c` | harness mingw : lance l'exe, injecte le serial, dumpe les fenêtres |

## Réponse

Pas de nom d'utilisateur : le serial est une simple chaîne de **32 chiffres hexa MAJUSCULES**. Il y en a énormément de valides.

```text
000000001000000220000000A0000000
```

```bash
python3 tools/serialme-solve.py            # serial canonique
python3 tools/serialme-solve.py --random   # un autre serial valide
python3 tools/serialme-solve.py --check 000000001000000220000000A0000000   # OK
```

## Premier regard

- `file` : PE32 GUI i386, 4 sections, imports `DialogBoxParamA`, `SendDlgItemMessageA`, `SetDlgItemTextA`, `MessageBoxA`…
- `strings` n'apprend rien : les textes (« Status: CRACKED », « Good Job :-) »…) sont **obfusqués** dans `.data` (`0x403000..0x4030e9`) ; la routine `0x401423` les déchiffre par `ror` de 1, 2, 3 bits cycliquement (décodés dans le solveur, voir plus bas).
- Le début de `.text` (`0x401000..0x4010a2`) est du code anti-debug/junk (`jmp +1`, accès `dr0-dr7`, handler SEH qui fait `add [ctx+0xb8],2`) : il n'est **jamais exécuté** — l'entry point est `0x4010a3`.

## Flow

1. Entry `0x4010a3` : `and eax,0xff0000` → hInstance (`0x400000`) puis `DialogBoxParamA` avec le dlgproc `0x4010c0`.
2. `WM_COMMAND` (0x111) avec id `0x3E8` (l'edit « Serial », c.-à-d. chaque `EN_CHANGE`) → handler `0x401178`. Pas de bouton « Check » : la vérification est faite **à chaque modification** du texte.
3. Longueur du texte → test obscur (`0x40118e..0x4011a7`) → 32 caractères hexa → 4 dwords → mini-VM de 4 instructions → comparaison de 2 registres virtuels.

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/extracted/serialme.exe`, handler à `0x401178` (id `0x3E8`), table de saut à `0x403399`, données `.data` avec `objdump -s -j .data`.

### 1. La longueur doit passer le filtre (32)

```asm
401187: call SendDlgItemMessageA      ; msg 0xE = WM_GETTEXTLENGTH sur 0x3E8
40118c: mov  edx,eax                  ; edx = len
40118e: and  eax,0x3b
401191: ror  eax,2
401194: xor  ecx,ecx
401196: shrd ecx,eax,0x1f             ; ecx = eax<<1
40119a: and  eax,ecx
40119c: add  eax,ecx
40119e: rol  eax,8
4011a1: or   al,ah
4011a3: rol  eax,cl
4011a5: or   eax,ecx
4011a7: cmp  eax,0x10100010           ; sinon -> 0x401304 (reset)
```

Pour `len = 0x20` : `0x20&0x3b=0x20` → `ror 2` = 8 → `ecx=16` → `8&16=0`, `0+16=16` → `rol 8` = `0x1000` → `or al,ah` = `0x1010` → `rol eax,16` = `0x10100000` → `|16` = `0x10100010` ✔. (Le test est un filtre sur les bits de `len` : en brute-forçant 0..255, passent 32, 34, 36, 38, 96…, mais seuls les 32 premiers caractères sont parsés ; 32 est la longueur « normale ».)

### 2. Parsing hexa

Le texte est relu (`WM_GETTEXT`, msg 0xD) en `0x40313f`, comparé à la copie précédente `0x403160` (si identique → rien à faire), puis chaque groupe de 8 caractères est converti (`'0'-'9'`, `'A'-'F'` **majuscules uniquement** : `cmp al,0x46 / ja` rejette `a-f`) avec `or dl,al ; rol edx,4`, ce qui donne un dword big-endian normal (1er caractère = nibble de poids fort). On obtient 4 dwords à `0x40313f..0x40314e`.

### 3. Mini-VM

```asm
40125e: mov  eax,[edi]      ; dword courant
401263: rol  eax,4
401266: mov  ebx,eax
401268: and  eax,0xf        ; eax = opcode = nibble de poids fort
40126b: and  bl,0xf0
40126e: ror  ebx,4          ; ebx = opérande = dword & 0x0FFFFFFF
401272: jmp  [esi+eax*4]    ; esi = 0x403399, table de 16 handlers
```

Variables (dwords non alignés dans `.data`) lues avec `objdump -s` : `A=[403381]=4444`, `B=[403385]=6912`, `C=[403389]=5678`, `D=[40338d]=1234`, `E=[403391]=0`, `F=[403395]=0`.

Table `0x403399` → handlers (tous terminent par `jmp 0x401275`) :

| opcode | effet |
|---|---|
| `0` | `E = B - A` (= 2468) |
| `2` | `E = B - F` |
| `5`, `7`, `9` | `E = A - B` (= −2468) |
| `1`, `3`, `4`, `6`, `8` | `F = E / opérande` (`div` non signé, ignoré si opérande = 0) |
| `A`..`E` | nop (pointent sur `0x40141e`) |
| `F` | entrée de table = 0 → `jmp 0` → crash |

Test final (`0x401279`) : `E == C (5678)` **et** `F == D (1234)`. Sinon reset de `E`, `F` et du buffer (`0x401304`).

### 4. Assemblage de la réponse

On remarque que `B - D = 6912 - 1234 = 5678 = C` : il suffit donc de finir par `E = B - F` avec `F = 1234`. Il faut d'abord que `F = 1234` : `E = B - A = 2468 = 2 × 1234`, d'où `F = E / 2`.

| mot | opcode | opérande | effet |
|---|---|---|---|
| `00000000` | 0 | – | `E = 2468` |
| `10000002` | 1 | 2 | `F = 2468/2 = 1234` |
| `20000000` | 2 | – | `E = 6912 − 1234 = 5678` |
| `A0000000` | A | – | nop (n'importe quel opcode 10-14, ou 1 avec `/` valide…, **pas** 0/2/5/7/9 qui écrasent `E`) |

Serial = concaténation : `000000001000000220000000A0000000`. Les opérandes des opcodes 0/2/A..E et le mot nop sont libres → 2^28 variantes par mot (`--random`).

### Pièges

- **Piège de l'obfuscation** : `strings` ne montre aucun message, ne pas chercher du texte en clair.
- **Handler sur `EN_CHANGE`** : en tapant à la main, le test n'a lieu qu'au 32e caractère (autres longueurs rejetées) — pas de bouton OK.
- **Minuscules refusées** (`a-f`).
- Un dernier mot d'opcode 5/7/9/0/2 écrase `E` → échec (essayé : `…50000000` → KO).
- **Wine** : le programme suppose `eax = entry point` au démarrage (XP) pour calculer `hInstance = eax & 0xff0000`. Sous Wine 10, ce `eax` est faux → `ACCESS_VIOLATION` à `DialogBoxParamA`. Le harness fixe donc `Eax=Eip=0x4010a3` via `SetThreadContext` sur le processus suspendu (aucun patch du binaire).

## Vérification

Pas de screenshot (Xvfb sans capture) : harness `tools/wine-harness.c` qui lit réellement les contrôles du binaire d'origine (`analysis/wine-verification.txt`).

```bash
i686-w64-mingw32-gcc -o /tmp/harness.exe tools/wine-harness.c -luser32
cp analysis/extracted/serialme.exe /tmp/
xvfb-run -a wine /tmp/harness.exe Z:\\tmp\\serialme.exe 000000001000000220000000A0000000
```

| serial | résultat réel (Wine) |
|---|---|
| `000000001000000220000000A0000000` | MessageBox **« Good Job :-) »** + `Status: CRACKED` ✔ |
| `0997968E10000002272124F0AF684AAF` (`--random`) | idem ✔ |
| `00000000100000022000000050000000` | `Status: UNCRACKED`, pas de MessageBox ✘ |

Message de succès décodé (routine `0x401423`) : « U found 1 of xxx valid serials send it to me with some explanation :-P at pxor@go2.pl ».

## Notes

- Debug GDB / x64dbg : non utilisés (reverse statique + Wine) — pas de section GDB.
- Le crackme n'a pas de couplage nom→serial : l'utilisateur `petik` n'est pas applicable.
- Il y a bien « plusieurs » serials valides (message de l'auteur), ce qui est cohérent avec le générateur `--random`.
