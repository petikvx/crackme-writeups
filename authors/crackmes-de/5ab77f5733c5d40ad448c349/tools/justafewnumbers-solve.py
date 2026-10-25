#!/usr/bin/env python3
"""Solveur JustAFewNumbers (obnoxious) : 11 arguments en ligne de commande.
Usage : justafewnumbers-solve.py [-q] [--all] [--check EXE]
(pas de user/serial : le crackme prend 11 nombres en argv)."""
import argparse, itertools, math, subprocess, sys

def chk(a):
    """Transcription fidèle de Check.chk (a = 11 entiers déjà validés len==2)."""
    A, B = a[:6], a[6:]
    g = math.gcd
    if any(A[i] > A[i+1] for i in (0, 2, 4)): return False
    if A[0]*A[1] != 240 or A[0]*A[1]//g(A[0], A[1]) != 60: return False
    if A[2]*A[3] != 140 or g(A[2], A[3]) != 2: return False
    if g(A[4], A[5]) != 35 or A[4]*A[5]//g(A[4], A[5]) != 35: return False
    if sum(1 for x in B for y in A if x == y) != 6: return False
    return all(g(B[i], B[i+1]) < g(B[i+1], B[i+2]) for i in range(3))

def solutions():
    two = range(10, 100)
    pairs = [(x, y) for x in two for y in two if x <= y]
    # contraintes séparées -> petits ensembles
    P1 = [p for p in pairs if p[0]*p[1] == 240 and math.gcd(*p) == 4]
    P2 = [p for p in pairs if p[0]*p[1] == 140 and math.gcd(*p) == 2]
    P3 = [p for p in pairs if math.gcd(*p) == 35 and p[0]*p[1]//35 == 35]
    for p1, p2, p3 in itertools.product(P1, P2, P3):
        A = list(p1 + p2 + p3)
        for B in itertools.product(sorted(set(A)), repeat=5):
            v = A + list(B)
            if chk(v): yield v

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true"); ap.add_argument("--all", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="lance wine sur l'exe avec la solution")
    o = ap.parse_args()
    sols = list(solutions())
    s = " ".join(map(str, sols[0]))
    if o.all: print(len(sols), "solutions")
    print(s if o.q else f"Arguments : {s}")
    if o.check:
        # Preuve live : copie temporaire de l'exe exécutée par le runtime dotnet
        # (wine-mono plante ici en stack overflow). fail() ne quitte pas : valide
        # = "Success" ET aucun "Invalid".
        import os, shutil, tempfile
        d = tempfile.mkdtemp()
        shutil.copy(o.check, d)
        exe = os.path.join(d, os.path.basename(o.check))
        open(exe[:-4] + ".runtimeconfig.json", "w").write(
            '{"runtimeOptions":{"tfm":"net8.0","framework":{"name":"Microsoft.NETCore.App","version":"8.0.0"}}}')
        dn = shutil.which("dotnet") or os.path.expanduser("~/.dotnet/dotnet")
        r = subprocess.run([dn, exe, *s.split()], input=b"\n", capture_output=True, timeout=120, cwd=d)
        out = r.stdout.decode(errors="replace")
        ok = "Success" in out and "Invalid" not in out
        print("OK (Success, sans Invalid)" if ok else "KO", file=sys.stderr); sys.exit(not ok)
