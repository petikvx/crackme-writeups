# easy vm (liboxin) — recon, NON résolu

- `original/vmcrack2.protected.exe` : PE64 MinGW, protecteur « aegis » (autre version que v144 : stub chiffré RC6-like, header AGIS en 0xd900).
- Dump mémoire après démarrage sous Wine : `tools/live-dump.py` → `analysis/live.bin` (pages déchiffrées à la demande).
- `main` (0x140002960) : `fgets`, trim, **64 octets** exigés ; seed = `key_mix(0xc0ffee)` ; programme VM de 48 dwords (24 instr de 8 octets) = `key_mix(seed ^ r8) ^ table@0x140004a60` ; entrée placée en `+0x800` xorée par un 2e mixeur (0x140001710) ; VM en 0x140001480 (22 handlers, table op→handler en 0x140004b20) ; succès si retour = 1 → `Correct!`.
- Bloquant : `key_mix` (0x140001450) et le 2e mixeur sont des fonctions **virtualisées** (5 premiers octets volés) ; constante initiale inconnue. `tools/findc.c` (brute-force 32 bits, filtre trop faible) n'a pas conclu.
