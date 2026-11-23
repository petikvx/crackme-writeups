#!/usr/bin/env python3
"""Solveur P@ssvv0Rol's B64crk : le mot de passe est la table de 24 dwords en .data (octet bas).

  python3 tools/b64crk-solve.py            # extrait depuis original/B64crk.exe
  python3 tools/b64crk-solve.py -q         # mot de passe seul
  python3 tools/b64crk-solve.py --check    # preuve live (Wine + xvfb) + cas KO

Pas d'utilisateur : le crackme ne lit qu'une ligne sur stdin (rien à dériver de `petik`).
"""
import argparse, os, shutil, struct, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "B64crk.exe")
DLLS = ["libstdc++-6.dll", "libgcc_s_seh-1.dll"]
DLL_DIR = "/usr/lib/gcc/x86_64-w64-mingw32/14-posix"
PTHREAD = "/usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll"
TABLE_VA, TABLE_N = 0x14001A000, 24


def va_to_off(d, va):
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec, = struct.unpack_from("<H", d, pe + 6)
    optsz, = struct.unpack_from("<H", d, pe + 20)
    base, = struct.unpack_from("<Q", d, pe + 48)
    sec = pe + 24 + optsz
    for i in range(nsec):
        vsz, rva, rsz, raw = struct.unpack_from("<IIII", d, sec + 40 * i + 8)
        if base + rva <= va < base + rva + max(vsz, rsz):
            return va - base - rva + raw
    raise ValueError("VA hors sections")


def solve():
    d = open(EXE, "rb").read()
    off = va_to_off(d, TABLE_VA)
    return bytes(x & 0xFF for x in struct.unpack_from("<%dI" % TABLE_N, d, off)).decode()


def run(pw, tmp):
    r = subprocess.run(["xvfb-run", "-a", "wine", "B64crk.exe"], input=pw + "\n", cwd=tmp,
                       capture_output=True, text=True, timeout=60, env=dict(os.environ, WINEDEBUG="-all"))
    return r.stdout


def check(pw):
    with tempfile.TemporaryDirectory() as tmp:
        shutil.copy(EXE, tmp)
        for n in DLLS:
            shutil.copy(os.path.join(DLL_DIR, n), tmp)
        shutil.copy(PTHREAD, tmp)
        ok, ko = run(pw, tmp), run(pw[:-1] + "n", tmp)
    print("OK :", ok.strip().splitlines()[-1]); print("KO :", ko.strip().splitlines()[-1])
    return "Good job" in ok and "Please try again" in ko


if __name__ == "__main__":
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args(); pw = solve()
    print(pw if a.q else "Password : " + pw)
    if a.check:
        sys.exit(0 if check(pw) else 1)
