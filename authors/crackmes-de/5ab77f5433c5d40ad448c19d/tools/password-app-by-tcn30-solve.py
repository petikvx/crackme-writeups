#!/usr/bin/env python3
"""password_app by tcn30 (crackmes.de) — déchiffre le mot de passe stocké.
Routine 0x45601C : clé 16 bits = 12345 (0x3039) ;
clair = c ^ (clé >> 8) ; clé = (c + clé) * 0xCE6D + 0x58BF  (mod 2^16)
appliquée aux 12 octets de la table .data @ 0x459720."""
import zipfile, pathlib
here = pathlib.Path(__file__).resolve().parent.parent
z = zipfile.ZipFile(next((here / "original").glob("*.zip"))); z.setpassword(b"crackmes.one")
d = z.read("PasswordApp.exe")
off = 0x459720 - 0x458000 + 0x56000          # .data : VA 0x458000 <-> file 0x56000
c = d[off:off + 12]; k = 0x3039; out = bytearray()
for b in c:
    out.append(b ^ (k >> 8)); k = ((b + k) * 0xCE6D + 0x58BF) & 0xFFFF
print("chiffré :", c.hex()); print("password:", out.decode())
