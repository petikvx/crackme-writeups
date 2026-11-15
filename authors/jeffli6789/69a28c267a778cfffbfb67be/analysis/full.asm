
FLRSCRNSVR.SCR:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	lea    rax,[rip+0x7e41]        # 0x140008e48
   140001007:	ret
   140001008:	int3
   140001009:	int3
   14000100a:	int3
   14000100b:	int3
   14000100c:	int3
   14000100d:	int3
   14000100e:	int3
   14000100f:	int3
   140001010:	rex push rbx
   140001012:	sub    rsp,0x4a0
   140001019:	mov    rax,QWORD PTR [rip+0x6fe0]        # 0x140008000
   140001020:	xor    rax,rsp
   140001023:	mov    QWORD PTR [rsp+0x490],rax
   14000102b:	mov    rbx,QWORD PTR gs:0x60
   140001034:	call   QWORD PTR [rip+0x521e]        # 0x140006258
   14000103a:	mov    rcx,rax
   14000103d:	call   QWORD PTR [rip+0x51a5]        # 0x1400061e8
   140001043:	test   rbx,rbx
   140001046:	je     0x1400010a3
   140001048:	cmp    BYTE PTR [rbx+0x1],0x0
   14000104c:	je     0x1400010a3
   14000104e:	mov    edx,0x104
   140001053:	lea    rcx,[rsp+0x280]
   14000105b:	call   QWORD PTR [rip+0x50d7]        # 0x140006138
   140001061:	test   eax,eax
   140001063:	je     0x1400010af
   140001065:	lea    r8,[rip+0x549c]        # 0x140006508
   14000106c:	mov    edx,0x104
   140001071:	lea    rcx,[rsp+0x280]
   140001079:	call   QWORD PTR [rip+0x5359]        # 0x1400063d8
   14000107f:	lea    rdx,[rsp+0x30]
   140001084:	lea    rcx,[rsp+0x280]
   14000108c:	call   QWORD PTR [rip+0x50ce]        # 0x140006160
   140001092:	cmp    rax,0xffffffffffffffff
   140001096:	je     0x1400010af
   140001098:	mov    rcx,rax
   14000109b:	call   QWORD PTR [rip+0x509f]        # 0x140006140
   1400010a1:	jmp    0x1400010af
   1400010a3:	xor    ecx,ecx
   1400010a5:	call   QWORD PTR [rip+0x5115]        # 0x1400061c0
   1400010ab:	mov    DWORD PTR [rsp+0x20],eax
   1400010af:	xor    eax,eax
   1400010b1:	mov    rcx,QWORD PTR [rsp+0x490]
   1400010b9:	xor    rcx,rsp
   1400010bc:	call   0x140004510
   1400010c1:	add    rsp,0x4a0
   1400010c8:	pop    rbx
   1400010c9:	ret
   1400010ca:	int3
   1400010cb:	int3
   1400010cc:	int3
   1400010cd:	int3
   1400010ce:	int3
   1400010cf:	int3
   1400010d0:	mov    QWORD PTR [rsp+0x20],rbx
   1400010d5:	push   rbp
   1400010d6:	push   rsi
   1400010d7:	push   rdi
   1400010d8:	push   r12
   1400010da:	push   r13
   1400010dc:	push   r14
   1400010de:	push   r15
   1400010e0:	sub    rsp,0x6e0
   1400010e7:	mov    rax,QWORD PTR [rip+0x6f12]        # 0x140008000
   1400010ee:	xor    rax,rsp
   1400010f1:	mov    QWORD PTR [rsp+0x6d0],rax
   1400010f9:	mov    r13d,r8d
   1400010fc:	mov    DWORD PTR [rsp+0x40],0x200
   140001104:	mov    r12,rdx
   140001107:	lea    rax,[rsp+0x38]
   14000110c:	mov    r15,rcx
   14000110f:	mov    QWORD PTR [rsp+0x20],rax
   140001114:	xor    r8d,r8d
   140001117:	lea    rdx,[rip+0x53fa]        # 0x140006518
   14000111e:	mov    rcx,0xffffffff80000001
   140001125:	mov    r9d,0x20019
   14000112b:	call   QWORD PTR [rip+0x4edf]        # 0x140006010
   140001131:	test   eax,eax
   140001133:	jne    0x14000117b
   140001135:	mov    rcx,QWORD PTR [rsp+0x38]
   14000113a:	lea    rax,[rsp+0x40]
   14000113f:	mov    QWORD PTR [rsp+0x28],rax
   140001144:	lea    rdx,[rip+0x53fd]        # 0x140006548
   14000114b:	lea    rax,[rsp+0x4d0]
   140001153:	xor    r9d,r9d
   140001156:	xor    r8d,r8d
   140001159:	mov    QWORD PTR [rsp+0x20],rax
   14000115e:	call   QWORD PTR [rip+0x4eb4]        # 0x140006018
   140001164:	test   eax,eax
   140001166:	jne    0x140001170
   140001168:	mov    DWORD PTR [rsp+0x30],0x1
   140001170:	mov    rcx,QWORD PTR [rsp+0x38]
   140001175:	call   QWORD PTR [rip+0x4ea5]        # 0x140006020
   14000117b:	xor    esi,esi
   14000117d:	mov    rdi,r15
   140001180:	mov    ebx,esi
   140001182:	lea    rcx,[rsp+0x48]
   140001187:	call   QWORD PTR [rip+0x4f9b]        # 0x140006128
   14000118d:	mov    BYTE PTR [rdi],bl
   14000118f:	lea    rdi,[rdi+0x1]
   140001193:	inc    ebx
   140001195:	cmp    ebx,0x100
   14000119b:	jl     0x140001182
   14000119d:	mov    ebx,esi
   14000119f:	mov    rdi,r15
   1400011a2:	mov    ecx,0x2
   1400011a7:	call   QWORD PTR [rip+0x5013]        # 0x1400061c0
   1400011ad:	mov    DWORD PTR [rsp+0x30],eax
   1400011b1:	mov    eax,DWORD PTR [rsp+0x30]
   1400011b5:	test   eax,eax
   1400011b7:	jle    0x1400011c3
   1400011b9:	mov    eax,DWORD PTR [rsp+0x30]
   1400011bd:	inc    eax
   1400011bf:	mov    DWORD PTR [rsp+0x30],eax
   1400011c3:	mov    eax,esi
   1400011c5:	cdq
   1400011c6:	idiv   r13d
   1400011c9:	movsxd rax,edx
   1400011cc:	movzx  edx,BYTE PTR [rdi]
   1400011cf:	movzx  ecx,BYTE PTR [rax+r12*1]
   1400011d4:	add    ebx,ecx
   1400011d6:	add    ebx,edx
   1400011d8:	and    ebx,0x800000ff
   1400011de:	jge    0x1400011ea
   1400011e0:	dec    ebx
   1400011e2:	or     ebx,0xffffff00
   1400011e8:	inc    ebx
   1400011ea:	lea    rax,[rsp+0x48]
   1400011ef:	mov    r9d,0x20019
   1400011f5:	xor    r8d,r8d
   1400011f8:	mov    QWORD PTR [rsp+0x20],rax
   1400011fd:	lea    rdx,[rip+0x5314]        # 0x140006518
   140001204:	mov    rcx,0xffffffff80000001
   14000120b:	call   QWORD PTR [rip+0x4dff]        # 0x140006010
   140001211:	test   eax,eax
   140001213:	jne    0x140001220
   140001215:	mov    rcx,QWORD PTR [rsp+0x48]
   14000121a:	call   QWORD PTR [rip+0x4e00]        # 0x140006020
   140001220:	movzx  ebp,BYTE PTR [rdi]
   140001223:	mov    ecx,0x4
   140001228:	call   QWORD PTR [rip+0x4e2a]        # 0x140006058
   14000122e:	lea    r8,[rsp+0x58]
   140001233:	mov    edx,0x10
   140001238:	mov    rcx,rax
   14000123b:	call   QWORD PTR [rip+0x4e47]        # 0x140006088
   140001241:	movsxd r14,ebx
   140001244:	lea    rcx,[rsp+0x2c0]
   14000124c:	mov    edx,0x104
   140001251:	movzx  eax,BYTE PTR [r14+r15*1]
   140001256:	mov    BYTE PTR [rdi],al
   140001258:	call   QWORD PTR [rip+0x4eda]        # 0x140006138
   14000125e:	test   eax,eax
   140001260:	je     0x14000129e
   140001262:	lea    r8,[rip+0x529f]        # 0x140006508
   140001269:	mov    edx,0x104
   14000126e:	lea    rcx,[rsp+0x2c0]
   140001276:	call   QWORD PTR [rip+0x515c]        # 0x1400063d8
   14000127c:	lea    rdx,[rsp+0x70]
   140001281:	lea    rcx,[rsp+0x2c0]
   140001289:	call   QWORD PTR [rip+0x4ed1]        # 0x140006160
   14000128f:	cmp    rax,0xffffffffffffffff
   140001293:	je     0x14000129e
   140001295:	mov    rcx,rax
   140001298:	call   QWORD PTR [rip+0x4ea2]        # 0x140006140
   14000129e:	inc    esi
   1400012a0:	mov    BYTE PTR [r14+r15*1],bpl
   1400012a4:	inc    rdi
   1400012a7:	cmp    esi,0x100
   1400012ad:	jl     0x1400011a2
   1400012b3:	lea    rcx,[rsp+0x50]
   1400012b8:	mov    BYTE PTR [r15+0x100],0x0
   1400012c0:	call   QWORD PTR [rip+0x4e62]        # 0x140006128
   1400012c6:	mov    BYTE PTR [r15+0x101],0x0
   1400012ce:	mov    rcx,QWORD PTR [rsp+0x6d0]
   1400012d6:	xor    rcx,rsp
   1400012d9:	call   0x140004510
   1400012de:	mov    rbx,QWORD PTR [rsp+0x738]
   1400012e6:	add    rsp,0x6e0
   1400012ed:	pop    r15
   1400012ef:	pop    r14
   1400012f1:	pop    r13
   1400012f3:	pop    r12
   1400012f5:	pop    rdi
   1400012f6:	pop    rsi
   1400012f7:	pop    rbp
   1400012f8:	ret
   1400012f9:	int3
   1400012fa:	int3
   1400012fb:	int3
   1400012fc:	int3
   1400012fd:	int3
   1400012fe:	int3
   1400012ff:	int3
   140001300:	mov    QWORD PTR [rsp+0x10],rbx
   140001305:	mov    QWORD PTR [rsp+0x18],rsi
   14000130a:	mov    QWORD PTR [rsp+0x20],rdi
   14000130f:	push   rbp
   140001310:	push   r12
   140001312:	push   r13
   140001314:	push   r14
   140001316:	push   r15
   140001318:	lea    rbp,[rsp-0x590]
   140001320:	sub    rsp,0x690
   140001327:	mov    rax,QWORD PTR [rip+0x6cd2]        # 0x140008000
   14000132e:	xor    rax,rsp
   140001331:	mov    QWORD PTR [rbp+0x580],rax
   140001338:	mov    r15,rcx
   14000133b:	call   QWORD PTR [rip+0x4ddf]        # 0x140006120
   140001341:	mov    r8d,eax
   140001344:	mov    eax,0x51eb851f
   140001349:	mul    r8d
   14000134c:	shr    edx,0x5
   14000134f:	imul   eax,edx,0x64
   140001352:	sub    r8d,eax
   140001355:	mov    DWORD PTR [rsp+0x48],r8d
   14000135a:	mov    eax,DWORD PTR [rsp+0x48]
   14000135e:	add    eax,0x5
   140001361:	mov    DWORD PTR [rsp+0x48],eax
   140001365:	mov    ecx,DWORD PTR [rsp+0x48]
   140001369:	call   QWORD PTR [rip+0x4de1]        # 0x140006150
   14000136f:	lea    r8,[rip+0x51ea]        # 0x140006560
   140001376:	mov    edx,0x50
   14000137b:	lea    rcx,[rbp+0x230]
   140001382:	call   QWORD PTR [rip+0x5048]        # 0x1400063d0
   140001388:	call   QWORD PTR [rip+0x4eca]        # 0x140006258
   14000138e:	mov    rcx,rax
   140001391:	call   QWORD PTR [rip+0x4e51]        # 0x1400061e8
   140001397:	lea    r8,[rip+0x521a]        # 0x1400065b8
   14000139e:	mov    edx,0x50
   1400013a3:	lea    rcx,[rbp+0x230]
   1400013aa:	call   QWORD PTR [rip+0x5028]        # 0x1400063d8
   1400013b0:	lea    rdx,[rsp+0x60]
   1400013b5:	mov    DWORD PTR [rsp+0x60],0x20
   1400013bd:	lea    rcx,[rbp+0x1f0]
   1400013c4:	call   QWORD PTR [rip+0x4d66]        # 0x140006130
   1400013ca:	test   eax,eax
   1400013cc:	je     0x1400013d9
   1400013ce:	movzx  eax,WORD PTR [rbp+0x1f0]
   1400013d5:	mov    DWORD PTR [rsp+0x48],eax
   1400013d9:	lea    r8,[rip+0x5210]        # 0x1400065f0
   1400013e0:	mov    edx,0x50
   1400013e5:	lea    rcx,[rbp+0x2d0]
   1400013ec:	call   QWORD PTR [rip+0x4fde]        # 0x1400063d0
   1400013f2:	xor    ecx,ecx
   1400013f4:	call   QWORD PTR [rip+0x4da6]        # 0x1400061a0
   1400013fa:	mov    rcx,rax
   1400013fd:	mov    rdi,rax
   140001400:	call   QWORD PTR [rip+0x4c2a]        # 0x140006030
   140001406:	mov    edx,0x1
   14000140b:	mov    rcx,rdi
   14000140e:	mov    r8d,edx
   140001411:	mov    rbx,rax
   140001414:	call   QWORD PTR [rip+0x4c5e]        # 0x140006078
   14000141a:	mov    rcx,rax
   14000141d:	call   QWORD PTR [rip+0x4c2d]        # 0x140006050
   140001423:	mov    rcx,rbx
   140001426:	call   QWORD PTR [rip+0x4c34]        # 0x140006060
   14000142c:	mov    rdx,rdi
   14000142f:	xor    ecx,ecx
   140001431:	call   QWORD PTR [rip+0x4e39]        # 0x140006270
   140001437:	xor    ecx,ecx
   140001439:	call   QWORD PTR [rip+0x4d61]        # 0x1400061a0
   14000143f:	mov    rcx,rax
   140001442:	mov    rdi,rax
   140001445:	call   QWORD PTR [rip+0x4be5]        # 0x140006030
   14000144b:	mov    edx,0x1
   140001450:	mov    rcx,rdi
   140001453:	mov    r8d,edx
   140001456:	mov    rbx,rax
   140001459:	call   QWORD PTR [rip+0x4c19]        # 0x140006078
   14000145f:	mov    rcx,rax
   140001462:	call   QWORD PTR [rip+0x4be8]        # 0x140006050
   140001468:	mov    rcx,rbx
   14000146b:	call   QWORD PTR [rip+0x4bef]        # 0x140006060
   140001471:	mov    rdx,rdi
   140001474:	xor    ecx,ecx
   140001476:	call   QWORD PTR [rip+0x4df4]        # 0x140006270
   14000147c:	lea    r8,[rip+0x51bd]        # 0x140006640
   140001483:	mov    edx,0x50
   140001488:	lea    rcx,[rbp+0x2d0]
   14000148f:	call   QWORD PTR [rip+0x4f43]        # 0x1400063d8
   140001495:	mov    ecx,0x4
   14000149a:	call   QWORD PTR [rip+0x4bb8]        # 0x140006058
   1400014a0:	lea    r8,[rsp+0x68]
   1400014a5:	mov    edx,0x10
   1400014aa:	mov    rcx,rax
   1400014ad:	call   QWORD PTR [rip+0x4bd5]        # 0x140006088
   1400014b3:	mov    r12,0xffffffffffffffff
   1400014ba:	mov    r14,r12
   1400014bd:	nop    DWORD PTR [rax]
   1400014c0:	inc    r14
   1400014c3:	cmp    WORD PTR [r15+r14*2],0x0
   1400014c9:	jne    0x1400014c0
   1400014cb:	xor    esi,esi
   1400014cd:	mov    edi,0x5
   1400014d2:	mov    DWORD PTR [rsp+0x48],esi
   1400014d6:	mov    ecx,edi
   1400014d8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400014e0:	mov    eax,DWORD PTR [rsp+0x48]
   1400014e4:	inc    eax
   1400014e6:	mov    DWORD PTR [rsp+0x48],eax
   1400014ea:	sub    rcx,0x1
   1400014ee:	jne    0x1400014e0
   1400014f0:	mov    rbx,rsi
   1400014f3:	test   r14,r14
   1400014f6:	je     0x14000159c
   1400014fc:	nop    DWORD PTR [rax+0x0]
   140001500:	call   QWORD PTR [rip+0x4d52]        # 0x140006258
   140001506:	mov    rcx,rax
   140001509:	call   QWORD PTR [rip+0x4cd9]        # 0x1400061e8
   14000150f:	movzx  edx,WORD PTR [r15+rbx*2]
   140001514:	lea    rcx,[rbp+0x230]
   14000151b:	call   QWORD PTR [rip+0x4d8f]        # 0x1400062b0
   140001521:	mov    rdx,rax
   140001524:	test   rax,rax
   140001527:	je     0x14000155a
   140001529:	mov    DWORD PTR [rsp+0x48],esi
   14000152d:	mov    rax,rdi
   140001530:	mov    ecx,DWORD PTR [rsp+0x48]
   140001534:	inc    ecx
   140001536:	mov    DWORD PTR [rsp+0x48],ecx
   14000153a:	sub    rax,0x1
   14000153e:	jne    0x140001530
   140001540:	lea    rax,[rbp+0x230]
   140001547:	sub    rdx,rax
   14000154a:	sar    rdx,1
   14000154d:	movzx  eax,WORD PTR [rbp+rdx*2+0x2d0]
   140001555:	mov    WORD PTR [r15+rbx*2],ax
   14000155a:	lea    rax,[rsp+0x50]
   14000155f:	mov    r9d,0x20019
   140001565:	xor    r8d,r8d
   140001568:	mov    QWORD PTR [rsp+0x20],rax
   14000156d:	lea    rdx,[rip+0x4fa4]        # 0x140006518
   140001574:	mov    rcx,0xffffffff80000001
   14000157b:	call   QWORD PTR [rip+0x4a8f]        # 0x140006010
   140001581:	test   eax,eax
   140001583:	jne    0x140001590
   140001585:	mov    rcx,QWORD PTR [rsp+0x50]
   14000158a:	call   QWORD PTR [rip+0x4a90]        # 0x140006020
   140001590:	inc    rbx
   140001593:	cmp    rbx,r14
   140001596:	jb     0x140001500
   14000159c:	mov    ecx,0x4
   1400015a1:	call   QWORD PTR [rip+0x4ab1]        # 0x140006058
   1400015a7:	lea    r8,[rsp+0x78]
   1400015ac:	mov    edx,0x10
   1400015b1:	mov    rcx,rax
   1400015b4:	call   QWORD PTR [rip+0x4ace]        # 0x140006088
   1400015ba:	mov    DWORD PTR [rsp+0x30],0x4c0046
   1400015c2:	mov    DWORD PTR [rsp+0x48],esi
   1400015c6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1400015d0:	mov    eax,DWORD PTR [rsp+0x48]
   1400015d4:	inc    eax
   1400015d6:	mov    DWORD PTR [rsp+0x48],eax
   1400015da:	sub    rdi,0x1
   1400015de:	jne    0x1400015d0
   1400015e0:	mov    ecx,0x4
   1400015e5:	mov    DWORD PTR [rsp+0x34],0x520041
   1400015ed:	mov    DWORD PTR [rsp+0x38],0x520045
   1400015f5:	call   QWORD PTR [rip+0x4a5d]        # 0x140006058
   1400015fb:	lea    r8,[rbp-0x78]
   1400015ff:	mov    edx,0x10
   140001604:	mov    rcx,rax
   140001607:	call   QWORD PTR [rip+0x4a7b]        # 0x140006088
   14000160d:	call   QWORD PTR [rip+0x4b0d]        # 0x140006120
   140001613:	mov    r8d,eax
   140001616:	mov    eax,0x51eb851f
   14000161b:	mul    r8d
   14000161e:	shr    edx,0x5
   140001621:	imul   ecx,edx,0x64
   140001624:	sub    r8d,ecx
   140001627:	mov    DWORD PTR [rsp+0x48],r8d
   14000162c:	mov    eax,DWORD PTR [rsp+0x48]
   140001630:	add    eax,0x5
   140001633:	mov    DWORD PTR [rsp+0x48],eax
   140001637:	mov    ecx,DWORD PTR [rsp+0x48]
   14000163b:	call   QWORD PTR [rip+0x4b0f]        # 0x140006150
   140001641:	xor    ecx,ecx
   140001643:	mov    DWORD PTR [rsp+0x3c],0x4c0041
   14000164b:	call   QWORD PTR [rip+0x4b6f]        # 0x1400061c0
   140001651:	xor    ecx,ecx
   140001653:	mov    DWORD PTR [rsp+0x40],0x46
   14000165b:	mov    DWORD PTR [rsp+0x48],eax
   14000165f:	call   QWORD PTR [rip+0x4b3b]        # 0x1400061a0
   140001665:	mov    rcx,rax
   140001668:	mov    rdi,rax
   14000166b:	call   QWORD PTR [rip+0x49bf]        # 0x140006030
   140001671:	mov    edx,0x1
   140001676:	mov    rcx,rdi
   140001679:	mov    r8d,edx
   14000167c:	mov    rbx,rax
   14000167f:	call   QWORD PTR [rip+0x49f3]        # 0x140006078
   140001685:	mov    rcx,rax
   140001688:	call   QWORD PTR [rip+0x49c2]        # 0x140006050
   14000168e:	mov    rcx,rbx
   140001691:	call   QWORD PTR [rip+0x49c9]        # 0x140006060
   140001697:	mov    rdx,rdi
   14000169a:	xor    ecx,ecx
   14000169c:	call   QWORD PTR [rip+0x4bce]        # 0x140006270
   1400016a2:	lea    rax,[rsp+0x30]
   1400016a7:	nop    WORD PTR [rax+rax*1+0x0]
   1400016b0:	inc    r12
   1400016b3:	cmp    WORD PTR [rax+r12*2],si
   1400016b8:	jne    0x1400016b0
   1400016ba:	lea    rax,[rsp+0x58]
   1400016bf:	mov    r9d,0x20019
   1400016c5:	xor    r8d,r8d
   1400016c8:	mov    QWORD PTR [rsp+0x20],rax
   1400016cd:	lea    rdx,[rip+0x4e44]        # 0x140006518
   1400016d4:	mov    rcx,0xffffffff80000001
   1400016db:	call   QWORD PTR [rip+0x492f]        # 0x140006010
   1400016e1:	test   eax,eax
   1400016e3:	jne    0x1400016f0
   1400016e5:	mov    rcx,QWORD PTR [rsp+0x58]
   1400016ea:	call   QWORD PTR [rip+0x4930]        # 0x140006020
   1400016f0:	mov    rbx,rsi
   1400016f3:	test   r14,r14
   1400016f6:	je     0x14000176c
   1400016f8:	nop    DWORD PTR [rax+rax*1+0x0]
   140001700:	mov    edx,0x104
   140001705:	lea    rcx,[rbp+0x370]
   14000170c:	call   QWORD PTR [rip+0x4a26]        # 0x140006138
   140001712:	test   eax,eax
   140001714:	je     0x14000174f
   140001716:	lea    r8,[rip+0x4deb]        # 0x140006508
   14000171d:	mov    edx,0x104
   140001722:	lea    rcx,[rbp+0x370]
   140001729:	call   QWORD PTR [rip+0x4ca9]        # 0x1400063d8
   14000172f:	lea    rdx,[rbp-0x60]
   140001733:	lea    rcx,[rbp+0x370]
   14000173a:	call   QWORD PTR [rip+0x4a20]        # 0x140006160
   140001740:	cmp    rax,0xffffffffffffffff
   140001744:	je     0x14000174f
   140001746:	mov    rcx,rax
   140001749:	call   QWORD PTR [rip+0x49f1]        # 0x140006140
   14000174f:	xor    edx,edx
   140001751:	mov    rax,rbx
   140001754:	div    r12
   140001757:	movzx  eax,bx
   14000175a:	add    ax,WORD PTR [rsp+rdx*2+0x30]
   14000175f:	xor    WORD PTR [r15+rbx*2],ax
   140001764:	inc    rbx
   140001767:	cmp    rbx,r14
   14000176a:	jb     0x140001700
   14000176c:	mov    r12,r14
   14000176f:	shr    r12,1
   140001772:	je     0x14000185b
   140001778:	lea    rbx,[r15-0x2]
   14000177c:	lea    rbx,[rbx+r14*2]
   140001780:	lea    rax,[rsp+0x50]
   140001785:	mov    r9d,0x20019
   14000178b:	xor    r8d,r8d
   14000178e:	mov    QWORD PTR [rsp+0x20],rax
   140001793:	lea    rdx,[rip+0x4d7e]        # 0x140006518
   14000179a:	mov    rcx,0xffffffff80000001
   1400017a1:	call   QWORD PTR [rip+0x4869]        # 0x140006010
   1400017a7:	test   eax,eax
   1400017a9:	jne    0x1400017b6
   1400017ab:	mov    rcx,QWORD PTR [rsp+0x50]
   1400017b0:	call   QWORD PTR [rip+0x486a]        # 0x140006020
   1400017b6:	movzx  edi,WORD PTR [r15+rsi*2]
   1400017bb:	lea    rcx,[rbp+0x370]
   1400017c2:	mov    edx,0x104
   1400017c7:	call   QWORD PTR [rip+0x496b]        # 0x140006138
   1400017cd:	test   eax,eax
   1400017cf:	je     0x14000180a
   1400017d1:	lea    r8,[rip+0x4d30]        # 0x140006508
   1400017d8:	mov    edx,0x104
   1400017dd:	lea    rcx,[rbp+0x370]
   1400017e4:	call   QWORD PTR [rip+0x4bee]        # 0x1400063d8
   1400017ea:	lea    rdx,[rbp-0x60]
   1400017ee:	lea    rcx,[rbp+0x370]
   1400017f5:	call   QWORD PTR [rip+0x4965]        # 0x140006160
   1400017fb:	cmp    rax,0xffffffffffffffff
   1400017ff:	je     0x14000180a
   140001801:	mov    rcx,rax
   140001804:	call   QWORD PTR [rip+0x4936]        # 0x140006140
   14000180a:	movzx  eax,WORD PTR [rbx]
   14000180d:	lea    rdx,[rip+0x4d04]        # 0x140006518
   140001814:	mov    WORD PTR [r15+rsi*2],ax
   140001819:	mov    r9d,0x20019
   14000181f:	lea    rax,[rsp+0x48]
   140001824:	mov    WORD PTR [rbx],di
   140001827:	xor    r8d,r8d
   14000182a:	mov    QWORD PTR [rsp+0x20],rax
   14000182f:	mov    rcx,0xffffffff80000001
   140001836:	call   QWORD PTR [rip+0x47d4]        # 0x140006010
   14000183c:	test   eax,eax
   14000183e:	jne    0x14000184b
   140001840:	mov    rcx,QWORD PTR [rsp+0x48]
   140001845:	call   QWORD PTR [rip+0x47d5]        # 0x140006020
   14000184b:	inc    rsi
   14000184e:	sub    rbx,0x2
   140001852:	cmp    rsi,r12
   140001855:	jb     0x140001780
   14000185b:	mov    rcx,QWORD PTR [rbp+0x580]
   140001862:	xor    rcx,rsp
   140001865:	call   0x140004510
   14000186a:	lea    r11,[rsp+0x690]
   140001872:	mov    rbx,QWORD PTR [r11+0x38]
   140001876:	mov    rsi,QWORD PTR [r11+0x40]
   14000187a:	mov    rdi,QWORD PTR [r11+0x48]
   14000187e:	mov    rsp,r11
   140001881:	pop    r15
   140001883:	pop    r14
   140001885:	pop    r13
   140001887:	pop    r12
   140001889:	pop    rbp
   14000188a:	ret
   14000188b:	int3
   14000188c:	int3
   14000188d:	int3
   14000188e:	int3
   14000188f:	int3
   140001890:	rex push rsi
   140001892:	sub    rsp,0x50
   140001896:	mov    rax,QWORD PTR [rip+0x6763]        # 0x140008000
   14000189d:	xor    rax,rsp
   1400018a0:	mov    QWORD PTR [rsp+0x48],rax
   1400018a5:	mov    rsi,rcx
   1400018a8:	call   QWORD PTR [rip+0x4872]        # 0x140006120
   1400018ae:	mov    r8d,eax
   1400018b1:	mov    eax,0x51eb851f
   1400018b6:	mul    r8d
   1400018b9:	shr    edx,0x5
   1400018bc:	imul   ecx,edx,0x64
   1400018bf:	sub    r8d,ecx
   1400018c2:	mov    DWORD PTR [rsp+0x30],r8d
   1400018c7:	mov    eax,DWORD PTR [rsp+0x30]
   1400018cb:	add    eax,0x5
   1400018ce:	mov    DWORD PTR [rsp+0x30],eax
   1400018d2:	mov    ecx,DWORD PTR [rsp+0x30]
   1400018d6:	call   QWORD PTR [rip+0x4874]        # 0x140006150
   1400018dc:	lea    rax,[rsp+0x38]
   1400018e1:	mov    r9d,0x20019
   1400018e7:	xor    r8d,r8d
   1400018ea:	mov    QWORD PTR [rsp+0x20],rax
   1400018ef:	lea    rdx,[rip+0x4e52]        # 0x140006748
   1400018f6:	mov    rcx,0xffffffff80000001
   1400018fd:	call   QWORD PTR [rip+0x470d]        # 0x140006010
   140001903:	test   eax,eax
   140001905:	jne    0x140001aa2
   14000190b:	mov    QWORD PTR [rsp+0x68],rbx
   140001910:	xor    ecx,ecx
   140001912:	mov    QWORD PTR [rsp+0x70],rdi
   140001917:	call   QWORD PTR [rip+0x4883]        # 0x1400061a0
   14000191d:	mov    rcx,rax
   140001920:	mov    rdi,rax
   140001923:	call   QWORD PTR [rip+0x4707]        # 0x140006030
   140001929:	mov    edx,0x1
   14000192e:	mov    rcx,rdi
   140001931:	mov    r8d,edx
   140001934:	mov    rbx,rax
   140001937:	call   QWORD PTR [rip+0x473b]        # 0x140006078
   14000193d:	mov    rcx,rax
   140001940:	call   QWORD PTR [rip+0x470a]        # 0x140006050
   140001946:	mov    rcx,rbx
   140001949:	call   QWORD PTR [rip+0x4711]        # 0x140006060
   14000194f:	mov    rdx,rdi
   140001952:	xor    ecx,ecx
   140001954:	call   QWORD PTR [rip+0x4916]        # 0x140006270
   14000195a:	xor    ecx,ecx
   14000195c:	mov    DWORD PTR [rsp+0x44],0x1
   140001964:	call   QWORD PTR [rip+0x4856]        # 0x1400061c0
   14000196a:	mov    DWORD PTR [rsp+0x40],eax
   14000196e:	xor    ecx,ecx
   140001970:	mov    DWORD PTR [rsp+0x40],0x200
   140001978:	call   QWORD PTR [rip+0x4822]        # 0x1400061a0
   14000197e:	mov    rcx,rax
   140001981:	mov    rdi,rax
   140001984:	call   QWORD PTR [rip+0x46a6]        # 0x140006030
   14000198a:	mov    edx,0x1
   14000198f:	mov    rcx,rdi
   140001992:	mov    r8d,edx
   140001995:	mov    rbx,rax
   140001998:	call   QWORD PTR [rip+0x46da]        # 0x140006078
   14000199e:	mov    rcx,rax
   1400019a1:	call   QWORD PTR [rip+0x46a9]        # 0x140006050
   1400019a7:	mov    rcx,rbx
   1400019aa:	call   QWORD PTR [rip+0x46b0]        # 0x140006060
   1400019b0:	mov    rdx,rdi
   1400019b3:	xor    ecx,ecx
   1400019b5:	call   QWORD PTR [rip+0x48b5]        # 0x140006270
   1400019bb:	mov    rcx,QWORD PTR [rsp+0x38]
   1400019c0:	lea    rax,[rsp+0x40]
   1400019c5:	mov    QWORD PTR [rsp+0x28],rax
   1400019ca:	lea    r9,[rsp+0x44]
   1400019cf:	xor    r8d,r8d
   1400019d2:	mov    QWORD PTR [rsp+0x20],rsi
   1400019d7:	lea    rdx,[rip+0x4ca2]        # 0x140006680
   1400019de:	call   QWORD PTR [rip+0x4634]        # 0x140006018
   1400019e4:	mov    ebx,0x5
   1400019e9:	test   eax,eax
   1400019eb:	je     0x140001a49
   1400019ed:	lea    r8,[rip+0x4adc]        # 0x1400064d0
   1400019f4:	mov    edx,0x100
   1400019f9:	mov    rcx,rsi
   1400019fc:	call   QWORD PTR [rip+0x49ce]        # 0x1400063d0
   140001a02:	xor    ecx,ecx
   140001a04:	call   QWORD PTR [rip+0x4796]        # 0x1400061a0
   140001a0a:	mov    rcx,rax
   140001a0d:	mov    rsi,rax
   140001a10:	call   QWORD PTR [rip+0x461a]        # 0x140006030
   140001a16:	mov    edx,0x1
   140001a1b:	mov    rcx,rsi
   140001a1e:	mov    r8d,edx
   140001a21:	mov    rdi,rax
   140001a24:	call   QWORD PTR [rip+0x464e]        # 0x140006078
   140001a2a:	mov    rcx,rax
   140001a2d:	call   QWORD PTR [rip+0x461d]        # 0x140006050
   140001a33:	mov    rcx,rdi
   140001a36:	call   QWORD PTR [rip+0x4624]        # 0x140006060
   140001a3c:	mov    rdx,rsi
   140001a3f:	xor    ecx,ecx
   140001a41:	call   QWORD PTR [rip+0x4829]        # 0x140006270
   140001a47:	jmp    0x140001a70
   140001a49:	mov    DWORD PTR [rsp+0x30],0x0
   140001a51:	mov    rcx,rbx
   140001a54:	nop    DWORD PTR [rax+0x0]
   140001a58:	nop    DWORD PTR [rax+rax*1+0x0]
   140001a60:	mov    eax,DWORD PTR [rsp+0x30]
   140001a64:	inc    eax
   140001a66:	mov    DWORD PTR [rsp+0x30],eax
   140001a6a:	sub    rcx,0x1
   140001a6e:	jne    0x140001a60
   140001a70:	mov    rdi,QWORD PTR [rsp+0x70]
   140001a75:	mov    DWORD PTR [rsp+0x30],0x0
   140001a7d:	nop    DWORD PTR [rax]
   140001a80:	mov    eax,DWORD PTR [rsp+0x30]
   140001a84:	inc    eax
   140001a86:	mov    DWORD PTR [rsp+0x30],eax
   140001a8a:	sub    rbx,0x1
   140001a8e:	jne    0x140001a80
   140001a90:	mov    rcx,QWORD PTR [rsp+0x38]
   140001a95:	mov    rbx,QWORD PTR [rsp+0x68]
   140001a9a:	call   QWORD PTR [rip+0x4580]        # 0x140006020
   140001aa0:	jmp    0x140001ab7
   140001aa2:	lea    r8,[rip+0x65d7]        # 0x140008080
   140001aa9:	mov    edx,0x100
   140001aae:	mov    rcx,rsi
   140001ab1:	call   QWORD PTR [rip+0x4919]        # 0x1400063d0
   140001ab7:	xor    ecx,ecx
   140001ab9:	call   QWORD PTR [rip+0x4701]        # 0x1400061c0
   140001abf:	mov    DWORD PTR [rsp+0x44],eax
   140001ac3:	mov    rcx,QWORD PTR [rsp+0x48]
   140001ac8:	xor    rcx,rsp
   140001acb:	call   0x140004510
   140001ad0:	add    rsp,0x50
   140001ad4:	pop    rsi
   140001ad5:	ret
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
   140001ae0:	mov    QWORD PTR [rsp+0x10],rbx
   140001ae5:	mov    QWORD PTR [rsp+0x18],rsi
   140001aea:	push   rbp
   140001aeb:	push   rdi
   140001aec:	push   r14
   140001aee:	lea    rbp,[rsp-0x9e0]
   140001af6:	sub    rsp,0xae0
   140001afd:	mov    rax,QWORD PTR [rip+0x64fc]        # 0x140008000
   140001b04:	xor    rax,rsp
   140001b07:	mov    QWORD PTR [rbp+0x9d0],rax
   140001b0e:	mov    r14,rcx
   140001b11:	mov    DWORD PTR [rsp+0x54],0x200
   140001b19:	lea    rax,[rsp+0x40]
   140001b1e:	mov    rcx,0xffffffff80000001
   140001b25:	mov    r9d,0x20019
   140001b2b:	mov    QWORD PTR [rsp+0x20],rax
   140001b30:	xor    r8d,r8d
   140001b33:	lea    rdx,[rip+0x49de]        # 0x140006518
   140001b3a:	call   QWORD PTR [rip+0x44d0]        # 0x140006010
   140001b40:	test   eax,eax
   140001b42:	jne    0x140001b89
   140001b44:	mov    rcx,QWORD PTR [rsp+0x40]
   140001b49:	lea    rax,[rsp+0x54]
   140001b4e:	mov    QWORD PTR [rsp+0x28],rax
   140001b53:	lea    rdx,[rip+0x49ee]        # 0x140006548
   140001b5a:	lea    rax,[rbp+0x7d0]
   140001b61:	xor    r9d,r9d
   140001b64:	xor    r8d,r8d
   140001b67:	mov    QWORD PTR [rsp+0x20],rax
   140001b6c:	call   QWORD PTR [rip+0x44a6]        # 0x140006018
   140001b72:	test   eax,eax
   140001b74:	jne    0x140001b7e
   140001b76:	mov    DWORD PTR [rsp+0x38],0x1
   140001b7e:	mov    rcx,QWORD PTR [rsp+0x40]
   140001b83:	call   QWORD PTR [rip+0x4497]        # 0x140006020
   140001b89:	xor    ecx,ecx
   140001b8b:	call   QWORD PTR [rip+0x460f]        # 0x1400061a0
   140001b91:	mov    rcx,rax
   140001b94:	mov    rdi,rax
   140001b97:	call   QWORD PTR [rip+0x4493]        # 0x140006030
   140001b9d:	mov    edx,0x1
   140001ba2:	mov    rcx,rdi
   140001ba5:	mov    r8d,edx
   140001ba8:	mov    rbx,rax
   140001bab:	call   QWORD PTR [rip+0x44c7]        # 0x140006078
   140001bb1:	mov    rcx,rax
   140001bb4:	call   QWORD PTR [rip+0x4496]        # 0x140006050
   140001bba:	mov    rcx,rbx
   140001bbd:	call   QWORD PTR [rip+0x449d]        # 0x140006060
   140001bc3:	mov    rdx,rdi
   140001bc6:	xor    ecx,ecx
   140001bc8:	call   QWORD PTR [rip+0x46a2]        # 0x140006270
   140001bce:	lea    rax,[rsp+0x48]
   140001bd3:	mov    r9d,0x20019
   140001bd9:	xor    r8d,r8d
   140001bdc:	mov    QWORD PTR [rsp+0x20],rax
   140001be1:	lea    rdx,[rip+0x4b60]        # 0x140006748
   140001be8:	mov    rcx,0xffffffff80000001
   140001bef:	call   QWORD PTR [rip+0x441b]        # 0x140006010
   140001bf5:	mov    esi,0x5
   140001bfa:	test   eax,eax
   140001bfc:	jne    0x140001d71
   140001c02:	lea    rcx,[rsp+0x58]
   140001c07:	call   QWORD PTR [rip+0x451b]        # 0x140006128
   140001c0d:	call   0x140001010
   140001c12:	inc    eax
   140001c14:	xor    ecx,ecx
   140001c16:	mov    DWORD PTR [rsp+0x38],eax
   140001c1a:	call   QWORD PTR [rip+0x45a0]        # 0x1400061c0
   140001c20:	mov    DWORD PTR [rsp+0x50],eax
   140001c24:	mov    edx,0x104
   140001c29:	lea    rcx,[rbp+0x3c0]
   140001c30:	mov    DWORD PTR [rsp+0x50],0x200
   140001c38:	call   QWORD PTR [rip+0x44fa]        # 0x140006138
   140001c3e:	test   eax,eax
   140001c40:	je     0x140001c7c
   140001c42:	lea    r8,[rip+0x48bf]        # 0x140006508
   140001c49:	mov    edx,0x104
   140001c4e:	lea    rcx,[rbp+0x3c0]
   140001c55:	call   QWORD PTR [rip+0x477d]        # 0x1400063d8
   140001c5b:	lea    rdx,[rsp+0x70]
   140001c60:	lea    rcx,[rbp+0x3c0]
   140001c67:	call   QWORD PTR [rip+0x44f3]        # 0x140006160
   140001c6d:	cmp    rax,0xffffffffffffffff
   140001c71:	je     0x140001c7c
   140001c73:	mov    rcx,rax
   140001c76:	call   QWORD PTR [rip+0x44c4]        # 0x140006140
   140001c7c:	mov    rcx,QWORD PTR [rsp+0x48]
   140001c81:	lea    rax,[rsp+0x50]
   140001c86:	mov    QWORD PTR [rsp+0x28],rax
   140001c8b:	lea    r9,[rsp+0x38]
   140001c90:	xor    r8d,r8d
   140001c93:	mov    QWORD PTR [rsp+0x20],r14
   140001c98:	lea    rdx,[rip+0x49f1]        # 0x140006690
   140001c9f:	call   QWORD PTR [rip+0x4373]        # 0x140006018
   140001ca5:	test   eax,eax
   140001ca7:	je     0x140001d14
   140001ca9:	call   QWORD PTR [rip+0x45a9]        # 0x140006258
   140001caf:	mov    rcx,rax
   140001cb2:	call   QWORD PTR [rip+0x4530]        # 0x1400061e8
   140001cb8:	lea    r8,[rip+0x49e1]        # 0x1400066a0
   140001cbf:	mov    edx,0x100
   140001cc4:	mov    rcx,r14
   140001cc7:	call   QWORD PTR [rip+0x4703]        # 0x1400063d0
   140001ccd:	xor    ecx,ecx
   140001ccf:	call   QWORD PTR [rip+0x44cb]        # 0x1400061a0
   140001cd5:	mov    rcx,rax
   140001cd8:	mov    rdi,rax
   140001cdb:	call   QWORD PTR [rip+0x434f]        # 0x140006030
   140001ce1:	mov    edx,0x1
   140001ce6:	mov    rcx,rdi
   140001ce9:	mov    r8d,edx
   140001cec:	mov    rbx,rax
   140001cef:	call   QWORD PTR [rip+0x4383]        # 0x140006078
   140001cf5:	mov    rcx,rax
   140001cf8:	call   QWORD PTR [rip+0x4352]        # 0x140006050
   140001cfe:	mov    rcx,rbx
   140001d01:	call   QWORD PTR [rip+0x4359]        # 0x140006060
   140001d07:	mov    rdx,rdi
   140001d0a:	xor    ecx,ecx
   140001d0c:	call   QWORD PTR [rip+0x455e]        # 0x140006270
   140001d12:	jmp    0x140001d58
   140001d14:	mov    DWORD PTR [rsp+0x30],0x0
   140001d1c:	mov    rcx,rsi
   140001d1f:	nop
   140001d20:	mov    eax,DWORD PTR [rsp+0x30]
   140001d24:	inc    eax
   140001d26:	mov    DWORD PTR [rsp+0x30],eax
   140001d2a:	sub    rcx,0x1
   140001d2e:	jne    0x140001d20
   140001d30:	mov    edx,0x100
   140001d35:	mov    rcx,r14
   140001d38:	call   QWORD PTR [rip+0x46a2]        # 0x1400063e0
   140001d3e:	test   rax,rax
   140001d41:	jne    0x140001d58
   140001d43:	lea    r8,[rip+0x4956]        # 0x1400066a0
   140001d4a:	mov    edx,0x100
   140001d4f:	mov    rcx,r14
   140001d52:	call   QWORD PTR [rip+0x4678]        # 0x1400063d0
   140001d58:	xor    ecx,ecx
   140001d5a:	call   QWORD PTR [rip+0x4460]        # 0x1400061c0
   140001d60:	mov    rcx,QWORD PTR [rsp+0x48]
   140001d65:	mov    DWORD PTR [rsp+0x30],eax
   140001d69:	call   QWORD PTR [rip+0x42b1]        # 0x140006020
   140001d6f:	jmp    0x140001d86
   140001d71:	lea    r8,[rip+0x4928]        # 0x1400066a0
   140001d78:	mov    edx,0x100
   140001d7d:	mov    rcx,r14
   140001d80:	call   QWORD PTR [rip+0x464a]        # 0x1400063d0
   140001d86:	mov    rax,0xffffffffffffffff
   140001d8d:	nop    DWORD PTR [rax]
   140001d90:	inc    rax
   140001d93:	cmp    WORD PTR [r14+rax*2],0x0
   140001d99:	jne    0x140001d90
   140001d9b:	cmp    rax,0x19
   140001d9f:	jne    0x140001ec7
   140001da5:	mov    DWORD PTR [rsp+0x30],0x0
   140001dad:	mov    rcx,rsi
   140001db0:	mov    eax,DWORD PTR [rsp+0x30]
   140001db4:	inc    eax
   140001db6:	mov    DWORD PTR [rsp+0x30],eax
   140001dba:	sub    rcx,0x1
   140001dbe:	jne    0x140001db0
   140001dc0:	mov    r8,r14
   140001dc3:	lea    rcx,[rbp+0x1c0]
   140001dca:	mov    edx,0x100
   140001dcf:	call   QWORD PTR [rip+0x45fb]        # 0x1400063d0
   140001dd5:	xor    ecx,ecx
   140001dd7:	call   QWORD PTR [rip+0x43e3]        # 0x1400061c0
   140001ddd:	lea    rcx,[rbp+0x1c0]
   140001de4:	mov    DWORD PTR [rsp+0x38],eax
   140001de8:	call   0x140001300
   140001ded:	call   QWORD PTR [rip+0x4465]        # 0x140006258
   140001df3:	mov    rcx,rax
   140001df6:	call   QWORD PTR [rip+0x43ec]        # 0x1400061e8
   140001dfc:	lea    rcx,[rbp+0x5d0]
   140001e03:	call   0x140001890
   140001e08:	xor    ecx,ecx
   140001e0a:	call   QWORD PTR [rip+0x43b0]        # 0x1400061c0
   140001e10:	mov    DWORD PTR [rsp+0x38],eax
   140001e14:	mov    DWORD PTR [rsp+0x30],0x0
   140001e1c:	nop    DWORD PTR [rax+0x0]
   140001e20:	mov    eax,DWORD PTR [rsp+0x30]
   140001e24:	inc    eax
   140001e26:	mov    DWORD PTR [rsp+0x30],eax
   140001e2a:	sub    rsi,0x1
   140001e2e:	jne    0x140001e20
   140001e30:	lea    rax,[rbp+0x1c0]
   140001e37:	lea    r8,[rbp+0x5d0]
   140001e3e:	sub    r8,rax
   140001e41:	movzx  edx,WORD PTR [rax]
   140001e44:	movzx  ecx,WORD PTR [rax+r8*1]
   140001e49:	sub    edx,ecx
   140001e4b:	jne    0x140001e55
   140001e4d:	add    rax,0x2
   140001e51:	test   ecx,ecx
   140001e53:	jne    0x140001e41
   140001e55:	test   edx,edx
   140001e57:	jne    0x140001e80
   140001e59:	mov    ecx,0x4
   140001e5e:	call   QWORD PTR [rip+0x41f4]        # 0x140006058
   140001e64:	lea    r8,[rsp+0x58]
   140001e69:	mov    edx,0x10
   140001e6e:	mov    rcx,rax
   140001e71:	call   QWORD PTR [rip+0x4211]        # 0x140006088
   140001e77:	mov    BYTE PTR [rip+0x6a1a],0x1        # 0x140008898
   140001e7e:	jmp    0x140001efd
   140001e80:	xor    ecx,ecx
   140001e82:	call   QWORD PTR [rip+0x4318]        # 0x1400061a0
   140001e88:	mov    rcx,rax
   140001e8b:	mov    rdi,rax
   140001e8e:	call   QWORD PTR [rip+0x419c]        # 0x140006030
   140001e94:	mov    edx,0x1
   140001e99:	mov    rcx,rdi
   140001e9c:	mov    r8d,edx
   140001e9f:	mov    rbx,rax
   140001ea2:	call   QWORD PTR [rip+0x41d0]        # 0x140006078
   140001ea8:	mov    rcx,rax
   140001eab:	call   QWORD PTR [rip+0x419f]        # 0x140006050
   140001eb1:	mov    rcx,rbx
   140001eb4:	call   QWORD PTR [rip+0x41a6]        # 0x140006060
   140001eba:	mov    rdx,rdi
   140001ebd:	xor    ecx,ecx
   140001ebf:	call   QWORD PTR [rip+0x43ab]        # 0x140006270
   140001ec5:	jmp    0x140001efd
   140001ec7:	lea    rax,[rsp+0x38]
   140001ecc:	mov    r9d,0x20019
   140001ed2:	xor    r8d,r8d
   140001ed5:	mov    QWORD PTR [rsp+0x20],rax
   140001eda:	lea    rdx,[rip+0x4637]        # 0x140006518
   140001ee1:	mov    rcx,0xffffffff80000001
   140001ee8:	call   QWORD PTR [rip+0x4122]        # 0x140006010
   140001eee:	test   eax,eax
   140001ef0:	jne    0x140001efd
   140001ef2:	mov    rcx,QWORD PTR [rsp+0x38]
   140001ef7:	call   QWORD PTR [rip+0x4123]        # 0x140006020
   140001efd:	mov    rcx,QWORD PTR [rbp+0x9d0]
   140001f04:	xor    rcx,rsp
   140001f07:	call   0x140004510
   140001f0c:	lea    r11,[rsp+0xae0]
   140001f14:	mov    rbx,QWORD PTR [r11+0x28]
   140001f18:	mov    rsi,QWORD PTR [r11+0x30]
   140001f1c:	mov    rsp,r11
   140001f1f:	pop    r14
   140001f21:	pop    rdi
   140001f22:	pop    rbp
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
   140001f30:	mov    QWORD PTR [rsp+0x10],rbx
   140001f35:	mov    QWORD PTR [rsp+0x20],rsi
   140001f3a:	push   rbp
   140001f3b:	push   rdi
   140001f3c:	push   r12
   140001f3e:	push   r14
   140001f40:	push   r15
   140001f42:	lea    rbp,[rsp-0x830]
   140001f4a:	sub    rsp,0x930
   140001f51:	mov    rax,QWORD PTR [rip+0x60a8]        # 0x140008000
   140001f58:	xor    rax,rsp
   140001f5b:	mov    QWORD PTR [rbp+0x820],rax
   140001f62:	mov    esi,edx
   140001f64:	mov    DWORD PTR [rsp+0x68],0x100
   140001f6c:	mov    r14,rcx
   140001f6f:	lea    rdx,[rsp+0x68]
   140001f74:	lea    rcx,[rbp+0x620]
   140001f7b:	mov    r15,r8
   140001f7e:	call   QWORD PTR [rip+0x41ac]        # 0x140006130
   140001f84:	xor    r12d,r12d
   140001f87:	test   eax,eax
   140001f89:	je     0x140001fb9
   140001f8b:	mov    eax,DWORD PTR [rsp+0x68]
   140001f8f:	mov    DWORD PTR [rsp+0x50],r12d
   140001f94:	test   eax,eax
   140001f96:	je     0x140001fb9
   140001f98:	lea    rdx,[rbp+0x620]
   140001f9f:	mov    r8d,eax
   140001fa2:	movzx  ecx,WORD PTR [rdx]
   140001fa5:	lea    rdx,[rdx+0x2]
   140001fa9:	mov    eax,DWORD PTR [rsp+0x50]
   140001fad:	add    ecx,eax
   140001faf:	mov    DWORD PTR [rsp+0x50],ecx
   140001fb3:	sub    r8,0x1
   140001fb7:	jne    0x140001fa2
   140001fb9:	xor    ecx,ecx
   140001fbb:	call   QWORD PTR [rip+0x41df]        # 0x1400061a0
   140001fc1:	mov    rcx,rax
   140001fc4:	mov    rdi,rax
   140001fc7:	call   QWORD PTR [rip+0x4063]        # 0x140006030
   140001fcd:	mov    edx,0x1
   140001fd2:	mov    rcx,rdi
   140001fd5:	mov    r8d,edx
   140001fd8:	mov    rbx,rax
   140001fdb:	call   QWORD PTR [rip+0x4097]        # 0x140006078
   140001fe1:	mov    rcx,rax
   140001fe4:	call   QWORD PTR [rip+0x4066]        # 0x140006050
   140001fea:	mov    rcx,rbx
   140001fed:	call   QWORD PTR [rip+0x406d]        # 0x140006060
   140001ff3:	mov    rdx,rdi
   140001ff6:	xor    ecx,ecx
   140001ff8:	call   QWORD PTR [rip+0x4272]        # 0x140006270
   140001ffe:	sub    esi,0x110
   140002004:	je     0x140002307
   14000200a:	cmp    esi,0x1
   14000200d:	jne    0x140002303
   140002013:	cmp    r15w,si
   140002017:	jne    0x1400022ec
   14000201d:	mov    r9d,0x100
   140002023:	lea    r8,[rbp+0x210]
   14000202a:	mov    edx,0x3e9
   14000202f:	mov    rcx,r14
   140002032:	call   QWORD PTR [rip+0x41d0]        # 0x140006208
   140002038:	xor    ecx,ecx
   14000203a:	call   QWORD PTR [rip+0x4180]        # 0x1400061c0
   140002040:	mov    DWORD PTR [rsp+0x50],eax
   140002044:	mov    eax,DWORD PTR [rsp+0x50]
   140002048:	test   eax,eax
   14000204a:	jle    0x140002056
   14000204c:	mov    eax,DWORD PTR [rsp+0x50]
   140002050:	inc    eax
   140002052:	mov    DWORD PTR [rsp+0x50],eax
   140002056:	xor    ecx,ecx
   140002058:	call   QWORD PTR [rip+0x4142]        # 0x1400061a0
   14000205e:	mov    rcx,rax
   140002061:	mov    rdi,rax
   140002064:	call   QWORD PTR [rip+0x3fc6]        # 0x140006030
   14000206a:	mov    edx,0x1
   14000206f:	mov    rcx,rdi
   140002072:	mov    r8d,edx
   140002075:	mov    rbx,rax
   140002078:	call   QWORD PTR [rip+0x3ffa]        # 0x140006078
   14000207e:	mov    rcx,rax
   140002081:	call   QWORD PTR [rip+0x3fc9]        # 0x140006050
   140002087:	mov    rcx,rbx
   14000208a:	call   QWORD PTR [rip+0x3fd0]        # 0x140006060
   140002090:	mov    rdx,rdi
   140002093:	xor    ecx,ecx
   140002095:	call   QWORD PTR [rip+0x41d5]        # 0x140006270
   14000209b:	xor    ecx,ecx
   14000209d:	call   QWORD PTR [rip+0x411d]        # 0x1400061c0
   1400020a3:	mov    QWORD PTR [rsp+0x40],r12
   1400020a8:	lea    rdx,[rip+0x4699]        # 0x140006748
   1400020af:	mov    DWORD PTR [rsp+0x60],eax
   1400020b3:	xor    r9d,r9d
   1400020b6:	lea    rax,[rsp+0x58]
   1400020bb:	xor    r8d,r8d
   1400020be:	mov    QWORD PTR [rsp+0x38],rax
   1400020c3:	mov    rcx,0xffffffff80000001
   1400020ca:	mov    QWORD PTR [rsp+0x30],r12
   1400020cf:	mov    DWORD PTR [rsp+0x28],0x20006
   1400020d7:	mov    DWORD PTR [rsp+0x20],r12d
   1400020dc:	call   QWORD PTR [rip+0x3f1e]        # 0x140006000
   1400020e2:	test   eax,eax
   1400020e4:	jne    0x1400021ed
   1400020ea:	lea    rdx,[rsp+0x60]
   1400020ef:	mov    DWORD PTR [rsp+0x60],0x20
   1400020f7:	lea    rcx,[rbp+0x1d0]
   1400020fe:	call   QWORD PTR [rip+0x402c]        # 0x140006130
   140002104:	test   eax,eax
   140002106:	je     0x140002113
   140002108:	movzx  eax,WORD PTR [rbp+0x1d0]
   14000210f:	mov    DWORD PTR [rsp+0x50],eax
   140002113:	mov    edx,0x104
   140002118:	lea    rcx,[rbp+0x410]
   14000211f:	call   QWORD PTR [rip+0x4013]        # 0x140006138
   140002125:	test   eax,eax
   140002127:	je     0x140002162
   140002129:	lea    r8,[rip+0x43d8]        # 0x140006508
   140002130:	mov    edx,0x104
   140002135:	lea    rcx,[rbp+0x410]
   14000213c:	call   QWORD PTR [rip+0x4296]        # 0x1400063d8
   140002142:	lea    rdx,[rbp-0x80]
   140002146:	lea    rcx,[rbp+0x410]
   14000214d:	call   QWORD PTR [rip+0x400d]        # 0x140006160
   140002153:	cmp    rax,0xffffffffffffffff
   140002157:	je     0x140002162
   140002159:	mov    rcx,rax
   14000215c:	call   QWORD PTR [rip+0x3fde]        # 0x140006140
   140002162:	lea    rcx,[rbp+0x210]
   140002169:	mov    rax,0xffffffffffffffff
   140002170:	cmp    WORD PTR [rcx+rax*2+0x2],r12w
   140002176:	lea    rax,[rax+0x1]
   14000217a:	jne    0x140002170
   14000217c:	mov    rcx,QWORD PTR [rsp+0x58]
   140002181:	lea    eax,[rax*2+0x2]
   140002188:	mov    DWORD PTR [rsp+0x28],eax
   14000218c:	lea    rdx,[rip+0x44fd]        # 0x140006690
   140002193:	lea    rax,[rbp+0x210]
   14000219a:	mov    r9d,0x1
   1400021a0:	xor    r8d,r8d
   1400021a3:	mov    QWORD PTR [rsp+0x20],rax
   1400021a8:	call   QWORD PTR [rip+0x3e5a]        # 0x140006008
   1400021ae:	call   QWORD PTR [rip+0x3f6c]        # 0x140006120
   1400021b4:	mov    r8d,eax
   1400021b7:	mov    eax,0x51eb851f
   1400021bc:	mul    r8d
   1400021bf:	shr    edx,0x5
   1400021c2:	imul   ecx,edx,0x64
   1400021c5:	sub    r8d,ecx
   1400021c8:	mov    DWORD PTR [rsp+0x50],r8d
   1400021cd:	mov    eax,DWORD PTR [rsp+0x50]
   1400021d1:	add    eax,0x5
   1400021d4:	mov    DWORD PTR [rsp+0x50],eax
   1400021d8:	mov    ecx,DWORD PTR [rsp+0x50]
   1400021dc:	call   QWORD PTR [rip+0x3f6e]        # 0x140006150
   1400021e2:	mov    rcx,QWORD PTR [rsp+0x58]
   1400021e7:	call   QWORD PTR [rip+0x3e33]        # 0x140006020
   1400021ed:	mov    ecx,0x4
   1400021f2:	call   QWORD PTR [rip+0x3e60]        # 0x140006058
   1400021f8:	lea    r8,[rsp+0x70]
   1400021fd:	mov    edx,0x10
   140002202:	mov    rcx,rax
   140002205:	call   QWORD PTR [rip+0x3e7d]        # 0x140006088
   14000220b:	mov    QWORD PTR [rsp+0x40],r12
   140002210:	lea    rax,[rsp+0x58]
   140002215:	mov    QWORD PTR [rsp+0x38],rax
   14000221a:	lea    rdx,[rip+0x4527]        # 0x140006748
   140002221:	mov    QWORD PTR [rsp+0x30],r12
   140002226:	xor    r9d,r9d
   140002229:	mov    DWORD PTR [rsp+0x28],0x20006
   140002231:	xor    r8d,r8d
   140002234:	mov    rcx,0xffffffff80000001
   14000223b:	mov    DWORD PTR [rsp+0x20],r12d
   140002240:	call   QWORD PTR [rip+0x3dba]        # 0x140006000
   140002246:	test   eax,eax
   140002248:	jne    0x1400022dc
   14000224e:	lea    rax,[rsp+0x60]
   140002253:	mov    r9d,0x20019
   140002259:	xor    r8d,r8d
   14000225c:	mov    QWORD PTR [rsp+0x20],rax
   140002261:	lea    rdx,[rip+0x42b0]        # 0x140006518
   140002268:	mov    rcx,0xffffffff80000001
   14000226f:	call   QWORD PTR [rip+0x3d9b]        # 0x140006010
   140002275:	test   eax,eax
   140002277:	jne    0x140002284
   140002279:	mov    rcx,QWORD PTR [rsp+0x60]
   14000227e:	call   QWORD PTR [rip+0x3d9c]        # 0x140006020
   140002284:	call   QWORD PTR [rip+0x3fce]        # 0x140006258
   14000228a:	mov    rcx,rax
   14000228d:	call   QWORD PTR [rip+0x3f55]        # 0x1400061e8
   140002293:	mov    rcx,QWORD PTR [rsp+0x58]
   140002298:	lea    rax,[rip+0x4231]        # 0x1400064d0
   14000229f:	mov    DWORD PTR [rsp+0x28],0x34
   1400022a7:	lea    rdx,[rip+0x43d2]        # 0x140006680
   1400022ae:	mov    r9d,0x1
   1400022b4:	mov    QWORD PTR [rsp+0x20],rax
   1400022b9:	xor    r8d,r8d
   1400022bc:	call   QWORD PTR [rip+0x3d46]        # 0x140006008
   1400022c2:	call   QWORD PTR [rip+0x3f90]        # 0x140006258
   1400022c8:	mov    rcx,rax
   1400022cb:	call   QWORD PTR [rip+0x3f17]        # 0x1400061e8
   1400022d1:	mov    rcx,QWORD PTR [rsp+0x58]
   1400022d6:	call   QWORD PTR [rip+0x3d44]        # 0x140006020
   1400022dc:	mov    edx,0x1
   1400022e1:	mov    rcx,r14
   1400022e4:	call   QWORD PTR [rip+0x3ece]        # 0x1400061b8
   1400022ea:	jmp    0x140002328
   1400022ec:	cmp    r15w,0x2
   1400022f1:	jne    0x140002303
   1400022f3:	mov    edx,0x2
   1400022f8:	mov    rcx,r14
   1400022fb:	call   QWORD PTR [rip+0x3eb7]        # 0x1400061b8
   140002301:	jmp    0x140002328
   140002303:	xor    eax,eax
   140002305:	jmp    0x14000232d
   140002307:	lea    rcx,[rbp+0x210]
   14000230e:	call   0x140001ae0
   140002313:	lea    r8,[rbp+0x210]
   14000231a:	mov    edx,0x3e9
   14000231f:	mov    rcx,r14
   140002322:	call   QWORD PTR [rip+0x3ed8]        # 0x140006200
   140002328:	mov    eax,0x1
   14000232d:	mov    rcx,QWORD PTR [rbp+0x820]
   140002334:	xor    rcx,rsp
   140002337:	call   0x140004510
   14000233c:	lea    r11,[rsp+0x930]
   140002344:	mov    rbx,QWORD PTR [r11+0x38]
   140002348:	mov    rsi,QWORD PTR [r11+0x48]
   14000234c:	mov    rsp,r11
   14000234f:	pop    r15
   140002351:	pop    r14
   140002353:	pop    r12
   140002355:	pop    rdi
   140002356:	pop    rbp
   140002357:	ret
   140002358:	int3
   140002359:	int3
   14000235a:	int3
   14000235b:	int3
   14000235c:	int3
   14000235d:	int3
   14000235e:	int3
   14000235f:	int3
   140002360:	mov    QWORD PTR [rsp+0x10],rbx
   140002365:	push   rbp
   140002366:	push   rsi
   140002367:	push   rdi
   140002368:	push   r12
   14000236a:	push   r13
   14000236c:	push   r14
   14000236e:	push   r15
   140002370:	lea    rbp,[rsp-0x450]
   140002378:	sub    rsp,0x550
   14000237f:	mov    rax,QWORD PTR [rip+0x5c7a]        # 0x140008000
   140002386:	xor    rax,rsp
   140002389:	mov    QWORD PTR [rbp+0x440],rax
   140002390:	mov    r15,rcx
   140002393:	mov    ebx,r9d
   140002396:	mov    ecx,0x2
   14000239b:	mov    r14,r8
   14000239e:	call   QWORD PTR [rip+0x3e1c]        # 0x1400061c0
   1400023a4:	mov    DWORD PTR [rsp+0x68],eax
   1400023a8:	mov    eax,DWORD PTR [rsp+0x68]
   1400023ac:	test   eax,eax
   1400023ae:	jle    0x1400023ba
   1400023b0:	mov    eax,DWORD PTR [rsp+0x68]
   1400023b4:	inc    eax
   1400023b6:	mov    DWORD PTR [rsp+0x68],eax
   1400023ba:	call   QWORD PTR [rip+0x3e98]        # 0x140006258
   1400023c0:	mov    rcx,rax
   1400023c3:	call   QWORD PTR [rip+0x3e1f]        # 0x1400061e8
   1400023c9:	xor    r13d,r13d
   1400023cc:	call   QWORD PTR [rip+0x3d4e]        # 0x140006120
   1400023d2:	mov    r8d,eax
   1400023d5:	mov    eax,0x51eb851f
   1400023da:	mul    r8d
   1400023dd:	shr    edx,0x5
   1400023e0:	imul   ecx,edx,0x64
   1400023e3:	sub    r8d,ecx
   1400023e6:	mov    DWORD PTR [rsp+0x68],r8d
   1400023eb:	mov    eax,DWORD PTR [rsp+0x68]
   1400023ef:	add    eax,0x5
   1400023f2:	mov    DWORD PTR [rsp+0x68],eax
   1400023f6:	mov    ecx,DWORD PTR [rsp+0x68]
   1400023fa:	call   QWORD PTR [rip+0x3d50]        # 0x140006150
   140002400:	xor    r12d,r12d
   140002403:	call   QWORD PTR [rip+0x3d17]        # 0x140006120
   140002409:	mov    r8d,eax
   14000240c:	mov    eax,0x51eb851f
   140002411:	mul    r8d
   140002414:	shr    edx,0x5
   140002417:	imul   ecx,edx,0x64
   14000241a:	sub    r8d,ecx
   14000241d:	mov    DWORD PTR [rsp+0x68],r8d
   140002422:	mov    eax,DWORD PTR [rsp+0x68]
   140002426:	add    eax,0x5
   140002429:	mov    DWORD PTR [rsp+0x68],eax
   14000242d:	mov    ecx,DWORD PTR [rsp+0x68]
   140002431:	call   QWORD PTR [rip+0x3d19]        # 0x140006150
   140002437:	xor    edi,edi
   140002439:	call   QWORD PTR [rip+0x3ce1]        # 0x140006120
   14000243f:	mov    r8d,eax
   140002442:	mov    eax,0x51eb851f
   140002447:	mul    r8d
   14000244a:	shr    edx,0x5
   14000244d:	imul   ecx,edx,0x64
   140002450:	sub    r8d,ecx
   140002453:	mov    DWORD PTR [rsp+0x68],r8d
   140002458:	mov    eax,DWORD PTR [rsp+0x68]
   14000245c:	add    eax,0x5
   14000245f:	mov    DWORD PTR [rsp+0x68],eax
   140002463:	mov    ecx,DWORD PTR [rsp+0x68]
   140002467:	call   QWORD PTR [rip+0x3ce3]        # 0x140006150
   14000246d:	mov    esi,0x5
   140002472:	test   r14,r14
   140002475:	je     0x140002675
   14000247b:	mov    rax,0xffffffffffffffff
   140002482:	inc    rax
   140002485:	cmp    WORD PTR [r14+rax*2],di
   14000248a:	jne    0x140002482
   14000248c:	cmp    rax,0x1
   140002490:	jbe    0x140002675
   140002496:	mov    r8d,0x2
   14000249c:	lea    rdx,[rip+0x4219]        # 0x1400066bc
   1400024a3:	mov    rcx,r14
   1400024a6:	call   QWORD PTR [rip+0x3f1c]        # 0x1400063c8
   1400024ac:	test   eax,eax
   1400024ae:	je     0x140002646
   1400024b4:	mov    r8d,0x2
   1400024ba:	lea    rdx,[rip+0x4203]        # 0x1400066c4
   1400024c1:	mov    rcx,r14
   1400024c4:	call   QWORD PTR [rip+0x3efe]        # 0x1400063c8
   1400024ca:	test   eax,eax
   1400024cc:	je     0x140002646
   1400024d2:	mov    r8d,0x2
   1400024d8:	lea    rdx,[rip+0x41ed]        # 0x1400066cc
   1400024df:	mov    rcx,r14
   1400024e2:	call   QWORD PTR [rip+0x3ee0]        # 0x1400063c8
   1400024e8:	test   eax,eax
   1400024ea:	je     0x1400025bd
   1400024f0:	mov    r8d,0x2
   1400024f6:	lea    rdx,[rip+0x41d7]        # 0x1400066d4
   1400024fd:	mov    rcx,r14
   140002500:	call   QWORD PTR [rip+0x3ec2]        # 0x1400063c8
   140002506:	test   eax,eax
   140002508:	je     0x1400025bd
   14000250e:	mov    r8d,0x2
   140002514:	lea    rdx,[rip+0x41c1]        # 0x1400066dc
   14000251b:	mov    rcx,r14
   14000251e:	call   QWORD PTR [rip+0x3ea4]        # 0x1400063c8
   140002524:	test   eax,eax
   140002526:	je     0x140002546
   140002528:	mov    r8d,0x2
   14000252e:	lea    rdx,[rip+0x41af]        # 0x1400066e4
   140002535:	mov    rcx,r14
   140002538:	call   QWORD PTR [rip+0x3e8a]        # 0x1400063c8
   14000253e:	test   eax,eax
   140002540:	jne    0x140002675
   140002546:	xor    ecx,ecx
   140002548:	mov    ebx,0x3
   14000254d:	call   QWORD PTR [rip+0x3c6d]        # 0x1400061c0
   140002553:	mov    edx,0x104
   140002558:	mov    DWORD PTR [rip+0x641e],0x1        # 0x140008980
   140002562:	lea    rcx,[rbp+0x230]
   140002569:	mov    DWORD PTR [rsp+0x68],eax
   14000256d:	call   QWORD PTR [rip+0x3bc5]        # 0x140006138
   140002573:	test   eax,eax
   140002575:	je     0x140002675
   14000257b:	lea    r8,[rip+0x3f86]        # 0x140006508
   140002582:	mov    edx,0x104
   140002587:	lea    rcx,[rbp+0x230]
   14000258e:	call   QWORD PTR [rip+0x3e44]        # 0x1400063d8
   140002594:	lea    rdx,[rbp-0x60]
   140002598:	lea    rcx,[rbp+0x230]
   14000259f:	call   QWORD PTR [rip+0x3bbb]        # 0x140006160
   1400025a5:	cmp    rax,0xffffffffffffffff
   1400025a9:	je     0x140002675
   1400025af:	mov    rcx,rax
   1400025b2:	call   QWORD PTR [rip+0x3b88]        # 0x140006140
   1400025b8:	jmp    0x140002675
   1400025bd:	xor    ecx,ecx
   1400025bf:	mov    r13d,0x1
   1400025c5:	call   QWORD PTR [rip+0x3bd5]        # 0x1400061a0
   1400025cb:	mov    rcx,rax
   1400025ce:	mov    rdi,rax
   1400025d1:	call   QWORD PTR [rip+0x3a59]        # 0x140006030
   1400025d7:	mov    edx,r13d
   1400025da:	mov    rcx,rdi
   1400025dd:	mov    r8d,edx
   1400025e0:	mov    rbx,rax
   1400025e3:	call   QWORD PTR [rip+0x3a8f]        # 0x140006078
   1400025e9:	mov    rcx,rax
   1400025ec:	call   QWORD PTR [rip+0x3a5e]        # 0x140006050
   1400025f2:	mov    rcx,rbx
   1400025f5:	call   QWORD PTR [rip+0x3a65]        # 0x140006060
   1400025fb:	mov    rdx,rdi
   1400025fe:	xor    ecx,ecx
   140002600:	call   QWORD PTR [rip+0x3c6a]        # 0x140006270
   140002606:	lea    rcx,[r14+0x6]
   14000260a:	xor    edx,edx
   14000260c:	mov    r8d,0xa
   140002612:	call   QWORD PTR [rip+0x3cd0]        # 0x1400062e8
   140002618:	mov    DWORD PTR [rsp+0x68],r12d
   14000261d:	mov    rcx,rsi
   140002620:	mov    edi,eax
   140002622:	nop    DWORD PTR [rax+0x0]
   140002626:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002630:	mov    eax,DWORD PTR [rsp+0x68]
   140002634:	inc    eax
   140002636:	mov    DWORD PTR [rsp+0x68],eax
   14000263a:	sub    rcx,r13
   14000263d:	jne    0x140002630
   14000263f:	mov    ebx,0x4
   140002644:	jmp    0x140002675
   140002646:	lea    rdx,[rsp+0x68]
   14000264b:	mov    DWORD PTR [rsp+0x68],0x20
   140002653:	lea    rcx,[rbp+0x1f0]
   14000265a:	call   QWORD PTR [rip+0x3ad0]        # 0x140006130
   140002660:	test   eax,eax
   140002662:	je     0x14000266f
   140002664:	movzx  eax,WORD PTR [rbp+0x1f0]
   14000266b:	mov    DWORD PTR [rsp+0x68],eax
   14000266f:	mov    r12d,0x1
   140002675:	mov    DWORD PTR [rsp+0x68],0x0
   14000267d:	mov    rcx,rsi
   140002680:	mov    eax,DWORD PTR [rsp+0x68]
   140002684:	inc    eax
   140002686:	mov    DWORD PTR [rsp+0x68],eax
   14000268a:	sub    rcx,0x1
   14000268e:	jne    0x140002680
   140002690:	mov    r9d,0x64
   140002696:	lea    r8,[rip+0x6313]        # 0x1400089b0
   14000269d:	mov    edx,0x67
   1400026a2:	mov    rcx,r15
   1400026a5:	call   QWORD PTR [rip+0x3b2d]        # 0x1400061d8
   1400026ab:	lea    rax,[rsp+0x30]
   1400026b0:	mov    r9d,0x20019
   1400026b6:	xor    r8d,r8d
   1400026b9:	mov    QWORD PTR [rsp+0x20],rax
   1400026be:	lea    rdx,[rip+0x3e53]        # 0x140006518
   1400026c5:	mov    rcx,0xffffffff80000001
   1400026cc:	call   QWORD PTR [rip+0x393e]        # 0x140006010
   1400026d2:	test   eax,eax
   1400026d4:	jne    0x1400026e1
   1400026d6:	mov    rcx,QWORD PTR [rsp+0x30]
   1400026db:	call   QWORD PTR [rip+0x393f]        # 0x140006020
   1400026e1:	mov    r9d,0x64
   1400026e7:	lea    r8,[rip+0x61b2]        # 0x1400088a0
   1400026ee:	mov    edx,0x6d
   1400026f3:	mov    rcx,r15
   1400026f6:	call   QWORD PTR [rip+0x3adc]        # 0x1400061d8
   1400026fc:	mov    ecx,0x4
   140002701:	call   QWORD PTR [rip+0x3951]        # 0x140006058
   140002707:	lea    r8,[rsp+0x70]
   14000270c:	mov    edx,0x10
   140002711:	mov    rcx,rax
   140002714:	call   QWORD PTR [rip+0x396e]        # 0x140006088
   14000271a:	mov    rcx,r15
   14000271d:	call   0x140002950
   140002722:	mov    rcx,rsi
   140002725:	mov    DWORD PTR [rsp+0x68],0x0
   14000272d:	nop    DWORD PTR [rax]
   140002730:	mov    eax,DWORD PTR [rsp+0x68]
   140002734:	inc    eax
   140002736:	mov    DWORD PTR [rsp+0x68],eax
   14000273a:	sub    rcx,0x1
   14000273e:	jne    0x140002730
   140002740:	mov    r9,rdi
   140002743:	mov    r8d,r13d
   140002746:	mov    edx,ebx
   140002748:	mov    rcx,r15
   14000274b:	call   0x140002bf0
   140002750:	test   eax,eax
   140002752:	jne    0x140002788
   140002754:	lea    rdx,[rsp+0x68]
   140002759:	mov    DWORD PTR [rsp+0x68],0x20
   140002761:	lea    rcx,[rbp+0x1f0]
   140002768:	call   QWORD PTR [rip+0x39c2]        # 0x140006130
   14000276e:	test   eax,eax
   140002770:	je     0x140002800
   140002776:	movzx  eax,WORD PTR [rbp+0x1f0]
   14000277d:	mov    DWORD PTR [rsp+0x68],eax
   140002781:	xor    eax,eax
   140002783:	jmp    0x14000291c
   140002788:	test   r12d,r12d
   14000278b:	je     0x140002807
   14000278d:	call   QWORD PTR [rip+0x398d]        # 0x140006120
   140002793:	mov    r9d,eax
   140002796:	mov    eax,0x51eb851f
   14000279b:	mul    r9d
   14000279e:	shr    edx,0x5
   1400027a1:	imul   r8d,edx,0x64
   1400027a5:	sub    r9d,r8d
   1400027a8:	mov    DWORD PTR [rsp+0x68],r9d
   1400027ad:	mov    eax,DWORD PTR [rsp+0x68]
   1400027b1:	add    eax,esi
   1400027b3:	mov    DWORD PTR [rsp+0x68],eax
   1400027b7:	mov    ecx,DWORD PTR [rsp+0x68]
   1400027bb:	call   QWORD PTR [rip+0x398f]        # 0x140006150
   1400027c1:	lea    r9,[rip+0xfffffffffffff768]        # 0x140001f30
   1400027c8:	mov    QWORD PTR [rsp+0x20],0x0
   1400027d1:	xor    r8d,r8d
   1400027d4:	mov    edx,0x82
   1400027d9:	mov    rcx,r15
   1400027dc:	call   QWORD PTR [rip+0x3aae]        # 0x140006290
   1400027e2:	mov    DWORD PTR [rsp+0x68],0x0
   1400027ea:	nop    WORD PTR [rax+rax*1+0x0]
   1400027f0:	mov    eax,DWORD PTR [rsp+0x68]
   1400027f4:	inc    eax
   1400027f6:	mov    DWORD PTR [rsp+0x68],eax
   1400027fa:	sub    rsi,0x1
   1400027fe:	jne    0x1400027f0
   140002800:	xor    eax,eax
   140002802:	jmp    0x14000291c
   140002807:	mov    edx,0x6d
   14000280c:	mov    rcx,r15
   14000280f:	call   QWORD PTR [rip+0x39bb]        # 0x1400061d0
   140002815:	mov    rsi,rax
   140002818:	call   QWORD PTR [rip+0x3a3a]        # 0x140006258
   14000281e:	mov    rcx,rax
   140002821:	call   QWORD PTR [rip+0x39c1]        # 0x1400061e8
   140002827:	xor    r9d,r9d
   14000282a:	lea    rcx,[rsp+0x38]
   14000282f:	xor    r8d,r8d
   140002832:	xor    edx,edx
   140002834:	call   QWORD PTR [rip+0x394e]        # 0x140006188
   14000283a:	test   eax,eax
   14000283c:	je     0x140002909
   140002842:	mov    ecx,0x4
   140002847:	call   QWORD PTR [rip+0x380b]        # 0x140006058
   14000284d:	lea    r8,[rbp-0x80]
   140002851:	mov    edx,0x10
   140002856:	mov    rcx,rax
   140002859:	call   QWORD PTR [rip+0x3829]        # 0x140006088
   14000285f:	mov    rcx,QWORD PTR [rsp+0x38]
   140002864:	lea    r8,[rsp+0x38]
   140002869:	mov    rdx,rsi
   14000286c:	call   QWORD PTR [rip+0x39ae]        # 0x140006220
   140002872:	test   eax,eax
   140002874:	jne    0x1400028ee
   140002876:	mov    ecx,0x4
   14000287b:	call   QWORD PTR [rip+0x37d7]        # 0x140006058
   140002881:	lea    r8,[rbp-0x70]
   140002885:	mov    edx,0x10
   14000288a:	mov    rcx,rax
   14000288d:	call   QWORD PTR [rip+0x37f5]        # 0x140006088
   140002893:	lea    rcx,[rsp+0x38]
   140002898:	call   QWORD PTR [rip+0x38e2]        # 0x140006180
   14000289e:	xor    ecx,ecx
   1400028a0:	call   QWORD PTR [rip+0x38fa]        # 0x1400061a0
   1400028a6:	mov    rcx,rax
   1400028a9:	mov    rdi,rax
   1400028ac:	call   QWORD PTR [rip+0x377e]        # 0x140006030
   1400028b2:	mov    edx,0x1
   1400028b7:	mov    rcx,rdi
   1400028ba:	mov    r8d,edx
   1400028bd:	mov    rbx,rax
   1400028c0:	call   QWORD PTR [rip+0x37b2]        # 0x140006078
   1400028c6:	mov    rcx,rax
   1400028c9:	call   QWORD PTR [rip+0x3781]        # 0x140006050
   1400028cf:	mov    rcx,rbx
   1400028d2:	call   QWORD PTR [rip+0x3788]        # 0x140006060
   1400028d8:	mov    rdx,rdi
   1400028db:	xor    ecx,ecx
   1400028dd:	call   QWORD PTR [rip+0x398d]        # 0x140006270
   1400028e3:	lea    rcx,[rsp+0x38]
   1400028e8:	call   QWORD PTR [rip+0x3902]        # 0x1400061f0
   1400028ee:	xor    r9d,r9d
   1400028f1:	lea    rcx,[rsp+0x38]
   1400028f6:	xor    r8d,r8d
   1400028f9:	xor    edx,edx
   1400028fb:	call   QWORD PTR [rip+0x3887]        # 0x140006188
   140002901:	test   eax,eax
   140002903:	jne    0x140002842
   140002909:	call   QWORD PTR [rip+0x3949]        # 0x140006258
   14000290f:	mov    rcx,rax
   140002912:	call   QWORD PTR [rip+0x38d0]        # 0x1400061e8
   140002918:	mov    eax,DWORD PTR [rsp+0x48]
   14000291c:	mov    rcx,QWORD PTR [rbp+0x440]
   140002923:	xor    rcx,rsp
   140002926:	call   0x140004510
   14000292b:	mov    rbx,QWORD PTR [rsp+0x598]
   140002933:	add    rsp,0x550
   14000293a:	pop    r15
   14000293c:	pop    r14
   14000293e:	pop    r13
   140002940:	pop    r12
   140002942:	pop    rdi
   140002943:	pop    rsi
   140002944:	pop    rbp
   140002945:	ret
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
   140002950:	mov    QWORD PTR [rsp+0x10],rbx
   140002955:	mov    QWORD PTR [rsp+0x18],rbp
   14000295a:	mov    QWORD PTR [rsp+0x20],rsi
   14000295f:	push   rdi
   140002960:	sub    rsp,0xd0
   140002967:	mov    rax,QWORD PTR [rip+0x5692]        # 0x140008000
   14000296e:	xor    rax,rsp
   140002971:	mov    QWORD PTR [rsp+0xc0],rax
   140002979:	mov    rsi,rcx
   14000297c:	xor    ecx,ecx
   14000297e:	call   QWORD PTR [rip+0x36d4]        # 0x140006058
   140002984:	lea    r8,[rsp+0x90]
   14000298c:	mov    edx,0x10
   140002991:	mov    rcx,rax
   140002994:	call   QWORD PTR [rip+0x36ee]        # 0x140006088
   14000299a:	mov    ecx,DWORD PTR [rsp+0x90]
   1400029a1:	xor    ebp,ebp
   1400029a3:	test   eax,eax
   1400029a5:	cmovne ecx,ebp
   1400029a8:	mov    DWORD PTR [rsp+0x90],ecx
   1400029af:	call   QWORD PTR [rip+0x38a3]        # 0x140006258
   1400029b5:	mov    rcx,rax
   1400029b8:	call   QWORD PTR [rip+0x382a]        # 0x1400061e8
   1400029be:	lea    rax,[rsp+0x38]
   1400029c3:	mov    DWORD PTR [rsp+0x40],0x50
   1400029cb:	mov    r9d,0x20019
   1400029d1:	mov    QWORD PTR [rsp+0x20],rax
   1400029d6:	xor    r8d,r8d
   1400029d9:	lea    rdx,[rip+0x3b38]        # 0x140006518
   1400029e0:	mov    rcx,0xffffffff80000001
   1400029e7:	call   QWORD PTR [rip+0x3623]        # 0x140006010
   1400029ed:	test   eax,eax
   1400029ef:	jne    0x1400029fc
   1400029f1:	mov    rcx,QWORD PTR [rsp+0x38]
   1400029f6:	call   QWORD PTR [rip+0x3624]        # 0x140006020
   1400029fc:	lea    rax,[rip+0xafd]        # 0x140003500
   140002a03:	mov    DWORD PTR [rsp+0x44],0x3
   140002a0b:	xor    ecx,ecx
   140002a0d:	mov    QWORD PTR [rsp+0x48],rax
   140002a12:	call   QWORD PTR [rip+0x37a8]        # 0x1400061c0
   140002a18:	lea    rcx,[rsp+0xa0]
   140002a20:	mov    DWORD PTR [rsp+0x50],ebp
   140002a24:	mov    DWORD PTR [rsp+0x30],eax
   140002a28:	call   QWORD PTR [rip+0x36fa]        # 0x140006128
   140002a2e:	xor    ecx,ecx
   140002a30:	mov    DWORD PTR [rsp+0x54],ebp
   140002a34:	mov    QWORD PTR [rsp+0x58],rsi
   140002a39:	call   QWORD PTR [rip+0x3761]        # 0x1400061a0
   140002a3f:	mov    rcx,rax
   140002a42:	mov    rdi,rax
   140002a45:	call   QWORD PTR [rip+0x35e5]        # 0x140006030
   140002a4b:	mov    edx,0x1
   140002a50:	mov    rcx,rdi
   140002a53:	mov    r8d,edx
   140002a56:	mov    rbx,rax
   140002a59:	call   QWORD PTR [rip+0x3619]        # 0x140006078
   140002a5f:	mov    rcx,rax
   140002a62:	call   QWORD PTR [rip+0x35e8]        # 0x140006050
   140002a68:	mov    rcx,rbx
   140002a6b:	call   QWORD PTR [rip+0x35ef]        # 0x140006060
   140002a71:	mov    rdx,rdi
   140002a74:	xor    ecx,ecx
   140002a76:	call   QWORD PTR [rip+0x37f4]        # 0x140006270
   140002a7c:	mov    edx,0x6b
   140002a81:	mov    rcx,rsi
   140002a84:	call   QWORD PTR [rip+0x379e]        # 0x140006228
   140002a8a:	lea    rcx,[rsp+0xa8]
   140002a92:	mov    QWORD PTR [rsp+0x68],rbp
   140002a97:	mov    QWORD PTR [rsp+0x60],rax
   140002a9c:	call   QWORD PTR [rip+0x3686]        # 0x140006128
   140002aa2:	mov    eax,0x5
   140002aa7:	mov    DWORD PTR [rsp+0x30],ebp
   140002aab:	nop    DWORD PTR [rax+rax*1+0x0]
   140002ab0:	mov    ecx,DWORD PTR [rsp+0x30]
   140002ab4:	inc    ecx
   140002ab6:	mov    DWORD PTR [rsp+0x30],ecx
   140002aba:	sub    rax,0x1
   140002abe:	jne    0x140002ab0
   140002ac0:	mov    ecx,0x4
   140002ac5:	call   QWORD PTR [rip+0x358d]        # 0x140006058
   140002acb:	xor    ecx,ecx
   140002acd:	mov    QWORD PTR [rsp+0x78],rbp
   140002ad2:	mov    QWORD PTR [rsp+0x70],rax
   140002ad7:	call   QWORD PTR [rip+0x36c3]        # 0x1400061a0
   140002add:	mov    rcx,rax
   140002ae0:	mov    rdi,rax
   140002ae3:	call   QWORD PTR [rip+0x3547]        # 0x140006030
   140002ae9:	mov    edx,0x1
   140002aee:	mov    rcx,rdi
   140002af1:	mov    r8d,edx
   140002af4:	mov    rbx,rax
   140002af7:	call   QWORD PTR [rip+0x357b]        # 0x140006078
   140002afd:	mov    rcx,rax
   140002b00:	call   QWORD PTR [rip+0x354a]        # 0x140006050
   140002b06:	mov    rcx,rbx
   140002b09:	call   QWORD PTR [rip+0x3551]        # 0x140006060
   140002b0f:	mov    rdx,rdi
   140002b12:	xor    ecx,ecx
   140002b14:	call   QWORD PTR [rip+0x3756]        # 0x140006270
   140002b1a:	lea    rax,[rip+0x5d7f]        # 0x1400088a0
   140002b21:	mov    ecx,0x4
   140002b26:	mov    QWORD PTR [rsp+0x80],rax
   140002b2e:	call   QWORD PTR [rip+0x3524]        # 0x140006058
   140002b34:	lea    r8,[rsp+0xb0]
   140002b3c:	mov    edx,0x10
   140002b41:	mov    rcx,rax
   140002b44:	call   QWORD PTR [rip+0x353e]        # 0x140006088
   140002b4a:	mov    rcx,QWORD PTR [rsp+0x58]
   140002b4f:	mov    edx,0x6c
   140002b54:	call   QWORD PTR [rip+0x36ce]        # 0x140006228
   140002b5a:	xor    ecx,ecx
   140002b5c:	mov    QWORD PTR [rsp+0x88],rax
   140002b64:	call   QWORD PTR [rip+0x3656]        # 0x1400061c0
   140002b6a:	xor    ecx,ecx
   140002b6c:	mov    DWORD PTR [rsp+0x30],eax
   140002b70:	call   QWORD PTR [rip+0x362a]        # 0x1400061a0
   140002b76:	mov    rcx,rax
   140002b79:	mov    rdi,rax
   140002b7c:	call   QWORD PTR [rip+0x34ae]        # 0x140006030
   140002b82:	mov    edx,0x1
   140002b87:	mov    rcx,rdi
   140002b8a:	mov    r8d,edx
   140002b8d:	mov    rbx,rax
   140002b90:	call   QWORD PTR [rip+0x34e2]        # 0x140006078
   140002b96:	mov    rcx,rax
   140002b99:	call   QWORD PTR [rip+0x34b1]        # 0x140006050
   140002b9f:	mov    rcx,rbx
   140002ba2:	call   QWORD PTR [rip+0x34b8]        # 0x140006060
   140002ba8:	mov    rdx,rdi
   140002bab:	xor    ecx,ecx
   140002bad:	call   QWORD PTR [rip+0x36bd]        # 0x140006270
   140002bb3:	lea    rcx,[rsp+0x40]
   140002bb8:	call   QWORD PTR [rip+0x360a]        # 0x1400061c8
   140002bbe:	mov    rcx,QWORD PTR [rsp+0xc0]
   140002bc6:	xor    rcx,rsp
   140002bc9:	call   0x140004510
   140002bce:	lea    r11,[rsp+0xd0]
   140002bd6:	mov    rbx,QWORD PTR [r11+0x18]
   140002bda:	mov    rbp,QWORD PTR [r11+0x20]
   140002bde:	mov    rsi,QWORD PTR [r11+0x28]
   140002be2:	mov    rsp,r11
   140002be5:	pop    rdi
   140002be6:	ret
   140002be7:	int3
   140002be8:	int3
   140002be9:	int3
   140002bea:	int3
   140002beb:	int3
   140002bec:	int3
   140002bed:	int3
   140002bee:	int3
   140002bef:	int3
   140002bf0:	mov    QWORD PTR [rsp+0x18],rbx
   140002bf5:	push   rbp
   140002bf6:	push   rsi
   140002bf7:	push   rdi
   140002bf8:	push   r12
   140002bfa:	push   r13
   140002bfc:	push   r14
   140002bfe:	push   r15
   140002c00:	lea    rbp,[rsp-0x8f0]
   140002c08:	sub    rsp,0x9f0
   140002c0f:	mov    rax,QWORD PTR [rip+0x53ea]        # 0x140008000
   140002c16:	xor    rax,rsp
   140002c19:	mov    QWORD PTR [rbp+0x8e0],rax
   140002c20:	mov    r13d,edx
   140002c23:	mov    rsi,rcx
   140002c26:	mov    edx,0x104
   140002c2b:	lea    rcx,[rbp+0x4c0]
   140002c32:	mov    r15,r9
   140002c35:	mov    r12d,r8d
   140002c38:	call   QWORD PTR [rip+0x34fa]        # 0x140006138
   140002c3e:	xor    r14d,r14d
   140002c41:	test   eax,eax
   140002c43:	je     0x140002caf
   140002c45:	lea    r8,[rip+0x3aa4]        # 0x1400066f0
   140002c4c:	mov    edx,0x104
   140002c51:	lea    rcx,[rbp+0x4c0]
   140002c58:	call   QWORD PTR [rip+0x377a]        # 0x1400063d8
   140002c5e:	lea    rdx,[rbp-0x20]
   140002c62:	lea    rcx,[rbp+0x4c0]
   140002c69:	call   QWORD PTR [rip+0x34f1]        # 0x140006160
   140002c6f:	mov    rdi,rax
   140002c72:	cmp    rax,0xffffffffffffffff
   140002c76:	je     0x140002caf
   140002c78:	mov    QWORD PTR [rbp-0x68],r14
   140002c7c:	mov    ebx,r14d
   140002c7f:	nop
   140002c80:	mov    ecx,DWORD PTR [rbp+0x0]
   140002c83:	inc    ebx
   140002c85:	mov    rdx,QWORD PTR [rbp-0x68]
   140002c89:	add    rdx,rcx
   140002c8c:	mov    rcx,rdi
   140002c8f:	mov    QWORD PTR [rbp-0x68],rdx
   140002c93:	lea    rdx,[rbp-0x20]
   140002c97:	call   QWORD PTR [rip+0x34ab]        # 0x140006148
   140002c9d:	test   eax,eax
   140002c9f:	je     0x140002ca6
   140002ca1:	cmp    ebx,0xa
   140002ca4:	jl     0x140002c80
   140002ca6:	mov    rcx,rdi
   140002ca9:	call   QWORD PTR [rip+0x3491]        # 0x140006140
   140002caf:	lea    rcx,[rbp-0x60]
   140002cb3:	call   QWORD PTR [rip+0x346f]        # 0x140006128
   140002cb9:	lea    rax,[rbp-0x80]
   140002cbd:	mov    QWORD PTR [rip+0x5bcc],rsi        # 0x140008890
   140002cc4:	mov    r9d,0x20019
   140002cca:	mov    QWORD PTR [rsp+0x20],rax
   140002ccf:	xor    r8d,r8d
   140002cd2:	lea    rdx,[rip+0x383f]        # 0x140006518
   140002cd9:	mov    rcx,0xffffffff80000001
   140002ce0:	call   QWORD PTR [rip+0x332a]        # 0x140006010
   140002ce6:	test   eax,eax
   140002ce8:	jne    0x140002cf4
   140002cea:	mov    rcx,QWORD PTR [rbp-0x80]
   140002cee:	call   QWORD PTR [rip+0x332c]        # 0x140006020
   140002cf4:	xor    ecx,ecx
   140002cf6:	mov    QWORD PTR [rsp+0x70],r14
   140002cfb:	call   QWORD PTR [rip+0x34bf]        # 0x1400061c0
   140002d01:	mov    ecx,0x1
   140002d06:	mov    DWORD PTR [rsp+0x78],eax
   140002d0a:	call   QWORD PTR [rip+0x34b0]        # 0x1400061c0
   140002d10:	mov    DWORD PTR [rsp+0x7c],eax
   140002d14:	call   QWORD PTR [rip+0x3406]        # 0x140006120
   140002d1a:	mov    r8d,eax
   140002d1d:	mov    eax,0x51eb851f
   140002d22:	mul    r8d
   140002d25:	shr    edx,0x5
   140002d28:	imul   ecx,edx,0x64
   140002d2b:	sub    r8d,ecx
   140002d2e:	mov    DWORD PTR [rbp-0x78],r8d
   140002d32:	mov    eax,DWORD PTR [rbp-0x78]
   140002d35:	add    eax,0x5
   140002d38:	mov    DWORD PTR [rbp-0x78],eax
   140002d3b:	mov    ecx,DWORD PTR [rbp-0x78]
   140002d3e:	call   QWORD PTR [rip+0x340c]        # 0x140006150
   140002d44:	test   r12d,r12d
   140002d47:	je     0x140002e2d
   140002d4d:	lea    rdx,[rbp-0x68]
   140002d51:	mov    DWORD PTR [rbp-0x68],0x20
   140002d58:	lea    rcx,[rbp+0x480]
   140002d5f:	call   QWORD PTR [rip+0x33cb]        # 0x140006130
   140002d65:	test   eax,eax
   140002d67:	je     0x140002d73
   140002d69:	movzx  eax,WORD PTR [rbp+0x480]
   140002d70:	mov    DWORD PTR [rbp-0x78],eax
   140002d73:	lea    rdx,[rsp+0x70]
   140002d78:	mov    rcx,r15
   140002d7b:	call   QWORD PTR [rip+0x34b7]        # 0x140006238
   140002d81:	mov    r8d,DWORD PTR [rsp+0x74]
   140002d86:	mov    r9d,0x50000000
   140002d8c:	mov    ecx,DWORD PTR [rsp+0x70]
   140002d90:	mov    edx,DWORD PTR [rsp+0x7c]
   140002d94:	mov    eax,DWORD PTR [rsp+0x78]
   140002d98:	sub    edx,r8d
   140002d9b:	mov    QWORD PTR [rsp+0x58],r14
   140002da0:	sub    eax,ecx
   140002da2:	mov    QWORD PTR [rsp+0x50],rsi
   140002da7:	mov    QWORD PTR [rsp+0x48],r14
   140002dac:	mov    QWORD PTR [rsp+0x40],r15
   140002db1:	mov    DWORD PTR [rsp+0x38],edx
   140002db5:	lea    rdx,[rip+0x5ae4]        # 0x1400088a0
   140002dbc:	mov    DWORD PTR [rsp+0x30],eax
   140002dc0:	mov    DWORD PTR [rsp+0x28],r8d
   140002dc5:	xor    r8d,r8d
   140002dc8:	mov    DWORD PTR [rsp+0x20],ecx
   140002dcc:	xor    ecx,ecx
   140002dce:	call   QWORD PTR [rip+0x33dc]        # 0x1400061b0
   140002dd4:	mov    edx,0x104
   140002dd9:	lea    rcx,[rbp-0x20]
   140002ddd:	mov    r15,rax
   140002de0:	call   QWORD PTR [rip+0x3352]        # 0x140006138
   140002de6:	test   eax,eax
   140002de8:	je     0x140002edc
   140002dee:	lea    r8,[rip+0x3713]        # 0x140006508
   140002df5:	mov    edx,0x104
   140002dfa:	lea    rcx,[rbp-0x20]
   140002dfe:	call   QWORD PTR [rip+0x35d4]        # 0x1400063d8
   140002e04:	lea    rdx,[rbp+0x230]
   140002e0b:	lea    rcx,[rbp-0x20]
   140002e0f:	call   QWORD PTR [rip+0x334b]        # 0x140006160
   140002e15:	cmp    rax,0xffffffffffffffff
   140002e19:	je     0x140002edc
   140002e1f:	mov    rcx,rax
   140002e22:	call   QWORD PTR [rip+0x3318]        # 0x140006140
   140002e28:	jmp    0x140002edc
   140002e2d:	xor    ecx,ecx
   140002e2f:	call   QWORD PTR [rip+0x336b]        # 0x1400061a0
   140002e35:	mov    rcx,rax
   140002e38:	mov    rdi,rax
   140002e3b:	call   QWORD PTR [rip+0x31ef]        # 0x140006030
   140002e41:	mov    edx,0x1
   140002e46:	mov    rcx,rdi
   140002e49:	mov    r8d,edx
   140002e4c:	mov    rbx,rax
   140002e4f:	call   QWORD PTR [rip+0x3223]        # 0x140006078
   140002e55:	mov    rcx,rax
   140002e58:	call   QWORD PTR [rip+0x31f2]        # 0x140006050
   140002e5e:	mov    rcx,rbx
   140002e61:	call   QWORD PTR [rip+0x31f9]        # 0x140006060
   140002e67:	mov    rdx,rdi
   140002e6a:	xor    ecx,ecx
   140002e6c:	call   QWORD PTR [rip+0x33fe]        # 0x140006270
   140002e72:	xor    ecx,ecx
   140002e74:	call   QWORD PTR [rip+0x33b6]        # 0x140006230
   140002e7a:	xor    ecx,ecx
   140002e7c:	call   QWORD PTR [rip+0x33fe]        # 0x140006280
   140002e82:	xor    ecx,ecx
   140002e84:	call   QWORD PTR [rip+0x3336]        # 0x1400061c0
   140002e8a:	mov    QWORD PTR [rsp+0x58],r14
   140002e8f:	lea    rdx,[rip+0x5a0a]        # 0x1400088a0
   140002e96:	mov    QWORD PTR [rsp+0x50],rsi
   140002e9b:	mov    r9d,0x90000000
   140002ea1:	mov    DWORD PTR [rbp-0x68],eax
   140002ea4:	xor    r8d,r8d
   140002ea7:	mov    eax,DWORD PTR [rsp+0x7c]
   140002eab:	xor    ecx,ecx
   140002ead:	mov    QWORD PTR [rsp+0x48],r14
   140002eb2:	mov    QWORD PTR [rsp+0x40],r14
   140002eb7:	mov    DWORD PTR [rsp+0x38],eax
   140002ebb:	mov    eax,DWORD PTR [rsp+0x78]
   140002ebf:	mov    DWORD PTR [rsp+0x30],eax
   140002ec3:	mov    eax,DWORD PTR [rsp+0x74]
   140002ec7:	mov    DWORD PTR [rsp+0x28],eax
   140002ecb:	mov    eax,DWORD PTR [rsp+0x70]
   140002ecf:	mov    DWORD PTR [rsp+0x20],eax
   140002ed3:	call   QWORD PTR [rip+0x32d7]        # 0x1400061b0
   140002ed9:	mov    r15,rax
   140002edc:	test   r15,r15
   140002edf:	jne    0x140002ef7
   140002ee1:	call   QWORD PTR [rip+0x3371]        # 0x140006258
   140002ee7:	mov    rcx,rax
   140002eea:	call   QWORD PTR [rip+0x32f8]        # 0x1400061e8
   140002ef0:	xor    eax,eax
   140002ef2:	jmp    0x1400034d1
   140002ef7:	mov    edx,0x82
   140002efc:	mov    rcx,rsi
   140002eff:	call   QWORD PTR [rip+0x330b]        # 0x140006210
   140002f05:	mov    edx,0x104
   140002f0a:	lea    rcx,[rbp+0x6d0]
   140002f11:	mov    QWORD PTR [rip+0x5a80],rax        # 0x140008998
   140002f18:	call   QWORD PTR [rip+0x321a]        # 0x140006138
   140002f1e:	test   eax,eax
   140002f20:	je     0x140002f5e
   140002f22:	lea    r8,[rip+0x35df]        # 0x140006508
   140002f29:	mov    edx,0x104
   140002f2e:	lea    rcx,[rbp+0x6d0]
   140002f35:	call   QWORD PTR [rip+0x349d]        # 0x1400063d8
   140002f3b:	lea    rdx,[rbp+0x230]
   140002f42:	lea    rcx,[rbp+0x6d0]
   140002f49:	call   QWORD PTR [rip+0x3211]        # 0x140006160
   140002f4f:	cmp    rax,0xffffffffffffffff
   140002f53:	je     0x140002f5e
   140002f55:	mov    rcx,rax
   140002f58:	call   QWORD PTR [rip+0x31e2]        # 0x140006140
   140002f5e:	cmp    QWORD PTR [rip+0x5a33],r14        # 0x140008998
   140002f65:	je     0x1400030a8
   140002f6b:	xor    ecx,ecx
   140002f6d:	call   QWORD PTR [rip+0x322d]        # 0x1400061a0
   140002f73:	mov    rsi,rax
   140002f76:	test   rax,rax
   140002f79:	je     0x14000301c
   140002f7f:	mov    rcx,rax
   140002f82:	call   QWORD PTR [rip+0x30a8]        # 0x140006030
   140002f88:	mov    edx,0x10
   140002f8d:	mov    rcx,rsi
   140002f90:	mov    r8d,edx
   140002f93:	mov    rdi,rax
   140002f96:	call   QWORD PTR [rip+0x30dc]        # 0x140006078
   140002f9c:	mov    r12,rax
   140002f9f:	test   rdi,rdi
   140002fa2:	je     0x140003011
   140002fa4:	test   rax,rax
   140002fa7:	je     0x140003011
   140002fa9:	mov    rdx,rax
   140002fac:	mov    rcx,rdi
   140002faf:	call   QWORD PTR [rip+0x3083]        # 0x140006038
   140002fb5:	mov    r9d,0x10
   140002fbb:	mov    DWORD PTR [rsp+0x20],0x10
   140002fc3:	xor    r8d,r8d
   140002fc6:	xor    edx,edx
   140002fc8:	mov    rcx,rdi
   140002fcb:	mov    rbx,rax
   140002fce:	call   QWORD PTR [rip+0x30c4]        # 0x140006098
   140002fd4:	mov    edx,0x2
   140002fd9:	mov    DWORD PTR [rsp+0x20],0xe
   140002fe1:	mov    r8d,edx
   140002fe4:	mov    r9d,0xe
   140002fea:	mov    rcx,rdi
   140002fed:	call   QWORD PTR [rip+0x309d]        # 0x140006090
   140002ff3:	mov    rdx,rbx
   140002ff6:	mov    rcx,rdi
   140002ff9:	call   QWORD PTR [rip+0x3039]        # 0x140006038
   140002fff:	mov    rcx,r12
   140003002:	call   QWORD PTR [rip+0x3048]        # 0x140006050
   140003008:	mov    rcx,rdi
   14000300b:	call   QWORD PTR [rip+0x304f]        # 0x140006060
   140003011:	mov    rdx,rsi
   140003014:	xor    ecx,ecx
   140003016:	call   QWORD PTR [rip+0x3254]        # 0x140006270
   14000301c:	xor    ecx,ecx
   14000301e:	call   QWORD PTR [rip+0x317c]        # 0x1400061a0
   140003024:	mov    rcx,rax
   140003027:	mov    rdi,rax
   14000302a:	call   QWORD PTR [rip+0x3000]        # 0x140006030
   140003030:	mov    edx,0x1
   140003035:	mov    rcx,rdi
   140003038:	mov    r8d,edx
   14000303b:	mov    rbx,rax
   14000303e:	call   QWORD PTR [rip+0x3034]        # 0x140006078
   140003044:	mov    rcx,rax
   140003047:	call   QWORD PTR [rip+0x3003]        # 0x140006050
   14000304d:	mov    rcx,rbx
   140003050:	call   QWORD PTR [rip+0x300a]        # 0x140006060
   140003056:	mov    rdx,rdi
   140003059:	xor    ecx,ecx
   14000305b:	call   QWORD PTR [rip+0x320f]        # 0x140006270
   140003061:	mov    rcx,QWORD PTR [rip+0x5930]        # 0x140008998
   140003068:	lea    r8,[rbp-0x50]
   14000306c:	mov    edx,0x20
   140003071:	call   QWORD PTR [rip+0x3011]        # 0x140006088
   140003077:	mov    eax,DWORD PTR [rbp-0x4c]
   14000307a:	mov    ecx,0x4
   14000307f:	mov    DWORD PTR [rip+0x5903],eax        # 0x140008988
   140003085:	call   QWORD PTR [rip+0x2fcd]        # 0x140006058
   14000308b:	lea    r8,[rbp-0x78]
   14000308f:	mov    edx,0x10
   140003094:	mov    rcx,rax
   140003097:	call   QWORD PTR [rip+0x2feb]        # 0x140006088
   14000309d:	mov    eax,DWORD PTR [rbp-0x48]
   1400030a0:	mov    DWORD PTR [rip+0x58fa],eax        # 0x1400089a0
   1400030a6:	jmp    0x1400030f0
   1400030a8:	lea    rax,[rbp-0x78]
   1400030ac:	mov    DWORD PTR [rip+0x58d2],0x20        # 0x140008988
   1400030b6:	mov    r9d,0x20019
   1400030bc:	mov    QWORD PTR [rsp+0x20],rax
   1400030c1:	xor    r8d,r8d
   1400030c4:	mov    DWORD PTR [rip+0x58d2],0x20        # 0x1400089a0
   1400030ce:	lea    rdx,[rip+0x3443]        # 0x140006518
   1400030d5:	mov    rcx,0xffffffff80000001
   1400030dc:	call   QWORD PTR [rip+0x2f2e]        # 0x140006010
   1400030e2:	test   eax,eax
   1400030e4:	jne    0x1400030f0
   1400030e6:	mov    rcx,QWORD PTR [rbp-0x78]
   1400030ea:	call   QWORD PTR [rip+0x2f30]        # 0x140006020
   1400030f0:	xor    ecx,ecx
   1400030f2:	call   QWORD PTR [rip+0x32f8]        # 0x1400063f0
   1400030f8:	mov    ecx,eax
   1400030fa:	call   QWORD PTR [rip+0x3308]        # 0x140006408
   140003100:	xor    ecx,ecx
   140003102:	call   QWORD PTR [rip+0x3098]        # 0x1400061a0
   140003108:	mov    rcx,rax
   14000310b:	mov    rdi,rax
   14000310e:	call   QWORD PTR [rip+0x2f1c]        # 0x140006030
   140003114:	mov    edx,0x1
   140003119:	mov    rcx,rdi
   14000311c:	mov    r8d,edx
   14000311f:	mov    rbx,rax
   140003122:	call   QWORD PTR [rip+0x2f50]        # 0x140006078
   140003128:	mov    rcx,rax
   14000312b:	call   QWORD PTR [rip+0x2f1f]        # 0x140006050
   140003131:	mov    rcx,rbx
   140003134:	call   QWORD PTR [rip+0x2f26]        # 0x140006060
   14000313a:	mov    rdx,rdi
   14000313d:	xor    ecx,ecx
   14000313f:	call   QWORD PTR [rip+0x312b]        # 0x140006270
   140003145:	call   QWORD PTR [rip+0x32b5]        # 0x140006400
   14000314b:	mov    r8d,eax
   14000314e:	mov    eax,0xa0a0a0a1
   140003153:	imul   r8d
   140003156:	add    edx,r8d
   140003159:	sar    edx,0x5
   14000315c:	mov    ecx,edx
   14000315e:	shr    ecx,0x1f
   140003161:	add    edx,ecx
   140003163:	imul   ecx,edx,0x33
   140003166:	sub    r8d,ecx
   140003169:	lea    rcx,[rip+0x4f10]        # 0x140008080
   140003170:	add    r8d,0xa
   140003174:	mov    DWORD PTR [rip+0x5829],r8d        # 0x1400089a4
   14000317b:	call   0x140001ae0
   140003180:	call   QWORD PTR [rip+0x2f9a]        # 0x140006120
   140003186:	mov    r8d,eax
   140003189:	mov    eax,0x51eb851f
   14000318e:	mul    r8d
   140003191:	shr    edx,0x5
   140003194:	imul   ecx,edx,0x64
   140003197:	sub    r8d,ecx
   14000319a:	mov    DWORD PTR [rbp-0x78],r8d
   14000319e:	mov    eax,DWORD PTR [rbp-0x78]
   1400031a1:	add    eax,0x5
   1400031a4:	mov    DWORD PTR [rbp-0x78],eax
   1400031a7:	mov    ecx,DWORD PTR [rbp-0x78]
   1400031aa:	call   QWORD PTR [rip+0x2fa0]        # 0x140006150
   1400031b0:	mov    ecx,DWORD PTR [rsp+0x7c]
   1400031b4:	mov    edx,0x1
   1400031b9:	mov    r8d,0xa
   1400031bf:	call   QWORD PTR [rip+0x2f53]        # 0x140006118
   1400031c5:	lea    rcx,[rip+0x3534]        # 0x140006700
   1400031cc:	xor    r9d,r9d
   1400031cf:	mov    QWORD PTR [rsp+0x68],rcx
   1400031d4:	neg    eax
   1400031d6:	mov    DWORD PTR [rsp+0x60],0x20
   1400031de:	xor    r8d,r8d
   1400031e1:	mov    DWORD PTR [rsp+0x58],r14d
   1400031e6:	xor    edx,edx
   1400031e8:	mov    DWORD PTR [rsp+0x50],r14d
   1400031ed:	mov    ecx,eax
   1400031ef:	mov    DWORD PTR [rsp+0x48],r14d
   1400031f4:	mov    DWORD PTR [rsp+0x40],0x1
   1400031fc:	mov    DWORD PTR [rsp+0x38],r14d
   140003201:	mov    DWORD PTR [rsp+0x30],r14d
   140003206:	mov    DWORD PTR [rsp+0x28],r14d
   14000320b:	mov    DWORD PTR [rsp+0x20],0x2bc
   140003213:	call   QWORD PTR [rip+0x2e27]        # 0x140006040
   140003219:	lea    rcx,[rbp-0x58]
   14000321d:	mov    QWORD PTR [rip+0x5784],rax        # 0x1400089a8
   140003224:	call   QWORD PTR [rip+0x2efe]        # 0x140006128
   14000322a:	mov    rcx,r15
   14000322d:	call   QWORD PTR [rip+0x2f6d]        # 0x1400061a0
   140003233:	mov    ebx,0x5
   140003238:	mov    DWORD PTR [rbp-0x78],r14d
   14000323c:	mov    rdi,rax
   14000323f:	mov    edx,ebx
   140003241:	mov    ecx,DWORD PTR [rbp-0x78]
   140003244:	inc    ecx
   140003246:	mov    DWORD PTR [rbp-0x78],ecx
   140003249:	sub    rdx,0x1
   14000324d:	jne    0x140003241
   14000324f:	mov    rcx,rdi
   140003252:	call   QWORD PTR [rip+0x2dd8]        # 0x140006030
   140003258:	mov    QWORD PTR [rip+0x5719],rax        # 0x140008978
   14000325f:	mov    DWORD PTR [rbp-0x78],r14d
   140003263:	nop    DWORD PTR [rax+0x0]
   140003267:	nop    WORD PTR [rax+rax*1+0x0]
   140003270:	mov    eax,DWORD PTR [rbp-0x78]
   140003273:	inc    eax
   140003275:	mov    DWORD PTR [rbp-0x78],eax
   140003278:	sub    rbx,0x1
   14000327c:	jne    0x140003270
   14000327e:	mov    r8d,DWORD PTR [rsp+0x7c]
   140003283:	mov    rcx,rdi
   140003286:	mov    edx,DWORD PTR [rsp+0x78]
   14000328a:	call   QWORD PTR [rip+0x2de8]        # 0x140006078
   140003290:	xor    ecx,ecx
   140003292:	mov    QWORD PTR [rip+0x56cf],rax        # 0x140008968
   140003299:	call   QWORD PTR [rip+0x2f21]        # 0x1400061c0
   14000329f:	mov    rdx,QWORD PTR [rip+0x56c2]        # 0x140008968
   1400032a6:	mov    rcx,QWORD PTR [rip+0x56cb]        # 0x140008978
   1400032ad:	mov    DWORD PTR [rbp-0x78],eax
   1400032b0:	call   QWORD PTR [rip+0x2d82]        # 0x140006038
   1400032b6:	mov    QWORD PTR [rip+0x56d3],rax        # 0x140008990
   1400032bd:	call   QWORD PTR [rip+0x2e5d]        # 0x140006120
   1400032c3:	mov    r8d,eax
   1400032c6:	mov    eax,0x51eb851f
   1400032cb:	mul    r8d
   1400032ce:	shr    edx,0x5
   1400032d1:	imul   ecx,edx,0x64
   1400032d4:	sub    r8d,ecx
   1400032d7:	mov    DWORD PTR [rbp-0x78],r8d
   1400032db:	mov    eax,DWORD PTR [rbp-0x78]
   1400032de:	add    eax,0x5
   1400032e1:	mov    DWORD PTR [rbp-0x78],eax
   1400032e4:	mov    ecx,DWORD PTR [rbp-0x78]
   1400032e7:	call   QWORD PTR [rip+0x2e63]        # 0x140006150
   1400032ed:	mov    rdx,rdi
   1400032f0:	mov    rcx,r15
   1400032f3:	call   QWORD PTR [rip+0x2f77]        # 0x140006270
   1400032f9:	cmp    DWORD PTR [rip+0x56a4],r14d        # 0x1400089a4
   140003300:	jle    0x14000345b
   140003306:	lea    rbx,[rip+0x577b]        # 0x140008a88
   14000330d:	nop    DWORD PTR [rax]
   140003310:	call   QWORD PTR [rip+0x2f42]        # 0x140006258
   140003316:	mov    rcx,rax
   140003319:	call   QWORD PTR [rip+0x2ec9]        # 0x1400061e8
   14000331f:	mov    ecx,0x4
   140003324:	call   QWORD PTR [rip+0x2d2e]        # 0x140006058
   14000332a:	lea    r8,[rbp-0x30]
   14000332e:	mov    edx,0x10
   140003333:	mov    rcx,rax
   140003336:	call   QWORD PTR [rip+0x2d4c]        # 0x140006088
   14000333c:	mov    edi,DWORD PTR [rsp+0x78]
   140003340:	sub    edi,DWORD PTR [rip+0x5642]        # 0x140008988
   140003346:	call   QWORD PTR [rip+0x30b4]        # 0x140006400
   14000334c:	cdq
   14000334d:	xor    ecx,ecx
   14000334f:	idiv   edi
   140003351:	mov    DWORD PTR [rbx-0x8],edx
   140003354:	call   QWORD PTR [rip+0x2e46]        # 0x1400061a0
   14000335a:	mov    rcx,rax
   14000335d:	mov    rsi,rax
   140003360:	call   QWORD PTR [rip+0x2cca]        # 0x140006030
   140003366:	mov    edx,0x1
   14000336b:	mov    rcx,rsi
   14000336e:	mov    r8d,edx
   140003371:	mov    rdi,rax
   140003374:	call   QWORD PTR [rip+0x2cfe]        # 0x140006078
   14000337a:	mov    rcx,rax
   14000337d:	call   QWORD PTR [rip+0x2ccd]        # 0x140006050
   140003383:	mov    rcx,rdi
   140003386:	call   QWORD PTR [rip+0x2cd4]        # 0x140006060
   14000338c:	mov    rdx,rsi
   14000338f:	xor    ecx,ecx
   140003391:	call   QWORD PTR [rip+0x2ed9]        # 0x140006270
   140003397:	mov    edi,DWORD PTR [rsp+0x7c]
   14000339b:	sub    edi,DWORD PTR [rip+0x55ff]        # 0x1400089a0
   1400033a1:	call   QWORD PTR [rip+0x3059]        # 0x140006400
   1400033a7:	cdq
   1400033a8:	xor    ecx,ecx
   1400033aa:	idiv   edi
   1400033ac:	mov    DWORD PTR [rbx-0x4],edx
   1400033af:	call   QWORD PTR [rip+0x2e0b]        # 0x1400061c0
   1400033b5:	mov    DWORD PTR [rbp-0x78],eax
   1400033b8:	call   QWORD PTR [rip+0x3042]        # 0x140006400
   1400033be:	mov    r8d,eax
   1400033c1:	mov    eax,0x38e38e39
   1400033c6:	imul   r8d
   1400033c9:	sar    edx,1
   1400033cb:	mov    ecx,edx
   1400033cd:	shr    ecx,0x1f
   1400033d0:	add    edx,ecx
   1400033d2:	lea    ecx,[rdx+rdx*8]
   1400033d5:	sub    r8d,ecx
   1400033d8:	sub    r8d,0x4
   1400033dc:	mov    DWORD PTR [rbx],r8d
   1400033df:	call   QWORD PTR [rip+0x301b]        # 0x140006400
   1400033e5:	mov    r8d,eax
   1400033e8:	mov    eax,0x38e38e39
   1400033ed:	imul   r8d
   1400033f0:	sar    edx,1
   1400033f2:	mov    ecx,edx
   1400033f4:	shr    ecx,0x1f
   1400033f7:	add    edx,ecx
   1400033f9:	lea    ecx,[rdx+rdx*8]
   1400033fc:	sub    r8d,ecx
   1400033ff:	xor    ecx,ecx
   140003401:	sub    r8d,0x4
   140003405:	mov    DWORD PTR [rbx+0x4],r8d
   140003409:	call   QWORD PTR [rip+0x2db1]        # 0x1400061c0
   14000340f:	cmp    DWORD PTR [rbx],0x0
   140003412:	mov    DWORD PTR [rbp-0x78],eax
   140003415:	jne    0x14000341d
   140003417:	mov    DWORD PTR [rbx],0x1
   14000341d:	mov    ecx,0x4
   140003422:	call   QWORD PTR [rip+0x2c30]        # 0x140006058
   140003428:	lea    r8,[rbp-0x50]
   14000342c:	mov    edx,0x10
   140003431:	mov    rcx,rax
   140003434:	call   QWORD PTR [rip+0x2c4e]        # 0x140006088
   14000343a:	cmp    DWORD PTR [rbx+0x4],0x0
   14000343e:	jne    0x140003447
   140003440:	mov    DWORD PTR [rbx+0x4],0x1
   140003447:	inc    r14d
   14000344a:	add    rbx,0x10
   14000344e:	cmp    r14d,DWORD PTR [rip+0x554f]        # 0x1400089a4
   140003455:	jl     0x140003310
   14000345b:	mov    edx,r13d
   14000345e:	mov    rcx,r15
   140003461:	call   QWORD PTR [rip+0x2d79]        # 0x1400061e0
   140003467:	mov    rcx,r15
   14000346a:	call   QWORD PTR [rip+0x2e18]        # 0x140006288
   140003470:	xor    ecx,ecx
   140003472:	call   QWORD PTR [rip+0x2d28]        # 0x1400061a0
   140003478:	mov    rcx,rax
   14000347b:	mov    rdi,rax
   14000347e:	call   QWORD PTR [rip+0x2bac]        # 0x140006030
   140003484:	mov    edx,0x1
   140003489:	mov    rcx,rdi
   14000348c:	mov    r8d,edx
   14000348f:	mov    rbx,rax
   140003492:	call   QWORD PTR [rip+0x2be0]        # 0x140006078
   140003498:	mov    rcx,rax
   14000349b:	call   QWORD PTR [rip+0x2baf]        # 0x140006050
   1400034a1:	mov    rcx,rbx
   1400034a4:	call   QWORD PTR [rip+0x2bb6]        # 0x140006060
   1400034aa:	mov    rdx,rdi
   1400034ad:	xor    ecx,ecx
   1400034af:	call   QWORD PTR [rip+0x2dbb]        # 0x140006270
   1400034b5:	xor    r9d,r9d
   1400034b8:	mov    edx,0x1
   1400034bd:	mov    r8d,0x32
   1400034c3:	mov    rcx,r15
   1400034c6:	call   QWORD PTR [rip+0x2d2c]        # 0x1400061f8
   1400034cc:	mov    eax,0x1
   1400034d1:	mov    rcx,QWORD PTR [rbp+0x8e0]
   1400034d8:	xor    rcx,rsp
   1400034db:	call   0x140004510
   1400034e0:	mov    rbx,QWORD PTR [rsp+0xa40]
   1400034e8:	add    rsp,0x9f0
   1400034ef:	pop    r15
   1400034f1:	pop    r14
   1400034f3:	pop    r13
   1400034f5:	pop    r12
   1400034f7:	pop    rdi
   1400034f8:	pop    rsi
   1400034f9:	pop    rbp
   1400034fa:	ret
   1400034fb:	int3
   1400034fc:	int3
   1400034fd:	int3
   1400034fe:	int3
   1400034ff:	int3
   140003500:	rex push rbp
   140003502:	push   rbx
   140003503:	push   rsi
   140003504:	push   rdi
   140003505:	push   r12
   140003507:	push   r14
   140003509:	push   r15
   14000350b:	lea    rbp,[rsp-0x1070]
   140003513:	mov    eax,0x1170
   140003518:	call   0x140005330
   14000351d:	sub    rsp,rax
   140003520:	mov    rax,QWORD PTR [rip+0x4ad9]        # 0x140008000
   140003527:	xor    rax,rsp
   14000352a:	mov    QWORD PTR [rbp+0x1050],rax
   140003531:	mov    rsi,r9
   140003534:	mov    QWORD PTR [rsp+0x60],rcx
   140003539:	mov    rdi,r8
   14000353c:	mov    ebx,edx
   14000353e:	mov    r14,rcx
   140003541:	call   QWORD PTR [rip+0x2d11]        # 0x140006258
   140003547:	mov    rcx,rax
   14000354a:	call   QWORD PTR [rip+0x2c98]        # 0x1400061e8
   140003550:	call   QWORD PTR [rip+0x2d02]        # 0x140006258
   140003556:	mov    rcx,rax
   140003559:	call   QWORD PTR [rip+0x2c89]        # 0x1400061e8
   14000355f:	call   QWORD PTR [rip+0x2bab]        # 0x140006110
   140003565:	xor    r12d,r12d
   140003568:	mov    r15d,0x5
   14000356e:	test   eax,eax
   140003570:	je     0x140003592
   140003572:	mov    DWORD PTR [rsp+0x78],r12d
   140003577:	mov    ecx,r15d
   14000357a:	nop    WORD PTR [rax+rax*1+0x0]
   140003580:	mov    eax,DWORD PTR [rsp+0x78]
   140003584:	inc    eax
   140003586:	mov    DWORD PTR [rsp+0x78],eax
   14000358a:	sub    rcx,0x1
   14000358e:	jne    0x140003580
   140003590:	jmp    0x1400035a1
   140003592:	call   QWORD PTR [rip+0x2cc0]        # 0x140006258
   140003598:	mov    rcx,rax
   14000359b:	call   QWORD PTR [rip+0x2c47]        # 0x1400061e8
   1400035a1:	cmp    ebx,0x111
   1400035a7:	ja     0x140003f37
   1400035ad:	je     0x140003ee3
   1400035b3:	cmp    ebx,0x14
   1400035b6:	ja     0x140003ed5
   1400035bc:	je     0x140003ecb
   1400035c2:	mov    eax,ebx
   1400035c4:	sub    eax,0x1
   1400035c7:	je     0x140004375
   1400035cd:	sub    eax,0x1
   1400035d0:	je     0x140003e4b
   1400035d6:	cmp    eax,0xd
   1400035d9:	jne    0x140003f62
   1400035df:	lea    rdx,[rbp+0x0]
   1400035e3:	mov    QWORD PTR [rsp+0x1168],r13
   1400035eb:	mov    rcx,r14
   1400035ee:	call   QWORD PTR [rip+0x2c74]        # 0x140006268
   1400035f4:	lea    rdx,[rbp-0x80]
   1400035f8:	mov    rcx,r14
   1400035fb:	mov    r13,rax
   1400035fe:	call   QWORD PTR [rip+0x2c34]        # 0x140006238
   140003604:	xor    ecx,ecx
   140003606:	call   QWORD PTR [rip+0x2a74]        # 0x140006080
   14000360c:	mov    rcx,QWORD PTR [rip+0x5365]        # 0x140008978
   140003613:	lea    rdx,[rbp-0x80]
   140003617:	mov    r8,rax
   14000361a:	mov    rbx,rax
   14000361d:	call   QWORD PTR [rip+0x2b85]        # 0x1400061a8
   140003623:	mov    rcx,rbx
   140003626:	call   QWORD PTR [rip+0x2a24]        # 0x140006050
   14000362c:	cmp    QWORD PTR [rip+0x5375],r12        # 0x1400089a8
   140003633:	je     0x140003c61
   140003639:	xor    edx,edx
   14000363b:	lea    rcx,[rbp+0x510]
   140003642:	mov    r8d,0x200
   140003648:	call   0x140005212
   14000364d:	xor    ecx,ecx
   14000364f:	cmp    BYTE PTR [rip+0x5243],r12b        # 0x140008899
   140003656:	je     0x140003aea
   14000365c:	call   QWORD PTR [rip+0x29f6]        # 0x140006058
   140003662:	lea    r8,[rbp-0x48]
   140003666:	mov    edx,0x10
   14000366b:	mov    rcx,rax
   14000366e:	call   QWORD PTR [rip+0x2a14]        # 0x140006088
   140003674:	mov    ecx,DWORD PTR [rbp-0x48]
   140003677:	lea    rdx,[rip+0x2e9a]        # 0x140006518
   14000367e:	test   eax,eax
   140003680:	mov    r9d,0x20019
   140003686:	lea    rax,[rbp-0x60]
   14000368a:	cmovne ecx,r12d
   14000368e:	mov    QWORD PTR [rsp+0x20],rax
   140003693:	mov    DWORD PTR [rbp-0x48],ecx
   140003696:	xor    r8d,r8d
   140003699:	mov    rcx,0xffffffff80000001
   1400036a0:	call   QWORD PTR [rip+0x296a]        # 0x140006010
   1400036a6:	test   eax,eax
   1400036a8:	jne    0x1400036b4
   1400036aa:	mov    rcx,QWORD PTR [rbp-0x60]
   1400036ae:	call   QWORD PTR [rip+0x296c]        # 0x140006020
   1400036b4:	xor    ecx,ecx
   1400036b6:	mov    QWORD PTR [rbp-0x70],r12
   1400036ba:	call   QWORD PTR [rip+0x2b00]        # 0x1400061c0
   1400036c0:	lea    r9,[rip+0x49b9]        # 0x140008080
   1400036c7:	mov    QWORD PTR [rsp+0x20],0xffffffffffffffff
   1400036d0:	mov    r8d,0x100
   1400036d6:	mov    DWORD PTR [rsp+0x70],eax
   1400036da:	lea    rdx,[rbp+0x710]
   1400036e1:	lea    rcx,[rbp-0x70]
   1400036e5:	call   QWORD PTR [rip+0x2bf5]        # 0x1400062e0
   1400036eb:	mov    edx,0x104
   1400036f0:	lea    rcx,[rbp+0x810]
   1400036f7:	call   QWORD PTR [rip+0x2a3b]        # 0x140006138
   1400036fd:	test   eax,eax
   1400036ff:	je     0x14000373a
   140003701:	lea    r8,[rip+0x2e00]        # 0x140006508
   140003708:	mov    edx,0x104
   14000370d:	lea    rcx,[rbp+0x810]
   140003714:	call   QWORD PTR [rip+0x2cbe]        # 0x1400063d8
   14000371a:	lea    rdx,[rbp+0x50]
   14000371e:	lea    rcx,[rbp+0x810]
   140003725:	call   QWORD PTR [rip+0x2a35]        # 0x140006160
   14000372b:	cmp    rax,0xffffffffffffffff
   14000372f:	je     0x14000373a
   140003731:	mov    rcx,rax
   140003734:	call   QWORD PTR [rip+0x2a06]        # 0x140006140
   14000373a:	mov    DWORD PTR [rsp+0x78],r12d
   14000373f:	mov    rcx,r15
   140003742:	nop    DWORD PTR [rax+0x0]
   140003746:	data16 nop WORD PTR [rax+rax*1+0x0]
   140003750:	mov    eax,DWORD PTR [rsp+0x78]
   140003754:	inc    eax
   140003756:	mov    DWORD PTR [rsp+0x78],eax
   14000375a:	sub    rcx,0x1
   14000375e:	jne    0x140003750
   140003760:	movups xmm0,XMMWORD PTR [rip+0x4b19]        # 0x140008280
   140003767:	movzx  eax,WORD PTR [rip+0x4b22]        # 0x140008290
   14000376e:	lea    rcx,[rbp+0xa20]
   140003775:	mov    edx,0x104
   14000377a:	mov    WORD PTR [rbp+0x500],ax
   140003781:	movups XMMWORD PTR [rbp+0x4f0],xmm0
   140003788:	call   QWORD PTR [rip+0x29aa]        # 0x140006138
   14000378e:	test   eax,eax
   140003790:	je     0x1400037cb
   140003792:	lea    r8,[rip+0x2d6f]        # 0x140006508
   140003799:	mov    edx,0x104
   14000379e:	lea    rcx,[rbp+0xa20]
   1400037a5:	call   QWORD PTR [rip+0x2c2d]        # 0x1400063d8
   1400037ab:	lea    rdx,[rbp+0x50]
   1400037af:	lea    rcx,[rbp+0xa20]
   1400037b6:	call   QWORD PTR [rip+0x29a4]        # 0x140006160
   1400037bc:	cmp    rax,0xffffffffffffffff
   1400037c0:	je     0x1400037cb
   1400037c2:	mov    rcx,rax
   1400037c5:	call   QWORD PTR [rip+0x2975]        # 0x140006140
   1400037cb:	call   0x140001010
   1400037d0:	mov    r8d,DWORD PTR [rbp-0x70]
   1400037d4:	lea    rdx,[rbp+0x710]
   1400037db:	sub    r8d,eax
   1400037de:	lea    rcx,[rbp+0x50]
   1400037e2:	dec    r8d
   1400037e5:	call   0x1400010d0
   1400037ea:	mov    edx,0x104
   1400037ef:	lea    rcx,[rbp+0xc30]
   1400037f6:	call   QWORD PTR [rip+0x293c]        # 0x140006138
   1400037fc:	test   eax,eax
   1400037fe:	je     0x14000383c
   140003800:	lea    r8,[rip+0x2d01]        # 0x140006508
   140003807:	mov    edx,0x104
   14000380c:	lea    rcx,[rbp+0xc30]
   140003813:	call   QWORD PTR [rip+0x2bbf]        # 0x1400063d8
   140003819:	lea    rdx,[rbp+0x2a0]
   140003820:	lea    rcx,[rbp+0xc30]
   140003827:	call   QWORD PTR [rip+0x2933]        # 0x140006160
   14000382d:	cmp    rax,0xffffffffffffffff
   140003831:	je     0x14000383c
   140003833:	mov    rcx,rax
   140003836:	call   QWORD PTR [rip+0x2904]        # 0x140006140
   14000383c:	xor    ecx,ecx
   14000383e:	call   QWORD PTR [rip+0x295c]        # 0x1400061a0
   140003844:	mov    rdi,rax
   140003847:	test   rax,rax
   14000384a:	je     0x1400038ed
   140003850:	mov    rcx,rax
   140003853:	call   QWORD PTR [rip+0x27d7]        # 0x140006030
   140003859:	mov    edx,0x10
   14000385e:	mov    rcx,rdi
   140003861:	mov    r8d,edx
   140003864:	mov    rsi,rax
   140003867:	call   QWORD PTR [rip+0x280b]        # 0x140006078
   14000386d:	mov    r14,rax
   140003870:	test   rsi,rsi
   140003873:	je     0x1400038e2
   140003875:	test   rax,rax
   140003878:	je     0x1400038e2
   14000387a:	mov    rdx,rax
   14000387d:	mov    rcx,rsi
   140003880:	call   QWORD PTR [rip+0x27b2]        # 0x140006038
   140003886:	mov    r9d,0x10
   14000388c:	mov    DWORD PTR [rsp+0x20],0x10
   140003894:	xor    r8d,r8d
   140003897:	xor    edx,edx
   140003899:	mov    rcx,rsi
   14000389c:	mov    rbx,rax
   14000389f:	call   QWORD PTR [rip+0x27f3]        # 0x140006098
   1400038a5:	mov    edx,0x2
   1400038aa:	mov    DWORD PTR [rsp+0x20],0xe
   1400038b2:	mov    r8d,edx
   1400038b5:	mov    r9d,0xe
   1400038bb:	mov    rcx,rsi
   1400038be:	call   QWORD PTR [rip+0x27cc]        # 0x140006090
   1400038c4:	mov    rdx,rbx
   1400038c7:	mov    rcx,rsi
   1400038ca:	call   QWORD PTR [rip+0x2768]        # 0x140006038
   1400038d0:	mov    rcx,r14
   1400038d3:	call   QWORD PTR [rip+0x2777]        # 0x140006050
   1400038d9:	mov    rcx,rsi
   1400038dc:	call   QWORD PTR [rip+0x277e]        # 0x140006060
   1400038e2:	mov    rdx,rdi
   1400038e5:	xor    ecx,ecx
   1400038e7:	call   QWORD PTR [rip+0x2983]        # 0x140006270
   1400038ed:	movzx  r8d,BYTE PTR [rbp+0x151]
   1400038f5:	mov    r14,r12
   1400038f8:	movzx  edx,BYTE PTR [rbp+0x150]
   1400038ff:	nop
   140003900:	inc    dl
   140003902:	mov    rcx,r15
   140003905:	mov    BYTE PTR [rbp+0x150],dl
   14000390b:	mov    DWORD PTR [rsp+0x78],r12d
   140003910:	mov    eax,DWORD PTR [rsp+0x78]
   140003914:	inc    eax
   140003916:	mov    DWORD PTR [rsp+0x78],eax
   14000391a:	sub    rcx,0x1
   14000391e:	jne    0x140003910
   140003920:	movzx  eax,dl
   140003923:	lea    rdi,[rbp+0x50]
   140003927:	add    rdi,rax
   14000392a:	add    r8b,BYTE PTR [rdi]
   14000392d:	mov    BYTE PTR [rbp+0x151],r8b
   140003934:	movzx  ebx,r8b
   140003938:	call   QWORD PTR [rip+0x291a]        # 0x140006258
   14000393e:	mov    rcx,rax
   140003941:	call   QWORD PTR [rip+0x28a1]        # 0x1400061e8
   140003947:	movzx  eax,BYTE PTR [rbp+rbx*1+0x50]
   14000394c:	mov    ecx,0x4
   140003951:	movzx  esi,BYTE PTR [rdi]
   140003954:	mov    BYTE PTR [rdi],al
   140003956:	call   QWORD PTR [rip+0x26fc]        # 0x140006058
   14000395c:	lea    r8,[rbp-0x18]
   140003960:	mov    edx,0x10
   140003965:	mov    rcx,rax
   140003968:	call   QWORD PTR [rip+0x271a]        # 0x140006088
   14000396e:	movzx  eax,BYTE PTR [rbp+0x151]
   140003975:	mov    BYTE PTR [rbp+rax*1+0x50],sil
   14000397a:	movzx  r8d,BYTE PTR [rbp+0x151]
   140003982:	movzx  edx,BYTE PTR [rbp+0x150]
   140003989:	movzx  ecx,BYTE PTR [rbp+r8*1+0x50]
   14000398f:	add    cl,BYTE PTR [rbp+rdx*1+0x50]
   140003993:	movzx  eax,cl
   140003996:	movzx  ecx,BYTE PTR [rbp+rax*1+0x50]
   14000399b:	xor    BYTE PTR [rbp+r14*1+0x4f0],cl
   1400039a3:	mov    rcx,r15
   1400039a6:	mov    DWORD PTR [rsp+0x78],r12d
   1400039ab:	nop    DWORD PTR [rax+rax*1+0x0]
   1400039b0:	mov    eax,DWORD PTR [rsp+0x78]
   1400039b4:	inc    eax
   1400039b6:	mov    DWORD PTR [rsp+0x78],eax
   1400039ba:	sub    rcx,0x1
   1400039be:	jne    0x1400039b0
   1400039c0:	inc    r14
   1400039c3:	cmp    r14,0x12
   1400039c7:	jl     0x140003900
   1400039cd:	lea    rax,[rbp-0x58]
   1400039d1:	mov    r9d,0x20019
   1400039d7:	xor    r8d,r8d
   1400039da:	mov    QWORD PTR [rsp+0x20],rax
   1400039df:	lea    rdx,[rip+0x2b32]        # 0x140006518
   1400039e6:	mov    rcx,0xffffffff80000001
   1400039ed:	call   QWORD PTR [rip+0x261d]        # 0x140006010
   1400039f3:	test   eax,eax
   1400039f5:	jne    0x140003a01
   1400039f7:	mov    rcx,QWORD PTR [rbp-0x58]
   1400039fb:	call   QWORD PTR [rip+0x261f]        # 0x140006020
   140003a01:	movzx  edx,BYTE PTR [rip+0x4e90]        # 0x140008898
   140003a08:	movzx  eax,BYTE PTR [rbp+0x4f0]
   140003a0f:	mov    BYTE PTR [rbp+0x502],r12b
   140003a16:	lea    ecx,[rdx+0x45]
   140003a19:	cmp    eax,ecx
   140003a1b:	jne    0x140003aca
   140003a21:	movzx  eax,BYTE PTR [rbp+0x4f1]
   140003a28:	lea    ecx,[rdx+0x4b]
   140003a2b:	cmp    eax,ecx
   140003a2d:	jne    0x140003aca
   140003a33:	movzx  eax,BYTE PTR [rbp+0x4f2]
   140003a3a:	mov    ecx,0x53
   140003a3f:	sub    ecx,edx
   140003a41:	cmp    eax,ecx
   140003a43:	jne    0x140003aca
   140003a49:	xor    ecx,ecx
   140003a4b:	call   QWORD PTR [rip+0x276f]        # 0x1400061c0
   140003a51:	lea    r9,[rbp+0x4f0]
   140003a58:	mov    QWORD PTR [rsp+0x20],0xffffffffffffffff
   140003a61:	mov    r8d,0x100
   140003a67:	mov    DWORD PTR [rsp+0x70],eax
   140003a6b:	lea    rdx,[rbp+0x510]
   140003a72:	lea    rcx,[rbp-0x70]
   140003a76:	call   QWORD PTR [rip+0x285c]        # 0x1400062d8
   140003a7c:	xor    ecx,ecx
   140003a7e:	call   QWORD PTR [rip+0x271c]        # 0x1400061a0
   140003a84:	mov    rcx,rax
   140003a87:	mov    rdi,rax
   140003a8a:	call   QWORD PTR [rip+0x25a0]        # 0x140006030
   140003a90:	mov    edx,0x1
   140003a95:	mov    rcx,rdi
   140003a98:	mov    r8d,edx
   140003a9b:	mov    rbx,rax
   140003a9e:	call   QWORD PTR [rip+0x25d4]        # 0x140006078
   140003aa4:	mov    rcx,rax
   140003aa7:	call   QWORD PTR [rip+0x25a3]        # 0x140006050
   140003aad:	mov    rcx,rbx
   140003ab0:	call   QWORD PTR [rip+0x25aa]        # 0x140006060
   140003ab6:	mov    rdx,rdi
   140003ab9:	xor    ecx,ecx
   140003abb:	call   QWORD PTR [rip+0x27af]        # 0x140006270
   140003ac1:	lea    rbx,[rbp+0x516]
   140003ac8:	jmp    0x140003b2f
   140003aca:	xor    ecx,ecx
   140003acc:	call   QWORD PTR [rip+0x26ee]        # 0x1400061c0
   140003ad2:	lea    rcx,[rsp+0x78]
   140003ad7:	mov    DWORD PTR [rsp+0x70],eax
   140003adb:	lea    rbx,[rip+0x2bbe]        # 0x1400066a0
   140003ae2:	call   QWORD PTR [rip+0x2640]        # 0x140006128
   140003ae8:	jmp    0x140003b2f
   140003aea:	call   QWORD PTR [rip+0x26d0]        # 0x1400061c0
   140003af0:	mov    DWORD PTR [rsp+0x70],eax
   140003af4:	lea    rbx,[rip+0x2c15]        # 0x140006710
   140003afb:	call   QWORD PTR [rip+0x261f]        # 0x140006120
   140003b01:	mov    r8d,eax
   140003b04:	mov    eax,0x51eb851f
   140003b09:	mul    r8d
   140003b0c:	shr    edx,0x5
   140003b0f:	imul   ecx,edx,0x64
   140003b12:	sub    r8d,ecx
   140003b15:	mov    DWORD PTR [rsp+0x78],r8d
   140003b1a:	mov    eax,DWORD PTR [rsp+0x78]
   140003b1e:	add    eax,r15d
   140003b21:	mov    DWORD PTR [rsp+0x78],eax
   140003b25:	mov    ecx,DWORD PTR [rsp+0x78]
   140003b29:	call   QWORD PTR [rip+0x2621]        # 0x140006150
   140003b2f:	lea    rcx,[rbp-0x50]
   140003b33:	call   QWORD PTR [rip+0x25ef]        # 0x140006128
   140003b39:	mov    rcx,QWORD PTR [rip+0x4e38]        # 0x140008978
   140003b40:	mov    edx,0xd9588
   140003b45:	call   QWORD PTR [rip+0x251d]        # 0x140006068
   140003b4b:	lea    rax,[rsp+0x68]
   140003b50:	mov    r9d,0x20019
   140003b56:	xor    r8d,r8d
   140003b59:	mov    QWORD PTR [rsp+0x20],rax
   140003b5e:	lea    rdx,[rip+0x29b3]        # 0x140006518
   140003b65:	mov    rcx,0xffffffff80000001
   140003b6c:	call   QWORD PTR [rip+0x249e]        # 0x140006010
   140003b72:	test   eax,eax
   140003b74:	jne    0x140003b81
   140003b76:	mov    rcx,QWORD PTR [rsp+0x68]
   140003b7b:	call   QWORD PTR [rip+0x249f]        # 0x140006020
   140003b81:	mov    rcx,QWORD PTR [rip+0x4df0]        # 0x140008978
   140003b88:	mov    edx,0x1
   140003b8d:	call   QWORD PTR [rip+0x24dd]        # 0x140006070
   140003b93:	mov    edx,0x104
   140003b98:	lea    rcx,[rbp+0xe40]
   140003b9f:	call   QWORD PTR [rip+0x2593]        # 0x140006138
   140003ba5:	test   eax,eax
   140003ba7:	je     0x140003be5
   140003ba9:	lea    r8,[rip+0x2958]        # 0x140006508
   140003bb0:	mov    edx,0x104
   140003bb5:	lea    rcx,[rbp+0xe40]
   140003bbc:	call   QWORD PTR [rip+0x2816]        # 0x1400063d8
   140003bc2:	lea    rdx,[rbp+0x2a0]
   140003bc9:	lea    rcx,[rbp+0xe40]
   140003bd0:	call   QWORD PTR [rip+0x258a]        # 0x140006160
   140003bd6:	cmp    rax,0xffffffffffffffff
   140003bda:	je     0x140003be5
   140003bdc:	mov    rcx,rax
   140003bdf:	call   QWORD PTR [rip+0x255b]        # 0x140006140
   140003be5:	mov    rdx,QWORD PTR [rip+0x4dbc]        # 0x1400089a8
   140003bec:	mov    rcx,QWORD PTR [rip+0x4d85]        # 0x140008978
   140003bf3:	call   QWORD PTR [rip+0x243f]        # 0x140006038
   140003bf9:	mov    DWORD PTR [rsp+0x78],r12d
   140003bfe:	mov    rdx,r15
   140003c01:	mov    rdi,rax
   140003c04:	nop    DWORD PTR [rax+0x0]
   140003c08:	nop    DWORD PTR [rax+rax*1+0x0]
   140003c10:	mov    ecx,DWORD PTR [rsp+0x78]
   140003c14:	inc    ecx
   140003c16:	mov    DWORD PTR [rsp+0x78],ecx
   140003c1a:	sub    rdx,0x1
   140003c1e:	jne    0x140003c10
   140003c20:	mov    rcx,QWORD PTR [rip+0x4d51]        # 0x140008978
   140003c27:	lea    r9,[rbp-0x80]
   140003c2b:	mov    r8d,0xffffffff
   140003c31:	mov    DWORD PTR [rsp+0x20],0x25
   140003c39:	mov    rdx,rbx
   140003c3c:	call   QWORD PTR [rip+0x25fe]        # 0x140006240
   140003c42:	call   QWORD PTR [rip+0x2610]        # 0x140006258
   140003c48:	mov    rcx,rax
   140003c4b:	call   QWORD PTR [rip+0x2597]        # 0x1400061e8
   140003c51:	mov    rcx,QWORD PTR [rip+0x4d20]        # 0x140008978
   140003c58:	mov    rdx,rdi
   140003c5b:	call   QWORD PTR [rip+0x23d7]        # 0x140006038
   140003c61:	cmp    QWORD PTR [rip+0x4d30],r12        # 0x140008998
   140003c68:	je     0x140003dbe
   140003c6e:	lea    rdx,[rsp+0x78]
   140003c73:	mov    DWORD PTR [rsp+0x78],0x100
   140003c7b:	lea    rcx,[rbp+0x510]
   140003c82:	call   QWORD PTR [rip+0x24a8]        # 0x140006130
   140003c88:	test   eax,eax
   140003c8a:	je     0x140003cba
   140003c8c:	mov    eax,DWORD PTR [rsp+0x78]
   140003c90:	mov    DWORD PTR [rsp+0x70],r12d
   140003c95:	test   eax,eax
   140003c97:	je     0x140003cba
   140003c99:	lea    rdx,[rbp+0x510]
   140003ca0:	mov    r8d,eax
   140003ca3:	movzx  ecx,WORD PTR [rdx]
   140003ca6:	lea    rdx,[rdx+0x2]
   140003caa:	mov    eax,DWORD PTR [rsp+0x70]
   140003cae:	add    ecx,eax
   140003cb0:	mov    DWORD PTR [rsp+0x70],ecx
   140003cb4:	sub    r8,0x1
   140003cb8:	jne    0x140003ca3
   140003cba:	xor    ecx,ecx
   140003cbc:	call   QWORD PTR [rip+0x24fe]        # 0x1400061c0
   140003cc2:	mov    rcx,QWORD PTR [rip+0x4caf]        # 0x140008978
   140003cc9:	mov    DWORD PTR [rsp+0x70],eax
   140003ccd:	call   QWORD PTR [rip+0x235d]        # 0x140006030
   140003cd3:	xor    ecx,ecx
   140003cd5:	mov    rdi,rax
   140003cd8:	call   QWORD PTR [rip+0x24e2]        # 0x1400061c0
   140003cde:	mov    rdx,QWORD PTR [rip+0x4cb3]        # 0x140008998
   140003ce5:	mov    rcx,rdi
   140003ce8:	mov    DWORD PTR [rsp+0x70],eax
   140003cec:	call   QWORD PTR [rip+0x2346]        # 0x140006038
   140003cf2:	xor    ecx,ecx
   140003cf4:	mov    rsi,rax
   140003cf7:	call   QWORD PTR [rip+0x24c3]        # 0x1400061c0
   140003cfd:	mov    ebx,r12d
   140003d00:	mov    DWORD PTR [rsp+0x70],eax
   140003d04:	cmp    DWORD PTR [rip+0x4c9a],ebx        # 0x1400089a4
   140003d0a:	jle    0x140003d93
   140003d10:	lea    r14,[rip+0x4d69]        # 0x140008a80
   140003d17:	nop    WORD PTR [rax+rax*1+0x0]
   140003d20:	mov    DWORD PTR [rsp+0x70],r12d
   140003d25:	mov    rcx,r15
   140003d28:	nop    DWORD PTR [rax+rax*1+0x0]
   140003d30:	mov    eax,DWORD PTR [rsp+0x70]
   140003d34:	inc    eax
   140003d36:	mov    DWORD PTR [rsp+0x70],eax
   140003d3a:	sub    rcx,0x1
   140003d3e:	jne    0x140003d30
   140003d40:	mov    eax,DWORD PTR [rip+0x4c5a]        # 0x1400089a0
   140003d46:	mov    r9d,DWORD PTR [rip+0x4c3b]        # 0x140008988
   140003d4d:	mov    r8d,DWORD PTR [r14+0x4]
   140003d51:	mov    edx,DWORD PTR [r14]
   140003d54:	mov    rcx,QWORD PTR [rip+0x4c1d]        # 0x140008978
   140003d5b:	mov    DWORD PTR [rsp+0x50],0xff00ff
   140003d63:	mov    DWORD PTR [rsp+0x48],eax
   140003d67:	mov    DWORD PTR [rsp+0x40],r9d
   140003d6c:	mov    DWORD PTR [rsp+0x38],r12d
   140003d71:	mov    DWORD PTR [rsp+0x30],r12d
   140003d76:	mov    QWORD PTR [rsp+0x28],rdi
   140003d7b:	mov    DWORD PTR [rsp+0x20],eax
   140003d7f:	call   QWORD PTR [rip+0x23eb]        # 0x140006170
   140003d85:	inc    ebx
   140003d87:	add    r14,0x10
   140003d8b:	cmp    ebx,DWORD PTR [rip+0x4c13]        # 0x1400089a4
   140003d91:	jl     0x140003d20
   140003d93:	xor    ecx,ecx
   140003d95:	call   QWORD PTR [rip+0x2425]        # 0x1400061c0
   140003d9b:	mov    rdx,rsi
   140003d9e:	mov    rcx,rdi
   140003da1:	mov    DWORD PTR [rsp+0x70],eax
   140003da5:	call   QWORD PTR [rip+0x228d]        # 0x140006038
   140003dab:	lea    rcx,[rbp-0x50]
   140003daf:	call   QWORD PTR [rip+0x2373]        # 0x140006128
   140003db5:	mov    rcx,rdi
   140003db8:	call   QWORD PTR [rip+0x22a2]        # 0x140006060
   140003dbe:	mov    ecx,0x4
   140003dc3:	call   QWORD PTR [rip+0x228f]        # 0x140006058
   140003dc9:	lea    r8,[rbp-0x38]
   140003dcd:	mov    edx,0x10
   140003dd2:	mov    rcx,rax
   140003dd5:	call   QWORD PTR [rip+0x22ad]        # 0x140006088
   140003ddb:	mov    rax,QWORD PTR [rip+0x4b96]        # 0x140008978
   140003de2:	xor    r8d,r8d
   140003de5:	mov    r9d,DWORD PTR [rbp-0x78]
   140003de9:	xor    edx,edx
   140003deb:	mov    DWORD PTR [rsp+0x40],0xcc0020
   140003df3:	mov    rcx,r13
   140003df6:	mov    DWORD PTR [rsp+0x38],r12d
   140003dfb:	mov    DWORD PTR [rsp+0x30],r12d
   140003e00:	mov    QWORD PTR [rsp+0x28],rax
   140003e05:	mov    eax,DWORD PTR [rbp-0x74]
   140003e08:	mov    DWORD PTR [rsp+0x20],eax
   140003e0c:	call   QWORD PTR [rip+0x2236]        # 0x140006048
   140003e12:	mov    ecx,0x4
   140003e17:	call   QWORD PTR [rip+0x223b]        # 0x140006058
   140003e1d:	lea    r8,[rbp-0x28]
   140003e21:	mov    edx,0x10
   140003e26:	mov    rcx,rax
   140003e29:	call   QWORD PTR [rip+0x2259]        # 0x140006088
   140003e2f:	mov    rcx,QWORD PTR [rsp+0x60]
   140003e34:	lea    rdx,[rbp+0x0]
   140003e38:	call   QWORD PTR [rip+0x2422]        # 0x140006260
   140003e3e:	mov    r13,QWORD PTR [rsp+0x1168]
   140003e46:	jmp    0x140004375
   140003e4b:	mov    edx,0x1
   140003e50:	mov    rcx,r14
   140003e53:	call   QWORD PTR [rip+0x23ef]        # 0x140006248
   140003e59:	mov    rcx,QWORD PTR [rip+0x4b38]        # 0x140008998
   140003e60:	test   rcx,rcx
   140003e63:	je     0x140003e72
   140003e65:	call   QWORD PTR [rip+0x21e5]        # 0x140006050
   140003e6b:	mov    QWORD PTR [rip+0x4b26],r12        # 0x140008998
   140003e72:	mov    rcx,QWORD PTR [rip+0x4b2f]        # 0x1400089a8
   140003e79:	test   rcx,rcx
   140003e7c:	je     0x140003e8b
   140003e7e:	call   QWORD PTR [rip+0x21cc]        # 0x140006050
   140003e84:	mov    QWORD PTR [rip+0x4b1d],r12        # 0x1400089a8
   140003e8b:	mov    rcx,QWORD PTR [rip+0x4ae6]        # 0x140008978
   140003e92:	test   rcx,rcx
   140003e95:	je     0x140003ebe
   140003e97:	mov    rdx,QWORD PTR [rip+0x4af2]        # 0x140008990
   140003e9e:	call   QWORD PTR [rip+0x2194]        # 0x140006038
   140003ea4:	mov    rcx,QWORD PTR [rip+0x4abd]        # 0x140008968
   140003eab:	call   QWORD PTR [rip+0x219f]        # 0x140006050
   140003eb1:	mov    rcx,QWORD PTR [rip+0x4ac0]        # 0x140008978
   140003eb8:	call   QWORD PTR [rip+0x21a2]        # 0x140006060
   140003ebe:	xor    ecx,ecx
   140003ec0:	call   QWORD PTR [rip+0x238a]        # 0x140006250
   140003ec6:	jmp    0x140004375
   140003ecb:	mov    eax,0x1
   140003ed0:	jmp    0x140004377
   140003ed5:	mov    eax,ebx
   140003ed7:	sub    eax,0x100
   140003edc:	je     0x140003ebe
   140003ede:	cmp    eax,0x4
   140003ee1:	jmp    0x140003f5c
   140003ee3:	movzx  ecx,di
   140003ee6:	sub    ecx,0x68
   140003ee9:	je     0x140003f11
   140003eeb:	cmp    ecx,0x1
   140003eee:	mov    rcx,r14
   140003ef1:	je     0x140003f06
   140003ef3:	mov    r9,rsi
   140003ef6:	mov    r8,rdi
   140003ef9:	mov    edx,ebx
   140003efb:	call   QWORD PTR [rip+0x228f]        # 0x140006190
   140003f01:	jmp    0x140004377
   140003f06:	call   QWORD PTR [rip+0x228c]        # 0x140006198
   140003f0c:	jmp    0x140004375
   140003f11:	mov    rcx,QWORD PTR [rip+0x4978]        # 0x140008890
   140003f18:	lea    r9,[rip+0x481]        # 0x1400043a0
   140003f1f:	mov    r8,r14
   140003f22:	mov    QWORD PTR [rsp+0x20],r12
   140003f27:	mov    edx,0x67
   140003f2c:	call   QWORD PTR [rip+0x235e]        # 0x140006290
   140003f32:	jmp    0x140004375
   140003f37:	mov    eax,ebx
   140003f39:	sub    eax,0x113
   140003f3e:	je     0x140003fa5
   140003f40:	sub    eax,0xed
   140003f45:	je     0x140003f78
   140003f47:	sub    eax,0x1
   140003f4a:	je     0x140003ebe
   140003f50:	sub    eax,0x3
   140003f53:	je     0x140003ebe
   140003f59:	cmp    eax,0x3
   140003f5c:	je     0x140003ebe
   140003f62:	mov    r9,rsi
   140003f65:	mov    r8,rdi
   140003f68:	mov    edx,ebx
   140003f6a:	mov    rcx,r14
   140003f6d:	call   QWORD PTR [rip+0x221d]        # 0x140006190
   140003f73:	jmp    0x140004377
   140003f78:	cmp    DWORD PTR [rip+0x4a01],r12d        # 0x140008980
   140003f7f:	je     0x140004375
   140003f85:	cmp    DWORD PTR [rip+0x4eb4],r12d        # 0x140008e40
   140003f8c:	je     0x140003f96
   140003f8e:	xor    ecx,ecx
   140003f90:	call   QWORD PTR [rip+0x22ba]        # 0x140006250
   140003f96:	mov    DWORD PTR [rip+0x4ea0],0x1        # 0x140008e40
   140003fa0:	jmp    0x140004375
   140003fa5:	mov    ecx,0x1
   140003faa:	call   QWORD PTR [rip+0x2210]        # 0x1400061c0
   140003fb0:	mov    DWORD PTR [rsp+0x78],eax
   140003fb4:	mov    eax,DWORD PTR [rsp+0x78]
   140003fb8:	test   eax,eax
   140003fba:	jle    0x140003fc6
   140003fbc:	mov    eax,DWORD PTR [rsp+0x78]
   140003fc0:	inc    eax
   140003fc2:	mov    DWORD PTR [rsp+0x78],eax
   140003fc6:	inc    DWORD PTR [rip+0x49a4]        # 0x140008970
   140003fcc:	mov    rcx,r15
   140003fcf:	mov    DWORD PTR [rsp+0x70],r12d
   140003fd4:	nop    DWORD PTR [rax+0x0]
   140003fd8:	nop    DWORD PTR [rax+rax*1+0x0]
   140003fe0:	mov    eax,DWORD PTR [rsp+0x70]
   140003fe4:	inc    eax
   140003fe6:	mov    DWORD PTR [rsp+0x70],eax
   140003fea:	sub    rcx,0x1
   140003fee:	jne    0x140003fe0
   140003ff0:	lea    rdx,[rbp-0x48]
   140003ff4:	mov    rcx,r14
   140003ff7:	call   QWORD PTR [rip+0x223b]        # 0x140006238
   140003ffd:	mov    DWORD PTR [rsp+0x70],r12d
   140004002:	nop    DWORD PTR [rax+0x0]
   140004006:	data16 nop WORD PTR [rax+rax*1+0x0]
   140004010:	mov    eax,DWORD PTR [rsp+0x70]
   140004014:	inc    eax
   140004016:	mov    DWORD PTR [rsp+0x70],eax
   14000401a:	sub    r15,0x1
   14000401e:	jne    0x140004010
   140004020:	cmp    DWORD PTR [rip+0x497d],r12d        # 0x1400089a4
   140004027:	lea    r14,[rip+0x4a52]        # 0x140008a80
   14000402e:	mov    r15d,r12d
   140004031:	jle    0x14000414c
   140004037:	mov    rsi,r14
   14000403a:	nop    WORD PTR [rax+rax*1+0x0]
   140004040:	mov    eax,DWORD PTR [rsi+0x8]
   140004043:	lea    rdx,[rsp+0x70]
   140004048:	add    DWORD PTR [rsi],eax
   14000404a:	lea    rcx,[rbp+0x0]
   14000404e:	mov    DWORD PTR [rsp+0x70],0x20
   140004056:	call   QWORD PTR [rip+0x20d4]        # 0x140006130
   14000405c:	test   eax,eax
   14000405e:	je     0x140004068
   140004060:	movzx  eax,WORD PTR [rbp+0x0]
   140004064:	mov    DWORD PTR [rsp+0x78],eax
   140004068:	mov    eax,DWORD PTR [rsi+0xc]
   14000406b:	add    DWORD PTR [rsi+0x4],eax
   14000406e:	mov    edx,DWORD PTR [rsi]
   140004070:	mov    r8d,DWORD PTR [rip+0x4911]        # 0x140008988
   140004077:	mov    ecx,DWORD PTR [rbp-0x40]
   14000407a:	test   edx,edx
   14000407c:	js     0x140004086
   14000407e:	lea    eax,[rdx+r8*1]
   140004082:	cmp    eax,ecx
   140004084:	jle    0x1400040b7
   140004086:	sub    ecx,r8d
   140004089:	cmp    edx,ecx
   14000408b:	mov    eax,ecx
   14000408d:	cmovl  eax,edx
   140004090:	test   eax,eax
   140004092:	jns    0x140004099
   140004094:	mov    ecx,r12d
   140004097:	jmp    0x14000409e
   140004099:	cmp    edx,ecx
   14000409b:	cmovl  ecx,edx
   14000409e:	mov    DWORD PTR [rsi],ecx
   1400040a0:	call   QWORD PTR [rip+0x21b2]        # 0x140006258
   1400040a6:	mov    rcx,rax
   1400040a9:	call   QWORD PTR [rip+0x2139]        # 0x1400061e8
   1400040af:	mov    eax,DWORD PTR [rsi+0x8]
   1400040b2:	neg    eax
   1400040b4:	mov    DWORD PTR [rsi+0x8],eax
   1400040b7:	mov    edx,DWORD PTR [rsi+0x4]
   1400040ba:	mov    r8d,DWORD PTR [rip+0x48df]        # 0x1400089a0
   1400040c1:	mov    ecx,DWORD PTR [rbp-0x3c]
   1400040c4:	test   edx,edx
   1400040c6:	js     0x1400040d0
   1400040c8:	lea    eax,[rdx+r8*1]
   1400040cc:	cmp    eax,ecx
   1400040ce:	jle    0x140004138
   1400040d0:	sub    ecx,r8d
   1400040d3:	cmp    edx,ecx
   1400040d5:	mov    eax,ecx
   1400040d7:	cmovl  eax,edx
   1400040da:	test   eax,eax
   1400040dc:	jns    0x1400040e3
   1400040de:	mov    ecx,r12d
   1400040e1:	jmp    0x1400040e8
   1400040e3:	cmp    edx,ecx
   1400040e5:	cmovl  ecx,edx
   1400040e8:	mov    DWORD PTR [rsi+0x4],ecx
   1400040eb:	xor    ecx,ecx
   1400040ed:	call   QWORD PTR [rip+0x20ad]        # 0x1400061a0
   1400040f3:	mov    rcx,rax
   1400040f6:	mov    rdi,rax
   1400040f9:	call   QWORD PTR [rip+0x1f31]        # 0x140006030
   1400040ff:	mov    edx,0x1
   140004104:	mov    rcx,rdi
   140004107:	mov    r8d,edx
   14000410a:	mov    rbx,rax
   14000410d:	call   QWORD PTR [rip+0x1f65]        # 0x140006078
   140004113:	mov    rcx,rax
   140004116:	call   QWORD PTR [rip+0x1f34]        # 0x140006050
   14000411c:	mov    rcx,rbx
   14000411f:	call   QWORD PTR [rip+0x1f3b]        # 0x140006060
   140004125:	mov    rdx,rdi
   140004128:	xor    ecx,ecx
   14000412a:	call   QWORD PTR [rip+0x2140]        # 0x140006270
   140004130:	mov    eax,DWORD PTR [rsi+0xc]
   140004133:	neg    eax
   140004135:	mov    DWORD PTR [rsi+0xc],eax
   140004138:	inc    r15d
   14000413b:	add    rsi,0x10
   14000413f:	cmp    r15d,DWORD PTR [rip+0x485e]        # 0x1400089a4
   140004146:	jl     0x140004040
   14000414c:	cmp    DWORD PTR [rip+0x481a],0x258        # 0x140008970
   140004156:	jle    0x14000435b
   14000415c:	cmp    BYTE PTR [rip+0x4736],r12b        # 0x140008899
   140004163:	jne    0x14000435b
   140004169:	lea    rdx,[rsp+0x70]
   14000416e:	mov    DWORD PTR [rsp+0x70],0x100
   140004176:	lea    rcx,[rbp+0x510]
   14000417d:	call   QWORD PTR [rip+0x1fad]        # 0x140006130
   140004183:	test   eax,eax
   140004185:	je     0x1400041b7
   140004187:	mov    eax,DWORD PTR [rsp+0x70]
   14000418b:	mov    DWORD PTR [rsp+0x78],r12d
   140004190:	test   eax,eax
   140004192:	je     0x1400041b7
   140004194:	lea    rdx,[rbp+0x510]
   14000419b:	mov    r8d,eax
   14000419e:	xchg   ax,ax
   1400041a0:	mov    ecx,DWORD PTR [rsp+0x78]
   1400041a4:	movzx  eax,WORD PTR [rdx]
   1400041a7:	lea    rdx,[rdx+0x2]
   1400041ab:	add    ecx,eax
   1400041ad:	mov    DWORD PTR [rsp+0x78],ecx
   1400041b1:	sub    r8,0x1
   1400041b5:	jne    0x1400041a0
   1400041b7:	mov    eax,DWORD PTR [rip+0x47e7]        # 0x1400089a4
   1400041bd:	test   eax,eax
   1400041bf:	jle    0x14000435b
   1400041c5:	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   1400041d0:	lea    r15d,[r12+0x1]
   1400041d5:	cmp    r15d,eax
   1400041d8:	jge    0x140004339
   1400041de:	lea    rbx,[r14+0x10]
   1400041e2:	mov    ecx,DWORD PTR [r14]
   1400041e5:	lea    rax,[rsp+0x68]
   1400041ea:	mov    edx,DWORD PTR [r14+0x4]
   1400041ee:	mov    r9d,0x20019
   1400041f4:	mov    DWORD PTR [rbp-0x70],ecx
   1400041f7:	xor    r8d,r8d
   1400041fa:	add    ecx,DWORD PTR [rip+0x4788]        # 0x140008988
   140004200:	mov    DWORD PTR [rbp-0x68],ecx
   140004203:	mov    ecx,DWORD PTR [rip+0x4797]        # 0x1400089a0
   140004209:	add    ecx,edx
   14000420b:	mov    DWORD PTR [rbp-0x6c],edx
   14000420e:	mov    DWORD PTR [rbp-0x64],ecx
   140004211:	lea    rdx,[rip+0x2300]        # 0x140006518
   140004218:	mov    rcx,0xffffffff80000001
   14000421f:	mov    QWORD PTR [rsp+0x20],rax
   140004224:	call   QWORD PTR [rip+0x1de6]        # 0x140006010
   14000422a:	test   eax,eax
   14000422c:	jne    0x140004239
   14000422e:	mov    rcx,QWORD PTR [rsp+0x68]
   140004233:	call   QWORD PTR [rip+0x1de7]        # 0x140006020
   140004239:	mov    ecx,DWORD PTR [rbx]
   14000423b:	lea    r8,[rbp-0x80]
   14000423f:	mov    edx,DWORD PTR [rbx+0x4]
   140004242:	mov    DWORD PTR [rbp-0x80],ecx
   140004245:	add    ecx,DWORD PTR [rip+0x473d]        # 0x140008988
   14000424b:	mov    DWORD PTR [rbp-0x78],ecx
   14000424e:	mov    ecx,DWORD PTR [rip+0x474c]        # 0x1400089a0
   140004254:	add    ecx,edx
   140004256:	mov    DWORD PTR [rbp-0x7c],edx
   140004259:	mov    DWORD PTR [rbp-0x74],ecx
   14000425c:	lea    rdx,[rbp-0x70]
   140004260:	lea    rcx,[rbp-0x28]
   140004264:	call   QWORD PTR [rip+0x1fae]        # 0x140006218
   14000426a:	test   eax,eax
   14000426c:	je     0x140004323
   140004272:	inc    DWORD PTR [rip+0x470c]        # 0x140008984
   140004278:	mov    ecx,0x4
   14000427d:	mov    edi,DWORD PTR [r14+0x8]
   140004281:	call   QWORD PTR [rip+0x1dd1]        # 0x140006058
   140004287:	lea    r8,[rbp-0x38]
   14000428b:	mov    edx,0x10
   140004290:	mov    rcx,rax
   140004293:	call   QWORD PTR [rip+0x1def]        # 0x140006088
   140004299:	mov    eax,DWORD PTR [rbx+0x8]
   14000429c:	mov    esi,DWORD PTR [r14+0xc]
   1400042a0:	mov    DWORD PTR [r14+0x8],eax
   1400042a4:	mov    eax,DWORD PTR [rbx+0xc]
   1400042a7:	mov    DWORD PTR [r14+0xc],eax
   1400042ab:	mov    DWORD PTR [rbx+0x8],edi
   1400042ae:	call   QWORD PTR [rip+0x1e6c]        # 0x140006120
   1400042b4:	mov    r8d,eax
   1400042b7:	mov    eax,0x51eb851f
   1400042bc:	mul    r8d
   1400042bf:	shr    edx,0x5
   1400042c2:	imul   ecx,edx,0x64
   1400042c5:	sub    r8d,ecx
   1400042c8:	mov    DWORD PTR [rsp+0x78],r8d
   1400042cd:	mov    eax,DWORD PTR [rsp+0x78]
   1400042d1:	add    eax,0x5
   1400042d4:	mov    DWORD PTR [rsp+0x78],eax
   1400042d8:	mov    ecx,DWORD PTR [rsp+0x78]
   1400042dc:	call   QWORD PTR [rip+0x1e6e]        # 0x140006150
   1400042e2:	mov    DWORD PTR [rbx+0xc],esi
   1400042e5:	lea    rcx,[rbp-0x50]
   1400042e9:	mov    eax,DWORD PTR [r14+0x8]
   1400042ed:	add    DWORD PTR [r14],eax
   1400042f0:	mov    eax,DWORD PTR [r14+0x4]
   1400042f4:	add    eax,DWORD PTR [r14+0xc]
   1400042f8:	mov    DWORD PTR [r14+0x4],eax
   1400042fc:	call   QWORD PTR [rip+0x1e26]        # 0x140006128
   140004302:	mov    eax,DWORD PTR [rbx+0x8]
   140004305:	lea    rcx,[rbp-0x58]
   140004309:	add    DWORD PTR [rbx],eax
   14000430b:	mov    eax,DWORD PTR [rbx+0xc]
   14000430e:	add    DWORD PTR [rbx+0x4],eax
   140004311:	call   QWORD PTR [rip+0x1e11]        # 0x140006128
   140004317:	cmp    DWORD PTR [rip+0x4663],0xbb8        # 0x140008984
   140004321:	jge    0x140004354
   140004323:	mov    eax,DWORD PTR [rip+0x467b]        # 0x1400089a4
   140004329:	inc    r15d
   14000432c:	add    rbx,0x10
   140004330:	cmp    r15d,eax
   140004333:	jl     0x1400041e2
   140004339:	cmp    BYTE PTR [rip+0x4559],0x0        # 0x140008899
   140004340:	jne    0x14000435b
   140004342:	inc    r12d
   140004345:	add    r14,0x10
   140004349:	cmp    r12d,eax
   14000434c:	jl     0x1400041d0
   140004352:	jmp    0x14000435b
   140004354:	mov    BYTE PTR [rip+0x453e],0x1        # 0x140008899
   14000435b:	lea    rcx,[rbp-0x60]
   14000435f:	call   QWORD PTR [rip+0x1dc3]        # 0x140006128
   140004365:	mov    rcx,QWORD PTR [rsp+0x60]
   14000436a:	xor    r8d,r8d
   14000436d:	xor    edx,edx
   14000436f:	call   QWORD PTR [rip+0x1f03]        # 0x140006278
   140004375:	xor    eax,eax
   140004377:	mov    rcx,QWORD PTR [rbp+0x1050]
   14000437e:	xor    rcx,rsp
   140004381:	call   0x140004510
   140004386:	add    rsp,0x1170
   14000438d:	pop    r15
   14000438f:	pop    r14
   140004391:	pop    r12
   140004393:	pop    rdi
   140004394:	pop    rsi
   140004395:	pop    rbx
   140004396:	pop    rbp
   140004397:	ret
   140004398:	int3
   140004399:	int3
   14000439a:	int3
   14000439b:	int3
   14000439c:	int3
   14000439d:	int3
   14000439e:	int3
   14000439f:	int3
   1400043a0:	mov    QWORD PTR [rsp+0x10],rbx
   1400043a5:	mov    QWORD PTR [rsp+0x20],rsi
   1400043aa:	push   rdi
   1400043ab:	sub    rsp,0x260
   1400043b2:	mov    rax,QWORD PTR [rip+0x3c47]        # 0x140008000
   1400043b9:	xor    rax,rsp
   1400043bc:	mov    QWORD PTR [rsp+0x250],rax
   1400043c4:	mov    rdi,r8
   1400043c7:	mov    ebx,edx
   1400043c9:	mov    rsi,rcx
   1400043cc:	call   QWORD PTR [rip+0x1d4e]        # 0x140006120
   1400043d2:	mov    r9d,eax
   1400043d5:	mov    eax,0x51eb851f
   1400043da:	mul    r9d
   1400043dd:	shr    edx,0x5
   1400043e0:	imul   ecx,edx,0x64
   1400043e3:	sub    r9d,ecx
   1400043e6:	mov    DWORD PTR [rsp+0x30],r9d
   1400043eb:	mov    eax,DWORD PTR [rsp+0x30]
   1400043ef:	add    eax,0x5
   1400043f2:	mov    DWORD PTR [rsp+0x30],eax
   1400043f6:	mov    ecx,DWORD PTR [rsp+0x30]
   1400043fa:	call   QWORD PTR [rip+0x1d50]        # 0x140006150
   140004400:	lea    rax,[rsp+0x38]
   140004405:	mov    DWORD PTR [rsp+0x48],0x200
   14000440d:	mov    r9d,0x20019
   140004413:	mov    QWORD PTR [rsp+0x20],rax
   140004418:	xor    r8d,r8d
   14000441b:	lea    rdx,[rip+0x20f6]        # 0x140006518
   140004422:	mov    rcx,0xffffffff80000001
   140004429:	call   QWORD PTR [rip+0x1be1]        # 0x140006010
   14000442f:	test   eax,eax
   140004431:	jne    0x140004476
   140004433:	mov    rcx,QWORD PTR [rsp+0x38]
   140004438:	lea    rax,[rsp+0x48]
   14000443d:	mov    QWORD PTR [rsp+0x28],rax
   140004442:	lea    rdx,[rip+0x20ff]        # 0x140006548
   140004449:	lea    rax,[rsp+0x50]
   14000444e:	xor    r9d,r9d
   140004451:	xor    r8d,r8d
   140004454:	mov    QWORD PTR [rsp+0x20],rax
   140004459:	call   QWORD PTR [rip+0x1bb9]        # 0x140006018
   14000445f:	test   eax,eax
   140004461:	jne    0x14000446b
   140004463:	mov    DWORD PTR [rsp+0x30],0x1
   14000446b:	mov    rcx,QWORD PTR [rsp+0x38]
   140004470:	call   QWORD PTR [rip+0x1baa]        # 0x140006020
   140004476:	lea    rax,[rsp+0x40]
   14000447b:	mov    r9d,0x20019
   140004481:	xor    r8d,r8d
   140004484:	mov    QWORD PTR [rsp+0x20],rax
   140004489:	lea    rdx,[rip+0x2088]        # 0x140006518
   140004490:	mov    rcx,0xffffffff80000001
   140004497:	call   QWORD PTR [rip+0x1b73]        # 0x140006010
   14000449d:	test   eax,eax
   14000449f:	jne    0x1400044ac
   1400044a1:	mov    rcx,QWORD PTR [rsp+0x40]
   1400044a6:	call   QWORD PTR [rip+0x1b74]        # 0x140006020
   1400044ac:	sub    ebx,0x110
   1400044b2:	je     0x1400044d0
   1400044b4:	cmp    ebx,0x1
   1400044b7:	jne    0x1400044fa
   1400044b9:	cmp    di,bx
   1400044bc:	je     0x1400044c4
   1400044be:	cmp    di,0x2
   1400044c2:	jne    0x1400044fa
   1400044c4:	movzx  edx,di
   1400044c7:	mov    rcx,rsi
   1400044ca:	call   QWORD PTR [rip+0x1ce8]        # 0x1400061b8
   1400044d0:	mov    eax,0x1
   1400044d5:	mov    rcx,QWORD PTR [rsp+0x250]
   1400044dd:	xor    rcx,rsp
   1400044e0:	call   0x140004510
   1400044e5:	lea    r11,[rsp+0x260]
   1400044ed:	mov    rbx,QWORD PTR [r11+0x18]
   1400044f1:	mov    rsi,QWORD PTR [r11+0x28]
   1400044f5:	mov    rsp,r11
   1400044f8:	pop    rdi
   1400044f9:	ret
   1400044fa:	xor    eax,eax
   1400044fc:	jmp    0x1400044d5
   1400044fe:	int3
   1400044ff:	int3
   140004500:	int3
   140004501:	int3
   140004502:	int3
   140004503:	int3
   140004504:	int3
   140004505:	int3
   140004506:	data16 nop WORD PTR [rax+rax*1+0x0]
   140004510:	cmp    rcx,QWORD PTR [rip+0x3ae9]        # 0x140008000
   140004517:	jne    0x140004529
   140004519:	rol    rcx,0x10
   14000451d:	test   cx,0xffff
   140004522:	jne    0x140004525
   140004524:	ret
   140004525:	ror    rcx,0x10
   140004529:	jmp    0x140004564
   14000452e:	int3
   14000452f:	int3
   140004530:	rex push rbx
   140004532:	sub    rsp,0x20
   140004536:	mov    rbx,rcx
   140004539:	xor    ecx,ecx
   14000453b:	call   QWORD PTR [rip+0x1bc7]        # 0x140006108
   140004541:	mov    rcx,rbx
   140004544:	call   QWORD PTR [rip+0x1b5e]        # 0x1400060a8
   14000454a:	call   QWORD PTR [rip+0x1b60]        # 0x1400060b0
   140004550:	mov    rcx,rax
   140004553:	mov    edx,0xc0000409
   140004558:	add    rsp,0x20
   14000455c:	pop    rbx
   14000455d:	rex.W jmp QWORD PTR [rip+0x1b64]        # 0x1400060c8
   140004564:	mov    QWORD PTR [rsp+0x8],rcx
   140004569:	sub    rsp,0x38
   14000456d:	mov    ecx,0x17
   140004572:	call   QWORD PTR [rip+0x1b58]        # 0x1400060d0
   140004578:	test   eax,eax
   14000457a:	je     0x140004583
   14000457c:	mov    ecx,0x2
   140004581:	int    0x29
   140004583:	lea    rcx,[rip+0x3db6]        # 0x140008340
   14000458a:	call   0x140004638
   14000458f:	mov    rax,QWORD PTR [rsp+0x38]
   140004594:	mov    QWORD PTR [rip+0x3e9d],rax        # 0x140008438
   14000459b:	lea    rax,[rsp+0x38]
   1400045a0:	add    rax,0x8
   1400045a4:	mov    QWORD PTR [rip+0x3e2d],rax        # 0x1400083d8
   1400045ab:	mov    rax,QWORD PTR [rip+0x3e86]        # 0x140008438
   1400045b2:	mov    QWORD PTR [rip+0x3cf7],rax        # 0x1400082b0
   1400045b9:	mov    rax,QWORD PTR [rsp+0x40]
   1400045be:	mov    QWORD PTR [rip+0x3dfb],rax        # 0x1400083c0
   1400045c5:	mov    DWORD PTR [rip+0x3cd1],0xc0000409        # 0x1400082a0
   1400045cf:	mov    DWORD PTR [rip+0x3ccb],0x1        # 0x1400082a4
   1400045d9:	mov    DWORD PTR [rip+0x3cd5],0x1        # 0x1400082b8
   1400045e3:	mov    eax,0x8
   1400045e8:	imul   rax,rax,0x0
   1400045ec:	lea    rcx,[rip+0x3ccd]        # 0x1400082c0
   1400045f3:	mov    QWORD PTR [rcx+rax*1],0x2
   1400045fb:	mov    eax,0x8
   140004600:	imul   rax,rax,0x0
   140004604:	mov    rcx,QWORD PTR [rip+0x39f5]        # 0x140008000
   14000460b:	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140004610:	mov    eax,0x8
   140004615:	imul   rax,rax,0x1
   140004619:	mov    rcx,QWORD PTR [rip+0x3a20]        # 0x140008040
   140004620:	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140004625:	lea    rcx,[rip+0x1e84]        # 0x1400064b0
   14000462c:	call   0x140004530
   140004631:	nop
   140004632:	add    rsp,0x38
   140004636:	ret
   140004637:	int3
   140004638:	rex push rbx
   14000463a:	push   rsi
   14000463b:	push   rdi
   14000463c:	sub    rsp,0x40
   140004640:	mov    rbx,rcx
   140004643:	call   QWORD PTR [rip+0x1a77]        # 0x1400060c0
   140004649:	mov    rsi,QWORD PTR [rbx+0xf8]
   140004650:	xor    edi,edi
   140004652:	xor    r8d,r8d
   140004655:	lea    rdx,[rsp+0x60]
   14000465a:	mov    rcx,rsi
   14000465d:	call   QWORD PTR [rip+0x1a55]        # 0x1400060b8
   140004663:	test   rax,rax
   140004666:	je     0x1400046a4
   140004668:	mov    rdx,QWORD PTR [rsp+0x60]
   14000466d:	lea    rcx,[rsp+0x68]
   140004672:	mov    QWORD PTR [rsp+0x38],0x0
   14000467b:	mov    r9,rax
   14000467e:	mov    QWORD PTR [rsp+0x30],rcx
   140004683:	mov    r8,rsi
   140004686:	lea    rcx,[rsp+0x70]
   14000468b:	mov    QWORD PTR [rsp+0x28],rcx
   140004690:	xor    ecx,ecx
   140004692:	mov    QWORD PTR [rsp+0x20],rbx
   140004697:	call   QWORD PTR [rip+0x1abb]        # 0x140006158
   14000469d:	inc    edi
   14000469f:	cmp    edi,0x2
   1400046a2:	jl     0x140004652
   1400046a4:	add    rsp,0x40
   1400046a8:	pop    rdi
   1400046a9:	pop    rsi
   1400046aa:	pop    rbx
   1400046ab:	ret
   1400046ac:	rex push rbx
   1400046ae:	sub    rsp,0x20
   1400046b2:	mov    ecx,0x2
   1400046b7:	call   0x14000521e
   1400046bc:	call   0x140004c14
   1400046c1:	mov    ecx,eax
   1400046c3:	call   0x140005254
   1400046c8:	call   0x140004c08
   1400046cd:	mov    ebx,eax
   1400046cf:	call   0x140005278
   1400046d4:	mov    ecx,0x1
   1400046d9:	mov    DWORD PTR [rax],ebx
   1400046db:	call   0x140004990
   1400046e0:	test   al,al
   1400046e2:	je     0x140004757
   1400046e4:	call   0x140004ed8
   1400046e9:	lea    rcx,[rip+0x824]        # 0x140004f14
   1400046f0:	call   0x140004b40
   1400046f5:	call   0x140004c0c
   1400046fa:	mov    ecx,eax
   1400046fc:	call   0x14000522a
   140004701:	test   eax,eax
   140004703:	jne    0x140004757
   140004705:	call   0x140004c1c
   14000470a:	call   0x140004c58
   14000470f:	test   eax,eax
   140004711:	je     0x14000471f
   140004713:	lea    rcx,[rip+0x4ee]        # 0x140004c08
   14000471a:	call   0x140005224
   14000471f:	call   0x140004c30
   140004724:	call   0x140004c30
   140004729:	call   0x140004c08
   14000472e:	mov    ecx,eax
   140004730:	call   0x14000526c
   140004735:	call   0x140004c2c
   14000473a:	test   al,al
   14000473c:	je     0x140004743
   14000473e:	call   0x140005230
   140004743:	call   0x140004c08
   140004748:	call   0x140004e08
   14000474d:	test   eax,eax
   14000474f:	jne    0x140004757
   140004751:	add    rsp,0x20
   140004755:	pop    rbx
   140004756:	ret
   140004757:	mov    ecx,0x7
   14000475c:	call   0x140004c80
   140004761:	int3
   140004762:	int3
   140004763:	int3
   140004764:	sub    rsp,0x28
   140004768:	call   0x140004c3c
   14000476d:	xor    eax,eax
   14000476f:	add    rsp,0x28
   140004773:	ret
   140004774:	sub    rsp,0x28
   140004778:	call   0x140004e64
   14000477d:	call   0x140004c08
   140004782:	mov    ecx,eax
   140004784:	add    rsp,0x28
   140004788:	jmp    0x140005272
   14000478d:	int3
   14000478e:	int3
   14000478f:	int3
   140004790:	mov    QWORD PTR [rsp+0x8],rbx
   140004795:	push   rdi
   140004796:	sub    rsp,0x30
   14000479a:	mov    ecx,0x1
   14000479f:	call   0x140004954
   1400047a4:	test   al,al
   1400047a6:	je     0x1400048dc
   1400047ac:	xor    dil,dil
   1400047af:	mov    BYTE PTR [rsp+0x20],dil
   1400047b4:	call   0x140004918
   1400047b9:	mov    bl,al
   1400047bb:	mov    ecx,DWORD PTR [rip+0x404f]        # 0x140008810
   1400047c1:	cmp    ecx,0x1
   1400047c4:	je     0x1400048e7
   1400047ca:	test   ecx,ecx
   1400047cc:	jne    0x140004818
   1400047ce:	mov    DWORD PTR [rip+0x4038],0x1        # 0x140008810
   1400047d8:	lea    rdx,[rip+0x1ca1]        # 0x140006480
   1400047df:	lea    rcx,[rip+0x1c82]        # 0x140006468
   1400047e6:	call   0x140005242
   1400047eb:	test   eax,eax
   1400047ed:	je     0x1400047f9
   1400047ef:	mov    eax,0xff
   1400047f4:	jmp    0x1400048d1
   1400047f9:	lea    rdx,[rip+0x1c60]        # 0x140006460
   140004800:	lea    rcx,[rip+0x1c49]        # 0x140006450
   140004807:	call   0x14000523c
   14000480c:	mov    DWORD PTR [rip+0x3ffa],0x2        # 0x140008810
   140004816:	jmp    0x140004820
   140004818:	mov    dil,0x1
   14000481b:	mov    BYTE PTR [rsp+0x20],dil
   140004820:	mov    cl,bl
   140004822:	call   0x140004ab4
   140004827:	call   0x140004c64
   14000482c:	mov    rbx,rax
   14000482f:	cmp    QWORD PTR [rax],0x0
   140004833:	je     0x140004853
   140004835:	mov    rcx,rax
   140004838:	call   0x140004a1c
   14000483d:	test   al,al
   14000483f:	je     0x140004853
   140004841:	xor    r8d,r8d
   140004844:	lea    edx,[r8+0x2]
   140004848:	xor    ecx,ecx
   14000484a:	mov    rax,QWORD PTR [rbx]
   14000484d:	call   QWORD PTR [rip+0x1bd5]        # 0x140006428
   140004853:	call   0x140004c6c
   140004858:	mov    rbx,rax
   14000485b:	cmp    QWORD PTR [rax],0x0
   14000485f:	je     0x140004875
   140004861:	mov    rcx,rax
   140004864:	call   0x140004a1c
   140004869:	test   al,al
   14000486b:	je     0x140004875
   14000486d:	mov    rcx,QWORD PTR [rbx]
   140004870:	call   0x140005266
   140004875:	call   0x140004dcc
   14000487a:	movzx  ebx,ax
   14000487d:	call   0x140005236
   140004882:	mov    r9d,ebx
   140004885:	mov    r8,rax
   140004888:	xor    edx,edx
   14000488a:	lea    rcx,[rip+0xffffffffffffb76f]        # 0x140000000
   140004891:	call   0x140002360
   140004896:	mov    ebx,eax
   140004898:	call   0x140004e10
   14000489d:	test   al,al
   14000489f:	je     0x1400048f1
   1400048a1:	test   dil,dil
   1400048a4:	jne    0x1400048ab
   1400048a6:	call   0x14000525a
   1400048ab:	xor    edx,edx
   1400048ad:	mov    cl,0x1
   1400048af:	call   0x140004ad8
   1400048b4:	mov    eax,ebx
   1400048b6:	jmp    0x1400048d1
   1400048b8:	mov    ebx,eax
   1400048ba:	call   0x140004e10
   1400048bf:	test   al,al
   1400048c1:	je     0x1400048f9
   1400048c3:	cmp    BYTE PTR [rsp+0x20],0x0
   1400048c8:	jne    0x1400048cf
   1400048ca:	call   0x140005260
   1400048cf:	mov    eax,ebx
   1400048d1:	mov    rbx,QWORD PTR [rsp+0x40]
   1400048d6:	add    rsp,0x30
   1400048da:	pop    rdi
   1400048db:	ret
   1400048dc:	mov    ecx,0x7
   1400048e1:	call   0x140004c80
   1400048e6:	nop
   1400048e7:	mov    ecx,0x7
   1400048ec:	call   0x140004c80
   1400048f1:	mov    ecx,ebx
   1400048f3:	call   0x140005248
   1400048f8:	nop
   1400048f9:	mov    ecx,ebx
   1400048fb:	call   0x14000524e
   140004900:	nop
   140004901:	int3
   140004902:	int3
   140004903:	int3
   140004904:	sub    rsp,0x28
   140004908:	call   0x140004b58
   14000490d:	add    rsp,0x28
   140004911:	jmp    0x140004790
   140004916:	int3
   140004917:	int3
   140004918:	sub    rsp,0x28
   14000491c:	call   0x1400051e8
   140004921:	test   eax,eax
   140004923:	je     0x140004946
   140004925:	mov    rax,QWORD PTR gs:0x30
   14000492e:	mov    rcx,QWORD PTR [rax+0x8]
   140004932:	jmp    0x140004939
   140004934:	cmp    rcx,rax
   140004937:	je     0x14000494d
   140004939:	xor    eax,eax
   14000493b:	lock cmpxchg QWORD PTR [rip+0x3ed4],rcx        # 0x140008818
   140004944:	jne    0x140004934
   140004946:	xor    al,al
   140004948:	add    rsp,0x28
   14000494c:	ret
   14000494d:	mov    al,0x1
   14000494f:	jmp    0x140004948
   140004951:	int3
   140004952:	int3
   140004953:	int3
   140004954:	sub    rsp,0x28
   140004958:	test   ecx,ecx
   14000495a:	jne    0x140004963
   14000495c:	mov    BYTE PTR [rip+0x3ebd],0x1        # 0x140008820
   140004963:	call   0x140004f50
   140004968:	call   0x140004c2c
   14000496d:	test   al,al
   14000496f:	jne    0x140004975
   140004971:	xor    al,al
   140004973:	jmp    0x140004989
   140004975:	call   0x140004c2c
   14000497a:	test   al,al
   14000497c:	jne    0x140004987
   14000497e:	xor    ecx,ecx
   140004980:	call   0x140004c2c
   140004985:	jmp    0x140004971
   140004987:	mov    al,0x1
   140004989:	add    rsp,0x28
   14000498d:	ret
   14000498e:	int3
   14000498f:	int3
   140004990:	rex push rbx
   140004992:	sub    rsp,0x20
   140004996:	cmp    BYTE PTR [rip+0x3e84],0x0        # 0x140008821
   14000499d:	mov    ebx,ecx
   14000499f:	jne    0x140004a08
   1400049a1:	cmp    ecx,0x1
   1400049a4:	ja     0x140004a10
   1400049a6:	call   0x1400051e8
   1400049ab:	test   eax,eax
   1400049ad:	je     0x1400049d7
   1400049af:	test   ebx,ebx
   1400049b1:	jne    0x1400049d7
   1400049b3:	lea    rcx,[rip+0x3e6e]        # 0x140008828
   1400049ba:	call   0x14000527e
   1400049bf:	test   eax,eax
   1400049c1:	jne    0x1400049d3
   1400049c3:	lea    rcx,[rip+0x3e76]        # 0x140008840
   1400049ca:	call   0x14000527e
   1400049cf:	test   eax,eax
   1400049d1:	je     0x140004a01
   1400049d3:	xor    al,al
   1400049d5:	jmp    0x140004a0a
   1400049d7:	movdqa xmm0,XMMWORD PTR [rip+0x1ae1]        # 0x1400064c0
   1400049df:	or     rax,0xffffffffffffffff
   1400049e3:	movdqu XMMWORD PTR [rip+0x3e3d],xmm0        # 0x140008828
   1400049eb:	mov    QWORD PTR [rip+0x3e46],rax        # 0x140008838
   1400049f2:	movdqu XMMWORD PTR [rip+0x3e46],xmm0        # 0x140008840
   1400049fa:	mov    QWORD PTR [rip+0x3e4f],rax        # 0x140008850
   140004a01:	mov    BYTE PTR [rip+0x3e19],0x1        # 0x140008821
   140004a08:	mov    al,0x1
   140004a0a:	add    rsp,0x20
   140004a0e:	pop    rbx
   140004a0f:	ret
   140004a10:	mov    ecx,0x5
   140004a15:	call   0x140004c80
   140004a1a:	int3
   140004a1b:	int3
   140004a1c:	sub    rsp,0x18
   140004a20:	mov    r8,rcx
   140004a23:	mov    eax,0x5a4d
   140004a28:	cmp    WORD PTR [rip+0xffffffffffffb5d1],ax        # 0x140000000
   140004a2f:	jne    0x140004aa9
   140004a31:	movsxd rcx,DWORD PTR [rip+0xffffffffffffb604]        # 0x14000003c
   140004a38:	lea    rdx,[rip+0xffffffffffffb5c1]        # 0x140000000
   140004a3f:	add    rcx,rdx
   140004a42:	cmp    DWORD PTR [rcx],0x4550
   140004a48:	jne    0x140004aa9
   140004a4a:	mov    eax,0x20b
   140004a4f:	cmp    WORD PTR [rcx+0x18],ax
   140004a53:	jne    0x140004aa9
   140004a55:	sub    r8,rdx
   140004a58:	movzx  edx,WORD PTR [rcx+0x14]
   140004a5c:	add    rdx,0x18
   140004a60:	add    rdx,rcx
   140004a63:	movzx  eax,WORD PTR [rcx+0x6]
   140004a67:	lea    rcx,[rax+rax*4]
   140004a6b:	lea    r9,[rdx+rcx*8]
   140004a6f:	mov    QWORD PTR [rsp],rdx
   140004a73:	cmp    rdx,r9
   140004a76:	je     0x140004a90
   140004a78:	mov    ecx,DWORD PTR [rdx+0xc]
   140004a7b:	cmp    r8,rcx
   140004a7e:	jb     0x140004a8a
   140004a80:	mov    eax,DWORD PTR [rdx+0x8]
   140004a83:	add    eax,ecx
   140004a85:	cmp    r8,rax
   140004a88:	jb     0x140004a92
   140004a8a:	add    rdx,0x28
   140004a8e:	jmp    0x140004a6f
   140004a90:	xor    edx,edx
   140004a92:	test   rdx,rdx
   140004a95:	jne    0x140004a9b
   140004a97:	xor    al,al
   140004a99:	jmp    0x140004aaf
   140004a9b:	cmp    DWORD PTR [rdx+0x24],0x0
   140004a9f:	jge    0x140004aa5
   140004aa1:	xor    al,al
   140004aa3:	jmp    0x140004aaf
   140004aa5:	mov    al,0x1
   140004aa7:	jmp    0x140004aaf
   140004aa9:	xor    al,al
   140004aab:	jmp    0x140004aaf
   140004aad:	xor    al,al
   140004aaf:	add    rsp,0x18
   140004ab3:	ret
   140004ab4:	rex push rbx
   140004ab6:	sub    rsp,0x20
   140004aba:	mov    bl,cl
   140004abc:	call   0x1400051e8
   140004ac1:	xor    edx,edx
   140004ac3:	test   eax,eax
   140004ac5:	je     0x140004ad2
   140004ac7:	test   bl,bl
   140004ac9:	jne    0x140004ad2
   140004acb:	xchg   QWORD PTR [rip+0x3d46],rdx        # 0x140008818
   140004ad2:	add    rsp,0x20
   140004ad6:	pop    rbx
   140004ad7:	ret
   140004ad8:	rex push rbx
   140004ada:	sub    rsp,0x20
   140004ade:	cmp    BYTE PTR [rip+0x3d3b],0x0        # 0x140008820
   140004ae5:	mov    bl,cl
   140004ae7:	je     0x140004aed
   140004ae9:	test   dl,dl
   140004aeb:	jne    0x140004af9
   140004aed:	call   0x140004c2c
   140004af2:	mov    cl,bl
   140004af4:	call   0x140004c2c
   140004af9:	mov    al,0x1
   140004afb:	add    rsp,0x20
   140004aff:	pop    rbx
   140004b00:	ret
   140004b01:	int3
   140004b02:	int3
   140004b03:	int3
   140004b04:	rex push rbx
   140004b06:	sub    rsp,0x20
   140004b0a:	cmp    QWORD PTR [rip+0x3d16],0xffffffffffffffff        # 0x140008828
   140004b12:	mov    rbx,rcx
   140004b15:	jne    0x140004b1e
   140004b17:	call   0x14000528a
   140004b1c:	jmp    0x140004b2d
   140004b1e:	mov    rdx,rbx
   140004b21:	lea    rcx,[rip+0x3d00]        # 0x140008828
   140004b28:	call   0x140005284
   140004b2d:	xor    edx,edx
   140004b2f:	test   eax,eax
   140004b31:	cmove  rdx,rbx
   140004b35:	mov    rax,rdx
   140004b38:	add    rsp,0x20
   140004b3c:	pop    rbx
   140004b3d:	ret
   140004b3e:	int3
   140004b3f:	int3
   140004b40:	sub    rsp,0x28
   140004b44:	call   0x140004b04
   140004b49:	neg    rax
   140004b4c:	sbb    eax,eax
   140004b4e:	neg    eax
   140004b50:	dec    eax
   140004b52:	add    rsp,0x28
   140004b56:	ret
   140004b57:	int3
   140004b58:	mov    QWORD PTR [rsp+0x18],rbx
   140004b5d:	push   rbp
   140004b5e:	mov    rbp,rsp
   140004b61:	sub    rsp,0x30
   140004b65:	mov    rax,QWORD PTR [rip+0x3494]        # 0x140008000
   140004b6c:	movabs rbx,0x2b992ddfa232
   140004b76:	cmp    rax,rbx
   140004b79:	jne    0x140004bf2
   140004b7b:	lea    rcx,[rbp+0x10]
   140004b7f:	mov    QWORD PTR [rbp+0x10],0x0
   140004b87:	call   QWORD PTR [rip+0x155b]        # 0x1400060e8
   140004b8d:	mov    rax,QWORD PTR [rbp+0x10]
   140004b91:	mov    QWORD PTR [rbp-0x10],rax
   140004b95:	call   QWORD PTR [rip+0x1545]        # 0x1400060e0
   140004b9b:	mov    eax,eax
   140004b9d:	xor    QWORD PTR [rbp-0x10],rax
   140004ba1:	call   QWORD PTR [rip+0x1531]        # 0x1400060d8
   140004ba7:	mov    eax,eax
   140004ba9:	lea    rcx,[rbp+0x18]
   140004bad:	xor    QWORD PTR [rbp-0x10],rax
   140004bb1:	call   QWORD PTR [rip+0x1571]        # 0x140006128
   140004bb7:	mov    eax,DWORD PTR [rbp+0x18]
   140004bba:	lea    rcx,[rbp-0x10]
   140004bbe:	shl    rax,0x20
   140004bc2:	xor    rax,QWORD PTR [rbp+0x18]
   140004bc6:	xor    rax,QWORD PTR [rbp-0x10]
   140004bca:	xor    rax,rcx
   140004bcd:	movabs rcx,0xffffffffffff
   140004bd7:	and    rax,rcx
   140004bda:	movabs rcx,0x2b992ddfa233
   140004be4:	cmp    rax,rbx
   140004be7:	cmove  rax,rcx
   140004beb:	mov    QWORD PTR [rip+0x340e],rax        # 0x140008000
   140004bf2:	mov    rbx,QWORD PTR [rsp+0x50]
   140004bf7:	not    rax
   140004bfa:	mov    QWORD PTR [rip+0x343f],rax        # 0x140008040
   140004c01:	add    rsp,0x30
   140004c05:	pop    rbp
   140004c06:	ret
   140004c07:	int3
   140004c08:	xor    eax,eax
   140004c0a:	ret
   140004c0b:	int3
   140004c0c:	mov    eax,0x1
   140004c11:	ret
   140004c12:	int3
   140004c13:	int3
   140004c14:	mov    eax,0x4000
   140004c19:	ret
   140004c1a:	int3
   140004c1b:	int3
   140004c1c:	lea    rcx,[rip+0x3c3d]        # 0x140008860
   140004c23:	rex.W jmp QWORD PTR [rip+0x14c6]        # 0x1400060f0
   140004c2a:	int3
   140004c2b:	int3
   140004c2c:	mov    al,0x1
   140004c2e:	ret
   140004c2f:	int3
   140004c30:	ret    0x0
   140004c33:	int3
   140004c34:	lea    rax,[rip+0x3c35]        # 0x140008870
   140004c3b:	ret
   140004c3c:	sub    rsp,0x28
   140004c40:	call   0x140001000
   140004c45:	or     QWORD PTR [rax],0x24
   140004c49:	call   0x140004c34
   140004c4e:	or     QWORD PTR [rax],0x2
   140004c52:	add    rsp,0x28
   140004c56:	ret
   140004c57:	int3
   140004c58:	xor    eax,eax
   140004c5a:	cmp    DWORD PTR [rip+0x33ec],eax        # 0x14000804c
   140004c60:	sete   al
   140004c63:	ret
   140004c64:	lea    rax,[rip+0x41ed]        # 0x140008e58
   140004c6b:	ret
   140004c6c:	lea    rax,[rip+0x41dd]        # 0x140008e50
   140004c73:	ret
   140004c74:	mov    DWORD PTR [rip+0x3bfa],0x0        # 0x140008878
   140004c7e:	ret
   140004c7f:	int3
   140004c80:	mov    QWORD PTR [rsp+0x8],rbx
   140004c85:	push   rbp
   140004c86:	lea    rbp,[rsp-0x4c0]
   140004c8e:	sub    rsp,0x5c0
   140004c95:	mov    ebx,ecx
   140004c97:	mov    ecx,0x17
   140004c9c:	call   QWORD PTR [rip+0x142e]        # 0x1400060d0
   140004ca2:	test   eax,eax
   140004ca4:	je     0x140004caa
   140004ca6:	mov    ecx,ebx
   140004ca8:	int    0x29
   140004caa:	mov    ecx,0x3
   140004caf:	call   0x140004c74
   140004cb4:	xor    edx,edx
   140004cb6:	lea    rcx,[rbp-0x10]
   140004cba:	mov    r8d,0x4d0
   140004cc0:	call   0x140005212
   140004cc5:	lea    rcx,[rbp-0x10]
   140004cc9:	call   QWORD PTR [rip+0x13f1]        # 0x1400060c0
   140004ccf:	mov    rbx,QWORD PTR [rbp+0xe8]
   140004cd6:	lea    rdx,[rbp+0x4d8]
   140004cdd:	mov    rcx,rbx
   140004ce0:	xor    r8d,r8d
   140004ce3:	call   QWORD PTR [rip+0x13cf]        # 0x1400060b8
   140004ce9:	test   rax,rax
   140004cec:	je     0x140004d2d
   140004cee:	mov    rdx,QWORD PTR [rbp+0x4d8]
   140004cf5:	lea    rcx,[rbp+0x4e0]
   140004cfc:	mov    QWORD PTR [rsp+0x38],0x0
   140004d05:	mov    r9,rax
   140004d08:	mov    QWORD PTR [rsp+0x30],rcx
   140004d0d:	mov    r8,rbx
   140004d10:	lea    rcx,[rbp+0x4e8]
   140004d17:	mov    QWORD PTR [rsp+0x28],rcx
   140004d1c:	lea    rcx,[rbp-0x10]
   140004d20:	mov    QWORD PTR [rsp+0x20],rcx
   140004d25:	xor    ecx,ecx
   140004d27:	call   QWORD PTR [rip+0x142b]        # 0x140006158
   140004d2d:	mov    rax,QWORD PTR [rbp+0x4c8]
   140004d34:	lea    rcx,[rsp+0x50]
   140004d39:	mov    QWORD PTR [rbp+0xe8],rax
   140004d40:	xor    edx,edx
   140004d42:	lea    rax,[rbp+0x4c8]
   140004d49:	mov    r8d,0x98
   140004d4f:	add    rax,0x8
   140004d53:	mov    QWORD PTR [rbp+0x88],rax
   140004d5a:	call   0x140005212
   140004d5f:	mov    rax,QWORD PTR [rbp+0x4c8]
   140004d66:	mov    QWORD PTR [rsp+0x60],rax
   140004d6b:	mov    DWORD PTR [rsp+0x50],0x40000015
   140004d73:	mov    DWORD PTR [rsp+0x54],0x1
   140004d7b:	call   QWORD PTR [rip+0x138f]        # 0x140006110
   140004d81:	mov    ebx,eax
   140004d83:	xor    ecx,ecx
   140004d85:	lea    rax,[rsp+0x50]
   140004d8a:	mov    QWORD PTR [rsp+0x40],rax
   140004d8f:	lea    rax,[rbp-0x10]
   140004d93:	mov    QWORD PTR [rsp+0x48],rax
   140004d98:	call   QWORD PTR [rip+0x136a]        # 0x140006108
   140004d9e:	lea    rcx,[rsp+0x40]
   140004da3:	call   QWORD PTR [rip+0x12ff]        # 0x1400060a8
   140004da9:	test   eax,eax
   140004dab:	jne    0x140004dba
   140004dad:	cmp    ebx,0x1
   140004db0:	je     0x140004dba
   140004db2:	lea    ecx,[rax+0x3]
   140004db5:	call   0x140004c74
   140004dba:	mov    rbx,QWORD PTR [rsp+0x5d0]
   140004dc2:	add    rsp,0x5c0
   140004dc9:	pop    rbp
   140004dca:	ret
   140004dcb:	int3
   140004dcc:	sub    rsp,0x98
   140004dd3:	xor    edx,edx
   140004dd5:	lea    rcx,[rsp+0x20]
   140004dda:	lea    r8d,[rdx+0x68]
   140004dde:	call   0x140005212
   140004de3:	lea    rcx,[rsp+0x20]
   140004de8:	call   QWORD PTR [rip+0x130a]        # 0x1400060f8
   140004dee:	test   BYTE PTR [rsp+0x5c],0x1
   140004df3:	mov    eax,0xa
   140004df8:	cmovne ax,WORD PTR [rsp+0x60]
   140004dfe:	add    rsp,0x98
   140004e05:	ret
   140004e06:	int3
   140004e07:	int3
   140004e08:	jmp    0x140004c08
   140004e0d:	int3
   140004e0e:	int3
   140004e0f:	int3
   140004e10:	sub    rsp,0x28
   140004e14:	xor    ecx,ecx
   140004e16:	call   QWORD PTR [rip+0x12e4]        # 0x140006100
   140004e1c:	test   rax,rax
   140004e1f:	je     0x140004e5b
   140004e21:	mov    ecx,0x5a4d
   140004e26:	cmp    WORD PTR [rax],cx
   140004e29:	jne    0x140004e5b
   140004e2b:	movsxd rcx,DWORD PTR [rax+0x3c]
   140004e2f:	cmp    DWORD PTR [rcx+rax*1],0x4550
   140004e36:	jne    0x140004e5b
   140004e38:	mov    edx,0x20b
   140004e3d:	cmp    WORD PTR [rcx+rax*1+0x18],dx
   140004e42:	jne    0x140004e5b
   140004e44:	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   140004e4c:	jbe    0x140004e5b
   140004e4e:	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   140004e56:	setne  al
   140004e59:	jmp    0x140004e5d
   140004e5b:	xor    al,al
   140004e5d:	add    rsp,0x28
   140004e61:	ret
   140004e62:	int3
   140004e63:	int3
   140004e64:	lea    rcx,[rip+0x9]        # 0x140004e74
   140004e6b:	rex.W jmp QWORD PTR [rip+0x1296]        # 0x140006108
   140004e72:	int3
   140004e73:	int3
   140004e74:	mov    QWORD PTR [rsp+0x8],rbx
   140004e79:	push   rdi
   140004e7a:	sub    rsp,0x20
   140004e7e:	mov    rbx,QWORD PTR [rcx]
   140004e81:	mov    rdi,rcx
   140004e84:	cmp    DWORD PTR [rbx],0xe06d7363
   140004e8a:	jne    0x140004eb0
   140004e8c:	cmp    DWORD PTR [rbx+0x18],0x4
   140004e90:	jne    0x140004eb0
   140004e92:	mov    edx,DWORD PTR [rbx+0x20]
   140004e95:	cmp    edx,0x19930520
   140004e9b:	je     0x140004ebd
   140004e9d:	lea    eax,[rdx-0x19930521]
   140004ea3:	cmp    eax,0x1
   140004ea6:	jbe    0x140004ebd
   140004ea8:	cmp    edx,0x1994000
   140004eae:	je     0x140004ebd
   140004eb0:	mov    rbx,QWORD PTR [rsp+0x30]
   140004eb5:	xor    eax,eax
   140004eb7:	add    rsp,0x20
   140004ebb:	pop    rdi
   140004ebc:	ret
   140004ebd:	call   0x140005206
   140004ec2:	mov    QWORD PTR [rax],rbx
   140004ec5:	mov    rbx,QWORD PTR [rdi+0x8]
   140004ec9:	call   0x14000520c
   140004ece:	mov    QWORD PTR [rax],rbx
   140004ed1:	call   0x140005290
   140004ed6:	int3
   140004ed7:	int3
   140004ed8:	mov    QWORD PTR [rsp+0x8],rbx
   140004edd:	push   rdi
   140004ede:	sub    rsp,0x20
   140004ee2:	lea    rbx,[rip+0x1e07]        # 0x140006cf0
   140004ee9:	lea    rdi,[rip+0x1e00]        # 0x140006cf0
   140004ef0:	jmp    0x140004f04
   140004ef2:	mov    rax,QWORD PTR [rbx]
   140004ef5:	test   rax,rax
   140004ef8:	je     0x140004f00
   140004efa:	call   QWORD PTR [rip+0x1528]        # 0x140006428
   140004f00:	add    rbx,0x8
   140004f04:	cmp    rbx,rdi
   140004f07:	jb     0x140004ef2
   140004f09:	mov    rbx,QWORD PTR [rsp+0x30]
   140004f0e:	add    rsp,0x20
   140004f12:	pop    rdi
   140004f13:	ret
   140004f14:	mov    QWORD PTR [rsp+0x8],rbx
   140004f19:	push   rdi
   140004f1a:	sub    rsp,0x20
   140004f1e:	lea    rbx,[rip+0x1ddb]        # 0x140006d00
   140004f25:	lea    rdi,[rip+0x1dd4]        # 0x140006d00
   140004f2c:	jmp    0x140004f40
   140004f2e:	mov    rax,QWORD PTR [rbx]
   140004f31:	test   rax,rax
   140004f34:	je     0x140004f3c
   140004f36:	call   QWORD PTR [rip+0x14ec]        # 0x140006428
   140004f3c:	add    rbx,0x8
   140004f40:	cmp    rbx,rdi
   140004f43:	jb     0x140004f2e
   140004f45:	mov    rbx,QWORD PTR [rsp+0x30]
   140004f4a:	add    rsp,0x20
   140004f4e:	pop    rdi
   140004f4f:	ret
   140004f50:	mov    QWORD PTR [rsp+0x10],rbx
   140004f55:	mov    QWORD PTR [rsp+0x18],rbp
   140004f5a:	mov    QWORD PTR [rsp+0x20],rsi
   140004f5f:	push   rdi
   140004f60:	sub    rsp,0x10
   140004f64:	xor    eax,eax
   140004f66:	xor    ecx,ecx
   140004f68:	cpuid
   140004f6a:	xor    ecx,0x6c65746e
   140004f70:	xor    edx,0x49656e69
   140004f76:	or     edx,ecx
   140004f78:	mov    ebp,eax
   140004f7a:	mov    eax,0x1
   140004f7f:	xor    ebx,0x756e6547
   140004f85:	or     edx,ebx
   140004f87:	lea    ecx,[rax-0x1]
   140004f8a:	cpuid
   140004f8c:	mov    edi,ecx
   140004f8e:	jne    0x140004fee
   140004f90:	and    eax,0xfff3ff0
   140004f95:	mov    QWORD PTR [rip+0x30c0],0x8000        # 0x140008060
   140004fa0:	mov    QWORD PTR [rip+0x30bd],0xffffffffffffffff        # 0x140008068
   140004fab:	cmp    eax,0x106c0
   140004fb0:	je     0x140004fda
   140004fb2:	cmp    eax,0x20660
   140004fb7:	je     0x140004fda
   140004fb9:	cmp    eax,0x20670
   140004fbe:	je     0x140004fda
   140004fc0:	add    eax,0xfffcf9b0
   140004fc5:	cmp    eax,0x20
   140004fc8:	ja     0x140004fee
   140004fca:	movabs rcx,0x100010001
   140004fd4:	bt     rcx,rax
   140004fd8:	jae    0x140004fee
   140004fda:	mov    r8d,DWORD PTR [rip+0x389f]        # 0x140008880
   140004fe1:	or     r8d,0x1
   140004fe5:	mov    DWORD PTR [rip+0x3894],r8d        # 0x140008880
   140004fec:	jmp    0x140004ff5
   140004fee:	mov    r8d,DWORD PTR [rip+0x388b]        # 0x140008880
   140004ff5:	xor    r9d,r9d
   140004ff8:	mov    esi,r9d
   140004ffb:	mov    r10d,r9d
   140004ffe:	mov    r11d,r9d
   140005001:	cmp    ebp,0x7
   140005004:	jl     0x140005046
   140005006:	lea    eax,[r9+0x7]
   14000500a:	xor    ecx,ecx
   14000500c:	cpuid
   14000500e:	mov    esi,edx
   140005010:	mov    r9d,ebx
   140005013:	bt     ebx,0x9
   140005017:	jae    0x140005024
   140005019:	or     r8d,0x2
   14000501d:	mov    DWORD PTR [rip+0x385c],r8d        # 0x140008880
   140005024:	cmp    eax,0x1
   140005027:	jl     0x140005036
   140005029:	mov    eax,0x7
   14000502e:	lea    ecx,[rax-0x6]
   140005031:	cpuid
   140005033:	mov    r10d,edx
   140005036:	mov    eax,0x24
   14000503b:	cmp    ebp,eax
   14000503d:	jl     0x140005046
   14000503f:	xor    ecx,ecx
   140005041:	cpuid
   140005043:	mov    r11d,ebx
   140005046:	mov    rax,QWORD PTR [rip+0x3003]        # 0x140008050
   14000504d:	and    rax,0xfffffffffffffffe
   140005051:	mov    DWORD PTR [rip+0x2ffd],0x1        # 0x140008058
   14000505b:	mov    DWORD PTR [rip+0x2ff7],0x2        # 0x14000805c
   140005065:	mov    QWORD PTR [rip+0x2fe4],rax        # 0x140008050
   14000506c:	bt     edi,0x14
   140005070:	jae    0x140005091
   140005072:	and    rax,0xffffffffffffffef
   140005076:	mov    DWORD PTR [rip+0x2fd8],0x2        # 0x140008058
   140005080:	mov    QWORD PTR [rip+0x2fc9],rax        # 0x140008050
   140005087:	mov    DWORD PTR [rip+0x2fcb],0x6        # 0x14000805c
   140005091:	bt     edi,0x1b
   140005095:	jae    0x1400051ce
   14000509b:	xor    ecx,ecx
   14000509d:	xgetbv
   1400050a0:	shl    rdx,0x20
   1400050a4:	or     rdx,rax
   1400050a7:	mov    QWORD PTR [rsp+0x20],rdx
   1400050ac:	bt     edi,0x1c
   1400050b0:	jae    0x1400051b2
   1400050b6:	mov    rax,QWORD PTR [rsp+0x20]
   1400050bb:	and    al,0x6
   1400050bd:	cmp    al,0x6
   1400050bf:	jne    0x1400051b2
   1400050c5:	mov    eax,DWORD PTR [rip+0x2f91]        # 0x14000805c
   1400050cb:	mov    dl,0xe0
   1400050cd:	or     eax,0x8
   1400050d0:	mov    DWORD PTR [rip+0x2f7e],0x3        # 0x140008058
   1400050da:	mov    DWORD PTR [rip+0x2f7c],eax        # 0x14000805c
   1400050e0:	test   r9b,0x20
   1400050e4:	je     0x140005148
   1400050e6:	or     eax,0x20
   1400050e9:	mov    DWORD PTR [rip+0x2f65],0x5        # 0x140008058
   1400050f3:	mov    DWORD PTR [rip+0x2f63],eax        # 0x14000805c
   1400050f9:	mov    ecx,0xd0030000
   1400050fe:	mov    rax,QWORD PTR [rip+0x2f4b]        # 0x140008050
   140005105:	and    r9d,ecx
   140005108:	and    rax,0xfffffffffffffffd
   14000510c:	mov    QWORD PTR [rip+0x2f3d],rax        # 0x140008050
   140005113:	cmp    r9d,ecx
   140005116:	jne    0x14000514f
   140005118:	mov    rax,QWORD PTR [rsp+0x20]
   14000511d:	and    al,dl
   14000511f:	cmp    al,dl
   140005121:	jne    0x140005148
   140005123:	mov    rax,QWORD PTR [rip+0x2f26]        # 0x140008050
   14000512a:	or     DWORD PTR [rip+0x2f2b],0x40        # 0x14000805c
   140005131:	and    rax,0xffffffffffffffdb
   140005135:	mov    DWORD PTR [rip+0x2f19],0x6        # 0x140008058
   14000513f:	mov    QWORD PTR [rip+0x2f0a],rax        # 0x140008050
   140005146:	jmp    0x14000514f
   140005148:	mov    rax,QWORD PTR [rip+0x2f01]        # 0x140008050
   14000514f:	bt     esi,0x17
   140005153:	jae    0x140005161
   140005155:	btr    rax,0x18
   14000515a:	mov    QWORD PTR [rip+0x2eef],rax        # 0x140008050
   140005161:	bt     r10d,0x13
   140005166:	jae    0x1400051b2
   140005168:	mov    rax,QWORD PTR [rsp+0x20]
   14000516d:	and    al,dl
   14000516f:	cmp    al,dl
   140005171:	jne    0x1400051b2
   140005173:	mov    ecx,r11d
   140005176:	mov    eax,r11d
   140005179:	shr    rcx,0x10
   14000517d:	and    eax,0x400ff
   140005182:	and    ecx,0x6
   140005185:	mov    DWORD PTR [rip+0x36f1],eax        # 0x14000887c
   14000518b:	or     rcx,0x1000029
   140005192:	not    rcx
   140005195:	and    rcx,QWORD PTR [rip+0x2eb4]        # 0x140008050
   14000519c:	mov    QWORD PTR [rip+0x2ead],rcx        # 0x140008050
   1400051a3:	cmp    al,0x1
   1400051a5:	jbe    0x1400051b2
   1400051a7:	and    rcx,0xffffffffffffffbf
   1400051ab:	mov    QWORD PTR [rip+0x2e9e],rcx        # 0x140008050
   1400051b2:	bt     r10d,0x15
   1400051b7:	jae    0x1400051ce
   1400051b9:	mov    rax,QWORD PTR [rsp+0x20]
   1400051be:	bt     rax,0x13
   1400051c3:	jae    0x1400051ce
   1400051c5:	btr    QWORD PTR [rip+0x2e82],0x7        # 0x140008050
   1400051ce:	mov    rbx,QWORD PTR [rsp+0x28]
   1400051d3:	xor    eax,eax
   1400051d5:	mov    rbp,QWORD PTR [rsp+0x30]
   1400051da:	mov    rsi,QWORD PTR [rsp+0x38]
   1400051df:	add    rsp,0x10
   1400051e3:	pop    rdi
   1400051e4:	ret
   1400051e5:	int3
   1400051e6:	int3
   1400051e7:	int3
   1400051e8:	xor    eax,eax
   1400051ea:	cmp    DWORD PTR [rip+0x2e80],eax        # 0x140008070
   1400051f0:	setne  al
   1400051f3:	ret
   1400051f4:	int3
   1400051f5:	int3
   1400051f6:	int3
   1400051f7:	int3
   1400051f8:	int3
   1400051f9:	int3
   1400051fa:	int3
   1400051fb:	int3
   1400051fc:	int3
   1400051fd:	int3
   1400051fe:	int3
   1400051ff:	int3
   140005200:	jmp    QWORD PTR [rip+0x10a2]        # 0x1400062a8
   140005206:	jmp    QWORD PTR [rip+0x1094]        # 0x1400062a0
   14000520c:	jmp    QWORD PTR [rip+0x10a6]        # 0x1400062b8
   140005212:	jmp    QWORD PTR [rip+0x10a8]        # 0x1400062c0
   140005218:	jmp    QWORD PTR [rip+0x116a]        # 0x140006388
   14000521e:	jmp    QWORD PTR [rip+0x116c]        # 0x140006390
   140005224:	jmp    QWORD PTR [rip+0x10ee]        # 0x140006318
   14000522a:	jmp    QWORD PTR [rip+0x1170]        # 0x1400063a0
   140005230:	jmp    QWORD PTR [rip+0x114a]        # 0x140006380
   140005236:	jmp    QWORD PTR [rip+0x112c]        # 0x140006368
   14000523c:	jmp    QWORD PTR [rip+0x112e]        # 0x140006370
   140005242:	jmp    QWORD PTR [rip+0x10f8]        # 0x140006340
   140005248:	jmp    QWORD PTR [rip+0x10ea]        # 0x140006338
   14000524e:	jmp    QWORD PTR [rip+0x10dc]        # 0x140006330
   140005254:	jmp    QWORD PTR [rip+0x1156]        # 0x1400063b0
   14000525a:	jmp    QWORD PTR [rip+0x10c8]        # 0x140006328
   140005260:	jmp    QWORD PTR [rip+0x1132]        # 0x140006398
   140005266:	jmp    QWORD PTR [rip+0x10dc]        # 0x140006348
   14000526c:	jmp    QWORD PTR [rip+0x1096]        # 0x140006308
   140005272:	jmp    QWORD PTR [rip+0x1080]        # 0x1400062f8
   140005278:	jmp    QWORD PTR [rip+0x113a]        # 0x1400063b8
   14000527e:	jmp    QWORD PTR [rip+0x10f4]        # 0x140006378
   140005284:	jmp    QWORD PTR [rip+0x10c6]        # 0x140006350
   14000528a:	jmp    QWORD PTR [rip+0x10c8]        # 0x140006358
   140005290:	jmp    QWORD PTR [rip+0x10ca]        # 0x140006360
   140005296:	int3
   140005297:	int3
   140005298:	sub    rsp,0x28
   14000529c:	mov    r8,QWORD PTR [r9+0x38]
   1400052a0:	mov    rcx,rdx
   1400052a3:	mov    rdx,r9
   1400052a6:	call   0x1400052b8
   1400052ab:	mov    eax,0x1
   1400052b0:	add    rsp,0x28
   1400052b4:	ret
   1400052b5:	int3
   1400052b6:	int3
   1400052b7:	int3
   1400052b8:	rex push rbx
   1400052ba:	mov    r11d,DWORD PTR [r8]
   1400052bd:	mov    rbx,rdx
   1400052c0:	and    r11d,0xfffffff8
   1400052c4:	mov    r9,rcx
   1400052c7:	test   BYTE PTR [r8],0x4
   1400052cb:	mov    r10,rcx
   1400052ce:	je     0x1400052e3
   1400052d0:	mov    eax,DWORD PTR [r8+0x8]
   1400052d4:	movsxd r10,DWORD PTR [r8+0x4]
   1400052d8:	neg    eax
   1400052da:	add    r10,rcx
   1400052dd:	movsxd rcx,eax
   1400052e0:	and    r10,rcx
   1400052e3:	movsxd rax,r11d
   1400052e6:	mov    rdx,QWORD PTR [rax+r10*1]
   1400052ea:	mov    rax,QWORD PTR [rbx+0x10]
   1400052ee:	mov    ecx,DWORD PTR [rax+0x8]
   1400052f1:	mov    rax,QWORD PTR [rbx+0x8]
   1400052f5:	test   BYTE PTR [rcx+rax*1+0x3],0xf
   1400052fa:	je     0x14000530c
   1400052fc:	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140005301:	mov    ecx,0xfffffff0
   140005306:	and    rax,rcx
   140005309:	add    r9,rax
   14000530c:	xor    r9,rdx
   14000530f:	mov    rcx,r9
   140005312:	pop    rbx
   140005313:	jmp    0x140004510
   140005318:	int3
   140005319:	int3
   14000531a:	int3
   14000531b:	int3
   14000531c:	int3
   14000531d:	int3
   14000531e:	int3
   14000531f:	int3
   140005320:	int3
   140005321:	int3
   140005322:	int3
   140005323:	int3
   140005324:	int3
   140005325:	int3
   140005326:	data16 nop WORD PTR [rax+rax*1+0x0]
   140005330:	sub    rsp,0x10
   140005334:	mov    QWORD PTR [rsp],r10
   140005338:	mov    QWORD PTR [rsp+0x8],r11
   14000533d:	xor    r11,r11
   140005340:	lea    r10,[rsp+0x18]
   140005345:	sub    r10,rax
   140005348:	cmovb  r10,r11
   14000534c:	mov    r11,QWORD PTR gs:0x10
   140005355:	cmp    r10,r11
   140005358:	jae    0x140005370
   14000535a:	and    r10w,0xf000
   140005360:	lea    r11,[r11-0x1000]
   140005367:	mov    BYTE PTR [r11],0x0
   14000536b:	cmp    r10,r11
   14000536e:	jne    0x140005360
   140005370:	mov    r10,QWORD PTR [rsp]
   140005374:	mov    r11,QWORD PTR [rsp+0x8]
   140005379:	add    rsp,0x10
   14000537d:	ret
   14000537e:	jmp    QWORD PTR [rip+0xf44]        # 0x1400062c8
   140005384:	int3
   140005385:	int3
   140005386:	int3
   140005387:	int3
   140005388:	int3
   140005389:	int3
   14000538a:	int3
   14000538b:	int3
   14000538c:	int3
   14000538d:	int3
   14000538e:	int3
   14000538f:	int3
   140005390:	int3
   140005391:	int3
   140005392:	int3
   140005393:	int3
   140005394:	int3
   140005395:	int3
   140005396:	data16 nop WORD PTR [rax+rax*1+0x0]
   1400053a0:	jmp    rax
   1400053a2:	int3
   1400053a3:	int3
   1400053a4:	int3
   1400053a5:	int3
   1400053a6:	int3
   1400053a7:	int3
   1400053a8:	int3
   1400053a9:	int3
   1400053aa:	int3
   1400053ab:	int3
   1400053ac:	int3
   1400053ad:	int3
   1400053ae:	int3
   1400053af:	int3
   1400053b0:	int3
   1400053b1:	int3
   1400053b2:	int3
   1400053b3:	int3
   1400053b4:	int3
   1400053b5:	int3
   1400053b6:	data16 nop WORD PTR [rax+rax*1+0x0]
   1400053c0:	jmp    QWORD PTR [rip+0x1062]        # 0x140006428
   1400053c6:	rex push rbp
   1400053c8:	sub    rsp,0x20
   1400053cc:	mov    rbp,rdx
   1400053cf:	mov    rdx,rcx
   1400053d2:	mov    rcx,QWORD PTR [rcx]
   1400053d5:	mov    ecx,DWORD PTR [rcx]
   1400053d7:	call   0x140005218
   1400053dc:	nop
   1400053dd:	add    rsp,0x20
   1400053e1:	pop    rbp
   1400053e2:	ret
   1400053e3:	int3
   1400053e4:	rex push rbp
   1400053e6:	mov    rbp,rdx
   1400053e9:	mov    rax,QWORD PTR [rcx]
   1400053ec:	xor    ecx,ecx
   1400053ee:	cmp    DWORD PTR [rax],0xc0000005
   1400053f4:	sete   cl
   1400053f7:	mov    eax,ecx
   1400053f9:	pop    rbp
   1400053fa:	ret
   1400053fb:	int3
