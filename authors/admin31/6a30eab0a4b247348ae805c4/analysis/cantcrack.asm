
cantcrack.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	40 53                	rex push rbx
   140001002:	48 83 ec 20          	sub    rsp,0x20
   140001006:	48 8b d9             	mov    rbx,rcx
   140001009:	48 8b c2             	mov    rax,rdx
   14000100c:	48 8d 0d d5 32 00 00 	lea    rcx,[rip+0x32d5]        # 0x1400042e8
   140001013:	0f 57 c0             	xorps  xmm0,xmm0
   140001016:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000101a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000101d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001021:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001024:	ff 15 ce 30 00 00    	call   QWORD PTR [rip+0x30ce]        # 0x1400040f8
   14000102a:	48 8b c3             	mov    rax,rbx
   14000102d:	48 83 c4 20          	add    rsp,0x20
   140001031:	5b                   	pop    rbx
   140001032:	c3                   	ret
   140001033:	cc                   	int3
   140001034:	cc                   	int3
   140001035:	cc                   	int3
   140001036:	cc                   	int3
   140001037:	cc                   	int3
   140001038:	cc                   	int3
   140001039:	cc                   	int3
   14000103a:	cc                   	int3
   14000103b:	cc                   	int3
   14000103c:	cc                   	int3
   14000103d:	cc                   	int3
   14000103e:	cc                   	int3
   14000103f:	cc                   	int3
   140001040:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   140001044:	48 8d 05 05 33 00 00 	lea    rax,[rip+0x3305]        # 0x140004350
   14000104b:	48 85 d2             	test   rdx,rdx
   14000104e:	48 0f 45 c2          	cmovne rax,rdx
   140001052:	c3                   	ret
   140001053:	cc                   	int3
   140001054:	cc                   	int3
   140001055:	cc                   	int3
   140001056:	cc                   	int3
   140001057:	cc                   	int3
   140001058:	cc                   	int3
   140001059:	cc                   	int3
   14000105a:	cc                   	int3
   14000105b:	cc                   	int3
   14000105c:	cc                   	int3
   14000105d:	cc                   	int3
   14000105e:	cc                   	int3
   14000105f:	cc                   	int3
   140001060:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140001065:	57                   	push   rdi
   140001066:	48 83 ec 20          	sub    rsp,0x20
   14000106a:	48 8d 05 77 32 00 00 	lea    rax,[rip+0x3277]        # 0x1400042e8
   140001071:	48 8b f9             	mov    rdi,rcx
   140001074:	48 89 01             	mov    QWORD PTR [rcx],rax
   140001077:	8b da                	mov    ebx,edx
   140001079:	48 83 c1 08          	add    rcx,0x8
   14000107d:	ff 15 7d 30 00 00    	call   QWORD PTR [rip+0x307d]        # 0x140004100
   140001083:	f6 c3 01             	test   bl,0x1
   140001086:	74 0d                	je     0x140001095
   140001088:	ba 18 00 00 00       	mov    edx,0x18
   14000108d:	48 8b cf             	mov    rcx,rdi
   140001090:	e8 ab 10 00 00       	call   0x140002140
   140001095:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000109a:	48 8b c7             	mov    rax,rdi
   14000109d:	48 83 c4 20          	add    rsp,0x20
   1400010a1:	5f                   	pop    rdi
   1400010a2:	c3                   	ret
   1400010a3:	cc                   	int3
   1400010a4:	cc                   	int3
   1400010a5:	cc                   	int3
   1400010a6:	cc                   	int3
   1400010a7:	cc                   	int3
   1400010a8:	cc                   	int3
   1400010a9:	cc                   	int3
   1400010aa:	cc                   	int3
   1400010ab:	cc                   	int3
   1400010ac:	cc                   	int3
   1400010ad:	cc                   	int3
   1400010ae:	cc                   	int3
   1400010af:	cc                   	int3
   1400010b0:	48 8d 05 31 32 00 00 	lea    rax,[rip+0x3231]        # 0x1400042e8
   1400010b7:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010ba:	48 83 c1 08          	add    rcx,0x8
   1400010be:	48 ff 25 3b 30 00 00 	rex.W jmp QWORD PTR [rip+0x303b]        # 0x140004100
   1400010c5:	cc                   	int3
   1400010c6:	cc                   	int3
   1400010c7:	cc                   	int3
   1400010c8:	cc                   	int3
   1400010c9:	cc                   	int3
   1400010ca:	cc                   	int3
   1400010cb:	cc                   	int3
   1400010cc:	cc                   	int3
   1400010cd:	cc                   	int3
   1400010ce:	cc                   	int3
   1400010cf:	cc                   	int3
   1400010d0:	48 8d 05 91 32 00 00 	lea    rax,[rip+0x3291]        # 0x140004368
   1400010d7:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   1400010de:	00 
   1400010df:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   1400010e3:	48 8d 05 3e 32 00 00 	lea    rax,[rip+0x323e]        # 0x140004328
   1400010ea:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010ed:	48 8b c1             	mov    rax,rcx
   1400010f0:	c3                   	ret
   1400010f1:	cc                   	int3
   1400010f2:	cc                   	int3
   1400010f3:	cc                   	int3
   1400010f4:	cc                   	int3
   1400010f5:	cc                   	int3
   1400010f6:	cc                   	int3
   1400010f7:	cc                   	int3
   1400010f8:	cc                   	int3
   1400010f9:	cc                   	int3
   1400010fa:	cc                   	int3
   1400010fb:	cc                   	int3
   1400010fc:	cc                   	int3
   1400010fd:	cc                   	int3
   1400010fe:	cc                   	int3
   1400010ff:	cc                   	int3
   140001100:	48 83 ec 48          	sub    rsp,0x48
   140001104:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001109:	e8 c2 ff ff ff       	call   0x1400010d0
   14000110e:	48 8d 15 2b 3f 00 00 	lea    rdx,[rip+0x3f2b]        # 0x140005040
   140001115:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000111a:	e8 a3 1b 00 00       	call   0x140002cc2
   14000111f:	cc                   	int3
   140001120:	40 53                	rex push rbx
   140001122:	48 83 ec 20          	sub    rsp,0x20
   140001126:	48 8b d9             	mov    rbx,rcx
   140001129:	48 8b c2             	mov    rax,rdx
   14000112c:	48 8d 0d b5 31 00 00 	lea    rcx,[rip+0x31b5]        # 0x1400042e8
   140001133:	0f 57 c0             	xorps  xmm0,xmm0
   140001136:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000113a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000113d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001141:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001144:	ff 15 ae 2f 00 00    	call   QWORD PTR [rip+0x2fae]        # 0x1400040f8
   14000114a:	48 8d 05 d7 31 00 00 	lea    rax,[rip+0x31d7]        # 0x140004328
   140001151:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001154:	48 8b c3             	mov    rax,rbx
   140001157:	48 83 c4 20          	add    rsp,0x20
   14000115b:	5b                   	pop    rbx
   14000115c:	c3                   	ret
   14000115d:	cc                   	int3
   14000115e:	cc                   	int3
   14000115f:	cc                   	int3
   140001160:	40 53                	rex push rbx
   140001162:	48 83 ec 20          	sub    rsp,0x20
   140001166:	48 8b d9             	mov    rbx,rcx
   140001169:	48 8b c2             	mov    rax,rdx
   14000116c:	48 8d 0d 75 31 00 00 	lea    rcx,[rip+0x3175]        # 0x1400042e8
   140001173:	0f 57 c0             	xorps  xmm0,xmm0
   140001176:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000117a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000117d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001181:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001184:	ff 15 6e 2f 00 00    	call   QWORD PTR [rip+0x2f6e]        # 0x1400040f8
   14000118a:	48 8d 05 6f 31 00 00 	lea    rax,[rip+0x316f]        # 0x140004300
   140001191:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001194:	48 8b c3             	mov    rax,rbx
   140001197:	48 83 c4 20          	add    rsp,0x20
   14000119b:	5b                   	pop    rbx
   14000119c:	c3                   	ret
   14000119d:	cc                   	int3
   14000119e:	cc                   	int3
   14000119f:	cc                   	int3
   1400011a0:	48 83 ec 28          	sub    rsp,0x28
   1400011a4:	48 8d 0d d5 31 00 00 	lea    rcx,[rip+0x31d5]        # 0x140004380
   1400011ab:	ff 15 ef 2e 00 00    	call   QWORD PTR [rip+0x2eef]        # 0x1400040a0
   1400011b1:	cc                   	int3
   1400011b2:	cc                   	int3
   1400011b3:	cc                   	int3
   1400011b4:	cc                   	int3
   1400011b5:	cc                   	int3
   1400011b6:	cc                   	int3
   1400011b7:	cc                   	int3
   1400011b8:	cc                   	int3
   1400011b9:	cc                   	int3
   1400011ba:	cc                   	int3
   1400011bb:	cc                   	int3
   1400011bc:	cc                   	int3
   1400011bd:	cc                   	int3
   1400011be:	cc                   	int3
   1400011bf:	cc                   	int3
   1400011c0:	40 55                	rex push rbp
   1400011c2:	53                   	push   rbx
   1400011c3:	56                   	push   rsi
   1400011c4:	57                   	push   rdi
   1400011c5:	41 54                	push   r12
   1400011c7:	41 55                	push   r13
   1400011c9:	41 56                	push   r14
   1400011cb:	41 57                	push   r15
   1400011cd:	48 8d 6c 24 e1       	lea    rbp,[rsp-0x1f]
   1400011d2:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
   1400011d9:	48 8b 05 20 4e 00 00 	mov    rax,QWORD PTR [rip+0x4e20]        # 0x140006000
   1400011e0:	48 33 c4             	xor    rax,rsp
   1400011e3:	48 89 45 0f          	mov    QWORD PTR [rbp+0xf],rax
   1400011e7:	48 8b da             	mov    rbx,rdx
   1400011ea:	4c 8b f9             	mov    r15,rcx
   1400011ed:	33 ff                	xor    edi,edi
   1400011ef:	48 83 7a 10 0e       	cmp    QWORD PTR [rdx+0x10],0xe
   1400011f4:	0f 85 29 05 00 00    	jne    0x140001723
   1400011fa:	48 8b 42 18          	mov    rax,QWORD PTR [rdx+0x18]
   1400011fe:	48 83 f8 0f          	cmp    rax,0xf
   140001202:	76 03                	jbe    0x140001207
   140001204:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   140001207:	80 7a 05 2d          	cmp    BYTE PTR [rdx+0x5],0x2d
   14000120b:	0f 85 12 05 00 00    	jne    0x140001723
   140001211:	48 8b cb             	mov    rcx,rbx
   140001214:	48 83 f8 0f          	cmp    rax,0xf
   140001218:	76 03                	jbe    0x14000121d
   14000121a:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   14000121d:	80 79 0a 2d          	cmp    BYTE PTR [rcx+0xa],0x2d
   140001221:	0f 85 fc 04 00 00    	jne    0x140001723
   140001227:	0f 57 c0             	xorps  xmm0,xmm0
   14000122a:	0f 11 45 af          	movups XMMWORD PTR [rbp-0x51],xmm0
   14000122e:	48 89 7d bf          	mov    QWORD PTR [rbp-0x41],rdi
   140001232:	48 89 7d c7          	mov    QWORD PTR [rbp-0x39],rdi
   140001236:	48 8b d3             	mov    rdx,rbx
   140001239:	48 83 f8 0f          	cmp    rax,0xf
   14000123d:	76 03                	jbe    0x140001242
   14000123f:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140001242:	41 b8 05 00 00 00    	mov    r8d,0x5
   140001248:	48 8d 4d af          	lea    rcx,[rbp-0x51]
   14000124c:	e8 1f 0b 00 00       	call   0x140001d70
   140001251:	90                   	nop
   140001252:	0f 57 c0             	xorps  xmm0,xmm0
   140001255:	0f 11 45 cf          	movups XMMWORD PTR [rbp-0x31],xmm0
   140001259:	48 89 7d df          	mov    QWORD PTR [rbp-0x21],rdi
   14000125d:	48 89 7d e7          	mov    QWORD PTR [rbp-0x19],rdi
   140001261:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
   140001265:	48 83 f8 06          	cmp    rax,0x6
   140001269:	0f 82 dc 04 00 00    	jb     0x14000174b
   14000126f:	48 83 c0 fa          	add    rax,0xfffffffffffffffa
   140001273:	41 b8 04 00 00 00    	mov    r8d,0x4
   140001279:	49 3b c0             	cmp    rax,r8
   14000127c:	4c 0f 42 c0          	cmovb  r8,rax
   140001280:	48 8b d3             	mov    rdx,rbx
   140001283:	48 83 7b 18 0f       	cmp    QWORD PTR [rbx+0x18],0xf
   140001288:	76 03                	jbe    0x14000128d
   14000128a:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   14000128d:	48 83 c2 06          	add    rdx,0x6
   140001291:	48 8d 4d cf          	lea    rcx,[rbp-0x31]
   140001295:	e8 d6 0a 00 00       	call   0x140001d70
   14000129a:	90                   	nop
   14000129b:	0f 57 c0             	xorps  xmm0,xmm0
   14000129e:	0f 11 45 ef          	movups XMMWORD PTR [rbp-0x11],xmm0
   1400012a2:	48 89 7d ff          	mov    QWORD PTR [rbp-0x1],rdi
   1400012a6:	48 89 7d 07          	mov    QWORD PTR [rbp+0x7],rdi
   1400012aa:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
   1400012ae:	48 83 f8 0b          	cmp    rax,0xb
   1400012b2:	0f 82 8d 04 00 00    	jb     0x140001745
   1400012b8:	48 83 c0 f5          	add    rax,0xfffffffffffffff5
   1400012bc:	41 b8 03 00 00 00    	mov    r8d,0x3
   1400012c2:	49 3b c0             	cmp    rax,r8
   1400012c5:	4c 0f 42 c0          	cmovb  r8,rax
   1400012c9:	48 83 7b 18 0f       	cmp    QWORD PTR [rbx+0x18],0xf
   1400012ce:	76 03                	jbe    0x1400012d3
   1400012d0:	48 8b 1b             	mov    rbx,QWORD PTR [rbx]
   1400012d3:	48 8d 53 0b          	lea    rdx,[rbx+0xb]
   1400012d7:	48 8d 4d ef          	lea    rcx,[rbp-0x11]
   1400012db:	e8 90 0a 00 00       	call   0x140001d70
   1400012e0:	90                   	nop
   1400012e1:	41 0f b6 07          	movzx  eax,BYTE PTR [r15]
   1400012e5:	34 37                	xor    al,0x37
   1400012e7:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   1400012eb:	41 0f b6 47 01       	movzx  eax,BYTE PTR [r15+0x1]
   1400012f0:	34 37                	xor    al,0x37
   1400012f2:	88 44 24 21          	mov    BYTE PTR [rsp+0x21],al
   1400012f6:	41 0f b6 47 02       	movzx  eax,BYTE PTR [r15+0x2]
   1400012fb:	34 37                	xor    al,0x37
   1400012fd:	88 44 24 22          	mov    BYTE PTR [rsp+0x22],al
   140001301:	41 0f b6 47 03       	movzx  eax,BYTE PTR [r15+0x3]
   140001306:	34 37                	xor    al,0x37
   140001308:	88 44 24 23          	mov    BYTE PTR [rsp+0x23],al
   14000130c:	41 0f b6 47 04       	movzx  eax,BYTE PTR [r15+0x4]
   140001311:	34 37                	xor    al,0x37
   140001313:	88 44 24 24          	mov    BYTE PTR [rsp+0x24],al
   140001317:	c6 44 24 25 00       	mov    BYTE PTR [rsp+0x25],0x0
   14000131c:	0f 57 c0             	xorps  xmm0,xmm0
   14000131f:	0f 11 44 24 28       	movups XMMWORD PTR [rsp+0x28],xmm0
   140001324:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140001329:	48 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],rdi
   14000132e:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001333:	e8 76 1c 00 00       	call   0x140002fae
   140001338:	4c 8b c0             	mov    r8,rax
   14000133b:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   140001340:	48 8d 4c 24 28       	lea    rcx,[rsp+0x28]
   140001345:	e8 26 0a 00 00       	call   0x140001d70
   14000134a:	4c 8b 6d 07          	mov    r13,QWORD PTR [rbp+0x7]
   14000134e:	4c 8b 75 ef          	mov    r14,QWORD PTR [rbp-0x11]
   140001352:	4c 8b 65 e7          	mov    r12,QWORD PTR [rbp-0x19]
   140001356:	48 8b 75 cf          	mov    rsi,QWORD PTR [rbp-0x31]
   14000135a:	48 8b 5d af          	mov    rbx,QWORD PTR [rbp-0x51]
   14000135e:	48 83 7d bf 05       	cmp    QWORD PTR [rbp-0x41],0x5
   140001363:	74 19                	je     0x14000137e
   140001365:	48 8b 54 24 40       	mov    rdx,QWORD PTR [rsp+0x40]
   14000136a:	48 83 fa 0f          	cmp    rdx,0xf
   14000136e:	0f 86 48 02 00 00    	jbe    0x1400015bc
   140001374:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140001379:	e9 11 02 00 00       	jmp    0x14000158f
   14000137e:	48 8d 54 24 28       	lea    rdx,[rsp+0x28]
   140001383:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   140001388:	4c 8b 54 24 40       	mov    r10,QWORD PTR [rsp+0x40]
   14000138d:	49 83 fa 0f          	cmp    r10,0xf
   140001391:	49 0f 47 d0          	cmova  rdx,r8
   140001395:	4c 8d 4d af          	lea    r9,[rbp-0x51]
   140001399:	48 83 7d c7 0f       	cmp    QWORD PTR [rbp-0x39],0xf
   14000139e:	4c 0f 47 cb          	cmova  r9,rbx
   1400013a2:	48 83 7c 24 38 05    	cmp    QWORD PTR [rsp+0x38],0x5
   1400013a8:	74 05                	je     0x1400013af
   1400013aa:	40 32 ff             	xor    dil,dil
   1400013ad:	eb 26                	jmp    0x1400013d5
   1400013af:	48 8b cf             	mov    rcx,rdi
   1400013b2:	41 0f b6 04 09       	movzx  eax,BYTE PTR [r9+rcx*1]
   1400013b7:	48 ff c1             	inc    rcx
   1400013ba:	3a 44 0a ff          	cmp    al,BYTE PTR [rdx+rcx*1-0x1]
   1400013be:	75 0a                	jne    0x1400013ca
   1400013c0:	48 83 f9 05          	cmp    rcx,0x5
   1400013c4:	75 ec                	jne    0x1400013b2
   1400013c6:	8b c7                	mov    eax,edi
   1400013c8:	eb 05                	jmp    0x1400013cf
   1400013ca:	1b c0                	sbb    eax,eax
   1400013cc:	83 c8 01             	or     eax,0x1
   1400013cf:	85 c0                	test   eax,eax
   1400013d1:	40 0f 94 c7          	sete   dil
   1400013d5:	49 83 fa 0f          	cmp    r10,0xf
   1400013d9:	76 31                	jbe    0x14000140c
   1400013db:	49 8d 52 01          	lea    rdx,[r10+0x1]
   1400013df:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400013e6:	72 1c                	jb     0x140001404
   1400013e8:	49 8b 40 f8          	mov    rax,QWORD PTR [r8-0x8]
   1400013ec:	4c 2b c0             	sub    r8,rax
   1400013ef:	49 83 e8 08          	sub    r8,0x8
   1400013f3:	49 83 f8 1f          	cmp    r8,0x1f
   1400013f7:	0f 87 0a 03 00 00    	ja     0x140001707
   1400013fd:	48 83 c2 27          	add    rdx,0x27
   140001401:	4c 8b c0             	mov    r8,rax
   140001404:	49 8b c8             	mov    rcx,r8
   140001407:	e8 34 0d 00 00       	call   0x140002140
   14000140c:	40 84 ff             	test   dil,dil
   14000140f:	0f 84 a7 01 00 00    	je     0x1400015bc
   140001415:	41 0f b6 47 05       	movzx  eax,BYTE PTR [r15+0x5]
   14000141a:	34 41                	xor    al,0x41
   14000141c:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   140001420:	41 0f b6 47 06       	movzx  eax,BYTE PTR [r15+0x6]
   140001425:	34 41                	xor    al,0x41
   140001427:	88 44 24 21          	mov    BYTE PTR [rsp+0x21],al
   14000142b:	41 0f b6 47 07       	movzx  eax,BYTE PTR [r15+0x7]
   140001430:	34 41                	xor    al,0x41
   140001432:	88 44 24 22          	mov    BYTE PTR [rsp+0x22],al
   140001436:	41 0f b6 47 08       	movzx  eax,BYTE PTR [r15+0x8]
   14000143b:	34 41                	xor    al,0x41
   14000143d:	88 44 24 23          	mov    BYTE PTR [rsp+0x23],al
   140001441:	c6 44 24 24 00       	mov    BYTE PTR [rsp+0x24],0x0
   140001446:	0f 57 c0             	xorps  xmm0,xmm0
   140001449:	0f 11 44 24 48       	movups XMMWORD PTR [rsp+0x48],xmm0
   14000144e:	33 ff                	xor    edi,edi
   140001450:	48 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],rdi
   140001455:	48 89 7d 87          	mov    QWORD PTR [rbp-0x79],rdi
   140001459:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000145e:	e8 4b 1b 00 00       	call   0x140002fae
   140001463:	4c 8b c0             	mov    r8,rax
   140001466:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   14000146b:	48 8d 4c 24 48       	lea    rcx,[rsp+0x48]
   140001470:	e8 fb 08 00 00       	call   0x140001d70
   140001475:	48 83 7d df 04       	cmp    QWORD PTR [rbp-0x21],0x4
   14000147a:	74 18                	je     0x140001494
   14000147c:	48 8b 55 87          	mov    rdx,QWORD PTR [rbp-0x79]
   140001480:	48 83 fa 0f          	cmp    rdx,0xf
   140001484:	0f 86 32 01 00 00    	jbe    0x1400015bc
   14000148a:	48 8b 4c 24 48       	mov    rcx,QWORD PTR [rsp+0x48]
   14000148f:	e9 fb 00 00 00       	jmp    0x14000158f
   140001494:	48 8d 54 24 48       	lea    rdx,[rsp+0x48]
   140001499:	4c 8b 44 24 48       	mov    r8,QWORD PTR [rsp+0x48]
   14000149e:	4c 8b 55 87          	mov    r10,QWORD PTR [rbp-0x79]
   1400014a2:	49 83 fa 0f          	cmp    r10,0xf
   1400014a6:	49 0f 47 d0          	cmova  rdx,r8
   1400014aa:	4c 8d 4d cf          	lea    r9,[rbp-0x31]
   1400014ae:	49 83 fc 0f          	cmp    r12,0xf
   1400014b2:	4c 0f 47 ce          	cmova  r9,rsi
   1400014b6:	48 83 7c 24 58 04    	cmp    QWORD PTR [rsp+0x58],0x4
   1400014bc:	75 26                	jne    0x1400014e4
   1400014be:	48 8b cf             	mov    rcx,rdi
   1400014c1:	41 0f b6 04 09       	movzx  eax,BYTE PTR [r9+rcx*1]
   1400014c6:	48 ff c1             	inc    rcx
   1400014c9:	3a 44 0a ff          	cmp    al,BYTE PTR [rdx+rcx*1-0x1]
   1400014cd:	75 0a                	jne    0x1400014d9
   1400014cf:	48 83 f9 04          	cmp    rcx,0x4
   1400014d3:	75 ec                	jne    0x1400014c1
   1400014d5:	8b c7                	mov    eax,edi
   1400014d7:	eb 05                	jmp    0x1400014de
   1400014d9:	1b c0                	sbb    eax,eax
   1400014db:	83 c8 01             	or     eax,0x1
   1400014de:	85 c0                	test   eax,eax
   1400014e0:	40 0f 94 c7          	sete   dil
   1400014e4:	49 83 fa 0f          	cmp    r10,0xf
   1400014e8:	76 31                	jbe    0x14000151b
   1400014ea:	49 8d 52 01          	lea    rdx,[r10+0x1]
   1400014ee:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400014f5:	72 1c                	jb     0x140001513
   1400014f7:	49 8b 40 f8          	mov    rax,QWORD PTR [r8-0x8]
   1400014fb:	4c 2b c0             	sub    r8,rax
   1400014fe:	49 83 e8 08          	sub    r8,0x8
   140001502:	49 83 f8 1f          	cmp    r8,0x1f
   140001506:	0f 87 fb 01 00 00    	ja     0x140001707
   14000150c:	48 83 c2 27          	add    rdx,0x27
   140001510:	4c 8b c0             	mov    r8,rax
   140001513:	49 8b c8             	mov    rcx,r8
   140001516:	e8 25 0c 00 00       	call   0x140002140
   14000151b:	40 84 ff             	test   dil,dil
   14000151e:	0f 84 98 00 00 00    	je     0x1400015bc
   140001524:	41 0f b6 47 09       	movzx  eax,BYTE PTR [r15+0x9]
   140001529:	34 23                	xor    al,0x23
   14000152b:	88 44 24 20          	mov    BYTE PTR [rsp+0x20],al
   14000152f:	41 0f b6 47 0a       	movzx  eax,BYTE PTR [r15+0xa]
   140001534:	34 23                	xor    al,0x23
   140001536:	88 44 24 21          	mov    BYTE PTR [rsp+0x21],al
   14000153a:	41 0f b6 47 0b       	movzx  eax,BYTE PTR [r15+0xb]
   14000153f:	34 23                	xor    al,0x23
   140001541:	88 44 24 22          	mov    BYTE PTR [rsp+0x22],al
   140001545:	c6 44 24 23 00       	mov    BYTE PTR [rsp+0x23],0x0
   14000154a:	0f 57 c0             	xorps  xmm0,xmm0
   14000154d:	0f 11 45 8f          	movups XMMWORD PTR [rbp-0x71],xmm0
   140001551:	33 ff                	xor    edi,edi
   140001553:	48 89 7d 9f          	mov    QWORD PTR [rbp-0x61],rdi
   140001557:	48 89 7d a7          	mov    QWORD PTR [rbp-0x59],rdi
   14000155b:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001560:	e8 49 1a 00 00       	call   0x140002fae
   140001565:	4c 8b c0             	mov    r8,rax
   140001568:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   14000156d:	48 8d 4d 8f          	lea    rcx,[rbp-0x71]
   140001571:	e8 fa 07 00 00       	call   0x140001d70
   140001576:	48 83 7d ff 03       	cmp    QWORD PTR [rbp-0x1],0x3
   14000157b:	0f 84 f3 00 00 00    	je     0x140001674
   140001581:	48 8b 55 a7          	mov    rdx,QWORD PTR [rbp-0x59]
   140001585:	48 83 fa 0f          	cmp    rdx,0xf
   140001589:	76 31                	jbe    0x1400015bc
   14000158b:	48 8b 4d 8f          	mov    rcx,QWORD PTR [rbp-0x71]
   14000158f:	48 ff c2             	inc    rdx
   140001592:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001599:	72 1c                	jb     0x1400015b7
   14000159b:	48 8b 41 f8          	mov    rax,QWORD PTR [rcx-0x8]
   14000159f:	48 2b c8             	sub    rcx,rax
   1400015a2:	48 83 e9 08          	sub    rcx,0x8
   1400015a6:	48 83 f9 1f          	cmp    rcx,0x1f
   1400015aa:	0f 87 57 01 00 00    	ja     0x140001707
   1400015b0:	48 83 c2 27          	add    rdx,0x27
   1400015b4:	48 8b c8             	mov    rcx,rax
   1400015b7:	e8 84 0b 00 00       	call   0x140002140
   1400015bc:	40 32 ff             	xor    dil,dil
   1400015bf:	49 83 fd 0f          	cmp    r13,0xf
   1400015c3:	76 32                	jbe    0x1400015f7
   1400015c5:	49 8d 55 01          	lea    rdx,[r13+0x1]
   1400015c9:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400015d0:	72 1c                	jb     0x1400015ee
   1400015d2:	49 8b 46 f8          	mov    rax,QWORD PTR [r14-0x8]
   1400015d6:	4c 2b f0             	sub    r14,rax
   1400015d9:	49 83 ee 08          	sub    r14,0x8
   1400015dd:	49 83 fe 1f          	cmp    r14,0x1f
   1400015e1:	0f 87 27 01 00 00    	ja     0x14000170e
   1400015e7:	48 83 c2 27          	add    rdx,0x27
   1400015eb:	4c 8b f0             	mov    r14,rax
   1400015ee:	49 8b ce             	mov    rcx,r14
   1400015f1:	e8 4a 0b 00 00       	call   0x140002140
   1400015f6:	90                   	nop
   1400015f7:	49 83 fc 0f          	cmp    r12,0xf
   1400015fb:	76 33                	jbe    0x140001630
   1400015fd:	49 8d 54 24 01       	lea    rdx,[r12+0x1]
   140001602:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001609:	72 1c                	jb     0x140001627
   14000160b:	48 8b 46 f8          	mov    rax,QWORD PTR [rsi-0x8]
   14000160f:	48 2b f0             	sub    rsi,rax
   140001612:	48 83 ee 08          	sub    rsi,0x8
   140001616:	48 83 fe 1f          	cmp    rsi,0x1f
   14000161a:	0f 87 f5 00 00 00    	ja     0x140001715
   140001620:	48 83 c2 27          	add    rdx,0x27
   140001624:	48 8b f0             	mov    rsi,rax
   140001627:	48 8b ce             	mov    rcx,rsi
   14000162a:	e8 11 0b 00 00       	call   0x140002140
   14000162f:	90                   	nop
   140001630:	48 8b 45 c7          	mov    rax,QWORD PTR [rbp-0x39]
   140001634:	48 83 f8 0f          	cmp    rax,0xf
   140001638:	76 31                	jbe    0x14000166b
   14000163a:	48 8d 50 01          	lea    rdx,[rax+0x1]
   14000163e:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001645:	72 1c                	jb     0x140001663
   140001647:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   14000164b:	48 2b d8             	sub    rbx,rax
   14000164e:	48 83 eb 08          	sub    rbx,0x8
   140001652:	48 83 fb 1f          	cmp    rbx,0x1f
   140001656:	0f 87 c0 00 00 00    	ja     0x14000171c
   14000165c:	48 83 c2 27          	add    rdx,0x27
   140001660:	48 8b d8             	mov    rbx,rax
   140001663:	48 8b cb             	mov    rcx,rbx
   140001666:	e8 d5 0a 00 00       	call   0x140002140
   14000166b:	40 0f b6 c7          	movzx  eax,dil
   14000166f:	e9 b1 00 00 00       	jmp    0x140001725
   140001674:	48 8d 55 8f          	lea    rdx,[rbp-0x71]
   140001678:	48 8b 4d 8f          	mov    rcx,QWORD PTR [rbp-0x71]
   14000167c:	4c 8b 4d a7          	mov    r9,QWORD PTR [rbp-0x59]
   140001680:	49 83 f9 0f          	cmp    r9,0xf
   140001684:	48 0f 47 d1          	cmova  rdx,rcx
   140001688:	4c 8d 45 ef          	lea    r8,[rbp-0x11]
   14000168c:	49 83 fd 0f          	cmp    r13,0xf
   140001690:	4d 0f 47 c6          	cmova  r8,r14
   140001694:	48 83 7d 9f 03       	cmp    QWORD PTR [rbp-0x61],0x3
   140001699:	75 2b                	jne    0x1400016c6
   14000169b:	41 0f b6 00          	movzx  eax,BYTE PTR [r8]
   14000169f:	3a 02                	cmp    al,BYTE PTR [rdx]
   1400016a1:	75 18                	jne    0x1400016bb
   1400016a3:	41 0f b6 40 01       	movzx  eax,BYTE PTR [r8+0x1]
   1400016a8:	3a 42 01             	cmp    al,BYTE PTR [rdx+0x1]
   1400016ab:	75 0e                	jne    0x1400016bb
   1400016ad:	41 0f b6 40 02       	movzx  eax,BYTE PTR [r8+0x2]
   1400016b2:	3a 42 02             	cmp    al,BYTE PTR [rdx+0x2]
   1400016b5:	75 04                	jne    0x1400016bb
   1400016b7:	8b c7                	mov    eax,edi
   1400016b9:	eb 05                	jmp    0x1400016c0
   1400016bb:	1b c0                	sbb    eax,eax
   1400016bd:	83 c8 01             	or     eax,0x1
   1400016c0:	85 c0                	test   eax,eax
   1400016c2:	40 0f 94 c7          	sete   dil
   1400016c6:	49 83 f9 0f          	cmp    r9,0xf
   1400016ca:	76 2a                	jbe    0x1400016f6
   1400016cc:	49 8d 51 01          	lea    rdx,[r9+0x1]
   1400016d0:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400016d7:	72 18                	jb     0x1400016f1
   1400016d9:	48 8b 41 f8          	mov    rax,QWORD PTR [rcx-0x8]
   1400016dd:	48 2b c8             	sub    rcx,rax
   1400016e0:	48 83 e9 08          	sub    rcx,0x8
   1400016e4:	48 83 f9 1f          	cmp    rcx,0x1f
   1400016e8:	77 1d                	ja     0x140001707
   1400016ea:	48 83 c2 27          	add    rdx,0x27
   1400016ee:	48 8b c8             	mov    rcx,rax
   1400016f1:	e8 4a 0a 00 00       	call   0x140002140
   1400016f6:	40 84 ff             	test   dil,dil
   1400016f9:	0f 84 bd fe ff ff    	je     0x1400015bc
   1400016ff:	40 b7 01             	mov    dil,0x1
   140001702:	e9 b8 fe ff ff       	jmp    0x1400015bf
   140001707:	b9 05 00 00 00       	mov    ecx,0x5
   14000170c:	cd 29                	int    0x29
   14000170e:	b9 05 00 00 00       	mov    ecx,0x5
   140001713:	cd 29                	int    0x29
   140001715:	b9 05 00 00 00       	mov    ecx,0x5
   14000171a:	cd 29                	int    0x29
   14000171c:	b9 05 00 00 00       	mov    ecx,0x5
   140001721:	cd 29                	int    0x29
   140001723:	32 c0                	xor    al,al
   140001725:	48 8b 4d 0f          	mov    rcx,QWORD PTR [rbp+0xf]
   140001729:	48 33 cc             	xor    rcx,rsp
   14000172c:	e8 7f 09 00 00       	call   0x1400020b0
   140001731:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
   140001738:	41 5f                	pop    r15
   14000173a:	41 5e                	pop    r14
   14000173c:	41 5d                	pop    r13
   14000173e:	41 5c                	pop    r12
   140001740:	5f                   	pop    rdi
   140001741:	5e                   	pop    rsi
   140001742:	5b                   	pop    rbx
   140001743:	5d                   	pop    rbp
   140001744:	c3                   	ret
   140001745:	e8 36 09 00 00       	call   0x140002080
   14000174a:	90                   	nop
   14000174b:	e8 30 09 00 00       	call   0x140002080
   140001750:	cc                   	int3
   140001751:	cc                   	int3
   140001752:	cc                   	int3
   140001753:	cc                   	int3
   140001754:	cc                   	int3
   140001755:	cc                   	int3
   140001756:	cc                   	int3
   140001757:	cc                   	int3
   140001758:	cc                   	int3
   140001759:	cc                   	int3
   14000175a:	cc                   	int3
   14000175b:	cc                   	int3
   14000175c:	cc                   	int3
   14000175d:	cc                   	int3
   14000175e:	cc                   	int3
   14000175f:	cc                   	int3
   140001760:	40 53                	rex push rbx
   140001762:	48 83 ec 60          	sub    rsp,0x60
   140001766:	48 8b 05 93 48 00 00 	mov    rax,QWORD PTR [rip+0x4893]        # 0x140006000
   14000176d:	48 33 c4             	xor    rax,rsp
   140001770:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   140001775:	c7 44 24 20 59 59 58 	mov    DWORD PTR [rsp+0x20],0x56585959
   14000177c:	56 
   14000177d:	c7 44 24 24 52 73 71 	mov    DWORD PTR [rsp+0x24],0x73717352
   140001784:	73 
   140001785:	c7 44 24 28 77 4b 53 	mov    DWORD PTR [rsp+0x28],0x50534b77
   14000178c:	50 
   14000178d:	0f 57 c0             	xorps  xmm0,xmm0
   140001790:	0f 11 44 24 30       	movups XMMWORD PTR [rsp+0x30],xmm0
   140001795:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   14000179c:	00 00 
   14000179e:	48 c7 44 24 48 0f 00 	mov    QWORD PTR [rsp+0x48],0xf
   1400017a5:	00 00 
   1400017a7:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   1400017ac:	48 8d 15 dd 2b 00 00 	lea    rdx,[rip+0x2bdd]        # 0x140004390
   1400017b3:	48 8b 0d fe 28 00 00 	mov    rcx,QWORD PTR [rip+0x28fe]        # 0x1400040b8
   1400017ba:	e8 81 01 00 00       	call   0x140001940
   1400017bf:	48 8b c8             	mov    rcx,rax
   1400017c2:	48 8d 15 47 03 00 00 	lea    rdx,[rip+0x347]        # 0x140001b10
   1400017c9:	ff 15 b1 28 00 00    	call   QWORD PTR [rip+0x28b1]        # 0x140004080
   1400017cf:	48 8d 15 e2 2b 00 00 	lea    rdx,[rip+0x2be2]        # 0x1400043b8
   1400017d6:	48 8b 0d db 28 00 00 	mov    rcx,QWORD PTR [rip+0x28db]        # 0x1400040b8
   1400017dd:	e8 5e 01 00 00       	call   0x140001940
   1400017e2:	48 8b c8             	mov    rcx,rax
   1400017e5:	48 8d 15 24 03 00 00 	lea    rdx,[rip+0x324]        # 0x140001b10
   1400017ec:	ff 15 8e 28 00 00    	call   QWORD PTR [rip+0x288e]        # 0x140004080
   1400017f2:	48 8d 15 97 2b 00 00 	lea    rdx,[rip+0x2b97]        # 0x140004390
   1400017f9:	48 8b 0d b8 28 00 00 	mov    rcx,QWORD PTR [rip+0x28b8]        # 0x1400040b8
   140001800:	e8 3b 01 00 00       	call   0x140001940
   140001805:	48 8b c8             	mov    rcx,rax
   140001808:	48 8d 15 01 03 00 00 	lea    rdx,[rip+0x301]        # 0x140001b10
   14000180f:	ff 15 6b 28 00 00    	call   QWORD PTR [rip+0x286b]        # 0x140004080
   140001815:	48 8d 15 c4 2b 00 00 	lea    rdx,[rip+0x2bc4]        # 0x1400043e0
   14000181c:	48 8b 0d 95 28 00 00 	mov    rcx,QWORD PTR [rip+0x2895]        # 0x1400040b8
   140001823:	e8 18 01 00 00       	call   0x140001940
   140001828:	48 8b 1d 81 28 00 00 	mov    rbx,QWORD PTR [rip+0x2881]        # 0x1400040b0
   14000182f:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001832:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001836:	48 03 cb             	add    rcx,rbx
   140001839:	b2 0a                	mov    dl,0xa
   14000183b:	ff 15 17 28 00 00    	call   QWORD PTR [rip+0x2817]        # 0x140004058
   140001841:	44 0f b6 c0          	movzx  r8d,al
   140001845:	48 8d 54 24 30       	lea    rdx,[rsp+0x30]
   14000184a:	48 8b cb             	mov    rcx,rbx
   14000184d:	e8 6e 03 00 00       	call   0x140001bc0
   140001852:	48 8d 54 24 30       	lea    rdx,[rsp+0x30]
   140001857:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000185c:	e8 5f f9 ff ff       	call   0x1400011c0
   140001861:	48 8b 0d 50 28 00 00 	mov    rcx,QWORD PTR [rip+0x2850]        # 0x1400040b8
   140001868:	84 c0                	test   al,al
   14000186a:	74 25                	je     0x140001891
   14000186c:	48 8d 15 85 2b 00 00 	lea    rdx,[rip+0x2b85]        # 0x1400043f8
   140001873:	e8 c8 00 00 00       	call   0x140001940
   140001878:	48 8b c8             	mov    rcx,rax
   14000187b:	48 8d 15 8e 02 00 00 	lea    rdx,[rip+0x28e]        # 0x140001b10
   140001882:	ff 15 f8 27 00 00    	call   QWORD PTR [rip+0x27f8]        # 0x140004080
   140001888:	48 8d 15 81 2b 00 00 	lea    rdx,[rip+0x2b81]        # 0x140004410
   14000188f:	eb 23                	jmp    0x1400018b4
   140001891:	48 8d 15 a0 2b 00 00 	lea    rdx,[rip+0x2ba0]        # 0x140004438
   140001898:	e8 a3 00 00 00       	call   0x140001940
   14000189d:	48 8b c8             	mov    rcx,rax
   1400018a0:	48 8d 15 69 02 00 00 	lea    rdx,[rip+0x269]        # 0x140001b10
   1400018a7:	ff 15 d3 27 00 00    	call   QWORD PTR [rip+0x27d3]        # 0x140004080
   1400018ad:	48 8d 15 9c 2b 00 00 	lea    rdx,[rip+0x2b9c]        # 0x140004450
   1400018b4:	48 8b 0d fd 27 00 00 	mov    rcx,QWORD PTR [rip+0x27fd]        # 0x1400040b8
   1400018bb:	e8 80 00 00 00       	call   0x140001940
   1400018c0:	48 8d 15 49 02 00 00 	lea    rdx,[rip+0x249]        # 0x140001b10
   1400018c7:	48 8b c8             	mov    rcx,rax
   1400018ca:	ff 15 b0 27 00 00    	call   QWORD PTR [rip+0x27b0]        # 0x140004080
   1400018d0:	48 8d 0d 8d 2b 00 00 	lea    rcx,[rip+0x2b8d]        # 0x140004464
   1400018d7:	ff 15 2b 29 00 00    	call   QWORD PTR [rip+0x292b]        # 0x140004208
   1400018dd:	90                   	nop
   1400018de:	48 8b 54 24 48       	mov    rdx,QWORD PTR [rsp+0x48]
   1400018e3:	48 83 fa 0f          	cmp    rdx,0xf
   1400018e7:	76 2e                	jbe    0x140001917
   1400018e9:	48 ff c2             	inc    rdx
   1400018ec:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   1400018f1:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400018f8:	72 18                	jb     0x140001912
   1400018fa:	48 8b 41 f8          	mov    rax,QWORD PTR [rcx-0x8]
   1400018fe:	48 2b c8             	sub    rcx,rax
   140001901:	48 83 e9 08          	sub    rcx,0x8
   140001905:	48 83 f9 1f          	cmp    rcx,0x1f
   140001909:	77 21                	ja     0x14000192c
   14000190b:	48 83 c2 27          	add    rdx,0x27
   14000190f:	48 8b c8             	mov    rcx,rax
   140001912:	e8 29 08 00 00       	call   0x140002140
   140001917:	33 c0                	xor    eax,eax
   140001919:	48 8b 4c 24 50       	mov    rcx,QWORD PTR [rsp+0x50]
   14000191e:	48 33 cc             	xor    rcx,rsp
   140001921:	e8 8a 07 00 00       	call   0x1400020b0
   140001926:	48 83 c4 60          	add    rsp,0x60
   14000192a:	5b                   	pop    rbx
   14000192b:	c3                   	ret
   14000192c:	b9 05 00 00 00       	mov    ecx,0x5
   140001931:	cd 29                	int    0x29
   140001933:	cc                   	int3
   140001934:	cc                   	int3
   140001935:	cc                   	int3
   140001936:	cc                   	int3
   140001937:	cc                   	int3
   140001938:	cc                   	int3
   140001939:	cc                   	int3
   14000193a:	cc                   	int3
   14000193b:	cc                   	int3
   14000193c:	cc                   	int3
   14000193d:	cc                   	int3
   14000193e:	cc                   	int3
   14000193f:	cc                   	int3
   140001940:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140001945:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   14000194a:	56                   	push   rsi
   14000194b:	57                   	push   rdi
   14000194c:	41 54                	push   r12
   14000194e:	41 56                	push   r14
   140001950:	41 57                	push   r15
   140001952:	48 83 ec 30          	sub    rsp,0x30
   140001956:	4c 8b e2             	mov    r12,rdx
   140001959:	48 8b f9             	mov    rdi,rcx
   14000195c:	33 db                	xor    ebx,ebx
   14000195e:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   140001962:	48 8b ca             	mov    rcx,rdx
   140001965:	e8 44 16 00 00       	call   0x140002fae
   14000196a:	4c 8b f8             	mov    r15,rax
   14000196d:	4c 8b 07             	mov    r8,QWORD PTR [rdi]
   140001970:	49 63 48 04          	movsxd rcx,DWORD PTR [r8+0x4]
   140001974:	48 8b 74 39 28       	mov    rsi,QWORD PTR [rcx+rdi*1+0x28]
   140001979:	48 85 f6             	test   rsi,rsi
   14000197c:	7e 0a                	jle    0x140001988
   14000197e:	48 3b f0             	cmp    rsi,rax
   140001981:	7e 05                	jle    0x140001988
   140001983:	48 2b f0             	sub    rsi,rax
   140001986:	eb 02                	jmp    0x14000198a
   140001988:	33 f6                	xor    esi,esi
   14000198a:	4c 8b f7             	mov    r14,rdi
   14000198d:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140001992:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001997:	48 85 c9             	test   rcx,rcx
   14000199a:	74 07                	je     0x1400019a3
   14000199c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000199f:	ff 50 08             	call   QWORD PTR [rax+0x8]
   1400019a2:	90                   	nop
   1400019a3:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   1400019a6:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400019aa:	48 03 cf             	add    rcx,rdi
   1400019ad:	ff 15 d5 26 00 00    	call   QWORD PTR [rip+0x26d5]        # 0x140004088
   1400019b3:	84 c0                	test   al,al
   1400019b5:	75 06                	jne    0x1400019bd
   1400019b7:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   1400019bb:	eb 39                	jmp    0x1400019f6
   1400019bd:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   1400019c0:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400019c4:	48 8b 4c 39 50       	mov    rcx,QWORD PTR [rcx+rdi*1+0x50]
   1400019c9:	48 85 c9             	test   rcx,rcx
   1400019cc:	74 21                	je     0x1400019ef
   1400019ce:	48 3b cf             	cmp    rcx,rdi
   1400019d1:	74 1c                	je     0x1400019ef
   1400019d3:	ff 15 9f 26 00 00    	call   QWORD PTR [rip+0x269f]        # 0x140004078
   1400019d9:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   1400019dc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400019e0:	48 03 cf             	add    rcx,rdi
   1400019e3:	ff 15 9f 26 00 00    	call   QWORD PTR [rip+0x269f]        # 0x140004088
   1400019e9:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   1400019ed:	eb 07                	jmp    0x1400019f6
   1400019ef:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1400019f4:	b0 01                	mov    al,0x1
   1400019f6:	84 c0                	test   al,al
   1400019f8:	75 0a                	jne    0x140001a04
   1400019fa:	bb 04 00 00 00       	mov    ebx,0x4
   1400019ff:	e9 ab 00 00 00       	jmp    0x140001aaf
   140001a04:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
   140001a07:	48 63 42 04          	movsxd rax,DWORD PTR [rdx+0x4]
   140001a0b:	8b 4c 38 18          	mov    ecx,DWORD PTR [rax+rdi*1+0x18]
   140001a0f:	81 e1 c0 01 00 00    	and    ecx,0x1c0
   140001a15:	83 f9 40             	cmp    ecx,0x40
   140001a18:	74 2c                	je     0x140001a46
   140001a1a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001a20:	48 8b 17             	mov    rdx,QWORD PTR [rdi]
   140001a23:	48 85 f6             	test   rsi,rsi
   140001a26:	7e 1e                	jle    0x140001a46
   140001a28:	48 63 4a 04          	movsxd rcx,DWORD PTR [rdx+0x4]
   140001a2c:	0f b6 54 39 58       	movzx  edx,BYTE PTR [rcx+rdi*1+0x58]
   140001a31:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001a36:	ff 15 24 26 00 00    	call   QWORD PTR [rip+0x2624]        # 0x140004060
   140001a3c:	83 f8 ff             	cmp    eax,0xffffffff
   140001a3f:	74 45                	je     0x140001a86
   140001a41:	48 ff ce             	dec    rsi
   140001a44:	eb da                	jmp    0x140001a20
   140001a46:	48 63 4a 04          	movsxd rcx,DWORD PTR [rdx+0x4]
   140001a4a:	4d 8b c7             	mov    r8,r15
   140001a4d:	49 8b d4             	mov    rdx,r12
   140001a50:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001a55:	ff 15 65 26 00 00    	call   QWORD PTR [rip+0x2665]        # 0x1400040c0
   140001a5b:	49 3b c7             	cmp    rax,r15
   140001a5e:	75 26                	jne    0x140001a86
   140001a60:	48 85 f6             	test   rsi,rsi
   140001a63:	7e 2a                	jle    0x140001a8f
   140001a65:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001a68:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001a6c:	0f b6 54 39 58       	movzx  edx,BYTE PTR [rcx+rdi*1+0x58]
   140001a71:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001a76:	ff 15 e4 25 00 00    	call   QWORD PTR [rip+0x25e4]        # 0x140004060
   140001a7c:	83 f8 ff             	cmp    eax,0xffffffff
   140001a7f:	74 05                	je     0x140001a86
   140001a81:	48 ff ce             	dec    rsi
   140001a84:	eb da                	jmp    0x140001a60
   140001a86:	bb 04 00 00 00       	mov    ebx,0x4
   140001a8b:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   140001a8f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001a92:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001a96:	48 c7 44 39 28 00 00 	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   140001a9d:	00 00 
   140001a9f:	eb 0e                	jmp    0x140001aaf
   140001aa1:	48 8b 7c 24 60       	mov    rdi,QWORD PTR [rsp+0x60]
   140001aa6:	8b 5c 24 70          	mov    ebx,DWORD PTR [rsp+0x70]
   140001aaa:	4c 8b 74 24 20       	mov    r14,QWORD PTR [rsp+0x20]
   140001aaf:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001ab2:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001ab6:	48 03 cf             	add    rcx,rdi
   140001ab9:	45 33 c0             	xor    r8d,r8d
   140001abc:	8b d3                	mov    edx,ebx
   140001abe:	ff 15 8c 25 00 00    	call   QWORD PTR [rip+0x258c]        # 0x140004050
   140001ac4:	90                   	nop
   140001ac5:	ff 15 fd 25 00 00    	call   QWORD PTR [rip+0x25fd]        # 0x1400040c8
   140001acb:	85 c0                	test   eax,eax
   140001acd:	75 0a                	jne    0x140001ad9
   140001acf:	49 8b ce             	mov    rcx,r14
   140001ad2:	ff 15 70 25 00 00    	call   QWORD PTR [rip+0x2570]        # 0x140004048
   140001ad8:	90                   	nop
   140001ad9:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140001adc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001ae0:	4a 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   140001ae5:	48 85 c9             	test   rcx,rcx
   140001ae8:	74 07                	je     0x140001af1
   140001aea:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001aed:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001af0:	90                   	nop
   140001af1:	48 8b c7             	mov    rax,rdi
   140001af4:	48 8b 5c 24 68       	mov    rbx,QWORD PTR [rsp+0x68]
   140001af9:	48 83 c4 30          	add    rsp,0x30
   140001afd:	41 5f                	pop    r15
   140001aff:	41 5e                	pop    r14
   140001b01:	41 5c                	pop    r12
   140001b03:	5f                   	pop    rdi
   140001b04:	5e                   	pop    rsi
   140001b05:	c3                   	ret
   140001b06:	cc                   	int3
   140001b07:	cc                   	int3
   140001b08:	cc                   	int3
   140001b09:	cc                   	int3
   140001b0a:	cc                   	int3
   140001b0b:	cc                   	int3
   140001b0c:	cc                   	int3
   140001b0d:	cc                   	int3
   140001b0e:	cc                   	int3
   140001b0f:	cc                   	int3
   140001b10:	40 53                	rex push rbx
   140001b12:	48 83 ec 20          	sub    rsp,0x20
   140001b16:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001b19:	48 8b d9             	mov    rbx,rcx
   140001b1c:	b2 0a                	mov    dl,0xa
   140001b1e:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001b22:	48 03 cb             	add    rcx,rbx
   140001b25:	ff 15 2d 25 00 00    	call   QWORD PTR [rip+0x252d]        # 0x140004058
   140001b2b:	0f b6 d0             	movzx  edx,al
   140001b2e:	48 8b cb             	mov    rcx,rbx
   140001b31:	ff 15 39 25 00 00    	call   QWORD PTR [rip+0x2539]        # 0x140004070
   140001b37:	48 8b cb             	mov    rcx,rbx
   140001b3a:	ff 15 38 25 00 00    	call   QWORD PTR [rip+0x2538]        # 0x140004078
   140001b40:	48 8b c3             	mov    rax,rbx
   140001b43:	48 83 c4 20          	add    rsp,0x20
   140001b47:	5b                   	pop    rbx
   140001b48:	c3                   	ret
   140001b49:	cc                   	int3
   140001b4a:	cc                   	int3
   140001b4b:	cc                   	int3
   140001b4c:	cc                   	int3
   140001b4d:	cc                   	int3
   140001b4e:	cc                   	int3
   140001b4f:	cc                   	int3
   140001b50:	40 53                	rex push rbx
   140001b52:	48 83 ec 20          	sub    rsp,0x20
   140001b56:	48 8b d9             	mov    rbx,rcx
   140001b59:	48 8b 49 18          	mov    rcx,QWORD PTR [rcx+0x18]
   140001b5d:	48 83 f9 0f          	cmp    rcx,0xf
   140001b61:	76 39                	jbe    0x140001b9c
   140001b63:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001b66:	48 8d 51 01          	lea    rdx,[rcx+0x1]
   140001b6a:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001b71:	72 1e                	jb     0x140001b91
   140001b73:	4c 8b 40 f8          	mov    r8,QWORD PTR [rax-0x8]
   140001b77:	49 2b c0             	sub    rax,r8
   140001b7a:	48 83 e8 08          	sub    rax,0x8
   140001b7e:	48 83 f8 1f          	cmp    rax,0x1f
   140001b82:	77 06                	ja     0x140001b8a
   140001b84:	48 8d 51 28          	lea    rdx,[rcx+0x28]
   140001b88:	eb 0a                	jmp    0x140001b94
   140001b8a:	b9 05 00 00 00       	mov    ecx,0x5
   140001b8f:	cd 29                	int    0x29
   140001b91:	4c 8b c0             	mov    r8,rax
   140001b94:	49 8b c8             	mov    rcx,r8
   140001b97:	e8 a4 05 00 00       	call   0x140002140
   140001b9c:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   140001ba3:	00 
   140001ba4:	48 c7 43 18 0f 00 00 	mov    QWORD PTR [rbx+0x18],0xf
   140001bab:	00 
   140001bac:	c6 03 00             	mov    BYTE PTR [rbx],0x0
   140001baf:	48 83 c4 20          	add    rsp,0x20
   140001bb3:	5b                   	pop    rbx
   140001bb4:	c3                   	ret
   140001bb5:	cc                   	int3
   140001bb6:	cc                   	int3
   140001bb7:	cc                   	int3
   140001bb8:	cc                   	int3
   140001bb9:	cc                   	int3
   140001bba:	cc                   	int3
   140001bbb:	cc                   	int3
   140001bbc:	cc                   	int3
   140001bbd:	cc                   	int3
   140001bbe:	cc                   	int3
   140001bbf:	cc                   	int3
   140001bc0:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   140001bc5:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   140001bca:	57                   	push   rdi
   140001bcb:	41 54                	push   r12
   140001bcd:	41 55                	push   r13
   140001bcf:	41 56                	push   r14
   140001bd1:	41 57                	push   r15
   140001bd3:	48 83 ec 40          	sub    rsp,0x40
   140001bd7:	45 0f b6 f8          	movzx  r15d,r8b
   140001bdb:	48 8b fa             	mov    rdi,rdx
   140001bde:	48 8b f1             	mov    rsi,rcx
   140001be1:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   140001be6:	33 db                	xor    ebx,ebx
   140001be8:	89 5c 24 24          	mov    DWORD PTR [rsp+0x24],ebx
   140001bec:	45 32 f6             	xor    r14b,r14b
   140001bef:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001bf4:	4c 8b e1             	mov    r12,rcx
   140001bf7:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140001bfc:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001bff:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001c03:	4a 8b 4c 21 48       	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001c08:	48 85 c9             	test   rcx,rcx
   140001c0b:	74 07                	je     0x140001c14
   140001c0d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001c10:	ff 50 08             	call   QWORD PTR [rax+0x8]
   140001c13:	90                   	nop
   140001c14:	b2 01                	mov    dl,0x1
   140001c16:	48 8b ce             	mov    rcx,rsi
   140001c19:	ff 15 71 24 00 00    	call   QWORD PTR [rip+0x2471]        # 0x140004090
   140001c1f:	88 44 24 38          	mov    BYTE PTR [rsp+0x38],al
   140001c23:	84 c0                	test   al,al
   140001c25:	0f 84 ef 00 00 00    	je     0x140001d1a
   140001c2b:	48 c7 47 10 00 00 00 	mov    QWORD PTR [rdi+0x10],0x0
   140001c32:	00 
   140001c33:	48 8b c7             	mov    rax,rdi
   140001c36:	48 83 7f 18 0f       	cmp    QWORD PTR [rdi+0x18],0xf
   140001c3b:	76 03                	jbe    0x140001c40
   140001c3d:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001c40:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140001c43:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001c46:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001c4a:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001c4f:	ff 15 43 24 00 00    	call   QWORD PTR [rip+0x2443]        # 0x140004098
   140001c55:	44 8b c8             	mov    r9d,eax
   140001c58:	49 bd ff ff ff ff ff 	movabs r13,0x7fffffffffffffff
   140001c5f:	ff ff 7f 
   140001c62:	41 83 f9 ff          	cmp    r9d,0xffffffff
   140001c66:	75 07                	jne    0x140001c6f
   140001c68:	bb 01 00 00 00       	mov    ebx,0x1
   140001c6d:	eb 2f                	jmp    0x140001c9e
   140001c6f:	45 3b cf             	cmp    r9d,r15d
   140001c72:	75 1c                	jne    0x140001c90
   140001c74:	41 b6 01             	mov    r14b,0x1
   140001c77:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001c7c:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001c7f:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001c83:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001c88:	ff 15 da 23 00 00    	call   QWORD PTR [rip+0x23da]        # 0x140004068
   140001c8e:	eb 12                	jmp    0x140001ca2
   140001c90:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
   140001c94:	49 3b cd             	cmp    rcx,r13
   140001c97:	72 0b                	jb     0x140001ca4
   140001c99:	bb 02 00 00 00       	mov    ebx,0x2
   140001c9e:	89 5c 24 24          	mov    DWORD PTR [rsp+0x24],ebx
   140001ca2:	eb 71                	jmp    0x140001d15
   140001ca4:	48 8b 57 18          	mov    rdx,QWORD PTR [rdi+0x18]
   140001ca8:	48 3b ca             	cmp    rcx,rdx
   140001cab:	73 2a                	jae    0x140001cd7
   140001cad:	48 8d 41 01          	lea    rax,[rcx+0x1]
   140001cb1:	48 89 47 10          	mov    QWORD PTR [rdi+0x10],rax
   140001cb5:	48 83 fa 0f          	cmp    rdx,0xf
   140001cb9:	76 0e                	jbe    0x140001cc9
   140001cbb:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001cbe:	44 88 0c 01          	mov    BYTE PTR [rcx+rax*1],r9b
   140001cc2:	c6 44 01 01 00       	mov    BYTE PTR [rcx+rax*1+0x1],0x0
   140001cc7:	eb 16                	jmp    0x140001cdf
   140001cc9:	48 8b c7             	mov    rax,rdi
   140001ccc:	44 88 0c 01          	mov    BYTE PTR [rcx+rax*1],r9b
   140001cd0:	c6 44 01 01 00       	mov    BYTE PTR [rcx+rax*1+0x1],0x0
   140001cd5:	eb 08                	jmp    0x140001cdf
   140001cd7:	48 8b cf             	mov    rcx,rdi
   140001cda:	e8 01 02 00 00       	call   0x140001ee0
   140001cdf:	41 b6 01             	mov    r14b,0x1
   140001ce2:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001ce7:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001cea:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001cee:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001cf3:	ff 15 47 23 00 00    	call   QWORD PTR [rip+0x2347]        # 0x140004040
   140001cf9:	44 8b c8             	mov    r9d,eax
   140001cfc:	e9 61 ff ff ff       	jmp    0x140001c62
   140001d01:	8b 5c 24 24          	mov    ebx,DWORD PTR [rsp+0x24]
   140001d05:	44 0f b6 74 24 20    	movzx  r14d,BYTE PTR [rsp+0x20]
   140001d0b:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
   140001d10:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   140001d15:	45 84 f6             	test   r14b,r14b
   140001d18:	75 03                	jne    0x140001d1d
   140001d1a:	83 cb 02             	or     ebx,0x2
   140001d1d:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001d20:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001d24:	48 03 ce             	add    rcx,rsi
   140001d27:	45 33 c0             	xor    r8d,r8d
   140001d2a:	8b d3                	mov    edx,ebx
   140001d2c:	ff 15 1e 23 00 00    	call   QWORD PTR [rip+0x231e]        # 0x140004050
   140001d32:	90                   	nop
   140001d33:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
   140001d37:	48 63 51 04          	movsxd rdx,DWORD PTR [rcx+0x4]
   140001d3b:	4a 8b 4c 22 48       	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   140001d40:	48 85 c9             	test   rcx,rcx
   140001d43:	74 07                	je     0x140001d4c
   140001d45:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001d48:	ff 52 10             	call   QWORD PTR [rdx+0x10]
   140001d4b:	90                   	nop
   140001d4c:	48 8b c6             	mov    rax,rsi
   140001d4f:	4c 8d 5c 24 40       	lea    r11,[rsp+0x40]
   140001d54:	49 8b 5b 40          	mov    rbx,QWORD PTR [r11+0x40]
   140001d58:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   140001d5c:	49 8b e3             	mov    rsp,r11
   140001d5f:	41 5f                	pop    r15
   140001d61:	41 5e                	pop    r14
   140001d63:	41 5d                	pop    r13
   140001d65:	41 5c                	pop    r12
   140001d67:	5f                   	pop    rdi
   140001d68:	c3                   	ret
   140001d69:	cc                   	int3
   140001d6a:	cc                   	int3
   140001d6b:	cc                   	int3
   140001d6c:	cc                   	int3
   140001d6d:	cc                   	int3
   140001d6e:	cc                   	int3
   140001d6f:	cc                   	int3
   140001d70:	40 53                	rex push rbx
   140001d72:	55                   	push   rbp
   140001d73:	56                   	push   rsi
   140001d74:	41 56                	push   r14
   140001d76:	48 83 ec 28          	sub    rsp,0x28
   140001d7a:	48 be ff ff ff ff ff 	movabs rsi,0x7fffffffffffffff
   140001d81:	ff ff 7f 
   140001d84:	49 8b d8             	mov    rbx,r8
   140001d87:	48 8b ea             	mov    rbp,rdx
   140001d8a:	4c 8b f1             	mov    r14,rcx
   140001d8d:	4c 3b c6             	cmp    r8,rsi
   140001d90:	0f 87 ca 00 00 00    	ja     0x140001e60
   140001d96:	48 83 fb 0f          	cmp    rbx,0xf
   140001d9a:	77 20                	ja     0x140001dbc
   140001d9c:	48 89 59 10          	mov    QWORD PTR [rcx+0x10],rbx
   140001da0:	48 c7 41 18 0f 00 00 	mov    QWORD PTR [rcx+0x18],0xf
   140001da7:	00 
   140001da8:	e8 fb 11 00 00       	call   0x140002fa8
   140001dad:	42 c6 04 33 00       	mov    BYTE PTR [rbx+r14*1],0x0
   140001db2:	48 83 c4 28          	add    rsp,0x28
   140001db6:	41 5e                	pop    r14
   140001db8:	5e                   	pop    rsi
   140001db9:	5d                   	pop    rbp
   140001dba:	5b                   	pop    rbx
   140001dbb:	c3                   	ret
   140001dbc:	48 8b c3             	mov    rax,rbx
   140001dbf:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140001dc4:	48 83 c8 0f          	or     rax,0xf
   140001dc8:	48 3b c6             	cmp    rax,rsi
   140001dcb:	76 1f                	jbe    0x140001dec
   140001dcd:	48 b9 00 00 00 00 00 	movabs rcx,0x8000000000000000
   140001dd4:	00 00 80 
   140001dd7:	48 83 c1 27          	add    rcx,0x27
   140001ddb:	e8 00 03 00 00       	call   0x1400020e0
   140001de0:	48 85 c0             	test   rax,rax
   140001de3:	75 36                	jne    0x140001e1b
   140001de5:	b9 05 00 00 00       	mov    ecx,0x5
   140001dea:	cd 29                	int    0x29
   140001dec:	b9 16 00 00 00       	mov    ecx,0x16
   140001df1:	48 8b f0             	mov    rsi,rax
   140001df4:	48 3b c1             	cmp    rax,rcx
   140001df7:	48 0f 42 f1          	cmovb  rsi,rcx
   140001dfb:	48 8d 46 01          	lea    rax,[rsi+0x1]
   140001dff:	48 85 c0             	test   rax,rax
   140001e02:	75 04                	jne    0x140001e08
   140001e04:	33 ff                	xor    edi,edi
   140001e06:	eb 2c                	jmp    0x140001e34
   140001e08:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140001e0e:	72 19                	jb     0x140001e29
   140001e10:	48 8d 48 27          	lea    rcx,[rax+0x27]
   140001e14:	48 3b c8             	cmp    rcx,rax
   140001e17:	76 4d                	jbe    0x140001e66
   140001e19:	eb c0                	jmp    0x140001ddb
   140001e1b:	48 8d 78 27          	lea    rdi,[rax+0x27]
   140001e1f:	48 83 e7 e0          	and    rdi,0xffffffffffffffe0
   140001e23:	48 89 47 f8          	mov    QWORD PTR [rdi-0x8],rax
   140001e27:	eb 0b                	jmp    0x140001e34
   140001e29:	48 8b c8             	mov    rcx,rax
   140001e2c:	e8 af 02 00 00       	call   0x1400020e0
   140001e31:	48 8b f8             	mov    rdi,rax
   140001e34:	4c 8b c3             	mov    r8,rbx
   140001e37:	49 89 3e             	mov    QWORD PTR [r14],rdi
   140001e3a:	48 8b d5             	mov    rdx,rbp
   140001e3d:	49 89 5e 10          	mov    QWORD PTR [r14+0x10],rbx
   140001e41:	48 8b cf             	mov    rcx,rdi
   140001e44:	49 89 76 18          	mov    QWORD PTR [r14+0x18],rsi
   140001e48:	e8 5b 11 00 00       	call   0x140002fa8
   140001e4d:	c6 04 3b 00          	mov    BYTE PTR [rbx+rdi*1],0x0
   140001e51:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
   140001e56:	48 83 c4 28          	add    rsp,0x28
   140001e5a:	41 5e                	pop    r14
   140001e5c:	5e                   	pop    rsi
   140001e5d:	5d                   	pop    rbp
   140001e5e:	5b                   	pop    rbx
   140001e5f:	c3                   	ret
   140001e60:	e8 3b f3 ff ff       	call   0x1400011a0
   140001e65:	cc                   	int3
   140001e66:	e8 95 f2 ff ff       	call   0x140001100
   140001e6b:	cc                   	int3
   140001e6c:	cc                   	int3
   140001e6d:	cc                   	int3
   140001e6e:	cc                   	int3
   140001e6f:	cc                   	int3
   140001e70:	40 53                	rex push rbx
   140001e72:	48 83 ec 20          	sub    rsp,0x20
   140001e76:	48 8b d9             	mov    rbx,rcx
   140001e79:	ff 15 49 22 00 00    	call   QWORD PTR [rip+0x2249]        # 0x1400040c8
   140001e7f:	85 c0                	test   eax,eax
   140001e81:	75 0a                	jne    0x140001e8d
   140001e83:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140001e86:	ff 15 bc 21 00 00    	call   QWORD PTR [rip+0x21bc]        # 0x140004048
   140001e8c:	90                   	nop
   140001e8d:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140001e90:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001e93:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001e97:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001e9c:	48 85 c9             	test   rcx,rcx
   140001e9f:	74 07                	je     0x140001ea8
   140001ea1:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001ea4:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001ea7:	90                   	nop
   140001ea8:	48 83 c4 20          	add    rsp,0x20
   140001eac:	5b                   	pop    rbx
   140001ead:	c3                   	ret
   140001eae:	cc                   	int3
   140001eaf:	cc                   	int3
   140001eb0:	48 83 ec 28          	sub    rsp,0x28
   140001eb4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001eb7:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001eba:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001ebe:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001ec3:	48 85 c9             	test   rcx,rcx
   140001ec6:	74 07                	je     0x140001ecf
   140001ec8:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001ecb:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001ece:	90                   	nop
   140001ecf:	48 83 c4 28          	add    rsp,0x28
   140001ed3:	c3                   	ret
   140001ed4:	cc                   	int3
   140001ed5:	cc                   	int3
   140001ed6:	cc                   	int3
   140001ed7:	cc                   	int3
   140001ed8:	cc                   	int3
   140001ed9:	cc                   	int3
   140001eda:	cc                   	int3
   140001edb:	cc                   	int3
   140001edc:	cc                   	int3
   140001edd:	cc                   	int3
   140001ede:	cc                   	int3
   140001edf:	cc                   	int3
   140001ee0:	40 55                	rex push rbp
   140001ee2:	56                   	push   rsi
   140001ee3:	57                   	push   rdi
   140001ee4:	41 54                	push   r12
   140001ee6:	48 83 ec 28          	sub    rsp,0x28
   140001eea:	48 8b 69 10          	mov    rbp,QWORD PTR [rcx+0x10]
   140001eee:	48 bf ff ff ff ff ff 	movabs rdi,0x7fffffffffffffff
   140001ef5:	ff ff 7f 
   140001ef8:	48 8b c7             	mov    rax,rdi
   140001efb:	45 0f b6 e1          	movzx  r12d,r9b
   140001eff:	48 2b c5             	sub    rax,rbp
   140001f02:	48 8b f1             	mov    rsi,rcx
   140001f05:	48 83 f8 01          	cmp    rax,0x1
   140001f09:	0f 82 29 01 00 00    	jb     0x140002038
   140001f0f:	48 89 5c 24 58       	mov    QWORD PTR [rsp+0x58],rbx
   140001f14:	4c 89 74 24 60       	mov    QWORD PTR [rsp+0x60],r14
   140001f19:	4c 8b 71 18          	mov    r14,QWORD PTR [rcx+0x18]
   140001f1d:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
   140001f22:	4c 8d 7d 01          	lea    r15,[rbp+0x1]
   140001f26:	49 8b cf             	mov    rcx,r15
   140001f29:	48 83 c9 0f          	or     rcx,0xf
   140001f2d:	48 3b cf             	cmp    rcx,rdi
   140001f30:	77 43                	ja     0x140001f75
   140001f32:	49 8b d6             	mov    rdx,r14
   140001f35:	48 8b c7             	mov    rax,rdi
   140001f38:	48 d1 ea             	shr    rdx,1
   140001f3b:	48 2b c2             	sub    rax,rdx
   140001f3e:	4c 3b f0             	cmp    r14,rax
   140001f41:	77 32                	ja     0x140001f75
   140001f43:	4a 8d 04 32          	lea    rax,[rdx+r14*1]
   140001f47:	48 8b f9             	mov    rdi,rcx
   140001f4a:	48 3b c8             	cmp    rcx,rax
   140001f4d:	48 0f 42 f8          	cmovb  rdi,rax
   140001f51:	48 8d 47 01          	lea    rax,[rdi+0x1]
   140001f55:	48 85 c0             	test   rax,rax
   140001f58:	75 04                	jne    0x140001f5e
   140001f5a:	33 db                	xor    ebx,ebx
   140001f5c:	eb 48                	jmp    0x140001fa6
   140001f5e:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140001f64:	72 35                	jb     0x140001f9b
   140001f66:	48 8d 48 27          	lea    rcx,[rax+0x27]
   140001f6a:	48 3b c8             	cmp    rcx,rax
   140001f6d:	0f 86 cb 00 00 00    	jbe    0x14000203e
   140001f73:	eb 0e                	jmp    0x140001f83
   140001f75:	48 b9 00 00 00 00 00 	movabs rcx,0x8000000000000000
   140001f7c:	00 00 80 
   140001f7f:	48 83 c1 27          	add    rcx,0x27
   140001f83:	e8 58 01 00 00       	call   0x1400020e0
   140001f88:	48 85 c0             	test   rax,rax
   140001f8b:	74 6a                	je     0x140001ff7
   140001f8d:	48 8d 58 27          	lea    rbx,[rax+0x27]
   140001f91:	48 83 e3 e0          	and    rbx,0xffffffffffffffe0
   140001f95:	48 89 43 f8          	mov    QWORD PTR [rbx-0x8],rax
   140001f99:	eb 0b                	jmp    0x140001fa6
   140001f9b:	48 8b c8             	mov    rcx,rax
   140001f9e:	e8 3d 01 00 00       	call   0x1400020e0
   140001fa3:	48 8b d8             	mov    rbx,rax
   140001fa6:	4c 89 7e 10          	mov    QWORD PTR [rsi+0x10],r15
   140001faa:	4c 8b c5             	mov    r8,rbp
   140001fad:	48 89 7e 18          	mov    QWORD PTR [rsi+0x18],rdi
   140001fb1:	48 8b cb             	mov    rcx,rbx
   140001fb4:	49 83 fe 0f          	cmp    r14,0xf
   140001fb8:	76 4e                	jbe    0x140002008
   140001fba:	48 8b 3e             	mov    rdi,QWORD PTR [rsi]
   140001fbd:	48 8b d7             	mov    rdx,rdi
   140001fc0:	e8 e3 0f 00 00       	call   0x140002fa8
   140001fc5:	49 8d 56 01          	lea    rdx,[r14+0x1]
   140001fc9:	44 88 24 2b          	mov    BYTE PTR [rbx+rbp*1],r12b
   140001fcd:	c6 44 2b 01 00       	mov    BYTE PTR [rbx+rbp*1+0x1],0x0
   140001fd2:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001fd9:	72 23                	jb     0x140001ffe
   140001fdb:	48 8b 4f f8          	mov    rcx,QWORD PTR [rdi-0x8]
   140001fdf:	48 2b f9             	sub    rdi,rcx
   140001fe2:	48 83 ef 08          	sub    rdi,0x8
   140001fe6:	48 83 ff 1f          	cmp    rdi,0x1f
   140001fea:	77 0b                	ja     0x140001ff7
   140001fec:	49 8d 56 28          	lea    rdx,[r14+0x28]
   140001ff0:	e8 4b 01 00 00       	call   0x140002140
   140001ff5:	eb 22                	jmp    0x140002019
   140001ff7:	b9 05 00 00 00       	mov    ecx,0x5
   140001ffc:	cd 29                	int    0x29
   140001ffe:	48 8b cf             	mov    rcx,rdi
   140002001:	e8 3a 01 00 00       	call   0x140002140
   140002006:	eb 11                	jmp    0x140002019
   140002008:	48 8b d6             	mov    rdx,rsi
   14000200b:	e8 98 0f 00 00       	call   0x140002fa8
   140002010:	44 88 24 2b          	mov    BYTE PTR [rbx+rbp*1],r12b
   140002014:	c6 44 2b 01 00       	mov    BYTE PTR [rbx+rbp*1+0x1],0x0
   140002019:	48 89 1e             	mov    QWORD PTR [rsi],rbx
   14000201c:	48 8b c6             	mov    rax,rsi
   14000201f:	4c 8b 74 24 60       	mov    r14,QWORD PTR [rsp+0x60]
   140002024:	48 8b 5c 24 58       	mov    rbx,QWORD PTR [rsp+0x58]
   140002029:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
   14000202e:	48 83 c4 28          	add    rsp,0x28
   140002032:	41 5c                	pop    r12
   140002034:	5f                   	pop    rdi
   140002035:	5e                   	pop    rsi
   140002036:	5d                   	pop    rbp
   140002037:	c3                   	ret
   140002038:	e8 63 f1 ff ff       	call   0x1400011a0
   14000203d:	cc                   	int3
   14000203e:	e8 bd f0 ff ff       	call   0x140001100
   140002043:	cc                   	int3
   140002044:	cc                   	int3
   140002045:	cc                   	int3
   140002046:	cc                   	int3
   140002047:	cc                   	int3
   140002048:	cc                   	int3
   140002049:	cc                   	int3
   14000204a:	cc                   	int3
   14000204b:	cc                   	int3
   14000204c:	cc                   	int3
   14000204d:	cc                   	int3
   14000204e:	cc                   	int3
   14000204f:	cc                   	int3
   140002050:	48 83 ec 28          	sub    rsp,0x28
   140002054:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140002057:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14000205a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000205e:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140002063:	48 85 c9             	test   rcx,rcx
   140002066:	74 07                	je     0x14000206f
   140002068:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000206b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   14000206e:	90                   	nop
   14000206f:	48 83 c4 28          	add    rsp,0x28
   140002073:	c3                   	ret
   140002074:	cc                   	int3
   140002075:	cc                   	int3
   140002076:	cc                   	int3
   140002077:	cc                   	int3
   140002078:	cc                   	int3
   140002079:	cc                   	int3
   14000207a:	cc                   	int3
   14000207b:	cc                   	int3
   14000207c:	cc                   	int3
   14000207d:	cc                   	int3
   14000207e:	cc                   	int3
   14000207f:	cc                   	int3
   140002080:	48 83 ec 28          	sub    rsp,0x28
   140002084:	48 8d 0d e5 23 00 00 	lea    rcx,[rip+0x23e5]        # 0x140004470
   14000208b:	ff 15 17 20 00 00    	call   QWORD PTR [rip+0x2017]        # 0x1400040a8
   140002091:	cc                   	int3
   140002092:	cc                   	int3
   140002093:	cc                   	int3
   140002094:	cc                   	int3
   140002095:	cc                   	int3
   140002096:	cc                   	int3
   140002097:	cc                   	int3
   140002098:	cc                   	int3
   140002099:	cc                   	int3
   14000209a:	cc                   	int3
   14000209b:	cc                   	int3
   14000209c:	cc                   	int3
   14000209d:	cc                   	int3
   14000209e:	cc                   	int3
   14000209f:	cc                   	int3
   1400020a0:	cc                   	int3
   1400020a1:	cc                   	int3
   1400020a2:	cc                   	int3
   1400020a3:	cc                   	int3
   1400020a4:	cc                   	int3
   1400020a5:	cc                   	int3
   1400020a6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   1400020ad:	00 00 00 
   1400020b0:	48 3b 0d 49 3f 00 00 	cmp    rcx,QWORD PTR [rip+0x3f49]        # 0x140006000
   1400020b7:	75 10                	jne    0x1400020c9
   1400020b9:	48 c1 c1 10          	rol    rcx,0x10
   1400020bd:	66 f7 c1 ff ff       	test   cx,0xffff
   1400020c2:	75 01                	jne    0x1400020c5
   1400020c4:	c3                   	ret
   1400020c5:	48 c1 c9 10          	ror    rcx,0x10
   1400020c9:	e9 02 00 00 00       	jmp    0x1400020d0
   1400020ce:	cc                   	int3
   1400020cf:	cc                   	int3
   1400020d0:	b9 02 00 00 00       	mov    ecx,0x2
   1400020d5:	cd 29                	int    0x29
   1400020d7:	c3                   	ret
   1400020d8:	cc                   	int3
   1400020d9:	cc                   	int3
   1400020da:	cc                   	int3
   1400020db:	cc                   	int3
   1400020dc:	cc                   	int3
   1400020dd:	cc                   	int3
   1400020de:	cc                   	int3
   1400020df:	cc                   	int3
   1400020e0:	40 53                	rex push rbx
   1400020e2:	48 83 ec 20          	sub    rsp,0x20
   1400020e6:	48 8b d9             	mov    rbx,rcx
   1400020e9:	e8 ec 0b 00 00       	call   0x140002cda
   1400020ee:	48 85 c0             	test   rax,rax
   1400020f1:	75 19                	jne    0x14000210c
   1400020f3:	48 8b cb             	mov    rcx,rbx
   1400020f6:	e8 d9 0b 00 00       	call   0x140002cd4
   1400020fb:	85 c0                	test   eax,eax
   1400020fd:	74 13                	je     0x140002112
   1400020ff:	48 8b cb             	mov    rcx,rbx
   140002102:	e8 d3 0b 00 00       	call   0x140002cda
   140002107:	48 85 c0             	test   rax,rax
   14000210a:	74 e7                	je     0x1400020f3
   14000210c:	48 83 c4 20          	add    rsp,0x20
   140002110:	5b                   	pop    rbx
   140002111:	c3                   	ret
   140002112:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
   140002116:	74 06                	je     0x14000211e
   140002118:	e8 23 03 00 00       	call   0x140002440
   14000211d:	cc                   	int3
   14000211e:	e8 dd ef ff ff       	call   0x140001100
   140002123:	cc                   	int3
   140002124:	cc                   	int3
   140002125:	cc                   	int3
   140002126:	cc                   	int3
   140002127:	cc                   	int3
   140002128:	cc                   	int3
   140002129:	cc                   	int3
   14000212a:	cc                   	int3
   14000212b:	cc                   	int3
   14000212c:	cc                   	int3
   14000212d:	cc                   	int3
   14000212e:	cc                   	int3
   14000212f:	cc                   	int3
   140002130:	e9 ab 0b 00 00       	jmp    0x140002ce0
   140002135:	cc                   	int3
   140002136:	cc                   	int3
   140002137:	cc                   	int3
   140002138:	cc                   	int3
   140002139:	cc                   	int3
   14000213a:	cc                   	int3
   14000213b:	cc                   	int3
   14000213c:	cc                   	int3
   14000213d:	cc                   	int3
   14000213e:	cc                   	int3
   14000213f:	cc                   	int3
   140002140:	e9 eb ff ff ff       	jmp    0x140002130
   140002145:	cc                   	int3
   140002146:	cc                   	int3
   140002147:	cc                   	int3
   140002148:	cc                   	int3
   140002149:	cc                   	int3
   14000214a:	cc                   	int3
   14000214b:	cc                   	int3
   14000214c:	cc                   	int3
   14000214d:	cc                   	int3
   14000214e:	cc                   	int3
   14000214f:	cc                   	int3
   140002150:	40 53                	rex push rbx
   140002152:	48 83 ec 20          	sub    rsp,0x20
   140002156:	48 8d 05 7b 21 00 00 	lea    rax,[rip+0x217b]        # 0x1400042d8
   14000215d:	48 8b d9             	mov    rbx,rcx
   140002160:	48 89 01             	mov    QWORD PTR [rcx],rax
   140002163:	f6 c2 01             	test   dl,0x1
   140002166:	74 0a                	je     0x140002172
   140002168:	ba 18 00 00 00       	mov    edx,0x18
   14000216d:	e8 ce ff ff ff       	call   0x140002140
   140002172:	48 8b c3             	mov    rax,rbx
   140002175:	48 83 c4 20          	add    rsp,0x20
   140002179:	5b                   	pop    rbx
   14000217a:	c3                   	ret
   14000217b:	cc                   	int3
   14000217c:	cc                   	int3
   14000217d:	cc                   	int3
   14000217e:	cc                   	int3
   14000217f:	cc                   	int3
   140002180:	40 53                	rex push rbx
   140002182:	48 83 ec 20          	sub    rsp,0x20
   140002186:	b9 01 00 00 00       	mov    ecx,0x1
   14000218b:	e8 5c 0b 00 00       	call   0x140002cec
   140002190:	e8 1b 06 00 00       	call   0x1400027b0
   140002195:	8b c8                	mov    ecx,eax
   140002197:	e8 86 0b 00 00       	call   0x140002d22
   14000219c:	e8 ef 05 00 00       	call   0x140002790
   1400021a1:	8b d8                	mov    ebx,eax
   1400021a3:	e8 aa 0b 00 00       	call   0x140002d52
   1400021a8:	b9 01 00 00 00       	mov    ecx,0x1
   1400021ad:	89 18                	mov    DWORD PTR [rax],ebx
   1400021af:	e8 3c 03 00 00       	call   0x1400024f0
   1400021b4:	84 c0                	test   al,al
   1400021b6:	74 73                	je     0x14000222b
   1400021b8:	e8 93 07 00 00       	call   0x140002950
   1400021bd:	48 8d 0d dc 07 00 00 	lea    rcx,[rip+0x7dc]        # 0x1400029a0
   1400021c4:	e8 c7 04 00 00       	call   0x140002690
   1400021c9:	e8 d2 05 00 00       	call   0x1400027a0
   1400021ce:	8b c8                	mov    ecx,eax
   1400021d0:	e8 23 0b 00 00       	call   0x140002cf8
   1400021d5:	85 c0                	test   eax,eax
   1400021d7:	75 52                	jne    0x14000222b
   1400021d9:	e8 e2 05 00 00       	call   0x1400027c0
   1400021de:	e8 4d 06 00 00       	call   0x140002830
   1400021e3:	85 c0                	test   eax,eax
   1400021e5:	74 0c                	je     0x1400021f3
   1400021e7:	48 8d 0d a2 05 00 00 	lea    rcx,[rip+0x5a2]        # 0x140002790
   1400021ee:	e8 ff 0a 00 00       	call   0x140002cf2
   1400021f3:	e8 e8 05 00 00       	call   0x1400027e0
   1400021f8:	e8 e3 05 00 00       	call   0x1400027e0
   1400021fd:	e8 8e 05 00 00       	call   0x140002790
   140002202:	8b c8                	mov    ecx,eax
   140002204:	e8 3d 0b 00 00       	call   0x140002d46
   140002209:	e8 c2 05 00 00       	call   0x1400027d0
   14000220e:	84 c0                	test   al,al
   140002210:	74 05                	je     0x140002217
   140002212:	e8 e7 0a 00 00       	call   0x140002cfe
   140002217:	e8 74 05 00 00       	call   0x140002790
   14000221c:	e8 4f 06 00 00       	call   0x140002870
   140002221:	85 c0                	test   eax,eax
   140002223:	75 06                	jne    0x14000222b
   140002225:	48 83 c4 20          	add    rsp,0x20
   140002229:	5b                   	pop    rbx
   14000222a:	c3                   	ret
   14000222b:	b9 07 00 00 00       	mov    ecx,0x7
   140002230:	e8 2b 06 00 00       	call   0x140002860
   140002235:	cc                   	int3
   140002236:	cc                   	int3
   140002237:	cc                   	int3
   140002238:	cc                   	int3
   140002239:	cc                   	int3
   14000223a:	cc                   	int3
   14000223b:	cc                   	int3
   14000223c:	cc                   	int3
   14000223d:	cc                   	int3
   14000223e:	cc                   	int3
   14000223f:	cc                   	int3
   140002240:	48 83 ec 28          	sub    rsp,0x28
   140002244:	e8 c7 05 00 00       	call   0x140002810
   140002249:	33 c0                	xor    eax,eax
   14000224b:	48 83 c4 28          	add    rsp,0x28
   14000224f:	c3                   	ret
   140002250:	48 83 ec 28          	sub    rsp,0x28
   140002254:	e8 87 06 00 00       	call   0x1400028e0
   140002259:	e8 32 05 00 00       	call   0x140002790
   14000225e:	8b c8                	mov    ecx,eax
   140002260:	48 83 c4 28          	add    rsp,0x28
   140002264:	e9 e3 0a 00 00       	jmp    0x140002d4c
   140002269:	cc                   	int3
   14000226a:	cc                   	int3
   14000226b:	cc                   	int3
   14000226c:	cc                   	int3
   14000226d:	cc                   	int3
   14000226e:	cc                   	int3
   14000226f:	cc                   	int3
   140002270:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002275:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   14000227a:	57                   	push   rdi
   14000227b:	48 83 ec 30          	sub    rsp,0x30
   14000227f:	b9 01 00 00 00       	mov    ecx,0x1
   140002284:	e8 27 02 00 00       	call   0x1400024b0
   140002289:	84 c0                	test   al,al
   14000228b:	0f 84 39 01 00 00    	je     0x1400023ca
   140002291:	40 32 f6             	xor    sil,sil
   140002294:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140002299:	e8 c2 01 00 00       	call   0x140002460
   14000229e:	0f b6 d8             	movzx  ebx,al
   1400022a1:	8b 0d 79 3e 00 00    	mov    ecx,DWORD PTR [rip+0x3e79]        # 0x140006120
   1400022a7:	83 f9 01             	cmp    ecx,0x1
   1400022aa:	0f 84 25 01 00 00    	je     0x1400023d5
   1400022b0:	85 c9                	test   ecx,ecx
   1400022b2:	75 4a                	jne    0x1400022fe
   1400022b4:	c7 05 62 3e 00 00 01 	mov    DWORD PTR [rip+0x3e62],0x1        # 0x140006120
   1400022bb:	00 00 00 
   1400022be:	48 8d 15 e3 1f 00 00 	lea    rdx,[rip+0x1fe3]        # 0x1400042a8
   1400022c5:	48 8d 0d c4 1f 00 00 	lea    rcx,[rip+0x1fc4]        # 0x140004290
   1400022cc:	e8 3f 0a 00 00       	call   0x140002d10
   1400022d1:	85 c0                	test   eax,eax
   1400022d3:	74 0a                	je     0x1400022df
   1400022d5:	b8 ff 00 00 00       	mov    eax,0xff
   1400022da:	e9 db 00 00 00       	jmp    0x1400023ba
   1400022df:	48 8d 15 a2 1f 00 00 	lea    rdx,[rip+0x1fa2]        # 0x140004288
   1400022e6:	48 8d 0d 8b 1f 00 00 	lea    rcx,[rip+0x1f8b]        # 0x140004278
   1400022ed:	e8 18 0a 00 00       	call   0x140002d0a
   1400022f2:	c7 05 24 3e 00 00 02 	mov    DWORD PTR [rip+0x3e24],0x2        # 0x140006120
   1400022f9:	00 00 00 
   1400022fc:	eb 08                	jmp    0x140002306
   1400022fe:	40 b6 01             	mov    sil,0x1
   140002301:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140002306:	0f b6 cb             	movzx  ecx,bl
   140002309:	e8 22 03 00 00       	call   0x140002630
   14000230e:	e8 2d 05 00 00       	call   0x140002840
   140002313:	48 8b d8             	mov    rbx,rax
   140002316:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   14000231a:	74 1f                	je     0x14000233b
   14000231c:	48 8b c8             	mov    rcx,rax
   14000231f:	e8 6c 02 00 00       	call   0x140002590
   140002324:	84 c0                	test   al,al
   140002326:	74 13                	je     0x14000233b
   140002328:	45 33 c0             	xor    r8d,r8d
   14000232b:	ba 02 00 00 00       	mov    edx,0x2
   140002330:	33 c9                	xor    ecx,ecx
   140002332:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002335:	ff 15 15 1f 00 00    	call   QWORD PTR [rip+0x1f15]        # 0x140004250
   14000233b:	e8 10 05 00 00       	call   0x140002850
   140002340:	48 8b d8             	mov    rbx,rax
   140002343:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140002347:	74 14                	je     0x14000235d
   140002349:	48 8b c8             	mov    rcx,rax
   14000234c:	e8 3f 02 00 00       	call   0x140002590
   140002351:	84 c0                	test   al,al
   140002353:	74 08                	je     0x14000235d
   140002355:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140002358:	e8 e3 09 00 00       	call   0x140002d40
   14000235d:	e8 a2 09 00 00       	call   0x140002d04
   140002362:	48 8b f8             	mov    rdi,rax
   140002365:	e8 c4 09 00 00       	call   0x140002d2e
   14000236a:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   14000236d:	e8 b6 09 00 00       	call   0x140002d28
   140002372:	4c 8b c7             	mov    r8,rdi
   140002375:	48 8b d3             	mov    rdx,rbx
   140002378:	8b 08                	mov    ecx,DWORD PTR [rax]
   14000237a:	e8 e1 f3 ff ff       	call   0x140001760
   14000237f:	8b d8                	mov    ebx,eax
   140002381:	e8 fa 04 00 00       	call   0x140002880
   140002386:	84 c0                	test   al,al
   140002388:	74 55                	je     0x1400023df
   14000238a:	40 84 f6             	test   sil,sil
   14000238d:	75 05                	jne    0x140002394
   14000238f:	e8 a0 09 00 00       	call   0x140002d34
   140002394:	33 d2                	xor    edx,edx
   140002396:	b1 01                	mov    cl,0x1
   140002398:	e8 c3 02 00 00       	call   0x140002660
   14000239d:	8b c3                	mov    eax,ebx
   14000239f:	eb 19                	jmp    0x1400023ba
   1400023a1:	8b d8                	mov    ebx,eax
   1400023a3:	e8 d8 04 00 00       	call   0x140002880
   1400023a8:	84 c0                	test   al,al
   1400023aa:	74 3b                	je     0x1400023e7
   1400023ac:	80 7c 24 20 00       	cmp    BYTE PTR [rsp+0x20],0x0
   1400023b1:	75 05                	jne    0x1400023b8
   1400023b3:	e8 82 09 00 00       	call   0x140002d3a
   1400023b8:	8b c3                	mov    eax,ebx
   1400023ba:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   1400023bf:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   1400023c4:	48 83 c4 30          	add    rsp,0x30
   1400023c8:	5f                   	pop    rdi
   1400023c9:	c3                   	ret
   1400023ca:	b9 07 00 00 00       	mov    ecx,0x7
   1400023cf:	e8 8c 04 00 00       	call   0x140002860
   1400023d4:	90                   	nop
   1400023d5:	b9 07 00 00 00       	mov    ecx,0x7
   1400023da:	e8 81 04 00 00       	call   0x140002860
   1400023df:	8b cb                	mov    ecx,ebx
   1400023e1:	e8 30 09 00 00       	call   0x140002d16
   1400023e6:	90                   	nop
   1400023e7:	8b cb                	mov    ecx,ebx
   1400023e9:	e8 2e 09 00 00       	call   0x140002d1c
   1400023ee:	90                   	nop
   1400023ef:	cc                   	int3
   1400023f0:	48 83 ec 28          	sub    rsp,0x28
   1400023f4:	e8 d7 02 00 00       	call   0x1400026d0
   1400023f9:	48 83 c4 28          	add    rsp,0x28
   1400023fd:	e9 6e fe ff ff       	jmp    0x140002270
   140002402:	cc                   	int3
   140002403:	cc                   	int3
   140002404:	cc                   	int3
   140002405:	cc                   	int3
   140002406:	cc                   	int3
   140002407:	cc                   	int3
   140002408:	cc                   	int3
   140002409:	cc                   	int3
   14000240a:	cc                   	int3
   14000240b:	cc                   	int3
   14000240c:	cc                   	int3
   14000240d:	cc                   	int3
   14000240e:	cc                   	int3
   14000240f:	cc                   	int3
   140002410:	48 8d 05 f9 1e 00 00 	lea    rax,[rip+0x1ef9]        # 0x140004310
   140002417:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   14000241e:	00 
   14000241f:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   140002423:	48 8d 05 d6 1e 00 00 	lea    rax,[rip+0x1ed6]        # 0x140004300
   14000242a:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000242d:	48 8b c1             	mov    rax,rcx
   140002430:	c3                   	ret
   140002431:	cc                   	int3
   140002432:	cc                   	int3
   140002433:	cc                   	int3
   140002434:	cc                   	int3
   140002435:	cc                   	int3
   140002436:	cc                   	int3
   140002437:	cc                   	int3
   140002438:	cc                   	int3
   140002439:	cc                   	int3
   14000243a:	cc                   	int3
   14000243b:	cc                   	int3
   14000243c:	cc                   	int3
   14000243d:	cc                   	int3
   14000243e:	cc                   	int3
   14000243f:	cc                   	int3
   140002440:	48 83 ec 48          	sub    rsp,0x48
   140002444:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140002449:	e8 c2 ff ff ff       	call   0x140002410
   14000244e:	48 8d 15 1b 2b 00 00 	lea    rdx,[rip+0x2b1b]        # 0x140004f70
   140002455:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000245a:	e8 63 08 00 00       	call   0x140002cc2
   14000245f:	cc                   	int3
   140002460:	48 83 ec 28          	sub    rsp,0x28
   140002464:	e8 37 08 00 00       	call   0x140002ca0
   140002469:	85 c0                	test   eax,eax
   14000246b:	74 2c                	je     0x140002499
   14000246d:	65 48 8b 04 25 30 00 	mov    rax,QWORD PTR gs:0x30
   140002474:	00 00 
   140002476:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   14000247a:	33 c0                	xor    eax,eax
   14000247c:	f0 48 0f b1 0d a3 3c 	lock cmpxchg QWORD PTR [rip+0x3ca3],rcx        # 0x140006128
   140002483:	00 00 
   140002485:	74 12                	je     0x140002499
   140002487:	48 3b c8             	cmp    rcx,rax
   14000248a:	74 14                	je     0x1400024a0
   14000248c:	33 c0                	xor    eax,eax
   14000248e:	f0 48 0f b1 0d 91 3c 	lock cmpxchg QWORD PTR [rip+0x3c91],rcx        # 0x140006128
   140002495:	00 00 
   140002497:	75 ee                	jne    0x140002487
   140002499:	32 c0                	xor    al,al
   14000249b:	48 83 c4 28          	add    rsp,0x28
   14000249f:	c3                   	ret
   1400024a0:	b0 01                	mov    al,0x1
   1400024a2:	48 83 c4 28          	add    rsp,0x28
   1400024a6:	c3                   	ret
   1400024a7:	cc                   	int3
   1400024a8:	cc                   	int3
   1400024a9:	cc                   	int3
   1400024aa:	cc                   	int3
   1400024ab:	cc                   	int3
   1400024ac:	cc                   	int3
   1400024ad:	cc                   	int3
   1400024ae:	cc                   	int3
   1400024af:	cc                   	int3
   1400024b0:	48 83 ec 28          	sub    rsp,0x28
   1400024b4:	85 c9                	test   ecx,ecx
   1400024b6:	75 07                	jne    0x1400024bf
   1400024b8:	c6 05 71 3c 00 00 01 	mov    BYTE PTR [rip+0x3c71],0x1        # 0x140006130
   1400024bf:	e8 2c 05 00 00       	call   0x1400029f0
   1400024c4:	e8 07 03 00 00       	call   0x1400027d0
   1400024c9:	84 c0                	test   al,al
   1400024cb:	74 10                	je     0x1400024dd
   1400024cd:	e8 fe 02 00 00       	call   0x1400027d0
   1400024d2:	84 c0                	test   al,al
   1400024d4:	75 0e                	jne    0x1400024e4
   1400024d6:	33 c9                	xor    ecx,ecx
   1400024d8:	e8 f3 02 00 00       	call   0x1400027d0
   1400024dd:	32 c0                	xor    al,al
   1400024df:	48 83 c4 28          	add    rsp,0x28
   1400024e3:	c3                   	ret
   1400024e4:	b0 01                	mov    al,0x1
   1400024e6:	48 83 c4 28          	add    rsp,0x28
   1400024ea:	c3                   	ret
   1400024eb:	cc                   	int3
   1400024ec:	cc                   	int3
   1400024ed:	cc                   	int3
   1400024ee:	cc                   	int3
   1400024ef:	cc                   	int3
   1400024f0:	40 53                	rex push rbx
   1400024f2:	48 83 ec 20          	sub    rsp,0x20
   1400024f6:	80 3d 34 3c 00 00 00 	cmp    BYTE PTR [rip+0x3c34],0x0        # 0x140006131
   1400024fd:	8b d9                	mov    ebx,ecx
   1400024ff:	75 6f                	jne    0x140002570
   140002501:	83 f9 01             	cmp    ecx,0x1
   140002504:	77 72                	ja     0x140002578
   140002506:	e8 95 07 00 00       	call   0x140002ca0
   14000250b:	85 c0                	test   eax,eax
   14000250d:	74 2c                	je     0x14000253b
   14000250f:	85 db                	test   ebx,ebx
   140002511:	75 28                	jne    0x14000253b
   140002513:	48 8d 0d 1e 3c 00 00 	lea    rcx,[rip+0x3c1e]        # 0x140006138
   14000251a:	e8 39 08 00 00       	call   0x140002d58
   14000251f:	85 c0                	test   eax,eax
   140002521:	75 10                	jne    0x140002533
   140002523:	48 8d 0d 26 3c 00 00 	lea    rcx,[rip+0x3c26]        # 0x140006150
   14000252a:	e8 29 08 00 00       	call   0x140002d58
   14000252f:	85 c0                	test   eax,eax
   140002531:	74 36                	je     0x140002569
   140002533:	32 c0                	xor    al,al
   140002535:	48 83 c4 20          	add    rsp,0x20
   140002539:	5b                   	pop    rbx
   14000253a:	c3                   	ret
   14000253b:	66 0f 6f 05 fd 1d 00 	movdqa xmm0,XMMWORD PTR [rip+0x1dfd]        # 0x140004340
   140002542:	00 
   140002543:	f3 0f 7f 05 ed 3b 00 	movdqu XMMWORD PTR [rip+0x3bed],xmm0        # 0x140006138
   14000254a:	00 
   14000254b:	48 c7 05 f2 3b 00 00 	mov    QWORD PTR [rip+0x3bf2],0xffffffffffffffff        # 0x140006148
   140002552:	ff ff ff ff 
   140002556:	f3 0f 7f 05 f2 3b 00 	movdqu XMMWORD PTR [rip+0x3bf2],xmm0        # 0x140006150
   14000255d:	00 
   14000255e:	48 c7 05 f7 3b 00 00 	mov    QWORD PTR [rip+0x3bf7],0xffffffffffffffff        # 0x140006160
   140002565:	ff ff ff ff 
   140002569:	c6 05 c1 3b 00 00 01 	mov    BYTE PTR [rip+0x3bc1],0x1        # 0x140006131
   140002570:	b0 01                	mov    al,0x1
   140002572:	48 83 c4 20          	add    rsp,0x20
   140002576:	5b                   	pop    rbx
   140002577:	c3                   	ret
   140002578:	b9 05 00 00 00       	mov    ecx,0x5
   14000257d:	e8 de 02 00 00       	call   0x140002860
   140002582:	cc                   	int3
   140002583:	cc                   	int3
   140002584:	cc                   	int3
   140002585:	cc                   	int3
   140002586:	cc                   	int3
   140002587:	cc                   	int3
   140002588:	cc                   	int3
   140002589:	cc                   	int3
   14000258a:	cc                   	int3
   14000258b:	cc                   	int3
   14000258c:	cc                   	int3
   14000258d:	cc                   	int3
   14000258e:	cc                   	int3
   14000258f:	cc                   	int3
   140002590:	48 83 ec 18          	sub    rsp,0x18
   140002594:	4c 8b c1             	mov    r8,rcx
   140002597:	b8 4d 5a 00 00       	mov    eax,0x5a4d
   14000259c:	66 39 05 5d da ff ff 	cmp    WORD PTR [rip+0xffffffffffffda5d],ax        # 0x140000000
   1400025a3:	75 71                	jne    0x140002616
   1400025a5:	48 63 0d 90 da ff ff 	movsxd rcx,DWORD PTR [rip+0xffffffffffffda90]        # 0x14000003c
   1400025ac:	48 8d 15 4d da ff ff 	lea    rdx,[rip+0xffffffffffffda4d]        # 0x140000000
   1400025b3:	48 03 ca             	add    rcx,rdx
   1400025b6:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   1400025bc:	75 58                	jne    0x140002616
   1400025be:	b8 0b 02 00 00       	mov    eax,0x20b
   1400025c3:	66 39 41 18          	cmp    WORD PTR [rcx+0x18],ax
   1400025c7:	75 4d                	jne    0x140002616
   1400025c9:	4c 2b c2             	sub    r8,rdx
   1400025cc:	0f b7 41 14          	movzx  eax,WORD PTR [rcx+0x14]
   1400025d0:	48 83 c0 18          	add    rax,0x18
   1400025d4:	48 03 c1             	add    rax,rcx
   1400025d7:	0f b7 49 06          	movzx  ecx,WORD PTR [rcx+0x6]
   1400025db:	48 8d 14 89          	lea    rdx,[rcx+rcx*4]
   1400025df:	4c 8d 0c d0          	lea    r9,[rax+rdx*8]
   1400025e3:	48 89 04 24          	mov    QWORD PTR [rsp],rax
   1400025e7:	49 3b c1             	cmp    rax,r9
   1400025ea:	74 26                	je     0x140002612
   1400025ec:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   1400025ef:	4c 3b c2             	cmp    r8,rdx
   1400025f2:	72 18                	jb     0x14000260c
   1400025f4:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
   1400025f7:	03 ca                	add    ecx,edx
   1400025f9:	4c 3b c1             	cmp    r8,rcx
   1400025fc:	73 0e                	jae    0x14000260c
   1400025fe:	83 78 24 00          	cmp    DWORD PTR [rax+0x24],0x0
   140002602:	7d 04                	jge    0x140002608
   140002604:	32 c0                	xor    al,al
   140002606:	eb 14                	jmp    0x14000261c
   140002608:	b0 01                	mov    al,0x1
   14000260a:	eb 10                	jmp    0x14000261c
   14000260c:	48 83 c0 28          	add    rax,0x28
   140002610:	eb d1                	jmp    0x1400025e3
   140002612:	32 c0                	xor    al,al
   140002614:	eb 06                	jmp    0x14000261c
   140002616:	32 c0                	xor    al,al
   140002618:	eb 02                	jmp    0x14000261c
   14000261a:	32 c0                	xor    al,al
   14000261c:	48 83 c4 18          	add    rsp,0x18
   140002620:	c3                   	ret
   140002621:	cc                   	int3
   140002622:	cc                   	int3
   140002623:	cc                   	int3
   140002624:	cc                   	int3
   140002625:	cc                   	int3
   140002626:	cc                   	int3
   140002627:	cc                   	int3
   140002628:	cc                   	int3
   140002629:	cc                   	int3
   14000262a:	cc                   	int3
   14000262b:	cc                   	int3
   14000262c:	cc                   	int3
   14000262d:	cc                   	int3
   14000262e:	cc                   	int3
   14000262f:	cc                   	int3
   140002630:	40 53                	rex push rbx
   140002632:	48 83 ec 20          	sub    rsp,0x20
   140002636:	0f b6 d9             	movzx  ebx,cl
   140002639:	e8 62 06 00 00       	call   0x140002ca0
   14000263e:	85 c0                	test   eax,eax
   140002640:	74 0d                	je     0x14000264f
   140002642:	84 db                	test   bl,bl
   140002644:	75 09                	jne    0x14000264f
   140002646:	33 c0                	xor    eax,eax
   140002648:	48 87 05 d9 3a 00 00 	xchg   QWORD PTR [rip+0x3ad9],rax        # 0x140006128
   14000264f:	48 83 c4 20          	add    rsp,0x20
   140002653:	5b                   	pop    rbx
   140002654:	c3                   	ret
   140002655:	cc                   	int3
   140002656:	cc                   	int3
   140002657:	cc                   	int3
   140002658:	cc                   	int3
   140002659:	cc                   	int3
   14000265a:	cc                   	int3
   14000265b:	cc                   	int3
   14000265c:	cc                   	int3
   14000265d:	cc                   	int3
   14000265e:	cc                   	int3
   14000265f:	cc                   	int3
   140002660:	40 53                	rex push rbx
   140002662:	48 83 ec 20          	sub    rsp,0x20
   140002666:	80 3d c3 3a 00 00 00 	cmp    BYTE PTR [rip+0x3ac3],0x0        # 0x140006130
   14000266d:	0f b6 d9             	movzx  ebx,cl
   140002670:	74 04                	je     0x140002676
   140002672:	84 d2                	test   dl,dl
   140002674:	75 0d                	jne    0x140002683
   140002676:	e8 55 01 00 00       	call   0x1400027d0
   14000267b:	0f b6 cb             	movzx  ecx,bl
   14000267e:	e8 4d 01 00 00       	call   0x1400027d0
   140002683:	b0 01                	mov    al,0x1
   140002685:	48 83 c4 20          	add    rsp,0x20
   140002689:	5b                   	pop    rbx
   14000268a:	c3                   	ret
   14000268b:	cc                   	int3
   14000268c:	cc                   	int3
   14000268d:	cc                   	int3
   14000268e:	cc                   	int3
   14000268f:	cc                   	int3
   140002690:	40 53                	rex push rbx
   140002692:	48 83 ec 20          	sub    rsp,0x20
   140002696:	48 83 3d 9a 3a 00 00 	cmp    QWORD PTR [rip+0x3a9a],0xffffffffffffffff        # 0x140006138
   14000269d:	ff 
   14000269e:	48 8b d9             	mov    rbx,rcx
   1400026a1:	75 07                	jne    0x1400026aa
   1400026a3:	e8 bc 06 00 00       	call   0x140002d64
   1400026a8:	eb 0f                	jmp    0x1400026b9
   1400026aa:	48 8b d3             	mov    rdx,rbx
   1400026ad:	48 8d 0d 84 3a 00 00 	lea    rcx,[rip+0x3a84]        # 0x140006138
   1400026b4:	e8 a5 06 00 00       	call   0x140002d5e
   1400026b9:	33 d2                	xor    edx,edx
   1400026bb:	85 c0                	test   eax,eax
   1400026bd:	48 0f 44 d3          	cmove  rdx,rbx
   1400026c1:	48 f7 da             	neg    rdx
   1400026c4:	1b c0                	sbb    eax,eax
   1400026c6:	f7 d8                	neg    eax
   1400026c8:	ff c8                	dec    eax
   1400026ca:	48 83 c4 20          	add    rsp,0x20
   1400026ce:	5b                   	pop    rbx
   1400026cf:	c3                   	ret
   1400026d0:	40 53                	rex push rbx
   1400026d2:	48 83 ec 30          	sub    rsp,0x30
   1400026d6:	48 8b 05 23 39 00 00 	mov    rax,QWORD PTR [rip+0x3923]        # 0x140006000
   1400026dd:	48 bb 32 a2 df 2d 99 	movabs rbx,0x2b992ddfa232
   1400026e4:	2b 00 00 
   1400026e7:	48 3b c3             	cmp    rax,rbx
   1400026ea:	74 10                	je     0x1400026fc
   1400026ec:	48 f7 d0             	not    rax
   1400026ef:	48 89 05 4a 39 00 00 	mov    QWORD PTR [rip+0x394a],rax        # 0x140006040
   1400026f6:	48 83 c4 30          	add    rsp,0x30
   1400026fa:	5b                   	pop    rbx
   1400026fb:	c3                   	ret
   1400026fc:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   140002701:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   140002708:	00 00 
   14000270a:	ff 15 00 19 00 00    	call   QWORD PTR [rip+0x1900]        # 0x140004010
   140002710:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   140002715:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000271a:	ff 15 e8 18 00 00    	call   QWORD PTR [rip+0x18e8]        # 0x140004008
   140002720:	8b c0                	mov    eax,eax
   140002722:	48 31 44 24 20       	xor    QWORD PTR [rsp+0x20],rax
   140002727:	ff 15 03 19 00 00    	call   QWORD PTR [rip+0x1903]        # 0x140004030
   14000272d:	8b c0                	mov    eax,eax
   14000272f:	48 8d 4c 24 48       	lea    rcx,[rsp+0x48]
   140002734:	48 31 44 24 20       	xor    QWORD PTR [rsp+0x20],rax
   140002739:	ff 15 e9 18 00 00    	call   QWORD PTR [rip+0x18e9]        # 0x140004028
   14000273f:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   140002744:	8b c8                	mov    ecx,eax
   140002746:	48 c1 e1 20          	shl    rcx,0x20
   14000274a:	48 33 c8             	xor    rcx,rax
   14000274d:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   140002752:	48 33 4c 24 20       	xor    rcx,QWORD PTR [rsp+0x20]
   140002757:	48 33 c8             	xor    rcx,rax
   14000275a:	48 b8 ff ff ff ff ff 	movabs rax,0xffffffffffff
   140002761:	ff 00 00 
   140002764:	48 23 c8             	and    rcx,rax
   140002767:	48 b8 33 a2 df 2d 99 	movabs rax,0x2b992ddfa233
   14000276e:	2b 00 00 
   140002771:	48 3b cb             	cmp    rcx,rbx
   140002774:	48 0f 44 c8          	cmove  rcx,rax
   140002778:	48 89 0d 81 38 00 00 	mov    QWORD PTR [rip+0x3881],rcx        # 0x140006000
   14000277f:	48 f7 d1             	not    rcx
   140002782:	48 89 0d b7 38 00 00 	mov    QWORD PTR [rip+0x38b7],rcx        # 0x140006040
   140002789:	48 83 c4 30          	add    rsp,0x30
   14000278d:	5b                   	pop    rbx
   14000278e:	c3                   	ret
   14000278f:	cc                   	int3
   140002790:	33 c0                	xor    eax,eax
   140002792:	c3                   	ret
   140002793:	cc                   	int3
   140002794:	cc                   	int3
   140002795:	cc                   	int3
   140002796:	cc                   	int3
   140002797:	cc                   	int3
   140002798:	cc                   	int3
   140002799:	cc                   	int3
   14000279a:	cc                   	int3
   14000279b:	cc                   	int3
   14000279c:	cc                   	int3
   14000279d:	cc                   	int3
   14000279e:	cc                   	int3
   14000279f:	cc                   	int3
   1400027a0:	b8 01 00 00 00       	mov    eax,0x1
   1400027a5:	c3                   	ret
   1400027a6:	cc                   	int3
   1400027a7:	cc                   	int3
   1400027a8:	cc                   	int3
   1400027a9:	cc                   	int3
   1400027aa:	cc                   	int3
   1400027ab:	cc                   	int3
   1400027ac:	cc                   	int3
   1400027ad:	cc                   	int3
   1400027ae:	cc                   	int3
   1400027af:	cc                   	int3
   1400027b0:	b8 00 40 00 00       	mov    eax,0x4000
   1400027b5:	c3                   	ret
   1400027b6:	cc                   	int3
   1400027b7:	cc                   	int3
   1400027b8:	cc                   	int3
   1400027b9:	cc                   	int3
   1400027ba:	cc                   	int3
   1400027bb:	cc                   	int3
   1400027bc:	cc                   	int3
   1400027bd:	cc                   	int3
   1400027be:	cc                   	int3
   1400027bf:	cc                   	int3
   1400027c0:	48 8d 0d a9 39 00 00 	lea    rcx,[rip+0x39a9]        # 0x140006170
   1400027c7:	48 ff 25 4a 18 00 00 	rex.W jmp QWORD PTR [rip+0x184a]        # 0x140004018
   1400027ce:	cc                   	int3
   1400027cf:	cc                   	int3
   1400027d0:	b0 01                	mov    al,0x1
   1400027d2:	c3                   	ret
   1400027d3:	cc                   	int3
   1400027d4:	cc                   	int3
   1400027d5:	cc                   	int3
   1400027d6:	cc                   	int3
   1400027d7:	cc                   	int3
   1400027d8:	cc                   	int3
   1400027d9:	cc                   	int3
   1400027da:	cc                   	int3
   1400027db:	cc                   	int3
   1400027dc:	cc                   	int3
   1400027dd:	cc                   	int3
   1400027de:	cc                   	int3
   1400027df:	cc                   	int3
   1400027e0:	c2 00 00             	ret    0x0
   1400027e3:	cc                   	int3
   1400027e4:	cc                   	int3
   1400027e5:	cc                   	int3
   1400027e6:	cc                   	int3
   1400027e7:	cc                   	int3
   1400027e8:	cc                   	int3
   1400027e9:	cc                   	int3
   1400027ea:	cc                   	int3
   1400027eb:	cc                   	int3
   1400027ec:	cc                   	int3
   1400027ed:	cc                   	int3
   1400027ee:	cc                   	int3
   1400027ef:	cc                   	int3
   1400027f0:	48 8d 05 89 39 00 00 	lea    rax,[rip+0x3989]        # 0x140006180
   1400027f7:	c3                   	ret
   1400027f8:	cc                   	int3
   1400027f9:	cc                   	int3
   1400027fa:	cc                   	int3
   1400027fb:	cc                   	int3
   1400027fc:	cc                   	int3
   1400027fd:	cc                   	int3
   1400027fe:	cc                   	int3
   1400027ff:	cc                   	int3
   140002800:	48 8d 05 81 39 00 00 	lea    rax,[rip+0x3981]        # 0x140006188
   140002807:	c3                   	ret
   140002808:	cc                   	int3
   140002809:	cc                   	int3
   14000280a:	cc                   	int3
   14000280b:	cc                   	int3
   14000280c:	cc                   	int3
   14000280d:	cc                   	int3
   14000280e:	cc                   	int3
   14000280f:	cc                   	int3
   140002810:	48 83 ec 28          	sub    rsp,0x28
   140002814:	e8 d7 ff ff ff       	call   0x1400027f0
   140002819:	48 83 08 24          	or     QWORD PTR [rax],0x24
   14000281d:	e8 de ff ff ff       	call   0x140002800
   140002822:	48 83 08 02          	or     QWORD PTR [rax],0x2
   140002826:	48 83 c4 28          	add    rsp,0x28
   14000282a:	c3                   	ret
   14000282b:	cc                   	int3
   14000282c:	cc                   	int3
   14000282d:	cc                   	int3
   14000282e:	cc                   	int3
   14000282f:	cc                   	int3
   140002830:	33 c0                	xor    eax,eax
   140002832:	39 05 14 38 00 00    	cmp    DWORD PTR [rip+0x3814],eax        # 0x14000604c
   140002838:	0f 94 c0             	sete   al
   14000283b:	c3                   	ret
   14000283c:	cc                   	int3
   14000283d:	cc                   	int3
   14000283e:	cc                   	int3
   14000283f:	cc                   	int3
   140002840:	48 8d 05 61 39 00 00 	lea    rax,[rip+0x3961]        # 0x1400061a8
   140002847:	c3                   	ret
   140002848:	cc                   	int3
   140002849:	cc                   	int3
   14000284a:	cc                   	int3
   14000284b:	cc                   	int3
   14000284c:	cc                   	int3
   14000284d:	cc                   	int3
   14000284e:	cc                   	int3
   14000284f:	cc                   	int3
   140002850:	48 8d 05 49 39 00 00 	lea    rax,[rip+0x3949]        # 0x1400061a0
   140002857:	c3                   	ret
   140002858:	cc                   	int3
   140002859:	cc                   	int3
   14000285a:	cc                   	int3
   14000285b:	cc                   	int3
   14000285c:	cc                   	int3
   14000285d:	cc                   	int3
   14000285e:	cc                   	int3
   14000285f:	cc                   	int3
   140002860:	8b c9                	mov    ecx,ecx
   140002862:	cd 29                	int    0x29
   140002864:	c3                   	ret
   140002865:	cc                   	int3
   140002866:	cc                   	int3
   140002867:	cc                   	int3
   140002868:	cc                   	int3
   140002869:	cc                   	int3
   14000286a:	cc                   	int3
   14000286b:	cc                   	int3
   14000286c:	cc                   	int3
   14000286d:	cc                   	int3
   14000286e:	cc                   	int3
   14000286f:	cc                   	int3
   140002870:	e9 1b ff ff ff       	jmp    0x140002790
   140002875:	cc                   	int3
   140002876:	cc                   	int3
   140002877:	cc                   	int3
   140002878:	cc                   	int3
   140002879:	cc                   	int3
   14000287a:	cc                   	int3
   14000287b:	cc                   	int3
   14000287c:	cc                   	int3
   14000287d:	cc                   	int3
   14000287e:	cc                   	int3
   14000287f:	cc                   	int3
   140002880:	48 83 ec 28          	sub    rsp,0x28
   140002884:	33 c9                	xor    ecx,ecx
   140002886:	ff 15 74 17 00 00    	call   QWORD PTR [rip+0x1774]        # 0x140004000
   14000288c:	48 85 c0             	test   rax,rax
   14000288f:	74 3d                	je     0x1400028ce
   140002891:	b9 4d 5a 00 00       	mov    ecx,0x5a4d
   140002896:	66 39 08             	cmp    WORD PTR [rax],cx
   140002899:	75 33                	jne    0x1400028ce
   14000289b:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   14000289f:	81 3c 01 50 45 00 00 	cmp    DWORD PTR [rcx+rax*1],0x4550
   1400028a6:	75 26                	jne    0x1400028ce
   1400028a8:	ba 0b 02 00 00       	mov    edx,0x20b
   1400028ad:	66 39 54 01 18       	cmp    WORD PTR [rcx+rax*1+0x18],dx
   1400028b2:	75 1a                	jne    0x1400028ce
   1400028b4:	83 bc 01 84 00 00 00 	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   1400028bb:	0e 
   1400028bc:	76 10                	jbe    0x1400028ce
   1400028be:	83 bc 01 f8 00 00 00 	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   1400028c5:	00 
   1400028c6:	0f 95 c0             	setne  al
   1400028c9:	48 83 c4 28          	add    rsp,0x28
   1400028cd:	c3                   	ret
   1400028ce:	32 c0                	xor    al,al
   1400028d0:	48 83 c4 28          	add    rsp,0x28
   1400028d4:	c3                   	ret
   1400028d5:	cc                   	int3
   1400028d6:	cc                   	int3
   1400028d7:	cc                   	int3
   1400028d8:	cc                   	int3
   1400028d9:	cc                   	int3
   1400028da:	cc                   	int3
   1400028db:	cc                   	int3
   1400028dc:	cc                   	int3
   1400028dd:	cc                   	int3
   1400028de:	cc                   	int3
   1400028df:	cc                   	int3
   1400028e0:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 0x1400028f0
   1400028e7:	48 ff 25 32 17 00 00 	rex.W jmp QWORD PTR [rip+0x1732]        # 0x140004020
   1400028ee:	cc                   	int3
   1400028ef:	cc                   	int3
   1400028f0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400028f5:	57                   	push   rdi
   1400028f6:	48 83 ec 20          	sub    rsp,0x20
   1400028fa:	48 8b 19             	mov    rbx,QWORD PTR [rcx]
   1400028fd:	48 8b f9             	mov    rdi,rcx
   140002900:	81 3b 63 73 6d e0    	cmp    DWORD PTR [rbx],0xe06d7363
   140002906:	75 1c                	jne    0x140002924
   140002908:	83 7b 18 04          	cmp    DWORD PTR [rbx+0x18],0x4
   14000290c:	75 16                	jne    0x140002924
   14000290e:	8b 53 20             	mov    edx,DWORD PTR [rbx+0x20]
   140002911:	8d 82 e0 fa 6c e6    	lea    eax,[rdx-0x19930520]
   140002917:	83 f8 02             	cmp    eax,0x2
   14000291a:	76 15                	jbe    0x140002931
   14000291c:	81 fa 00 40 99 01    	cmp    edx,0x1994000
   140002922:	74 0d                	je     0x140002931
   140002924:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002929:	33 c0                	xor    eax,eax
   14000292b:	48 83 c4 20          	add    rsp,0x20
   14000292f:	5f                   	pop    rdi
   140002930:	c3                   	ret
   140002931:	e8 92 03 00 00       	call   0x140002cc8
   140002936:	48 89 18             	mov    QWORD PTR [rax],rbx
   140002939:	48 8b 5f 08          	mov    rbx,QWORD PTR [rdi+0x8]
   14000293d:	e8 8c 03 00 00       	call   0x140002cce
   140002942:	48 89 18             	mov    QWORD PTR [rax],rbx
   140002945:	e8 20 04 00 00       	call   0x140002d6a
   14000294a:	cc                   	int3
   14000294b:	cc                   	int3
   14000294c:	cc                   	int3
   14000294d:	cc                   	int3
   14000294e:	cc                   	int3
   14000294f:	cc                   	int3
   140002950:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002955:	57                   	push   rdi
   140002956:	48 83 ec 20          	sub    rsp,0x20
   14000295a:	48 8d 1d af 22 00 00 	lea    rbx,[rip+0x22af]        # 0x140004c10
   140002961:	48 8d 3d a8 22 00 00 	lea    rdi,[rip+0x22a8]        # 0x140004c10
   140002968:	48 3b df             	cmp    rbx,rdi
   14000296b:	73 1a                	jae    0x140002987
   14000296d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002970:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002973:	48 85 c0             	test   rax,rax
   140002976:	74 06                	je     0x14000297e
   140002978:	ff 15 d2 18 00 00    	call   QWORD PTR [rip+0x18d2]        # 0x140004250
   14000297e:	48 83 c3 08          	add    rbx,0x8
   140002982:	48 3b df             	cmp    rbx,rdi
   140002985:	72 e9                	jb     0x140002970
   140002987:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000298c:	48 83 c4 20          	add    rsp,0x20
   140002990:	5f                   	pop    rdi
   140002991:	c3                   	ret
   140002992:	cc                   	int3
   140002993:	cc                   	int3
   140002994:	cc                   	int3
   140002995:	cc                   	int3
   140002996:	cc                   	int3
   140002997:	cc                   	int3
   140002998:	cc                   	int3
   140002999:	cc                   	int3
   14000299a:	cc                   	int3
   14000299b:	cc                   	int3
   14000299c:	cc                   	int3
   14000299d:	cc                   	int3
   14000299e:	cc                   	int3
   14000299f:	cc                   	int3
   1400029a0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400029a5:	57                   	push   rdi
   1400029a6:	48 83 ec 20          	sub    rsp,0x20
   1400029aa:	48 8d 1d 6f 22 00 00 	lea    rbx,[rip+0x226f]        # 0x140004c20
   1400029b1:	48 8d 3d 68 22 00 00 	lea    rdi,[rip+0x2268]        # 0x140004c20
   1400029b8:	48 3b df             	cmp    rbx,rdi
   1400029bb:	73 1a                	jae    0x1400029d7
   1400029bd:	0f 1f 00             	nop    DWORD PTR [rax]
   1400029c0:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400029c3:	48 85 c0             	test   rax,rax
   1400029c6:	74 06                	je     0x1400029ce
   1400029c8:	ff 15 82 18 00 00    	call   QWORD PTR [rip+0x1882]        # 0x140004250
   1400029ce:	48 83 c3 08          	add    rbx,0x8
   1400029d2:	48 3b df             	cmp    rbx,rdi
   1400029d5:	72 e9                	jb     0x1400029c0
   1400029d7:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400029dc:	48 83 c4 20          	add    rsp,0x20
   1400029e0:	5f                   	pop    rdi
   1400029e1:	c3                   	ret
   1400029e2:	cc                   	int3
   1400029e3:	cc                   	int3
   1400029e4:	cc                   	int3
   1400029e5:	cc                   	int3
   1400029e6:	cc                   	int3
   1400029e7:	cc                   	int3
   1400029e8:	cc                   	int3
   1400029e9:	cc                   	int3
   1400029ea:	cc                   	int3
   1400029eb:	cc                   	int3
   1400029ec:	cc                   	int3
   1400029ed:	cc                   	int3
   1400029ee:	cc                   	int3
   1400029ef:	cc                   	int3
   1400029f0:	40 56                	rex push rsi
   1400029f2:	57                   	push   rdi
   1400029f3:	41 56                	push   r14
   1400029f5:	48 83 ec 10          	sub    rsp,0x10
   1400029f9:	33 c9                	xor    ecx,ecx
   1400029fb:	48 89 5c 24 38       	mov    QWORD PTR [rsp+0x38],rbx
   140002a00:	33 c0                	xor    eax,eax
   140002a02:	0f a2                	cpuid
   140002a04:	81 f1 6e 74 65 6c    	xor    ecx,0x6c65746e
   140002a0a:	81 f2 69 6e 65 49    	xor    edx,0x49656e69
   140002a10:	0b d1                	or     edx,ecx
   140002a12:	81 f3 47 65 6e 75    	xor    ebx,0x756e6547
   140002a18:	44 8b d8             	mov    r11d,eax
   140002a1b:	0b d3                	or     edx,ebx
   140002a1d:	b8 01 00 00 00       	mov    eax,0x1
   140002a22:	b9 00 00 00 00       	mov    ecx,0x0
   140002a27:	0f a2                	cpuid
   140002a29:	8b f9                	mov    edi,ecx
   140002a2b:	75 5e                	jne    0x140002a8b
   140002a2d:	25 f0 3f ff 0f       	and    eax,0xfff3ff0
   140002a32:	48 c7 05 1b 36 00 00 	mov    QWORD PTR [rip+0x361b],0x8000        # 0x140006058
   140002a39:	00 80 00 00 
   140002a3d:	48 c7 05 18 36 00 00 	mov    QWORD PTR [rip+0x3618],0xffffffffffffffff        # 0x140006060
   140002a44:	ff ff ff ff 
   140002a48:	3d c0 06 01 00       	cmp    eax,0x106c0
   140002a4d:	74 28                	je     0x140002a77
   140002a4f:	3d 60 06 02 00       	cmp    eax,0x20660
   140002a54:	74 21                	je     0x140002a77
   140002a56:	3d 70 06 02 00       	cmp    eax,0x20670
   140002a5b:	74 1a                	je     0x140002a77
   140002a5d:	05 b0 f9 fc ff       	add    eax,0xfffcf9b0
   140002a62:	83 f8 20             	cmp    eax,0x20
   140002a65:	77 24                	ja     0x140002a8b
   140002a67:	48 b9 01 00 01 00 01 	movabs rcx,0x100010001
   140002a6e:	00 00 00 
   140002a71:	48 0f a3 c1          	bt     rcx,rax
   140002a75:	73 14                	jae    0x140002a8b
   140002a77:	44 8b 05 16 37 00 00 	mov    r8d,DWORD PTR [rip+0x3716]        # 0x140006194
   140002a7e:	41 83 c8 01          	or     r8d,0x1
   140002a82:	44 89 05 0b 37 00 00 	mov    DWORD PTR [rip+0x370b],r8d        # 0x140006194
   140002a89:	eb 07                	jmp    0x140002a92
   140002a8b:	44 8b 05 02 37 00 00 	mov    r8d,DWORD PTR [rip+0x3702]        # 0x140006194
   140002a92:	45 33 d2             	xor    r10d,r10d
   140002a95:	48 89 6c 24 40       	mov    QWORD PTR [rsp+0x40],rbp
   140002a9a:	45 33 f6             	xor    r14d,r14d
   140002a9d:	33 f6                	xor    esi,esi
   140002a9f:	41 83 fb 07          	cmp    r11d,0x7
   140002aa3:	7c 58                	jl     0x140002afd
   140002aa5:	33 c9                	xor    ecx,ecx
   140002aa7:	b8 07 00 00 00       	mov    eax,0x7
   140002aac:	0f a2                	cpuid
   140002aae:	8b ea                	mov    ebp,edx
   140002ab0:	44 8b cb             	mov    r9d,ebx
   140002ab3:	0f ba e3 09          	bt     ebx,0x9
   140002ab7:	73 0b                	jae    0x140002ac4
   140002ab9:	41 83 c8 02          	or     r8d,0x2
   140002abd:	44 89 05 d0 36 00 00 	mov    DWORD PTR [rip+0x36d0],r8d        # 0x140006194
   140002ac4:	83 f8 01             	cmp    eax,0x1
   140002ac7:	7c 0f                	jl     0x140002ad8
   140002ac9:	b8 07 00 00 00       	mov    eax,0x7
   140002ace:	b9 01 00 00 00       	mov    ecx,0x1
   140002ad3:	0f a2                	cpuid
   140002ad5:	44 8b d2             	mov    r10d,edx
   140002ad8:	41 83 fb 24          	cmp    r11d,0x24
   140002adc:	7c 0c                	jl     0x140002aea
   140002ade:	b8 24 00 00 00       	mov    eax,0x24
   140002ae3:	33 c9                	xor    ecx,ecx
   140002ae5:	0f a2                	cpuid
   140002ae7:	44 8b f3             	mov    r14d,ebx
   140002aea:	41 83 fb 29          	cmp    r11d,0x29
   140002aee:	7c 12                	jl     0x140002b02
   140002af0:	b8 29 00 00 00       	mov    eax,0x29
   140002af5:	33 c9                	xor    ecx,ecx
   140002af7:	0f a2                	cpuid
   140002af9:	8b f3                	mov    esi,ebx
   140002afb:	eb 05                	jmp    0x140002b02
   140002afd:	45 33 c9             	xor    r9d,r9d
   140002b00:	33 ed                	xor    ebp,ebp
   140002b02:	48 8b 05 5f 35 00 00 	mov    rax,QWORD PTR [rip+0x355f]        # 0x140006068
   140002b09:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
   140002b0e:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
   140002b12:	c7 05 34 35 00 00 01 	mov    DWORD PTR [rip+0x3534],0x1        # 0x140006050
   140002b19:	00 00 00 
   140002b1c:	c7 05 2e 35 00 00 02 	mov    DWORD PTR [rip+0x352e],0x2        # 0x140006054
   140002b23:	00 00 00 
   140002b26:	48 89 05 3b 35 00 00 	mov    QWORD PTR [rip+0x353b],rax        # 0x140006068
   140002b2d:	0f ba e7 14          	bt     edi,0x14
   140002b31:	73 1f                	jae    0x140002b52
   140002b33:	48 83 e0 ef          	and    rax,0xffffffffffffffef
   140002b37:	c7 05 0f 35 00 00 02 	mov    DWORD PTR [rip+0x350f],0x2        # 0x140006050
   140002b3e:	00 00 00 
   140002b41:	48 89 05 20 35 00 00 	mov    QWORD PTR [rip+0x3520],rax        # 0x140006068
   140002b48:	c7 05 02 35 00 00 06 	mov    DWORD PTR [rip+0x3502],0x6        # 0x140006054
   140002b4f:	00 00 00 
   140002b52:	0f ba e7 1b          	bt     edi,0x1b
   140002b56:	0f 83 2c 01 00 00    	jae    0x140002c88
   140002b5c:	33 c9                	xor    ecx,ecx
   140002b5e:	0f 01 d0             	xgetbv
   140002b61:	48 c1 e2 20          	shl    rdx,0x20
   140002b65:	48 0b d0             	or     rdx,rax
   140002b68:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
   140002b6d:	0f ba e7 1c          	bt     edi,0x1c
   140002b71:	0f 83 ed 00 00 00    	jae    0x140002c64
   140002b77:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140002b7c:	24 06                	and    al,0x6
   140002b7e:	3c 06                	cmp    al,0x6
   140002b80:	0f 85 de 00 00 00    	jne    0x140002c64
   140002b86:	8b 05 c8 34 00 00    	mov    eax,DWORD PTR [rip+0x34c8]        # 0x140006054
   140002b8c:	83 c8 08             	or     eax,0x8
   140002b8f:	c7 05 b7 34 00 00 03 	mov    DWORD PTR [rip+0x34b7],0x3        # 0x140006050
   140002b96:	00 00 00 
   140002b99:	89 05 b5 34 00 00    	mov    DWORD PTR [rip+0x34b5],eax        # 0x140006054
   140002b9f:	41 f6 c1 20          	test   r9b,0x20
   140002ba3:	74 65                	je     0x140002c0a
   140002ba5:	83 c8 20             	or     eax,0x20
   140002ba8:	c7 05 9e 34 00 00 05 	mov    DWORD PTR [rip+0x349e],0x5        # 0x140006050
   140002baf:	00 00 00 
   140002bb2:	89 05 9c 34 00 00    	mov    DWORD PTR [rip+0x349c],eax        # 0x140006054
   140002bb8:	41 81 e1 00 00 03 d0 	and    r9d,0xd0030000
   140002bbf:	48 8b 05 a2 34 00 00 	mov    rax,QWORD PTR [rip+0x34a2]        # 0x140006068
   140002bc6:	48 83 e0 fd          	and    rax,0xfffffffffffffffd
   140002bca:	48 89 05 97 34 00 00 	mov    QWORD PTR [rip+0x3497],rax        # 0x140006068
   140002bd1:	41 81 f9 00 00 03 d0 	cmp    r9d,0xd0030000
   140002bd8:	75 37                	jne    0x140002c11
   140002bda:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140002bdf:	24 e0                	and    al,0xe0
   140002be1:	3c e0                	cmp    al,0xe0
   140002be3:	75 25                	jne    0x140002c0a
   140002be5:	48 8b 05 7c 34 00 00 	mov    rax,QWORD PTR [rip+0x347c]        # 0x140006068
   140002bec:	83 0d 61 34 00 00 40 	or     DWORD PTR [rip+0x3461],0x40        # 0x140006054
   140002bf3:	48 83 e0 db          	and    rax,0xffffffffffffffdb
   140002bf7:	c7 05 4f 34 00 00 06 	mov    DWORD PTR [rip+0x344f],0x6        # 0x140006050
   140002bfe:	00 00 00 
   140002c01:	48 89 05 60 34 00 00 	mov    QWORD PTR [rip+0x3460],rax        # 0x140006068
   140002c08:	eb 07                	jmp    0x140002c11
   140002c0a:	48 8b 05 57 34 00 00 	mov    rax,QWORD PTR [rip+0x3457]        # 0x140006068
   140002c11:	0f ba e5 17          	bt     ebp,0x17
   140002c15:	73 0c                	jae    0x140002c23
   140002c17:	48 0f ba f0 18       	btr    rax,0x18
   140002c1c:	48 89 05 45 34 00 00 	mov    QWORD PTR [rip+0x3445],rax        # 0x140006068
   140002c23:	41 0f ba e2 13       	bt     r10d,0x13
   140002c28:	73 3a                	jae    0x140002c64
   140002c2a:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140002c2f:	24 e0                	and    al,0xe0
   140002c31:	3c e0                	cmp    al,0xe0
   140002c33:	75 2f                	jne    0x140002c64
   140002c35:	48 8b 0d 2c 34 00 00 	mov    rcx,QWORD PTR [rip+0x342c]        # 0x140006068
   140002c3c:	48 81 e1 d0 ff ff fe 	and    rcx,0xfffffffffeffffd0
   140002c43:	41 0f b6 c6          	movzx  eax,r14b
   140002c47:	89 05 4b 35 00 00    	mov    DWORD PTR [rip+0x354b],eax        # 0x140006198
   140002c4d:	48 89 0d 14 34 00 00 	mov    QWORD PTR [rip+0x3414],rcx        # 0x140006068
   140002c54:	83 f8 01             	cmp    eax,0x1
   140002c57:	76 0b                	jbe    0x140002c64
   140002c59:	48 83 e1 bf          	and    rcx,0xffffffffffffffbf
   140002c5d:	48 89 0d 04 34 00 00 	mov    QWORD PTR [rip+0x3404],rcx        # 0x140006068
   140002c64:	41 0f ba e2 15       	bt     r10d,0x15
   140002c69:	73 1d                	jae    0x140002c88
   140002c6b:	40 f6 c6 01          	test   sil,0x1
   140002c6f:	74 17                	je     0x140002c88
   140002c71:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140002c76:	48 0f ba e0 13       	bt     rax,0x13
   140002c7b:	73 0b                	jae    0x140002c88
   140002c7d:	48 81 25 e0 33 00 00 	and    QWORD PTR [rip+0x33e0],0xffffffffffffff7f        # 0x140006068
   140002c84:	7f ff ff ff 
   140002c88:	48 8b 6c 24 40       	mov    rbp,QWORD PTR [rsp+0x40]
   140002c8d:	33 c0                	xor    eax,eax
   140002c8f:	48 83 c4 10          	add    rsp,0x10
   140002c93:	41 5e                	pop    r14
   140002c95:	5f                   	pop    rdi
   140002c96:	5e                   	pop    rsi
   140002c97:	c3                   	ret
   140002c98:	cc                   	int3
   140002c99:	cc                   	int3
   140002c9a:	cc                   	int3
   140002c9b:	cc                   	int3
   140002c9c:	cc                   	int3
   140002c9d:	cc                   	int3
   140002c9e:	cc                   	int3
   140002c9f:	cc                   	int3
   140002ca0:	33 c0                	xor    eax,eax
   140002ca2:	39 05 c8 33 00 00    	cmp    DWORD PTR [rip+0x33c8],eax        # 0x140006070
   140002ca8:	0f 95 c0             	setne  al
   140002cab:	c3                   	ret
   140002cac:	cc                   	int3
   140002cad:	cc                   	int3
   140002cae:	cc                   	int3
   140002caf:	cc                   	int3
   140002cb0:	ff 25 6a 14 00 00    	jmp    QWORD PTR [rip+0x146a]        # 0x140004120
   140002cb6:	ff 25 34 14 00 00    	jmp    QWORD PTR [rip+0x1434]        # 0x1400040f0
   140002cbc:	ff 25 46 14 00 00    	jmp    QWORD PTR [rip+0x1446]        # 0x140004108
   140002cc2:	ff 25 10 14 00 00    	jmp    QWORD PTR [rip+0x1410]        # 0x1400040d8
   140002cc8:	ff 25 42 14 00 00    	jmp    QWORD PTR [rip+0x1442]        # 0x140004110
   140002cce:	ff 25 14 14 00 00    	jmp    QWORD PTR [rip+0x1414]        # 0x1400040e8
   140002cd4:	ff 25 6e 14 00 00    	jmp    QWORD PTR [rip+0x146e]        # 0x140004148
   140002cda:	ff 25 50 14 00 00    	jmp    QWORD PTR [rip+0x1450]        # 0x140004130
   140002ce0:	ff 25 5a 14 00 00    	jmp    QWORD PTR [rip+0x145a]        # 0x140004140
   140002ce6:	ff 25 9c 14 00 00    	jmp    QWORD PTR [rip+0x149c]        # 0x140004188
   140002cec:	ff 25 be 14 00 00    	jmp    QWORD PTR [rip+0x14be]        # 0x1400041b0
   140002cf2:	ff 25 70 14 00 00    	jmp    QWORD PTR [rip+0x1470]        # 0x140004168
   140002cf8:	ff 25 ca 14 00 00    	jmp    QWORD PTR [rip+0x14ca]        # 0x1400041c8
   140002cfe:	ff 25 d4 14 00 00    	jmp    QWORD PTR [rip+0x14d4]        # 0x1400041d8
   140002d04:	ff 25 f6 14 00 00    	jmp    QWORD PTR [rip+0x14f6]        # 0x140004200
   140002d0a:	ff 25 e8 14 00 00    	jmp    QWORD PTR [rip+0x14e8]        # 0x1400041f8
   140002d10:	ff 25 da 14 00 00    	jmp    QWORD PTR [rip+0x14da]        # 0x1400041f0
   140002d16:	ff 25 cc 14 00 00    	jmp    QWORD PTR [rip+0x14cc]        # 0x1400041e8
   140002d1c:	ff 25 be 14 00 00    	jmp    QWORD PTR [rip+0x14be]        # 0x1400041e0
   140002d22:	ff 25 f8 14 00 00    	jmp    QWORD PTR [rip+0x14f8]        # 0x140004220
   140002d28:	ff 25 a2 14 00 00    	jmp    QWORD PTR [rip+0x14a2]        # 0x1400041d0
   140002d2e:	ff 25 84 14 00 00    	jmp    QWORD PTR [rip+0x1484]        # 0x1400041b8
   140002d34:	ff 25 46 14 00 00    	jmp    QWORD PTR [rip+0x1446]        # 0x140004180
   140002d3a:	ff 25 38 14 00 00    	jmp    QWORD PTR [rip+0x1438]        # 0x140004178
   140002d40:	ff 25 7a 14 00 00    	jmp    QWORD PTR [rip+0x147a]        # 0x1400041c0
   140002d46:	ff 25 0c 14 00 00    	jmp    QWORD PTR [rip+0x140c]        # 0x140004158
   140002d4c:	ff 25 e6 13 00 00    	jmp    QWORD PTR [rip+0x13e6]        # 0x140004138
   140002d52:	ff 25 c0 14 00 00    	jmp    QWORD PTR [rip+0x14c0]        # 0x140004218
   140002d58:	ff 25 32 14 00 00    	jmp    QWORD PTR [rip+0x1432]        # 0x140004190
   140002d5e:	ff 25 34 14 00 00    	jmp    QWORD PTR [rip+0x1434]        # 0x140004198
   140002d64:	ff 25 36 14 00 00    	jmp    QWORD PTR [rip+0x1436]        # 0x1400041a0
   140002d6a:	ff 25 38 14 00 00    	jmp    QWORD PTR [rip+0x1438]        # 0x1400041a8
   140002d70:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   140002d75:	57                   	push   rdi
   140002d76:	48 83 ec 20          	sub    rsp,0x20
   140002d7a:	49 63 30             	movsxd rsi,DWORD PTR [r8]
   140002d7d:	48 8b f9             	mov    rdi,rcx
   140002d80:	40 f6 c6 04          	test   sil,0x4
   140002d84:	74 15                	je     0x140002d9b
   140002d86:	41 8b 40 08          	mov    eax,DWORD PTR [r8+0x8]
   140002d8a:	4d 63 50 04          	movsxd r10,DWORD PTR [r8+0x4]
   140002d8e:	f7 d8                	neg    eax
   140002d90:	4c 63 c0             	movsxd r8,eax
   140002d93:	4c 03 d1             	add    r10,rcx
   140002d96:	4d 23 d0             	and    r10,r8
   140002d99:	eb 03                	jmp    0x140002d9e
   140002d9b:	4c 8b d7             	mov    r10,rdi
   140002d9e:	48 8b 42 10          	mov    rax,QWORD PTR [rdx+0x10]
   140002da2:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   140002da7:	48 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],rbp
   140002dac:	44 8b 40 08          	mov    r8d,DWORD PTR [rax+0x8]
   140002db0:	4c 03 42 08          	add    r8,QWORD PTR [rdx+0x8]
   140002db4:	41 0f b6 00          	movzx  eax,BYTE PTR [r8]
   140002db8:	41 0f b6 48 03       	movzx  ecx,BYTE PTR [r8+0x3]
   140002dbd:	24 07                	and    al,0x7
   140002dbf:	3c 03                	cmp    al,0x3
   140002dc1:	73 0d                	jae    0x140002dd0
   140002dc3:	f6 c1 0f             	test   cl,0xf
   140002dc6:	74 13                	je     0x140002ddb
   140002dc8:	44 8b c9             	mov    r9d,ecx
   140002dcb:	e9 fd 00 00 00       	jmp    0x140002ecd
   140002dd0:	44 8b d9             	mov    r11d,ecx
   140002dd3:	8b d1                	mov    edx,ecx
   140002dd5:	41 83 e3 1f          	and    r11d,0x1f
   140002dd9:	75 08                	jne    0x140002de3
   140002ddb:	45 33 c9             	xor    r9d,r9d
   140002dde:	e9 ee 00 00 00       	jmp    0x140002ed1
   140002de3:	49 83 c0 04          	add    r8,0x4
   140002de7:	41 8b c3             	mov    eax,r11d
   140002dea:	45 33 c9             	xor    r9d,r9d
   140002ded:	c1 ea 05             	shr    edx,0x5
   140002df0:	4c 03 c0             	add    r8,rax
   140002df3:	41 8b c9             	mov    ecx,r9d
   140002df6:	85 d2                	test   edx,edx
   140002df8:	74 22                	je     0x140002e1c
   140002dfa:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002e00:	41 0f b6 00          	movzx  eax,BYTE PTR [r8]
   140002e04:	49 83 c0 03          	add    r8,0x3
   140002e08:	c1 e8 03             	shr    eax,0x3
   140002e0b:	85 c0                	test   eax,eax
   140002e0d:	74 07                	je     0x140002e16
   140002e0f:	49 83 c0 03          	add    r8,0x3
   140002e13:	4c 03 c0             	add    r8,rax
   140002e16:	ff c1                	inc    ecx
   140002e18:	3b ca                	cmp    ecx,edx
   140002e1a:	72 e4                	jb     0x140002e00
   140002e1c:	41 8b d9             	mov    ebx,r9d
   140002e1f:	45 85 db             	test   r11d,r11d
   140002e22:	0f 84 a9 00 00 00    	je     0x140002ed1
   140002e28:	48 8d 2d d1 d1 ff ff 	lea    rbp,[rip+0xffffffffffffd1d1]        # 0x140000000
   140002e2f:	90                   	nop
   140002e30:	41 0f b6 00          	movzx  eax,BYTE PTR [r8]
   140002e34:	0f b6 d0             	movzx  edx,al
   140002e37:	3c 03                	cmp    al,0x3
   140002e39:	76 19                	jbe    0x140002e54
   140002e3b:	80 e2 0f             	and    dl,0xf
   140002e3e:	8d 4a f8             	lea    ecx,[rdx-0x8]
   140002e41:	80 f9 02             	cmp    cl,0x2
   140002e44:	76 0e                	jbe    0x140002e54
   140002e46:	0f b6 d0             	movzx  edx,al
   140002e49:	80 e2 07             	and    dl,0x7
   140002e4c:	8d 4a fc             	lea    ecx,[rdx-0x4]
   140002e4f:	80 f9 03             	cmp    cl,0x3
   140002e52:	77 24                	ja     0x140002e78
   140002e54:	84 d2                	test   dl,dl
   140002e56:	74 70                	je     0x140002ec8
   140002e58:	3c 03                	cmp    al,0x3
   140002e5a:	76 2b                	jbe    0x140002e87
   140002e5c:	0f b6 d0             	movzx  edx,al
   140002e5f:	80 e2 0f             	and    dl,0xf
   140002e62:	8d 4a f8             	lea    ecx,[rdx-0x8]
   140002e65:	80 f9 02             	cmp    cl,0x2
   140002e68:	76 16                	jbe    0x140002e80
   140002e6a:	0f b6 d0             	movzx  edx,al
   140002e6d:	80 e2 07             	and    dl,0x7
   140002e70:	8d 4a fc             	lea    ecx,[rdx-0x4]
   140002e73:	80 f9 03             	cmp    cl,0x3
   140002e76:	76 08                	jbe    0x140002e80
   140002e78:	24 3f                	and    al,0x3f
   140002e7a:	3c 20                	cmp    al,0x20
   140002e7c:	75 7b                	jne    0x140002ef9
   140002e7e:	eb 07                	jmp    0x140002e87
   140002e80:	0f b6 c2             	movzx  eax,dl
   140002e83:	3c 20                	cmp    al,0x20
   140002e85:	77 72                	ja     0x140002ef9
   140002e87:	0f b6 c0             	movzx  eax,al
   140002e8a:	0f b6 84 28 14 2f 00 	movzx  eax,BYTE PTR [rax+rbp*1+0x2f14]
   140002e91:	00 
   140002e92:	8b 8c 85 00 2f 00 00 	mov    ecx,DWORD PTR [rbp+rax*4+0x2f00]
   140002e99:	48 03 cd             	add    rcx,rbp
   140002e9c:	ff e1                	jmp    rcx
   140002e9e:	b8 01 00 00 00       	mov    eax,0x1
   140002ea3:	eb 13                	jmp    0x140002eb8
   140002ea5:	b8 02 00 00 00       	mov    eax,0x2
   140002eaa:	eb 0c                	jmp    0x140002eb8
   140002eac:	b8 03 00 00 00       	mov    eax,0x3
   140002eb1:	eb 05                	jmp    0x140002eb8
   140002eb3:	b8 05 00 00 00       	mov    eax,0x5
   140002eb8:	4c 03 c0             	add    r8,rax
   140002ebb:	ff c3                	inc    ebx
   140002ebd:	41 3b db             	cmp    ebx,r11d
   140002ec0:	0f 82 6a ff ff ff    	jb     0x140002e30
   140002ec6:	eb 09                	jmp    0x140002ed1
   140002ec8:	45 0f b6 48 01       	movzx  r9d,BYTE PTR [r8+0x1]
   140002ecd:	49 83 e1 f0          	and    r9,0xfffffffffffffff0
   140002ed1:	49 8d 0c 39          	lea    rcx,[r9+rdi*1]
   140002ed5:	48 8b c6             	mov    rax,rsi
   140002ed8:	48 83 e0 f8          	and    rax,0xfffffffffffffff8
   140002edc:	4a 33 0c 10          	xor    rcx,QWORD PTR [rax+r10*1]
   140002ee0:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
   140002ee5:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002eea:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140002eef:	48 83 c4 20          	add    rsp,0x20
   140002ef3:	5f                   	pop    rdi
   140002ef4:	e9 b7 f1 ff ff       	jmp    0x1400020b0
   140002ef9:	e8 d2 f1 ff ff       	call   0x1400020d0
   140002efe:	cc                   	int3
   140002eff:	90                   	nop
   140002f00:	a5                   	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140002f01:	2e 00 00             	cs add BYTE PTR [rax],al
   140002f04:	b3 2e                	mov    bl,0x2e
   140002f06:	00 00                	add    BYTE PTR [rax],al
   140002f08:	ac                   	lods   al,BYTE PTR ds:[rsi]
   140002f09:	2e 00 00             	cs add BYTE PTR [rax],al
   140002f0c:	9e                   	sahf
   140002f0d:	2e 00 00             	cs add BYTE PTR [rax],al
   140002f10:	f9                   	stc
   140002f11:	2e 00 00             	cs add BYTE PTR [rax],al
   140002f14:	00 01                	add    BYTE PTR [rcx],al
   140002f16:	02 00                	add    al,BYTE PTR [rax]
   140002f18:	03 01                	add    eax,DWORD PTR [rcx]
   140002f1a:	02 03                	add    al,BYTE PTR [rbx]
   140002f1c:	03 01                	add    eax,DWORD PTR [rcx]
   140002f1e:	02 04 04             	add    al,BYTE PTR [rsp+rax*1]
   140002f21:	04 04                	add    al,0x4
   140002f23:	04 04                	add    al,0x4
   140002f25:	04 04                	add    al,0x4
   140002f27:	04 04                	add    al,0x4
   140002f29:	04 04                	add    al,0x4
   140002f2b:	04 04                	add    al,0x4
   140002f2d:	04 04                	add    al,0x4
   140002f2f:	04 04                	add    al,0x4
   140002f31:	04 04                	add    al,0x4
   140002f33:	04 00                	add    al,0x0
   140002f35:	cc                   	int3
   140002f36:	cc                   	int3
   140002f37:	cc                   	int3
   140002f38:	cc                   	int3
   140002f39:	cc                   	int3
   140002f3a:	cc                   	int3
   140002f3b:	cc                   	int3
   140002f3c:	cc                   	int3
   140002f3d:	cc                   	int3
   140002f3e:	cc                   	int3
   140002f3f:	cc                   	int3
   140002f40:	40 53                	rex push rbx
   140002f42:	55                   	push   rbp
   140002f43:	56                   	push   rsi
   140002f44:	57                   	push   rdi
   140002f45:	41 56                	push   r14
   140002f47:	48 83 ec 20          	sub    rsp,0x20
   140002f4b:	49 8b 59 38          	mov    rbx,QWORD PTR [r9+0x38]
   140002f4f:	48 8b f2             	mov    rsi,rdx
   140002f52:	4d 8b f0             	mov    r14,r8
   140002f55:	48 8b e9             	mov    rbp,rcx
   140002f58:	49 8b d1             	mov    rdx,r9
   140002f5b:	48 8b ce             	mov    rcx,rsi
   140002f5e:	49 8b f9             	mov    rdi,r9
   140002f61:	4c 8d 43 04          	lea    r8,[rbx+0x4]
   140002f65:	e8 06 fe ff ff       	call   0x140002d70
   140002f6a:	f6 45 04 66          	test   BYTE PTR [rbp+0x4],0x66
   140002f6e:	b8 00 00 00 00       	mov    eax,0x0
   140002f73:	0f 95 c0             	setne  al
   140002f76:	ff c0                	inc    eax
   140002f78:	85 43 04             	test   DWORD PTR [rbx+0x4],eax
   140002f7b:	74 1b                	je     0x140002f98
   140002f7d:	4c 8b cf             	mov    r9,rdi
   140002f80:	4d 8b c6             	mov    r8,r14
   140002f83:	48 8b d6             	mov    rdx,rsi
   140002f86:	48 8b cd             	mov    rcx,rbp
   140002f89:	48 83 c4 20          	add    rsp,0x20
   140002f8d:	41 5e                	pop    r14
   140002f8f:	5f                   	pop    rdi
   140002f90:	5e                   	pop    rsi
   140002f91:	5d                   	pop    rbp
   140002f92:	5b                   	pop    rbx
   140002f93:	e9 18 fd ff ff       	jmp    0x140002cb0
   140002f98:	b8 01 00 00 00       	mov    eax,0x1
   140002f9d:	48 83 c4 20          	add    rsp,0x20
   140002fa1:	41 5e                	pop    r14
   140002fa3:	5f                   	pop    rdi
   140002fa4:	5e                   	pop    rsi
   140002fa5:	5d                   	pop    rbp
   140002fa6:	5b                   	pop    rbx
   140002fa7:	c3                   	ret
   140002fa8:	ff 25 32 11 00 00    	jmp    QWORD PTR [rip+0x1132]        # 0x1400040e0
   140002fae:	ff 25 7c 12 00 00    	jmp    QWORD PTR [rip+0x127c]        # 0x140004230
   140002fb4:	cc                   	int3
   140002fb5:	cc                   	int3
   140002fb6:	cc                   	int3
   140002fb7:	cc                   	int3
   140002fb8:	cc                   	int3
   140002fb9:	cc                   	int3
   140002fba:	cc                   	int3
   140002fbb:	cc                   	int3
   140002fbc:	cc                   	int3
   140002fbd:	cc                   	int3
   140002fbe:	cc                   	int3
   140002fbf:	cc                   	int3
   140002fc0:	cc                   	int3
   140002fc1:	cc                   	int3
   140002fc2:	cc                   	int3
   140002fc3:	cc                   	int3
   140002fc4:	cc                   	int3
   140002fc5:	cc                   	int3
   140002fc6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140002fcd:	00 00 00 
   140002fd0:	ff e0                	jmp    rax
   140002fd2:	cc                   	int3
   140002fd3:	cc                   	int3
   140002fd4:	cc                   	int3
   140002fd5:	cc                   	int3
   140002fd6:	cc                   	int3
   140002fd7:	cc                   	int3
   140002fd8:	cc                   	int3
   140002fd9:	cc                   	int3
   140002fda:	cc                   	int3
   140002fdb:	cc                   	int3
   140002fdc:	cc                   	int3
   140002fdd:	cc                   	int3
   140002fde:	cc                   	int3
   140002fdf:	cc                   	int3
   140002fe0:	cc                   	int3
   140002fe1:	cc                   	int3
   140002fe2:	cc                   	int3
   140002fe3:	cc                   	int3
   140002fe4:	cc                   	int3
   140002fe5:	cc                   	int3
   140002fe6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140002fed:	00 00 00 
   140002ff0:	ff 25 5a 12 00 00    	jmp    QWORD PTR [rip+0x125a]        # 0x140004250
   140002ff6:	cc                   	int3
   140002ff7:	cc                   	int3
   140002ff8:	cc                   	int3
   140002ff9:	cc                   	int3
   140002ffa:	cc                   	int3
   140002ffb:	cc                   	int3
   140002ffc:	cc                   	int3
   140002ffd:	cc                   	int3
   140002ffe:	cc                   	int3
   140002fff:	cc                   	int3
   140003000:	48 8d 8a 88 00 00 00 	lea    rcx,[rdx+0x88]
   140003007:	e9 44 eb ff ff       	jmp    0x140001b50
   14000300c:	48 8d 8a a8 00 00 00 	lea    rcx,[rdx+0xa8]
   140003013:	e9 38 eb ff ff       	jmp    0x140001b50
   140003018:	48 8d 8a c8 00 00 00 	lea    rcx,[rdx+0xc8]
   14000301f:	e9 2c eb ff ff       	jmp    0x140001b50
   140003024:	cc                   	int3
   140003025:	cc                   	int3
   140003026:	cc                   	int3
   140003027:	cc                   	int3
   140003028:	cc                   	int3
   140003029:	cc                   	int3
   14000302a:	cc                   	int3
   14000302b:	cc                   	int3
   14000302c:	cc                   	int3
   14000302d:	cc                   	int3
   14000302e:	cc                   	int3
   14000302f:	cc                   	int3
   140003030:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140003037:	e9 14 eb ff ff       	jmp    0x140001b50
   14000303c:	cc                   	int3
   14000303d:	cc                   	int3
   14000303e:	cc                   	int3
   14000303f:	cc                   	int3
   140003040:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   140003047:	e9 04 f0 ff ff       	jmp    0x140002050
   14000304c:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   140003053:	e9 18 ee ff ff       	jmp    0x140001e70
   140003058:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   14000305d:	55                   	push   rbp
   14000305e:	48 83 ec 20          	sub    rsp,0x20
   140003062:	48 8b ea             	mov    rbp,rdx
   140003065:	48 8b 55 60          	mov    rdx,QWORD PTR [rbp+0x60]
   140003069:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14000306c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140003070:	48 03 ca             	add    rcx,rdx
   140003073:	41 b0 01             	mov    r8b,0x1
   140003076:	ba 04 00 00 00       	mov    edx,0x4
   14000307b:	ff 15 cf 0f 00 00    	call   QWORD PTR [rip+0xfcf]        # 0x140004050
   140003081:	90                   	nop
   140003082:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140003089:	00 00 00 
   14000308c:	48 83 c4 20          	add    rsp,0x20
   140003090:	5d                   	pop    rbp
   140003091:	c3                   	ret
   140003092:	cc                   	int3
   140003093:	cc                   	int3
   140003094:	cc                   	int3
   140003095:	cc                   	int3
   140003096:	cc                   	int3
   140003097:	cc                   	int3
   140003098:	cc                   	int3
   140003099:	cc                   	int3
   14000309a:	cc                   	int3
   14000309b:	cc                   	int3
   14000309c:	cc                   	int3
   14000309d:	cc                   	int3
   14000309e:	cc                   	int3
   14000309f:	cc                   	int3
   1400030a0:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   1400030a7:	e9 a4 ef ff ff       	jmp    0x140002050
   1400030ac:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   1400030b3:	e9 f8 ed ff ff       	jmp    0x140001eb0
   1400030b8:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   1400030bd:	55                   	push   rbp
   1400030be:	48 83 ec 20          	sub    rsp,0x20
   1400030c2:	48 8b ea             	mov    rbp,rdx
   1400030c5:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400030c9:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   1400030cc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400030d0:	48 03 ca             	add    rcx,rdx
   1400030d3:	41 b0 01             	mov    r8b,0x1
   1400030d6:	ba 04 00 00 00       	mov    edx,0x4
   1400030db:	ff 15 6f 0f 00 00    	call   QWORD PTR [rip+0xf6f]        # 0x140004050
   1400030e1:	90                   	nop
   1400030e2:	48 b8 00 00 00 00 00 	movabs rax,0x0
   1400030e9:	00 00 00 
   1400030ec:	48 83 c4 20          	add    rsp,0x20
   1400030f0:	5d                   	pop    rbp
   1400030f1:	c3                   	ret
   1400030f2:	cc                   	int3
   1400030f3:	cc                   	int3
   1400030f4:	cc                   	int3
   1400030f5:	cc                   	int3
   1400030f6:	cc                   	int3
   1400030f7:	cc                   	int3
   1400030f8:	cc                   	int3
   1400030f9:	cc                   	int3
   1400030fa:	cc                   	int3
   1400030fb:	cc                   	int3
   1400030fc:	cc                   	int3
   1400030fd:	cc                   	int3
   1400030fe:	cc                   	int3
   1400030ff:	cc                   	int3
   140003100:	40 55                	rex push rbp
   140003102:	48 83 ec 20          	sub    rsp,0x20
   140003106:	48 8b ea             	mov    rbp,rdx
   140003109:	48 8b d1             	mov    rdx,rcx
   14000310c:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   14000310f:	8b 09                	mov    ecx,DWORD PTR [rcx]
   140003111:	e8 d0 fb ff ff       	call   0x140002ce6
   140003116:	90                   	nop
   140003117:	48 83 c4 20          	add    rsp,0x20
   14000311b:	5d                   	pop    rbp
   14000311c:	c3                   	ret
   14000311d:	cc                   	int3
   14000311e:	cc                   	int3
   14000311f:	cc                   	int3
   140003120:	40 55                	rex push rbp
   140003122:	48 8b ea             	mov    rbp,rdx
   140003125:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140003128:	33 c9                	xor    ecx,ecx
   14000312a:	81 38 05 00 00 c0    	cmp    DWORD PTR [rax],0xc0000005
   140003130:	0f 94 c1             	sete   cl
   140003133:	8b c1                	mov    eax,ecx
   140003135:	5d                   	pop    rbp
   140003136:	c3                   	ret
   140003137:	cc                   	int3
