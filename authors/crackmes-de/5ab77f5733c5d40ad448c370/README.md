# gc_crackme_9 (Crackme 9) — gandalf

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c370`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c370) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | gandalf (Genocide Crew, importé via crackmes.de) |
| **Plateforme** | Windows PE32 GUI, Borland Delphi, packé UPX |
| **SHA-256 (zip)** | `c4e66850b83a46f510e32d24f3fd1cd26d69b2771584a76f1893ad44cae6dafc` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/gncrk9.zip` | archive d'origine (mot de passe `crackmes.one`) → `Crackme9.exe` (non modifié) |
| `analysis/crackme9.unpacked.exe` | exécutable dépacké (`tools/upx-3.96`) |
| `analysis/screenshot-*.png` | preuves live Wine/xvfb |
| `tools/gc-crackme9-solve.py` | solveur |

## Réponse

Un seul champ « Enter serial », **pas de nom d'utilisateur** (donc pas d'exemple `petik` possible).

| Serial | Résultat |
|---|---|
| **`43598`** | « Serial Correct! » |
| `00020` `00101` `00587` `02045` `04232` | idem (mêmes valeurs numériques, complétées à 5 caractères) |
| `00021` | rien (KO) |

```bash
python3 -I tools/gc-crackme9-solve.py        # 43598 + alternatives
python3 -I tools/gc-crackme9-solve.py -q     # 43598
python3 -I tools/gc-crackme9-solve.py --check
```

## Premier regard

```bash
unzip -P crackmes.one original/gncrk9.zip -d /tmp/g9      # Crackme9.exe, 88064 octets
file Crackme9.exe     # PE32 GUI, UPX compressed, 3 sections
./tools/upx-3.96 -d -o analysis/crackme9.unpacked.exe /tmp/g9/Crackme9.exe   # 197632 octets
strings -n 4 -t x analysis/crackme9.unpacked.exe | grep -E 'Edit1|Button|Success|Serial'
```

Sections `CODE`/`DATA`/`.idata` : Delphi (RTL Borland, `TForm`, `TEdit`, `TButton`). Fenêtre « Crackme 9 » : un label « Enter serial: », un `TEdit` (`Edit1`), boutons **Check** (`Button1`) et **About** (`Button2`). Chaînes utiles vers l'offset fichier 0x26fec : `Success` / `Serial Correct!` (MessageBox), puis le texte du About.

## Flow

Les noms `Button1Click` / `Button2Click` sont dans la table des méthodes publiées de `TCrackme`. `Button1Click` est à **0x427b48** :

1. `Edit1.Text` → `StrToInt` (0x406424) → `n` stocké en `[0x429760]` ;
2. `Edit1.Text` → `Length` (0x4037a8) → octet `[0x429764]`, **doit valoir 5** ;
3. appel de la routine de check **0x427ab8** avec `n` ; si le drapeau `[0x429765] == 0` → `MessageBoxA("Serial Correct!", "Success")` (0x405508).

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn analysis/crackme9.unpacked.exe`, puis recherche de la référence à l'adresse de la chaîne `Success` (VA = 0x401000 + offset_fichier − 0x400 → 0x427bec) : un seul `push 0x427bec` à 0x427bb2, dans `Button1Click`.

```asm
427b94: cmp  BYTE PTR ds:0x429764,0x5     ; Length(Edit1.Text) == 5 ?
427b9b: jne  0x427bca
427b9d: mov  eax,ds:0x429760              ; n = StrToInt(text)
427ba2: call 0x427ab8                     ; check(n)
427ba7: cmp  BYTE PTR ds:0x429765,0x0     ; 0 = valide
427bae: jne  0x427bca
427bb2: push 0x427bec ...  call 0x405508  ; MessageBox "Serial Correct!"
```

La routine 0x427a88 charge une **table cible** de 10 octets à 0x429748 :

```asm
mov eax,0x429748
mov [eax+9],2 ; [eax+8],0 ; [eax+7],1 ; [eax+6],2 ; [eax+5],2
mov [eax+4],1 ; [eax+3],0 ; [eax+2],2 ; [eax+1],0 ; [eax],2
```
soit `T = [2,0,2,0,1,2,2,1,0,2]` (index 0..9).

0x427ab8 (check) :

- `esi = 0x429754` (tableau de chiffres `d`), flag = 1, `k = 1` ;
- tant que `n >= 3` : `d[k-1] = n % 3` ; `n /= 3` ; si le quotient est `< 3`, `d[k] = n` (dernier chiffre) ; `k++` → conversion de `n` en **base 3, poids faible d'abord** ;
- puis comparaison de `k` octets de `d[k-1]…d[0]` avec `T[k-1]…T[0]` ; au premier écart flag = 1 et sortie ; si tout est égal, flag = 0.

Donc : les chiffres base 3 de `n` doivent être un **préfixe** de `T`. Calcul de `n` pour chaque longueur de préfixe (`Σ T[i]·3^i`) :

| k | préfixe | n |
|---|---|---|
| 3 | 2,0,2 | 20 |
| 5 | …,0,1 | 20 + 81 = 101 |
| 6 | …,2 | 101 + 2·243 = 587 |
| 7 | …,2 | 587 + 2·729 = 2045 |
| 8 | …,1 | 2045 + 2187 = 4232 |
| 10 | …,0,2 | 4232 + 2·19683 = **43598** |

(k=2, 4, 9 : chiffre de tête 0 → même `n` que k−1 ; k=1 : `n=2 < 3`, la boucle ne s'exécute pas, `d[0]` jamais écrit → KO.)

Reste la contrainte `Length == 5` : on remplit à gauche avec des zéros (`StrToInt("00020")` = 20), d'où les 6 serials. `43598` est le seul qui n'a pas besoin de padding.

Pièges : (1) j'avais d'abord mal pondéré le chiffre de poids 3⁹ (calculé `17354` au lieu de `43598`) — refusé en live, ce qui a corrigé l'erreur ; (2) `objdump` mal aligné sur la table (octets ASCII du nom de classe juste avant 0x427a88) : partir de l'adresse exacte de la fonction ; (3) pas de GDB/x64dbg ici : reverse statique + preuve live.

## Vérification

Pas de session GDB / x64dbg (reverse statique), donc pas de section « Debug GDB ».

```bash
xvfb-run -a -s "-screen 0 800x600x24" bash -c '
  wine /tmp/g9/Crackme9.exe & sleep 8
  xdotool mousemove 250 177 click 1; xdotool type --delay 100 43598   # Edit1
  xdotool mousemove 335 156 click 1                                    # Check
  xdotool search --onlyvisible --name Success'                         # fenêtre MessageBox
```

| Cas | Saisie | Résultat | Capture |
|---|---|---|---|
| OK | `43598` | fenêtre « Success » trouvée | [saisie](analysis/screenshot-saisie.png) |
| OK | `00020` `00101` `00587` `02045` `04232` | fenêtre « Success » trouvée | — |
| KO | `00021` | pas de fenêtre « Success » | [ko](analysis/screenshot-ko.png) |


## Notes

- Algorithme très court : conversion en base 3 + préfixe fixe ; pas de dépendance à un nom.
- `Length == 5` est vérifié sur le texte, pas sur la valeur : le zéro-padding est accepté par `StrToInt`.
- Aucun anti-debug ; seul UPX est à retirer.
