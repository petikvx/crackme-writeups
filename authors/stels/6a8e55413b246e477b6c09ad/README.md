# stels's sob Obfuscator Challenge (insane++)

| | |
|---|---|
| **ID** | [`6a8e55413b246e477b6c09ad`](https://crackmes.one/crackme/6a8e55413b246e477b6c09ad) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | stels |
| **Plateforme** | Windows x64, .NET 8 (apphost natif `CrackMe.exe` + `CrackMe.dll` managée) |
| **SHA-256** | `300d2f626d97de50dbac062d63fb60d4cbe2e778dc0673b90f3144419a428a65` (`download.bin`) |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP (pw `crackmes.one`) → contient `crackme.zip` (sans mot de passe) → `CrackMe/win-framework/{CrackMe.exe,CrackMe.dll,*.json}` |
| `analysis/src/Program.cs`, `analysis/src/Runtime.cs` | sortie `ilspycmd` de `CrackMe.dll` (classes `CrackMe.Program` et `ThemidaPlus.Runtime`) |
| `analysis/dump-strings-harness.cs` | petit harnais C# (réflexion) qui appelle `Runtime.LoadEncString` et `Dispatch` |
| `tools/stels-solve.py` | solveur (`-q`, `--check`) |

## Réponse

**Mot de passe (unique, pas de user) : `ITSDmco-JDspfloasd-d1843jdsy38`**

```bash
python3 tools/stels-solve.py          # password = ITSDmco-JDspfloasd-d1843jdsy38
python3 tools/stels-solve.py -q
python3 tools/stels-solve.py --check  # extrait le ZIP et lance CrackMe.dll via `dotnet` (OK + KO)
```

Aucun login dans ce challenge, donc pas d'exemple `petik` côté solution ; `petik` est utilisé ci-dessous comme entrée **KO**.

## Premier regard

- `download.bin` est un ZIP (pas un PE) ; il contient un second ZIP, puis un apphost `CrackMe.exe` (natif, 151 ko) et `CrackMe.dll` (34 ko, .NET 8, `runtimeconfig` net8.0).
- `strings` sur la DLL : ressources `tpl_vm_blob.bin` / `tpl_strings.bin`, espace de noms `ThemidaPlus`, méthodes `HoneypotA/B/C`, `RollingXorCheck`, `DecryptExpectedPassword`, `DeriveHmacKey`… et des noms d'API anti-debug. Le corps de `Program` est donc **virtualisé** : `CheckPassword` fait juste `Runtime.Dispatch(76, [input])`.
- Console : `Enter password:` puis, en cas d'échec, un « garbage » `0x<FNV-1a 64 bits>` (`PrintGarbage`), pas de message d'erreur.

## Flow

```
Main → LoadEncString(0x70000001)="Enter password: " → ReadLine
     → CheckPassword(input) = Runtime.Dispatch(76,[input]) != 0
          OK → Flag() (xor 4 octets) = "you win u can contact me my discord: nnov_"
          KO → PrintGarbage(input)  (FNV-1a 64 bits en hex)
```

## Comment on trouve

**Ancrage** : `ilspycmd -p CrackMe.dll` (ou `bash -ic 'decompiledotnet …'`) → `Program.cs` + `Runtime.cs`. Les chaînes ne sont pas en clair : tous les littéraux passent par `Runtime.LoadEncString(token)` (tokens `0x70000001…0x70000012` = 1879048193…1879048210), déchiffrés depuis `tpl_strings.bin`.

1. **Constantes** : plutôt que de réécrire le déchiffrement des chaînes, on appelle `LoadEncString` par réflexion (`analysis/dump-strings-harness.cs`, projet `net8.0` lancé avec le `dotnet` Linux : `ResolveHiddenIAT` et les contrôles Win32 sont sautés hors Win32NT). Résultat :

   | token | valeur |
   |---|---|
   | …0B/0C/0D `_pwShare0/1/2` | `bdef3b1d…4c95`, `00dd144b…4f30`, `89d14cb9…9d44` (32 octets chacun) |
   | …0E `_pwIv` | `7a8b9c0d1e2f30415263748596a7b8c9` |
   | …0F `_pwCt` | `ac0d153d…8872` |
   | …06/07/08 | `backdoor-` / `backdoor-letmein` / `letmein` → **HoneypotA** (leurre, `HoneypotB`/`C` renvoient toujours `false`) |

2. **Mot de passe attendu** : `DecryptExpectedPassword()` = AES-256-CBC/PKCS7, clé `share0 ^ share1 ^ share2`, IV `_pwIv`, CT `_pwCt` →
   `49 54 53 44 6D 63 6F 2D 4A 44 73 70 66 6C 6F 61 73 64 2D 64 31 38 34 33 6A 64 73 79 33 38` = `ITSDmco-JDspfloasd-d1843jdsy38` (30 octets = `ExpectedLength`).

3. **`RollingXorCheck` n'est qu'une égalité** : avec `k` la clé roulante (init `2779096485`),
   `((c ^ k) & 0xFF) == (exp[i] ^ (k & 0xFF))` ⇔ `c & 0xFF == exp[i]` pour tout `i`, car `k & 0xFF` s'annule des deux côtés. La mise à jour `k = ror(k,5) + c` est donc décorative. Le mot de passe = le plaintext AES tel quel. (`ExpectedHash`/`ExpectedMac`/`DeriveHmacKey` sont présents mais servent de bruit : la vérification réelle qui nous intéresse est l'égalité ci-dessus, confirmée ci-dessous par la VM elle-même.)

4. **Piège** : la VM (`Dispatch`, bytecode XOR par blocs de 32 octets, clé `{90,60,110,41,123,77,143,18}`) est un interpréteur à pile ; plutôt que de désassembler les 6 ko de bytecode, on l'a **exécutée** : `Runtime.Dispatch(76, ["ITSDmco-…"])` renvoie `1`, et `"petik"` / `…x` (longueur 31) renvoient `0`. Le flag de poison anti-debug (`_poison`) n'est positionné que si un débogueur est détecté ; sous `dotnet` normal rien ne se déclenche.

## Vérification

Preuve live sur le binaire d'origine : `CrackMe.dll` extrait de `original/download.bin`, lancé avec le runtime .NET 8 réel (`dotnet CrackMe.dll`, stdin redirigé). **Wine n'est pas installé sur cette machine** ; l'apphost `CrackMe.exe` ne fait que charger cette même DLL, donc la preuve porte bien sur le code du challenge.

```text
$ python3 tools/stels-solve.py --check
'ITSDmco-JDspfloasd-d1843jdsy38'  -> Enter password: you win u can contact me my discord: nnov_ | Press Enter to exit...
'ITSDmco-JDspfloasd-d1843jdsy38x' -> Enter password: 0xeae5bb173f3b51b1 | Press Enter to exit...
'petik'                           -> Enter password: 0x21061e03d828cbdc | Press Enter to exit...
```

OK : message de victoire ; KO (`petik`, mot de passe + 1 caractère) : seulement le hash « garbage ».

## Notes

- Pas de GDB, pas de debugger ni MCP IDA : reverse purement statique (.NET) + exécution réflexive.
- Le nom « sob Obfuscator / ThemidaPlus » est du marketing : la VM n'ajoute pas de logique, juste de l'indirection ; les vraies protections sont les chaînes chiffrées et l'AES « partagé » en 3 shares.
- Honeypots : `backdoor-letmein`, variable d'env `TPL_DEBUG=0xdeadbeef` — ne donnent rien.
