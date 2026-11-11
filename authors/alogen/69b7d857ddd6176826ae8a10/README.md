# alogen's Simple Java Verify

| | |
|---|---|
| **ID** | [`69b7d857ddd6176826ae8a10`](https://crackmes.one/crackme/69b7d857ddd6176826ae8a10) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | alogen |
| **Plateforme** | Android (APK `MyApp6_1.0.apk`, Java, `classes.dex`) |
| **SHA-256** | `87bda96ba59b5b8f16154880feb4a9735190cb1b4f9e2dc0dbce9082275bfca7` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP chiffré (mot de passe `crackmes.one`) contenant `MyApp6_1.0.apk` |
| `tools/alogen-solve.py` | keygen + `--check` (relit le dex et rejoue le prédicat) |

## Réponse

Toute clé de **8 caractères** commençant par `77` et finissant par `1`.

| user | clé |
|---|---|
| `petik` | **`77petik1`** |

```bash
python3 -I tools/alogen-solve.py --user petik -q   # 77petik1
python3 -I tools/alogen-solve.py --check
```

## Premier regard

- `download.bin` est en fait un ZIP chiffré (`unzip -P crackmes.one`) → `MyApp6_1.0.apk`, lui-même un ZIP (`classes.dex` de 7,5 Ko, signé `TIMASHKOV`).
- `strings classes.dex` : `Enter License Key:`, `Verify`, `Access Granted`, `Invalid Key`, et surtout les noms d'API `length`, `startsWith`, `endsWith` + la classe `MainActivity.checkLicense`. Le check est donc trivial.

## Comment on trouve

Ancrage : désassemblage du dex avec androguard (`AnalyzeDex`, venv hors dépôt ; pas de jadx/apktool dispo), méthode `Lcom/example/crackme/MainActivity;->checkLicense`.

```
invoke-virtual v4, String->length()I
const/16 v5, 8
if-ne v4, v5, :invalid          ; longueur == 8
const-string v5, "77"
invoke-virtual v4, v5, String->startsWith  ; préfixe "77"
if-eqz ... :invalid
const-string v5, "1"
invoke-virtual v4, v5, String->endsWith    ; suffixe "1"
if-eqz ... :invalid
Toast "Access Granted"
```

Prédicat : `len(k)==8 and k.startswith("77") and k.endswith("1")`. Il reste 5 caractères libres au milieu ; ici `77` + `petik` + `1` = 8 pile, d'où `77petik1` pour l'utilisateur d'exemple.

Piège : le fichier `.bin` n'est pas un APK direct (ZIP chiffré à ouvrir d'abord) ; aucun hash/XOR, pas d'unique bonne clé.

## Vérification

Pas d'émulateur Android dans l'environnement : la preuve live sur l'appli n'a **pas** été faite. La vérification faite est statique : `--check` extrait le dex de l'original, confirme la présence des constantes `"77"`, `"1"` et des chaînes de résultat, puis rejoue le prédicat (OK pour `77petik1`, KO pour `77petik2` — mauvais suffixe — et `77petik` — 7 caractères).

## Notes

Aucune session GDB / debugger utilisée. Les bytes de `original/` n'ont pas été modifiés.
