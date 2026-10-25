# justafewnumbers (obnoxious) — crackmes.de

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c349`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c349) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | obnoxious (miroir crackmes.de) |
| **Plateforme** | Windows PE32 console, .NET 2.0 (C#, build Debug, pdb `mex`) |
| **SHA-256 (zip)** | `d4fa7ccc5858558474fde0f733accd533d777ce896d1c022c337b242b5584132` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/JustAFewNumbers.zip` | archive d'origine (mot de passe `crackmes.one`), intacte |
| `analysis/extracted/` | `JustAFewNumbers.exe` + `Readme.txt` extraits du zip (hors `original/`) |
| `analysis/src/` | C# décompilé (`ilspycmd -p`) |
| `tools/justafewnumbers-solve.py` | solveur (énumère les 8 solutions) + `--check` live |

## Réponse

Pas de user/serial : le crackme attend **11 arguments** en ligne de commande (le nom `petik` n'a donc pas de sens ici).

```text
JustAFewNumbers.exe 12 20 10 14 35 35 10 12 20 35 14
```

```bash
python3 -I tools/justafewnumbers-solve.py -q --check analysis/extracted/JustAFewNumbers.exe
python3 -I tools/justafewnumbers-solve.py --all     # 8 solutions au total
```

## Premier regard

```text
$ file analysis/extracted/JustAFewNumbers.exe
PE32 executable for MS Windows 4.00 (console), Intel i386 Mono/.Net assembly
$ strings -n 4 …  →  Crackme, Check, gcfact, fail, Convert.ToInt32, "RSDS…JustAFewNumbers.pdb"
```

`Readme.txt` : « Difficulty 2 ~ 2.5 — No Patching, No BruteForcing » (le solveur raisonne par contraintes, il ne bruteforce pas le binaire).
Les symboles `gcfact` / `fail` / `Check` annoncent un pgcd et une validation par arguments.

## Flow

`Main` exige `args.Length == 11`, copie dans un tableau puis appelle `Check.chk`. `chk` découpe : `A = args[0..5]` (6 valeurs), `B = args[6..10]` (5 valeurs).

## Comment on trouve

**Ancrage** : .NET → `~/.dotnet/tools/ilspycmd -p -o analysis/src analysis/extracted/JustAFewNumbers.exe` (le wrapper `decompiledotnet` n'était pas disponible dans le shell agent). Tout est dans `Check.chk` / `Check.gcfact` (`analysis/src/Check.cs`).

`gcfact(p,q)` = pgcd (boucle `i=1..q`, garde le dernier diviseur commun). Contraintes de `chk` :

1. `A[0]≤A[1]`, `A[2]≤A[3]`, `A[4]≤A[5]` ; chaque `A[i]` fait **exactement 2 caractères** (donc 10..99).
2. Paire 1 : produit = 240 **et** ppcm = produit/pgcd = 60 → pgcd = 4. Diviseurs de 240 à deux chiffres : (12,20) pgcd 4 ✔ ; (10,24) pgcd 2, (15,16) pgcd 1 ✘ → **12 20**.
3. Paire 2 : produit = 140, pgcd = 2 → (10,14) ✔ (7×20 refusé : 7 n'a qu'un chiffre) → **10 14**.
4. Paire 3 : pgcd = 35 **et** ppcm = produit/pgcd = 35 → a·b = 35·35 avec pgcd 35 → **35 35**.
5. `B` : on compte les couples `(B[i],A[j])` égaux ; le total doit valoir **6**. Les valeurs de `A` sont 12,20,10,14 (1 occurrence) et 35 (2 occurrences) : chaque `B[i]` doit donc appartenir à `A`, avec somme des multiplicités = 6.
6. Chaîne : pour `i=0..2`, `pgcd(B[i],B[i+1]) < pgcd(B[i+1],B[i+2])` — soit 3 comparaisons, qui couvrent les 5 valeurs de `B` (`B3,B4` via `i=2`).

Le solveur filtre les paires candidates (2., 3., 4.), puis énumère `B ∈ A⁵` et applique la transcription exacte de `chk` : 8 solutions. Exemple retenu : `B = 10 12 20 35 14` → pgcd successifs 2, 4, 5, 7 (strictement croissants), comptage 1+1+1+2+1 = 6 ✔.

### Piège : `fail()` ne quitte pas

`fail()` affiche « Invalid Arguements! » mais **ne termine pas** le programme, et `chk` continue jusqu'au `Console.WriteLine("Success!!!!")`. Seul le `catch` (exception) appelle aussi `fail()`. Donc « Success » apparaît même avec de mauvais arguments ; la bonne solution est celle qui n'affiche **aucun** « Invalid » (le solveur teste exactement cela). De même `Main` n'arrête pas après un mauvais nombre d'arguments (→ `fail` deux fois).

## Vérification

Wine (`xvfb-run -a wine`) : le runtime wine-mono de cette machine plante (`virtual_setup_exception stack overflow`) → **pas de preuve Wine**. Preuve live à la place : copie temporaire de l'exe exécutée par le runtime `dotnet` 8 (`runtimeconfig.json` minimal, `original/` jamais touché) :

```text
12 20 10 14 35 35 10 12 20 35 14  → Success!!!!
12 20 10 14 35 35 10 12 20 35 15  → Invalid Arguements! ×2 puis Success!!!!   (KO : 15 ∉ A)
1 2                               → Invalid Arguements! ×2
```

`tools/justafewnumbers-solve.py --check` rejoue le premier cas : `OK (Success, sans Invalid)`.

## Notes

- Aucun GDB / debugger : reverse 100 % statique (décompile C#) + exécution live.
- Les 8 solutions ne diffèrent que par `B` ; `A = 12 20 10 14 35 35` est unique.
