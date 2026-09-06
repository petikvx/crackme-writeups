
original/crackme:     file format elf64-x86-64


Disassembly of section .text:

00000000004000b0 <.text>:
  4000b0:	31 c9                	xor    ecx,ecx
  4000b2:	31 db                	xor    ebx,ebx
  4000b4:	31 ed                	xor    ebp,ebp
  4000b6:	41 be f0 01 00 00    	mov    r14d,0x1f0
  4000bc:	41 c1 ee 02          	shr    r14d,0x2
  4000c0:	67 8b 04 8d e8 08 60 	mov    eax,DWORD PTR [ecx*4+0x6008e8]
  4000c7:	00 
  4000c8:	0f b7 d0             	movzx  edx,ax
  4000cb:	c1 e8 10             	shr    eax,0x10
  4000ce:	e9 b0 00 00 00       	jmp    0x400183
  4000d3:	01 fa                	add    edx,edi
  4000d5:	a9 10 00 00 00       	test   eax,0x10
  4000da:	75 09                	jne    0x4000e5
  4000dc:	a9 08 00 00 00       	test   eax,0x8
  4000e1:	75 0a                	jne    0x4000ed
  4000e3:	eb 10                	jmp    0x4000f5
  4000e5:	67 8b 14 95 e8 08 60 	mov    edx,DWORD PTR [edx*4+0x6008e8]
  4000ec:	00 
  4000ed:	67 8b 14 95 e8 08 60 	mov    edx,DWORD PTR [edx*4+0x6008e8]
  4000f4:	00 
  4000f5:	0f b6 dc             	movzx  ebx,ah
  4000f8:	ff c1                	inc    ecx
  4000fa:	eb 73                	jmp    0x40016f
  4000fc:	ff 24 dd e0 04 60 00 	jmp    QWORD PTR [rbx*8+0x6004e0]
  400103:	e9 9a 00 00 00       	jmp    0x4001a2
  400108:	eb b6                	jmp    0x4000c0
  40010a:	b8 3c 00 00 00       	mov    eax,0x3c
  40010f:	bf 00 00 00 00       	mov    edi,0x0
  400114:	0f 05                	syscall
  400116:	50                   	push   rax
  400117:	51                   	push   rcx
  400118:	56                   	push   rsi
  400119:	41 50                	push   r8
  40011b:	41 51                	push   r9
  40011d:	41 52                	push   r10
  40011f:	41 53                	push   r11
  400121:	41 57                	push   r15
  400123:	57                   	push   rdi
  400124:	89 f8                	mov    eax,edi
  400126:	b9 09 00 00 00       	mov    ecx,0x9
  40012b:	48 83 ec 10          	sub    rsp,0x10
  40012f:	bf 0a 00 00 00       	mov    edi,0xa
  400134:	31 d2                	xor    edx,edx
  400136:	f7 f7                	div    edi
  400138:	83 c2 30             	add    edx,0x30
  40013b:	88 14 0c             	mov    BYTE PTR [rsp+rcx*1],dl
  40013e:	ff c9                	dec    ecx
  400140:	85 c0                	test   eax,eax
  400142:	75 f0                	jne    0x400134
  400144:	b8 01 00 00 00       	mov    eax,0x1
  400149:	bf 01 00 00 00       	mov    edi,0x1
  40014e:	48 8d 74 0c 01       	lea    rsi,[rsp+rcx*1+0x1]
  400153:	ba 09 00 00 00       	mov    edx,0x9
  400158:	29 ca                	sub    edx,ecx
  40015a:	0f 05                	syscall
  40015c:	48 83 c4 10          	add    rsp,0x10
  400160:	5f                   	pop    rdi
  400161:	41 5f                	pop    r15
  400163:	41 5b                	pop    r11
  400165:	41 5a                	pop    r10
  400167:	41 59                	pop    r9
  400169:	41 58                	pop    r8
  40016b:	5e                   	pop    rsi
  40016c:	59                   	pop    rcx
  40016d:	58                   	pop    rax
  40016e:	c3                   	ret
  40016f:	50                   	push   rax
  400170:	c1 e8 05             	shr    eax,0x5
  400173:	83 e0 07             	and    eax,0x7
  400176:	ff 14 c5 68 08 60 00 	call   QWORD PTR [rax*8+0x600868]
  40017d:	58                   	pop    rax
  40017e:	e9 79 ff ff ff       	jmp    0x4000fc
  400183:	50                   	push   rax
  400184:	83 e0 07             	and    eax,0x7
  400187:	89 c5                	mov    ebp,eax
  400189:	85 c0                	test   eax,eax
  40018b:	74 0d                	je     0x40019a
  40018d:	ff 14 c5 68 08 60 00 	call   QWORD PTR [rax*8+0x600868]
  400194:	58                   	pop    rax
  400195:	e9 39 ff ff ff       	jmp    0x4000d3
  40019a:	31 ff                	xor    edi,edi
  40019c:	58                   	pop    rax
  40019d:	e9 31 ff ff ff       	jmp    0x4000d3
  4001a2:	c1 e8 05             	shr    eax,0x5
  4001a5:	83 e0 07             	and    eax,0x7
  4001a8:	ff 14 c5 a8 08 60 00 	call   QWORD PTR [rax*8+0x6008a8]
  4001af:	e9 54 ff ff ff       	jmp    0x400108
  4001b4:	44 89 c7             	mov    edi,r8d
  4001b7:	c3                   	ret
  4001b8:	44 89 cf             	mov    edi,r9d
  4001bb:	c3                   	ret
  4001bc:	44 89 d7             	mov    edi,r10d
  4001bf:	c3                   	ret
  4001c0:	44 89 df             	mov    edi,r11d
  4001c3:	c3                   	ret
  4001c4:	44 89 e7             	mov    edi,r12d
  4001c7:	c3                   	ret
  4001c8:	44 89 ef             	mov    edi,r13d
  4001cb:	c3                   	ret
  4001cc:	44 89 f7             	mov    edi,r14d
  4001cf:	c3                   	ret
  4001d0:	44 89 ff             	mov    edi,r15d
  4001d3:	c3                   	ret
  4001d4:	41 89 f8             	mov    r8d,edi
  4001d7:	c3                   	ret
  4001d8:	41 89 f9             	mov    r9d,edi
  4001db:	c3                   	ret
  4001dc:	41 89 fa             	mov    r10d,edi
  4001df:	c3                   	ret
  4001e0:	41 89 fb             	mov    r11d,edi
  4001e3:	c3                   	ret
  4001e4:	41 89 fc             	mov    r12d,edi
  4001e7:	c3                   	ret
  4001e8:	41 89 fd             	mov    r13d,edi
  4001eb:	c3                   	ret
  4001ec:	41 89 fe             	mov    r14d,edi
  4001ef:	c3                   	ret
  4001f0:	41 89 ff             	mov    r15d,edi
  4001f3:	c3                   	ret
  4001f4:	e9 0a ff ff ff       	jmp    0x400103
  4001f9:	67 89 3c 95 e8 08 60 	mov    DWORD PTR [edx*4+0x6008e8],edi
  400200:	00 
  400201:	e9 fd fe ff ff       	jmp    0x400103
  400206:	89 d7                	mov    edi,edx
  400208:	e9 f6 fe ff ff       	jmp    0x400103
  40020d:	48 83 fa 01          	cmp    rdx,0x1
  400211:	74 0b                	je     0x40021e
  400213:	48 83 fa 06          	cmp    rdx,0x6
  400217:	74 0a                	je     0x400223
  400219:	e9 e5 fe ff ff       	jmp    0x400103
  40021e:	e9 e0 fe ff ff       	jmp    0x400103
  400223:	31 ff                	xor    edi,edi
  400225:	50                   	push   rax
  400226:	51                   	push   rcx
  400227:	56                   	push   rsi
  400228:	41 50                	push   r8
  40022a:	41 51                	push   r9
  40022c:	41 52                	push   r10
  40022e:	41 53                	push   r11
  400230:	41 57                	push   r15
  400232:	57                   	push   rdi
  400233:	48 31 c0             	xor    rax,rax
  400236:	48 89 e6             	mov    rsi,rsp
  400239:	ba 01 00 00 00       	mov    edx,0x1
  40023e:	0f 05                	syscall
  400240:	5f                   	pop    rdi
  400241:	41 5f                	pop    r15
  400243:	41 5b                	pop    r11
  400245:	41 5a                	pop    r10
  400247:	41 59                	pop    r9
  400249:	41 58                	pop    r8
  40024b:	5e                   	pop    rsi
  40024c:	59                   	pop    rcx
  40024d:	58                   	pop    rax
  40024e:	e9 b0 fe ff ff       	jmp    0x400103
  400253:	48 83 fa 00          	cmp    rdx,0x0
  400257:	74 0b                	je     0x400264
  400259:	48 83 fa 07          	cmp    rdx,0x7
  40025d:	74 0f                	je     0x40026e
  40025f:	e9 9f fe ff ff       	jmp    0x400103
  400264:	e8 ad fe ff ff       	call   0x400116
  400269:	e9 95 fe ff ff       	jmp    0x400103
  40026e:	50                   	push   rax
  40026f:	51                   	push   rcx
  400270:	56                   	push   rsi
  400271:	41 50                	push   r8
  400273:	41 51                	push   r9
  400275:	41 52                	push   r10
  400277:	41 53                	push   r11
  400279:	41 57                	push   r15
  40027b:	57                   	push   rdi
  40027c:	b8 01 00 00 00       	mov    eax,0x1
  400281:	bf 01 00 00 00       	mov    edi,0x1
  400286:	48 89 e6             	mov    rsi,rsp
  400289:	ba 01 00 00 00       	mov    edx,0x1
  40028e:	0f 05                	syscall
  400290:	5f                   	pop    rdi
  400291:	41 5f                	pop    r15
  400293:	41 5b                	pop    r11
  400295:	41 5a                	pop    r10
  400297:	41 59                	pop    r9
  400299:	41 58                	pop    r8
  40029b:	5e                   	pop    rsi
  40029c:	59                   	pop    rcx
  40029d:	58                   	pop    rax
  40029e:	e9 60 fe ff ff       	jmp    0x400103
  4002a3:	01 d7                	add    edi,edx
  4002a5:	e9 59 fe ff ff       	jmp    0x400103
  4002aa:	29 d7                	sub    edi,edx
  4002ac:	e9 52 fe ff ff       	jmp    0x400103
  4002b1:	50                   	push   rax
  4002b2:	89 f8                	mov    eax,edi
  4002b4:	f7 e2                	mul    edx
  4002b6:	89 c7                	mov    edi,eax
  4002b8:	58                   	pop    rax
  4002b9:	e9 45 fe ff ff       	jmp    0x400103
  4002be:	50                   	push   rax
  4002bf:	89 f8                	mov    eax,edi
  4002c1:	89 d7                	mov    edi,edx
  4002c3:	31 d2                	xor    edx,edx
  4002c5:	f7 f7                	div    edi
  4002c7:	89 c7                	mov    edi,eax
  4002c9:	58                   	pop    rax
  4002ca:	e9 34 fe ff ff       	jmp    0x400103
  4002cf:	50                   	push   rax
  4002d0:	89 f8                	mov    eax,edi
  4002d2:	89 d7                	mov    edi,edx
  4002d4:	31 d2                	xor    edx,edx
  4002d6:	f7 f7                	div    edi
  4002d8:	89 d7                	mov    edi,edx
  4002da:	58                   	pop    rax
  4002db:	e9 23 fe ff ff       	jmp    0x400103
  4002e0:	21 d7                	and    edi,edx
  4002e2:	e9 1c fe ff ff       	jmp    0x400103
  4002e7:	09 d7                	or     edi,edx
  4002e9:	e9 15 fe ff ff       	jmp    0x400103
  4002ee:	31 d7                	xor    edi,edx
  4002f0:	e9 0e fe ff ff       	jmp    0x400103
  4002f5:	51                   	push   rcx
  4002f6:	89 d1                	mov    ecx,edx
  4002f8:	d3 e7                	shl    edi,cl
  4002fa:	59                   	pop    rcx
  4002fb:	e9 03 fe ff ff       	jmp    0x400103
  400300:	51                   	push   rcx
  400301:	89 d1                	mov    ecx,edx
  400303:	d3 ff                	sar    edi,cl
  400305:	59                   	pop    rcx
  400306:	e9 f8 fd ff ff       	jmp    0x400103
  40030b:	83 f7 ff             	xor    edi,0xffffffff
  40030e:	e9 f0 fd ff ff       	jmp    0x400103
  400313:	e9 eb fd ff ff       	jmp    0x400103
  400318:	31 f6                	xor    esi,esi
  40031a:	89 fe                	mov    esi,edi
  40031c:	29 d6                	sub    esi,edx
  40031e:	e9 e0 fd ff ff       	jmp    0x400103
  400323:	89 d1                	mov    ecx,edx
  400325:	e9 d9 fd ff ff       	jmp    0x400103
  40032a:	83 ff 00             	cmp    edi,0x0
  40032d:	0f 8d d0 fd ff ff    	jge    0x400103
  400333:	89 d1                	mov    ecx,edx
  400335:	e9 c9 fd ff ff       	jmp    0x400103
  40033a:	83 ff 00             	cmp    edi,0x0
  40033d:	0f 85 c0 fd ff ff    	jne    0x400103
  400343:	89 d1                	mov    ecx,edx
  400345:	e9 b9 fd ff ff       	jmp    0x400103
  40034a:	83 ff 00             	cmp    edi,0x0
  40034d:	0f 8e b0 fd ff ff    	jle    0x400103
  400353:	89 d1                	mov    ecx,edx
  400355:	e9 a9 fd ff ff       	jmp    0x400103
  40035a:	83 ff 00             	cmp    edi,0x0
  40035d:	0f 8c a0 fd ff ff    	jl     0x400103
  400363:	89 d1                	mov    ecx,edx
  400365:	e9 99 fd ff ff       	jmp    0x400103
  40036a:	83 ff 00             	cmp    edi,0x0
  40036d:	0f 84 90 fd ff ff    	je     0x400103
  400373:	89 d1                	mov    ecx,edx
  400375:	e9 89 fd ff ff       	jmp    0x400103
  40037a:	83 ff 00             	cmp    edi,0x0
  40037d:	0f 8f 80 fd ff ff    	jg     0x400103
  400383:	89 d1                	mov    ecx,edx
  400385:	e9 79 fd ff ff       	jmp    0x400103
  40038a:	83 fe 00             	cmp    esi,0x0
  40038d:	0f 8d 70 fd ff ff    	jge    0x400103
  400393:	89 d1                	mov    ecx,edx
  400395:	e9 69 fd ff ff       	jmp    0x400103
  40039a:	83 fe 00             	cmp    esi,0x0
  40039d:	0f 85 60 fd ff ff    	jne    0x400103
  4003a3:	89 d1                	mov    ecx,edx
  4003a5:	e9 59 fd ff ff       	jmp    0x400103
  4003aa:	83 fe 00             	cmp    esi,0x0
  4003ad:	0f 8e 50 fd ff ff    	jle    0x400103
  4003b3:	89 d1                	mov    ecx,edx
  4003b5:	e9 49 fd ff ff       	jmp    0x400103
  4003ba:	83 fe 00             	cmp    esi,0x0
  4003bd:	0f 8c 40 fd ff ff    	jl     0x400103
  4003c3:	89 d1                	mov    ecx,edx
  4003c5:	e9 39 fd ff ff       	jmp    0x400103
  4003ca:	83 fe 00             	cmp    esi,0x0
  4003cd:	0f 84 30 fd ff ff    	je     0x400103
  4003d3:	89 d1                	mov    ecx,edx
  4003d5:	e9 29 fd ff ff       	jmp    0x400103
  4003da:	83 fe 00             	cmp    esi,0x0
  4003dd:	0f 8f 20 fd ff ff    	jg     0x400103
  4003e3:	89 d1                	mov    ecx,edx
  4003e5:	e9 19 fd ff ff       	jmp    0x400103
  4003ea:	67 89 0c bd ec 08 60 	mov    DWORD PTR [edi*4+0x6008ec],ecx
  4003f1:	00 
  4003f2:	67 44 89 3c bd f0 08 	mov    DWORD PTR [edi*4+0x6008f0],r15d
  4003f9:	60 00 
  4003fb:	83 c7 02             	add    edi,0x2
  4003fe:	41 89 ff             	mov    r15d,edi
  400401:	89 d1                	mov    ecx,edx
  400403:	e9 fb fc ff ff       	jmp    0x400103
  400408:	83 ef 02             	sub    edi,0x2
  40040b:	67 8b 0c bd ec 08 60 	mov    ecx,DWORD PTR [edi*4+0x6008ec]
  400412:	00 
  400413:	67 44 8b 3c bd f0 08 	mov    r15d,DWORD PTR [edi*4+0x6008f0]
  40041a:	60 00 
  40041c:	29 d7                	sub    edi,edx
  40041e:	e9 e0 fc ff ff       	jmp    0x400103
  400423:	83 c7 01             	add    edi,0x1
  400426:	67 89 14 bd e8 08 60 	mov    DWORD PTR [edi*4+0x6008e8],edx
  40042d:	00 
  40042e:	e9 d0 fc ff ff       	jmp    0x400103
  400433:	57                   	push   rdi
  400434:	67 8b 3c bd e8 08 60 	mov    edi,DWORD PTR [edi*4+0x6008e8]
  40043b:	00 
  40043c:	48 85 ed             	test   rbp,rbp
  40043f:	74 07                	je     0x400448
  400441:	ff 14 ed a8 08 60 00 	call   QWORD PTR [rbp*8+0x6008a8]
  400448:	5f                   	pop    rdi
  400449:	83 ef 01             	sub    edi,0x1
  40044c:	e9 b2 fc ff ff       	jmp    0x400103
  400451:	67 44 89 04 bd ec 08 	mov    DWORD PTR [edi*4+0x6008ec],r8d
  400458:	60 00 
  40045a:	67 44 89 0c bd f0 08 	mov    DWORD PTR [edi*4+0x6008f0],r9d
  400461:	60 00 
  400463:	67 44 89 14 bd f4 08 	mov    DWORD PTR [edi*4+0x6008f4],r10d
  40046a:	60 00 
  40046c:	67 44 89 1c bd f8 08 	mov    DWORD PTR [edi*4+0x6008f8],r11d
  400473:	60 00 
  400475:	67 44 89 24 bd fc 08 	mov    DWORD PTR [edi*4+0x6008fc],r12d
  40047c:	60 00 
  40047e:	67 44 89 2c bd 00 09 	mov    DWORD PTR [edi*4+0x600900],r13d
  400485:	60 00 
  400487:	83 c7 06             	add    edi,0x6
  40048a:	e9 74 fc ff ff       	jmp    0x400103
  40048f:	83 ef 06             	sub    edi,0x6
  400492:	67 44 8b 04 bd ec 08 	mov    r8d,DWORD PTR [edi*4+0x6008ec]
  400499:	60 00 
  40049b:	67 44 8b 0c bd f0 08 	mov    r9d,DWORD PTR [edi*4+0x6008f0]
  4004a2:	60 00 
  4004a4:	67 44 8b 14 bd f4 08 	mov    r10d,DWORD PTR [edi*4+0x6008f4]
  4004ab:	60 00 
  4004ad:	67 44 8b 1c bd f8 08 	mov    r11d,DWORD PTR [edi*4+0x6008f8]
  4004b4:	60 00 
  4004b6:	67 44 8b 24 bd fc 08 	mov    r12d,DWORD PTR [edi*4+0x6008fc]
  4004bd:	60 00 
  4004bf:	67 44 8b 2c bd 00 09 	mov    r13d,DWORD PTR [edi*4+0x600900]
  4004c6:	60 00 
  4004c8:	e9 36 fc ff ff       	jmp    0x400103
  4004cd:	83 fa 0b             	cmp    edx,0xb
  4004d0:	0f 84 34 fc ff ff    	je     0x40010a
  4004d6:	e9 28 fc ff ff       	jmp    0x400103
  4004db:	e9 23 fc ff ff       	jmp    0x400103
