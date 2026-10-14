#!/usr/bin/env python3
"""jandepora / crackme #4 (esn_min) — id 5ab77f5b33c5d40ad448c5c2. Source C fournie (crackme4.c).

Le « réseau de pipes » à 8 processus est un AUTOMATE FINI sur {a,b,c} (état = processus qui lit le
jeton ; départ = processus 0 ; chaque caractère choisit le descripteur d'écriture donc le processus
suivant). Table extraite par exploration dynamique d'une copie instrumentée (analysis/dfa/explore.py) :

        a  b  c
    0:  0  0  1        7 = état « piège » (le processus 7 émet SIGUSR2 -> Wrong)
    1:  2  4  7        tout autre état au rang 43 émet SIGUSR1 -> Registered
    2:  1  3  7
    3:  4  2  5
    4:  3  1  7
    5:  6  6  1
    6:  5  5  7
    7:  7  7  7

Contraintes du programme :  len(serial) = 43 ; #b = n % 17 + 1 ; #c = n % 16 + 1 ; #a = 43 - #b - #c
avec  n = hachage du nom : pour i de la fin vers le début, n = (n + name[i]) * 37  (unsigned 32 bits).

  jandepora-solve.py [name] [-q] [--check]      (défaut name = petik)
"""
import argparse, os, signal, subprocess, sys, time
from functools import lru_cache
from pathlib import Path

HERE = Path(__file__).resolve().parent
DELTA = {0: "001", 1: "247", 2: "137", 3: "425", 4: "317", 5: "661", 6: "557", 7: "777"}
N = 43


def counts(name: str):
    n = 0
    for c in reversed(name.encode()):
        c = c - 256 if c > 127 else c
        n = ((n + c) * 37) & 0xFFFFFFFF
    b, c = n % 17 + 1, n % 16 + 1
    return N - b - c, b, c


def keygen(name: str) -> str:
    na, nb, nc = counts(name)

    @lru_cache(maxsize=None)
    def go(state, a, b, c):
        if a < 0 or b < 0 or c < 0:
            return None
        if a == b == c == 0:
            return "" if state != 7 else None
        for ch, k in (("a", 0), ("b", 1), ("c", 2)):
            nxt = int(DELTA[state][k])
            if nxt == 7:                           # 7 est absorbant et rejetant : jamais
                continue
            r = go(nxt, a - (ch == "a"), b - (ch == "b"), c - (ch == "c"))
            if r is not None:
                return ch + r
        return None
    s = go(0, na, nb, nc)
    if s is None:
        raise SystemExit("aucune solution pour ce nom")
    return s


def real_run(name, serial):
    exe = HERE.parent / "analysis" / "dfa" / "crackme4"
    p = subprocess.Popen([str(exe)], stdin=subprocess.PIPE, stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
                         start_new_session=True)
    p.stdin.write(f"{name}\n{serial}\n".encode()); p.stdin.flush()
    out = b""
    t0 = time.time()
    while time.time() - t0 < 5 and p.poll() is None:
        time.sleep(0.05)
    try:
        out = p.stdout.read1(4096) if p.poll() is not None else b""
    finally:
        try:
            os.killpg(p.pid, signal.SIGKILL)
        except ProcessLookupError:
            pass
    return out.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="exécute le crackme4.c d'origine compilé (analysis/dfa/crackme4)")
    a = ap.parse_args()
    k = keygen(a.name)
    ca = counts(a.name)
    print(k if a.q else f"name  : {a.name}\ncounts: a={ca[0]} b={ca[1]} c={ca[2]}\nserial: {k}")
    if a.check:
        ok = "Registered" in real_run(a.name, k)
        bad = "Wrong" in real_run(a.name, k[:-1] + ("a" if k[-1] != "a" else "b"))
        print("check:", "OK" if ok and bad else "KO", f"(Registered={ok}, serial altéré→Wrong={bad})")
        sys.exit(0 if ok and bad else 1)


if __name__ == "__main__":
    main()
