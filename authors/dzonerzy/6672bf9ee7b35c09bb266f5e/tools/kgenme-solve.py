#!/usr/bin/env python3
"""DZONERZY — KGenMe v2 : keygen (nom -> serial de 29 caractères XXXXX-XXXXX-XXXXX-XXXXX-XXXXX).

Binaire strippé (IDA/Hex-Rays) :
  main @0x1aa0 -> sub_1980(user, serial) :
    sub_14B0(serial)  : validation de FORMAT (voir make_serial) ;
    H(s) = sum(s[i] * 31^i) mod p, p = 1000000007   (sub_11B0, appelée pour user et serial) ;
    sub_18D0 : v6 = (H(user) + H(serial)) mod p ; sub_1240(v6) != 0 ; v6 == sub_1390(sub_12F0(pow(16370, 32771, 49157))).
  sub_1390 est l'inverse de sub_12F0 : la cible vaut donc pow(16370, 32771, 49157) = 2511 (indépendante du nom).
=> H(serial) = (2511 - H(user)) mod p, avec un serial respectant le format.
Résolution : tous les caractères sont tirés au hasard (graine = nom) sauf deux blocs de 3 caractères alphanumériques
(s[6..8] et s[18..20]) énumérés en rencontre au milieu (62^3 x 62^3 >> p).
Usage : kgenme-solve.py [--user petik] [-q] [--check]
"""
import argparse, random, string, subprocess, sys, tempfile, zipfile
from pathlib import Path

P = 1000000007
TARGET = pow(16370, 32771, 49157)          # = 2511
ALNUM = string.ascii_letters + string.digits
ROOT = Path(__file__).resolve().parent.parent


def H(s: str) -> int:
    h, w = 0, 1
    for c in s.encode():
        h = (h + w * c) % P
        w = w * 31 % P
    return h


def make_serial(user: str) -> str:
    rng = random.Random(user)
    s = [""] * 29
    for i in (5, 11, 17, 23):
        s[i] = "-"
    # G1 : exactement un caractère de KJL, quatre chiffres
    g1 = [rng.choice(string.digits) for _ in range(5)]
    g1[rng.randrange(5)] = rng.choice("KJL")
    s[0:5] = g1
    # G2 : s[6..9] libres (alnum), s[10] chiffre pair
    s[6:10] = [rng.choice(ALNUM) for _ in range(4)]
    s[10] = rng.choice("02468")
    # G3 : s[12], s[13] lettres ; s[14], s[15] chiffres ; |s12 - s13| == d14 + d15 ; s[16] libre
    while True:
        a, b = rng.choice(string.ascii_uppercase), rng.choice(string.ascii_uppercase)
        d = abs(ord(a) - ord(b))
        if d <= 18:
            break
    d14 = rng.randint(max(0, d - 9), min(9, d)); d15 = d - d14
    s[12:17] = [a, b, str(d14), str(d15), rng.choice(ALNUM)]
    # G4 : s[18..22] alnum
    s[18:23] = [rng.choice(ALNUM) for _ in range(5)]
    # G5 : au moins un caractère de HBTOP, sinon tous les chiffres impairs (ici : un caractère de HBTOP)
    g5 = [rng.choice(ALNUM) for _ in range(5)]
    g5[rng.randrange(5)] = rng.choice("HBTOP")
    s[24:29] = g5

    want = (TARGET - H(user)) % P
    pw = [pow(31, i, P) for i in range(29)]
    free = {6, 7, 8, 18, 19, 20}
    rest = sum(pw[i] * ord(s[i]) for i in range(29) if i not in free) % P
    need = (want - rest) % P
    table = {}
    for x in ALNUM:
        for y in ALNUM:
            for z in ALNUM:
                v = (pw[18] * ord(x) + pw[19] * ord(y) + pw[20] * ord(z)) % P
                table.setdefault(v, x + y + z)
    for x in ALNUM:
        for y in ALNUM:
            for z in ALNUM:
                v = (pw[6] * ord(x) + pw[7] * ord(y) + pw[8] * ord(z)) % P
                hit = table.get((need - v) % P)
                if hit:
                    s[6:9] = [x, y, z]; s[18:21] = list(hit)
                    out = "".join(s)
                    assert (H(user) + H(out)) % P == TARGET
                    return out
    raise SystemExit("aucune solution (changer la graine)")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    serial = make_serial(a.user)
    if a.q:
        print(serial); return
    print(f"user = {a.user}\nserial = {serial}")
    if a.check:
        with tempfile.TemporaryDirectory() as t:
            exe = Path(t) / "kgenmev2"
            exe.write_bytes((ROOT / "analysis" / "x" / "kgenmev2").read_bytes()); exe.chmod(0o755)
            run = lambda u, s: subprocess.run([str(exe)], input=f"{u}\n{s}\n", capture_output=True, text=True, timeout=10).stdout
            ok = run(a.user, serial)
            bad = run(a.user, serial[:-1] + ("A" if serial[-1] != "A" else "B"))
            dz = make_serial("DZONERZY"); okdz = run("DZONERZY", dz)
        good = lambda o: "[+] Serial is correct" in o
        print("OK:", good(ok), "| KO:", "[-] Serial is incorrect" in bad, "| DZONERZY:", dz, "->", good(okdz))
        sys.exit(0 if good(ok) and not good(bad) and good(okdz) else 1)


main()
