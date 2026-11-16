# vilxd's decode me

| | |
|---|---|
| **ID** | [`69245c422d267f28f69b806e`](https://crackmes.one/crackme/69245c422d267f28f69b806e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | vilxd |
| **Plateforme** | Windows x86-64, console, MinGW (non strippé, symboles présents) |
| **SHA-256 (`download.bin`)** | `ae5c2f68890cb1b49c7913bb8b031c93d98c5fb888e14360905339353fa57c4a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mdp `crackmes.one`) contenant `decodeme.exe` — non modifié |
| `analysis/x/decodeme.exe` | copie extraite du ZIP (pour reverse / wine) |
| `tools/decodeme-solve.py` | solveur (`-q`, `--check`) |

## Réponse

Pas de username : un simple mot de passe.

```
Pa>__-3\\->L@>_>
```

(deux backslashes littéraux). Solveur : `python3 tools/decodeme-solve.py [-q] [--check analysis/x/decodeme.exe]`.

## Premier regard

- `diec` : PE64, MinGW. `strings` : `Write password: `, `Yes!`, `No!`, `pause`, et symboles lisibles `transformChar`, `byteEncoder`, `byteDecoder`, `checker`, `checkDbg`.
- `.rdata` @ `0x140013000` : `\x%02X`, `%s`, `Yes!`, `No!`, `pause`, `Write password: `, et à `0x14001302a` la chaîne **`Pa100-322-1L@101`** — leurre : ce n'est *pas* le mot de passe (testé : `No!`).

## Flow (`main` @ `0x140011d60`)

1. `transformChar(secret, buf)` : copie `Pa100-322-1L@101` et substitue.
2. `byteEncoder(buf, enc1)` : chaque octet → texte `\xHH` (`sprintf("\\x%02X")`).
3. `checkDbg()` (anti-debug, sans effet sous wine).
4. `scanf("%s", input)` puis `byteEncoder(input, enc2)`.
5. `checker(enc1, enc2)` : retire tous les `\` puis tous les `x` des deux chaînes, `strcmp`, affiche `Yes!` / `No!`.

## Comment on trouve

- Ancrage : `objdump -d -M intel --no-show-raw-insn decodeme.exe` (symboles présents), lecture de `main`, `transformChar` (`0x1400016f0`), `byteEncoder` (`0x140001760`), `checker` (`0x140001860`).
- `transformChar` : boucle sur les caractères, avec
  `'0'(0x30) → '_'(0x5f)`, `'1'(0x31) → '>'(0x3e)`, `'2'(0x32) → '\'(0x5c)`, autres inchangés.
- `byteEncoder` puis `checker` : l'encodage hex puis la suppression de `\` et `x` ne laisse que les paires hexa (`5061…`). La comparaison est donc simplement l'égalité de la chaîne saisie avec la chaîne transformée (encodage injectif). `byteDecoder` n'est jamais appelé : code mort.
- Assemblage : `P a 1 0 0 - 3 2 2 - 1 L @ 1 0 1` → `P a > _ _ - 3 \ \ - > L @ > _ >` = `Pa>__-3\\->L@>_>`.
- Piège : saisir le secret brut `Pa100-322-1L@101` donne `No!`.

## Vérification

```
$ python3 tools/decodeme-solve.py --check analysis/x/decodeme.exe
password = Pa>__-3\\->L@>_>
check: OK (Yes!)
$ printf 'Pa100-322-1L@101\n' | xvfb-run -a wine analysis/x/decodeme.exe   # → No!
$ printf 'Pa>__-3\\->L@>_>\n' | xvfb-run -a wine analysis/x/decodeme.exe    # un seul backslash → No!
```

## Notes

Reverse 100 % statique (objdump) + preuve sous wine ; ni GDB ni x64dbg utilisés.
