CrackMe1Anarchy.exe:     file format pei-i386
Disassembly of section .text:
0046ea30 <.text+0x6da30>:
push   ebp
mov    ebp,esp
xor    ecx,ecx
push   ecx
push   ecx
push   ecx
push   ecx
push   ebx
mov    ebx,eax
xor    eax,eax
push   ebp
push   0x46eb19
push   DWORD PTR fs:[eax]
mov    DWORD PTR fs:[eax],esp
lea    edx,[ebp-0x4]
mov    eax,DWORD PTR [ebx+0x378]
call   0x44b630
mov    eax,DWORD PTR [ebp-0x4]
mov    edx,0x46eb34
call   0x405c70
jne    0x46ea9a
lea    edx,[ebp-0x8]
mov    eax,DWORD PTR [ebx+0x37c]
call   0x44b630
mov    eax,DWORD PTR [ebp-0x8]
mov    edx,0x46eb5c
call   0x405c70
jne    0x46ea9a
mov    eax,ds:0x4781d0
mov    edx,0x46eb7c
call   0x405c70
je     0x46ea9a
call   0x46eb84
lea    edx,[ebp-0xc]
mov    eax,DWORD PTR [ebx+0x378]
call   0x44b630
mov    eax,DWORD PTR [ebp-0xc]
mov    edx,0x46eb34
call   0x405c70
je     0x46eacd
mov    eax,ebx
mov    edx,DWORD PTR [eax]
call   DWORD PTR [edx+0x4c]
mov    edx,eax
mov    eax,DWORD PTR [ebx+0x394]
call   0x438a1c
jmp    0x46eafe
lea    edx,[ebp-0x10]
mov    eax,DWORD PTR [ebx+0x37c]
call   0x44b630
mov    eax,DWORD PTR [ebp-0x10]
mov    edx,0x46eb5c
call   0x405c70
je     0x46eafe
mov    eax,ebx
mov    edx,DWORD PTR [eax]
call   DWORD PTR [edx+0x4c]
mov    edx,eax
mov    eax,DWORD PTR [ebx+0x394]
call   0x438a1c
xor    eax,eax
pop    edx
pop    ecx
pop    ecx
mov    DWORD PTR fs:[eax],edx
push   0x46eb20
lea    eax,[ebp-0x10]
mov    edx,0x4
call   0x40550c
ret
jmp    0x404408
jmp    0x46eb0b
pop    ebx
mov    esp,ebp
pop    ebp
ret
add    BYTE PTR [eax],al
add    BYTE PTR [eax-0xfffdfc],dh
(bad)
(bad)
dec    DWORD PTR [eax+eax*1]
add    BYTE PTR [eax],al
push   esp
add    BYTE PTR [eax+0x0],ch
outs   dx,DWORD PTR ds:[esi]
add    BYTE PTR [ebp+0x0],ch
and    BYTE PTR [eax],al
inc    ebx
add    BYTE PTR [edi+0x0],ch
ins    BYTE PTR es:[edi],dx
add    BYTE PTR [eax+eax*1+0x69],ch
add    BYTE PTR [esi+0x0],ch
jae    0x46eb4c
add    BYTE PTR [eax],al
add    BYTE PTR [eax],al
mov    al,0x4
add    al,BYTE PTR [eax]
(bad)
(bad)
(bad)
dec    DWORD PTR [ecx]
add    BYTE PTR [eax],al
add    BYTE PTR ds:0x39003600,dh
add    BYTE PTR [eax+eax*1],dh
sub    eax,0x33003500
add    BYTE PTR [edi],dh
add    BYTE PTR [eax],bh
add    BYTE PTR [eax],al
add    BYTE PTR [eax-0xfffdfc],dh
(bad)
(bad)
inc    DWORD PTR [ebx]
add    BYTE PTR [eax],al
add    BYTE PTR [edi+0x0],ch
jne    0x46eb80
imul   eax,DWORD PTR [eax],0xd0b80000
add    DWORD PTR [edi+0x0],0x46ebb4ba
add    al,ch
sub    DWORD PTR [ecx-0x7],0x81cca1ff
inc    edi
add    BYTE PTR [ebx+0x39080],cl
add    BYTE PTR [edx-0x618817ff],dh
cld
inc    ebx
add    BYTE PTR [eax],al
mov    al,0x4
add    al,BYTE PTR [eax]
(bad)
(bad)
(bad)
inc    DWORD PTR [ebx]
add    BYTE PTR [eax],al
add    BYTE PTR [edi+0x0],ch
jne    0x46ebb8
imul   eax,DWORD PTR [eax],0x8b550000
in     al,dx
push   0x0
push   0x0
xor    eax,eax
push   ebp
push   0x46ec4f
push   DWORD PTR fs:[eax]
mov    DWORD PTR fs:[eax],esp
mov    eax,0x4781d0
mov    edx,0x46ec68
call   0x405514
lea    edx,[ebp-0x4]
mov    eax,ds:0x4781cc
mov    eax,DWORD PTR [eax+0x378]
call   0x44b630
cmp    DWORD PTR [ebp-0x4],0x0
je     0x46ec05
mov    eax,0x46ec7c
call   0x43bef8
jmp    0x46ec34
lea    edx,[ebp-0x8]
mov    eax,ds:0x4781cc
mov    eax,DWORD PTR [eax+0x37c]
call   0x44b630
cmp    DWORD PTR [ebp-0x8],0x0
je     0x46ec2a
mov    eax,0x46ec7c
call   0x43bef8
jmp    0x46ec34
mov    eax,0x46eca4
call   0x43bef8
xor    eax,eax
pop    edx
pop    ecx
pop    ecx
mov    DWORD PTR fs:[eax],edx
push   0x46ec56
lea    eax,[ebp-0x8]
mov    edx,0x2
call   0x40550c
ret
jmp    0x404408
jmp    0x46ec41
pop    ecx
pop    ecx
pop    ebp
ret
add    BYTE PTR [eax],al
mov    al,0x4
add    al,BYTE PTR [eax]
(bad)
(bad)
(bad)
inc    DWORD PTR [ebx]
add    BYTE PTR [eax],al
add    BYTE PTR [esi+0x0],ch
outs   dx,DWORD PTR ds:[esi]
add    BYTE PTR [esi+0x0],ch
add    BYTE PTR [eax],al
mov    al,0x4
add    al,BYTE PTR [eax]
(bad)
(bad)
(bad)
dec    DWORD PTR ds:0x4e000000
add    BYTE PTR [edi+0x0],ch
sub    al,0x0
and    BYTE PTR [eax],al
outs   dx,BYTE PTR ds:[esi]
add    BYTE PTR [edi+0x0],ch
sub    al,0x0
and    BYTE PTR [eax],al
outs   dx,BYTE PTR ds:[esi]
add    BYTE PTR [edi+0x0],ch
add    BYTE PTR cs:[esi],ch
add    BYTE PTR [esi],ch
add    BYTE PTR [eax],al
add    BYTE PTR [eax-0xfffdfc],dh
(bad)
(bad)
call   FWORD PTR [eax]
add    BYTE PTR [eax],al
add    BYTE PTR [ecx+0x0],cl
je     0x46eca8
daa
add    BYTE PTR [ebx+0x0],dh
and    BYTE PTR [eax],al
dec    edi
add    BYTE PTR [ebx+0x0],ch
add    BYTE PTR gs:[ecx+0x0],bh
and    BYTE PTR [eax],al
and    DWORD PTR [eax],eax
and    BYTE PTR [eax],al
inc    edi
add    BYTE PTR [edi+0x0],ch
outs   dx,DWORD PTR ds:[esi]
add    BYTE PTR [eax+eax*1+0x20],ah
add    BYTE PTR [edx+0x0],cl
outs   dx,DWORD PTR ds:[esi]
add    BYTE PTR [edx+0x0],ah
and    BYTE PTR [eax],al
cmp    eax,DWORD PTR [eax]
sub    eax,0x2900
add    BYTE PTR [eax],al
add    BYTE PTR [ebx-0x75],dl
fmul   DWORD PTR [ebx+0x37883]
add    BYTE PTR [ebx-0x76d00f0],cl
add    BYTE PTR [eax],al
add    BYTE PTR [ebx+0x37c83],cl
add    BYTE PTR [ebx-0x76d00f0],cl
add    BYTE PTR [eax],al
add    BYTE PTR [ebx-0x3d],bl
lea    eax,[eax+0x0]
mov    eax,0x46ed14
call   0x43bef8
ret
add    BYTE PTR [eax-0xfffdfc],dh
(bad)
(bad)
jmp    FWORD PTR [edx+0x0]
add    BYTE PTR [eax],al
inc    ebx
add    BYTE PTR [edx+0x0],dh
popa
add    BYTE PTR [ebx+0x0],ah
imul   eax,DWORD PTR [eax],0x4d
add    BYTE PTR [ebp+0x0],ah
and    BYTE PTR [eax],al
and    eax,DWORD PTR [eax]
xor    DWORD PTR [eax],eax
and    BYTE PTR [eax],al
sub    eax,0x45002000
add    BYTE PTR [ecx+0x0],ah
jae    0x46ed34
jns    0x46ed36
and    BYTE PTR [eax],al
push   esp
add    BYTE PTR [ecx+0x0],ch
ins    DWORD PTR es:[edi],dx
add    BYTE PTR [ebp+0x0],ah
jb     0x46ed42
jae    0x46ed44
and    BYTE PTR [eax],al
sub    eax,0x42002000
add    BYTE PTR [ecx+0x0],bh
and    BYTE PTR [eax],al
inc    ecx
add    BYTE PTR [esi+0x0],ch
popa
add    BYTE PTR [edx+0x0],dh
arpl   WORD PTR [eax],eax
push   0x32007900
add    BYTE PTR [ebx+0x0],ch
xor    eax,DWORD PTR [eax]
or     eax,0x6e006100
add    BYTE PTR [ecx+0x0],ah
jb     0x46ed6e
arpl   WORD PTR [eax],eax
push   0x32007900
add    BYTE PTR [ebx+0x0],ch
xor    eax,DWORD PTR [eax]
inc    eax
add    BYTE PTR [eax+0x0],ch
outs   dx,DWORD PTR ds:[esi]
add    BYTE PTR [eax+eax*1+0x6d],dh
add    BYTE PTR [ecx+0x0],ah
imul   eax,DWORD PTR [eax],0x2e006c
arpl   WORD PTR [eax],eax
outs   dx,DWORD PTR ds:[esi]
add    BYTE PTR [ebp+0x0],ch
or     eax,0x77005400
add    BYTE PTR [edi+0x0],ch
and    BYTE PTR [eax],al
je     0x46ed9e
imul   eax,DWORD PTR [eax],0x65006d
jb     0x46eda6
jae    0x46eda8
and    BYTE PTR [eax],al
popa
add    BYTE PTR [edx+0x0],dh
add    BYTE PTR gs:[eax],ah
add    BYTE PTR [ebp+0x0],dh
jae    0x46edb6
add    BYTE PTR gs:[eax+eax*1+0x20],ah
add    BYTE PTR [ecx+0x0],ch
outs   dx,BYTE PTR ds:[esi]
add    BYTE PTR [eax],ah
add    BYTE PTR [eax+eax*1+0x68],dh
add    BYTE PTR [ecx+0x0],ch
jae    0x46edca
and    BYTE PTR [eax],al
inc    ebp
add    BYTE PTR [ecx+0x0],ah
jae    0x46edd2
jns    0x46edd4
and    BYTE PTR [eax],al
inc    ebx
add    BYTE PTR [edx+0x0],dh
popa
add    BYTE PTR [ebx+0x0],ah
imul   eax,DWORD PTR [eax],0x4d
add    BYTE PTR [ebp+0x0],ah
and    BYTE PTR [eax],al
and    DWORD PTR [eax],eax
add    BYTE PTR [eax],al
add    BYTE PTR [eax],al
xor    edx,edx
mov    eax,DWORD PTR [eax+0x390]
call   0x438a1c
call   0x46ebbc
ret
nop
xor    edx,edx
mov    eax,DWORD PTR [eax+0x394]
call   0x438a1c
mov    eax,0x46ee24
call   0x43bef8
ret
mov    al,0x4
add    al,BYTE PTR [eax]
(bad)
(bad)
(bad)
dec    DWORD PTR ds:0x4e000000
add    BYTE PTR [edi+0x0],ch
sub    al,0x0
and    BYTE PTR [eax],al
outs   dx,BYTE PTR ds:[esi]
add    BYTE PTR [edi+0x0],ch
sub    al,0x0
and    BYTE PTR [eax],al
outs   dx,BYTE PTR ds:[esi]
add    BYTE PTR [edi+0x0],ch
add    BYTE PTR cs:[esi],ch
add    BYTE PTR [esi],ch
add    BYTE PTR [eax],al
