# keygen NTS Crackme8 (cyclops) : SHA-256(nom) -> 8 mots H0..H7
# serial = "%08X%08X" % (H1+H3+H5+H7, H0+H2+H4+H6)  (sommes mod 2^32)
# nom >= 7 caractères, serial >= 11 (toujours 16 ici)
import sys,hashlib,struct
def keygen(name):
    h=struct.unpack('>8I',hashlib.sha256(name.encode()).digest())
    return '%08X%08X'%((h[1]+h[3]+h[5]+h[7])&0xffffffff,(h[0]+h[2]+h[4]+h[6])&0xffffffff)
if __name__=='__main__':
    n=sys.argv[1] if len(sys.argv)>1 else 'petikpetik'
    assert len(n)>=7,'nom trop court (>=7)'
    print(keygen(n))
