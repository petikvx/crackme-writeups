# crackmes.de's hades by j

- crackmes.one : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c26f> — origine : [ORIGIN.yml](ORIGIN.yml)
- Auteur : **j** (archive crackmes.de) — Windows PE32 GUI, MinGW (C), packé **UPX** — difficulté 2.0
- Type : **keygenme** (nom → serial `%08lx-%08lx-%08lx-%08lx`)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/hades_keygenme.zip` / `.exe` | binaire d'origine (UPX) |
| `analysis/hades_unpacked.exe` | `upx -d` (symboles MinGW conservés) |
| `analysis/dialogproc-check-40503f.asm` | handler du bouton *Register* (longueurs, appels, comparaison) |
| `analysis/fubar-tail-404a37.asm` | fin de `fubar` : GOST + `sprintf("%08lx")` des 4 clés |
| `analysis/fugazi-404af0.asm` | `fugazi` : sscanf du serial + 4 × RC5 *decrypt* |
| `tools/hades-solve.py` | keygen + `--check` (émulation Unicorn du binaire) + `--wine` (vraie GUI) |

## Réponse

| Name | Serial |
|---|---|
| `petik` | **`be8dec23-682dfa20-d668b0ce-d1c13067`** |
| `PetiKVX test` | `ffc1ee29-725ef4c1-f19c3253-3b2a2eb3` |

```bash
python3 tools/hades-solve.py petik --check --wine
```

Le nom doit faire 4 à 32 caractères (`Your name must exceed 4 chars` / `cannot exceed 32 chars`).

## Premier regard

```text
$ file original/hades_keygenme.exe
PE32 executable (GUI) Intel 80386 ..., UPX compressed, 3 sections
$ upx -d -o analysis/hades_unpacked.exe original/hades_keygenme.exe   # OK, 31736 -> 48632 octets
$ diec analysis/hades_unpacked.exe
PE32  Compiler: MinGW
$ strings -n 6 analysis/hades_unpacked.exe
Incorrect, try again
That serial is correct! Well done.
Your name cannot exceed 32 chars
Your name must exceed 4 chars
%08lx
%08lx-%08lx-%08lx-%08lx
Nope...
Solved!
```

Point clé : le binaire dépaqueté a **gardé ses symboles** MinGW. `objdump -d` donne directement des noms parlants :
`_doa_key`, `_doa_decrypt` (RC5), `_mu`/`_gamma`/`_theta`/`_rho`/`_encrypt` (**3-Way**), `_kboxinit`/`_gostcrypt`/`_gostmac` (**GOST 28147-89**),
et trois fonctions maison au nom ironique : `_snafu`, `_fubar`, `_fugazi` (+ `_SundaysRuin` qui les enchaîne et renvoie le booléen de validité).

## Flow

`_DialogProc` (0x40503f, bouton Register) :

1. `GetDlgItemTextA(0x3e9)` → nom à `0x4086c0` ; longueur 4..32 sinon message dans le champ.
2. `GetDlgItemTextA(0x3ea)` → serial à `0x4085a0`.
3. `snafu()` ; `fubar()` ; `fugazi()`.
4. Compare octet à octet `0x4084a0` et `0x408830` (`strlen` égaux + tous les octets égaux) → `MessageBox("That serial is correct! Well done.", "Solved!")` sinon `("Incorrect, try again", "Nope...")`.

## Comment on trouve le prédicat

### 1. Ce qui dépend du nom : `snafu` + `fubar`

`snafu` (0x403940) parcourt le nom : pour chaque caractère `c` à l'indice `i`, il accumule en **flottant x87** des termes du type
`(i+2)*c * pow(c, k)` (exposants immédiats `0x4010000000000000` = 4.0, `0x401c…` = 7.0, `0x4000…` = 2.0, `0x4014…` = 5.0, … : **57 appels à `pow`**),
puis convertit avec `fistp` (contrôle d'arrondi forcé par `fldcw`) en entiers 32 bits rangés dans `0x408480..0x40848c`, et passe le tout dans `_encrypt` (3-Way) deux fois.

`fubar` (0x4042a0) reprend ces valeurs, chiffre en **GOST** (`_gostcrypt` ×2) et termine par (extrait `analysis/fubar-tail-404a37.asm`) :

```asm
404a79: mov [esp],0x408940 ; push "%08lx" ; push [ebp-0x40] ; call sprintf   ; K1
404aa1: mov [esp],0x4086a0 ;                push [ebp-0x3c] ; call sprintf   ; K2
404ab1: mov [esp],0x4086b0 ;                push [ebp-0x48] ; call sprintf   ; K3
404ad4: mov [esp],0x408820 ;                push [ebp-0x44] ; call sprintf   ; K4
```

→ **quatre clés ASCII de 8 caractères hex** (K1..K4), et 4 dwords `T = [0x408480..0x40848c]`, tous fonction du nom uniquement.

Comme cette partie mélange du flottant 80 bits, `pow` de la msvcrt et deux chiffrements par blocs, on ne la réécrit pas : le solveur **émule** `snafu`+`fubar` du binaire avec Unicorn (thunks `strlen`/`sprintf`/`pow` remplacés par des hooks Python, FPU en état `fninit` 0x37F comme après `_fpreset` de MinGW). La vérification sous wine montre que c'est bit-exact.

### 2. Ce qui dépend du serial : `fugazi`

Extrait commenté de `analysis/fugazi-404af0.asm` :

```asm
404b3f: wsprintfA(0x408830, "%08lx-%08lx-%08lx-%08lx", T0,T1,T2,T3)   ; chaîne CIBLE
404b78: sscanf(0x4085a0, "%08lx-%08lx-%08lx-%08lx", &S0,&S1,&S2,&S3)  ; S @ 0x408930..0x40893c
404b7d: mov [0x408494],10            ; r = 10 tours
404b8a: malloc(0x58)                 ; 2r+2 = 22 mots de 32 bits
404ba8: doa_key(&ctx, 0x408940, 8)   ; key schedule RC5 avec K1 (8 octets)
; boucle 404be0 : pour i=r..1
;   B = ((B - S[2i+1]) ror A) ^ A ;  A = ((A - S[2i]) ror B) ^ B
; puis B -= S[1] ; A -= S[0]        ; = RC5-32 *déchiffrement*, 2 blocs ECB
...                                  ; idem avec K2 (0x4086a0), K3 (0x4086b0), K4 (0x408820)
404e9c: wsprintfA(0x4084a0, "%08lx-%08lx-%08lx-%08lx", S0..S3)       ; résultat
```

`doa_key` est le key schedule RC5 standard (P32 = `0xB7E15163`, Q32 = `0x9E3779B9`, 3·max(t,c) itérations) — vérifié en émulant `fugazi` avec un serial produit par mon implémentation Python.

### 3. Prédicat et inversion

```
D_K4( D_K3( D_K2( D_K1(S) ) ) ) == T        (RC5-32/10/8, ECB sur 2 blocs de 64 bits)
⇔  S = E_K1( E_K2( E_K3( E_K4(T) ) ) )
```

Le keygen chiffre donc `T` avec K4, puis K3, K2, K1 (ordre inverse du déchiffrement), et formate en `%08lx-%08lx-%08lx-%08lx`.

### Exemple `petik`

```text
$ python3 tools/hades-solve.py petik -v
cible T : 238bc44c-289dd2f2-e75a6b3c-18701f00
clés    : ['72c60b08', 'aa5867af', '161612c2', 'e1b00565']
Name  : petik
Serial: be8dec23-682dfa20-d668b0ce-d1c13067
```

## Vérification

`--check` émule `_SundaysRuin` (0x404ed0 : snafu + fubar + fugazi + comparaison) du vrai binaire ; `--wine` pilote la GUI d'origine (exe UPX) sous wine/Xvfb avec xdotool (clic sur Name, Serial, Register) et lit le titre de la MessageBox.

```text
$ python3 tools/hades-solve.py petik --check --wine
[emu] SundaysRuin -> OK | cible 238bc44c-289dd2f2-e75a6b3c-18701f00 | déchiffré 238bc44c-289dd2f2-e75a6b3c-18701f00
[wine] fenêtres : ..:: HADES ::.. | Solved! -> OK (Solved!)

$ python3 tools/hades-solve.py petik --serial 11111111-22222222-33333333-44444444 --check --wine
[emu] SundaysRuin -> FAIL | cible 238bc44c-289dd2f2-e75a6b3c-18701f00 | déchiffré 4feed95d-03adf6fa-08d25a28-d37011c2
[wine] fenêtres : ..:: HADES ::.. | Nope... -> FAIL
```

## Notes

- Ne pas se laisser impressionner par les trois chiffrements (3-Way, GOST, RC5) : seuls les **quatre RC5** touchent au serial ; 3-Way/GOST ne servent qu'à dériver T et les clés depuis le nom, ce qu'on peut exécuter tel quel (émulation) sans les inverser.
- La partie `pow`/x87 rend une réimplémentation Python « à la main » fragile (précision 80 bits, `fistp` avec troncature) : l'émulation du code original évite ce piège.
- Dans la GUI, `Entrée` déclenche *About* (pas *Register*) : d'où le pilotage par clics.
