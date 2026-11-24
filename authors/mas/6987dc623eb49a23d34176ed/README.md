# MAS's Gadget

| | |
|---|---|
| **ID** | [`6987dc623eb49a23d34176ed`](https://crackmes.one/crackme/6987dc623eb49a23d34176ed) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | MAS (local : `mas`) |
| **Plateforme** | Windows PE64 console (MinGW), + blob de code `gadget.hex` |
| **SHA-256 zip** | `b59b419fc36c75d9808754e83a512022392ae319afd64ebbb8a54f398fe4dc30` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/gadget.zip` | archive d’origine (mdp `crackmes.one`) : `chall.exe` + `gadget.hex` |
| `analysis/extracted/` | contenu dézippé (`chall.exe`, `gadget.hex`) |
| `analysis/chall.dis`, `analysis/gadget.dis` | `objdump -d` de l’exe et du blob |
| `tools/gadget-solve.py` | solveur (`-q`, `--check`) |

## Réponse

```text
z+{GAdg3t_CaN_Bu1ld_fu11_pr0GrAM}
```

```bash
python3 -I tools/gadget-solve.py --check     # -> flag + "check: Correct!" (xvfb-run wine)
```

Pas de username : pas d’exemple `petik` applicable.

## Premier regard

- `file` : PE32+ console x86-64. Strings : `gadget.hex`, `Enter the flag: `, `Correct!`, `Wrong!`, `Gadget smoke test failed!`.
- `chall.exe` lit `gadget.hex` à côté de lui (sans lui : `Error: Could not open 'gadget.hex'`), le copie dans un `VirtualAlloc` RWX (`0x14000e038`) et l’utilise comme **bibliothèque de « gadgets »** : chaque opération (add, mul, mod, and, xor, shr, strlen, memset…) est une mini-fonction du blob appelée via `buf+offset`.
- Piège : le prédicat est donc écrit avec des appels indirects `call rax` au lieu d’instructions ; il faut désassembler `gadget.hex` en brut (`objdump -D -b binary -mi386:x86-64 -M intel`).

## Flow

`main` (`0x140008100`) : charge le blob → smoke test `buf+0x40c(10,20) == 30` (sinon erreur) → `Enter the flag:` → `fgets` → thread `0x140001b80` → `Correct!` / `Wrong!`.

Thread `0x140001b80` :

1. `gadget+0x3e2` (memset 0) puis `0x140001450` : recopie de la cible (88 caractères hex en `.rdata 0x14000a110`) ;
2. `0x140001af0(flag, out)` = pipeline de transformation ;
3. `gadget+0x55a` = `strcmp`-like, `Correct!` si égal.

## Comment on trouve

Ancrage : `objdump -d -M intel chall.exe`, xref de `.rdata 0x14000a0b2` (« Enter the flag ») → `0x140008100`, puis le thread passé à `CreateThread` (`lea r8,[0x140001b80]`).

`0x140001af0` enchaîne trois étapes :

1. **`0x1400015b0` : Base64 standard** (alphabet `A-Za-z0-9+/` construit par `0x1400014a0`, padding `=`). Les décalages/masques sont des gadgets : `shl`=`+0x478`, `shr`=`+0x481`, `and`=`+0x45c`, `or`=`+0x463` ; on le voit à `shr 2`, `shl 4`, `& 0x3f`, `shr 12/6`.
2. **`0x140001870` : XOR répété sur 2 octets** — `key[i % 2]` (`+0x437` est `mod`, lu dans le blob : `div`/`rdx`) avec `key = .rdata 0x14000a101 = 98 DF` (le `00` en `…a100` est un piège : la clé commence à `a101`). XOR = `+0x46a`.
3. **`0x140001950` : encodage hex minuscule** (`"0123456789abcdef"`), nibble haut `(b>>4)&0xf` à `2*i`, nibble bas `b&0xf` à `2*i+1` (`+0x418` mul, `+0x40c` add).

Le résultat est comparé aux 88 caractères hex en `0x14000a110` :

```text
fdb6ece8caefdeb4c2a5d6efc0efd6b7ccb3a19cfc8bdeacc299a1b2fc8bdda7c0ecdaa6d59afca6c98aa9e6
```

Inversion : `unhex` → XOR `98 df 98 df …` → `eit7R0FkZzN0X0NhTl9CdTFsZF9mdTExX3ByMEdyQU19` → `base64 -d` → **`z+{GAdg3t_CaN_Bu1ld_fu11_pr0GrAM}`** (33 octets = 44 caractères base64 = 88 hex).

## Vérification

```text
$ echo 'z+{GAdg3t_CaN_Bu1ld_fu11_pr0GrAM}' | xvfb-run -a wine chall.exe
Enter the flag: Correct!
$ echo 'flag{GAdg3t_CaN_Bu1ld_fu11_pr0GrAM}' | xvfb-run -a wine chall.exe
Enter the flag: Wrong!
```

(Exécuté depuis `analysis/extracted/`, où `gadget.hex` est à côté de l’exe.)

## Notes

- Reverse 100 % statique (objdump) + preuve sous Wine ; pas de GDB / debugger live.
- Le préfixe `z+{` est celui des autres crackmes de MAS (`Z+{…}`), pas `flag{`.
- `original/` non modifié : le zip est extrait sous `analysis/extracted/`.
