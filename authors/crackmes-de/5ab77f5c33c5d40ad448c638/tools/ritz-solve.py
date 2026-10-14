#!/usr/bin/env python3
"""Ritz CrackMe for Linux #1 — id 5ab77f5c33c5d40ad448c638. ELF32 NASM (sans patch).

Boucle : printf("Serial: ") ; scanf("%s", s) ; puis (adresses .bss) :
    A=dw(s,0) B=dw(s,5) C=dw(s,10) D=dw(s,15)
    Dv = ror(B,cl) ^ ror(D,cl) puis rol(.,cl) = B ^ D                  (les rotations s'annulent)
    f  = 20 octets lus dans le fichier « keykey » (répertoire courant)
    rem = signed(f[0:4]) mod Dv  (idiv ; Dv != 0 !)
    pour chaque dword : f_i ^= rem ; puis memcmp(f, K, 20) avec
    K = 34 9d dc 31 d9 dc ae 67 6d fb ec 9a 7f 8f fb 53 c6 85 e1 82 -> « Serial esatto, complimenti! »
=> f = K ^ rem (par dword) avec rem = f0 mod Dv : le plus simple rem = 0, f = K, Dv | K0 (Dv = 1 :  B ^ D = 1).

  ritz-solve.py [-o dossier] [-q] [--check]    : écrit « keykey » et affiche le serial
NB : le message de succès est suivi d'un exit brut (sys_exit) (int 0x80) : stdout tamponné perdu en pipe,
     d'où le pseudo-terminal du --check.
"""
import argparse, os, pty, select, sys, tempfile, time
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "ritzcrkme1"
K = bytes.fromhex("349ddc31d9dcae676dfbec9a7f8ffb53c685e182")
SERIAL = "petikAAAA123456@AAA"      # B = 'AAAA', D = '@AAA' -> B ^ D = 1 (jamais 0)


def run_pty(cwd, serial):
    pid, fd = pty.fork()
    if pid == 0:
        os.chdir(cwd)
        os.execv(str(BIN), [str(BIN)])
    out = b""
    time.sleep(0.2)
    os.write(fd, (serial + "\n").encode())
    t0 = time.time()
    while time.time() - t0 < 2:
        r, _, _ = select.select([fd], [], [], 0.2)
        if r:
            try:
                c = os.read(fd, 4096)
            except OSError:
                break
            if not c:
                break
            out += c
            if b"complimenti" in out:
                break
    try:
        os.kill(pid, 9)
    except ProcessLookupError:
        pass
    os.waitpid(pid, 0)
    return out.decode(errors="replace")


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-o", "--out", default=".")
    ap.add_argument("-q", action="store_true"); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    (Path(a.out) / "keykey").write_bytes(K)
    print(SERIAL if a.q else f"1) fichier keykey ({len(K)} octets) écrit dans {a.out}/\n2) serial : {SERIAL}   (B^D = 1)")
    if a.check:
        with tempfile.TemporaryDirectory() as td:
            Path(td, "keykey").write_bytes(K)
            ok = "complimenti" in run_pty(td, SERIAL)
            bad_serial = "complimenti" not in run_pty(td, "AAAAAAAAAAAAAAAAAAAAAAAA")   # B^D = 0 -> division par 0
            Path(td, "keykey").write_bytes(K[:-1] + b"\x00")
            bad_file = "complimenti" not in run_pty(td, SERIAL)
        good = ok and bad_file
        print("check:", "OK" if good else "KO", f"(ok={ok}, keykey altéré→non={bad_file}, B^D=0→{bad_serial})")
        sys.exit(0 if good else 1)


if __name__ == "__main__":
    main()
