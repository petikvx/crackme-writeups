#!/usr/bin/env python3
"""Solveur — crackmes.de's keygenme_conflux1 by conflux (conflux1.1.exe, MinGW C++ console).

main (0x401334) :
    srand(time(NULL));
    char c = 'a' + rand() % 26;          // rand() de msvcrt.dll
    std::string a = "abcdef";            // 0x46e040
    std::cin >> input;
    if (input == a + "-goodx" + c)       // 0x46e080
        std::cout << "Good job!\n";

Le serial attendu = "abcdef-goodx" + une lettre qui dépend de la seconde courante.
usage : conflux1-solve.py [--time EPOCH] [--all]
"""
import argparse, time

def msvcrt_first_rand(seed):
    return (((seed * 214013 + 2531011) & 0xFFFFFFFF) >> 16) & 0x7FFF

def serial_for(t):
    return "abcdef-goodx" + chr(ord('a') + msvcrt_first_rand(t & 0xFFFFFFFF) % 26)

if __name__ == "__main__":
    ap = argparse.ArgumentParser()
    ap.add_argument("--time", type=int, help="epoch (défaut : maintenant)")
    ap.add_argument("--all", action="store_true", help="les 26 serials possibles")
    a = ap.parse_args()
    if a.all:
        for i in range(26): print("abcdef-goodx" + chr(97 + i))
    else:
        print(serial_for(a.time if a.time is not None else int(time.time())))
