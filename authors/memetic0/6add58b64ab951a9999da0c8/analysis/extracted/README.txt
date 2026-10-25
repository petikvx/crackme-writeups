Lattice-6
=========

Linux x86-64 keygenme. The goal is to write a keygen. Patching the
binary will not reveal the flag.

How to run
----------

  ./lattice6

A prompt asks for a username and a serial.

  Tab or Down     move to the serial field
  Shift-Tab or Up move back to the username
  Enter           on the username field, move to the serial
  Enter           on the serial field, check it
  Esc             quit

The serial is 44 characters. A correct serial prints a flag of the
form CMO{...}. Anything else prints a short denial.

For the auto-validation flag, use the username CrackMes1.

You can also pass a one-line serial file:

  ./lattice6 <username> <serial-file>

Requirements
------------

Linux x86-64. The binary is static and has no dependencies.
It does not use the network.

