; cropta_1 stage2 @0x0600 — after XOR 0x77 on 11 bytes @0x0650

0x062e: be0206               mov si, 0x602
0x0631: e8b000               call 0x6e4
0x0634: bb0007               mov bx, 0x700
0x0637: 31ff                 xor di, di
0x0639: b410                 mov ah, 0x10
0x063b: cd16                 int 0x16
0x063d: 80fc0e               cmp ah, 0xe
0x0640: 7468                 je 0x6aa
0x0642: 80fc1c               cmp ah, 0x1c
0x0645: 7418                 je 0x65f
0x0647: 8801                 mov byte ptr [bx + di], al
0x0649: 47                   inc di
0x064a: b40e                 mov ah, 0xe
0x064c: cd10                 int 0x10
0x064e: ebe9                 jmp 0x639
0x0650: ac                   lodsb al, byte ptr [si]
0x0651: 8a09                 mov cl, byte ptr [bx + di]
0x0653: 80c103               add cl, 3
0x0656: 80f14a               xor cl, 0x4a
0x0659: 38c8                 cmp al, cl
0x065b: 7445                 je 0x6a2
0x065d: ebcf                 jmp 0x62e
0x065f: b80d0e               mov ax, 0xe0d
0x0662: cd10                 int 0x10
0x0664: b80a0e               mov ax, 0xe0a
0x0667: cd10                 int 0x10
0x0669: 31f6                 xor si, si
0x066b: 31c9                 xor cx, cx
0x066d: 31ff                 xor di, di
0x066f: 31d2                 xor dx, dx
0x0671: bb5006               mov bx, 0x650
0x0674: 8a0f                 mov cl, byte ptr [bx]
0x0676: 80f9db               cmp cl, 0xdb
0x0679: 740a                 je 0x685
0x067b: 31db                 xor bx, bx
0x067d: be2106               mov si, 0x621
0x0680: bb0007               mov bx, 0x700
0x0683: ebcb                 jmp 0x650
0x0685: 8a09                 mov cl, byte ptr [bx + di]
0x0687: 80f177               xor cl, 0x77
0x068a: 8809                 mov byte ptr [bx + di], cl
0x068c: 47                   inc di
0x068d: 83ff0b               cmp di, 0xb
0x0690: 75f3                 jne 0x685
0x0692: 31f6                 xor si, si
0x0694: 31c9                 xor cx, cx
0x0696: 31db                 xor bx, bx
0x0698: 31ff                 xor di, di
0x069a: be2106               mov si, 0x621
0x069d: bb0007               mov bx, 0x700
0x06a0: ebae                 jmp 0x650
0x06a2: 83ff09               cmp di, 9
0x06a5: 7423                 je 0x6ca
0x06a7: 47                   inc di
0x06a8: eba6                 jmp 0x650
0x06aa: 85ff                 test di, di
0x06ac: 748b                 je 0x639
0x06ae: 4f                   dec di
0x06af: b020                 mov al, 0x20
0x06b1: 8801                 mov byte ptr [bx + di], al
0x06b3: e80200               call 0x6b8
0x06b6: eb81                 jmp 0x639
0x06b8: 60                   pushaw 
0x06b9: b8080e               mov ax, 0xe08
0x06bc: cd10                 int 0x10
0x06be: b8200e               mov ax, 0xe20
0x06c1: cd10                 int 0x10
0x06c3: b8080e               mov ax, 0xe08
0x06c6: cd10                 int 0x10
0x06c8: 61                   popaw 
0x06c9: c3                   ret 
0x06ca: b001                 mov al, 1
0x06cc: b500                 mov ch, 0
0x06ce: b102                 mov cl, 2
0x06d0: b600                 mov dh, 0
0x06d2: b280                 mov dl, 0x80
0x06d4: bb007c               mov bx, 0x7c00
0x06d7: b402                 mov ah, 2
0x06d9: cd13                 int 0x13
0x06db: bb0000               mov bx, 0
0x06de: 53                   push bx
0x06df: bb007c               mov bx, 0x7c00
0x06e2: 53                   push bx
0x06e3: cb                   retf 
0x06e4: ac                   lodsb al, byte ptr [si]
0x06e5: 84c0                 test al, al
0x06e7: 7406                 je 0x6ef
0x06e9: b40e                 mov ah, 0xe
0x06eb: cd10                 int 0x10
0x06ed: ebf5                 jmp 0x6e4
0x06ef: c3                   ret 
