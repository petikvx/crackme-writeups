
crackme.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	ret
   140001001:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000100c:	nop    DWORD PTR [rax+0x0]
   140001010:	push   rbp
   140001011:	mov    rbp,rsp
   140001014:	sub    rsp,0x20
   140001018:	mov    rax,QWORD PTR [rip+0x8791]        # 0x1400097b0
   14000101f:	xor    ecx,ecx
   140001021:	mov    DWORD PTR [rax],0x1
   140001027:	mov    rax,QWORD PTR [rip+0x8792]        # 0x1400097c0
   14000102e:	mov    DWORD PTR [rax],0x1
   140001034:	mov    rax,QWORD PTR [rip+0x8795]        # 0x1400097d0
   14000103b:	mov    DWORD PTR [rax],0x1
   140001041:	mov    rax,QWORD PTR [rip+0x8718]        # 0x140009760
   140001048:	cmp    WORD PTR [rax],0x5a4d
   14000104d:	jne    0x14000105e
   14000104f:	movsxd rdx,DWORD PTR [rax+0x3c]
   140001053:	add    rax,rdx
   140001056:	cmp    DWORD PTR [rax],0x4550
   14000105c:	je     0x1400010c8
   14000105e:	mov    rax,QWORD PTR [rip+0x873b]        # 0x1400097a0
   140001065:	mov    DWORD PTR [rip+0xafa1],ecx        # 0x14000c00c
   14000106b:	mov    eax,DWORD PTR [rax]
   14000106d:	test   eax,eax
   14000106f:	je     0x1400010b8
   140001071:	mov    ecx,0x2
   140001076:	call   0x1400079c8
   14000107b:	call   0x140007310
   140001080:	mov    rdx,QWORD PTR [rip+0x87f9]        # 0x140009880
   140001087:	mov    edx,DWORD PTR [rdx]
   140001089:	mov    DWORD PTR [rax],edx
   14000108b:	call   0x140007320
   140001090:	mov    rdx,QWORD PTR [rip+0x87c9]        # 0x140009860
   140001097:	mov    edx,DWORD PTR [rdx]
   140001099:	mov    DWORD PTR [rax],edx
   14000109b:	call   0x1400015c0
   1400010a0:	mov    rax,QWORD PTR [rip+0x8669]        # 0x140009710
   1400010a7:	cmp    DWORD PTR [rax],0x1
   1400010aa:	je     0x140001100
   1400010ac:	xor    eax,eax
   1400010ae:	add    rsp,0x20
   1400010b2:	pop    rbp
   1400010b3:	ret
   1400010b4:	nop    DWORD PTR [rax+0x0]
   1400010b8:	mov    ecx,0x1
   1400010bd:	call   0x1400079c8
   1400010c2:	jmp    0x14000107b
   1400010c4:	nop    DWORD PTR [rax+0x0]
   1400010c8:	movzx  edx,WORD PTR [rax+0x18]
   1400010cc:	cmp    dx,0x10b
   1400010d1:	je     0x140001118
   1400010d3:	cmp    dx,0x20b
   1400010d8:	jne    0x14000105e
   1400010da:	cmp    DWORD PTR [rax+0x84],0xe
   1400010e1:	jbe    0x14000105e
   1400010e7:	mov    edx,DWORD PTR [rax+0xf8]
   1400010ed:	xor    ecx,ecx
   1400010ef:	test   edx,edx
   1400010f1:	setne  cl
   1400010f4:	jmp    0x14000105e
   1400010f9:	nop    DWORD PTR [rax+0x0]
   140001100:	mov    rcx,QWORD PTR [rip+0x8799]        # 0x1400098a0
   140001107:	call   0x140001d30
   14000110c:	xor    eax,eax
   14000110e:	add    rsp,0x20
   140001112:	pop    rbp
   140001113:	ret
   140001114:	nop    DWORD PTR [rax+0x0]
   140001118:	cmp    DWORD PTR [rax+0x74],0xe
   14000111c:	jbe    0x14000105e
   140001122:	mov    r8d,DWORD PTR [rax+0xe8]
   140001129:	xor    ecx,ecx
   14000112b:	test   r8d,r8d
   14000112e:	setne  cl
   140001131:	jmp    0x14000105e
   140001136:	cs nop WORD PTR [rax+rax*1+0x0]
   140001140:	push   rbp
   140001141:	mov    rbp,rsp
   140001144:	sub    rsp,0x30
   140001148:	mov    rax,QWORD PTR [rip+0x8761]        # 0x1400098b0
   14000114f:	lea    r8,[rip+0xaec2]        # 0x14000c018
   140001156:	lea    rdx,[rip+0xaec3]        # 0x14000c020
   14000115d:	lea    rcx,[rip+0xaec4]        # 0x14000c028
   140001164:	mov    eax,DWORD PTR [rax]
   140001166:	mov    DWORD PTR [rip+0xae98],eax        # 0x14000c004
   14000116c:	mov    rax,QWORD PTR [rip+0x86fd]        # 0x140009870
   140001173:	mov    r9d,DWORD PTR [rax]
   140001176:	lea    rax,[rip+0xae87]        # 0x14000c004
   14000117d:	mov    QWORD PTR [rsp+0x20],rax
   140001182:	call   0x1400079b8
   140001187:	nop
   140001188:	add    rsp,0x30
   14000118c:	pop    rbp
   14000118d:	ret
   14000118e:	xchg   ax,ax
   140001190:	push   rbp
   140001191:	push   r13
   140001193:	push   r12
   140001195:	push   rdi
   140001196:	push   rsi
   140001197:	push   rbx
   140001198:	sub    rsp,0x28
   14000119c:	lea    rbp,[rsp+0x20]
   1400011a1:	mov    rbx,QWORD PTR [rip+0x8648]        # 0x1400097f0
   1400011a8:	mov    r12,QWORD PTR [rip+0xc059]        # 0x14000d208
   1400011af:	xor    edi,edi
   1400011b1:	mov    rax,QWORD PTR gs:0x30
   1400011ba:	mov    rsi,QWORD PTR [rax+0x8]
   1400011be:	jmp    0x1400011d1
   1400011c0:	cmp    rsi,rax
   1400011c3:	je     0x140001338
   1400011c9:	mov    ecx,0x3e8
   1400011ce:	call   r12
   1400011d1:	mov    rax,rdi
   1400011d4:	lock cmpxchg QWORD PTR [rbx],rsi
   1400011d9:	test   rax,rax
   1400011dc:	jne    0x1400011c0
   1400011de:	mov    rsi,QWORD PTR [rip+0x861b]        # 0x140009800
   1400011e5:	xor    edi,edi
   1400011e7:	mov    eax,DWORD PTR [rsi]
   1400011e9:	cmp    eax,0x1
   1400011ec:	je     0x14000134f
   1400011f2:	mov    eax,DWORD PTR [rsi]
   1400011f4:	test   eax,eax
   1400011f6:	je     0x1400013b0
   1400011fc:	mov    DWORD PTR [rip+0xae02],0x1        # 0x14000c008
   140001206:	mov    eax,DWORD PTR [rsi]
   140001208:	cmp    eax,0x1
   14000120b:	je     0x140001364
   140001211:	test   edi,edi
   140001213:	je     0x140001385
   140001219:	mov    rax,QWORD PTR [rip+0x8530]        # 0x140009750
   140001220:	mov    rax,QWORD PTR [rax]
   140001223:	test   rax,rax
   140001226:	je     0x140001234
   140001228:	xor    r8d,r8d
   14000122b:	mov    edx,0x2
   140001230:	xor    ecx,ecx
   140001232:	call   rax
   140001234:	call   0x140001990
   140001239:	mov    rcx,QWORD PTR [rip+0x8650]        # 0x140009890
   140001240:	call   QWORD PTR [rip+0xbfba]        # 0x14000d200
   140001246:	mov    rdx,QWORD PTR [rip+0x8593]        # 0x1400097e0
   14000124d:	lea    rcx,[rip+0xfffffffffffffdac]        # 0x140001000
   140001254:	mov    QWORD PTR [rdx],rax
   140001257:	call   0x140007420
   14000125c:	call   0x1400017a0
   140001261:	mov    ebx,DWORD PTR [rip+0xadc1]        # 0x14000c028
   140001267:	lea    edi,[rbx+0x1]
   14000126a:	movsxd rdi,edi
   14000126d:	shl    rdi,0x3
   140001271:	mov    rcx,rdi
   140001274:	call   0x140007a50
   140001279:	mov    r13,QWORD PTR [rip+0xada0]        # 0x14000c020
   140001280:	mov    r12,rax
   140001283:	test   ebx,ebx
   140001285:	jle    0x1400013d0
   14000128b:	sub    rdi,0x8
   14000128f:	xor    ebx,ebx
   140001291:	nop    DWORD PTR [rax+0x0]
   140001298:	mov    rcx,QWORD PTR [r13+rbx*1+0x0]
   14000129d:	call   0x140007a78
   1400012a2:	lea    rsi,[rax+0x1]
   1400012a6:	mov    rcx,rsi
   1400012a9:	call   0x140007a50
   1400012ae:	mov    r8,rsi
   1400012b1:	mov    QWORD PTR [r12+rbx*1],rax
   1400012b5:	mov    rdx,QWORD PTR [r13+rbx*1+0x0]
   1400012ba:	mov    rcx,rax
   1400012bd:	add    rbx,0x8
   1400012c1:	call   0x140007a58
   1400012c6:	cmp    rdi,rbx
   1400012c9:	jne    0x140001298
   1400012cb:	add    rdi,r12
   1400012ce:	mov    QWORD PTR [rdi],0x0
   1400012d5:	mov    QWORD PTR [rip+0xad44],r12        # 0x14000c020
   1400012dc:	call   0x1400015a0
   1400012e1:	mov    rax,QWORD PTR [rip+0x8488]        # 0x140009770
   1400012e8:	mov    r8,QWORD PTR [rip+0xad29]        # 0x14000c018
   1400012ef:	mov    ecx,DWORD PTR [rip+0xad33]        # 0x14000c028
   1400012f5:	mov    rax,QWORD PTR [rax]
   1400012f8:	mov    QWORD PTR [rax],r8
   1400012fb:	mov    rdx,QWORD PTR [rip+0xad1e]        # 0x14000c020
   140001302:	call   0x140007b10
   140001307:	mov    ecx,DWORD PTR [rip+0xacff]        # 0x14000c00c
   14000130d:	mov    DWORD PTR [rip+0xacfd],eax        # 0x14000c010
   140001313:	test   ecx,ecx
   140001315:	je     0x1400013d8
   14000131b:	mov    edx,DWORD PTR [rip+0xace7]        # 0x14000c008
   140001321:	test   edx,edx
   140001323:	je     0x140001390
   140001325:	add    rsp,0x28
   140001329:	pop    rbx
   14000132a:	pop    rsi
   14000132b:	pop    rdi
   14000132c:	pop    r12
   14000132e:	pop    r13
   140001330:	pop    rbp
   140001331:	ret
   140001332:	nop    WORD PTR [rax+rax*1+0x0]
   140001338:	mov    rsi,QWORD PTR [rip+0x84c1]        # 0x140009800
   14000133f:	mov    edi,0x1
   140001344:	mov    eax,DWORD PTR [rsi]
   140001346:	cmp    eax,0x1
   140001349:	jne    0x1400011f2
   14000134f:	mov    ecx,0x1f
   140001354:	call   0x1400079d8
   140001359:	mov    eax,DWORD PTR [rsi]
   14000135b:	cmp    eax,0x1
   14000135e:	jne    0x140001211
   140001364:	mov    rdx,QWORD PTR [rip+0x84c5]        # 0x140009830
   14000136b:	mov    rcx,QWORD PTR [rip+0x84ae]        # 0x140009820
   140001372:	call   0x1400079f0
   140001377:	mov    DWORD PTR [rsi],0x2
   14000137d:	test   edi,edi
   14000137f:	jne    0x140001219
   140001385:	xor    eax,eax
   140001387:	xchg   QWORD PTR [rbx],rax
   14000138a:	jmp    0x140001219
   14000138f:	nop
   140001390:	call   0x1400079e0
   140001395:	mov    eax,DWORD PTR [rip+0xac75]        # 0x14000c010
   14000139b:	add    rsp,0x28
   14000139f:	pop    rbx
   1400013a0:	pop    rsi
   1400013a1:	pop    rdi
   1400013a2:	pop    r12
   1400013a4:	pop    r13
   1400013a6:	pop    rbp
   1400013a7:	ret
   1400013a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400013b0:	mov    rdx,QWORD PTR [rip+0x8499]        # 0x140009850
   1400013b7:	mov    rcx,QWORD PTR [rip+0x8482]        # 0x140009840
   1400013be:	mov    DWORD PTR [rsi],0x1
   1400013c4:	call   0x1400079f0
   1400013c9:	jmp    0x140001206
   1400013ce:	xchg   ax,ax
   1400013d0:	mov    rdi,rax
   1400013d3:	jmp    0x1400012ce
   1400013d8:	mov    ecx,eax
   1400013da:	call   0x140007a20
   1400013df:	nop
   1400013e0:	push   rbp
   1400013e1:	mov    rbp,rsp
   1400013e4:	sub    rsp,0x20
   1400013e8:	mov    rax,QWORD PTR [rip+0x83b1]        # 0x1400097a0
   1400013ef:	mov    DWORD PTR [rax],0x1
   1400013f5:	call   0x140001190
   1400013fa:	nop
   1400013fb:	nop
   1400013fc:	add    rsp,0x20
   140001400:	pop    rbp
   140001401:	ret
   140001402:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000140d:	nop    DWORD PTR [rax]
   140001410:	push   rbp
   140001411:	mov    rbp,rsp
   140001414:	sub    rsp,0x20
   140001418:	mov    rax,QWORD PTR [rip+0x8381]        # 0x1400097a0
   14000141f:	mov    DWORD PTR [rax],0x0
   140001425:	call   0x140001190
   14000142a:	nop
   14000142b:	nop
   14000142c:	add    rsp,0x20
   140001430:	pop    rbp
   140001431:	ret
   140001432:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000143d:	nop    DWORD PTR [rax]
   140001440:	push   rbp
   140001441:	mov    rbp,rsp
   140001444:	sub    rsp,0x20
   140001448:	call   0x140007a00
   14000144d:	cmp    rax,0x1
   140001451:	sbb    eax,eax
   140001453:	add    rsp,0x20
   140001457:	pop    rbp
   140001458:	ret
   140001459:	nop
   14000145a:	nop
   14000145b:	nop
   14000145c:	nop
   14000145d:	nop
   14000145e:	nop
   14000145f:	nop
   140001460:	lea    rcx,[rip+0x9]        # 0x140001470
   140001467:	jmp    0x140001440
   14000146c:	nop    DWORD PTR [rax+0x0]
   140001470:	ret
   140001471:	nop
   140001472:	nop
   140001473:	nop
   140001474:	nop
   140001475:	nop
   140001476:	nop
   140001477:	nop
   140001478:	nop
   140001479:	nop
   14000147a:	nop
   14000147b:	nop
   14000147c:	nop
   14000147d:	nop
   14000147e:	nop
   14000147f:	nop
   140001480:	push   rsi
   140001481:	push   rbx
   140001482:	sub    rsp,0x38
   140001486:	lea    rsi,[rsp+0x58]
   14000148b:	mov    QWORD PTR [rsp+0x58],rdx
   140001490:	mov    rbx,rcx
   140001493:	mov    ecx,0x1
   140001498:	mov    QWORD PTR [rsp+0x60],r8
   14000149d:	mov    QWORD PTR [rsp+0x68],r9
   1400014a2:	mov    QWORD PTR [rsp+0x28],rsi
   1400014a7:	call   QWORD PTR [rip+0x6c03]        # 0x1400080b0
   1400014ad:	mov    r8,rsi
   1400014b0:	mov    rdx,rbx
   1400014b3:	mov    rcx,rax
   1400014b6:	call   0x1400025e0
   1400014bb:	add    rsp,0x38
   1400014bf:	pop    rbx
   1400014c0:	pop    rsi
   1400014c1:	ret
   1400014c2:	nop
   1400014c3:	nop
   1400014c4:	nop
   1400014c5:	nop
   1400014c6:	nop
   1400014c7:	nop
   1400014c8:	nop
   1400014c9:	nop
   1400014ca:	nop
   1400014cb:	nop
   1400014cc:	nop
   1400014cd:	nop
   1400014ce:	nop
   1400014cf:	nop
   1400014d0:	push   rbp
   1400014d1:	mov    rbp,rsp
   1400014d4:	sub    rsp,0x20
   1400014d8:	mov    rax,QWORD PTR [rip+0x6b21]        # 0x140008000
   1400014df:	mov    rax,QWORD PTR [rax]
   1400014e2:	test   rax,rax
   1400014e5:	je     0x14000150d
   1400014e7:	nop    WORD PTR [rax+rax*1+0x0]
   1400014f0:	call   rax
   1400014f2:	mov    rax,QWORD PTR [rip+0x6b07]        # 0x140008000
   1400014f9:	lea    rdx,[rax+0x8]
   1400014fd:	mov    rax,QWORD PTR [rax+0x8]
   140001501:	mov    QWORD PTR [rip+0x6af8],rdx        # 0x140008000
   140001508:	test   rax,rax
   14000150b:	jne    0x1400014f0
   14000150d:	add    rsp,0x20
   140001511:	pop    rbp
   140001512:	ret
   140001513:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000151e:	xchg   ax,ax
   140001520:	push   rbp
   140001521:	push   rsi
   140001522:	push   rbx
   140001523:	sub    rsp,0x20
   140001527:	lea    rbp,[rsp+0x20]
   14000152c:	mov    rdx,QWORD PTR [rip+0x81ed]        # 0x140009720
   140001533:	mov    rax,QWORD PTR [rdx]
   140001536:	mov    ecx,eax
   140001538:	cmp    eax,0xffffffff
   14000153b:	je     0x140001580
   14000153d:	test   ecx,ecx
   14000153f:	je     0x140001563
   140001541:	mov    eax,ecx
   140001543:	sub    ecx,0x1
   140001546:	lea    rbx,[rdx+rax*8]
   14000154a:	sub    rax,rcx
   14000154d:	lea    rsi,[rdx+rax*8-0x8]
   140001552:	nop    WORD PTR [rax+rax*1+0x0]
   140001558:	call   QWORD PTR [rbx]
   14000155a:	sub    rbx,0x8
   14000155e:	cmp    rbx,rsi
   140001561:	jne    0x140001558
   140001563:	lea    rcx,[rip+0xffffffffffffff66]        # 0x1400014d0
   14000156a:	add    rsp,0x20
   14000156e:	pop    rbx
   14000156f:	pop    rsi
   140001570:	pop    rbp
   140001571:	jmp    0x140001440
   140001576:	cs nop WORD PTR [rax+rax*1+0x0]
   140001580:	xor    eax,eax
   140001582:	nop    WORD PTR [rax+rax*1+0x0]
   140001588:	lea    r8d,[rax+0x1]
   14000158c:	mov    ecx,eax
   14000158e:	cmp    QWORD PTR [rdx+r8*8],0x0
   140001593:	mov    rax,r8
   140001596:	jne    0x140001588
   140001598:	jmp    0x14000153d
   14000159a:	nop    WORD PTR [rax+rax*1+0x0]
   1400015a0:	mov    eax,DWORD PTR [rip+0xaa8a]        # 0x14000c030
   1400015a6:	test   eax,eax
   1400015a8:	je     0x1400015b0
   1400015aa:	ret
   1400015ab:	nop    DWORD PTR [rax+rax*1+0x0]
   1400015b0:	mov    DWORD PTR [rip+0xaa76],0x1        # 0x14000c030
   1400015ba:	jmp    0x140001520
   1400015bf:	nop
   1400015c0:	xor    eax,eax
   1400015c2:	ret
   1400015c3:	nop
   1400015c4:	nop
   1400015c5:	nop
   1400015c6:	nop
   1400015c7:	nop
   1400015c8:	nop
   1400015c9:	nop
   1400015ca:	nop
   1400015cb:	nop
   1400015cc:	nop
   1400015cd:	nop
   1400015ce:	nop
   1400015cf:	nop
   1400015d0:	push   rbp
   1400015d1:	mov    rbp,rsp
   1400015d4:	sub    rsp,0x20
   1400015d8:	cmp    edx,0x3
   1400015db:	je     0x1400015f0
   1400015dd:	test   edx,edx
   1400015df:	je     0x1400015f0
   1400015e1:	mov    eax,0x1
   1400015e6:	add    rsp,0x20
   1400015ea:	pop    rbp
   1400015eb:	ret
   1400015ec:	nop    DWORD PTR [rax+0x0]
   1400015f0:	call   0x1400020a0
   1400015f5:	mov    eax,0x1
   1400015fa:	add    rsp,0x20
   1400015fe:	pop    rbp
   1400015ff:	ret
   140001600:	push   rbp
   140001601:	push   rsi
   140001602:	push   rbx
   140001603:	sub    rsp,0x20
   140001607:	lea    rbp,[rsp+0x20]
   14000160c:	mov    rax,QWORD PTR [rip+0x80ed]        # 0x140009700
   140001613:	cmp    DWORD PTR [rax],0x2
   140001616:	je     0x14000161e
   140001618:	mov    DWORD PTR [rax],0x2
   14000161e:	cmp    edx,0x2
   140001621:	je     0x140001638
   140001623:	cmp    edx,0x1
   140001626:	je     0x140001670
   140001628:	mov    eax,0x1
   14000162d:	add    rsp,0x20
   140001631:	pop    rbx
   140001632:	pop    rsi
   140001633:	pop    rbp
   140001634:	ret
   140001635:	nop    DWORD PTR [rax]
   140001638:	lea    rbx,[rip+0xca19]        # 0x14000e058
   14000163f:	lea    rsi,[rip+0xca12]        # 0x14000e058
   140001646:	cmp    rbx,rsi
   140001649:	je     0x140001628
   14000164b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001650:	mov    rax,QWORD PTR [rbx]
   140001653:	test   rax,rax
   140001656:	je     0x14000165a
   140001658:	call   rax
   14000165a:	add    rbx,0x8
   14000165e:	cmp    rbx,rsi
   140001661:	jne    0x140001650
   140001663:	mov    eax,0x1
   140001668:	add    rsp,0x20
   14000166c:	pop    rbx
   14000166d:	pop    rsi
   14000166e:	pop    rbp
   14000166f:	ret
   140001670:	call   0x1400020a0
   140001675:	mov    eax,0x1
   14000167a:	add    rsp,0x20
   14000167e:	pop    rbx
   14000167f:	pop    rsi
   140001680:	pop    rbp
   140001681:	ret
   140001682:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000168d:	nop    DWORD PTR [rax]
   140001690:	xor    eax,eax
   140001692:	ret
   140001693:	nop
   140001694:	nop
   140001695:	nop
   140001696:	nop
   140001697:	nop
   140001698:	nop
   140001699:	nop
   14000169a:	nop
   14000169b:	nop
   14000169c:	nop
   14000169d:	nop
   14000169e:	nop
   14000169f:	nop
   1400016a0:	push   rbp
   1400016a1:	push   rsi
   1400016a2:	push   rbx
   1400016a3:	sub    rsp,0x70
   1400016a7:	lea    rbp,[rsp+0x40]
   1400016ac:	movups XMMWORD PTR [rbp+0x0],xmm6
   1400016b0:	movups XMMWORD PTR [rbp+0x10],xmm7
   1400016b4:	movups XMMWORD PTR [rbp+0x20],xmm8
   1400016b9:	cmp    DWORD PTR [rcx],0x6
   1400016bc:	ja     0x14000178c
   1400016c2:	mov    eax,DWORD PTR [rcx]
   1400016c4:	lea    rdx,[rip+0x7af9]        # 0x1400091c4
   1400016cb:	movsxd rax,DWORD PTR [rdx+rax*4]
   1400016cf:	add    rax,rdx
   1400016d2:	jmp    rax
   1400016d4:	nop    DWORD PTR [rax+0x0]
   1400016d8:	lea    rbx,[rip+0x79e0]        # 0x1400090bf
   1400016df:	movsd  xmm8,QWORD PTR [rcx+0x20]
   1400016e5:	movsd  xmm7,QWORD PTR [rcx+0x18]
   1400016ea:	movsd  xmm6,QWORD PTR [rcx+0x10]
   1400016ef:	mov    rsi,QWORD PTR [rcx+0x8]
   1400016f3:	mov    ecx,0x2
   1400016f8:	call   0x140007430
   1400016fd:	movsd  QWORD PTR [rsp+0x30],xmm8
   140001704:	mov    r8,rbx
   140001707:	lea    rdx,[rip+0x7a8a]        # 0x140009198
   14000170e:	movsd  QWORD PTR [rsp+0x28],xmm7
   140001714:	mov    rcx,rax
   140001717:	mov    r9,rsi
   14000171a:	movsd  QWORD PTR [rsp+0x20],xmm6
   140001720:	call   0x140007a28
   140001725:	nop
   140001726:	movups xmm6,XMMWORD PTR [rbp+0x0]
   14000172a:	movups xmm7,XMMWORD PTR [rbp+0x10]
   14000172e:	xor    eax,eax
   140001730:	movups xmm8,XMMWORD PTR [rbp+0x20]
   140001735:	add    rsp,0x70
   140001739:	pop    rbx
   14000173a:	pop    rsi
   14000173b:	pop    rbp
   14000173c:	ret
   14000173d:	nop    DWORD PTR [rax]
   140001740:	lea    rbx,[rip+0x7959]        # 0x1400090a0
   140001747:	jmp    0x1400016df
   140001749:	nop    DWORD PTR [rax+0x0]
   140001750:	lea    rbx,[rip+0x79a9]        # 0x140009100
   140001757:	jmp    0x1400016df
   140001759:	nop    DWORD PTR [rax+0x0]
   140001760:	lea    rbx,[rip+0x7979]        # 0x1400090e0
   140001767:	jmp    0x1400016df
   14000176c:	nop    DWORD PTR [rax+0x0]
   140001770:	lea    rbx,[rip+0x79d9]        # 0x140009150
   140001777:	jmp    0x1400016df
   14000177c:	nop    DWORD PTR [rax+0x0]
   140001780:	lea    rbx,[rip+0x79a1]        # 0x140009128
   140001787:	jmp    0x1400016df
   14000178c:	lea    rbx,[rip+0x79f3]        # 0x140009186
   140001793:	jmp    0x1400016df
   140001798:	nop
   140001799:	nop
   14000179a:	nop
   14000179b:	nop
   14000179c:	nop
   14000179d:	nop
   14000179e:	nop
   14000179f:	nop
   1400017a0:	fninit
   1400017a2:	ret
   1400017a3:	nop
   1400017a4:	nop
   1400017a5:	nop
   1400017a6:	nop
   1400017a7:	nop
   1400017a8:	nop
   1400017a9:	nop
   1400017aa:	nop
   1400017ab:	nop
   1400017ac:	nop
   1400017ad:	nop
   1400017ae:	nop
   1400017af:	nop
   1400017b0:	push   rbp
   1400017b1:	push   rsi
   1400017b2:	push   rbx
   1400017b3:	sub    rsp,0x30
   1400017b7:	lea    rbp,[rsp+0x30]
   1400017bc:	mov    rbx,rcx
   1400017bf:	lea    rax,[rbp+0x28]
   1400017c3:	mov    ecx,0x2
   1400017c8:	mov    QWORD PTR [rbp+0x28],rdx
   1400017cc:	mov    QWORD PTR [rbp+0x30],r8
   1400017d0:	mov    QWORD PTR [rbp+0x38],r9
   1400017d4:	mov    QWORD PTR [rbp-0x8],rax
   1400017d8:	call   0x140007430
   1400017dd:	mov    r8d,0x1b
   1400017e3:	mov    edx,0x1
   1400017e8:	lea    rcx,[rip+0x79f1]        # 0x1400091e0
   1400017ef:	mov    r9,rax
   1400017f2:	call   0x140007a40
   1400017f7:	mov    rsi,QWORD PTR [rbp-0x8]
   1400017fb:	mov    ecx,0x2
   140001800:	call   0x140007430
   140001805:	mov    rdx,rbx
   140001808:	mov    rcx,rax
   14000180b:	mov    r8,rsi
   14000180e:	call   0x140007a88
   140001813:	call   0x140007a10
   140001818:	nop
   140001819:	nop    DWORD PTR [rax+0x0]
   140001820:	push   rbp
   140001821:	push   rdi
   140001822:	push   rsi
   140001823:	push   rbx
   140001824:	sub    rsp,0x58
   140001828:	lea    rbp,[rsp+0x50]
   14000182d:	movsxd rsi,DWORD PTR [rip+0xa870]        # 0x14000c0a4
   140001834:	mov    rbx,rcx
   140001837:	test   esi,esi
   140001839:	jle    0x140001950
   14000183f:	mov    rax,QWORD PTR [rip+0xa862]        # 0x14000c0a8
   140001846:	xor    r9d,r9d
   140001849:	add    rax,0x18
   14000184d:	nop    DWORD PTR [rax]
   140001850:	mov    r8,QWORD PTR [rax]
   140001853:	cmp    rbx,r8
   140001856:	jb     0x14000186b
   140001858:	mov    rdx,QWORD PTR [rax+0x8]
   14000185c:	mov    edx,DWORD PTR [rdx+0x8]
   14000185f:	add    r8,rdx
   140001862:	cmp    rbx,r8
   140001865:	jb     0x1400018f3
   14000186b:	add    r9d,0x1
   14000186f:	add    rax,0x28
   140001873:	cmp    r9d,esi
   140001876:	jne    0x140001850
   140001878:	mov    rcx,rbx
   14000187b:	call   0x1400022d0
   140001880:	mov    rdi,rax
   140001883:	test   rax,rax
   140001886:	je     0x140001972
   14000188c:	mov    rax,QWORD PTR [rip+0xa815]        # 0x14000c0a8
   140001893:	lea    rbx,[rsi+rsi*4]
   140001897:	shl    rbx,0x3
   14000189b:	add    rax,rbx
   14000189e:	mov    QWORD PTR [rax+0x20],rdi
   1400018a2:	mov    DWORD PTR [rax],0x0
   1400018a8:	call   0x140002410
   1400018ad:	mov    edx,DWORD PTR [rdi+0xc]
   1400018b0:	mov    r8d,0x30
   1400018b6:	lea    rcx,[rax+rdx*1]
   1400018ba:	mov    rax,QWORD PTR [rip+0xa7e7]        # 0x14000c0a8
   1400018c1:	lea    rdx,[rbp-0x30]
   1400018c5:	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   1400018ca:	call   QWORD PTR [rip+0xb950]        # 0x14000d220
   1400018d0:	test   rax,rax
   1400018d3:	je     0x140001957
   1400018d9:	mov    eax,DWORD PTR [rbp-0xc]
   1400018dc:	lea    edx,[rax-0x4]
   1400018df:	and    edx,0xfffffffb
   1400018e2:	je     0x1400018ec
   1400018e4:	lea    edx,[rax-0x40]
   1400018e7:	and    edx,0xffffffbf
   1400018ea:	jne    0x140001900
   1400018ec:	add    DWORD PTR [rip+0xa7b1],0x1        # 0x14000c0a4
   1400018f3:	add    rsp,0x58
   1400018f7:	pop    rbx
   1400018f8:	pop    rsi
   1400018f9:	pop    rdi
   1400018fa:	pop    rbp
   1400018fb:	ret
   1400018fc:	nop    DWORD PTR [rax+0x0]
   140001900:	cmp    eax,0x2
   140001903:	mov    rcx,QWORD PTR [rbp-0x30]
   140001907:	mov    rdx,QWORD PTR [rbp-0x18]
   14000190b:	mov    r8d,0x40
   140001911:	mov    eax,0x4
   140001916:	cmove  r8d,eax
   14000191a:	add    rbx,QWORD PTR [rip+0xa787]        # 0x14000c0a8
   140001921:	mov    QWORD PTR [rbx+0x8],rcx
   140001925:	mov    r9,rbx
   140001928:	mov    QWORD PTR [rbx+0x10],rdx
   14000192c:	call   QWORD PTR [rip+0xb8e6]        # 0x14000d218
   140001932:	test   eax,eax
   140001934:	jne    0x1400018ec
   140001936:	call   QWORD PTR [rip+0xb89c]        # 0x14000d1d8
   14000193c:	lea    rcx,[rip+0x7915]        # 0x140009258
   140001943:	mov    edx,eax
   140001945:	call   0x1400017b0
   14000194a:	nop    WORD PTR [rax+rax*1+0x0]
   140001950:	xor    esi,esi
   140001952:	jmp    0x140001878
   140001957:	mov    rax,QWORD PTR [rip+0xa74a]        # 0x14000c0a8
   14000195e:	mov    edx,DWORD PTR [rdi+0x8]
   140001961:	lea    rcx,[rip+0x78b8]        # 0x140009220
   140001968:	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   14000196d:	call   0x1400017b0
   140001972:	mov    rdx,rbx
   140001975:	lea    rcx,[rip+0x7884]        # 0x140009200
   14000197c:	call   0x1400017b0
   140001981:	nop
   140001982:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000198d:	nop    DWORD PTR [rax]
   140001990:	push   rbp
   140001991:	push   r15
   140001993:	push   r14
   140001995:	push   r13
   140001997:	push   r12
   140001999:	push   rdi
   14000199a:	push   rsi
   14000199b:	push   rbx
   14000199c:	sub    rsp,0x48
   1400019a0:	lea    rbp,[rsp+0x40]
   1400019a5:	mov    r12d,DWORD PTR [rip+0xa6f4]        # 0x14000c0a0
   1400019ac:	test   r12d,r12d
   1400019af:	je     0x1400019c8
   1400019b1:	lea    rsp,[rbp+0x8]
   1400019b5:	pop    rbx
   1400019b6:	pop    rsi
   1400019b7:	pop    rdi
   1400019b8:	pop    r12
   1400019ba:	pop    r13
   1400019bc:	pop    r14
   1400019be:	pop    r15
   1400019c0:	pop    rbp
   1400019c1:	ret
   1400019c2:	nop    WORD PTR [rax+rax*1+0x0]
   1400019c8:	mov    DWORD PTR [rip+0xa6ce],0x1        # 0x14000c0a0
   1400019d2:	call   0x140002350
   1400019d7:	cdqe
   1400019d9:	lea    rax,[rax+rax*4]
   1400019dd:	lea    rax,[rax*8+0xf]
   1400019e5:	and    rax,0xfffffffffffffff0
   1400019e9:	call   0x1400025a0
   1400019ee:	mov    r13,QWORD PTR [rip+0x7d3b]        # 0x140009730
   1400019f5:	mov    rbx,QWORD PTR [rip+0x7d44]        # 0x140009740
   1400019fc:	mov    DWORD PTR [rip+0xa69e],0x0        # 0x14000c0a4
   140001a06:	sub    rsp,rax
   140001a09:	lea    rax,[rsp+0x30]
   140001a0e:	mov    QWORD PTR [rip+0xa693],rax        # 0x14000c0a8
   140001a15:	mov    rax,r13
   140001a18:	sub    rax,rbx
   140001a1b:	cmp    rax,0x7
   140001a1f:	jle    0x1400019b1
   140001a21:	mov    edx,DWORD PTR [rbx]
   140001a23:	cmp    rax,0xb
   140001a27:	jg     0x140001b30
   140001a2d:	mov    eax,DWORD PTR [rbx]
   140001a2f:	test   eax,eax
   140001a31:	jne    0x140001ca0
   140001a37:	mov    eax,DWORD PTR [rbx+0x4]
   140001a3a:	test   eax,eax
   140001a3c:	jne    0x140001ca0
   140001a42:	mov    edx,DWORD PTR [rbx+0x8]
   140001a45:	cmp    edx,0x1
   140001a48:	jne    0x140001ce0
   140001a4e:	add    rbx,0xc
   140001a52:	cmp    rbx,r13
   140001a55:	jae    0x1400019b1
   140001a5b:	mov    r14,QWORD PTR [rip+0x7cfe]        # 0x140009760
   140001a62:	mov    r15d,0xffffffff
   140001a68:	jmp    0x140001acf
   140001a6a:	nop    WORD PTR [rax+rax*1+0x0]
   140001a70:	cmp    ecx,0x8
   140001a73:	je     0x140001b50
   140001a79:	cmp    ecx,0x10
   140001a7c:	jne    0x140001cd2
   140001a82:	movzx  esi,WORD PTR [rdi]
   140001a85:	and    edx,0xc0
   140001a8b:	test   si,si
   140001a8e:	jns    0x140001c60
   140001a94:	or     rsi,0xffffffffffff0000
   140001a9b:	sub    rsi,rax
   140001a9e:	add    rsi,r9
   140001aa1:	test   edx,edx
   140001aa3:	jne    0x140001ab7
   140001aa5:	cmp    rsi,0xffffffffffff8000
   140001aac:	jl     0x140001b13
   140001aae:	cmp    rsi,0xffff
   140001ab5:	jg     0x140001b13
   140001ab7:	mov    rcx,rdi
   140001aba:	call   0x140001820
   140001abf:	mov    WORD PTR [rdi],si
   140001ac2:	add    rbx,0xc
   140001ac6:	cmp    rbx,r13
   140001ac9:	jae    0x140001ba0
   140001acf:	mov    eax,DWORD PTR [rbx]
   140001ad1:	mov    edx,DWORD PTR [rbx+0x8]
   140001ad4:	mov    edi,DWORD PTR [rbx+0x4]
   140001ad7:	add    rax,r14
   140001ada:	movzx  ecx,dl
   140001add:	mov    r9,QWORD PTR [rax]
   140001ae0:	add    rdi,r14
   140001ae3:	cmp    ecx,0x20
   140001ae6:	je     0x140001bf8
   140001aec:	jbe    0x140001a70
   140001aee:	cmp    ecx,0x40
   140001af1:	jne    0x140001cd2
   140001af7:	mov    rsi,QWORD PTR [rdi]
   140001afa:	mov    ecx,edx
   140001afc:	sub    rsi,rax
   140001aff:	add    rsi,r9
   140001b02:	and    ecx,0xc0
   140001b08:	jne    0x140001c50
   140001b0e:	test   rsi,rsi
   140001b11:	js     0x140001ac2
   140001b13:	mov    QWORD PTR [rsp+0x20],rsi
   140001b18:	mov    edx,ecx
   140001b1a:	mov    r8,rdi
   140001b1d:	lea    rcx,[rip+0x77c4]        # 0x1400092e8
   140001b24:	call   0x1400017b0
   140001b29:	nop    DWORD PTR [rax+0x0]
   140001b30:	test   edx,edx
   140001b32:	jne    0x140001ca0
   140001b38:	mov    eax,DWORD PTR [rbx+0x4]
   140001b3b:	mov    edx,eax
   140001b3d:	or     edx,DWORD PTR [rbx+0x8]
   140001b40:	jne    0x140001a3a
   140001b46:	add    rbx,0xc
   140001b4a:	jmp    0x140001a2d
   140001b4f:	nop
   140001b50:	movzx  esi,BYTE PTR [rdi]
   140001b53:	and    edx,0xc0
   140001b59:	test   sil,sil
   140001b5c:	jns    0x140001c88
   140001b62:	or     rsi,0xffffffffffffff00
   140001b69:	sub    rsi,rax
   140001b6c:	add    rsi,r9
   140001b6f:	test   edx,edx
   140001b71:	jne    0x140001b82
   140001b73:	cmp    rsi,0xff
   140001b7a:	jg     0x140001b13
   140001b7c:	cmp    rsi,0xffffffffffffff80
   140001b80:	jl     0x140001b13
   140001b82:	mov    rcx,rdi
   140001b85:	add    rbx,0xc
   140001b89:	call   0x140001820
   140001b8e:	mov    BYTE PTR [rdi],sil
   140001b91:	cmp    rbx,r13
   140001b94:	jb     0x140001acf
   140001b9a:	nop    WORD PTR [rax+rax*1+0x0]
   140001ba0:	mov    edx,DWORD PTR [rip+0xa4fe]        # 0x14000c0a4
   140001ba6:	test   edx,edx
   140001ba8:	jle    0x1400019b1
   140001bae:	mov    rsi,QWORD PTR [rip+0xb663]        # 0x14000d218
   140001bb5:	xor    ebx,ebx
   140001bb7:	lea    rdi,[rbp-0x4]
   140001bbb:	nop    DWORD PTR [rax+rax*1+0x0]
   140001bc0:	mov    rax,QWORD PTR [rip+0xa4e1]        # 0x14000c0a8
   140001bc7:	add    rax,rbx
   140001bca:	mov    r8d,DWORD PTR [rax]
   140001bcd:	test   r8d,r8d
   140001bd0:	je     0x140001bdf
   140001bd2:	mov    rdx,QWORD PTR [rax+0x10]
   140001bd6:	mov    rcx,QWORD PTR [rax+0x8]
   140001bda:	mov    r9,rdi
   140001bdd:	call   rsi
   140001bdf:	add    r12d,0x1
   140001be3:	add    rbx,0x28
   140001be7:	cmp    r12d,DWORD PTR [rip+0xa4b6]        # 0x14000c0a4
   140001bee:	jl     0x140001bc0
   140001bf0:	jmp    0x1400019b1
   140001bf5:	nop    DWORD PTR [rax]
   140001bf8:	mov    esi,DWORD PTR [rdi]
   140001bfa:	and    edx,0xc0
   140001c00:	test   esi,esi
   140001c02:	jns    0x140001c78
   140001c04:	movabs r11,0xffffffff00000000
   140001c0e:	or     rsi,r11
   140001c11:	sub    rsi,rax
   140001c14:	add    rsi,r9
   140001c17:	test   edx,edx
   140001c19:	jne    0x140001c37
   140001c1b:	cmp    rsi,r15
   140001c1e:	jg     0x140001b13
   140001c24:	movabs rax,0xffffffff7fffffff
   140001c2e:	cmp    rsi,rax
   140001c31:	jle    0x140001b13
   140001c37:	mov    rcx,rdi
   140001c3a:	call   0x140001820
   140001c3f:	mov    DWORD PTR [rdi],esi
   140001c41:	jmp    0x140001ac2
   140001c46:	cs nop WORD PTR [rax+rax*1+0x0]
   140001c50:	mov    rcx,rdi
   140001c53:	call   0x140001820
   140001c58:	mov    QWORD PTR [rdi],rsi
   140001c5b:	jmp    0x140001ac2
   140001c60:	sub    rsi,rax
   140001c63:	add    rsi,r9
   140001c66:	test   edx,edx
   140001c68:	je     0x140001aa5
   140001c6e:	jmp    0x140001ab7
   140001c73:	nop    DWORD PTR [rax+rax*1+0x0]
   140001c78:	sub    rsi,rax
   140001c7b:	add    rsi,r9
   140001c7e:	test   edx,edx
   140001c80:	je     0x140001c1b
   140001c82:	jmp    0x140001c37
   140001c84:	nop    DWORD PTR [rax+0x0]
   140001c88:	sub    rsi,rax
   140001c8b:	add    rsi,r9
   140001c8e:	test   edx,edx
   140001c90:	je     0x140001b73
   140001c96:	jmp    0x140001b82
   140001c9b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001ca0:	cmp    rbx,r13
   140001ca3:	jae    0x1400019b1
   140001ca9:	mov    r14,QWORD PTR [rip+0x7ab0]        # 0x140009760
   140001cb0:	mov    esi,DWORD PTR [rbx+0x4]
   140001cb3:	mov    edi,DWORD PTR [rbx]
   140001cb5:	add    rbx,0x8
   140001cb9:	add    rsi,r14
   140001cbc:	add    edi,DWORD PTR [rsi]
   140001cbe:	mov    rcx,rsi
   140001cc1:	call   0x140001820
   140001cc6:	mov    DWORD PTR [rsi],edi
   140001cc8:	cmp    rbx,r13
   140001ccb:	jb     0x140001cb0
   140001ccd:	jmp    0x140001ba0
   140001cd2:	mov    edx,ecx
   140001cd4:	lea    rcx,[rip+0x75dd]        # 0x1400092b8
   140001cdb:	call   0x1400017b0
   140001ce0:	lea    rcx,[rip+0x7599]        # 0x140009280
   140001ce7:	call   0x1400017b0
   140001cec:	nop
   140001ced:	nop
   140001cee:	nop
   140001cef:	nop
   140001cf0:	push   rbp
   140001cf1:	mov    rbp,rsp
   140001cf4:	sub    rsp,0x50
   140001cf8:	mov    rax,QWORD PTR [rip+0xa3b1]        # 0x14000c0b0
   140001cff:	unpcklpd xmm2,xmm3
   140001d03:	test   rax,rax
   140001d06:	je     0x140001d24
   140001d08:	movsd  xmm0,QWORD PTR [rbp+0x30]
   140001d0d:	mov    DWORD PTR [rbp-0x30],ecx
   140001d10:	lea    rcx,[rbp-0x30]
   140001d14:	mov    QWORD PTR [rbp-0x28],rdx
   140001d18:	movups XMMWORD PTR [rbp-0x20],xmm2
   140001d1c:	movsd  QWORD PTR [rbp-0x10],xmm0
   140001d21:	call   rax
   140001d23:	nop
   140001d24:	add    rsp,0x50
   140001d28:	pop    rbp
   140001d29:	ret
   140001d2a:	nop    WORD PTR [rax+rax*1+0x0]
   140001d30:	mov    QWORD PTR [rip+0xa379],rcx        # 0x14000c0b0
   140001d37:	jmp    0x1400079d0
   140001d3c:	nop
   140001d3d:	nop
   140001d3e:	nop
   140001d3f:	nop
   140001d40:	push   rbp
   140001d41:	push   rbx
   140001d42:	sub    rsp,0x28
   140001d46:	lea    rbp,[rsp+0x20]
   140001d4b:	mov    rdx,QWORD PTR [rcx]
   140001d4e:	mov    eax,DWORD PTR [rdx]
   140001d50:	mov    rbx,rcx
   140001d53:	mov    ecx,eax
   140001d55:	and    ecx,0x20ffffff
   140001d5b:	cmp    ecx,0x20474343
   140001d61:	je     0x140001e20
   140001d67:	cmp    eax,0xc0000096
   140001d6c:	ja     0x140001db7
   140001d6e:	cmp    eax,0xc000008b
   140001d73:	jbe    0x140001dd0
   140001d75:	add    eax,0x3fffff73
   140001d7a:	cmp    eax,0x9
   140001d7d:	ja     0x140001e10
   140001d83:	lea    rdx,[rip+0x75b6]        # 0x140009340
   140001d8a:	movsxd rax,DWORD PTR [rdx+rax*4]
   140001d8e:	add    rax,rdx
   140001d91:	jmp    rax
   140001d93:	nop    DWORD PTR [rax+rax*1+0x0]
   140001d98:	xor    edx,edx
   140001d9a:	mov    ecx,0x8
   140001d9f:	call   0x140007a68
   140001da4:	cmp    rax,0x1
   140001da8:	je     0x140001ee4
   140001dae:	test   rax,rax
   140001db1:	jne    0x140001eb0
   140001db7:	mov    rax,QWORD PTR [rip+0xa312]        # 0x14000c0d0
   140001dbe:	test   rax,rax
   140001dc1:	je     0x140001e30
   140001dc3:	mov    rcx,rbx
   140001dc6:	add    rsp,0x28
   140001dca:	pop    rbx
   140001dcb:	pop    rbp
   140001dcc:	rex.W jmp rax
   140001dcf:	nop
   140001dd0:	cmp    eax,0xc0000005
   140001dd5:	je     0x140001e80
   140001ddb:	jbe    0x140001e40
   140001ddd:	cmp    eax,0xc0000008
   140001de2:	je     0x140001e10
   140001de4:	cmp    eax,0xc000001d
   140001de9:	jne    0x140001db7
   140001deb:	xor    edx,edx
   140001ded:	mov    ecx,0x4
   140001df2:	call   0x140007a68
   140001df7:	cmp    rax,0x1
   140001dfb:	je     0x140001ed0
   140001e01:	test   rax,rax
   140001e04:	je     0x140001db7
   140001e06:	mov    ecx,0x4
   140001e0b:	call   rax
   140001e0d:	nop    DWORD PTR [rax]
   140001e10:	mov    eax,0xffffffff
   140001e15:	jmp    0x140001e32
   140001e17:	nop    WORD PTR [rax+rax*1+0x0]
   140001e20:	test   BYTE PTR [rdx+0x4],0x1
   140001e24:	jne    0x140001d67
   140001e2a:	jmp    0x140001e10
   140001e2c:	nop    DWORD PTR [rax+0x0]
   140001e30:	xor    eax,eax
   140001e32:	add    rsp,0x28
   140001e36:	pop    rbx
   140001e37:	pop    rbp
   140001e38:	ret
   140001e39:	nop    DWORD PTR [rax+0x0]
   140001e40:	cmp    eax,0x80000002
   140001e45:	jne    0x140001db7
   140001e4b:	jmp    0x140001e10
   140001e4d:	nop    DWORD PTR [rax]
   140001e50:	xor    edx,edx
   140001e52:	mov    ecx,0x8
   140001e57:	call   0x140007a68
   140001e5c:	cmp    rax,0x1
   140001e60:	jne    0x140001dae
   140001e66:	mov    edx,0x1
   140001e6b:	mov    ecx,0x8
   140001e70:	call   0x140007a68
   140001e75:	jmp    0x140001e10
   140001e77:	nop    WORD PTR [rax+rax*1+0x0]
   140001e80:	xor    edx,edx
   140001e82:	mov    ecx,0xb
   140001e87:	call   0x140007a68
   140001e8c:	cmp    rax,0x1
   140001e90:	je     0x140001ebc
   140001e92:	test   rax,rax
   140001e95:	je     0x140001db7
   140001e9b:	mov    ecx,0xb
   140001ea0:	call   rax
   140001ea2:	jmp    0x140001e10
   140001ea7:	nop    WORD PTR [rax+rax*1+0x0]
   140001eb0:	mov    ecx,0x8
   140001eb5:	call   rax
   140001eb7:	jmp    0x140001e10
   140001ebc:	mov    edx,0x1
   140001ec1:	mov    ecx,0xb
   140001ec6:	call   0x140007a68
   140001ecb:	jmp    0x140001e10
   140001ed0:	mov    edx,0x1
   140001ed5:	mov    ecx,0x4
   140001eda:	call   0x140007a68
   140001edf:	jmp    0x140001e10
   140001ee4:	mov    edx,0x1
   140001ee9:	mov    ecx,0x8
   140001eee:	call   0x140007a68
   140001ef3:	call   0x1400017a0
   140001ef8:	jmp    0x140001e10
   140001efd:	nop
   140001efe:	nop
   140001eff:	nop
   140001f00:	push   rbp
   140001f01:	push   r13
   140001f03:	push   r12
   140001f05:	push   rdi
   140001f06:	push   rsi
   140001f07:	push   rbx
   140001f08:	sub    rsp,0x28
   140001f0c:	lea    rbp,[rsp+0x20]
   140001f11:	lea    r13,[rip+0xa1e8]        # 0x14000c100
   140001f18:	mov    rcx,r13
   140001f1b:	call   QWORD PTR [rip+0xb2af]        # 0x14000d1d0
   140001f21:	mov    rbx,QWORD PTR [rip+0xa1b8]        # 0x14000c0e0
   140001f28:	test   rbx,rbx
   140001f2b:	je     0x140001f65
   140001f2d:	mov    r12,QWORD PTR [rip+0xb2dc]        # 0x14000d210
   140001f34:	mov    rdi,QWORD PTR [rip+0xb29d]        # 0x14000d1d8
   140001f3b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001f40:	mov    ecx,DWORD PTR [rbx]
   140001f42:	call   r12
   140001f45:	mov    rsi,rax
   140001f48:	call   rdi
   140001f4a:	test   rsi,rsi
   140001f4d:	je     0x140001f5c
   140001f4f:	test   eax,eax
   140001f51:	jne    0x140001f5c
   140001f53:	mov    rax,QWORD PTR [rbx+0x8]
   140001f57:	mov    rcx,rsi
   140001f5a:	call   rax
   140001f5c:	mov    rbx,QWORD PTR [rbx+0x10]
   140001f60:	test   rbx,rbx
   140001f63:	jne    0x140001f40
   140001f65:	mov    rcx,r13
   140001f68:	add    rsp,0x28
   140001f6c:	pop    rbx
   140001f6d:	pop    rsi
   140001f6e:	pop    rdi
   140001f6f:	pop    r12
   140001f71:	pop    r13
   140001f73:	pop    rbp
   140001f74:	rex.W jmp QWORD PTR [rip+0xb275]        # 0x14000d1f0
   140001f7b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001f80:	push   rbp
   140001f81:	push   rdi
   140001f82:	push   rsi
   140001f83:	push   rbx
   140001f84:	sub    rsp,0x28
   140001f88:	lea    rbp,[rsp+0x20]
   140001f8d:	mov    eax,DWORD PTR [rip+0xa155]        # 0x14000c0e8
   140001f93:	mov    edi,ecx
   140001f95:	mov    rsi,rdx
   140001f98:	test   eax,eax
   140001f9a:	jne    0x140001fb0
   140001f9c:	xor    eax,eax
   140001f9e:	add    rsp,0x28
   140001fa2:	pop    rbx
   140001fa3:	pop    rsi
   140001fa4:	pop    rdi
   140001fa5:	pop    rbp
   140001fa6:	ret
   140001fa7:	nop    WORD PTR [rax+rax*1+0x0]
   140001fb0:	mov    edx,0x18
   140001fb5:	mov    ecx,0x1
   140001fba:	call   0x140007a18
   140001fbf:	mov    rbx,rax
   140001fc2:	test   rax,rax
   140001fc5:	je     0x140001ffa
   140001fc7:	mov    QWORD PTR [rax+0x8],rsi
   140001fcb:	lea    rsi,[rip+0xa12e]        # 0x14000c100
   140001fd2:	mov    DWORD PTR [rax],edi
   140001fd4:	mov    rcx,rsi
   140001fd7:	call   QWORD PTR [rip+0xb1f3]        # 0x14000d1d0
   140001fdd:	mov    rax,QWORD PTR [rip+0xa0fc]        # 0x14000c0e0
   140001fe4:	mov    rcx,rsi
   140001fe7:	mov    QWORD PTR [rip+0xa0f2],rbx        # 0x14000c0e0
   140001fee:	mov    QWORD PTR [rbx+0x10],rax
   140001ff2:	call   QWORD PTR [rip+0xb1f8]        # 0x14000d1f0
   140001ff8:	jmp    0x140001f9c
   140001ffa:	or     eax,0xffffffff
   140001ffd:	jmp    0x140001f9e
   140001fff:	nop
   140002000:	push   rbp
   140002001:	push   rsi
   140002002:	push   rbx
   140002003:	sub    rsp,0x20
   140002007:	lea    rbp,[rsp+0x20]
   14000200c:	mov    eax,DWORD PTR [rip+0xa0d6]        # 0x14000c0e8
   140002012:	mov    ebx,ecx
   140002014:	test   eax,eax
   140002016:	jne    0x140002028
   140002018:	xor    eax,eax
   14000201a:	add    rsp,0x20
   14000201e:	pop    rbx
   14000201f:	pop    rsi
   140002020:	pop    rbp
   140002021:	ret
   140002022:	nop    WORD PTR [rax+rax*1+0x0]
   140002028:	lea    rsi,[rip+0xa0d1]        # 0x14000c100
   14000202f:	mov    rcx,rsi
   140002032:	call   QWORD PTR [rip+0xb198]        # 0x14000d1d0
   140002038:	mov    rcx,QWORD PTR [rip+0xa0a1]        # 0x14000c0e0
   14000203f:	test   rcx,rcx
   140002042:	je     0x140002073
   140002044:	xor    edx,edx
   140002046:	jmp    0x14000205b
   140002048:	nop    DWORD PTR [rax+rax*1+0x0]
   140002050:	mov    rdx,rcx
   140002053:	test   rax,rax
   140002056:	je     0x140002073
   140002058:	mov    rcx,rax
   14000205b:	mov    eax,DWORD PTR [rcx]
   14000205d:	cmp    eax,ebx
   14000205f:	mov    rax,QWORD PTR [rcx+0x10]
   140002063:	jne    0x140002050
   140002065:	test   rdx,rdx
   140002068:	je     0x140002090
   14000206a:	mov    QWORD PTR [rdx+0x10],rax
   14000206e:	call   0x140007a38
   140002073:	mov    rcx,rsi
   140002076:	call   QWORD PTR [rip+0xb174]        # 0x14000d1f0
   14000207c:	xor    eax,eax
   14000207e:	add    rsp,0x20
   140002082:	pop    rbx
   140002083:	pop    rsi
   140002084:	pop    rbp
   140002085:	ret
   140002086:	cs nop WORD PTR [rax+rax*1+0x0]
   140002090:	mov    QWORD PTR [rip+0xa049],rax        # 0x14000c0e0
   140002097:	jmp    0x14000206e
   140002099:	nop    DWORD PTR [rax+0x0]
   1400020a0:	push   rbp
   1400020a1:	push   rbx
   1400020a2:	sub    rsp,0x28
   1400020a6:	lea    rbp,[rsp+0x20]
   1400020ab:	cmp    edx,0x2
   1400020ae:	je     0x140002160
   1400020b4:	ja     0x1400020e0
   1400020b6:	test   edx,edx
   1400020b8:	je     0x140002100
   1400020ba:	mov    eax,DWORD PTR [rip+0xa028]        # 0x14000c0e8
   1400020c0:	test   eax,eax
   1400020c2:	je     0x140002180
   1400020c8:	mov    DWORD PTR [rip+0xa016],0x1        # 0x14000c0e8
   1400020d2:	mov    eax,0x1
   1400020d7:	add    rsp,0x28
   1400020db:	pop    rbx
   1400020dc:	pop    rbp
   1400020dd:	ret
   1400020de:	xchg   ax,ax
   1400020e0:	cmp    edx,0x3
   1400020e3:	jne    0x1400020d2
   1400020e5:	mov    eax,DWORD PTR [rip+0x9ffd]        # 0x14000c0e8
   1400020eb:	test   eax,eax
   1400020ed:	je     0x1400020d2
   1400020ef:	call   0x140001f00
   1400020f4:	jmp    0x1400020d2
   1400020f6:	cs nop WORD PTR [rax+rax*1+0x0]
   140002100:	mov    eax,DWORD PTR [rip+0x9fe2]        # 0x14000c0e8
   140002106:	test   eax,eax
   140002108:	jne    0x140002178
   14000210a:	mov    eax,DWORD PTR [rip+0x9fd8]        # 0x14000c0e8
   140002110:	cmp    eax,0x1
   140002113:	jne    0x1400020d2
   140002115:	mov    rbx,QWORD PTR [rip+0x9fc4]        # 0x14000c0e0
   14000211c:	test   rbx,rbx
   14000211f:	je     0x140002139
   140002121:	nop    DWORD PTR [rax+0x0]
   140002128:	mov    rcx,rbx
   14000212b:	mov    rbx,QWORD PTR [rbx+0x10]
   14000212f:	call   0x140007a38
   140002134:	test   rbx,rbx
   140002137:	jne    0x140002128
   140002139:	lea    rcx,[rip+0x9fc0]        # 0x14000c100
   140002140:	mov    QWORD PTR [rip+0x9f95],0x0        # 0x14000c0e0
   14000214b:	mov    DWORD PTR [rip+0x9f93],0x0        # 0x14000c0e8
   140002155:	call   QWORD PTR [rip+0xb06d]        # 0x14000d1c8
   14000215b:	jmp    0x1400020d2
   140002160:	call   0x1400017a0
   140002165:	mov    eax,0x1
   14000216a:	add    rsp,0x28
   14000216e:	pop    rbx
   14000216f:	pop    rbp
   140002170:	ret
   140002171:	nop    DWORD PTR [rax+0x0]
   140002178:	call   0x140001f00
   14000217d:	jmp    0x14000210a
   14000217f:	nop
   140002180:	lea    rcx,[rip+0x9f79]        # 0x14000c100
   140002187:	call   QWORD PTR [rip+0xb053]        # 0x14000d1e0
   14000218d:	jmp    0x1400020c8
   140002192:	nop
   140002193:	nop
   140002194:	nop
   140002195:	nop
   140002196:	nop
   140002197:	nop
   140002198:	nop
   140002199:	nop
   14000219a:	nop
   14000219b:	nop
   14000219c:	nop
   14000219d:	nop
   14000219e:	nop
   14000219f:	nop
   1400021a0:	xor    eax,eax
   1400021a2:	cmp    WORD PTR [rcx],0x5a4d
   1400021a7:	jne    0x1400021b8
   1400021a9:	movsxd rdx,DWORD PTR [rcx+0x3c]
   1400021ad:	add    rcx,rdx
   1400021b0:	cmp    DWORD PTR [rcx],0x4550
   1400021b6:	je     0x1400021c0
   1400021b8:	ret
   1400021b9:	nop    DWORD PTR [rax+0x0]
   1400021c0:	xor    eax,eax
   1400021c2:	cmp    WORD PTR [rcx+0x18],0x20b
   1400021c8:	sete   al
   1400021cb:	ret
   1400021cc:	nop    DWORD PTR [rax+0x0]
   1400021d0:	movsxd rax,DWORD PTR [rcx+0x3c]
   1400021d4:	add    rcx,rax
   1400021d7:	movzx  eax,WORD PTR [rcx+0x14]
   1400021db:	movzx  r8d,WORD PTR [rcx+0x6]
   1400021e0:	lea    rax,[rcx+rax*1+0x18]
   1400021e5:	test   r8w,r8w
   1400021e9:	je     0x14000221d
   1400021eb:	lea    ecx,[r8-0x1]
   1400021ef:	lea    rcx,[rcx+rcx*4]
   1400021f3:	lea    r9,[rax+rcx*8+0x28]
   1400021f8:	nop    DWORD PTR [rax+rax*1+0x0]
   140002200:	mov    r8d,DWORD PTR [rax+0xc]
   140002204:	mov    rcx,r8
   140002207:	cmp    rdx,r8
   14000220a:	jb     0x140002214
   14000220c:	add    ecx,DWORD PTR [rax+0x8]
   14000220f:	cmp    rdx,rcx
   140002212:	jb     0x14000221f
   140002214:	add    rax,0x28
   140002218:	cmp    rax,r9
   14000221b:	jne    0x140002200
   14000221d:	xor    eax,eax
   14000221f:	ret
   140002220:	push   rbp
   140002221:	push   rdi
   140002222:	push   rsi
   140002223:	push   rbx
   140002224:	sub    rsp,0x28
   140002228:	lea    rbp,[rsp+0x20]
   14000222d:	mov    rsi,rcx
   140002230:	call   0x140007a78
   140002235:	cmp    rax,0x8
   140002239:	ja     0x1400022b8
   14000223b:	mov    rdx,QWORD PTR [rip+0x751e]        # 0x140009760
   140002242:	xor    ebx,ebx
   140002244:	cmp    WORD PTR [rdx],0x5a4d
   140002249:	jne    0x1400022a6
   14000224b:	movsxd rax,DWORD PTR [rdx+0x3c]
   14000224f:	add    rax,rdx
   140002252:	cmp    DWORD PTR [rax],0x4550
   140002258:	jne    0x1400022a6
   14000225a:	cmp    WORD PTR [rax+0x18],0x20b
   140002260:	jne    0x1400022a6
   140002262:	movzx  edx,WORD PTR [rax+0x14]
   140002266:	lea    rbx,[rax+rdx*1+0x18]
   14000226b:	movzx  edx,WORD PTR [rax+0x6]
   14000226f:	test   dx,dx
   140002272:	je     0x1400022b8
   140002274:	lea    eax,[rdx-0x1]
   140002277:	lea    rax,[rax+rax*4]
   14000227b:	lea    rdi,[rbx+rax*8+0x28]
   140002280:	jmp    0x140002291
   140002282:	nop    WORD PTR [rax+rax*1+0x0]
   140002288:	add    rbx,0x28
   14000228c:	cmp    rbx,rdi
   14000228f:	je     0x1400022b8
   140002291:	mov    r8d,0x8
   140002297:	mov    rdx,rsi
   14000229a:	mov    rcx,rbx
   14000229d:	call   0x140007a80
   1400022a2:	test   eax,eax
   1400022a4:	jne    0x140002288
   1400022a6:	mov    rax,rbx
   1400022a9:	add    rsp,0x28
   1400022ad:	pop    rbx
   1400022ae:	pop    rsi
   1400022af:	pop    rdi
   1400022b0:	pop    rbp
   1400022b1:	ret
   1400022b2:	nop    WORD PTR [rax+rax*1+0x0]
   1400022b8:	xor    ebx,ebx
   1400022ba:	mov    rax,rbx
   1400022bd:	add    rsp,0x28
   1400022c1:	pop    rbx
   1400022c2:	pop    rsi
   1400022c3:	pop    rdi
   1400022c4:	pop    rbp
   1400022c5:	ret
   1400022c6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400022d0:	mov    rdx,QWORD PTR [rip+0x7489]        # 0x140009760
   1400022d7:	xor    eax,eax
   1400022d9:	cmp    WORD PTR [rdx],0x5a4d
   1400022de:	jne    0x1400022f0
   1400022e0:	movsxd r8,DWORD PTR [rdx+0x3c]
   1400022e4:	add    r8,rdx
   1400022e7:	cmp    DWORD PTR [r8],0x4550
   1400022ee:	je     0x1400022f8
   1400022f0:	ret
   1400022f1:	nop    DWORD PTR [rax+0x0]
   1400022f8:	cmp    WORD PTR [r8+0x18],0x20b
   1400022ff:	jne    0x1400022f0
   140002301:	movzx  eax,WORD PTR [r8+0x14]
   140002306:	sub    rcx,rdx
   140002309:	lea    rax,[r8+rax*1+0x18]
   14000230e:	movzx  r8d,WORD PTR [r8+0x6]
   140002313:	test   r8w,r8w
   140002317:	je     0x14000234d
   140002319:	lea    edx,[r8-0x1]
   14000231d:	lea    rdx,[rdx+rdx*4]
   140002321:	lea    r9,[rax+rdx*8+0x28]
   140002326:	cs nop WORD PTR [rax+rax*1+0x0]
   140002330:	mov    r8d,DWORD PTR [rax+0xc]
   140002334:	mov    rdx,r8
   140002337:	cmp    rcx,r8
   14000233a:	jb     0x140002344
   14000233c:	add    edx,DWORD PTR [rax+0x8]
   14000233f:	cmp    rcx,rdx
   140002342:	jb     0x1400022f0
   140002344:	add    rax,0x28
   140002348:	cmp    rax,r9
   14000234b:	jne    0x140002330
   14000234d:	xor    eax,eax
   14000234f:	ret
   140002350:	mov    rax,QWORD PTR [rip+0x7409]        # 0x140009760
   140002357:	xor    ecx,ecx
   140002359:	cmp    WORD PTR [rax],0x5a4d
   14000235e:	jne    0x14000236f
   140002360:	movsxd rdx,DWORD PTR [rax+0x3c]
   140002364:	add    rax,rdx
   140002367:	cmp    DWORD PTR [rax],0x4550
   14000236d:	je     0x140002378
   14000236f:	mov    eax,ecx
   140002371:	ret
   140002372:	nop    WORD PTR [rax+rax*1+0x0]
   140002378:	cmp    WORD PTR [rax+0x18],0x20b
   14000237e:	jne    0x14000236f
   140002380:	movzx  ecx,WORD PTR [rax+0x6]
   140002384:	mov    eax,ecx
   140002386:	ret
   140002387:	nop    WORD PTR [rax+rax*1+0x0]
   140002390:	mov    r8,QWORD PTR [rip+0x73c9]        # 0x140009760
   140002397:	xor    eax,eax
   140002399:	cmp    WORD PTR [r8],0x5a4d
   14000239f:	jne    0x1400023b0
   1400023a1:	movsxd rdx,DWORD PTR [r8+0x3c]
   1400023a5:	add    rdx,r8
   1400023a8:	cmp    DWORD PTR [rdx],0x4550
   1400023ae:	je     0x1400023b8
   1400023b0:	ret
   1400023b1:	nop    DWORD PTR [rax+0x0]
   1400023b8:	cmp    WORD PTR [rdx+0x18],0x20b
   1400023be:	jne    0x1400023b0
   1400023c0:	movzx  eax,WORD PTR [rdx+0x14]
   1400023c4:	movzx  r8d,WORD PTR [rdx+0x6]
   1400023c9:	lea    rax,[rdx+rax*1+0x18]
   1400023ce:	test   r8w,r8w
   1400023d2:	je     0x140002400
   1400023d4:	lea    edx,[r8-0x1]
   1400023d8:	lea    rdx,[rdx+rdx*4]
   1400023dc:	lea    rdx,[rax+rdx*8+0x28]
   1400023e1:	nop    DWORD PTR [rax+0x0]
   1400023e8:	test   BYTE PTR [rax+0x27],0x20
   1400023ec:	je     0x1400023f7
   1400023ee:	test   rcx,rcx
   1400023f1:	je     0x1400023b0
   1400023f3:	sub    rcx,0x1
   1400023f7:	add    rax,0x28
   1400023fb:	cmp    rdx,rax
   1400023fe:	jne    0x1400023e8
   140002400:	xor    eax,eax
   140002402:	ret
   140002403:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000240e:	xchg   ax,ax
   140002410:	mov    rax,QWORD PTR [rip+0x7349]        # 0x140009760
   140002417:	xor    edx,edx
   140002419:	cmp    WORD PTR [rax],0x5a4d
   14000241e:	jne    0x14000242f
   140002420:	movsxd rcx,DWORD PTR [rax+0x3c]
   140002424:	add    rcx,rax
   140002427:	cmp    DWORD PTR [rcx],0x4550
   14000242d:	je     0x140002438
   14000242f:	mov    rax,rdx
   140002432:	ret
   140002433:	nop    DWORD PTR [rax+rax*1+0x0]
   140002438:	cmp    WORD PTR [rcx+0x18],0x20b
   14000243e:	cmove  rdx,rax
   140002442:	mov    rax,rdx
   140002445:	ret
   140002446:	cs nop WORD PTR [rax+rax*1+0x0]
   140002450:	mov    rdx,QWORD PTR [rip+0x7309]        # 0x140009760
   140002457:	xor    eax,eax
   140002459:	cmp    WORD PTR [rdx],0x5a4d
   14000245e:	jne    0x140002470
   140002460:	movsxd r8,DWORD PTR [rdx+0x3c]
   140002464:	add    r8,rdx
   140002467:	cmp    DWORD PTR [r8],0x4550
   14000246e:	je     0x140002478
   140002470:	ret
   140002471:	nop    DWORD PTR [rax+0x0]
   140002478:	cmp    WORD PTR [r8+0x18],0x20b
   14000247f:	jne    0x140002470
   140002481:	sub    rcx,rdx
   140002484:	movzx  r9d,WORD PTR [r8+0x6]
   140002489:	movzx  edx,WORD PTR [r8+0x14]
   14000248e:	lea    rdx,[r8+rdx*1+0x18]
   140002493:	test   r9w,r9w
   140002497:	je     0x140002470
   140002499:	lea    eax,[r9-0x1]
   14000249d:	lea    rax,[rax+rax*4]
   1400024a1:	lea    r9,[rdx+rax*8+0x28]
   1400024a6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400024b0:	mov    r8d,DWORD PTR [rdx+0xc]
   1400024b4:	mov    rax,r8
   1400024b7:	cmp    rcx,r8
   1400024ba:	jb     0x1400024c4
   1400024bc:	add    eax,DWORD PTR [rdx+0x8]
   1400024bf:	cmp    rcx,rax
   1400024c2:	jb     0x1400024d0
   1400024c4:	add    rdx,0x28
   1400024c8:	cmp    rdx,r9
   1400024cb:	jne    0x1400024b0
   1400024cd:	xor    eax,eax
   1400024cf:	ret
   1400024d0:	mov    eax,DWORD PTR [rdx+0x24]
   1400024d3:	not    eax
   1400024d5:	shr    eax,0x1f
   1400024d8:	ret
   1400024d9:	nop    DWORD PTR [rax+0x0]
   1400024e0:	mov    r11,QWORD PTR [rip+0x7279]        # 0x140009760
   1400024e7:	xor    r8d,r8d
   1400024ea:	cmp    WORD PTR [r11],0x5a4d
   1400024f0:	mov    r10d,ecx
   1400024f3:	jne    0x140002504
   1400024f5:	movsxd rcx,DWORD PTR [r11+0x3c]
   1400024f9:	add    rcx,r11
   1400024fc:	cmp    DWORD PTR [rcx],0x4550
   140002502:	je     0x140002510
   140002504:	mov    rax,r8
   140002507:	ret
   140002508:	nop    DWORD PTR [rax+rax*1+0x0]
   140002510:	cmp    WORD PTR [rcx+0x18],0x20b
   140002516:	jne    0x140002504
   140002518:	mov    eax,DWORD PTR [rcx+0x90]
   14000251e:	test   eax,eax
   140002520:	je     0x140002504
   140002522:	movzx  edx,WORD PTR [rcx+0x14]
   140002526:	movzx  r9d,WORD PTR [rcx+0x6]
   14000252b:	lea    rdx,[rcx+rdx*1+0x18]
   140002530:	test   r9w,r9w
   140002534:	je     0x140002504
   140002536:	lea    ecx,[r9-0x1]
   14000253a:	lea    rcx,[rcx+rcx*4]
   14000253e:	lea    r9,[rdx+rcx*8+0x28]
   140002543:	nop    DWORD PTR [rax+rax*1+0x0]
   140002548:	mov    r8d,DWORD PTR [rdx+0xc]
   14000254c:	mov    rcx,r8
   14000254f:	cmp    rax,r8
   140002552:	jb     0x14000255c
   140002554:	add    ecx,DWORD PTR [rdx+0x8]
   140002557:	cmp    rax,rcx
   14000255a:	jb     0x140002570
   14000255c:	add    rdx,0x28
   140002560:	cmp    r9,rdx
   140002563:	jne    0x140002548
   140002565:	xor    r8d,r8d
   140002568:	mov    rax,r8
   14000256b:	ret
   14000256c:	nop    DWORD PTR [rax+0x0]
   140002570:	add    rax,r11
   140002573:	jmp    0x140002580
   140002575:	nop    DWORD PTR [rax]
   140002578:	sub    r10d,0x1
   14000257c:	add    rax,0x14
   140002580:	mov    ecx,DWORD PTR [rax+0x4]
   140002583:	test   ecx,ecx
   140002585:	jne    0x14000258e
   140002587:	mov    edx,DWORD PTR [rax+0xc]
   14000258a:	test   edx,edx
   14000258c:	je     0x140002565
   14000258e:	test   r10d,r10d
   140002591:	jg     0x140002578
   140002593:	mov    r8d,DWORD PTR [rax+0xc]
   140002597:	add    r8,r11
   14000259a:	mov    rax,r8
   14000259d:	ret
   14000259e:	nop
   14000259f:	nop
   1400025a0:	push   rcx
   1400025a1:	push   rax
   1400025a2:	cmp    rax,0x1000
   1400025a8:	lea    rcx,[rsp+0x18]
   1400025ad:	jb     0x1400025c8
   1400025af:	sub    rcx,0x1000
   1400025b6:	or     QWORD PTR [rcx],0x0
   1400025ba:	sub    rax,0x1000
   1400025c0:	cmp    rax,0x1000
   1400025c6:	ja     0x1400025af
   1400025c8:	sub    rcx,rax
   1400025cb:	or     QWORD PTR [rcx],0x0
   1400025cf:	pop    rax
   1400025d0:	pop    rcx
   1400025d1:	ret
   1400025d2:	nop
   1400025d3:	nop
   1400025d4:	nop
   1400025d5:	nop
   1400025d6:	nop
   1400025d7:	nop
   1400025d8:	nop
   1400025d9:	nop
   1400025da:	nop
   1400025db:	nop
   1400025dc:	nop
   1400025dd:	nop
   1400025de:	nop
   1400025df:	nop
   1400025e0:	push   rbp
   1400025e1:	push   rdi
   1400025e2:	push   rsi
   1400025e3:	push   rbx
   1400025e4:	sub    rsp,0x38
   1400025e8:	lea    rbp,[rsp+0x30]
   1400025ed:	mov    rdi,r8
   1400025f0:	mov    rbx,rcx
   1400025f3:	mov    rsi,rdx
   1400025f6:	call   0x140007330
   1400025fb:	mov    QWORD PTR [rsp+0x20],rdi
   140002600:	mov    r9,rsi
   140002603:	xor    r8d,r8d
   140002606:	mov    rdx,rbx
   140002609:	mov    ecx,0x6000
   14000260e:	call   0x1400041e0
   140002613:	mov    rcx,rbx
   140002616:	mov    esi,eax
   140002618:	call   0x1400073a0
   14000261d:	mov    eax,esi
   14000261f:	add    rsp,0x38
   140002623:	pop    rbx
   140002624:	pop    rsi
   140002625:	pop    rdi
   140002626:	pop    rbp
   140002627:	ret
   140002628:	nop
   140002629:	nop
   14000262a:	nop
   14000262b:	nop
   14000262c:	nop
   14000262d:	nop
   14000262e:	nop
   14000262f:	nop
   140002630:	push   rbp
   140002631:	mov    rbp,rsp
   140002634:	sub    rsp,0x60
   140002638:	mov    rax,QWORD PTR [rdx]
   14000263b:	mov    edx,DWORD PTR [rdx+0x8]
   14000263e:	mov    r11d,edx
   140002641:	mov    r10d,ecx
   140002644:	mov    QWORD PTR [rbp-0x10],rax
   140002648:	mov    rcx,rdx
   14000264b:	mov    DWORD PTR [rbp-0x8],edx
   14000264e:	and    r11w,0x7fff
   140002654:	jne    0x1400026c0
   140002656:	mov    rdx,rax
   140002659:	shr    rdx,0x20
   14000265d:	or     eax,edx
   14000265f:	je     0x1400026f0
   140002665:	test   edx,edx
   140002667:	jns    0x140002700
   14000266d:	lea    edx,[r11-0x403e]
   140002674:	mov    eax,0x1
   140002679:	movsx  edx,dx
   14000267c:	mov    DWORD PTR [rbp-0x1c],eax
   14000267f:	and    ecx,0x8000
   140002685:	mov    rax,QWORD PTR [rbp+0x30]
   140002689:	mov    DWORD PTR [rax],ecx
   14000268b:	lea    rax,[rbp-0x18]
   14000268f:	lea    rcx,[rip+0x59aa]        # 0x140008040
   140002696:	mov    QWORD PTR [rsp+0x30],r9
   14000269b:	lea    r9,[rbp-0x1c]
   14000269f:	mov    DWORD PTR [rsp+0x28],r8d
   1400026a4:	lea    r8,[rbp-0x10]
   1400026a8:	mov    QWORD PTR [rsp+0x38],rax
   1400026ad:	mov    DWORD PTR [rsp+0x20],r10d
   1400026b2:	call   0x140004e60
   1400026b7:	add    rsp,0x60
   1400026bb:	pop    rbp
   1400026bc:	ret
   1400026bd:	nop    DWORD PTR [rax]
   1400026c0:	cmp    r11w,0x7fff
   1400026c6:	jne    0x14000266d
   1400026c8:	mov    rdx,rax
   1400026cb:	shr    rdx,0x20
   1400026cf:	and    edx,0x7fffffff
   1400026d5:	or     edx,eax
   1400026d7:	je     0x140002710
   1400026d9:	mov    DWORD PTR [rbp-0x1c],0x4
   1400026e0:	xor    edx,edx
   1400026e2:	xor    ecx,ecx
   1400026e4:	jmp    0x140002685
   1400026e6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400026f0:	xor    eax,eax
   1400026f2:	xor    edx,edx
   1400026f4:	jmp    0x14000267c
   1400026f6:	cs nop WORD PTR [rax+rax*1+0x0]
   140002700:	mov    eax,0x2
   140002705:	mov    edx,0xffffbfc3
   14000270a:	jmp    0x14000267c
   14000270f:	nop
   140002710:	mov    eax,0x3
   140002715:	xor    edx,edx
   140002717:	jmp    0x14000267c
   14000271c:	nop    DWORD PTR [rax+0x0]
   140002720:	push   rbp
   140002721:	push   rbx
   140002722:	sub    rsp,0x28
   140002726:	lea    rbp,[rsp+0x20]
   14000272b:	mov    rbx,rdx
   14000272e:	mov    edx,DWORD PTR [rdx+0x8]
   140002731:	test   dh,0x40
   140002734:	jne    0x14000273e
   140002736:	mov    eax,DWORD PTR [rbx+0x24]
   140002739:	cmp    DWORD PTR [rbx+0x28],eax
   14000273c:	jle    0x140002750
   14000273e:	mov    rax,QWORD PTR [rbx]
   140002741:	and    dh,0x20
   140002744:	jne    0x140002760
   140002746:	movsxd rdx,DWORD PTR [rbx+0x24]
   14000274a:	mov    BYTE PTR [rax+rdx*1],cl
   14000274d:	mov    eax,DWORD PTR [rbx+0x24]
   140002750:	add    eax,0x1
   140002753:	mov    DWORD PTR [rbx+0x24],eax
   140002756:	add    rsp,0x28
   14000275a:	pop    rbx
   14000275b:	pop    rbp
   14000275c:	ret
   14000275d:	nop    DWORD PTR [rax]
   140002760:	mov    rdx,rax
   140002763:	call   0x140007a30
   140002768:	mov    eax,DWORD PTR [rbx+0x24]
   14000276b:	add    eax,0x1
   14000276e:	mov    DWORD PTR [rbx+0x24],eax
   140002771:	add    rsp,0x28
   140002775:	pop    rbx
   140002776:	pop    rbp
   140002777:	ret
   140002778:	nop    DWORD PTR [rax+rax*1+0x0]
   140002780:	push   rbp
   140002781:	push   r15
   140002783:	push   r14
   140002785:	push   r13
   140002787:	push   r12
   140002789:	push   rdi
   14000278a:	push   rsi
   14000278b:	push   rbx
   14000278c:	sub    rsp,0x58
   140002790:	lea    rbp,[rsp+0x50]
   140002795:	lea    rax,[rbp-0x18]
   140002799:	lea    rdi,[rbp-0x10]
   14000279d:	mov    esi,edx
   14000279f:	mov    rbx,r8
   1400027a2:	xor    edx,edx
   1400027a4:	mov    r12,rcx
   1400027a7:	mov    r8,rax
   1400027aa:	mov    rcx,rdi
   1400027ad:	mov    QWORD PTR [rbp-0x28],rax
   1400027b1:	call   0x1400074f0
   1400027b6:	mov    eax,DWORD PTR [rbx+0x10]
   1400027b9:	cmp    esi,eax
   1400027bb:	mov    edx,eax
   1400027bd:	cmovle edx,esi
   1400027c0:	test   eax,eax
   1400027c2:	mov    eax,DWORD PTR [rbx+0xc]
   1400027c5:	cmovns esi,edx
   1400027c8:	cmp    eax,esi
   1400027ca:	jg     0x1400028bb
   1400027d0:	mov    DWORD PTR [rbx+0xc],0xffffffff
   1400027d7:	lea    r13d,[rsi-0x1]
   1400027db:	test   esi,esi
   1400027dd:	jle    0x140002915
   1400027e3:	xor    esi,esi
   1400027e5:	add    r13d,0x1
   1400027e9:	nop    DWORD PTR [rax+0x0]
   1400027f0:	movzx  edx,WORD PTR [r12+rsi*2]
   1400027f5:	mov    r8,QWORD PTR [rbp-0x28]
   1400027f9:	mov    rcx,rdi
   1400027fc:	call   0x1400074f0
   140002801:	test   eax,eax
   140002803:	jle    0x14000289d
   140002809:	sub    eax,0x1
   14000280c:	mov    r15,rdi
   14000280f:	lea    r14,[rdi+rax*1+0x1]
   140002814:	jmp    0x140002835
   140002816:	cs nop WORD PTR [rax+rax*1+0x0]
   140002820:	movsxd rdx,DWORD PTR [rbx+0x24]
   140002824:	mov    BYTE PTR [rax+rdx*1],cl
   140002827:	mov    eax,DWORD PTR [rbx+0x24]
   14000282a:	add    eax,0x1
   14000282d:	mov    DWORD PTR [rbx+0x24],eax
   140002830:	cmp    r15,r14
   140002833:	je     0x14000286c
   140002835:	mov    edx,DWORD PTR [rbx+0x8]
   140002838:	add    r15,0x1
   14000283c:	test   dh,0x40
   14000283f:	jne    0x140002849
   140002841:	mov    eax,DWORD PTR [rbx+0x24]
   140002844:	cmp    DWORD PTR [rbx+0x28],eax
   140002847:	jle    0x14000282a
   140002849:	movsx  ecx,BYTE PTR [r15-0x1]
   14000284e:	mov    rax,QWORD PTR [rbx]
   140002851:	and    dh,0x20
   140002854:	je     0x140002820
   140002856:	mov    rdx,rax
   140002859:	call   0x140007a30
   14000285e:	mov    eax,DWORD PTR [rbx+0x24]
   140002861:	add    eax,0x1
   140002864:	mov    DWORD PTR [rbx+0x24],eax
   140002867:	cmp    r15,r14
   14000286a:	jne    0x140002835
   14000286c:	add    rsi,0x1
   140002870:	mov    eax,r13d
   140002873:	sub    eax,esi
   140002875:	test   eax,eax
   140002877:	jg     0x1400027f0
   14000287d:	mov    eax,DWORD PTR [rbx+0xc]
   140002880:	lea    edx,[rax-0x1]
   140002883:	mov    DWORD PTR [rbx+0xc],edx
   140002886:	test   eax,eax
   140002888:	jle    0x1400028aa
   14000288a:	nop    WORD PTR [rax+rax*1+0x0]
   140002890:	mov    rdx,rbx
   140002893:	mov    ecx,0x20
   140002898:	call   0x140002720
   14000289d:	mov    eax,DWORD PTR [rbx+0xc]
   1400028a0:	lea    edx,[rax-0x1]
   1400028a3:	mov    DWORD PTR [rbx+0xc],edx
   1400028a6:	test   eax,eax
   1400028a8:	jg     0x140002890
   1400028aa:	add    rsp,0x58
   1400028ae:	pop    rbx
   1400028af:	pop    rsi
   1400028b0:	pop    rdi
   1400028b1:	pop    r12
   1400028b3:	pop    r13
   1400028b5:	pop    r14
   1400028b7:	pop    r15
   1400028b9:	pop    rbp
   1400028ba:	ret
   1400028bb:	sub    eax,esi
   1400028bd:	mov    DWORD PTR [rbx+0xc],eax
   1400028c0:	test   BYTE PTR [rbx+0x9],0x4
   1400028c4:	jne    0x140002900
   1400028c6:	sub    eax,0x1
   1400028c9:	mov    DWORD PTR [rbx+0xc],eax
   1400028cc:	nop    DWORD PTR [rax+0x0]
   1400028d0:	mov    rdx,rbx
   1400028d3:	mov    ecx,0x20
   1400028d8:	call   0x140002720
   1400028dd:	mov    eax,DWORD PTR [rbx+0xc]
   1400028e0:	lea    edx,[rax-0x1]
   1400028e3:	mov    DWORD PTR [rbx+0xc],edx
   1400028e6:	test   eax,eax
   1400028e8:	jne    0x1400028d0
   1400028ea:	lea    r13d,[rsi-0x1]
   1400028ee:	test   esi,esi
   1400028f0:	jg     0x1400027e3
   1400028f6:	jmp    0x14000289d
   1400028f8:	nop    DWORD PTR [rax+rax*1+0x0]
   140002900:	lea    r13d,[rsi-0x1]
   140002904:	test   esi,esi
   140002906:	jg     0x1400027e3
   14000290c:	sub    DWORD PTR [rbx+0xc],0x1
   140002910:	jmp    0x140002890
   140002915:	mov    DWORD PTR [rbx+0xc],0xfffffffe
   14000291c:	jmp    0x1400028aa
   14000291e:	xchg   ax,ax
   140002920:	push   rbp
   140002921:	push   rdi
   140002922:	push   rsi
   140002923:	push   rbx
   140002924:	sub    rsp,0x28
   140002928:	lea    rbp,[rsp+0x20]
   14000292d:	mov    eax,DWORD PTR [r8+0x10]
   140002931:	mov    edi,edx
   140002933:	cmp    edx,eax
   140002935:	mov    edx,eax
   140002937:	mov    rsi,rcx
   14000293a:	cmovle edx,edi
   14000293d:	test   eax,eax
   14000293f:	mov    eax,DWORD PTR [r8+0xc]
   140002943:	mov    rbx,r8
   140002946:	cmovns edi,edx
   140002949:	cmp    eax,edi
   14000294b:	jg     0x140002a08
   140002951:	mov    DWORD PTR [r8+0xc],0xffffffff
   140002959:	lea    edx,[rdi-0x1]
   14000295c:	test   edi,edi
   14000295e:	je     0x1400029f5
   140002964:	mov    eax,DWORD PTR [rbx+0x8]
   140002967:	lea    edi,[rdx+0x1]
   14000296a:	add    rdi,rsi
   14000296d:	jmp    0x140002988
   14000296f:	nop
   140002970:	movsxd rax,DWORD PTR [rbx+0x24]
   140002974:	mov    BYTE PTR [rdx+rax*1],cl
   140002977:	mov    edx,DWORD PTR [rbx+0x24]
   14000297a:	add    edx,0x1
   14000297d:	mov    DWORD PTR [rbx+0x24],edx
   140002980:	cmp    rsi,rdi
   140002983:	je     0x1400029c1
   140002985:	mov    eax,DWORD PTR [rbx+0x8]
   140002988:	add    rsi,0x1
   14000298c:	test   ah,0x40
   14000298f:	jne    0x140002999
   140002991:	mov    edx,DWORD PTR [rbx+0x24]
   140002994:	cmp    DWORD PTR [rbx+0x28],edx
   140002997:	jle    0x14000297a
   140002999:	movsx  ecx,BYTE PTR [rsi-0x1]
   14000299d:	mov    rdx,QWORD PTR [rbx]
   1400029a0:	test   ah,0x20
   1400029a3:	je     0x140002970
   1400029a5:	call   0x140007a30
   1400029aa:	mov    edx,DWORD PTR [rbx+0x24]
   1400029ad:	jmp    0x14000297a
   1400029af:	nop
   1400029b0:	movsxd rax,DWORD PTR [rbx+0x24]
   1400029b4:	mov    BYTE PTR [rdx+rax*1],0x20
   1400029b8:	mov    edx,DWORD PTR [rbx+0x24]
   1400029bb:	add    edx,0x1
   1400029be:	mov    DWORD PTR [rbx+0x24],edx
   1400029c1:	mov    eax,DWORD PTR [rbx+0xc]
   1400029c4:	lea    edx,[rax-0x1]
   1400029c7:	mov    DWORD PTR [rbx+0xc],edx
   1400029ca:	test   eax,eax
   1400029cc:	jle    0x1400029fc
   1400029ce:	mov    eax,DWORD PTR [rbx+0x8]
   1400029d1:	test   ah,0x40
   1400029d4:	jne    0x1400029de
   1400029d6:	mov    edx,DWORD PTR [rbx+0x24]
   1400029d9:	cmp    DWORD PTR [rbx+0x28],edx
   1400029dc:	jle    0x1400029bb
   1400029de:	mov    rdx,QWORD PTR [rbx]
   1400029e1:	test   ah,0x20
   1400029e4:	je     0x1400029b0
   1400029e6:	mov    ecx,0x20
   1400029eb:	call   0x140007a30
   1400029f0:	mov    edx,DWORD PTR [rbx+0x24]
   1400029f3:	jmp    0x1400029bb
   1400029f5:	mov    DWORD PTR [rbx+0xc],0xfffffffe
   1400029fc:	add    rsp,0x28
   140002a00:	pop    rbx
   140002a01:	pop    rsi
   140002a02:	pop    rdi
   140002a03:	pop    rbp
   140002a04:	ret
   140002a05:	nop    DWORD PTR [rax]
   140002a08:	sub    eax,edi
   140002a0a:	mov    DWORD PTR [r8+0xc],eax
   140002a0e:	mov    edx,eax
   140002a10:	mov    eax,DWORD PTR [r8+0x8]
   140002a14:	test   ah,0x4
   140002a17:	jne    0x140002a50
   140002a19:	lea    eax,[rdx-0x1]
   140002a1c:	mov    DWORD PTR [r8+0xc],eax
   140002a20:	mov    rdx,rbx
   140002a23:	mov    ecx,0x20
   140002a28:	call   0x140002720
   140002a2d:	mov    eax,DWORD PTR [rbx+0xc]
   140002a30:	lea    edx,[rax-0x1]
   140002a33:	mov    DWORD PTR [rbx+0xc],edx
   140002a36:	test   eax,eax
   140002a38:	jne    0x140002a20
   140002a3a:	lea    edx,[rdi-0x1]
   140002a3d:	test   edi,edi
   140002a3f:	jne    0x140002964
   140002a45:	jmp    0x1400029c1
   140002a4a:	nop    WORD PTR [rax+rax*1+0x0]
   140002a50:	lea    edx,[rdi-0x1]
   140002a53:	test   edi,edi
   140002a55:	jne    0x140002967
   140002a5b:	sub    DWORD PTR [rbx+0xc],0x1
   140002a5f:	jmp    0x1400029d1
   140002a64:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002a6f:	nop
   140002a70:	push   rbp
   140002a71:	push   rsi
   140002a72:	push   rbx
   140002a73:	sub    rsp,0x20
   140002a77:	lea    rbp,[rsp+0x20]
   140002a7c:	lea    rax,[rip+0x68ed]        # 0x140009370
   140002a83:	mov    rbx,rcx
   140002a86:	test   rcx,rcx
   140002a89:	mov    rsi,rdx
   140002a8c:	movsxd rdx,DWORD PTR [rdx+0x10]
   140002a90:	cmove  rbx,rax
   140002a94:	mov    rcx,rbx
   140002a97:	test   edx,edx
   140002a99:	js     0x140002ab8
   140002a9b:	call   0x1400072b0
   140002aa0:	mov    r8,rsi
   140002aa3:	mov    edx,eax
   140002aa5:	mov    rcx,rbx
   140002aa8:	add    rsp,0x20
   140002aac:	pop    rbx
   140002aad:	pop    rsi
   140002aae:	pop    rbp
   140002aaf:	jmp    0x140002920
   140002ab4:	nop    DWORD PTR [rax+0x0]
   140002ab8:	call   0x140007a78
   140002abd:	jmp    0x140002aa0
   140002abf:	nop
   140002ac0:	push   rbp
   140002ac1:	mov    rbp,rsp
   140002ac4:	sub    rsp,0x30
   140002ac8:	mov    r10d,DWORD PTR [r8+0x8]
   140002acc:	mov    DWORD PTR [r8+0x10],0xffffffff
   140002ad4:	test   ecx,ecx
   140002ad6:	jne    0x140002b30
   140002ad8:	mov    eax,0x2b
   140002add:	test   r10d,0x100
   140002ae4:	jne    0x140002b35
   140002ae6:	test   r10b,0x40
   140002aea:	je     0x140002b48
   140002aec:	mov    eax,0x20
   140002af1:	lea    r9,[rbp-0x3]
   140002af5:	lea    r11,[rbp-0x4]
   140002af9:	mov    BYTE PTR [rbp-0x4],al
   140002afc:	and    r10d,0x20
   140002b00:	xor    ecx,ecx
   140002b02:	movzx  eax,BYTE PTR [rdx+rcx*1]
   140002b06:	and    eax,0xffffffdf
   140002b09:	or     eax,r10d
   140002b0c:	mov    BYTE PTR [r9+rcx*1],al
   140002b10:	add    rcx,0x1
   140002b14:	cmp    rcx,0x3
   140002b18:	jne    0x140002b02
   140002b1a:	lea    rdx,[r9+0x3]
   140002b1e:	mov    rcx,r11
   140002b21:	sub    edx,r11d
   140002b24:	call   0x140002920
   140002b29:	nop
   140002b2a:	add    rsp,0x30
   140002b2e:	pop    rbp
   140002b2f:	ret
   140002b30:	mov    eax,0x2d
   140002b35:	mov    BYTE PTR [rbp-0x4],al
   140002b38:	lea    r9,[rbp-0x3]
   140002b3c:	lea    r11,[rbp-0x4]
   140002b40:	jmp    0x140002afc
   140002b42:	nop    WORD PTR [rax+rax*1+0x0]
   140002b48:	lea    r11,[rbp-0x4]
   140002b4c:	mov    r9,r11
   140002b4f:	jmp    0x140002afc
   140002b51:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002b5c:	nop    DWORD PTR [rax+0x0]
   140002b60:	push   rbp
   140002b61:	push   r15
   140002b63:	push   r14
   140002b65:	push   r13
   140002b67:	push   r12
   140002b69:	push   rdi
   140002b6a:	push   rsi
   140002b6b:	push   rbx
   140002b6c:	sub    rsp,0x38
   140002b70:	lea    rbp,[rsp+0x30]
   140002b75:	mov    r13d,ecx
   140002b78:	mov    rbx,r8
   140002b7b:	cmp    ecx,0x6f
   140002b7e:	je     0x140002e50
   140002b84:	mov    r14d,DWORD PTR [r8+0x10]
   140002b88:	xor    eax,eax
   140002b8a:	mov    edi,DWORD PTR [r8+0x8]
   140002b8e:	test   r14d,r14d
   140002b91:	cmovns eax,r14d
   140002b95:	add    eax,0x12
   140002b98:	test   edi,0x1000
   140002b9e:	je     0x140002c88
   140002ba4:	mov    ecx,0x4
   140002ba9:	cmp    WORD PTR [rbx+0x20],0x0
   140002bae:	je     0x140002bc4
   140002bb0:	mov    r8d,eax
   140002bb3:	mov    r9d,0xaaaaaaab
   140002bb9:	imul   r8,r9
   140002bbd:	shr    r8,0x21
   140002bc1:	add    eax,r8d
   140002bc4:	mov    r15d,DWORD PTR [rbx+0xc]
   140002bc8:	cmp    r15d,eax
   140002bcb:	cmovge eax,r15d
   140002bcf:	cdqe
   140002bd1:	add    rax,0xf
   140002bd5:	and    rax,0xfffffffffffffff0
   140002bd9:	call   0x1400025a0
   140002bde:	xor    r9d,r9d
   140002be1:	sub    rsp,rax
   140002be4:	cmp    r13d,0x6f
   140002be8:	setne  r9b
   140002bec:	lea    r12,[rsp+0x20]
   140002bf1:	lea    r9d,[r9*8+0x7]
   140002bf9:	test   rdx,rdx
   140002bfc:	jne    0x140002cbe
   140002c02:	nop    WORD PTR [rax+rax*1+0x0]
   140002c08:	and    edi,0xfffff7ff
   140002c0e:	mov    DWORD PTR [rbx+0x8],edi
   140002c11:	test   r14d,r14d
   140002c14:	jle    0x140002ee0
   140002c1a:	lea    edi,[r14-0x1]
   140002c1e:	mov    rsi,r12
   140002c21:	add    edi,0x1
   140002c24:	mov    rcx,rsi
   140002c27:	mov    edx,0x30
   140002c2c:	movsxd rdi,edi
   140002c2f:	mov    r8,rdi
   140002c32:	add    rsi,rdi
   140002c35:	call   0x140007a60
   140002c3a:	cmp    rsi,r12
   140002c3d:	je     0x140002ee3
   140002c43:	mov    rax,rsi
   140002c46:	sub    rax,r12
   140002c49:	mov    edx,eax
   140002c4b:	cmp    eax,r15d
   140002c4e:	jl     0x140002f07
   140002c54:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002c5b:	cmp    r13d,0x6f
   140002c5f:	jne    0x140003004
   140002c65:	cmp    r12,rsi
   140002c68:	jae    0x140002e3e
   140002c6e:	mov    edi,DWORD PTR [rbx+0x8]
   140002c71:	mov    r13d,0xfffffffe
   140002c77:	mov    r15d,0xffffffff
   140002c7d:	jmp    0x140002db0
   140002c82:	nop    WORD PTR [rax+rax*1+0x0]
   140002c88:	mov    r15d,DWORD PTR [rbx+0xc]
   140002c8c:	cmp    r15d,eax
   140002c8f:	cmovge eax,r15d
   140002c93:	cdqe
   140002c95:	add    rax,0xf
   140002c99:	and    rax,0xfffffffffffffff0
   140002c9d:	call   0x1400025a0
   140002ca2:	mov    ecx,0x4
   140002ca7:	mov    r9d,0xf
   140002cad:	sub    rsp,rax
   140002cb0:	lea    r12,[rsp+0x20]
   140002cb5:	test   rdx,rdx
   140002cb8:	je     0x140002c08
   140002cbe:	mov    QWORD PTR [rbp-0x8],r12
   140002cc2:	mov    r10d,r13d
   140002cc5:	mov    rsi,r12
   140002cc8:	and    r10d,0x20
   140002ccc:	nop    DWORD PTR [rax+0x0]
   140002cd0:	mov    eax,r9d
   140002cd3:	mov    r11,rsi
   140002cd6:	add    rsi,0x1
   140002cda:	and    eax,edx
   140002cdc:	lea    r8d,[rax+0x30]
   140002ce0:	add    eax,0x37
   140002ce3:	or     eax,r10d
   140002ce6:	mov    r12d,r8d
   140002ce9:	cmp    r8b,0x39
   140002ced:	cmovbe eax,r12d
   140002cf1:	shr    rdx,cl
   140002cf4:	mov    BYTE PTR [rsi-0x1],al
   140002cf7:	test   rdx,rdx
   140002cfa:	jne    0x140002cd0
   140002cfc:	mov    r12,QWORD PTR [rbp-0x8]
   140002d00:	cmp    rsi,r12
   140002d03:	je     0x140002c08
   140002d09:	test   r14d,r14d
   140002d0c:	jle    0x140002e80
   140002d12:	mov    rdx,rsi
   140002d15:	mov    eax,r14d
   140002d18:	sub    rdx,r12
   140002d1b:	sub    eax,edx
   140002d1d:	test   eax,eax
   140002d1f:	jg     0x140002ff0
   140002d25:	cmp    r13d,0x6f
   140002d29:	je     0x140002f58
   140002d2f:	cmp    edx,r15d
   140002d32:	jge    0x140002fc0
   140002d38:	sub    r15d,edx
   140002d3b:	mov    DWORD PTR [rbx+0xc],r15d
   140002d3f:	test   edi,0x800
   140002d45:	jne    0x140002f90
   140002d4b:	test   r14d,r14d
   140002d4e:	js     0x140003009
   140002d54:	lea    r13d,[r15-0x1]
   140002d58:	test   edi,0x400
   140002d5e:	jne    0x140002f80
   140002d64:	mov    r15d,r13d
   140002d67:	nop    WORD PTR [rax+rax*1+0x0]
   140002d70:	mov    rdx,rbx
   140002d73:	mov    ecx,0x20
   140002d78:	call   0x140002720
   140002d7d:	sub    r15d,0x1
   140002d81:	jae    0x140002d70
   140002d83:	mov    r13d,0xfffffffe
   140002d89:	cmp    r12,rsi
   140002d8c:	jb     0x140002dad
   140002d8e:	jmp    0x140002e3e
   140002d93:	nop    DWORD PTR [rax+rax*1+0x0]
   140002d98:	movsxd rax,DWORD PTR [rbx+0x24]
   140002d9c:	mov    BYTE PTR [rdx+rax*1],cl
   140002d9f:	mov    eax,DWORD PTR [rbx+0x24]
   140002da2:	add    eax,0x1
   140002da5:	mov    DWORD PTR [rbx+0x24],eax
   140002da8:	cmp    r12,rsi
   140002dab:	jae    0x140002de5
   140002dad:	mov    edi,DWORD PTR [rbx+0x8]
   140002db0:	sub    rsi,0x1
   140002db4:	test   edi,0x4000
   140002dba:	jne    0x140002dc4
   140002dbc:	mov    eax,DWORD PTR [rbx+0x24]
   140002dbf:	cmp    DWORD PTR [rbx+0x28],eax
   140002dc2:	jle    0x140002da2
   140002dc4:	and    edi,0x2000
   140002dca:	movsx  ecx,BYTE PTR [rsi]
   140002dcd:	mov    rdx,QWORD PTR [rbx]
   140002dd0:	je     0x140002d98
   140002dd2:	call   0x140007a30
   140002dd7:	mov    eax,DWORD PTR [rbx+0x24]
   140002dda:	add    eax,0x1
   140002ddd:	mov    DWORD PTR [rbx+0x24],eax
   140002de0:	cmp    r12,rsi
   140002de3:	jb     0x140002dad
   140002de5:	test   r15d,r15d
   140002de8:	jg     0x140002e07
   140002dea:	jmp    0x140002e3e
   140002dec:	nop    DWORD PTR [rax+0x0]
   140002df0:	movsxd rax,DWORD PTR [rbx+0x24]
   140002df4:	mov    BYTE PTR [rdx+rax*1],0x20
   140002df8:	mov    eax,DWORD PTR [rbx+0x24]
   140002dfb:	add    eax,0x1
   140002dfe:	mov    DWORD PTR [rbx+0x24],eax
   140002e01:	sub    r13d,0x1
   140002e05:	jb     0x140002e3e
   140002e07:	mov    edi,DWORD PTR [rbx+0x8]
   140002e0a:	test   edi,0x4000
   140002e10:	jne    0x140002e1a
   140002e12:	mov    eax,DWORD PTR [rbx+0x24]
   140002e15:	cmp    DWORD PTR [rbx+0x28],eax
   140002e18:	jle    0x140002dfb
   140002e1a:	and    edi,0x2000
   140002e20:	mov    rdx,QWORD PTR [rbx]
   140002e23:	je     0x140002df0
   140002e25:	mov    ecx,0x20
   140002e2a:	call   0x140007a30
   140002e2f:	mov    eax,DWORD PTR [rbx+0x24]
   140002e32:	add    eax,0x1
   140002e35:	mov    DWORD PTR [rbx+0x24],eax
   140002e38:	sub    r13d,0x1
   140002e3c:	jae    0x140002e07
   140002e3e:	lea    rsp,[rbp+0x8]
   140002e42:	pop    rbx
   140002e43:	pop    rsi
   140002e44:	pop    rdi
   140002e45:	pop    r12
   140002e47:	pop    r13
   140002e49:	pop    r14
   140002e4b:	pop    r15
   140002e4d:	pop    rbp
   140002e4e:	ret
   140002e4f:	nop
   140002e50:	mov    r14d,DWORD PTR [r8+0x10]
   140002e54:	xor    eax,eax
   140002e56:	mov    edi,DWORD PTR [r8+0x8]
   140002e5a:	test   r14d,r14d
   140002e5d:	cmovns eax,r14d
   140002e61:	add    eax,0x18
   140002e64:	test   edi,0x1000
   140002e6a:	je     0x140002ea8
   140002e6c:	mov    ecx,0x3
   140002e71:	jmp    0x140002ba9
   140002e76:	cs nop WORD PTR [rax+rax*1+0x0]
   140002e80:	cmp    r13d,0x6f
   140002e84:	je     0x140002f58
   140002e8a:	mov    rax,rsi
   140002e8d:	sub    rax,r12
   140002e90:	cmp    eax,r15d
   140002e93:	jge    0x140002fc0
   140002e99:	sub    r15d,eax
   140002e9c:	mov    DWORD PTR [rbx+0xc],r15d
   140002ea0:	jmp    0x140002d3f
   140002ea5:	nop    DWORD PTR [rax]
   140002ea8:	mov    r15d,DWORD PTR [rbx+0xc]
   140002eac:	cmp    r15d,eax
   140002eaf:	cmovge eax,r15d
   140002eb3:	cdqe
   140002eb5:	add    rax,0xf
   140002eb9:	and    rax,0xfffffffffffffff0
   140002ebd:	call   0x1400025a0
   140002ec2:	mov    ecx,0x3
   140002ec7:	mov    r9d,0x7
   140002ecd:	sub    rsp,rax
   140002ed0:	lea    r12,[rsp+0x20]
   140002ed5:	jmp    0x140002cb5
   140002eda:	nop    WORD PTR [rax+rax*1+0x0]
   140002ee0:	mov    rsi,r12
   140002ee3:	test   r14d,r14d
   140002ee6:	je     0x140002c43
   140002eec:	lea    rdx,[rsi+0x1]
   140002ef0:	mov    BYTE PTR [rsi],0x30
   140002ef3:	mov    rax,rdx
   140002ef6:	mov    rsi,rdx
   140002ef9:	sub    rax,r12
   140002efc:	mov    edx,eax
   140002efe:	cmp    eax,r15d
   140002f01:	jge    0x140002c54
   140002f07:	mov    edi,DWORD PTR [rbx+0x8]
   140002f0a:	sub    r15d,edx
   140002f0d:	mov    DWORD PTR [rbx+0xc],r15d
   140002f11:	cmp    r13d,0x6f
   140002f15:	jne    0x140002d3f
   140002f1b:	test   r14d,r14d
   140002f1e:	jns    0x140002d54
   140002f24:	mov    eax,edi
   140002f26:	and    eax,0x600
   140002f2b:	cmp    eax,0x200
   140002f30:	jne    0x140002d54
   140002f36:	movsxd r15,r15d
   140002f39:	mov    edx,0x30
   140002f3e:	mov    rcx,rsi
   140002f41:	mov    r8,r15
   140002f44:	call   0x140007a60
   140002f49:	lea    rax,[rsi+r15*1]
   140002f4d:	mov    r15d,0xffffffff
   140002f53:	jmp    0x140002fa8
   140002f55:	nop    DWORD PTR [rax]
   140002f58:	test   edi,0x800
   140002f5e:	jne    0x140002ff8
   140002f64:	mov    rax,rsi
   140002f67:	sub    rax,r12
   140002f6a:	mov    edx,eax
   140002f6c:	cmp    r15d,eax
   140002f6f:	jg     0x140002f0a
   140002f71:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002f78:	jmp    0x140002c65
   140002f7d:	nop    DWORD PTR [rax]
   140002f80:	cmp    r12,rsi
   140002f83:	jb     0x140002db0
   140002f89:	jmp    0x140002e0a
   140002f8e:	xchg   ax,ax
   140002f90:	sub    r15d,0x2
   140002f94:	test   r15d,r15d
   140002f97:	jg     0x140003054
   140002f9d:	mov    BYTE PTR [rsi],r13b
   140002fa0:	lea    rax,[rsi+0x2]
   140002fa4:	mov    BYTE PTR [rsi+0x1],0x30
   140002fa8:	cmp    r12,rax
   140002fab:	jae    0x140002e3e
   140002fb1:	mov    edi,DWORD PTR [rbx+0x8]
   140002fb4:	lea    r13d,[r15-0x1]
   140002fb8:	mov    rsi,rax
   140002fbb:	jmp    0x140002db0
   140002fc0:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002fc7:	and    edi,0x800
   140002fcd:	mov    rax,rsi
   140002fd0:	mov    r15d,0xffffffff
   140002fd6:	je     0x140002fa8
   140002fd8:	mov    BYTE PTR [rsi],r13b
   140002fdb:	lea    rax,[rsi+0x2]
   140002fdf:	mov    r15d,0xffffffff
   140002fe5:	mov    BYTE PTR [rsi+0x1],0x30
   140002fe9:	jmp    0x140002fa8
   140002feb:	nop    DWORD PTR [rax+rax*1+0x0]
   140002ff0:	lea    edi,[rax-0x1]
   140002ff3:	jmp    0x140002c21
   140002ff8:	mov    BYTE PTR [rsi],0x30
   140002ffb:	lea    rsi,[r11+0x2]
   140002fff:	jmp    0x140002c3a
   140003004:	mov    edi,DWORD PTR [rbx+0x8]
   140003007:	jmp    0x140002fc7
   140003009:	mov    eax,edi
   14000300b:	and    eax,0x600
   140003010:	cmp    eax,0x200
   140003015:	jne    0x140002d54
   14000301b:	movsxd r15,r15d
   14000301e:	mov    edx,0x30
   140003023:	mov    rcx,rsi
   140003026:	mov    r8,r15
   140003029:	call   0x140007a60
   14000302e:	and    edi,0x800
   140003034:	lea    rax,[rsi+r15*1]
   140003038:	je     0x140002f4d
   14000303e:	mov    BYTE PTR [rax],r13b
   140003041:	mov    r15d,0xffffffff
   140003047:	add    rax,0x2
   14000304b:	mov    BYTE PTR [rax-0x1],0x30
   14000304f:	jmp    0x140002fa8
   140003054:	test   r14d,r14d
   140003057:	js     0x140003069
   140003059:	mov    BYTE PTR [rsi],r13b
   14000305c:	add    rsi,0x2
   140003060:	mov    BYTE PTR [rsi-0x1],0x30
   140003064:	jmp    0x140002d54
   140003069:	mov    eax,edi
   14000306b:	and    eax,0x600
   140003070:	cmp    eax,0x200
   140003075:	jne    0x140003059
   140003077:	jmp    0x14000301b
   140003079:	nop    DWORD PTR [rax+0x0]
   140003080:	push   rbp
   140003081:	push   r15
   140003083:	push   r14
   140003085:	push   r13
   140003087:	push   r12
   140003089:	push   rdi
   14000308a:	push   rsi
   14000308b:	push   rbx
   14000308c:	sub    rsp,0x28
   140003090:	lea    rbp,[rsp+0x20]
   140003095:	xor    eax,eax
   140003097:	mov    r14d,DWORD PTR [rdx+0x10]
   14000309b:	mov    edi,DWORD PTR [rdx+0x8]
   14000309e:	test   r14d,r14d
   1400030a1:	cmovns eax,r14d
   1400030a5:	mov    rbx,rdx
   1400030a8:	add    eax,0x17
   1400030ab:	test   edi,0x1000
   1400030b1:	je     0x1400030be
   1400030b3:	cmp    WORD PTR [rdx+0x20],0x0
   1400030b8:	jne    0x140003320
   1400030be:	mov    esi,DWORD PTR [rbx+0xc]
   1400030c1:	cmp    esi,eax
   1400030c3:	cmovge eax,esi
   1400030c6:	cdqe
   1400030c8:	add    rax,0xf
   1400030cc:	and    rax,0xfffffffffffffff0
   1400030d0:	call   0x1400025a0
   1400030d5:	sub    rsp,rax
   1400030d8:	lea    r12,[rsp+0x20]
   1400030dd:	test   dil,0x80
   1400030e1:	je     0x1400030f3
   1400030e3:	test   rcx,rcx
   1400030e6:	js     0x140003360
   1400030ec:	and    dil,0x7f
   1400030f0:	mov    DWORD PTR [rbx+0x8],edi
   1400030f3:	test   rcx,rcx
   1400030f6:	je     0x140003410
   1400030fc:	movabs r11,0x8000000000000003
   140003106:	mov    r10d,edi
   140003109:	mov    r8,r12
   14000310c:	movabs r9,0xcccccccccccccccd
   140003116:	and    r10d,0x1000
   14000311d:	nop    DWORD PTR [rax]
   140003120:	cmp    r12,r8
   140003123:	je     0x140003150
   140003125:	test   r10d,r10d
   140003128:	je     0x140003150
   14000312a:	cmp    WORD PTR [rbx+0x20],0x0
   14000312f:	je     0x140003150
   140003131:	mov    rax,r8
   140003134:	sub    rax,r12
   140003137:	and    rax,r11
   14000313a:	cmp    rax,0x3
   14000313e:	jne    0x140003150
   140003140:	mov    BYTE PTR [r8],0x2c
   140003144:	add    r8,0x1
   140003148:	nop    DWORD PTR [rax+rax*1+0x0]
   140003150:	mov    rax,rcx
   140003153:	lea    r13,[r8+0x1]
   140003157:	mul    r9
   14000315a:	mov    rax,rcx
   14000315d:	shr    rdx,0x3
   140003161:	lea    r15,[rdx+rdx*4]
   140003165:	add    r15,r15
   140003168:	sub    rax,r15
   14000316b:	add    eax,0x30
   14000316e:	mov    BYTE PTR [r8],al
   140003171:	cmp    rcx,0x9
   140003175:	jbe    0x140003180
   140003177:	mov    rcx,rdx
   14000317a:	mov    r8,r13
   14000317d:	jmp    0x140003120
   14000317f:	nop
   140003180:	test   r14d,r14d
   140003183:	jle    0x1400031b0
   140003185:	mov    rax,r13
   140003188:	mov    r8d,r14d
   14000318b:	sub    rax,r12
   14000318e:	sub    r8d,eax
   140003191:	test   r8d,r8d
   140003194:	jle    0x140003340
   14000319a:	movsxd r15,r8d
   14000319d:	mov    rcx,r13
   1400031a0:	mov    edx,0x30
   1400031a5:	mov    r8,r15
   1400031a8:	add    r13,r15
   1400031ab:	call   0x140007a60
   1400031b0:	cmp    r12,r13
   1400031b3:	sete   al
   1400031b6:	test   r14d,r14d
   1400031b9:	je     0x1400031c3
   1400031bb:	test   al,al
   1400031bd:	jne    0x140003402
   1400031c3:	test   esi,esi
   1400031c5:	jle    0x140003200
   1400031c7:	mov    rax,r13
   1400031ca:	sub    rax,r12
   1400031cd:	sub    esi,eax
   1400031cf:	mov    DWORD PTR [rbx+0xc],esi
   1400031d2:	test   esi,esi
   1400031d4:	jle    0x140003200
   1400031d6:	test   edi,0x1c0
   1400031dc:	jne    0x140003370
   1400031e2:	test   r14d,r14d
   1400031e5:	js     0x14000337f
   1400031eb:	test   edi,0x400
   1400031f1:	je     0x1400033c8
   1400031f7:	nop    WORD PTR [rax+rax*1+0x0]
   140003200:	test   dil,0x80
   140003204:	je     0x1400032e0
   14000320a:	mov    BYTE PTR [r13+0x0],0x2d
   14000320f:	lea    rsi,[r13+0x1]
   140003213:	cmp    r12,rsi
   140003216:	jb     0x140003238
   140003218:	jmp    0x14000326d
   14000321a:	nop    WORD PTR [rax+rax*1+0x0]
   140003220:	movsxd rax,DWORD PTR [rbx+0x24]
   140003224:	mov    BYTE PTR [rdx+rax*1],cl
   140003227:	mov    eax,DWORD PTR [rbx+0x24]
   14000322a:	add    eax,0x1
   14000322d:	mov    DWORD PTR [rbx+0x24],eax
   140003230:	cmp    r12,rsi
   140003233:	je     0x14000326d
   140003235:	mov    edi,DWORD PTR [rbx+0x8]
   140003238:	sub    rsi,0x1
   14000323c:	test   edi,0x4000
   140003242:	jne    0x14000324c
   140003244:	mov    eax,DWORD PTR [rbx+0x24]
   140003247:	cmp    DWORD PTR [rbx+0x28],eax
   14000324a:	jle    0x14000322a
   14000324c:	and    edi,0x2000
   140003252:	movsx  ecx,BYTE PTR [rsi]
   140003255:	mov    rdx,QWORD PTR [rbx]
   140003258:	je     0x140003220
   14000325a:	call   0x140007a30
   14000325f:	mov    eax,DWORD PTR [rbx+0x24]
   140003262:	add    eax,0x1
   140003265:	mov    DWORD PTR [rbx+0x24],eax
   140003268:	cmp    r12,rsi
   14000326b:	jne    0x140003235
   14000326d:	mov    eax,DWORD PTR [rbx+0xc]
   140003270:	jmp    0x14000328c
   140003272:	nop    WORD PTR [rax+rax*1+0x0]
   140003278:	movsxd rax,DWORD PTR [rbx+0x24]
   14000327c:	mov    BYTE PTR [rdx+rax*1],0x20
   140003280:	mov    edx,DWORD PTR [rbx+0x24]
   140003283:	mov    eax,DWORD PTR [rbx+0xc]
   140003286:	add    edx,0x1
   140003289:	mov    DWORD PTR [rbx+0x24],edx
   14000328c:	mov    edx,eax
   14000328e:	sub    eax,0x1
   140003291:	mov    DWORD PTR [rbx+0xc],eax
   140003294:	test   edx,edx
   140003296:	jle    0x1400032c8
   140003298:	mov    ecx,DWORD PTR [rbx+0x8]
   14000329b:	test   ch,0x40
   14000329e:	jne    0x1400032a8
   1400032a0:	mov    edx,DWORD PTR [rbx+0x24]
   1400032a3:	cmp    DWORD PTR [rbx+0x28],edx
   1400032a6:	jle    0x140003286
   1400032a8:	mov    rdx,QWORD PTR [rbx]
   1400032ab:	and    ch,0x20
   1400032ae:	je     0x140003278
   1400032b0:	mov    ecx,0x20
   1400032b5:	call   0x140007a30
   1400032ba:	mov    edx,DWORD PTR [rbx+0x24]
   1400032bd:	mov    eax,DWORD PTR [rbx+0xc]
   1400032c0:	jmp    0x140003286
   1400032c2:	nop    WORD PTR [rax+rax*1+0x0]
   1400032c8:	lea    rsp,[rbp+0x8]
   1400032cc:	pop    rbx
   1400032cd:	pop    rsi
   1400032ce:	pop    rdi
   1400032cf:	pop    r12
   1400032d1:	pop    r13
   1400032d3:	pop    r14
   1400032d5:	pop    r15
   1400032d7:	pop    rbp
   1400032d8:	ret
   1400032d9:	nop    DWORD PTR [rax+0x0]
   1400032e0:	test   edi,0x100
   1400032e6:	je     0x140003300
   1400032e8:	mov    BYTE PTR [r13+0x0],0x2b
   1400032ed:	lea    rsi,[r13+0x1]
   1400032f1:	jmp    0x140003213
   1400032f6:	cs nop WORD PTR [rax+rax*1+0x0]
   140003300:	mov    rsi,r13
   140003303:	test   dil,0x40
   140003307:	je     0x140003213
   14000330d:	mov    BYTE PTR [r13+0x0],0x20
   140003312:	add    rsi,0x1
   140003316:	jmp    0x140003213
   14000331b:	nop    DWORD PTR [rax+rax*1+0x0]
   140003320:	mov    edx,eax
   140003322:	mov    r8d,0xaaaaaaab
   140003328:	imul   rdx,r8
   14000332c:	shr    rdx,0x21
   140003330:	add    eax,edx
   140003332:	jmp    0x1400030be
   140003337:	nop    WORD PTR [rax+rax*1+0x0]
   140003340:	cmp    r12,r13
   140003343:	jne    0x1400031c3
   140003349:	mov    rax,r12
   14000334c:	mov    BYTE PTR [rax],0x30
   14000334f:	lea    r13,[rax+0x1]
   140003353:	jmp    0x1400031c3
   140003358:	nop    DWORD PTR [rax+rax*1+0x0]
   140003360:	neg    rcx
   140003363:	jmp    0x1400030fc
   140003368:	nop    DWORD PTR [rax+rax*1+0x0]
   140003370:	sub    esi,0x1
   140003373:	mov    DWORD PTR [rbx+0xc],esi
   140003376:	test   r14d,r14d
   140003379:	jns    0x1400031eb
   14000337f:	mov    eax,edi
   140003381:	and    eax,0x600
   140003386:	cmp    eax,0x200
   14000338b:	jne    0x1400031eb
   140003391:	mov    eax,DWORD PTR [rbx+0xc]
   140003394:	lea    edx,[rax-0x1]
   140003397:	mov    DWORD PTR [rbx+0xc],edx
   14000339a:	test   eax,eax
   14000339c:	jle    0x140003200
   1400033a2:	movsxd rsi,eax
   1400033a5:	mov    rcx,r13
   1400033a8:	mov    edx,0x30
   1400033ad:	mov    r8,rsi
   1400033b0:	add    r13,rsi
   1400033b3:	call   0x140007a60
   1400033b8:	mov    DWORD PTR [rbx+0xc],0xffffffff
   1400033bf:	jmp    0x140003200
   1400033c4:	nop    DWORD PTR [rax+0x0]
   1400033c8:	mov    eax,DWORD PTR [rbx+0xc]
   1400033cb:	lea    edx,[rax-0x1]
   1400033ce:	mov    DWORD PTR [rbx+0xc],edx
   1400033d1:	test   eax,eax
   1400033d3:	jle    0x140003200
   1400033d9:	nop    DWORD PTR [rax+0x0]
   1400033e0:	mov    rdx,rbx
   1400033e3:	mov    ecx,0x20
   1400033e8:	call   0x140002720
   1400033ed:	mov    eax,DWORD PTR [rbx+0xc]
   1400033f0:	lea    edx,[rax-0x1]
   1400033f3:	mov    DWORD PTR [rbx+0xc],edx
   1400033f6:	test   eax,eax
   1400033f8:	jg     0x1400033e0
   1400033fa:	mov    edi,DWORD PTR [rbx+0x8]
   1400033fd:	jmp    0x140003200
   140003402:	mov    rax,r13
   140003405:	jmp    0x14000334c
   14000340a:	nop    WORD PTR [rax+rax*1+0x0]
   140003410:	mov    r13,r12
   140003413:	mov    r8d,r14d
   140003416:	mov    eax,0x1
   14000341b:	test   r14d,r14d
   14000341e:	jg     0x14000319a
   140003424:	jmp    0x1400031b6
   140003429:	nop    DWORD PTR [rax+0x0]
   140003430:	push   rbp
   140003431:	push   r12
   140003433:	push   rdi
   140003434:	push   rsi
   140003435:	push   rbx
   140003436:	sub    rsp,0x30
   14000343a:	lea    rbp,[rsp+0x30]
   14000343f:	cmp    DWORD PTR [rcx+0x14],0xfffffffd
   140003443:	mov    rbx,rcx
   140003446:	je     0x140003520
   14000344c:	movzx  edx,WORD PTR [rcx+0x18]
   140003450:	test   dx,dx
   140003453:	je     0x140003500
   140003459:	movsxd rax,DWORD PTR [rbx+0x14]
   14000345d:	mov    rdi,rsp
   140003460:	add    rax,0xf
   140003464:	and    rax,0xfffffffffffffff0
   140003468:	call   0x1400025a0
   14000346d:	sub    rsp,rax
   140003470:	lea    r8,[rbp-0x8]
   140003474:	mov    QWORD PTR [rbp-0x8],0x0
   14000347c:	lea    rsi,[rsp+0x20]
   140003481:	mov    rcx,rsi
   140003484:	call   0x1400074f0
   140003489:	test   eax,eax
   14000348b:	jle    0x140003560
   140003491:	sub    eax,0x1
   140003494:	lea    r12,[rsi+rax*1+0x1]
   140003499:	jmp    0x1400034b5
   14000349b:	nop    DWORD PTR [rax+rax*1+0x0]
   1400034a0:	movsxd rdx,DWORD PTR [rbx+0x24]
   1400034a4:	mov    BYTE PTR [rax+rdx*1],cl
   1400034a7:	mov    eax,DWORD PTR [rbx+0x24]
   1400034aa:	add    eax,0x1
   1400034ad:	mov    DWORD PTR [rbx+0x24],eax
   1400034b0:	cmp    r12,rsi
   1400034b3:	je     0x1400034eb
   1400034b5:	mov    edx,DWORD PTR [rbx+0x8]
   1400034b8:	add    rsi,0x1
   1400034bc:	test   dh,0x40
   1400034bf:	jne    0x1400034c9
   1400034c1:	mov    eax,DWORD PTR [rbx+0x24]
   1400034c4:	cmp    DWORD PTR [rbx+0x28],eax
   1400034c7:	jle    0x1400034aa
   1400034c9:	movsx  ecx,BYTE PTR [rsi-0x1]
   1400034cd:	mov    rax,QWORD PTR [rbx]
   1400034d0:	and    dh,0x20
   1400034d3:	je     0x1400034a0
   1400034d5:	mov    rdx,rax
   1400034d8:	call   0x140007a30
   1400034dd:	mov    eax,DWORD PTR [rbx+0x24]
   1400034e0:	add    eax,0x1
   1400034e3:	mov    DWORD PTR [rbx+0x24],eax
   1400034e6:	cmp    r12,rsi
   1400034e9:	jne    0x1400034b5
   1400034eb:	mov    rsp,rdi
   1400034ee:	mov    rsp,rbp
   1400034f1:	pop    rbx
   1400034f2:	pop    rsi
   1400034f3:	pop    rdi
   1400034f4:	pop    r12
   1400034f6:	pop    rbp
   1400034f7:	ret
   1400034f8:	nop    DWORD PTR [rax+rax*1+0x0]
   140003500:	mov    rdx,rbx
   140003503:	mov    ecx,0x2e
   140003508:	call   0x140002720
   14000350d:	nop
   14000350e:	mov    rsp,rbp
   140003511:	pop    rbx
   140003512:	pop    rsi
   140003513:	pop    rdi
   140003514:	pop    r12
   140003516:	pop    rbp
   140003517:	ret
   140003518:	nop    DWORD PTR [rax+rax*1+0x0]
   140003520:	mov    QWORD PTR [rbp-0x8],0x0
   140003528:	lea    rsi,[rbp-0x8]
   14000352c:	call   0x140007a48
   140003531:	lea    rcx,[rbp-0xa]
   140003535:	mov    r9,rsi
   140003538:	mov    r8d,0x10
   14000353e:	mov    rdx,QWORD PTR [rax]
   140003541:	call   0x1400077a0
   140003546:	test   eax,eax
   140003548:	jle    0x140003578
   14000354a:	movzx  edx,WORD PTR [rbp-0xa]
   14000354e:	mov    WORD PTR [rbx+0x18],dx
   140003552:	mov    DWORD PTR [rbx+0x14],eax
   140003555:	jmp    0x140003450
   14000355a:	nop    WORD PTR [rax+rax*1+0x0]
   140003560:	mov    rdx,rbx
   140003563:	mov    ecx,0x2e
   140003568:	call   0x140002720
   14000356d:	mov    rsp,rdi
   140003570:	jmp    0x1400034ee
   140003575:	nop    DWORD PTR [rax]
   140003578:	movzx  edx,WORD PTR [rbx+0x18]
   14000357c:	jmp    0x140003552
   14000357e:	xchg   ax,ax
   140003580:	push   rbp
   140003581:	push   r12
   140003583:	push   rdi
   140003584:	push   rsi
   140003585:	push   rbx
   140003586:	sub    rsp,0x20
   14000358a:	lea    rbp,[rsp+0x20]
   14000358f:	mov    eax,DWORD PTR [r9+0xc]
   140003593:	mov    r12d,ecx
   140003596:	mov    rdi,rdx
   140003599:	mov    esi,r8d
   14000359c:	mov    rbx,r9
   14000359f:	test   r8d,r8d
   1400035a2:	jle    0x1400036f0
   1400035a8:	cmp    r8d,eax
   1400035ab:	jg     0x140003610
   1400035ad:	mov    edx,DWORD PTR [r9+0x10]
   1400035b1:	sub    eax,r8d
   1400035b4:	cmp    eax,edx
   1400035b6:	jle    0x1400038c0
   1400035bc:	sub    eax,edx
   1400035be:	mov    DWORD PTR [rbx+0xc],eax
   1400035c1:	test   edx,edx
   1400035c3:	jle    0x1400038f0
   1400035c9:	sub    eax,0x1
   1400035cc:	mov    DWORD PTR [rbx+0xc],eax
   1400035cf:	test   esi,esi
   1400035d1:	jle    0x1400035e0
   1400035d3:	test   BYTE PTR [rbx+0x9],0x10
   1400035d7:	jne    0x1400038d7
   1400035dd:	nop    DWORD PTR [rax]
   1400035e0:	test   eax,eax
   1400035e2:	jle    0x140003623
   1400035e4:	test   r12d,r12d
   1400035e7:	jne    0x1400037c8
   1400035ed:	mov    edx,DWORD PTR [rbx+0x8]
   1400035f0:	test   edx,0x1c0
   1400035f6:	je     0x1400038a8
   1400035fc:	lea    ecx,[rax-0x1]
   1400035ff:	mov    DWORD PTR [rbx+0xc],ecx
   140003602:	test   ecx,ecx
   140003604:	je     0x14000362f
   140003606:	test   dh,0x6
   140003609:	jne    0x14000362f
   14000360b:	jmp    0x1400037e3
   140003610:	mov    DWORD PTR [r9+0xc],0xffffffff
   140003618:	test   BYTE PTR [r9+0x9],0x10
   14000361d:	jne    0x140003850
   140003623:	test   r12d,r12d
   140003626:	jne    0x140003720
   14000362c:	mov    edx,DWORD PTR [rbx+0x8]
   14000362f:	test   dh,0x1
   140003632:	jne    0x140003810
   140003638:	and    edx,0x40
   14000363b:	je     0x140003650
   14000363d:	mov    rdx,rbx
   140003640:	mov    ecx,0x20
   140003645:	call   0x140002720
   14000364a:	nop    WORD PTR [rax+rax*1+0x0]
   140003650:	mov    eax,DWORD PTR [rbx+0xc]
   140003653:	test   eax,eax
   140003655:	jle    0x14000366c
   140003657:	mov    edx,DWORD PTR [rbx+0x8]
   14000365a:	and    edx,0x600
   140003660:	cmp    edx,0x200
   140003666:	je     0x140003828
   14000366c:	test   esi,esi
   14000366e:	jle    0x140003780
   140003674:	nop    DWORD PTR [rax+0x0]
   140003678:	movzx  eax,BYTE PTR [rdi]
   14000367b:	mov    ecx,0x30
   140003680:	test   al,al
   140003682:	je     0x14000368b
   140003684:	add    rdi,0x1
   140003688:	movsx  ecx,al
   14000368b:	mov    rdx,rbx
   14000368e:	call   0x140002720
   140003693:	sub    esi,0x1
   140003696:	je     0x1400036c8
   140003698:	test   BYTE PTR [rbx+0x9],0x10
   14000369c:	je     0x140003678
   14000369e:	cmp    WORD PTR [rbx+0x20],0x0
   1400036a3:	je     0x140003678
   1400036a5:	imul   eax,esi,0xaaaaaaab
   1400036ab:	cmp    eax,0x55555555
   1400036b0:	ja     0x140003678
   1400036b2:	lea    rcx,[rbx+0x20]
   1400036b6:	mov    r8,rbx
   1400036b9:	mov    edx,0x1
   1400036be:	call   0x140002780
   1400036c3:	jmp    0x140003678
   1400036c5:	nop    DWORD PTR [rax]
   1400036c8:	mov    eax,DWORD PTR [rbx+0x10]
   1400036cb:	test   eax,eax
   1400036cd:	jg     0x140003738
   1400036cf:	test   BYTE PTR [rbx+0x9],0x8
   1400036d3:	jne    0x140003798
   1400036d9:	sub    eax,0x1
   1400036dc:	mov    DWORD PTR [rbx+0x10],eax
   1400036df:	add    rsp,0x20
   1400036e3:	pop    rbx
   1400036e4:	pop    rsi
   1400036e5:	pop    rdi
   1400036e6:	pop    r12
   1400036e8:	pop    rbp
   1400036e9:	ret
   1400036ea:	nop    WORD PTR [rax+rax*1+0x0]
   1400036f0:	test   eax,eax
   1400036f2:	jle    0x140003910
   1400036f8:	mov    edx,DWORD PTR [r9+0x10]
   1400036fc:	sub    eax,0x1
   1400036ff:	cmp    eax,edx
   140003701:	jg     0x1400035bc
   140003707:	mov    DWORD PTR [rbx+0xc],0xffffffff
   14000370e:	test   r12d,r12d
   140003711:	je     0x14000362c
   140003717:	nop    WORD PTR [rax+rax*1+0x0]
   140003720:	mov    rdx,rbx
   140003723:	mov    ecx,0x2d
   140003728:	call   0x140002720
   14000372d:	jmp    0x140003650
   140003732:	nop    WORD PTR [rax+rax*1+0x0]
   140003738:	mov    rcx,rbx
   14000373b:	call   0x140003430
   140003740:	jmp    0x140003763
   140003742:	nop    WORD PTR [rax+rax*1+0x0]
   140003748:	movzx  eax,BYTE PTR [rdi]
   14000374b:	mov    ecx,0x30
   140003750:	test   al,al
   140003752:	je     0x14000375b
   140003754:	add    rdi,0x1
   140003758:	movsx  ecx,al
   14000375b:	mov    rdx,rbx
   14000375e:	call   0x140002720
   140003763:	mov    eax,DWORD PTR [rbx+0x10]
   140003766:	lea    edx,[rax-0x1]
   140003769:	mov    DWORD PTR [rbx+0x10],edx
   14000376c:	test   eax,eax
   14000376e:	jg     0x140003748
   140003770:	add    rsp,0x20
   140003774:	pop    rbx
   140003775:	pop    rsi
   140003776:	pop    rdi
   140003777:	pop    r12
   140003779:	pop    rbp
   14000377a:	ret
   14000377b:	nop    DWORD PTR [rax+rax*1+0x0]
   140003780:	mov    rdx,rbx
   140003783:	mov    ecx,0x30
   140003788:	call   0x140002720
   14000378d:	mov    eax,DWORD PTR [rbx+0x10]
   140003790:	test   eax,eax
   140003792:	jle    0x14000393f
   140003798:	mov    rcx,rbx
   14000379b:	call   0x140003430
   1400037a0:	test   esi,esi
   1400037a2:	je     0x140003763
   1400037a4:	mov    eax,DWORD PTR [rbx+0x10]
   1400037a7:	add    eax,esi
   1400037a9:	mov    DWORD PTR [rbx+0x10],eax
   1400037ac:	nop    DWORD PTR [rax+0x0]
   1400037b0:	mov    rdx,rbx
   1400037b3:	mov    ecx,0x30
   1400037b8:	call   0x140002720
   1400037bd:	add    esi,0x1
   1400037c0:	jne    0x1400037b0
   1400037c2:	jmp    0x140003763
   1400037c4:	nop    DWORD PTR [rax+0x0]
   1400037c8:	lea    edx,[rax-0x1]
   1400037cb:	mov    DWORD PTR [rbx+0xc],edx
   1400037ce:	test   edx,edx
   1400037d0:	je     0x140003720
   1400037d6:	test   DWORD PTR [rbx+0x8],0x600
   1400037dd:	jne    0x140003720
   1400037e3:	sub    eax,0x2
   1400037e6:	mov    DWORD PTR [rbx+0xc],eax
   1400037e9:	nop    DWORD PTR [rax+0x0]
   1400037f0:	mov    rdx,rbx
   1400037f3:	mov    ecx,0x20
   1400037f8:	call   0x140002720
   1400037fd:	mov    eax,DWORD PTR [rbx+0xc]
   140003800:	lea    edx,[rax-0x1]
   140003803:	mov    DWORD PTR [rbx+0xc],edx
   140003806:	test   eax,eax
   140003808:	jg     0x1400037f0
   14000380a:	jmp    0x140003623
   14000380f:	nop
   140003810:	mov    rdx,rbx
   140003813:	mov    ecx,0x2b
   140003818:	call   0x140002720
   14000381d:	jmp    0x140003650
   140003822:	nop    WORD PTR [rax+rax*1+0x0]
   140003828:	sub    eax,0x1
   14000382b:	mov    DWORD PTR [rbx+0xc],eax
   14000382e:	xchg   ax,ax
   140003830:	mov    rdx,rbx
   140003833:	mov    ecx,0x30
   140003838:	call   0x140002720
   14000383d:	mov    eax,DWORD PTR [rbx+0xc]
   140003840:	lea    edx,[rax-0x1]
   140003843:	mov    DWORD PTR [rbx+0xc],edx
   140003846:	test   eax,eax
   140003848:	jg     0x140003830
   14000384a:	jmp    0x14000366c
   14000384f:	nop
   140003850:	cmp    WORD PTR [r9+0x20],0x0
   140003856:	je     0x140003623
   14000385c:	mov    eax,0xffffffff
   140003861:	mov    edx,0xaaaaaaab
   140003866:	lea    r8d,[rsi+0x2]
   14000386a:	imul   r8,rdx
   14000386e:	mov    edx,eax
   140003870:	shr    r8,0x21
   140003874:	lea    ecx,[r8-0x1]
   140003878:	sub    ecx,eax
   14000387a:	cmp    r8d,0x1
   14000387e:	jne    0x140003898
   140003880:	jmp    0x1400035e0
   140003885:	nop    DWORD PTR [rax]
   140003888:	sub    edx,0x1
   14000388b:	mov    eax,ecx
   14000388d:	add    eax,edx
   14000388f:	mov    DWORD PTR [rbx+0xc],edx
   140003892:	je     0x140003938
   140003898:	test   edx,edx
   14000389a:	jg     0x140003888
   14000389c:	jmp    0x140003623
   1400038a1:	nop    DWORD PTR [rax+0x0]
   1400038a8:	and    dh,0x6
   1400038ab:	jne    0x140003650
   1400038b1:	sub    eax,0x1
   1400038b4:	jmp    0x1400037e6
   1400038b9:	nop    DWORD PTR [rax+0x0]
   1400038c0:	mov    DWORD PTR [r9+0xc],0xffffffff
   1400038c8:	mov    eax,0xffffffff
   1400038cd:	test   BYTE PTR [rbx+0x9],0x10
   1400038d1:	je     0x1400035e0
   1400038d7:	cmp    WORD PTR [rbx+0x20],0x0
   1400038dc:	je     0x1400035e0
   1400038e2:	jmp    0x140003861
   1400038e7:	nop    WORD PTR [rax+rax*1+0x0]
   1400038f0:	mov    edx,DWORD PTR [rbx+0x8]
   1400038f3:	test   dh,0x8
   1400038f6:	jne    0x1400035c9
   1400038fc:	test   esi,esi
   1400038fe:	jle    0x1400035e4
   140003904:	and    dh,0x10
   140003907:	jne    0x1400038d7
   140003909:	jmp    0x1400035e4
   14000390e:	xchg   ax,ax
   140003910:	jne    0x140003707
   140003916:	mov    eax,DWORD PTR [r9+0x10]
   14000391a:	test   eax,eax
   14000391c:	jns    0x140003707
   140003922:	neg    eax
   140003924:	mov    DWORD PTR [r9+0xc],eax
   140003928:	test   BYTE PTR [r9+0x9],0x8
   14000392d:	jne    0x1400035c9
   140003933:	jmp    0x1400035e4
   140003938:	mov    eax,edx
   14000393a:	jmp    0x1400035e0
   14000393f:	test   BYTE PTR [rbx+0x9],0x8
   140003943:	jne    0x140003798
   140003949:	test   esi,esi
   14000394b:	jne    0x1400037a7
   140003951:	jmp    0x1400036d9
   140003956:	cs nop WORD PTR [rax+rax*1+0x0]
   140003960:	push   rbp
   140003961:	push   rdi
   140003962:	push   rsi
   140003963:	push   rbx
   140003964:	sub    rsp,0x28
   140003968:	lea    rbp,[rsp+0x20]
   14000396d:	mov    r10d,0x1
   140003973:	sub    r8d,0x1
   140003977:	mov    r11d,ecx
   14000397a:	mov    rbx,r9
   14000397d:	movsxd rsi,r8d
   140003980:	sar    r8d,0x1f
   140003984:	imul   rcx,rsi,0x66666667
   14000398b:	sar    rcx,0x22
   14000398f:	sub    ecx,r8d
   140003992:	je     0x1400039b3
   140003994:	nop    DWORD PTR [rax+0x0]
   140003998:	movsxd rax,ecx
   14000399b:	sar    ecx,0x1f
   14000399e:	add    r10d,0x1
   1400039a2:	imul   rax,rax,0x66666667
   1400039a9:	sar    rax,0x22
   1400039ad:	sub    eax,ecx
   1400039af:	mov    ecx,eax
   1400039b1:	jne    0x140003998
   1400039b3:	mov    eax,DWORD PTR [rbx+0x2c]
   1400039b6:	cmp    eax,0xffffffff
   1400039b9:	jne    0x1400039c7
   1400039bb:	mov    DWORD PTR [rbx+0x2c],0x2
   1400039c2:	mov    eax,0x2
   1400039c7:	cmp    r10d,eax
   1400039ca:	mov    r8d,DWORD PTR [rbx+0xc]
   1400039ce:	mov    r9,rbx
   1400039d1:	cmovge eax,r10d
   1400039d5:	lea    ecx,[rax+0x2]
   1400039d8:	mov    edi,eax
   1400039da:	mov    eax,r8d
   1400039dd:	sub    eax,ecx
   1400039df:	cmp    r8d,ecx
   1400039e2:	mov    ecx,0xffffffff
   1400039e7:	mov    r8d,0x1
   1400039ed:	cmovle eax,ecx
   1400039f0:	mov    ecx,r11d
   1400039f3:	mov    DWORD PTR [rbx+0xc],eax
   1400039f6:	call   0x140003580
   1400039fb:	mov    ecx,DWORD PTR [rbx+0x8]
   1400039fe:	mov    eax,DWORD PTR [rbx+0x2c]
   140003a01:	mov    rdx,rbx
   140003a04:	mov    DWORD PTR [rbx+0x10],eax
   140003a07:	mov    eax,ecx
   140003a09:	and    ecx,0x20
   140003a0c:	or     eax,0x1c0
   140003a11:	or     ecx,0x45
   140003a14:	mov    DWORD PTR [rbx+0x8],eax
   140003a17:	call   0x140002720
   140003a1c:	lea    r10d,[rdi+0x1]
   140003a20:	add    DWORD PTR [rbx+0xc],r10d
   140003a24:	mov    rdx,rbx
   140003a27:	mov    rcx,rsi
   140003a2a:	add    rsp,0x28
   140003a2e:	pop    rbx
   140003a2f:	pop    rsi
   140003a30:	pop    rdi
   140003a31:	pop    rbp
   140003a32:	jmp    0x140003080
   140003a37:	nop    WORD PTR [rax+rax*1+0x0]
   140003a40:	push   rbp
   140003a41:	push   rsi
   140003a42:	push   rbx
   140003a43:	sub    rsp,0x50
   140003a47:	lea    rbp,[rsp+0x50]
   140003a4c:	mov    r8d,DWORD PTR [rdx+0x10]
   140003a50:	fld    TBYTE PTR [rcx]
   140003a52:	mov    rbx,rdx
   140003a55:	test   r8d,r8d
   140003a58:	js     0x140003ab0
   140003a5a:	add    r8d,0x1
   140003a5e:	lea    rax,[rbp-0x8]
   140003a62:	lea    rdx,[rbp-0x20]
   140003a66:	mov    ecx,0x2
   140003a6b:	fstp   TBYTE PTR [rbp-0x20]
   140003a6e:	lea    r9,[rbp-0x4]
   140003a72:	mov    QWORD PTR [rsp+0x20],rax
   140003a77:	call   0x140002630
   140003a7c:	mov    r8d,DWORD PTR [rbp-0x4]
   140003a80:	mov    rsi,rax
   140003a83:	cmp    r8d,0xffff8000
   140003a8a:	je     0x140003ac0
   140003a8c:	mov    ecx,DWORD PTR [rbp-0x8]
   140003a8f:	mov    r9,rbx
   140003a92:	mov    rdx,rax
   140003a95:	call   0x140003960
   140003a9a:	mov    rcx,rsi
   140003a9d:	call   0x140004cb0
   140003aa2:	nop
   140003aa3:	add    rsp,0x50
   140003aa7:	pop    rbx
   140003aa8:	pop    rsi
   140003aa9:	pop    rbp
   140003aaa:	ret
   140003aab:	nop    DWORD PTR [rax+rax*1+0x0]
   140003ab0:	mov    DWORD PTR [rdx+0x10],0x6
   140003ab7:	mov    r8d,0x7
   140003abd:	jmp    0x140003a5e
   140003abf:	nop
   140003ac0:	mov    ecx,DWORD PTR [rbp-0x8]
   140003ac3:	mov    r8,rbx
   140003ac6:	mov    rdx,rax
   140003ac9:	call   0x140002ac0
   140003ace:	mov    rcx,rsi
   140003ad1:	call   0x140004cb0
   140003ad6:	nop
   140003ad7:	add    rsp,0x50
   140003adb:	pop    rbx
   140003adc:	pop    rsi
   140003add:	pop    rbp
   140003ade:	ret
   140003adf:	nop
   140003ae0:	push   rbp
   140003ae1:	push   rsi
   140003ae2:	push   rbx
   140003ae3:	sub    rsp,0x50
   140003ae7:	lea    rbp,[rsp+0x50]
   140003aec:	mov    r8d,DWORD PTR [rdx+0x10]
   140003af0:	fld    TBYTE PTR [rcx]
   140003af2:	mov    rbx,rdx
   140003af5:	test   r8d,r8d
   140003af8:	jns    0x140003b07
   140003afa:	mov    DWORD PTR [rdx+0x10],0x6
   140003b01:	mov    r8d,0x6
   140003b07:	lea    rax,[rbp-0x8]
   140003b0b:	lea    rdx,[rbp-0x20]
   140003b0f:	mov    ecx,0x3
   140003b14:	fstp   TBYTE PTR [rbp-0x20]
   140003b17:	lea    r9,[rbp-0x4]
   140003b1b:	mov    QWORD PTR [rsp+0x20],rax
   140003b20:	call   0x140002630
   140003b25:	mov    r8d,DWORD PTR [rbp-0x4]
   140003b29:	mov    rsi,rax
   140003b2c:	cmp    r8d,0xffff8000
   140003b33:	je     0x140003ba0
   140003b35:	mov    ecx,DWORD PTR [rbp-0x8]
   140003b38:	mov    rdx,rax
   140003b3b:	mov    r9,rbx
   140003b3e:	call   0x140003580
   140003b43:	mov    eax,DWORD PTR [rbx+0xc]
   140003b46:	jmp    0x140003b64
   140003b48:	nop    DWORD PTR [rax+rax*1+0x0]
   140003b50:	movsxd rax,DWORD PTR [rbx+0x24]
   140003b54:	mov    BYTE PTR [rdx+rax*1],0x20
   140003b58:	mov    edx,DWORD PTR [rbx+0x24]
   140003b5b:	mov    eax,DWORD PTR [rbx+0xc]
   140003b5e:	add    edx,0x1
   140003b61:	mov    DWORD PTR [rbx+0x24],edx
   140003b64:	mov    edx,eax
   140003b66:	sub    eax,0x1
   140003b69:	mov    DWORD PTR [rbx+0xc],eax
   140003b6c:	test   edx,edx
   140003b6e:	jle    0x140003bae
   140003b70:	mov    ecx,DWORD PTR [rbx+0x8]
   140003b73:	test   ch,0x40
   140003b76:	jne    0x140003b80
   140003b78:	mov    edx,DWORD PTR [rbx+0x24]
   140003b7b:	cmp    DWORD PTR [rbx+0x28],edx
   140003b7e:	jle    0x140003b5e
   140003b80:	mov    rdx,QWORD PTR [rbx]
   140003b83:	and    ch,0x20
   140003b86:	je     0x140003b50
   140003b88:	mov    ecx,0x20
   140003b8d:	call   0x140007a30
   140003b92:	mov    edx,DWORD PTR [rbx+0x24]
   140003b95:	mov    eax,DWORD PTR [rbx+0xc]
   140003b98:	jmp    0x140003b5e
   140003b9a:	nop    WORD PTR [rax+rax*1+0x0]
   140003ba0:	mov    ecx,DWORD PTR [rbp-0x8]
   140003ba3:	mov    r8,rbx
   140003ba6:	mov    rdx,rax
   140003ba9:	call   0x140002ac0
   140003bae:	mov    rcx,rsi
   140003bb1:	call   0x140004cb0
   140003bb6:	nop
   140003bb7:	add    rsp,0x50
   140003bbb:	pop    rbx
   140003bbc:	pop    rsi
   140003bbd:	pop    rbp
   140003bbe:	ret
   140003bbf:	nop
   140003bc0:	push   rbp
   140003bc1:	push   rdi
   140003bc2:	push   rsi
   140003bc3:	push   rbx
   140003bc4:	sub    rsp,0x58
   140003bc8:	lea    rbp,[rsp+0x50]
   140003bcd:	mov    r8d,DWORD PTR [rdx+0x10]
   140003bd1:	fld    TBYTE PTR [rcx]
   140003bd3:	mov    rbx,rdx
   140003bd6:	test   r8d,r8d
   140003bd9:	js     0x140003cc8
   140003bdf:	je     0x140003cb0
   140003be5:	lea    rax,[rbp-0x8]
   140003be9:	lea    rdx,[rbp-0x20]
   140003bed:	mov    ecx,0x2
   140003bf2:	fstp   TBYTE PTR [rbp-0x20]
   140003bf5:	lea    r9,[rbp-0x4]
   140003bf9:	mov    QWORD PTR [rsp+0x20],rax
   140003bfe:	call   0x140002630
   140003c03:	mov    edi,DWORD PTR [rbp-0x4]
   140003c06:	mov    rsi,rax
   140003c09:	cmp    edi,0xffff8000
   140003c0f:	je     0x140003ce0
   140003c15:	mov    eax,DWORD PTR [rbx+0x8]
   140003c18:	and    eax,0x800
   140003c1d:	cmp    edi,0xfffffffd
   140003c20:	jl     0x140003c70
   140003c22:	mov    edx,DWORD PTR [rbx+0x10]
   140003c25:	cmp    edi,edx
   140003c27:	jg     0x140003c70
   140003c29:	test   eax,eax
   140003c2b:	je     0x140003cf0
   140003c31:	sub    edx,edi
   140003c33:	mov    DWORD PTR [rbx+0x10],edx
   140003c36:	mov    ecx,DWORD PTR [rbp-0x8]
   140003c39:	mov    r9,rbx
   140003c3c:	mov    r8d,edi
   140003c3f:	mov    rdx,rsi
   140003c42:	call   0x140003580
   140003c47:	jmp    0x140003c5d
   140003c49:	nop    DWORD PTR [rax+0x0]
   140003c50:	mov    rdx,rbx
   140003c53:	mov    ecx,0x20
   140003c58:	call   0x140002720
   140003c5d:	mov    eax,DWORD PTR [rbx+0xc]
   140003c60:	lea    edx,[rax-0x1]
   140003c63:	mov    DWORD PTR [rbx+0xc],edx
   140003c66:	test   eax,eax
   140003c68:	jg     0x140003c50
   140003c6a:	jmp    0x140003c93
   140003c6c:	nop    DWORD PTR [rax+0x0]
   140003c70:	test   eax,eax
   140003c72:	jne    0x140003ca8
   140003c74:	mov    rcx,rsi
   140003c77:	call   0x140007a78
   140003c7c:	sub    eax,0x1
   140003c7f:	mov    DWORD PTR [rbx+0x10],eax
   140003c82:	mov    ecx,DWORD PTR [rbp-0x8]
   140003c85:	mov    r9,rbx
   140003c88:	mov    r8d,edi
   140003c8b:	mov    rdx,rsi
   140003c8e:	call   0x140003960
   140003c93:	mov    rcx,rsi
   140003c96:	call   0x140004cb0
   140003c9b:	nop
   140003c9c:	add    rsp,0x58
   140003ca0:	pop    rbx
   140003ca1:	pop    rsi
   140003ca2:	pop    rdi
   140003ca3:	pop    rbp
   140003ca4:	ret
   140003ca5:	nop    DWORD PTR [rax]
   140003ca8:	mov    eax,DWORD PTR [rbx+0x10]
   140003cab:	sub    eax,0x1
   140003cae:	jmp    0x140003c7f
   140003cb0:	mov    DWORD PTR [rdx+0x10],0x1
   140003cb7:	mov    r8d,0x1
   140003cbd:	jmp    0x140003be5
   140003cc2:	nop    WORD PTR [rax+rax*1+0x0]
   140003cc8:	mov    DWORD PTR [rdx+0x10],0x6
   140003ccf:	mov    r8d,0x6
   140003cd5:	jmp    0x140003be5
   140003cda:	nop    WORD PTR [rax+rax*1+0x0]
   140003ce0:	mov    ecx,DWORD PTR [rbp-0x8]
   140003ce3:	mov    r8,rbx
   140003ce6:	mov    rdx,rax
   140003ce9:	call   0x140002ac0
   140003cee:	jmp    0x140003c93
   140003cf0:	mov    rcx,rsi
   140003cf3:	call   0x140007a78
   140003cf8:	sub    eax,edi
   140003cfa:	mov    DWORD PTR [rbx+0x10],eax
   140003cfd:	jns    0x140003c36
   140003d03:	mov    edx,DWORD PTR [rbx+0xc]
   140003d06:	test   edx,edx
   140003d08:	jle    0x140003c36
   140003d0e:	add    eax,edx
   140003d10:	mov    DWORD PTR [rbx+0xc],eax
   140003d13:	jmp    0x140003c36
   140003d18:	nop    DWORD PTR [rax+rax*1+0x0]
   140003d20:	push   rbp
   140003d21:	push   r14
   140003d23:	push   r13
   140003d25:	push   r12
   140003d27:	push   rdi
   140003d28:	push   rsi
   140003d29:	push   rbx
   140003d2a:	sub    rsp,0x50
   140003d2e:	lea    rbp,[rsp+0x50]
   140003d33:	mov    r10d,DWORD PTR [r8+0x10]
   140003d37:	mov    r9,rcx
   140003d3a:	mov    eax,edx
   140003d3c:	mov    rbx,r8
   140003d3f:	test   dx,dx
   140003d42:	jne    0x140003d4d
   140003d44:	test   rcx,rcx
   140003d47:	je     0x140003e38
   140003d4d:	lea    r8d,[rax-0x3]
   140003d51:	cmp    r10d,0xe
   140003d55:	jbe    0x140003df0
   140003d5b:	movsx  r12,r8w
   140003d5f:	mov    edx,0x10
   140003d64:	test   r9,r9
   140003d67:	je     0x140004170
   140003d6d:	mov    r10d,DWORD PTR [rbx+0x8]
   140003d71:	lea    rdi,[rbp-0x20]
   140003d75:	mov    rsi,rdi
   140003d78:	mov    r11d,r10d
   140003d7b:	mov    r13d,r10d
   140003d7e:	and    r11d,0x20
   140003d82:	and    r13d,0x800
   140003d89:	jmp    0x140003db6
   140003d8b:	nop    DWORD PTR [rax+rax*1+0x0]
   140003d90:	cmp    rdi,rcx
   140003d93:	jb     0x140003da0
   140003d95:	mov    esi,DWORD PTR [rbx+0x10]
   140003d98:	test   esi,esi
   140003d9a:	js     0x140004118
   140003da0:	add    eax,0x30
   140003da3:	mov    BYTE PTR [rcx],al
   140003da5:	lea    rsi,[rcx+0x1]
   140003da9:	shr    r9,0x4
   140003dad:	sub    edx,0x1
   140003db0:	je     0x140003fa0
   140003db6:	mov    eax,r9d
   140003db9:	and    eax,0xf
   140003dbc:	cmp    edx,0x1
   140003dbf:	je     0x140003f70
   140003dc5:	mov    ecx,DWORD PTR [rbx+0x10]
   140003dc8:	test   ecx,ecx
   140003dca:	jle    0x140003dd2
   140003dcc:	sub    ecx,0x1
   140003dcf:	mov    DWORD PTR [rbx+0x10],ecx
   140003dd2:	mov    rcx,rsi
   140003dd5:	test   eax,eax
   140003dd7:	je     0x140003d90
   140003dd9:	cmp    eax,0x9
   140003ddc:	jbe    0x140003da0
   140003dde:	add    eax,0x37
   140003de1:	or     eax,r11d
   140003de4:	jmp    0x140003da3
   140003de6:	cs nop WORD PTR [rax+rax*1+0x0]
   140003df0:	mov    ecx,0xe
   140003df5:	mov    edx,0x4
   140003dfa:	shr    r9,1
   140003dfd:	sub    ecx,r10d
   140003e00:	shl    ecx,0x2
   140003e03:	shl    rdx,cl
   140003e06:	add    rdx,r9
   140003e09:	jns    0x140004160
   140003e0f:	mov    ecx,0xf
   140003e14:	shr    rdx,0x3
   140003e18:	lea    r8d,[rax+0x1]
   140003e1c:	sub    ecx,r10d
   140003e1f:	movsx  r12,r8w
   140003e23:	shl    ecx,0x2
   140003e26:	shr    rdx,cl
   140003e29:	mov    r9,rdx
   140003e2c:	lea    edx,[r10+0x1]
   140003e30:	jmp    0x140003d6d
   140003e35:	nop    DWORD PTR [rax]
   140003e38:	cmp    r10d,0xe
   140003e3c:	ja     0x140004148
   140003e42:	mov    ecx,0xe
   140003e47:	mov    edx,0x4
   140003e4c:	xor    r12d,r12d
   140003e4f:	xor    r8d,r8d
   140003e52:	sub    ecx,r10d
   140003e55:	shl    ecx,0x2
   140003e58:	shl    rdx,cl
   140003e5b:	mov    ecx,0xf
   140003e60:	add    rdx,rdx
   140003e63:	sub    ecx,r10d
   140003e66:	shl    ecx,0x2
   140003e69:	shr    rdx,cl
   140003e6c:	mov    r9,rdx
   140003e6f:	test   rdx,rdx
   140003e72:	jne    0x140003e2c
   140003e74:	test   r10d,r10d
   140003e77:	jne    0x140003e2c
   140003e79:	mov    r10d,DWORD PTR [rbx+0x8]
   140003e7d:	lea    rdi,[rbp-0x20]
   140003e81:	mov    rax,rdi
   140003e84:	test   r10d,0x800
   140003e8b:	je     0x140003e95
   140003e8d:	mov    BYTE PTR [rbp-0x20],0x2e
   140003e91:	lea    rax,[rbp-0x1f]
   140003e95:	mov    r9d,DWORD PTR [rbx+0xc]
   140003e99:	mov    BYTE PTR [rax],0x30
   140003e9c:	lea    rsi,[rax+0x1]
   140003ea0:	mov    r13d,0x2
   140003ea6:	test   r9d,r9d
   140003ea9:	jg     0x140003fbc
   140003eaf:	test   r10b,0x80
   140003eb3:	jne    0x140004080
   140003eb9:	test   r10d,0x100
   140003ec0:	jne    0x140004130
   140003ec6:	and    r10d,0x40
   140003eca:	jne    0x140004180
   140003ed0:	mov    rdx,rbx
   140003ed3:	mov    ecx,0x30
   140003ed8:	call   0x140002720
   140003edd:	mov    ecx,DWORD PTR [rbx+0x8]
   140003ee0:	mov    rdx,rbx
   140003ee3:	and    ecx,0x20
   140003ee6:	or     ecx,0x58
   140003ee9:	call   0x140002720
   140003eee:	mov    eax,DWORD PTR [rbx+0xc]
   140003ef1:	test   eax,eax
   140003ef3:	jle    0x140003f22
   140003ef5:	test   BYTE PTR [rbx+0x9],0x2
   140003ef9:	je     0x140003f22
   140003efb:	sub    eax,0x1
   140003efe:	mov    DWORD PTR [rbx+0xc],eax
   140003f01:	nop    DWORD PTR [rax+0x0]
   140003f08:	mov    rdx,rbx
   140003f0b:	mov    ecx,0x30
   140003f10:	call   0x140002720
   140003f15:	mov    eax,DWORD PTR [rbx+0xc]
   140003f18:	lea    edx,[rax-0x1]
   140003f1b:	mov    DWORD PTR [rbx+0xc],edx
   140003f1e:	test   eax,eax
   140003f20:	jg     0x140003f08
   140003f22:	lea    r14,[rbp-0x22]
   140003f26:	cmp    rdi,rsi
   140003f29:	jb     0x140003f4a
   140003f2b:	jmp    0x1400040a5
   140003f30:	movzx  eax,WORD PTR [rbx+0x20]
   140003f34:	mov    WORD PTR [rbp-0x22],ax
   140003f38:	test   ax,ax
   140003f3b:	jne    0x140004100
   140003f41:	cmp    rsi,rdi
   140003f44:	je     0x1400040a5
   140003f4a:	movsx  ecx,BYTE PTR [rsi-0x1]
   140003f4e:	sub    rsi,0x1
   140003f52:	cmp    ecx,0x2e
   140003f55:	je     0x1400040f0
   140003f5b:	cmp    ecx,0x2c
   140003f5e:	je     0x140003f30
   140003f60:	mov    rdx,rbx
   140003f63:	call   0x140002720
   140003f68:	jmp    0x140003f41
   140003f6a:	nop    WORD PTR [rax+rax*1+0x0]
   140003f70:	cmp    rdi,rsi
   140003f73:	jb     0x140003f88
   140003f75:	test   r13d,r13d
   140003f78:	jne    0x140003f88
   140003f7a:	mov    ecx,DWORD PTR [rbx+0x10]
   140003f7d:	test   ecx,ecx
   140003f7f:	jle    0x140004198
   140003f85:	nop    DWORD PTR [rax]
   140003f88:	mov    BYTE PTR [rsi],0x2e
   140003f8b:	lea    rcx,[rsi+0x1]
   140003f8f:	jmp    0x140003dd5
   140003f94:	test   ecx,ecx
   140003f96:	jne    0x140003fa0
   140003f98:	mov    BYTE PTR [rsi],0x30
   140003f9b:	add    rsi,0x1
   140003f9f:	nop
   140003fa0:	cmp    rsi,rdi
   140003fa3:	je     0x1400041b0
   140003fa9:	mov    r9d,DWORD PTR [rbx+0xc]
   140003fad:	mov    r13d,0x2
   140003fb3:	test   r9d,r9d
   140003fb6:	jle    0x140003eaf
   140003fbc:	mov    edx,DWORD PTR [rbx+0x10]
   140003fbf:	mov    rcx,rsi
   140003fc2:	movsx  eax,r8w
   140003fc6:	movsx  r8,r8w
   140003fca:	sub    rcx,rdi
   140003fcd:	lea    r11d,[rdx+rcx*1]
   140003fd1:	test   edx,edx
   140003fd3:	mov    edx,r10d
   140003fd6:	cmovg  ecx,r11d
   140003fda:	and    edx,0x1c0
   140003fe0:	cmp    edx,0x1
   140003fe3:	sbb    ecx,0xfffffffa
   140003fe6:	imul   r8,r8,0x66666667
   140003fed:	sar    eax,0x1f
   140003ff0:	mov    r11d,ecx
   140003ff3:	sar    r8,0x22
   140003ff7:	sub    r8d,eax
   140003ffa:	je     0x14000402d
   140003ffc:	nop    DWORD PTR [rax+0x0]
   140004000:	movsxd rax,r8d
   140004003:	mov    edx,r8d
   140004006:	add    r11d,0x1
   14000400a:	imul   rax,rax,0x66666667
   140004011:	sar    edx,0x1f
   140004014:	sar    rax,0x22
   140004018:	sub    eax,edx
   14000401a:	mov    r8d,eax
   14000401d:	jne    0x140004000
   14000401f:	mov    r13d,r11d
   140004022:	sub    r13d,ecx
   140004025:	add    r13d,0x2
   140004029:	movsx  r13d,r13w
   14000402d:	cmp    r9d,r11d
   140004030:	jle    0x140004120
   140004036:	sub    r9d,r11d
   140004039:	test   r10d,0x600
   140004040:	jne    0x140004126
   140004046:	sub    r9d,0x1
   14000404a:	mov    DWORD PTR [rbx+0xc],r9d
   14000404e:	xchg   ax,ax
   140004050:	mov    rdx,rbx
   140004053:	mov    ecx,0x20
   140004058:	call   0x140002720
   14000405d:	mov    eax,DWORD PTR [rbx+0xc]
   140004060:	lea    edx,[rax-0x1]
   140004063:	mov    DWORD PTR [rbx+0xc],edx
   140004066:	test   eax,eax
   140004068:	jg     0x140004050
   14000406a:	mov    r10d,DWORD PTR [rbx+0x8]
   14000406e:	test   r10b,0x80
   140004072:	je     0x140003eb9
   140004078:	nop    DWORD PTR [rax+rax*1+0x0]
   140004080:	mov    rdx,rbx
   140004083:	mov    ecx,0x2d
   140004088:	call   0x140002720
   14000408d:	jmp    0x140003ed0
   140004092:	nop    WORD PTR [rax+rax*1+0x0]
   140004098:	mov    rdx,rbx
   14000409b:	mov    ecx,0x30
   1400040a0:	call   0x140002720
   1400040a5:	mov    eax,DWORD PTR [rbx+0x10]
   1400040a8:	lea    edx,[rax-0x1]
   1400040ab:	mov    DWORD PTR [rbx+0x10],edx
   1400040ae:	test   eax,eax
   1400040b0:	jg     0x140004098
   1400040b2:	mov    ecx,DWORD PTR [rbx+0x8]
   1400040b5:	mov    rdx,rbx
   1400040b8:	and    ecx,0x20
   1400040bb:	or     ecx,0x50
   1400040be:	call   0x140002720
   1400040c3:	add    DWORD PTR [rbx+0xc],r13d
   1400040c7:	mov    rdx,rbx
   1400040ca:	mov    rcx,r12
   1400040cd:	or     DWORD PTR [rbx+0x8],0x1c0
   1400040d4:	add    rsp,0x50
   1400040d8:	pop    rbx
   1400040d9:	pop    rsi
   1400040da:	pop    rdi
   1400040db:	pop    r12
   1400040dd:	pop    r13
   1400040df:	pop    r14
   1400040e1:	pop    rbp
   1400040e2:	jmp    0x140003080
   1400040e7:	nop    WORD PTR [rax+rax*1+0x0]
   1400040f0:	mov    rcx,rbx
   1400040f3:	call   0x140003430
   1400040f8:	jmp    0x140003f41
   1400040fd:	nop    DWORD PTR [rax]
   140004100:	mov    r8,rbx
   140004103:	mov    edx,0x1
   140004108:	mov    rcx,r14
   14000410b:	call   0x140002780
   140004110:	jmp    0x140003f41
   140004115:	nop    DWORD PTR [rax]
   140004118:	mov    rsi,rcx
   14000411b:	jmp    0x140003da9
   140004120:	mov    r9d,0xffffffff
   140004126:	mov    DWORD PTR [rbx+0xc],r9d
   14000412a:	jmp    0x140003eaf
   14000412f:	nop
   140004130:	mov    rdx,rbx
   140004133:	mov    ecx,0x2b
   140004138:	call   0x140002720
   14000413d:	jmp    0x140003ed0
   140004142:	nop    WORD PTR [rax+rax*1+0x0]
   140004148:	test   r10d,r10d
   14000414b:	jle    0x1400041c0
   14000414d:	xor    r12d,r12d
   140004150:	xor    r8d,r8d
   140004153:	xor    r9d,r9d
   140004156:	mov    edx,0x10
   14000415b:	jmp    0x140003d6d
   140004160:	movsx  r12,r8w
   140004164:	jmp    0x140003e5b
   140004169:	nop    DWORD PTR [rax+0x0]
   140004170:	test   r10d,r10d
   140004173:	jg     0x140003d6d
   140004179:	jmp    0x140003e79
   14000417e:	xchg   ax,ax
   140004180:	mov    rdx,rbx
   140004183:	mov    ecx,0x20
   140004188:	call   0x140002720
   14000418d:	jmp    0x140003ed0
   140004192:	nop    WORD PTR [rax+rax*1+0x0]
   140004198:	test   eax,eax
   14000419a:	je     0x140003f94
   1400041a0:	mov    rcx,rsi
   1400041a3:	jmp    0x140003dd9
   1400041a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400041b0:	mov    eax,DWORD PTR [rbx+0x10]
   1400041b3:	test   eax,eax
   1400041b5:	jg     0x140003e8d
   1400041bb:	jmp    0x140003e81
   1400041c0:	mov    r10d,DWORD PTR [r8+0x8]
   1400041c4:	xor    r12d,r12d
   1400041c7:	xor    r8d,r8d
   1400041ca:	lea    rdi,[rbp-0x20]
   1400041ce:	jmp    0x140003e81
   1400041d3:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400041de:	xchg   ax,ax
   1400041e0:	push   rbp
   1400041e1:	push   r15
   1400041e3:	push   r14
   1400041e5:	push   r13
   1400041e7:	push   r12
   1400041e9:	push   rdi
   1400041ea:	push   rsi
   1400041eb:	push   rbx
   1400041ec:	sub    rsp,0xb8
   1400041f3:	lea    rbp,[rsp+0xb0]
   1400041fb:	mov    r14,QWORD PTR [rbp+0x70]
   1400041ff:	mov    edi,ecx
   140004201:	mov    r12,rdx
   140004204:	mov    ebx,r8d
   140004207:	mov    rsi,r9
   14000420a:	call   0x1400079e8
   14000420f:	and    edi,0x6000
   140004215:	xor    edx,edx
   140004217:	mov    DWORD PTR [rbp-0x8],ebx
   14000421a:	movabs rcx,0xfffffffdffffffff
   140004224:	mov    WORD PTR [rbp-0x18],dx
   140004228:	mov    eax,DWORD PTR [rax]
   14000422a:	lea    rbx,[rsi+0x1]
   14000422e:	mov    QWORD PTR [rbp-0x20],rcx
   140004232:	xor    ecx,ecx
   140004234:	mov    WORD PTR [rbp-0x10],cx
   140004238:	movsx  ecx,BYTE PTR [rsi]
   14000423b:	mov    QWORD PTR [rbp-0x30],r12
   14000423f:	mov    DWORD PTR [rbp-0x28],edi
   140004242:	mov    edx,ecx
   140004244:	mov    DWORD PTR [rbp-0x24],0xffffffff
   14000424b:	mov    DWORD PTR [rbp-0x14],0x0
   140004252:	mov    DWORD PTR [rbp-0xc],0x0
   140004259:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140004260:	test   ecx,ecx
   140004262:	je     0x140004363
   140004268:	lea    rsi,[rbp-0x24]
   14000426c:	mov    DWORD PTR [rbp-0x6c],eax
   14000426f:	lea    r13,[rip+0x511a]        # 0x140009390
   140004276:	mov    r15,rbx
   140004279:	mov    QWORD PTR [rbp-0x68],rsi
   14000427d:	jmp    0x1400042b9
   14000427f:	nop
   140004280:	mov    eax,DWORD PTR [rbp-0x28]
   140004283:	mov    esi,DWORD PTR [rbp-0xc]
   140004286:	test   ah,0x40
   140004289:	jne    0x140004290
   14000428b:	cmp    DWORD PTR [rbp-0x8],esi
   14000428e:	jle    0x1400042a0
   140004290:	mov    r8,QWORD PTR [rbp-0x30]
   140004294:	test   ah,0x20
   140004297:	jne    0x140004300
   140004299:	movsxd rax,esi
   14000429c:	mov    BYTE PTR [r8+rax*1],dl
   1400042a0:	add    esi,0x1
   1400042a3:	mov    DWORD PTR [rbp-0xc],esi
   1400042a6:	movzx  edx,BYTE PTR [r15]
   1400042aa:	add    r15,0x1
   1400042ae:	movsx  ecx,dl
   1400042b1:	test   ecx,ecx
   1400042b3:	je     0x140004360
   1400042b9:	cmp    ecx,0x25
   1400042bc:	jne    0x140004280
   1400042be:	movzx  edx,BYTE PTR [r15]
   1400042c2:	mov    DWORD PTR [rbp-0x28],edi
   1400042c5:	mov    QWORD PTR [rbp-0x24],0xffffffffffffffff
   1400042cd:	test   dl,dl
   1400042cf:	je     0x140004360
   1400042d5:	mov    r10,QWORD PTR [rbp-0x68]
   1400042d9:	mov    rsi,r15
   1400042dc:	xor    r11d,r11d
   1400042df:	xor    ebx,ebx
   1400042e1:	lea    eax,[rdx-0x20]
   1400042e4:	lea    r12,[rsi+0x1]
   1400042e8:	movsx  ecx,dl
   1400042eb:	cmp    al,0x5a
   1400042ed:	ja     0x140004310
   1400042ef:	movzx  eax,al
   1400042f2:	movsxd rax,DWORD PTR [r13+rax*4+0x0]
   1400042f7:	add    rax,r13
   1400042fa:	jmp    rax
   1400042fc:	nop    DWORD PTR [rax+0x0]
   140004300:	mov    rdx,r8
   140004303:	call   0x140007a30
   140004308:	jmp    0x1400042a0
   14000430a:	nop    WORD PTR [rax+rax*1+0x0]
   140004310:	sub    edx,0x30
   140004313:	cmp    dl,0x9
   140004316:	ja     0x14000451a
   14000431c:	cmp    ebx,0x3
   14000431f:	ja     0x14000451a
   140004325:	test   ebx,ebx
   140004327:	jne    0x1400049ff
   14000432d:	mov    ebx,0x1
   140004332:	test   r10,r10
   140004335:	je     0x140004350
   140004337:	mov    eax,DWORD PTR [r10]
   14000433a:	test   eax,eax
   14000433c:	js     0x140004aa1
   140004342:	lea    eax,[rax+rax*4]
   140004345:	lea    eax,[rcx+rax*2-0x30]
   140004349:	mov    DWORD PTR [r10],eax
   14000434c:	nop    DWORD PTR [rax+0x0]
   140004350:	movzx  edx,BYTE PTR [rsi+0x1]
   140004354:	mov    rsi,r12
   140004357:	test   dl,dl
   140004359:	jne    0x1400042e1
   14000435b:	nop    DWORD PTR [rax+rax*1+0x0]
   140004360:	mov    ecx,DWORD PTR [rbp-0xc]
   140004363:	mov    eax,ecx
   140004365:	add    rsp,0xb8
   14000436c:	pop    rbx
   14000436d:	pop    rsi
   14000436e:	pop    rdi
   14000436f:	pop    r12
   140004371:	pop    r13
   140004373:	pop    r14
   140004375:	pop    r15
   140004377:	pop    rbp
   140004378:	ret
   140004379:	nop    DWORD PTR [rax+0x0]
   140004380:	and    DWORD PTR [rbp-0x28],0xfffffeff
   140004387:	cmp    r11d,0x3
   14000438b:	je     0x140004acf
   140004391:	cmp    r11d,0x2
   140004395:	je     0x140004b7c
   14000439b:	mov    edx,DWORD PTR [r14]
   14000439e:	movzx  eax,dx
   1400043a1:	cmp    r11d,0x1
   1400043a5:	je     0x1400043b8
   1400043a7:	mov    r8d,edx
   1400043aa:	cmp    r11d,0x5
   1400043ae:	movzx  edx,dl
   1400043b1:	mov    rax,r8
   1400043b4:	cmove  rax,rdx
   1400043b8:	mov    QWORD PTR [rbp-0x40],rax
   1400043bc:	cmp    ecx,0x75
   1400043bf:	je     0x140004b11
   1400043c5:	lea    r8,[rbp-0x30]
   1400043c9:	mov    rdx,rax
   1400043cc:	call   0x140002b60
   1400043d1:	jmp    0x140004660
   1400043d6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400043e0:	movzx  edx,BYTE PTR [rsi+0x1]
   1400043e4:	mov    r11d,0x3
   1400043ea:	mov    rsi,r12
   1400043ed:	mov    ebx,0x4
   1400043f2:	jmp    0x140004357
   1400043f7:	or     DWORD PTR [rbp-0x28],0x80
   1400043fe:	lea    rsi,[r14+0x8]
   140004402:	cmp    r11d,0x3
   140004406:	je     0x140004b22
   14000440c:	movsxd rcx,DWORD PTR [r14]
   14000440f:	cmp    r11d,0x2
   140004413:	je     0x14000442b
   140004415:	cmp    r11d,0x1
   140004419:	je     0x140004a90
   14000441f:	movsx  rdx,cl
   140004423:	cmp    r11d,0x5
   140004427:	cmove  rcx,rdx
   14000442b:	lea    rdx,[rbp-0x30]
   14000442f:	mov    r14,rsi
   140004432:	mov    r15,r12
   140004435:	call   0x140003080
   14000443a:	jmp    0x1400042a6
   14000443f:	test   ebx,ebx
   140004441:	jne    0x14000444c
   140004443:	cmp    DWORD PTR [rbp-0x28],edi
   140004446:	je     0x140004a6a
   14000444c:	mov    rdx,QWORD PTR [r14]
   14000444f:	lea    rsi,[r14+0x8]
   140004453:	lea    r8,[rbp-0x30]
   140004457:	mov    ecx,0x78
   14000445c:	mov    r14,rsi
   14000445f:	mov    r15,r12
   140004462:	call   0x140002b60
   140004467:	jmp    0x1400042a6
   14000446c:	movzx  edx,BYTE PTR [rsi+0x1]
   140004470:	cmp    dl,0x68
   140004473:	je     0x140004ad7
   140004479:	mov    rsi,r12
   14000447c:	mov    r11d,0x1
   140004482:	mov    ebx,0x4
   140004487:	jmp    0x140004357
   14000448c:	mov    ecx,DWORD PTR [rbp-0x6c]
   14000448f:	mov    r15,r12
   140004492:	call   0x140007a70
   140004497:	lea    rdx,[rbp-0x30]
   14000449b:	mov    rcx,rax
   14000449e:	call   0x140002a70
   1400044a3:	jmp    0x1400042a6
   1400044a8:	mov    rcx,QWORD PTR [r14]
   1400044ab:	movsxd rdx,DWORD PTR [rbp-0xc]
   1400044af:	cmp    r11d,0x5
   1400044b3:	je     0x140004aef
   1400044b9:	cmp    r11d,0x1
   1400044bd:	je     0x140004b74
   1400044c3:	cmp    r11d,0x2
   1400044c7:	je     0x1400044d3
   1400044c9:	cmp    r11d,0x3
   1400044cd:	je     0x140004a99
   1400044d3:	mov    DWORD PTR [rcx],edx
   1400044d5:	jmp    0x140004660
   1400044da:	movzx  edx,BYTE PTR [rsi+0x1]
   1400044de:	cmp    dl,0x6c
   1400044e1:	je     0x140004b4c
   1400044e7:	mov    rsi,r12
   1400044ea:	mov    r11d,0x2
   1400044f0:	mov    ebx,0x4
   1400044f5:	jmp    0x140004357
   1400044fa:	movzx  edx,BYTE PTR [rsi+0x1]
   1400044fe:	cmp    dl,0x36
   140004501:	je     0x140004b2a
   140004507:	cmp    dl,0x33
   14000450a:	jne    0x140004a4d
   140004510:	cmp    BYTE PTR [rsi+0x2],0x32
   140004514:	je     0x140004b97
   14000451a:	lea    rdx,[rbp-0x30]
   14000451e:	mov    ecx,0x25
   140004523:	call   0x140002720
   140004528:	jmp    0x1400042a6
   14000452d:	nop    DWORD PTR [rax]
   140004530:	movzx  edx,BYTE PTR [rsi+0x1]
   140004534:	or     DWORD PTR [rbp-0x28],0x4
   140004538:	mov    rsi,r12
   14000453b:	mov    ebx,0x4
   140004540:	jmp    0x140004357
   140004545:	mov    eax,DWORD PTR [rbp-0x28]
   140004548:	mov    rdx,QWORD PTR [r14]
   14000454b:	or     eax,0x20
   14000454e:	mov    DWORD PTR [rbp-0x28],eax
   140004551:	test   al,0x4
   140004553:	je     0x140004732
   140004559:	mov    r8,QWORD PTR [rdx]
   14000455c:	mov    r9d,DWORD PTR [rdx+0x8]
   140004560:	mov    r10,r8
   140004563:	movsx  r11d,r9w
   140004567:	mov    rdx,r9
   14000456a:	shr    r10,0x20
   14000456e:	lea    esi,[r11+r11*1]
   140004572:	and    r10d,0x7fffffff
   140004579:	movzx  esi,si
   14000457c:	or     r10d,r8d
   14000457f:	mov    ecx,r10d
   140004582:	neg    ecx
   140004584:	or     ecx,r10d
   140004587:	shr    ecx,0x1f
   14000458a:	or     ecx,esi
   14000458c:	mov    esi,0xfffe
   140004591:	sub    esi,ecx
   140004593:	shr    esi,0x10
   140004596:	jne    0x140004a0f
   14000459c:	test   r9w,r9w
   1400045a0:	js     0x140004a60
   1400045a6:	and    dx,0x7fff
   1400045ab:	je     0x140004a3a
   1400045b1:	cmp    dx,0x7fff
   1400045b6:	jne    0x1400045c1
   1400045b8:	test   r10d,r10d
   1400045bb:	je     0x140004bcd
   1400045c1:	sub    dx,0x3fff
   1400045c6:	mov    rcx,r8
   1400045c9:	jmp    0x14000499f
   1400045ce:	lea    eax,[r11-0x2]
   1400045d2:	mov    DWORD PTR [rbp-0x20],0xffffffff
   1400045d9:	mov    edx,DWORD PTR [r14]
   1400045dc:	lea    rsi,[r14+0x8]
   1400045e0:	cmp    eax,0x1
   1400045e3:	jbe    0x1400047d3
   1400045e9:	mov    BYTE PTR [rbp-0x40],dl
   1400045ec:	lea    rcx,[rbp-0x40]
   1400045f0:	lea    r8,[rbp-0x30]
   1400045f4:	mov    edx,0x1
   1400045f9:	call   0x140002920
   1400045fe:	mov    r14,rsi
   140004601:	mov    r15,r12
   140004604:	jmp    0x1400042a6
   140004609:	lea    eax,[r11-0x2]
   14000460d:	mov    rcx,QWORD PTR [r14]
   140004610:	lea    rsi,[r14+0x8]
   140004614:	cmp    eax,0x1
   140004617:	jbe    0x1400049b1
   14000461d:	lea    rdx,[rbp-0x30]
   140004621:	mov    r14,rsi
   140004624:	mov    r15,r12
   140004627:	call   0x140002a70
   14000462c:	jmp    0x1400042a6
   140004631:	mov    eax,DWORD PTR [rbp-0x28]
   140004634:	mov    rdx,QWORD PTR [r14]
   140004637:	or     eax,0x20
   14000463a:	mov    DWORD PTR [rbp-0x28],eax
   14000463d:	test   al,0x4
   14000463f:	je     0x140004859
   140004645:	fld    TBYTE PTR [rdx]
   140004647:	lea    rcx,[rbp-0x60]
   14000464b:	lea    rdx,[rbp-0x30]
   14000464f:	fstp   TBYTE PTR [rbp-0x60]
   140004652:	call   0x140003bc0
   140004657:	nop    WORD PTR [rax+rax*1+0x0]
   140004660:	add    r14,0x8
   140004664:	mov    r15,r12
   140004667:	jmp    0x1400042a6
   14000466c:	mov    eax,DWORD PTR [rbp-0x28]
   14000466f:	mov    rdx,QWORD PTR [r14]
   140004672:	or     eax,0x20
   140004675:	mov    DWORD PTR [rbp-0x28],eax
   140004678:	test   al,0x4
   14000467a:	je     0x14000482f
   140004680:	fld    TBYTE PTR [rdx]
   140004682:	lea    rcx,[rbp-0x60]
   140004686:	lea    rdx,[rbp-0x30]
   14000468a:	fstp   TBYTE PTR [rbp-0x60]
   14000468d:	call   0x140003ae0
   140004692:	jmp    0x140004660
   140004694:	mov    eax,DWORD PTR [rbp-0x28]
   140004697:	mov    rdx,QWORD PTR [r14]
   14000469a:	or     eax,0x20
   14000469d:	mov    DWORD PTR [rbp-0x28],eax
   1400046a0:	test   al,0x4
   1400046a2:	je     0x140004805
   1400046a8:	fld    TBYTE PTR [rdx]
   1400046aa:	lea    rcx,[rbp-0x60]
   1400046ae:	lea    rdx,[rbp-0x30]
   1400046b2:	fstp   TBYTE PTR [rbp-0x60]
   1400046b5:	call   0x140003a40
   1400046ba:	jmp    0x140004660
   1400046bc:	test   ebx,ebx
   1400046be:	jne    0x140004350
   1400046c4:	movzx  edx,BYTE PTR [rsi+0x1]
   1400046c8:	or     DWORD PTR [rbp-0x28],0x40
   1400046cc:	mov    rsi,r12
   1400046cf:	jmp    0x140004357
   1400046d4:	test   ebx,ebx
   1400046d6:	jne    0x140004350
   1400046dc:	movzx  edx,BYTE PTR [rsi+0x1]
   1400046e0:	or     DWORD PTR [rbp-0x28],0x400
   1400046e7:	mov    rsi,r12
   1400046ea:	jmp    0x140004357
   1400046ef:	cmp    ebx,0x1
   1400046f2:	jbe    0x140004ab3
   1400046f8:	movzx  edx,BYTE PTR [rsi+0x1]
   1400046fc:	mov    ebx,0x4
   140004701:	mov    rsi,r12
   140004704:	jmp    0x140004357
   140004709:	test   ebx,ebx
   14000470b:	jne    0x1400049f1
   140004711:	movzx  edx,BYTE PTR [rsi+0x1]
   140004715:	or     DWORD PTR [rbp-0x28],0x200
   14000471c:	mov    rsi,r12
   14000471f:	jmp    0x140004357
   140004724:	mov    eax,DWORD PTR [rbp-0x28]
   140004727:	mov    rdx,QWORD PTR [r14]
   14000472a:	test   al,0x4
   14000472c:	jne    0x140004559
   140004732:	mov    r8,rdx
   140004735:	mov    ecx,edx
   140004737:	shr    r8,0x20
   14000473b:	neg    ecx
   14000473d:	mov    r9d,r8d
   140004740:	or     ecx,edx
   140004742:	and    r9d,0x7fffffff
   140004749:	shr    ecx,0x1f
   14000474c:	or     ecx,r9d
   14000474f:	mov    r9d,0x7ff00000
   140004755:	cmp    r9d,ecx
   140004758:	js     0x140004a0f
   14000475e:	mov    QWORD PTR [rbp-0x80],rdx
   140004762:	fld    QWORD PTR [rbp-0x80]
   140004765:	fstp   TBYTE PTR [rbp-0x80]
   140004768:	mov    rcx,QWORD PTR [rbp-0x78]
   14000476c:	test   cx,cx
   14000476f:	jns    0x140004776
   140004771:	or     al,0x80
   140004773:	mov    DWORD PTR [rbp-0x28],eax
   140004776:	mov    eax,r8d
   140004779:	and    r8d,0x7ff00000
   140004780:	and    eax,0xfffff
   140004785:	cmp    r8d,0x7ff00000
   14000478c:	setne  r9b
   140004790:	or     eax,edx
   140004792:	setne  dl
   140004795:	or     r9b,dl
   140004798:	jne    0x140004965
   14000479e:	or     eax,r8d
   1400047a1:	je     0x140004965
   1400047a7:	and    ecx,0x8000
   1400047ad:	lea    r8,[rbp-0x30]
   1400047b1:	lea    rdx,[rip+0x4bd2]        # 0x14000938a
   1400047b8:	call   0x140002ac0
   1400047bd:	jmp    0x140004660
   1400047c2:	nop    WORD PTR [rax+rax*1+0x0]
   1400047c8:	mov    DWORD PTR [rbp-0x20],0xffffffff
   1400047cf:	lea    rsi,[r14+0x8]
   1400047d3:	mov    eax,DWORD PTR [r14]
   1400047d6:	lea    rcx,[rbp-0x40]
   1400047da:	lea    r8,[rbp-0x30]
   1400047de:	mov    edx,0x1
   1400047e3:	mov    r14,rsi
   1400047e6:	mov    r15,r12
   1400047e9:	mov    WORD PTR [rbp-0x40],ax
   1400047ed:	call   0x140002780
   1400047f2:	jmp    0x1400042a6
   1400047f7:	mov    eax,DWORD PTR [rbp-0x28]
   1400047fa:	mov    rdx,QWORD PTR [r14]
   1400047fd:	test   al,0x4
   1400047ff:	jne    0x1400046a8
   140004805:	mov    QWORD PTR [rbp-0x80],rdx
   140004809:	fld    QWORD PTR [rbp-0x80]
   14000480c:	lea    rdx,[rbp-0x30]
   140004810:	lea    rcx,[rbp-0x60]
   140004814:	fstp   TBYTE PTR [rbp-0x60]
   140004817:	call   0x140003a40
   14000481c:	jmp    0x140004660
   140004821:	mov    eax,DWORD PTR [rbp-0x28]
   140004824:	mov    rdx,QWORD PTR [r14]
   140004827:	test   al,0x4
   140004829:	jne    0x140004680
   14000482f:	mov    QWORD PTR [rbp-0x80],rdx
   140004833:	fld    QWORD PTR [rbp-0x80]
   140004836:	lea    rdx,[rbp-0x30]
   14000483a:	lea    rcx,[rbp-0x60]
   14000483e:	fstp   TBYTE PTR [rbp-0x60]
   140004841:	call   0x140003ae0
   140004846:	jmp    0x140004660
   14000484b:	mov    eax,DWORD PTR [rbp-0x28]
   14000484e:	mov    rdx,QWORD PTR [r14]
   140004851:	test   al,0x4
   140004853:	jne    0x140004645
   140004859:	mov    QWORD PTR [rbp-0x80],rdx
   14000485d:	fld    QWORD PTR [rbp-0x80]
   140004860:	lea    rdx,[rbp-0x30]
   140004864:	lea    rcx,[rbp-0x60]
   140004868:	fstp   TBYTE PTR [rbp-0x60]
   14000486b:	call   0x140003bc0
   140004870:	jmp    0x140004660
   140004875:	lea    rdx,[rbp-0x30]
   140004879:	mov    ecx,0x25
   14000487e:	mov    r15,r12
   140004881:	call   0x140002720
   140004886:	jmp    0x1400042a6
   14000488b:	test   ebx,ebx
   14000488d:	jne    0x140004350
   140004893:	lea    r9,[rbp-0x40]
   140004897:	mov    QWORD PTR [rbp-0x88],r10
   14000489e:	mov    DWORD PTR [rbp-0x70],r11d
   1400048a2:	or     DWORD PTR [rbp-0x28],0x1000
   1400048a9:	mov    QWORD PTR [rbp-0x80],r9
   1400048ad:	mov    DWORD PTR [rbp-0x40],0x0
   1400048b4:	call   0x140007a48
   1400048b9:	mov    r9,QWORD PTR [rbp-0x80]
   1400048bd:	lea    rcx,[rbp-0x42]
   1400048c1:	mov    r8d,0x10
   1400048c7:	mov    rdx,QWORD PTR [rax+0x8]
   1400048cb:	call   0x1400077a0
   1400048d0:	mov    r11d,DWORD PTR [rbp-0x70]
   1400048d4:	mov    r10,QWORD PTR [rbp-0x88]
   1400048db:	test   eax,eax
   1400048dd:	jle    0x1400048e7
   1400048df:	movzx  edx,WORD PTR [rbp-0x42]
   1400048e3:	mov    WORD PTR [rbp-0x10],dx
   1400048e7:	movzx  edx,BYTE PTR [rsi+0x1]
   1400048eb:	mov    DWORD PTR [rbp-0x14],eax
   1400048ee:	mov    rsi,r12
   1400048f1:	jmp    0x140004357
   1400048f6:	test   r10,r10
   1400048f9:	je     0x1400046f8
   1400048ff:	test   ebx,0xfffffffd
   140004905:	jne    0x140004a26
   14000490b:	mov    eax,DWORD PTR [r14]
   14000490e:	lea    rcx,[r14+0x8]
   140004912:	mov    DWORD PTR [r10],eax
   140004915:	test   eax,eax
   140004917:	js     0x140004b84
   14000491d:	movzx  edx,BYTE PTR [rsi+0x1]
   140004921:	mov    r14,rcx
   140004924:	mov    rsi,r12
   140004927:	xor    r10d,r10d
   14000492a:	jmp    0x140004357
   14000492f:	test   ebx,ebx
   140004931:	jne    0x140004350
   140004937:	movzx  edx,BYTE PTR [rsi+0x1]
   14000493b:	or     DWORD PTR [rbp-0x28],0x100
   140004942:	mov    rsi,r12
   140004945:	jmp    0x140004357
   14000494a:	test   ebx,ebx
   14000494c:	jne    0x140004350
   140004952:	movzx  edx,BYTE PTR [rsi+0x1]
   140004956:	or     DWORD PTR [rbp-0x28],0x800
   14000495d:	mov    rsi,r12
   140004960:	jmp    0x140004357
   140004965:	mov    edx,ecx
   140004967:	mov    rax,QWORD PTR [rbp-0x80]
   14000496b:	and    dx,0x7fff
   140004970:	je     0x140004b64
   140004976:	cmp    dx,0x3c00
   14000497b:	jg     0x140004a7e
   140004981:	movsx  r8d,dx
   140004985:	mov    ecx,0x3c01
   14000498a:	sub    ecx,r8d
   14000498d:	shr    rax,cl
   140004990:	add    ecx,edx
   140004992:	lea    edx,[rcx-0x3ffc]
   140004998:	shr    rax,0x3
   14000499c:	mov    rcx,rax
   14000499f:	lea    r8,[rbp-0x30]
   1400049a3:	call   0x140003d20
   1400049a8:	jmp    0x140004660
   1400049ad:	lea    rsi,[r14+0x8]
   1400049b1:	mov    r14,QWORD PTR [r14]
   1400049b4:	lea    rax,[rip+0x49bd]        # 0x140009378
   1400049bb:	test   r14,r14
   1400049be:	cmove  r14,rax
   1400049c2:	mov    eax,DWORD PTR [rbp-0x20]
   1400049c5:	test   eax,eax
   1400049c7:	js     0x140004af6
   1400049cd:	movsxd rdx,eax
   1400049d0:	mov    rcx,r14
   1400049d3:	call   0x1400072e0
   1400049d8:	lea    r8,[rbp-0x30]
   1400049dc:	mov    rcx,r14
   1400049df:	mov    edx,eax
   1400049e1:	call   0x140002780
   1400049e6:	mov    r14,rsi
   1400049e9:	mov    r15,r12
   1400049ec:	jmp    0x1400042a6
   1400049f1:	cmp    ebx,0x3
   1400049f4:	ja     0x14000451a
   1400049fa:	mov    ecx,0x30
   1400049ff:	cmp    ebx,0x2
   140004a02:	mov    eax,0x3
   140004a07:	cmove  ebx,eax
   140004a0a:	jmp    0x140004332
   140004a0f:	lea    r8,[rbp-0x30]
   140004a13:	lea    rdx,[rip+0x496c]        # 0x140009386
   140004a1a:	xor    ecx,ecx
   140004a1c:	call   0x140002ac0
   140004a21:	jmp    0x140004660
   140004a26:	movzx  edx,BYTE PTR [rsi+0x1]
   140004a2a:	xor    r10d,r10d
   140004a2d:	mov    rsi,r12
   140004a30:	mov    ebx,0x4
   140004a35:	jmp    0x140004357
   140004a3a:	test   r8,r8
   140004a3d:	mov    eax,0xffffc002
   140004a42:	mov    rcx,r8
   140004a45:	cmovne edx,eax
   140004a48:	jmp    0x14000499f
   140004a4d:	mov    rsi,r12
   140004a50:	mov    r11d,0x3
   140004a56:	mov    ebx,0x4
   140004a5b:	jmp    0x140004357
   140004a60:	or     al,0x80
   140004a62:	mov    DWORD PTR [rbp-0x28],eax
   140004a65:	jmp    0x1400045a6
   140004a6a:	mov    eax,edi
   140004a6c:	mov    DWORD PTR [rbp-0x20],0x10
   140004a73:	or     ah,0x2
   140004a76:	mov    DWORD PTR [rbp-0x28],eax
   140004a79:	jmp    0x14000444c
   140004a7e:	test   dx,dx
   140004a81:	je     0x140004b64
   140004a87:	mov    ecx,edx
   140004a89:	jmp    0x140004992
   140004a8e:	xchg   ax,ax
   140004a90:	movsx  rcx,cx
   140004a94:	jmp    0x14000442b
   140004a99:	mov    QWORD PTR [rcx],rdx
   140004a9c:	jmp    0x140004660
   140004aa1:	sub    ecx,0x30
   140004aa4:	movzx  edx,BYTE PTR [rsi+0x1]
   140004aa8:	mov    rsi,r12
   140004aab:	mov    DWORD PTR [r10],ecx
   140004aae:	jmp    0x140004357
   140004ab3:	movzx  edx,BYTE PTR [rsi+0x1]
   140004ab7:	mov    DWORD PTR [rbp-0x20],0x0
   140004abe:	mov    rsi,r12
   140004ac1:	lea    r10,[rbp-0x20]
   140004ac5:	mov    ebx,0x2
   140004aca:	jmp    0x140004357
   140004acf:	mov    rax,QWORD PTR [r14]
   140004ad2:	jmp    0x1400043b8
   140004ad7:	movzx  edx,BYTE PTR [rsi+0x2]
   140004adb:	mov    r11d,0x5
   140004ae1:	add    rsi,0x2
   140004ae5:	mov    ebx,0x4
   140004aea:	jmp    0x140004357
   140004aef:	mov    BYTE PTR [rcx],dl
   140004af1:	jmp    0x140004660
   140004af6:	mov    rcx,r14
   140004af9:	call   0x140007a90
   140004afe:	lea    r8,[rbp-0x30]
   140004b02:	mov    rcx,r14
   140004b05:	mov    edx,eax
   140004b07:	call   0x140002780
   140004b0c:	jmp    0x1400049e6
   140004b11:	lea    rdx,[rbp-0x30]
   140004b15:	mov    rcx,rax
   140004b18:	call   0x140003080
   140004b1d:	jmp    0x140004660
   140004b22:	mov    rcx,QWORD PTR [r14]
   140004b25:	jmp    0x14000442b
   140004b2a:	cmp    BYTE PTR [rsi+0x2],0x34
   140004b2e:	jne    0x14000451a
   140004b34:	movzx  edx,BYTE PTR [rsi+0x3]
   140004b38:	mov    r11d,0x3
   140004b3e:	add    rsi,0x3
   140004b42:	mov    ebx,0x4
   140004b47:	jmp    0x140004357
   140004b4c:	movzx  edx,BYTE PTR [rsi+0x2]
   140004b50:	mov    r11d,0x3
   140004b56:	add    rsi,0x2
   140004b5a:	mov    ebx,0x4
   140004b5f:	jmp    0x140004357
   140004b64:	test   rax,rax
   140004b67:	mov    ecx,0xfffffc05
   140004b6c:	cmovne edx,ecx
   140004b6f:	jmp    0x140004998
   140004b74:	mov    WORD PTR [rcx],dx
   140004b77:	jmp    0x140004660
   140004b7c:	mov    eax,DWORD PTR [r14]
   140004b7f:	jmp    0x1400043b8
   140004b84:	test   ebx,ebx
   140004b86:	jne    0x140004baf
   140004b88:	or     DWORD PTR [rbp-0x28],0x400
   140004b8f:	neg    DWORD PTR [rbp-0x24]
   140004b92:	jmp    0x14000491d
   140004b97:	movzx  edx,BYTE PTR [rsi+0x3]
   140004b9b:	mov    r11d,0x2
   140004ba1:	add    rsi,0x3
   140004ba5:	mov    ebx,0x4
   140004baa:	jmp    0x140004357
   140004baf:	movzx  edx,BYTE PTR [rsi+0x1]
   140004bb3:	mov    r14,rcx
   140004bb6:	mov    rsi,r12
   140004bb9:	xor    r10d,r10d
   140004bbc:	mov    DWORD PTR [rbp-0x20],0xffffffff
   140004bc3:	mov    ebx,0x2
   140004bc8:	jmp    0x140004357
   140004bcd:	mov    ecx,r11d
   140004bd0:	lea    r8,[rbp-0x30]
   140004bd4:	lea    rdx,[rip+0x47af]        # 0x14000938a
   140004bdb:	and    ecx,0x8000
   140004be1:	call   0x140002ac0
   140004be6:	jmp    0x140004660
   140004beb:	nop
   140004bec:	nop
   140004bed:	nop
   140004bee:	nop
   140004bef:	nop
   140004bf0:	push   rbp
   140004bf1:	push   rbx
   140004bf2:	sub    rsp,0x28
   140004bf6:	lea    rbp,[rsp+0x20]
   140004bfb:	xor    ebx,ebx
   140004bfd:	cmp    ecx,0x1b
   140004c00:	jle    0x140004c1c
   140004c02:	mov    eax,0x4
   140004c07:	nop    WORD PTR [rax+rax*1+0x0]
   140004c10:	add    eax,eax
   140004c12:	add    ebx,0x1
   140004c15:	lea    edx,[rax+0x17]
   140004c18:	cmp    edx,ecx
   140004c1a:	jl     0x140004c10
   140004c1c:	mov    ecx,ebx
   140004c1e:	call   0x140006710
   140004c23:	mov    DWORD PTR [rax],ebx
   140004c25:	add    rax,0x4
   140004c29:	add    rsp,0x28
   140004c2d:	pop    rbx
   140004c2e:	pop    rbp
   140004c2f:	ret
   140004c30:	push   rbp
   140004c31:	push   rdi
   140004c32:	push   rsi
   140004c33:	push   rbx
   140004c34:	sub    rsp,0x28
   140004c38:	lea    rbp,[rsp+0x20]
   140004c3d:	mov    rdi,rcx
   140004c40:	mov    rsi,rdx
   140004c43:	cmp    r8d,0x1b
   140004c47:	jle    0x140004ca8
   140004c49:	mov    eax,0x4
   140004c4e:	xor    ebx,ebx
   140004c50:	add    eax,eax
   140004c52:	add    ebx,0x1
   140004c55:	lea    edx,[rax+0x17]
   140004c58:	cmp    r8d,edx
   140004c5b:	jg     0x140004c50
   140004c5d:	mov    ecx,ebx
   140004c5f:	call   0x140006710
   140004c64:	lea    rdx,[rdi+0x1]
   140004c68:	mov    DWORD PTR [rax],ebx
   140004c6a:	movzx  ecx,BYTE PTR [rdi]
   140004c6d:	lea    r8,[rax+0x4]
   140004c71:	mov    BYTE PTR [rax+0x4],cl
   140004c74:	mov    rax,r8
   140004c77:	test   cl,cl
   140004c79:	je     0x140004c91
   140004c7b:	nop    DWORD PTR [rax+rax*1+0x0]
   140004c80:	movzx  ecx,BYTE PTR [rdx]
   140004c83:	add    rax,0x1
   140004c87:	add    rdx,0x1
   140004c8b:	mov    BYTE PTR [rax],cl
   140004c8d:	test   cl,cl
   140004c8f:	jne    0x140004c80
   140004c91:	test   rsi,rsi
   140004c94:	je     0x140004c99
   140004c96:	mov    QWORD PTR [rsi],rax
   140004c99:	mov    rax,r8
   140004c9c:	add    rsp,0x28
   140004ca0:	pop    rbx
   140004ca1:	pop    rsi
   140004ca2:	pop    rdi
   140004ca3:	pop    rbp
   140004ca4:	ret
   140004ca5:	nop    DWORD PTR [rax]
   140004ca8:	xor    ebx,ebx
   140004caa:	jmp    0x140004c5d
   140004cac:	nop    DWORD PTR [rax+0x0]
   140004cb0:	mov    edx,0x1
   140004cb5:	mov    rax,rcx
   140004cb8:	mov    ecx,DWORD PTR [rcx-0x4]
   140004cbb:	shl    edx,cl
   140004cbd:	movd   xmm0,ecx
   140004cc1:	lea    rcx,[rax-0x4]
   140004cc5:	movd   xmm1,edx
   140004cc9:	punpckldq xmm0,xmm1
   140004ccd:	movq   QWORD PTR [rax+0x4],xmm0
   140004cd2:	jmp    0x140006810
   140004cd7:	nop    WORD PTR [rax+rax*1+0x0]
   140004ce0:	push   rbp
   140004ce1:	push   r15
   140004ce3:	push   r14
   140004ce5:	push   r13
   140004ce7:	push   r12
   140004ce9:	push   rdi
   140004cea:	push   rsi
   140004ceb:	push   rbx
   140004cec:	sub    rsp,0x38
   140004cf0:	lea    rbp,[rsp+0x30]
   140004cf5:	xor    eax,eax
   140004cf7:	mov    esi,DWORD PTR [rdx+0x14]
   140004cfa:	mov    r13,rcx
   140004cfd:	mov    r11,rdx
   140004d00:	cmp    DWORD PTR [rcx+0x14],esi
   140004d03:	jl     0x140004df3
   140004d09:	sub    esi,0x1
   140004d0c:	lea    rbx,[rdx+0x18]
   140004d10:	lea    r12,[rcx+0x18]
   140004d14:	xor    edx,edx
   140004d16:	movsxd r10,esi
   140004d19:	shl    r10,0x2
   140004d1d:	lea    rdi,[rbx+r10*1]
   140004d21:	add    r10,r12
   140004d24:	mov    eax,DWORD PTR [rdi]
   140004d26:	mov    r8d,DWORD PTR [r10]
   140004d29:	lea    ecx,[rax+0x1]
   140004d2c:	mov    eax,r8d
   140004d2f:	div    ecx
   140004d31:	mov    DWORD PTR [rbp-0x8],eax
   140004d34:	mov    DWORD PTR [rbp-0x4],eax
   140004d37:	cmp    r8d,ecx
   140004d3a:	jb     0x140004d96
   140004d3c:	mov    r15d,eax
   140004d3f:	mov    r9,rbx
   140004d42:	mov    r8,r12
   140004d45:	xor    r14d,r14d
   140004d48:	xor    ecx,ecx
   140004d4a:	nop    WORD PTR [rax+rax*1+0x0]
   140004d50:	mov    eax,DWORD PTR [r9]
   140004d53:	mov    edx,DWORD PTR [r8]
   140004d56:	add    r9,0x4
   140004d5a:	add    r8,0x4
   140004d5e:	imul   rax,r15
   140004d62:	add    rax,r14
   140004d65:	mov    r14,rax
   140004d68:	mov    eax,eax
   140004d6a:	sub    rdx,rax
   140004d6d:	shr    r14,0x20
   140004d71:	mov    rax,rdx
   140004d74:	sub    rax,rcx
   140004d77:	mov    rcx,rax
   140004d7a:	mov    DWORD PTR [r8-0x4],eax
   140004d7e:	shr    rcx,0x20
   140004d82:	and    ecx,0x1
   140004d85:	cmp    rdi,r9
   140004d88:	jae    0x140004d50
   140004d8a:	mov    r9d,DWORD PTR [r10]
   140004d8d:	test   r9d,r9d
   140004d90:	je     0x140004e3b
   140004d96:	mov    rdx,r11
   140004d99:	mov    rcx,r13
   140004d9c:	call   0x140006e30
   140004da1:	test   eax,eax
   140004da3:	js     0x140004df0
   140004da5:	mov    rcx,r12
   140004da8:	xor    edx,edx
   140004daa:	nop    WORD PTR [rax+rax*1+0x0]
   140004db0:	mov    eax,DWORD PTR [rcx]
   140004db2:	mov    r8d,DWORD PTR [rbx]
   140004db5:	add    rbx,0x4
   140004db9:	add    rcx,0x4
   140004dbd:	sub    rax,r8
   140004dc0:	sub    rax,rdx
   140004dc3:	mov    rdx,rax
   140004dc6:	mov    DWORD PTR [rcx-0x4],eax
   140004dc9:	shr    rdx,0x20
   140004dcd:	and    edx,0x1
   140004dd0:	cmp    rdi,rbx
   140004dd3:	jae    0x140004db0
   140004dd5:	movsxd rax,esi
   140004dd8:	lea    rax,[r12+rax*4]
   140004ddc:	mov    ecx,DWORD PTR [rax]
   140004dde:	test   ecx,ecx
   140004de0:	je     0x140004e11
   140004de2:	mov    eax,DWORD PTR [rbp-0x8]
   140004de5:	add    eax,0x1
   140004de8:	mov    DWORD PTR [rbp-0x4],eax
   140004deb:	nop    DWORD PTR [rax+rax*1+0x0]
   140004df0:	mov    eax,DWORD PTR [rbp-0x4]
   140004df3:	add    rsp,0x38
   140004df7:	pop    rbx
   140004df8:	pop    rsi
   140004df9:	pop    rdi
   140004dfa:	pop    r12
   140004dfc:	pop    r13
   140004dfe:	pop    r14
   140004e00:	pop    r15
   140004e02:	pop    rbp
   140004e03:	ret
   140004e04:	nop    DWORD PTR [rax+0x0]
   140004e08:	mov    edx,DWORD PTR [rax]
   140004e0a:	test   edx,edx
   140004e0c:	jne    0x140004e1a
   140004e0e:	sub    esi,0x1
   140004e11:	sub    rax,0x4
   140004e15:	cmp    r12,rax
   140004e18:	jb     0x140004e08
   140004e1a:	mov    eax,DWORD PTR [rbp-0x8]
   140004e1d:	mov    DWORD PTR [r13+0x14],esi
   140004e21:	add    eax,0x1
   140004e24:	mov    DWORD PTR [rbp-0x4],eax
   140004e27:	jmp    0x140004df0
   140004e29:	nop    DWORD PTR [rax+0x0]
   140004e30:	mov    r8d,DWORD PTR [r10]
   140004e33:	test   r8d,r8d
   140004e36:	jne    0x140004e44
   140004e38:	sub    esi,0x1
   140004e3b:	sub    r10,0x4
   140004e3f:	cmp    r12,r10
   140004e42:	jb     0x140004e30
   140004e44:	mov    DWORD PTR [r13+0x14],esi
   140004e48:	mov    rdx,r11
   140004e4b:	mov    rcx,r13
   140004e4e:	call   0x140006e30
   140004e53:	test   eax,eax
   140004e55:	jns    0x140004da5
   140004e5b:	jmp    0x140004df0
   140004e5d:	nop
   140004e5e:	nop
   140004e5f:	nop
   140004e60:	push   rbp
   140004e61:	push   r15
   140004e63:	push   r14
   140004e65:	push   r13
   140004e67:	push   r12
   140004e69:	push   rdi
   140004e6a:	push   rsi
   140004e6b:	push   rbx
   140004e6c:	sub    rsp,0xc8
   140004e73:	lea    rbp,[rsp+0xc0]
   140004e7b:	mov    eax,DWORD PTR [rbp+0x70]
   140004e7e:	mov    edi,DWORD PTR [r9]
   140004e81:	mov    DWORD PTR [rbp-0x28],eax
   140004e84:	mov    eax,DWORD PTR [rbp+0x78]
   140004e87:	mov    r12,rcx
   140004e8a:	mov    rsi,r8
   140004e8d:	mov    DWORD PTR [rbp-0x30],edx
   140004e90:	mov    r15,r9
   140004e93:	mov    DWORD PTR [rbp-0x34],eax
   140004e96:	mov    rax,QWORD PTR [rbp+0x80]
   140004e9d:	mov    QWORD PTR [rbp-0x18],rax
   140004ea1:	mov    rax,QWORD PTR [rbp+0x88]
   140004ea8:	mov    QWORD PTR [rbp-0x20],rax
   140004eac:	mov    eax,edi
   140004eae:	and    eax,0xffffffcf
   140004eb1:	mov    DWORD PTR [r9],eax
   140004eb4:	mov    eax,edi
   140004eb6:	and    eax,0x7
   140004eb9:	cmp    eax,0x3
   140004ebc:	je     0x140005188
   140004ec2:	mov    ebx,edi
   140004ec4:	and    ebx,0x4
   140004ec7:	mov    DWORD PTR [rbp-0x40],ebx
   140004eca:	jne    0x140005100
   140004ed0:	test   eax,eax
   140004ed2:	je     0x140005148
   140004ed8:	mov    r13d,DWORD PTR [rcx]
   140004edb:	mov    eax,0x20
   140004ee0:	xor    ecx,ecx
   140004ee2:	cmp    r13d,0x20
   140004ee6:	jle    0x140004efa
   140004ee8:	nop    DWORD PTR [rax+rax*1+0x0]
   140004ef0:	add    eax,eax
   140004ef2:	add    ecx,0x1
   140004ef5:	cmp    r13d,eax
   140004ef8:	jg     0x140004ef0
   140004efa:	call   0x140006710
   140004eff:	lea    r8d,[r13-0x1]
   140004f03:	sar    r8d,0x5
   140004f07:	mov    rbx,rax
   140004f0a:	lea    rdx,[rax+0x18]
   140004f0e:	mov    rax,rsi
   140004f11:	movsxd r8,r8d
   140004f14:	lea    rcx,[rsi+r8*4]
   140004f18:	nop    DWORD PTR [rax+rax*1+0x0]
   140004f20:	mov    r9d,DWORD PTR [rax]
   140004f23:	add    rax,0x4
   140004f27:	add    rdx,0x4
   140004f2b:	mov    DWORD PTR [rdx-0x4],r9d
   140004f2f:	cmp    rcx,rax
   140004f32:	jae    0x140004f20
   140004f34:	lea    rdx,[rsi+0x1]
   140004f38:	add    rcx,0x1
   140004f3c:	lea    rax,[r8*4+0x4]
   140004f44:	cmp    rcx,rdx
   140004f47:	mov    edx,0x4
   140004f4c:	cmovb  rax,rdx
   140004f50:	mov    r14,rax
   140004f53:	add    rax,rbx
   140004f56:	sar    r14,0x2
   140004f5a:	jmp    0x140004f6d
   140004f5c:	nop    DWORD PTR [rax+0x0]
   140004f60:	sub    rax,0x4
   140004f64:	test   r14d,r14d
   140004f67:	je     0x1400051b0
   140004f6d:	mov    r11d,DWORD PTR [rax+0x14]
   140004f71:	mov    edx,r14d
   140004f74:	sub    r14d,0x1
   140004f78:	test   r11d,r11d
   140004f7b:	je     0x140004f60
   140004f7d:	movsxd r14,r14d
   140004f80:	mov    DWORD PTR [rbx+0x14],edx
   140004f83:	shl    edx,0x5
   140004f86:	bsr    eax,DWORD PTR [rbx+r14*4+0x18]
   140004f8c:	xor    eax,0x1f
   140004f8f:	sub    edx,eax
   140004f91:	mov    r14d,edx
   140004f94:	mov    rcx,rbx
   140004f97:	call   0x140006590
   140004f9c:	mov    ecx,DWORD PTR [rbp-0x30]
   140004f9f:	mov    DWORD PTR [rbp-0x4],eax
   140004fa2:	mov    DWORD PTR [rbp-0x58],ecx
   140004fa5:	test   eax,eax
   140004fa7:	jne    0x1400051c0
   140004fad:	mov    r10d,DWORD PTR [rbx+0x14]
   140004fb1:	test   r10d,r10d
   140004fb4:	je     0x140005140
   140004fba:	lea    rdx,[rbp-0x4]
   140004fbe:	mov    rcx,rbx
   140004fc1:	call   0x140007050
   140004fc6:	mov    eax,DWORD PTR [rbp-0x58]
   140004fc9:	pxor   xmm1,xmm1
   140004fcd:	movq   r10,xmm0
   140004fd2:	mov    rdx,r10
   140004fd5:	lea    r8d,[rax+r14*1]
   140004fd9:	mov    eax,r10d
   140004fdc:	shr    rdx,0x20
   140004fe0:	lea    ecx,[r8-0x1]
   140004fe4:	and    edx,0xfffff
   140004fea:	cvtsi2sd xmm1,ecx
   140004fee:	mulsd  xmm1,QWORD PTR [rip+0x4532]        # 0x140009528
   140004ff6:	or     edx,0x3ff00000
   140004ffc:	mov    r9,rdx
   140004fff:	shl    r9,0x20
   140005003:	or     rax,r9
   140005006:	mov    r9d,0x1
   14000500c:	sub    r9d,r8d
   14000500f:	movq   xmm0,rax
   140005014:	test   ecx,ecx
   140005016:	subsd  xmm0,QWORD PTR [rip+0x44f2]        # 0x140009510
   14000501e:	mulsd  xmm0,QWORD PTR [rip+0x44f2]        # 0x140009518
   140005026:	cmovns r9d,ecx
   14000502a:	addsd  xmm0,QWORD PTR [rip+0x44ee]        # 0x140009520
   140005032:	sub    r9d,0x435
   140005039:	addsd  xmm0,xmm1
   14000503d:	test   r9d,r9d
   140005040:	jle    0x140005057
   140005042:	pxor   xmm1,xmm1
   140005046:	cvtsi2sd xmm1,r9d
   14000504b:	mulsd  xmm1,QWORD PTR [rip+0x44dd]        # 0x140009530
   140005053:	addsd  xmm0,xmm1
   140005057:	pxor   xmm1,xmm1
   14000505b:	cvttsd2si r11d,xmm0
   140005060:	comisd xmm1,xmm0
   140005064:	ja     0x140005510
   14000506a:	mov    r9d,ecx
   14000506d:	mov    eax,eax
   14000506f:	shl    r9d,0x14
   140005073:	add    edx,r9d
   140005076:	mov    edx,edx
   140005078:	shl    rdx,0x20
   14000507c:	or     rax,rdx
   14000507f:	mov    QWORD PTR [rbp-0x98],rax
   140005086:	mov    r9,rax
   140005089:	mov    r10,rax
   14000508c:	mov    eax,r14d
   14000508f:	sub    eax,ecx
   140005091:	lea    edx,[rax-0x1]
   140005094:	mov    DWORD PTR [rbp-0x50],edx
   140005097:	cmp    r11d,0x16
   14000509b:	ja     0x1400051e0
   1400050a1:	mov    rcx,QWORD PTR [rip+0x4768]        # 0x140009810
   1400050a8:	movsxd rdx,r11d
   1400050ab:	movq   xmm5,r9
   1400050b0:	movsd  xmm0,QWORD PTR [rcx+rdx*8]
   1400050b5:	comisd xmm0,xmm5
   1400050b9:	ja     0x140005570
   1400050bf:	mov    DWORD PTR [rbp-0x7c],0x0
   1400050c6:	mov    DWORD PTR [rbp-0x68],0x0
   1400050cd:	test   eax,eax
   1400050cf:	jg     0x1400050e8
   1400050d1:	mov    edx,0x1
   1400050d6:	mov    DWORD PTR [rbp-0x50],0x0
   1400050dd:	sub    edx,eax
   1400050df:	mov    DWORD PTR [rbp-0x68],edx
   1400050e2:	nop    WORD PTR [rax+rax*1+0x0]
   1400050e8:	add    DWORD PTR [rbp-0x50],r11d
   1400050ec:	mov    DWORD PTR [rbp-0x70],r11d
   1400050f0:	mov    DWORD PTR [rbp-0x74],0x0
   1400050f7:	jmp    0x140005224
   1400050fc:	nop    DWORD PTR [rax+0x0]
   140005100:	xor    esi,esi
   140005102:	cmp    eax,0x4
   140005105:	jne    0x14000516b
   140005107:	mov    rax,QWORD PTR [rbp-0x18]
   14000510b:	mov    rdx,QWORD PTR [rbp-0x20]
   14000510f:	mov    r8d,0x3
   140005115:	lea    rcx,[rip+0x43ed]        # 0x140009509
   14000511c:	mov    DWORD PTR [rax],0xffff8000
   140005122:	add    rsp,0xc8
   140005129:	pop    rbx
   14000512a:	pop    rsi
   14000512b:	pop    rdi
   14000512c:	pop    r12
   14000512e:	pop    r13
   140005130:	pop    r14
   140005132:	pop    r15
   140005134:	pop    rbp
   140005135:	jmp    0x140004c30
   14000513a:	nop    WORD PTR [rax+rax*1+0x0]
   140005140:	mov    rcx,rbx
   140005143:	call   0x140006810
   140005148:	mov    rax,QWORD PTR [rbp-0x18]
   14000514c:	mov    rdx,QWORD PTR [rbp-0x20]
   140005150:	mov    r8d,0x1
   140005156:	lea    rcx,[rip+0x43b0]        # 0x14000950d
   14000515d:	mov    DWORD PTR [rax],0x1
   140005163:	call   0x140004c30
   140005168:	mov    rsi,rax
   14000516b:	mov    rax,rsi
   14000516e:	add    rsp,0xc8
   140005175:	pop    rbx
   140005176:	pop    rsi
   140005177:	pop    rdi
   140005178:	pop    r12
   14000517a:	pop    r13
   14000517c:	pop    r14
   14000517e:	pop    r15
   140005180:	pop    rbp
   140005181:	ret
   140005182:	nop    WORD PTR [rax+rax*1+0x0]
   140005188:	mov    rax,QWORD PTR [rbp-0x18]
   14000518c:	mov    rdx,QWORD PTR [rbp-0x20]
   140005190:	mov    r8d,0x8
   140005196:	lea    rcx,[rip+0x4363]        # 0x140009500
   14000519d:	mov    DWORD PTR [rax],0xffff8000
   1400051a3:	jmp    0x140005122
   1400051a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400051b0:	mov    DWORD PTR [rbx+0x14],0x0
   1400051b7:	jmp    0x140004f94
   1400051bc:	nop    DWORD PTR [rax+0x0]
   1400051c0:	mov    edx,eax
   1400051c2:	mov    rcx,rbx
   1400051c5:	call   0x140006480
   1400051ca:	mov    eax,DWORD PTR [rbp-0x4]
   1400051cd:	mov    edx,DWORD PTR [rbp-0x30]
   1400051d0:	add    edx,eax
   1400051d2:	sub    r14d,eax
   1400051d5:	mov    DWORD PTR [rbp-0x58],edx
   1400051d8:	jmp    0x140004fad
   1400051dd:	nop    DWORD PTR [rax]
   1400051e0:	mov    DWORD PTR [rbp-0x7c],0x1
   1400051e7:	mov    r9d,DWORD PTR [rbp-0x50]
   1400051eb:	mov    DWORD PTR [rbp-0x68],0x0
   1400051f2:	test   r9d,r9d
   1400051f5:	jns    0x140005208
   1400051f7:	mov    edx,0x1
   1400051fc:	mov    DWORD PTR [rbp-0x50],0x0
   140005203:	sub    edx,eax
   140005205:	mov    DWORD PTR [rbp-0x68],edx
   140005208:	test   r11d,r11d
   14000520b:	jns    0x1400050e8
   140005211:	mov    eax,r11d
   140005214:	sub    DWORD PTR [rbp-0x68],r11d
   140005218:	neg    eax
   14000521a:	mov    DWORD PTR [rbp-0x70],r11d
   14000521e:	xor    r11d,r11d
   140005221:	mov    DWORD PTR [rbp-0x74],eax
   140005224:	mov    eax,DWORD PTR [rbp-0x28]
   140005227:	cmp    eax,0x9
   14000522a:	ja     0x140005480
   140005230:	cmp    eax,0x5
   140005233:	jg     0x140005530
   140005239:	add    r8d,0x3fd
   140005240:	xor    eax,eax
   140005242:	cmp    r8d,0x7f7
   140005249:	setbe  al
   14000524c:	mov    DWORD PTR [rbp-0x8c],eax
   140005252:	mov    eax,DWORD PTR [rbp-0x28]
   140005255:	cmp    eax,0x4
   140005258:	je     0x1400058a4
   14000525e:	cmp    eax,0x5
   140005261:	je     0x140005cbf
   140005267:	mov    DWORD PTR [rbp-0x78],0x0
   14000526e:	cmp    eax,0x2
   140005271:	je     0x1400058ab
   140005277:	cmp    eax,0x3
   14000527a:	jne    0x1400054a0
   140005280:	mov    ecx,DWORD PTR [rbp-0x34]
   140005283:	mov    eax,DWORD PTR [rbp-0x70]
   140005286:	add    eax,ecx
   140005288:	lea    edx,[rax+0x1]
   14000528b:	mov    DWORD PTR [rbp-0x90],eax
   140005291:	mov    eax,0x1
   140005296:	test   edx,edx
   140005298:	mov    DWORD PTR [rbp-0x48],edx
   14000529b:	cmovg  eax,edx
   14000529e:	mov    ecx,eax
   1400052a0:	mov    QWORD PTR [rbp-0x88],r10
   1400052a7:	mov    DWORD PTR [rbp-0x80],r11d
   1400052ab:	mov    DWORD PTR [rbp-0x4],eax
   1400052ae:	call   0x140004bf0
   1400052b3:	mov    r11d,DWORD PTR [rbp-0x80]
   1400052b7:	mov    r10,QWORD PTR [rbp-0x88]
   1400052be:	mov    QWORD PTR [rbp-0x60],rax
   1400052c2:	mov    eax,DWORD PTR [r12+0xc]
   1400052c7:	sub    eax,0x1
   1400052ca:	mov    DWORD PTR [rbp-0x38],eax
   1400052cd:	je     0x1400052f4
   1400052cf:	mov    ecx,DWORD PTR [rbp-0x38]
   1400052d2:	mov    eax,0x2
   1400052d7:	test   ecx,ecx
   1400052d9:	cmovns eax,ecx
   1400052dc:	and    edi,0x8
   1400052df:	mov    DWORD PTR [rbp-0x38],eax
   1400052e2:	mov    edx,eax
   1400052e4:	je     0x1400056c0
   1400052ea:	mov    eax,0x3
   1400052ef:	sub    eax,edx
   1400052f1:	mov    DWORD PTR [rbp-0x38],eax
   1400052f4:	mov    ecx,DWORD PTR [rbp-0x48]
   1400052f7:	movzx  edi,BYTE PTR [rbp-0x8c]
   1400052fe:	cmp    ecx,0xe
   140005301:	setbe  al
   140005304:	and    dil,al
   140005307:	je     0x1400056c0
   14000530d:	mov    eax,DWORD PTR [rbp-0x70]
   140005310:	or     eax,DWORD PTR [rbp-0x38]
   140005313:	jne    0x1400056c0
   140005319:	mov    r8d,DWORD PTR [rbp-0x7c]
   14000531d:	mov    DWORD PTR [rbp-0x4],0x0
   140005324:	movsd  xmm0,QWORD PTR [rbp-0x98]
   14000532c:	test   r8d,r8d
   14000532f:	je     0x140005343
   140005331:	movsd  xmm4,QWORD PTR [rip+0x4207]        # 0x140009540
   140005339:	comisd xmm4,xmm0
   14000533d:	ja     0x1400060ad
   140005343:	movupd xmm1,xmm0
   140005347:	mov    ecx,DWORD PTR [rbp-0x48]
   14000534a:	addsd  xmm1,xmm0
   14000534e:	addsd  xmm1,QWORD PTR [rip+0x4202]        # 0x140009558
   140005356:	movq   rdx,xmm1
   14000535b:	mov    rax,rdx
   14000535e:	mov    edx,edx
   140005360:	shr    rax,0x20
   140005364:	sub    eax,0x3400000
   140005369:	shl    rax,0x20
   14000536d:	or     rdx,rax
   140005370:	test   ecx,ecx
   140005372:	je     0x14000568f
   140005378:	mov    eax,DWORD PTR [rbp-0x48]
   14000537b:	xor    r8d,r8d
   14000537e:	mov    rcx,QWORD PTR [rip+0x448b]        # 0x140009810
   140005385:	movq   xmm2,rdx
   14000538a:	lea    edx,[rax-0x1]
   14000538d:	movsxd rdx,edx
   140005390:	movsd  xmm3,QWORD PTR [rcx+rdx*8]
   140005395:	mov    edx,DWORD PTR [rbp-0x78]
   140005398:	test   edx,edx
   14000539a:	je     0x140005ccb
   1400053a0:	movsd  xmm1,QWORD PTR [rip+0x41d8]        # 0x140009580
   1400053a8:	cvttsd2si ecx,xmm0
   1400053ac:	mov    rdi,QWORD PTR [rbp-0x60]
   1400053b0:	divsd  xmm1,xmm3
   1400053b4:	lea    rdx,[rdi+0x1]
   1400053b8:	subsd  xmm1,xmm2
   1400053bc:	pxor   xmm2,xmm2
   1400053c0:	cvtsi2sd xmm2,ecx
   1400053c4:	add    ecx,0x30
   1400053c7:	mov    BYTE PTR [rdi],cl
   1400053c9:	subsd  xmm0,xmm2
   1400053cd:	comisd xmm1,xmm0
   1400053d1:	ja     0x1400062ad
   1400053d7:	movsd  xmm4,QWORD PTR [rip+0x4161]        # 0x140009540
   1400053df:	movsd  xmm3,QWORD PTR [rip+0x4161]        # 0x140009548
   1400053e7:	jmp    0x14000542d
   1400053e9:	nop    DWORD PTR [rax+0x0]
   1400053f0:	mov    edi,DWORD PTR [rbp-0x4]
   1400053f3:	lea    ecx,[rdi+0x1]
   1400053f6:	mov    DWORD PTR [rbp-0x4],ecx
   1400053f9:	cmp    ecx,eax
   1400053fb:	jge    0x1400056b8
   140005401:	mulsd  xmm0,xmm3
   140005405:	pxor   xmm2,xmm2
   140005409:	add    rdx,0x1
   14000540d:	mulsd  xmm1,xmm3
   140005411:	cvttsd2si ecx,xmm0
   140005415:	cvtsi2sd xmm2,ecx
   140005419:	add    ecx,0x30
   14000541c:	mov    BYTE PTR [rdx-0x1],cl
   14000541f:	subsd  xmm0,xmm2
   140005423:	comisd xmm1,xmm0
   140005427:	ja     0x1400062ad
   14000542d:	movupd xmm2,xmm4
   140005431:	subsd  xmm2,xmm0
   140005435:	comisd xmm1,xmm2
   140005439:	jbe    0x1400053f0
   14000543b:	movzx  ecx,BYTE PTR [rdx-0x1]
   14000543f:	mov    rsi,QWORD PTR [rbp-0x60]
   140005443:	jmp    0x140005458
   140005445:	nop    DWORD PTR [rax]
   140005448:	cmp    rax,rsi
   14000544b:	je     0x1400061a7
   140005451:	movzx  ecx,BYTE PTR [rax-0x1]
   140005455:	mov    rdx,rax
   140005458:	lea    rax,[rdx-0x1]
   14000545c:	cmp    cl,0x39
   14000545f:	je     0x140005448
   140005461:	mov    QWORD PTR [rbp-0x60],rdx
   140005465:	add    ecx,0x1
   140005468:	mov    BYTE PTR [rax],cl
   14000546a:	lea    eax,[r8+0x1]
   14000546e:	mov    DWORD PTR [rbp-0x34],eax
   140005471:	mov    DWORD PTR [rbp-0x40],0x20
   140005478:	jmp    0x140005636
   14000547d:	nop    DWORD PTR [rax]
   140005480:	add    r8d,0x3fd
   140005487:	xor    eax,eax
   140005489:	mov    DWORD PTR [rbp-0x28],0x0
   140005490:	cmp    r8d,0x7f7
   140005497:	setbe  al
   14000549a:	mov    DWORD PTR [rbp-0x8c],eax
   1400054a0:	pxor   xmm0,xmm0
   1400054a4:	mov    QWORD PTR [rbp-0x48],r10
   1400054a8:	cvtsi2sd xmm0,r13d
   1400054ad:	mulsd  xmm0,QWORD PTR [rip+0x4083]        # 0x140009538
   1400054b5:	mov    DWORD PTR [rbp-0x34],r11d
   1400054b9:	cvttsd2si ecx,xmm0
   1400054bd:	add    ecx,0x3
   1400054c0:	mov    DWORD PTR [rbp-0x4],ecx
   1400054c3:	call   0x140004bf0
   1400054c8:	mov    r11d,DWORD PTR [rbp-0x34]
   1400054cc:	mov    r10,QWORD PTR [rbp-0x48]
   1400054d0:	mov    QWORD PTR [rbp-0x60],rax
   1400054d4:	mov    eax,DWORD PTR [r12+0xc]
   1400054d9:	sub    eax,0x1
   1400054dc:	mov    DWORD PTR [rbp-0x38],eax
   1400054df:	je     0x140005580
   1400054e5:	mov    DWORD PTR [rbp-0x34],0x0
   1400054ec:	mov    DWORD PTR [rbp-0x78],0x1
   1400054f3:	mov    DWORD PTR [rbp-0x90],0xffffffff
   1400054fd:	mov    DWORD PTR [rbp-0x48],0xffffffff
   140005504:	jmp    0x1400052cf
   140005509:	nop    DWORD PTR [rax+0x0]
   140005510:	pxor   xmm1,xmm1
   140005514:	cvtsi2sd xmm1,r11d
   140005519:	ucomisd xmm1,xmm0
   14000551d:	jp     0x140005525
   14000551f:	je     0x14000506a
   140005525:	sub    r11d,0x1
   140005529:	jmp    0x14000506a
   14000552e:	xchg   ax,ax
   140005530:	mov    DWORD PTR [rbp-0x8c],0x0
   14000553a:	sub    eax,0x4
   14000553d:	mov    DWORD PTR [rbp-0x28],eax
   140005540:	cmp    eax,0x4
   140005543:	je     0x1400058a4
   140005549:	cmp    eax,0x5
   14000554c:	je     0x140005cbf
   140005552:	mov    DWORD PTR [rbp-0x78],0x0
   140005559:	cmp    eax,0x2
   14000555c:	je     0x1400058ab
   140005562:	mov    DWORD PTR [rbp-0x28],0x3
   140005569:	jmp    0x140005280
   14000556e:	xchg   ax,ax
   140005570:	mov    DWORD PTR [rbp-0x7c],0x0
   140005577:	sub    r11d,0x1
   14000557b:	jmp    0x1400051e7
   140005580:	mov    eax,DWORD PTR [rbp-0x58]
   140005583:	mov    DWORD PTR [rbp-0x34],0x0
   14000558a:	test   eax,eax
   14000558c:	js     0x14000622e
   140005592:	mov    DWORD PTR [rbp-0x78],0x1
   140005599:	mov    DWORD PTR [rbp-0x90],0xffffffff
   1400055a3:	mov    DWORD PTR [rbp-0x48],0xffffffff
   1400055aa:	nop    WORD PTR [rax+rax*1+0x0]
   1400055b0:	mov    eax,DWORD PTR [rbp-0x70]
   1400055b3:	cmp    DWORD PTR [r12+0x14],eax
   1400055b8:	jl     0x1400056cb
   1400055be:	mov    rdx,QWORD PTR [rip+0x424b]        # 0x140009810
   1400055c5:	mov    r12d,DWORD PTR [rbp-0x34]
   1400055c9:	cdqe
   1400055cb:	mov    rsi,rax
   1400055ce:	movsd  xmm2,QWORD PTR [rdx+rax*8]
   1400055d3:	test   r12d,r12d
   1400055d6:	jns    0x140005d8c
   1400055dc:	mov    eax,DWORD PTR [rbp-0x48]
   1400055df:	test   eax,eax
   1400055e1:	jg     0x140005d8c
   1400055e7:	jne    0x1400058cb
   1400055ed:	mulsd  xmm2,QWORD PTR [rip+0x3f6b]        # 0x140009560
   1400055f5:	comisd xmm2,QWORD PTR [rbp-0x98]
   1400055fd:	jae    0x1400058cb
   140005603:	add    esi,0x2
   140005606:	xor    r9d,r9d
   140005609:	xor    edi,edi
   14000560b:	mov    DWORD PTR [rbp-0x34],esi
   14000560e:	mov    rsi,QWORD PTR [rbp-0x60]
   140005612:	add    QWORD PTR [rbp-0x60],0x1
   140005617:	mov    BYTE PTR [rsi],0x31
   14000561a:	mov    DWORD PTR [rbp-0x40],0x20
   140005621:	mov    rcx,r9
   140005624:	call   0x140006810
   140005629:	test   rdi,rdi
   14000562c:	je     0x140005636
   14000562e:	mov    rcx,rdi
   140005631:	call   0x140006810
   140005636:	mov    rcx,rbx
   140005639:	call   0x140006810
   14000563e:	mov    ebx,DWORD PTR [rbp-0x34]
   140005641:	mov    rax,QWORD PTR [rbp-0x60]
   140005645:	mov    rdi,QWORD PTR [rbp-0x18]
   140005649:	mov    BYTE PTR [rax],0x0
   14000564c:	mov    DWORD PTR [rdi],ebx
   14000564e:	mov    rbx,QWORD PTR [rbp-0x20]
   140005652:	test   rbx,rbx
   140005655:	je     0x14000565a
   140005657:	mov    QWORD PTR [rbx],rax
   14000565a:	mov    eax,DWORD PTR [rbp-0x40]
   14000565d:	or     DWORD PTR [r15],eax
   140005660:	jmp    0x14000516b
   140005665:	movupd xmm1,xmm0
   140005669:	addsd  xmm1,xmm0
   14000566d:	addsd  xmm1,QWORD PTR [rip+0x3ee3]        # 0x140009558
   140005675:	movq   rdx,xmm1
   14000567a:	mov    rax,rdx
   14000567d:	mov    edx,edx
   14000567f:	shr    rax,0x20
   140005683:	sub    eax,0x3400000
   140005688:	shl    rax,0x20
   14000568c:	or     rdx,rax
   14000568f:	subsd  xmm0,QWORD PTR [rip+0x3ec9]        # 0x140009560
   140005697:	movq   xmm1,rdx
   14000569c:	comisd xmm0,xmm1
   1400056a0:	ja     0x14000614c
   1400056a6:	xorpd  xmm1,XMMWORD PTR [rip+0x3ec2]        # 0x140009570
   1400056ae:	comisd xmm1,xmm0
   1400056b2:	ja     0x1400058cb
   1400056b8:	mov    DWORD PTR [rbp-0x38],0x0
   1400056bf:	nop
   1400056c0:	mov    eax,DWORD PTR [rbp-0x58]
   1400056c3:	test   eax,eax
   1400056c5:	jns    0x1400055b0
   1400056cb:	mov    edi,DWORD PTR [rbp-0x78]
   1400056ce:	test   edi,edi
   1400056d0:	je     0x1400058f0
   1400056d6:	mov    edi,DWORD PTR [rbp-0x58]
   1400056d9:	sub    r13d,r14d
   1400056dc:	mov    edx,DWORD PTR [r12+0x4]
   1400056e1:	lea    eax,[r13+0x1]
   1400056e5:	mov    ecx,edi
   1400056e7:	mov    DWORD PTR [rbp-0x4],eax
   1400056ea:	sub    ecx,r13d
   1400056ed:	cmp    ecx,edx
   1400056ef:	jge    0x140005c80
   1400056f5:	mov    ecx,DWORD PTR [rbp-0x28]
   1400056f8:	lea    eax,[rcx-0x3]
   1400056fb:	and    eax,0xfffffffd
   1400056fe:	je     0x140005c8a
   140005704:	mov    eax,edi
   140005706:	mov    edi,DWORD PTR [rbp-0x48]
   140005709:	sub    eax,edx
   14000570b:	add    eax,0x1
   14000570e:	cmp    ecx,0x1
   140005711:	setg   cl
   140005714:	test   edi,edi
   140005716:	mov    DWORD PTR [rbp-0x4],eax
   140005719:	setg   dl
   14000571c:	test   cl,dl
   14000571e:	je     0x140005728
   140005720:	cmp    eax,edi
   140005722:	jg     0x140006389
   140005728:	mov    edi,DWORD PTR [rbp-0x68]
   14000572b:	add    DWORD PTR [rbp-0x50],eax
   14000572e:	mov    r8d,DWORD PTR [rbp-0x74]
   140005732:	add    eax,edi
   140005734:	mov    r13d,edi
   140005737:	mov    DWORD PTR [rbp-0x68],eax
   14000573a:	mov    ecx,0x1
   14000573f:	mov    DWORD PTR [rbp-0x80],r8d
   140005743:	mov    DWORD PTR [rbp-0x58],r11d
   140005747:	call   0x140006940
   14000574c:	mov    DWORD PTR [rbp-0x78],0x1
   140005753:	mov    r11d,DWORD PTR [rbp-0x58]
   140005757:	mov    r8d,DWORD PTR [rbp-0x80]
   14000575b:	mov    rdi,rax
   14000575e:	test   r13d,r13d
   140005761:	jle    0x140005781
   140005763:	mov    ecx,DWORD PTR [rbp-0x50]
   140005766:	test   ecx,ecx
   140005768:	jle    0x140005781
   14000576a:	cmp    r13d,ecx
   14000576d:	mov    eax,ecx
   14000576f:	cmovle eax,r13d
   140005773:	sub    DWORD PTR [rbp-0x68],eax
   140005776:	sub    ecx,eax
   140005778:	mov    DWORD PTR [rbp-0x4],eax
   14000577b:	sub    r13d,eax
   14000577e:	mov    DWORD PTR [rbp-0x50],ecx
   140005781:	mov    r10d,DWORD PTR [rbp-0x74]
   140005785:	test   r10d,r10d
   140005788:	je     0x1400057b2
   14000578a:	mov    r9d,DWORD PTR [rbp-0x78]
   14000578e:	test   r9d,r9d
   140005791:	je     0x14000579c
   140005793:	test   r8d,r8d
   140005796:	jne    0x140005f1f
   14000579c:	mov    edx,DWORD PTR [rbp-0x74]
   14000579f:	mov    rcx,rbx
   1400057a2:	mov    DWORD PTR [rbp-0x58],r11d
   1400057a6:	call   0x140006b70
   1400057ab:	mov    r11d,DWORD PTR [rbp-0x58]
   1400057af:	mov    rbx,rax
   1400057b2:	mov    ecx,0x1
   1400057b7:	mov    DWORD PTR [rbp-0x58],r11d
   1400057bb:	call   0x140006940
   1400057c0:	mov    r11d,DWORD PTR [rbp-0x58]
   1400057c4:	mov    r9,rax
   1400057c7:	test   r11d,r11d
   1400057ca:	jne    0x140005c18
   1400057d0:	cmp    DWORD PTR [rbp-0x28],0x1
   1400057d4:	jle    0x140005c50
   1400057da:	mov    r12d,0x1f
   1400057e0:	mov    eax,DWORD PTR [rbp-0x50]
   1400057e3:	sub    r12d,eax
   1400057e6:	mov    eax,DWORD PTR [rbp-0x68]
   1400057e9:	sub    r12d,0x4
   1400057ed:	and    r12d,0x1f
   1400057f1:	add    eax,r12d
   1400057f4:	mov    DWORD PTR [rbp-0x4],r12d
   1400057f8:	mov    edx,r12d
   1400057fb:	test   eax,eax
   1400057fd:	jle    0x14000581f
   1400057ff:	mov    edx,eax
   140005801:	mov    rcx,rbx
   140005804:	mov    QWORD PTR [rbp-0x58],r9
   140005808:	mov    DWORD PTR [rbp-0x30],r11d
   14000580c:	call   0x140006d00
   140005811:	mov    edx,DWORD PTR [rbp-0x4]
   140005814:	mov    r9,QWORD PTR [rbp-0x58]
   140005818:	mov    r11d,DWORD PTR [rbp-0x30]
   14000581c:	mov    rbx,rax
   14000581f:	mov    eax,DWORD PTR [rbp-0x50]
   140005822:	add    eax,edx
   140005824:	mov    edx,eax
   140005826:	test   eax,eax
   140005828:	jle    0x14000583d
   14000582a:	mov    rcx,r9
   14000582d:	mov    DWORD PTR [rbp-0x30],r11d
   140005831:	call   0x140006d00
   140005836:	mov    r11d,DWORD PTR [rbp-0x30]
   14000583a:	mov    r9,rax
   14000583d:	mov    ecx,DWORD PTR [rbp-0x7c]
   140005840:	cmp    DWORD PTR [rbp-0x28],0x2
   140005844:	setg   r14b
   140005848:	test   ecx,ecx
   14000584a:	jne    0x140005af0
   140005850:	mov    eax,DWORD PTR [rbp-0x48]
   140005853:	test   eax,eax
   140005855:	jg     0x140005900
   14000585b:	test   r14b,r14b
   14000585e:	je     0x140005900
   140005864:	mov    eax,DWORD PTR [rbp-0x48]
   140005867:	test   eax,eax
   140005869:	jne    0x1400058d0
   14000586b:	mov    rcx,r9
   14000586e:	xor    r8d,r8d
   140005871:	mov    edx,0x5
   140005876:	call   0x140006880
   14000587b:	mov    rcx,rbx
   14000587e:	mov    rdx,rax
   140005881:	mov    QWORD PTR [rbp-0x28],rax
   140005885:	call   0x140006e30
   14000588a:	mov    r9,QWORD PTR [rbp-0x28]
   14000588e:	test   eax,eax
   140005890:	jle    0x1400058d0
   140005892:	mov    eax,DWORD PTR [rbp-0x70]
   140005895:	mov    rsi,QWORD PTR [rbp-0x60]
   140005899:	add    eax,0x2
   14000589c:	mov    DWORD PTR [rbp-0x34],eax
   14000589f:	jmp    0x140005612
   1400058a4:	mov    DWORD PTR [rbp-0x78],0x1
   1400058ab:	mov    eax,DWORD PTR [rbp-0x34]
   1400058ae:	mov    ecx,0x1
   1400058b3:	test   eax,eax
   1400058b5:	cmovg  ecx,eax
   1400058b8:	mov    DWORD PTR [rbp-0x90],ecx
   1400058be:	mov    eax,ecx
   1400058c0:	mov    DWORD PTR [rbp-0x48],ecx
   1400058c3:	mov    DWORD PTR [rbp-0x34],ecx
   1400058c6:	jmp    0x1400052a0
   1400058cb:	xor    r9d,r9d
   1400058ce:	xor    edi,edi
   1400058d0:	mov    eax,DWORD PTR [rbp-0x34]
   1400058d3:	mov    rsi,QWORD PTR [rbp-0x60]
   1400058d7:	mov    DWORD PTR [rbp-0x40],0x10
   1400058de:	neg    eax
   1400058e0:	mov    DWORD PTR [rbp-0x34],eax
   1400058e3:	jmp    0x140005621
   1400058e8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400058f0:	mov    r8d,DWORD PTR [rbp-0x74]
   1400058f4:	mov    r13d,DWORD PTR [rbp-0x68]
   1400058f8:	xor    edi,edi
   1400058fa:	jmp    0x14000575e
   1400058ff:	nop
   140005900:	mov    eax,DWORD PTR [rbp-0x70]
   140005903:	add    eax,0x1
   140005906:	mov    DWORD PTR [rbp-0x34],eax
   140005909:	mov    eax,DWORD PTR [rbp-0x78]
   14000590c:	test   eax,eax
   14000590e:	je     0x140005b70
   140005914:	lea    edx,[r12+r13*1]
   140005918:	test   edx,edx
   14000591a:	jle    0x140005937
   14000591c:	mov    rcx,rdi
   14000591f:	mov    QWORD PTR [rbp-0x50],r9
   140005923:	mov    DWORD PTR [rbp-0x30],r11d
   140005927:	call   0x140006d00
   14000592c:	mov    r9,QWORD PTR [rbp-0x50]
   140005930:	mov    r11d,DWORD PTR [rbp-0x30]
   140005934:	mov    rdi,rax
   140005937:	mov    r13,rdi
   14000593a:	test   r11d,r11d
   14000593d:	jne    0x14000610b
   140005943:	mov    r10,QWORD PTR [rbp-0x60]
   140005947:	mov    QWORD PTR [rbp-0x70],r15
   14000594b:	mov    eax,0x1
   140005950:	mov    QWORD PTR [rbp-0x30],r9
   140005954:	mov    QWORD PTR [rbp-0x50],rsi
   140005958:	mov    r15,r10
   14000595b:	jmp    0x1400059fa
   140005960:	mov    rcx,rdx
   140005963:	call   0x140006810
   140005968:	mov    edx,0x1
   14000596d:	test   r12d,r12d
   140005970:	js     0x140005fd8
   140005976:	or     r12d,DWORD PTR [rbp-0x28]
   14000597a:	jne    0x140005989
   14000597c:	mov    rax,QWORD PTR [rbp-0x50]
   140005980:	test   BYTE PTR [rax],0x1
   140005983:	je     0x140005fd8
   140005989:	lea    r12,[r15+0x1]
   14000598d:	mov    r14,r12
   140005990:	test   edx,edx
   140005992:	jle    0x14000599e
   140005994:	cmp    DWORD PTR [rbp-0x38],0x2
   140005998:	jne    0x140006161
   14000599e:	mov    BYTE PTR [r12-0x1],sil
   1400059a3:	mov    eax,DWORD PTR [rbp-0x48]
   1400059a6:	cmp    DWORD PTR [rbp-0x4],eax
   1400059a9:	je     0x140006191
   1400059af:	mov    rcx,rbx
   1400059b2:	xor    r8d,r8d
   1400059b5:	mov    edx,0xa
   1400059ba:	call   0x140006880
   1400059bf:	xor    r8d,r8d
   1400059c2:	mov    edx,0xa
   1400059c7:	mov    rcx,rdi
   1400059ca:	mov    rbx,rax
   1400059cd:	cmp    rdi,r13
   1400059d0:	je     0x140005ae0
   1400059d6:	call   0x140006880
   1400059db:	mov    rcx,r13
   1400059de:	xor    r8d,r8d
   1400059e1:	mov    edx,0xa
   1400059e6:	mov    rdi,rax
   1400059e9:	call   0x140006880
   1400059ee:	mov    r13,rax
   1400059f1:	mov    eax,DWORD PTR [rbp-0x4]
   1400059f4:	mov    r15,r12
   1400059f7:	add    eax,0x1
   1400059fa:	mov    rdx,QWORD PTR [rbp-0x30]
   1400059fe:	mov    rcx,rbx
   140005a01:	mov    DWORD PTR [rbp-0x4],eax
   140005a04:	call   0x140004ce0
   140005a09:	mov    rdx,rdi
   140005a0c:	mov    rcx,rbx
   140005a0f:	mov    r14d,eax
   140005a12:	lea    esi,[rax+0x30]
   140005a15:	call   0x140006e30
   140005a1a:	mov    rcx,QWORD PTR [rbp-0x30]
   140005a1e:	mov    rdx,r13
   140005a21:	mov    r12d,eax
   140005a24:	call   0x140006e80
   140005a29:	mov    rdx,rax
   140005a2c:	mov    eax,DWORD PTR [rax+0x10]
   140005a2f:	test   eax,eax
   140005a31:	jne    0x140005960
   140005a37:	mov    rcx,rbx
   140005a3a:	mov    QWORD PTR [rbp-0x68],rdx
   140005a3e:	call   0x140006e30
   140005a43:	mov    rcx,QWORD PTR [rbp-0x68]
   140005a47:	mov    DWORD PTR [rbp-0x58],eax
   140005a4a:	call   0x140006810
   140005a4f:	mov    edx,DWORD PTR [rbp-0x58]
   140005a52:	mov    eax,DWORD PTR [rbp-0x28]
   140005a55:	or     edx,eax
   140005a57:	jne    0x140005e5e
   140005a5d:	mov    rax,QWORD PTR [rbp-0x50]
   140005a61:	mov    eax,DWORD PTR [rax]
   140005a63:	mov    DWORD PTR [rbp-0x58],eax
   140005a66:	and    eax,0x1
   140005a69:	or     eax,DWORD PTR [rbp-0x38]
   140005a6c:	jne    0x14000596d
   140005a72:	mov    r10,r15
   140005a75:	mov    r9,QWORD PTR [rbp-0x30]
   140005a79:	mov    r15,QWORD PTR [rbp-0x70]
   140005a7d:	mov    r8d,esi
   140005a80:	cmp    esi,0x39
   140005a83:	je     0x140006401
   140005a89:	test   r12d,r12d
   140005a8c:	jle    0x14000644e
   140005a92:	mov    DWORD PTR [rbp-0x40],0x20
   140005a99:	lea    r8d,[r14+0x31]
   140005a9d:	mov    BYTE PTR [r10],r8b
   140005aa0:	mov    rsi,rdi
   140005aa3:	lea    r12,[r10+0x1]
   140005aa7:	mov    rdi,r13
   140005aaa:	nop    WORD PTR [rax+rax*1+0x0]
   140005ab0:	mov    rcx,r9
   140005ab3:	call   0x140006810
   140005ab8:	test   rdi,rdi
   140005abb:	je     0x140005e9c
   140005ac1:	test   rsi,rsi
   140005ac4:	je     0x140005ad3
   140005ac6:	cmp    rsi,rdi
   140005ac9:	je     0x140005ad3
   140005acb:	mov    rcx,rsi
   140005ace:	call   0x140006810
   140005ad3:	mov    rsi,QWORD PTR [rbp-0x60]
   140005ad7:	mov    QWORD PTR [rbp-0x60],r12
   140005adb:	jmp    0x14000562e
   140005ae0:	call   0x140006880
   140005ae5:	mov    rdi,rax
   140005ae8:	mov    r13,rax
   140005aeb:	jmp    0x1400059f1
   140005af0:	mov    rdx,r9
   140005af3:	mov    rcx,rbx
   140005af6:	mov    DWORD PTR [rbp-0x50],r11d
   140005afa:	mov    QWORD PTR [rbp-0x30],r9
   140005afe:	call   0x140006e30
   140005b03:	mov    r9,QWORD PTR [rbp-0x30]
   140005b07:	mov    r11d,DWORD PTR [rbp-0x50]
   140005b0b:	test   eax,eax
   140005b0d:	jns    0x140005850
   140005b13:	mov    eax,DWORD PTR [rbp-0x70]
   140005b16:	xor    r8d,r8d
   140005b19:	mov    edx,0xa
   140005b1e:	mov    rcx,rbx
   140005b21:	mov    QWORD PTR [rbp-0x48],r9
   140005b25:	sub    eax,0x1
   140005b28:	mov    DWORD PTR [rbp-0x30],r11d
   140005b2c:	mov    DWORD PTR [rbp-0x50],eax
   140005b2f:	call   0x140006880
   140005b34:	mov    edx,DWORD PTR [rbp-0x78]
   140005b37:	mov    r9,QWORD PTR [rbp-0x48]
   140005b3b:	mov    rbx,rax
   140005b3e:	mov    eax,DWORD PTR [rbp-0x90]
   140005b44:	test   eax,eax
   140005b46:	setle  al
   140005b49:	and    r14d,eax
   140005b4c:	test   edx,edx
   140005b4e:	jne    0x14000631c
   140005b54:	test   r14b,r14b
   140005b57:	jne    0x140006244
   140005b5d:	mov    eax,DWORD PTR [rbp-0x70]
   140005b60:	mov    DWORD PTR [rbp-0x34],eax
   140005b63:	mov    eax,DWORD PTR [rbp-0x90]
   140005b69:	mov    DWORD PTR [rbp-0x48],eax
   140005b6c:	nop    DWORD PTR [rax+0x0]
   140005b70:	mov    r14,QWORD PTR [rbp-0x60]
   140005b74:	mov    r12d,DWORD PTR [rbp-0x48]
   140005b78:	mov    eax,0x1
   140005b7d:	mov    rsi,r9
   140005b80:	jmp    0x140005ba1
   140005b82:	nop    WORD PTR [rax+rax*1+0x0]
   140005b88:	mov    rcx,rbx
   140005b8b:	xor    r8d,r8d
   140005b8e:	mov    edx,0xa
   140005b93:	call   0x140006880
   140005b98:	mov    rbx,rax
   140005b9b:	mov    eax,DWORD PTR [rbp-0x4]
   140005b9e:	add    eax,0x1
   140005ba1:	mov    rdx,rsi
   140005ba4:	mov    rcx,rbx
   140005ba7:	mov    DWORD PTR [rbp-0x4],eax
   140005baa:	add    r14,0x1
   140005bae:	call   0x140004ce0
   140005bb3:	lea    r8d,[rax+0x30]
   140005bb7:	mov    BYTE PTR [r14-0x1],r8b
   140005bbb:	cmp    DWORD PTR [rbp-0x4],r12d
   140005bbf:	jl     0x140005b88
   140005bc1:	mov    r9,rsi
   140005bc4:	xor    esi,esi
   140005bc6:	mov    ecx,DWORD PTR [rbp-0x38]
   140005bc9:	test   ecx,ecx
   140005bcb:	je     0x140005f7a
   140005bd1:	mov    eax,DWORD PTR [rbx+0x14]
   140005bd4:	cmp    ecx,0x2
   140005bd7:	je     0x140005fba
   140005bdd:	cmp    eax,0x1
   140005be0:	jg     0x140005e66
   140005be6:	mov    eax,DWORD PTR [rbx+0x18]
   140005be9:	test   eax,eax
   140005beb:	jne    0x140005e66
   140005bf1:	test   eax,eax
   140005bf3:	setne  al
   140005bf6:	movzx  eax,al
   140005bf9:	shl    eax,0x4
   140005bfc:	mov    DWORD PTR [rbp-0x40],eax
   140005bff:	nop
   140005c00:	mov    r12,r14
   140005c03:	sub    r14,0x1
   140005c07:	cmp    BYTE PTR [r14],0x30
   140005c0b:	je     0x140005c00
   140005c0d:	jmp    0x140005ab0
   140005c12:	nop    WORD PTR [rax+rax*1+0x0]
   140005c18:	mov    edx,r11d
   140005c1b:	mov    rcx,rax
   140005c1e:	call   0x140006b70
   140005c23:	cmp    DWORD PTR [rbp-0x28],0x1
   140005c27:	mov    r9,rax
   140005c2a:	jle    0x140005ed2
   140005c30:	xor    r11d,r11d
   140005c33:	mov    eax,DWORD PTR [r9+0x14]
   140005c37:	sub    eax,0x1
   140005c3a:	cdqe
   140005c3c:	bsr    r12d,DWORD PTR [r9+rax*4+0x18]
   140005c42:	xor    r12d,0x1f
   140005c46:	jmp    0x1400057e0
   140005c4b:	nop    DWORD PTR [rax+rax*1+0x0]
   140005c50:	cmp    r14d,0x1
   140005c54:	jne    0x1400057da
   140005c5a:	mov    eax,DWORD PTR [r12+0x4]
   140005c5f:	add    eax,0x1
   140005c62:	cmp    DWORD PTR [rbp-0x30],eax
   140005c65:	jle    0x1400057da
   140005c6b:	add    DWORD PTR [rbp-0x68],0x1
   140005c6f:	mov    r11d,0x1
   140005c75:	add    DWORD PTR [rbp-0x50],0x1
   140005c79:	jmp    0x1400057da
   140005c7e:	xchg   ax,ax
   140005c80:	cmp    DWORD PTR [rbp-0x28],0x1
   140005c84:	jle    0x140005728
   140005c8a:	mov    ecx,DWORD PTR [rbp-0x48]
   140005c8d:	mov    edi,DWORD PTR [rbp-0x74]
   140005c90:	lea    eax,[rcx-0x1]
   140005c93:	cmp    edi,eax
   140005c95:	jl     0x140005ea9
   140005c9b:	mov    r8d,edi
   140005c9e:	sub    r8d,eax
   140005ca1:	test   ecx,ecx
   140005ca3:	jns    0x140006304
   140005ca9:	mov    r13d,DWORD PTR [rbp-0x68]
   140005cad:	mov    eax,DWORD PTR [rbp-0x48]
   140005cb0:	mov    DWORD PTR [rbp-0x4],0x0
   140005cb7:	sub    r13d,eax
   140005cba:	jmp    0x14000573a
   140005cbf:	mov    DWORD PTR [rbp-0x78],0x1
   140005cc6:	jmp    0x140005280
   140005ccb:	movupd xmm4,xmm2
   140005ccf:	movq   xmm0,r10
   140005cd4:	mov    rdx,QWORD PTR [rbp-0x60]
   140005cd8:	xor    r9d,r9d
   140005cdb:	mulsd  xmm4,xmm3
   140005cdf:	mov    DWORD PTR [rbp-0x4],0x1
   140005ce6:	movsd  xmm2,QWORD PTR [rip+0x385a]        # 0x140009548
   140005cee:	movupd xmm1,xmm0
   140005cf2:	jmp    0x140005d07
   140005cf4:	nop    DWORD PTR [rax+0x0]
   140005cf8:	mulsd  xmm1,xmm2
   140005cfc:	add    r10d,0x1
   140005d00:	mov    r9d,edi
   140005d03:	mov    DWORD PTR [rbp-0x4],r10d
   140005d07:	cvttsd2si ecx,xmm1
   140005d0b:	test   ecx,ecx
   140005d0d:	je     0x140005d1e
   140005d0f:	pxor   xmm3,xmm3
   140005d13:	mov    r9d,edi
   140005d16:	cvtsi2sd xmm3,ecx
   140005d1a:	subsd  xmm1,xmm3
   140005d1e:	add    rdx,0x1
   140005d22:	add    ecx,0x30
   140005d25:	mov    BYTE PTR [rdx-0x1],cl
   140005d28:	mov    r10d,DWORD PTR [rbp-0x4]
   140005d2c:	cmp    r10d,eax
   140005d2f:	jne    0x140005cf8
   140005d31:	test   r9b,r9b
   140005d34:	je     0x1400062e5
   140005d3a:	movsd  xmm0,QWORD PTR [rip+0x383e]        # 0x140009580
   140005d42:	movupd xmm2,xmm4
   140005d46:	addsd  xmm2,xmm0
   140005d4a:	comisd xmm1,xmm2
   140005d4e:	ja     0x1400062dc
   140005d54:	subsd  xmm0,xmm4
   140005d58:	comisd xmm0,xmm1
   140005d5c:	ja     0x140006354
   140005d62:	mov    eax,DWORD PTR [rbp-0x58]
   140005d65:	test   eax,eax
   140005d67:	js     0x1400062ee
   140005d6d:	mov    eax,DWORD PTR [r12+0x14]
   140005d72:	test   eax,eax
   140005d74:	js     0x1400062ee
   140005d7a:	mov    rax,QWORD PTR [rip+0x3a8f]        # 0x140009810
   140005d81:	mov    DWORD PTR [rbp-0x38],0x0
   140005d88:	movsd  xmm2,QWORD PTR [rax]
   140005d8c:	movsd  xmm0,QWORD PTR [rbp-0x98]
   140005d94:	mov    rsi,QWORD PTR [rbp-0x60]
   140005d98:	mov    DWORD PTR [rbp-0x4],0x1
   140005d9f:	movupd xmm1,xmm0
   140005da3:	lea    rdx,[rsi+0x1]
   140005da7:	divsd  xmm1,xmm2
   140005dab:	cvttsd2si eax,xmm1
   140005daf:	pxor   xmm1,xmm1
   140005db3:	cvtsi2sd xmm1,eax
   140005db7:	lea    ecx,[rax+0x30]
   140005dba:	mov    BYTE PTR [rsi],cl
   140005dbc:	mov    esi,DWORD PTR [rbp-0x70]
   140005dbf:	add    esi,0x1
   140005dc2:	mulsd  xmm1,xmm2
   140005dc6:	mov    DWORD PTR [rbp-0x34],esi
   140005dc9:	subsd  xmm0,xmm1
   140005dcd:	pxor   xmm1,xmm1
   140005dd1:	ucomisd xmm0,xmm1
   140005dd5:	jp     0x140005ddd
   140005dd7:	je     0x140005f6d
   140005ddd:	movsd  xmm4,QWORD PTR [rip+0x3763]        # 0x140009548
   140005de5:	pxor   xmm3,xmm3
   140005de9:	jmp    0x140005e2c
   140005deb:	nop    DWORD PTR [rax+rax*1+0x0]
   140005df0:	mulsd  xmm0,xmm4
   140005df4:	add    ecx,0x1
   140005df7:	add    rdx,0x1
   140005dfb:	mov    DWORD PTR [rbp-0x4],ecx
   140005dfe:	movupd xmm1,xmm0
   140005e02:	divsd  xmm1,xmm2
   140005e06:	cvttsd2si eax,xmm1
   140005e0a:	pxor   xmm1,xmm1
   140005e0e:	cvtsi2sd xmm1,eax
   140005e12:	lea    ecx,[rax+0x30]
   140005e15:	mov    BYTE PTR [rdx-0x1],cl
   140005e18:	mulsd  xmm1,xmm2
   140005e1c:	subsd  xmm0,xmm1
   140005e20:	ucomisd xmm0,xmm3
   140005e24:	jp     0x140005e2c
   140005e26:	je     0x140005f6d
   140005e2c:	mov    ecx,DWORD PTR [rbp-0x4]
   140005e2f:	mov    esi,DWORD PTR [rbp-0x48]
   140005e32:	cmp    ecx,esi
   140005e34:	jne    0x140005df0
   140005e36:	mov    esi,DWORD PTR [rbp-0x38]
   140005e39:	test   esi,esi
   140005e3b:	je     0x140006258
   140005e41:	cmp    esi,0x1
   140005e44:	je     0x140006378
   140005e4a:	mov    rsi,QWORD PTR [rbp-0x60]
   140005e4e:	mov    DWORD PTR [rbp-0x40],0x10
   140005e55:	mov    QWORD PTR [rbp-0x60],rdx
   140005e59:	jmp    0x140005636
   140005e5e:	mov    edx,DWORD PTR [rbp-0x58]
   140005e61:	jmp    0x14000596d
   140005e66:	mov    rdx,QWORD PTR [rbp-0x60]
   140005e6a:	jmp    0x140005e79
   140005e6c:	nop    DWORD PTR [rax+0x0]
   140005e70:	cmp    r14,rdx
   140005e73:	je     0x140005f08
   140005e79:	mov    r12,r14
   140005e7c:	lea    r14,[r14-0x1]
   140005e80:	movzx  eax,BYTE PTR [r12-0x1]
   140005e86:	cmp    al,0x39
   140005e88:	je     0x140005e70
   140005e8a:	add    eax,0x1
   140005e8d:	mov    DWORD PTR [rbp-0x40],0x20
   140005e94:	mov    BYTE PTR [r14],al
   140005e97:	jmp    0x140005ab0
   140005e9c:	mov    rsi,QWORD PTR [rbp-0x60]
   140005ea0:	mov    QWORD PTR [rbp-0x60],r12
   140005ea4:	jmp    0x140005636
   140005ea9:	mov    edi,DWORD PTR [rbp-0x74]
   140005eac:	mov    edx,eax
   140005eae:	mov    DWORD PTR [rbp-0x74],eax
   140005eb1:	xor    r8d,r8d
   140005eb4:	sub    edx,edi
   140005eb6:	mov    edi,DWORD PTR [rbp-0x48]
   140005eb9:	add    DWORD PTR [rbp-0x50],edi
   140005ebc:	add    r11d,edx
   140005ebf:	mov    edx,DWORD PTR [rbp-0x68]
   140005ec2:	mov    DWORD PTR [rbp-0x4],edi
   140005ec5:	add    edi,edx
   140005ec7:	mov    r13d,edx
   140005eca:	mov    DWORD PTR [rbp-0x68],edi
   140005ecd:	jmp    0x14000573a
   140005ed2:	cmp    r14d,0x1
   140005ed6:	jne    0x140005c30
   140005edc:	mov    eax,DWORD PTR [r12+0x4]
   140005ee1:	mov    edx,DWORD PTR [rbp-0x30]
   140005ee4:	add    eax,0x1
   140005ee7:	cmp    eax,edx
   140005ee9:	jge    0x140005c30
   140005eef:	add    DWORD PTR [rbp-0x68],0x1
   140005ef3:	mov    r11d,0x1
   140005ef9:	add    DWORD PTR [rbp-0x50],0x1
   140005efd:	jmp    0x140005c33
   140005f02:	nop    WORD PTR [rax+rax*1+0x0]
   140005f08:	mov    rax,QWORD PTR [rbp-0x60]
   140005f0c:	add    DWORD PTR [rbp-0x34],0x1
   140005f10:	mov    DWORD PTR [rbp-0x40],0x20
   140005f17:	mov    BYTE PTR [rax],0x31
   140005f1a:	jmp    0x140005ab0
   140005f1f:	mov    edx,r8d
   140005f22:	mov    rcx,rdi
   140005f25:	mov    DWORD PTR [rbp-0x88],r11d
   140005f2c:	mov    DWORD PTR [rbp-0x80],r8d
   140005f30:	call   0x140006b70
   140005f35:	mov    rdx,rbx
   140005f38:	mov    rcx,rax
   140005f3b:	mov    rdi,rax
   140005f3e:	call   0x140006a00
   140005f43:	mov    rcx,rbx
   140005f46:	mov    QWORD PTR [rbp-0x58],rax
   140005f4a:	call   0x140006810
   140005f4f:	mov    r8d,DWORD PTR [rbp-0x80]
   140005f53:	sub    DWORD PTR [rbp-0x74],r8d
   140005f57:	mov    rbx,QWORD PTR [rbp-0x58]
   140005f5b:	mov    r11d,DWORD PTR [rbp-0x88]
   140005f62:	je     0x1400057b2
   140005f68:	jmp    0x14000579c
   140005f6d:	mov    rsi,QWORD PTR [rbp-0x60]
   140005f71:	mov    QWORD PTR [rbp-0x60],rdx
   140005f75:	jmp    0x140005636
   140005f7a:	mov    rcx,rbx
   140005f7d:	mov    edx,0x1
   140005f82:	mov    QWORD PTR [rbp-0x28],r9
   140005f86:	mov    DWORD PTR [rbp-0x30],r8d
   140005f8a:	call   0x140006d00
   140005f8f:	mov    rdx,QWORD PTR [rbp-0x28]
   140005f93:	mov    rcx,rax
   140005f96:	mov    rbx,rax
   140005f99:	call   0x140006e30
   140005f9e:	mov    r9,QWORD PTR [rbp-0x28]
   140005fa2:	test   eax,eax
   140005fa4:	jg     0x140005e66
   140005faa:	jne    0x140005fba
   140005fac:	mov    r8d,DWORD PTR [rbp-0x30]
   140005fb0:	and    r8d,0x1
   140005fb4:	jne    0x140005e66
   140005fba:	cmp    DWORD PTR [rbx+0x14],0x1
   140005fbe:	mov    DWORD PTR [rbp-0x40],0x10
   140005fc5:	jg     0x140005c00
   140005fcb:	mov    eax,DWORD PTR [rbx+0x18]
   140005fce:	jmp    0x140005bf1
   140005fd3:	nop    DWORD PTR [rax+rax*1+0x0]
   140005fd8:	mov    r11d,DWORD PTR [rbp-0x38]
   140005fdc:	mov    r10,r15
   140005fdf:	mov    r9,QWORD PTR [rbp-0x30]
   140005fe3:	mov    r8d,esi
   140005fe6:	mov    r15,QWORD PTR [rbp-0x70]
   140005fea:	test   r11d,r11d
   140005fed:	je     0x1400061b9
   140005ff3:	cmp    DWORD PTR [rbx+0x14],0x1
   140005ff7:	jle    0x1400063b5
   140005ffd:	cmp    DWORD PTR [rbp-0x38],0x2
   140006001:	je     0x140006218
   140006007:	mov    QWORD PTR [rbp-0x30],r15
   14000600b:	mov    r14d,r8d
   14000600e:	mov    r15,r10
   140006011:	mov    QWORD PTR [rbp-0x28],r9
   140006015:	jmp    0x140006068
   140006017:	nop    WORD PTR [rax+rax*1+0x0]
   140006020:	mov    BYTE PTR [r12-0x1],r14b
   140006025:	xor    r8d,r8d
   140006028:	mov    rcx,r13
   14000602b:	mov    edx,0xa
   140006030:	mov    r15,r12
   140006033:	call   0x140006880
   140006038:	cmp    rdi,r13
   14000603b:	mov    rcx,rbx
   14000603e:	mov    edx,0xa
   140006043:	cmove  rdi,rax
   140006047:	xor    r8d,r8d
   14000604a:	mov    rsi,rax
   14000604d:	call   0x140006880
   140006052:	mov    rdx,QWORD PTR [rbp-0x28]
   140006056:	mov    r13,rsi
   140006059:	mov    rcx,rax
   14000605c:	mov    rbx,rax
   14000605f:	call   0x140004ce0
   140006064:	lea    r14d,[rax+0x30]
   140006068:	mov    rcx,QWORD PTR [rbp-0x28]
   14000606c:	mov    rdx,r13
   14000606f:	lea    r12,[r15+0x1]
   140006073:	call   0x140006e30
   140006078:	test   eax,eax
   14000607a:	jg     0x140006020
   14000607c:	mov    r10,r15
   14000607f:	mov    r9,QWORD PTR [rbp-0x28]
   140006083:	mov    r15,QWORD PTR [rbp-0x30]
   140006087:	mov    r8d,r14d
   14000608a:	cmp    r14d,0x39
   14000608e:	je     0x140006405
   140006094:	mov    DWORD PTR [rbp-0x40],0x20
   14000609b:	mov    rsi,rdi
   14000609e:	add    r8d,0x1
   1400060a2:	mov    rdi,r13
   1400060a5:	mov    BYTE PTR [r10],r8b
   1400060a8:	jmp    0x140005ab0
   1400060ad:	test   ecx,ecx
   1400060af:	je     0x140005665
   1400060b5:	mov    ecx,DWORD PTR [rbp-0x90]
   1400060bb:	test   ecx,ecx
   1400060bd:	jle    0x1400056b8
   1400060c3:	mulsd  xmm0,QWORD PTR [rip+0x347d]        # 0x140009548
   1400060cb:	movsd  xmm1,QWORD PTR [rip+0x347d]        # 0x140009550
   1400060d3:	mov    r8d,0xffffffff
   1400060d9:	mulsd  xmm1,xmm0
   1400060dd:	movq   r10,xmm0
   1400060e2:	addsd  xmm1,QWORD PTR [rip+0x346e]        # 0x140009558
   1400060ea:	movq   rdx,xmm1
   1400060ef:	mov    rax,rdx
   1400060f2:	mov    edx,edx
   1400060f4:	shr    rax,0x20
   1400060f8:	sub    eax,0x3400000
   1400060fd:	shl    rax,0x20
   140006101:	or     rdx,rax
   140006104:	mov    eax,ecx
   140006106:	jmp    0x14000537e
   14000610b:	mov    ecx,DWORD PTR [rdi+0x8]
   14000610e:	mov    QWORD PTR [rbp-0x30],r9
   140006112:	call   0x140006710
   140006117:	lea    rdx,[rdi+0x10]
   14000611b:	lea    rcx,[rax+0x10]
   14000611f:	mov    r12,rax
   140006122:	movsxd rax,DWORD PTR [rdi+0x14]
   140006126:	lea    r8,[rax*4+0x8]
   14000612e:	call   0x140007a58
   140006133:	mov    edx,0x1
   140006138:	mov    rcx,r12
   14000613b:	call   0x140006d00
   140006140:	mov    r9,QWORD PTR [rbp-0x30]
   140006144:	mov    r13,rax
   140006147:	jmp    0x140005943
   14000614c:	mov    DWORD PTR [rbp-0x34],0x2
   140006153:	mov    rsi,QWORD PTR [rbp-0x60]
   140006157:	xor    r9d,r9d
   14000615a:	xor    edi,edi
   14000615c:	jmp    0x140005612
   140006161:	mov    r10,r15
   140006164:	mov    r9,QWORD PTR [rbp-0x30]
   140006168:	mov    r15,QWORD PTR [rbp-0x70]
   14000616c:	mov    r8d,esi
   14000616f:	cmp    esi,0x39
   140006172:	je     0x140006405
   140006178:	add    r8d,0x1
   14000617c:	mov    rsi,rdi
   14000617f:	mov    DWORD PTR [rbp-0x40],0x20
   140006186:	mov    rdi,r13
   140006189:	mov    BYTE PTR [r10],r8b
   14000618c:	jmp    0x140005ab0
   140006191:	mov    r8d,esi
   140006194:	mov    r9,QWORD PTR [rbp-0x30]
   140006198:	mov    rsi,rdi
   14000619b:	mov    r15,QWORD PTR [rbp-0x70]
   14000619f:	mov    rdi,r13
   1400061a2:	jmp    0x140005bc6
   1400061a7:	mov    QWORD PTR [rbp-0x60],rdx
   1400061ab:	add    r8d,0x1
   1400061af:	mov    ecx,0x31
   1400061b4:	jmp    0x140005468
   1400061b9:	test   edx,edx
   1400061bb:	jle    0x14000620e
   1400061bd:	mov    rcx,rbx
   1400061c0:	mov    edx,0x1
   1400061c5:	mov    QWORD PTR [rbp-0x28],r9
   1400061c9:	mov    QWORD PTR [rbp-0x40],r10
   1400061cd:	mov    DWORD PTR [rbp-0x30],r8d
   1400061d1:	call   0x140006d00
   1400061d6:	mov    rdx,QWORD PTR [rbp-0x28]
   1400061da:	mov    rcx,rax
   1400061dd:	mov    rbx,rax
   1400061e0:	call   0x140006e30
   1400061e5:	mov    r9,QWORD PTR [rbp-0x28]
   1400061e9:	mov    r8d,DWORD PTR [rbp-0x30]
   1400061ed:	test   eax,eax
   1400061ef:	mov    r10,QWORD PTR [rbp-0x40]
   1400061f3:	jle    0x14000641b
   1400061f9:	cmp    r8d,0x39
   1400061fd:	je     0x140006433
   140006203:	mov    DWORD PTR [rbp-0x38],0x20
   14000620a:	lea    r8d,[r14+0x31]
   14000620e:	cmp    DWORD PTR [rbx+0x14],0x1
   140006212:	jle    0x1400063e4
   140006218:	mov    rsi,rdi
   14000621b:	mov    DWORD PTR [rbp-0x40],0x10
   140006222:	mov    rdi,r13
   140006225:	lea    r12,[r10+0x1]
   140006229:	jmp    0x1400060a5
   14000622e:	mov    DWORD PTR [rbp-0x90],0xffffffff
   140006238:	mov    DWORD PTR [rbp-0x48],0xffffffff
   14000623f:	jmp    0x1400056d6
   140006244:	mov    eax,DWORD PTR [rbp-0x50]
   140006247:	mov    DWORD PTR [rbp-0x70],eax
   14000624a:	mov    eax,DWORD PTR [rbp-0x90]
   140006250:	mov    DWORD PTR [rbp-0x48],eax
   140006253:	jmp    0x140005864
   140006258:	addsd  xmm0,xmm0
   14000625c:	movzx  ecx,BYTE PTR [rdx-0x1]
   140006260:	comisd xmm0,xmm2
   140006264:	ja     0x1400063d7
   14000626a:	ucomisd xmm0,xmm2
   14000626e:	mov    rsi,QWORD PTR [rbp-0x60]
   140006272:	mov    r8d,DWORD PTR [rbp-0x70]
   140006276:	jp     0x140006282
   140006278:	jne    0x140006282
   14000627a:	test   al,0x1
   14000627c:	jne    0x140005458
   140006282:	mov    DWORD PTR [rbp-0x40],0x10
   140006289:	nop    DWORD PTR [rax+0x0]
   140006290:	mov    rax,rdx
   140006293:	lea    rdx,[rdx-0x1]
   140006297:	cmp    BYTE PTR [rax-0x1],0x30
   14000629b:	je     0x140006290
   14000629d:	mov    QWORD PTR [rbp-0x60],rax
   1400062a1:	lea    eax,[r8+0x1]
   1400062a5:	mov    DWORD PTR [rbp-0x34],eax
   1400062a8:	jmp    0x140005636
   1400062ad:	pxor   xmm1,xmm1
   1400062b1:	xor    eax,eax
   1400062b3:	mov    ecx,0x1
   1400062b8:	mov    rsi,QWORD PTR [rbp-0x60]
   1400062bc:	ucomisd xmm0,xmm1
   1400062c0:	mov    QWORD PTR [rbp-0x60],rdx
   1400062c4:	setp   al
   1400062c7:	cmovne eax,ecx
   1400062ca:	shl    eax,0x4
   1400062cd:	mov    DWORD PTR [rbp-0x40],eax
   1400062d0:	lea    eax,[r8+0x1]
   1400062d4:	mov    DWORD PTR [rbp-0x34],eax
   1400062d7:	jmp    0x140005636
   1400062dc:	mov    rsi,QWORD PTR [rbp-0x60]
   1400062e0:	jmp    0x140005458
   1400062e5:	movupd xmm1,xmm0
   1400062e9:	jmp    0x140005d3a
   1400062ee:	mov    DWORD PTR [rbp-0x38],0x0
   1400062f5:	mov    r8d,DWORD PTR [rbp-0x74]
   1400062f9:	xor    edi,edi
   1400062fb:	mov    r13d,DWORD PTR [rbp-0x68]
   1400062ff:	jmp    0x14000575e
   140006304:	mov    edi,DWORD PTR [rbp-0x68]
   140006307:	mov    eax,ecx
   140006309:	add    DWORD PTR [rbp-0x50],ecx
   14000630c:	mov    DWORD PTR [rbp-0x4],ecx
   14000630f:	add    eax,edi
   140006311:	mov    r13d,edi
   140006314:	mov    DWORD PTR [rbp-0x68],eax
   140006317:	jmp    0x14000573a
   14000631c:	xor    r8d,r8d
   14000631f:	mov    rcx,rdi
   140006322:	mov    edx,0xa
   140006327:	call   0x140006880
   14000632c:	test   r14b,r14b
   14000632f:	mov    r9,QWORD PTR [rbp-0x48]
   140006333:	mov    rdi,rax
   140006336:	jne    0x140006244
   14000633c:	mov    eax,DWORD PTR [rbp-0x70]
   14000633f:	mov    r11d,DWORD PTR [rbp-0x30]
   140006343:	mov    DWORD PTR [rbp-0x34],eax
   140006346:	mov    eax,DWORD PTR [rbp-0x90]
   14000634c:	mov    DWORD PTR [rbp-0x48],eax
   14000634f:	jmp    0x140005914
   140006354:	pxor   xmm0,xmm0
   140006358:	xor    eax,eax
   14000635a:	mov    ecx,0x1
   14000635f:	mov    rsi,QWORD PTR [rbp-0x60]
   140006363:	ucomisd xmm1,xmm0
   140006367:	setp   al
   14000636a:	cmovne eax,ecx
   14000636d:	shl    eax,0x4
   140006370:	mov    DWORD PTR [rbp-0x40],eax
   140006373:	jmp    0x140006290
   140006378:	movzx  ecx,BYTE PTR [rdx-0x1]
   14000637c:	mov    rsi,QWORD PTR [rbp-0x60]
   140006380:	mov    r8d,DWORD PTR [rbp-0x70]
   140006384:	jmp    0x140005458
   140006389:	mov    edi,DWORD PTR [rbp-0x48]
   14000638c:	mov    edx,DWORD PTR [rbp-0x74]
   14000638f:	lea    eax,[rdi-0x1]
   140006392:	cmp    edx,eax
   140006394:	jl     0x140005ea9
   14000639a:	sub    edx,eax
   14000639c:	mov    eax,DWORD PTR [rbp-0x68]
   14000639f:	add    DWORD PTR [rbp-0x50],edi
   1400063a2:	mov    DWORD PTR [rbp-0x4],edi
   1400063a5:	mov    r8d,edx
   1400063a8:	mov    r13d,eax
   1400063ab:	add    eax,edi
   1400063ad:	mov    DWORD PTR [rbp-0x68],eax
   1400063b0:	jmp    0x14000573a
   1400063b5:	mov    ecx,DWORD PTR [rbx+0x18]
   1400063b8:	test   ecx,ecx
   1400063ba:	jne    0x140005ffd
   1400063c0:	test   edx,edx
   1400063c2:	jg     0x1400061bd
   1400063c8:	mov    rsi,rdi
   1400063cb:	lea    r12,[r10+0x1]
   1400063cf:	mov    rdi,r13
   1400063d2:	jmp    0x1400060a5
   1400063d7:	mov    rsi,QWORD PTR [rbp-0x60]
   1400063db:	mov    r8d,DWORD PTR [rbp-0x70]
   1400063df:	jmp    0x140005458
   1400063e4:	mov    edx,DWORD PTR [rbx+0x18]
   1400063e7:	mov    rsi,rdi
   1400063ea:	mov    rdi,r13
   1400063ed:	test   edx,edx
   1400063ef:	je     0x14000643f
   1400063f1:	mov    DWORD PTR [rbp-0x40],0x10
   1400063f8:	lea    r12,[r10+0x1]
   1400063fc:	jmp    0x1400060a5
   140006401:	lea    r12,[r10+0x1]
   140006405:	mov    rsi,rdi
   140006408:	mov    rdi,r13
   14000640b:	mov    BYTE PTR [r10],0x39
   14000640f:	mov    rdx,QWORD PTR [rbp-0x60]
   140006413:	mov    r14,r12
   140006416:	jmp    0x140005e79
   14000641b:	jne    0x140006427
   14000641d:	test   r8b,0x1
   140006421:	jne    0x1400061f9
   140006427:	mov    DWORD PTR [rbp-0x38],0x20
   14000642e:	jmp    0x14000620e
   140006433:	mov    rsi,rdi
   140006436:	lea    r12,[r10+0x1]
   14000643a:	mov    rdi,r13
   14000643d:	jmp    0x14000640b
   14000643f:	mov    eax,DWORD PTR [rbp-0x38]
   140006442:	lea    r12,[r10+0x1]
   140006446:	mov    DWORD PTR [rbp-0x40],eax
   140006449:	jmp    0x1400060a5
   14000644e:	cmp    DWORD PTR [rbx+0x14],0x1
   140006452:	mov    DWORD PTR [rbp-0x40],0x10
   140006459:	jg     0x140005a9d
   14000645f:	xor    eax,eax
   140006461:	cmp    DWORD PTR [rbx+0x18],0x0
   140006465:	setne  al
   140006468:	shl    eax,0x4
   14000646b:	mov    DWORD PTR [rbp-0x40],eax
   14000646e:	jmp    0x140005a9d
   140006473:	nop
   140006474:	nop
   140006475:	nop
   140006476:	nop
   140006477:	nop
   140006478:	nop
   140006479:	nop
   14000647a:	nop
   14000647b:	nop
   14000647c:	nop
   14000647d:	nop
   14000647e:	nop
   14000647f:	nop
   140006480:	push   rbp
   140006481:	push   r13
   140006483:	push   r12
   140006485:	push   rdi
   140006486:	push   rsi
   140006487:	push   rbx
   140006488:	lea    rbp,[rsp]
   14000648c:	movsxd rbx,DWORD PTR [rcx+0x14]
   140006490:	mov    r12d,edx
   140006493:	mov    r10,rcx
   140006496:	sar    r12d,0x5
   14000649a:	cmp    ebx,r12d
   14000649d:	jg     0x1400064c0
   14000649f:	mov    DWORD PTR [r10+0x14],0x0
   1400064a7:	mov    DWORD PTR [r10+0x18],0x0
   1400064af:	pop    rbx
   1400064b0:	pop    rsi
   1400064b1:	pop    rdi
   1400064b2:	pop    r12
   1400064b4:	pop    r13
   1400064b6:	pop    rbp
   1400064b7:	ret
   1400064b8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400064c0:	lea    r13,[rcx+0x18]
   1400064c4:	movsxd r12,r12d
   1400064c7:	lea    r11,[r13+rbx*4+0x0]
   1400064cc:	lea    rsi,[r13+r12*4+0x0]
   1400064d1:	and    edx,0x1f
   1400064d4:	je     0x140006538
   1400064d6:	mov    r9d,DWORD PTR [rsi]
   1400064d9:	mov    edi,0x20
   1400064de:	mov    ecx,edx
   1400064e0:	lea    r8,[rsi+0x4]
   1400064e4:	sub    edi,edx
   1400064e6:	shr    r9d,cl
   1400064e9:	cmp    r8,r11
   1400064ec:	jae    0x140006578
   1400064f2:	mov    rsi,r13
   1400064f5:	nop    DWORD PTR [rax]
   1400064f8:	mov    eax,DWORD PTR [r8]
   1400064fb:	mov    ecx,edi
   1400064fd:	add    rsi,0x4
   140006501:	add    r8,0x4
   140006505:	shl    eax,cl
   140006507:	mov    ecx,edx
   140006509:	or     eax,r9d
   14000650c:	mov    DWORD PTR [rsi-0x4],eax
   14000650f:	mov    r9d,DWORD PTR [r8-0x4]
   140006513:	shr    r9d,cl
   140006516:	cmp    r8,r11
   140006519:	jb     0x1400064f8
   14000651b:	sub    rbx,r12
   14000651e:	lea    rax,[r13+rbx*4-0x4]
   140006523:	mov    DWORD PTR [rax],r9d
   140006526:	test   r9d,r9d
   140006529:	je     0x140006556
   14000652b:	add    rax,0x4
   14000652f:	jmp    0x140006556
   140006531:	nop    DWORD PTR [rax+0x0]
   140006538:	mov    rdi,r13
   14000653b:	cmp    rsi,r11
   14000653e:	jae    0x14000649f
   140006544:	nop    DWORD PTR [rax+0x0]
   140006548:	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140006549:	cmp    rsi,r11
   14000654c:	jb     0x140006548
   14000654e:	sub    rbx,r12
   140006551:	lea    rax,[r13+rbx*4+0x0]
   140006556:	sub    rax,r13
   140006559:	sar    rax,0x2
   14000655d:	mov    DWORD PTR [r10+0x14],eax
   140006561:	test   eax,eax
   140006563:	je     0x1400064a7
   140006569:	pop    rbx
   14000656a:	pop    rsi
   14000656b:	pop    rdi
   14000656c:	pop    r12
   14000656e:	pop    r13
   140006570:	pop    rbp
   140006571:	ret
   140006572:	nop    WORD PTR [rax+rax*1+0x0]
   140006578:	mov    DWORD PTR [r10+0x18],r9d
   14000657c:	test   r9d,r9d
   14000657f:	je     0x14000649f
   140006585:	mov    rax,r13
   140006588:	jmp    0x14000652b
   14000658a:	nop    WORD PTR [rax+rax*1+0x0]
   140006590:	movsxd rdx,DWORD PTR [rcx+0x14]
   140006594:	lea    rax,[rcx+0x18]
   140006598:	lea    rcx,[rax+rdx*4]
   14000659c:	xor    edx,edx
   14000659e:	cmp    rax,rcx
   1400065a1:	jb     0x1400065b4
   1400065a3:	jmp    0x1400065c7
   1400065a5:	nop    DWORD PTR [rax]
   1400065a8:	add    rax,0x4
   1400065ac:	add    edx,0x20
   1400065af:	cmp    rax,rcx
   1400065b2:	jae    0x1400065c7
   1400065b4:	mov    r8d,DWORD PTR [rax]
   1400065b7:	test   r8d,r8d
   1400065ba:	je     0x1400065a8
   1400065bc:	cmp    rax,rcx
   1400065bf:	jae    0x1400065c7
   1400065c1:	tzcnt  eax,DWORD PTR [rax]
   1400065c5:	add    edx,eax
   1400065c7:	mov    eax,edx
   1400065c9:	ret
   1400065ca:	nop
   1400065cb:	nop
   1400065cc:	nop
   1400065cd:	nop
   1400065ce:	nop
   1400065cf:	nop
   1400065d0:	push   rbp
   1400065d1:	push   rdi
   1400065d2:	push   rsi
   1400065d3:	push   rbx
   1400065d4:	sub    rsp,0x28
   1400065d8:	lea    rbp,[rsp+0x20]
   1400065dd:	mov    eax,DWORD PTR [rip+0x650d]        # 0x14000caf0
   1400065e3:	mov    esi,ecx
   1400065e5:	cmp    eax,0x2
   1400065e8:	je     0x1400066b0
   1400065ee:	test   eax,eax
   1400065f0:	je     0x140006628
   1400065f2:	cmp    eax,0x1
   1400065f5:	jne    0x14000661b
   1400065f7:	mov    rbx,QWORD PTR [rip+0x6c0a]        # 0x14000d208
   1400065fe:	xchg   ax,ax
   140006600:	mov    ecx,0x1
   140006605:	call   rbx
   140006607:	mov    eax,DWORD PTR [rip+0x64e3]        # 0x14000caf0
   14000660d:	cmp    eax,0x1
   140006610:	je     0x140006600
   140006612:	cmp    eax,0x2
   140006615:	je     0x1400066b0
   14000661b:	add    rsp,0x28
   14000661f:	pop    rbx
   140006620:	pop    rsi
   140006621:	pop    rdi
   140006622:	pop    rbp
   140006623:	ret
   140006624:	nop    DWORD PTR [rax+0x0]
   140006628:	mov    eax,0x1
   14000662d:	xchg   DWORD PTR [rip+0x64bd],eax        # 0x14000caf0
   140006633:	test   eax,eax
   140006635:	jne    0x140006688
   140006637:	lea    rbx,[rip+0x64c2]        # 0x14000cb00
   14000663e:	mov    rdi,QWORD PTR [rip+0x6b9b]        # 0x14000d1e0
   140006645:	mov    rcx,rbx
   140006648:	call   rdi
   14000664a:	lea    rcx,[rbx+0x28]
   14000664e:	call   rdi
   140006650:	lea    rcx,[rip+0x69]        # 0x1400066c0
   140006657:	call   0x140001440
   14000665c:	mov    DWORD PTR [rip+0x648a],0x2        # 0x14000caf0
   140006666:	mov    rcx,rsi
   140006669:	neg    rcx
   14000666c:	and    ecx,0x28
   14000666f:	add    rcx,rbx
   140006672:	add    rsp,0x28
   140006676:	pop    rbx
   140006677:	pop    rsi
   140006678:	pop    rdi
   140006679:	pop    rbp
   14000667a:	rex.W jmp QWORD PTR [rip+0x6b4f]        # 0x14000d1d0
   140006681:	nop    DWORD PTR [rax+0x0]
   140006688:	lea    rbx,[rip+0x6471]        # 0x14000cb00
   14000668f:	cmp    eax,0x2
   140006692:	je     0x14000665c
   140006694:	mov    eax,DWORD PTR [rip+0x6456]        # 0x14000caf0
   14000669a:	cmp    eax,0x1
   14000669d:	je     0x1400065f7
   1400066a3:	jmp    0x140006612
   1400066a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400066b0:	lea    rbx,[rip+0x6449]        # 0x14000cb00
   1400066b7:	jmp    0x140006666
   1400066b9:	nop    DWORD PTR [rax+0x0]
   1400066c0:	push   rbp
   1400066c1:	push   rbx
   1400066c2:	sub    rsp,0x28
   1400066c6:	lea    rbp,[rsp+0x20]
   1400066cb:	mov    eax,0x3
   1400066d0:	xchg   DWORD PTR [rip+0x641a],eax        # 0x14000caf0
   1400066d6:	cmp    eax,0x2
   1400066d9:	je     0x1400066e8
   1400066db:	add    rsp,0x28
   1400066df:	pop    rbx
   1400066e0:	pop    rbp
   1400066e1:	ret
   1400066e2:	nop    WORD PTR [rax+rax*1+0x0]
   1400066e8:	mov    rbx,QWORD PTR [rip+0x6ad9]        # 0x14000d1c8
   1400066ef:	lea    rcx,[rip+0x640a]        # 0x14000cb00
   1400066f6:	call   rbx
   1400066f8:	lea    rcx,[rip+0x6429]        # 0x14000cb28
   1400066ff:	mov    rax,rbx
   140006702:	add    rsp,0x28
   140006706:	pop    rbx
   140006707:	pop    rbp
   140006708:	rex.W jmp rax
   14000670b:	nop    DWORD PTR [rax+rax*1+0x0]
   140006710:	push   rbp
   140006711:	push   rsi
   140006712:	push   rbx
   140006713:	sub    rsp,0x30
   140006717:	lea    rbp,[rsp+0x30]
   14000671c:	mov    ebx,ecx
   14000671e:	xor    ecx,ecx
   140006720:	call   0x1400065d0
   140006725:	cmp    ebx,0x9
   140006728:	jg     0x140006768
   14000672a:	lea    rdx,[rip+0x636f]        # 0x14000caa0
   140006731:	movsxd rcx,ebx
   140006734:	mov    rax,QWORD PTR [rdx+rcx*8]
   140006738:	test   rax,rax
   14000673b:	je     0x1400067b8
   14000673d:	mov    r8,QWORD PTR [rax]
   140006740:	cmp    DWORD PTR [rip+0x63a9],0x2        # 0x14000caf0
   140006747:	mov    QWORD PTR [rdx+rcx*8],r8
   14000674b:	jne    0x1400067a1
   14000674d:	mov    QWORD PTR [rbp-0x8],rax
   140006751:	lea    rcx,[rip+0x63a8]        # 0x14000cb00
   140006758:	call   QWORD PTR [rip+0x6a92]        # 0x14000d1f0
   14000675e:	mov    rax,QWORD PTR [rbp-0x8]
   140006762:	jmp    0x1400067a1
   140006764:	nop    DWORD PTR [rax+0x0]
   140006768:	mov    ecx,ebx
   14000676a:	mov    esi,0x1
   14000676f:	shl    esi,cl
   140006771:	lea    eax,[rsi-0x1]
   140006774:	cdqe
   140006776:	lea    rcx,[rax*4+0x27]
   14000677e:	shr    rcx,0x3
   140006782:	mov    ecx,ecx
   140006784:	shl    rcx,0x3
   140006788:	call   0x140007a50
   14000678d:	test   rax,rax
   140006790:	je     0x1400067a9
   140006792:	cmp    DWORD PTR [rip+0x6357],0x2        # 0x14000caf0
   140006799:	mov    DWORD PTR [rax+0x8],ebx
   14000679c:	mov    DWORD PTR [rax+0xc],esi
   14000679f:	je     0x14000674d
   1400067a1:	mov    QWORD PTR [rax+0x10],0x0
   1400067a9:	add    rsp,0x30
   1400067ad:	pop    rbx
   1400067ae:	pop    rsi
   1400067af:	pop    rbp
   1400067b0:	ret
   1400067b1:	nop    DWORD PTR [rax+0x0]
   1400067b8:	mov    ecx,ebx
   1400067ba:	mov    esi,0x1
   1400067bf:	lea    r8,[rip+0x59da]        # 0x14000c1a0
   1400067c6:	shl    esi,cl
   1400067c8:	lea    eax,[rsi-0x1]
   1400067cb:	cdqe
   1400067cd:	lea    rcx,[rax*4+0x27]
   1400067d5:	mov    rax,QWORD PTR [rip+0x1884]        # 0x140008060
   1400067dc:	shr    rcx,0x3
   1400067e0:	mov    rdx,rax
   1400067e3:	sub    rdx,r8
   1400067e6:	sar    rdx,0x3
   1400067ea:	add    rdx,rcx
   1400067ed:	cmp    rdx,0x120
   1400067f4:	ja     0x140006784
   1400067f6:	lea    rdx,[rax+rcx*8]
   1400067fa:	mov    QWORD PTR [rip+0x185f],rdx        # 0x140008060
   140006801:	jmp    0x140006792
   140006803:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000680e:	xchg   ax,ax
   140006810:	push   rbp
   140006811:	push   rbx
   140006812:	sub    rsp,0x28
   140006816:	lea    rbp,[rsp+0x20]
   14000681b:	mov    rbx,rcx
   14000681e:	test   rcx,rcx
   140006821:	je     0x14000685e
   140006823:	cmp    DWORD PTR [rcx+0x8],0x9
   140006827:	jle    0x140006838
   140006829:	add    rsp,0x28
   14000682d:	pop    rbx
   14000682e:	pop    rbp
   14000682f:	jmp    0x140007a38
   140006834:	nop    DWORD PTR [rax+0x0]
   140006838:	xor    ecx,ecx
   14000683a:	call   0x1400065d0
   14000683f:	movsxd rdx,DWORD PTR [rbx+0x8]
   140006843:	lea    rax,[rip+0x6256]        # 0x14000caa0
   14000684a:	cmp    DWORD PTR [rip+0x629f],0x2        # 0x14000caf0
   140006851:	mov    rcx,QWORD PTR [rax+rdx*8]
   140006855:	mov    QWORD PTR [rax+rdx*8],rbx
   140006859:	mov    QWORD PTR [rbx],rcx
   14000685c:	je     0x140006868
   14000685e:	add    rsp,0x28
   140006862:	pop    rbx
   140006863:	pop    rbp
   140006864:	ret
   140006865:	nop    DWORD PTR [rax]
   140006868:	lea    rcx,[rip+0x6291]        # 0x14000cb00
   14000686f:	add    rsp,0x28
   140006873:	pop    rbx
   140006874:	pop    rbp
   140006875:	rex.W jmp QWORD PTR [rip+0x6974]        # 0x14000d1f0
   14000687c:	nop    DWORD PTR [rax+0x0]
   140006880:	push   rbp
   140006881:	push   r12
   140006883:	push   rdi
   140006884:	push   rsi
   140006885:	push   rbx
   140006886:	sub    rsp,0x20
   14000688a:	lea    rbp,[rsp+0x20]
   14000688f:	mov    edi,DWORD PTR [rcx+0x14]
   140006892:	mov    rbx,rcx
   140006895:	movsxd rsi,r8d
   140006898:	movsxd rdx,edx
   14000689b:	xor    ecx,ecx
   14000689d:	nop    DWORD PTR [rax]
   1400068a0:	mov    eax,DWORD PTR [rbx+rcx*4+0x18]
   1400068a4:	imul   rax,rdx
   1400068a8:	add    rax,rsi
   1400068ab:	mov    DWORD PTR [rbx+rcx*4+0x18],eax
   1400068af:	mov    rsi,rax
   1400068b2:	add    rcx,0x1
   1400068b6:	shr    rsi,0x20
   1400068ba:	cmp    edi,ecx
   1400068bc:	jg     0x1400068a0
   1400068be:	mov    r12,rbx
   1400068c1:	test   rsi,rsi
   1400068c4:	je     0x1400068db
   1400068c6:	cmp    DWORD PTR [rbx+0xc],edi
   1400068c9:	jle    0x1400068f0
   1400068cb:	movsxd rax,edi
   1400068ce:	add    edi,0x1
   1400068d1:	mov    r12,rbx
   1400068d4:	mov    DWORD PTR [rbx+rax*4+0x18],esi
   1400068d8:	mov    DWORD PTR [rbx+0x14],edi
   1400068db:	mov    rax,r12
   1400068de:	add    rsp,0x20
   1400068e2:	pop    rbx
   1400068e3:	pop    rsi
   1400068e4:	pop    rdi
   1400068e5:	pop    r12
   1400068e7:	pop    rbp
   1400068e8:	ret
   1400068e9:	nop    DWORD PTR [rax+0x0]
   1400068f0:	mov    eax,DWORD PTR [rbx+0x8]
   1400068f3:	lea    ecx,[rax+0x1]
   1400068f6:	call   0x140006710
   1400068fb:	mov    r12,rax
   1400068fe:	test   rax,rax
   140006901:	je     0x1400068db
   140006903:	lea    rcx,[rax+0x10]
   140006907:	movsxd rax,DWORD PTR [rbx+0x14]
   14000690b:	lea    rdx,[rbx+0x10]
   14000690f:	lea    r8,[rax*4+0x8]
   140006917:	call   0x140007a58
   14000691c:	mov    rcx,rbx
   14000691f:	mov    rbx,r12
   140006922:	call   0x140006810
   140006927:	movsxd rax,edi
   14000692a:	add    edi,0x1
   14000692d:	mov    r12,rbx
   140006930:	mov    DWORD PTR [rbx+rax*4+0x18],esi
   140006934:	mov    DWORD PTR [rbx+0x14],edi
   140006937:	jmp    0x1400068db
   140006939:	nop    DWORD PTR [rax+0x0]
   140006940:	push   rbp
   140006941:	push   rbx
   140006942:	sub    rsp,0x38
   140006946:	lea    rbp,[rsp+0x30]
   14000694b:	mov    ebx,ecx
   14000694d:	xor    ecx,ecx
   14000694f:	call   0x1400065d0
   140006954:	mov    rax,QWORD PTR [rip+0x614d]        # 0x14000caa8
   14000695b:	test   rax,rax
   14000695e:	je     0x140006990
   140006960:	mov    rdx,QWORD PTR [rax]
   140006963:	cmp    DWORD PTR [rip+0x6186],0x2        # 0x14000caf0
   14000696a:	mov    QWORD PTR [rip+0x6137],rdx        # 0x14000caa8
   140006971:	je     0x1400069d8
   140006973:	mov    rdx,QWORD PTR [rip+0x2d76]        # 0x1400096f0
   14000697a:	mov    DWORD PTR [rax+0x18],ebx
   14000697d:	mov    QWORD PTR [rax+0x10],rdx
   140006981:	add    rsp,0x38
   140006985:	pop    rbx
   140006986:	pop    rbp
   140006987:	ret
   140006988:	nop    DWORD PTR [rax+rax*1+0x0]
   140006990:	mov    rax,QWORD PTR [rip+0x16c9]        # 0x140008060
   140006997:	lea    rcx,[rip+0x5802]        # 0x14000c1a0
   14000699e:	mov    rdx,rax
   1400069a1:	sub    rdx,rcx
   1400069a4:	sar    rdx,0x3
   1400069a8:	add    rdx,0x5
   1400069ac:	cmp    rdx,0x120
   1400069b3:	jbe    0x1400069f0
   1400069b5:	mov    ecx,0x28
   1400069ba:	call   0x140007a50
   1400069bf:	test   rax,rax
   1400069c2:	je     0x140006981
   1400069c4:	mov    rdx,QWORD PTR [rip+0x2d1d]        # 0x1400096e8
   1400069cb:	cmp    DWORD PTR [rip+0x611e],0x2        # 0x14000caf0
   1400069d2:	mov    QWORD PTR [rax+0x8],rdx
   1400069d6:	jne    0x140006973
   1400069d8:	mov    QWORD PTR [rbp-0x8],rax
   1400069dc:	lea    rcx,[rip+0x611d]        # 0x14000cb00
   1400069e3:	call   QWORD PTR [rip+0x6807]        # 0x14000d1f0
   1400069e9:	mov    rax,QWORD PTR [rbp-0x8]
   1400069ed:	jmp    0x140006973
   1400069ef:	nop
   1400069f0:	lea    rdx,[rax+0x28]
   1400069f4:	mov    QWORD PTR [rip+0x1665],rdx        # 0x140008060
   1400069fb:	jmp    0x1400069c4
   1400069fd:	nop    DWORD PTR [rax]
   140006a00:	push   rbp
   140006a01:	push   r15
   140006a03:	push   r14
   140006a05:	push   r13
   140006a07:	push   r12
   140006a09:	push   rdi
   140006a0a:	push   rsi
   140006a0b:	push   rbx
   140006a0c:	sub    rsp,0x38
   140006a10:	lea    rbp,[rsp+0x30]
   140006a15:	movsxd r14,DWORD PTR [rcx+0x14]
   140006a19:	movsxd r13,DWORD PTR [rdx+0x14]
   140006a1d:	mov    r9,rcx
   140006a20:	mov    r15,rdx
   140006a23:	cmp    r14d,r13d
   140006a26:	jl     0x140006a37
   140006a28:	mov    eax,r13d
   140006a2b:	mov    r15,rcx
   140006a2e:	movsxd r13,r14d
   140006a31:	mov    r9,rdx
   140006a34:	movsxd r14,eax
   140006a37:	mov    ecx,DWORD PTR [r15+0x8]
   140006a3b:	lea    ebx,[r13+r14*1+0x0]
   140006a40:	cmp    DWORD PTR [r15+0xc],ebx
   140006a44:	jge    0x140006a49
   140006a46:	add    ecx,0x1
   140006a49:	mov    QWORD PTR [rbp+0x50],r9
   140006a4d:	call   0x140006710
   140006a52:	mov    rdi,rax
   140006a55:	test   rax,rax
   140006a58:	je     0x140006b53
   140006a5e:	lea    r12,[rax+0x18]
   140006a62:	movsxd rax,ebx
   140006a65:	mov    r9,QWORD PTR [rbp+0x50]
   140006a69:	lea    rsi,[r12+rax*4]
   140006a6d:	cmp    r12,rsi
   140006a70:	jae    0x140006a9a
   140006a72:	mov    rax,rsi
   140006a75:	xor    edx,edx
   140006a77:	mov    rcx,r12
   140006a7a:	mov    QWORD PTR [rbp+0x50],r9
   140006a7e:	sub    rax,rdi
   140006a81:	sub    rax,0x19
   140006a85:	shr    rax,0x2
   140006a89:	lea    r8,[rax*4+0x4]
   140006a91:	call   0x140007a60
   140006a96:	mov    r9,QWORD PTR [rbp+0x50]
   140006a9a:	add    r9,0x18
   140006a9e:	lea    r11,[r15+0x18]
   140006aa2:	lea    r14,[r9+r14*4]
   140006aa6:	lea    r13,[r11+r13*4]
   140006aaa:	cmp    r9,r14
   140006aad:	jae    0x140006b38
   140006ab3:	mov    rax,r13
   140006ab6:	lea    r10,[r15+0x19]
   140006aba:	sub    rax,r15
   140006abd:	sub    rax,0x19
   140006ac1:	shr    rax,0x2
   140006ac5:	cmp    r13,r10
   140006ac8:	lea    rdx,[rax*4+0x4]
   140006ad0:	mov    eax,0x4
   140006ad5:	cmovae rax,rdx
   140006ad9:	mov    QWORD PTR [rbp-0x8],rax
   140006add:	jmp    0x140006ae9
   140006adf:	nop
   140006ae0:	add    r12,0x4
   140006ae4:	cmp    r9,r14
   140006ae7:	jae    0x140006b38
   140006ae9:	mov    r10d,DWORD PTR [r9]
   140006aec:	add    r9,0x4
   140006af0:	test   r10d,r10d
   140006af3:	je     0x140006ae0
   140006af5:	mov    rcx,r12
   140006af8:	mov    rdx,r11
   140006afb:	xor    r8d,r8d
   140006afe:	xchg   ax,ax
   140006b00:	mov    eax,DWORD PTR [rdx]
   140006b02:	mov    r15d,DWORD PTR [rcx]
   140006b05:	add    rdx,0x4
   140006b09:	add    rcx,0x4
   140006b0d:	imul   rax,r10
   140006b11:	add    rax,r15
   140006b14:	add    rax,r8
   140006b17:	mov    r8,rax
   140006b1a:	mov    DWORD PTR [rcx-0x4],eax
   140006b1d:	shr    r8,0x20
   140006b21:	cmp    rdx,r13
   140006b24:	jb     0x140006b00
   140006b26:	mov    rax,QWORD PTR [rbp-0x8]
   140006b2a:	add    r12,0x4
   140006b2e:	mov    DWORD PTR [r12+rax*1-0x4],r8d
   140006b33:	cmp    r9,r14
   140006b36:	jb     0x140006ae9
   140006b38:	test   ebx,ebx
   140006b3a:	jg     0x140006b45
   140006b3c:	jmp    0x140006b50
   140006b3e:	xchg   ax,ax
   140006b40:	sub    ebx,0x1
   140006b43:	je     0x140006b50
   140006b45:	mov    eax,DWORD PTR [rsi-0x4]
   140006b48:	sub    rsi,0x4
   140006b4c:	test   eax,eax
   140006b4e:	je     0x140006b40
   140006b50:	mov    DWORD PTR [rdi+0x14],ebx
   140006b53:	mov    rax,rdi
   140006b56:	add    rsp,0x38
   140006b5a:	pop    rbx
   140006b5b:	pop    rsi
   140006b5c:	pop    rdi
   140006b5d:	pop    r12
   140006b5f:	pop    r13
   140006b61:	pop    r14
   140006b63:	pop    r15
   140006b65:	pop    rbp
   140006b66:	ret
   140006b67:	nop    WORD PTR [rax+rax*1+0x0]
   140006b70:	push   rbp
   140006b71:	push   r12
   140006b73:	push   rdi
   140006b74:	push   rsi
   140006b75:	push   rbx
   140006b76:	sub    rsp,0x20
   140006b7a:	lea    rbp,[rsp+0x20]
   140006b7f:	mov    eax,edx
   140006b81:	mov    rsi,rcx
   140006b84:	mov    ebx,edx
   140006b86:	and    eax,0x3
   140006b89:	jne    0x140006c50
   140006b8f:	sar    ebx,0x2
   140006b92:	mov    r12,rsi
   140006b95:	je     0x140006bea
   140006b97:	mov    rdi,QWORD PTR [rip+0x55e2]        # 0x14000c180
   140006b9e:	test   rdi,rdi
   140006ba1:	je     0x140006c80
   140006ba7:	mov    r12,rsi
   140006baa:	jmp    0x140006bbf
   140006bac:	nop    DWORD PTR [rax+0x0]
   140006bb0:	sar    ebx,1
   140006bb2:	je     0x140006bea
   140006bb4:	mov    rsi,QWORD PTR [rdi]
   140006bb7:	test   rsi,rsi
   140006bba:	je     0x140006c00
   140006bbc:	mov    rdi,rsi
   140006bbf:	test   bl,0x1
   140006bc2:	je     0x140006bb0
   140006bc4:	mov    rdx,rdi
   140006bc7:	mov    rcx,r12
   140006bca:	call   0x140006a00
   140006bcf:	mov    rsi,rax
   140006bd2:	test   rax,rax
   140006bd5:	je     0x140006c78
   140006bdb:	mov    rcx,r12
   140006bde:	mov    r12,rsi
   140006be1:	call   0x140006810
   140006be6:	sar    ebx,1
   140006be8:	jne    0x140006bb4
   140006bea:	mov    rax,r12
   140006bed:	add    rsp,0x20
   140006bf1:	pop    rbx
   140006bf2:	pop    rsi
   140006bf3:	pop    rdi
   140006bf4:	pop    r12
   140006bf6:	pop    rbp
   140006bf7:	ret
   140006bf8:	nop    DWORD PTR [rax+rax*1+0x0]
   140006c00:	mov    ecx,0x1
   140006c05:	call   0x1400065d0
   140006c0a:	mov    rsi,QWORD PTR [rdi]
   140006c0d:	test   rsi,rsi
   140006c10:	je     0x140006c30
   140006c12:	cmp    DWORD PTR [rip+0x5ed7],0x2        # 0x14000caf0
   140006c19:	jne    0x140006bbc
   140006c1b:	lea    rcx,[rip+0x5f06]        # 0x14000cb28
   140006c22:	call   QWORD PTR [rip+0x65c8]        # 0x14000d1f0
   140006c28:	jmp    0x140006bbc
   140006c2a:	nop    WORD PTR [rax+rax*1+0x0]
   140006c30:	mov    rdx,rdi
   140006c33:	mov    rcx,rdi
   140006c36:	call   0x140006a00
   140006c3b:	mov    QWORD PTR [rdi],rax
   140006c3e:	mov    rsi,rax
   140006c41:	test   rax,rax
   140006c44:	je     0x140006c78
   140006c46:	mov    QWORD PTR [rax],0x0
   140006c4d:	jmp    0x140006c12
   140006c4f:	nop
   140006c50:	sub    eax,0x1
   140006c53:	lea    rdx,[rip+0x2946]        # 0x1400095a0
   140006c5a:	xor    r8d,r8d
   140006c5d:	cdqe
   140006c5f:	mov    edx,DWORD PTR [rdx+rax*4]
   140006c62:	call   0x140006880
   140006c67:	mov    rsi,rax
   140006c6a:	test   rax,rax
   140006c6d:	jne    0x140006b8f
   140006c73:	nop    DWORD PTR [rax+rax*1+0x0]
   140006c78:	xor    r12d,r12d
   140006c7b:	jmp    0x140006bea
   140006c80:	mov    ecx,0x1
   140006c85:	call   0x1400065d0
   140006c8a:	mov    rdi,QWORD PTR [rip+0x54ef]        # 0x14000c180
   140006c91:	test   rdi,rdi
   140006c94:	je     0x140006cb5
   140006c96:	cmp    DWORD PTR [rip+0x5e53],0x2        # 0x14000caf0
   140006c9d:	jne    0x140006ba7
   140006ca3:	lea    rcx,[rip+0x5e7e]        # 0x14000cb28
   140006caa:	call   QWORD PTR [rip+0x6540]        # 0x14000d1f0
   140006cb0:	jmp    0x140006ba7
   140006cb5:	mov    ecx,0x1
   140006cba:	call   0x140006710
   140006cbf:	mov    rdi,rax
   140006cc2:	test   rax,rax
   140006cc5:	je     0x140006ce5
   140006cc7:	movabs rax,0x27100000001
   140006cd1:	mov    QWORD PTR [rip+0x54a8],rdi        # 0x14000c180
   140006cd8:	mov    QWORD PTR [rdi+0x14],rax
   140006cdc:	mov    QWORD PTR [rdi],0x0
   140006ce3:	jmp    0x140006c96
   140006ce5:	mov    QWORD PTR [rip+0x5490],0x0        # 0x14000c180
   140006cf0:	jmp    0x140006c78
   140006cf2:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140006cfd:	nop    DWORD PTR [rax]
   140006d00:	push   rbp
   140006d01:	push   r15
   140006d03:	push   r14
   140006d05:	push   r13
   140006d07:	push   r12
   140006d09:	push   rdi
   140006d0a:	push   rsi
   140006d0b:	push   rbx
   140006d0c:	sub    rsp,0x28
   140006d10:	lea    rbp,[rsp+0x20]
   140006d15:	mov    r13,rcx
   140006d18:	mov    esi,edx
   140006d1a:	mov    ecx,DWORD PTR [rcx+0x8]
   140006d1d:	mov    r14d,edx
   140006d20:	mov    ebx,DWORD PTR [r13+0x14]
   140006d24:	sar    esi,0x5
   140006d27:	mov    eax,DWORD PTR [r13+0xc]
   140006d2b:	add    ebx,esi
   140006d2d:	lea    r12d,[rbx+0x1]
   140006d31:	cmp    r12d,eax
   140006d34:	jle    0x140006d4a
   140006d36:	cs nop WORD PTR [rax+rax*1+0x0]
   140006d40:	add    eax,eax
   140006d42:	add    ecx,0x1
   140006d45:	cmp    r12d,eax
   140006d48:	jg     0x140006d40
   140006d4a:	call   0x140006710
   140006d4f:	mov    r15,rax
   140006d52:	test   rax,rax
   140006d55:	je     0x140006dfe
   140006d5b:	lea    rdi,[rax+0x18]
   140006d5f:	test   esi,esi
   140006d61:	jle    0x140006d77
   140006d63:	shl    rsi,0x2
   140006d67:	mov    rcx,rdi
   140006d6a:	xor    edx,edx
   140006d6c:	mov    r8,rsi
   140006d6f:	add    rdi,rsi
   140006d72:	call   0x140007a60
   140006d77:	movsxd rax,DWORD PTR [r13+0x14]
   140006d7b:	lea    rsi,[r13+0x18]
   140006d7f:	lea    r8,[rsi+rax*4]
   140006d83:	and    r14d,0x1f
   140006d87:	je     0x140006e18
   140006d8d:	mov    r10d,0x20
   140006d93:	mov    r9,rdi
   140006d96:	xor    edx,edx
   140006d98:	sub    r10d,r14d
   140006d9b:	nop    DWORD PTR [rax+rax*1+0x0]
   140006da0:	mov    eax,DWORD PTR [rsi]
   140006da2:	mov    ecx,r14d
   140006da5:	add    r9,0x4
   140006da9:	add    rsi,0x4
   140006dad:	shl    eax,cl
   140006daf:	mov    ecx,r10d
   140006db2:	or     eax,edx
   140006db4:	mov    DWORD PTR [r9-0x4],eax
   140006db8:	mov    edx,DWORD PTR [rsi-0x4]
   140006dbb:	shr    edx,cl
   140006dbd:	cmp    rsi,r8
   140006dc0:	jb     0x140006da0
   140006dc2:	mov    rax,r8
   140006dc5:	lea    rcx,[r13+0x19]
   140006dc9:	sub    rax,r13
   140006dcc:	sub    rax,0x19
   140006dd0:	shr    rax,0x2
   140006dd4:	cmp    r8,rcx
   140006dd7:	mov    ecx,0x4
   140006ddc:	lea    rax,[rax*4+0x4]
   140006de4:	cmovb  rax,rcx
   140006de8:	mov    DWORD PTR [rdi+rax*1],edx
   140006deb:	test   edx,edx
   140006ded:	jne    0x140006df2
   140006def:	mov    r12d,ebx
   140006df2:	mov    DWORD PTR [r15+0x14],r12d
   140006df6:	mov    rcx,r13
   140006df9:	call   0x140006810
   140006dfe:	mov    rax,r15
   140006e01:	add    rsp,0x28
   140006e05:	pop    rbx
   140006e06:	pop    rsi
   140006e07:	pop    rdi
   140006e08:	pop    r12
   140006e0a:	pop    r13
   140006e0c:	pop    r14
   140006e0e:	pop    r15
   140006e10:	pop    rbp
   140006e11:	ret
   140006e12:	nop    WORD PTR [rax+rax*1+0x0]
   140006e18:	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140006e19:	cmp    rsi,r8
   140006e1c:	jae    0x140006def
   140006e1e:	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140006e1f:	cmp    rsi,r8
   140006e22:	jb     0x140006e18
   140006e24:	jmp    0x140006def
   140006e26:	cs nop WORD PTR [rax+rax*1+0x0]
   140006e30:	movsxd rax,DWORD PTR [rdx+0x14]
   140006e34:	mov    r9d,DWORD PTR [rcx+0x14]
   140006e38:	sub    r9d,eax
   140006e3b:	jne    0x140006e74
   140006e3d:	lea    r8,[rax*4+0x0]
   140006e45:	add    rcx,0x18
   140006e49:	lea    rax,[rcx+r8*1]
   140006e4d:	lea    rdx,[rdx+r8*1+0x18]
   140006e52:	jmp    0x140006e5d
   140006e54:	nop    DWORD PTR [rax+0x0]
   140006e58:	cmp    rcx,rax
   140006e5b:	jae    0x140006e74
   140006e5d:	sub    rax,0x4
   140006e61:	sub    rdx,0x4
   140006e65:	mov    r10d,DWORD PTR [rdx]
   140006e68:	cmp    DWORD PTR [rax],r10d
   140006e6b:	je     0x140006e58
   140006e6d:	sbb    r9d,r9d
   140006e70:	or     r9d,0x1
   140006e74:	mov    eax,r9d
   140006e77:	ret
   140006e78:	nop    DWORD PTR [rax+rax*1+0x0]
   140006e80:	push   rbp
   140006e81:	push   r14
   140006e83:	push   r13
   140006e85:	push   r12
   140006e87:	push   rdi
   140006e88:	push   rsi
   140006e89:	push   rbx
   140006e8a:	sub    rsp,0x20
   140006e8e:	lea    rbp,[rsp+0x20]
   140006e93:	movsxd rax,DWORD PTR [rdx+0x14]
   140006e97:	mov    rbx,rcx
   140006e9a:	mov    rsi,rdx
   140006e9d:	cmp    DWORD PTR [rcx+0x14],eax
   140006ea0:	jne    0x140006ff8
   140006ea6:	lea    rdx,[rax*4+0x0]
   140006eae:	lea    rcx,[rcx+0x18]
   140006eb2:	lea    rax,[rcx+rdx*1]
   140006eb6:	lea    rdx,[rsi+rdx*1+0x18]
   140006ebb:	jmp    0x140006ec9
   140006ebd:	nop    DWORD PTR [rax]
   140006ec0:	cmp    rcx,rax
   140006ec3:	jae    0x140007010
   140006ec9:	sub    rax,0x4
   140006ecd:	sub    rdx,0x4
   140006ed1:	mov    edi,DWORD PTR [rdx]
   140006ed3:	cmp    DWORD PTR [rax],edi
   140006ed5:	je     0x140006ec0
   140006ed7:	mov    edi,0x1
   140006edc:	jb     0x140006ee9
   140006ede:	mov    rax,rsi
   140006ee1:	xor    edi,edi
   140006ee3:	mov    rsi,rbx
   140006ee6:	mov    rbx,rax
   140006ee9:	mov    ecx,DWORD PTR [rsi+0x8]
   140006eec:	call   0x140006710
   140006ef1:	mov    r9,rax
   140006ef4:	test   rax,rax
   140006ef7:	je     0x140006fe3
   140006efd:	mov    DWORD PTR [rax+0x10],edi
   140006f00:	movsxd rax,DWORD PTR [rsi+0x14]
   140006f04:	lea    r13,[rsi+0x18]
   140006f08:	lea    r12,[r9+0x18]
   140006f0c:	mov    ecx,0x18
   140006f11:	xor    edx,edx
   140006f13:	mov    r10,rax
   140006f16:	lea    r11,[r13+rax*4+0x0]
   140006f1b:	movsxd rax,DWORD PTR [rbx+0x14]
   140006f1f:	lea    r8,[rbx+rax*4+0x18]
   140006f24:	nop    DWORD PTR [rax+0x0]
   140006f28:	mov    edi,DWORD PTR [rbx+rcx*1]
   140006f2b:	mov    eax,DWORD PTR [rsi+rcx*1]
   140006f2e:	sub    rax,rdi
   140006f31:	sub    rax,rdx
   140006f34:	mov    DWORD PTR [r9+rcx*1],eax
   140006f38:	mov    rdx,rax
   140006f3b:	add    rcx,0x4
   140006f3f:	mov    edi,eax
   140006f41:	shr    rdx,0x20
   140006f45:	lea    rax,[rcx+rbx*1]
   140006f49:	and    edx,0x1
   140006f4c:	cmp    rax,r8
   140006f4f:	jb     0x140006f28
   140006f51:	lea    rax,[rbx+0x19]
   140006f55:	mov    ecx,0x4
   140006f5a:	cmp    r8,rax
   140006f5d:	setae  sil
   140006f61:	sub    r8,rbx
   140006f64:	lea    r14,[r8-0x19]
   140006f68:	shr    r14,0x2
   140006f6c:	test   sil,sil
   140006f6f:	lea    rax,[r14*4+0x4]
   140006f77:	cmove  rax,rcx
   140006f7b:	add    r13,rax
   140006f7e:	lea    r8,[r12+rax*1]
   140006f82:	mov    rbx,r8
   140006f85:	mov    rcx,r13
   140006f88:	cmp    r13,r11
   140006f8b:	jae    0x140007030
   140006f91:	nop    DWORD PTR [rax+0x0]
   140006f98:	mov    eax,DWORD PTR [rcx]
   140006f9a:	add    rcx,0x4
   140006f9e:	add    rbx,0x4
   140006fa2:	sub    rax,rdx
   140006fa5:	mov    rdx,rax
   140006fa8:	mov    DWORD PTR [rbx-0x4],eax
   140006fab:	mov    edi,eax
   140006fad:	shr    rdx,0x20
   140006fb1:	and    edx,0x1
   140006fb4:	cmp    rcx,r11
   140006fb7:	jb     0x140006f98
   140006fb9:	sub    r11,0x1
   140006fbd:	sub    r11,r13
   140006fc0:	and    r11,0xfffffffffffffffc
   140006fc4:	lea    rax,[r8+r11*1]
   140006fc8:	test   edi,edi
   140006fca:	jne    0x140006fdf
   140006fcc:	nop    DWORD PTR [rax+0x0]
   140006fd0:	mov    edx,DWORD PTR [rax-0x4]
   140006fd3:	sub    rax,0x4
   140006fd7:	sub    r10d,0x1
   140006fdb:	test   edx,edx
   140006fdd:	je     0x140006fd0
   140006fdf:	mov    DWORD PTR [r9+0x14],r10d
   140006fe3:	mov    rax,r9
   140006fe6:	add    rsp,0x20
   140006fea:	pop    rbx
   140006feb:	pop    rsi
   140006fec:	pop    rdi
   140006fed:	pop    r12
   140006fef:	pop    r13
   140006ff1:	pop    r14
   140006ff3:	pop    rbp
   140006ff4:	ret
   140006ff5:	nop    DWORD PTR [rax]
   140006ff8:	mov    edi,0x1
   140006ffd:	jns    0x140006ede
   140007003:	jmp    0x140006ee9
   140007008:	nop    DWORD PTR [rax+rax*1+0x0]
   140007010:	xor    ecx,ecx
   140007012:	call   0x140006710
   140007017:	mov    r9,rax
   14000701a:	test   rax,rax
   14000701d:	je     0x140006fe3
   14000701f:	mov    QWORD PTR [rax+0x14],0x1
   140007027:	jmp    0x140006fe3
   140007029:	nop    DWORD PTR [rax+0x0]
   140007030:	xor    eax,eax
   140007032:	shl    r14,0x2
   140007036:	test   sil,sil
   140007039:	cmove  r14,rax
   14000703d:	lea    rax,[r12+r14*1]
   140007041:	jmp    0x140006fc8
   140007043:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000704e:	xchg   ax,ax
   140007050:	push   rbp
   140007051:	push   rdi
   140007052:	push   rsi
   140007053:	push   rbx
   140007054:	lea    rbp,[rsp]
   140007058:	movsxd rax,DWORD PTR [rcx+0x14]
   14000705c:	lea    r11,[rcx+0x18]
   140007060:	lea    r10,[r11+rax*4]
   140007064:	mov    r9d,DWORD PTR [r10-0x4]
   140007068:	lea    rsi,[r10-0x4]
   14000706c:	bsr    ecx,r9d
   140007070:	mov    edi,ecx
   140007072:	mov    ecx,0x20
   140007077:	xor    edi,0x1f
   14000707a:	mov    r8d,ecx
   14000707d:	sub    r8d,edi
   140007080:	mov    DWORD PTR [rdx],r8d
   140007083:	cmp    edi,0xa
   140007086:	jle    0x140007100
   140007088:	lea    ebx,[rdi-0xb]
   14000708b:	cmp    r11,rsi
   14000708e:	jae    0x1400070e0
   140007090:	mov    edx,DWORD PTR [r10-0x8]
   140007094:	test   ebx,ebx
   140007096:	je     0x1400070e7
   140007098:	sub    ecx,ebx
   14000709a:	mov    eax,r9d
   14000709d:	mov    esi,edx
   14000709f:	mov    r8d,ecx
   1400070a2:	mov    ecx,ebx
   1400070a4:	shl    eax,cl
   1400070a6:	mov    ecx,r8d
   1400070a9:	shr    esi,cl
   1400070ab:	mov    ecx,ebx
   1400070ad:	or     eax,esi
   1400070af:	shl    edx,cl
   1400070b1:	lea    rcx,[r10-0x8]
   1400070b5:	or     eax,0x3ff00000
   1400070ba:	shl    rax,0x20
   1400070be:	cmp    r11,rcx
   1400070c1:	jae    0x1400070f3
   1400070c3:	mov    r9d,DWORD PTR [r10-0xc]
   1400070c7:	mov    ecx,r8d
   1400070ca:	shr    r9d,cl
   1400070cd:	or     edx,r9d
   1400070d0:	or     rax,rdx
   1400070d3:	movq   xmm0,rax
   1400070d8:	pop    rbx
   1400070d9:	pop    rsi
   1400070da:	pop    rdi
   1400070db:	pop    rbp
   1400070dc:	ret
   1400070dd:	nop    DWORD PTR [rax]
   1400070e0:	xor    edx,edx
   1400070e2:	cmp    edi,0xb
   1400070e5:	jne    0x140007140
   1400070e7:	mov    eax,r9d
   1400070ea:	or     eax,0x3ff00000
   1400070ef:	shl    rax,0x20
   1400070f3:	or     rax,rdx
   1400070f6:	movq   xmm0,rax
   1400070fb:	pop    rbx
   1400070fc:	pop    rsi
   1400070fd:	pop    rdi
   1400070fe:	pop    rbp
   1400070ff:	ret
   140007100:	mov    ecx,0xb
   140007105:	mov    eax,r9d
   140007108:	xor    r8d,r8d
   14000710b:	sub    ecx,edi
   14000710d:	shr    eax,cl
   14000710f:	or     eax,0x3ff00000
   140007114:	shl    rax,0x20
   140007118:	cmp    r11,rsi
   14000711b:	jae    0x140007124
   14000711d:	mov    r8d,DWORD PTR [r10-0x8]
   140007121:	shr    r8d,cl
   140007124:	lea    ecx,[rdi+0x15]
   140007127:	mov    edx,r9d
   14000712a:	shl    edx,cl
   14000712c:	or     edx,r8d
   14000712f:	or     rax,rdx
   140007132:	movq   xmm0,rax
   140007137:	pop    rbx
   140007138:	pop    rsi
   140007139:	pop    rdi
   14000713a:	pop    rbp
   14000713b:	ret
   14000713c:	nop    DWORD PTR [rax+0x0]
   140007140:	mov    eax,r9d
   140007143:	mov    ecx,ebx
   140007145:	xor    edx,edx
   140007147:	shl    eax,cl
   140007149:	or     eax,0x3ff00000
   14000714e:	shl    rax,0x20
   140007152:	or     rax,rdx
   140007155:	movq   xmm0,rax
   14000715a:	pop    rbx
   14000715b:	pop    rsi
   14000715c:	pop    rdi
   14000715d:	pop    rbp
   14000715e:	ret
   14000715f:	nop
   140007160:	push   rbp
   140007161:	push   rsi
   140007162:	push   rbx
   140007163:	sub    rsp,0x30
   140007167:	lea    rbp,[rsp+0x20]
   14000716c:	movups XMMWORD PTR [rbp+0x0],xmm6
   140007170:	mov    ecx,0x1
   140007175:	mov    rsi,rdx
   140007178:	movupd xmm6,xmm0
   14000717c:	mov    rbx,r8
   14000717f:	call   0x140006710
   140007184:	mov    rdx,rax
   140007187:	test   rax,rax
   14000718a:	je     0x140007224
   140007190:	movq   rax,xmm6
   140007195:	mov    rcx,rax
   140007198:	shr    rcx,0x20
   14000719c:	mov    r9d,ecx
   14000719f:	shr    ecx,0x14
   1400071a2:	and    r9d,0xfffff
   1400071a9:	mov    r8d,r9d
   1400071ac:	or     r8d,0x100000
   1400071b3:	and    ecx,0x7ff
   1400071b9:	cmovne r9d,r8d
   1400071bd:	mov    r10d,ecx
   1400071c0:	test   eax,eax
   1400071c2:	je     0x140007238
   1400071c4:	xor    r8d,r8d
   1400071c7:	tzcnt  r8d,eax
   1400071cc:	mov    ecx,r8d
   1400071cf:	shr    eax,cl
   1400071d1:	test   r8d,r8d
   1400071d4:	je     0x1400071ed
   1400071d6:	mov    ecx,0x20
   1400071db:	mov    r11d,r9d
   1400071de:	sub    ecx,r8d
   1400071e1:	shl    r11d,cl
   1400071e4:	mov    ecx,r8d
   1400071e7:	or     eax,r11d
   1400071ea:	shr    r9d,cl
   1400071ed:	mov    DWORD PTR [rdx+0x18],eax
   1400071f0:	cmp    r9d,0x1
   1400071f4:	mov    eax,0x1
   1400071f9:	sbb    eax,0xffffffff
   1400071fc:	mov    DWORD PTR [rdx+0x1c],r9d
   140007200:	mov    DWORD PTR [rdx+0x14],eax
   140007203:	test   r10d,r10d
   140007206:	jne    0x140007257
   140007208:	movsxd rcx,eax
   14000720b:	sub    r8d,0x432
   140007212:	bsr    ecx,DWORD PTR [rdx+rcx*4+0x14]
   140007217:	shl    eax,0x5
   14000721a:	mov    DWORD PTR [rsi],r8d
   14000721d:	xor    ecx,0x1f
   140007220:	sub    eax,ecx
   140007222:	mov    DWORD PTR [rbx],eax
   140007224:	movups xmm6,XMMWORD PTR [rbp+0x0]
   140007228:	mov    rax,rdx
   14000722b:	add    rsp,0x30
   14000722f:	pop    rbx
   140007230:	pop    rsi
   140007231:	pop    rbp
   140007232:	ret
   140007233:	nop    DWORD PTR [rax+rax*1+0x0]
   140007238:	xor    ecx,ecx
   14000723a:	mov    eax,0x1
   14000723f:	tzcnt  ecx,r9d
   140007244:	mov    DWORD PTR [rdx+0x14],eax
   140007247:	shr    r9d,cl
   14000724a:	lea    r8d,[rcx+0x20]
   14000724e:	mov    DWORD PTR [rdx+0x18],r9d
   140007252:	test   r10d,r10d
   140007255:	je     0x140007208
   140007257:	lea    eax,[r10+r8*1-0x433]
   14000725f:	mov    DWORD PTR [rsi],eax
   140007261:	mov    eax,0x35
   140007266:	sub    eax,r8d
   140007269:	mov    DWORD PTR [rbx],eax
   14000726b:	movups xmm6,XMMWORD PTR [rbp+0x0]
   14000726f:	mov    rax,rdx
   140007272:	add    rsp,0x30
   140007276:	pop    rbx
   140007277:	pop    rsi
   140007278:	pop    rbp
   140007279:	ret
   14000727a:	nop    WORD PTR [rax+rax*1+0x0]
   140007280:	mov    rax,rcx
   140007283:	lea    rcx,[rdx+0x1]
   140007287:	movzx  edx,BYTE PTR [rdx]
   14000728a:	mov    BYTE PTR [rax],dl
   14000728c:	test   dl,dl
   14000728e:	je     0x1400072a1
   140007290:	movzx  edx,BYTE PTR [rcx]
   140007293:	add    rax,0x1
   140007297:	add    rcx,0x1
   14000729b:	mov    BYTE PTR [rax],dl
   14000729d:	test   dl,dl
   14000729f:	jne    0x140007290
   1400072a1:	ret
   1400072a2:	nop
   1400072a3:	nop
   1400072a4:	nop
   1400072a5:	nop
   1400072a6:	nop
   1400072a7:	nop
   1400072a8:	nop
   1400072a9:	nop
   1400072aa:	nop
   1400072ab:	nop
   1400072ac:	nop
   1400072ad:	nop
   1400072ae:	nop
   1400072af:	nop
   1400072b0:	xor    r8d,r8d
   1400072b3:	mov    rax,rcx
   1400072b6:	test   rdx,rdx
   1400072b9:	jne    0x1400072cf
   1400072bb:	jmp    0x1400072d4
   1400072bd:	nop    DWORD PTR [rax]
   1400072c0:	add    rax,0x1
   1400072c4:	mov    r8,rax
   1400072c7:	sub    r8,rcx
   1400072ca:	cmp    r8,rdx
   1400072cd:	jae    0x1400072d4
   1400072cf:	cmp    BYTE PTR [rax],0x0
   1400072d2:	jne    0x1400072c0
   1400072d4:	mov    rax,r8
   1400072d7:	ret
   1400072d8:	nop
   1400072d9:	nop
   1400072da:	nop
   1400072db:	nop
   1400072dc:	nop
   1400072dd:	nop
   1400072de:	nop
   1400072df:	nop
   1400072e0:	xor    r8d,r8d
   1400072e3:	mov    rax,rdx
   1400072e6:	test   rdx,rdx
   1400072e9:	jne    0x1400072f9
   1400072eb:	jmp    0x140007304
   1400072ed:	nop    DWORD PTR [rax]
   1400072f0:	add    r8,0x1
   1400072f4:	cmp    rax,r8
   1400072f7:	je     0x140007304
   1400072f9:	cmp    WORD PTR [rcx+r8*2],0x0
   1400072ff:	jne    0x1400072f0
   140007301:	mov    rax,r8
   140007304:	ret
   140007305:	nop
   140007306:	nop
   140007307:	nop
   140007308:	nop
   140007309:	nop
   14000730a:	nop
   14000730b:	nop
   14000730c:	nop
   14000730d:	nop
   14000730e:	nop
   14000730f:	nop
   140007310:	mov    rax,QWORD PTR [rip+0x2479]        # 0x140009790
   140007317:	mov    rax,QWORD PTR [rax]
   14000731a:	ret
   14000731b:	nop
   14000731c:	nop
   14000731d:	nop
   14000731e:	nop
   14000731f:	nop
   140007320:	mov    rax,QWORD PTR [rip+0x2459]        # 0x140009780
   140007327:	mov    rax,QWORD PTR [rax]
   14000732a:	ret
   14000732b:	nop
   14000732c:	nop
   14000732d:	nop
   14000732e:	nop
   14000732f:	nop
   140007330:	push   rbp
   140007331:	push   rbx
   140007332:	sub    rsp,0x28
   140007336:	lea    rbp,[rsp+0x20]
   14000733b:	mov    rbx,rcx
   14000733e:	xor    ecx,ecx
   140007340:	call   0x140007430
   140007345:	cmp    rbx,rax
   140007348:	jb     0x140007359
   14000734a:	mov    ecx,0x13
   14000734f:	call   0x140007430
   140007354:	cmp    rbx,rax
   140007357:	jbe    0x140007370
   140007359:	lea    rcx,[rbx+0x30]
   14000735d:	add    rsp,0x28
   140007361:	pop    rbx
   140007362:	pop    rbp
   140007363:	rex.W jmp QWORD PTR [rip+0x5e66]        # 0x14000d1d0
   14000736a:	nop    WORD PTR [rax+rax*1+0x0]
   140007370:	xor    ecx,ecx
   140007372:	call   0x140007430
   140007377:	mov    rdx,rax
   14000737a:	mov    rax,rbx
   14000737d:	sub    rax,rdx
   140007380:	sar    rax,0x4
   140007384:	imul   eax,eax,0xaaaaaaab
   14000738a:	lea    ecx,[rax+0x10]
   14000738d:	call   0x1400079f8
   140007392:	or     DWORD PTR [rbx+0x18],0x8000
   140007399:	add    rsp,0x28
   14000739d:	pop    rbx
   14000739e:	pop    rbp
   14000739f:	ret
   1400073a0:	push   rbp
   1400073a1:	push   rbx
   1400073a2:	sub    rsp,0x28
   1400073a6:	lea    rbp,[rsp+0x20]
   1400073ab:	mov    rbx,rcx
   1400073ae:	xor    ecx,ecx
   1400073b0:	call   0x140007430
   1400073b5:	cmp    rbx,rax
   1400073b8:	jb     0x1400073c9
   1400073ba:	mov    ecx,0x13
   1400073bf:	call   0x140007430
   1400073c4:	cmp    rbx,rax
   1400073c7:	jbe    0x1400073e0
   1400073c9:	lea    rcx,[rbx+0x30]
   1400073cd:	add    rsp,0x28
   1400073d1:	pop    rbx
   1400073d2:	pop    rbp
   1400073d3:	rex.W jmp QWORD PTR [rip+0x5e16]        # 0x14000d1f0
   1400073da:	nop    WORD PTR [rax+rax*1+0x0]
   1400073e0:	and    DWORD PTR [rbx+0x18],0xffff7fff
   1400073e7:	xor    ecx,ecx
   1400073e9:	call   0x140007430
   1400073ee:	sub    rbx,rax
   1400073f1:	sar    rbx,0x4
   1400073f5:	imul   ebx,ebx,0xaaaaaaab
   1400073fb:	lea    ecx,[rbx+0x10]
   1400073fe:	add    rsp,0x28
   140007402:	pop    rbx
   140007403:	pop    rbp
   140007404:	jmp    0x140007a08
   140007409:	nop
   14000740a:	nop
   14000740b:	nop
   14000740c:	nop
   14000740d:	nop
   14000740e:	nop
   14000740f:	nop
   140007410:	mov    rax,QWORD PTR [rip+0x5749]        # 0x14000cb60
   140007417:	ret
   140007418:	nop    DWORD PTR [rax+rax*1+0x0]
   140007420:	mov    rax,rcx
   140007423:	xchg   QWORD PTR [rip+0x5736],rax        # 0x14000cb60
   14000742a:	ret
   14000742b:	nop
   14000742c:	nop
   14000742d:	nop
   14000742e:	nop
   14000742f:	nop
   140007430:	push   rbp
   140007431:	push   rbx
   140007432:	sub    rsp,0x28
   140007436:	lea    rbp,[rsp+0x20]
   14000743b:	mov    ebx,ecx
   14000743d:	call   0x1400079c0
   140007442:	mov    ecx,ebx
   140007444:	lea    rdx,[rcx+rcx*2]
   140007448:	shl    rdx,0x4
   14000744c:	add    rax,rdx
   14000744f:	add    rsp,0x28
   140007453:	pop    rbx
   140007454:	pop    rbp
   140007455:	ret
   140007456:	nop
   140007457:	nop
   140007458:	nop
   140007459:	nop
   14000745a:	nop
   14000745b:	nop
   14000745c:	nop
   14000745d:	nop
   14000745e:	nop
   14000745f:	nop
   140007460:	push   rbp
   140007461:	mov    rbp,rsp
   140007464:	sub    rsp,0x50
   140007468:	mov    rax,rcx
   14000746b:	mov    WORD PTR [rbp+0x18],dx
   14000746f:	mov    ecx,r8d
   140007472:	test   r8d,r8d
   140007475:	jne    0x140007490
   140007477:	cmp    dx,0xff
   14000747c:	ja     0x1400074d0
   14000747e:	mov    BYTE PTR [rax],dl
   140007480:	mov    eax,0x1
   140007485:	add    rsp,0x50
   140007489:	pop    rbp
   14000748a:	ret
   14000748b:	nop    DWORD PTR [rax+rax*1+0x0]
   140007490:	lea    rdx,[rbp-0x4]
   140007494:	mov    DWORD PTR [rsp+0x28],r9d
   140007499:	lea    r8,[rbp+0x18]
   14000749d:	mov    r9d,0x1
   1400074a3:	mov    QWORD PTR [rsp+0x38],rdx
   1400074a8:	xor    edx,edx
   1400074aa:	mov    DWORD PTR [rbp-0x4],0x0
   1400074b1:	mov    QWORD PTR [rsp+0x30],0x0
   1400074ba:	mov    QWORD PTR [rsp+0x20],rax
   1400074bf:	call   QWORD PTR [rip+0x5d63]        # 0x14000d228
   1400074c5:	test   eax,eax
   1400074c7:	je     0x1400074d0
   1400074c9:	mov    edx,DWORD PTR [rbp-0x4]
   1400074cc:	test   edx,edx
   1400074ce:	je     0x140007485
   1400074d0:	call   0x1400079e8
   1400074d5:	mov    DWORD PTR [rax],0x2a
   1400074db:	mov    eax,0xffffffff
   1400074e0:	add    rsp,0x50
   1400074e4:	pop    rbp
   1400074e5:	ret
   1400074e6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400074f0:	push   rbp
   1400074f1:	push   rdi
   1400074f2:	push   rsi
   1400074f3:	push   rbx
   1400074f4:	sub    rsp,0x38
   1400074f8:	lea    rbp,[rsp+0x30]
   1400074fd:	test   rcx,rcx
   140007500:	mov    rbx,rcx
   140007503:	lea    rax,[rbp-0x5]
   140007507:	mov    esi,edx
   140007509:	cmove  rbx,rax
   14000750d:	call   0x1400079b0
   140007512:	mov    edi,eax
   140007514:	call   0x1400079a8
   140007519:	movzx  edx,si
   14000751c:	mov    r9d,edi
   14000751f:	mov    rcx,rbx
   140007522:	mov    r8d,eax
   140007525:	call   0x140007460
   14000752a:	cdqe
   14000752c:	add    rsp,0x38
   140007530:	pop    rbx
   140007531:	pop    rsi
   140007532:	pop    rdi
   140007533:	pop    rbp
   140007534:	ret
   140007535:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140007540:	push   rbp
   140007541:	push   r15
   140007543:	push   r14
   140007545:	push   r13
   140007547:	push   r12
   140007549:	push   rdi
   14000754a:	push   rsi
   14000754b:	push   rbx
   14000754c:	sub    rsp,0x38
   140007550:	lea    rbp,[rsp+0x30]
   140007555:	xor    r14d,r14d
   140007558:	mov    r12,rdx
   14000755b:	mov    r15,rcx
   14000755e:	mov    rdi,r8
   140007561:	call   0x1400079a8
   140007566:	mov    ebx,eax
   140007568:	call   0x1400079b0
   14000756d:	mov    r13,QWORD PTR [r12]
   140007571:	mov    esi,eax
   140007573:	test   r13,r13
   140007576:	je     0x1400075ca
   140007578:	test   r15,r15
   14000757b:	je     0x1400075e0
   14000757d:	test   rdi,rdi
   140007580:	jne    0x1400075ac
   140007582:	jmp    0x140007620
   140007587:	nop    WORD PTR [rax+rax*1+0x0]
   140007590:	cdqe
   140007592:	add    r15,rax
   140007595:	add    r14,rax
   140007598:	cmp    BYTE PTR [r15-0x1],0x0
   14000759d:	je     0x140007630
   1400075a3:	add    r13,0x2
   1400075a7:	cmp    r14,rdi
   1400075aa:	jae    0x140007620
   1400075ac:	movzx  edx,WORD PTR [r13+0x0]
   1400075b1:	mov    r9d,esi
   1400075b4:	mov    r8d,ebx
   1400075b7:	mov    rcx,r15
   1400075ba:	call   0x140007460
   1400075bf:	test   eax,eax
   1400075c1:	jg     0x140007590
   1400075c3:	mov    r14,0xffffffffffffffff
   1400075ca:	mov    rax,r14
   1400075cd:	add    rsp,0x38
   1400075d1:	pop    rbx
   1400075d2:	pop    rsi
   1400075d3:	pop    rdi
   1400075d4:	pop    r12
   1400075d6:	pop    r13
   1400075d8:	pop    r14
   1400075da:	pop    r15
   1400075dc:	pop    rbp
   1400075dd:	ret
   1400075de:	xchg   ax,ax
   1400075e0:	lea    rdi,[rbp-0x5]
   1400075e4:	jmp    0x140007606
   1400075e6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400075f0:	movsxd rdx,eax
   1400075f3:	sub    eax,0x1
   1400075f6:	cdqe
   1400075f8:	add    r14,rdx
   1400075fb:	cmp    BYTE PTR [rbp+rax*1-0x5],0x0
   140007600:	je     0x140007640
   140007602:	add    r13,0x2
   140007606:	movzx  edx,WORD PTR [r13+0x0]
   14000760b:	mov    r9d,esi
   14000760e:	mov    r8d,ebx
   140007611:	mov    rcx,rdi
   140007614:	call   0x140007460
   140007619:	test   eax,eax
   14000761b:	jg     0x1400075f0
   14000761d:	jmp    0x1400075c3
   14000761f:	nop
   140007620:	mov    QWORD PTR [r12],r13
   140007624:	jmp    0x1400075ca
   140007626:	cs nop WORD PTR [rax+rax*1+0x0]
   140007630:	mov    QWORD PTR [r12],0x0
   140007638:	sub    r14,0x1
   14000763c:	jmp    0x1400075ca
   14000763e:	xchg   ax,ax
   140007640:	sub    r14,0x1
   140007644:	jmp    0x1400075ca
   140007646:	nop
   140007647:	nop
   140007648:	nop
   140007649:	nop
   14000764a:	nop
   14000764b:	nop
   14000764c:	nop
   14000764d:	nop
   14000764e:	nop
   14000764f:	nop
   140007650:	push   rbp
   140007651:	push   rdi
   140007652:	push   rbx
   140007653:	sub    rsp,0x40
   140007657:	lea    rbp,[rsp+0x40]
   14000765c:	mov    rdi,rcx
   14000765f:	mov    rbx,rdx
   140007662:	test   rdx,rdx
   140007665:	je     0x140007725
   14000766b:	test   r8,r8
   14000766e:	je     0x140007790
   140007674:	mov    eax,DWORD PTR [r9]
   140007677:	movzx  edx,BYTE PTR [rdx]
   14000767a:	mov    DWORD PTR [r9],0x0
   140007681:	mov    DWORD PTR [rbp-0x4],eax
   140007684:	test   dl,dl
   140007686:	je     0x140007720
   14000768c:	cmp    DWORD PTR [rbp+0x48],0x1
   140007690:	jbe    0x140007700
   140007692:	test   al,al
   140007694:	jne    0x140007730
   14000769a:	mov    QWORD PTR [rbp+0x38],r9
   14000769e:	mov    ecx,DWORD PTR [rbp+0x40]
   1400076a1:	mov    QWORD PTR [rbp+0x30],r8
   1400076a5:	call   QWORD PTR [rip+0x5b3d]        # 0x14000d1e8
   1400076ab:	test   eax,eax
   1400076ad:	je     0x140007700
   1400076af:	mov    r8,QWORD PTR [rbp+0x30]
   1400076b3:	mov    r9,QWORD PTR [rbp+0x38]
   1400076b7:	cmp    r8,0x1
   1400076bb:	je     0x14000778a
   1400076c1:	mov    QWORD PTR [rsp+0x20],rdi
   1400076c6:	mov    r9d,0x2
   1400076cc:	mov    r8,rbx
   1400076cf:	mov    DWORD PTR [rsp+0x28],0x1
   1400076d7:	mov    ecx,DWORD PTR [rbp+0x40]
   1400076da:	mov    edx,0x8
   1400076df:	call   QWORD PTR [rip+0x5b13]        # 0x14000d1f8
   1400076e5:	test   eax,eax
   1400076e7:	je     0x140007778
   1400076ed:	mov    eax,0x2
   1400076f2:	add    rsp,0x40
   1400076f6:	pop    rbx
   1400076f7:	pop    rdi
   1400076f8:	pop    rbp
   1400076f9:	ret
   1400076fa:	nop    WORD PTR [rax+rax*1+0x0]
   140007700:	mov    eax,DWORD PTR [rbp+0x40]
   140007703:	test   eax,eax
   140007705:	jne    0x140007750
   140007707:	movzx  eax,BYTE PTR [rbx]
   14000770a:	mov    WORD PTR [rdi],ax
   14000770d:	mov    eax,0x1
   140007712:	add    rsp,0x40
   140007716:	pop    rbx
   140007717:	pop    rdi
   140007718:	pop    rbp
   140007719:	ret
   14000771a:	nop    WORD PTR [rax+rax*1+0x0]
   140007720:	xor    edx,edx
   140007722:	mov    WORD PTR [rcx],dx
   140007725:	xor    eax,eax
   140007727:	add    rsp,0x40
   14000772b:	pop    rbx
   14000772c:	pop    rdi
   14000772d:	pop    rbp
   14000772e:	ret
   14000772f:	nop
   140007730:	mov    BYTE PTR [rbp-0x3],dl
   140007733:	mov    r9d,0x2
   140007739:	lea    r8,[rbp-0x4]
   14000773d:	mov    DWORD PTR [rsp+0x28],0x1
   140007745:	mov    QWORD PTR [rsp+0x20],rcx
   14000774a:	jmp    0x1400076d7
   14000774c:	nop    DWORD PTR [rax+0x0]
   140007750:	mov    QWORD PTR [rsp+0x20],rdi
   140007755:	mov    ecx,DWORD PTR [rbp+0x40]
   140007758:	mov    r8,rbx
   14000775b:	mov    edx,0x8
   140007760:	mov    DWORD PTR [rsp+0x28],0x1
   140007768:	mov    r9d,0x1
   14000776e:	call   QWORD PTR [rip+0x5a84]        # 0x14000d1f8
   140007774:	test   eax,eax
   140007776:	jne    0x14000770d
   140007778:	call   0x1400079e8
   14000777d:	mov    DWORD PTR [rax],0x2a
   140007783:	mov    eax,0xffffffff
   140007788:	jmp    0x140007727
   14000778a:	movzx  eax,BYTE PTR [rbx]
   14000778d:	mov    BYTE PTR [r9],al
   140007790:	mov    eax,0xfffffffe
   140007795:	jmp    0x140007727
   140007797:	nop    WORD PTR [rax+rax*1+0x0]
   1400077a0:	push   rbp
   1400077a1:	push   r13
   1400077a3:	push   r12
   1400077a5:	push   rdi
   1400077a6:	push   rsi
   1400077a7:	push   rbx
   1400077a8:	sub    rsp,0x48
   1400077ac:	lea    rbp,[rsp+0x40]
   1400077b1:	xor    eax,eax
   1400077b3:	mov    rbx,rcx
   1400077b6:	test   rcx,rcx
   1400077b9:	mov    WORD PTR [rbp-0x2],ax
   1400077bd:	lea    rax,[rbp-0x2]
   1400077c1:	mov    rsi,r9
   1400077c4:	cmove  rbx,rax
   1400077c8:	mov    rdi,rdx
   1400077cb:	mov    r12,r8
   1400077ce:	call   0x1400079b0
   1400077d3:	mov    r13d,eax
   1400077d6:	call   0x1400079a8
   1400077db:	test   rsi,rsi
   1400077de:	mov    DWORD PTR [rsp+0x28],r13d
   1400077e3:	mov    r8,r12
   1400077e6:	mov    DWORD PTR [rsp+0x20],eax
   1400077ea:	lea    r9,[rip+0x5387]        # 0x14000cb78
   1400077f1:	mov    rdx,rdi
   1400077f4:	mov    rcx,rbx
   1400077f7:	cmovne r9,rsi
   1400077fb:	call   0x140007650
   140007800:	cdqe
   140007802:	add    rsp,0x48
   140007806:	pop    rbx
   140007807:	pop    rsi
   140007808:	pop    rdi
   140007809:	pop    r12
   14000780b:	pop    r13
   14000780d:	pop    rbp
   14000780e:	ret
   14000780f:	nop
   140007810:	push   rbp
   140007811:	push   r15
   140007813:	push   r14
   140007815:	push   r13
   140007817:	push   r12
   140007819:	push   rdi
   14000781a:	push   rsi
   14000781b:	push   rbx
   14000781c:	sub    rsp,0x48
   140007820:	lea    rbp,[rsp+0x40]
   140007825:	lea    rax,[rip+0x5348]        # 0x14000cb74
   14000782c:	mov    rsi,r9
   14000782f:	test   r9,r9
   140007832:	mov    r15,rcx
   140007835:	mov    rbx,rdx
   140007838:	cmove  rsi,rax
   14000783c:	mov    rdi,r8
   14000783f:	call   0x1400079a8
   140007844:	mov    r13d,eax
   140007847:	call   0x1400079b0
   14000784c:	mov    r12d,eax
   14000784f:	test   rbx,rbx
   140007852:	je     0x140007920
   140007858:	mov    rdx,QWORD PTR [rbx]
   14000785b:	test   rdx,rdx
   14000785e:	je     0x140007920
   140007864:	test   r15,r15
   140007867:	je     0x1400078d8
   140007869:	xor    r14d,r14d
   14000786c:	test   rdi,rdi
   14000786f:	jne    0x14000788f
   140007871:	jmp    0x1400078be
   140007873:	nop    DWORD PTR [rax+rax*1+0x0]
   140007878:	mov    rdx,QWORD PTR [rbx]
   14000787b:	cdqe
   14000787d:	add    r15,0x2
   140007881:	add    r14,rax
   140007884:	add    rdx,rax
   140007887:	mov    QWORD PTR [rbx],rdx
   14000788a:	cmp    r14,rdi
   14000788d:	jae    0x1400078be
   14000788f:	mov    DWORD PTR [rsp+0x28],r12d
   140007894:	mov    r8,rdi
   140007897:	mov    r9,rsi
   14000789a:	mov    rcx,r15
   14000789d:	mov    DWORD PTR [rsp+0x20],r13d
   1400078a2:	sub    r8,r14
   1400078a5:	call   0x140007650
   1400078aa:	test   eax,eax
   1400078ac:	jg     0x140007878
   1400078ae:	cmp    r14,rdi
   1400078b1:	jae    0x1400078be
   1400078b3:	test   eax,eax
   1400078b5:	jne    0x1400078be
   1400078b7:	mov    QWORD PTR [rbx],0x0
   1400078be:	mov    rax,r14
   1400078c1:	add    rsp,0x48
   1400078c5:	pop    rbx
   1400078c6:	pop    rsi
   1400078c7:	pop    rdi
   1400078c8:	pop    r12
   1400078ca:	pop    r13
   1400078cc:	pop    r14
   1400078ce:	pop    r15
   1400078d0:	pop    rbp
   1400078d1:	ret
   1400078d2:	nop    WORD PTR [rax+rax*1+0x0]
   1400078d8:	xor    eax,eax
   1400078da:	mov    r15d,r12d
   1400078dd:	lea    rdi,[rbp-0x2]
   1400078e1:	xor    r14d,r14d
   1400078e4:	mov    WORD PTR [rbp-0x2],ax
   1400078e8:	jmp    0x1400078f8
   1400078ea:	nop    WORD PTR [rax+rax*1+0x0]
   1400078f0:	cdqe
   1400078f2:	mov    rdx,QWORD PTR [rbx]
   1400078f5:	add    r14,rax
   1400078f8:	mov    DWORD PTR [rsp+0x28],r12d
   1400078fd:	add    rdx,r14
   140007900:	mov    r9,rsi
   140007903:	mov    r8,r15
   140007906:	mov    DWORD PTR [rsp+0x20],r13d
   14000790b:	mov    rcx,rdi
   14000790e:	call   0x140007650
   140007913:	test   eax,eax
   140007915:	jg     0x1400078f0
   140007917:	jmp    0x1400078be
   140007919:	nop    DWORD PTR [rax+0x0]
   140007920:	xor    r14d,r14d
   140007923:	jmp    0x1400078be
   140007925:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140007930:	push   rbp
   140007931:	push   r12
   140007933:	push   rdi
   140007934:	push   rsi
   140007935:	push   rbx
   140007936:	sub    rsp,0x40
   14000793a:	lea    rbp,[rsp+0x40]
   14000793f:	xor    eax,eax
   140007941:	mov    rsi,rcx
   140007944:	mov    rdi,rdx
   140007947:	mov    rbx,r8
   14000794a:	mov    WORD PTR [rbp-0x2],ax
   14000794e:	call   0x1400079b0
   140007953:	mov    r12d,eax
   140007956:	call   0x1400079a8
   14000795b:	test   rbx,rbx
   14000795e:	mov    DWORD PTR [rsp+0x28],r12d
   140007963:	mov    r8,rdi
   140007966:	lea    rdx,[rip+0x5203]        # 0x14000cb70
   14000796d:	mov    DWORD PTR [rsp+0x20],eax
   140007971:	lea    rcx,[rbp-0x2]
   140007975:	cmove  rbx,rdx
   140007979:	mov    rdx,rsi
   14000797c:	mov    r9,rbx
   14000797f:	call   0x140007650
   140007984:	cdqe
   140007986:	add    rsp,0x40
   14000798a:	pop    rbx
   14000798b:	pop    rsi
   14000798c:	pop    rdi
   14000798d:	pop    r12
   14000798f:	pop    rbp
   140007990:	ret
   140007991:	nop
   140007992:	nop
   140007993:	nop
   140007994:	nop
   140007995:	nop
   140007996:	nop
   140007997:	nop
   140007998:	nop
   140007999:	nop
   14000799a:	nop
   14000799b:	nop
   14000799c:	nop
   14000799d:	nop
   14000799e:	nop
   14000799f:	nop
   1400079a0:	jmp    QWORD PTR [rip+0x5892]        # 0x14000d238
   1400079a6:	nop
   1400079a7:	nop
   1400079a8:	jmp    QWORD PTR [rip+0x5892]        # 0x14000d240
   1400079ae:	nop
   1400079af:	nop
   1400079b0:	jmp    QWORD PTR [rip+0x5892]        # 0x14000d248
   1400079b6:	nop
   1400079b7:	nop
   1400079b8:	jmp    QWORD PTR [rip+0x5892]        # 0x14000d250
   1400079be:	nop
   1400079bf:	nop
   1400079c0:	jmp    QWORD PTR [rip+0x589a]        # 0x14000d260
   1400079c6:	nop
   1400079c7:	nop
   1400079c8:	jmp    QWORD PTR [rip+0x589a]        # 0x14000d268
   1400079ce:	nop
   1400079cf:	nop
   1400079d0:	jmp    QWORD PTR [rip+0x589a]        # 0x14000d270
   1400079d6:	nop
   1400079d7:	nop
   1400079d8:	jmp    QWORD PTR [rip+0x589a]        # 0x14000d278
   1400079de:	nop
   1400079df:	nop
   1400079e0:	jmp    QWORD PTR [rip+0x589a]        # 0x14000d280
   1400079e6:	nop
   1400079e7:	nop
   1400079e8:	jmp    QWORD PTR [rip+0x58a2]        # 0x14000d290
   1400079ee:	nop
   1400079ef:	nop
   1400079f0:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2a0
   1400079f6:	nop
   1400079f7:	nop
   1400079f8:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2a8
   1400079fe:	nop
   1400079ff:	nop
   140007a00:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2b0
   140007a06:	nop
   140007a07:	nop
   140007a08:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2b8
   140007a0e:	nop
   140007a0f:	nop
   140007a10:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2c0
   140007a16:	nop
   140007a17:	nop
   140007a18:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2c8
   140007a1e:	nop
   140007a1f:	nop
   140007a20:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2d0
   140007a26:	nop
   140007a27:	nop
   140007a28:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2d8
   140007a2e:	nop
   140007a2f:	nop
   140007a30:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2e0
   140007a36:	nop
   140007a37:	nop
   140007a38:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2e8
   140007a3e:	nop
   140007a3f:	nop
   140007a40:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2f0
   140007a46:	nop
   140007a47:	nop
   140007a48:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d2f8
   140007a4e:	nop
   140007a4f:	nop
   140007a50:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d300
   140007a56:	nop
   140007a57:	nop
   140007a58:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d308
   140007a5e:	nop
   140007a5f:	nop
   140007a60:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d310
   140007a66:	nop
   140007a67:	nop
   140007a68:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d318
   140007a6e:	nop
   140007a6f:	nop
   140007a70:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d320
   140007a76:	nop
   140007a77:	nop
   140007a78:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d328
   140007a7e:	nop
   140007a7f:	nop
   140007a80:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d330
   140007a86:	nop
   140007a87:	nop
   140007a88:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d338
   140007a8e:	nop
   140007a8f:	nop
   140007a90:	jmp    QWORD PTR [rip+0x58aa]        # 0x14000d340
   140007a96:	nop
   140007a97:	nop
   140007a98:	nop    DWORD PTR [rax+rax*1+0x0]
   140007aa0:	jmp    QWORD PTR [rip+0x5782]        # 0x14000d228
   140007aa6:	nop
   140007aa7:	nop
   140007aa8:	jmp    QWORD PTR [rip+0x5772]        # 0x14000d220
   140007aae:	nop
   140007aaf:	nop
   140007ab0:	jmp    QWORD PTR [rip+0x5762]        # 0x14000d218
   140007ab6:	nop
   140007ab7:	nop
   140007ab8:	jmp    QWORD PTR [rip+0x5752]        # 0x14000d210
   140007abe:	nop
   140007abf:	nop
   140007ac0:	jmp    QWORD PTR [rip+0x5742]        # 0x14000d208
   140007ac6:	nop
   140007ac7:	nop
   140007ac8:	jmp    QWORD PTR [rip+0x5732]        # 0x14000d200
   140007ace:	nop
   140007acf:	nop
   140007ad0:	jmp    QWORD PTR [rip+0x5722]        # 0x14000d1f8
   140007ad6:	nop
   140007ad7:	nop
   140007ad8:	jmp    QWORD PTR [rip+0x5712]        # 0x14000d1f0
   140007ade:	nop
   140007adf:	nop
   140007ae0:	jmp    QWORD PTR [rip+0x5702]        # 0x14000d1e8
   140007ae6:	nop
   140007ae7:	nop
   140007ae8:	jmp    QWORD PTR [rip+0x56f2]        # 0x14000d1e0
   140007aee:	nop
   140007aef:	nop
   140007af0:	jmp    QWORD PTR [rip+0x56e2]        # 0x14000d1d8
   140007af6:	nop
   140007af7:	nop
   140007af8:	jmp    QWORD PTR [rip+0x56d2]        # 0x14000d1d0
   140007afe:	nop
   140007aff:	nop
   140007b00:	jmp    QWORD PTR [rip+0x56c2]        # 0x14000d1c8
   140007b06:	nop
   140007b07:	nop
   140007b08:	nop    DWORD PTR [rax+rax*1+0x0]
   140007b10:	push   rsi
   140007b11:	push   rbx
   140007b12:	sub    rsp,0x38
   140007b16:	mov    ebx,ecx
   140007b18:	mov    rsi,rdx
   140007b1b:	call   0x1400015a0
   140007b20:	cmp    ebx,0x2
   140007b23:	jne    0x140007b9c
   140007b25:	mov    rbx,QWORD PTR [rsi+0x8]
   140007b29:	mov    rcx,rbx
   140007b2c:	call   0x140007a78
   140007b31:	cmp    eax,0xc
   140007b34:	jne    0x140007b89
   140007b36:	mov    rax,QWORD PTR [rip+0x14fb]        # 0x140009038
   140007b3d:	mov    DWORD PTR [rsp+0x28],0x34333231
   140007b45:	xor    edx,edx
   140007b47:	lea    rcx,[rsp+0x20]
   140007b4c:	mov    QWORD PTR [rsp+0x20],rax
   140007b51:	nop    DWORD PTR [rax+0x0]
   140007b58:	movzx  eax,BYTE PTR [rbx+rdx*1]
   140007b5c:	xor    eax,0x55
   140007b5f:	add    eax,0x7
   140007b62:	xor    eax,0x33
   140007b65:	cmp    BYTE PTR [rcx+rdx*1],al
   140007b68:	jne    0x140007b89
   140007b6a:	add    rdx,0x1
   140007b6e:	cmp    rdx,0xc
   140007b72:	jne    0x140007b58
   140007b74:	lea    rcx,[rip+0x149d]        # 0x140009018
   140007b7b:	call   0x140001480
   140007b80:	xor    eax,eax
   140007b82:	add    rsp,0x38
   140007b86:	pop    rbx
   140007b87:	pop    rsi
   140007b88:	ret
   140007b89:	lea    rcx,[rip+0x1481]        # 0x140009011
   140007b90:	call   0x140001480
   140007b95:	mov    eax,0x1
   140007b9a:	jmp    0x140007b82
   140007b9c:	mov    rdx,QWORD PTR [rsi]
   140007b9f:	lea    rcx,[rip+0x145a]        # 0x140009000
   140007ba6:	call   0x140001480
   140007bab:	jmp    0x140007b95
   140007bad:	nop
   140007bae:	nop
   140007baf:	nop
   140007bb0:	jmp    0x140001460
   140007bb5:	nop
   140007bb6:	nop
   140007bb7:	nop
   140007bb8:	nop
   140007bb9:	nop
   140007bba:	nop
   140007bbb:	nop
   140007bbc:	nop
   140007bbd:	nop
   140007bbe:	nop
   140007bbf:	nop
   140007bc0:	(bad)
   140007bc1:	(bad)
   140007bc2:	(bad)
   140007bc3:	(bad)
   140007bc4:	(bad)
   140007bc5:	(bad)
   140007bc6:	(bad)
   140007bc7:	push   QWORD PTR [rax+0x140007b]
	...
   140007bd5:	add    BYTE PTR [rax],al
   140007bd7:	add    bh,bh
   140007bd9:	(bad)
   140007bda:	(bad)
   140007bdb:	(bad)
   140007bdc:	(bad)
   140007bdd:	(bad)
   140007bde:	(bad)
   140007bdf:	inc    DWORD PTR [rax]
   140007be1:	add    BYTE PTR [rax],al
   140007be3:	add    BYTE PTR [rax],al
   140007be5:	add    BYTE PTR [rax],al
	...
