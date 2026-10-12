# crackme_nop by opcode0x90

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c21b`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c21b) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | Opcode0x90 (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (crackme du 6 mars 2007) |
| **Plateforme** | Windows PE32 console (asm), stub auto-déchiffré |
| **Difficulté** | 2.0 |
| **SHA-256 exe** | `635f4531115277f53b257927ff0556a2ebdfaac11432796aedd95a64cbcc63d0` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme_nop.zip`, `original/crackme_nop.exe` | archive + binaire d'origine (non patché) |
| `analysis/stub-decrypted.bin` / `.asm` | les 0x10f octets copiés de `0x401027`, après les 2 XOR |
| `tools/nop-solve.py` | générateur de codes (`--word`, `--check`) |
| `tools/verify-unicorn.py` | émulation Unicorn du vrai code (copie, XOR, check, WriteFile) |
| `analysis/unicorn-run.txt` | sortie OK / KO |

## Réponse

Pas de nom ; un code de **19 caractères** (≥ 19 pour que les octets 1..18 soient saisis) dont le XOR des dwords glissants vaut `0x4D3E5732`. Exemple avec `petik` dedans :

**`XPPApetikAAAAAa0592`**

```bash
python3 tools/nop-solve.py                     # code : XPPApetikAAAAAa0592
python3 tools/nop-solve.py --check XPPApetikAAAAAa0592   # OK
python3 tools/verify-unicorn.py XPPApetikAAAAAa0592      # ... You solved it! Well done mate :)
```

Contraintes (b_i = octet i de la saisie, `\r\n` derrière) :

```
XOR(b1..b15) = 0x32      b16 = b1 ^ 0x65      b17 = b2 ^ 0x69      b18 = b3 ^ 0x73      (b0 libre)
```

## Premier regard

```text
$ file crackme_nop.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 4 sections
$ objdump -x crackme_nop.exe
objdump: crackme_nop.exe: invalid NumberOfRvaAndSizes          <- en-tête volontairement abîmé
sections .text .rdata .data .nop
$ strings crackme_nop.exe
crackme_nop by Opcode0x90, 6 March 2007 ... You have Enter the code wrong / You solved it! Well done mate :)
%.99999x ... ruhc398fh3
CreateThread GetStdHandle ReadFile SetConsoleMode SetUnhandledExceptionFilter Sleep VirtualAlloc VirtualProtect WriteConsoleA WriteFile
```

Les chaînes `ruhc398fh3` / `%.99999x` sont des leurres (sautés par des `je` toujours pris, ou anti-OllyDbg format string). `objdump -d` sur `.text` brut (`objdump -D -b binary -m i386 --adjust-vma=0x401000`) car l'en-tête gêne les outils.

## Flow

- `EP 0x401163` : `sub eax,eax ; je` par-dessus des `ff`, SEH + `int1` (`f3 64 f1`, anti-debug), puis `jmp ebx` calculé → `0x4011f6`.
- `SetUnhandledExceptionFilter(0x4011f2)` (handler qui renvoie 1 = tue le process) ; `CreateThread(0x401136)` : boucle `VirtualProtect(PEB->Ldr, 0x104, PAGE_NOACCESS)` + `Sleep(10)` (gêne les debuggers qui parcourent les modules).
- 2 × `VirtualAlloc(0x1000, RWX)` → `[0x403010]` (buffer saisie), `[0x40300c]` (buffer code) ; `rep movsb` de **0x10f octets depuis `0x401027`** vers le buffer code.
- `SetConsoleMode(stdin, 6)` ; s'il échoue (stdin pas une console) on tombe dans la chaîne « You have Enter… » exécutée comme du code → exception → fin.
- `WriteFile("Enter the code")`, `WriteFile(" : ")`, `ReadFile(stdin, [0x403010], 0x1d, …)`.
- Puis :

```asm
4012f5  mov edi,[0x40300c]
4012fb  xor dword [edi+0x0b], 0x040740f3
401302  xor dword [edi+0x65], 0x79aef578
401309  jmp [0x40300c]                     ; exécute la copie déchiffrée
```

## Comment on trouve le prédicat

On refait la copie + les deux XOR en Python (`analysis/stub-decrypted.bin`) puis `objdump -D -b binary -m i386` :

