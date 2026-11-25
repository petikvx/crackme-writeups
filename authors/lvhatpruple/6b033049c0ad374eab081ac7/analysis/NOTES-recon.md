# Traumatized AI (LvHatpruple) — en attente, NON résolu

- `original/traumatized.exe` : PE64 GUI, 3 sections `.lvha0` (0x7000, ent. 7.77) / `.lvha1` (0xc000, ent. 1.35) / `.lvha2` (0x12000, ent. 7.23), EP `0x25000` dans `.lvha2`. Packer maison, même famille que Neural Net.
- Dump mémoire sous Wine (`tools/live-dump.py`) : chaînes `license.key`, `anti_ai_crackme.key`, `Local\AntiAICrackmeKey`, BCrypt (AES CBC/GCM).
- Reste à faire : dépaqueter le stub, lire le prédicat (clé / fichier de licence).
