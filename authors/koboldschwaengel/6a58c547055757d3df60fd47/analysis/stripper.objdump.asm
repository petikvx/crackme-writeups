
WhereIsTheChallange.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	lea    rcx,[rip+0x3a99]        # 0x140004aa0
   140001007:	jmp    0x140003e7c
   14000100c:	int3
   14000100d:	int3
   14000100e:	int3
   14000100f:	int3
   140001010:	rex push rbx
   140001012:	sub    rsp,0x20
   140001016:	mov    rbx,rcx
   140001019:	mov    rax,rdx
   14000101c:	lea    rcx,[rip+0x4475]        # 0x140005498
   140001023:	xorps  xmm0,xmm0
   140001026:	lea    rdx,[rbx+0x8]
   14000102a:	mov    QWORD PTR [rbx],rcx
   14000102d:	lea    rcx,[rax+0x8]
   140001031:	movups XMMWORD PTR [rdx],xmm0
   140001034:	call   QWORD PTR [rip+0x41ce]        # 0x140005208
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
   140001054:	lea    rax,[rip+0x448d]        # 0x1400054e8
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
   14000107a:	lea    rax,[rip+0x4417]        # 0x140005498
   140001081:	mov    rdi,rcx
   140001084:	mov    QWORD PTR [rcx],rax
   140001087:	mov    ebx,edx
   140001089:	add    rcx,0x8
   14000108d:	call   QWORD PTR [rip+0x417d]        # 0x140005210
   140001093:	test   bl,0x1
   140001096:	je     0x1400010a5
   140001098:	mov    edx,0x18
   14000109d:	mov    rcx,rdi
   1400010a0:	call   0x1400039ac
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
   1400010c0:	lea    rax,[rip+0x43d1]        # 0x140005498
   1400010c7:	mov    QWORD PTR [rcx],rax
   1400010ca:	add    rcx,0x8
   1400010ce:	rex.W jmp QWORD PTR [rip+0x413b]        # 0x140005210
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
   1400010e0:	lea    rax,[rip+0x4419]        # 0x140005500
   1400010e7:	mov    QWORD PTR [rcx+0x10],0x0
   1400010ef:	mov    QWORD PTR [rcx+0x8],rax
   1400010f3:	lea    rax,[rip+0x43de]        # 0x1400054d8
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
   14000111e:	lea    rdx,[rip+0x596b]        # 0x140006a90
   140001125:	lea    rcx,[rsp+0x20]
   14000112a:	call   0x1400046f2
   14000112f:	int3
   140001130:	rex push rbx
   140001132:	sub    rsp,0x20
   140001136:	mov    rbx,rcx
   140001139:	mov    rax,rdx
   14000113c:	lea    rcx,[rip+0x4355]        # 0x140005498
   140001143:	xorps  xmm0,xmm0
   140001146:	lea    rdx,[rbx+0x8]
   14000114a:	mov    QWORD PTR [rbx],rcx
   14000114d:	lea    rcx,[rax+0x8]
   140001151:	movups XMMWORD PTR [rdx],xmm0
   140001154:	call   QWORD PTR [rip+0x40ae]        # 0x140005208
   14000115a:	lea    rax,[rip+0x4377]        # 0x1400054d8
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
   14000117c:	lea    rcx,[rip+0x4315]        # 0x140005498
   140001183:	xorps  xmm0,xmm0
   140001186:	lea    rdx,[rbx+0x8]
   14000118a:	mov    QWORD PTR [rbx],rcx
   14000118d:	lea    rcx,[rax+0x8]
   140001191:	movups XMMWORD PTR [rdx],xmm0
   140001194:	call   QWORD PTR [rip+0x406e]        # 0x140005208
   14000119a:	lea    rax,[rip+0x430f]        # 0x1400054b0
   1400011a1:	mov    QWORD PTR [rbx],rax
   1400011a4:	mov    rax,rbx
   1400011a7:	add    rsp,0x20
   1400011ab:	pop    rbx
   1400011ac:	ret
   1400011ad:	int3
   1400011ae:	int3
   1400011af:	int3
   1400011b0:	sub    rsp,0x28
   1400011b4:	lea    rcx,[rip+0x435d]        # 0x140005518
   1400011bb:	call   QWORD PTR [rip+0x3fc7]        # 0x140005188
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
   1400011d0:	lea    rax,[rip+0x4351]        # 0x140005528
   1400011d7:	mov    QWORD PTR [rcx+0x10],0x0
   1400011df:	mov    QWORD PTR [rcx+0x8],rax
   1400011e3:	lea    rax,[rip+0x4446]        # 0x140005630
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
   14000120e:	lea    rdx,[rip+0x57bb]        # 0x1400069d0
   140001215:	lea    rcx,[rsp+0x20]
   14000121a:	call   0x1400046f2
   14000121f:	int3
   140001220:	rex push rbx
   140001222:	sub    rsp,0x20
   140001226:	mov    rbx,rcx
   140001229:	mov    rax,rdx
   14000122c:	lea    rcx,[rip+0x4265]        # 0x140005498
   140001233:	xorps  xmm0,xmm0
   140001236:	lea    rdx,[rbx+0x8]
   14000123a:	mov    QWORD PTR [rbx],rcx
   14000123d:	lea    rcx,[rax+0x8]
   140001241:	movups XMMWORD PTR [rdx],xmm0
   140001244:	call   QWORD PTR [rip+0x3fbe]        # 0x140005208
   14000124a:	lea    rax,[rip+0x43df]        # 0x140005630
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
   1400012a0:	mov    eax,DWORD PTR [rcx+0x18]
   1400012a3:	and    eax,0xfffff9ff
   1400012a8:	bts    eax,0xb
   1400012ac:	mov    DWORD PTR [rcx+0x18],eax
   1400012af:	mov    rax,rcx
   1400012b2:	ret
   1400012b3:	int3
   1400012b4:	int3
   1400012b5:	int3
   1400012b6:	int3
   1400012b7:	int3
   1400012b8:	int3
   1400012b9:	int3
   1400012ba:	int3
   1400012bb:	int3
   1400012bc:	int3
   1400012bd:	int3
   1400012be:	int3
   1400012bf:	int3
   1400012c0:	mov    QWORD PTR [rsp+0x8],rbx
   1400012c5:	mov    QWORD PTR [rsp+0x18],rsi
   1400012ca:	mov    QWORD PTR [rsp+0x20],rdi
   1400012cf:	push   rbp
   1400012d0:	push   r12
   1400012d2:	push   r13
   1400012d4:	push   r14
   1400012d6:	push   r15
   1400012d8:	lea    rbp,[rsp-0x1d0]
   1400012e0:	sub    rsp,0x2d0
   1400012e7:	mov    rax,QWORD PTR [rip+0x6d52]        # 0x140008040
   1400012ee:	xor    rax,rsp
   1400012f1:	mov    QWORD PTR [rbp+0x1c8],rax
   1400012f8:	xor    r12d,r12d
   1400012fb:	mov    DWORD PTR [rsp+0x28],r12d
   140001300:	cmp    ecx,0x2
   140001303:	jne    0x140001bbd
   140001309:	mov    r14,QWORD PTR [rdx+0x8]
   14000130d:	xorps  xmm0,xmm0
   140001310:	movups XMMWORD PTR [rbp+0x1a8],xmm0
   140001317:	mov    QWORD PTR [rbp+0x1b8],r12
   14000131e:	mov    QWORD PTR [rbp+0x1c0],r12
   140001325:	mov    rbx,0xffffffffffffffff
   14000132c:	nop    DWORD PTR [rax+0x0]
   140001330:	inc    rbx
   140001333:	cmp    BYTE PTR [r14+rbx*1],r12b
   140001337:	jne    0x140001330
   140001339:	movabs r13,0x7fffffffffffffff
   140001343:	cmp    rbx,r13
   140001346:	ja     0x140001d01
   14000134c:	cmp    rbx,0xf
   140001350:	ja     0x140001383
   140001352:	mov    QWORD PTR [rbp+0x1b8],rbx
   140001359:	mov    QWORD PTR [rbp+0x1c0],0xf
   140001364:	mov    r8,rbx
   140001367:	mov    rdx,r14
   14000136a:	lea    rcx,[rbp+0x1a8]
   140001371:	call   0x1400048a3
   140001376:	mov    BYTE PTR [rbp+rbx*1+0x1a8],r12b
   14000137e:	jmp    0x140001420
   140001383:	mov    rdi,rbx
   140001386:	or     rdi,0xf
   14000138a:	cmp    rdi,r13
   14000138d:	jbe    0x1400013bf
   14000138f:	mov    rdi,r13
   140001392:	movabs rax,0x8000000000000000
   14000139c:	add    rax,0x27
   1400013a0:	mov    rcx,rax
   1400013a3:	call   0x140003970
   1400013a8:	test   rax,rax
   1400013ab:	je     0x140001ce2
   1400013b1:	lea    rsi,[rax+0x27]
   1400013b5:	and    rsi,0xffffffffffffffe0
   1400013b9:	mov    QWORD PTR [rsi-0x8],rax
   1400013bd:	jmp    0x1400013f9
   1400013bf:	mov    eax,0x16
   1400013c4:	cmp    rdi,rax
   1400013c7:	cmovb  rdi,rax
   1400013cb:	lea    rcx,[rdi+0x1]
   1400013cf:	test   rcx,rcx
   1400013d2:	jne    0x1400013d9
   1400013d4:	mov    rsi,r12
   1400013d7:	jmp    0x1400013f9
   1400013d9:	cmp    rcx,0x1000
   1400013e0:	jb     0x1400013f1
   1400013e2:	lea    rax,[rcx+0x27]
   1400013e6:	cmp    rax,rcx
   1400013e9:	jbe    0x140001cfb
   1400013ef:	jmp    0x1400013a0
   1400013f1:	call   0x140003970
   1400013f6:	mov    rsi,rax
   1400013f9:	mov    QWORD PTR [rbp+0x1a8],rsi
   140001400:	mov    QWORD PTR [rbp+0x1b8],rbx
   140001407:	mov    QWORD PTR [rbp+0x1c0],rdi
   14000140e:	mov    r8,rbx
   140001411:	mov    rdx,r14
   140001414:	mov    rcx,rsi
   140001417:	call   0x1400048a3
   14000141c:	mov    BYTE PTR [rsi+rbx*1],r12b
   140001420:	xor    edx,edx
   140001422:	mov    r8d,0x110
   140001428:	lea    rcx,[rbp+0x80]
   14000142f:	call   0x140004704
   140001434:	lea    rbx,[rbp+0x1a8]
   14000143b:	cmp    QWORD PTR [rbp+0x1c0],0xf
   140001443:	cmova  rbx,QWORD PTR [rbp+0x1a8]
   14000144b:	lea    rax,[rip+0xffffffffffffebae]        # 0x140000000
   140001452:	lea    rax,[rax+0x5648]
   140001459:	mov    QWORD PTR [rbp+0x80],rax
   140001460:	lea    rcx,[rbp+0x130]
   140001467:	call   QWORD PTR [rip+0x3c33]        # 0x1400050a0
   14000146d:	nop
   14000146e:	mov    DWORD PTR [rsp+0x28],0x1
   140001476:	xor    r9d,r9d
   140001479:	xor    r8d,r8d
   14000147c:	lea    rdx,[rbp+0x90]
   140001483:	lea    rcx,[rbp+0x80]
   14000148a:	call   QWORD PTR [rip+0x3c30]        # 0x1400050c0
   140001490:	nop
   140001491:	mov    rax,QWORD PTR [rbp+0x80]
   140001498:	movsxd rcx,DWORD PTR [rax+0x4]
   14000149c:	lea    rdi,[rip+0x41bd]        # 0x140005660
   1400014a3:	mov    QWORD PTR [rbp+rcx*1+0x80],rdi
   1400014ab:	mov    rax,QWORD PTR [rbp+0x80]
   1400014b2:	movsxd rcx,DWORD PTR [rax+0x4]
   1400014b6:	lea    edx,[rcx-0xb0]
   1400014bc:	mov    DWORD PTR [rbp+rcx*1+0x7c],edx
   1400014c0:	lea    rcx,[rbp+0x90]
   1400014c7:	call   QWORD PTR [rip+0x3ceb]        # 0x1400051b8
   1400014cd:	lea    rax,[rip+0x40cc]        # 0x1400055a0
   1400014d4:	mov    QWORD PTR [rbp+0x90],rax
   1400014db:	mov    BYTE PTR [rbp+0x10c],0x0
   1400014e2:	mov    BYTE PTR [rbp+0x101],0x0
   1400014e9:	lea    rcx,[rbp+0x90]
   1400014f0:	call   QWORD PTR [rip+0x3ba2]        # 0x140005098
   1400014f6:	mov    QWORD PTR [rbp+0x110],r12
   1400014fd:	mov    rax,QWORD PTR [rip+0x74f4]        # 0x1400089f8
   140001504:	mov    QWORD PTR [rbp+0x104],rax
   14000150b:	mov    QWORD PTR [rbp+0xf8],r12
   140001512:	mov    r8d,0x21
   140001518:	mov    rdx,rbx
   14000151b:	lea    rcx,[rbp+0x90]
   140001522:	call   0x140002ee0
   140001527:	test   rax,rax
   14000152a:	jne    0x140001550
   14000152c:	mov    rax,QWORD PTR [rbp+0x80]
   140001533:	movsxd rcx,DWORD PTR [rax+0x4]
   140001537:	lea    rax,[rbp+0x80]
   14000153e:	add    rcx,rax
   140001541:	xor    r8d,r8d
   140001544:	mov    edx,0x2
   140001549:	call   QWORD PTR [rip+0x3b99]        # 0x1400050e8
   14000154f:	nop
   140001550:	mov    rax,QWORD PTR [rbp+0x80]
   140001557:	movsxd rcx,DWORD PTR [rax+0x4]
   14000155b:	mov    QWORD PTR [rbp+rcx*1+0x80],rdi
   140001563:	mov    rax,QWORD PTR [rbp+0x80]
   14000156a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000156e:	lea    edx,[rcx-0xb0]
   140001574:	mov    DWORD PTR [rbp+rcx*1+0x7c],edx
   140001578:	mov    rax,QWORD PTR [rbp+0x80]
   14000157f:	movsxd rcx,DWORD PTR [rax+0x4]
   140001583:	lea    rax,[rbp+0x80]
   14000158a:	add    rcx,rax
   14000158d:	call   QWORD PTR [rip+0x3bbd]        # 0x140005150
   140001593:	test   al,al
   140001595:	je     0x1400015e4
   140001597:	lea    rdx,[rip+0x3f9a]        # 0x140005538
   14000159e:	mov    rcx,QWORD PTR [rip+0x3bfb]        # 0x1400051a0
   1400015a5:	call   0x140003020
   1400015aa:	lea    rdx,[rbp+0x1a8]
   1400015b1:	cmp    QWORD PTR [rbp+0x1c0],0xf
   1400015b9:	cmova  rdx,QWORD PTR [rbp+0x1a8]
   1400015c1:	mov    r8,QWORD PTR [rbp+0x1b8]
   1400015c8:	mov    rcx,rax
   1400015cb:	call   0x140003590
   1400015d0:	lea    rdx,[rip+0x3f5d]        # 0x140005534
   1400015d7:	mov    rcx,rax
   1400015da:	call   0x140003020
   1400015df:	jmp    0x140001b6f
   1400015e4:	xorps  xmm0,xmm0
   1400015e7:	xor    eax,eax
   1400015e9:	movups XMMWORD PTR [rbp+0x190],xmm0
   1400015f0:	mov    QWORD PTR [rbp+0x1a0],rax
   1400015f7:	mov    QWORD PTR [rsp+0x50],r12
   1400015fc:	mov    WORD PTR [rsp+0x58],0x1
   140001603:	mov    rax,QWORD PTR [rbp+0x80]
   14000160a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000160e:	mov    rax,QWORD PTR [rbp+rcx*1+0xc8]
   140001616:	mov    QWORD PTR [rsp+0x30],rax
   14000161b:	test   rax,rax
   14000161e:	sete   BYTE PTR [rsp+0x38]
   140001623:	mov    BYTE PTR [rsp+0x39],0x0
   140001628:	movdqu XMMWORD PTR [rbp+0x190],xmm0
   140001630:	mov    QWORD PTR [rbp+0x1a0],r12
   140001637:	lea    rcx,[rbp+0x190]
   14000163e:	mov    QWORD PTR [rsp+0x40],rcx
   140001643:	movaps xmm0,XMMWORD PTR [rsp+0x50]
   140001648:	movdqa XMMWORD PTR [rsp+0x50],xmm0
   14000164e:	movaps xmm1,XMMWORD PTR [rsp+0x30]
   140001653:	movdqa XMMWORD PTR [rsp+0x30],xmm1
   140001659:	movzx  esi,BYTE PTR [rsp+0x39]
   14000165e:	mov    rbx,QWORD PTR [rsp+0x30]
   140001663:	movzx  r15d,BYTE PTR [rsp+0x58]
   140001669:	mov    rdi,QWORD PTR [rsp+0x50]
   14000166e:	test   rax,rax
   140001671:	jne    0x14000167b
   140001673:	movzx  r14d,BYTE PTR [rsp+0x38]
   140001679:	jmp    0x1400016a0
   14000167b:	test   rbx,rbx
   14000167e:	je     0x140001693
   140001680:	mov    rcx,rbx
   140001683:	call   QWORD PTR [rip+0x3aef]        # 0x140005178
   140001689:	cmp    eax,0xffffffff
   14000168c:	je     0x140001693
   14000168e:	movzx  esi,al
   140001691:	jmp    0x140001696
   140001693:	mov    rbx,r12
   140001696:	mov    r14b,0x1
   140001699:	nop    DWORD PTR [rax+0x0]
   1400016a0:	test   r15b,r15b
   1400016a3:	jne    0x1400016be
   1400016a5:	test   rdi,rdi
   1400016a8:	je     0x1400016b8
   1400016aa:	mov    rcx,rdi
   1400016ad:	call   QWORD PTR [rip+0x3ac5]        # 0x140005178
   1400016b3:	cmp    eax,0xffffffff
   1400016b6:	jne    0x1400016bb
   1400016b8:	mov    rdi,r12
   1400016bb:	mov    r15b,0x1
   1400016be:	test   rbx,rbx
   1400016c1:	jne    0x14000172b
   1400016c3:	test   rdi,rdi
   1400016c6:	jne    0x140001730
   1400016c8:	lea    rcx,[rbp+0x90]
   1400016cf:	call   0x140002df0
   1400016d4:	test   rax,rax
   1400016d7:	jne    0x1400016fc
   1400016d9:	mov    rax,QWORD PTR [rbp+0x80]
   1400016e0:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016e4:	lea    rax,[rbp+0x80]
   1400016eb:	add    rcx,rax
   1400016ee:	xor    r8d,r8d
   1400016f1:	mov    edx,0x2
   1400016f6:	call   QWORD PTR [rip+0x39ec]        # 0x1400050e8
   1400016fc:	mov    rax,QWORD PTR [rbp+0x190]
   140001703:	mov    r9,QWORD PTR [rbp+0x198]
   14000170a:	cmp    rax,r9
   14000170d:	jne    0x1400017ae
   140001713:	lea    rdx,[rip+0x3e36]        # 0x140005550
   14000171a:	mov    rcx,QWORD PTR [rip+0x3a7f]        # 0x1400051a0
   140001721:	call   0x140003020
   140001726:	jmp    0x140001b1d
   14000172b:	test   rdi,rdi
   14000172e:	jne    0x1400016c8
   140001730:	test   r14b,r14b
   140001733:	jne    0x140001750
   140001735:	test   rbx,rbx
   140001738:	je     0x14000174d
   14000173a:	mov    rcx,rbx
   14000173d:	call   QWORD PTR [rip+0x3a35]        # 0x140005178
   140001743:	cmp    eax,0xffffffff
   140001746:	je     0x14000174d
   140001748:	movzx  esi,al
   14000174b:	jmp    0x140001750
   14000174d:	mov    rbx,r12
   140001750:	mov    BYTE PTR [rsp+0x20],sil
   140001755:	mov    rax,QWORD PTR [rbp+0x198]
   14000175c:	cmp    rax,QWORD PTR [rbp+0x1a0]
   140001763:	je     0x140001771
   140001765:	mov    BYTE PTR [rax],sil
   140001768:	inc    QWORD PTR [rbp+0x198]
   14000176f:	jmp    0x140001789
   140001771:	lea    r8,[rsp+0x20]
   140001776:	mov    rdx,QWORD PTR [rbp+0x198]
   14000177d:	lea    rcx,[rbp+0x190]
   140001784:	call   0x140003750
   140001789:	test   rbx,rbx
   14000178c:	je     0x140001693
   140001792:	mov    rcx,rbx
   140001795:	call   QWORD PTR [rip+0x39e5]        # 0x140005180
   14000179b:	cmp    eax,0xffffffff
   14000179e:	je     0x140001693
   1400017a4:	mov    BYTE PTR [rsp+0x38],0x0
   1400017a9:	jmp    0x14000167b
   1400017ae:	mov    DWORD PTR [rsp+0x24],0x905a4d
   1400017b6:	mov    rbx,r12
   1400017b9:	mov    rsi,r12
   1400017bc:	mov    rdi,r9
   1400017bf:	sub    rdi,rax
   1400017c2:	je     0x140001835
   1400017c4:	cmp    rdi,r13
   1400017c7:	ja     0x140001d07
   1400017cd:	cmp    rdi,0x1000
   1400017d4:	jb     0x1400017ff
   1400017d6:	lea    rcx,[rdi+0x27]
   1400017da:	cmp    rcx,rdi
   1400017dd:	jbe    0x140001cf5
   1400017e3:	call   0x140003970
   1400017e8:	test   rax,rax
   1400017eb:	je     0x1400018fb
   1400017f1:	lea    rbx,[rax+0x27]
   1400017f5:	and    rbx,0xffffffffffffffe0
   1400017f9:	mov    QWORD PTR [rbx-0x8],rax
   1400017fd:	jmp    0x14000180a
   1400017ff:	mov    rcx,rdi
   140001802:	call   0x140003970
   140001807:	mov    rbx,rax
   14000180a:	lea    rsi,[rbx+rdi*1]
   14000180e:	mov    r8,QWORD PTR [rbp+0x198]
   140001815:	mov    rdx,QWORD PTR [rbp+0x190]
   14000181c:	sub    r8,rdx
   14000181f:	mov    rcx,rbx
   140001822:	call   0x1400048a9
   140001827:	mov    r9,QWORD PTR [rbp+0x198]
   14000182e:	mov    rax,QWORD PTR [rbp+0x190]
   140001835:	mov    edi,0x1000
   14000183a:	sub    r9,rax
   14000183d:	sub    r9,0x3
   140001841:	cmp    r9,rdi
   140001844:	jbe    0x1400018d2
   14000184a:	lea    rax,[rsp+0x24]
   14000184f:	mov    r8,rbx
   140001852:	sub    r8,rax
   140001855:	add    r8,rdi
   140001858:	nop    DWORD PTR [rax+rax*1+0x0]
   140001860:	mov    rdx,r12
   140001863:	nop    DWORD PTR [rax+0x0]
   140001867:	nop    WORD PTR [rax+rax*1+0x0]
   140001870:	lea    rcx,[rsp+0x24]
   140001875:	add    rcx,rdx
   140001878:	movzx  eax,BYTE PTR [rcx]
   14000187b:	cmp    BYTE PTR [rcx+r8*1],al
   14000187f:	jne    0x1400018c5
   140001881:	inc    rdx
   140001884:	cmp    rdx,0x4
   140001888:	jl     0x140001870
   14000188a:	test   rbx,rbx
   14000188d:	je     0x1400018be
   14000188f:	sub    rsi,rbx
   140001892:	mov    rax,rbx
   140001895:	cmp    rsi,0x1000
   14000189c:	jb     0x1400018b3
   14000189e:	add    rsi,0x27
   1400018a2:	mov    rbx,QWORD PTR [rbx-0x8]
   1400018a6:	sub    rax,rbx
   1400018a9:	add    rax,0xfffffffffffffff8
   1400018ad:	cmp    rax,0x1f
   1400018b1:	ja     0x1400018fb
   1400018b3:	mov    rdx,rsi
   1400018b6:	mov    rcx,rbx
   1400018b9:	call   0x1400039ac
   1400018be:	cmp    edi,0xffffffff
   1400018c1:	jne    0x140001925
   1400018c3:	jmp    0x140001912
   1400018c5:	inc    edi
   1400018c7:	inc    r8
   1400018ca:	movsxd rax,edi
   1400018cd:	cmp    rax,r9
   1400018d0:	jb     0x140001860
   1400018d2:	test   rbx,rbx
   1400018d5:	je     0x14000190d
   1400018d7:	sub    rsi,rbx
   1400018da:	mov    rax,rbx
   1400018dd:	cmp    rsi,0x1000
   1400018e4:	jb     0x140001902
   1400018e6:	add    rsi,0x27
   1400018ea:	mov    rbx,QWORD PTR [rbx-0x8]
   1400018ee:	sub    rax,rbx
   1400018f1:	add    rax,0xfffffffffffffff8
   1400018f5:	cmp    rax,0x1f
   1400018f9:	jbe    0x140001902
   1400018fb:	call   QWORD PTR [rip+0x3a3f]        # 0x140005340
   140001901:	int3
   140001902:	mov    rdx,rsi
   140001905:	mov    rcx,rbx
   140001908:	call   0x1400039ac
   14000190d:	mov    edi,0xffffffff
   140001912:	lea    rdx,[rip+0x3c47]        # 0x140005560
   140001919:	mov    rcx,QWORD PTR [rip+0x38a8]        # 0x1400051c8
   140001920:	call   0x140003020
   140001925:	lea    rdx,[rip+0xfffffffffffff974]        # 0x1400012a0
   14000192c:	mov    rcx,QWORD PTR [rip+0x3895]        # 0x1400051c8
   140001933:	call   QWORD PTR [rip+0x37ef]        # 0x140005128
   140001939:	mov    rcx,rax
   14000193c:	mov    edx,edi
   14000193e:	call   QWORD PTR [rip+0x37ec]        # 0x140005130
   140001944:	mov    rcx,rax
   140001947:	lea    rdx,[rip+0x18b2]        # 0x140003200
   14000194e:	call   QWORD PTR [rip+0x37cc]        # 0x140005120
   140001954:	movsxd rdx,edi
   140001957:	mov    rdi,QWORD PTR [rbp+0x190]
   14000195e:	add    rdx,rdi
   140001961:	cmp    rdi,rdx
   140001964:	je     0x140001986
   140001966:	mov    rbx,QWORD PTR [rbp+0x198]
   14000196d:	sub    rbx,rdx
   140001970:	mov    r8,rbx
   140001973:	mov    rcx,rdi
   140001976:	call   0x1400048a9
   14000197b:	lea    rax,[rdi+rbx*1]
   14000197f:	mov    QWORD PTR [rbp+0x198],rax
   140001986:	xor    edx,edx
   140001988:	mov    r8d,0x108
   14000198e:	lea    rcx,[rsp+0x70]
   140001993:	call   0x140004704
   140001998:	lea    rbx,[rbp+0x1a8]
   14000199f:	cmp    QWORD PTR [rbp+0x1c0],0xf
   1400019a7:	cmova  rbx,QWORD PTR [rbp+0x1a8]
   1400019af:	lea    rax,[rip+0xffffffffffffe64a]        # 0x140000000
   1400019b6:	lea    rax,[rax+0x5640]
   1400019bd:	mov    QWORD PTR [rsp+0x70],rax
   1400019c2:	lea    rcx,[rbp+0x18]
   1400019c6:	call   QWORD PTR [rip+0x36d4]        # 0x1400050a0
   1400019cc:	nop
   1400019cd:	mov    DWORD PTR [rsp+0x28],0x3
   1400019d5:	xor    r9d,r9d
   1400019d8:	xor    r8d,r8d
   1400019db:	lea    rdx,[rsp+0x78]
   1400019e0:	lea    rcx,[rsp+0x70]
   1400019e5:	call   QWORD PTR [rip+0x36bd]        # 0x1400050a8
   1400019eb:	nop
   1400019ec:	mov    rax,QWORD PTR [rsp+0x70]
   1400019f1:	movsxd rcx,DWORD PTR [rax+0x4]
   1400019f5:	lea    rdi,[rip+0x3c24]        # 0x140005620
   1400019fc:	mov    QWORD PTR [rsp+rcx*1+0x70],rdi
   140001a01:	mov    rax,QWORD PTR [rsp+0x70]
   140001a06:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a0a:	lea    edx,[rcx-0xa8]
   140001a10:	mov    DWORD PTR [rsp+rcx*1+0x6c],edx
   140001a14:	lea    rcx,[rsp+0x78]
   140001a19:	call   QWORD PTR [rip+0x3799]        # 0x1400051b8
   140001a1f:	lea    rax,[rip+0x3b7a]        # 0x1400055a0
   140001a26:	mov    QWORD PTR [rsp+0x78],rax
   140001a2b:	mov    BYTE PTR [rbp-0xc],0x0
   140001a2f:	mov    BYTE PTR [rbp-0x17],0x0
   140001a33:	lea    rcx,[rsp+0x78]
   140001a38:	call   QWORD PTR [rip+0x365a]        # 0x140005098
   140001a3e:	mov    QWORD PTR [rbp-0x8],r12
   140001a42:	mov    rax,QWORD PTR [rip+0x6faf]        # 0x1400089f8
   140001a49:	mov    QWORD PTR [rbp-0x14],rax
   140001a4d:	mov    QWORD PTR [rbp-0x20],r12
   140001a51:	mov    r8d,0x32
   140001a57:	mov    rdx,rbx
   140001a5a:	lea    rcx,[rsp+0x78]
   140001a5f:	call   0x140002ee0
   140001a64:	test   rax,rax
   140001a67:	jne    0x140001a89
   140001a69:	mov    rax,QWORD PTR [rsp+0x70]
   140001a6e:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a72:	lea    rax,[rsp+0x70]
   140001a77:	add    rcx,rax
   140001a7a:	xor    r8d,r8d
   140001a7d:	mov    edx,0x2
   140001a82:	call   QWORD PTR [rip+0x3660]        # 0x1400050e8
   140001a88:	nop
   140001a89:	mov    rax,QWORD PTR [rsp+0x70]
   140001a8e:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a92:	mov    QWORD PTR [rsp+rcx*1+0x70],rdi
   140001a97:	mov    rax,QWORD PTR [rsp+0x70]
   140001a9c:	movsxd rcx,DWORD PTR [rax+0x4]
   140001aa0:	lea    edx,[rcx-0xa8]
   140001aa6:	mov    DWORD PTR [rsp+rcx*1+0x6c],edx
   140001aaa:	mov    rax,QWORD PTR [rsp+0x70]
   140001aaf:	movsxd rcx,DWORD PTR [rax+0x4]
   140001ab3:	lea    rax,[rsp+0x70]
   140001ab8:	add    rcx,rax
   140001abb:	call   QWORD PTR [rip+0x368f]        # 0x140005150
   140001ac1:	test   al,al
   140001ac3:	je     0x140001bf2
   140001ac9:	lea    rdx,[rip+0x3aa0]        # 0x140005570
   140001ad0:	mov    rcx,QWORD PTR [rip+0x36c9]        # 0x1400051a0
   140001ad7:	call   0x140003020
   140001adc:	lea    rdx,[rbp+0x1a8]
   140001ae3:	cmp    QWORD PTR [rbp+0x1c0],0xf
   140001aeb:	cmova  rdx,QWORD PTR [rbp+0x1a8]
   140001af3:	mov    r8,QWORD PTR [rbp+0x1b8]
   140001afa:	mov    rcx,rax
   140001afd:	call   0x140003590
   140001b02:	lea    rdx,[rip+0x3a2b]        # 0x140005534
   140001b09:	mov    rcx,rax
   140001b0c:	call   0x140003020
   140001b11:	nop
   140001b12:	lea    rcx,[rsp+0x70]
   140001b17:	call   0x140001dd0
   140001b1c:	nop
   140001b1d:	mov    rcx,QWORD PTR [rbp+0x190]
   140001b24:	test   rcx,rcx
   140001b27:	je     0x140001b6f
   140001b29:	mov    rdx,QWORD PTR [rbp+0x1a0]
   140001b30:	sub    rdx,rcx
   140001b33:	mov    rax,rcx
   140001b36:	cmp    rdx,0x1000
   140001b3d:	jb     0x140001b58
   140001b3f:	add    rdx,0x27
   140001b43:	mov    rcx,QWORD PTR [rcx-0x8]
   140001b47:	sub    rax,rcx
   140001b4a:	add    rax,0xfffffffffffffff8
   140001b4e:	cmp    rax,0x1f
   140001b52:	ja     0x140001c7f
   140001b58:	call   0x1400039ac
   140001b5d:	xorps  xmm0,xmm0
   140001b60:	movdqu XMMWORD PTR [rbp+0x190],xmm0
   140001b68:	mov    QWORD PTR [rbp+0x1a0],r12
   140001b6f:	lea    rcx,[rbp+0x80]
   140001b76:	call   0x140001d10
   140001b7b:	nop
   140001b7c:	mov    rdx,QWORD PTR [rbp+0x1c0]
   140001b83:	cmp    rdx,0xf
   140001b87:	jbe    0x140001bbd
   140001b89:	inc    rdx
   140001b8c:	mov    rcx,QWORD PTR [rbp+0x1a8]
   140001b93:	mov    rax,rcx
   140001b96:	cmp    rdx,0x1000
   140001b9d:	jb     0x140001bb8
   140001b9f:	add    rdx,0x27
   140001ba3:	mov    rcx,QWORD PTR [rcx-0x8]
   140001ba7:	sub    rax,rcx
   140001baa:	add    rax,0xfffffffffffffff8
   140001bae:	cmp    rax,0x1f
   140001bb2:	ja     0x140001ce2
   140001bb8:	call   0x1400039ac
   140001bbd:	mov    eax,0x1
   140001bc2:	mov    rcx,QWORD PTR [rbp+0x1c8]
   140001bc9:	xor    rcx,rsp
   140001bcc:	call   0x140003950
   140001bd1:	lea    r11,[rsp+0x2d0]
   140001bd9:	mov    rbx,QWORD PTR [r11+0x30]
   140001bdd:	mov    rsi,QWORD PTR [r11+0x40]
   140001be1:	mov    rdi,QWORD PTR [r11+0x48]
   140001be5:	mov    rsp,r11
   140001be8:	pop    r15
   140001bea:	pop    r14
   140001bec:	pop    r13
   140001bee:	pop    r12
   140001bf0:	pop    rbp
   140001bf1:	ret
   140001bf2:	mov    r8,QWORD PTR [rbp+0x198]
   140001bf9:	mov    rdx,QWORD PTR [rbp+0x190]
   140001c00:	sub    r8,rdx
   140001c03:	lea    rcx,[rsp+0x70]
   140001c08:	call   QWORD PTR [rip+0x352a]        # 0x140005138
   140001c0e:	lea    rcx,[rsp+0x78]
   140001c13:	call   0x140002df0
   140001c18:	test   rax,rax
   140001c1b:	jne    0x140001c3d
   140001c1d:	mov    rax,QWORD PTR [rsp+0x70]
   140001c22:	movsxd rcx,DWORD PTR [rax+0x4]
   140001c26:	lea    rax,[rsp+0x70]
   140001c2b:	add    rcx,rax
   140001c2e:	xor    r8d,r8d
   140001c31:	mov    edx,0x2
   140001c36:	call   QWORD PTR [rip+0x34ac]        # 0x1400050e8
   140001c3c:	nop
   140001c3d:	lea    rcx,[rsp+0x70]
   140001c42:	call   0x140001dd0
   140001c47:	nop
   140001c48:	mov    rcx,QWORD PTR [rbp+0x190]
   140001c4f:	test   rcx,rcx
   140001c52:	je     0x140001c9d
   140001c54:	mov    rdx,QWORD PTR [rbp+0x1a0]
   140001c5b:	sub    rdx,rcx
   140001c5e:	mov    rax,rcx
   140001c61:	cmp    rdx,0x1000
   140001c68:	jb     0x140001c86
   140001c6a:	add    rdx,0x27
   140001c6e:	mov    rcx,QWORD PTR [rcx-0x8]
   140001c72:	sub    rax,rcx
   140001c75:	add    rax,0xfffffffffffffff8
   140001c79:	cmp    rax,0x1f
   140001c7d:	jbe    0x140001c86
   140001c7f:	call   QWORD PTR [rip+0x36bb]        # 0x140005340
   140001c85:	int3
   140001c86:	call   0x1400039ac
   140001c8b:	xorps  xmm0,xmm0
   140001c8e:	movdqu XMMWORD PTR [rbp+0x190],xmm0
   140001c96:	mov    QWORD PTR [rbp+0x1a0],r12
   140001c9d:	lea    rcx,[rbp+0x80]
   140001ca4:	call   0x140001d10
   140001ca9:	nop
   140001caa:	mov    rdx,QWORD PTR [rbp+0x1c0]
   140001cb1:	cmp    rdx,0xf
   140001cb5:	jbe    0x140001cee
   140001cb7:	inc    rdx
   140001cba:	mov    rcx,QWORD PTR [rbp+0x1a8]
   140001cc1:	mov    rax,rcx
   140001cc4:	cmp    rdx,0x1000
   140001ccb:	jb     0x140001ce9
   140001ccd:	add    rdx,0x27
   140001cd1:	mov    rcx,QWORD PTR [rcx-0x8]
   140001cd5:	sub    rax,rcx
   140001cd8:	add    rax,0xfffffffffffffff8
   140001cdc:	cmp    rax,0x1f
   140001ce0:	jbe    0x140001ce9
   140001ce2:	call   QWORD PTR [rip+0x3658]        # 0x140005340
   140001ce8:	int3
   140001ce9:	call   0x1400039ac
   140001cee:	xor    eax,eax
   140001cf0:	jmp    0x140001bc2
   140001cf5:	call   0x140001110
   140001cfa:	nop
   140001cfb:	call   0x140001110
   140001d00:	int3
   140001d01:	call   0x1400011b0
   140001d06:	nop
   140001d07:	call   0x140003570
   140001d0c:	int3
   140001d0d:	int3
   140001d0e:	int3
   140001d0f:	int3
   140001d10:	mov    QWORD PTR [rsp+0x8],rbx
   140001d15:	push   rdi
   140001d16:	sub    rsp,0x20
   140001d1a:	lea    rdi,[rcx+0xb0]
   140001d21:	mov    rax,QWORD PTR [rcx]
   140001d24:	movsxd rdx,DWORD PTR [rax+0x4]
   140001d28:	lea    rax,[rip+0x3931]        # 0x140005660
   140001d2f:	mov    QWORD PTR [rdx+rdi*1-0xb0],rax
   140001d37:	mov    rax,QWORD PTR [rcx]
   140001d3a:	movsxd rcx,DWORD PTR [rax+0x4]
   140001d3e:	lea    edx,[rcx-0xb0]
   140001d44:	mov    DWORD PTR [rcx+rdi*1-0xb4],edx
   140001d4b:	lea    rbx,[rdi-0xa0]
   140001d52:	lea    rax,[rip+0x3847]        # 0x1400055a0
   140001d59:	mov    QWORD PTR [rbx],rax
   140001d5c:	cmp    QWORD PTR [rbx+0x80],0x0
   140001d64:	je     0x140001d95
   140001d66:	mov    rcx,QWORD PTR [rbx+0x18]
   140001d6a:	lea    rax,[rbx+0x70]
   140001d6e:	cmp    QWORD PTR [rcx],rax
   140001d71:	jne    0x140001d95
   140001d73:	mov    r8,QWORD PTR [rbx+0x90]
   140001d7a:	mov    rdx,QWORD PTR [rbx+0x88]
   140001d81:	mov    QWORD PTR [rcx],rdx
   140001d84:	mov    rax,QWORD PTR [rbx+0x38]
   140001d88:	mov    QWORD PTR [rax],rdx
   140001d8b:	sub    r8d,edx
   140001d8e:	mov    rax,QWORD PTR [rbx+0x50]
   140001d92:	mov    DWORD PTR [rax],r8d
   140001d95:	cmp    BYTE PTR [rbx+0x7c],0x0
   140001d99:	je     0x140001da3
   140001d9b:	mov    rcx,rbx
   140001d9e:	call   0x140002df0
   140001da3:	mov    rcx,rbx
   140001da6:	call   QWORD PTR [rip+0x3344]        # 0x1400050f0
   140001dac:	nop
   140001dad:	lea    rcx,[rdi-0x98]
   140001db4:	call   QWORD PTR [rip+0x3386]        # 0x140005140
   140001dba:	mov    rcx,rdi
   140001dbd:	mov    rbx,QWORD PTR [rsp+0x30]
   140001dc2:	add    rsp,0x20
   140001dc6:	pop    rdi
   140001dc7:	rex.W jmp QWORD PTR [rip+0x3342]        # 0x140005110
   140001dce:	int3
   140001dcf:	int3
   140001dd0:	mov    QWORD PTR [rsp+0x8],rbx
   140001dd5:	push   rdi
   140001dd6:	sub    rsp,0x20
   140001dda:	lea    rdi,[rcx+0xa8]
   140001de1:	mov    rax,QWORD PTR [rcx]
   140001de4:	movsxd rdx,DWORD PTR [rax+0x4]
   140001de8:	lea    rax,[rip+0x3831]        # 0x140005620
   140001def:	mov    QWORD PTR [rdx+rdi*1-0xa8],rax
   140001df7:	mov    rax,QWORD PTR [rcx]
   140001dfa:	movsxd rcx,DWORD PTR [rax+0x4]
   140001dfe:	lea    edx,[rcx-0xa8]
   140001e04:	mov    DWORD PTR [rcx+rdi*1-0xac],edx
   140001e0b:	lea    rbx,[rdi-0xa0]
   140001e12:	lea    rax,[rip+0x3787]        # 0x1400055a0
   140001e19:	mov    QWORD PTR [rbx],rax
   140001e1c:	cmp    QWORD PTR [rbx+0x80],0x0
   140001e24:	je     0x140001e55
   140001e26:	mov    rcx,QWORD PTR [rbx+0x18]
   140001e2a:	lea    rax,[rbx+0x70]
   140001e2e:	cmp    QWORD PTR [rcx],rax
   140001e31:	jne    0x140001e55
   140001e33:	mov    r8,QWORD PTR [rbx+0x90]
   140001e3a:	mov    rdx,QWORD PTR [rbx+0x88]
   140001e41:	mov    QWORD PTR [rcx],rdx
   140001e44:	mov    rax,QWORD PTR [rbx+0x38]
   140001e48:	mov    QWORD PTR [rax],rdx
   140001e4b:	sub    r8d,edx
   140001e4e:	mov    rax,QWORD PTR [rbx+0x50]
   140001e52:	mov    DWORD PTR [rax],r8d
   140001e55:	cmp    BYTE PTR [rbx+0x7c],0x0
   140001e59:	je     0x140001e63
   140001e5b:	mov    rcx,rbx
   140001e5e:	call   0x140002df0
   140001e63:	mov    rcx,rbx
   140001e66:	call   QWORD PTR [rip+0x3284]        # 0x1400050f0
   140001e6c:	nop
   140001e6d:	lea    rcx,[rdi-0x98]
   140001e74:	call   QWORD PTR [rip+0x329e]        # 0x140005118
   140001e7a:	mov    rcx,rdi
   140001e7d:	mov    rbx,QWORD PTR [rsp+0x30]
   140001e82:	add    rsp,0x20
   140001e86:	pop    rdi
   140001e87:	rex.W jmp QWORD PTR [rip+0x3282]        # 0x140005110
   140001e8e:	int3
   140001e8f:	int3
   140001e90:	mov    QWORD PTR [rsp+0x8],rbx
   140001e95:	push   rdi
   140001e96:	sub    rsp,0x20
   140001e9a:	mov    rbx,rcx
   140001e9d:	mov    rcx,rdx
   140001ea0:	call   0x140003240
   140001ea5:	mov    rcx,rax
   140001ea8:	mov    rdi,rax
   140001eab:	call   QWORD PTR [rip+0x32a7]        # 0x140005158
   140001eb1:	test   al,al
   140001eb3:	je     0x140001ec8
   140001eb5:	mov    QWORD PTR [rbx+0x68],0x0
   140001ebd:	mov    rbx,QWORD PTR [rsp+0x30]
   140001ec2:	add    rsp,0x20
   140001ec6:	pop    rdi
   140001ec7:	ret
   140001ec8:	mov    rcx,rbx
   140001ecb:	mov    QWORD PTR [rbx+0x68],rdi
   140001ecf:	mov    rbx,QWORD PTR [rsp+0x30]
   140001ed4:	add    rsp,0x20
   140001ed8:	pop    rdi
   140001ed9:	rex.W jmp QWORD PTR [rip+0x31b8]        # 0x140005098
   140001ee0:	rex push rbx
   140001ee2:	sub    rsp,0x20
   140001ee6:	cmp    QWORD PTR [rcx+0x80],0x0
   140001eee:	mov    rbx,rcx
   140001ef1:	je     0x140001f20
   140001ef3:	mov    rax,QWORD PTR [rcx]
   140001ef6:	mov    edx,0xffffffff
   140001efb:	call   QWORD PTR [rax+0x18]
   140001efe:	cmp    eax,0xffffffff
   140001f01:	je     0x140001f20
   140001f03:	mov    rcx,QWORD PTR [rbx+0x80]
   140001f0a:	call   QWORD PTR [rip+0x3488]        # 0x140005398
   140001f10:	xor    ecx,ecx
   140001f12:	test   eax,eax
   140001f14:	setns  cl
   140001f17:	lea    eax,[rcx-0x1]
   140001f1a:	add    rsp,0x20
   140001f1e:	pop    rbx
   140001f1f:	ret
   140001f20:	xor    eax,eax
   140001f22:	add    rsp,0x20
   140001f26:	pop    rbx
   140001f27:	ret
   140001f28:	int3
   140001f29:	int3
   140001f2a:	int3
   140001f2b:	int3
   140001f2c:	int3
   140001f2d:	int3
   140001f2e:	int3
   140001f2f:	int3
   140001f30:	rex push rbx
   140001f32:	push   rsi
   140001f33:	sub    rsp,0x48
   140001f37:	mov    rax,QWORD PTR [rip+0x6102]        # 0x140008040
   140001f3e:	xor    rax,rsp
   140001f41:	mov    QWORD PTR [rsp+0x38],rax
   140001f46:	xor    esi,esi
   140001f48:	mov    r9,r8
   140001f4b:	mov    rbx,rcx
   140001f4e:	test   rdx,rdx
   140001f51:	jne    0x140001f5e
   140001f53:	test   r8,r8
   140001f56:	mov    r8d,0x4
   140001f5c:	je     0x140001f61
   140001f5e:	mov    r8d,esi
   140001f61:	mov    rcx,QWORD PTR [rcx+0x80]
   140001f68:	test   rcx,rcx
   140001f6b:	je     0x14000200f
   140001f71:	call   QWORD PTR [rip+0x33e9]        # 0x140005360
   140001f77:	test   eax,eax
   140001f79:	jne    0x14000200f
   140001f7f:	mov    QWORD PTR [rsp+0x40],rdi
   140001f84:	mov    rcx,rbx
   140001f87:	mov    rdi,QWORD PTR [rbx+0x80]
   140001f8e:	mov    BYTE PTR [rbx+0x7c],0x1
   140001f92:	mov    BYTE PTR [rbx+0x71],sil
   140001f96:	call   QWORD PTR [rip+0x30fc]        # 0x140005098
   140001f9c:	test   rdi,rdi
   140001f9f:	je     0x140001fef
   140001fa1:	lea    r9,[rsp+0x30]
   140001fa6:	mov    QWORD PTR [rsp+0x20],rsi
   140001fab:	lea    r8,[rsp+0x28]
   140001fb0:	mov    QWORD PTR [rsp+0x28],rsi
   140001fb5:	lea    rdx,[rsp+0x20]
   140001fba:	mov    QWORD PTR [rsp+0x30],rsi
   140001fbf:	mov    rcx,rdi
   140001fc2:	call   QWORD PTR [rip+0x33b0]        # 0x140005378
   140001fc8:	mov    rcx,QWORD PTR [rsp+0x20]
   140001fcd:	mov    QWORD PTR [rbx+0x18],rcx
   140001fd1:	mov    QWORD PTR [rbx+0x20],rcx
   140001fd5:	mov    rcx,QWORD PTR [rsp+0x28]
   140001fda:	mov    QWORD PTR [rbx+0x38],rcx
   140001fde:	mov    QWORD PTR [rbx+0x40],rcx
   140001fe2:	mov    rcx,QWORD PTR [rsp+0x30]
   140001fe7:	mov    QWORD PTR [rbx+0x50],rcx
   140001feb:	mov    QWORD PTR [rbx+0x58],rcx
   140001fef:	mov    rcx,QWORD PTR [rip+0x6a02]        # 0x1400089f8
   140001ff6:	mov    rax,rbx
   140001ff9:	mov    QWORD PTR [rbx+0x80],rdi
   140002000:	mov    rdi,QWORD PTR [rsp+0x40]
   140002005:	mov    QWORD PTR [rbx+0x74],rcx
   140002009:	mov    QWORD PTR [rbx+0x68],rsi
   14000200d:	jmp    0x140002011
   14000200f:	xor    eax,eax
   140002011:	mov    rcx,QWORD PTR [rsp+0x38]
   140002016:	xor    rcx,rsp
   140002019:	call   0x140003950
   14000201e:	add    rsp,0x48
   140002022:	pop    rsi
   140002023:	pop    rbx
   140002024:	ret
   140002025:	int3
   140002026:	int3
   140002027:	int3
   140002028:	int3
   140002029:	int3
   14000202a:	int3
   14000202b:	int3
   14000202c:	int3
   14000202d:	int3
   14000202e:	int3
   14000202f:	int3
   140002030:	rex push rbx
   140002032:	push   rsi
   140002033:	push   rdi
   140002034:	sub    rsp,0x30
   140002038:	mov    rax,QWORD PTR [rip+0x6001]        # 0x140008040
   14000203f:	xor    rax,rsp
   140002042:	mov    QWORD PTR [rsp+0x28],rax
   140002047:	mov    rax,QWORD PTR [r8+0x8]
   14000204b:	mov    rsi,r8
   14000204e:	add    rax,QWORD PTR [r8]
   140002051:	mov    rbx,rdx
   140002054:	cmp    QWORD PTR [rcx+0x80],0x0
   14000205c:	mov    rdi,rcx
   14000205f:	mov    QWORD PTR [rsp+0x20],rax
   140002064:	je     0x1400020d6
   140002066:	call   0x140002d00
   14000206b:	test   al,al
   14000206d:	je     0x1400020d6
   14000206f:	mov    rcx,QWORD PTR [rdi+0x80]
   140002076:	lea    rdx,[rsp+0x20]
   14000207b:	call   QWORD PTR [rip+0x32cf]        # 0x140005350
   140002081:	test   eax,eax
   140002083:	jne    0x1400020d6
   140002085:	mov    rax,QWORD PTR [rsi+0x10]
   140002089:	mov    rcx,QWORD PTR [rdi+0x18]
   14000208d:	mov    QWORD PTR [rdi+0x74],rax
   140002091:	lea    rax,[rdi+0x70]
   140002095:	cmp    QWORD PTR [rcx],rax
   140002098:	jne    0x1400020bc
   14000209a:	mov    rdx,QWORD PTR [rdi+0x88]
   1400020a1:	mov    r8,QWORD PTR [rdi+0x90]
   1400020a8:	mov    QWORD PTR [rcx],rdx
   1400020ab:	sub    r8d,edx
   1400020ae:	mov    rcx,QWORD PTR [rdi+0x38]
   1400020b2:	mov    QWORD PTR [rcx],rdx
   1400020b5:	mov    rcx,QWORD PTR [rdi+0x50]
   1400020b9:	mov    DWORD PTR [rcx],r8d
   1400020bc:	mov    rcx,QWORD PTR [rdi+0x74]
   1400020c0:	mov    rdx,QWORD PTR [rsp+0x20]
   1400020c5:	mov    QWORD PTR [rbx],rdx
   1400020c8:	mov    QWORD PTR [rbx+0x10],rcx
   1400020cc:	mov    QWORD PTR [rbx+0x8],0x0
   1400020d4:	jmp    0x1400020eb
   1400020d6:	xor    eax,eax
   1400020d8:	mov    QWORD PTR [rbx],0xffffffffffffffff
   1400020df:	mov    QWORD PTR [rbx+0x8],0x0
   1400020e7:	mov    QWORD PTR [rbx+0x10],rax
   1400020eb:	mov    rax,rbx
   1400020ee:	mov    rcx,QWORD PTR [rsp+0x28]
   1400020f3:	xor    rcx,rsp
   1400020f6:	call   0x140003950
   1400020fb:	add    rsp,0x30
   1400020ff:	pop    rdi
   140002100:	pop    rsi
   140002101:	pop    rbx
   140002102:	ret
   140002103:	int3
   140002104:	int3
   140002105:	int3
   140002106:	int3
   140002107:	int3
   140002108:	int3
   140002109:	int3
   14000210a:	int3
   14000210b:	int3
   14000210c:	int3
   14000210d:	int3
   14000210e:	int3
   14000210f:	int3
   140002110:	rex push rbx
   140002112:	push   rbp
   140002113:	push   rsi
   140002114:	push   rdi
   140002115:	push   r14
   140002117:	sub    rsp,0x30
   14000211b:	mov    rax,QWORD PTR [rip+0x5f1e]        # 0x140008040
   140002122:	xor    rax,rsp
   140002125:	mov    QWORD PTR [rsp+0x28],rax
   14000212a:	mov    rax,QWORD PTR [rcx+0x38]
   14000212e:	lea    r14,[rcx+0x70]
   140002132:	mov    ebp,r9d
   140002135:	mov    rsi,r8
   140002138:	mov    rdi,rdx
   14000213b:	mov    rbx,rcx
   14000213e:	cmp    QWORD PTR [rax],r14
   140002141:	jne    0x140002153
   140002143:	cmp    r9d,0x1
   140002147:	jne    0x140002153
   140002149:	cmp    QWORD PTR [rcx+0x68],0x0
   14000214e:	jne    0x140002153
   140002150:	dec    rsi
   140002153:	cmp    QWORD PTR [rcx+0x80],0x0
   14000215b:	je     0x1400021e6
   140002161:	call   0x140002d00
   140002166:	test   al,al
   140002168:	je     0x1400021e6
   14000216a:	test   rsi,rsi
   14000216d:	jne    0x140002174
   14000216f:	cmp    ebp,0x1
   140002172:	je     0x14000218b
   140002174:	mov    rcx,QWORD PTR [rbx+0x80]
   14000217b:	mov    r8d,ebp
   14000217e:	mov    rdx,rsi
   140002181:	call   QWORD PTR [rip+0x3231]        # 0x1400053b8
   140002187:	test   eax,eax
   140002189:	jne    0x1400021e6
   14000218b:	mov    rcx,QWORD PTR [rbx+0x80]
   140002192:	lea    rdx,[rsp+0x20]
   140002197:	call   QWORD PTR [rip+0x31cb]        # 0x140005368
   14000219d:	test   eax,eax
   14000219f:	jne    0x1400021e6
   1400021a1:	mov    rax,QWORD PTR [rbx+0x18]
   1400021a5:	cmp    QWORD PTR [rax],r14
   1400021a8:	jne    0x1400021cc
   1400021aa:	mov    rdx,QWORD PTR [rbx+0x88]
   1400021b1:	mov    r8,QWORD PTR [rbx+0x90]
   1400021b8:	mov    QWORD PTR [rax],rdx
   1400021bb:	sub    r8d,edx
   1400021be:	mov    rcx,QWORD PTR [rbx+0x38]
   1400021c2:	mov    QWORD PTR [rcx],rdx
   1400021c5:	mov    rcx,QWORD PTR [rbx+0x50]
   1400021c9:	mov    DWORD PTR [rcx],r8d
   1400021cc:	mov    rcx,QWORD PTR [rbx+0x74]
   1400021d0:	mov    rdx,QWORD PTR [rsp+0x20]
   1400021d5:	mov    QWORD PTR [rdi],rdx
   1400021d8:	mov    QWORD PTR [rdi+0x10],rcx
   1400021dc:	mov    QWORD PTR [rdi+0x8],0x0
   1400021e4:	jmp    0x1400021fb
   1400021e6:	xor    eax,eax
   1400021e8:	mov    QWORD PTR [rdi],0xffffffffffffffff
   1400021ef:	mov    QWORD PTR [rdi+0x8],0x0
   1400021f7:	mov    QWORD PTR [rdi+0x10],rax
   1400021fb:	mov    rax,rdi
   1400021fe:	mov    rcx,QWORD PTR [rsp+0x28]
   140002203:	xor    rcx,rsp
   140002206:	call   0x140003950
   14000220b:	add    rsp,0x30
   14000220f:	pop    r14
   140002211:	pop    rdi
   140002212:	pop    rsi
   140002213:	pop    rbp
   140002214:	pop    rbx
   140002215:	ret
   140002216:	int3
   140002217:	int3
   140002218:	int3
   140002219:	int3
   14000221a:	int3
   14000221b:	int3
   14000221c:	int3
   14000221d:	int3
   14000221e:	int3
   14000221f:	int3
   140002220:	rex push rbx
   140002222:	push   rdi
   140002223:	push   r15
   140002225:	sub    rsp,0x20
   140002229:	cmp    QWORD PTR [rcx+0x68],0x0
   14000222e:	mov    rbx,r8
   140002231:	mov    r15,rdx
   140002234:	mov    rdi,rcx
   140002237:	je     0x140002248
   140002239:	add    rsp,0x20
   14000223d:	pop    r15
   14000223f:	pop    rdi
   140002240:	pop    rbx
   140002241:	rex.W jmp QWORD PTR [rip+0x2ec0]        # 0x140005108
   140002248:	mov    rax,QWORD PTR [rcx+0x40]
   14000224c:	mov    QWORD PTR [rsp+0x40],rbp
   140002251:	mov    QWORD PTR [rsp+0x48],rsi
   140002256:	mov    rsi,rbx
   140002259:	mov    QWORD PTR [rsp+0x58],r14
   14000225e:	mov    r9,QWORD PTR [rax]
   140002261:	test   r9,r9
   140002264:	je     0x14000226e
   140002266:	mov    rax,QWORD PTR [rcx+0x58]
   14000226a:	mov    ecx,DWORD PTR [rax]
   14000226c:	jmp    0x140002270
   14000226e:	xor    ecx,ecx
   140002270:	movsxd rbp,ecx
   140002273:	test   rbx,rbx
   140002276:	jle    0x1400022c9
   140002278:	test   ecx,ecx
   14000227a:	jle    0x1400022a9
   14000227c:	cmp    rbx,rbp
   14000227f:	mov    rcx,r9
   140002282:	cmovl  rbp,rbx
   140002286:	mov    r8,rbp
   140002289:	call   0x1400048a3
   14000228e:	mov    rax,QWORD PTR [rdi+0x58]
   140002292:	add    r15,rbp
   140002295:	sub    rbx,rbp
   140002298:	sub    DWORD PTR [rax],ebp
   14000229a:	mov    rcx,QWORD PTR [rdi+0x40]
   14000229e:	movsxd rax,ebp
   1400022a1:	add    QWORD PTR [rcx],rax
   1400022a4:	test   rbx,rbx
   1400022a7:	jle    0x1400022c9
   1400022a9:	mov    r9,QWORD PTR [rdi+0x80]
   1400022b0:	test   r9,r9
   1400022b3:	je     0x1400022c9
   1400022b5:	mov    r8,rbx
   1400022b8:	mov    edx,0x1
   1400022bd:	mov    rcx,r15
   1400022c0:	call   QWORD PTR [rip+0x30aa]        # 0x140005370
   1400022c6:	sub    rbx,rax
   1400022c9:	mov    r14,QWORD PTR [rsp+0x58]
   1400022ce:	sub    rsi,rbx
   1400022d1:	mov    rbp,QWORD PTR [rsp+0x40]
   1400022d6:	mov    rax,rsi
   1400022d9:	mov    rsi,QWORD PTR [rsp+0x48]
   1400022de:	add    rsp,0x20
   1400022e2:	pop    r15
   1400022e4:	pop    rdi
   1400022e5:	pop    rbx
   1400022e6:	ret
   1400022e7:	int3
   1400022e8:	int3
   1400022e9:	int3
   1400022ea:	int3
   1400022eb:	int3
   1400022ec:	int3
   1400022ed:	int3
   1400022ee:	int3
   1400022ef:	int3
   1400022f0:	rex push rbp
   1400022f2:	push   rsi
   1400022f3:	push   r14
   1400022f5:	sub    rsp,0x30
   1400022f9:	mov    rbp,r8
   1400022fc:	mov    r14,rdx
   1400022ff:	mov    rsi,rcx
   140002302:	test   r8,r8
   140002305:	jg     0x140002312
   140002307:	xor    eax,eax
   140002309:	add    rsp,0x30
   14000230d:	pop    r14
   14000230f:	pop    rsi
   140002310:	pop    rbp
   140002311:	ret
   140002312:	cmp    QWORD PTR [rcx+0x68],0x0
   140002317:	je     0x140002328
   140002319:	add    rsp,0x30
   14000231d:	pop    r14
   14000231f:	pop    rsi
   140002320:	pop    rbp
   140002321:	rex.W jmp QWORD PTR [rip+0x2dd8]        # 0x140005100
   140002328:	mov    rax,QWORD PTR [rcx+0x38]
   14000232c:	mov    QWORD PTR [rsp+0x28],rbx
   140002331:	mov    rbx,rbp
   140002334:	mov    rdx,QWORD PTR [rax]
   140002337:	test   rdx,rdx
   14000233a:	je     0x140002344
   14000233c:	mov    rax,QWORD PTR [rcx+0x50]
   140002340:	mov    ecx,DWORD PTR [rax]
   140002342:	jmp    0x140002346
   140002344:	xor    ecx,ecx
   140002346:	movsxd rax,ecx
   140002349:	test   ecx,ecx
   14000234b:	je     0x140002382
   14000234d:	mov    QWORD PTR [rsp+0x20],rdi
   140002352:	cmp    rax,rbp
   140002355:	mov    rdi,rbp
   140002358:	mov    rcx,r14
   14000235b:	cmovb  rdi,rax
   14000235f:	mov    r8,rdi
   140002362:	call   0x1400048a3
   140002367:	mov    rax,QWORD PTR [rsi+0x50]
   14000236b:	add    r14,rdi
   14000236e:	sub    rbx,rdi
   140002371:	sub    DWORD PTR [rax],edi
   140002373:	mov    rcx,QWORD PTR [rsi+0x38]
   140002377:	movsxd rax,edi
   14000237a:	mov    rdi,QWORD PTR [rsp+0x20]
   14000237f:	add    QWORD PTR [rcx],rax
   140002382:	cmp    QWORD PTR [rsi+0x80],0x0
   14000238a:	je     0x14000241e
   140002390:	mov    r8,QWORD PTR [rsi+0x18]
   140002394:	lea    rax,[rsi+0x70]
   140002398:	cmp    QWORD PTR [r8],rax
   14000239b:	jne    0x1400023bd
   14000239d:	mov    rcx,QWORD PTR [rsi+0x88]
   1400023a4:	mov    rdx,QWORD PTR [rsi+0x90]
   1400023ab:	mov    QWORD PTR [r8],rcx
   1400023ae:	sub    edx,ecx
   1400023b0:	mov    rax,QWORD PTR [rsi+0x38]
   1400023b4:	mov    QWORD PTR [rax],rcx
   1400023b7:	mov    rax,QWORD PTR [rsi+0x50]
   1400023bb:	mov    DWORD PTR [rax],edx
   1400023bd:	cmp    rbx,0xfff
   1400023c4:	jbe    0x1400023fe
   1400023c6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1400023d0:	mov    r9,QWORD PTR [rsi+0x80]
   1400023d7:	mov    edx,0x1
   1400023dc:	mov    r8d,0xfff
   1400023e2:	mov    rcx,r14
   1400023e5:	call   QWORD PTR [rip+0x2f95]        # 0x140005380
   1400023eb:	add    r14,rax
   1400023ee:	sub    rbx,rax
   1400023f1:	cmp    rax,0xfff
   1400023f7:	jne    0x14000241e
   1400023f9:	cmp    rbx,rax
   1400023fc:	ja     0x1400023d0
   1400023fe:	test   rbx,rbx
   140002401:	je     0x14000241e
   140002403:	mov    r9,QWORD PTR [rsi+0x80]
   14000240a:	mov    r8,rbx
   14000240d:	mov    edx,0x1
   140002412:	mov    rcx,r14
   140002415:	call   QWORD PTR [rip+0x2f65]        # 0x140005380
   14000241b:	sub    rbx,rax
   14000241e:	sub    rbp,rbx
   140002421:	mov    rbx,QWORD PTR [rsp+0x28]
   140002426:	mov    rax,rbp
   140002429:	add    rsp,0x30
   14000242d:	pop    r14
   14000242f:	pop    rsi
   140002430:	pop    rbp
   140002431:	ret
   140002432:	int3
   140002433:	int3
   140002434:	int3
   140002435:	int3
   140002436:	int3
   140002437:	int3
   140002438:	int3
   140002439:	int3
   14000243a:	int3
   14000243b:	int3
   14000243c:	int3
   14000243d:	int3
   14000243e:	int3
   14000243f:	int3
   140002440:	mov    QWORD PTR [rsp+0x10],rbx
   140002445:	mov    QWORD PTR [rsp+0x18],rsi
   14000244a:	mov    QWORD PTR [rsp+0x20],rdi
   14000244f:	push   rbp
   140002450:	mov    rbp,rsp
   140002453:	sub    rsp,0x80
   14000245a:	mov    rax,QWORD PTR [rip+0x5bdf]        # 0x140008040
   140002461:	xor    rax,rsp
   140002464:	mov    QWORD PTR [rbp-0x8],rax
   140002468:	mov    rdi,rcx
   14000246b:	mov    rax,QWORD PTR [rcx+0x38]
   14000246f:	mov    rcx,QWORD PTR [rax]
   140002472:	test   rcx,rcx
   140002475:	je     0x1400024a3
   140002477:	mov    rdx,QWORD PTR [rdi+0x50]
   14000247b:	movsxd r9,DWORD PTR [rdx]
   14000247e:	lea    rax,[rcx+r9*1]
   140002482:	cmp    rcx,rax
   140002485:	jae    0x1400024a3
   140002487:	lea    eax,[r9-0x1]
   14000248b:	mov    DWORD PTR [rdx],eax
   14000248d:	mov    rcx,QWORD PTR [rdi+0x38]
   140002491:	mov    rdx,QWORD PTR [rcx]
   140002494:	lea    rax,[rdx+0x1]
   140002498:	mov    QWORD PTR [rcx],rax
   14000249b:	movzx  eax,BYTE PTR [rdx]
   14000249e:	jmp    0x1400026ef
   1400024a3:	cmp    QWORD PTR [rdi+0x80],0x0
   1400024ab:	jne    0x1400024b7
   1400024ad:	mov    eax,0xffffffff
   1400024b2:	jmp    0x1400026ef
   1400024b7:	mov    r9,QWORD PTR [rdi+0x18]
   1400024bb:	lea    rax,[rdi+0x70]
   1400024bf:	cmp    QWORD PTR [r9],rax
   1400024c2:	jne    0x1400024e4
   1400024c4:	mov    rdx,QWORD PTR [rdi+0x90]
   1400024cb:	mov    rcx,QWORD PTR [rdi+0x88]
   1400024d2:	mov    QWORD PTR [r9],rcx
   1400024d5:	mov    rax,QWORD PTR [rdi+0x38]
   1400024d9:	mov    QWORD PTR [rax],rcx
   1400024dc:	sub    edx,ecx
   1400024de:	mov    rax,QWORD PTR [rdi+0x50]
   1400024e2:	mov    DWORD PTR [rax],edx
   1400024e4:	mov    rcx,QWORD PTR [rdi+0x80]
   1400024eb:	cmp    QWORD PTR [rdi+0x68],0x0
   1400024f0:	jne    0x14000250e
   1400024f2:	call   QWORD PTR [rip+0x2e90]        # 0x140005388
   1400024f8:	cmp    eax,0xffffffff
   1400024fb:	mov    ebx,0xffffffff
   140002500:	je     0x1400026ed
   140002506:	movzx  ebx,al
   140002509:	jmp    0x1400026ed
   14000250e:	xorps  xmm0,xmm0
   140002511:	movups XMMWORD PTR [rbp-0x28],xmm0
   140002515:	mov    QWORD PTR [rbp-0x18],0x0
   14000251d:	mov    QWORD PTR [rbp-0x10],0xf
   140002525:	mov    BYTE PTR [rbp-0x28],0x0
   140002529:	call   QWORD PTR [rip+0x2e59]        # 0x140005388
   14000252f:	mov    r8d,eax
   140002532:	cmp    eax,0xffffffff
   140002535:	je     0x140002640
   14000253b:	nop    DWORD PTR [rax+rax*1+0x0]
   140002540:	mov    rcx,QWORD PTR [rbp-0x18]
   140002544:	mov    rdx,QWORD PTR [rbp-0x10]
   140002548:	cmp    rcx,rdx
   14000254b:	jae    0x14000256d
   14000254d:	lea    rax,[rcx+0x1]
   140002551:	mov    QWORD PTR [rbp-0x18],rax
   140002555:	lea    rax,[rbp-0x28]
   140002559:	cmp    rdx,0xf
   14000255d:	cmova  rax,QWORD PTR [rbp-0x28]
   140002562:	mov    BYTE PTR [rax+rcx*1],r8b
   140002566:	mov    BYTE PTR [rax+rcx*1+0x1],0x0
   14000256b:	jmp    0x14000257a
   14000256d:	movzx  r9d,r8b
   140002571:	lea    rcx,[rbp-0x28]
   140002575:	call   0x140003380
   14000257a:	lea    rdx,[rbp-0x28]
   14000257e:	cmp    QWORD PTR [rbp-0x10],0xf
   140002583:	cmova  rdx,QWORD PTR [rbp-0x28]
   140002588:	lea    r8,[rbp-0x28]
   14000258c:	cmova  r8,QWORD PTR [rbp-0x28]
   140002591:	mov    r9,QWORD PTR [rbp-0x18]
   140002595:	add    r9,rdx
   140002598:	lea    rax,[rbp-0x38]
   14000259c:	mov    QWORD PTR [rsp+0x38],rax
   1400025a1:	lea    rax,[rbp-0x2f]
   1400025a5:	mov    QWORD PTR [rsp+0x30],rax
   1400025aa:	lea    rax,[rbp-0x30]
   1400025ae:	mov    QWORD PTR [rsp+0x28],rax
   1400025b3:	lea    rax,[rbp-0x40]
   1400025b7:	mov    QWORD PTR [rsp+0x20],rax
   1400025bc:	lea    rdx,[rdi+0x74]
   1400025c0:	mov    rcx,QWORD PTR [rdi+0x68]
   1400025c4:	call   QWORD PTR [rip+0x2afe]        # 0x1400050c8
   1400025ca:	test   eax,eax
   1400025cc:	je     0x1400025d7
   1400025ce:	sub    eax,0x1
   1400025d1:	jne    0x140002686
   1400025d7:	lea    rax,[rbp-0x30]
   1400025db:	mov    rbx,QWORD PTR [rbp-0x18]
   1400025df:	cmp    QWORD PTR [rbp-0x38],rax
   1400025e3:	lea    rax,[rbp-0x28]
   1400025e7:	jne    0x14000269e
   1400025ed:	cmp    QWORD PTR [rbp-0x10],0xf
   1400025f2:	cmova  rax,QWORD PTR [rbp-0x28]
   1400025f7:	mov    r9,QWORD PTR [rbp-0x40]
   1400025fb:	sub    r9,rax
   1400025fe:	cmp    rbx,r9
   140002601:	cmovb  r9,rbx
   140002605:	lea    rcx,[rbp-0x28]
   140002609:	cmp    QWORD PTR [rbp-0x10],0xf
   14000260e:	cmova  rcx,QWORD PTR [rbp-0x28]
   140002613:	sub    rbx,r9
   140002616:	lea    r8,[rbx+0x1]
   14000261a:	lea    rdx,[rcx+r9*1]
   14000261e:	call   0x1400048a9
   140002623:	mov    QWORD PTR [rbp-0x18],rbx
   140002627:	mov    rcx,QWORD PTR [rdi+0x80]
   14000262e:	call   QWORD PTR [rip+0x2d54]        # 0x140005388
   140002634:	mov    r8d,eax
   140002637:	cmp    eax,0xffffffff
   14000263a:	jne    0x140002540
   140002640:	mov    ebx,0xffffffff
   140002645:	mov    rdx,QWORD PTR [rbp-0x10]
   140002649:	cmp    rdx,0xf
   14000264d:	jbe    0x1400026ed
   140002653:	inc    rdx
   140002656:	mov    rcx,QWORD PTR [rbp-0x28]
   14000265a:	mov    rax,rcx
   14000265d:	cmp    rdx,0x1000
   140002664:	jb     0x1400026e8
   14000266a:	add    rdx,0x27
   14000266e:	mov    rcx,QWORD PTR [rcx-0x8]
   140002672:	sub    rax,rcx
   140002675:	add    rax,0xfffffffffffffff8
   140002679:	cmp    rax,0x1f
   14000267d:	jbe    0x1400026e8
   14000267f:	call   QWORD PTR [rip+0x2cbb]        # 0x140005340
   140002685:	nop
   140002686:	cmp    eax,0x2
   140002689:	jne    0x140002640
   14000268b:	lea    rax,[rbp-0x28]
   14000268f:	cmp    QWORD PTR [rbp-0x10],0xf
   140002694:	cmova  rax,QWORD PTR [rbp-0x28]
   140002699:	movsx  ebx,BYTE PTR [rax]
   14000269c:	jmp    0x140002645
   14000269e:	cmp    QWORD PTR [rbp-0x10],0xf
   1400026a3:	cmova  rax,QWORD PTR [rbp-0x28]
   1400026a8:	mov    rcx,QWORD PTR [rbp-0x40]
   1400026ac:	sub    rbx,rcx
   1400026af:	add    rbx,rax
   1400026b2:	test   rbx,rbx
   1400026b5:	jle    0x1400026df
   1400026b7:	nop    WORD PTR [rax+rax*1+0x0]
   1400026c0:	dec    rbx
   1400026c3:	movsx  ecx,BYTE PTR [rbx+rcx*1]
   1400026c7:	mov    rdx,QWORD PTR [rdi+0x80]
   1400026ce:	call   QWORD PTR [rip+0x2c84]        # 0x140005358
   1400026d4:	test   rbx,rbx
   1400026d7:	jle    0x1400026df
   1400026d9:	mov    rcx,QWORD PTR [rbp-0x40]
   1400026dd:	jmp    0x1400026c0
   1400026df:	movzx  ebx,BYTE PTR [rbp-0x30]
   1400026e3:	jmp    0x140002645
   1400026e8:	call   0x1400039ac
   1400026ed:	mov    eax,ebx
   1400026ef:	mov    rcx,QWORD PTR [rbp-0x8]
   1400026f3:	xor    rcx,rsp
   1400026f6:	call   0x140003950
   1400026fb:	lea    r11,[rsp+0x80]
   140002703:	mov    rbx,QWORD PTR [r11+0x18]
   140002707:	mov    rsi,QWORD PTR [r11+0x20]
   14000270b:	mov    rdi,QWORD PTR [r11+0x28]
   14000270f:	mov    rsp,r11
   140002712:	pop    rbp
   140002713:	ret
   140002714:	int3
   140002715:	int3
   140002716:	int3
   140002717:	int3
   140002718:	int3
   140002719:	int3
   14000271a:	int3
   14000271b:	int3
   14000271c:	int3
   14000271d:	int3
   14000271e:	int3
   14000271f:	int3
   140002720:	rex push rbx
   140002722:	sub    rsp,0x20
   140002726:	mov    rax,QWORD PTR [rcx+0x38]
   14000272a:	mov    rbx,rcx
   14000272d:	mov    rcx,QWORD PTR [rax]
   140002730:	test   rcx,rcx
   140002733:	je     0x14000274d
   140002735:	mov    rax,QWORD PTR [rbx+0x50]
   140002739:	movsxd rdx,DWORD PTR [rax]
   14000273c:	add    rdx,rcx
   14000273f:	cmp    rcx,rdx
   140002742:	jae    0x14000274d
   140002744:	movzx  eax,BYTE PTR [rcx]
   140002747:	add    rsp,0x20
   14000274b:	pop    rbx
   14000274c:	ret
   14000274d:	mov    rax,QWORD PTR [rbx]
   140002750:	mov    rcx,rbx
   140002753:	mov    QWORD PTR [rsp+0x30],rdi
   140002758:	call   QWORD PTR [rax+0x38]
   14000275b:	mov    edi,eax
   14000275d:	cmp    eax,0xffffffff
   140002760:	jne    0x14000276d
   140002762:	mov    rdi,QWORD PTR [rsp+0x30]
   140002767:	add    rsp,0x20
   14000276b:	pop    rbx
   14000276c:	ret
   14000276d:	mov    rax,QWORD PTR [rbx]
   140002770:	mov    edx,edi
   140002772:	mov    rcx,rbx
   140002775:	call   QWORD PTR [rax+0x20]
   140002778:	mov    eax,edi
   14000277a:	mov    rdi,QWORD PTR [rsp+0x30]
   14000277f:	add    rsp,0x20
   140002783:	pop    rbx
   140002784:	ret
   140002785:	int3
   140002786:	int3
   140002787:	int3
   140002788:	int3
   140002789:	int3
   14000278a:	int3
   14000278b:	int3
   14000278c:	int3
   14000278d:	int3
   14000278e:	int3
   14000278f:	int3
   140002790:	mov    QWORD PTR [rsp+0x8],rbx
   140002795:	push   rdi
   140002796:	sub    rsp,0x20
   14000279a:	mov    rax,QWORD PTR [rcx+0x38]
   14000279e:	mov    rbx,rcx
   1400027a1:	mov    edi,edx
   1400027a3:	mov    rcx,QWORD PTR [rax]
   1400027a6:	test   rcx,rcx
   1400027a9:	je     0x1400027e3
   1400027ab:	mov    rax,QWORD PTR [rbx+0x18]
   1400027af:	cmp    QWORD PTR [rax],rcx
   1400027b2:	jae    0x1400027e3
   1400027b4:	cmp    edx,0xffffffff
   1400027b7:	je     0x1400027c1
   1400027b9:	movzx  eax,BYTE PTR [rcx-0x1]
   1400027bd:	cmp    eax,edx
   1400027bf:	jne    0x1400027e3
   1400027c1:	mov    rax,QWORD PTR [rbx+0x50]
   1400027c5:	inc    DWORD PTR [rax]
   1400027c7:	mov    rax,QWORD PTR [rbx+0x38]
   1400027cb:	dec    QWORD PTR [rax]
   1400027ce:	xor    eax,eax
   1400027d0:	cmp    edi,0xffffffff
   1400027d3:	cmove  edi,eax
   1400027d6:	mov    eax,edi
   1400027d8:	mov    rbx,QWORD PTR [rsp+0x30]
   1400027dd:	add    rsp,0x20
   1400027e1:	pop    rdi
   1400027e2:	ret
   1400027e3:	mov    rdx,QWORD PTR [rbx+0x80]
   1400027ea:	test   rdx,rdx
   1400027ed:	je     0x140002862
   1400027ef:	cmp    edi,0xffffffff
   1400027f2:	je     0x140002862
   1400027f4:	cmp    QWORD PTR [rbx+0x68],0x0
   1400027f9:	jne    0x14000280a
   1400027fb:	movzx  ecx,dil
   1400027ff:	call   QWORD PTR [rip+0x2b53]        # 0x140005358
   140002805:	cmp    eax,0xffffffff
   140002808:	jne    0x1400027d6
   14000280a:	mov    r9,QWORD PTR [rbx+0x38]
   14000280e:	lea    rdx,[rbx+0x70]
   140002812:	cmp    QWORD PTR [r9],rdx
   140002815:	je     0x140002862
   140002817:	mov    r10,QWORD PTR [rbx+0x18]
   14000281b:	lea    r8,[rbx+0x50]
   14000281f:	mov    BYTE PTR [rdx],dil
   140002822:	mov    rax,QWORD PTR [r10]
   140002825:	cmp    rax,rdx
   140002828:	je     0x140002841
   14000282a:	mov    QWORD PTR [rbx+0x88],rax
   140002831:	mov    rax,QWORD PTR [r8]
   140002834:	movsxd rcx,DWORD PTR [rax]
   140002837:	add    rcx,QWORD PTR [r9]
   14000283a:	mov    QWORD PTR [rbx+0x90],rcx
   140002841:	mov    QWORD PTR [r10],rdx
   140002844:	mov    rax,QWORD PTR [rbx+0x38]
   140002848:	sub    ebx,edx
   14000284a:	add    ebx,0x71
   14000284d:	mov    QWORD PTR [rax],rdx
   140002850:	mov    rax,QWORD PTR [r8]
   140002853:	mov    DWORD PTR [rax],ebx
   140002855:	mov    eax,edi
   140002857:	mov    rbx,QWORD PTR [rsp+0x30]
   14000285c:	add    rsp,0x20
   140002860:	pop    rdi
   140002861:	ret
   140002862:	mov    rbx,QWORD PTR [rsp+0x30]
   140002867:	mov    eax,0xffffffff
   14000286c:	add    rsp,0x20
   140002870:	pop    rdi
   140002871:	ret
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
   140002880:	mov    QWORD PTR [rsp+0x20],rbx
   140002885:	push   rdi
   140002886:	sub    rsp,0x80
   14000288d:	mov    rax,QWORD PTR [rip+0x57ac]        # 0x140008040
   140002894:	xor    rax,rsp
   140002897:	mov    QWORD PTR [rsp+0x78],rax
   14000289c:	mov    edi,edx
   14000289e:	mov    rbx,rcx
   1400028a1:	cmp    edx,0xffffffff
   1400028a4:	jne    0x1400028ad
   1400028a6:	xor    eax,eax
   1400028a8:	jmp    0x140002a19
   1400028ad:	mov    rax,QWORD PTR [rcx+0x40]
   1400028b1:	mov    rdx,QWORD PTR [rax]
   1400028b4:	test   rdx,rdx
   1400028b7:	je     0x1400028e7
   1400028b9:	mov    rax,QWORD PTR [rcx+0x58]
   1400028bd:	movsxd r8,DWORD PTR [rax]
   1400028c0:	lea    rcx,[rdx+r8*1]
   1400028c4:	cmp    rdx,rcx
   1400028c7:	jae    0x1400028e7
   1400028c9:	lea    ecx,[r8-0x1]
   1400028cd:	mov    DWORD PTR [rax],ecx
   1400028cf:	mov    eax,edi
   1400028d1:	mov    rdx,QWORD PTR [rbx+0x40]
   1400028d5:	mov    r8,QWORD PTR [rdx]
   1400028d8:	lea    rcx,[r8+0x1]
   1400028dc:	mov    QWORD PTR [rdx],rcx
   1400028df:	mov    BYTE PTR [r8],dil
   1400028e2:	jmp    0x140002a19
   1400028e7:	cmp    QWORD PTR [rbx+0x80],0x0
   1400028ef:	mov    QWORD PTR [rsp+0xa0],rsi
   1400028f7:	je     0x140002a0c
   1400028fd:	mov    r8,QWORD PTR [rbx+0x18]
   140002901:	lea    rax,[rbx+0x70]
   140002905:	cmp    QWORD PTR [r8],rax
   140002908:	jne    0x14000292a
   14000290a:	mov    rcx,QWORD PTR [rbx+0x88]
   140002911:	mov    rdx,QWORD PTR [rbx+0x90]
   140002918:	mov    QWORD PTR [r8],rcx
   14000291b:	sub    edx,ecx
   14000291d:	mov    rax,QWORD PTR [rbx+0x38]
   140002921:	mov    QWORD PTR [rax],rcx
   140002924:	mov    rax,QWORD PTR [rbx+0x50]
   140002928:	mov    DWORD PTR [rax],edx
   14000292a:	mov    rcx,QWORD PTR [rbx+0x68]
   14000292e:	test   rcx,rcx
   140002931:	jne    0x140002955
   140002933:	mov    rdx,QWORD PTR [rbx+0x80]
   14000293a:	movsx  ecx,dil
   14000293e:	call   QWORD PTR [rip+0x2a5c]        # 0x1400053a0
   140002944:	mov    ecx,0xffffffff
   140002949:	cmp    eax,ecx
   14000294b:	cmovne ecx,edi
   14000294e:	mov    eax,ecx
   140002950:	jmp    0x140002a11
   140002955:	lea    rax,[rsp+0x40]
   14000295a:	mov    BYTE PTR [rsp+0x50],dil
   14000295f:	mov    QWORD PTR [rsp+0x38],rax
   140002964:	lea    rdx,[rbx+0x74]
   140002968:	lea    rax,[rsp+0x78]
   14000296d:	mov    QWORD PTR [rsp+0x30],rax
   140002972:	lea    r9,[rsp+0x51]
   140002977:	lea    rax,[rsp+0x58]
   14000297c:	mov    QWORD PTR [rsp+0x28],rax
   140002981:	lea    r8,[rsp+0x50]
   140002986:	lea    rax,[rsp+0x48]
   14000298b:	mov    QWORD PTR [rsp+0x20],rax
   140002990:	call   QWORD PTR [rip+0x273a]        # 0x1400050d0
   140002996:	test   eax,eax
   140002998:	je     0x1400029c4
   14000299a:	sub    eax,0x1
   14000299d:	je     0x1400029c4
   14000299f:	cmp    eax,0x2
   1400029a2:	jne    0x140002a0c
   1400029a4:	movsx  ecx,BYTE PTR [rsp+0x50]
   1400029a9:	mov    rdx,QWORD PTR [rbx+0x80]
   1400029b0:	call   QWORD PTR [rip+0x29ea]        # 0x1400053a0
   1400029b6:	mov    ecx,0xffffffff
   1400029bb:	cmp    eax,ecx
   1400029bd:	cmovne ecx,edi
   1400029c0:	mov    eax,ecx
   1400029c2:	jmp    0x140002a11
   1400029c4:	mov    rsi,QWORD PTR [rsp+0x40]
   1400029c9:	lea    rax,[rsp+0x58]
   1400029ce:	sub    rsi,rax
   1400029d1:	je     0x1400029f2
   1400029d3:	mov    r9,QWORD PTR [rbx+0x80]
   1400029da:	lea    rcx,[rsp+0x58]
   1400029df:	mov    r8,rsi
   1400029e2:	mov    edx,0x1
   1400029e7:	call   QWORD PTR [rip+0x2983]        # 0x140005370
   1400029ed:	cmp    rsi,rax
   1400029f0:	jne    0x140002a0c
   1400029f2:	lea    rax,[rsp+0x50]
   1400029f7:	mov    BYTE PTR [rbx+0x71],0x1
   1400029fb:	cmp    QWORD PTR [rsp+0x48],rax
   140002a00:	mov    ecx,0xffffffff
   140002a05:	cmovne ecx,edi
   140002a08:	mov    eax,ecx
   140002a0a:	jmp    0x140002a11
   140002a0c:	mov    eax,0xffffffff
   140002a11:	mov    rsi,QWORD PTR [rsp+0xa0]
   140002a19:	mov    rcx,QWORD PTR [rsp+0x78]
   140002a1e:	xor    rcx,rsp
   140002a21:	call   0x140003950
   140002a26:	mov    rbx,QWORD PTR [rsp+0xa8]
   140002a2e:	add    rsp,0x80
   140002a35:	pop    rdi
   140002a36:	ret
   140002a37:	int3
   140002a38:	int3
   140002a39:	int3
   140002a3a:	int3
   140002a3b:	int3
   140002a3c:	int3
   140002a3d:	int3
   140002a3e:	int3
   140002a3f:	int3
   140002a40:	mov    rcx,QWORD PTR [rcx+0x80]
   140002a47:	test   rcx,rcx
   140002a4a:	je     0x140002a53
   140002a4c:	rex.W jmp QWORD PTR [rip+0x2805]        # 0x140005258
   140002a53:	ret
   140002a54:	int3
   140002a55:	int3
   140002a56:	int3
   140002a57:	int3
   140002a58:	int3
   140002a59:	int3
   140002a5a:	int3
   140002a5b:	int3
   140002a5c:	int3
   140002a5d:	int3
   140002a5e:	int3
   140002a5f:	int3
   140002a60:	mov    rcx,QWORD PTR [rcx+0x80]
   140002a67:	test   rcx,rcx
   140002a6a:	je     0x140002a73
   140002a6c:	rex.W jmp QWORD PTR [rip+0x27dd]        # 0x140005250
   140002a73:	ret
   140002a74:	int3
   140002a75:	int3
   140002a76:	int3
   140002a77:	int3
   140002a78:	int3
   140002a79:	int3
   140002a7a:	int3
   140002a7b:	int3
   140002a7c:	int3
   140002a7d:	int3
   140002a7e:	int3
   140002a7f:	int3
   140002a80:	rex push rbx
   140002a82:	sub    rsp,0x20
   140002a86:	mov    rbx,rcx
   140002a89:	lea    rax,[rip+0x2b10]        # 0x1400055a0
   140002a90:	mov    QWORD PTR [rcx],rax
   140002a93:	cmp    QWORD PTR [rcx+0x80],0x0
   140002a9b:	je     0x140002acc
   140002a9d:	mov    rcx,QWORD PTR [rcx+0x18]
   140002aa1:	lea    rax,[rbx+0x70]
   140002aa5:	cmp    QWORD PTR [rcx],rax
   140002aa8:	jne    0x140002acc
   140002aaa:	mov    r8,QWORD PTR [rbx+0x90]
   140002ab1:	mov    rdx,QWORD PTR [rbx+0x88]
   140002ab8:	mov    QWORD PTR [rcx],rdx
   140002abb:	mov    rax,QWORD PTR [rbx+0x38]
   140002abf:	mov    QWORD PTR [rax],rdx
   140002ac2:	sub    r8d,edx
   140002ac5:	mov    rax,QWORD PTR [rbx+0x50]
   140002ac9:	mov    DWORD PTR [rax],r8d
   140002acc:	cmp    BYTE PTR [rbx+0x7c],0x0
   140002ad0:	je     0x140002ada
   140002ad2:	mov    rcx,rbx
   140002ad5:	call   0x140002df0
   140002ada:	mov    rcx,rbx
   140002add:	add    rsp,0x20
   140002ae1:	pop    rbx
   140002ae2:	rex.W jmp QWORD PTR [rip+0x2607]        # 0x1400050f0
   140002ae9:	int3
   140002aea:	int3
   140002aeb:	int3
   140002aec:	int3
   140002aed:	int3
   140002aee:	int3
   140002aef:	int3
   140002af0:	rex push rbx
   140002af2:	sub    rsp,0x20
   140002af6:	mov    rbx,rcx
   140002af9:	mov    rcx,QWORD PTR [rcx]
   140002afc:	test   rcx,rcx
   140002aff:	je     0x140002b3b
   140002b01:	mov    rdx,QWORD PTR [rbx+0x10]
   140002b05:	sub    rdx,rcx
   140002b08:	cmp    rdx,0x1000
   140002b0f:	jb     0x140002b29
   140002b11:	mov    r8,QWORD PTR [rcx-0x8]
   140002b15:	add    rdx,0x27
   140002b19:	sub    rcx,r8
   140002b1c:	lea    rax,[rcx-0x8]
   140002b20:	cmp    rax,0x1f
   140002b24:	ja     0x140002b41
   140002b26:	mov    rcx,r8
   140002b29:	call   0x1400039ac
   140002b2e:	xor    eax,eax
   140002b30:	mov    QWORD PTR [rbx],rax
   140002b33:	mov    QWORD PTR [rbx+0x8],rax
   140002b37:	mov    QWORD PTR [rbx+0x10],rax
   140002b3b:	add    rsp,0x20
   140002b3f:	pop    rbx
   140002b40:	ret
   140002b41:	call   QWORD PTR [rip+0x27f9]        # 0x140005340
   140002b47:	int3
   140002b48:	int3
   140002b49:	int3
   140002b4a:	int3
   140002b4b:	int3
   140002b4c:	int3
   140002b4d:	int3
   140002b4e:	int3
   140002b4f:	int3
   140002b50:	rex push rbx
   140002b52:	sub    rsp,0x20
   140002b56:	mov    rdx,QWORD PTR [rcx+0x18]
   140002b5a:	mov    rbx,rcx
   140002b5d:	cmp    rdx,0xf
   140002b61:	jbe    0x140002b8f
   140002b63:	mov    rcx,QWORD PTR [rcx]
   140002b66:	inc    rdx
   140002b69:	cmp    rdx,0x1000
   140002b70:	jb     0x140002b8a
   140002b72:	mov    r8,QWORD PTR [rcx-0x8]
   140002b76:	add    rdx,0x27
   140002b7a:	sub    rcx,r8
   140002b7d:	lea    rax,[rcx-0x8]
   140002b81:	cmp    rax,0x1f
   140002b85:	ja     0x140002ba8
   140002b87:	mov    rcx,r8
   140002b8a:	call   0x1400039ac
   140002b8f:	mov    QWORD PTR [rbx+0x10],0x0
   140002b97:	mov    QWORD PTR [rbx+0x18],0xf
   140002b9f:	mov    BYTE PTR [rbx],0x0
   140002ba2:	add    rsp,0x20
   140002ba6:	pop    rbx
   140002ba7:	ret
   140002ba8:	call   QWORD PTR [rip+0x2792]        # 0x140005340
   140002bae:	int3
   140002baf:	int3
   140002bb0:	mov    QWORD PTR [rsp+0x8],rbx
   140002bb5:	push   rdi
   140002bb6:	sub    rsp,0x20
   140002bba:	lea    rdi,[rcx-0xa8]
   140002bc1:	mov    ebx,edx
   140002bc3:	mov    rcx,rdi
   140002bc6:	call   0x140001dd0
   140002bcb:	test   bl,0x1
   140002bce:	je     0x140002bdd
   140002bd0:	mov    edx,0x108
   140002bd5:	mov    rcx,rdi
   140002bd8:	call   0x1400039ac
   140002bdd:	mov    rbx,QWORD PTR [rsp+0x30]
   140002be2:	mov    rax,rdi
   140002be5:	add    rsp,0x20
   140002be9:	pop    rdi
   140002bea:	ret
   140002beb:	int3
   140002bec:	int3
   140002bed:	int3
   140002bee:	int3
   140002bef:	int3
   140002bf0:	mov    QWORD PTR [rsp+0x8],rbx
   140002bf5:	push   rdi
   140002bf6:	sub    rsp,0x20
   140002bfa:	mov    edi,edx
   140002bfc:	mov    rbx,rcx
   140002bff:	lea    rax,[rip+0x299a]        # 0x1400055a0
   140002c06:	mov    QWORD PTR [rcx],rax
   140002c09:	cmp    QWORD PTR [rcx+0x80],0x0
   140002c11:	je     0x140002c40
   140002c13:	mov    r8,QWORD PTR [rcx+0x18]
   140002c17:	lea    rax,[rcx+0x70]
   140002c1b:	cmp    QWORD PTR [r8],rax
   140002c1e:	jne    0x140002c40
   140002c20:	mov    rdx,QWORD PTR [rcx+0x90]
   140002c27:	mov    rcx,QWORD PTR [rcx+0x88]
   140002c2e:	mov    QWORD PTR [r8],rcx
   140002c31:	mov    rax,QWORD PTR [rbx+0x38]
   140002c35:	mov    QWORD PTR [rax],rcx
   140002c38:	sub    edx,ecx
   140002c3a:	mov    rax,QWORD PTR [rbx+0x50]
   140002c3e:	mov    DWORD PTR [rax],edx
   140002c40:	cmp    BYTE PTR [rbx+0x7c],0x0
   140002c44:	je     0x140002c4e
   140002c46:	mov    rcx,rbx
   140002c49:	call   0x140002df0
   140002c4e:	mov    rcx,rbx
   140002c51:	call   QWORD PTR [rip+0x2499]        # 0x1400050f0
   140002c57:	nop
   140002c58:	test   dil,0x1
   140002c5c:	je     0x140002c6b
   140002c5e:	mov    edx,0x98
   140002c63:	mov    rcx,rbx
   140002c66:	call   0x1400039ac
   140002c6b:	mov    rax,rbx
   140002c6e:	mov    rbx,QWORD PTR [rsp+0x30]
   140002c73:	add    rsp,0x20
   140002c77:	pop    rdi
   140002c78:	ret
   140002c79:	int3
   140002c7a:	int3
   140002c7b:	int3
   140002c7c:	int3
   140002c7d:	int3
   140002c7e:	int3
   140002c7f:	int3
   140002c80:	mov    QWORD PTR [rsp+0x8],rbx
   140002c85:	push   rdi
   140002c86:	sub    rsp,0x20
   140002c8a:	lea    rdi,[rcx-0xb0]
   140002c91:	mov    ebx,edx
   140002c93:	mov    rcx,rdi
   140002c96:	call   0x140001d10
   140002c9b:	test   bl,0x1
   140002c9e:	je     0x140002cad
   140002ca0:	mov    edx,0x110
   140002ca5:	mov    rcx,rdi
   140002ca8:	call   0x1400039ac
   140002cad:	mov    rbx,QWORD PTR [rsp+0x30]
   140002cb2:	mov    rax,rdi
   140002cb5:	add    rsp,0x20
   140002cb9:	pop    rdi
   140002cba:	ret
   140002cbb:	int3
   140002cbc:	int3
   140002cbd:	int3
   140002cbe:	int3
   140002cbf:	int3
   140002cc0:	rex push rbx
   140002cc2:	sub    rsp,0x20
   140002cc6:	mov    rbx,rcx
   140002cc9:	call   QWORD PTR [rip+0x24e1]        # 0x1400051b0
   140002ccf:	test   al,al
   140002cd1:	jne    0x140002cdd
   140002cd3:	mov    rcx,QWORD PTR [rbx]
   140002cd6:	call   QWORD PTR [rip+0x23d4]        # 0x1400050b0
   140002cdc:	nop
   140002cdd:	mov    rcx,QWORD PTR [rbx]
   140002ce0:	mov    rax,QWORD PTR [rcx]
   140002ce3:	movsxd rdx,DWORD PTR [rax+0x4]
   140002ce7:	mov    rcx,QWORD PTR [rdx+rcx*1+0x48]
   140002cec:	test   rcx,rcx
   140002cef:	je     0x140002cf8
   140002cf1:	mov    rax,QWORD PTR [rcx]
   140002cf4:	call   QWORD PTR [rax+0x10]
   140002cf7:	nop
   140002cf8:	add    rsp,0x20
   140002cfc:	pop    rbx
   140002cfd:	ret
   140002cfe:	int3
   140002cff:	int3
   140002d00:	rex push rbx
   140002d02:	sub    rsp,0x60
   140002d06:	mov    rax,QWORD PTR [rip+0x5333]        # 0x140008040
   140002d0d:	xor    rax,rsp
   140002d10:	mov    QWORD PTR [rsp+0x58],rax
   140002d15:	cmp    QWORD PTR [rcx+0x68],0x0
   140002d1a:	mov    rbx,rcx
   140002d1d:	je     0x140002dd3
   140002d23:	cmp    BYTE PTR [rcx+0x71],0x0
   140002d27:	je     0x140002dd3
   140002d2d:	mov    rax,QWORD PTR [rcx]
   140002d30:	mov    edx,0xffffffff
   140002d35:	mov    QWORD PTR [rsp+0x78],rdi
   140002d3a:	call   QWORD PTR [rax+0x18]
   140002d3d:	cmp    eax,0xffffffff
   140002d40:	je     0x140002dcf
   140002d46:	mov    rcx,QWORD PTR [rbx+0x68]
   140002d4a:	lea    rax,[rsp+0x30]
   140002d4f:	lea    rdx,[rbx+0x74]
   140002d53:	mov    QWORD PTR [rsp+0x20],rax
   140002d58:	lea    r9,[rsp+0x58]
   140002d5d:	lea    r8,[rsp+0x38]
   140002d62:	call   QWORD PTR [rip+0x2328]        # 0x140005090
   140002d68:	test   eax,eax
   140002d6a:	je     0x140002d94
   140002d6c:	sub    eax,0x1
   140002d6f:	je     0x140002d98
   140002d71:	cmp    eax,0x2
   140002d74:	jne    0x140002dcf
   140002d76:	mov    BYTE PTR [rbx+0x71],0x0
   140002d7a:	mov    al,0x1
   140002d7c:	mov    rdi,QWORD PTR [rsp+0x78]
   140002d81:	mov    rcx,QWORD PTR [rsp+0x58]
   140002d86:	xor    rcx,rsp
   140002d89:	call   0x140003950
   140002d8e:	add    rsp,0x60
   140002d92:	pop    rbx
   140002d93:	ret
   140002d94:	mov    BYTE PTR [rbx+0x71],0x0
   140002d98:	mov    rdi,QWORD PTR [rsp+0x30]
   140002d9d:	lea    rax,[rsp+0x38]
   140002da2:	sub    rdi,rax
   140002da5:	je     0x140002dc6
   140002da7:	mov    r9,QWORD PTR [rbx+0x80]
   140002dae:	lea    rcx,[rsp+0x38]
   140002db3:	mov    r8,rdi
   140002db6:	mov    edx,0x1
   140002dbb:	call   QWORD PTR [rip+0x25af]        # 0x140005370
   140002dc1:	cmp    rdi,rax
   140002dc4:	jne    0x140002dcf
   140002dc6:	cmp    BYTE PTR [rbx+0x71],0x0
   140002dca:	sete   al
   140002dcd:	jmp    0x140002d7c
   140002dcf:	xor    al,al
   140002dd1:	jmp    0x140002d7c
   140002dd3:	mov    al,0x1
   140002dd5:	mov    rcx,QWORD PTR [rsp+0x58]
   140002dda:	xor    rcx,rsp
   140002ddd:	call   0x140003950
   140002de2:	add    rsp,0x60
   140002de6:	pop    rbx
   140002de7:	ret
   140002de8:	int3
   140002de9:	int3
   140002dea:	int3
   140002deb:	int3
   140002dec:	int3
   140002ded:	int3
   140002dee:	int3
   140002def:	int3
   140002df0:	mov    QWORD PTR [rsp+0x18],rsi
   140002df5:	push   rdi
   140002df6:	sub    rsp,0x20
   140002dfa:	cmp    QWORD PTR [rcx+0x80],0x0
   140002e02:	mov    rdi,rcx
   140002e05:	je     0x140002e65
   140002e07:	mov    r8,QWORD PTR [rcx+0x18]
   140002e0b:	lea    rax,[rcx+0x70]
   140002e0f:	mov    QWORD PTR [rsp+0x38],rbx
   140002e14:	cmp    QWORD PTR [r8],rax
   140002e17:	jne    0x140002e39
   140002e19:	mov    rdx,QWORD PTR [rcx+0x90]
   140002e20:	mov    rcx,QWORD PTR [rcx+0x88]
   140002e27:	mov    QWORD PTR [r8],rcx
   140002e2a:	sub    edx,ecx
   140002e2c:	mov    rax,QWORD PTR [rdi+0x38]
   140002e30:	mov    QWORD PTR [rax],rcx
   140002e33:	mov    rax,QWORD PTR [rdi+0x50]
   140002e37:	mov    DWORD PTR [rax],edx
   140002e39:	mov    rcx,rdi
   140002e3c:	call   0x140002d00
   140002e41:	mov    rcx,QWORD PTR [rdi+0x80]
   140002e48:	xor    ebx,ebx
   140002e4a:	test   al,al
   140002e4c:	cmovne rbx,rdi
   140002e50:	call   QWORD PTR [rip+0x253a]        # 0x140005390
   140002e56:	xor    esi,esi
   140002e58:	test   eax,eax
   140002e5a:	cmove  rsi,rbx
   140002e5e:	mov    rbx,QWORD PTR [rsp+0x38]
   140002e63:	jmp    0x140002e67
   140002e65:	xor    esi,esi
   140002e67:	mov    rcx,rdi
   140002e6a:	mov    BYTE PTR [rdi+0x7c],0x0
   140002e6e:	mov    BYTE PTR [rdi+0x71],0x0
   140002e72:	call   QWORD PTR [rip+0x2220]        # 0x140005098
   140002e78:	mov    rcx,QWORD PTR [rip+0x5b79]        # 0x1400089f8
   140002e7f:	mov    rax,rsi
   140002e82:	mov    rsi,QWORD PTR [rsp+0x40]
   140002e87:	mov    QWORD PTR [rdi+0x74],rcx
   140002e8b:	mov    QWORD PTR [rdi+0x80],0x0
   140002e96:	mov    QWORD PTR [rdi+0x68],0x0
   140002e9e:	add    rsp,0x20
   140002ea2:	pop    rdi
   140002ea3:	ret
   140002ea4:	int3
   140002ea5:	int3
   140002ea6:	int3
   140002ea7:	int3
   140002ea8:	int3
   140002ea9:	int3
   140002eaa:	int3
   140002eab:	int3
   140002eac:	int3
   140002ead:	int3
   140002eae:	int3
   140002eaf:	int3
   140002eb0:	sub    rsp,0x28
   140002eb4:	mov    rdx,QWORD PTR [rcx]
   140002eb7:	mov    rax,QWORD PTR [rdx]
   140002eba:	movsxd rcx,DWORD PTR [rax+0x4]
   140002ebe:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140002ec3:	test   rcx,rcx
   140002ec6:	je     0x140002ecf
   140002ec8:	mov    rax,QWORD PTR [rcx]
   140002ecb:	call   QWORD PTR [rax+0x10]
   140002ece:	nop
   140002ecf:	add    rsp,0x28
   140002ed3:	ret
   140002ed4:	int3
   140002ed5:	int3
   140002ed6:	int3
   140002ed7:	int3
   140002ed8:	int3
   140002ed9:	int3
   140002eda:	int3
   140002edb:	int3
   140002edc:	int3
   140002edd:	int3
   140002ede:	int3
   140002edf:	int3
   140002ee0:	rex push rbx
   140002ee2:	push   rsi
   140002ee3:	push   rdi
   140002ee4:	sub    rsp,0x50
   140002ee8:	mov    rax,QWORD PTR [rip+0x5151]        # 0x140008040
   140002eef:	xor    rax,rsp
   140002ef2:	mov    QWORD PTR [rsp+0x40],rax
   140002ef7:	mov    r9d,r8d
   140002efa:	mov    rax,rdx
   140002efd:	mov    rbx,rcx
   140002f00:	cmp    QWORD PTR [rcx+0x80],0x0
   140002f08:	jne    0x140003009
   140002f0e:	mov    r8d,0x40
   140002f14:	mov    edx,r9d
   140002f17:	mov    rcx,rax
   140002f1a:	call   QWORD PTR [rip+0x2270]        # 0x140005190
   140002f20:	mov    rdi,rax
   140002f23:	test   rax,rax
   140002f26:	je     0x140003009
   140002f2c:	mov    BYTE PTR [rbx+0x7c],0x1
   140002f30:	mov    BYTE PTR [rbx+0x71],0x0
   140002f34:	mov    rcx,rbx
   140002f37:	call   QWORD PTR [rip+0x215b]        # 0x140005098
   140002f3d:	xor    esi,esi
   140002f3f:	mov    QWORD PTR [rsp+0x20],rsi
   140002f44:	mov    QWORD PTR [rsp+0x28],rsi
   140002f49:	mov    QWORD PTR [rsp+0x30],rsi
   140002f4e:	lea    r9,[rsp+0x30]
   140002f53:	lea    r8,[rsp+0x28]
   140002f58:	lea    rdx,[rsp+0x20]
   140002f5d:	mov    rcx,rdi
   140002f60:	call   QWORD PTR [rip+0x2412]        # 0x140005378
   140002f66:	mov    rax,QWORD PTR [rsp+0x20]
   140002f6b:	mov    QWORD PTR [rbx+0x18],rax
   140002f6f:	mov    QWORD PTR [rbx+0x20],rax
   140002f73:	mov    rax,QWORD PTR [rsp+0x28]
   140002f78:	mov    QWORD PTR [rbx+0x38],rax
   140002f7c:	mov    QWORD PTR [rbx+0x40],rax
   140002f80:	mov    rax,QWORD PTR [rsp+0x30]
   140002f85:	mov    QWORD PTR [rbx+0x50],rax
   140002f89:	mov    QWORD PTR [rbx+0x58],rax
   140002f8d:	mov    QWORD PTR [rbx+0x80],rdi
   140002f94:	mov    rax,QWORD PTR [rip+0x5a5d]        # 0x1400089f8
   140002f9b:	mov    QWORD PTR [rbx+0x74],rax
   140002f9f:	mov    QWORD PTR [rbx+0x68],rsi
   140002fa3:	lea    rdx,[rsp+0x30]
   140002fa8:	mov    rcx,rbx
   140002fab:	call   QWORD PTR [rip+0x20cf]        # 0x140005080
   140002fb1:	nop
   140002fb2:	mov    rcx,rax
   140002fb5:	call   0x140003240
   140002fba:	mov    rdi,rax
   140002fbd:	mov    rcx,rax
   140002fc0:	call   QWORD PTR [rip+0x2192]        # 0x140005158
   140002fc6:	test   al,al
   140002fc8:	je     0x140002fd0
   140002fca:	mov    QWORD PTR [rbx+0x68],rsi
   140002fce:	jmp    0x140002fde
   140002fd0:	mov    QWORD PTR [rbx+0x68],rdi
   140002fd4:	mov    rcx,rbx
   140002fd7:	call   QWORD PTR [rip+0x20bb]        # 0x140005098
   140002fdd:	nop
   140002fde:	mov    rcx,QWORD PTR [rsp+0x38]
   140002fe3:	test   rcx,rcx
   140002fe6:	je     0x140003004
   140002fe8:	mov    rdx,QWORD PTR [rcx]
   140002feb:	call   QWORD PTR [rdx+0x10]
   140002fee:	test   rax,rax
   140002ff1:	je     0x140003004
   140002ff3:	mov    rcx,QWORD PTR [rax]
   140002ff6:	mov    r8,QWORD PTR [rcx]
   140002ff9:	mov    edx,0x1
   140002ffe:	mov    rcx,rax
   140003001:	call   r8
   140003004:	mov    rax,rbx
   140003007:	jmp    0x14000300b
   140003009:	xor    eax,eax
   14000300b:	mov    rcx,QWORD PTR [rsp+0x40]
   140003010:	xor    rcx,rsp
   140003013:	call   0x140003950
   140003018:	add    rsp,0x50
   14000301c:	pop    rdi
   14000301d:	pop    rsi
   14000301e:	pop    rbx
   14000301f:	ret
   140003020:	mov    QWORD PTR [rsp+0x10],rbx
   140003025:	mov    QWORD PTR [rsp+0x8],rcx
   14000302a:	push   rsi
   14000302b:	push   rdi
   14000302c:	push   r12
   14000302e:	push   r14
   140003030:	push   r15
   140003032:	sub    rsp,0x30
   140003036:	mov    r15,rdx
   140003039:	mov    rsi,rcx
   14000303c:	xor    ebx,ebx
   14000303e:	mov    DWORD PTR [rsp+0x70],ebx
   140003042:	mov    r14,0xffffffffffffffff
   140003049:	nop    DWORD PTR [rax+0x0]
   140003050:	inc    r14
   140003053:	cmp    BYTE PTR [rdx+r14*1],bl
   140003057:	jne    0x140003050
   140003059:	mov    rax,QWORD PTR [rcx]
   14000305c:	movsxd rcx,DWORD PTR [rax+0x4]
   140003060:	mov    rdi,QWORD PTR [rcx+rsi*1+0x28]
   140003065:	test   rdi,rdi
   140003068:	jle    0x140003074
   14000306a:	cmp    rdi,r14
   14000306d:	jle    0x140003074
   14000306f:	sub    rdi,r14
   140003072:	jmp    0x140003076
   140003074:	xor    edi,edi
   140003076:	mov    r12,rsi
   140003079:	mov    QWORD PTR [rsp+0x20],rsi
   14000307e:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140003083:	test   rcx,rcx
   140003086:	je     0x14000308f
   140003088:	mov    rax,QWORD PTR [rcx]
   14000308b:	call   QWORD PTR [rax+0x8]
   14000308e:	nop
   14000308f:	mov    rax,QWORD PTR [rsi]
   140003092:	movsxd rcx,DWORD PTR [rax+0x4]
   140003096:	add    rcx,rsi
   140003099:	call   QWORD PTR [rip+0x20a9]        # 0x140005148
   14000309f:	test   al,al
   1400030a1:	je     0x1400030d3
   1400030a3:	mov    rax,QWORD PTR [rsi]
   1400030a6:	movsxd rcx,DWORD PTR [rax+0x4]
   1400030aa:	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   1400030af:	test   rcx,rcx
   1400030b2:	je     0x1400030d1
   1400030b4:	cmp    rcx,rsi
   1400030b7:	je     0x1400030d1
   1400030b9:	call   QWORD PTR [rip+0x1ff9]        # 0x1400050b8
   1400030bf:	mov    rax,QWORD PTR [rsi]
   1400030c2:	movsxd rcx,DWORD PTR [rax+0x4]
   1400030c6:	add    rcx,rsi
   1400030c9:	call   QWORD PTR [rip+0x2079]        # 0x140005148
   1400030cf:	jmp    0x1400030d3
   1400030d1:	mov    al,0x1
   1400030d3:	mov    BYTE PTR [rsp+0x28],al
   1400030d7:	test   al,al
   1400030d9:	jne    0x1400030e5
   1400030db:	mov    ebx,0x4
   1400030e0:	jmp    0x14000319d
   1400030e5:	mov    rax,QWORD PTR [rsi]
   1400030e8:	movsxd rax,DWORD PTR [rax+0x4]
   1400030ec:	mov    eax,DWORD PTR [rax+rsi*1+0x18]
   1400030f0:	and    eax,0x1c0
   1400030f5:	cmp    eax,0x40
   1400030f8:	je     0x14000312d
   1400030fa:	nop    WORD PTR [rax+rax*1+0x0]
   140003100:	test   rdi,rdi
   140003103:	jle    0x14000312d
   140003105:	mov    rax,QWORD PTR [rsi]
   140003108:	movsxd rcx,DWORD PTR [rax+0x4]
   14000310c:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140003111:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140003116:	call   QWORD PTR [rip+0x1f6c]        # 0x140005088
   14000311c:	cmp    eax,0xffffffff
   14000311f:	jne    0x140003128
   140003121:	mov    ebx,0x4
   140003126:	jmp    0x140003179
   140003128:	dec    rdi
   14000312b:	jmp    0x140003100
   14000312d:	mov    rax,QWORD PTR [rsi]
   140003130:	movsxd rcx,DWORD PTR [rax+0x4]
   140003134:	mov    r8,r14
   140003137:	mov    rdx,r15
   14000313a:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   14000313f:	call   QWORD PTR [rip+0x1f93]        # 0x1400050d8
   140003145:	cmp    rax,r14
   140003148:	jne    0x140003176
   14000314a:	nop    WORD PTR [rax+rax*1+0x0]
   140003150:	test   rdi,rdi
   140003153:	jle    0x14000317d
   140003155:	mov    rax,QWORD PTR [rsi]
   140003158:	movsxd rcx,DWORD PTR [rax+0x4]
   14000315c:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140003161:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140003166:	call   QWORD PTR [rip+0x1f1c]        # 0x140005088
   14000316c:	cmp    eax,0xffffffff
   14000316f:	je     0x140003176
   140003171:	dec    rdi
   140003174:	jmp    0x140003150
   140003176:	or     ebx,0x4
   140003179:	mov    DWORD PTR [rsp+0x70],ebx
   14000317d:	mov    rax,QWORD PTR [rsi]
   140003180:	movsxd rcx,DWORD PTR [rax+0x4]
   140003184:	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   14000318d:	jmp    0x14000319d
   14000318f:	mov    rsi,QWORD PTR [rsp+0x60]
   140003194:	mov    ebx,DWORD PTR [rsp+0x70]
   140003198:	mov    r12,QWORD PTR [rsp+0x20]
   14000319d:	mov    rax,QWORD PTR [rsi]
   1400031a0:	movsxd rcx,DWORD PTR [rax+0x4]
   1400031a4:	add    rcx,rsi
   1400031a7:	xor    r8d,r8d
   1400031aa:	mov    edx,ebx
   1400031ac:	call   QWORD PTR [rip+0x1f36]        # 0x1400050e8
   1400031b2:	nop
   1400031b3:	call   QWORD PTR [rip+0x1ff7]        # 0x1400051b0
   1400031b9:	test   al,al
   1400031bb:	jne    0x1400031c7
   1400031bd:	mov    rcx,r12
   1400031c0:	call   QWORD PTR [rip+0x1eea]        # 0x1400050b0
   1400031c6:	nop
   1400031c7:	mov    rax,QWORD PTR [r12]
   1400031cb:	movsxd rcx,DWORD PTR [rax+0x4]
   1400031cf:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   1400031d4:	test   rcx,rcx
   1400031d7:	je     0x1400031e0
   1400031d9:	mov    rax,QWORD PTR [rcx]
   1400031dc:	call   QWORD PTR [rax+0x10]
   1400031df:	nop
   1400031e0:	mov    rax,rsi
   1400031e3:	mov    rbx,QWORD PTR [rsp+0x68]
   1400031e8:	add    rsp,0x30
   1400031ec:	pop    r15
   1400031ee:	pop    r14
   1400031f0:	pop    r12
   1400031f2:	pop    rdi
   1400031f3:	pop    rsi
   1400031f4:	ret
   1400031f5:	int3
   1400031f6:	int3
   1400031f7:	int3
   1400031f8:	int3
   1400031f9:	int3
   1400031fa:	int3
   1400031fb:	int3
   1400031fc:	int3
   1400031fd:	int3
   1400031fe:	int3
   1400031ff:	int3
   140003200:	rex push rbx
   140003202:	sub    rsp,0x20
   140003206:	mov    rax,QWORD PTR [rcx]
   140003209:	mov    rbx,rcx
   14000320c:	mov    dl,0xa
   14000320e:	movsxd rcx,DWORD PTR [rax+0x4]
   140003212:	add    rcx,rbx
   140003215:	call   QWORD PTR [rip+0x1ec5]        # 0x1400050e0
   14000321b:	movzx  edx,al
   14000321e:	mov    rcx,rbx
   140003221:	call   QWORD PTR [rip+0x1f41]        # 0x140005168
   140003227:	mov    rcx,rbx
   14000322a:	call   QWORD PTR [rip+0x1e88]        # 0x1400050b8
   140003230:	mov    rax,rbx
   140003233:	add    rsp,0x20
   140003237:	pop    rbx
   140003238:	ret
   140003239:	int3
   14000323a:	int3
   14000323b:	int3
   14000323c:	int3
   14000323d:	int3
   14000323e:	int3
   14000323f:	int3
   140003240:	mov    QWORD PTR [rsp+0x10],rbx
   140003245:	mov    QWORD PTR [rsp+0x18],rbp
   14000324a:	mov    QWORD PTR [rsp+0x20],rsi
   14000324f:	push   rdi
   140003250:	sub    rsp,0x40
   140003254:	mov    rax,QWORD PTR [rip+0x4de5]        # 0x140008040
   14000325b:	xor    rax,rsp
   14000325e:	mov    QWORD PTR [rsp+0x38],rax
   140003263:	mov    rbp,rcx
   140003266:	xor    edx,edx
   140003268:	lea    rcx,[rsp+0x28]
   14000326d:	call   QWORD PTR [rip+0x1f5d]        # 0x1400051d0
   140003273:	nop
   140003274:	mov    rax,QWORD PTR [rip+0x5775]        # 0x1400089f0
   14000327b:	mov    QWORD PTR [rsp+0x20],rax
   140003280:	mov    rbx,QWORD PTR [rip+0x1f11]        # 0x140005198
   140003287:	cmp    QWORD PTR [rbx],0x0
   14000328b:	jne    0x1400032ba
   14000328d:	xor    edx,edx
   14000328f:	lea    rcx,[rsp+0x30]
   140003294:	call   QWORD PTR [rip+0x1f36]        # 0x1400051d0
   14000329a:	cmp    QWORD PTR [rbx],0x0
   14000329e:	jne    0x1400032af
   1400032a0:	mov    rax,QWORD PTR [rip+0x1f01]        # 0x1400051a8
   1400032a7:	inc    DWORD PTR [rax]
   1400032a9:	movsxd rax,DWORD PTR [rax]
   1400032ac:	mov    QWORD PTR [rbx],rax
   1400032af:	lea    rcx,[rsp+0x30]
   1400032b4:	call   QWORD PTR [rip+0x1f1e]        # 0x1400051d8
   1400032ba:	mov    rsi,QWORD PTR [rbx]
   1400032bd:	mov    rcx,QWORD PTR [rbp+0x8]
   1400032c1:	lea    rdi,[rsi*8+0x0]
   1400032c9:	cmp    rsi,QWORD PTR [rcx+0x18]
   1400032cd:	jae    0x1400032de
   1400032cf:	mov    rax,QWORD PTR [rcx+0x10]
   1400032d3:	mov    rbx,QWORD PTR [rdi+rax*1]
   1400032d7:	test   rbx,rbx
   1400032da:	jne    0x140003344
   1400032dc:	jmp    0x1400032e0
   1400032de:	xor    ebx,ebx
   1400032e0:	cmp    BYTE PTR [rcx+0x24],0x0
   1400032e4:	je     0x1400032fa
   1400032e6:	call   QWORD PTR [rip+0x1ed4]        # 0x1400051c0
   1400032ec:	cmp    rsi,QWORD PTR [rax+0x18]
   1400032f0:	jae    0x1400032ff
   1400032f2:	mov    rax,QWORD PTR [rax+0x10]
   1400032f6:	mov    rbx,QWORD PTR [rdi+rax*1]
   1400032fa:	test   rbx,rbx
   1400032fd:	jne    0x140003344
   1400032ff:	mov    rbx,QWORD PTR [rsp+0x20]
   140003304:	test   rbx,rbx
   140003307:	jne    0x140003344
   140003309:	mov    rdx,rbp
   14000330c:	lea    rcx,[rsp+0x20]
   140003311:	call   QWORD PTR [rip+0x1e59]        # 0x140005170
   140003317:	cmp    rax,0xffffffffffffffff
   14000331b:	je     0x140003374
   14000331d:	mov    rbx,QWORD PTR [rsp+0x20]
   140003322:	mov    QWORD PTR [rsp+0x30],rbx
   140003327:	mov    rcx,rbx
   14000332a:	call   0x1400038ec
   14000332f:	mov    rax,QWORD PTR [rbx]
   140003332:	mov    rcx,rbx
   140003335:	call   QWORD PTR [rax+0x8]
   140003338:	mov    rbx,QWORD PTR [rsp+0x20]
   14000333d:	mov    QWORD PTR [rip+0x56ac],rbx        # 0x1400089f0
   140003344:	lea    rcx,[rsp+0x28]
   140003349:	call   QWORD PTR [rip+0x1e89]        # 0x1400051d8
   14000334f:	mov    rax,rbx
   140003352:	mov    rcx,QWORD PTR [rsp+0x38]
   140003357:	xor    rcx,rsp
   14000335a:	call   0x140003950
   14000335f:	mov    rbx,QWORD PTR [rsp+0x58]
   140003364:	mov    rbp,QWORD PTR [rsp+0x60]
   140003369:	mov    rsi,QWORD PTR [rsp+0x68]
   14000336e:	add    rsp,0x40
   140003372:	pop    rdi
   140003373:	ret
   140003374:	call   0x140001200
   140003379:	nop
   14000337a:	int3
   14000337b:	int3
   14000337c:	int3
   14000337d:	int3
   14000337e:	int3
   14000337f:	int3
   140003380:	rex push rbx
   140003382:	push   rbp
   140003383:	push   rsi
   140003384:	push   r15
   140003386:	sub    rsp,0x28
   14000338a:	mov    rbp,QWORD PTR [rcx+0x10]
   14000338e:	movabs rbx,0x7fffffffffffffff
   140003398:	mov    rax,rbx
   14000339b:	movzx  r15d,r9b
   14000339f:	sub    rax,rbp
   1400033a2:	mov    rsi,rcx
   1400033a5:	cmp    rax,0x1
   1400033a9:	jb     0x1400034d5
   1400033af:	mov    QWORD PTR [rsp+0x58],rdi
   1400033b4:	mov    QWORD PTR [rsp+0x60],r12
   1400033b9:	lea    r12,[rbp+0x1]
   1400033bd:	mov    rdx,r12
   1400033c0:	mov    QWORD PTR [rsp+0x20],r14
   1400033c5:	mov    r14,QWORD PTR [rcx+0x18]
   1400033c9:	or     rdx,0xf
   1400033cd:	cmp    rdx,rbx
   1400033d0:	ja     0x140003416
   1400033d2:	mov    rcx,r14
   1400033d5:	mov    rax,rbx
   1400033d8:	shr    rcx,1
   1400033db:	sub    rax,rcx
   1400033de:	cmp    r14,rax
   1400033e1:	ja     0x140003416
   1400033e3:	lea    rax,[rcx+r14*1]
   1400033e7:	mov    rbx,rdx
   1400033ea:	cmp    rdx,rax
   1400033ed:	cmovb  rbx,rax
   1400033f1:	lea    rcx,[rbx+0x1]
   1400033f5:	test   rcx,rcx
   1400033f8:	jne    0x1400033fe
   1400033fa:	xor    edi,edi
   1400033fc:	jmp    0x140003447
   1400033fe:	cmp    rcx,0x1000
   140003405:	jb     0x14000343f
   140003407:	lea    rax,[rcx+0x27]
   14000340b:	cmp    rax,rcx
   14000340e:	jbe    0x1400034db
   140003414:	jmp    0x140003424
   140003416:	movabs rax,0x8000000000000000
   140003420:	add    rax,0x27
   140003424:	mov    rcx,rax
   140003427:	call   0x140003970
   14000342c:	test   rax,rax
   14000342f:	je     0x14000349e
   140003431:	lea    rdi,[rax+0x27]
   140003435:	and    rdi,0xffffffffffffffe0
   140003439:	mov    QWORD PTR [rdi-0x8],rax
   14000343d:	jmp    0x140003447
   14000343f:	call   0x140003970
   140003444:	mov    rdi,rax
   140003447:	mov    QWORD PTR [rsi+0x10],r12
   14000344b:	mov    r8,rbp
   14000344e:	mov    QWORD PTR [rsi+0x18],rbx
   140003452:	mov    rcx,rdi
   140003455:	cmp    r14,0xf
   140003459:	jbe    0x1400034a5
   14000345b:	mov    rbx,QWORD PTR [rsi]
   14000345e:	mov    rdx,rbx
   140003461:	call   0x1400048a3
   140003466:	lea    rdx,[r14+0x1]
   14000346a:	mov    BYTE PTR [rdi+rbp*1],r15b
   14000346e:	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140003473:	cmp    rdx,0x1000
   14000347a:	jb     0x140003494
   14000347c:	mov    rcx,QWORD PTR [rbx-0x8]
   140003480:	add    rdx,0x27
   140003484:	sub    rbx,rcx
   140003487:	lea    rax,[rbx-0x8]
   14000348b:	cmp    rax,0x1f
   14000348f:	ja     0x14000349e
   140003491:	mov    rbx,rcx
   140003494:	mov    rcx,rbx
   140003497:	call   0x1400039ac
   14000349c:	jmp    0x1400034b6
   14000349e:	call   QWORD PTR [rip+0x1e9c]        # 0x140005340
   1400034a4:	int3
   1400034a5:	mov    rdx,rsi
   1400034a8:	call   0x1400048a3
   1400034ad:	mov    BYTE PTR [rdi+rbp*1],r15b
   1400034b1:	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   1400034b6:	mov    QWORD PTR [rsi],rdi
   1400034b9:	mov    rax,rsi
   1400034bc:	mov    r12,QWORD PTR [rsp+0x60]
   1400034c1:	mov    rdi,QWORD PTR [rsp+0x58]
   1400034c6:	mov    r14,QWORD PTR [rsp+0x20]
   1400034cb:	add    rsp,0x28
   1400034cf:	pop    r15
   1400034d1:	pop    rsi
   1400034d2:	pop    rbp
   1400034d3:	pop    rbx
   1400034d4:	ret
   1400034d5:	call   0x1400011b0
   1400034da:	int3
   1400034db:	call   0x140001110
   1400034e0:	int3
   1400034e1:	int3
   1400034e2:	int3
   1400034e3:	int3
   1400034e4:	int3
   1400034e5:	int3
   1400034e6:	int3
   1400034e7:	int3
   1400034e8:	int3
   1400034e9:	int3
   1400034ea:	int3
   1400034eb:	int3
   1400034ec:	int3
   1400034ed:	int3
   1400034ee:	int3
   1400034ef:	int3
   1400034f0:	rex push rbx
   1400034f2:	sub    rsp,0x20
   1400034f6:	mov    rbx,QWORD PTR [rcx]
   1400034f9:	test   rbx,rbx
   1400034fc:	je     0x140003540
   1400034fe:	mov    rcx,QWORD PTR [rbx]
   140003501:	test   rcx,rcx
   140003504:	je     0x140003540
   140003506:	mov    rdx,QWORD PTR [rbx+0x10]
   14000350a:	sub    rdx,rcx
   14000350d:	cmp    rdx,0x1000
   140003514:	jb     0x14000352e
   140003516:	mov    r8,QWORD PTR [rcx-0x8]
   14000351a:	add    rdx,0x27
   14000351e:	sub    rcx,r8
   140003521:	lea    rax,[rcx-0x8]
   140003525:	cmp    rax,0x1f
   140003529:	ja     0x140003546
   14000352b:	mov    rcx,r8
   14000352e:	call   0x1400039ac
   140003533:	xor    eax,eax
   140003535:	mov    QWORD PTR [rbx],rax
   140003538:	mov    QWORD PTR [rbx+0x8],rax
   14000353c:	mov    QWORD PTR [rbx+0x10],rax
   140003540:	add    rsp,0x20
   140003544:	pop    rbx
   140003545:	ret
   140003546:	call   QWORD PTR [rip+0x1df4]        # 0x140005340
   14000354c:	int3
   14000354d:	int3
   14000354e:	int3
   14000354f:	int3
   140003550:	mov    rcx,QWORD PTR [rcx]
   140003553:	test   rcx,rcx
   140003556:	je     0x140003563
   140003558:	mov    rax,QWORD PTR [rcx]
   14000355b:	mov    edx,0x1
   140003560:	rex.W jmp QWORD PTR [rax]
   140003563:	ret
   140003564:	int3
   140003565:	int3
   140003566:	int3
   140003567:	int3
   140003568:	int3
   140003569:	int3
   14000356a:	int3
   14000356b:	int3
   14000356c:	int3
   14000356d:	int3
   14000356e:	int3
   14000356f:	int3
   140003570:	sub    rsp,0x28
   140003574:	lea    rcx,[rip+0x200d]        # 0x140005588
   14000357b:	call   QWORD PTR [rip+0x1c07]        # 0x140005188
   140003581:	int3
   140003582:	int3
   140003583:	int3
   140003584:	int3
   140003585:	int3
   140003586:	int3
   140003587:	int3
   140003588:	int3
   140003589:	int3
   14000358a:	int3
   14000358b:	int3
   14000358c:	int3
   14000358d:	int3
   14000358e:	int3
   14000358f:	int3
   140003590:	mov    QWORD PTR [rsp+0x10],rbx
   140003595:	mov    QWORD PTR [rsp+0x8],rcx
   14000359a:	push   rsi
   14000359b:	push   rdi
   14000359c:	push   r12
   14000359e:	push   r14
   1400035a0:	push   r15
   1400035a2:	sub    rsp,0x30
   1400035a6:	mov    r15,r8
   1400035a9:	mov    r12,rdx
   1400035ac:	mov    rsi,rcx
   1400035af:	xor    ebx,ebx
   1400035b1:	mov    DWORD PTR [rsp+0x78],ebx
   1400035b5:	mov    rax,QWORD PTR [rcx]
   1400035b8:	movsxd r9,DWORD PTR [rax+0x4]
   1400035bc:	mov    rdi,QWORD PTR [r9+rcx*1+0x28]
   1400035c1:	test   rdi,rdi
   1400035c4:	jle    0x1400035d0
   1400035c6:	cmp    rdi,r8
   1400035c9:	jbe    0x1400035d0
   1400035cb:	sub    rdi,r8
   1400035ce:	jmp    0x1400035d2
   1400035d0:	xor    edi,edi
   1400035d2:	mov    r14,rsi
   1400035d5:	mov    QWORD PTR [rsp+0x20],rsi
   1400035da:	mov    rcx,QWORD PTR [r9+rcx*1+0x48]
   1400035df:	test   rcx,rcx
   1400035e2:	je     0x1400035eb
   1400035e4:	mov    rax,QWORD PTR [rcx]
   1400035e7:	call   QWORD PTR [rax+0x8]
   1400035ea:	nop
   1400035eb:	mov    rax,QWORD PTR [rsi]
   1400035ee:	movsxd rcx,DWORD PTR [rax+0x4]
   1400035f2:	add    rcx,rsi
   1400035f5:	call   QWORD PTR [rip+0x1b4d]        # 0x140005148
   1400035fb:	test   al,al
   1400035fd:	je     0x14000362f
   1400035ff:	mov    rax,QWORD PTR [rsi]
   140003602:	movsxd rcx,DWORD PTR [rax+0x4]
   140003606:	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   14000360b:	test   rcx,rcx
   14000360e:	je     0x14000362d
   140003610:	cmp    rcx,rsi
   140003613:	je     0x14000362d
   140003615:	call   QWORD PTR [rip+0x1a9d]        # 0x1400050b8
   14000361b:	mov    rax,QWORD PTR [rsi]
   14000361e:	movsxd rcx,DWORD PTR [rax+0x4]
   140003622:	add    rcx,rsi
   140003625:	call   QWORD PTR [rip+0x1b1d]        # 0x140005148
   14000362b:	jmp    0x14000362f
   14000362d:	mov    al,0x1
   14000362f:	mov    BYTE PTR [rsp+0x28],al
   140003633:	test   al,al
   140003635:	jne    0x140003641
   140003637:	mov    ebx,0x4
   14000363c:	jmp    0x1400036f1
   140003641:	mov    rax,QWORD PTR [rsi]
   140003644:	movsxd rax,DWORD PTR [rax+0x4]
   140003648:	mov    eax,DWORD PTR [rax+rsi*1+0x18]
   14000364c:	and    eax,0x1c0
   140003651:	cmp    eax,0x40
   140003654:	je     0x140003687
   140003656:	test   rdi,rdi
   140003659:	je     0x140003687
   14000365b:	mov    rax,QWORD PTR [rsi]
   14000365e:	movsxd rcx,DWORD PTR [rax+0x4]
   140003662:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140003667:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   14000366c:	call   QWORD PTR [rip+0x1a16]        # 0x140005088
   140003672:	cmp    eax,0xffffffff
   140003675:	jne    0x140003682
   140003677:	mov    ebx,0x4
   14000367c:	mov    DWORD PTR [rsp+0x78],ebx
   140003680:	jmp    0x1400036a4
   140003682:	dec    rdi
   140003685:	jmp    0x140003656
   140003687:	mov    rax,QWORD PTR [rsi]
   14000368a:	movsxd rcx,DWORD PTR [rax+0x4]
   14000368e:	mov    r8,r15
   140003691:	mov    rdx,r12
   140003694:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140003699:	call   QWORD PTR [rip+0x1a39]        # 0x1400050d8
   14000369f:	cmp    rax,r15
   1400036a2:	jne    0x1400036ca
   1400036a4:	test   rdi,rdi
   1400036a7:	je     0x1400036d1
   1400036a9:	mov    rax,QWORD PTR [rsi]
   1400036ac:	movsxd rcx,DWORD PTR [rax+0x4]
   1400036b0:	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   1400036b5:	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400036ba:	call   QWORD PTR [rip+0x19c8]        # 0x140005088
   1400036c0:	cmp    eax,0xffffffff
   1400036c3:	je     0x1400036ca
   1400036c5:	dec    rdi
   1400036c8:	jmp    0x1400036a4
   1400036ca:	or     ebx,0x4
   1400036cd:	mov    DWORD PTR [rsp+0x78],ebx
   1400036d1:	mov    rax,QWORD PTR [rsi]
   1400036d4:	movsxd rcx,DWORD PTR [rax+0x4]
   1400036d8:	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   1400036e1:	jmp    0x1400036f1
   1400036e3:	mov    rsi,QWORD PTR [rsp+0x60]
   1400036e8:	mov    ebx,DWORD PTR [rsp+0x78]
   1400036ec:	mov    r14,QWORD PTR [rsp+0x20]
   1400036f1:	mov    rax,QWORD PTR [rsi]
   1400036f4:	movsxd rcx,DWORD PTR [rax+0x4]
   1400036f8:	add    rcx,rsi
   1400036fb:	xor    r8d,r8d
   1400036fe:	mov    edx,ebx
   140003700:	call   QWORD PTR [rip+0x19e2]        # 0x1400050e8
   140003706:	nop
   140003707:	call   QWORD PTR [rip+0x1aa3]        # 0x1400051b0
   14000370d:	test   al,al
   14000370f:	jne    0x14000371b
   140003711:	mov    rcx,r14
   140003714:	call   QWORD PTR [rip+0x1996]        # 0x1400050b0
   14000371a:	nop
   14000371b:	mov    rax,QWORD PTR [r14]
   14000371e:	movsxd rcx,DWORD PTR [rax+0x4]
   140003722:	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   140003727:	test   rcx,rcx
   14000372a:	je     0x140003733
   14000372c:	mov    rax,QWORD PTR [rcx]
   14000372f:	call   QWORD PTR [rax+0x10]
   140003732:	nop
   140003733:	mov    rax,rsi
   140003736:	mov    rbx,QWORD PTR [rsp+0x68]
   14000373b:	add    rsp,0x30
   14000373f:	pop    r15
   140003741:	pop    r14
   140003743:	pop    r12
   140003745:	pop    rdi
   140003746:	pop    rsi
   140003747:	ret
   140003748:	int3
   140003749:	int3
   14000374a:	int3
   14000374b:	int3
   14000374c:	int3
   14000374d:	int3
   14000374e:	int3
   14000374f:	int3
   140003750:	rex push rsi
   140003752:	push   rdi
   140003753:	push   r13
   140003755:	push   r14
   140003757:	push   r15
   140003759:	sub    rsp,0x30
   14000375d:	mov    rdi,rcx
   140003760:	mov    r14,rdx
   140003763:	mov    rcx,QWORD PTR [rcx]
   140003766:	movabs rsi,0x7fffffffffffffff
   140003770:	sub    r14,rcx
   140003773:	mov    r13,r8
   140003776:	mov    r15,rdx
   140003779:	mov    rax,QWORD PTR [rdi+0x8]
   14000377d:	sub    rax,rcx
   140003780:	cmp    rax,rsi
   140003783:	je     0x1400038bf
   140003789:	mov    rdx,QWORD PTR [rdi+0x10]
   14000378d:	sub    rdx,rcx
   140003790:	mov    QWORD PTR [rsp+0x70],rbx
   140003795:	mov    QWORD PTR [rsp+0x28],rbp
   14000379a:	mov    rcx,rdx
   14000379d:	shr    rcx,1
   1400037a0:	mov    QWORD PTR [rsp+0x20],r12
   1400037a5:	lea    r12,[rax+0x1]
   1400037a9:	mov    rax,rsi
   1400037ac:	sub    rax,rcx
   1400037af:	cmp    rdx,rax
   1400037b2:	jbe    0x1400037da
   1400037b4:	movabs rcx,0x8000000000000026
   1400037be:	call   0x140003970
   1400037c3:	test   rax,rax
   1400037c6:	je     0x1400038b8
   1400037cc:	lea    rbx,[rax+0x27]
   1400037d0:	and    rbx,0xffffffffffffffe0
   1400037d4:	mov    QWORD PTR [rbx-0x8],rax
   1400037d8:	jmp    0x140003814
   1400037da:	lea    rax,[rcx+rdx*1]
   1400037de:	mov    rsi,r12
   1400037e1:	cmp    rax,r12
   1400037e4:	cmovae rsi,rax
   1400037e8:	test   rsi,rsi
   1400037eb:	jne    0x1400037f1
   1400037ed:	xor    ebx,ebx
   1400037ef:	jmp    0x140003814
   1400037f1:	cmp    rsi,0x1000
   1400037f8:	jb     0x140003809
   1400037fa:	lea    rcx,[rsi+0x27]
   1400037fe:	cmp    rcx,rsi
   140003801:	jbe    0x1400038c5
   140003807:	jmp    0x1400037be
   140003809:	mov    rcx,rsi
   14000380c:	call   0x140003970
   140003811:	mov    rbx,rax
   140003814:	movzx  ecx,BYTE PTR [r13+0x0]
   140003819:	add    r14,rbx
   14000381c:	mov    BYTE PTR [r14],cl
   14000381f:	mov    rcx,rbx
   140003822:	mov    r8,QWORD PTR [rdi+0x8]
   140003826:	mov    rdx,QWORD PTR [rdi]
   140003829:	cmp    r15,r8
   14000382c:	jne    0x140003833
   14000382e:	sub    r8,rdx
   140003831:	jmp    0x14000384c
   140003833:	mov    r8,r15
   140003836:	sub    r8,rdx
   140003839:	call   0x1400048a9
   14000383e:	mov    r8,QWORD PTR [rdi+0x8]
   140003842:	lea    rcx,[r14+0x1]
   140003846:	sub    r8,r15
   140003849:	mov    rdx,r15
   14000384c:	call   0x1400048a9
   140003851:	mov    rcx,QWORD PTR [rdi]
   140003854:	test   rcx,rcx
   140003857:	je     0x140003886
   140003859:	mov    rdx,QWORD PTR [rdi+0x10]
   14000385d:	sub    rdx,rcx
   140003860:	cmp    rdx,0x1000
   140003867:	jb     0x140003881
   140003869:	mov    r8,QWORD PTR [rcx-0x8]
   14000386d:	add    rdx,0x27
   140003871:	sub    rcx,r8
   140003874:	lea    rax,[rcx-0x8]
   140003878:	cmp    rax,0x1f
   14000387c:	ja     0x1400038b8
   14000387e:	mov    rcx,r8
   140003881:	call   0x1400039ac
   140003886:	mov    rbp,QWORD PTR [rsp+0x28]
   14000388b:	lea    rcx,[rbx+r12*1]
   14000388f:	mov    r12,QWORD PTR [rsp+0x20]
   140003894:	mov    rax,r14
   140003897:	mov    QWORD PTR [rdi],rbx
   14000389a:	mov    QWORD PTR [rdi+0x8],rcx
   14000389e:	lea    rcx,[rbx+rsi*1]
   1400038a2:	mov    rbx,QWORD PTR [rsp+0x70]
   1400038a7:	mov    QWORD PTR [rdi+0x10],rcx
   1400038ab:	add    rsp,0x30
   1400038af:	pop    r15
   1400038b1:	pop    r14
   1400038b3:	pop    r13
   1400038b5:	pop    rdi
   1400038b6:	pop    rsi
   1400038b7:	ret
   1400038b8:	call   QWORD PTR [rip+0x1a82]        # 0x140005340
   1400038be:	int3
   1400038bf:	call   0x140003570
   1400038c4:	int3
   1400038c5:	call   0x140001110
   1400038ca:	int3
   1400038cb:	int3
   1400038cc:	movsxd rax,DWORD PTR [rcx-0x4]
   1400038d0:	sub    rcx,rax
   1400038d3:	jmp    0x140002c80
   1400038d8:	movsxd rax,DWORD PTR [rcx-0x4]
   1400038dc:	sub    rcx,rax
   1400038df:	jmp    0x140002bb0
   1400038e4:	jmp    QWORD PTR [rip+0x18ee]        # 0x1400051d8
   1400038ea:	int3
   1400038eb:	int3
   1400038ec:	rex push rbx
   1400038ee:	sub    rsp,0x20
   1400038f2:	mov    rbx,rcx
   1400038f5:	mov    ecx,0x10
   1400038fa:	call   QWORD PTR [rip+0x1968]        # 0x140005268
   140003900:	mov    rdx,rax
   140003903:	test   rax,rax
   140003906:	je     0x140003923
   140003908:	mov    rax,QWORD PTR [rip+0x4ae1]        # 0x1400083f0
   14000390f:	mov    QWORD PTR [rdx],rax
   140003912:	mov    QWORD PTR [rdx+0x8],rbx
   140003916:	mov    QWORD PTR [rip+0x4ad3],rdx        # 0x1400083f0
   14000391d:	add    rsp,0x20
   140003921:	pop    rbx
   140003922:	ret
   140003923:	call   0x14000392f
   140003928:	int3
   140003929:	jmp    QWORD PTR [rip+0x17c9]        # 0x1400050f8
   14000392f:	jmp    QWORD PTR [rip+0x182b]        # 0x140005160
   140003935:	int3
   140003936:	int3
   140003937:	int3
   140003938:	int3
   140003939:	int3
   14000393a:	int3
   14000393b:	int3
   14000393c:	int3
   14000393d:	int3
   14000393e:	int3
   14000393f:	int3
   140003940:	int3
   140003941:	int3
   140003942:	int3
   140003943:	int3
   140003944:	int3
   140003945:	int3
   140003946:	data16 nop WORD PTR [rax+rax*1+0x0]
   140003950:	cmp    rcx,QWORD PTR [rip+0x46e9]        # 0x140008040
   140003957:	jne    0x140003969
   140003959:	rol    rcx,0x10
   14000395d:	test   cx,0xffff
   140003962:	jne    0x140003965
   140003964:	ret
   140003965:	ror    rcx,0x10
   140003969:	jmp    0x140003ecc
   14000396e:	int3
   14000396f:	int3
   140003970:	rex push rbx
   140003972:	sub    rsp,0x20
   140003976:	mov    rbx,rcx
   140003979:	jmp    0x14000398a
   14000397b:	mov    rcx,rbx
   14000397e:	call   0x140004716
   140003983:	test   eax,eax
   140003985:	je     0x14000399a
   140003987:	mov    rcx,rbx
   14000398a:	call   0x140004710
   14000398f:	test   rax,rax
   140003992:	je     0x14000397b
   140003994:	add    rsp,0x20
   140003998:	pop    rbx
   140003999:	ret
   14000399a:	cmp    rbx,0xffffffffffffffff
   14000399e:	je     0x1400039a6
   1400039a0:	call   0x140004034
   1400039a5:	int3
   1400039a6:	call   0x140001110
   1400039ab:	int3
   1400039ac:	jmp    0x140004054
   1400039b1:	int3
   1400039b2:	int3
   1400039b3:	int3
   1400039b4:	rex push rbx
   1400039b6:	sub    rsp,0x20
   1400039ba:	lea    rax,[rip+0x1aa7]        # 0x140005468
   1400039c1:	mov    rbx,rcx
   1400039c4:	mov    QWORD PTR [rcx],rax
   1400039c7:	test   dl,0x1
   1400039ca:	je     0x1400039d6
   1400039cc:	mov    edx,0x18
   1400039d1:	call   0x1400039ac
   1400039d6:	mov    rax,rbx
   1400039d9:	add    rsp,0x20
   1400039dd:	pop    rbx
   1400039de:	ret
   1400039df:	int3
   1400039e0:	rex push rbx
   1400039e2:	sub    rsp,0x20
   1400039e6:	mov    ecx,0x1
   1400039eb:	call   0x140004722
   1400039f0:	call   0x140004114
   1400039f5:	mov    ecx,eax
   1400039f7:	call   0x140004758
   1400039fc:	call   0x140004108
   140003a01:	mov    ebx,eax
   140003a03:	call   0x140004788
   140003a08:	mov    ecx,0x1
   140003a0d:	mov    DWORD PTR [rax],ebx
   140003a0f:	call   0x140003ccc
   140003a14:	test   al,al
   140003a16:	je     0x140003a8b
   140003a18:	call   0x140004390
   140003a1d:	lea    rcx,[rip+0x9a8]        # 0x1400043cc
   140003a24:	call   0x140003e7c
   140003a29:	call   0x14000410c
   140003a2e:	mov    ecx,eax
   140003a30:	call   0x14000472e
   140003a35:	test   eax,eax
   140003a37:	jne    0x140003a8b
   140003a39:	call   0x14000411c
   140003a3e:	call   0x14000415c
   140003a43:	test   eax,eax
   140003a45:	je     0x140003a53
   140003a47:	lea    rcx,[rip+0x6ba]        # 0x140004108
   140003a4e:	call   0x140004728
   140003a53:	call   0x140003e94
   140003a58:	call   0x140003e94
   140003a5d:	call   0x140004108
   140003a62:	mov    ecx,eax
   140003a64:	call   0x14000477c
   140003a69:	call   0x14000412c
   140003a6e:	test   al,al
   140003a70:	je     0x140003a77
   140003a72:	call   0x140004734
   140003a77:	call   0x140004108
   140003a7c:	call   0x1400042c8
   140003a81:	test   eax,eax
   140003a83:	jne    0x140003a8b
   140003a85:	add    rsp,0x20
   140003a89:	pop    rbx
   140003a8a:	ret
   140003a8b:	mov    ecx,0x7
   140003a90:	call   0x140004180
   140003a95:	int3
   140003a96:	int3
   140003a97:	int3
   140003a98:	sub    rsp,0x28
   140003a9c:	call   0x140004140
   140003aa1:	xor    eax,eax
   140003aa3:	add    rsp,0x28
   140003aa7:	ret
   140003aa8:	sub    rsp,0x28
   140003aac:	call   0x140004324
   140003ab1:	call   0x140004108
   140003ab6:	mov    ecx,eax
   140003ab8:	add    rsp,0x28
   140003abc:	jmp    0x140004782
   140003ac1:	int3
   140003ac2:	int3
   140003ac3:	int3
   140003ac4:	mov    QWORD PTR [rsp+0x8],rbx
   140003ac9:	mov    QWORD PTR [rsp+0x10],rsi
   140003ace:	push   rdi
   140003acf:	sub    rsp,0x30
   140003ad3:	mov    ecx,0x1
   140003ad8:	call   0x140003c90
   140003add:	test   al,al
   140003adf:	je     0x140003c1b
   140003ae5:	xor    sil,sil
   140003ae8:	mov    BYTE PTR [rsp+0x20],sil
   140003aed:	call   0x140003c54
   140003af2:	mov    bl,al
   140003af4:	mov    ecx,DWORD PTR [rip+0x4906]        # 0x140008400
   140003afa:	cmp    ecx,0x1
   140003afd:	je     0x140003c26
   140003b03:	test   ecx,ecx
   140003b05:	jne    0x140003b51
   140003b07:	mov    DWORD PTR [rip+0x48ef],0x1        # 0x140008400
   140003b11:	lea    rdx,[rip+0x1920]        # 0x140005438
   140003b18:	lea    rcx,[rip+0x1901]        # 0x140005420
   140003b1f:	call   0x140004746
   140003b24:	test   eax,eax
   140003b26:	je     0x140003b32
   140003b28:	mov    eax,0xff
   140003b2d:	jmp    0x140003c0b
   140003b32:	lea    rdx,[rip+0x18df]        # 0x140005418
   140003b39:	lea    rcx,[rip+0x18c0]        # 0x140005400
   140003b40:	call   0x140004740
   140003b45:	mov    DWORD PTR [rip+0x48b1],0x2        # 0x140008400
   140003b4f:	jmp    0x140003b59
   140003b51:	mov    sil,0x1
   140003b54:	mov    BYTE PTR [rsp+0x20],sil
   140003b59:	mov    cl,bl
   140003b5b:	call   0x140003df0
   140003b60:	call   0x140004168
   140003b65:	mov    rbx,rax
   140003b68:	cmp    QWORD PTR [rax],0x0
   140003b6c:	je     0x140003b8c
   140003b6e:	mov    rcx,rax
   140003b71:	call   0x140003d58
   140003b76:	test   al,al
   140003b78:	je     0x140003b8c
   140003b7a:	xor    r8d,r8d
   140003b7d:	lea    edx,[r8+0x2]
   140003b81:	xor    ecx,ecx
   140003b83:	mov    rax,QWORD PTR [rbx]
   140003b86:	call   QWORD PTR [rip+0x184c]        # 0x1400053d8
   140003b8c:	call   0x140004170
   140003b91:	mov    rbx,rax
   140003b94:	cmp    QWORD PTR [rax],0x0
   140003b98:	je     0x140003bae
   140003b9a:	mov    rcx,rax
   140003b9d:	call   0x140003d58
   140003ba2:	test   al,al
   140003ba4:	je     0x140003bae
   140003ba6:	mov    rcx,QWORD PTR [rbx]
   140003ba9:	call   0x140004776
   140003bae:	call   0x14000473a
   140003bb3:	mov    rdi,rax
   140003bb6:	call   0x140004764
   140003bbb:	mov    rbx,QWORD PTR [rax]
   140003bbe:	call   0x14000475e
   140003bc3:	mov    r8,rdi
   140003bc6:	mov    rdx,rbx
   140003bc9:	mov    ecx,DWORD PTR [rax]
   140003bcb:	call   0x1400012c0
   140003bd0:	mov    ebx,eax
   140003bd2:	call   0x1400042d0
   140003bd7:	test   al,al
   140003bd9:	je     0x140003c30
   140003bdb:	test   sil,sil
   140003bde:	jne    0x140003be5
   140003be0:	call   0x14000476a
   140003be5:	xor    edx,edx
   140003be7:	mov    cl,0x1
   140003be9:	call   0x140003e14
   140003bee:	mov    eax,ebx
   140003bf0:	jmp    0x140003c0b
   140003bf2:	mov    ebx,eax
   140003bf4:	call   0x1400042d0
   140003bf9:	test   al,al
   140003bfb:	je     0x140003c38
   140003bfd:	cmp    BYTE PTR [rsp+0x20],0x0
   140003c02:	jne    0x140003c09
   140003c04:	call   0x140004770
   140003c09:	mov    eax,ebx
   140003c0b:	mov    rbx,QWORD PTR [rsp+0x40]
   140003c10:	mov    rsi,QWORD PTR [rsp+0x48]
   140003c15:	add    rsp,0x30
   140003c19:	pop    rdi
   140003c1a:	ret
   140003c1b:	mov    ecx,0x7
   140003c20:	call   0x140004180
   140003c25:	nop
   140003c26:	mov    ecx,0x7
   140003c2b:	call   0x140004180
   140003c30:	mov    ecx,ebx
   140003c32:	call   0x14000474c
   140003c37:	nop
   140003c38:	mov    ecx,ebx
   140003c3a:	call   0x140004752
   140003c3f:	nop
   140003c40:	sub    rsp,0x28
   140003c44:	call   0x14000405c
   140003c49:	add    rsp,0x28
   140003c4d:	jmp    0x140003ac4
   140003c52:	int3
   140003c53:	int3
   140003c54:	sub    rsp,0x28
   140003c58:	call   0x1400046d4
   140003c5d:	test   eax,eax
   140003c5f:	je     0x140003c82
   140003c61:	mov    rax,QWORD PTR gs:0x30
   140003c6a:	mov    rcx,QWORD PTR [rax+0x8]
   140003c6e:	jmp    0x140003c75
   140003c70:	cmp    rcx,rax
   140003c73:	je     0x140003c89
   140003c75:	xor    eax,eax
   140003c77:	lock cmpxchg QWORD PTR [rip+0x4788],rcx        # 0x140008408
   140003c80:	jne    0x140003c70
   140003c82:	xor    al,al
   140003c84:	add    rsp,0x28
   140003c88:	ret
   140003c89:	mov    al,0x1
   140003c8b:	jmp    0x140003c84
   140003c8d:	int3
   140003c8e:	int3
   140003c8f:	int3
   140003c90:	sub    rsp,0x28
   140003c94:	test   ecx,ecx
   140003c96:	jne    0x140003c9f
   140003c98:	mov    BYTE PTR [rip+0x4771],0x1        # 0x140008410
   140003c9f:	call   0x140004408
   140003ca4:	call   0x14000412c
   140003ca9:	test   al,al
   140003cab:	jne    0x140003cb1
   140003cad:	xor    al,al
   140003caf:	jmp    0x140003cc5
   140003cb1:	call   0x14000412c
   140003cb6:	test   al,al
   140003cb8:	jne    0x140003cc3
   140003cba:	xor    ecx,ecx
   140003cbc:	call   0x14000412c
   140003cc1:	jmp    0x140003cad
   140003cc3:	mov    al,0x1
   140003cc5:	add    rsp,0x28
   140003cc9:	ret
   140003cca:	int3
   140003ccb:	int3
   140003ccc:	rex push rbx
   140003cce:	sub    rsp,0x20
   140003cd2:	cmp    BYTE PTR [rip+0x4738],0x0        # 0x140008411
   140003cd9:	mov    ebx,ecx
   140003cdb:	jne    0x140003d44
   140003cdd:	cmp    ecx,0x1
   140003ce0:	ja     0x140003d4c
   140003ce2:	call   0x1400046d4
   140003ce7:	test   eax,eax
   140003ce9:	je     0x140003d13
   140003ceb:	test   ebx,ebx
   140003ced:	jne    0x140003d13
   140003cef:	lea    rcx,[rip+0x4722]        # 0x140008418
   140003cf6:	call   0x14000478e
   140003cfb:	test   eax,eax
   140003cfd:	jne    0x140003d0f
   140003cff:	lea    rcx,[rip+0x472a]        # 0x140008430
   140003d06:	call   0x14000478e
   140003d0b:	test   eax,eax
   140003d0d:	je     0x140003d3d
   140003d0f:	xor    al,al
   140003d11:	jmp    0x140003d46
   140003d13:	movdqa xmm0,XMMWORD PTR [rip+0x1755]        # 0x140005470
   140003d1b:	or     rax,0xffffffffffffffff
   140003d1f:	movdqu XMMWORD PTR [rip+0x46f1],xmm0        # 0x140008418
   140003d27:	mov    QWORD PTR [rip+0x46fa],rax        # 0x140008428
   140003d2e:	movdqu XMMWORD PTR [rip+0x46fa],xmm0        # 0x140008430
   140003d36:	mov    QWORD PTR [rip+0x4703],rax        # 0x140008440
   140003d3d:	mov    BYTE PTR [rip+0x46cd],0x1        # 0x140008411
   140003d44:	mov    al,0x1
   140003d46:	add    rsp,0x20
   140003d4a:	pop    rbx
   140003d4b:	ret
   140003d4c:	mov    ecx,0x5
   140003d51:	call   0x140004180
   140003d56:	int3
   140003d57:	int3
   140003d58:	sub    rsp,0x18
   140003d5c:	mov    r8,rcx
   140003d5f:	mov    eax,0x5a4d
   140003d64:	cmp    WORD PTR [rip+0xffffffffffffc295],ax        # 0x140000000
   140003d6b:	jne    0x140003de5
   140003d6d:	movsxd rcx,DWORD PTR [rip+0xffffffffffffc2c8]        # 0x14000003c
   140003d74:	lea    rdx,[rip+0xffffffffffffc285]        # 0x140000000
   140003d7b:	add    rcx,rdx
   140003d7e:	cmp    DWORD PTR [rcx],0x4550
   140003d84:	jne    0x140003de5
   140003d86:	mov    eax,0x20b
   140003d8b:	cmp    WORD PTR [rcx+0x18],ax
   140003d8f:	jne    0x140003de5
   140003d91:	sub    r8,rdx
   140003d94:	movzx  edx,WORD PTR [rcx+0x14]
   140003d98:	add    rdx,0x18
   140003d9c:	add    rdx,rcx
   140003d9f:	movzx  eax,WORD PTR [rcx+0x6]
   140003da3:	lea    rcx,[rax+rax*4]
   140003da7:	lea    r9,[rdx+rcx*8]
   140003dab:	mov    QWORD PTR [rsp],rdx
   140003daf:	cmp    rdx,r9
   140003db2:	je     0x140003dcc
   140003db4:	mov    ecx,DWORD PTR [rdx+0xc]
   140003db7:	cmp    r8,rcx
   140003dba:	jb     0x140003dc6
   140003dbc:	mov    eax,DWORD PTR [rdx+0x8]
   140003dbf:	add    eax,ecx
   140003dc1:	cmp    r8,rax
   140003dc4:	jb     0x140003dce
   140003dc6:	add    rdx,0x28
   140003dca:	jmp    0x140003dab
   140003dcc:	xor    edx,edx
   140003dce:	test   rdx,rdx
   140003dd1:	jne    0x140003dd7
   140003dd3:	xor    al,al
   140003dd5:	jmp    0x140003deb
   140003dd7:	cmp    DWORD PTR [rdx+0x24],0x0
   140003ddb:	jge    0x140003de1
   140003ddd:	xor    al,al
   140003ddf:	jmp    0x140003deb
   140003de1:	mov    al,0x1
   140003de3:	jmp    0x140003deb
   140003de5:	xor    al,al
   140003de7:	jmp    0x140003deb
   140003de9:	xor    al,al
   140003deb:	add    rsp,0x18
   140003def:	ret
   140003df0:	rex push rbx
   140003df2:	sub    rsp,0x20
   140003df6:	mov    bl,cl
   140003df8:	call   0x1400046d4
   140003dfd:	xor    edx,edx
   140003dff:	test   eax,eax
   140003e01:	je     0x140003e0e
   140003e03:	test   bl,bl
   140003e05:	jne    0x140003e0e
   140003e07:	xchg   QWORD PTR [rip+0x45fa],rdx        # 0x140008408
   140003e0e:	add    rsp,0x20
   140003e12:	pop    rbx
   140003e13:	ret
   140003e14:	rex push rbx
   140003e16:	sub    rsp,0x20
   140003e1a:	cmp    BYTE PTR [rip+0x45ef],0x0        # 0x140008410
   140003e21:	mov    bl,cl
   140003e23:	je     0x140003e29
   140003e25:	test   dl,dl
   140003e27:	jne    0x140003e35
   140003e29:	call   0x14000412c
   140003e2e:	mov    cl,bl
   140003e30:	call   0x14000412c
   140003e35:	mov    al,0x1
   140003e37:	add    rsp,0x20
   140003e3b:	pop    rbx
   140003e3c:	ret
   140003e3d:	int3
   140003e3e:	int3
   140003e3f:	int3
   140003e40:	rex push rbx
   140003e42:	sub    rsp,0x20
   140003e46:	cmp    QWORD PTR [rip+0x45ca],0xffffffffffffffff        # 0x140008418
   140003e4e:	mov    rbx,rcx
   140003e51:	jne    0x140003e5a
   140003e53:	call   0x14000479a
   140003e58:	jmp    0x140003e69
   140003e5a:	mov    rdx,rbx
   140003e5d:	lea    rcx,[rip+0x45b4]        # 0x140008418
   140003e64:	call   0x140004794
   140003e69:	xor    edx,edx
   140003e6b:	test   eax,eax
   140003e6d:	cmove  rdx,rbx
   140003e71:	mov    rax,rdx
   140003e74:	add    rsp,0x20
   140003e78:	pop    rbx
   140003e79:	ret
   140003e7a:	int3
   140003e7b:	int3
   140003e7c:	sub    rsp,0x28
   140003e80:	call   0x140003e40
   140003e85:	neg    rax
   140003e88:	sbb    eax,eax
   140003e8a:	neg    eax
   140003e8c:	dec    eax
   140003e8e:	add    rsp,0x28
   140003e92:	ret
   140003e93:	int3
   140003e94:	ret    0x0
   140003e97:	int3
   140003e98:	rex push rbx
   140003e9a:	sub    rsp,0x20
   140003e9e:	mov    rbx,rcx
   140003ea1:	xor    ecx,ecx
   140003ea3:	call   QWORD PTR [rip+0x11a7]        # 0x140005050
   140003ea9:	mov    rcx,rbx
   140003eac:	call   QWORD PTR [rip+0x11a6]        # 0x140005058
   140003eb2:	call   QWORD PTR [rip+0x1190]        # 0x140005048
   140003eb8:	mov    rcx,rax
   140003ebb:	mov    edx,0xc0000409
   140003ec0:	add    rsp,0x20
   140003ec4:	pop    rbx
   140003ec5:	rex.W jmp QWORD PTR [rip+0x1174]        # 0x140005040
   140003ecc:	mov    QWORD PTR [rsp+0x8],rcx
   140003ed1:	sub    rsp,0x38
   140003ed5:	mov    ecx,0x17
   140003eda:	call   QWORD PTR [rip+0x1158]        # 0x140005038
   140003ee0:	test   eax,eax
   140003ee2:	je     0x140003eeb
   140003ee4:	mov    ecx,0x2
   140003ee9:	int    0x29
   140003eeb:	lea    rcx,[rip+0x45fe]        # 0x1400084f0
   140003ef2:	call   0x140003fa0
   140003ef7:	mov    rax,QWORD PTR [rsp+0x38]
   140003efc:	mov    QWORD PTR [rip+0x46e5],rax        # 0x1400085e8
   140003f03:	lea    rax,[rsp+0x38]
   140003f08:	add    rax,0x8
   140003f0c:	mov    QWORD PTR [rip+0x4675],rax        # 0x140008588
   140003f13:	mov    rax,QWORD PTR [rip+0x46ce]        # 0x1400085e8
   140003f1a:	mov    QWORD PTR [rip+0x453f],rax        # 0x140008460
   140003f21:	mov    rax,QWORD PTR [rsp+0x40]
   140003f26:	mov    QWORD PTR [rip+0x4643],rax        # 0x140008570
   140003f2d:	mov    DWORD PTR [rip+0x4519],0xc0000409        # 0x140008450
   140003f37:	mov    DWORD PTR [rip+0x4513],0x1        # 0x140008454
   140003f41:	mov    DWORD PTR [rip+0x451d],0x1        # 0x140008468
   140003f4b:	mov    eax,0x8
   140003f50:	imul   rax,rax,0x0
   140003f54:	lea    rcx,[rip+0x4515]        # 0x140008470
   140003f5b:	mov    QWORD PTR [rcx+rax*1],0x2
   140003f63:	mov    eax,0x8
   140003f68:	imul   rax,rax,0x0
   140003f6c:	mov    rcx,QWORD PTR [rip+0x40cd]        # 0x140008040
   140003f73:	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140003f78:	mov    eax,0x8
   140003f7d:	imul   rax,rax,0x1
   140003f81:	mov    rcx,QWORD PTR [rip+0x40f8]        # 0x140008080
   140003f88:	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140003f8d:	lea    rcx,[rip+0x14ec]        # 0x140005480
   140003f94:	call   0x140003e98
   140003f99:	nop
   140003f9a:	add    rsp,0x38
   140003f9e:	ret
   140003f9f:	int3
   140003fa0:	rex push rbx
   140003fa2:	push   rsi
   140003fa3:	push   rdi
   140003fa4:	sub    rsp,0x40
   140003fa8:	mov    rbx,rcx
   140003fab:	call   QWORD PTR [rip+0x104f]        # 0x140005000
   140003fb1:	mov    rsi,QWORD PTR [rbx+0xf8]
   140003fb8:	xor    edi,edi
   140003fba:	xor    r8d,r8d
   140003fbd:	lea    rdx,[rsp+0x60]
   140003fc2:	mov    rcx,rsi
   140003fc5:	call   QWORD PTR [rip+0x109d]        # 0x140005068
   140003fcb:	test   rax,rax
   140003fce:	je     0x140004009
   140003fd0:	and    QWORD PTR [rsp+0x38],0x0
   140003fd6:	lea    rcx,[rsp+0x68]
   140003fdb:	mov    rdx,QWORD PTR [rsp+0x60]
   140003fe0:	mov    r9,rax
   140003fe3:	mov    QWORD PTR [rsp+0x30],rcx
   140003fe8:	mov    r8,rsi
   140003feb:	lea    rcx,[rsp+0x70]
   140003ff0:	mov    QWORD PTR [rsp+0x28],rcx
   140003ff5:	xor    ecx,ecx
   140003ff7:	mov    QWORD PTR [rsp+0x20],rbx
   140003ffc:	call   QWORD PTR [rip+0x105e]        # 0x140005060
   140004002:	inc    edi
   140004004:	cmp    edi,0x2
   140004007:	jl     0x140003fba
   140004009:	add    rsp,0x40
   14000400d:	pop    rdi
   14000400e:	pop    rsi
   14000400f:	pop    rbx
   140004010:	ret
   140004011:	int3
   140004012:	int3
   140004013:	int3
   140004014:	and    QWORD PTR [rcx+0x10],0x0
   140004019:	lea    rax,[rip+0x14a0]        # 0x1400054c0
   140004020:	mov    QWORD PTR [rcx+0x8],rax
   140004024:	lea    rax,[rip+0x1485]        # 0x1400054b0
   14000402b:	mov    QWORD PTR [rcx],rax
   14000402e:	mov    rax,rcx
   140004031:	ret
   140004032:	int3
   140004033:	int3
   140004034:	sub    rsp,0x48
   140004038:	lea    rcx,[rsp+0x20]
   14000403d:	call   0x140004014
   140004042:	lea    rdx,[rip+0x2917]        # 0x140006960
   140004049:	lea    rcx,[rsp+0x20]
   14000404e:	call   0x1400046f2
   140004053:	int3
   140004054:	jmp    0x14000470a
   140004059:	int3
   14000405a:	int3
   14000405b:	int3
   14000405c:	mov    QWORD PTR [rsp+0x18],rbx
   140004061:	push   rbp
   140004062:	mov    rbp,rsp
   140004065:	sub    rsp,0x30
   140004069:	mov    rax,QWORD PTR [rip+0x3fd0]        # 0x140008040
   140004070:	movabs rbx,0x2b992ddfa232
   14000407a:	cmp    rax,rbx
   14000407d:	jne    0x1400040f3
   14000407f:	and    QWORD PTR [rbp+0x10],0x0
   140004084:	lea    rcx,[rbp+0x10]
   140004088:	call   QWORD PTR [rip+0xf8a]        # 0x140005018
   14000408e:	mov    rax,QWORD PTR [rbp+0x10]
   140004092:	mov    QWORD PTR [rbp-0x10],rax
   140004096:	call   QWORD PTR [rip+0xf84]        # 0x140005020
   14000409c:	mov    eax,eax
   14000409e:	xor    QWORD PTR [rbp-0x10],rax
   1400040a2:	call   QWORD PTR [rip+0xf80]        # 0x140005028
   1400040a8:	mov    eax,eax
   1400040aa:	lea    rcx,[rbp+0x18]
   1400040ae:	xor    QWORD PTR [rbp-0x10],rax
   1400040b2:	call   QWORD PTR [rip+0xf78]        # 0x140005030
   1400040b8:	mov    eax,DWORD PTR [rbp+0x18]
   1400040bb:	lea    rcx,[rbp-0x10]
   1400040bf:	shl    rax,0x20
   1400040c3:	xor    rax,QWORD PTR [rbp+0x18]
   1400040c7:	xor    rax,QWORD PTR [rbp-0x10]
   1400040cb:	xor    rax,rcx
   1400040ce:	movabs rcx,0xffffffffffff
   1400040d8:	and    rax,rcx
   1400040db:	movabs rcx,0x2b992ddfa233
   1400040e5:	cmp    rax,rbx
   1400040e8:	cmove  rax,rcx
   1400040ec:	mov    QWORD PTR [rip+0x3f4d],rax        # 0x140008040
   1400040f3:	mov    rbx,QWORD PTR [rsp+0x50]
   1400040f8:	not    rax
   1400040fb:	mov    QWORD PTR [rip+0x3f7e],rax        # 0x140008080
   140004102:	add    rsp,0x30
   140004106:	pop    rbp
   140004107:	ret
   140004108:	xor    eax,eax
   14000410a:	ret
   14000410b:	int3
   14000410c:	mov    eax,0x1
   140004111:	ret
   140004112:	int3
   140004113:	int3
   140004114:	mov    eax,0x4000
   140004119:	ret
   14000411a:	int3
   14000411b:	int3
   14000411c:	lea    rcx,[rip+0x489d]        # 0x1400089c0
   140004123:	rex.W jmp QWORD PTR [rip+0xf46]        # 0x140005070
   14000412a:	int3
   14000412b:	int3
   14000412c:	mov    al,0x1
   14000412e:	ret
   14000412f:	int3
   140004130:	lea    rax,[rip+0x4899]        # 0x1400089d0
   140004137:	ret
   140004138:	lea    rax,[rip+0x4899]        # 0x1400089d8
   14000413f:	ret
   140004140:	sub    rsp,0x28
   140004144:	call   0x140004130
   140004149:	or     QWORD PTR [rax],0x24
   14000414d:	call   0x140004138
   140004152:	or     QWORD PTR [rax],0x2
   140004156:	add    rsp,0x28
   14000415a:	ret
   14000415b:	int3
   14000415c:	xor    eax,eax
   14000415e:	cmp    DWORD PTR [rip+0x3f24],eax        # 0x140008088
   140004164:	sete   al
   140004167:	ret
   140004168:	lea    rax,[rip+0x4899]        # 0x140008a08
   14000416f:	ret
   140004170:	lea    rax,[rip+0x4889]        # 0x140008a00
   140004177:	ret
   140004178:	and    DWORD PTR [rip+0x4861],0x0        # 0x1400089e0
   14000417f:	ret
   140004180:	mov    QWORD PTR [rsp+0x8],rbx
   140004185:	push   rbp
   140004186:	lea    rbp,[rsp-0x4c0]
   14000418e:	sub    rsp,0x5c0
   140004195:	mov    ebx,ecx
   140004197:	mov    ecx,0x17
   14000419c:	call   QWORD PTR [rip+0xe96]        # 0x140005038
   1400041a2:	test   eax,eax
   1400041a4:	je     0x1400041aa
   1400041a6:	mov    ecx,ebx
   1400041a8:	int    0x29
   1400041aa:	mov    ecx,0x3
   1400041af:	call   0x140004178
   1400041b4:	xor    edx,edx
   1400041b6:	lea    rcx,[rbp-0x10]
   1400041ba:	mov    r8d,0x4d0
   1400041c0:	call   0x140004704
   1400041c5:	lea    rcx,[rbp-0x10]
   1400041c9:	call   QWORD PTR [rip+0xe31]        # 0x140005000
   1400041cf:	mov    rbx,QWORD PTR [rbp+0xe8]
   1400041d6:	lea    rdx,[rbp+0x4d8]
   1400041dd:	mov    rcx,rbx
   1400041e0:	xor    r8d,r8d
   1400041e3:	call   QWORD PTR [rip+0xe7f]        # 0x140005068
   1400041e9:	test   rax,rax
   1400041ec:	je     0x14000422a
   1400041ee:	and    QWORD PTR [rsp+0x38],0x0
   1400041f4:	lea    rcx,[rbp+0x4e0]
   1400041fb:	mov    rdx,QWORD PTR [rbp+0x4d8]
   140004202:	mov    r9,rax
   140004205:	mov    QWORD PTR [rsp+0x30],rcx
   14000420a:	mov    r8,rbx
   14000420d:	lea    rcx,[rbp+0x4e8]
   140004214:	mov    QWORD PTR [rsp+0x28],rcx
   140004219:	lea    rcx,[rbp-0x10]
   14000421d:	mov    QWORD PTR [rsp+0x20],rcx
   140004222:	xor    ecx,ecx
   140004224:	call   QWORD PTR [rip+0xe36]        # 0x140005060
   14000422a:	mov    rax,QWORD PTR [rbp+0x4c8]
   140004231:	lea    rcx,[rsp+0x50]
   140004236:	mov    QWORD PTR [rbp+0xe8],rax
   14000423d:	xor    edx,edx
   14000423f:	lea    rax,[rbp+0x4c8]
   140004246:	mov    r8d,0x98
   14000424c:	add    rax,0x8
   140004250:	mov    QWORD PTR [rbp+0x88],rax
   140004257:	call   0x140004704
   14000425c:	mov    rax,QWORD PTR [rbp+0x4c8]
   140004263:	mov    QWORD PTR [rsp+0x60],rax
   140004268:	mov    DWORD PTR [rsp+0x50],0x40000015
   140004270:	mov    DWORD PTR [rsp+0x54],0x1
   140004278:	call   QWORD PTR [rip+0xd8a]        # 0x140005008
   14000427e:	mov    ebx,eax
   140004280:	xor    ecx,ecx
   140004282:	lea    rax,[rsp+0x50]
   140004287:	mov    QWORD PTR [rsp+0x40],rax
   14000428c:	lea    rax,[rbp-0x10]
   140004290:	mov    QWORD PTR [rsp+0x48],rax
   140004295:	call   QWORD PTR [rip+0xdb5]        # 0x140005050
   14000429b:	lea    rcx,[rsp+0x40]
   1400042a0:	call   QWORD PTR [rip+0xdb2]        # 0x140005058
   1400042a6:	test   eax,eax
   1400042a8:	jne    0x1400042b7
   1400042aa:	cmp    ebx,0x1
   1400042ad:	je     0x1400042b7
   1400042af:	lea    ecx,[rax+0x3]
   1400042b2:	call   0x140004178
   1400042b7:	mov    rbx,QWORD PTR [rsp+0x5d0]
   1400042bf:	add    rsp,0x5c0
   1400042c6:	pop    rbp
   1400042c7:	ret
   1400042c8:	jmp    0x140004108
   1400042cd:	int3
   1400042ce:	int3
   1400042cf:	int3
   1400042d0:	sub    rsp,0x28
   1400042d4:	xor    ecx,ecx
   1400042d6:	call   QWORD PTR [rip+0xd34]        # 0x140005010
   1400042dc:	test   rax,rax
   1400042df:	je     0x14000431a
   1400042e1:	mov    ecx,0x5a4d
   1400042e6:	cmp    WORD PTR [rax],cx
   1400042e9:	jne    0x14000431a
   1400042eb:	movsxd rcx,DWORD PTR [rax+0x3c]
   1400042ef:	add    rcx,rax
   1400042f2:	cmp    DWORD PTR [rcx],0x4550
   1400042f8:	jne    0x14000431a
   1400042fa:	mov    eax,0x20b
   1400042ff:	cmp    WORD PTR [rcx+0x18],ax
   140004303:	jne    0x14000431a
   140004305:	cmp    DWORD PTR [rcx+0x84],0xe
   14000430c:	jbe    0x14000431a
   14000430e:	cmp    DWORD PTR [rcx+0xf8],0x0
   140004315:	setne  al
   140004318:	jmp    0x14000431c
   14000431a:	xor    al,al
   14000431c:	add    rsp,0x28
   140004320:	ret
   140004321:	int3
   140004322:	int3
   140004323:	int3
   140004324:	lea    rcx,[rip+0x9]        # 0x140004334
   14000432b:	rex.W jmp QWORD PTR [rip+0xd1e]        # 0x140005050
   140004332:	int3
   140004333:	int3
   140004334:	mov    QWORD PTR [rsp+0x8],rbx
   140004339:	push   rdi
   14000433a:	sub    rsp,0x20
   14000433e:	mov    rbx,QWORD PTR [rcx]
   140004341:	mov    rdi,rcx
   140004344:	cmp    DWORD PTR [rbx],0xe06d7363
   14000434a:	jne    0x140004368
   14000434c:	cmp    DWORD PTR [rbx+0x18],0x4
   140004350:	jne    0x140004368
   140004352:	mov    edx,DWORD PTR [rbx+0x20]
   140004355:	lea    eax,[rdx-0x19930520]
   14000435b:	cmp    eax,0x2
   14000435e:	jbe    0x140004375
   140004360:	cmp    edx,0x1994000
   140004366:	je     0x140004375
   140004368:	mov    rbx,QWORD PTR [rsp+0x30]
   14000436d:	xor    eax,eax
   14000436f:	add    rsp,0x20
   140004373:	pop    rdi
   140004374:	ret
   140004375:	call   0x1400046f8
   14000437a:	mov    QWORD PTR [rax],rbx
   14000437d:	mov    rbx,QWORD PTR [rdi+0x8]
   140004381:	call   0x1400046fe
   140004386:	mov    QWORD PTR [rax],rbx
   140004389:	call   0x1400047a0
   14000438e:	int3
   14000438f:	int3
   140004390:	mov    QWORD PTR [rsp+0x8],rbx
   140004395:	push   rdi
   140004396:	sub    rsp,0x20
   14000439a:	lea    rbx,[rip+0x1fd7]        # 0x140006378
   1400043a1:	lea    rdi,[rip+0x1fd0]        # 0x140006378
   1400043a8:	jmp    0x1400043bc
   1400043aa:	mov    rax,QWORD PTR [rbx]
   1400043ad:	test   rax,rax
   1400043b0:	je     0x1400043b8
   1400043b2:	call   QWORD PTR [rip+0x1020]        # 0x1400053d8
   1400043b8:	add    rbx,0x8
   1400043bc:	cmp    rbx,rdi
   1400043bf:	jb     0x1400043aa
   1400043c1:	mov    rbx,QWORD PTR [rsp+0x30]
   1400043c6:	add    rsp,0x20
   1400043ca:	pop    rdi
   1400043cb:	ret
   1400043cc:	mov    QWORD PTR [rsp+0x8],rbx
   1400043d1:	push   rdi
   1400043d2:	sub    rsp,0x20
   1400043d6:	lea    rbx,[rip+0x1fab]        # 0x140006388
   1400043dd:	lea    rdi,[rip+0x1fa4]        # 0x140006388
   1400043e4:	jmp    0x1400043f8
   1400043e6:	mov    rax,QWORD PTR [rbx]
   1400043e9:	test   rax,rax
   1400043ec:	je     0x1400043f4
   1400043ee:	call   QWORD PTR [rip+0xfe4]        # 0x1400053d8
   1400043f4:	add    rbx,0x8
   1400043f8:	cmp    rbx,rdi
   1400043fb:	jb     0x1400043e6
   1400043fd:	mov    rbx,QWORD PTR [rsp+0x30]
   140004402:	add    rsp,0x20
   140004406:	pop    rdi
   140004407:	ret
   140004408:	mov    QWORD PTR [rsp+0x10],rbx
   14000440d:	mov    QWORD PTR [rsp+0x18],rsi
   140004412:	push   rbp
   140004413:	push   rdi
   140004414:	push   r14
   140004416:	mov    rbp,rsp
   140004419:	sub    rsp,0x10
   14000441d:	xor    eax,eax
   14000441f:	xor    ecx,ecx
   140004421:	cpuid
   140004423:	mov    r8d,ecx
   140004426:	mov    r10d,edx
   140004429:	xor    r10d,0x49656e69
   140004430:	xor    r8d,0x6c65746e
   140004437:	mov    r9d,ebx
   14000443a:	mov    r14d,eax
   14000443d:	xor    ecx,ecx
   14000443f:	mov    eax,0x1
   140004444:	cpuid
   140004446:	or     r10d,r8d
   140004449:	mov    DWORD PTR [rbp-0x10],eax
   14000444c:	xor    r9d,0x756e6547
   140004453:	mov    DWORD PTR [rbp-0xc],ebx
   140004456:	or     r10d,r9d
   140004459:	mov    DWORD PTR [rbp-0x8],ecx
   14000445c:	mov    edi,ecx
   14000445e:	mov    DWORD PTR [rbp-0x4],edx
   140004461:	jne    0x1400044be
   140004463:	or     QWORD PTR [rip+0x3c3d],0xffffffffffffffff        # 0x1400080a8
   14000446b:	and    eax,0xfff3ff0
   140004470:	mov    QWORD PTR [rip+0x3c25],0x8000        # 0x1400080a0
   14000447b:	cmp    eax,0x106c0
   140004480:	je     0x1400044aa
   140004482:	cmp    eax,0x20660
   140004487:	je     0x1400044aa
   140004489:	cmp    eax,0x20670
   14000448e:	je     0x1400044aa
   140004490:	add    eax,0xfffcf9b0
   140004495:	cmp    eax,0x20
   140004498:	ja     0x1400044be
   14000449a:	movabs rcx,0x100010001
   1400044a4:	bt     rcx,rax
   1400044a8:	jae    0x1400044be
   1400044aa:	mov    r8d,DWORD PTR [rip+0x4537]        # 0x1400089e8
   1400044b1:	or     r8d,0x1
   1400044b5:	mov    DWORD PTR [rip+0x452c],r8d        # 0x1400089e8
   1400044bc:	jmp    0x1400044c5
   1400044be:	mov    r8d,DWORD PTR [rip+0x4523]        # 0x1400089e8
   1400044c5:	xor    r9d,r9d
   1400044c8:	mov    esi,r9d
   1400044cb:	mov    r10d,r9d
   1400044ce:	mov    r11d,r9d
   1400044d1:	cmp    r14d,0x7
   1400044d5:	jl     0x14000453c
   1400044d7:	lea    eax,[r9+0x7]
   1400044db:	xor    ecx,ecx
   1400044dd:	cpuid
   1400044df:	mov    DWORD PTR [rbp-0x10],eax
   1400044e2:	mov    esi,edx
   1400044e4:	mov    DWORD PTR [rbp-0xc],ebx
   1400044e7:	mov    r9d,ebx
   1400044ea:	mov    DWORD PTR [rbp-0x8],ecx
   1400044ed:	mov    DWORD PTR [rbp-0x4],edx
   1400044f0:	bt     ebx,0x9
   1400044f4:	jae    0x140004501
   1400044f6:	or     r8d,0x2
   1400044fa:	mov    DWORD PTR [rip+0x44e7],r8d        # 0x1400089e8
   140004501:	cmp    eax,0x1
   140004504:	jl     0x14000451f
   140004506:	mov    eax,0x7
   14000450b:	lea    ecx,[rax-0x6]
   14000450e:	cpuid
   140004510:	mov    r10d,edx
   140004513:	mov    DWORD PTR [rbp-0x10],eax
   140004516:	mov    DWORD PTR [rbp-0xc],ebx
   140004519:	mov    DWORD PTR [rbp-0x8],ecx
   14000451c:	mov    DWORD PTR [rbp-0x4],edx
   14000451f:	mov    eax,0x24
   140004524:	cmp    r14d,eax
   140004527:	jl     0x14000453c
   140004529:	xor    ecx,ecx
   14000452b:	cpuid
   14000452d:	mov    r11d,ebx
   140004530:	mov    DWORD PTR [rbp-0x10],eax
   140004533:	mov    DWORD PTR [rbp-0xc],ebx
   140004536:	mov    DWORD PTR [rbp-0x8],ecx
   140004539:	mov    DWORD PTR [rbp-0x4],edx
   14000453c:	mov    rax,QWORD PTR [rip+0x3b4d]        # 0x140008090
   140004543:	mov    ebx,0x6
   140004548:	and    rax,0xfffffffffffffffe
   14000454c:	mov    DWORD PTR [rip+0x3b42],0x1        # 0x140008098
   140004556:	mov    DWORD PTR [rip+0x3b3c],0x2        # 0x14000809c
   140004560:	mov    QWORD PTR [rip+0x3b29],rax        # 0x140008090
   140004567:	bt     edi,0x14
   14000456b:	jae    0x140004588
   14000456d:	and    rax,0xffffffffffffffef
   140004571:	mov    DWORD PTR [rip+0x3b1d],0x2        # 0x140008098
   14000457b:	mov    QWORD PTR [rip+0x3b0e],rax        # 0x140008090
   140004582:	mov    DWORD PTR [rip+0x3b14],ebx        # 0x14000809c
   140004588:	bt     edi,0x1b
   14000458c:	jae    0x1400046bd
   140004592:	xor    ecx,ecx
   140004594:	xgetbv
   140004597:	shl    rdx,0x20
   14000459b:	or     rdx,rax
   14000459e:	mov    QWORD PTR [rbp+0x20],rdx
   1400045a2:	bt     edi,0x1c
   1400045a6:	jae    0x1400046a2
   1400045ac:	mov    rax,QWORD PTR [rbp+0x20]
   1400045b0:	and    al,bl
   1400045b2:	cmp    al,bl
   1400045b4:	jne    0x1400046a2
   1400045ba:	mov    eax,DWORD PTR [rip+0x3adc]        # 0x14000809c
   1400045c0:	mov    dl,0xe0
   1400045c2:	or     eax,0x8
   1400045c5:	mov    DWORD PTR [rip+0x3ac9],0x3        # 0x140008098
   1400045cf:	mov    DWORD PTR [rip+0x3ac7],eax        # 0x14000809c
   1400045d5:	test   r9b,0x20
   1400045d9:	je     0x140004638
   1400045db:	or     eax,0x20
   1400045de:	mov    DWORD PTR [rip+0x3ab0],0x5        # 0x140008098
   1400045e8:	mov    DWORD PTR [rip+0x3aae],eax        # 0x14000809c
   1400045ee:	mov    ecx,0xd0030000
   1400045f3:	mov    rax,QWORD PTR [rip+0x3a96]        # 0x140008090
   1400045fa:	and    r9d,ecx
   1400045fd:	and    rax,0xfffffffffffffffd
   140004601:	mov    QWORD PTR [rip+0x3a88],rax        # 0x140008090
   140004608:	cmp    r9d,ecx
   14000460b:	jne    0x14000463f
   14000460d:	mov    rax,QWORD PTR [rbp+0x20]
   140004611:	and    al,dl
   140004613:	cmp    al,dl
   140004615:	jne    0x140004638
   140004617:	mov    rax,QWORD PTR [rip+0x3a72]        # 0x140008090
   14000461e:	or     DWORD PTR [rip+0x3a77],0x40        # 0x14000809c
   140004625:	and    rax,0xffffffffffffffdb
   140004629:	mov    DWORD PTR [rip+0x3a69],ebx        # 0x140008098
   14000462f:	mov    QWORD PTR [rip+0x3a5a],rax        # 0x140008090
   140004636:	jmp    0x14000463f
   140004638:	mov    rax,QWORD PTR [rip+0x3a51]        # 0x140008090
   14000463f:	bt     esi,0x17
   140004643:	jae    0x140004651
   140004645:	btr    rax,0x18
   14000464a:	mov    QWORD PTR [rip+0x3a3f],rax        # 0x140008090
   140004651:	bt     r10d,0x13
   140004656:	jae    0x1400046a2
   140004658:	mov    rax,QWORD PTR [rbp+0x20]
   14000465c:	and    al,dl
   14000465e:	cmp    al,dl
   140004660:	jne    0x1400046a2
   140004662:	mov    ecx,r11d
   140004665:	mov    eax,r11d
   140004668:	shr    rcx,0x10
   14000466c:	and    eax,0x400ff
   140004671:	and    ecx,0x7
   140004674:	mov    DWORD PTR [rip+0x436a],eax        # 0x1400089e4
   14000467a:	or     rcx,0x1000028
   140004681:	not    rcx
   140004684:	and    rcx,QWORD PTR [rip+0x3a05]        # 0x140008090
   14000468b:	mov    QWORD PTR [rip+0x39fe],rcx        # 0x140008090
   140004692:	cmp    eax,0x1
   140004695:	jbe    0x1400046a2
   140004697:	and    rcx,0xffffffffffffffbf
   14000469b:	mov    QWORD PTR [rip+0x39ee],rcx        # 0x140008090
   1400046a2:	bt     r10d,0x15
   1400046a7:	jae    0x1400046bd
   1400046a9:	mov    rax,QWORD PTR [rbp+0x20]
   1400046ad:	bt     rax,0x13
   1400046b2:	jae    0x1400046bd
   1400046b4:	btr    QWORD PTR [rip+0x39d3],0x7        # 0x140008090
   1400046bd:	mov    rbx,QWORD PTR [rsp+0x38]
   1400046c2:	xor    eax,eax
   1400046c4:	mov    rsi,QWORD PTR [rsp+0x40]
   1400046c9:	add    rsp,0x10
   1400046cd:	pop    r14
   1400046cf:	pop    rdi
   1400046d0:	pop    rbp
   1400046d1:	ret
   1400046d2:	int3
   1400046d3:	int3
   1400046d4:	xor    eax,eax
   1400046d6:	cmp    DWORD PTR [rip+0x39d4],eax        # 0x1400080b0
   1400046dc:	setne  al
   1400046df:	ret
   1400046e0:	jmp    QWORD PTR [rip+0xb5a]        # 0x140005240
   1400046e6:	jmp    QWORD PTR [rip+0xb14]        # 0x140005200
   1400046ec:	jmp    QWORD PTR [rip+0xb2e]        # 0x140005220
   1400046f2:	jmp    QWORD PTR [rip+0xaf8]        # 0x1400051f0
   1400046f8:	jmp    QWORD PTR [rip+0xaea]        # 0x1400051e8
   1400046fe:	jmp    QWORD PTR [rip+0xaf4]        # 0x1400051f8
   140004704:	jmp    QWORD PTR [rip+0xb1e]        # 0x140005228
   14000470a:	jmp    QWORD PTR [rip+0xb68]        # 0x140005278
   140004710:	jmp    QWORD PTR [rip+0xb52]        # 0x140005268
   140004716:	jmp    QWORD PTR [rip+0xb54]        # 0x140005270
   14000471c:	jmp    QWORD PTR [rip+0xba6]        # 0x1400052c8
   140004722:	jmp    QWORD PTR [rip+0xbb0]        # 0x1400052d8
   140004728:	jmp    QWORD PTR [rip+0xb72]        # 0x1400052a0
   14000472e:	jmp    QWORD PTR [rip+0xbe4]        # 0x140005318
   140004734:	jmp    QWORD PTR [rip+0xbfe]        # 0x140005338
   14000473a:	jmp    QWORD PTR [rip+0xbd0]        # 0x140005310
   140004740:	jmp    QWORD PTR [rip+0xbba]        # 0x140005300
   140004746:	jmp    QWORD PTR [rip+0xb84]        # 0x1400052d0
   14000474c:	jmp    QWORD PTR [rip+0xbce]        # 0x140005320
   140004752:	jmp    QWORD PTR [rip+0xb90]        # 0x1400052e8
   140004758:	jmp    QWORD PTR [rip+0xc4a]        # 0x1400053a8
   14000475e:	jmp    QWORD PTR [rip+0xbc4]        # 0x140005328
   140004764:	jmp    QWORD PTR [rip+0xb76]        # 0x1400052e0
   14000476a:	jmp    QWORD PTR [rip+0xb40]        # 0x1400052b0
   140004770:	jmp    QWORD PTR [rip+0xb42]        # 0x1400052b8
   140004776:	jmp    QWORD PTR [rip+0xb44]        # 0x1400052c0
   14000477c:	jmp    QWORD PTR [rip+0xb0e]        # 0x140005290
   140004782:	jmp    QWORD PTR [rip+0xaf8]        # 0x140005280
   140004788:	jmp    QWORD PTR [rip+0xc22]        # 0x1400053b0
   14000478e:	jmp    QWORD PTR [rip+0xb9c]        # 0x140005330
   140004794:	jmp    QWORD PTR [rip+0xb56]        # 0x1400052f0
   14000479a:	jmp    QWORD PTR [rip+0xb58]        # 0x1400052f8
   1400047a0:	jmp    QWORD PTR [rip+0xb62]        # 0x140005308
   1400047a6:	int3
   1400047a7:	int3
   1400047a8:	sub    rsp,0x28
   1400047ac:	mov    r8,QWORD PTR [r9+0x38]
   1400047b0:	mov    rcx,rdx
   1400047b3:	mov    rdx,r9
   1400047b6:	call   0x1400047c8
   1400047bb:	mov    eax,0x1
   1400047c0:	add    rsp,0x28
   1400047c4:	ret
   1400047c5:	int3
   1400047c6:	int3
   1400047c7:	int3
   1400047c8:	rex push rbx
   1400047ca:	mov    r11d,DWORD PTR [r8]
   1400047cd:	mov    rbx,rdx
   1400047d0:	and    r11d,0xfffffff8
   1400047d4:	mov    r9,rcx
   1400047d7:	test   BYTE PTR [r8],0x4
   1400047db:	mov    r10,rcx
   1400047de:	je     0x1400047f3
   1400047e0:	mov    eax,DWORD PTR [r8+0x8]
   1400047e4:	movsxd r10,DWORD PTR [r8+0x4]
   1400047e8:	neg    eax
   1400047ea:	add    r10,rcx
   1400047ed:	movsxd rcx,eax
   1400047f0:	and    r10,rcx
   1400047f3:	movsxd rax,r11d
   1400047f6:	mov    rdx,QWORD PTR [rax+r10*1]
   1400047fa:	mov    rax,QWORD PTR [rbx+0x10]
   1400047fe:	mov    ecx,DWORD PTR [rax+0x8]
   140004801:	mov    rax,QWORD PTR [rbx+0x8]
   140004805:	test   BYTE PTR [rcx+rax*1+0x3],0xf
   14000480a:	je     0x140004817
   14000480c:	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140004811:	and    eax,0xfffffff0
   140004814:	add    r9,rax
   140004817:	xor    r9,rdx
   14000481a:	mov    rcx,r9
   14000481d:	pop    rbx
   14000481e:	jmp    0x140003950
   140004823:	int3
   140004824:	mov    rax,rsp
   140004827:	mov    QWORD PTR [rax+0x8],rbx
   14000482b:	mov    QWORD PTR [rax+0x10],rbp
   14000482f:	mov    QWORD PTR [rax+0x18],rsi
   140004833:	mov    QWORD PTR [rax+0x20],rdi
   140004837:	push   r14
   140004839:	sub    rsp,0x20
   14000483d:	mov    rbx,QWORD PTR [r9+0x38]
   140004841:	mov    rsi,rdx
   140004844:	mov    r14,r8
   140004847:	mov    rbp,rcx
   14000484a:	mov    rdx,r9
   14000484d:	mov    rcx,rsi
   140004850:	mov    rdi,r9
   140004853:	lea    r8,[rbx+0x4]
   140004857:	call   0x1400047c8
   14000485c:	mov    eax,DWORD PTR [rbp+0x4]
   14000485f:	and    al,0x66
   140004861:	neg    al
   140004863:	mov    eax,0x1
   140004868:	sbb    r8d,r8d
   14000486b:	neg    r8d
   14000486e:	add    r8d,eax
   140004871:	test   DWORD PTR [rbx+0x4],r8d
   140004875:	je     0x140004888
   140004877:	mov    r9,rdi
   14000487a:	mov    r8,r14
   14000487d:	mov    rdx,rsi
   140004880:	mov    rcx,rbp
   140004883:	call   0x1400046e0
   140004888:	mov    rbx,QWORD PTR [rsp+0x30]
   14000488d:	mov    rbp,QWORD PTR [rsp+0x38]
   140004892:	mov    rsi,QWORD PTR [rsp+0x40]
   140004897:	mov    rdi,QWORD PTR [rsp+0x48]
   14000489c:	add    rsp,0x20
   1400048a0:	pop    r14
   1400048a2:	ret
   1400048a3:	jmp    QWORD PTR [rip+0x96f]        # 0x140005218
   1400048a9:	jmp    QWORD PTR [rip+0x981]        # 0x140005230
   1400048af:	int3
   1400048b0:	int3
   1400048b1:	int3
   1400048b2:	int3
   1400048b3:	int3
   1400048b4:	int3
   1400048b5:	int3
   1400048b6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1400048c0:	jmp    rax
   1400048c2:	int3
   1400048c3:	int3
   1400048c4:	int3
   1400048c5:	int3
   1400048c6:	int3
   1400048c7:	int3
   1400048c8:	int3
   1400048c9:	int3
   1400048ca:	int3
   1400048cb:	int3
   1400048cc:	int3
   1400048cd:	int3
   1400048ce:	int3
   1400048cf:	int3
   1400048d0:	int3
   1400048d1:	int3
   1400048d2:	int3
   1400048d3:	int3
   1400048d4:	int3
   1400048d5:	int3
   1400048d6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1400048e0:	jmp    QWORD PTR [rip+0xaf2]        # 0x1400053d8
   1400048e6:	int3
   1400048e7:	int3
   1400048e8:	int3
   1400048e9:	int3
   1400048ea:	int3
   1400048eb:	int3
   1400048ec:	int3
   1400048ed:	int3
   1400048ee:	int3
   1400048ef:	int3
   1400048f0:	lea    rcx,[rdx+0x2a8]
   1400048f7:	jmp    0x140002b50
   1400048fc:	rex push rbp
   1400048fe:	sub    rsp,0x20
   140004902:	mov    rbp,rdx
   140004905:	mov    eax,DWORD PTR [rbp+0x28]
   140004908:	and    eax,0x1
   14000490b:	test   eax,eax
   14000490d:	je     0x140004927
   14000490f:	and    DWORD PTR [rbp+0x28],0xfffffffe
   140004913:	lea    rcx,[rbp+0x180]
   14000491a:	add    rcx,0xb0
   140004921:	call   QWORD PTR [rip+0x7e9]        # 0x140005110
   140004927:	add    rsp,0x20
   14000492b:	pop    rbp
   14000492c:	ret
   14000492d:	lea    rcx,[rdx+0x180]
   140004934:	add    rcx,0x18
   140004938:	rex.W jmp QWORD PTR [rip+0x801]        # 0x140005140
   14000493f:	lea    rcx,[rdx+0x180]
   140004946:	add    rcx,0x10
   14000494a:	jmp    0x140002a80
   14000494f:	lea    rcx,[rdx+0x180]
   140004956:	jmp    0x140001d10
   14000495b:	lea    rcx,[rdx+0x40]
   140004962:	jmp    0x1400034f0
   140004967:	lea    rcx,[rdx+0x290]
   14000496e:	jmp    0x140002af0
   140004973:	rex push rbp
   140004975:	sub    rsp,0x20
   140004979:	mov    rbp,rdx
   14000497c:	mov    eax,DWORD PTR [rbp+0x28]
   14000497f:	and    eax,0x2
   140004982:	test   eax,eax
   140004984:	je     0x14000499b
   140004986:	and    DWORD PTR [rbp+0x28],0xfffffffd
   14000498a:	lea    rcx,[rbp+0x70]
   14000498e:	add    rcx,0xa8
   140004995:	call   QWORD PTR [rip+0x775]        # 0x140005110
   14000499b:	add    rsp,0x20
   14000499f:	pop    rbp
   1400049a0:	ret
   1400049a1:	lea    rcx,[rdx+0x70]
   1400049a8:	add    rcx,0x10
   1400049ac:	rex.W jmp QWORD PTR [rip+0x765]        # 0x140005118
   1400049b3:	lea    rcx,[rdx+0x70]
   1400049ba:	add    rcx,0x8
   1400049be:	jmp    0x140002a80
   1400049c3:	lea    rcx,[rdx+0x70]
   1400049ca:	jmp    0x140001dd0
   1400049cf:	int3
   1400049d0:	lea    rcx,[rdx+0x58]
   1400049d7:	jmp    0x140002b50
   1400049dc:	int3
   1400049dd:	int3
   1400049de:	int3
   1400049df:	int3
   1400049e0:	lea    rcx,[rdx+0x30]
   1400049e7:	jmp    0x140001260
   1400049ec:	int3
   1400049ed:	int3
   1400049ee:	int3
   1400049ef:	int3
   1400049f0:	lea    rcx,[rdx+0x20]
   1400049f7:	jmp    0x140002eb0
   1400049fc:	lea    rcx,[rdx+0x20]
   140004a03:	jmp    0x140002cc0
   140004a08:	mov    QWORD PTR [rsp+0x10],rdx
   140004a0d:	push   rbp
   140004a0e:	sub    rsp,0x20
   140004a12:	mov    rbp,rdx
   140004a15:	mov    rdx,QWORD PTR [rbp+0x60]
   140004a19:	mov    rax,QWORD PTR [rdx]
   140004a1c:	movsxd rcx,DWORD PTR [rax+0x4]
   140004a20:	add    rcx,rdx
   140004a23:	mov    r8b,0x1
   140004a26:	mov    edx,0x4
   140004a2b:	call   QWORD PTR [rip+0x6b7]        # 0x1400050e8
   140004a31:	nop
   140004a32:	movabs rax,0x0
   140004a3c:	add    rsp,0x20
   140004a40:	pop    rbp
   140004a41:	ret
   140004a42:	int3
   140004a43:	int3
   140004a44:	int3
   140004a45:	int3
   140004a46:	int3
   140004a47:	int3
   140004a48:	int3
   140004a49:	int3
   140004a4a:	int3
   140004a4b:	int3
   140004a4c:	int3
   140004a4d:	int3
   140004a4e:	int3
   140004a4f:	int3
   140004a50:	lea    rcx,[rdx+0x28]
   140004a57:	rex.W jmp QWORD PTR [rip+0x77a]        # 0x1400051d8
   140004a5e:	lea    rcx,[rdx+0x30]
   140004a65:	jmp    0x140003550
   140004a6a:	rex push rbp
   140004a6c:	sub    rsp,0x20
   140004a70:	mov    rbp,rdx
   140004a73:	mov    rax,QWORD PTR [rcx]
   140004a76:	mov    rdx,rcx
   140004a79:	mov    ecx,DWORD PTR [rax]
   140004a7b:	call   0x14000471c
   140004a80:	nop
   140004a81:	add    rsp,0x20
   140004a85:	pop    rbp
   140004a86:	ret
   140004a87:	int3
   140004a88:	rex push rbp
   140004a8a:	mov    rbp,rdx
   140004a8d:	mov    rax,QWORD PTR [rcx]
   140004a90:	xor    ecx,ecx
   140004a92:	cmp    DWORD PTR [rax],0xc0000005
   140004a98:	sete   cl
   140004a9b:	mov    eax,ecx
   140004a9d:	pop    rbp
   140004a9e:	ret
   140004a9f:	int3
   140004aa0:	rex push rbx
   140004aa2:	sub    rsp,0x20
   140004aa6:	jmp    0x140004ae5
   140004aa8:	mov    rax,QWORD PTR [rbx]
   140004aab:	mov    rcx,QWORD PTR [rbx+0x8]
   140004aaf:	mov    QWORD PTR [rip+0x393a],rax        # 0x1400083f0
   140004ab6:	mov    rax,QWORD PTR [rcx]
   140004ab9:	mov    rax,QWORD PTR [rax+0x10]
   140004abd:	call   QWORD PTR [rip+0x915]        # 0x1400053d8
   140004ac3:	mov    rcx,rax
   140004ac6:	test   rax,rax
   140004ac9:	je     0x140004adc
   140004acb:	mov    rdx,QWORD PTR [rax]
   140004ace:	mov    rax,QWORD PTR [rdx]
   140004ad1:	mov    edx,0x1
   140004ad6:	call   QWORD PTR [rip+0x8fc]        # 0x1400053d8
   140004adc:	mov    rcx,rbx
   140004adf:	call   QWORD PTR [rip+0x793]        # 0x140005278
   140004ae5:	mov    rbx,QWORD PTR [rip+0x3904]        # 0x1400083f0
   140004aec:	test   rbx,rbx
   140004aef:	jne    0x140004aa8
   140004af1:	add    rsp,0x20
   140004af5:	pop    rbx
   140004af6:	ret
