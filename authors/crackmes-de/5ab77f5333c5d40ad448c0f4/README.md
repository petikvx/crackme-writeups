# qcrk5 — qnix (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0f4
- Plateforme : Linux ELF32 static (GCC 3.4.4 Gentoo) · difficulté 1.3 · publié le 2018-03-25 (réimport crackmes.de)
- Archive : `original/qcrk5.tgz` → binaire `qcrk5`
- Usage : `./qcrk5 <password>`

## Réponse

Password **`91867153`**.

## Comment on trouve

1. `file` / `diec` : ELF32 statically linked, stripped. Strings : `Correct, Cracked !!`, `Wrong!`, `Usage : %s <password>`.
2. `main` @ `0x8048208` (`analysis/objdump-main.txt`) :
   - `ptrace` anti-debug ;
   - exige `argc == 2` ;
   - `atoi(argv[1])` → `n` ;
   - `n += 5` puis `n += 0x60` (= +101) ;
   - `n = n * 255` (`shl 8` − `n`) ;
   - `n *= 0x909090` ;
   - compare à la constante **`0x4b7f3da0`**.
3. On résout `((atoi(p)+0x65) * 255 * 0x909090) ≡ 0x4b7f3da0 (mod 2³²)`. La plus petite solution positive est `91867153` (vérifiée en live).

## Vérification

```bash
python3 tools/qcrk5-solve.py --check
./analysis/qcrk5 91867153   # → Correct, Cracked !!
```

## Fichiers

- `analysis/qcrk5` : ELF extrait
- `analysis/objdump-main.txt` : `main`
- `tools/qcrk5-solve.py` : solveur + `--check`
