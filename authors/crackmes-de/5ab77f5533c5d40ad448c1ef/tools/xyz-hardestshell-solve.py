#!/usr/bin/env python3
"""Keygen crackmehardestshell20110404 (xiayuanzhong, crackmes.de).

main() @ 0x401390 (MinGW / Dev-C++, symboles présents) :
  len(password) == len(name) + 4
  password[L-1-i] == name[i]  pour i < L   (nom renversé)
  password[L..L+3] == "_xyz"
usage : xyz-hardestshell-solve.py [name] [--check]   (--check lance l'exe sous wine)
"""
import os, subprocess, sys

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "CrackMe20110403.exe")

def keygen(name: str) -> str:
    return name[::-1] + "_xyz"

def run(name, pw):
    env = dict(os.environ, WINEDEBUG="-all")
    try:
        out = subprocess.run(["wine", EXE], input=f"{name}\n{pw}\n\n", capture_output=True,
                             text=True, env=env, timeout=10).stdout
    except subprocess.TimeoutExpired as e:   # mauvais mot de passe : le programme reboucle sur la saisie
        out = (e.stdout or b"").decode(errors="replace")
    return "Good (WEEL-DONE!)" if "WEEL-DONE" in out else "Bad (re-demande Name/Password)"

if __name__ == "__main__":
    a = [x for x in sys.argv[1:] if not x.startswith("--")]
    name = a[0] if a else "petik"
    pw = keygen(name)
    print(f"{name} -> {pw}")
    if "--check" in sys.argv:
        print("wine :", run(name, pw))
        print("wine (faux", pw[:-1] + "y", ") :", run(name, pw[:-1] + "y"))
