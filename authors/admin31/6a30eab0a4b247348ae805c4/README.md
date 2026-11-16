# admin31's cantcrack

| | |
|---|---|
| **ID** | [`6a30eab0a4b247348ae805c4`](https://crackmes.one/crackme/6a30eab0a4b247348ae805c4) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | admin31 |
| **Plateforme** | Windows PE64, MSVC (C++), console |
| **SHA-256** (`original/download.bin`, ZIP) | `074722444e7bd823c5b29753cec8759bf18e9e6fe8d642447968e746dc0eff1c` |

| Fichier | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`) contenant `cantcrack.exe` |
| `analysis/cantcrack_extracted/cantcrack.exe` | exe extrait (non patché) |
| `analysis/cantcrack.asm` | `objdump -d -M intel` |
| `tools/cantcrack-solve.py` | solveur + `--check` (Wine) |

## Réponse

Pas de user : mot de passe fixe.

```
nnoae-2026-hps
```

```bash
python3 -I tools/cantcrack-solve.py --check   # password = nnoae-2026-hps ; OK=True KO=True
```

## Premier regard

`download.bin` est un ZIP (`python3 -I -c "import zipfile; zipfile.ZipFile('original/download.bin').extractall('analysis/cantcrack_extracted', pwd=b'crackmes.one')"`).
`strings` : bannière `CrackMe Challenge`, `Enter password:`, `[+] CONGRATULATIONS!`, `[-] Wrong password!`, PDB `...\cantcrack\x64\Release\cantcrack.pdb`. Aucune chaîne du mot de passe en clair.

## Flow

`main` (0x140001760) construit sur la pile 12 octets via trois `mov DWORD`, lit l'entrée dans une `std::string` (`getline`), puis appelle le validateur `0x1400011c0(key, input)` ; `al` ≠ 0 → CONGRATULATIONS, sinon Wrong password.

## Comment on trouve

Ancrage : `objdump -d -M intel analysis/cantcrack_extracted/cantcrack.exe`, `main` à 0x140001760.

Immediates posés en pile (0x140001775…0x14000178c) :

```asm
mov DWORD PTR [rsp+0x20],0x56585959   ; 59 59 58 56
mov DWORD PTR [rsp+0x24],0x73717352   ; 52 73 71 73
mov DWORD PTR [rsp+0x28],0x50534b77   ; 77 4b 53 50
```

Validateur 0x1400011c0 :
- longueur de l'entrée == 0xe (14), `input[5]=='-'` et `input[10]=='-'` ;
- découpe `input[0:5]`, `input[6:10]`, `input[11:14]` ;
- clé r15 (12 octets, little-endian) déchiffrée par tranches et comparée à chaque morceau :
  - `key[0..4] ^ 0x37` (0x1400012e1) ;
  - `key[5..8] ^ 0x41` (0x140001415) ;
  - `key[9..11] ^ 0x23` (0x140001524).

Décodage (octets mémoire : `59 59 58 56 52 | 73 71 73 77 | 4b 53 50`) :

| Tranche | XOR | Résultat |
|---|---|---|
| `59 59 58 56 52` | 0x37 | `nnoae` |
| `73 71 73 77` | 0x41 | `2026` |
| `4b 53 50` | 0x23 | `hps` |

Assemblage : `nnoae` + `-` + `2026` + `-` + `hps` = `nnoae-2026-hps`.

Piège : le 5ᵉ octet de la première tranche (`0x52`) est l'octet bas du 2ᵉ DWORD, d'où le découpage 5+4+3 qui ne suit pas les frontières de DWORD.

## Vérification

Preuve live (Wine, binaire d'origine extrait) :

```bash
echo nnoae-2026-hps | xvfb-run -a wine analysis/cantcrack_extracted/cantcrack.exe
# [+] CONGRATULATIONS! / [+] Password cracked successfully!
echo nnoae-2026-hpx | xvfb-run -a wine analysis/cantcrack_extracted/cantcrack.exe
# [-] Wrong password! / [-] Try harder...
```

Le reverse est 100 % statique (objdump) ; ni GDB ni debugger live utilisés.

## Notes

Pas de dépendance à un username (donc pas d'exemple `petik`). Pas d'anti-debug rencontré.
