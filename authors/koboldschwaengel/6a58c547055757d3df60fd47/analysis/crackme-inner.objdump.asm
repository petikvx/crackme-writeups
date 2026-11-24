
c.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	lea    rcx,[rip+0x2125]        # 0x14000312c
   140001007:	jmp    0x14000253c
   14000100c:	int3
   14000100d:	int3
   14000100e:	int3
   14000100f:	int3
   140001010:	rex push rbx
   140001012:	sub    rsp,0x20
   140001016:	mov    rbx,rcx
   140001019:	mov    rax,rdx
   14000101c:	lea    rcx,[rip+0x3355]        # 0x140004378
   140001023:	xorps  xmm0,xmm0
   140001026:	lea    rdx,[rbx+0x8]
   14000102a:	mov    QWORD PTR [rbx],rcx
   14000102d:	lea    rcx,[rax+0x8]
   140001031:	movups XMMWORD PTR [rdx],xmm0
   140001034:	call   QWORD PTR [rip+0x3126]        # 0x140004160
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
   140001054:	lea    rax,[rip+0x336d]        # 0x1400043c8
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
   14000107a:	lea    rax,[rip+0x32f7]        # 0x140004378
   140001081:	mov    rdi,rcx
   140001084:	mov    QWORD PTR [rcx],rax
   140001087:	mov    ebx,edx
   140001089:	add    rcx,0x8
   14000108d:	call   QWORD PTR [rip+0x30d5]        # 0x140004168
   140001093:	test   bl,0x1
   140001096:	je     0x1400010a5
   140001098:	mov    edx,0x18
   14000109d:	mov    rcx,rdi
   1400010a0:	call   0x14000206c
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
   1400010c0:	lea    rax,[rip+0x32b1]        # 0x140004378
   1400010c7:	mov    QWORD PTR [rcx],rax
   1400010ca:	add    rcx,0x8
   1400010ce:	rex.W jmp QWORD PTR [rip+0x3093]        # 0x140004168
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
   1400010e0:	lea    rax,[rip+0x32f9]        # 0x1400043e0
   1400010e7:	mov    QWORD PTR [rcx+0x10],0x0
   1400010ef:	mov    QWORD PTR [rcx+0x8],rax
   1400010f3:	lea    rax,[rip+0x32be]        # 0x1400043b8
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
   14000111e:	lea    rdx,[rip+0x4003]        # 0x140005128
   140001125:	lea    rcx,[rsp+0x20]
   14000112a:	call   0x140002db2
   14000112f:	int3
   140001130:	rex push rbx
   140001132:	sub    rsp,0x20
   140001136:	mov    rbx,rcx
   140001139:	mov    rax,rdx
   14000113c:	lea    rcx,[rip+0x3235]        # 0x140004378
   140001143:	xorps  xmm0,xmm0
   140001146:	lea    rdx,[rbx+0x8]
   14000114a:	mov    QWORD PTR [rbx],rcx
   14000114d:	lea    rcx,[rax+0x8]
   140001151:	movups XMMWORD PTR [rdx],xmm0
   140001154:	call   QWORD PTR [rip+0x3006]        # 0x140004160
   14000115a:	lea    rax,[rip+0x3257]        # 0x1400043b8
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
   14000117c:	lea    rcx,[rip+0x31f5]        # 0x140004378
   140001183:	xorps  xmm0,xmm0
   140001186:	lea    rdx,[rbx+0x8]
   14000118a:	mov    QWORD PTR [rbx],rcx
   14000118d:	lea    rcx,[rax+0x8]
   140001191:	movups XMMWORD PTR [rdx],xmm0
   140001194:	call   QWORD PTR [rip+0x2fc6]        # 0x140004160
   14000119a:	lea    rax,[rip+0x31ef]        # 0x140004390
   1400011a1:	mov    QWORD PTR [rbx],rax
   1400011a4:	mov    rax,rbx
   1400011a7:	add    rsp,0x20
   1400011ab:	pop    rbx
   1400011ac:	ret
   1400011ad:	int3
   1400011ae:	int3
   1400011af:	int3
   1400011b0:	sub    rsp,0x28
   1400011b4:	lea    rcx,[rip+0x323d]        # 0x1400043f8
   1400011bb:	call   QWORD PTR [rip+0x2f1f]        # 0x1400040e0
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
   1400011d0:	lea    rax,[rip+0x3231]        # 0x140004408
   1400011d7:	mov    QWORD PTR [rcx+0x10],0x0
   1400011df:	mov    QWORD PTR [rcx+0x8],rax
   1400011e3:	lea    rax,[rip+0x324e]        # 0x140004438
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
   14000120e:	lea    rdx,[rip+0x3e53]        # 0x140005068
   140001215:	lea    rcx,[rsp+0x20]
   14000121a:	call   0x140002db2
   14000121f:	int3
   140001220:	rex push rbx
   140001222:	sub    rsp,0x20
   140001226:	mov    rbx,rcx
   140001229:	mov    rax,rdx
   14000122c:	lea    rcx,[rip+0x3145]        # 0x140004378
   140001233:	xorps  xmm0,xmm0
   140001236:	lea    rdx,[rbx+0x8]
   14000123a:	mov    QWORD PTR [rbx],rcx
   14000123d:	lea    rcx,[rax+0x8]
   140001241:	movups XMMWORD PTR [rdx],xmm0
   140001244:	call   QWORD PTR [rip+0x2f16]        # 0x140004160
   14000124a:	lea    rax,[rip+0x31e7]        # 0x140004438
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
   14000126b:	je     0x14000128d
   14000126d:	mov    rax,QWORD PTR [rcx]
   140001270:	call   QWORD PTR [rax+0x10]
   140001273:	test   rax,rax
   140001276:	je     0x14000128d
   140001278:	mov    rcx,QWORD PTR [rax]
   14000127b:	mov    edx,0x1
   140001280:	mov    r8,QWORD PTR [rcx]
   140001283:	mov    rcx,rax
   140001286:	add    rsp,0x28
   14000128a:	rex.WB jmp r8
   14000128d:	add    rsp,0x28
   140001291:	ret
   140001292:	int3
   140001293:	int3
   140001294:	int3
   140001295:	int3
   140001296:	int3
   140001297:	int3
   140001298:	int3
   140001299:	int3
   14000129a:	int3
   14000129b:	int3
   14000129c:	int3
   14000129d:	int3
   14000129e:	int3
   14000129f:	int3
   1400012a0:	mov    QWORD PTR [rsp+0x8],rbx
   1400012a5:	mov    QWORD PTR [rsp+0x10],rsi
   1400012aa:	mov    QWORD PTR [rsp+0x18],rdi
   1400012af:	push   rbp
   1400012b0:	push   r12
   1400012b2:	push   r13
   1400012b4:	push   r14
   1400012b6:	push   r15
   1400012b8:	lea    rbp,[rsp-0x37]
   1400012bd:	sub    rsp,0xc0
   1400012c4:	mov    rax,QWORD PTR [rip+0x4d75]        # 0x140006040
   1400012cb:	xor    rax,rsp
   1400012ce:	mov    QWORD PTR [rbp+0x27],rax
   1400012d2:	xorps  xmm0,xmm0
   1400012d5:	movups XMMWORD PTR [rbp-0x41],xmm0
   1400012d9:	xor    ebx,ebx
   1400012db:	mov    QWORD PTR [rbp-0x31],rbx
   1400012df:	mov    QWORD PTR [rbp-0x29],0xf
   1400012e7:	mov    BYTE PTR [rbp-0x41],bl
   1400012ea:	movups XMMWORD PTR [rbp+0xf],xmm0
   1400012ee:	mov    DWORD PTR [rbp-0x69],0x61333231
   1400012f5:	mov    DWORD PTR [rbp-0x65],0x71716362
   1400012fc:	mov    ecx,0x8
   140001301:	call   0x140002030
   140001306:	mov    rsi,rax
   140001309:	mov    QWORD PTR [rbp+0xf],rax
   14000130d:	lea    r12,[rax+0x8]
   140001311:	mov    QWORD PTR [rbp+0x1f],r12
   140001315:	mov    rax,QWORD PTR [rbp-0x69]
   140001319:	mov    QWORD PTR [rsi],rax
   14000131c:	mov    QWORD PTR [rbp+0x17],r12
   140001320:	xorps  xmm0,xmm0
   140001323:	movups XMMWORD PTR [rbp-0x9],xmm0
   140001327:	mov    DWORD PTR [rbp-0x61],0x3e3f2227
   14000132e:	mov    DWORD PTR [rbp-0x5d],0x31207037
   140001335:	mov    WORD PTR [rbp-0x59],0x2323
   14000133b:	mov    BYTE PTR [rbp-0x57],0x71
   14000133f:	mov    ecx,0xb
   140001344:	call   0x140002030
   140001349:	mov    r14,rax
   14000134c:	mov    QWORD PTR [rbp-0x9],rax
   140001350:	lea    rdi,[rax+0xb]
   140001354:	mov    QWORD PTR [rbp+0x7],rdi
   140001358:	mov    r8d,0xb
   14000135e:	lea    rdx,[rbp-0x61]
   140001362:	mov    rcx,rax
   140001365:	call   0x140002f49
   14000136a:	mov    QWORD PTR [rbp-0x1],rdi
   14000136e:	xorps  xmm0,xmm0
   140001371:	movups XMMWORD PTR [rbp-0x21],xmm0
   140001375:	mov    DWORD PTR [rbp-0x51],0x22223f33
   14000137c:	mov    DWORD PTR [rbp-0x4d],0x70243335
   140001383:	mov    DWORD PTR [rbp-0x49],0x23233120
   14000138a:	mov    BYTE PTR [rbp-0x45],0x71
   14000138e:	mov    ecx,0xd
   140001393:	call   0x140002030
   140001398:	mov    r15,rax
   14000139b:	mov    QWORD PTR [rbp-0x21],rax
   14000139f:	lea    r13,[rax+0xd]
   1400013a3:	mov    QWORD PTR [rbp-0x11],r13
   1400013a7:	mov    r8d,0xd
   1400013ad:	lea    rdx,[rbp-0x51]
   1400013b1:	mov    rcx,rax
   1400013b4:	call   0x140002f49
   1400013b9:	mov    QWORD PTR [rbp-0x19],r13
   1400013bd:	lea    rdx,[rbp-0x41]
   1400013c1:	mov    rcx,QWORD PTR [rip+0x2d30]        # 0x1400040f8
   1400013c8:	call   0x140001800
   1400013cd:	cmp    QWORD PTR [rbp-0x31],0x1
   1400013d2:	jae    0x1400013e7
   1400013d4:	lea    rdx,[rip+0x303d]        # 0x140004418
   1400013db:	mov    rcx,QWORD PTR [rip+0x2d36]        # 0x140004118
   1400013e2:	call   0x1400019e0
   1400013e7:	mov    edx,ebx
   1400013e9:	mov    r13,QWORD PTR [rbp-0x41]
   1400013ed:	sub    r12,rsi
   1400013f0:	mov    QWORD PTR [rbp-0x69],r12
   1400013f4:	je     0x140001428
   1400013f6:	mov    rcx,rbx
   1400013f9:	mov    r8,QWORD PTR [rbp-0x29]
   1400013fd:	nop    DWORD PTR [rax]
   140001400:	lea    rax,[rbp-0x41]
   140001404:	cmp    r8,0xf
   140001408:	cmova  rax,r13
   14000140c:	movzx  eax,BYTE PTR [rcx+rax*1]
   140001410:	xor    al,0x50
   140001412:	cmp    al,BYTE PTR [rcx+rsi*1]
   140001415:	jne    0x140001571
   14000141b:	inc    edx
   14000141d:	inc    rcx
   140001420:	movsxd rax,edx
   140001423:	cmp    rax,r12
   140001426:	jb     0x140001400
   140001428:	mov    rax,QWORD PTR [rbp-0x11]
   14000142c:	sub    rax,r15
   14000142f:	je     0x140001464
   140001431:	mov    rdi,r15
   140001434:	mov    r12,rax
   140001437:	nop    WORD PTR [rax+rax*1+0x0]
   140001440:	movzx  edx,BYTE PTR [rdi]
   140001443:	xor    dl,0x50
   140001446:	mov    rcx,QWORD PTR [rip+0x2ccb]        # 0x140004118
   14000144d:	call   0x140001bc0
   140001452:	inc    ebx
   140001454:	lea    rdi,[rdi+0x1]
   140001458:	movsxd rax,ebx
   14000145b:	cmp    rax,r12
   14000145e:	jb     0x140001440
   140001460:	mov    r12,QWORD PTR [rbp-0x69]
   140001464:	lea    rdx,[rip+0x2fb9]        # 0x140004424
   14000146b:	mov    rcx,QWORD PTR [rip+0x2ca6]        # 0x140004118
   140001472:	call   0x1400019e0
   140001477:	lea    rcx,[rip+0x2faa]        # 0x140004428
   14000147e:	call   QWORD PTR [rip+0x2d8c]        # 0x140004210
   140001484:	nop
   140001485:	test   r15,r15
   140001488:	je     0x1400014c2
   14000148a:	mov    rcx,QWORD PTR [rbp-0x11]
   14000148e:	sub    rcx,r15
   140001491:	cmp    rcx,0x1000
   140001498:	jb     0x1400014b6
   14000149a:	add    rcx,0x27
   14000149e:	mov    rdx,QWORD PTR [r15-0x8]
   1400014a2:	sub    r15,rdx
   1400014a5:	lea    rax,[r15-0x8]
   1400014a9:	cmp    rax,0x1f
   1400014ad:	ja     0x1400015ac
   1400014b3:	mov    r15,rdx
   1400014b6:	mov    rdx,rcx
   1400014b9:	mov    rcx,r15
   1400014bc:	call   0x14000206c
   1400014c1:	nop
   1400014c2:	test   r14,r14
   1400014c5:	je     0x1400014ff
   1400014c7:	mov    rcx,QWORD PTR [rbp+0x7]
   1400014cb:	sub    rcx,r14
   1400014ce:	cmp    rcx,0x1000
   1400014d5:	jb     0x1400014f3
   1400014d7:	add    rcx,0x27
   1400014db:	mov    rdx,QWORD PTR [r14-0x8]
   1400014df:	sub    r14,rdx
   1400014e2:	lea    rax,[r14-0x8]
   1400014e6:	cmp    rax,0x1f
   1400014ea:	ja     0x1400015b3
   1400014f0:	mov    r14,rdx
   1400014f3:	mov    rdx,rcx
   1400014f6:	mov    rcx,r14
   1400014f9:	call   0x14000206c
   1400014fe:	nop
   1400014ff:	test   rsi,rsi
   140001502:	je     0x140001537
   140001504:	cmp    r12,0x1000
   14000150b:	jb     0x14000152b
   14000150d:	mov    r12d,0x2f
   140001513:	mov    rcx,QWORD PTR [rsi-0x8]
   140001517:	sub    rsi,rcx
   14000151a:	lea    rax,[rsi-0x8]
   14000151e:	cmp    rax,0x1f
   140001522:	ja     0x1400015ba
   140001528:	mov    rsi,rcx
   14000152b:	mov    rdx,r12
   14000152e:	mov    rcx,rsi
   140001531:	call   0x14000206c
   140001536:	nop
   140001537:	mov    rax,QWORD PTR [rbp-0x29]
   14000153b:	cmp    rax,0xf
   14000153f:	jbe    0x1400015c9
   140001545:	lea    rdx,[rax+0x1]
   140001549:	mov    rax,r13
   14000154c:	cmp    rdx,0x1000
   140001553:	jb     0x1400015c1
   140001555:	add    rdx,0x27
   140001559:	mov    r13,QWORD PTR [r13-0x8]
   14000155d:	sub    rax,r13
   140001560:	add    rax,0xfffffffffffffff8
   140001564:	cmp    rax,0x1f
   140001568:	jbe    0x1400015c1
   14000156a:	call   QWORD PTR [rip+0x2d00]        # 0x140004270
   140001570:	nop
   140001571:	mov    rax,rdi
   140001574:	sub    rax,r14
   140001577:	je     0x140001485
   14000157d:	mov    rdi,r14
   140001580:	mov    r12,rax
   140001583:	movzx  edx,BYTE PTR [rdi]
   140001586:	xor    dl,0x50
   140001589:	mov    rcx,QWORD PTR [rip+0x2b88]        # 0x140004118
   140001590:	call   0x140001bc0
   140001595:	inc    ebx
   140001597:	lea    rdi,[rdi+0x1]
   14000159b:	movsxd rax,ebx
   14000159e:	cmp    rax,r12
   1400015a1:	jb     0x140001583
   1400015a3:	mov    r12,QWORD PTR [rbp-0x69]
   1400015a7:	jmp    0x140001485
   1400015ac:	call   QWORD PTR [rip+0x2cbe]        # 0x140004270
   1400015b2:	nop
   1400015b3:	call   QWORD PTR [rip+0x2cb7]        # 0x140004270
   1400015b9:	nop
   1400015ba:	call   QWORD PTR [rip+0x2cb0]        # 0x140004270
   1400015c0:	nop
   1400015c1:	mov    rcx,r13
   1400015c4:	call   0x14000206c
   1400015c9:	xor    eax,eax
   1400015cb:	mov    rcx,QWORD PTR [rbp+0x27]
   1400015cf:	xor    rcx,rsp
   1400015d2:	call   0x140002010
   1400015d7:	lea    r11,[rsp+0xc0]
   1400015df:	mov    rbx,QWORD PTR [r11+0x30]
   1400015e3:	mov    rsi,QWORD PTR [r11+0x38]
   1400015e7:	mov    rdi,QWORD PTR [r11+0x40]
   1400015eb:	mov    rsp,r11
   1400015ee:	pop    r15
   1400015f0:	pop    r14
   1400015f2:	pop    r13
   1400015f4:	pop    r12
   1400015f6:	pop    rbp
   1400015f7:	ret
   1400015f8:	int3
   1400015f9:	int3
   1400015fa:	int3
   1400015fb:	int3
   1400015fc:	int3
   1400015fd:	int3
   1400015fe:	int3
   1400015ff:	int3
   140001600:	rex push rbx
   140001602:	sub    rsp,0x20
   140001606:	mov    rbx,rcx
   140001609:	mov    rcx,QWORD PTR [rcx]
   14000160c:	test   rcx,rcx
   14000160f:	je     0x14000164b
   140001611:	mov    rdx,QWORD PTR [rbx+0x10]
   140001615:	sub    rdx,rcx
   140001618:	cmp    rdx,0x1000
   14000161f:	jb     0x140001639
   140001621:	mov    r8,QWORD PTR [rcx-0x8]
   140001625:	add    rdx,0x27
   140001629:	sub    rcx,r8
   14000162c:	lea    rax,[rcx-0x8]
   140001630:	cmp    rax,0x1f
   140001634:	ja     0x140001651
   140001636:	mov    rcx,r8
   140001639:	call   0x14000206c
   14000163e:	xor    eax,eax
   140001640:	mov    QWORD PTR [rbx],rax
   140001643:	mov    QWORD PTR [rbx+0x8],rax
   140001647:	mov    QWORD PTR [rbx+0x10],rax
   14000164b:	add    rsp,0x20
   14000164f:	pop    rbx
   140001650:	ret
   140001651:	call   QWORD PTR [rip+0x2c19]        # 0x140004270
   140001657:	int3
   140001658:	int3
   140001659:	int3
   14000165a:	int3
   14000165b:	int3
   14000165c:	int3
   14000165d:	int3
   14000165e:	int3
   14000165f:	int3
   140001660:	rex push rbx
   140001662:	sub    rsp,0x20
   140001666:	mov    rdx,QWORD PTR [rcx+0x18]
   14000166a:	mov    rbx,rcx
   14000166d:	cmp    rdx,0xf
   140001671:	jbe    0x14000169f
   140001673:	mov    rcx,QWORD PTR [rcx]
   140001676:	inc    rdx
   140001679:	cmp    rdx,0x1000
   140001680:	jb     0x14000169a
   140001682:	mov    r8,QWORD PTR [rcx-0x8]
   140001686:	add    rdx,0x27
   14000168a:	sub    rcx,r8
   14000168d:	lea    rax,[rcx-0x8]
   140001691:	cmp    rax,0x1f
   140001695:	ja     0x1400016b8
   140001697:	mov    rcx,r8
   14000169a:	call   0x14000206c
   14000169f:	mov    QWORD PTR [rbx+0x10],0x0
   1400016a7:	mov    QWORD PTR [rbx+0x18],0xf
   1400016af:	mov    BYTE PTR [rbx],0x0
   1400016b2:	add    rsp,0x20
   1400016b6:	pop    rbx
   1400016b7:	ret
   1400016b8:	call   QWORD PTR [rip+0x2bb2]        # 0x140004270
   1400016be:	int3
   1400016bf:	int3
   1400016c0:	mov    QWORD PTR [rsp+0x10],rbx
   1400016c5:	mov    QWORD PTR [rsp+0x18],rbp
   1400016ca:	mov    QWORD PTR [rsp+0x20],rsi
   1400016cf:	push   rdi
   1400016d0:	sub    rsp,0x40
   1400016d4:	mov    rax,QWORD PTR [rip+0x4965]        # 0x140006040
   1400016db:	xor    rax,rsp
   1400016de:	mov    QWORD PTR [rsp+0x38],rax
   1400016e3:	mov    rbp,rcx
   1400016e6:	xor    edx,edx
   1400016e8:	lea    rcx,[rsp+0x28]
   1400016ed:	call   QWORD PTR [rip+0x2a2d]        # 0x140004120
   1400016f3:	nop
   1400016f4:	mov    rax,QWORD PTR [rip+0x5085]        # 0x140006780
   1400016fb:	mov    QWORD PTR [rsp+0x20],rax
   140001700:	mov    rbx,QWORD PTR [rip+0x29e1]        # 0x1400040e8
   140001707:	cmp    QWORD PTR [rbx],0x0
   14000170b:	jne    0x14000173a
   14000170d:	xor    edx,edx
   14000170f:	lea    rcx,[rsp+0x30]
   140001714:	call   QWORD PTR [rip+0x2a06]        # 0x140004120
   14000171a:	cmp    QWORD PTR [rbx],0x0
   14000171e:	jne    0x14000172f
   140001720:	mov    rax,QWORD PTR [rip+0x29c9]        # 0x1400040f0
   140001727:	inc    DWORD PTR [rax]
   140001729:	movsxd rax,DWORD PTR [rax]
   14000172c:	mov    QWORD PTR [rbx],rax
   14000172f:	lea    rcx,[rsp+0x30]
   140001734:	call   QWORD PTR [rip+0x297e]        # 0x1400040b8
   14000173a:	mov    rsi,QWORD PTR [rbx]
   14000173d:	mov    rcx,QWORD PTR [rbp+0x8]
   140001741:	lea    rdi,[rsi*8+0x0]
   140001749:	cmp    rsi,QWORD PTR [rcx+0x18]
   14000174d:	jae    0x14000175e
   14000174f:	mov    rax,QWORD PTR [rcx+0x10]
   140001753:	mov    rbx,QWORD PTR [rdi+rax*1]
   140001757:	test   rbx,rbx
   14000175a:	jne    0x1400017c4
   14000175c:	jmp    0x140001760
   14000175e:	xor    ebx,ebx
   140001760:	cmp    BYTE PTR [rcx+0x24],0x0
   140001764:	je     0x14000177a
   140001766:	call   QWORD PTR [rip+0x29a4]        # 0x140004110
   14000176c:	cmp    rsi,QWORD PTR [rax+0x18]
   140001770:	jae    0x14000177f
   140001772:	mov    rax,QWORD PTR [rax+0x10]
   140001776:	mov    rbx,QWORD PTR [rdi+rax*1]
   14000177a:	test   rbx,rbx
   14000177d:	jne    0x1400017c4
   14000177f:	mov    rbx,QWORD PTR [rsp+0x20]
   140001784:	test   rbx,rbx
   140001787:	jne    0x1400017c4
   140001789:	mov    rdx,rbp
   14000178c:	lea    rcx,[rsp+0x20]
   140001791:	call   QWORD PTR [rip+0x2911]        # 0x1400040a8
   140001797:	cmp    rax,0xffffffffffffffff
   14000179b:	je     0x1400017f4
   14000179d:	mov    rbx,QWORD PTR [rsp+0x20]
   1400017a2:	mov    QWORD PTR [rsp+0x30],rbx
   1400017a7:	mov    rcx,rbx
   1400017aa:	call   0x140001fbc
   1400017af:	mov    rax,QWORD PTR [rbx]
   1400017b2:	mov    rcx,rbx
   1400017b5:	call   QWORD PTR [rax+0x8]
   1400017b8:	mov    rbx,QWORD PTR [rsp+0x20]
   1400017bd:	mov    QWORD PTR [rip+0x4fbc],rbx        # 0x140006780
   1400017c4:	lea    rcx,[rsp+0x28]
   1400017c9:	call   QWORD PTR [rip+0x28e9]        # 0x1400040b8
   1400017cf:	mov    rax,rbx
   1400017d2:	mov    rcx,QWORD PTR [rsp+0x38]
   1400017d7:	xor    rcx,rsp
   1400017da:	call   0x140002010
   1400017df:	mov    rbx,QWORD PTR [rsp+0x58]
   1400017e4:	mov    rbp,QWORD PTR [rsp+0x60]
   1400017e9:	mov    rsi,QWORD PTR [rsp+0x68]
   1400017ee:	add    rsp,0x40
   1400017f2:	pop    rdi
   1400017f3:	ret
   1400017f4:	call   0x140001200
   1400017f9:	nop
   1400017fa:	int3
   1400017fb:	int3
   1400017fc:	int3
   1400017fd:	int3
   1400017fe:	int3
   1400017ff:	int3
   140001800:	mov    QWORD PTR [rsp+0x18],rbx
   140001805:	mov    QWORD PTR [rsp+0x20],rsi
   14000180a:	push   rdi
   14000180b:	push   r12
   14000180d:	push   r13
   14000180f:	push   r14
   140001811:	push   r15
   140001813:	sub    rsp,0x50
   140001817:	mov    rbx,rdx
   14000181a:	mov    rdi,rcx
   14000181d:	mov    QWORD PTR [rsp+0x28],rcx
   140001822:	xor    esi,esi
   140001824:	mov    DWORD PTR [rsp+0x24],esi
   140001828:	xor    r15b,r15b
   14000182b:	mov    BYTE PTR [rsp+0x20],r15b
   140001830:	mov    r12,rcx
   140001833:	mov    QWORD PTR [rsp+0x30],rcx
   140001838:	mov    rax,QWORD PTR [rcx]
   14000183b:	movsxd rcx,DWORD PTR [rax+0x4]
   14000183f:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001844:	test   rcx,rcx
   140001847:	je     0x140001850
   140001849:	mov    rax,QWORD PTR [rcx]
   14000184c:	call   QWORD PTR [rax+0x8]
   14000184f:	nop
   140001850:	xor    edx,edx
   140001852:	mov    rcx,rdi
   140001855:	call   QWORD PTR [rip+0x286d]        # 0x1400040c8
   14000185b:	mov    BYTE PTR [rsp+0x38],al
   14000185f:	test   al,al
   140001861:	je     0x14000197b
   140001867:	mov    rax,QWORD PTR [rdi]
   14000186a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000186e:	add    rcx,rdi
   140001871:	lea    rdx,[rsp+0x40]
   140001876:	call   QWORD PTR [rip+0x2814]        # 0x140004090
   14000187c:	nop
   14000187d:	mov    rcx,rax
   140001880:	call   0x1400016c0
   140001885:	mov    r13,rax
   140001888:	mov    rcx,QWORD PTR [rsp+0x48]
   14000188d:	test   rcx,rcx
   140001890:	je     0x1400018aa
   140001892:	mov    rax,QWORD PTR [rcx]
   140001895:	call   QWORD PTR [rax+0x10]
   140001898:	mov    rcx,rax
   14000189b:	test   rax,rax
   14000189e:	je     0x1400018aa
   1400018a0:	mov    rax,QWORD PTR [rax]
   1400018a3:	mov    edx,0x1
   1400018a8:	call   QWORD PTR [rax]
   1400018aa:	mov    QWORD PTR [rbx+0x10],0x0
   1400018b2:	mov    rax,rbx
   1400018b5:	cmp    QWORD PTR [rbx+0x18],0xf
   1400018ba:	jbe    0x1400018bf
   1400018bc:	mov    rax,QWORD PTR [rbx]
   1400018bf:	mov    BYTE PTR [rax],0x0
   1400018c2:	mov    rax,QWORD PTR [rdi]
   1400018c5:	movsxd rcx,DWORD PTR [rax+0x4]
   1400018c9:	mov    r14,QWORD PTR [rcx+rdi*1+0x28]
   1400018ce:	movabs rax,0x7fffffffffffffff
   1400018d8:	test   r14,r14
   1400018db:	jle    0x1400018e2
   1400018dd:	cmp    r14,rax
   1400018e0:	jb     0x1400018e5
   1400018e2:	mov    r14,rax
   1400018e5:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400018ea:	call   QWORD PTR [rip+0x27d0]        # 0x1400040c0
   1400018f0:	test   r14,r14
   1400018f3:	je     0x140001903
   1400018f5:	cmp    eax,0xffffffff
   1400018f8:	jne    0x140001905
   1400018fa:	mov    esi,0x1
   1400018ff:	mov    DWORD PTR [rsp+0x24],esi
   140001903:	jmp    0x14000197b
   140001905:	movzx  r9d,al
   140001909:	mov    rax,QWORD PTR [r13+0x18]
   14000190d:	test   BYTE PTR [rax+r9*2],0x48
   140001912:	jne    0x140001903
   140001914:	mov    rcx,QWORD PTR [rbx+0x10]
   140001918:	mov    rdx,QWORD PTR [rbx+0x18]
   14000191c:	cmp    rcx,rdx
   14000191f:	jae    0x140001940
   140001921:	lea    rax,[rcx+0x1]
   140001925:	mov    QWORD PTR [rbx+0x10],rax
   140001929:	mov    rax,rbx
   14000192c:	cmp    rdx,0xf
   140001930:	jbe    0x140001935
   140001932:	mov    rax,QWORD PTR [rbx]
   140001935:	mov    BYTE PTR [rax+rcx*1],r9b
   140001939:	mov    BYTE PTR [rax+rcx*1+0x1],0x0
   14000193e:	jmp    0x140001948
   140001940:	mov    rcx,rbx
   140001943:	call   0x140001d90
   140001948:	mov    r15b,0x1
   14000194b:	mov    BYTE PTR [rsp+0x20],r15b
   140001950:	dec    r14
   140001953:	mov    rax,QWORD PTR [rdi]
   140001956:	movsxd rcx,DWORD PTR [rax+0x4]
   14000195a:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   14000195f:	call   QWORD PTR [rip+0x2733]        # 0x140004098
   140001965:	jmp    0x1400018f0
   140001967:	mov    esi,DWORD PTR [rsp+0x24]
   14000196b:	movzx  r15d,BYTE PTR [rsp+0x20]
   140001971:	mov    r12,QWORD PTR [rsp+0x30]
   140001976:	mov    rdi,QWORD PTR [rsp+0x28]
   14000197b:	mov    rax,QWORD PTR [rdi]
   14000197e:	movsxd rcx,DWORD PTR [rax+0x4]
   140001982:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   14000198b:	test   r15b,r15b
   14000198e:	jne    0x140001993
   140001990:	or     esi,0x2
   140001993:	mov    rax,QWORD PTR [rdi]
   140001996:	movsxd rcx,DWORD PTR [rax+0x4]
   14000199a:	add    rcx,rdi
   14000199d:	xor    r8d,r8d
   1400019a0:	mov    edx,esi
   1400019a2:	call   QWORD PTR [rip+0x26d8]        # 0x140004080
   1400019a8:	nop
   1400019a9:	mov    rcx,QWORD PTR [r12]
   1400019ad:	movsxd rdx,DWORD PTR [rcx+0x4]
   1400019b1:	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   1400019b6:	test   rcx,rcx
   1400019b9:	je     0x1400019c2
   1400019bb:	mov    rdx,QWORD PTR [rcx]
   1400019be:	call   QWORD PTR [rdx+0x10]
   1400019c1:	nop
   1400019c2:	mov    rax,rdi
   1400019c5:	lea    r11,[rsp+0x50]
   1400019ca:	mov    rbx,QWORD PTR [r11+0x40]
   1400019ce:	mov    rsi,QWORD PTR [r11+0x48]
   1400019d2:	mov    rsp,r11
   1400019d5:	pop    r15
   1400019d7:	pop    r14
   1400019d9:	pop    r13
   1400019db:	pop    r12
   1400019dd:	pop    rdi
   1400019de:	ret
   1400019df:	int3
   1400019e0:	mov    QWORD PTR [rsp+0x10],rbx
   1400019e5:	mov    QWORD PTR [rsp+0x8],rcx
   1400019ea:	push   rsi
   1400019eb:	push   rdi
   1400019ec:	push   r12
   1400019ee:	push   r14
   1400019f0:	push   r15
   1400019f2:	sub    rsp,0x30
   1400019f6:	mov    r15,rdx
   1400019f9:	mov    rsi,rcx
   1400019fc:	xor    ebx,ebx
   1400019fe:	mov    DWORD PTR [rsp+0x70],ebx
   140001a02:	mov    r14,0xffffffffffffffff
   140001a09:	nop    DWORD PTR [rax+0x0]
   140001a10:	inc    r14
   140001a13:	cmp    BYTE PTR [rdx+r14*1],bl
   140001a17:	jne    0x140001a10
   140001a19:	mov    rax,QWORD PTR [rcx]
   140001a1c:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a20:	mov    rdi,QWORD PTR [rcx+rsi*1+0x28]
   140001a25:	test   rdi,rdi
   140001a28:	jle    0x140001a34
   140001a2a:	cmp    rdi,r14
   140001a2d:	jle    0x140001a34
   140001a2f:	sub    rdi,r14
   140001a32:	jmp    0x140001a36
   140001a34:	xor    edi,edi
   140001a36:	mov    r12,rsi
   140001a39:	mov    QWORD PTR [rsp+0x20],rsi
   140001a3e:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001a43:	test   rcx,rcx
   140001a46:	je     0x140001a4f
   140001a48:	mov    rax,QWORD PTR [rcx]
   140001a4b:	call   QWORD PTR [rax+0x8]
   140001a4e:	nop
   140001a4f:	mov    rax,QWORD PTR [rsi]
   140001a52:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a56:	add    rcx,rsi
   140001a59:	call   QWORD PTR [rip+0x2641]        # 0x1400040a0
   140001a5f:	test   al,al
   140001a61:	je     0x140001a93
   140001a63:	mov    rax,QWORD PTR [rsi]
   140001a66:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a6a:	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   140001a6f:	test   rcx,rcx
   140001a72:	je     0x140001a91
   140001a74:	cmp    rcx,rsi
   140001a77:	je     0x140001a91
   140001a79:	call   QWORD PTR [rip+0x2651]        # 0x1400040d0
   140001a7f:	mov    rax,QWORD PTR [rsi]
   140001a82:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a86:	add    rcx,rsi
   140001a89:	call   QWORD PTR [rip+0x2611]        # 0x1400040a0
   140001a8f:	jmp    0x140001a93
   140001a91:	mov    al,0x1
   140001a93:	mov    BYTE PTR [rsp+0x28],al
   140001a97:	test   al,al
   140001a99:	jne    0x140001aa5
   140001a9b:	mov    ebx,0x4
   140001aa0:	jmp    0x140001b5d
   140001aa5:	mov    rax,QWORD PTR [rsi]
   140001aa8:	movsxd rax,DWORD PTR [rax+0x4]
   140001aac:	mov    eax,DWORD PTR [rax+rsi*1+0x18]
   140001ab0:	and    eax,0x1c0
   140001ab5:	cmp    eax,0x40
   140001ab8:	je     0x140001aed
   140001aba:	nop    WORD PTR [rax+rax*1+0x0]
   140001ac0:	test   rdi,rdi
   140001ac3:	jle    0x140001aed
   140001ac5:	mov    rax,QWORD PTR [rsi]
   140001ac8:	movsxd rcx,DWORD PTR [rax+0x4]
   140001acc:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001ad1:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001ad6:	call   QWORD PTR [rip+0x25ac]        # 0x140004088
   140001adc:	cmp    eax,0xffffffff
   140001adf:	jne    0x140001ae8
   140001ae1:	mov    ebx,0x4
   140001ae6:	jmp    0x140001b39
   140001ae8:	dec    rdi
   140001aeb:	jmp    0x140001ac0
   140001aed:	mov    rax,QWORD PTR [rsi]
   140001af0:	movsxd rcx,DWORD PTR [rax+0x4]
   140001af4:	mov    r8,r14
   140001af7:	mov    rdx,r15
   140001afa:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001aff:	call   QWORD PTR [rip+0x25fb]        # 0x140004100
   140001b05:	cmp    rax,r14
   140001b08:	jne    0x140001b36
   140001b0a:	nop    WORD PTR [rax+rax*1+0x0]
   140001b10:	test   rdi,rdi
   140001b13:	jle    0x140001b3d
   140001b15:	mov    rax,QWORD PTR [rsi]
   140001b18:	movsxd rcx,DWORD PTR [rax+0x4]
   140001b1c:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001b21:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001b26:	call   QWORD PTR [rip+0x255c]        # 0x140004088
   140001b2c:	cmp    eax,0xffffffff
   140001b2f:	je     0x140001b36
   140001b31:	dec    rdi
   140001b34:	jmp    0x140001b10
   140001b36:	or     ebx,0x4
   140001b39:	mov    DWORD PTR [rsp+0x70],ebx
   140001b3d:	mov    rax,QWORD PTR [rsi]
   140001b40:	movsxd rcx,DWORD PTR [rax+0x4]
   140001b44:	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   140001b4d:	jmp    0x140001b5d
   140001b4f:	mov    rsi,QWORD PTR [rsp+0x60]
   140001b54:	mov    ebx,DWORD PTR [rsp+0x70]
   140001b58:	mov    r12,QWORD PTR [rsp+0x20]
   140001b5d:	mov    rax,QWORD PTR [rsi]
   140001b60:	movsxd rcx,DWORD PTR [rax+0x4]
   140001b64:	add    rcx,rsi
   140001b67:	xor    r8d,r8d
   140001b6a:	mov    edx,ebx
   140001b6c:	call   QWORD PTR [rip+0x250e]        # 0x140004080
   140001b72:	nop
   140001b73:	call   QWORD PTR [rip+0x258f]        # 0x140004108
   140001b79:	test   al,al
   140001b7b:	jne    0x140001b87
   140001b7d:	mov    rcx,r12
   140001b80:	call   QWORD PTR [rip+0x2552]        # 0x1400040d8
   140001b86:	nop
   140001b87:	mov    rax,QWORD PTR [r12]
   140001b8b:	movsxd rcx,DWORD PTR [rax+0x4]
   140001b8f:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001b94:	test   rcx,rcx
   140001b97:	je     0x140001ba0
   140001b99:	mov    rax,QWORD PTR [rcx]
   140001b9c:	call   QWORD PTR [rax+0x10]
   140001b9f:	nop
   140001ba0:	mov    rax,rsi
   140001ba3:	mov    rbx,QWORD PTR [rsp+0x68]
   140001ba8:	add    rsp,0x30
   140001bac:	pop    r15
   140001bae:	pop    r14
   140001bb0:	pop    r12
   140001bb2:	pop    rdi
   140001bb3:	pop    rsi
   140001bb4:	ret
   140001bb5:	int3
   140001bb6:	int3
   140001bb7:	int3
   140001bb8:	int3
   140001bb9:	int3
   140001bba:	int3
   140001bbb:	int3
   140001bbc:	int3
   140001bbd:	int3
   140001bbe:	int3
   140001bbf:	int3
   140001bc0:	mov    QWORD PTR [rsp+0x10],rbx
   140001bc5:	mov    QWORD PTR [rsp+0x20],rsi
   140001bca:	mov    QWORD PTR [rsp+0x8],rcx
   140001bcf:	push   rdi
   140001bd0:	push   r14
   140001bd2:	push   r15
   140001bd4:	sub    rsp,0x30
   140001bd8:	movzx  r15d,dl
   140001bdc:	mov    rsi,rcx
   140001bdf:	xor    ebx,ebx
   140001be1:	mov    DWORD PTR [rsp+0x60],ebx
   140001be5:	mov    r14,rcx
   140001be8:	mov    QWORD PTR [rsp+0x20],rcx
   140001bed:	mov    rax,QWORD PTR [rcx]
   140001bf0:	movsxd r8,DWORD PTR [rax+0x4]
   140001bf4:	mov    rcx,QWORD PTR [r8+rcx*1+0x48]
   140001bf9:	test   rcx,rcx
   140001bfc:	je     0x140001c05
   140001bfe:	mov    rax,QWORD PTR [rcx]
   140001c01:	call   QWORD PTR [rax+0x8]
   140001c04:	nop
   140001c05:	mov    rax,QWORD PTR [rsi]
   140001c08:	movsxd rcx,DWORD PTR [rax+0x4]
   140001c0c:	add    rcx,rsi
   140001c0f:	call   QWORD PTR [rip+0x248b]        # 0x1400040a0
   140001c15:	test   al,al
   140001c17:	je     0x140001c49
   140001c19:	mov    rax,QWORD PTR [rsi]
   140001c1c:	movsxd rcx,DWORD PTR [rax+0x4]
   140001c20:	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   140001c25:	test   rcx,rcx
   140001c28:	je     0x140001c47
   140001c2a:	cmp    rcx,rsi
   140001c2d:	je     0x140001c47
   140001c2f:	call   QWORD PTR [rip+0x249b]        # 0x1400040d0
   140001c35:	mov    rax,QWORD PTR [rsi]
   140001c38:	movsxd rcx,DWORD PTR [rax+0x4]
   140001c3c:	add    rcx,rsi
   140001c3f:	call   QWORD PTR [rip+0x245b]        # 0x1400040a0
   140001c45:	jmp    0x140001c49
   140001c47:	mov    al,0x1
   140001c49:	mov    BYTE PTR [rsp+0x28],al
   140001c4d:	test   al,al
   140001c4f:	je     0x140001d26
   140001c55:	mov    rcx,QWORD PTR [rsi]
   140001c58:	movsxd rdx,DWORD PTR [rcx+0x4]
   140001c5c:	mov    r8,QWORD PTR [rdx+rsi*1+0x28]
   140001c61:	lea    rax,[r8-0x1]
   140001c65:	xor    edi,edi
   140001c67:	cmp    r8,0x1
   140001c6b:	cmovg  rdi,rax
   140001c6f:	mov    eax,DWORD PTR [rdx+rsi*1+0x18]
   140001c73:	and    eax,0x1c0
   140001c78:	cmp    eax,0x40
   140001c7b:	je     0x140001cbd
   140001c7d:	nop    DWORD PTR [rax]
   140001c80:	test   ebx,ebx
   140001c82:	jne    0x140001d16
   140001c88:	test   rdi,rdi
   140001c8b:	jle    0x140001cba
   140001c8d:	mov    rax,QWORD PTR [rsi]
   140001c90:	movsxd rcx,DWORD PTR [rax+0x4]
   140001c94:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001c99:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001c9e:	call   QWORD PTR [rip+0x23e4]        # 0x140004088
   140001ca4:	dec    rdi
   140001ca7:	mov    ecx,ebx
   140001ca9:	or     ecx,0x4
   140001cac:	cmp    eax,0xffffffff
   140001caf:	cmovne ecx,ebx
   140001cb2:	mov    ebx,ecx
   140001cb4:	mov    DWORD PTR [rsp+0x60],ecx
   140001cb8:	jmp    0x140001c80
   140001cba:	mov    rcx,QWORD PTR [rsi]
   140001cbd:	movsxd rcx,DWORD PTR [rcx+0x4]
   140001cc1:	movzx  edx,r15b
   140001cc5:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001cca:	call   QWORD PTR [rip+0x23b8]        # 0x140004088
   140001cd0:	mov    ecx,0x4
   140001cd5:	cmp    eax,0xffffffff
   140001cd8:	cmove  ebx,ecx
   140001cdb:	mov    DWORD PTR [rsp+0x60],ebx
   140001cdf:	nop
   140001ce0:	test   ebx,ebx
   140001ce2:	jne    0x140001d16
   140001ce4:	test   rdi,rdi
   140001ce7:	jle    0x140001d16
   140001ce9:	mov    rax,QWORD PTR [rsi]
   140001cec:	movsxd rcx,DWORD PTR [rax+0x4]
   140001cf0:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001cf5:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001cfa:	call   QWORD PTR [rip+0x2388]        # 0x140004088
   140001d00:	dec    rdi
   140001d03:	mov    ecx,ebx
   140001d05:	or     ecx,0x4
   140001d08:	cmp    eax,0xffffffff
   140001d0b:	cmovne ecx,ebx
   140001d0e:	mov    ebx,ecx
   140001d10:	mov    DWORD PTR [rsp+0x60],ecx
   140001d14:	jmp    0x140001ce0
   140001d16:	jmp    0x140001d26
   140001d18:	mov    rsi,QWORD PTR [rsp+0x50]
   140001d1d:	mov    ebx,DWORD PTR [rsp+0x60]
   140001d21:	mov    r14,QWORD PTR [rsp+0x20]
   140001d26:	mov    rax,QWORD PTR [rsi]
   140001d29:	movsxd rcx,DWORD PTR [rax+0x4]
   140001d2d:	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   140001d36:	mov    rax,QWORD PTR [rsi]
   140001d39:	movsxd rcx,DWORD PTR [rax+0x4]
   140001d3d:	add    rcx,rsi
   140001d40:	xor    r8d,r8d
   140001d43:	mov    edx,ebx
   140001d45:	call   QWORD PTR [rip+0x2335]        # 0x140004080
   140001d4b:	nop
   140001d4c:	call   QWORD PTR [rip+0x23b6]        # 0x140004108
   140001d52:	test   al,al
   140001d54:	jne    0x140001d60
   140001d56:	mov    rcx,r14
   140001d59:	call   QWORD PTR [rip+0x2379]        # 0x1400040d8
   140001d5f:	nop
   140001d60:	mov    rax,QWORD PTR [r14]
   140001d63:	movsxd rcx,DWORD PTR [rax+0x4]
   140001d67:	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   140001d6c:	test   rcx,rcx
   140001d6f:	je     0x140001d78
   140001d71:	mov    rax,QWORD PTR [rcx]
   140001d74:	call   QWORD PTR [rax+0x10]
   140001d77:	nop
   140001d78:	mov    rax,rsi
   140001d7b:	mov    rbx,QWORD PTR [rsp+0x58]
   140001d80:	mov    rsi,QWORD PTR [rsp+0x68]
   140001d85:	add    rsp,0x30
   140001d89:	pop    r15
   140001d8b:	pop    r14
   140001d8d:	pop    rdi
   140001d8e:	ret
   140001d8f:	int3
   140001d90:	rex push rbx
   140001d92:	push   rbp
   140001d93:	push   rsi
   140001d94:	push   r15
   140001d96:	sub    rsp,0x28
   140001d9a:	mov    rbp,QWORD PTR [rcx+0x10]
   140001d9e:	movabs rbx,0x7fffffffffffffff
   140001da8:	mov    rax,rbx
   140001dab:	movzx  r15d,r9b
   140001daf:	sub    rax,rbp
   140001db2:	mov    rsi,rcx
   140001db5:	cmp    rax,0x1
   140001db9:	jb     0x140001ee5
   140001dbf:	mov    QWORD PTR [rsp+0x58],rdi
   140001dc4:	mov    QWORD PTR [rsp+0x60],r12
   140001dc9:	lea    r12,[rbp+0x1]
   140001dcd:	mov    rdx,r12
   140001dd0:	mov    QWORD PTR [rsp+0x20],r14
   140001dd5:	mov    r14,QWORD PTR [rcx+0x18]
   140001dd9:	or     rdx,0xf
   140001ddd:	cmp    rdx,rbx
   140001de0:	ja     0x140001e26
   140001de2:	mov    rcx,r14
   140001de5:	mov    rax,rbx
   140001de8:	shr    rcx,1
   140001deb:	sub    rax,rcx
   140001dee:	cmp    r14,rax
   140001df1:	ja     0x140001e26
   140001df3:	lea    rax,[rcx+r14*1]
   140001df7:	mov    rbx,rdx
   140001dfa:	cmp    rdx,rax
   140001dfd:	cmovb  rbx,rax
   140001e01:	lea    rcx,[rbx+0x1]
   140001e05:	test   rcx,rcx
   140001e08:	jne    0x140001e0e
   140001e0a:	xor    edi,edi
   140001e0c:	jmp    0x140001e57
   140001e0e:	cmp    rcx,0x1000
   140001e15:	jb     0x140001e4f
   140001e17:	lea    rax,[rcx+0x27]
   140001e1b:	cmp    rax,rcx
   140001e1e:	jbe    0x140001eeb
   140001e24:	jmp    0x140001e34
   140001e26:	movabs rax,0x8000000000000000
   140001e30:	add    rax,0x27
   140001e34:	mov    rcx,rax
   140001e37:	call   0x140002030
   140001e3c:	test   rax,rax
   140001e3f:	je     0x140001eae
   140001e41:	lea    rdi,[rax+0x27]
   140001e45:	and    rdi,0xffffffffffffffe0
   140001e49:	mov    QWORD PTR [rdi-0x8],rax
   140001e4d:	jmp    0x140001e57
   140001e4f:	call   0x140002030
   140001e54:	mov    rdi,rax
   140001e57:	mov    QWORD PTR [rsi+0x10],r12
   140001e5b:	mov    r8,rbp
   140001e5e:	mov    QWORD PTR [rsi+0x18],rbx
   140001e62:	mov    rcx,rdi
   140001e65:	cmp    r14,0xf
   140001e69:	jbe    0x140001eb5
   140001e6b:	mov    rbx,QWORD PTR [rsi]
   140001e6e:	mov    rdx,rbx
   140001e71:	call   0x140002f43
   140001e76:	lea    rdx,[r14+0x1]
   140001e7a:	mov    BYTE PTR [rdi+rbp*1],r15b
   140001e7e:	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001e83:	cmp    rdx,0x1000
   140001e8a:	jb     0x140001ea4
   140001e8c:	mov    rcx,QWORD PTR [rbx-0x8]
   140001e90:	add    rdx,0x27
   140001e94:	sub    rbx,rcx
   140001e97:	lea    rax,[rbx-0x8]
   140001e9b:	cmp    rax,0x1f
   140001e9f:	ja     0x140001eae
   140001ea1:	mov    rbx,rcx
   140001ea4:	mov    rcx,rbx
   140001ea7:	call   0x14000206c
   140001eac:	jmp    0x140001ec6
   140001eae:	call   QWORD PTR [rip+0x23bc]        # 0x140004270
   140001eb4:	int3
   140001eb5:	mov    rdx,rsi
   140001eb8:	call   0x140002f43
   140001ebd:	mov    BYTE PTR [rdi+rbp*1],r15b
   140001ec1:	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001ec6:	mov    QWORD PTR [rsi],rdi
   140001ec9:	mov    rax,rsi
   140001ecc:	mov    r12,QWORD PTR [rsp+0x60]
   140001ed1:	mov    rdi,QWORD PTR [rsp+0x58]
   140001ed6:	mov    r14,QWORD PTR [rsp+0x20]
   140001edb:	add    rsp,0x28
   140001edf:	pop    r15
   140001ee1:	pop    rsi
   140001ee2:	pop    rbp
   140001ee3:	pop    rbx
   140001ee4:	ret
   140001ee5:	call   0x1400011b0
   140001eea:	int3
   140001eeb:	call   0x140001110
   140001ef0:	int3
   140001ef1:	int3
   140001ef2:	int3
   140001ef3:	int3
   140001ef4:	int3
   140001ef5:	int3
   140001ef6:	int3
   140001ef7:	int3
   140001ef8:	int3
   140001ef9:	int3
   140001efa:	int3
   140001efb:	int3
   140001efc:	int3
   140001efd:	int3
   140001efe:	int3
   140001eff:	int3
   140001f00:	sub    rsp,0x28
   140001f04:	mov    rcx,QWORD PTR [rcx]
   140001f07:	mov    rax,QWORD PTR [rcx]
   140001f0a:	movsxd rdx,DWORD PTR [rax+0x4]
   140001f0e:	mov    rcx,QWORD PTR [rdx+rcx*1+0x48]
   140001f13:	test   rcx,rcx
   140001f16:	je     0x140001f1f
   140001f18:	mov    rax,QWORD PTR [rcx]
   140001f1b:	call   QWORD PTR [rax+0x10]
   140001f1e:	nop
   140001f1f:	add    rsp,0x28
   140001f23:	ret
   140001f24:	int3
   140001f25:	int3
   140001f26:	int3
   140001f27:	int3
   140001f28:	int3
   140001f29:	int3
   140001f2a:	int3
   140001f2b:	int3
   140001f2c:	int3
   140001f2d:	int3
   140001f2e:	int3
   140001f2f:	int3
   140001f30:	rex push rbx
   140001f32:	sub    rsp,0x20
   140001f36:	mov    rbx,rcx
   140001f39:	call   QWORD PTR [rip+0x21c9]        # 0x140004108
   140001f3f:	test   al,al
   140001f41:	jne    0x140001f4d
   140001f43:	mov    rcx,QWORD PTR [rbx]
   140001f46:	call   QWORD PTR [rip+0x218c]        # 0x1400040d8
   140001f4c:	nop
   140001f4d:	mov    rcx,QWORD PTR [rbx]
   140001f50:	mov    rax,QWORD PTR [rcx]
   140001f53:	movsxd rdx,DWORD PTR [rax+0x4]
   140001f57:	mov    rcx,QWORD PTR [rdx+rcx*1+0x48]
   140001f5c:	test   rcx,rcx
   140001f5f:	je     0x140001f68
   140001f61:	mov    rax,QWORD PTR [rcx]
   140001f64:	call   QWORD PTR [rax+0x10]
   140001f67:	nop
   140001f68:	add    rsp,0x20
   140001f6c:	pop    rbx
   140001f6d:	ret
   140001f6e:	int3
   140001f6f:	int3
   140001f70:	sub    rsp,0x28
   140001f74:	mov    rdx,QWORD PTR [rcx]
   140001f77:	mov    rax,QWORD PTR [rdx]
   140001f7a:	movsxd rcx,DWORD PTR [rax+0x4]
   140001f7e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001f83:	test   rcx,rcx
   140001f86:	je     0x140001f8f
   140001f88:	mov    rax,QWORD PTR [rcx]
   140001f8b:	call   QWORD PTR [rax+0x10]
   140001f8e:	nop
   140001f8f:	add    rsp,0x28
   140001f93:	ret
   140001f94:	int3
   140001f95:	int3
   140001f96:	int3
   140001f97:	int3
   140001f98:	int3
   140001f99:	int3
   140001f9a:	int3
   140001f9b:	int3
   140001f9c:	int3
   140001f9d:	int3
   140001f9e:	int3
   140001f9f:	int3
   140001fa0:	mov    rcx,QWORD PTR [rcx]
   140001fa3:	test   rcx,rcx
   140001fa6:	je     0x140001fb3
   140001fa8:	mov    rax,QWORD PTR [rcx]
   140001fab:	mov    edx,0x1
   140001fb0:	rex.W jmp QWORD PTR [rax]
   140001fb3:	ret
   140001fb4:	jmp    QWORD PTR [rip+0x20fe]        # 0x1400040b8
   140001fba:	int3
   140001fbb:	int3
   140001fbc:	rex push rbx
   140001fbe:	sub    rsp,0x20
   140001fc2:	mov    rbx,rcx
   140001fc5:	mov    ecx,0x10
   140001fca:	call   QWORD PTR [rip+0x21d0]        # 0x1400041a0
   140001fd0:	mov    rdx,rax
   140001fd3:	test   rax,rax
   140001fd6:	je     0x140001ff3
   140001fd8:	mov    rax,QWORD PTR [rip+0x41a1]        # 0x140006180
   140001fdf:	mov    QWORD PTR [rdx],rax
   140001fe2:	mov    QWORD PTR [rdx+0x8],rbx
   140001fe6:	mov    QWORD PTR [rip+0x4193],rdx        # 0x140006180
   140001fed:	add    rsp,0x20
   140001ff1:	pop    rbx
   140001ff2:	ret
   140001ff3:	call   0x140001ff9
   140001ff8:	int3
   140001ff9:	jmp    QWORD PTR [rip+0x20b1]        # 0x1400040b0
   140001fff:	int3
   140002000:	int3
   140002001:	int3
   140002002:	int3
   140002003:	int3
   140002004:	int3
   140002005:	int3
   140002006:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002010:	cmp    rcx,QWORD PTR [rip+0x4029]        # 0x140006040
   140002017:	jne    0x140002029
   140002019:	rol    rcx,0x10
   14000201d:	test   cx,0xffff
   140002022:	jne    0x140002025
   140002024:	ret
   140002025:	ror    rcx,0x10
   140002029:	jmp    0x14000258c
   14000202e:	int3
   14000202f:	int3
   140002030:	rex push rbx
   140002032:	sub    rsp,0x20
   140002036:	mov    rbx,rcx
   140002039:	jmp    0x14000204a
   14000203b:	mov    rcx,rbx
   14000203e:	call   0x140002dd6
   140002043:	test   eax,eax
   140002045:	je     0x14000205a
   140002047:	mov    rcx,rbx
   14000204a:	call   0x140002dd0
   14000204f:	test   rax,rax
   140002052:	je     0x14000203b
   140002054:	add    rsp,0x20
   140002058:	pop    rbx
   140002059:	ret
   14000205a:	cmp    rbx,0xffffffffffffffff
   14000205e:	je     0x140002066
   140002060:	call   0x1400026f4
   140002065:	int3
   140002066:	call   0x140001110
   14000206b:	int3
   14000206c:	jmp    0x140002714
   140002071:	int3
   140002072:	int3
   140002073:	int3
   140002074:	rex push rbx
   140002076:	sub    rsp,0x20
   14000207a:	lea    rax,[rip+0x22c7]        # 0x140004348
   140002081:	mov    rbx,rcx
   140002084:	mov    QWORD PTR [rcx],rax
   140002087:	test   dl,0x1
   14000208a:	je     0x140002096
   14000208c:	mov    edx,0x18
   140002091:	call   0x14000206c
   140002096:	mov    rax,rbx
   140002099:	add    rsp,0x20
   14000209d:	pop    rbx
   14000209e:	ret
   14000209f:	int3
   1400020a0:	rex push rbx
   1400020a2:	sub    rsp,0x20
   1400020a6:	mov    ecx,0x1
   1400020ab:	call   0x140002de2
   1400020b0:	call   0x1400027d4
   1400020b5:	mov    ecx,eax
   1400020b7:	call   0x140002e18
   1400020bc:	call   0x1400027c8
   1400020c1:	mov    ebx,eax
   1400020c3:	call   0x140002e48
   1400020c8:	mov    ecx,0x1
   1400020cd:	mov    DWORD PTR [rax],ebx
   1400020cf:	call   0x14000238c
   1400020d4:	test   al,al
   1400020d6:	je     0x14000214b
   1400020d8:	call   0x140002a50
   1400020dd:	lea    rcx,[rip+0x9a8]        # 0x140002a8c
   1400020e4:	call   0x14000253c
   1400020e9:	call   0x1400027cc
   1400020ee:	mov    ecx,eax
   1400020f0:	call   0x140002dee
   1400020f5:	test   eax,eax
   1400020f7:	jne    0x14000214b
   1400020f9:	call   0x1400027dc
   1400020fe:	call   0x14000281c
   140002103:	test   eax,eax
   140002105:	je     0x140002113
   140002107:	lea    rcx,[rip+0x6ba]        # 0x1400027c8
   14000210e:	call   0x140002de8
   140002113:	call   0x140002554
   140002118:	call   0x140002554
   14000211d:	call   0x1400027c8
   140002122:	mov    ecx,eax
   140002124:	call   0x140002e3c
   140002129:	call   0x1400027ec
   14000212e:	test   al,al
   140002130:	je     0x140002137
   140002132:	call   0x140002df4
   140002137:	call   0x1400027c8
   14000213c:	call   0x140002988
   140002141:	test   eax,eax
   140002143:	jne    0x14000214b
   140002145:	add    rsp,0x20
   140002149:	pop    rbx
   14000214a:	ret
   14000214b:	mov    ecx,0x7
   140002150:	call   0x140002840
   140002155:	int3
   140002156:	int3
   140002157:	int3
   140002158:	sub    rsp,0x28
   14000215c:	call   0x140002800
   140002161:	xor    eax,eax
   140002163:	add    rsp,0x28
   140002167:	ret
   140002168:	sub    rsp,0x28
   14000216c:	call   0x1400029e4
   140002171:	call   0x1400027c8
   140002176:	mov    ecx,eax
   140002178:	add    rsp,0x28
   14000217c:	jmp    0x140002e42
   140002181:	int3
   140002182:	int3
   140002183:	int3
   140002184:	mov    QWORD PTR [rsp+0x8],rbx
   140002189:	mov    QWORD PTR [rsp+0x10],rsi
   14000218e:	push   rdi
   14000218f:	sub    rsp,0x30
   140002193:	mov    ecx,0x1
   140002198:	call   0x140002350
   14000219d:	test   al,al
   14000219f:	je     0x1400022db
   1400021a5:	xor    sil,sil
   1400021a8:	mov    BYTE PTR [rsp+0x20],sil
   1400021ad:	call   0x140002314
   1400021b2:	mov    bl,al
   1400021b4:	mov    ecx,DWORD PTR [rip+0x3fd6]        # 0x140006190
   1400021ba:	cmp    ecx,0x1
   1400021bd:	je     0x1400022e6
   1400021c3:	test   ecx,ecx
   1400021c5:	jne    0x140002211
   1400021c7:	mov    DWORD PTR [rip+0x3fbf],0x1        # 0x140006190
   1400021d1:	lea    rdx,[rip+0x2138]        # 0x140004310
   1400021d8:	lea    rcx,[rip+0x2119]        # 0x1400042f8
   1400021df:	call   0x140002e06
   1400021e4:	test   eax,eax
   1400021e6:	je     0x1400021f2
   1400021e8:	mov    eax,0xff
   1400021ed:	jmp    0x1400022cb
   1400021f2:	lea    rdx,[rip+0x20f7]        # 0x1400042f0
   1400021f9:	lea    rcx,[rip+0x20d8]        # 0x1400042d8
   140002200:	call   0x140002e00
   140002205:	mov    DWORD PTR [rip+0x3f81],0x2        # 0x140006190
   14000220f:	jmp    0x140002219
   140002211:	mov    sil,0x1
   140002214:	mov    BYTE PTR [rsp+0x20],sil
   140002219:	mov    cl,bl
   14000221b:	call   0x1400024b0
   140002220:	call   0x140002828
   140002225:	mov    rbx,rax
   140002228:	cmp    QWORD PTR [rax],0x0
   14000222c:	je     0x14000224c
   14000222e:	mov    rcx,rax
   140002231:	call   0x140002418
   140002236:	test   al,al
   140002238:	je     0x14000224c
   14000223a:	xor    r8d,r8d
   14000223d:	lea    edx,[r8+0x2]
   140002241:	xor    ecx,ecx
   140002243:	mov    rax,QWORD PTR [rbx]
   140002246:	call   QWORD PTR [rip+0x2064]        # 0x1400042b0
   14000224c:	call   0x140002830
   140002251:	mov    rbx,rax
   140002254:	cmp    QWORD PTR [rax],0x0
   140002258:	je     0x14000226e
   14000225a:	mov    rcx,rax
   14000225d:	call   0x140002418
   140002262:	test   al,al
   140002264:	je     0x14000226e
   140002266:	mov    rcx,QWORD PTR [rbx]
   140002269:	call   0x140002e36
   14000226e:	call   0x140002dfa
   140002273:	mov    rdi,rax
   140002276:	call   0x140002e24
   14000227b:	mov    rbx,QWORD PTR [rax]
   14000227e:	call   0x140002e1e
   140002283:	mov    r8,rdi
   140002286:	mov    rdx,rbx
   140002289:	mov    ecx,DWORD PTR [rax]
   14000228b:	call   0x1400012a0
   140002290:	mov    ebx,eax
   140002292:	call   0x140002990
   140002297:	test   al,al
   140002299:	je     0x1400022f0
   14000229b:	test   sil,sil
   14000229e:	jne    0x1400022a5
   1400022a0:	call   0x140002e2a
   1400022a5:	xor    edx,edx
   1400022a7:	mov    cl,0x1
   1400022a9:	call   0x1400024d4
   1400022ae:	mov    eax,ebx
   1400022b0:	jmp    0x1400022cb
   1400022b2:	mov    ebx,eax
   1400022b4:	call   0x140002990
   1400022b9:	test   al,al
   1400022bb:	je     0x1400022f8
   1400022bd:	cmp    BYTE PTR [rsp+0x20],0x0
   1400022c2:	jne    0x1400022c9
   1400022c4:	call   0x140002e30
   1400022c9:	mov    eax,ebx
   1400022cb:	mov    rbx,QWORD PTR [rsp+0x40]
   1400022d0:	mov    rsi,QWORD PTR [rsp+0x48]
   1400022d5:	add    rsp,0x30
   1400022d9:	pop    rdi
   1400022da:	ret
   1400022db:	mov    ecx,0x7
   1400022e0:	call   0x140002840
   1400022e5:	nop
   1400022e6:	mov    ecx,0x7
   1400022eb:	call   0x140002840
   1400022f0:	mov    ecx,ebx
   1400022f2:	call   0x140002e0c
   1400022f7:	nop
   1400022f8:	mov    ecx,ebx
   1400022fa:	call   0x140002e12
   1400022ff:	nop
   140002300:	sub    rsp,0x28
   140002304:	call   0x14000271c
   140002309:	add    rsp,0x28
   14000230d:	jmp    0x140002184
   140002312:	int3
   140002313:	int3
   140002314:	sub    rsp,0x28
   140002318:	call   0x140002d94
   14000231d:	test   eax,eax
   14000231f:	je     0x140002342
   140002321:	mov    rax,QWORD PTR gs:0x30
   14000232a:	mov    rcx,QWORD PTR [rax+0x8]
   14000232e:	jmp    0x140002335
   140002330:	cmp    rcx,rax
   140002333:	je     0x140002349
   140002335:	xor    eax,eax
   140002337:	lock cmpxchg QWORD PTR [rip+0x3e58],rcx        # 0x140006198
   140002340:	jne    0x140002330
   140002342:	xor    al,al
   140002344:	add    rsp,0x28
   140002348:	ret
   140002349:	mov    al,0x1
   14000234b:	jmp    0x140002344
   14000234d:	int3
   14000234e:	int3
   14000234f:	int3
   140002350:	sub    rsp,0x28
   140002354:	test   ecx,ecx
   140002356:	jne    0x14000235f
   140002358:	mov    BYTE PTR [rip+0x3e41],0x1        # 0x1400061a0
   14000235f:	call   0x140002ac8
   140002364:	call   0x1400027ec
   140002369:	test   al,al
   14000236b:	jne    0x140002371
   14000236d:	xor    al,al
   14000236f:	jmp    0x140002385
   140002371:	call   0x1400027ec
   140002376:	test   al,al
   140002378:	jne    0x140002383
   14000237a:	xor    ecx,ecx
   14000237c:	call   0x1400027ec
   140002381:	jmp    0x14000236d
   140002383:	mov    al,0x1
   140002385:	add    rsp,0x28
   140002389:	ret
   14000238a:	int3
   14000238b:	int3
   14000238c:	rex push rbx
   14000238e:	sub    rsp,0x20
   140002392:	cmp    BYTE PTR [rip+0x3e08],0x0        # 0x1400061a1
   140002399:	mov    ebx,ecx
   14000239b:	jne    0x140002404
   14000239d:	cmp    ecx,0x1
   1400023a0:	ja     0x14000240c
   1400023a2:	call   0x140002d94
   1400023a7:	test   eax,eax
   1400023a9:	je     0x1400023d3
   1400023ab:	test   ebx,ebx
   1400023ad:	jne    0x1400023d3
   1400023af:	lea    rcx,[rip+0x3df2]        # 0x1400061a8
   1400023b6:	call   0x140002e4e
   1400023bb:	test   eax,eax
   1400023bd:	jne    0x1400023cf
   1400023bf:	lea    rcx,[rip+0x3dfa]        # 0x1400061c0
   1400023c6:	call   0x140002e4e
   1400023cb:	test   eax,eax
   1400023cd:	je     0x1400023fd
   1400023cf:	xor    al,al
   1400023d1:	jmp    0x140002406
   1400023d3:	movdqa xmm0,XMMWORD PTR [rip+0x1f75]        # 0x140004350
   1400023db:	or     rax,0xffffffffffffffff
   1400023df:	movdqu XMMWORD PTR [rip+0x3dc1],xmm0        # 0x1400061a8
   1400023e7:	mov    QWORD PTR [rip+0x3dca],rax        # 0x1400061b8
   1400023ee:	movdqu XMMWORD PTR [rip+0x3dca],xmm0        # 0x1400061c0
   1400023f6:	mov    QWORD PTR [rip+0x3dd3],rax        # 0x1400061d0
   1400023fd:	mov    BYTE PTR [rip+0x3d9d],0x1        # 0x1400061a1
   140002404:	mov    al,0x1
   140002406:	add    rsp,0x20
   14000240a:	pop    rbx
   14000240b:	ret
   14000240c:	mov    ecx,0x5
   140002411:	call   0x140002840
   140002416:	int3
   140002417:	int3
   140002418:	sub    rsp,0x18
   14000241c:	mov    r8,rcx
   14000241f:	mov    eax,0x5a4d
   140002424:	cmp    WORD PTR [rip+0xffffffffffffdbd5],ax        # 0x140000000
   14000242b:	jne    0x1400024a5
   14000242d:	movsxd rcx,DWORD PTR [rip+0xffffffffffffdc08]        # 0x14000003c
   140002434:	lea    rdx,[rip+0xffffffffffffdbc5]        # 0x140000000
   14000243b:	add    rcx,rdx
   14000243e:	cmp    DWORD PTR [rcx],0x4550
   140002444:	jne    0x1400024a5
   140002446:	mov    eax,0x20b
   14000244b:	cmp    WORD PTR [rcx+0x18],ax
   14000244f:	jne    0x1400024a5
   140002451:	sub    r8,rdx
   140002454:	movzx  edx,WORD PTR [rcx+0x14]
   140002458:	add    rdx,0x18
   14000245c:	add    rdx,rcx
   14000245f:	movzx  eax,WORD PTR [rcx+0x6]
   140002463:	lea    rcx,[rax+rax*4]
   140002467:	lea    r9,[rdx+rcx*8]
   14000246b:	mov    QWORD PTR [rsp],rdx
   14000246f:	cmp    rdx,r9
   140002472:	je     0x14000248c
   140002474:	mov    ecx,DWORD PTR [rdx+0xc]
   140002477:	cmp    r8,rcx
   14000247a:	jb     0x140002486
   14000247c:	mov    eax,DWORD PTR [rdx+0x8]
   14000247f:	add    eax,ecx
   140002481:	cmp    r8,rax
   140002484:	jb     0x14000248e
   140002486:	add    rdx,0x28
   14000248a:	jmp    0x14000246b
   14000248c:	xor    edx,edx
   14000248e:	test   rdx,rdx
   140002491:	jne    0x140002497
   140002493:	xor    al,al
   140002495:	jmp    0x1400024ab
   140002497:	cmp    DWORD PTR [rdx+0x24],0x0
   14000249b:	jge    0x1400024a1
   14000249d:	xor    al,al
   14000249f:	jmp    0x1400024ab
   1400024a1:	mov    al,0x1
   1400024a3:	jmp    0x1400024ab
   1400024a5:	xor    al,al
   1400024a7:	jmp    0x1400024ab
   1400024a9:	xor    al,al
   1400024ab:	add    rsp,0x18
   1400024af:	ret
   1400024b0:	rex push rbx
   1400024b2:	sub    rsp,0x20
   1400024b6:	mov    bl,cl
   1400024b8:	call   0x140002d94
   1400024bd:	xor    edx,edx
   1400024bf:	test   eax,eax
   1400024c1:	je     0x1400024ce
   1400024c3:	test   bl,bl
   1400024c5:	jne    0x1400024ce
   1400024c7:	xchg   QWORD PTR [rip+0x3cca],rdx        # 0x140006198
   1400024ce:	add    rsp,0x20
   1400024d2:	pop    rbx
   1400024d3:	ret
   1400024d4:	rex push rbx
   1400024d6:	sub    rsp,0x20
   1400024da:	cmp    BYTE PTR [rip+0x3cbf],0x0        # 0x1400061a0
   1400024e1:	mov    bl,cl
   1400024e3:	je     0x1400024e9
   1400024e5:	test   dl,dl
   1400024e7:	jne    0x1400024f5
   1400024e9:	call   0x1400027ec
   1400024ee:	mov    cl,bl
   1400024f0:	call   0x1400027ec
   1400024f5:	mov    al,0x1
   1400024f7:	add    rsp,0x20
   1400024fb:	pop    rbx
   1400024fc:	ret
   1400024fd:	int3
   1400024fe:	int3
   1400024ff:	int3
   140002500:	rex push rbx
   140002502:	sub    rsp,0x20
   140002506:	cmp    QWORD PTR [rip+0x3c9a],0xffffffffffffffff        # 0x1400061a8
   14000250e:	mov    rbx,rcx
   140002511:	jne    0x14000251a
   140002513:	call   0x140002e5a
   140002518:	jmp    0x140002529
   14000251a:	mov    rdx,rbx
   14000251d:	lea    rcx,[rip+0x3c84]        # 0x1400061a8
   140002524:	call   0x140002e54
   140002529:	xor    edx,edx
   14000252b:	test   eax,eax
   14000252d:	cmove  rdx,rbx
   140002531:	mov    rax,rdx
   140002534:	add    rsp,0x20
   140002538:	pop    rbx
   140002539:	ret
   14000253a:	int3
   14000253b:	int3
   14000253c:	sub    rsp,0x28
   140002540:	call   0x140002500
   140002545:	neg    rax
   140002548:	sbb    eax,eax
   14000254a:	neg    eax
   14000254c:	dec    eax
   14000254e:	add    rsp,0x28
   140002552:	ret
   140002553:	int3
   140002554:	ret    0x0
   140002557:	int3
   140002558:	rex push rbx
   14000255a:	sub    rsp,0x20
   14000255e:	mov    rbx,rcx
   140002561:	xor    ecx,ecx
   140002563:	call   QWORD PTR [rip+0x1ae7]        # 0x140004050
   140002569:	mov    rcx,rbx
   14000256c:	call   QWORD PTR [rip+0x1ae6]        # 0x140004058
   140002572:	call   QWORD PTR [rip+0x1ad0]        # 0x140004048
   140002578:	mov    rcx,rax
   14000257b:	mov    edx,0xc0000409
   140002580:	add    rsp,0x20
   140002584:	pop    rbx
   140002585:	rex.W jmp QWORD PTR [rip+0x1ab4]        # 0x140004040
   14000258c:	mov    QWORD PTR [rsp+0x8],rcx
   140002591:	sub    rsp,0x38
   140002595:	mov    ecx,0x17
   14000259a:	call   QWORD PTR [rip+0x1a98]        # 0x140004038
   1400025a0:	test   eax,eax
   1400025a2:	je     0x1400025ab
   1400025a4:	mov    ecx,0x2
   1400025a9:	int    0x29
   1400025ab:	lea    rcx,[rip+0x3cce]        # 0x140006280
   1400025b2:	call   0x140002660
   1400025b7:	mov    rax,QWORD PTR [rsp+0x38]
   1400025bc:	mov    QWORD PTR [rip+0x3db5],rax        # 0x140006378
   1400025c3:	lea    rax,[rsp+0x38]
   1400025c8:	add    rax,0x8
   1400025cc:	mov    QWORD PTR [rip+0x3d45],rax        # 0x140006318
   1400025d3:	mov    rax,QWORD PTR [rip+0x3d9e]        # 0x140006378
   1400025da:	mov    QWORD PTR [rip+0x3c0f],rax        # 0x1400061f0
   1400025e1:	mov    rax,QWORD PTR [rsp+0x40]
   1400025e6:	mov    QWORD PTR [rip+0x3d13],rax        # 0x140006300
   1400025ed:	mov    DWORD PTR [rip+0x3be9],0xc0000409        # 0x1400061e0
   1400025f7:	mov    DWORD PTR [rip+0x3be3],0x1        # 0x1400061e4
   140002601:	mov    DWORD PTR [rip+0x3bed],0x1        # 0x1400061f8
   14000260b:	mov    eax,0x8
   140002610:	imul   rax,rax,0x0
   140002614:	lea    rcx,[rip+0x3be5]        # 0x140006200
   14000261b:	mov    QWORD PTR [rcx+rax*1],0x2
   140002623:	mov    eax,0x8
   140002628:	imul   rax,rax,0x0
   14000262c:	mov    rcx,QWORD PTR [rip+0x3a0d]        # 0x140006040
   140002633:	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140002638:	mov    eax,0x8
   14000263d:	imul   rax,rax,0x1
   140002641:	mov    rcx,QWORD PTR [rip+0x3a38]        # 0x140006080
   140002648:	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   14000264d:	lea    rcx,[rip+0x1d0c]        # 0x140004360
   140002654:	call   0x140002558
   140002659:	nop
   14000265a:	add    rsp,0x38
   14000265e:	ret
   14000265f:	int3
   140002660:	rex push rbx
   140002662:	push   rsi
   140002663:	push   rdi
   140002664:	sub    rsp,0x40
   140002668:	mov    rbx,rcx
   14000266b:	call   QWORD PTR [rip+0x198f]        # 0x140004000
   140002671:	mov    rsi,QWORD PTR [rbx+0xf8]
   140002678:	xor    edi,edi
   14000267a:	xor    r8d,r8d
   14000267d:	lea    rdx,[rsp+0x60]
   140002682:	mov    rcx,rsi
   140002685:	call   QWORD PTR [rip+0x19dd]        # 0x140004068
   14000268b:	test   rax,rax
   14000268e:	je     0x1400026c9
   140002690:	and    QWORD PTR [rsp+0x38],0x0
   140002696:	lea    rcx,[rsp+0x68]
   14000269b:	mov    rdx,QWORD PTR [rsp+0x60]
   1400026a0:	mov    r9,rax
   1400026a3:	mov    QWORD PTR [rsp+0x30],rcx
   1400026a8:	mov    r8,rsi
   1400026ab:	lea    rcx,[rsp+0x70]
   1400026b0:	mov    QWORD PTR [rsp+0x28],rcx
   1400026b5:	xor    ecx,ecx
   1400026b7:	mov    QWORD PTR [rsp+0x20],rbx
   1400026bc:	call   QWORD PTR [rip+0x199e]        # 0x140004060
   1400026c2:	inc    edi
   1400026c4:	cmp    edi,0x2
   1400026c7:	jl     0x14000267a
   1400026c9:	add    rsp,0x40
   1400026cd:	pop    rdi
   1400026ce:	pop    rsi
   1400026cf:	pop    rbx
   1400026d0:	ret
   1400026d1:	int3
   1400026d2:	int3
   1400026d3:	int3
   1400026d4:	and    QWORD PTR [rcx+0x10],0x0
   1400026d9:	lea    rax,[rip+0x1cc0]        # 0x1400043a0
   1400026e0:	mov    QWORD PTR [rcx+0x8],rax
   1400026e4:	lea    rax,[rip+0x1ca5]        # 0x140004390
   1400026eb:	mov    QWORD PTR [rcx],rax
   1400026ee:	mov    rax,rcx
   1400026f1:	ret
   1400026f2:	int3
   1400026f3:	int3
   1400026f4:	sub    rsp,0x48
   1400026f8:	lea    rcx,[rsp+0x20]
   1400026fd:	call   0x1400026d4
   140002702:	lea    rdx,[rip+0x28ef]        # 0x140004ff8
   140002709:	lea    rcx,[rsp+0x20]
   14000270e:	call   0x140002db2
   140002713:	int3
   140002714:	jmp    0x140002dca
   140002719:	int3
   14000271a:	int3
   14000271b:	int3
   14000271c:	mov    QWORD PTR [rsp+0x18],rbx
   140002721:	push   rbp
   140002722:	mov    rbp,rsp
   140002725:	sub    rsp,0x30
   140002729:	mov    rax,QWORD PTR [rip+0x3910]        # 0x140006040
   140002730:	movabs rbx,0x2b992ddfa232
   14000273a:	cmp    rax,rbx
   14000273d:	jne    0x1400027b3
   14000273f:	and    QWORD PTR [rbp+0x10],0x0
   140002744:	lea    rcx,[rbp+0x10]
   140002748:	call   QWORD PTR [rip+0x1922]        # 0x140004070
   14000274e:	mov    rax,QWORD PTR [rbp+0x10]
   140002752:	mov    QWORD PTR [rbp-0x10],rax
   140002756:	call   QWORD PTR [rip+0x18c4]        # 0x140004020
   14000275c:	mov    eax,eax
   14000275e:	xor    QWORD PTR [rbp-0x10],rax
   140002762:	call   QWORD PTR [rip+0x18c0]        # 0x140004028
   140002768:	mov    eax,eax
   14000276a:	lea    rcx,[rbp+0x18]
   14000276e:	xor    QWORD PTR [rbp-0x10],rax
   140002772:	call   QWORD PTR [rip+0x18b8]        # 0x140004030
   140002778:	mov    eax,DWORD PTR [rbp+0x18]
   14000277b:	lea    rcx,[rbp-0x10]
   14000277f:	shl    rax,0x20
   140002783:	xor    rax,QWORD PTR [rbp+0x18]
   140002787:	xor    rax,QWORD PTR [rbp-0x10]
   14000278b:	xor    rax,rcx
   14000278e:	movabs rcx,0xffffffffffff
   140002798:	and    rax,rcx
   14000279b:	movabs rcx,0x2b992ddfa233
   1400027a5:	cmp    rax,rbx
   1400027a8:	cmove  rax,rcx
   1400027ac:	mov    QWORD PTR [rip+0x388d],rax        # 0x140006040
   1400027b3:	mov    rbx,QWORD PTR [rsp+0x50]
   1400027b8:	not    rax
   1400027bb:	mov    QWORD PTR [rip+0x38be],rax        # 0x140006080
   1400027c2:	add    rsp,0x30
   1400027c6:	pop    rbp
   1400027c7:	ret
   1400027c8:	xor    eax,eax
   1400027ca:	ret
   1400027cb:	int3
   1400027cc:	mov    eax,0x1
   1400027d1:	ret
   1400027d2:	int3
   1400027d3:	int3
   1400027d4:	mov    eax,0x4000
   1400027d9:	ret
   1400027da:	int3
   1400027db:	int3
   1400027dc:	lea    rcx,[rip+0x3f6d]        # 0x140006750
   1400027e3:	rex.W jmp QWORD PTR [rip+0x181e]        # 0x140004008
   1400027ea:	int3
   1400027eb:	int3
   1400027ec:	mov    al,0x1
   1400027ee:	ret
   1400027ef:	int3
   1400027f0:	lea    rax,[rip+0x3f69]        # 0x140006760
   1400027f7:	ret
   1400027f8:	lea    rax,[rip+0x3f69]        # 0x140006768
   1400027ff:	ret
   140002800:	sub    rsp,0x28
   140002804:	call   0x1400027f0
   140002809:	or     QWORD PTR [rax],0x24
   14000280d:	call   0x1400027f8
   140002812:	or     QWORD PTR [rax],0x2
   140002816:	add    rsp,0x28
   14000281a:	ret
   14000281b:	int3
   14000281c:	xor    eax,eax
   14000281e:	cmp    DWORD PTR [rip+0x3864],eax        # 0x140006088
   140002824:	sete   al
   140002827:	ret
   140002828:	lea    rax,[rip+0x3f61]        # 0x140006790
   14000282f:	ret
   140002830:	lea    rax,[rip+0x3f51]        # 0x140006788
   140002837:	ret
   140002838:	and    DWORD PTR [rip+0x3f31],0x0        # 0x140006770
   14000283f:	ret
   140002840:	mov    QWORD PTR [rsp+0x8],rbx
   140002845:	push   rbp
   140002846:	lea    rbp,[rsp-0x4c0]
   14000284e:	sub    rsp,0x5c0
   140002855:	mov    ebx,ecx
   140002857:	mov    ecx,0x17
   14000285c:	call   QWORD PTR [rip+0x17d6]        # 0x140004038
   140002862:	test   eax,eax
   140002864:	je     0x14000286a
   140002866:	mov    ecx,ebx
   140002868:	int    0x29
   14000286a:	mov    ecx,0x3
   14000286f:	call   0x140002838
   140002874:	xor    edx,edx
   140002876:	lea    rcx,[rbp-0x10]
   14000287a:	mov    r8d,0x4d0
   140002880:	call   0x140002dc4
   140002885:	lea    rcx,[rbp-0x10]
   140002889:	call   QWORD PTR [rip+0x1771]        # 0x140004000
   14000288f:	mov    rbx,QWORD PTR [rbp+0xe8]
   140002896:	lea    rdx,[rbp+0x4d8]
   14000289d:	mov    rcx,rbx
   1400028a0:	xor    r8d,r8d
   1400028a3:	call   QWORD PTR [rip+0x17bf]        # 0x140004068
   1400028a9:	test   rax,rax
   1400028ac:	je     0x1400028ea
   1400028ae:	and    QWORD PTR [rsp+0x38],0x0
   1400028b4:	lea    rcx,[rbp+0x4e0]
   1400028bb:	mov    rdx,QWORD PTR [rbp+0x4d8]
   1400028c2:	mov    r9,rax
   1400028c5:	mov    QWORD PTR [rsp+0x30],rcx
   1400028ca:	mov    r8,rbx
   1400028cd:	lea    rcx,[rbp+0x4e8]
   1400028d4:	mov    QWORD PTR [rsp+0x28],rcx
   1400028d9:	lea    rcx,[rbp-0x10]
   1400028dd:	mov    QWORD PTR [rsp+0x20],rcx
   1400028e2:	xor    ecx,ecx
   1400028e4:	call   QWORD PTR [rip+0x1776]        # 0x140004060
   1400028ea:	mov    rax,QWORD PTR [rbp+0x4c8]
   1400028f1:	lea    rcx,[rsp+0x50]
   1400028f6:	mov    QWORD PTR [rbp+0xe8],rax
   1400028fd:	xor    edx,edx
   1400028ff:	lea    rax,[rbp+0x4c8]
   140002906:	mov    r8d,0x98
   14000290c:	add    rax,0x8
   140002910:	mov    QWORD PTR [rbp+0x88],rax
   140002917:	call   0x140002dc4
   14000291c:	mov    rax,QWORD PTR [rbp+0x4c8]
   140002923:	mov    QWORD PTR [rsp+0x60],rax
   140002928:	mov    DWORD PTR [rsp+0x50],0x40000015
   140002930:	mov    DWORD PTR [rsp+0x54],0x1
   140002938:	call   QWORD PTR [rip+0x16d2]        # 0x140004010
   14000293e:	mov    ebx,eax
   140002940:	xor    ecx,ecx
   140002942:	lea    rax,[rsp+0x50]
   140002947:	mov    QWORD PTR [rsp+0x40],rax
   14000294c:	lea    rax,[rbp-0x10]
   140002950:	mov    QWORD PTR [rsp+0x48],rax
   140002955:	call   QWORD PTR [rip+0x16f5]        # 0x140004050
   14000295b:	lea    rcx,[rsp+0x40]
   140002960:	call   QWORD PTR [rip+0x16f2]        # 0x140004058
   140002966:	test   eax,eax
   140002968:	jne    0x140002977
   14000296a:	cmp    ebx,0x1
   14000296d:	je     0x140002977
   14000296f:	lea    ecx,[rax+0x3]
   140002972:	call   0x140002838
   140002977:	mov    rbx,QWORD PTR [rsp+0x5d0]
   14000297f:	add    rsp,0x5c0
   140002986:	pop    rbp
   140002987:	ret
   140002988:	jmp    0x1400027c8
   14000298d:	int3
   14000298e:	int3
   14000298f:	int3
   140002990:	sub    rsp,0x28
   140002994:	xor    ecx,ecx
   140002996:	call   QWORD PTR [rip+0x167c]        # 0x140004018
   14000299c:	test   rax,rax
   14000299f:	je     0x1400029da
   1400029a1:	mov    ecx,0x5a4d
   1400029a6:	cmp    WORD PTR [rax],cx
   1400029a9:	jne    0x1400029da
   1400029ab:	movsxd rcx,DWORD PTR [rax+0x3c]
   1400029af:	add    rcx,rax
   1400029b2:	cmp    DWORD PTR [rcx],0x4550
   1400029b8:	jne    0x1400029da
   1400029ba:	mov    eax,0x20b
   1400029bf:	cmp    WORD PTR [rcx+0x18],ax
   1400029c3:	jne    0x1400029da
   1400029c5:	cmp    DWORD PTR [rcx+0x84],0xe
   1400029cc:	jbe    0x1400029da
   1400029ce:	cmp    DWORD PTR [rcx+0xf8],0x0
   1400029d5:	setne  al
   1400029d8:	jmp    0x1400029dc
   1400029da:	xor    al,al
   1400029dc:	add    rsp,0x28
   1400029e0:	ret
   1400029e1:	int3
   1400029e2:	int3
   1400029e3:	int3
   1400029e4:	lea    rcx,[rip+0x9]        # 0x1400029f4
   1400029eb:	rex.W jmp QWORD PTR [rip+0x165e]        # 0x140004050
   1400029f2:	int3
   1400029f3:	int3
   1400029f4:	mov    QWORD PTR [rsp+0x8],rbx
   1400029f9:	push   rdi
   1400029fa:	sub    rsp,0x20
   1400029fe:	mov    rbx,QWORD PTR [rcx]
   140002a01:	mov    rdi,rcx
   140002a04:	cmp    DWORD PTR [rbx],0xe06d7363
   140002a0a:	jne    0x140002a28
   140002a0c:	cmp    DWORD PTR [rbx+0x18],0x4
   140002a10:	jne    0x140002a28
   140002a12:	mov    edx,DWORD PTR [rbx+0x20]
   140002a15:	lea    eax,[rdx-0x19930520]
   140002a1b:	cmp    eax,0x2
   140002a1e:	jbe    0x140002a35
   140002a20:	cmp    edx,0x1994000
   140002a26:	je     0x140002a35
   140002a28:	mov    rbx,QWORD PTR [rsp+0x30]
   140002a2d:	xor    eax,eax
   140002a2f:	add    rsp,0x20
   140002a33:	pop    rdi
   140002a34:	ret
   140002a35:	call   0x140002db8
   140002a3a:	mov    QWORD PTR [rax],rbx
   140002a3d:	mov    rbx,QWORD PTR [rdi+0x8]
   140002a41:	call   0x140002dbe
   140002a46:	mov    QWORD PTR [rax],rbx
   140002a49:	call   0x140002e60
   140002a4e:	int3
   140002a4f:	int3
   140002a50:	mov    QWORD PTR [rsp+0x8],rbx
   140002a55:	push   rdi
   140002a56:	sub    rsp,0x20
   140002a5a:	lea    rbx,[rip+0x220f]        # 0x140004c70
   140002a61:	lea    rdi,[rip+0x2208]        # 0x140004c70
   140002a68:	jmp    0x140002a7c
   140002a6a:	mov    rax,QWORD PTR [rbx]
   140002a6d:	test   rax,rax
   140002a70:	je     0x140002a78
   140002a72:	call   QWORD PTR [rip+0x1838]        # 0x1400042b0
   140002a78:	add    rbx,0x8
   140002a7c:	cmp    rbx,rdi
   140002a7f:	jb     0x140002a6a
   140002a81:	mov    rbx,QWORD PTR [rsp+0x30]
   140002a86:	add    rsp,0x20
   140002a8a:	pop    rdi
   140002a8b:	ret
   140002a8c:	mov    QWORD PTR [rsp+0x8],rbx
   140002a91:	push   rdi
   140002a92:	sub    rsp,0x20
   140002a96:	lea    rbx,[rip+0x21e3]        # 0x140004c80
   140002a9d:	lea    rdi,[rip+0x21dc]        # 0x140004c80
   140002aa4:	jmp    0x140002ab8
   140002aa6:	mov    rax,QWORD PTR [rbx]
   140002aa9:	test   rax,rax
   140002aac:	je     0x140002ab4
   140002aae:	call   QWORD PTR [rip+0x17fc]        # 0x1400042b0
   140002ab4:	add    rbx,0x8
   140002ab8:	cmp    rbx,rdi
   140002abb:	jb     0x140002aa6
   140002abd:	mov    rbx,QWORD PTR [rsp+0x30]
   140002ac2:	add    rsp,0x20
   140002ac6:	pop    rdi
   140002ac7:	ret
   140002ac8:	mov    QWORD PTR [rsp+0x10],rbx
   140002acd:	mov    QWORD PTR [rsp+0x18],rsi
   140002ad2:	push   rbp
   140002ad3:	push   rdi
   140002ad4:	push   r14
   140002ad6:	mov    rbp,rsp
   140002ad9:	sub    rsp,0x10
   140002add:	xor    eax,eax
   140002adf:	xor    ecx,ecx
   140002ae1:	cpuid
   140002ae3:	mov    r8d,ecx
   140002ae6:	mov    r10d,edx
   140002ae9:	xor    r10d,0x49656e69
   140002af0:	xor    r8d,0x6c65746e
   140002af7:	mov    r9d,ebx
   140002afa:	mov    r14d,eax
   140002afd:	xor    ecx,ecx
   140002aff:	mov    eax,0x1
   140002b04:	cpuid
   140002b06:	or     r10d,r8d
   140002b09:	mov    DWORD PTR [rbp-0x10],eax
   140002b0c:	xor    r9d,0x756e6547
   140002b13:	mov    DWORD PTR [rbp-0xc],ebx
   140002b16:	or     r10d,r9d
   140002b19:	mov    DWORD PTR [rbp-0x8],ecx
   140002b1c:	mov    edi,ecx
   140002b1e:	mov    DWORD PTR [rbp-0x4],edx
   140002b21:	jne    0x140002b7e
   140002b23:	or     QWORD PTR [rip+0x357d],0xffffffffffffffff        # 0x1400060a8
   140002b2b:	and    eax,0xfff3ff0
   140002b30:	mov    QWORD PTR [rip+0x3565],0x8000        # 0x1400060a0
   140002b3b:	cmp    eax,0x106c0
   140002b40:	je     0x140002b6a
   140002b42:	cmp    eax,0x20660
   140002b47:	je     0x140002b6a
   140002b49:	cmp    eax,0x20670
   140002b4e:	je     0x140002b6a
   140002b50:	add    eax,0xfffcf9b0
   140002b55:	cmp    eax,0x20
   140002b58:	ja     0x140002b7e
   140002b5a:	movabs rcx,0x100010001
   140002b64:	bt     rcx,rax
   140002b68:	jae    0x140002b7e
   140002b6a:	mov    r8d,DWORD PTR [rip+0x3c07]        # 0x140006778
   140002b71:	or     r8d,0x1
   140002b75:	mov    DWORD PTR [rip+0x3bfc],r8d        # 0x140006778
   140002b7c:	jmp    0x140002b85
   140002b7e:	mov    r8d,DWORD PTR [rip+0x3bf3]        # 0x140006778
   140002b85:	xor    r9d,r9d
   140002b88:	mov    esi,r9d
   140002b8b:	mov    r10d,r9d
   140002b8e:	mov    r11d,r9d
   140002b91:	cmp    r14d,0x7
   140002b95:	jl     0x140002bfc
   140002b97:	lea    eax,[r9+0x7]
   140002b9b:	xor    ecx,ecx
   140002b9d:	cpuid
   140002b9f:	mov    DWORD PTR [rbp-0x10],eax
   140002ba2:	mov    esi,edx
   140002ba4:	mov    DWORD PTR [rbp-0xc],ebx
   140002ba7:	mov    r9d,ebx
   140002baa:	mov    DWORD PTR [rbp-0x8],ecx
   140002bad:	mov    DWORD PTR [rbp-0x4],edx
   140002bb0:	bt     ebx,0x9
   140002bb4:	jae    0x140002bc1
   140002bb6:	or     r8d,0x2
   140002bba:	mov    DWORD PTR [rip+0x3bb7],r8d        # 0x140006778
   140002bc1:	cmp    eax,0x1
   140002bc4:	jl     0x140002bdf
   140002bc6:	mov    eax,0x7
   140002bcb:	lea    ecx,[rax-0x6]
   140002bce:	cpuid
   140002bd0:	mov    r10d,edx
   140002bd3:	mov    DWORD PTR [rbp-0x10],eax
   140002bd6:	mov    DWORD PTR [rbp-0xc],ebx
   140002bd9:	mov    DWORD PTR [rbp-0x8],ecx
   140002bdc:	mov    DWORD PTR [rbp-0x4],edx
   140002bdf:	mov    eax,0x24
   140002be4:	cmp    r14d,eax
   140002be7:	jl     0x140002bfc
   140002be9:	xor    ecx,ecx
   140002beb:	cpuid
   140002bed:	mov    r11d,ebx
   140002bf0:	mov    DWORD PTR [rbp-0x10],eax
   140002bf3:	mov    DWORD PTR [rbp-0xc],ebx
   140002bf6:	mov    DWORD PTR [rbp-0x8],ecx
   140002bf9:	mov    DWORD PTR [rbp-0x4],edx
   140002bfc:	mov    rax,QWORD PTR [rip+0x348d]        # 0x140006090
   140002c03:	mov    ebx,0x6
   140002c08:	and    rax,0xfffffffffffffffe
   140002c0c:	mov    DWORD PTR [rip+0x3482],0x1        # 0x140006098
   140002c16:	mov    DWORD PTR [rip+0x347c],0x2        # 0x14000609c
   140002c20:	mov    QWORD PTR [rip+0x3469],rax        # 0x140006090
   140002c27:	bt     edi,0x14
   140002c2b:	jae    0x140002c48
   140002c2d:	and    rax,0xffffffffffffffef
   140002c31:	mov    DWORD PTR [rip+0x345d],0x2        # 0x140006098
   140002c3b:	mov    QWORD PTR [rip+0x344e],rax        # 0x140006090
   140002c42:	mov    DWORD PTR [rip+0x3454],ebx        # 0x14000609c
   140002c48:	bt     edi,0x1b
   140002c4c:	jae    0x140002d7d
   140002c52:	xor    ecx,ecx
   140002c54:	xgetbv
   140002c57:	shl    rdx,0x20
   140002c5b:	or     rdx,rax
   140002c5e:	mov    QWORD PTR [rbp+0x20],rdx
   140002c62:	bt     edi,0x1c
   140002c66:	jae    0x140002d62
   140002c6c:	mov    rax,QWORD PTR [rbp+0x20]
   140002c70:	and    al,bl
   140002c72:	cmp    al,bl
   140002c74:	jne    0x140002d62
   140002c7a:	mov    eax,DWORD PTR [rip+0x341c]        # 0x14000609c
   140002c80:	mov    dl,0xe0
   140002c82:	or     eax,0x8
   140002c85:	mov    DWORD PTR [rip+0x3409],0x3        # 0x140006098
   140002c8f:	mov    DWORD PTR [rip+0x3407],eax        # 0x14000609c
   140002c95:	test   r9b,0x20
   140002c99:	je     0x140002cf8
   140002c9b:	or     eax,0x20
   140002c9e:	mov    DWORD PTR [rip+0x33f0],0x5        # 0x140006098
   140002ca8:	mov    DWORD PTR [rip+0x33ee],eax        # 0x14000609c
   140002cae:	mov    ecx,0xd0030000
   140002cb3:	mov    rax,QWORD PTR [rip+0x33d6]        # 0x140006090
   140002cba:	and    r9d,ecx
   140002cbd:	and    rax,0xfffffffffffffffd
   140002cc1:	mov    QWORD PTR [rip+0x33c8],rax        # 0x140006090
   140002cc8:	cmp    r9d,ecx
   140002ccb:	jne    0x140002cff
   140002ccd:	mov    rax,QWORD PTR [rbp+0x20]
   140002cd1:	and    al,dl
   140002cd3:	cmp    al,dl
   140002cd5:	jne    0x140002cf8
   140002cd7:	mov    rax,QWORD PTR [rip+0x33b2]        # 0x140006090
   140002cde:	or     DWORD PTR [rip+0x33b7],0x40        # 0x14000609c
   140002ce5:	and    rax,0xffffffffffffffdb
   140002ce9:	mov    DWORD PTR [rip+0x33a9],ebx        # 0x140006098
   140002cef:	mov    QWORD PTR [rip+0x339a],rax        # 0x140006090
   140002cf6:	jmp    0x140002cff
   140002cf8:	mov    rax,QWORD PTR [rip+0x3391]        # 0x140006090
   140002cff:	bt     esi,0x17
   140002d03:	jae    0x140002d11
   140002d05:	btr    rax,0x18
   140002d0a:	mov    QWORD PTR [rip+0x337f],rax        # 0x140006090
   140002d11:	bt     r10d,0x13
   140002d16:	jae    0x140002d62
   140002d18:	mov    rax,QWORD PTR [rbp+0x20]
   140002d1c:	and    al,dl
   140002d1e:	cmp    al,dl
   140002d20:	jne    0x140002d62
   140002d22:	mov    ecx,r11d
   140002d25:	mov    eax,r11d
   140002d28:	shr    rcx,0x10
   140002d2c:	and    eax,0x400ff
   140002d31:	and    ecx,0x7
   140002d34:	mov    DWORD PTR [rip+0x3a3a],eax        # 0x140006774
   140002d3a:	or     rcx,0x1000028
   140002d41:	not    rcx
   140002d44:	and    rcx,QWORD PTR [rip+0x3345]        # 0x140006090
   140002d4b:	mov    QWORD PTR [rip+0x333e],rcx        # 0x140006090
   140002d52:	cmp    eax,0x1
   140002d55:	jbe    0x140002d62
   140002d57:	and    rcx,0xffffffffffffffbf
   140002d5b:	mov    QWORD PTR [rip+0x332e],rcx        # 0x140006090
   140002d62:	bt     r10d,0x15
   140002d67:	jae    0x140002d7d
   140002d69:	mov    rax,QWORD PTR [rbp+0x20]
   140002d6d:	bt     rax,0x13
   140002d72:	jae    0x140002d7d
   140002d74:	btr    QWORD PTR [rip+0x3313],0x7        # 0x140006090
   140002d7d:	mov    rbx,QWORD PTR [rsp+0x38]
   140002d82:	xor    eax,eax
   140002d84:	mov    rsi,QWORD PTR [rsp+0x40]
   140002d89:	add    rsp,0x10
   140002d8d:	pop    r14
   140002d8f:	pop    rdi
   140002d90:	pop    rbp
   140002d91:	ret
   140002d92:	int3
   140002d93:	int3
   140002d94:	xor    eax,eax
   140002d96:	cmp    DWORD PTR [rip+0x3314],eax        # 0x1400060b0
   140002d9c:	setne  al
   140002d9f:	ret
   140002da0:	jmp    QWORD PTR [rip+0x13e2]        # 0x140004188
   140002da6:	jmp    QWORD PTR [rip+0x13ac]        # 0x140004158
   140002dac:	jmp    QWORD PTR [rip+0x139e]        # 0x140004150
   140002db2:	jmp    QWORD PTR [rip+0x1390]        # 0x140004148
   140002db8:	jmp    QWORD PTR [rip+0x1382]        # 0x140004140
   140002dbe:	jmp    QWORD PTR [rip+0x136c]        # 0x140004130
   140002dc4:	jmp    QWORD PTR [rip+0x13ae]        # 0x140004178
   140002dca:	jmp    QWORD PTR [rip+0x13e0]        # 0x1400041b0
   140002dd0:	jmp    QWORD PTR [rip+0x13ca]        # 0x1400041a0
   140002dd6:	jmp    QWORD PTR [rip+0x13bc]        # 0x140004198
   140002ddc:	jmp    QWORD PTR [rip+0x1476]        # 0x140004258
   140002de2:	jmp    QWORD PTR [rip+0x1490]        # 0x140004278
   140002de8:	jmp    QWORD PTR [rip+0x13e2]        # 0x1400041d0
   140002dee:	jmp    QWORD PTR [rip+0x1454]        # 0x140004248
   140002df4:	jmp    QWORD PTR [rip+0x1446]        # 0x140004240
   140002dfa:	jmp    QWORD PTR [rip+0x1438]        # 0x140004238
   140002e00:	jmp    QWORD PTR [rip+0x142a]        # 0x140004230
   140002e06:	jmp    QWORD PTR [rip+0x141c]        # 0x140004228
   140002e0c:	jmp    QWORD PTR [rip+0x140e]        # 0x140004220
   140002e12:	jmp    QWORD PTR [rip+0x1400]        # 0x140004218
   140002e18:	jmp    QWORD PTR [rip+0x1472]        # 0x140004290
   140002e1e:	jmp    QWORD PTR [rip+0x13e4]        # 0x140004208
   140002e24:	jmp    QWORD PTR [rip+0x143e]        # 0x140004268
   140002e2a:	jmp    QWORD PTR [rip+0x1430]        # 0x140004260
   140002e30:	jmp    QWORD PTR [rip+0x141a]        # 0x140004250
   140002e36:	jmp    QWORD PTR [rip+0x13b4]        # 0x1400041f0
   140002e3c:	jmp    QWORD PTR [rip+0x137e]        # 0x1400041c0
   140002e42:	jmp    QWORD PTR [rip+0x1360]        # 0x1400041a8
   140002e48:	jmp    QWORD PTR [rip+0x143a]        # 0x140004288
   140002e4e:	jmp    QWORD PTR [rip+0x13ac]        # 0x140004200
   140002e54:	jmp    QWORD PTR [rip+0x138e]        # 0x1400041e8
   140002e5a:	jmp    QWORD PTR [rip+0x1398]        # 0x1400041f8
   140002e60:	jmp    QWORD PTR [rip+0x137a]        # 0x1400041e0
   140002e66:	int3
   140002e67:	int3
   140002e68:	rex push rbx
   140002e6a:	mov    r11d,DWORD PTR [r8]
   140002e6d:	mov    rbx,rdx
   140002e70:	and    r11d,0xfffffff8
   140002e74:	mov    r9,rcx
   140002e77:	test   BYTE PTR [r8],0x4
   140002e7b:	mov    r10,rcx
   140002e7e:	je     0x140002e93
   140002e80:	mov    eax,DWORD PTR [r8+0x8]
   140002e84:	movsxd r10,DWORD PTR [r8+0x4]
   140002e88:	neg    eax
   140002e8a:	add    r10,rcx
   140002e8d:	movsxd rcx,eax
   140002e90:	and    r10,rcx
   140002e93:	movsxd rax,r11d
   140002e96:	mov    rdx,QWORD PTR [rax+r10*1]
   140002e9a:	mov    rax,QWORD PTR [rbx+0x10]
   140002e9e:	mov    ecx,DWORD PTR [rax+0x8]
   140002ea1:	mov    rax,QWORD PTR [rbx+0x8]
   140002ea5:	test   BYTE PTR [rcx+rax*1+0x3],0xf
   140002eaa:	je     0x140002eb7
   140002eac:	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140002eb1:	and    eax,0xfffffff0
   140002eb4:	add    r9,rax
   140002eb7:	xor    r9,rdx
   140002eba:	mov    rcx,r9
   140002ebd:	pop    rbx
   140002ebe:	jmp    0x140002010
   140002ec3:	int3
   140002ec4:	mov    rax,rsp
   140002ec7:	mov    QWORD PTR [rax+0x8],rbx
   140002ecb:	mov    QWORD PTR [rax+0x10],rbp
   140002ecf:	mov    QWORD PTR [rax+0x18],rsi
   140002ed3:	mov    QWORD PTR [rax+0x20],rdi
   140002ed7:	push   r14
   140002ed9:	sub    rsp,0x20
   140002edd:	mov    rbx,QWORD PTR [r9+0x38]
   140002ee1:	mov    rsi,rdx
   140002ee4:	mov    r14,r8
   140002ee7:	mov    rbp,rcx
   140002eea:	mov    rdx,r9
   140002eed:	mov    rcx,rsi
   140002ef0:	mov    rdi,r9
   140002ef3:	lea    r8,[rbx+0x4]
   140002ef7:	call   0x140002e68
   140002efc:	mov    eax,DWORD PTR [rbp+0x4]
   140002eff:	and    al,0x66
   140002f01:	neg    al
   140002f03:	mov    eax,0x1
   140002f08:	sbb    r8d,r8d
   140002f0b:	neg    r8d
   140002f0e:	add    r8d,eax
   140002f11:	test   DWORD PTR [rbx+0x4],r8d
   140002f15:	je     0x140002f28
   140002f17:	mov    r9,rdi
   140002f1a:	mov    r8,r14
   140002f1d:	mov    rdx,rsi
   140002f20:	mov    rcx,rbp
   140002f23:	call   0x140002da0
   140002f28:	mov    rbx,QWORD PTR [rsp+0x30]
   140002f2d:	mov    rbp,QWORD PTR [rsp+0x38]
   140002f32:	mov    rsi,QWORD PTR [rsp+0x40]
   140002f37:	mov    rdi,QWORD PTR [rsp+0x48]
   140002f3c:	add    rsp,0x20
   140002f40:	pop    r14
   140002f42:	ret
   140002f43:	jmp    QWORD PTR [rip+0x1227]        # 0x140004170
   140002f49:	jmp    QWORD PTR [rip+0x11e9]        # 0x140004138
   140002f4f:	int3
   140002f50:	int3
   140002f51:	int3
   140002f52:	int3
   140002f53:	int3
   140002f54:	int3
   140002f55:	int3
   140002f56:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002f60:	jmp    rax
   140002f62:	int3
   140002f63:	int3
   140002f64:	int3
   140002f65:	int3
   140002f66:	int3
   140002f67:	int3
   140002f68:	int3
   140002f69:	int3
   140002f6a:	int3
   140002f6b:	int3
   140002f6c:	int3
   140002f6d:	int3
   140002f6e:	int3
   140002f6f:	int3
   140002f70:	int3
   140002f71:	int3
   140002f72:	int3
   140002f73:	int3
   140002f74:	int3
   140002f75:	int3
   140002f76:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002f80:	jmp    QWORD PTR [rip+0x132a]        # 0x1400042b0
   140002f86:	int3
   140002f87:	int3
   140002f88:	int3
   140002f89:	int3
   140002f8a:	int3
   140002f8b:	int3
   140002f8c:	int3
   140002f8d:	int3
   140002f8e:	int3
   140002f8f:	int3
   140002f90:	lea    rcx,[rdx+0x48]
   140002f97:	jmp    0x140001660
   140002f9c:	lea    rcx,[rdx+0x98]
   140002fa3:	jmp    0x140001600
   140002fa8:	lea    rcx,[rdx+0x80]
   140002faf:	jmp    0x140001600
   140002fb4:	lea    rcx,[rdx+0x68]
   140002fbb:	jmp    0x140001600
   140002fc0:	lea    rcx,[rdx+0x28]
   140002fc7:	rex.W jmp QWORD PTR [rip+0x10ea]        # 0x1400040b8
   140002fce:	lea    rcx,[rdx+0x30]
   140002fd5:	jmp    0x140001fa0
   140002fda:	int3
   140002fdb:	int3
   140002fdc:	int3
   140002fdd:	int3
   140002fde:	int3
   140002fdf:	int3
   140002fe0:	lea    rcx,[rdx+0x30]
   140002fe7:	jmp    0x140001f70
   140002fec:	lea    rcx,[rdx+0x30]
   140002ff3:	jmp    0x140001f00
   140002ff8:	lea    rcx,[rdx+0x40]
   140002fff:	jmp    0x140001260
   140003004:	mov    QWORD PTR [rsp+0x10],rdx
   140003009:	push   rbp
   14000300a:	sub    rsp,0x20
   14000300e:	mov    rbp,rdx
   140003011:	mov    rdx,QWORD PTR [rbp+0x28]
   140003015:	mov    rax,QWORD PTR [rdx]
   140003018:	movsxd rcx,DWORD PTR [rax+0x4]
   14000301c:	add    rcx,rdx
   14000301f:	mov    r8b,0x1
   140003022:	mov    edx,0x4
   140003027:	call   QWORD PTR [rip+0x1053]        # 0x140004080
   14000302d:	nop
   14000302e:	movabs rax,0x0
   140003038:	add    rsp,0x20
   14000303c:	pop    rbp
   14000303d:	ret
   14000303e:	int3
   14000303f:	int3
   140003040:	lea    rcx,[rdx+0x20]
   140003047:	jmp    0x140001f70
   14000304c:	lea    rcx,[rdx+0x20]
   140003053:	jmp    0x140001f30
   140003058:	mov    QWORD PTR [rsp+0x10],rdx
   14000305d:	push   rbp
   14000305e:	sub    rsp,0x20
   140003062:	mov    rbp,rdx
   140003065:	mov    rdx,QWORD PTR [rbp+0x60]
   140003069:	mov    rax,QWORD PTR [rdx]
   14000306c:	movsxd rcx,DWORD PTR [rax+0x4]
   140003070:	add    rcx,rdx
   140003073:	mov    r8b,0x1
   140003076:	mov    edx,0x4
   14000307b:	call   QWORD PTR [rip+0xfff]        # 0x140004080
   140003081:	nop
   140003082:	movabs rax,0x0
   14000308c:	add    rsp,0x20
   140003090:	pop    rbp
   140003091:	ret
   140003092:	int3
   140003093:	int3
   140003094:	int3
   140003095:	int3
   140003096:	int3
   140003097:	int3
   140003098:	int3
   140003099:	int3
   14000309a:	int3
   14000309b:	int3
   14000309c:	int3
   14000309d:	int3
   14000309e:	int3
   14000309f:	int3
   1400030a0:	lea    rcx,[rdx+0x20]
   1400030a7:	jmp    0x140001f70
   1400030ac:	lea    rcx,[rdx+0x20]
   1400030b3:	jmp    0x140001f30
   1400030b8:	mov    QWORD PTR [rsp+0x10],rdx
   1400030bd:	push   rbp
   1400030be:	sub    rsp,0x20
   1400030c2:	mov    rbp,rdx
   1400030c5:	mov    rdx,QWORD PTR [rbp+0x50]
   1400030c9:	mov    rax,QWORD PTR [rdx]
   1400030cc:	movsxd rcx,DWORD PTR [rax+0x4]
   1400030d0:	add    rcx,rdx
   1400030d3:	mov    r8b,0x1
   1400030d6:	mov    edx,0x4
   1400030db:	call   QWORD PTR [rip+0xf9f]        # 0x140004080
   1400030e1:	nop
   1400030e2:	movabs rax,0x0
   1400030ec:	add    rsp,0x20
   1400030f0:	pop    rbp
   1400030f1:	ret
   1400030f2:	int3
   1400030f3:	rex push rbp
   1400030f5:	sub    rsp,0x20
   1400030f9:	mov    rbp,rdx
   1400030fc:	mov    rax,QWORD PTR [rcx]
   1400030ff:	mov    rdx,rcx
   140003102:	mov    ecx,DWORD PTR [rax]
   140003104:	call   0x140002ddc
   140003109:	nop
   14000310a:	add    rsp,0x20
   14000310e:	pop    rbp
   14000310f:	ret
   140003110:	int3
   140003111:	rex push rbp
   140003113:	mov    rbp,rdx
   140003116:	mov    rax,QWORD PTR [rcx]
   140003119:	xor    ecx,ecx
   14000311b:	cmp    DWORD PTR [rax],0xc0000005
   140003121:	sete   cl
   140003124:	mov    eax,ecx
   140003126:	pop    rbp
   140003127:	ret
   140003128:	int3
   140003129:	int3
   14000312a:	int3
   14000312b:	int3
   14000312c:	rex push rbx
   14000312e:	sub    rsp,0x20
   140003132:	jmp    0x140003171
   140003134:	mov    rax,QWORD PTR [rbx]
   140003137:	mov    rcx,QWORD PTR [rbx+0x8]
   14000313b:	mov    QWORD PTR [rip+0x303e],rax        # 0x140006180
   140003142:	mov    rax,QWORD PTR [rcx]
   140003145:	mov    rax,QWORD PTR [rax+0x10]
   140003149:	call   QWORD PTR [rip+0x1161]        # 0x1400042b0
   14000314f:	mov    rcx,rax
   140003152:	test   rax,rax
   140003155:	je     0x140003168
   140003157:	mov    rdx,QWORD PTR [rax]
   14000315a:	mov    rax,QWORD PTR [rdx]
   14000315d:	mov    edx,0x1
   140003162:	call   QWORD PTR [rip+0x1148]        # 0x1400042b0
   140003168:	mov    rcx,rbx
   14000316b:	call   QWORD PTR [rip+0x103f]        # 0x1400041b0
   140003171:	mov    rbx,QWORD PTR [rip+0x3008]        # 0x140006180
   140003178:	test   rbx,rbx
   14000317b:	jne    0x140003134
   14000317d:	add    rsp,0x20
   140003181:	pop    rbx
   140003182:	ret
