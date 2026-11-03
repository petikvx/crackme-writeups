# crackmes.de's keygenme3_by_bikers80 (Keygen3 by Bikers80.exe)

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3d5`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3d5) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (crackme de *Bikers80*) |
| **Plateforme** | Windows PE32 GUI, VB.NET (CLR 2.0, `diec` : Microsoft Linker 8.0 / VB.NET) |
| **SHA-256 (zip)** | `1c296bc2af24d438d5650a8a47f39e94e078c7599aa19b844c88f3daad1ea9df` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/Keygen3_by_Bikers80.zip` | archive d'origine (non modifiée, mot de passe `crackmes.one`) |
| `analysis/extract/Keygen3 by Bikers80.exe` | exe extrait (`unzip -P crackmes.one`, hors `original/`) |
| `analysis/extract/keygen3-src/` | C# décompilé : `ilspycmd -p -o keygen3-src keygen3.exe` (`WindowsApplication1/Form1.cs`) |
| `tools/keygen3-solve.py` | keygen |
| `tools/verify-harness/` | harnais .NET 8 : `var1..var19` recopiés tels quels de `Form1.cs`, avec le **vrai** runtime `Microsoft.VisualBasic` |

## Réponse

Il y a **deux** champs serial (`TextBox2`, `TextBox3`) et ils dépendent du **nom**, de l'**heure courante (HHMM)** et de `%computerName%`. Le crackme prévient : *« the time is important »* → les serials ne valent que pendant la minute où on clique sur *Ckeck*.

Exemple `petik`, ComputerName `GROK`, heure 05:07 (culture en-US, 12 h) :

| name | Serial 1 | Serial 2 |
|---|---|---|
| `petik` | `35823337087` | `744050707` |

```bash
python3 -I tools/keygen3-solve.py --name petik --computer "$COMPUTERNAME"            # heure = maintenant (12 h)
python3 -I tools/keygen3-solve.py --name petik --computer GROK --time 05:07 -q       # sortie : S1 puis S2
python3 -I tools/keygen3-solve.py --name petik --computer GROK --time 17:07 --fmt 24 # locale fr (HH:mm:ss)
```

## Premier regard

```text
$ unzip -P crackmes.one original/Keygen3_by_Bikers80.zip -d analysis/extract
$ file ...exe   → PE32 executable (GUI) Intel i386 Mono/.Net assembly
$ diec          → Compiler: VB.NET, .NET Framework (CLR 2.0.50727)
```

Fenêtre « KeygenMe By Bikers80 » : `Name`, `Sérial` (2 champs), bouton *Ckeck*, *About* (« Indication : the time is important »), *Exit*, une horloge (`Timer1`) et le label `UNREGISTERED` → `REGISTERED`.

## Flow

`fd_Click` (bouton Ckeck) → `var20()` (message « Please enter something » si le nom est vide) → `var19()` : affiche `REGISTERED` si `var18()==1`, sinon `UNREGISTERED`.
`var18()` = `var12()` ET `var17()` : chaque serial est comparé avec l'opérateur VB **`Like`** à une valeur calculée (que des chiffres → équivalent à `==`).

## Comment on trouve

**Ancrage** : le binaire est du .NET, donc `ilspycmd -p` (l'alias `decompiledotnet` n'est pas chargé dans le shell non interactif) produit `Form1.cs`. Les noms de fonctions sont volontairement obscurcis (`var1`…`var20`), mais le code est lisible.

**Chaînes « chiffrées » (`var1`)** : chaque caractère est décalé de +6 :

