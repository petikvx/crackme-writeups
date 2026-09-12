# Froggate II: Croackpocallypse — notes reverse

## Usage

```bash
./croackpocalypse <256-hex-chars>   # 128 octets
# exit 0 = OK, 1 = KO
```

ELF PIE x86-64, **pas de section headers**, ~4.6 MiB, strings utiles absentes.

## main (RVA `0xe5dcd`, runtime ASLR-off `0x555555639dcd`)

1. `argc == 2` sinon fail  
2. `hex_decode(argv[1] → buf[128])` @ `0x9723ba` — longueur exacte 256 hex  
3. `h1 = hash(buf)` @ `0x7f6868`  
4. `tmp = transform(buf)` @ `0x7029ce`  
5. `h2 = hash(tmp)` ; `h = h1 | ROL(h2, 0x17)`  
6. `ok = verify(tmp, h)` @ `0x6748b1`  
7. `return ok ^ 1`  (donc verify doit renvoyer 1)

## Hash = red herring

Le combiner XOR/ROL des feuilles : chaque paire appelle **deux fois la même fonction** → XOR = 0 → `h` toujours **0**.  
Confirmé sur plusieurs serials (`L1==L2` toujours).

## verify — prédicat réel

```text
tmp2 = tmp XOR mask[16×u64]     # mask live @ VA 0x4690 (dans .text, patché/≠ file brut)
rcx  = h | OR(all 16 qwords of tmp2)
sete al  iff rcx == 0
```

Donc **succès ⇔ `transform(serial) == mask_live`**.

Preuve GDB : après `transform`, `restore analysis/verify_mask_live.bin` sur la sortie → `sete` OK → `main` retourne **0**.

Masque live : `analysis/verify_mask_live.bin` (ne pas utiliser le dump fichier brut `0x4690` — différent au runtime).

## transform (RVA `0x1ae9ce`)

- Alias stack : `lea rbx, [rsp_t+0x40]` ≡ buffer d’entrée in-place (copie serial @ `main.rsp`)  
- Stage 1 : XOR/ADD/ROL sur les 16 qwords  
- Puis **~407 `call` uniques** (mixers MBA / splitmix-like) sur le buffer  
- Résultat recopié vers `rdi` (zone `main.rsp+0x80`)

`T(T(x)) ≠ x` (pas une involution).

## Keygen (WIP)

`serial = inv_transform(mask_live)` puis hex-encode (256 hex).

`tools/froggate2-solve.py` :
- dump mask, `--stage1` / `--stage1-inv` (Python ≡ gdb), `--oracle` / `--check` (gdb forward)
- **pas encore** de serial : mixers post-stage1 non inversés

Prochaines étapes :

1. ~~Stage1 inversible~~ (fait, round-trip OK)  
2. Classifier / inverser la chaîne de mixers (`mov rdi,rbx ; call …`, diffusion totale)  
3. Brancher `stage1_inv ∘ mixers_inv(mask)` dans le solveur → `-q`

Auteur : victormeloasm — diff site **6.0 Insane**. Règles : pas de patch / hook / Unicorn pour la soluce.