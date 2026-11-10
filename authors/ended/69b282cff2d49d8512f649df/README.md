# ended's catgirl.crack

| | |
|---|---|
| **ID** | [`69b282cff2d49d8512f649df`](https://crackmes.one/crackme/69b282cff2d49d8512f649df) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | ended |
| **Plateforme** | .NET 10 (`CatgirlCrack.dll` + apphost ELF), console |
| **SHA-256** | `afa69f8ac7b180b6b766dd5cc2897be9c2192b05fa0407e7d567a33b7c9c353d` |

## Contenu du dossier

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mdp `crackmes.one`) contenant `catgirlcrack.zip` (zip imbriqué) |
| `analysis/x/Catgirl.Crack/` | extraction (apphost `CatgirlCrack`, `.dll`, `.pdb`, `.json`) |
| `analysis/run/` | copie de travail du `.dll` redirigée vers .NET 8 pour l'exécuter ici (voir Vérification) |
| `tools/ended-solve.py` | solveur : relit le mot de passe dans le `.dll`, `--check` rejoue les 3 branches |

## Réponse

**Mot de passe : `Mint`** (comparaison insensible à la casse : `mint`, `MINT` passent aussi). Pas de user.

```bash
python3 -I tools/ended-solve.py -q --check
```

## Premier regard

- `download.bin` est un ZIP, qui contient lui-même `catgirlcrack.zip` (non chiffré) → `Catgirl.Crack/CatgirlCrack{,.dll,.pdb,...}`.
- `CatgirlCrack.dll` : PE .NET (`_CorExeMain`, `v4.0.30319`, TFM `.NET 10.0`), 7,6 Ko ; le PDB donne le chemin de build `.../catigrl/CatgirlCrack/obj/Debug/net10.0`.
- `strings -e l` sur le `.dll` sort directement les chaînes UTF-16 (heap `#US`) : `Enter the password below =^_^=:`, `Mint`, `meow`, `Mrrooww! Good Kitty!…`, `Meeeoww! That would've been my first guess too, but it's wrong teehee~`, `Try again :(…`.
- Piège : `ilspycmd` 8.2 plante sur ce binaire (`System.Version.ToString(fieldCount)` sur le TFM net10) et `dotnet` n'a pas le runtime 10 ici → lecture directe de l'IL.
- Le gros bloc de `(\x00(` qui précède dans `#US` est de l'ASCII-art en Braille (U+2800…) affiché après `Console.Clear()`.

## Flow

1. `Console.Clear()`, affichage de l'ASCII-art Braille, puis `WriteLine("Enter the password below =^_^=: ")`.
2. `ReadLine()`.
3. `input.Equals("Mint", OrdinalIgnoreCase)` → « Good Kitty ».
4. Sinon `input.Equals("meow", OrdinalIgnoreCase)` → « that would've been my first guess too, but it's wrong » (leurre).
5. Sinon « Try again ».

## Comment on trouve

Ancrage : `Program.Main` est le seul corps de méthode (en-tête *fat* `13 30 03 00 71 00 00 00`, code de 0x71 octets, offset fichier `0x250`). Ses `ldstr` (`0x72 <token> 0x70`) pointent dans `#US` ; j'ai parsé les streams de métadonnées (`BSJB`, `#US` à l'offset 1132) pour résoudre les tokens.

IL de `Main` (désassemblé à la main depuis les octets) :

```text
28 0c000000a   call Console::Clear
72 01000070    ldstr #1        ; art Braille (token 0x70000001)
...            call WriteLine
72 e6090070    ldstr 0x9e6     ; "Enter the password below =^_^=: "
28 0d00000a    call WriteLine
28 0e00000a    call ReadLine        ; stloc.1 (0b)
07 72 28 0a 00 70 1b 6f 0f00000a   ldloc.1 ; ldstr 0xa28 ("Mint") ; ldc.i4.5 ; callvirt String::Equals(string, StringComparison)
0c 08 2c 0f    stloc.2 ; ldloc.2 ; brfalse +15        -> sinon test suivant
72 32 0a 00 70 ldstr "Mrrooww! Good Kitty!..." ; WriteLine
07 72 72 0a 00 70 1b 6f ...        ldloc.1 ; ldstr 0xa72 ("meow") ; ldc.i4.5 ; Equals
72 7c 0a 00 70 -> message « first guess » ; sinon 72 0b 0b 00 70 -> « Try again »
```

- Le 2ᵉ `ldstr` comparé (`0xa28`) est `"Mint"` : c'est le mot de passe ; le 3ᵉ (`0xa72`) est `"meow"`, qui ne mène qu'à un message moqueur (le piège « premier réflexe »).
- `ldc.i4.5` (`0x1b`) = `StringComparison.OrdinalIgnoreCase` → casse ignorée.
- Pas de dérivation, de hash ni d'anti-debug : le mot de passe est une constante. Le solveur (`tools/ended-solve.py`) ne le code pas en dur, il lit le token du 2ᵉ `ldstr` de `Main` dans le `#US` du `.dll`.

## Vérification

Pas de runtime .NET 10 sur la machine (6.0 et 8.0 seulement), donc l'apphost ELF d'origine ne démarre pas. Preuve live sur le **vrai IL** : copie du `.dll` sous `analysis/run/` (jamais `original/`), runtimeconfig en 8.0 et les 2 champs de version de l'`AssemblyRef` (`System.Runtime`, `System.Console`) patchés `10.0.0.0 → 8.0.0.0` dans la copie (offsets 1244 et 1264) :

```bash
cd analysis/run
for i in Mint MINT meow foo; do echo $i | dotnet CatgirlCrack.dll | tail -1; done
```

| Entrée | Sortie |
|---|---|
| `Mint` | `Mrrooww! Good Kitty! Mwwwaaah~!` ✅ |
| `MINT` | `Mrrooww! Good Kitty! Mwwwaaah~!` ✅ |
| `meow` | `Meeeoww! That would've been my first guess too, but it's wrong teehee~` ❌ |
| `foo` | `Try again :(, you got this!` ❌ |

## Notes

- Pas de GDB / debugger : reverse 100 % statique + exécution de contrôle.
- Le test sur l'apphost ELF natif n'a pas été fait (runtime 10 absent) ; la logique est identique puisque c'est le même `CatgirlCrack.dll`.
- `meow` est un leurre volontaire de l'auteur.
