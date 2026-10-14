#!/usr/bin/env python3
"""Easy Math Keygenme (cyrex) — id 5ab77f5633c5d40ad448c2d5. ELF32 statique, UPX 1.25.

main @0x8048214 (binaire dépaqueté) :
  fgets(name,16) ; fgets(serial,200) ; serial = serial sans ' ' ni '\\n'
  buf[i]  = name[i]*name[i] ^ name[i] ^ 0xc0               (name AVEC son '\\n')
  buf[i] = buf[2]*name[3] ^ buf[i] ^ 0xc0   pour i < strlen(buf)  (buf[2] évolue)
  sprintf(key, "%p-%x-%x-%p", s8(buf[1]), s8(buf[2]), s8(buf[2]), s8(buf[4]))
  strcmp(key, serial) == 0  -> « Registered Successfully »

  easy-math-solve.py [name] [-q] [--check]     (défaut name = petik)
"""
import argparse, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "keygenme.unpacked"


def s32(b):
    return (b - 256 if b > 127 else b) & 0xFFFFFFFF


def fmt_p(v):                       # glibc : %p
    return "(nil)" if v == 0 else "0x%x" % v


def keygen(name):
    s = (name + "\n").encode()[:15]
    if len(s) < 5:
        raise SystemExit("name trop court (>= 4 caractères + '\\n' pour atteindre buf[4])")
    buf = bytearray(((c * c) & 255) ^ c ^ 0xC0 for c in s) + bytearray(8)
    i = 0
    while i < len(buf) and 0 != _strlen(buf) > i:
        buf[i] = (((buf[2] * s[3]) & 255) ^ buf[i] ^ 0xC0) & 255
        i += 1
    return "%s-%x-%x-%s" % (fmt_p(s32(buf[1])), s32(buf[2]), s32(buf[2]), fmt_p(s32(buf[4])))


def _strlen(b):
    return b.index(0) if 0 in b else len(b)


def native(name, serial):
    r = subprocess.run([str(BIN)], input=f"{name}\n{serial}\n", capture_output=True, text=True)
    return "Registered Successfully" in r.stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    ser = keygen(a.name)
    print(ser if a.q else f"name  : {a.name}\nserial: {ser}")
    if a.check:
        ok, ko = native(a.name, ser), native(a.name, ser + "0")
        print("check:", "OK" if ok and not ko else "KO", f"(bon={ok}, altéré={ko})")
        sys.exit(0 if ok and not ko else 1)


if __name__ == "__main__":
    main()
