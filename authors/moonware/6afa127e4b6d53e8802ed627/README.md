# MoonWare's .NET Framework — write-up

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6afa127e4b6d53e8802ed627)
- Auteur : MoonWare · Plateforme : Windows, .NET Framework 4.8 console (protégé par une VM « Avm »)

| Fichier | Rôle |
|---|---|
| `original/CrackMe.exe` | binaire d’origine (SHA-256 `330c3280…3b07`) |
| `original/CrackMe-src/` | sortie `decompiledotnet` : seule la VM (`AvmF3594EC7`) est lisible, la logique est dans le bytecode |
| `tools/moonware-solve.py` | affiche / vérifie les identifiants (`-q`, `--check`) |
| `tools/avm-trace/` | patcheur Mono.Cecil (copie tracée de l’exe) |
| `tools/moonware-oracle.py` | oracle « préfixe » qui extrait user + password caractère par caractère |
| `tools/kernel32-shim.c` | shim `IsDebuggerPresent() = 0` pour lancer l’exe avec `dotnet` sous Linux |

## Réponse

| Champ | Valeur |
|---|---|
| Username | **`ElfGroups`** |
| Password | **`e73cddb195c38ff1a614f323107e58c671cdbea7bc2b1588`** |

Identifiants **constants** (pas de keygen : aucun calcul à partir du nom, donc pas de `petik`).

```bash
python3 tools/moonware-solve.py -q      # ElfGroups:e73cddb1…1588
python3 tools/moonware-solve.py --check # rejoue l’exe : GRANTED puis DENIED (dernier char modifié)
```

## Premier regard

```bash
file original/CrackMe.exe        # PE32 .NET, console
diec original/CrackMe.exe        # .NET Framework 4.8
bash -ic 'decompiledotnet original/CrackMe.exe'
```

`Main` ne contient que des `__ldtoken(...)` puis `XRBAXIFCLQGHN.R7KLK4FOF(0, args, …)` : tout le code réel
(prompts, `ReadMasked`, comparaisons) est **virtualisé**. Le projet décompilé n’est que l’interpréteur de VM :
bytecode chiffré dans une ressource, déchiffré par ChaCha (`expand 32-byte k`), puis 60 opcodes interprétés.
Les chaînes ne sont jamais des littéraux : chaque `ldstr` (opcode 6) est un blob mélangé (permutation xorshift
+ rotation + chaînage) décodé **caractère par caractère** par la classe `DV13OEJJ`.

## Flow

Titre `HomoCracks!` → `[*] Enter Username:` (`ReadLine`) → `[*] Enter Password:` (`ReadMasked`, `*` à l’écran)
→ comparaison user puis password → `[+] ACCESS GRANTED` / `[-] ACCESS DENIED`.

## Comment on trouve

**Ancrage** — la comparaison `string == string` est l’opcode VM d’égalité : `CP8B70U93ABO(DV13OEJJ a, DV13OEJJ b, bool)`
(`AvmF3594EC7/XRBAXIFCLQGHN.cs:3123`) :

```csharp
TPVFG32J.UQONUI8RF(); I0UR9ME9FW951.UQONUI8RF();      // rewind des deux flux
while (true) {
    bool f1 = a.B29Y44MW2T(out char c1);               // char suivant (décodé à la volée)
    bool f2 = b.B29Y44MW2T(out char c2);
    if (f1 != f2) return false;  if (!f1) return true;
    if (c1 != c2) break;                                // premier écart => faux
}
return false;
```

La comparaison est **caractère par caractère avec sortie au premier écart** : le texte attendu est lu *en clair*
par le flux `b` juste avant d’échouer. C’est un oracle de préfixe parfait, aucun besoin de comprendre le bytecode.

**Mise en œuvre**

1. Lancer l’exe hors Wine. Sous Wine il plante (`IOException: Invalid access`) : la VM dérive sa clé de
   `Debugger.IsAttached`/`IsDebuggerPresent` + un test de timing (`P0AHK2IJJ`, `LXR2QKT3`) et Wine-mono corrompt le
   déchiffrement. Contournement : exécuter avec le runtime `dotnet` natif (net8) en copiant l’exe dans `analysis/run/`
   avec un `CrackMe.runtimeconfig.json` et un shim `libkernel32.dll.so` (`int IsDebuggerPresent(void){return 0;}`),
   car le P/Invoke `kernel32.dll!IsDebuggerPresent` n’existe pas sous Linux.
2. `ReadMasked` utilise `Console.ReadKey` → il faut un **pty** : `script -qec "dotnet CrackMe.exe" /dev/null`.
3. Patcher (Mono.Cecil, `tools/avm-trace`) `CP8B70U93ABO` pour afficher, à chaque itération, `c1` et `c2` :

```text
A:p B:E        # entrée « petik » vs attendu « E… »
```

4. Oracle (`tools/moonware-oracle.py`) : on relance en allongeant le préfixe avec le caractère `B:` rendu :
   `E` → `El` → `ElfGroups`. Quand l’entrée est complète, `A` vaut `\0` puis la comparaison **bascule sur le password**
   (`A:x B:e` : mon `x` contre `e`), et on répète : `e73cddb1…1588` (48 caractères hex, la dernière itération
   donne `A:\0 B:\0` → `ACCESS GRANTED`).

**Pièges**

- Le premier essai (trace sur `L4QJ39X346FIY`, décodeur de `ldstr`) ne montre que les messages : les constantes de
  comparaison ne sont jamais matérialisées en `string`, elles ne passent que par le flux `DV13OEJJ`.
- `NB8QBI5NE27ZHO` (`==` côté `Avm.LYJXBYKFUB9`) existe mais n’est pas atteinte pour ce check : inutile de la hooker.
- Après la fin du username, le *même* patch affiche la 1re lettre du password : ne pas la confondre avec la suite du user.

## Vérification

```text
$ printf 'ElfGroups\ne73cddb195c38ff1a614f323107e58c671cdbea7bc2b1588\n' | script -qec "dotnet CrackMe.exe" /dev/null
[*] Enter Password: ************************************************
[+] ACCESS GRANTED
$ … (dernier char 8 → 9)
[-] ACCESS DENIED
```

`python3 tools/moonware-solve.py --check` rejoue ces deux cas.

## Notes

- Preuve live : runtime `dotnet` + shim (Wine échoue, voir plus haut) ; pas de GDB / x64dbg / IDA utilisés.
- Ce n’est pas un keygen : un seul couple user/password valide, extrait via l’oracle de préfixe.
