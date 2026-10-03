# ImGUI-CrackME

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/66685b79e7b35c09bb266b96) · id `66685b79e7b35c09bb266b96`

PE32 **C++** MSVC (ImGui + Direct3D 9). Diff. site **2.0**.  
GUI « CrackME ALPHA » : champ **Key:**, bouton **Submit**. Le password est **statique** (pas de username). Un thread anti-debug (`taskkill` + snapshot process + `FindWindowA` + devices) tourne en parallèle.

| Fichier | Rôle |
|---|---|
| [`original/CrackME.exe`](original/CrackME.exe) | binaire d’origine (ne pas patcher) |
| [`analysis/CrackME.patched.exe`](analysis/CrackME.patched.exe) | copie, drapeaux anti-debug à 0 |
| [`tools/imgui-crackme-patch.py`](tools/imgui-crackme-patch.py) | lit `original/CrackME.exe` → écrit la copie |
| [`tools/imgui-crackme-solve.py`](tools/imgui-crackme-solve.py) | déchiffre le password depuis le PE |

## Réponse

Password **51 caractères** (pas de login) :

```text
cqt+r?9_)*lv0)+ex4rn2fpbh*?w0*50x?b1u?j*bjqv8bem564
```

OK : MessageBox `Cracked` / *I've Never Found It Hard To Hack Most People.*  
KO : MessageBox *Maybe Wars Aren't Meant To Be Won, / Maybe They're Meant To Be Continuous.*

```bash
python tools/imgui-crackme-solve.py -q
# cqt+r?9_)*lv0)+ex4rn2fpbh*?w0*50x?b1u?j*bjqv8bem564
python tools/imgui-crackme-solve.py --check
```

Password unique, indépendant d’un username (`petik` n’est pas un login ici).

---

## 1. Premier regard

```text
CrackME.exe: PE32 executable (GUI) Intel 80386, MSVC / MSVCP140
sha256  8c86544a525f4c5015b7d1e9ac83b70b424a34f527886c185f50b4369d090be3
md5     32c921ea06f6a611612c3a88c7e18dba
size    231936
```

Strings en clair :

```text
CrackME ALPHA
Submit
Cracked
I've Never Found It Hard To Hack Most People.
Maybe Wars Aren't Meant To Be Won,
Maybe They're Meant To Be Continuous.
Driver Detection
Driver detected! Exiting program.
imgui_impl_dx9
IsDebuggerPresent
CreateToolhelp32Snapshot
FindWindowA
DebugBreak
```

Le reste des libellés utiles (Key:, noms d’outils, `taskkill …`) est **XOR** `i + 0x31` ou `i + 0x32`.

Imports : `d3d9.dll`, `MSVCP140.dll`, `VCRUNTIME140.dll` — binaire **32-bit**. Sans le CRT x86 (`SysWOW64\VCRUNTIME140.dll`), Windows sort `0xC0000135` (STATUS_DLL_NOT_FOUND). C’est le cas sur cette machine : preuve live GUI impossible tant que le redist x86 n’est pas là. Le prédicat est lu et rejoué sur le PE.

x32dbg MCP : `NO_TARGET` (pas de debuggee). Reverse **statique** IDA (MCP `ida`, base `0x400000`).

---

## 2. Flow

`WinMain` `@ 0x4037D0` :

1. Fenêtre `class001` / titre `CrackME ALPHA`, style `WS_POPUP`, **162×120**.
2. `Direct3DCreate9` + `CreateDevice`, init ImGui (`sub_4012B0`).
3. Drapeaux BSS puis deux threads `std::thread` / `_Thrd_detach` :
   - `byte_4386B3 = 1` — scan `Process32*`
   - `byte_4386B1 = 1` — scan `FindWindowA`
   - `byte_4386B2 = 1` — `CreateFileA` sur `\\.\NiGgEr` et `\\.\KsDumper`
   - `byte_4386B0 = 0` — thread timing `sub_403710` **désarmé**
   - thread `sub_403730` : d’abord `system(taskkill …)` (`sub_4033C0`), puis boucle scans + `SleepEx(1000)`
4. `IsDebuggerPresent` → `exit(1)` ; sinon `notify_debugger` = `DebugBreak` sous SEH (`EXCEPTION_BREAKPOINT` 0x80000003 avalée).
5. Boucle messages : chaque frame appelle `sub_401570` (UI ImGui).

Dans `sub_401570` `@ 0x401570` :

1. Palette ImGui (floats IEEE).
2. XOR 4 octets `0x0E4A577A` → texte **`Key:`**, `sub_4299D0` (ImGui::Text).
3. `sub_42C920` : InputText 256 octets dans `Src` (`0x4386E8`), flags `0x8038`.
4. `sub_42A0E0` : bouton **Submit** ; retour non nul si cliqué cette frame.
5. Si cliqué : déchiffre 51 octets, `strcmp(Src, v43)`.
6. XOR 21 octets → footer **`Made With Love By IDA`**.

---

## 3. Comment on trouve le prédicat

### 3.1 Ancrage IDA (MCP `ida`)

Xrefs de `"Cracked\nI've Never…"` et du titre → **`sub_401570`**. Le `strcmp` est en bas de la fonction, juste après le bouton.

### 3.2 Construction du buffer (asm)

