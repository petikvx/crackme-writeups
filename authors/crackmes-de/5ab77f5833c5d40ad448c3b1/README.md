# crackmes.de's crackme_3 by cosh — keygen

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3b1`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3b1) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (cosh) |
| **Plateforme** | Windows PE32 GUI, MSVC 6 + MFC 4.2 (dialogue Name / Serial / CHECK / QUIT) |
| **SHA-256 (zip)** | `0ac4a6964fda028c7a5ce9044ae2d841d42630b1c039384ff8f5c2a1698e2e7a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/cosh3.zip` | archive d'origine (`crackme3.exe` + `HarvestR.nfo`, nfo décoratif) |
| `tools/cosh3-solve.py` | keygen ; `--check` relit les constantes dans l'exe, `--live` preuve Wine |

## Réponse

| Name | Serial |
|---|---|
| `petik123` | **`{l{``8%*`** (8 caractères : `{` `l` `{` `` ` `` `` ` `` `8` `%` `*`) |

Règle : `len(Name) > 5`, `len(Serial) > 5` et `Serial[i] = Name[i] ^ (1+i) ^ (10+i)`.
`petik` (5 car.) est refusé (longueur > 5) → `petik123`.

```bash
python3 -I tools/cosh3-solve.py                 # Name : petik123 / Serial : {l{``8%*
python3 -I tools/cosh3-solve.py --check --live
```

## Premier regard

```bash
unzip -P crackmes.one original/cosh3.zip -d /tmp/c3     # hors du dépôt
file crackme3.exe   # PE32 executable for MS Windows 4.00 (GUI), Intel i386
diec crackme3.exe   # MSVC 6.0, MFC 4.2, pas de packer
strings -n 5 crackme3.exe
```

Strings (`.data`) : `Well done,Cracker` (0x403020), `YOU DID IT` (0x403034), `One of the Details you entered was wrong` (0x403040), `ERROR` (0x40306c). Même squelette que [crackme_2](../5ab77f5833c5d40ad448c3b0/) : MFC par ordinaux, d'où des `call` opaques.

## Flow

Handler du bouton CHECK en `0x4014B0`. Les deux CString sont aux offsets `this+0xa0` (edit Name, id 0x3e8) et `this+0x60` (edit Serial, id 0x3e9), comme dans crackme_2. Chacun est recopié (`GetWindowText`) en `[this+0xe0]` / `[this+0xe4]` puis dans deux CString locales (`[ebp-0x1c]` et `[ebp-0x10]`) qui sont modifiées **en place** avant comparaison.

## Comment on trouve le prédicat

**Ancrage** : `objdump -d -M intel --no-show-raw-insn crackme3.exe`, les messages d'erreur `0x403040/0x40306c` ne sont référencés que par le handler `0x4014B0` (push en `0x4015c3`).

```asm
4014fd  cmp [ebp-0x14],5 ; jg ...     ; len(Name)   > 5 sinon ERROR
401516  cmp [ebp-0x18],5 ; jg ...     ; len(Serial) > 5 sinon ERROR
        ; copies de Name -> [ebp-0x1c], Serial -> [ebp-0x10]
401576  mov ecx,1                     ; compteur = 1
401580  mov bl,[eax]  ; xor bl,cl ; mov [eax],bl
401586  inc ecx ; inc eax ; cmp byte [eax],0 ; jne 401580   ; Name[i] ^= (1+i)
401593  mov ecx,0xa                   ; compteur = 10
40159d  mov bl,[eax]  ; xor bl,cl ; mov [eax],bl
4015a3  inc ecx ; inc eax ; cmp byte [eax],0 ; jne 40159d   ; Serial[j] ^= (10+j)
4015b0  mov bl,[eax] ; mov cl,[edx] ; cmp bl,cl ; jne ERROR
4015ba  inc eax ; inc edx ; cmp byte [eax],0 ; jne 4015b0   ; boucle sur la longueur du Name
4015c1  jmp 4015d9                    ; -> "Well done,Cracker" / "YOU DID IT"
```

**Décodage** : l'octet i du nom est XORé avec `1+i`, l'octet j du serial avec `10+j`, puis les deux chaînes sont comparées sur la longueur du nom (la boucle s'arrête quand le **nom** transformé atteint son 0 ; un suffixe de serial en trop est ignoré, un serial trop court échoue sur le 0 contre un octet non nul). D'où `Serial[i] = Name[i] ^ (1+i) ^ (10+i)`.

**Assemblage** pour `petik123` :

| i | Name | `^(1+i)^(10+i)` | Serial |
|---|---|---|---|
| 0 | `p` 0x70 | ^0x01^0x0a = ^0x0b | `{` 0x7b |
| 1 | `e` 0x65 | ^0x02^0x0b = ^0x09 | `l` 0x6c |
| 2 | `t` 0x74 | ^0x03^0x0c = ^0x0f | `{` 0x7b |
| 3 | `i` 0x69 | ^0x04^0x0d = ^0x09 | `` ` `` 0x60 |
| 4 | `k` 0x6b | ^0x05^0x0e = ^0x0b | `` ` `` 0x60 |
| 5 | `1` 0x31 | ^0x06^0x0f = ^0x09 | `8` 0x38 |
| 6 | `2` 0x32 | ^0x07^0x10 = ^0x17 | `%` 0x25 |
| 7 | `3` 0x33 | ^0x08^0x11 = ^0x19 | `*` 0x2a |

**Pièges** : (1) les deux boucles XOR modifient les CString en place, ce n'est pas un `strcmp` direct ; (2) vérifier quel edit est Name (`+0xa0`, XOR départ 1) et lequel est Serial (`+0x60`, XOR départ 10) : inverser donnerait un serial faux ; (3) pour certains noms le XOR peut produire un caractère non imprimable, ou `0` (fin de chaîne prématurée), à éviter ; (4) `jg` ⇒ 6 caractères minimum.

## Vérification

Wine 10, `xvfb-run` + `xdotool` (reproduit par `--live`), titres de fenêtres lus :

| Name | Serial | Résultat |
|---|---|---|
| `petik123` | `{l{``8%*` | **`YOU DID IT`** (OK) |
| `petik123` | `{l{``8%+` (dernier octet faux) | **`ERROR`** |
| `petik` | `x` | **`ERROR`** (longueurs ≤ 5) |

Pas de capture d'écran (serveur headless) : la preuve est la liste des titres de fenêtres.

## Notes

- Reverse 100 % statique (`objdump`) + preuve Wine ; ni GDB, ni x64dbg, ni IDA : pas de section GDB.
- Contrairement à crackme_2 (préfixe constant), ici le serial dépend bien du nom.
- `original/` non modifié (exe extrait dans `/tmp`).
