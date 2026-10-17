#!/usr/bin/env python3
"""paypain — Election : compile tools/fake_rand.c en .so et le precharge
(LD_PRELOAD) sur original/election pour forcer Sar a gagner.

main() fait lui-meme un getenv("LD_PRELOAD") et refuse de continuer si la
variable est visible -- le constructeur de fake_rand.c l'efface (unsetenv)
avant que main() ne s'execute : le dynamic linker a deja charge la lib via
LD_PRELOAD au moment ou ce constructeur tourne, donc l'effacer ensuite ne
defait rien du hook, seulement la visibilite de la variable pour le process.

rand() est ensuite redefini pour renvoyer 0,0,98 (les 3 seuls appels de
main(), dans l'ordre Bob/Poe/Sar) -> Sar finit avec 98 votes, 1ere place
sans egalite.

Usage : election-solve.py [-q] [--check]
"""
import argparse
import subprocess
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parent.parent
EXE = ROOT / "original" / "election"
SRC = ROOT / "tools" / "fake_rand.c"
SO = ROOT / "tools" / "fake_rand.so"
LOADER = "/lib64/ld-linux-x86-64.so.2"


def build():
    subprocess.run(["gcc", "-shared", "-fPIC", "-o", str(SO), str(SRC)], check=True)


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true", help="n'affiche que la commande a lancer")
    ap.add_argument("--check", action="store_true", help="compile le shim et rejoue le binaire")
    a = ap.parse_args()
    cmd = f"LD_PRELOAD={SO} {LOADER} {EXE}"
    if a.q:
        print(cmd)
        return 0
    print(f"commande : {cmd}")
    if a.check:
        build()
        env_ok = {"LD_PRELOAD": str(SO)}
        ok = subprocess.run([LOADER, str(EXE)], capture_output=True, text=True, env=env_ok).stdout
        ko = subprocess.run([LOADER, str(EXE)], capture_output=True, text=True).stdout
        good = "Sar -> 1 Place" in ok and "Corruption" not in ok
        print("--- avec shim ---")
        print(ok)
        print("--- sans shim (reference, resultat aleatoire) ---")
        print(ko)
        return 0 if good else 1
    return 0


if __name__ == "__main__":
    sys.exit(main())
