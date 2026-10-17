# nutcake — WhiteRabbit

| | |
|---|---|
| **ID** | [`5c11e2f333c5d41e58e0057a`](https://crackmes.one/crackme/5c11e2f333c5d41e58e0057a) |
| **Auteur** | nutcake |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `f5a204ee1b3c68d94f4f35cd3acd4f899c96689111706fbffb4bf747313c1f8c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/hidden` | binaire d'origine |
| `analysis/hidden.i64` | base IDA |
| `tools/whiterabbit-solve.py` | flag (`-q`, `--check`) |

## Réponse

| | |
|---|---|
| **Flag** | `flag{3sc0nd1d0_3h_M41s_G0st0S0}` |

```bash
python3 tools/whiterabbit-solve.py --check
```

## Premier regard

```bash
file original/hidden     # ELF64 PIE, not stripped
strings -n 5 original/hidden
./original/hidden
```

Chaînes : `The only way out is inward`, `Voce consegue achar a funcao escondida?` (« peux-tu trouver la fonction cachée ? »), et un format `printf` long (`flag{%d%c%c%dn%c%d%c%d_%dh_M%d%ds_G%d%ct%dS%d}`). Symbole `secret` présent.

## Flow

`main` affiche juste les deux messages ci-dessus et retourne — **n'appelle jamais `secret()`**. Le titre (« WhiteRabbit », « le seul chemin vers l'extérieur est vers l'intérieur ») et la question en portugais pointent directement vers la fonction jamais atteinte.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/hidden | awk '/<main>:/,/^$/'` — aucun `call secret` visible. Décompilation directe de `secret()` (MCP `ida`) :

```c
int secret() {
    return printf("flag{%d%c%c%dn%c%d%c%d_%dh_M%d%ds_G%d%ct%dS%d}\n",
                  3, 115, 99, 0, 100, 1, 100, 0, 3, 4, 1, 0, 115, 0, 0);
}
```

Tous les arguments sont des **constantes** : pas besoin d'exécuter quoi que ce soit, substituer directement chaque `%d`/`%c` par sa valeur (`%c` → caractère ASCII) donne le flag.

## Debug GDB (pas à pas)

Pour confirmer que `secret()` est bien du code mort jamais atteint par `main`, et vérifier que l'appel direct produit exactement la sortie attendue, on l'invoque sous GDB :

```bash
gdb -q -batch \
  -ex 'break main' \
  -ex 'run' \
  -ex 'call (int)secret()' \
  --args ./original/hidden
```

Observé :

```text
Breakpoint 1, 0x00005555555551d9 in main ()
$1 = 32
```

`secret()` retourne `32` (valeur de retour de `printf`, le nombre d'octets écrits, `\n` inclus) — exactement `len("flag{3sc0nd1d0_3h_M41s_G0st0S0}\n") == 32`, confirmant indépendamment le calcul statique.

## Vérification

```bash
$ python3 tools/whiterabbit-solve.py --check
flag = 'flag{3sc0nd1d0_3h_M41s_G0st0S0}'
secret() a imprime 32 octets (attendu: 32 )
```

## Notes

- `secret()` ne dépend d'aucune entrée utilisateur : c'est purement du code mort à retrouver et appeler, pas un check à satisfaire.
- Le double thème (anglais « White Rabbit » / portugais) est purement narratif, sans incidence sur le prédicat.
