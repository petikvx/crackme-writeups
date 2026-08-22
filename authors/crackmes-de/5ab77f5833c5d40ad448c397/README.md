# crackmes.de's 888 (crp)

> [crackmes.one](https://crackmes.one/crackme/5ab77f5833c5d40ad448c397) · [`ORIGIN.yml`](ORIGIN.yml)

| | |
|---|---|
| **Auteur** | crp (miroir crackmes.de) |
| **Plateforme** | Linux ELF32 tiny (888 octets, no section headers) |
| **Type** | argv + anti-debug SIGTRAP → print `OK` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/888.tgz` | archive |
| `original/888/888` | binaire 888 octets |
| `original/888/readme.txt` | *make it print 'OK', no patching please* |
| `tools/888-solve.py` | argv + check gdb |

## Réponse

```bash
./original/888/888 x y key
```

| Contrainte | Valeur |
|---|---|
| `argc` | ∈ **[4, 0x40]** |
| un `argv[i]` | 3 premiers octets = **`key`** |

```bash
python3 tools/888-solve.py -q
# ./888 x y key
python3 tools/888-solve.py --check
```

## Premier regard

```text
ELF 32-bit LSB executable, Intel 80386, statically linked, no section header
size 888 ; readme : make it print 'OK', no patching please
```

## Flow / prédicat

Obfuscation lourde (retaddr patchés avec constantes `GOOD` / `0x10101010`, handlers `SIGTRAP` / `SIGFPE`).

Chemin succès (extrait) :

1. Handler SIGTRAP incrémente le compteur `[0x804837c]`, pose la clé `[0x8048384] = 0xd4a08f90`.
2. Parse argv : refuse si pas d’argument « key… » / argc hors plage (`ARGS`).
3. Avant le `write` final :
   - `xor dword [esp], [0x8048384]`
   - si compteur ≠ 2 → force `NO\r\n`
   - sinon laisse le dword (ex. `0xdeadc4df ^ 0xd4a08f90` = **`OK\r\n`**)

## Vérification

Sur **kernel moderne**, le 2ᵉ `sigreturn` échoue souvent (`ESRCH`) et le binaire affiche `NO` même avec les bons argv — comportement d’époque (2005) cassé.

Le solveur `--check` relance sous gdb la **fin de chemin OK** (compteur=2, clé, `0xdeadc4df` sur la pile) après `run x y key`, sans modifier `original/888/888` :

```bash
python3 tools/888-solve.py --check
# OK
```

## Notes

- Ce n’est **pas** un password stdin ; c’est argv + timing signaux.
- Interdiction de patcher le fichier (readme) : le check gdb ne touche pas l’original on-disk.
