# breakers_crackme_4 — brk12345 (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c1a5)
- **Plateforme** : Windows PE32 .NET 2.0 (VB.NET WinForms, noms obfusqués), difficulté 2.0
- **Publication** : 2018-03-25
- **Règles** (`RULES.txt`) : patch autorisé seulement pour les nags et les « enable », faire un keygen.

## Solution

Avec `A(s) = base64(MD5(UTF-16LE(s)))` et `B(s) = A(s)·3` (même base64 concaténé trois fois) :

```
h1 = A(nom)
x1 = A(h1) + B(nom)
b2 = A(B(x1))
serial = B(A(B(A(b2 + x1 + h1))))
```

Le serial est donc toujours un base64 de 24 caractères répété 3 fois. Exemple `petik` →
**`IMygpr5vfL+16/UYAcRTIg==IMygpr5vfL+16/UYAcRTIg==IMygpr5vfL+16/UYAcRTIg==`**. Keygen : `tools/breakers_crackme_4-solve.py`.

## Comment on trouve

1. `7z x` (mot de passe `crackmes.one`) : l'exe, `RULES.txt` et un `ObfuscationMap.xml` laissé par l'obfuscateur.
2. `ilspycmd` décompile sans souci malgré les noms renommés (`9xM=`, `+RM=`…) → `analysis/decompiled.cs`.
3. Dans `InitializeComponent` (`9hM=`), le bouton « Check » et les deux TextBox sont `Enabled = false` et un `Timer`
   de 5000 ms déclenche `/hM=` qui affiche le nag « This is a nag that you have to disable! ». Ce sont les
   « nags et enables » que les règles autorisent à patcher ; le keygen n'en a pas besoin.
4. Le handler du bouton (`+xM=`) enchaîne deux helpers : `9xM=` = MD5 sur `UnicodeEncoding` (UTF-16LE) puis
   base64, et `+RM=` = la même chose concaténée 3 fois. Il compare le résultat final à `TextBox2` avec
   `Operators.CompareString` (comparaison binaire, sensible à la casse).

## Vérification

GUI non pilotée (champs désactivés, il aurait fallu patcher). Le **code de vérification** du handler a été recopié tel quel
(mêmes appels .NET `UnicodeEncoding`, MD5, `Convert.ToBase64String`, `Operators.CompareString`) et rejoué en natif
avec `dotnet` (`analysis/verify-Program.cs`) : le serial du keygen Python pour `petik` donne « Great Work!!Now write a tut! ».
