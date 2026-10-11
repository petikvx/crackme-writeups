# crackme0x1 — pickled (crackmes.de)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c16d)
- **Plateforme** : Windows, PE32 console (MSVC 2005), x86
- **Difficulté** : 1.5
- **But** (crackme0x1.txt) : trouver la clé d'activation, sans patch.

## Solution

Clé d'activation : **`pickled`** (fixe, pas de nom donc pas de keygen ; l'utilisateur `petik` n'intervient pas).

```bash
python3 tools/crackme0x1-solve.py   # -> pickled
```

## Comment on trouve

1. `strings` : `Enter activation key:` et `Congratulations you have found the correct key!` ; les autres messages (`Hmm it's a start...`, `getting warmer`...) indiquent combien de caractères sont déjà bons.
2. `main` (`0x401000`) boucle sur la fonction `0x401050` tant qu'elle renvoie 0.
3. `0x401050` lit la saisie (`cin >>`) dans `0x403728`, puis pour chaque index `i` de la chaîne secrète en `0x403024` :
   ```text
   si (secret[i] ^ i) != saisie[i]  -> message d'indice selon i, retour 0
   si strlen(saisie) > strlen(secret) -> échec
   ```
   (une boucle de 0x395 tours calcule un octet `bl` qui ne sert qu'au leurre, sans effet sur le résultat). Après le dernier caractère : « Congratulations ».
4. La chaîne secrète dans `.data` vaut `` phahh`b `` ; on XOR chaque octet avec son index : `` p^0 h^1 a^2 h^3 h^4 `^5 b^6 `` = `pickled` (le pseudo de l'auteur).

Désassemblage commenté : `analysis/check_401050.asm`.

## Vérification

Live sous Wine (xvfb-run) : `echo pickled | wine crackme0x1.exe` affiche `Congratulations you have found the correct key!`.
