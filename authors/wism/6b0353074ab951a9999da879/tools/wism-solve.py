#!/usr/bin/env python3
"""wism's crack me medium — solveur.

Le binaire hache la saisie (transform par octet + mix 64 bits) et compare au
hash du littéral "69GoodBoy69" passé dans le MÊME pipeline : le mot de passe
est donc ce littéral (immédiats `mov BYTE PTR [rsp+0x80+i], …` dans main).

  python3 -I wism-solve.py          # affiche le mot de passe
  python3 -I wism-solve.py -q       # idem, sans fioriture
  python3 -I wism-solve.py --check  # lance l'exe d'origine sous Wine (copie dans /tmp)
"""
import argparse, glob, os, shutil, subprocess, sys, tempfile

PASSWORD = bytes([0x36, 0x39, 0x47, 0x6F, 0x6F, 0x64, 0x42, 0x6F, 0x79, 0x36, 0x39]).decode()
HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "crackmebywism.exe")
DLLS = ["/usr/lib/gcc/x86_64-w64-mingw32/14-posix/libstdc++-6.dll",
        "/usr/lib/gcc/x86_64-w64-mingw32/14-posix/libgcc_s_seh-1.dll",
        "/usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll"]


def run(pw):
    d = tempfile.mkdtemp(prefix="wism-")
    try:
        shutil.copy(EXE, d)  # l'original n'est jamais touché
        for f in DLLS:
            shutil.copy(f, d)
        # Sur "Incorrect" le process plante et WineDbg reste attaché : on borne le temps,
        # on tue le groupe de process et on garde ce qui a été imprimé avant.
        env = dict(os.environ, WINEDEBUG="-all")
        p = subprocess.Popen(["xvfb-run", "-a", "wine", "crackmebywism.exe"], cwd=d, env=env,
                             stdin=subprocess.PIPE, stdout=subprocess.PIPE,
                             stderr=subprocess.DEVNULL, text=True, start_new_session=True)
        try:
            out, _ = p.communicate(pw + "\n", timeout=20)
        except subprocess.TimeoutExpired:
            os.killpg(p.pid, 9)
            out, _ = p.communicate()
            subprocess.run(["wineserver", "-k"], env=env, cwd=d)
        return out.strip()
    finally:
        shutil.rmtree(d, ignore_errors=True)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true", help="preuve live Wine (OK + KO)")
    a = ap.parse_args()
    if a.q:
        print(PASSWORD)
    else:
        print(f"password = {PASSWORD}")
    if a.check:
        ok, ko = run(PASSWORD), run("petik")
        print("OK :", ok)
        print("KO :", ko)
        sys.exit(0 if "complete" in ok and "Incorrect" in ko else 1)


if __name__ == "__main__":
    main()
