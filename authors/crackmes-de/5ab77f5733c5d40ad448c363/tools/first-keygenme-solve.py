#!/usr/bin/env python3
"""first_keygenme (twistedtux) — id 5ab77f5733c5d40ad448c363. ELF32 strippé, glibc rand().

./keygenme <pseudo> <clef>   avec len(clef) == 6 ; T = 64 caractères @0x804a042.
  clef[i] = T[ f_i(pseudo) ]   (voir README ; main @0x8048450)
    f0 = (len ^ 0x3b) & 0x3f                        @0x80485cd
    f1 = (sum(bytes) ^ 0x4f) & 0x3f                 @0x80485e3
    f2 = (prod(bytes) mod 256 en cascade ^ 0x55)&63 @0x804861a
    f3 : srand(max(bytes) ^ 0x0e) ; rand() & 0x3f   @0x8048650
    f4 = (sum(b*b) mod 256 ^ 0xef) & 0x3f           @0x804868e
    f5 : pseudo[0] appels de rand() à la suite de f3 ; ((r & 0xff) ^ 0xe5) & 0x3f  @0x80486d1

  first-keygenme-solve.py [pseudo] [-q] [--check]    (défaut pseudo = petik)
"""
import argparse, ctypes, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "keygenme"
d = BIN.read_bytes()
T = d[0x1042:0x1042 + 64]                      # vaddr 0x804a042 (.data : offset = vaddr - 0x8049000)
libc = ctypes.CDLL("libc.so.6")


def keygen(name: str) -> str:
    b = name.encode()
    n = len(b)
    idx = [(n ^ 0x3B) & 0x3F, (sum(b) & 0xFF ^ 0x4F) & 0x3F]
    p = 1
    for c in b:
        p = (p * c) & 0xFF
    idx.append((p ^ 0x55) & 0x3F)
    libc.srand(max(b) ^ 0x0E)
    idx.append(libc.rand() & 0x3F)
    s = 0
    for c in b:
        s = (s + c * c) & 0xFF
    idx.append((s ^ 0xEF) & 0x3F)
    r = 0
    for _ in range(b[0]):
        r = libc.rand()
    idx.append(((r & 0xFF) ^ 0xE5) & 0x3F)
    return "".join(chr(T[i]) for i in idx)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    k = keygen(a.name)
    print(k if a.q else f"pseudo: {a.name}\nclef  : {k}")
    if a.check:
        run = lambda key: subprocess.run([str(BIN), a.name, key], capture_output=True, text=True).stdout
        ok, ko = "Bravo" in run(k), "Bravo" not in run(k[:-1] + ("A" if k[-1] != "A" else "B"))
        print("check:", "OK" if ok and ko else "KO", f"(bon={ok}, altéré rejeté={ko})")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
