
/tmp/c3/TinyAsm/TinyAsm.exe:     file format pei-i386


Disassembly of section .text:

0040124e <.text+0x24e>:
  40124e:	81 7d 0c 11 01 00 00 	cmp    DWORD PTR [ebp+0xc],0x111
  401255:	0f 85 2c 01 00 00    	jne    0x401387
  40125b:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  40125e:	83 7d 14 00          	cmp    DWORD PTR [ebp+0x14],0x0
  401262:	0f 84 34 01 00 00    	je     0x40139c
  401268:	66 83 f8 02          	cmp    ax,0x2
  40126c:	0f 85 13 01 00 00    	jne    0x401385
  401272:	c1 e8 10             	shr    eax,0x10
  401275:	66 0b c0             	or     ax,ax
  401278:	0f 85 07 01 00 00    	jne    0x401385
  40127e:	be 0d 30 40 00       	mov    esi,0x40300d
  401283:	b9 0a 00 00 00       	mov    ecx,0xa
  401288:	8a 1e                	mov    bl,BYTE PTR [esi]
  40128a:	32 1d 34 30 40 00    	xor    bl,BYTE PTR ds:0x403034
  401290:	88 1e                	mov    BYTE PTR [esi],bl
  401292:	83 c6 01             	add    esi,0x1
  401295:	e2 f1                	loop   0x401288
  401297:	be 18 30 40 00       	mov    esi,0x403018
  40129c:	b9 0a 00 00 00       	mov    ecx,0xa
  4012a1:	8a 1e                	mov    bl,BYTE PTR [esi]
  4012a3:	32 1d 34 30 40 00    	xor    bl,BYTE PTR ds:0x403034
  4012a9:	88 1e                	mov    BYTE PTR [esi],bl
  4012ab:	83 c6 01             	add    esi,0x1
  4012ae:	e2 f1                	loop   0x4012a1
  4012b0:	e9 95 00 00 00       	jmp    0x40134a
  4012b5:	6a 08                	push   0x8
  4012b7:	68 2c 30 40 00       	push   0x40302c
  4012bc:	6a 01                	push   0x1
  4012be:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4012c1:	e8 ee 00 00 00       	call   0x4013b4
  4012c6:	be 2c 30 40 00       	mov    esi,0x40302c
  4012cb:	b9 07 00 00 00       	mov    ecx,0x7
  4012d0:	8a 1e                	mov    bl,BYTE PTR [esi]
  4012d2:	80 eb 00             	sub    bl,0x0
  4012d5:	74 44                	je     0x40131b
  4012d7:	83 c6 01             	add    esi,0x1
  4012da:	e2 f4                	loop   0x4012d0
  4012dc:	90                   	nop
  4012dd:	bf 2c 30 40 00       	mov    edi,0x40302c
  4012e2:	be 23 30 40 00       	mov    esi,0x403023
  4012e7:	b9 07 00 00 00       	mov    ecx,0x7
  4012ec:	8a 07                	mov    al,BYTE PTR [edi]
  4012ee:	8a 1e                	mov    bl,BYTE PTR [esi]
  4012f0:	fe c3                	inc    bl
  4012f2:	32 1d 34 30 40 00    	xor    bl,BYTE PTR ds:0x403034
  4012f8:	32 05 35 30 40 00    	xor    al,BYTE PTR ds:0x403035
  4012fe:	2a c3                	sub    al,bl
  401300:	75 19                	jne    0x40131b
  401302:	83 c6 01             	add    esi,0x1
  401305:	83 c7 01             	add    edi,0x1
  401308:	e2 e2                	loop   0x4012ec
  40130a:	eb 24                	jmp    0x401330
  40130c:	b9 08 00 00 00       	mov    ecx,0x8
  401311:	b3 02                	mov    bl,0x2
  401313:	80 fb 00             	cmp    bl,0x0
  401316:	83 c6 01             	add    esi,0x1
  401319:	e2 b5                	loop   0x4012d0
  40131b:	6a 00                	push   0x0
  40131d:	68 df 30 40 00       	push   0x4030df
  401322:	68 0d 30 40 00       	push   0x40300d
  401327:	6a 00                	push   0x0
  401329:	e8 9e 00 00 00       	call   0x4013cc
  40132e:	eb 13                	jmp    0x401343
  401330:	6a 00                	push   0x0
  401332:	68 df 30 40 00       	push   0x4030df
  401337:	68 18 30 40 00       	push   0x403018
  40133c:	6a 00                	push   0x0
  40133e:	e8 89 00 00 00       	call   0x4013cc
  401343:	6a 00                	push   0x0
  401345:	e8 ac 00 00 00       	call   0x4013f6
  40134a:	90                   	nop
  40134b:	90                   	nop
  40134c:	90                   	nop
  40134d:	90                   	nop
  40134e:	90                   	nop
  40134f:	bf 7e 12 40 00       	mov    edi,0x40127e
  401354:	bb f2 fc aa 5d       	mov    ebx,0x5daafcf2
  401359:	b9 4a 13 40 00       	mov    ecx,0x40134a
  40135e:	81 e9 7e 12 40 00    	sub    ecx,0x40127e
  401364:	8b 07                	mov    eax,DWORD PTR [edi]
  401366:	33 c3                	xor    eax,ebx
  401368:	d1 e3                	shl    ebx,1
  40136a:	33 d8                	xor    ebx,eax
  40136c:	47                   	inc    edi
  40136d:	e2 f5                	loop   0x401364
  40136f:	2b 05 09 30 40 00    	sub    eax,DWORD PTR ds:0x403009
  401375:	0f 84 3a ff ff ff    	je     0x4012b5
  40137b:	eb 9e                	jmp    0x40131b
  40137d:	6a 00                	push   0x0
  40137f:	e8 72 00 00 00       	call   0x4013f6
  401384:	90                   	nop
  401385:	eb 15                	jmp    0x40139c
  401387:	ff 75 14             	push   DWORD PTR [ebp+0x14]
  40138a:	ff 75 10             	push   DWORD PTR [ebp+0x10]
  40138d:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  401390:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401393:	e8 10 00 00 00       	call   0x4013a8
  401398:	c9                   	leave
  401399:	c2 10 00             	ret    0x10
  40139c:	33 c0                	xor    eax,eax
  40139e:	c9                   	leave
  40139f:	c2 10 00             	ret    0x10
