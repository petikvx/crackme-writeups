
b.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	55                   	push   rbp
   140001001:	48 89 e5             	mov    rbp,rsp
   140001004:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001008:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   14000100c:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001010:	44 89 4d 28          	mov    DWORD PTR [rbp+0x28],r9d
   140001014:	90                   	nop
   140001015:	5d                   	pop    rbp
   140001016:	c3                   	ret
   140001017:	55                   	push   rbp
   140001018:	48 89 e5             	mov    rbp,rsp
   14000101b:	48 83 ec 20          	sub    rsp,0x20
   14000101f:	e8 54 03 00 00       	call   0x140001378
   140001024:	89 05 f6 7f 00 00    	mov    DWORD PTR [rip+0x7ff6],eax        # 0x140009020
   14000102a:	48 8b 05 ff 43 00 00 	mov    rax,QWORD PTR [rip+0x43ff]        # 0x140005430
   140001031:	8b 00                	mov    eax,DWORD PTR [rax]
   140001033:	85 c0                	test   eax,eax
   140001035:	74 0c                	je     0x140001043
   140001037:	b9 02 00 00 00       	mov    ecx,0x2
   14000103c:	e8 ef 22 00 00       	call   0x140003330
   140001041:	eb 0a                	jmp    0x14000104d
   140001043:	b9 01 00 00 00       	mov    ecx,0x1
   140001048:	e8 e3 22 00 00       	call   0x140003330
   14000104d:	e8 4e 22 00 00       	call   0x1400032a0
   140001052:	48 8b 15 b7 44 00 00 	mov    rdx,QWORD PTR [rip+0x44b7]        # 0x140005510
   140001059:	8b 12                	mov    edx,DWORD PTR [rdx]
   14000105b:	89 10                	mov    DWORD PTR [rax],edx
   14000105d:	e8 36 22 00 00       	call   0x140003298
   140001062:	48 8b 15 87 44 00 00 	mov    rdx,QWORD PTR [rip+0x4487]        # 0x1400054f0
   140001069:	8b 12                	mov    edx,DWORD PTR [rdx]
   14000106b:	89 10                	mov    DWORD PTR [rax],edx
   14000106d:	e8 6e 08 00 00       	call   0x1400018e0
   140001072:	48 8b 05 27 43 00 00 	mov    rax,QWORD PTR [rip+0x4327]        # 0x1400053a0
   140001079:	8b 00                	mov    eax,DWORD PTR [rax]
   14000107b:	83 f8 01             	cmp    eax,0x1
   14000107e:	75 0f                	jne    0x14000108f
   140001080:	48 8b 05 a9 44 00 00 	mov    rax,QWORD PTR [rip+0x44a9]        # 0x140005530
   140001087:	48 89 c1             	mov    rcx,rax
   14000108a:	e8 ab 13 00 00       	call   0x14000243a
   14000108f:	b8 00 00 00 00       	mov    eax,0x0
   140001094:	48 83 c4 20          	add    rsp,0x20
   140001098:	5d                   	pop    rbp
   140001099:	c3                   	ret
   14000109a:	55                   	push   rbp
   14000109b:	48 89 e5             	mov    rbp,rsp
   14000109e:	48 83 ec 30          	sub    rsp,0x30
   1400010a2:	48 8b 05 97 44 00 00 	mov    rax,QWORD PTR [rip+0x4497]        # 0x140005540
   1400010a9:	8b 00                	mov    eax,DWORD PTR [rax]
   1400010ab:	89 05 77 7f 00 00    	mov    DWORD PTR [rip+0x7f77],eax        # 0x140009028
   1400010b1:	48 8b 05 48 44 00 00 	mov    rax,QWORD PTR [rip+0x4448]        # 0x140005500
   1400010b8:	8b 10                	mov    edx,DWORD PTR [rax]
   1400010ba:	48 8d 05 67 7f 00 00 	lea    rax,[rip+0x7f67]        # 0x140009028
   1400010c1:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400010c6:	41 89 d1             	mov    r9d,edx
   1400010c9:	4c 8d 05 40 7f 00 00 	lea    r8,[rip+0x7f40]        # 0x140009010
   1400010d0:	48 8d 05 31 7f 00 00 	lea    rax,[rip+0x7f31]        # 0x140009008
   1400010d7:	48 89 c2             	mov    rdx,rax
   1400010da:	48 8d 05 23 7f 00 00 	lea    rax,[rip+0x7f23]        # 0x140009004
   1400010e1:	48 89 c1             	mov    rcx,rax
   1400010e4:	e8 17 1f 00 00       	call   0x140003000
   1400010e9:	89 05 29 7f 00 00    	mov    DWORD PTR [rip+0x7f29],eax        # 0x140009018
   1400010ef:	90                   	nop
   1400010f0:	48 83 c4 30          	add    rsp,0x30
   1400010f4:	5d                   	pop    rbp
   1400010f5:	c3                   	ret
   1400010f6:	55                   	push   rbp
   1400010f7:	48 89 e5             	mov    rbp,rsp
   1400010fa:	48 83 ec 30          	sub    rsp,0x30
   1400010fe:	c7 45 fc ff 00 00 00 	mov    DWORD PTR [rbp-0x4],0xff
   140001105:	48 8b 05 24 43 00 00 	mov    rax,QWORD PTR [rip+0x4324]        # 0x140005430
   14000110c:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001112:	e8 3d 00 00 00       	call   0x140001154
   140001117:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000111a:	90                   	nop
   14000111b:	90                   	nop
   14000111c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000111f:	48 83 c4 30          	add    rsp,0x30
   140001123:	5d                   	pop    rbp
   140001124:	c3                   	ret
   140001125:	55                   	push   rbp
   140001126:	48 89 e5             	mov    rbp,rsp
   140001129:	48 83 ec 30          	sub    rsp,0x30
   14000112d:	c7 45 fc ff 00 00 00 	mov    DWORD PTR [rbp-0x4],0xff
   140001134:	48 8b 05 f5 42 00 00 	mov    rax,QWORD PTR [rip+0x42f5]        # 0x140005430
   14000113b:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001141:	e8 0e 00 00 00       	call   0x140001154
   140001146:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001149:	90                   	nop
   14000114a:	90                   	nop
   14000114b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000114e:	48 83 c4 30          	add    rsp,0x30
   140001152:	5d                   	pop    rbp
   140001153:	c3                   	ret
   140001154:	55                   	push   rbp
   140001155:	48 89 e5             	mov    rbp,rsp
   140001158:	48 83 ec 70          	sub    rsp,0x70
   14000115c:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
   140001163:	00 
   140001164:	c7 45 e4 30 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x30
   14000116b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   14000116e:	65 48 8b 00          	mov    rax,QWORD PTR gs:[rax]
   140001172:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140001176:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14000117a:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   14000117e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140001182:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001189:	eb 21                	jmp    0x1400011ac
   14000118b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000118f:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   140001193:	75 09                	jne    0x14000119e
   140001195:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
   14000119c:	eb 45                	jmp    0x1400011e3
   14000119e:	b9 e8 03 00 00       	mov    ecx,0x3e8
   1400011a3:	48 8b 05 6e 91 00 00 	mov    rax,QWORD PTR [rip+0x916e]        # 0x14000a318
   1400011aa:	ff d0                	call   rax
   1400011ac:	48 8b 05 dd 42 00 00 	mov    rax,QWORD PTR [rip+0x42dd]        # 0x140005490
   1400011b3:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400011b7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400011bb:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   1400011bf:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
   1400011c6:	00 
   1400011c7:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   1400011cb:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   1400011cf:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
   1400011d3:	f0 48 0f b1 0a       	lock cmpxchg QWORD PTR [rdx],rcx
   1400011d8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400011dc:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400011e1:	75 a8                	jne    0x14000118b
   1400011e3:	48 8b 05 b6 42 00 00 	mov    rax,QWORD PTR [rip+0x42b6]        # 0x1400054a0
   1400011ea:	8b 00                	mov    eax,DWORD PTR [rax]
   1400011ec:	83 f8 01             	cmp    eax,0x1
   1400011ef:	75 0c                	jne    0x1400011fd
   1400011f1:	b9 1f 00 00 00       	mov    ecx,0x1f
   1400011f6:	e8 65 1f 00 00       	call   0x140003160
   1400011fb:	eb 3f                	jmp    0x14000123c
   1400011fd:	48 8b 05 9c 42 00 00 	mov    rax,QWORD PTR [rip+0x429c]        # 0x1400054a0
   140001204:	8b 00                	mov    eax,DWORD PTR [rax]
   140001206:	85 c0                	test   eax,eax
   140001208:	75 28                	jne    0x140001232
   14000120a:	48 8b 05 8f 42 00 00 	mov    rax,QWORD PTR [rip+0x428f]        # 0x1400054a0
   140001211:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001217:	48 8b 05 c2 42 00 00 	mov    rax,QWORD PTR [rip+0x42c2]        # 0x1400054e0
   14000121e:	48 89 c2             	mov    rdx,rax
   140001221:	48 8b 05 a8 42 00 00 	mov    rax,QWORD PTR [rip+0x42a8]        # 0x1400054d0
   140001228:	48 89 c1             	mov    rcx,rax
   14000122b:	e8 f8 20 00 00       	call   0x140003328
   140001230:	eb 0a                	jmp    0x14000123c
   140001232:	c7 05 e8 7d 00 00 01 	mov    DWORD PTR [rip+0x7de8],0x1        # 0x140009024
   140001239:	00 00 00 
   14000123c:	48 8b 05 5d 42 00 00 	mov    rax,QWORD PTR [rip+0x425d]        # 0x1400054a0
   140001243:	8b 00                	mov    eax,DWORD PTR [rax]
   140001245:	83 f8 01             	cmp    eax,0x1
   140001248:	75 26                	jne    0x140001270
   14000124a:	48 8b 05 6f 42 00 00 	mov    rax,QWORD PTR [rip+0x426f]        # 0x1400054c0
   140001251:	48 89 c2             	mov    rdx,rax
   140001254:	48 8b 05 55 42 00 00 	mov    rax,QWORD PTR [rip+0x4255]        # 0x1400054b0
   14000125b:	48 89 c1             	mov    rcx,rax
   14000125e:	e8 c5 20 00 00       	call   0x140003328
   140001263:	48 8b 05 36 42 00 00 	mov    rax,QWORD PTR [rip+0x4236]        # 0x1400054a0
   14000126a:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   140001270:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140001274:	75 1e                	jne    0x140001294
   140001276:	48 8b 05 13 42 00 00 	mov    rax,QWORD PTR [rip+0x4213]        # 0x140005490
   14000127d:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140001281:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
   140001288:	00 
   140001289:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
   14000128d:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140001291:	48 87 10             	xchg   QWORD PTR [rax],rdx
   140001294:	48 8b 05 55 41 00 00 	mov    rax,QWORD PTR [rip+0x4155]        # 0x1400053f0
   14000129b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000129e:	48 85 c0             	test   rax,rax
   1400012a1:	74 1c                	je     0x1400012bf
   1400012a3:	48 8b 05 46 41 00 00 	mov    rax,QWORD PTR [rip+0x4146]        # 0x1400053f0
   1400012aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400012ad:	41 b8 00 00 00 00    	mov    r8d,0x0
   1400012b3:	ba 02 00 00 00       	mov    edx,0x2
   1400012b8:	b9 00 00 00 00       	mov    ecx,0x0
   1400012bd:	ff d0                	call   rax
   1400012bf:	e8 64 10 00 00       	call   0x140002328
   1400012c4:	48 8b 05 55 42 00 00 	mov    rax,QWORD PTR [rip+0x4255]        # 0x140005520
   1400012cb:	48 89 c1             	mov    rcx,rax
   1400012ce:	48 8b 05 3b 90 00 00 	mov    rax,QWORD PTR [rip+0x903b]        # 0x14000a310
   1400012d5:	ff d0                	call   rax
   1400012d7:	48 8b 15 a2 41 00 00 	mov    rdx,QWORD PTR [rip+0x41a2]        # 0x140005480
   1400012de:	48 89 02             	mov    QWORD PTR [rdx],rax
   1400012e1:	48 8d 05 18 fd ff ff 	lea    rax,[rip+0xfffffffffffffd18]        # 0x140001000
   1400012e8:	48 89 c1             	mov    rcx,rax
   1400012eb:	e8 48 20 00 00       	call   0x140003338
   1400012f0:	e8 2b 08 00 00       	call   0x140001b20
   1400012f5:	8b 05 09 7d 00 00    	mov    eax,DWORD PTR [rip+0x7d09]        # 0x140009004
   1400012fb:	48 8d 15 06 7d 00 00 	lea    rdx,[rip+0x7d06]        # 0x140009008
   140001302:	89 c1                	mov    ecx,eax
   140001304:	e8 73 01 00 00       	call   0x14000147c
   140001309:	e8 a9 05 00 00       	call   0x1400018b7
   14000130e:	48 8b 05 fb 40 00 00 	mov    rax,QWORD PTR [rip+0x40fb]        # 0x140005410
   140001315:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001318:	48 8b 15 f1 7c 00 00 	mov    rdx,QWORD PTR [rip+0x7cf1]        # 0x140009010
   14000131f:	48 89 10             	mov    QWORD PTR [rax],rdx
   140001322:	48 8b 0d e7 7c 00 00 	mov    rcx,QWORD PTR [rip+0x7ce7]        # 0x140009010
   140001329:	48 8b 15 d8 7c 00 00 	mov    rdx,QWORD PTR [rip+0x7cd8]        # 0x140009008
   140001330:	8b 05 ce 7c 00 00    	mov    eax,DWORD PTR [rip+0x7cce]        # 0x140009004
   140001336:	49 89 c8             	mov    r8,rcx
   140001339:	89 c1                	mov    ecx,eax
   14000133b:	e8 e0 20 00 00       	call   0x140003420
   140001340:	89 05 d6 7c 00 00    	mov    DWORD PTR [rip+0x7cd6],eax        # 0x14000901c
   140001346:	8b 05 d4 7c 00 00    	mov    eax,DWORD PTR [rip+0x7cd4]        # 0x140009020
   14000134c:	85 c0                	test   eax,eax
   14000134e:	75 0d                	jne    0x14000135d
   140001350:	8b 05 c6 7c 00 00    	mov    eax,DWORD PTR [rip+0x7cc6]        # 0x14000901c
   140001356:	89 c1                	mov    ecx,eax
   140001358:	e8 eb 1f 00 00       	call   0x140003348
   14000135d:	8b 05 c1 7c 00 00    	mov    eax,DWORD PTR [rip+0x7cc1]        # 0x140009024
   140001363:	85 c0                	test   eax,eax
   140001365:	75 05                	jne    0x14000136c
   140001367:	e8 7c 1f 00 00       	call   0x1400032e8
   14000136c:	8b 05 aa 7c 00 00    	mov    eax,DWORD PTR [rip+0x7caa]        # 0x14000901c
   140001372:	48 83 c4 70          	add    rsp,0x70
   140001376:	5d                   	pop    rbp
   140001377:	c3                   	ret
   140001378:	55                   	push   rbp
   140001379:	48 89 e5             	mov    rbp,rsp
   14000137c:	48 83 ec 20          	sub    rsp,0x20
   140001380:	48 8b 05 b9 40 00 00 	mov    rax,QWORD PTR [rip+0x40b9]        # 0x140005440
   140001387:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000138d:	48 8b 05 bc 40 00 00 	mov    rax,QWORD PTR [rip+0x40bc]        # 0x140005450
   140001394:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000139a:	48 8b 05 bf 40 00 00 	mov    rax,QWORD PTR [rip+0x40bf]        # 0x140005460
   1400013a1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400013a7:	48 8b 05 12 40 00 00 	mov    rax,QWORD PTR [rip+0x4012]        # 0x1400053c0
   1400013ae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400013b2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400013b6:	0f b7 00             	movzx  eax,WORD PTR [rax]
   1400013b9:	66 3d 4d 5a          	cmp    ax,0x5a4d
   1400013bd:	74 0a                	je     0x1400013c9
   1400013bf:	b8 00 00 00 00       	mov    eax,0x0
   1400013c4:	e9 ad 00 00 00       	jmp    0x140001476
   1400013c9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400013cd:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   1400013d0:	48 63 d0             	movsxd rdx,eax
   1400013d3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400013d7:	48 01 d0             	add    rax,rdx
   1400013da:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400013de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400013e2:	8b 00                	mov    eax,DWORD PTR [rax]
   1400013e4:	3d 50 45 00 00       	cmp    eax,0x4550
   1400013e9:	74 0a                	je     0x1400013f5
   1400013eb:	b8 00 00 00 00       	mov    eax,0x0
   1400013f0:	e9 81 00 00 00       	jmp    0x140001476
   1400013f5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400013f9:	48 83 c0 18          	add    rax,0x18
   1400013fd:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140001401:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001405:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140001408:	0f b7 c0             	movzx  eax,ax
   14000140b:	3d 0b 01 00 00       	cmp    eax,0x10b
   140001410:	74 09                	je     0x14000141b
   140001412:	3d 0b 02 00 00       	cmp    eax,0x20b
   140001417:	74 29                	je     0x140001442
   140001419:	eb 56                	jmp    0x140001471
   14000141b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   14000141f:	8b 40 5c             	mov    eax,DWORD PTR [rax+0x5c]
   140001422:	83 f8 0e             	cmp    eax,0xe
   140001425:	77 07                	ja     0x14000142e
   140001427:	b8 00 00 00 00       	mov    eax,0x0
   14000142c:	eb 48                	jmp    0x140001476
   14000142e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001432:	8b 80 d0 00 00 00    	mov    eax,DWORD PTR [rax+0xd0]
   140001438:	85 c0                	test   eax,eax
   14000143a:	0f 95 c0             	setne  al
   14000143d:	0f b6 c0             	movzx  eax,al
   140001440:	eb 34                	jmp    0x140001476
   140001442:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001446:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   14000144a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000144e:	8b 40 6c             	mov    eax,DWORD PTR [rax+0x6c]
   140001451:	83 f8 0e             	cmp    eax,0xe
   140001454:	77 07                	ja     0x14000145d
   140001456:	b8 00 00 00 00       	mov    eax,0x0
   14000145b:	eb 19                	jmp    0x140001476
   14000145d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140001461:	8b 80 e0 00 00 00    	mov    eax,DWORD PTR [rax+0xe0]
   140001467:	85 c0                	test   eax,eax
   140001469:	0f 95 c0             	setne  al
   14000146c:	0f b6 c0             	movzx  eax,al
   14000146f:	eb 05                	jmp    0x140001476
   140001471:	b8 00 00 00 00       	mov    eax,0x0
   140001476:	48 83 c4 20          	add    rsp,0x20
   14000147a:	5d                   	pop    rbp
   14000147b:	c3                   	ret
   14000147c:	55                   	push   rbp
   14000147d:	53                   	push   rbx
   14000147e:	48 83 ec 48          	sub    rsp,0x48
   140001482:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140001487:	89 4d 20             	mov    DWORD PTR [rbp+0x20],ecx
   14000148a:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   14000148e:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   140001491:	83 c0 01             	add    eax,0x1
   140001494:	48 98                	cdqe
   140001496:	48 c1 e0 03          	shl    rax,0x3
   14000149a:	48 89 c1             	mov    rcx,rax
   14000149d:	e8 f6 1e 00 00       	call   0x140003398
   1400014a2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400014a6:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400014aa:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400014ad:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400014b1:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   1400014b8:	e9 8c 00 00 00       	jmp    0x140001549
   1400014bd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400014c0:	48 98                	cdqe
   1400014c2:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   1400014c9:	00 
   1400014ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400014ce:	48 01 d0             	add    rax,rdx
   1400014d1:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400014d4:	48 89 c1             	mov    rcx,rax
   1400014d7:	e8 9c 1d 00 00       	call   0x140003278
   1400014dc:	48 83 c0 01          	add    rax,0x1
   1400014e0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   1400014e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400014e7:	48 98                	cdqe
   1400014e9:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   1400014f0:	00 
   1400014f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400014f5:	48 8d 1c 02          	lea    rbx,[rdx+rax*1]
   1400014f9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400014fd:	48 89 c1             	mov    rcx,rax
   140001500:	e8 93 1e 00 00       	call   0x140003398
   140001505:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001508:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000150b:	48 98                	cdqe
   14000150d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140001514:	00 
   140001515:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001519:	48 01 d0             	add    rax,rdx
   14000151c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14000151f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001522:	48 98                	cdqe
   140001524:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   14000152b:	00 
   14000152c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001530:	48 01 c8             	add    rax,rcx
   140001533:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001536:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
   14000153a:	49 89 c8             	mov    r8,rcx
   14000153d:	48 89 c1             	mov    rcx,rax
   140001540:	e8 23 1e 00 00       	call   0x140003368
   140001545:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001549:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000154c:	3b 45 20             	cmp    eax,DWORD PTR [rbp+0x20]
   14000154f:	0f 8c 68 ff ff ff    	jl     0x1400014bd
   140001555:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001558:	48 98                	cdqe
   14000155a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140001561:	00 
   140001562:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001566:	48 01 d0             	add    rax,rdx
   140001569:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   140001570:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140001574:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140001578:	48 89 10             	mov    QWORD PTR [rax],rdx
   14000157b:	90                   	nop
   14000157c:	48 83 c4 48          	add    rsp,0x48
   140001580:	5b                   	pop    rbx
   140001581:	5d                   	pop    rbp
   140001582:	c3                   	ret
   140001583:	55                   	push   rbp
   140001584:	48 89 e5             	mov    rbp,rsp
   140001587:	48 83 ec 20          	sub    rsp,0x20
   14000158b:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000158f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001593:	48 89 c1             	mov    rcx,rax
   140001596:	e8 65 1b 00 00       	call   0x140003100
   14000159b:	48 85 c0             	test   rax,rax
   14000159e:	74 07                	je     0x1400015a7
   1400015a0:	b8 00 00 00 00       	mov    eax,0x0
   1400015a5:	eb 05                	jmp    0x1400015ac
   1400015a7:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400015ac:	48 83 c4 20          	add    rsp,0x20
   1400015b0:	5d                   	pop    rbp
   1400015b1:	c3                   	ret
   1400015b2:	90                   	nop
   1400015b3:	90                   	nop
   1400015b4:	90                   	nop
   1400015b5:	90                   	nop
   1400015b6:	90                   	nop
   1400015b7:	90                   	nop
   1400015b8:	90                   	nop
   1400015b9:	90                   	nop
   1400015ba:	90                   	nop
   1400015bb:	90                   	nop
   1400015bc:	90                   	nop
   1400015bd:	90                   	nop
   1400015be:	90                   	nop
   1400015bf:	90                   	nop
   1400015c0:	c3                   	ret
   1400015c1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400015c8:	00 00 00 00 
   1400015cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400015d0:	31 c0                	xor    eax,eax
   1400015d2:	c3                   	ret
   1400015d3:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400015da:	00 00 00 00 
   1400015de:	66 90                	xchg   ax,ax
   1400015e0:	55                   	push   rbp
   1400015e1:	57                   	push   rdi
   1400015e2:	56                   	push   rsi
   1400015e3:	53                   	push   rbx
   1400015e4:	48 83 ec 28          	sub    rsp,0x28
   1400015e8:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
   1400015ed:	48 8d 35 0c 3a 00 00 	lea    rsi,[rip+0x3a0c]        # 0x140005000
   1400015f4:	48 89 f1             	mov    rcx,rsi
   1400015f7:	ff 15 eb 8c 00 00    	call   QWORD PTR [rip+0x8ceb]        # 0x14000a2e8
   1400015fd:	48 89 c3             	mov    rbx,rax
   140001600:	48 85 c0             	test   rax,rax
   140001603:	74 6b                	je     0x140001670
   140001605:	48 89 f1             	mov    rcx,rsi
   140001608:	ff 15 fa 8c 00 00    	call   QWORD PTR [rip+0x8cfa]        # 0x14000a308
   14000160e:	48 8b 3d db 8c 00 00 	mov    rdi,QWORD PTR [rip+0x8cdb]        # 0x14000a2f0
   140001615:	48 8d 15 f7 39 00 00 	lea    rdx,[rip+0x39f7]        # 0x140005013
   14000161c:	48 89 d9             	mov    rcx,rbx
   14000161f:	48 89 05 1a 7a 00 00 	mov    QWORD PTR [rip+0x7a1a],rax        # 0x140009040
   140001626:	ff d7                	call   rdi
   140001628:	48 8d 15 fa 39 00 00 	lea    rdx,[rip+0x39fa]        # 0x140005029
   14000162f:	48 89 d9             	mov    rcx,rbx
   140001632:	48 89 c6             	mov    rsi,rax
   140001635:	ff d7                	call   rdi
   140001637:	48 89 05 c2 29 00 00 	mov    QWORD PTR [rip+0x29c2],rax        # 0x140004000
   14000163e:	48 85 f6             	test   rsi,rsi
   140001641:	74 10                	je     0x140001653
   140001643:	48 8d 15 16 7a 00 00 	lea    rdx,[rip+0x7a16]        # 0x140009060
   14000164a:	48 8d 0d af 49 00 00 	lea    rcx,[rip+0x49af]        # 0x140006000
   140001651:	ff d6                	call   rsi
   140001653:	48 8d 0d 36 00 00 00 	lea    rcx,[rip+0x36]        # 0x140001690
   14000165a:	48 83 c4 28          	add    rsp,0x28
   14000165e:	5b                   	pop    rbx
   14000165f:	5e                   	pop    rsi
   140001660:	5f                   	pop    rdi
   140001661:	5d                   	pop    rbp
   140001662:	e9 1c ff ff ff       	jmp    0x140001583
   140001667:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000166e:	00 00 
   140001670:	48 8d 05 59 ff ff ff 	lea    rax,[rip+0xffffffffffffff59]        # 0x1400015d0
   140001677:	48 8d 35 42 ff ff ff 	lea    rsi,[rip+0xffffffffffffff42]        # 0x1400015c0
   14000167e:	48 89 05 7b 29 00 00 	mov    QWORD PTR [rip+0x297b],rax        # 0x140004000
   140001685:	eb bc                	jmp    0x140001643
   140001687:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000168e:	00 00 
   140001690:	55                   	push   rbp
   140001691:	48 89 e5             	mov    rbp,rsp
   140001694:	48 83 ec 20          	sub    rsp,0x20
   140001698:	48 8b 05 61 29 00 00 	mov    rax,QWORD PTR [rip+0x2961]        # 0x140004000
   14000169f:	48 85 c0             	test   rax,rax
   1400016a2:	74 09                	je     0x1400016ad
   1400016a4:	48 8d 0d 55 49 00 00 	lea    rcx,[rip+0x4955]        # 0x140006000
   1400016ab:	ff d0                	call   rax
   1400016ad:	48 8b 0d 8c 79 00 00 	mov    rcx,QWORD PTR [rip+0x798c]        # 0x140009040
   1400016b4:	48 85 c9             	test   rcx,rcx
   1400016b7:	74 0f                	je     0x1400016c8
   1400016b9:	48 83 c4 20          	add    rsp,0x20
   1400016bd:	5d                   	pop    rbp
   1400016be:	48 ff 25 13 8c 00 00 	rex.W jmp QWORD PTR [rip+0x8c13]        # 0x14000a2d8
   1400016c5:	0f 1f 00             	nop    DWORD PTR [rax]
   1400016c8:	48 83 c4 20          	add    rsp,0x20
   1400016cc:	5d                   	pop    rbp
   1400016cd:	c3                   	ret
   1400016ce:	90                   	nop
   1400016cf:	90                   	nop
   1400016d0:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400016d7:	00 00 00 
   1400016da:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400016e0:	45 85 c0             	test   r8d,r8d
   1400016e3:	4d 63 c0             	movsxd r8,r8d
   1400016e6:	7e 2e                	jle    0x140001716
   1400016e8:	31 c0                	xor    eax,eax
   1400016ea:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400016f1:	00 00 00 00 
   1400016f5:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400016fc:	00 00 00 00 
   140001700:	44 0f b6 0c 02       	movzx  r9d,BYTE PTR [rdx+rax*1]
   140001705:	41 83 f1 aa          	xor    r9d,0xffffffaa
   140001709:	44 88 0c 01          	mov    BYTE PTR [rcx+rax*1],r9b
   14000170d:	48 83 c0 01          	add    rax,0x1
   140001711:	49 39 c0             	cmp    r8,rax
   140001714:	75 ea                	jne    0x140001700
   140001716:	42 c6 04 01 00       	mov    BYTE PTR [rcx+r8*1],0x0
   14000171b:	c3                   	ret
   14000171c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001720:	81 f1 78 56 34 12    	xor    ecx,0x12345678
   140001726:	8d 81 f0 de bc 9a    	lea    eax,[rcx-0x65432110]
   14000172c:	c3                   	ret
   14000172d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001730:	8d 04 cd 00 00 00 00 	lea    eax,[rcx*8+0x0]
   140001737:	c1 e9 05             	shr    ecx,0x5
   14000173a:	31 c8                	xor    eax,ecx
   14000173c:	c3                   	ret
   14000173d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001740:	89 c8                	mov    eax,ecx
   140001742:	35 41 45 01 35       	xor    eax,0x35014541
   140001747:	c3                   	ret
   140001748:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000174f:	00 
   140001750:	89 c8                	mov    eax,ecx
   140001752:	c1 e0 07             	shl    eax,0x7
   140001755:	01 c8                	add    eax,ecx
   140001757:	c3                   	ret
   140001758:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000175f:	00 
   140001760:	89 c8                	mov    eax,ecx
   140001762:	c1 e8 0b             	shr    eax,0xb
   140001765:	31 c8                	xor    eax,ecx
   140001767:	c3                   	ret
   140001768:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000176f:	00 
   140001770:	48 83 ec 18          	sub    rsp,0x18
   140001774:	4c 8d 05 95 28 00 00 	lea    r8,[rip+0x2895]        # 0x140004010
   14000177b:	c7 44 24 0c 37 13 00 	mov    DWORD PTR [rsp+0xc],0x1337
   140001782:	00 
   140001783:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
   140001787:	35 78 56 34 12       	xor    eax,0x12345678
   14000178c:	2d 10 21 43 65       	sub    eax,0x65432110
   140001791:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
   140001795:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
   140001799:	8d 14 c5 00 00 00 00 	lea    edx,[rax*8+0x0]
   1400017a0:	c1 e8 05             	shr    eax,0x5
   1400017a3:	31 d0                	xor    eax,edx
   1400017a5:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
   1400017a9:	8b 44 24 0c          	mov    eax,DWORD PTR [rsp+0xc]
   1400017ad:	35 41 45 01 35       	xor    eax,0x35014541
   1400017b2:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
   1400017b6:	8b 54 24 0c          	mov    edx,DWORD PTR [rsp+0xc]
   1400017ba:	89 d0                	mov    eax,edx
   1400017bc:	c1 e0 07             	shl    eax,0x7
   1400017bf:	01 d0                	add    eax,edx
   1400017c1:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
   1400017c5:	8b 54 24 0c          	mov    edx,DWORD PTR [rsp+0xc]
   1400017c9:	89 d0                	mov    eax,edx
   1400017cb:	c1 e8 0b             	shr    eax,0xb
   1400017ce:	31 d0                	xor    eax,edx
   1400017d0:	89 44 24 0c          	mov    DWORD PTR [rsp+0xc],eax
   1400017d4:	31 c0                	xor    eax,eax
   1400017d6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400017dd:	00 00 00 
   1400017e0:	41 0f b6 14 00       	movzx  edx,BYTE PTR [r8+rax*1]
   1400017e5:	83 f2 aa             	xor    edx,0xffffffaa
   1400017e8:	88 14 01             	mov    BYTE PTR [rcx+rax*1],dl
   1400017eb:	48 83 c0 01          	add    rax,0x1
   1400017ef:	48 83 f8 0d          	cmp    rax,0xd
   1400017f3:	75 eb                	jne    0x1400017e0
   1400017f5:	c6 41 0d 00          	mov    BYTE PTR [rcx+0xd],0x0
   1400017f9:	48 83 c4 18          	add    rsp,0x18
   1400017fd:	c3                   	ret
   1400017fe:	90                   	nop
   1400017ff:	90                   	nop
   140001800:	55                   	push   rbp
   140001801:	48 89 e5             	mov    rbp,rsp
   140001804:	48 83 ec 20          	sub    rsp,0x20
   140001808:	eb 1e                	jmp    0x140001828
   14000180a:	48 8b 05 2f 28 00 00 	mov    rax,QWORD PTR [rip+0x282f]        # 0x140004040
   140001811:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001814:	ff d0                	call   rax
   140001816:	48 8b 05 23 28 00 00 	mov    rax,QWORD PTR [rip+0x2823]        # 0x140004040
   14000181d:	48 83 c0 08          	add    rax,0x8
   140001821:	48 89 05 18 28 00 00 	mov    QWORD PTR [rip+0x2818],rax        # 0x140004040
   140001828:	48 8b 05 11 28 00 00 	mov    rax,QWORD PTR [rip+0x2811]        # 0x140004040
   14000182f:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001832:	48 85 c0             	test   rax,rax
   140001835:	75 d3                	jne    0x14000180a
   140001837:	90                   	nop
   140001838:	90                   	nop
   140001839:	48 83 c4 20          	add    rsp,0x20
   14000183d:	5d                   	pop    rbp
   14000183e:	c3                   	ret
   14000183f:	55                   	push   rbp
   140001840:	48 89 e5             	mov    rbp,rsp
   140001843:	48 83 ec 30          	sub    rsp,0x30
   140001847:	48 8b 05 62 3b 00 00 	mov    rax,QWORD PTR [rip+0x3b62]        # 0x1400053b0
   14000184e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001851:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001854:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
   140001858:	75 25                	jne    0x14000187f
   14000185a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001861:	eb 04                	jmp    0x140001867
   140001863:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001867:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000186a:	8d 50 01             	lea    edx,[rax+0x1]
   14000186d:	48 8b 05 3c 3b 00 00 	mov    rax,QWORD PTR [rip+0x3b3c]        # 0x1400053b0
   140001874:	89 d2                	mov    edx,edx
   140001876:	48 8b 04 d0          	mov    rax,QWORD PTR [rax+rdx*8]
   14000187a:	48 85 c0             	test   rax,rax
   14000187d:	75 e4                	jne    0x140001863
   14000187f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001882:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140001885:	eb 14                	jmp    0x14000189b
   140001887:	48 8b 05 22 3b 00 00 	mov    rax,QWORD PTR [rip+0x3b22]        # 0x1400053b0
   14000188e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   140001891:	48 8b 04 d0          	mov    rax,QWORD PTR [rax+rdx*8]
   140001895:	ff d0                	call   rax
   140001897:	83 6d f8 01          	sub    DWORD PTR [rbp-0x8],0x1
   14000189b:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   14000189f:	75 e6                	jne    0x140001887
   1400018a1:	48 8d 05 58 ff ff ff 	lea    rax,[rip+0xffffffffffffff58]        # 0x140001800
   1400018a8:	48 89 c1             	mov    rcx,rax
   1400018ab:	e8 d3 fc ff ff       	call   0x140001583
   1400018b0:	90                   	nop
   1400018b1:	48 83 c4 30          	add    rsp,0x30
   1400018b5:	5d                   	pop    rbp
   1400018b6:	c3                   	ret
   1400018b7:	55                   	push   rbp
   1400018b8:	48 89 e5             	mov    rbp,rsp
   1400018bb:	48 83 ec 20          	sub    rsp,0x20
   1400018bf:	8b 05 db 77 00 00    	mov    eax,DWORD PTR [rip+0x77db]        # 0x1400090a0
   1400018c5:	85 c0                	test   eax,eax
   1400018c7:	75 0f                	jne    0x1400018d8
   1400018c9:	c7 05 cd 77 00 00 01 	mov    DWORD PTR [rip+0x77cd],0x1        # 0x1400090a0
   1400018d0:	00 00 00 
   1400018d3:	e8 67 ff ff ff       	call   0x14000183f
   1400018d8:	90                   	nop
   1400018d9:	48 83 c4 20          	add    rsp,0x20
   1400018dd:	5d                   	pop    rbp
   1400018de:	c3                   	ret
   1400018df:	90                   	nop
   1400018e0:	55                   	push   rbp
   1400018e1:	48 89 e5             	mov    rbp,rsp
   1400018e4:	b8 00 00 00 00       	mov    eax,0x0
   1400018e9:	5d                   	pop    rbp
   1400018ea:	c3                   	ret
   1400018eb:	90                   	nop
   1400018ec:	90                   	nop
   1400018ed:	90                   	nop
   1400018ee:	90                   	nop
   1400018ef:	90                   	nop
   1400018f0:	55                   	push   rbp
   1400018f1:	48 89 e5             	mov    rbp,rsp
   1400018f4:	48 83 ec 30          	sub    rsp,0x30
   1400018f8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400018fc:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400018ff:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001903:	48 8b 05 86 3a 00 00 	mov    rax,QWORD PTR [rip+0x3a86]        # 0x140005390
   14000190a:	8b 00                	mov    eax,DWORD PTR [rax]
   14000190c:	83 f8 02             	cmp    eax,0x2
   14000190f:	74 0d                	je     0x14000191e
   140001911:	48 8b 05 78 3a 00 00 	mov    rax,QWORD PTR [rip+0x3a78]        # 0x140005390
   140001918:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   14000191e:	83 7d 18 02          	cmp    DWORD PTR [rbp+0x18],0x2
   140001922:	74 23                	je     0x140001947
   140001924:	83 7d 18 01          	cmp    DWORD PTR [rbp+0x18],0x1
   140001928:	75 16                	jne    0x140001940
   14000192a:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   14000192e:	8b 55 18             	mov    edx,DWORD PTR [rbp+0x18]
   140001931:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001935:	49 89 c8             	mov    r8,rcx
   140001938:	48 89 c1             	mov    rcx,rax
   14000193b:	e8 61 0f 00 00       	call   0x1400028a1
   140001940:	b8 01 00 00 00       	mov    eax,0x1
   140001945:	eb 46                	jmp    0x14000198d
   140001947:	48 8d 05 2a 46 00 00 	lea    rax,[rip+0x462a]        # 0x140005f78
   14000194e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001952:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
   140001957:	eb 22                	jmp    0x14000197b
   140001959:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000195d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140001961:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001965:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001968:	48 85 c0             	test   rax,rax
   14000196b:	74 09                	je     0x140001976
   14000196d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001971:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001974:	ff d0                	call   rax
   140001976:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
   14000197b:	48 8d 05 fe 45 00 00 	lea    rax,[rip+0x45fe]        # 0x140005f80
   140001982:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
   140001986:	75 d1                	jne    0x140001959
   140001988:	b8 01 00 00 00       	mov    eax,0x1
   14000198d:	48 83 c4 30          	add    rsp,0x30
   140001991:	5d                   	pop    rbp
   140001992:	c3                   	ret
   140001993:	55                   	push   rbp
   140001994:	48 89 e5             	mov    rbp,rsp
   140001997:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000199b:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   1400019a0:	75 07                	jne    0x1400019a9
   1400019a2:	b8 00 00 00 00       	mov    eax,0x0
   1400019a7:	eb 05                	jmp    0x1400019ae
   1400019a9:	b8 00 00 00 00       	mov    eax,0x0
   1400019ae:	5d                   	pop    rbp
   1400019af:	c3                   	ret
   1400019b0:	55                   	push   rbp
   1400019b1:	48 89 e5             	mov    rbp,rsp
   1400019b4:	48 83 ec 20          	sub    rsp,0x20
   1400019b8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400019bc:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400019bf:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   1400019c3:	83 7d 18 03          	cmp    DWORD PTR [rbp+0x18],0x3
   1400019c7:	74 0d                	je     0x1400019d6
   1400019c9:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   1400019cd:	74 07                	je     0x1400019d6
   1400019cf:	b8 01 00 00 00       	mov    eax,0x1
   1400019d4:	eb 1b                	jmp    0x1400019f1
   1400019d6:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   1400019da:	8b 55 18             	mov    edx,DWORD PTR [rbp+0x18]
   1400019dd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400019e1:	49 89 c8             	mov    r8,rcx
   1400019e4:	48 89 c1             	mov    rcx,rax
   1400019e7:	e8 b5 0e 00 00       	call   0x1400028a1
   1400019ec:	b8 01 00 00 00       	mov    eax,0x1
   1400019f1:	48 83 c4 20          	add    rsp,0x20
   1400019f5:	5d                   	pop    rbp
   1400019f6:	c3                   	ret
   1400019f7:	90                   	nop
   1400019f8:	90                   	nop
   1400019f9:	90                   	nop
   1400019fa:	90                   	nop
   1400019fb:	90                   	nop
   1400019fc:	90                   	nop
   1400019fd:	90                   	nop
   1400019fe:	90                   	nop
   1400019ff:	90                   	nop
   140001a00:	55                   	push   rbp
   140001a01:	53                   	push   rbx
   140001a02:	48 81 ec 88 00 00 00 	sub    rsp,0x88
   140001a09:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   140001a0e:	0f 29 75 00          	movaps XMMWORD PTR [rbp+0x0],xmm6
   140001a12:	0f 29 7d 10          	movaps XMMWORD PTR [rbp+0x10],xmm7
   140001a16:	44 0f 29 45 20       	movaps XMMWORD PTR [rbp+0x20],xmm8
   140001a1b:	48 89 4d 50          	mov    QWORD PTR [rbp+0x50],rcx
   140001a1f:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001a23:	8b 00                	mov    eax,DWORD PTR [rax]
   140001a25:	83 f8 06             	cmp    eax,0x6
   140001a28:	77 70                	ja     0x140001a9a
   140001a2a:	89 c0                	mov    eax,eax
   140001a2c:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140001a33:	00 
   140001a34:	48 8d 05 89 37 00 00 	lea    rax,[rip+0x3789]        # 0x1400051c4
   140001a3b:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
   140001a3e:	48 98                	cdqe
   140001a40:	48 8d 15 7d 37 00 00 	lea    rdx,[rip+0x377d]        # 0x1400051c4
   140001a47:	48 01 d0             	add    rax,rdx
   140001a4a:	ff e0                	jmp    rax
   140001a4c:	48 8d 05 4d 36 00 00 	lea    rax,[rip+0x364d]        # 0x1400050a0
   140001a53:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a57:	eb 4d                	jmp    0x140001aa6
   140001a59:	48 8d 05 5f 36 00 00 	lea    rax,[rip+0x365f]        # 0x1400050bf
   140001a60:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a64:	eb 40                	jmp    0x140001aa6
   140001a66:	48 8d 05 73 36 00 00 	lea    rax,[rip+0x3673]        # 0x1400050e0
   140001a6d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a71:	eb 33                	jmp    0x140001aa6
   140001a73:	48 8d 05 86 36 00 00 	lea    rax,[rip+0x3686]        # 0x140005100
   140001a7a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a7e:	eb 26                	jmp    0x140001aa6
   140001a80:	48 8d 05 a1 36 00 00 	lea    rax,[rip+0x36a1]        # 0x140005128
   140001a87:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a8b:	eb 19                	jmp    0x140001aa6
   140001a8d:	48 8d 05 bc 36 00 00 	lea    rax,[rip+0x36bc]        # 0x140005150
   140001a94:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001a98:	eb 0c                	jmp    0x140001aa6
   140001a9a:	48 8d 05 e5 36 00 00 	lea    rax,[rip+0x36e5]        # 0x140005186
   140001aa1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001aa5:	90                   	nop
   140001aa6:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001aaa:	f2 44 0f 10 40 20    	movsd  xmm8,QWORD PTR [rax+0x20]
   140001ab0:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001ab4:	f2 0f 10 78 18       	movsd  xmm7,QWORD PTR [rax+0x18]
   140001ab9:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001abd:	f2 0f 10 70 10       	movsd  xmm6,QWORD PTR [rax+0x10]
   140001ac2:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001ac6:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
   140001aca:	b9 02 00 00 00       	mov    ecx,0x2
   140001acf:	e8 bc 17 00 00       	call   0x140003290
   140001ad4:	48 89 c1             	mov    rcx,rax
   140001ad7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001adb:	f2 44 0f 11 44 24 30 	movsd  QWORD PTR [rsp+0x30],xmm8
   140001ae2:	f2 0f 11 7c 24 28    	movsd  QWORD PTR [rsp+0x28],xmm7
   140001ae8:	f2 0f 11 74 24 20    	movsd  QWORD PTR [rsp+0x20],xmm6
   140001aee:	49 89 d9             	mov    r9,rbx
   140001af1:	49 89 c0             	mov    r8,rax
   140001af4:	48 8d 05 9d 36 00 00 	lea    rax,[rip+0x369d]        # 0x140005198
   140001afb:	48 89 c2             	mov    rdx,rax
   140001afe:	e8 9d 14 00 00       	call   0x140002fa0
   140001b03:	b8 00 00 00 00       	mov    eax,0x0
   140001b08:	0f 28 75 00          	movaps xmm6,XMMWORD PTR [rbp+0x0]
   140001b0c:	0f 28 7d 10          	movaps xmm7,XMMWORD PTR [rbp+0x10]
   140001b10:	44 0f 28 45 20       	movaps xmm8,XMMWORD PTR [rbp+0x20]
   140001b15:	48 81 c4 88 00 00 00 	add    rsp,0x88
   140001b1c:	5b                   	pop    rbx
   140001b1d:	5d                   	pop    rbp
   140001b1e:	c3                   	ret
   140001b1f:	90                   	nop
   140001b20:	55                   	push   rbp
   140001b21:	48 89 e5             	mov    rbp,rsp
   140001b24:	db e3                	fninit
   140001b26:	90                   	nop
   140001b27:	5d                   	pop    rbp
   140001b28:	c3                   	ret
   140001b29:	90                   	nop
   140001b2a:	90                   	nop
   140001b2b:	90                   	nop
   140001b2c:	90                   	nop
   140001b2d:	90                   	nop
   140001b2e:	90                   	nop
   140001b2f:	90                   	nop
   140001b30:	55                   	push   rbp
   140001b31:	53                   	push   rbx
   140001b32:	48 83 ec 38          	sub    rsp,0x38
   140001b36:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140001b3b:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140001b3f:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140001b43:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140001b47:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140001b4b:	48 8d 45 28          	lea    rax,[rbp+0x28]
   140001b4f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b53:	b9 02 00 00 00       	mov    ecx,0x2
   140001b58:	e8 33 17 00 00       	call   0x140003290
   140001b5d:	49 89 c1             	mov    r9,rax
   140001b60:	41 b8 1b 00 00 00    	mov    r8d,0x1b
   140001b66:	ba 01 00 00 00       	mov    edx,0x1
   140001b6b:	48 8d 05 6e 36 00 00 	lea    rax,[rip+0x366e]        # 0x1400051e0
   140001b72:	48 89 c1             	mov    rcx,rax
   140001b75:	e8 46 17 00 00       	call   0x1400032c0
   140001b7a:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
   140001b7e:	b9 02 00 00 00       	mov    ecx,0x2
   140001b83:	e8 08 17 00 00       	call   0x140003290
   140001b88:	48 89 c1             	mov    rcx,rax
   140001b8b:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140001b8f:	49 89 d8             	mov    r8,rbx
   140001b92:	48 89 c2             	mov    rdx,rax
   140001b95:	e8 f6 12 00 00       	call   0x140002e90
   140001b9a:	e8 a1 17 00 00       	call   0x140003340
   140001b9f:	90                   	nop
   140001ba0:	55                   	push   rbp
   140001ba1:	48 89 e5             	mov    rbp,rsp
   140001ba4:	48 83 ec 60          	sub    rsp,0x60
   140001ba8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001bac:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001bb3:	e9 82 00 00 00       	jmp    0x140001c3a
   140001bb8:	48 8b 0d 31 75 00 00 	mov    rcx,QWORD PTR [rip+0x7531]        # 0x1400090f0
   140001bbf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001bc2:	48 63 d0             	movsxd rdx,eax
   140001bc5:	48 89 d0             	mov    rax,rdx
   140001bc8:	48 c1 e0 02          	shl    rax,0x2
   140001bcc:	48 01 d0             	add    rax,rdx
   140001bcf:	48 c1 e0 03          	shl    rax,0x3
   140001bd3:	48 01 c8             	add    rax,rcx
   140001bd6:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   140001bda:	48 39 45 10          	cmp    QWORD PTR [rbp+0x10],rax
   140001bde:	72 56                	jb     0x140001c36
   140001be0:	48 8b 0d 09 75 00 00 	mov    rcx,QWORD PTR [rip+0x7509]        # 0x1400090f0
   140001be7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001bea:	48 63 d0             	movsxd rdx,eax
   140001bed:	48 89 d0             	mov    rax,rdx
   140001bf0:	48 c1 e0 02          	shl    rax,0x2
   140001bf4:	48 01 d0             	add    rax,rdx
   140001bf7:	48 c1 e0 03          	shl    rax,0x3
   140001bfb:	48 01 c8             	add    rax,rcx
   140001bfe:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   140001c02:	4c 8b 05 e7 74 00 00 	mov    r8,QWORD PTR [rip+0x74e7]        # 0x1400090f0
   140001c09:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001c0c:	48 63 d0             	movsxd rdx,eax
   140001c0f:	48 89 d0             	mov    rax,rdx
   140001c12:	48 c1 e0 02          	shl    rax,0x2
   140001c16:	48 01 d0             	add    rax,rdx
   140001c19:	48 c1 e0 03          	shl    rax,0x3
   140001c1d:	4c 01 c0             	add    rax,r8
   140001c20:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
   140001c24:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140001c27:	89 c0                	mov    eax,eax
   140001c29:	48 01 c8             	add    rax,rcx
   140001c2c:	48 39 45 10          	cmp    QWORD PTR [rbp+0x10],rax
   140001c30:	0f 82 42 02 00 00    	jb     0x140001e78
   140001c36:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001c3a:	8b 05 b8 74 00 00    	mov    eax,DWORD PTR [rip+0x74b8]        # 0x1400090f8
   140001c40:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   140001c43:	0f 8c 6f ff ff ff    	jl     0x140001bb8
   140001c49:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001c4d:	48 89 c1             	mov    rcx,rax
   140001c50:	e8 26 0f 00 00       	call   0x140002b7b
   140001c55:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140001c59:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140001c5e:	75 16                	jne    0x140001c76
   140001c60:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001c64:	48 89 c2             	mov    rdx,rax
   140001c67:	48 8d 05 92 35 00 00 	lea    rax,[rip+0x3592]        # 0x140005200
   140001c6e:	48 89 c1             	mov    rcx,rax
   140001c71:	e8 ba fe ff ff       	call   0x140001b30
   140001c76:	48 8b 0d 73 74 00 00 	mov    rcx,QWORD PTR [rip+0x7473]        # 0x1400090f0
   140001c7d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001c80:	48 63 d0             	movsxd rdx,eax
   140001c83:	48 89 d0             	mov    rax,rdx
   140001c86:	48 c1 e0 02          	shl    rax,0x2
   140001c8a:	48 01 d0             	add    rax,rdx
   140001c8d:	48 c1 e0 03          	shl    rax,0x3
   140001c91:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
   140001c95:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001c99:	48 89 42 20          	mov    QWORD PTR [rdx+0x20],rax
   140001c9d:	48 8b 0d 4c 74 00 00 	mov    rcx,QWORD PTR [rip+0x744c]        # 0x1400090f0
   140001ca4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001ca7:	48 63 d0             	movsxd rdx,eax
   140001caa:	48 89 d0             	mov    rax,rdx
   140001cad:	48 c1 e0 02          	shl    rax,0x2
   140001cb1:	48 01 d0             	add    rax,rdx
   140001cb4:	48 c1 e0 03          	shl    rax,0x3
   140001cb8:	48 01 c8             	add    rax,rcx
   140001cbb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001cc1:	e8 01 10 00 00       	call   0x140002cc7
   140001cc6:	48 89 c1             	mov    rcx,rax
   140001cc9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001ccd:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140001cd0:	41 89 c1             	mov    r9d,eax
   140001cd3:	4c 8b 05 16 74 00 00 	mov    r8,QWORD PTR [rip+0x7416]        # 0x1400090f0
   140001cda:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001cdd:	48 63 d0             	movsxd rdx,eax
   140001ce0:	48 89 d0             	mov    rax,rdx
   140001ce3:	48 c1 e0 02          	shl    rax,0x2
   140001ce7:	48 01 d0             	add    rax,rdx
   140001cea:	48 c1 e0 03          	shl    rax,0x3
   140001cee:	4c 01 c0             	add    rax,r8
   140001cf1:	4a 8d 14 09          	lea    rdx,[rcx+r9*1]
   140001cf5:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
   140001cf9:	48 8b 0d f0 73 00 00 	mov    rcx,QWORD PTR [rip+0x73f0]        # 0x1400090f0
   140001d00:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001d03:	48 63 d0             	movsxd rdx,eax
   140001d06:	48 89 d0             	mov    rax,rdx
   140001d09:	48 c1 e0 02          	shl    rax,0x2
   140001d0d:	48 01 d0             	add    rax,rdx
   140001d10:	48 c1 e0 03          	shl    rax,0x3
   140001d14:	48 01 c8             	add    rax,rcx
   140001d17:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   140001d1b:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140001d1f:	41 b8 30 00 00 00    	mov    r8d,0x30
   140001d25:	48 89 c1             	mov    rcx,rax
   140001d28:	48 8b 05 01 86 00 00 	mov    rax,QWORD PTR [rip+0x8601]        # 0x14000a330
   140001d2f:	ff d0                	call   rax
   140001d31:	48 85 c0             	test   rax,rax
   140001d34:	75 3d                	jne    0x140001d73
   140001d36:	48 8b 0d b3 73 00 00 	mov    rcx,QWORD PTR [rip+0x73b3]        # 0x1400090f0
   140001d3d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001d40:	48 63 d0             	movsxd rdx,eax
   140001d43:	48 89 d0             	mov    rax,rdx
   140001d46:	48 c1 e0 02          	shl    rax,0x2
   140001d4a:	48 01 d0             	add    rax,rdx
   140001d4d:	48 c1 e0 03          	shl    rax,0x3
   140001d51:	48 01 c8             	add    rax,rcx
   140001d54:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   140001d58:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001d5c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140001d5f:	49 89 d0             	mov    r8,rdx
   140001d62:	89 c2                	mov    edx,eax
   140001d64:	48 8d 05 b5 34 00 00 	lea    rax,[rip+0x34b5]        # 0x140005220
   140001d6b:	48 89 c1             	mov    rcx,rax
   140001d6e:	e8 bd fd ff ff       	call   0x140001b30
   140001d73:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001d76:	83 f8 40             	cmp    eax,0x40
   140001d79:	0f 84 e8 00 00 00    	je     0x140001e67
   140001d7f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001d82:	83 f8 04             	cmp    eax,0x4
   140001d85:	0f 84 dc 00 00 00    	je     0x140001e67
   140001d8b:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001d8e:	3d 80 00 00 00       	cmp    eax,0x80
   140001d93:	0f 84 ce 00 00 00    	je     0x140001e67
   140001d99:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001d9c:	83 f8 08             	cmp    eax,0x8
   140001d9f:	0f 84 c2 00 00 00    	je     0x140001e67
   140001da5:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001da8:	83 f8 02             	cmp    eax,0x2
   140001dab:	75 09                	jne    0x140001db6
   140001dad:	c7 45 f8 04 00 00 00 	mov    DWORD PTR [rbp-0x8],0x4
   140001db4:	eb 07                	jmp    0x140001dbd
   140001db6:	c7 45 f8 40 00 00 00 	mov    DWORD PTR [rbp-0x8],0x40
   140001dbd:	48 8b 0d 2c 73 00 00 	mov    rcx,QWORD PTR [rip+0x732c]        # 0x1400090f0
   140001dc4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001dc7:	48 63 d0             	movsxd rdx,eax
   140001dca:	48 89 d0             	mov    rax,rdx
   140001dcd:	48 c1 e0 02          	shl    rax,0x2
   140001dd1:	48 01 d0             	add    rax,rdx
   140001dd4:	48 c1 e0 03          	shl    rax,0x3
   140001dd8:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
   140001ddc:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   140001de0:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
   140001de4:	48 8b 0d 05 73 00 00 	mov    rcx,QWORD PTR [rip+0x7305]        # 0x1400090f0
   140001deb:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001dee:	48 63 d0             	movsxd rdx,eax
   140001df1:	48 89 d0             	mov    rax,rdx
   140001df4:	48 c1 e0 02          	shl    rax,0x2
   140001df8:	48 01 d0             	add    rax,rdx
   140001dfb:	48 c1 e0 03          	shl    rax,0x3
   140001dff:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
   140001e03:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140001e07:	48 89 42 10          	mov    QWORD PTR [rdx+0x10],rax
   140001e0b:	48 8b 0d de 72 00 00 	mov    rcx,QWORD PTR [rip+0x72de]        # 0x1400090f0
   140001e12:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001e15:	48 63 d0             	movsxd rdx,eax
   140001e18:	48 89 d0             	mov    rax,rdx
   140001e1b:	48 c1 e0 02          	shl    rax,0x2
   140001e1f:	48 01 d0             	add    rax,rdx
   140001e22:	48 c1 e0 03          	shl    rax,0x3
   140001e26:	48 01 c8             	add    rax,rcx
   140001e29:	49 89 c0             	mov    r8,rax
   140001e2c:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
   140001e30:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   140001e34:	8b 4d f8             	mov    ecx,DWORD PTR [rbp-0x8]
   140001e37:	4d 89 c1             	mov    r9,r8
   140001e3a:	41 89 c8             	mov    r8d,ecx
   140001e3d:	48 89 c1             	mov    rcx,rax
   140001e40:	48 8b 05 e1 84 00 00 	mov    rax,QWORD PTR [rip+0x84e1]        # 0x14000a328
   140001e47:	ff d0                	call   rax
   140001e49:	85 c0                	test   eax,eax
   140001e4b:	75 1a                	jne    0x140001e67
   140001e4d:	48 8b 05 8c 84 00 00 	mov    rax,QWORD PTR [rip+0x848c]        # 0x14000a2e0
   140001e54:	ff d0                	call   rax
   140001e56:	89 c2                	mov    edx,eax
   140001e58:	48 8d 05 f9 33 00 00 	lea    rax,[rip+0x33f9]        # 0x140005258
   140001e5f:	48 89 c1             	mov    rcx,rax
   140001e62:	e8 c9 fc ff ff       	call   0x140001b30
   140001e67:	8b 05 8b 72 00 00    	mov    eax,DWORD PTR [rip+0x728b]        # 0x1400090f8
   140001e6d:	83 c0 01             	add    eax,0x1
   140001e70:	89 05 82 72 00 00    	mov    DWORD PTR [rip+0x7282],eax        # 0x1400090f8
   140001e76:	eb 01                	jmp    0x140001e79
   140001e78:	90                   	nop
   140001e79:	48 83 c4 60          	add    rsp,0x60
   140001e7d:	5d                   	pop    rbp
   140001e7e:	c3                   	ret
   140001e7f:	55                   	push   rbp
   140001e80:	48 89 e5             	mov    rbp,rsp
   140001e83:	48 83 ec 30          	sub    rsp,0x30
   140001e87:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001e8e:	e9 ad 00 00 00       	jmp    0x140001f40
   140001e93:	48 8b 0d 56 72 00 00 	mov    rcx,QWORD PTR [rip+0x7256]        # 0x1400090f0
   140001e9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001e9d:	48 63 d0             	movsxd rdx,eax
   140001ea0:	48 89 d0             	mov    rax,rdx
   140001ea3:	48 c1 e0 02          	shl    rax,0x2
   140001ea7:	48 01 d0             	add    rax,rdx
   140001eaa:	48 c1 e0 03          	shl    rax,0x3
   140001eae:	48 01 c8             	add    rax,rcx
   140001eb1:	8b 00                	mov    eax,DWORD PTR [rax]
   140001eb3:	85 c0                	test   eax,eax
   140001eb5:	0f 84 80 00 00 00    	je     0x140001f3b
   140001ebb:	48 8b 0d 2e 72 00 00 	mov    rcx,QWORD PTR [rip+0x722e]        # 0x1400090f0
   140001ec2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001ec5:	48 63 d0             	movsxd rdx,eax
   140001ec8:	48 89 d0             	mov    rax,rdx
   140001ecb:	48 c1 e0 02          	shl    rax,0x2
   140001ecf:	48 01 d0             	add    rax,rdx
   140001ed2:	48 c1 e0 03          	shl    rax,0x3
   140001ed6:	48 01 c8             	add    rax,rcx
   140001ed9:	44 8b 10             	mov    r10d,DWORD PTR [rax]
   140001edc:	48 8b 0d 0d 72 00 00 	mov    rcx,QWORD PTR [rip+0x720d]        # 0x1400090f0
   140001ee3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001ee6:	48 63 d0             	movsxd rdx,eax
   140001ee9:	48 89 d0             	mov    rax,rdx
   140001eec:	48 c1 e0 02          	shl    rax,0x2
   140001ef0:	48 01 d0             	add    rax,rdx
   140001ef3:	48 c1 e0 03          	shl    rax,0x3
   140001ef7:	48 01 c8             	add    rax,rcx
   140001efa:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
   140001efe:	4c 8b 05 eb 71 00 00 	mov    r8,QWORD PTR [rip+0x71eb]        # 0x1400090f0
   140001f05:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001f08:	48 63 d0             	movsxd rdx,eax
   140001f0b:	48 89 d0             	mov    rax,rdx
   140001f0e:	48 c1 e0 02          	shl    rax,0x2
   140001f12:	48 01 d0             	add    rax,rdx
   140001f15:	48 c1 e0 03          	shl    rax,0x3
   140001f19:	4c 01 c0             	add    rax,r8
   140001f1c:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140001f20:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140001f24:	49 89 d1             	mov    r9,rdx
   140001f27:	45 89 d0             	mov    r8d,r10d
   140001f2a:	48 89 ca             	mov    rdx,rcx
   140001f2d:	48 89 c1             	mov    rcx,rax
   140001f30:	48 8b 05 f1 83 00 00 	mov    rax,QWORD PTR [rip+0x83f1]        # 0x14000a328
   140001f37:	ff d0                	call   rax
   140001f39:	eb 01                	jmp    0x140001f3c
   140001f3b:	90                   	nop
   140001f3c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001f40:	8b 05 b2 71 00 00    	mov    eax,DWORD PTR [rip+0x71b2]        # 0x1400090f8
   140001f46:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   140001f49:	0f 8c 44 ff ff ff    	jl     0x140001e93
   140001f4f:	90                   	nop
   140001f50:	90                   	nop
   140001f51:	48 83 c4 30          	add    rsp,0x30
   140001f55:	5d                   	pop    rbp
   140001f56:	c3                   	ret
   140001f57:	55                   	push   rbp
   140001f58:	48 89 e5             	mov    rbp,rsp
   140001f5b:	48 83 ec 20          	sub    rsp,0x20
   140001f5f:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001f63:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140001f67:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001f6b:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
   140001f70:	74 25                	je     0x140001f97
   140001f72:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001f76:	48 89 c1             	mov    rcx,rax
   140001f79:	e8 22 fc ff ff       	call   0x140001ba0
   140001f7e:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   140001f82:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140001f86:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001f8a:	49 89 c8             	mov    r8,rcx
   140001f8d:	48 89 c1             	mov    rcx,rax
   140001f90:	e8 d3 13 00 00       	call   0x140003368
   140001f95:	eb 01                	jmp    0x140001f98
   140001f97:	90                   	nop
   140001f98:	48 83 c4 20          	add    rsp,0x20
   140001f9c:	5d                   	pop    rbp
   140001f9d:	c3                   	ret
   140001f9e:	55                   	push   rbp
   140001f9f:	48 89 e5             	mov    rbp,rsp
   140001fa2:	48 83 c4 80          	add    rsp,0xffffffffffffff80
   140001fa6:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001faa:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140001fae:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001fb2:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140001fb6:	48 2b 45 10          	sub    rax,QWORD PTR [rbp+0x10]
   140001fba:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140001fbe:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001fc2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001fc6:	48 83 7d e0 07       	cmp    QWORD PTR [rbp-0x20],0x7
   140001fcb:	0f 8e 50 03 00 00    	jle    0x140002321
   140001fd1:	48 83 7d e0 0b       	cmp    QWORD PTR [rbp-0x20],0xb
   140001fd6:	7e 25                	jle    0x140001ffd
   140001fd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001fdc:	8b 00                	mov    eax,DWORD PTR [rax]
   140001fde:	85 c0                	test   eax,eax
   140001fe0:	75 1b                	jne    0x140001ffd
   140001fe2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001fe6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140001fe9:	85 c0                	test   eax,eax
   140001feb:	75 10                	jne    0x140001ffd
   140001fed:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001ff1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140001ff4:	85 c0                	test   eax,eax
   140001ff6:	75 05                	jne    0x140001ffd
   140001ff8:	48 83 45 f8 0c       	add    QWORD PTR [rbp-0x8],0xc
   140001ffd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002001:	8b 00                	mov    eax,DWORD PTR [rax]
   140002003:	85 c0                	test   eax,eax
   140002005:	75 0b                	jne    0x140002012
   140002007:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000200b:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   14000200e:	85 c0                	test   eax,eax
   140002010:	74 59                	je     0x14000206b
   140002012:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002016:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   14000201a:	eb 40                	jmp    0x14000205c
   14000201c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002020:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140002023:	89 c2                	mov    edx,eax
   140002025:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002029:	48 01 d0             	add    rax,rdx
   14000202c:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002030:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002034:	8b 10                	mov    edx,DWORD PTR [rax]
   140002036:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   14000203a:	8b 00                	mov    eax,DWORD PTR [rax]
   14000203c:	01 d0                	add    eax,edx
   14000203e:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
   140002041:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002045:	48 8d 55 b4          	lea    rdx,[rbp-0x4c]
   140002049:	41 b8 04 00 00 00    	mov    r8d,0x4
   14000204f:	48 89 c1             	mov    rcx,rax
   140002052:	e8 00 ff ff ff       	call   0x140001f57
   140002057:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
   14000205c:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002060:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   140002064:	72 b6                	jb     0x14000201c
   140002066:	e9 b7 02 00 00       	jmp    0x140002322
   14000206b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000206f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002072:	83 f8 01             	cmp    eax,0x1
   140002075:	74 18                	je     0x14000208f
   140002077:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000207b:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000207e:	89 c2                	mov    edx,eax
   140002080:	48 8d 05 f9 31 00 00 	lea    rax,[rip+0x31f9]        # 0x140005280
   140002087:	48 89 c1             	mov    rcx,rax
   14000208a:	e8 a1 fa ff ff       	call   0x140001b30
   14000208f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002093:	48 83 c0 0c          	add    rax,0xc
   140002097:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000209b:	e9 71 02 00 00       	jmp    0x140002311
   1400020a0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400020a4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   1400020a7:	89 c2                	mov    edx,eax
   1400020a9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400020ad:	48 01 d0             	add    rax,rdx
   1400020b0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   1400020b4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400020b8:	8b 00                	mov    eax,DWORD PTR [rax]
   1400020ba:	89 c2                	mov    edx,eax
   1400020bc:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400020c0:	48 01 d0             	add    rax,rdx
   1400020c3:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   1400020c7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400020cb:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400020ce:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   1400020d2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400020d6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400020d9:	0f b6 c0             	movzx  eax,al
   1400020dc:	83 f8 40             	cmp    eax,0x40
   1400020df:	0f 84 b6 00 00 00    	je     0x14000219b
   1400020e5:	83 f8 40             	cmp    eax,0x40
   1400020e8:	0f 87 ba 00 00 00    	ja     0x1400021a8
   1400020ee:	83 f8 20             	cmp    eax,0x20
   1400020f1:	74 77                	je     0x14000216a
   1400020f3:	83 f8 20             	cmp    eax,0x20
   1400020f6:	0f 87 ac 00 00 00    	ja     0x1400021a8
   1400020fc:	83 f8 08             	cmp    eax,0x8
   1400020ff:	74 0a                	je     0x14000210b
   140002101:	83 f8 10             	cmp    eax,0x10
   140002104:	74 38                	je     0x14000213e
   140002106:	e9 9d 00 00 00       	jmp    0x1400021a8
   14000210b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000210f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140002112:	0f b6 c0             	movzx  eax,al
   140002115:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140002119:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000211d:	25 80 00 00 00       	and    eax,0x80
   140002122:	48 85 c0             	test   rax,rax
   140002125:	0f 84 a0 00 00 00    	je     0x1400021cb
   14000212b:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000212f:	48 0d 00 ff ff ff    	or     rax,0xffffffffffffff00
   140002135:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140002139:	e9 8d 00 00 00       	jmp    0x1400021cb
   14000213e:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002142:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140002145:	0f b7 c0             	movzx  eax,ax
   140002148:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000214c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140002150:	25 00 80 00 00       	and    eax,0x8000
   140002155:	48 85 c0             	test   rax,rax
   140002158:	74 74                	je     0x1400021ce
   14000215a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000215e:	48 0d 00 00 ff ff    	or     rax,0xffffffffffff0000
   140002164:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140002168:	eb 64                	jmp    0x1400021ce
   14000216a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000216e:	8b 00                	mov    eax,DWORD PTR [rax]
   140002170:	89 c0                	mov    eax,eax
   140002172:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140002176:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000217a:	25 00 00 00 80       	and    eax,0x80000000
   14000217f:	48 85 c0             	test   rax,rax
   140002182:	74 4d                	je     0x1400021d1
   140002184:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140002188:	48 ba 00 00 00 00 ff 	movabs rdx,0xffffffff00000000
   14000218f:	ff ff ff 
   140002192:	48 09 d0             	or     rax,rdx
   140002195:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140002199:	eb 36                	jmp    0x1400021d1
   14000219b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000219f:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400021a2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021a6:	eb 2a                	jmp    0x1400021d2
   1400021a8:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
   1400021af:	00 
   1400021b0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400021b4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400021b7:	0f b6 c0             	movzx  eax,al
   1400021ba:	89 c2                	mov    edx,eax
   1400021bc:	48 8d 05 f5 30 00 00 	lea    rax,[rip+0x30f5]        # 0x1400052b8
   1400021c3:	48 89 c1             	mov    rcx,rax
   1400021c6:	e8 65 f9 ff ff       	call   0x140001b30
   1400021cb:	90                   	nop
   1400021cc:	eb 04                	jmp    0x1400021d2
   1400021ce:	90                   	nop
   1400021cf:	eb 01                	jmp    0x1400021d2
   1400021d1:	90                   	nop
   1400021d2:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
   1400021d6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400021da:	8b 00                	mov    eax,DWORD PTR [rax]
   1400021dc:	89 c2                	mov    edx,eax
   1400021de:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400021e2:	48 01 c2             	add    rdx,rax
   1400021e5:	48 89 c8             	mov    rax,rcx
   1400021e8:	48 29 d0             	sub    rax,rdx
   1400021eb:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021ef:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
   1400021f3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400021f7:	48 01 d0             	add    rax,rdx
   1400021fa:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002202:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002205:	25 ff 00 00 00       	and    eax,0xff
   14000220a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   14000220d:	83 7d d4 3f          	cmp    DWORD PTR [rbp-0x2c],0x3f
   140002211:	77 70                	ja     0x140002283
   140002213:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140002216:	ba 01 00 00 00       	mov    edx,0x1
   14000221b:	89 c1                	mov    ecx,eax
   14000221d:	48 d3 e2             	shl    rdx,cl
   140002220:	48 89 d0             	mov    rax,rdx
   140002223:	48 83 e8 01          	sub    rax,0x1
   140002227:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14000222b:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   14000222e:	83 e8 01             	sub    eax,0x1
   140002231:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
   140002238:	89 c1                	mov    ecx,eax
   14000223a:	48 d3 e2             	shl    rdx,cl
   14000223d:	48 89 d0             	mov    rax,rdx
   140002240:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   140002244:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140002248:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
   14000224c:	7c 0a                	jl     0x140002258
   14000224e:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140002252:	48 39 45 c0          	cmp    QWORD PTR [rbp-0x40],rax
   140002256:	7e 2b                	jle    0x140002283
   140002258:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
   14000225c:	4c 8b 45 d8          	mov    r8,QWORD PTR [rbp-0x28]
   140002260:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
   140002264:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140002267:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   14000226c:	4d 89 c1             	mov    r9,r8
   14000226f:	49 89 c8             	mov    r8,rcx
   140002272:	89 c2                	mov    edx,eax
   140002274:	48 8d 05 6d 30 00 00 	lea    rax,[rip+0x306d]        # 0x1400052e8
   14000227b:	48 89 c1             	mov    rcx,rax
   14000227e:	e8 ad f8 ff ff       	call   0x140001b30
   140002283:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002287:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000228a:	0f b6 c0             	movzx  eax,al
   14000228d:	83 f8 40             	cmp    eax,0x40
   140002290:	74 63                	je     0x1400022f5
   140002292:	83 f8 40             	cmp    eax,0x40
   140002295:	77 75                	ja     0x14000230c
   140002297:	83 f8 20             	cmp    eax,0x20
   14000229a:	74 41                	je     0x1400022dd
   14000229c:	83 f8 20             	cmp    eax,0x20
   14000229f:	77 6b                	ja     0x14000230c
   1400022a1:	83 f8 08             	cmp    eax,0x8
   1400022a4:	74 07                	je     0x1400022ad
   1400022a6:	83 f8 10             	cmp    eax,0x10
   1400022a9:	74 1a                	je     0x1400022c5
   1400022ab:	eb 5f                	jmp    0x14000230c
   1400022ad:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400022b1:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   1400022b5:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400022bb:	48 89 c1             	mov    rcx,rax
   1400022be:	e8 94 fc ff ff       	call   0x140001f57
   1400022c3:	eb 47                	jmp    0x14000230c
   1400022c5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400022c9:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   1400022cd:	41 b8 02 00 00 00    	mov    r8d,0x2
   1400022d3:	48 89 c1             	mov    rcx,rax
   1400022d6:	e8 7c fc ff ff       	call   0x140001f57
   1400022db:	eb 2f                	jmp    0x14000230c
   1400022dd:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400022e1:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   1400022e5:	41 b8 04 00 00 00    	mov    r8d,0x4
   1400022eb:	48 89 c1             	mov    rcx,rax
   1400022ee:	e8 64 fc ff ff       	call   0x140001f57
   1400022f3:	eb 17                	jmp    0x14000230c
   1400022f5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400022f9:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   1400022fd:	41 b8 08 00 00 00    	mov    r8d,0x8
   140002303:	48 89 c1             	mov    rcx,rax
   140002306:	e8 4c fc ff ff       	call   0x140001f57
   14000230b:	90                   	nop
   14000230c:	48 83 45 f0 0c       	add    QWORD PTR [rbp-0x10],0xc
   140002311:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002315:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   140002319:	0f 82 81 fd ff ff    	jb     0x1400020a0
   14000231f:	eb 01                	jmp    0x140002322
   140002321:	90                   	nop
   140002322:	48 83 ec 80          	sub    rsp,0xffffffffffffff80
   140002326:	5d                   	pop    rbp
   140002327:	c3                   	ret
   140002328:	55                   	push   rbp
   140002329:	48 89 e5             	mov    rbp,rsp
   14000232c:	48 83 ec 30          	sub    rsp,0x30
   140002330:	8b 05 c6 6d 00 00    	mov    eax,DWORD PTR [rip+0x6dc6]        # 0x1400090fc
   140002336:	85 c0                	test   eax,eax
   140002338:	0f 85 88 00 00 00    	jne    0x1400023c6
   14000233e:	8b 05 b8 6d 00 00    	mov    eax,DWORD PTR [rip+0x6db8]        # 0x1400090fc
   140002344:	83 c0 01             	add    eax,0x1
   140002347:	89 05 af 6d 00 00    	mov    DWORD PTR [rip+0x6daf],eax        # 0x1400090fc
   14000234d:	e8 79 08 00 00       	call   0x140002bcb
   140002352:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140002355:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140002358:	48 63 d0             	movsxd rdx,eax
   14000235b:	48 89 d0             	mov    rax,rdx
   14000235e:	48 c1 e0 02          	shl    rax,0x2
   140002362:	48 01 d0             	add    rax,rdx
   140002365:	48 c1 e0 03          	shl    rax,0x3
   140002369:	48 83 c0 0f          	add    rax,0xf
   14000236d:	48 c1 e8 04          	shr    rax,0x4
   140002371:	48 c1 e0 04          	shl    rax,0x4
   140002375:	e8 d6 0a 00 00       	call   0x140002e50
   14000237a:	48 29 c4             	sub    rsp,rax
   14000237d:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   140002382:	48 83 c0 0f          	add    rax,0xf
   140002386:	48 c1 e8 04          	shr    rax,0x4
   14000238a:	48 c1 e0 04          	shl    rax,0x4
   14000238e:	48 89 05 5b 6d 00 00 	mov    QWORD PTR [rip+0x6d5b],rax        # 0x1400090f0
   140002395:	c7 05 59 6d 00 00 00 	mov    DWORD PTR [rip+0x6d59],0x0        # 0x1400090f8
   14000239c:	00 00 00 
   14000239f:	4c 8b 05 1a 30 00 00 	mov    r8,QWORD PTR [rip+0x301a]        # 0x1400053c0
   1400023a6:	48 8b 05 23 30 00 00 	mov    rax,QWORD PTR [rip+0x3023]        # 0x1400053d0
   1400023ad:	48 89 c2             	mov    rdx,rax
   1400023b0:	48 8b 05 29 30 00 00 	mov    rax,QWORD PTR [rip+0x3029]        # 0x1400053e0
   1400023b7:	48 89 c1             	mov    rcx,rax
   1400023ba:	e8 df fb ff ff       	call   0x140001f9e
   1400023bf:	e8 bb fa ff ff       	call   0x140001e7f
   1400023c4:	eb 01                	jmp    0x1400023c7
   1400023c6:	90                   	nop
   1400023c7:	48 89 ec             	mov    rsp,rbp
   1400023ca:	5d                   	pop    rbp
   1400023cb:	c3                   	ret
   1400023cc:	90                   	nop
   1400023cd:	90                   	nop
   1400023ce:	90                   	nop
   1400023cf:	90                   	nop
   1400023d0:	55                   	push   rbp
   1400023d1:	48 89 e5             	mov    rbp,rsp
   1400023d4:	48 83 ec 50          	sub    rsp,0x50
   1400023d8:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   1400023db:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   1400023df:	f2 0f 11 55 20       	movsd  QWORD PTR [rbp+0x20],xmm2
   1400023e4:	f2 0f 11 5d 28       	movsd  QWORD PTR [rbp+0x28],xmm3
   1400023e9:	48 8b 05 10 6d 00 00 	mov    rax,QWORD PTR [rip+0x6d10]        # 0x140009100
   1400023f0:	48 85 c0             	test   rax,rax
   1400023f3:	74 3e                	je     0x140002433
   1400023f5:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   1400023f8:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   1400023fb:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400023ff:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140002403:	f2 0f 10 45 20       	movsd  xmm0,QWORD PTR [rbp+0x20]
   140002408:	f2 0f 11 45 e0       	movsd  QWORD PTR [rbp-0x20],xmm0
   14000240d:	f2 0f 10 45 28       	movsd  xmm0,QWORD PTR [rbp+0x28]
   140002412:	f2 0f 11 45 e8       	movsd  QWORD PTR [rbp-0x18],xmm0
   140002417:	f2 0f 10 45 30       	movsd  xmm0,QWORD PTR [rbp+0x30]
   14000241c:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
   140002421:	48 8b 15 d8 6c 00 00 	mov    rdx,QWORD PTR [rip+0x6cd8]        # 0x140009100
   140002428:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   14000242c:	48 89 c1             	mov    rcx,rax
   14000242f:	ff d2                	call   rdx
   140002431:	eb 01                	jmp    0x140002434
   140002433:	90                   	nop
   140002434:	48 83 c4 50          	add    rsp,0x50
   140002438:	5d                   	pop    rbp
   140002439:	c3                   	ret
   14000243a:	55                   	push   rbp
   14000243b:	48 89 e5             	mov    rbp,rsp
   14000243e:	48 83 ec 20          	sub    rsp,0x20
   140002442:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002446:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000244a:	48 89 05 af 6c 00 00 	mov    QWORD PTR [rip+0x6caf],rax        # 0x140009100
   140002451:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002455:	48 89 c1             	mov    rcx,rax
   140002458:	e8 13 0f 00 00       	call   0x140003370
   14000245d:	90                   	nop
   14000245e:	48 83 c4 20          	add    rsp,0x20
   140002462:	5d                   	pop    rbp
   140002463:	c3                   	ret
   140002464:	90                   	nop
   140002465:	90                   	nop
   140002466:	90                   	nop
   140002467:	90                   	nop
   140002468:	90                   	nop
   140002469:	90                   	nop
   14000246a:	90                   	nop
   14000246b:	90                   	nop
   14000246c:	90                   	nop
   14000246d:	90                   	nop
   14000246e:	90                   	nop
   14000246f:	90                   	nop
   140002470:	55                   	push   rbp
   140002471:	48 89 e5             	mov    rbp,rsp
   140002474:	48 83 ec 30          	sub    rsp,0x30
   140002478:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000247c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140002483:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   14000248a:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000248e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002491:	8b 00                	mov    eax,DWORD PTR [rax]
   140002493:	25 ff ff ff 20       	and    eax,0x20ffffff
   140002498:	3d 43 43 47 20       	cmp    eax,0x20474343
   14000249d:	75 1b                	jne    0x1400024ba
   14000249f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400024a3:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400024a6:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   1400024a9:	83 e0 01             	and    eax,0x1
   1400024ac:	85 c0                	test   eax,eax
   1400024ae:	75 0a                	jne    0x1400024ba
   1400024b0:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400024b5:	e9 d3 01 00 00       	jmp    0x14000268d
   1400024ba:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400024be:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400024c1:	8b 00                	mov    eax,DWORD PTR [rax]
   1400024c3:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   1400024c8:	0f 87 8d 01 00 00    	ja     0x14000265b
   1400024ce:	3d 8c 00 00 c0       	cmp    eax,0xc000008c
   1400024d3:	73 43                	jae    0x140002518
   1400024d5:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   1400024da:	0f 84 bf 00 00 00    	je     0x14000259f
   1400024e0:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   1400024e5:	0f 87 70 01 00 00    	ja     0x14000265b
   1400024eb:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   1400024f0:	0f 84 5c 01 00 00    	je     0x140002652
   1400024f6:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   1400024fb:	0f 87 5a 01 00 00    	ja     0x14000265b
   140002501:	3d 02 00 00 80       	cmp    eax,0x80000002
   140002506:	0f 84 46 01 00 00    	je     0x140002652
   14000250c:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   140002511:	74 35                	je     0x140002548
   140002513:	e9 43 01 00 00       	jmp    0x14000265b
   140002518:	05 74 ff ff 3f       	add    eax,0x3fffff74
   14000251d:	83 f8 0a             	cmp    eax,0xa
   140002520:	0f 87 35 01 00 00    	ja     0x14000265b
   140002526:	89 c0                	mov    eax,eax
   140002528:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   14000252f:	00 
   140002530:	48 8d 05 09 2e 00 00 	lea    rax,[rip+0x2e09]        # 0x140005340
   140002537:	8b 04 02             	mov    eax,DWORD PTR [rdx+rax*1]
   14000253a:	48 98                	cdqe
   14000253c:	48 8d 15 fd 2d 00 00 	lea    rdx,[rip+0x2dfd]        # 0x140005340
   140002543:	48 01 d0             	add    rax,rdx
   140002546:	ff e0                	jmp    rax
   140002548:	ba 00 00 00 00       	mov    edx,0x0
   14000254d:	b9 0b 00 00 00       	mov    ecx,0xb
   140002552:	e8 f9 0d 00 00       	call   0x140003350
   140002557:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000255b:	48 83 7d f0 01       	cmp    QWORD PTR [rbp-0x10],0x1
   140002560:	75 1b                	jne    0x14000257d
   140002562:	ba 01 00 00 00       	mov    edx,0x1
   140002567:	b9 0b 00 00 00       	mov    ecx,0xb
   14000256c:	e8 df 0d 00 00       	call   0x140003350
   140002571:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002578:	e9 e1 00 00 00       	jmp    0x14000265e
   14000257d:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140002582:	0f 84 d6 00 00 00    	je     0x14000265e
   140002588:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000258c:	b9 0b 00 00 00       	mov    ecx,0xb
   140002591:	ff d0                	call   rax
   140002593:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   14000259a:	e9 bf 00 00 00       	jmp    0x14000265e
   14000259f:	ba 00 00 00 00       	mov    edx,0x0
   1400025a4:	b9 04 00 00 00       	mov    ecx,0x4
   1400025a9:	e8 a2 0d 00 00       	call   0x140003350
   1400025ae:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400025b2:	48 83 7d f0 01       	cmp    QWORD PTR [rbp-0x10],0x1
   1400025b7:	75 1b                	jne    0x1400025d4
   1400025b9:	ba 01 00 00 00       	mov    edx,0x1
   1400025be:	b9 04 00 00 00       	mov    ecx,0x4
   1400025c3:	e8 88 0d 00 00       	call   0x140003350
   1400025c8:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   1400025cf:	e9 8d 00 00 00       	jmp    0x140002661
   1400025d4:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400025d9:	0f 84 82 00 00 00    	je     0x140002661
   1400025df:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400025e3:	b9 04 00 00 00       	mov    ecx,0x4
   1400025e8:	ff d0                	call   rax
   1400025ea:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   1400025f1:	eb 6e                	jmp    0x140002661
   1400025f3:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
   1400025fa:	ba 00 00 00 00       	mov    edx,0x0
   1400025ff:	b9 08 00 00 00       	mov    ecx,0x8
   140002604:	e8 47 0d 00 00       	call   0x140003350
   140002609:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000260d:	48 83 7d f0 01       	cmp    QWORD PTR [rbp-0x10],0x1
   140002612:	75 23                	jne    0x140002637
   140002614:	ba 01 00 00 00       	mov    edx,0x1
   140002619:	b9 08 00 00 00       	mov    ecx,0x8
   14000261e:	e8 2d 0d 00 00       	call   0x140003350
   140002623:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   140002627:	74 05                	je     0x14000262e
   140002629:	e8 f2 f4 ff ff       	call   0x140001b20
   14000262e:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002635:	eb 2d                	jmp    0x140002664
   140002637:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   14000263c:	74 26                	je     0x140002664
   14000263e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002642:	b9 08 00 00 00       	mov    ecx,0x8
   140002647:	ff d0                	call   rax
   140002649:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002650:	eb 12                	jmp    0x140002664
   140002652:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002659:	eb 0a                	jmp    0x140002665
   14000265b:	90                   	nop
   14000265c:	eb 07                	jmp    0x140002665
   14000265e:	90                   	nop
   14000265f:	eb 04                	jmp    0x140002665
   140002661:	90                   	nop
   140002662:	eb 01                	jmp    0x140002665
   140002664:	90                   	nop
   140002665:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140002669:	75 1f                	jne    0x14000268a
   14000266b:	48 8b 05 ae 6a 00 00 	mov    rax,QWORD PTR [rip+0x6aae]        # 0x140009120
   140002672:	48 85 c0             	test   rax,rax
   140002675:	74 13                	je     0x14000268a
   140002677:	48 8b 15 a2 6a 00 00 	mov    rdx,QWORD PTR [rip+0x6aa2]        # 0x140009120
   14000267e:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002682:	48 89 c1             	mov    rcx,rax
   140002685:	ff d2                	call   rdx
   140002687:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000268a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000268d:	48 83 c4 30          	add    rsp,0x30
   140002691:	5d                   	pop    rbp
   140002692:	c3                   	ret
   140002693:	90                   	nop
   140002694:	90                   	nop
   140002695:	90                   	nop
   140002696:	90                   	nop
   140002697:	90                   	nop
   140002698:	90                   	nop
   140002699:	90                   	nop
   14000269a:	90                   	nop
   14000269b:	90                   	nop
   14000269c:	90                   	nop
   14000269d:	90                   	nop
   14000269e:	90                   	nop
   14000269f:	90                   	nop
   1400026a0:	55                   	push   rbp
   1400026a1:	48 89 e5             	mov    rbp,rsp
   1400026a4:	48 83 ec 30          	sub    rsp,0x30
   1400026a8:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   1400026ab:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   1400026af:	8b 05 b3 6a 00 00    	mov    eax,DWORD PTR [rip+0x6ab3]        # 0x140009168
   1400026b5:	85 c0                	test   eax,eax
   1400026b7:	75 07                	jne    0x1400026c0
   1400026b9:	b8 00 00 00 00       	mov    eax,0x0
   1400026be:	eb 7b                	jmp    0x14000273b
   1400026c0:	ba 18 00 00 00       	mov    edx,0x18
   1400026c5:	b9 01 00 00 00       	mov    ecx,0x1
   1400026ca:	e8 b9 0c 00 00       	call   0x140003388
   1400026cf:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400026d3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   1400026d8:	75 07                	jne    0x1400026e1
   1400026da:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400026df:	eb 5a                	jmp    0x14000273b
   1400026e1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400026e5:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   1400026e8:	89 10                	mov    DWORD PTR [rax],edx
   1400026ea:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400026ee:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400026f2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   1400026f6:	48 8d 05 43 6a 00 00 	lea    rax,[rip+0x6a43]        # 0x140009140
   1400026fd:	48 89 c1             	mov    rcx,rax
   140002700:	48 8b 05 c9 7b 00 00 	mov    rax,QWORD PTR [rip+0x7bc9]        # 0x14000a2d0
   140002707:	ff d0                	call   rax
   140002709:	48 8b 15 60 6a 00 00 	mov    rdx,QWORD PTR [rip+0x6a60]        # 0x140009170
   140002710:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002714:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   140002718:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000271c:	48 89 05 4d 6a 00 00 	mov    QWORD PTR [rip+0x6a4d],rax        # 0x140009170
   140002723:	48 8d 05 16 6a 00 00 	lea    rax,[rip+0x6a16]        # 0x140009140
   14000272a:	48 89 c1             	mov    rcx,rax
   14000272d:	48 8b 05 cc 7b 00 00 	mov    rax,QWORD PTR [rip+0x7bcc]        # 0x14000a300
   140002734:	ff d0                	call   rax
   140002736:	b8 00 00 00 00       	mov    eax,0x0
   14000273b:	48 83 c4 30          	add    rsp,0x30
   14000273f:	5d                   	pop    rbp
   140002740:	c3                   	ret
   140002741:	55                   	push   rbp
   140002742:	48 89 e5             	mov    rbp,rsp
   140002745:	48 83 ec 30          	sub    rsp,0x30
   140002749:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000274c:	8b 05 16 6a 00 00    	mov    eax,DWORD PTR [rip+0x6a16]        # 0x140009168
   140002752:	85 c0                	test   eax,eax
   140002754:	75 0a                	jne    0x140002760
   140002756:	b8 00 00 00 00       	mov    eax,0x0
   14000275b:	e9 9c 00 00 00       	jmp    0x1400027fc
   140002760:	48 8d 05 d9 69 00 00 	lea    rax,[rip+0x69d9]        # 0x140009140
   140002767:	48 89 c1             	mov    rcx,rax
   14000276a:	48 8b 05 5f 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b5f]        # 0x14000a2d0
   140002771:	ff d0                	call   rax
   140002773:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
   14000277a:	00 
   14000277b:	48 8b 05 ee 69 00 00 	mov    rax,QWORD PTR [rip+0x69ee]        # 0x140009170
   140002782:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002786:	eb 55                	jmp    0x1400027dd
   140002788:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000278c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000278e:	39 45 10             	cmp    DWORD PTR [rbp+0x10],eax
   140002791:	75 36                	jne    0x1400027c9
   140002793:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002798:	75 11                	jne    0x1400027ab
   14000279a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000279e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   1400027a2:	48 89 05 c7 69 00 00 	mov    QWORD PTR [rip+0x69c7],rax        # 0x140009170
   1400027a9:	eb 10                	jmp    0x1400027bb
   1400027ab:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400027af:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   1400027b3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400027b7:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   1400027bb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400027bf:	48 89 c1             	mov    rcx,rax
   1400027c2:	e8 c9 0b 00 00       	call   0x140003390
   1400027c7:	eb 1b                	jmp    0x1400027e4
   1400027c9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400027cd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400027d1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400027d5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   1400027d9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400027dd:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400027e2:	75 a4                	jne    0x140002788
   1400027e4:	48 8d 05 55 69 00 00 	lea    rax,[rip+0x6955]        # 0x140009140
   1400027eb:	48 89 c1             	mov    rcx,rax
   1400027ee:	48 8b 05 0b 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b0b]        # 0x14000a300
   1400027f5:	ff d0                	call   rax
   1400027f7:	b8 00 00 00 00       	mov    eax,0x0
   1400027fc:	48 83 c4 30          	add    rsp,0x30
   140002800:	5d                   	pop    rbp
   140002801:	c3                   	ret
   140002802:	55                   	push   rbp
   140002803:	48 89 e5             	mov    rbp,rsp
   140002806:	48 83 ec 30          	sub    rsp,0x30
   14000280a:	8b 05 58 69 00 00    	mov    eax,DWORD PTR [rip+0x6958]        # 0x140009168
   140002810:	85 c0                	test   eax,eax
   140002812:	0f 84 82 00 00 00    	je     0x14000289a
   140002818:	48 8d 05 21 69 00 00 	lea    rax,[rip+0x6921]        # 0x140009140
   14000281f:	48 89 c1             	mov    rcx,rax
   140002822:	48 8b 05 a7 7a 00 00 	mov    rax,QWORD PTR [rip+0x7aa7]        # 0x14000a2d0
   140002829:	ff d0                	call   rax
   14000282b:	48 8b 05 3e 69 00 00 	mov    rax,QWORD PTR [rip+0x693e]        # 0x140009170
   140002832:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002836:	eb 46                	jmp    0x14000287e
   140002838:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000283c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000283e:	89 c1                	mov    ecx,eax
   140002840:	48 8b 05 d9 7a 00 00 	mov    rax,QWORD PTR [rip+0x7ad9]        # 0x14000a320
   140002847:	ff d0                	call   rax
   140002849:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000284d:	48 8b 05 8c 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a8c]        # 0x14000a2e0
   140002854:	ff d0                	call   rax
   140002856:	85 c0                	test   eax,eax
   140002858:	75 18                	jne    0x140002872
   14000285a:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   14000285f:	74 11                	je     0x140002872
   140002861:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002865:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   140002869:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000286d:	48 89 c1             	mov    rcx,rax
   140002870:	ff d2                	call   rdx
   140002872:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002876:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   14000287a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000287e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002883:	75 b3                	jne    0x140002838
   140002885:	48 8d 05 b4 68 00 00 	lea    rax,[rip+0x68b4]        # 0x140009140
   14000288c:	48 89 c1             	mov    rcx,rax
   14000288f:	48 8b 05 6a 7a 00 00 	mov    rax,QWORD PTR [rip+0x7a6a]        # 0x14000a300
   140002896:	ff d0                	call   rax
   140002898:	eb 01                	jmp    0x14000289b
   14000289a:	90                   	nop
   14000289b:	48 83 c4 30          	add    rsp,0x30
   14000289f:	5d                   	pop    rbp
   1400028a0:	c3                   	ret
   1400028a1:	55                   	push   rbp
   1400028a2:	48 89 e5             	mov    rbp,rsp
   1400028a5:	48 83 ec 30          	sub    rsp,0x30
   1400028a9:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400028ad:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400028b0:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   1400028b4:	83 7d 18 03          	cmp    DWORD PTR [rbp+0x18],0x3
   1400028b8:	0f 84 cc 00 00 00    	je     0x14000298a
   1400028be:	83 7d 18 03          	cmp    DWORD PTR [rbp+0x18],0x3
   1400028c2:	0f 87 ca 00 00 00    	ja     0x140002992
   1400028c8:	83 7d 18 02          	cmp    DWORD PTR [rbp+0x18],0x2
   1400028cc:	0f 84 b1 00 00 00    	je     0x140002983
   1400028d2:	83 7d 18 02          	cmp    DWORD PTR [rbp+0x18],0x2
   1400028d6:	0f 87 b6 00 00 00    	ja     0x140002992
   1400028dc:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   1400028e0:	74 33                	je     0x140002915
   1400028e2:	83 7d 18 01          	cmp    DWORD PTR [rbp+0x18],0x1
   1400028e6:	0f 85 a6 00 00 00    	jne    0x140002992
   1400028ec:	8b 05 76 68 00 00    	mov    eax,DWORD PTR [rip+0x6876]        # 0x140009168
   1400028f2:	85 c0                	test   eax,eax
   1400028f4:	75 13                	jne    0x140002909
   1400028f6:	48 8d 05 43 68 00 00 	lea    rax,[rip+0x6843]        # 0x140009140
   1400028fd:	48 89 c1             	mov    rcx,rax
   140002900:	48 8b 05 f1 79 00 00 	mov    rax,QWORD PTR [rip+0x79f1]        # 0x14000a2f8
   140002907:	ff d0                	call   rax
   140002909:	c7 05 55 68 00 00 01 	mov    DWORD PTR [rip+0x6855],0x1        # 0x140009168
   140002910:	00 00 00 
   140002913:	eb 7d                	jmp    0x140002992
   140002915:	e8 e8 fe ff ff       	call   0x140002802
   14000291a:	8b 05 48 68 00 00    	mov    eax,DWORD PTR [rip+0x6848]        # 0x140009168
   140002920:	83 f8 01             	cmp    eax,0x1
   140002923:	75 6c                	jne    0x140002991
   140002925:	48 8b 05 44 68 00 00 	mov    rax,QWORD PTR [rip+0x6844]        # 0x140009170
   14000292c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002930:	eb 20                	jmp    0x140002952
   140002932:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002936:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   14000293a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000293e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002942:	48 89 c1             	mov    rcx,rax
   140002945:	e8 46 0a 00 00       	call   0x140003390
   14000294a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000294e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002952:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002957:	75 d9                	jne    0x140002932
   140002959:	48 c7 05 0c 68 00 00 	mov    QWORD PTR [rip+0x680c],0x0        # 0x140009170
   140002960:	00 00 00 00 
   140002964:	c7 05 fa 67 00 00 00 	mov    DWORD PTR [rip+0x67fa],0x0        # 0x140009168
   14000296b:	00 00 00 
   14000296e:	48 8d 05 cb 67 00 00 	lea    rax,[rip+0x67cb]        # 0x140009140
   140002975:	48 89 c1             	mov    rcx,rax
   140002978:	48 8b 05 49 79 00 00 	mov    rax,QWORD PTR [rip+0x7949]        # 0x14000a2c8
   14000297f:	ff d0                	call   rax
   140002981:	eb 0e                	jmp    0x140002991
   140002983:	e8 98 f1 ff ff       	call   0x140001b20
   140002988:	eb 08                	jmp    0x140002992
   14000298a:	e8 73 fe ff ff       	call   0x140002802
   14000298f:	eb 01                	jmp    0x140002992
   140002991:	90                   	nop
   140002992:	b8 01 00 00 00       	mov    eax,0x1
   140002997:	48 83 c4 30          	add    rsp,0x30
   14000299b:	5d                   	pop    rbp
   14000299c:	c3                   	ret
   14000299d:	90                   	nop
   14000299e:	90                   	nop
   14000299f:	90                   	nop
   1400029a0:	55                   	push   rbp
   1400029a1:	48 89 e5             	mov    rbp,rsp
   1400029a4:	48 83 ec 20          	sub    rsp,0x20
   1400029a8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400029ac:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400029b0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400029b4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400029b8:	0f b7 00             	movzx  eax,WORD PTR [rax]
   1400029bb:	66 3d 4d 5a          	cmp    ax,0x5a4d
   1400029bf:	74 07                	je     0x1400029c8
   1400029c1:	b8 00 00 00 00       	mov    eax,0x0
   1400029c6:	eb 4e                	jmp    0x140002a16
   1400029c8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400029cc:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   1400029cf:	48 63 d0             	movsxd rdx,eax
   1400029d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400029d6:	48 01 d0             	add    rax,rdx
   1400029d9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400029dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400029e1:	8b 00                	mov    eax,DWORD PTR [rax]
   1400029e3:	3d 50 45 00 00       	cmp    eax,0x4550
   1400029e8:	74 07                	je     0x1400029f1
   1400029ea:	b8 00 00 00 00       	mov    eax,0x0
   1400029ef:	eb 25                	jmp    0x140002a16
   1400029f1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400029f5:	48 83 c0 18          	add    rax,0x18
   1400029f9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400029fd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002a01:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140002a04:	66 3d 0b 02          	cmp    ax,0x20b
   140002a08:	74 07                	je     0x140002a11
   140002a0a:	b8 00 00 00 00       	mov    eax,0x0
   140002a0f:	eb 05                	jmp    0x140002a16
   140002a11:	b8 01 00 00 00       	mov    eax,0x1
   140002a16:	48 83 c4 20          	add    rsp,0x20
   140002a1a:	5d                   	pop    rbp
   140002a1b:	c3                   	ret
   140002a1c:	55                   	push   rbp
   140002a1d:	48 89 e5             	mov    rbp,rsp
   140002a20:	48 83 ec 20          	sub    rsp,0x20
   140002a24:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002a28:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140002a2c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002a30:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002a33:	48 63 d0             	movsxd rdx,eax
   140002a36:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002a3a:	48 01 d0             	add    rax,rdx
   140002a3d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002a41:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140002a48:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002a4c:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
   140002a50:	0f b7 d0             	movzx  edx,ax
   140002a53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002a57:	48 01 d0             	add    rax,rdx
   140002a5a:	48 83 c0 18          	add    rax,0x18
   140002a5e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002a62:	eb 36                	jmp    0x140002a9a
   140002a64:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002a68:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140002a6b:	89 c0                	mov    eax,eax
   140002a6d:	48 39 45 18          	cmp    QWORD PTR [rbp+0x18],rax
   140002a71:	72 1e                	jb     0x140002a91
   140002a73:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002a77:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140002a7a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002a7e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002a81:	01 d0                	add    eax,edx
   140002a83:	89 c0                	mov    eax,eax
   140002a85:	48 39 45 18          	cmp    QWORD PTR [rbp+0x18],rax
   140002a89:	73 06                	jae    0x140002a91
   140002a8b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002a8f:	eb 1e                	jmp    0x140002aaf
   140002a91:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140002a95:	48 83 45 f8 28       	add    QWORD PTR [rbp-0x8],0x28
   140002a9a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002a9e:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002aa2:	0f b7 c0             	movzx  eax,ax
   140002aa5:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140002aa8:	72 ba                	jb     0x140002a64
   140002aaa:	b8 00 00 00 00       	mov    eax,0x0
   140002aaf:	48 83 c4 20          	add    rsp,0x20
   140002ab3:	5d                   	pop    rbp
   140002ab4:	c3                   	ret
   140002ab5:	55                   	push   rbp
   140002ab6:	48 89 e5             	mov    rbp,rsp
   140002ab9:	48 83 ec 40          	sub    rsp,0x40
   140002abd:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002ac1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002ac5:	48 89 c1             	mov    rcx,rax
   140002ac8:	e8 ab 07 00 00       	call   0x140003278
   140002acd:	48 83 f8 08          	cmp    rax,0x8
   140002ad1:	76 0a                	jbe    0x140002add
   140002ad3:	b8 00 00 00 00       	mov    eax,0x0
   140002ad8:	e9 98 00 00 00       	jmp    0x140002b75
   140002add:	48 8b 05 dc 28 00 00 	mov    rax,QWORD PTR [rip+0x28dc]        # 0x1400053c0
   140002ae4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002ae8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002aec:	48 89 c1             	mov    rcx,rax
   140002aef:	e8 ac fe ff ff       	call   0x1400029a0
   140002af4:	85 c0                	test   eax,eax
   140002af6:	75 07                	jne    0x140002aff
   140002af8:	b8 00 00 00 00       	mov    eax,0x0
   140002afd:	eb 76                	jmp    0x140002b75
   140002aff:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002b03:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002b06:	48 63 d0             	movsxd rdx,eax
   140002b09:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002b0d:	48 01 d0             	add    rax,rdx
   140002b10:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002b14:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140002b1b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002b1f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
   140002b23:	0f b7 d0             	movzx  edx,ax
   140002b26:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002b2a:	48 01 d0             	add    rax,rdx
   140002b2d:	48 83 c0 18          	add    rax,0x18
   140002b31:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002b35:	eb 29                	jmp    0x140002b60
   140002b37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b3b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140002b3f:	41 b8 08 00 00 00    	mov    r8d,0x8
   140002b45:	48 89 c1             	mov    rcx,rax
   140002b48:	e8 33 07 00 00       	call   0x140003280
   140002b4d:	85 c0                	test   eax,eax
   140002b4f:	75 06                	jne    0x140002b57
   140002b51:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b55:	eb 1e                	jmp    0x140002b75
   140002b57:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140002b5b:	48 83 45 f8 28       	add    QWORD PTR [rbp-0x8],0x28
   140002b60:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002b64:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002b68:	0f b7 c0             	movzx  eax,ax
   140002b6b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140002b6e:	72 c7                	jb     0x140002b37
   140002b70:	b8 00 00 00 00       	mov    eax,0x0
   140002b75:	48 83 c4 40          	add    rsp,0x40
   140002b79:	5d                   	pop    rbp
   140002b7a:	c3                   	ret
   140002b7b:	55                   	push   rbp
   140002b7c:	48 89 e5             	mov    rbp,rsp
   140002b7f:	48 83 ec 30          	sub    rsp,0x30
   140002b83:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002b87:	48 8b 05 32 28 00 00 	mov    rax,QWORD PTR [rip+0x2832]        # 0x1400053c0
   140002b8e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002b92:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b96:	48 89 c1             	mov    rcx,rax
   140002b99:	e8 02 fe ff ff       	call   0x1400029a0
   140002b9e:	85 c0                	test   eax,eax
   140002ba0:	75 07                	jne    0x140002ba9
   140002ba2:	b8 00 00 00 00       	mov    eax,0x0
   140002ba7:	eb 1c                	jmp    0x140002bc5
   140002ba9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002bad:	48 2b 45 f8          	sub    rax,QWORD PTR [rbp-0x8]
   140002bb1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002bb5:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140002bb9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002bbd:	48 89 c1             	mov    rcx,rax
   140002bc0:	e8 57 fe ff ff       	call   0x140002a1c
   140002bc5:	48 83 c4 30          	add    rsp,0x30
   140002bc9:	5d                   	pop    rbp
   140002bca:	c3                   	ret
   140002bcb:	55                   	push   rbp
   140002bcc:	48 89 e5             	mov    rbp,rsp
   140002bcf:	48 83 ec 30          	sub    rsp,0x30
   140002bd3:	48 8b 05 e6 27 00 00 	mov    rax,QWORD PTR [rip+0x27e6]        # 0x1400053c0
   140002bda:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002bde:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002be2:	48 89 c1             	mov    rcx,rax
   140002be5:	e8 b6 fd ff ff       	call   0x1400029a0
   140002bea:	85 c0                	test   eax,eax
   140002bec:	75 07                	jne    0x140002bf5
   140002bee:	b8 00 00 00 00       	mov    eax,0x0
   140002bf3:	eb 20                	jmp    0x140002c15
   140002bf5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002bf9:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002bfc:	48 63 d0             	movsxd rdx,eax
   140002bff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002c03:	48 01 d0             	add    rax,rdx
   140002c06:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002c0a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002c0e:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002c12:	0f b7 c0             	movzx  eax,ax
   140002c15:	48 83 c4 30          	add    rsp,0x30
   140002c19:	5d                   	pop    rbp
   140002c1a:	c3                   	ret
   140002c1b:	55                   	push   rbp
   140002c1c:	48 89 e5             	mov    rbp,rsp
   140002c1f:	48 83 ec 40          	sub    rsp,0x40
   140002c23:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002c27:	48 8b 05 92 27 00 00 	mov    rax,QWORD PTR [rip+0x2792]        # 0x1400053c0
   140002c2e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002c32:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002c36:	48 89 c1             	mov    rcx,rax
   140002c39:	e8 62 fd ff ff       	call   0x1400029a0
   140002c3e:	85 c0                	test   eax,eax
   140002c40:	75 07                	jne    0x140002c49
   140002c42:	b8 00 00 00 00       	mov    eax,0x0
   140002c47:	eb 78                	jmp    0x140002cc1
   140002c49:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002c4d:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002c50:	48 63 d0             	movsxd rdx,eax
   140002c53:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002c57:	48 01 d0             	add    rax,rdx
   140002c5a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002c5e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140002c65:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002c69:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
   140002c6d:	0f b7 d0             	movzx  edx,ax
   140002c70:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002c74:	48 01 d0             	add    rax,rdx
   140002c77:	48 83 c0 18          	add    rax,0x18
   140002c7b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002c7f:	eb 2b                	jmp    0x140002cac
   140002c81:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002c85:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   140002c88:	25 00 00 00 20       	and    eax,0x20000000
   140002c8d:	85 c0                	test   eax,eax
   140002c8f:	74 12                	je     0x140002ca3
   140002c91:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   140002c96:	75 06                	jne    0x140002c9e
   140002c98:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002c9c:	eb 23                	jmp    0x140002cc1
   140002c9e:	48 83 6d 10 01       	sub    QWORD PTR [rbp+0x10],0x1
   140002ca3:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140002ca7:	48 83 45 f8 28       	add    QWORD PTR [rbp-0x8],0x28
   140002cac:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002cb0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002cb4:	0f b7 c0             	movzx  eax,ax
   140002cb7:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140002cba:	72 c5                	jb     0x140002c81
   140002cbc:	b8 00 00 00 00       	mov    eax,0x0
   140002cc1:	48 83 c4 40          	add    rsp,0x40
   140002cc5:	5d                   	pop    rbp
   140002cc6:	c3                   	ret
   140002cc7:	55                   	push   rbp
   140002cc8:	48 89 e5             	mov    rbp,rsp
   140002ccb:	48 83 ec 30          	sub    rsp,0x30
   140002ccf:	48 8b 05 ea 26 00 00 	mov    rax,QWORD PTR [rip+0x26ea]        # 0x1400053c0
   140002cd6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002cda:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002cde:	48 89 c1             	mov    rcx,rax
   140002ce1:	e8 ba fc ff ff       	call   0x1400029a0
   140002ce6:	85 c0                	test   eax,eax
   140002ce8:	75 07                	jne    0x140002cf1
   140002cea:	b8 00 00 00 00       	mov    eax,0x0
   140002cef:	eb 04                	jmp    0x140002cf5
   140002cf1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002cf5:	48 83 c4 30          	add    rsp,0x30
   140002cf9:	5d                   	pop    rbp
   140002cfa:	c3                   	ret
   140002cfb:	55                   	push   rbp
   140002cfc:	48 89 e5             	mov    rbp,rsp
   140002cff:	48 83 ec 40          	sub    rsp,0x40
   140002d03:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002d07:	48 8b 05 b2 26 00 00 	mov    rax,QWORD PTR [rip+0x26b2]        # 0x1400053c0
   140002d0e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002d12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002d16:	48 89 c1             	mov    rcx,rax
   140002d19:	e8 82 fc ff ff       	call   0x1400029a0
   140002d1e:	85 c0                	test   eax,eax
   140002d20:	75 07                	jne    0x140002d29
   140002d22:	b8 00 00 00 00       	mov    eax,0x0
   140002d27:	eb 3d                	jmp    0x140002d66
   140002d29:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002d2d:	48 2b 45 f8          	sub    rax,QWORD PTR [rbp-0x8]
   140002d31:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002d35:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140002d39:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002d3d:	48 89 c1             	mov    rcx,rax
   140002d40:	e8 d7 fc ff ff       	call   0x140002a1c
   140002d45:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002d49:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
   140002d4e:	75 07                	jne    0x140002d57
   140002d50:	b8 00 00 00 00       	mov    eax,0x0
   140002d55:	eb 0f                	jmp    0x140002d66
   140002d57:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002d5b:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   140002d5e:	f7 d0                	not    eax
   140002d60:	c1 e8 1f             	shr    eax,0x1f
   140002d63:	0f b6 c0             	movzx  eax,al
   140002d66:	48 83 c4 40          	add    rsp,0x40
   140002d6a:	5d                   	pop    rbp
   140002d6b:	c3                   	ret
   140002d6c:	55                   	push   rbp
   140002d6d:	48 89 e5             	mov    rbp,rsp
   140002d70:	48 83 ec 50          	sub    rsp,0x50
   140002d74:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140002d77:	48 8b 05 42 26 00 00 	mov    rax,QWORD PTR [rip+0x2642]        # 0x1400053c0
   140002d7e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002d82:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002d86:	48 89 c1             	mov    rcx,rax
   140002d89:	e8 12 fc ff ff       	call   0x1400029a0
   140002d8e:	85 c0                	test   eax,eax
   140002d90:	75 0a                	jne    0x140002d9c
   140002d92:	b8 00 00 00 00       	mov    eax,0x0
   140002d97:	e9 ab 00 00 00       	jmp    0x140002e47
   140002d9c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002da0:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002da3:	48 63 d0             	movsxd rdx,eax
   140002da6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002daa:	48 01 d0             	add    rax,rdx
   140002dad:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002db1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002db5:	8b 80 90 00 00 00    	mov    eax,DWORD PTR [rax+0x90]
   140002dbb:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140002dbe:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   140002dc2:	75 07                	jne    0x140002dcb
   140002dc4:	b8 00 00 00 00       	mov    eax,0x0
   140002dc9:	eb 7c                	jmp    0x140002e47
   140002dcb:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
   140002dce:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002dd2:	48 89 c1             	mov    rcx,rax
   140002dd5:	e8 42 fc ff ff       	call   0x140002a1c
   140002dda:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140002dde:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
   140002de3:	75 07                	jne    0x140002dec
   140002de5:	b8 00 00 00 00       	mov    eax,0x0
   140002dea:	eb 5b                	jmp    0x140002e47
   140002dec:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
   140002def:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002df3:	48 01 d0             	add    rax,rdx
   140002df6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002dfa:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002dff:	75 07                	jne    0x140002e08
   140002e01:	b8 00 00 00 00       	mov    eax,0x0
   140002e06:	eb 3f                	jmp    0x140002e47
   140002e08:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002e0c:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140002e0f:	85 c0                	test   eax,eax
   140002e11:	75 0b                	jne    0x140002e1e
   140002e13:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002e17:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140002e1a:	85 c0                	test   eax,eax
   140002e1c:	74 23                	je     0x140002e41
   140002e1e:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
   140002e22:	7f 12                	jg     0x140002e36
   140002e24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002e28:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140002e2b:	89 c2                	mov    edx,eax
   140002e2d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002e31:	48 01 d0             	add    rax,rdx
   140002e34:	eb 11                	jmp    0x140002e47
   140002e36:	83 6d 10 01          	sub    DWORD PTR [rbp+0x10],0x1
   140002e3a:	48 83 45 f8 14       	add    QWORD PTR [rbp-0x8],0x14
   140002e3f:	eb c7                	jmp    0x140002e08
   140002e41:	90                   	nop
   140002e42:	b8 00 00 00 00       	mov    eax,0x0
   140002e47:	48 83 c4 50          	add    rsp,0x50
   140002e4b:	5d                   	pop    rbp
   140002e4c:	c3                   	ret
   140002e4d:	90                   	nop
   140002e4e:	90                   	nop
   140002e4f:	90                   	nop
   140002e50:	51                   	push   rcx
   140002e51:	50                   	push   rax
   140002e52:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002e58:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   140002e5d:	72 19                	jb     0x140002e78
   140002e5f:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   140002e66:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002e6a:	48 2d 00 10 00 00    	sub    rax,0x1000
   140002e70:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002e76:	77 e7                	ja     0x140002e5f
   140002e78:	48 29 c1             	sub    rcx,rax
   140002e7b:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002e7f:	58                   	pop    rax
   140002e80:	59                   	pop    rcx
   140002e81:	c3                   	ret
   140002e82:	90                   	nop
   140002e83:	90                   	nop
   140002e84:	90                   	nop
   140002e85:	90                   	nop
   140002e86:	90                   	nop
   140002e87:	90                   	nop
   140002e88:	90                   	nop
   140002e89:	90                   	nop
   140002e8a:	90                   	nop
   140002e8b:	90                   	nop
   140002e8c:	90                   	nop
   140002e8d:	90                   	nop
   140002e8e:	90                   	nop
   140002e8f:	90                   	nop
   140002e90:	55                   	push   rbp
   140002e91:	48 89 e5             	mov    rbp,rsp
   140002e94:	48 83 ec 30          	sub    rsp,0x30
   140002e98:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002e9c:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140002ea0:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140002ea4:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   140002ea8:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002eac:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140002eb0:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140002eb5:	41 b9 00 00 00 00    	mov    r9d,0x0
   140002ebb:	49 89 c8             	mov    r8,rcx
   140002ebe:	48 89 c2             	mov    rdx,rax
   140002ec1:	b9 00 00 00 00       	mov    ecx,0x0
   140002ec6:	e8 dd 03 00 00       	call   0x1400032a8
   140002ecb:	48 83 c4 30          	add    rsp,0x30
   140002ecf:	5d                   	pop    rbp
   140002ed0:	c3                   	ret
   140002ed1:	90                   	nop
   140002ed2:	90                   	nop
   140002ed3:	90                   	nop
   140002ed4:	90                   	nop
   140002ed5:	90                   	nop
   140002ed6:	90                   	nop
   140002ed7:	90                   	nop
   140002ed8:	90                   	nop
   140002ed9:	90                   	nop
   140002eda:	90                   	nop
   140002edb:	90                   	nop
   140002edc:	90                   	nop
   140002edd:	90                   	nop
   140002ede:	90                   	nop
   140002edf:	90                   	nop
   140002ee0:	55                   	push   rbp
   140002ee1:	53                   	push   rbx
   140002ee2:	48 83 ec 48          	sub    rsp,0x48
   140002ee6:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140002eeb:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140002eef:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140002ef3:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140002ef7:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140002efb:	48 8d 45 28          	lea    rax,[rbp+0x28]
   140002eff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002f03:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
   140002f07:	b9 00 00 00 00       	mov    ecx,0x0
   140002f0c:	e8 7f 03 00 00       	call   0x140003290
   140002f11:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140002f15:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140002f1a:	41 b9 00 00 00 00    	mov    r9d,0x0
   140002f20:	49 89 d0             	mov    r8,rdx
   140002f23:	48 89 c2             	mov    rdx,rax
   140002f26:	b9 00 00 00 00       	mov    ecx,0x0
   140002f2b:	e8 80 03 00 00       	call   0x1400032b0
   140002f30:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140002f33:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140002f36:	48 83 c4 48          	add    rsp,0x48
   140002f3a:	5b                   	pop    rbx
   140002f3b:	5d                   	pop    rbp
   140002f3c:	c3                   	ret
   140002f3d:	90                   	nop
   140002f3e:	90                   	nop
   140002f3f:	90                   	nop
   140002f40:	55                   	push   rbp
   140002f41:	53                   	push   rbx
   140002f42:	48 83 ec 48          	sub    rsp,0x48
   140002f46:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140002f4b:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140002f4f:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140002f53:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140002f57:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140002f5b:	48 8d 45 28          	lea    rax,[rbp+0x28]
   140002f5f:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002f63:	48 8b 5d f0          	mov    rbx,QWORD PTR [rbp-0x10]
   140002f67:	b9 01 00 00 00       	mov    ecx,0x1
   140002f6c:	e8 1f 03 00 00       	call   0x140003290
   140002f71:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140002f75:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140002f7a:	41 b9 00 00 00 00    	mov    r9d,0x0
   140002f80:	49 89 d0             	mov    r8,rdx
   140002f83:	48 89 c2             	mov    rdx,rax
   140002f86:	b9 00 00 00 00       	mov    ecx,0x0
   140002f8b:	e8 18 03 00 00       	call   0x1400032a8
   140002f90:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140002f93:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140002f96:	48 83 c4 48          	add    rsp,0x48
   140002f9a:	5b                   	pop    rbx
   140002f9b:	5d                   	pop    rbp
   140002f9c:	c3                   	ret
   140002f9d:	90                   	nop
   140002f9e:	90                   	nop
   140002f9f:	90                   	nop
   140002fa0:	55                   	push   rbp
   140002fa1:	48 89 e5             	mov    rbp,rsp
   140002fa4:	48 83 ec 40          	sub    rsp,0x40
   140002fa8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002fac:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140002fb0:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140002fb4:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   140002fb8:	48 8d 45 20          	lea    rax,[rbp+0x20]
   140002fbc:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002fc0:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140002fc4:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   140002fc8:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002fcc:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140002fd1:	41 b9 00 00 00 00    	mov    r9d,0x0
   140002fd7:	49 89 c8             	mov    r8,rcx
   140002fda:	48 89 c2             	mov    rdx,rax
   140002fdd:	b9 00 00 00 00       	mov    ecx,0x0
   140002fe2:	e8 c1 02 00 00       	call   0x1400032a8
   140002fe7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140002fea:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140002fed:	48 83 c4 40          	add    rsp,0x40
   140002ff1:	5d                   	pop    rbp
   140002ff2:	c3                   	ret
   140002ff3:	90                   	nop
   140002ff4:	90                   	nop
   140002ff5:	90                   	nop
   140002ff6:	90                   	nop
   140002ff7:	90                   	nop
   140002ff8:	90                   	nop
   140002ff9:	90                   	nop
   140002ffa:	90                   	nop
   140002ffb:	90                   	nop
   140002ffc:	90                   	nop
   140002ffd:	90                   	nop
   140002ffe:	90                   	nop
   140002fff:	90                   	nop
   140003000:	55                   	push   rbp
   140003001:	48 89 e5             	mov    rbp,rsp
   140003004:	48 83 ec 20          	sub    rsp,0x20
   140003008:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000300c:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003010:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140003014:	44 89 4d 28          	mov    DWORD PTR [rbp+0x28],r9d
   140003018:	e8 fb 02 00 00       	call   0x140003318
   14000301d:	83 7d 28 00          	cmp    DWORD PTR [rbp+0x28],0x0
   140003021:	74 07                	je     0x14000302a
   140003023:	b8 02 00 00 00       	mov    eax,0x2
   140003028:	eb 05                	jmp    0x14000302f
   14000302a:	b8 01 00 00 00       	mov    eax,0x1
   14000302f:	89 c1                	mov    ecx,eax
   140003031:	e8 ba 02 00 00       	call   0x1400032f0
   140003036:	e8 95 02 00 00       	call   0x1400032d0
   14000303b:	8b 10                	mov    edx,DWORD PTR [rax]
   14000303d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140003041:	89 10                	mov    DWORD PTR [rax],edx
   140003043:	e8 90 02 00 00       	call   0x1400032d8
   140003048:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14000304b:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000304f:	48 89 10             	mov    QWORD PTR [rax],rdx
   140003052:	e8 49 03 00 00       	call   0x1400033a0
   140003057:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14000305a:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000305e:	48 89 10             	mov    QWORD PTR [rax],rdx
   140003061:	48 83 7d 30 00       	cmp    QWORD PTR [rbp+0x30],0x0
   140003066:	74 0d                	je     0x140003075
   140003068:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000306c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000306e:	89 c1                	mov    ecx,eax
   140003070:	e8 0b 03 00 00       	call   0x140003380
   140003075:	b8 00 00 00 00       	mov    eax,0x0
   14000307a:	48 83 c4 20          	add    rsp,0x20
   14000307e:	5d                   	pop    rbp
   14000307f:	c3                   	ret
   140003080:	55                   	push   rbp
   140003081:	48 89 e5             	mov    rbp,rsp
   140003084:	48 83 ec 20          	sub    rsp,0x20
   140003088:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000308c:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003090:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140003094:	44 89 4d 28          	mov    DWORD PTR [rbp+0x28],r9d
   140003098:	e8 83 02 00 00       	call   0x140003320
   14000309d:	83 7d 28 00          	cmp    DWORD PTR [rbp+0x28],0x0
   1400030a1:	74 07                	je     0x1400030aa
   1400030a3:	b8 02 00 00 00       	mov    eax,0x2
   1400030a8:	eb 05                	jmp    0x1400030af
   1400030aa:	b8 01 00 00 00       	mov    eax,0x1
   1400030af:	89 c1                	mov    ecx,eax
   1400030b1:	e8 42 02 00 00       	call   0x1400032f8
   1400030b6:	e8 15 02 00 00       	call   0x1400032d0
   1400030bb:	8b 10                	mov    edx,DWORD PTR [rax]
   1400030bd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400030c1:	89 10                	mov    DWORD PTR [rax],edx
   1400030c3:	e8 18 02 00 00       	call   0x1400032e0
   1400030c8:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1400030cb:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400030cf:	48 89 10             	mov    QWORD PTR [rax],rdx
   1400030d2:	e8 d1 02 00 00       	call   0x1400033a8
   1400030d7:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1400030da:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030de:	48 89 10             	mov    QWORD PTR [rax],rdx
   1400030e1:	48 83 7d 30 00       	cmp    QWORD PTR [rbp+0x30],0x0
   1400030e6:	74 0d                	je     0x1400030f5
   1400030e8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400030ec:	8b 00                	mov    eax,DWORD PTR [rax]
   1400030ee:	89 c1                	mov    ecx,eax
   1400030f0:	e8 8b 02 00 00       	call   0x140003380
   1400030f5:	b8 00 00 00 00       	mov    eax,0x0
   1400030fa:	48 83 c4 20          	add    rsp,0x20
   1400030fe:	5d                   	pop    rbp
   1400030ff:	c3                   	ret
   140003100:	55                   	push   rbp
   140003101:	48 89 e5             	mov    rbp,rsp
   140003104:	48 83 ec 20          	sub    rsp,0x20
   140003108:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000310c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140003110:	48 89 c1             	mov    rcx,rax
   140003113:	e8 f0 01 00 00       	call   0x140003308
   140003118:	85 c0                	test   eax,eax
   14000311a:	75 06                	jne    0x140003122
   14000311c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140003120:	eb 05                	jmp    0x140003127
   140003122:	b8 00 00 00 00       	mov    eax,0x0
   140003127:	48 83 c4 20          	add    rsp,0x20
   14000312b:	5d                   	pop    rbp
   14000312c:	c3                   	ret
   14000312d:	55                   	push   rbp
   14000312e:	48 89 e5             	mov    rbp,rsp
   140003131:	48 83 ec 20          	sub    rsp,0x20
   140003135:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140003139:	48 8b 05 30 23 00 00 	mov    rax,QWORD PTR [rip+0x2330]        # 0x140005470
   140003140:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140003143:	84 c0                	test   al,al
   140003145:	74 07                	je     0x14000314e
   140003147:	b8 00 00 00 00       	mov    eax,0x0
   14000314c:	eb 0c                	jmp    0x14000315a
   14000314e:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140003152:	48 89 c1             	mov    rcx,rax
   140003155:	e8 a6 01 00 00       	call   0x140003300
   14000315a:	48 83 c4 20          	add    rsp,0x20
   14000315e:	5d                   	pop    rbp
   14000315f:	c3                   	ret
   140003160:	55                   	push   rbp
   140003161:	48 89 e5             	mov    rbp,rsp
   140003164:	48 83 ec 20          	sub    rsp,0x20
   140003168:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000316b:	b9 02 00 00 00       	mov    ecx,0x2
   140003170:	e8 1b 01 00 00       	call   0x140003290
   140003175:	48 89 c1             	mov    rcx,rax
   140003178:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   14000317b:	41 89 c0             	mov    r8d,eax
   14000317e:	48 8d 05 eb 21 00 00 	lea    rax,[rip+0x21eb]        # 0x140005370
   140003185:	48 89 c2             	mov    rdx,rax
   140003188:	e8 13 fe ff ff       	call   0x140002fa0
   14000318d:	b9 ff 00 00 00       	mov    ecx,0xff
   140003192:	e8 79 01 00 00       	call   0x140003310
   140003197:	90                   	nop
   140003198:	55                   	push   rbp
   140003199:	48 89 e5             	mov    rbp,rsp
   14000319c:	b8 00 00 00 00       	mov    eax,0x0
   1400031a1:	5d                   	pop    rbp
   1400031a2:	c3                   	ret
   1400031a3:	55                   	push   rbp
   1400031a4:	48 89 e5             	mov    rbp,rsp
   1400031a7:	48 83 ec 20          	sub    rsp,0x20
   1400031ab:	48 8b 05 6e 22 00 00 	mov    rax,QWORD PTR [rip+0x226e]        # 0x140005420
   1400031b2:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400031b5:	ff d0                	call   rax
   1400031b7:	e8 a4 00 00 00       	call   0x140003260
   1400031bc:	48 89 05 65 0f 00 00 	mov    QWORD PTR [rip+0xf65],rax        # 0x140004128
   1400031c3:	e8 90 00 00 00       	call   0x140003258
   1400031c8:	48 89 05 61 0f 00 00 	mov    QWORD PTR [rip+0xf61],rax        # 0x140004130
   1400031cf:	e8 7c 00 00 00       	call   0x140003250
   1400031d4:	48 89 05 5d 0f 00 00 	mov    QWORD PTR [rip+0xf5d],rax        # 0x140004138
   1400031db:	90                   	nop
   1400031dc:	48 83 c4 20          	add    rsp,0x20
   1400031e0:	5d                   	pop    rbp
   1400031e1:	c3                   	ret
   1400031e2:	55                   	push   rbp
   1400031e3:	48 89 e5             	mov    rbp,rsp
   1400031e6:	48 83 ec 20          	sub    rsp,0x20
   1400031ea:	e8 b4 ff ff ff       	call   0x1400031a3
   1400031ef:	90                   	nop
   1400031f0:	48 83 c4 20          	add    rsp,0x20
   1400031f4:	5d                   	pop    rbp
   1400031f5:	c3                   	ret
   1400031f6:	55                   	push   rbp
   1400031f7:	48 89 e5             	mov    rbp,rsp
   1400031fa:	48 83 ec 40          	sub    rsp,0x40
   1400031fe:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140003202:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003206:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   14000320a:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   14000320e:	48 8d 45 20          	lea    rax,[rbp+0x20]
   140003212:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140003216:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   14000321a:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   14000321e:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140003222:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140003227:	41 b9 00 00 00 00    	mov    r9d,0x0
   14000322d:	49 89 c8             	mov    r8,rcx
   140003230:	48 89 c2             	mov    rdx,rax
   140003233:	b9 04 00 00 00       	mov    ecx,0x4
   140003238:	e8 7b 00 00 00       	call   0x1400032b8
   14000323d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003240:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003243:	48 83 c4 40          	add    rsp,0x40
   140003247:	5d                   	pop    rbp
   140003248:	c3                   	ret
   140003249:	90                   	nop
   14000324a:	90                   	nop
   14000324b:	90                   	nop
   14000324c:	90                   	nop
   14000324d:	90                   	nop
   14000324e:	90                   	nop
   14000324f:	90                   	nop
   140003250:	ff 25 4a 72 00 00    	jmp    QWORD PTR [rip+0x724a]        # 0x14000a4a0
   140003256:	90                   	nop
   140003257:	90                   	nop
   140003258:	ff 25 4a 72 00 00    	jmp    QWORD PTR [rip+0x724a]        # 0x14000a4a8
   14000325e:	90                   	nop
   14000325f:	90                   	nop
   140003260:	ff 25 4a 72 00 00    	jmp    QWORD PTR [rip+0x724a]        # 0x14000a4b0
   140003266:	90                   	nop
   140003267:	90                   	nop
   140003268:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000326f:	00 
   140003270:	ff 25 0a 72 00 00    	jmp    QWORD PTR [rip+0x720a]        # 0x14000a480
   140003276:	90                   	nop
   140003277:	90                   	nop
   140003278:	ff 25 0a 72 00 00    	jmp    QWORD PTR [rip+0x720a]        # 0x14000a488
   14000327e:	90                   	nop
   14000327f:	90                   	nop
   140003280:	ff 25 0a 72 00 00    	jmp    QWORD PTR [rip+0x720a]        # 0x14000a490
   140003286:	90                   	nop
   140003287:	90                   	nop
   140003288:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000328f:	00 
   140003290:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a438
   140003296:	90                   	nop
   140003297:	90                   	nop
   140003298:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a440
   14000329e:	90                   	nop
   14000329f:	90                   	nop
   1400032a0:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a448
   1400032a6:	90                   	nop
   1400032a7:	90                   	nop
   1400032a8:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a450
   1400032ae:	90                   	nop
   1400032af:	90                   	nop
   1400032b0:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a458
   1400032b6:	90                   	nop
   1400032b7:	90                   	nop
   1400032b8:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a460
   1400032be:	90                   	nop
   1400032bf:	90                   	nop
   1400032c0:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a468
   1400032c6:	90                   	nop
   1400032c7:	90                   	nop
   1400032c8:	ff 25 a2 71 00 00    	jmp    QWORD PTR [rip+0x71a2]        # 0x14000a470
   1400032ce:	90                   	nop
   1400032cf:	90                   	nop
   1400032d0:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3a8
   1400032d6:	90                   	nop
   1400032d7:	90                   	nop
   1400032d8:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3b0
   1400032de:	90                   	nop
   1400032df:	90                   	nop
   1400032e0:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3b8
   1400032e6:	90                   	nop
   1400032e7:	90                   	nop
   1400032e8:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3c0
   1400032ee:	90                   	nop
   1400032ef:	90                   	nop
   1400032f0:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3c8
   1400032f6:	90                   	nop
   1400032f7:	90                   	nop
   1400032f8:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3d0
   1400032fe:	90                   	nop
   1400032ff:	90                   	nop
   140003300:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3d8
   140003306:	90                   	nop
   140003307:	90                   	nop
   140003308:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3e0
   14000330e:	90                   	nop
   14000330f:	90                   	nop
   140003310:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3e8
   140003316:	90                   	nop
   140003317:	90                   	nop
   140003318:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3f0
   14000331e:	90                   	nop
   14000331f:	90                   	nop
   140003320:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a3f8
   140003326:	90                   	nop
   140003327:	90                   	nop
   140003328:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a400
   14000332e:	90                   	nop
   14000332f:	90                   	nop
   140003330:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a408
   140003336:	90                   	nop
   140003337:	90                   	nop
   140003338:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a410
   14000333e:	90                   	nop
   14000333f:	90                   	nop
   140003340:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a418
   140003346:	90                   	nop
   140003347:	90                   	nop
   140003348:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a420
   14000334e:	90                   	nop
   14000334f:	90                   	nop
   140003350:	ff 25 d2 70 00 00    	jmp    QWORD PTR [rip+0x70d2]        # 0x14000a428
   140003356:	90                   	nop
   140003357:	90                   	nop
   140003358:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000335f:	00 
   140003360:	ff 25 2a 70 00 00    	jmp    QWORD PTR [rip+0x702a]        # 0x14000a390
   140003366:	90                   	nop
   140003367:	90                   	nop
   140003368:	ff 25 2a 70 00 00    	jmp    QWORD PTR [rip+0x702a]        # 0x14000a398
   14000336e:	90                   	nop
   14000336f:	90                   	nop
   140003370:	ff 25 0a 70 00 00    	jmp    QWORD PTR [rip+0x700a]        # 0x14000a380
   140003376:	90                   	nop
   140003377:	90                   	nop
   140003378:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000337f:	00 
   140003380:	ff 25 d2 6f 00 00    	jmp    QWORD PTR [rip+0x6fd2]        # 0x14000a358
   140003386:	90                   	nop
   140003387:	90                   	nop
   140003388:	ff 25 d2 6f 00 00    	jmp    QWORD PTR [rip+0x6fd2]        # 0x14000a360
   14000338e:	90                   	nop
   14000338f:	90                   	nop
   140003390:	ff 25 d2 6f 00 00    	jmp    QWORD PTR [rip+0x6fd2]        # 0x14000a368
   140003396:	90                   	nop
   140003397:	90                   	nop
   140003398:	ff 25 d2 6f 00 00    	jmp    QWORD PTR [rip+0x6fd2]        # 0x14000a370
   14000339e:	90                   	nop
   14000339f:	90                   	nop
   1400033a0:	ff 25 9a 6f 00 00    	jmp    QWORD PTR [rip+0x6f9a]        # 0x14000a340
   1400033a6:	90                   	nop
   1400033a7:	90                   	nop
   1400033a8:	ff 25 9a 6f 00 00    	jmp    QWORD PTR [rip+0x6f9a]        # 0x14000a348
   1400033ae:	90                   	nop
   1400033af:	90                   	nop
   1400033b0:	ff 25 7a 6f 00 00    	jmp    QWORD PTR [rip+0x6f7a]        # 0x14000a330
   1400033b6:	90                   	nop
   1400033b7:	90                   	nop
   1400033b8:	ff 25 6a 6f 00 00    	jmp    QWORD PTR [rip+0x6f6a]        # 0x14000a328
   1400033be:	90                   	nop
   1400033bf:	90                   	nop
   1400033c0:	ff 25 5a 6f 00 00    	jmp    QWORD PTR [rip+0x6f5a]        # 0x14000a320
   1400033c6:	90                   	nop
   1400033c7:	90                   	nop
   1400033c8:	ff 25 4a 6f 00 00    	jmp    QWORD PTR [rip+0x6f4a]        # 0x14000a318
   1400033ce:	90                   	nop
   1400033cf:	90                   	nop
   1400033d0:	ff 25 3a 6f 00 00    	jmp    QWORD PTR [rip+0x6f3a]        # 0x14000a310
   1400033d6:	90                   	nop
   1400033d7:	90                   	nop
   1400033d8:	ff 25 2a 6f 00 00    	jmp    QWORD PTR [rip+0x6f2a]        # 0x14000a308
   1400033de:	90                   	nop
   1400033df:	90                   	nop
   1400033e0:	ff 25 1a 6f 00 00    	jmp    QWORD PTR [rip+0x6f1a]        # 0x14000a300
   1400033e6:	90                   	nop
   1400033e7:	90                   	nop
   1400033e8:	ff 25 0a 6f 00 00    	jmp    QWORD PTR [rip+0x6f0a]        # 0x14000a2f8
   1400033ee:	90                   	nop
   1400033ef:	90                   	nop
   1400033f0:	ff 25 fa 6e 00 00    	jmp    QWORD PTR [rip+0x6efa]        # 0x14000a2f0
   1400033f6:	90                   	nop
   1400033f7:	90                   	nop
   1400033f8:	ff 25 ea 6e 00 00    	jmp    QWORD PTR [rip+0x6eea]        # 0x14000a2e8
   1400033fe:	90                   	nop
   1400033ff:	90                   	nop
   140003400:	ff 25 da 6e 00 00    	jmp    QWORD PTR [rip+0x6eda]        # 0x14000a2e0
   140003406:	90                   	nop
   140003407:	90                   	nop
   140003408:	ff 25 ca 6e 00 00    	jmp    QWORD PTR [rip+0x6eca]        # 0x14000a2d8
   14000340e:	90                   	nop
   14000340f:	90                   	nop
   140003410:	ff 25 ba 6e 00 00    	jmp    QWORD PTR [rip+0x6eba]        # 0x14000a2d0
   140003416:	90                   	nop
   140003417:	90                   	nop
   140003418:	ff 25 aa 6e 00 00    	jmp    QWORD PTR [rip+0x6eaa]        # 0x14000a2c8
   14000341e:	90                   	nop
   14000341f:	90                   	nop
   140003420:	53                   	push   rbx
   140003421:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
   140003428:	e8 8a e4 ff ff       	call   0x1400018b7
   14000342d:	b8 aa aa aa aa       	mov    eax,0xaaaaaaaa
   140003432:	0f b7 15 e7 0b 00 00 	movzx  edx,WORD PTR [rip+0xbe7]        # 0x140004020
   140003439:	0f b7 1d de 0b 00 00 	movzx  ebx,WORD PTR [rip+0xbde]        # 0x14000401e
   140003440:	66 0f 6e c0          	movd   xmm0,eax
   140003444:	0f b7 05 0d 1c 00 00 	movzx  eax,WORD PTR [rip+0x1c0d]        # 0x140005058
   14000344b:	c6 44 24 22 00       	mov    BYTE PTR [rsp+0x22],0x0
   140003450:	48 8d 0d f9 1b 00 00 	lea    rcx,[rip+0x1bf9]        # 0x140005050
   140003457:	66 0f 70 c0 00       	pshufd xmm0,xmm0,0x0
   14000345c:	66 0f ef 05 cc 0b 00 	pxor   xmm0,XMMWORD PTR [rip+0xbcc]        # 0x140004030
   140003463:	00 
   140003464:	c6 44 24 2a 00       	mov    BYTE PTR [rsp+0x2a],0x0
   140003469:	31 c2                	xor    edx,eax
   14000346b:	31 d8                	xor    eax,ebx
   14000346d:	48 8d 5c 24 30       	lea    rbx,[rsp+0x30]
   140003472:	c6 84 24 c0 00 00 00 	mov    BYTE PTR [rsp+0xc0],0x0
   140003479:	00 
   14000347a:	66 89 54 24 20       	mov    WORD PTR [rsp+0x20],dx
   14000347f:	48 8d 94 24 b0 00 00 	lea    rdx,[rsp+0xb0]
   140003486:	00 
   140003487:	0f 29 84 24 b0 00 00 	movaps XMMWORD PTR [rsp+0xb0],xmm0
   14000348e:	00 
   14000348f:	66 89 44 24 28       	mov    WORD PTR [rsp+0x28],ax
   140003494:	e8 a7 fa ff ff       	call   0x140002f40
   140003499:	48 89 da             	mov    rdx,rbx
   14000349c:	48 8d 0d b0 1b 00 00 	lea    rcx,[rip+0x1bb0]        # 0x140005053
   1400034a3:	e8 38 fa ff ff       	call   0x140002ee0
   1400034a8:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   1400034ad:	e8 be e2 ff ff       	call   0x140001770
   1400034b2:	48 89 ca             	mov    rdx,rcx
   1400034b5:	48 89 d9             	mov    rcx,rbx
   1400034b8:	e8 b3 fd ff ff       	call   0x140003270
   1400034bd:	85 c0                	test   eax,eax
   1400034bf:	75 15                	jne    0x1400034d6
   1400034c1:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   1400034c6:	e8 fd fd ff ff       	call   0x1400032c8
   1400034cb:	31 c0                	xor    eax,eax
   1400034cd:	48 81 c4 f0 00 00 00 	add    rsp,0xf0
   1400034d4:	5b                   	pop    rbx
   1400034d5:	c3                   	ret
   1400034d6:	48 8d 4c 24 28       	lea    rcx,[rsp+0x28]
   1400034db:	e8 e8 fd ff ff       	call   0x1400032c8
   1400034e0:	eb e9                	jmp    0x1400034cb
   1400034e2:	90                   	nop
   1400034e3:	90                   	nop
   1400034e4:	90                   	nop
   1400034e5:	90                   	nop
   1400034e6:	90                   	nop
   1400034e7:	90                   	nop
   1400034e8:	90                   	nop
   1400034e9:	90                   	nop
   1400034ea:	90                   	nop
   1400034eb:	90                   	nop
   1400034ec:	90                   	nop
   1400034ed:	90                   	nop
   1400034ee:	90                   	nop
   1400034ef:	90                   	nop
   1400034f0:	e9 eb e0 ff ff       	jmp    0x1400015e0
   1400034f5:	90                   	nop
   1400034f6:	90                   	nop
   1400034f7:	90                   	nop
   1400034f8:	90                   	nop
   1400034f9:	90                   	nop
   1400034fa:	90                   	nop
   1400034fb:	90                   	nop
   1400034fc:	90                   	nop
   1400034fd:	90                   	nop
   1400034fe:	90                   	nop
   1400034ff:	90                   	nop
