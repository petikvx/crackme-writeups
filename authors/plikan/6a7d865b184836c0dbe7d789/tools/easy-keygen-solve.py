#!/usr/bin/env python3
"""Keygen — plikan Easy Keygen Crackme (.NET).

Algorithme (ilspy) :
  pcHash   = SHA256_hex_lower( MachineGuid + VolumeSerial_C )
  pass1    = SHA256_hex_lower( pcHash + "plikan" )
  strong   = SHA512_hex_lower( pass1 ).upper()
  license  = strong[0:25] découpé en 5 blocs de 5 :
             AAAAA-BBBBB-CCCCC-DDDDD-EEEEE

MachineGuid : HKLM\\SOFTWARE\\Microsoft\\Cryptography\\MachineGuid
VolumeSerial : GetVolumeInformation("C:\\") → ToString("X")  (hex, sans 0x)

Usage :
  # HWID manuels (recommandé hors Windows)
  python3 easy-keygen-solve.py --guid <MachineGuid> --vol <VolumeSerialHex>

  # sous Windows / Wine (lit la machine courante)
  python3 easy-keygen-solve.py --local

  python3 easy-keygen-solve.py --check KEY --guid ... --vol ...
"""

from __future__ import annotations

import argparse
import hashlib
import re
import subprocess
import sys


SALT = "plikan"


def sha256_hex(s: str) -> str:
    return hashlib.sha256(s.encode("utf-8")).hexdigest()


def sha512_hex(s: str) -> str:
    return hashlib.sha512(s.encode("utf-8")).hexdigest()


def generate_key(machine_guid: str, volume_serial_hex: str) -> str:
    """volume_serial_hex : comme uint.ToString(\"X\") en C# (majuscules OK)."""
    vol = volume_serial_hex.strip().upper().lstrip("0X")
    # C# ToString("X") n'a pas de préfixe ; casse de sortie hex hash = lower
    pc_hash = sha256_hex(machine_guid + vol)
    # Wait: GetVolumeSerial returns volumeSerialNumber.ToString("X")
    # Concatenation is GetMachineGuid() + GetVolumeSerial() as strings
    # MachineGuid is GUID string with dashes; vol is hex without padding
    # But C# ToString("X") is uppercase hex digits. SHA input is UTF8 of that.
    # If we uppercased vol, good. MachineGuid typically lowercase from registry?
    # Registry MachineGuid is usually lowercase with dashes.
    pass1 = sha256_hex(pc_hash + SALT)
    strong = sha512_hex(pass1).upper()
    if len(strong) < 25:
        return "INVALID-HASH-LENGTH"
    parts = [strong[i : i + 5] for i in range(0, 25, 5)]
    return "-".join(parts)


def generate_key_from_strings(machine_guid: str, volume_serial_as_is: str) -> dict:
    """Use volume string exactly as C# would produce (ToString X)."""
    vol = volume_serial_as_is  # already the string form
    pc_hash = sha256_hex(machine_guid + vol)
    pass1 = sha256_hex(pc_hash + SALT)
    strong = sha512_hex(pass1).upper()
    key = "-".join(strong[i : i + 5] for i in range(0, 25, 5))
    return {
        "machine_guid": machine_guid,
        "volume_serial": vol,
        "pc_hash_sha256": pc_hash,
        "pass1_sha256": pass1,
        "strong_sha512_prefix": strong[:25],
        "license_key": key,
    }


def read_local_windows() -> tuple[str, str]:
    """MachineGuid + C: volume serial via PowerShell / wine."""
    # MachineGuid
    ps_guid = (
        "([Microsoft.Win32.RegistryKey]::OpenBaseKey("
        "[Microsoft.Win32.RegistryHive]::LocalMachine, "
        "[Microsoft.Win32.RegistryView]::Registry64)"
        ".OpenSubKey('SOFTWARE\\Microsoft\\Cryptography')"
        ".GetValue('MachineGuid'))"
    )
    # Volume serial as C# uint ToString("X")
    ps_vol = (
        "$s = (Get-Volume -DriveLetter C -ErrorAction SilentlyContinue);"
        "if ($s) { '{0:X}' -f [uint32]('0x' + ($s.UniqueId -replace '\\D','').Substring(0,8)) }"
        # better: use Win32_LogicalDisk
    )
    # Reliable WMI:
    ps = r"""
$g = [Microsoft.Win32.RegistryKey]::OpenBaseKey(
  [Microsoft.Win32.RegistryHive]::LocalMachine,
  [Microsoft.Win32.RegistryView]::Registry64
).OpenSubKey('SOFTWARE\Microsoft\Cryptography').GetValue('MachineGuid')
$v = (Get-CimInstance Win32_LogicalDisk -Filter "DeviceID='C:'").VolumeSerialNumber
# WMI already returns 8 hex chars uppercase typically
Write-Output $g
Write-Output $v
"""
    for shell in (
        ["powershell.exe", "-NoProfile", "-Command", ps],
        ["pwsh", "-NoProfile", "-Command", ps],
        ["wine", "powershell.exe", "-NoProfile", "-Command", ps],
    ):
        try:
            r = subprocess.run(shell, capture_output=True, text=True, timeout=30)
            lines = [ln.strip() for ln in r.stdout.splitlines() if ln.strip()]
            if len(lines) >= 2:
                return lines[0], lines[1]
        except (FileNotFoundError, subprocess.TimeoutExpired, OSError):
            continue
    raise RuntimeError(
        "impossible de lire MachineGuid / volume C: en local "
        "(passe --guid et --vol manuellement)"
    )


def main() -> int:
    ap = argparse.ArgumentParser(description="Keygen Easy Keygen Crackme (plikan)")
    ap.add_argument("--guid", help="MachineGuid (registre)")
    ap.add_argument("--vol", help='Volume serial C: comme ToString("X") / WMI hex')
    ap.add_argument("--local", action="store_true", help="lire HWID machine courante")
    ap.add_argument("--check", metavar="KEY", help="vérifier une clé")
    ap.add_argument("-q", action="store_true", help="n'imprimer que la clé")
    args = ap.parse_args()

    if args.local:
        guid, vol = read_local_windows()
    elif args.guid and args.vol:
        guid, vol = args.guid, args.vol
    else:
        ap.print_help()
        print(
            "\nExemple (Windows) :\n"
            "  python3 easy-keygen-solve.py --local\n"
            "  python3 easy-keygen-solve.py --guid xxxx-... --vol A1B2C3D4\n",
            file=sys.stderr,
        )
        return 1

    info = generate_key_from_strings(guid, vol)
    key = info["license_key"]

    if args.check:
        ok = args.check.replace(" ", "").upper() == key.upper()
        print("OK" if ok else "FAIL", f"(expected {key})")
        return 0 if ok else 1

    if args.q:
        print(key)
        return 0

    print("=== easy-keygen-solve.py (plikan) ===")
    print(f"MachineGuid     : {info['machine_guid']}")
    print(f"VolumeSerial C: : {info['volume_serial']}")
    print(f"SHA256(guid+vol): {info['pc_hash_sha256']}")
    print(f"SHA256(...+plikan): {info['pass1_sha256']}")
    print(f"SHA512 prefix25 : {info['strong_sha512_prefix']}")
    print(f"License Key     : {key}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
