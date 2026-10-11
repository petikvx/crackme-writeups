# nts_crackme3 by cyclops (crackmes.de)

| | |
|---|---|
| Page | [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c15e) |
| Plateforme | Windows 32 bits, GUI MFC (MSVC 6.0) |
| Difficulté | 1.0 |
| Objectif | « Fish the serial » (bonus : patcher / loader) |

## Solution

Serial : **`2:).+-MX`** — les 7 premiers caractères sont imposés (`2:).+-M`), le 8ᵉ est libre
(`2:).+-M!` marche aussi). Pas de nom.

## Comment on trouve

1. `diec` : MSVC 6 + MFC 4.2. `strings` ne montre que `Serial is Correct!!!` : pas de serial en clair,
   il faut lire le code. `objdump` : l'unique `push 0x403020` (le message) est dans le handler du
   bouton, `0x4013d0`.
2. Le handler lit le champ `0x3E8` (`CWnd::GetDlgItemText`, 15 car. max) dans `buf`, puis enchaîne
   des tests octet par octet ; le moindre échec saute à la sortie :

| Test (asm) | Contrainte | Caractère |
|---|---|---|
| `cmp eax,8` | longueur = 8 | |
| `movsx ecx,buf[0] ; shl ecx,1 ; cmp ecx,0x64` | buf[0]·2 = 0x64 | `2` |
| `buf[1] + 0xa == 0x44` | 0x3A | `:` |
| `buf[2] + 0xa == 0x33` | 0x29 | `)` |
| `buf[3] - 0x2e == 0` | 0x2E | `.` |
| `cmp buf[4],0x2b` | | `+` |
| `cmp buf[5],0x2d` | | `-` |
| `cmp buf[6],0x4d` | | `M` |
| `test buf[7],buf[7]` | ≠ 0 (garanti par la longueur 8) | libre |

   Les tests sont faits dans le désordre (5, 0, 7, 4, 1, 3, 6, 2) pour brouiller la lecture.
3. Bonus patcher : chaque `jne 0x401449` saute vers la sortie ; le plus simple est de remplacer le
   premier test (`cmp eax,8 / jne` en `0x4013e7`) par un `jmp 0x401439` direct vers le MessageBox.

## Vérification

GUI MFC : on exécute **le vrai handler `0x4013d0`** du binaire sous Unicorn (`analysis/emulate_onok.py`),
seuls les thunks MFC `GetDlgItemText` / `MessageBox` sont émulés :

```
$ python3 analysis/emulate_onok.py Crackme3.exe '2:).+-MX'
MessageBox : ['Serial is Correct!!!']
$ python3 analysis/emulate_onok.py Crackme3.exe '2:).+-M!'
MessageBox : ['Serial is Correct!!!']
$ python3 analysis/emulate_onok.py Crackme3.exe '2:).+-N!'
MessageBox : aucune
```
