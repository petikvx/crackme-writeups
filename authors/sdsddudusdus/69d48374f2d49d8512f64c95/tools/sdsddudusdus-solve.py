#!/usr/bin/env python3
"""sdsddudusdus "My First CrackMe" (chip-8.exe / chip-8.dll, .NET 9).

Le serial est une constante comparée avec String.op_Equality : on la relit dans
le heap #US de chip-8.dll (ldstr juste avant l'appel à op_Equality) au lieu de
la coder en dur, puis --check la rejoue contre le binaire via `dotnet`.

  python3 -I tools/sdsddudusdus-solve.py          # affiche le serial
  python3 -I tools/sdsddudusdus-solve.py -q       # serial seul
  python3 -I tools/sdsddudusdus-solve.py --check  # preuve live (dotnet runtime 8+)
"""
import argparse, io, os, shutil, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ORIG = os.path.join(HERE, "..", "original", "download.bin")
PW = b"crackmes.one"
# Prompt/outputs attendus (ldstr du Main)
OK, KO = "Correct!", "Try Again."


def load_dll():
    outer = zipfile.ZipFile(ORIG)               # download.bin = ZIP(mycrackme.zip)
    inner = zipfile.ZipFile(io.BytesIO(outer.read("mycrackme.zip", pwd=PW)))
    return bytearray(inner.read("chip-8.dll"))


def find_serial(d):
    """Main() IL : ... ldloc.0 ; ldstr <tok> ; call op_Equality  (72 tok 28)."""
    us = d.find(b"Enter Serial: ".decode().encode("utf-16-le"))
    # le #US heap est une suite de blobs [len][utf16...][flag]; on les énumère
    start = us - 1
    strs, i = [], start
    while i < len(d) - 2 and len(strs) < 4:
        n = d[i]
        if n < 3 or n & 1 == 0:
            break
        strs.append(bytes(d[i + 1:i + n]).decode("utf-16-le"))
        i += 1 + n
    # ordre du heap : prompt, serial, OK, KO
    assert strs[0] == "Enter Serial: " and strs[2:4] == [OK, KO], strs
    return strs[1]


def check(serial, d):
    dotnet = shutil.which("dotnet") or os.path.expanduser("~/.dotnet/dotnet")
    # La DLL cible net9 : on réécrit la version des AssemblyRef (9->8) dans une
    # COPIE temporaire (original/ intact) si seul un runtime 8 est dispo.
    t = tempfile.mkdtemp()
    for off in (i for i in range(len(d) - 8) if d[i:i + 8] == bytes([9, 0, 0, 0, 0, 0, 0, 0])
                and d[i + 12:i + 14] == b"\x29\x00"):
        d[off] = 8
    open(os.path.join(t, "chip-8.dll"), "wb").write(d)
    open(os.path.join(t, "chip-8.runtimeconfig.json"), "w").write(
        '{"runtimeOptions":{"tfm":"net8.0","framework":'
        '{"name":"Microsoft.NETCore.App","version":"8.0.0"}}}')
    ok = True
    for s, want in ((serial, OK), ("petik", KO), ("Password", KO), ("", KO)):
        out = subprocess.run([dotnet, os.path.join(t, "chip-8.dll")], input=s + "\n\n",
                             capture_output=True, text=True, timeout=60).stdout
        good = want in out
        ok &= good
        print(f"{s!r:12} -> {'Correct' if OK in out else 'Try Again'}  [{'OK' if good else 'FAIL'}]")
    shutil.rmtree(t)
    return ok


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = load_dll()
    s = find_serial(d)
    print(s if a.q else f"Serial : {s}")
    if a.check:
        sys.exit(0 if check(s, d) else 1)
