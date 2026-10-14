# qcrk_1 — qnix (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c0f7 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **packé** (stub maison « ZXC ») → ELF dynamique
- Archive : `original/qcrk.tgz` → binaire `qcrk` (3398 octets)
- Usage : `./qcrk <key>`

## Réponse

**Il n'existe pas de clé valide** : c'est un *patch-me* (la bannière affiche `--[ UNCRACKED VERSION ]--`).
Le test `strcmp(skey, key)` ne peut pas réussir, il faut neutraliser le saut conditionnel :

| Où | Avant | Après |
|---|---|---|
| `0x08048514` (offset fichier `0x514` du binaire dépaqueté) | `75 45` (`jne 0x804855b`) | `90 90` |

```bash
python3 -I tools/qcrk_1-solve.py --check
# petik @ … = 1101000100101000111101010100101001001010101001010101001010 @ …
# --[ Correct Key ]--
```

## Premier regard

```text
$ file qcrk
ELF 32-bit LSB executable, Intel 80386, statically linked, no section header
$ ./qcrk AAAA
AAAA @ 0xffcbcc70 != skey @ 0xffcbcc30
--[ Wrong Key ]--
```

Le fichier fait 3,4 Ko, sans section header, avec le magic `ZXC!` et des chaînes `/tmp/ZXC…` : un packer qui écrit le vrai ELF dans `/tmp`, l'ouvre en lecture, `unlink`, puis `execve("/proc/<pid>/fd/3")`.

## Comment on trouve

1. **Dépaquetage** (ancrage : `strace`) :
   ```bash
   strace -f -e trace=write -e write=4 -o st.txt ./qcrk AAAA
   ```
   Le `write(4, "\177ELF…", 4372)` est le programme réel. On reconstruit les 4372 octets depuis le dump hexadécimal → `analysis/qcrk.unpacked` (ELF32 dynamique, strippé, libc).
2. **`main`** @ `0x08048448` (`objdump -d -M intel analysis/qcrk.unpacked`) :
   - `rep movsb` de `0x3d` octets depuis `0x804872c` vers `ebp-0x58` : la chaîne attendue **`skey`**, 60 caractères `0`/`1` + NUL
     (`110100010010100011110101010010100100101010100101010100101010`).
   - `strncpy(ebp-0x18, argv[1], 10)` : la saisie est tronquée à **10 octets**.
   - `strcmp(skey, buf)` @ `0x804850a` ; `jne 0x804855b` → `--[ Wrong Key ]--`, sinon `--[ Correct Key ]--`.
3. **Impossibilité** : `buf` contient 10 caractères au plus (suivis d'octets de pile non maîtrisés) alors que `skey` en fait 60 ; l'égalité est donc inatteignable. Avec le titre « UNCRACKED VERSION », l'intention est de *cracker* le binaire.
4. **Patch** : NOP du `jne` @ `0x8048514` (`75 45` → `90 90`) → le flot tombe dans le chemin `Correct Key`.

## Vérification

```text
$ python3 -I tools/qcrk_1-solve.py --check
petik @ 0xff… = 1101…1010 @ 0xff…
--[ Correct Key ]--
check: OK (avant patch: Wrong Key, après: Correct Key)
```

Le patch est appliqué sur une **copie** (`analysis/qcrk.patched`) du binaire dépaqueté ; `original/` n'est jamais modifié.

## Notes

- Pas de GDB : analyse statique + `strace` pour l'extraction.
- Le binaire d'origine (packé) ne peut pas être patché sur place sans repacker : on travaille sur le payload extrait.

## Fichiers

- `analysis/qcrk` : stub packé (extrait du tgz) · `analysis/qcrk.unpacked` : ELF réel · `analysis/qcrk.patched` : copie patchée
- `tools/qcrk_1-solve.py` : applique le patch et vérifie la sortie
