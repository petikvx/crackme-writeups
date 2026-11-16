# QERR0R's ASCII_CRACK

| | |
|---|---|
| **ID** | [`69a806c17b3cc38c80464e06`](https://crackmes.one/crackme/69a806c17b3cc38c80464e06) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | QERR0R (`qerr0r`) |
| **Plateforme** | Linux x86-64, ELF PIE C++ (g++), non strippé |
| **SHA-256 (zip)** | `e7d60125173e1d54a57cfcb8318041d88c252e60e375cf2cb9b36e0597e637cc` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | en réalité un **ZIP** (mot de passe `crackmes.one`) contenant l'ELF `ascii` — non modifié |
| `analysis/ascii` | ELF extrait du zip (`unzip -P crackmes.one`) |
| `tools/ascii-crack-solve.py` | solveur (`-q`, `--check`) |

## Réponse

**`CTF{S3cR3T_AsSc1_Fl4g}{@_@}`** — passé en argument : `./ascii 'CTF{S3cR3T_AsSc1_Fl4g}{@_@}'` → `You cracked me!`

```bash
python3 -I tools/ascii-crack-solve.py -q
python3 -I tools/ascii-crack-solve.py --check analysis/ascii
```

Pas de user/login : pas d'exemple `petik`.

## Premier regard

- `original/download.bin` : `file` indisponible, mais l'en-tête `PK\x03\x04` + entrée chiffrée `ascii` → zip. `unzip -P crackmes.one` (dans un dossier de travail à part) donne un ELF64 PIE.
- `strings` : `Usage: ./script <flag>`, `You cracked me!`, `Try again! You can do it!`, symboles C++ (`encode(char,int)`, `verify(std::string)`, `encoded_flag[abi:cxx11]`).
- Piège : `strings` ne montre pas le flag en clair, uniquement sa version encodée.

## Flow

`main` exige `argc == 2` (sinon « Usage »), recopie `argv[1]`, construit `out` en appelant `encode(argv[1][i], 6 - i)` pour chaque i, puis `verify(out)` : `out == encoded_flag`.

## Comment on trouve

Ancrage : `objdump -d -M intel --no-show-raw-insn analysis/ascii` ; fonctions `main` (0x22f1), `encode` (0x2299), `verify` (0x22bd). Pas de MCP IDA ni GDB : reverse 100 % statique + exécution native.

`encode` (0x2299) :

```asm
movsx edx, BYTE PTR [rbp-0x14]   ; c
mov   eax, DWORD PTR [rbp-0x18]  ; shift
add   eax, edx                   ; c + shift
mov   BYTE PTR [rbp-0x5], al     ; tronqué sur 8 bits
```

La boucle de `main` (0x23e4) passe `shift = 6 - i` (`mov eax,6 ; sub eax,[i]`), qui devient négatif à partir de i=7. `verify` (0x22bd) compare juste (`operator==`) à la globale `encoded_flag` (0x5220), initialisée depuis `.rodata` 0x3083 :

```
IYJ~U4cQ1Q[<mL[(U;`'Ynk/M-i      (27 octets)
```

Inversion : `flag[i] = (enc[i] - (6 - i)) mod 256`. Exemple : `I`(0x49) - 6 = `C` ; `Y`(0x59) - 5 = `T` ; `J`(0x4a) - 4 = `F` ; `~`(0x7e) - 3 = `{`. Le début `CTF{` confirme l'hypothèse ; la fin `{@_@}` est bien dans le flag (testé : sans elle → « Try again »).

## Vérification

```text
$ ./ascii 'CTF{S3cR3T_AsSc1_Fl4g}{@_@}'
You cracked me!
$ ./ascii 'CTF{S3cR3T_AsSc1_Fl4g}'
Try again! You can do it!
$ ./ascii
Usage: ./script <flag>
```

## Notes

- Aucun anti-debug ; l'obfuscation se limite à un décalage dépendant de la position.
- Le zip stocké comme `.bin` est le seul piège de format.
