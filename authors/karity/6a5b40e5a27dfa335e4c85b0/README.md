# karity's karity (karity-crackme-I)

| | |
|---|---|
| **ID** | [`6a5b40e5a27dfa335e4c85b0`](https://crackmes.one/crackme/6a5b40e5a27dfa335e4c85b0) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | karity |
| **Plateforme** | Windows PE64 console, MinGW (GCC 14.2), strippé, en-tête PE volontairement corrompu |
| **SHA-256** | `8255a2e933a0b5d3271ee1915d8100a0e6809f754cc44cd309c308fedce30f96` |

| Fichier | Rôle |
|---|---|
| `original/karity-crackme-I.exe` | binaire d'origine (non modifié) |
| `tools/karity-I-solve.py` | solveur (`-q`, `--check`) |
| `tools/fix-header.py` | fabrique une **copie** à en-tête réparé pour Wine |
| `analysis/karity-crackme-I.fixed.exe` | copie générée par `fix-header.py` (preuve live) |

## Réponse

```
KARITY{fAke_aP1_n0_1dA!}
```

Pas de username : flag unique. `python3 tools/karity-I-solve.py [-q] [--check]`

## Premier regard

- `file` : PE32+ console x86-64. `strings` : `input: `, `bad format.`, `KARITY{`, `hmm`, `Correct!`, `Invalid!`.
- Imports kernel32 intrigants : `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `GetTickCount`, `VirtualProtect`.
- **Piège n°1** : Wine répond `Bad EXE format`. L'en-tête est bourré de valeurs bidon (`SizeOfCode=0x0bbbbbbf`, `BaseOfCode=0xccccaaaa`, `SizeOfStackReserve=0x50`, `LoaderFlags=0xffffffff`, tailles des data directories `0xdddfc00`/`0xf07b0`/`0x94e8`, `SizeOfRawData` de sections à plusieurs Mo…). Le code reste intact : `tools/fix-header.py` écrit une copie corrigée sous `analysis/` (l'original n'est jamais touché). Je n'ai pas pu tester l'original sur un vrai Windows (loader plus tolérant, probablement OK).

## Flow (main, `0x1400089b0`)

1. `fgets(buf, 0x40)`, retrait de `\r\n` ; longueur **0x18 = 24** exigée.
2. `strncmp(buf, "KARITY{", 7) == 0` et `buf[23] == '}'`.
3. Initialise un petit état sur la pile : `[rsp+0x29]='Z'`, `[+0x2a]=0`, `[+0x2b]=0`, et pose dans `gs:0x28` (TEB.ArbitraryUserPointer) un pointeur vers `{buf, &état}`.
4. Appelle successivement `IsDebuggerPresent`, `CheckRemoteDebuggerPresent`, `GetTickCount` (résultats « anti-debug » ignorés sauf `or` final = 0).
5. Succès si `état[1]==0` et `état[2]==7` → `Correct!`, sinon `Invalid!`.

Le vrai contrôle ne se fait donc **pas dans main** : il est caché dans ces trois appels API.

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/*.exe`, partir de la xref de la chaîne `input: ` (`0x14000a000` ← `0x1400089ba`).

**Détournement d'IAT** (`0x1400017d0`, dans `.CRT`, appelé avec `reason==1`) : la fonction résout `VirtualProtect` via la PEB (`gs:0x60` → LDR, hash ror13 du nom de module `0x8fecd63f`, `0x140001500`/`0x140001590`), parcourt la table d'imports du module principal, hashe chaque nom importé (`ror 13 ; add`) et, pour 3 hashes stockés en `.rdata` (`0x14000a040` : paires `hash, offset^0x5f3e2a1c`), remplace l'entrée IAT par `ImageBase + offset` :

| API | hash | offset (après `^0x5f3e2a1c`) | wrapper |
|---|---|---|---|
| `IsDebuggerPresent` | `0xa36dc676` | `0x1980` | `cl=0` |
| `CheckRemoteDebuggerPresent` | `0x43af7d80` | `0x19d0` | `cl=1` |
| `GetTickCount` | `0xf791fb23` | `0x1a30` | `cl=2` (puis jmp vers le vrai `GetTickCount`) |

(attribution hash→API déduite des offsets des wrappers, qui lisent `PEB.BeingDebugged` à `gs:0x60+2`.)

Chaque wrapper appelle `0x140001440(cl, BeingDebugged)` (**piège n°2** : un debugger fait `BeingDebugged=1` → `edx!=0` → le flot est corrompu, d'où « anti-debug » discret).

**Vérificateur `0x140001440`** (lit `gs:0x28` → `{buf, état}`) :

```asm
neg  edx ; sbb r9b,r9b      ; r9 = 0xFF si BeingDebugged sinon 0
xor  r9b,[rbx]              ; ^ état[0] ('Z' au départ)
mov  edx,0x17 ; sub edx,cl*8     ; i = 23-8*cl  (indice haut du bloc)
lea  edx,[rdx+rdx*2] ; lea edx,[rdx+rdx*8+0x2f]   ; k = 27*i + 0x2f
loop (8 octets, i décroissant, k -= 0x1b) :
   r8 = buf[i] ^ k ^ r9        ; r9 = octet précédent (i+1)
   r9 = buf[i]
   if (r8b != table[i]) état[1] = 1   ; table = 0x14000a060, 24 octets
fin : état[0]=r9 ; état[2] |= 1<<cl
```

Les trois blocs (cl=0,1,2) couvrent les indices 23..16, 15..8, 7..0 et le chaînage `état[0]` relie les blocs : au total une seule chaîne sur 24 octets.

**Décodage / inversion** : `table[i] = in[i] ^ (27·i+0x2f mod 256) ^ in[i+1]` avec `in[24] := 'Z'`, donc on remonte de `i=23` à `0` :
`in[23] = 0xbb ^ (23·27+0x2f = 0x2dc→0xdc) ^ 0x5a = 0x7d = '}'` (cohérent avec la vérif de main !), puis `in[22]=…`, jusqu'à `in[0]='K'`. Résultat : `KARITY{fAke_aP1_n0_1dA!}` — le préfixe `KARITY{` et le `}` retombent seuls, ce qui valide la lecture.

## Vérification

```
$ python3 -I tools/karity-I-solve.py --check
Flag : KARITY{fAke_aP1_n0_1dA!}
OK (Correct!)
KO attendu sur flag altéré : Invalid!
```

Exécuté sous `xvfb-run -a wine analysis/karity-crackme-I.fixed.exe` (copie à en-tête réparé, `.text` identique) : `KARITY{fAke_aP1_n0_1dA!}` → `Correct!`, `KARITY{fAke_aP1_n0_1dA?}` → `Invalid!`.

## Notes

- Analyse 100 % statique (objdump) + exécution Wine ; ni GDB, ni IDA, ni x64dbg MCP utilisés.
- Ne pas lancer sous debugger : `BeingDebugged=1` change `r9` et fausse la chaîne.
- Le flag dit « fake API » : les trois API sont détournées, le contrôle réel est dans les wrappers.
