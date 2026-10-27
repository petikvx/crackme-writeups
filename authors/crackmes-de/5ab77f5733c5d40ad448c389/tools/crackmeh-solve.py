#!/usr/bin/env python3
"""Crackmeh by JiM (crackmes.de) — keygen name -> serial.

Algo (Button2Click @ 0x45a1b8) :
  s = b64custom("\x01" + name + "\x02\x03")      # alphabet 0-9A-Za-z+/, sans padding
  while len(s) < 16: s = str(len(s) % 10) + s + str(len(s) * 2)
  serial = s[-16:]      # RightStr(s, 16)
Usage : crackmeh-solve.py [name] [-q] [--check SERIAL]
"""
import sys

ALPHA = "0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz+/"


def b64(data: bytes) -> str:
    out, acc, bits = [], 0, 0
    for b in data:
        acc = (acc << 8) | b
        bits += 8
        while bits >= 6:
            bits -= 6
            out.append(ALPHA[acc >> bits])
            acc &= (1 << bits) - 1
    if bits > 0:
        out.append(ALPHA[acc << (6 - bits)])
    return "".join(out)


def keygen(name: str) -> str:
    s = b64(b"\x01" + name.encode("latin1") + b"\x02\x03")
    while len(s) < 16:
        s = str(len(s) % 10) + s + str(len(s) * 2)
    return s[-16:]


def main():
    a = sys.argv[1:]
    quiet = "-q" in a
    a = [x for x in a if x != "-q"]
    if "--check" in a:
        i = a.index("--check")
        serial = a[i + 1]
        name = a[0] if i > 0 else "petik"
        ok = keygen(name) == serial
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    name = a[0] if a else "petik"
    s = keygen(name)
    print(s if quiet else f"name={name} serial={s}")


if __name__ == "__main__":
    main()
