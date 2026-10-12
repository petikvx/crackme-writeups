#!/usr/bin/env python3
"""Keyfile maker pour « Super Funky 0.82 » (bswap, crackmes.de).

Le crackme lit un fichier glissé-déposé dont le nom se termine par « Bswap.2003 »,
en lit 60 octets et vérifie :
  [0:4]="Cool", [5:9]="Dude", [9:17]=octets de code 0x401373 (2d 7c 41 20 0c ea 36 16),
  [17:31] nom (14 car. max, octet 31 forcé à 0), [32:46] ville (octet 46 forcé à 0),
  [47] in {0x0a,0x14,0x1e} (choisit la clé affichée),
  dword[48] : octet 49 bit4=1, octet 51 bit4=0,
  dword[52] : ((d ^ 0x1999) & 0x18af6) | 0x0a == 0x826e (octet bas),
  dword[56] = (somme des 60 octets - 60) ^ 0x313929e9 (auto-référent).
usage : superfunky082-solve.py [NOM] [VILLE] [-o FICHIER] | --check FICHIER
"""
import struct, sys

CODE = bytes.fromhex("2d7c41200cea3616")

def check(buf):
    buf = (buf + bytes(60))[:60]
    b = bytearray(buf); b[0x1f] = 0; b[0x2e] = 0   # fait par le crackme avant les tests suivants
    if b[0:4] != b"Cool" or b[5:9] != b"Dude" or b[9:17] != CODE: return False
    if b[0x2f] not in (0x0a, 0x14, 0x1e): return False
    d = struct.unpack_from("<I", b, 0x30)[0]
    e = ((d & 0x11001100) | 0x101)
    e = struct.unpack(">I", struct.pack("<I", e))[0] | 0x101
    if e != 0x01110101: return False
    d = struct.unpack_from("<I", b, 0x34)[0]
    v = ((d ^ 0x1999) & 0x18af6)
    if (v & ~0xff) | ((v & 0xff) | 0x0a) != 0x826e: return False
    c = struct.unpack_from("<I", b, 0x38)[0]
    s = sum(b) - 60          # le crackme somme le buffer *après* avoir mis les 2 zéros
    return (s ^ c) & 0xffffffff == 0x313929e9

def make(name="petik", city="Paris", sel=0x0a):
    b = bytearray(60)
    b[0:4] = b"Cool"; b[4] = 0x20; b[5:9] = b"Dude"; b[9:17] = CODE
    b[0x11:0x11 + 14] = name.encode()[:14].ljust(14, b" ")
    b[0x20:0x20 + 14] = city.encode()[:14].ljust(14, b" ")
    b[0x2f] = sel
    struct.pack_into("<I", b, 0x30, 0x00001000)          # octet 49 = 0x10
    struct.pack_into("<I", b, 0x34, 0x8264 ^ 0x1999)      # 0x9bfd
    # point fixe : c = 0x3139xxxx (s < 0x10000) ; l'octet 4 (séparateur libre) sert d'ajustement
    for b[4] in range(0x20, 0x100):
        base = sum(b[:0x38])
        for lo in range(0x10000):
            c = 0x31390000 | lo
            s = base + sum(struct.pack("<I", c)) - 60
            if s ^ c == 0x313929e9:
                struct.pack_into("<I", b, 0x38, c); break
        else:
            continue
        break
    else:
        raise SystemExit("pas de checksum")
    assert check(bytes(b))
    return bytes(b)

if __name__ == "__main__":
    a = sys.argv[1:]
    if a[:1] == ["--check"]:
        print("OK" if check(open(a[1], "rb").read()) else "KO"); sys.exit()
    out = "Bswap.2003"
    if "-o" in a:
        i = a.index("-o"); out = a[i + 1]; del a[i:i + 2]
    k = make(*(a[:2] or ["petik", "Paris"]))
    open(out, "wb").write(k)
    print(f"Keyfile {out} ({len(k)} o) :")
    print(k.hex(" "))
