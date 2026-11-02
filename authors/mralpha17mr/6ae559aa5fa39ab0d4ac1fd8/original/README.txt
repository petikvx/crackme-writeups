mothlight
=========

A porch-light keygenme for 64-bit Windows.
Original educational crackme. No packer. No network. No installer.

Goal
----
Write a keygen that prints a valid night serial for a name.
Patching a jump is not a solution. The success sentence is rebuilt
from the serial, so a flipped branch does not reveal it.

Run
---
  mothlight.exe

One try, then the program exits. It reads standard input, so this
works in a console:

  name> Ada Lovelace
  serial> ML-XXXX-YYYY-ZZZZ

Input
-----
name      3 to 20 characters.
          Letters, digits, spaces, and hyphens only.
          Letter case does not matter. Other characters are rejected.
serial    ML-XXXX-YYYY-ZZZZ
          The prefix ML- is fixed and uppercase.
          Each group is four hexadecimal digits. a-f and A-F both work.

Output
------
Bad name:      The porch light ignores that name.
Bad shape:     That is not a night serial.
Wrong serial:  The moth circles and does not land.
Right serial:  The moth lands. Lantern CMO{........}.

For auto-validation, use the lantern token printed for the name CrackMes1.

Needs
-----
64-bit Windows. The program uses kernel32 and the system C runtime.
It does not open a socket, write a file, or load any other DLL.

Hint
----
One pass walks the name forward.
A second pass walks it backward.
A third pass cares about each character's position.
The three hex groups are not written in the order those passes run.
The string ML-DEAD-BEEF-0451 in the banner is a decoy.
