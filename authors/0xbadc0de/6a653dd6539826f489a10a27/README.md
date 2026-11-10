# 0xbadc0de's XOR Challenge By 0xbadc0de

| | |
|---|---|
| **ID** | [`6a653dd6539826f489a10a27`](https://crackmes.one/crackme/6a653dd6539826f489a10a27) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | 0xbadc0de |
| **Plateforme** | Windows PE64 console, MSVC 2022 en **Debug** (C++) |
| **SHA-256** `download.bin` | `982e87e25bfa51d427f8660f46f678716afebcb3fb081c06c8c99b054b23125f` |
| **SHA-256** `CrackMe.exe` | `945e81e113e09002db42b26f69cd43de564c32a03971fdf335e2f81caca6c67a` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), contient `CrackMe.exe` |
| `analysis/CrackMe.exe` | exe extrait (`unzip -P crackmes.one`), non modifié |
| `analysis/dis.txt` | `objdump -d -M intel` complet |
| `tools/xor-challenge-solve.py` | solveur (`-q`, `--check <exe>` sous `xvfb-run wine`) |
| `tools/xor-challenge-emu.py` | preuve : émule la vraie fonction de check avec unicorn |

## Réponse

> **Mot de passe : `mr1337`**

```bash
python3 tools/xor-challenge-solve.py -q      # -> mr1337
```

Pas de user/login : un seul mot de passe fixe (pas de `petik` applicable).

## Premier regard

- `download.bin` est un ZIP (pas un exe) : `unzip -P crackmes.one`.
- Les `strings` montrent le banner `CrackMe v1.2`, `SIMPLE+ XOR CRACKME`, `[+] Enter password:`,
  `[+] ACCESS GRANTED!`, `FLAG: CRACKME{X0R_CR4CK3D}` et `[-] ACCESS DENIED!`.
  **Piège** : le flag `CRACKME{X0R_CR4CK3D}` est en clair mais ce n'est **pas** le mot de passe,
  c'est ce qu'affiche le programme en cas de succès.
- Build Debug (`VCRUNTIME140D.dll`, fill `0xcccccccc`, `.msvcjmc`, PDB `...\CrackMe\x64\Debug\CrackMe.pdb`) :
  code non optimisé, très lisible, mais il demande le runtime debug de VS.

## Flow

`main` (0x140017cd0) affiche le banner, `[+] Enter password: `, lit une `std::string` (`cin >> s`, 0x140011032),
puis appelle `bool check(const std::string&)` via le thunk `0x1400112da` -> **`0x1400173d0`**.
Si `al != 0` : `ACCESS GRANTED` + flag, sinon `ACCESS DENIED`.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/CrackMe.exe > analysis/dis.txt`, puis suivre le `call 0x1400112da`
juste après la lecture du mot de passe dans `main` (0x140017df2) ; le thunk saute en `0x1400173d0`.

Début de la fonction : sept `mov BYTE PTR` sur la pile -- la table chiffrée et la clé :

```asm
140017409: mov BYTE PTR [rbp+0x4],0x38     ; enc[0]
14001740d: mov BYTE PTR [rbp+0x5],0x27     ; enc[1]
140017411: mov BYTE PTR [rbp+0x6],0x64     ; enc[2]
140017415: mov BYTE PTR [rbp+0x7],0x66     ; enc[3]
140017419: mov BYTE PTR [rbp+0x8],0x66     ; enc[4]
14001741d: mov BYTE PTR [rbp+0x9],0x62     ; enc[5]
140017421: mov BYTE PTR [rbp+0x24],0x55    ; clé XOR
```

(Les noms de variables `encrypted` et `password` visibles dans `.rdata` sont les descripteurs RTC de ces locaux.)

Puis la longueur et la boucle :

```asm
14001742c: call 0x140011604     ; password.size()
140017431: cmp rax,0x6          ; longueur exigée = 6
140017435: je  ...              ; sinon return false
; for (i = 0; i < 6; i++)
140017456: movzx eax, BYTE PTR [rbp+rax+4]  ; enc[i]
14001745b: xor eax,0x55                     ; ^ 0x55
140017479: call 0x140011028                 ; password[i]  (operator[])
14001747e: movsx eax, BYTE PTR [rax]
140017487: cmp ecx,eax / jne -> return 0     ; enc[i]^0x55 == password[i]
140017491: mov al,1                          ; tout égal -> true
```

Le prédicat est donc `password[i] == enc[i] ^ 0x55` pour `i = 0..5`, longueur 6.

Décodage :

| i | enc | ^ 0x55 | char |
|---|---|---|---|
| 0 | 0x38 | 0x6d | `m` |
| 1 | 0x27 | 0x72 | `r` |
| 2 | 0x64 | 0x31 | `1` |
| 3 | 0x66 | 0x33 | `3` |
| 4 | 0x66 | 0x33 | `3` |
| 5 | 0x62 | 0x37 | `7` |

=> `mr1337`.

## Vérification

Analyse 100 % statique (pas de session GDB / debugger).

**Limite honnête** : `wine` n'est pas installé sur la machine de travail (`xvfb-run: wine: not found`),
donc **pas de run live** de `CrackMe.exe` (qui exige de toute façon le runtime debug MSVC).
La preuve repose sur l'émulation unicorn de la **vraie fonction `0x1400173d0`** extraite de l'exe d'origine
(seuls `size()`, `operator[]` et les stubs RTC/JMC sont hookés) :

```bash
python3 tools/xor-challenge-emu.py analysis/CrackMe.exe mr1337    # ACCESS GRANTED
python3 tools/xor-challenge-emu.py analysis/CrackMe.exe mr1338    # ACCESS DENIED
python3 tools/xor-challenge-emu.py analysis/CrackMe.exe wrong     # ACCESS DENIED
python3 tools/xor-challenge-emu.py analysis/CrackMe.exe mr13377   # ACCESS DENIED (longueur)
```

Preuve live à refaire sous Windows/Wine : `python3 tools/xor-challenge-solve.py --check analysis/CrackMe.exe`.

## Notes

- Le flag `CRACKME{X0R_CR4CK3D}` n'est pas la réponse attendue ; le mot de passe est `mr1337`.
- XOR mono-octet constant : trivial une fois la table repérée dans le prologue (immediates `mov BYTE PTR`, pas dans `.rdata`).
