#!/usr/bin/env python3
"""zitadokm's Get Flag — décode le flag (XOR 4 octets, clé = int32 LE rotatif).

Usage : zitadokm-solve.py [-q] [--check <Crackme.exe>]
(pas d'utilisateur : le crackme n'a pas de saisie ; exemple petik non applicable)
"""
import argparse, re, sys

FLAG = [219,40,164,77,154,112,254,17,194,45,165,69,201,35,170,66,196,40,164,16,
        152,120,252,92,145,121,175,90,195,37,170,67,201,58,247,25,154,120,253,90,
        201,45,175,90,204,40,189,77,145,121,167,27]
KEY = 701385128

def dec(b, k):  # luluGMoeF : b[i] ^ (k >> (i%4*8))
    return bytes(x ^ ((k >> (i % 4 * 8)) & 0xFF) for i, x in enumerate(b)).decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", metavar="EXE", help="vérifie que les octets chiffrés sont bien dans l'exe")
    a = ap.parse_args()
    flag = dec(bytes(FLAG), KEY)
    if a.check:
        # preuve live : lance l'exe sous Wine (xvfb) et cherche le flag (UTF-16LE) dans la mémoire du process
        import subprocess, time, os, signal
        pr = subprocess.Popen(["xvfb-run", "-a", "wine", a.check], stdout=subprocess.DEVNULL,
                              stderr=subprocess.DEVNULL, start_new_session=True)
        time.sleep(15)
        needle = flag.encode("utf-16le")
        found = False
        for pid in subprocess.run(["pgrep", "-x", os.path.basename(a.check)[:15]], capture_output=True, text=True).stdout.split():
            try:
                for l in open(f"/proc/{pid}/maps"):
                    m = re.match(r"([0-9a-f]+)-([0-9a-f]+) r", l)
                    if not m: continue
                    lo, hi = int(m[1], 16), int(m[2], 16)
                    if hi - lo > 1 << 28: continue
                    try:
                        with open(f"/proc/{pid}/mem", "rb") as f:
                            f.seek(lo); d = f.read(hi - lo)
                    except Exception: continue
                    if needle in d: found = True; break
            except FileNotFoundError: pass
            if found: break
        os.killpg(pr.pid, signal.SIGKILL)
        subprocess.run(["pkill", "-x", os.path.basename(a.check)[:15]])
        if not found: sys.exit("flag absent de la mémoire du process")
        print("OK : flag trouvé en mémoire du process live", file=sys.stderr)
    print(flag if a.q else f"flag = {flag}")

main()
