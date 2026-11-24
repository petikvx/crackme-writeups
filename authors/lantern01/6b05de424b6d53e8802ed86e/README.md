# lantern01's yuri

| | |
|---|---|
| **ID** | [`6b05de424b6d53e8802ed86e`](https://crackmes.one/crackme/6b05de424b6d53e8802ed86e) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | lantern01 |
| **Plateforme** | Windows PE64, console, C++ (MinGW GCC 16.1, `libcrypto-3` OpenSSL) |
| **SHA-256** | `3619c25d305a644c4c4f800695101ac99cdb0249abe5bf7bdb648726b0b49d1b` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/owncm.exe` | binaire d'origine (non modifié) |
| `tools/lantern01-yuri-solve.py` | keygen + `--check` (preuve sous Wine) |
| `tools/libcrypto-shim.c` | DLL de remplacement `SHA256_*` pour pouvoir lancer l'exe sous Wine |

## Réponse

**Serial = SHA-256 du name, en hexadécimal minuscule (64 caractères).**

| name | serial |
|---|---|
| `petik` | `85b78375c6a53c396b86f2dab223836c6549a6a1c5d0370bb50d259382603bbb` |

```bash
python3 -I tools/lantern01-yuri-solve.py            # name = petik
python3 -I tools/lantern01-yuri-solve.py -q --name foo
python3 -I tools/lantern01-yuri-solve.py --check    # preuve live Wine (OK + KO)
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MinGW, OpenSSL. Non strippé (symboles C++ lisibles : `main`, `sha256`, `hash`).
- `strings` : `Debugger detected!`, `You cant let it empty`, `Somehow u cracked it !!`, `You are not smart enough`.
- Imports : `libcrypto-3-x64.dll` (`SHA256_Init/Update/Final`), `libstdc++-6`, `libgcc_s_seh-1`, `IsDebuggerPresent`.
- Les prompts n'apparaissent pas dans `strings` : ils sont XORés (voir plus bas).

## Flow

1. `IsDebuggerPresent` → « Debugger detected! » + `ExitProcess`.
2. Affiche le prompt 1, `getline(cin, name)` ; vide → « You cant let it empty ».
3. Affiche le prompt 2, `cin >> serial`.
4. `hash(name, serial)` → `1` : « Somehow u cracked it !! », `0` : « You are not smart enough ».

## Comment on trouve

Ancrage : `objdump -d -M intel original/owncm.exe`, symboles présents, on lit `main` (VMA `0x140001604`) puis `hash` (`0x140001884`) et `sha256` (`0x1400014b0`).

**`hash` (`0x140001884`)** — c'est tout le prédicat :

```asm
call sha256            ; rbp-0x20 = sha256(arg1)   (arg1 = name)
mov  rdx,[rbp+0x28]    ; arg2 = serial
call operator==        ; std::string ==
setne/ebx = 1 si égal, 0 sinon
```

**`sha256` (`0x1400014b0`)** : `SHA256_Init`, `SHA256_Update(ctx, s.c_str(), s.size())`, `SHA256_Final`, puis boucle `i = 0..0x1f` :
`ss << std::hex << std::setw(2) << std::setfill('0') << (int)md[i]` → hex minuscule, 2 chiffres par octet, 64 caractères.
Le nom est hashé **sans** retour à la ligne (`getline` l'enlève).

**Prompts XORés** (`main`, boucles sur des `dword` de `.data`) : `0x140004000` ^ `0x42` (11 entrées) → `enter name:` ; `0x140004040` ^ `0x55` (17 entrées) → `emter the serial:` (la faute « emter » est dans le binaire).

Assemblage pour `petik` : `sha256("petik")` = `85b78375c6a53c396b86f2dab223836c6549a6a1c5d0370bb50d259382603bbb`.

Pièges :
- `printf 'petik\n' | sha256sum` inclut le `\n` → mauvais serial (`b8c16970…`) ; j'y suis tombé. Utiliser `printf %s` ou `hashlib`.
- `strings` ne montre aucun prompt (XOR sur dwords).

## Vérification

Aucun debugger/GDB n'a servi : reverse 100 % statique + exécution Wine.
`libcrypto-3-x64.dll` n'est pas fournie : `--check` compile `tools/libcrypto-shim.c` (mingw, SHA-256 minimal vérifié contre `hashlib`) dans un dossier temporaire avec les DLL mingw 64 bits, y copie l'exe (`original/` intact), et lance `wine owncm.exe` :

```text
OK : enter name:emter the serial:Somehow u cracked it !!        (petik / 85b78375…3bbb)
KO : enter name:emter the serial:You are not smart enough       (petik / 0000)
```

Cas bord : entrée vide → `You cant let it empty`.

## Notes

- Pas de captures d'écran (console).
- Le test anti-debug est trivial (`IsDebuggerPresent`), sans effet hors debugger.
