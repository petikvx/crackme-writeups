#!/usr/bin/env python3
"""Reconstruit depuis crackit.pyc (PyInstaller / CPython 3.14)."""
import sys

parts = ("CTF{", "My_", "S3c", "r3t_", "Fl4g", "}WoW", "You", "Found", "Me")
secretflag = "".join(parts)


def main() -> None:
    if len(sys.argv) != 2:
        print("usage: ./crackit <flag>")
        sys.exit(1)
    flag = sys.argv[1]
    if flag == secretflag:
        print("You cracked me!")
    else:
        print("Try again, You can do it!")


if __name__ == "__main__":
    main()
