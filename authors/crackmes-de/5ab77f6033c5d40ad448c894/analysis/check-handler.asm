; Dialog WM_COMMAND id 0x192 (Check) — dump Scylla, VA base 0x400000
; Name: control 0x195 → buf 0x40349C ; Serial: control 0x196 → même buf après clear

; 1) length name L : 6..12
; 2) copy name → 0x4034CC
; 3) transform 0x40349C: xor 0x4E ; shl 1
; 4) H = Adler32(transformed) @ 0x4011E7
; 5) transform 0x4034CC: add 5 ; xor 0x1D
; 6) C = CRC32(buf, L, 0) @ 0x401B60 (table 0x403080)
; 7) serial len==9, serial[2]=='-'
; 8) strip dash → 8 hex → dword D (bswap after LE load)
; 9) success iff D + H == C

0040134E  cmp dword [ebp+10h], 192h
004013F8  xor byte [eax], 4Eh
004013FB  shl byte [eax], 1
0040140A  call Adler32_4011E7
00401457  add byte [esi], 5
0040145A  xor byte [esi], 1Dh
0040146D  call CRC32_401B60
004014BF  cmp eax, 9
004014C9  cmp byte [40349Eh], 2Dh
004014FB  call HexDecode_4015C5
0040150A  bswap edi
0040150D  add edi, edx          ; + H
0040150F  cmp edi, ebx          ; == C
