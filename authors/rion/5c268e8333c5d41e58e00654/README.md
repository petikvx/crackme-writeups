# rion — keyGme

| | |
|---|---|
| **ID** | [`5c268e8333c5d41e58e00654`](https://crackmes.one/crackme/5c268e8333c5d41e58e00654) |
| **Auteur** | rion |
| **Plateforme** | Linux **ELF32** (i386), C, strippé |
| **SHA-256** | `430985df3e78f665557af3dbf657baf6b0f455482573d946907cae64c9aee834` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/keyGme` | binaire d'origine (32-bit) |
| `analysis/keyGme.i64` | base IDA |
| `tools/keygme-solve.py` | serial gabarit (`--prefix`, `-q`, `--check`) |

## Réponse

**Gabarit, 16 caractères** : 15 premiers caractères A-Z/0-9 au choix, 16ᵉ = octet de contrôle calculé.

```bash
./original/keyGme 'AAAAAAAAAAAAAAAT'
python3 tools/keygme-solve.py --check
```

## Premier regard

```bash
file original/keyGme     # ELF32 (i386), stripped
strings -n 5 original/keyGme
```

Chaînes : `Found invalid character!`, `Usage: %s [serial-key]`, `Your key must be 16 characters.`, `Congratulation, You are registered now.`, `Sorry, the code was invalid.`

## Flow

`main` exige `argc==2`, `strlen(argv[1])==16`, puis valide la clé caractère par caractère.

## Comment on trouve

**Ancrage** : MCP `ida` sur le binaire 32-bit strippé (fonctions reconnues sans symboles explicites — `isupper`/`isdigit` identifiées par leurs bornes de comparaison).

```c
bool checkKey(char *key) {         // sub_8048323
    int n = strlen(key);           // 16
    int v3 = 0;
    for (i = 0; i < n - 1; ++i) {
        char c = key[i];
        if (!((c>='A' && c<='Z') || (c>='0' && c<='9'))) {
            puts("Found invalid character!"); exit(3);
        }
        v3 = ((c + v3) >> 1) % 3840 + 10;
    }
    return v3 == key[n-1];          // le dernier octet DOIT valoir v3
}
```

Les 15 premiers caractères peuvent être n'importe quelle combinaison de lettres majuscules / chiffres ; le 16ᵉ caractère est un **octet de contrôle** calculé par un accumulateur `((c + v3) >> 1) % 3840 + 10`. Pour que la comparaison finale (contre un `char` signé) réussisse, le résultat doit tomber dans `0..127` — ce qui arrive naturellement pour la plupart des préfixes (le `% 3840` ne suffit pas toujours à le garantir, mais c'est le cas pour l'exemple choisi).

```python
v3 = 0
for c in "AAAAAAAAAAAAAAA":        # 15 x 'A'
    v3 = ((ord(c) + v3) >> 1) % 3840 + 10
# v3 = 84 = 'T'
key = "AAAAAAAAAAAAAAA" + "T"       # 16 caracteres
```

## Vérification

```bash
$ ./original/keyGme 'AAAAAAAAAAAAAAAT'
Congratulation, You are registered now.

$ ./original/keyGme 'AAAAAAAAAAAAAAAA'
Sorry, the code was invalid.
```

## Notes

- Pas de GDB nécessaire : binaire 32-bit mais logique entièrement statique et déterministe, reproductible en Python.
- Binaire ELF32 : s'exécute directement sur une machine x86-64 avec les bibliothèques 32-bit installées (`ld-linux.so.2` multi-arch), pas besoin de QEMU.
