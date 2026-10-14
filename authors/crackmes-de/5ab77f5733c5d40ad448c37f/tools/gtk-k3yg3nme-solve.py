#!/usr/bin/env python3
"""GTK_K3YG3NME (gtksor) — id 5ab77f5733c5d40ad448c37f. ELF32 GTK2, anti-debug rdtsc + junk bytes.

serial = Σ_i  (signed char)name[i] ** (i + 2)   (mod 2**64), écrit en décimal
(name >= 3 caractères ; serial non vide, lu par strtoull base 10).
Fonction de hachage @0x8048f50 ; comparée à la saisie dans le handler @0x8049200.

  gtk-k3yg3nme-solve.py [name] [-q] [--check]     (défaut name = petik)
  --check : compare à l'émulation unicorn de la vraie fonction 0x8048f50
"""
import argparse, importlib.util, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent


def serial(name: str) -> int:
    t = 0
    for i, c in enumerate(name.encode()):
        s = c - 256 if c > 127 else c
        t = (t + pow(s, i + 2, 1 << 64)) & ((1 << 64) - 1)
    return t


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if len(a.name) < 3:
        sys.exit("name doit faire >= 3 caractères")
    s = serial(a.name)
    print(s if a.q else f"name  : {a.name}\nserial: {s}")
    if a.check:
        spec = importlib.util.spec_from_file_location("emu", HERE / "gtk-k3yg3nme-emu.py")
        emu = importlib.util.module_from_spec(spec); spec.loader.exec_module(emu)
        names = [a.name, "abc", "Zorro_2015", "héllo"]
        ok = all(emu.h(n.encode()) == serial(n) for n in names)
        print("check:", "OK" if ok else "KO", f"(formule == émulation de 0x8048f50 sur {names})")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
