#!/usr/bin/env python3
"""xrockmr (synamics) — id 5ab77f5d33c5d40ad448c69f. crackme_x86 / crackme_x64 (ELF, 2012).

  .init_array : system("killall -q gdb"), system("killall -q strace") ; ptrace(TRACEME)
                (anti-debug : « Sem cheat, fedepe... »)
  main        : password = "you rock" ; (boucle de brouillage rand()%10 sur un tableau `par`, sans effet utile) ;
                puts("What is the password?") ; fgets(password, 8, stdin) ; si password[4] != 'o' alors password[1] = 'a'
  .fini_array : _finit_ @0x400734 : si password[0..3] == "hell" -> puts("You WIN, congratulations...")
=> mot de passe = "hello"   ("hell" + 'o' en position 4 ; "hell\\n" échoue : password[4] = '\\n').

  xrockmr-solve.py [-q] [--check]          (le binaire lance « killall -q gdb/strace » : à savoir)
"""
import argparse, subprocess, sys
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis"


def run(exe, pw):
    return subprocess.run([str(A / exe)], input=pw + "\n", capture_output=True, text=True, timeout=15).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    print("hello" if a.q else "password : hello")
    if a.check:
        res = {e: ("WIN" in run(e, "hello"), "WIN" not in run(e, "hell"), "WIN" not in run(e, "hellx")) for e in ("crackme_x64", "crackme_x86")}
        ok = all(all(v) for v in res.values())
        print("check:", "OK" if ok else "KO", res)
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
