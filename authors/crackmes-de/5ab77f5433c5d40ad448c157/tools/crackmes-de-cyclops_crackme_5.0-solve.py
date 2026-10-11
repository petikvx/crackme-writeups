# Crackme 5.0 (cyclops) : passcode tapé directement dans la fenêtre (OnChar)
# pw[i] = (((A ^ ~B) ^ (C & D)) | ~E) ^ F[i]  avec les chaînes du .rdata
A=b'This is Cyclops-';B=b'Wrong password!!';C=b'Bravo U cracked.'
D=b'Send me the  sol';E=b'ution.1234567890'
F=bytes.fromhex('fdfddef5d2beb1b8cf96b9fd89a080b3')
pw=bytes([((((a^~b)^(c&d))|~e)&0xff)^f for a,b,c,d,e,f in zip(A,B,C,D,E,F)])
print(pw.decode())
