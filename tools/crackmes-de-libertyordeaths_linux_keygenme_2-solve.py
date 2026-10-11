#!/usr/bin/env python3
# Keygen libertyordeaths_linux_keygenme_2 (crackmes.de) — usage : solve.py <nom> [hostname]
import sys,socket
def keygen(name,host):
    h=0x13+sum(host.encode()); L=len(host)
    t=(ord(name[-1])+L)*(L+len(name))
    return f"{h}-{t}-{name[:2]}{host[:2]}"
n=sys.argv[1] if len(sys.argv)>1 else "petik"
print(keygen(n,sys.argv[2] if len(sys.argv)>2 else socket.gethostname()))
