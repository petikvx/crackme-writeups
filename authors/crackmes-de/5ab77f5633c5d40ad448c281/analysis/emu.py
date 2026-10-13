# Émule WinMain (0x401000) : déchiffrement en couches + journal des appels API ; dump de .text déchiffré
import pefile, struct, sys
from unicorn import *
from unicorn.x86_const import *
p=pefile.PE('original/HyperCrackMe6.exe'); IB=0x400000
mu=Uc(UC_ARCH_X86,UC_MODE_32); mu.mem_map(IB,0x10000); mu.mem_write(IB,p.get_memory_mapped_image())
STUB=0x700000; mu.mem_map(STUB,0x20000); mu.mem_map(0x800000,0x100000)
names={}; n=0
for d in p.DIRECTORY_ENTRY_IMPORT:
    for i in d.imports:
        a=STUB+n*16; names[a]=i.name.decode(); mu.mem_write(i.address,struct.pack('<I',a)); n+=1
import os; fake=[STUB+0x8000+int(os.environ.get('FOFF','0'))]; calls=[]
def cstr(a): return bytes(mu.mem_read(a,128)).split(b'\0')[0].decode('latin1') if a>0xffff else '#%d'%a
CLIP=(sys.argv[1] if len(sys.argv)>1 else 'TESTSERIAL').encode()
NARGS={'GetClipboardData':1,'OpenClipboard':1,'CloseClipboard':0,'SetUnhandledExceptionFilter':1,'DialogBoxParamA':5,'CreateDialogParamA':5,'GetDlgItemTextA':4,'SetDlgItemTextA':3,'GetDlgItem':2,'EndDialog':2,'ShowWindow':2,'SendMessageA':4,'SendDlgItemMessageA':5,'GetDlgItemInt':4,'SetWindowTextA':2,'GetWindowTextA':3,'lstrlenA':1,'lstrcmpA':2,'ExitProcess':1,'wsprintfA':0,'IsDebuggerPresent':0,'GetTickCount':0,'LoadIconA':2,'SetFocus':1,'EnableWindow':2,'DefWindowProcA':4,'PostQuitMessage':1,'MessageBoxA':4,'GetModuleHandleA':1,'GetProcAddress':2,'VirtualProtect':4,'LoadLibraryA':1}
last={}
def hook(uc,addr,size,_):
    if addr in (0x401382,0x40141c,0x401811):
        ebp=uc.reg_read(UC_X86_REG_EBP); print('CHK',hex(addr),'K=[ebp-0x24]=',hex(struct.unpack('<I',uc.mem_read(ebp-0x24,4))[0]),'v=[ebp-8]=',hex(struct.unpack('<I',uc.mem_read(ebp-8,4))[0]),'buf=',bytes(uc.mem_read(ebp-0xd8,12)))
    last['esp']=uc.reg_read(UC_X86_REG_ESP); last['ebp']=uc.reg_read(UC_X86_REG_EBP)
    if IB<=addr<IB+0x5000:
        b=bytes(uc.mem_read(addr,6))
        if b[0]==0x64:   # accès fs: émulé à la main (TEB fictif, PEB.BeingDebugged=0)
            print('FS',hex(addr),b.hex())
            if b[1:3]==b'\x8b\x03': off=uc.reg_read(UC_X86_REG_EBX); dst=UC_X86_REG_EAX; ln=3
            elif b[1]==0xa1: off=struct.unpack('<I',b[2:6])[0]; dst=UC_X86_REG_EAX; ln=6
            else: raise SystemExit('fs non géré '+b.hex())
            uc.reg_write(dst,struct.unpack('<I',uc.mem_read(TEB+off,4))[0]); uc.reg_write(UC_X86_REG_EIP,addr+ln); return
    if not (STUB<=addr<STUB+0x20000): return
    nm=names.get(addr,'?'); esp=uc.reg_read(UC_X86_REG_ESP); ret=struct.unpack('<I',uc.mem_read(esp,4))[0]
    a=struct.unpack('<6I',uc.mem_read(esp+4,24)); v=1
    if nm=='GetProcAddress':
        f=cstr(a[1]); fake[0]+=16; names[fake[0]]=f; v=fake[0]
    elif nm in('GetModuleHandleA','LoadLibraryA'): v=0x10000000
    elif nm=='GetClipboardData': uc.mem_write(0x8fc000,CLIP+b'\0'); v=0x8fc000
    calls.append((hex(ret),nm,[hex(x) for x in a],[cstr(x) for x in a[:4] if 0x400000<=x<0x900000]))
    print(*calls[-1])
    if nm=='CloseClipboard': open('analysis/at-close.bin','wb').write(bytes(uc.mem_read(0x401000,0x4000)))
    if nm=='SetUnhandledExceptionFilter': open('analysis/at-seh.bin','wb').write(bytes(uc.mem_read(0x401000,0x4000)))
    if len(calls)>40: uc.emu_stop(); return
    k=NARGS.get(nm, 4)
    uc.reg_write(UC_X86_REG_EAX,v); uc.reg_write(UC_X86_REG_ESP,esp+4+4*k); uc.reg_write(UC_X86_REG_EIP,ret)
