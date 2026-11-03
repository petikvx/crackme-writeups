# Usage: python3 tools/fsg-unpack-unicorn.py <Crackme.exe extrait du zip>  (depuis le dossier du challenge)
import struct
from unicorn import *
from unicorn.x86_const import *
import sys
data=open(sys.argv[1],'rb').read()
mu=Uc(UC_ARCH_X86,UC_MODE_32)
mu.mem_map(0x400000,0x9000)
mu.mem_write(0x400000,data[:0x200])
mu.mem_write(0x407000,data[0x200:0x200+0x1bd5])
mu.mem_map(0x100000,0x100000); mu.mem_map(0x70000000,0x10000)
mu.reg_write(UC_X86_REG_ESP,0x1f0000)
mu.mem_write(0x408bac,struct.pack('<II',0x70000000,0x70000100))
fake={0x70000000:'LL',0x70000100:'GPA'}
nxt=[0x70001000]
def rd(a,n=4): return struct.unpack('<I',bytes(mu.mem_read(a,4)))[0]
def cs(a):
    if a<0x10000: return 'ord%d'%a
    return bytes(mu.mem_read(a,40)).split(b'\0')[0].decode(errors='replace')
def hc(uc,a,s,ud):
    if a in fake or (a in fake):
        esp=rd_esp(); ret=rd(esp)
        if fake[a]=='LL': print('LL',cs(rd(esp+4))); r=0x71000000; n=1
        elif fake[a]=='GPA':
            f=cs(rd(esp+8)); print('GPA',f); r=nxt[0]; nxt[0]+=16; fake[r]=f; mu.mem_write(r,b'\xc3'); n=2
        else: raise Exception('call '+fake[a])
        mu.reg_write(UC_X86_REG_EAX,r); mu.reg_write(UC_X86_REG_ESP,esp+4+4*n); mu.reg_write(UC_X86_REG_EIP,ret)
    if a==0x401000 or (a<0x408000 and a>=0x401000 and 0):
        pass
def rd_esp(): return mu.reg_read(UC_X86_REG_ESP)
mu.hook_add(UC_HOOK_CODE,hc,begin=0x70000000,end=0x70002000)
def hjmp(uc,a,s,ud):
    pass
# detect OEP: exec in 0x401000..0x407000 
def hoep(uc,a,s,ud):
    print('OEP',hex(a)); uc.emu_stop()
mu.hook_add(UC_HOOK_CODE,hoep,begin=0x401000,end=0x407000)
try: mu.emu_start(0x400154,0,count=50000000)
except Exception as e: print('err',e,hex(mu.reg_read(UC_X86_REG_EIP)))
open('analysis/crackme-unpacked-dump.bin','wb').write(bytes(mu.mem_read(0x400000,0x9000)))
import json
iat={}
for a in range(0x401000,0x401130,4):
    p=rd(a)
    if p in fake: iat[hex(a)]=fake[p]
json.dump(iat,open('analysis/iat.json','w'))
print(len(iat))
