import pefile,sys,subprocess,re
f=sys.argv[1]; pe=pefile.PE(f)
imp={}
for e in pe.DIRECTORY_ENTRY_IMPORT:
    for i in e.imports: imp[i.address]=(i.name.decode() if i.name else 'ord%d'%i.ordinal)
# thunks: jmp dword ptr [iat]
out=subprocess.run(['objdump','-d','-M','intel',f],capture_output=True,text=True).stdout
thunk={}
for l in out.splitlines():
    m=re.match(r'\s*([0-9a-f]+):.*jmp\s+DWORD PTR ds:0x([0-9a-f]+)',l)
    if m and int(m.group(2),16) in imp: thunk[int(m.group(1),16)]=imp[int(m.group(2),16)]
def rep(l):
    m=re.search(r'call\s+([0-9a-f]+)',l)
    if m and int(m.group(1),16) in thunk: return l+'   ; '+thunk[int(m.group(1),16)]
    m=re.search(r'ds:0x([0-9a-f]+)',l)
    if m and int(m.group(1),16) in imp: return l+'   ; '+imp[int(m.group(1),16)]
    return l
print('\n'.join(rep(l) for l in out.splitlines()))
