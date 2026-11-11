#!/usr/bin/env python3
"""NullerF's Simple_GUI_crackme — activation key (.NET WinForms, TextBox == "sk-189").

  python3 tools/simple-gui-solve.py          # affiche la clé
  python3 tools/simple-gui-solve.py -q       # clé seule
  python3 tools/simple-gui-solve.py --check  # relit l'IL de button1_Click dans le PE d'origine
                                             # (ldstr -> #US heap), vérifie OK pour la clé, KO pour une autre
Pas de user/login : une seule clé fixe.
"""
import argparse, os, struct, sys, zipfile

HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "download.bin")
KEY = "sk-189"
BTN_RVA = 0x206C  # button1_Click (IL, header 12 octets)


def load_exe():
    with zipfile.ZipFile(ZIP) as z:
        return z.read("gui-crackme.exe", pwd=b"crackmes.one")


def us_string(d, tok_off):
    """Lit une entrée du heap #US (blob compressé UTF-16LE + 1 octet de flag)."""
    meta = d.index(b"BSJB")
    nstreams = struct.unpack_from("<H", d, meta + 12 + 4 + struct.unpack_from("<I", d, meta + 12)[0] + 2)[0]
    p = meta + 16 + struct.unpack_from("<I", d, meta + 12)[0] + 4
    for _ in range(nstreams):
        off, size = struct.unpack_from("<II", d, p)
        name = d[p + 8:p + 24].split(b"\0")[0]
        p += 8 + ((len(name) + 1 + 3) & ~3)
        if name == b"#US":
            q = meta + off + tok_off
            n = d[q]  # longueurs < 0x80 ici
            return d[q + 1:q + 1 + n - 1].decode("utf-16le")
    raise RuntimeError("#US introuvable")


def il_key(d):
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    nsec = struct.unpack_from("<H", d, pe + 6)[0]
    sec = pe + 24 + struct.unpack_from("<H", d, pe + 20)[0]
    for i in range(nsec):
        va, raw_sz, raw = struct.unpack_from("<III", d, sec + i * 40 + 12)[0:1] + struct.unpack_from("<II", d, sec + i * 40 + 16)
        if va <= BTN_RVA < va + raw_sz:
            code = raw + BTN_RVA - va + 12
            break
    il = d[code:code + 0x37]
    # ldarg.0 ; ldfld FormName ; callvirt get_Text ; ldstr <tok> ; call String::op_Equality
    assert il[1] == 0x02 and il[2] == 0x7B and il[7] == 0x6F and il[12] == 0x72 and il[17] == 0x28, "IL inattendu"
    tok = struct.unpack_from("<I", il, 13)[0]
    assert tok >> 24 == 0x70
    return us_string(d, tok & 0xFFFFFF)


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    if a.check:
        k = il_key(load_exe())
        for cand in (KEY, "petik", "123"):
            print(f"{cand!r}: {'CORRECT!' if cand == k else 'incorret :/'}")
        sys.exit(0 if k == KEY else 1)
    print(KEY if a.q else f"Activation key : {KEY}")


main()