```asm
00  mov  ecx,0x10
05  mov  esi,[0x403010]        ; saisie
0b  mov  edx,[esi]             ; (déchiffré : 78 56 34 12 -> 8b 16 33 16)
0d  xor  edx,[esi]             ; boucle : 16 dwords NON alignés
0f  inc  esi
10  loop 0x0d                  ; edx = d0^d0^d1^...^d15 = XOR_{i=1..15} le32(buf[i..i+3])
12  call $+5 ; pop eax         ; eax = base (position-indépendant)
18  jge  0x57                  ; OF=0 après xor : pris si edx >= 0 (sinon on exécute du texte -> crash)
1a  "You have Enter the code wrong"   (0x1d)
37  "You solved it! Well done mate :)" (0x20)
57  add  eax,3                 ; -> "You have Enter…"
5a  mov  ebx,0x1d
5f  cmp  edx,0x4d3e5732        ; constante cible
65  jne  0x6c                  ; (déchiffré : 0d f0 ad ba -> 75 05 03 c3)
67  add  eax,ebx ; add ebx,3   ; -> "You solved it!…", 0x20 octets
6c  WriteFile(stdout, eax, ebx) ; puis Sleep(5000)
```

Avant déchiffrement, les octets en `+0xb` (`78 56 34 12` = `js`/`xor al,12h`) et `+0x65` (`0d f0 ad ba` = `or eax,…`) masquent la boucle et le `jne` : un désassemblage statique naïf de `0x401027` ne montre rien de sensé.

### Inversion

L'octet `k` (0..3) de `edx` vaut `XOR(b[1+k] .. b[15+k])`. Avec la cible `0x4D3E5732` (octets LE `32 57 3E 4D`) :

```
R0 = XOR(b1..b15) = 0x32
R1 = R0 ^ b1 ^ b16 = 0x57  => b16 = b1 ^ 0x65
R2 = R1 ^ b2 ^ b17 = 0x3E  => b17 = b2 ^ 0x69
R3 = R2 ^ b3 ^ b18 = 0x4D  => b18 = b3 ^ 0x73
```

`0x65/0x69/0x73` basculent les bits 5–6 : `b1..b3` doivent être majuscules/chiffres pour que `b16..b18` restent imprimables (une minuscule donnerait un caractère de contrôle). Le solveur : `b0='X'`, `b1..b3` alnum, `petik` en `b4..b8`, bourrage, puis `b15 = 0x32 ^ XOR(b1..b14)`, et `b16..b18`.

Exemple : `X | PPA | petik | AAAAAa | 0 | 592` (b0 | b1..b3 | b4..b8 | bourrage b9..b14 | b15 | b16..b18)
`XOR("PPApetikAAAAAa") ^ 0x32 = '0'`, `'P'^0x65='5'`, `'P'^0x69='9'`, `'A'^0x73='2'`.

Avec un code de 19 caractères, `buf[19..20] = \r\n` ne touche pas `b1..b18` : le résultat ne dépend pas de la fin de ligne.

## Vérification

Wine **refuse** l'exe (`Bad EXE format for Z:\tmp\cnop.exe` — `NumberOfRvaAndSizes` invalide, accepté par le loader de Windows XP). Preuve par **émulation Unicorn du vrai code** (`tools/verify-unicorn.py`) : sections brutes à `0x400000`, imports simulés au niveau des thunks (`GetStdHandle`, `VirtualAlloc`, `SetConsoleMode`=1, `ReadFile` → code + `\r\n`, `WriteFile` capturé, `Sleep` = fin), exécution à partir de `0x401215` (après `CreateThread`, donc sans le thread anti-debug) : les `VirtualAlloc`, la copie, les deux XOR et le stub déchiffré sont **ceux du binaire**.

```text
XPPApetikAAAAAa0592 -> Enter the code |  : | You solved it! Well done mate :)
XPPApetikAAAAAa0593 -> Enter the code |  : | You have Enter the code wrong
petik               -> Enter the code |  : | You have Enter the code wrong
```

## Notes

- Ce que ce n'est pas : `ruhc398fh3` n'est pas le mot de passe (chaîne enjambée par `xor ebx,ebx ; je`).
- La section `.nop` (0x200 octets, vide sur disque) n'est pas utilisée par le check.
- Un code < 19 caractères est possible en théorie (les `\r\n` et zéros entrent alors dans les XOR), le solveur vise 19 pour rester simple.
