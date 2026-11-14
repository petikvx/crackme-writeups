import re,sys
pid=sys.argv[1]
out=open('dump.bin','wb')
maps=[l for l in open(f'/proc/{pid}/maps') if 'crackme.protected' in l or True]
mem=open(f'/proc/{pid}/mem','rb')
base=0x140000000
buf=bytearray(0x3f000)
for l in maps:
    a,b=[int(x,16) for x in l.split()[0].split('-')]
    perms=l.split()[1]
    if a>=base and b<=base+0x3f000 and perms[0]=='r':
        try:
            mem.seek(a);buf[a-base:b-base]=mem.read(b-a)
        except Exception as e: print('err',hex(a),e)
        print(hex(a),hex(b),perms)
out.write(buf)
