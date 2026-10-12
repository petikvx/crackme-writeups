# morgana_1.49 by bswap (crackmes.de)

« Morgana 1.49 » de Bswap (Hollande, 2009), « 100% written in ASM » (MASM32 / RadASM). Goal : *make a key generator*.

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c204> · [`ORIGIN.yml`](ORIGIN.yml)
- **Auteur** : crackmes.de (mirror) / bswap
- **Plateforme** : Windows **PE32** GUI (MASM 6.14, non packé) — difficulté 2.0
- **Archive** : `original/Morgana.zip` → `Morgana/KegenMe.exe` + `Morgana/NFO.txt`
- **SHA-256 zip** : `b0eeb39022f886a6b4593b2980e7f69d406d8a0c2c196e15a8d37ef1a5f0d51e`
- **Statut** : résolu (keymaker), vérifié **sous wine/Xvfb** sur le binaire original : titre « Morgana 1.49 (Registered) »

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Morgana/KegenMe.exe` | binaire d’origine (non patché) |
| `original/Morgana/NFO.txt` | NFO de l’auteur |
| `tools/morgana149-solve.py` | keymaker + `--check` (réimplémentation du check) |
| `tools/verify-wine.sh` | preuve live : wine + Xvfb + xdotool (saisie + clic « Register ») |
| `analysis/registered-petik.png` | capture OK (`AQp6509eti`) |
| `analysis/ko-AQp6508eti.png` | capture KO (1 chiffre faux) |

## Réponse

Le binaire ne lit **qu’un seul champ** (« Enter your Key », contrôle `0xC9`) : pas de nom. Le serial fait **10 caractères** :

```
position : 0 1 2 3 4 5 6 7 8 9
serial   : A Q ? 6 5 0 9 ? ? ?        (? = libre)
```

Le keymaker remplit les 4 positions libres avec le nom (exemple **`petik`**) :

| Nom | Serial |
|---|---|
| `petik` | **`AQp6509eti`** |
| (aucun) | `AQX6509XXX` |

```
$ python3 tools/morgana149-solve.py
Name   = petik
Serial = AQp6509eti
$ python3 tools/morgana149-solve.py --check AQp6509eti
OK
```

## Premier regard

```
$ file original/Morgana/KegenMe.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386, 4 sections
$ diec original/Morgana/KegenMe.exe
Linker: Microsoft Linker(5.12.8078) · Compiler: MASM(6.14.8444) · Tool: MASM32
```

- Pas de packer, `.text` de 0xC90 octets : tout se lit à l’`objdump`.
- Imports : uniquement `user32` / `gdi32` / `kernel32` / `comctl32`. Les chaînes `Software\Keyg\Your Key`, `Key 1`, `Key 2`
  sont des **leurres** (restes du keygenme 0.72 du même auteur) : aucun import `advapi32`, rien n’ouvre le registre.
- Les chaînes utiles (`Morgana 1.49(Registered)`, `Try it again!`) sont **au milieu du code** (`jmp` par-dessus) :
  `strings` ne les relie à rien, il faut suivre les `push` d’adresses.

## Flow

`DialogBoxParamA` → DlgProc `0x401090`. `WM_COMMAND` (`0x111`, `0x4013d7`) :

| wParam | Bouton | Action |
|---|---|---|
| `0x12D` | About | boîte de dialogue « IDD_ABOUT » |
| `0x12E` | **Register** | **check** `0x401420` |
| `0x12F` | Exit | `EndDialog` |

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel original/Morgana/KegenMe.exe`, puis table IAT (`pefile`) pour nommer les
   `call 0x401cxx` (thunks `jmp [0x4020xx]`). Le seul `GetDlgItemTextA` (`0x401c36`) est à `0x4014a6`, dans la branche
   `cmp [ebp+0x10], 0x12e` (`0x401413`) : c’est le bouton Register.

2. **Une table calculée… sur un buffer vide** (`0x401424..0x401492`) : avant même de lire le texte, le code met à zéro
   le buffer du serial (`0x40332c`) et la table (`0x40334b`), puis boucle 4 fois :

   ```asm
   mov  esi, 0x40332c          ; buffer serial (encore à 0 !)
   mov  edi, 0x40334b          ; table T[0..3]
   mov  ecx, 0x29
   l:  movsx eax, byte [ebx+esi]   ; = 0
       xadd ecx, eax           ; eax = ancien ecx, ecx += 0
       add  ecx, ebx
       shrd dx, ax, 2          ; dx = (dx >> 2) | ((ax & 3) << 14)
       inc dl / xor dl, dh / dec dl
       mov  [ebx+edi], dl
       inc ebx / cmp ebx, 4 / jne l
   ```

   Comme le buffer est nul, la table est **constante** : `T = 40 40 84 06` (rejoué en Python dans `table()` du solveur).

