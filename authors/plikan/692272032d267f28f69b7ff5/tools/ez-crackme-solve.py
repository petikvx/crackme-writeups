#!/usr/bin/env python3
"""plikan's Ez Crackme : extrait le mot de passe en dur de l'assembly .NET.

original/download.bin est un ZIP (mdp crackmes.one) contenant
superdupercrackme1377.exe ; le mot de passe est une chaine (#US heap, UTF-16LE)
comparee a Console.ReadLine() par op_Equality.

  python3 tools/ez-crackme-solve.py          # affiche le mot de passe
  python3 tools/ez-crackme-solve.py -q       # mot de passe seul
  python3 tools/ez-crackme-solve.py --check  # le teste contre le binaire (dotnet ou mono)
"""
import argparse, io, os, re, shutil, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
BIN = os.path.join(HERE, "..", "original", "download.bin")
PASSWORD = None


def load_exe():
    with zipfile.ZipFile(BIN) as z:
        return z.read(z.namelist()[0], pwd=b"crackmes.one"), z.namelist()[0]


def extract_password(exe):
    """Parse #US heap, puis lit le ldstr du premier bloc IL de Main."""
    i = exe.find(b"#US\0")
    # stream header: offset(4) size(4) name ; metadata root = 4 octets avant le debut des headers
    root = exe.find(b"BSJB")
    off, size = struct.unpack_from("<II", exe, i - 8)
    heap = exe[root + off: root + off + size]
    strs, p = [], 1
    while p < len(heap):
        n = heap[p]; p += 1          # longueurs < 0x80 suffisent ici
        if n == 0: continue
        strs.append(heap[p:p + n - 1].decode("utf-16le")); p += n
    # Main : ldstr 0x70000001 = 1ere chaine (mdp), puis 3 messages
    return strs[0], strs


def check(pw, exe, name):
    runner = shutil.which("mono") or shutil.which("dotnet") or os.path.expanduser("~/.dotnet/dotnet")
    if not runner or not os.path.exists(runner):
        print("ni mono ni dotnet : --check impossible", file=sys.stderr); return 2
    with tempfile.TemporaryDirectory() as d:
        path = os.path.join(d, name)
        open(path, "wb").write(exe)
        if "dotnet" in os.path.basename(runner):
            ver = sorted(os.listdir(os.path.join(os.path.dirname(runner), "shared/Microsoft.NETCore.App")))[-1] \
                if os.path.isdir(os.path.join(os.path.dirname(runner), "shared/Microsoft.NETCore.App")) else "8.0.0"
            open(os.path.join(d, name[:-4] + ".runtimeconfig.json"), "w").write(
                '{"runtimeOptions":{"tfm":"net8.0","framework":{"name":"Microsoft.NETCore.App","version":"%s"}}}' % ver)
        ok = True
        for cand, want in ((pw, True), ("petik", False)):
            out = subprocess.run([runner, path], input=cand + "\n", capture_output=True, text=True,
                                 encoding="utf-8", cwd=d).stdout
            good = "правильный пароль" in out and "неправильный" not in out
            print(f"{cand!r:28} -> {'OK' if good else 'KO'} (attendu {'OK' if want else 'KO'})")
            ok &= (good == want)
        return 0 if ok else 1


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    exe, name = load_exe()
    pw, _ = extract_password(exe)
    if a.q: print(pw)
    else: print("password =", pw)
    if a.check: sys.exit(check(pw, exe, name))


if __name__ == "__main__":
    main()
