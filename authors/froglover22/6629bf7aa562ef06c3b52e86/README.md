# froglover22 — Crack On The Cob - COBOL

| | |
|---|---|
| **ID** | [`6629bf7aa562ef06c3b52e86`](https://crackmes.one/crackme/6629bf7aa562ef06c3b52e86) |
| **Auteur** | froglover22 |
| **Plateforme** | Linux ELF64 PIE, **COBOL** (GnuCOBOL 3.1.2 → C), non strippé ; dépend de `libcob.so.4` |
| **SHA-256** | `cac045f1420f9aca07b00b58fc17040eee808079f44361653fc1f6a18804703b` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crack_on_the_cob` | binaire d'origine |
| `tools/cob-solve.py` | relit la constante dans le code (`-q`, `--check`) |
| `tools/libcob_shim.c` | mini-remplacement de `libcob` (8 fonctions) pour la preuve live si GnuCOBOL n'est pas installé |

## Réponse

**Mot de passe : `PASSWORD`** (en majuscules ; le champ COBOL fait 10 caractères, complétés par des espaces)

```bash
python3 tools/cob-solve.py --check
echo PASSWORD | ./original/crack_on_the_cob      # Access Granted!  (avec libcob.so.4 installée)
```

## Premier regard

Sans GnuCOBOL le binaire ne démarre pas : `error while loading shared libraries: libcob.so.4`. `strings` : `Enter the password: `, `Access Granted!`, `Access Denied!`, `YES`, `main.cob`, `CrackMe`, `3.1.2`.
`nm -D` ne montre que 8 imports `libcob` : `cob_init`, `cob_check_version`, `cob_module_global_enter`, `cob_set_cancel`, `cob_display`, `cob_accept`, `cob_stop_run`, `cob_fatal_error`.
Le mot de passe n'est **pas** dans `.rodata` : le champ est en `.bss` (`NOBITS`), initialisé au démarrage.

## Flow

`main` @ `0x11c9` → `cob_init` → `CrackMe` @ `0x11fa` → `CrackMe_` @ `0x120a` (code C généré par le compilateur COBOL) :

1. première passe : `CrackMe_module_init`/init des champs ; `memset(b_8.3, ' ', 10)` puis `b_9.2 = "PASSWORD" + 2 espaces` ;
2. `cob_display("Enter the password: ")`, `cob_accept(f_8.4)` (remplit `b_8.3`, 10 octets, complété par des espaces) ;
3. `memcmp(b_8.3, b_9.2, 10)` : égal → `b_10.1 = "YES"`, sinon `"NO "` ;
4. `memcmp(b_10.1, "YES", 3)` → « Access Granted! » ou « Access Denied! ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/crack_on_the_cob --start-address=0x120a --stop-address=0x1480`.

```asm
1310: mov edx,0xa
1315: lea rax,[rip+..]  # 40c0 <b_9.2>     ; constante attendue
131f: lea rax,[rip+..]  # 40b0 <b_8.3>     ; saisie
1329: call memcmp       ; 10 octets
1332: mov WORD PTR [b_10.1],0x4559 ('YE') ; mov BYTE PTR [b_10.1+2],0x53 ('S')   ; égal    -> "YES"
1344: mov WORD PTR [b_10.1],0x4f4e ('NO') ; mov BYTE PTR [b_10.1+2],0x20          ; différent -> "NO "

1430: memset(b_8.3, 0x20, 10)            ; champ saisie = espaces
1449: movabs rax,0x44524f5753534150      ; octets 50 41 53 53 57 4f 52 44 = "PASSWORD"
1453: mov [b_9.2],rax
145a: mov WORD PTR [b_9.2+8],0x2020      ; 2 espaces
```

`0x44524f5753534150` lu en little-endian = `PASSWORD`. Piège : la constante est posée par des `mov` d'immediates dans `CrackMe_` (champ en `.bss`), donc `objdump -s -j .rodata` ne la montre pas — elle n'apparaît que dans la fraction `PASSWORDH` des `strings`.
COBOL complète/tronque les champs `PIC X(10)` : une saisie `PASSWORD` devient `PASSWORD␣␣` et égale la constante ; `password` (minuscules) est différent (comparaison d'octets).

## Debug GDB (pas à pas)

GDB n'a servi qu'à diagnostiquer mon shim `libcob` (pas à trouver le prédicat). Le `bt` à l'arrêt sur `cob_module_global_enter` montre la chaîne `main` → `CrackMe` → `CrackMe_` (`/tmp/cob*.c` : les symboles de debug du C généré sont dans le binaire).
Constat : le code déréférence immédiatement `module.6` et un pointeur global rempli par `cob_module_global_enter`, qui doivent donc être alloués par le shim.

## Vérification

Preuve live **avec mon shim** (GnuCOBOL n'est pas installé ici) : `ACCEPT` y est émulé comme en COBOL (remplissage par des espaces, troncature à 10).

```text
$ python3 tools/cob-solve.py --check
password = PASSWORD  (PIC X(10) : 'PASSWORD' + 2 espaces ; ...)
OK: Access Granted! | KO: Access Denied! | Access Denied! | Access Denied!     # password, PASSWORDXX, wrong
```

## Notes

- La preuve utilise un shim écrit pour l'occasion, pas le vrai `libcob` : le comportement exact de `cob_accept` (troncature d'une saisie > 10 caractères, par exemple) n'est donc pas vérifié avec GnuCOBOL.
- Le prédicat lui-même (`memcmp` sur 10 octets) est lu directement dans le code du binaire.
