# Va7D1n3's Automata Simulation

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6abbc4dd0885f990699dc050) · id `6abbc4dd0885f990699dc050`

PE64 **GUI** MinGW-w64 (GCC 15.2.0), simulation Win32 inspirée de *NieR: Automata*. Diff. site **2.0**.  
Famille : [`../README.md`](../README.md).

| Fichier | Rôle |
|---|---|
| [`original/Automata Simulation v3.0.exe`](original/Automata%20Simulation%20v3.0.exe) | binaire (inner ZIP) |
| [`original/README.md`](original/README.md) | brief auteur |
| [`original/solution.txt`](original/solution.txt) | soluce auteur — **désync** avec ce build (voir notes) |
| [`tools/automata-solve.py`](tools/automata-solve.py) | séquence + patcher / `--check` |
| [`analysis/automata-patched.exe`](analysis/automata-patched.exe) | PE patché (`--patch`) |

## Réponse

| | |
|---|---|
| **Séquence (phase 1)** | `nier` / `NIER` / mélange (4 lettres, n’importe quelle casse) |
| **Patch (phase 2)** | `0x140001A64` (fichier `0xE64`) : `mov byte [0x14000B0E8], 1` + 16× `nop` |
| **OK** | UI `LINK MATRIX: [ BYPASS UNLOCKED ]` puis pods + **ENDING [S] ACHIEVED** |
| **KO clavier** | reset des `#` ; bouton sans unlock → *POD SYSTEM: ERROR* |
| **Sans patch** | bouton après unlock → *SYSTEM SUPERVISOR: ALERT* (999==999) |

```bash
python3 tools/automata-solve.py -q
# nier

python3 tools/automata-solve.py --from-pe
python3 tools/automata-solve.py --patch
python3 tools/automata-solve.py --check
```

Dans la fenêtre (classe `NierSecretChallenge`) : taper **nier**, cliquer *[ ENGAGE TACTICAL POD RECOVERY ]* sur le binaire **patché**.

---

## 1. Premier regard

```text
PE32+ executable (GUI) x86-64, MinGW-w64 GCC 15.2.0
sha256  82266599d4ef083a42f3c0e5064a5fb0973a9599c09acb7125ab9e48026098da
size    33280
entry   RVA 0x13e0  imagebase 0x140000000  subsystem WINDOWS
```

ZIP crackmes.one → `Automata.zip` → exe + brief + `solution.txt`.

Imports UI : `USER32` (`CreateWindowExW`, `GetMessageA`, `SetWindowTextW`, `MessageBoxW`, `SetTimer` 0x21 ms) + `GDI32` (double buffer `BitBlt`). CRT MinGW + `libstdc++-6` / `libgcc_s_seh-1`.

Chaînes **UTF-16** (ASCII `strings` les coupe) :

```text
NierSecretChallenge
LINK MATRIX: [ _ _ _ _ ]  /  [ # _ _ _ ] …  [ BYPASS UNLOCKED ]
[ ENGAGE TACTICAL POD RECOVERY ]
SYSTEM SUPERVISOR: ALERT
Warning: Access denied. Pod recovery protocol requires supervisor verification.
Logic branch execution forcibly halted by local firmware configuration. Manual code override required.
SUCCESS: GRID RECOVERED / ENDING [S] ACHIEVED
```

Ancrage IDA (MCP `ida`) :

| VA | Rôle |
|---|---|
| `sub_140001590` | WinMain réel : `RegisterClassW("NierSecretChallenge")`, contrôles, timer |
| `sub_140002D40` | `WndProc` : `WM_CHAR` 0x102, `WM_COMMAND` 0x111 id=1, `WM_TIMER` 0x113, paint |
| `sub_1400019D0` | refresh texte LINK MATRIX selon `dword_14000B0EC` / `byte_14000B0E9` |
| `sub_140001A50` | bouton pods (supervisor 999) |
| `sub_140001C50` | tick : spawn ennemis, HP, ENDING [S] |

---

## 2. Flow

1. CRT `sub_140004FC0` → `sub_140001590` : fenêtre 460×520, static titre, static matrix, bouton id **1**, `SetTimer(..., 0x21)`.
2. `WM_CHAR` : automate 4 états `dword_14000B0EC` ∈ {0,1,2,3}. Match → `#` de plus ; 4ᵉ lettre → `byte_14000B0E9 = 1`.
3. Clic bouton → `sub_140001A50` :
   - `B0E9 == 0` → MessageBox *POD SYSTEM: ERROR* ;
   - sinon `volatile int = 999; if (x == 999)` **toujours** MessageBox supervisor (le spawn pods est du **code mort**).
4. Timer : si `byte_14000B0E8 == 0`, spawn d’ennemis (hex `0x%06X`). HP (`dword_140006000`) −5 au contact → 0 % = *FATAL HARDWARE FAILURE*.
5. `B0E8 != 0` : plus de spawn ; quand la grille est vide + flag, textes **ENDING [S]**.

---

## 3. Comment on trouve

### 3.1 Séquence `nier` (`WndProc`, msg 258 = `WM_CHAR`)

Hex-Rays `sub_140002D40` (extrait commenté) :

