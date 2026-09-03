#!/usr/bin/env python3
"""injectme_1 (xylitol): patch EP to MessageBoxA 'Injected by petik' then continue."""
from __future__ import annotations
import argparse, struct, subprocess, sys, time
from pathlib import Path
ROOT = Path(__file__).resolve().parents[1]
SRC = next((ROOT/"original"/"_u").glob("InjectMe*.exe"))
OUT = ROOT/"analysis"/"InjectMe1.injected.exe"

def build() -> Path:
    data = bytearray(SRC.read_bytes())
    cave_off = (0x400 + 0x3382 + 15) & ~15
    cave_va = 0x401000 + (cave_off - 0x400)
    text, title = b"Injected by petik\0", b"petik\0"
    str_off = cave_off + 0x30
    text_va = 0x401000 + (str_off - 0x400)
    title_va = text_va + len(text)
    stub = bytearray()
    stub += b"\x6a\x00" + b"\x68" + struct.pack("<I", title_va) + b"\x68" + struct.pack("<I", text_va) + b"\x6a\x00"
    stub += b"\xff\x15\x50\x50\x40\x00"
    call_at = cave_va + len(stub)
    stub += b"\xe8" + struct.pack("<i", 0x4015d6 - (call_at + 5))
    jmp_at = cave_va + len(stub)
    stub += b"\xe9" + struct.pack("<i", 0x401005 - (jmp_at + 5))
    data[cave_off:cave_off+len(stub)] = stub
    data[str_off:str_off+len(text)+len(title)] = text+title
    data[0x400:0x405] = b"\xe9" + struct.pack("<i", cave_va - (0x401000+5))
    e=struct.unpack_from("<I",data,0x3c)[0]; soh=struct.unpack_from("<H",data,e+20)[0]; sec=e+24+soh
    vsz=struct.unpack_from("<I",data,sec+8)[0]
    struct.pack_into("<I", data, sec+8, max(vsz, (cave_off-0x400)+0x80))
    OUT.parent.mkdir(exist_ok=True); OUT.write_bytes(data); return OUT

def main():
    ap=argparse.ArgumentParser(description=__doc__); ap.add_argument("-q",action="store_true"); ap.add_argument("--check",action="store_true")
    a=ap.parse_args(); p=build()
    if a.check:
        subprocess.run(["killall","-9","wine","wine64"],capture_output=True); time.sleep(0.3)
        proc=subprocess.Popen(["wine",str(p)],env={**__import__("os").environ,"WINEDEBUG":"-all"},stdout=subprocess.DEVNULL,stderr=subprocess.DEVNULL)
        time.sleep(1.8)
        r=subprocess.run(["wine","/tmp/enumwin.exe"],capture_output=True,env={**__import__("os").environ,"WINEDEBUG":"-all"},timeout=10)
        out=r.stdout.decode("latin1","replace"); print(out.strip()[:500])
        subprocess.run(["killall","-9","wine","wine64"],capture_output=True)
        ok="title='petik'" in out; print("check:","OK" if ok else "FAIL"); return 0 if ok else 1
    print(p if a.q else f"injected → {p}")
    return 0
if __name__=="__main__": raise SystemExit(main())
