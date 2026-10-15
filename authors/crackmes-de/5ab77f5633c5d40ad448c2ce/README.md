# crackmes.de's crackme1_s4tan by s4tan

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2ce`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ce) |
| **Auteur (site)** | crackmes.de (auteur réel : **s4tan**) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, **.NET** (CLR 2.0) |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `dfa3a5e2b50aac81c4affaab277d289d9dae91000c2b3fe8d4ba133607cf8d51` |
| **SHA-256 (CrakMe.exe)** | voir `original/CrackMe#1/CrakMe.exe` après extraction |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2ce
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2ce
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Contenu

```
original/   CrackMe#1.zip → CrackMe#1/{CrakMe.exe, Readme.txt}
analysis/   CrakMe.decompiled.cs (ilspycmd), algorithm.txt, activate-mirror.cs
tools/      crackme1-s4tan-solve.py
```

## Énoncé (`Readme.txt`)

> this .NET crackme implements a simple key generator. The tricky part is
> to understand the msil code (reflector will not be much usefull) : )
>
> rules: no patching · no bruteforcing · write a key generator

Donc : **keygen only**, pas de patch.

## Reconnaissance

```
$ file CrakMe.exe
PE32 executable … Mono/.Net assembly
$ diec CrakMe.exe
Library: .NET Framework(CLR 2.0.50727)
```

WinForms : `Name` / `Key` / bouton **Active**. Messages :

- `Product is now registered!! : )`
- `Incorrect Key`

`ilspycmd` donne un C# lisible — le « Reflector useless » du readme est
surtout marketing : le vrai piège est que le **prédicat n’est pas dans le
corps de méthode statique**, il est **émis à l’exécution**.

## Reverse

### `ActiveButton_Click`

1. Lit `name` et `key` (non vides).
2. Crée une assembly dynamique `CrackMe1Assembly` (`AssemblyBuilderAccess.RunAndSave`).
3. Définit un type `MyDynamicType` avec un constructeur vide et une méthode
   `bool ActivateProduct(string, string)`.
4. Appelle `GenerateOpcode(ilGen)` pour remplir le corps IL de
   `ActivateProduct`.
5. `CreateType` → `Invoke(name, key)` → MsgBox OK / KO.

### `GenerateOpcode` (prédicat)

Traduction directe de l’IL (voir `analysis/CrakMe.decompiled.cs`) :

```text
name_chars = name.ToCharArray()   // loc0
key_chars  = key.ToCharArray()    // loc1

si key.Length != name.Length * 2 → return false

i = 0   // loc2  (index dans le nom)
j = 0   // loc3  (index dans la clé)

tant que j < key.Length :
    si key[j] != name[i] + j → return false   // + sur codes char
    i = (i + 1) % name.Length
    j = j + 1

return true
```

Points d’attention MSIL :

- `Ldelem_U2` charge des `char` (UTF-16) ;
- `Add` puis comparaison `Beq` : on ajoute l’index `j` au code du
  caractère du nom (pas un XOR, pas un modulo sur le résultat) ;
- la clé fait **exactement deux fois** la longueur du nom : le nom est
  parcouru **deux tours** complets.

## Keygen

Pour un nom `N` de longueur `n` :

```
key[j] = chr( ord(N[j % n]) + j )   pour j = 0 .. 2n-1
```

Exemple canonique :

| Name | Key |
|---|---|
| `petik` | `pfvlouk{qt` |

Détail des codes pour `petik` :

| j | i | name[i] | +j | key[j] |
|---|---|---|---|---|
| 0 | 0 | p (112) | 112 | p |
| 1 | 1 | e (101) | 102 | f |
| 2 | 2 | t (116) | 118 | v |
| 3 | 3 | i (105) | 108 | l |
| 4 | 4 | k (107) | 111 | o |
| 5 | 0 | p | 117 | u |
| 6 | 1 | e | 107 | k |
| 7 | 2 | t | 123 | { |
| 8 | 3 | i | 113 | q |
| 9 | 4 | k | 116 | t |

## Solveur

```bash
python3 tools/crackme1-s4tan-solve.py -q          # → pfvlouk{qt
python3 tools/crackme1-s4tan-solve.py Alice
python3 tools/crackme1-s4tan-solve.py --check petik 'pfvlouk{qt'
```

Miroir C# du prédicat : `analysis/activate-mirror.cs` (vérifié avec
`dotnet run` → `True` / `False`).

## Vérification

- Prédicat reconstruit depuis `GenerateOpcode` (ilspycmd + lecture IL).
- Keygen Python et miroir C# : `Activate("petik", "pfvlouk{qt") == true`,
  mauvaise clé → `false`.
- Règles respectées : **pas de patch**, **pas de brute**, keygen
  déterministe.

## Notes

- Les caractères de la clé peuvent sortir du printable ASCII classique
  (ex. `{` pour `t+7`) — c’est voulu.
- L’assembly dynamique est aussi sauvée comme `CrackMe1Assembly.dll` à
  côté de l’exe si le process a les droits d’écriture (`RunAndSave`).
