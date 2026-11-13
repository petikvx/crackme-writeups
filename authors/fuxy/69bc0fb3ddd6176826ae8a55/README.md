# fuxy's Challenge #5

| | |
|---|---|
| **ID** | [`69bc0fb3ddd6176826ae8a55`](https://crackmes.one/crackme/69bc0fb3ddd6176826ae8a55) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | fuxy |
| **Plateforme** | Windows PE64 console (MinGW-w64 GCC 14.2) |
| **SHA-256** (`download.bin`) | `7c2f616e35d238e3b7c6b16c62a05824f57319025ae39bba0f53bfdbbe315750` |

## Contenu

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`) contenant `CTF_Level5.exe` |
| `analysis/x/CTF_Level5.exe` | exe extrait (`unzip -P crackmes.one`), non modifié |
| `tools/fuxy5-solve.py` | solveur (`-q`, `--check EXE`) |

## Réponse

**Flag : `CTF{ASCII-mOre-like_BINASCII!!!}`**

```bash
python3 -I tools/fuxy5-solve.py -q
python3 -I tools/fuxy5-solve.py --check analysis/x/CTF_Level5.exe   # preuve via xvfb-run wine
```

(Pas de champ user/login ici, donc pas d'exemple `petik`.)

## Premier regard

- `download.bin` est un **ZIP**, pas un exe : `unzip -P crackmes.one original/download.bin -d analysis/x`.
- `diec` : PE64, MinGW (`GCC: (Rev2, Built by MSYS2 project) 14.2.0`), pas packé.
- `strings` : bannière `===== CTF Level 5 Challenge =====`, `Find and enter the correct flag:`,
  `Congratulations! ...` / `Wrong!`, et surtout une longue chaîne de 32 groupes de 8 bits
  séparés par des espaces dans `.rdata` (VMA `0x140004000`).

## Flow

`main` (`0x1400016e6`) affiche la bannière, lit une ligne (`fgets` sur `0x40` octets, le `\n` final est retiré),
appelle `0x1400015b8` (`check`) et affiche `Congratulations` si le retour vaut **0**, sinon `Wrong!`.

## Comment on trouve

1. **Ancrage** : `strings -n 5` donne directement la chaîne binaire ; `objdump -s -j .rdata` confirme
   son adresse `0x140004000`. La décoder (octet = `int(b,2)`) donne le flag candidat
   `CTF{ASCII-mOre-like_BINASCII!!!}` (« more like BINASCII » : le nom du jeu).
2. **Lecture de `check` (`0x1400015b8`)** avec `objdump -d -M intel` :
   - `0x1400014c6` (`to_binary`) : `len = strlen(s); n = len*9` (`shl eax,3 ; add eax,edx`), malloc,
     puis pour chaque caractère appelle `0x140001430` qui écrit ses 8 bits MSB-first
     (`and 1`, `+0x30`, `>>1`), recopie les 8 chiffres + un espace, tant que `pos < n-9`.
   - `0x1400015b8` compare ensuite la chaîne obtenue à celle de `.rdata` (`[0x140003000]`)
     bit par bit : on saute les espaces, et on accumule `(a-'0') ^ (b-'0')` dans un compteur.
     Retour = nombre de bits différents ; `0` = succès.
3. Donc le flag est bien l'ASCII de la chaîne stockée, ce qui est confirmé par le test live.

## Prédicat consolidé

```text
enc  = to_binary(input)               # "01000011 01010100 ..." (limité à 9*len-9 caractères)
diff = Σ (stored[i]-'0') ^ (enc[j]-'0')   # sur la longueur du plus court des deux
Congratulations  <=>  diff == 0
```

## Vérification

Binaire d'origine sous `xvfb-run -a wine` :

| Entrée | Résultat |
|---|---|
| `CTF{ASCII-mOre-like_BINASCII!!!}` | **Congratulations** |
| `CTF{x}` | Wrong! |

### Faille / pièges (observés sous Wine)

La comparaison s'arrête dès que l'une des deux chaînes est finie, et l'encodeur s'arrête à
`9*len-9` caractères, donc **le dernier caractère saisi n'est jamais encodé**. Conséquences testées :
- `CTF{ASCII-mOre-like_BINASCII!!!` (sans `}`) → accepté ;
- un préfixe quelconque du flag, `CTF{ASCII`, voire `C`, `D` ou la ligne vide → accepté (`Congratulations`) ;
- le flag suivi de texte en trop → accepté aussi (comparaison coupée à la fin de la chaîne stockée).

Le flag « officiel » reste `CTF{ASCII-mOre-like_BINASCII!!!}`.

## Notes

- Aucun GDB / x64dbg / IDA utilisé : reverse statique (`strings`, `objdump`) + preuve Wine.
- Piège : le fichier téléchargé s'appelle `download.bin` mais c'est un ZIP.
