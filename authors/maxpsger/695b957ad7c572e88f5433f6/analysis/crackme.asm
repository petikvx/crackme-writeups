
crackme.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	lea    rcx,[rip+0x1a81]        # 0x140002a88
   140001007:	jmp    0x1400021d4
   14000100c:	int3
   14000100d:	int3
   14000100e:	int3
   14000100f:	int3
   140001010:	rex push rbx
   140001012:	sub    rsp,0x20
   140001016:	mov    rbx,rcx
   140001019:	mov    rax,rdx
   14000101c:	lea    rcx,[rip+0x2315]        # 0x140003338
   140001023:	xorps  xmm0,xmm0
   140001026:	lea    rdx,[rbx+0x8]
   14000102a:	mov    QWORD PTR [rbx],rcx
   14000102d:	lea    rcx,[rax+0x8]
   140001031:	movups XMMWORD PTR [rdx],xmm0
   140001034:	call   QWORD PTR [rip+0x20e6]        # 0x140003120
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
   140001054:	lea    rax,[rip+0x232d]        # 0x140003388
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
   14000107a:	lea    rax,[rip+0x22b7]        # 0x140003338
   140001081:	mov    rdi,rcx
   140001084:	mov    QWORD PTR [rcx],rax
   140001087:	mov    ebx,edx
   140001089:	add    rcx,0x8
   14000108d:	call   QWORD PTR [rip+0x207d]        # 0x140003110
   140001093:	test   bl,0x1
   140001096:	je     0x1400010a5
   140001098:	mov    edx,0x18
   14000109d:	mov    rcx,rdi
   1400010a0:	call   0x140001d04
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
   1400010c0:	lea    rax,[rip+0x2271]        # 0x140003338
   1400010c7:	mov    QWORD PTR [rcx],rax
   1400010ca:	add    rcx,0x8
   1400010ce:	rex.W jmp QWORD PTR [rip+0x203b]        # 0x140003110
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
   1400010e0:	lea    rax,[rip+0x22b9]        # 0x1400033a0
   1400010e7:	mov    QWORD PTR [rcx+0x10],0x0
   1400010ef:	mov    QWORD PTR [rcx+0x8],rax
   1400010f3:	lea    rax,[rip+0x227e]        # 0x140003378
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
   14000111e:	lea    rdx,[rip+0x2fc3]        # 0x1400040e8
   140001125:	lea    rcx,[rsp+0x20]
   14000112a:	call   0x140002762
   14000112f:	int3
   140001130:	rex push rbx
   140001132:	sub    rsp,0x20
   140001136:	mov    rbx,rcx
   140001139:	mov    rax,rdx
   14000113c:	lea    rcx,[rip+0x21f5]        # 0x140003338
   140001143:	xorps  xmm0,xmm0
   140001146:	lea    rdx,[rbx+0x8]
   14000114a:	mov    QWORD PTR [rbx],rcx
   14000114d:	lea    rcx,[rax+0x8]
   140001151:	movups XMMWORD PTR [rdx],xmm0
   140001154:	call   QWORD PTR [rip+0x1fc6]        # 0x140003120
   14000115a:	lea    rax,[rip+0x2217]        # 0x140003378
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
   14000117c:	lea    rcx,[rip+0x21b5]        # 0x140003338
   140001183:	xorps  xmm0,xmm0
   140001186:	lea    rdx,[rbx+0x8]
   14000118a:	mov    QWORD PTR [rbx],rcx
   14000118d:	lea    rcx,[rax+0x8]
   140001191:	movups XMMWORD PTR [rdx],xmm0
   140001194:	call   QWORD PTR [rip+0x1f86]        # 0x140003120
   14000119a:	lea    rax,[rip+0x21af]        # 0x140003350
   1400011a1:	mov    QWORD PTR [rbx],rax
   1400011a4:	mov    rax,rbx
   1400011a7:	add    rsp,0x20
   1400011ab:	pop    rbx
   1400011ac:	ret
   1400011ad:	int3
   1400011ae:	int3
   1400011af:	int3
   1400011b0:	sub    rsp,0x28
   1400011b4:	lea    rcx,[rip+0x21fd]        # 0x1400033b8
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
   1400011d0:	lea    rax,[rip+0x21f1]        # 0x1400033c8
   1400011d7:	mov    QWORD PTR [rcx+0x10],0x0
   1400011df:	mov    QWORD PTR [rcx+0x8],rax
   1400011e3:	lea    rax,[rip+0x228e]        # 0x140003478
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
   14000120e:	lea    rdx,[rip+0x2e13]        # 0x140004028
   140001215:	lea    rcx,[rsp+0x20]
   14000121a:	call   0x140002762
   14000121f:	int3
   140001220:	rex push rbx
   140001222:	sub    rsp,0x20
   140001226:	mov    rbx,rcx
   140001229:	mov    rax,rdx
   14000122c:	lea    rcx,[rip+0x2105]        # 0x140003338
   140001233:	xorps  xmm0,xmm0
   140001236:	lea    rdx,[rbx+0x8]
   14000123a:	mov    QWORD PTR [rbx],rcx
   14000123d:	lea    rcx,[rax+0x8]
   140001241:	movups XMMWORD PTR [rdx],xmm0
   140001244:	call   QWORD PTR [rip+0x1ed6]        # 0x140003120
   14000124a:	lea    rax,[rip+0x2227]        # 0x140003478
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
   1400012ab:	movups XMMWORD PTR [rsp+0x20],xmm0
   1400012b0:	xor    eax,eax
   1400012b2:	mov    QWORD PTR [rsp+0x30],rax
   1400012b7:	mov    QWORD PTR [rsp+0x38],0xf
   1400012c0:	mov    BYTE PTR [rsp+0x20],al
   1400012c4:	movups XMMWORD PTR [rsp+0x40],xmm0
   1400012c9:	mov    QWORD PTR [rsp+0x50],rax
   1400012ce:	mov    QWORD PTR [rsp+0x58],0xf
   1400012d7:	mov    BYTE PTR [rsp+0x40],al
   1400012db:	lea    rdx,[rip+0x20fe]        # 0x1400033e0
   1400012e2:	mov    rcx,QWORD PTR [rip+0x1def]        # 0x1400030d8
   1400012e9:	call   0x1400015a0
   1400012ee:	lea    rdx,[rsp+0x20]
   1400012f3:	mov    rcx,QWORD PTR [rip+0x1dce]        # 0x1400030c8
   1400012fa:	call   0x140001770
   1400012ff:	lea    rdx,[rip+0x20f2]        # 0x1400033f8
   140001306:	mov    rcx,QWORD PTR [rip+0x1dcb]        # 0x1400030d8
   14000130d:	call   0x1400015a0
   140001312:	lea    rdx,[rsp+0x40]
   140001317:	mov    rcx,QWORD PTR [rip+0x1daa]        # 0x1400030c8
   14000131e:	call   0x140001770
   140001323:	mov    r8,QWORD PTR [rsp+0x30]
   140001328:	mov    rbp,QWORD PTR [rsp+0x38]
   14000132d:	lea    rcx,[rsp+0x20]
   140001332:	mov    rbx,QWORD PTR [rsp+0x20]
   140001337:	cmp    rbp,0xf
   14000133b:	cmova  rcx,rbx
   14000133f:	mov    rsi,QWORD PTR [rsp+0x58]
   140001344:	mov    rdi,QWORD PTR [rsp+0x40]
   140001349:	cmp    r8,0x7
   14000134d:	jne    0x1400013b9
   14000134f:	lea    rdx,[rip+0x20ba]        # 0x140003410
   140001356:	call   0x1400028f3
   14000135b:	test   eax,eax
   14000135d:	jne    0x1400013b9
   14000135f:	mov    r8,QWORD PTR [rsp+0x50]
   140001364:	lea    rcx,[rsp+0x40]
   140001369:	cmp    rsi,0xf
   14000136d:	cmova  rcx,rdi
   140001371:	cmp    r8,0x8
   140001375:	jne    0x1400013b9
   140001377:	lea    rdx,[rip+0x209a]        # 0x140003418
   14000137e:	call   0x1400028f3
   140001383:	test   eax,eax
   140001385:	jne    0x1400013b9
   140001387:	lea    rdx,[rip+0x209a]        # 0x140003428
   14000138e:	mov    rcx,QWORD PTR [rip+0x1d43]        # 0x1400030d8
   140001395:	call   0x1400015a0
   14000139a:	lea    rdx,[rip+0x5cf]        # 0x140001970
   1400013a1:	mov    rcx,rax
   1400013a4:	call   QWORD PTR [rip+0x1cee]        # 0x140003098
   1400013aa:	lea    rcx,[rip+0x2087]        # 0x140003438
   1400013b1:	call   QWORD PTR [rip+0x1e01]        # 0x1400031b8
   1400013b7:	jmp    0x1400013dd
   1400013b9:	lea    rdx,[rip+0x2014]        # 0x1400033d4
   1400013c0:	mov    rcx,QWORD PTR [rip+0x1d11]        # 0x1400030d8
   1400013c7:	call   0x1400015a0
   1400013cc:	lea    rdx,[rip+0x59d]        # 0x140001970
   1400013d3:	mov    rcx,rax
   1400013d6:	call   QWORD PTR [rip+0x1cbc]        # 0x140003098
   1400013dc:	nop
   1400013dd:	cmp    rsi,0xf
   1400013e1:	jbe    0x140001417
   1400013e3:	lea    rdx,[rsi+0x1]
   1400013e7:	cmp    rdx,0x1000
   1400013ee:	jb     0x14000140e
   1400013f0:	mov    rcx,QWORD PTR [rdi-0x8]
   1400013f4:	sub    rdi,rcx
   1400013f7:	sub    rdi,0x8
   1400013fb:	cmp    rdi,0x1f
   1400013ff:	ja     0x140001407
   140001401:	add    rdx,0x27
   140001405:	jmp    0x140001411
   140001407:	mov    ecx,0x5
   14000140c:	int    0x29
   14000140e:	mov    rcx,rdi
   140001411:	call   0x140001d04
   140001416:	nop
   140001417:	cmp    rbp,0xf
   14000141b:	jbe    0x140001450
   14000141d:	lea    rdx,[rbp+0x1]
   140001421:	cmp    rdx,0x1000
   140001428:	jb     0x140001448
   14000142a:	mov    rcx,QWORD PTR [rbx-0x8]
   14000142e:	sub    rbx,rcx
   140001431:	sub    rbx,0x8
   140001435:	cmp    rbx,0x1f
   140001439:	ja     0x140001441
   14000143b:	add    rdx,0x27
   14000143f:	jmp    0x14000144b
   140001441:	mov    ecx,0x5
   140001446:	int    0x29
   140001448:	mov    rcx,rbx
   14000144b:	call   0x140001d04
   140001450:	xor    eax,eax
   140001452:	mov    rcx,QWORD PTR [rsp+0x60]
   140001457:	xor    rcx,rsp
   14000145a:	call   0x140001ca0
   14000145f:	add    rsp,0x78
   140001463:	pop    rdi
   140001464:	pop    rsi
   140001465:	pop    rbp
   140001466:	pop    rbx
   140001467:	ret
   140001468:	int3
   140001469:	int3
   14000146a:	int3
   14000146b:	int3
   14000146c:	int3
   14000146d:	int3
   14000146e:	int3
   14000146f:	int3
   140001470:	rex push rbx
   140001472:	push   rbp
   140001473:	push   rsi
   140001474:	push   rdi
   140001475:	sub    rsp,0x48
   140001479:	mov    rax,QWORD PTR [rip+0x3bc0]        # 0x140005040
   140001480:	xor    rax,rsp
   140001483:	mov    QWORD PTR [rsp+0x38],rax
   140001488:	mov    rbp,rcx
   14000148b:	xor    edx,edx
   14000148d:	lea    rcx,[rsp+0x28]
   140001492:	call   QWORD PTR [rip+0x1c50]        # 0x1400030e8
   140001498:	nop
   140001499:	mov    rax,QWORD PTR [rip+0x3d70]        # 0x140005210
   1400014a0:	mov    QWORD PTR [rsp+0x20],rax
   1400014a5:	mov    rbx,QWORD PTR [rip+0x1bd4]        # 0x140003080
   1400014ac:	cmp    QWORD PTR [rbx],0x0
   1400014b0:	jne    0x1400014df
   1400014b2:	xor    edx,edx
   1400014b4:	lea    rcx,[rsp+0x30]
   1400014b9:	call   QWORD PTR [rip+0x1c29]        # 0x1400030e8
   1400014bf:	cmp    QWORD PTR [rbx],0x0
   1400014c3:	jne    0x1400014d4
   1400014c5:	mov    rax,QWORD PTR [rip+0x1bf4]        # 0x1400030c0
   1400014cc:	inc    DWORD PTR [rax]
   1400014ce:	movsxd rax,DWORD PTR [rax]
   1400014d1:	mov    QWORD PTR [rbx],rax
   1400014d4:	lea    rcx,[rsp+0x30]
   1400014d9:	call   QWORD PTR [rip+0x1c19]        # 0x1400030f8
   1400014df:	mov    rsi,QWORD PTR [rbx]
   1400014e2:	mov    rcx,QWORD PTR [rbp+0x8]
   1400014e6:	lea    rdi,[rsi*8+0x0]
   1400014ee:	cmp    rsi,QWORD PTR [rcx+0x18]
   1400014f2:	jae    0x140001503
   1400014f4:	mov    rax,QWORD PTR [rcx+0x10]
   1400014f8:	mov    rbx,QWORD PTR [rdi+rax*1]
   1400014fc:	test   rbx,rbx
   1400014ff:	jne    0x140001569
   140001501:	jmp    0x140001505
   140001503:	xor    ebx,ebx
   140001505:	cmp    BYTE PTR [rcx+0x24],0x0
   140001509:	je     0x14000151f
   14000150b:	call   QWORD PTR [rip+0x1bbf]        # 0x1400030d0
   140001511:	cmp    rsi,QWORD PTR [rax+0x18]
   140001515:	jae    0x140001524
   140001517:	mov    rax,QWORD PTR [rax+0x10]
   14000151b:	mov    rbx,QWORD PTR [rdi+rax*1]
   14000151f:	test   rbx,rbx
   140001522:	jne    0x140001569
   140001524:	mov    rbx,QWORD PTR [rsp+0x20]
   140001529:	test   rbx,rbx
   14000152c:	jne    0x140001569
   14000152e:	mov    rdx,rbp
   140001531:	lea    rcx,[rsp+0x20]
   140001536:	call   QWORD PTR [rip+0x1b74]        # 0x1400030b0
   14000153c:	cmp    rax,0xffffffffffffffff
   140001540:	je     0x14000158d
   140001542:	mov    rbx,QWORD PTR [rsp+0x20]
   140001547:	mov    QWORD PTR [rsp+0x30],rbx
   14000154c:	mov    rcx,rbx
   14000154f:	call   0x140001c4c
   140001554:	mov    rax,QWORD PTR [rbx]
   140001557:	mov    rcx,rbx
   14000155a:	call   QWORD PTR [rax+0x8]
   14000155d:	mov    rbx,QWORD PTR [rsp+0x20]
   140001562:	mov    QWORD PTR [rip+0x3ca7],rbx        # 0x140005210
   140001569:	lea    rcx,[rsp+0x28]
   14000156e:	call   QWORD PTR [rip+0x1b84]        # 0x1400030f8
   140001574:	mov    rax,rbx
   140001577:	mov    rcx,QWORD PTR [rsp+0x38]
   14000157c:	xor    rcx,rsp
   14000157f:	call   0x140001ca0
   140001584:	add    rsp,0x48
   140001588:	pop    rdi
   140001589:	pop    rsi
   14000158a:	pop    rbp
   14000158b:	pop    rbx
   14000158c:	ret
   14000158d:	call   0x140001200
   140001592:	nop
   140001593:	int3
   140001594:	int3
   140001595:	int3
   140001596:	int3
   140001597:	int3
   140001598:	int3
   140001599:	int3
   14000159a:	int3
   14000159b:	int3
   14000159c:	int3
   14000159d:	int3
   14000159e:	int3
   14000159f:	int3
   1400015a0:	mov    QWORD PTR [rsp+0x10],rbx
   1400015a5:	mov    QWORD PTR [rsp+0x8],rcx
   1400015aa:	push   rsi
   1400015ab:	push   rdi
   1400015ac:	push   r12
   1400015ae:	push   r14
   1400015b0:	push   r15
   1400015b2:	sub    rsp,0x30
   1400015b6:	mov    r12,rdx
   1400015b9:	mov    rsi,rcx
   1400015bc:	xor    ebx,ebx
   1400015be:	mov    DWORD PTR [rsp+0x70],ebx
   1400015c2:	mov    rcx,rdx
   1400015c5:	call   0x1400028ff
   1400015ca:	mov    r15,rax
   1400015cd:	mov    r8,QWORD PTR [rsi]
   1400015d0:	movsxd r9,DWORD PTR [r8+0x4]
   1400015d4:	mov    rdi,QWORD PTR [r9+rsi*1+0x28]
   1400015d9:	test   rdi,rdi
   1400015dc:	jle    0x1400015e8
   1400015de:	cmp    rdi,rax
   1400015e1:	jle    0x1400015e8
   1400015e3:	sub    rdi,rax
   1400015e6:	jmp    0x1400015ea
   1400015e8:	xor    edi,edi
   1400015ea:	mov    r14,rsi
   1400015ed:	mov    QWORD PTR [rsp+0x20],rsi
   1400015f2:	mov    rcx,QWORD PTR [r9+rsi*1+0x48]
   1400015f7:	test   rcx,rcx
   1400015fa:	je     0x140001603
   1400015fc:	mov    rax,QWORD PTR [rcx]
   1400015ff:	call   QWORD PTR [rax+0x8]
   140001602:	nop
   140001603:	mov    rax,QWORD PTR [rsi]
   140001606:	movsxd rcx,DWORD PTR [rax+0x4]
   14000160a:	add    rcx,rsi
   14000160d:	call   QWORD PTR [rip+0x1a95]        # 0x1400030a8
   140001613:	test   al,al
   140001615:	jne    0x14000161d
   140001617:	mov    BYTE PTR [rsp+0x28],al
   14000161b:	jmp    0x140001656
   14000161d:	mov    rax,QWORD PTR [rsi]
   140001620:	movsxd rcx,DWORD PTR [rax+0x4]
   140001624:	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   140001629:	test   rcx,rcx
   14000162c:	je     0x14000164f
   14000162e:	cmp    rcx,rsi
   140001631:	je     0x14000164f
   140001633:	call   QWORD PTR [rip+0x1a57]        # 0x140003090
   140001639:	mov    rax,QWORD PTR [rsi]
   14000163c:	movsxd rcx,DWORD PTR [rax+0x4]
   140001640:	add    rcx,rsi
   140001643:	call   QWORD PTR [rip+0x1a5f]        # 0x1400030a8
   140001649:	mov    BYTE PTR [rsp+0x28],al
   14000164d:	jmp    0x140001656
   14000164f:	mov    BYTE PTR [rsp+0x28],0x1
   140001654:	mov    al,0x1
   140001656:	test   al,al
   140001658:	jne    0x140001664
   14000165a:	mov    ebx,0x4
   14000165f:	jmp    0x140001712
   140001664:	mov    rdx,QWORD PTR [rsi]
   140001667:	movsxd rax,DWORD PTR [rdx+0x4]
   14000166b:	mov    ecx,DWORD PTR [rax+rsi*1+0x18]
   14000166f:	and    ecx,0x1c0
   140001675:	cmp    ecx,0x40
   140001678:	je     0x1400016a9
   14000167a:	nop    WORD PTR [rax+rax*1+0x0]
   140001680:	test   rdi,rdi
   140001683:	jle    0x1400016a6
   140001685:	mov    rax,QWORD PTR [rsi]
   140001688:	movsxd rcx,DWORD PTR [rax+0x4]
   14000168c:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001691:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001696:	call   QWORD PTR [rip+0x19dc]        # 0x140003078
   14000169c:	cmp    eax,0xffffffff
   14000169f:	je     0x1400016e9
   1400016a1:	dec    rdi
   1400016a4:	jmp    0x140001680
   1400016a6:	mov    rdx,QWORD PTR [rsi]
   1400016a9:	movsxd rcx,DWORD PTR [rdx+0x4]
   1400016ad:	mov    r8,r15
   1400016b0:	mov    rdx,r12
   1400016b3:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400016b8:	call   QWORD PTR [rip+0x1a32]        # 0x1400030f0
   1400016be:	cmp    rax,r15
   1400016c1:	jne    0x1400016e9
   1400016c3:	test   rdi,rdi
   1400016c6:	jle    0x1400016f2
   1400016c8:	mov    rax,QWORD PTR [rsi]
   1400016cb:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016cf:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   1400016d4:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400016d9:	call   QWORD PTR [rip+0x1999]        # 0x140003078
   1400016df:	cmp    eax,0xffffffff
   1400016e2:	je     0x1400016e9
   1400016e4:	dec    rdi
   1400016e7:	jmp    0x1400016c3
   1400016e9:	mov    ebx,0x4
   1400016ee:	mov    DWORD PTR [rsp+0x70],ebx
   1400016f2:	mov    rax,QWORD PTR [rsi]
   1400016f5:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016f9:	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   140001702:	jmp    0x140001712
   140001704:	mov    rsi,QWORD PTR [rsp+0x60]
   140001709:	mov    ebx,DWORD PTR [rsp+0x70]
   14000170d:	mov    r14,QWORD PTR [rsp+0x20]
   140001712:	mov    rax,QWORD PTR [rsi]
   140001715:	movsxd rcx,DWORD PTR [rax+0x4]
   140001719:	add    rcx,rsi
   14000171c:	xor    r8d,r8d
   14000171f:	mov    edx,ebx
   140001721:	call   QWORD PTR [rip+0x1931]        # 0x140003058
   140001727:	nop
   140001728:	call   QWORD PTR [rip+0x19b2]        # 0x1400030e0
   14000172e:	test   eax,eax
   140001730:	jne    0x14000173c
   140001732:	mov    rcx,r14
   140001735:	call   QWORD PTR [rip+0x1915]        # 0x140003050
   14000173b:	nop
   14000173c:	mov    rax,QWORD PTR [r14]
   14000173f:	movsxd rcx,DWORD PTR [rax+0x4]
   140001743:	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   140001748:	test   rcx,rcx
   14000174b:	je     0x140001754
   14000174d:	mov    rax,QWORD PTR [rcx]
   140001750:	call   QWORD PTR [rax+0x10]
   140001753:	nop
   140001754:	mov    rax,rsi
   140001757:	mov    rbx,QWORD PTR [rsp+0x68]
   14000175c:	add    rsp,0x30
   140001760:	pop    r15
   140001762:	pop    r14
   140001764:	pop    r12
   140001766:	pop    rdi
   140001767:	pop    rsi
   140001768:	ret
   140001769:	int3
   14000176a:	int3
   14000176b:	int3
   14000176c:	int3
   14000176d:	int3
   14000176e:	int3
   14000176f:	int3
   140001770:	mov    QWORD PTR [rsp+0x18],rbx
   140001775:	mov    QWORD PTR [rsp+0x20],rsi
   14000177a:	push   rdi
   14000177b:	push   r12
   14000177d:	push   r13
   14000177f:	push   r14
   140001781:	push   r15
   140001783:	sub    rsp,0x50
   140001787:	mov    rbx,rdx
   14000178a:	mov    rdi,rcx
   14000178d:	mov    QWORD PTR [rsp+0x28],rcx
   140001792:	xor    esi,esi
   140001794:	mov    DWORD PTR [rsp+0x24],esi
   140001798:	xor    r15b,r15b
   14000179b:	mov    BYTE PTR [rsp+0x20],r15b
   1400017a0:	mov    r12,rcx
   1400017a3:	mov    QWORD PTR [rsp+0x30],rcx
   1400017a8:	mov    rax,QWORD PTR [rcx]
   1400017ab:	movsxd rcx,DWORD PTR [rax+0x4]
   1400017af:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   1400017b4:	test   rcx,rcx
   1400017b7:	je     0x1400017c0
   1400017b9:	mov    rax,QWORD PTR [rcx]
   1400017bc:	call   QWORD PTR [rax+0x8]
   1400017bf:	nop
   1400017c0:	xor    edx,edx
   1400017c2:	mov    rcx,rdi
   1400017c5:	call   QWORD PTR [rip+0x187d]        # 0x140003048
   1400017cb:	mov    BYTE PTR [rsp+0x38],al
   1400017cf:	test   al,al
   1400017d1:	je     0x1400018fe
   1400017d7:	mov    rax,QWORD PTR [rdi]
   1400017da:	movsxd rcx,DWORD PTR [rax+0x4]
   1400017de:	add    rcx,rdi
   1400017e1:	lea    rdx,[rsp+0x40]
   1400017e6:	call   QWORD PTR [rip+0x18b4]        # 0x1400030a0
   1400017ec:	nop
   1400017ed:	mov    rcx,rax
   1400017f0:	call   0x140001470
   1400017f5:	mov    r13,rax
   1400017f8:	mov    rcx,QWORD PTR [rsp+0x48]
   1400017fd:	test   rcx,rcx
   140001800:	je     0x14000181a
   140001802:	mov    rax,QWORD PTR [rcx]
   140001805:	call   QWORD PTR [rax+0x10]
   140001808:	mov    rcx,rax
   14000180b:	test   rax,rax
   14000180e:	je     0x14000181a
   140001810:	mov    rax,QWORD PTR [rax]
   140001813:	mov    edx,0x1
   140001818:	call   QWORD PTR [rax]
   14000181a:	mov    QWORD PTR [rbx+0x10],0x0
   140001822:	cmp    QWORD PTR [rbx+0x18],0xf
   140001827:	jbe    0x14000182e
   140001829:	mov    rax,QWORD PTR [rbx]
   14000182c:	jmp    0x140001831
   14000182e:	mov    rax,rbx
   140001831:	mov    BYTE PTR [rax],0x0
   140001834:	mov    rax,QWORD PTR [rdi]
   140001837:	movsxd rcx,DWORD PTR [rax+0x4]
   14000183b:	mov    r14,QWORD PTR [rcx+rdi*1+0x28]
   140001840:	movabs rax,0x7fffffffffffffff
   14000184a:	test   r14,r14
   14000184d:	jle    0x140001854
   14000184f:	cmp    r14,rax
   140001852:	jb     0x140001857
   140001854:	mov    r14,rax
   140001857:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   14000185c:	call   QWORD PTR [rip+0x1806]        # 0x140003068
   140001862:	test   r14,r14
   140001865:	je     0x140001875
   140001867:	cmp    eax,0xffffffff
   14000186a:	jne    0x14000187a
   14000186c:	mov    esi,0x1
   140001871:	mov    DWORD PTR [rsp+0x24],esi
   140001875:	jmp    0x1400018fe
   14000187a:	movzx  r9d,al
   14000187e:	mov    rax,QWORD PTR [r13+0x18]
   140001882:	test   BYTE PTR [rax+r9*2],0x48
   140001887:	jne    0x140001875
   140001889:	mov    rcx,QWORD PTR [rbx+0x10]
   14000188d:	mov    rdx,QWORD PTR [rbx+0x18]
   140001891:	cmp    rcx,rdx
   140001894:	jae    0x1400018c0
   140001896:	lea    rax,[rcx+0x1]
   14000189a:	mov    QWORD PTR [rbx+0x10],rax
   14000189e:	cmp    rdx,0xf
   1400018a2:	jbe    0x1400018b2
   1400018a4:	mov    rax,QWORD PTR [rbx]
   1400018a7:	mov    BYTE PTR [rcx+rax*1],r9b
   1400018ab:	mov    BYTE PTR [rcx+rax*1+0x1],0x0
   1400018b0:	jmp    0x1400018c8
   1400018b2:	mov    rax,rbx
   1400018b5:	mov    BYTE PTR [rcx+rbx*1],r9b
   1400018b9:	mov    BYTE PTR [rcx+rbx*1+0x1],0x0
   1400018be:	jmp    0x1400018c8
   1400018c0:	mov    rcx,rbx
   1400018c3:	call   0x140001ae0
   1400018c8:	mov    r15b,0x1
   1400018cb:	mov    BYTE PTR [rsp+0x20],r15b
   1400018d0:	dec    r14
   1400018d3:	mov    rax,QWORD PTR [rdi]
   1400018d6:	movsxd rcx,DWORD PTR [rax+0x4]
   1400018da:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400018df:	call   QWORD PTR [rip+0x178b]        # 0x140003070
   1400018e5:	jmp    0x140001862
   1400018ea:	mov    esi,DWORD PTR [rsp+0x24]
   1400018ee:	movzx  r15d,BYTE PTR [rsp+0x20]
   1400018f4:	mov    r12,QWORD PTR [rsp+0x30]
   1400018f9:	mov    rdi,QWORD PTR [rsp+0x28]
   1400018fe:	mov    rax,QWORD PTR [rdi]
   140001901:	movsxd rcx,DWORD PTR [rax+0x4]
   140001905:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   14000190e:	test   r15b,r15b
   140001911:	jne    0x140001916
   140001913:	or     esi,0x2
   140001916:	mov    rax,QWORD PTR [rdi]
   140001919:	movsxd rcx,DWORD PTR [rax+0x4]
   14000191d:	add    rcx,rdi
   140001920:	xor    r8d,r8d
   140001923:	mov    edx,esi
   140001925:	call   QWORD PTR [rip+0x172d]        # 0x140003058
   14000192b:	nop
   14000192c:	mov    rcx,QWORD PTR [r12]
   140001930:	movsxd rdx,DWORD PTR [rcx+0x4]
   140001934:	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   140001939:	test   rcx,rcx
   14000193c:	je     0x140001945
   14000193e:	mov    rdx,QWORD PTR [rcx]
   140001941:	call   QWORD PTR [rdx+0x10]
   140001944:	nop
   140001945:	mov    rax,rdi
   140001948:	lea    r11,[rsp+0x50]
   14000194d:	mov    rbx,QWORD PTR [r11+0x40]
   140001951:	mov    rsi,QWORD PTR [r11+0x48]
   140001955:	mov    rsp,r11
   140001958:	pop    r15
   14000195a:	pop    r14
   14000195c:	pop    r13
   14000195e:	pop    r12
   140001960:	pop    rdi
   140001961:	ret
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
   140001970:	rex push rbx
   140001972:	sub    rsp,0x20
   140001976:	mov    rax,QWORD PTR [rcx]
   140001979:	mov    rbx,rcx
   14000197c:	mov    dl,0xa
   14000197e:	movsxd rcx,DWORD PTR [rax+0x4]
   140001982:	add    rcx,rbx
   140001985:	call   QWORD PTR [rip+0x16d5]        # 0x140003060
   14000198b:	movzx  edx,al
   14000198e:	mov    rcx,rbx
   140001991:	call   QWORD PTR [rip+0x16f1]        # 0x140003088
   140001997:	mov    rcx,rbx
   14000199a:	call   QWORD PTR [rip+0x16f0]        # 0x140003090
   1400019a0:	mov    rax,rbx
   1400019a3:	add    rsp,0x20
   1400019a7:	pop    rbx
   1400019a8:	ret
   1400019a9:	int3
   1400019aa:	int3
   1400019ab:	int3
   1400019ac:	int3
   1400019ad:	int3
   1400019ae:	int3
   1400019af:	int3
   1400019b0:	rex push rbx
   1400019b2:	sub    rsp,0x20
   1400019b6:	mov    rdx,QWORD PTR [rcx+0x18]
   1400019ba:	mov    rbx,rcx
   1400019bd:	cmp    rdx,0xf
   1400019c1:	jbe    0x1400019f8
   1400019c3:	mov    rax,QWORD PTR [rcx]
   1400019c6:	inc    rdx
   1400019c9:	cmp    rdx,0x1000
   1400019d0:	jb     0x1400019f0
   1400019d2:	mov    rcx,QWORD PTR [rax-0x8]
   1400019d6:	sub    rax,rcx
   1400019d9:	sub    rax,0x8
   1400019dd:	cmp    rax,0x1f
   1400019e1:	ja     0x1400019e9
   1400019e3:	add    rdx,0x27
   1400019e7:	jmp    0x1400019f3
   1400019e9:	mov    ecx,0x5
   1400019ee:	int    0x29
   1400019f0:	mov    rcx,rax
   1400019f3:	call   0x140001d04
   1400019f8:	mov    QWORD PTR [rbx+0x10],0x0
   140001a00:	mov    QWORD PTR [rbx+0x18],0xf
   140001a08:	mov    BYTE PTR [rbx],0x0
   140001a0b:	add    rsp,0x20
   140001a0f:	pop    rbx
   140001a10:	ret
   140001a11:	int3
   140001a12:	int3
   140001a13:	int3
   140001a14:	int3
   140001a15:	int3
   140001a16:	int3
   140001a17:	int3
   140001a18:	int3
   140001a19:	int3
   140001a1a:	int3
   140001a1b:	int3
   140001a1c:	int3
   140001a1d:	int3
   140001a1e:	int3
   140001a1f:	int3
   140001a20:	sub    rsp,0x28
   140001a24:	mov    rdx,QWORD PTR [rcx]
   140001a27:	mov    rax,QWORD PTR [rdx]
   140001a2a:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a2e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a33:	test   rcx,rcx
   140001a36:	je     0x140001a3f
   140001a38:	mov    rax,QWORD PTR [rcx]
   140001a3b:	call   QWORD PTR [rax+0x10]
   140001a3e:	nop
   140001a3f:	add    rsp,0x28
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
   140001a50:	sub    rsp,0x28
   140001a54:	mov    rdx,QWORD PTR [rcx]
   140001a57:	mov    rax,QWORD PTR [rdx]
   140001a5a:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a5e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a63:	test   rcx,rcx
   140001a66:	je     0x140001a6f
   140001a68:	mov    rax,QWORD PTR [rcx]
   140001a6b:	call   QWORD PTR [rax+0x10]
   140001a6e:	nop
   140001a6f:	add    rsp,0x28
   140001a73:	ret
   140001a74:	int3
   140001a75:	int3
   140001a76:	int3
   140001a77:	int3
   140001a78:	int3
   140001a79:	int3
   140001a7a:	int3
   140001a7b:	int3
   140001a7c:	int3
   140001a7d:	int3
   140001a7e:	int3
   140001a7f:	int3
   140001a80:	rex push rbx
   140001a82:	sub    rsp,0x20
   140001a86:	mov    rbx,rcx
   140001a89:	call   QWORD PTR [rip+0x1651]        # 0x1400030e0
   140001a8f:	test   eax,eax
   140001a91:	jne    0x140001a9d
   140001a93:	mov    rcx,QWORD PTR [rbx]
   140001a96:	call   QWORD PTR [rip+0x15b4]        # 0x140003050
   140001a9c:	nop
   140001a9d:	mov    rdx,QWORD PTR [rbx]
   140001aa0:	mov    rax,QWORD PTR [rdx]
   140001aa3:	movsxd rcx,DWORD PTR [rax+0x4]
   140001aa7:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001aac:	test   rcx,rcx
   140001aaf:	je     0x140001ab8
   140001ab1:	mov    rax,QWORD PTR [rcx]
   140001ab4:	call   QWORD PTR [rax+0x10]
   140001ab7:	nop
   140001ab8:	add    rsp,0x20
   140001abc:	pop    rbx
   140001abd:	ret
   140001abe:	int3
   140001abf:	int3
   140001ac0:	mov    rcx,QWORD PTR [rcx]
   140001ac3:	test   rcx,rcx
   140001ac6:	je     0x140001ad3
   140001ac8:	mov    rax,QWORD PTR [rcx]
   140001acb:	mov    edx,0x1
   140001ad0:	rex.W jmp QWORD PTR [rax]
   140001ad3:	ret
   140001ad4:	int3
   140001ad5:	int3
   140001ad6:	int3
   140001ad7:	int3
   140001ad8:	int3
   140001ad9:	int3
   140001ada:	int3
   140001adb:	int3
   140001adc:	int3
   140001add:	int3
   140001ade:	int3
   140001adf:	int3
   140001ae0:	rex push rbx
   140001ae2:	push   rsi
   140001ae3:	push   r12
   140001ae5:	push   r14
   140001ae7:	sub    rsp,0x28
   140001aeb:	mov    r14,QWORD PTR [rcx+0x10]
   140001aef:	movabs rbx,0x7fffffffffffffff
   140001af9:	mov    rax,rbx
   140001afc:	movzx  r12d,r9b
   140001b00:	sub    rax,r14
   140001b03:	mov    rsi,rcx
   140001b06:	cmp    rax,0x1
   140001b0a:	jb     0x140001c38
   140001b10:	mov    QWORD PTR [rsp+0x58],rbp
   140001b15:	lea    rbp,[r14+0x1]
   140001b19:	mov    QWORD PTR [rsp+0x60],rdi
   140001b1e:	mov    QWORD PTR [rsp+0x20],r15
   140001b23:	mov    r15,QWORD PTR [rcx+0x18]
   140001b27:	mov    rcx,rbp
   140001b2a:	or     rcx,0xf
   140001b2e:	cmp    rcx,rbx
   140001b31:	ja     0x140001b76
   140001b33:	mov    rdx,r15
   140001b36:	mov    rax,rbx
   140001b39:	shr    rdx,1
   140001b3c:	sub    rax,rdx
   140001b3f:	cmp    r15,rax
   140001b42:	ja     0x140001b76
   140001b44:	lea    rax,[r15+rdx*1]
   140001b48:	mov    rbx,rcx
   140001b4b:	cmp    rcx,rax
   140001b4e:	cmovb  rbx,rax
   140001b52:	lea    rax,[rbx+0x1]
   140001b56:	test   rax,rax
   140001b59:	jne    0x140001b5f
   140001b5b:	xor    edi,edi
   140001b5d:	jmp    0x140001ba3
   140001b5f:	cmp    rax,0x1000
   140001b65:	jb     0x140001b98
   140001b67:	lea    rcx,[rax+0x27]
   140001b6b:	cmp    rcx,rax
   140001b6e:	jbe    0x140001c3e
   140001b74:	jmp    0x140001b80
   140001b76:	movabs rcx,0x8000000000000027
   140001b80:	call   0x140001cc0
   140001b85:	test   rax,rax
   140001b88:	je     0x140001bf5
   140001b8a:	lea    rdi,[rax+0x27]
   140001b8e:	and    rdi,0xffffffffffffffe0
   140001b92:	mov    QWORD PTR [rdi-0x8],rax
   140001b96:	jmp    0x140001ba3
   140001b98:	mov    rcx,rax
   140001b9b:	call   0x140001cc0
   140001ba0:	mov    rdi,rax
   140001ba3:	mov    QWORD PTR [rsi+0x10],rbp
   140001ba7:	mov    r8,r14
   140001baa:	mov    QWORD PTR [rsi+0x18],rbx
   140001bae:	mov    rcx,rdi
   140001bb1:	cmp    r15,0xf
   140001bb5:	jbe    0x140001c06
   140001bb7:	mov    rbx,QWORD PTR [rsi]
   140001bba:	mov    rdx,rbx
   140001bbd:	call   0x1400028f9
   140001bc2:	lea    rdx,[r15+0x1]
   140001bc6:	mov    BYTE PTR [r14+rdi*1],r12b
   140001bca:	mov    BYTE PTR [r14+rdi*1+0x1],0x0
   140001bd0:	cmp    rdx,0x1000
   140001bd7:	jb     0x140001bfc
   140001bd9:	mov    rcx,QWORD PTR [rbx-0x8]
   140001bdd:	sub    rbx,rcx
   140001be0:	sub    rbx,0x8
   140001be4:	cmp    rbx,0x1f
   140001be8:	ja     0x140001bf5
   140001bea:	add    rdx,0x27
   140001bee:	call   0x140001d04
   140001bf3:	jmp    0x140001c18
   140001bf5:	mov    ecx,0x5
   140001bfa:	int    0x29
   140001bfc:	mov    rcx,rbx
   140001bff:	call   0x140001d04
   140001c04:	jmp    0x140001c18
   140001c06:	mov    rdx,rsi
   140001c09:	call   0x1400028f9
   140001c0e:	mov    BYTE PTR [r14+rdi*1],r12b
   140001c12:	mov    BYTE PTR [r14+rdi*1+0x1],0x0
   140001c18:	mov    rax,rsi
   140001c1b:	mov    QWORD PTR [rax],rdi
   140001c1e:	mov    rdi,QWORD PTR [rsp+0x60]
   140001c23:	mov    rbp,QWORD PTR [rsp+0x58]
   140001c28:	mov    r15,QWORD PTR [rsp+0x20]
   140001c2d:	add    rsp,0x28
   140001c31:	pop    r14
   140001c33:	pop    r12
   140001c35:	pop    rsi
   140001c36:	pop    rbx
   140001c37:	ret
   140001c38:	call   0x1400011b0
   140001c3d:	int3
   140001c3e:	call   0x140001110
   140001c43:	int3
   140001c44:	jmp    QWORD PTR [rip+0x14ae]        # 0x1400030f8
   140001c4a:	int3
   140001c4b:	int3
   140001c4c:	rex push rbx
   140001c4e:	sub    rsp,0x20
   140001c52:	mov    rbx,rcx
   140001c55:	mov    ecx,0x10
   140001c5a:	call   QWORD PTR [rip+0x1510]        # 0x140003170
   140001c60:	mov    rdx,rax
   140001c63:	test   rax,rax
   140001c66:	je     0x140001c83
   140001c68:	mov    rax,QWORD PTR [rip+0x3511]        # 0x140005180
   140001c6f:	mov    QWORD PTR [rdx],rax
   140001c72:	mov    QWORD PTR [rdx+0x8],rbx
   140001c76:	mov    QWORD PTR [rip+0x3503],rdx        # 0x140005180
   140001c7d:	add    rsp,0x20
   140001c81:	pop    rbx
   140001c82:	ret
   140001c83:	call   0x140001c89
   140001c88:	int3
   140001c89:	jmp    QWORD PTR [rip+0x1429]        # 0x1400030b8
   140001c8f:	int3
   140001c90:	int3
   140001c91:	int3
   140001c92:	int3
   140001c93:	int3
   140001c94:	int3
   140001c95:	int3
   140001c96:	data16 nop WORD PTR [rax+rax*1+0x0]
   140001ca0:	cmp    rcx,QWORD PTR [rip+0x3399]        # 0x140005040
   140001ca7:	jne    0x140001cb9
   140001ca9:	rol    rcx,0x10
   140001cad:	test   cx,0xffff
   140001cb2:	jne    0x140001cb5
   140001cb4:	ret
   140001cb5:	ror    rcx,0x10
   140001cb9:	jmp    0x1400021f0
   140001cbe:	int3
   140001cbf:	int3
   140001cc0:	rex push rbx
   140001cc2:	sub    rsp,0x20
   140001cc6:	mov    rbx,rcx
   140001cc9:	jmp    0x140001cda
   140001ccb:	mov    rcx,rbx
   140001cce:	call   0x140002780
   140001cd3:	test   eax,eax
   140001cd5:	je     0x140001cea
   140001cd7:	mov    rcx,rbx
   140001cda:	call   0x14000277a
   140001cdf:	test   rax,rax
   140001ce2:	je     0x140001ccb
   140001ce4:	add    rsp,0x20
   140001ce8:	pop    rbx
   140001ce9:	ret
   140001cea:	cmp    rbx,0xffffffffffffffff
   140001cee:	je     0x140001cf6
   140001cf0:	call   0x14000221c
   140001cf5:	int3
   140001cf6:	call   0x140001110
   140001cfb:	int3
   140001cfc:	jmp    0x140002774
   140001d01:	int3
   140001d02:	int3
   140001d03:	int3
   140001d04:	jmp    0x140001cfc
   140001d09:	int3
   140001d0a:	int3
   140001d0b:	int3
   140001d0c:	rex push rbx
   140001d0e:	sub    rsp,0x20
   140001d12:	lea    rax,[rip+0x15ff]        # 0x140003318
   140001d19:	mov    rbx,rcx
   140001d1c:	mov    QWORD PTR [rcx],rax
   140001d1f:	test   dl,0x1
   140001d22:	je     0x140001d2e
   140001d24:	mov    edx,0x18
   140001d29:	call   0x140001d04
   140001d2e:	mov    rax,rbx
   140001d31:	add    rsp,0x20
   140001d35:	pop    rbx
   140001d36:	ret
   140001d37:	int3
   140001d38:	rex push rbx
   140001d3a:	sub    rsp,0x20
   140001d3e:	mov    ecx,0x1
   140001d43:	call   0x14000278c
   140001d48:	call   0x1400022f8
   140001d4d:	mov    ecx,eax
   140001d4f:	call   0x1400027c2
   140001d54:	call   0x1400022ec
   140001d59:	mov    ebx,eax
   140001d5b:	call   0x1400027f2
   140001d60:	mov    ecx,0x1
   140001d65:	mov    DWORD PTR [rax],ebx
   140001d67:	call   0x140002024
   140001d6c:	test   al,al
   140001d6e:	je     0x140001de3
   140001d70:	call   0x14000242c
   140001d75:	lea    rcx,[rip+0x6ec]        # 0x140002468
   140001d7c:	call   0x1400021d4
   140001d81:	call   0x1400022f0
   140001d86:	mov    ecx,eax
   140001d88:	call   0x140002798
   140001d8d:	test   eax,eax
   140001d8f:	jne    0x140001de3
   140001d91:	call   0x140002300
   140001d96:	call   0x140002340
   140001d9b:	test   eax,eax
   140001d9d:	je     0x140001dab
   140001d9f:	lea    rcx,[rip+0x546]        # 0x1400022ec
   140001da6:	call   0x140002792
   140001dab:	call   0x1400021ec
   140001db0:	call   0x1400021ec
   140001db5:	call   0x1400022ec
   140001dba:	mov    ecx,eax
   140001dbc:	call   0x1400027e6
   140001dc1:	call   0x140002310
   140001dc6:	test   al,al
   140001dc8:	je     0x140001dcf
   140001dca:	call   0x14000279e
   140001dcf:	call   0x1400022ec
   140001dd4:	call   0x140002364
   140001dd9:	test   eax,eax
   140001ddb:	jne    0x140001de3
   140001ddd:	add    rsp,0x20
   140001de1:	pop    rbx
   140001de2:	ret
   140001de3:	mov    ecx,0x7
   140001de8:	call   0x14000235c
   140001ded:	int3
   140001dee:	int3
   140001def:	int3
   140001df0:	sub    rsp,0x28
   140001df4:	call   0x140002324
   140001df9:	xor    eax,eax
   140001dfb:	add    rsp,0x28
   140001dff:	ret
   140001e00:	sub    rsp,0x28
   140001e04:	call   0x1400023c0
   140001e09:	call   0x1400022ec
   140001e0e:	mov    ecx,eax
   140001e10:	add    rsp,0x28
   140001e14:	jmp    0x1400027ec
   140001e19:	int3
   140001e1a:	int3
   140001e1b:	int3
   140001e1c:	mov    QWORD PTR [rsp+0x8],rbx
   140001e21:	mov    QWORD PTR [rsp+0x10],rsi
   140001e26:	push   rdi
   140001e27:	sub    rsp,0x30
   140001e2b:	mov    ecx,0x1
   140001e30:	call   0x140001fe8
   140001e35:	test   al,al
   140001e37:	je     0x140001f73
   140001e3d:	xor    sil,sil
   140001e40:	mov    BYTE PTR [rsp+0x20],sil
   140001e45:	call   0x140001fac
   140001e4a:	mov    bl,al
   140001e4c:	mov    ecx,DWORD PTR [rip+0x333e]        # 0x140005190
   140001e52:	cmp    ecx,0x1
   140001e55:	je     0x140001f7e
   140001e5b:	test   ecx,ecx
   140001e5d:	jne    0x140001ea9
   140001e5f:	mov    DWORD PTR [rip+0x3327],0x1        # 0x140005190
   140001e69:	lea    rdx,[rip+0x1478]        # 0x1400032e8
   140001e70:	lea    rcx,[rip+0x1459]        # 0x1400032d0
   140001e77:	call   0x1400027b0
   140001e7c:	test   eax,eax
   140001e7e:	je     0x140001e8a
   140001e80:	mov    eax,0xff
   140001e85:	jmp    0x140001f63
   140001e8a:	lea    rdx,[rip+0x1437]        # 0x1400032c8
   140001e91:	lea    rcx,[rip+0x1418]        # 0x1400032b0
   140001e98:	call   0x1400027aa
   140001e9d:	mov    DWORD PTR [rip+0x32e9],0x2        # 0x140005190
   140001ea7:	jmp    0x140001eb1
   140001ea9:	mov    sil,0x1
   140001eac:	mov    BYTE PTR [rsp+0x20],sil
   140001eb1:	mov    cl,bl
   140001eb3:	call   0x140002148
   140001eb8:	call   0x14000234c
   140001ebd:	mov    rbx,rax
   140001ec0:	cmp    QWORD PTR [rax],0x0
   140001ec4:	je     0x140001ee4
   140001ec6:	mov    rcx,rax
   140001ec9:	call   0x1400020b0
   140001ece:	test   al,al
   140001ed0:	je     0x140001ee4
   140001ed2:	xor    r8d,r8d
   140001ed5:	lea    edx,[r8+0x2]
   140001ed9:	xor    ecx,ecx
   140001edb:	mov    rax,QWORD PTR [rbx]
   140001ede:	call   QWORD PTR [rip+0x13a4]        # 0x140003288
   140001ee4:	call   0x140002354
   140001ee9:	mov    rbx,rax
   140001eec:	cmp    QWORD PTR [rax],0x0
   140001ef0:	je     0x140001f06
   140001ef2:	mov    rcx,rax
   140001ef5:	call   0x1400020b0
   140001efa:	test   al,al
   140001efc:	je     0x140001f06
   140001efe:	mov    rcx,QWORD PTR [rbx]
   140001f01:	call   0x1400027e0
   140001f06:	call   0x1400027a4
   140001f0b:	mov    rdi,rax
   140001f0e:	call   0x1400027ce
   140001f13:	mov    rbx,QWORD PTR [rax]
   140001f16:	call   0x1400027c8
   140001f1b:	mov    r8,rdi
   140001f1e:	mov    rdx,rbx
   140001f21:	mov    ecx,DWORD PTR [rax]
   140001f23:	call   0x140001290
   140001f28:	mov    ebx,eax
   140001f2a:	call   0x14000236c
   140001f2f:	test   al,al
   140001f31:	je     0x140001f88
   140001f33:	test   sil,sil
   140001f36:	jne    0x140001f3d
   140001f38:	call   0x1400027d4
   140001f3d:	xor    edx,edx
   140001f3f:	mov    cl,0x1
   140001f41:	call   0x14000216c
   140001f46:	mov    eax,ebx
   140001f48:	jmp    0x140001f63
   140001f4a:	mov    ebx,eax
   140001f4c:	call   0x14000236c
   140001f51:	test   al,al
   140001f53:	je     0x140001f90
   140001f55:	cmp    BYTE PTR [rsp+0x20],0x0
   140001f5a:	jne    0x140001f61
   140001f5c:	call   0x1400027da
   140001f61:	mov    eax,ebx
   140001f63:	mov    rbx,QWORD PTR [rsp+0x40]
   140001f68:	mov    rsi,QWORD PTR [rsp+0x48]
   140001f6d:	add    rsp,0x30
   140001f71:	pop    rdi
   140001f72:	ret
   140001f73:	mov    ecx,0x7
   140001f78:	call   0x14000235c
   140001f7d:	nop
   140001f7e:	mov    ecx,0x7
   140001f83:	call   0x14000235c
   140001f88:	mov    ecx,ebx
   140001f8a:	call   0x1400027b6
   140001f8f:	nop
   140001f90:	mov    ecx,ebx
   140001f92:	call   0x1400027bc
   140001f97:	nop
   140001f98:	sub    rsp,0x28
   140001f9c:	call   0x14000223c
   140001fa1:	add    rsp,0x28
   140001fa5:	jmp    0x140001e1c
   140001faa:	int3
   140001fab:	int3
   140001fac:	sub    rsp,0x28
   140001fb0:	call   0x140002740
   140001fb5:	test   eax,eax
   140001fb7:	je     0x140001fda
   140001fb9:	mov    rax,QWORD PTR gs:0x30
   140001fc2:	mov    rcx,QWORD PTR [rax+0x8]
   140001fc6:	jmp    0x140001fcd
   140001fc8:	cmp    rcx,rax
   140001fcb:	je     0x140001fe1
   140001fcd:	xor    eax,eax
   140001fcf:	lock cmpxchg QWORD PTR [rip+0x31c0],rcx        # 0x140005198
   140001fd8:	jne    0x140001fc8
   140001fda:	xor    al,al
   140001fdc:	add    rsp,0x28
   140001fe0:	ret
   140001fe1:	mov    al,0x1
   140001fe3:	jmp    0x140001fdc
   140001fe5:	int3
   140001fe6:	int3
   140001fe7:	int3
   140001fe8:	sub    rsp,0x28
   140001fec:	test   ecx,ecx
   140001fee:	jne    0x140001ff7
   140001ff0:	mov    BYTE PTR [rip+0x31a9],0x1        # 0x1400051a0
   140001ff7:	call   0x1400024a4
   140001ffc:	call   0x140002310
   140002001:	test   al,al
   140002003:	jne    0x140002009
   140002005:	xor    al,al
   140002007:	jmp    0x14000201d
   140002009:	call   0x140002310
   14000200e:	test   al,al
   140002010:	jne    0x14000201b
   140002012:	xor    ecx,ecx
   140002014:	call   0x140002310
   140002019:	jmp    0x140002005
   14000201b:	mov    al,0x1
   14000201d:	add    rsp,0x28
   140002021:	ret
   140002022:	int3
   140002023:	int3
   140002024:	rex push rbx
   140002026:	sub    rsp,0x20
   14000202a:	cmp    BYTE PTR [rip+0x3170],0x0        # 0x1400051a1
   140002031:	mov    ebx,ecx
   140002033:	jne    0x14000209c
   140002035:	cmp    ecx,0x1
   140002038:	ja     0x1400020a4
   14000203a:	call   0x140002740
   14000203f:	test   eax,eax
   140002041:	je     0x14000206b
   140002043:	test   ebx,ebx
   140002045:	jne    0x14000206b
   140002047:	lea    rcx,[rip+0x315a]        # 0x1400051a8
   14000204e:	call   0x1400027f8
   140002053:	test   eax,eax
   140002055:	jne    0x140002067
   140002057:	lea    rcx,[rip+0x3162]        # 0x1400051c0
   14000205e:	call   0x1400027f8
   140002063:	test   eax,eax
   140002065:	je     0x140002095
   140002067:	xor    al,al
   140002069:	jmp    0x14000209e
   14000206b:	movdqa xmm0,XMMWORD PTR [rip+0x12ad]        # 0x140003320
   140002073:	or     rax,0xffffffffffffffff
   140002077:	movdqu XMMWORD PTR [rip+0x3129],xmm0        # 0x1400051a8
   14000207f:	mov    QWORD PTR [rip+0x3132],rax        # 0x1400051b8
   140002086:	movdqu XMMWORD PTR [rip+0x3132],xmm0        # 0x1400051c0
   14000208e:	mov    QWORD PTR [rip+0x313b],rax        # 0x1400051d0
   140002095:	mov    BYTE PTR [rip+0x3105],0x1        # 0x1400051a1
   14000209c:	mov    al,0x1
   14000209e:	add    rsp,0x20
   1400020a2:	pop    rbx
   1400020a3:	ret
   1400020a4:	mov    ecx,0x5
   1400020a9:	call   0x14000235c
   1400020ae:	int3
   1400020af:	int3
   1400020b0:	sub    rsp,0x18
   1400020b4:	mov    r8,rcx
   1400020b7:	mov    eax,0x5a4d
   1400020bc:	cmp    WORD PTR [rip+0xffffffffffffdf3d],ax        # 0x140000000
   1400020c3:	jne    0x14000213d
   1400020c5:	movsxd rcx,DWORD PTR [rip+0xffffffffffffdf70]        # 0x14000003c
   1400020cc:	lea    rdx,[rip+0xffffffffffffdf2d]        # 0x140000000
   1400020d3:	add    rcx,rdx
   1400020d6:	cmp    DWORD PTR [rcx],0x4550
   1400020dc:	jne    0x14000213d
   1400020de:	mov    eax,0x20b
   1400020e3:	cmp    WORD PTR [rcx+0x18],ax
   1400020e7:	jne    0x14000213d
   1400020e9:	sub    r8,rdx
   1400020ec:	movzx  edx,WORD PTR [rcx+0x14]
   1400020f0:	add    rdx,0x18
   1400020f4:	add    rdx,rcx
   1400020f7:	movzx  eax,WORD PTR [rcx+0x6]
   1400020fb:	lea    rcx,[rax+rax*4]
   1400020ff:	lea    r9,[rdx+rcx*8]
   140002103:	mov    QWORD PTR [rsp],rdx
   140002107:	cmp    rdx,r9
   14000210a:	je     0x140002124
   14000210c:	mov    ecx,DWORD PTR [rdx+0xc]
   14000210f:	cmp    r8,rcx
   140002112:	jb     0x14000211e
   140002114:	mov    eax,DWORD PTR [rdx+0x8]
   140002117:	add    eax,ecx
   140002119:	cmp    r8,rax
   14000211c:	jb     0x140002126
   14000211e:	add    rdx,0x28
   140002122:	jmp    0x140002103
   140002124:	xor    edx,edx
   140002126:	test   rdx,rdx
   140002129:	jne    0x14000212f
   14000212b:	xor    al,al
   14000212d:	jmp    0x140002143
   14000212f:	cmp    DWORD PTR [rdx+0x24],0x0
   140002133:	jge    0x140002139
   140002135:	xor    al,al
   140002137:	jmp    0x140002143
   140002139:	mov    al,0x1
   14000213b:	jmp    0x140002143
   14000213d:	xor    al,al
   14000213f:	jmp    0x140002143
   140002141:	xor    al,al
   140002143:	add    rsp,0x18
   140002147:	ret
   140002148:	rex push rbx
   14000214a:	sub    rsp,0x20
   14000214e:	mov    bl,cl
   140002150:	call   0x140002740
   140002155:	xor    edx,edx
   140002157:	test   eax,eax
   140002159:	je     0x140002166
   14000215b:	test   bl,bl
   14000215d:	jne    0x140002166
   14000215f:	xchg   QWORD PTR [rip+0x3032],rdx        # 0x140005198
   140002166:	add    rsp,0x20
   14000216a:	pop    rbx
   14000216b:	ret
   14000216c:	rex push rbx
   14000216e:	sub    rsp,0x20
   140002172:	cmp    BYTE PTR [rip+0x3027],0x0        # 0x1400051a0
   140002179:	mov    bl,cl
   14000217b:	je     0x140002181
   14000217d:	test   dl,dl
   14000217f:	jne    0x14000218d
   140002181:	call   0x140002310
   140002186:	mov    cl,bl
   140002188:	call   0x140002310
   14000218d:	mov    al,0x1
   14000218f:	add    rsp,0x20
   140002193:	pop    rbx
   140002194:	ret
   140002195:	int3
   140002196:	int3
   140002197:	int3
   140002198:	rex push rbx
   14000219a:	sub    rsp,0x20
   14000219e:	cmp    QWORD PTR [rip+0x3002],0xffffffffffffffff        # 0x1400051a8
   1400021a6:	mov    rbx,rcx
   1400021a9:	jne    0x1400021b2
   1400021ab:	call   0x140002804
   1400021b0:	jmp    0x1400021c1
   1400021b2:	mov    rdx,rbx
   1400021b5:	lea    rcx,[rip+0x2fec]        # 0x1400051a8
   1400021bc:	call   0x1400027fe
   1400021c1:	xor    edx,edx
   1400021c3:	test   eax,eax
   1400021c5:	cmove  rdx,rbx
   1400021c9:	mov    rax,rdx
   1400021cc:	add    rsp,0x20
   1400021d0:	pop    rbx
   1400021d1:	ret
   1400021d2:	int3
   1400021d3:	int3
   1400021d4:	sub    rsp,0x28
   1400021d8:	call   0x140002198
   1400021dd:	neg    rax
   1400021e0:	sbb    eax,eax
   1400021e2:	neg    eax
   1400021e4:	dec    eax
   1400021e6:	add    rsp,0x28
   1400021ea:	ret
   1400021eb:	int3
   1400021ec:	ret    0x0
   1400021ef:	int3
   1400021f0:	mov    ecx,0x2
   1400021f5:	int    0x29
   1400021f7:	ret
   1400021f8:	lea    rax,[rip+0x1161]        # 0x140003360
   1400021ff:	mov    QWORD PTR [rcx+0x10],0x0
   140002207:	mov    QWORD PTR [rcx+0x8],rax
   14000220b:	lea    rax,[rip+0x113e]        # 0x140003350
   140002212:	mov    QWORD PTR [rcx],rax
   140002215:	mov    rax,rcx
   140002218:	ret
   140002219:	int3
   14000221a:	int3
   14000221b:	int3
   14000221c:	sub    rsp,0x48
   140002220:	lea    rcx,[rsp+0x20]
   140002225:	call   0x1400021f8
   14000222a:	lea    rdx,[rip+0x1d87]        # 0x140003fb8
   140002231:	lea    rcx,[rsp+0x20]
   140002236:	call   0x140002762
   14000223b:	int3
   14000223c:	mov    QWORD PTR [rsp+0x18],rbx
   140002241:	push   rbp
   140002242:	mov    rbp,rsp
   140002245:	sub    rsp,0x30
   140002249:	mov    rax,QWORD PTR [rip+0x2df0]        # 0x140005040
   140002250:	movabs rbx,0x2b992ddfa232
   14000225a:	cmp    rax,rbx
   14000225d:	jne    0x1400022d6
   14000225f:	lea    rcx,[rbp+0x10]
   140002263:	mov    QWORD PTR [rbp+0x10],0x0
   14000226b:	call   QWORD PTR [rip+0xda7]        # 0x140003018
   140002271:	mov    rax,QWORD PTR [rbp+0x10]
   140002275:	mov    QWORD PTR [rbp-0x10],rax
   140002279:	call   QWORD PTR [rip+0xda1]        # 0x140003020
   14000227f:	mov    eax,eax
   140002281:	xor    QWORD PTR [rbp-0x10],rax
   140002285:	call   QWORD PTR [rip+0xd9d]        # 0x140003028
   14000228b:	mov    eax,eax
   14000228d:	lea    rcx,[rbp+0x18]
   140002291:	xor    QWORD PTR [rbp-0x10],rax
   140002295:	call   QWORD PTR [rip+0xd95]        # 0x140003030
   14000229b:	mov    eax,DWORD PTR [rbp+0x18]
   14000229e:	lea    rcx,[rbp-0x10]
   1400022a2:	shl    rax,0x20
   1400022a6:	xor    rax,QWORD PTR [rbp+0x18]
   1400022aa:	xor    rax,QWORD PTR [rbp-0x10]
   1400022ae:	xor    rax,rcx
   1400022b1:	movabs rcx,0xffffffffffff
   1400022bb:	and    rax,rcx
   1400022be:	movabs rcx,0x2b992ddfa233
   1400022c8:	cmp    rax,rbx
   1400022cb:	cmove  rax,rcx
   1400022cf:	mov    QWORD PTR [rip+0x2d6a],rax        # 0x140005040
   1400022d6:	mov    rbx,QWORD PTR [rsp+0x50]
   1400022db:	not    rax
   1400022de:	mov    QWORD PTR [rip+0x2d9b],rax        # 0x140005080
   1400022e5:	add    rsp,0x30
   1400022e9:	pop    rbp
   1400022ea:	ret
   1400022eb:	int3
   1400022ec:	xor    eax,eax
   1400022ee:	ret
   1400022ef:	int3
   1400022f0:	mov    eax,0x1
   1400022f5:	ret
   1400022f6:	int3
   1400022f7:	int3
   1400022f8:	mov    eax,0x4000
   1400022fd:	ret
   1400022fe:	int3
   1400022ff:	int3
   140002300:	lea    rcx,[rip+0x2ed9]        # 0x1400051e0
   140002307:	rex.W jmp QWORD PTR [rip+0xd02]        # 0x140003010
   14000230e:	int3
   14000230f:	int3
   140002310:	mov    al,0x1
   140002312:	ret
   140002313:	int3
   140002314:	lea    rax,[rip+0x2ed5]        # 0x1400051f0
   14000231b:	ret
   14000231c:	lea    rax,[rip+0x2ed5]        # 0x1400051f8
   140002323:	ret
   140002324:	sub    rsp,0x28
   140002328:	call   0x140002314
   14000232d:	or     QWORD PTR [rax],0x24
   140002331:	call   0x14000231c
   140002336:	or     QWORD PTR [rax],0x2
   14000233a:	add    rsp,0x28
   14000233e:	ret
   14000233f:	int3
   140002340:	xor    eax,eax
   140002342:	cmp    DWORD PTR [rip+0x2d40],eax        # 0x140005088
   140002348:	sete   al
   14000234b:	ret
   14000234c:	lea    rax,[rip+0x2ecd]        # 0x140005220
   140002353:	ret
   140002354:	lea    rax,[rip+0x2ebd]        # 0x140005218
   14000235b:	ret
   14000235c:	mov    ecx,ecx
   14000235e:	int    0x29
   140002360:	ret
   140002361:	int3
   140002362:	int3
   140002363:	int3
   140002364:	jmp    0x1400022ec
   140002369:	int3
   14000236a:	int3
   14000236b:	int3
   14000236c:	sub    rsp,0x28
   140002370:	xor    ecx,ecx
   140002372:	call   QWORD PTR [rip+0xc88]        # 0x140003000
   140002378:	test   rax,rax
   14000237b:	je     0x1400023b7
   14000237d:	mov    ecx,0x5a4d
   140002382:	cmp    WORD PTR [rax],cx
   140002385:	jne    0x1400023b7
   140002387:	movsxd rcx,DWORD PTR [rax+0x3c]
   14000238b:	cmp    DWORD PTR [rcx+rax*1],0x4550
   140002392:	jne    0x1400023b7
   140002394:	mov    edx,0x20b
   140002399:	cmp    WORD PTR [rcx+rax*1+0x18],dx
   14000239e:	jne    0x1400023b7
   1400023a0:	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   1400023a8:	jbe    0x1400023b7
   1400023aa:	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   1400023b2:	setne  al
   1400023b5:	jmp    0x1400023b9
   1400023b7:	xor    al,al
   1400023b9:	add    rsp,0x28
   1400023bd:	ret
   1400023be:	int3
   1400023bf:	int3
   1400023c0:	lea    rcx,[rip+0x9]        # 0x1400023d0
   1400023c7:	rex.W jmp QWORD PTR [rip+0xc3a]        # 0x140003008
   1400023ce:	int3
   1400023cf:	int3
   1400023d0:	mov    QWORD PTR [rsp+0x8],rbx
   1400023d5:	push   rdi
   1400023d6:	sub    rsp,0x20
   1400023da:	mov    rbx,QWORD PTR [rcx]
   1400023dd:	mov    rdi,rcx
   1400023e0:	cmp    DWORD PTR [rbx],0xe06d7363
   1400023e6:	jne    0x140002404
   1400023e8:	cmp    DWORD PTR [rbx+0x18],0x4
   1400023ec:	jne    0x140002404
   1400023ee:	mov    edx,DWORD PTR [rbx+0x20]
   1400023f1:	lea    eax,[rdx-0x19930520]
   1400023f7:	cmp    eax,0x2
   1400023fa:	jbe    0x140002411
   1400023fc:	cmp    edx,0x1994000
   140002402:	je     0x140002411
   140002404:	mov    rbx,QWORD PTR [rsp+0x30]
   140002409:	xor    eax,eax
   14000240b:	add    rsp,0x20
   14000240f:	pop    rdi
   140002410:	ret
   140002411:	call   0x140002768
   140002416:	mov    QWORD PTR [rax],rbx
   140002419:	mov    rbx,QWORD PTR [rdi+0x8]
   14000241d:	call   0x14000276e
   140002422:	mov    QWORD PTR [rax],rbx
   140002425:	call   0x14000280a
   14000242a:	int3
   14000242b:	int3
   14000242c:	mov    QWORD PTR [rsp+0x8],rbx
   140002431:	push   rdi
   140002432:	sub    rsp,0x20
   140002436:	lea    rbx,[rip+0x1893]        # 0x140003cd0
   14000243d:	lea    rdi,[rip+0x188c]        # 0x140003cd0
   140002444:	jmp    0x140002458
   140002446:	mov    rax,QWORD PTR [rbx]
   140002449:	test   rax,rax
   14000244c:	je     0x140002454
   14000244e:	call   QWORD PTR [rip+0xe34]        # 0x140003288
   140002454:	add    rbx,0x8
   140002458:	cmp    rbx,rdi
   14000245b:	jb     0x140002446
   14000245d:	mov    rbx,QWORD PTR [rsp+0x30]
   140002462:	add    rsp,0x20
   140002466:	pop    rdi
   140002467:	ret
   140002468:	mov    QWORD PTR [rsp+0x8],rbx
   14000246d:	push   rdi
   14000246e:	sub    rsp,0x20
   140002472:	lea    rbx,[rip+0x1867]        # 0x140003ce0
   140002479:	lea    rdi,[rip+0x1860]        # 0x140003ce0
   140002480:	jmp    0x140002494
   140002482:	mov    rax,QWORD PTR [rbx]
   140002485:	test   rax,rax
   140002488:	je     0x140002490
   14000248a:	call   QWORD PTR [rip+0xdf8]        # 0x140003288
   140002490:	add    rbx,0x8
   140002494:	cmp    rbx,rdi
   140002497:	jb     0x140002482
   140002499:	mov    rbx,QWORD PTR [rsp+0x30]
   14000249e:	add    rsp,0x20
   1400024a2:	pop    rdi
   1400024a3:	ret
   1400024a4:	mov    QWORD PTR [rsp+0x10],rbx
   1400024a9:	mov    QWORD PTR [rsp+0x18],rbp
   1400024ae:	mov    QWORD PTR [rsp+0x20],rsi
   1400024b3:	push   rdi
   1400024b4:	sub    rsp,0x10
   1400024b8:	xor    eax,eax
   1400024ba:	xor    ecx,ecx
   1400024bc:	cpuid
   1400024be:	xor    ecx,0x6c65746e
   1400024c4:	xor    edx,0x49656e69
   1400024ca:	or     edx,ecx
   1400024cc:	mov    ebp,eax
   1400024ce:	mov    eax,0x1
   1400024d3:	xor    ebx,0x756e6547
   1400024d9:	or     edx,ebx
   1400024db:	lea    ecx,[rax-0x1]
   1400024de:	cpuid
   1400024e0:	mov    edi,ecx
   1400024e2:	jne    0x140002542
   1400024e4:	and    eax,0xfff3ff0
   1400024e9:	mov    QWORD PTR [rip+0x2ba4],0x8000        # 0x140005098
   1400024f4:	mov    QWORD PTR [rip+0x2ba1],0xffffffffffffffff        # 0x1400050a0
   1400024ff:	cmp    eax,0x106c0
   140002504:	je     0x14000252e
   140002506:	cmp    eax,0x20660
   14000250b:	je     0x14000252e
   14000250d:	cmp    eax,0x20670
   140002512:	je     0x14000252e
   140002514:	add    eax,0xfffcf9b0
   140002519:	cmp    eax,0x20
   14000251c:	ja     0x140002542
   14000251e:	movabs rcx,0x100010001
   140002528:	bt     rcx,rax
   14000252c:	jae    0x140002542
   14000252e:	mov    r8d,DWORD PTR [rip+0x2ccf]        # 0x140005204
   140002535:	or     r8d,0x1
   140002539:	mov    DWORD PTR [rip+0x2cc4],r8d        # 0x140005204
   140002540:	jmp    0x140002549
   140002542:	mov    r8d,DWORD PTR [rip+0x2cbb]        # 0x140005204
   140002549:	xor    r9d,r9d
   14000254c:	mov    r11d,r9d
   14000254f:	cmp    ebp,0x7
   140002552:	jl     0x140002596
   140002554:	xor    ecx,ecx
   140002556:	lea    eax,[r9+0x7]
   14000255a:	cpuid
   14000255c:	mov    esi,edx
   14000255e:	mov    r10d,ebx
   140002561:	bt     ebx,0x9
   140002565:	jae    0x140002572
   140002567:	or     r8d,0x2
   14000256b:	mov    DWORD PTR [rip+0x2c92],r8d        # 0x140005204
   140002572:	cmp    eax,0x1
   140002575:	jl     0x140002584
   140002577:	mov    eax,0x7
   14000257c:	lea    ecx,[rax-0x6]
   14000257f:	cpuid
   140002581:	mov    r9d,edx
   140002584:	mov    eax,0x24
   140002589:	cmp    ebp,eax
   14000258b:	jl     0x14000259c
   14000258d:	xor    ecx,ecx
   14000258f:	cpuid
   140002591:	mov    r11d,ebx
   140002594:	jmp    0x14000259c
   140002596:	mov    r10d,r9d
   140002599:	mov    esi,r9d
   14000259c:	mov    rax,QWORD PTR [rip+0x2b05]        # 0x1400050a8
   1400025a3:	and    rax,0xfffffffffffffffe
   1400025a7:	mov    DWORD PTR [rip+0x2adf],0x1        # 0x140005090
   1400025b1:	mov    DWORD PTR [rip+0x2ad9],0x2        # 0x140005094
   1400025bb:	mov    QWORD PTR [rip+0x2ae6],rax        # 0x1400050a8
   1400025c2:	bt     edi,0x14
   1400025c6:	jae    0x1400025e7
   1400025c8:	and    rax,0xffffffffffffffef
   1400025cc:	mov    DWORD PTR [rip+0x2aba],0x2        # 0x140005090
   1400025d6:	mov    QWORD PTR [rip+0x2acb],rax        # 0x1400050a8
   1400025dd:	mov    DWORD PTR [rip+0x2aad],0x6        # 0x140005094
   1400025e7:	bt     edi,0x1b
   1400025eb:	jae    0x140002728
   1400025f1:	xor    ecx,ecx
   1400025f3:	xgetbv
   1400025f6:	shl    rdx,0x20
   1400025fa:	or     rdx,rax
   1400025fd:	mov    QWORD PTR [rsp+0x20],rdx
   140002602:	bt     edi,0x1c
   140002606:	jae    0x14000270c
   14000260c:	mov    rax,QWORD PTR [rsp+0x20]
   140002611:	and    al,0x6
   140002613:	cmp    al,0x6
   140002615:	jne    0x14000270c
   14000261b:	mov    eax,DWORD PTR [rip+0x2a73]        # 0x140005094
   140002621:	mov    dl,0xe0
   140002623:	or     eax,0x8
   140002626:	mov    DWORD PTR [rip+0x2a60],0x3        # 0x140005090
   140002630:	mov    DWORD PTR [rip+0x2a5e],eax        # 0x140005094
   140002636:	test   r10b,0x20
   14000263a:	je     0x14000269e
   14000263c:	or     eax,0x20
   14000263f:	mov    DWORD PTR [rip+0x2a47],0x5        # 0x140005090
   140002649:	mov    DWORD PTR [rip+0x2a45],eax        # 0x140005094
   14000264f:	mov    ecx,0xd0030000
   140002654:	mov    rax,QWORD PTR [rip+0x2a4d]        # 0x1400050a8
   14000265b:	and    r10d,ecx
   14000265e:	and    rax,0xfffffffffffffffd
   140002662:	mov    QWORD PTR [rip+0x2a3f],rax        # 0x1400050a8
   140002669:	cmp    r10d,ecx
   14000266c:	jne    0x1400026a5
   14000266e:	mov    rax,QWORD PTR [rsp+0x20]
   140002673:	and    al,dl
   140002675:	cmp    al,dl
   140002677:	jne    0x14000269e
   140002679:	mov    rax,QWORD PTR [rip+0x2a28]        # 0x1400050a8
   140002680:	or     DWORD PTR [rip+0x2a0d],0x40        # 0x140005094
   140002687:	and    rax,0xffffffffffffffdb
   14000268b:	mov    DWORD PTR [rip+0x29fb],0x6        # 0x140005090
   140002695:	mov    QWORD PTR [rip+0x2a0c],rax        # 0x1400050a8
   14000269c:	jmp    0x1400026a5
   14000269e:	mov    rax,QWORD PTR [rip+0x2a03]        # 0x1400050a8
   1400026a5:	bt     esi,0x17
   1400026a9:	jae    0x1400026b7
   1400026ab:	btr    rax,0x18
   1400026b0:	mov    QWORD PTR [rip+0x29f1],rax        # 0x1400050a8
   1400026b7:	bt     r9d,0x13
   1400026bc:	jae    0x14000270c
   1400026be:	mov    rax,QWORD PTR [rsp+0x20]
   1400026c3:	and    al,dl
   1400026c5:	cmp    al,dl
   1400026c7:	jne    0x14000270c
   1400026c9:	mov    rdx,QWORD PTR [rip+0x29d8]        # 0x1400050a8
   1400026d0:	mov    eax,r11d
   1400026d3:	shr    rax,0x10
   1400026d7:	mov    ecx,r11d
   1400026da:	and    eax,0x6
   1400026dd:	and    ecx,0x400ff
   1400026e3:	or     rax,0x1000029
   1400026e9:	mov    DWORD PTR [rip+0x2b19],ecx        # 0x140005208
   1400026ef:	not    rax
   1400026f2:	and    rdx,rax
   1400026f5:	mov    QWORD PTR [rip+0x29ac],rdx        # 0x1400050a8
   1400026fc:	cmp    cl,0x1
   1400026ff:	jbe    0x14000270c
   140002701:	and    rdx,0xffffffffffffffbf
   140002705:	mov    QWORD PTR [rip+0x299c],rdx        # 0x1400050a8
   14000270c:	bt     r9d,0x15
   140002711:	jae    0x140002728
   140002713:	mov    rax,QWORD PTR [rsp+0x20]
   140002718:	bt     rax,0x13
   14000271d:	jae    0x140002728
   14000271f:	btr    QWORD PTR [rip+0x2980],0x7        # 0x1400050a8
   140002728:	mov    rbx,QWORD PTR [rsp+0x28]
   14000272d:	xor    eax,eax
   14000272f:	mov    rbp,QWORD PTR [rsp+0x30]
   140002734:	mov    rsi,QWORD PTR [rsp+0x38]
   140002739:	add    rsp,0x10
   14000273d:	pop    rdi
   14000273e:	ret
   14000273f:	int3
   140002740:	xor    eax,eax
   140002742:	cmp    DWORD PTR [rip+0x2968],eax        # 0x1400050b0
   140002748:	setne  al
   14000274b:	ret
   14000274c:	int3
   14000274d:	int3
   14000274e:	int3
   14000274f:	int3
   140002750:	jmp    QWORD PTR [rip+0xa02]        # 0x140003158
   140002756:	jmp    QWORD PTR [rip+0x9cc]        # 0x140003128
   14000275c:	jmp    QWORD PTR [rip+0x9ce]        # 0x140003130
   140002762:	jmp    QWORD PTR [rip+0x9d8]        # 0x140003140
   140002768:	jmp    QWORD PTR [rip+0x9da]        # 0x140003148
   14000276e:	jmp    QWORD PTR [rip+0x994]        # 0x140003108
   140002774:	jmp    QWORD PTR [rip+0x9ee]        # 0x140003168
   14000277a:	jmp    QWORD PTR [rip+0x9f0]        # 0x140003170
   140002780:	jmp    QWORD PTR [rip+0x9f2]        # 0x140003178
   140002786:	jmp    QWORD PTR [rip+0xa34]        # 0x1400031c0
   14000278c:	jmp    QWORD PTR [rip+0xa56]        # 0x1400031e8
   140002792:	jmp    QWORD PTR [rip+0xa08]        # 0x1400031a0
   140002798:	jmp    QWORD PTR [rip+0xaa2]        # 0x140003240
   14000279e:	jmp    QWORD PTR [rip+0xa94]        # 0x140003238
   1400027a4:	jmp    QWORD PTR [rip+0xa86]        # 0x140003230
   1400027aa:	jmp    QWORD PTR [rip+0xa78]        # 0x140003228
   1400027b0:	jmp    QWORD PTR [rip+0xa6a]        # 0x140003220
   1400027b6:	jmp    QWORD PTR [rip+0xa5c]        # 0x140003218
   1400027bc:	jmp    QWORD PTR [rip+0xa4e]        # 0x140003210
   1400027c2:	jmp    QWORD PTR [rip+0xa90]        # 0x140003258
   1400027c8:	jmp    QWORD PTR [rip+0xa22]        # 0x1400031f0
   1400027ce:	jmp    QWORD PTR [rip+0xa24]        # 0x1400031f8
   1400027d4:	jmp    QWORD PTR [rip+0x9d6]        # 0x1400031b0
   1400027da:	jmp    QWORD PTR [rip+0xa20]        # 0x140003200
   1400027e0:	jmp    QWORD PTR [rip+0x9ea]        # 0x1400031d0
   1400027e6:	jmp    QWORD PTR [rip+0x9a4]        # 0x140003190
   1400027ec:	jmp    QWORD PTR [rip+0x98e]        # 0x140003180
   1400027f2:	jmp    QWORD PTR [rip+0xa58]        # 0x140003250
   1400027f8:	jmp    QWORD PTR [rip+0x9ca]        # 0x1400031c8
   1400027fe:	jmp    QWORD PTR [rip+0xa04]        # 0x140003208
   140002804:	jmp    QWORD PTR [rip+0x9ce]        # 0x1400031d8
   14000280a:	jmp    QWORD PTR [rip+0x9d0]        # 0x1400031e0
   140002810:	mov    r10,rcx
   140002813:	mov    r11,rdx
   140002816:	mov    ecx,DWORD PTR [r8]
   140002819:	and    ecx,0xfffffff8
   14000281c:	test   BYTE PTR [r8],0x4
   140002820:	je     0x140002837
   140002822:	mov    eax,DWORD PTR [r8+0x8]
   140002826:	movsxd r9,DWORD PTR [r8+0x4]
   14000282a:	neg    eax
   14000282c:	movsxd rdx,eax
   14000282f:	add    r9,r10
   140002832:	and    r9,rdx
   140002835:	jmp    0x14000283a
   140002837:	mov    r9,r10
   14000283a:	movsxd rax,ecx
   14000283d:	mov    rdx,QWORD PTR [rax+r9*1]
   140002841:	mov    rax,QWORD PTR [r11+0x10]
   140002845:	mov    ecx,DWORD PTR [rax+0x8]
   140002848:	mov    rax,QWORD PTR [r11+0x8]
   14000284c:	test   BYTE PTR [rcx+rax*1+0x3],0xf
   140002851:	je     0x140002865
   140002853:	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140002858:	mov    ecx,0xfffffff0
   14000285d:	and    rax,rcx
   140002860:	add    rax,r10
   140002863:	jmp    0x140002868
   140002865:	mov    rax,r10
   140002868:	xor    rdx,rax
   14000286b:	mov    rcx,rdx
   14000286e:	jmp    0x140001ca0
   140002873:	int3
   140002874:	mov    rax,rsp
   140002877:	mov    QWORD PTR [rax+0x8],rbx
   14000287b:	mov    QWORD PTR [rax+0x10],rbp
   14000287f:	mov    QWORD PTR [rax+0x18],rsi
   140002883:	mov    QWORD PTR [rax+0x20],rdi
   140002887:	push   r14
   140002889:	sub    rsp,0x20
   14000288d:	mov    rbx,QWORD PTR [r9+0x38]
   140002891:	mov    rsi,rdx
   140002894:	mov    r14,r8
   140002897:	mov    rbp,rcx
   14000289a:	mov    rdx,r9
   14000289d:	mov    rcx,rsi
   1400028a0:	mov    rdi,r9
   1400028a3:	lea    r8,[rbx+0x4]
   1400028a7:	call   0x140002810
   1400028ac:	mov    eax,DWORD PTR [rbp+0x4]
   1400028af:	and    al,0x66
   1400028b1:	neg    al
   1400028b3:	mov    eax,0x1
   1400028b8:	sbb    r9d,r9d
   1400028bb:	neg    r9d
   1400028be:	add    r9d,eax
   1400028c1:	test   DWORD PTR [rbx+0x4],r9d
   1400028c5:	je     0x1400028d8
   1400028c7:	mov    r9,rdi
   1400028ca:	mov    r8,r14
   1400028cd:	mov    rdx,rsi
   1400028d0:	mov    rcx,rbp
   1400028d3:	call   0x140002750
   1400028d8:	mov    rbx,QWORD PTR [rsp+0x30]
   1400028dd:	mov    rbp,QWORD PTR [rsp+0x38]
   1400028e2:	mov    rsi,QWORD PTR [rsp+0x40]
   1400028e7:	mov    rdi,QWORD PTR [rsp+0x48]
   1400028ec:	add    rsp,0x20
   1400028f0:	pop    r14
   1400028f2:	ret
   1400028f3:	jmp    QWORD PTR [rip+0x83f]        # 0x140003138
   1400028f9:	jmp    QWORD PTR [rip+0x819]        # 0x140003118
   1400028ff:	jmp    QWORD PTR [rip+0x963]        # 0x140003268
   140002905:	int3
   140002906:	int3
   140002907:	int3
   140002908:	int3
   140002909:	int3
   14000290a:	int3
   14000290b:	int3
   14000290c:	int3
   14000290d:	int3
   14000290e:	int3
   14000290f:	int3
   140002910:	int3
   140002911:	int3
   140002912:	int3
   140002913:	int3
   140002914:	int3
   140002915:	int3
   140002916:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002920:	jmp    rax
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
   140002930:	int3
   140002931:	int3
   140002932:	int3
   140002933:	int3
   140002934:	int3
   140002935:	int3
   140002936:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002940:	jmp    QWORD PTR [rip+0x942]        # 0x140003288
   140002946:	int3
   140002947:	int3
   140002948:	int3
   140002949:	int3
   14000294a:	int3
   14000294b:	int3
   14000294c:	int3
   14000294d:	int3
   14000294e:	int3
   14000294f:	int3
   140002950:	lea    rcx,[rdx+0x20]
   140002957:	jmp    0x1400019b0
   14000295c:	lea    rcx,[rdx+0x40]
   140002963:	jmp    0x1400019b0
   140002968:	int3
   140002969:	int3
   14000296a:	int3
   14000296b:	int3
   14000296c:	int3
   14000296d:	int3
   14000296e:	int3
   14000296f:	int3
   140002970:	lea    rcx,[rdx+0x28]
   140002977:	rex.W jmp QWORD PTR [rip+0x77a]        # 0x1400030f8
   14000297e:	lea    rcx,[rdx+0x30]
   140002985:	jmp    0x140001ac0
   14000298a:	int3
   14000298b:	int3
   14000298c:	int3
   14000298d:	int3
   14000298e:	int3
   14000298f:	int3
   140002990:	lea    rcx,[rdx+0x20]
   140002997:	jmp    0x140001a50
   14000299c:	lea    rcx,[rdx+0x20]
   1400029a3:	jmp    0x140001a80
   1400029a8:	mov    QWORD PTR [rsp+0x10],rdx
   1400029ad:	push   rbp
   1400029ae:	sub    rsp,0x20
   1400029b2:	mov    rbp,rdx
   1400029b5:	mov    rdx,QWORD PTR [rbp+0x60]
   1400029b9:	mov    rax,QWORD PTR [rdx]
   1400029bc:	movsxd rcx,DWORD PTR [rax+0x4]
   1400029c0:	add    rcx,rdx
   1400029c3:	mov    r8b,0x1
   1400029c6:	mov    edx,0x4
   1400029cb:	call   QWORD PTR [rip+0x687]        # 0x140003058
   1400029d1:	nop
   1400029d2:	movabs rax,0x0
   1400029dc:	add    rsp,0x20
   1400029e0:	pop    rbp
   1400029e1:	ret
   1400029e2:	int3
   1400029e3:	int3
   1400029e4:	int3
   1400029e5:	int3
   1400029e6:	int3
   1400029e7:	int3
   1400029e8:	int3
   1400029e9:	int3
   1400029ea:	int3
   1400029eb:	int3
   1400029ec:	int3
   1400029ed:	int3
   1400029ee:	int3
   1400029ef:	int3
   1400029f0:	lea    rcx,[rdx+0x30]
   1400029f7:	jmp    0x140001a50
   1400029fc:	lea    rcx,[rdx+0x30]
   140002a03:	jmp    0x140001a20
   140002a08:	lea    rcx,[rdx+0x40]
   140002a0f:	jmp    0x140001260
   140002a14:	mov    QWORD PTR [rsp+0x10],rdx
   140002a19:	push   rbp
   140002a1a:	sub    rsp,0x20
   140002a1e:	mov    rbp,rdx
   140002a21:	mov    rdx,QWORD PTR [rbp+0x28]
   140002a25:	mov    rax,QWORD PTR [rdx]
   140002a28:	movsxd rcx,DWORD PTR [rax+0x4]
   140002a2c:	add    rcx,rdx
   140002a2f:	mov    r8b,0x1
   140002a32:	mov    edx,0x4
   140002a37:	call   QWORD PTR [rip+0x61b]        # 0x140003058
   140002a3d:	nop
   140002a3e:	movabs rax,0x0
   140002a48:	add    rsp,0x20
   140002a4c:	pop    rbp
   140002a4d:	ret
   140002a4e:	int3
   140002a4f:	rex push rbp
   140002a51:	sub    rsp,0x20
   140002a55:	mov    rbp,rdx
   140002a58:	mov    rdx,rcx
   140002a5b:	mov    rcx,QWORD PTR [rcx]
   140002a5e:	mov    ecx,DWORD PTR [rcx]
   140002a60:	call   0x140002786
   140002a65:	nop
   140002a66:	add    rsp,0x20
   140002a6a:	pop    rbp
   140002a6b:	ret
   140002a6c:	int3
   140002a6d:	rex push rbp
   140002a6f:	mov    rbp,rdx
   140002a72:	mov    rax,QWORD PTR [rcx]
   140002a75:	xor    ecx,ecx
   140002a77:	cmp    DWORD PTR [rax],0xc0000005
   140002a7d:	sete   cl
   140002a80:	mov    eax,ecx
   140002a82:	pop    rbp
   140002a83:	ret
   140002a84:	int3
   140002a85:	int3
   140002a86:	int3
   140002a87:	int3
   140002a88:	rex push rbx
   140002a8a:	sub    rsp,0x20
   140002a8e:	jmp    0x140002acd
   140002a90:	mov    rax,QWORD PTR [rbx]
   140002a93:	mov    rcx,QWORD PTR [rbx+0x8]
   140002a97:	mov    QWORD PTR [rip+0x26e2],rax        # 0x140005180
   140002a9e:	mov    rax,QWORD PTR [rcx]
   140002aa1:	mov    rax,QWORD PTR [rax+0x10]
   140002aa5:	call   QWORD PTR [rip+0x7dd]        # 0x140003288
   140002aab:	mov    rcx,rax
   140002aae:	test   rax,rax
   140002ab1:	je     0x140002ac4
   140002ab3:	mov    rdx,QWORD PTR [rax]
   140002ab6:	mov    rax,QWORD PTR [rdx]
   140002ab9:	mov    edx,0x1
   140002abe:	call   QWORD PTR [rip+0x7c4]        # 0x140003288
   140002ac4:	mov    rcx,rbx
   140002ac7:	call   QWORD PTR [rip+0x69b]        # 0x140003168
   140002acd:	mov    rbx,QWORD PTR [rip+0x26ac]        # 0x140005180
   140002ad4:	test   rbx,rbx
   140002ad7:	jne    0x140002a90
   140002ad9:	add    rsp,0x20
   140002add:	pop    rbx
   140002ade:	ret
