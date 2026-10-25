# crackmes.de's key_file_crack_1 (CrackMe3) by kcom

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c33b`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c33b) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | kcom (site : crackmes.de) |
| **Plateforme** | Windows PE32 GUI, MSVC 6, 2560 octets |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme3.zip` | archive d'origine (mot de passe `crackmes.one`) |
| `analysis/x/CrackMe3.exe` | exe extrait (non patché) |
| `tools/key-file-crack-1-solve.py` | génère `TheKeyFile.txt` (`--check EXE` lance Wine) |

## Réponse

Keyfile (pas de user/serial) : placer dans le dossier de l'exe un fichier
**`TheKeyFile.txt`** contenant exactement 15 octets : **`hzj||/xg`|/mnld`**.

```bash
python3 -I tools/key-file-crack-1-solve.py --out <dossier_de_l_exe>
```

## Premier regard

```bash
unzip -P crackmes.one original/crackme3.zip
diec CrackMe3.exe     # MSVC 6, PE32 GUI
strings -n 4 CrackMe3.exe
```

Imports : `CreateFileA`, `GetFileSize`, `ReadFile`, `CloseHandle`, `strlen`, `strcmp`, `MessageBoxA`.
Strings utiles : `ZfkEkwHgbk zvz` (illisible), `guess whos back`, `w00t`, `congrads!`.

## Flow

1. Copie `ZfkEkwHgbk zvz` (`.data` 0x403000) sur la pile, la déchiffre → nom de fichier.
2. `CreateFileA(nom)` ; échec → exit.
3. `GetFileSize` doit valoir **15** (0xf).
4. `ReadFile` de 15 octets, déchiffrement, `strcmp` avec `guess whos back`.
5. Égalité → `MessageBoxA("congrads!", "w00t")`.

## Comment on trouve

Ancrage : `objdump -d -M intel --start-address=0x401000 CrackMe3.exe` (tout le code
tient dans `.text` à 0x401000, une seule fonction + deux thunks `strcmp` 0x401160 / `strlen` 0x401166).

Boucle de déchiffrement du nom (0x40103c–0x401072) :

```asm
401049: call strlen            ; eax = strlen(buf)  (14)
401051: cmp  [ebp-8], eax      ; i < strlen ?
40105a: call strlen            ; al = strlen(buf)
401065: mov  cl, [ebp+edx-0x2c]
401069: xor  cl, al            ; buf[i] ^= strlen
```

La clé est donc `strlen("ZfkEkwHgbk zvz") = 14 = 0x0e`. Attention : `strlen` est
recalculé à chaque tour, mais aucun octet ne devient nul, donc la clé reste 14.
`'Z'^14='T'`, `'f'^14='h'`, … → **`TheKeyFile.txt`**.

Même schéma pour le contenu (0x4010f4–0x40112a) : le buffer de 15 octets lu est XOR
avec son `strlen` puis comparé (`strcmp` @0x401135) à `guess whos back` (0x403010).
Le XOR étant involutif : contenu = `"guess whos back"` ^ 0x0f (clé 15 = taille imposée
par le `cmp eax,0xf` @0x4010bf) :

```text
g^0f=h u^0f=z e^0f=j s^0f=| s^0f=| ' '^0f=/ w^0f=x h^0f=g o^0f=` s^0f=| ' '^0f=/ b^0f=m a^0f=n c^0f=l k^0f=d
→ hzj||/xg`|/mnld
```

Pièges : le fichier est cherché dans le répertoire courant (nom relatif) ; une taille ≠ 15
(ex. un `\n` final) fait échouer le check sans message ; aucun message d'échec n'existe.
Analyse 100 % statique, pas de session GDB.

## Vérification

```bash
cd <dossier avec CrackMe3.exe>; python3 -I tools/key-file-crack-1-solve.py -q --out .
WINEDEBUG=+relay xvfb-run -a wine CrackMe3.exe 2>&1 | grep MessageBoxA
```

- OK : `Call user32.MessageBoxA(00000000,00403028 "congrads!",00403020 "w00t",00000000) ret=00401159`
- KO (dernier octet `X` au lieu de `d`) : aucun MessageBoxA, sortie silencieuse.

## Notes

Pas de patch : le crackme est un keyfile ; `original/` n'est pas modifié.
