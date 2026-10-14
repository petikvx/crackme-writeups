#!/usr/bin/env python3
"""var (unchapelierfou) — id 5ab77f5b33c5d40ad448c5b3. ELF64 statique strippé.

main @0x401080 : le flag est construit par deux `movabs` + un `mov dword` sur la pile
(0x65764f5f67616c46 = "Flag_Ove", 0x445f657265485f72 = "r_Here_D", 0x656475 = "ude") ;
printf("Flag : ") ; scanf("%s", buf) ; strcmp(flag, buf) == 0 -> « Congratz ... easy wasn't it ? ».

  var-solve.py [-q] [--check]
"""
import argparse, struct, subprocess, sys
from pathlib import Path

BIN = Path(__file__).resolve().parent.parent / "analysis" / "var"


def flag() -> str:
    d = BIN.read_bytes()
    o = d.find(bytes.fromhex("48b8466c61675f4f7665"))        # movabs rax,"Flag_Ove"
    assert o >= 0
    a = d[o + 2:o + 10]
    o2 = d.find(bytes.fromhex("48b8725f48657265 5f44".replace(" ", "")), o)   # movabs rax,"r_Here_D"
    b = d[o2 + 2:o2 + 10]
    c = struct.pack("<I", 0x656475)[:3]
    return (a + b + c).decode()


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    f = flag()
    print(f if a.q else f"flag : {f}")
    if a.check:
        run = lambda s: subprocess.run([str(BIN)], input=s + "\n", capture_output=True, text=True).stdout
        ok, ko = "Congratz" in run(f), "No dude" in run("petik")
        print("check:", "OK" if ok and ko else "KO", f"(Congratz={ok}, mauvais→No dude={ko})")
        sys.exit(0 if ok and ko else 1)


if __name__ == "__main__":
    main()
