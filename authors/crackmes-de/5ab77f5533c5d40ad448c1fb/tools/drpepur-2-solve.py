#!/usr/bin/env python3
"""Keygen keygenme_drpepur_2 (DrPepUr #2) — crackmes.de / crackmes.one 5ab77f5533c5d40ad448c1fb

Serial = A-B-C (séparateur '-')
  A : CRC32(A) == 0x8EF0AEF9 (constante 0x4034f2) — forgé ici en 4 octets imprimables
  B : "%X" du dword des 4 premiers octets du nom d'ordinateur XOR k_cn
  C : "%X" (dword des 4 premiers octets du nom XOR k_name) ^ 0x12345678
Attention : l'extraction de B/C fait `push edx / call lstrlenA / dec edx` puis RtlMoveMemory(dst, edx, len).
Ça ne marche que si lstrlenA laisse edx = ptr+1 (cas de Windows XP) ; sous wine edx est quelconque.

Usage : drpepur-2-solve.py [--computer NOM] [nom]
"""
import argparse, os, random, string, subprocess, zlib

TARGET = 0x8EF0AEF9
POLY = 0xEDB88320
ALNUM = (string.ascii_letters + string.digits).encode()


def crc_tab():
    t = []
    for i in range(256):
        c = i
        for _ in range(8):
            c = (c >> 1) ^ POLY if c & 1 else c >> 1
        t.append(c)
    return t

TAB = crc_tab()
REV = {t >> 24: i for i, t in enumerate(TAB)}  # octet haut -> index (unique)


def forge(prefix: bytes, target: int) -> bytes:
    """4 octets à ajouter à prefix pour que crc32 == target (méthode classique de remontée)."""
    # état interne final voulu (avant xor final)
    want = target ^ 0xFFFFFFFF
    cur = zlib.crc32(prefix) ^ 0xFFFFFFFF
    idx = []
    s = want
    for _ in range(4):
        i = REV[s >> 24]
        idx.append(i)
        s = ((s ^ TAB[i]) << 8) & 0xFFFFFFFF  # bits bas inconnus, recalculés plus bas
    idx.reverse()
    # recalcul avant : octet_j = (état & 0xff) ^ idx_j
    out = []
    s = cur
    for i in idx:
        b = (s ^ i) & 0xFF
        out.append(b)
        s = (s >> 8) ^ TAB[i]
    return bytes(out)


def part_a(seed=0) -> str:
    rnd = random.Random(seed)
    while True:
        pre = bytes(rnd.choice(ALNUM) for _ in range(4))
        tail = forge(pre, TARGET)
        if all(b in ALNUM for b in tail):
            s = pre + tail
            assert zlib.crc32(s) == TARGET
            return s.decode()


def key_cn(cn: bytes) -> int:
    bl = 0
    for c in cn:
        bl = (bl + ((c ^ 0x4C) - 5)) & 0xFF
    return bl


def part_b(cn: bytes) -> str:
    k = key_cn(cn)
    buf = bytearray(cn[:15].ljust(16, b"\0"))
    for i in range(len(cn)):
        buf[i] ^= k
    return "%X" % int.from_bytes(buf[:4], "little")


def part_c(name: bytes, cn: bytes) -> str:
    k = key_cn(cn)
    bl = 0
    for c in name:
        bl = (bl + (c ^ k) + 0x2B) & 0xFF
    buf = bytearray(name.ljust(8, b"\0"))
    for i in range(len(name)):
        buf[i] ^= bl
    return "%X" % (int.from_bytes(buf[:4], "little") ^ 0x12345678)


def serial(name: str, cn: str) -> str:
    n, c = name.encode(), cn.upper().encode()
    return f"{part_a()}-{part_b(c)}-{part_c(n, c)}"


def wine_computername() -> str:
    try:
        r = subprocess.run(["wine", "cmd", "/c", "echo %COMPUTERNAME%"], capture_output=True, text=True, timeout=60)
        return r.stdout.strip().splitlines()[-1]
    except Exception:
        return os.uname().nodename.split(".")[0].upper()[:15]


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--computer", help="nom NetBIOS (GetComputerNameA) ; défaut : wine %%COMPUTERNAME%%")
    a = ap.parse_args()
    assert len(a.name) >= 5, "nom >= 5 caractères"
    cn = a.computer or wine_computername()
    print(f"# computer={cn} name={a.name}")
    print(serial(a.name, cn))
