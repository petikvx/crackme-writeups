#!/usr/bin/env python3
"""CRaCKMe v1.75 (BuLLeT / TOL'98, VB5) : mot de passe en clair dans le binaire.

Usage:
  brk175-solve.py [-q] [--check]
  -q       n'affiche que le mot de passe
  --check  preuve live : Wine + Xvfb + xdotool, tape le mot de passe et vérifie
           (écran « CONGRATULATIONS » : la textbox devient BuL_LeT@hotmail.com)
Pas de nom/login dans ce crackme (donc pas de `petik`). Ne touche jamais à original/.
"""
import argparse, os, struct, subprocess, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "tol_b175.zip")
PWD_ZIP = b"crackmes.one"
CMP_PUSH = 0x410150   # push imm32 juste avant call __vbaStrCmp dans Command1_Click


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("BRK175.EXE", pwd=PWD_ZIP)


def va_to_off(pe, va):
    """VA -> offset fichier via la table des sections PE."""
    e = struct.unpack_from("<I", pe, 0x3C)[0]
    nsec = struct.unpack_from("<H", pe, e + 6)[0]
    opt = struct.unpack_from("<H", pe, e + 20)[0]
    base = struct.unpack_from("<I", pe, e + 24 + 28)[0]
    for i in range(nsec):
        s = e + 24 + opt + 40 * i
        vsz, rva, rsz, raw = struct.unpack_from("<IIII", pe, s + 8)
        if rva <= va - base < rva + max(vsz, rsz):
            return raw + (va - base - rva)
    raise ValueError("VA hors sections")


def solve():
    pe = load_exe()
    # on vérifie que le code pousse bien cette VA avant l'appel de comparaison
    assert b"\x68" + struct.pack("<I", CMP_PUSH) in pe, "push 0x410150 introuvable"
    off = va_to_off(pe, CMP_PUSH)
    end = off
    while pe[end:end + 2] != b"\0\0":   # BSTR UTF-16LE terminée par 00 00
        end += 2
    return pe[off:end].decode("utf-16le")


def check(pw):
    script = os.path.join(HERE, "wine-live-test.sh")
    # le script travaille dans analysis/x/ : on y extrait l'exe
    ax = os.path.join(HERE, "..", "analysis", "x")
    os.makedirs(ax, exist_ok=True)
    open(os.path.join(ax, "BRK175.EXE"), "wb").write(load_exe())
    for txt, name in ((pw, "screenshot-ok.png"), ("petik", "screenshot-ko.png")):
        subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 1024x768x24", "bash",
                        script, txt, name],
                       stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, timeout=90)
    print("captures régénérées : analysis/screenshot-ok.png (attendu CONGRATULATIONS)"
          " et screenshot-ko.png (attendu « Nope. That's not the one! »)")


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    pw = solve()
    print(pw if a.q else f"Mot de passe : {pw}")
    if a.check:
        check(pw)
