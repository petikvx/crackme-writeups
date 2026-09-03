#!/usr/bin/env python3
"""injectme_2 solution pointer."""
from pathlib import Path
import argparse, subprocess, time
OUT=Path(__file__).resolve().parents[1]/"analysis"/"InjectMe2.injected.exe"
def main():
    ap=argparse.ArgumentParser(); ap.add_argument("-q",action="store_true"); ap.add_argument("--check",action="store_true")
    a=ap.parse_args()
    if a.check:
        subprocess.run(["killall","-9","wine","wine64"],capture_output=True); time.sleep(0.3)
        subprocess.Popen(["wine",str(OUT)],env={**__import__("os").environ,"WINEDEBUG":"-all"},stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        time.sleep(2)
        r=subprocess.run(["wine","/tmp/enumwin.exe"],capture_output=True,env={**__import__("os").environ,"WINEDEBUG":"-all"},timeout=10)
        out=r.stdout.decode("latin1","replace"); print(out.strip()[:400])
        subprocess.run(["killall","-9","wine","wine64"],capture_output=True)
        ok="petik" in out; print("check:","OK" if ok else "FAIL"); return 0 if ok else 1
    print(OUT if a.q else f"injected → {OUT}"); return 0
if __name__=="__main__": raise SystemExit(main())
