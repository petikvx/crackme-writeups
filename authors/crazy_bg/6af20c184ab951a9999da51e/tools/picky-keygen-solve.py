#!/usr/bin/env python3
"""Keygen pour crazy_bg's Picky Keygen Me! (Keygen2.exe, dans original/download.bin = ZIP).

Le serial dépend de 3 choses « de la machine » :
  * USER (sinon USERNAME) ;
  * l'heure locale (tm_hour) — le binaire exige hour == 10, donc hour=10 ;
  * 1er fichier de %WINDIR%\\System32 (ordre FindFirst/readdir) dont le nom commence
    par 'C' (0x43) ou 'c' (0x63) ; aucun -> 0x6e.

  python3 tools/picky-keygen-solve.py [-q] [--user petik] [--first {C,c,n}] [--sysdir DIR]
  python3 tools/picky-keygen-solve.py --check analysis/extracted/Keygen2.exe
"""
import argparse, os, re, shutil, subprocess, sys, tempfile, time

M = 0xFFFFFFFF


def s32(x):
    x &= M
    return x - (1 << 32) if x & 0x80000000 else x


def first_c(sysdir):
    """Réplique la boucle directory_iterator de core() : 1er nom en C/c, sinon 'n'."""
    for e in os.scandir(sysdir):
        if e.name[0] in "Cc":
            return e.name[0]
    return "n"


def serial(user, first="c", hour=10):
    edi = {"C": 0x43, "c": 0x63, "n": 0x6E}[first]
    esi = ((hour + 0x539) * edi) & M                 # core()
    for b in user.encode():
        c = b - 256 if b > 127 else b                # movsx
        esi = ((esi + c + 0x539) & M) ^ 0x1A
    eax = s32(esi << 4) - 5                          # calculateSerial()
    eax = s32(eax) >> 2                              # sar 2
    eax = (eax & M) ^ 0xF7AB7037
    eax = (eax + 0x1337) & M
    edx = ((eax << 3) & M) | (s32(eax) >> 29) & M    # shl 3 | sar 29 (signé)
    return s32((eax ^ edx) & M)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--user", default="petik")
    ap.add_argument("--first", choices="Ccn")
    ap.add_argument("--sysdir", help="dossier System32 à scanner")
    ap.add_argument("--hour", type=int, default=10)
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="vérifie via wine (xvfb-run) sur une copie patchée (heure)")
    a = ap.parse_args()
    sysdir = a.sysdir or os.path.join(os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine")),
                                      "drive_c/windows/system32")
    first = a.first or first_c(sysdir)
    if a.check:
        # le contrôle hour==10 est dans main() : sur une COPIE on remplace l'imm. 0x0a par l'heure courante
        a.hour = time.localtime().tm_hour
    s = serial(a.user, first, a.hour)
    print(s if a.q else f"USER={a.user} first={first} hour={a.hour} -> serial = {s}")
    if a.check:
        d = tempfile.mkdtemp()
        exe = os.path.join(d, "k.exe")
        shutil.copy(a.check, exe)
        data = bytearray(open(exe, "rb").read())
        pat = bytes.fromhex("837808" + "0a" + "74")   # cmp DWORD PTR [rax+8],0xa ; je
        i = data.find(pat)
        assert i >= 0 and data.find(pat, i + 1) < 0
        data[i + 3] = a.hour
        open(exe, "wb").write(data)
        env = dict(os.environ, USER=a.user, WINEDEBUG="-all")
        r = subprocess.run(["xvfb-run", "-a", "wine", exe], input=f"{s}\n",
                           capture_output=True, text=True, env=env, timeout=90)
        print(r.stdout)
        shutil.rmtree(d)
        sys.exit(0 if "You WIN" in r.stdout else 1)


if __name__ == "__main__":
    main()
