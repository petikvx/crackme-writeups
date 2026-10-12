# crackme_nop_vm by opcode0x90

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c21a`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c21a) · [ORIGIN](ORIGIN.yml) |
| **Auteur** | Opcode0x90 (réimport crackmes.de, local `crackmes-de`) |
| **Publié** | 2018-03-25 (crackme du 7 juin 2007) |
| **Plateforme** | Windows PE32 console, assembleur, **mini-VM** |
| **Difficulté** | 1.0 |
| **SHA-256 exe** | `fd7a1768f44075c3f395a51571903e151e08f8c509fed6fe33217266fa6bb711` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme_nop_vm.zip`, `original/crackme_nop_vm.exe` | archive + binaire d'origine (non patché) |
| `tools/vm-disasm.py` | désassembleur du bytecode (parcours récursif depuis `0x40121d`) |
| `analysis/vm-disasm.txt` | listing VM produit par l'outil |
| `tools/nopvm-solve.py` | générateur de mots de passe (`--check`, `--eol crlf|lf`, `--prefix`) |
| `analysis/wine-run.txt` | transcript wine OK / KO |

## Réponse

Pas de nom : un mot de passe dont le **hash** doit valoir `0x0A4F4CAB`. Il en existe beaucoup ; le générateur fabrique un mot de passe contenant `petik` :

| Fin de ligne lue | Mot de passe |
|---|---|
| console Windows (`\r\n`, saisie clavier) | **`Et petikfZ`** |
| pipe Unix (`\n`) | `Et petikal` |

```bash
python3 tools/nopvm-solve.py                 # mot de passe (crlf) : Et petikfZ
python3 tools/nopvm-solve.py --eol lf        # Et petikal
python3 tools/nopvm-solve.py --check 'Et petikfZ'   # OK
printf 'Et petikfZ\r\n' | wine original/crackme_nop_vm.exe
```

