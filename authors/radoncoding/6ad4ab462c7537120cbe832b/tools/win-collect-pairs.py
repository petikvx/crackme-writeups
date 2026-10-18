import sys,random,json,importlib.util,os
sp=importlib.util.spec_from_file_location('wo',os.path.join(os.path.dirname(os.path.abspath(__file__)),'win-oracle.py')); wo=importlib.util.module_from_spec(sp); sp.loader.exec_module(wo)
Game=wo.Game
g = Game(sys.argv[1]); A = g.addrs[0]; S=A-0x28
random.seed(1); data=[]
for it in range(80):
    g.key(0x52,'r'); hist=[]
    data.append((list(hist), g.rd(S), g.rd(A)))
    for _ in range(random.randint(1,6)):
        c=random.randrange(64); hist.append(c); g.press(c,0.12)
        data.append((list(hist), g.rd(S), g.rd(A)))
json.dump(data,open(sys.argv[2],'w')); print(len(data))
g.close()

