# crackme_1.0 by skjobax (CrackMe2.0)

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2dc`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2dc) — voir [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur original : skjobax) |
| **Plateforme** | Windows, PE32 .NET (VB.NET WinForms), x86 |
| **Difficulté** | 1.0 |
| **SHA-256 zip** | `b64188cbbe5099a22aeff1296c459f7e47d8ca11f9a6e7ab48d31d612f0e3c68` |
| **SHA-256 exe** | `2b855b2b46189ebec4a01acebf59741e2bc7bf55d4fe15a70869e54f3b98ece6` |

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/CrackMe2.0.zip` | archive d'origine (mot de passe site `crackmes.one`) |
| `original/CrackMe2.0.exe`, `original/README` | binaire et consigne (« Create Keygen and post it ») |
| `analysis/CrackMe2.0.decompiled.cs` | sortie complète `ilspycmd` |
| `analysis/vb-runtime-check/` | petit projet .NET 8 qui rejoue le calcul avec le vrai `Microsoft.VisualBasic.CompilerServices.Operators` |
| `tools/skjobax-crackme1-solve.py` | keygen (`--trace` montre les élargissements de type) |

## Réponse

Pour **n'importe quel nom non vide** (ex. `petik`) :

```
Serial : Infinity
```

```bash
./tools/skjobax-crackme1-solve.py petik          # -> Infinity
./tools/skjobax-crackme1-solve.py --trace petik  # i=10 Int64, i=20 Decimal, i=31 Double, i=326 +Infinity
```

Le texte exact est `Double.PositiveInfinity.ToString()` dans la **culture courante** : `Infinity` sous .NET Framework en anglais / culture invariante (cas visé par l'auteur). Sur une machine configurée dans une autre langue, c'est le `NumberFormatInfo.PositiveInfinitySymbol` de cette culture qu'il faut taper.

## Premier regard

```
$ file original/CrackMe2.0.exe
PE32 executable for MS Windows 4.00 (GUI), Intel i386 Mono/.Net assembly, 4 sections
```

17 Ko, assembly VB.NET (namespace `crackme`, `My.MyApplication`, `WindowsFormsApplicationBase`), pas d'obfuscateur. Un formulaire `Form1` avec deux `TextBox` (`user`, `serial`) et un bouton `check_btn` (« Check Serial! »).

## Flow

`check_btn_Click` → `encrypt(user.Text)` → trois `MsgBox` possibles :

- nom vide → « You're kidding me. »
- mauvais serial → « That's very easy! Retry... »
- bon serial → « Nice Job! Now post your Keygen! »

## Comment on trouve le serial

### 1. Décompilation

```bash
ilspycmd original/CrackMe2.0.exe > analysis/CrackMe2.0.decompiled.cs
```

`Form1.encrypt` (ILSpy, simplifié) :

```csharp
object obj = 0;                                   // Integer boxé
for (object i = 0; i <= 10000; i++)               // ForLoopInitObj / ForNextCheckObj
    obj = (i % 100 == 0)
        ? Operators.AddObject(obj, 1)
        : Operators.AddObject(Operators.MultiplyObject(obj, 9), Len(user.Text));
object obj4 = Operators.AddObject(obj, Len(user.Text));
if (Operators.CompareString(serial.Text, obj4.ToString(), false) != 0) -> « Retry... »
else -> « Nice Job! »
```

En VB source, c'est du code sans `Option Strict`, avec des variables `Dim x` non typées (donc `Object`) : tout passe par les opérateurs *late-bound* `Operators.AddObject` / `MultiplyObject`.

### 2. Le piège : le type de `obj` change en cours de route

On pourrait croire à un `Integer` qui déborde modulo 2³² (et chercher une valeur dépendant du nom). Mais les `Operators.*Object` du runtime VB **n'enveloppent pas** et ne lèvent pas d'exception : en cas de dépassement ils **élargissent** le type du résultat :

| Itération | Type de `obj` | Valeur (nom `petik`, n = 5) |
|---|---|---|
| 0 → 9 | `Integer` | 1, 14, 131, … 435 848 050 → dépasserait 2³¹ |
| 10 | `Long` | 3 922 632 451 |
| 20 | `Decimal` | 13 677 373 641 439 044 901 |
| 31 | `Double` | 4.29e29 (Decimal max ≈ 7.9e28 dépassé) |
| ≈ 326 | `Double` | **+Infinity** (> 1.8e308) |

(valeurs exactes affichées par `analysis/vb-runtime-check` ; elles diffèrent un peu selon n mais les seuils sont les mêmes.)

Un `Double` infini le reste : `Infinity * 9 + n = Infinity`, et le `+1` des itérations multiples de 100 n'y change rien. Comme la boucle va jusqu'à 10 000, le résultat final `obj + Len(nom)` vaut toujours `+Infinity`, **indépendamment du nom** (seul le cas nom vide est filtré avant).

### 3. Assemblage

`obj4.ToString()` sur un `Double` infini renvoie le symbole d'infini de la culture courante → `Infinity` en en-US / invariant sous .NET Framework. Le « keygen » demandé est donc constant.

## Vérification

Pas de GUI ici (WinForms .NET Framework). La preuve consiste à rejouer exactement les mêmes appels avec le **vrai runtime** `Microsoft.VisualBasic` (la version .NET 8 est portée du même code que celle du .NET Framework) :

```bash
cd analysis/vb-runtime-check && dotnet run
# 9 Int32 435848050 / 10 Int64 3922632451 / 20 Decimal … / 31 Double 4.29E+29 … / 400 Double Infinity
# petik: type=Double cur='Infinity' inv='Infinity' fr='∞'
# a:     type=Double cur='Infinity' inv='Infinity' fr='∞'
```

- OK : nom `petik` (ou `a`) + serial `Infinity` → « Nice Job! Now post your Keygen! »
- KO : un serial numérique quelconque (par ex. celui qu'on obtiendrait avec un `Integer` à débordement modulo 2³²) → « That's very easy! Retry... »
- KO : nom vide → « You're kidding me. »

Le keygen Python reproduit les mêmes seuils d'élargissement (i = 10, 20, 31) et la bascule en `+Infinity` à i = 326.

## Notes

- Ce n'est **pas** un débordement entier : sous `Option Strict On` avec des `Integer`, le code aurait levé une `OverflowException` (VB vérifie les débordements par défaut).
- Le texte d'infini dépend de la culture et de la version du runtime : .NET Core 3.0+ affiche `∞` dans toutes les cultures, alors que le .NET Framework utilise un mot dépendant de la culture (`Infinity` en anglais).
- Le nom n'influence que les valeurs intermédiaires, jamais le résultat final.
