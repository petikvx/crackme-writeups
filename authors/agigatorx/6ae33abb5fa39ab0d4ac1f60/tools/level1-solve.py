#!/usr/bin/env python3
"""agigatorx level1 : mot de passe fixe de 8 caractères (switch par index). [-q] [--check]"""
import subprocess, sys, os
# switch(i) : 0,4->'A' 1,3->'G' 2->'I' 5->'T' 6->'O' 7->'R'
TABLE = {0:65,1:71,2:73,3:71,4:65,5:84,6:79,7:82}
pw = "".join(chr(TABLE[i]) for i in range(8))
print(pw if "-q" in sys.argv else f"password={pw}")
if "--check" in sys.argv:
    exe = os.path.join(os.path.dirname(os.path.abspath(__file__)), "..", "original", "level1.exe")
    r = subprocess.run(["xvfb-run","-a","wine",exe], input=(pw+"\n\n").encode(), capture_output=True, timeout=60)
    print(r.stdout.decode(errors="replace")[-120:])
