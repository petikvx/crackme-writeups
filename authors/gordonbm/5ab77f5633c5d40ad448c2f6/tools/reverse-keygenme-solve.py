#!/usr/bin/env python3
"""Inverse de Encrypter.exe (GordonBM) : clé numérique -> message.

  python3 tools/reverse-keygenme-solve.py 112101116105107            # normal -> petik
  python3 tools/reverse-keygenme-solve.py 127486101602127437126995   # hardcore -> petik
  python3 tools/reverse-keygenme-solve.py -q KEY                      # un seul candidat
  python3 tools/reverse-keygenme-solve.py --check [--exe Encrypter.exe] [--user petik]

Mode normal : concat des codes ASCII décimaux.
Hardcore    : pour chaque char, str(code + ran(L)), L = longueur du message,
              ran(L) = sum_{i pair < 2L} r_i*(i^6)*3^(2L-1-i), r_i in {0,1} aléatoire.
On énumère les 2^k offsets possibles pour chaque L et on segmente la clé (DFS).
"""
import sys, argparse, itertools, subprocess, os

PRINT = range(32, 127)

def offsets(L):
    # même arithmétique en double que le binaire (exact < 2^53)
    ws = []
    for i in range(0, 2 * L, 2):
        w = i ^ 6
        if w:
            ws.append(float(w) * 3.0 ** (2 * L - 1 - i))
    offs = {0.0}
    for r in itertools.product((0, 1), repeat=len(ws)):
        offs.add(sum(x for x, b in zip(ws, r) if b))
    return sorted(offs)

def fmt(v):  # Convert.ToString(double) pour les entiers < 1e15
    return str(int(v))

def decode(key, L):
    offs = offsets(L)
    tab = {}
    for o in offs:
        for c in PRINT:
            tab.setdefault(fmt(c + o), []).append(chr(c))
    lens = sorted({len(s) for s in tab})
    out = []
    def dfs(p, acc):
        if len(acc) == L:
            if p == len(key):
                out.append("".join(acc))
            return
        for n in lens:
            s = key[p:p + n]
            if len(s) == n and s in tab:
                for ch in tab[s]:
                    dfs(p + n, acc + [ch])
    dfs(0, [])
    return out

def solve(key):
    res = []
    for L in range(1, 24):
        if len(offsets(L)) > 1 << 16:
            break
        if len(key) < L * 2:
            continue
        # contrainte : tous les chars partagent le même L ; offset différent par char (r aléatoires)
        for m in decode(key, L):
            if m not in res:
                res.append(m)
    # classement heuristique (la clé hardcore est intrinsèquement ambiguë) :
    # peu de caractères non alphanumériques, peu de ruptures de casse.
    def score(m):
        bad = sum(not c.isalnum() for c in m)
        sw = sum(a.islower() and b.isupper() for a, b in zip(m, m[1:]))
        return (bad, sw)
    return sorted(res, key=score)

def check(exe, user):
    import re
    # harnais .NET : charge l'Encrypter.exe d'origine par réflexion et appelle Engine.pump
    h = os.path.join(os.path.dirname(os.path.abspath(__file__)), "harness")
    for hard in "01":
        r = subprocess.run(["dotnet", "run", "-c", "Release", "--", exe, user, "5", hard],
                           cwd=h, capture_output=True, text=True)
        for k in r.stdout.split():
            sol = solve(k)
            print(("hardcore" if hard == "1" else "normal  "), k, "->", sol[:3], "OK" if user in sol else "KO")
            if user not in sol:
                sys.exit(1)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("key", nargs="?")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--all", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--exe", default=os.path.join(os.path.dirname(__file__), "..", "analysis", "extract", "Encrypter.exe"))
    ap.add_argument("--user", default="petik")
    a = ap.parse_args()
    if a.check:
        check(os.path.abspath(a.exe), a.user)
    else:
        sols = solve(a.key)
        if a.q:
            print(sols[0] if sols else "")
        else:
            print("\n".join(sols if a.all else sols[:8]) or "aucune solution")
            if len(sols) > 8 and not a.all:
                print("... (%d candidats, --all pour tout)" % len(sols))
