# crackmes.de's crackme_1 by nrz0e1

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2f7`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2f7) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (NrZ0e1, 14/09/2007) |
| **Plateforme** | Windows PE32 console, Borland C++ (Turbo Linker 5.0) |
| **SHA-256 ZIP** | `1ae8144a993ba374af1a25a88f0768ab2aeb43dd723596194fe14cc9cd3e5b09` |
| **SHA-256 `CrackMe.exe`** | `e3c86c98c883d1e8ee1af3006a97dee4cc59ae74916eb4c2bc97776b2ec462b9` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CrackMe.zip` | archive d'origine (mdp `crackmes.one`) : `CrackMe.exe` + `readme.txt` |
| `tools/crackme1-nrz0e1-solve.py` | extrait l'exe du ZIP, applique le patch, écrit `analysis/CrackMe-patched.exe` ; `--check` le lance sous Wine |
| `analysis/CrackMe-patched.exe` | exe patché (généré) |

## Réponse

Il n'y a **pas de serial** : le `readme.txt` dit « Just solve the program will end after pressing enter… Write a patch! ». Le crackme est un **patch** : `main` quitte avant d'afficher le message de réussite.

**Patch** : à la VA `0x40117c` (offset fichier `0x77c`), remplacer les 8 octets `6a 01 e8 c1 61 00 00 59` (`push 1 / call exit / pop ecx`) par 8×`90`.

```bash
python3 -I tools/crackme1-nrz0e1-solve.py --check
```

## Premier regard

```text
$ file CrackMe.exe   → PE32 executable (console), Intel i386, 8 sections
$ diec CrackMe.exe   → Linker: Turbo Linker(5.0) ; Compiler: Borland C++(Builder)
$ strings -n 6 …     → " CrackMe #1 by NrZ0e1 / 14/09/2007"
                       " Solve the program is stopping from now! [Enter]"
                       " You solved the problem !!!! / I am proud of you ! ;-)"
```

Pas de packer. Lancé sous Wine (`xvfb-run -a wine CrackMe.exe`), il affiche la bannière et « [Enter] », mais **ne lit jamais l'entrée** et sort immédiatement avec le code 1 (≈ 1 s, `rc=1`). Le message de succès ne s'affiche jamais.

## Flow

Entrée PE `0x401000` : `jmp 0x401012` (stub Borland, avec la chaîne `fb:C++HOOK` en leurre juste après), puis init RTL et saut vers `0x407fb4` (`_startup`), qui appelle la fonction utilisateur référencée dans la table à `0x40a0b8` (`0x40a0d0 → 0x401150`) : c'est `main`.

## Comment on trouve

- **Ancrage** : `strings` donne les deux messages à `0x40a128` (bannière) et `0x40a184` (succès) ; `objdump -d -M intel CrackMe.exe` et un `grep` sur ces adresses montrent un seul xref chacun, tous deux dans `0x401150` :

```asm
401150  push ebp / mov ebp,esp
401153  push 0x40a128        ; " CrackMe #1 by NrZ0e1 … [Enter]"
401158  call 0x403d00        ; printf (Borland)
...                          ; (verrou stdout : dec/inc du compteur à 0x40a718)
40117c  push 1
40117e  call 0x407344        ; exit(1)   <-- jamais de retour
401183  pop ecx
401184  push 0x40a184        ; " You solved the problem !!!! …"   (code mort)
401189  call 0x403d00
...
4011ad  xor eax,eax / pop ebp / ret
```

- **Lecture de `0x407344`** : `push [ebp+8]; push 0; push 0; call 0x4072f0` — wrapper `exit` de la RTL Borland (appelle les `atexit`, puis `ExitProcess` via `0x407e5c`). Le code de sortie 1 observé sous Wine le confirme.
- **Pas de saisie** : la table d'imports contient `ReadFile`, mais aucun appel à `getchar`/`cin` n'existe dans `main` ; le « [Enter] » n'est qu'un texte. Il suffit donc d'empêcher l'`exit(1)` pour que l'exécution tombe sur le `printf` de succès.
- **Patch** : 8 octets `push 1 / call / pop ecx` → `nop` (la pile reste équilibrée car on supprime push **et** pop). Offset fichier = `0x40117c − 0x400000 − 0x1000 + 0x600 = 0x77c` (section `.text` : VMA `0x401000`, raw `0x600`).
- **Pièges** : le `jmp 0x80b12e` à `0x40100d` est du faux code (suite de la chaîne `C++HOOK`), jamais exécuté ; ne pas le suivre. Aucun GDB n'a été nécessaire (reverse statique + preuve Wine), donc pas de section GDB.

## Vérification

```text
$ python3 -I tools/crackme1-nrz0e1-solve.py --check
patch @file 0x77c (VA 0x40117c) : 6a01e8c161000059 -> 90*8 ; ecrit …/analysis/CrackMe-patched.exe

 CrackMe #1 by NrZ0e1
      14/09/2007

 Solve the program is stopping from now!
 [Enter]

 You solved the problem !!!!
 I am proud of you ! ;-)

CHECK OK
```

Cas KO : le binaire d'origine (`xvfb-run -a wine CrackMe.exe`) affiche seulement la bannière et sort avec le code 1, sans message de succès. Le solveur vérifie aussi le SHA-256 de l'exe et les octets d'origine avant de patcher (`original/` n'est jamais modifié).

## Notes

- Ce n'est ni un keygen ni un mot de passe : la « solution » est un patch (demandé par l'auteur).
- Le message dit « [Enter] » mais le programme n'attend pas d'Entrée, même une fois patché ; il termine directement après le message de succès.
