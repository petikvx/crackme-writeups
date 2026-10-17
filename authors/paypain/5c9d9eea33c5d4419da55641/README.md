# paypain — de_tcrack1

| | |
|---|---|
| **ID** | [`5c9d9eea33c5d4419da55641`](https://crackmes.one/crackme/5c9d9eea33c5d4419da55641) |
| **Auteur** | paypain |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `b0c8233f8774c07d8a919641da714722bb1e74653c756047012e2f601687d411` (binaire `de_tcrack1` extrait) |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/de_tcrack1` | binaire d'origine |
| `tools/detcrack1-solve.py` | mot de passe gabarit (`-q`, `--check`) |

## Réponse

**Gabarit** : `argv[1]` de longueur ≥ 9, caractère à l'indice 4 = `@`, et exactement 3 occurrences de `b`.

```bash
./original/de_tcrack1 'xxxx@bbbxx'
python3 tools/detcrack1-solve.py --check
```

## Premier regard

```bash
file original/de_tcrack1    # ELF64 PIE, not stripped
strings -n 5 original/de_tcrack1
```

Chaînes : `WiNAll`, `[!] WRONG Password`, `[+] Login Complete`, `[+] License->%s`, `FL4GiNyOUrMinD`.

## Flow

`main(argc, argv)` : exige `argc==2`, `strlen(argv[1]) > 8`, compte les `'b'` dans `argv[1]` (doit être exactement 3), vérifie `argv[1][4] == '@'`, puis construit et affiche une « licence » en concaténant `"FL4GiNyOUrMinD"` + `argv[1]` + `"WiNAll"`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/de_tcrack1 | awk '/<main>:/,/^$/'`.

```asm
1097: cmp eax,0x8 ; jbe fail        -> strlen(argv1) > 8
10b0..10c4: boucle, compte les octets == 0x62 ('b')
10c6: cmp ecx,0x3 ; je succes        -> exactement 3 'b'
1100: cmp [argv1+4],0x40 ; jne fail  -> argv1[4] == '@'
```

La suite (concaténation de `"FL4GiNyOUrMinD"`, `argv[1]` et `"WiNAll"` via plusieurs `rep movs`/`stpcpy` entrelacés) construit uniquement le message de licence affiché — pas une étape de vérification supplémentaire, juste de la plomberie de construction de chaîne volontairement alambiquée.

## Vérification

```bash
$ ./original/de_tcrack1 'xxxx@bbbxx'
[+] Login Complete
[+] License->FL4GiNyOUrMinDxxxx@bbbxxWiNAll

$ ./original/de_tcrack1 'wrongpassword'
[!] WRONG Password
```

## Notes

- Pas de GDB nécessaire : trois conditions lisibles directement en asm statique.
- La « licence » affichée dépend du mot de passe fourni (elle l'inclut tel quel) — ce n'est pas un flag fixe à retrouver, juste la confirmation visuelle du succès.
