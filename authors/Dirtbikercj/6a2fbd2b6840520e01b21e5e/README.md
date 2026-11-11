# Dirtbikercj's Secure License Portal

| | |
|---|---|
| **ID** | [`6a2fbd2b6840520e01b21e5e`](https://crackmes.one/crackme/6a2fbd2b6840520e01b21e5e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Dirtbikercj |
| **Plateforme** | .NET 10 console (`CrackMe.exe` = apphost natif, logique dans `CrackMe.dll`), zip imbriqué |
| **SHA-256** | `a2656613c2c2c2c377522a1d2dd2311201d5015888e914c0d2cee92d633659f6` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP du site (pwd `crackmes.one`) → `CrackMe.zip` → `CrackMe.dll`, `CrackMe.exe`, `CrackMe.runtimeconfig.json` |
| `tools/dirtbikercj-license-solve.py` | extrait la clé depuis le ZIP d'origine (`-q`, `--check`) |
| `analysis/x1/` | contenu extrait (hors `original/`) |
| `analysis/run8/` | copie de test pour exécuter sur un runtime .NET 8 (voir Vérification) |

## Réponse

**License key : `SECURE-PASSWORD`**

```bash
python3 -I tools/dirtbikercj-license-solve.py        # License key : SECURE-PASSWORD
python3 -I tools/dirtbikercj-license-solve.py --check
```

Pas de login dans ce challenge (donc pas d'exemple `petik` : `petik` comme clé → `[FAIL] Access denied`).

## Premier regard

- `download.bin` est un ZIP (chiffré, mot de passe du site) contenant un second `CrackMe.zip`, lui-même contenant l'apphost `CrackMe.exe` (PE64 natif, 162 Ko), `CrackMe.dll` (assembly .NET, 6,5 Ko) et un `runtimeconfig.json` ciblant `net10.0`.
- `strings -el CrackMe.dll` (heap `#US`, UTF-16) : `Secure License Verifier v2.1`, `[ERROR] Naughty...`, `Enter your license key: `, `Access denied`, `[SUCCESS] Wasn't secure after all :(`, `[FAIL] Access denied`. **Aucune** clé en clair dans `#US` → elle est cachée ailleurs.
- `strings -n4` (métadonnées) : `ValidateKey`, `<ValidateKey>b__0_0`, `Select`, `ToArray`, `ReadOnlySpan`1`, `Debugger`/`get_IsAttached`, `__StaticArrayInitTypeSize=16` et un champ `<PrivateImplementationDetails>` nommé par un SHA-256 : c'est un tableau d'octets statique de 16 octets.

## Flow

`Main` : affiche la bannière ; si `Debugger.IsAttached` → `[ERROR] Naughty...` et `Environment.Exit` (simple anti-debug managé) ; sinon lit la ligne, appelle `ValidateKey(input)` → `[SUCCESS]` ou `[FAIL] Access denied`.

## Comment on trouve la clé

1. **Ancrage** : `ilspycmd` 8.2 plante sur cette DLL (`Version.ToString(fieldCount)` dans `DecompilerTypeSystem`, probablement la version d'assembly/refs net10) et `decompiledotnet` n'est pas disponible dans l'environnement agent. Lecture directe de l'IL au `od` : en-tête CLI à l'offset fichier `0x208` (metadata RVA `0x21a8` → fichier `0x3a8`, car `.text` RVA `0x2000` = fichier `0x200`).
2. **`ValidateKey`** (méthode à l'offset fichier `0x250`, tiny/fat header `13 30 03 00`, 0x55 octets d'IL) :

   ```text
   02 28 0e 00 00 0a    ldarg.0 ; call String::IsNullOrEmpty
   2c 02 16 2a          brfalse.s +2 ; ldc.i4.0 ; ret          (vide → faux)
   7f 01 00 00 04       ldsflda  <PrivateImplementationDetails>::24FC11A1…  (blob 16 o)
   1f 0f                ldc.i4.s 15
   73 0f 00 00 0a       newobj ReadOnlySpan<byte>(void*, int)   → les 15 premiers octets
   … Enumerable.Select(span, <>9__0_0)  ; ToArray()              (lambda mise en cache)
   73 14 00 00 0a       newobj String(char[])
   02 06 28 15 00 00 0a ldarg.0 ; ldloc.0 ; call String::op_Equality
   ```
   La lambda `<ValidateKey>b__0_0` (offset `0x3a5`, `0a 03 2a`) = `ldarg.1 ; ret` : identité `byte → char`. La clé attendue est donc la chaîne formée par les **15 premiers octets du blob statique**.
3. **Retrouver le blob** : le champ `<PrivateImplementationDetails>` pointe sur une RVA de `.text` ; ici la donnée est collée juste après le stub apphost `ff 25 00 20 40 00` (`jmp [_CorExeMain]`) à l'offset `0x1000` :

   ```text
   001008  53 45 43 55 52 45 2d 50 41 53 53 57 4f 52 44 00   SECURE-PASSWORD.
   ```
   15 caractères + `00` (le 16ᵉ octet est ignoré par le `ldc.i4.s 15`). → `SECURE-PASSWORD`.
4. **Pièges** : la clé n'est pas dans `#US` (aucun `ldstr` associé) ; le décompilateur casse ; le titre « secure » est trompeur, c'est une constante. Le test du débogueur ne gêne pas l'analyse statique.

## Vérification

Le runtime local est .NET 8 (pas de 10). Sur une **copie** de la DLL sous `analysis/run8/` (jamais `original/`) : `runtimeconfig` passé à `net8.0` et la version des 3 AssemblyRef (`System.Runtime`, `System.Console`, `System.Linq`, octets `0x71e/0x732/0x746`) patchée de 10 → 8. La logique n'est pas touchée.

```bash
cd analysis/run8
echo SECURE-PASSWORD | ~/.dotnet/dotnet CrackMe.dll   # → [SUCCESS] Wasn't secure after all :(
echo petik           | ~/.dotnet/dotnet CrackMe.dll   # → [FAIL] Access denied
```

Résultat observé : OK avec `SECURE-PASSWORD`, KO avec `petik`. Pas de GDB/x64dbg/IDA utilisés (reverse statique de l'IL + exécution réelle).

## Notes

- Clé hardcodée, pas de dérivation : aucun keygen nécessaire.
- Sur Windows avec .NET 10 : `CrackMe.exe` (apphost) lance `CrackMe.dll`, même comportement.
