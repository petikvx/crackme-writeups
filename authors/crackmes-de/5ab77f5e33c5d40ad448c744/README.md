# keygen_1 (tvk_crackme_2) — tvk6843 (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5e33c5d40ad448c744 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, C++ (libstdc++), **strippé**, GCC (2008-2010)
- Archive : `original/tvk_crackme_2.zip` → `tvk_crackme_2`
- Usage : `./tvk_crackme_2 <name> <serial>` (affiche `OK` si valide, rien sinon)

## Réponse

Le serial est un **keygen dépendant de l'heure** (heure et minute locales) : 32 caractères = 4 mots de 32 bits écrits avec l'alphabet `qwE1tym5BvCX70fG`.

```bash
python3 -I tools/tvk-keygen-solve.py petik            # serial valable pour l'heure/minute courantes
./analysis/tvk_crackme_2 petik <serial>                 # OK   (dans la même minute)
python3 -I tools/tvk-keygen-solve.py petik --check      # génère + exécute immédiatement
# check: OK (21:19 → 'OK' ; serial altéré → rien=True)
```

Exemple pour `petik` à **12:00** : `qC1wBym7qqqq1vwqqqqqwB0fGGGG70BG`

## Premier regard

```text
$ ./analysis/tvk_crackme_2
Segmentation fault                          (argv[1] manquant)
$ strings -n 6 analysis/tvk_crackme_2 | grep -E "qwE1|OK"
qwE1tym5BvCX70fG     OK
```

Imports : `time`, `localtime`, `strlen`, `puts`, `exit` : `localtime` signale la dépendance à l'horloge.

## Comment on trouve

**Ancrage** : `main` @`0x80488fe` (argument de `__libc_start_main`) ; 5 fonctions utilitaires. Avec `m = tm_min` (`[tm+4]`) et `h = tm_hour` (`[tm+8]`) de `localtime(time())` :

| Fonction | Adresse | Valeur |
|---|---|---|
| f2 | `0x804866c` | `V0 = (Σ(n[i] + 2i) + m + h) ^ 0x0a318751` |
| f3 | `0x80486e7` | `V1 = (Σ n[i] + 17·m + 31·h) << 4` (`shl 4 ; lea ecx,[eax+edx]` = ×17 ; `shl 5 ; sub` = ×31) |
| f4 | `0x8048768` | `V2 = 125·h + m + Σ(n[i] << (i&7)) + (h<<7) + m` |
| f1 | `0x80487fa` | `V3 = ~((m + h) · Σ n[i]·i)` |
| décodeur | `0x8048875` | 8 caractères `c_k` → `Σ idx(c_k) << ((7−k)·4)` avec `T[idx]=c_k` ; `T=\"qwE1tym5BvCX70fG\"` @`0x8048ab3` |

`main` : `decode(serial[0:8])`… `decode(serial[24:32])` rangés dans `[esp+0x10 … +0x1c]`, puis `V0 == [esp+0x10]`, `V1 == [+0x14]`, `V2 == [+0x18]`, `V3 == [+0x1c]` (le `exit(1)` sinon) ; succès → `puts("OK")`.

Chaque groupe de 8 caractères est un entier de 32 bits en « hexadécimal » à alphabet permuté ; l'octet de poids fort vient en premier (`shl ((7−k)*4)`).

**Pièges :**
- **Dépendance à l'heure** : serial valable uniquement pendant la minute pour laquelle il a été généré (`--at HH:MM` permet de préparer une autre heure). `localtime` utilise le fuseau local (`TZ`).
- `argv[1]` obligatoire (segfault sans argument).
- Les octets de `name` sont **signés** (`movsx`) dans toutes les sommes.
- Le test est séquentiel : une seule valeur fausse → `exit(1)` silencieux.

## Vérification

```text
$ python3 -I tools/tvk-keygen-solve.py petik --check        # analysis/verify.txt
check: OK (21:19 → 'OK' ; serial altéré → rien=True)
```

## Fichiers

- `analysis/tvk_crackme_2`, `analysis/dis.txt` (objdump), `analysis/verify.txt`
- `tools/tvk-keygen-solve.py` : keygen (heure courante ou `--at`) + `--check`
