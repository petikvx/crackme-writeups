# wism's crack me medium

| | |
|---|---|
| **ID** | [`6b0353074ab951a9999da879`](https://crackmes.one/crackme/6b0353074ab951a9999da879) |
| **Auteur (site / local)** | wism / `wism` |
| **Plateforme** | Windows PE64 (MinGW-w64 GCC, C++, console) |
| **SHA-256** | `88cc15476b9eeb03edeb84d8aa625873761f7adad3704a0b41a995562d86b1d3` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

| Fichier | Rôle |
|---|---|
| `original/crackmebywism.exe` | binaire d'origine (non modifié) |
| `tools/wism-solve.py` | solveur + preuve live Wine (`--check`) |

## Réponse

**Mot de passe : `69GoodBoy69`**

```bash
python3 -I tools/wism-solve.py          # password = 69GoodBoy69
python3 -I tools/wism-solve.py --check  # lance l'exe d'origine sous Wine : cas OK + cas KO (`petik`)
```

Pas de champ user/login : une seule saisie (`password: `). `petik` sert ici d'exemple de **mauvais** mot de passe.

## Premier regard

```bash
file original/*          # PE32+ console x86-64, MinGW (GCC 16.2.0 MSYS2)
strings -n 5 original/*  # que du runtime MinGW : aucune chaîne du challenge
objdump -p original/* | grep 'DLL Name'  # libstdc++-6, libgcc_s_seh-1, libwinpthread-1
```

- Aucune chaîne `password` / `Incorrect` / `Challange complete!` en clair : elles sont construites **octet par octet** (`xor` bidon + `mov BYTE PTR [rax+i], imm`), donc `strings` ne voit rien.
- Le mot de passe attendu n'est pas en clair non plus : ce sont onze `mov BYTE PTR [rsp+0x80+i], imm8`.

## Flow

`main` (`0x140002280`, appelé depuis le CRT en `0x140001152`) :

1. construit `"password: "` (octets immédiats), l'affiche sur `std::cout` ;
2. lit une ligne (`getline` → `std::string`, longueur `r13`, données `r14`) ;
3. calcule un hash 64 bits de la saisie (boucle `0x140002500`) ;
4. construit le littéral `36 39 47 6f 6f 64 42 6f 79 36 39`, lui applique **la même** transformation et le même mix, déroulés en straight-line ;
5. compare les deux hashs ; `Challange complete!` (sic) ou `Incorrect` (fonction `0x1400020c0`, qui fait ensuite `exit`).

## Comment on trouve

**Ancrage.** Le point d'entrée `0x140001480` saute dans le CRT MinGW (`0x1400010a0`) ; la ligne `call 0x140002280` avec `rcx=argc, rdx=argv, r8=envp` en `0x140001152` désigne `main`. Tout le code du challenge tient dans `.text` `0x1400020c0..0x140002ef0` :

```bash
objdump -d -M intel original/crackmebywism.exe --start-address=0x140002080 --stop-address=0x140002ef0
```

**Chaînes masquées.** Motif répété (ex. `"password: "` en `0x1400022fa`) :

```asm
xor  BYTE PTR [rsp+0x5e],0x70     ; bruit anti-strings (valeur jamais utilisée)
mov  BYTE PTR [rax],0x70          ; 'p'
...
mov  BYTE PTR [rax+0x7],0x64      ; 'd'  → "password: "
```
La fonction `0x1400020c0` fait pareil avec `49 6e 63 6f 72 72 65 63 74 0a` = `Incorrect\n`.

**Hash de la saisie** (boucle `0x140002500`, `i` = index, `b` = octet) :

```asm
xor   r9d, ebx            ; b ^= k            (ebx = 0x29*i, add ebx,0x29)
xor   r9d, 0xffffffa5     ; b ^= 0xa5
; cl = (i % 7) + 1  (division par 7 via imul 0x4924924924924925)
rol   r9b, cl             ; rotation 8 bits
xor   r10, rax ; imul r10, 0x100000001b3   ; FNV-1a 64 (offset 0x55c5e55dfb685f30)
...mix avec 0x9e3779b9, 0x517cc1b727220a95, rol 0x11 / 0x5 ...
```
Fin : `imul rbx, len*0xd1b54a32d192ed03`, puis finalisation de type murmur3 (`0xff51afd7ed558ccd`, `0xc4ceb9fe1a85ec53`, `shr 0x21`).

**Hash de référence.** Au lieu d'un hash constant précalculé, le programme recalcule le hash d'un littéral :

```asm
mov BYTE PTR [rsp+0x80],0x36   ; '6'
mov BYTE PTR [rsp+0x81],0x39   ; '9'
mov BYTE PTR [rsp+0x82],0x47   ; 'G'
mov BYTE PTR [rsp+0x83],0x6f   ; 'o'
mov BYTE PTR [rsp+0x84],0x6f   ; 'o'
mov BYTE PTR [rsp+0x85],0x64   ; 'd'
mov BYTE PTR [rsp+0x86],0x42   ; 'B'
mov BYTE PTR [rsp+0x87],0x6f   ; 'o'
mov BYTE PTR [rsp+0x88],0x79   ; 'y'
mov BYTE PTR [rsp+0x89],0x36   ; '6'
mov BYTE PTR [rsp+0x8a],0x39   ; '9'
```
puis déroule la boucle à la main : `xor r11d,0xa5 ; rol r11b,1` pour i=0, `xor r14d,0xffffff8c ; rol r14b,2` pour i=1 (`0xa5 ^ 0x29 = 0x8c`, `rol` de `(1%7)+1 = 2`)… c'est exactement la transformation de la boucle, avec les constantes d'initialisation de la boucle (`0x55c5e55dfb685f30`, `0x517cc1b7…`) propagées par le compilateur.

**Assemblage de la réponse.** Même fonction des deux côtés ⇒ hash(saisie) == hash(littéral) dès que `saisie == littéral` : lire les 11 immédiats en ASCII suffit :

`36 39 47 6f 6f 64 42 6f 79 36 39` → `69GoodBoy69`.

(Le hash 64 bits n'est pas inversé : on n'en a pas besoin, le test se fait en rejouant le programme.)

**Pièges.**
- `strings` ne montre rien d'utile (octets immédiats séparés par des `mov`/`xor` de bruit).
- Les `xor BYTE PTR [rsp+0x2f/0x5e], imm` sont des leurres : la valeur accumulée n'est pas utilisée.
- Le « hash » semble opaque, mais la comparaison se fait sur un littéral du binaire — inutile de reverser le mix.
- Lancement sous Wine : l'exe importe `libstdc++-6.dll`, `libgcc_s_seh-1.dll`, `libwinpthread-1.dll` (absentes → `status c0000135`, aucun affichage). Voir ci-dessous.

## Vérification

Les DLL MinGW (Debian/Ubuntu `g++-mingw-w64-x86-64-posix`) sont copiées **à côté d'une copie** de l'exe dans `/tmp` ; `original/` n'est pas touché (SHA-256 identique avant/après).

```bash
python3 -I tools/wism-solve.py --check
# password = 69GoodBoy69
# OK : password: Challange complete!
# KO : password: Incorrect          (saisie `petik`)
```

Manuellement : `echo 69GoodBoy69 | xvfb-run -a wine crackmebywism.exe` (avec les DLL dans le même dossier).

## Notes

- Après `Incorrect`, le processus plante sous Wine (`WineDbg attached`) : le solveur borne donc le temps d'exécution et lit la sortie déjà imprimée. Cela ne change pas le verdict.
- « Challange » est une faute de frappe de l'auteur, présente dans le binaire.
- Analyse 100 % statique (objdump) + exécution Wine ; ni GDB ni IDA/x64dbg n'ont été utilisés, donc pas de section « Debug GDB ».
