#!/usr/bin/env python3
"""qcrk_1 by qnix (id 5ab77f5333c5d40ad448c0f7).

Aucune clé valide : main fait strcmp(skey[60 chars '0'/'1'], key) où key vient de
strncpy(buf, argv[1], 10) -> 10 caractères max, jamais égal à la chaîne de 60.
La bannière « UNCRACKED VERSION » indique un patch-me : on neutralise le
`jne 0x804855b` @ 0x8048514 (75 45 -> 90 90) du binaire DÉPAQUETÉ.

Le binaire d'origine (packer « ZXC ») s'auto-déchiffre dans /tmp puis execve
/proc/<pid>/fd/3 ; analysis/qcrk.unpacked est ce fichier capturé via
`strace -e trace=write -e write=4`.

  qcrk_1-solve.py            # écrit analysis/qcrk.patched et le lance
  qcrk_1-solve.py --check    # idem + vérifie « Correct Key » (et KO avant patch)
"""
import argparse, subprocess, sys
from pathlib import Path

A = Path(__file__).resolve().parent.parent / "analysis"
SRC, DST = A / "qcrk.unpacked", A / "qcrk.patched"
OFF = 0x514            # 0x8048514 - 0x8048000 (segment à offset 0)
OLD, NEW = b"\x75\x45", b"\x90\x90"


def run(p, arg="petik"):
    return subprocess.run([str(p), arg], capture_output=True, text=True).stderr + \
           subprocess.run([str(p), arg], capture_output=True, text=True).stdout


def main():
    ap = argparse.ArgumentParser(); ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    d = bytearray(SRC.read_bytes())
    assert d[OFF:OFF + 2] == OLD, "octets inattendus"
    d[OFF:OFF + 2] = NEW
    DST.write_bytes(d); DST.chmod(0o755)
    out = run(DST)
    print(out)
    if a.check:
        ko = run(SRC)
        ok = "Correct Key" in out and "Wrong Key" in ko
        print("check:", "OK" if ok else "KO", "(avant patch: Wrong Key, après: Correct Key)")
        sys.exit(0 if ok else 1)


if __name__ == "__main__":
    main()
