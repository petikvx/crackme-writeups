# crackme_6 by fireworx

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c188)
- **Auteur** : FireWorx (réimport crackmes.de)
- **Plateforme** : Windows, Win32 GUI, Delphi 4 (Turbo Linker 2.25), non packé
- **Difficulté** : 1.0
- **Type** : keygen (nom → code)

## Solution

Pour le nom `petik`, le code est **`c941-0283-63fb-3b70`**.

```
python3 tools/crackmes-de-crackme_6_fireworx-solve.py petik
petik -> c941-0283-63fb-3b70
```

## Comment on trouve

1. `diec` indique Delphi 4. `strings` donne `Right Code` / `Wrong Code` à l'offset fichier `0x40c78`, soit la VA `0x441878` (section CODE : VA `0x1000` ↔ fichier `0x400`).
2. Juste avant ces chaînes se trouve le handler `Button1Click` (`0x4417b8`, le nom est dans la table des méthodes publiées) :
   - `GetText` de `Edit2` (`[ebx+0x2c8]`, le code saisi) ;
   - `GetText` de `Edit1` (`[ebx+0x2c4]`, le nom), passé à `0x4416f8` qui fabrique le bon code ;
   - `CompareStr` (`0x403b44`) → `MessageBox` « U made it / Right Code » ou « Error / Wrong Code ».
3. La fonction `0x4416f8` :

```asm
mov ebx, 0x49390305
mov esi, 0x48631220
boucle sur chaque caractère c du nom :
  xor ebx, c
  xor esi, ebx
  test bl, 1
  sar ebx, 1 ; jns +3 ; adc ebx, 0   ; division signée par 2
  si bit0 était à 1 : xor ebx, 0x1200311
```

   puis `Format('%.4x-%.4x-%.4x-%.4x', [ebx & 0xffff, ebx >> 16, esi & 0xffff, esi >> 16])` (chaîne de format à `0x4417a4`).
4. La comparaison est sensible à la casse : le code doit être saisi en hexadécimal minuscule.

## Vérification

Le GUI n'a pas été piloté. Le solveur (`--verify Crackme6.exe`) charge la section CODE du vrai binaire dans Unicorn et exécute la boucle d'origine `0x441703..0x441746` ; les registres obtenus donnent le même code que le keygen Python pour `petik`, `a` et `crackmes.one`.
