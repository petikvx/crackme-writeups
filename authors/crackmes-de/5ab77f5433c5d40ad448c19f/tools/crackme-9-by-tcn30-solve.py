#!/usr/bin/env python3
"""crackme_9 by tcn30 (crackmes.de) — récupère le mot de passe en appelant,
par réflexion, la vraie méthode RijndaelSimple.Decrypt de l'assembly avec les
constantes de Main (PasswordDeriveBytes MD5 x1024 -> clé 256 bits, AES-CBC).
Nécessite le SDK dotnet (>= 8). Usage : python3 crackme-9-by-tcn30-solve.py"""
import subprocess, tempfile, zipfile, pathlib, os
here = pathlib.Path(__file__).resolve().parent.parent
dn = os.path.expanduser("~/.dotnet/dotnet")
with tempfile.TemporaryDirectory() as t:
    t = pathlib.Path(t)
    z = zipfile.ZipFile(next((here / "original").glob("*.zip"))); z.setpassword(b"crackmes.one")
    (t / "c.exe").write_bytes(z.read("ConsoleApplication3.exe"))
    (t / "r.csproj").write_text('<Project Sdk="Microsoft.NET.Sdk"><PropertyGroup><OutputType>Exe</OutputType>'
                                '<TargetFramework>net8.0</TargetFramework></PropertyGroup></Project>')
    (t / "P.cs").write_text('''using System;using System.Reflection;
var t=Assembly.LoadFrom(args[0]).GetType("RijndaelSimple");
Console.WriteLine((string)t.GetMethod("Decrypt").Invoke(null,new object[]{"BnCxGiN4aJDE+qUe2yIm8Q==",
 "^F79ejk56$\\u00a3","DHj47&*)$h","MD5",1024,"&!\\u00a3$%^&*()CvHgE!",256}));''')
    out = subprocess.run([dn, "run", "--project", str(t), "--", str(t / "c.exe")],
                         capture_output=True, text=True, check=True).stdout.strip().splitlines()[-1]
    print("password:", out)
