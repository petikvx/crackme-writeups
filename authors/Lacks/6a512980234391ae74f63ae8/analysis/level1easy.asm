
level1easy.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	lea    rcx,[rip+0x1ca9]        # 0x140002cb0
   140001007:	jmp    0x1400021a0
   14000100c:	int3
   14000100d:	int3
   14000100e:	int3
   14000100f:	int3
   140001010:	rex push rbx
   140001012:	sub    rsp,0x20
   140001016:	mov    rbx,rcx
   140001019:	mov    rax,rdx
   14000101c:	lea    rcx,[rip+0x2305]        # 0x140003328
   140001023:	xorps  xmm0,xmm0
   140001026:	lea    rdx,[rbx+0x8]
   14000102a:	mov    QWORD PTR [rbx],rcx
   14000102d:	lea    rcx,[rax+0x8]
   140001031:	movups XMMWORD PTR [rdx],xmm0
   140001034:	call   QWORD PTR [rip+0x20d6]        # 0x140003110
   14000103a:	mov    rax,rbx
   14000103d:	add    rsp,0x20
   140001041:	pop    rbx
   140001042:	ret
   140001043:	int3
   140001044:	int3
   140001045:	int3
   140001046:	int3
   140001047:	int3
   140001048:	int3
   140001049:	int3
   14000104a:	int3
   14000104b:	int3
   14000104c:	int3
   14000104d:	int3
   14000104e:	int3
   14000104f:	int3
   140001050:	mov    rdx,QWORD PTR [rcx+0x8]
   140001054:	lea    rax,[rip+0x231d]        # 0x140003378
   14000105b:	test   rdx,rdx
   14000105e:	cmovne rax,rdx
   140001062:	ret
   140001063:	int3
   140001064:	int3
   140001065:	int3
   140001066:	int3
   140001067:	int3
   140001068:	int3
   140001069:	int3
   14000106a:	int3
   14000106b:	int3
   14000106c:	int3
   14000106d:	int3
   14000106e:	int3
   14000106f:	int3
   140001070:	mov    QWORD PTR [rsp+0x8],rbx
   140001075:	push   rdi
   140001076:	sub    rsp,0x20
   14000107a:	lea    rax,[rip+0x22a7]        # 0x140003328
   140001081:	mov    rdi,rcx
   140001084:	mov    QWORD PTR [rcx],rax
   140001087:	mov    ebx,edx
   140001089:	add    rcx,0x8
   14000108d:	call   QWORD PTR [rip+0x2075]        # 0x140003108
   140001093:	test   bl,0x1
   140001096:	je     0x1400010a5
   140001098:	mov    edx,0x18
   14000109d:	mov    rcx,rdi
   1400010a0:	call   0x140001ca0
   1400010a5:	mov    rbx,QWORD PTR [rsp+0x30]
   1400010aa:	mov    rax,rdi
   1400010ad:	add    rsp,0x20
   1400010b1:	pop    rdi
   1400010b2:	ret
   1400010b3:	int3
   1400010b4:	int3
   1400010b5:	int3
   1400010b6:	int3
   1400010b7:	int3
   1400010b8:	int3
   1400010b9:	int3
   1400010ba:	int3
   1400010bb:	int3
   1400010bc:	int3
   1400010bd:	int3
   1400010be:	int3
   1400010bf:	int3
   1400010c0:	lea    rax,[rip+0x2261]        # 0x140003328
   1400010c7:	mov    QWORD PTR [rcx],rax
   1400010ca:	add    rcx,0x8
   1400010ce:	rex.W jmp QWORD PTR [rip+0x2033]        # 0x140003108
   1400010d5:	int3
   1400010d6:	int3
   1400010d7:	int3
   1400010d8:	int3
   1400010d9:	int3
   1400010da:	int3
   1400010db:	int3
   1400010dc:	int3
   1400010dd:	int3
   1400010de:	int3
   1400010df:	int3
   1400010e0:	lea    rax,[rip+0x22a9]        # 0x140003390
   1400010e7:	mov    QWORD PTR [rcx+0x10],0x0
   1400010ef:	mov    QWORD PTR [rcx+0x8],rax
   1400010f3:	lea    rax,[rip+0x226e]        # 0x140003368
   1400010fa:	mov    QWORD PTR [rcx],rax
   1400010fd:	mov    rax,rcx
   140001100:	ret
   140001101:	int3
   140001102:	int3
   140001103:	int3
   140001104:	int3
   140001105:	int3
   140001106:	int3
   140001107:	int3
   140001108:	int3
   140001109:	int3
   14000110a:	int3
   14000110b:	int3
   14000110c:	int3
   14000110d:	int3
   14000110e:	int3
   14000110f:	int3
   140001110:	sub    rsp,0x48
   140001114:	lea    rcx,[rsp+0x20]
   140001119:	call   0x1400010e0
   14000111e:	lea    rdx,[rip+0x2ffb]        # 0x140004120
   140001125:	lea    rcx,[rsp+0x20]
   14000112a:	call   0x140002832
   14000112f:	int3
   140001130:	rex push rbx
   140001132:	sub    rsp,0x20
   140001136:	mov    rbx,rcx
   140001139:	mov    rax,rdx
   14000113c:	lea    rcx,[rip+0x21e5]        # 0x140003328
   140001143:	xorps  xmm0,xmm0
   140001146:	lea    rdx,[rbx+0x8]
   14000114a:	mov    QWORD PTR [rbx],rcx
   14000114d:	lea    rcx,[rax+0x8]
   140001151:	movups XMMWORD PTR [rdx],xmm0
   140001154:	call   QWORD PTR [rip+0x1fb6]        # 0x140003110
   14000115a:	lea    rax,[rip+0x2207]        # 0x140003368
   140001161:	mov    QWORD PTR [rbx],rax
   140001164:	mov    rax,rbx
   140001167:	add    rsp,0x20
   14000116b:	pop    rbx
   14000116c:	ret
   14000116d:	int3
   14000116e:	int3
   14000116f:	int3
   140001170:	rex push rbx
   140001172:	sub    rsp,0x20
   140001176:	mov    rbx,rcx
   140001179:	mov    rax,rdx
   14000117c:	lea    rcx,[rip+0x21a5]        # 0x140003328
   140001183:	xorps  xmm0,xmm0
   140001186:	lea    rdx,[rbx+0x8]
   14000118a:	mov    QWORD PTR [rbx],rcx
   14000118d:	lea    rcx,[rax+0x8]
   140001191:	movups XMMWORD PTR [rdx],xmm0
   140001194:	call   QWORD PTR [rip+0x1f76]        # 0x140003110
   14000119a:	lea    rax,[rip+0x219f]        # 0x140003340
   1400011a1:	mov    QWORD PTR [rbx],rax
   1400011a4:	mov    rax,rbx
   1400011a7:	add    rsp,0x20
   1400011ab:	pop    rbx
   1400011ac:	ret
   1400011ad:	int3
   1400011ae:	int3
   1400011af:	int3
   1400011b0:	sub    rsp,0x28
   1400011b4:	lea    rcx,[rip+0x21ed]        # 0x1400033a8
   1400011bb:	call   QWORD PTR [rip+0x1e7f]        # 0x140003040
   1400011c1:	int3
   1400011c2:	int3
   1400011c3:	int3
   1400011c4:	int3
   1400011c5:	int3
   1400011c6:	int3
   1400011c7:	int3
   1400011c8:	int3
   1400011c9:	int3
   1400011ca:	int3
   1400011cb:	int3
   1400011cc:	int3
   1400011cd:	int3
   1400011ce:	int3
   1400011cf:	int3
   1400011d0:	lea    rax,[rip+0x21e1]        # 0x1400033b8
   1400011d7:	mov    QWORD PTR [rcx+0x10],0x0
   1400011df:	mov    QWORD PTR [rcx+0x8],rax
   1400011e3:	lea    rax,[rip+0x22ce]        # 0x1400034b8
   1400011ea:	mov    QWORD PTR [rcx],rax
   1400011ed:	mov    rax,rcx
   1400011f0:	ret
   1400011f1:	int3
   1400011f2:	int3
   1400011f3:	int3
   1400011f4:	int3
   1400011f5:	int3
   1400011f6:	int3
   1400011f7:	int3
   1400011f8:	int3
   1400011f9:	int3
   1400011fa:	int3
   1400011fb:	int3
   1400011fc:	int3
   1400011fd:	int3
   1400011fe:	int3
   1400011ff:	int3
   140001200:	sub    rsp,0x48
   140001204:	lea    rcx,[rsp+0x20]
   140001209:	call   0x1400011d0
   14000120e:	lea    rdx,[rip+0x2e4b]        # 0x140004060
   140001215:	lea    rcx,[rsp+0x20]
   14000121a:	call   0x140002832
   14000121f:	int3
   140001220:	rex push rbx
   140001222:	sub    rsp,0x20
   140001226:	mov    rbx,rcx
   140001229:	mov    rax,rdx
   14000122c:	lea    rcx,[rip+0x20f5]        # 0x140003328
   140001233:	xorps  xmm0,xmm0
   140001236:	lea    rdx,[rbx+0x8]
   14000123a:	mov    QWORD PTR [rbx],rcx
   14000123d:	lea    rcx,[rax+0x8]
   140001241:	movups XMMWORD PTR [rdx],xmm0
   140001244:	call   QWORD PTR [rip+0x1ec6]        # 0x140003110
   14000124a:	lea    rax,[rip+0x2267]        # 0x1400034b8
   140001251:	mov    QWORD PTR [rbx],rax
   140001254:	mov    rax,rbx
   140001257:	add    rsp,0x20
   14000125b:	pop    rbx
   14000125c:	ret
   14000125d:	int3
   14000125e:	int3
   14000125f:	int3
   140001260:	sub    rsp,0x28
   140001264:	mov    rcx,QWORD PTR [rcx+0x8]
   140001268:	test   rcx,rcx
   14000126b:	je     0x14000128a
   14000126d:	mov    rax,QWORD PTR [rcx]
   140001270:	call   QWORD PTR [rax+0x10]
   140001273:	test   rax,rax
   140001276:	je     0x14000128a
   140001278:	mov    r8,QWORD PTR [rax]
   14000127b:	mov    edx,0x1
   140001280:	mov    rcx,rax
   140001283:	add    rsp,0x28
   140001287:	rex.WB jmp QWORD PTR [r8]
   14000128a:	add    rsp,0x28
   14000128e:	ret
   14000128f:	int3
   140001290:	rex push rbx
   140001292:	push   rbp
   140001293:	push   rsi
   140001294:	push   rdi
   140001295:	sub    rsp,0x78
   140001299:	mov    rax,QWORD PTR [rip+0x3da0]        # 0x140005040
   1400012a0:	xor    rax,rsp
   1400012a3:	mov    QWORD PTR [rsp+0x60],rax
   1400012a8:	xorps  xmm0,xmm0
   1400012ab:	movups XMMWORD PTR [rsp+0x40],xmm0
   1400012b0:	xor    eax,eax
   1400012b2:	mov    QWORD PTR [rsp+0x50],rax
   1400012b7:	mov    ebp,0xf
   1400012bc:	mov    QWORD PTR [rsp+0x58],rbp
   1400012c1:	mov    BYTE PTR [rsp+0x40],al
   1400012c5:	mov    QWORD PTR [rsp+0x28],rax
   1400012ca:	mov    QWORD PTR [rsp+0x30],0x8
   1400012d3:	mov    QWORD PTR [rsp+0x38],rbp
   1400012d8:	mov    rdi,QWORD PTR [rip+0x20e9]        # 0x1400033c8
   1400012df:	mov    QWORD PTR [rsp+0x20],rdi
   1400012e4:	mov    BYTE PTR [rsp+0x28],al
   1400012e8:	lea    rdx,[rip+0x20e9]        # 0x1400033d8
   1400012ef:	mov    rcx,QWORD PTR [rip+0x1dda]        # 0x1400030d0
   1400012f6:	call   0x140001550
   1400012fb:	lea    rdx,[rip+0x20f6]        # 0x1400033f8
   140001302:	mov    rcx,QWORD PTR [rip+0x1dc7]        # 0x1400030d0
   140001309:	call   0x140001550
   14000130e:	lea    rdx,[rip+0x2103]        # 0x140003418
   140001315:	mov    rcx,QWORD PTR [rip+0x1db4]        # 0x1400030d0
   14000131c:	call   0x140001550
   140001321:	lea    rdx,[rip+0x2110]        # 0x140003438
   140001328:	mov    rcx,QWORD PTR [rip+0x1da1]        # 0x1400030d0
   14000132f:	call   0x140001550
   140001334:	lea    rdx,[rsp+0x40]
   140001339:	mov    rcx,QWORD PTR [rip+0x1d80]        # 0x1400030c0
   140001340:	call   0x140001720
   140001345:	lea    rdx,[rsp+0x20]
   14000134a:	mov    r8,QWORD PTR [rsp+0x50]
   14000134f:	lea    rcx,[rsp+0x40]
   140001354:	mov    rbx,QWORD PTR [rsp+0x40]
   140001359:	mov    rsi,QWORD PTR [rsp+0x58]
   14000135e:	cmp    rsi,rbp
   140001361:	cmova  rcx,rbx
   140001365:	cmp    r8,0x8
   140001369:	jne    0x140001382
   14000136b:	test   r8,r8
   14000136e:	je     0x140001379
   140001370:	call   0x140002b18
   140001375:	test   eax,eax
   140001377:	jne    0x140001382
   140001379:	lea    rdx,[rip+0x20d0]        # 0x140003450
   140001380:	jmp    0x140001389
   140001382:	lea    rdx,[rip+0x20e7]        # 0x140003470
   140001389:	mov    rcx,QWORD PTR [rip+0x1d40]        # 0x1400030d0
   140001390:	call   0x140001550
   140001395:	lea    rdx,[rip+0x20fc]        # 0x140003498
   14000139c:	mov    rcx,QWORD PTR [rip+0x1d2d]        # 0x1400030d0
   1400013a3:	call   0x140001550
   1400013a8:	mov    edx,0x1
   1400013ad:	mov    r8d,0xffffffff
   1400013b3:	mov    rcx,QWORD PTR [rip+0x1d06]        # 0x1400030c0
   1400013ba:	call   QWORD PTR [rip+0x1cd0]        # 0x140003090
   1400013c0:	mov    rcx,QWORD PTR [rip+0x1cf9]        # 0x1400030c0
   1400013c7:	call   QWORD PTR [rip+0x1cbb]        # 0x140003088
   1400013cd:	nop
   1400013ce:	cmp    rsi,0xf
   1400013d2:	jbe    0x140001401
   1400013d4:	lea    rdx,[rsi+0x1]
   1400013d8:	cmp    rdx,0x1000
   1400013df:	jb     0x1400013f9
   1400013e1:	mov    rax,QWORD PTR [rbx-0x8]
   1400013e5:	sub    rbx,rax
   1400013e8:	sub    rbx,0x8
   1400013ec:	cmp    rbx,0x1f
   1400013f0:	ja     0x140001419
   1400013f2:	add    rdx,0x27
   1400013f6:	mov    rbx,rax
   1400013f9:	mov    rcx,rbx
   1400013fc:	call   0x140001ca0
   140001401:	xor    eax,eax
   140001403:	mov    rcx,QWORD PTR [rsp+0x60]
   140001408:	xor    rcx,rsp
   14000140b:	call   0x140001c20
   140001410:	add    rsp,0x78
   140001414:	pop    rdi
   140001415:	pop    rsi
   140001416:	pop    rbp
   140001417:	pop    rbx
   140001418:	ret
   140001419:	mov    ecx,0x5
   14000141e:	int    0x29
   140001420:	rex push rbx
   140001422:	push   rbp
   140001423:	push   rsi
   140001424:	push   rdi
   140001425:	sub    rsp,0x48
   140001429:	mov    rax,QWORD PTR [rip+0x3c10]        # 0x140005040
   140001430:	xor    rax,rsp
   140001433:	mov    QWORD PTR [rsp+0x38],rax
   140001438:	mov    rbp,rcx
   14000143b:	xor    edx,edx
   14000143d:	lea    rcx,[rsp+0x28]
   140001442:	call   QWORD PTR [rip+0x1c98]        # 0x1400030e0
   140001448:	nop
   140001449:	mov    rax,QWORD PTR [rip+0x3dc0]        # 0x140005210
   140001450:	mov    QWORD PTR [rsp+0x20],rax
   140001455:	mov    rbx,QWORD PTR [rip+0x1c1c]        # 0x140003078
   14000145c:	cmp    QWORD PTR [rbx],0x0
   140001460:	jne    0x14000148f
   140001462:	xor    edx,edx
   140001464:	lea    rcx,[rsp+0x30]
   140001469:	call   QWORD PTR [rip+0x1c71]        # 0x1400030e0
   14000146f:	cmp    QWORD PTR [rbx],0x0
   140001473:	jne    0x140001484
   140001475:	mov    rax,QWORD PTR [rip+0x1c3c]        # 0x1400030b8
   14000147c:	inc    DWORD PTR [rax]
   14000147e:	movsxd rax,DWORD PTR [rax]
   140001481:	mov    QWORD PTR [rbx],rax
   140001484:	lea    rcx,[rsp+0x30]
   140001489:	call   QWORD PTR [rip+0x1c61]        # 0x1400030f0
   14000148f:	mov    rsi,QWORD PTR [rbx]
   140001492:	mov    rcx,QWORD PTR [rbp+0x8]
   140001496:	lea    rdi,[rsi*8+0x0]
   14000149e:	cmp    rsi,QWORD PTR [rcx+0x18]
   1400014a2:	jae    0x1400014b3
   1400014a4:	mov    rax,QWORD PTR [rcx+0x10]
   1400014a8:	mov    rbx,QWORD PTR [rdi+rax*1]
   1400014ac:	test   rbx,rbx
   1400014af:	jne    0x140001519
   1400014b1:	jmp    0x1400014b5
   1400014b3:	xor    ebx,ebx
   1400014b5:	cmp    BYTE PTR [rcx+0x24],0x0
   1400014b9:	je     0x1400014cf
   1400014bb:	call   QWORD PTR [rip+0x1c07]        # 0x1400030c8
   1400014c1:	cmp    rsi,QWORD PTR [rax+0x18]
   1400014c5:	jae    0x1400014d4
   1400014c7:	mov    rax,QWORD PTR [rax+0x10]
   1400014cb:	mov    rbx,QWORD PTR [rdi+rax*1]
   1400014cf:	test   rbx,rbx
   1400014d2:	jne    0x140001519
   1400014d4:	mov    rbx,QWORD PTR [rsp+0x20]
   1400014d9:	test   rbx,rbx
   1400014dc:	jne    0x140001519
   1400014de:	mov    rdx,rbp
   1400014e1:	lea    rcx,[rsp+0x20]
   1400014e6:	call   QWORD PTR [rip+0x1bbc]        # 0x1400030a8
   1400014ec:	cmp    rax,0xffffffffffffffff
   1400014f0:	je     0x14000153d
   1400014f2:	mov    rbx,QWORD PTR [rsp+0x20]
   1400014f7:	mov    QWORD PTR [rsp+0x30],rbx
   1400014fc:	mov    rcx,rbx
   1400014ff:	call   0x140001bc0
   140001504:	mov    rax,QWORD PTR [rbx]
   140001507:	mov    rcx,rbx
   14000150a:	call   QWORD PTR [rax+0x8]
   14000150d:	mov    rbx,QWORD PTR [rsp+0x20]
   140001512:	mov    QWORD PTR [rip+0x3cf7],rbx        # 0x140005210
   140001519:	lea    rcx,[rsp+0x28]
   14000151e:	call   QWORD PTR [rip+0x1bcc]        # 0x1400030f0
   140001524:	mov    rax,rbx
   140001527:	mov    rcx,QWORD PTR [rsp+0x38]
   14000152c:	xor    rcx,rsp
   14000152f:	call   0x140001c20
   140001534:	add    rsp,0x48
   140001538:	pop    rdi
   140001539:	pop    rsi
   14000153a:	pop    rbp
   14000153b:	pop    rbx
   14000153c:	ret
   14000153d:	call   0x140001200
   140001542:	nop
   140001543:	int3
   140001544:	int3
   140001545:	int3
   140001546:	int3
   140001547:	int3
   140001548:	int3
   140001549:	int3
   14000154a:	int3
   14000154b:	int3
   14000154c:	int3
   14000154d:	int3
   14000154e:	int3
   14000154f:	int3
   140001550:	mov    QWORD PTR [rsp+0x10],rbx
   140001555:	mov    QWORD PTR [rsp+0x8],rcx
   14000155a:	push   rsi
   14000155b:	push   rdi
   14000155c:	push   r12
   14000155e:	push   r14
   140001560:	push   r15
   140001562:	sub    rsp,0x30
   140001566:	mov    r12,rdx
   140001569:	mov    rdi,rcx
   14000156c:	xor    ebx,ebx
   14000156e:	mov    DWORD PTR [rsp+0x70],ebx
   140001572:	mov    rcx,rdx
   140001575:	call   0x140002b24
   14000157a:	mov    r15,rax
   14000157d:	mov    r8,QWORD PTR [rdi]
   140001580:	movsxd rcx,DWORD PTR [r8+0x4]
   140001584:	mov    rsi,QWORD PTR [rcx+rdi*1+0x28]
   140001589:	test   rsi,rsi
   14000158c:	jle    0x140001598
   14000158e:	cmp    rsi,rax
   140001591:	jle    0x140001598
   140001593:	sub    rsi,rax
   140001596:	jmp    0x14000159a
   140001598:	xor    esi,esi
   14000159a:	mov    r14,rdi
   14000159d:	mov    QWORD PTR [rsp+0x20],rdi
   1400015a2:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400015a7:	test   rcx,rcx
   1400015aa:	je     0x1400015b3
   1400015ac:	mov    rax,QWORD PTR [rcx]
   1400015af:	call   QWORD PTR [rax+0x8]
   1400015b2:	nop
   1400015b3:	mov    rax,QWORD PTR [rdi]
   1400015b6:	movsxd rcx,DWORD PTR [rax+0x4]
   1400015ba:	add    rcx,rdi
   1400015bd:	call   QWORD PTR [rip+0x1add]        # 0x1400030a0
   1400015c3:	test   al,al
   1400015c5:	jne    0x1400015cd
   1400015c7:	mov    BYTE PTR [rsp+0x28],al
   1400015cb:	jmp    0x140001606
   1400015cd:	mov    rax,QWORD PTR [rdi]
   1400015d0:	movsxd rcx,DWORD PTR [rax+0x4]
   1400015d4:	mov    rcx,QWORD PTR [rcx+rdi*1+0x50]
   1400015d9:	test   rcx,rcx
   1400015dc:	je     0x1400015ff
   1400015de:	cmp    rcx,rdi
   1400015e1:	je     0x1400015ff
   1400015e3:	call   QWORD PTR [rip+0x1a6f]        # 0x140003058
   1400015e9:	mov    rax,QWORD PTR [rdi]
   1400015ec:	movsxd rcx,DWORD PTR [rax+0x4]
   1400015f0:	add    rcx,rdi
   1400015f3:	call   QWORD PTR [rip+0x1aa7]        # 0x1400030a0
   1400015f9:	mov    BYTE PTR [rsp+0x28],al
   1400015fd:	jmp    0x140001606
   1400015ff:	mov    BYTE PTR [rsp+0x28],0x1
   140001604:	mov    al,0x1
   140001606:	test   al,al
   140001608:	jne    0x140001614
   14000160a:	mov    ebx,0x4
   14000160f:	jmp    0x1400016bf
   140001614:	mov    rdx,QWORD PTR [rdi]
   140001617:	movsxd rax,DWORD PTR [rdx+0x4]
   14000161b:	mov    ecx,DWORD PTR [rax+rdi*1+0x18]
   14000161f:	and    ecx,0x1c0
   140001625:	cmp    ecx,0x40
   140001628:	je     0x140001656
   14000162a:	nop    WORD PTR [rax+rax*1+0x0]
   140001630:	mov    rdx,QWORD PTR [rdi]
   140001633:	test   rsi,rsi
   140001636:	jle    0x140001656
   140001638:	movsxd rcx,DWORD PTR [rdx+0x4]
   14000163c:	movzx  edx,BYTE PTR [rcx+rdi*1+0x58]
   140001641:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001646:	call   QWORD PTR [rip+0x1a9c]        # 0x1400030e8
   14000164c:	cmp    eax,0xffffffff
   14000164f:	je     0x140001696
   140001651:	dec    rsi
   140001654:	jmp    0x140001630
   140001656:	movsxd rcx,DWORD PTR [rdx+0x4]
   14000165a:	mov    r8,r15
   14000165d:	mov    rdx,r12
   140001660:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001665:	call   QWORD PTR [rip+0x1a15]        # 0x140003080
   14000166b:	cmp    rax,r15
   14000166e:	jne    0x140001696
   140001670:	test   rsi,rsi
   140001673:	jle    0x14000169f
   140001675:	mov    rax,QWORD PTR [rdi]
   140001678:	movsxd rcx,DWORD PTR [rax+0x4]
   14000167c:	movzx  edx,BYTE PTR [rcx+rdi*1+0x58]
   140001681:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001686:	call   QWORD PTR [rip+0x1a5c]        # 0x1400030e8
   14000168c:	cmp    eax,0xffffffff
   14000168f:	je     0x140001696
   140001691:	dec    rsi
   140001694:	jmp    0x140001670
   140001696:	mov    ebx,0x4
   14000169b:	mov    DWORD PTR [rsp+0x70],ebx
   14000169f:	mov    rax,QWORD PTR [rdi]
   1400016a2:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016a6:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   1400016af:	jmp    0x1400016bf
   1400016b1:	mov    rdi,QWORD PTR [rsp+0x60]
   1400016b6:	mov    ebx,DWORD PTR [rsp+0x70]
   1400016ba:	mov    r14,QWORD PTR [rsp+0x20]
   1400016bf:	mov    rax,QWORD PTR [rdi]
   1400016c2:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016c6:	add    rcx,rdi
   1400016c9:	xor    r8d,r8d
   1400016cc:	mov    edx,ebx
   1400016ce:	call   QWORD PTR [rip+0x198c]        # 0x140003060
   1400016d4:	nop
   1400016d5:	call   QWORD PTR [rip+0x19fd]        # 0x1400030d8
   1400016db:	test   eax,eax
   1400016dd:	jne    0x1400016e9
   1400016df:	mov    rcx,r14
   1400016e2:	call   QWORD PTR [rip+0x1968]        # 0x140003050
   1400016e8:	nop
   1400016e9:	mov    rax,QWORD PTR [r14]
   1400016ec:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016f0:	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   1400016f5:	test   rcx,rcx
   1400016f8:	je     0x140001701
   1400016fa:	mov    rax,QWORD PTR [rcx]
   1400016fd:	call   QWORD PTR [rax+0x10]
   140001700:	nop
   140001701:	mov    rax,rdi
   140001704:	mov    rbx,QWORD PTR [rsp+0x68]
   140001709:	add    rsp,0x30
   14000170d:	pop    r15
   14000170f:	pop    r14
   140001711:	pop    r12
   140001713:	pop    rdi
   140001714:	pop    rsi
   140001715:	ret
   140001716:	int3
   140001717:	int3
   140001718:	int3
   140001719:	int3
   14000171a:	int3
   14000171b:	int3
   14000171c:	int3
   14000171d:	int3
   14000171e:	int3
   14000171f:	int3
   140001720:	mov    QWORD PTR [rsp+0x18],rbx
   140001725:	mov    QWORD PTR [rsp+0x20],rsi
   14000172a:	push   rdi
   14000172b:	push   r12
   14000172d:	push   r13
   14000172f:	push   r14
   140001731:	push   r15
   140001733:	sub    rsp,0x50
   140001737:	mov    rbx,rdx
   14000173a:	mov    rdi,rcx
   14000173d:	mov    QWORD PTR [rsp+0x28],rcx
   140001742:	xor    esi,esi
   140001744:	mov    DWORD PTR [rsp+0x24],esi
   140001748:	xor    r15b,r15b
   14000174b:	mov    BYTE PTR [rsp+0x20],r15b
   140001750:	mov    r12,rcx
   140001753:	mov    QWORD PTR [rsp+0x30],rcx
   140001758:	mov    rax,QWORD PTR [rcx]
   14000175b:	movsxd rcx,DWORD PTR [rax+0x4]
   14000175f:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001764:	test   rcx,rcx
   140001767:	je     0x140001770
   140001769:	mov    rax,QWORD PTR [rcx]
   14000176c:	call   QWORD PTR [rax+0x8]
   14000176f:	nop
   140001770:	xor    edx,edx
   140001772:	mov    rcx,rdi
   140001775:	call   QWORD PTR [rip+0x18cd]        # 0x140003048
   14000177b:	mov    BYTE PTR [rsp+0x38],al
   14000177f:	test   al,al
   140001781:	je     0x1400018ae
   140001787:	mov    rax,QWORD PTR [rdi]
   14000178a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000178e:	add    rcx,rdi
   140001791:	lea    rdx,[rsp+0x40]
   140001796:	call   QWORD PTR [rip+0x18fc]        # 0x140003098
   14000179c:	nop
   14000179d:	mov    rcx,rax
   1400017a0:	call   0x140001420
   1400017a5:	mov    r13,rax
   1400017a8:	mov    rcx,QWORD PTR [rsp+0x48]
   1400017ad:	test   rcx,rcx
   1400017b0:	je     0x1400017ca
   1400017b2:	mov    rax,QWORD PTR [rcx]
   1400017b5:	call   QWORD PTR [rax+0x10]
   1400017b8:	mov    rcx,rax
   1400017bb:	test   rax,rax
   1400017be:	je     0x1400017ca
   1400017c0:	mov    rax,QWORD PTR [rax]
   1400017c3:	mov    edx,0x1
   1400017c8:	call   QWORD PTR [rax]
   1400017ca:	mov    QWORD PTR [rbx+0x10],0x0
   1400017d2:	cmp    QWORD PTR [rbx+0x18],0xf
   1400017d7:	jbe    0x1400017de
   1400017d9:	mov    rax,QWORD PTR [rbx]
   1400017dc:	jmp    0x1400017e1
   1400017de:	mov    rax,rbx
   1400017e1:	mov    BYTE PTR [rax],0x0
   1400017e4:	mov    rax,QWORD PTR [rdi]
   1400017e7:	movsxd rcx,DWORD PTR [rax+0x4]
   1400017eb:	mov    r14,QWORD PTR [rdi+rcx*1+0x28]
   1400017f0:	movabs rax,0x7fffffffffffffff
   1400017fa:	test   r14,r14
   1400017fd:	jle    0x140001804
   1400017ff:	cmp    r14,rax
   140001802:	jb     0x140001807
   140001804:	mov    r14,rax
   140001807:	mov    rcx,QWORD PTR [rdi+rcx*1+0x48]
   14000180c:	call   QWORD PTR [rip+0x1856]        # 0x140003068
   140001812:	test   r14,r14
   140001815:	je     0x140001825
   140001817:	cmp    eax,0xffffffff
   14000181a:	jne    0x14000182a
   14000181c:	mov    esi,0x1
   140001821:	mov    DWORD PTR [rsp+0x24],esi
   140001825:	jmp    0x1400018ae
   14000182a:	movzx  r9d,al
   14000182e:	mov    rax,QWORD PTR [r13+0x18]
   140001832:	test   BYTE PTR [rax+r9*2],0x48
   140001837:	jne    0x140001825
   140001839:	mov    rcx,QWORD PTR [rbx+0x10]
   14000183d:	mov    rdx,QWORD PTR [rbx+0x18]
   140001841:	cmp    rcx,rdx
   140001844:	jae    0x140001870
   140001846:	lea    rax,[rcx+0x1]
   14000184a:	mov    QWORD PTR [rbx+0x10],rax
   14000184e:	cmp    rdx,0xf
   140001852:	jbe    0x140001862
   140001854:	mov    rax,QWORD PTR [rbx]
   140001857:	mov    BYTE PTR [rax+rcx*1],r9b
   14000185b:	mov    BYTE PTR [rax+rcx*1+0x1],0x0
   140001860:	jmp    0x140001878
   140001862:	mov    rax,rbx
   140001865:	mov    BYTE PTR [rbx+rcx*1],r9b
   140001869:	mov    BYTE PTR [rbx+rcx*1+0x1],0x0
   14000186e:	jmp    0x140001878
   140001870:	mov    rcx,rbx
   140001873:	call   0x140001a50
   140001878:	mov    r15b,0x1
   14000187b:	mov    BYTE PTR [rsp+0x20],r15b
   140001880:	dec    r14
   140001883:	mov    rax,QWORD PTR [rdi]
   140001886:	movsxd rcx,DWORD PTR [rax+0x4]
   14000188a:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   14000188f:	call   QWORD PTR [rip+0x17db]        # 0x140003070
   140001895:	jmp    0x140001812
   14000189a:	mov    esi,DWORD PTR [rsp+0x24]
   14000189e:	movzx  r15d,BYTE PTR [rsp+0x20]
   1400018a4:	mov    r12,QWORD PTR [rsp+0x30]
   1400018a9:	mov    rdi,QWORD PTR [rsp+0x28]
   1400018ae:	mov    rax,QWORD PTR [rdi]
   1400018b1:	movsxd rcx,DWORD PTR [rax+0x4]
   1400018b5:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   1400018be:	test   r15b,r15b
   1400018c1:	jne    0x1400018c6
   1400018c3:	or     esi,0x2
   1400018c6:	mov    rax,QWORD PTR [rdi]
   1400018c9:	movsxd rcx,DWORD PTR [rax+0x4]
   1400018cd:	add    rcx,rdi
   1400018d0:	xor    r8d,r8d
   1400018d3:	mov    edx,esi
   1400018d5:	call   QWORD PTR [rip+0x1785]        # 0x140003060
   1400018db:	nop
   1400018dc:	mov    rcx,QWORD PTR [r12]
   1400018e0:	movsxd rdx,DWORD PTR [rcx+0x4]
   1400018e4:	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   1400018e9:	test   rcx,rcx
   1400018ec:	je     0x1400018f5
   1400018ee:	mov    rdx,QWORD PTR [rcx]
   1400018f1:	call   QWORD PTR [rdx+0x10]
   1400018f4:	nop
   1400018f5:	mov    rax,rdi
   1400018f8:	lea    r11,[rsp+0x50]
   1400018fd:	mov    rbx,QWORD PTR [r11+0x40]
   140001901:	mov    rsi,QWORD PTR [r11+0x48]
   140001905:	mov    rsp,r11
   140001908:	pop    r15
   14000190a:	pop    r14
   14000190c:	pop    r13
   14000190e:	pop    r12
   140001910:	pop    rdi
   140001911:	ret
   140001912:	int3
   140001913:	int3
   140001914:	int3
   140001915:	int3
   140001916:	int3
   140001917:	int3
   140001918:	int3
   140001919:	int3
   14000191a:	int3
   14000191b:	int3
   14000191c:	int3
   14000191d:	int3
   14000191e:	int3
   14000191f:	int3
   140001920:	rex push rbx
   140001922:	sub    rsp,0x20
   140001926:	mov    rbx,rcx
   140001929:	mov    rcx,QWORD PTR [rcx+0x18]
   14000192d:	cmp    rcx,0xf
   140001931:	jbe    0x14000196c
   140001933:	mov    rax,QWORD PTR [rbx]
   140001936:	lea    rdx,[rcx+0x1]
   14000193a:	cmp    rdx,0x1000
   140001941:	jb     0x140001961
   140001943:	mov    r8,QWORD PTR [rax-0x8]
   140001947:	sub    rax,r8
   14000194a:	sub    rax,0x8
   14000194e:	cmp    rax,0x1f
   140001952:	ja     0x14000195a
   140001954:	lea    rdx,[rcx+0x28]
   140001958:	jmp    0x140001964
   14000195a:	mov    ecx,0x5
   14000195f:	int    0x29
   140001961:	mov    r8,rax
   140001964:	mov    rcx,r8
   140001967:	call   0x140001ca0
   14000196c:	mov    QWORD PTR [rbx+0x10],0x0
   140001974:	mov    QWORD PTR [rbx+0x18],0xf
   14000197c:	mov    BYTE PTR [rbx],0x0
   14000197f:	add    rsp,0x20
   140001983:	pop    rbx
   140001984:	ret
   140001985:	int3
   140001986:	int3
   140001987:	int3
   140001988:	int3
   140001989:	int3
   14000198a:	int3
   14000198b:	int3
   14000198c:	int3
   14000198d:	int3
   14000198e:	int3
   14000198f:	int3
   140001990:	sub    rsp,0x28
   140001994:	mov    rdx,QWORD PTR [rcx]
   140001997:	mov    rax,QWORD PTR [rdx]
   14000199a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000199e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   1400019a3:	test   rcx,rcx
   1400019a6:	je     0x1400019af
   1400019a8:	mov    rax,QWORD PTR [rcx]
   1400019ab:	call   QWORD PTR [rax+0x10]
   1400019ae:	nop
   1400019af:	add    rsp,0x28
   1400019b3:	ret
   1400019b4:	int3
   1400019b5:	int3
   1400019b6:	int3
   1400019b7:	int3
   1400019b8:	int3
   1400019b9:	int3
   1400019ba:	int3
   1400019bb:	int3
   1400019bc:	int3
   1400019bd:	int3
   1400019be:	int3
   1400019bf:	int3
   1400019c0:	sub    rsp,0x28
   1400019c4:	mov    rdx,QWORD PTR [rcx]
   1400019c7:	mov    rax,QWORD PTR [rdx]
   1400019ca:	movsxd rcx,DWORD PTR [rax+0x4]
   1400019ce:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   1400019d3:	test   rcx,rcx
   1400019d6:	je     0x1400019df
   1400019d8:	mov    rax,QWORD PTR [rcx]
   1400019db:	call   QWORD PTR [rax+0x10]
   1400019de:	nop
   1400019df:	add    rsp,0x28
   1400019e3:	ret
   1400019e4:	int3
   1400019e5:	int3
   1400019e6:	int3
   1400019e7:	int3
   1400019e8:	int3
   1400019e9:	int3
   1400019ea:	int3
   1400019eb:	int3
   1400019ec:	int3
   1400019ed:	int3
   1400019ee:	int3
   1400019ef:	int3
   1400019f0:	rex push rbx
   1400019f2:	sub    rsp,0x20
   1400019f6:	mov    rbx,rcx
   1400019f9:	call   QWORD PTR [rip+0x16d9]        # 0x1400030d8
   1400019ff:	test   eax,eax
   140001a01:	jne    0x140001a0d
   140001a03:	mov    rcx,QWORD PTR [rbx]
   140001a06:	call   QWORD PTR [rip+0x1644]        # 0x140003050
   140001a0c:	nop
   140001a0d:	mov    rdx,QWORD PTR [rbx]
   140001a10:	mov    rax,QWORD PTR [rdx]
   140001a13:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a17:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a1c:	test   rcx,rcx
   140001a1f:	je     0x140001a28
   140001a21:	mov    rax,QWORD PTR [rcx]
   140001a24:	call   QWORD PTR [rax+0x10]
   140001a27:	nop
   140001a28:	add    rsp,0x20
   140001a2c:	pop    rbx
   140001a2d:	ret
   140001a2e:	int3
   140001a2f:	int3
   140001a30:	mov    rcx,QWORD PTR [rcx]
   140001a33:	test   rcx,rcx
   140001a36:	je     0x140001a43
   140001a38:	mov    rax,QWORD PTR [rcx]
   140001a3b:	mov    edx,0x1
   140001a40:	rex.W jmp QWORD PTR [rax]
   140001a43:	ret
   140001a44:	int3
   140001a45:	int3
   140001a46:	int3
   140001a47:	int3
   140001a48:	int3
   140001a49:	int3
   140001a4a:	int3
   140001a4b:	int3
   140001a4c:	int3
   140001a4d:	int3
   140001a4e:	int3
   140001a4f:	int3
   140001a50:	rex push rbp
   140001a52:	push   rsi
   140001a53:	push   rdi
   140001a54:	push   r12
   140001a56:	sub    rsp,0x28
   140001a5a:	mov    rbp,QWORD PTR [rcx+0x10]
   140001a5e:	movabs rdi,0x7fffffffffffffff
   140001a68:	mov    rax,rdi
   140001a6b:	movzx  r12d,r9b
   140001a6f:	sub    rax,rbp
   140001a72:	mov    rsi,rcx
   140001a75:	cmp    rax,0x1
   140001a79:	jb     0x140001ba8
   140001a7f:	mov    QWORD PTR [rsp+0x58],rbx
   140001a84:	mov    QWORD PTR [rsp+0x60],r14
   140001a89:	mov    r14,QWORD PTR [rcx+0x18]
   140001a8d:	mov    QWORD PTR [rsp+0x20],r15
   140001a92:	lea    r15,[rbp+0x1]
   140001a96:	mov    rcx,r15
   140001a99:	or     rcx,0xf
   140001a9d:	cmp    rcx,rdi
   140001aa0:	ja     0x140001ae5
   140001aa2:	mov    rdx,r14
   140001aa5:	mov    rax,rdi
   140001aa8:	shr    rdx,1
   140001aab:	sub    rax,rdx
   140001aae:	cmp    r14,rax
   140001ab1:	ja     0x140001ae5
   140001ab3:	lea    rax,[rdx+r14*1]
   140001ab7:	mov    rdi,rcx
   140001aba:	cmp    rcx,rax
   140001abd:	cmovb  rdi,rax
   140001ac1:	lea    rax,[rdi+0x1]
   140001ac5:	test   rax,rax
   140001ac8:	jne    0x140001ace
   140001aca:	xor    ebx,ebx
   140001acc:	jmp    0x140001b16
   140001ace:	cmp    rax,0x1000
   140001ad4:	jb     0x140001b0b
   140001ad6:	lea    rcx,[rax+0x27]
   140001ada:	cmp    rcx,rax
   140001add:	jbe    0x140001bae
   140001ae3:	jmp    0x140001af3
   140001ae5:	movabs rcx,0x8000000000000000
   140001aef:	add    rcx,0x27
   140001af3:	call   0x140001c40
   140001af8:	test   rax,rax
   140001afb:	je     0x140001b67
   140001afd:	lea    rbx,[rax+0x27]
   140001b01:	and    rbx,0xffffffffffffffe0
   140001b05:	mov    QWORD PTR [rbx-0x8],rax
   140001b09:	jmp    0x140001b16
   140001b0b:	mov    rcx,rax
   140001b0e:	call   0x140001c40
   140001b13:	mov    rbx,rax
   140001b16:	mov    QWORD PTR [rsi+0x10],r15
   140001b1a:	mov    r8,rbp
   140001b1d:	mov    QWORD PTR [rsi+0x18],rdi
   140001b21:	mov    rcx,rbx
   140001b24:	cmp    r14,0xf
   140001b28:	jbe    0x140001b78
   140001b2a:	mov    rdi,QWORD PTR [rsi]
   140001b2d:	mov    rdx,rdi
   140001b30:	call   0x140002b1e
   140001b35:	lea    rdx,[r14+0x1]
   140001b39:	mov    BYTE PTR [rbx+rbp*1],r12b
   140001b3d:	mov    BYTE PTR [rbx+rbp*1+0x1],0x0
   140001b42:	cmp    rdx,0x1000
   140001b49:	jb     0x140001b6e
   140001b4b:	mov    rcx,QWORD PTR [rdi-0x8]
   140001b4f:	sub    rdi,rcx
   140001b52:	sub    rdi,0x8
   140001b56:	cmp    rdi,0x1f
   140001b5a:	ja     0x140001b67
   140001b5c:	lea    rdx,[r14+0x28]
   140001b60:	call   0x140001ca0
   140001b65:	jmp    0x140001b89
   140001b67:	mov    ecx,0x5
   140001b6c:	int    0x29
   140001b6e:	mov    rcx,rdi
   140001b71:	call   0x140001ca0
   140001b76:	jmp    0x140001b89
   140001b78:	mov    rdx,rsi
   140001b7b:	call   0x140002b1e
   140001b80:	mov    BYTE PTR [rbx+rbp*1],r12b
   140001b84:	mov    BYTE PTR [rbx+rbp*1+0x1],0x0
   140001b89:	mov    QWORD PTR [rsi],rbx
   140001b8c:	mov    rax,rsi
   140001b8f:	mov    r14,QWORD PTR [rsp+0x60]
   140001b94:	mov    rbx,QWORD PTR [rsp+0x58]
   140001b99:	mov    r15,QWORD PTR [rsp+0x20]
   140001b9e:	add    rsp,0x28
   140001ba2:	pop    r12
   140001ba4:	pop    rdi
   140001ba5:	pop    rsi
   140001ba6:	pop    rbp
   140001ba7:	ret
   140001ba8:	call   0x1400011b0
   140001bad:	int3
   140001bae:	call   0x140001110
   140001bb3:	int3
   140001bb4:	jmp    QWORD PTR [rip+0x1536]        # 0x1400030f0
   140001bba:	int3
   140001bbb:	int3
   140001bbc:	int3
   140001bbd:	int3
   140001bbe:	int3
   140001bbf:	int3
   140001bc0:	rex push rbx
   140001bc2:	sub    rsp,0x20
   140001bc6:	mov    rbx,rcx
   140001bc9:	mov    ecx,0x10
   140001bce:	call   QWORD PTR [rip+0x1594]        # 0x140003168
   140001bd4:	mov    rdx,rax
   140001bd7:	test   rax,rax
   140001bda:	je     0x140001bf7
   140001bdc:	mov    rax,QWORD PTR [rip+0x359d]        # 0x140005180
   140001be3:	mov    QWORD PTR [rdx],rax
   140001be6:	mov    QWORD PTR [rdx+0x8],rbx
   140001bea:	mov    QWORD PTR [rip+0x358f],rdx        # 0x140005180
   140001bf1:	add    rsp,0x20
   140001bf5:	pop    rbx
   140001bf6:	ret
   140001bf7:	call   0x140001bfd
   140001bfc:	int3
   140001bfd:	jmp    QWORD PTR [rip+0x14ad]        # 0x1400030b0
   140001c03:	int3
   140001c04:	int3
   140001c05:	int3
   140001c06:	int3
   140001c07:	int3
   140001c08:	int3
   140001c09:	int3
   140001c0a:	int3
   140001c0b:	int3
   140001c0c:	int3
   140001c0d:	int3
   140001c0e:	int3
   140001c0f:	int3
   140001c10:	int3
   140001c11:	int3
   140001c12:	int3
   140001c13:	int3
   140001c14:	int3
   140001c15:	int3
   140001c16:	data16 nop WORD PTR [rax+rax*1+0x0]
   140001c20:	cmp    rcx,QWORD PTR [rip+0x3419]        # 0x140005040
   140001c27:	jne    0x140001c39
   140001c29:	rol    rcx,0x10
   140001c2d:	test   cx,0xffff
   140001c32:	jne    0x140001c35
   140001c34:	ret
   140001c35:	ror    rcx,0x10
   140001c39:	jmp    0x1400021f0
   140001c3e:	int3
   140001c3f:	int3
   140001c40:	rex push rbx
   140001c42:	sub    rsp,0x20
   140001c46:	mov    rbx,rcx
   140001c49:	call   0x14000284a
   140001c4e:	test   rax,rax
   140001c51:	jne    0x140001c6c
   140001c53:	mov    rcx,rbx
   140001c56:	call   0x140002850
   140001c5b:	test   eax,eax
   140001c5d:	je     0x140001c72
   140001c5f:	mov    rcx,rbx
   140001c62:	call   0x14000284a
   140001c67:	test   rax,rax
   140001c6a:	je     0x140001c53
   140001c6c:	add    rsp,0x20
   140001c70:	pop    rbx
   140001c71:	ret
   140001c72:	cmp    rbx,0xffffffffffffffff
   140001c76:	je     0x140001c7e
   140001c78:	call   0x140002230
   140001c7d:	int3
   140001c7e:	call   0x140001110
   140001c83:	int3
   140001c84:	int3
   140001c85:	int3
   140001c86:	int3
   140001c87:	int3
   140001c88:	int3
   140001c89:	int3
   140001c8a:	int3
   140001c8b:	int3
   140001c8c:	int3
   140001c8d:	int3
   140001c8e:	int3
   140001c8f:	int3
   140001c90:	jmp    0x140002844
   140001c95:	int3
   140001c96:	int3
   140001c97:	int3
   140001c98:	int3
   140001c99:	int3
   140001c9a:	int3
   140001c9b:	int3
   140001c9c:	int3
   140001c9d:	int3
   140001c9e:	int3
   140001c9f:	int3
   140001ca0:	jmp    0x140001c90
   140001ca5:	int3
   140001ca6:	int3
   140001ca7:	int3
   140001ca8:	int3
   140001ca9:	int3
   140001caa:	int3
   140001cab:	int3
   140001cac:	int3
   140001cad:	int3
   140001cae:	int3
   140001caf:	int3
   140001cb0:	rex push rbx
   140001cb2:	sub    rsp,0x20
   140001cb6:	lea    rax,[rip+0x164b]        # 0x140003308
   140001cbd:	mov    rbx,rcx
   140001cc0:	mov    QWORD PTR [rcx],rax
   140001cc3:	test   dl,0x1
   140001cc6:	je     0x140001cd2
   140001cc8:	mov    edx,0x18
   140001ccd:	call   0x140001ca0
   140001cd2:	mov    rax,rbx
   140001cd5:	add    rsp,0x20
   140001cd9:	pop    rbx
   140001cda:	ret
   140001cdb:	int3
   140001cdc:	int3
   140001cdd:	int3
   140001cde:	int3
   140001cdf:	int3
   140001ce0:	rex push rbx
   140001ce2:	sub    rsp,0x20
   140001ce6:	mov    ecx,0x1
   140001ceb:	call   0x14000285c
   140001cf0:	call   0x140002330
   140001cf5:	mov    ecx,eax
   140001cf7:	call   0x140002892
   140001cfc:	call   0x140002310
   140001d01:	mov    ebx,eax
   140001d03:	call   0x1400028c2
   140001d08:	mov    ecx,0x1
   140001d0d:	mov    DWORD PTR [rax],ebx
   140001d0f:	call   0x140002000
   140001d14:	test   al,al
   140001d16:	je     0x140001d8b
   140001d18:	call   0x1400024c0
   140001d1d:	lea    rcx,[rip+0x7ec]        # 0x140002510
   140001d24:	call   0x1400021a0
   140001d29:	call   0x140002320
   140001d2e:	mov    ecx,eax
   140001d30:	call   0x140002868
   140001d35:	test   eax,eax
   140001d37:	jne    0x140001d8b
   140001d39:	call   0x140002340
   140001d3e:	call   0x1400023a0
   140001d43:	test   eax,eax
   140001d45:	je     0x140001d53
   140001d47:	lea    rcx,[rip+0x5c2]        # 0x140002310
   140001d4e:	call   0x140002862
   140001d53:	call   0x1400021e0
   140001d58:	call   0x1400021e0
   140001d5d:	call   0x140002310
   140001d62:	mov    ecx,eax
   140001d64:	call   0x1400028b6
   140001d69:	call   0x140002350
   140001d6e:	test   al,al
   140001d70:	je     0x140001d77
   140001d72:	call   0x14000286e
   140001d77:	call   0x140002310
   140001d7c:	call   0x1400023e0
   140001d81:	test   eax,eax
   140001d83:	jne    0x140001d8b
   140001d85:	add    rsp,0x20
   140001d89:	pop    rbx
   140001d8a:	ret
   140001d8b:	mov    ecx,0x7
   140001d90:	call   0x1400023d0
   140001d95:	int3
   140001d96:	int3
   140001d97:	int3
   140001d98:	int3
   140001d99:	int3
   140001d9a:	int3
   140001d9b:	int3
   140001d9c:	int3
   140001d9d:	int3
   140001d9e:	int3
   140001d9f:	int3
   140001da0:	sub    rsp,0x28
   140001da4:	call   0x140002380
   140001da9:	xor    eax,eax
   140001dab:	add    rsp,0x28
   140001daf:	ret
   140001db0:	sub    rsp,0x28
   140001db4:	call   0x140002450
   140001db9:	call   0x140002310
   140001dbe:	mov    ecx,eax
   140001dc0:	add    rsp,0x28
   140001dc4:	jmp    0x1400028bc
   140001dc9:	int3
   140001dca:	int3
   140001dcb:	int3
   140001dcc:	int3
   140001dcd:	int3
   140001dce:	int3
   140001dcf:	int3
   140001dd0:	mov    QWORD PTR [rsp+0x8],rbx
   140001dd5:	mov    QWORD PTR [rsp+0x10],rsi
   140001dda:	push   rdi
   140001ddb:	sub    rsp,0x30
   140001ddf:	mov    ecx,0x1
   140001de4:	call   0x140001fc0
   140001de9:	test   al,al
   140001deb:	je     0x140001f2a
   140001df1:	xor    sil,sil
   140001df4:	mov    BYTE PTR [rsp+0x20],sil
   140001df9:	call   0x140001f70
   140001dfe:	movzx  ebx,al
   140001e01:	mov    ecx,DWORD PTR [rip+0x3389]        # 0x140005190
   140001e07:	cmp    ecx,0x1
   140001e0a:	je     0x140001f35
   140001e10:	test   ecx,ecx
   140001e12:	jne    0x140001e5e
   140001e14:	mov    DWORD PTR [rip+0x3372],0x1        # 0x140005190
   140001e1e:	lea    rdx,[rip+0x14b3]        # 0x1400032d8
   140001e25:	lea    rcx,[rip+0x1494]        # 0x1400032c0
   140001e2c:	call   0x140002880
   140001e31:	test   eax,eax
   140001e33:	je     0x140001e3f
   140001e35:	mov    eax,0xff
   140001e3a:	jmp    0x140001f1a
   140001e3f:	lea    rdx,[rip+0x1472]        # 0x1400032b8
   140001e46:	lea    rcx,[rip+0x1453]        # 0x1400032a0
   140001e4d:	call   0x14000287a
   140001e52:	mov    DWORD PTR [rip+0x3334],0x2        # 0x140005190
   140001e5c:	jmp    0x140001e66
   140001e5e:	mov    sil,0x1
   140001e61:	mov    BYTE PTR [rsp+0x20],sil
   140001e66:	movzx  ecx,bl
   140001e69:	call   0x140002140
   140001e6e:	call   0x1400023b0
   140001e73:	mov    rbx,rax
   140001e76:	cmp    QWORD PTR [rax],0x0
   140001e7a:	je     0x140001e9b
   140001e7c:	mov    rcx,rax
   140001e7f:	call   0x1400020a0
   140001e84:	test   al,al
   140001e86:	je     0x140001e9b
   140001e88:	xor    r8d,r8d
   140001e8b:	mov    edx,0x2
   140001e90:	xor    ecx,ecx
   140001e92:	mov    rax,QWORD PTR [rbx]
   140001e95:	call   QWORD PTR [rip+0x13dd]        # 0x140003278
   140001e9b:	call   0x1400023c0
   140001ea0:	mov    rbx,rax
   140001ea3:	cmp    QWORD PTR [rax],0x0
   140001ea7:	je     0x140001ebd
   140001ea9:	mov    rcx,rax
   140001eac:	call   0x1400020a0
   140001eb1:	test   al,al
   140001eb3:	je     0x140001ebd
   140001eb5:	mov    rcx,QWORD PTR [rbx]
   140001eb8:	call   0x1400028b0
   140001ebd:	call   0x140002874
   140001ec2:	mov    rdi,rax
   140001ec5:	call   0x14000289e
   140001eca:	mov    rbx,QWORD PTR [rax]
   140001ecd:	call   0x140002898
   140001ed2:	mov    r8,rdi
   140001ed5:	mov    rdx,rbx
   140001ed8:	mov    ecx,DWORD PTR [rax]
   140001eda:	call   0x140001290
   140001edf:	mov    ebx,eax
   140001ee1:	call   0x1400023f0
   140001ee6:	test   al,al
   140001ee8:	je     0x140001f3f
   140001eea:	test   sil,sil
   140001eed:	jne    0x140001ef4
   140001eef:	call   0x1400028a4
   140001ef4:	xor    edx,edx
   140001ef6:	mov    cl,0x1
   140001ef8:	call   0x140002170
   140001efd:	mov    eax,ebx
   140001eff:	jmp    0x140001f1a
   140001f01:	mov    ebx,eax
   140001f03:	call   0x1400023f0
   140001f08:	test   al,al
   140001f0a:	je     0x140001f47
   140001f0c:	cmp    BYTE PTR [rsp+0x20],0x0
   140001f11:	jne    0x140001f18
   140001f13:	call   0x1400028aa
   140001f18:	mov    eax,ebx
   140001f1a:	mov    rbx,QWORD PTR [rsp+0x40]
   140001f1f:	mov    rsi,QWORD PTR [rsp+0x48]
   140001f24:	add    rsp,0x30
   140001f28:	pop    rdi
   140001f29:	ret
   140001f2a:	mov    ecx,0x7
   140001f2f:	call   0x1400023d0
   140001f34:	nop
   140001f35:	mov    ecx,0x7
   140001f3a:	call   0x1400023d0
   140001f3f:	mov    ecx,ebx
   140001f41:	call   0x140002886
   140001f46:	nop
   140001f47:	mov    ecx,ebx
   140001f49:	call   0x14000288c
   140001f4e:	nop
   140001f4f:	int3
   140001f50:	sub    rsp,0x28
   140001f54:	call   0x140002250
   140001f59:	add    rsp,0x28
   140001f5d:	jmp    0x140001dd0
   140001f62:	int3
   140001f63:	int3
   140001f64:	int3
   140001f65:	int3
   140001f66:	int3
   140001f67:	int3
   140001f68:	int3
   140001f69:	int3
   140001f6a:	int3
   140001f6b:	int3
   140001f6c:	int3
   140001f6d:	int3
   140001f6e:	int3
   140001f6f:	int3
   140001f70:	sub    rsp,0x28
   140001f74:	call   0x140002810
   140001f79:	test   eax,eax
   140001f7b:	je     0x140001fa9
   140001f7d:	mov    rax,QWORD PTR gs:0x30
   140001f86:	mov    rcx,QWORD PTR [rax+0x8]
   140001f8a:	xor    eax,eax
   140001f8c:	lock cmpxchg QWORD PTR [rip+0x3203],rcx        # 0x140005198
   140001f95:	je     0x140001fa9
   140001f97:	cmp    rcx,rax
   140001f9a:	je     0x140001fb0
   140001f9c:	xor    eax,eax
   140001f9e:	lock cmpxchg QWORD PTR [rip+0x31f1],rcx        # 0x140005198
   140001fa7:	jne    0x140001f97
   140001fa9:	xor    al,al
   140001fab:	add    rsp,0x28
   140001faf:	ret
   140001fb0:	mov    al,0x1
   140001fb2:	add    rsp,0x28
   140001fb6:	ret
   140001fb7:	int3
   140001fb8:	int3
   140001fb9:	int3
   140001fba:	int3
   140001fbb:	int3
   140001fbc:	int3
   140001fbd:	int3
   140001fbe:	int3
   140001fbf:	int3
   140001fc0:	sub    rsp,0x28
   140001fc4:	test   ecx,ecx
   140001fc6:	jne    0x140001fcf
   140001fc8:	mov    BYTE PTR [rip+0x31d1],0x1        # 0x1400051a0
   140001fcf:	call   0x140002560
   140001fd4:	call   0x140002350
   140001fd9:	test   al,al
   140001fdb:	je     0x140001fed
   140001fdd:	call   0x140002350
   140001fe2:	test   al,al
   140001fe4:	jne    0x140001ff4
   140001fe6:	xor    ecx,ecx
   140001fe8:	call   0x140002350
   140001fed:	xor    al,al
   140001fef:	add    rsp,0x28
   140001ff3:	ret
   140001ff4:	mov    al,0x1
   140001ff6:	add    rsp,0x28
   140001ffa:	ret
   140001ffb:	int3
   140001ffc:	int3
   140001ffd:	int3
   140001ffe:	int3
   140001fff:	int3
   140002000:	rex push rbx
   140002002:	sub    rsp,0x20
   140002006:	cmp    BYTE PTR [rip+0x3194],0x0        # 0x1400051a1
   14000200d:	mov    ebx,ecx
   14000200f:	jne    0x140002080
   140002011:	cmp    ecx,0x1
   140002014:	ja     0x140002088
   140002016:	call   0x140002810
   14000201b:	test   eax,eax
   14000201d:	je     0x14000204b
   14000201f:	test   ebx,ebx
   140002021:	jne    0x14000204b
   140002023:	lea    rcx,[rip+0x317e]        # 0x1400051a8
   14000202a:	call   0x1400028c8
   14000202f:	test   eax,eax
   140002031:	jne    0x140002043
   140002033:	lea    rcx,[rip+0x3186]        # 0x1400051c0
   14000203a:	call   0x1400028c8
   14000203f:	test   eax,eax
   140002041:	je     0x140002079
   140002043:	xor    al,al
   140002045:	add    rsp,0x20
   140002049:	pop    rbx
   14000204a:	ret
   14000204b:	movdqa xmm0,XMMWORD PTR [rip+0x12bd]        # 0x140003310
   140002053:	movdqu XMMWORD PTR [rip+0x314d],xmm0        # 0x1400051a8
   14000205b:	mov    QWORD PTR [rip+0x3152],0xffffffffffffffff        # 0x1400051b8
   140002066:	movdqu XMMWORD PTR [rip+0x3152],xmm0        # 0x1400051c0
   14000206e:	mov    QWORD PTR [rip+0x3157],0xffffffffffffffff        # 0x1400051d0
   140002079:	mov    BYTE PTR [rip+0x3121],0x1        # 0x1400051a1
   140002080:	mov    al,0x1
   140002082:	add    rsp,0x20
   140002086:	pop    rbx
   140002087:	ret
   140002088:	mov    ecx,0x5
   14000208d:	call   0x1400023d0
   140002092:	int3
   140002093:	int3
   140002094:	int3
   140002095:	int3
   140002096:	int3
   140002097:	int3
   140002098:	int3
   140002099:	int3
   14000209a:	int3
   14000209b:	int3
   14000209c:	int3
   14000209d:	int3
   14000209e:	int3
   14000209f:	int3
   1400020a0:	sub    rsp,0x18
   1400020a4:	mov    r8,rcx
   1400020a7:	mov    eax,0x5a4d
   1400020ac:	cmp    WORD PTR [rip+0xffffffffffffdf4d],ax        # 0x140000000
   1400020b3:	jne    0x140002126
   1400020b5:	movsxd rcx,DWORD PTR [rip+0xffffffffffffdf80]        # 0x14000003c
   1400020bc:	lea    rdx,[rip+0xffffffffffffdf3d]        # 0x140000000
   1400020c3:	add    rcx,rdx
   1400020c6:	cmp    DWORD PTR [rcx],0x4550
   1400020cc:	jne    0x140002126
   1400020ce:	mov    eax,0x20b
   1400020d3:	cmp    WORD PTR [rcx+0x18],ax
   1400020d7:	jne    0x140002126
   1400020d9:	sub    r8,rdx
   1400020dc:	movzx  eax,WORD PTR [rcx+0x14]
   1400020e0:	add    rax,0x18
   1400020e4:	add    rax,rcx
   1400020e7:	movzx  ecx,WORD PTR [rcx+0x6]
   1400020eb:	lea    rdx,[rcx+rcx*4]
   1400020ef:	lea    r9,[rax+rdx*8]
   1400020f3:	mov    QWORD PTR [rsp],rax
   1400020f7:	cmp    rax,r9
   1400020fa:	je     0x140002122
   1400020fc:	mov    edx,DWORD PTR [rax+0xc]
   1400020ff:	cmp    r8,rdx
   140002102:	jb     0x14000211c
   140002104:	mov    ecx,DWORD PTR [rax+0x8]
   140002107:	add    ecx,edx
   140002109:	cmp    r8,rcx
   14000210c:	jae    0x14000211c
   14000210e:	cmp    DWORD PTR [rax+0x24],0x0
   140002112:	jge    0x140002118
   140002114:	xor    al,al
   140002116:	jmp    0x14000212c
   140002118:	mov    al,0x1
   14000211a:	jmp    0x14000212c
   14000211c:	add    rax,0x28
   140002120:	jmp    0x1400020f3
   140002122:	xor    al,al
   140002124:	jmp    0x14000212c
   140002126:	xor    al,al
   140002128:	jmp    0x14000212c
   14000212a:	xor    al,al
   14000212c:	add    rsp,0x18
   140002130:	ret
   140002131:	int3
   140002132:	int3
   140002133:	int3
   140002134:	int3
   140002135:	int3
   140002136:	int3
   140002137:	int3
   140002138:	int3
   140002139:	int3
   14000213a:	int3
   14000213b:	int3
   14000213c:	int3
   14000213d:	int3
   14000213e:	int3
   14000213f:	int3
   140002140:	rex push rbx
   140002142:	sub    rsp,0x20
   140002146:	movzx  ebx,cl
   140002149:	call   0x140002810
   14000214e:	test   eax,eax
   140002150:	je     0x14000215f
   140002152:	test   bl,bl
   140002154:	jne    0x14000215f
   140002156:	xor    eax,eax
   140002158:	xchg   QWORD PTR [rip+0x3039],rax        # 0x140005198
   14000215f:	add    rsp,0x20
   140002163:	pop    rbx
   140002164:	ret
   140002165:	int3
   140002166:	int3
   140002167:	int3
   140002168:	int3
   140002169:	int3
   14000216a:	int3
   14000216b:	int3
   14000216c:	int3
   14000216d:	int3
   14000216e:	int3
   14000216f:	int3
   140002170:	rex push rbx
   140002172:	sub    rsp,0x20
   140002176:	cmp    BYTE PTR [rip+0x3023],0x0        # 0x1400051a0
   14000217d:	movzx  ebx,cl
   140002180:	je     0x140002186
   140002182:	test   dl,dl
   140002184:	jne    0x140002193
   140002186:	call   0x140002350
   14000218b:	movzx  ecx,bl
   14000218e:	call   0x140002350
   140002193:	mov    al,0x1
   140002195:	add    rsp,0x20
   140002199:	pop    rbx
   14000219a:	ret
   14000219b:	int3
   14000219c:	int3
   14000219d:	int3
   14000219e:	int3
   14000219f:	int3
   1400021a0:	rex push rbx
   1400021a2:	sub    rsp,0x20
   1400021a6:	cmp    QWORD PTR [rip+0x2ffa],0xffffffffffffffff        # 0x1400051a8
   1400021ae:	mov    rbx,rcx
   1400021b1:	jne    0x1400021ba
   1400021b3:	call   0x1400028d4
   1400021b8:	jmp    0x1400021c9
   1400021ba:	mov    rdx,rbx
   1400021bd:	lea    rcx,[rip+0x2fe4]        # 0x1400051a8
   1400021c4:	call   0x1400028ce
   1400021c9:	xor    edx,edx
   1400021cb:	test   eax,eax
   1400021cd:	cmove  rdx,rbx
   1400021d1:	neg    rdx
   1400021d4:	sbb    eax,eax
   1400021d6:	neg    eax
   1400021d8:	dec    eax
   1400021da:	add    rsp,0x20
   1400021de:	pop    rbx
   1400021df:	ret
   1400021e0:	ret    0x0
   1400021e3:	int3
   1400021e4:	int3
   1400021e5:	int3
   1400021e6:	int3
   1400021e7:	int3
   1400021e8:	int3
   1400021e9:	int3
   1400021ea:	int3
   1400021eb:	int3
   1400021ec:	int3
   1400021ed:	int3
   1400021ee:	int3
   1400021ef:	int3
   1400021f0:	mov    ecx,0x2
   1400021f5:	int    0x29
   1400021f7:	ret
   1400021f8:	int3
   1400021f9:	int3
   1400021fa:	int3
   1400021fb:	int3
   1400021fc:	int3
   1400021fd:	int3
   1400021fe:	int3
   1400021ff:	int3
   140002200:	lea    rax,[rip+0x1149]        # 0x140003350
   140002207:	mov    QWORD PTR [rcx+0x10],0x0
   14000220f:	mov    QWORD PTR [rcx+0x8],rax
   140002213:	lea    rax,[rip+0x1126]        # 0x140003340
   14000221a:	mov    QWORD PTR [rcx],rax
   14000221d:	mov    rax,rcx
   140002220:	ret
   140002221:	int3
   140002222:	int3
   140002223:	int3
   140002224:	int3
   140002225:	int3
   140002226:	int3
   140002227:	int3
   140002228:	int3
   140002229:	int3
   14000222a:	int3
   14000222b:	int3
   14000222c:	int3
   14000222d:	int3
   14000222e:	int3
   14000222f:	int3
   140002230:	sub    rsp,0x48
   140002234:	lea    rcx,[rsp+0x20]
   140002239:	call   0x140002200
   14000223e:	lea    rdx,[rip+0x1dab]        # 0x140003ff0
   140002245:	lea    rcx,[rsp+0x20]
   14000224a:	call   0x140002832
   14000224f:	int3
   140002250:	rex push rbx
   140002252:	sub    rsp,0x30
   140002256:	mov    rax,QWORD PTR [rip+0x2de3]        # 0x140005040
   14000225d:	movabs rbx,0x2b992ddfa232
   140002267:	cmp    rax,rbx
   14000226a:	je     0x14000227c
   14000226c:	not    rax
   14000226f:	mov    QWORD PTR [rip+0x2e0a],rax        # 0x140005080
   140002276:	add    rsp,0x30
   14000227a:	pop    rbx
   14000227b:	ret
   14000227c:	lea    rcx,[rsp+0x40]
   140002281:	mov    QWORD PTR [rsp+0x40],0x0
   14000228a:	call   QWORD PTR [rip+0xd88]        # 0x140003018
   140002290:	mov    rax,QWORD PTR [rsp+0x40]
   140002295:	mov    QWORD PTR [rsp+0x20],rax
   14000229a:	call   QWORD PTR [rip+0xd80]        # 0x140003020
   1400022a0:	mov    eax,eax
   1400022a2:	xor    QWORD PTR [rsp+0x20],rax
   1400022a7:	call   QWORD PTR [rip+0xd7b]        # 0x140003028
   1400022ad:	mov    eax,eax
   1400022af:	lea    rcx,[rsp+0x48]
   1400022b4:	xor    QWORD PTR [rsp+0x20],rax
   1400022b9:	call   QWORD PTR [rip+0xd71]        # 0x140003030
   1400022bf:	mov    rax,QWORD PTR [rsp+0x48]
   1400022c4:	mov    ecx,eax
   1400022c6:	shl    rcx,0x20
   1400022ca:	xor    rcx,rax
   1400022cd:	lea    rax,[rsp+0x20]
   1400022d2:	xor    rcx,QWORD PTR [rsp+0x20]
   1400022d7:	xor    rcx,rax
   1400022da:	movabs rax,0xffffffffffff
   1400022e4:	and    rcx,rax
   1400022e7:	movabs rax,0x2b992ddfa233
   1400022f1:	cmp    rcx,rbx
   1400022f4:	cmove  rcx,rax
   1400022f8:	mov    QWORD PTR [rip+0x2d41],rcx        # 0x140005040
   1400022ff:	not    rcx
   140002302:	mov    QWORD PTR [rip+0x2d77],rcx        # 0x140005080
   140002309:	add    rsp,0x30
   14000230d:	pop    rbx
   14000230e:	ret
   14000230f:	int3
   140002310:	xor    eax,eax
   140002312:	ret
   140002313:	int3
   140002314:	int3
   140002315:	int3
   140002316:	int3
   140002317:	int3
   140002318:	int3
   140002319:	int3
   14000231a:	int3
   14000231b:	int3
   14000231c:	int3
   14000231d:	int3
   14000231e:	int3
   14000231f:	int3
   140002320:	mov    eax,0x1
   140002325:	ret
   140002326:	int3
   140002327:	int3
   140002328:	int3
   140002329:	int3
   14000232a:	int3
   14000232b:	int3
   14000232c:	int3
   14000232d:	int3
   14000232e:	int3
   14000232f:	int3
   140002330:	mov    eax,0x4000
   140002335:	ret
   140002336:	int3
   140002337:	int3
   140002338:	int3
   140002339:	int3
   14000233a:	int3
   14000233b:	int3
   14000233c:	int3
   14000233d:	int3
   14000233e:	int3
   14000233f:	int3
   140002340:	lea    rcx,[rip+0x2e99]        # 0x1400051e0
   140002347:	rex.W jmp QWORD PTR [rip+0xcc2]        # 0x140003010
   14000234e:	int3
   14000234f:	int3
   140002350:	mov    al,0x1
   140002352:	ret
   140002353:	int3
   140002354:	int3
   140002355:	int3
   140002356:	int3
   140002357:	int3
   140002358:	int3
   140002359:	int3
   14000235a:	int3
   14000235b:	int3
   14000235c:	int3
   14000235d:	int3
   14000235e:	int3
   14000235f:	int3
   140002360:	lea    rax,[rip+0x2e89]        # 0x1400051f0
   140002367:	ret
   140002368:	int3
   140002369:	int3
   14000236a:	int3
   14000236b:	int3
   14000236c:	int3
   14000236d:	int3
   14000236e:	int3
   14000236f:	int3
   140002370:	lea    rax,[rip+0x2e81]        # 0x1400051f8
   140002377:	ret
   140002378:	int3
   140002379:	int3
   14000237a:	int3
   14000237b:	int3
   14000237c:	int3
   14000237d:	int3
   14000237e:	int3
   14000237f:	int3
   140002380:	sub    rsp,0x28
   140002384:	call   0x140002360
   140002389:	or     QWORD PTR [rax],0x24
   14000238d:	call   0x140002370
   140002392:	or     QWORD PTR [rax],0x2
   140002396:	add    rsp,0x28
   14000239a:	ret
   14000239b:	int3
   14000239c:	int3
   14000239d:	int3
   14000239e:	int3
   14000239f:	int3
   1400023a0:	xor    eax,eax
   1400023a2:	cmp    DWORD PTR [rip+0x2ce0],eax        # 0x140005088
   1400023a8:	sete   al
   1400023ab:	ret
   1400023ac:	int3
   1400023ad:	int3
   1400023ae:	int3
   1400023af:	int3
   1400023b0:	lea    rax,[rip+0x2e69]        # 0x140005220
   1400023b7:	ret
   1400023b8:	int3
   1400023b9:	int3
   1400023ba:	int3
   1400023bb:	int3
   1400023bc:	int3
   1400023bd:	int3
   1400023be:	int3
   1400023bf:	int3
   1400023c0:	lea    rax,[rip+0x2e51]        # 0x140005218
   1400023c7:	ret
   1400023c8:	int3
   1400023c9:	int3
   1400023ca:	int3
   1400023cb:	int3
   1400023cc:	int3
   1400023cd:	int3
   1400023ce:	int3
   1400023cf:	int3
   1400023d0:	mov    ecx,ecx
   1400023d2:	int    0x29
   1400023d4:	ret
   1400023d5:	int3
   1400023d6:	int3
   1400023d7:	int3
   1400023d8:	int3
   1400023d9:	int3
   1400023da:	int3
   1400023db:	int3
   1400023dc:	int3
   1400023dd:	int3
   1400023de:	int3
   1400023df:	int3
   1400023e0:	jmp    0x140002310
   1400023e5:	int3
   1400023e6:	int3
   1400023e7:	int3
   1400023e8:	int3
   1400023e9:	int3
   1400023ea:	int3
   1400023eb:	int3
   1400023ec:	int3
   1400023ed:	int3
   1400023ee:	int3
   1400023ef:	int3
   1400023f0:	sub    rsp,0x28
   1400023f4:	xor    ecx,ecx
   1400023f6:	call   QWORD PTR [rip+0xc04]        # 0x140003000
   1400023fc:	test   rax,rax
   1400023ff:	je     0x14000243e
   140002401:	mov    ecx,0x5a4d
   140002406:	cmp    WORD PTR [rax],cx
   140002409:	jne    0x14000243e
   14000240b:	movsxd rcx,DWORD PTR [rax+0x3c]
   14000240f:	cmp    DWORD PTR [rcx+rax*1],0x4550
   140002416:	jne    0x14000243e
   140002418:	mov    edx,0x20b
   14000241d:	cmp    WORD PTR [rcx+rax*1+0x18],dx
   140002422:	jne    0x14000243e
   140002424:	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   14000242c:	jbe    0x14000243e
   14000242e:	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   140002436:	setne  al
   140002439:	add    rsp,0x28
   14000243d:	ret
   14000243e:	xor    al,al
   140002440:	add    rsp,0x28
   140002444:	ret
   140002445:	int3
   140002446:	int3
   140002447:	int3
   140002448:	int3
   140002449:	int3
   14000244a:	int3
   14000244b:	int3
   14000244c:	int3
   14000244d:	int3
   14000244e:	int3
   14000244f:	int3
   140002450:	lea    rcx,[rip+0x9]        # 0x140002460
   140002457:	rex.W jmp QWORD PTR [rip+0xbaa]        # 0x140003008
   14000245e:	int3
   14000245f:	int3
   140002460:	mov    QWORD PTR [rsp+0x8],rbx
   140002465:	push   rdi
   140002466:	sub    rsp,0x20
   14000246a:	mov    rbx,QWORD PTR [rcx]
   14000246d:	mov    rdi,rcx
   140002470:	cmp    DWORD PTR [rbx],0xe06d7363
   140002476:	jne    0x140002494
   140002478:	cmp    DWORD PTR [rbx+0x18],0x4
   14000247c:	jne    0x140002494
   14000247e:	mov    edx,DWORD PTR [rbx+0x20]
   140002481:	lea    eax,[rdx-0x19930520]
   140002487:	cmp    eax,0x2
   14000248a:	jbe    0x1400024a1
   14000248c:	cmp    edx,0x1994000
   140002492:	je     0x1400024a1
   140002494:	mov    rbx,QWORD PTR [rsp+0x30]
   140002499:	xor    eax,eax
   14000249b:	add    rsp,0x20
   14000249f:	pop    rdi
   1400024a0:	ret
   1400024a1:	call   0x140002838
   1400024a6:	mov    QWORD PTR [rax],rbx
   1400024a9:	mov    rbx,QWORD PTR [rdi+0x8]
   1400024ad:	call   0x14000283e
   1400024b2:	mov    QWORD PTR [rax],rbx
   1400024b5:	call   0x1400028da
   1400024ba:	int3
   1400024bb:	int3
   1400024bc:	int3
   1400024bd:	int3
   1400024be:	int3
   1400024bf:	int3
   1400024c0:	mov    QWORD PTR [rsp+0x8],rbx
   1400024c5:	push   rdi
   1400024c6:	sub    rsp,0x20
   1400024ca:	lea    rbx,[rip+0x180f]        # 0x140003ce0
   1400024d1:	lea    rdi,[rip+0x1808]        # 0x140003ce0
   1400024d8:	cmp    rbx,rdi
   1400024db:	jae    0x1400024f7
   1400024dd:	nop    DWORD PTR [rax]
   1400024e0:	mov    rax,QWORD PTR [rbx]
   1400024e3:	test   rax,rax
   1400024e6:	je     0x1400024ee
   1400024e8:	call   QWORD PTR [rip+0xd8a]        # 0x140003278
   1400024ee:	add    rbx,0x8
   1400024f2:	cmp    rbx,rdi
   1400024f5:	jb     0x1400024e0
   1400024f7:	mov    rbx,QWORD PTR [rsp+0x30]
   1400024fc:	add    rsp,0x20
   140002500:	pop    rdi
   140002501:	ret
   140002502:	int3
   140002503:	int3
   140002504:	int3
   140002505:	int3
   140002506:	int3
   140002507:	int3
   140002508:	int3
   140002509:	int3
   14000250a:	int3
   14000250b:	int3
   14000250c:	int3
   14000250d:	int3
   14000250e:	int3
   14000250f:	int3
   140002510:	mov    QWORD PTR [rsp+0x8],rbx
   140002515:	push   rdi
   140002516:	sub    rsp,0x20
   14000251a:	lea    rbx,[rip+0x17cf]        # 0x140003cf0
   140002521:	lea    rdi,[rip+0x17c8]        # 0x140003cf0
   140002528:	cmp    rbx,rdi
   14000252b:	jae    0x140002547
   14000252d:	nop    DWORD PTR [rax]
   140002530:	mov    rax,QWORD PTR [rbx]
   140002533:	test   rax,rax
   140002536:	je     0x14000253e
   140002538:	call   QWORD PTR [rip+0xd3a]        # 0x140003278
   14000253e:	add    rbx,0x8
   140002542:	cmp    rbx,rdi
   140002545:	jb     0x140002530
   140002547:	mov    rbx,QWORD PTR [rsp+0x30]
   14000254c:	add    rsp,0x20
   140002550:	pop    rdi
   140002551:	ret
   140002552:	int3
   140002553:	int3
   140002554:	int3
   140002555:	int3
   140002556:	int3
   140002557:	int3
   140002558:	int3
   140002559:	int3
   14000255a:	int3
   14000255b:	int3
   14000255c:	int3
   14000255d:	int3
   14000255e:	int3
   14000255f:	int3
   140002560:	rex push rsi
   140002562:	push   rdi
   140002563:	push   r14
   140002565:	sub    rsp,0x10
   140002569:	xor    ecx,ecx
   14000256b:	mov    QWORD PTR [rsp+0x38],rbx
   140002570:	xor    eax,eax
   140002572:	cpuid
   140002574:	xor    ecx,0x6c65746e
   14000257a:	xor    edx,0x49656e69
   140002580:	or     edx,ecx
   140002582:	xor    ebx,0x756e6547
   140002588:	mov    r11d,eax
   14000258b:	or     edx,ebx
   14000258d:	mov    eax,0x1
   140002592:	mov    ecx,0x0
   140002597:	cpuid
   140002599:	mov    edi,ecx
   14000259b:	jne    0x1400025fb
   14000259d:	and    eax,0xfff3ff0
   1400025a2:	mov    QWORD PTR [rip+0x2aeb],0x8000        # 0x140005098
   1400025ad:	mov    QWORD PTR [rip+0x2ae8],0xffffffffffffffff        # 0x1400050a0
   1400025b8:	cmp    eax,0x106c0
   1400025bd:	je     0x1400025e7
   1400025bf:	cmp    eax,0x20660
   1400025c4:	je     0x1400025e7
   1400025c6:	cmp    eax,0x20670
   1400025cb:	je     0x1400025e7
   1400025cd:	add    eax,0xfffcf9b0
   1400025d2:	cmp    eax,0x20
   1400025d5:	ja     0x1400025fb
   1400025d7:	movabs rcx,0x100010001
   1400025e1:	bt     rcx,rax
   1400025e5:	jae    0x1400025fb
   1400025e7:	mov    r8d,DWORD PTR [rip+0x2c16]        # 0x140005204
   1400025ee:	or     r8d,0x1
   1400025f2:	mov    DWORD PTR [rip+0x2c0b],r8d        # 0x140005204
   1400025f9:	jmp    0x140002602
   1400025fb:	mov    r8d,DWORD PTR [rip+0x2c02]        # 0x140005204
   140002602:	xor    r10d,r10d
   140002605:	mov    QWORD PTR [rsp+0x40],rbp
   14000260a:	xor    r14d,r14d
   14000260d:	xor    esi,esi
   14000260f:	cmp    r11d,0x7
   140002613:	jl     0x14000266d
   140002615:	xor    ecx,ecx
   140002617:	mov    eax,0x7
   14000261c:	cpuid
   14000261e:	mov    ebp,edx
   140002620:	mov    r9d,ebx
   140002623:	bt     ebx,0x9
   140002627:	jae    0x140002634
   140002629:	or     r8d,0x2
   14000262d:	mov    DWORD PTR [rip+0x2bd0],r8d        # 0x140005204
   140002634:	cmp    eax,0x1
   140002637:	jl     0x140002648
   140002639:	mov    eax,0x7
   14000263e:	mov    ecx,0x1
   140002643:	cpuid
   140002645:	mov    r10d,edx
   140002648:	cmp    r11d,0x24
   14000264c:	jl     0x14000265a
   14000264e:	mov    eax,0x24
   140002653:	xor    ecx,ecx
   140002655:	cpuid
   140002657:	mov    r14d,ebx
   14000265a:	cmp    r11d,0x29
   14000265e:	jl     0x140002672
   140002660:	mov    eax,0x29
   140002665:	xor    ecx,ecx
   140002667:	cpuid
   140002669:	mov    esi,ebx
   14000266b:	jmp    0x140002672
   14000266d:	xor    r9d,r9d
   140002670:	xor    ebp,ebp
   140002672:	mov    rax,QWORD PTR [rip+0x2a2f]        # 0x1400050a8
   140002679:	mov    rbx,QWORD PTR [rsp+0x38]
   14000267e:	and    rax,0xfffffffffffffffe
   140002682:	mov    DWORD PTR [rip+0x2a04],0x1        # 0x140005090
   14000268c:	mov    DWORD PTR [rip+0x29fe],0x2        # 0x140005094
   140002696:	mov    QWORD PTR [rip+0x2a0b],rax        # 0x1400050a8
   14000269d:	bt     edi,0x14
   1400026a1:	jae    0x1400026c2
   1400026a3:	and    rax,0xffffffffffffffef
   1400026a7:	mov    DWORD PTR [rip+0x29df],0x2        # 0x140005090
   1400026b1:	mov    QWORD PTR [rip+0x29f0],rax        # 0x1400050a8
   1400026b8:	mov    DWORD PTR [rip+0x29d2],0x6        # 0x140005094
   1400026c2:	bt     edi,0x1b
   1400026c6:	jae    0x1400027f8
   1400026cc:	xor    ecx,ecx
   1400026ce:	xgetbv
   1400026d1:	shl    rdx,0x20
   1400026d5:	or     rdx,rax
   1400026d8:	mov    QWORD PTR [rsp+0x30],rdx
   1400026dd:	bt     edi,0x1c
   1400026e1:	jae    0x1400027d4
   1400026e7:	mov    rax,QWORD PTR [rsp+0x30]
   1400026ec:	and    al,0x6
   1400026ee:	cmp    al,0x6
   1400026f0:	jne    0x1400027d4
   1400026f6:	mov    eax,DWORD PTR [rip+0x2998]        # 0x140005094
   1400026fc:	or     eax,0x8
   1400026ff:	mov    DWORD PTR [rip+0x2987],0x3        # 0x140005090
   140002709:	mov    DWORD PTR [rip+0x2985],eax        # 0x140005094
   14000270f:	test   r9b,0x20
   140002713:	je     0x14000277a
   140002715:	or     eax,0x20
   140002718:	mov    DWORD PTR [rip+0x296e],0x5        # 0x140005090
   140002722:	mov    DWORD PTR [rip+0x296c],eax        # 0x140005094
   140002728:	and    r9d,0xd0030000
   14000272f:	mov    rax,QWORD PTR [rip+0x2972]        # 0x1400050a8
   140002736:	and    rax,0xfffffffffffffffd
   14000273a:	mov    QWORD PTR [rip+0x2967],rax        # 0x1400050a8
   140002741:	cmp    r9d,0xd0030000
   140002748:	jne    0x140002781
   14000274a:	mov    rax,QWORD PTR [rsp+0x30]
   14000274f:	and    al,0xe0
   140002751:	cmp    al,0xe0
   140002753:	jne    0x14000277a
   140002755:	mov    rax,QWORD PTR [rip+0x294c]        # 0x1400050a8
   14000275c:	or     DWORD PTR [rip+0x2931],0x40        # 0x140005094
   140002763:	and    rax,0xffffffffffffffdb
   140002767:	mov    DWORD PTR [rip+0x291f],0x6        # 0x140005090
   140002771:	mov    QWORD PTR [rip+0x2930],rax        # 0x1400050a8
   140002778:	jmp    0x140002781
   14000277a:	mov    rax,QWORD PTR [rip+0x2927]        # 0x1400050a8
   140002781:	bt     ebp,0x17
   140002785:	jae    0x140002793
   140002787:	btr    rax,0x18
   14000278c:	mov    QWORD PTR [rip+0x2915],rax        # 0x1400050a8
   140002793:	bt     r10d,0x13
   140002798:	jae    0x1400027d4
   14000279a:	mov    rax,QWORD PTR [rsp+0x30]
   14000279f:	and    al,0xe0
   1400027a1:	cmp    al,0xe0
   1400027a3:	jne    0x1400027d4
   1400027a5:	mov    rcx,QWORD PTR [rip+0x28fc]        # 0x1400050a8
   1400027ac:	and    rcx,0xfffffffffeffffd0
   1400027b3:	movzx  eax,r14b
   1400027b7:	mov    DWORD PTR [rip+0x2a4b],eax        # 0x140005208
   1400027bd:	mov    QWORD PTR [rip+0x28e4],rcx        # 0x1400050a8
   1400027c4:	cmp    eax,0x1
   1400027c7:	jbe    0x1400027d4
   1400027c9:	and    rcx,0xffffffffffffffbf
   1400027cd:	mov    QWORD PTR [rip+0x28d4],rcx        # 0x1400050a8
   1400027d4:	bt     r10d,0x15
   1400027d9:	jae    0x1400027f8
   1400027db:	test   sil,0x1
   1400027df:	je     0x1400027f8
   1400027e1:	mov    rax,QWORD PTR [rsp+0x30]
   1400027e6:	bt     rax,0x13
   1400027eb:	jae    0x1400027f8
   1400027ed:	and    QWORD PTR [rip+0x28b0],0xffffffffffffff7f        # 0x1400050a8
   1400027f8:	mov    rbp,QWORD PTR [rsp+0x40]
   1400027fd:	xor    eax,eax
   1400027ff:	add    rsp,0x10
   140002803:	pop    r14
   140002805:	pop    rdi
   140002806:	pop    rsi
   140002807:	ret
   140002808:	int3
   140002809:	int3
   14000280a:	int3
   14000280b:	int3
   14000280c:	int3
   14000280d:	int3
   14000280e:	int3
   14000280f:	int3
   140002810:	xor    eax,eax
   140002812:	cmp    DWORD PTR [rip+0x2898],eax        # 0x1400050b0
   140002818:	setne  al
   14000281b:	ret
   14000281c:	int3
   14000281d:	int3
   14000281e:	int3
   14000281f:	int3
   140002820:	jmp    QWORD PTR [rip+0x92a]        # 0x140003150
   140002826:	jmp    QWORD PTR [rip+0x8ec]        # 0x140003118
   14000282c:	jmp    QWORD PTR [rip+0x8ee]        # 0x140003120
   140002832:	jmp    QWORD PTR [rip+0x900]        # 0x140003138
   140002838:	jmp    QWORD PTR [rip+0x902]        # 0x140003140
   14000283e:	jmp    QWORD PTR [rip+0x8bc]        # 0x140003100
   140002844:	jmp    QWORD PTR [rip+0x916]        # 0x140003160
   14000284a:	jmp    QWORD PTR [rip+0x918]        # 0x140003168
   140002850:	jmp    QWORD PTR [rip+0x91a]        # 0x140003170
   140002856:	jmp    QWORD PTR [rip+0x954]        # 0x1400031b0
   14000285c:	jmp    QWORD PTR [rip+0x97e]        # 0x1400031e0
   140002862:	jmp    QWORD PTR [rip+0x930]        # 0x140003198
   140002868:	jmp    QWORD PTR [rip+0x992]        # 0x140003200
   14000286e:	jmp    QWORD PTR [rip+0x9bc]        # 0x140003230
   140002874:	jmp    QWORD PTR [rip+0x9ae]        # 0x140003228
   14000287a:	jmp    QWORD PTR [rip+0x9a0]        # 0x140003220
   140002880:	jmp    QWORD PTR [rip+0x992]        # 0x140003218
   140002886:	jmp    QWORD PTR [rip+0x984]        # 0x140003210
   14000288c:	jmp    QWORD PTR [rip+0x976]        # 0x140003208
   140002892:	jmp    QWORD PTR [rip+0x9b0]        # 0x140003248
   140002898:	jmp    QWORD PTR [rip+0x90a]        # 0x1400031a8
   14000289e:	jmp    QWORD PTR [rip+0x944]        # 0x1400031e8
   1400028a4:	jmp    QWORD PTR [rip+0x946]        # 0x1400031f0
   1400028aa:	jmp    QWORD PTR [rip+0x928]        # 0x1400031d8
   1400028b0:	jmp    QWORD PTR [rip+0x90a]        # 0x1400031c0
   1400028b6:	jmp    QWORD PTR [rip+0x8cc]        # 0x140003188
   1400028bc:	jmp    QWORD PTR [rip+0x8b6]        # 0x140003178
   1400028c2:	jmp    QWORD PTR [rip+0x978]        # 0x140003240
   1400028c8:	jmp    QWORD PTR [rip+0x8ea]        # 0x1400031b8
   1400028ce:	jmp    QWORD PTR [rip+0x924]        # 0x1400031f8
   1400028d4:	jmp    QWORD PTR [rip+0x8ee]        # 0x1400031c8
   1400028da:	jmp    QWORD PTR [rip+0x8f0]        # 0x1400031d0
   1400028e0:	mov    QWORD PTR [rsp+0x18],rsi
   1400028e5:	push   rdi
   1400028e6:	sub    rsp,0x20
   1400028ea:	movsxd rsi,DWORD PTR [r8]
   1400028ed:	mov    rdi,rcx
   1400028f0:	test   sil,0x4
   1400028f4:	je     0x14000290b
   1400028f6:	mov    eax,DWORD PTR [r8+0x8]
   1400028fa:	movsxd r10,DWORD PTR [r8+0x4]
   1400028fe:	neg    eax
   140002900:	movsxd r8,eax
   140002903:	add    r10,rcx
   140002906:	and    r10,r8
   140002909:	jmp    0x14000290e
   14000290b:	mov    r10,rdi
   14000290e:	mov    rax,QWORD PTR [rdx+0x10]
   140002912:	mov    QWORD PTR [rsp+0x30],rbx
   140002917:	mov    QWORD PTR [rsp+0x38],rbp
   14000291c:	mov    r8d,DWORD PTR [rax+0x8]
   140002920:	add    r8,QWORD PTR [rdx+0x8]
   140002924:	movzx  eax,BYTE PTR [r8]
   140002928:	movzx  ecx,BYTE PTR [r8+0x3]
   14000292d:	and    al,0x7
   14000292f:	cmp    al,0x3
   140002931:	jae    0x140002940
   140002933:	test   cl,0xf
   140002936:	je     0x14000294b
   140002938:	mov    r9d,ecx
   14000293b:	jmp    0x140002a3d
   140002940:	mov    r11d,ecx
   140002943:	mov    edx,ecx
   140002945:	and    r11d,0x1f
   140002949:	jne    0x140002953
   14000294b:	xor    r9d,r9d
   14000294e:	jmp    0x140002a41
   140002953:	add    r8,0x4
   140002957:	mov    eax,r11d
   14000295a:	xor    r9d,r9d
   14000295d:	shr    edx,0x5
   140002960:	add    r8,rax
   140002963:	mov    ecx,r9d
   140002966:	test   edx,edx
   140002968:	je     0x14000298c
   14000296a:	nop    WORD PTR [rax+rax*1+0x0]
   140002970:	movzx  eax,BYTE PTR [r8]
   140002974:	add    r8,0x3
   140002978:	shr    eax,0x3
   14000297b:	test   eax,eax
   14000297d:	je     0x140002986
   14000297f:	add    r8,0x3
   140002983:	add    r8,rax
   140002986:	inc    ecx
   140002988:	cmp    ecx,edx
   14000298a:	jb     0x140002970
   14000298c:	mov    ebx,r9d
   14000298f:	test   r11d,r11d
   140002992:	je     0x140002a41
   140002998:	lea    rbp,[rip+0xffffffffffffd661]        # 0x140000000
   14000299f:	nop
   1400029a0:	movzx  eax,BYTE PTR [r8]
   1400029a4:	movzx  edx,al
   1400029a7:	cmp    al,0x3
   1400029a9:	jbe    0x1400029c4
   1400029ab:	and    dl,0xf
   1400029ae:	lea    ecx,[rdx-0x8]
   1400029b1:	cmp    cl,0x2
   1400029b4:	jbe    0x1400029c4
   1400029b6:	movzx  edx,al
   1400029b9:	and    dl,0x7
   1400029bc:	lea    ecx,[rdx-0x4]
   1400029bf:	cmp    cl,0x3
   1400029c2:	ja     0x1400029e8
   1400029c4:	test   dl,dl
   1400029c6:	je     0x140002a38
   1400029c8:	cmp    al,0x3
   1400029ca:	jbe    0x1400029f7
   1400029cc:	movzx  edx,al
   1400029cf:	and    dl,0xf
   1400029d2:	lea    ecx,[rdx-0x8]
   1400029d5:	cmp    cl,0x2
   1400029d8:	jbe    0x1400029f0
   1400029da:	movzx  edx,al
   1400029dd:	and    dl,0x7
   1400029e0:	lea    ecx,[rdx-0x4]
   1400029e3:	cmp    cl,0x3
   1400029e6:	jbe    0x1400029f0
   1400029e8:	and    al,0x3f
   1400029ea:	cmp    al,0x20
   1400029ec:	jne    0x140002a69
   1400029ee:	jmp    0x1400029f7
   1400029f0:	movzx  eax,dl
   1400029f3:	cmp    al,0x20
   1400029f5:	ja     0x140002a69
   1400029f7:	movzx  eax,al
   1400029fa:	movzx  eax,BYTE PTR [rax+rbp*1+0x2a84]
   140002a02:	mov    ecx,DWORD PTR [rbp+rax*4+0x2a70]
   140002a09:	add    rcx,rbp
   140002a0c:	jmp    rcx
   140002a0e:	mov    eax,0x1
   140002a13:	jmp    0x140002a28
   140002a15:	mov    eax,0x2
   140002a1a:	jmp    0x140002a28
   140002a1c:	mov    eax,0x3
   140002a21:	jmp    0x140002a28
   140002a23:	mov    eax,0x5
   140002a28:	add    r8,rax
   140002a2b:	inc    ebx
   140002a2d:	cmp    ebx,r11d
   140002a30:	jb     0x1400029a0
   140002a36:	jmp    0x140002a41
   140002a38:	movzx  r9d,BYTE PTR [r8+0x1]
   140002a3d:	and    r9,0xfffffffffffffff0
   140002a41:	lea    rcx,[r9+rdi*1]
   140002a45:	mov    rax,rsi
   140002a48:	and    rax,0xfffffffffffffff8
   140002a4c:	xor    rcx,QWORD PTR [rax+r10*1]
   140002a50:	mov    rbp,QWORD PTR [rsp+0x38]
   140002a55:	mov    rbx,QWORD PTR [rsp+0x30]
   140002a5a:	mov    rsi,QWORD PTR [rsp+0x40]
   140002a5f:	add    rsp,0x20
   140002a63:	pop    rdi
   140002a64:	jmp    0x140001c20
   140002a69:	call   0x1400021f0
   140002a6e:	int3
   140002a6f:	nop
   140002a70:	adc    eax,0x2300002a
   140002a75:	sub    al,BYTE PTR [rax]
   140002a77:	add    BYTE PTR [rdx+rbp*1],bl
   140002a7a:	add    BYTE PTR [rax],al
   140002a7c:	(bad)
   140002a7d:	sub    al,BYTE PTR [rax]
   140002a7f:	add    BYTE PTR [rcx+0x2a],ch
   140002a82:	add    BYTE PTR [rax],al
   140002a84:	add    BYTE PTR [rcx],al
   140002a86:	add    al,BYTE PTR [rax]
   140002a88:	add    eax,DWORD PTR [rcx]
   140002a8a:	add    al,BYTE PTR [rbx]
   140002a8c:	add    eax,DWORD PTR [rcx]
   140002a8e:	add    al,BYTE PTR [rsp+rax*1]
   140002a91:	add    al,0x4
   140002a93:	add    al,0x4
   140002a95:	add    al,0x4
   140002a97:	add    al,0x4
   140002a99:	add    al,0x4
   140002a9b:	add    al,0x4
   140002a9d:	add    al,0x4
   140002a9f:	add    al,0x4
   140002aa1:	add    al,0x4
   140002aa3:	add    al,0x0
   140002aa5:	int3
   140002aa6:	int3
   140002aa7:	int3
   140002aa8:	int3
   140002aa9:	int3
   140002aaa:	int3
   140002aab:	int3
   140002aac:	int3
   140002aad:	int3
   140002aae:	int3
   140002aaf:	int3
   140002ab0:	rex push rbx
   140002ab2:	push   rbp
   140002ab3:	push   rsi
   140002ab4:	push   rdi
   140002ab5:	push   r14
   140002ab7:	sub    rsp,0x20
   140002abb:	mov    rbx,QWORD PTR [r9+0x38]
   140002abf:	mov    rsi,rdx
   140002ac2:	mov    r14,r8
   140002ac5:	mov    rbp,rcx
   140002ac8:	mov    rdx,r9
   140002acb:	mov    rcx,rsi
   140002ace:	mov    rdi,r9
   140002ad1:	lea    r8,[rbx+0x4]
   140002ad5:	call   0x1400028e0
   140002ada:	test   BYTE PTR [rbp+0x4],0x66
   140002ade:	mov    eax,0x0
   140002ae3:	setne  al
   140002ae6:	inc    eax
   140002ae8:	test   DWORD PTR [rbx+0x4],eax
   140002aeb:	je     0x140002b08
   140002aed:	mov    r9,rdi
   140002af0:	mov    r8,r14
   140002af3:	mov    rdx,rsi
   140002af6:	mov    rcx,rbp
   140002af9:	add    rsp,0x20
   140002afd:	pop    r14
   140002aff:	pop    rdi
   140002b00:	pop    rsi
   140002b01:	pop    rbp
   140002b02:	pop    rbx
   140002b03:	jmp    0x140002820
   140002b08:	mov    eax,0x1
   140002b0d:	add    rsp,0x20
   140002b11:	pop    r14
   140002b13:	pop    rdi
   140002b14:	pop    rsi
   140002b15:	pop    rbp
   140002b16:	pop    rbx
   140002b17:	ret
   140002b18:	jmp    QWORD PTR [rip+0x612]        # 0x140003130
   140002b1e:	jmp    QWORD PTR [rip+0x604]        # 0x140003128
   140002b24:	jmp    QWORD PTR [rip+0x72e]        # 0x140003258
   140002b2a:	int3
   140002b2b:	int3
   140002b2c:	int3
   140002b2d:	int3
   140002b2e:	int3
   140002b2f:	int3
   140002b30:	int3
   140002b31:	int3
   140002b32:	int3
   140002b33:	int3
   140002b34:	int3
   140002b35:	int3
   140002b36:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002b40:	jmp    rax
   140002b42:	int3
   140002b43:	int3
   140002b44:	int3
   140002b45:	int3
   140002b46:	int3
   140002b47:	int3
   140002b48:	int3
   140002b49:	int3
   140002b4a:	int3
   140002b4b:	int3
   140002b4c:	int3
   140002b4d:	int3
   140002b4e:	int3
   140002b4f:	int3
   140002b50:	int3
   140002b51:	int3
   140002b52:	int3
   140002b53:	int3
   140002b54:	int3
   140002b55:	int3
   140002b56:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002b60:	jmp    QWORD PTR [rip+0x712]        # 0x140003278
   140002b66:	int3
   140002b67:	int3
   140002b68:	int3
   140002b69:	int3
   140002b6a:	int3
   140002b6b:	int3
   140002b6c:	int3
   140002b6d:	int3
   140002b6e:	int3
   140002b6f:	int3
   140002b70:	lea    rcx,[rdx+0x40]
   140002b77:	jmp    0x140001920
   140002b7c:	lea    rcx,[rdx+0x20]
   140002b83:	jmp    0x140001920
   140002b88:	int3
   140002b89:	int3
   140002b8a:	int3
   140002b8b:	int3
   140002b8c:	int3
   140002b8d:	int3
   140002b8e:	int3
   140002b8f:	int3
   140002b90:	lea    rcx,[rdx+0x28]
   140002b97:	rex.W jmp QWORD PTR [rip+0x552]        # 0x1400030f0
   140002b9e:	lea    rcx,[rdx+0x30]
   140002ba5:	jmp    0x140001a30
   140002baa:	int3
   140002bab:	int3
   140002bac:	int3
   140002bad:	int3
   140002bae:	int3
   140002baf:	int3
   140002bb0:	lea    rcx,[rdx+0x20]
   140002bb7:	jmp    0x1400019c0
   140002bbc:	lea    rcx,[rdx+0x20]
   140002bc3:	jmp    0x1400019f0
   140002bc8:	mov    QWORD PTR [rsp+0x10],rdx
   140002bcd:	push   rbp
   140002bce:	sub    rsp,0x20
   140002bd2:	mov    rbp,rdx
   140002bd5:	mov    rdx,QWORD PTR [rbp+0x60]
   140002bd9:	mov    rax,QWORD PTR [rdx]
   140002bdc:	movsxd rcx,DWORD PTR [rax+0x4]
   140002be0:	add    rcx,rdx
   140002be3:	mov    r8b,0x1
   140002be6:	mov    edx,0x4
   140002beb:	call   QWORD PTR [rip+0x46f]        # 0x140003060
   140002bf1:	nop
   140002bf2:	movabs rax,0x0
   140002bfc:	add    rsp,0x20
   140002c00:	pop    rbp
   140002c01:	ret
   140002c02:	int3
   140002c03:	int3
   140002c04:	int3
   140002c05:	int3
   140002c06:	int3
   140002c07:	int3
   140002c08:	int3
   140002c09:	int3
   140002c0a:	int3
   140002c0b:	int3
   140002c0c:	int3
   140002c0d:	int3
   140002c0e:	int3
   140002c0f:	int3
   140002c10:	lea    rcx,[rdx+0x30]
   140002c17:	jmp    0x1400019c0
   140002c1c:	lea    rcx,[rdx+0x30]
   140002c23:	jmp    0x140001990
   140002c28:	lea    rcx,[rdx+0x40]
   140002c2f:	jmp    0x140001260
   140002c34:	mov    QWORD PTR [rsp+0x10],rdx
   140002c39:	push   rbp
   140002c3a:	sub    rsp,0x20
   140002c3e:	mov    rbp,rdx
   140002c41:	mov    rdx,QWORD PTR [rbp+0x28]
   140002c45:	mov    rax,QWORD PTR [rdx]
   140002c48:	movsxd rcx,DWORD PTR [rax+0x4]
   140002c4c:	add    rcx,rdx
   140002c4f:	mov    r8b,0x1
   140002c52:	mov    edx,0x4
   140002c57:	call   QWORD PTR [rip+0x403]        # 0x140003060
   140002c5d:	nop
   140002c5e:	movabs rax,0x0
   140002c68:	add    rsp,0x20
   140002c6c:	pop    rbp
   140002c6d:	ret
   140002c6e:	int3
   140002c6f:	int3
   140002c70:	rex push rbp
   140002c72:	sub    rsp,0x20
   140002c76:	mov    rbp,rdx
   140002c79:	mov    rdx,rcx
   140002c7c:	mov    rcx,QWORD PTR [rcx]
   140002c7f:	mov    ecx,DWORD PTR [rcx]
   140002c81:	call   0x140002856
   140002c86:	nop
   140002c87:	add    rsp,0x20
   140002c8b:	pop    rbp
   140002c8c:	ret
   140002c8d:	int3
   140002c8e:	int3
   140002c8f:	int3
   140002c90:	rex push rbp
   140002c92:	mov    rbp,rdx
   140002c95:	mov    rax,QWORD PTR [rcx]
   140002c98:	xor    ecx,ecx
   140002c9a:	cmp    DWORD PTR [rax],0xc0000005
   140002ca0:	sete   cl
   140002ca3:	mov    eax,ecx
   140002ca5:	pop    rbp
   140002ca6:	ret
   140002ca7:	int3
   140002ca8:	int3
   140002ca9:	int3
   140002caa:	int3
   140002cab:	int3
   140002cac:	int3
   140002cad:	int3
   140002cae:	int3
   140002caf:	int3
   140002cb0:	rex push rbx
   140002cb2:	sub    rsp,0x20
   140002cb6:	mov    rbx,QWORD PTR [rip+0x24c3]        # 0x140005180
   140002cbd:	test   rbx,rbx
   140002cc0:	je     0x140002d0b
   140002cc2:	mov    rax,QWORD PTR [rbx]
   140002cc5:	mov    rcx,QWORD PTR [rbx+0x8]
   140002cc9:	mov    QWORD PTR [rip+0x24b0],rax        # 0x140005180
   140002cd0:	mov    rax,QWORD PTR [rcx]
   140002cd3:	mov    rax,QWORD PTR [rax+0x10]
   140002cd7:	call   QWORD PTR [rip+0x59b]        # 0x140003278
   140002cdd:	mov    rcx,rax
   140002ce0:	test   rax,rax
   140002ce3:	je     0x140002cf6
   140002ce5:	mov    rdx,QWORD PTR [rax]
   140002ce8:	mov    rax,QWORD PTR [rdx]
   140002ceb:	mov    edx,0x1
   140002cf0:	call   QWORD PTR [rip+0x582]        # 0x140003278
   140002cf6:	mov    rcx,rbx
   140002cf9:	call   QWORD PTR [rip+0x461]        # 0x140003160
   140002cff:	mov    rbx,QWORD PTR [rip+0x247a]        # 0x140005180
   140002d06:	test   rbx,rbx
   140002d09:	jne    0x140002cc2
   140002d0b:	add    rsp,0x20
   140002d0f:	pop    rbx
   140002d10:	ret
