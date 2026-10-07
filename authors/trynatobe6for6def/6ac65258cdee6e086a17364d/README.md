# TrynaToBe6for6Def's My First Crackme (Very Easy)

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6ac65258cdee6e086a17364d) · id `6ac65258cdee6e086a17364d`

PE64 **MinGW-w64** console C/C++. Diff. site **1.0**. Description : *Find the correct password. No patching.*

| Fichier | Rôle |
|---|---|
| [`original/My_First_Crackme.exe`](original/My_First_Crackme.exe) | binaire |
| [`tools/my-first-crackme-solve.py`](tools/my-first-crackme-solve.py) | password / `--check` |

## Réponse

| | |
|---|---|
| **Password** | `H3llo_Crackme` |
| **Flag** | `CMO{H3llo_Crackme}` |
| OK | `Yeaaaaa!!! Discord : imrate` puis `Flag : CMO{H3llo_Crackme}` |
| KO | `Not today...` |

```bash
python3 tools/my-first-crackme-solve.py -q
# H3llo_Crackme
printf '%s\n' H3llo_Crackme | wine original/My_First_Crackme.exe
# ou natif Windows :
python3 tools/my-first-crackme-solve.py --check
```

---

## 1. Premier regard

```text
My_First_Crackme.exe: PE32+ executable (console) x86-64, MinGW-w64
sha256  cac10be10cac29dcb86967dc634ae006b9029b0d85c44037e48407cdbb40e0d9
md5     14529dd5c1d984d5fe6d92286b1d583d
size    13824
```

```bash
strings -n 4 original/My_First_Crackme.exe
```

Chaînes utiles :

```text
enter the password :
Yeaaaaa!!! Discord : imrate
Flag : CMO{%s}
Not today...
FFEuiXKIAGO
```

Imports CRT : `fgets`, `strcmp`, `strcspn`, `strlen`, `getchar`, `fflush`.  
`FFEuiXKIAGO` n’est **pas** le password (essai live → `Not today...`). C’est le ciphertext XOR, à partir du premier octet imprimable.

---

## 2. Flow

`start` (`0x1400013d0`) appelle le CRT MinGW `sub_140001020`, qui appelle le « main » utilisateur `sub_140001440` (`0x1400010f9`).

1. Prompt `enter the password : ` (stdout, `fflush`).
2. `fgets(buf, 64, stdin)` puis `buf[strcspn(buf, "\r\n")] = 0`.
3. Check : `sub_140001520(buf)` — décode 13 octets puis `strcmp`.
4. Si OK : `sub_140001560` remplit un second buffer, affiche le message Discord, puis `Flag : CMO{%s}`.
5. Sinon : `Not today...`.
6. `getchar()` (pause) puis `return 0`.

Le password et le contenu du flag sont **la même** chaîne décodée.

---

## 3. Comment on trouve le password

### 3.1 Ancrage IDA (Hex-Rays)

MCP `ida` / `idat` sur `original/My_First_Crackme.exe`.  
Le check tient dans deux fonctions minuscules.

`sub_140001520` — comparaison :

```c
_BOOL8 __fastcall sub_140001520(char *a1)
{
  char Str2[14];

  sub_140001560(Str2);          // decode → buffer local
  return strcmp(a1, Str2) == 0;
}
```

`sub_140001560` — décode XOR :

```c
__int64 __fastcall sub_140001560(__int64 a1)
{
  unsigned __int64 i;

  for ( i = 0; i < 0xD; ++i )
    *(_BYTE *)(a1 + i) = byte_1400030E4[i] ^ 0x2A;
  *(_BYTE *)(a1 + 13) = 0;
  return a1;
}
```

13 tours, clé **`0x2A`** (`'*'`), source **`byte_1400030E4`** dans `.rdata`.

### 3.2 Asm de la boucle (`0x140001560`)

```asm
; rcx = dest
140001571:  cmp     [rsp+var_10], 0Dh     ; i < 13
140001577:  jnb     loc_1400015A6
140001579:  mov     rcx, [rsp+var_10]     ; i
14000157E:  lea     rax, byte_1400030E4
140001585:  movzx   eax, byte ptr [rax+rcx]
140001589:  xor     eax, 2Ah              ; clé
14000158C:  mov     dl, al
            ; dest[i] = enc[i] ^ 0x2A
14000159A:  add     rax, 1                ; i++
1400015A6:  mov     byte ptr [rax+0Dh], 0 ; NUL terminal
```

### 3.3 Dump `.rdata` @ `0x1400030E4`

`strings` part à `0x1400030E6` (`FFEuiXKIAGO`) : les deux premiers octets (`0x62`, `0x19`) ne sont pas imprimables.

| i | enc | `^ 0x2A` | ASCII |
|---|-----|----------|-------|
| 0 | `62` | `48` | `H` |
| 1 | `19` | `33` | `3` |
| 2 | `46` | `6c` | `l` |
| 3 | `46` | `6c` | `l` |
| 4 | `45` | `6f` | `o` |
| 5 | `75` | `5f` | `_` |
| 6 | `69` | `43` | `C` |
| 7 | `58` | `72` | `r` |
| 8 | `4b` | `61` | `a` |
| 9 | `49` | `63` | `c` |
| 10 | `41` | `6b` | `k` |
| 11 | `47` | `6d` | `m` |
| 12 | `4f` | `65` | `e` |

→ **`H3llo_Crackme`**.

### 3.4 Flag

Après un check OK, `sub_140001440` rappelle `sub_140001560` sur un buffer de 14 octets et passe ce buffer à `printf("Flag : CMO{%s}\n", …)`. Donc le flag est le password entre accolades.

### 3.5 Piège `strings`

`FFEuiXKIAGO` = `enc[2:]` (la partie ASCII du blob). Coller ça au prompt échoue. Il faut XOR **tout** le tableau de 13 octets, y compris `0x62 0x19`.

---

## 4. Pseudo-code

```python
ENC = bytes([0x62, 0x19, 0x46, 0x46, 0x45, 0x75, 0x69, 0x58, 0x4B, 0x49, 0x41, 0x47, 0x4F])
password = bytes(b ^ 0x2A for b in ENC).decode()  # H3llo_Crackme
flag = f"CMO{{{password}}}"                         # CMO{H3llo_Crackme}
```

---

## 5. Vérification

```text
$ echo H3llo_Crackme | ./original/My_First_Crackme.exe
enter the password : Yeaaaaa!!! Discord : imrate
Flag : CMO{H3llo_Crackme}

$ echo hello_crackme | ./original/My_First_Crackme.exe
enter the password : Not today...

$ python3 tools/my-first-crackme-solve.py --check
Yeaaaaa!!! Discord : imrate
Flag : CMO{H3llo_Crackme}
OK
```

Cas KO utiles : `FFEuiXKIAGO` (ciphertext `strings`), `Hello_Crackme` (majuscule du `3`).

---

## 6. Notes

- Pas d’anti-debug, pas de packing, consigne site *No patching* respectée (keygen / decode, pas de patch d’octets dans `original/`).
- Discord cité dans le binaire : `imrate`.
- x64dbg n’était pas attaché sur ce PE pendant le reverse ; preuve = decode IDA + run natif.
