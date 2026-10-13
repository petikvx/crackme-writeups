# Couche 1 : octets [0x4010c5, 0x4017c8) -> rol8(b ^ 0x73, 3) ; écrit analysis/decrypted.exe
import pefile
p=pefile.PE('original/HyperCrackMe6.exe'); data=bytearray(open('original/HyperCrackMe6.exe','rb').read())
rol=lambda b,n:((b<<n)|(b>>(8-n)))&0xff
for va in range(0x4010c5,0x4017c8):
    o=p.get_offset_from_rva(va-0x400000); data[o]=rol(data[o]^0x73,3)
open('analysis/decrypted.exe','wb').write(data)
