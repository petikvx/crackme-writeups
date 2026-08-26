#!/usr/bin/env python3
"""HYDRA VAULT - FULL AUTO KEYGEN (Windows native). Just run as Administrator."""
import sys, os, time, re, struct, ctypes, subprocess
from ctypes import wintypes

if os.name != 'nt': sys.exit("Run on WINDOWS.")

k32 = ctypes.WinDLL('kernel32.dll', use_last_error=True)
u32 = ctypes.WinDLL('user32.dll', use_last_error=True)

PROCESS_VM_READ=0x10; PROCESS_QUERY_INFO=0x400; TH32CS_SNAP=0x2; MEM_COMMIT=0x1000
RW_OK={0x04,0x20,0x40}

class PE32(ctypes.Structure):
    _f=[('dwSize',wintypes.DWORD),('cntUsage',wintypes.DWORD),('pid',wintypes.DWORD),
        ('heap',ctypes.c_void_p),('modid',wintypes.DWORD),('threads',wintypes.DWORD),
        ('ppid',wintypes.DWORD),('pri',ctypes.c_long),('flags',wintypes.DWORD),('exe',ctypes.c_wchar*260)]
PE32._fields_=PE32._f
class MBI(ctypes.Structure):
    _fields_=[('BaseAddress',ctypes.c_uint64),('AllocBase',ctypes.c_uint64),
              ('AllocProt',wintypes.DWORD),('_p',wintypes.DWORD),
              ('RegionSize',ctypes.c_uint64),('State',wintypes.DWORD),
              ('Protect',wintypes.DWORD),('Type',wintypes.DWORD)]

def enable_debug():
    adv=ctypes.WinDLL('advapi32.dll')
    class LUID(ctypes.Structure): _fields_=[('Lo',wintypes.DWORD),('Hi',wintypes.LONG)]
    class LA(ctypes.Structure): _fields_=[('Luid',LUID),('Attr',wintypes.DWORD)]
    class TKP(ctypes.Structure): _fields_=[('Count',wintypes.DWORD),('Privs',LA*1)]
    h=wintypes.HANDLE()
    adv.OpenProcessToken(k32.GetCurrentProcess(),0x28,ctypes.byref(h))
    luid=LUID(); adv.LookupPrivilegeValueW(None,"SeDebugPrivilege",ctypes.byref(luid))
    tkp=TKP(); tkp.Count=1; tkp.Privs[0].Luid=luid; tkp.Privs[0].Attr=2
    adv.AdjustTokenPrivileges(h,False,ctypes.byref(tkp),0,None,None); k32.CloseHandle(h)

def find_pids():
    snap=k32.CreateToolhelp32Snapshot(TH32CS_SNAP,0)
    pe=PE32(); pe.dwSize=ctypes.sizeof(pe); out=[]
    ok=k32.Process32FirstW(snap,ctypes.byref(pe))
    while ok:
        low=pe.exe.lower()
        if low.startswith('hv') and low.endswith('.exe') and low!='hydravault.exe' and len(low)>6:
            out.append((pe.pid,pe.exe))
        ok=k32.Process32NextW(snap,ctypes.byref(pe))
    k32.CloseHandle(snap); return out

def rpm(h,a,s):
    b=ctypes.create_string_buffer(s); g=ctypes.c_size_t()
    if not k32.ReadProcessMemory(h,ctypes.c_void_p(a),b,s,ctypes.byref(g)): return None
    return b.raw[:g.value]

def scan(h,marker):
    out=[]; a=0x10000; mbi=MBI()
    while a<0x7FFFFFFF0000:
        r=k32.VirtualQueryEx(h,ctypes.c_void_p(a),ctypes.byref(mbi),ctypes.sizeof(mbi))
        if not r: break
        rs=mbi.RegionSize
        if mbi.State==MEM_COMMIT and mbi.Protect in RW_OK and 0<rs<=0x8000000:
            d=rpm(h,mbi.BaseAddress,min(rs,0x8000000))
            if d:
                i=d.find(marker)
                while i>=0:
                    aa=mbi.BaseAddress+i; c=d[i+8:i+24]
                    if len(c)==16: out.append((aa,c))
                    i=d.find(marker,i+1)
        a+=rs
    return out

def escore(b): return sum(1 for x in b if x)*16+len(set(b))

INPUT_KB=1; KF_UNI=0x4; KF_UP=2
class KI(ctypes.Structure):
    _fields_=[('wVk',wintypes.WORD),('wScan',wintypes.WORD),('dwFlags',wintypes.DWORD),('time',wintypes.DWORD),('dwExtra',ctypes.c_void_p)]