| Argument | Clair |
|---|---|
| `L_\`f_]nil` / `L_\`f_]nil(_r_` | `Reflector` / `Reflector.exe` (anti-Reflector : `myvar()` ferme les fenêtres de Reflector s'il tourne, sans effet sur nous) |
| `]igjon_lH[g_` | `computerName` |
| `]igjon_ol` | `computeur` (valeur de repli si la variable est vide) |
| `L?ACMN?L?>` / `OHL?ACMN?L?>` | `REGISTERED` / `UNREGISTERED` |

**Serial 1** (`var5, var6, var9, var10, var11, var12`) :

1. `var5` : 6 premiers caractères du nom → `Conversion.Hex(Asc(c))` concaténés (`petik` → `70 65 74 69 6B` → `706574696B`).
2. `var6` : on **supprime** les lettres `A`–`F` → `70657469` + `6` = `706574696` (le `B` de `6B` disparaît).
3. `var10` = `Val(...)` → `706574696`.
4. `var7/8/9` : `TimeOfDay.ToString()` → `Mid(…,1,5)` → retrait des `:` = **HHMM**. En culture en-US la chaîne est `5:07:00 AM`, donc `Mid(…,1,5)` = `5:07:` → `507` (heure sans zéro devant, **12 h**) ; en 24 h (`17:07:00`) on obtient `1707`.
5. `var11` = `Mid(str(var10 × HHMM), 1, 11)` → 11 premiers chiffres du produit ; `var12` = `Serial1 Like var11`.

   `petik` @ 05:07 : `706574696 × 507 = 358233370872` → tronqué à 11 → **`35823337087`**.

**Serial 2** (`var13…var17`) :

1. `var13` : `Environ("computerName")` (insensible à la casse sous Windows) ; vide → `computeur`.
2. `var14/var15` : même hex-ASCII + suppression de `A`–`F` (`GROK` → `47 52 4F 4B` → `47524F4B` → `475244`).
3. `var16` = `StrReverse( Val(computer) + var10 + HHMM )` — **somme** numérique, pas concaténation — et `var17` : `Serial2 Like var16`.

   `petik` / `GROK` / 05:07 : `475244 + 706574696 + 507 = 707050447` → à l'envers : **`744050707`**.

**Pièges** :

- `Mid(date, 1, 5)` dépend de la culture : 12 h/24 h change le nombre (d'où `--fmt`).
- `Val()` renvoie un `Double` puis `Math.Round` en `Long` dans un contexte `checked` : un ComputerName long (plus de ~9 chiffres hex décimaux utiles, > 9,2e18) lève un `OverflowException` côté crackme ; avec des noms ≤ 8 caractères pas de souci.
- Sous Linux, `Environ("computerName")` est sensible à la casse (harnais) ; sous Windows non.
- Les deux serials changent chaque minute.

## Debug GDB / x64dbg

Non utilisés : reverse 100 % statique (source C# décompilé). Aucun debugger MCP actif sur ce binaire.

## Vérification

- **Wine** : `wine Keygen3.exe` quitte aussitôt (`err:virtual:virtual_setup_exception stack overflow` dans Wine-Mono, wine 10.0 / sandbox) — GUI **non lançable**, donc pas de capture.
- Substitut : harnais `tools/verify-harness/` (méthodes `var1..var19` copiées de `Form1.cs`, TextBox → champs, horloge fixée), exécuté avec le vrai `Microsoft.VisualBasic` de .NET 8. Ce n'est donc pas le `.exe` lui-même mais sa logique décompilée.

```bash
cd tools/verify-harness && dotnet build -c Release -o /tmp/vh
# S1 S2 générés par le solveur, nom petik, ComputerName GROK (variable `computerName` côté Linux)
computerName=GROK dotnet /tmp/vh/verify-harness.dll petik 35823337087 744050707 05:07 en-US   # REGISTERED
computerName=GROK dotnet /tmp/vh/verify-harness.dll petik 358233370871 744050707 05:07 en-US  # UNREGISTERED (S1 faux)
computerName=GROK dotnet /tmp/vh/verify-harness.dll petik 35823337087 1744050707 05:07 en-US  # UNREGISTERED (S2 faux)
```

Autres cas validés `REGISTERED` : `17:07` fr-FR 24 h → `12061230060 / 746150707` ; `23:59` en-US → `81892007266 / 990150707`.

## Notes

- Ce n'est **pas** un contrôle d'intégrité : aucune protection ne gêne l'analyse, hormis l'anti-Reflector sans effet.
- Le résultat réel dépend de la machine (ComputerName) et de la minute : régénérer avec le solveur au moment du test.
