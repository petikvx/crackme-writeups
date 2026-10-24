#!/usr/bin/env python3
"""crackmes.de crackme13 (attilhaz, VB6 natif) — keyfile.dat de 25 octets

Le crackme ouvre `keyfile.dat` (cwd), calcule LOF(1) et le compare à
  pow(2,2)+21+98-90+10-16 - pow(456,0) - 1 = 25.
Le contenu n'est jamais testé : seule la TAILLE compte (25 octets).
Aucun nom d'utilisateur -> `petik` sert de contenu d'exemple (rembourré à 25 o).

Usage : crackme13-solve.py [-o keyfile.dat] [-q] [--check [Crackme13.exe]]
  --check : copie l'exe dans un dossier temporaire avec le keyfile, lance sous
            Xvfb+Wine, ferme la 1re MsgBox et vérifie le titre de la 2e
            (« Good » / « Bad »), + cas KO (24 o, absent).
"""
import argparse, math, os, shutil, subprocess, tempfile, time

SIZE = int(math.pow(2, 2) + 21 + 98 - 90 + 10 - 16 - math.pow(456, 0) - 1)  # 25


def keyfile(user="petik"):
    return (user.encode() + b"-" * SIZE)[:SIZE]


def run_once(exe, data):
    d = tempfile.mkdtemp(prefix="c13-")
    shutil.copy(exe, d)
    if data is not None:
        open(os.path.join(d, "keyfile.dat"), "wb").write(data)
    env = dict(os.environ, DISPLAY=":97", WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"])
    time.sleep(2)
    try:
        wine = subprocess.Popen(["wine", os.path.join(d, os.path.basename(exe))], env=env, cwd=d)
        for _ in range(60):                       # 1re MsgBox « Crackme13 »
            time.sleep(0.5)
            if xd("search", "--name", "^Crackme13$").split():
                break
        time.sleep(1)
        xd("key", "Return")                       # OK -> lecture du keyfile
        res = None
        for _ in range(30):
            time.sleep(0.5)
            for t in ("^Good$", "^Bad$"):
                if xd("search", "--name", t).split():
                    res = t.strip("^$")
            if res:
                break
        wine.terminate()
        return res
    finally:
        subprocess.run(["wineserver", "-k"], env=env)
        xvfb.terminate(); time.sleep(1); shutil.rmtree(d, ignore_errors=True)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("-o", metavar="FILE", help="écrit le keyfile")
    ap.add_argument("--user", default="petik")
    ap.add_argument("--check", nargs="?", const="analysis/x/Crackme13.exe")
    a = ap.parse_args()
    k = keyfile(a.user)
    if a.o:
        open(a.o, "wb").write(k)
    print(k.decode() if a.q else f"keyfile.dat = {len(k)} octets : {k!r}")
    if a.check:
        print("25 o     ->", run_once(a.check, k))
        print("24 o     ->", run_once(a.check, k[:-1]))
        print("absent   ->", run_once(a.check, None))
