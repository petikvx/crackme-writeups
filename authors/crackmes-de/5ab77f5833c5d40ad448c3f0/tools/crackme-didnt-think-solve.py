#!/usr/bin/env python3
"""Keygen pour CrackMe.exe (grzzlwmpf, .NET WinForms).

serial = Base64( AES-CBC( UTF-16LE(name) ; key/iv = PasswordDeriveBytes(name, salt) ) )
Backdoor : name=Grzzlwmpf / serial=backdoor.

  python3 tools/crackme-didnt-think-solve.py [name] [-q] [--check]
Défaut : name = petik.  --check rejoue la vraie Encryption.EncryptString du
CrackMe.exe d'origine (dotnet + reflection) et compare.
"""
import argparse, base64, hashlib, os, subprocess, sys, tempfile, zipfile
from cryptography.hazmat.primitives import padding
from cryptography.hazmat.primitives.ciphers import Cipher, algorithms, modes

SALT = bytes([73, 118, 97, 110, 32, 77, 101, 100, 118, 101, 100, 101, 118])  # "Ivan Medvedev"
HERE = os.path.dirname(os.path.abspath(__file__))
ZIP = os.path.join(HERE, "..", "original", "CrackMe.zip")


def derive_key_iv(pwd, salt, iters=100):
    """PasswordDeriveBytes(pwd, salt) de .NET : GetBytes(32) puis GetBytes(16).

    base = SHA1^(iters-1)(pwd||salt) ; b0 = SHA1(base) (= PBKDF1 classique) ;
    bN = SHA1(str(N) || base).  key = b0 || b1[:12].
    Bug .NET (observé empiriquement, voir write-up) : les 8 octets restants du
    bloc b1 ne sont PAS repris, l'IV vaut b0[8:16] || b2[:8].
    """
    h = hashlib.sha1(pwd + salt).digest()
    for _ in range(iters - 2):
        h = hashlib.sha1(h).digest()
    blk = lambda n: hashlib.sha1((str(n).encode() if n else b"") + h).digest()
    b0, b1, b2 = blk(0), blk(1), blk(2)
    return b0 + b1[:12], b0[8:16] + b2[:8]


def keygen(name):
    key, iv = derive_key_iv(name.encode("utf-8"), SALT)
    p = padding.PKCS7(128).padder()
    data = p.update(name.encode("utf-16-le")) + p.finalize()
    enc = Cipher(algorithms.AES(key), modes.CBC(iv)).encryptor()
    return base64.b64encode(enc.update(data) + enc.finalize()).decode()


def _fix32(path):
    """Copie TEMPORAIRE : efface le flag 32BITREQUIRED pour charger l'assembly
    dans un dotnet x64 (original/ n'est jamais touché)."""
    import struct
    d = bytearray(open(path, "rb").read())
    pe = struct.unpack_from("<I", d, 0x3C)[0]
    rva = struct.unpack_from("<I", d, pe + 24 + 96 + 14 * 8)[0]
    nsec, opt = struct.unpack_from("<H", d, pe + 6)[0], struct.unpack_from("<H", d, pe + 20)[0]
    for i in range(nsec):
        _, vs, va, rs, ro = struct.unpack_from("<8sIIII", d, pe + 24 + opt + i * 40)
        if va <= rva < va + vs:
            off = rva - va + ro + 16
    struct.pack_into("<I", d, off, struct.unpack_from("<I", d, off)[0] & ~2)
    open(path, "wb").write(d)


def check(name, serial):
    d = tempfile.mkdtemp()
    with zipfile.ZipFile(ZIP) as z:
        z.extract("CrackMe.exe", d, pwd=b"crackmes.one")
    _fix32(os.path.join(d, "CrackMe.exe"))
    proj = tempfile.mkdtemp()
    open(os.path.join(proj, "h.csproj"), "w").write(
        '<Project Sdk="Microsoft.NET.Sdk"><PropertyGroup><OutputType>Exe</OutputType>'
        '<TargetFramework>net8.0</TargetFramework><NoWarn>SYSLIB0041;SYSLIB0022</NoWarn></PropertyGroup></Project>')
    open(os.path.join(proj, "p.cs"), "w").write(
        'var a=System.Reflection.Assembly.LoadFrom(args[1]);'
        'var m=a.GetType("CrackMe.Encryption").GetMethod("EncryptString",new[]{typeof(string),typeof(string)});'
        'System.Console.WriteLine(m.Invoke(null,new object[]{args[0],args[0]}));')
    env = dict(os.environ, PATH=os.environ["PATH"] + ":" + os.path.expanduser("~/.dotnet"),
               DOTNET_CLI_TELEMETRY_OPTOUT="1")
    subprocess.run(["dotnet", "build", "-o", os.path.join(proj, "out"), "-v", "q", proj],
                   check=True, env=env, capture_output=True)
    r = subprocess.run(["dotnet", os.path.join(proj, "out", "h.dll"), name, os.path.join(d, "CrackMe.exe")],
                       env=env, capture_output=True, text=True)
    real = r.stdout.strip()
    print("binaire :", real)
    return real == serial


if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("name", nargs="?", default="petik")
    ap.add_argument("-q", action="store_true")
    ap.add_argument("--check", action="store_true")
    a = ap.parse_args()
    s = keygen(a.name)
    print(s if a.q else f"name={a.name}\nserial={s}")
    if a.check:
        ok = check(a.name, s)
        print("CHECK", "OK" if ok else "KO")
        sys.exit(0 if ok else 1)
