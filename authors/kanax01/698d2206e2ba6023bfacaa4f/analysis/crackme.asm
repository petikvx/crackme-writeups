
CrackMeEasy.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	lea    rcx,[rip+0x19c9]        # 0x1400029d0
   140001007:	jmp    0x140001e74
   14000100c:	lea    rcx,[rip+0x1a29]        # 0x140002a3c
   140001013:	jmp    0x140001e74
   140001018:	int3
   140001019:	int3
   14000101a:	int3
   14000101b:	int3
   14000101c:	int3
   14000101d:	int3
   14000101e:	int3
   14000101f:	int3
   140001020:	rex push rbx
   140001022:	sub    rsp,0x20
   140001026:	mov    rbx,rcx
   140001029:	mov    rax,rdx
   14000102c:	lea    rcx,[rip+0x22f5]        # 0x140003328
   140001033:	xorps  xmm0,xmm0
   140001036:	lea    rdx,[rbx+0x8]
   14000103a:	mov    QWORD PTR [rbx],rcx
   14000103d:	lea    rcx,[rax+0x8]
   140001041:	movups XMMWORD PTR [rdx],xmm0
   140001044:	call   QWORD PTR [rip+0x20b6]        # 0x140003100
   14000104a:	mov    rax,rbx
   14000104d:	add    rsp,0x20
   140001051:	pop    rbx
   140001052:	ret
   140001053:	int3
   140001054:	int3
   140001055:	int3
   140001056:	int3
   140001057:	int3
   140001058:	int3
   140001059:	int3
   14000105a:	int3
   14000105b:	int3
   14000105c:	int3
   14000105d:	int3
   14000105e:	int3
   14000105f:	int3
   140001060:	mov    rdx,QWORD PTR [rcx+0x8]
   140001064:	lea    rax,[rip+0x230d]        # 0x140003378
   14000106b:	test   rdx,rdx
   14000106e:	cmovne rax,rdx
   140001072:	ret
   140001073:	int3
   140001074:	int3
   140001075:	int3
   140001076:	int3
   140001077:	int3
   140001078:	int3
   140001079:	int3
   14000107a:	int3
   14000107b:	int3
   14000107c:	int3
   14000107d:	int3
   14000107e:	int3
   14000107f:	int3
   140001080:	mov    QWORD PTR [rsp+0x8],rbx
   140001085:	push   rdi
   140001086:	sub    rsp,0x20
   14000108a:	lea    rax,[rip+0x2297]        # 0x140003328
   140001091:	mov    rdi,rcx
   140001094:	mov    QWORD PTR [rcx],rax
   140001097:	mov    ebx,edx
   140001099:	add    rcx,0x8
   14000109d:	call   QWORD PTR [rip+0x2055]        # 0x1400030f8
   1400010a3:	test   bl,0x1
   1400010a6:	je     0x1400010b5
   1400010a8:	mov    edx,0x18
   1400010ad:	mov    rcx,rdi
   1400010b0:	call   0x140001e94
   1400010b5:	mov    rbx,QWORD PTR [rsp+0x30]
   1400010ba:	mov    rax,rdi
   1400010bd:	add    rsp,0x20
   1400010c1:	pop    rdi
   1400010c2:	ret
   1400010c3:	int3
   1400010c4:	int3
   1400010c5:	int3
   1400010c6:	int3
   1400010c7:	int3
   1400010c8:	int3
   1400010c9:	int3
   1400010ca:	int3
   1400010cb:	int3
   1400010cc:	int3
   1400010cd:	int3
   1400010ce:	int3
   1400010cf:	int3
   1400010d0:	lea    rax,[rip+0x2251]        # 0x140003328
   1400010d7:	mov    QWORD PTR [rcx],rax
   1400010da:	add    rcx,0x8
   1400010de:	rex.W jmp QWORD PTR [rip+0x2013]        # 0x1400030f8
   1400010e5:	int3
   1400010e6:	int3
   1400010e7:	int3
   1400010e8:	int3
   1400010e9:	int3
   1400010ea:	int3
   1400010eb:	int3
   1400010ec:	int3
   1400010ed:	int3
   1400010ee:	int3
   1400010ef:	int3
   1400010f0:	lea    rax,[rip+0x2299]        # 0x140003390
   1400010f7:	mov    QWORD PTR [rcx+0x10],0x0
   1400010ff:	mov    QWORD PTR [rcx+0x8],rax
   140001103:	lea    rax,[rip+0x225e]        # 0x140003368
   14000110a:	mov    QWORD PTR [rcx],rax
   14000110d:	mov    rax,rcx
   140001110:	ret
   140001111:	int3
   140001112:	int3
   140001113:	int3
   140001114:	int3
   140001115:	int3
   140001116:	int3
   140001117:	int3
   140001118:	int3
   140001119:	int3
   14000111a:	int3
   14000111b:	int3
   14000111c:	int3
   14000111d:	int3
   14000111e:	int3
   14000111f:	int3
   140001120:	sub    rsp,0x48
   140001124:	lea    rcx,[rsp+0x20]
   140001129:	call   0x1400010f0
   14000112e:	lea    rdx,[rip+0x2fd3]        # 0x140004108
   140001135:	lea    rcx,[rsp+0x20]
   14000113a:	call   0x1400026b2
   14000113f:	int3
   140001140:	rex push rbx
   140001142:	sub    rsp,0x20
   140001146:	mov    rbx,rcx
   140001149:	mov    rax,rdx
   14000114c:	lea    rcx,[rip+0x21d5]        # 0x140003328
   140001153:	xorps  xmm0,xmm0
   140001156:	lea    rdx,[rbx+0x8]
   14000115a:	mov    QWORD PTR [rbx],rcx
   14000115d:	lea    rcx,[rax+0x8]
   140001161:	movups XMMWORD PTR [rdx],xmm0
   140001164:	call   QWORD PTR [rip+0x1f96]        # 0x140003100
   14000116a:	lea    rax,[rip+0x21f7]        # 0x140003368
   140001171:	mov    QWORD PTR [rbx],rax
   140001174:	mov    rax,rbx
   140001177:	add    rsp,0x20
   14000117b:	pop    rbx
   14000117c:	ret
   14000117d:	int3
   14000117e:	int3
   14000117f:	int3
   140001180:	rex push rbx
   140001182:	sub    rsp,0x20
   140001186:	mov    rbx,rcx
   140001189:	mov    rax,rdx
   14000118c:	lea    rcx,[rip+0x2195]        # 0x140003328
   140001193:	xorps  xmm0,xmm0
   140001196:	lea    rdx,[rbx+0x8]
   14000119a:	mov    QWORD PTR [rbx],rcx
   14000119d:	lea    rcx,[rax+0x8]
   1400011a1:	movups XMMWORD PTR [rdx],xmm0
   1400011a4:	call   QWORD PTR [rip+0x1f56]        # 0x140003100
   1400011aa:	lea    rax,[rip+0x218f]        # 0x140003340
   1400011b1:	mov    QWORD PTR [rbx],rax
   1400011b4:	mov    rax,rbx
   1400011b7:	add    rsp,0x20
   1400011bb:	pop    rbx
   1400011bc:	ret
   1400011bd:	int3
   1400011be:	int3
   1400011bf:	int3
   1400011c0:	sub    rsp,0x28
   1400011c4:	lea    rcx,[rip+0x21dd]        # 0x1400033a8
   1400011cb:	call   QWORD PTR [rip+0x1e6f]        # 0x140003040
   1400011d1:	int3
   1400011d2:	int3
   1400011d3:	int3
   1400011d4:	int3
   1400011d5:	int3
   1400011d6:	int3
   1400011d7:	int3
   1400011d8:	int3
   1400011d9:	int3
   1400011da:	int3
   1400011db:	int3
   1400011dc:	int3
   1400011dd:	int3
   1400011de:	int3
   1400011df:	int3
   1400011e0:	lea    rax,[rip+0x21d1]        # 0x1400033b8
   1400011e7:	mov    QWORD PTR [rcx+0x10],0x0
   1400011ef:	mov    QWORD PTR [rcx+0x8],rax
   1400011f3:	lea    rax,[rip+0x2266]        # 0x140003460
   1400011fa:	mov    QWORD PTR [rcx],rax
   1400011fd:	mov    rax,rcx
   140001200:	ret
   140001201:	int3
   140001202:	int3
   140001203:	int3
   140001204:	int3
   140001205:	int3
   140001206:	int3
   140001207:	int3
   140001208:	int3
   140001209:	int3
   14000120a:	int3
   14000120b:	int3
   14000120c:	int3
   14000120d:	int3
   14000120e:	int3
   14000120f:	int3
   140001210:	sub    rsp,0x48
   140001214:	lea    rcx,[rsp+0x20]
   140001219:	call   0x1400011e0
   14000121e:	lea    rdx,[rip+0x2e23]        # 0x140004048
   140001225:	lea    rcx,[rsp+0x20]
   14000122a:	call   0x1400026b2
   14000122f:	int3
   140001230:	rex push rbx
   140001232:	sub    rsp,0x20
   140001236:	mov    rbx,rcx
   140001239:	mov    rax,rdx
   14000123c:	lea    rcx,[rip+0x20e5]        # 0x140003328
   140001243:	xorps  xmm0,xmm0
   140001246:	lea    rdx,[rbx+0x8]
   14000124a:	mov    QWORD PTR [rbx],rcx
   14000124d:	lea    rcx,[rax+0x8]
   140001251:	movups XMMWORD PTR [rdx],xmm0
   140001254:	call   QWORD PTR [rip+0x1ea6]        # 0x140003100
   14000125a:	lea    rax,[rip+0x21ff]        # 0x140003460
   140001261:	mov    QWORD PTR [rbx],rax
   140001264:	mov    rax,rbx
   140001267:	add    rsp,0x20
   14000126b:	pop    rbx
   14000126c:	ret
   14000126d:	int3
   14000126e:	int3
   14000126f:	int3
   140001270:	sub    rsp,0x28
   140001274:	mov    rcx,QWORD PTR [rcx+0x8]
   140001278:	test   rcx,rcx
   14000127b:	je     0x14000129a
   14000127d:	mov    rax,QWORD PTR [rcx]
   140001280:	call   QWORD PTR [rax+0x10]
   140001283:	test   rax,rax
   140001286:	je     0x14000129a
   140001288:	mov    r8,QWORD PTR [rax]
   14000128b:	mov    edx,0x1
   140001290:	mov    rcx,rax
   140001293:	add    rsp,0x28
   140001297:	rex.WB jmp QWORD PTR [r8]
   14000129a:	add    rsp,0x28
   14000129e:	ret
   14000129f:	int3
   1400012a0:	mov    QWORD PTR [rsp+0x8],rbx
   1400012a5:	push   rdi
   1400012a6:	sub    rsp,0x50
   1400012aa:	mov    rax,QWORD PTR [rip+0x3d8f]        # 0x140005040
   1400012b1:	xor    rax,rsp
   1400012b4:	mov    QWORD PTR [rsp+0x40],rax
   1400012b9:	lea    rdx,[rip+0x2108]        # 0x1400033c8
   1400012c0:	mov    rcx,QWORD PTR [rip+0x1e01]        # 0x1400030c8
   1400012c7:	call   0x140001530
   1400012cc:	lea    rdx,[rip+0x2105]        # 0x1400033d8
   1400012d3:	mov    rcx,QWORD PTR [rip+0x1dee]        # 0x1400030c8
   1400012da:	call   0x140001530
   1400012df:	xorps  xmm0,xmm0
   1400012e2:	movups XMMWORD PTR [rsp+0x20],xmm0
   1400012e7:	mov    QWORD PTR [rsp+0x30],0x0
   1400012f0:	mov    QWORD PTR [rsp+0x38],0xf
   1400012f9:	mov    BYTE PTR [rsp+0x20],0x0
   1400012fe:	lea    rdx,[rsp+0x20]
   140001303:	mov    rcx,QWORD PTR [rip+0x1dae]        # 0x1400030b8
   14000130a:	call   0x140001700
   14000130f:	lea    rdx,[rip+0x3da2]        # 0x1400050b8
   140001316:	cmp    QWORD PTR [rip+0x3db2],0xf        # 0x1400050d0
   14000131e:	cmova  rdx,QWORD PTR [rip+0x3d92]        # 0x1400050b8
   140001326:	mov    r8,QWORD PTR [rsp+0x30]
   14000132b:	mov    rdi,QWORD PTR [rsp+0x38]
   140001330:	lea    rcx,[rsp+0x20]
   140001335:	mov    rbx,QWORD PTR [rsp+0x20]
   14000133a:	cmp    rdi,0xf
   14000133e:	cmova  rcx,rbx
   140001342:	cmp    r8,QWORD PTR [rip+0x3d7f]        # 0x1400050c8
   140001349:	jne    0x140001362
   14000134b:	test   r8,r8
   14000134e:	je     0x140001359
   140001350:	call   0x140002843
   140001355:	test   eax,eax
   140001357:	jne    0x140001362
   140001359:	lea    rdx,[rip+0x2098]        # 0x1400033f8
   140001360:	jmp    0x140001369
   140001362:	lea    rdx,[rip+0x20b7]        # 0x140003420
   140001369:	mov    rcx,QWORD PTR [rip+0x1d58]        # 0x1400030c8
   140001370:	call   0x140001530
   140001375:	lea    rdx,[rip+0x20cc]        # 0x140003448
   14000137c:	mov    rcx,QWORD PTR [rip+0x1d45]        # 0x1400030c8
   140001383:	call   0x140001530
   140001388:	mov    edx,0x1
   14000138d:	mov    r8d,0xffffffff
   140001393:	mov    rcx,QWORD PTR [rip+0x1d1e]        # 0x1400030b8
   14000139a:	call   QWORD PTR [rip+0x1ce8]        # 0x140003088
   1400013a0:	nop
   1400013a1:	cmp    rdi,0xf
   1400013a5:	jbe    0x1400013da
   1400013a7:	lea    rdx,[rdi+0x1]
   1400013ab:	cmp    rdx,0x1000
   1400013b2:	jb     0x1400013d2
   1400013b4:	mov    rcx,QWORD PTR [rbx-0x8]
   1400013b8:	sub    rbx,rcx
   1400013bb:	sub    rbx,0x8
   1400013bf:	cmp    rbx,0x1f
   1400013c3:	ja     0x1400013cb
   1400013c5:	add    rdx,0x27
   1400013c9:	jmp    0x1400013d5
   1400013cb:	mov    ecx,0x5
   1400013d0:	int    0x29
   1400013d2:	mov    rcx,rbx
   1400013d5:	call   0x140001e94
   1400013da:	xor    eax,eax
   1400013dc:	mov    rcx,QWORD PTR [rsp+0x40]
   1400013e1:	xor    rcx,rsp
   1400013e4:	call   0x140001bf0
   1400013e9:	mov    rbx,QWORD PTR [rsp+0x60]
   1400013ee:	add    rsp,0x50
   1400013f2:	pop    rdi
   1400013f3:	ret
   1400013f4:	int3
   1400013f5:	int3
   1400013f6:	int3
   1400013f7:	int3
   1400013f8:	int3
   1400013f9:	int3
   1400013fa:	int3
   1400013fb:	int3
   1400013fc:	int3
   1400013fd:	int3
   1400013fe:	int3
   1400013ff:	int3
   140001400:	rex push rbx
   140001402:	push   rbp
   140001403:	push   rsi
   140001404:	push   rdi
   140001405:	sub    rsp,0x48
   140001409:	mov    rax,QWORD PTR [rip+0x3c30]        # 0x140005040
   140001410:	xor    rax,rsp
   140001413:	mov    QWORD PTR [rsp+0x38],rax
   140001418:	mov    rbp,rcx
   14000141b:	xor    edx,edx
   14000141d:	lea    rcx,[rsp+0x28]
   140001422:	call   QWORD PTR [rip+0x1cb0]        # 0x1400030d8
   140001428:	nop
   140001429:	mov    rax,QWORD PTR [rip+0x3e00]        # 0x140005230
   140001430:	mov    QWORD PTR [rsp+0x20],rax
   140001435:	mov    rbx,QWORD PTR [rip+0x1c3c]        # 0x140003078
   14000143c:	cmp    QWORD PTR [rbx],0x0
   140001440:	jne    0x14000146f
   140001442:	xor    edx,edx
   140001444:	lea    rcx,[rsp+0x30]
   140001449:	call   QWORD PTR [rip+0x1c89]        # 0x1400030d8
   14000144f:	cmp    QWORD PTR [rbx],0x0
   140001453:	jne    0x140001464
   140001455:	mov    rax,QWORD PTR [rip+0x1c54]        # 0x1400030b0
   14000145c:	inc    DWORD PTR [rax]
   14000145e:	movsxd rax,DWORD PTR [rax]
   140001461:	mov    QWORD PTR [rbx],rax
   140001464:	lea    rcx,[rsp+0x30]
   140001469:	call   QWORD PTR [rip+0x1c79]        # 0x1400030e8
   14000146f:	mov    rsi,QWORD PTR [rbx]
   140001472:	mov    rcx,QWORD PTR [rbp+0x8]
   140001476:	lea    rdi,[rsi*8+0x0]
   14000147e:	cmp    rsi,QWORD PTR [rcx+0x18]
   140001482:	jae    0x140001493
   140001484:	mov    rax,QWORD PTR [rcx+0x10]
   140001488:	mov    rbx,QWORD PTR [rdi+rax*1]
   14000148c:	test   rbx,rbx
   14000148f:	jne    0x1400014f9
   140001491:	jmp    0x140001495
   140001493:	xor    ebx,ebx
   140001495:	cmp    BYTE PTR [rcx+0x24],0x0
   140001499:	je     0x1400014af
   14000149b:	call   QWORD PTR [rip+0x1c1f]        # 0x1400030c0
   1400014a1:	cmp    rsi,QWORD PTR [rax+0x18]
   1400014a5:	jae    0x1400014b4
   1400014a7:	mov    rax,QWORD PTR [rax+0x10]
   1400014ab:	mov    rbx,QWORD PTR [rdi+rax*1]
   1400014af:	test   rbx,rbx
   1400014b2:	jne    0x1400014f9
   1400014b4:	mov    rbx,QWORD PTR [rsp+0x20]
   1400014b9:	test   rbx,rbx
   1400014bc:	jne    0x1400014f9
   1400014be:	mov    rdx,rbp
   1400014c1:	lea    rcx,[rsp+0x20]
   1400014c6:	call   QWORD PTR [rip+0x1bd4]        # 0x1400030a0
   1400014cc:	cmp    rax,0xffffffffffffffff
   1400014d0:	je     0x14000151d
   1400014d2:	mov    rbx,QWORD PTR [rsp+0x20]
   1400014d7:	mov    QWORD PTR [rsp+0x30],rbx
   1400014dc:	mov    rcx,rbx
   1400014df:	call   0x140001b9c
   1400014e4:	mov    rax,QWORD PTR [rbx]
   1400014e7:	mov    rcx,rbx
   1400014ea:	call   QWORD PTR [rax+0x8]
   1400014ed:	mov    rbx,QWORD PTR [rsp+0x20]
   1400014f2:	mov    QWORD PTR [rip+0x3d37],rbx        # 0x140005230
   1400014f9:	lea    rcx,[rsp+0x28]
   1400014fe:	call   QWORD PTR [rip+0x1be4]        # 0x1400030e8
   140001504:	mov    rax,rbx
   140001507:	mov    rcx,QWORD PTR [rsp+0x38]
   14000150c:	xor    rcx,rsp
   14000150f:	call   0x140001bf0
   140001514:	add    rsp,0x48
   140001518:	pop    rdi
   140001519:	pop    rsi
   14000151a:	pop    rbp
   14000151b:	pop    rbx
   14000151c:	ret
   14000151d:	call   0x140001210
   140001522:	nop
   140001523:	int3
   140001524:	int3
   140001525:	int3
   140001526:	int3
   140001527:	int3
   140001528:	int3
   140001529:	int3
   14000152a:	int3
   14000152b:	int3
   14000152c:	int3
   14000152d:	int3
   14000152e:	int3
   14000152f:	int3
   140001530:	mov    QWORD PTR [rsp+0x10],rbx
   140001535:	mov    QWORD PTR [rsp+0x8],rcx
   14000153a:	push   rsi
   14000153b:	push   rdi
   14000153c:	push   r12
   14000153e:	push   r14
   140001540:	push   r15
   140001542:	sub    rsp,0x30
   140001546:	mov    r12,rdx
   140001549:	mov    rsi,rcx
   14000154c:	xor    ebx,ebx
   14000154e:	mov    DWORD PTR [rsp+0x70],ebx
   140001552:	mov    rcx,rdx
   140001555:	call   0x14000284f
   14000155a:	mov    r15,rax
   14000155d:	mov    r8,QWORD PTR [rsi]
   140001560:	movsxd r9,DWORD PTR [r8+0x4]
   140001564:	mov    rdi,QWORD PTR [r9+rsi*1+0x28]
   140001569:	test   rdi,rdi
   14000156c:	jle    0x140001578
   14000156e:	cmp    rdi,rax
   140001571:	jle    0x140001578
   140001573:	sub    rdi,rax
   140001576:	jmp    0x14000157a
   140001578:	xor    edi,edi
   14000157a:	mov    r14,rsi
   14000157d:	mov    QWORD PTR [rsp+0x20],rsi
   140001582:	mov    rcx,QWORD PTR [r9+rsi*1+0x48]
   140001587:	test   rcx,rcx
   14000158a:	je     0x140001593
   14000158c:	mov    rax,QWORD PTR [rcx]
   14000158f:	call   QWORD PTR [rax+0x8]
   140001592:	nop
   140001593:	mov    rax,QWORD PTR [rsi]
   140001596:	movsxd rcx,DWORD PTR [rax+0x4]
   14000159a:	add    rcx,rsi
   14000159d:	call   QWORD PTR [rip+0x1af5]        # 0x140003098
   1400015a3:	test   al,al
   1400015a5:	jne    0x1400015ad
   1400015a7:	mov    BYTE PTR [rsp+0x28],al
   1400015ab:	jmp    0x1400015e6
   1400015ad:	mov    rax,QWORD PTR [rsi]
   1400015b0:	movsxd rcx,DWORD PTR [rax+0x4]
   1400015b4:	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   1400015b9:	test   rcx,rcx
   1400015bc:	je     0x1400015df
   1400015be:	cmp    rcx,rsi
   1400015c1:	je     0x1400015df
   1400015c3:	call   QWORD PTR [rip+0x1a8f]        # 0x140003058
   1400015c9:	mov    rax,QWORD PTR [rsi]
   1400015cc:	movsxd rcx,DWORD PTR [rax+0x4]
   1400015d0:	add    rcx,rsi
   1400015d3:	call   QWORD PTR [rip+0x1abf]        # 0x140003098
   1400015d9:	mov    BYTE PTR [rsp+0x28],al
   1400015dd:	jmp    0x1400015e6
   1400015df:	mov    BYTE PTR [rsp+0x28],0x1
   1400015e4:	mov    al,0x1
   1400015e6:	test   al,al
   1400015e8:	jne    0x1400015f4
   1400015ea:	mov    ebx,0x4
   1400015ef:	jmp    0x1400016a2
   1400015f4:	mov    rdx,QWORD PTR [rsi]
   1400015f7:	movsxd rax,DWORD PTR [rdx+0x4]
   1400015fb:	mov    ecx,DWORD PTR [rax+rsi*1+0x18]
   1400015ff:	and    ecx,0x1c0
   140001605:	cmp    ecx,0x40
   140001608:	je     0x140001639
   14000160a:	nop    WORD PTR [rax+rax*1+0x0]
   140001610:	test   rdi,rdi
   140001613:	jle    0x140001636
   140001615:	mov    rax,QWORD PTR [rsi]
   140001618:	movsxd rcx,DWORD PTR [rax+0x4]
   14000161c:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001621:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001626:	call   QWORD PTR [rip+0x1ab4]        # 0x1400030e0
   14000162c:	cmp    eax,0xffffffff
   14000162f:	je     0x140001679
   140001631:	dec    rdi
   140001634:	jmp    0x140001610
   140001636:	mov    rdx,QWORD PTR [rsi]
   140001639:	movsxd rcx,DWORD PTR [rdx+0x4]
   14000163d:	mov    r8,r15
   140001640:	mov    rdx,r12
   140001643:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001648:	call   QWORD PTR [rip+0x1a32]        # 0x140003080
   14000164e:	cmp    rax,r15
   140001651:	jne    0x140001679
   140001653:	test   rdi,rdi
   140001656:	jle    0x140001682
   140001658:	mov    rax,QWORD PTR [rsi]
   14000165b:	movsxd rcx,DWORD PTR [rax+0x4]
   14000165f:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001664:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001669:	call   QWORD PTR [rip+0x1a71]        # 0x1400030e0
   14000166f:	cmp    eax,0xffffffff
   140001672:	je     0x140001679
   140001674:	dec    rdi
   140001677:	jmp    0x140001653
   140001679:	mov    ebx,0x4
   14000167e:	mov    DWORD PTR [rsp+0x70],ebx
   140001682:	mov    rax,QWORD PTR [rsi]
   140001685:	movsxd rcx,DWORD PTR [rax+0x4]
   140001689:	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   140001692:	jmp    0x1400016a2
   140001694:	mov    rsi,QWORD PTR [rsp+0x60]
   140001699:	mov    ebx,DWORD PTR [rsp+0x70]
   14000169d:	mov    r14,QWORD PTR [rsp+0x20]
   1400016a2:	mov    rax,QWORD PTR [rsi]
   1400016a5:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016a9:	add    rcx,rsi
   1400016ac:	xor    r8d,r8d
   1400016af:	mov    edx,ebx
   1400016b1:	call   QWORD PTR [rip+0x19a9]        # 0x140003060
   1400016b7:	nop
   1400016b8:	call   QWORD PTR [rip+0x1a12]        # 0x1400030d0
   1400016be:	test   eax,eax
   1400016c0:	jne    0x1400016cc
   1400016c2:	mov    rcx,r14
   1400016c5:	call   QWORD PTR [rip+0x1985]        # 0x140003050
   1400016cb:	nop
   1400016cc:	mov    rax,QWORD PTR [r14]
   1400016cf:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016d3:	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   1400016d8:	test   rcx,rcx
   1400016db:	je     0x1400016e4
   1400016dd:	mov    rax,QWORD PTR [rcx]
   1400016e0:	call   QWORD PTR [rax+0x10]
   1400016e3:	nop
   1400016e4:	mov    rax,rsi
   1400016e7:	mov    rbx,QWORD PTR [rsp+0x68]
   1400016ec:	add    rsp,0x30
   1400016f0:	pop    r15
   1400016f2:	pop    r14
   1400016f4:	pop    r12
   1400016f6:	pop    rdi
   1400016f7:	pop    rsi
   1400016f8:	ret
   1400016f9:	int3
   1400016fa:	int3
   1400016fb:	int3
   1400016fc:	int3
   1400016fd:	int3
   1400016fe:	int3
   1400016ff:	int3
   140001700:	mov    QWORD PTR [rsp+0x18],rbx
   140001705:	mov    QWORD PTR [rsp+0x20],rsi
   14000170a:	push   rdi
   14000170b:	push   r12
   14000170d:	push   r13
   14000170f:	push   r14
   140001711:	push   r15
   140001713:	sub    rsp,0x50
   140001717:	mov    rbx,rdx
   14000171a:	mov    rdi,rcx
   14000171d:	mov    QWORD PTR [rsp+0x28],rcx
   140001722:	xor    esi,esi
   140001724:	mov    DWORD PTR [rsp+0x24],esi
   140001728:	xor    r15b,r15b
   14000172b:	mov    BYTE PTR [rsp+0x20],r15b
   140001730:	mov    r12,rcx
   140001733:	mov    QWORD PTR [rsp+0x30],rcx
   140001738:	mov    rax,QWORD PTR [rcx]
   14000173b:	movsxd rcx,DWORD PTR [rax+0x4]
   14000173f:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001744:	test   rcx,rcx
   140001747:	je     0x140001750
   140001749:	mov    rax,QWORD PTR [rcx]
   14000174c:	call   QWORD PTR [rax+0x8]
   14000174f:	nop
   140001750:	xor    edx,edx
   140001752:	mov    rcx,rdi
   140001755:	call   QWORD PTR [rip+0x18ed]        # 0x140003048
   14000175b:	mov    BYTE PTR [rsp+0x38],al
   14000175f:	test   al,al
   140001761:	je     0x14000188e
   140001767:	mov    rax,QWORD PTR [rdi]
   14000176a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000176e:	add    rcx,rdi
   140001771:	lea    rdx,[rsp+0x40]
   140001776:	call   QWORD PTR [rip+0x1914]        # 0x140003090
   14000177c:	nop
   14000177d:	mov    rcx,rax
   140001780:	call   0x140001400
   140001785:	mov    r13,rax
   140001788:	mov    rcx,QWORD PTR [rsp+0x48]
   14000178d:	test   rcx,rcx
   140001790:	je     0x1400017aa
   140001792:	mov    rax,QWORD PTR [rcx]
   140001795:	call   QWORD PTR [rax+0x10]
   140001798:	mov    rcx,rax
   14000179b:	test   rax,rax
   14000179e:	je     0x1400017aa
   1400017a0:	mov    rax,QWORD PTR [rax]
   1400017a3:	mov    edx,0x1
   1400017a8:	call   QWORD PTR [rax]
   1400017aa:	mov    QWORD PTR [rbx+0x10],0x0
   1400017b2:	cmp    QWORD PTR [rbx+0x18],0xf
   1400017b7:	jbe    0x1400017be
   1400017b9:	mov    rax,QWORD PTR [rbx]
   1400017bc:	jmp    0x1400017c1
   1400017be:	mov    rax,rbx
   1400017c1:	mov    BYTE PTR [rax],0x0
   1400017c4:	mov    rax,QWORD PTR [rdi]
   1400017c7:	movsxd rcx,DWORD PTR [rax+0x4]
   1400017cb:	mov    r14,QWORD PTR [rcx+rdi*1+0x28]
   1400017d0:	movabs rax,0x7fffffffffffffff
   1400017da:	test   r14,r14
   1400017dd:	jle    0x1400017e4
   1400017df:	cmp    r14,rax
   1400017e2:	jb     0x1400017e7
   1400017e4:	mov    r14,rax
   1400017e7:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400017ec:	call   QWORD PTR [rip+0x1876]        # 0x140003068
   1400017f2:	test   r14,r14
   1400017f5:	je     0x140001805
   1400017f7:	cmp    eax,0xffffffff
   1400017fa:	jne    0x14000180a
   1400017fc:	mov    esi,0x1
   140001801:	mov    DWORD PTR [rsp+0x24],esi
   140001805:	jmp    0x14000188e
   14000180a:	movzx  r9d,al
   14000180e:	mov    rax,QWORD PTR [r13+0x18]
   140001812:	test   BYTE PTR [rax+r9*2],0x48
   140001817:	jne    0x140001805
   140001819:	mov    rcx,QWORD PTR [rbx+0x10]
   14000181d:	mov    rdx,QWORD PTR [rbx+0x18]
   140001821:	cmp    rcx,rdx
   140001824:	jae    0x140001850
   140001826:	lea    rax,[rcx+0x1]
   14000182a:	mov    QWORD PTR [rbx+0x10],rax
   14000182e:	cmp    rdx,0xf
   140001832:	jbe    0x140001842
   140001834:	mov    rax,QWORD PTR [rbx]
   140001837:	mov    BYTE PTR [rcx+rax*1],r9b
   14000183b:	mov    BYTE PTR [rcx+rax*1+0x1],0x0
   140001840:	jmp    0x140001858
   140001842:	mov    rax,rbx
   140001845:	mov    BYTE PTR [rcx+rbx*1],r9b
   140001849:	mov    BYTE PTR [rcx+rbx*1+0x1],0x0
   14000184e:	jmp    0x140001858
   140001850:	mov    rcx,rbx
   140001853:	call   0x140001a30
   140001858:	mov    r15b,0x1
   14000185b:	mov    BYTE PTR [rsp+0x20],r15b
   140001860:	dec    r14
   140001863:	mov    rax,QWORD PTR [rdi]
   140001866:	movsxd rcx,DWORD PTR [rax+0x4]
   14000186a:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   14000186f:	call   QWORD PTR [rip+0x17fb]        # 0x140003070
   140001875:	jmp    0x1400017f2
   14000187a:	mov    esi,DWORD PTR [rsp+0x24]
   14000187e:	movzx  r15d,BYTE PTR [rsp+0x20]
   140001884:	mov    r12,QWORD PTR [rsp+0x30]
   140001889:	mov    rdi,QWORD PTR [rsp+0x28]
   14000188e:	mov    rax,QWORD PTR [rdi]
   140001891:	movsxd rcx,DWORD PTR [rax+0x4]
   140001895:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   14000189e:	test   r15b,r15b
   1400018a1:	jne    0x1400018a6
   1400018a3:	or     esi,0x2
   1400018a6:	mov    rax,QWORD PTR [rdi]
   1400018a9:	movsxd rcx,DWORD PTR [rax+0x4]
   1400018ad:	add    rcx,rdi
   1400018b0:	xor    r8d,r8d
   1400018b3:	mov    edx,esi
   1400018b5:	call   QWORD PTR [rip+0x17a5]        # 0x140003060
   1400018bb:	nop
   1400018bc:	mov    rcx,QWORD PTR [r12]
   1400018c0:	movsxd rdx,DWORD PTR [rcx+0x4]
   1400018c4:	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   1400018c9:	test   rcx,rcx
   1400018cc:	je     0x1400018d5
   1400018ce:	mov    rdx,QWORD PTR [rcx]
   1400018d1:	call   QWORD PTR [rdx+0x10]
   1400018d4:	nop
   1400018d5:	mov    rax,rdi
   1400018d8:	lea    r11,[rsp+0x50]
   1400018dd:	mov    rbx,QWORD PTR [r11+0x40]
   1400018e1:	mov    rsi,QWORD PTR [r11+0x48]
   1400018e5:	mov    rsp,r11
   1400018e8:	pop    r15
   1400018ea:	pop    r14
   1400018ec:	pop    r13
   1400018ee:	pop    r12
   1400018f0:	pop    rdi
   1400018f1:	ret
   1400018f2:	int3
   1400018f3:	int3
   1400018f4:	int3
   1400018f5:	int3
   1400018f6:	int3
   1400018f7:	int3
   1400018f8:	int3
   1400018f9:	int3
   1400018fa:	int3
   1400018fb:	int3
   1400018fc:	int3
   1400018fd:	int3
   1400018fe:	int3
   1400018ff:	int3
   140001900:	rex push rbx
   140001902:	sub    rsp,0x20
   140001906:	mov    rdx,QWORD PTR [rcx+0x18]
   14000190a:	mov    rbx,rcx
   14000190d:	cmp    rdx,0xf
   140001911:	jbe    0x140001948
   140001913:	mov    rax,QWORD PTR [rcx]
   140001916:	inc    rdx
   140001919:	cmp    rdx,0x1000
   140001920:	jb     0x140001940
   140001922:	mov    rcx,QWORD PTR [rax-0x8]
   140001926:	sub    rax,rcx
   140001929:	sub    rax,0x8
   14000192d:	cmp    rax,0x1f
   140001931:	ja     0x140001939
   140001933:	add    rdx,0x27
   140001937:	jmp    0x140001943
   140001939:	mov    ecx,0x5
   14000193e:	int    0x29
   140001940:	mov    rcx,rax
   140001943:	call   0x140001e94
   140001948:	mov    QWORD PTR [rbx+0x10],0x0
   140001950:	mov    QWORD PTR [rbx+0x18],0xf
   140001958:	mov    BYTE PTR [rbx],0x0
   14000195b:	add    rsp,0x20
   14000195f:	pop    rbx
   140001960:	ret
   140001961:	int3
   140001962:	int3
   140001963:	int3
   140001964:	int3
   140001965:	int3
   140001966:	int3
   140001967:	int3
   140001968:	int3
   140001969:	int3
   14000196a:	int3
   14000196b:	int3
   14000196c:	int3
   14000196d:	int3
   14000196e:	int3
   14000196f:	int3
   140001970:	sub    rsp,0x28
   140001974:	mov    rdx,QWORD PTR [rcx]
   140001977:	mov    rax,QWORD PTR [rdx]
   14000197a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000197e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001983:	test   rcx,rcx
   140001986:	je     0x14000198f
   140001988:	mov    rax,QWORD PTR [rcx]
   14000198b:	call   QWORD PTR [rax+0x10]
   14000198e:	nop
   14000198f:	add    rsp,0x28
   140001993:	ret
   140001994:	int3
   140001995:	int3
   140001996:	int3
   140001997:	int3
   140001998:	int3
   140001999:	int3
   14000199a:	int3
   14000199b:	int3
   14000199c:	int3
   14000199d:	int3
   14000199e:	int3
   14000199f:	int3
   1400019a0:	sub    rsp,0x28
   1400019a4:	mov    rdx,QWORD PTR [rcx]
   1400019a7:	mov    rax,QWORD PTR [rdx]
   1400019aa:	movsxd rcx,DWORD PTR [rax+0x4]
   1400019ae:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   1400019b3:	test   rcx,rcx
   1400019b6:	je     0x1400019bf
   1400019b8:	mov    rax,QWORD PTR [rcx]
   1400019bb:	call   QWORD PTR [rax+0x10]
   1400019be:	nop
   1400019bf:	add    rsp,0x28
   1400019c3:	ret
   1400019c4:	int3
   1400019c5:	int3
   1400019c6:	int3
   1400019c7:	int3
   1400019c8:	int3
   1400019c9:	int3
   1400019ca:	int3
   1400019cb:	int3
   1400019cc:	int3
   1400019cd:	int3
   1400019ce:	int3
   1400019cf:	int3
   1400019d0:	rex push rbx
   1400019d2:	sub    rsp,0x20
   1400019d6:	mov    rbx,rcx
   1400019d9:	call   QWORD PTR [rip+0x16f1]        # 0x1400030d0
   1400019df:	test   eax,eax
   1400019e1:	jne    0x1400019ed
   1400019e3:	mov    rcx,QWORD PTR [rbx]
   1400019e6:	call   QWORD PTR [rip+0x1664]        # 0x140003050
   1400019ec:	nop
   1400019ed:	mov    rdx,QWORD PTR [rbx]
   1400019f0:	mov    rax,QWORD PTR [rdx]
   1400019f3:	movsxd rcx,DWORD PTR [rax+0x4]
   1400019f7:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   1400019fc:	test   rcx,rcx
   1400019ff:	je     0x140001a08
   140001a01:	mov    rax,QWORD PTR [rcx]
   140001a04:	call   QWORD PTR [rax+0x10]
   140001a07:	nop
   140001a08:	add    rsp,0x20
   140001a0c:	pop    rbx
   140001a0d:	ret
   140001a0e:	int3
   140001a0f:	int3
   140001a10:	mov    rcx,QWORD PTR [rcx]
   140001a13:	test   rcx,rcx
   140001a16:	je     0x140001a23
   140001a18:	mov    rax,QWORD PTR [rcx]
   140001a1b:	mov    edx,0x1
   140001a20:	rex.W jmp QWORD PTR [rax]
   140001a23:	ret
   140001a24:	int3
   140001a25:	int3
   140001a26:	int3
   140001a27:	int3
   140001a28:	int3
   140001a29:	int3
   140001a2a:	int3
   140001a2b:	int3
   140001a2c:	int3
   140001a2d:	int3
   140001a2e:	int3
   140001a2f:	int3
   140001a30:	rex push rbx
   140001a32:	push   rsi
   140001a33:	push   r12
   140001a35:	push   r14
   140001a37:	sub    rsp,0x28
   140001a3b:	mov    r14,QWORD PTR [rcx+0x10]
   140001a3f:	movabs rbx,0x7fffffffffffffff
   140001a49:	mov    rax,rbx
   140001a4c:	movzx  r12d,r9b
   140001a50:	sub    rax,r14
   140001a53:	mov    rsi,rcx
   140001a56:	cmp    rax,0x1
   140001a5a:	jb     0x140001b88
   140001a60:	mov    QWORD PTR [rsp+0x58],rbp
   140001a65:	lea    rbp,[r14+0x1]
   140001a69:	mov    QWORD PTR [rsp+0x60],rdi
   140001a6e:	mov    QWORD PTR [rsp+0x20],r15
   140001a73:	mov    r15,QWORD PTR [rcx+0x18]
   140001a77:	mov    rcx,rbp
   140001a7a:	or     rcx,0xf
   140001a7e:	cmp    rcx,rbx
   140001a81:	ja     0x140001ac6
   140001a83:	mov    rdx,r15
   140001a86:	mov    rax,rbx
   140001a89:	shr    rdx,1
   140001a8c:	sub    rax,rdx
   140001a8f:	cmp    r15,rax
   140001a92:	ja     0x140001ac6
   140001a94:	lea    rax,[r15+rdx*1]
   140001a98:	mov    rbx,rcx
   140001a9b:	cmp    rcx,rax
   140001a9e:	cmovb  rbx,rax
   140001aa2:	lea    rax,[rbx+0x1]
   140001aa6:	test   rax,rax
   140001aa9:	jne    0x140001aaf
   140001aab:	xor    edi,edi
   140001aad:	jmp    0x140001af3
   140001aaf:	cmp    rax,0x1000
   140001ab5:	jb     0x140001ae8
   140001ab7:	lea    rcx,[rax+0x27]
   140001abb:	cmp    rcx,rax
   140001abe:	jbe    0x140001b8e
   140001ac4:	jmp    0x140001ad0
   140001ac6:	movabs rcx,0x8000000000000027
   140001ad0:	call   0x140001c10
   140001ad5:	test   rax,rax
   140001ad8:	je     0x140001b45
   140001ada:	lea    rdi,[rax+0x27]
   140001ade:	and    rdi,0xffffffffffffffe0
   140001ae2:	mov    QWORD PTR [rdi-0x8],rax
   140001ae6:	jmp    0x140001af3
   140001ae8:	mov    rcx,rax
   140001aeb:	call   0x140001c10
   140001af0:	mov    rdi,rax
   140001af3:	mov    QWORD PTR [rsi+0x10],rbp
   140001af7:	mov    r8,r14
   140001afa:	mov    QWORD PTR [rsi+0x18],rbx
   140001afe:	mov    rcx,rdi
   140001b01:	cmp    r15,0xf
   140001b05:	jbe    0x140001b56
   140001b07:	mov    rbx,QWORD PTR [rsi]
   140001b0a:	mov    rdx,rbx
   140001b0d:	call   0x140002849
   140001b12:	lea    rdx,[r15+0x1]
   140001b16:	mov    BYTE PTR [r14+rdi*1],r12b
   140001b1a:	mov    BYTE PTR [r14+rdi*1+0x1],0x0
   140001b20:	cmp    rdx,0x1000
   140001b27:	jb     0x140001b4c
   140001b29:	mov    rcx,QWORD PTR [rbx-0x8]
   140001b2d:	sub    rbx,rcx
   140001b30:	sub    rbx,0x8
   140001b34:	cmp    rbx,0x1f
   140001b38:	ja     0x140001b45
   140001b3a:	add    rdx,0x27
   140001b3e:	call   0x140001e94
   140001b43:	jmp    0x140001b68
   140001b45:	mov    ecx,0x5
   140001b4a:	int    0x29
   140001b4c:	mov    rcx,rbx
   140001b4f:	call   0x140001e94
   140001b54:	jmp    0x140001b68
   140001b56:	mov    rdx,rsi
   140001b59:	call   0x140002849
   140001b5e:	mov    BYTE PTR [r14+rdi*1],r12b
   140001b62:	mov    BYTE PTR [r14+rdi*1+0x1],0x0
   140001b68:	mov    rax,rsi
   140001b6b:	mov    QWORD PTR [rax],rdi
   140001b6e:	mov    rdi,QWORD PTR [rsp+0x60]
   140001b73:	mov    rbp,QWORD PTR [rsp+0x58]
   140001b78:	mov    r15,QWORD PTR [rsp+0x20]
   140001b7d:	add    rsp,0x28
   140001b81:	pop    r14
   140001b83:	pop    r12
   140001b85:	pop    rsi
   140001b86:	pop    rbx
   140001b87:	ret
   140001b88:	call   0x1400011c0
   140001b8d:	int3
   140001b8e:	call   0x140001120
   140001b93:	int3
   140001b94:	jmp    QWORD PTR [rip+0x154e]        # 0x1400030e8
   140001b9a:	int3
   140001b9b:	int3
   140001b9c:	rex push rbx
   140001b9e:	sub    rsp,0x20
   140001ba2:	mov    rbx,rcx
   140001ba5:	mov    ecx,0x10
   140001baa:	call   QWORD PTR [rip+0x15b0]        # 0x140003160
   140001bb0:	mov    rdx,rax
   140001bb3:	test   rax,rax
   140001bb6:	je     0x140001bd3
   140001bb8:	mov    rax,QWORD PTR [rip+0x35e1]        # 0x1400051a0
   140001bbf:	mov    QWORD PTR [rdx],rax
   140001bc2:	mov    QWORD PTR [rdx+0x8],rbx
   140001bc6:	mov    QWORD PTR [rip+0x35d3],rdx        # 0x1400051a0
   140001bcd:	add    rsp,0x20
   140001bd1:	pop    rbx
   140001bd2:	ret
   140001bd3:	call   0x140001bd9
   140001bd8:	int3
   140001bd9:	jmp    QWORD PTR [rip+0x14c9]        # 0x1400030a8
   140001bdf:	int3
   140001be0:	int3
   140001be1:	int3
   140001be2:	int3
   140001be3:	int3
   140001be4:	int3
   140001be5:	int3
   140001be6:	data16 nop WORD PTR [rax+rax*1+0x0]
   140001bf0:	cmp    rcx,QWORD PTR [rip+0x3449]        # 0x140005040
   140001bf7:	jne    0x140001c09
   140001bf9:	rol    rcx,0x10
   140001bfd:	test   cx,0xffff
   140001c02:	jne    0x140001c05
   140001c04:	ret
   140001c05:	ror    rcx,0x10
   140001c09:	jmp    0x140002140
   140001c0e:	int3
   140001c0f:	int3
   140001c10:	rex push rbx
   140001c12:	sub    rsp,0x20
   140001c16:	mov    rbx,rcx
   140001c19:	jmp    0x140001c2a
   140001c1b:	mov    rcx,rbx
   140001c1e:	call   0x1400026d0
   140001c23:	test   eax,eax
   140001c25:	je     0x140001c3a
   140001c27:	mov    rcx,rbx
   140001c2a:	call   0x1400026ca
   140001c2f:	test   rax,rax
   140001c32:	je     0x140001c1b
   140001c34:	add    rsp,0x20
   140001c38:	pop    rbx
   140001c39:	ret
   140001c3a:	cmp    rbx,0xffffffffffffffff
   140001c3e:	je     0x140001c46
   140001c40:	call   0x14000216c
   140001c45:	int3
   140001c46:	call   0x140001120
   140001c4b:	int3
   140001c4c:	sub    rsp,0x28
   140001c50:	call   0x140002430
   140001c55:	test   eax,eax
   140001c57:	je     0x140001c7a
   140001c59:	mov    rax,QWORD PTR gs:0x30
   140001c62:	mov    rcx,QWORD PTR [rax+0x8]
   140001c66:	jmp    0x140001c6d
   140001c68:	cmp    rcx,rax
   140001c6b:	je     0x140001c81
   140001c6d:	xor    eax,eax
   140001c6f:	lock cmpxchg QWORD PTR [rip+0x3540],rcx        # 0x1400051b8
   140001c78:	jne    0x140001c68
   140001c7a:	xor    al,al
   140001c7c:	add    rsp,0x28
   140001c80:	ret
   140001c81:	mov    al,0x1
   140001c83:	jmp    0x140001c7c
   140001c85:	int3
   140001c86:	int3
   140001c87:	int3
   140001c88:	sub    rsp,0x28
   140001c8c:	test   ecx,ecx
   140001c8e:	jne    0x140001c97
   140001c90:	mov    BYTE PTR [rip+0x3529],0x1        # 0x1400051c0
   140001c97:	call   0x14000218c
   140001c9c:	call   0x1400025d8
   140001ca1:	test   al,al
   140001ca3:	jne    0x140001ca9
   140001ca5:	xor    al,al
   140001ca7:	jmp    0x140001cbd
   140001ca9:	call   0x1400025d8
   140001cae:	test   al,al
   140001cb0:	jne    0x140001cbb
   140001cb2:	xor    ecx,ecx
   140001cb4:	call   0x1400025d8
   140001cb9:	jmp    0x140001ca5
   140001cbb:	mov    al,0x1
   140001cbd:	add    rsp,0x28
   140001cc1:	ret
   140001cc2:	int3
   140001cc3:	int3
   140001cc4:	rex push rbx
   140001cc6:	sub    rsp,0x20
   140001cca:	cmp    BYTE PTR [rip+0x34f0],0x0        # 0x1400051c1
   140001cd1:	mov    ebx,ecx
   140001cd3:	jne    0x140001d3c
   140001cd5:	cmp    ecx,0x1
   140001cd8:	ja     0x140001d44
   140001cda:	call   0x140002430
   140001cdf:	test   eax,eax
   140001ce1:	je     0x140001d0b
   140001ce3:	test   ebx,ebx
   140001ce5:	jne    0x140001d0b
   140001ce7:	lea    rcx,[rip+0x34da]        # 0x1400051c8
   140001cee:	call   0x1400026e2
   140001cf3:	test   eax,eax
   140001cf5:	jne    0x140001d07
   140001cf7:	lea    rcx,[rip+0x34e2]        # 0x1400051e0
   140001cfe:	call   0x1400026e2
   140001d03:	test   eax,eax
   140001d05:	je     0x140001d35
   140001d07:	xor    al,al
   140001d09:	jmp    0x140001d3e
   140001d0b:	movdqa xmm0,XMMWORD PTR [rip+0x15ed]        # 0x140003300
   140001d13:	or     rax,0xffffffffffffffff
   140001d17:	movdqu XMMWORD PTR [rip+0x34a9],xmm0        # 0x1400051c8
   140001d1f:	mov    QWORD PTR [rip+0x34b2],rax        # 0x1400051d8
   140001d26:	movdqu XMMWORD PTR [rip+0x34b2],xmm0        # 0x1400051e0
   140001d2e:	mov    QWORD PTR [rip+0x34bb],rax        # 0x1400051f0
   140001d35:	mov    BYTE PTR [rip+0x3485],0x1        # 0x1400051c1
   140001d3c:	mov    al,0x1
   140001d3e:	add    rsp,0x20
   140001d42:	pop    rbx
   140001d43:	ret
   140001d44:	mov    ecx,0x5
   140001d49:	call   0x14000243c
   140001d4e:	int3
   140001d4f:	int3
   140001d50:	sub    rsp,0x18
   140001d54:	mov    r8,rcx
   140001d57:	mov    eax,0x5a4d
   140001d5c:	cmp    WORD PTR [rip+0xffffffffffffe29d],ax        # 0x140000000
   140001d63:	jne    0x140001ddd
   140001d65:	movsxd rcx,DWORD PTR [rip+0xffffffffffffe2d0]        # 0x14000003c
   140001d6c:	lea    rdx,[rip+0xffffffffffffe28d]        # 0x140000000
   140001d73:	add    rcx,rdx
   140001d76:	cmp    DWORD PTR [rcx],0x4550
   140001d7c:	jne    0x140001ddd
   140001d7e:	mov    eax,0x20b
   140001d83:	cmp    WORD PTR [rcx+0x18],ax
   140001d87:	jne    0x140001ddd
   140001d89:	sub    r8,rdx
   140001d8c:	movzx  edx,WORD PTR [rcx+0x14]
   140001d90:	add    rdx,0x18
   140001d94:	add    rdx,rcx
   140001d97:	movzx  eax,WORD PTR [rcx+0x6]
   140001d9b:	lea    rcx,[rax+rax*4]
   140001d9f:	lea    r9,[rdx+rcx*8]
   140001da3:	mov    QWORD PTR [rsp],rdx
   140001da7:	cmp    rdx,r9
   140001daa:	je     0x140001dc4
   140001dac:	mov    ecx,DWORD PTR [rdx+0xc]
   140001daf:	cmp    r8,rcx
   140001db2:	jb     0x140001dbe
   140001db4:	mov    eax,DWORD PTR [rdx+0x8]
   140001db7:	add    eax,ecx
   140001db9:	cmp    r8,rax
   140001dbc:	jb     0x140001dc6
   140001dbe:	add    rdx,0x28
   140001dc2:	jmp    0x140001da3
   140001dc4:	xor    edx,edx
   140001dc6:	test   rdx,rdx
   140001dc9:	jne    0x140001dcf
   140001dcb:	xor    al,al
   140001dcd:	jmp    0x140001de3
   140001dcf:	cmp    DWORD PTR [rdx+0x24],0x0
   140001dd3:	jge    0x140001dd9
   140001dd5:	xor    al,al
   140001dd7:	jmp    0x140001de3
   140001dd9:	mov    al,0x1
   140001ddb:	jmp    0x140001de3
   140001ddd:	xor    al,al
   140001ddf:	jmp    0x140001de3
   140001de1:	xor    al,al
   140001de3:	add    rsp,0x18
   140001de7:	ret
   140001de8:	rex push rbx
   140001dea:	sub    rsp,0x20
   140001dee:	mov    bl,cl
   140001df0:	call   0x140002430
   140001df5:	xor    edx,edx
   140001df7:	test   eax,eax
   140001df9:	je     0x140001e06
   140001dfb:	test   bl,bl
   140001dfd:	jne    0x140001e06
   140001dff:	xchg   QWORD PTR [rip+0x33b2],rdx        # 0x1400051b8
   140001e06:	add    rsp,0x20
   140001e0a:	pop    rbx
   140001e0b:	ret
   140001e0c:	rex push rbx
   140001e0e:	sub    rsp,0x20
   140001e12:	cmp    BYTE PTR [rip+0x33a7],0x0        # 0x1400051c0
   140001e19:	mov    bl,cl
   140001e1b:	je     0x140001e21
   140001e1d:	test   dl,dl
   140001e1f:	jne    0x140001e2d
   140001e21:	call   0x1400025d8
   140001e26:	mov    cl,bl
   140001e28:	call   0x1400025d8
   140001e2d:	mov    al,0x1
   140001e2f:	add    rsp,0x20
   140001e33:	pop    rbx
   140001e34:	ret
   140001e35:	int3
   140001e36:	int3
   140001e37:	int3
   140001e38:	rex push rbx
   140001e3a:	sub    rsp,0x20
   140001e3e:	cmp    QWORD PTR [rip+0x3382],0xffffffffffffffff        # 0x1400051c8
   140001e46:	mov    rbx,rcx
   140001e49:	jne    0x140001e52
   140001e4b:	call   0x1400026ee
   140001e50:	jmp    0x140001e61
   140001e52:	mov    rdx,rbx
   140001e55:	lea    rcx,[rip+0x336c]        # 0x1400051c8
   140001e5c:	call   0x1400026e8
   140001e61:	xor    edx,edx
   140001e63:	test   eax,eax
   140001e65:	cmove  rdx,rbx
   140001e69:	mov    rax,rdx
   140001e6c:	add    rsp,0x20
   140001e70:	pop    rbx
   140001e71:	ret
   140001e72:	int3
   140001e73:	int3
   140001e74:	sub    rsp,0x28
   140001e78:	call   0x140001e38
   140001e7d:	neg    rax
   140001e80:	sbb    eax,eax
   140001e82:	neg    eax
   140001e84:	dec    eax
   140001e86:	add    rsp,0x28
   140001e8a:	ret
   140001e8b:	int3
   140001e8c:	jmp    0x1400026c4
   140001e91:	int3
   140001e92:	int3
   140001e93:	int3
   140001e94:	jmp    0x140001e8c
   140001e99:	int3
   140001e9a:	int3
   140001e9b:	int3
   140001e9c:	rex push rbx
   140001e9e:	sub    rsp,0x20
   140001ea2:	lea    rax,[rip+0x146f]        # 0x140003318
   140001ea9:	mov    rbx,rcx
   140001eac:	mov    QWORD PTR [rcx],rax
   140001eaf:	test   dl,0x1
   140001eb2:	je     0x140001ebe
   140001eb4:	mov    edx,0x18
   140001eb9:	call   0x140001e94
   140001ebe:	mov    rax,rbx
   140001ec1:	add    rsp,0x20
   140001ec5:	pop    rbx
   140001ec6:	ret
   140001ec7:	int3
   140001ec8:	rex push rbx
   140001eca:	sub    rsp,0x20
   140001ece:	mov    ecx,0x1
   140001ed3:	call   0x140002700
   140001ed8:	call   0x1400025c0
   140001edd:	mov    ecx,eax
   140001edf:	call   0x14000272a
   140001ee4:	call   0x14000244c
   140001ee9:	mov    ebx,eax
   140001eeb:	call   0x140002754
   140001ef0:	mov    ecx,0x1
   140001ef5:	mov    DWORD PTR [rax],ebx
   140001ef7:	call   0x140001cc4
   140001efc:	test   al,al
   140001efe:	je     0x140001f73
   140001f00:	call   0x140002624
   140001f05:	lea    rcx,[rip+0x754]        # 0x140002660
   140001f0c:	call   0x140001e74
   140001f11:	call   0x140002428
   140001f16:	mov    ecx,eax
   140001f18:	call   0x1400026d6
   140001f1d:	test   eax,eax
   140001f1f:	jne    0x140001f73
   140001f21:	call   0x1400025c8
   140001f26:	call   0x140002608
   140001f2b:	test   eax,eax
   140001f2d:	je     0x140001f3b
   140001f2f:	lea    rcx,[rip+0x516]        # 0x14000244c
   140001f36:	call   0x140002706
   140001f3b:	call   0x14000213c
   140001f40:	call   0x14000213c
   140001f45:	call   0x14000244c
   140001f4a:	mov    ecx,eax
   140001f4c:	call   0x140002748
   140001f51:	call   0x1400025d8
   140001f56:	test   al,al
   140001f58:	je     0x140001f5f
   140001f5a:	call   0x1400026dc
   140001f5f:	call   0x14000244c
   140001f64:	call   0x140002444
   140001f69:	test   eax,eax
   140001f6b:	jne    0x140001f73
   140001f6d:	add    rsp,0x20
   140001f71:	pop    rbx
   140001f72:	ret
   140001f73:	mov    ecx,0x7
   140001f78:	call   0x14000243c
   140001f7d:	int3
   140001f7e:	int3
   140001f7f:	int3
   140001f80:	sub    rsp,0x28
   140001f84:	call   0x1400025ec
   140001f89:	xor    eax,eax
   140001f8b:	add    rsp,0x28
   140001f8f:	ret
   140001f90:	sub    rsp,0x28
   140001f94:	call   0x1400024a4
   140001f99:	call   0x14000244c
   140001f9e:	mov    ecx,eax
   140001fa0:	add    rsp,0x28
   140001fa4:	jmp    0x14000274e
   140001fa9:	int3
   140001faa:	int3
   140001fab:	int3
   140001fac:	mov    QWORD PTR [rsp+0x8],rbx
   140001fb1:	mov    QWORD PTR [rsp+0x10],rsi
   140001fb6:	push   rdi
   140001fb7:	sub    rsp,0x30
   140001fbb:	mov    ecx,0x1
   140001fc0:	call   0x140001c88
   140001fc5:	test   al,al
   140001fc7:	je     0x140002103
   140001fcd:	xor    sil,sil
   140001fd0:	mov    BYTE PTR [rsp+0x20],sil
   140001fd5:	call   0x140001c4c
   140001fda:	mov    bl,al
   140001fdc:	mov    ecx,DWORD PTR [rip+0x31ce]        # 0x1400051b0
   140001fe2:	cmp    ecx,0x1
   140001fe5:	je     0x14000210e
   140001feb:	test   ecx,ecx
   140001fed:	jne    0x140002039
   140001fef:	mov    DWORD PTR [rip+0x31b7],0x1        # 0x1400051b0
   140001ff9:	lea    rdx,[rip+0x12d8]        # 0x1400032d8
   140002000:	lea    rcx,[rip+0x12b9]        # 0x1400032c0
   140002007:	call   0x140002718
   14000200c:	test   eax,eax
   14000200e:	je     0x14000201a
   140002010:	mov    eax,0xff
   140002015:	jmp    0x1400020f3
   14000201a:	lea    rdx,[rip+0x1297]        # 0x1400032b8
   140002021:	lea    rcx,[rip+0x1270]        # 0x140003298
   140002028:	call   0x140002712
   14000202d:	mov    DWORD PTR [rip+0x3179],0x2        # 0x1400051b0
   140002037:	jmp    0x140002041
   140002039:	mov    sil,0x1
   14000203c:	mov    BYTE PTR [rsp+0x20],sil
   140002041:	mov    cl,bl
   140002043:	call   0x140001de8
   140002048:	call   0x140002614
   14000204d:	mov    rbx,rax
   140002050:	cmp    QWORD PTR [rax],0x0
   140002054:	je     0x140002074
   140002056:	mov    rcx,rax
   140002059:	call   0x140001d50
   14000205e:	test   al,al
   140002060:	je     0x140002074
   140002062:	xor    r8d,r8d
   140002065:	lea    edx,[r8+0x2]
   140002069:	xor    ecx,ecx
   14000206b:	mov    rax,QWORD PTR [rbx]
   14000206e:	call   QWORD PTR [rip+0x11fc]        # 0x140003270
   140002074:	call   0x14000261c
   140002079:	mov    rbx,rax
   14000207c:	cmp    QWORD PTR [rax],0x0
   140002080:	je     0x140002096
   140002082:	mov    rcx,rax
   140002085:	call   0x140001d50
   14000208a:	test   al,al
   14000208c:	je     0x140002096
   14000208e:	mov    rcx,QWORD PTR [rbx]
   140002091:	call   0x140002742
   140002096:	call   0x14000270c
   14000209b:	mov    rdi,rax
   14000209e:	call   0x140002736
   1400020a3:	mov    rbx,QWORD PTR [rax]
   1400020a6:	call   0x140002730
   1400020ab:	mov    r8,rdi
   1400020ae:	mov    rdx,rbx
   1400020b1:	mov    ecx,DWORD PTR [rax]
   1400020b3:	call   0x1400012a0
   1400020b8:	mov    ebx,eax
   1400020ba:	call   0x140002450
   1400020bf:	test   al,al
   1400020c1:	je     0x140002118
   1400020c3:	test   sil,sil
   1400020c6:	jne    0x1400020cd
   1400020c8:	call   0x1400026f4
   1400020cd:	xor    edx,edx
   1400020cf:	mov    cl,0x1
   1400020d1:	call   0x140001e0c
   1400020d6:	mov    eax,ebx
   1400020d8:	jmp    0x1400020f3
   1400020da:	mov    ebx,eax
   1400020dc:	call   0x140002450
   1400020e1:	test   al,al
   1400020e3:	je     0x140002120
   1400020e5:	cmp    BYTE PTR [rsp+0x20],0x0
   1400020ea:	jne    0x1400020f1
   1400020ec:	call   0x14000273c
   1400020f1:	mov    eax,ebx
   1400020f3:	mov    rbx,QWORD PTR [rsp+0x40]
   1400020f8:	mov    rsi,QWORD PTR [rsp+0x48]
   1400020fd:	add    rsp,0x30
   140002101:	pop    rdi
   140002102:	ret
   140002103:	mov    ecx,0x7
   140002108:	call   0x14000243c
   14000210d:	nop
   14000210e:	mov    ecx,0x7
   140002113:	call   0x14000243c
   140002118:	mov    ecx,ebx
   14000211a:	call   0x14000271e
   14000211f:	nop
   140002120:	mov    ecx,ebx
   140002122:	call   0x140002724
   140002127:	nop
   140002128:	sub    rsp,0x28
   14000212c:	call   0x140002510
   140002131:	add    rsp,0x28
   140002135:	jmp    0x140001fac
   14000213a:	int3
   14000213b:	int3
   14000213c:	ret    0x0
   14000213f:	int3
   140002140:	mov    ecx,0x2
   140002145:	int    0x29
   140002147:	ret
   140002148:	lea    rax,[rip+0x1201]        # 0x140003350
   14000214f:	mov    QWORD PTR [rcx+0x10],0x0
   140002157:	mov    QWORD PTR [rcx+0x8],rax
   14000215b:	lea    rax,[rip+0x11de]        # 0x140003340
   140002162:	mov    QWORD PTR [rcx],rax
   140002165:	mov    rax,rcx
   140002168:	ret
   140002169:	int3
   14000216a:	int3
   14000216b:	int3
   14000216c:	sub    rsp,0x48
   140002170:	lea    rcx,[rsp+0x20]
   140002175:	call   0x140002148
   14000217a:	lea    rdx,[rip+0x1e57]        # 0x140003fd8
   140002181:	lea    rcx,[rsp+0x20]
   140002186:	call   0x1400026b2
   14000218b:	int3
   14000218c:	mov    QWORD PTR [rsp+0x10],rbx
   140002191:	mov    QWORD PTR [rsp+0x18],rbp
   140002196:	mov    QWORD PTR [rsp+0x20],rsi
   14000219b:	push   rdi
   14000219c:	sub    rsp,0x10
   1400021a0:	xor    eax,eax
   1400021a2:	xor    ecx,ecx
   1400021a4:	cpuid
   1400021a6:	xor    ecx,0x6c65746e
   1400021ac:	xor    edx,0x49656e69
   1400021b2:	or     edx,ecx
   1400021b4:	mov    ebp,eax
   1400021b6:	mov    eax,0x1
   1400021bb:	xor    ebx,0x756e6547
   1400021c1:	or     edx,ebx
   1400021c3:	lea    ecx,[rax-0x1]
   1400021c6:	cpuid
   1400021c8:	mov    edi,ecx
   1400021ca:	jne    0x14000222a
   1400021cc:	and    eax,0xfff3ff0
   1400021d1:	mov    QWORD PTR [rip+0x2eb4],0x8000        # 0x140005090
   1400021dc:	mov    QWORD PTR [rip+0x2eb1],0xffffffffffffffff        # 0x140005098
   1400021e7:	cmp    eax,0x106c0
   1400021ec:	je     0x140002216
   1400021ee:	cmp    eax,0x20660
   1400021f3:	je     0x140002216
   1400021f5:	cmp    eax,0x20670
   1400021fa:	je     0x140002216
   1400021fc:	add    eax,0xfffcf9b0
   140002201:	cmp    eax,0x20
   140002204:	ja     0x14000222a
   140002206:	movabs rcx,0x100010001
   140002210:	bt     rcx,rax
   140002214:	jae    0x14000222a
   140002216:	mov    r8d,DWORD PTR [rip+0x2fdb]        # 0x1400051f8
   14000221d:	or     r8d,0x1
   140002221:	mov    DWORD PTR [rip+0x2fd0],r8d        # 0x1400051f8
   140002228:	jmp    0x140002231
   14000222a:	mov    r8d,DWORD PTR [rip+0x2fc7]        # 0x1400051f8
   140002231:	xor    r9d,r9d
   140002234:	mov    r11d,r9d
   140002237:	cmp    ebp,0x7
   14000223a:	jl     0x14000227e
   14000223c:	xor    ecx,ecx
   14000223e:	lea    eax,[r9+0x7]
   140002242:	cpuid
   140002244:	mov    esi,edx
   140002246:	mov    r10d,ebx
   140002249:	bt     ebx,0x9
   14000224d:	jae    0x14000225a
   14000224f:	or     r8d,0x2
   140002253:	mov    DWORD PTR [rip+0x2f9e],r8d        # 0x1400051f8
   14000225a:	cmp    eax,0x1
   14000225d:	jl     0x14000226c
   14000225f:	mov    eax,0x7
   140002264:	lea    ecx,[rax-0x6]
   140002267:	cpuid
   140002269:	mov    r9d,edx
   14000226c:	mov    eax,0x24
   140002271:	cmp    ebp,eax
   140002273:	jl     0x140002284
   140002275:	xor    ecx,ecx
   140002277:	cpuid
   140002279:	mov    r11d,ebx
   14000227c:	jmp    0x140002284
   14000227e:	mov    r10d,r9d
   140002281:	mov    esi,r9d
   140002284:	mov    rax,QWORD PTR [rip+0x2e15]        # 0x1400050a0
   14000228b:	and    rax,0xfffffffffffffffe
   14000228f:	mov    DWORD PTR [rip+0x2def],0x1        # 0x140005088
   140002299:	mov    DWORD PTR [rip+0x2de9],0x2        # 0x14000508c
   1400022a3:	mov    QWORD PTR [rip+0x2df6],rax        # 0x1400050a0
   1400022aa:	bt     edi,0x14
   1400022ae:	jae    0x1400022cf
   1400022b0:	and    rax,0xffffffffffffffef
   1400022b4:	mov    DWORD PTR [rip+0x2dca],0x2        # 0x140005088
   1400022be:	mov    QWORD PTR [rip+0x2ddb],rax        # 0x1400050a0
   1400022c5:	mov    DWORD PTR [rip+0x2dbd],0x6        # 0x14000508c
   1400022cf:	bt     edi,0x1b
   1400022d3:	jae    0x140002410
   1400022d9:	xor    ecx,ecx
   1400022db:	xgetbv
   1400022de:	shl    rdx,0x20
   1400022e2:	or     rdx,rax
   1400022e5:	mov    QWORD PTR [rsp+0x20],rdx
   1400022ea:	bt     edi,0x1c
   1400022ee:	jae    0x1400023f4
   1400022f4:	mov    rax,QWORD PTR [rsp+0x20]
   1400022f9:	and    al,0x6
   1400022fb:	cmp    al,0x6
   1400022fd:	jne    0x1400023f4
   140002303:	mov    eax,DWORD PTR [rip+0x2d83]        # 0x14000508c
   140002309:	mov    dl,0xe0
   14000230b:	or     eax,0x8
   14000230e:	mov    DWORD PTR [rip+0x2d70],0x3        # 0x140005088
   140002318:	mov    DWORD PTR [rip+0x2d6e],eax        # 0x14000508c
   14000231e:	test   r10b,0x20
   140002322:	je     0x140002386
   140002324:	or     eax,0x20
   140002327:	mov    DWORD PTR [rip+0x2d57],0x5        # 0x140005088
   140002331:	mov    DWORD PTR [rip+0x2d55],eax        # 0x14000508c
   140002337:	mov    ecx,0xd0030000
   14000233c:	mov    rax,QWORD PTR [rip+0x2d5d]        # 0x1400050a0
   140002343:	and    r10d,ecx
   140002346:	and    rax,0xfffffffffffffffd
   14000234a:	mov    QWORD PTR [rip+0x2d4f],rax        # 0x1400050a0
   140002351:	cmp    r10d,ecx
   140002354:	jne    0x14000238d
   140002356:	mov    rax,QWORD PTR [rsp+0x20]
   14000235b:	and    al,dl
   14000235d:	cmp    al,dl
   14000235f:	jne    0x140002386
   140002361:	mov    rax,QWORD PTR [rip+0x2d38]        # 0x1400050a0
   140002368:	or     DWORD PTR [rip+0x2d1d],0x40        # 0x14000508c
   14000236f:	and    rax,0xffffffffffffffdb
   140002373:	mov    DWORD PTR [rip+0x2d0b],0x6        # 0x140005088
   14000237d:	mov    QWORD PTR [rip+0x2d1c],rax        # 0x1400050a0
   140002384:	jmp    0x14000238d
   140002386:	mov    rax,QWORD PTR [rip+0x2d13]        # 0x1400050a0
   14000238d:	bt     esi,0x17
   140002391:	jae    0x14000239f
   140002393:	btr    rax,0x18
   140002398:	mov    QWORD PTR [rip+0x2d01],rax        # 0x1400050a0
   14000239f:	bt     r9d,0x13
   1400023a4:	jae    0x1400023f4
   1400023a6:	mov    rax,QWORD PTR [rsp+0x20]
   1400023ab:	and    al,dl
   1400023ad:	cmp    al,dl
   1400023af:	jne    0x1400023f4
   1400023b1:	mov    rdx,QWORD PTR [rip+0x2ce8]        # 0x1400050a0
   1400023b8:	mov    eax,r11d
   1400023bb:	shr    rax,0x10
   1400023bf:	mov    ecx,r11d
   1400023c2:	and    eax,0x6
   1400023c5:	and    ecx,0x400ff
   1400023cb:	or     rax,0x1000029
   1400023d1:	mov    DWORD PTR [rip+0x2e25],ecx        # 0x1400051fc
   1400023d7:	not    rax
   1400023da:	and    rdx,rax
   1400023dd:	mov    QWORD PTR [rip+0x2cbc],rdx        # 0x1400050a0
   1400023e4:	cmp    cl,0x1
   1400023e7:	jbe    0x1400023f4
   1400023e9:	and    rdx,0xffffffffffffffbf
   1400023ed:	mov    QWORD PTR [rip+0x2cac],rdx        # 0x1400050a0
   1400023f4:	bt     r9d,0x15
   1400023f9:	jae    0x140002410
   1400023fb:	mov    rax,QWORD PTR [rsp+0x20]
   140002400:	bt     rax,0x13
   140002405:	jae    0x140002410
   140002407:	btr    QWORD PTR [rip+0x2c90],0x7        # 0x1400050a0
   140002410:	mov    rbx,QWORD PTR [rsp+0x28]
   140002415:	xor    eax,eax
   140002417:	mov    rbp,QWORD PTR [rsp+0x30]
   14000241c:	mov    rsi,QWORD PTR [rsp+0x38]
   140002421:	add    rsp,0x10
   140002425:	pop    rdi
   140002426:	ret
   140002427:	int3
   140002428:	mov    eax,0x1
   14000242d:	ret
   14000242e:	int3
   14000242f:	int3
   140002430:	xor    eax,eax
   140002432:	cmp    DWORD PTR [rip+0x2c78],eax        # 0x1400050b0
   140002438:	setne  al
   14000243b:	ret
   14000243c:	mov    ecx,ecx
   14000243e:	int    0x29
   140002440:	ret
   140002441:	int3
   140002442:	int3
   140002443:	int3
   140002444:	jmp    0x14000244c
   140002449:	int3
   14000244a:	int3
   14000244b:	int3
   14000244c:	xor    eax,eax
   14000244e:	ret
   14000244f:	int3
   140002450:	sub    rsp,0x28
   140002454:	xor    ecx,ecx
   140002456:	call   QWORD PTR [rip+0xbcc]        # 0x140003028
   14000245c:	test   rax,rax
   14000245f:	je     0x14000249b
   140002461:	mov    ecx,0x5a4d
   140002466:	cmp    WORD PTR [rax],cx
   140002469:	jne    0x14000249b
   14000246b:	movsxd rcx,DWORD PTR [rax+0x3c]
   14000246f:	cmp    DWORD PTR [rcx+rax*1],0x4550
   140002476:	jne    0x14000249b
   140002478:	mov    edx,0x20b
   14000247d:	cmp    WORD PTR [rcx+rax*1+0x18],dx
   140002482:	jne    0x14000249b
   140002484:	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   14000248c:	jbe    0x14000249b
   14000248e:	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   140002496:	setne  al
   140002499:	jmp    0x14000249d
   14000249b:	xor    al,al
   14000249d:	add    rsp,0x28
   1400024a1:	ret
   1400024a2:	int3
   1400024a3:	int3
   1400024a4:	lea    rcx,[rip+0x9]        # 0x1400024b4
   1400024ab:	rex.W jmp QWORD PTR [rip+0xb7e]        # 0x140003030
   1400024b2:	int3
   1400024b3:	int3
   1400024b4:	mov    QWORD PTR [rsp+0x8],rbx
   1400024b9:	push   rdi
   1400024ba:	sub    rsp,0x20
   1400024be:	mov    rbx,QWORD PTR [rcx]
   1400024c1:	mov    rdi,rcx
   1400024c4:	cmp    DWORD PTR [rbx],0xe06d7363
   1400024ca:	jne    0x1400024e8
   1400024cc:	cmp    DWORD PTR [rbx+0x18],0x4
   1400024d0:	jne    0x1400024e8
   1400024d2:	mov    edx,DWORD PTR [rbx+0x20]
   1400024d5:	lea    eax,[rdx-0x19930520]
   1400024db:	cmp    eax,0x2
   1400024de:	jbe    0x1400024f5
   1400024e0:	cmp    edx,0x1994000
   1400024e6:	je     0x1400024f5
   1400024e8:	mov    rbx,QWORD PTR [rsp+0x30]
   1400024ed:	xor    eax,eax
   1400024ef:	add    rsp,0x20
   1400024f3:	pop    rdi
   1400024f4:	ret
   1400024f5:	call   0x1400026b8
   1400024fa:	mov    QWORD PTR [rax],rbx
   1400024fd:	mov    rbx,QWORD PTR [rdi+0x8]
   140002501:	call   0x1400026be
   140002506:	mov    QWORD PTR [rax],rbx
   140002509:	call   0x14000275a
   14000250e:	int3
   14000250f:	int3
   140002510:	mov    QWORD PTR [rsp+0x18],rbx
   140002515:	push   rbp
   140002516:	mov    rbp,rsp
   140002519:	sub    rsp,0x30
   14000251d:	mov    rax,QWORD PTR [rip+0x2b1c]        # 0x140005040
   140002524:	movabs rbx,0x2b992ddfa232
   14000252e:	cmp    rax,rbx
   140002531:	jne    0x1400025aa
   140002533:	lea    rcx,[rbp+0x10]
   140002537:	mov    QWORD PTR [rbp+0x10],0x0
   14000253f:	call   QWORD PTR [rip+0xac3]        # 0x140003008
   140002545:	mov    rax,QWORD PTR [rbp+0x10]
   140002549:	mov    QWORD PTR [rbp-0x10],rax
   14000254d:	call   QWORD PTR [rip+0xabd]        # 0x140003010
   140002553:	mov    eax,eax
   140002555:	xor    QWORD PTR [rbp-0x10],rax
   140002559:	call   QWORD PTR [rip+0xab9]        # 0x140003018
   14000255f:	mov    eax,eax
   140002561:	lea    rcx,[rbp+0x18]
   140002565:	xor    QWORD PTR [rbp-0x10],rax
   140002569:	call   QWORD PTR [rip+0xab1]        # 0x140003020
   14000256f:	mov    eax,DWORD PTR [rbp+0x18]
   140002572:	lea    rcx,[rbp-0x10]
   140002576:	shl    rax,0x20
   14000257a:	xor    rax,QWORD PTR [rbp+0x18]
   14000257e:	xor    rax,QWORD PTR [rbp-0x10]
   140002582:	xor    rax,rcx
   140002585:	movabs rcx,0xffffffffffff
   14000258f:	and    rax,rcx
   140002592:	movabs rcx,0x2b992ddfa233
   14000259c:	cmp    rax,rbx
   14000259f:	cmove  rax,rcx
   1400025a3:	mov    QWORD PTR [rip+0x2a96],rax        # 0x140005040
   1400025aa:	mov    rbx,QWORD PTR [rsp+0x50]
   1400025af:	not    rax
   1400025b2:	mov    QWORD PTR [rip+0x2ac7],rax        # 0x140005080
   1400025b9:	add    rsp,0x30
   1400025bd:	pop    rbp
   1400025be:	ret
   1400025bf:	int3
   1400025c0:	mov    eax,0x4000
   1400025c5:	ret
   1400025c6:	int3
   1400025c7:	int3
   1400025c8:	lea    rcx,[rip+0x2c41]        # 0x140005210
   1400025cf:	rex.W jmp QWORD PTR [rip+0xa2a]        # 0x140003000
   1400025d6:	int3
   1400025d7:	int3
   1400025d8:	mov    al,0x1
   1400025da:	ret
   1400025db:	int3
   1400025dc:	lea    rax,[rip+0x2c3d]        # 0x140005220
   1400025e3:	ret
   1400025e4:	lea    rax,[rip+0x2c3d]        # 0x140005228
   1400025eb:	ret
   1400025ec:	sub    rsp,0x28
   1400025f0:	call   0x1400025dc
   1400025f5:	or     QWORD PTR [rax],0x24
   1400025f9:	call   0x1400025e4
   1400025fe:	or     QWORD PTR [rax],0x2
   140002602:	add    rsp,0x28
   140002606:	ret
   140002607:	int3
   140002608:	xor    eax,eax
   14000260a:	cmp    DWORD PTR [rip+0x2a98],eax        # 0x1400050a8
   140002610:	sete   al
   140002613:	ret
   140002614:	lea    rax,[rip+0x2c25]        # 0x140005240
   14000261b:	ret
   14000261c:	lea    rax,[rip+0x2c15]        # 0x140005238
   140002623:	ret
   140002624:	mov    QWORD PTR [rsp+0x8],rbx
   140002629:	push   rdi
   14000262a:	sub    rsp,0x20
   14000262e:	lea    rbx,[rip+0x16c3]        # 0x140003cf8
   140002635:	lea    rdi,[rip+0x16bc]        # 0x140003cf8
   14000263c:	jmp    0x140002650
   14000263e:	mov    rax,QWORD PTR [rbx]
   140002641:	test   rax,rax
   140002644:	je     0x14000264c
   140002646:	call   QWORD PTR [rip+0xc24]        # 0x140003270
   14000264c:	add    rbx,0x8
   140002650:	cmp    rbx,rdi
   140002653:	jb     0x14000263e
   140002655:	mov    rbx,QWORD PTR [rsp+0x30]
   14000265a:	add    rsp,0x20
   14000265e:	pop    rdi
   14000265f:	ret
   140002660:	mov    QWORD PTR [rsp+0x8],rbx
   140002665:	push   rdi
   140002666:	sub    rsp,0x20
   14000266a:	lea    rbx,[rip+0x1697]        # 0x140003d08
   140002671:	lea    rdi,[rip+0x1690]        # 0x140003d08
   140002678:	jmp    0x14000268c
   14000267a:	mov    rax,QWORD PTR [rbx]
   14000267d:	test   rax,rax
   140002680:	je     0x140002688
   140002682:	call   QWORD PTR [rip+0xbe8]        # 0x140003270
   140002688:	add    rbx,0x8
   14000268c:	cmp    rbx,rdi
   14000268f:	jb     0x14000267a
   140002691:	mov    rbx,QWORD PTR [rsp+0x30]
   140002696:	add    rsp,0x20
   14000269a:	pop    rdi
   14000269b:	ret
   14000269c:	int3
   14000269d:	int3
   14000269e:	int3
   14000269f:	int3
   1400026a0:	jmp    QWORD PTR [rip+0xaa2]        # 0x140003148
   1400026a6:	jmp    QWORD PTR [rip+0xa5c]        # 0x140003108
   1400026ac:	jmp    QWORD PTR [rip+0xa5e]        # 0x140003110
   1400026b2:	jmp    QWORD PTR [rip+0xa78]        # 0x140003130
   1400026b8:	jmp    QWORD PTR [rip+0xa6a]        # 0x140003128
   1400026be:	jmp    QWORD PTR [rip+0xa74]        # 0x140003138
   1400026c4:	jmp    QWORD PTR [rip+0xa8e]        # 0x140003158
   1400026ca:	jmp    QWORD PTR [rip+0xa90]        # 0x140003160
   1400026d0:	jmp    QWORD PTR [rip+0xa92]        # 0x140003168
   1400026d6:	jmp    QWORD PTR [rip+0xaf4]        # 0x1400031d0
   1400026dc:	jmp    QWORD PTR [rip+0xb06]        # 0x1400031e8
   1400026e2:	jmp    QWORD PTR [rip+0xb10]        # 0x1400031f8
   1400026e8:	jmp    QWORD PTR [rip+0xb3a]        # 0x140003228
   1400026ee:	jmp    QWORD PTR [rip+0xb2c]        # 0x140003220
   1400026f4:	jmp    QWORD PTR [rip+0xb1e]        # 0x140003218
   1400026fa:	jmp    QWORD PTR [rip+0xb10]        # 0x140003210
   140002700:	jmp    QWORD PTR [rip+0xb02]        # 0x140003208
   140002706:	jmp    QWORD PTR [rip+0xa84]        # 0x140003190
   14000270c:	jmp    QWORD PTR [rip+0xade]        # 0x1400031f0
   140002712:	jmp    QWORD PTR [rip+0xac8]        # 0x1400031e0
   140002718:	jmp    QWORD PTR [rip+0xaaa]        # 0x1400031c8
   14000271e:	jmp    QWORD PTR [rip+0xa9c]        # 0x1400031c0
   140002724:	jmp    QWORD PTR [rip+0xa8e]        # 0x1400031b8
   14000272a:	jmp    QWORD PTR [rip+0xb10]        # 0x140003240
   140002730:	jmp    QWORD PTR [rip+0xa6a]        # 0x1400031a0
   140002736:	jmp    QWORD PTR [rip+0xa6c]        # 0x1400031a8
   14000273c:	jmp    QWORD PTR [rip+0xa6e]        # 0x1400031b0
   140002742:	jmp    QWORD PTR [rip+0xab8]        # 0x140003200
   140002748:	jmp    QWORD PTR [rip+0xa32]        # 0x140003180
   14000274e:	jmp    QWORD PTR [rip+0xa1c]        # 0x140003170
   140002754:	jmp    QWORD PTR [rip+0xade]        # 0x140003238
   14000275a:	jmp    QWORD PTR [rip+0xa78]        # 0x1400031d8
   140002760:	mov    r10,rcx
   140002763:	mov    r11,rdx
   140002766:	mov    ecx,DWORD PTR [r8]
   140002769:	and    ecx,0xfffffff8
   14000276c:	test   BYTE PTR [r8],0x4
   140002770:	je     0x140002787
   140002772:	mov    eax,DWORD PTR [r8+0x8]
   140002776:	movsxd r9,DWORD PTR [r8+0x4]
   14000277a:	neg    eax
   14000277c:	movsxd rdx,eax
   14000277f:	add    r9,r10
   140002782:	and    r9,rdx
   140002785:	jmp    0x14000278a
   140002787:	mov    r9,r10
   14000278a:	movsxd rax,ecx
   14000278d:	mov    rdx,QWORD PTR [rax+r9*1]
   140002791:	mov    rax,QWORD PTR [r11+0x10]
   140002795:	mov    ecx,DWORD PTR [rax+0x8]
   140002798:	mov    rax,QWORD PTR [r11+0x8]
   14000279c:	test   BYTE PTR [rcx+rax*1+0x3],0xf
   1400027a1:	je     0x1400027b5
   1400027a3:	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   1400027a8:	mov    ecx,0xfffffff0
   1400027ad:	and    rax,rcx
   1400027b0:	add    rax,r10
   1400027b3:	jmp    0x1400027b8
   1400027b5:	mov    rax,r10
   1400027b8:	xor    rdx,rax
   1400027bb:	mov    rcx,rdx
   1400027be:	jmp    0x140001bf0
   1400027c3:	int3
   1400027c4:	mov    rax,rsp
   1400027c7:	mov    QWORD PTR [rax+0x8],rbx
   1400027cb:	mov    QWORD PTR [rax+0x10],rbp
   1400027cf:	mov    QWORD PTR [rax+0x18],rsi
   1400027d3:	mov    QWORD PTR [rax+0x20],rdi
   1400027d7:	push   r14
   1400027d9:	sub    rsp,0x20
   1400027dd:	mov    rbx,QWORD PTR [r9+0x38]
   1400027e1:	mov    rsi,rdx
   1400027e4:	mov    r14,r8
   1400027e7:	mov    rbp,rcx
   1400027ea:	mov    rdx,r9
   1400027ed:	mov    rcx,rsi
   1400027f0:	mov    rdi,r9
   1400027f3:	lea    r8,[rbx+0x4]
   1400027f7:	call   0x140002760
   1400027fc:	mov    eax,DWORD PTR [rbp+0x4]
   1400027ff:	and    al,0x66
   140002801:	neg    al
   140002803:	mov    eax,0x1
   140002808:	sbb    r9d,r9d
   14000280b:	neg    r9d
   14000280e:	add    r9d,eax
   140002811:	test   DWORD PTR [rbx+0x4],r9d
   140002815:	je     0x140002828
   140002817:	mov    r9,rdi
   14000281a:	mov    r8,r14
   14000281d:	mov    rdx,rsi
   140002820:	mov    rcx,rbp
   140002823:	call   0x1400026a0
   140002828:	mov    rbx,QWORD PTR [rsp+0x30]
   14000282d:	mov    rbp,QWORD PTR [rsp+0x38]
   140002832:	mov    rsi,QWORD PTR [rsp+0x40]
   140002837:	mov    rdi,QWORD PTR [rsp+0x48]
   14000283c:	add    rsp,0x20
   140002840:	pop    r14
   140002842:	ret
   140002843:	jmp    QWORD PTR [rip+0x8d7]        # 0x140003120
   140002849:	jmp    QWORD PTR [rip+0x8c9]        # 0x140003118
   14000284f:	jmp    QWORD PTR [rip+0x9fb]        # 0x140003250
   140002855:	int3
   140002856:	int3
   140002857:	int3
   140002858:	int3
   140002859:	int3
   14000285a:	int3
   14000285b:	int3
   14000285c:	int3
   14000285d:	int3
   14000285e:	int3
   14000285f:	int3
   140002860:	int3
   140002861:	int3
   140002862:	int3
   140002863:	int3
   140002864:	int3
   140002865:	int3
   140002866:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002870:	jmp    rax
   140002872:	int3
   140002873:	int3
   140002874:	int3
   140002875:	int3
   140002876:	int3
   140002877:	int3
   140002878:	int3
   140002879:	int3
   14000287a:	int3
   14000287b:	int3
   14000287c:	int3
   14000287d:	int3
   14000287e:	int3
   14000287f:	int3
   140002880:	int3
   140002881:	int3
   140002882:	int3
   140002883:	int3
   140002884:	int3
   140002885:	int3
   140002886:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002890:	jmp    QWORD PTR [rip+0x9da]        # 0x140003270
   140002896:	int3
   140002897:	int3
   140002898:	int3
   140002899:	int3
   14000289a:	int3
   14000289b:	int3
   14000289c:	int3
   14000289d:	int3
   14000289e:	int3
   14000289f:	int3
   1400028a0:	lea    rcx,[rdx+0x20]
   1400028a7:	jmp    0x140001900
   1400028ac:	int3
   1400028ad:	int3
   1400028ae:	int3
   1400028af:	int3
   1400028b0:	lea    rcx,[rdx+0x28]
   1400028b7:	rex.W jmp QWORD PTR [rip+0x82a]        # 0x1400030e8
   1400028be:	lea    rcx,[rdx+0x30]
   1400028c5:	jmp    0x140001a10
   1400028ca:	int3
   1400028cb:	int3
   1400028cc:	int3
   1400028cd:	int3
   1400028ce:	int3
   1400028cf:	int3
   1400028d0:	lea    rcx,[rdx+0x20]
   1400028d7:	jmp    0x1400019a0
   1400028dc:	lea    rcx,[rdx+0x20]
   1400028e3:	jmp    0x1400019d0
   1400028e8:	mov    QWORD PTR [rsp+0x10],rdx
   1400028ed:	push   rbp
   1400028ee:	sub    rsp,0x20
   1400028f2:	mov    rbp,rdx
   1400028f5:	mov    rdx,QWORD PTR [rbp+0x60]
   1400028f9:	mov    rax,QWORD PTR [rdx]
   1400028fc:	movsxd rcx,DWORD PTR [rax+0x4]
   140002900:	add    rcx,rdx
   140002903:	mov    r8b,0x1
   140002906:	mov    edx,0x4
   14000290b:	call   QWORD PTR [rip+0x74f]        # 0x140003060
   140002911:	nop
   140002912:	movabs rax,0x0
   14000291c:	add    rsp,0x20
   140002920:	pop    rbp
   140002921:	ret
   140002922:	int3
   140002923:	int3
   140002924:	int3
   140002925:	int3
   140002926:	int3
   140002927:	int3
   140002928:	int3
   140002929:	int3
   14000292a:	int3
   14000292b:	int3
   14000292c:	int3
   14000292d:	int3
   14000292e:	int3
   14000292f:	int3
   140002930:	lea    rcx,[rdx+0x30]
   140002937:	jmp    0x1400019a0
   14000293c:	lea    rcx,[rdx+0x30]
   140002943:	jmp    0x140001970
   140002948:	lea    rcx,[rdx+0x40]
   14000294f:	jmp    0x140001270
   140002954:	mov    QWORD PTR [rsp+0x10],rdx
   140002959:	push   rbp
   14000295a:	sub    rsp,0x20
   14000295e:	mov    rbp,rdx
   140002961:	mov    rdx,QWORD PTR [rbp+0x28]
   140002965:	mov    rax,QWORD PTR [rdx]
   140002968:	movsxd rcx,DWORD PTR [rax+0x4]
   14000296c:	add    rcx,rdx
   14000296f:	mov    r8b,0x1
   140002972:	mov    edx,0x4
   140002977:	call   QWORD PTR [rip+0x6e3]        # 0x140003060
   14000297d:	nop
   14000297e:	movabs rax,0x0
   140002988:	add    rsp,0x20
   14000298c:	pop    rbp
   14000298d:	ret
   14000298e:	int3
   14000298f:	rex push rbp
   140002991:	mov    rbp,rdx
   140002994:	mov    rax,QWORD PTR [rcx]
   140002997:	xor    ecx,ecx
   140002999:	cmp    DWORD PTR [rax],0xc0000005
   14000299f:	sete   cl
   1400029a2:	mov    eax,ecx
   1400029a4:	pop    rbp
   1400029a5:	ret
   1400029a6:	int3
   1400029a7:	rex push rbp
   1400029a9:	sub    rsp,0x20
   1400029ad:	mov    rbp,rdx
   1400029b0:	mov    rdx,rcx
   1400029b3:	mov    rcx,QWORD PTR [rcx]
   1400029b6:	mov    ecx,DWORD PTR [rcx]
   1400029b8:	call   0x1400026fa
   1400029bd:	nop
   1400029be:	add    rsp,0x20
   1400029c2:	pop    rbp
   1400029c3:	ret
   1400029c4:	int3
   1400029c5:	int3
   1400029c6:	int3
   1400029c7:	int3
   1400029c8:	int3
   1400029c9:	int3
   1400029ca:	int3
   1400029cb:	int3
   1400029cc:	int3
   1400029cd:	int3
   1400029ce:	int3
   1400029cf:	int3
   1400029d0:	sub    rsp,0x28
   1400029d4:	mov    rdx,QWORD PTR [rip+0x26f5]        # 0x1400050d0
   1400029db:	cmp    rdx,0xf
   1400029df:	jbe    0x140002a1a
   1400029e1:	mov    rax,QWORD PTR [rip+0x26d0]        # 0x1400050b8
   1400029e8:	inc    rdx
   1400029eb:	cmp    rdx,0x1000
   1400029f2:	jb     0x140002a12
   1400029f4:	mov    rcx,QWORD PTR [rax-0x8]
   1400029f8:	sub    rax,rcx
   1400029fb:	sub    rax,0x8
   1400029ff:	cmp    rax,0x1f
   140002a03:	ja     0x140002a0b
   140002a05:	add    rdx,0x27
   140002a09:	jmp    0x140002a15
   140002a0b:	mov    ecx,0x5
   140002a10:	int    0x29
   140002a12:	mov    rcx,rax
   140002a15:	call   0x140001e94
   140002a1a:	mov    QWORD PTR [rip+0x26a3],0x0        # 0x1400050c8
   140002a25:	mov    QWORD PTR [rip+0x26a0],0xf        # 0x1400050d0
   140002a30:	mov    BYTE PTR [rip+0x2681],0x0        # 0x1400050b8
   140002a37:	add    rsp,0x28
   140002a3b:	ret
   140002a3c:	rex push rbx
   140002a3e:	sub    rsp,0x20
   140002a42:	jmp    0x140002a81
   140002a44:	mov    rax,QWORD PTR [rbx]
   140002a47:	mov    rcx,QWORD PTR [rbx+0x8]
   140002a4b:	mov    QWORD PTR [rip+0x274e],rax        # 0x1400051a0
   140002a52:	mov    rax,QWORD PTR [rcx]
   140002a55:	mov    rax,QWORD PTR [rax+0x10]
   140002a59:	call   QWORD PTR [rip+0x811]        # 0x140003270
   140002a5f:	mov    rcx,rax
   140002a62:	test   rax,rax
   140002a65:	je     0x140002a78
   140002a67:	mov    rdx,QWORD PTR [rax]
   140002a6a:	mov    rax,QWORD PTR [rdx]
   140002a6d:	mov    edx,0x1
   140002a72:	call   QWORD PTR [rip+0x7f8]        # 0x140003270
   140002a78:	mov    rcx,rbx
   140002a7b:	call   QWORD PTR [rip+0x6d7]        # 0x140003158
   140002a81:	mov    rbx,QWORD PTR [rip+0x2718]        # 0x1400051a0
   140002a88:	test   rbx,rbx
   140002a8b:	jne    0x140002a44
   140002a8d:	add    rsp,0x20
   140002a91:	pop    rbx
   140002a92:	ret
