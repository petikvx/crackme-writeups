#!/usr/bin/env python3
"""crackmes.de crackme05 (attilhaz, VB6 natif) — serial fixe : Ap49-mn41

Le Click du bouton construit la chaîne par 8 __vbaStrCat de constantes d'1
caractère (A,p,4,9,-,m,n,4,1 -> "Ap49-mn41") et la compare au Text1.
Aucun nom d'utilisateur : le serial ne dépend de rien (pas de `petik`).

Usage : crackme05-solve.py [-q] [--check [Crackme05.exe]]
  --check : lance l'exe sous Xvfb+Wine, tape le serial, appuie sur OK et
            vérifie qu'une MsgBox « Great!!! » apparaît (+ cas KO).
"""
import argparse, os, subprocess, time

SERIAL = "".join(["A", "p", "4", "9", "-", "m", "n", "4", "1"])


def run_once(exe, text):
    env = dict(os.environ, DISPLAY=":97", WINEDEBUG="-all")
    xd = lambda *a: subprocess.run(["xdotool", *a], env=env, capture_output=True, text=True).stdout
    xvfb = subprocess.Popen(["Xvfb", ":97", "-screen", "0", "800x600x24"])
    time.sleep(2)
    try:
        wine = subprocess.Popen(["wine", exe], env=env)
        time.sleep(8)
        w = xd("search", "--onlyvisible", "--name", "Crackme05").split()[-1]
        xd("windowfocus", w)
        xd("type", "--delay", "60", text)
        xd("key", "Tab"); time.sleep(0.3); xd("key", "space"); time.sleep(3)
        n = len(xd("search", "--onlyvisible", "--name", ".").split())
        wine.terminate()
        return n > 2          # 3e fenêtre = MsgBox « Great!!! »
    finally:
        subprocess.run(["wineserver", "-k"], env=env)
        xvfb.terminate(); time.sleep(1)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", nargs="?", const="analysis/x/Crackme05.exe")
    a = ap.parse_args()
    print(SERIAL if a.q else f"Serial : {SERIAL}")
    if a.check:
        print("serial correct  ->", "MsgBox OK" if run_once(a.check, SERIAL) else "KO (inattendu)")
        print("petik (mauvais) ->", "MsgBox (inattendu)" if run_once(a.check, "petik") else "pas de MsgBox (attendu)")
