# crackmes.de's nirvana_crackme_i by anonimoser

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2e6`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e6) |
| **Auteur (site)** | crackmes.de |
| **Auteur (local)** | crackmes-de (anonimoser) |
| **Plateforme** | Windows PE32 GUI (boîte de dialogue), assembleur, packé |
| **Difficulté** | 2.0 |
| **SHA-256 (ZIP)** | `2b645cd9ddad505225e8794d0d0d1951ef1b9c7a9fea545d38408d2a0f3254c8` |

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e6
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2e6
- ZIP password : `crackmes.one` (le ZIP du site contient `nirvana_crackme1.zip`, qui contient `Nirvana_Crackme1.exe`)

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Solution

Keygen nom → serial. Pour le nom **`petik`** :

```
2634129AS225
```

Message de réussite : « bien... lo hiciste! KURT COBAIN VIVE EN NOSOTROS! ».

## Premier regard

- `file` : PE32 GUI i386, 3 sections **sans nom**, imports réduits à `LoadLibraryA` / `GetProcAddress` → binaire packé (DIE ne reconnaît pas le packer).
- Le `about` (bouton id 6) annonce les objectifs de l'auteur, en espagnol : 1) le dépacker à la main, 2) faire afficher le bon serial au lieu du message d'erreur, 3) écrire un keygen.

## Dépackage (dump mémoire)

Plutôt que de chercher l'OEP, on laisse le stub se décompresser sous wine puis on lit la mémoire du processus :

```bash
xvfb-run -a wine Nirvana_Crackme1.exe &
python3 -c "m=open('/proc/<pid>/mem','rb'); m.seek(0x401000); open('dump.bin','wb').write(m.read(0x29000))"
objdump -D -b binary -m i386 -M intel --adjust-vma=0x401000 dump.bin
```

Le code clair (petit programme assembleur, ~0x2d0 octets) est à `0x401000`, l'IAT reconstruite à `0x402000`, les données à `0x403000`. Désassemblage utile : [`analysis/unpacked-code-0x401000.asm`](analysis/unpacked-code-0x401000.asm).

IAT (thunks `jmp [..]` à partir de `0x40128e`) :

| Thunk | IAT | API |
|---|---|---|
| `0x4012a0` | `0x402008` | `lstrcatA` |
| `0x4012a6` | `0x40200c` | `lstrcmpA` |
| `0x4012ac` | `0x402010` | `lstrlenA` |
| `0x4012b2` | `0x40201c` | `wsprintfA` |
| `0x4012c4` | `0x402028` | `GetDlgItemTextA` |
| `0x4012ca` | `0x40202c` | `MessageBoxA` |

## Anti-debug

Au démarrage (`0x401000`–`0x40106e`) : `CreateFileA("\\.\SICE")` puis plusieurs `FindWindowA` (`OLLYDBG`, `OWL_Window`, `TMainForm`…). Si l'un est trouvé :

```asm
40106e: mov dword [0x403004], 1
```

Ce DWORD sert de « pas » négatif dans la boucle du serial (voir plus bas) : à 1, `lodsb` puis `sub esi, 1` font **boucler à l'infini** sur le premier caractère. Sans débogueur il vaut 0 et la boucle parcourt normalement le nom.

## Prédicat (WM_COMMAND, IDOK = 1)

```asm
401155: GetDlgItemTextA(hDlg, 4, 0x4031c0, 20)   ; serial
40116f: GetDlgItemTextA(hDlg, 3, 0x4031ac, 20)   ; nom
401189: n = lstrlenA(0x4031ac)                    ; 0 → « CARAXO! LLENA LOS DOS CASILLEROS! »
40119c: cmp eax, 4 / jb → « naa.... no pasa naa »
4011a5: mul eax / imul eax, eax, 9                ; a = 9*n*n
4011b5: L = wsprintfA(0x403195, "%d", a)          ; L = nombre de chiffres
4011bf: ebx = 0 ; pour chaque octet c du nom : ebx += c * L
4011da: mul eax                                   ; s = ebx*ebx (32 bits)
4011e9: wsprintfA(0x403181, "%d", s)
4011fb: lstrcatA(0x403181, "AS")
40120a: lstrcatA(0x403181, 0x403195)
401219: lstrcmpA(0x403181, serial) == 0 → « bien... lo hiciste! »
```

D'où :

$$
a = 9n^2,\quad L = \mathrm{len}(\mathrm{str}(a)),\quad S = L\cdot\sum_i \mathrm{nom}[i] \bmod 2^{32}
$$

$$
\mathrm{serial} = \texttt{\%d}(S^2 \bmod 2^{32}) \,\|\, \texttt{"AS"} \,\|\, \mathrm{str}(a)
$$

`%d` est signé : si `S²` dépasse `0x7fffffff`, la première partie est négative. Le nom fait au moins 4 caractères et au plus 19 (tampon de 20).

Exemple `petik` : n = 5, a = 225, L = 3, somme = 541, S = 1623, S² = 2634129 → `2634129AS225`.

## Solveur

[`tools/crackmes-de-nirvana_crackme_i-solve.py`](tools/crackmes-de-nirvana_crackme_i-solve.py) :

```bash
python3 tools/crackmes-de-nirvana_crackme_i-solve.py petik crackmes.one
# petik 2634129AS225
# crackmes.one 23386896AS1296
```

## Vérification sous wine

Harnais [`tools/nirvana-check-harness.c`](tools/nirvana-check-harness.c) (sans débogueur, pour ne pas réveiller l'anti-debug) : il lance le crackme, remplit les champs 3 et 4 par `SetDlgItemTextA`, envoie `WM_COMMAND(IDOK)` et lit le texte du `MessageBox`.

```bash
i686-w64-mingw32-gcc -O1 -o h.exe tools/nirvana-check-harness.c
xvfb-run -a wine h.exe Nirvana_Crackme1.exe petik 2634129AS225
```

```
name=[petik] serial=[2634129AS225] -> [bien... lo hiciste! KURT COBAIN VIVE EN NOSOTROS!]
name=[petik] serial=[1234AS225] -> [naa.... no pasa naa]
name=[crackmes.one] serial=[23386896AS1296] -> [bien... lo hiciste! KURT COBAIN VIVE EN NOSOTROS!]
name=[zzzzzzzzzzzzzzzzzzz] serial=[85969984AS3249] -> [bien... lo hiciste! KURT COBAIN VIVE EN NOSOTROS!]
```

## Contenu

```
original/   # nirvana_crackme1.zip (ZIP interne du site) + Nirvana_Crackme1.exe extrait (packé)
analysis/   # désassemblage du code dépacké (dump mémoire à 0x401000)
tools/      # keygen Python + harnais wine
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
