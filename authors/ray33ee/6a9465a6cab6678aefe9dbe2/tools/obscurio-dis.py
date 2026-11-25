import sys,struct,importlib.util,os
sp=importlib.util.spec_from_file_location("vm",os.path.join(os.path.dirname(os.path.abspath(__file__)),"obscurio-vm.py"));vm=importlib.util.module_from_spec(sp);sp.loader.exec_module(vm)
p=open(os.environ.get("PROG","analysis/extract/program.bin"),"rb").read()
code=struct.unpack("<%dI"%(len(p)//4),p)
N={0:'LOADL',1:'STOREL',2:'LOADA',3:'STOREA',5:'PUSHCS',4:'PUSH',0x14:'JZ',0x64:'AND',0x65:'OR',0x68:'SHL',0x69:'SHR',0x96:'NOT',0xc8:'OVER',0xca:'DUP',0xc9:'ROT3',0xcb:'ROT4',0x1f4:'PRINTI',0x1f5:'LOADH',0x1f6:'STOREH',0x1f7:'PRINTS',0x1f8:'READS',0x28:'CALL',0x2a:'ENTER',0x29:'LEAVE'}
def line(i):
    o=code[2*i];a=code[2*i+1]
    if o==4: d=vm.dec_const(a,i); d=d if d<0x80000000 else d-2**32
    elif o in (0,1,2,3): d=vm.dec_idx(a,i)
    elif o in(0x14,0x28): d=vm.dec16(a)
    elif o in(0x2a,0x29): d=vm.dec_n(a,i)
    else: d=''
    return "%d %s %s"%(i,N[o],d)
if __name__=="__main__":
    for i in range(int(sys.argv[1]),int(sys.argv[2])): print(line(i))
