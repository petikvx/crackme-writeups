# gdb -q -batch -x tools/veil-dump-tables.py analysis/extracted/veil  (depuis la racine du challenge)
# Masque TracerPid dans /proc/self/status (sinon le binaire charge des tables leurre) puis dumpe .bss
import os
import gdb,re
gdb.execute("set pagination off")
gdb.execute("catch syscall read")
gdb.execute("break *0x401cd0")
inf=gdb.selected_inferior()
L=gdb.lookup_type('unsigned long')
def reg(r): return int(gdb.parse_and_eval('$'+r).cast(L))
gdb.execute("run --quiet " + os.environ.get("VEIL_KEY", "ab" * 64))
buf=None
while True:
    pc=reg('rip')
    if pc==0x401cd0: break
    rax=reg('rax')
    if rax==0xffffffffffffffda:
        buf=reg('rsi') if reg('rdi')==3 else None
    elif buf:
        n=rax
        if 0<n<4096:
            b=bytes(inf.read_memory(buf,n))
            m=re.search(rb'TracerPid:\t(\d+)',b)
            if m: inf.write_memory(buf+m.start(1), b'0'*len(m.group(1)))
        buf=None
    gdb.execute("continue")
gdb.execute("dump binary memory analysis/tables-410760.bin 0x410760 0x410f60")
gdb.execute("kill")
