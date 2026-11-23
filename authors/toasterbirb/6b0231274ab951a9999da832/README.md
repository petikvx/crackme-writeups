# toasterbirb's ieee_754

| | |
|---|---|
| **ID** | [`6b0231274ab951a9999da832`](https://crackmes.one/crackme/6b0231274ab951a9999da832) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | toasterbirb |
| **Plateforme** | Linux ELF64 PIE, strippé, C (GCC 12), dynamique (libm) |
| **SHA-256** | `f9b826ba71d5596a73311f5aa2d976b3f3bc2121b00a572d99973df6b8d568ed` |

## Contenu

| Chemin | Rôle |
|---|---|
| `original/bin` | binaire d'origine (non modifié) |
| `tools/ieee754-solve.py` | générateur des floats + `--check` |

## Réponse

Le programme lit des floats (`scanf("%f")`) jusqu'à `±inf`. Il faut saisir **8 floats négatifs** puis `-inf` :

```
-5.376338959e-05   # p
-1.640728442e-09   # a
-4.301071167e-04   # s
-4.301071167e-04   # s
-6.881713867e-03   # w
-2.688169479e-05   # o
-2.150535583e-04   # r
-1.312582754e-08   # d
-inf
```

```bash
python3 tools/ieee754-solve.py          # liste
python3 tools/ieee754-solve.py -q | ./bin
python3 tools/ieee754-solve.py --check /chemin/vers/copie_exécutable_de_bin
```

Pas de login : l'utilisateur d'exemple `petik` n'est pas applicable (`--word` permet de changer le mot encodé, 8 caractères attendus pour `password`).

## Premier regard

- `file` : ELF64 PIE strippé ; imports `scanf`, `log2`, `floor`, `pow`, `strncmp`, `memset`.
- `strings` : messages « I require numbers! », « I don't like your positive attitude... », « A bit more magnitude, please! », « Wow! Subnormal?! … », « The mantissa is giving bad vibes... », et la chaîne `password` (rodata `0x2008`).
- Le fichier livré n'a pas le bit exécutable : le tester sur une copie (`cp original/bin /tmp/bin && chmod +x`).

## Flow

1. Jusqu'à 64 `scanf("%f")` ; échec → « I require numbers! ».
2. Arrêt dès qu'un float vaut `-inf` ou `+inf` (comparaisons `ucomiss` avec `0xff800000` / `0x7f800000`, `.rodata` 0x2194 / 0x2198). Il faut ≥ 2 valeurs, sinon rien n'est validé.
3. Pour chaque float *avant* le terminateur : une série de contrôles (bit de signe, zéro, NaN/inf, subnormal, mantisse), puis `out[i] = exposant + 127`.
4. `strncmp("password", out, 8)` → « Correct! ».

## Comment on trouve

Ancrage : `objdump -d -M intel original/bin`, fonction `main` stripée à `0x11a9`, boucle de validation `0x1399`–`0x15f8`, comparaison finale en `0x1612`.

- `0x13af` : `mov eax,[x]; test eax,eax; js` → si le bit de signe est à 0 : « positive attitude ». Il faut donc **négatif**. Le code fait ensuite `xor edx,0x80000000` : le float devient positif.
- `0x1414` : si le résultat est 0 → « magnitude » (cas `-0.0`).
- `0x1447` : `shr eax,0x17 ; cmp eax,0xff` → exposant biaisé 255 (inf/NaN) refusé : « not a number ».
- `0x148b` : `e = (int)floor(log2((double)x))` ; `e < -126` (`cmp …,0xffffff82`) → « Subnormal ».
- `0x1524` : `out[i] = (uint8)(e + 127)` — c'est donc l'**exposant biaisé** IEEE-754, et il doit être le code ASCII du caractère : `e = c − 127`.
- `0x1516`–`0x15cf` : `m = x / 2^e − 1.0`, puis pour k = 1..8 : si `m ≥ 2^-k` alors `m -= 2^-k` et `bit (k−1) |= 1`. Le résultat doit valoir `0xC3` = `11000011b`. Les 8 premiers bits de mantisse sont donc `0xC3` (m = 195/256 = 1.76171875 − 1… soit x = 1.76171875·2^e).
- `0x1612` : `strncmp(rodata "password", out, 8)`.

Assemblage : pour `c`, `bits = 1<<31 | c<<23 | 0xC3<<15` (mantisse sur 23 bits : `0xC3` dans les 8 bits hauts). Exemple `p` = 112 → exposant non biaisé −15 → `−1.76171875·2^-15 = −5.376338959e-05`.

Pièges : le mot de passe n'est pas lu en texte, il est encodé dans les exposants ; le terminateur `-inf` n'est pas traité par la boucle (bornée à `n−1`) ; les bits de mantisse sous les 8 premiers sont ignorés (valeurs précises mais libres).

## Vérification

Réalisée sur une copie exécutable du binaire d'origine (SHA-256 identique) :

```
$ python3 tools/ieee754-solve.py --check /tmp/t/bin
Correct! ヾ（〃＾∇＾）ﾉ        # rc=0
$ echo 1 | ./bin                         → I don't like your positive attitude...
$ printf -- '-1e-3\n-inf\n' | ./bin      → The mantissa is giving bad vibes...
$ echo | ./bin                           → I require numbers!
```

Pas de session GDB (reverse statique avec `objdump`), donc pas de section Debug GDB.

## Notes

- Ce n'est pas un hash : la contrainte est purement bit-à-bit sur le format float32.
- `strncmp` ne compare que 8 octets : des floats supplémentaires après `password` passeraient aussi.
