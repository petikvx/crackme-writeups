VEIL v3.1
=========

GOAL: find a key the program accepts.

A key is 128 hex characters. Type one and watch the display.

USAGE
  ./veil <128-hex-key>    exit 0 accepted / 1 rejected / 2 usage
  ./veil --quiet KEY      no rendering, for scripts and solvers
  ./veil --steps N KEY    show only stage N (0..12)
  ./veil --seed HEX       explore a short hex value, left-padded
  echo KEY | ./veil       stdin input works too

HINT
  The last line is not a password. It is a descendant.
  Stop guessing futures - grow one.
  The machine wants a beginning, and the middle is watching.

REQUIREMENTS
  None. Static build, no runtime libraries, fully offline, deterministic.

DISCLOSURE
  This challenge uses standard anti-debugging tricks and light obfuscation.

AUTHOR: Memetic0

