
echo_labyrinth.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	ret
   140001001:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000100c:	nop    DWORD PTR [rax+0x0]
   140001010:	push   rbp
   140001011:	mov    rbp,rsp
   140001014:	sub    rsp,0x20
   140001018:	mov    rax,QWORD PTR [rip+0x88f1]        # 0x140009910
   14000101f:	xor    ecx,ecx
   140001021:	mov    DWORD PTR [rax],0x1
   140001027:	mov    rax,QWORD PTR [rip+0x88f2]        # 0x140009920
   14000102e:	mov    DWORD PTR [rax],0x1
   140001034:	mov    rax,QWORD PTR [rip+0x88f5]        # 0x140009930
   14000103b:	mov    DWORD PTR [rax],0x1
   140001041:	mov    rax,QWORD PTR [rip+0x8878]        # 0x1400098c0
   140001048:	cmp    WORD PTR [rax],0x5a4d
   14000104d:	jne    0x14000105e
   14000104f:	movsxd rdx,DWORD PTR [rax+0x3c]
   140001053:	add    rax,rdx
   140001056:	cmp    DWORD PTR [rax],0x4550
   14000105c:	je     0x1400010c8
   14000105e:	mov    rax,QWORD PTR [rip+0x889b]        # 0x140009900
   140001065:	mov    DWORD PTR [rip+0xafa1],ecx        # 0x14000c00c
   14000106b:	mov    eax,DWORD PTR [rax]
   14000106d:	test   eax,eax
   14000106f:	je     0x1400010b8
   140001071:	mov    ecx,0x2
   140001076:	call   0x1400079f8
   14000107b:	call   0x140007340
   140001080:	mov    rdx,QWORD PTR [rip+0x8959]        # 0x1400099e0
   140001087:	mov    edx,DWORD PTR [rdx]
   140001089:	mov    DWORD PTR [rax],edx
   14000108b:	call   0x140007350
   140001090:	mov    rdx,QWORD PTR [rip+0x8929]        # 0x1400099c0
   140001097:	mov    edx,DWORD PTR [rdx]
   140001099:	mov    DWORD PTR [rax],edx
   14000109b:	call   0x1400015f0
   1400010a0:	mov    rax,QWORD PTR [rip+0x87c9]        # 0x140009870
   1400010a7:	cmp    DWORD PTR [rax],0x1
   1400010aa:	je     0x140001100
   1400010ac:	xor    eax,eax
   1400010ae:	add    rsp,0x20
   1400010b2:	pop    rbp
   1400010b3:	ret
   1400010b4:	nop    DWORD PTR [rax+0x0]
   1400010b8:	mov    ecx,0x1
   1400010bd:	call   0x1400079f8
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
   140001100:	mov    rcx,QWORD PTR [rip+0x88f9]        # 0x140009a00
   140001107:	call   0x140001d60
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
   140001148:	mov    rax,QWORD PTR [rip+0x88c1]        # 0x140009a10
   14000114f:	lea    r8,[rip+0xaec2]        # 0x14000c018
   140001156:	lea    rdx,[rip+0xaec3]        # 0x14000c020
   14000115d:	lea    rcx,[rip+0xaec4]        # 0x14000c028
   140001164:	mov    eax,DWORD PTR [rax]
   140001166:	mov    DWORD PTR [rip+0xae98],eax        # 0x14000c004
   14000116c:	mov    rax,QWORD PTR [rip+0x885d]        # 0x1400099d0
   140001173:	mov    r9d,DWORD PTR [rax]
   140001176:	lea    rax,[rip+0xae87]        # 0x14000c004
   14000117d:	mov    QWORD PTR [rsp+0x20],rax
   140001182:	call   0x1400079e8
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
   1400011a1:	mov    rbx,QWORD PTR [rip+0x87a8]        # 0x140009950
   1400011a8:	mov    r12,QWORD PTR [rip+0xc0b1]        # 0x14000d260
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
   1400011de:	mov    rsi,QWORD PTR [rip+0x877b]        # 0x140009960
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
   140001219:	mov    rax,QWORD PTR [rip+0x8690]        # 0x1400098b0
   140001220:	mov    rax,QWORD PTR [rax]
   140001223:	test   rax,rax
   140001226:	je     0x140001234
   140001228:	xor    r8d,r8d
   14000122b:	mov    edx,0x2
   140001230:	xor    ecx,ecx
   140001232:	call   rax
   140001234:	call   0x1400019c0
   140001239:	mov    rcx,QWORD PTR [rip+0x87b0]        # 0x1400099f0
   140001240:	call   QWORD PTR [rip+0xc012]        # 0x14000d258
   140001246:	mov    rdx,QWORD PTR [rip+0x86f3]        # 0x140009940
   14000124d:	lea    rcx,[rip+0xfffffffffffffdac]        # 0x140001000
   140001254:	mov    QWORD PTR [rdx],rax
   140001257:	call   0x140007450
   14000125c:	call   0x1400017d0
   140001261:	mov    ebx,DWORD PTR [rip+0xadc1]        # 0x14000c028
   140001267:	lea    edi,[rbx+0x1]
   14000126a:	movsxd rdi,edi
   14000126d:	shl    rdi,0x3
   140001271:	mov    rcx,rdi
   140001274:	call   0x140007a90
   140001279:	mov    r13,QWORD PTR [rip+0xada0]        # 0x14000c020
   140001280:	mov    r12,rax
   140001283:	test   ebx,ebx
   140001285:	jle    0x1400013d0
   14000128b:	sub    rdi,0x8
   14000128f:	xor    ebx,ebx
   140001291:	nop    DWORD PTR [rax+0x0]
   140001298:	mov    rcx,QWORD PTR [r13+rbx*1+0x0]
   14000129d:	call   0x140007ac0
   1400012a2:	lea    rsi,[rax+0x1]
   1400012a6:	mov    rcx,rsi
   1400012a9:	call   0x140007a90
   1400012ae:	mov    r8,rsi
   1400012b1:	mov    QWORD PTR [r12+rbx*1],rax
   1400012b5:	mov    rdx,QWORD PTR [r13+rbx*1+0x0]
   1400012ba:	mov    rcx,rax
   1400012bd:	add    rbx,0x8
   1400012c1:	call   0x140007a98
   1400012c6:	cmp    rdi,rbx
   1400012c9:	jne    0x140001298
   1400012cb:	add    rdi,r12
   1400012ce:	mov    QWORD PTR [rdi],0x0
   1400012d5:	mov    QWORD PTR [rip+0xad44],r12        # 0x14000c020
   1400012dc:	call   0x1400015d0
   1400012e1:	mov    rax,QWORD PTR [rip+0x85e8]        # 0x1400098d0
   1400012e8:	mov    r8,QWORD PTR [rip+0xad29]        # 0x14000c018
   1400012ef:	mov    ecx,DWORD PTR [rip+0xad33]        # 0x14000c028
   1400012f5:	mov    rax,QWORD PTR [rax]
   1400012f8:	mov    QWORD PTR [rax],r8
   1400012fb:	mov    rdx,QWORD PTR [rip+0xad1e]        # 0x14000c020
   140001302:	call   0x140007bc0
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
   140001338:	mov    rsi,QWORD PTR [rip+0x8621]        # 0x140009960
   14000133f:	mov    edi,0x1
   140001344:	mov    eax,DWORD PTR [rsi]
   140001346:	cmp    eax,0x1
   140001349:	jne    0x1400011f2
   14000134f:	mov    ecx,0x1f
   140001354:	call   0x140007a08
   140001359:	mov    eax,DWORD PTR [rsi]
   14000135b:	cmp    eax,0x1
   14000135e:	jne    0x140001211
   140001364:	mov    rdx,QWORD PTR [rip+0x8625]        # 0x140009990
   14000136b:	mov    rcx,QWORD PTR [rip+0x860e]        # 0x140009980
   140001372:	call   0x140007a20
   140001377:	mov    DWORD PTR [rsi],0x2
   14000137d:	test   edi,edi
   14000137f:	jne    0x140001219
   140001385:	xor    eax,eax
   140001387:	xchg   QWORD PTR [rbx],rax
   14000138a:	jmp    0x140001219
   14000138f:	nop
   140001390:	call   0x140007a10
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
   1400013b0:	mov    rdx,QWORD PTR [rip+0x85f9]        # 0x1400099b0
   1400013b7:	mov    rcx,QWORD PTR [rip+0x85e2]        # 0x1400099a0
   1400013be:	mov    DWORD PTR [rsi],0x1
   1400013c4:	call   0x140007a20
   1400013c9:	jmp    0x140001206
   1400013ce:	xchg   ax,ax
   1400013d0:	mov    rdi,rax
   1400013d3:	jmp    0x1400012ce
   1400013d8:	mov    ecx,eax
   1400013da:	call   0x140007a50
   1400013df:	nop
   1400013e0:	push   rbp
   1400013e1:	mov    rbp,rsp
   1400013e4:	sub    rsp,0x20
   1400013e8:	mov    rax,QWORD PTR [rip+0x8511]        # 0x140009900
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
   140001418:	mov    rax,QWORD PTR [rip+0x84e1]        # 0x140009900
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
   140001448:	call   0x140007a30
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
   140001480:	push   rbx
   140001481:	sub    rsp,0x30
   140001485:	call   QWORD PTR [rip+0xbdad]        # 0x14000d238
   14000148b:	cmp    eax,0x1
   14000148e:	sbb    ebx,ebx
   140001490:	and    ebx,0xeef10ef1
   140001496:	mov    DWORD PTR [rsp+0x2c],0x0
   14000149e:	sub    ebx,0x2eef3ee4
   1400014a4:	call   QWORD PTR [rip+0xbd6e]        # 0x14000d218
   1400014aa:	lea    rdx,[rsp+0x2c]
   1400014af:	mov    rcx,rax
   1400014b2:	call   QWORD PTR [rip+0xbd48]        # 0x14000d200
   1400014b8:	test   eax,eax
   1400014ba:	je     0x1400014c3
   1400014bc:	cmp    DWORD PTR [rsp+0x2c],0x0
   1400014c1:	jne    0x1400014e9
   1400014c3:	mov    rax,QWORD PTR gs:0x60
   1400014cc:	test   rax,rax
   1400014cf:	je     0x1400014dd
   1400014d1:	cmp    BYTE PTR [rax+0x2],0x0
   1400014d5:	je     0x1400014dd
   1400014d7:	xor    ebx,0x33333333
   1400014dd:	mov    DWORD PTR [rip+0x6b1d],ebx        # 0x140008000
   1400014e3:	add    rsp,0x30
   1400014e7:	pop    rbx
   1400014e8:	ret
   1400014e9:	xor    ebx,0x22222222
   1400014ef:	jmp    0x1400014c3
   1400014f1:	nop
   1400014f2:	nop
   1400014f3:	nop
   1400014f4:	nop
   1400014f5:	nop
   1400014f6:	nop
   1400014f7:	nop
   1400014f8:	nop
   1400014f9:	nop
   1400014fa:	nop
   1400014fb:	nop
   1400014fc:	nop
   1400014fd:	nop
   1400014fe:	nop
   1400014ff:	nop
   140001500:	push   rbp
   140001501:	mov    rbp,rsp
   140001504:	sub    rsp,0x20
   140001508:	mov    rax,QWORD PTR [rip+0x6b01]        # 0x140008010
   14000150f:	mov    rax,QWORD PTR [rax]
   140001512:	test   rax,rax
   140001515:	je     0x14000153d
   140001517:	nop    WORD PTR [rax+rax*1+0x0]
   140001520:	call   rax
   140001522:	mov    rax,QWORD PTR [rip+0x6ae7]        # 0x140008010
   140001529:	lea    rdx,[rax+0x8]
   14000152d:	mov    rax,QWORD PTR [rax+0x8]
   140001531:	mov    QWORD PTR [rip+0x6ad8],rdx        # 0x140008010
   140001538:	test   rax,rax
   14000153b:	jne    0x140001520
   14000153d:	add    rsp,0x20
   140001541:	pop    rbp
   140001542:	ret
   140001543:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000154e:	xchg   ax,ax
   140001550:	push   rbp
   140001551:	push   rsi
   140001552:	push   rbx
   140001553:	sub    rsp,0x20
   140001557:	lea    rbp,[rsp+0x20]
   14000155c:	mov    rdx,QWORD PTR [rip+0x831d]        # 0x140009880
   140001563:	mov    rax,QWORD PTR [rdx]
   140001566:	mov    ecx,eax
   140001568:	cmp    eax,0xffffffff
   14000156b:	je     0x1400015b0
   14000156d:	test   ecx,ecx
   14000156f:	je     0x140001593
   140001571:	mov    eax,ecx
   140001573:	sub    ecx,0x1
   140001576:	lea    rbx,[rdx+rax*8]
   14000157a:	sub    rax,rcx
   14000157d:	lea    rsi,[rdx+rax*8-0x8]
   140001582:	nop    WORD PTR [rax+rax*1+0x0]
   140001588:	call   QWORD PTR [rbx]
   14000158a:	sub    rbx,0x8
   14000158e:	cmp    rbx,rsi
   140001591:	jne    0x140001588
   140001593:	lea    rcx,[rip+0xffffffffffffff66]        # 0x140001500
   14000159a:	add    rsp,0x20
   14000159e:	pop    rbx
   14000159f:	pop    rsi
   1400015a0:	pop    rbp
   1400015a1:	jmp    0x140001440
   1400015a6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400015b0:	xor    eax,eax
   1400015b2:	nop    WORD PTR [rax+rax*1+0x0]
   1400015b8:	lea    r8d,[rax+0x1]
   1400015bc:	mov    ecx,eax
   1400015be:	cmp    QWORD PTR [rdx+r8*8],0x0
   1400015c3:	mov    rax,r8
   1400015c6:	jne    0x1400015b8
   1400015c8:	jmp    0x14000156d
   1400015ca:	nop    WORD PTR [rax+rax*1+0x0]
   1400015d0:	mov    eax,DWORD PTR [rip+0xaa5a]        # 0x14000c030
   1400015d6:	test   eax,eax
   1400015d8:	je     0x1400015e0
   1400015da:	ret
   1400015db:	nop    DWORD PTR [rax+rax*1+0x0]
   1400015e0:	mov    DWORD PTR [rip+0xaa46],0x1        # 0x14000c030
   1400015ea:	jmp    0x140001550
   1400015ef:	nop
   1400015f0:	xor    eax,eax
   1400015f2:	ret
   1400015f3:	nop
   1400015f4:	nop
   1400015f5:	nop
   1400015f6:	nop
   1400015f7:	nop
   1400015f8:	nop
   1400015f9:	nop
   1400015fa:	nop
   1400015fb:	nop
   1400015fc:	nop
   1400015fd:	nop
   1400015fe:	nop
   1400015ff:	nop
   140001600:	push   rbp
   140001601:	mov    rbp,rsp
   140001604:	sub    rsp,0x20
   140001608:	cmp    edx,0x3
   14000160b:	je     0x140001620
   14000160d:	test   edx,edx
   14000160f:	je     0x140001620
   140001611:	mov    eax,0x1
   140001616:	add    rsp,0x20
   14000161a:	pop    rbp
   14000161b:	ret
   14000161c:	nop    DWORD PTR [rax+0x0]
   140001620:	call   0x1400020d0
   140001625:	mov    eax,0x1
   14000162a:	add    rsp,0x20
   14000162e:	pop    rbp
   14000162f:	ret
   140001630:	push   rbp
   140001631:	push   rsi
   140001632:	push   rbx
   140001633:	sub    rsp,0x20
   140001637:	lea    rbp,[rsp+0x20]
   14000163c:	mov    rax,QWORD PTR [rip+0x821d]        # 0x140009860
   140001643:	cmp    DWORD PTR [rax],0x2
   140001646:	je     0x14000164e
   140001648:	mov    DWORD PTR [rax],0x2
   14000164e:	cmp    edx,0x2
   140001651:	je     0x140001668
   140001653:	cmp    edx,0x1
   140001656:	je     0x1400016a0
   140001658:	mov    eax,0x1
   14000165d:	add    rsp,0x20
   140001661:	pop    rbx
   140001662:	pop    rsi
   140001663:	pop    rbp
   140001664:	ret
   140001665:	nop    DWORD PTR [rax]
   140001668:	lea    rbx,[rip+0xc9e9]        # 0x14000e058
   14000166f:	lea    rsi,[rip+0xc9e2]        # 0x14000e058
   140001676:	cmp    rbx,rsi
   140001679:	je     0x140001658
   14000167b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001680:	mov    rax,QWORD PTR [rbx]
   140001683:	test   rax,rax
   140001686:	je     0x14000168a
   140001688:	call   rax
   14000168a:	add    rbx,0x8
   14000168e:	cmp    rbx,rsi
   140001691:	jne    0x140001680
   140001693:	mov    eax,0x1
   140001698:	add    rsp,0x20
   14000169c:	pop    rbx
   14000169d:	pop    rsi
   14000169e:	pop    rbp
   14000169f:	ret
   1400016a0:	call   0x1400020d0
   1400016a5:	mov    eax,0x1
   1400016aa:	add    rsp,0x20
   1400016ae:	pop    rbx
   1400016af:	pop    rsi
   1400016b0:	pop    rbp
   1400016b1:	ret
   1400016b2:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400016bd:	nop    DWORD PTR [rax]
   1400016c0:	xor    eax,eax
   1400016c2:	ret
   1400016c3:	nop
   1400016c4:	nop
   1400016c5:	nop
   1400016c6:	nop
   1400016c7:	nop
   1400016c8:	nop
   1400016c9:	nop
   1400016ca:	nop
   1400016cb:	nop
   1400016cc:	nop
   1400016cd:	nop
   1400016ce:	nop
   1400016cf:	nop
   1400016d0:	push   rbp
   1400016d1:	push   rsi
   1400016d2:	push   rbx
   1400016d3:	sub    rsp,0x70
   1400016d7:	lea    rbp,[rsp+0x40]
   1400016dc:	movups XMMWORD PTR [rbp+0x0],xmm6
   1400016e0:	movups XMMWORD PTR [rbp+0x10],xmm7
   1400016e4:	movups XMMWORD PTR [rbp+0x20],xmm8
   1400016e9:	cmp    DWORD PTR [rcx],0x6
   1400016ec:	ja     0x1400017bc
   1400016f2:	mov    eax,DWORD PTR [rcx]
   1400016f4:	lea    rdx,[rip+0x7c29]        # 0x140009324
   1400016fb:	movsxd rax,DWORD PTR [rdx+rax*4]
   1400016ff:	add    rax,rdx
   140001702:	jmp    rax
   140001704:	nop    DWORD PTR [rax+0x0]
   140001708:	lea    rbx,[rip+0x7b10]        # 0x14000921f
   14000170f:	movsd  xmm8,QWORD PTR [rcx+0x20]
   140001715:	movsd  xmm7,QWORD PTR [rcx+0x18]
   14000171a:	movsd  xmm6,QWORD PTR [rcx+0x10]
   14000171f:	mov    rsi,QWORD PTR [rcx+0x8]
   140001723:	mov    ecx,0x2
   140001728:	call   0x140007460
   14000172d:	movsd  QWORD PTR [rsp+0x30],xmm8
   140001734:	mov    r8,rbx
   140001737:	lea    rdx,[rip+0x7bba]        # 0x1400092f8
   14000173e:	movsd  QWORD PTR [rsp+0x28],xmm7
   140001744:	mov    rcx,rax
   140001747:	mov    r9,rsi
   14000174a:	movsd  QWORD PTR [rsp+0x20],xmm6
   140001750:	call   0x140007a60
   140001755:	nop
   140001756:	movups xmm6,XMMWORD PTR [rbp+0x0]
   14000175a:	movups xmm7,XMMWORD PTR [rbp+0x10]
   14000175e:	xor    eax,eax
   140001760:	movups xmm8,XMMWORD PTR [rbp+0x20]
   140001765:	add    rsp,0x70
   140001769:	pop    rbx
   14000176a:	pop    rsi
   14000176b:	pop    rbp
   14000176c:	ret
   14000176d:	nop    DWORD PTR [rax]
   140001770:	lea    rbx,[rip+0x7a89]        # 0x140009200
   140001777:	jmp    0x14000170f
   140001779:	nop    DWORD PTR [rax+0x0]
   140001780:	lea    rbx,[rip+0x7ad9]        # 0x140009260
   140001787:	jmp    0x14000170f
   140001789:	nop    DWORD PTR [rax+0x0]
   140001790:	lea    rbx,[rip+0x7aa9]        # 0x140009240
   140001797:	jmp    0x14000170f
   14000179c:	nop    DWORD PTR [rax+0x0]
   1400017a0:	lea    rbx,[rip+0x7b09]        # 0x1400092b0
   1400017a7:	jmp    0x14000170f
   1400017ac:	nop    DWORD PTR [rax+0x0]
   1400017b0:	lea    rbx,[rip+0x7ad1]        # 0x140009288
   1400017b7:	jmp    0x14000170f
   1400017bc:	lea    rbx,[rip+0x7b23]        # 0x1400092e6
   1400017c3:	jmp    0x14000170f
   1400017c8:	nop
   1400017c9:	nop
   1400017ca:	nop
   1400017cb:	nop
   1400017cc:	nop
   1400017cd:	nop
   1400017ce:	nop
   1400017cf:	nop
   1400017d0:	fninit
   1400017d2:	ret
   1400017d3:	nop
   1400017d4:	nop
   1400017d5:	nop
   1400017d6:	nop
   1400017d7:	nop
   1400017d8:	nop
   1400017d9:	nop
   1400017da:	nop
   1400017db:	nop
   1400017dc:	nop
   1400017dd:	nop
   1400017de:	nop
   1400017df:	nop
   1400017e0:	push   rbp
   1400017e1:	push   rsi
   1400017e2:	push   rbx
   1400017e3:	sub    rsp,0x30
   1400017e7:	lea    rbp,[rsp+0x30]
   1400017ec:	mov    rbx,rcx
   1400017ef:	lea    rax,[rbp+0x28]
   1400017f3:	mov    ecx,0x2
   1400017f8:	mov    QWORD PTR [rbp+0x28],rdx
   1400017fc:	mov    QWORD PTR [rbp+0x30],r8
   140001800:	mov    QWORD PTR [rbp+0x38],r9
   140001804:	mov    QWORD PTR [rbp-0x8],rax
   140001808:	call   0x140007460
   14000180d:	mov    r8d,0x1b
   140001813:	mov    edx,0x1
   140001818:	lea    rcx,[rip+0x7b21]        # 0x140009340
   14000181f:	mov    r9,rax
   140001822:	call   0x140007a78
   140001827:	mov    rsi,QWORD PTR [rbp-0x8]
   14000182b:	mov    ecx,0x2
   140001830:	call   0x140007460
   140001835:	mov    rdx,rbx
   140001838:	mov    rcx,rax
   14000183b:	mov    r8,rsi
   14000183e:	call   0x140007ad0
   140001843:	call   0x140007a40
   140001848:	nop
   140001849:	nop    DWORD PTR [rax+0x0]
   140001850:	push   rbp
   140001851:	push   rdi
   140001852:	push   rsi
   140001853:	push   rbx
   140001854:	sub    rsp,0x58
   140001858:	lea    rbp,[rsp+0x50]
   14000185d:	movsxd rsi,DWORD PTR [rip+0xa840]        # 0x14000c0a4
   140001864:	mov    rbx,rcx
   140001867:	test   esi,esi
   140001869:	jle    0x140001980
   14000186f:	mov    rax,QWORD PTR [rip+0xa832]        # 0x14000c0a8
   140001876:	xor    r9d,r9d
   140001879:	add    rax,0x18
   14000187d:	nop    DWORD PTR [rax]
   140001880:	mov    r8,QWORD PTR [rax]
   140001883:	cmp    rbx,r8
   140001886:	jb     0x14000189b
   140001888:	mov    rdx,QWORD PTR [rax+0x8]
   14000188c:	mov    edx,DWORD PTR [rdx+0x8]
   14000188f:	add    r8,rdx
   140001892:	cmp    rbx,r8
   140001895:	jb     0x140001923
   14000189b:	add    r9d,0x1
   14000189f:	add    rax,0x28
   1400018a3:	cmp    r9d,esi
   1400018a6:	jne    0x140001880
   1400018a8:	mov    rcx,rbx
   1400018ab:	call   0x140002300
   1400018b0:	mov    rdi,rax
   1400018b3:	test   rax,rax
   1400018b6:	je     0x1400019a2
   1400018bc:	mov    rax,QWORD PTR [rip+0xa7e5]        # 0x14000c0a8
   1400018c3:	lea    rbx,[rsi+rsi*4]
   1400018c7:	shl    rbx,0x3
   1400018cb:	add    rax,rbx
   1400018ce:	mov    QWORD PTR [rax+0x20],rdi
   1400018d2:	mov    DWORD PTR [rax],0x0
   1400018d8:	call   0x140002440
   1400018dd:	mov    edx,DWORD PTR [rdi+0xc]
   1400018e0:	mov    r8d,0x30
   1400018e6:	lea    rcx,[rax+rdx*1]
   1400018ea:	mov    rax,QWORD PTR [rip+0xa7b7]        # 0x14000c0a8
   1400018f1:	lea    rdx,[rbp-0x30]
   1400018f5:	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   1400018fa:	call   QWORD PTR [rip+0xb978]        # 0x14000d278
   140001900:	test   rax,rax
   140001903:	je     0x140001987
   140001909:	mov    eax,DWORD PTR [rbp-0xc]
   14000190c:	lea    edx,[rax-0x4]
   14000190f:	and    edx,0xfffffffb
   140001912:	je     0x14000191c
   140001914:	lea    edx,[rax-0x40]
   140001917:	and    edx,0xffffffbf
   14000191a:	jne    0x140001930
   14000191c:	add    DWORD PTR [rip+0xa781],0x1        # 0x14000c0a4
   140001923:	add    rsp,0x58
   140001927:	pop    rbx
   140001928:	pop    rsi
   140001929:	pop    rdi
   14000192a:	pop    rbp
   14000192b:	ret
   14000192c:	nop    DWORD PTR [rax+0x0]
   140001930:	cmp    eax,0x2
   140001933:	mov    rcx,QWORD PTR [rbp-0x30]
   140001937:	mov    rdx,QWORD PTR [rbp-0x18]
   14000193b:	mov    r8d,0x40
   140001941:	mov    eax,0x4
   140001946:	cmove  r8d,eax
   14000194a:	add    rbx,QWORD PTR [rip+0xa757]        # 0x14000c0a8
   140001951:	mov    QWORD PTR [rbx+0x8],rcx
   140001955:	mov    r9,rbx
   140001958:	mov    QWORD PTR [rbx+0x10],rdx
   14000195c:	call   QWORD PTR [rip+0xb90e]        # 0x14000d270
   140001962:	test   eax,eax
   140001964:	jne    0x14000191c
   140001966:	call   QWORD PTR [rip+0xb8b4]        # 0x14000d220
   14000196c:	lea    rcx,[rip+0x7a45]        # 0x1400093b8
   140001973:	mov    edx,eax
   140001975:	call   0x1400017e0
   14000197a:	nop    WORD PTR [rax+rax*1+0x0]
   140001980:	xor    esi,esi
   140001982:	jmp    0x1400018a8
   140001987:	mov    rax,QWORD PTR [rip+0xa71a]        # 0x14000c0a8
   14000198e:	mov    edx,DWORD PTR [rdi+0x8]
   140001991:	lea    rcx,[rip+0x79e8]        # 0x140009380
   140001998:	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   14000199d:	call   0x1400017e0
   1400019a2:	mov    rdx,rbx
   1400019a5:	lea    rcx,[rip+0x79b4]        # 0x140009360
   1400019ac:	call   0x1400017e0
   1400019b1:	nop
   1400019b2:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400019bd:	nop    DWORD PTR [rax]
   1400019c0:	push   rbp
   1400019c1:	push   r15
   1400019c3:	push   r14
   1400019c5:	push   r13
   1400019c7:	push   r12
   1400019c9:	push   rdi
   1400019ca:	push   rsi
   1400019cb:	push   rbx
   1400019cc:	sub    rsp,0x48
   1400019d0:	lea    rbp,[rsp+0x40]
   1400019d5:	mov    r12d,DWORD PTR [rip+0xa6c4]        # 0x14000c0a0
   1400019dc:	test   r12d,r12d
   1400019df:	je     0x1400019f8
   1400019e1:	lea    rsp,[rbp+0x8]
   1400019e5:	pop    rbx
   1400019e6:	pop    rsi
   1400019e7:	pop    rdi
   1400019e8:	pop    r12
   1400019ea:	pop    r13
   1400019ec:	pop    r14
   1400019ee:	pop    r15
   1400019f0:	pop    rbp
   1400019f1:	ret
   1400019f2:	nop    WORD PTR [rax+rax*1+0x0]
   1400019f8:	mov    DWORD PTR [rip+0xa69e],0x1        # 0x14000c0a0
   140001a02:	call   0x140002380
   140001a07:	cdqe
   140001a09:	lea    rax,[rax+rax*4]
   140001a0d:	lea    rax,[rax*8+0xf]
   140001a15:	and    rax,0xfffffffffffffff0
   140001a19:	call   0x1400025d0
   140001a1e:	mov    r13,QWORD PTR [rip+0x7e6b]        # 0x140009890
   140001a25:	mov    rbx,QWORD PTR [rip+0x7e74]        # 0x1400098a0
   140001a2c:	mov    DWORD PTR [rip+0xa66e],0x0        # 0x14000c0a4
   140001a36:	sub    rsp,rax
   140001a39:	lea    rax,[rsp+0x30]
   140001a3e:	mov    QWORD PTR [rip+0xa663],rax        # 0x14000c0a8
   140001a45:	mov    rax,r13
   140001a48:	sub    rax,rbx
   140001a4b:	cmp    rax,0x7
   140001a4f:	jle    0x1400019e1
   140001a51:	mov    edx,DWORD PTR [rbx]
   140001a53:	cmp    rax,0xb
   140001a57:	jg     0x140001b60
   140001a5d:	mov    eax,DWORD PTR [rbx]
   140001a5f:	test   eax,eax
   140001a61:	jne    0x140001cd0
   140001a67:	mov    eax,DWORD PTR [rbx+0x4]
   140001a6a:	test   eax,eax
   140001a6c:	jne    0x140001cd0
   140001a72:	mov    edx,DWORD PTR [rbx+0x8]
   140001a75:	cmp    edx,0x1
   140001a78:	jne    0x140001d10
   140001a7e:	add    rbx,0xc
   140001a82:	cmp    rbx,r13
   140001a85:	jae    0x1400019e1
   140001a8b:	mov    r14,QWORD PTR [rip+0x7e2e]        # 0x1400098c0
   140001a92:	mov    r15d,0xffffffff
   140001a98:	jmp    0x140001aff
   140001a9a:	nop    WORD PTR [rax+rax*1+0x0]
   140001aa0:	cmp    ecx,0x8
   140001aa3:	je     0x140001b80
   140001aa9:	cmp    ecx,0x10
   140001aac:	jne    0x140001d02
   140001ab2:	movzx  esi,WORD PTR [rdi]
   140001ab5:	and    edx,0xc0
   140001abb:	test   si,si
   140001abe:	jns    0x140001c90
   140001ac4:	or     rsi,0xffffffffffff0000
   140001acb:	sub    rsi,rax
   140001ace:	add    rsi,r9
   140001ad1:	test   edx,edx
   140001ad3:	jne    0x140001ae7
   140001ad5:	cmp    rsi,0xffffffffffff8000
   140001adc:	jl     0x140001b43
   140001ade:	cmp    rsi,0xffff
   140001ae5:	jg     0x140001b43
   140001ae7:	mov    rcx,rdi
   140001aea:	call   0x140001850
   140001aef:	mov    WORD PTR [rdi],si
   140001af2:	add    rbx,0xc
   140001af6:	cmp    rbx,r13
   140001af9:	jae    0x140001bd0
   140001aff:	mov    eax,DWORD PTR [rbx]
   140001b01:	mov    edx,DWORD PTR [rbx+0x8]
   140001b04:	mov    edi,DWORD PTR [rbx+0x4]
   140001b07:	add    rax,r14
   140001b0a:	movzx  ecx,dl
   140001b0d:	mov    r9,QWORD PTR [rax]
   140001b10:	add    rdi,r14
   140001b13:	cmp    ecx,0x20
   140001b16:	je     0x140001c28
   140001b1c:	jbe    0x140001aa0
   140001b1e:	cmp    ecx,0x40
   140001b21:	jne    0x140001d02
   140001b27:	mov    rsi,QWORD PTR [rdi]
   140001b2a:	mov    ecx,edx
   140001b2c:	sub    rsi,rax
   140001b2f:	add    rsi,r9
   140001b32:	and    ecx,0xc0
   140001b38:	jne    0x140001c80
   140001b3e:	test   rsi,rsi
   140001b41:	js     0x140001af2
   140001b43:	mov    QWORD PTR [rsp+0x20],rsi
   140001b48:	mov    edx,ecx
   140001b4a:	mov    r8,rdi
   140001b4d:	lea    rcx,[rip+0x78f4]        # 0x140009448
   140001b54:	call   0x1400017e0
   140001b59:	nop    DWORD PTR [rax+0x0]
   140001b60:	test   edx,edx
   140001b62:	jne    0x140001cd0
   140001b68:	mov    eax,DWORD PTR [rbx+0x4]
   140001b6b:	mov    edx,eax
   140001b6d:	or     edx,DWORD PTR [rbx+0x8]
   140001b70:	jne    0x140001a6a
   140001b76:	add    rbx,0xc
   140001b7a:	jmp    0x140001a5d
   140001b7f:	nop
   140001b80:	movzx  esi,BYTE PTR [rdi]
   140001b83:	and    edx,0xc0
   140001b89:	test   sil,sil
   140001b8c:	jns    0x140001cb8
   140001b92:	or     rsi,0xffffffffffffff00
   140001b99:	sub    rsi,rax
   140001b9c:	add    rsi,r9
   140001b9f:	test   edx,edx
   140001ba1:	jne    0x140001bb2
   140001ba3:	cmp    rsi,0xff
   140001baa:	jg     0x140001b43
   140001bac:	cmp    rsi,0xffffffffffffff80
   140001bb0:	jl     0x140001b43
   140001bb2:	mov    rcx,rdi
   140001bb5:	add    rbx,0xc
   140001bb9:	call   0x140001850
   140001bbe:	mov    BYTE PTR [rdi],sil
   140001bc1:	cmp    rbx,r13
   140001bc4:	jb     0x140001aff
   140001bca:	nop    WORD PTR [rax+rax*1+0x0]
   140001bd0:	mov    edx,DWORD PTR [rip+0xa4ce]        # 0x14000c0a4
   140001bd6:	test   edx,edx
   140001bd8:	jle    0x1400019e1
   140001bde:	mov    rsi,QWORD PTR [rip+0xb68b]        # 0x14000d270
   140001be5:	xor    ebx,ebx
   140001be7:	lea    rdi,[rbp-0x4]
   140001beb:	nop    DWORD PTR [rax+rax*1+0x0]
   140001bf0:	mov    rax,QWORD PTR [rip+0xa4b1]        # 0x14000c0a8
   140001bf7:	add    rax,rbx
   140001bfa:	mov    r8d,DWORD PTR [rax]
   140001bfd:	test   r8d,r8d
   140001c00:	je     0x140001c0f
   140001c02:	mov    rdx,QWORD PTR [rax+0x10]
   140001c06:	mov    rcx,QWORD PTR [rax+0x8]
   140001c0a:	mov    r9,rdi
   140001c0d:	call   rsi
   140001c0f:	add    r12d,0x1
   140001c13:	add    rbx,0x28
   140001c17:	cmp    r12d,DWORD PTR [rip+0xa486]        # 0x14000c0a4
   140001c1e:	jl     0x140001bf0
   140001c20:	jmp    0x1400019e1
   140001c25:	nop    DWORD PTR [rax]
   140001c28:	mov    esi,DWORD PTR [rdi]
   140001c2a:	and    edx,0xc0
   140001c30:	test   esi,esi
   140001c32:	jns    0x140001ca8
   140001c34:	movabs r11,0xffffffff00000000
   140001c3e:	or     rsi,r11
   140001c41:	sub    rsi,rax
   140001c44:	add    rsi,r9
   140001c47:	test   edx,edx
   140001c49:	jne    0x140001c67
   140001c4b:	cmp    rsi,r15
   140001c4e:	jg     0x140001b43
   140001c54:	movabs rax,0xffffffff7fffffff
   140001c5e:	cmp    rsi,rax
   140001c61:	jle    0x140001b43
   140001c67:	mov    rcx,rdi
   140001c6a:	call   0x140001850
   140001c6f:	mov    DWORD PTR [rdi],esi
   140001c71:	jmp    0x140001af2
   140001c76:	cs nop WORD PTR [rax+rax*1+0x0]
   140001c80:	mov    rcx,rdi
   140001c83:	call   0x140001850
   140001c88:	mov    QWORD PTR [rdi],rsi
   140001c8b:	jmp    0x140001af2
   140001c90:	sub    rsi,rax
   140001c93:	add    rsi,r9
   140001c96:	test   edx,edx
   140001c98:	je     0x140001ad5
   140001c9e:	jmp    0x140001ae7
   140001ca3:	nop    DWORD PTR [rax+rax*1+0x0]
   140001ca8:	sub    rsi,rax
   140001cab:	add    rsi,r9
   140001cae:	test   edx,edx
   140001cb0:	je     0x140001c4b
   140001cb2:	jmp    0x140001c67
   140001cb4:	nop    DWORD PTR [rax+0x0]
   140001cb8:	sub    rsi,rax
   140001cbb:	add    rsi,r9
   140001cbe:	test   edx,edx
   140001cc0:	je     0x140001ba3
   140001cc6:	jmp    0x140001bb2
   140001ccb:	nop    DWORD PTR [rax+rax*1+0x0]
   140001cd0:	cmp    rbx,r13
   140001cd3:	jae    0x1400019e1
   140001cd9:	mov    r14,QWORD PTR [rip+0x7be0]        # 0x1400098c0
   140001ce0:	mov    esi,DWORD PTR [rbx+0x4]
   140001ce3:	mov    edi,DWORD PTR [rbx]
   140001ce5:	add    rbx,0x8
   140001ce9:	add    rsi,r14
   140001cec:	add    edi,DWORD PTR [rsi]
   140001cee:	mov    rcx,rsi
   140001cf1:	call   0x140001850
   140001cf6:	mov    DWORD PTR [rsi],edi
   140001cf8:	cmp    rbx,r13
   140001cfb:	jb     0x140001ce0
   140001cfd:	jmp    0x140001bd0
   140001d02:	mov    edx,ecx
   140001d04:	lea    rcx,[rip+0x770d]        # 0x140009418
   140001d0b:	call   0x1400017e0
   140001d10:	lea    rcx,[rip+0x76c9]        # 0x1400093e0
   140001d17:	call   0x1400017e0
   140001d1c:	nop
   140001d1d:	nop
   140001d1e:	nop
   140001d1f:	nop
   140001d20:	push   rbp
   140001d21:	mov    rbp,rsp
   140001d24:	sub    rsp,0x50
   140001d28:	mov    rax,QWORD PTR [rip+0xa381]        # 0x14000c0b0
   140001d2f:	unpcklpd xmm2,xmm3
   140001d33:	test   rax,rax
   140001d36:	je     0x140001d54
   140001d38:	movsd  xmm0,QWORD PTR [rbp+0x30]
   140001d3d:	mov    DWORD PTR [rbp-0x30],ecx
   140001d40:	lea    rcx,[rbp-0x30]
   140001d44:	mov    QWORD PTR [rbp-0x28],rdx
   140001d48:	movups XMMWORD PTR [rbp-0x20],xmm2
   140001d4c:	movsd  QWORD PTR [rbp-0x10],xmm0
   140001d51:	call   rax
   140001d53:	nop
   140001d54:	add    rsp,0x50
   140001d58:	pop    rbp
   140001d59:	ret
   140001d5a:	nop    WORD PTR [rax+rax*1+0x0]
   140001d60:	mov    QWORD PTR [rip+0xa349],rcx        # 0x14000c0b0
   140001d67:	jmp    0x140007a00
   140001d6c:	nop
   140001d6d:	nop
   140001d6e:	nop
   140001d6f:	nop
   140001d70:	push   rbp
   140001d71:	push   rbx
   140001d72:	sub    rsp,0x28
   140001d76:	lea    rbp,[rsp+0x20]
   140001d7b:	mov    rdx,QWORD PTR [rcx]
   140001d7e:	mov    eax,DWORD PTR [rdx]
   140001d80:	mov    rbx,rcx
   140001d83:	mov    ecx,eax
   140001d85:	and    ecx,0x20ffffff
   140001d8b:	cmp    ecx,0x20474343
   140001d91:	je     0x140001e50
   140001d97:	cmp    eax,0xc0000096
   140001d9c:	ja     0x140001de7
   140001d9e:	cmp    eax,0xc000008b
   140001da3:	jbe    0x140001e00
   140001da5:	add    eax,0x3fffff73
   140001daa:	cmp    eax,0x9
   140001dad:	ja     0x140001e40
   140001db3:	lea    rdx,[rip+0x76e6]        # 0x1400094a0
   140001dba:	movsxd rax,DWORD PTR [rdx+rax*4]
   140001dbe:	add    rax,rdx
   140001dc1:	jmp    rax
   140001dc3:	nop    DWORD PTR [rax+rax*1+0x0]
   140001dc8:	xor    edx,edx
   140001dca:	mov    ecx,0x8
   140001dcf:	call   0x140007aa8
   140001dd4:	cmp    rax,0x1
   140001dd8:	je     0x140001f14
   140001dde:	test   rax,rax
   140001de1:	jne    0x140001ee0
   140001de7:	mov    rax,QWORD PTR [rip+0xa2e2]        # 0x14000c0d0
   140001dee:	test   rax,rax
   140001df1:	je     0x140001e60
   140001df3:	mov    rcx,rbx
   140001df6:	add    rsp,0x28
   140001dfa:	pop    rbx
   140001dfb:	pop    rbp
   140001dfc:	rex.W jmp rax
   140001dff:	nop
   140001e00:	cmp    eax,0xc0000005
   140001e05:	je     0x140001eb0
   140001e0b:	jbe    0x140001e70
   140001e0d:	cmp    eax,0xc0000008
   140001e12:	je     0x140001e40
   140001e14:	cmp    eax,0xc000001d
   140001e19:	jne    0x140001de7
   140001e1b:	xor    edx,edx
   140001e1d:	mov    ecx,0x4
   140001e22:	call   0x140007aa8
   140001e27:	cmp    rax,0x1
   140001e2b:	je     0x140001f00
   140001e31:	test   rax,rax
   140001e34:	je     0x140001de7
   140001e36:	mov    ecx,0x4
   140001e3b:	call   rax
   140001e3d:	nop    DWORD PTR [rax]
   140001e40:	mov    eax,0xffffffff
   140001e45:	jmp    0x140001e62
   140001e47:	nop    WORD PTR [rax+rax*1+0x0]
   140001e50:	test   BYTE PTR [rdx+0x4],0x1
   140001e54:	jne    0x140001d97
   140001e5a:	jmp    0x140001e40
   140001e5c:	nop    DWORD PTR [rax+0x0]
   140001e60:	xor    eax,eax
   140001e62:	add    rsp,0x28
   140001e66:	pop    rbx
   140001e67:	pop    rbp
   140001e68:	ret
   140001e69:	nop    DWORD PTR [rax+0x0]
   140001e70:	cmp    eax,0x80000002
   140001e75:	jne    0x140001de7
   140001e7b:	jmp    0x140001e40
   140001e7d:	nop    DWORD PTR [rax]
   140001e80:	xor    edx,edx
   140001e82:	mov    ecx,0x8
   140001e87:	call   0x140007aa8
   140001e8c:	cmp    rax,0x1
   140001e90:	jne    0x140001dde
   140001e96:	mov    edx,0x1
   140001e9b:	mov    ecx,0x8
   140001ea0:	call   0x140007aa8
   140001ea5:	jmp    0x140001e40
   140001ea7:	nop    WORD PTR [rax+rax*1+0x0]
   140001eb0:	xor    edx,edx
   140001eb2:	mov    ecx,0xb
   140001eb7:	call   0x140007aa8
   140001ebc:	cmp    rax,0x1
   140001ec0:	je     0x140001eec
   140001ec2:	test   rax,rax
   140001ec5:	je     0x140001de7
   140001ecb:	mov    ecx,0xb
   140001ed0:	call   rax
   140001ed2:	jmp    0x140001e40
   140001ed7:	nop    WORD PTR [rax+rax*1+0x0]
   140001ee0:	mov    ecx,0x8
   140001ee5:	call   rax
   140001ee7:	jmp    0x140001e40
   140001eec:	mov    edx,0x1
   140001ef1:	mov    ecx,0xb
   140001ef6:	call   0x140007aa8
   140001efb:	jmp    0x140001e40
   140001f00:	mov    edx,0x1
   140001f05:	mov    ecx,0x4
   140001f0a:	call   0x140007aa8
   140001f0f:	jmp    0x140001e40
   140001f14:	mov    edx,0x1
   140001f19:	mov    ecx,0x8
   140001f1e:	call   0x140007aa8
   140001f23:	call   0x1400017d0
   140001f28:	jmp    0x140001e40
   140001f2d:	nop
   140001f2e:	nop
   140001f2f:	nop
   140001f30:	push   rbp
   140001f31:	push   r13
   140001f33:	push   r12
   140001f35:	push   rdi
   140001f36:	push   rsi
   140001f37:	push   rbx
   140001f38:	sub    rsp,0x28
   140001f3c:	lea    rbp,[rsp+0x20]
   140001f41:	lea    r13,[rip+0xa1b8]        # 0x14000c100
   140001f48:	mov    rcx,r13
   140001f4b:	call   QWORD PTR [rip+0xb2bf]        # 0x14000d210
   140001f51:	mov    rbx,QWORD PTR [rip+0xa188]        # 0x14000c0e0
   140001f58:	test   rbx,rbx
   140001f5b:	je     0x140001f95
   140001f5d:	mov    r12,QWORD PTR [rip+0xb304]        # 0x14000d268
   140001f64:	mov    rdi,QWORD PTR [rip+0xb2b5]        # 0x14000d220
   140001f6b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001f70:	mov    ecx,DWORD PTR [rbx]
   140001f72:	call   r12
   140001f75:	mov    rsi,rax
   140001f78:	call   rdi
   140001f7a:	test   rsi,rsi
   140001f7d:	je     0x140001f8c
   140001f7f:	test   eax,eax
   140001f81:	jne    0x140001f8c
   140001f83:	mov    rax,QWORD PTR [rbx+0x8]
   140001f87:	mov    rcx,rsi
   140001f8a:	call   rax
   140001f8c:	mov    rbx,QWORD PTR [rbx+0x10]
   140001f90:	test   rbx,rbx
   140001f93:	jne    0x140001f70
   140001f95:	mov    rcx,r13
   140001f98:	add    rsp,0x28
   140001f9c:	pop    rbx
   140001f9d:	pop    rsi
   140001f9e:	pop    rdi
   140001f9f:	pop    r12
   140001fa1:	pop    r13
   140001fa3:	pop    rbp
   140001fa4:	rex.W jmp QWORD PTR [rip+0xb295]        # 0x14000d240
   140001fab:	nop    DWORD PTR [rax+rax*1+0x0]
   140001fb0:	push   rbp
   140001fb1:	push   rdi
   140001fb2:	push   rsi
   140001fb3:	push   rbx
   140001fb4:	sub    rsp,0x28
   140001fb8:	lea    rbp,[rsp+0x20]
   140001fbd:	mov    eax,DWORD PTR [rip+0xa125]        # 0x14000c0e8
   140001fc3:	mov    edi,ecx
   140001fc5:	mov    rsi,rdx
   140001fc8:	test   eax,eax
   140001fca:	jne    0x140001fe0
   140001fcc:	xor    eax,eax
   140001fce:	add    rsp,0x28
   140001fd2:	pop    rbx
   140001fd3:	pop    rsi
   140001fd4:	pop    rdi
   140001fd5:	pop    rbp
   140001fd6:	ret
   140001fd7:	nop    WORD PTR [rax+rax*1+0x0]
   140001fe0:	mov    edx,0x18
   140001fe5:	mov    ecx,0x1
   140001fea:	call   0x140007a48
   140001fef:	mov    rbx,rax
   140001ff2:	test   rax,rax
   140001ff5:	je     0x14000202a
   140001ff7:	mov    QWORD PTR [rax+0x8],rsi
   140001ffb:	lea    rsi,[rip+0xa0fe]        # 0x14000c100
   140002002:	mov    DWORD PTR [rax],edi
   140002004:	mov    rcx,rsi
   140002007:	call   QWORD PTR [rip+0xb203]        # 0x14000d210
   14000200d:	mov    rax,QWORD PTR [rip+0xa0cc]        # 0x14000c0e0
   140002014:	mov    rcx,rsi
   140002017:	mov    QWORD PTR [rip+0xa0c2],rbx        # 0x14000c0e0
   14000201e:	mov    QWORD PTR [rbx+0x10],rax
   140002022:	call   QWORD PTR [rip+0xb218]        # 0x14000d240
   140002028:	jmp    0x140001fcc
   14000202a:	or     eax,0xffffffff
   14000202d:	jmp    0x140001fce
   14000202f:	nop
   140002030:	push   rbp
   140002031:	push   rsi
   140002032:	push   rbx
   140002033:	sub    rsp,0x20
   140002037:	lea    rbp,[rsp+0x20]
   14000203c:	mov    eax,DWORD PTR [rip+0xa0a6]        # 0x14000c0e8
   140002042:	mov    ebx,ecx
   140002044:	test   eax,eax
   140002046:	jne    0x140002058
   140002048:	xor    eax,eax
   14000204a:	add    rsp,0x20
   14000204e:	pop    rbx
   14000204f:	pop    rsi
   140002050:	pop    rbp
   140002051:	ret
   140002052:	nop    WORD PTR [rax+rax*1+0x0]
   140002058:	lea    rsi,[rip+0xa0a1]        # 0x14000c100
   14000205f:	mov    rcx,rsi
   140002062:	call   QWORD PTR [rip+0xb1a8]        # 0x14000d210
   140002068:	mov    rcx,QWORD PTR [rip+0xa071]        # 0x14000c0e0
   14000206f:	test   rcx,rcx
   140002072:	je     0x1400020a3
   140002074:	xor    edx,edx
   140002076:	jmp    0x14000208b
   140002078:	nop    DWORD PTR [rax+rax*1+0x0]
   140002080:	mov    rdx,rcx
   140002083:	test   rax,rax
   140002086:	je     0x1400020a3
   140002088:	mov    rcx,rax
   14000208b:	mov    eax,DWORD PTR [rcx]
   14000208d:	cmp    eax,ebx
   14000208f:	mov    rax,QWORD PTR [rcx+0x10]
   140002093:	jne    0x140002080
   140002095:	test   rdx,rdx
   140002098:	je     0x1400020c0
   14000209a:	mov    QWORD PTR [rdx+0x10],rax
   14000209e:	call   0x140007a70
   1400020a3:	mov    rcx,rsi
   1400020a6:	call   QWORD PTR [rip+0xb194]        # 0x14000d240
   1400020ac:	xor    eax,eax
   1400020ae:	add    rsp,0x20
   1400020b2:	pop    rbx
   1400020b3:	pop    rsi
   1400020b4:	pop    rbp
   1400020b5:	ret
   1400020b6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400020c0:	mov    QWORD PTR [rip+0xa019],rax        # 0x14000c0e0
   1400020c7:	jmp    0x14000209e
   1400020c9:	nop    DWORD PTR [rax+0x0]
   1400020d0:	push   rbp
   1400020d1:	push   rbx
   1400020d2:	sub    rsp,0x28
   1400020d6:	lea    rbp,[rsp+0x20]
   1400020db:	cmp    edx,0x2
   1400020de:	je     0x140002190
   1400020e4:	ja     0x140002110
   1400020e6:	test   edx,edx
   1400020e8:	je     0x140002130
   1400020ea:	mov    eax,DWORD PTR [rip+0x9ff8]        # 0x14000c0e8
   1400020f0:	test   eax,eax
   1400020f2:	je     0x1400021b0
   1400020f8:	mov    DWORD PTR [rip+0x9fe6],0x1        # 0x14000c0e8
   140002102:	mov    eax,0x1
   140002107:	add    rsp,0x28
   14000210b:	pop    rbx
   14000210c:	pop    rbp
   14000210d:	ret
   14000210e:	xchg   ax,ax
   140002110:	cmp    edx,0x3
   140002113:	jne    0x140002102
   140002115:	mov    eax,DWORD PTR [rip+0x9fcd]        # 0x14000c0e8
   14000211b:	test   eax,eax
   14000211d:	je     0x140002102
   14000211f:	call   0x140001f30
   140002124:	jmp    0x140002102
   140002126:	cs nop WORD PTR [rax+rax*1+0x0]
   140002130:	mov    eax,DWORD PTR [rip+0x9fb2]        # 0x14000c0e8
   140002136:	test   eax,eax
   140002138:	jne    0x1400021a8
   14000213a:	mov    eax,DWORD PTR [rip+0x9fa8]        # 0x14000c0e8
   140002140:	cmp    eax,0x1
   140002143:	jne    0x140002102
   140002145:	mov    rbx,QWORD PTR [rip+0x9f94]        # 0x14000c0e0
   14000214c:	test   rbx,rbx
   14000214f:	je     0x140002169
   140002151:	nop    DWORD PTR [rax+0x0]
   140002158:	mov    rcx,rbx
   14000215b:	mov    rbx,QWORD PTR [rbx+0x10]
   14000215f:	call   0x140007a70
   140002164:	test   rbx,rbx
   140002167:	jne    0x140002158
   140002169:	lea    rcx,[rip+0x9f90]        # 0x14000c100
   140002170:	mov    QWORD PTR [rip+0x9f65],0x0        # 0x14000c0e0
   14000217b:	mov    DWORD PTR [rip+0x9f63],0x0        # 0x14000c0e8
   140002185:	call   QWORD PTR [rip+0xb07d]        # 0x14000d208
   14000218b:	jmp    0x140002102
   140002190:	call   0x1400017d0
   140002195:	mov    eax,0x1
   14000219a:	add    rsp,0x28
   14000219e:	pop    rbx
   14000219f:	pop    rbp
   1400021a0:	ret
   1400021a1:	nop    DWORD PTR [rax+0x0]
   1400021a8:	call   0x140001f30
   1400021ad:	jmp    0x14000213a
   1400021af:	nop
   1400021b0:	lea    rcx,[rip+0x9f49]        # 0x14000c100
   1400021b7:	call   QWORD PTR [rip+0xb06b]        # 0x14000d228
   1400021bd:	jmp    0x1400020f8
   1400021c2:	nop
   1400021c3:	nop
   1400021c4:	nop
   1400021c5:	nop
   1400021c6:	nop
   1400021c7:	nop
   1400021c8:	nop
   1400021c9:	nop
   1400021ca:	nop
   1400021cb:	nop
   1400021cc:	nop
   1400021cd:	nop
   1400021ce:	nop
   1400021cf:	nop
   1400021d0:	xor    eax,eax
   1400021d2:	cmp    WORD PTR [rcx],0x5a4d
   1400021d7:	jne    0x1400021e8
   1400021d9:	movsxd rdx,DWORD PTR [rcx+0x3c]
   1400021dd:	add    rcx,rdx
   1400021e0:	cmp    DWORD PTR [rcx],0x4550
   1400021e6:	je     0x1400021f0
   1400021e8:	ret
   1400021e9:	nop    DWORD PTR [rax+0x0]
   1400021f0:	xor    eax,eax
   1400021f2:	cmp    WORD PTR [rcx+0x18],0x20b
   1400021f8:	sete   al
   1400021fb:	ret
   1400021fc:	nop    DWORD PTR [rax+0x0]
   140002200:	movsxd rax,DWORD PTR [rcx+0x3c]
   140002204:	add    rcx,rax
   140002207:	movzx  eax,WORD PTR [rcx+0x14]
   14000220b:	movzx  r8d,WORD PTR [rcx+0x6]
   140002210:	lea    rax,[rcx+rax*1+0x18]
   140002215:	test   r8w,r8w
   140002219:	je     0x14000224d
   14000221b:	lea    ecx,[r8-0x1]
   14000221f:	lea    rcx,[rcx+rcx*4]
   140002223:	lea    r9,[rax+rcx*8+0x28]
   140002228:	nop    DWORD PTR [rax+rax*1+0x0]
   140002230:	mov    r8d,DWORD PTR [rax+0xc]
   140002234:	mov    rcx,r8
   140002237:	cmp    rdx,r8
   14000223a:	jb     0x140002244
   14000223c:	add    ecx,DWORD PTR [rax+0x8]
   14000223f:	cmp    rdx,rcx
   140002242:	jb     0x14000224f
   140002244:	add    rax,0x28
   140002248:	cmp    rax,r9
   14000224b:	jne    0x140002230
   14000224d:	xor    eax,eax
   14000224f:	ret
   140002250:	push   rbp
   140002251:	push   rdi
   140002252:	push   rsi
   140002253:	push   rbx
   140002254:	sub    rsp,0x28
   140002258:	lea    rbp,[rsp+0x20]
   14000225d:	mov    rsi,rcx
   140002260:	call   0x140007ac0
   140002265:	cmp    rax,0x8
   140002269:	ja     0x1400022e8
   14000226b:	mov    rdx,QWORD PTR [rip+0x764e]        # 0x1400098c0
   140002272:	xor    ebx,ebx
   140002274:	cmp    WORD PTR [rdx],0x5a4d
   140002279:	jne    0x1400022d6
   14000227b:	movsxd rax,DWORD PTR [rdx+0x3c]
   14000227f:	add    rax,rdx
   140002282:	cmp    DWORD PTR [rax],0x4550
   140002288:	jne    0x1400022d6
   14000228a:	cmp    WORD PTR [rax+0x18],0x20b
   140002290:	jne    0x1400022d6
   140002292:	movzx  edx,WORD PTR [rax+0x14]
   140002296:	lea    rbx,[rax+rdx*1+0x18]
   14000229b:	movzx  edx,WORD PTR [rax+0x6]
   14000229f:	test   dx,dx
   1400022a2:	je     0x1400022e8
   1400022a4:	lea    eax,[rdx-0x1]
   1400022a7:	lea    rax,[rax+rax*4]
   1400022ab:	lea    rdi,[rbx+rax*8+0x28]
   1400022b0:	jmp    0x1400022c1
   1400022b2:	nop    WORD PTR [rax+rax*1+0x0]
   1400022b8:	add    rbx,0x28
   1400022bc:	cmp    rbx,rdi
   1400022bf:	je     0x1400022e8
   1400022c1:	mov    r8d,0x8
   1400022c7:	mov    rdx,rsi
   1400022ca:	mov    rcx,rbx
   1400022cd:	call   0x140007ac8
   1400022d2:	test   eax,eax
   1400022d4:	jne    0x1400022b8
   1400022d6:	mov    rax,rbx
   1400022d9:	add    rsp,0x28
   1400022dd:	pop    rbx
   1400022de:	pop    rsi
   1400022df:	pop    rdi
   1400022e0:	pop    rbp
   1400022e1:	ret
   1400022e2:	nop    WORD PTR [rax+rax*1+0x0]
   1400022e8:	xor    ebx,ebx
   1400022ea:	mov    rax,rbx
   1400022ed:	add    rsp,0x28
   1400022f1:	pop    rbx
   1400022f2:	pop    rsi
   1400022f3:	pop    rdi
   1400022f4:	pop    rbp
   1400022f5:	ret
   1400022f6:	cs nop WORD PTR [rax+rax*1+0x0]
   140002300:	mov    rdx,QWORD PTR [rip+0x75b9]        # 0x1400098c0
   140002307:	xor    eax,eax
   140002309:	cmp    WORD PTR [rdx],0x5a4d
   14000230e:	jne    0x140002320
   140002310:	movsxd r8,DWORD PTR [rdx+0x3c]
   140002314:	add    r8,rdx
   140002317:	cmp    DWORD PTR [r8],0x4550
   14000231e:	je     0x140002328
   140002320:	ret
   140002321:	nop    DWORD PTR [rax+0x0]
   140002328:	cmp    WORD PTR [r8+0x18],0x20b
   14000232f:	jne    0x140002320
   140002331:	movzx  eax,WORD PTR [r8+0x14]
   140002336:	sub    rcx,rdx
   140002339:	lea    rax,[r8+rax*1+0x18]
   14000233e:	movzx  r8d,WORD PTR [r8+0x6]
   140002343:	test   r8w,r8w
   140002347:	je     0x14000237d
   140002349:	lea    edx,[r8-0x1]
   14000234d:	lea    rdx,[rdx+rdx*4]
   140002351:	lea    r9,[rax+rdx*8+0x28]
   140002356:	cs nop WORD PTR [rax+rax*1+0x0]
   140002360:	mov    r8d,DWORD PTR [rax+0xc]
   140002364:	mov    rdx,r8
   140002367:	cmp    rcx,r8
   14000236a:	jb     0x140002374
   14000236c:	add    edx,DWORD PTR [rax+0x8]
   14000236f:	cmp    rcx,rdx
   140002372:	jb     0x140002320
   140002374:	add    rax,0x28
   140002378:	cmp    rax,r9
   14000237b:	jne    0x140002360
   14000237d:	xor    eax,eax
   14000237f:	ret
   140002380:	mov    rax,QWORD PTR [rip+0x7539]        # 0x1400098c0
   140002387:	xor    ecx,ecx
   140002389:	cmp    WORD PTR [rax],0x5a4d
   14000238e:	jne    0x14000239f
   140002390:	movsxd rdx,DWORD PTR [rax+0x3c]
   140002394:	add    rax,rdx
   140002397:	cmp    DWORD PTR [rax],0x4550
   14000239d:	je     0x1400023a8
   14000239f:	mov    eax,ecx
   1400023a1:	ret
   1400023a2:	nop    WORD PTR [rax+rax*1+0x0]
   1400023a8:	cmp    WORD PTR [rax+0x18],0x20b
   1400023ae:	jne    0x14000239f
   1400023b0:	movzx  ecx,WORD PTR [rax+0x6]
   1400023b4:	mov    eax,ecx
   1400023b6:	ret
   1400023b7:	nop    WORD PTR [rax+rax*1+0x0]
   1400023c0:	mov    r8,QWORD PTR [rip+0x74f9]        # 0x1400098c0
   1400023c7:	xor    eax,eax
   1400023c9:	cmp    WORD PTR [r8],0x5a4d
   1400023cf:	jne    0x1400023e0
   1400023d1:	movsxd rdx,DWORD PTR [r8+0x3c]
   1400023d5:	add    rdx,r8
   1400023d8:	cmp    DWORD PTR [rdx],0x4550
   1400023de:	je     0x1400023e8
   1400023e0:	ret
   1400023e1:	nop    DWORD PTR [rax+0x0]
   1400023e8:	cmp    WORD PTR [rdx+0x18],0x20b
   1400023ee:	jne    0x1400023e0
   1400023f0:	movzx  eax,WORD PTR [rdx+0x14]
   1400023f4:	movzx  r8d,WORD PTR [rdx+0x6]
   1400023f9:	lea    rax,[rdx+rax*1+0x18]
   1400023fe:	test   r8w,r8w
   140002402:	je     0x140002430
   140002404:	lea    edx,[r8-0x1]
   140002408:	lea    rdx,[rdx+rdx*4]
   14000240c:	lea    rdx,[rax+rdx*8+0x28]
   140002411:	nop    DWORD PTR [rax+0x0]
   140002418:	test   BYTE PTR [rax+0x27],0x20
   14000241c:	je     0x140002427
   14000241e:	test   rcx,rcx
   140002421:	je     0x1400023e0
   140002423:	sub    rcx,0x1
   140002427:	add    rax,0x28
   14000242b:	cmp    rdx,rax
   14000242e:	jne    0x140002418
   140002430:	xor    eax,eax
   140002432:	ret
   140002433:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000243e:	xchg   ax,ax
   140002440:	mov    rax,QWORD PTR [rip+0x7479]        # 0x1400098c0
   140002447:	xor    edx,edx
   140002449:	cmp    WORD PTR [rax],0x5a4d
   14000244e:	jne    0x14000245f
   140002450:	movsxd rcx,DWORD PTR [rax+0x3c]
   140002454:	add    rcx,rax
   140002457:	cmp    DWORD PTR [rcx],0x4550
   14000245d:	je     0x140002468
   14000245f:	mov    rax,rdx
   140002462:	ret
   140002463:	nop    DWORD PTR [rax+rax*1+0x0]
   140002468:	cmp    WORD PTR [rcx+0x18],0x20b
   14000246e:	cmove  rdx,rax
   140002472:	mov    rax,rdx
   140002475:	ret
   140002476:	cs nop WORD PTR [rax+rax*1+0x0]
   140002480:	mov    rdx,QWORD PTR [rip+0x7439]        # 0x1400098c0
   140002487:	xor    eax,eax
   140002489:	cmp    WORD PTR [rdx],0x5a4d
   14000248e:	jne    0x1400024a0
   140002490:	movsxd r8,DWORD PTR [rdx+0x3c]
   140002494:	add    r8,rdx
   140002497:	cmp    DWORD PTR [r8],0x4550
   14000249e:	je     0x1400024a8
   1400024a0:	ret
   1400024a1:	nop    DWORD PTR [rax+0x0]
   1400024a8:	cmp    WORD PTR [r8+0x18],0x20b
   1400024af:	jne    0x1400024a0
   1400024b1:	sub    rcx,rdx
   1400024b4:	movzx  r9d,WORD PTR [r8+0x6]
   1400024b9:	movzx  edx,WORD PTR [r8+0x14]
   1400024be:	lea    rdx,[r8+rdx*1+0x18]
   1400024c3:	test   r9w,r9w
   1400024c7:	je     0x1400024a0
   1400024c9:	lea    eax,[r9-0x1]
   1400024cd:	lea    rax,[rax+rax*4]
   1400024d1:	lea    r9,[rdx+rax*8+0x28]
   1400024d6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400024e0:	mov    r8d,DWORD PTR [rdx+0xc]
   1400024e4:	mov    rax,r8
   1400024e7:	cmp    rcx,r8
   1400024ea:	jb     0x1400024f4
   1400024ec:	add    eax,DWORD PTR [rdx+0x8]
   1400024ef:	cmp    rcx,rax
   1400024f2:	jb     0x140002500
   1400024f4:	add    rdx,0x28
   1400024f8:	cmp    rdx,r9
   1400024fb:	jne    0x1400024e0
   1400024fd:	xor    eax,eax
   1400024ff:	ret
   140002500:	mov    eax,DWORD PTR [rdx+0x24]
   140002503:	not    eax
   140002505:	shr    eax,0x1f
   140002508:	ret
   140002509:	nop    DWORD PTR [rax+0x0]
   140002510:	mov    r11,QWORD PTR [rip+0x73a9]        # 0x1400098c0
   140002517:	xor    r8d,r8d
   14000251a:	cmp    WORD PTR [r11],0x5a4d
   140002520:	mov    r10d,ecx
   140002523:	jne    0x140002534
   140002525:	movsxd rcx,DWORD PTR [r11+0x3c]
   140002529:	add    rcx,r11
   14000252c:	cmp    DWORD PTR [rcx],0x4550
   140002532:	je     0x140002540
   140002534:	mov    rax,r8
   140002537:	ret
   140002538:	nop    DWORD PTR [rax+rax*1+0x0]
   140002540:	cmp    WORD PTR [rcx+0x18],0x20b
   140002546:	jne    0x140002534
   140002548:	mov    eax,DWORD PTR [rcx+0x90]
   14000254e:	test   eax,eax
   140002550:	je     0x140002534
   140002552:	movzx  edx,WORD PTR [rcx+0x14]
   140002556:	movzx  r9d,WORD PTR [rcx+0x6]
   14000255b:	lea    rdx,[rcx+rdx*1+0x18]
   140002560:	test   r9w,r9w
   140002564:	je     0x140002534
   140002566:	lea    ecx,[r9-0x1]
   14000256a:	lea    rcx,[rcx+rcx*4]
   14000256e:	lea    r9,[rdx+rcx*8+0x28]
   140002573:	nop    DWORD PTR [rax+rax*1+0x0]
   140002578:	mov    r8d,DWORD PTR [rdx+0xc]
   14000257c:	mov    rcx,r8
   14000257f:	cmp    rax,r8
   140002582:	jb     0x14000258c
   140002584:	add    ecx,DWORD PTR [rdx+0x8]
   140002587:	cmp    rax,rcx
   14000258a:	jb     0x1400025a0
   14000258c:	add    rdx,0x28
   140002590:	cmp    r9,rdx
   140002593:	jne    0x140002578
   140002595:	xor    r8d,r8d
   140002598:	mov    rax,r8
   14000259b:	ret
   14000259c:	nop    DWORD PTR [rax+0x0]
   1400025a0:	add    rax,r11
   1400025a3:	jmp    0x1400025b0
   1400025a5:	nop    DWORD PTR [rax]
   1400025a8:	sub    r10d,0x1
   1400025ac:	add    rax,0x14
   1400025b0:	mov    ecx,DWORD PTR [rax+0x4]
   1400025b3:	test   ecx,ecx
   1400025b5:	jne    0x1400025be
   1400025b7:	mov    edx,DWORD PTR [rax+0xc]
   1400025ba:	test   edx,edx
   1400025bc:	je     0x140002595
   1400025be:	test   r10d,r10d
   1400025c1:	jg     0x1400025a8
   1400025c3:	mov    r8d,DWORD PTR [rax+0xc]
   1400025c7:	add    r8,r11
   1400025ca:	mov    rax,r8
   1400025cd:	ret
   1400025ce:	nop
   1400025cf:	nop
   1400025d0:	push   rcx
   1400025d1:	push   rax
   1400025d2:	cmp    rax,0x1000
   1400025d8:	lea    rcx,[rsp+0x18]
   1400025dd:	jb     0x1400025f8
   1400025df:	sub    rcx,0x1000
   1400025e6:	or     QWORD PTR [rcx],0x0
   1400025ea:	sub    rax,0x1000
   1400025f0:	cmp    rax,0x1000
   1400025f6:	ja     0x1400025df
   1400025f8:	sub    rcx,rax
   1400025fb:	or     QWORD PTR [rcx],0x0
   1400025ff:	pop    rax
   140002600:	pop    rcx
   140002601:	ret
   140002602:	nop
   140002603:	nop
   140002604:	nop
   140002605:	nop
   140002606:	nop
   140002607:	nop
   140002608:	nop
   140002609:	nop
   14000260a:	nop
   14000260b:	nop
   14000260c:	nop
   14000260d:	nop
   14000260e:	nop
   14000260f:	nop
   140002610:	push   rbp
   140002611:	push   rdi
   140002612:	push   rsi
   140002613:	push   rbx
   140002614:	sub    rsp,0x38
   140002618:	lea    rbp,[rsp+0x30]
   14000261d:	mov    rdi,r8
   140002620:	mov    rbx,rcx
   140002623:	mov    rsi,rdx
   140002626:	call   0x140007360
   14000262b:	mov    QWORD PTR [rsp+0x20],rdi
   140002630:	mov    r9,rsi
   140002633:	xor    r8d,r8d
   140002636:	mov    rdx,rbx
   140002639:	mov    ecx,0x6000
   14000263e:	call   0x140004210
   140002643:	mov    rcx,rbx
   140002646:	mov    esi,eax
   140002648:	call   0x1400073d0
   14000264d:	mov    eax,esi
   14000264f:	add    rsp,0x38
   140002653:	pop    rbx
   140002654:	pop    rsi
   140002655:	pop    rdi
   140002656:	pop    rbp
   140002657:	ret
   140002658:	nop
   140002659:	nop
   14000265a:	nop
   14000265b:	nop
   14000265c:	nop
   14000265d:	nop
   14000265e:	nop
   14000265f:	nop
   140002660:	push   rbp
   140002661:	mov    rbp,rsp
   140002664:	sub    rsp,0x60
   140002668:	mov    rax,QWORD PTR [rdx]
   14000266b:	mov    edx,DWORD PTR [rdx+0x8]
   14000266e:	mov    r11d,edx
   140002671:	mov    r10d,ecx
   140002674:	mov    QWORD PTR [rbp-0x10],rax
   140002678:	mov    rcx,rdx
   14000267b:	mov    DWORD PTR [rbp-0x8],edx
   14000267e:	and    r11w,0x7fff
   140002684:	jne    0x1400026f0
   140002686:	mov    rdx,rax
   140002689:	shr    rdx,0x20
   14000268d:	or     eax,edx
   14000268f:	je     0x140002720
   140002695:	test   edx,edx
   140002697:	jns    0x140002730
   14000269d:	lea    edx,[r11-0x403e]
   1400026a4:	mov    eax,0x1
   1400026a9:	movsx  edx,dx
   1400026ac:	mov    DWORD PTR [rbp-0x1c],eax
   1400026af:	and    ecx,0x8000
   1400026b5:	mov    rax,QWORD PTR [rbp+0x30]
   1400026b9:	mov    DWORD PTR [rax],ecx
   1400026bb:	lea    rax,[rbp-0x18]
   1400026bf:	lea    rcx,[rip+0x598a]        # 0x140008050
   1400026c6:	mov    QWORD PTR [rsp+0x30],r9
   1400026cb:	lea    r9,[rbp-0x1c]
   1400026cf:	mov    DWORD PTR [rsp+0x28],r8d
   1400026d4:	lea    r8,[rbp-0x10]
   1400026d8:	mov    QWORD PTR [rsp+0x38],rax
   1400026dd:	mov    DWORD PTR [rsp+0x20],r10d
   1400026e2:	call   0x140004e90
   1400026e7:	add    rsp,0x60
   1400026eb:	pop    rbp
   1400026ec:	ret
   1400026ed:	nop    DWORD PTR [rax]
   1400026f0:	cmp    r11w,0x7fff
   1400026f6:	jne    0x14000269d
   1400026f8:	mov    rdx,rax
   1400026fb:	shr    rdx,0x20
   1400026ff:	and    edx,0x7fffffff
   140002705:	or     edx,eax
   140002707:	je     0x140002740
   140002709:	mov    DWORD PTR [rbp-0x1c],0x4
   140002710:	xor    edx,edx
   140002712:	xor    ecx,ecx
   140002714:	jmp    0x1400026b5
   140002716:	cs nop WORD PTR [rax+rax*1+0x0]
   140002720:	xor    eax,eax
   140002722:	xor    edx,edx
   140002724:	jmp    0x1400026ac
   140002726:	cs nop WORD PTR [rax+rax*1+0x0]
   140002730:	mov    eax,0x2
   140002735:	mov    edx,0xffffbfc3
   14000273a:	jmp    0x1400026ac
   14000273f:	nop
   140002740:	mov    eax,0x3
   140002745:	xor    edx,edx
   140002747:	jmp    0x1400026ac
   14000274c:	nop    DWORD PTR [rax+0x0]
   140002750:	push   rbp
   140002751:	push   rbx
   140002752:	sub    rsp,0x28
   140002756:	lea    rbp,[rsp+0x20]
   14000275b:	mov    rbx,rdx
   14000275e:	mov    edx,DWORD PTR [rdx+0x8]
   140002761:	test   dh,0x40
   140002764:	jne    0x14000276e
   140002766:	mov    eax,DWORD PTR [rbx+0x24]
   140002769:	cmp    DWORD PTR [rbx+0x28],eax
   14000276c:	jle    0x140002780
   14000276e:	mov    rax,QWORD PTR [rbx]
   140002771:	and    dh,0x20
   140002774:	jne    0x140002790
   140002776:	movsxd rdx,DWORD PTR [rbx+0x24]
   14000277a:	mov    BYTE PTR [rax+rdx*1],cl
   14000277d:	mov    eax,DWORD PTR [rbx+0x24]
   140002780:	add    eax,0x1
   140002783:	mov    DWORD PTR [rbx+0x24],eax
   140002786:	add    rsp,0x28
   14000278a:	pop    rbx
   14000278b:	pop    rbp
   14000278c:	ret
   14000278d:	nop    DWORD PTR [rax]
   140002790:	mov    rdx,rax
   140002793:	call   0x140007a68
   140002798:	mov    eax,DWORD PTR [rbx+0x24]
   14000279b:	add    eax,0x1
   14000279e:	mov    DWORD PTR [rbx+0x24],eax
   1400027a1:	add    rsp,0x28
   1400027a5:	pop    rbx
   1400027a6:	pop    rbp
   1400027a7:	ret
   1400027a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400027b0:	push   rbp
   1400027b1:	push   r15
   1400027b3:	push   r14
   1400027b5:	push   r13
   1400027b7:	push   r12
   1400027b9:	push   rdi
   1400027ba:	push   rsi
   1400027bb:	push   rbx
   1400027bc:	sub    rsp,0x58
   1400027c0:	lea    rbp,[rsp+0x50]
   1400027c5:	lea    rax,[rbp-0x18]
   1400027c9:	lea    rdi,[rbp-0x10]
   1400027cd:	mov    esi,edx
   1400027cf:	mov    rbx,r8
   1400027d2:	xor    edx,edx
   1400027d4:	mov    r12,rcx
   1400027d7:	mov    r8,rax
   1400027da:	mov    rcx,rdi
   1400027dd:	mov    QWORD PTR [rbp-0x28],rax
   1400027e1:	call   0x140007520
   1400027e6:	mov    eax,DWORD PTR [rbx+0x10]
   1400027e9:	cmp    esi,eax
   1400027eb:	mov    edx,eax
   1400027ed:	cmovle edx,esi
   1400027f0:	test   eax,eax
   1400027f2:	mov    eax,DWORD PTR [rbx+0xc]
   1400027f5:	cmovns esi,edx
   1400027f8:	cmp    eax,esi
   1400027fa:	jg     0x1400028eb
   140002800:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002807:	lea    r13d,[rsi-0x1]
   14000280b:	test   esi,esi
   14000280d:	jle    0x140002945
   140002813:	xor    esi,esi
   140002815:	add    r13d,0x1
   140002819:	nop    DWORD PTR [rax+0x0]
   140002820:	movzx  edx,WORD PTR [r12+rsi*2]
   140002825:	mov    r8,QWORD PTR [rbp-0x28]
   140002829:	mov    rcx,rdi
   14000282c:	call   0x140007520
   140002831:	test   eax,eax
   140002833:	jle    0x1400028cd
   140002839:	sub    eax,0x1
   14000283c:	mov    r15,rdi
   14000283f:	lea    r14,[rdi+rax*1+0x1]
   140002844:	jmp    0x140002865
   140002846:	cs nop WORD PTR [rax+rax*1+0x0]
   140002850:	movsxd rdx,DWORD PTR [rbx+0x24]
   140002854:	mov    BYTE PTR [rax+rdx*1],cl
   140002857:	mov    eax,DWORD PTR [rbx+0x24]
   14000285a:	add    eax,0x1
   14000285d:	mov    DWORD PTR [rbx+0x24],eax
   140002860:	cmp    r15,r14
   140002863:	je     0x14000289c
   140002865:	mov    edx,DWORD PTR [rbx+0x8]
   140002868:	add    r15,0x1
   14000286c:	test   dh,0x40
   14000286f:	jne    0x140002879
   140002871:	mov    eax,DWORD PTR [rbx+0x24]
   140002874:	cmp    DWORD PTR [rbx+0x28],eax
   140002877:	jle    0x14000285a
   140002879:	movsx  ecx,BYTE PTR [r15-0x1]
   14000287e:	mov    rax,QWORD PTR [rbx]
   140002881:	and    dh,0x20
   140002884:	je     0x140002850
   140002886:	mov    rdx,rax
   140002889:	call   0x140007a68
   14000288e:	mov    eax,DWORD PTR [rbx+0x24]
   140002891:	add    eax,0x1
   140002894:	mov    DWORD PTR [rbx+0x24],eax
   140002897:	cmp    r15,r14
   14000289a:	jne    0x140002865
   14000289c:	add    rsi,0x1
   1400028a0:	mov    eax,r13d
   1400028a3:	sub    eax,esi
   1400028a5:	test   eax,eax
   1400028a7:	jg     0x140002820
   1400028ad:	mov    eax,DWORD PTR [rbx+0xc]
   1400028b0:	lea    edx,[rax-0x1]
   1400028b3:	mov    DWORD PTR [rbx+0xc],edx
   1400028b6:	test   eax,eax
   1400028b8:	jle    0x1400028da
   1400028ba:	nop    WORD PTR [rax+rax*1+0x0]
   1400028c0:	mov    rdx,rbx
   1400028c3:	mov    ecx,0x20
   1400028c8:	call   0x140002750
   1400028cd:	mov    eax,DWORD PTR [rbx+0xc]
   1400028d0:	lea    edx,[rax-0x1]
   1400028d3:	mov    DWORD PTR [rbx+0xc],edx
   1400028d6:	test   eax,eax
   1400028d8:	jg     0x1400028c0
   1400028da:	add    rsp,0x58
   1400028de:	pop    rbx
   1400028df:	pop    rsi
   1400028e0:	pop    rdi
   1400028e1:	pop    r12
   1400028e3:	pop    r13
   1400028e5:	pop    r14
   1400028e7:	pop    r15
   1400028e9:	pop    rbp
   1400028ea:	ret
   1400028eb:	sub    eax,esi
   1400028ed:	mov    DWORD PTR [rbx+0xc],eax
   1400028f0:	test   BYTE PTR [rbx+0x9],0x4
   1400028f4:	jne    0x140002930
   1400028f6:	sub    eax,0x1
   1400028f9:	mov    DWORD PTR [rbx+0xc],eax
   1400028fc:	nop    DWORD PTR [rax+0x0]
   140002900:	mov    rdx,rbx
   140002903:	mov    ecx,0x20
   140002908:	call   0x140002750
   14000290d:	mov    eax,DWORD PTR [rbx+0xc]
   140002910:	lea    edx,[rax-0x1]
   140002913:	mov    DWORD PTR [rbx+0xc],edx
   140002916:	test   eax,eax
   140002918:	jne    0x140002900
   14000291a:	lea    r13d,[rsi-0x1]
   14000291e:	test   esi,esi
   140002920:	jg     0x140002813
   140002926:	jmp    0x1400028cd
   140002928:	nop    DWORD PTR [rax+rax*1+0x0]
   140002930:	lea    r13d,[rsi-0x1]
   140002934:	test   esi,esi
   140002936:	jg     0x140002813
   14000293c:	sub    DWORD PTR [rbx+0xc],0x1
   140002940:	jmp    0x1400028c0
   140002945:	mov    DWORD PTR [rbx+0xc],0xfffffffe
   14000294c:	jmp    0x1400028da
   14000294e:	xchg   ax,ax
   140002950:	push   rbp
   140002951:	push   rdi
   140002952:	push   rsi
   140002953:	push   rbx
   140002954:	sub    rsp,0x28
   140002958:	lea    rbp,[rsp+0x20]
   14000295d:	mov    eax,DWORD PTR [r8+0x10]
   140002961:	mov    edi,edx
   140002963:	cmp    edx,eax
   140002965:	mov    edx,eax
   140002967:	mov    rsi,rcx
   14000296a:	cmovle edx,edi
   14000296d:	test   eax,eax
   14000296f:	mov    eax,DWORD PTR [r8+0xc]
   140002973:	mov    rbx,r8
   140002976:	cmovns edi,edx
   140002979:	cmp    eax,edi
   14000297b:	jg     0x140002a38
   140002981:	mov    DWORD PTR [r8+0xc],0xffffffff
   140002989:	lea    edx,[rdi-0x1]
   14000298c:	test   edi,edi
   14000298e:	je     0x140002a25
   140002994:	mov    eax,DWORD PTR [rbx+0x8]
   140002997:	lea    edi,[rdx+0x1]
   14000299a:	add    rdi,rsi
   14000299d:	jmp    0x1400029b8
   14000299f:	nop
   1400029a0:	movsxd rax,DWORD PTR [rbx+0x24]
   1400029a4:	mov    BYTE PTR [rdx+rax*1],cl
   1400029a7:	mov    edx,DWORD PTR [rbx+0x24]
   1400029aa:	add    edx,0x1
   1400029ad:	mov    DWORD PTR [rbx+0x24],edx
   1400029b0:	cmp    rsi,rdi
   1400029b3:	je     0x1400029f1
   1400029b5:	mov    eax,DWORD PTR [rbx+0x8]
   1400029b8:	add    rsi,0x1
   1400029bc:	test   ah,0x40
   1400029bf:	jne    0x1400029c9
   1400029c1:	mov    edx,DWORD PTR [rbx+0x24]
   1400029c4:	cmp    DWORD PTR [rbx+0x28],edx
   1400029c7:	jle    0x1400029aa
   1400029c9:	movsx  ecx,BYTE PTR [rsi-0x1]
   1400029cd:	mov    rdx,QWORD PTR [rbx]
   1400029d0:	test   ah,0x20
   1400029d3:	je     0x1400029a0
   1400029d5:	call   0x140007a68
   1400029da:	mov    edx,DWORD PTR [rbx+0x24]
   1400029dd:	jmp    0x1400029aa
   1400029df:	nop
   1400029e0:	movsxd rax,DWORD PTR [rbx+0x24]
   1400029e4:	mov    BYTE PTR [rdx+rax*1],0x20
   1400029e8:	mov    edx,DWORD PTR [rbx+0x24]
   1400029eb:	add    edx,0x1
   1400029ee:	mov    DWORD PTR [rbx+0x24],edx
   1400029f1:	mov    eax,DWORD PTR [rbx+0xc]
   1400029f4:	lea    edx,[rax-0x1]
   1400029f7:	mov    DWORD PTR [rbx+0xc],edx
   1400029fa:	test   eax,eax
   1400029fc:	jle    0x140002a2c
   1400029fe:	mov    eax,DWORD PTR [rbx+0x8]
   140002a01:	test   ah,0x40
   140002a04:	jne    0x140002a0e
   140002a06:	mov    edx,DWORD PTR [rbx+0x24]
   140002a09:	cmp    DWORD PTR [rbx+0x28],edx
   140002a0c:	jle    0x1400029eb
   140002a0e:	mov    rdx,QWORD PTR [rbx]
   140002a11:	test   ah,0x20
   140002a14:	je     0x1400029e0
   140002a16:	mov    ecx,0x20
   140002a1b:	call   0x140007a68
   140002a20:	mov    edx,DWORD PTR [rbx+0x24]
   140002a23:	jmp    0x1400029eb
   140002a25:	mov    DWORD PTR [rbx+0xc],0xfffffffe
   140002a2c:	add    rsp,0x28
   140002a30:	pop    rbx
   140002a31:	pop    rsi
   140002a32:	pop    rdi
   140002a33:	pop    rbp
   140002a34:	ret
   140002a35:	nop    DWORD PTR [rax]
   140002a38:	sub    eax,edi
   140002a3a:	mov    DWORD PTR [r8+0xc],eax
   140002a3e:	mov    edx,eax
   140002a40:	mov    eax,DWORD PTR [r8+0x8]
   140002a44:	test   ah,0x4
   140002a47:	jne    0x140002a80
   140002a49:	lea    eax,[rdx-0x1]
   140002a4c:	mov    DWORD PTR [r8+0xc],eax
   140002a50:	mov    rdx,rbx
   140002a53:	mov    ecx,0x20
   140002a58:	call   0x140002750
   140002a5d:	mov    eax,DWORD PTR [rbx+0xc]
   140002a60:	lea    edx,[rax-0x1]
   140002a63:	mov    DWORD PTR [rbx+0xc],edx
   140002a66:	test   eax,eax
   140002a68:	jne    0x140002a50
   140002a6a:	lea    edx,[rdi-0x1]
   140002a6d:	test   edi,edi
   140002a6f:	jne    0x140002994
   140002a75:	jmp    0x1400029f1
   140002a7a:	nop    WORD PTR [rax+rax*1+0x0]
   140002a80:	lea    edx,[rdi-0x1]
   140002a83:	test   edi,edi
   140002a85:	jne    0x140002997
   140002a8b:	sub    DWORD PTR [rbx+0xc],0x1
   140002a8f:	jmp    0x140002a01
   140002a94:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002a9f:	nop
   140002aa0:	push   rbp
   140002aa1:	push   rsi
   140002aa2:	push   rbx
   140002aa3:	sub    rsp,0x20
   140002aa7:	lea    rbp,[rsp+0x20]
   140002aac:	lea    rax,[rip+0x6a1d]        # 0x1400094d0
   140002ab3:	mov    rbx,rcx
   140002ab6:	test   rcx,rcx
   140002ab9:	mov    rsi,rdx
   140002abc:	movsxd rdx,DWORD PTR [rdx+0x10]
   140002ac0:	cmove  rbx,rax
   140002ac4:	mov    rcx,rbx
   140002ac7:	test   edx,edx
   140002ac9:	js     0x140002ae8
   140002acb:	call   0x1400072e0
   140002ad0:	mov    r8,rsi
   140002ad3:	mov    edx,eax
   140002ad5:	mov    rcx,rbx
   140002ad8:	add    rsp,0x20
   140002adc:	pop    rbx
   140002add:	pop    rsi
   140002ade:	pop    rbp
   140002adf:	jmp    0x140002950
   140002ae4:	nop    DWORD PTR [rax+0x0]
   140002ae8:	call   0x140007ac0
   140002aed:	jmp    0x140002ad0
   140002aef:	nop
   140002af0:	push   rbp
   140002af1:	mov    rbp,rsp
   140002af4:	sub    rsp,0x30
   140002af8:	mov    r10d,DWORD PTR [r8+0x8]
   140002afc:	mov    DWORD PTR [r8+0x10],0xffffffff
   140002b04:	test   ecx,ecx
   140002b06:	jne    0x140002b60
   140002b08:	mov    eax,0x2b
   140002b0d:	test   r10d,0x100
   140002b14:	jne    0x140002b65
   140002b16:	test   r10b,0x40
   140002b1a:	je     0x140002b78
   140002b1c:	mov    eax,0x20
   140002b21:	lea    r9,[rbp-0x3]
   140002b25:	lea    r11,[rbp-0x4]
   140002b29:	mov    BYTE PTR [rbp-0x4],al
   140002b2c:	and    r10d,0x20
   140002b30:	xor    ecx,ecx
   140002b32:	movzx  eax,BYTE PTR [rdx+rcx*1]
   140002b36:	and    eax,0xffffffdf
   140002b39:	or     eax,r10d
   140002b3c:	mov    BYTE PTR [r9+rcx*1],al
   140002b40:	add    rcx,0x1
   140002b44:	cmp    rcx,0x3
   140002b48:	jne    0x140002b32
   140002b4a:	lea    rdx,[r9+0x3]
   140002b4e:	mov    rcx,r11
   140002b51:	sub    edx,r11d
   140002b54:	call   0x140002950
   140002b59:	nop
   140002b5a:	add    rsp,0x30
   140002b5e:	pop    rbp
   140002b5f:	ret
   140002b60:	mov    eax,0x2d
   140002b65:	mov    BYTE PTR [rbp-0x4],al
   140002b68:	lea    r9,[rbp-0x3]
   140002b6c:	lea    r11,[rbp-0x4]
   140002b70:	jmp    0x140002b2c
   140002b72:	nop    WORD PTR [rax+rax*1+0x0]
   140002b78:	lea    r11,[rbp-0x4]
   140002b7c:	mov    r9,r11
   140002b7f:	jmp    0x140002b2c
   140002b81:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002b8c:	nop    DWORD PTR [rax+0x0]
   140002b90:	push   rbp
   140002b91:	push   r15
   140002b93:	push   r14
   140002b95:	push   r13
   140002b97:	push   r12
   140002b99:	push   rdi
   140002b9a:	push   rsi
   140002b9b:	push   rbx
   140002b9c:	sub    rsp,0x38
   140002ba0:	lea    rbp,[rsp+0x30]
   140002ba5:	mov    r13d,ecx
   140002ba8:	mov    rbx,r8
   140002bab:	cmp    ecx,0x6f
   140002bae:	je     0x140002e80
   140002bb4:	mov    r14d,DWORD PTR [r8+0x10]
   140002bb8:	xor    eax,eax
   140002bba:	mov    edi,DWORD PTR [r8+0x8]
   140002bbe:	test   r14d,r14d
   140002bc1:	cmovns eax,r14d
   140002bc5:	add    eax,0x12
   140002bc8:	test   edi,0x1000
   140002bce:	je     0x140002cb8
   140002bd4:	mov    ecx,0x4
   140002bd9:	cmp    WORD PTR [rbx+0x20],0x0
   140002bde:	je     0x140002bf4
   140002be0:	mov    r8d,eax
   140002be3:	mov    r9d,0xaaaaaaab
   140002be9:	imul   r8,r9
   140002bed:	shr    r8,0x21
   140002bf1:	add    eax,r8d
   140002bf4:	mov    r15d,DWORD PTR [rbx+0xc]
   140002bf8:	cmp    r15d,eax
   140002bfb:	cmovge eax,r15d
   140002bff:	cdqe
   140002c01:	add    rax,0xf
   140002c05:	and    rax,0xfffffffffffffff0
   140002c09:	call   0x1400025d0
   140002c0e:	xor    r9d,r9d
   140002c11:	sub    rsp,rax
   140002c14:	cmp    r13d,0x6f
   140002c18:	setne  r9b
   140002c1c:	lea    r12,[rsp+0x20]
   140002c21:	lea    r9d,[r9*8+0x7]
   140002c29:	test   rdx,rdx
   140002c2c:	jne    0x140002cee
   140002c32:	nop    WORD PTR [rax+rax*1+0x0]
   140002c38:	and    edi,0xfffff7ff
   140002c3e:	mov    DWORD PTR [rbx+0x8],edi
   140002c41:	test   r14d,r14d
   140002c44:	jle    0x140002f10
   140002c4a:	lea    edi,[r14-0x1]
   140002c4e:	mov    rsi,r12
   140002c51:	add    edi,0x1
   140002c54:	mov    rcx,rsi
   140002c57:	mov    edx,0x30
   140002c5c:	movsxd rdi,edi
   140002c5f:	mov    r8,rdi
   140002c62:	add    rsi,rdi
   140002c65:	call   0x140007aa0
   140002c6a:	cmp    rsi,r12
   140002c6d:	je     0x140002f13
   140002c73:	mov    rax,rsi
   140002c76:	sub    rax,r12
   140002c79:	mov    edx,eax
   140002c7b:	cmp    eax,r15d
   140002c7e:	jl     0x140002f37
   140002c84:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002c8b:	cmp    r13d,0x6f
   140002c8f:	jne    0x140003034
   140002c95:	cmp    r12,rsi
   140002c98:	jae    0x140002e6e
   140002c9e:	mov    edi,DWORD PTR [rbx+0x8]
   140002ca1:	mov    r13d,0xfffffffe
   140002ca7:	mov    r15d,0xffffffff
   140002cad:	jmp    0x140002de0
   140002cb2:	nop    WORD PTR [rax+rax*1+0x0]
   140002cb8:	mov    r15d,DWORD PTR [rbx+0xc]
   140002cbc:	cmp    r15d,eax
   140002cbf:	cmovge eax,r15d
   140002cc3:	cdqe
   140002cc5:	add    rax,0xf
   140002cc9:	and    rax,0xfffffffffffffff0
   140002ccd:	call   0x1400025d0
   140002cd2:	mov    ecx,0x4
   140002cd7:	mov    r9d,0xf
   140002cdd:	sub    rsp,rax
   140002ce0:	lea    r12,[rsp+0x20]
   140002ce5:	test   rdx,rdx
   140002ce8:	je     0x140002c38
   140002cee:	mov    QWORD PTR [rbp-0x8],r12
   140002cf2:	mov    r10d,r13d
   140002cf5:	mov    rsi,r12
   140002cf8:	and    r10d,0x20
   140002cfc:	nop    DWORD PTR [rax+0x0]
   140002d00:	mov    eax,r9d
   140002d03:	mov    r11,rsi
   140002d06:	add    rsi,0x1
   140002d0a:	and    eax,edx
   140002d0c:	lea    r8d,[rax+0x30]
   140002d10:	add    eax,0x37
   140002d13:	or     eax,r10d
   140002d16:	mov    r12d,r8d
   140002d19:	cmp    r8b,0x39
   140002d1d:	cmovbe eax,r12d
   140002d21:	shr    rdx,cl
   140002d24:	mov    BYTE PTR [rsi-0x1],al
   140002d27:	test   rdx,rdx
   140002d2a:	jne    0x140002d00
   140002d2c:	mov    r12,QWORD PTR [rbp-0x8]
   140002d30:	cmp    rsi,r12
   140002d33:	je     0x140002c38
   140002d39:	test   r14d,r14d
   140002d3c:	jle    0x140002eb0
   140002d42:	mov    rdx,rsi
   140002d45:	mov    eax,r14d
   140002d48:	sub    rdx,r12
   140002d4b:	sub    eax,edx
   140002d4d:	test   eax,eax
   140002d4f:	jg     0x140003020
   140002d55:	cmp    r13d,0x6f
   140002d59:	je     0x140002f88
   140002d5f:	cmp    edx,r15d
   140002d62:	jge    0x140002ff0
   140002d68:	sub    r15d,edx
   140002d6b:	mov    DWORD PTR [rbx+0xc],r15d
   140002d6f:	test   edi,0x800
   140002d75:	jne    0x140002fc0
   140002d7b:	test   r14d,r14d
   140002d7e:	js     0x140003039
   140002d84:	lea    r13d,[r15-0x1]
   140002d88:	test   edi,0x400
   140002d8e:	jne    0x140002fb0
   140002d94:	mov    r15d,r13d
   140002d97:	nop    WORD PTR [rax+rax*1+0x0]
   140002da0:	mov    rdx,rbx
   140002da3:	mov    ecx,0x20
   140002da8:	call   0x140002750
   140002dad:	sub    r15d,0x1
   140002db1:	jae    0x140002da0
   140002db3:	mov    r13d,0xfffffffe
   140002db9:	cmp    r12,rsi
   140002dbc:	jb     0x140002ddd
   140002dbe:	jmp    0x140002e6e
   140002dc3:	nop    DWORD PTR [rax+rax*1+0x0]
   140002dc8:	movsxd rax,DWORD PTR [rbx+0x24]
   140002dcc:	mov    BYTE PTR [rdx+rax*1],cl
   140002dcf:	mov    eax,DWORD PTR [rbx+0x24]
   140002dd2:	add    eax,0x1
   140002dd5:	mov    DWORD PTR [rbx+0x24],eax
   140002dd8:	cmp    r12,rsi
   140002ddb:	jae    0x140002e15
   140002ddd:	mov    edi,DWORD PTR [rbx+0x8]
   140002de0:	sub    rsi,0x1
   140002de4:	test   edi,0x4000
   140002dea:	jne    0x140002df4
   140002dec:	mov    eax,DWORD PTR [rbx+0x24]
   140002def:	cmp    DWORD PTR [rbx+0x28],eax
   140002df2:	jle    0x140002dd2
   140002df4:	and    edi,0x2000
   140002dfa:	movsx  ecx,BYTE PTR [rsi]
   140002dfd:	mov    rdx,QWORD PTR [rbx]
   140002e00:	je     0x140002dc8
   140002e02:	call   0x140007a68
   140002e07:	mov    eax,DWORD PTR [rbx+0x24]
   140002e0a:	add    eax,0x1
   140002e0d:	mov    DWORD PTR [rbx+0x24],eax
   140002e10:	cmp    r12,rsi
   140002e13:	jb     0x140002ddd
   140002e15:	test   r15d,r15d
   140002e18:	jg     0x140002e37
   140002e1a:	jmp    0x140002e6e
   140002e1c:	nop    DWORD PTR [rax+0x0]
   140002e20:	movsxd rax,DWORD PTR [rbx+0x24]
   140002e24:	mov    BYTE PTR [rdx+rax*1],0x20
   140002e28:	mov    eax,DWORD PTR [rbx+0x24]
   140002e2b:	add    eax,0x1
   140002e2e:	mov    DWORD PTR [rbx+0x24],eax
   140002e31:	sub    r13d,0x1
   140002e35:	jb     0x140002e6e
   140002e37:	mov    edi,DWORD PTR [rbx+0x8]
   140002e3a:	test   edi,0x4000
   140002e40:	jne    0x140002e4a
   140002e42:	mov    eax,DWORD PTR [rbx+0x24]
   140002e45:	cmp    DWORD PTR [rbx+0x28],eax
   140002e48:	jle    0x140002e2b
   140002e4a:	and    edi,0x2000
   140002e50:	mov    rdx,QWORD PTR [rbx]
   140002e53:	je     0x140002e20
   140002e55:	mov    ecx,0x20
   140002e5a:	call   0x140007a68
   140002e5f:	mov    eax,DWORD PTR [rbx+0x24]
   140002e62:	add    eax,0x1
   140002e65:	mov    DWORD PTR [rbx+0x24],eax
   140002e68:	sub    r13d,0x1
   140002e6c:	jae    0x140002e37
   140002e6e:	lea    rsp,[rbp+0x8]
   140002e72:	pop    rbx
   140002e73:	pop    rsi
   140002e74:	pop    rdi
   140002e75:	pop    r12
   140002e77:	pop    r13
   140002e79:	pop    r14
   140002e7b:	pop    r15
   140002e7d:	pop    rbp
   140002e7e:	ret
   140002e7f:	nop
   140002e80:	mov    r14d,DWORD PTR [r8+0x10]
   140002e84:	xor    eax,eax
   140002e86:	mov    edi,DWORD PTR [r8+0x8]
   140002e8a:	test   r14d,r14d
   140002e8d:	cmovns eax,r14d
   140002e91:	add    eax,0x18
   140002e94:	test   edi,0x1000
   140002e9a:	je     0x140002ed8
   140002e9c:	mov    ecx,0x3
   140002ea1:	jmp    0x140002bd9
   140002ea6:	cs nop WORD PTR [rax+rax*1+0x0]
   140002eb0:	cmp    r13d,0x6f
   140002eb4:	je     0x140002f88
   140002eba:	mov    rax,rsi
   140002ebd:	sub    rax,r12
   140002ec0:	cmp    eax,r15d
   140002ec3:	jge    0x140002ff0
   140002ec9:	sub    r15d,eax
   140002ecc:	mov    DWORD PTR [rbx+0xc],r15d
   140002ed0:	jmp    0x140002d6f
   140002ed5:	nop    DWORD PTR [rax]
   140002ed8:	mov    r15d,DWORD PTR [rbx+0xc]
   140002edc:	cmp    r15d,eax
   140002edf:	cmovge eax,r15d
   140002ee3:	cdqe
   140002ee5:	add    rax,0xf
   140002ee9:	and    rax,0xfffffffffffffff0
   140002eed:	call   0x1400025d0
   140002ef2:	mov    ecx,0x3
   140002ef7:	mov    r9d,0x7
   140002efd:	sub    rsp,rax
   140002f00:	lea    r12,[rsp+0x20]
   140002f05:	jmp    0x140002ce5
   140002f0a:	nop    WORD PTR [rax+rax*1+0x0]
   140002f10:	mov    rsi,r12
   140002f13:	test   r14d,r14d
   140002f16:	je     0x140002c73
   140002f1c:	lea    rdx,[rsi+0x1]
   140002f20:	mov    BYTE PTR [rsi],0x30
   140002f23:	mov    rax,rdx
   140002f26:	mov    rsi,rdx
   140002f29:	sub    rax,r12
   140002f2c:	mov    edx,eax
   140002f2e:	cmp    eax,r15d
   140002f31:	jge    0x140002c84
   140002f37:	mov    edi,DWORD PTR [rbx+0x8]
   140002f3a:	sub    r15d,edx
   140002f3d:	mov    DWORD PTR [rbx+0xc],r15d
   140002f41:	cmp    r13d,0x6f
   140002f45:	jne    0x140002d6f
   140002f4b:	test   r14d,r14d
   140002f4e:	jns    0x140002d84
   140002f54:	mov    eax,edi
   140002f56:	and    eax,0x600
   140002f5b:	cmp    eax,0x200
   140002f60:	jne    0x140002d84
   140002f66:	movsxd r15,r15d
   140002f69:	mov    edx,0x30
   140002f6e:	mov    rcx,rsi
   140002f71:	mov    r8,r15
   140002f74:	call   0x140007aa0
   140002f79:	lea    rax,[rsi+r15*1]
   140002f7d:	mov    r15d,0xffffffff
   140002f83:	jmp    0x140002fd8
   140002f85:	nop    DWORD PTR [rax]
   140002f88:	test   edi,0x800
   140002f8e:	jne    0x140003028
   140002f94:	mov    rax,rsi
   140002f97:	sub    rax,r12
   140002f9a:	mov    edx,eax
   140002f9c:	cmp    r15d,eax
   140002f9f:	jg     0x140002f3a
   140002fa1:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002fa8:	jmp    0x140002c95
   140002fad:	nop    DWORD PTR [rax]
   140002fb0:	cmp    r12,rsi
   140002fb3:	jb     0x140002de0
   140002fb9:	jmp    0x140002e3a
   140002fbe:	xchg   ax,ax
   140002fc0:	sub    r15d,0x2
   140002fc4:	test   r15d,r15d
   140002fc7:	jg     0x140003084
   140002fcd:	mov    BYTE PTR [rsi],r13b
   140002fd0:	lea    rax,[rsi+0x2]
   140002fd4:	mov    BYTE PTR [rsi+0x1],0x30
   140002fd8:	cmp    r12,rax
   140002fdb:	jae    0x140002e6e
   140002fe1:	mov    edi,DWORD PTR [rbx+0x8]
   140002fe4:	lea    r13d,[r15-0x1]
   140002fe8:	mov    rsi,rax
   140002feb:	jmp    0x140002de0
   140002ff0:	mov    DWORD PTR [rbx+0xc],0xffffffff
   140002ff7:	and    edi,0x800
   140002ffd:	mov    rax,rsi
   140003000:	mov    r15d,0xffffffff
   140003006:	je     0x140002fd8
   140003008:	mov    BYTE PTR [rsi],r13b
   14000300b:	lea    rax,[rsi+0x2]
   14000300f:	mov    r15d,0xffffffff
   140003015:	mov    BYTE PTR [rsi+0x1],0x30
   140003019:	jmp    0x140002fd8
   14000301b:	nop    DWORD PTR [rax+rax*1+0x0]
   140003020:	lea    edi,[rax-0x1]
   140003023:	jmp    0x140002c51
   140003028:	mov    BYTE PTR [rsi],0x30
   14000302b:	lea    rsi,[r11+0x2]
   14000302f:	jmp    0x140002c6a
   140003034:	mov    edi,DWORD PTR [rbx+0x8]
   140003037:	jmp    0x140002ff7
   140003039:	mov    eax,edi
   14000303b:	and    eax,0x600
   140003040:	cmp    eax,0x200
   140003045:	jne    0x140002d84
   14000304b:	movsxd r15,r15d
   14000304e:	mov    edx,0x30
   140003053:	mov    rcx,rsi
   140003056:	mov    r8,r15
   140003059:	call   0x140007aa0
   14000305e:	and    edi,0x800
   140003064:	lea    rax,[rsi+r15*1]
   140003068:	je     0x140002f7d
   14000306e:	mov    BYTE PTR [rax],r13b
   140003071:	mov    r15d,0xffffffff
   140003077:	add    rax,0x2
   14000307b:	mov    BYTE PTR [rax-0x1],0x30
   14000307f:	jmp    0x140002fd8
   140003084:	test   r14d,r14d
   140003087:	js     0x140003099
   140003089:	mov    BYTE PTR [rsi],r13b
   14000308c:	add    rsi,0x2
   140003090:	mov    BYTE PTR [rsi-0x1],0x30
   140003094:	jmp    0x140002d84
   140003099:	mov    eax,edi
   14000309b:	and    eax,0x600
   1400030a0:	cmp    eax,0x200
   1400030a5:	jne    0x140003089
   1400030a7:	jmp    0x14000304b
   1400030a9:	nop    DWORD PTR [rax+0x0]
   1400030b0:	push   rbp
   1400030b1:	push   r15
   1400030b3:	push   r14
   1400030b5:	push   r13
   1400030b7:	push   r12
   1400030b9:	push   rdi
   1400030ba:	push   rsi
   1400030bb:	push   rbx
   1400030bc:	sub    rsp,0x28
   1400030c0:	lea    rbp,[rsp+0x20]
   1400030c5:	xor    eax,eax
   1400030c7:	mov    r14d,DWORD PTR [rdx+0x10]
   1400030cb:	mov    edi,DWORD PTR [rdx+0x8]
   1400030ce:	test   r14d,r14d
   1400030d1:	cmovns eax,r14d
   1400030d5:	mov    rbx,rdx
   1400030d8:	add    eax,0x17
   1400030db:	test   edi,0x1000
   1400030e1:	je     0x1400030ee
   1400030e3:	cmp    WORD PTR [rdx+0x20],0x0
   1400030e8:	jne    0x140003350
   1400030ee:	mov    esi,DWORD PTR [rbx+0xc]
   1400030f1:	cmp    esi,eax
   1400030f3:	cmovge eax,esi
   1400030f6:	cdqe
   1400030f8:	add    rax,0xf
   1400030fc:	and    rax,0xfffffffffffffff0
   140003100:	call   0x1400025d0
   140003105:	sub    rsp,rax
   140003108:	lea    r12,[rsp+0x20]
   14000310d:	test   dil,0x80
   140003111:	je     0x140003123
   140003113:	test   rcx,rcx
   140003116:	js     0x140003390
   14000311c:	and    dil,0x7f
   140003120:	mov    DWORD PTR [rbx+0x8],edi
   140003123:	test   rcx,rcx
   140003126:	je     0x140003440
   14000312c:	movabs r11,0x8000000000000003
   140003136:	mov    r10d,edi
   140003139:	mov    r8,r12
   14000313c:	movabs r9,0xcccccccccccccccd
   140003146:	and    r10d,0x1000
   14000314d:	nop    DWORD PTR [rax]
   140003150:	cmp    r12,r8
   140003153:	je     0x140003180
   140003155:	test   r10d,r10d
   140003158:	je     0x140003180
   14000315a:	cmp    WORD PTR [rbx+0x20],0x0
   14000315f:	je     0x140003180
   140003161:	mov    rax,r8
   140003164:	sub    rax,r12
   140003167:	and    rax,r11
   14000316a:	cmp    rax,0x3
   14000316e:	jne    0x140003180
   140003170:	mov    BYTE PTR [r8],0x2c
   140003174:	add    r8,0x1
   140003178:	nop    DWORD PTR [rax+rax*1+0x0]
   140003180:	mov    rax,rcx
   140003183:	lea    r13,[r8+0x1]
   140003187:	mul    r9
   14000318a:	mov    rax,rcx
   14000318d:	shr    rdx,0x3
   140003191:	lea    r15,[rdx+rdx*4]
   140003195:	add    r15,r15
   140003198:	sub    rax,r15
   14000319b:	add    eax,0x30
   14000319e:	mov    BYTE PTR [r8],al
   1400031a1:	cmp    rcx,0x9
   1400031a5:	jbe    0x1400031b0
   1400031a7:	mov    rcx,rdx
   1400031aa:	mov    r8,r13
   1400031ad:	jmp    0x140003150
   1400031af:	nop
   1400031b0:	test   r14d,r14d
   1400031b3:	jle    0x1400031e0
   1400031b5:	mov    rax,r13
   1400031b8:	mov    r8d,r14d
   1400031bb:	sub    rax,r12
   1400031be:	sub    r8d,eax
   1400031c1:	test   r8d,r8d
   1400031c4:	jle    0x140003370
   1400031ca:	movsxd r15,r8d
   1400031cd:	mov    rcx,r13
   1400031d0:	mov    edx,0x30
   1400031d5:	mov    r8,r15
   1400031d8:	add    r13,r15
   1400031db:	call   0x140007aa0
   1400031e0:	cmp    r12,r13
   1400031e3:	sete   al
   1400031e6:	test   r14d,r14d
   1400031e9:	je     0x1400031f3
   1400031eb:	test   al,al
   1400031ed:	jne    0x140003432
   1400031f3:	test   esi,esi
   1400031f5:	jle    0x140003230
   1400031f7:	mov    rax,r13
   1400031fa:	sub    rax,r12
   1400031fd:	sub    esi,eax
   1400031ff:	mov    DWORD PTR [rbx+0xc],esi
   140003202:	test   esi,esi
   140003204:	jle    0x140003230
   140003206:	test   edi,0x1c0
   14000320c:	jne    0x1400033a0
   140003212:	test   r14d,r14d
   140003215:	js     0x1400033af
   14000321b:	test   edi,0x400
   140003221:	je     0x1400033f8
   140003227:	nop    WORD PTR [rax+rax*1+0x0]
   140003230:	test   dil,0x80
   140003234:	je     0x140003310
   14000323a:	mov    BYTE PTR [r13+0x0],0x2d
   14000323f:	lea    rsi,[r13+0x1]
   140003243:	cmp    r12,rsi
   140003246:	jb     0x140003268
   140003248:	jmp    0x14000329d
   14000324a:	nop    WORD PTR [rax+rax*1+0x0]
   140003250:	movsxd rax,DWORD PTR [rbx+0x24]
   140003254:	mov    BYTE PTR [rdx+rax*1],cl
   140003257:	mov    eax,DWORD PTR [rbx+0x24]
   14000325a:	add    eax,0x1
   14000325d:	mov    DWORD PTR [rbx+0x24],eax
   140003260:	cmp    r12,rsi
   140003263:	je     0x14000329d
   140003265:	mov    edi,DWORD PTR [rbx+0x8]
   140003268:	sub    rsi,0x1
   14000326c:	test   edi,0x4000
   140003272:	jne    0x14000327c
   140003274:	mov    eax,DWORD PTR [rbx+0x24]
   140003277:	cmp    DWORD PTR [rbx+0x28],eax
   14000327a:	jle    0x14000325a
   14000327c:	and    edi,0x2000
   140003282:	movsx  ecx,BYTE PTR [rsi]
   140003285:	mov    rdx,QWORD PTR [rbx]
   140003288:	je     0x140003250
   14000328a:	call   0x140007a68
   14000328f:	mov    eax,DWORD PTR [rbx+0x24]
   140003292:	add    eax,0x1
   140003295:	mov    DWORD PTR [rbx+0x24],eax
   140003298:	cmp    r12,rsi
   14000329b:	jne    0x140003265
   14000329d:	mov    eax,DWORD PTR [rbx+0xc]
   1400032a0:	jmp    0x1400032bc
   1400032a2:	nop    WORD PTR [rax+rax*1+0x0]
   1400032a8:	movsxd rax,DWORD PTR [rbx+0x24]
   1400032ac:	mov    BYTE PTR [rdx+rax*1],0x20
   1400032b0:	mov    edx,DWORD PTR [rbx+0x24]
   1400032b3:	mov    eax,DWORD PTR [rbx+0xc]
   1400032b6:	add    edx,0x1
   1400032b9:	mov    DWORD PTR [rbx+0x24],edx
   1400032bc:	mov    edx,eax
   1400032be:	sub    eax,0x1
   1400032c1:	mov    DWORD PTR [rbx+0xc],eax
   1400032c4:	test   edx,edx
   1400032c6:	jle    0x1400032f8
   1400032c8:	mov    ecx,DWORD PTR [rbx+0x8]
   1400032cb:	test   ch,0x40
   1400032ce:	jne    0x1400032d8
   1400032d0:	mov    edx,DWORD PTR [rbx+0x24]
   1400032d3:	cmp    DWORD PTR [rbx+0x28],edx
   1400032d6:	jle    0x1400032b6
   1400032d8:	mov    rdx,QWORD PTR [rbx]
   1400032db:	and    ch,0x20
   1400032de:	je     0x1400032a8
   1400032e0:	mov    ecx,0x20
   1400032e5:	call   0x140007a68
   1400032ea:	mov    edx,DWORD PTR [rbx+0x24]
   1400032ed:	mov    eax,DWORD PTR [rbx+0xc]
   1400032f0:	jmp    0x1400032b6
   1400032f2:	nop    WORD PTR [rax+rax*1+0x0]
   1400032f8:	lea    rsp,[rbp+0x8]
   1400032fc:	pop    rbx
   1400032fd:	pop    rsi
   1400032fe:	pop    rdi
   1400032ff:	pop    r12
   140003301:	pop    r13
   140003303:	pop    r14
   140003305:	pop    r15
   140003307:	pop    rbp
   140003308:	ret
   140003309:	nop    DWORD PTR [rax+0x0]
   140003310:	test   edi,0x100
   140003316:	je     0x140003330
   140003318:	mov    BYTE PTR [r13+0x0],0x2b
   14000331d:	lea    rsi,[r13+0x1]
   140003321:	jmp    0x140003243
   140003326:	cs nop WORD PTR [rax+rax*1+0x0]
   140003330:	mov    rsi,r13
   140003333:	test   dil,0x40
   140003337:	je     0x140003243
   14000333d:	mov    BYTE PTR [r13+0x0],0x20
   140003342:	add    rsi,0x1
   140003346:	jmp    0x140003243
   14000334b:	nop    DWORD PTR [rax+rax*1+0x0]
   140003350:	mov    edx,eax
   140003352:	mov    r8d,0xaaaaaaab
   140003358:	imul   rdx,r8
   14000335c:	shr    rdx,0x21
   140003360:	add    eax,edx
   140003362:	jmp    0x1400030ee
   140003367:	nop    WORD PTR [rax+rax*1+0x0]
   140003370:	cmp    r12,r13
   140003373:	jne    0x1400031f3
   140003379:	mov    rax,r12
   14000337c:	mov    BYTE PTR [rax],0x30
   14000337f:	lea    r13,[rax+0x1]
   140003383:	jmp    0x1400031f3
   140003388:	nop    DWORD PTR [rax+rax*1+0x0]
   140003390:	neg    rcx
   140003393:	jmp    0x14000312c
   140003398:	nop    DWORD PTR [rax+rax*1+0x0]
   1400033a0:	sub    esi,0x1
   1400033a3:	mov    DWORD PTR [rbx+0xc],esi
   1400033a6:	test   r14d,r14d
   1400033a9:	jns    0x14000321b
   1400033af:	mov    eax,edi
   1400033b1:	and    eax,0x600
   1400033b6:	cmp    eax,0x200
   1400033bb:	jne    0x14000321b
   1400033c1:	mov    eax,DWORD PTR [rbx+0xc]
   1400033c4:	lea    edx,[rax-0x1]
   1400033c7:	mov    DWORD PTR [rbx+0xc],edx
   1400033ca:	test   eax,eax
   1400033cc:	jle    0x140003230
   1400033d2:	movsxd rsi,eax
   1400033d5:	mov    rcx,r13
   1400033d8:	mov    edx,0x30
   1400033dd:	mov    r8,rsi
   1400033e0:	add    r13,rsi
   1400033e3:	call   0x140007aa0
   1400033e8:	mov    DWORD PTR [rbx+0xc],0xffffffff
   1400033ef:	jmp    0x140003230
   1400033f4:	nop    DWORD PTR [rax+0x0]
   1400033f8:	mov    eax,DWORD PTR [rbx+0xc]
   1400033fb:	lea    edx,[rax-0x1]
   1400033fe:	mov    DWORD PTR [rbx+0xc],edx
   140003401:	test   eax,eax
   140003403:	jle    0x140003230
   140003409:	nop    DWORD PTR [rax+0x0]
   140003410:	mov    rdx,rbx
   140003413:	mov    ecx,0x20
   140003418:	call   0x140002750
   14000341d:	mov    eax,DWORD PTR [rbx+0xc]
   140003420:	lea    edx,[rax-0x1]
   140003423:	mov    DWORD PTR [rbx+0xc],edx
   140003426:	test   eax,eax
   140003428:	jg     0x140003410
   14000342a:	mov    edi,DWORD PTR [rbx+0x8]
   14000342d:	jmp    0x140003230
   140003432:	mov    rax,r13
   140003435:	jmp    0x14000337c
   14000343a:	nop    WORD PTR [rax+rax*1+0x0]
   140003440:	mov    r13,r12
   140003443:	mov    r8d,r14d
   140003446:	mov    eax,0x1
   14000344b:	test   r14d,r14d
   14000344e:	jg     0x1400031ca
   140003454:	jmp    0x1400031e6
   140003459:	nop    DWORD PTR [rax+0x0]
   140003460:	push   rbp
   140003461:	push   r12
   140003463:	push   rdi
   140003464:	push   rsi
   140003465:	push   rbx
   140003466:	sub    rsp,0x30
   14000346a:	lea    rbp,[rsp+0x30]
   14000346f:	cmp    DWORD PTR [rcx+0x14],0xfffffffd
   140003473:	mov    rbx,rcx
   140003476:	je     0x140003550
   14000347c:	movzx  edx,WORD PTR [rcx+0x18]
   140003480:	test   dx,dx
   140003483:	je     0x140003530
   140003489:	movsxd rax,DWORD PTR [rbx+0x14]
   14000348d:	mov    rdi,rsp
   140003490:	add    rax,0xf
   140003494:	and    rax,0xfffffffffffffff0
   140003498:	call   0x1400025d0
   14000349d:	sub    rsp,rax
   1400034a0:	lea    r8,[rbp-0x8]
   1400034a4:	mov    QWORD PTR [rbp-0x8],0x0
   1400034ac:	lea    rsi,[rsp+0x20]
   1400034b1:	mov    rcx,rsi
   1400034b4:	call   0x140007520
   1400034b9:	test   eax,eax
   1400034bb:	jle    0x140003590
   1400034c1:	sub    eax,0x1
   1400034c4:	lea    r12,[rsi+rax*1+0x1]
   1400034c9:	jmp    0x1400034e5
   1400034cb:	nop    DWORD PTR [rax+rax*1+0x0]
   1400034d0:	movsxd rdx,DWORD PTR [rbx+0x24]
   1400034d4:	mov    BYTE PTR [rax+rdx*1],cl
   1400034d7:	mov    eax,DWORD PTR [rbx+0x24]
   1400034da:	add    eax,0x1
   1400034dd:	mov    DWORD PTR [rbx+0x24],eax
   1400034e0:	cmp    r12,rsi
   1400034e3:	je     0x14000351b
   1400034e5:	mov    edx,DWORD PTR [rbx+0x8]
   1400034e8:	add    rsi,0x1
   1400034ec:	test   dh,0x40
   1400034ef:	jne    0x1400034f9
   1400034f1:	mov    eax,DWORD PTR [rbx+0x24]
   1400034f4:	cmp    DWORD PTR [rbx+0x28],eax
   1400034f7:	jle    0x1400034da
   1400034f9:	movsx  ecx,BYTE PTR [rsi-0x1]
   1400034fd:	mov    rax,QWORD PTR [rbx]
   140003500:	and    dh,0x20
   140003503:	je     0x1400034d0
   140003505:	mov    rdx,rax
   140003508:	call   0x140007a68
   14000350d:	mov    eax,DWORD PTR [rbx+0x24]
   140003510:	add    eax,0x1
   140003513:	mov    DWORD PTR [rbx+0x24],eax
   140003516:	cmp    r12,rsi
   140003519:	jne    0x1400034e5
   14000351b:	mov    rsp,rdi
   14000351e:	mov    rsp,rbp
   140003521:	pop    rbx
   140003522:	pop    rsi
   140003523:	pop    rdi
   140003524:	pop    r12
   140003526:	pop    rbp
   140003527:	ret
   140003528:	nop    DWORD PTR [rax+rax*1+0x0]
   140003530:	mov    rdx,rbx
   140003533:	mov    ecx,0x2e
   140003538:	call   0x140002750
   14000353d:	nop
   14000353e:	mov    rsp,rbp
   140003541:	pop    rbx
   140003542:	pop    rsi
   140003543:	pop    rdi
   140003544:	pop    r12
   140003546:	pop    rbp
   140003547:	ret
   140003548:	nop    DWORD PTR [rax+rax*1+0x0]
   140003550:	mov    QWORD PTR [rbp-0x8],0x0
   140003558:	lea    rsi,[rbp-0x8]
   14000355c:	call   0x140007a88
   140003561:	lea    rcx,[rbp-0xa]
   140003565:	mov    r9,rsi
   140003568:	mov    r8d,0x10
   14000356e:	mov    rdx,QWORD PTR [rax]
   140003571:	call   0x1400077d0
   140003576:	test   eax,eax
   140003578:	jle    0x1400035a8
   14000357a:	movzx  edx,WORD PTR [rbp-0xa]
   14000357e:	mov    WORD PTR [rbx+0x18],dx
   140003582:	mov    DWORD PTR [rbx+0x14],eax
   140003585:	jmp    0x140003480
   14000358a:	nop    WORD PTR [rax+rax*1+0x0]
   140003590:	mov    rdx,rbx
   140003593:	mov    ecx,0x2e
   140003598:	call   0x140002750
   14000359d:	mov    rsp,rdi
   1400035a0:	jmp    0x14000351e
   1400035a5:	nop    DWORD PTR [rax]
   1400035a8:	movzx  edx,WORD PTR [rbx+0x18]
   1400035ac:	jmp    0x140003582
   1400035ae:	xchg   ax,ax
   1400035b0:	push   rbp
   1400035b1:	push   r12
   1400035b3:	push   rdi
   1400035b4:	push   rsi
   1400035b5:	push   rbx
   1400035b6:	sub    rsp,0x20
   1400035ba:	lea    rbp,[rsp+0x20]
   1400035bf:	mov    eax,DWORD PTR [r9+0xc]
   1400035c3:	mov    r12d,ecx
   1400035c6:	mov    rdi,rdx
   1400035c9:	mov    esi,r8d
   1400035cc:	mov    rbx,r9
   1400035cf:	test   r8d,r8d
   1400035d2:	jle    0x140003720
   1400035d8:	cmp    r8d,eax
   1400035db:	jg     0x140003640
   1400035dd:	mov    edx,DWORD PTR [r9+0x10]
   1400035e1:	sub    eax,r8d
   1400035e4:	cmp    eax,edx
   1400035e6:	jle    0x1400038f0
   1400035ec:	sub    eax,edx
   1400035ee:	mov    DWORD PTR [rbx+0xc],eax
   1400035f1:	test   edx,edx
   1400035f3:	jle    0x140003920
   1400035f9:	sub    eax,0x1
   1400035fc:	mov    DWORD PTR [rbx+0xc],eax
   1400035ff:	test   esi,esi
   140003601:	jle    0x140003610
   140003603:	test   BYTE PTR [rbx+0x9],0x10
   140003607:	jne    0x140003907
   14000360d:	nop    DWORD PTR [rax]
   140003610:	test   eax,eax
   140003612:	jle    0x140003653
   140003614:	test   r12d,r12d
   140003617:	jne    0x1400037f8
   14000361d:	mov    edx,DWORD PTR [rbx+0x8]
   140003620:	test   edx,0x1c0
   140003626:	je     0x1400038d8
   14000362c:	lea    ecx,[rax-0x1]
   14000362f:	mov    DWORD PTR [rbx+0xc],ecx
   140003632:	test   ecx,ecx
   140003634:	je     0x14000365f
   140003636:	test   dh,0x6
   140003639:	jne    0x14000365f
   14000363b:	jmp    0x140003813
   140003640:	mov    DWORD PTR [r9+0xc],0xffffffff
   140003648:	test   BYTE PTR [r9+0x9],0x10
   14000364d:	jne    0x140003880
   140003653:	test   r12d,r12d
   140003656:	jne    0x140003750
   14000365c:	mov    edx,DWORD PTR [rbx+0x8]
   14000365f:	test   dh,0x1
   140003662:	jne    0x140003840
   140003668:	and    edx,0x40
   14000366b:	je     0x140003680
   14000366d:	mov    rdx,rbx
   140003670:	mov    ecx,0x20
   140003675:	call   0x140002750
   14000367a:	nop    WORD PTR [rax+rax*1+0x0]
   140003680:	mov    eax,DWORD PTR [rbx+0xc]
   140003683:	test   eax,eax
   140003685:	jle    0x14000369c
   140003687:	mov    edx,DWORD PTR [rbx+0x8]
   14000368a:	and    edx,0x600
   140003690:	cmp    edx,0x200
   140003696:	je     0x140003858
   14000369c:	test   esi,esi
   14000369e:	jle    0x1400037b0
   1400036a4:	nop    DWORD PTR [rax+0x0]
   1400036a8:	movzx  eax,BYTE PTR [rdi]
   1400036ab:	mov    ecx,0x30
   1400036b0:	test   al,al
   1400036b2:	je     0x1400036bb
   1400036b4:	add    rdi,0x1
   1400036b8:	movsx  ecx,al
   1400036bb:	mov    rdx,rbx
   1400036be:	call   0x140002750
   1400036c3:	sub    esi,0x1
   1400036c6:	je     0x1400036f8
   1400036c8:	test   BYTE PTR [rbx+0x9],0x10
   1400036cc:	je     0x1400036a8
   1400036ce:	cmp    WORD PTR [rbx+0x20],0x0
   1400036d3:	je     0x1400036a8
   1400036d5:	imul   eax,esi,0xaaaaaaab
   1400036db:	cmp    eax,0x55555555
   1400036e0:	ja     0x1400036a8
   1400036e2:	lea    rcx,[rbx+0x20]
   1400036e6:	mov    r8,rbx
   1400036e9:	mov    edx,0x1
   1400036ee:	call   0x1400027b0
   1400036f3:	jmp    0x1400036a8
   1400036f5:	nop    DWORD PTR [rax]
   1400036f8:	mov    eax,DWORD PTR [rbx+0x10]
   1400036fb:	test   eax,eax
   1400036fd:	jg     0x140003768
   1400036ff:	test   BYTE PTR [rbx+0x9],0x8
   140003703:	jne    0x1400037c8
   140003709:	sub    eax,0x1
   14000370c:	mov    DWORD PTR [rbx+0x10],eax
   14000370f:	add    rsp,0x20
   140003713:	pop    rbx
   140003714:	pop    rsi
   140003715:	pop    rdi
   140003716:	pop    r12
   140003718:	pop    rbp
   140003719:	ret
   14000371a:	nop    WORD PTR [rax+rax*1+0x0]
   140003720:	test   eax,eax
   140003722:	jle    0x140003940
   140003728:	mov    edx,DWORD PTR [r9+0x10]
   14000372c:	sub    eax,0x1
   14000372f:	cmp    eax,edx
   140003731:	jg     0x1400035ec
   140003737:	mov    DWORD PTR [rbx+0xc],0xffffffff
   14000373e:	test   r12d,r12d
   140003741:	je     0x14000365c
   140003747:	nop    WORD PTR [rax+rax*1+0x0]
   140003750:	mov    rdx,rbx
   140003753:	mov    ecx,0x2d
   140003758:	call   0x140002750
   14000375d:	jmp    0x140003680
   140003762:	nop    WORD PTR [rax+rax*1+0x0]
   140003768:	mov    rcx,rbx
   14000376b:	call   0x140003460
   140003770:	jmp    0x140003793
   140003772:	nop    WORD PTR [rax+rax*1+0x0]
   140003778:	movzx  eax,BYTE PTR [rdi]
   14000377b:	mov    ecx,0x30
   140003780:	test   al,al
   140003782:	je     0x14000378b
   140003784:	add    rdi,0x1
   140003788:	movsx  ecx,al
   14000378b:	mov    rdx,rbx
   14000378e:	call   0x140002750
   140003793:	mov    eax,DWORD PTR [rbx+0x10]
   140003796:	lea    edx,[rax-0x1]
   140003799:	mov    DWORD PTR [rbx+0x10],edx
   14000379c:	test   eax,eax
   14000379e:	jg     0x140003778
   1400037a0:	add    rsp,0x20
   1400037a4:	pop    rbx
   1400037a5:	pop    rsi
   1400037a6:	pop    rdi
   1400037a7:	pop    r12
   1400037a9:	pop    rbp
   1400037aa:	ret
   1400037ab:	nop    DWORD PTR [rax+rax*1+0x0]
   1400037b0:	mov    rdx,rbx
   1400037b3:	mov    ecx,0x30
   1400037b8:	call   0x140002750
   1400037bd:	mov    eax,DWORD PTR [rbx+0x10]
   1400037c0:	test   eax,eax
   1400037c2:	jle    0x14000396f
   1400037c8:	mov    rcx,rbx
   1400037cb:	call   0x140003460
   1400037d0:	test   esi,esi
   1400037d2:	je     0x140003793
   1400037d4:	mov    eax,DWORD PTR [rbx+0x10]
   1400037d7:	add    eax,esi
   1400037d9:	mov    DWORD PTR [rbx+0x10],eax
   1400037dc:	nop    DWORD PTR [rax+0x0]
   1400037e0:	mov    rdx,rbx
   1400037e3:	mov    ecx,0x30
   1400037e8:	call   0x140002750
   1400037ed:	add    esi,0x1
   1400037f0:	jne    0x1400037e0
   1400037f2:	jmp    0x140003793
   1400037f4:	nop    DWORD PTR [rax+0x0]
   1400037f8:	lea    edx,[rax-0x1]
   1400037fb:	mov    DWORD PTR [rbx+0xc],edx
   1400037fe:	test   edx,edx
   140003800:	je     0x140003750
   140003806:	test   DWORD PTR [rbx+0x8],0x600
   14000380d:	jne    0x140003750
   140003813:	sub    eax,0x2
   140003816:	mov    DWORD PTR [rbx+0xc],eax
   140003819:	nop    DWORD PTR [rax+0x0]
   140003820:	mov    rdx,rbx
   140003823:	mov    ecx,0x20
   140003828:	call   0x140002750
   14000382d:	mov    eax,DWORD PTR [rbx+0xc]
   140003830:	lea    edx,[rax-0x1]
   140003833:	mov    DWORD PTR [rbx+0xc],edx
   140003836:	test   eax,eax
   140003838:	jg     0x140003820
   14000383a:	jmp    0x140003653
   14000383f:	nop
   140003840:	mov    rdx,rbx
   140003843:	mov    ecx,0x2b
   140003848:	call   0x140002750
   14000384d:	jmp    0x140003680
   140003852:	nop    WORD PTR [rax+rax*1+0x0]
   140003858:	sub    eax,0x1
   14000385b:	mov    DWORD PTR [rbx+0xc],eax
   14000385e:	xchg   ax,ax
   140003860:	mov    rdx,rbx
   140003863:	mov    ecx,0x30
   140003868:	call   0x140002750
   14000386d:	mov    eax,DWORD PTR [rbx+0xc]
   140003870:	lea    edx,[rax-0x1]
   140003873:	mov    DWORD PTR [rbx+0xc],edx
   140003876:	test   eax,eax
   140003878:	jg     0x140003860
   14000387a:	jmp    0x14000369c
   14000387f:	nop
   140003880:	cmp    WORD PTR [r9+0x20],0x0
   140003886:	je     0x140003653
   14000388c:	mov    eax,0xffffffff
   140003891:	mov    edx,0xaaaaaaab
   140003896:	lea    r8d,[rsi+0x2]
   14000389a:	imul   r8,rdx
   14000389e:	mov    edx,eax
   1400038a0:	shr    r8,0x21
   1400038a4:	lea    ecx,[r8-0x1]
   1400038a8:	sub    ecx,eax
   1400038aa:	cmp    r8d,0x1
   1400038ae:	jne    0x1400038c8
   1400038b0:	jmp    0x140003610
   1400038b5:	nop    DWORD PTR [rax]
   1400038b8:	sub    edx,0x1
   1400038bb:	mov    eax,ecx
   1400038bd:	add    eax,edx
   1400038bf:	mov    DWORD PTR [rbx+0xc],edx
   1400038c2:	je     0x140003968
   1400038c8:	test   edx,edx
   1400038ca:	jg     0x1400038b8
   1400038cc:	jmp    0x140003653
   1400038d1:	nop    DWORD PTR [rax+0x0]
   1400038d8:	and    dh,0x6
   1400038db:	jne    0x140003680
   1400038e1:	sub    eax,0x1
   1400038e4:	jmp    0x140003816
   1400038e9:	nop    DWORD PTR [rax+0x0]
   1400038f0:	mov    DWORD PTR [r9+0xc],0xffffffff
   1400038f8:	mov    eax,0xffffffff
   1400038fd:	test   BYTE PTR [rbx+0x9],0x10
   140003901:	je     0x140003610
   140003907:	cmp    WORD PTR [rbx+0x20],0x0
   14000390c:	je     0x140003610
   140003912:	jmp    0x140003891
   140003917:	nop    WORD PTR [rax+rax*1+0x0]
   140003920:	mov    edx,DWORD PTR [rbx+0x8]
   140003923:	test   dh,0x8
   140003926:	jne    0x1400035f9
   14000392c:	test   esi,esi
   14000392e:	jle    0x140003614
   140003934:	and    dh,0x10
   140003937:	jne    0x140003907
   140003939:	jmp    0x140003614
   14000393e:	xchg   ax,ax
   140003940:	jne    0x140003737
   140003946:	mov    eax,DWORD PTR [r9+0x10]
   14000394a:	test   eax,eax
   14000394c:	jns    0x140003737
   140003952:	neg    eax
   140003954:	mov    DWORD PTR [r9+0xc],eax
   140003958:	test   BYTE PTR [r9+0x9],0x8
   14000395d:	jne    0x1400035f9
   140003963:	jmp    0x140003614
   140003968:	mov    eax,edx
   14000396a:	jmp    0x140003610
   14000396f:	test   BYTE PTR [rbx+0x9],0x8
   140003973:	jne    0x1400037c8
   140003979:	test   esi,esi
   14000397b:	jne    0x1400037d7
   140003981:	jmp    0x140003709
   140003986:	cs nop WORD PTR [rax+rax*1+0x0]
   140003990:	push   rbp
   140003991:	push   rdi
   140003992:	push   rsi
   140003993:	push   rbx
   140003994:	sub    rsp,0x28
   140003998:	lea    rbp,[rsp+0x20]
   14000399d:	mov    r10d,0x1
   1400039a3:	sub    r8d,0x1
   1400039a7:	mov    r11d,ecx
   1400039aa:	mov    rbx,r9
   1400039ad:	movsxd rsi,r8d
   1400039b0:	sar    r8d,0x1f
   1400039b4:	imul   rcx,rsi,0x66666667
   1400039bb:	sar    rcx,0x22
   1400039bf:	sub    ecx,r8d
   1400039c2:	je     0x1400039e3
   1400039c4:	nop    DWORD PTR [rax+0x0]
   1400039c8:	movsxd rax,ecx
   1400039cb:	sar    ecx,0x1f
   1400039ce:	add    r10d,0x1
   1400039d2:	imul   rax,rax,0x66666667
   1400039d9:	sar    rax,0x22
   1400039dd:	sub    eax,ecx
   1400039df:	mov    ecx,eax
   1400039e1:	jne    0x1400039c8
   1400039e3:	mov    eax,DWORD PTR [rbx+0x2c]
   1400039e6:	cmp    eax,0xffffffff
   1400039e9:	jne    0x1400039f7
   1400039eb:	mov    DWORD PTR [rbx+0x2c],0x2
   1400039f2:	mov    eax,0x2
   1400039f7:	cmp    r10d,eax
   1400039fa:	mov    r8d,DWORD PTR [rbx+0xc]
   1400039fe:	mov    r9,rbx
   140003a01:	cmovge eax,r10d
   140003a05:	lea    ecx,[rax+0x2]
   140003a08:	mov    edi,eax
   140003a0a:	mov    eax,r8d
   140003a0d:	sub    eax,ecx
   140003a0f:	cmp    r8d,ecx
   140003a12:	mov    ecx,0xffffffff
   140003a17:	mov    r8d,0x1
   140003a1d:	cmovle eax,ecx
   140003a20:	mov    ecx,r11d
   140003a23:	mov    DWORD PTR [rbx+0xc],eax
   140003a26:	call   0x1400035b0
   140003a2b:	mov    ecx,DWORD PTR [rbx+0x8]
   140003a2e:	mov    eax,DWORD PTR [rbx+0x2c]
   140003a31:	mov    rdx,rbx
   140003a34:	mov    DWORD PTR [rbx+0x10],eax
   140003a37:	mov    eax,ecx
   140003a39:	and    ecx,0x20
   140003a3c:	or     eax,0x1c0
   140003a41:	or     ecx,0x45
   140003a44:	mov    DWORD PTR [rbx+0x8],eax
   140003a47:	call   0x140002750
   140003a4c:	lea    r10d,[rdi+0x1]
   140003a50:	add    DWORD PTR [rbx+0xc],r10d
   140003a54:	mov    rdx,rbx
   140003a57:	mov    rcx,rsi
   140003a5a:	add    rsp,0x28
   140003a5e:	pop    rbx
   140003a5f:	pop    rsi
   140003a60:	pop    rdi
   140003a61:	pop    rbp
   140003a62:	jmp    0x1400030b0
   140003a67:	nop    WORD PTR [rax+rax*1+0x0]
   140003a70:	push   rbp
   140003a71:	push   rsi
   140003a72:	push   rbx
   140003a73:	sub    rsp,0x50
   140003a77:	lea    rbp,[rsp+0x50]
   140003a7c:	mov    r8d,DWORD PTR [rdx+0x10]
   140003a80:	fld    TBYTE PTR [rcx]
   140003a82:	mov    rbx,rdx
   140003a85:	test   r8d,r8d
   140003a88:	js     0x140003ae0
   140003a8a:	add    r8d,0x1
   140003a8e:	lea    rax,[rbp-0x8]
   140003a92:	lea    rdx,[rbp-0x20]
   140003a96:	mov    ecx,0x2
   140003a9b:	fstp   TBYTE PTR [rbp-0x20]
   140003a9e:	lea    r9,[rbp-0x4]
   140003aa2:	mov    QWORD PTR [rsp+0x20],rax
   140003aa7:	call   0x140002660
   140003aac:	mov    r8d,DWORD PTR [rbp-0x4]
   140003ab0:	mov    rsi,rax
   140003ab3:	cmp    r8d,0xffff8000
   140003aba:	je     0x140003af0
   140003abc:	mov    ecx,DWORD PTR [rbp-0x8]
   140003abf:	mov    r9,rbx
   140003ac2:	mov    rdx,rax
   140003ac5:	call   0x140003990
   140003aca:	mov    rcx,rsi
   140003acd:	call   0x140004ce0
   140003ad2:	nop
   140003ad3:	add    rsp,0x50
   140003ad7:	pop    rbx
   140003ad8:	pop    rsi
   140003ad9:	pop    rbp
   140003ada:	ret
   140003adb:	nop    DWORD PTR [rax+rax*1+0x0]
   140003ae0:	mov    DWORD PTR [rdx+0x10],0x6
   140003ae7:	mov    r8d,0x7
   140003aed:	jmp    0x140003a8e
   140003aef:	nop
   140003af0:	mov    ecx,DWORD PTR [rbp-0x8]
   140003af3:	mov    r8,rbx
   140003af6:	mov    rdx,rax
   140003af9:	call   0x140002af0
   140003afe:	mov    rcx,rsi
   140003b01:	call   0x140004ce0
   140003b06:	nop
   140003b07:	add    rsp,0x50
   140003b0b:	pop    rbx
   140003b0c:	pop    rsi
   140003b0d:	pop    rbp
   140003b0e:	ret
   140003b0f:	nop
   140003b10:	push   rbp
   140003b11:	push   rsi
   140003b12:	push   rbx
   140003b13:	sub    rsp,0x50
   140003b17:	lea    rbp,[rsp+0x50]
   140003b1c:	mov    r8d,DWORD PTR [rdx+0x10]
   140003b20:	fld    TBYTE PTR [rcx]
   140003b22:	mov    rbx,rdx
   140003b25:	test   r8d,r8d
   140003b28:	jns    0x140003b37
   140003b2a:	mov    DWORD PTR [rdx+0x10],0x6
   140003b31:	mov    r8d,0x6
   140003b37:	lea    rax,[rbp-0x8]
   140003b3b:	lea    rdx,[rbp-0x20]
   140003b3f:	mov    ecx,0x3
   140003b44:	fstp   TBYTE PTR [rbp-0x20]
   140003b47:	lea    r9,[rbp-0x4]
   140003b4b:	mov    QWORD PTR [rsp+0x20],rax
   140003b50:	call   0x140002660
   140003b55:	mov    r8d,DWORD PTR [rbp-0x4]
   140003b59:	mov    rsi,rax
   140003b5c:	cmp    r8d,0xffff8000
   140003b63:	je     0x140003bd0
   140003b65:	mov    ecx,DWORD PTR [rbp-0x8]
   140003b68:	mov    rdx,rax
   140003b6b:	mov    r9,rbx
   140003b6e:	call   0x1400035b0
   140003b73:	mov    eax,DWORD PTR [rbx+0xc]
   140003b76:	jmp    0x140003b94
   140003b78:	nop    DWORD PTR [rax+rax*1+0x0]
   140003b80:	movsxd rax,DWORD PTR [rbx+0x24]
   140003b84:	mov    BYTE PTR [rdx+rax*1],0x20
   140003b88:	mov    edx,DWORD PTR [rbx+0x24]
   140003b8b:	mov    eax,DWORD PTR [rbx+0xc]
   140003b8e:	add    edx,0x1
   140003b91:	mov    DWORD PTR [rbx+0x24],edx
   140003b94:	mov    edx,eax
   140003b96:	sub    eax,0x1
   140003b99:	mov    DWORD PTR [rbx+0xc],eax
   140003b9c:	test   edx,edx
   140003b9e:	jle    0x140003bde
   140003ba0:	mov    ecx,DWORD PTR [rbx+0x8]
   140003ba3:	test   ch,0x40
   140003ba6:	jne    0x140003bb0
   140003ba8:	mov    edx,DWORD PTR [rbx+0x24]
   140003bab:	cmp    DWORD PTR [rbx+0x28],edx
   140003bae:	jle    0x140003b8e
   140003bb0:	mov    rdx,QWORD PTR [rbx]
   140003bb3:	and    ch,0x20
   140003bb6:	je     0x140003b80
   140003bb8:	mov    ecx,0x20
   140003bbd:	call   0x140007a68
   140003bc2:	mov    edx,DWORD PTR [rbx+0x24]
   140003bc5:	mov    eax,DWORD PTR [rbx+0xc]
   140003bc8:	jmp    0x140003b8e
   140003bca:	nop    WORD PTR [rax+rax*1+0x0]
   140003bd0:	mov    ecx,DWORD PTR [rbp-0x8]
   140003bd3:	mov    r8,rbx
   140003bd6:	mov    rdx,rax
   140003bd9:	call   0x140002af0
   140003bde:	mov    rcx,rsi
   140003be1:	call   0x140004ce0
   140003be6:	nop
   140003be7:	add    rsp,0x50
   140003beb:	pop    rbx
   140003bec:	pop    rsi
   140003bed:	pop    rbp
   140003bee:	ret
   140003bef:	nop
   140003bf0:	push   rbp
   140003bf1:	push   rdi
   140003bf2:	push   rsi
   140003bf3:	push   rbx
   140003bf4:	sub    rsp,0x58
   140003bf8:	lea    rbp,[rsp+0x50]
   140003bfd:	mov    r8d,DWORD PTR [rdx+0x10]
   140003c01:	fld    TBYTE PTR [rcx]
   140003c03:	mov    rbx,rdx
   140003c06:	test   r8d,r8d
   140003c09:	js     0x140003cf8
   140003c0f:	je     0x140003ce0
   140003c15:	lea    rax,[rbp-0x8]
   140003c19:	lea    rdx,[rbp-0x20]
   140003c1d:	mov    ecx,0x2
   140003c22:	fstp   TBYTE PTR [rbp-0x20]
   140003c25:	lea    r9,[rbp-0x4]
   140003c29:	mov    QWORD PTR [rsp+0x20],rax
   140003c2e:	call   0x140002660
   140003c33:	mov    edi,DWORD PTR [rbp-0x4]
   140003c36:	mov    rsi,rax
   140003c39:	cmp    edi,0xffff8000
   140003c3f:	je     0x140003d10
   140003c45:	mov    eax,DWORD PTR [rbx+0x8]
   140003c48:	and    eax,0x800
   140003c4d:	cmp    edi,0xfffffffd
   140003c50:	jl     0x140003ca0
   140003c52:	mov    edx,DWORD PTR [rbx+0x10]
   140003c55:	cmp    edi,edx
   140003c57:	jg     0x140003ca0
   140003c59:	test   eax,eax
   140003c5b:	je     0x140003d20
   140003c61:	sub    edx,edi
   140003c63:	mov    DWORD PTR [rbx+0x10],edx
   140003c66:	mov    ecx,DWORD PTR [rbp-0x8]
   140003c69:	mov    r9,rbx
   140003c6c:	mov    r8d,edi
   140003c6f:	mov    rdx,rsi
   140003c72:	call   0x1400035b0
   140003c77:	jmp    0x140003c8d
   140003c79:	nop    DWORD PTR [rax+0x0]
   140003c80:	mov    rdx,rbx
   140003c83:	mov    ecx,0x20
   140003c88:	call   0x140002750
   140003c8d:	mov    eax,DWORD PTR [rbx+0xc]
   140003c90:	lea    edx,[rax-0x1]
   140003c93:	mov    DWORD PTR [rbx+0xc],edx
   140003c96:	test   eax,eax
   140003c98:	jg     0x140003c80
   140003c9a:	jmp    0x140003cc3
   140003c9c:	nop    DWORD PTR [rax+0x0]
   140003ca0:	test   eax,eax
   140003ca2:	jne    0x140003cd8
   140003ca4:	mov    rcx,rsi
   140003ca7:	call   0x140007ac0
   140003cac:	sub    eax,0x1
   140003caf:	mov    DWORD PTR [rbx+0x10],eax
   140003cb2:	mov    ecx,DWORD PTR [rbp-0x8]
   140003cb5:	mov    r9,rbx
   140003cb8:	mov    r8d,edi
   140003cbb:	mov    rdx,rsi
   140003cbe:	call   0x140003990
   140003cc3:	mov    rcx,rsi
   140003cc6:	call   0x140004ce0
   140003ccb:	nop
   140003ccc:	add    rsp,0x58
   140003cd0:	pop    rbx
   140003cd1:	pop    rsi
   140003cd2:	pop    rdi
   140003cd3:	pop    rbp
   140003cd4:	ret
   140003cd5:	nop    DWORD PTR [rax]
   140003cd8:	mov    eax,DWORD PTR [rbx+0x10]
   140003cdb:	sub    eax,0x1
   140003cde:	jmp    0x140003caf
   140003ce0:	mov    DWORD PTR [rdx+0x10],0x1
   140003ce7:	mov    r8d,0x1
   140003ced:	jmp    0x140003c15
   140003cf2:	nop    WORD PTR [rax+rax*1+0x0]
   140003cf8:	mov    DWORD PTR [rdx+0x10],0x6
   140003cff:	mov    r8d,0x6
   140003d05:	jmp    0x140003c15
   140003d0a:	nop    WORD PTR [rax+rax*1+0x0]
   140003d10:	mov    ecx,DWORD PTR [rbp-0x8]
   140003d13:	mov    r8,rbx
   140003d16:	mov    rdx,rax
   140003d19:	call   0x140002af0
   140003d1e:	jmp    0x140003cc3
   140003d20:	mov    rcx,rsi
   140003d23:	call   0x140007ac0
   140003d28:	sub    eax,edi
   140003d2a:	mov    DWORD PTR [rbx+0x10],eax
   140003d2d:	jns    0x140003c66
   140003d33:	mov    edx,DWORD PTR [rbx+0xc]
   140003d36:	test   edx,edx
   140003d38:	jle    0x140003c66
   140003d3e:	add    eax,edx
   140003d40:	mov    DWORD PTR [rbx+0xc],eax
   140003d43:	jmp    0x140003c66
   140003d48:	nop    DWORD PTR [rax+rax*1+0x0]
   140003d50:	push   rbp
   140003d51:	push   r14
   140003d53:	push   r13
   140003d55:	push   r12
   140003d57:	push   rdi
   140003d58:	push   rsi
   140003d59:	push   rbx
   140003d5a:	sub    rsp,0x50
   140003d5e:	lea    rbp,[rsp+0x50]
   140003d63:	mov    r10d,DWORD PTR [r8+0x10]
   140003d67:	mov    r9,rcx
   140003d6a:	mov    eax,edx
   140003d6c:	mov    rbx,r8
   140003d6f:	test   dx,dx
   140003d72:	jne    0x140003d7d
   140003d74:	test   rcx,rcx
   140003d77:	je     0x140003e68
   140003d7d:	lea    r8d,[rax-0x3]
   140003d81:	cmp    r10d,0xe
   140003d85:	jbe    0x140003e20
   140003d8b:	movsx  r12,r8w
   140003d8f:	mov    edx,0x10
   140003d94:	test   r9,r9
   140003d97:	je     0x1400041a0
   140003d9d:	mov    r10d,DWORD PTR [rbx+0x8]
   140003da1:	lea    rdi,[rbp-0x20]
   140003da5:	mov    rsi,rdi
   140003da8:	mov    r11d,r10d
   140003dab:	mov    r13d,r10d
   140003dae:	and    r11d,0x20
   140003db2:	and    r13d,0x800
   140003db9:	jmp    0x140003de6
   140003dbb:	nop    DWORD PTR [rax+rax*1+0x0]
   140003dc0:	cmp    rdi,rcx
   140003dc3:	jb     0x140003dd0
   140003dc5:	mov    esi,DWORD PTR [rbx+0x10]
   140003dc8:	test   esi,esi
   140003dca:	js     0x140004148
   140003dd0:	add    eax,0x30
   140003dd3:	mov    BYTE PTR [rcx],al
   140003dd5:	lea    rsi,[rcx+0x1]
   140003dd9:	shr    r9,0x4
   140003ddd:	sub    edx,0x1
   140003de0:	je     0x140003fd0
   140003de6:	mov    eax,r9d
   140003de9:	and    eax,0xf
   140003dec:	cmp    edx,0x1
   140003def:	je     0x140003fa0
   140003df5:	mov    ecx,DWORD PTR [rbx+0x10]
   140003df8:	test   ecx,ecx
   140003dfa:	jle    0x140003e02
   140003dfc:	sub    ecx,0x1
   140003dff:	mov    DWORD PTR [rbx+0x10],ecx
   140003e02:	mov    rcx,rsi
   140003e05:	test   eax,eax
   140003e07:	je     0x140003dc0
   140003e09:	cmp    eax,0x9
   140003e0c:	jbe    0x140003dd0
   140003e0e:	add    eax,0x37
   140003e11:	or     eax,r11d
   140003e14:	jmp    0x140003dd3
   140003e16:	cs nop WORD PTR [rax+rax*1+0x0]
   140003e20:	mov    ecx,0xe
   140003e25:	mov    edx,0x4
   140003e2a:	shr    r9,1
   140003e2d:	sub    ecx,r10d
   140003e30:	shl    ecx,0x2
   140003e33:	shl    rdx,cl
   140003e36:	add    rdx,r9
   140003e39:	jns    0x140004190
   140003e3f:	mov    ecx,0xf
   140003e44:	shr    rdx,0x3
   140003e48:	lea    r8d,[rax+0x1]
   140003e4c:	sub    ecx,r10d
   140003e4f:	movsx  r12,r8w
   140003e53:	shl    ecx,0x2
   140003e56:	shr    rdx,cl
   140003e59:	mov    r9,rdx
   140003e5c:	lea    edx,[r10+0x1]
   140003e60:	jmp    0x140003d9d
   140003e65:	nop    DWORD PTR [rax]
   140003e68:	cmp    r10d,0xe
   140003e6c:	ja     0x140004178
   140003e72:	mov    ecx,0xe
   140003e77:	mov    edx,0x4
   140003e7c:	xor    r12d,r12d
   140003e7f:	xor    r8d,r8d
   140003e82:	sub    ecx,r10d
   140003e85:	shl    ecx,0x2
   140003e88:	shl    rdx,cl
   140003e8b:	mov    ecx,0xf
   140003e90:	add    rdx,rdx
   140003e93:	sub    ecx,r10d
   140003e96:	shl    ecx,0x2
   140003e99:	shr    rdx,cl
   140003e9c:	mov    r9,rdx
   140003e9f:	test   rdx,rdx
   140003ea2:	jne    0x140003e5c
   140003ea4:	test   r10d,r10d
   140003ea7:	jne    0x140003e5c
   140003ea9:	mov    r10d,DWORD PTR [rbx+0x8]
   140003ead:	lea    rdi,[rbp-0x20]
   140003eb1:	mov    rax,rdi
   140003eb4:	test   r10d,0x800
   140003ebb:	je     0x140003ec5
   140003ebd:	mov    BYTE PTR [rbp-0x20],0x2e
   140003ec1:	lea    rax,[rbp-0x1f]
   140003ec5:	mov    r9d,DWORD PTR [rbx+0xc]
   140003ec9:	mov    BYTE PTR [rax],0x30
   140003ecc:	lea    rsi,[rax+0x1]
   140003ed0:	mov    r13d,0x2
   140003ed6:	test   r9d,r9d
   140003ed9:	jg     0x140003fec
   140003edf:	test   r10b,0x80
   140003ee3:	jne    0x1400040b0
   140003ee9:	test   r10d,0x100
   140003ef0:	jne    0x140004160
   140003ef6:	and    r10d,0x40
   140003efa:	jne    0x1400041b0
   140003f00:	mov    rdx,rbx
   140003f03:	mov    ecx,0x30
   140003f08:	call   0x140002750
   140003f0d:	mov    ecx,DWORD PTR [rbx+0x8]
   140003f10:	mov    rdx,rbx
   140003f13:	and    ecx,0x20
   140003f16:	or     ecx,0x58
   140003f19:	call   0x140002750
   140003f1e:	mov    eax,DWORD PTR [rbx+0xc]
   140003f21:	test   eax,eax
   140003f23:	jle    0x140003f52
   140003f25:	test   BYTE PTR [rbx+0x9],0x2
   140003f29:	je     0x140003f52
   140003f2b:	sub    eax,0x1
   140003f2e:	mov    DWORD PTR [rbx+0xc],eax
   140003f31:	nop    DWORD PTR [rax+0x0]
   140003f38:	mov    rdx,rbx
   140003f3b:	mov    ecx,0x30
   140003f40:	call   0x140002750
   140003f45:	mov    eax,DWORD PTR [rbx+0xc]
   140003f48:	lea    edx,[rax-0x1]
   140003f4b:	mov    DWORD PTR [rbx+0xc],edx
   140003f4e:	test   eax,eax
   140003f50:	jg     0x140003f38
   140003f52:	lea    r14,[rbp-0x22]
   140003f56:	cmp    rdi,rsi
   140003f59:	jb     0x140003f7a
   140003f5b:	jmp    0x1400040d5
   140003f60:	movzx  eax,WORD PTR [rbx+0x20]
   140003f64:	mov    WORD PTR [rbp-0x22],ax
   140003f68:	test   ax,ax
   140003f6b:	jne    0x140004130
   140003f71:	cmp    rsi,rdi
   140003f74:	je     0x1400040d5
   140003f7a:	movsx  ecx,BYTE PTR [rsi-0x1]
   140003f7e:	sub    rsi,0x1
   140003f82:	cmp    ecx,0x2e
   140003f85:	je     0x140004120
   140003f8b:	cmp    ecx,0x2c
   140003f8e:	je     0x140003f60
   140003f90:	mov    rdx,rbx
   140003f93:	call   0x140002750
   140003f98:	jmp    0x140003f71
   140003f9a:	nop    WORD PTR [rax+rax*1+0x0]
   140003fa0:	cmp    rdi,rsi
   140003fa3:	jb     0x140003fb8
   140003fa5:	test   r13d,r13d
   140003fa8:	jne    0x140003fb8
   140003faa:	mov    ecx,DWORD PTR [rbx+0x10]
   140003fad:	test   ecx,ecx
   140003faf:	jle    0x1400041c8
   140003fb5:	nop    DWORD PTR [rax]
   140003fb8:	mov    BYTE PTR [rsi],0x2e
   140003fbb:	lea    rcx,[rsi+0x1]
   140003fbf:	jmp    0x140003e05
   140003fc4:	test   ecx,ecx
   140003fc6:	jne    0x140003fd0
   140003fc8:	mov    BYTE PTR [rsi],0x30
   140003fcb:	add    rsi,0x1
   140003fcf:	nop
   140003fd0:	cmp    rsi,rdi
   140003fd3:	je     0x1400041e0
   140003fd9:	mov    r9d,DWORD PTR [rbx+0xc]
   140003fdd:	mov    r13d,0x2
   140003fe3:	test   r9d,r9d
   140003fe6:	jle    0x140003edf
   140003fec:	mov    edx,DWORD PTR [rbx+0x10]
   140003fef:	mov    rcx,rsi
   140003ff2:	movsx  eax,r8w
   140003ff6:	movsx  r8,r8w
   140003ffa:	sub    rcx,rdi
   140003ffd:	lea    r11d,[rdx+rcx*1]
   140004001:	test   edx,edx
   140004003:	mov    edx,r10d
   140004006:	cmovg  ecx,r11d
   14000400a:	and    edx,0x1c0
   140004010:	cmp    edx,0x1
   140004013:	sbb    ecx,0xfffffffa
   140004016:	imul   r8,r8,0x66666667
   14000401d:	sar    eax,0x1f
   140004020:	mov    r11d,ecx
   140004023:	sar    r8,0x22
   140004027:	sub    r8d,eax
   14000402a:	je     0x14000405d
   14000402c:	nop    DWORD PTR [rax+0x0]
   140004030:	movsxd rax,r8d
   140004033:	mov    edx,r8d
   140004036:	add    r11d,0x1
   14000403a:	imul   rax,rax,0x66666667
   140004041:	sar    edx,0x1f
   140004044:	sar    rax,0x22
   140004048:	sub    eax,edx
   14000404a:	mov    r8d,eax
   14000404d:	jne    0x140004030
   14000404f:	mov    r13d,r11d
   140004052:	sub    r13d,ecx
   140004055:	add    r13d,0x2
   140004059:	movsx  r13d,r13w
   14000405d:	cmp    r9d,r11d
   140004060:	jle    0x140004150
   140004066:	sub    r9d,r11d
   140004069:	test   r10d,0x600
   140004070:	jne    0x140004156
   140004076:	sub    r9d,0x1
   14000407a:	mov    DWORD PTR [rbx+0xc],r9d
   14000407e:	xchg   ax,ax
   140004080:	mov    rdx,rbx
   140004083:	mov    ecx,0x20
   140004088:	call   0x140002750
   14000408d:	mov    eax,DWORD PTR [rbx+0xc]
   140004090:	lea    edx,[rax-0x1]
   140004093:	mov    DWORD PTR [rbx+0xc],edx
   140004096:	test   eax,eax
   140004098:	jg     0x140004080
   14000409a:	mov    r10d,DWORD PTR [rbx+0x8]
   14000409e:	test   r10b,0x80
   1400040a2:	je     0x140003ee9
   1400040a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400040b0:	mov    rdx,rbx
   1400040b3:	mov    ecx,0x2d
   1400040b8:	call   0x140002750
   1400040bd:	jmp    0x140003f00
   1400040c2:	nop    WORD PTR [rax+rax*1+0x0]
   1400040c8:	mov    rdx,rbx
   1400040cb:	mov    ecx,0x30
   1400040d0:	call   0x140002750
   1400040d5:	mov    eax,DWORD PTR [rbx+0x10]
   1400040d8:	lea    edx,[rax-0x1]
   1400040db:	mov    DWORD PTR [rbx+0x10],edx
   1400040de:	test   eax,eax
   1400040e0:	jg     0x1400040c8
   1400040e2:	mov    ecx,DWORD PTR [rbx+0x8]
   1400040e5:	mov    rdx,rbx
   1400040e8:	and    ecx,0x20
   1400040eb:	or     ecx,0x50
   1400040ee:	call   0x140002750
   1400040f3:	add    DWORD PTR [rbx+0xc],r13d
   1400040f7:	mov    rdx,rbx
   1400040fa:	mov    rcx,r12
   1400040fd:	or     DWORD PTR [rbx+0x8],0x1c0
   140004104:	add    rsp,0x50
   140004108:	pop    rbx
   140004109:	pop    rsi
   14000410a:	pop    rdi
   14000410b:	pop    r12
   14000410d:	pop    r13
   14000410f:	pop    r14
   140004111:	pop    rbp
   140004112:	jmp    0x1400030b0
   140004117:	nop    WORD PTR [rax+rax*1+0x0]
   140004120:	mov    rcx,rbx
   140004123:	call   0x140003460
   140004128:	jmp    0x140003f71
   14000412d:	nop    DWORD PTR [rax]
   140004130:	mov    r8,rbx
   140004133:	mov    edx,0x1
   140004138:	mov    rcx,r14
   14000413b:	call   0x1400027b0
   140004140:	jmp    0x140003f71
   140004145:	nop    DWORD PTR [rax]
   140004148:	mov    rsi,rcx
   14000414b:	jmp    0x140003dd9
   140004150:	mov    r9d,0xffffffff
   140004156:	mov    DWORD PTR [rbx+0xc],r9d
   14000415a:	jmp    0x140003edf
   14000415f:	nop
   140004160:	mov    rdx,rbx
   140004163:	mov    ecx,0x2b
   140004168:	call   0x140002750
   14000416d:	jmp    0x140003f00
   140004172:	nop    WORD PTR [rax+rax*1+0x0]
   140004178:	test   r10d,r10d
   14000417b:	jle    0x1400041f0
   14000417d:	xor    r12d,r12d
   140004180:	xor    r8d,r8d
   140004183:	xor    r9d,r9d
   140004186:	mov    edx,0x10
   14000418b:	jmp    0x140003d9d
   140004190:	movsx  r12,r8w
   140004194:	jmp    0x140003e8b
   140004199:	nop    DWORD PTR [rax+0x0]
   1400041a0:	test   r10d,r10d
   1400041a3:	jg     0x140003d9d
   1400041a9:	jmp    0x140003ea9
   1400041ae:	xchg   ax,ax
   1400041b0:	mov    rdx,rbx
   1400041b3:	mov    ecx,0x20
   1400041b8:	call   0x140002750
   1400041bd:	jmp    0x140003f00
   1400041c2:	nop    WORD PTR [rax+rax*1+0x0]
   1400041c8:	test   eax,eax
   1400041ca:	je     0x140003fc4
   1400041d0:	mov    rcx,rsi
   1400041d3:	jmp    0x140003e09
   1400041d8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400041e0:	mov    eax,DWORD PTR [rbx+0x10]
   1400041e3:	test   eax,eax
   1400041e5:	jg     0x140003ebd
   1400041eb:	jmp    0x140003eb1
   1400041f0:	mov    r10d,DWORD PTR [r8+0x8]
   1400041f4:	xor    r12d,r12d
   1400041f7:	xor    r8d,r8d
   1400041fa:	lea    rdi,[rbp-0x20]
   1400041fe:	jmp    0x140003eb1
   140004203:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000420e:	xchg   ax,ax
   140004210:	push   rbp
   140004211:	push   r15
   140004213:	push   r14
   140004215:	push   r13
   140004217:	push   r12
   140004219:	push   rdi
   14000421a:	push   rsi
   14000421b:	push   rbx
   14000421c:	sub    rsp,0xb8
   140004223:	lea    rbp,[rsp+0xb0]
   14000422b:	mov    r14,QWORD PTR [rbp+0x70]
   14000422f:	mov    edi,ecx
   140004231:	mov    r12,rdx
   140004234:	mov    ebx,r8d
   140004237:	mov    rsi,r9
   14000423a:	call   0x140007a18
   14000423f:	and    edi,0x6000
   140004245:	xor    edx,edx
   140004247:	mov    DWORD PTR [rbp-0x8],ebx
   14000424a:	movabs rcx,0xfffffffdffffffff
   140004254:	mov    WORD PTR [rbp-0x18],dx
   140004258:	mov    eax,DWORD PTR [rax]
   14000425a:	lea    rbx,[rsi+0x1]
   14000425e:	mov    QWORD PTR [rbp-0x20],rcx
   140004262:	xor    ecx,ecx
   140004264:	mov    WORD PTR [rbp-0x10],cx
   140004268:	movsx  ecx,BYTE PTR [rsi]
   14000426b:	mov    QWORD PTR [rbp-0x30],r12
   14000426f:	mov    DWORD PTR [rbp-0x28],edi
   140004272:	mov    edx,ecx
   140004274:	mov    DWORD PTR [rbp-0x24],0xffffffff
   14000427b:	mov    DWORD PTR [rbp-0x14],0x0
   140004282:	mov    DWORD PTR [rbp-0xc],0x0
   140004289:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140004290:	test   ecx,ecx
   140004292:	je     0x140004393
   140004298:	lea    rsi,[rbp-0x24]
   14000429c:	mov    DWORD PTR [rbp-0x6c],eax
   14000429f:	lea    r13,[rip+0x524a]        # 0x1400094f0
   1400042a6:	mov    r15,rbx
   1400042a9:	mov    QWORD PTR [rbp-0x68],rsi
   1400042ad:	jmp    0x1400042e9
   1400042af:	nop
   1400042b0:	mov    eax,DWORD PTR [rbp-0x28]
   1400042b3:	mov    esi,DWORD PTR [rbp-0xc]
   1400042b6:	test   ah,0x40
   1400042b9:	jne    0x1400042c0
   1400042bb:	cmp    DWORD PTR [rbp-0x8],esi
   1400042be:	jle    0x1400042d0
   1400042c0:	mov    r8,QWORD PTR [rbp-0x30]
   1400042c4:	test   ah,0x20
   1400042c7:	jne    0x140004330
   1400042c9:	movsxd rax,esi
   1400042cc:	mov    BYTE PTR [r8+rax*1],dl
   1400042d0:	add    esi,0x1
   1400042d3:	mov    DWORD PTR [rbp-0xc],esi
   1400042d6:	movzx  edx,BYTE PTR [r15]
   1400042da:	add    r15,0x1
   1400042de:	movsx  ecx,dl
   1400042e1:	test   ecx,ecx
   1400042e3:	je     0x140004390
   1400042e9:	cmp    ecx,0x25
   1400042ec:	jne    0x1400042b0
   1400042ee:	movzx  edx,BYTE PTR [r15]
   1400042f2:	mov    DWORD PTR [rbp-0x28],edi
   1400042f5:	mov    QWORD PTR [rbp-0x24],0xffffffffffffffff
   1400042fd:	test   dl,dl
   1400042ff:	je     0x140004390
   140004305:	mov    r10,QWORD PTR [rbp-0x68]
   140004309:	mov    rsi,r15
   14000430c:	xor    r11d,r11d
   14000430f:	xor    ebx,ebx
   140004311:	lea    eax,[rdx-0x20]
   140004314:	lea    r12,[rsi+0x1]
   140004318:	movsx  ecx,dl
   14000431b:	cmp    al,0x5a
   14000431d:	ja     0x140004340
   14000431f:	movzx  eax,al
   140004322:	movsxd rax,DWORD PTR [r13+rax*4+0x0]
   140004327:	add    rax,r13
   14000432a:	jmp    rax
   14000432c:	nop    DWORD PTR [rax+0x0]
   140004330:	mov    rdx,r8
   140004333:	call   0x140007a68
   140004338:	jmp    0x1400042d0
   14000433a:	nop    WORD PTR [rax+rax*1+0x0]
   140004340:	sub    edx,0x30
   140004343:	cmp    dl,0x9
   140004346:	ja     0x14000454a
   14000434c:	cmp    ebx,0x3
   14000434f:	ja     0x14000454a
   140004355:	test   ebx,ebx
   140004357:	jne    0x140004a2f
   14000435d:	mov    ebx,0x1
   140004362:	test   r10,r10
   140004365:	je     0x140004380
   140004367:	mov    eax,DWORD PTR [r10]
   14000436a:	test   eax,eax
   14000436c:	js     0x140004ad1
   140004372:	lea    eax,[rax+rax*4]
   140004375:	lea    eax,[rcx+rax*2-0x30]
   140004379:	mov    DWORD PTR [r10],eax
   14000437c:	nop    DWORD PTR [rax+0x0]
   140004380:	movzx  edx,BYTE PTR [rsi+0x1]
   140004384:	mov    rsi,r12
   140004387:	test   dl,dl
   140004389:	jne    0x140004311
   14000438b:	nop    DWORD PTR [rax+rax*1+0x0]
   140004390:	mov    ecx,DWORD PTR [rbp-0xc]
   140004393:	mov    eax,ecx
   140004395:	add    rsp,0xb8
   14000439c:	pop    rbx
   14000439d:	pop    rsi
   14000439e:	pop    rdi
   14000439f:	pop    r12
   1400043a1:	pop    r13
   1400043a3:	pop    r14
   1400043a5:	pop    r15
   1400043a7:	pop    rbp
   1400043a8:	ret
   1400043a9:	nop    DWORD PTR [rax+0x0]
   1400043b0:	and    DWORD PTR [rbp-0x28],0xfffffeff
   1400043b7:	cmp    r11d,0x3
   1400043bb:	je     0x140004aff
   1400043c1:	cmp    r11d,0x2
   1400043c5:	je     0x140004bac
   1400043cb:	mov    edx,DWORD PTR [r14]
   1400043ce:	movzx  eax,dx
   1400043d1:	cmp    r11d,0x1
   1400043d5:	je     0x1400043e8
   1400043d7:	mov    r8d,edx
   1400043da:	cmp    r11d,0x5
   1400043de:	movzx  edx,dl
   1400043e1:	mov    rax,r8
   1400043e4:	cmove  rax,rdx
   1400043e8:	mov    QWORD PTR [rbp-0x40],rax
   1400043ec:	cmp    ecx,0x75
   1400043ef:	je     0x140004b41
   1400043f5:	lea    r8,[rbp-0x30]
   1400043f9:	mov    rdx,rax
   1400043fc:	call   0x140002b90
   140004401:	jmp    0x140004690
   140004406:	cs nop WORD PTR [rax+rax*1+0x0]
   140004410:	movzx  edx,BYTE PTR [rsi+0x1]
   140004414:	mov    r11d,0x3
   14000441a:	mov    rsi,r12
   14000441d:	mov    ebx,0x4
   140004422:	jmp    0x140004387
   140004427:	or     DWORD PTR [rbp-0x28],0x80
   14000442e:	lea    rsi,[r14+0x8]
   140004432:	cmp    r11d,0x3
   140004436:	je     0x140004b52
   14000443c:	movsxd rcx,DWORD PTR [r14]
   14000443f:	cmp    r11d,0x2
   140004443:	je     0x14000445b
   140004445:	cmp    r11d,0x1
   140004449:	je     0x140004ac0
   14000444f:	movsx  rdx,cl
   140004453:	cmp    r11d,0x5
   140004457:	cmove  rcx,rdx
   14000445b:	lea    rdx,[rbp-0x30]
   14000445f:	mov    r14,rsi
   140004462:	mov    r15,r12
   140004465:	call   0x1400030b0
   14000446a:	jmp    0x1400042d6
   14000446f:	test   ebx,ebx
   140004471:	jne    0x14000447c
   140004473:	cmp    DWORD PTR [rbp-0x28],edi
   140004476:	je     0x140004a9a
   14000447c:	mov    rdx,QWORD PTR [r14]
   14000447f:	lea    rsi,[r14+0x8]
   140004483:	lea    r8,[rbp-0x30]
   140004487:	mov    ecx,0x78
   14000448c:	mov    r14,rsi
   14000448f:	mov    r15,r12
   140004492:	call   0x140002b90
   140004497:	jmp    0x1400042d6
   14000449c:	movzx  edx,BYTE PTR [rsi+0x1]
   1400044a0:	cmp    dl,0x68
   1400044a3:	je     0x140004b07
   1400044a9:	mov    rsi,r12
   1400044ac:	mov    r11d,0x1
   1400044b2:	mov    ebx,0x4
   1400044b7:	jmp    0x140004387
   1400044bc:	mov    ecx,DWORD PTR [rbp-0x6c]
   1400044bf:	mov    r15,r12
   1400044c2:	call   0x140007ab8
   1400044c7:	lea    rdx,[rbp-0x30]
   1400044cb:	mov    rcx,rax
   1400044ce:	call   0x140002aa0
   1400044d3:	jmp    0x1400042d6
   1400044d8:	mov    rcx,QWORD PTR [r14]
   1400044db:	movsxd rdx,DWORD PTR [rbp-0xc]
   1400044df:	cmp    r11d,0x5
   1400044e3:	je     0x140004b1f
   1400044e9:	cmp    r11d,0x1
   1400044ed:	je     0x140004ba4
   1400044f3:	cmp    r11d,0x2
   1400044f7:	je     0x140004503
   1400044f9:	cmp    r11d,0x3
   1400044fd:	je     0x140004ac9
   140004503:	mov    DWORD PTR [rcx],edx
   140004505:	jmp    0x140004690
   14000450a:	movzx  edx,BYTE PTR [rsi+0x1]
   14000450e:	cmp    dl,0x6c
   140004511:	je     0x140004b7c
   140004517:	mov    rsi,r12
   14000451a:	mov    r11d,0x2
   140004520:	mov    ebx,0x4
   140004525:	jmp    0x140004387
   14000452a:	movzx  edx,BYTE PTR [rsi+0x1]
   14000452e:	cmp    dl,0x36
   140004531:	je     0x140004b5a
   140004537:	cmp    dl,0x33
   14000453a:	jne    0x140004a7d
   140004540:	cmp    BYTE PTR [rsi+0x2],0x32
   140004544:	je     0x140004bc7
   14000454a:	lea    rdx,[rbp-0x30]
   14000454e:	mov    ecx,0x25
   140004553:	call   0x140002750
   140004558:	jmp    0x1400042d6
   14000455d:	nop    DWORD PTR [rax]
   140004560:	movzx  edx,BYTE PTR [rsi+0x1]
   140004564:	or     DWORD PTR [rbp-0x28],0x4
   140004568:	mov    rsi,r12
   14000456b:	mov    ebx,0x4
   140004570:	jmp    0x140004387
   140004575:	mov    eax,DWORD PTR [rbp-0x28]
   140004578:	mov    rdx,QWORD PTR [r14]
   14000457b:	or     eax,0x20
   14000457e:	mov    DWORD PTR [rbp-0x28],eax
   140004581:	test   al,0x4
   140004583:	je     0x140004762
   140004589:	mov    r8,QWORD PTR [rdx]
   14000458c:	mov    r9d,DWORD PTR [rdx+0x8]
   140004590:	mov    r10,r8
   140004593:	movsx  r11d,r9w
   140004597:	mov    rdx,r9
   14000459a:	shr    r10,0x20
   14000459e:	lea    esi,[r11+r11*1]
   1400045a2:	and    r10d,0x7fffffff
   1400045a9:	movzx  esi,si
   1400045ac:	or     r10d,r8d
   1400045af:	mov    ecx,r10d
   1400045b2:	neg    ecx
   1400045b4:	or     ecx,r10d
   1400045b7:	shr    ecx,0x1f
   1400045ba:	or     ecx,esi
   1400045bc:	mov    esi,0xfffe
   1400045c1:	sub    esi,ecx
   1400045c3:	shr    esi,0x10
   1400045c6:	jne    0x140004a3f
   1400045cc:	test   r9w,r9w
   1400045d0:	js     0x140004a90
   1400045d6:	and    dx,0x7fff
   1400045db:	je     0x140004a6a
   1400045e1:	cmp    dx,0x7fff
   1400045e6:	jne    0x1400045f1
   1400045e8:	test   r10d,r10d
   1400045eb:	je     0x140004bfd
   1400045f1:	sub    dx,0x3fff
   1400045f6:	mov    rcx,r8
   1400045f9:	jmp    0x1400049cf
   1400045fe:	lea    eax,[r11-0x2]
   140004602:	mov    DWORD PTR [rbp-0x20],0xffffffff
   140004609:	mov    edx,DWORD PTR [r14]
   14000460c:	lea    rsi,[r14+0x8]
   140004610:	cmp    eax,0x1
   140004613:	jbe    0x140004803
   140004619:	mov    BYTE PTR [rbp-0x40],dl
   14000461c:	lea    rcx,[rbp-0x40]
   140004620:	lea    r8,[rbp-0x30]
   140004624:	mov    edx,0x1
   140004629:	call   0x140002950
   14000462e:	mov    r14,rsi
   140004631:	mov    r15,r12
   140004634:	jmp    0x1400042d6
   140004639:	lea    eax,[r11-0x2]
   14000463d:	mov    rcx,QWORD PTR [r14]
   140004640:	lea    rsi,[r14+0x8]
   140004644:	cmp    eax,0x1
   140004647:	jbe    0x1400049e1
   14000464d:	lea    rdx,[rbp-0x30]
   140004651:	mov    r14,rsi
   140004654:	mov    r15,r12
   140004657:	call   0x140002aa0
   14000465c:	jmp    0x1400042d6
   140004661:	mov    eax,DWORD PTR [rbp-0x28]
   140004664:	mov    rdx,QWORD PTR [r14]
   140004667:	or     eax,0x20
   14000466a:	mov    DWORD PTR [rbp-0x28],eax
   14000466d:	test   al,0x4
   14000466f:	je     0x140004889
   140004675:	fld    TBYTE PTR [rdx]
   140004677:	lea    rcx,[rbp-0x60]
   14000467b:	lea    rdx,[rbp-0x30]
   14000467f:	fstp   TBYTE PTR [rbp-0x60]
   140004682:	call   0x140003bf0
   140004687:	nop    WORD PTR [rax+rax*1+0x0]
   140004690:	add    r14,0x8
   140004694:	mov    r15,r12
   140004697:	jmp    0x1400042d6
   14000469c:	mov    eax,DWORD PTR [rbp-0x28]
   14000469f:	mov    rdx,QWORD PTR [r14]
   1400046a2:	or     eax,0x20
   1400046a5:	mov    DWORD PTR [rbp-0x28],eax
   1400046a8:	test   al,0x4
   1400046aa:	je     0x14000485f
   1400046b0:	fld    TBYTE PTR [rdx]
   1400046b2:	lea    rcx,[rbp-0x60]
   1400046b6:	lea    rdx,[rbp-0x30]
   1400046ba:	fstp   TBYTE PTR [rbp-0x60]
   1400046bd:	call   0x140003b10
   1400046c2:	jmp    0x140004690
   1400046c4:	mov    eax,DWORD PTR [rbp-0x28]
   1400046c7:	mov    rdx,QWORD PTR [r14]
   1400046ca:	or     eax,0x20
   1400046cd:	mov    DWORD PTR [rbp-0x28],eax
   1400046d0:	test   al,0x4
   1400046d2:	je     0x140004835
   1400046d8:	fld    TBYTE PTR [rdx]
   1400046da:	lea    rcx,[rbp-0x60]
   1400046de:	lea    rdx,[rbp-0x30]
   1400046e2:	fstp   TBYTE PTR [rbp-0x60]
   1400046e5:	call   0x140003a70
   1400046ea:	jmp    0x140004690
   1400046ec:	test   ebx,ebx
   1400046ee:	jne    0x140004380
   1400046f4:	movzx  edx,BYTE PTR [rsi+0x1]
   1400046f8:	or     DWORD PTR [rbp-0x28],0x40
   1400046fc:	mov    rsi,r12
   1400046ff:	jmp    0x140004387
   140004704:	test   ebx,ebx
   140004706:	jne    0x140004380
   14000470c:	movzx  edx,BYTE PTR [rsi+0x1]
   140004710:	or     DWORD PTR [rbp-0x28],0x400
   140004717:	mov    rsi,r12
   14000471a:	jmp    0x140004387
   14000471f:	cmp    ebx,0x1
   140004722:	jbe    0x140004ae3
   140004728:	movzx  edx,BYTE PTR [rsi+0x1]
   14000472c:	mov    ebx,0x4
   140004731:	mov    rsi,r12
   140004734:	jmp    0x140004387
   140004739:	test   ebx,ebx
   14000473b:	jne    0x140004a21
   140004741:	movzx  edx,BYTE PTR [rsi+0x1]
   140004745:	or     DWORD PTR [rbp-0x28],0x200
   14000474c:	mov    rsi,r12
   14000474f:	jmp    0x140004387
   140004754:	mov    eax,DWORD PTR [rbp-0x28]
   140004757:	mov    rdx,QWORD PTR [r14]
   14000475a:	test   al,0x4
   14000475c:	jne    0x140004589
   140004762:	mov    r8,rdx
   140004765:	mov    ecx,edx
   140004767:	shr    r8,0x20
   14000476b:	neg    ecx
   14000476d:	mov    r9d,r8d
   140004770:	or     ecx,edx
   140004772:	and    r9d,0x7fffffff
   140004779:	shr    ecx,0x1f
   14000477c:	or     ecx,r9d
   14000477f:	mov    r9d,0x7ff00000
   140004785:	cmp    r9d,ecx
   140004788:	js     0x140004a3f
   14000478e:	mov    QWORD PTR [rbp-0x80],rdx
   140004792:	fld    QWORD PTR [rbp-0x80]
   140004795:	fstp   TBYTE PTR [rbp-0x80]
   140004798:	mov    rcx,QWORD PTR [rbp-0x78]
   14000479c:	test   cx,cx
   14000479f:	jns    0x1400047a6
   1400047a1:	or     al,0x80
   1400047a3:	mov    DWORD PTR [rbp-0x28],eax
   1400047a6:	mov    eax,r8d
   1400047a9:	and    r8d,0x7ff00000
   1400047b0:	and    eax,0xfffff
   1400047b5:	cmp    r8d,0x7ff00000
   1400047bc:	setne  r9b
   1400047c0:	or     eax,edx
   1400047c2:	setne  dl
   1400047c5:	or     r9b,dl
   1400047c8:	jne    0x140004995
   1400047ce:	or     eax,r8d
   1400047d1:	je     0x140004995
   1400047d7:	and    ecx,0x8000
   1400047dd:	lea    r8,[rbp-0x30]
   1400047e1:	lea    rdx,[rip+0x4d02]        # 0x1400094ea
   1400047e8:	call   0x140002af0
   1400047ed:	jmp    0x140004690
   1400047f2:	nop    WORD PTR [rax+rax*1+0x0]
   1400047f8:	mov    DWORD PTR [rbp-0x20],0xffffffff
   1400047ff:	lea    rsi,[r14+0x8]
   140004803:	mov    eax,DWORD PTR [r14]
   140004806:	lea    rcx,[rbp-0x40]
   14000480a:	lea    r8,[rbp-0x30]
   14000480e:	mov    edx,0x1
   140004813:	mov    r14,rsi
   140004816:	mov    r15,r12
   140004819:	mov    WORD PTR [rbp-0x40],ax
   14000481d:	call   0x1400027b0
   140004822:	jmp    0x1400042d6
   140004827:	mov    eax,DWORD PTR [rbp-0x28]
   14000482a:	mov    rdx,QWORD PTR [r14]
   14000482d:	test   al,0x4
   14000482f:	jne    0x1400046d8
   140004835:	mov    QWORD PTR [rbp-0x80],rdx
   140004839:	fld    QWORD PTR [rbp-0x80]
   14000483c:	lea    rdx,[rbp-0x30]
   140004840:	lea    rcx,[rbp-0x60]
   140004844:	fstp   TBYTE PTR [rbp-0x60]
   140004847:	call   0x140003a70
   14000484c:	jmp    0x140004690
   140004851:	mov    eax,DWORD PTR [rbp-0x28]
   140004854:	mov    rdx,QWORD PTR [r14]
   140004857:	test   al,0x4
   140004859:	jne    0x1400046b0
   14000485f:	mov    QWORD PTR [rbp-0x80],rdx
   140004863:	fld    QWORD PTR [rbp-0x80]
   140004866:	lea    rdx,[rbp-0x30]
   14000486a:	lea    rcx,[rbp-0x60]
   14000486e:	fstp   TBYTE PTR [rbp-0x60]
   140004871:	call   0x140003b10
   140004876:	jmp    0x140004690
   14000487b:	mov    eax,DWORD PTR [rbp-0x28]
   14000487e:	mov    rdx,QWORD PTR [r14]
   140004881:	test   al,0x4
   140004883:	jne    0x140004675
   140004889:	mov    QWORD PTR [rbp-0x80],rdx
   14000488d:	fld    QWORD PTR [rbp-0x80]
   140004890:	lea    rdx,[rbp-0x30]
   140004894:	lea    rcx,[rbp-0x60]
   140004898:	fstp   TBYTE PTR [rbp-0x60]
   14000489b:	call   0x140003bf0
   1400048a0:	jmp    0x140004690
   1400048a5:	lea    rdx,[rbp-0x30]
   1400048a9:	mov    ecx,0x25
   1400048ae:	mov    r15,r12
   1400048b1:	call   0x140002750
   1400048b6:	jmp    0x1400042d6
   1400048bb:	test   ebx,ebx
   1400048bd:	jne    0x140004380
   1400048c3:	lea    r9,[rbp-0x40]
   1400048c7:	mov    QWORD PTR [rbp-0x88],r10
   1400048ce:	mov    DWORD PTR [rbp-0x70],r11d
   1400048d2:	or     DWORD PTR [rbp-0x28],0x1000
   1400048d9:	mov    QWORD PTR [rbp-0x80],r9
   1400048dd:	mov    DWORD PTR [rbp-0x40],0x0
   1400048e4:	call   0x140007a88
   1400048e9:	mov    r9,QWORD PTR [rbp-0x80]
   1400048ed:	lea    rcx,[rbp-0x42]
   1400048f1:	mov    r8d,0x10
   1400048f7:	mov    rdx,QWORD PTR [rax+0x8]
   1400048fb:	call   0x1400077d0
   140004900:	mov    r11d,DWORD PTR [rbp-0x70]
   140004904:	mov    r10,QWORD PTR [rbp-0x88]
   14000490b:	test   eax,eax
   14000490d:	jle    0x140004917
   14000490f:	movzx  edx,WORD PTR [rbp-0x42]
   140004913:	mov    WORD PTR [rbp-0x10],dx
   140004917:	movzx  edx,BYTE PTR [rsi+0x1]
   14000491b:	mov    DWORD PTR [rbp-0x14],eax
   14000491e:	mov    rsi,r12
   140004921:	jmp    0x140004387
   140004926:	test   r10,r10
   140004929:	je     0x140004728
   14000492f:	test   ebx,0xfffffffd
   140004935:	jne    0x140004a56
   14000493b:	mov    eax,DWORD PTR [r14]
   14000493e:	lea    rcx,[r14+0x8]
   140004942:	mov    DWORD PTR [r10],eax
   140004945:	test   eax,eax
   140004947:	js     0x140004bb4
   14000494d:	movzx  edx,BYTE PTR [rsi+0x1]
   140004951:	mov    r14,rcx
   140004954:	mov    rsi,r12
   140004957:	xor    r10d,r10d
   14000495a:	jmp    0x140004387
   14000495f:	test   ebx,ebx
   140004961:	jne    0x140004380
   140004967:	movzx  edx,BYTE PTR [rsi+0x1]
   14000496b:	or     DWORD PTR [rbp-0x28],0x100
   140004972:	mov    rsi,r12
   140004975:	jmp    0x140004387
   14000497a:	test   ebx,ebx
   14000497c:	jne    0x140004380
   140004982:	movzx  edx,BYTE PTR [rsi+0x1]
   140004986:	or     DWORD PTR [rbp-0x28],0x800
   14000498d:	mov    rsi,r12
   140004990:	jmp    0x140004387
   140004995:	mov    edx,ecx
   140004997:	mov    rax,QWORD PTR [rbp-0x80]
   14000499b:	and    dx,0x7fff
   1400049a0:	je     0x140004b94
   1400049a6:	cmp    dx,0x3c00
   1400049ab:	jg     0x140004aae
   1400049b1:	movsx  r8d,dx
   1400049b5:	mov    ecx,0x3c01
   1400049ba:	sub    ecx,r8d
   1400049bd:	shr    rax,cl
   1400049c0:	add    ecx,edx
   1400049c2:	lea    edx,[rcx-0x3ffc]
   1400049c8:	shr    rax,0x3
   1400049cc:	mov    rcx,rax
   1400049cf:	lea    r8,[rbp-0x30]
   1400049d3:	call   0x140003d50
   1400049d8:	jmp    0x140004690
   1400049dd:	lea    rsi,[r14+0x8]
   1400049e1:	mov    r14,QWORD PTR [r14]
   1400049e4:	lea    rax,[rip+0x4aed]        # 0x1400094d8
   1400049eb:	test   r14,r14
   1400049ee:	cmove  r14,rax
   1400049f2:	mov    eax,DWORD PTR [rbp-0x20]
   1400049f5:	test   eax,eax
   1400049f7:	js     0x140004b26
   1400049fd:	movsxd rdx,eax
   140004a00:	mov    rcx,r14
   140004a03:	call   0x140007310
   140004a08:	lea    r8,[rbp-0x30]
   140004a0c:	mov    rcx,r14
   140004a0f:	mov    edx,eax
   140004a11:	call   0x1400027b0
   140004a16:	mov    r14,rsi
   140004a19:	mov    r15,r12
   140004a1c:	jmp    0x1400042d6
   140004a21:	cmp    ebx,0x3
   140004a24:	ja     0x14000454a
   140004a2a:	mov    ecx,0x30
   140004a2f:	cmp    ebx,0x2
   140004a32:	mov    eax,0x3
   140004a37:	cmove  ebx,eax
   140004a3a:	jmp    0x140004362
   140004a3f:	lea    r8,[rbp-0x30]
   140004a43:	lea    rdx,[rip+0x4a9c]        # 0x1400094e6
   140004a4a:	xor    ecx,ecx
   140004a4c:	call   0x140002af0
   140004a51:	jmp    0x140004690
   140004a56:	movzx  edx,BYTE PTR [rsi+0x1]
   140004a5a:	xor    r10d,r10d
   140004a5d:	mov    rsi,r12
   140004a60:	mov    ebx,0x4
   140004a65:	jmp    0x140004387
   140004a6a:	test   r8,r8
   140004a6d:	mov    eax,0xffffc002
   140004a72:	mov    rcx,r8
   140004a75:	cmovne edx,eax
   140004a78:	jmp    0x1400049cf
   140004a7d:	mov    rsi,r12
   140004a80:	mov    r11d,0x3
   140004a86:	mov    ebx,0x4
   140004a8b:	jmp    0x140004387
   140004a90:	or     al,0x80
   140004a92:	mov    DWORD PTR [rbp-0x28],eax
   140004a95:	jmp    0x1400045d6
   140004a9a:	mov    eax,edi
   140004a9c:	mov    DWORD PTR [rbp-0x20],0x10
   140004aa3:	or     ah,0x2
   140004aa6:	mov    DWORD PTR [rbp-0x28],eax
   140004aa9:	jmp    0x14000447c
   140004aae:	test   dx,dx
   140004ab1:	je     0x140004b94
   140004ab7:	mov    ecx,edx
   140004ab9:	jmp    0x1400049c2
   140004abe:	xchg   ax,ax
   140004ac0:	movsx  rcx,cx
   140004ac4:	jmp    0x14000445b
   140004ac9:	mov    QWORD PTR [rcx],rdx
   140004acc:	jmp    0x140004690
   140004ad1:	sub    ecx,0x30
   140004ad4:	movzx  edx,BYTE PTR [rsi+0x1]
   140004ad8:	mov    rsi,r12
   140004adb:	mov    DWORD PTR [r10],ecx
   140004ade:	jmp    0x140004387
   140004ae3:	movzx  edx,BYTE PTR [rsi+0x1]
   140004ae7:	mov    DWORD PTR [rbp-0x20],0x0
   140004aee:	mov    rsi,r12
   140004af1:	lea    r10,[rbp-0x20]
   140004af5:	mov    ebx,0x2
   140004afa:	jmp    0x140004387
   140004aff:	mov    rax,QWORD PTR [r14]
   140004b02:	jmp    0x1400043e8
   140004b07:	movzx  edx,BYTE PTR [rsi+0x2]
   140004b0b:	mov    r11d,0x5
   140004b11:	add    rsi,0x2
   140004b15:	mov    ebx,0x4
   140004b1a:	jmp    0x140004387
   140004b1f:	mov    BYTE PTR [rcx],dl
   140004b21:	jmp    0x140004690
   140004b26:	mov    rcx,r14
   140004b29:	call   0x140007ad8
   140004b2e:	lea    r8,[rbp-0x30]
   140004b32:	mov    rcx,r14
   140004b35:	mov    edx,eax
   140004b37:	call   0x1400027b0
   140004b3c:	jmp    0x140004a16
   140004b41:	lea    rdx,[rbp-0x30]
   140004b45:	mov    rcx,rax
   140004b48:	call   0x1400030b0
   140004b4d:	jmp    0x140004690
   140004b52:	mov    rcx,QWORD PTR [r14]
   140004b55:	jmp    0x14000445b
   140004b5a:	cmp    BYTE PTR [rsi+0x2],0x34
   140004b5e:	jne    0x14000454a
   140004b64:	movzx  edx,BYTE PTR [rsi+0x3]
   140004b68:	mov    r11d,0x3
   140004b6e:	add    rsi,0x3
   140004b72:	mov    ebx,0x4
   140004b77:	jmp    0x140004387
   140004b7c:	movzx  edx,BYTE PTR [rsi+0x2]
   140004b80:	mov    r11d,0x3
   140004b86:	add    rsi,0x2
   140004b8a:	mov    ebx,0x4
   140004b8f:	jmp    0x140004387
   140004b94:	test   rax,rax
   140004b97:	mov    ecx,0xfffffc05
   140004b9c:	cmovne edx,ecx
   140004b9f:	jmp    0x1400049c8
   140004ba4:	mov    WORD PTR [rcx],dx
   140004ba7:	jmp    0x140004690
   140004bac:	mov    eax,DWORD PTR [r14]
   140004baf:	jmp    0x1400043e8
   140004bb4:	test   ebx,ebx
   140004bb6:	jne    0x140004bdf
   140004bb8:	or     DWORD PTR [rbp-0x28],0x400
   140004bbf:	neg    DWORD PTR [rbp-0x24]
   140004bc2:	jmp    0x14000494d
   140004bc7:	movzx  edx,BYTE PTR [rsi+0x3]
   140004bcb:	mov    r11d,0x2
   140004bd1:	add    rsi,0x3
   140004bd5:	mov    ebx,0x4
   140004bda:	jmp    0x140004387
   140004bdf:	movzx  edx,BYTE PTR [rsi+0x1]
   140004be3:	mov    r14,rcx
   140004be6:	mov    rsi,r12
   140004be9:	xor    r10d,r10d
   140004bec:	mov    DWORD PTR [rbp-0x20],0xffffffff
   140004bf3:	mov    ebx,0x2
   140004bf8:	jmp    0x140004387
   140004bfd:	mov    ecx,r11d
   140004c00:	lea    r8,[rbp-0x30]
   140004c04:	lea    rdx,[rip+0x48df]        # 0x1400094ea
   140004c0b:	and    ecx,0x8000
   140004c11:	call   0x140002af0
   140004c16:	jmp    0x140004690
   140004c1b:	nop
   140004c1c:	nop
   140004c1d:	nop
   140004c1e:	nop
   140004c1f:	nop
   140004c20:	push   rbp
   140004c21:	push   rbx
   140004c22:	sub    rsp,0x28
   140004c26:	lea    rbp,[rsp+0x20]
   140004c2b:	xor    ebx,ebx
   140004c2d:	cmp    ecx,0x1b
   140004c30:	jle    0x140004c4c
   140004c32:	mov    eax,0x4
   140004c37:	nop    WORD PTR [rax+rax*1+0x0]
   140004c40:	add    eax,eax
   140004c42:	add    ebx,0x1
   140004c45:	lea    edx,[rax+0x17]
   140004c48:	cmp    edx,ecx
   140004c4a:	jl     0x140004c40
   140004c4c:	mov    ecx,ebx
   140004c4e:	call   0x140006740
   140004c53:	mov    DWORD PTR [rax],ebx
   140004c55:	add    rax,0x4
   140004c59:	add    rsp,0x28
   140004c5d:	pop    rbx
   140004c5e:	pop    rbp
   140004c5f:	ret
   140004c60:	push   rbp
   140004c61:	push   rdi
   140004c62:	push   rsi
   140004c63:	push   rbx
   140004c64:	sub    rsp,0x28
   140004c68:	lea    rbp,[rsp+0x20]
   140004c6d:	mov    rdi,rcx
   140004c70:	mov    rsi,rdx
   140004c73:	cmp    r8d,0x1b
   140004c77:	jle    0x140004cd8
   140004c79:	mov    eax,0x4
   140004c7e:	xor    ebx,ebx
   140004c80:	add    eax,eax
   140004c82:	add    ebx,0x1
   140004c85:	lea    edx,[rax+0x17]
   140004c88:	cmp    r8d,edx
   140004c8b:	jg     0x140004c80
   140004c8d:	mov    ecx,ebx
   140004c8f:	call   0x140006740
   140004c94:	lea    rdx,[rdi+0x1]
   140004c98:	mov    DWORD PTR [rax],ebx
   140004c9a:	movzx  ecx,BYTE PTR [rdi]
   140004c9d:	lea    r8,[rax+0x4]
   140004ca1:	mov    BYTE PTR [rax+0x4],cl
   140004ca4:	mov    rax,r8
   140004ca7:	test   cl,cl
   140004ca9:	je     0x140004cc1
   140004cab:	nop    DWORD PTR [rax+rax*1+0x0]
   140004cb0:	movzx  ecx,BYTE PTR [rdx]
   140004cb3:	add    rax,0x1
   140004cb7:	add    rdx,0x1
   140004cbb:	mov    BYTE PTR [rax],cl
   140004cbd:	test   cl,cl
   140004cbf:	jne    0x140004cb0
   140004cc1:	test   rsi,rsi
   140004cc4:	je     0x140004cc9
   140004cc6:	mov    QWORD PTR [rsi],rax
   140004cc9:	mov    rax,r8
   140004ccc:	add    rsp,0x28
   140004cd0:	pop    rbx
   140004cd1:	pop    rsi
   140004cd2:	pop    rdi
   140004cd3:	pop    rbp
   140004cd4:	ret
   140004cd5:	nop    DWORD PTR [rax]
   140004cd8:	xor    ebx,ebx
   140004cda:	jmp    0x140004c8d
   140004cdc:	nop    DWORD PTR [rax+0x0]
   140004ce0:	mov    edx,0x1
   140004ce5:	mov    rax,rcx
   140004ce8:	mov    ecx,DWORD PTR [rcx-0x4]
   140004ceb:	shl    edx,cl
   140004ced:	movd   xmm0,ecx
   140004cf1:	lea    rcx,[rax-0x4]
   140004cf5:	movd   xmm1,edx
   140004cf9:	punpckldq xmm0,xmm1
   140004cfd:	movq   QWORD PTR [rax+0x4],xmm0
   140004d02:	jmp    0x140006840
   140004d07:	nop    WORD PTR [rax+rax*1+0x0]
   140004d10:	push   rbp
   140004d11:	push   r15
   140004d13:	push   r14
   140004d15:	push   r13
   140004d17:	push   r12
   140004d19:	push   rdi
   140004d1a:	push   rsi
   140004d1b:	push   rbx
   140004d1c:	sub    rsp,0x38
   140004d20:	lea    rbp,[rsp+0x30]
   140004d25:	xor    eax,eax
   140004d27:	mov    esi,DWORD PTR [rdx+0x14]
   140004d2a:	mov    r13,rcx
   140004d2d:	mov    r11,rdx
   140004d30:	cmp    DWORD PTR [rcx+0x14],esi
   140004d33:	jl     0x140004e23
   140004d39:	sub    esi,0x1
   140004d3c:	lea    rbx,[rdx+0x18]
   140004d40:	lea    r12,[rcx+0x18]
   140004d44:	xor    edx,edx
   140004d46:	movsxd r10,esi
   140004d49:	shl    r10,0x2
   140004d4d:	lea    rdi,[rbx+r10*1]
   140004d51:	add    r10,r12
   140004d54:	mov    eax,DWORD PTR [rdi]
   140004d56:	mov    r8d,DWORD PTR [r10]
   140004d59:	lea    ecx,[rax+0x1]
   140004d5c:	mov    eax,r8d
   140004d5f:	div    ecx
   140004d61:	mov    DWORD PTR [rbp-0x8],eax
   140004d64:	mov    DWORD PTR [rbp-0x4],eax
   140004d67:	cmp    r8d,ecx
   140004d6a:	jb     0x140004dc6
   140004d6c:	mov    r15d,eax
   140004d6f:	mov    r9,rbx
   140004d72:	mov    r8,r12
   140004d75:	xor    r14d,r14d
   140004d78:	xor    ecx,ecx
   140004d7a:	nop    WORD PTR [rax+rax*1+0x0]
   140004d80:	mov    eax,DWORD PTR [r9]
   140004d83:	mov    edx,DWORD PTR [r8]
   140004d86:	add    r9,0x4
   140004d8a:	add    r8,0x4
   140004d8e:	imul   rax,r15
   140004d92:	add    rax,r14
   140004d95:	mov    r14,rax
   140004d98:	mov    eax,eax
   140004d9a:	sub    rdx,rax
   140004d9d:	shr    r14,0x20
   140004da1:	mov    rax,rdx
   140004da4:	sub    rax,rcx
   140004da7:	mov    rcx,rax
   140004daa:	mov    DWORD PTR [r8-0x4],eax
   140004dae:	shr    rcx,0x20
   140004db2:	and    ecx,0x1
   140004db5:	cmp    rdi,r9
   140004db8:	jae    0x140004d80
   140004dba:	mov    r9d,DWORD PTR [r10]
   140004dbd:	test   r9d,r9d
   140004dc0:	je     0x140004e6b
   140004dc6:	mov    rdx,r11
   140004dc9:	mov    rcx,r13
   140004dcc:	call   0x140006e60
   140004dd1:	test   eax,eax
   140004dd3:	js     0x140004e20
   140004dd5:	mov    rcx,r12
   140004dd8:	xor    edx,edx
   140004dda:	nop    WORD PTR [rax+rax*1+0x0]
   140004de0:	mov    eax,DWORD PTR [rcx]
   140004de2:	mov    r8d,DWORD PTR [rbx]
   140004de5:	add    rbx,0x4
   140004de9:	add    rcx,0x4
   140004ded:	sub    rax,r8
   140004df0:	sub    rax,rdx
   140004df3:	mov    rdx,rax
   140004df6:	mov    DWORD PTR [rcx-0x4],eax
   140004df9:	shr    rdx,0x20
   140004dfd:	and    edx,0x1
   140004e00:	cmp    rdi,rbx
   140004e03:	jae    0x140004de0
   140004e05:	movsxd rax,esi
   140004e08:	lea    rax,[r12+rax*4]
   140004e0c:	mov    ecx,DWORD PTR [rax]
   140004e0e:	test   ecx,ecx
   140004e10:	je     0x140004e41
   140004e12:	mov    eax,DWORD PTR [rbp-0x8]
   140004e15:	add    eax,0x1
   140004e18:	mov    DWORD PTR [rbp-0x4],eax
   140004e1b:	nop    DWORD PTR [rax+rax*1+0x0]
   140004e20:	mov    eax,DWORD PTR [rbp-0x4]
   140004e23:	add    rsp,0x38
   140004e27:	pop    rbx
   140004e28:	pop    rsi
   140004e29:	pop    rdi
   140004e2a:	pop    r12
   140004e2c:	pop    r13
   140004e2e:	pop    r14
   140004e30:	pop    r15
   140004e32:	pop    rbp
   140004e33:	ret
   140004e34:	nop    DWORD PTR [rax+0x0]
   140004e38:	mov    edx,DWORD PTR [rax]
   140004e3a:	test   edx,edx
   140004e3c:	jne    0x140004e4a
   140004e3e:	sub    esi,0x1
   140004e41:	sub    rax,0x4
   140004e45:	cmp    r12,rax
   140004e48:	jb     0x140004e38
   140004e4a:	mov    eax,DWORD PTR [rbp-0x8]
   140004e4d:	mov    DWORD PTR [r13+0x14],esi
   140004e51:	add    eax,0x1
   140004e54:	mov    DWORD PTR [rbp-0x4],eax
   140004e57:	jmp    0x140004e20
   140004e59:	nop    DWORD PTR [rax+0x0]
   140004e60:	mov    r8d,DWORD PTR [r10]
   140004e63:	test   r8d,r8d
   140004e66:	jne    0x140004e74
   140004e68:	sub    esi,0x1
   140004e6b:	sub    r10,0x4
   140004e6f:	cmp    r12,r10
   140004e72:	jb     0x140004e60
   140004e74:	mov    DWORD PTR [r13+0x14],esi
   140004e78:	mov    rdx,r11
   140004e7b:	mov    rcx,r13
   140004e7e:	call   0x140006e60
   140004e83:	test   eax,eax
   140004e85:	jns    0x140004dd5
   140004e8b:	jmp    0x140004e20
   140004e8d:	nop
   140004e8e:	nop
   140004e8f:	nop
   140004e90:	push   rbp
   140004e91:	push   r15
   140004e93:	push   r14
   140004e95:	push   r13
   140004e97:	push   r12
   140004e99:	push   rdi
   140004e9a:	push   rsi
   140004e9b:	push   rbx
   140004e9c:	sub    rsp,0xc8
   140004ea3:	lea    rbp,[rsp+0xc0]
   140004eab:	mov    eax,DWORD PTR [rbp+0x70]
   140004eae:	mov    edi,DWORD PTR [r9]
   140004eb1:	mov    DWORD PTR [rbp-0x28],eax
   140004eb4:	mov    eax,DWORD PTR [rbp+0x78]
   140004eb7:	mov    r12,rcx
   140004eba:	mov    rsi,r8
   140004ebd:	mov    DWORD PTR [rbp-0x30],edx
   140004ec0:	mov    r15,r9
   140004ec3:	mov    DWORD PTR [rbp-0x34],eax
   140004ec6:	mov    rax,QWORD PTR [rbp+0x80]
   140004ecd:	mov    QWORD PTR [rbp-0x18],rax
   140004ed1:	mov    rax,QWORD PTR [rbp+0x88]
   140004ed8:	mov    QWORD PTR [rbp-0x20],rax
   140004edc:	mov    eax,edi
   140004ede:	and    eax,0xffffffcf
   140004ee1:	mov    DWORD PTR [r9],eax
   140004ee4:	mov    eax,edi
   140004ee6:	and    eax,0x7
   140004ee9:	cmp    eax,0x3
   140004eec:	je     0x1400051b8
   140004ef2:	mov    ebx,edi
   140004ef4:	and    ebx,0x4
   140004ef7:	mov    DWORD PTR [rbp-0x40],ebx
   140004efa:	jne    0x140005130
   140004f00:	test   eax,eax
   140004f02:	je     0x140005178
   140004f08:	mov    r13d,DWORD PTR [rcx]
   140004f0b:	mov    eax,0x20
   140004f10:	xor    ecx,ecx
   140004f12:	cmp    r13d,0x20
   140004f16:	jle    0x140004f2a
   140004f18:	nop    DWORD PTR [rax+rax*1+0x0]
   140004f20:	add    eax,eax
   140004f22:	add    ecx,0x1
   140004f25:	cmp    r13d,eax
   140004f28:	jg     0x140004f20
   140004f2a:	call   0x140006740
   140004f2f:	lea    r8d,[r13-0x1]
   140004f33:	sar    r8d,0x5
   140004f37:	mov    rbx,rax
   140004f3a:	lea    rdx,[rax+0x18]
   140004f3e:	mov    rax,rsi
   140004f41:	movsxd r8,r8d
   140004f44:	lea    rcx,[rsi+r8*4]
   140004f48:	nop    DWORD PTR [rax+rax*1+0x0]
   140004f50:	mov    r9d,DWORD PTR [rax]
   140004f53:	add    rax,0x4
   140004f57:	add    rdx,0x4
   140004f5b:	mov    DWORD PTR [rdx-0x4],r9d
   140004f5f:	cmp    rcx,rax
   140004f62:	jae    0x140004f50
   140004f64:	lea    rdx,[rsi+0x1]
   140004f68:	add    rcx,0x1
   140004f6c:	lea    rax,[r8*4+0x4]
   140004f74:	cmp    rcx,rdx
   140004f77:	mov    edx,0x4
   140004f7c:	cmovb  rax,rdx
   140004f80:	mov    r14,rax
   140004f83:	add    rax,rbx
   140004f86:	sar    r14,0x2
   140004f8a:	jmp    0x140004f9d
   140004f8c:	nop    DWORD PTR [rax+0x0]
   140004f90:	sub    rax,0x4
   140004f94:	test   r14d,r14d
   140004f97:	je     0x1400051e0
   140004f9d:	mov    r11d,DWORD PTR [rax+0x14]
   140004fa1:	mov    edx,r14d
   140004fa4:	sub    r14d,0x1
   140004fa8:	test   r11d,r11d
   140004fab:	je     0x140004f90
   140004fad:	movsxd r14,r14d
   140004fb0:	mov    DWORD PTR [rbx+0x14],edx
   140004fb3:	shl    edx,0x5
   140004fb6:	bsr    eax,DWORD PTR [rbx+r14*4+0x18]
   140004fbc:	xor    eax,0x1f
   140004fbf:	sub    edx,eax
   140004fc1:	mov    r14d,edx
   140004fc4:	mov    rcx,rbx
   140004fc7:	call   0x1400065c0
   140004fcc:	mov    ecx,DWORD PTR [rbp-0x30]
   140004fcf:	mov    DWORD PTR [rbp-0x4],eax
   140004fd2:	mov    DWORD PTR [rbp-0x58],ecx
   140004fd5:	test   eax,eax
   140004fd7:	jne    0x1400051f0
   140004fdd:	mov    r10d,DWORD PTR [rbx+0x14]
   140004fe1:	test   r10d,r10d
   140004fe4:	je     0x140005170
   140004fea:	lea    rdx,[rbp-0x4]
   140004fee:	mov    rcx,rbx
   140004ff1:	call   0x140007080
   140004ff6:	mov    eax,DWORD PTR [rbp-0x58]
   140004ff9:	pxor   xmm1,xmm1
   140004ffd:	movq   r10,xmm0
   140005002:	mov    rdx,r10
   140005005:	lea    r8d,[rax+r14*1]
   140005009:	mov    eax,r10d
   14000500c:	shr    rdx,0x20
   140005010:	lea    ecx,[r8-0x1]
   140005014:	and    edx,0xfffff
   14000501a:	cvtsi2sd xmm1,ecx
   14000501e:	mulsd  xmm1,QWORD PTR [rip+0x4662]        # 0x140009688
   140005026:	or     edx,0x3ff00000
   14000502c:	mov    r9,rdx
   14000502f:	shl    r9,0x20
   140005033:	or     rax,r9
   140005036:	mov    r9d,0x1
   14000503c:	sub    r9d,r8d
   14000503f:	movq   xmm0,rax
   140005044:	test   ecx,ecx
   140005046:	subsd  xmm0,QWORD PTR [rip+0x4622]        # 0x140009670
   14000504e:	mulsd  xmm0,QWORD PTR [rip+0x4622]        # 0x140009678
   140005056:	cmovns r9d,ecx
   14000505a:	addsd  xmm0,QWORD PTR [rip+0x461e]        # 0x140009680
   140005062:	sub    r9d,0x435
   140005069:	addsd  xmm0,xmm1
   14000506d:	test   r9d,r9d
   140005070:	jle    0x140005087
   140005072:	pxor   xmm1,xmm1
   140005076:	cvtsi2sd xmm1,r9d
   14000507b:	mulsd  xmm1,QWORD PTR [rip+0x460d]        # 0x140009690
   140005083:	addsd  xmm0,xmm1
   140005087:	pxor   xmm1,xmm1
   14000508b:	cvttsd2si r11d,xmm0
   140005090:	comisd xmm1,xmm0
   140005094:	ja     0x140005540
   14000509a:	mov    r9d,ecx
   14000509d:	mov    eax,eax
   14000509f:	shl    r9d,0x14
   1400050a3:	add    edx,r9d
   1400050a6:	mov    edx,edx
   1400050a8:	shl    rdx,0x20
   1400050ac:	or     rax,rdx
   1400050af:	mov    QWORD PTR [rbp-0x98],rax
   1400050b6:	mov    r9,rax
   1400050b9:	mov    r10,rax
   1400050bc:	mov    eax,r14d
   1400050bf:	sub    eax,ecx
   1400050c1:	lea    edx,[rax-0x1]
   1400050c4:	mov    DWORD PTR [rbp-0x50],edx
   1400050c7:	cmp    r11d,0x16
   1400050cb:	ja     0x140005210
   1400050d1:	mov    rcx,QWORD PTR [rip+0x4898]        # 0x140009970
   1400050d8:	movsxd rdx,r11d
   1400050db:	movq   xmm5,r9
   1400050e0:	movsd  xmm0,QWORD PTR [rcx+rdx*8]
   1400050e5:	comisd xmm0,xmm5
   1400050e9:	ja     0x1400055a0
   1400050ef:	mov    DWORD PTR [rbp-0x7c],0x0
   1400050f6:	mov    DWORD PTR [rbp-0x68],0x0
   1400050fd:	test   eax,eax
   1400050ff:	jg     0x140005118
   140005101:	mov    edx,0x1
   140005106:	mov    DWORD PTR [rbp-0x50],0x0
   14000510d:	sub    edx,eax
   14000510f:	mov    DWORD PTR [rbp-0x68],edx
   140005112:	nop    WORD PTR [rax+rax*1+0x0]
   140005118:	add    DWORD PTR [rbp-0x50],r11d
   14000511c:	mov    DWORD PTR [rbp-0x70],r11d
   140005120:	mov    DWORD PTR [rbp-0x74],0x0
   140005127:	jmp    0x140005254
   14000512c:	nop    DWORD PTR [rax+0x0]
   140005130:	xor    esi,esi
   140005132:	cmp    eax,0x4
   140005135:	jne    0x14000519b
   140005137:	mov    rax,QWORD PTR [rbp-0x18]
   14000513b:	mov    rdx,QWORD PTR [rbp-0x20]
   14000513f:	mov    r8d,0x3
   140005145:	lea    rcx,[rip+0x451d]        # 0x140009669
   14000514c:	mov    DWORD PTR [rax],0xffff8000
   140005152:	add    rsp,0xc8
   140005159:	pop    rbx
   14000515a:	pop    rsi
   14000515b:	pop    rdi
   14000515c:	pop    r12
   14000515e:	pop    r13
   140005160:	pop    r14
   140005162:	pop    r15
   140005164:	pop    rbp
   140005165:	jmp    0x140004c60
   14000516a:	nop    WORD PTR [rax+rax*1+0x0]
   140005170:	mov    rcx,rbx
   140005173:	call   0x140006840
   140005178:	mov    rax,QWORD PTR [rbp-0x18]
   14000517c:	mov    rdx,QWORD PTR [rbp-0x20]
   140005180:	mov    r8d,0x1
   140005186:	lea    rcx,[rip+0x44e0]        # 0x14000966d
   14000518d:	mov    DWORD PTR [rax],0x1
   140005193:	call   0x140004c60
   140005198:	mov    rsi,rax
   14000519b:	mov    rax,rsi
   14000519e:	add    rsp,0xc8
   1400051a5:	pop    rbx
   1400051a6:	pop    rsi
   1400051a7:	pop    rdi
   1400051a8:	pop    r12
   1400051aa:	pop    r13
   1400051ac:	pop    r14
   1400051ae:	pop    r15
   1400051b0:	pop    rbp
   1400051b1:	ret
   1400051b2:	nop    WORD PTR [rax+rax*1+0x0]
   1400051b8:	mov    rax,QWORD PTR [rbp-0x18]
   1400051bc:	mov    rdx,QWORD PTR [rbp-0x20]
   1400051c0:	mov    r8d,0x8
   1400051c6:	lea    rcx,[rip+0x4493]        # 0x140009660
   1400051cd:	mov    DWORD PTR [rax],0xffff8000
   1400051d3:	jmp    0x140005152
   1400051d8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400051e0:	mov    DWORD PTR [rbx+0x14],0x0
   1400051e7:	jmp    0x140004fc4
   1400051ec:	nop    DWORD PTR [rax+0x0]
   1400051f0:	mov    edx,eax
   1400051f2:	mov    rcx,rbx
   1400051f5:	call   0x1400064b0
   1400051fa:	mov    eax,DWORD PTR [rbp-0x4]
   1400051fd:	mov    edx,DWORD PTR [rbp-0x30]
   140005200:	add    edx,eax
   140005202:	sub    r14d,eax
   140005205:	mov    DWORD PTR [rbp-0x58],edx
   140005208:	jmp    0x140004fdd
   14000520d:	nop    DWORD PTR [rax]
   140005210:	mov    DWORD PTR [rbp-0x7c],0x1
   140005217:	mov    r9d,DWORD PTR [rbp-0x50]
   14000521b:	mov    DWORD PTR [rbp-0x68],0x0
   140005222:	test   r9d,r9d
   140005225:	jns    0x140005238
   140005227:	mov    edx,0x1
   14000522c:	mov    DWORD PTR [rbp-0x50],0x0
   140005233:	sub    edx,eax
   140005235:	mov    DWORD PTR [rbp-0x68],edx
   140005238:	test   r11d,r11d
   14000523b:	jns    0x140005118
   140005241:	mov    eax,r11d
   140005244:	sub    DWORD PTR [rbp-0x68],r11d
   140005248:	neg    eax
   14000524a:	mov    DWORD PTR [rbp-0x70],r11d
   14000524e:	xor    r11d,r11d
   140005251:	mov    DWORD PTR [rbp-0x74],eax
   140005254:	mov    eax,DWORD PTR [rbp-0x28]
   140005257:	cmp    eax,0x9
   14000525a:	ja     0x1400054b0
   140005260:	cmp    eax,0x5
   140005263:	jg     0x140005560
   140005269:	add    r8d,0x3fd
   140005270:	xor    eax,eax
   140005272:	cmp    r8d,0x7f7
   140005279:	setbe  al
   14000527c:	mov    DWORD PTR [rbp-0x8c],eax
   140005282:	mov    eax,DWORD PTR [rbp-0x28]
   140005285:	cmp    eax,0x4
   140005288:	je     0x1400058d4
   14000528e:	cmp    eax,0x5
   140005291:	je     0x140005cef
   140005297:	mov    DWORD PTR [rbp-0x78],0x0
   14000529e:	cmp    eax,0x2
   1400052a1:	je     0x1400058db
   1400052a7:	cmp    eax,0x3
   1400052aa:	jne    0x1400054d0
   1400052b0:	mov    ecx,DWORD PTR [rbp-0x34]
   1400052b3:	mov    eax,DWORD PTR [rbp-0x70]
   1400052b6:	add    eax,ecx
   1400052b8:	lea    edx,[rax+0x1]
   1400052bb:	mov    DWORD PTR [rbp-0x90],eax
   1400052c1:	mov    eax,0x1
   1400052c6:	test   edx,edx
   1400052c8:	mov    DWORD PTR [rbp-0x48],edx
   1400052cb:	cmovg  eax,edx
   1400052ce:	mov    ecx,eax
   1400052d0:	mov    QWORD PTR [rbp-0x88],r10
   1400052d7:	mov    DWORD PTR [rbp-0x80],r11d
   1400052db:	mov    DWORD PTR [rbp-0x4],eax
   1400052de:	call   0x140004c20
   1400052e3:	mov    r11d,DWORD PTR [rbp-0x80]
   1400052e7:	mov    r10,QWORD PTR [rbp-0x88]
   1400052ee:	mov    QWORD PTR [rbp-0x60],rax
   1400052f2:	mov    eax,DWORD PTR [r12+0xc]
   1400052f7:	sub    eax,0x1
   1400052fa:	mov    DWORD PTR [rbp-0x38],eax
   1400052fd:	je     0x140005324
   1400052ff:	mov    ecx,DWORD PTR [rbp-0x38]
   140005302:	mov    eax,0x2
   140005307:	test   ecx,ecx
   140005309:	cmovns eax,ecx
   14000530c:	and    edi,0x8
   14000530f:	mov    DWORD PTR [rbp-0x38],eax
   140005312:	mov    edx,eax
   140005314:	je     0x1400056f0
   14000531a:	mov    eax,0x3
   14000531f:	sub    eax,edx
   140005321:	mov    DWORD PTR [rbp-0x38],eax
   140005324:	mov    ecx,DWORD PTR [rbp-0x48]
   140005327:	movzx  edi,BYTE PTR [rbp-0x8c]
   14000532e:	cmp    ecx,0xe
   140005331:	setbe  al
   140005334:	and    dil,al
   140005337:	je     0x1400056f0
   14000533d:	mov    eax,DWORD PTR [rbp-0x70]
   140005340:	or     eax,DWORD PTR [rbp-0x38]
   140005343:	jne    0x1400056f0
   140005349:	mov    r8d,DWORD PTR [rbp-0x7c]
   14000534d:	mov    DWORD PTR [rbp-0x4],0x0
   140005354:	movsd  xmm0,QWORD PTR [rbp-0x98]
   14000535c:	test   r8d,r8d
   14000535f:	je     0x140005373
   140005361:	movsd  xmm4,QWORD PTR [rip+0x4337]        # 0x1400096a0
   140005369:	comisd xmm4,xmm0
   14000536d:	ja     0x1400060dd
   140005373:	movupd xmm1,xmm0
   140005377:	mov    ecx,DWORD PTR [rbp-0x48]
   14000537a:	addsd  xmm1,xmm0
   14000537e:	addsd  xmm1,QWORD PTR [rip+0x4332]        # 0x1400096b8
   140005386:	movq   rdx,xmm1
   14000538b:	mov    rax,rdx
   14000538e:	mov    edx,edx
   140005390:	shr    rax,0x20
   140005394:	sub    eax,0x3400000
   140005399:	shl    rax,0x20
   14000539d:	or     rdx,rax
   1400053a0:	test   ecx,ecx
   1400053a2:	je     0x1400056bf
   1400053a8:	mov    eax,DWORD PTR [rbp-0x48]
   1400053ab:	xor    r8d,r8d
   1400053ae:	mov    rcx,QWORD PTR [rip+0x45bb]        # 0x140009970
   1400053b5:	movq   xmm2,rdx
   1400053ba:	lea    edx,[rax-0x1]
   1400053bd:	movsxd rdx,edx
   1400053c0:	movsd  xmm3,QWORD PTR [rcx+rdx*8]
   1400053c5:	mov    edx,DWORD PTR [rbp-0x78]
   1400053c8:	test   edx,edx
   1400053ca:	je     0x140005cfb
   1400053d0:	movsd  xmm1,QWORD PTR [rip+0x4308]        # 0x1400096e0
   1400053d8:	cvttsd2si ecx,xmm0
   1400053dc:	mov    rdi,QWORD PTR [rbp-0x60]
   1400053e0:	divsd  xmm1,xmm3
   1400053e4:	lea    rdx,[rdi+0x1]
   1400053e8:	subsd  xmm1,xmm2
   1400053ec:	pxor   xmm2,xmm2
   1400053f0:	cvtsi2sd xmm2,ecx
   1400053f4:	add    ecx,0x30
   1400053f7:	mov    BYTE PTR [rdi],cl
   1400053f9:	subsd  xmm0,xmm2
   1400053fd:	comisd xmm1,xmm0
   140005401:	ja     0x1400062dd
   140005407:	movsd  xmm4,QWORD PTR [rip+0x4291]        # 0x1400096a0
   14000540f:	movsd  xmm3,QWORD PTR [rip+0x4291]        # 0x1400096a8
   140005417:	jmp    0x14000545d
   140005419:	nop    DWORD PTR [rax+0x0]
   140005420:	mov    edi,DWORD PTR [rbp-0x4]
   140005423:	lea    ecx,[rdi+0x1]
   140005426:	mov    DWORD PTR [rbp-0x4],ecx
   140005429:	cmp    ecx,eax
   14000542b:	jge    0x1400056e8
   140005431:	mulsd  xmm0,xmm3
   140005435:	pxor   xmm2,xmm2
   140005439:	add    rdx,0x1
   14000543d:	mulsd  xmm1,xmm3
   140005441:	cvttsd2si ecx,xmm0
   140005445:	cvtsi2sd xmm2,ecx
   140005449:	add    ecx,0x30
   14000544c:	mov    BYTE PTR [rdx-0x1],cl
   14000544f:	subsd  xmm0,xmm2
   140005453:	comisd xmm1,xmm0
   140005457:	ja     0x1400062dd
   14000545d:	movupd xmm2,xmm4
   140005461:	subsd  xmm2,xmm0
   140005465:	comisd xmm1,xmm2
   140005469:	jbe    0x140005420
   14000546b:	movzx  ecx,BYTE PTR [rdx-0x1]
   14000546f:	mov    rsi,QWORD PTR [rbp-0x60]
   140005473:	jmp    0x140005488
   140005475:	nop    DWORD PTR [rax]
   140005478:	cmp    rax,rsi
   14000547b:	je     0x1400061d7
   140005481:	movzx  ecx,BYTE PTR [rax-0x1]
   140005485:	mov    rdx,rax
   140005488:	lea    rax,[rdx-0x1]
   14000548c:	cmp    cl,0x39
   14000548f:	je     0x140005478
   140005491:	mov    QWORD PTR [rbp-0x60],rdx
   140005495:	add    ecx,0x1
   140005498:	mov    BYTE PTR [rax],cl
   14000549a:	lea    eax,[r8+0x1]
   14000549e:	mov    DWORD PTR [rbp-0x34],eax
   1400054a1:	mov    DWORD PTR [rbp-0x40],0x20
   1400054a8:	jmp    0x140005666
   1400054ad:	nop    DWORD PTR [rax]
   1400054b0:	add    r8d,0x3fd
   1400054b7:	xor    eax,eax
   1400054b9:	mov    DWORD PTR [rbp-0x28],0x0
   1400054c0:	cmp    r8d,0x7f7
   1400054c7:	setbe  al
   1400054ca:	mov    DWORD PTR [rbp-0x8c],eax
   1400054d0:	pxor   xmm0,xmm0
   1400054d4:	mov    QWORD PTR [rbp-0x48],r10
   1400054d8:	cvtsi2sd xmm0,r13d
   1400054dd:	mulsd  xmm0,QWORD PTR [rip+0x41b3]        # 0x140009698
   1400054e5:	mov    DWORD PTR [rbp-0x34],r11d
   1400054e9:	cvttsd2si ecx,xmm0
   1400054ed:	add    ecx,0x3
   1400054f0:	mov    DWORD PTR [rbp-0x4],ecx
   1400054f3:	call   0x140004c20
   1400054f8:	mov    r11d,DWORD PTR [rbp-0x34]
   1400054fc:	mov    r10,QWORD PTR [rbp-0x48]
   140005500:	mov    QWORD PTR [rbp-0x60],rax
   140005504:	mov    eax,DWORD PTR [r12+0xc]
   140005509:	sub    eax,0x1
   14000550c:	mov    DWORD PTR [rbp-0x38],eax
   14000550f:	je     0x1400055b0
   140005515:	mov    DWORD PTR [rbp-0x34],0x0
   14000551c:	mov    DWORD PTR [rbp-0x78],0x1
   140005523:	mov    DWORD PTR [rbp-0x90],0xffffffff
   14000552d:	mov    DWORD PTR [rbp-0x48],0xffffffff
   140005534:	jmp    0x1400052ff
   140005539:	nop    DWORD PTR [rax+0x0]
   140005540:	pxor   xmm1,xmm1
   140005544:	cvtsi2sd xmm1,r11d
   140005549:	ucomisd xmm1,xmm0
   14000554d:	jp     0x140005555
   14000554f:	je     0x14000509a
   140005555:	sub    r11d,0x1
   140005559:	jmp    0x14000509a
   14000555e:	xchg   ax,ax
   140005560:	mov    DWORD PTR [rbp-0x8c],0x0
   14000556a:	sub    eax,0x4
   14000556d:	mov    DWORD PTR [rbp-0x28],eax
   140005570:	cmp    eax,0x4
   140005573:	je     0x1400058d4
   140005579:	cmp    eax,0x5
   14000557c:	je     0x140005cef
   140005582:	mov    DWORD PTR [rbp-0x78],0x0
   140005589:	cmp    eax,0x2
   14000558c:	je     0x1400058db
   140005592:	mov    DWORD PTR [rbp-0x28],0x3
   140005599:	jmp    0x1400052b0
   14000559e:	xchg   ax,ax
   1400055a0:	mov    DWORD PTR [rbp-0x7c],0x0
   1400055a7:	sub    r11d,0x1
   1400055ab:	jmp    0x140005217
   1400055b0:	mov    eax,DWORD PTR [rbp-0x58]
   1400055b3:	mov    DWORD PTR [rbp-0x34],0x0
   1400055ba:	test   eax,eax
   1400055bc:	js     0x14000625e
   1400055c2:	mov    DWORD PTR [rbp-0x78],0x1
   1400055c9:	mov    DWORD PTR [rbp-0x90],0xffffffff
   1400055d3:	mov    DWORD PTR [rbp-0x48],0xffffffff
   1400055da:	nop    WORD PTR [rax+rax*1+0x0]
   1400055e0:	mov    eax,DWORD PTR [rbp-0x70]
   1400055e3:	cmp    DWORD PTR [r12+0x14],eax
   1400055e8:	jl     0x1400056fb
   1400055ee:	mov    rdx,QWORD PTR [rip+0x437b]        # 0x140009970
   1400055f5:	mov    r12d,DWORD PTR [rbp-0x34]
   1400055f9:	cdqe
   1400055fb:	mov    rsi,rax
   1400055fe:	movsd  xmm2,QWORD PTR [rdx+rax*8]
   140005603:	test   r12d,r12d
   140005606:	jns    0x140005dbc
   14000560c:	mov    eax,DWORD PTR [rbp-0x48]
   14000560f:	test   eax,eax
   140005611:	jg     0x140005dbc
   140005617:	jne    0x1400058fb
   14000561d:	mulsd  xmm2,QWORD PTR [rip+0x409b]        # 0x1400096c0
   140005625:	comisd xmm2,QWORD PTR [rbp-0x98]
   14000562d:	jae    0x1400058fb
   140005633:	add    esi,0x2
   140005636:	xor    r9d,r9d
   140005639:	xor    edi,edi
   14000563b:	mov    DWORD PTR [rbp-0x34],esi
   14000563e:	mov    rsi,QWORD PTR [rbp-0x60]
   140005642:	add    QWORD PTR [rbp-0x60],0x1
   140005647:	mov    BYTE PTR [rsi],0x31
   14000564a:	mov    DWORD PTR [rbp-0x40],0x20
   140005651:	mov    rcx,r9
   140005654:	call   0x140006840
   140005659:	test   rdi,rdi
   14000565c:	je     0x140005666
   14000565e:	mov    rcx,rdi
   140005661:	call   0x140006840
   140005666:	mov    rcx,rbx
   140005669:	call   0x140006840
   14000566e:	mov    ebx,DWORD PTR [rbp-0x34]
   140005671:	mov    rax,QWORD PTR [rbp-0x60]
   140005675:	mov    rdi,QWORD PTR [rbp-0x18]
   140005679:	mov    BYTE PTR [rax],0x0
   14000567c:	mov    DWORD PTR [rdi],ebx
   14000567e:	mov    rbx,QWORD PTR [rbp-0x20]
   140005682:	test   rbx,rbx
   140005685:	je     0x14000568a
   140005687:	mov    QWORD PTR [rbx],rax
   14000568a:	mov    eax,DWORD PTR [rbp-0x40]
   14000568d:	or     DWORD PTR [r15],eax
   140005690:	jmp    0x14000519b
   140005695:	movupd xmm1,xmm0
   140005699:	addsd  xmm1,xmm0
   14000569d:	addsd  xmm1,QWORD PTR [rip+0x4013]        # 0x1400096b8
   1400056a5:	movq   rdx,xmm1
   1400056aa:	mov    rax,rdx
   1400056ad:	mov    edx,edx
   1400056af:	shr    rax,0x20
   1400056b3:	sub    eax,0x3400000
   1400056b8:	shl    rax,0x20
   1400056bc:	or     rdx,rax
   1400056bf:	subsd  xmm0,QWORD PTR [rip+0x3ff9]        # 0x1400096c0
   1400056c7:	movq   xmm1,rdx
   1400056cc:	comisd xmm0,xmm1
   1400056d0:	ja     0x14000617c
   1400056d6:	xorpd  xmm1,XMMWORD PTR [rip+0x3ff2]        # 0x1400096d0
   1400056de:	comisd xmm1,xmm0
   1400056e2:	ja     0x1400058fb
   1400056e8:	mov    DWORD PTR [rbp-0x38],0x0
   1400056ef:	nop
   1400056f0:	mov    eax,DWORD PTR [rbp-0x58]
   1400056f3:	test   eax,eax
   1400056f5:	jns    0x1400055e0
   1400056fb:	mov    edi,DWORD PTR [rbp-0x78]
   1400056fe:	test   edi,edi
   140005700:	je     0x140005920
   140005706:	mov    edi,DWORD PTR [rbp-0x58]
   140005709:	sub    r13d,r14d
   14000570c:	mov    edx,DWORD PTR [r12+0x4]
   140005711:	lea    eax,[r13+0x1]
   140005715:	mov    ecx,edi
   140005717:	mov    DWORD PTR [rbp-0x4],eax
   14000571a:	sub    ecx,r13d
   14000571d:	cmp    ecx,edx
   14000571f:	jge    0x140005cb0
   140005725:	mov    ecx,DWORD PTR [rbp-0x28]
   140005728:	lea    eax,[rcx-0x3]
   14000572b:	and    eax,0xfffffffd
   14000572e:	je     0x140005cba
   140005734:	mov    eax,edi
   140005736:	mov    edi,DWORD PTR [rbp-0x48]
   140005739:	sub    eax,edx
   14000573b:	add    eax,0x1
   14000573e:	cmp    ecx,0x1
   140005741:	setg   cl
   140005744:	test   edi,edi
   140005746:	mov    DWORD PTR [rbp-0x4],eax
   140005749:	setg   dl
   14000574c:	test   cl,dl
   14000574e:	je     0x140005758
   140005750:	cmp    eax,edi
   140005752:	jg     0x1400063b9
   140005758:	mov    edi,DWORD PTR [rbp-0x68]
   14000575b:	add    DWORD PTR [rbp-0x50],eax
   14000575e:	mov    r8d,DWORD PTR [rbp-0x74]
   140005762:	add    eax,edi
   140005764:	mov    r13d,edi
   140005767:	mov    DWORD PTR [rbp-0x68],eax
   14000576a:	mov    ecx,0x1
   14000576f:	mov    DWORD PTR [rbp-0x80],r8d
   140005773:	mov    DWORD PTR [rbp-0x58],r11d
   140005777:	call   0x140006970
   14000577c:	mov    DWORD PTR [rbp-0x78],0x1
   140005783:	mov    r11d,DWORD PTR [rbp-0x58]
   140005787:	mov    r8d,DWORD PTR [rbp-0x80]
   14000578b:	mov    rdi,rax
   14000578e:	test   r13d,r13d
   140005791:	jle    0x1400057b1
   140005793:	mov    ecx,DWORD PTR [rbp-0x50]
   140005796:	test   ecx,ecx
   140005798:	jle    0x1400057b1
   14000579a:	cmp    r13d,ecx
   14000579d:	mov    eax,ecx
   14000579f:	cmovle eax,r13d
   1400057a3:	sub    DWORD PTR [rbp-0x68],eax
   1400057a6:	sub    ecx,eax
   1400057a8:	mov    DWORD PTR [rbp-0x4],eax
   1400057ab:	sub    r13d,eax
   1400057ae:	mov    DWORD PTR [rbp-0x50],ecx
   1400057b1:	mov    r10d,DWORD PTR [rbp-0x74]
   1400057b5:	test   r10d,r10d
   1400057b8:	je     0x1400057e2
   1400057ba:	mov    r9d,DWORD PTR [rbp-0x78]
   1400057be:	test   r9d,r9d
   1400057c1:	je     0x1400057cc
   1400057c3:	test   r8d,r8d
   1400057c6:	jne    0x140005f4f
   1400057cc:	mov    edx,DWORD PTR [rbp-0x74]
   1400057cf:	mov    rcx,rbx
   1400057d2:	mov    DWORD PTR [rbp-0x58],r11d
   1400057d6:	call   0x140006ba0
   1400057db:	mov    r11d,DWORD PTR [rbp-0x58]
   1400057df:	mov    rbx,rax
   1400057e2:	mov    ecx,0x1
   1400057e7:	mov    DWORD PTR [rbp-0x58],r11d
   1400057eb:	call   0x140006970
   1400057f0:	mov    r11d,DWORD PTR [rbp-0x58]
   1400057f4:	mov    r9,rax
   1400057f7:	test   r11d,r11d
   1400057fa:	jne    0x140005c48
   140005800:	cmp    DWORD PTR [rbp-0x28],0x1
   140005804:	jle    0x140005c80
   14000580a:	mov    r12d,0x1f
   140005810:	mov    eax,DWORD PTR [rbp-0x50]
   140005813:	sub    r12d,eax
   140005816:	mov    eax,DWORD PTR [rbp-0x68]
   140005819:	sub    r12d,0x4
   14000581d:	and    r12d,0x1f
   140005821:	add    eax,r12d
   140005824:	mov    DWORD PTR [rbp-0x4],r12d
   140005828:	mov    edx,r12d
   14000582b:	test   eax,eax
   14000582d:	jle    0x14000584f
   14000582f:	mov    edx,eax
   140005831:	mov    rcx,rbx
   140005834:	mov    QWORD PTR [rbp-0x58],r9
   140005838:	mov    DWORD PTR [rbp-0x30],r11d
   14000583c:	call   0x140006d30
   140005841:	mov    edx,DWORD PTR [rbp-0x4]
   140005844:	mov    r9,QWORD PTR [rbp-0x58]
   140005848:	mov    r11d,DWORD PTR [rbp-0x30]
   14000584c:	mov    rbx,rax
   14000584f:	mov    eax,DWORD PTR [rbp-0x50]
   140005852:	add    eax,edx
   140005854:	mov    edx,eax
   140005856:	test   eax,eax
   140005858:	jle    0x14000586d
   14000585a:	mov    rcx,r9
   14000585d:	mov    DWORD PTR [rbp-0x30],r11d
   140005861:	call   0x140006d30
   140005866:	mov    r11d,DWORD PTR [rbp-0x30]
   14000586a:	mov    r9,rax
   14000586d:	mov    ecx,DWORD PTR [rbp-0x7c]
   140005870:	cmp    DWORD PTR [rbp-0x28],0x2
   140005874:	setg   r14b
   140005878:	test   ecx,ecx
   14000587a:	jne    0x140005b20
   140005880:	mov    eax,DWORD PTR [rbp-0x48]
   140005883:	test   eax,eax
   140005885:	jg     0x140005930
   14000588b:	test   r14b,r14b
   14000588e:	je     0x140005930
   140005894:	mov    eax,DWORD PTR [rbp-0x48]
   140005897:	test   eax,eax
   140005899:	jne    0x140005900
   14000589b:	mov    rcx,r9
   14000589e:	xor    r8d,r8d
   1400058a1:	mov    edx,0x5
   1400058a6:	call   0x1400068b0
   1400058ab:	mov    rcx,rbx
   1400058ae:	mov    rdx,rax
   1400058b1:	mov    QWORD PTR [rbp-0x28],rax
   1400058b5:	call   0x140006e60
   1400058ba:	mov    r9,QWORD PTR [rbp-0x28]
   1400058be:	test   eax,eax
   1400058c0:	jle    0x140005900
   1400058c2:	mov    eax,DWORD PTR [rbp-0x70]
   1400058c5:	mov    rsi,QWORD PTR [rbp-0x60]
   1400058c9:	add    eax,0x2
   1400058cc:	mov    DWORD PTR [rbp-0x34],eax
   1400058cf:	jmp    0x140005642
   1400058d4:	mov    DWORD PTR [rbp-0x78],0x1
   1400058db:	mov    eax,DWORD PTR [rbp-0x34]
   1400058de:	mov    ecx,0x1
   1400058e3:	test   eax,eax
   1400058e5:	cmovg  ecx,eax
   1400058e8:	mov    DWORD PTR [rbp-0x90],ecx
   1400058ee:	mov    eax,ecx
   1400058f0:	mov    DWORD PTR [rbp-0x48],ecx
   1400058f3:	mov    DWORD PTR [rbp-0x34],ecx
   1400058f6:	jmp    0x1400052d0
   1400058fb:	xor    r9d,r9d
   1400058fe:	xor    edi,edi
   140005900:	mov    eax,DWORD PTR [rbp-0x34]
   140005903:	mov    rsi,QWORD PTR [rbp-0x60]
   140005907:	mov    DWORD PTR [rbp-0x40],0x10
   14000590e:	neg    eax
   140005910:	mov    DWORD PTR [rbp-0x34],eax
   140005913:	jmp    0x140005651
   140005918:	nop    DWORD PTR [rax+rax*1+0x0]
   140005920:	mov    r8d,DWORD PTR [rbp-0x74]
   140005924:	mov    r13d,DWORD PTR [rbp-0x68]
   140005928:	xor    edi,edi
   14000592a:	jmp    0x14000578e
   14000592f:	nop
   140005930:	mov    eax,DWORD PTR [rbp-0x70]
   140005933:	add    eax,0x1
   140005936:	mov    DWORD PTR [rbp-0x34],eax
   140005939:	mov    eax,DWORD PTR [rbp-0x78]
   14000593c:	test   eax,eax
   14000593e:	je     0x140005ba0
   140005944:	lea    edx,[r12+r13*1]
   140005948:	test   edx,edx
   14000594a:	jle    0x140005967
   14000594c:	mov    rcx,rdi
   14000594f:	mov    QWORD PTR [rbp-0x50],r9
   140005953:	mov    DWORD PTR [rbp-0x30],r11d
   140005957:	call   0x140006d30
   14000595c:	mov    r9,QWORD PTR [rbp-0x50]
   140005960:	mov    r11d,DWORD PTR [rbp-0x30]
   140005964:	mov    rdi,rax
   140005967:	mov    r13,rdi
   14000596a:	test   r11d,r11d
   14000596d:	jne    0x14000613b
   140005973:	mov    r10,QWORD PTR [rbp-0x60]
   140005977:	mov    QWORD PTR [rbp-0x70],r15
   14000597b:	mov    eax,0x1
   140005980:	mov    QWORD PTR [rbp-0x30],r9
   140005984:	mov    QWORD PTR [rbp-0x50],rsi
   140005988:	mov    r15,r10
   14000598b:	jmp    0x140005a2a
   140005990:	mov    rcx,rdx
   140005993:	call   0x140006840
   140005998:	mov    edx,0x1
   14000599d:	test   r12d,r12d
   1400059a0:	js     0x140006008
   1400059a6:	or     r12d,DWORD PTR [rbp-0x28]
   1400059aa:	jne    0x1400059b9
   1400059ac:	mov    rax,QWORD PTR [rbp-0x50]
   1400059b0:	test   BYTE PTR [rax],0x1
   1400059b3:	je     0x140006008
   1400059b9:	lea    r12,[r15+0x1]
   1400059bd:	mov    r14,r12
   1400059c0:	test   edx,edx
   1400059c2:	jle    0x1400059ce
   1400059c4:	cmp    DWORD PTR [rbp-0x38],0x2
   1400059c8:	jne    0x140006191
   1400059ce:	mov    BYTE PTR [r12-0x1],sil
   1400059d3:	mov    eax,DWORD PTR [rbp-0x48]
   1400059d6:	cmp    DWORD PTR [rbp-0x4],eax
   1400059d9:	je     0x1400061c1
   1400059df:	mov    rcx,rbx
   1400059e2:	xor    r8d,r8d
   1400059e5:	mov    edx,0xa
   1400059ea:	call   0x1400068b0
   1400059ef:	xor    r8d,r8d
   1400059f2:	mov    edx,0xa
   1400059f7:	mov    rcx,rdi
   1400059fa:	mov    rbx,rax
   1400059fd:	cmp    rdi,r13
   140005a00:	je     0x140005b10
   140005a06:	call   0x1400068b0
   140005a0b:	mov    rcx,r13
   140005a0e:	xor    r8d,r8d
   140005a11:	mov    edx,0xa
   140005a16:	mov    rdi,rax
   140005a19:	call   0x1400068b0
   140005a1e:	mov    r13,rax
   140005a21:	mov    eax,DWORD PTR [rbp-0x4]
   140005a24:	mov    r15,r12
   140005a27:	add    eax,0x1
   140005a2a:	mov    rdx,QWORD PTR [rbp-0x30]
   140005a2e:	mov    rcx,rbx
   140005a31:	mov    DWORD PTR [rbp-0x4],eax
   140005a34:	call   0x140004d10
   140005a39:	mov    rdx,rdi
   140005a3c:	mov    rcx,rbx
   140005a3f:	mov    r14d,eax
   140005a42:	lea    esi,[rax+0x30]
   140005a45:	call   0x140006e60
   140005a4a:	mov    rcx,QWORD PTR [rbp-0x30]
   140005a4e:	mov    rdx,r13
   140005a51:	mov    r12d,eax
   140005a54:	call   0x140006eb0
   140005a59:	mov    rdx,rax
   140005a5c:	mov    eax,DWORD PTR [rax+0x10]
   140005a5f:	test   eax,eax
   140005a61:	jne    0x140005990
   140005a67:	mov    rcx,rbx
   140005a6a:	mov    QWORD PTR [rbp-0x68],rdx
   140005a6e:	call   0x140006e60
   140005a73:	mov    rcx,QWORD PTR [rbp-0x68]
   140005a77:	mov    DWORD PTR [rbp-0x58],eax
   140005a7a:	call   0x140006840
   140005a7f:	mov    edx,DWORD PTR [rbp-0x58]
   140005a82:	mov    eax,DWORD PTR [rbp-0x28]
   140005a85:	or     edx,eax
   140005a87:	jne    0x140005e8e
   140005a8d:	mov    rax,QWORD PTR [rbp-0x50]
   140005a91:	mov    eax,DWORD PTR [rax]
   140005a93:	mov    DWORD PTR [rbp-0x58],eax
   140005a96:	and    eax,0x1
   140005a99:	or     eax,DWORD PTR [rbp-0x38]
   140005a9c:	jne    0x14000599d
   140005aa2:	mov    r10,r15
   140005aa5:	mov    r9,QWORD PTR [rbp-0x30]
   140005aa9:	mov    r15,QWORD PTR [rbp-0x70]
   140005aad:	mov    r8d,esi
   140005ab0:	cmp    esi,0x39
   140005ab3:	je     0x140006431
   140005ab9:	test   r12d,r12d
   140005abc:	jle    0x14000647e
   140005ac2:	mov    DWORD PTR [rbp-0x40],0x20
   140005ac9:	lea    r8d,[r14+0x31]
   140005acd:	mov    BYTE PTR [r10],r8b
   140005ad0:	mov    rsi,rdi
   140005ad3:	lea    r12,[r10+0x1]
   140005ad7:	mov    rdi,r13
   140005ada:	nop    WORD PTR [rax+rax*1+0x0]
   140005ae0:	mov    rcx,r9
   140005ae3:	call   0x140006840
   140005ae8:	test   rdi,rdi
   140005aeb:	je     0x140005ecc
   140005af1:	test   rsi,rsi
   140005af4:	je     0x140005b03
   140005af6:	cmp    rsi,rdi
   140005af9:	je     0x140005b03
   140005afb:	mov    rcx,rsi
   140005afe:	call   0x140006840
   140005b03:	mov    rsi,QWORD PTR [rbp-0x60]
   140005b07:	mov    QWORD PTR [rbp-0x60],r12
   140005b0b:	jmp    0x14000565e
   140005b10:	call   0x1400068b0
   140005b15:	mov    rdi,rax
   140005b18:	mov    r13,rax
   140005b1b:	jmp    0x140005a21
   140005b20:	mov    rdx,r9
   140005b23:	mov    rcx,rbx
   140005b26:	mov    DWORD PTR [rbp-0x50],r11d
   140005b2a:	mov    QWORD PTR [rbp-0x30],r9
   140005b2e:	call   0x140006e60
   140005b33:	mov    r9,QWORD PTR [rbp-0x30]
   140005b37:	mov    r11d,DWORD PTR [rbp-0x50]
   140005b3b:	test   eax,eax
   140005b3d:	jns    0x140005880
   140005b43:	mov    eax,DWORD PTR [rbp-0x70]
   140005b46:	xor    r8d,r8d
   140005b49:	mov    edx,0xa
   140005b4e:	mov    rcx,rbx
   140005b51:	mov    QWORD PTR [rbp-0x48],r9
   140005b55:	sub    eax,0x1
   140005b58:	mov    DWORD PTR [rbp-0x30],r11d
   140005b5c:	mov    DWORD PTR [rbp-0x50],eax
   140005b5f:	call   0x1400068b0
   140005b64:	mov    edx,DWORD PTR [rbp-0x78]
   140005b67:	mov    r9,QWORD PTR [rbp-0x48]
   140005b6b:	mov    rbx,rax
   140005b6e:	mov    eax,DWORD PTR [rbp-0x90]
   140005b74:	test   eax,eax
   140005b76:	setle  al
   140005b79:	and    r14d,eax
   140005b7c:	test   edx,edx
   140005b7e:	jne    0x14000634c
   140005b84:	test   r14b,r14b
   140005b87:	jne    0x140006274
   140005b8d:	mov    eax,DWORD PTR [rbp-0x70]
   140005b90:	mov    DWORD PTR [rbp-0x34],eax
   140005b93:	mov    eax,DWORD PTR [rbp-0x90]
   140005b99:	mov    DWORD PTR [rbp-0x48],eax
   140005b9c:	nop    DWORD PTR [rax+0x0]
   140005ba0:	mov    r14,QWORD PTR [rbp-0x60]
   140005ba4:	mov    r12d,DWORD PTR [rbp-0x48]
   140005ba8:	mov    eax,0x1
   140005bad:	mov    rsi,r9
   140005bb0:	jmp    0x140005bd1
   140005bb2:	nop    WORD PTR [rax+rax*1+0x0]
   140005bb8:	mov    rcx,rbx
   140005bbb:	xor    r8d,r8d
   140005bbe:	mov    edx,0xa
   140005bc3:	call   0x1400068b0
   140005bc8:	mov    rbx,rax
   140005bcb:	mov    eax,DWORD PTR [rbp-0x4]
   140005bce:	add    eax,0x1
   140005bd1:	mov    rdx,rsi
   140005bd4:	mov    rcx,rbx
   140005bd7:	mov    DWORD PTR [rbp-0x4],eax
   140005bda:	add    r14,0x1
   140005bde:	call   0x140004d10
   140005be3:	lea    r8d,[rax+0x30]
   140005be7:	mov    BYTE PTR [r14-0x1],r8b
   140005beb:	cmp    DWORD PTR [rbp-0x4],r12d
   140005bef:	jl     0x140005bb8
   140005bf1:	mov    r9,rsi
   140005bf4:	xor    esi,esi
   140005bf6:	mov    ecx,DWORD PTR [rbp-0x38]
   140005bf9:	test   ecx,ecx
   140005bfb:	je     0x140005faa
   140005c01:	mov    eax,DWORD PTR [rbx+0x14]
   140005c04:	cmp    ecx,0x2
   140005c07:	je     0x140005fea
   140005c0d:	cmp    eax,0x1
   140005c10:	jg     0x140005e96
   140005c16:	mov    eax,DWORD PTR [rbx+0x18]
   140005c19:	test   eax,eax
   140005c1b:	jne    0x140005e96
   140005c21:	test   eax,eax
   140005c23:	setne  al
   140005c26:	movzx  eax,al
   140005c29:	shl    eax,0x4
   140005c2c:	mov    DWORD PTR [rbp-0x40],eax
   140005c2f:	nop
   140005c30:	mov    r12,r14
   140005c33:	sub    r14,0x1
   140005c37:	cmp    BYTE PTR [r14],0x30
   140005c3b:	je     0x140005c30
   140005c3d:	jmp    0x140005ae0
   140005c42:	nop    WORD PTR [rax+rax*1+0x0]
   140005c48:	mov    edx,r11d
   140005c4b:	mov    rcx,rax
   140005c4e:	call   0x140006ba0
   140005c53:	cmp    DWORD PTR [rbp-0x28],0x1
   140005c57:	mov    r9,rax
   140005c5a:	jle    0x140005f02
   140005c60:	xor    r11d,r11d
   140005c63:	mov    eax,DWORD PTR [r9+0x14]
   140005c67:	sub    eax,0x1
   140005c6a:	cdqe
   140005c6c:	bsr    r12d,DWORD PTR [r9+rax*4+0x18]
   140005c72:	xor    r12d,0x1f
   140005c76:	jmp    0x140005810
   140005c7b:	nop    DWORD PTR [rax+rax*1+0x0]
   140005c80:	cmp    r14d,0x1
   140005c84:	jne    0x14000580a
   140005c8a:	mov    eax,DWORD PTR [r12+0x4]
   140005c8f:	add    eax,0x1
   140005c92:	cmp    DWORD PTR [rbp-0x30],eax
   140005c95:	jle    0x14000580a
   140005c9b:	add    DWORD PTR [rbp-0x68],0x1
   140005c9f:	mov    r11d,0x1
   140005ca5:	add    DWORD PTR [rbp-0x50],0x1
   140005ca9:	jmp    0x14000580a
   140005cae:	xchg   ax,ax
   140005cb0:	cmp    DWORD PTR [rbp-0x28],0x1
   140005cb4:	jle    0x140005758
   140005cba:	mov    ecx,DWORD PTR [rbp-0x48]
   140005cbd:	mov    edi,DWORD PTR [rbp-0x74]
   140005cc0:	lea    eax,[rcx-0x1]
   140005cc3:	cmp    edi,eax
   140005cc5:	jl     0x140005ed9
   140005ccb:	mov    r8d,edi
   140005cce:	sub    r8d,eax
   140005cd1:	test   ecx,ecx
   140005cd3:	jns    0x140006334
   140005cd9:	mov    r13d,DWORD PTR [rbp-0x68]
   140005cdd:	mov    eax,DWORD PTR [rbp-0x48]
   140005ce0:	mov    DWORD PTR [rbp-0x4],0x0
   140005ce7:	sub    r13d,eax
   140005cea:	jmp    0x14000576a
   140005cef:	mov    DWORD PTR [rbp-0x78],0x1
   140005cf6:	jmp    0x1400052b0
   140005cfb:	movupd xmm4,xmm2
   140005cff:	movq   xmm0,r10
   140005d04:	mov    rdx,QWORD PTR [rbp-0x60]
   140005d08:	xor    r9d,r9d
   140005d0b:	mulsd  xmm4,xmm3
   140005d0f:	mov    DWORD PTR [rbp-0x4],0x1
   140005d16:	movsd  xmm2,QWORD PTR [rip+0x398a]        # 0x1400096a8
   140005d1e:	movupd xmm1,xmm0
   140005d22:	jmp    0x140005d37
   140005d24:	nop    DWORD PTR [rax+0x0]
   140005d28:	mulsd  xmm1,xmm2
   140005d2c:	add    r10d,0x1
   140005d30:	mov    r9d,edi
   140005d33:	mov    DWORD PTR [rbp-0x4],r10d
   140005d37:	cvttsd2si ecx,xmm1
   140005d3b:	test   ecx,ecx
   140005d3d:	je     0x140005d4e
   140005d3f:	pxor   xmm3,xmm3
   140005d43:	mov    r9d,edi
   140005d46:	cvtsi2sd xmm3,ecx
   140005d4a:	subsd  xmm1,xmm3
   140005d4e:	add    rdx,0x1
   140005d52:	add    ecx,0x30
   140005d55:	mov    BYTE PTR [rdx-0x1],cl
   140005d58:	mov    r10d,DWORD PTR [rbp-0x4]
   140005d5c:	cmp    r10d,eax
   140005d5f:	jne    0x140005d28
   140005d61:	test   r9b,r9b
   140005d64:	je     0x140006315
   140005d6a:	movsd  xmm0,QWORD PTR [rip+0x396e]        # 0x1400096e0
   140005d72:	movupd xmm2,xmm4
   140005d76:	addsd  xmm2,xmm0
   140005d7a:	comisd xmm1,xmm2
   140005d7e:	ja     0x14000630c
   140005d84:	subsd  xmm0,xmm4
   140005d88:	comisd xmm0,xmm1
   140005d8c:	ja     0x140006384
   140005d92:	mov    eax,DWORD PTR [rbp-0x58]
   140005d95:	test   eax,eax
   140005d97:	js     0x14000631e
   140005d9d:	mov    eax,DWORD PTR [r12+0x14]
   140005da2:	test   eax,eax
   140005da4:	js     0x14000631e
   140005daa:	mov    rax,QWORD PTR [rip+0x3bbf]        # 0x140009970
   140005db1:	mov    DWORD PTR [rbp-0x38],0x0
   140005db8:	movsd  xmm2,QWORD PTR [rax]
   140005dbc:	movsd  xmm0,QWORD PTR [rbp-0x98]
   140005dc4:	mov    rsi,QWORD PTR [rbp-0x60]
   140005dc8:	mov    DWORD PTR [rbp-0x4],0x1
   140005dcf:	movupd xmm1,xmm0
   140005dd3:	lea    rdx,[rsi+0x1]
   140005dd7:	divsd  xmm1,xmm2
   140005ddb:	cvttsd2si eax,xmm1
   140005ddf:	pxor   xmm1,xmm1
   140005de3:	cvtsi2sd xmm1,eax
   140005de7:	lea    ecx,[rax+0x30]
   140005dea:	mov    BYTE PTR [rsi],cl
   140005dec:	mov    esi,DWORD PTR [rbp-0x70]
   140005def:	add    esi,0x1
   140005df2:	mulsd  xmm1,xmm2
   140005df6:	mov    DWORD PTR [rbp-0x34],esi
   140005df9:	subsd  xmm0,xmm1
   140005dfd:	pxor   xmm1,xmm1
   140005e01:	ucomisd xmm0,xmm1
   140005e05:	jp     0x140005e0d
   140005e07:	je     0x140005f9d
   140005e0d:	movsd  xmm4,QWORD PTR [rip+0x3893]        # 0x1400096a8
   140005e15:	pxor   xmm3,xmm3
   140005e19:	jmp    0x140005e5c
   140005e1b:	nop    DWORD PTR [rax+rax*1+0x0]
   140005e20:	mulsd  xmm0,xmm4
   140005e24:	add    ecx,0x1
   140005e27:	add    rdx,0x1
   140005e2b:	mov    DWORD PTR [rbp-0x4],ecx
   140005e2e:	movupd xmm1,xmm0
   140005e32:	divsd  xmm1,xmm2
   140005e36:	cvttsd2si eax,xmm1
   140005e3a:	pxor   xmm1,xmm1
   140005e3e:	cvtsi2sd xmm1,eax
   140005e42:	lea    ecx,[rax+0x30]
   140005e45:	mov    BYTE PTR [rdx-0x1],cl
   140005e48:	mulsd  xmm1,xmm2
   140005e4c:	subsd  xmm0,xmm1
   140005e50:	ucomisd xmm0,xmm3
   140005e54:	jp     0x140005e5c
   140005e56:	je     0x140005f9d
   140005e5c:	mov    ecx,DWORD PTR [rbp-0x4]
   140005e5f:	mov    esi,DWORD PTR [rbp-0x48]
   140005e62:	cmp    ecx,esi
   140005e64:	jne    0x140005e20
   140005e66:	mov    esi,DWORD PTR [rbp-0x38]
   140005e69:	test   esi,esi
   140005e6b:	je     0x140006288
   140005e71:	cmp    esi,0x1
   140005e74:	je     0x1400063a8
   140005e7a:	mov    rsi,QWORD PTR [rbp-0x60]
   140005e7e:	mov    DWORD PTR [rbp-0x40],0x10
   140005e85:	mov    QWORD PTR [rbp-0x60],rdx
   140005e89:	jmp    0x140005666
   140005e8e:	mov    edx,DWORD PTR [rbp-0x58]
   140005e91:	jmp    0x14000599d
   140005e96:	mov    rdx,QWORD PTR [rbp-0x60]
   140005e9a:	jmp    0x140005ea9
   140005e9c:	nop    DWORD PTR [rax+0x0]
   140005ea0:	cmp    r14,rdx
   140005ea3:	je     0x140005f38
   140005ea9:	mov    r12,r14
   140005eac:	lea    r14,[r14-0x1]
   140005eb0:	movzx  eax,BYTE PTR [r12-0x1]
   140005eb6:	cmp    al,0x39
   140005eb8:	je     0x140005ea0
   140005eba:	add    eax,0x1
   140005ebd:	mov    DWORD PTR [rbp-0x40],0x20
   140005ec4:	mov    BYTE PTR [r14],al
   140005ec7:	jmp    0x140005ae0
   140005ecc:	mov    rsi,QWORD PTR [rbp-0x60]
   140005ed0:	mov    QWORD PTR [rbp-0x60],r12
   140005ed4:	jmp    0x140005666
   140005ed9:	mov    edi,DWORD PTR [rbp-0x74]
   140005edc:	mov    edx,eax
   140005ede:	mov    DWORD PTR [rbp-0x74],eax
   140005ee1:	xor    r8d,r8d
   140005ee4:	sub    edx,edi
   140005ee6:	mov    edi,DWORD PTR [rbp-0x48]
   140005ee9:	add    DWORD PTR [rbp-0x50],edi
   140005eec:	add    r11d,edx
   140005eef:	mov    edx,DWORD PTR [rbp-0x68]
   140005ef2:	mov    DWORD PTR [rbp-0x4],edi
   140005ef5:	add    edi,edx
   140005ef7:	mov    r13d,edx
   140005efa:	mov    DWORD PTR [rbp-0x68],edi
   140005efd:	jmp    0x14000576a
   140005f02:	cmp    r14d,0x1
   140005f06:	jne    0x140005c60
   140005f0c:	mov    eax,DWORD PTR [r12+0x4]
   140005f11:	mov    edx,DWORD PTR [rbp-0x30]
   140005f14:	add    eax,0x1
   140005f17:	cmp    eax,edx
   140005f19:	jge    0x140005c60
   140005f1f:	add    DWORD PTR [rbp-0x68],0x1
   140005f23:	mov    r11d,0x1
   140005f29:	add    DWORD PTR [rbp-0x50],0x1
   140005f2d:	jmp    0x140005c63
   140005f32:	nop    WORD PTR [rax+rax*1+0x0]
   140005f38:	mov    rax,QWORD PTR [rbp-0x60]
   140005f3c:	add    DWORD PTR [rbp-0x34],0x1
   140005f40:	mov    DWORD PTR [rbp-0x40],0x20
   140005f47:	mov    BYTE PTR [rax],0x31
   140005f4a:	jmp    0x140005ae0
   140005f4f:	mov    edx,r8d
   140005f52:	mov    rcx,rdi
   140005f55:	mov    DWORD PTR [rbp-0x88],r11d
   140005f5c:	mov    DWORD PTR [rbp-0x80],r8d
   140005f60:	call   0x140006ba0
   140005f65:	mov    rdx,rbx
   140005f68:	mov    rcx,rax
   140005f6b:	mov    rdi,rax
   140005f6e:	call   0x140006a30
   140005f73:	mov    rcx,rbx
   140005f76:	mov    QWORD PTR [rbp-0x58],rax
   140005f7a:	call   0x140006840
   140005f7f:	mov    r8d,DWORD PTR [rbp-0x80]
   140005f83:	sub    DWORD PTR [rbp-0x74],r8d
   140005f87:	mov    rbx,QWORD PTR [rbp-0x58]
   140005f8b:	mov    r11d,DWORD PTR [rbp-0x88]
   140005f92:	je     0x1400057e2
   140005f98:	jmp    0x1400057cc
   140005f9d:	mov    rsi,QWORD PTR [rbp-0x60]
   140005fa1:	mov    QWORD PTR [rbp-0x60],rdx
   140005fa5:	jmp    0x140005666
   140005faa:	mov    rcx,rbx
   140005fad:	mov    edx,0x1
   140005fb2:	mov    QWORD PTR [rbp-0x28],r9
   140005fb6:	mov    DWORD PTR [rbp-0x30],r8d
   140005fba:	call   0x140006d30
   140005fbf:	mov    rdx,QWORD PTR [rbp-0x28]
   140005fc3:	mov    rcx,rax
   140005fc6:	mov    rbx,rax
   140005fc9:	call   0x140006e60
   140005fce:	mov    r9,QWORD PTR [rbp-0x28]
   140005fd2:	test   eax,eax
   140005fd4:	jg     0x140005e96
   140005fda:	jne    0x140005fea
   140005fdc:	mov    r8d,DWORD PTR [rbp-0x30]
   140005fe0:	and    r8d,0x1
   140005fe4:	jne    0x140005e96
   140005fea:	cmp    DWORD PTR [rbx+0x14],0x1
   140005fee:	mov    DWORD PTR [rbp-0x40],0x10
   140005ff5:	jg     0x140005c30
   140005ffb:	mov    eax,DWORD PTR [rbx+0x18]
   140005ffe:	jmp    0x140005c21
   140006003:	nop    DWORD PTR [rax+rax*1+0x0]
   140006008:	mov    r11d,DWORD PTR [rbp-0x38]
   14000600c:	mov    r10,r15
   14000600f:	mov    r9,QWORD PTR [rbp-0x30]
   140006013:	mov    r8d,esi
   140006016:	mov    r15,QWORD PTR [rbp-0x70]
   14000601a:	test   r11d,r11d
   14000601d:	je     0x1400061e9
   140006023:	cmp    DWORD PTR [rbx+0x14],0x1
   140006027:	jle    0x1400063e5
   14000602d:	cmp    DWORD PTR [rbp-0x38],0x2
   140006031:	je     0x140006248
   140006037:	mov    QWORD PTR [rbp-0x30],r15
   14000603b:	mov    r14d,r8d
   14000603e:	mov    r15,r10
   140006041:	mov    QWORD PTR [rbp-0x28],r9
   140006045:	jmp    0x140006098
   140006047:	nop    WORD PTR [rax+rax*1+0x0]
   140006050:	mov    BYTE PTR [r12-0x1],r14b
   140006055:	xor    r8d,r8d
   140006058:	mov    rcx,r13
   14000605b:	mov    edx,0xa
   140006060:	mov    r15,r12
   140006063:	call   0x1400068b0
   140006068:	cmp    rdi,r13
   14000606b:	mov    rcx,rbx
   14000606e:	mov    edx,0xa
   140006073:	cmove  rdi,rax
   140006077:	xor    r8d,r8d
   14000607a:	mov    rsi,rax
   14000607d:	call   0x1400068b0
   140006082:	mov    rdx,QWORD PTR [rbp-0x28]
   140006086:	mov    r13,rsi
   140006089:	mov    rcx,rax
   14000608c:	mov    rbx,rax
   14000608f:	call   0x140004d10
   140006094:	lea    r14d,[rax+0x30]
   140006098:	mov    rcx,QWORD PTR [rbp-0x28]
   14000609c:	mov    rdx,r13
   14000609f:	lea    r12,[r15+0x1]
   1400060a3:	call   0x140006e60
   1400060a8:	test   eax,eax
   1400060aa:	jg     0x140006050
   1400060ac:	mov    r10,r15
   1400060af:	mov    r9,QWORD PTR [rbp-0x28]
   1400060b3:	mov    r15,QWORD PTR [rbp-0x30]
   1400060b7:	mov    r8d,r14d
   1400060ba:	cmp    r14d,0x39
   1400060be:	je     0x140006435
   1400060c4:	mov    DWORD PTR [rbp-0x40],0x20
   1400060cb:	mov    rsi,rdi
   1400060ce:	add    r8d,0x1
   1400060d2:	mov    rdi,r13
   1400060d5:	mov    BYTE PTR [r10],r8b
   1400060d8:	jmp    0x140005ae0
   1400060dd:	test   ecx,ecx
   1400060df:	je     0x140005695
   1400060e5:	mov    ecx,DWORD PTR [rbp-0x90]
   1400060eb:	test   ecx,ecx
   1400060ed:	jle    0x1400056e8
   1400060f3:	mulsd  xmm0,QWORD PTR [rip+0x35ad]        # 0x1400096a8
   1400060fb:	movsd  xmm1,QWORD PTR [rip+0x35ad]        # 0x1400096b0
   140006103:	mov    r8d,0xffffffff
   140006109:	mulsd  xmm1,xmm0
   14000610d:	movq   r10,xmm0
   140006112:	addsd  xmm1,QWORD PTR [rip+0x359e]        # 0x1400096b8
   14000611a:	movq   rdx,xmm1
   14000611f:	mov    rax,rdx
   140006122:	mov    edx,edx
   140006124:	shr    rax,0x20
   140006128:	sub    eax,0x3400000
   14000612d:	shl    rax,0x20
   140006131:	or     rdx,rax
   140006134:	mov    eax,ecx
   140006136:	jmp    0x1400053ae
   14000613b:	mov    ecx,DWORD PTR [rdi+0x8]
   14000613e:	mov    QWORD PTR [rbp-0x30],r9
   140006142:	call   0x140006740
   140006147:	lea    rdx,[rdi+0x10]
   14000614b:	lea    rcx,[rax+0x10]
   14000614f:	mov    r12,rax
   140006152:	movsxd rax,DWORD PTR [rdi+0x14]
   140006156:	lea    r8,[rax*4+0x8]
   14000615e:	call   0x140007a98
   140006163:	mov    edx,0x1
   140006168:	mov    rcx,r12
   14000616b:	call   0x140006d30
   140006170:	mov    r9,QWORD PTR [rbp-0x30]
   140006174:	mov    r13,rax
   140006177:	jmp    0x140005973
   14000617c:	mov    DWORD PTR [rbp-0x34],0x2
   140006183:	mov    rsi,QWORD PTR [rbp-0x60]
   140006187:	xor    r9d,r9d
   14000618a:	xor    edi,edi
   14000618c:	jmp    0x140005642
   140006191:	mov    r10,r15
   140006194:	mov    r9,QWORD PTR [rbp-0x30]
   140006198:	mov    r15,QWORD PTR [rbp-0x70]
   14000619c:	mov    r8d,esi
   14000619f:	cmp    esi,0x39
   1400061a2:	je     0x140006435
   1400061a8:	add    r8d,0x1
   1400061ac:	mov    rsi,rdi
   1400061af:	mov    DWORD PTR [rbp-0x40],0x20
   1400061b6:	mov    rdi,r13
   1400061b9:	mov    BYTE PTR [r10],r8b
   1400061bc:	jmp    0x140005ae0
   1400061c1:	mov    r8d,esi
   1400061c4:	mov    r9,QWORD PTR [rbp-0x30]
   1400061c8:	mov    rsi,rdi
   1400061cb:	mov    r15,QWORD PTR [rbp-0x70]
   1400061cf:	mov    rdi,r13
   1400061d2:	jmp    0x140005bf6
   1400061d7:	mov    QWORD PTR [rbp-0x60],rdx
   1400061db:	add    r8d,0x1
   1400061df:	mov    ecx,0x31
   1400061e4:	jmp    0x140005498
   1400061e9:	test   edx,edx
   1400061eb:	jle    0x14000623e
   1400061ed:	mov    rcx,rbx
   1400061f0:	mov    edx,0x1
   1400061f5:	mov    QWORD PTR [rbp-0x28],r9
   1400061f9:	mov    QWORD PTR [rbp-0x40],r10
   1400061fd:	mov    DWORD PTR [rbp-0x30],r8d
   140006201:	call   0x140006d30
   140006206:	mov    rdx,QWORD PTR [rbp-0x28]
   14000620a:	mov    rcx,rax
   14000620d:	mov    rbx,rax
   140006210:	call   0x140006e60
   140006215:	mov    r9,QWORD PTR [rbp-0x28]
   140006219:	mov    r8d,DWORD PTR [rbp-0x30]
   14000621d:	test   eax,eax
   14000621f:	mov    r10,QWORD PTR [rbp-0x40]
   140006223:	jle    0x14000644b
   140006229:	cmp    r8d,0x39
   14000622d:	je     0x140006463
   140006233:	mov    DWORD PTR [rbp-0x38],0x20
   14000623a:	lea    r8d,[r14+0x31]
   14000623e:	cmp    DWORD PTR [rbx+0x14],0x1
   140006242:	jle    0x140006414
   140006248:	mov    rsi,rdi
   14000624b:	mov    DWORD PTR [rbp-0x40],0x10
   140006252:	mov    rdi,r13
   140006255:	lea    r12,[r10+0x1]
   140006259:	jmp    0x1400060d5
   14000625e:	mov    DWORD PTR [rbp-0x90],0xffffffff
   140006268:	mov    DWORD PTR [rbp-0x48],0xffffffff
   14000626f:	jmp    0x140005706
   140006274:	mov    eax,DWORD PTR [rbp-0x50]
   140006277:	mov    DWORD PTR [rbp-0x70],eax
   14000627a:	mov    eax,DWORD PTR [rbp-0x90]
   140006280:	mov    DWORD PTR [rbp-0x48],eax
   140006283:	jmp    0x140005894
   140006288:	addsd  xmm0,xmm0
   14000628c:	movzx  ecx,BYTE PTR [rdx-0x1]
   140006290:	comisd xmm0,xmm2
   140006294:	ja     0x140006407
   14000629a:	ucomisd xmm0,xmm2
   14000629e:	mov    rsi,QWORD PTR [rbp-0x60]
   1400062a2:	mov    r8d,DWORD PTR [rbp-0x70]
   1400062a6:	jp     0x1400062b2
   1400062a8:	jne    0x1400062b2
   1400062aa:	test   al,0x1
   1400062ac:	jne    0x140005488
   1400062b2:	mov    DWORD PTR [rbp-0x40],0x10
   1400062b9:	nop    DWORD PTR [rax+0x0]
   1400062c0:	mov    rax,rdx
   1400062c3:	lea    rdx,[rdx-0x1]
   1400062c7:	cmp    BYTE PTR [rax-0x1],0x30
   1400062cb:	je     0x1400062c0
   1400062cd:	mov    QWORD PTR [rbp-0x60],rax
   1400062d1:	lea    eax,[r8+0x1]
   1400062d5:	mov    DWORD PTR [rbp-0x34],eax
   1400062d8:	jmp    0x140005666
   1400062dd:	pxor   xmm1,xmm1
   1400062e1:	xor    eax,eax
   1400062e3:	mov    ecx,0x1
   1400062e8:	mov    rsi,QWORD PTR [rbp-0x60]
   1400062ec:	ucomisd xmm0,xmm1
   1400062f0:	mov    QWORD PTR [rbp-0x60],rdx
   1400062f4:	setp   al
   1400062f7:	cmovne eax,ecx
   1400062fa:	shl    eax,0x4
   1400062fd:	mov    DWORD PTR [rbp-0x40],eax
   140006300:	lea    eax,[r8+0x1]
   140006304:	mov    DWORD PTR [rbp-0x34],eax
   140006307:	jmp    0x140005666
   14000630c:	mov    rsi,QWORD PTR [rbp-0x60]
   140006310:	jmp    0x140005488
   140006315:	movupd xmm1,xmm0
   140006319:	jmp    0x140005d6a
   14000631e:	mov    DWORD PTR [rbp-0x38],0x0
   140006325:	mov    r8d,DWORD PTR [rbp-0x74]
   140006329:	xor    edi,edi
   14000632b:	mov    r13d,DWORD PTR [rbp-0x68]
   14000632f:	jmp    0x14000578e
   140006334:	mov    edi,DWORD PTR [rbp-0x68]
   140006337:	mov    eax,ecx
   140006339:	add    DWORD PTR [rbp-0x50],ecx
   14000633c:	mov    DWORD PTR [rbp-0x4],ecx
   14000633f:	add    eax,edi
   140006341:	mov    r13d,edi
   140006344:	mov    DWORD PTR [rbp-0x68],eax
   140006347:	jmp    0x14000576a
   14000634c:	xor    r8d,r8d
   14000634f:	mov    rcx,rdi
   140006352:	mov    edx,0xa
   140006357:	call   0x1400068b0
   14000635c:	test   r14b,r14b
   14000635f:	mov    r9,QWORD PTR [rbp-0x48]
   140006363:	mov    rdi,rax
   140006366:	jne    0x140006274
   14000636c:	mov    eax,DWORD PTR [rbp-0x70]
   14000636f:	mov    r11d,DWORD PTR [rbp-0x30]
   140006373:	mov    DWORD PTR [rbp-0x34],eax
   140006376:	mov    eax,DWORD PTR [rbp-0x90]
   14000637c:	mov    DWORD PTR [rbp-0x48],eax
   14000637f:	jmp    0x140005944
   140006384:	pxor   xmm0,xmm0
   140006388:	xor    eax,eax
   14000638a:	mov    ecx,0x1
   14000638f:	mov    rsi,QWORD PTR [rbp-0x60]
   140006393:	ucomisd xmm1,xmm0
   140006397:	setp   al
   14000639a:	cmovne eax,ecx
   14000639d:	shl    eax,0x4
   1400063a0:	mov    DWORD PTR [rbp-0x40],eax
   1400063a3:	jmp    0x1400062c0
   1400063a8:	movzx  ecx,BYTE PTR [rdx-0x1]
   1400063ac:	mov    rsi,QWORD PTR [rbp-0x60]
   1400063b0:	mov    r8d,DWORD PTR [rbp-0x70]
   1400063b4:	jmp    0x140005488
   1400063b9:	mov    edi,DWORD PTR [rbp-0x48]
   1400063bc:	mov    edx,DWORD PTR [rbp-0x74]
   1400063bf:	lea    eax,[rdi-0x1]
   1400063c2:	cmp    edx,eax
   1400063c4:	jl     0x140005ed9
   1400063ca:	sub    edx,eax
   1400063cc:	mov    eax,DWORD PTR [rbp-0x68]
   1400063cf:	add    DWORD PTR [rbp-0x50],edi
   1400063d2:	mov    DWORD PTR [rbp-0x4],edi
   1400063d5:	mov    r8d,edx
   1400063d8:	mov    r13d,eax
   1400063db:	add    eax,edi
   1400063dd:	mov    DWORD PTR [rbp-0x68],eax
   1400063e0:	jmp    0x14000576a
   1400063e5:	mov    ecx,DWORD PTR [rbx+0x18]
   1400063e8:	test   ecx,ecx
   1400063ea:	jne    0x14000602d
   1400063f0:	test   edx,edx
   1400063f2:	jg     0x1400061ed
   1400063f8:	mov    rsi,rdi
   1400063fb:	lea    r12,[r10+0x1]
   1400063ff:	mov    rdi,r13
   140006402:	jmp    0x1400060d5
   140006407:	mov    rsi,QWORD PTR [rbp-0x60]
   14000640b:	mov    r8d,DWORD PTR [rbp-0x70]
   14000640f:	jmp    0x140005488
   140006414:	mov    edx,DWORD PTR [rbx+0x18]
   140006417:	mov    rsi,rdi
   14000641a:	mov    rdi,r13
   14000641d:	test   edx,edx
   14000641f:	je     0x14000646f
   140006421:	mov    DWORD PTR [rbp-0x40],0x10
   140006428:	lea    r12,[r10+0x1]
   14000642c:	jmp    0x1400060d5
   140006431:	lea    r12,[r10+0x1]
   140006435:	mov    rsi,rdi
   140006438:	mov    rdi,r13
   14000643b:	mov    BYTE PTR [r10],0x39
   14000643f:	mov    rdx,QWORD PTR [rbp-0x60]
   140006443:	mov    r14,r12
   140006446:	jmp    0x140005ea9
   14000644b:	jne    0x140006457
   14000644d:	test   r8b,0x1
   140006451:	jne    0x140006229
   140006457:	mov    DWORD PTR [rbp-0x38],0x20
   14000645e:	jmp    0x14000623e
   140006463:	mov    rsi,rdi
   140006466:	lea    r12,[r10+0x1]
   14000646a:	mov    rdi,r13
   14000646d:	jmp    0x14000643b
   14000646f:	mov    eax,DWORD PTR [rbp-0x38]
   140006472:	lea    r12,[r10+0x1]
   140006476:	mov    DWORD PTR [rbp-0x40],eax
   140006479:	jmp    0x1400060d5
   14000647e:	cmp    DWORD PTR [rbx+0x14],0x1
   140006482:	mov    DWORD PTR [rbp-0x40],0x10
   140006489:	jg     0x140005acd
   14000648f:	xor    eax,eax
   140006491:	cmp    DWORD PTR [rbx+0x18],0x0
   140006495:	setne  al
   140006498:	shl    eax,0x4
   14000649b:	mov    DWORD PTR [rbp-0x40],eax
   14000649e:	jmp    0x140005acd
   1400064a3:	nop
   1400064a4:	nop
   1400064a5:	nop
   1400064a6:	nop
   1400064a7:	nop
   1400064a8:	nop
   1400064a9:	nop
   1400064aa:	nop
   1400064ab:	nop
   1400064ac:	nop
   1400064ad:	nop
   1400064ae:	nop
   1400064af:	nop
   1400064b0:	push   rbp
   1400064b1:	push   r13
   1400064b3:	push   r12
   1400064b5:	push   rdi
   1400064b6:	push   rsi
   1400064b7:	push   rbx
   1400064b8:	lea    rbp,[rsp]
   1400064bc:	movsxd rbx,DWORD PTR [rcx+0x14]
   1400064c0:	mov    r12d,edx
   1400064c3:	mov    r10,rcx
   1400064c6:	sar    r12d,0x5
   1400064ca:	cmp    ebx,r12d
   1400064cd:	jg     0x1400064f0
   1400064cf:	mov    DWORD PTR [r10+0x14],0x0
   1400064d7:	mov    DWORD PTR [r10+0x18],0x0
   1400064df:	pop    rbx
   1400064e0:	pop    rsi
   1400064e1:	pop    rdi
   1400064e2:	pop    r12
   1400064e4:	pop    r13
   1400064e6:	pop    rbp
   1400064e7:	ret
   1400064e8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400064f0:	lea    r13,[rcx+0x18]
   1400064f4:	movsxd r12,r12d
   1400064f7:	lea    r11,[r13+rbx*4+0x0]
   1400064fc:	lea    rsi,[r13+r12*4+0x0]
   140006501:	and    edx,0x1f
   140006504:	je     0x140006568
   140006506:	mov    r9d,DWORD PTR [rsi]
   140006509:	mov    edi,0x20
   14000650e:	mov    ecx,edx
   140006510:	lea    r8,[rsi+0x4]
   140006514:	sub    edi,edx
   140006516:	shr    r9d,cl
   140006519:	cmp    r8,r11
   14000651c:	jae    0x1400065a8
   140006522:	mov    rsi,r13
   140006525:	nop    DWORD PTR [rax]
   140006528:	mov    eax,DWORD PTR [r8]
   14000652b:	mov    ecx,edi
   14000652d:	add    rsi,0x4
   140006531:	add    r8,0x4
   140006535:	shl    eax,cl
   140006537:	mov    ecx,edx
   140006539:	or     eax,r9d
   14000653c:	mov    DWORD PTR [rsi-0x4],eax
   14000653f:	mov    r9d,DWORD PTR [r8-0x4]
   140006543:	shr    r9d,cl
   140006546:	cmp    r8,r11
   140006549:	jb     0x140006528
   14000654b:	sub    rbx,r12
   14000654e:	lea    rax,[r13+rbx*4-0x4]
   140006553:	mov    DWORD PTR [rax],r9d
   140006556:	test   r9d,r9d
   140006559:	je     0x140006586
   14000655b:	add    rax,0x4
   14000655f:	jmp    0x140006586
   140006561:	nop    DWORD PTR [rax+0x0]
   140006568:	mov    rdi,r13
   14000656b:	cmp    rsi,r11
   14000656e:	jae    0x1400064cf
   140006574:	nop    DWORD PTR [rax+0x0]
   140006578:	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140006579:	cmp    rsi,r11
   14000657c:	jb     0x140006578
   14000657e:	sub    rbx,r12
   140006581:	lea    rax,[r13+rbx*4+0x0]
   140006586:	sub    rax,r13
   140006589:	sar    rax,0x2
   14000658d:	mov    DWORD PTR [r10+0x14],eax
   140006591:	test   eax,eax
   140006593:	je     0x1400064d7
   140006599:	pop    rbx
   14000659a:	pop    rsi
   14000659b:	pop    rdi
   14000659c:	pop    r12
   14000659e:	pop    r13
   1400065a0:	pop    rbp
   1400065a1:	ret
   1400065a2:	nop    WORD PTR [rax+rax*1+0x0]
   1400065a8:	mov    DWORD PTR [r10+0x18],r9d
   1400065ac:	test   r9d,r9d
   1400065af:	je     0x1400064cf
   1400065b5:	mov    rax,r13
   1400065b8:	jmp    0x14000655b
   1400065ba:	nop    WORD PTR [rax+rax*1+0x0]
   1400065c0:	movsxd rdx,DWORD PTR [rcx+0x14]
   1400065c4:	lea    rax,[rcx+0x18]
   1400065c8:	lea    rcx,[rax+rdx*4]
   1400065cc:	xor    edx,edx
   1400065ce:	cmp    rax,rcx
   1400065d1:	jb     0x1400065e4
   1400065d3:	jmp    0x1400065f7
   1400065d5:	nop    DWORD PTR [rax]
   1400065d8:	add    rax,0x4
   1400065dc:	add    edx,0x20
   1400065df:	cmp    rax,rcx
   1400065e2:	jae    0x1400065f7
   1400065e4:	mov    r8d,DWORD PTR [rax]
   1400065e7:	test   r8d,r8d
   1400065ea:	je     0x1400065d8
   1400065ec:	cmp    rax,rcx
   1400065ef:	jae    0x1400065f7
   1400065f1:	tzcnt  eax,DWORD PTR [rax]
   1400065f5:	add    edx,eax
   1400065f7:	mov    eax,edx
   1400065f9:	ret
   1400065fa:	nop
   1400065fb:	nop
   1400065fc:	nop
   1400065fd:	nop
   1400065fe:	nop
   1400065ff:	nop
   140006600:	push   rbp
   140006601:	push   rdi
   140006602:	push   rsi
   140006603:	push   rbx
   140006604:	sub    rsp,0x28
   140006608:	lea    rbp,[rsp+0x20]
   14000660d:	mov    eax,DWORD PTR [rip+0x64dd]        # 0x14000caf0
   140006613:	mov    esi,ecx
   140006615:	cmp    eax,0x2
   140006618:	je     0x1400066e0
   14000661e:	test   eax,eax
   140006620:	je     0x140006658
   140006622:	cmp    eax,0x1
   140006625:	jne    0x14000664b
   140006627:	mov    rbx,QWORD PTR [rip+0x6c32]        # 0x14000d260
   14000662e:	xchg   ax,ax
   140006630:	mov    ecx,0x1
   140006635:	call   rbx
   140006637:	mov    eax,DWORD PTR [rip+0x64b3]        # 0x14000caf0
   14000663d:	cmp    eax,0x1
   140006640:	je     0x140006630
   140006642:	cmp    eax,0x2
   140006645:	je     0x1400066e0
   14000664b:	add    rsp,0x28
   14000664f:	pop    rbx
   140006650:	pop    rsi
   140006651:	pop    rdi
   140006652:	pop    rbp
   140006653:	ret
   140006654:	nop    DWORD PTR [rax+0x0]
   140006658:	mov    eax,0x1
   14000665d:	xchg   DWORD PTR [rip+0x648d],eax        # 0x14000caf0
   140006663:	test   eax,eax
   140006665:	jne    0x1400066b8
   140006667:	lea    rbx,[rip+0x6492]        # 0x14000cb00
   14000666e:	mov    rdi,QWORD PTR [rip+0x6bb3]        # 0x14000d228
   140006675:	mov    rcx,rbx
   140006678:	call   rdi
   14000667a:	lea    rcx,[rbx+0x28]
   14000667e:	call   rdi
   140006680:	lea    rcx,[rip+0x69]        # 0x1400066f0
   140006687:	call   0x140001440
   14000668c:	mov    DWORD PTR [rip+0x645a],0x2        # 0x14000caf0
   140006696:	mov    rcx,rsi
   140006699:	neg    rcx
   14000669c:	and    ecx,0x28
   14000669f:	add    rcx,rbx
   1400066a2:	add    rsp,0x28
   1400066a6:	pop    rbx
   1400066a7:	pop    rsi
   1400066a8:	pop    rdi
   1400066a9:	pop    rbp
   1400066aa:	rex.W jmp QWORD PTR [rip+0x6b5f]        # 0x14000d210
   1400066b1:	nop    DWORD PTR [rax+0x0]
   1400066b8:	lea    rbx,[rip+0x6441]        # 0x14000cb00
   1400066bf:	cmp    eax,0x2
   1400066c2:	je     0x14000668c
   1400066c4:	mov    eax,DWORD PTR [rip+0x6426]        # 0x14000caf0
   1400066ca:	cmp    eax,0x1
   1400066cd:	je     0x140006627
   1400066d3:	jmp    0x140006642
   1400066d8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400066e0:	lea    rbx,[rip+0x6419]        # 0x14000cb00
   1400066e7:	jmp    0x140006696
   1400066e9:	nop    DWORD PTR [rax+0x0]
   1400066f0:	push   rbp
   1400066f1:	push   rbx
   1400066f2:	sub    rsp,0x28
   1400066f6:	lea    rbp,[rsp+0x20]
   1400066fb:	mov    eax,0x3
   140006700:	xchg   DWORD PTR [rip+0x63ea],eax        # 0x14000caf0
   140006706:	cmp    eax,0x2
   140006709:	je     0x140006718
   14000670b:	add    rsp,0x28
   14000670f:	pop    rbx
   140006710:	pop    rbp
   140006711:	ret
   140006712:	nop    WORD PTR [rax+rax*1+0x0]
   140006718:	mov    rbx,QWORD PTR [rip+0x6ae9]        # 0x14000d208
   14000671f:	lea    rcx,[rip+0x63da]        # 0x14000cb00
   140006726:	call   rbx
   140006728:	lea    rcx,[rip+0x63f9]        # 0x14000cb28
   14000672f:	mov    rax,rbx
   140006732:	add    rsp,0x28
   140006736:	pop    rbx
   140006737:	pop    rbp
   140006738:	rex.W jmp rax
   14000673b:	nop    DWORD PTR [rax+rax*1+0x0]
   140006740:	push   rbp
   140006741:	push   rsi
   140006742:	push   rbx
   140006743:	sub    rsp,0x30
   140006747:	lea    rbp,[rsp+0x30]
   14000674c:	mov    ebx,ecx
   14000674e:	xor    ecx,ecx
   140006750:	call   0x140006600
   140006755:	cmp    ebx,0x9
   140006758:	jg     0x140006798
   14000675a:	lea    rdx,[rip+0x633f]        # 0x14000caa0
   140006761:	movsxd rcx,ebx
   140006764:	mov    rax,QWORD PTR [rdx+rcx*8]
   140006768:	test   rax,rax
   14000676b:	je     0x1400067e8
   14000676d:	mov    r8,QWORD PTR [rax]
   140006770:	cmp    DWORD PTR [rip+0x6379],0x2        # 0x14000caf0
   140006777:	mov    QWORD PTR [rdx+rcx*8],r8
   14000677b:	jne    0x1400067d1
   14000677d:	mov    QWORD PTR [rbp-0x8],rax
   140006781:	lea    rcx,[rip+0x6378]        # 0x14000cb00
   140006788:	call   QWORD PTR [rip+0x6ab2]        # 0x14000d240
   14000678e:	mov    rax,QWORD PTR [rbp-0x8]
   140006792:	jmp    0x1400067d1
   140006794:	nop    DWORD PTR [rax+0x0]
   140006798:	mov    ecx,ebx
   14000679a:	mov    esi,0x1
   14000679f:	shl    esi,cl
   1400067a1:	lea    eax,[rsi-0x1]
   1400067a4:	cdqe
   1400067a6:	lea    rcx,[rax*4+0x27]
   1400067ae:	shr    rcx,0x3
   1400067b2:	mov    ecx,ecx
   1400067b4:	shl    rcx,0x3
   1400067b8:	call   0x140007a90
   1400067bd:	test   rax,rax
   1400067c0:	je     0x1400067d9
   1400067c2:	cmp    DWORD PTR [rip+0x6327],0x2        # 0x14000caf0
   1400067c9:	mov    DWORD PTR [rax+0x8],ebx
   1400067cc:	mov    DWORD PTR [rax+0xc],esi
   1400067cf:	je     0x14000677d
   1400067d1:	mov    QWORD PTR [rax+0x10],0x0
   1400067d9:	add    rsp,0x30
   1400067dd:	pop    rbx
   1400067de:	pop    rsi
   1400067df:	pop    rbp
   1400067e0:	ret
   1400067e1:	nop    DWORD PTR [rax+0x0]
   1400067e8:	mov    ecx,ebx
   1400067ea:	mov    esi,0x1
   1400067ef:	lea    r8,[rip+0x59aa]        # 0x14000c1a0
   1400067f6:	shl    esi,cl
   1400067f8:	lea    eax,[rsi-0x1]
   1400067fb:	cdqe
   1400067fd:	lea    rcx,[rax*4+0x27]
   140006805:	mov    rax,QWORD PTR [rip+0x1864]        # 0x140008070
   14000680c:	shr    rcx,0x3
   140006810:	mov    rdx,rax
   140006813:	sub    rdx,r8
   140006816:	sar    rdx,0x3
   14000681a:	add    rdx,rcx
   14000681d:	cmp    rdx,0x120
   140006824:	ja     0x1400067b4
   140006826:	lea    rdx,[rax+rcx*8]
   14000682a:	mov    QWORD PTR [rip+0x183f],rdx        # 0x140008070
   140006831:	jmp    0x1400067c2
   140006833:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000683e:	xchg   ax,ax
   140006840:	push   rbp
   140006841:	push   rbx
   140006842:	sub    rsp,0x28
   140006846:	lea    rbp,[rsp+0x20]
   14000684b:	mov    rbx,rcx
   14000684e:	test   rcx,rcx
   140006851:	je     0x14000688e
   140006853:	cmp    DWORD PTR [rcx+0x8],0x9
   140006857:	jle    0x140006868
   140006859:	add    rsp,0x28
   14000685d:	pop    rbx
   14000685e:	pop    rbp
   14000685f:	jmp    0x140007a70
   140006864:	nop    DWORD PTR [rax+0x0]
   140006868:	xor    ecx,ecx
   14000686a:	call   0x140006600
   14000686f:	movsxd rdx,DWORD PTR [rbx+0x8]
   140006873:	lea    rax,[rip+0x6226]        # 0x14000caa0
   14000687a:	cmp    DWORD PTR [rip+0x626f],0x2        # 0x14000caf0
   140006881:	mov    rcx,QWORD PTR [rax+rdx*8]
   140006885:	mov    QWORD PTR [rax+rdx*8],rbx
   140006889:	mov    QWORD PTR [rbx],rcx
   14000688c:	je     0x140006898
   14000688e:	add    rsp,0x28
   140006892:	pop    rbx
   140006893:	pop    rbp
   140006894:	ret
   140006895:	nop    DWORD PTR [rax]
   140006898:	lea    rcx,[rip+0x6261]        # 0x14000cb00
   14000689f:	add    rsp,0x28
   1400068a3:	pop    rbx
   1400068a4:	pop    rbp
   1400068a5:	rex.W jmp QWORD PTR [rip+0x6994]        # 0x14000d240
   1400068ac:	nop    DWORD PTR [rax+0x0]
   1400068b0:	push   rbp
   1400068b1:	push   r12
   1400068b3:	push   rdi
   1400068b4:	push   rsi
   1400068b5:	push   rbx
   1400068b6:	sub    rsp,0x20
   1400068ba:	lea    rbp,[rsp+0x20]
   1400068bf:	mov    edi,DWORD PTR [rcx+0x14]
   1400068c2:	mov    rbx,rcx
   1400068c5:	movsxd rsi,r8d
   1400068c8:	movsxd rdx,edx
   1400068cb:	xor    ecx,ecx
   1400068cd:	nop    DWORD PTR [rax]
   1400068d0:	mov    eax,DWORD PTR [rbx+rcx*4+0x18]
   1400068d4:	imul   rax,rdx
   1400068d8:	add    rax,rsi
   1400068db:	mov    DWORD PTR [rbx+rcx*4+0x18],eax
   1400068df:	mov    rsi,rax
   1400068e2:	add    rcx,0x1
   1400068e6:	shr    rsi,0x20
   1400068ea:	cmp    edi,ecx
   1400068ec:	jg     0x1400068d0
   1400068ee:	mov    r12,rbx
   1400068f1:	test   rsi,rsi
   1400068f4:	je     0x14000690b
   1400068f6:	cmp    DWORD PTR [rbx+0xc],edi
   1400068f9:	jle    0x140006920
   1400068fb:	movsxd rax,edi
   1400068fe:	add    edi,0x1
   140006901:	mov    r12,rbx
   140006904:	mov    DWORD PTR [rbx+rax*4+0x18],esi
   140006908:	mov    DWORD PTR [rbx+0x14],edi
   14000690b:	mov    rax,r12
   14000690e:	add    rsp,0x20
   140006912:	pop    rbx
   140006913:	pop    rsi
   140006914:	pop    rdi
   140006915:	pop    r12
   140006917:	pop    rbp
   140006918:	ret
   140006919:	nop    DWORD PTR [rax+0x0]
   140006920:	mov    eax,DWORD PTR [rbx+0x8]
   140006923:	lea    ecx,[rax+0x1]
   140006926:	call   0x140006740
   14000692b:	mov    r12,rax
   14000692e:	test   rax,rax
   140006931:	je     0x14000690b
   140006933:	lea    rcx,[rax+0x10]
   140006937:	movsxd rax,DWORD PTR [rbx+0x14]
   14000693b:	lea    rdx,[rbx+0x10]
   14000693f:	lea    r8,[rax*4+0x8]
   140006947:	call   0x140007a98
   14000694c:	mov    rcx,rbx
   14000694f:	mov    rbx,r12
   140006952:	call   0x140006840
   140006957:	movsxd rax,edi
   14000695a:	add    edi,0x1
   14000695d:	mov    r12,rbx
   140006960:	mov    DWORD PTR [rbx+rax*4+0x18],esi
   140006964:	mov    DWORD PTR [rbx+0x14],edi
   140006967:	jmp    0x14000690b
   140006969:	nop    DWORD PTR [rax+0x0]
   140006970:	push   rbp
   140006971:	push   rbx
   140006972:	sub    rsp,0x38
   140006976:	lea    rbp,[rsp+0x30]
   14000697b:	mov    ebx,ecx
   14000697d:	xor    ecx,ecx
   14000697f:	call   0x140006600
   140006984:	mov    rax,QWORD PTR [rip+0x611d]        # 0x14000caa8
   14000698b:	test   rax,rax
   14000698e:	je     0x1400069c0
   140006990:	mov    rdx,QWORD PTR [rax]
   140006993:	cmp    DWORD PTR [rip+0x6156],0x2        # 0x14000caf0
   14000699a:	mov    QWORD PTR [rip+0x6107],rdx        # 0x14000caa8
   1400069a1:	je     0x140006a08
   1400069a3:	mov    rdx,QWORD PTR [rip+0x2ea6]        # 0x140009850
   1400069aa:	mov    DWORD PTR [rax+0x18],ebx
   1400069ad:	mov    QWORD PTR [rax+0x10],rdx
   1400069b1:	add    rsp,0x38
   1400069b5:	pop    rbx
   1400069b6:	pop    rbp
   1400069b7:	ret
   1400069b8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400069c0:	mov    rax,QWORD PTR [rip+0x16a9]        # 0x140008070
   1400069c7:	lea    rcx,[rip+0x57d2]        # 0x14000c1a0
   1400069ce:	mov    rdx,rax
   1400069d1:	sub    rdx,rcx
   1400069d4:	sar    rdx,0x3
   1400069d8:	add    rdx,0x5
   1400069dc:	cmp    rdx,0x120
   1400069e3:	jbe    0x140006a20
   1400069e5:	mov    ecx,0x28
   1400069ea:	call   0x140007a90
   1400069ef:	test   rax,rax
   1400069f2:	je     0x1400069b1
   1400069f4:	mov    rdx,QWORD PTR [rip+0x2e4d]        # 0x140009848
   1400069fb:	cmp    DWORD PTR [rip+0x60ee],0x2        # 0x14000caf0
   140006a02:	mov    QWORD PTR [rax+0x8],rdx
   140006a06:	jne    0x1400069a3
   140006a08:	mov    QWORD PTR [rbp-0x8],rax
   140006a0c:	lea    rcx,[rip+0x60ed]        # 0x14000cb00
   140006a13:	call   QWORD PTR [rip+0x6827]        # 0x14000d240
   140006a19:	mov    rax,QWORD PTR [rbp-0x8]
   140006a1d:	jmp    0x1400069a3
   140006a1f:	nop
   140006a20:	lea    rdx,[rax+0x28]
   140006a24:	mov    QWORD PTR [rip+0x1645],rdx        # 0x140008070
   140006a2b:	jmp    0x1400069f4
   140006a2d:	nop    DWORD PTR [rax]
   140006a30:	push   rbp
   140006a31:	push   r15
   140006a33:	push   r14
   140006a35:	push   r13
   140006a37:	push   r12
   140006a39:	push   rdi
   140006a3a:	push   rsi
   140006a3b:	push   rbx
   140006a3c:	sub    rsp,0x38
   140006a40:	lea    rbp,[rsp+0x30]
   140006a45:	movsxd r14,DWORD PTR [rcx+0x14]
   140006a49:	movsxd r13,DWORD PTR [rdx+0x14]
   140006a4d:	mov    r9,rcx
   140006a50:	mov    r15,rdx
   140006a53:	cmp    r14d,r13d
   140006a56:	jl     0x140006a67
   140006a58:	mov    eax,r13d
   140006a5b:	mov    r15,rcx
   140006a5e:	movsxd r13,r14d
   140006a61:	mov    r9,rdx
   140006a64:	movsxd r14,eax
   140006a67:	mov    ecx,DWORD PTR [r15+0x8]
   140006a6b:	lea    ebx,[r13+r14*1+0x0]
   140006a70:	cmp    DWORD PTR [r15+0xc],ebx
   140006a74:	jge    0x140006a79
   140006a76:	add    ecx,0x1
   140006a79:	mov    QWORD PTR [rbp+0x50],r9
   140006a7d:	call   0x140006740
   140006a82:	mov    rdi,rax
   140006a85:	test   rax,rax
   140006a88:	je     0x140006b83
   140006a8e:	lea    r12,[rax+0x18]
   140006a92:	movsxd rax,ebx
   140006a95:	mov    r9,QWORD PTR [rbp+0x50]
   140006a99:	lea    rsi,[r12+rax*4]
   140006a9d:	cmp    r12,rsi
   140006aa0:	jae    0x140006aca
   140006aa2:	mov    rax,rsi
   140006aa5:	xor    edx,edx
   140006aa7:	mov    rcx,r12
   140006aaa:	mov    QWORD PTR [rbp+0x50],r9
   140006aae:	sub    rax,rdi
   140006ab1:	sub    rax,0x19
   140006ab5:	shr    rax,0x2
   140006ab9:	lea    r8,[rax*4+0x4]
   140006ac1:	call   0x140007aa0
   140006ac6:	mov    r9,QWORD PTR [rbp+0x50]
   140006aca:	add    r9,0x18
   140006ace:	lea    r11,[r15+0x18]
   140006ad2:	lea    r14,[r9+r14*4]
   140006ad6:	lea    r13,[r11+r13*4]
   140006ada:	cmp    r9,r14
   140006add:	jae    0x140006b68
   140006ae3:	mov    rax,r13
   140006ae6:	lea    r10,[r15+0x19]
   140006aea:	sub    rax,r15
   140006aed:	sub    rax,0x19
   140006af1:	shr    rax,0x2
   140006af5:	cmp    r13,r10
   140006af8:	lea    rdx,[rax*4+0x4]
   140006b00:	mov    eax,0x4
   140006b05:	cmovae rax,rdx
   140006b09:	mov    QWORD PTR [rbp-0x8],rax
   140006b0d:	jmp    0x140006b19
   140006b0f:	nop
   140006b10:	add    r12,0x4
   140006b14:	cmp    r9,r14
   140006b17:	jae    0x140006b68
   140006b19:	mov    r10d,DWORD PTR [r9]
   140006b1c:	add    r9,0x4
   140006b20:	test   r10d,r10d
   140006b23:	je     0x140006b10
   140006b25:	mov    rcx,r12
   140006b28:	mov    rdx,r11
   140006b2b:	xor    r8d,r8d
   140006b2e:	xchg   ax,ax
   140006b30:	mov    eax,DWORD PTR [rdx]
   140006b32:	mov    r15d,DWORD PTR [rcx]
   140006b35:	add    rdx,0x4
   140006b39:	add    rcx,0x4
   140006b3d:	imul   rax,r10
   140006b41:	add    rax,r15
   140006b44:	add    rax,r8
   140006b47:	mov    r8,rax
   140006b4a:	mov    DWORD PTR [rcx-0x4],eax
   140006b4d:	shr    r8,0x20
   140006b51:	cmp    rdx,r13
   140006b54:	jb     0x140006b30
   140006b56:	mov    rax,QWORD PTR [rbp-0x8]
   140006b5a:	add    r12,0x4
   140006b5e:	mov    DWORD PTR [r12+rax*1-0x4],r8d
   140006b63:	cmp    r9,r14
   140006b66:	jb     0x140006b19
   140006b68:	test   ebx,ebx
   140006b6a:	jg     0x140006b75
   140006b6c:	jmp    0x140006b80
   140006b6e:	xchg   ax,ax
   140006b70:	sub    ebx,0x1
   140006b73:	je     0x140006b80
   140006b75:	mov    eax,DWORD PTR [rsi-0x4]
   140006b78:	sub    rsi,0x4
   140006b7c:	test   eax,eax
   140006b7e:	je     0x140006b70
   140006b80:	mov    DWORD PTR [rdi+0x14],ebx
   140006b83:	mov    rax,rdi
   140006b86:	add    rsp,0x38
   140006b8a:	pop    rbx
   140006b8b:	pop    rsi
   140006b8c:	pop    rdi
   140006b8d:	pop    r12
   140006b8f:	pop    r13
   140006b91:	pop    r14
   140006b93:	pop    r15
   140006b95:	pop    rbp
   140006b96:	ret
   140006b97:	nop    WORD PTR [rax+rax*1+0x0]
   140006ba0:	push   rbp
   140006ba1:	push   r12
   140006ba3:	push   rdi
   140006ba4:	push   rsi
   140006ba5:	push   rbx
   140006ba6:	sub    rsp,0x20
   140006baa:	lea    rbp,[rsp+0x20]
   140006baf:	mov    eax,edx
   140006bb1:	mov    rsi,rcx
   140006bb4:	mov    ebx,edx
   140006bb6:	and    eax,0x3
   140006bb9:	jne    0x140006c80
   140006bbf:	sar    ebx,0x2
   140006bc2:	mov    r12,rsi
   140006bc5:	je     0x140006c1a
   140006bc7:	mov    rdi,QWORD PTR [rip+0x55b2]        # 0x14000c180
   140006bce:	test   rdi,rdi
   140006bd1:	je     0x140006cb0
   140006bd7:	mov    r12,rsi
   140006bda:	jmp    0x140006bef
   140006bdc:	nop    DWORD PTR [rax+0x0]
   140006be0:	sar    ebx,1
   140006be2:	je     0x140006c1a
   140006be4:	mov    rsi,QWORD PTR [rdi]
   140006be7:	test   rsi,rsi
   140006bea:	je     0x140006c30
   140006bec:	mov    rdi,rsi
   140006bef:	test   bl,0x1
   140006bf2:	je     0x140006be0
   140006bf4:	mov    rdx,rdi
   140006bf7:	mov    rcx,r12
   140006bfa:	call   0x140006a30
   140006bff:	mov    rsi,rax
   140006c02:	test   rax,rax
   140006c05:	je     0x140006ca8
   140006c0b:	mov    rcx,r12
   140006c0e:	mov    r12,rsi
   140006c11:	call   0x140006840
   140006c16:	sar    ebx,1
   140006c18:	jne    0x140006be4
   140006c1a:	mov    rax,r12
   140006c1d:	add    rsp,0x20
   140006c21:	pop    rbx
   140006c22:	pop    rsi
   140006c23:	pop    rdi
   140006c24:	pop    r12
   140006c26:	pop    rbp
   140006c27:	ret
   140006c28:	nop    DWORD PTR [rax+rax*1+0x0]
   140006c30:	mov    ecx,0x1
   140006c35:	call   0x140006600
   140006c3a:	mov    rsi,QWORD PTR [rdi]
   140006c3d:	test   rsi,rsi
   140006c40:	je     0x140006c60
   140006c42:	cmp    DWORD PTR [rip+0x5ea7],0x2        # 0x14000caf0
   140006c49:	jne    0x140006bec
   140006c4b:	lea    rcx,[rip+0x5ed6]        # 0x14000cb28
   140006c52:	call   QWORD PTR [rip+0x65e8]        # 0x14000d240
   140006c58:	jmp    0x140006bec
   140006c5a:	nop    WORD PTR [rax+rax*1+0x0]
   140006c60:	mov    rdx,rdi
   140006c63:	mov    rcx,rdi
   140006c66:	call   0x140006a30
   140006c6b:	mov    QWORD PTR [rdi],rax
   140006c6e:	mov    rsi,rax
   140006c71:	test   rax,rax
   140006c74:	je     0x140006ca8
   140006c76:	mov    QWORD PTR [rax],0x0
   140006c7d:	jmp    0x140006c42
   140006c7f:	nop
   140006c80:	sub    eax,0x1
   140006c83:	lea    rdx,[rip+0x2a76]        # 0x140009700
   140006c8a:	xor    r8d,r8d
   140006c8d:	cdqe
   140006c8f:	mov    edx,DWORD PTR [rdx+rax*4]
   140006c92:	call   0x1400068b0
   140006c97:	mov    rsi,rax
   140006c9a:	test   rax,rax
   140006c9d:	jne    0x140006bbf
   140006ca3:	nop    DWORD PTR [rax+rax*1+0x0]
   140006ca8:	xor    r12d,r12d
   140006cab:	jmp    0x140006c1a
   140006cb0:	mov    ecx,0x1
   140006cb5:	call   0x140006600
   140006cba:	mov    rdi,QWORD PTR [rip+0x54bf]        # 0x14000c180
   140006cc1:	test   rdi,rdi
   140006cc4:	je     0x140006ce5
   140006cc6:	cmp    DWORD PTR [rip+0x5e23],0x2        # 0x14000caf0
   140006ccd:	jne    0x140006bd7
   140006cd3:	lea    rcx,[rip+0x5e4e]        # 0x14000cb28
   140006cda:	call   QWORD PTR [rip+0x6560]        # 0x14000d240
   140006ce0:	jmp    0x140006bd7
   140006ce5:	mov    ecx,0x1
   140006cea:	call   0x140006740
   140006cef:	mov    rdi,rax
   140006cf2:	test   rax,rax
   140006cf5:	je     0x140006d15
   140006cf7:	movabs rax,0x27100000001
   140006d01:	mov    QWORD PTR [rip+0x5478],rdi        # 0x14000c180
   140006d08:	mov    QWORD PTR [rdi+0x14],rax
   140006d0c:	mov    QWORD PTR [rdi],0x0
   140006d13:	jmp    0x140006cc6
   140006d15:	mov    QWORD PTR [rip+0x5460],0x0        # 0x14000c180
   140006d20:	jmp    0x140006ca8
   140006d22:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140006d2d:	nop    DWORD PTR [rax]
   140006d30:	push   rbp
   140006d31:	push   r15
   140006d33:	push   r14
   140006d35:	push   r13
   140006d37:	push   r12
   140006d39:	push   rdi
   140006d3a:	push   rsi
   140006d3b:	push   rbx
   140006d3c:	sub    rsp,0x28
   140006d40:	lea    rbp,[rsp+0x20]
   140006d45:	mov    r13,rcx
   140006d48:	mov    esi,edx
   140006d4a:	mov    ecx,DWORD PTR [rcx+0x8]
   140006d4d:	mov    r14d,edx
   140006d50:	mov    ebx,DWORD PTR [r13+0x14]
   140006d54:	sar    esi,0x5
   140006d57:	mov    eax,DWORD PTR [r13+0xc]
   140006d5b:	add    ebx,esi
   140006d5d:	lea    r12d,[rbx+0x1]
   140006d61:	cmp    r12d,eax
   140006d64:	jle    0x140006d7a
   140006d66:	cs nop WORD PTR [rax+rax*1+0x0]
   140006d70:	add    eax,eax
   140006d72:	add    ecx,0x1
   140006d75:	cmp    r12d,eax
   140006d78:	jg     0x140006d70
   140006d7a:	call   0x140006740
   140006d7f:	mov    r15,rax
   140006d82:	test   rax,rax
   140006d85:	je     0x140006e2e
   140006d8b:	lea    rdi,[rax+0x18]
   140006d8f:	test   esi,esi
   140006d91:	jle    0x140006da7
   140006d93:	shl    rsi,0x2
   140006d97:	mov    rcx,rdi
   140006d9a:	xor    edx,edx
   140006d9c:	mov    r8,rsi
   140006d9f:	add    rdi,rsi
   140006da2:	call   0x140007aa0
   140006da7:	movsxd rax,DWORD PTR [r13+0x14]
   140006dab:	lea    rsi,[r13+0x18]
   140006daf:	lea    r8,[rsi+rax*4]
   140006db3:	and    r14d,0x1f
   140006db7:	je     0x140006e48
   140006dbd:	mov    r10d,0x20
   140006dc3:	mov    r9,rdi
   140006dc6:	xor    edx,edx
   140006dc8:	sub    r10d,r14d
   140006dcb:	nop    DWORD PTR [rax+rax*1+0x0]
   140006dd0:	mov    eax,DWORD PTR [rsi]
   140006dd2:	mov    ecx,r14d
   140006dd5:	add    r9,0x4
   140006dd9:	add    rsi,0x4
   140006ddd:	shl    eax,cl
   140006ddf:	mov    ecx,r10d
   140006de2:	or     eax,edx
   140006de4:	mov    DWORD PTR [r9-0x4],eax
   140006de8:	mov    edx,DWORD PTR [rsi-0x4]
   140006deb:	shr    edx,cl
   140006ded:	cmp    rsi,r8
   140006df0:	jb     0x140006dd0
   140006df2:	mov    rax,r8
   140006df5:	lea    rcx,[r13+0x19]
   140006df9:	sub    rax,r13
   140006dfc:	sub    rax,0x19
   140006e00:	shr    rax,0x2
   140006e04:	cmp    r8,rcx
   140006e07:	mov    ecx,0x4
   140006e0c:	lea    rax,[rax*4+0x4]
   140006e14:	cmovb  rax,rcx
   140006e18:	mov    DWORD PTR [rdi+rax*1],edx
   140006e1b:	test   edx,edx
   140006e1d:	jne    0x140006e22
   140006e1f:	mov    r12d,ebx
   140006e22:	mov    DWORD PTR [r15+0x14],r12d
   140006e26:	mov    rcx,r13
   140006e29:	call   0x140006840
   140006e2e:	mov    rax,r15
   140006e31:	add    rsp,0x28
   140006e35:	pop    rbx
   140006e36:	pop    rsi
   140006e37:	pop    rdi
   140006e38:	pop    r12
   140006e3a:	pop    r13
   140006e3c:	pop    r14
   140006e3e:	pop    r15
   140006e40:	pop    rbp
   140006e41:	ret
   140006e42:	nop    WORD PTR [rax+rax*1+0x0]
   140006e48:	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140006e49:	cmp    rsi,r8
   140006e4c:	jae    0x140006e1f
   140006e4e:	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   140006e4f:	cmp    rsi,r8
   140006e52:	jb     0x140006e48
   140006e54:	jmp    0x140006e1f
   140006e56:	cs nop WORD PTR [rax+rax*1+0x0]
   140006e60:	movsxd rax,DWORD PTR [rdx+0x14]
   140006e64:	mov    r9d,DWORD PTR [rcx+0x14]
   140006e68:	sub    r9d,eax
   140006e6b:	jne    0x140006ea4
   140006e6d:	lea    r8,[rax*4+0x0]
   140006e75:	add    rcx,0x18
   140006e79:	lea    rax,[rcx+r8*1]
   140006e7d:	lea    rdx,[rdx+r8*1+0x18]
   140006e82:	jmp    0x140006e8d
   140006e84:	nop    DWORD PTR [rax+0x0]
   140006e88:	cmp    rcx,rax
   140006e8b:	jae    0x140006ea4
   140006e8d:	sub    rax,0x4
   140006e91:	sub    rdx,0x4
   140006e95:	mov    r10d,DWORD PTR [rdx]
   140006e98:	cmp    DWORD PTR [rax],r10d
   140006e9b:	je     0x140006e88
   140006e9d:	sbb    r9d,r9d
   140006ea0:	or     r9d,0x1
   140006ea4:	mov    eax,r9d
   140006ea7:	ret
   140006ea8:	nop    DWORD PTR [rax+rax*1+0x0]
   140006eb0:	push   rbp
   140006eb1:	push   r14
   140006eb3:	push   r13
   140006eb5:	push   r12
   140006eb7:	push   rdi
   140006eb8:	push   rsi
   140006eb9:	push   rbx
   140006eba:	sub    rsp,0x20
   140006ebe:	lea    rbp,[rsp+0x20]
   140006ec3:	movsxd rax,DWORD PTR [rdx+0x14]
   140006ec7:	mov    rbx,rcx
   140006eca:	mov    rsi,rdx
   140006ecd:	cmp    DWORD PTR [rcx+0x14],eax
   140006ed0:	jne    0x140007028
   140006ed6:	lea    rdx,[rax*4+0x0]
   140006ede:	lea    rcx,[rcx+0x18]
   140006ee2:	lea    rax,[rcx+rdx*1]
   140006ee6:	lea    rdx,[rsi+rdx*1+0x18]
   140006eeb:	jmp    0x140006ef9
   140006eed:	nop    DWORD PTR [rax]
   140006ef0:	cmp    rcx,rax
   140006ef3:	jae    0x140007040
   140006ef9:	sub    rax,0x4
   140006efd:	sub    rdx,0x4
   140006f01:	mov    edi,DWORD PTR [rdx]
   140006f03:	cmp    DWORD PTR [rax],edi
   140006f05:	je     0x140006ef0
   140006f07:	mov    edi,0x1
   140006f0c:	jb     0x140006f19
   140006f0e:	mov    rax,rsi
   140006f11:	xor    edi,edi
   140006f13:	mov    rsi,rbx
   140006f16:	mov    rbx,rax
   140006f19:	mov    ecx,DWORD PTR [rsi+0x8]
   140006f1c:	call   0x140006740
   140006f21:	mov    r9,rax
   140006f24:	test   rax,rax
   140006f27:	je     0x140007013
   140006f2d:	mov    DWORD PTR [rax+0x10],edi
   140006f30:	movsxd rax,DWORD PTR [rsi+0x14]
   140006f34:	lea    r13,[rsi+0x18]
   140006f38:	lea    r12,[r9+0x18]
   140006f3c:	mov    ecx,0x18
   140006f41:	xor    edx,edx
   140006f43:	mov    r10,rax
   140006f46:	lea    r11,[r13+rax*4+0x0]
   140006f4b:	movsxd rax,DWORD PTR [rbx+0x14]
   140006f4f:	lea    r8,[rbx+rax*4+0x18]
   140006f54:	nop    DWORD PTR [rax+0x0]
   140006f58:	mov    edi,DWORD PTR [rbx+rcx*1]
   140006f5b:	mov    eax,DWORD PTR [rsi+rcx*1]
   140006f5e:	sub    rax,rdi
   140006f61:	sub    rax,rdx
   140006f64:	mov    DWORD PTR [r9+rcx*1],eax
   140006f68:	mov    rdx,rax
   140006f6b:	add    rcx,0x4
   140006f6f:	mov    edi,eax
   140006f71:	shr    rdx,0x20
   140006f75:	lea    rax,[rcx+rbx*1]
   140006f79:	and    edx,0x1
   140006f7c:	cmp    rax,r8
   140006f7f:	jb     0x140006f58
   140006f81:	lea    rax,[rbx+0x19]
   140006f85:	mov    ecx,0x4
   140006f8a:	cmp    r8,rax
   140006f8d:	setae  sil
   140006f91:	sub    r8,rbx
   140006f94:	lea    r14,[r8-0x19]
   140006f98:	shr    r14,0x2
   140006f9c:	test   sil,sil
   140006f9f:	lea    rax,[r14*4+0x4]
   140006fa7:	cmove  rax,rcx
   140006fab:	add    r13,rax
   140006fae:	lea    r8,[r12+rax*1]
   140006fb2:	mov    rbx,r8
   140006fb5:	mov    rcx,r13
   140006fb8:	cmp    r13,r11
   140006fbb:	jae    0x140007060
   140006fc1:	nop    DWORD PTR [rax+0x0]
   140006fc8:	mov    eax,DWORD PTR [rcx]
   140006fca:	add    rcx,0x4
   140006fce:	add    rbx,0x4
   140006fd2:	sub    rax,rdx
   140006fd5:	mov    rdx,rax
   140006fd8:	mov    DWORD PTR [rbx-0x4],eax
   140006fdb:	mov    edi,eax
   140006fdd:	shr    rdx,0x20
   140006fe1:	and    edx,0x1
   140006fe4:	cmp    rcx,r11
   140006fe7:	jb     0x140006fc8
   140006fe9:	sub    r11,0x1
   140006fed:	sub    r11,r13
   140006ff0:	and    r11,0xfffffffffffffffc
   140006ff4:	lea    rax,[r8+r11*1]
   140006ff8:	test   edi,edi
   140006ffa:	jne    0x14000700f
   140006ffc:	nop    DWORD PTR [rax+0x0]
   140007000:	mov    edx,DWORD PTR [rax-0x4]
   140007003:	sub    rax,0x4
   140007007:	sub    r10d,0x1
   14000700b:	test   edx,edx
   14000700d:	je     0x140007000
   14000700f:	mov    DWORD PTR [r9+0x14],r10d
   140007013:	mov    rax,r9
   140007016:	add    rsp,0x20
   14000701a:	pop    rbx
   14000701b:	pop    rsi
   14000701c:	pop    rdi
   14000701d:	pop    r12
   14000701f:	pop    r13
   140007021:	pop    r14
   140007023:	pop    rbp
   140007024:	ret
   140007025:	nop    DWORD PTR [rax]
   140007028:	mov    edi,0x1
   14000702d:	jns    0x140006f0e
   140007033:	jmp    0x140006f19
   140007038:	nop    DWORD PTR [rax+rax*1+0x0]
   140007040:	xor    ecx,ecx
   140007042:	call   0x140006740
   140007047:	mov    r9,rax
   14000704a:	test   rax,rax
   14000704d:	je     0x140007013
   14000704f:	mov    QWORD PTR [rax+0x14],0x1
   140007057:	jmp    0x140007013
   140007059:	nop    DWORD PTR [rax+0x0]
   140007060:	xor    eax,eax
   140007062:	shl    r14,0x2
   140007066:	test   sil,sil
   140007069:	cmove  r14,rax
   14000706d:	lea    rax,[r12+r14*1]
   140007071:	jmp    0x140006ff8
   140007073:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000707e:	xchg   ax,ax
   140007080:	push   rbp
   140007081:	push   rdi
   140007082:	push   rsi
   140007083:	push   rbx
   140007084:	lea    rbp,[rsp]
   140007088:	movsxd rax,DWORD PTR [rcx+0x14]
   14000708c:	lea    r11,[rcx+0x18]
   140007090:	lea    r10,[r11+rax*4]
   140007094:	mov    r9d,DWORD PTR [r10-0x4]
   140007098:	lea    rsi,[r10-0x4]
   14000709c:	bsr    ecx,r9d
   1400070a0:	mov    edi,ecx
   1400070a2:	mov    ecx,0x20
   1400070a7:	xor    edi,0x1f
   1400070aa:	mov    r8d,ecx
   1400070ad:	sub    r8d,edi
   1400070b0:	mov    DWORD PTR [rdx],r8d
   1400070b3:	cmp    edi,0xa
   1400070b6:	jle    0x140007130
   1400070b8:	lea    ebx,[rdi-0xb]
   1400070bb:	cmp    r11,rsi
   1400070be:	jae    0x140007110
   1400070c0:	mov    edx,DWORD PTR [r10-0x8]
   1400070c4:	test   ebx,ebx
   1400070c6:	je     0x140007117
   1400070c8:	sub    ecx,ebx
   1400070ca:	mov    eax,r9d
   1400070cd:	mov    esi,edx
   1400070cf:	mov    r8d,ecx
   1400070d2:	mov    ecx,ebx
   1400070d4:	shl    eax,cl
   1400070d6:	mov    ecx,r8d
   1400070d9:	shr    esi,cl
   1400070db:	mov    ecx,ebx
   1400070dd:	or     eax,esi
   1400070df:	shl    edx,cl
   1400070e1:	lea    rcx,[r10-0x8]
   1400070e5:	or     eax,0x3ff00000
   1400070ea:	shl    rax,0x20
   1400070ee:	cmp    r11,rcx
   1400070f1:	jae    0x140007123
   1400070f3:	mov    r9d,DWORD PTR [r10-0xc]
   1400070f7:	mov    ecx,r8d
   1400070fa:	shr    r9d,cl
   1400070fd:	or     edx,r9d
   140007100:	or     rax,rdx
   140007103:	movq   xmm0,rax
   140007108:	pop    rbx
   140007109:	pop    rsi
   14000710a:	pop    rdi
   14000710b:	pop    rbp
   14000710c:	ret
   14000710d:	nop    DWORD PTR [rax]
   140007110:	xor    edx,edx
   140007112:	cmp    edi,0xb
   140007115:	jne    0x140007170
   140007117:	mov    eax,r9d
   14000711a:	or     eax,0x3ff00000
   14000711f:	shl    rax,0x20
   140007123:	or     rax,rdx
   140007126:	movq   xmm0,rax
   14000712b:	pop    rbx
   14000712c:	pop    rsi
   14000712d:	pop    rdi
   14000712e:	pop    rbp
   14000712f:	ret
   140007130:	mov    ecx,0xb
   140007135:	mov    eax,r9d
   140007138:	xor    r8d,r8d
   14000713b:	sub    ecx,edi
   14000713d:	shr    eax,cl
   14000713f:	or     eax,0x3ff00000
   140007144:	shl    rax,0x20
   140007148:	cmp    r11,rsi
   14000714b:	jae    0x140007154
   14000714d:	mov    r8d,DWORD PTR [r10-0x8]
   140007151:	shr    r8d,cl
   140007154:	lea    ecx,[rdi+0x15]
   140007157:	mov    edx,r9d
   14000715a:	shl    edx,cl
   14000715c:	or     edx,r8d
   14000715f:	or     rax,rdx
   140007162:	movq   xmm0,rax
   140007167:	pop    rbx
   140007168:	pop    rsi
   140007169:	pop    rdi
   14000716a:	pop    rbp
   14000716b:	ret
   14000716c:	nop    DWORD PTR [rax+0x0]
   140007170:	mov    eax,r9d
   140007173:	mov    ecx,ebx
   140007175:	xor    edx,edx
   140007177:	shl    eax,cl
   140007179:	or     eax,0x3ff00000
   14000717e:	shl    rax,0x20
   140007182:	or     rax,rdx
   140007185:	movq   xmm0,rax
   14000718a:	pop    rbx
   14000718b:	pop    rsi
   14000718c:	pop    rdi
   14000718d:	pop    rbp
   14000718e:	ret
   14000718f:	nop
   140007190:	push   rbp
   140007191:	push   rsi
   140007192:	push   rbx
   140007193:	sub    rsp,0x30
   140007197:	lea    rbp,[rsp+0x20]
   14000719c:	movups XMMWORD PTR [rbp+0x0],xmm6
   1400071a0:	mov    ecx,0x1
   1400071a5:	mov    rsi,rdx
   1400071a8:	movupd xmm6,xmm0
   1400071ac:	mov    rbx,r8
   1400071af:	call   0x140006740
   1400071b4:	mov    rdx,rax
   1400071b7:	test   rax,rax
   1400071ba:	je     0x140007254
   1400071c0:	movq   rax,xmm6
   1400071c5:	mov    rcx,rax
   1400071c8:	shr    rcx,0x20
   1400071cc:	mov    r9d,ecx
   1400071cf:	shr    ecx,0x14
   1400071d2:	and    r9d,0xfffff
   1400071d9:	mov    r8d,r9d
   1400071dc:	or     r8d,0x100000
   1400071e3:	and    ecx,0x7ff
   1400071e9:	cmovne r9d,r8d
   1400071ed:	mov    r10d,ecx
   1400071f0:	test   eax,eax
   1400071f2:	je     0x140007268
   1400071f4:	xor    r8d,r8d
   1400071f7:	tzcnt  r8d,eax
   1400071fc:	mov    ecx,r8d
   1400071ff:	shr    eax,cl
   140007201:	test   r8d,r8d
   140007204:	je     0x14000721d
   140007206:	mov    ecx,0x20
   14000720b:	mov    r11d,r9d
   14000720e:	sub    ecx,r8d
   140007211:	shl    r11d,cl
   140007214:	mov    ecx,r8d
   140007217:	or     eax,r11d
   14000721a:	shr    r9d,cl
   14000721d:	mov    DWORD PTR [rdx+0x18],eax
   140007220:	cmp    r9d,0x1
   140007224:	mov    eax,0x1
   140007229:	sbb    eax,0xffffffff
   14000722c:	mov    DWORD PTR [rdx+0x1c],r9d
   140007230:	mov    DWORD PTR [rdx+0x14],eax
   140007233:	test   r10d,r10d
   140007236:	jne    0x140007287
   140007238:	movsxd rcx,eax
   14000723b:	sub    r8d,0x432
   140007242:	bsr    ecx,DWORD PTR [rdx+rcx*4+0x14]
   140007247:	shl    eax,0x5
   14000724a:	mov    DWORD PTR [rsi],r8d
   14000724d:	xor    ecx,0x1f
   140007250:	sub    eax,ecx
   140007252:	mov    DWORD PTR [rbx],eax
   140007254:	movups xmm6,XMMWORD PTR [rbp+0x0]
   140007258:	mov    rax,rdx
   14000725b:	add    rsp,0x30
   14000725f:	pop    rbx
   140007260:	pop    rsi
   140007261:	pop    rbp
   140007262:	ret
   140007263:	nop    DWORD PTR [rax+rax*1+0x0]
   140007268:	xor    ecx,ecx
   14000726a:	mov    eax,0x1
   14000726f:	tzcnt  ecx,r9d
   140007274:	mov    DWORD PTR [rdx+0x14],eax
   140007277:	shr    r9d,cl
   14000727a:	lea    r8d,[rcx+0x20]
   14000727e:	mov    DWORD PTR [rdx+0x18],r9d
   140007282:	test   r10d,r10d
   140007285:	je     0x140007238
   140007287:	lea    eax,[r10+r8*1-0x433]
   14000728f:	mov    DWORD PTR [rsi],eax
   140007291:	mov    eax,0x35
   140007296:	sub    eax,r8d
   140007299:	mov    DWORD PTR [rbx],eax
   14000729b:	movups xmm6,XMMWORD PTR [rbp+0x0]
   14000729f:	mov    rax,rdx
   1400072a2:	add    rsp,0x30
   1400072a6:	pop    rbx
   1400072a7:	pop    rsi
   1400072a8:	pop    rbp
   1400072a9:	ret
   1400072aa:	nop    WORD PTR [rax+rax*1+0x0]
   1400072b0:	mov    rax,rcx
   1400072b3:	lea    rcx,[rdx+0x1]
   1400072b7:	movzx  edx,BYTE PTR [rdx]
   1400072ba:	mov    BYTE PTR [rax],dl
   1400072bc:	test   dl,dl
   1400072be:	je     0x1400072d1
   1400072c0:	movzx  edx,BYTE PTR [rcx]
   1400072c3:	add    rax,0x1
   1400072c7:	add    rcx,0x1
   1400072cb:	mov    BYTE PTR [rax],dl
   1400072cd:	test   dl,dl
   1400072cf:	jne    0x1400072c0
   1400072d1:	ret
   1400072d2:	nop
   1400072d3:	nop
   1400072d4:	nop
   1400072d5:	nop
   1400072d6:	nop
   1400072d7:	nop
   1400072d8:	nop
   1400072d9:	nop
   1400072da:	nop
   1400072db:	nop
   1400072dc:	nop
   1400072dd:	nop
   1400072de:	nop
   1400072df:	nop
   1400072e0:	xor    r8d,r8d
   1400072e3:	mov    rax,rcx
   1400072e6:	test   rdx,rdx
   1400072e9:	jne    0x1400072ff
   1400072eb:	jmp    0x140007304
   1400072ed:	nop    DWORD PTR [rax]
   1400072f0:	add    rax,0x1
   1400072f4:	mov    r8,rax
   1400072f7:	sub    r8,rcx
   1400072fa:	cmp    r8,rdx
   1400072fd:	jae    0x140007304
   1400072ff:	cmp    BYTE PTR [rax],0x0
   140007302:	jne    0x1400072f0
   140007304:	mov    rax,r8
   140007307:	ret
   140007308:	nop
   140007309:	nop
   14000730a:	nop
   14000730b:	nop
   14000730c:	nop
   14000730d:	nop
   14000730e:	nop
   14000730f:	nop
   140007310:	xor    r8d,r8d
   140007313:	mov    rax,rdx
   140007316:	test   rdx,rdx
   140007319:	jne    0x140007329
   14000731b:	jmp    0x140007334
   14000731d:	nop    DWORD PTR [rax]
   140007320:	add    r8,0x1
   140007324:	cmp    rax,r8
   140007327:	je     0x140007334
   140007329:	cmp    WORD PTR [rcx+r8*2],0x0
   14000732f:	jne    0x140007320
   140007331:	mov    rax,r8
   140007334:	ret
   140007335:	nop
   140007336:	nop
   140007337:	nop
   140007338:	nop
   140007339:	nop
   14000733a:	nop
   14000733b:	nop
   14000733c:	nop
   14000733d:	nop
   14000733e:	nop
   14000733f:	nop
   140007340:	mov    rax,QWORD PTR [rip+0x25a9]        # 0x1400098f0
   140007347:	mov    rax,QWORD PTR [rax]
   14000734a:	ret
   14000734b:	nop
   14000734c:	nop
   14000734d:	nop
   14000734e:	nop
   14000734f:	nop
   140007350:	mov    rax,QWORD PTR [rip+0x2589]        # 0x1400098e0
   140007357:	mov    rax,QWORD PTR [rax]
   14000735a:	ret
   14000735b:	nop
   14000735c:	nop
   14000735d:	nop
   14000735e:	nop
   14000735f:	nop
   140007360:	push   rbp
   140007361:	push   rbx
   140007362:	sub    rsp,0x28
   140007366:	lea    rbp,[rsp+0x20]
   14000736b:	mov    rbx,rcx
   14000736e:	xor    ecx,ecx
   140007370:	call   0x140007460
   140007375:	cmp    rbx,rax
   140007378:	jb     0x140007389
   14000737a:	mov    ecx,0x13
   14000737f:	call   0x140007460
   140007384:	cmp    rbx,rax
   140007387:	jbe    0x1400073a0
   140007389:	lea    rcx,[rbx+0x30]
   14000738d:	add    rsp,0x28
   140007391:	pop    rbx
   140007392:	pop    rbp
   140007393:	rex.W jmp QWORD PTR [rip+0x5e76]        # 0x14000d210
   14000739a:	nop    WORD PTR [rax+rax*1+0x0]
   1400073a0:	xor    ecx,ecx
   1400073a2:	call   0x140007460
   1400073a7:	mov    rdx,rax
   1400073aa:	mov    rax,rbx
   1400073ad:	sub    rax,rdx
   1400073b0:	sar    rax,0x4
   1400073b4:	imul   eax,eax,0xaaaaaaab
   1400073ba:	lea    ecx,[rax+0x10]
   1400073bd:	call   0x140007a28
   1400073c2:	or     DWORD PTR [rbx+0x18],0x8000
   1400073c9:	add    rsp,0x28
   1400073cd:	pop    rbx
   1400073ce:	pop    rbp
   1400073cf:	ret
   1400073d0:	push   rbp
   1400073d1:	push   rbx
   1400073d2:	sub    rsp,0x28
   1400073d6:	lea    rbp,[rsp+0x20]
   1400073db:	mov    rbx,rcx
   1400073de:	xor    ecx,ecx
   1400073e0:	call   0x140007460
   1400073e5:	cmp    rbx,rax
   1400073e8:	jb     0x1400073f9
   1400073ea:	mov    ecx,0x13
   1400073ef:	call   0x140007460
   1400073f4:	cmp    rbx,rax
   1400073f7:	jbe    0x140007410
   1400073f9:	lea    rcx,[rbx+0x30]
   1400073fd:	add    rsp,0x28
   140007401:	pop    rbx
   140007402:	pop    rbp
   140007403:	rex.W jmp QWORD PTR [rip+0x5e36]        # 0x14000d240
   14000740a:	nop    WORD PTR [rax+rax*1+0x0]
   140007410:	and    DWORD PTR [rbx+0x18],0xffff7fff
   140007417:	xor    ecx,ecx
   140007419:	call   0x140007460
   14000741e:	sub    rbx,rax
   140007421:	sar    rbx,0x4
   140007425:	imul   ebx,ebx,0xaaaaaaab
   14000742b:	lea    ecx,[rbx+0x10]
   14000742e:	add    rsp,0x28
   140007432:	pop    rbx
   140007433:	pop    rbp
   140007434:	jmp    0x140007a38
   140007439:	nop
   14000743a:	nop
   14000743b:	nop
   14000743c:	nop
   14000743d:	nop
   14000743e:	nop
   14000743f:	nop
   140007440:	mov    rax,QWORD PTR [rip+0x5719]        # 0x14000cb60
   140007447:	ret
   140007448:	nop    DWORD PTR [rax+rax*1+0x0]
   140007450:	mov    rax,rcx
   140007453:	xchg   QWORD PTR [rip+0x5706],rax        # 0x14000cb60
   14000745a:	ret
   14000745b:	nop
   14000745c:	nop
   14000745d:	nop
   14000745e:	nop
   14000745f:	nop
   140007460:	push   rbp
   140007461:	push   rbx
   140007462:	sub    rsp,0x28
   140007466:	lea    rbp,[rsp+0x20]
   14000746b:	mov    ebx,ecx
   14000746d:	call   0x1400079f0
   140007472:	mov    ecx,ebx
   140007474:	lea    rdx,[rcx+rcx*2]
   140007478:	shl    rdx,0x4
   14000747c:	add    rax,rdx
   14000747f:	add    rsp,0x28
   140007483:	pop    rbx
   140007484:	pop    rbp
   140007485:	ret
   140007486:	nop
   140007487:	nop
   140007488:	nop
   140007489:	nop
   14000748a:	nop
   14000748b:	nop
   14000748c:	nop
   14000748d:	nop
   14000748e:	nop
   14000748f:	nop
   140007490:	push   rbp
   140007491:	mov    rbp,rsp
   140007494:	sub    rsp,0x50
   140007498:	mov    rax,rcx
   14000749b:	mov    WORD PTR [rbp+0x18],dx
   14000749f:	mov    ecx,r8d
   1400074a2:	test   r8d,r8d
   1400074a5:	jne    0x1400074c0
   1400074a7:	cmp    dx,0xff
   1400074ac:	ja     0x140007500
   1400074ae:	mov    BYTE PTR [rax],dl
   1400074b0:	mov    eax,0x1
   1400074b5:	add    rsp,0x50
   1400074b9:	pop    rbp
   1400074ba:	ret
   1400074bb:	nop    DWORD PTR [rax+rax*1+0x0]
   1400074c0:	lea    rdx,[rbp-0x4]
   1400074c4:	mov    DWORD PTR [rsp+0x28],r9d
   1400074c9:	lea    r8,[rbp+0x18]
   1400074cd:	mov    r9d,0x1
   1400074d3:	mov    QWORD PTR [rsp+0x38],rdx
   1400074d8:	xor    edx,edx
   1400074da:	mov    DWORD PTR [rbp-0x4],0x0
   1400074e1:	mov    QWORD PTR [rsp+0x30],0x0
   1400074ea:	mov    QWORD PTR [rsp+0x20],rax
   1400074ef:	call   QWORD PTR [rip+0x5d8b]        # 0x14000d280
   1400074f5:	test   eax,eax
   1400074f7:	je     0x140007500
   1400074f9:	mov    edx,DWORD PTR [rbp-0x4]
   1400074fc:	test   edx,edx
   1400074fe:	je     0x1400074b5
   140007500:	call   0x140007a18
   140007505:	mov    DWORD PTR [rax],0x2a
   14000750b:	mov    eax,0xffffffff
   140007510:	add    rsp,0x50
   140007514:	pop    rbp
   140007515:	ret
   140007516:	cs nop WORD PTR [rax+rax*1+0x0]
   140007520:	push   rbp
   140007521:	push   rdi
   140007522:	push   rsi
   140007523:	push   rbx
   140007524:	sub    rsp,0x38
   140007528:	lea    rbp,[rsp+0x30]
   14000752d:	test   rcx,rcx
   140007530:	mov    rbx,rcx
   140007533:	lea    rax,[rbp-0x5]
   140007537:	mov    esi,edx
   140007539:	cmove  rbx,rax
   14000753d:	call   0x1400079e0
   140007542:	mov    edi,eax
   140007544:	call   0x1400079d8
   140007549:	movzx  edx,si
   14000754c:	mov    r9d,edi
   14000754f:	mov    rcx,rbx
   140007552:	mov    r8d,eax
   140007555:	call   0x140007490
   14000755a:	cdqe
   14000755c:	add    rsp,0x38
   140007560:	pop    rbx
   140007561:	pop    rsi
   140007562:	pop    rdi
   140007563:	pop    rbp
   140007564:	ret
   140007565:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140007570:	push   rbp
   140007571:	push   r15
   140007573:	push   r14
   140007575:	push   r13
   140007577:	push   r12
   140007579:	push   rdi
   14000757a:	push   rsi
   14000757b:	push   rbx
   14000757c:	sub    rsp,0x38
   140007580:	lea    rbp,[rsp+0x30]
   140007585:	xor    r14d,r14d
   140007588:	mov    r12,rdx
   14000758b:	mov    r15,rcx
   14000758e:	mov    rdi,r8
   140007591:	call   0x1400079d8
   140007596:	mov    ebx,eax
   140007598:	call   0x1400079e0
   14000759d:	mov    r13,QWORD PTR [r12]
   1400075a1:	mov    esi,eax
   1400075a3:	test   r13,r13
   1400075a6:	je     0x1400075fa
   1400075a8:	test   r15,r15
   1400075ab:	je     0x140007610
   1400075ad:	test   rdi,rdi
   1400075b0:	jne    0x1400075dc
   1400075b2:	jmp    0x140007650
   1400075b7:	nop    WORD PTR [rax+rax*1+0x0]
   1400075c0:	cdqe
   1400075c2:	add    r15,rax
   1400075c5:	add    r14,rax
   1400075c8:	cmp    BYTE PTR [r15-0x1],0x0
   1400075cd:	je     0x140007660
   1400075d3:	add    r13,0x2
   1400075d7:	cmp    r14,rdi
   1400075da:	jae    0x140007650
   1400075dc:	movzx  edx,WORD PTR [r13+0x0]
   1400075e1:	mov    r9d,esi
   1400075e4:	mov    r8d,ebx
   1400075e7:	mov    rcx,r15
   1400075ea:	call   0x140007490
   1400075ef:	test   eax,eax
   1400075f1:	jg     0x1400075c0
   1400075f3:	mov    r14,0xffffffffffffffff
   1400075fa:	mov    rax,r14
   1400075fd:	add    rsp,0x38
   140007601:	pop    rbx
   140007602:	pop    rsi
   140007603:	pop    rdi
   140007604:	pop    r12
   140007606:	pop    r13
   140007608:	pop    r14
   14000760a:	pop    r15
   14000760c:	pop    rbp
   14000760d:	ret
   14000760e:	xchg   ax,ax
   140007610:	lea    rdi,[rbp-0x5]
   140007614:	jmp    0x140007636
   140007616:	cs nop WORD PTR [rax+rax*1+0x0]
   140007620:	movsxd rdx,eax
   140007623:	sub    eax,0x1
   140007626:	cdqe
   140007628:	add    r14,rdx
   14000762b:	cmp    BYTE PTR [rbp+rax*1-0x5],0x0
   140007630:	je     0x140007670
   140007632:	add    r13,0x2
   140007636:	movzx  edx,WORD PTR [r13+0x0]
   14000763b:	mov    r9d,esi
   14000763e:	mov    r8d,ebx
   140007641:	mov    rcx,rdi
   140007644:	call   0x140007490
   140007649:	test   eax,eax
   14000764b:	jg     0x140007620
   14000764d:	jmp    0x1400075f3
   14000764f:	nop
   140007650:	mov    QWORD PTR [r12],r13
   140007654:	jmp    0x1400075fa
   140007656:	cs nop WORD PTR [rax+rax*1+0x0]
   140007660:	mov    QWORD PTR [r12],0x0
   140007668:	sub    r14,0x1
   14000766c:	jmp    0x1400075fa
   14000766e:	xchg   ax,ax
   140007670:	sub    r14,0x1
   140007674:	jmp    0x1400075fa
   140007676:	nop
   140007677:	nop
   140007678:	nop
   140007679:	nop
   14000767a:	nop
   14000767b:	nop
   14000767c:	nop
   14000767d:	nop
   14000767e:	nop
   14000767f:	nop
   140007680:	push   rbp
   140007681:	push   rdi
   140007682:	push   rbx
   140007683:	sub    rsp,0x40
   140007687:	lea    rbp,[rsp+0x40]
   14000768c:	mov    rdi,rcx
   14000768f:	mov    rbx,rdx
   140007692:	test   rdx,rdx
   140007695:	je     0x140007755
   14000769b:	test   r8,r8
   14000769e:	je     0x1400077c0
   1400076a4:	mov    eax,DWORD PTR [r9]
   1400076a7:	movzx  edx,BYTE PTR [rdx]
   1400076aa:	mov    DWORD PTR [r9],0x0
   1400076b1:	mov    DWORD PTR [rbp-0x4],eax
   1400076b4:	test   dl,dl
   1400076b6:	je     0x140007750
   1400076bc:	cmp    DWORD PTR [rbp+0x48],0x1
   1400076c0:	jbe    0x140007730
   1400076c2:	test   al,al
   1400076c4:	jne    0x140007760
   1400076ca:	mov    QWORD PTR [rbp+0x38],r9
   1400076ce:	mov    ecx,DWORD PTR [rbp+0x40]
   1400076d1:	mov    QWORD PTR [rbp+0x30],r8
   1400076d5:	call   QWORD PTR [rip+0x5b55]        # 0x14000d230
   1400076db:	test   eax,eax
   1400076dd:	je     0x140007730
   1400076df:	mov    r8,QWORD PTR [rbp+0x30]
   1400076e3:	mov    r9,QWORD PTR [rbp+0x38]
   1400076e7:	cmp    r8,0x1
   1400076eb:	je     0x1400077ba
   1400076f1:	mov    QWORD PTR [rsp+0x20],rdi
   1400076f6:	mov    r9d,0x2
   1400076fc:	mov    r8,rbx
   1400076ff:	mov    DWORD PTR [rsp+0x28],0x1
   140007707:	mov    ecx,DWORD PTR [rbp+0x40]
   14000770a:	mov    edx,0x8
   14000770f:	call   QWORD PTR [rip+0x5b33]        # 0x14000d248
   140007715:	test   eax,eax
   140007717:	je     0x1400077a8
   14000771d:	mov    eax,0x2
   140007722:	add    rsp,0x40
   140007726:	pop    rbx
   140007727:	pop    rdi
   140007728:	pop    rbp
   140007729:	ret
   14000772a:	nop    WORD PTR [rax+rax*1+0x0]
   140007730:	mov    eax,DWORD PTR [rbp+0x40]
   140007733:	test   eax,eax
   140007735:	jne    0x140007780
   140007737:	movzx  eax,BYTE PTR [rbx]
   14000773a:	mov    WORD PTR [rdi],ax
   14000773d:	mov    eax,0x1
   140007742:	add    rsp,0x40
   140007746:	pop    rbx
   140007747:	pop    rdi
   140007748:	pop    rbp
   140007749:	ret
   14000774a:	nop    WORD PTR [rax+rax*1+0x0]
   140007750:	xor    edx,edx
   140007752:	mov    WORD PTR [rcx],dx
   140007755:	xor    eax,eax
   140007757:	add    rsp,0x40
   14000775b:	pop    rbx
   14000775c:	pop    rdi
   14000775d:	pop    rbp
   14000775e:	ret
   14000775f:	nop
   140007760:	mov    BYTE PTR [rbp-0x3],dl
   140007763:	mov    r9d,0x2
   140007769:	lea    r8,[rbp-0x4]
   14000776d:	mov    DWORD PTR [rsp+0x28],0x1
   140007775:	mov    QWORD PTR [rsp+0x20],rcx
   14000777a:	jmp    0x140007707
   14000777c:	nop    DWORD PTR [rax+0x0]
   140007780:	mov    QWORD PTR [rsp+0x20],rdi
   140007785:	mov    ecx,DWORD PTR [rbp+0x40]
   140007788:	mov    r8,rbx
   14000778b:	mov    edx,0x8
   140007790:	mov    DWORD PTR [rsp+0x28],0x1
   140007798:	mov    r9d,0x1
   14000779e:	call   QWORD PTR [rip+0x5aa4]        # 0x14000d248
   1400077a4:	test   eax,eax
   1400077a6:	jne    0x14000773d
   1400077a8:	call   0x140007a18
   1400077ad:	mov    DWORD PTR [rax],0x2a
   1400077b3:	mov    eax,0xffffffff
   1400077b8:	jmp    0x140007757
   1400077ba:	movzx  eax,BYTE PTR [rbx]
   1400077bd:	mov    BYTE PTR [r9],al
   1400077c0:	mov    eax,0xfffffffe
   1400077c5:	jmp    0x140007757
   1400077c7:	nop    WORD PTR [rax+rax*1+0x0]
   1400077d0:	push   rbp
   1400077d1:	push   r13
   1400077d3:	push   r12
   1400077d5:	push   rdi
   1400077d6:	push   rsi
   1400077d7:	push   rbx
   1400077d8:	sub    rsp,0x48
   1400077dc:	lea    rbp,[rsp+0x40]
   1400077e1:	xor    eax,eax
   1400077e3:	mov    rbx,rcx
   1400077e6:	test   rcx,rcx
   1400077e9:	mov    WORD PTR [rbp-0x2],ax
   1400077ed:	lea    rax,[rbp-0x2]
   1400077f1:	mov    rsi,r9
   1400077f4:	cmove  rbx,rax
   1400077f8:	mov    rdi,rdx
   1400077fb:	mov    r12,r8
   1400077fe:	call   0x1400079e0
   140007803:	mov    r13d,eax
   140007806:	call   0x1400079d8
   14000780b:	test   rsi,rsi
   14000780e:	mov    DWORD PTR [rsp+0x28],r13d
   140007813:	mov    r8,r12
   140007816:	mov    DWORD PTR [rsp+0x20],eax
   14000781a:	lea    r9,[rip+0x5357]        # 0x14000cb78
   140007821:	mov    rdx,rdi
   140007824:	mov    rcx,rbx
   140007827:	cmovne r9,rsi
   14000782b:	call   0x140007680
   140007830:	cdqe
   140007832:	add    rsp,0x48
   140007836:	pop    rbx
   140007837:	pop    rsi
   140007838:	pop    rdi
   140007839:	pop    r12
   14000783b:	pop    r13
   14000783d:	pop    rbp
   14000783e:	ret
   14000783f:	nop
   140007840:	push   rbp
   140007841:	push   r15
   140007843:	push   r14
   140007845:	push   r13
   140007847:	push   r12
   140007849:	push   rdi
   14000784a:	push   rsi
   14000784b:	push   rbx
   14000784c:	sub    rsp,0x48
   140007850:	lea    rbp,[rsp+0x40]
   140007855:	lea    rax,[rip+0x5318]        # 0x14000cb74
   14000785c:	mov    rsi,r9
   14000785f:	test   r9,r9
   140007862:	mov    r15,rcx
   140007865:	mov    rbx,rdx
   140007868:	cmove  rsi,rax
   14000786c:	mov    rdi,r8
   14000786f:	call   0x1400079d8
   140007874:	mov    r13d,eax
   140007877:	call   0x1400079e0
   14000787c:	mov    r12d,eax
   14000787f:	test   rbx,rbx
   140007882:	je     0x140007950
   140007888:	mov    rdx,QWORD PTR [rbx]
   14000788b:	test   rdx,rdx
   14000788e:	je     0x140007950
   140007894:	test   r15,r15
   140007897:	je     0x140007908
   140007899:	xor    r14d,r14d
   14000789c:	test   rdi,rdi
   14000789f:	jne    0x1400078bf
   1400078a1:	jmp    0x1400078ee
   1400078a3:	nop    DWORD PTR [rax+rax*1+0x0]
   1400078a8:	mov    rdx,QWORD PTR [rbx]
   1400078ab:	cdqe
   1400078ad:	add    r15,0x2
   1400078b1:	add    r14,rax
   1400078b4:	add    rdx,rax
   1400078b7:	mov    QWORD PTR [rbx],rdx
   1400078ba:	cmp    r14,rdi
   1400078bd:	jae    0x1400078ee
   1400078bf:	mov    DWORD PTR [rsp+0x28],r12d
   1400078c4:	mov    r8,rdi
   1400078c7:	mov    r9,rsi
   1400078ca:	mov    rcx,r15
   1400078cd:	mov    DWORD PTR [rsp+0x20],r13d
   1400078d2:	sub    r8,r14
   1400078d5:	call   0x140007680
   1400078da:	test   eax,eax
   1400078dc:	jg     0x1400078a8
   1400078de:	cmp    r14,rdi
   1400078e1:	jae    0x1400078ee
   1400078e3:	test   eax,eax
   1400078e5:	jne    0x1400078ee
   1400078e7:	mov    QWORD PTR [rbx],0x0
   1400078ee:	mov    rax,r14
   1400078f1:	add    rsp,0x48
   1400078f5:	pop    rbx
   1400078f6:	pop    rsi
   1400078f7:	pop    rdi
   1400078f8:	pop    r12
   1400078fa:	pop    r13
   1400078fc:	pop    r14
   1400078fe:	pop    r15
   140007900:	pop    rbp
   140007901:	ret
   140007902:	nop    WORD PTR [rax+rax*1+0x0]
   140007908:	xor    eax,eax
   14000790a:	mov    r15d,r12d
   14000790d:	lea    rdi,[rbp-0x2]
   140007911:	xor    r14d,r14d
   140007914:	mov    WORD PTR [rbp-0x2],ax
   140007918:	jmp    0x140007928
   14000791a:	nop    WORD PTR [rax+rax*1+0x0]
   140007920:	cdqe
   140007922:	mov    rdx,QWORD PTR [rbx]
   140007925:	add    r14,rax
   140007928:	mov    DWORD PTR [rsp+0x28],r12d
   14000792d:	add    rdx,r14
   140007930:	mov    r9,rsi
   140007933:	mov    r8,r15
   140007936:	mov    DWORD PTR [rsp+0x20],r13d
   14000793b:	mov    rcx,rdi
   14000793e:	call   0x140007680
   140007943:	test   eax,eax
   140007945:	jg     0x140007920
   140007947:	jmp    0x1400078ee
   140007949:	nop    DWORD PTR [rax+0x0]
   140007950:	xor    r14d,r14d
   140007953:	jmp    0x1400078ee
   140007955:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140007960:	push   rbp
   140007961:	push   r12
   140007963:	push   rdi
   140007964:	push   rsi
   140007965:	push   rbx
   140007966:	sub    rsp,0x40
   14000796a:	lea    rbp,[rsp+0x40]
   14000796f:	xor    eax,eax
   140007971:	mov    rsi,rcx
   140007974:	mov    rdi,rdx
   140007977:	mov    rbx,r8
   14000797a:	mov    WORD PTR [rbp-0x2],ax
   14000797e:	call   0x1400079e0
   140007983:	mov    r12d,eax
   140007986:	call   0x1400079d8
   14000798b:	test   rbx,rbx
   14000798e:	mov    DWORD PTR [rsp+0x28],r12d
   140007993:	mov    r8,rdi
   140007996:	lea    rdx,[rip+0x51d3]        # 0x14000cb70
   14000799d:	mov    DWORD PTR [rsp+0x20],eax
   1400079a1:	lea    rcx,[rbp-0x2]
   1400079a5:	cmove  rbx,rdx
   1400079a9:	mov    rdx,rsi
   1400079ac:	mov    r9,rbx
   1400079af:	call   0x140007680
   1400079b4:	cdqe
   1400079b6:	add    rsp,0x40
   1400079ba:	pop    rbx
   1400079bb:	pop    rsi
   1400079bc:	pop    rdi
   1400079bd:	pop    r12
   1400079bf:	pop    rbp
   1400079c0:	ret
   1400079c1:	nop
   1400079c2:	nop
   1400079c3:	nop
   1400079c4:	nop
   1400079c5:	nop
   1400079c6:	nop
   1400079c7:	nop
   1400079c8:	nop
   1400079c9:	nop
   1400079ca:	nop
   1400079cb:	nop
   1400079cc:	nop
   1400079cd:	nop
   1400079ce:	nop
   1400079cf:	nop
   1400079d0:	jmp    QWORD PTR [rip+0x58ba]        # 0x14000d290
   1400079d6:	nop
   1400079d7:	nop
   1400079d8:	jmp    QWORD PTR [rip+0x58ba]        # 0x14000d298
   1400079de:	nop
   1400079df:	nop
   1400079e0:	jmp    QWORD PTR [rip+0x58ba]        # 0x14000d2a0
   1400079e6:	nop
   1400079e7:	nop
   1400079e8:	jmp    QWORD PTR [rip+0x58ba]        # 0x14000d2a8
   1400079ee:	nop
   1400079ef:	nop
   1400079f0:	jmp    QWORD PTR [rip+0x58c2]        # 0x14000d2b8
   1400079f6:	nop
   1400079f7:	nop
   1400079f8:	jmp    QWORD PTR [rip+0x58c2]        # 0x14000d2c0
   1400079fe:	nop
   1400079ff:	nop
   140007a00:	jmp    QWORD PTR [rip+0x58c2]        # 0x14000d2c8
   140007a06:	nop
   140007a07:	nop
   140007a08:	jmp    QWORD PTR [rip+0x58c2]        # 0x14000d2d0
   140007a0e:	nop
   140007a0f:	nop
   140007a10:	jmp    QWORD PTR [rip+0x58c2]        # 0x14000d2d8
   140007a16:	nop
   140007a17:	nop
   140007a18:	jmp    QWORD PTR [rip+0x58ca]        # 0x14000d2e8
   140007a1e:	nop
   140007a1f:	nop
   140007a20:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d2f8
   140007a26:	nop
   140007a27:	nop
   140007a28:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d300
   140007a2e:	nop
   140007a2f:	nop
   140007a30:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d308
   140007a36:	nop
   140007a37:	nop
   140007a38:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d310
   140007a3e:	nop
   140007a3f:	nop
   140007a40:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d318
   140007a46:	nop
   140007a47:	nop
   140007a48:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d320
   140007a4e:	nop
   140007a4f:	nop
   140007a50:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d328
   140007a56:	nop
   140007a57:	nop
   140007a58:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d330
   140007a5e:	nop
   140007a5f:	nop
   140007a60:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d338
   140007a66:	nop
   140007a67:	nop
   140007a68:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d340
   140007a6e:	nop
   140007a6f:	nop
   140007a70:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d348
   140007a76:	nop
   140007a77:	nop
   140007a78:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d350
   140007a7e:	nop
   140007a7f:	nop
   140007a80:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d358
   140007a86:	nop
   140007a87:	nop
   140007a88:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d360
   140007a8e:	nop
   140007a8f:	nop
   140007a90:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d368
   140007a96:	nop
   140007a97:	nop
   140007a98:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d370
   140007a9e:	nop
   140007a9f:	nop
   140007aa0:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d378
   140007aa6:	nop
   140007aa7:	nop
   140007aa8:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d380
   140007aae:	nop
   140007aaf:	nop
   140007ab0:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d388
   140007ab6:	nop
   140007ab7:	nop
   140007ab8:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d390
   140007abe:	nop
   140007abf:	nop
   140007ac0:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d398
   140007ac6:	nop
   140007ac7:	nop
   140007ac8:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d3a0
   140007ace:	nop
   140007acf:	nop
   140007ad0:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d3a8
   140007ad6:	nop
   140007ad7:	nop
   140007ad8:	jmp    QWORD PTR [rip+0x58d2]        # 0x14000d3b0
   140007ade:	nop
   140007adf:	nop
   140007ae0:	jmp    QWORD PTR [rip+0x579a]        # 0x14000d280
   140007ae6:	nop
   140007ae7:	nop
   140007ae8:	jmp    QWORD PTR [rip+0x578a]        # 0x14000d278
   140007aee:	nop
   140007aef:	nop
   140007af0:	jmp    QWORD PTR [rip+0x577a]        # 0x14000d270
   140007af6:	nop
   140007af7:	nop
   140007af8:	jmp    QWORD PTR [rip+0x576a]        # 0x14000d268
   140007afe:	nop
   140007aff:	nop
   140007b00:	jmp    QWORD PTR [rip+0x575a]        # 0x14000d260
   140007b06:	nop
   140007b07:	nop
   140007b08:	jmp    QWORD PTR [rip+0x574a]        # 0x14000d258
   140007b0e:	nop
   140007b0f:	nop
   140007b10:	jmp    QWORD PTR [rip+0x573a]        # 0x14000d250
   140007b16:	nop
   140007b17:	nop
   140007b18:	jmp    QWORD PTR [rip+0x572a]        # 0x14000d248
   140007b1e:	nop
   140007b1f:	nop
   140007b20:	jmp    QWORD PTR [rip+0x571a]        # 0x14000d240
   140007b26:	nop
   140007b27:	nop
   140007b28:	jmp    QWORD PTR [rip+0x570a]        # 0x14000d238
   140007b2e:	nop
   140007b2f:	nop
   140007b30:	jmp    QWORD PTR [rip+0x56fa]        # 0x14000d230
   140007b36:	nop
   140007b37:	nop
   140007b38:	jmp    QWORD PTR [rip+0x56ea]        # 0x14000d228
   140007b3e:	nop
   140007b3f:	nop
   140007b40:	jmp    QWORD PTR [rip+0x56da]        # 0x14000d220
   140007b46:	nop
   140007b47:	nop
   140007b48:	jmp    QWORD PTR [rip+0x56ca]        # 0x14000d218
   140007b4e:	nop
   140007b4f:	nop
   140007b50:	jmp    QWORD PTR [rip+0x56ba]        # 0x14000d210
   140007b56:	nop
   140007b57:	nop
   140007b58:	jmp    QWORD PTR [rip+0x56aa]        # 0x14000d208
   140007b5e:	nop
   140007b5f:	nop
   140007b60:	jmp    QWORD PTR [rip+0x569a]        # 0x14000d200
   140007b66:	nop
   140007b67:	nop
   140007b68:	nop    DWORD PTR [rax+rax*1+0x0]
   140007b70:	push   rsi
   140007b71:	push   rbx
   140007b72:	sub    rsp,0x38
   140007b76:	lea    rsi,[rsp+0x58]
   140007b7b:	mov    QWORD PTR [rsp+0x58],rdx
   140007b80:	mov    rbx,rcx
   140007b83:	mov    ecx,0x1
   140007b88:	mov    QWORD PTR [rsp+0x60],r8
   140007b8d:	mov    QWORD PTR [rsp+0x68],r9
   140007b92:	mov    QWORD PTR [rsp+0x28],rsi
   140007b97:	call   QWORD PTR [rip+0x523]        # 0x1400080c0
   140007b9d:	mov    r8,rsi
   140007ba0:	mov    rdx,rbx
   140007ba3:	mov    rcx,rax
   140007ba6:	call   0x140002610
   140007bab:	add    rsp,0x38
   140007baf:	pop    rbx
   140007bb0:	pop    rsi
   140007bb1:	ret
   140007bb2:	nop
   140007bb3:	nop
   140007bb4:	nop
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
   140007bc0:	push   rbx
   140007bc1:	sub    rsp,0x90
   140007bc8:	call   0x1400015d0
   140007bcd:	lea    rcx,[rip+0x142c]        # 0x140009000
   140007bd4:	call   QWORD PTR [rip+0x5676]        # 0x14000d250
   140007bda:	lea    rcx,[rip+0x1447]        # 0x140009028
   140007be1:	call   0x140007b70
   140007be6:	lea    rcx,[rip+0x146b]        # 0x140009058
   140007bed:	call   0x140007b70
   140007bf2:	lea    rcx,[rip+0x1487]        # 0x140009080
   140007bf9:	call   0x140007b70
   140007bfe:	lea    rcx,[rip+0x14a3]        # 0x1400090a8
   140007c05:	call   0x140007b70
   140007c0a:	call   0x140001480
   140007c0f:	mov    eax,DWORD PTR [rip+0x3eb]        # 0x140008000
   140007c15:	cmp    eax,0xc001d00d
   140007c1a:	je     0x140007c28
   140007c1c:	lea    rcx,[rip+0x14b5]        # 0x1400090d8
   140007c23:	call   0x140007b70
   140007c28:	pxor   xmm0,xmm0
   140007c2c:	lea    rcx,[rip+0x14c9]        # 0x1400090fc
   140007c33:	lea    rbx,[rsp+0x50]
   140007c38:	movups XMMWORD PTR [rsp+0x50],xmm0
   140007c3d:	movups XMMWORD PTR [rsp+0x60],xmm0
   140007c42:	movups XMMWORD PTR [rsp+0x70],xmm0
   140007c47:	movups XMMWORD PTR [rsp+0x80],xmm0
   140007c4f:	call   0x140007b70
   140007c54:	xor    ecx,ecx
   140007c56:	call   QWORD PTR [rip+0x464]        # 0x1400080c0
   140007c5c:	mov    edx,0x40
   140007c61:	mov    rcx,rbx
   140007c64:	mov    r8,rax
   140007c67:	call   0x140007a58
   140007c6c:	mov    rdx,rax
   140007c6f:	mov    eax,0x1
   140007c74:	test   rdx,rdx
   140007c77:	je     0x140007ceb
   140007c79:	mov    rcx,rbx
   140007c7c:	lea    rdx,[rip+0x1484]        # 0x140009107
   140007c83:	call   0x140007ab0
   140007c88:	mov    BYTE PTR [rsp+rax*1+0x50],0x0
   140007c8d:	call   0x140001480
   140007c92:	call   0x140001480
   140007c97:	mov    rcx,rbx
   140007c9a:	call   0x140007ac0
   140007c9f:	cmp    rax,0x7
   140007ca3:	je     0x140007cf4
   140007ca5:	lea    rcx,[rip+0x1495]        # 0x140009141
   140007cac:	call   0x140007b70
   140007cb1:	lea    rcx,[rip+0x14a8]        # 0x140009160
   140007cb8:	call   0x140007b70
   140007cbd:	pxor   xmm0,xmm0
   140007cc1:	lea    rcx,[rip+0x14b8]        # 0x140009180
   140007cc8:	movups XMMWORD PTR [rsp+0x50],xmm0
   140007ccd:	movups XMMWORD PTR [rsp+0x60],xmm0
   140007cd2:	movups XMMWORD PTR [rsp+0x70],xmm0
   140007cd7:	movups XMMWORD PTR [rsp+0x80],xmm0
   140007cdf:	call   0x140007b70
   140007ce4:	call   0x140007a80
   140007ce9:	xor    eax,eax
   140007ceb:	add    rsp,0x90
   140007cf2:	pop    rbx
   140007cf3:	ret
   140007cf4:	mov    BYTE PTR [rsp+0x27],0x13
   140007cf9:	movzx  eax,BYTE PTR [rsp+0x27]
   140007cfe:	xor    eax,eax
   140007d00:	xor    r8d,r8d
   140007d03:	mov    QWORD PTR [rsp+0x28],rax
   140007d08:	xor    edx,edx
   140007d0a:	lea    r10,[rsp+0x30]
   140007d0f:	lea    rcx,[rsp+0x28]
   140007d14:	mov    DWORD PTR [rsp+0x30],0xb1405766
   140007d1c:	mov    WORD PTR [rsp+0x34],0x93a2
   140007d23:	mov    BYTE PTR [rsp+0x36],0xfc
   140007d28:	nop    DWORD PTR [rax+rax*1+0x0]
   140007d30:	movzx  eax,BYTE PTR [rbx+rdx*1]
   140007d34:	mov    r9d,DWORD PTR [rip+0x2c5]        # 0x140008000
   140007d3b:	add    eax,r8d
   140007d3e:	rol    al,0x3
   140007d41:	xor    al,BYTE PTR [r10+rdx*1]
   140007d45:	cmp    r9d,0xc001d00d
   140007d4c:	je     0x140007d58
   140007d4e:	mov    r9d,DWORD PTR [rip+0x2ab]        # 0x140008000
   140007d55:	xor    eax,r9d
   140007d58:	mov    BYTE PTR [rcx+rdx*1],al
   140007d5b:	add    rdx,0x1
   140007d5f:	add    r8d,0x7
   140007d63:	cmp    rdx,0x7
   140007d67:	jne    0x140007d30
   140007d69:	mov    rdx,rcx
   140007d6c:	lea    r10,[rsp+0x2f]
   140007d71:	xor    r8d,r8d
   140007d74:	xor    r9d,r9d
   140007d77:	jmp    0x140007d89
   140007d79:	nop    DWORD PTR [rax+0x0]
   140007d80:	add    rdx,0x1
   140007d84:	cmp    r10,rdx
   140007d87:	je     0x140007db6
   140007d89:	movzx  ecx,BYTE PTR [rdx]
   140007d8c:	mov    eax,ecx
   140007d8e:	add    ecx,r9d
   140007d91:	xor    r8d,eax
   140007d94:	or     eax,0x1
   140007d97:	movzx  r9d,cx
   140007d9b:	movzx  eax,al
   140007d9e:	mov    DWORD PTR [rsp+0x30],eax
   140007da2:	mov    eax,DWORD PTR [rsp+0x30]
   140007da6:	mov    ecx,DWORD PTR [rsp+0x30]
   140007daa:	imul   eax,ecx
   140007dad:	test   al,0x1
   140007daf:	jne    0x140007d80
   140007db1:	jmp    0x140007ca5
   140007db6:	lea    rcx,[rsp+0x57]
   140007dbb:	mov    rax,rbx
   140007dbe:	mov    r10d,0x1505
   140007dc4:	nop    DWORD PTR [rax+0x0]
   140007dc8:	mov    edx,r10d
   140007dcb:	add    rax,0x1
   140007dcf:	shl    edx,0x5
   140007dd2:	add    edx,r10d
   140007dd5:	movzx  r10d,BYTE PTR [rax-0x1]
   140007dda:	xor    r10d,edx
   140007ddd:	cmp    rcx,rax
   140007de0:	jne    0x140007dc8
   140007de2:	mov    eax,DWORD PTR [rip+0x218]        # 0x140008000
   140007de8:	cmp    eax,0xc001d00d
   140007ded:	je     0x140007df8
   140007def:	mov    eax,DWORD PTR [rip+0x20b]        # 0x140008000
   140007df5:	xor    r10d,eax
   140007df8:	xor    ecx,ecx
   140007dfa:	mov    edx,0xffffffa5
   140007dff:	nop
   140007e00:	mov    eax,edx
   140007e02:	add    rbx,0x1
   140007e06:	shl    eax,0x6
   140007e09:	add    eax,edx
   140007e0b:	shr    dl,0x3
   140007e0e:	add    eax,ecx
   140007e10:	add    ecx,0x3
   140007e13:	add    al,BYTE PTR [rbx-0x1]
   140007e16:	xor    edx,eax
   140007e18:	cmp    cl,0x15
   140007e1b:	jne    0x140007e00
   140007e1d:	xor    eax,eax
   140007e1f:	cmp    r9d,0x478
   140007e26:	sete   al
   140007e29:	shl    eax,0x4
   140007e2c:	cmp    r8b,0x2c
   140007e30:	jne    0x140007e35
   140007e32:	add    eax,0x20
   140007e35:	cmp    r10d,0x9c670a5c
   140007e3c:	jne    0x140007e41
   140007e3e:	add    eax,0x40
   140007e41:	cmp    dl,0x73
   140007e44:	jne    0x140007e49
   140007e46:	sub    eax,0xffffff80
   140007e49:	mov    ecx,DWORD PTR [rip+0x1b1]        # 0x140008000
   140007e4f:	cmp    ecx,0xc001d00d
   140007e55:	jne    0x140007ca5
   140007e5b:	movzx  ecx,r8b
   140007e5f:	movzx  edx,dl
   140007e62:	movzx  r10d,r10w
   140007e66:	imul   edx,edx,0x1000193
   140007e6c:	shl    ecx,0x10
   140007e6f:	or     ecx,r9d
   140007e72:	xor    ecx,r10d
   140007e75:	xor    edx,ecx
   140007e77:	cmp    edx,0x732cbb2d
   140007e7d:	jne    0x140007ca5
   140007e83:	cmp    eax,0xf0
   140007e88:	jne    0x140007ca5
   140007e8e:	lea    rcx,[rip+0x1275]        # 0x14000910a
   140007e95:	call   0x140007b70
   140007e9a:	lea    rcx,[rip+0x1282]        # 0x140009123
   140007ea1:	call   0x140007b70
   140007ea6:	jmp    0x140007cbd
   140007eab:	nop
   140007eac:	nop
   140007ead:	nop
   140007eae:	nop
   140007eaf:	nop
   140007eb0:	jmp    0x140001460
   140007eb5:	nop
   140007eb6:	nop
   140007eb7:	nop
   140007eb8:	nop
   140007eb9:	nop
   140007eba:	nop
   140007ebb:	nop
   140007ebc:	nop
   140007ebd:	nop
   140007ebe:	nop
   140007ebf:	nop
   140007ec0:	(bad)
   140007ec1:	(bad)
   140007ec2:	(bad)
   140007ec3:	(bad)
   140007ec4:	(bad)
   140007ec5:	(bad)
   140007ec6:	(bad)
   140007ec7:	push   QWORD PTR [rax+0x140007e]
	...
   140007ed5:	add    BYTE PTR [rax],al
   140007ed7:	add    bh,bh
   140007ed9:	(bad)
   140007eda:	(bad)
   140007edb:	(bad)
   140007edc:	(bad)
   140007edd:	(bad)
   140007ede:	(bad)
   140007edf:	inc    DWORD PTR [rax]
   140007ee1:	add    BYTE PTR [rax],al
   140007ee3:	add    BYTE PTR [rax],al
   140007ee5:	add    BYTE PTR [rax],al
	...
