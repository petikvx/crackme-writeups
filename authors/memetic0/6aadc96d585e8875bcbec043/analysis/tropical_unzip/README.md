# TROPICAL

A live field on a mixing desk. Six cells on a side. The right-hand bars never sit still until the serial is right.

The serial is 16 hex digits. The desk locks when the field holds a single height - not a password, not a checksum against a string in `.rodata`. Wrong serials keep the ground moving. Patching the lock bit is invalid.

## Run

    ./tropical

Run in a colour capable, UTF-8 terminal.

## Goal

Write a keygen. The unique serial is determined by the planted field, not by brute force.

## Hints

The usual product is the wrong product. If a library offers you eigenvalues, ask which arithmetic it meant.

Whatever lives in the serial is a height, not a point. One coordinate of the shape is already pinned; you are not searching a plane.