class INPU(ctypes.Union):
    _fields_=[('ki',KI),('pad',ctypes.c_ubyte*40)]
class INPT(ctypes.Structure):
    _anonymous_=('u',); _fields_=[('type',wintypes.DWORD),('u',INPU)]

def send_text(txt):
    seq=[]
    for c in txt: seq.append((ord(c),KF_UNI)); seq.append((ord(c),KF_UNI|KF_UP))
    arr=(INPT*len(seq))()
    for i,(sc,fl) in enumerate(seq): arr[i].type=INPUT_KB; arr[i].u.ki.wScan=sc; arr[i].u.ki.dwFlags=fl
    u32.SendInput(len(seq),arr,ctypes.sizeof(INPT))

def send_enter():
    arr=(INPT*2)(); arr[0].type=arr[1].type=INPUT_KB
    arr[0].u.ki.wVk=13; arr[1].u.ki.wVk=13; arr[1].u.ki.dwFlags=KF_UP
    u32.SendInput(2,arr,ctypes.sizeof(INPT))

def kill_all():
    subprocess.run(['taskkill','/F','/IM','HydraVault.exe'],capture_output=True)
    ps="Get-Process | Where {$_.Name -like 'hv*.exe'} | Stop-Process -Force"
    subprocess.run(['powershell','-NoProfile','-Command',ps],capture_output=True)
    time.sleep(1.5)

def main():
    print("=" * 60)
    print(" HYDRA VAULT - FULL AUTO KEYGEN")
    print(" " * 60)
    print(" STEP 1: Launching fresh vault instance...")
    enable_debug()
    kill_all()

    # find exe
    exe = None
    for f in os.listdir('.'):
        if f.lower().endswith('.exe') and ('vault' in f.lower() or 'inner' in f.lower()):
            exe = os.path.abspath(f); break
    if not exe:
        exe = input(" Path to vault .exe: ").strip()

    # launch DETACHED - vault writes to its OWN console
    env = os.environ.copy()
    env['HYDRA_VAULT_NO_SELFDBG'] = '1'
    # cmd /K keeps the console window OPEN even after the vault exits,
    # so you can see "ACCESS GRANTED - VAULT OPEN" without it flashing away.
    subprocess.Popen(['cmd.exe','/K',exe], env=env,
                     creationflags=subprocess.CREATE_NEW_CONSOLE)
    print(" [*] waiting 12s for prompt ...")
    time.sleep(12)

    # find child pid
    pid = None
    for _ in range(10):
        vps = find_pids()
        if vps:
            pid, pname = vps[0]; break
        time.sleep(0.5)
    if not pid:
        print(" !! cannot find hv* process"); sys.exit(1)
    print(f" [*] found child pid={pid}")

    chal = input(" \n STEP 2: Enter CHALLENGE from screen (16 hex): ").strip().upper()
    tok   = input(" STEP 3: Enter TOKEN from screen (16 hex): ").strip().upper()
    epo   = input(" STEP 4: Enter EPOCH number: ").strip() or "1"

    hproc = k32.OpenProcess(PROCESS_VM_READ|PROCESS_QUERY_INFO, False, pid)
    if not hproc:
        err = k32.GetLastError()
        print(f" !! OpenProcess failed: WinError {err}")
        if err == 5: print("    Run as ADMINISTRATOR!")
        sys.exit(1)

    marker = bytes.fromhex(chal)
    print(" [*] scanning memory ...")
    cands = scan(hproc, marker)
    ranked = sorted(((escore(c),a,c) for a,c in cands), reverse=True)

    if not ranked:
        print(" !! no candidates - epoch may have rotated"); sys.exit(1)

    print(f" [*] {len(ranked)} candidates:")
    for sc,a,c in ranked[:5]:
        print(f"    score={sc} @0x{a:X}: {c.hex().upper()}")

    KEY = ranked[0][2].hex().upper()
    print(f"\n {'='*50}")
    print(f" ▶▶▶ TYPE THIS KEY INTO THE VAULT:")
    print(f"     {KEY}")
    print(f" {'='*50}")
    print(f"\n [auto-typing in 3s - click VAULT window!]")

    for i in range(3,0,-1):
        print(f"  {i}...")
        time.sleep(1)
    send_text(KEY)
    time.sleep(0.2)
    send_enter()
    print(" [*] sent!")

if __name__=='__main__': main()
