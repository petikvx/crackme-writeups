#!/usr/bin/env python3
"""crack_me_01 (dynsym) — crackmes.one 5ab77f5633c5d40ad448c2b7 : mot de passe argv[1].

main (0x8048430) compare argv[1] à 10 octets lus en .rodata @0x80485d4 (`repz cmpsb`, ecx=10).
Ces 10 octets sont le début de la chaîne « __gmon_start__ » (nom de symbole laissé en .rodata) :
tout argument qui commence par `__gmon_sta` affiche « [!] Solved! ».

  ./crack_me_01-solve.py            # extrait et affiche le mot de passe
  ./crack_me_01-solve.py --check    # lance le binaire avec et vérifie « Solved »
"""
import argparse, subprocess, sys
from pathlib import Path

HERE = Path(__file__).resolve().parent
BIN = HERE.parent / "original" / "crackme1"
RODATA_VMA, RODATA_OFF = 0x080485CC, 0x5CC   # readelf -S : .rodata
PW_VMA, PW_LEN = 0x080485D4, 10              # mov edi,0x80485d4 ; mov ecx,0xa ; repz cmpsb

def password(path=BIN) -> str:
    data = path.read_bytes()
    off = RODATA_OFF + (PW_VMA - RODATA_VMA)
    return data[off:off + PW_LEN].decode()

def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--check", action="store_true")
    ap.add_argument("-q", action="store_true", help="n'affiche que le mot de passe")
    a = ap.parse_args()
    pw = password()
    if a.q or not a.check:
        print(pw if a.q else f"mot de passe (10 octets comparés) : {pw!r}  — ex. ./crackme1 __gmon_start__")
    if a.check:
        ok = True
        for arg, want in ((pw, True), ("__gmon_start__", True), (pw[:-1], False), ("petik", False)):
            # Mauvais mot de passe : saut au milieu d'une instruction -> SIGILL/SIGSEGV. Le process
            # s'étant mis en PTRACE_TRACEME, il reste *stoppé* (tracer = parent) : timeout + kill.
            try:
                r = subprocess.run([str(BIN), arg], capture_output=True, text=True, timeout=2)
                out, rc = r.stdout, r.returncode
            except subprocess.TimeoutExpired as e:
                out, rc = (e.stdout or b"").decode() if isinstance(e.stdout, bytes) else (e.stdout or ""), "stop"
            got = "Solved" in out
            print(f"{arg!r:18} rc={rc!s:5} {'Solved' if got else '-':7} {'OK' if got == want else 'KO'}")
            ok &= got == want
        sys.exit(0 if ok else 1)

if __name__ == "__main__":
    main()
