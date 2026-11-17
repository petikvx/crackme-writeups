# iseey0u — crackmes.exe (iseey0u-re)

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a00a162d7ff92e1214c008d)
- Auteur : iseey0u-re · Plateforme : Windows PE64 (MSVC 19.50, console, C++ `iostream`)

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mdp `crackmes.one`), contient `crackmes.exe` |
| `analysis/crackmes.exe` | `crackmes.exe` extrait du ZIP (copie de travail, non patchée) |
| `analysis/dbgrun.exe` | mini-débogueur Win64 (compilé depuis `tools/dbgrun-gas.s`) pour la preuve sous Wine |
| `tools/iseey0u-solve.py` | solveur (`-q`, `--check`) |
| `tools/dbgrun-gas.s` | source gas du lanceur `DEBUG_ONLY_THIS_PROCESS` |

## Réponse

Le mot de passe **n'est valide que si le programme tourne sous débogueur** :

```
14 14 14 14 53 42 51 53 5b 5d 55 43     (= 4×Ctrl-T puis "SBQS[]UC")
```

```bash
python3 tools/iseey0u-solve.py          # affiche le mot de passe
python3 tools/iseey0u-solve.py -q       # octets bruts
python3 tools/iseey0u-solve.py --check analysis/crackmes.exe analysis/dbgrun.exe
```

Piège : le « évident » `crackmes` (clé 0x5d, chemin sans débogueur) ne fonctionne jamais.
Pas de login dans ce challenge (pas d'exemple `petik`).

## Premier regard

```bash
7z x -pcrackmes.one original/download.bin -oanalysis/    # → crackmes.exe (214016 o)
diec analysis/crackmes.exe     # PE64, MSVC 19.50, LTCG
strings -n 4 analysis/crackmes.exe | grep -iE "password|Success|Fail"
```

`strings` ne montre que `Enter the password: `, `Success!`, `Fail!` (`.rdata` `0x14002d750`/`0x14002d75c`/`0x14002d768`).
Le mot de passe n'apparaît pas en clair : il est reconstruit à l'exécution.
Lancé normalement (`wine crackmes.exe`), le programme affiche l'invite, lit une ligne puis **quitte sans rien afficher**, quelle que soit la saisie.

## Flow

1. Construit une `std::string` « attendue » (clé XOR + préfixe selon la détection de débogueur).
2. Affiche `Enter the password: `, lit la saisie (`cin`).
3. `IsDebuggerPresent()` == 0 → `exit` silencieux (`0x14000228c`).
4. Compare saisie / attendue (taille puis `memcmp`) → `Success!` ou `Fail!`.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/crackmes.exe`, en partant du XREF sur les chaînes (`.rdata` `0x14002d750` = `Success!`, `0x14002d75c` = `Fail!`). La fonction qui les utilise est `main`, à `0x140001f90`.

Début de `main` : la clé XOR est un octet local `[rbp-0x21]`, **0x5d par défaut** :

```asm
140001faf: mov BYTE PTR [rbp-0x21],0x5d       ; clé « normale »
140001fcc: mov rax, gs:[0x60]                 ; PEB
140001fd5: cmp BYTE PTR [rax+0xbc],0x70       ; NtGlobalFlag == 0x70 (heap flags de debug)
140001fde: cmp BYTE PTR [rax+2],bl            ; PEB.BeingDebugged != 0
140001fe3: mov BYTE PTR [rbp-0x21],0x6d       ;   → clé = 0x6d
140001fe7: mov QWORD PTR [rbp-0x9],1          ;   → string attendue = 1 octet…
140001fef: mov WORD PTR [rbp-0x19],0x14       ;   … 0x14
```

Ce même test (`NtGlobalFlag==0x70 || BeingDebugged`) est répété **4 fois** dans `main` (`0x140001fcc`, `0x140001ff5`, `0x140002082`, `0x1400020de`) ; à chaque fois, sous débogueur, il remet la clé à 0x6d et **ajoute un octet 0x14** à la string attendue. Soit un préfixe `14 14 14 14`.

Puis la boucle `0x140002150` XOR 8 octets stockés en immediates avec la clé :

```asm
14000213a: mov DWORD PTR [rbp+0x27],0x3e3c2f3e   ; octets LE : 3e 2f 3c 3e
140002141: mov DWORD PTR [rbp+0x2b],0x2e383036   ; octets LE : 36 30 38 2e
140002155: xor r9b, BYTE PTR [rsi]               ; r9b = clé ^ blob[i]
140002176: mov BYTE PTR [rax+rcx],r9b            ; append à la string attendue
```

Décodage de `3e 2f 3c 3e 36 30 38 2e` :

| clé | résultat | chemin |
|---|---|---|
| 0x5d | `crackmes` | sans débogueur — **leurre** |
| 0x6d | `SBQS[]UC` | sous débogueur — attendu |

Le test `0x14000207a` (`call [IsDebuggerPresent]` ; `test ebx,ebx` ; `je 0x14000228c`) fait quitter le programme quand il n'y a pas de débogueur : le chemin `crackmes` mène donc à un exit silencieux et n'est jamais comparé. Seul reste le chemin débogué :
mot de passe = `14 14 14 14` + `SBQS[]UC`.

Comparaison finale (`0x1400021c5`) : taille égale (`cmp r8,[rbp-0x9]`) puis `memcmp` (`call 0x14001f3f0`) → `Success!` (`0x14002d750`), sinon `Fail!`.

Pièges :
- `crackmes` (clé 0x5d) saute aux yeux mais est mort ;
- 0x14 est non imprimable (Ctrl-T) — taper à la main exige d'envoyer les octets bruts, d'où `-q` ;
- le test est sur le PEB, donc `winedbg` n'est pas indispensable : n'importe quel débogueur qui pose `BeingDebugged`, ou un patch du PEB, suffit.

## Vérification

`winedbg` bloquait sur l'entrée standard (entrée du programme et commandes du débogueur se mélangent). Preuve avec un mini-débogueur écrit pour l'occasion (`tools/dbgrun-gas.s`, `CreateProcessA` avec `DEBUG_ONLY_THIS_PROCESS` + boucle `WaitForDebugEvent`/`ContinueDebugEvent`, stdin hérité) :

```bash
gcc -c tools/dbgrun-gas.s -o /tmp/d.o
ld -m i386pep /tmp/d.o /usr/lib/x86_64-linux-gnu/wine/x86_64-windows/kernel32.dll \
   -o analysis/dbgrun.exe -e mainCRTStartup --subsystem console
python3 tools/iseey0u-solve.py -q | xvfb-run -a wine analysis/dbgrun.exe analysis/crackmes.exe   # (+ newline)
python3 tools/iseey0u-solve.py --check analysis/crackmes.exe analysis/dbgrun.exe
```

Résultats réels :

| Cas | Sortie |
|---|---|
| `14141414 SBQS[]UC` sous débogueur | `Enter the password: Success!` |
| `crackmes` sous débogueur (KO) | `Enter the password: Fail!` |
| `crackmes` / n'importe quoi, sans débogueur | `Enter the password: ` puis sortie silencieuse |

## Notes

- Pas de patch de `original/` ; le ZIP est intact, `crackmes.exe` est extrait sous `analysis/`.
- Anti-debug « inversé » : le chemin sans débogueur est le piège, pas l'inverse.
- Pas de GDB ni x64dbg utilisés ; analyse statique (`objdump`) + preuve Wine.
