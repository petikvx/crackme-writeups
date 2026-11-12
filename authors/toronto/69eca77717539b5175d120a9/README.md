# Toronto's aola

| | |
|---|---|
| **ID** | [`69eca77717539b5175d120a9`](https://crackmes.one/crackme/69eca77717539b5175d120a9) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Toronto |
| **Plateforme** | Windows PE64 console, MinGW-w64 (GCC), strippé |
| **SHA-256 `download.bin`** | `44caf73e2e2255e903df83344dd7a3a3ed0c77c47d421f2dc30a6dfb08f0d791` |
| **SHA-256 `b.exe`** | `ef53a9a22989e8b78b5e983e61ac1495e650c91c661168650ec1cd50a136e534` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP de crackmes.one **tel quel** (scaffold ; contient `b.exe`, mot de passe ZIP `crackmes.one`) |
| `analysis/b.exe` | `b.exe` extrait du ZIP (`unzip -P crackmes.one`) ; `analysis/b.asm` = `objdump -d -M intel` |
| `tools/aola-solve.py` | solveur + `--check` (émulation unicorn de `main`) |

## Réponse

**Mot de passe : `Yippie-Ki-Yay`**

```bash
python3 tools/aola-solve.py          # password = Yippie-Ki-Yay
python3 tools/aola-solve.py -q
python3 tools/aola-solve.py --check analysis/b.exe
```

Pas de username : le programme ne lit qu'un mot de passe (`petik` sert seulement de mauvais essai dans `--check`).

## Premier regard

- `download.bin` n'est pas un PE : c'est un ZIP (`PK`), le scaffold ne l'a pas extrait. `b.exe` = PE32+ console, MinGW-w64, symboles retirés, entrée `0x140001125`.
- `strings` ne montre **rien** d'utile (juste le CRT, `%63s`) : le mot de passe et les messages sont obfusqués.
- Dans `.data` (`0x140004010`) : `f3c3dadac3cf87e1c387f3cbd3` et `efc4decfd88adacbd9d9ddc5d8ce908a` — octets à haut bit, typique d'un XOR avec une constante.

## Flow

`main` = `0x140003420` (appelée par le CRT, `call 0x140003420` en `0x14000133b`) :

1. affiche `Enter password: ` ;
2. `scanf("%63s", buf)` (format `%63s` en `0x140005053`) ;
3. appelle `0x140001770` qui produit le mot de passe attendu ;
4. `strcmp` (thunk `0x140003270`) : égal → `puts("ok")`, sinon `puts("no")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/b.exe > analysis/b.asm`, puis `grep 140004010` → une seule xref de code, en `0x140001774` (`lea r8,[rip+0x2895]`), dans la fonction `0x140001770`.

**Fonction `0x140001770`** (déchiffrement) :

```asm
140001774  lea   r8,[rip+0x2895]        ; r8 = 0x140004010 (blob chiffré)
14000177b  mov   [rsp+0xc],0x1337       ; ... suite de ~7 opérations sur un dword (xor 0x12345678,
                                         ;     sub, shl/shr, xor 0x35014541, *129, shr 11) :
                                         ;     leurre, le résultat n'est jamais relu
1400017e0  movzx edx,BYTE PTR [r8+rax]  ; octet i du blob
1400017e5  xor   edx,0xffffffaa         ; ^ 0xAA
1400017e8  mov   [rcx+rax],dl           ; buffer de sortie (rcx = rsp+0x70 dans main)
1400017eb  add   rax,1
1400017ef  cmp   rax,0xd                ; 13 octets
```

Piège : les fonctions `0x140001720..0x140001768` et le bloc de calculs sur `0x1337` ressemblent à un hash/KDF, mais ne servent à rien (code mort / leurre) ; seul le XOR 0xAA compte.

**Décodage** (`bytes(b ^ 0xAA for b in blob)`) :

```
f3 c3 da da c3 cf 87 e1 c3 87 f3 cb d3
^aa → 59 69 70 70 69 65 2d 4b 69 2d 59 61 79  = "Yippie-Ki-Yay"
```

Même clé pour les messages dans `main` : `efc4decf d88adacb d9d9ddc5 d8ce908a` → `Enter password: ` ; les mots de 2 octets `0x401e`/`0x4020` ^ `0xaaaa` (`main` en `0x140003439`/`0x140003432`) donnent `no` / `ok`.

Aucune session GDB : `wine` et `gdb` ne sont pas installés sur cette machine, le reverse est statique (objdump) + émulation.

## Vérification

`wine` absent ici : la preuve live Windows n'a **pas** pu être faite. À la place, `--check` charge `analysis/b.exe` dans unicorn (sections mappées à leur VA), lance `main` à `0x140003420` avec la vraie fonction de déchiffrement `0x140001770` et la vraie comparaison, en ne stubant que `printf/scanf/strcmp/puts` et l'init CRT :

```
$ python3 tools/aola-solve.py --check analysis/b.exe
'Yippie-Ki-Yay' -> ['Enter password: ', 'ok']
'petik' -> ['Enter password: ', 'no']
```

OK pour le bon mot de passe, KO pour un faux. Test live à refaire sous Windows/Wine : `xvfb-run -a wineconsole analysis/b.exe`.

## Notes

- `original/` non modifié ; le ZIP n'est pas extrait dedans.
- Le dossier avait été scaffoldé sous `authors/Toronto/` : fusionné dans la famille existante `authors/toronto/`.
- Un callback TLS (`0x140001000`) existe mais est vide : pas d'anti-debug.
