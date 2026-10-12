# rdg_simple_crackme_.net by rdgmax (crackmes.de)

- **Page** : <https://crackmes.one/crackme/5ab77f5433c5d40ad448c1d0>
- **Plateforme** : Windows PE32 GUI, **VB.NET** (CLR 4.0, Visual Studio) — difficulté 2.0
- **Archive** : `original/RDG_Simple_Crackme_.NET.zip` (mot de passe `crackmes.one`) → `Simple Crackme.exe` + `Info.txt`
- **Statut** : résolu (keygen), vérifié en **régénérant le couple nom/serial de démonstration embarqué par l'auteur** (`RDGMax` → `456D455A6866384A304E343D`) et en déchiffrant les deux messages du binaire — pas de session GUI live sous wine

## Solution

`Info.txt` : « Get the correct serial for your username ».

```
serial = Sth( Base64( DES-CBC-PKCS7( UTF8(nom), clé, IV ) ) )
clé    = SHA1( "5167449" en ASCII, complété à 8 octets nuls )[0..7]   = d4ed34931c48ac08
IV     = 12 44 16 EE 88 15 DD 41
Sth    = code hexadécimal majuscule (2 chiffres) de chaque caractère du Base64
```

```
python3 tools/rdg-simple-crackme-net-solve.py petik     ->  38396666356E424C31576F3D
python3 tools/rdg-simple-crackme-net-solve.py --check   ->  RDGMax -> 456D455A6866384A304E343D OK, Congratulations! / Bad Boy!
```

## Comment on trouve

1. `diec` : VB.NET, CLR 4.0, pas d'obfuscateur commercial détecté. Décompilation : `ilspycmd -p -o <dir> "Simple Crackme.exe"`.
2. Le code est **noyé sous du bourrage** : des milliers de lignes `num = 123456L;` sans effet, des tests `if (GB6 == GB2) GB60 = GB61;` répétés (GB6 n'est jamais affecté), un `Module1.V()` plein de `goto` et ~500 `MsgBox` jamais atteints. On filtre les lignes `num = <const>L;` pour lire le reste (extraits utiles : `analysis/decompiled-excerpts.cs.txt`).
3. `Button_Click` (bouton Check) : serial ≥ 6 caractères, puis à l'itération 64103 d'une boucle de 2 000 000 appelle `En()` puis `Module1.V()`.
4. `En()` : `clsx.K = (xa()+xb()-xb()+xa()+xa()-xb()-100+52+xb()-xa()+xb()+xb()-xa()+xa()-xa()-xa()+xb()).ToString()` puis `Module1.GB = Sth(clsx.Se(t1.Text))`. Les `xa()` s'annulent (coefficient 0), `xb()` apparaît avec un coefficient 3 : `K = 3·xb() − 48`. `xb()` ne renvoie que sa **dernière** affectation : `Math.Round(67.567… + 50·421·85 + 632 + 124 − 8552 + 1213 − 61451 + 1215) = 1722499` → `K = "5167449"`.
5. `clsx` : le setter `K` copie la chaîne ASCII dans un tableau de 8 octets, prend `SHA1(...)[0..7]` comme clé DES ; le constructeur fixe l'IV `{18,68,22,238,136,21,221,65}` ; `Se()` = DES-CBC (PKCS7) puis `Convert.ToBase64String`.
6. `Module1.V()` copie `t2.Text` dans `GB2` et dans `Label3.Text` ; **le vrai test** est dans `Label3_TextChanged` : si `Len(Label3) > 6` et `GB == GB2` → `MsgBox(GB70)` sinon `MsgBox(GB94)`. Ces deux messages sont chiffrés avec `K = "100"` : `Congratulations!` / `Bad Boy!`.
7. `Form2` (ouverte par le bouton « Serial ») préremplit `RDGMax` / `456D455A6866384A304E343D` : c'est le couple de démo de l'auteur.

## Vérification

- Le keygen régénère exactement `456D455A6866384A304E343D` pour `RDGMax` (couple stocké dans `Form2`), ce qui valide la clé dérivée de `xb()`, le SHA1, l'IV et l'encodage `Sth`. Contrôle croisé avec `openssl enc -des-cbc` (provider legacy).
- `--check` déchiffre aussi `GB70`/`GB94` avec la clé `"100"` → `Congratulations!` / `Bad Boy!`.
- Pas de vérification GUI live : la fenêtre WinForms n'est pas pilotée sous wine/xvfb, et le chargement de l'assembly par réflexion sous .NET 8 échoue (`FileLoadException`). La preuve repose sur la reproduction du couple de référence embarqué.