```c
// a3 = uMsg, a5 = wParam (WCHAR)
if ( (_DWORD)a3 == 258 ) {                 // WM_CHAR
    if ( dword_14000B0EC == 0 ) {
        v7 = 1;
        if ( (a5 & 0xFFFFFFDF) == 0x4E )   // 'N' ou 'n'
            goto commit;
    } else if ( dword_14000B0EC == 1 ) {
        v7 = 2;
        if ( (a5 & 0xFFFFFFDF) == 0x49 )   // 'I' / 'i'
            goto commit;
    } else if ( dword_14000B0EC == 2 ) {
        v7 = 3;
        if ( (a5 & 0xFFFFFFDF) == 0x45 )   // 'E' / 'e'
            goto commit;
    } else if ( dword_14000B0EC == 3 && (a5 & 0xFFFFFFDF) == 0x52 ) {
        byte_14000B0E9 = 1;                // unlock
        v7 = 0;
        goto commit;
    }
    v7 = 0;                                // mauvaise touche → reset
commit:
    dword_14000B0EC = v7;
    sub_1400019D0();                       // SetWindowTextW des [#]
}
```

`& 0xFFFFFFDF` lève le bit 5 ASCII : casse ignorée. Pas de `* 13`. Le solveur relit les `and r8d, 0xFFFFFFDF ; cmp r8d, imm8` (`--from-pe`).

`sub_1400019D0` : `B0E9` → `LINK MATRIX: [ BYPASS UNLOCKED ]`, sinon 0–3 `#`.

### 3.2 Supervisor `999` (`sub_140001A50`)

Le pseudo Hex-Rays **écrase** le check (toujours vrai) et ne montre que les deux MessageBox. Le listing :

```text
140001A57  cmp  byte_14000B0E9, 0
140001A5E  jz   loc_140001BF8          ; pas unlock → POD SYSTEM: ERROR
140001A64  mov  dword [rsp+4Ch], 3E7h  ; 999
140001A6C  mov  eax, [rsp+4Ch]
140001A70  cmp  eax, 3E7h
140001A75  jz   loc_140001C20          ; TOUJOURS → SUPERVISOR: ALERT
140001A7B  ; --- code mort : 4 pods dans vector xmmword_14000B090
           ;     ShowWindow + SetWindowTextW "ASSIST PROTOCOL INITIATED"
```

`0x3E7 = 999` : le `volatile int antiCheatCheck = 999; if (antiCheatCheck == 999)` du `solution.txt` auteur. GCC n’a pas supprimé le store/reload (volatile) mais le saut est inconditionnel en pratique.

**Patch qui débloque vraiment ENDING [S]** (23 octets, pile exactement jusqu’à `0x140001A7B`) :

```text
file 0xE64 / VA 0x140001A64
c7 44 24 4c e7 03 00 00  8b 44 24 4c  3d e7 03 00 00  0f 84 a5 01 00 00
→
c6 05 7d 96 00 00 01     mov byte ptr [rip+0x967D], 1   ; byte_14000B0E8 = 1
90 × 16
```

`RIP` après le `mov` = `0x140001A6B` ; `0x140001A6B + 0x967D = 0x14000B0E8`.

Pourquoi `B0E8` et pas un simple NOP du `jz` :

- le spawn pods (vector `xmmword_14000B090`) ne **écrit jamais** `B0E8` ;
- le tick (`sub_140001C50`) : `if (byte_14000B0E8 == 0) spawn_ennemis…` — sans le flag, la grille ne se vide pas ;
- win @ `0x140002BE9` : `cmp B0E8, 0 / jz skip` puis `SetWindowTextW("SUCCESS: GRID RECOVERED\nENDING [S] ACHIEVED")` ;
- paint : lasers pods seulement si `B0E8 != 0`.

NOP du `jz 0x140001C20` seul : pods en mémoire, pas de flag, pas d’ending (constat aussi dans les commentaires site).

---

## 4. Prédicat consolidé

```text
WM_CHAR, w & ~0x20 :
  état0 → 'N'
  état1 → 'I'
  état2 → 'E'
  état3 → 'R'  ⇒  byte_14000B0E9 = 1

SummonBots (WM_COMMAND id=1) :
  B0E9==0            → MessageBox POD SYSTEM
  else 999==999      → MessageBox SUPERVISOR   (stock)
  patch B0E8=1+fallthrough → 4 pods + plus de spawn + ENDING [S]
```

---

## 5. Vérification

```text
> python tools/automata-solve.py --from-pe -q
nier

> python tools/automata-solve.py --check
key=NIER
patch=analysis\automata-patched.exe @ 0xe64
# octets supervisor 0xE64 : 23 bytes 999/jz → mov [B0E8],1 + nop
```

`--check` relit les 4 `cmp r8d, imm8` et réécrit le patch. Preuve live GUI : le PE importe `libgcc_s_seh-1.dll` / `libstdc++-6.dll` (MinGW) ; sans ces DLL le loader sort `0xC0000135`. Sur une machine avec le runtime MSYS2 : lancer `analysis/automata-patched.exe`, taper `nier`, cliquer le bouton.

KO : une lettre hors séquence remet `dword_14000B0EC` à 0. Bouton avant unlock → *Command rejected. Network handshake protocol uninitiated.*

---

## 6. Notes

- [`original/solution.txt`](original/solution.txt) décrit un hash `ord(c)*13` (1014, 949, …). **Absent** de ce PE : comparaisons directes `'N'/'I'/'E'/'R'`. Le patch « NOP le jz » du même fichier ne pose pas `B0E8`.
- Pas d’anti-debug réel ; « timing checks » du brief = accélération du spawn (`dword_14000B0F4 += 0.05`).
- Dépendances MinGW (`libstdc++-6.dll`, `libgcc_s_seh-1.dll`) si le runtime n’est pas déjà sur la machine.
