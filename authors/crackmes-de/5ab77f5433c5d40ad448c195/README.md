# libertyordeaths_asm_keygenme1 — LibertyorDeath (réimport crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c195)
- **Plateforme** : Win32 GUI, MASM32 (boîte de dialogue), difficulté 2.0
- **Publication** : 2018-03-25
- **Règles** : pas de patch, keygen demandé. `source.zip` est chiffré (mot de passe envoyé par l'auteur), on s'en passe.

## Solution

```
esi = 0 ; edx = 10
pour i = 0 .. len(nom)-1 :
    esi += (signed char)nom[i] + 1 + edx
    edx *= (i + 1)            # edx = 10 · i!  à l'itération suivante
edi = edx * esi              # 32 bits
serial = wsprintf("LOD-%lu-%lX", esi, edi)
```

Exemple : `petik` → **`LOD-886-103920`**.

```
$ python3 tools/crackmes-de-libertyordeaths_asm_keygenme1-solve.py petik
LOD-886-103920
```

## Comment on trouve

1. `strings` ne montre presque rien d'utile et `objdump -d` donne du bruit : le code est **chiffré**. Le point d'entrée (`0x4011ae`) contient un petit déchiffreur :
   ```
   mov esi, 0x401006
   boucle: xor byte [esi], 0x25 ; inc esi ; cmp esi, 0x4011a7 ; jne boucle
   jmp 0x401006
   ```
   C'est la « petite modification » annoncée dans `Rules.txt`.
2. On déchiffre statiquement (XOR 0x25 sur les offsets fichier 0x406–0x5a6) et on désassemble la copie.
3. `WM_COMMAND` sur le bouton `0x3ec` : `GetDlgItemTextA(0x3ea)` → nom en `0x4030c0` (longueur en `0x403100`), `GetDlgItemTextA(0x3eb)` → serial en `0x4030e0`, puis appel de la routine `0x401114`.
4. Routine `0x401114` : refuse un nom ou un serial vide, fait la boucle ci-dessus, `wsprintfA(buf, "LOD-%lu-%lX", esi, edi)` (format dans `.data`) puis `lstrcmpA(buf, serial)` → « Valid Serial! / Yay! » ou « Invalid Serial! / Error! ».

## Vérification

L'interface (boîte de dialogue) n'a pas été pilotée sous wine. La vérification se fait par **émulation Unicorn du vrai code déchiffré** de la routine `0x401114` (`analysis/unicorn-verify.py`) : on place le nom et sa longueur aux adresses du binaire et on lit `esi`/`edi` juste avant l'appel à `wsprintfA`. Résultats identiques au keygen pour `petik` (`LOD-886-103920`) et `LibertyorDeath` (`LOD-3075263156-87914000`). Le formatage `%lu-%lX` et la comparaison `lstrcmpA` sont lus dans le désassemblage.
