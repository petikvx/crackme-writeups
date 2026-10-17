# ezman — easy keyg3nme

| | |
|---|---|
| **ID** | [`5da31ebc33c5d46f00e2c661`](https://crackmes.one/crackme/5da31ebc33c5d46f00e2c661) |
| **Auteur** | ezman |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `c5a1a8b2545eb7868b26ca7dc79380cad8a0bfc01d1c53ce4f5e5c6662154a71` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keyg3nme` | binaire d'origine |
| `tools/keyg3nme-solve.py` | clé valide, multiple de 1223 (`--key`, `-q`, `--check`) |

## Réponse

**Gabarit : n'importe quel multiple de 1223** (positif ou négatif, dans la plage `int`).

```bash
echo 1223 | ./original/keyg3nme
python3 tools/keyg3nme-solve.py --check
```

## Premier regard

```bash
file original/keyg3nme      # ELF64 PIE, not stripped
strings -n 5 original/keyg3nme
```

Chaînes : `Enter your key: `, `Good job mate, now go keygen me.`, `nope.`. Symbole `validate_key` présent.

## Flow

`main` lit un entier (`scanf("%d")`), appelle `validate_key(key)`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/keyg3nme | awk '/<validate_key>:/,/^$/'`.

```asm
11f8: mov edx,0x1acb0aad   ; constante magique GCC pour la division par 1223
11ff: imul edx             ; edx:eax = ecx * 0x1acb0aad
1201: sar edx,0x7
1204: sar eax,0x1f         ; signe de ecx
1209: sub edx,eax          ; edx = ecx / 1223  (division signee, sans instruction DIV)
120d: imul eax,edx,0x4c7   ; 0x4c7 = 1223 ; eax = (ecx/1223) * 1223
1213: sub ecx,eax          ; ecx = ecx % 1223
1217: test eax,eax ; jne -> echec ; sinon succes
```

C'est l'optimisation classique du compilateur pour remplacer une division par une constante (`key % 1223`) par une multiplication + décalages (pas d'instruction `div`/`idiv`). Le check se résume à **`key % 1223 == 0`** : n'importe quel multiple de 1223 convient.

## Vérification

```bash
$ echo 1223 | ./original/keyg3nme
Enter your key:  Good job mate, now go keygen me.

$ echo 5 | ./original/keyg3nme
Enter your key:  nope.
```

## Notes

- Pas de GDB nécessaire : la séquence `imul`/`sar`/`imul`/`sub` est une signature très reconnaissable de division par constante, documentée (algorithme de Granlund & Montgomery) — reconnaître ce motif suffit à retrouver le modulo sans even avoir besoin de recalculer la constante magique à la main.
