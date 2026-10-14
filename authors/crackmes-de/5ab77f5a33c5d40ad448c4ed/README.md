# Crackme Jenny — sraboy (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4ed · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF64 x86-64, GCC ; trois variantes dans l'archive : `developer` (non strippé + traces), `debug` (non strippé), `release` (strippé)
- Archive : `original/crackme.tgz` → `developer`, `debug`, `release`, `readme.txt` (extraits sous `analysis/`)
- Scénario (readme) : retrouver le *username/password* qui a produit la clé d'activation `13284645-2427364-104376652`

## Réponse

```
./release 'jenny@8675309'
# Your key: 13284645-2427364-104376652
```

- **username** : `jenny`
- **password** : `8675309` (le numéro de téléphone de la chanson « Jenny » — `867-5309`)
- argv[1] = `username` + `@` + `password`, soit `jenny@8675309` (13 caractères).

```bash
python3 -I tools/jenny-solve.py --check
# check: OK (modèle=True, binaires={'developer': True, 'debug': True, 'release': True})
```

## Premier regard

```text
$ ./analysis/developer petik secret          # (argv[1] quelconque)
********************************
Page Size: 4096   Add Func: 00400d76   add%4096: 3446   Ptr: 4194304
phonexor: 646     jennyxor: 541              <- sorties de debug (non strippé)
```

Aucune clé n'est affichée : les tests internes échouent en silence. Les noms `phonexor` / `jennyxor` dans la sortie de debug donnent l'indice (« Jenny », 867-5309).

## Flow

`main` @`0x4007b6` (variante `developer`) ; **un seul argument** `argv[1]` :

1. `mark_exe` (`0x400c79`) : `mprotect` de la page de `add` (`0x400d76`) en **RWX** (code auto-modifiable, « Page Size: 4096 »).
2. `phone = atoi(argv[1] + 6)` (7 octets copiés) ; `jenny = Σ_{i=0..4} (s[i] ^ phone)` ; `phonexor = Σ_{i=5..12} (s[i] ^ phone)`.
3. `argc <<= argc` (2 → 8). Test 1 : `jenny == 0x295dda9` (43376041).
4. Test 2 : `s[argc/(argc>>2) + 1] == argc*4*2` ⇒ `s[5] == 64 == '@'`.
5. `opcode = s[5] - atoi(s[10:]) + (s[8] - '0')` ; cet octet est écrit par `memcpy` sur le premier octet de l'instruction de `add` (`add ecx,edx` = `01 d1`) → il doit valoir **`0x29`** (`sub ecx,edx`) pour que la suite soit cohérente.
6. Deuxième patch : `argc' = (argc>>2) << 4 + 0xb = 43` ; `(43·0x168e + 0xecd3)·43 = 0xcaaf0f` écrit sur 3 octets en `0x400d87` : `0f af ca` = `imul ecx,edx` ⇒ `add` devient une **multiplication**.
7. Sorties : `Sum: 41 + 38 = 79` (add), `Diff: 41 - 38 = 3` (sub), `Product: 41 * 38 = 1558` (mul), puis la clé :

```
Your key: 13284645-2427364-104376652
          (valeurs : 13284645 = 0xcaaf0f + 1558 ; 2427364 ; 104376652)
```

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/developer` (non strippé : `main`, `add`, `mark_exe`).

Les trois variantes donnent la même clé : `developer` montre les valeurs intermédiaires, `release` (strippé) se contente de les calculer.

Contraintes à satisfaire, lues dans `main` :

```asm
40085b..400885 : for i in 0..4   : jenny   += (s[i] ^ phone)
400890..4008ba : for i in 5..12  : phonexor += (s[i] ^ phone)
4008f2: cmp [rbp-0x34], 0x295dda9        ; jennyxor == 43376041
400943: cmp eax, edx                       ; s[5] == argc<<3 == 64 ('@')
400a1b: sub [rbp-0x5c], atoi(s+10)         ; opcode = s[5] - atoi(s+10)
400a5b: add(s[8], -0x30)                   ; + (s[8]-'0')
400ada: memcpy(0x400d88, &opcode, 1)       ; patch d'`add` : octet 0x29 attendu
400bc6: memcpy(0x400d87, &imul_bytes, 3)   ; patch d'`add` : 0f af ca (imul)
```

- `phone` : **7 chiffres** (7 octets recopiés) ; avec `phone = 8675309` : `5 × 8675309 = 43376545`, et la somme avec xor des 5 octets de `jenny` donne exactement `43376041` ✓ (les octets `j,e,n,n,y` = 106, 101, 110, 110, 121 se xorent bas dans les 8 bits de poids faible de `phone` = `0x76 0x2d` …).
- `s[8] = '7'` (7), `atoi("30") = 30` (`s[10:12]`, le buffer de 2 octets n'est pas terminé mais suivi d'un non-chiffre) : `64 − 30 + 7 = 41 = 0x29` ✓.

**Pièges :**
- La clé finale ne dépend que du fait que le *patch d'`add`* soit celui attendu : d'où l'unique opcode `0x29` ; plusieurs couples user/phone peuvent satisfaire les contraintes, mais `jenny` + `8675309` est celui du scénario et passe les trois variantes.
- Le premier `argv[1]` est un seul argument (pas deux : `./release jenny 8675309` échoue).
- `memcpy` sur le code : l'exécution sous GDB reste possible (la page est RWX), mais l'addition `add` est modifiée **en place** — inspecter `0x400d76` avant/après.

## Vérification

```text
$ ./analysis/release 'jenny@8675309'
Your key: 13284645-2427364-104376652
$ ./analysis/release 'jenny@8675308'      (analysis/verify.txt)
(rien)
```

## Fichiers

- `analysis/developer`, `analysis/debug`, `analysis/release`, `analysis/readme.txt`, `analysis/dev.txt` (objdump), `analysis/verify.txt`
- `tools/jenny-solve.py` : construit/valide `jenny@8675309` sur les 3 variantes
