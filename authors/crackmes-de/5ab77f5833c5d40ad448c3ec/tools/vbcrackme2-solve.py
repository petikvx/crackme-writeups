#!/usr/bin/env python3
"""VBCrackme 2 by main (crackmes.de) — solveur / preuve.

Deux étapes :
  1. Unlock  : « password » = ligne de commande (Command$). Les 6 octets chiffrés
               chr(0x36)&chr(0xAF)&chr(0x27)&chr(0x47)&chr(0x9A)&chr(0xCE) sont XORés
               avec Command$ puis écrits (WriteProcessMemory) sur 0x40246f, où doit
               se trouver  66 C7 46 34 FF FF  (mov word [esi+0x34], -1  « Unlocked = True »).
               => Command$ = chiffré XOR plaintext = "Phase1".
  2. Check   : le texte de la zone de saisie doit être  "just some password".

usage:
  vbcrackme2-solve.py [-q]          affiche le couple (argument, serial)
  vbcrackme2-solve.py --check       vérifie les octets / le chiffré dans le binaire d'origine
  vbcrackme2-solve.py --live OUT.png [--arg Phase1]
                                    Wine + xvfb + xdotool : lance `VBCrackme2.exe <arg>`,
                                    Unlock, saisit le serial, Check, capture écran
(pas de champ user dans ce crackme : pas de `petik`)
"""
import argparse, os, struct, subprocess, sys, tempfile, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "VBCrackme2.by.main.zip")
CIPHER = bytes([0x36, 0xAF, 0x27, 0x47, 0x9A, 0xCE])   # Chr$(...) concaténés, sub @0x402590
PLAIN = bytes([0x66, 0xC7, 0x46, 0x34, 0xFF, 0xFF])    # mov word [esi+0x34], 0xFFFF @0x40246f
PATCH_VA = 0x40246F
SERIAL = "just some password"                           # chaîne @0x401e44 (BSTR UTF-16)


def password():
    return bytes(a ^ b for a, b in zip(CIPHER, PLAIN)).decode()


def check():
    exe = zipfile.ZipFile(ZIP).read("VBCrackme2.exe", pwd=b"crackmes.one")
    # .text : VA 0x401000 <-> offset 0x1000
    off = PATCH_VA - 0x400000
    assert exe[off:off + 6] == PLAIN, "octets @0x40246f inattendus"
    # les 6 chr() de la routine Unlock : push imm ; call rtcBstrFromChar-like ord608 ... (0x36,0xaf,0x27,0x47,0x9a,0xce)
    code = exe[0x2590:0x29c0]
    for v in CIPHER:
        pat = bytes([0x6A, v]) if v < 0x80 else b"\x68" + struct.pack("<I", v)   # push imm8 / imm32
        assert pat in code, hex(v)
    s = "just some password".encode("utf-16-le")
    assert s in exe, "serial absent du binaire"
    print("OK  Command$ =", password(), "| serial =", SERIAL)


def live(out, arg):
    import shutil
    R = tempfile.mkdtemp()
    with zipfile.ZipFile(ZIP) as z:
        z.extract("VBCrackme2.exe", R, pwd=b"crackmes.one")
    drive = os.path.join(R, "drive.sh")
    open(drive, "w").write(f"""cd "{R}"; WINEDEBUG=-all wine VBCrackme2.exe {arg} >/dev/null 2>&1 &
sleep 7
xdotool mousemove 383 327 click 1; sleep 2; xdotool key Return; sleep 1
xdotool mousemove 400 300 click 1; xdotool type --delay 80 "{SERIAL}"
xdotool mousemove 439 327 click 1; sleep 2
ffmpeg -loglevel error -y -f x11grab -video_size 800x600 -i $DISPLAY -frames:v 1 "{out}"
""")
    subprocess.run(["xvfb-run", "-a", "-s", "-screen 0 800x600x24", "bash", drive], check=True)
    print("capture :", out)


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    ap.add_argument("--live", metavar="OUT.png")
    ap.add_argument("--arg", default=None)
    a = ap.parse_args()
    if a.check:
        check()
    elif a.live:
        live(os.path.abspath(a.live), a.arg if a.arg is not None else password())
    elif a.q:
        print(password(), SERIAL, sep="\n")
    else:
        print(f"Argument (Command$) : {password()}\nSerial (textbox)    : {SERIAL}")
