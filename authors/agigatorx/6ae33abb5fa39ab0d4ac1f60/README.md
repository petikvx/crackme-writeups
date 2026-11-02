# agigatorx's Simple Easy CrackMe (level1)

| | |
|---|---|
| **ID** | [`6ae33abb5fa39ab0d4ac1f60`](https://crackmes.one/crackme/6ae33abb5fa39ab0d4ac1f60) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | agigatorx |
| **Plateforme** | Windows PE64 console, C++ MSVC 19.50 (Release, dynamique) |
| **SHA-256** | `e8e0f5776e91ebab56b4ab06354cc6b6c380a314f53d42569fac79d40c3fa39f` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/level1.exe` | binaire d'origine |
| `analysis/level1.objdump.asm` | `objdump -d -M intel` |
| `tools/level1-solve.py` | solveur (`-q`, `--check` via Wine) |

## Réponse

**`AGIGATOR`** — `python3 tools/level1-solve.py --check` → `[+] Correct!`

## Premier regard

`file` : PE32+ console x86-64 ; `diec` : MSVC 19.50 / C++ runtime dynamique. `strings` : `Enter pass:`, `[+] Correct!`, `[-] Close! but not there.`, `[!] Wrong pass!`, `pause`. Aucun mot de passe en clair : il n'est pas stocké comme chaîne.

## Flow

`main` (`0x1400012a0`) affiche la bannière, lit une `std::string` avec `cin`, puis :

- longueur ≠ 8 → `Wrong pass!`
- un octet ≠ attendu → `Close! but not there.`
- 8 octets OK → `Correct!`

## Comment on trouve

**Ancrage** : MCP `ida`, xrefs sur les chaînes `Enter pass:` / `Correct!` / `Close!` → toutes dans `main` (`0x1400012a0`, refs en `0x14000132f`, `0x1400013e0`, `0x1400013e9`). Pseudo Hex-Rays de `main` :

```c
if (len == 8) {                    // std::string size == 8
  for (i = 0; i < 8; i++) {
    switch (i) {                   // le « mot de passe » est un switch, pas une chaîne
      case 0: case 4: c = 'A'; break;   // 65
      case 1: case 3: c = 'G'; break;   // 71
      case 2:         c = 'I'; break;   // 73
      case 5:         c = 'T'; break;   // 84
      case 6:         c = 'O'; break;   // 79
      case 7:         c = 'R'; break;   // 82
    }
    if (buf[i] != c) goto close;   // "Close! but not there."
  }
  puts("Correct!");
}
```

**Assemblage** : indices 0..7 → `A G I G A T O R` = `AGIGATOR` (le pseudo de l'auteur).

**Piège** : le compilateur transforme la comparaison caractère par caractère en `switch` (jump table), donc `strings` ne montre rien ; le tampon SSO (`> 0xF` → pointeur heap) est sans importance ici (8 < 16).

## Vérification (Wine)

```text
AGIGATOR  -> [+] Correct!
AGIGATOX  -> [-] Close! but not there.
short     -> [!] Wrong pass!
```

## Notes

Reverse statique (MCP `ida`) + preuve Wine ; pas de GDB ni debugger live. Base IDA fermée sans sauvegarde (aucun `.i64` conservé).
