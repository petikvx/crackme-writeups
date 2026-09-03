#!/usr/bin/env python3
"""crackme_3_by_sharpe — decrypt XOR blob then GetVersion-based keygen.

Default example (Wine GetVersion): AAAAAAAA → $$$$$$$$mbc`afgd
(petik often yields NUL bytes — unusable in the edit control.)
"""
from __future__ import annotations
import argparse, struct, subprocess, sys, os, time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[1]
EXE=ROOT/"original"/"_u"/"three.exe"
K1,K2,K3=0xCF,0x0F,0xA1
XORKEY=0xCF0EB0A1

def get_version() -> int:
    helper=Path("/tmp/gv.exe")
    if not helper.exists():
        open("/tmp/gv.c","w").write("#include <windows.h>\n#include <stdio.h>\nint main(){printf(\"%08X\\n\",GetVersion());}\n")
        subprocess.check_call(["i686-w64-mingw32-gcc","-o","/tmp/gv.exe","/tmp/gv.c"])
    return int(subprocess.check_output(["wine",str(helper)],env={**os.environ,"WINEDEBUG":"-all"}).decode().strip(),16)

def keygen(name: str, gv: int | None = None) -> str:
    if gv is None: gv=get_version()
    buf=bytearray(16); nb=name.encode("latin1"); buf[:len(nb)]=nb
    out=bytearray(16); ebx=gv
    for ecx in range(0x10,0,-1):
        i=0x10-ecx; al=buf[i]
        if al==0: al=ecx&0xff
        al^=ebx&0xff
        bl,bh=ebx&0xff,(ebx>>8)&0xff
        ebx=(ebx&0xffff0000)|(bl<<8)|bh
        al^=ebx&0xff
        al^=K1; al^=K2; al^=K3
        out[i]=al&0xff
    if 0 in out:
        raise ValueError("serial contains NUL — pick another name (e.g. AAAAAAAA)")
    return out.decode("latin1")

def main():
    ap=argparse.ArgumentParser(description=__doc__)
    ap.add_argument("-q",action="store_true")
    ap.add_argument("--user","--name",default="AAAAAAAA",dest="user")
    ap.add_argument("--check",action="store_true")
    a=ap.parse_args()
    serial=keygen(a.user)
    if a.check:
        # use permanently decrypted build for reliable GUI check
        fixed=ROOT/"analysis"/"three.real.exe"
        if not fixed.exists():
            print("missing three.real.exe"); return 1
        helper=Path(__file__).resolve().parent/"sharpe3_gui_check.exe"
        subprocess.run(["killall","-9","wine","wine64"],capture_output=True); time.sleep(0.3)
        subprocess.Popen(["wine",str(fixed)],env={**os.environ,"WINEDEBUG":"-all"},stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        time.sleep(1.8)
        r=subprocess.run(["wine",str(helper),a.user,serial],capture_output=True,env={**os.environ,"WINEDEBUG":"-all"},timeout=15)
        print(r.stdout.decode("latin1","replace").strip())
        subprocess.run(["killall","-9","wine","wine64"],capture_output=True)
        ok=b"Congratulations" in r.stdout; print("check:","OK" if ok else "FAIL"); return 0 if ok else 1
    print(serial if a.q else f"{a.user} → {serial!r} (GV-dependent)")
    return 0
if __name__=="__main__": raise SystemExit(main())
