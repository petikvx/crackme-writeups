# deobfuscate_1 (shism)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f6633c5d40ad448cc26) · id `5ab77f6633c5d40ad448cc26`  
> Import crackmes.de — auteur **shism**. Diff ~1.0.

Crackme **PE32 GUI** ASM : obfuscation par **jmp courts** (`eb rel8`).  
Énoncé (`readme.txt`) : reconstruire le flux pour que le **`ret` soit à la fin** du bloc (pas au début de l’image).

| Fichier | Rôle |
|---|---|
| [`original/_u/Deobfuscate1.exe`](original/_u/Deobfuscate1.exe) | PE obfusqué |
| [`original/_u/readme.txt`](original/_u/readme.txt) | énoncé |
| [`tools/deobfuscate1-solve.py`](tools/deobfuscate1-solve.py) | follow EP → listing linéaire |
| [`analysis/deobfuscated.asm`](analysis/deobfuscated.asm) | sortie (~1077 insns) |

## Réponse

Pas de password. Succès = outil qui produit un listing d’exécution avec **`ret` en dernier**.

```bash
python3 tools/deobfuscate1-solve.py -q --check
# 1077 insns; last=0x00401000: ret
# check: OK

python3 tools/deobfuscate1-solve.py --asm analysis/deobfuscated.asm
```

| | |
|---|---|
| EP | `0x40236E` (`jmp` vers la chaîne) |
| Fin réelle | `0x401000: ret` |
| Insns utiles | ~1077 (jmps retirés) |

## Technique

Chaque micro-bloc = **1 insn réelle** + `eb` vers le bloc « précédent ».  
Le solveur part de l’EP, ignore les `jmp` immédiats, accumule le reste jusqu’à `ret`.

## Notes

- Beaucoup d’ops sont du bruit arithmétique (`xchg`/`imul`/`lea`) + quelques `call` internes.
- Pas d’IAT utile ; challenge 100 % déobfuscation.
