# prolokmn2's Figger (`lock.exe`, « FSX lock »)

| | |
|---|---|
| **ID** | [`6a94900f3b246e477b6c0a7f`](https://crackmes.one/crackme/6a94900f3b246e477b6c0a7f) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | prolokmn2 |
| **Plateforme** | Windows PE64 console (MinGW, code obfusqué : prédicats opaques + pile) |
| **SHA-256** | `7825980e2316bc4d1df1c9277b2f8a2fab2595f78329967383bc85abf78bac51` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/lock.exe` | binaire d'origine (non modifié) |
| `tools/lock-solve.py` | keygen (`-q`, `--t N`, `--check`) |

## Réponse

Pas de nom d'utilisateur (donc pas d'exemple `petik`) : la clé ne dépend que de l'heure, fenêtre de 30 s. Le binaire accepte la fenêtre courante **et la précédente**.

```bash
python3 -I tools/lock-solve.py            # clé pour la fenêtre courante
python3 -I tools/lock-solve.py -q         # clé seule
python3 -I tools/lock-solve.py --check    # Wine : clé valide -> granted, 12345 -> denied
```

Exemple : `t = 59852363` → clé `682480017`.

## Premier regard

- `file` : PE32+ x86-64 console. `strings` ne montre aucun message du jeu : ils sont XOR-és.
- Sortie : `== FSX lock ==`, `Enter Key :`, puis `Access granted.` / `Access denied.`

## Flow

`main` (`0x1400016c5`) :

1. `fig_deobf_strings` (`0x140001b54`) déchiffre en place ;
2. `printf` bannière + prompt, `fig_input` (`0x140001b1c`, `scanf(" %255s")`) ;
3. `t = time(NULL) / 30` (`fig_now` + `idiv 0x1e`) ;
4. `expected = "" + decimal(keygen(t))` (`fig_fn_keygen` `0x140001450`, `fig_i2s` `0x1400019f8` = `snprintf("%lld")`, `fig_concat` `0x140001a34`) ; `strcmp(input, expected)` ;
5. sinon recommence avec `t-1` ; l'une des deux égalités suffit → `Access granted.`

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/lock.exe`. Le code est un compilateur « stack machine » (tout passe par `push`/`pop`) parsemé de blocs de bruit : `mov rax,rsp; imul r10,r10; add r10,rax; and r10,1; je …` (prédicat opaque : `x*x+x` est toujours pair, donc le saut est toujours pris) suivi de `call` vers des adresses absurdes et d'octets qui désassemblent en garbage. Ils sont du bruit, on les ignore.

**Chaînes** : table de descripteurs `(ptr, len)` de 16 octets à `0x140003069` (data, offset fichier `0x2669`) ; chaque octet `i` est XOR-é avec `(i*0x1f + 0x5a) & 0xff`. Les deux premières chaînes `0x140003048/49` (préfixe attendu) sont **vides** : la clé est donc juste le nombre en décimal.

**Keygen** (`0x140001450`, argument `t` à `[rbp+0x10]`), en décodant les `push/pop` :

```text
h = 0x57984997
pour i = 0..7 :
    v = (t // (i+1)) % 0xfb          ; idiv par (i+1), puis idiv par 0xfb (rdx)
    h = (h*0x83 + v + i*7) % 0x7fffffff
retourne h
```

Asm clé : `movabs rax,0x83 … imul rax,rcx` (×0x83), `add` de `[rbp-0x20]` (v), `imul 7` sur le compteur `[rbp-0x18]`, `movabs 0x7fffffff … idiv … mov rax,rdx`. La boucle sort quand `i < 8` est faux (`cmp rax,rcx; setl`, `rcx = 8`).

**Piège** : le `main` teste `strcmp(...)==0` pour `t` puis pour `t-1` ; la logique `sete`/`jne` finale accepte si l'un des deux vaut.

## Vérification

```text
$ python3 -I tools/lock-solve.py --check
t = 59852363
Key = 682480017  (aussi valide : t-1 -> 826498365)
[OK] '682480017' -> Access granted.
[OK] '12345' -> Access denied.
```

Exécuté contre `original/lock.exe` réel sous `xvfb-run -a wine`. Analyse 100 % statique (objdump) + Wine ; pas de GDB.

## Notes

- Aucun nom, aucune graine fixe : la clé change toutes les 30 s (d'où la tolérance `t-1`).
- Ce n'est pas la même énigme que « Figger V2 » du même auteur (deux clés, anti-debug).
