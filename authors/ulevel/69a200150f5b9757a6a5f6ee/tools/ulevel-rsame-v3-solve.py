#!/usr/bin/env python3
"""RSAme_v3 (Ulevel) keygen : signature RSA-128 de MD5(name).
n = 0xb4480fc7b2481311435cab0751d0caed, e = 0x10001 ; check : sig^e mod n == int(md5hex(name),16)
n = P*Q (factorisé avec GNU `factor`) pour retrouver d = e^-1 mod phi(n)."""
import argparse, hashlib, subprocess, sys
N = 0xb4480fc7b2481311435cab0751d0caed
E = 0x10001

P, Q = 15090658028802823693, 15879705458532216929   # `factor <n>` (GNU coreutils, ~3 min)
assert P*Q == N

def sign(name):
    m = int(hashlib.md5(name.encode()).hexdigest(), 16)
    if m >= N: sys.exit(f"MD5({name!r}) >= n : aucune signature valide (le binaire ne réduit pas), choisir un autre name")
    fs = [P, Q]
    phi = (P-1)*(Q-1)
    d = pow(E, -1, phi)
    return fs, format(pow(m, d, N), 'x')

if __name__ == '__main__':
    ap = argparse.ArgumentParser()
    ap.add_argument('--name', default='petik1')  # 'petik' : MD5 >= n, impossible
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', metavar='EXE', help='vérifie via wine')
    a = ap.parse_args()
    fs, sig = sign(a.name)
    if a.q: print(sig)
    else: print(f"n = {'*'.join(map(str,fs))}\nname = {a.name}\nsignature = {sig}")
    if a.check:
        r = subprocess.run(['xvfb-run','-a','wine',a.check], input=f"{a.name}\n{sig}\n", capture_output=True, text=True, timeout=60)
        print(r.stdout.strip()); sys.exit(0 if 'VALID' in r.stdout and 'INVALID' not in r.stdout else 1)
