#!/usr/bin/env python3
"""learn_the_first_few_tricks_1 (deibiz_xxl) : pass = octets .data[0x402000..+8] + 1."""
import sys, subprocess
enc = b"ZCDHAHY\\"          # .data @ 0x402000
pw = bytes(c + 1 for c in enc).decode()
print(pw)
if len(sys.argv) > 1:      # ltfft-solve.py LTFFT.exe -> test live sous wine
    out = subprocess.run(["wine", sys.argv[1]], input=pw + "\n", capture_output=True, text=True, timeout=60).stdout
    print("OK" if "Well done" in out else "FAIL")