TEB=0x500000; mu.mem_map(TEB,0x20000); mu.mem_write(TEB+0x18,struct.pack('<I',TEB)); mu.mem_write(TEB+0x30,struct.pack('<I',TEB+0x10000))
mu.reg_write(UC_X86_REG_FS_BASE,TEB)
def rd(uc,acc,addr,size,val,_):
    if addr==0x8fc000 and not rd.done: rd.done=1; open('analysis/at-clip.bin','wb').write(bytes(uc.mem_read(0x401000,0x4000)))
rd.done=0
mu.hook_add(UC_HOOK_MEM_READ,rd,begin=0x8fc000,end=0x8fc100)
mu.hook_add(UC_HOOK_CODE,hook)
esp=0x8f0000; mu.mem_write(esp,struct.pack('<5I',STUB+0x1fff0,IB,0,0x8f8000,1)); mu.mem_write(STUB+0x1fff0,b'\xf4')
mu.reg_write(UC_X86_REG_ESP,esp)
# Filtre d'exception (SetUnhandledExceptionFilter) : on l'exécute sur un faux CONTEXT, puis on reprend à Context.Eip
filt=[None]; pc=0x401000
EP=0x600000; mu.mem_map(EP,0x10000)
for _ in range(10):
    try:
        mu.emu_start(pc,STUB+0x1fff0); break
    except UcError as e:
        eip=mu.reg_read(UC_X86_REG_EIP); print('EXC',e,hex(eip),'esp',hex(mu.reg_read(UC_X86_REG_ESP)),'last',{k:hex(v) for k,v in last.items()})
        last0=dict(last); open('analysis/at-exc.bin','wb').write(bytes(mu.mem_read(0x401000,0x4000)))
        f=[c for c in calls if c[1]=='SetUnhandledExceptionFilter']
        if not f: raise
        regs={r:mu.reg_read(r) for r in (UC_X86_REG_EAX,UC_X86_REG_EBX,UC_X86_REG_ECX,UC_X86_REG_EDX,UC_X86_REG_ESI,UC_X86_REG_EDI,UC_X86_REG_EBP,UC_X86_REG_ESP)}
        mu.mem_write(EP,struct.pack('<2I',EP+0x100,EP+0x200)); mu.mem_write(EP+0x200+0xb8,struct.pack('<I',eip))
        sp=EP+0xff00; mu.mem_write(sp,struct.pack('<2I',STUB+0x1fff0,EP)); mu.reg_write(UC_X86_REG_ESP,sp)
        mu.emu_start(int(f[-1][2][0],16),STUB+0x1fff0)
        pc=struct.unpack('<I',mu.mem_read(EP+0x200+0xb8,4))[0]; print('  reprise a',hex(pc))
        regs[UC_X86_REG_ESP]=last0['esp']; regs[UC_X86_REG_EBP]=last0['ebp']
        for r,v in regs.items(): mu.reg_write(r,v)
open('analysis/text-dec.bin','wb').write(bytes(mu.mem_read(0x401000,0x4000)))
