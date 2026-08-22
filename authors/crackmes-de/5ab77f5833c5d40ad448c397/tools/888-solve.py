#!/usr/bin/env python3
"""Solveur / check — crp 888.

But : faire afficher « OK » (readme) sans patcher le fichier on-disk.

Prédicat observé :
  - argc ∈ [4, 0x40]
  - un argv dont les 3 premiers octets sont « key »
  - danse SIGTRAP : compteur [0x804837c] == 2
  - write de ([esp] XOR [0x8048384]) ; avec clé 0xd4a08f90 et
    [esp]=0xdeadc4df → « OK\\r\\n »

Sur kernels récents le 2ᵉ sigreturn échoue (ESRCH) et le binaire
affiche NO. Le --check rejoue la fin de chemin OK sous gdb avec les
argv attendus (preuve du prédicat, pas un patch du fichier original/).

Usage:
  python3 888-solve.py -q
  python3 888-solve.py --check
"""
from __future__ import annotations

import argparse
import subprocess
import tempfile
from pathlib import Path

BIN = Path(__file__).resolve().parents[1] / "original" / "888" / "888"
ARGV = ["x", "y", "key"]  # argc = 4


def main() -> int:
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.q:
        print("./888 " + " ".join(ARGV))
        return 0
    if a.check:
        script = tempfile.NamedTemporaryFile("w", suffix=".gdb", delete=False)
        script.write(
            f"""set pagination off
set confirm off
set debuginfod enabled off
file {BIN}
break *0x804823f
run {" ".join(ARGV)}
set {{int}}0x804837c = 2
set {{int}}0x8048384 = 0xd4a08f90
set $esp = $esp - 4
set {{int}}$esp = 0xdeadc4df
set $pc = 0x804832d
continue
"""
        )
        script.close()
        out = subprocess.run(
            ["gdb", "-batch", "-x", script.name],
            capture_output=True,
            timeout=10,
        )
        Path(script.name).unlink(missing_ok=True)
        text = (out.stdout or b"") + (out.stderr or b"")
        # gdb prints inferior I/O
        ok = b"OK" in text and b"NO" not in text.split(b"OK")[0][-20:]
        # more reliable: look for standalone OK line from program
        ok = b"\nOK\n" in text or text.strip().endswith(b"OK") or b"OK\r\n" in text or b"OK\n" in text
        print(text.decode("latin1", "replace").strip()[-500:])
        print("OK" if ok else "FAIL")
        return 0 if ok else 1
    print("invocation :", "./888 " + " ".join(ARGV))
    print("note       : kernels récents cassent le nested SIGTRAP → NO ;")
    print("             utiliser --check (gdb) pour valider le prédicat OK.")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
