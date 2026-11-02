
original/mothlight.exe:     file format pei-x86-64


Disassembly of section .text:

0000000000401000 <.text>:
  401000:	55                   	push   rbp
  401001:	48 89 e5             	mov    rbp,rsp
  401004:	48 81 ec 40 00 00 00 	sub    rsp,0x40
  40100b:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  40100f:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401013:	b8 00 00 00 00       	mov    eax,0x0
  401018:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  40101b:	48 b8 00 00 00 00 00 	movabs rax,0x0
  401022:	00 00 00 
  401025:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  40102a:	48 8d 45 fc          	lea    rax,[rbp-0x4]
  40102e:	49 89 c1             	mov    r9,rax
  401031:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  401034:	49 89 c0             	mov    r8,rax
  401037:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  40103b:	49 89 c3             	mov    r11,rax
  40103e:	48 8b 05 4b 14 00 00 	mov    rax,QWORD PTR [rip+0x144b]        # 0x402490
  401045:	49 89 c2             	mov    r10,rax
  401048:	4c 89 d1             	mov    rcx,r10
  40104b:	4c 89 da             	mov    rdx,r11
  40104e:	e8 d5 0e 00 00       	call   0x401f28
  401053:	c9                   	leave
  401054:	c3                   	ret
  401055:	00 00                	add    BYTE PTR [rax],al
  401057:	00 01                	add    BYTE PTR [rcx],al
  401059:	04 02                	add    al,0x2
  40105b:	05 04 03 01 50       	add    eax,0x50010304
  401060:	55                   	push   rbp
  401061:	48 89 e5             	mov    rbp,rsp
  401064:	48 81 ec 30 00 00 00 	sub    rsp,0x30
  40106b:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  40106f:	b8 00 00 00 00       	mov    eax,0x0
  401074:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401077:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  40107a:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  40107e:	48 01 c1             	add    rcx,rax
  401081:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  401084:	83 f8 00             	cmp    eax,0x0
  401087:	0f 84 0e 00 00 00    	je     0x40109b
  40108d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401090:	48 89 c1             	mov    rcx,rax
  401093:	83 c0 01             	add    eax,0x1
  401096:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401099:	eb dc                	jmp    0x401077
  40109b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  40109e:	49 89 c3             	mov    r11,rax
  4010a1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  4010a5:	49 89 c2             	mov    r10,rax
  4010a8:	4c 89 d1             	mov    rcx,r10
  4010ab:	4c 89 da             	mov    rdx,r11
  4010ae:	e8 4d ff ff ff       	call   0x401000
  4010b3:	c9                   	leave
  4010b4:	c3                   	ret
  4010b5:	55                   	push   rbp
  4010b6:	48 89 e5             	mov    rbp,rsp
  4010b9:	48 81 ec 40 00 00 00 	sub    rsp,0x40
  4010c0:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4010c4:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  4010c8:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  4010cc:	b8 00 00 00 00       	mov    eax,0x0
  4010d1:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  4010d4:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  4010d8:	b9 00 00 00 00       	mov    ecx,0x0
  4010dd:	89 08                	mov    DWORD PTR [rax],ecx
  4010df:	b8 00 00 00 00       	mov    eax,0x0
  4010e4:	88 45 fb             	mov    BYTE PTR [rbp-0x5],al
  4010e7:	b8 00 00 00 00       	mov    eax,0x0
  4010ec:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  4010ef:	48 b8 00 00 00 00 00 	movabs rax,0x0
  4010f6:	00 00 00 
  4010f9:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  4010fe:	48 8d 45 f4          	lea    rax,[rbp-0xc]
  401102:	49 89 c1             	mov    r9,rax
  401105:	b8 01 00 00 00       	mov    eax,0x1
  40110a:	49 89 c0             	mov    r8,rax
  40110d:	48 8d 45 fb          	lea    rax,[rbp-0x5]
  401111:	49 89 c3             	mov    r11,rax
  401114:	48 8b 05 7d 13 00 00 	mov    rax,QWORD PTR [rip+0x137d]        # 0x402498
  40111b:	49 89 c2             	mov    r10,rax
  40111e:	4c 89 d1             	mov    rcx,r10
  401121:	4c 89 da             	mov    rdx,r11
  401124:	e8 07 0e 00 00       	call   0x401f30
  401129:	83 f8 00             	cmp    eax,0x0
  40112c:	0f 84 11 00 00 00    	je     0x401143
  401132:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401135:	83 f8 00             	cmp    eax,0x0
  401138:	0f 84 05 00 00 00    	je     0x401143
  40113e:	e9 05 00 00 00       	jmp    0x401148
  401143:	e9 6c 00 00 00       	jmp    0x4011b4
  401148:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  40114c:	83 f8 0a             	cmp    eax,0xa
  40114f:	0f 85 05 00 00 00    	jne    0x40115a
  401155:	e9 5a 00 00 00       	jmp    0x4011b4
  40115a:	0f b6 45 fb          	movzx  eax,BYTE PTR [rbp-0x5]
  40115e:	83 f8 0d             	cmp    eax,0xd
  401161:	0f 85 05 00 00 00    	jne    0x40116c
  401167:	e9 73 ff ff ff       	jmp    0x4010df
  40116c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  40116f:	83 c0 01             	add    eax,0x1
  401172:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  401175:	39 c8                	cmp    eax,ecx
  401177:	0f 8d 27 00 00 00    	jge    0x4011a4
  40117d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401180:	48 89 c1             	mov    rcx,rax
  401183:	83 c0 01             	add    eax,0x1
  401186:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401189:	48 63 c9             	movsxd rcx,ecx
  40118c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  401190:	48 01 c8             	add    rax,rcx
  401193:	0f b6 4d fb          	movzx  ecx,BYTE PTR [rbp-0x5]
  401197:	c1 e1 18             	shl    ecx,0x18
  40119a:	c1 f9 18             	sar    ecx,0x18
  40119d:	88 08                	mov    BYTE PTR [rax],cl
  40119f:	e9 0b 00 00 00       	jmp    0x4011af
  4011a4:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  4011a8:	b9 01 00 00 00       	mov    ecx,0x1
  4011ad:	89 08                	mov    DWORD PTR [rax],ecx
  4011af:	e9 2b ff ff ff       	jmp    0x4010df
  4011b4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4011b7:	48 63 c0             	movsxd rax,eax
  4011ba:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  4011be:	48 01 c1             	add    rcx,rax
  4011c1:	b8 00 00 00 00       	mov    eax,0x0
  4011c6:	88 01                	mov    BYTE PTR [rcx],al
  4011c8:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4011cb:	c9                   	leave
  4011cc:	c3                   	ret
  4011cd:	55                   	push   rbp
  4011ce:	48 89 e5             	mov    rbp,rsp
  4011d1:	48 81 ec 00 00 00 00 	sub    rsp,0x0
  4011d8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4011dc:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4011df:	83 f8 61             	cmp    eax,0x61
  4011e2:	0f 8c 17 00 00 00    	jl     0x4011ff
  4011e8:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4011eb:	83 f8 7a             	cmp    eax,0x7a
  4011ee:	0f 8f 0b 00 00 00    	jg     0x4011ff
  4011f4:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4011f7:	83 e8 20             	sub    eax,0x20
  4011fa:	e9 03 00 00 00       	jmp    0x401202
  4011ff:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  401202:	c9                   	leave
  401203:	c3                   	ret
  401204:	55                   	push   rbp
  401205:	48 89 e5             	mov    rbp,rsp
  401208:	48 81 ec 10 00 00 00 	sub    rsp,0x10
  40120f:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401213:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401217:	b8 00 00 00 00       	mov    eax,0x0
  40121c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  40121f:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  401222:	83 f8 03             	cmp    eax,0x3
  401225:	0f 8c 11 00 00 00    	jl     0x40123c
  40122b:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  40122e:	83 f8 14             	cmp    eax,0x14
  401231:	0f 8f 05 00 00 00    	jg     0x40123c
  401237:	e9 0a 00 00 00       	jmp    0x401246
  40123c:	b8 00 00 00 00       	mov    eax,0x0
  401241:	e9 ee 00 00 00       	jmp    0x401334
  401246:	b8 00 00 00 00       	mov    eax,0x0
  40124b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40124e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401251:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  401254:	39 c8                	cmp    eax,ecx
  401256:	0f 8d ca 00 00 00    	jge    0x401326
  40125c:	e9 0e 00 00 00       	jmp    0x40126f
  401261:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401264:	48 89 c1             	mov    rcx,rax
  401267:	83 c0 01             	add    eax,0x1
  40126a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40126d:	eb df                	jmp    0x40124e
  40126f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401272:	48 63 c0             	movsxd rax,eax
  401275:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  401279:	48 01 c1             	add    rcx,rax
  40127c:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  40127f:	81 e0 ff 00 00 00    	and    eax,0xff
  401285:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  401288:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  40128b:	83 f8 41             	cmp    eax,0x41
  40128e:	0f 8c 11 00 00 00    	jl     0x4012a5
  401294:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401297:	83 f8 5a             	cmp    eax,0x5a
  40129a:	0f 8f 05 00 00 00    	jg     0x4012a5
  4012a0:	e9 22 00 00 00       	jmp    0x4012c7
  4012a5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4012a8:	83 f8 61             	cmp    eax,0x61
  4012ab:	0f 8c 11 00 00 00    	jl     0x4012c2
  4012b1:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4012b4:	83 f8 7a             	cmp    eax,0x7a
  4012b7:	0f 8f 05 00 00 00    	jg     0x4012c2
  4012bd:	e9 05 00 00 00       	jmp    0x4012c7
  4012c2:	e9 11 00 00 00       	jmp    0x4012d8
  4012c7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4012ca:	48 89 c1             	mov    rcx,rax
  4012cd:	83 c0 01             	add    eax,0x1
  4012d0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  4012d3:	e9 49 00 00 00       	jmp    0x401321
  4012d8:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4012db:	83 f8 30             	cmp    eax,0x30
  4012de:	0f 8c 11 00 00 00    	jl     0x4012f5
  4012e4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4012e7:	83 f8 39             	cmp    eax,0x39
  4012ea:	0f 8f 05 00 00 00    	jg     0x4012f5
  4012f0:	e9 1d 00 00 00       	jmp    0x401312
  4012f5:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  4012f8:	83 f8 20             	cmp    eax,0x20
  4012fb:	0f 84 11 00 00 00    	je     0x401312
  401301:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401304:	83 f8 2d             	cmp    eax,0x2d
  401307:	0f 84 05 00 00 00    	je     0x401312
  40130d:	e9 05 00 00 00       	jmp    0x401317
  401312:	e9 0a 00 00 00       	jmp    0x401321
  401317:	b8 00 00 00 00       	mov    eax,0x0
  40131c:	e9 13 00 00 00       	jmp    0x401334
  401321:	e9 3b ff ff ff       	jmp    0x401261
  401326:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401329:	83 f8 00             	cmp    eax,0x0
  40132c:	b8 00 00 00 00       	mov    eax,0x0
  401331:	0f 9f c0             	setg   al
  401334:	c9                   	leave
  401335:	c3                   	ret
  401336:	55                   	push   rbp
  401337:	48 89 e5             	mov    rbp,rsp
  40133a:	48 81 ec 50 00 00 00 	sub    rsp,0x50
  401341:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401345:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401349:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  40134d:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
  401351:	b8 c5 9d 1c 81       	mov    eax,0x811c9dc5
  401356:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401359:	b8 68 74 6f 6d       	mov    eax,0x6d6f7468
  40135e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  401361:	b8 00 00 00 00       	mov    eax,0x0
  401366:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  401369:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  40136c:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  40136f:	39 c8                	cmp    eax,ecx
  401371:	0f 8d 52 00 00 00    	jge    0x4013c9
  401377:	e9 0e 00 00 00       	jmp    0x40138a
  40137c:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  40137f:	48 89 c1             	mov    rcx,rax
  401382:	83 c0 01             	add    eax,0x1
  401385:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  401388:	eb df                	jmp    0x401369
  40138a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  40138d:	48 63 c0             	movsxd rax,eax
  401390:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  401394:	48 01 c1             	add    rcx,rax
  401397:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  40139a:	81 e0 ff 00 00 00    	and    eax,0xff
  4013a0:	49 89 c2             	mov    r10,rax
  4013a3:	4c 89 d1             	mov    rcx,r10
  4013a6:	e8 22 fe ff ff       	call   0x4011cd
  4013ab:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
  4013ae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4013b1:	8b 4d ec             	mov    ecx,DWORD PTR [rbp-0x14]
  4013b4:	31 c8                	xor    eax,ecx
  4013b6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  4013b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4013bc:	b9 93 01 00 01       	mov    ecx,0x1000193
  4013c1:	0f af c1             	imul   eax,ecx
  4013c4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  4013c7:	eb b3                	jmp    0x40137c
  4013c9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  4013cd:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  4013d0:	81 f1 4c 4d 00 00    	xor    ecx,0x4d4c
  4013d6:	ba 37 9e 00 00       	mov    edx,0x9e37
  4013db:	0f af ca             	imul   ecx,edx
  4013de:	c1 e9 10             	shr    ecx,0x10
  4013e1:	81 e1 ff ff 00 00    	and    ecx,0xffff
  4013e7:	66 89 08             	mov    WORD PTR [rax],cx
  4013ea:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  4013ed:	83 e8 01             	sub    eax,0x1
  4013f0:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  4013f3:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4013f6:	83 f8 00             	cmp    eax,0x0
  4013f9:	0f 8c 64 00 00 00    	jl     0x401463
  4013ff:	e9 0e 00 00 00       	jmp    0x401412
  401404:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  401407:	48 89 c1             	mov    rcx,rax
  40140a:	83 c0 ff             	add    eax,0xffffffff
  40140d:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  401410:	eb e1                	jmp    0x4013f3
  401412:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  401415:	48 63 c0             	movsxd rax,eax
  401418:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  40141c:	48 01 c1             	add    rcx,rax
  40141f:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  401422:	81 e0 ff 00 00 00    	and    eax,0xff
  401428:	49 89 c2             	mov    r10,rax
  40142b:	4c 89 d1             	mov    rcx,r10
  40142e:	e8 9a fd ff ff       	call   0x4011cd
  401433:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
  401436:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
  401439:	83 c0 20             	add    eax,0x20
  40143c:	8b 4d f8             	mov    ecx,DWORD PTR [rbp-0x8]
  40143f:	31 c1                	xor    ecx,eax
  401441:	89 4d f8             	mov    DWORD PTR [rbp-0x8],ecx
  401444:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401447:	c1 e0 05             	shl    eax,0x5
  40144a:	8b 4d f8             	mov    ecx,DWORD PTR [rbp-0x8]
  40144d:	c1 e9 1b             	shr    ecx,0x1b
  401450:	09 c8                	or     eax,ecx
  401452:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  401455:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401458:	81 c0 b9 79 37 9e    	add    eax,0x9e3779b9
  40145e:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  401461:	eb a1                	jmp    0x401404
  401463:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
  401467:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  40146a:	c1 e9 10             	shr    ecx,0x10
  40146d:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
  401470:	31 ca                	xor    edx,ecx
  401472:	81 e2 ff ff 00 00    	and    edx,0xffff
  401478:	66 89 10             	mov    WORD PTR [rax],dx
  40147b:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  40147e:	c1 e0 08             	shl    eax,0x8
  401481:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  401485:	0f be 11             	movsx  edx,BYTE PTR [rcx]
  401488:	81 e2 ff 00 00 00    	and    edx,0xff
  40148e:	49 89 d2             	mov    r10,rdx
  401491:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
  401495:	4c 89 d1             	mov    rcx,r10
  401498:	e8 30 fd ff ff       	call   0x4011cd
  40149d:	8b 4d e0             	mov    ecx,DWORD PTR [rbp-0x20]
  4014a0:	01 c1                	add    ecx,eax
  4014a2:	89 4d f4             	mov    DWORD PTR [rbp-0xc],ecx
  4014a5:	b8 00 00 00 00       	mov    eax,0x0
  4014aa:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  4014ad:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4014b0:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  4014b3:	39 c8                	cmp    eax,ecx
  4014b5:	0f 8d 5e 00 00 00    	jge    0x401519
  4014bb:	e9 0e 00 00 00       	jmp    0x4014ce
  4014c0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4014c3:	48 89 c1             	mov    rcx,rax
  4014c6:	83 c0 01             	add    eax,0x1
  4014c9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
  4014cc:	eb df                	jmp    0x4014ad
  4014ce:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4014d1:	48 63 c0             	movsxd rax,eax
  4014d4:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  4014d8:	48 01 c1             	add    rcx,rax
  4014db:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  4014de:	81 e0 ff 00 00 00    	and    eax,0xff
  4014e4:	49 89 c2             	mov    r10,rax
  4014e7:	4c 89 d1             	mov    rcx,r10
  4014ea:	e8 de fc ff ff       	call   0x4011cd
  4014ef:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
  4014f2:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
  4014f5:	83 c0 03             	add    eax,0x3
  4014f8:	8b 4d dc             	mov    ecx,DWORD PTR [rbp-0x24]
  4014fb:	0f af c8             	imul   ecx,eax
  4014fe:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401501:	01 c8                	add    eax,ecx
  401503:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  401506:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  401509:	b9 21 00 00 00       	mov    ecx,0x21
  40150e:	0f af c1             	imul   eax,ecx
  401511:	83 c0 17             	add    eax,0x17
  401514:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  401517:	eb a7                	jmp    0x4014c0
  401519:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  40151d:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  401520:	81 e1 ff ff 00 00    	and    ecx,0xffff
  401526:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
  401529:	31 ca                	xor    edx,ecx
  40152b:	81 f2 a1 17 00 00    	xor    edx,0x17a1
  401531:	81 e2 ff ff 00 00    	and    edx,0xffff
  401537:	66 89 10             	mov    WORD PTR [rax],dx
  40153a:	c9                   	leave
  40153b:	c3                   	ret
  40153c:	55                   	push   rbp
  40153d:	48 89 e5             	mov    rbp,rsp
  401540:	48 81 ec 00 00 00 00 	sub    rsp,0x0
  401547:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  40154b:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  40154e:	83 f8 30             	cmp    eax,0x30
  401551:	0f 8c 17 00 00 00    	jl     0x40156e
  401557:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  40155a:	83 f8 39             	cmp    eax,0x39
  40155d:	0f 8f 0b 00 00 00    	jg     0x40156e
  401563:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  401566:	83 e8 30             	sub    eax,0x30
  401569:	e9 51 00 00 00       	jmp    0x4015bf
  40156e:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  401571:	83 f8 41             	cmp    eax,0x41
  401574:	0f 8c 1a 00 00 00    	jl     0x401594
  40157a:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  40157d:	83 f8 46             	cmp    eax,0x46
  401580:	0f 8f 0e 00 00 00    	jg     0x401594
  401586:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  401589:	83 e8 41             	sub    eax,0x41
  40158c:	83 c0 0a             	add    eax,0xa
  40158f:	e9 2b 00 00 00       	jmp    0x4015bf
  401594:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  401597:	83 f8 61             	cmp    eax,0x61
  40159a:	0f 8c 1a 00 00 00    	jl     0x4015ba
  4015a0:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4015a3:	83 f8 66             	cmp    eax,0x66
  4015a6:	0f 8f 0e 00 00 00    	jg     0x4015ba
  4015ac:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4015af:	83 e8 61             	sub    eax,0x61
  4015b2:	83 c0 0a             	add    eax,0xa
  4015b5:	e9 05 00 00 00       	jmp    0x4015bf
  4015ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
  4015bf:	c9                   	leave
  4015c0:	c3                   	ret
  4015c1:	55                   	push   rbp
  4015c2:	48 89 e5             	mov    rbp,rsp
  4015c5:	48 81 ec 30 00 00 00 	sub    rsp,0x30
  4015cc:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4015d0:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  4015d4:	b8 00 00 00 00       	mov    eax,0x0
  4015d9:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  4015dc:	b8 00 00 00 00       	mov    eax,0x0
  4015e1:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  4015e4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  4015e7:	83 f8 04             	cmp    eax,0x4
  4015ea:	0f 8d 5d 00 00 00    	jge    0x40164d
  4015f0:	e9 0e 00 00 00       	jmp    0x401603
  4015f5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  4015f8:	48 89 c1             	mov    rcx,rax
  4015fb:	83 c0 01             	add    eax,0x1
  4015fe:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  401601:	eb e1                	jmp    0x4015e4
  401603:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401606:	48 63 c0             	movsxd rax,eax
  401609:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  40160d:	48 01 c1             	add    rcx,rax
  401610:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  401613:	81 e0 ff 00 00 00    	and    eax,0xff
  401619:	49 89 c2             	mov    r10,rax
  40161c:	4c 89 d1             	mov    rcx,r10
  40161f:	e8 18 ff ff ff       	call   0x40153c
  401624:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
  401627:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
  40162a:	83 f8 00             	cmp    eax,0x0
  40162d:	0f 8d 0a 00 00 00    	jge    0x40163d
  401633:	b8 00 00 00 00       	mov    eax,0x0
  401638:	e9 25 00 00 00       	jmp    0x401662
  40163d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401640:	c1 e0 04             	shl    eax,0x4
  401643:	8b 4d f4             	mov    ecx,DWORD PTR [rbp-0xc]
  401646:	09 c8                	or     eax,ecx
  401648:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  40164b:	eb a8                	jmp    0x4015f5
  40164d:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
  401651:	8b 4d fc             	mov    ecx,DWORD PTR [rbp-0x4]
  401654:	81 e1 ff ff 00 00    	and    ecx,0xffff
  40165a:	66 89 08             	mov    WORD PTR [rax],cx
  40165d:	b8 01 00 00 00       	mov    eax,0x1
  401662:	c9                   	leave
  401663:	c3                   	ret
  401664:	55                   	push   rbp
  401665:	48 89 e5             	mov    rbp,rsp
  401668:	48 81 ec 30 00 00 00 	sub    rsp,0x30
  40166f:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401673:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401677:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  40167b:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
  40167f:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  401682:	83 f8 11             	cmp    eax,0x11
  401685:	0f 84 0a 00 00 00    	je     0x401695
  40168b:	b8 00 00 00 00       	mov    eax,0x0
  401690:	e9 16 01 00 00       	jmp    0x4017ab
  401695:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  401699:	0f be 08             	movsx  ecx,BYTE PTR [rax]
  40169c:	83 f9 4d             	cmp    ecx,0x4d
  40169f:	0f 85 55 00 00 00    	jne    0x4016fa
  4016a5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  4016a9:	48 83 c0 01          	add    rax,0x1
  4016ad:	0f be 08             	movsx  ecx,BYTE PTR [rax]
  4016b0:	83 f9 4c             	cmp    ecx,0x4c
  4016b3:	0f 85 41 00 00 00    	jne    0x4016fa
  4016b9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  4016bd:	48 83 c0 02          	add    rax,0x2
  4016c1:	0f be 08             	movsx  ecx,BYTE PTR [rax]
  4016c4:	83 f9 2d             	cmp    ecx,0x2d
  4016c7:	0f 85 2d 00 00 00    	jne    0x4016fa
  4016cd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  4016d1:	48 83 c0 07          	add    rax,0x7
  4016d5:	0f be 08             	movsx  ecx,BYTE PTR [rax]
  4016d8:	83 f9 2d             	cmp    ecx,0x2d
  4016db:	0f 85 19 00 00 00    	jne    0x4016fa
  4016e1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  4016e5:	48 83 c0 0c          	add    rax,0xc
  4016e9:	0f be 08             	movsx  ecx,BYTE PTR [rax]
  4016ec:	83 f9 2d             	cmp    ecx,0x2d
  4016ef:	0f 85 05 00 00 00    	jne    0x4016fa
  4016f5:	e9 0a 00 00 00       	jmp    0x401704
  4016fa:	b8 00 00 00 00       	mov    eax,0x0
  4016ff:	e9 a7 00 00 00       	jmp    0x4017ab
  401704:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  401708:	48 83 c0 03          	add    rax,0x3
  40170c:	48 8d 4d fe          	lea    rcx,[rbp-0x2]
  401710:	49 89 cb             	mov    r11,rcx
  401713:	49 89 c2             	mov    r10,rax
  401716:	4c 89 d1             	mov    rcx,r10
  401719:	4c 89 da             	mov    rdx,r11
  40171c:	e8 a0 fe ff ff       	call   0x4015c1
  401721:	83 f8 00             	cmp    eax,0x0
  401724:	0f 84 51 00 00 00    	je     0x40177b
  40172a:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  40172e:	48 83 c0 08          	add    rax,0x8
  401732:	48 8d 4d fc          	lea    rcx,[rbp-0x4]
  401736:	49 89 cb             	mov    r11,rcx
  401739:	49 89 c2             	mov    r10,rax
  40173c:	4c 89 d1             	mov    rcx,r10
  40173f:	4c 89 da             	mov    rdx,r11
  401742:	e8 7a fe ff ff       	call   0x4015c1
  401747:	83 f8 00             	cmp    eax,0x0
  40174a:	0f 84 2b 00 00 00    	je     0x40177b
  401750:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  401754:	48 83 c0 0d          	add    rax,0xd
  401758:	48 8d 4d fa          	lea    rcx,[rbp-0x6]
  40175c:	49 89 cb             	mov    r11,rcx
  40175f:	49 89 c2             	mov    r10,rax
  401762:	4c 89 d1             	mov    rcx,r10
  401765:	4c 89 da             	mov    rdx,r11
  401768:	e8 54 fe ff ff       	call   0x4015c1
  40176d:	83 f8 00             	cmp    eax,0x0
  401770:	0f 84 05 00 00 00    	je     0x40177b
  401776:	e9 0a 00 00 00       	jmp    0x401785
  40177b:	b8 00 00 00 00       	mov    eax,0x0
  401780:	e9 26 00 00 00       	jmp    0x4017ab
  401785:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
  401789:	0f b7 4d fe          	movzx  ecx,WORD PTR [rbp-0x2]
  40178d:	66 89 08             	mov    WORD PTR [rax],cx
  401790:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
  401794:	0f b7 4d fc          	movzx  ecx,WORD PTR [rbp-0x4]
  401798:	66 89 08             	mov    WORD PTR [rax],cx
  40179b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
  40179f:	0f b7 4d fa          	movzx  ecx,WORD PTR [rbp-0x6]
  4017a3:	66 89 08             	mov    WORD PTR [rax],cx
  4017a6:	b8 01 00 00 00       	mov    eax,0x1
  4017ab:	c9                   	leave
  4017ac:	c3                   	ret
  4017ad:	55                   	push   rbp
  4017ae:	48 89 e5             	mov    rbp,rsp
  4017b1:	48 81 ec 00 00 00 00 	sub    rsp,0x0
  4017b8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4017bc:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  4017c0:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  4017c4:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4017c7:	c1 e0 10             	shl    eax,0x10
  4017ca:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  4017cd:	c1 e1 08             	shl    ecx,0x8
  4017d0:	31 c8                	xor    eax,ecx
  4017d2:	8b 4d 20             	mov    ecx,DWORD PTR [rbp+0x20]
  4017d5:	31 c8                	xor    eax,ecx
  4017d7:	81 f0 01 4c 7e a1    	xor    eax,0xa17e4c01
  4017dd:	c9                   	leave
  4017de:	c3                   	ret
  4017df:	55                   	push   rbp
  4017e0:	48 89 e5             	mov    rbp,rsp
  4017e3:	48 81 ec 10 00 00 00 	sub    rsp,0x10
  4017ea:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4017ee:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  4017f2:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  4017f6:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
  4017fa:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  4017fd:	c1 e0 10             	shl    eax,0x10
  401800:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  401803:	c1 e1 08             	shl    ecx,0x8
  401806:	31 c8                	xor    eax,ecx
  401808:	8b 4d 20             	mov    ecx,DWORD PTR [rbp+0x20]
  40180b:	31 c8                	xor    eax,ecx
  40180d:	81 f0 17 5a a5 c3    	xor    eax,0xc3a55a17
  401813:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401816:	b8 00 00 00 00       	mov    eax,0x0
  40181b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40181e:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401821:	8b 4d 30             	mov    ecx,DWORD PTR [rbp+0x30]
  401824:	39 c8                	cmp    eax,ecx
  401826:	0f 8d 44 00 00 00    	jge    0x401870
  40182c:	e9 0e 00 00 00       	jmp    0x40183f
  401831:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401834:	48 89 c1             	mov    rcx,rax
  401837:	83 c0 01             	add    eax,0x1
  40183a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
  40183d:	eb df                	jmp    0x40181e
  40183f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401842:	b9 0d 66 19 00       	mov    ecx,0x19660d
  401847:	0f af c1             	imul   eax,ecx
  40184a:	81 c0 5f f3 6e 3c    	add    eax,0x3c6ef35f
  401850:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401853:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
  401856:	48 63 c0             	movsxd rax,eax
  401859:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
  40185d:	48 01 c1             	add    rcx,rax
  401860:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401863:	c1 e8 10             	shr    eax,0x10
  401866:	81 e0 ff 00 00 00    	and    eax,0xff
  40186c:	88 01                	mov    BYTE PTR [rcx],al
  40186e:	eb c1                	jmp    0x401831
  401870:	c9                   	leave
  401871:	c3                   	ret
  401872:	55                   	push   rbp
  401873:	48 89 e5             	mov    rbp,rsp
  401876:	48 81 ec 10 00 00 00 	sub    rsp,0x10
  40187d:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401881:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401885:	b8 00 00 00 00       	mov    eax,0x0
  40188a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  40188d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401890:	83 f8 08             	cmp    eax,0x8
  401893:	0f 8d 51 00 00 00    	jge    0x4018ea
  401899:	e9 0e 00 00 00       	jmp    0x4018ac
  40189e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4018a1:	48 89 c1             	mov    rcx,rax
  4018a4:	83 c0 01             	add    eax,0x1
  4018a7:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  4018aa:	eb e1                	jmp    0x40188d
  4018ac:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4018af:	48 63 c0             	movsxd rax,eax
  4018b2:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  4018b6:	48 01 c1             	add    rcx,rax
  4018b9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  4018bc:	c1 e0 02             	shl    eax,0x2
  4018bf:	ba 1c 00 00 00       	mov    edx,0x1c
  4018c4:	29 c2                	sub    edx,eax
  4018c6:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
  4018c9:	48 89 4d f0          	mov    QWORD PTR [rbp-0x10],rcx
  4018cd:	48 89 d1             	mov    rcx,rdx
  4018d0:	d3 e8                	shr    eax,cl
  4018d2:	83 e0 0f             	and    eax,0xf
  4018d5:	48 8d 0d 60 09 00 00 	lea    rcx,[rip+0x960]        # 0x40223c
  4018dc:	48 01 c1             	add    rcx,rax
  4018df:	0f be 01             	movsx  eax,BYTE PTR [rcx]
  4018e2:	48 8b 4d f0          	mov    rcx,QWORD PTR [rbp-0x10]
  4018e6:	88 01                	mov    BYTE PTR [rcx],al
  4018e8:	eb b4                	jmp    0x40189e
  4018ea:	c9                   	leave
  4018eb:	c3                   	ret
  4018ec:	55                   	push   rbp
  4018ed:	48 89 e5             	mov    rbp,rsp
  4018f0:	48 81 ec b0 00 00 00 	sub    rsp,0xb0
  4018f7:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4018fb:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  4018ff:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  401903:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
  401907:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
  40190a:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
  40190d:	31 c8                	xor    eax,ecx
  40190f:	8b 4d 18             	mov    ecx,DWORD PTR [rbp+0x18]
  401912:	8b 55 30             	mov    edx,DWORD PTR [rbp+0x30]
  401915:	31 d1                	xor    ecx,edx
  401917:	09 c8                	or     eax,ecx
  401919:	8b 4d 20             	mov    ecx,DWORD PTR [rbp+0x20]
  40191c:	8b 55 38             	mov    edx,DWORD PTR [rbp+0x38]
  40191f:	31 d1                	xor    ecx,edx
  401921:	09 c8                	or     eax,ecx
  401923:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401926:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
  401929:	83 f8 00             	cmp    eax,0x0
  40192c:	0f 84 17 00 00 00    	je     0x401949
  401932:	48 8d 05 14 09 00 00 	lea    rax,[rip+0x914]        # 0x40224d
  401939:	49 89 c2             	mov    r10,rax
  40193c:	4c 89 d1             	mov    rcx,r10
  40193f:	e8 1c f7 ff ff       	call   0x401060
  401944:	e9 eb 01 00 00       	jmp    0x401b34
  401949:	b8 20 00 00 00       	mov    eax,0x20
  40194e:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401953:	48 8d 45 dc          	lea    rax,[rbp-0x24]
  401957:	49 89 c1             	mov    r9,rax
  40195a:	0f b7 45 38          	movzx  eax,WORD PTR [rbp+0x38]
  40195e:	49 89 c0             	mov    r8,rax
  401961:	0f b7 45 30          	movzx  eax,WORD PTR [rbp+0x30]
  401965:	49 89 c3             	mov    r11,rax
  401968:	0f b7 45 28          	movzx  eax,WORD PTR [rbp+0x28]
  40196c:	49 89 c2             	mov    r10,rax
  40196f:	4c 89 d1             	mov    rcx,r10
  401972:	4c 89 da             	mov    rdx,r11
  401975:	e8 65 fe ff ff       	call   0x4017df
  40197a:	b8 20 00 00 00       	mov    eax,0x20
  40197f:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401984:	48 8d 45 bc          	lea    rax,[rbp-0x44]
  401988:	49 89 c1             	mov    r9,rax
  40198b:	0f b7 45 20          	movzx  eax,WORD PTR [rbp+0x20]
  40198f:	49 89 c0             	mov    r8,rax
  401992:	0f b7 45 18          	movzx  eax,WORD PTR [rbp+0x18]
  401996:	49 89 c3             	mov    r11,rax
  401999:	0f b7 45 10          	movzx  eax,WORD PTR [rbp+0x10]
  40199d:	49 89 c2             	mov    r10,rax
  4019a0:	4c 89 d1             	mov    rcx,r10
  4019a3:	4c 89 da             	mov    rdx,r11
  4019a6:	e8 34 fe ff ff       	call   0x4017df
  4019ab:	b8 00 00 00 00       	mov    eax,0x0
  4019b0:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
  4019b3:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  4019b6:	83 f8 1c             	cmp    eax,0x1c
  4019b9:	0f 8d 6c 00 00 00    	jge    0x401a2b
  4019bf:	e9 0e 00 00 00       	jmp    0x4019d2
  4019c4:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  4019c7:	48 89 c1             	mov    rcx,rax
  4019ca:	83 c0 01             	add    eax,0x1
  4019cd:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
  4019d0:	eb e1                	jmp    0x4019b3
  4019d2:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  4019d5:	48 63 c0             	movsxd rax,eax
  4019d8:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
  4019dc:	48 01 c1             	add    rcx,rax
  4019df:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  4019e2:	48 63 c0             	movsxd rax,eax
  4019e5:	48 8d 15 14 06 00 00 	lea    rdx,[rip+0x614]        # 0x402000
  4019ec:	48 01 c2             	add    rdx,rax
  4019ef:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  4019f2:	83 f0 6b             	xor    eax,0x6b
  4019f5:	8b 55 90             	mov    edx,DWORD PTR [rbp-0x70]
  4019f8:	48 63 d2             	movsxd rdx,edx
  4019fb:	48 89 4d 88          	mov    QWORD PTR [rbp-0x78],rcx
  4019ff:	48 8d 4d dc          	lea    rcx,[rbp-0x24]
  401a03:	48 01 d1             	add    rcx,rdx
  401a06:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  401a09:	31 d0                	xor    eax,edx
  401a0b:	8b 4d 90             	mov    ecx,DWORD PTR [rbp-0x70]
  401a0e:	48 63 c9             	movsxd rcx,ecx
  401a11:	48 8d 55 bc          	lea    rdx,[rbp-0x44]
  401a15:	48 01 ca             	add    rdx,rcx
  401a18:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
  401a1b:	31 c8                	xor    eax,ecx
  401a1d:	81 e0 ff 00 00 00    	and    eax,0xff
  401a23:	48 8b 4d 88          	mov    rcx,QWORD PTR [rbp-0x78]
  401a27:	88 01                	mov    BYTE PTR [rcx],al
  401a29:	eb 99                	jmp    0x4019c4
  401a2b:	b8 00 00 00 00       	mov    eax,0x0
  401a30:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
  401a33:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  401a36:	83 f8 04             	cmp    eax,0x4
  401a39:	0f 8d 72 00 00 00    	jge    0x401ab1
  401a3f:	e9 0e 00 00 00       	jmp    0x401a52
  401a44:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  401a47:	48 89 c1             	mov    rcx,rax
  401a4a:	83 c0 01             	add    eax,0x1
  401a4d:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
  401a50:	eb e1                	jmp    0x401a33
  401a52:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  401a55:	48 63 c0             	movsxd rax,eax
  401a58:	48 8d 4d 9c          	lea    rcx,[rbp-0x64]
  401a5c:	48 01 c1             	add    rcx,rax
  401a5f:	8b 45 90             	mov    eax,DWORD PTR [rbp-0x70]
  401a62:	48 63 c0             	movsxd rax,eax
  401a65:	48 8d 15 b0 05 00 00 	lea    rdx,[rip+0x5b0]        # 0x40201c
  401a6c:	48 01 c2             	add    rdx,rax
  401a6f:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
  401a72:	83 f0 6b             	xor    eax,0x6b
  401a75:	8b 55 90             	mov    edx,DWORD PTR [rbp-0x70]
  401a78:	83 c2 1c             	add    edx,0x1c
  401a7b:	48 63 d2             	movsxd rdx,edx
  401a7e:	48 89 4d 80          	mov    QWORD PTR [rbp-0x80],rcx
  401a82:	48 8d 4d dc          	lea    rcx,[rbp-0x24]
  401a86:	48 01 d1             	add    rcx,rdx
  401a89:	0f b6 11             	movzx  edx,BYTE PTR [rcx]
  401a8c:	31 d0                	xor    eax,edx
  401a8e:	8b 4d 90             	mov    ecx,DWORD PTR [rbp-0x70]
  401a91:	83 c1 1c             	add    ecx,0x1c
  401a94:	48 63 c9             	movsxd rcx,ecx
  401a97:	48 8d 55 bc          	lea    rdx,[rbp-0x44]
  401a9b:	48 01 ca             	add    rdx,rcx
  401a9e:	0f b6 0a             	movzx  ecx,BYTE PTR [rdx]
  401aa1:	31 c8                	xor    eax,ecx
  401aa3:	81 e0 ff 00 00 00    	and    eax,0xff
  401aa9:	48 8b 4d 80          	mov    rcx,QWORD PTR [rbp-0x80]
  401aad:	88 01                	mov    BYTE PTR [rcx],al
  401aaf:	eb 93                	jmp    0x401a44
  401ab1:	0f b7 45 38          	movzx  eax,WORD PTR [rbp+0x38]
  401ab5:	49 89 c0             	mov    r8,rax
  401ab8:	0f b7 45 30          	movzx  eax,WORD PTR [rbp+0x30]
  401abc:	49 89 c3             	mov    r11,rax
  401abf:	0f b7 45 28          	movzx  eax,WORD PTR [rbp+0x28]
  401ac3:	49 89 c2             	mov    r10,rax
  401ac6:	4c 89 d1             	mov    rcx,r10
  401ac9:	4c 89 da             	mov    rdx,r11
  401acc:	e8 dc fc ff ff       	call   0x4017ad
  401ad1:	49 89 c3             	mov    r11,rax
  401ad4:	48 8d 45 94          	lea    rax,[rbp-0x6c]
  401ad8:	49 89 c2             	mov    r10,rax
  401adb:	4c 89 d1             	mov    rcx,r10
  401ade:	4c 89 da             	mov    rdx,r11
  401ae1:	e8 8c fd ff ff       	call   0x401872
  401ae6:	b8 1c 00 00 00       	mov    eax,0x1c
  401aeb:	49 89 c3             	mov    r11,rax
  401aee:	48 8d 45 a0          	lea    rax,[rbp-0x60]
  401af2:	49 89 c2             	mov    r10,rax
  401af5:	4c 89 d1             	mov    rcx,r10
  401af8:	4c 89 da             	mov    rdx,r11
  401afb:	e8 00 f5 ff ff       	call   0x401000
  401b00:	b8 08 00 00 00       	mov    eax,0x8
  401b05:	49 89 c3             	mov    r11,rax
  401b08:	48 8d 45 94          	lea    rax,[rbp-0x6c]
  401b0c:	49 89 c2             	mov    r10,rax
  401b0f:	4c 89 d1             	mov    rcx,r10
  401b12:	4c 89 da             	mov    rdx,r11
  401b15:	e8 e6 f4 ff ff       	call   0x401000
  401b1a:	b8 04 00 00 00       	mov    eax,0x4
  401b1f:	49 89 c3             	mov    r11,rax
  401b22:	48 8d 45 9c          	lea    rax,[rbp-0x64]
  401b26:	49 89 c2             	mov    r10,rax
  401b29:	4c 89 d1             	mov    rcx,r10
  401b2c:	4c 89 da             	mov    rdx,r11
  401b2f:	e8 cc f4 ff ff       	call   0x401000
  401b34:	c9                   	leave
  401b35:	c3                   	ret
  401b36:	55                   	push   rbp
  401b37:	48 89 e5             	mov    rbp,rsp
  401b3a:	48 81 ec f0 00 00 00 	sub    rsp,0xf0
  401b41:	b8 00 00 00 00       	mov    eax,0x0
  401b46:	89 85 5c ff ff ff    	mov    DWORD PTR [rbp-0xa4],eax
  401b4c:	b8 00 00 00 00       	mov    eax,0x0
  401b51:	89 85 58 ff ff ff    	mov    DWORD PTR [rbp-0xa8],eax
  401b57:	b8 f5 ff ff ff       	mov    eax,0xfffffff5
  401b5c:	49 89 c2             	mov    r10,rax
  401b5f:	4c 89 d1             	mov    rcx,r10
  401b62:	e8 d1 03 00 00       	call   0x401f38
  401b67:	48 89 05 22 09 00 00 	mov    QWORD PTR [rip+0x922],rax        # 0x402490
  401b6e:	b8 f6 ff ff ff       	mov    eax,0xfffffff6
  401b73:	49 89 c2             	mov    r10,rax
  401b76:	4c 89 d1             	mov    rcx,r10
  401b79:	e8 ba 03 00 00       	call   0x401f38
  401b7e:	48 89 05 13 09 00 00 	mov    QWORD PTR [rip+0x913],rax        # 0x402498
  401b85:	48 8d 05 94 04 00 00 	lea    rax,[rip+0x494]        # 0x402020
  401b8c:	49 89 c2             	mov    r10,rax
  401b8f:	4c 89 d1             	mov    rcx,r10
  401b92:	e8 c9 f4 ff ff       	call   0x401060
  401b97:	48 8d 05 d5 06 00 00 	lea    rax,[rip+0x6d5]        # 0x402273
  401b9e:	49 89 c2             	mov    r10,rax
  401ba1:	4c 89 d1             	mov    rcx,r10
  401ba4:	e8 b7 f4 ff ff       	call   0x401060
  401ba9:	48 8d 85 5c ff ff ff 	lea    rax,[rbp-0xa4]
  401bb0:	49 89 c0             	mov    r8,rax
  401bb3:	b8 50 00 00 00       	mov    eax,0x50
  401bb8:	49 89 c3             	mov    r11,rax
  401bbb:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  401bbf:	49 89 c2             	mov    r10,rax
  401bc2:	4c 89 d1             	mov    rcx,r10
  401bc5:	4c 89 da             	mov    rdx,r11
  401bc8:	e8 e8 f4 ff ff       	call   0x4010b5
  401bcd:	89 85 54 ff ff ff    	mov    DWORD PTR [rbp-0xac],eax
  401bd3:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  401bd9:	83 f8 00             	cmp    eax,0x0
  401bdc:	0f 85 36 00 00 00    	jne    0x401c18
  401be2:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  401be8:	83 f8 00             	cmp    eax,0x0
  401beb:	0f 84 05 00 00 00    	je     0x401bf6
  401bf1:	e9 22 00 00 00       	jmp    0x401c18
  401bf6:	48 8d 05 7d 06 00 00 	lea    rax,[rip+0x67d]        # 0x40227a
  401bfd:	49 89 c2             	mov    r10,rax
  401c00:	4c 89 d1             	mov    rcx,r10
  401c03:	e8 58 f4 ff ff       	call   0x401060
  401c08:	b8 00 00 00 00       	mov    eax,0x0
  401c0d:	49 89 c2             	mov    r10,rax
  401c10:	4c 89 d1             	mov    rcx,r10
  401c13:	e8 28 03 00 00       	call   0x401f40
  401c18:	8b 85 5c ff ff ff    	mov    eax,DWORD PTR [rbp-0xa4]
  401c1e:	83 f8 00             	cmp    eax,0x0
  401c21:	0f 85 29 00 00 00    	jne    0x401c50
  401c27:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  401c2d:	49 89 c3             	mov    r11,rax
  401c30:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  401c34:	49 89 c2             	mov    r10,rax
  401c37:	4c 89 d1             	mov    rcx,r10
  401c3a:	4c 89 da             	mov    rdx,r11
  401c3d:	e8 c2 f5 ff ff       	call   0x401204
  401c42:	83 f8 00             	cmp    eax,0x0
  401c45:	0f 84 05 00 00 00    	je     0x401c50
  401c4b:	e9 22 00 00 00       	jmp    0x401c72
  401c50:	48 8d 05 39 06 00 00 	lea    rax,[rip+0x639]        # 0x402290
  401c57:	49 89 c2             	mov    r10,rax
  401c5a:	4c 89 d1             	mov    rcx,r10
  401c5d:	e8 fe f3 ff ff       	call   0x401060
  401c62:	b8 00 00 00 00       	mov    eax,0x0
  401c67:	49 89 c2             	mov    r10,rax
  401c6a:	4c 89 d1             	mov    rcx,r10
  401c6d:	e8 ce 02 00 00       	call   0x401f40
  401c72:	48 8d 05 3c 06 00 00 	lea    rax,[rip+0x63c]        # 0x4022b5
  401c79:	49 89 c2             	mov    r10,rax
  401c7c:	4c 89 d1             	mov    rcx,r10
  401c7f:	e8 dc f3 ff ff       	call   0x401060
  401c84:	48 8d 85 58 ff ff ff 	lea    rax,[rbp-0xa8]
  401c8b:	49 89 c0             	mov    r8,rax
  401c8e:	b8 50 00 00 00       	mov    eax,0x50
  401c93:	49 89 c3             	mov    r11,rax
  401c96:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  401c9d:	49 89 c2             	mov    r10,rax
  401ca0:	4c 89 d1             	mov    rcx,r10
  401ca3:	4c 89 da             	mov    rdx,r11
  401ca6:	e8 0a f4 ff ff       	call   0x4010b5
  401cab:	89 85 50 ff ff ff    	mov    DWORD PTR [rbp-0xb0],eax
  401cb1:	8b 85 58 ff ff ff    	mov    eax,DWORD PTR [rbp-0xa8]
  401cb7:	83 f8 00             	cmp    eax,0x0
  401cba:	0f 85 4c 00 00 00    	jne    0x401d0c
  401cc0:	48 8d 85 44 ff ff ff 	lea    rax,[rbp-0xbc]
  401cc7:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401ccc:	48 8d 85 46 ff ff ff 	lea    rax,[rbp-0xba]
  401cd3:	49 89 c1             	mov    r9,rax
  401cd6:	48 8d 85 48 ff ff ff 	lea    rax,[rbp-0xb8]
  401cdd:	49 89 c0             	mov    r8,rax
  401ce0:	8b 85 50 ff ff ff    	mov    eax,DWORD PTR [rbp-0xb0]
  401ce6:	49 89 c3             	mov    r11,rax
  401ce9:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
  401cf0:	49 89 c2             	mov    r10,rax
  401cf3:	4c 89 d1             	mov    rcx,r10
  401cf6:	4c 89 da             	mov    rdx,r11
  401cf9:	e8 66 f9 ff ff       	call   0x401664
  401cfe:	83 f8 00             	cmp    eax,0x0
  401d01:	0f 84 05 00 00 00    	je     0x401d0c
  401d07:	e9 22 00 00 00       	jmp    0x401d2e
  401d0c:	48 8d 05 ab 05 00 00 	lea    rax,[rip+0x5ab]        # 0x4022be
  401d13:	49 89 c2             	mov    r10,rax
  401d16:	4c 89 d1             	mov    rcx,r10
  401d19:	e8 42 f3 ff ff       	call   0x401060
  401d1e:	b8 00 00 00 00       	mov    eax,0x0
  401d23:	49 89 c2             	mov    r10,rax
  401d26:	4c 89 d1             	mov    rcx,r10
  401d29:	e8 12 02 00 00       	call   0x401f40
  401d2e:	48 8d 85 4a ff ff ff 	lea    rax,[rbp-0xb6]
  401d35:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401d3a:	48 8d 85 4c ff ff ff 	lea    rax,[rbp-0xb4]
  401d41:	49 89 c1             	mov    r9,rax
  401d44:	48 8d 85 4e ff ff ff 	lea    rax,[rbp-0xb2]
  401d4b:	49 89 c0             	mov    r8,rax
  401d4e:	8b 85 54 ff ff ff    	mov    eax,DWORD PTR [rbp-0xac]
  401d54:	49 89 c3             	mov    r11,rax
  401d57:	48 8d 45 b0          	lea    rax,[rbp-0x50]
  401d5b:	49 89 c2             	mov    r10,rax
  401d5e:	4c 89 d1             	mov    rcx,r10
  401d61:	4c 89 da             	mov    rdx,r11
  401d64:	e8 cd f5 ff ff       	call   0x401336
  401d69:	0f b7 85 44 ff ff ff 	movzx  eax,WORD PTR [rbp-0xbc]
  401d70:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  401d75:	0f b7 85 46 ff ff ff 	movzx  eax,WORD PTR [rbp-0xba]
  401d7c:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401d81:	0f b7 85 48 ff ff ff 	movzx  eax,WORD PTR [rbp-0xb8]
  401d88:	49 89 c1             	mov    r9,rax
  401d8b:	0f b7 85 4a ff ff ff 	movzx  eax,WORD PTR [rbp-0xb6]
  401d92:	49 89 c0             	mov    r8,rax
  401d95:	0f b7 85 4c ff ff ff 	movzx  eax,WORD PTR [rbp-0xb4]
  401d9c:	49 89 c3             	mov    r11,rax
  401d9f:	0f b7 85 4e ff ff ff 	movzx  eax,WORD PTR [rbp-0xb2]
  401da6:	49 89 c2             	mov    r10,rax
  401da9:	4c 89 d1             	mov    rcx,r10
  401dac:	4c 89 da             	mov    rdx,r11
  401daf:	e8 38 fb ff ff       	call   0x4018ec
  401db4:	b8 00 00 00 00       	mov    eax,0x0
  401db9:	49 89 c2             	mov    r10,rax
  401dbc:	4c 89 d1             	mov    rcx,r10
  401dbf:	e8 7c 01 00 00       	call   0x401f40
  401dc4:	b8 00 00 00 00       	mov    eax,0x0
  401dc9:	c9                   	leave
  401dca:	c3                   	ret
  401dcb:	00 00                	add    BYTE PTR [rax],al
  401dcd:	00 00                	add    BYTE PTR [rax],al
  401dcf:	00 55 48             	add    BYTE PTR [rbp+0x48],dl
  401dd2:	89 e5                	mov    ebp,esp
  401dd4:	48 81 ec 50 00 00 00 	sub    rsp,0x50
  401ddb:	b8 00 00 00 00       	mov    eax,0x0
  401de0:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
  401de3:	b8 01 00 00 00       	mov    eax,0x1
  401de8:	49 89 c2             	mov    r10,rax
  401deb:	4c 89 d1             	mov    rcx,r10
  401dee:	e8 55 01 00 00       	call   0x401f48
  401df3:	b8 00 00 03 00       	mov    eax,0x30000
  401df8:	49 89 c3             	mov    r11,rax
  401dfb:	b8 00 00 01 00       	mov    eax,0x10000
  401e00:	49 89 c2             	mov    r10,rax
  401e03:	4c 89 d1             	mov    rcx,r10
  401e06:	4c 89 da             	mov    rdx,r11
  401e09:	e8 42 01 00 00       	call   0x401f50
  401e0e:	48 8b 05 3f 05 00 00 	mov    rax,QWORD PTR [rip+0x53f]        # 0x402354
  401e15:	48 8b 0d 40 05 00 00 	mov    rcx,QWORD PTR [rip+0x540]        # 0x40235c
  401e1c:	48 8b 15 41 05 00 00 	mov    rdx,QWORD PTR [rip+0x541]        # 0x402364
  401e23:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
  401e27:	48 8d 45 fc          	lea    rax,[rbp-0x4]
  401e2b:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401e30:	8b 05 6a 06 00 00    	mov    eax,DWORD PTR [rip+0x66a]        # 0x4024a0
  401e36:	49 89 c1             	mov    r9,rax
  401e39:	49 89 d0             	mov    r8,rdx
  401e3c:	49 89 cb             	mov    r11,rcx
  401e3f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
  401e43:	49 89 c2             	mov    r10,rax
  401e46:	4c 89 d1             	mov    rcx,r10
  401e49:	4c 89 da             	mov    rdx,r11
  401e4c:	e8 07 01 00 00       	call   0x401f58
  401e51:	48 8b 05 fc 04 00 00 	mov    rax,QWORD PTR [rip+0x4fc]        # 0x402354
  401e58:	48 8b 0d fd 04 00 00 	mov    rcx,QWORD PTR [rip+0x4fd]        # 0x40235c
  401e5f:	48 8b 15 fe 04 00 00 	mov    rdx,QWORD PTR [rip+0x4fe]        # 0x402364
  401e66:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
  401e6a:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  401e6d:	49 89 c0             	mov    r8,rax
  401e70:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  401e73:	49 89 c3             	mov    r11,rax
  401e76:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
  401e7a:	8b 00                	mov    eax,DWORD PTR [rax]
  401e7c:	49 89 c2             	mov    r10,rax
  401e7f:	4c 89 d1             	mov    rcx,r10
  401e82:	4c 89 da             	mov    rdx,r11
  401e85:	e8 ac fc ff ff       	call   0x401b36
  401e8a:	49 89 c2             	mov    r10,rax
  401e8d:	4c 89 d1             	mov    rcx,r10
  401e90:	e8 cb 00 00 00       	call   0x401f60
  401e95:	c9                   	leave
  401e96:	c3                   	ret
  401e97:	00 01                	add    BYTE PTR [rcx],al
  401e99:	04 02                	add    al,0x2
  401e9b:	05 04 03 01 50       	add    eax,0x50010304
  401ea0:	55                   	push   rbp
  401ea1:	48 89 e5             	mov    rbp,rsp
  401ea4:	48 81 ec 30 00 00 00 	sub    rsp,0x30
  401eab:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401eaf:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401eb3:	48 8b 05 9a 04 00 00 	mov    rax,QWORD PTR [rip+0x49a]        # 0x402354
  401eba:	8b 4d 10             	mov    ecx,DWORD PTR [rbp+0x10]
  401ebd:	89 08                	mov    DWORD PTR [rax],ecx
  401ebf:	48 8b 05 96 04 00 00 	mov    rax,QWORD PTR [rip+0x496]        # 0x40235c
  401ec6:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
  401eca:	48 89 08             	mov    QWORD PTR [rax],rcx
  401ecd:	b8 00 00 03 00       	mov    eax,0x30000
  401ed2:	49 89 c3             	mov    r11,rax
  401ed5:	b8 00 00 01 00       	mov    eax,0x10000
  401eda:	49 89 c2             	mov    r10,rax
  401edd:	4c 89 d1             	mov    rcx,r10
  401ee0:	4c 89 da             	mov    rdx,r11
  401ee3:	e8 68 00 00 00       	call   0x401f50
  401ee8:	48 8b 05 65 04 00 00 	mov    rax,QWORD PTR [rip+0x465]        # 0x402354
  401eef:	48 8b 0d 66 04 00 00 	mov    rcx,QWORD PTR [rip+0x466]        # 0x40235c
  401ef6:	48 8b 15 67 04 00 00 	mov    rdx,QWORD PTR [rip+0x467]        # 0x402364
  401efd:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
  401f01:	48 8b 02             	mov    rax,QWORD PTR [rdx]
  401f04:	49 89 c0             	mov    r8,rax
  401f07:	48 8b 01             	mov    rax,QWORD PTR [rcx]
  401f0a:	49 89 c3             	mov    r11,rax
  401f0d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
  401f11:	8b 00                	mov    eax,DWORD PTR [rax]
  401f13:	49 89 c2             	mov    r10,rax
  401f16:	4c 89 d1             	mov    rcx,r10
  401f19:	4c 89 da             	mov    rdx,r11
  401f1c:	e8 15 fc ff ff       	call   0x401b36
  401f21:	c9                   	leave
  401f22:	c3                   	ret
  401f23:	00 00                	add    BYTE PTR [rax],al
  401f25:	00 00                	add    BYTE PTR [rax],al
  401f27:	00 ff                	add    bh,bh
  401f29:	25 ee 03 00 00       	and    eax,0x3ee
  401f2e:	00 00                	add    BYTE PTR [rax],al
  401f30:	ff 25 ee 03 00 00    	jmp    QWORD PTR [rip+0x3ee]        # 0x402324
  401f36:	00 00                	add    BYTE PTR [rax],al
  401f38:	ff 25 ee 03 00 00    	jmp    QWORD PTR [rip+0x3ee]        # 0x40232c
  401f3e:	00 00                	add    BYTE PTR [rax],al
  401f40:	ff 25 ee 03 00 00    	jmp    QWORD PTR [rip+0x3ee]        # 0x402334
  401f46:	00 00                	add    BYTE PTR [rax],al
  401f48:	ff 25 f6 03 00 00    	jmp    QWORD PTR [rip+0x3f6]        # 0x402344
  401f4e:	00 00                	add    BYTE PTR [rax],al
  401f50:	ff 25 f6 03 00 00    	jmp    QWORD PTR [rip+0x3f6]        # 0x40234c
  401f56:	00 00                	add    BYTE PTR [rax],al
  401f58:	ff 25 0e 04 00 00    	jmp    QWORD PTR [rip+0x40e]        # 0x40236c
  401f5e:	00 00                	add    BYTE PTR [rax],al
  401f60:	ff 25 0e 04 00 00    	jmp    QWORD PTR [rip+0x40e]        # 0x402374
	...
