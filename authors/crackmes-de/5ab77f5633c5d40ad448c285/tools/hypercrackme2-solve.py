#!/usr/bin/env python3
"""hypercrackme2 by thehyper (crackmes.de) — solveur.

Le nombre N saisi aux boutons 0..9 est valide ssi exactement 3 nombres b de
[300, 1000] sont à la fois des nombres d'Armstrong (somme des cubes des
chiffres == b) et des diviseurs de N.  Les seuls Armstrong 3 chiffres >= 300
sont 370, 371, 407  ->  N multiple de lcm(370, 371, 407) = 1509970.

  ./hypercrackme2-solve.py            # serial minimal + quelques autres
  ./hypercrackme2-solve.py -q         # serial minimal seul
  ./hypercrackme2-solve.py --check N  # vérifie un N
"""
import math, sys

def armstrong3(b: int) -> bool:          # sub_401365
    s, x = 0, b
    while x:
        x, r = divmod(x, 10)
        s += r * r * r
    return s == b

def check(n: int) -> bool:               # bouton 0x6F (« Check »)
    n &= 0xFFFFFFFF                      # atoi maison 32 bits (sub_401430)
    if n == 0:                           # cmp eax,0 / jbe -> échec
        return False
    if n >= 0x80000000:                  # idiv signé : N vu comme négatif
        n -= 1 << 32
    cnt = sum(1 for b in range(300, 1001) if int(math.fmod(n, b)) == 0 and armstrong3(b))
    return cnt == 3

def main(argv):
    if len(argv) > 2 and argv[1] == "--check":
        ok = check(int(argv[2])); print("OK" if ok else "KO"); return 0 if ok else 1
    arm = [b for b in range(300, 1001) if armstrong3(b)]
    base = math.lcm(*arm)
    if "-q" in argv:
        print(base); return 0
    print("Armstrong dans [300,1000] :", arm)
    print("serial minimal :", base)
    print("autres :", [base * k for k in range(2, 6)])
    print("(cliquer les chiffres puis le bouton de vérification ; le menu « Register » apparaît -> « Good job »)")
    return 0

if __name__ == "__main__":
    sys.exit(main(sys.argv))
