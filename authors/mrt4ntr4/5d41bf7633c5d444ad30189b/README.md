# mrT4ntr4 — Save Scooby

| | |
|---|---|
| **ID** | [`5d41bf7633c5d444ad30189b`](https://crackmes.one/crackme/5d41bf7633c5d444ad30189b) |
| **Auteur** | mrT4ntr4 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `c3efb1f9ed08597d5cde2dad8a232d9f889840e1759d454f14e39b26c3c3d1c6` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## ⚠️ Réponse dynamique (dépend du chemin d'exécution)

Comme [tynkute « Just crackme »](../../tynkute/5fa2cdce33c5d424269a1740/) ou [rafi « what »](../../rafi/5fd5c44c33c5d424269a1b76/), la réponse dépend d'un état d'exécution — ici le **répertoire courant** (`getcwd()`), pas une constante figée dans le binaire. Toute réponse ci-dessous n'est valable que lancée **depuis ce dossier précis** (`authors/mrt4ntr4/5d41bf7633c5d444ad30189b/`).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/save_scooby` | binaire d'origine |
| `tools/savescooby-solve.py` | recalcule la réponse depuis le cwd réel (`-q`, `--check`) |

## Réponse

```bash
cd authors/mrt4ntr4/5d41bf7633c5d444ad30189b
python3 tools/savescooby-solve.py -q | ./original/save_scooby
python3 tools/savescooby-solve.py --check
```

Pour ce dépôt (chemin `.../authors/mrt4ntr4/5d41bf7633c5d444ad30189b`), la réponse est :

```
$JQOG$RGVKM$bQEWOGPVU$ETCEMOG-YTKVGWRU$CWVJQTU$OTV4PVT4$5F41DH7633E5F444CF30189D
```

## Premier regard

```bash
file original/save_scooby    # ELF64 PIE, not stripped
strings -n 5 original/save_scooby
```

Chaînes : `Hi Scooby !!`, `Where are you??`, `You won a medal Scooby !!`, `Scooby Doobie Doo!! Not too easy`. Import `getcwd` — indice fort que la réponse dépend de l'endroit où on lance le binaire.

## Flow

`main` : `getcwd()` → transforme la chaîne caractère par caractère → `scanf("%s", input)` → compare `input` au cwd transformé.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/save_scooby | awk '/<main>:/,/^$/'`.

```asm
784: cmp al,0x2f ('/')      ; '/' -> '$'
7a7/7b8: cmp al,0x60 / 0x7a ; minuscule a-z
7c9: sub eax,0x1e           ; -> c - 30 (sort du charset a-z, decalage brut)
7e9/7fa: cmp al,0x40 / 0x5a ; majuscule A-Z
80b: add eax,0x1e           ; -> c + 30
```

Puis une boucle de comparaison tronquée (`8a2`-`8b2`) : la saisie doit **commencer par** ce cwd transformé (égalité position à position tant que les deux index restent dans les bornes des deux chaînes).

### Calcul

```python
def transform_cwd(cwd):
    out = []
    for c in cwd:
        if c == '/': out.append('$')
        elif 'a' <= c <= 'z': out.append(chr(ord(c) - 0x1e))
        elif 'A' <= c <= 'Z': out.append(chr(ord(c) + 0x1e))
        else: out.append(c)
    return ''.join(out)
```

Appliqué à `os.getcwd()` **au moment de l'exécution**, pas à une valeur figée — c'est tout l'intérêt (et le piège) du challenge.

## Vérification

```bash
$ cd authors/mrt4ntr4/5d41bf7633c5d444ad30189b
$ echo '$JQOG$RGVKM$bQEWOGPVU$ETCEMOG-YTKVGWRU$CWVJQTU$OTV4PVT4$5F41DH7633E5F444CF30189D' | ./original/save_scooby
Hi Scooby !!
Where are you??

You won a medal Scooby !!

$ echo wrong | ./original/save_scooby
Hi Scooby !!
Where are you??

Scooby Doobie Doo!! Not too easy
```

## Notes

- Pas de GDB nécessaire : toute la logique est lisible statiquement, le seul « piège » est la dépendance au `cwd` réel.
- Le décalage de 30 (`0x1e`) n'est **pas** une rotation modulo 26 (pas de wrap-around type ROT13) : les lettres en fin d'alphabet sortent du charset a-z/A-Z vers d'autres caractères ASCII (`{`, `|`, etc. selon la lettre) — reproduire l'arithmétique brute, pas une rotation alphabétique classique.
