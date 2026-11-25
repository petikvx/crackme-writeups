#!/usr/bin/env python3
"""Lance l'exe protégé sous Wine (enfant => /proc/pid/mem lisible malgré yama),
attend que le stub aegis ait déchiffré à la demande, puis dumpe l'image 0x140000000.."""
import subprocess, time, sys
exe, out = sys.argv[1], sys.argv[2]
p = subprocess.Popen(['xvfb-run', '-a', 'wine', exe], stdin=subprocess.PIPE, stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL)
time.sleep(10)
if len(sys.argv)>3:
    p.stdin.write((sys.argv[3]+"\n").encode()); p.stdin.flush(); time.sleep(6)
pid = int(subprocess.check_output(['pgrep', '-f', 'wine.*' + exe.split('/')[-1] + '|^' + exe]).split()[-1]) if False else None
import os
for q in os.listdir('/proc'):
    if q.isdigit():
        try:
            c = open(f'/proc/{q}/cmdline','rb').read()
            if exe.split('/')[-1].encode() in c and b'wine' not in c and b'xvfb' not in c and q != str(os.getpid()):
                pid = int(q)
        except Exception: pass
print('pid', pid)
maps = open(f'/proc/{pid}/maps').read().splitlines()
mem = open(f'/proc/{pid}/mem', 'rb', 0)
img = bytearray(0x28000)
for l in maps:
    a, b = [int(x, 16) for x in l.split()[0].split('-')]
    if 0x140000000 <= a < 0x140028000 and 'r' in l.split()[1]:
        try:
            mem.seek(a); img[a-0x140000000:min(b,0x140028000)-0x140000000] = mem.read(min(b,0x140028000)-a)
        except Exception as e: print('err', hex(a), e)
open(out, 'wb').write(img)
p.kill()
