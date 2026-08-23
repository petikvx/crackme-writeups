#!/usr/bin/env python3
"""Reconstruit depuis CrackTool.pyc (PyInstaller / CPython 3.7)."""
from time import sleep

Pass = "YouSuccCracked"
print("----------")
print("Welcome To Crack Tool")
print("Options \n 1.Register")
opt1_function_name = input("Select Option > ")
if opt1_function_name == "1":
    print("You Selected " + opt1_function_name + " Option")
else:
    print("You Dont Select Any Option")
    sleep(3)
    exit()  # NameError in frozen build (exit non importé)

opt1_function_obf = input("Enter Your Name > ")
exc = input("Enter Password > ")
if exc != Pass:
    print("Incorrect Password!")
    sleep(3)
    exit()
print("Correct! You Successfuly Registered as " + opt1_function_obf)
sleep(3)
exit()