3. **Lecture + premiers tests** :

   ```asm
   push 0x1e / push 0x40332c / push 0xc9 / push hDlg
   call GetDlgItemTextA
   cmp  eax, 0xa               ; longueur == 10, sinon MessageBox « Try it again! »
   ...
   cmp  word [0x40332c], 0x5141 ; "AQ" (LE : 'A'=0x41, 'Q'=0x51)
   ```

4. **XOR de 2 caractères** (`0x4014f1`) : `ebx` démarre à 2, `esi = 0x40332f` (= `serial+3`) :
   `serial[5] ^= T[2]` (0x84), `serial[6] ^= T[3]` (0x06).

5. **Le vrai test** : `call 0x401b79(0xdead, serial+3, 0x40156e)`

   ```asm
   mov  ebx, [eax]             ; ebx = dword serial[3..6] (après XOR)
   sub  ebx, ecx               ; - 0xdead
   sub  bx, 0x5689             ; 16 bits bas seulement
   bswap ebx
   sub  bx, 0xb33f
   or   ebx, ebx
   je   ok
   xor  ebx, ebx
   mov  [esp+0x10], edx        ; ÉCRASE l’adresse de retour par 0x40156e → saute l’enregistrement
   ```

   Piège : en cas d’échec la fonction ne renvoie pas un booléen, elle **réécrit son adresse de retour** (troisième
   argument `0x40156e` = fin du handler). Le `cmp bl, 3 / je` après le `call` est décoratif (`ebx` vaut toujours 0).

6. **Inversion** (on remonte depuis `ebx == 0`) :

   | étape | valeur |
   |---|---|
   | après `sub bx, 0xb33f` | `0x00000000` |
   | avant (après `bswap`) | `0x0000B33F` |
   | avant `bswap` | `0x3FB30000` |
   | avant `sub bx, 0x5689` | `0x3FB35689` |
   | avant `sub ebx, 0xdead` | `0x3FB43536` (retenue 0x5689+0xdead = 0x1**3536**) |

   Dword LE `36 35 B4 3F` → `serial[3]='6'`, `serial[4]='5'`, `serial[5] = 0xB4 ^ 0x84 = 0x30 '0'`,
   `serial[6] = 0x3F ^ 0x06 = 0x39 '9'`. Les positions 2, 7, 8, 9 ne sont lues par personne : libres.

7. **Succès** (`0x401523`) : `EnableWindow`, champ grisé, `SendMessage(WM_SETTEXT)` du titre avec
   `0x4010c9 - 0x1c = 0x4010ad` → « Morgana 1.49(Registered) » et « (Registered) » dans « Register Status ».

## Prédicat consolidé

```
len(s) == 10
s[0:2] == "AQ"
s[3] == '6', s[4] == '5', s[5] ^ 0x84 == 0xB4, s[6] ^ 0x06 == 0x3F   → "6509"
```

Keymaker : `"AQ" + nom[0] + "6509" + nom[1:4]` (complété par `X`).

## Vérification

```
$ tools/verify-wine.sh AQp6509eti analysis/registered-petik.png
titre: Morgana 1.49 (Registered)
$ tools/verify-wine.sh AQp6508eti analysis/ko-AQp6508eti.png
titre: Morgana 1.49 (Unregistered)
```

- **Live** : binaire original sous wine + Xvfb (2026-10-12), saisie et clic par `xdotool`.
  OK : [`analysis/registered-petik.png`](analysis/registered-petik.png) · KO (dernier chiffre de `6509` faux) :
  [`analysis/ko-AQp6508eti.png`](analysis/ko-AQp6508eti.png).
- `--check` du solveur : réimplémentation pas à pas du code (`table()` + `0x401b79`).

## Notes

- Pas de dépendance au nom : « keygen » = générateur de serials (4 positions libres → 95⁴ serials imprimables).
- Les clés de registre `Software\Keyg\Your Key` / `Key 1` / `Key 2` ne servent à rien ici (aucun appel `Reg*`).
- Pas de GDB ni de debugger : reverse 100 % statique + preuve wine.
