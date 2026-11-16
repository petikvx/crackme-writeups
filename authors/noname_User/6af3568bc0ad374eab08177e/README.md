# noname_User's idk

| | |
|---|---|
| **ID** | [`6af3568bc0ad374eab08177e`](https://crackmes.one/crackme/6af3568bc0ad374eab08177e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | noname_User |
| **Plateforme** | Linux x86-64, ELF statique (GCC 14.2 Debian), strippé |
| **SHA-256** (`original/download.bin`) | `79ab3b4a1b3d5633553054b62928902a1a878a999399ec7368f622738e3689c6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en fait un **ZIP** (mdp `crackmes.one`) contenant `spidercff_crackme_x64.so` |
| `analysis/x/spidercff_crackme_x64.so` | ELF extrait (exécutable, type EXEC malgré `.so`) |
| `tools/noname-idk-solve.py` | solveur (`-q`, `--check <elf>`) |
| `tools/emu-consts.py` | recon unicorn : constantes `A`, `B` des fonctions obfusquées |

## Réponse

```
./spidercff_crackme_x64.so fae9b4f69ba6ce2a-5104bde8fe50fd62
ACCESS GRANTED
```

Pas de nom d'utilisateur : le serial est unique. `python3 tools/noname-idk-solve.py -q`.

## Premier regard

- `download.bin` = ZIP chiffré (`unzip -P crackmes.one`), l'ELF est dans `analysis/x/`.
- `strings` : `serial: `, `ACCESS DENIED`, `ACCESS GRANTED`. Sans argument, le programme demande `serial: ` sur stdin.

## Flow

`main` à `0x401660` (entry `0x4018c0` → `__libc_start_main(0x401660)`) :

1. argv[1] (ou fgets sur stdin) : longueur **33** et `s[16] == '-'`.
2. Boucle de 16 tours : `s[i]` et `s[i+17]` sont décodés en hex (0-9, a-f, A-F) → `x1` (rbx) et `x2` (rbp), deux u64.
3. Calcul de deux constantes `A = f(0xc3c3f00d5ec1a11e)`, `B = f(0xdeadb00dcafe1234)` (`f` = `0x44ca70`).
4. `r12 = A + g1(x1)` ; `rax = g2(r12 ^ x2) + B`.
5. Succès si `r12 == 0xc3c3c3c35ec1dead` **et** `rax == 0xdeadc0decafebabe`.

## Comment on trouve

- Ancrage : `objdump -d -M intel --start-address=0x401660` après avoir localisé `serial: ` (offset `0xd6460`) et l'entry point.
- Les deux comparaisons finales (`xor rax,0xdeadc0decafebabe`, `xor r12,0xc3c3c3c35ec1dead`, `or`, `jne`) donnent les cibles.
- `g` = `0x415410(x, table_ops, k1, k2)` : 4 tours, l'op du tour *i* est `table[(k1[i]^k2[i]) & 3]`. Les octets xorés valent 0,1,2,3 → ops dans l'ordre 0,1,2,3. Un appel de fonction aléatoire (via la table `0x507b20`) est sauté car `[0x507c28]` a été initialisé à `0x5ec1deadb00dc3c3` par `f`.
- Tables d'ops (`0x501660` pour g1, `0x501640` pour g2), chacune : `(x^C)*0xbf58476d1ce4e5b9`, `rol`, `(x^C')*K`, `ror` :

| | op0 C | op1 | op2 C' | op3 |
|---|---|---|---|---|
| g1 | `9e3779b97f4a7c15` | rol 17 | `c3c3c3c3deadf00d` | ror 31 |
| g2 | `94d049bb133111eb` | rol 23 | `5ec1deadb00dc3c3` | ror 23 |

- Tout est **bijectif** (K impair → inverse modulaire, rol↔ror), donc on inverse :
  1. `x1 = g1⁻¹(0xc3c3c3c35ec1dead − A)`
  2. `x2 = g2⁻¹(0xdeadc0decafebabe − B) ^ 0xc3c3c3c35ec1dead`
- `f` (`0x44ca70` + `0x415490`, dispatch via tables de pointeurs) est trop touffue à lire : on l'**émule avec unicorn** (`tools/emu-consts.py`) → `A = 0xd7efe16dbc5bb020`, `B = 0x7dc1a562ae55e0e6` (hardcodées dans le solveur). Les valeurs de `g1`/`g2` émulées ont aussi servi à confirmer la lecture des ops.
- Piège : `unzip` d'abord ; `python3 -I` masque les paquets utilisateur (unicorn) → lancer `emu-consts.py` sans `-I`.

## Vérification

Pas de GDB ni de debugger (reverse statique + émulation unicorn), donc pas de section GDB.

```
$ python3 tools/noname-idk-solve.py --check analysis/x/spidercff_crackme_x64.so
OK : 0 ACCESS GRANTED
flag: CMO{FAE9B4F69BA6CE2A-5104BDE8FE50FD62}
KO : 1 ACCESS DENIED        # dernier digit modifié
```

## Notes

- Le binaire affiche aussi un flag `CMO{…}` = serial en majuscules.
- L'original n'est pas modifié ; l'ELF extrait est sous `analysis/`.
