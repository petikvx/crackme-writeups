# nimacpp — level2

| | |
|---|---|
| **ID** | [`65da0fce6d3d2b1fef4be4df`](https://crackmes.one/crackme/65da0fce6d3d2b1fef4be4df) |
| **Auteur** | nimacpp |
| **Plateforme** | Linux ELF64 PIE, C (`sym.c`), non strippé |
| **SHA-256** | `1143e8c9587ec30e8ad220c0d032c8b705e84fd1d7e5d05673bef85e441496ee` |

Voir [`ORIGIN.yml`](ORIGIN.yml). Description officielle, en entier : « *Look at it as cracker* ».

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/level2` | binaire d'origine (non modifié) |
| `analysis/level2-patched` | copie patchée (2 octets) |
| `tools/level2-solve.py` | génère le patch et le vérifie (`-q`, `--check`) |

## Réponse

Ce binaire **ne lit aucune entrée** : le « mot de passe » est la chaîne que le programme affiche dans son message de succès, **`01234567891`** (`01234567891 is password`). Ce message est inatteignable sans patch (voir plus bas).

```bash
./original/level2                     # Look at it as cracker
python3 tools/level2-solve.py --check
./analysis/level2-patched             # 01234567891 is password
```

**Réserve d'interprétation** : le challenge ne donne aucune règle (pas d'énoncé, pas d'invite). J'ai retenu la lecture la plus littérale — atteindre le chemin de succès — et la réponse est la valeur affichée. Je n'ai pas trouvé de relation entre `01234567891` et la seconde constante `Jsfdb56d65a` (pas de décalage ni de XOR constant), qui ressemble à un leurre.

## Premier regard

`strings` : `01234567891`, `Jsfdb56d65a`, `%s is password`, `Look at it as cracker`. Pas de `scanf`/`fgets`/`argv` : aucune saisie possible.

## Flow

`main` @ `0x1169` : `s = "01234567891"` (`.rodata+0x4`) ; `strcmp(s, "Jsfdb56d65a")` (`.rodata+0x10`). Égal → `printf("%s is password", s)` ; différent → `printf("Look at it as cracker")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/level2 | awk '/<main>:/,/ret/'`.

```asm
1175: lea rax,[rip+0xe88]   # 0x2004 "01234567891"   -> [rbp-8]
1184: lea rdx,[rip+0xe85]   # 0x2010 "Jsfdb56d65a"
1191: call strcmp
1196: test eax,eax
1198: jne  11b7             ; 75 1d : les deux constantes diffèrent toujours -> "Look at it as cracker"
11a1: lea rax,[rip+0xe74]   # 0x201c "%s is password"  (rsi = [rbp-8] = "01234567891")
```

Les deux chaînes sont des constantes distinctes : la comparaison échoue toujours, quel que soit l'environnement. Pour voir le message de succès il faut neutraliser le saut : `75 1d` → `90 90` à l'offset `0x1198` (PIE : offset fichier = VMA ici). Le patch est appliqué sur une **copie** dans `analysis/`.

## Vérification

```text
$ ./original/level2             -> Look at it as cracker
$ ./analysis/level2-patched     -> 01234567891 is password
```

## Notes

- Reverse statique + exécution ; pas de GDB.
- Le binaire d'origine n'est jamais modifié (règle du dépôt) ; le patch est dans `analysis/`.
