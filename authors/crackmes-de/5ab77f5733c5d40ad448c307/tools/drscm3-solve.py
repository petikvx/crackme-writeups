#!/usr/bin/env python3
"""drscm3 by drspliff — id 5ab77f5733c5d40ad448c307. ELF32 statique (mini-libc), MT19937.

  1. « User ID: » (1..0xFF)  -> graine du Mersenne Twister ; le programme lit c.enc (4096 o) en
     0x804c0e0, le XOR avec 4096 octets MT puis saute en 0x804c0e0 + off (off dépend de l'ID).
     Seul l'ID 123 (0x7b) redonne du code valide (« License: », int 0x80, …).
  2. « License: » : compare l'entrée au motif « 7sd9gwigE! » jusqu'au '!' -> licence 7sd9gwigE.

Le binaire exécute des données (mprotect(0x804c0e0) non aligné -> EINVAL, comme sur tout noyau
récent avec NX) : on travaille sur une copie dont le PT_LOAD RW est RWX (analysis/crack.rwx).

  drscm3-solve.py [-q] [--check]       # --check re-brute-force l'ID puis valide le tout
"""
import argparse, struct, subprocess, sys, time
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis"
SRC, RWX = A / "crack", A / "crack.rwx"


def make_rwx():
    d = bytearray(SRC.read_bytes())
    phoff, n = struct.unpack_from("<I", d, 0x1C)[0], struct.unpack_from("<H", d, 0x2C)[0]
    for i in range(n):
        o = phoff + 32 * i
        t, fl = struct.unpack_from("<I", d, o)[0], struct.unpack_from("<I", d, o + 24)[0]
        if t == 1 and fl == 6:
            struct.pack_into("<I", d, o + 24, 7)
    RWX.write_bytes(d); RWX.chmod(0o755)


def find_id():
    for i in range(1, 256):
        r = subprocess.run([str(RWX)], input=f"{i}\n".encode(), capture_output=True,
                           cwd=A, timeout=5)
        if r.stdout.startswith(b"Lice"):
            return i


def full(id_, lic):
    p = subprocess.Popen([str(RWX)], stdin=subprocess.PIPE, stdout=subprocess.PIPE, cwd=A)
    p.stdin.write(f"{id_}\n".encode()); p.stdin.flush(); time.sleep(0.4)   # le 1er read() vide le pipe
    p.stdin.write(f"{lic}\n".encode()); p.stdin.flush(); p.stdin.close()
    return p.communicate(timeout=5)[0].decode("latin1")


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    make_rwx()
    id_ = 123 if not a.check else find_id()
    lic = "7sd9gwigE"
    print(f"{id_} {lic}" if a.q else f"User ID : {id_}\nLicense : {lic}")
    if a.check:
        ok = "Thanks!" in full(id_, lic)
        ko = "Oops!" in full(id_, "petik")
        good = ok and ko and id_ == 123
        print("check:", "OK" if good else "KO", f"(id={id_}, bon={ok}, mauvais={ko})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
