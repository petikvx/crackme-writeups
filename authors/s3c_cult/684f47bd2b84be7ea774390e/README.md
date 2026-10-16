# S3c_Cult — XORcist

| | |
|---|---|
| **ID** | [`684f47bd2b84be7ea774390e`](https://crackmes.one/crackme/684f47bd2b84be7ea774390e) |
| **Auteur** | S3c_Cult |
| **Plateforme** | Linux ELF64 PIE (strippé, `gcc -s`), **sources C fournies** dans le zip |
| **SHA-256 (zip)** | `d8b83c6d362616a33d376bf343148044eb5bb8b5dfeefadce1361242c764e8e1` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/XORcist.zip` | archive d'origine (`xorcist`, `xorcist.c`, `compile.sh`) |
| `analysis/xorcist/` | contenu extrait du zip |
| `tools/xorcist-solve.py` | calcule le mot de passe depuis les sources du zip (`-q`, `--check`) |

## Réponse

**Mot de passe : `ts_pmo_gng_icl`**

```bash
python3 tools/xorcist-solve.py --check
echo ts_pmo_gng_icl | ./analysis/xorcist/xorcist     # Logged in as root.
```

## Premier regard

L'archive contient le binaire, **son code source** (`xorcist.c`) et le script de compilation (`gcc -s -o xorcist xorcist.c`, d'où le binaire strippé).
Le source se lit comme un crackme : un `#define KEY 0xA9`, un anti-debug `TracerPid` et beaucoup de bruit (`useless_branch`, `rand()`, `Agent`).

## Flow

`main` : `isDebuggerPresent()` (lit `/proc/self/status`, champ `TracerPid`) → « Nooooooo. La Policiaaa. » si traçé ;
sinon `fgets`, puis `ag.check_fn(input)` = `validate` → « Logged in as root. » ou « Nuh Uh Nuh Uh. ».
Tout le reste (`useless_branch`, `c`, `rand_val`, `Agent.id`) est du leurre : le résultat n'en dépend pas.

## Comment on trouve

**Ancrage** : `xorcist.c`, fonction `validate` :

```c
const char *enc = "\xdd\xda\xf6\xd9\xc4\xc6\xf6\xce\xc7\xce\xf6\xc0\xca\xc5";
strcpy(temp, enc);
decrypt(temp);                 // for (i...) str[i] ^= 0xA9
return strcmp(input, temp) == 0;
```

Décodage octet par octet (`^ 0xa9`) :

| enc | dd | da | f6 | d9 | c4 | c6 | f6 | ce | c7 | ce | f6 | c0 | ca | c5 |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| clair | `t` | `s` | `_` | `p` | `m` | `o` | `_` | `g` | `n` | `g` | `_` | `i` | `c` | `l` |

→ **`ts_pmo_gng_icl`** (14 caractères).

Le binaire livré correspond bien à ces sources (même messages, même comportement) : le mot de passe est validé sur le binaire d'origine.
Piège : l'octet `0xf6` (= `_`) apparaît trois fois ; `strcpy` s'arrête au premier NUL, et aucun octet de `enc` ne vaut `0xa9`, donc le décodage est complet sur 14 octets.

## Debug GDB (pas à pas)

Seule observation GDB faite : l'**anti-debug se déclenche** dès qu'on lance sous GDB.

```bash
gdb -q -batch -ex 'run < /dev/null' ./analysis/xorcist/xorcist
# Nooooooo. La Policiaaa.   -> TracerPid != 0
```

Pour déboguer il faudrait contourner la lecture de `/proc/self/status` (hors besoin ici : le prédicat est lisible dans les sources).

## Vérification

```text
$ python3 tools/xorcist-solve.py --check
password = ts_pmo_gng_icl
OK: Logged in as root. | KO: Nuh Uh Nuh Uh.
```

## Notes

- Les sources étant fournies, c'est un crackme de lecture ; le piège est surtout le bruit autour de `validate`.
