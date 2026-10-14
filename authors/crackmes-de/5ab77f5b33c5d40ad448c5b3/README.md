# var — unchapelierfou (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5b33c5d40ad448c5b3 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF64 x86-64, **statique** (800 Ko), strippé
- Archive : `original/var.zip` → `var`
- Usage : saisie interactive `Flag :`

## Réponse

```
Flag_Over_Here_Dude
```

```bash
python3 -I tools/var-solve.py --check
# flag : Flag_Over_Here_Dude / check: OK (Congratz=True, mauvais→No dude=True)
echo Flag_Over_Here_Dude | ./analysis/var        # Flag : Congratz ... easy wasn't it ?
```

## Premier regard

```text
$ echo petik | ./analysis/var
Flag : No dude =/
$ strings -n 5 analysis/var | grep -E "Flag|Congratz|dude"
Flag_OveH   r_Here_DH   Flag :   Congratz ... easy wasn't it ?   No dude =/
```

Les chaînes `Flag_OveH` / `r_Here_DH` / `ude` ressortent coupées en morceaux dans `strings` : ce sont les **immédiats** de `mov` ; la 3ᵉ partie est un `mov dword` (`ude\0`), d'où l'impossibilité de la voir en un seul morceau.

## Comment on trouve

**Ancrage** : `strings` → les fragments ci-dessus ; `main` @`0x401080` (`analysis/main-dis.txt`, `objdump -D -b binary -m i386:x86-64`).

```asm
40108c: movabs rax,0x65764f5f67616c46      ; "Flag_Ove"   (little-endian)
401096: mov    [rbp-0x40],rax
40109a: movabs rax,0x445f657265485f72      ; "r_Here_D"
4010a4: mov    [rbp-0x38],rax
4010a8: mov    DWORD PTR [rbp-0x30],0x656475   ; "ude\0"
4010af: mov    edi,0x493984 ; call printf       ; "Flag : "
4010be: lea rax,[rbp-0x20] ; mov esi,rax ; mov edi,0x49398c ; call scanf   ; "%s"
4010d4/4010e2: call 0x400330 (strcmp)(flag, saisie)
4010e9: jne -> "No dude =/"   sinon  "Congratz ... easy wasn't it ?"
```

Concaténation des trois morceaux : `Flag_Ove` + `r_Here_D` + `ude` = **`Flag_Over_Here_Dude`**.

**Pièges :** aucun anti-debug ; binaire statique donc ~800 Ko de glibc à ignorer (`main` repéré par les `movabs`).
Le tampon de saisie fait 0x20 octets (`scanf("%s")` non borné) : sans intérêt pour la solution.

## Fichiers

- `analysis/var`, `analysis/main-dis.txt`, `analysis/verify.txt`
- `tools/var-solve.py` : relit les 3 morceaux dans le binaire + `--check`
