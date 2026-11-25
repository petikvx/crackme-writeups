# sally1337's Nexus! (Lite)

| | |
|---|---|
| **ID** | [`694af49f0c16072f40f5a379`](https://crackmes.one/crackme/694af49f0c16072f40f5a379) — [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | sally1337 |
| **Plateforme** | Windows PE32+ x86-64, console |
| **SHA-256** | `05bfa131fef54ffc3dec074fd61009118e7b7880f50cc0262f7ba25020393557` |

| Fichier | Rôle |
|---|---|
| `original/nexus-lite.exe` | binaire d'origine |
| `tools/nexus-lite-solve.py` | solveur / `--check` via Wine |

## Réponse

Pas de username : une seule « Master Key ».

```text
NEXUS-MASTER-KEY-2025
```

```bash
python3 tools/nexus-lite-solve.py            # affiche la clé
python3 tools/nexus-lite-solve.py -q --check # la rejoue dans le binaire (xvfb-run + wine)
```

(Pas d'exemple `petik` : le crackme ne demande pas de nom ; `petik` comme clé est refusé.)

## Premier regard

```bash
file original/nexus-lite.exe     # PE32+ console x86-64, 6 sections
strings -n 5 original/nexus-lite.exe
```

`strings` montre la bannière `=== NEXUS! (lite) ===`, des messages anti-debug
(`[!] DEBUGGER DETECTED!`, `Validation disabled`), `Enter Master Key:`,
`Access Denied` / `ACCESS GRANTED`, la table base64
`ABCDEF…+/` et, juste à côté, la chaîne `NEXUS-MASTER-KEY-2025`.

## Flow

1. Bannière, puis « Running anti-debug checks » (si débogueur : validation désactivée).
2. `Enter Master Key:` → lecture d'une ligne.
3. `Validating...` (re-test anti-debug), puis `Access Denied` ou `ACCESS GRANTED`.
4. En cas de succès : affiche la clé, des statistiques de temps et une « Encrypted form » en base64.

## Comment on trouve

- **Ancrage** : `strings -n 5` — la seule chaîne qui ressemble à un secret et qui n'est
  pas un message est `NEXUS-MASTER-KEY-2025`, collée à l'alphabet base64 dans `.rdata`.
- **Hypothèse puis test** : on la fournit sur stdin au binaire sous Wine :

  ```bash
  echo NEXUS-MASTER-KEY-2025 | xvfb-run -a wine original/nexus-lite.exe
  # ===== ACCESS GRANTED! =====
  # Correct Key: NEXUS-MASTER-KEY-2025
  # [*] Encrypted form: DgUYFRN6DQETFAUSegsFGXplY2Vo
  ```

- **Forme chiffrée** : le base64 décode en `0e0518151 37a0d01…`. XOR avec la clé donne
  `@@@@@W@@@@@@W@@@WWSW]` : ce n'est pas un simple XOR à clé fixe sur la clé elle-même
  (je ne l'ai pas rétro-ingénié plus loin ; ce n'est pas nécessaire pour la validation).
- **Piège** : le binaire n'a pas de condition de sortie sur EOF ; avec une mauvaise clé et
  stdin fermé il boucle sur `Access Denied` (sortie de plusieurs dizaines de Mo) → utiliser
  `timeout`, comme le fait le solveur.

## Limites de l'analyse

Le test de comparaison n'a **pas** été désassemblé (ni IDA ni GDB utilisés) : la clé vient de
`strings` et a été confirmée **en live**. Je n'ai pas prouvé qu'aucune autre clé n'est
acceptée ; `petik` et `NEXUS-MASTER-KEY-2024` sont refusées.

## Vérification

| Entrée | Résultat (Wine, `xvfb-run -a`) |
|---|---|
| `NEXUS-MASTER-KEY-2025` | `ACCESS GRANTED` |
| `petik` | `Access Denied` |
| `NEXUS-MASTER-KEY-2024` | `Access Denied` |

`python3 tools/nexus-lite-solve.py --check` → `OK`.
Pas de screenshot (console).
