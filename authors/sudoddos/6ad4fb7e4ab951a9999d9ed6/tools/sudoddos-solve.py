#!/usr/bin/env python3
"""Solveur du crackme Python de sudoddos : retrouve le mot de passe sans executer le crackme.

Chaine de dechiffrement (voir README) :
  crackme.py --simplify/peel (3 couches : blobs box-drawing -> SHA256-shuffle -> XOR SHA256 -> zlib|lzma) --> L4
  L4 : interpreteur d'IR ; IR = f3(blobs) -> zlib -> f4 ; proto 0 contient la table de chaines et ENCODED_CHUNKS.
  Mot de passe = codecs.decode(bytes.fromhex(''.join(chunks)).decode(ENC), CODEC)
  avec  dd(k) = bytes([x ^ (k >> 8*(i&3) & 255) for i, x in enumerate(table[k])]).decode()

usage: sudoddos-solve.py analysis/ir_dump.txt            # lit le dump texte produit par tools/irdump.py
       sudoddos-solve.py --check                         # (verifie la sortie attendue, voir README)
"""
import ast, codecs, re, sys

try: sys.stdout.reconfigure(encoding='utf-8')
except Exception: pass
SAFE_CODECS = {'rot13', 'rot_13', 'hex', 'hex_codec', 'base64', 'base64_codec', 'base_64', 'zlib', 'zlib_codec', 'bz2', 'bz2_codec', 'uu', 'uu_codec', 'quopri', 'quopri_codec'}


def load_proto0(path):
    txt = open(path, encoding='utf-8').read()
    # instruction "__tt_... = {...}" (table) et "ENCODED_CHUNKS = [dd(k), ...]"
    m = re.search(r"op102  ((?:'|\")__tt_\w+__ = \{.*?\}(?:'|\"))\n", txt, re.S)
    tbl_src = ast.literal_eval(m.group(1))          # la chaine d'instruction (repr -> str)
    table = ast.literal_eval(tbl_src.split(' = ', 1)[1])
    m2 = re.search(r"op102  ('ENCODED_CHUNKS = \[.*?\]')\n", txt)
    chunks_src = ast.literal_eval(m2.group(1))
    keys = [int(x) for x in re.findall(r'__dd_\w+__\((\d+)\)', chunks_src)]
    return table, keys, txt


def dd(table, k):
    return bytes(x ^ ((k >> (8 * (i & 3))) & 255) for i, x in enumerate(table[k])).decode()


def solve(path):
    table, keys, txt = load_proto0(path)
    # les deux noms d'encodage/codec : lus dans l'instruction de _rrpn_00001
    enc_key = int(re.search(r"bytes\.fromhex\(hex_str\)\.decode\(__dd_\w+__\((\d+)\)\)", txt).group(1))
    codec_key = int(re.search(r"codecs\.decode\(raw, __dd_\w+__\((\d+)\)\)", txt).group(1))
    ENC, CODEC = dd(table, enc_key), dd(table, codec_key)
    print('table: %d entrees | chunks: %d | encodage=%r codec=%r' % (len(table), len(keys), ENC, CODEC))
    assert CODEC in SAFE_CODECS, 'codec inattendu : ' + CODEC
    chunks = [dd(table, k) for k in keys]
    print('chunks:', chunks)
    raw = bytes.fromhex(''.join(chunks)).decode(ENC)
    print('apres fromhex/decode:', repr(raw))
    pw = codecs.decode(raw, CODEC)
    return pw if isinstance(pw, str) else pw.decode()


EXPECTED = 'PeNiZoBfUsCaT0R67'

if __name__ == '__main__':
    args = [a for a in sys.argv[1:] if a not in ('-q', '--check')]
    import os
    here = os.path.dirname(os.path.abspath(__file__))
    path = args[0] if args else os.path.join(here, '..', 'analysis', 'ir_dump.txt')   # défaut : indépendant du dossier courant
    quiet = '-q' in sys.argv
    if quiet:
        import io, contextlib
        with contextlib.redirect_stdout(io.StringIO()): pw = solve(path)
        print(pw)
    else:
        pw = solve(path)
        print('MOT DE PASSE :', pw)
    if '--check' in sys.argv:
        ok = (pw == EXPECTED)
        print('check (verifie sur le vrai crackme : "right!") :', 'OK' if ok else 'KO'); sys.exit(0 if ok else 1)
