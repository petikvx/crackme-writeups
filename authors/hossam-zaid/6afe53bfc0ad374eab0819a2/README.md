# Hossam.Zaid's Crack ID & Password

| | |
|---|---|
| **ID** | [`6afe53bfc0ad374eab0819a2`](https://crackmes.one/crackme/6afe53bfc0ad374eab0819a2) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | Hossam.Zaid (local : `hossam-zaid`) |
| **Plateforme** | Windows PE64, MinGW C++ (console) |
| **SHA-256** | `d06fec0e14d50cf065e7a844ac69c89ed913c547b701b2e8bb771476a335f281` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/id_password.exe` | binaire d'origine (non modifié) |
| `tools/id-password-solve.py` | solveur (`-q`, `--check` via Wine) |

## Réponse

Pas de username : l'ID est **fixe** et le mot de passe en découle (donc pas d'exemple `petik`, rien ne dépend d'un nom).

| Champ (hex) | Valeur |
|---|---|
| **ID** | `1337beef` |
| **Password** | `3b36bbda` |

```bash
python3 -I tools/id-password-solve.py          # affiche ID + Password
python3 -I tools/id-password-solve.py -q       # 1337beef 3b36bbda
python3 -I tools/id-password-solve.py --check  # preuve Wine (OK + KO)
```

## Premier regard

- `file` : PE32+ x86-64 console, MinGW (C++, importe `libstdc++-6.dll`), strippé.
- Strings utiles : `Debugger detected!`, `Welcome!`, `Enter Your ID (hex): `, `Enter Your Password (hex): `, `Oops, Bad Entry!`, `Congratulations, ...`.

## Flow

1. `IsDebuggerPresent` (appel via IAT `0x14000a350`) : si non nul, affiche `Debugger detected!` et sort.
2. Deuxième test anti-debug : `CheckRemoteDebuggerPresent(GetCurrentProcess(), &flag)` (`0x14000a328` / `0x14000a308`).
3. `cin >> hex >> id`, puis check de l'ID ; `cin >> hex >> pw`, puis check du mot de passe.

## Comment on trouve

Ancrage : `objdump -d -M intel original/id_password.exe`, puis on part de la string `Welcome!` (`0x140005064`), référencée dans `main` à `0x14000346f`. Le check complet tient dans `0x1400034c8`–`0x14000355e`.

**ID** (u32 lu en hex dans `[rsp+0x20]`) :

```asm
mov  DWORD PTR [rsp+0x28],0xb8fa
mov  DWORD PTR [rsp+0x2c],0xacdb
mov  eax,edx ; shr eax,0x10 ; xor eax,0xabcd ; cmp eax,[rsp+0x28]   ; (id>>16) ^ 0xabcd == 0xb8fa
movzx edx,dx ; xor edx,0x1234 ; cmp edx,[rsp+0x2c]                   ; (id&0xffff) ^ 0x1234 == 0xacdb
```

Le XOR s'inverse tout seul :
- haut : `0xb8fa ^ 0xabcd = 0x1337`
- bas : `0xacdb ^ 0x1234 = 0xbeef`
- ID = **`0x1337beef`**

**Password** (u32 lu dans `[rsp+0x24]`) ; les constantes sont dans `.data` (`objdump -s` à `0x140004010`) : `K10=0xdeadbeef`, `K14=0x13579bdf`, `K18=0xa5a5a5a5`.

```asm
mov eax,[K18] ; xor eax,[id] ; rol eax,5 ; add eax,[K14] ; xor eax,[K10]
cmp [pw],eax
```

Soit `pw = ((rol32(K18 ^ id, 5) + K14) mod 2^32) ^ K10` :

1. `0xa5a5a5a5^0x1337beef=0xb6921b4a`
2. `rol 5`, puis `+ 0x13579bdf`, puis `^ 0xdeadbeef` (calculé par le solveur) → **`0x3b36bbda`**

Pièges : (a) l'ID est celui qui alimente le calcul du mot de passe, il faut donc le résoudre en premier ; (b) deux détections de debugger, sans importance ici (statique + Wine) ; (c) les saisies sont lues en **hexadécimal sans préfixe**.

Analyse 100 % statique + Wine : pas de session GDB, donc pas de section Debug GDB. Pas de debugger MCP actif non plus.

## Vérification

Wine nécessite `libstdc++-6.dll` (absente) : le solveur copie l'exe dans un dossier temporaire avec les DLL mingw (`/usr/lib/gcc/x86_64-w64-mingw32/*-posix`), `original/` reste intact.

```text
$ printf '1337beef\n3b36bbda\n' | xvfb-run -a wine id_password.exe
Welcome!
Enter Your ID (hex): Enter Your Password (hex): Congratulations, you have completed the challenge!

$ printf '1337beef\n3b36bbdb\n' | xvfb-run -a wine id_password.exe     # KO (pw ^ 1)
Enter Your ID (hex): Enter Your Password (hex): Oops, Bad Entry!
Try Again.
```

`--check` rejoue ces deux cas et sort en erreur si le résultat diffère.
