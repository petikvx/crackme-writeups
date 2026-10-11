#!/usr/bin/env python3
"""Keygen CRACKME(KEYGENME)-Breaker (brk12345 / crackmes.de) : serial = 81*len(nom) + 19350"""
import sys
name = sys.argv[1] if len(sys.argv) > 1 else "petik"
print(f"{name} -> {81*len(name) + 19350}")
