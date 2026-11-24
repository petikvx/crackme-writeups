#!/usr/bin/env python3
"""Keygen casam's Keygen Crackme : code de vérification lié au MachineGuid.

Le crackme n'a pas de login : le code dépend de HKLM\\SOFTWARE\\Microsoft\\Cryptography\\MachineGuid.
  python3 casam-keygen-solve.py                 # lit le MachineGuid (Windows, ou prefix Wine ~/.wine)
  python3 casam-keygen-solve.py --guid d2971356-9611-4a15-a76b-23131d1d92a5
  python3 casam-keygen-solve.py -q              # code seul
  python3 casam-keygen-solve.py --check         # lance l'original sous Wine et vérifie OK
"""
import argparse, os, re, subprocess, sys

EXE = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "CrackMe.exe")


def keygen(guid: str) -> str:
    s = ""
    for c in guid:
        if c == "-":
            continue
        s += str(ord(c.lower()) - 0x60) if c.isalpha() else c   # a..f -> 1..6
    n = int(s) * 4 // 10                                        # x4 puis /10
    return "".join("x" if d == "0" else chr(ord(d) + 0x30) for d in str(n))  # 0->x, 1..9->a..i


def read_guid() -> str:
    try:
        import winreg
        k = winreg.OpenKey(winreg.HKEY_LOCAL_MACHINE, r"SOFTWARE\Microsoft\Cryptography",
                           0, winreg.KEY_READ | winreg.KEY_WOW64_64KEY)
        return winreg.QueryValueEx(k, "MachineGuid")[0]
    except ImportError:
        pfx = os.environ.get("WINEPREFIX", os.path.expanduser("~/.wine"))
        txt = open(os.path.join(pfx, "system.reg"), errors="ignore").read()
        return re.search(r'"MachineGuid"="([^"]+)"', txt).group(1)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--guid")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    guid = a.guid or read_guid()
    code = keygen(guid)
    if a.q:
        print(code)
    else:
        print(f"MachineGuid : {guid}\nCode        : {code}")
    if a.check:
        out = subprocess.run(["xvfb-run", "-a", "wine", EXE], input=code + "\n",
                             capture_output=True, text=True, timeout=60).stdout
        ok = "Invalid" not in out
        print("CHECK:", "OK" if ok else "KO", "|", out.replace("\r", "").strip()[-60:])
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
