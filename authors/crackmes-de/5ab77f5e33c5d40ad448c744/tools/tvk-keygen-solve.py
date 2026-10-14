#!/usr/bin/env python3
"""keygen_1 / tvk_crackme_2 (tvk6843) — id 5ab77f5e33c5d40ad448c744. ELF32 C++ strippé. Le serial dépend de l'HEURE.

./tvk_crackme_2 <name> <serial> ; serial = 32 caractères = 4 mots de 32 bits en « hex » d'alphabet
  T = "qwE1tym5BvCX70fG"  (T[j] = nibble j ; octet 0 = nibble de poids fort) @0x8048ab3.
Avec m = tm_min, h = tm_hour de localtime(time()) et n[i] les caractères (signés) de name :
  V0 = (Σ (n[i] + 2i) + m + h) ^ 0x0a318751                     [f2 @0x804866c]
  V1 = (Σ n[i] + 17·m + 31·h) << 4                              [f3 @0x80486e7]
  V2 = Σ (n[i] << (i & 7)) + 125·h + m + (h << 7) + m           [f4 @0x8048768]
  V3 = ~((m + h) · Σ n[i]·i)                                    [f1 @0x80487fa]
  serial = enc(V0) enc(V1) enc(V2) enc(V3)    ; `puts` du message de réussite si les 4 sont égaux

  tvk-keygen-solve.py [name] [--at HH:MM] [-q] [--check]       (défaut name = petik, heure = maintenant)
Le serial n'est valable que pendant la minute (et l'heure) utilisées : il faut le saisir dans la minute.
"""
import argparse, os, subprocess, sys, time
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "tvk_crackme_2"
T = "qwE1tym5BvCX70fG"
M = 0xFFFFFFFF


def s8(c):
    return c - 256 if c > 127 else c


def enc(v):
    return "".join(T[(v >> ((7 - k) * 4)) & 0xF] for k in range(8))


def keygen(name: str, h: int, m: int) -> str:
    n = [s8(c) for c in name.encode()]
    v0 = (sum(c + 2 * i for i, c in enumerate(n)) + m + h) & M ^ 0x0A318751
    v1 = ((sum(n) + 17 * m + 31 * h) << 4) & M
    v2 = (sum((c << (i & 7)) for i, c in enumerate(n)) + 125 * h + m + (h << 7) + m) & M
    v3 = ~(((m + h) * sum(c * i for i, c in enumerate(n))) & M) & M
    return enc(v0) + enc(v1) + enc(v2) + enc(v3)


def run(name, serial):
    return subprocess.run([str(BIN), name, serial], capture_output=True, text=True, timeout=5).stdout


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("--at", help="HH:MM (défaut : heure locale courante)")
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.at:
        h, m = map(int, a.at.split(":"))
    else:
        t = time.localtime(); h, m = t.tm_hour, t.tm_min
    k = keygen(a.name, h, m)
    print(k if a.q else f"name  : {a.name}\nheure : {h:02d}:{m:02d}\nserial: {k}   (à saisir dans la minute)")
    if a.check:
        for _ in range(3):                                   # retente si la minute change entre calcul et exécution
            t = time.localtime(); h, m = t.tm_hour, t.tm_min
            k = keygen(a.name, h, m)
            out = run(a.name, k)
            t2 = time.localtime()
            if (t2.tm_hour, t2.tm_min) == (h, m):
                break
        ok = bool(out.strip())
        bad = run(a.name, k[:-1] + "q") == "" if k[-1] != "q" else run(a.name, k[:-1] + "w") == ""
        print("check:", "OK" if ok and bad else "KO", f"({h:02d}:{m:02d} → {out.strip()!r} ; serial altéré → rien={bad})")
        sys.exit(0 if ok and bad else 1)


if __name__ == "__main__":
    main()
