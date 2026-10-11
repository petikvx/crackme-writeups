# NTS Crackme9 (cyclops) : serial = P(8) + MD5_even(P + "Cyclops / REAL")
# MD5_even = "%02X" des octets d'indice pair du digest (0,2,4,...,14)
# Le nom n'entre pas dans le calcul (juste non vide). P libre sur 8 caractères.
import sys,hashlib
def md5_even(s):
    d=hashlib.md5(s.encode()).digest()
    return ''.join(f'{d[i]:02X}' for i in range(0,16,2))
def keygen(prefix='petik000'):
    P=(prefix+'00000000')[:8]
    return P+md5_even(P+'Cyclops / REAL')
if __name__=='__main__':
    print(keygen(sys.argv[1] if len(sys.argv)>1 else 'petik000'))
