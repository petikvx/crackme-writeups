# Solve Me C++ (2) Upgraded Version (julian55) — notes de recon (non résolu)

## Identité
- `original/crackme_protected.exe` — PE32+ console, x86-64, 8 sections, 1.2 MB
- sha256 `83ffceaf14ae2b60c6cd8b2180b09d728ca5d9087d6e3c964558d23c76a69295`

## Layout
Protecteur à VM (« aps ») :

| section | taille | rôle |
|---|---|---|
| `.fptable` | 0x100 | table de pointeurs de fonctions |
| `.apsvm` | 0x39662 | bytecode VM (~230 KB) |
| `.apsstr` | 0xa1000 | pool de strings chiffrées, marqué CODE+DATA (~660 KB) |

Aucune string lisible hors imports (`strings` ne rend que `EnterCriticalSection`),
donc tout le texte du programme est dans `.apsstr` chiffré.

Même famille de protecteur que `palisade.exe` (coleywoley) : section
`.fptable` de 0x100 + blobs de bytecode séparés.

## Reste à faire
1. `decc` / MCP IDA sur `.text` pour isoler le dispatcher VM.
2. Déchiffrer `.apsstr`, désassembler `.apsvm`, puis inverser le prédicat.
