# Jasper676767's Functions!

| | |
|---|---|
| **ID** | [`6ad6c85c4ab951a9999d9f55`](https://crackmes.one/crackme/6ad6c85c4ab951a9999d9f55) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Jasper676767 |
| **Plateforme** | Linux x86-64 (ELF PIE, C++, packé UPX 4.24) |
| **SHA-256 (zip)** | `e089734d62dd9fb3f267fda6771f2a4efe23299f470c2c6b9d4820941b182abc` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Chall.zip` | archive d'origine (non modifiée) : `a.out` (UPX) + `output` (22 octets) |
| `analysis/extracted/Crackmes.one_Challenge/` | contenu extrait du zip (`a.out`, `output`) |
| `analysis/a.out.unpacked` | `a.out` dépacké (`upx -d`) |
| `tools/functions-solve.py` | solveur (de-XOR de `output`) |
| `tools/gdb-verify.gdb` | script gdb qui rejoue le scramble du binaire |

## Réponse

**Flag : `CMO{I_l0v3_fUnCt1OnS}`**

```bash
python3 -I tools/functions-solve.py        # Flag : CMO{I_l0v3_fUnCt1OnS}
python3 -I tools/functions-solve.py --check
```

Le challenge n'a pas de saisie utilisateur : il faut retrouver le flag à partir du fichier `output`
(« how do we reverse all the operations that led to the flag being so scrambled »).

## Premier regard

```bash
unzip original/Chall.zip -d analysis/extracted
file analysis/extracted/*/a.out      # ELF PIE, "no section header"
diec analysis/extracted/*/a.out      # Packer: UPX(4.24)
xxd analysis/extracted/*/output
```

`tools/upx-3.96` refuse (`need a newer version of UPX`) : le binaire est en UPX 4.24, on dépacke avec un `upx` récent
(`upx -d -o analysis/a.out.unpacked …`). Le binaire se lance directement et affiche :

```text
Can you find out whats the flag? How do we reverse all the operations ... in our output file.
hello
Hint: Figure out factorsNvm cannot calculate sum
```

`output` (hex) : `0f0103370513207c3a7f132a19220f387d03221f310a`.

## Flow

Le `main` (VMA `0x2508`, après dépack) construit `"hello\n"`, l'affiche, puis appelle `scramble(str)` (`0x22e9`) :

```text
x = 5; pour i in 0..0x43 : x = x*12 + 7        ; 0x2330-0x234b  (lea/add + shl 2)
affiche "Nvm cannot calculate sum"
out = ""; pour c in str : out += c ^ (uint8)x   ; 0x237c-0x23af
si out != g2 ("_S[ZX\n") : return -1             ; 0x23d8-0x2418, silencieux
sinon affiche XOR-fold de g1 ("CMO{REDACTED}") ^ x
```

Les deux globales `g1`/`g2` sont initialisées depuis `.rodata` (`0x5421` = `CMO{REDACTED}`, `0x542f` = `_S[ZX\n`).
Avec l'entrée codée en dur `hello\n`, le test échoue toujours : ce binaire est un **leurre**, la vraie matière est `output`.

## Comment on trouve

1. **Ancrage** : `objdump -d -M intel analysis/a.out.unpacked --start-address=0x22e9` → fonction de scramble : une boucle
   `x = 12x + 7` puis `out[i] = in[i] ^ x`. Le mot « sum » / « factors » des messages est de la poudre aux yeux.
2. **Piège** : calculer la clé de cette boucle (`x` après 68 tours, int32 wrap) donne `0xe8ba2e8b` → octet `0x8b`.
   Mais `output ^ 0x8b` ne donne que des octets ≥ 0x80 (illisible). De plus `12x+7` est toujours **impair**, alors que la bonne
   clé est paire : la boucle n'est pas la clé de `output`.
3. **Known-plaintext** : le format est visiblement `CMO{...}` (cf. `CMO{REDACTED}` dans le binaire).
   `0x43^0x0f = 0x4c`, `0x4d^0x01 = 0x4c`, `0x4f^0x03 = 0x4c`, `0x7b^0x37 = 0x4c` : les 4 premiers octets donnent la **même clé `0x4c`** →
   XOR mono-octet.
4. **Décodage** : `output ^ 0x4c` = `CMO{I_l0v3_fUnCt1OnS}` + dernier octet `0x0a`.
   L'octet final `0x0a` n'est pas XORé (`'\n' ^ 0x4c` serait `0x46`) : c'est le retour à la ligne de l'écriture du fichier.

## Debug GDB (pas à pas)

Pour prouver que la routine du binaire produit bien `output` avec la clé `0x4c` (script : `tools/gdb-verify.gdb`) :

```bash
cd analysis && gdb -q -batch -x ../tools/gdb-verify.gdb ./a.out.unpacked
```

- `break __libc_start_main` + `run` : PIE sans ASLR sous gdb → base `0x555555554000` (`info proc mappings`).
- `break *0x555555556373` (= `0x2373`, juste avant la boucle XOR) : on remplace la std::string d'entrée (`[rbp-0x58]`)
  par un buffer `malloc` contenant `CMO{I_l0v3_fUnCt1OnS}\n` (taille 22) et on force la clé `[rbp-0x48] = 0x4c`.
- `break *0x5555555563cf` (= `0x23cf`, fin de la boucle XOR) : `x/22xb *(long*)($rbp-0x30)` donne
  `0f 01 03 37 05 13 20 7c 3a 7f 13 2a 19 22 0f 38 7d 03 22 1f 31 46`.
  Identique à `output` sur les 21 premiers octets ; le 22ᵉ vaut `0x46` (= `'\n'^0x4c`) contre `0x0a` dans le fichier, ce qui confirme que
  le `\n` final de `output` n'a pas été scrambled.
- Pièges : binaire packé (dépacker d'abord), pas de symboles (adresses seulement), l'entrée est un `std::string` (SSO < 16 octets : il faut
  repointer le buffer pour 22 octets).

## Vérification

```text
$ python3 -I tools/functions-solve.py --check
OK CMO{I_l0v3_fUnCt1OnS}
```

- OK : re-XOR du flag avec `0x4c` + `\n` == `output` octet pour octet (assert dans `--check`) ; routine native rejouée sous gdb (ci-dessus).
- KO / edge : la clé calculée par le binaire (`0x8b`) ne redonne **pas** `output` ; le binaire lui-même ne lit aucune entrée et le test
  `out != "_S[ZX\n"` échoue toujours, donc il n'affiche jamais le flag.

## Notes

- Aucun champ user/login : exemple `petik` non applicable.
- Le flag n'est pas vérifiable par le binaire (pas de saisie) ; la preuve est la reproduction exacte de `output` par la routine XOR native.
- `original/` jamais modifié ; extraction et dépack sous `analysis/`.
