# Zydak's LeetObfuscator Crackme

| | |
|---|---|
| **ID** | [`6ab666ec5ef425e62ef7fd50`](https://crackmes.one/crackme/6ab666ec5ef425e62ef7fd50) |
| **Auteur (site)** | Zydak |
| **Auteur (local)** | zydak |
| **SHA-256** | `1aa28374ff51106275fe852bd396f34e47a148fc35a888066126d17a8c303daf` (`original/LeetCrackme`) |

## Status

**Parked** (2026-10-18). Pas de flag. Notes : [`analysis/NOTES.md`](analysis/NOTES.md).

`LeetCrackme` est un watchdog qui `exec` `./CXXD4` (cwd obligatoire) et le ptrace pour les nanomites. Mauvais mot de passe → `Hell no`. L’algo est court d’après l’auteur ; l’obfuscation est [LeetObfuscator](https://github.com/Zydak/LeetObfuscator) (strings chiffrées, MBA, dispatcher, `int3`). Un bug `xor`/`or` fait accepter plusieurs flags par le binaire.

- [x] premier regard + modèle watchdog / anti-debug
- [ ] prédicat / flag
- [ ] solveur
- [ ] write-up