```text
00402123  movaps  xmm0, xmmword_435C80     ; 16 octets
0040212C  movups  [ebp-7Ch], xmm0
00402130  mov     dword ptr [ebp-4Ch], 575454h  ; 'T','T','W',0  offset +0x30
00402137  movaps  xmm0, xmmword_435DB0     ; 16 octets → [ebp-6Ch]
00402146  movaps  xmm0, xmmword_435C30     ; 16 octets → [ebp-5Ch]
00402151  mov     al, cl
00402153  add     al, 31h                  ; i + '1'
00402155  xor     [ebp+ecx-7Ch], al
00402159  inc     ecx
0040215A  cmp     ecx, 33h                 ; 51 octets
0040215D  jb      loc_402151
0040215F  mov     byte ptr [ebp-48h], 0    ; NUL
; puis strcmp octet par octet vs Src
```

Hex-Rays montre un `strcpy("9v1*w …")` : c’est le **2ᵉ xmmword** recopié tel quel. L’asm (`movaps` × 3) est la source.

### 3.3 Décodage

| Source | VA / immédiat | Taille |
|---|---|---|
| `xmmword_435C80` | `0x435C80` | 16 |
| `xmmword_435DB0` | `0x435DB0` | 16 |
| `xmmword_435C30` | `0x435C30` | 16 |
| `0x00575454` | `'TTW'` | 3 |
| **total XOR** | `ecx < 0x33` | **51** |

```text
plain[i] = cipher[i] ^ ((i + 0x31) & 0xFF)
```

Les 16 premiers octets du premier xmmword donnent déjà `cqt+r?9_)*lv0)+e`. Le reste suit.

Même XOR `i+0x31` sur le footer (`xmmword_435C10` + `0x000A6238`, 0x15 octets) → `Made With Love By IDA`.  
Label du champ : 4 octets `0x0E4A577A` XOR `i+0x31` → `Key:`.

Le solveur relit ces VA dans `original/CrackME.exe` (file off. `.rdata` = `0x30000 + RVA - 0x31000`).

---

## 4. Anti-debug / anti-analyse

Thread `sub_403730` `@ 0x403730` (lancé **après** la création de fenêtre) :

**`sub_4033C0`** — quatre `system()` XOR `i+0x32` :

```text
taskkill /FI "IMAGENAME eq cheatengine*" /IM * /F /T >nul 2>&1
taskkill /FI "IMAGENAME eq httpdebugger*" /IM * /F /T >nul 2>&1
taskkill /FI "IMAGENAME eq processhacker*" /IM * /F /T >nul 2>&1
taskkill /FI "IMAGENAME eq taskmgr*" /IM * /F /T >nul 2>&1
```

**`sub_402490`** — `CreateToolhelp32Snapshot` + `stricmp` sur une liste XOR (ex. `KsDumperClient.exe`, `HTTPDebuggerUI.exe`, `Cheat Engine.exe`, `ProcessHacker.exe`, `dnSpy.Console.exe`, `binaryninja.exe`, `vboxservice.exe`, `Wireshark`, `Fiddler`, `procmon`…). Hit → **`exit(1)`**.

**`sub_402D20`** — `FindWindowA(NULL, titre)` XOR `i+0x32` : `IDA: Quick start`, `Cheat Engine 7.x`, `x32DBG`, `x64DBG`, `Fiddler*`, `Memory Viewer`, `Process List`, `KsDumper`, … Hit → **`exit(1)`**.

**Drivers** : `CreateFileA("\\\\.\\NiGgEr")` et `\\\\.\\KsDumper` ; handle valide → MessageBox *Driver detected!* + `exit(1)`.

Sous debugger le thread tue souvent le process avant le champ (`exit(1)`). Le blob XOR est dans `.rdata` : le solveur le relit sur le PE.

Patch d’analyse (drapeaux BSS à 0, `original/` intact) :

```text
VA 0x40396F  mov byte_4386B3, 1  → 0   Process32
VA 0x403976  mov byte_4386B1, 1  → 0   FindWindow
VA 0x40397D  mov byte_4386B2, 1  → 0   devices
```

`taskkill` de `sub_4033C0` reste (avant la boucle). `IsDebuggerPresent` aussi.

---

## 5. Vérification

```bash
python tools/imgui-crackme-solve.py --check
# password: cqt+r?9_)*lv0)+ex4rn2fpbh*?w0*50x?b1u?j*bjqv8bem564
# check: XOR 51 octets == expected
```

KO utile : un octet de moins / plus, ou `petik`, échoue le `strcmp` (longueur 51 exacte, C-string).

Live GUI : lancer `original/CrackME.exe` **sans** x32dbg/IDA/CE ouverts (sinon `exit(1)`), coller le password, Submit. Ici le PE32 refuse de démarrer (`VCRUNTIME140.dll` x86 absent, `0xC0000135`). `--live` le signale.

---

## 6. Notes

- Password **hardcodé**, XOR une fois les trois `movaps` vus. La friction est l’anti-debug + saisie ImGui (`InputText` / `Src`).
- `Made With Love By IDA` est un crédit / decoy, pas un password.
- Device `\\\\.\\NiGgEr` : nom dans le binaire, scan KsDumper-like.
- Ne pas patcher `original/CrackME.exe`.
