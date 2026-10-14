#!/usr/bin/env python3
"""keygen / tvk_crackme_1 (tvk6843) — id 5ab77f5e33c5d40ad448c745. ELF32 C++ strippé, dépend de l'heure.

./tvk_crackme_1 <name> <serial> ; « Your solution is a + b = c » : la bonne réponse est le moment où
l'ARITHMÉTIQUE affichée est JUSTE (échec : c = a + b + 3 ; succès : c = a + b).
  buf   = name + chr(0x41 + (tm_min & 0xf)) + chr(0x42 + (tm_hour & 0xf))          (heure locale)
  H_i   = i·0xef41 + 0x2cdc3 + Σ_k buf[k]·k        pour i = 0, 1, 2      (32 bits)   [@0x80486c5]
  serial = enc(H_0) enc(H_1) enc(H_2)   où enc = 8 « chiffres hexa » de l'alphabet "0123456789AbCdEf"
  (octet de poids fort d'abord)                                          [décodeur @0x8048710]
  succès : « Your solution is {len(name)+1} + {len(serial)+5} = {len(name)+len(serial)+6} »
  (une seconde lecture de l'heure doit rester dans la minute suivante : min+1 >= min')

  tvk1-solve.py [name] [--at HH:MM] [-q] [--check]       (défaut name = petik, heure = maintenant)
"""
import argparse, re, subprocess, sys, time
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "tvk_crackme_1"
T = "0123456789AbCdEf"
M = 0xFFFFFFFF


def enc(v):
    return "".join(T[(v >> ((7 - k) * 4)) & 0xF] for k in range(8))


def keygen(name: str, h: int, m: int) -> str:
    buf = name.encode() + bytes([0x41 + (m & 0xF), 0x42 + (h & 0xF)])
    out = ""
    for i in range(3):
        x = (i * 0xEF41 + 0x2CDC3 + sum(c * k for k, c in enumerate(buf))) & M
        out += enc(x)
    return out


def run(name, serial):
    return subprocess.run([str(BIN), name, serial], capture_output=True, text=True, timeout=5).stdout


def correct(out):
    m = re.search(r"(\d+) \+ (\d+) = (\d+)", out)
    return bool(m) and int(m[1]) + int(m[2]) == int(m[3])


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--at"); ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.at:
        h, m = map(int, a.at.split(":"))
    else:
        t = time.localtime(); h, m = t.tm_hour, t.tm_min
    k = keygen(a.name, h, m)
    print(k if a.q else f"name  : {a.name}\nheure : {h:02d}:{m:02d}\nserial: {k}   (valable dans la minute)")
    if a.check:
        for _ in range(3):
            t = time.localtime(); h, m = t.tm_hour, t.tm_min
            k = keygen(a.name, h, m)
            out = run(a.name, k)
            t2 = time.localtime()
            if (t2.tm_hour, t2.tm_min) == (h, m):
                break
        bad = run(a.name, k[:-1] + ("0" if k[-1] != "0" else "1"))
        ok = correct(out) and not correct(bad)
        print("check:", "OK" if ok else "KO", f"({h:02d}:{m:02d} → {out.strip()!r} ; serial altéré → {bad.strip()!r})")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
