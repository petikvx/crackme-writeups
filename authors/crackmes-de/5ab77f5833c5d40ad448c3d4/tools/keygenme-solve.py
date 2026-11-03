#!/usr/bin/env python3
"""KeygenMe (THE BIKERS80, VB.NET) — keygen name -> 4 champs de serial.

Le serial dépend du nom ET de la variable d'environnement ComputerName.
Usage : keygenme-solve.py [--name petik] [--computer PC] [-q] [--check A B C D]
"""
import argparse, os, socket, sys


def hx(c):  # Conversion.Hex(Asc(c)) : majuscules, sans padding
    return format(ord(c), "X")


def mid(s, start, n):  # Strings.Mid (1-based, tolérant)
    return s[start - 1:start - 1 + n]


def keygen(name, comp):
    if not name or not comp:
        raise ValueError("name et ComputerName doivent être non vides")
    t2 = t5 = t10 = t12 = ""
    rc, rn = comp[::-1], name[::-1]
    for i in range(1, len(comp) + 1):       # boucle externe (ComputerName)
        t2 += hx(comp[i - 1])
        for j in range(1, len(name) + 1):   # boucle interne (name), accumulation
            t5 += hx(name[j - 1])
            t10 += hx(rc[i - 1])
            t12 += hx(rn[j - 1])
    f1 = mid(t2, 1, 5)
    f2 = mid(t5[::-1], 3, 10)
    f3 = mid(t12, 5, 5) + mid(t10, 1, 5)
    f4 = str(len(name) * 68 + 401016)
    return f1, f2, f3, f4


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("--computer", default=os.environ.get("COMPUTERNAME") or socket.gethostname())
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs=4, metavar="F")
    a = ap.parse_args()
    s = keygen(a.name, a.computer)
    if a.check:
        ok = tuple(a.check) == s
        print("OK" if ok else "KO")
        sys.exit(0 if ok else 1)
    if a.q:
        print(" ".join(s))
    else:
        print(f"name={a.name} ComputerName={a.computer}")
        for k, v in enumerate(s, 1):
            print(f"serial{k} = {v}")


if __name__ == "__main__":
    main()
