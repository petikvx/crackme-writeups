    1000:	sub    rsp,0x8
    1004:	mov    rax,QWORD PTR [rip+0x2fdd]        # 3fe8 <__cxa_finalize@plt+0x2f78>
    100b:	test   rax,rax
    100e:	je     1012 <puts@plt-0x1e>
    1010:	call   rax
    1012:	add    rsp,0x8
    1016:	ret
    1020:	push   QWORD PTR [rip+0x2f82]        # 3fa8 <__cxa_finalize@plt+0x2f38>
    1026:	jmp    QWORD PTR [rip+0x2f84]        # 3fb0 <__cxa_finalize@plt+0x2f40>
    1030:	jmp    QWORD PTR [rip+0x2f82]        # 3fb8 <__cxa_finalize@plt+0x2f48>
    1036:	push   0x0
    103b:	jmp    1020 <puts@plt-0x10>
    1040:	jmp    QWORD PTR [rip+0x2f7a]        # 3fc0 <__cxa_finalize@plt+0x2f50>
    1046:	push   0x1
    104b:	jmp    1020 <puts@plt-0x10>
    1050:	jmp    QWORD PTR [rip+0x2f72]        # 3fc8 <__cxa_finalize@plt+0x2f58>
    1056:	push   0x2
    105b:	jmp    1020 <puts@plt-0x10>
    1060:	jmp    QWORD PTR [rip+0x2f6a]        # 3fd0 <__cxa_finalize@plt+0x2f60>
    1066:	push   0x3
    106b:	jmp    1020 <puts@plt-0x10>
    1070:	jmp    QWORD PTR [rip+0x2f82]        # 3ff8 <__cxa_finalize@plt+0x2f88>
    1076:	xchg   ax,ax
    1080:	push   rbx
    1081:	sub    rsp,0x110
    1088:	mov    rdi,QWORD PTR fs:0x28
    1091:	mov    QWORD PTR [rsp+0x108],rdi
    1099:	lea    rdi,[rip+0xf7c]        # 201c <__cxa_finalize@plt+0xfac>
    10a0:	call   1030 <puts@plt>
    10a5:	xor    eax,eax
    10a7:	mov    rsi,rsp
    10aa:	lea    rdi,[rip+0xf7c]        # 202d <__cxa_finalize@plt+0xfbd>
    10b1:	call   1060 <__isoc23_scanf@plt>
    10b6:	cmp    eax,0x1
    10b9:	je     10dc <__cxa_finalize@plt+0x6c>
    10bb:	mov    eax,0x1
    10c0:	mov    rdx,QWORD PTR [rsp+0x108]
    10c8:	sub    rdx,QWORD PTR fs:0x28
    10d1:	jne    10e8 <__cxa_finalize@plt+0x78>
    10d3:	add    rsp,0x110
    10da:	pop    rbx
    10db:	ret
    10dc:	mov    rdi,rsp
    10df:	call   1200 <__cxa_finalize@plt+0x190>
    10e4:	xor    eax,eax
    10e6:	jmp    10c0 <__cxa_finalize@plt+0x50>
    10e8:	call   1050 <__stack_chk_fail@plt>
    10f0:	xor    ebp,ebp
    10f2:	mov    r9,rdx
    10f5:	pop    rsi
    10f6:	mov    rdx,rsp
    10f9:	and    rsp,0xfffffffffffffff0
    10fd:	push   rax
    10fe:	push   rsp
    10ff:	xor    r8d,r8d
    1102:	xor    ecx,ecx
    1104:	lea    rdi,[rip+0xffffffffffffff75]        # 1080 <__cxa_finalize@plt+0x10>
    110b:	call   QWORD PTR [rip+0x2ec7]        # 3fd8 <__cxa_finalize@plt+0x2f68>
    1111:	hlt
    1120:	lea    rdi,[rip+0x2ee9]        # 4010 <__cxa_finalize@plt+0x2fa0>
    1127:	lea    rax,[rip+0x2ee2]        # 4010 <__cxa_finalize@plt+0x2fa0>
    112e:	cmp    rax,rdi
    1131:	je     1148 <__cxa_finalize@plt+0xd8>
    1133:	mov    rax,QWORD PTR [rip+0x2ea6]        # 3fe0 <__cxa_finalize@plt+0x2f70>
    113a:	test   rax,rax
    113d:	je     1148 <__cxa_finalize@plt+0xd8>
    113f:	jmp    rax
    1148:	ret
    1150:	lea    rdi,[rip+0x2eb9]        # 4010 <__cxa_finalize@plt+0x2fa0>
    1157:	lea    rsi,[rip+0x2eb2]        # 4010 <__cxa_finalize@plt+0x2fa0>
    115e:	sub    rsi,rdi
    1161:	mov    rax,rsi
    1164:	shr    rsi,0x3f
    1168:	sar    rax,0x3
    116c:	add    rsi,rax
    116f:	sar    rsi,1
    1172:	je     1188 <__cxa_finalize@plt+0x118>
    1174:	mov    rax,QWORD PTR [rip+0x2e75]        # 3ff0 <__cxa_finalize@plt+0x2f80>
    117b:	test   rax,rax
    117e:	je     1188 <__cxa_finalize@plt+0x118>
    1180:	jmp    rax
    1188:	ret
    1190:	endbr64
    1194:	cmp    BYTE PTR [rip+0x2e75],0x0        # 4010 <__cxa_finalize@plt+0x2fa0>
    119b:	jne    11c8 <__cxa_finalize@plt+0x158>
    119d:	push   rbp
    119e:	cmp    QWORD PTR [rip+0x2e52],0x0        # 3ff8 <__cxa_finalize@plt+0x2f88>
    11a6:	mov    rbp,rsp
    11a9:	je     11b7 <__cxa_finalize@plt+0x147>
    11ab:	mov    rdi,QWORD PTR [rip+0x2e56]        # 4008 <__cxa_finalize@plt+0x2f98>
    11b2:	call   1070 <__cxa_finalize@plt>
    11b7:	call   1120 <__cxa_finalize@plt+0xb0>
    11bc:	mov    BYTE PTR [rip+0x2e4d],0x1        # 4010 <__cxa_finalize@plt+0x2fa0>
    11c3:	pop    rbp
    11c4:	ret
    11c8:	ret
    11d0:	endbr64
    11d4:	jmp    1150 <__cxa_finalize@plt+0xe0>
    1200:	movabs rax,0xc958122179310ac0
    120a:	push   rbx
    120b:	sub    rsp,0x70
    120f:	movdqa xmm0,XMMWORD PTR [rip+0xe49]        # 2060 <__cxa_finalize@plt+0xff0>
    1217:	mov    rbx,QWORD PTR fs:0x28
    1220:	mov    QWORD PTR [rsp+0x68],rbx
    1225:	mov    rbx,rdi
    1228:	movaps XMMWORD PTR [rsp+0x30],xmm0
    122d:	movdqa xmm0,XMMWORD PTR [rip+0xe3b]        # 2070 <__cxa_finalize@plt+0x1000>
    1235:	movaps XMMWORD PTR [rsp+0x40],xmm0
    123a:	movdqa xmm0,XMMWORD PTR [rip+0xe3e]        # 2080 <__cxa_finalize@plt+0x1010>
    1242:	movaps XMMWORD PTR [rsp+0x50],xmm0
    1247:	movdqa xmm0,XMMWORD PTR [rip+0xe41]        # 2090 <__cxa_finalize@plt+0x1020>
    124f:	mov    QWORD PTR [rsp+0x5d],rax
    1254:	movabs rax,0x6533425f4f545f64
    125e:	movaps XMMWORD PTR [rsp],xmm0
    1262:	movdqa xmm0,XMMWORD PTR [rip+0xe36]        # 20a0 <__cxa_finalize@plt+0x1030>
    126a:	movaps XMMWORD PTR [rsp+0x10],xmm0
    126f:	mov    QWORD PTR [rsp+0x1d],rax
    1274:	call   1040 <strlen@plt>
    1279:	cmp    rax,0x35
    127d:	jne    1318 <__cxa_finalize@plt+0x2a8>
    1283:	lea    rsi,[rsp+0x30]
    1288:	xor    ecx,ecx
    128a:	mov    eax,0x49
    128f:	movabs rdi,0xdd67c8a60dd67c8b
    1299:	jmp    12ea <__cxa_finalize@plt+0x27a>
    12c0:	add    rcx,0x1
    12c4:	cmp    rcx,0x35
    12c8:	je     1340 <__cxa_finalize@plt+0x2d0>
    12ca:	mov    rax,rcx
    12cd:	add    rsi,0x1
    12d1:	mul    rdi
    12d4:	shr    rdx,0x5
    12d8:	lea    rax,[rdx+rdx*8]
    12dc:	lea    rdx,[rdx+rax*4]
    12e0:	mov    rax,rcx
    12e3:	sub    rax,rdx
    12e6:	movzx  eax,BYTE PTR [rsp+rax*1]
    12ea:	xor    al,BYTE PTR [rbx+rcx*1]
    12ed:	rol    al,0x3
    12f0:	cmp    BYTE PTR [rsi],al
    12f2:	je     12c0 <__cxa_finalize@plt+0x250>
    12f4:	mov    rax,QWORD PTR [rsp+0x68]
    12f9:	sub    rax,QWORD PTR fs:0x28
    1302:	jne    1361 <__cxa_finalize@plt+0x2f1>
    1304:	add    rsp,0x70
    1308:	lea    rdi,[rip+0xd29]        # 2038 <__cxa_finalize@plt+0xfc8>
    130f:	pop    rbx
    1310:	jmp    1030 <puts@plt>
    1318:	mov    rax,QWORD PTR [rsp+0x68]
    131d:	sub    rax,QWORD PTR fs:0x28
    1326:	jne    1361 <__cxa_finalize@plt+0x2f1>
    1328:	add    rsp,0x70
    132c:	lea    rdi,[rip+0xcd1]        # 2004 <__cxa_finalize@plt+0xf94>
    1333:	pop    rbx
    1334:	jmp    1030 <puts@plt>
    1340:	mov    rax,QWORD PTR [rsp+0x68]
    1345:	sub    rax,QWORD PTR fs:0x28
    134e:	jne    1361 <__cxa_finalize@plt+0x2f1>
    1350:	add    rsp,0x70
    1354:	lea    rdi,[rip+0xcb8]        # 2013 <__cxa_finalize@plt+0xfa3>
    135b:	pop    rbx
    135c:	jmp    1030 <puts@plt>
    1361:	call   1050 <__stack_chk_fail@plt>
    1368:	sub    rsp,0x8
    136c:	add    rsp,0x8
    1370:	ret