(l'espace en 3e position est **obligatoire**, voir plus bas.)

## Premier regard

```text
$ file crackme_nop_vm.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 3 sections
$ strings crackme_nop_vm.exe
crackme_nop_vm by Opcode0x90, 7 June 2007 / Password pl0x: / Congratulation, you successfully solved
this crackme ;) No pizza for you either :P / Too bad ! No pizza for dinner :O
ExitProcess GetStdHandle ReadFile Sleep WriteFile
```

3 Ko, 5 imports. `AddressOfEntryPoint = 0x401506` → `jmp 0x401204` ; là : `xor ebp,0x900a72f9 ; jne` qui retombe au milieu d'une instruction (`stc ; jc`) → `lea eax,[0x40137c] ; push eax ; call [esp]` → `0x40137c : push 0x40121d ; call 0x401000`. **`0x401000` est l'interpréteur**, `0x40121d` le début du bytecode. Les chaînes sont mêlées au bytecode dans `.text`.

## L'interpréteur (`0x401000`)

`pusha` puis `edi = esp` : les registres virtuels **sont** les registres x86 sauvegardés dans le cadre `pusha` (offsets `0`=edi, `4`=esi, `8`=ebp, `0xc`=esp, `0x10`=ebx, `0x14`=edx, `0x18`=ecx, `0x1c`=eax). Chaque instruction : `[op][mode][len][args…]`, `mode` = `0xAE` (registre, offset sur 1 octet) ou `0xFF` (immédiat 32 bits). Opcode inconnu = **nop** de `len` octets (d'où le nom).

| op | sémantique (lu dans le `cmp al,…` / `cmp ah,0xae|0xff`) |
|---|---|
| `65` | `ret` (fin de la VM / du sous-programme) |
| `75` | appel VM récursif (`call 0x401000` sur l'adresse donnée), résultat → eax |
| `97` | `mov r, r/imm` |
| `59` | `push r/imm` |
| `e8` | appel **natif** (`call [r]` / `call imm`) → eax |
| `f6` | `cmp r, r/imm` (`lahf` → flags sauvés en `[ebp-4]`) |
| `4b` | `jmp` absolu |
| `ae` / `13` | `je` / `jne` (`sahf` des flags sauvés) |
| `33` | `mov r, [r/imm]` (load dword) |
| `a1` | `and r, r/imm` |
| `1d` | `add r, r/imm` |

## Comment on trouve le prédicat

`tools/vm-disasm.py` (extrait nettoyé de `analysis/vm-disasm.txt`) :

```text
00401456  mov ecx, 0xc2 ; mov esi, 0x401238 ; vcall print      ; bannière
0040146d  vcall 0x4013e2                                        ; read
00401474  mov ecx, 2 ; mov esi, 0x401308 ; vcall print          ; "\n\n"
0040148b  vcall 0x40141a                                        ; hash
00401492  cmp eax, 0x0a4f4cab
0040149a  jne 0x4014bf                                          ; -> "Too bad !"
004014a1  mov ecx, 0x52 ; mov esi, 0x40130a ; vcall print       ; "Congratulation…"

; read : 0x4013e2
push -10 ; ncall GetStdHandle ; ReadFile(eax, 0x403000, 0x400, 0x403400, 0)

; hash : 0x40141a
0040141a  mov esi, 0x403000
00401422  mov eax, 0x1337c0de
0040142a  load ebx, [esi]          ; dword NON aligné à buf+i
0040142f  add eax, ebx
00401434  add esi, 1               ; on avance d'UN octet
0040143c  and ebx, 0xff
00401444  cmp ebx, 0xa             ; octet courant == '\n' ?
0040144c  jne 0x40142a
00401453  ret
```

Donc `H = 0x1337C0DE + Σ_{i=0..n} le32(buf[i..i+3])  (mod 2^32)`, `n` = position du `\n`, `buf` = ce que renvoie `ReadFile` (saisie + `\r\n` en console) puis des zéros (`.data` vierge).

### Inversion

Un octet `b_j` apparaît dans les dwords commençant en `j, j−1, j−2, j−3` :

```
poids w_0 = 1, w_1 = 0x101, w_2 = 0x10101, w_j = 0x01010101 (j ≥ 3, y compris \r et \n)
H = 0x1337C0DE + Σ b_j·w_j
```

On fixe le « corps » (octets 3..) = `petik` + bourrage + `\r\n`, de somme `S`, et il reste
`r = 0x0A4F4CAB − 0x1337C0DE − 0x01010101·S (mod 2^32)` à fournir par `b0 + 0x101·b1 + 0x10101·b2`.
Ce reste est < 2^24 seulement pour `S ≡ 246 (mod 255)` et vaut alors `≈ 0x2094D7 + k` : `b2 = r // 0x10101 = 0x20` **forcé** (un espace), puis `b1 = 0x74` (`t`) et `b0 = 0x43 + k`.

Exemple CRLF : corps `petikfZ\r\n`, `S = 541 + 102 + 90 + 13 + 10 = 756 ≡ 246`, `k = 2` → `b0 = 0x45` (`E`) → **`Et petikfZ`**.

Piège : un octet `\n` dans le dword lu en dernier est inclus (on teste *après* l'`add`), et le `\r` de la console compte aussi → le mot de passe dépend de la fin de ligne.

## Vérification (wine, binaire d'origine)

```text
$ printf 'Et petikfZ\r\n' | wine original/crackme_nop_vm.exe
Password pl0x:
Congratulation, you successfully solved this crackme ;) No pizza for you either :P
$ printf 'Et petikal\n' | wine original/crackme_nop_vm.exe
Congratulation, you successfully solved this crackme ;) No pizza for you either :P
$ printf 'Et petikfY\r\n' | wine original/crackme_nop_vm.exe       # KO : 1 de moins
Too bad ! No pizza for dinner :O
```

Transcript : [`analysis/wine-run.txt`](analysis/wine-run.txt).

## Notes

- Le désassembleur décode aussi des « instructions » dans les chaînes (bannière à `0x401238`) : ce sont des nops de la VM jamais exécutés.
- Aucune vérification de longueur : n'importe quel mot de passe dont le hash tombe juste passe (≈ une infinité).
