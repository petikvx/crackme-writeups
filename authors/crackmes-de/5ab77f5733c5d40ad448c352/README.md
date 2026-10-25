# Simple KGM 2 by v3sa

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c352`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c352) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (crackme de **v3sa**) |
| **Plateforme** | Windows PE32 GUI (x86), MASM32 / Microsoft Linker 5.12 |
| **SHA-256 du ZIP** | `647caed1616d89be6f941db78d7a89db50522067cd4be9b8d75894cfea62a7d9` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Simple_KGM_2.zip` | archive d'origine (non modifiée) |
| `analysis/Simple_KGM_2.exe` | exécutable extrait du ZIP (`Simple KGM 2.exe`, sha256 `0cca3fc5…4664`) |
| `analysis/screenshot-ok.png` / `screenshot-ko.png` | preuve live Wine (GoodBoy / BadBoy) |
| `tools/simple-kgm-2-solve.py` | keygen |
| `tools/live-test.sh` | pilotage xdotool de la boîte de dialogue sous `xvfb-run` + Wine |

## Réponse

Keygen : trois champs **Name**, **ID** (nombre décimal), **Serial** (hexadécimal).

| Name | ID | Serial |
|---|---|---|
| `petik` | `4084154228` | `55B54812B4DCC5D1` |

```bash
python3 tools/simple-kgm-2-solve.py petik        # détaillé
python3 tools/simple-kgm-2-solve.py -q petik     # « ID Serial »
```

## Premier regard

```bash
unzip original/Simple_KGM_2.zip -d <dossier vide>     # -> Simple KGM 2.exe
diec Simple_KGM_2.exe        # PE32, MASM32 (8-11)
strings -n 4 Simple_KGM_2.exe
objdump -h / -d -M intel --no-show-raw-insn Simple_KGM_2.exe
```

Strings utiles dans `.data` : `BadBoy!`, `GoodBoy!`, `v3sa`, `%08X`, et surtout
`F1CB476270EA27E9` (0x40401b) et `10001` (0x40402c) : un **module hexadécimal 64 bits** et l'exposant
RSA classique 65537. La table `0123…zABC…` en 0x404050 sert à la conversion base-N des routines bignum
(librairie MASM32 « bignum » : `VirtualAlloc`, `rep movs`, …).

## Flow

Dialogue (`DialogBoxParamA`), `WM_INITDIALOG` à 0x401028 : charge deux bignums depuis les chaînes
(`0x4014c3(handle, base 16, chaîne)`) : N = `F1CB476270EA27E9` et E = `0x10001`.
Sur le bouton Check (id `0x3eb`, 0x4010b1) :

1. `GetDlgItemInt(0x3ea)` (champ **ID**) → `ID - 0xd4` stocké en 0x404674 ; 0 (invalide) = échec.
2. `GetDlgItemTextA(0x3ef)` (champ **Serial**, max 0x20) → 0x4042f4.
3. `GetDlgItemTextA(0x3e9)` (champ **Name**) → 0x4042d4, longueur **4..32**.
4. Hash du nom (boucle 0x40117c) ; il doit valoir `ID - 0xd4`.
5. `wsprintfA(buf, "%08X", hash)` → 0x4045f4.
6. Serial (hex) → bignum S ; `S^E mod N` (0x4022d4, modexp) ; résultat reconverti en hexa (0x4017a5, base 16) → 0x4043f4.
7. `lstrcmpA(0x4045f4, 0x4043f4)` : `0` → GoodBoy.

## Comment on trouve

### 1. Le hash du nom (0x401173 – 0x4011a8)

```asm
  mov edi, eax            ; edi = longueur du nom (4..0x20)
  xor edx,edx / xor esi,esi / mov ecx,1
L: inc edx
  movzx eax, byte [edx+0x4042d3]   ; = name[edx-1]
  cmp edx, edi / jne s / xor edx,edx   ; indice cyclique : après le dernier char on repart à 0
s: add eax, esi
  shl eax, 4
  add eax, 0x10001
  push eax / call 0x401283         ; eax = f(((c+acc)<<4) + 0x10001)
  add esi, eax                     ; acc += f(...)
  inc ecx / cmp ecx,0x20 / jne L   ; 31 tours (ecx de 1 à 0x1f)
cmp [0x404674], eax                ; (ID - 0xd4) == dernier f()  (et non l'accumulateur)
```

Le nom est donc parcouru cycliquement sur **31 itérations** ; la valeur comparée est le **dernier** `f`,
pas `esi`.

### 2. La fonction f (0x401283), 0x666 tours « obfusqués »

```asm
  mov ecx,0x666
T: add eax,0x68656865   ; "hehe"
   ror eax,8
   sub eax,0x65686568   ; "ehEh"
   rol eax,0x16
   mov ebx,eax / not eax
   sub ebx,eax          ; positionne CF (ebx < ~eax non signé)
   adc eax,ebx          ; eax = ~x + (x - ~x) + CF
   ror eax,6
   loop T
  add eax,0x61733376 / xor eax,0x76337361   ; "v3sa" / "as3v"
  and eax,0xffff / shl eax,16 / mov ax,0xdead
  sub eax,0xd00ea00d
```

Piège : le `sub ebx,eax` suivi de `adc eax,ebx` consomme le **carry** du `sub` ; il faut le reproduire
(`cf = 1 si b < ~b`). Le résultat final ne dépend que des 16 bits bas avant le `shl`, donc le hash
contient la constante `0x…dead - 0xd00ea00d`.

Pour `petik` : hash = `0xF36F3EA0` ; ID = hash + `0xd4` = **4084154228**.

### 3. La partie RSA

Le hash est formaté `%08X` puis comparé au **résultat hexa** de `Serial^0x10001 mod N`.
C'est un RSA-64 : `N = 0xF1CB476270EA27E9` se factorise instantanément (rho de Pollard dans le solveur)
→ `d = E⁻¹ mod (p-1)(q-1)` et `Serial = hash^d mod N`. Pour `petik` :
`0xF36F3EA0^d mod N = 0x55B54812B4DCC5D1`.

Pièges :
- le hash doit être `< N` (toujours vrai, 32 bits) ;
- la conversion hexa du bignum n'émet **pas de zéros de tête** alors que `%08X` en met : un nom dont le
  hash commence par `0` ne peut pas valider (le solveur le signale) ; `petik` (`F36F…`) est OK.
- le binaire n'a pas été patché : `original/` intact, exe travaillé sous `analysis/`.

## Vérification live (Wine + Xvfb)

`tools/live-test.sh` (champs cliqués aux coordonnées de la boîte, `xvfb-run -a -s "-fbdir …"` pour la capture) :

| Cas | Résultat |
|---|---|
| `petik` / `4084154228` / `55B54812B4DCC5D1` | **GoodBoy!** ([screenshot-ok.png](analysis/screenshot-ok.png)) |
| même couple, Serial `…C5D2` (dernier digit altéré) | **BadBoy!** ([screenshot-ko.png](analysis/screenshot-ko.png)) |

## Notes

- Analyse 100 % statique + Wine ; aucune session GDB / x64dbg / IDA MCP.
- Les routines bignum (0x401369 copie, 0x401397 compare, 0x4014c3 chaîne→bignum, 0x4017a5 bignum→chaîne,
  0x4022d4 modexp) sont de la lib MASM32 standard ; leur rôle a été déduit de l'usage (appels, chaîne
  `10001`/N) puis confirmé par le test live (le keygen RSA passe GoodBoy).
