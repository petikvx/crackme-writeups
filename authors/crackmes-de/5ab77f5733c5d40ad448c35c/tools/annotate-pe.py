import pefile,capstone,sys
pe=pefile.PE(sys.argv[1]);base=pe.OPTIONAL_HEADER.ImageBase
names={}
for e in pe.DIRECTORY_ENTRY_IMPORT:
    for i in e.imports: names[i.address]=i.name.decode() if i.name else str(i.ordinal)
data=pe.get_memory_mapped_image()
md=capstone.Cs(capstone.CS_ARCH_X86,capstone.CS_MODE_32)
s=int(sys.argv[2],16);e=int(sys.argv[3],16)
for i in md.disasm(data[s-base:e-base],s):
    t=i.op_str
    for a,n in names.items():
        if '0x%x'%a in t: t+='   ; '+n
    print('%x: %s %s'%(i.address,i.mnemonic,t))
