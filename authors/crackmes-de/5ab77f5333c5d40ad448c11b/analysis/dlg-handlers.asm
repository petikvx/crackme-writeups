Crackme12.exe:     file format pei-i386
Disassembly of section .text:
00401000 <.text>:
sub    esp,0x15c
push   ebx
push   ebp
mov    ebp,DWORD PTR [esp+0x168]
push   esi
push   edi
lea    eax,[esp+0xa4]
push   0xc
push   eax
push   ebp
call   DWORD PTR ds:0x4040cc
mov    ecx,0x25
xor    eax,eax
lea    edi,[esp+0x10]
rep stos DWORD PTR es:[edi],eax
lea    ecx,[esp+0x10]
mov    DWORD PTR [esp+0x10],0x94
push   ecx
call   DWORD PTR ds:0x404010
cmp    DWORD PTR [esp+0x20],0x2
jne    0x401075
cmp    DWORD PTR [esp+0x14],0x3
ja     0x401075
cmp    DWORD PTR [esp+0x18],0x33
ja     0x401075
push   0x66
push   0xfffffffa
push   ebp
call   DWORD PTR ds:0x4040d0
push   eax
call   DWORD PTR ds:0x4040d4
push   eax
push   0xfffffff2
push   ebp
call   DWORD PTR ds:0x4040d8
jmp    0x4010b1
mov    esi,DWORD PTR ds:0x4040d0
push   0x66
push   0xfffffffa
push   ebp
call   esi
mov    edi,DWORD PTR ds:0x4040d4
push   eax
call   edi
mov    ebx,DWORD PTR ds:0x4040dc
push   eax
push   0x1
push   0x80
push   ebp
call   ebx
push   0x66
push   0xfffffffa
push   ebp
call   esi
push   eax
call   edi
push   eax
push   0x0
push   0x80
push   ebp
call   ebx
lea    edx,[esp+0xa4]
push   edx
push   0x0
push   0x6
call   DWORD PTR ds:0x40400c
mov    ebx,eax
test   ebx,ebx
je     0x401142
push   0x0
push   0x0
push   0x0
push   0x6
push   ebx
call   DWORD PTR ds:0x404008
test   eax,eax
je     0x40113b
mov    ecx,0x64
mov    esi,eax
mov    edi,0x405720
mov    eax,0x405720
rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
mov    esi,0x4057e8
mov    dl,BYTE PTR [eax]
mov    cl,dl
cmp    dl,BYTE PTR [esi]
jne    0x401118
test   cl,cl
je     0x401114
mov    dl,BYTE PTR [eax+0x1]
mov    cl,dl
cmp    dl,BYTE PTR [esi+0x1]
jne    0x401118
add    eax,0x2
add    esi,0x2
test   cl,cl
jne    0x4010f4
xor    eax,eax
jmp    0x40111d
sbb    eax,eax
sbb    eax,0xffffffff
test   eax,eax
jne    0x40113b
push   eax
push   0x40504c
push   0x405030
push   ebp
call   DWORD PTR ds:0x4040e0
push   0x0
call   DWORD PTR ds:0x404004
push   ebx
call   DWORD PTR ds:0x404000
pop    edi
pop    esi
pop    ebp
mov    eax,0x1
pop    ebx
add    esp,0x15c
ret
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
mov    eax,DWORD PTR [esp+0x8]
sub    esp,0xe4
sub    eax,0x2
push   ebx
push   ebp
push   esi
push   edi
je     0x40137b
sub    eax,0x63
je     0x4011a6
sub    eax,0x386
jne    0x40138b
push   0x0
push   0x4050ec
push   0x405094
push   0x0
call   DWORD PTR ds:0x4040e0
pop    edi
pop    esi
pop    ebp
pop    ebx
add    esp,0xe4
ret
mov    eax,DWORD PTR [esp+0x104]
test   eax,eax
jne    0x40138b
mov    ebx,DWORD PTR [esp+0xf8]
mov    esi,DWORD PTR ds:0x4040b8
lea    eax,[esp+0x90]
push   0x14
push   eax
push   0x64
push   ebx
call   esi
lea    edi,[esp+0x90]
or     ecx,0xffffffff
xor    eax,eax
repnz scas al,BYTE PTR es:[edi]
not    ecx
dec    ecx
je     0x40138b
lea    ecx,[esp+0x90]
push   ecx
push   0x1000
push   eax
push   0x4
push   eax
push   0xffffffff
call   DWORD PTR ds:0x404020
test   eax,eax
mov    ds:0x405560,eax
je     0x401345
call   DWORD PTR ds:0x40401c
cmp    eax,0xb7
jne    0x40125e
lea    edx,[esp+0x10]
push   0x80
push   edx
push   0x0
call   DWORD PTR ds:0x404018
lea    eax,[esp+0x10]
push   0x0
push   eax
push   0x405068
call   DWORD PTR ds:0x4040bc
push   eax
call   DWORD PTR ds:0x4040e0
mov    ecx,DWORD PTR ds:0x405560
push   ecx
call   DWORD PTR ds:0x404000
pop    edi
pop    esi
pop    ebp
pop    ebx
add    esp,0xe4
ret
mov    edx,DWORD PTR ds:0x405560
push   0x0
push   0x0
push   0x0
push   0x6
push   edx
call   DWORD PTR ds:0x404008
mov    ebp,eax
test   ebp,ebp
je     0x40130f
push   0xc8
push   0x4057e8
push   0x3ea
push   ebx
call   esi
mov    edi,0x4057e8
or     ecx,0xffffffff
xor    eax,eax
repnz scas al,BYTE PTR es:[edi]
not    ecx
dec    ecx
cmp    ecx,0x9
jae    0x4012aa
push   eax
call   DWORD PTR ds:0x404004
push   0xc8
push   0x405720
push   0x68
push   ebx
call   esi
mov    edi,0x405720
or     ecx,0xffffffff
xor    eax,eax
repnz scas al,BYTE PTR es:[edi]
not    ecx
dec    ecx
cmp    ecx,0x4
jae    0x4012d4
push   eax
call   DWORD PTR ds:0x404004
mov    ecx,0x64
mov    esi,0x405720
mov    edi,ebp
push   ebp
rep movs DWORD PTR es:[edi],DWORD PTR ds:[esi]
call   0x401430
add    esp,0x4
push   ebp
call   DWORD PTR ds:0x404014
push   0x0
push   0x65
push   ebx
call   DWORD PTR ds:0x4040c0
push   eax
call   DWORD PTR ds:0x4040c4
pop    edi
pop    esi
pop    ebp
pop    ebx
add    esp,0xe4
ret
lea    eax,[esp+0x10]
push   0x80
push   eax
push   0x0
call   DWORD PTR ds:0x404018
lea    ecx,[esp+0x10]
push   0x0
push   ecx
push   0x405060
call   DWORD PTR ds:0x4040bc
push   eax
call   DWORD PTR ds:0x4040e0
pop    edi
pop    esi
pop    ebp
pop    ebx
add    esp,0xe4
ret
lea    edx,[esp+0x10]
push   0x80
push   edx
push   0x0
call   DWORD PTR ds:0x404018
lea    eax,[esp+0x10]
push   0x0
push   eax
push   0x405058
call   DWORD PTR ds:0x4040bc
push   eax
call   DWORD PTR ds:0x4040e0
pop    edi
pop    esi
pop    ebp
pop    ebx
add    esp,0xe4
ret
mov    ecx,DWORD PTR [esp+0xf8]
push   0x2
push   ecx
call   DWORD PTR ds:0x4040c8
pop    edi
pop    esi
pop    ebp
pop    ebx
add    esp,0xe4
ret
nop
nop
nop
nop
nop
nop
nop
nop
nop
nop
mov    eax,DWORD PTR [esp+0x8]
sub    eax,0x110
je     0x4013ea
dec    eax
je     0x4013b3
xor    eax,eax
ret    0x10
mov    eax,DWORD PTR [esp+0xc]
mov    edx,DWORD PTR [esp+0x10]
mov    ecx,eax
push   esi
mov    esi,DWORD PTR [esp+0x8]
and    eax,0xffff
shr    ecx,0x10
push   ecx
push   edx
push   eax
push   esi
call   0x401160
add    esp,0x10
push   0x0
push   0x0
push   esi
call   DWORD PTR ds:0x4040b4
mov    eax,0x1
pop    esi
ret    0x10
mov    eax,DWORD PTR [esp+0x10]
mov    ecx,DWORD PTR [esp+0xc]
mov    edx,DWORD PTR [esp+0x4]
push   eax
push   ecx
push   edx
call   0x401000
.byte 0x83
.byte 0xc4
