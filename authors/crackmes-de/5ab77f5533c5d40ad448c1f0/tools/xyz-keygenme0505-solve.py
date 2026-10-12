#!/usr/bin/env python3
"""Keygen XYZ_KeygenMe20110505 (xiayuanzhong, crackmes.de).

main() @ 0x401390 (MinGW / Dev-C++, symboles présents) :
  6 <= len(name) <= 14
  serial = "X3_" + suite ; len(serial) == k avec
    k = Fibonacci_like(len(name))  (F(1..3)=1, F(n)=F(n-1)+F(n-3))
    k *= 2 si 6 <= L <= 8 ; k >>= 1 si 11 <= L <= 14
  pour i in 0..k-4 : c = name[i % L] ; serial[i+3] = c+i si c+i <= 0x7e sinon c-i
usage : xyz-keygenme0505-solve.py [name] [--check]   (--check lance l'exe sous wine)
"""
import os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "XYZ_KeygenMe20110505_Dev.exe")

def F(n):
    if n <= 0: return 0
    if n <= 3: return 1
    return F(n - 1) + F(n - 3)

def keygen(name: str) -> str:
    L = len(name)
    if not 6 <= L <= 14:
        raise SystemExit("le nom doit faire 6 à 14 caractères (petik = 5 est refusé)")
    k = F(L)
    if 6 <= L <= 8: k *= 2
    elif 11 <= L <= 14: k >>= 1
    out = "X3_"
    for i in range(k - 3):
        c = ord(name[i % L])
        out += chr(c + i if c + i <= 0x7e else c - i)
    if any(ord(ch) <= 0x20 for ch in out):
        raise SystemExit("serial avec espace/caractère de contrôle : illisible par cin >>, change de nom")
    return out

def run(name, pw):
    env = dict(os.environ, WINEDEBUG="-all")
    try:
        out = subprocess.run(["wine", EXE], input=f"{name}\n{pw}\n\n", capture_output=True,
                             text=True, env=env, timeout=10).stdout
    except subprocess.TimeoutExpired as e:   # mauvais serial : le programme reboucle sur la saisie
        out = (e.stdout or b"").decode(errors="replace")
    return out

if __name__ == "__main__":
    a = [x for x in sys.argv[1:] if not x.startswith("--")]
    name = a[0] if a else "petik_"
    s = keygen(name)
    print(f"{name} -> {s}")
    if "--check" in sys.argv:
        out = run(name, s)
        print("wine :", out.replace("\r", "").strip().splitlines()[-6:])
