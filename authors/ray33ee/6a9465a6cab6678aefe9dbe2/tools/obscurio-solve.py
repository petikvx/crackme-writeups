#!/usr/bin/env python3
"""Keygen obscurio (crackus.exe + program.bin) : user -> password.

Contraintes extraites du bytecode (voir README.md), pour user U et password P :
  len(P) == 2*len(U)
  #minuscules(P) == #minuscules(U) >= 1
  #MAJ(P) - #MAJ(U)                      == 4
  somme des chiffres de U et de P        == 8
  #ponct(33..47)(P) - #voyelles(U)       == 1      (voyelles aeiouAEIOU)
  aucun char 58..64 dans P ;  exactement 2 chars 91..96 dans P
  (sum(U) - sum(P)) % 256                == 0

Usage : obscurio-solve.py [--user U] [-q] [--check [--vm program.bin]] [--wine crackus.exe]
"""
import argparse, subprocess, sys, os

def solve(user):
    u = user.encode()
    n = len(u)
    lo = sum(97 <= c <= 122 for c in u)
    up = sum(65 <= c <= 90 for c in u)
    vow = sum(chr(c) in "aeiouAEIOU" for c in u)
    dig = sum(c - 48 for c in u if 48 <= c <= 57)
    m = 2 * n
    nL, nU, nP, nB = lo, 4 + up, 1 + vow, 2
    D = 8 - dig
    if lo < 1: sys.exit("user invalide : il faut >= 1 minuscule (L8 != 0)")
    if D < 0 or m > 99 or nP < 0: sys.exit("user infaisable")
    for kd in range(0 if D == 0 else 1, m + 1):
        nF = m - nL - nU - nP - nB - kd
        if nF < 0: break
        slots = ([range(97, 123)] * nL + [range(65, 91)] * nU + [range(33, 48)] * nP
                 + [range(91, 97)] * nB + [range(48, 58)] * kd + [range(123, 127)] * nF)
        isd = [False] * (nL + nU + nP + nB) + [True] * kd + [False] * nF
        states = {(0, 0): []}
        for s, d in zip(slots, isd):
            new = {}
            for (r, ds), path in states.items():
                for ch in s:
                    nds = ds + (ch - 48 if d else 0)
                    if nds > D: continue
                    k = ((r + ch) % 256, nds)
                    if k not in new: new[k] = path + [ch]
            states = new
        if (sum(u) % 256, D) in states:
            return bytes(states[(sum(u) % 256, D)]).decode()
    sys.exit("pas de solution pour ce user (trop court ? ajouter des caractères neutres)")

def check_vm(user, pw, vm_path):
    import importlib.util
    here = os.path.dirname(os.path.abspath(__file__))
    sp = importlib.util.spec_from_file_location("vm", os.path.join(here, "obscurio-vm.py"))
    vm = importlib.util.module_from_spec(sp); sp.loader.exec_module(vm)
    out = vm.run(open(vm_path, "rb").read(), (user + "\n" + pw + "\n").encode())[0]
    return out.decode(errors="replace")

def check_wine(user, pw, exe):
    r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=(user + "\n" + pw + "\n").encode(),
                       capture_output=True, timeout=300, cwd=os.path.dirname(os.path.abspath(exe)))
    return r.stdout.decode(errors="replace")

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik~~~")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="rejoue dans l'émulateur Python")
    ap.add_argument("--vm", default="analysis/extract/program.bin")
    ap.add_argument("--wine", help="chemin de crackus.exe (program.bin dans le même dossier)")
    a = ap.parse_args()
    pw = solve(a.user)
    if a.q: print(pw)
    else: print("user=%r password=%r" % (a.user, pw))
    if a.check: print(check_vm(a.user, pw, a.vm))
    if a.wine: print(check_wine(a.user, pw, a.wine))
