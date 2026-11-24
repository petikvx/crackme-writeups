# Ploxied's Crack/Keygen Me

| | |
|---|---|
| **ID** | [`694c3de30c16072f40f5a3d2`](https://crackmes.one/crackme/694c3de30c16072f40f5a3d2) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | Ploxied |
| **Plateforme** | Windows PE64 console, C++ MinGW (stripped) |
| **SHA-256 (rar)** | `67be9a81fcd8ebf87f1c6e04d946f06ad6150d9add4326283d9c0da1afa84c78` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.rar` | archive d'origine (non modifiée) |
| `analysis/extracted/` | `crackme.exe` + `libwinpthread-1.dll` extraits du rar (`7z x -pcrackmes.one`) |
| `analysis/ida/crackme.asm` | `objdump -d -M intel` complet |
| `tools/ploxied-keygen-solve.py` | keygen + `--check` (Wine) |

## Réponse

Keygen : `password = HEX_MAJ( reverse( user XOR 0x0d ) )`, user de 1 à 8 caractères.

| user | password |
|---|---|
| `petik` | `666479687D` |

```bash
python3 -I tools/ploxied-keygen-solve.py --user petik      # 666479687D
python3 -I tools/ploxied-keygen-solve.py --check           # preuve live xvfb-run wine (OK + KO)
```

## Premier regard

- `file` : PE32+ console x86-64, MinGW (libstdc++, `libwinpthread-1.dll` fournie). Le binaire d'origine est un `.rar` ; extraction hors de `original/`.
- `strings` ne donne presque rien d'utile : les messages sont **chiffrés** dans `.data` (XOR `0x5a`). Seules les chaînes de format (`%s`, `%8s`, `%63s`) sont en clair dans `.rdata` (`0x140023050`).

## Flow

```
Welcome  →  Username: (%8s)  →  Password: (%63s)
→ anti-debug (IsDebuggerPresent / CheckRemoteDebuggerPresent)
→ expected = hexenc(reverse(user ^ 0x0d))
→ strlen(user) <= 8 && strcmp(password, expected) == 0  →  "Successful! Flag: Congrats{U_Solv3d_1t!}"
                                                       sinon "Failed."
```

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/extracted/crackme.exe > analysis/ida/crackme.asm`, puis recherche des xrefs vers les formats `%8s` (`0x140023053`) et `%63s` (`0x140023057`) : un seul site, la fonction de `main` autour de `0x140020cb1`–`0x140020fa9`.

**Chaînes .data** : avant chaque usage, `main` déchiffre en place la chaîne (`xor eax,0x5a` en boucle jusqu'au NUL, ex. `0x140020c60`). Décodage statique de `.data` (VMA `0x140022000`, offset fichier `0x21400`) :

| VMA | clair |
|---|---|
| `0x140022020` | `Failed.` |
| `0x140022040` | `Successful!\nFlag: Congrats{U_Solv3d_1t!}` |
| `0x140022070` / `0x140022080` | `Password:` / `Username:` |
| `0x140022098` | `Welcome` + bannière `===` |

Le flag est donc constant, sans lien avec le couple user/password : seule la branche « Successful » compte.

**Prédicat** (`0x140020d86`–`0x140020f90`) :

```asm
140020d7c  lea rcx,[0x140023057]      ; "%63s"
140020d8e  call 0x1400209d0           ; lecture password -> [rsp+0x60]
140020d93  mov rdx,rdi                ; rdi = rsp+0xa0 : buffer attendu
140020d96  mov rcx,rbx                ; rbx = rsp+0x30 : username
140020d99  call 0x140001780           ; expected = f(username)
140020d9e  call 0x140001740           ; anti-debug -> jne 0x140020fa9 (échec/exit)
...
140020eb4  call strlen(username)
140020eba  cmp eax,8 ; jle 0x140020f84 ; sinon -> "Failed."
140020f8a  call strcmp(password, expected) ; eax==0 -> "Successful!"
```

`f` = `0x140001780` :

```asm
1400017c0  movzx edx,[rsi+rax] ; xor edx,0xd ; mov [r8+rax],dl   ; buf[i] = user[i] ^ 0x0d
140017f..  boucle d'échange (rdx++ / rax--)                      ; inversion de buf
140001840  and edx,0xf / shr cl,4 ; table "0123456789ABCDEF" (0x140023080)
           out[2i] = hex[hi], out[2i+1] = hex[lo]               ; hex majuscule
```

**Assemblage pour `petik`** : `70 65 74 69 6b` ^ `0d` = `7d 68 79 64 66` ; inversé = `66 64 79 68 7d` ; hex = **`666479687D`**.

**Pièges** : chaînes chiffrées (`strings` muet) ; l'ordre « xor puis reverse puis hex » (le hex n'est pas inversé octet par octet après coup, c'est le buffer binaire qui l'est) ; `scanf %8s` borne le user à 8 caractères sans espace.

## Vérification

```text
$ python3 -I tools/ploxied-keygen-solve.py --check
petik / 666479687D  ->  Successful!  Flag: Congrats{U_Solv3d_1t!}
petik / 666479687E  ->  Failed.
OK
```

Exécuté réellement via `xvfb-run -a wine analysis/extracted/crackme.exe` (stdin : user, password).

## Notes

- Pas de GDB / x64dbg / IDA MCP utilisés : reverse 100 % statique (objdump) + preuve Wine.
- Anti-debug présent (`IsDebuggerPresent`, `CheckRemoteDebuggerPresent`) mais sans effet hors debugger.
