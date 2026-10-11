#!/usr/bin/env python3
"""upxed by BlueOwl : reconstruit le mot de passe de mission.
Le code d'origine (OEP 0x401000) fait `sub dword [0x401040+4k], imm` sur une zone à zéro,
donc pw = -imm mod 2^32 pour chaque dword."""
import struct
IMMS = [0xBEBAADBC, 0xB8B1B6B3, 0xB0BDBEA1, 0xAFA0ABAB, 0xB6B4BCBF, 0xFFFFB8B2]
pw = b"".join(struct.pack("<I", (-x) & 0xFFFFFFFF) for x in IMMS).rstrip(b"\0")
print(pw.decode())
