#!/usr/bin/env python3
"""lantern01's yuri (owncm.exe) : serial = sha256(name) en hex minuscule.

  python3 -I lantern01-yuri-solve.py            # name = petik
  python3 -I lantern01-yuri-solve.py -q --name foo
  python3 -I lantern01-yuri-solve.py --check    # preuve live sous Wine (copie de l'exe, original/ intact)

--check : le binaire importe libcrypto-3-x64.dll (absente ici) -> on compile tools/libcrypto-shim.c
(SHA256_Init/Update/Final) avec mingw dans un dossier temporaire, avec libstdc++/libgcc/winpthread.
"""
import argparse, glob, hashlib, os, shutil, subprocess, sys, tempfile

HERE = os.path.dirname(os.path.abspath(__file__))
EXE = os.path.join(HERE, "..", "original", "owncm.exe")


def serial(name: str) -> str:
    return hashlib.sha256(name.encode()).hexdigest()


def run(tmp, name, ser):
    env = dict(os.environ, WINEDEBUG="-all")
    r = subprocess.run(["wine", "owncm.exe"], cwd=tmp, input=f"{name}\n{ser}\n".encode(),
                       capture_output=True, timeout=120, env=env)
    return r.stdout.decode(errors="replace")


def check(name):
    tmp = tempfile.mkdtemp(prefix="yuri-")
    shutil.copy(EXE, tmp)
    subprocess.check_call(["x86_64-w64-mingw32-gcc", "-shared", "-O2", "-o",
                           os.path.join(tmp, "libcrypto-3-x64.dll"),
                           os.path.join(HERE, "libcrypto-shim.c")])
    for f in ("/usr/lib/gcc/x86_64-w64-mingw32/*-posix/libstdc++-6.dll",
              "/usr/lib/gcc/x86_64-w64-mingw32/*-posix/libgcc_s_seh-1.dll",
              "/usr/x86_64-w64-mingw32/lib/libwinpthread-1.dll"):
        shutil.copy(sorted(glob.glob(f))[-1], tmp)
    ok = run(tmp, name, serial(name))
    ko = run(tmp, name, "0000")
    print("OK :", ok.replace("\r", "").strip())
    print("KO :", ko.replace("\r", "").strip())
    shutil.rmtree(tmp)
    return "Somehow u cracked it" in ok and "not smart enough" in ko


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--name", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print(serial(a.name))
    else:
        print(f"name   = {a.name}\nserial = {serial(a.name)}")
    if a.check:
        sys.exit(0 if check(a.name) else 1)
