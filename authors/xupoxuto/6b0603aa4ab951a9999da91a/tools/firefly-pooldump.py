#!/usr/bin/env python3
"""Déchiffre les 4 string pools de « FireFly » (shake_128(clé) ⊕ blob → zlib → table d'offsets).

Usage: firefly-pooldump.py <stage2-folded.py>   # écrit P_<blob>.txt dans le dossier courant
"""
import ast, hashlib, zlib, struct, base64, re, sys
src=open(sys.argv[1] if len(sys.argv)>1 else 'stage2-folded.py').read()
tree=ast.parse(src)
ints={}; blobs={}
for node in tree.body:
    if isinstance(node, ast.Assign) and isinstance(node.targets[0], ast.Name):
        n,v=node.targets[0].id,node.value
        if isinstance(v,ast.Constant):
            if isinstance(v.value,int): ints[n]=v.value
            elif isinstance(v.value,bytes): blobs[n]=v.value
        elif isinstance(v,ast.Call) and isinstance(v.func,ast.Attribute) and v.func.attr=='b85decode' \
             and len(v.args)==1 and isinstance(v.args[0],ast.Constant):
            blobs[n]=base64.b85decode(v.args[0].value)
for m in re.finditer(r"shake_128\((\w+)\)\.digest\(len\((\w+)\)\)", src):
    kn, bn = m.group(1), m.group(2)
    km=re.search(re.escape(kn)+r" = \((\w+) \^ (\d+)\)\.to_bytes\(32, 'little'\)", src)
    if not km or bn not in blobs: print("skip",kn,bn); continue
    key=(ints[km.group(1)]^int(km.group(2))).to_bytes(32,'little')
    blob=blobs[bn]
    ks=hashlib.shake_128(key).digest(len(blob))
    dec=zlib.decompress((int.from_bytes(blob,'little')^int.from_bytes(ks,'little')).to_bytes(len(blob),'little'))
    n=struct.unpack_from('<I',dec,0)[0]; bl=(n+7)>>3
    bitmap=dec[4:4+bl]; offs=struct.unpack_from('<'+str(n+1)+'I',dec,4+bl)
    data=dec[4+bl+(n+1)*4:]
    out=f"P_{bn[:10]}.txt"
    with open(out,'w') as f:
        for i in range(n):
            raw=data[offs[i]:offs[i+1]]
            f.write(f"{i}\t{raw.decode('utf-8','replace') if (bitmap[i>>3]>>(i&7))&1 else repr(raw)}\n")
    print(out,"n=",n)
