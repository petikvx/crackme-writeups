#!/usr/bin/env python3
"""korbut_keyfile_3 (KEYFILE #2) — keyfile $KF2 = nom d'ordinateur Windows."""
import os, sys
from pathlib import Path

def main():
    name = sys.argv[1] if len(sys.argv) > 1 else os.environ.get("COMPUTERNAME") or os.uname().nodename.split(".")[0]
    # wine tronque souvent ; sous Windows c'est %COMPUTERNAME%
    out = Path(sys.argv[2]) if len(sys.argv) > 2 else Path("$KF2")
    data = name.encode("ascii", "strict")
    out.write_bytes(data)
    print(f"computer={name!r} -> {out} ({len(data)} bytes)")

if __name__ == "__main__":
    main()
