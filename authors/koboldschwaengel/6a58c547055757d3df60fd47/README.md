# koboldschwaengel's Where is the challange?

| | |
|---|---|
| **ID** | [`6a58c547055757d3df60fd47`](https://crackmes.one/crackme/6a58c547055757d3df60fd47) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | koboldschwaengel |
| **Plateforme** | Windows x64, console (MSVC C++), emballé en polyglot PNG/ZIP |
| **SHA-256 (zip)** | `8f1d0123ca4a13aa7016f2a89343e5bceef2cb7b7e137bc109bae817969b91e0` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/WhereIsTheChallange.zip` | archive d'origine (non modifiée) : `Readme.txt` + un PNG |
| `tools/where-is-the-challange-solve.py` | extrait la chaîne complète, affiche le mot de passe, `--check` le teste sous Wine |
| `analysis/stripper.exe` | 1er PE (sorti du ZIP caché dans le PNG) |
| `analysis/crackme-inner.exe` | 2e PE (overlay de `stripper.exe`) = le vrai crackme |
| `analysis/*.objdump.asm` | désassemblages `objdump -d -M intel` des deux PE |

## Réponse

**Mot de passe : `abc123!!`** (pas de username ; le binaire ne compare que les 8 premiers caractères, `abc123!!xyz` passe aussi).

```bash
python3 -I tools/where-is-the-challange-solve.py --check
```

## Premier regard

Le zip contient `Readme.txt` (3 hints : « pourquoi un PNG si gros ? », « est-ce seulement un PNG ? », « polyglot file ; 7z/Windows ne marchent pas, utiliser BreeZip ») et un PNG 400×100 « Where is the Challange? » de 22 848 octets.

Le PNG ne fait que 3 298 octets utiles : après `IEND` (offset 3286), il reste **19 550 octets**. `strings` montre `There/WhereIsTheChallange.exe` et un scan des signatures donne `PK\x03\x04` à 3298, `PK\x01\x02` à 22651/22727, `PK\x05\x06` à 22826 : c'est un **ZIP collé après le PNG**.

## Flow (3 couches)

1. `unzip` du zip d'origine → `WhereIsTheChallange.png`
2. `unzip` du PNG (Info-ZIP tolère le préfixe : « 3298 extra bytes at beginning ») → `There/WhereIsTheChallange.exe` (52 224 o, PE64)
3. Ce PE contient un **overlay de 19 968 o** à l'offset 32 256 (= fin de la dernière section brute `.reloc`, 0x7c00+0x200) qui commence par `MZ\x90\x00` : un second PE, le vrai crackme.

## Comment on trouve

**Couche 2 : le PE « stripper ».** Lancé sans argument il sort avec le code 1 sans rien afficher. Les chaînes de `.rdata` (`Cant open file: `, `file is empty.`, `not found`, `Cant rewrite the file: `) et l'immédiat `mov DWORD PTR [rsp+0x24],0x905a4d` (en `objdump -d`, ~`0x1400017ae`) montrent qu'il prend un fichier en argument, y cherche la signature `4d 5a 90 00` (`MZ\x90\x00`) et réécrit le fichier sans les octets qui précèdent. C'est l'outil des hints 2.1/2.2 (« utilise le doublon sur l'original ») : un décapeur de polyglot. Piège : sur le PNG il répond `not found` (le PE n'y est qu'en deflate) et ajoute même un octet au fichier (index −1 non géré) ; appliqué à une copie du `.exe` lui-même, il n'aide pas non plus à cause du MZ à l'offset 0. Le plus fiable est de lire l'overlay via la table de sections (c'est ce que fait le solveur) :

```text
.reloc  raw_size=0x200 raw_ptr=0x7c00  → fin = 0x7e00 = 32256 ; taille fichier 52224
dd if=stripper.exe of=crackme-inner.exe bs=1 skip=32256
```

**Couche 3 : le crackme.** `crackme-inner.exe` (`file` : PE32+ console) affiche `wrong pass!` avec `petik`. Pas de chaîne claire : elles sont XORées. Le `main` est en `0x1400012a0` (xrefs vers `cin`/`cout`, `objdump -d`) :

```asm
mov DWORD PTR [rbp-0x69],0x61333231   ; "123a"  (LE : 31 32 33 61)
mov DWORD PTR [rbp-0x65],0x71716362   ; "bcqq"  (62 63 71 71)
...
mov DWORD PTR [rbp-0x61],0x3e3f2227   ; 11 octets  -> message KO
...
mov DWORD PTR [rbp-0x51],0x22223f33   ; 13 octets  -> message OK
...
140001400: movzx eax,BYTE PTR [rcx+rax]   ; input[i]
140001410: xor   al,0x50
140001412: cmp   al,BYTE PTR [rcx+rsi]    ; == enc[i] ?
140001415: jne   0x140001571              ; sinon -> affiche le message KO
```

Décodage : la clé est `0x50` pour le mot de passe **et** pour les messages.

- `enc = 31 32 33 61 62 63 71 71` → `^0x50` = `61 62 63 31 32 33 21 21` = **`abc123!!`**
- Message KO : `27 22 3f 3e 37 70 31 ...`^0x50 → `wrong pass!` ; message OK : `33 3f 22 22 …`^0x50 → `correct pass!` (les 3 dernières octets `0x71` ^0x50 = `!`).
- La boucle itère sur la longueur de `enc` (8) et pas sur celle de l'entrée : un préfixe suffit (`abc123!!xyz` OK) ; `abc123!` (7) échoue car l'octet suivant est le NUL du SSO.

Aucune session GDB/x64dbg : reverse statique (`objdump`, `strings`) + Wine.

## Vérification

```text
$ echo 'abc123!!'     | wine crackme-inner.exe  → Press any key to continue... correct pass!
$ echo 'abc123!!xyz'  | wine crackme-inner.exe  → correct pass!
$ echo 'abc123!'      | wine crackme-inner.exe  → wrong pass!
$ echo 'petik'        | wine crackme-inner.exe  → wrong pass!
```

`tools/where-is-the-challange-solve.py --check` rejoue OK (`abc123!!`) et KO (`petik`) sur le PE extrait depuis le zip d'origine ; code retour 0.

## Notes

- Le zip n'est pas un crackme « classique » : la difficulté est l'empaquetage (PNG → ZIP → PE → overlay PE).
- La vérification a été faite sur le PE extrait de l'original (identique octet pour octet à l'overlay), `original/` n'a pas été modifié.
