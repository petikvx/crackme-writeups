import subprocess,re,sys
def run(u,p):
    out=subprocess.run(['script','-qec','dotnet CrackMe-trace.exe','/dev/null'],input=(u+'\n'+p+'\n').encode('latin1'),capture_output=True,timeout=60).stdout.decode('latin1').replace('\r','')
    return out
def oracle(known_u,p):
    res=run(known_u,p)
    m=re.findall(r'A:(.*?)B:(.*?)\n',res,re.S)
    return res,m
u=''
for _ in range(40):
    res,m=oracle(u,'x')
    print(repr(u),m[-1:] ,'GRANTED' in res and 'DENIED' not in res)
    if 'GRANTED' in res: break
    if not m: break
    a,b=m[-1]
    if a==b: print(res); break
    if b=='\x00' or b=='':
        break
    u+=b
print('USER',repr(u))
u='ElfGroups'; p=''
for _ in range(60):
    res,m=oracle(u,p)
    print(repr(p),m[-1:],'GRANTED' in res)
    if 'GRANTED' in res: break
    a,b=m[-1]
    if b in('','\x00'): break
    p+=b
print('PASS',repr(p))
