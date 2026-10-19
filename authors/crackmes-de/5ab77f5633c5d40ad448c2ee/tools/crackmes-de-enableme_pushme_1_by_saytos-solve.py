#!/usr/bin/env python3
"""Patcher PushMe#1.exe (saytos) : remplace, dans WM_INITDIALOG, le lancement des
3 threads de surveillance (CreateThread @401185 + call 401233 + call 401313) par
EnableWindow(hButton, TRUE). Le compteur d'intégrité 0x402058 reste à 0x1BD,
donc (0x1BD ^ 0x43) == 0x1FE et le clic affiche le good boy.

  ./crackmes-de-enableme_pushme_1_by_saytos-solve.py PushMe#1.exe [sortie.exe]
  ./crackmes-de-enableme_pushme_1_by_saytos-solve.py --check PushMe#1.exe
  --no-ep : ne pas appliquer le correctif d'entrée (XP pur)
"""
import sys
OFF = 0x585            # VA 0x401185 (.code VA 0x401000 = offset 0x400)
ORIG_HEAD = bytes.fromhex("b888104000")          # mov eax, 0x401088 (thread B)
PATCH = bytes.fromhex("6a01"                      # push 1
                      "ff350c204000"              # push [0x40200c]  (hButton 0x291)
                      "ff1542314000")             # call [EnableWindow]
PATCH += b"\x90" * (0x4011a8 - 0x401185 - len(PATCH))   # nop jusqu'à mov eax,1

# Entrée @4010E1 : boucle anti-trace qui suppose EAX=0 au démarrage (vrai sous XP).
# Sous Wine/Win7+ EAX != 0 -> ~4 G itérations de call -> stack overflow.
# Correctif de compatibilité : xor eax,eax ; jmp 4010FD (push eax / GetModuleHandleA(NULL)).
EP_OFF = 0x4e1
EP_ORIG = bytes.fromhex("6083f801")
EP_PATCH = bytes.fromhex("31c0eb18")

def main(a):
    check = "--check" in a; a = [x for x in a if x not in ("--check", "--no-ep")]
    src = a[0]; data = bytearray(open(src, "rb").read())
    if check:
        print("patché" if data[OFF:OFF+len(PATCH)] == PATCH else "original/inconnu"); return
    assert data[OFF:OFF+5] == ORIG_HEAD, "binaire inattendu"
    data[OFF:OFF+len(PATCH)] = PATCH
    if "--no-ep" not in sys.argv:
        assert data[EP_OFF:EP_OFF+4] == EP_ORIG
        data[EP_OFF:EP_OFF+4] = EP_PATCH
    dst = a[1] if len(a) > 1 else src.replace(".exe", "_patched.exe")
    open(dst, "wb").write(data); print(dst)

if __name__ == "__main__":
    main(sys.argv[1:])
