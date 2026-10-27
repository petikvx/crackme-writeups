# crackmes.de's spaghettime (SpaghettiMe) by jim

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c388`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c388) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | JiM~ (crackmes.de, 27 mai 2008) — local : `crackmes-de` |
| **Plateforme** | Windows, PE32 GUI, .NET 2.0 (WinForms), x86 |
| **SHA-256 (zip)** | `a62ea945fc3bcbd85198d9cfdbad6e461ab3769c8e6cc205ffe8be62b0c7186f` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/spaghettime.zip` | archive d'origine (mot de passe `crackmes.one`), non modifiée |
| `analysis/zip/` | contenu extrait : `SpaghettiMe.exe`, `readme.txt`, + sources C# ilspycmd (`SpaghettiMe-src/`) |
| `analysis/harness/` | `SpaghettiMe.exe` copié + `harness.exe` (compilé depuis `tools/check-harness.cs`) |
| `tools/spaghettime-solve.py` | keygen (`--name`, `-q`, `--check`) |
| `tools/check-harness.cs` | harness .NET qui appelle le vrai prédicat du binaire d'origine sous Wine |

## Réponse

Name/Key : la clé est du **base64 de 30 octets** (40 caractères exactement).

| Name | Key |
|---|---|
| `petik` | `kQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA` |
| `Hello` | `pgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA` |

```bash
python3 tools/spaghettime-solve.py --name petik          # affiche name + key
python3 tools/spaghettime-solve.py --name petik --check  # + validation Wine (harness)
```

## Premier regard

```bash
file SpaghettiMe.exe     # PE32 GUI, Mono/.Net assembly
diec SpaghettiMe.exe     # .NET Framework CLR 2.0.50727, pas de packer
```

Le `readme.txt` annonce « un keygenme .NET avec de la récursion ». Fenêtre : `Name`, `Key`, boutons Register / About, et une musique de fond (BASSMOD, ressource `cerror_ode_to_maktone`) — décor sans rapport avec le check.

## Comment on trouve le prédicat

Ancrage : décompilation C# (`ilspycmd -p -o SpaghettiMe-src SpaghettiMe.exe`, équivalent de `decompiledotnet`, l'alias n'étant pas dispo dans le shell agent). Tout est dans `spaghettime/mainForm.cs`, handler `btnRegister_Click`.

```csharp
if (txtName.Text != "" && txtKey.Text.Length == 40 && overloaded())  // -> REGISTERED!
```

Quatre surcharges du même nom `overloaded` (c'est le « spaghetti » : l'obfuscation par nom) :

1. `overloaded()` — décode la clé : `Convert.FromBase64String(key)` → 40 car. base64 sans padding = **30 octets**, copiés dans `int[] array2`. Le test final est
   `overloaded(name) % 255 == overloaded(array2)[0]`.
2. `overloaded(string)` — `overloaded(str.GetHashCode() / 100000)`.
3. `overloaded(int[] chr)` — récursion : tant que `Length > 1`, `num = dernier`, nouveau tableau `a[i] = (num + chr[i]) % 255` pour `i < n-1`, on recommence ; renvoie le tableau à 1 élément.
4. `overloaded(int num)` — récursion sur l'entier : `f(0)=1337` ; pour `n>0` : `n` pair → `3 + f(n-1)`, impair → `f(n-1) - 2` (symétrique pour `n<0`).

### Décodage

* **Côté nom** : `f(n)` est juste `1337 + Σ (+3 si k pair, −2 si k impair)` pour `k` allant de `n` à `±1`. Calculable en boucle (le solveur évite la récursion, qui exploserait la pile pour n ≈ 10⁴ en Python).
  `petik` : `GetHashCode() = -730695945` → `/100000` (division C#, vers 0) = `-7306` → `f = 4990` → `4990 % 255 = 145`.
* **Côté clé** : la réduction est affine mod 255 sur le premier octet. Avec `b[1..29] = 0`, il suffit de balayer `b[0]` dans `0..254` jusqu'à ce que la réduction donne la cible : pour `petik`, `b[0] = 0x91` → base64 de `91 00…00` = `kQAA…AA`.
* **Pièges** :
  * `string.GetHashCode()` dépend du runtime. L'exe est x86 / CLR 2.0 : algorithme .NET Framework 32 bits (`h1=h2=5381 ; h1=((h1<<5)+h1)^c0 ; h2=((h2<<5)+h2)^c1 ; h1 + h2*1566083941`), réimplémenté dans `net_hash`. Confirmé : harness sous Wine donne `-730695945` pour `petik`, idem Python.
  * Le `%` C# garde le signe : si `f(...) % 255 < 0` la cible est négative et aucune clé n'existe (les octets sont ≥ 0). Pour ces noms le solveur lève une erreur → changer de nom. `petik` donne 145 ≥ 0, OK.
  * La valeur finale `[0]` est dans `0..254` (déjà réduite mod 255) donc 255 n'est jamais atteignable.

## Vérification

Pas de GDB ni de debugger : reverse 100 % statique (source C#). Preuve live : Wine ne compile pas via `csc.exe` (wrapper cassé en wine-mono), donc le harness est compilé avec Roslyn du SDK dotnet contre les DLL du Framework du préfixe Wine :

```bash
F=~/.wine/drive_c/windows/Microsoft.NET/Framework/v4.0.30319
dotnet <sdk>/Roslyn/bincore/csc.dll /noconfig /nostdlib /target:exe /out:harness.exe \
  /r:$F/mscorlib.dll /r:$F/System.dll /r:$F/System.Windows.Forms.dll /r:$F/System.Drawing.dll tools/check-harness.cs
cd analysis/harness
xvfb-run -a wine harness.exe SpaghettiMe.exe petik kQAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA
```

Le harness instancie le vrai `spaghettime.mainForm` du binaire d'origine par réflexion, remplit `txtName` / `txtKey` et appelle sa méthode privée `overloaded()` (le prédicat réel, pas une réimplémentation).

| Cas | Résultat |
|---|---|
| `petik` / `kQAA…AA` | `hash=-730695945 nameval=4990` → **VALID** |
| `Hello` / `pgAA…AA` | `hash=-327378614 nameval=2971` → **VALID** |
| `petik` / `AAAA…AA` (40 × `A`) | **INVALID** |

Limite : seul le prédicat est exécuté, pas le clic sur Register (le handler ne fait que tester `Text != ""`, `Length == 40` et ce prédicat, puis changer les textes en `REGISTERED!`).

## Notes

* Ce n'est pas un check de nom/serial classique : l'obfuscation ne repose que sur le nom identique des surcharges.
* Le message de succès est « REGISTERED! / Now show me a keygen :3 ».
* Le keygen « copier-coller » de l'auteur est évité en réimplémentant le hash .NET ; sur un runtime Mono le hash serait différent et les clés ci-dessus ne passeraient pas.
