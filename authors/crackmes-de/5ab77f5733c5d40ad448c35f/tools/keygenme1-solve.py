#!/usr/bin/env python3
"""Keygen l0calh0st KeygenME #1 (DOS 16 bits, Borland C++).

serial = (long)( r + sqrt(r) )   avec   r = (u32)(long)pow(sum(name), 3.0)
Nom : 4..20 caractères.   --check : lance KEYGENME.EXE dans l'émulateur DOS (tools/dosrun.py).
"""
import argparse, math, os, sys
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, '..', 'analysis', 'x', 'KeygenME#1', 'KEYGENME.EXE')

def keygen(name: str) -> int:
    if not 4 <= len(name) <= 20:
        raise SystemExit('nom : 4 à 20 caractères')
    s = sum(name.encode('latin1'))
    r = (s ** 3) & 0xFFFFFFFF            # __ftol : 32 bits bas du fistp, puis fild non signé
    v = (r + int(math.sqrt(r))) & 0xFFFFFFFF
    return v - (1 << 32) if v >= 1 << 31 else v   # cin >> long (signé)

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument('--user', '--name', dest='user', default='petik')
    ap.add_argument('-q', action='store_true')
    ap.add_argument('--check', action='store_true')
    a = ap.parse_args()
    ser = keygen(a.user)
    print(ser) if a.q else print('name=%r serial=%d' % (a.user, ser))
    if a.check:
        sys.path.insert(0, HERE)
        import dosrun
        for label, s in (('OK', ser), ('KO', ser + 1)):
            out, done, code = dosrun.run(EXE, ('%s\n%d\n' % (a.user, s)).encode())
            txt = out.decode('latin1').strip().splitlines()[-1]
            print('%s serial=%d -> %s' % (label, s, txt))
if __name__ == '__main__':
    main()
