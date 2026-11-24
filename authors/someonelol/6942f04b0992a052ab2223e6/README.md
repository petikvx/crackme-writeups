# SomeoneLol's [INSANELY HARD] Uncrackable.exe

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) — [crackmes.one](https://crackmes.one/crackme/6942f04b0992a052ab2223e6)
- Auteur : SomeoneLol — PE64 console (MSVC, C++ `iostream`)

| Fichier | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine (SHA-256 `c90b8d36…f0d0e4`) |
| `tools/someonelol-uncrackable-solve.py` | solveur (`-q`, `--check`) |

## Réponse

Pas de username : une clé fixe.

**`I_CRACKED_IT_2025_LOL!`**

```bash
python3 tools/someonelol-uncrackable-solve.py -q
python3 tools/someonelol-uncrackable-solve.py --check original/crackme.exe   # xvfb-run wine
```

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` : MSVC 19.50 / LTCG.
- `strings` ne montre **aucun** message utile : tous les textes sont chiffrés. Le bandeau n'apparaît qu'à l'exécution (`--- CrackMe Challenge 2025 ---`, `Enter License Key: `).
- `IsDebuggerPresent` n'est qu'un import du CRT, pas un anti-debug du crackme.

## Flow

`entry` (0x1400068e8) → CRT → `main` (0x140001d90) : déchiffre 5 chaînes, affiche bandeau + prompt, lit une ligne (`std::getline`), la compare à la clé déchiffrée, affiche `Success!…` ou `Wrong key…`.

## Comment on trouve

1. `objdump -d -M intel` : le `call` vers `main` est en 0x140006873 (`call 0x140001d90`) ; pas de IDA/`decc` disponible sur cette machine, tout est fait à l'objdump.
2. Au début de `main`, des suites de `mov DWORD PTR [rbp-0x39], imm32` construisent des buffers sur la pile, puis une boucle fait `xor r9b, 0x5a` octet par octet (0x140001f88, 0x140002088) :

```asm
140001ef7: mov DWORD PTR [rbp-0x39],0x8190513   ; octets 13 05 19 08 .. ^ 0x5a
140001efe: mov DWORD PTR [rbp-0x35],0x1f11191b
140001f05: mov DWORD PTR [rbp-0x31],0xe13051e
140001f0c: mov DWORD PTR [rbp-0x2d],0x686a6805
140001f13: mov DWORD PTR [rbp-0x29],0x1516056f
140001f1a: mov WORD  PTR [rbp-0x25],0x7b16     ; len = 0x16 = 22
```
3. Décodage : immediates little-endian → octets → `^ 0x5a`. Les 5 buffers donnent : bandeau (30 o.), prompt (19), succès (23 `Success! Youre a Beast!`), échec (22), et le dernier (22 o.) = **`I_CRACKED_IT_2025_LOL!`** (`0x13^0x5a='I'`, `0x05^0x5a='_'`, `0x19^0x5a='C'`, …).
4. Le dernier buffer est celui comparé à la saisie (taille puis contenu, 0x140002285+) ; la confirmation vient de l'exécution réelle.

Piège : le titre « INSANELY HARD » est trompeur, il n'y a ni anti-debug ni transformation de la saisie, juste du XOR monoclé pour cacher les chaînes à `strings`.

## Vérification

```text
$ echo I_CRACKED_IT_2025_LOL! | xvfb-run -a wine original/crackme.exe
--- CrackMe Challenge 2025 ---
Enter License Key: Success! Youre a Beast!

$ echo petik | xvfb-run -a wine original/crackme.exe
Enter License Key: Wrong key. Try harder.
```

## Notes

Pas de GDB ni de debugger live : analyse statique + exécution Wine.
