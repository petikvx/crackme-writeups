#!/usr/bin/env python3
"""Lance l'exe sous Wine (enfant => /proc/pid/mem lisible malgré yama), attend 8 s, dumpe toutes les régions lisibles."""
import subprocess, time, sys, os
exe, out = sys.argv[1], sys.argv[2]
p = subprocess.Popen(['xvfb-run','-a','wine',exe], stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
time.sleep(8)
pid=None
for q in os.listdir('/proc'):
    if q.isdigit():
        try:
            c=open(f'/proc/{q}/cmdline','rb').read()
            if os.path.basename(exe).encode() in c and b'xvfb' not in c and b'live-dump' not in c and q!=str(os.getpid()): pid=int(q)
        except Exception: pass
print('pid',pid)
mem=open(f'/proc/{pid}/mem','rb',0); buf=bytearray()
for l in open(f'/proc/{pid}/maps'):
    a,b=[int(x,16) for x in l.split()[0].split('-')]
    if l.split()[1][0]=='r' and 'stack' not in l and b-a<0x4000000:
        try: mem.seek(a); buf+=mem.read(b-a)
        except Exception: pass
open(out,'wb').write(buf); p.kill()
