
original/PATCHPAD.EXE:     file format pei-x86-64


Disassembly of section .text:

0000000000401000 <.text>:
  401000:	48 83 ec 08          	sub    rsp,0x8
  401004:	48 83 ec 20          	sub    rsp,0x20
  401008:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  40100f:	ff 15 0b 31 00 00    	call   QWORD PTR [rip+0x310b]        # 0x404120
  401015:	48 83 c4 20          	add    rsp,0x20
  401019:	48 89 05 df 26 00 00 	mov    QWORD PTR [rip+0x26df],rax        # 0x4036ff
  401020:	48 89 05 c0 15 00 00 	mov    QWORD PTR [rip+0x15c0],rax        # 0x4025e7
  401027:	b8 50 00 00 00       	mov    eax,0x50
  40102c:	89 05 9d 15 00 00    	mov    DWORD PTR [rip+0x159d],eax        # 0x4025cf
  401032:	48 c7 05 9a 15 00 00 	mov    QWORD PTR [rip+0x159a],0x4012fa        # 0x4025d7
  401039:	fa 12 40 00 
  40103d:	c7 05 8c 15 00 00 03 	mov    DWORD PTR [rip+0x158c],0x3        # 0x4025d3
  401044:	00 00 00 
  401047:	48 83 ec 20          	sub    rsp,0x20
  40104b:	48 8b 0d 95 15 00 00 	mov    rcx,QWORD PTR [rip+0x1595]        # 0x4025e7
  401052:	48 c7 c2 00 7f 00 00 	mov    rdx,0x7f00
  401059:	ff 15 71 32 00 00    	call   QWORD PTR [rip+0x3271]        # 0x4042d0
  40105f:	48 83 c4 20          	add    rsp,0x20
  401063:	48 89 05 85 15 00 00 	mov    QWORD PTR [rip+0x1585],rax        # 0x4025ef
  40106a:	48 89 05 a6 15 00 00 	mov    QWORD PTR [rip+0x15a6],rax        # 0x402617
  401071:	48 83 ec 20          	sub    rsp,0x20
  401075:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  40107c:	48 c7 c2 00 7f 00 00 	mov    rdx,0x7f00
  401083:	ff 15 3f 32 00 00    	call   QWORD PTR [rip+0x323f]        # 0x4042c8
  401089:	48 83 c4 20          	add    rsp,0x20
  40108d:	48 89 05 63 15 00 00 	mov    QWORD PTR [rip+0x1563],rax        # 0x4025f7
  401094:	48 c7 05 60 15 00 00 	mov    QWORD PTR [rip+0x1560],0x10        # 0x4025ff
  40109b:	10 00 00 00 
  40109f:	c7 05 66 15 00 00 43 	mov    DWORD PTR [rip+0x1566],0x402243        # 0x40260f
  4010a6:	22 40 00 
  4010a9:	c7 05 2c 15 00 00 00 	mov    DWORD PTR [rip+0x152c],0x0        # 0x4025df
  4010b0:	00 00 00 
  4010b3:	c7 05 26 15 00 00 00 	mov    DWORD PTR [rip+0x1526],0x0        # 0x4025e3
  4010ba:	00 00 00 
  4010bd:	c7 05 40 15 00 00 00 	mov    DWORD PTR [rip+0x1540],0x0        # 0x402607
  4010c4:	00 00 00 
  4010c7:	48 83 ec 20          	sub    rsp,0x20
  4010cb:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  4010d2:	48 c7 c2 00 7f 00 00 	mov    rdx,0x7f00
  4010d9:	ff 15 e9 31 00 00    	call   QWORD PTR [rip+0x31e9]        # 0x4042c8
  4010df:	48 83 c4 20          	add    rsp,0x20
  4010e3:	48 89 05 0d 15 00 00 	mov    QWORD PTR [rip+0x150d],rax        # 0x4025f7
  4010ea:	c7 05 df 14 00 00 03 	mov    DWORD PTR [rip+0x14df],0x3        # 0x4025d3
  4010f1:	00 00 00 
  4010f4:	48 83 ec 20          	sub    rsp,0x20
  4010f8:	48 c7 c1 cf 25 40 00 	mov    rcx,0x4025cf
  4010ff:	ff 15 eb 31 00 00    	call   QWORD PTR [rip+0x31eb]        # 0x4042f0
  401105:	48 83 c4 20          	add    rsp,0x20
  401109:	48 85 c0             	test   rax,rax
  40110c:	0f 84 7a 01 00 00    	je     0x40128c
  401112:	e8 f7 0a 00 00       	call   0x401c0e
  401117:	48 83 ec 20          	sub    rsp,0x20
  40111b:	48 8b 0d c5 14 00 00 	mov    rcx,QWORD PTR [rip+0x14c5]        # 0x4025e7
  401122:	48 c7 c2 01 00 00 00 	mov    rdx,0x1
  401129:	ff 15 a9 31 00 00    	call   QWORD PTR [rip+0x31a9]        # 0x4042d8
  40112f:	48 83 c4 20          	add    rsp,0x20
  401133:	48 89 05 15 15 00 00 	mov    QWORD PTR [rip+0x1515],rax        # 0x40264f
  40113a:	48 83 ec 60          	sub    rsp,0x60
  40113e:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401145:	48 c7 c2 43 22 40 00 	mov    rdx,0x402243
  40114c:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401153:	49 c7 c1 00 00 cf 00 	mov    r9,0xcf0000
  40115a:	48 b8 00 00 00 80 00 	movabs rax,0x80000000
  401161:	00 00 00 
  401164:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
  401169:	48 b8 00 00 00 80 00 	movabs rax,0x80000000
  401170:	00 00 00 
  401173:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
  401178:	48 c7 44 24 30 bc 02 	mov    QWORD PTR [rsp+0x30],0x2bc
  40117f:	00 00 
  401181:	48 c7 44 24 38 f4 01 	mov    QWORD PTR [rsp+0x38],0x1f4
  401188:	00 00 
  40118a:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
  401191:	00 00 
  401193:	48 8b 05 b5 14 00 00 	mov    rax,QWORD PTR [rip+0x14b5]        # 0x40264f
  40119a:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
  40119f:	48 8b 05 41 14 00 00 	mov    rax,QWORD PTR [rip+0x1441]        # 0x4025e7
  4011a6:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
  4011ab:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
  4011b2:	00 00 
  4011b4:	ff 15 c6 30 00 00    	call   QWORD PTR [rip+0x30c6]        # 0x404280
  4011ba:	48 83 c4 60          	add    rsp,0x60
  4011be:	48 85 c0             	test   rax,rax
  4011c1:	0f 84 c5 00 00 00    	je     0x40128c
  4011c7:	48 89 05 91 14 00 00 	mov    QWORD PTR [rip+0x1491],rax        # 0x40265f
  4011ce:	48 83 ec 20          	sub    rsp,0x20
  4011d2:	48 8b 0d 86 14 00 00 	mov    rcx,QWORD PTR [rip+0x1486]        # 0x40265f
  4011d9:	48 c7 c2 01 00 00 00 	mov    rdx,0x1
  4011e0:	ff 15 22 31 00 00    	call   QWORD PTR [rip+0x3122]        # 0x404308
  4011e6:	48 83 c4 20          	add    rsp,0x20
  4011ea:	48 83 ec 20          	sub    rsp,0x20
  4011ee:	48 8b 0d 6a 14 00 00 	mov    rcx,QWORD PTR [rip+0x146a]        # 0x40265f
  4011f5:	ff 15 1d 31 00 00    	call   QWORD PTR [rip+0x311d]        # 0x404318
  4011fb:	48 83 c4 20          	add    rsp,0x20
  4011ff:	48 83 ec 20          	sub    rsp,0x20
  401203:	48 c7 c1 1f 26 40 00 	mov    rcx,0x40261f
  40120a:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  401211:	49 c7 c0 00 00 00 00 	mov    r8,0x0
  401218:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  40121f:	ff 15 8b 30 00 00    	call   QWORD PTR [rip+0x308b]        # 0x4042b0
  401225:	48 83 c4 20          	add    rsp,0x20
  401229:	83 f8 01             	cmp    eax,0x1
  40122c:	0f 82 84 00 00 00    	jb     0x4012b6
  401232:	75 cb                	jne    0x4011ff
  401234:	48 83 ec 20          	sub    rsp,0x20
  401238:	48 c7 c1 1f 26 40 00 	mov    rcx,0x40261f
  40123f:	ff 15 cb 30 00 00    	call   QWORD PTR [rip+0x30cb]        # 0x404310
  401245:	48 83 c4 20          	add    rsp,0x20
  401249:	48 83 ec 20          	sub    rsp,0x20
  40124d:	48 c7 c1 1f 26 40 00 	mov    rcx,0x40261f
  401254:	ff 15 3e 30 00 00    	call   QWORD PTR [rip+0x303e]        # 0x404298
  40125a:	48 83 c4 20          	add    rsp,0x20
  40125e:	eb 9f                	jmp    0x4011ff
  401260:	48 83 ec 20          	sub    rsp,0x20
  401264:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  40126b:	48 c7 c2 87 20 40 00 	mov    rdx,0x402087
  401272:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401279:	49 c7 c1 10 00 00 00 	mov    r9,0x10
  401280:	ff 15 5a 30 00 00    	call   QWORD PTR [rip+0x305a]        # 0x4042e0
  401286:	48 83 c4 20          	add    rsp,0x20
  40128a:	eb 2a                	jmp    0x4012b6
  40128c:	48 83 ec 20          	sub    rsp,0x20
  401290:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401297:	48 c7 c2 4c 22 40 00 	mov    rdx,0x40224c
  40129e:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  4012a5:	49 c7 c1 10 00 00 00 	mov    r9,0x10
  4012ac:	ff 15 2e 30 00 00    	call   QWORD PTR [rip+0x302e]        # 0x4042e0
  4012b2:	48 83 c4 20          	add    rsp,0x20
  4012b6:	48 83 ec 20          	sub    rsp,0x20
  4012ba:	48 8b 0d 6e 13 00 00 	mov    rcx,QWORD PTR [rip+0x136e]        # 0x40262f
  4012c1:	ff 15 51 2e 00 00    	call   QWORD PTR [rip+0x2e51]        # 0x404118
  4012c7:	48 83 c4 20          	add    rsp,0x20
  4012cb:	55                   	push   rbp
  4012cc:	48 89 e5             	mov    rbp,rsp
  4012cf:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  4012d3:	48 31 c0             	xor    rax,rax
  4012d6:	48 8b 4c 24 08       	mov    rcx,QWORD PTR [rsp+0x8]
  4012db:	48 83 c1 0a          	add    rcx,0xa
  4012df:	48 c7 c2 78 1c 40 00 	mov    rdx,0x401c78
  4012e6:	48 39 d1             	cmp    rcx,rdx
  4012e9:	7d 09                	jge    0x4012f4
  4012eb:	48 03 01             	add    rax,QWORD PTR [rcx]
  4012ee:	48 83 c1 08          	add    rcx,0x8
  4012f2:	eb f2                	jmp    0x4012e6
  4012f4:	c9                   	leave
  4012f5:	c3                   	ret
  4012f6:	49 58                	rex.WB pop r8
  4012f8:	ff e0                	jmp    rax
  4012fa:	55                   	push   rbp
  4012fb:	48 89 e5             	mov    rbp,rsp
  4012fe:	48 83 ec 08          	sub    rsp,0x8
  401302:	53                   	push   rbx
  401303:	56                   	push   rsi
  401304:	57                   	push   rdi
  401305:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401309:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  40130d:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
  401311:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
  401315:	83 fa 02             	cmp    edx,0x2
  401318:	0f 84 52 03 00 00    	je     0x401670
  40131e:	81 fa 11 01 00 00    	cmp    edx,0x111
  401324:	0f 84 9e 01 00 00    	je     0x4014c8
  40132a:	83 fa 01             	cmp    edx,0x1
  40132d:	74 13                	je     0x401342
  40132f:	48 83 ec 20          	sub    rsp,0x20
  401333:	ff 15 4f 2f 00 00    	call   QWORD PTR [rip+0x2f4f]        # 0x404288
  401339:	48 83 c4 20          	add    rsp,0x20
  40133d:	e9 4a 03 00 00       	jmp    0x40168c
  401342:	48 83 ec 60          	sub    rsp,0x60
  401346:	48 c7 c1 00 02 00 00 	mov    rcx,0x200
  40134d:	48 c7 c2 73 22 40 00 	mov    rdx,0x402273
  401354:	49 c7 c0 00 00 00 00 	mov    r8,0x0
  40135b:	49 c7 c1 44 00 20 50 	mov    r9,0x50200044
  401362:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
  401369:	00 00 
  40136b:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
  401372:	00 00 
  401374:	48 c7 44 24 30 bc 02 	mov    QWORD PTR [rsp+0x30],0x2bc
  40137b:	00 00 
  40137d:	48 c7 44 24 38 f4 01 	mov    QWORD PTR [rsp+0x38],0x1f4
  401384:	00 00 
  401386:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  40138a:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
  40138f:	48 c7 44 24 48 00 00 	mov    QWORD PTR [rsp+0x48],0x0
  401396:	00 00 
  401398:	48 8b 05 48 12 00 00 	mov    rax,QWORD PTR [rip+0x1248]        # 0x4025e7
  40139f:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
  4013a4:	48 c7 44 24 58 00 00 	mov    QWORD PTR [rsp+0x58],0x0
  4013ab:	00 00 
  4013ad:	ff 15 cd 2e 00 00    	call   QWORD PTR [rip+0x2ecd]        # 0x404280
  4013b3:	48 83 c4 60          	add    rsp,0x60
  4013b7:	85 c0                	test   eax,eax
  4013b9:	0f 84 cd 02 00 00    	je     0x40168c
  4013bf:	48 89 05 91 12 00 00 	mov    QWORD PTR [rip+0x1291],rax        # 0x402657
  4013c6:	48 89 c1             	mov    rcx,rax
  4013c9:	e8 fd fe ff ff       	call   0x4012cb
  4013ce:	48 b9 ca c1 83 a8 70 	movabs rcx,0x572b1470a883c1ca
  4013d5:	14 2b 57 
  4013d8:	48 39 c8             	cmp    rax,rcx
  4013db:	0f 85 65 02 00 00    	jne    0x401646
  4013e1:	50                   	push   rax
  4013e2:	48 83 ec 70          	sub    rsp,0x70
  4013e6:	48 c7 c1 12 00 00 00 	mov    rcx,0x12
  4013ed:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  4013f4:	49 c7 c0 00 00 00 00 	mov    r8,0x0
  4013fb:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  401402:	48 c7 44 24 20 90 01 	mov    QWORD PTR [rsp+0x20],0x190
  401409:	00 00 
  40140b:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
  401412:	00 00 
  401414:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
  40141b:	00 00 
  40141d:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
  401424:	00 00 
  401426:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
  40142d:	00 00 
  40142f:	48 c7 44 24 48 05 00 	mov    QWORD PTR [rsp+0x48],0x5
  401436:	00 00 
  401438:	48 c7 44 24 50 00 00 	mov    QWORD PTR [rsp+0x50],0x0
  40143f:	00 00 
  401441:	48 c7 44 24 58 02 00 	mov    QWORD PTR [rsp+0x58],0x2
  401448:	00 00 
  40144a:	48 c7 44 24 60 01 00 	mov    QWORD PTR [rsp+0x60],0x1
  401451:	00 00 
  401453:	48 c7 44 24 68 10 23 	mov    QWORD PTR [rsp+0x68],0x402310
  40145a:	40 00 
  40145c:	ff 15 ae 30 00 00    	call   QWORD PTR [rip+0x30ae]        # 0x404510
  401462:	48 83 c4 70          	add    rsp,0x70
  401466:	85 c0                	test   eax,eax
  401468:	48 89 05 f8 11 00 00 	mov    QWORD PTR [rip+0x11f8],rax        # 0x402667
  40146f:	58                   	pop    rax
  401470:	48 3d 09 53 67 08    	cmp    rax,0x8675309
  401476:	0f 84 0d 02 00 00    	je     0x401689
  40147c:	48 83 ec 20          	sub    rsp,0x20
  401480:	48 8b 0d d0 11 00 00 	mov    rcx,QWORD PTR [rip+0x11d0]        # 0x402657
  401487:	48 c7 c2 30 00 00 00 	mov    rdx,0x30
  40148e:	4c 8b 05 d2 11 00 00 	mov    r8,QWORD PTR [rip+0x11d2]        # 0x402667
  401495:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  40149c:	ff 15 56 2e 00 00    	call   QWORD PTR [rip+0x2e56]        # 0x4042f8
  4014a2:	48 83 c4 20          	add    rsp,0x20
  4014a6:	e8 f1 04 00 00       	call   0x40199c
  4014ab:	48 89 05 55 22 00 00 	mov    QWORD PTR [rip+0x2255],rax        # 0x403707
  4014b2:	48 89 c1             	mov    rcx,rax
  4014b5:	e8 90 06 00 00       	call   0x401b4a
  4014ba:	48 89 05 4e 22 00 00 	mov    QWORD PTR [rip+0x224e],rax        # 0x40370f
  4014c1:	31 c0                	xor    eax,eax
  4014c3:	e9 c4 01 00 00       	jmp    0x40168c
  4014c8:	4c 89 c0             	mov    rax,r8
  4014cb:	48 25 ff ff 00 00    	and    rax,0xffff
  4014d1:	48 83 f8 65          	cmp    rax,0x65
  4014d5:	0f 84 f7 00 00 00    	je     0x4015d2
  4014db:	48 83 f8 70          	cmp    rax,0x70
  4014df:	74 1d                	je     0x4014fe
  4014e1:	48 83 f8 6f          	cmp    rax,0x6f
  4014e5:	74 46                	je     0x40152d
  4014e7:	83 f8 66             	cmp    eax,0x66
  4014ea:	0f 84 3b 01 00 00    	je     0x40162b
  4014f0:	83 f8 68             	cmp    eax,0x68
  4014f3:	0f 84 8b 00 00 00    	je     0x401584
  4014f9:	e9 31 fe ff ff       	jmp    0x40132f
  4014fe:	48 83 ec 20          	sub    rsp,0x20
  401502:	48 8b 0d 56 11 00 00 	mov    rcx,QWORD PTR [rip+0x1156]        # 0x40265f
  401509:	48 c7 c2 cf 20 40 00 	mov    rdx,0x4020cf
  401510:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401517:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  40151e:	ff 15 bc 2d 00 00    	call   QWORD PTR [rip+0x2dbc]        # 0x4042e0
  401524:	48 83 c4 20          	add    rsp,0x20
  401528:	e9 5f 01 00 00       	jmp    0x40168c
  40152d:	e8 64 01 00 00       	call   0x401696
  401532:	48 83 ec 20          	sub    rsp,0x20
  401536:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  40153d:	ff 15 dd 2b 00 00    	call   QWORD PTR [rip+0x2bdd]        # 0x404120
  401543:	48 83 c4 20          	add    rsp,0x20
  401547:	48 83 ec 30          	sub    rsp,0x30
  40154b:	48 89 c1             	mov    rcx,rax
  40154e:	48 c7 c2 25 00 00 00 	mov    rdx,0x25
  401555:	4c 8b 05 03 11 00 00 	mov    r8,QWORD PTR [rip+0x1103]        # 0x40265f
  40155c:	49 c7 c1 bc 19 40 00 	mov    r9,0x4019bc
  401563:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
  40156a:	00 00 
  40156c:	ff 15 1e 2d 00 00    	call   QWORD PTR [rip+0x2d1e]        # 0x404290
  401572:	48 83 c4 30          	add    rsp,0x30
  401576:	e9 11 01 00 00       	jmp    0x40168c
  40157b:	80 3d 9d 0d 00 00 00 	cmp    BYTE PTR [rip+0xd9d],0x0        # 0x40231f
  401582:	74 39                	je     0x4015bd
  401584:	48 83 ec 20          	sub    rsp,0x20
  401588:	48 8b 0d d0 10 00 00 	mov    rcx,QWORD PTR [rip+0x10d0]        # 0x40265f
  40158f:	e8 ea 06 00 00       	call   0x401c7e
  401594:	48 83 c4 20          	add    rsp,0x20
  401598:	48 85 c0             	test   rax,rax
  40159b:	0f 84 eb 00 00 00    	je     0x40168c
  4015a1:	48 83 ec 20          	sub    rsp,0x20
  4015a5:	48 8b 0d b3 10 00 00 	mov    rcx,QWORD PTR [rip+0x10b3]        # 0x40265f
  4015ac:	48 c7 c2 1f 23 40 00 	mov    rdx,0x40231f
  4015b3:	ff 15 47 2d 00 00    	call   QWORD PTR [rip+0x2d47]        # 0x404300
  4015b9:	48 83 c4 20          	add    rsp,0x20
  4015bd:	48 83 ec 20          	sub    rsp,0x20
  4015c1:	e8 4d 02 00 00       	call   0x401813
  4015c6:	48 83 c4 20          	add    rsp,0x20
  4015ca:	48 31 c0             	xor    rax,rax
  4015cd:	e9 ba 00 00 00       	jmp    0x40168c
  4015d2:	48 83 ec 20          	sub    rsp,0x20
  4015d6:	48 8b 0d 7a 10 00 00 	mov    rcx,QWORD PTR [rip+0x107a]        # 0x402657
  4015dd:	48 c7 c2 0c 00 00 00 	mov    rdx,0xc
  4015e4:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  4015eb:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  4015f2:	ff 15 00 2d 00 00    	call   QWORD PTR [rip+0x2d00]        # 0x4042f8
  4015f8:	48 83 c4 20          	add    rsp,0x20
  4015fc:	e8 26 07 00 00       	call   0x401d27
  401601:	48 83 ec 20          	sub    rsp,0x20
  401605:	48 8b 0d db 0f 00 00 	mov    rcx,QWORD PTR [rip+0xfdb]        # 0x4025e7
  40160c:	48 c7 c2 3a 22 40 00 	mov    rdx,0x40223a
  401613:	ff 15 e7 2c 00 00    	call   QWORD PTR [rip+0x2ce7]        # 0x404300
  401619:	48 83 c4 20          	add    rsp,0x20
  40161d:	8d 35 fc 0c 00 00    	lea    esi,[rip+0xcfc]        # 0x40231f
  401623:	67 c6 06 00          	mov    BYTE PTR [esi],0x0
  401627:	31 c0                	xor    eax,eax
  401629:	eb 61                	jmp    0x40168c
  40162b:	48 83 ec 20          	sub    rsp,0x20
  40162f:	48 8b 0d 29 10 00 00 	mov    rcx,QWORD PTR [rip+0x1029]        # 0x40265f
  401636:	e8 f9 06 00 00       	call   0x401d34
  40163b:	48 83 c4 20          	add    rsp,0x20
  40163f:	e8 1a 01 00 00       	call   0x40175e
  401644:	eb 46                	jmp    0x40168c
  401646:	48 83 ec 20          	sub    rsp,0x20
  40164a:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401651:	48 c7 c2 87 20 40 00 	mov    rdx,0x402087
  401658:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  40165f:	49 c7 c1 10 00 00 00 	mov    r9,0x10
  401666:	ff 15 74 2c 00 00    	call   QWORD PTR [rip+0x2c74]        # 0x4042e0
  40166c:	48 83 c4 20          	add    rsp,0x20
  401670:	48 83 ec 20          	sub    rsp,0x20
  401674:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  40167b:	ff 15 67 2c 00 00    	call   QWORD PTR [rip+0x2c67]        # 0x4042e8
  401681:	48 83 c4 20          	add    rsp,0x20
  401685:	31 c0                	xor    eax,eax
  401687:	eb 03                	jmp    0x40168c
  401689:	48 ff c0             	inc    rax
  40168c:	5f                   	pop    rdi
  40168d:	5e                   	pop    rsi
  40168e:	5b                   	pop    rbx
  40168f:	c9                   	leave
  401690:	c3                   	ret
  401691:	e9 61 fc ff ff       	jmp    0x4012f7
  401696:	55                   	push   rbp
  401697:	48 89 e5             	mov    rbp,rsp
  40169a:	48 c7 c2 37 37 40 00 	mov    rdx,0x403737
  4016a1:	48 81 32 7e 1e 50 0b 	xor    QWORD PTR [rdx],0xb501e7e
  4016a8:	48 8b 0d 58 20 00 00 	mov    rcx,QWORD PTR [rip+0x2058]        # 0x403707
  4016af:	48 81 72 04 ad 10 a7 	xor    QWORD PTR [rdx+0x4],0xa710ad
  4016b6:	00 
  4016b7:	48 83 ec 20          	sub    rsp,0x20
  4016bb:	48 81 72 08 15 41 db 	xor    QWORD PTR [rdx+0x8],0xddb4115
  4016c2:	0d 
  4016c3:	ff 15 46 20 00 00    	call   QWORD PTR [rip+0x2046]        # 0x40370f
  4016c9:	48 83 c4 20          	add    rsp,0x20
  4016cd:	48 89 05 23 20 00 00 	mov    QWORD PTR [rip+0x2023],rax        # 0x4036f7
  4016d4:	49 c7 c1 ef 36 40 00 	mov    r9,0x4036ef
  4016db:	49 c7 c0 40 00 00 00 	mov    r8,0x40
  4016e2:	48 c7 c2 00 10 00 00 	mov    rdx,0x1000
  4016e9:	48 8b 05 0f 20 00 00 	mov    rax,QWORD PTR [rip+0x200f]        # 0x4036ff
  4016f0:	48 05 00 10 00 00    	add    rax,0x1000
  4016f6:	48 89 c1             	mov    rcx,rax
  4016f9:	48 83 ec 20          	sub    rsp,0x20
  4016fd:	ff 15 f4 1f 00 00    	call   QWORD PTR [rip+0x1ff4]        # 0x4036f7
  401703:	48 83 c4 20          	add    rsp,0x20
  401707:	48 c7 c0 bf 1a 40 00 	mov    rax,0x401abf
  40170e:	48 b9 48 83 f8 01 74 	movabs rcx,0x83482c7401f88348
  401715:	2c 48 83 
  401718:	48 89 08             	mov    QWORD PTR [rax],rcx
  40171b:	48 c7 c0 5d 1c 40 00 	mov    rax,0x401c5d
  401722:	48 b9 48 3b 75 18 75 	movabs rcx,0xc748097518753b48
  401729:	09 48 c7 
  40172c:	48 89 08             	mov    QWORD PTR [rax],rcx
  40172f:	48 83 c0 08          	add    rax,0x8
  401733:	48 b9 c0 01 00 00 00 	movabs rcx,0x4807eb00000001c0
  40173a:	eb 07 48 
  40173d:	48 89 08             	mov    QWORD PTR [rax],rcx
  401740:	48 83 c0 08          	add    rax,0x8
  401744:	48 b9 c7 c0 00 00 00 	movabs rcx,0x5e5f00000000c0c7
  40174b:	00 5f 5e 
  40174e:	48 89 08             	mov    QWORD PTR [rax],rcx
  401751:	48 83 c0 08          	add    rax,0x8
  401755:	b9 5b c9 c3 55       	mov    ecx,0x55c3c95b
  40175a:	89 08                	mov    DWORD PTR [rax],ecx
  40175c:	c9                   	leave
  40175d:	c3                   	ret
  40175e:	55                   	push   rbp
  40175f:	48 89 e5             	mov    rbp,rsp
  401762:	48 83 ec 40          	sub    rsp,0x40
  401766:	48 8b 0d 0a 0e 00 00 	mov    rcx,QWORD PTR [rip+0xe0a]        # 0x402577
  40176d:	48 ba 00 00 00 80 00 	movabs rdx,0x80000000
  401774:	00 00 00 
  401777:	49 c7 c0 00 00 00 00 	mov    r8,0x0
  40177e:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  401785:	48 c7 44 24 20 03 00 	mov    QWORD PTR [rsp+0x20],0x3
  40178c:	00 00 
  40178e:	48 c7 44 24 28 80 00 	mov    QWORD PTR [rsp+0x28],0x80
  401795:	00 00 
  401797:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
  40179e:	00 00 
  4017a0:	ff 15 6a 29 00 00    	call   QWORD PTR [rip+0x296a]        # 0x404110
  4017a6:	48 83 c4 40          	add    rsp,0x40
  4017aa:	48 83 ec 30          	sub    rsp,0x30
  4017ae:	48 89 c1             	mov    rcx,rax
  4017b1:	48 c7 c2 ef 26 40 00 	mov    rdx,0x4026ef
  4017b8:	49 c7 c0 00 10 00 00 	mov    r8,0x1000
  4017bf:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  4017c6:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
  4017cd:	00 00 
  4017cf:	ff 15 6b 29 00 00    	call   QWORD PTR [rip+0x296b]        # 0x404140
  4017d5:	48 83 c4 30          	add    rsp,0x30
  4017d9:	48 83 ec 20          	sub    rsp,0x20
  4017dd:	48 8b 0d 73 0e 00 00 	mov    rcx,QWORD PTR [rip+0xe73]        # 0x402657
  4017e4:	48 c7 c2 ef 26 40 00 	mov    rdx,0x4026ef
  4017eb:	ff 15 0f 2b 00 00    	call   QWORD PTR [rip+0x2b0f]        # 0x404300
  4017f1:	48 83 c4 20          	add    rsp,0x20
  4017f5:	48 83 ec 20          	sub    rsp,0x20
  4017f9:	48 8b 0d 57 0e 00 00 	mov    rcx,QWORD PTR [rip+0xe57]        # 0x402657
  401800:	ff 15 12 2b 00 00    	call   QWORD PTR [rip+0x2b12]        # 0x404318
  401806:	48 83 c4 20          	add    rsp,0x20
  40180a:	48 c7 c1 7e 1c 40 00 	mov    rcx,0x401c7e
  401811:	c9                   	leave
  401812:	c3                   	ret
  401813:	55                   	push   rbp
  401814:	48 89 e5             	mov    rbp,rsp
  401817:	48 83 ec 08          	sub    rsp,0x8
  40181b:	53                   	push   rbx
  40181c:	56                   	push   rsi
  40181d:	57                   	push   rdi
  40181e:	48 83 ec 20          	sub    rsp,0x20
  401822:	ff 15 00 29 00 00    	call   QWORD PTR [rip+0x2900]        # 0x404128
  401828:	48 83 c4 20          	add    rsp,0x20
  40182c:	48 85 c0             	test   rax,rax
  40182f:	0f 84 36 01 00 00    	je     0x40196b
  401835:	48 89 05 e3 1e 00 00 	mov    QWORD PTR [rip+0x1ee3],rax        # 0x40371f
  40183c:	48 83 ec 20          	sub    rsp,0x20
  401840:	48 8b 0d 10 0e 00 00 	mov    rcx,QWORD PTR [rip+0xe10]        # 0x402657
  401847:	ff 15 73 2a 00 00    	call   QWORD PTR [rip+0x2a73]        # 0x4042c0
  40184d:	48 83 c4 20          	add    rsp,0x20
  401851:	48 ff c0             	inc    rax
  401854:	48 89 05 d4 1e 00 00 	mov    QWORD PTR [rip+0x1ed4],rax        # 0x40372f
  40185b:	48 83 ec 20          	sub    rsp,0x20
  40185f:	48 8b 0d b9 1e 00 00 	mov    rcx,QWORD PTR [rip+0x1eb9]        # 0x40371f
  401866:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  40186d:	49 89 c0             	mov    r8,rax
  401870:	ff 15 ba 28 00 00    	call   QWORD PTR [rip+0x28ba]        # 0x404130
  401876:	48 83 c4 20          	add    rsp,0x20
  40187a:	48 85 c0             	test   rax,rax
  40187d:	0f 84 e8 00 00 00    	je     0x40196b
  401883:	48 89 05 8d 1e 00 00 	mov    QWORD PTR [rip+0x1e8d],rax        # 0x403717
  40188a:	48 83 ec 40          	sub    rsp,0x40
  40188e:	48 c7 c1 1f 23 40 00 	mov    rcx,0x40231f
  401895:	48 c7 c2 00 00 00 40 	mov    rdx,0x40000000
  40189c:	49 c7 c0 00 00 00 00 	mov    r8,0x0
  4018a3:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  4018aa:	48 c7 44 24 20 02 00 	mov    QWORD PTR [rsp+0x20],0x2
  4018b1:	00 00 
  4018b3:	48 c7 44 24 28 80 00 	mov    QWORD PTR [rsp+0x28],0x80
  4018ba:	00 00 
  4018bc:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
  4018c3:	00 00 
  4018c5:	ff 15 45 28 00 00    	call   QWORD PTR [rip+0x2845]        # 0x404110
  4018cb:	48 83 c4 40          	add    rsp,0x40
  4018cf:	48 85 c0             	test   rax,rax
  4018d2:	0f 84 93 00 00 00    	je     0x40196b
  4018d8:	48 89 05 48 1e 00 00 	mov    QWORD PTR [rip+0x1e48],rax        # 0x403727
  4018df:	48 83 ec 20          	sub    rsp,0x20
  4018e3:	48 8b 0d 6d 0d 00 00 	mov    rcx,QWORD PTR [rip+0xd6d]        # 0x402657
  4018ea:	48 8b 15 26 1e 00 00 	mov    rdx,QWORD PTR [rip+0x1e26]        # 0x403717
  4018f1:	4c 8b 05 37 1e 00 00 	mov    r8,QWORD PTR [rip+0x1e37]        # 0x40372f
  4018f8:	ff 15 ba 29 00 00    	call   QWORD PTR [rip+0x29ba]        # 0x4042b8
  4018fe:	48 83 c4 20          	add    rsp,0x20
  401902:	48 83 ec 30          	sub    rsp,0x30
  401906:	48 8b 0d 1a 1e 00 00 	mov    rcx,QWORD PTR [rip+0x1e1a]        # 0x403727
  40190d:	48 8b 15 03 1e 00 00 	mov    rdx,QWORD PTR [rip+0x1e03]        # 0x403717
  401914:	41 89 c0             	mov    r8d,eax
  401917:	49 c7 c1 2f 37 40 00 	mov    r9,0x40372f
  40191e:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
  401925:	00 00 
  401927:	ff 15 1b 28 00 00    	call   QWORD PTR [rip+0x281b]        # 0x404148
  40192d:	48 83 c4 30          	add    rsp,0x30
  401931:	48 83 ec 20          	sub    rsp,0x20
  401935:	48 8b 0d eb 1d 00 00 	mov    rcx,QWORD PTR [rip+0x1deb]        # 0x403727
  40193c:	ff 15 c6 27 00 00    	call   QWORD PTR [rip+0x27c6]        # 0x404108
  401942:	48 83 c4 20          	add    rsp,0x20
  401946:	48 83 ec 20          	sub    rsp,0x20
  40194a:	48 8b 0d ce 1d 00 00 	mov    rcx,QWORD PTR [rip+0x1dce]        # 0x40371f
  401951:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  401958:	4c 8b 05 b8 1d 00 00 	mov    r8,QWORD PTR [rip+0x1db8]        # 0x403717
  40195f:	ff 15 d3 27 00 00    	call   QWORD PTR [rip+0x27d3]        # 0x404138
  401965:	48 83 c4 20          	add    rsp,0x20
  401969:	eb 2c                	jmp    0x401997
  40196b:	48 83 ec 20          	sub    rsp,0x20
  40196f:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401976:	48 c7 c2 5c 22 40 00 	mov    rdx,0x40225c
  40197d:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401984:	49 c7 c1 10 00 00 00 	mov    r9,0x10
  40198b:	ff 15 4f 29 00 00    	call   QWORD PTR [rip+0x294f]        # 0x4042e0
  401991:	48 83 c4 20          	add    rsp,0x20
  401995:	eb af                	jmp    0x401946
  401997:	5f                   	pop    rdi
  401998:	5e                   	pop    rsi
  401999:	5b                   	pop    rbx
  40199a:	c9                   	leave
  40199b:	c3                   	ret
  40199c:	55                   	push   rbp
  40199d:	48 89 e5             	mov    rbp,rsp
  4019a0:	65 67 48 a1 60 00 00 	addr32 mov rax,gs:0x60
  4019a7:	00 
  4019a8:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
  4019ac:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  4019b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
  4019b3:	48 8b 00             	mov    rax,QWORD PTR [rax]
  4019b6:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
  4019ba:	c9                   	leave
  4019bb:	c3                   	ret
  4019bc:	55                   	push   rbp
  4019bd:	48 89 e5             	mov    rbp,rsp
  4019c0:	48 83 ec 08          	sub    rsp,0x8
  4019c4:	53                   	push   rbx
  4019c5:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
  4019c9:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
  4019cd:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
  4019d1:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
  4019d5:	48 81 7d 28 10 01 00 	cmp    QWORD PTR [rbp+0x28],0x110
  4019dc:	00 
  4019dd:	74 18                	je     0x4019f7
  4019df:	48 81 7d 28 11 01 00 	cmp    QWORD PTR [rbp+0x28],0x111
  4019e6:	00 
  4019e7:	74 13                	je     0x4019fc
  4019e9:	48 83 7d 28 10       	cmp    QWORD PTR [rbp+0x28],0x10
  4019ee:	74 3e                	je     0x401a2e
  4019f0:	31 c0                	xor    eax,eax
  4019f2:	e9 50 01 00 00       	jmp    0x401b47
  4019f7:	e9 4b 01 00 00       	jmp    0x401b47
  4019fc:	48 83 7d 30 7b       	cmp    QWORD PTR [rbp+0x30],0x7b
  401a01:	74 2b                	je     0x401a2e
  401a03:	48 83 7d 30 7a       	cmp    QWORD PTR [rbp+0x30],0x7a
  401a08:	0f 85 39 01 00 00    	jne    0x401b47
  401a0e:	eb 3c                	jmp    0x401a4c
  401a10:	48 83 ec 20          	sub    rsp,0x20
  401a14:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
  401a18:	48 c7 c2 01 00 00 00 	mov    rdx,0x1
  401a1f:	ff 15 7b 28 00 00    	call   QWORD PTR [rip+0x287b]        # 0x4042a0
  401a25:	48 83 c4 20          	add    rsp,0x20
  401a29:	e9 19 01 00 00       	jmp    0x401b47
  401a2e:	48 83 ec 20          	sub    rsp,0x20
  401a32:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
  401a36:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  401a3d:	ff 15 5d 28 00 00    	call   QWORD PTR [rip+0x285d]        # 0x4042a0
  401a43:	48 83 c4 20          	add    rsp,0x20
  401a47:	e9 fb 00 00 00       	jmp    0x401b47
  401a4c:	48 83 ec 20          	sub    rsp,0x20
  401a50:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
  401a54:	48 c7 c2 78 00 00 00 	mov    rdx,0x78
  401a5b:	49 c7 c0 6f 26 40 00 	mov    r8,0x40266f
  401a62:	49 c7 c1 40 00 00 00 	mov    r9,0x40
  401a69:	ff 15 39 28 00 00    	call   QWORD PTR [rip+0x2839]        # 0x4042a8
  401a6f:	48 83 c4 20          	add    rsp,0x20
  401a73:	48 83 f8 05          	cmp    rax,0x5
  401a77:	7c 78                	jl     0x401af1
  401a79:	48 83 ec 20          	sub    rsp,0x20
  401a7d:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
  401a81:	48 c7 c2 79 00 00 00 	mov    rdx,0x79
  401a88:	49 c7 c0 af 26 40 00 	mov    r8,0x4026af
  401a8f:	49 c7 c1 40 00 00 00 	mov    r9,0x40
  401a96:	ff 15 0c 28 00 00    	call   QWORD PTR [rip+0x280c]        # 0x4042a8
  401a9c:	48 83 c4 20          	add    rsp,0x20
  401aa0:	48 83 f8 05          	cmp    rax,0x5
  401aa4:	7c 4b                	jl     0x401af1
  401aa6:	48 c7 c0 6f 26 40 00 	mov    rax,0x40266f
  401aad:	48 c7 c3 af 26 40 00 	mov    rbx,0x4026af
  401ab4:	48 89 da             	mov    rdx,rbx
  401ab7:	48 89 c1             	mov    rcx,rax
  401aba:	e8 54 01 00 00       	call   0x401c13
  401abf:	48 83 f8 01          	cmp    rax,0x1
  401ac3:	74 58                	je     0x401b1d
  401ac5:	48 83 ec 20          	sub    rsp,0x20
  401ac9:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401ad0:	48 c7 c2 3e 20 40 00 	mov    rdx,0x40203e
  401ad7:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401ade:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  401ae5:	ff 15 f5 27 00 00    	call   QWORD PTR [rip+0x27f5]        # 0x4042e0
  401aeb:	48 83 c4 20          	add    rsp,0x20
  401aef:	eb 56                	jmp    0x401b47
  401af1:	48 83 ec 20          	sub    rsp,0x20
  401af5:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401afc:	48 c7 c2 4e 20 40 00 	mov    rdx,0x40204e
  401b03:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401b0a:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  401b11:	ff 15 c9 27 00 00    	call   QWORD PTR [rip+0x27c9]        # 0x4042e0
  401b17:	48 83 c4 20          	add    rsp,0x20
  401b1b:	eb 2a                	jmp    0x401b47
  401b1d:	48 83 ec 20          	sub    rsp,0x20
  401b21:	48 c7 c1 00 00 00 00 	mov    rcx,0x0
  401b28:	48 c7 c2 00 20 40 00 	mov    rdx,0x402000
  401b2f:	49 c7 c0 3a 22 40 00 	mov    r8,0x40223a
  401b36:	49 c7 c1 00 00 00 00 	mov    r9,0x0
  401b3d:	ff 15 9d 27 00 00    	call   QWORD PTR [rip+0x279d]        # 0x4042e0
  401b43:	48 83 c4 20          	add    rsp,0x20
  401b47:	5b                   	pop    rbx
  401b48:	c9                   	leave
  401b49:	c3                   	ret
  401b4a:	55                   	push   rbp
  401b4b:	48 89 e5             	mov    rbp,rsp
  401b4e:	48 85 c9             	test   rcx,rcx
  401b51:	0f 84 b2 00 00 00    	je     0x401c09
  401b57:	49 bc cc 90 cc 90 cc 	movabs r12,0x90cc90cc90cc90cc
  401b5e:	90 cc 90 
  401b61:	8b 41 3c             	mov    eax,DWORD PTR [rcx+0x3c]
  401b64:	48 01 c8             	add    rax,rcx
  401b67:	4c 39 e0             	cmp    rax,r12
  401b6a:	74 0a                	je     0x401b76
  401b6c:	49 bb 8d f4 a8 e2 a9 	movabs r11,0x90bfe3a9e2a8f48d
  401b73:	e3 bf 90 
  401b76:	48 8d 40 18          	lea    rax,[rax+0x18]
  401b7a:	48 8d 40 70          	lea    rax,[rax+0x70]
  401b7e:	4d 31 e3             	xor    r11,r12
  401b81:	48 8d 00             	lea    rax,[rax]
  401b84:	8b 10                	mov    edx,DWORD PTR [rax]
  401b86:	48 8d 04 11          	lea    rax,[rcx+rdx*1]
  401b8a:	4c 39 d0             	cmp    rax,r10
  401b8d:	74 17                	je     0x401ba6
  401b8f:	8b 50 18             	mov    edx,DWORD PTR [rax+0x18]
  401b92:	49 ba 8b f5 b8 c0 be 	movabs r10,0xd1afffbec0b8f58b
  401b99:	ff af d1 
  401b9c:	44 8b 40 20          	mov    r8d,DWORD PTR [rax+0x20]
  401ba0:	4e 8d 04 01          	lea    r8,[rcx+r8*1]
  401ba4:	eb 03                	jmp    0x401ba9
  401ba6:	4d 89 da             	mov    r10,r11
  401ba9:	4d 31 e2             	xor    r10,r12
  401bac:	48 85 d2             	test   rdx,rdx
  401baf:	74 58                	je     0x401c09
  401bb1:	45 8b 08             	mov    r9d,DWORD PTR [r8]
  401bb4:	4e 8d 0c 09          	lea    r9,[rcx+r9*1]
  401bb8:	4d 3b 11             	cmp    r10,QWORD PTR [r9]
  401bbb:	75 43                	jne    0x401c00
  401bbd:	4d 3b 59 07          	cmp    r11,QWORD PTR [r9+0x7]
  401bc1:	75 3d                	jne    0x401c00
  401bc3:	48 f7 da             	neg    rdx
  401bc6:	44 8b 50 18          	mov    r10d,DWORD PTR [rax+0x18]
  401bca:	49 8d 14 12          	lea    rdx,[r10+rdx*1]
  401bce:	44 8b 50 24          	mov    r10d,DWORD PTR [rax+0x24]
  401bd2:	4e 8d 14 11          	lea    r10,[rcx+r10*1]
  401bd6:	49 0f b7 14 52       	movzx  rdx,WORD PTR [r10+rdx*2]
  401bdb:	44 8b 50 1c          	mov    r10d,DWORD PTR [rax+0x1c]
  401bdf:	4e 8d 14 11          	lea    r10,[rcx+r10*1]
  401be3:	45 8b 14 92          	mov    r10d,DWORD PTR [r10+rdx*4]
  401be7:	8b 10                	mov    edx,DWORD PTR [rax]
  401be9:	49 39 d2             	cmp    r10,rdx
  401bec:	72 1b                	jb     0x401c09
  401bee:	44 8b 58 04          	mov    r11d,DWORD PTR [rax+0x4]
  401bf2:	49 01 d3             	add    r11,rdx
  401bf5:	4d 39 da             	cmp    r10,r11
  401bf8:	73 0f                	jae    0x401c09
  401bfa:	4a 8d 04 11          	lea    rax,[rcx+r10*1]
  401bfe:	c9                   	leave
  401bff:	c3                   	ret
  401c00:	49 83 c0 04          	add    r8,0x4
  401c04:	48 ff ca             	dec    rdx
  401c07:	75 a8                	jne    0x401bb1
  401c09:	31 c0                	xor    eax,eax
  401c0b:	c9                   	leave
  401c0c:	c3                   	ret
  401c0d:	ff                   	jmp    (bad)
  401c0e:	e9 7e fa ff ff       	jmp    0x401691
  401c13:	55                   	push   rbp
  401c14:	48 89 e5             	mov    rbp,rsp
  401c17:	48 83 ec 08          	sub    rsp,0x8
  401c1b:	53                   	push   rbx
  401c1c:	56                   	push   rsi
  401c1d:	57                   	push   rdi
  401c1e:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401c22:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
  401c26:	48 31 ff             	xor    rdi,rdi
  401c29:	48 31 f6             	xor    rsi,rsi
  401c2c:	8a 01                	mov    al,BYTE PTR [rcx]
  401c2e:	3c 00                	cmp    al,0x0
  401c30:	74 08                	je     0x401c3a
  401c32:	48 ff c7             	inc    rdi
  401c35:	48 ff c1             	inc    rcx
  401c38:	eb f2                	jmp    0x401c2c
  401c3a:	48 31 db             	xor    rbx,rbx
  401c3d:	48 8b 4d 10          	mov    rcx,QWORD PTR [rbp+0x10]
  401c41:	48 c7 c0 75 b1 57 10 	mov    rax,0x1057b175
  401c48:	4c 0f b6 01          	movzx  r8,BYTE PTR [rcx]
  401c4c:	49 f7 e0             	mul    r8
  401c4f:	48 01 c6             	add    rsi,rax
  401c52:	48 ff c3             	inc    rbx
  401c55:	48 ff c1             	inc    rcx
  401c58:	48 39 df             	cmp    rdi,rbx
  401c5b:	75 eb                	jne    0x401c48
  401c5d:	48 3b 75 18          	cmp    rsi,QWORD PTR [rbp+0x18]
  401c61:	75 09                	jne    0x401c6c
  401c63:	48 c7 c0 01 00 00 00 	mov    rax,0x1
  401c6a:	eb 07                	jmp    0x401c73
  401c6c:	48 c7 c0 00 00 00 00 	mov    rax,0x0
  401c73:	5f                   	pop    rdi
  401c74:	5e                   	pop    rsi
  401c75:	5b                   	pop    rbx
  401c76:	c9                   	leave
  401c77:	c3                   	ret
  401c78:	55                   	push   rbp
  401c79:	48 89 e5             	mov    rbp,rsp
  401c7c:	c9                   	leave
  401c7d:	c3                   	ret
  401c7e:	55                   	push   rbp
  401c7f:	48 89 e5             	mov    rbp,rsp
  401c82:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401c86:	48 c7 c0 88 00 00 00 	mov    rax,0x88
  401c8d:	48 83 ec 20          	sub    rsp,0x20
  401c91:	48 c7 c1 47 25 40 00 	mov    rcx,0x402547
  401c98:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  401c9f:	49 89 c0             	mov    r8,rax
  401ca2:	ff 15 e0 27 00 00    	call   QWORD PTR [rip+0x27e0]        # 0x404488
  401ca8:	48 83 c4 20          	add    rsp,0x20
  401cac:	48 c7 c0 88 00 00 00 	mov    rax,0x88
  401cb3:	48 89 05 8d 08 00 00 	mov    QWORD PTR [rip+0x88d],rax        # 0x402547
  401cba:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  401cbe:	48 89 05 8a 08 00 00 	mov    QWORD PTR [rip+0x88a],rax        # 0x40254f
  401cc5:	48 c7 c0 27 25 40 00 	mov    rax,0x402527
  401ccc:	48 89 05 8c 08 00 00 	mov    QWORD PTR [rip+0x88c],rax        # 0x40255f
  401cd3:	48 8d 05 45 06 00 00 	lea    rax,[rip+0x645]        # 0x40231f
  401cda:	48 89 05 96 08 00 00 	mov    QWORD PTR [rip+0x896],rax        # 0x402577
  401ce1:	b8 04 01 00 00       	mov    eax,0x104
  401ce6:	89 05 93 08 00 00    	mov    DWORD PTR [rip+0x893],eax        # 0x40257f
  401cec:	b8 00 00 08 00       	mov    eax,0x80000
  401cf1:	0d 00 08 00 00       	or     eax,0x800
  401cf6:	83 c8 04             	or     eax,0x4
  401cf9:	83 c8 02             	or     eax,0x2
  401cfc:	89 05 a5 08 00 00    	mov    DWORD PTR [rip+0x8a5],eax        # 0x4025a7
  401d02:	48 c7 c0 1b 23 40 00 	mov    rax,0x40231b
  401d09:	48 89 05 9f 08 00 00 	mov    QWORD PTR [rip+0x89f],rax        # 0x4025af
  401d10:	48 83 ec 20          	sub    rsp,0x20
  401d14:	48 c7 c1 47 25 40 00 	mov    rcx,0x402547
  401d1b:	ff 15 a7 27 00 00    	call   QWORD PTR [rip+0x27a7]        # 0x4044c8
  401d21:	48 83 c4 20          	add    rsp,0x20
  401d25:	c9                   	leave
  401d26:	c3                   	ret
  401d27:	55                   	push   rbp
  401d28:	48 89 e5             	mov    rbp,rsp
  401d2b:	48 c7 c0 13 1c 40 00 	mov    rax,0x401c13
  401d32:	c9                   	leave
  401d33:	c3                   	ret
  401d34:	55                   	push   rbp
  401d35:	48 89 e5             	mov    rbp,rsp
  401d38:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
  401d3c:	48 c7 c0 88 00 00 00 	mov    rax,0x88
  401d43:	48 83 ec 20          	sub    rsp,0x20
  401d47:	48 c7 c1 47 25 40 00 	mov    rcx,0x402547
  401d4e:	48 c7 c2 00 00 00 00 	mov    rdx,0x0
  401d55:	49 89 c0             	mov    r8,rax
  401d58:	ff 15 2a 27 00 00    	call   QWORD PTR [rip+0x272a]        # 0x404488
  401d5e:	48 83 c4 20          	add    rsp,0x20
  401d62:	48 c7 c0 88 00 00 00 	mov    rax,0x88
  401d69:	48 89 05 d7 07 00 00 	mov    QWORD PTR [rip+0x7d7],rax        # 0x402547
  401d70:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
  401d74:	48 89 05 d4 07 00 00 	mov    QWORD PTR [rip+0x7d4],rax        # 0x40254f
  401d7b:	48 c7 c0 27 25 40 00 	mov    rax,0x402527
  401d82:	48 89 05 d6 07 00 00 	mov    QWORD PTR [rip+0x7d6],rax        # 0x40255f
  401d89:	48 8d 05 8f 05 00 00 	lea    rax,[rip+0x58f]        # 0x40231f
  401d90:	48 89 05 e0 07 00 00 	mov    QWORD PTR [rip+0x7e0],rax        # 0x402577
  401d97:	b8 04 01 00 00       	mov    eax,0x104
  401d9c:	89 05 dd 07 00 00    	mov    DWORD PTR [rip+0x7dd],eax        # 0x40257f
  401da2:	b8 00 00 08 00       	mov    eax,0x80000
  401da7:	0d 00 10 00 00       	or     eax,0x1000
  401dac:	83 c8 04             	or     eax,0x4
  401daf:	89 05 f2 07 00 00    	mov    DWORD PTR [rip+0x7f2],eax        # 0x4025a7
  401db5:	48 c7 c0 1b 23 40 00 	mov    rax,0x40231b
  401dbc:	48 89 05 ec 07 00 00 	mov    QWORD PTR [rip+0x7ec],rax        # 0x4025af
  401dc3:	48 83 ec 20          	sub    rsp,0x20
  401dc7:	48 c7 c1 47 25 40 00 	mov    rcx,0x402547
  401dce:	ff 15 ec 26 00 00    	call   QWORD PTR [rip+0x26ec]        # 0x4044c0
  401dd4:	48 83 c4 20          	add    rsp,0x20
  401dd8:	c9                   	leave
  401dd9:	c3                   	ret
