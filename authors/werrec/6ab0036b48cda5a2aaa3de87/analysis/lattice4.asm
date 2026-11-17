
lattice4.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	push   rbp
   140001001:	mov    rbp,rsp
   140001004:	mov    QWORD PTR [rbp+0x10],rcx
   140001008:	mov    QWORD PTR [rbp+0x18],rdx
   14000100c:	mov    QWORD PTR [rbp+0x20],r8
   140001010:	mov    DWORD PTR [rbp+0x28],r9d
   140001014:	nop
   140001015:	pop    rbp
   140001016:	ret
   140001017:	push   rbp
   140001018:	mov    rbp,rsp
   14000101b:	sub    rsp,0x20
   14000101f:	mov    ecx,0x0
   140001024:	call   0x140003780
   140001029:	nop
   14000102a:	add    rsp,0x20
   14000102e:	pop    rbp
   14000102f:	ret
   140001030:	push   rbp
   140001031:	mov    rbp,rsp
   140001034:	sub    rsp,0x30
   140001038:	mov    DWORD PTR [rbp-0x4],0xff
   14000103f:	mov    rax,QWORD PTR [rip+0x495a]        # 0x1400059a0
   140001046:	mov    DWORD PTR [rax],0x1
   14000104c:	call   0x14000108e
   140001051:	mov    DWORD PTR [rbp-0x4],eax
   140001054:	nop
   140001055:	nop
   140001056:	mov    eax,DWORD PTR [rbp-0x4]
   140001059:	add    rsp,0x30
   14000105d:	pop    rbp
   14000105e:	ret
   14000105f:	push   rbp
   140001060:	mov    rbp,rsp
   140001063:	sub    rsp,0x30
   140001067:	mov    DWORD PTR [rbp-0x4],0xff
   14000106e:	mov    rax,QWORD PTR [rip+0x492b]        # 0x1400059a0
   140001075:	mov    DWORD PTR [rax],0x0
   14000107b:	call   0x14000108e
   140001080:	mov    DWORD PTR [rbp-0x4],eax
   140001083:	nop
   140001084:	nop
   140001085:	mov    eax,DWORD PTR [rbp-0x4]
   140001088:	add    rsp,0x30
   14000108c:	pop    rbp
   14000108d:	ret
   14000108e:	push   rbp
   14000108f:	mov    rbp,rsp
   140001092:	sub    rsp,0x90
   140001099:	mov    QWORD PTR [rbp-0x10],0x0
   1400010a1:	mov    DWORD PTR [rbp-0x20],0x30
   1400010a8:	mov    eax,DWORD PTR [rbp-0x20]
   1400010ab:	mov    rax,QWORD PTR gs:[eax]
   1400010b0:	mov    QWORD PTR [rbp-0x28],rax
   1400010b4:	mov    rax,QWORD PTR [rbp-0x28]
   1400010b8:	mov    rax,QWORD PTR [rax+0x8]
   1400010bc:	mov    QWORD PTR [rbp-0x18],rax
   1400010c0:	mov    DWORD PTR [rbp-0x4],0x0
   1400010c7:	mov    DWORD PTR [rbp-0x1c],0x0
   1400010ce:	jmp    0x1400010f1
   1400010d0:	mov    rax,QWORD PTR [rbp-0x10]
   1400010d4:	cmp    rax,QWORD PTR [rbp-0x18]
   1400010d8:	jne    0x1400010e3
   1400010da:	mov    DWORD PTR [rbp-0x4],0x1
   1400010e1:	jmp    0x140001128
   1400010e3:	mov    ecx,0x3e8
   1400010e8:	mov    rax,QWORD PTR [rip+0x92b9]        # 0x14000a3a8
   1400010ef:	call   rax
   1400010f1:	mov    rax,QWORD PTR [rip+0x48f8]        # 0x1400059f0
   1400010f8:	mov    QWORD PTR [rbp-0x30],rax
   1400010fc:	mov    rax,QWORD PTR [rbp-0x18]
   140001100:	mov    QWORD PTR [rbp-0x38],rax
   140001104:	mov    QWORD PTR [rbp-0x40],0x0
   14000110c:	mov    rcx,QWORD PTR [rbp-0x38]
   140001110:	mov    rax,QWORD PTR [rbp-0x40]
   140001114:	mov    rdx,QWORD PTR [rbp-0x30]
   140001118:	lock cmpxchg QWORD PTR [rdx],rcx
   14000111d:	mov    QWORD PTR [rbp-0x10],rax
   140001121:	cmp    QWORD PTR [rbp-0x10],0x0
   140001126:	jne    0x1400010d0
   140001128:	mov    rax,QWORD PTR [rip+0x48d1]        # 0x140005a00
   14000112f:	mov    eax,DWORD PTR [rax]
   140001131:	cmp    eax,0x1
   140001134:	jne    0x140001140
   140001136:	mov    ecx,0x1f
   14000113b:	call   0x140003690
   140001140:	mov    rax,QWORD PTR [rip+0x48b9]        # 0x140005a00
   140001147:	mov    eax,DWORD PTR [rax]
   140001149:	test   eax,eax
   14000114b:	jne    0x140001334
   140001151:	mov    rax,QWORD PTR [rip+0x48a8]        # 0x140005a00
   140001158:	mov    DWORD PTR [rax],0x1
   14000115e:	mov    ecx,0x2
   140001163:	call   0x140003760
   140001168:	mov    r9d,0x0
   14000116e:	mov    r8d,0x4
   140001174:	mov    edx,0x0
   140001179:	mov    rcx,rax
   14000117c:	call   0x1400037a8
   140001181:	lea    rax,[rip+0xfffffffffffffe8f]        # 0x140001017
   140001188:	mov    rcx,rax
   14000118b:	call   0x14000162f
   140001190:	test   eax,eax
   140001192:	je     0x140001199
   140001194:	call   0x140003808
   140001199:	call   0x140002740
   14000119e:	mov    rax,QWORD PTR [rip+0x48db]        # 0x140005a80
   1400011a5:	mov    rcx,rax
   1400011a8:	mov    rax,QWORD PTR [rip+0x91f1]        # 0x14000a3a0
   1400011af:	call   rax
   1400011b1:	mov    rdx,QWORD PTR [rip+0x4828]        # 0x1400059e0
   1400011b8:	mov    QWORD PTR [rdx],rax
   1400011bb:	lea    rax,[rip+0xfffffffffffffe3e]        # 0x140001000
   1400011c2:	mov    rcx,rax
   1400011c5:	call   0x140003800
   1400011ca:	call   0x140003050
   1400011cf:	call   0x1400013ec
   1400011d4:	mov    DWORD PTR [rip+0x7e3e],eax        # 0x140009018
   1400011da:	mov    rax,QWORD PTR [rip+0x47bf]        # 0x1400059a0
   1400011e1:	mov    eax,DWORD PTR [rax]
   1400011e3:	test   eax,eax
   1400011e5:	je     0x1400011f3
   1400011e7:	mov    ecx,0x2
   1400011ec:	call   0x1400037e8
   1400011f1:	jmp    0x1400011fd
   1400011f3:	mov    ecx,0x1
   1400011f8:	call   0x1400037e8
   1400011fd:	call   0x140003770
   140001202:	mov    rdx,QWORD PTR [rip+0x4867]        # 0x140005a70
   140001209:	mov    edx,DWORD PTR [rdx]
   14000120b:	mov    DWORD PTR [rax],edx
   14000120d:	call   0x140003768
   140001212:	mov    rdx,QWORD PTR [rip+0x4837]        # 0x140005a50
   140001219:	mov    edx,DWORD PTR [rdx]
   14000121b:	mov    DWORD PTR [rax],edx
   14000121d:	call   0x140001d20
   140001222:	mov    DWORD PTR [rbp-0x1c],eax
   140001225:	cmp    DWORD PTR [rbp-0x1c],0x0
   140001229:	jns    0x140001235
   14000122b:	mov    ecx,0x8
   140001230:	call   0x140003690
   140001235:	mov    rax,QWORD PTR [rip+0x46e4]        # 0x140005920
   14000123c:	mov    eax,DWORD PTR [rax]
   14000123e:	cmp    eax,0x1
   140001241:	jne    0x140001252
   140001243:	mov    rax,QWORD PTR [rip+0x4846]        # 0x140005a90
   14000124a:	mov    rcx,rax
   14000124d:	call   0x14000285a
   140001252:	mov    rax,QWORD PTR [rip+0x4727]        # 0x140005980
   140001259:	mov    eax,DWORD PTR [rax]
   14000125b:	cmp    eax,0xffffffff
   14000125e:	jne    0x14000126a
   140001260:	mov    ecx,0xffffffff
   140001265:	call   0x140003840
   14000126a:	mov    rdx,QWORD PTR [rip+0x47cf]        # 0x140005a40
   140001271:	mov    rax,QWORD PTR [rip+0x47b8]        # 0x140005a30
   140001278:	mov    rcx,rax
   14000127b:	call   0x1400037f8
   140001280:	test   eax,eax
   140001282:	je     0x14000128e
   140001284:	mov    ecx,0xa
   140001289:	call   0x140003690
   14000128e:	mov    rax,QWORD PTR [rip+0x480b]        # 0x140005aa0
   140001295:	mov    eax,DWORD PTR [rax]
   140001297:	mov    DWORD PTR [rbp-0x54],eax
   14000129a:	mov    rax,QWORD PTR [rip+0x47bf]        # 0x140005a60
   1400012a1:	mov    r8d,DWORD PTR [rax]
   1400012a4:	lea    r10,[rip+0x7d65]        # 0x140009010
   1400012ab:	lea    rdx,[rip+0x7d56]        # 0x140009008
   1400012b2:	lea    rax,[rip+0x7d4b]        # 0x140009004
   1400012b9:	lea    rcx,[rbp-0x54]
   1400012bd:	mov    QWORD PTR [rsp+0x20],rcx
   1400012c2:	mov    r9d,r8d
   1400012c5:	mov    r8,r10
   1400012c8:	mov    rcx,rax
   1400012cb:	call   0x1400036d0
   1400012d0:	mov    DWORD PTR [rbp-0x1c],eax
   1400012d3:	cmp    DWORD PTR [rbp-0x1c],0x0
   1400012d7:	jns    0x1400012e3
   1400012d9:	mov    ecx,0x8
   1400012de:	call   0x140003690
   1400012e3:	mov    eax,DWORD PTR [rip+0x7d1b]        # 0x140009004
   1400012e9:	lea    rdx,[rip+0x7d18]        # 0x140009008
   1400012f0:	mov    ecx,eax
   1400012f2:	call   0x1400014f0
   1400012f7:	mov    DWORD PTR [rbp-0x1c],eax
   1400012fa:	cmp    DWORD PTR [rbp-0x1c],0x0
   1400012fe:	je     0x14000130a
   140001300:	mov    ecx,0x8
   140001305:	call   0x140003690
   14000130a:	mov    rdx,QWORD PTR [rip+0x470f]        # 0x140005a20
   140001311:	mov    rax,QWORD PTR [rip+0x46f8]        # 0x140005a10
   140001318:	mov    rcx,rax
   14000131b:	call   0x1400037f0
   140001320:	call   0x140001cf7
   140001325:	mov    rax,QWORD PTR [rip+0x46d4]        # 0x140005a00
   14000132c:	mov    DWORD PTR [rax],0x2
   140001332:	jmp    0x14000133e
   140001334:	mov    DWORD PTR [rip+0x7cde],0x1        # 0x14000901c
   14000133e:	cmp    DWORD PTR [rbp-0x4],0x0
   140001342:	jne    0x140001362
   140001344:	mov    rax,QWORD PTR [rip+0x46a5]        # 0x1400059f0
   14000134b:	mov    QWORD PTR [rbp-0x48],rax
   14000134f:	mov    QWORD PTR [rbp-0x50],0x0
   140001357:	mov    rdx,QWORD PTR [rbp-0x50]
   14000135b:	mov    rax,QWORD PTR [rbp-0x48]
   14000135f:	xchg   QWORD PTR [rax],rdx
   140001362:	mov    rax,QWORD PTR [rip+0x4607]        # 0x140005970
   140001369:	mov    rax,QWORD PTR [rax]
   14000136c:	test   rax,rax
   14000136f:	je     0x14000138d
   140001371:	mov    rax,QWORD PTR [rip+0x45f8]        # 0x140005970
   140001378:	mov    rax,QWORD PTR [rax]
   14000137b:	mov    r8d,0x0
   140001381:	mov    edx,0x2
   140001386:	mov    ecx,0x0
   14000138b:	call   rax
   14000138d:	call   0x140003680
   140001392:	mov    rdx,QWORD PTR [rip+0x7c77]        # 0x140009010
   140001399:	mov    QWORD PTR [rax],rdx
   14000139c:	mov    rcx,QWORD PTR [rip+0x7c6d]        # 0x140009010
   1400013a3:	mov    rdx,QWORD PTR [rip+0x7c5e]        # 0x140009008
   1400013aa:	mov    eax,DWORD PTR [rip+0x7c54]        # 0x140009004
   1400013b0:	mov    r8,rcx
   1400013b3:	mov    ecx,eax
   1400013b5:	call   0x1400039c0
   1400013ba:	mov    DWORD PTR [rbp-0x1c],eax
   1400013bd:	mov    eax,DWORD PTR [rip+0x7c55]        # 0x140009018
   1400013c3:	test   eax,eax
   1400013c5:	jne    0x1400013d1
   1400013c7:	mov    eax,DWORD PTR [rbp-0x1c]
   1400013ca:	mov    ecx,eax
   1400013cc:	call   0x140003810
   1400013d1:	mov    eax,DWORD PTR [rip+0x7c45]        # 0x14000901c
   1400013d7:	test   eax,eax
   1400013d9:	jne    0x1400013e0
   1400013db:	call   0x1400037c0
   1400013e0:	mov    eax,DWORD PTR [rbp-0x1c]
   1400013e3:	add    rsp,0x90
   1400013ea:	pop    rbp
   1400013eb:	ret
   1400013ec:	push   rbp
   1400013ed:	mov    rbp,rsp
   1400013f0:	sub    rsp,0x20
   1400013f4:	mov    rax,QWORD PTR [rip+0x45b5]        # 0x1400059b0
   1400013fb:	mov    DWORD PTR [rax],0x1
   140001401:	mov    rax,QWORD PTR [rip+0x45b8]        # 0x1400059c0
   140001408:	mov    DWORD PTR [rax],0x1
   14000140e:	mov    rax,QWORD PTR [rip+0x45bb]        # 0x1400059d0
   140001415:	mov    DWORD PTR [rax],0x1
   14000141b:	mov    rax,QWORD PTR [rip+0x451e]        # 0x140005940
   140001422:	mov    QWORD PTR [rbp-0x8],rax
   140001426:	mov    rax,QWORD PTR [rbp-0x8]
   14000142a:	movzx  eax,WORD PTR [rax]
   14000142d:	cmp    ax,0x5a4d
   140001431:	je     0x14000143d
   140001433:	mov    eax,0x0
   140001438:	jmp    0x1400014ea
   14000143d:	mov    rax,QWORD PTR [rbp-0x8]
   140001441:	mov    eax,DWORD PTR [rax+0x3c]
   140001444:	movsxd rdx,eax
   140001447:	mov    rax,QWORD PTR [rbp-0x8]
   14000144b:	add    rax,rdx
   14000144e:	mov    QWORD PTR [rbp-0x10],rax
   140001452:	mov    rax,QWORD PTR [rbp-0x10]
   140001456:	mov    eax,DWORD PTR [rax]
   140001458:	cmp    eax,0x4550
   14000145d:	je     0x140001469
   14000145f:	mov    eax,0x0
   140001464:	jmp    0x1400014ea
   140001469:	mov    rax,QWORD PTR [rbp-0x10]
   14000146d:	add    rax,0x18
   140001471:	mov    QWORD PTR [rbp-0x18],rax
   140001475:	mov    rax,QWORD PTR [rbp-0x18]
   140001479:	movzx  eax,WORD PTR [rax]
   14000147c:	movzx  eax,ax
   14000147f:	cmp    eax,0x10b
   140001484:	je     0x14000148f
   140001486:	cmp    eax,0x20b
   14000148b:	je     0x1400014b6
   14000148d:	jmp    0x1400014e5
   14000148f:	mov    rax,QWORD PTR [rbp-0x18]
   140001493:	mov    eax,DWORD PTR [rax+0x5c]
   140001496:	cmp    eax,0xe
   140001499:	ja     0x1400014a2
   14000149b:	mov    eax,0x0
   1400014a0:	jmp    0x1400014ea
   1400014a2:	mov    rax,QWORD PTR [rbp-0x18]
   1400014a6:	mov    eax,DWORD PTR [rax+0xd0]
   1400014ac:	test   eax,eax
   1400014ae:	setne  al
   1400014b1:	movzx  eax,al
   1400014b4:	jmp    0x1400014ea
   1400014b6:	mov    rax,QWORD PTR [rbp-0x18]
   1400014ba:	mov    QWORD PTR [rbp-0x20],rax
   1400014be:	mov    rax,QWORD PTR [rbp-0x20]
   1400014c2:	mov    eax,DWORD PTR [rax+0x6c]
   1400014c5:	cmp    eax,0xe
   1400014c8:	ja     0x1400014d1
   1400014ca:	mov    eax,0x0
   1400014cf:	jmp    0x1400014ea
   1400014d1:	mov    rax,QWORD PTR [rbp-0x20]
   1400014d5:	mov    eax,DWORD PTR [rax+0xe0]
   1400014db:	test   eax,eax
   1400014dd:	setne  al
   1400014e0:	movzx  eax,al
   1400014e3:	jmp    0x1400014ea
   1400014e5:	mov    eax,0x0
   1400014ea:	add    rsp,0x20
   1400014ee:	pop    rbp
   1400014ef:	ret
   1400014f0:	push   rbp
   1400014f1:	push   rbx
   1400014f2:	sub    rsp,0x48
   1400014f6:	lea    rbp,[rsp+0x40]
   1400014fb:	mov    DWORD PTR [rbp+0x20],ecx
   1400014fe:	mov    QWORD PTR [rbp+0x28],rdx
   140001502:	mov    eax,DWORD PTR [rbp+0x20]
   140001505:	add    eax,0x1
   140001508:	cdqe
   14000150a:	shl    rax,0x3
   14000150e:	mov    rcx,rax
   140001511:	call   0x140003868
   140001516:	mov    QWORD PTR [rbp-0x10],rax
   14000151a:	cmp    QWORD PTR [rbp-0x10],0x0
   14000151f:	jne    0x14000152b
   140001521:	mov    eax,0x1
   140001526:	jmp    0x140001628
   14000152b:	mov    rax,QWORD PTR [rbp+0x28]
   14000152f:	mov    rax,QWORD PTR [rax]
   140001532:	mov    QWORD PTR [rbp-0x18],rax
   140001536:	mov    DWORD PTR [rbp-0x4],0x0
   14000153d:	jmp    0x1400015f1
   140001542:	mov    eax,DWORD PTR [rbp-0x4]
   140001545:	cdqe
   140001547:	lea    rdx,[rax*8+0x0]
   14000154f:	mov    rax,QWORD PTR [rbp-0x18]
   140001553:	add    rax,rdx
   140001556:	mov    rax,QWORD PTR [rax]
   140001559:	mov    rcx,rax
   14000155c:	call   0x140003750
   140001561:	add    rax,0x1
   140001565:	mov    QWORD PTR [rbp-0x20],rax
   140001569:	mov    eax,DWORD PTR [rbp-0x4]
   14000156c:	cdqe
   14000156e:	lea    rdx,[rax*8+0x0]
   140001576:	mov    rax,QWORD PTR [rbp-0x10]
   14000157a:	lea    rbx,[rdx+rax*1]
   14000157e:	mov    rax,QWORD PTR [rbp-0x20]
   140001582:	mov    rcx,rax
   140001585:	call   0x140003868
   14000158a:	mov    QWORD PTR [rbx],rax
   14000158d:	mov    eax,DWORD PTR [rbp-0x4]
   140001590:	cdqe
   140001592:	lea    rdx,[rax*8+0x0]
   14000159a:	mov    rax,QWORD PTR [rbp-0x10]
   14000159e:	add    rax,rdx
   1400015a1:	mov    rax,QWORD PTR [rax]
   1400015a4:	test   rax,rax
   1400015a7:	jne    0x1400015b0
   1400015a9:	mov    eax,0x1
   1400015ae:	jmp    0x140001628
   1400015b0:	mov    eax,DWORD PTR [rbp-0x4]
   1400015b3:	cdqe
   1400015b5:	lea    rdx,[rax*8+0x0]
   1400015bd:	mov    rax,QWORD PTR [rbp-0x18]
   1400015c1:	add    rax,rdx
   1400015c4:	mov    rdx,QWORD PTR [rax]
   1400015c7:	mov    eax,DWORD PTR [rbp-0x4]
   1400015ca:	cdqe
   1400015cc:	lea    rcx,[rax*8+0x0]
   1400015d4:	mov    rax,QWORD PTR [rbp-0x10]
   1400015d8:	add    rax,rcx
   1400015db:	mov    rax,QWORD PTR [rax]
   1400015de:	mov    rcx,QWORD PTR [rbp-0x20]
   1400015e2:	mov    r8,rcx
   1400015e5:	mov    rcx,rax
   1400015e8:	call   0x140003828
   1400015ed:	add    DWORD PTR [rbp-0x4],0x1
   1400015f1:	mov    eax,DWORD PTR [rbp-0x4]
   1400015f4:	cmp    eax,DWORD PTR [rbp+0x20]
   1400015f7:	jl     0x140001542
   1400015fd:	mov    eax,DWORD PTR [rbp-0x4]
   140001600:	cdqe
   140001602:	lea    rdx,[rax*8+0x0]
   14000160a:	mov    rax,QWORD PTR [rbp-0x10]
   14000160e:	add    rax,rdx
   140001611:	mov    QWORD PTR [rax],0x0
   140001618:	mov    rax,QWORD PTR [rbp+0x28]
   14000161c:	mov    rdx,QWORD PTR [rbp-0x10]
   140001620:	mov    QWORD PTR [rax],rdx
   140001623:	mov    eax,0x0
   140001628:	add    rsp,0x48
   14000162c:	pop    rbx
   14000162d:	pop    rbp
   14000162e:	ret
   14000162f:	push   rbp
   140001630:	mov    rbp,rsp
   140001633:	sub    rsp,0x20
   140001637:	mov    QWORD PTR [rbp+0x10],rcx
   14000163b:	mov    rax,QWORD PTR [rbp+0x10]
   14000163f:	mov    rcx,rax
   140001642:	call   0x1400037d0
   140001647:	add    rsp,0x20
   14000164b:	pop    rbp
   14000164c:	ret
   14000164d:	nop
   14000164e:	nop
   14000164f:	nop
   140001650:	ret
   140001651:	nop    DWORD PTR [rax+0x0]
   140001655:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001660:	xor    eax,eax
   140001662:	ret
   140001663:	xchg   ax,ax
   140001665:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001670:	push   rbp
   140001671:	push   rbx
   140001672:	sub    rsp,0x38
   140001676:	lea    rbp,[rsp+0x30]
   14000167b:	lea    rcx,[rip+0x397e]        # 0x140005000
   140001682:	call   QWORD PTR [rip+0x8cc8]        # 0x14000a350
   140001688:	mov    rbx,rax
   14000168b:	test   rax,rax
   14000168e:	je     0x140001700
   140001690:	lea    rcx,[rip+0x3969]        # 0x140005000
   140001697:	call   QWORD PTR [rip+0x8cdb]        # 0x14000a378
   14000169d:	mov    r9,QWORD PTR [rip+0x8cb4]        # 0x14000a358
   1400016a4:	lea    rdx,[rip+0x3968]        # 0x140005013
   1400016ab:	mov    rcx,rbx
   1400016ae:	mov    QWORD PTR [rip+0x796b],rax        # 0x140009020
   1400016b5:	mov    QWORD PTR [rbp-0x10],r9
   1400016b9:	call   r9
   1400016bc:	lea    rdx,[rip+0x3966]        # 0x140005029
   1400016c3:	mov    rcx,rbx
   1400016c6:	mov    QWORD PTR [rbp-0x8],rax
   1400016ca:	call   QWORD PTR [rbp-0x10]
   1400016cd:	mov    r8,QWORD PTR [rbp-0x8]
   1400016d1:	mov    QWORD PTR [rip+0x2928],rax        # 0x140004000
   1400016d8:	test   r8,r8
   1400016db:	je     0x1400016ee
   1400016dd:	lea    rdx,[rip+0x795c]        # 0x140009040
   1400016e4:	lea    rcx,[rip+0x4915]        # 0x140006000
   1400016eb:	call   r8
   1400016ee:	lea    rcx,[rip+0x2b]        # 0x140001720
   1400016f5:	add    rsp,0x38
   1400016f9:	pop    rbx
   1400016fa:	pop    rbp
   1400016fb:	jmp    0x14000162f
   140001700:	lea    rax,[rip+0xffffffffffffff59]        # 0x140001660
   140001707:	lea    r8,[rip+0xffffffffffffff42]        # 0x140001650
   14000170e:	mov    QWORD PTR [rip+0x28eb],rax        # 0x140004000
   140001715:	jmp    0x1400016dd
   140001717:	nop    WORD PTR [rax+rax*1+0x0]
   140001720:	push   rbp
   140001721:	mov    rbp,rsp
   140001724:	sub    rsp,0x20
   140001728:	mov    rax,QWORD PTR [rip+0x28d1]        # 0x140004000
   14000172f:	test   rax,rax
   140001732:	je     0x14000173d
   140001734:	lea    rcx,[rip+0x48c5]        # 0x140006000
   14000173b:	call   rax
   14000173d:	mov    rcx,QWORD PTR [rip+0x78dc]        # 0x140009020
   140001744:	test   rcx,rcx
   140001747:	je     0x140001758
   140001749:	add    rsp,0x20
   14000174d:	pop    rbp
   14000174e:	rex.W jmp QWORD PTR [rip+0x8bdb]        # 0x14000a330
   140001755:	nop    DWORD PTR [rax]
   140001758:	add    rsp,0x20
   14000175c:	pop    rbp
   14000175d:	ret
   14000175e:	nop
   14000175f:	nop
   140001760:	cs nop WORD PTR [rax+rax*1+0x0]
   14000176a:	cs nop WORD PTR [rax+rax*1+0x0]
   140001774:	cs nop WORD PTR [rax+rax*1+0x0]
   14000177e:	xchg   ax,ax
   140001780:	push   rdi
   140001781:	push   rsi
   140001782:	push   rbx
   140001783:	sub    rsp,0x140
   14000178a:	movaps XMMWORD PTR [rsp+0x100],xmm6
   140001792:	movaps XMMWORD PTR [rsp+0x110],xmm7
   14000179a:	movaps XMMWORD PTR [rsp+0x120],xmm8
   1400017a3:	movaps XMMWORD PTR [rsp+0x130],xmm9
   1400017ac:	pcmpeqd xmm5,xmm5
   1400017b0:	movdqa xmm2,XMMWORD PTR [rip+0x3e48]        # 0x140005600
   1400017b8:	psrlw  xmm5,0x8
   1400017bd:	mov    rbx,rcx
   1400017c0:	mov    ecx,0x4
   1400017c5:	mov    esi,edx
   1400017c7:	mov    rdi,r8
   1400017ca:	movd   xmm9,ecx
   1400017cf:	mov    ecx,0x8
   1400017d4:	mov    r10,rsp
   1400017d7:	mov    rax,rsp
   1400017da:	movd   xmm8,ecx
   1400017df:	mov    ecx,0xc
   1400017e4:	pshufd xmm9,xmm9,0x0
   1400017ea:	movd   xmm7,ecx
   1400017ee:	mov    ecx,0x10
   1400017f3:	pshufd xmm8,xmm8,0x0
   1400017f9:	movd   xmm6,ecx
   1400017fd:	pshufd xmm7,xmm7,0x0
   140001802:	pshufd xmm6,xmm6,0x0
   140001807:	nop    WORD PTR [rax+rax*1+0x0]
   140001810:	movdqa xmm3,xmm2
   140001814:	movdqa xmm1,xmm2
   140001818:	movdqa xmm0,xmm2
   14000181c:	add    rax,0x10
   140001820:	paddd  xmm3,xmm9
   140001825:	movdqa xmm4,xmm2
   140001829:	lea    rcx,[rsp+0x100]
   140001831:	punpcklwd xmm1,xmm3
   140001835:	punpckhwd xmm0,xmm3
   140001839:	paddd  xmm4,xmm7
   14000183d:	movdqa xmm3,xmm1
   140001841:	punpcklwd xmm1,xmm0
   140001845:	punpckhwd xmm3,xmm0
   140001849:	movdqa xmm0,xmm2
   14000184d:	paddd  xmm2,xmm6
   140001851:	paddd  xmm0,xmm8
   140001856:	punpcklwd xmm1,xmm3
   14000185a:	movdqa xmm3,xmm0
   14000185e:	punpcklwd xmm0,xmm4
   140001862:	pand   xmm1,xmm5
   140001866:	punpckhwd xmm3,xmm4
   14000186a:	movdqa xmm4,xmm0
   14000186e:	punpckhwd xmm4,xmm3
   140001872:	punpcklwd xmm0,xmm3
   140001876:	punpcklwd xmm0,xmm4
   14000187a:	pand   xmm0,xmm5
   14000187e:	packuswb xmm1,xmm0
   140001882:	movaps XMMWORD PTR [rax-0x10],xmm1
   140001886:	cmp    rax,rcx
   140001889:	jne    0x140001810
   14000188b:	xor    r8d,r8d
   14000188e:	xor    ecx,ecx
   140001890:	nop    DWORD PTR [rax+0x0]
   140001894:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000189f:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400018aa:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400018b5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400018c0:	mov    eax,ecx
   1400018c2:	xor    edx,edx
   1400018c4:	movzx  r11d,BYTE PTR [r10]
   1400018c8:	add    ecx,0x1
   1400018cb:	div    r9d
   1400018ce:	add    r10,0x1
   1400018d2:	movzx  eax,BYTE PTR [rdi+rdx*1]
   1400018d6:	movzx  edx,r11b
   1400018da:	add    eax,edx
   1400018dc:	add    eax,r8d
   1400018df:	movzx  r8d,al
   1400018e3:	movzx  eax,al
   1400018e6:	movzx  edx,BYTE PTR [rsp+rax*1]
   1400018ea:	mov    BYTE PTR [r10-0x1],dl
   1400018ee:	mov    BYTE PTR [rsp+rax*1],r11b
   1400018f2:	cmp    ecx,0x100
   1400018f8:	jne    0x1400018c0
   1400018fa:	mov    r11d,esi
   1400018fd:	xor    r9d,r9d
   140001900:	xor    r8d,r8d
   140001903:	add    r11,rbx
   140001906:	nop    DWORD PTR [rax]
   140001909:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001914:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000191f:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000192a:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001935:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001940:	lea    edx,[r8+0x1]
   140001944:	movzx  r8d,dl
   140001948:	movzx  edx,dl
   14000194b:	movzx  eax,BYTE PTR [rsp+rdx*1]
   14000194f:	lea    ecx,[rax+r9*1]
   140001953:	movzx  r9d,cl
   140001957:	movzx  ecx,cl
   14000195a:	movzx  r10d,BYTE PTR [rsp+rcx*1]
   14000195f:	mov    BYTE PTR [rsp+rdx*1],r10b
   140001963:	mov    BYTE PTR [rsp+rcx*1],al
   140001966:	add    al,BYTE PTR [rsp+rdx*1]
   140001969:	movzx  eax,al
   14000196c:	movzx  eax,BYTE PTR [rsp+rax*1]
   140001970:	xor    BYTE PTR [rbx],al
   140001972:	add    rbx,0x1
   140001976:	cmp    r11,rbx
   140001979:	jne    0x140001940
   14000197b:	movaps xmm6,XMMWORD PTR [rsp+0x100]
   140001983:	movaps xmm7,XMMWORD PTR [rsp+0x110]
   14000198b:	movaps xmm8,XMMWORD PTR [rsp+0x120]
   140001994:	movaps xmm9,XMMWORD PTR [rsp+0x130]
   14000199d:	add    rsp,0x140
   1400019a4:	pop    rbx
   1400019a5:	pop    rsi
   1400019a6:	pop    rdi
   1400019a7:	ret
   1400019a8:	nop    DWORD PTR [rax+rax*1+0x0]
   1400019b0:	sub    rsp,0x78
   1400019b4:	lea    rcx,[rip+0x36a5]        # 0x140005060
   1400019bb:	mov    QWORD PTR [rsp+0x48],0x0
   1400019c4:	call   QWORD PTR [rip+0x8986]        # 0x14000a350
   1400019ca:	mov    r9,rax
   1400019cd:	test   rax,rax
   1400019d0:	je     0x140001a70
   1400019d6:	movdqa xmm0,XMMWORD PTR [rip+0x3c32]        # 0x140005610
   1400019de:	lea    rdx,[rsp+0x60]
   1400019e3:	mov    eax,0xffffff85
   1400019e8:	lea    rcx,[rip+0x3761]        # 0x140005150
   1400019ef:	movaps XMMWORD PTR [rsp+0x50],xmm0
   1400019f4:	nop
   1400019f5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001a00:	movzx  r8d,BYTE PTR [rcx]
   140001a04:	add    rdx,0x1
   140001a08:	add    rcx,0x1
   140001a0c:	xor    r8d,eax
   140001a0f:	add    eax,0x3
   140001a12:	mov    BYTE PTR [rdx-0x1],r8b
   140001a16:	cmp    al,0xa0
   140001a18:	jne    0x140001a00
   140001a1a:	mov    BYTE PTR [rsp+0x69],0x0
   140001a1f:	lea    rdx,[rsp+0x50]
   140001a24:	mov    rcx,r9
   140001a27:	call   QWORD PTR [rip+0x892b]        # 0x14000a358
   140001a2d:	test   rax,rax
   140001a30:	je     0x140001a70
   140001a32:	mov    QWORD PTR [rsp+0x38],rax
   140001a37:	call   QWORD PTR [rip+0x8903]        # 0x14000a340
   140001a3d:	mov    r9d,0x8
   140001a43:	lea    r8,[rsp+0x48]
   140001a48:	mov    QWORD PTR [rsp+0x20],0x0
   140001a51:	mov    edx,0x7
   140001a56:	mov    rcx,rax
   140001a59:	call   QWORD PTR [rsp+0x38]
   140001a5d:	test   eax,eax
   140001a5f:	js     0x140001a70
   140001a61:	cmp    QWORD PTR [rsp+0x48],0x0
   140001a67:	je     0x140001a70
   140001a69:	mov    BYTE PTR [rip+0x25a0],0xa5        # 0x140004010
   140001a70:	add    rsp,0x78
   140001a74:	ret
   140001a75:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001a80:	push   rbx
   140001a81:	sub    rsp,0x20
   140001a85:	mov    ebx,ecx
   140001a87:	mov    ecx,0xfffffff5
   140001a8c:	call   QWORD PTR [rip+0x88ce]        # 0x14000a360
   140001a92:	movzx  edx,bx
   140001a95:	mov    rcx,rax
   140001a98:	add    rsp,0x20
   140001a9c:	pop    rbx
   140001a9d:	rex.W jmp QWORD PTR [rip+0x88e4]        # 0x14000a388
   140001aa4:	nop
   140001aa5:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001ab0:	push   rbx
   140001ab1:	sub    rsp,0x20
   140001ab5:	mov    ebx,ecx
   140001ab7:	lea    rcx,[rip+0x35ac]        # 0x14000506a
   140001abe:	call   0x1400035a0
   140001ac3:	test   ebx,ebx
   140001ac5:	je     0x140001b09
   140001ac7:	mov    ecx,0xa
   140001acc:	call   0x140001a80
   140001ad1:	lea    rcx,[rip+0x359d]        # 0x140005075
   140001ad8:	call   0x1400035a0
   140001add:	mov    ecx,0x7
   140001ae2:	call   0x140001a80
   140001ae7:	mov    ecx,0xa
   140001aec:	call   0x140003798
   140001af1:	mov    ecx,0x1
   140001af6:	call   QWORD PTR [rip+0x89cc]        # 0x14000a4c8
   140001afc:	mov    rcx,rax
   140001aff:	add    rsp,0x20
   140001b03:	pop    rbx
   140001b04:	jmp    0x140003780
   140001b09:	mov    ecx,0xc
   140001b0e:	call   0x140001a80
   140001b13:	lea    rcx,[rip+0x3562]        # 0x14000507c
   140001b1a:	call   0x1400035a0
   140001b1f:	jmp    0x140001add
   140001b21:	nop    DWORD PTR [rax+0x0]
   140001b25:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001b30:	push   rbx
   140001b31:	sub    rsp,0x30
   140001b35:	mov    ecx,0xfffffff6
   140001b3a:	mov    rbx,QWORD PTR [rip+0x881f]        # 0x14000a360
   140001b41:	call   rbx
   140001b43:	mov    rcx,rax
   140001b46:	lea    rdx,[rsp+0x2c]
   140001b4b:	call   QWORD PTR [rip+0x87e7]        # 0x14000a338
   140001b51:	test   eax,eax
   140001b53:	jne    0x140001b5b
   140001b55:	add    rsp,0x30
   140001b59:	pop    rbx
   140001b5a:	ret
   140001b5b:	mov    ecx,0xfffffff6
   140001b60:	call   rbx
   140001b62:	mov    rcx,rax
   140001b65:	call   QWORD PTR [rip+0x87b5]        # 0x14000a320
   140001b6b:	nop    DWORD PTR [rax+rax*1+0x0]
   140001b70:	call   0x140003790
   140001b75:	cmp    eax,0xa
   140001b78:	je     0x140001b55
   140001b7a:	cmp    eax,0xffffffff
   140001b7d:	jne    0x140001b70
   140001b7f:	jmp    0x140001b55
   140001b81:	nop    DWORD PTR [rax+0x0]
   140001b85:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001b90:	sub    rsp,0x28
   140001b94:	xor    ecx,ecx
   140001b96:	call   0x140001ab0
   140001b9b:	call   0x140001b30
   140001ba0:	mov    ecx,0x1
   140001ba5:	call   QWORD PTR [rip+0x876d]        # 0x14000a318
   140001bab:	nop
   140001bac:	nop    DWORD PTR [rax+0x0]
   140001bb0:	mov    rax,QWORD PTR [rcx]
   140001bb3:	cmp    DWORD PTR [rax],0x80000003
   140001bb9:	je     0x140001bbe
   140001bbb:	xor    eax,eax
   140001bbd:	ret
   140001bbe:	mov    rax,QWORD PTR [rcx+0x8]
   140001bc2:	xor    BYTE PTR [rip+0x2447],0x3c        # 0x140004010
   140001bc9:	add    QWORD PTR [rax+0xf8],0x1
   140001bd1:	mov    eax,0xffffffff
   140001bd6:	ret
   140001bd7:	nop    WORD PTR [rax+rax*1+0x0]
   140001be0:	sub    rsp,0x28
   140001be4:	cmp    edx,0x1
   140001be7:	je     0x140001bf0
   140001be9:	add    rsp,0x28
   140001bed:	ret
   140001bee:	xchg   ax,ax
   140001bf0:	call   0x1400019b0
   140001bf5:	mov    eax,DWORD PTR [rip+0x7485]        # 0x140009080
   140001bfb:	test   eax,eax
   140001bfd:	jne    0x140001be9
   140001bff:	lea    rdx,[rip+0xffffffffffffffaa]        # 0x140001bb0
   140001c06:	mov    ecx,0x1
   140001c0b:	call   QWORD PTR [rip+0x86ef]        # 0x14000a300
   140001c11:	mov    DWORD PTR [rip+0x7465],0x1        # 0x140009080
   140001c1b:	jmp    0x140001be9
   140001c1d:	nop
   140001c1e:	nop
   140001c1f:	nop
   140001c20:	nop
   140001c21:	nop
   140001c22:	nop
   140001c23:	nop
   140001c24:	nop
   140001c25:	nop
   140001c26:	nop
   140001c27:	nop
   140001c28:	nop
   140001c29:	nop
   140001c2a:	nop
   140001c2b:	nop
   140001c2c:	nop
   140001c2d:	nop
   140001c2e:	nop
   140001c2f:	nop
   140001c30:	nop
   140001c31:	nop
   140001c32:	nop
   140001c33:	nop
   140001c34:	nop
   140001c35:	nop
   140001c36:	nop
   140001c37:	nop
   140001c38:	nop
   140001c39:	nop
   140001c3a:	nop
   140001c3b:	nop
   140001c3c:	nop
   140001c3d:	nop
   140001c3e:	nop
   140001c3f:	nop
   140001c40:	push   rbp
   140001c41:	mov    rbp,rsp
   140001c44:	sub    rsp,0x20
   140001c48:	jmp    0x140001c68
   140001c4a:	mov    rax,QWORD PTR [rip+0x23cf]        # 0x140004020
   140001c51:	mov    rax,QWORD PTR [rax]
   140001c54:	call   rax
   140001c56:	mov    rax,QWORD PTR [rip+0x23c3]        # 0x140004020
   140001c5d:	add    rax,0x8
   140001c61:	mov    QWORD PTR [rip+0x23b8],rax        # 0x140004020
   140001c68:	mov    rax,QWORD PTR [rip+0x23b1]        # 0x140004020
   140001c6f:	mov    rax,QWORD PTR [rax]
   140001c72:	test   rax,rax
   140001c75:	jne    0x140001c4a
   140001c77:	nop
   140001c78:	nop
   140001c79:	add    rsp,0x20
   140001c7d:	pop    rbp
   140001c7e:	ret
   140001c7f:	push   rbp
   140001c80:	mov    rbp,rsp
   140001c83:	sub    rsp,0x30
   140001c87:	mov    rax,QWORD PTR [rip+0x3ca2]        # 0x140005930
   140001c8e:	mov    rax,QWORD PTR [rax]
   140001c91:	mov    DWORD PTR [rbp-0x4],eax
   140001c94:	cmp    DWORD PTR [rbp-0x4],0xffffffff
   140001c98:	jne    0x140001cbf
   140001c9a:	mov    DWORD PTR [rbp-0x4],0x0
   140001ca1:	jmp    0x140001ca7
   140001ca3:	add    DWORD PTR [rbp-0x4],0x1
   140001ca7:	mov    eax,DWORD PTR [rbp-0x4]
   140001caa:	lea    edx,[rax+0x1]
   140001cad:	mov    rax,QWORD PTR [rip+0x3c7c]        # 0x140005930
   140001cb4:	mov    edx,edx
   140001cb6:	mov    rax,QWORD PTR [rax+rdx*8]
   140001cba:	test   rax,rax
   140001cbd:	jne    0x140001ca3
   140001cbf:	mov    eax,DWORD PTR [rbp-0x4]
   140001cc2:	mov    DWORD PTR [rbp-0x8],eax
   140001cc5:	jmp    0x140001cdb
   140001cc7:	mov    rax,QWORD PTR [rip+0x3c62]        # 0x140005930
   140001cce:	mov    edx,DWORD PTR [rbp-0x8]
   140001cd1:	mov    rax,QWORD PTR [rax+rdx*8]
   140001cd5:	call   rax
   140001cd7:	sub    DWORD PTR [rbp-0x8],0x1
   140001cdb:	cmp    DWORD PTR [rbp-0x8],0x0
   140001cdf:	jne    0x140001cc7
   140001ce1:	lea    rax,[rip+0xffffffffffffff58]        # 0x140001c40
   140001ce8:	mov    rcx,rax
   140001ceb:	call   0x14000162f
   140001cf0:	nop
   140001cf1:	add    rsp,0x30
   140001cf5:	pop    rbp
   140001cf6:	ret
   140001cf7:	push   rbp
   140001cf8:	mov    rbp,rsp
   140001cfb:	sub    rsp,0x20
   140001cff:	mov    eax,DWORD PTR [rip+0x738b]        # 0x140009090
   140001d05:	test   eax,eax
   140001d07:	jne    0x140001d18
   140001d09:	mov    DWORD PTR [rip+0x737d],0x1        # 0x140009090
   140001d13:	call   0x140001c7f
   140001d18:	nop
   140001d19:	add    rsp,0x20
   140001d1d:	pop    rbp
   140001d1e:	ret
   140001d1f:	nop
   140001d20:	push   rbp
   140001d21:	mov    rbp,rsp
   140001d24:	mov    eax,0x0
   140001d29:	pop    rbp
   140001d2a:	ret
   140001d2b:	nop
   140001d2c:	nop
   140001d2d:	nop
   140001d2e:	nop
   140001d2f:	nop
   140001d30:	push   rbp
   140001d31:	mov    rbp,rsp
   140001d34:	sub    rsp,0x30
   140001d38:	mov    QWORD PTR [rbp+0x10],rcx
   140001d3c:	mov    DWORD PTR [rbp+0x18],edx
   140001d3f:	mov    QWORD PTR [rbp+0x20],r8
   140001d43:	mov    rax,QWORD PTR [rip+0x3bc6]        # 0x140005910
   140001d4a:	mov    eax,DWORD PTR [rax]
   140001d4c:	cmp    eax,0x2
   140001d4f:	je     0x140001d5e
   140001d51:	mov    rax,QWORD PTR [rip+0x3bb8]        # 0x140005910
   140001d58:	mov    DWORD PTR [rax],0x2
   140001d5e:	cmp    DWORD PTR [rbp+0x18],0x2
   140001d62:	je     0x140001d82
   140001d64:	cmp    DWORD PTR [rbp+0x18],0x1
   140001d68:	jne    0x140001dc5
   140001d6a:	mov    rcx,QWORD PTR [rbp+0x20]
   140001d6e:	mov    edx,DWORD PTR [rbp+0x18]
   140001d71:	mov    rax,QWORD PTR [rbp+0x10]
   140001d75:	mov    r8,rcx
   140001d78:	mov    rcx,rax
   140001d7b:	call   0x140002f51
   140001d80:	jmp    0x140001dc5
   140001d82:	lea    rax,[rip+0x3e8f]        # 0x140005c18
   140001d89:	mov    QWORD PTR [rbp-0x8],rax
   140001d8d:	add    QWORD PTR [rbp-0x8],0x8
   140001d92:	jmp    0x140001db6
   140001d94:	mov    rax,QWORD PTR [rbp-0x8]
   140001d98:	mov    QWORD PTR [rbp-0x10],rax
   140001d9c:	mov    rax,QWORD PTR [rbp-0x10]
   140001da0:	mov    rax,QWORD PTR [rax]
   140001da3:	test   rax,rax
   140001da6:	je     0x140001db1
   140001da8:	mov    rax,QWORD PTR [rbp-0x10]
   140001dac:	mov    rax,QWORD PTR [rax]
   140001daf:	call   rax
   140001db1:	add    QWORD PTR [rbp-0x8],0x8
   140001db6:	lea    rax,[rip+0x3e63]        # 0x140005c20
   140001dbd:	cmp    QWORD PTR [rbp-0x8],rax
   140001dc1:	jne    0x140001d94
   140001dc3:	jmp    0x140001dc6
   140001dc5:	nop
   140001dc6:	add    rsp,0x30
   140001dca:	pop    rbp
   140001dcb:	ret
   140001dcc:	push   rbp
   140001dcd:	mov    rbp,rsp
   140001dd0:	mov    QWORD PTR [rbp+0x10],rcx
   140001dd4:	cmp    QWORD PTR [rbp+0x10],0x0
   140001dd9:	jne    0x140001de2
   140001ddb:	mov    eax,0x0
   140001de0:	jmp    0x140001de7
   140001de2:	mov    eax,0x0
   140001de7:	pop    rbp
   140001de8:	ret
   140001de9:	push   rbp
   140001dea:	mov    rbp,rsp
   140001ded:	sub    rsp,0x20
   140001df1:	mov    QWORD PTR [rbp+0x10],rcx
   140001df5:	mov    DWORD PTR [rbp+0x18],edx
   140001df8:	mov    QWORD PTR [rbp+0x20],r8
   140001dfc:	cmp    DWORD PTR [rbp+0x18],0x3
   140001e00:	je     0x140001e08
   140001e02:	cmp    DWORD PTR [rbp+0x18],0x0
   140001e06:	jne    0x140001e20
   140001e08:	mov    rcx,QWORD PTR [rbp+0x20]
   140001e0c:	mov    edx,DWORD PTR [rbp+0x18]
   140001e0f:	mov    rax,QWORD PTR [rbp+0x10]
   140001e13:	mov    r8,rcx
   140001e16:	mov    rcx,rax
   140001e19:	call   0x140002f51
   140001e1e:	jmp    0x140001e21
   140001e20:	nop
   140001e21:	add    rsp,0x20
   140001e25:	pop    rbp
   140001e26:	ret
   140001e27:	nop
   140001e28:	nop
   140001e29:	nop
   140001e2a:	nop
   140001e2b:	nop
   140001e2c:	nop
   140001e2d:	nop
   140001e2e:	nop
   140001e2f:	nop
   140001e30:	push   rbp
   140001e31:	push   rbx
   140001e32:	sub    rsp,0x88
   140001e39:	lea    rbp,[rsp+0x50]
   140001e3e:	movaps XMMWORD PTR [rbp+0x0],xmm6
   140001e42:	movaps XMMWORD PTR [rbp+0x10],xmm7
   140001e46:	movaps XMMWORD PTR [rbp+0x20],xmm8
   140001e4b:	mov    QWORD PTR [rbp+0x50],rcx
   140001e4f:	mov    rax,QWORD PTR [rbp+0x50]
   140001e53:	mov    eax,DWORD PTR [rax]
   140001e55:	cmp    eax,0x6
   140001e58:	je     0x140001eb0
   140001e5a:	cmp    eax,0x6
   140001e5d:	jg     0x140001ed7
   140001e5f:	cmp    eax,0x5
   140001e62:	je     0x140001ebd
   140001e64:	cmp    eax,0x5
   140001e67:	jg     0x140001ed7
   140001e69:	cmp    eax,0x4
   140001e6c:	je     0x140001eca
   140001e6e:	cmp    eax,0x4
   140001e71:	jg     0x140001ed7
   140001e73:	cmp    eax,0x3
   140001e76:	je     0x140001ea3
   140001e78:	cmp    eax,0x3
   140001e7b:	jg     0x140001ed7
   140001e7d:	cmp    eax,0x1
   140001e80:	je     0x140001e89
   140001e82:	cmp    eax,0x2
   140001e85:	je     0x140001e96
   140001e87:	jmp    0x140001ed7
   140001e89:	lea    rax,[rip+0x37d0]        # 0x140005660
   140001e90:	mov    QWORD PTR [rbp-0x8],rax
   140001e94:	jmp    0x140001ee3
   140001e96:	lea    rax,[rip+0x37e2]        # 0x14000567f
   140001e9d:	mov    QWORD PTR [rbp-0x8],rax
   140001ea1:	jmp    0x140001ee3
   140001ea3:	lea    rax,[rip+0x37f6]        # 0x1400056a0
   140001eaa:	mov    QWORD PTR [rbp-0x8],rax
   140001eae:	jmp    0x140001ee3
   140001eb0:	lea    rax,[rip+0x3809]        # 0x1400056c0
   140001eb7:	mov    QWORD PTR [rbp-0x8],rax
   140001ebb:	jmp    0x140001ee3
   140001ebd:	lea    rax,[rip+0x3824]        # 0x1400056e8
   140001ec4:	mov    QWORD PTR [rbp-0x8],rax
   140001ec8:	jmp    0x140001ee3
   140001eca:	lea    rax,[rip+0x383f]        # 0x140005710
   140001ed1:	mov    QWORD PTR [rbp-0x8],rax
   140001ed5:	jmp    0x140001ee3
   140001ed7:	lea    rax,[rip+0x3868]        # 0x140005746
   140001ede:	mov    QWORD PTR [rbp-0x8],rax
   140001ee2:	nop
   140001ee3:	mov    rax,QWORD PTR [rbp+0x50]
   140001ee7:	movsd  xmm8,QWORD PTR [rax+0x20]
   140001eed:	mov    rax,QWORD PTR [rbp+0x50]
   140001ef1:	movsd  xmm7,QWORD PTR [rax+0x18]
   140001ef6:	mov    rax,QWORD PTR [rbp+0x50]
   140001efa:	movsd  xmm6,QWORD PTR [rax+0x10]
   140001eff:	mov    rax,QWORD PTR [rbp+0x50]
   140001f03:	mov    rbx,QWORD PTR [rax+0x8]
   140001f07:	mov    ecx,0x2
   140001f0c:	call   0x140003760
   140001f11:	mov    rcx,rax
   140001f14:	mov    rdx,QWORD PTR [rbp-0x8]
   140001f18:	lea    rax,[rip+0x3839]        # 0x140005758
   140001f1f:	movsd  QWORD PTR [rsp+0x30],xmm8
   140001f26:	movsd  QWORD PTR [rsp+0x28],xmm7
   140001f2c:	movsd  QWORD PTR [rsp+0x20],xmm6
   140001f32:	mov    r9,rbx
   140001f35:	mov    r8,rdx
   140001f38:	mov    rdx,rax
   140001f3b:	call   0x140003610
   140001f40:	mov    eax,0x0
   140001f45:	movaps xmm6,XMMWORD PTR [rbp+0x0]
   140001f49:	movaps xmm7,XMMWORD PTR [rbp+0x10]
   140001f4d:	movaps xmm8,XMMWORD PTR [rbp+0x20]
   140001f52:	add    rsp,0x88
   140001f59:	pop    rbx
   140001f5a:	pop    rbp
   140001f5b:	ret
   140001f5c:	nop
   140001f5d:	nop
   140001f5e:	nop
   140001f5f:	nop
   140001f60:	push   rbp
   140001f61:	push   rbx
   140001f62:	sub    rsp,0x38
   140001f66:	lea    rbp,[rsp+0x30]
   140001f6b:	mov    QWORD PTR [rbp+0x20],rcx
   140001f6f:	mov    QWORD PTR [rbp+0x28],rdx
   140001f73:	mov    QWORD PTR [rbp+0x30],r8
   140001f77:	mov    QWORD PTR [rbp+0x38],r9
   140001f7b:	lea    rax,[rbp+0x28]
   140001f7f:	mov    QWORD PTR [rbp-0x8],rax
   140001f83:	mov    ecx,0x2
   140001f88:	call   0x140003760
   140001f8d:	mov    rcx,rax
   140001f90:	lea    rax,[rip+0x37f9]        # 0x140005790
   140001f97:	mov    rdx,rax
   140001f9a:	call   0x140003610
   140001f9f:	mov    rbx,QWORD PTR [rbp-0x8]
   140001fa3:	mov    ecx,0x2
   140001fa8:	call   0x140003760
   140001fad:	mov    rcx,rax
   140001fb0:	mov    rax,QWORD PTR [rbp+0x20]
   140001fb4:	mov    r8,rbx
   140001fb7:	mov    rdx,rax
   140001fba:	call   0x140003550
   140001fbf:	call   0x140003808
   140001fc4:	nop
   140001fc5:	push   rbp
   140001fc6:	mov    rbp,rsp
   140001fc9:	sub    rsp,0x60
   140001fcd:	mov    QWORD PTR [rbp+0x10],rcx
   140001fd1:	mov    DWORD PTR [rbp-0x4],0x0
   140001fd8:	jmp    0x14000205f
   140001fdd:	mov    rcx,QWORD PTR [rip+0x710c]        # 0x1400090f0
   140001fe4:	mov    eax,DWORD PTR [rbp-0x4]
   140001fe7:	movsxd rdx,eax
   140001fea:	mov    rax,rdx
   140001fed:	shl    rax,0x2
   140001ff1:	add    rax,rdx
   140001ff4:	shl    rax,0x3
   140001ff8:	add    rax,rcx
   140001ffb:	mov    rax,QWORD PTR [rax+0x18]
   140001fff:	cmp    QWORD PTR [rbp+0x10],rax
   140002003:	jb     0x14000205b
   140002005:	mov    rcx,QWORD PTR [rip+0x70e4]        # 0x1400090f0
   14000200c:	mov    eax,DWORD PTR [rbp-0x4]
   14000200f:	movsxd rdx,eax
   140002012:	mov    rax,rdx
   140002015:	shl    rax,0x2
   140002019:	add    rax,rdx
   14000201c:	shl    rax,0x3
   140002020:	add    rax,rcx
   140002023:	mov    rcx,QWORD PTR [rax+0x18]
   140002027:	mov    r8,QWORD PTR [rip+0x70c2]        # 0x1400090f0
   14000202e:	mov    eax,DWORD PTR [rbp-0x4]
   140002031:	movsxd rdx,eax
   140002034:	mov    rax,rdx
   140002037:	shl    rax,0x2
   14000203b:	add    rax,rdx
   14000203e:	shl    rax,0x3
   140002042:	add    rax,r8
   140002045:	mov    rax,QWORD PTR [rax+0x20]
   140002049:	mov    eax,DWORD PTR [rax+0x8]
   14000204c:	mov    eax,eax
   14000204e:	add    rax,rcx
   140002051:	cmp    QWORD PTR [rbp+0x10],rax
   140002055:	jb     0x14000229c
   14000205b:	add    DWORD PTR [rbp-0x4],0x1
   14000205f:	mov    eax,DWORD PTR [rip+0x7093]        # 0x1400090f8
   140002065:	cmp    DWORD PTR [rbp-0x4],eax
   140002068:	jl     0x140001fdd
   14000206e:	mov    rax,QWORD PTR [rbp+0x10]
   140002072:	mov    rcx,rax
   140002075:	call   0x14000323b
   14000207a:	mov    QWORD PTR [rbp-0x10],rax
   14000207e:	cmp    QWORD PTR [rbp-0x10],0x0
   140002083:	jne    0x140002098
   140002085:	mov    rax,QWORD PTR [rbp+0x10]
   140002089:	lea    rcx,[rip+0x3720]        # 0x1400057b0
   140002090:	mov    rdx,rax
   140002093:	call   0x140001f60
   140002098:	mov    rcx,QWORD PTR [rip+0x7051]        # 0x1400090f0
   14000209f:	mov    eax,DWORD PTR [rbp-0x4]
   1400020a2:	movsxd rdx,eax
   1400020a5:	mov    rax,rdx
   1400020a8:	shl    rax,0x2
   1400020ac:	add    rax,rdx
   1400020af:	shl    rax,0x3
   1400020b3:	lea    rdx,[rcx+rax*1]
   1400020b7:	mov    rax,QWORD PTR [rbp-0x10]
   1400020bb:	mov    QWORD PTR [rdx+0x20],rax
   1400020bf:	mov    rcx,QWORD PTR [rip+0x702a]        # 0x1400090f0
   1400020c6:	mov    eax,DWORD PTR [rbp-0x4]
   1400020c9:	movsxd rdx,eax
   1400020cc:	mov    rax,rdx
   1400020cf:	shl    rax,0x2
   1400020d3:	add    rax,rdx
   1400020d6:	shl    rax,0x3
   1400020da:	add    rax,rcx
   1400020dd:	mov    DWORD PTR [rax],0x0
   1400020e3:	call   0x140003387
   1400020e8:	mov    rcx,rax
   1400020eb:	mov    rax,QWORD PTR [rbp-0x10]
   1400020ef:	mov    eax,DWORD PTR [rax+0xc]
   1400020f2:	mov    r9d,eax
   1400020f5:	mov    r8,QWORD PTR [rip+0x6ff4]        # 0x1400090f0
   1400020fc:	mov    eax,DWORD PTR [rbp-0x4]
   1400020ff:	movsxd rdx,eax
   140002102:	mov    rax,rdx
   140002105:	shl    rax,0x2
   140002109:	add    rax,rdx
   14000210c:	shl    rax,0x3
   140002110:	add    rax,r8
   140002113:	lea    rdx,[rcx+r9*1]
   140002117:	mov    QWORD PTR [rax+0x18],rdx
   14000211b:	mov    rcx,QWORD PTR [rip+0x6fce]        # 0x1400090f0
   140002122:	mov    eax,DWORD PTR [rbp-0x4]
   140002125:	movsxd rdx,eax
   140002128:	mov    rax,rdx
   14000212b:	shl    rax,0x2
   14000212f:	add    rax,rdx
   140002132:	shl    rax,0x3
   140002136:	add    rax,rcx
   140002139:	mov    rax,QWORD PTR [rax+0x18]
   14000213d:	lea    rdx,[rbp-0x40]
   140002141:	mov    r8d,0x30
   140002147:	mov    rcx,rax
   14000214a:	mov    rax,QWORD PTR [rip+0x827f]        # 0x14000a3d0
   140002151:	call   rax
   140002153:	test   rax,rax
   140002156:	jne    0x140002197
   140002158:	mov    rcx,QWORD PTR [rip+0x6f91]        # 0x1400090f0
   14000215f:	mov    eax,DWORD PTR [rbp-0x4]
   140002162:	movsxd rdx,eax
   140002165:	mov    rax,rdx
   140002168:	shl    rax,0x2
   14000216c:	add    rax,rdx
   14000216f:	shl    rax,0x3
   140002173:	add    rax,rcx
   140002176:	mov    rdx,QWORD PTR [rax+0x18]
   14000217a:	mov    rax,QWORD PTR [rbp-0x10]
   14000217e:	mov    eax,DWORD PTR [rax+0x8]
   140002181:	mov    ecx,eax
   140002183:	lea    rax,[rip+0x3646]        # 0x1400057d0
   14000218a:	mov    r8,rdx
   14000218d:	mov    edx,ecx
   14000218f:	mov    rcx,rax
   140002192:	call   0x140001f60
   140002197:	mov    eax,DWORD PTR [rbp-0x1c]
   14000219a:	cmp    eax,0x40
   14000219d:	je     0x14000228b
   1400021a3:	mov    eax,DWORD PTR [rbp-0x1c]
   1400021a6:	cmp    eax,0x4
   1400021a9:	je     0x14000228b
   1400021af:	mov    eax,DWORD PTR [rbp-0x1c]
   1400021b2:	cmp    eax,0x80
   1400021b7:	je     0x14000228b
   1400021bd:	mov    eax,DWORD PTR [rbp-0x1c]
   1400021c0:	cmp    eax,0x8
   1400021c3:	je     0x14000228b
   1400021c9:	mov    eax,DWORD PTR [rbp-0x1c]
   1400021cc:	cmp    eax,0x2
   1400021cf:	jne    0x1400021da
   1400021d1:	mov    DWORD PTR [rbp-0x8],0x4
   1400021d8:	jmp    0x1400021e1
   1400021da:	mov    DWORD PTR [rbp-0x8],0x40
   1400021e1:	mov    rcx,QWORD PTR [rip+0x6f08]        # 0x1400090f0
   1400021e8:	mov    eax,DWORD PTR [rbp-0x4]
   1400021eb:	movsxd rdx,eax
   1400021ee:	mov    rax,rdx
   1400021f1:	shl    rax,0x2
   1400021f5:	add    rax,rdx
   1400021f8:	shl    rax,0x3
   1400021fc:	lea    rdx,[rcx+rax*1]
   140002200:	mov    rax,QWORD PTR [rbp-0x40]
   140002204:	mov    QWORD PTR [rdx+0x8],rax
   140002208:	mov    rcx,QWORD PTR [rip+0x6ee1]        # 0x1400090f0
   14000220f:	mov    eax,DWORD PTR [rbp-0x4]
   140002212:	movsxd rdx,eax
   140002215:	mov    rax,rdx
   140002218:	shl    rax,0x2
   14000221c:	add    rax,rdx
   14000221f:	shl    rax,0x3
   140002223:	lea    rdx,[rcx+rax*1]
   140002227:	mov    rax,QWORD PTR [rbp-0x28]
   14000222b:	mov    QWORD PTR [rdx+0x10],rax
   14000222f:	mov    rcx,QWORD PTR [rip+0x6eba]        # 0x1400090f0
   140002236:	mov    eax,DWORD PTR [rbp-0x4]
   140002239:	movsxd rdx,eax
   14000223c:	mov    rax,rdx
   14000223f:	shl    rax,0x2
   140002243:	add    rax,rdx
   140002246:	shl    rax,0x3
   14000224a:	add    rax,rcx
   14000224d:	mov    r8,rax
   140002250:	mov    rdx,QWORD PTR [rbp-0x28]
   140002254:	mov    rax,QWORD PTR [rbp-0x40]
   140002258:	mov    ecx,DWORD PTR [rbp-0x8]
   14000225b:	mov    r9,r8
   14000225e:	mov    r8d,ecx
   140002261:	mov    rcx,rax
   140002264:	mov    rax,QWORD PTR [rip+0x815d]        # 0x14000a3c8
   14000226b:	call   rax
   14000226d:	test   eax,eax
   14000226f:	jne    0x14000228b
   140002271:	mov    rax,QWORD PTR [rip+0x80d0]        # 0x14000a348
   140002278:	call   rax
   14000227a:	mov    edx,eax
   14000227c:	lea    rax,[rip+0x3585]        # 0x140005808
   140002283:	mov    rcx,rax
   140002286:	call   0x140001f60
   14000228b:	mov    eax,DWORD PTR [rip+0x6e67]        # 0x1400090f8
   140002291:	add    eax,0x1
   140002294:	mov    DWORD PTR [rip+0x6e5e],eax        # 0x1400090f8
   14000229a:	jmp    0x14000229d
   14000229c:	nop
   14000229d:	add    rsp,0x60
   1400022a1:	pop    rbp
   1400022a2:	ret
   1400022a3:	push   rbp
   1400022a4:	mov    rbp,rsp
   1400022a7:	sub    rsp,0x30
   1400022ab:	mov    DWORD PTR [rbp-0x4],0x0
   1400022b2:	jmp    0x140002364
   1400022b7:	mov    rcx,QWORD PTR [rip+0x6e32]        # 0x1400090f0
   1400022be:	mov    eax,DWORD PTR [rbp-0x4]
   1400022c1:	movsxd rdx,eax
   1400022c4:	mov    rax,rdx
   1400022c7:	shl    rax,0x2
   1400022cb:	add    rax,rdx
   1400022ce:	shl    rax,0x3
   1400022d2:	add    rax,rcx
   1400022d5:	mov    eax,DWORD PTR [rax]
   1400022d7:	test   eax,eax
   1400022d9:	je     0x14000235f
   1400022df:	mov    rcx,QWORD PTR [rip+0x6e0a]        # 0x1400090f0
   1400022e6:	mov    eax,DWORD PTR [rbp-0x4]
   1400022e9:	movsxd rdx,eax
   1400022ec:	mov    rax,rdx
   1400022ef:	shl    rax,0x2
   1400022f3:	add    rax,rdx
   1400022f6:	shl    rax,0x3
   1400022fa:	add    rax,rcx
   1400022fd:	mov    r10d,DWORD PTR [rax]
   140002300:	mov    rcx,QWORD PTR [rip+0x6de9]        # 0x1400090f0
   140002307:	mov    eax,DWORD PTR [rbp-0x4]
   14000230a:	movsxd rdx,eax
   14000230d:	mov    rax,rdx
   140002310:	shl    rax,0x2
   140002314:	add    rax,rdx
   140002317:	shl    rax,0x3
   14000231b:	add    rax,rcx
   14000231e:	mov    rcx,QWORD PTR [rax+0x10]
   140002322:	mov    r8,QWORD PTR [rip+0x6dc7]        # 0x1400090f0
   140002329:	mov    eax,DWORD PTR [rbp-0x4]
   14000232c:	movsxd rdx,eax
   14000232f:	mov    rax,rdx
   140002332:	shl    rax,0x2
   140002336:	add    rax,rdx
   140002339:	shl    rax,0x3
   14000233d:	add    rax,r8
   140002340:	mov    rax,QWORD PTR [rax+0x8]
   140002344:	lea    rdx,[rbp-0x8]
   140002348:	mov    r9,rdx
   14000234b:	mov    r8d,r10d
   14000234e:	mov    rdx,rcx
   140002351:	mov    rcx,rax
   140002354:	mov    rax,QWORD PTR [rip+0x806d]        # 0x14000a3c8
   14000235b:	call   rax
   14000235d:	jmp    0x140002360
   14000235f:	nop
   140002360:	add    DWORD PTR [rbp-0x4],0x1
   140002364:	mov    eax,DWORD PTR [rip+0x6d8e]        # 0x1400090f8
   14000236a:	cmp    DWORD PTR [rbp-0x4],eax
   14000236d:	jl     0x1400022b7
   140002373:	nop
   140002374:	nop
   140002375:	add    rsp,0x30
   140002379:	pop    rbp
   14000237a:	ret
   14000237b:	push   rbp
   14000237c:	mov    rbp,rsp
   14000237f:	sub    rsp,0x20
   140002383:	mov    QWORD PTR [rbp+0x10],rcx
   140002387:	mov    QWORD PTR [rbp+0x18],rdx
   14000238b:	mov    QWORD PTR [rbp+0x20],r8
   14000238f:	cmp    QWORD PTR [rbp+0x20],0x0
   140002394:	je     0x1400023bb
   140002396:	mov    rax,QWORD PTR [rbp+0x10]
   14000239a:	mov    rcx,rax
   14000239d:	call   0x140001fc5
   1400023a2:	mov    rcx,QWORD PTR [rbp+0x20]
   1400023a6:	mov    rdx,QWORD PTR [rbp+0x18]
   1400023aa:	mov    rax,QWORD PTR [rbp+0x10]
   1400023ae:	mov    r8,rcx
   1400023b1:	mov    rcx,rax
   1400023b4:	call   0x140003828
   1400023b9:	jmp    0x1400023bc
   1400023bb:	nop
   1400023bc:	add    rsp,0x20
   1400023c0:	pop    rbp
   1400023c1:	ret
   1400023c2:	push   rbp
   1400023c3:	mov    rbp,rsp
   1400023c6:	add    rsp,0xffffffffffffff80
   1400023ca:	mov    QWORD PTR [rbp+0x10],rcx
   1400023ce:	mov    QWORD PTR [rbp+0x18],rdx
   1400023d2:	mov    QWORD PTR [rbp+0x20],r8
   1400023d6:	mov    rax,QWORD PTR [rbp+0x18]
   1400023da:	sub    rax,QWORD PTR [rbp+0x10]
   1400023de:	mov    QWORD PTR [rbp-0x20],rax
   1400023e2:	mov    rax,QWORD PTR [rbp+0x10]
   1400023e6:	mov    QWORD PTR [rbp-0x8],rax
   1400023ea:	cmp    QWORD PTR [rbp-0x20],0x7
   1400023ef:	jle    0x140002739
   1400023f5:	cmp    QWORD PTR [rbp-0x20],0xb
   1400023fa:	jle    0x140002421
   1400023fc:	mov    rax,QWORD PTR [rbp-0x8]
   140002400:	mov    eax,DWORD PTR [rax]
   140002402:	test   eax,eax
   140002404:	jne    0x140002421
   140002406:	mov    rax,QWORD PTR [rbp-0x8]
   14000240a:	mov    eax,DWORD PTR [rax+0x4]
   14000240d:	test   eax,eax
   14000240f:	jne    0x140002421
   140002411:	mov    rax,QWORD PTR [rbp-0x8]
   140002415:	mov    eax,DWORD PTR [rax+0x8]
   140002418:	test   eax,eax
   14000241a:	jne    0x140002421
   14000241c:	add    QWORD PTR [rbp-0x8],0xc
   140002421:	mov    rax,QWORD PTR [rbp-0x8]
   140002425:	mov    eax,DWORD PTR [rax]
   140002427:	test   eax,eax
   140002429:	jne    0x140002436
   14000242b:	mov    rax,QWORD PTR [rbp-0x8]
   14000242f:	mov    eax,DWORD PTR [rax+0x4]
   140002432:	test   eax,eax
   140002434:	je     0x14000248f
   140002436:	mov    rax,QWORD PTR [rbp-0x8]
   14000243a:	mov    QWORD PTR [rbp-0x18],rax
   14000243e:	jmp    0x140002480
   140002440:	mov    rax,QWORD PTR [rbp-0x18]
   140002444:	mov    eax,DWORD PTR [rax+0x4]
   140002447:	mov    edx,eax
   140002449:	mov    rax,QWORD PTR [rbp+0x20]
   14000244d:	add    rax,rdx
   140002450:	mov    QWORD PTR [rbp-0x20],rax
   140002454:	mov    rax,QWORD PTR [rbp-0x20]
   140002458:	mov    edx,DWORD PTR [rax]
   14000245a:	mov    rax,QWORD PTR [rbp-0x18]
   14000245e:	mov    eax,DWORD PTR [rax]
   140002460:	add    eax,edx
   140002462:	mov    DWORD PTR [rbp-0x4c],eax
   140002465:	mov    rax,QWORD PTR [rbp-0x20]
   140002469:	lea    rdx,[rbp-0x4c]
   14000246d:	mov    r8d,0x4
   140002473:	mov    rcx,rax
   140002476:	call   0x14000237b
   14000247b:	add    QWORD PTR [rbp-0x18],0x8
   140002480:	mov    rax,QWORD PTR [rbp-0x18]
   140002484:	cmp    rax,QWORD PTR [rbp+0x18]
   140002488:	jb     0x140002440
   14000248a:	jmp    0x14000273a
   14000248f:	mov    rax,QWORD PTR [rbp-0x8]
   140002493:	mov    eax,DWORD PTR [rax+0x8]
   140002496:	cmp    eax,0x1
   140002499:	je     0x1400024b3
   14000249b:	mov    rax,QWORD PTR [rbp-0x8]
   14000249f:	mov    eax,DWORD PTR [rax+0x8]
   1400024a2:	mov    edx,eax
   1400024a4:	lea    rax,[rip+0x3385]        # 0x140005830
   1400024ab:	mov    rcx,rax
   1400024ae:	call   0x140001f60
   1400024b3:	mov    rax,QWORD PTR [rbp-0x8]
   1400024b7:	add    rax,0xc
   1400024bb:	mov    QWORD PTR [rbp-0x10],rax
   1400024bf:	jmp    0x140002729
   1400024c4:	mov    rax,QWORD PTR [rbp-0x10]
   1400024c8:	mov    eax,DWORD PTR [rax+0x4]
   1400024cb:	mov    edx,eax
   1400024cd:	mov    rax,QWORD PTR [rbp+0x20]
   1400024d1:	add    rax,rdx
   1400024d4:	mov    QWORD PTR [rbp-0x20],rax
   1400024d8:	mov    rax,QWORD PTR [rbp-0x10]
   1400024dc:	mov    eax,DWORD PTR [rax]
   1400024de:	mov    edx,eax
   1400024e0:	mov    rax,QWORD PTR [rbp+0x20]
   1400024e4:	add    rax,rdx
   1400024e7:	mov    QWORD PTR [rbp-0x28],rax
   1400024eb:	mov    rax,QWORD PTR [rbp-0x28]
   1400024ef:	mov    rax,QWORD PTR [rax]
   1400024f2:	mov    QWORD PTR [rbp-0x28],rax
   1400024f6:	mov    rax,QWORD PTR [rbp-0x10]
   1400024fa:	mov    eax,DWORD PTR [rax+0x8]
   1400024fd:	movzx  eax,al
   140002500:	cmp    eax,0x40
   140002503:	je     0x1400025bf
   140002509:	cmp    eax,0x40
   14000250c:	ja     0x1400025cc
   140002512:	cmp    eax,0x20
   140002515:	je     0x14000258e
   140002517:	cmp    eax,0x20
   14000251a:	ja     0x1400025cc
   140002520:	cmp    eax,0x8
   140002523:	je     0x14000252f
   140002525:	cmp    eax,0x10
   140002528:	je     0x140002562
   14000252a:	jmp    0x1400025cc
   14000252f:	mov    rax,QWORD PTR [rbp-0x20]
   140002533:	movzx  eax,BYTE PTR [rax]
   140002536:	movzx  eax,al
   140002539:	mov    QWORD PTR [rbp-0x48],rax
   14000253d:	mov    rax,QWORD PTR [rbp-0x48]
   140002541:	and    eax,0x80
   140002546:	test   rax,rax
   140002549:	je     0x1400025ec
   14000254f:	mov    rax,QWORD PTR [rbp-0x48]
   140002553:	or     rax,0xffffffffffffff00
   140002559:	mov    QWORD PTR [rbp-0x48],rax
   14000255d:	jmp    0x1400025ec
   140002562:	mov    rax,QWORD PTR [rbp-0x20]
   140002566:	movzx  eax,WORD PTR [rax]
   140002569:	movzx  eax,ax
   14000256c:	mov    QWORD PTR [rbp-0x48],rax
   140002570:	mov    rax,QWORD PTR [rbp-0x48]
   140002574:	and    eax,0x8000
   140002579:	test   rax,rax
   14000257c:	je     0x1400025ef
   14000257e:	mov    rax,QWORD PTR [rbp-0x48]
   140002582:	or     rax,0xffffffffffff0000
   140002588:	mov    QWORD PTR [rbp-0x48],rax
   14000258c:	jmp    0x1400025ef
   14000258e:	mov    rax,QWORD PTR [rbp-0x20]
   140002592:	mov    eax,DWORD PTR [rax]
   140002594:	mov    eax,eax
   140002596:	mov    QWORD PTR [rbp-0x48],rax
   14000259a:	mov    rax,QWORD PTR [rbp-0x48]
   14000259e:	and    eax,0x80000000
   1400025a3:	test   rax,rax
   1400025a6:	je     0x1400025f2
   1400025a8:	mov    rax,QWORD PTR [rbp-0x48]
   1400025ac:	movabs rdx,0xffffffff00000000
   1400025b6:	or     rax,rdx
   1400025b9:	mov    QWORD PTR [rbp-0x48],rax
   1400025bd:	jmp    0x1400025f2
   1400025bf:	mov    rax,QWORD PTR [rbp-0x20]
   1400025c3:	mov    rax,QWORD PTR [rax]
   1400025c6:	mov    QWORD PTR [rbp-0x48],rax
   1400025ca:	jmp    0x1400025f3
   1400025cc:	mov    QWORD PTR [rbp-0x48],0x0
   1400025d4:	mov    rax,QWORD PTR [rbp-0x10]
   1400025d8:	mov    eax,DWORD PTR [rax+0x8]
   1400025db:	movzx  eax,al
   1400025de:	lea    rcx,[rip+0x3283]        # 0x140005868
   1400025e5:	mov    edx,eax
   1400025e7:	call   0x140001f60
   1400025ec:	nop
   1400025ed:	jmp    0x1400025f3
   1400025ef:	nop
   1400025f0:	jmp    0x1400025f3
   1400025f2:	nop
   1400025f3:	mov    rcx,QWORD PTR [rbp-0x48]
   1400025f7:	mov    rax,QWORD PTR [rbp-0x10]
   1400025fb:	mov    eax,DWORD PTR [rax]
   1400025fd:	mov    edx,eax
   1400025ff:	mov    rax,QWORD PTR [rbp+0x20]
   140002603:	add    rdx,rax
   140002606:	mov    rax,rcx
   140002609:	sub    rax,rdx
   14000260c:	mov    QWORD PTR [rbp-0x48],rax
   140002610:	mov    rdx,QWORD PTR [rbp-0x48]
   140002614:	mov    rax,QWORD PTR [rbp-0x28]
   140002618:	add    rax,rdx
   14000261b:	mov    QWORD PTR [rbp-0x48],rax
   14000261f:	mov    rax,QWORD PTR [rbp-0x10]
   140002623:	mov    eax,DWORD PTR [rax+0x8]
   140002626:	and    eax,0xff
   14000262b:	mov    DWORD PTR [rbp-0x2c],eax
   14000262e:	cmp    DWORD PTR [rbp-0x2c],0x3f
   140002632:	ja     0x14000269b
   140002634:	mov    eax,DWORD PTR [rbp-0x2c]
   140002637:	mov    edx,0x1
   14000263c:	mov    ecx,eax
   14000263e:	shl    rdx,cl
   140002641:	mov    rax,rdx
   140002644:	sub    rax,0x1
   140002648:	mov    QWORD PTR [rbp-0x38],rax
   14000264c:	mov    eax,DWORD PTR [rbp-0x2c]
   14000264f:	sub    eax,0x1
   140002652:	mov    rdx,0xffffffffffffffff
   140002659:	mov    ecx,eax
   14000265b:	shl    rdx,cl
   14000265e:	mov    rax,rdx
   140002661:	mov    QWORD PTR [rbp-0x40],rax
   140002665:	mov    rax,QWORD PTR [rbp-0x48]
   140002669:	cmp    QWORD PTR [rbp-0x38],rax
   14000266d:	jl     0x140002679
   14000266f:	mov    rax,QWORD PTR [rbp-0x48]
   140002673:	cmp    QWORD PTR [rbp-0x40],rax
   140002677:	jle    0x14000269b
   140002679:	mov    rdx,QWORD PTR [rbp-0x48]
   14000267d:	mov    r9,QWORD PTR [rbp-0x28]
   140002681:	mov    r8,QWORD PTR [rbp-0x20]
   140002685:	mov    eax,DWORD PTR [rbp-0x2c]
   140002688:	lea    rcx,[rip+0x3209]        # 0x140005898
   14000268f:	mov    QWORD PTR [rsp+0x20],rdx
   140002694:	mov    edx,eax
   140002696:	call   0x140001f60
   14000269b:	mov    rax,QWORD PTR [rbp-0x10]
   14000269f:	mov    eax,DWORD PTR [rax+0x8]
   1400026a2:	movzx  eax,al
   1400026a5:	cmp    eax,0x40
   1400026a8:	je     0x14000270d
   1400026aa:	cmp    eax,0x40
   1400026ad:	ja     0x140002724
   1400026af:	cmp    eax,0x20
   1400026b2:	je     0x1400026f5
   1400026b4:	cmp    eax,0x20
   1400026b7:	ja     0x140002724
   1400026b9:	cmp    eax,0x8
   1400026bc:	je     0x1400026c5
   1400026be:	cmp    eax,0x10
   1400026c1:	je     0x1400026dd
   1400026c3:	jmp    0x140002724
   1400026c5:	mov    rax,QWORD PTR [rbp-0x20]
   1400026c9:	lea    rdx,[rbp-0x48]
   1400026cd:	mov    r8d,0x1
   1400026d3:	mov    rcx,rax
   1400026d6:	call   0x14000237b
   1400026db:	jmp    0x140002724
   1400026dd:	mov    rax,QWORD PTR [rbp-0x20]
   1400026e1:	lea    rdx,[rbp-0x48]
   1400026e5:	mov    r8d,0x2
   1400026eb:	mov    rcx,rax
   1400026ee:	call   0x14000237b
   1400026f3:	jmp    0x140002724
   1400026f5:	mov    rax,QWORD PTR [rbp-0x20]
   1400026f9:	lea    rdx,[rbp-0x48]
   1400026fd:	mov    r8d,0x4
   140002703:	mov    rcx,rax
   140002706:	call   0x14000237b
   14000270b:	jmp    0x140002724
   14000270d:	mov    rax,QWORD PTR [rbp-0x20]
   140002711:	lea    rdx,[rbp-0x48]
   140002715:	mov    r8d,0x8
   14000271b:	mov    rcx,rax
   14000271e:	call   0x14000237b
   140002723:	nop
   140002724:	add    QWORD PTR [rbp-0x10],0xc
   140002729:	mov    rax,QWORD PTR [rbp-0x10]
   14000272d:	cmp    rax,QWORD PTR [rbp+0x18]
   140002731:	jb     0x1400024c4
   140002737:	jmp    0x14000273a
   140002739:	nop
   14000273a:	sub    rsp,0xffffffffffffff80
   14000273e:	pop    rbp
   14000273f:	ret
   140002740:	push   rbp
   140002741:	mov    rbp,rsp
   140002744:	sub    rsp,0x30
   140002748:	mov    eax,DWORD PTR [rip+0x69ae]        # 0x1400090fc
   14000274e:	test   eax,eax
   140002750:	jne    0x1400027de
   140002756:	mov    eax,DWORD PTR [rip+0x69a0]        # 0x1400090fc
   14000275c:	add    eax,0x1
   14000275f:	mov    DWORD PTR [rip+0x6997],eax        # 0x1400090fc
   140002765:	call   0x14000328b
   14000276a:	mov    DWORD PTR [rbp-0x4],eax
   14000276d:	mov    eax,DWORD PTR [rbp-0x4]
   140002770:	movsxd rdx,eax
   140002773:	mov    rax,rdx
   140002776:	shl    rax,0x2
   14000277a:	add    rax,rdx
   14000277d:	shl    rax,0x3
   140002781:	add    rax,0xf
   140002785:	shr    rax,0x4
   140002789:	shl    rax,0x4
   14000278d:	call   0x140003510
   140002792:	sub    rsp,rax
   140002795:	lea    rax,[rsp+0x20]
   14000279a:	add    rax,0xf
   14000279e:	shr    rax,0x4
   1400027a2:	shl    rax,0x4
   1400027a6:	mov    QWORD PTR [rip+0x6943],rax        # 0x1400090f0
   1400027ad:	mov    DWORD PTR [rip+0x6941],0x0        # 0x1400090f8
   1400027b7:	mov    rcx,QWORD PTR [rip+0x3182]        # 0x140005940
   1400027be:	mov    rdx,QWORD PTR [rip+0x318b]        # 0x140005950
   1400027c5:	mov    rax,QWORD PTR [rip+0x3194]        # 0x140005960
   1400027cc:	mov    r8,rcx
   1400027cf:	mov    rcx,rax
   1400027d2:	call   0x1400023c2
   1400027d7:	call   0x1400022a3
   1400027dc:	jmp    0x1400027df
   1400027de:	nop
   1400027df:	mov    rsp,rbp
   1400027e2:	pop    rbp
   1400027e3:	ret
   1400027e4:	nop
   1400027e5:	nop
   1400027e6:	nop
   1400027e7:	nop
   1400027e8:	nop
   1400027e9:	nop
   1400027ea:	nop
   1400027eb:	nop
   1400027ec:	nop
   1400027ed:	nop
   1400027ee:	nop
   1400027ef:	nop
   1400027f0:	push   rbp
   1400027f1:	mov    rbp,rsp
   1400027f4:	sub    rsp,0x50
   1400027f8:	mov    DWORD PTR [rbp+0x10],ecx
   1400027fb:	mov    QWORD PTR [rbp+0x18],rdx
   1400027ff:	movsd  QWORD PTR [rbp+0x20],xmm2
   140002804:	movsd  QWORD PTR [rbp+0x28],xmm3
   140002809:	mov    rax,QWORD PTR [rip+0x68f0]        # 0x140009100
   140002810:	test   rax,rax
   140002813:	je     0x140002853
   140002815:	mov    eax,DWORD PTR [rbp+0x10]
   140002818:	mov    DWORD PTR [rbp-0x30],eax
   14000281b:	mov    rax,QWORD PTR [rbp+0x18]
   14000281f:	mov    QWORD PTR [rbp-0x28],rax
   140002823:	movsd  xmm0,QWORD PTR [rbp+0x20]
   140002828:	movsd  QWORD PTR [rbp-0x20],xmm0
   14000282d:	movsd  xmm0,QWORD PTR [rbp+0x28]
   140002832:	movsd  QWORD PTR [rbp-0x18],xmm0
   140002837:	movsd  xmm0,QWORD PTR [rbp+0x30]
   14000283c:	movsd  QWORD PTR [rbp-0x10],xmm0
   140002841:	mov    rdx,QWORD PTR [rip+0x68b8]        # 0x140009100
   140002848:	lea    rax,[rbp-0x30]
   14000284c:	mov    rcx,rax
   14000284f:	call   rdx
   140002851:	jmp    0x140002854
   140002853:	nop
   140002854:	add    rsp,0x50
   140002858:	pop    rbp
   140002859:	ret
   14000285a:	push   rbp
   14000285b:	mov    rbp,rsp
   14000285e:	sub    rsp,0x20
   140002862:	mov    QWORD PTR [rbp+0x10],rcx
   140002866:	mov    rax,QWORD PTR [rbp+0x10]
   14000286a:	mov    QWORD PTR [rip+0x688f],rax        # 0x140009100
   140002871:	mov    rax,QWORD PTR [rbp+0x10]
   140002875:	mov    rcx,rax
   140002878:	call   0x140003830
   14000287d:	nop
   14000287e:	add    rsp,0x20
   140002882:	pop    rbp
   140002883:	ret
   140002884:	nop
   140002885:	nop
   140002886:	nop
   140002887:	nop
   140002888:	nop
   140002889:	nop
   14000288a:	nop
   14000288b:	nop
   14000288c:	nop
   14000288d:	nop
   14000288e:	nop
   14000288f:	nop
   140002890:	push   rbp
   140002891:	mov    rbp,rsp
   140002894:	sub    rsp,0x30
   140002898:	mov    QWORD PTR [rbp+0x10],rcx
   14000289c:	mov    QWORD PTR [rbp+0x18],rdx
   1400028a0:	mov    QWORD PTR [rbp+0x20],r8
   1400028a4:	mov    QWORD PTR [rbp+0x28],r9
   1400028a8:	mov    DWORD PTR [rbp-0x4],0x1
   1400028af:	mov    DWORD PTR [rbp-0x8],0x0
   1400028b6:	mov    rax,QWORD PTR [rbp+0x10]
   1400028ba:	mov    eax,DWORD PTR [rax+0x4]
   1400028bd:	and    eax,0x2
   1400028c0:	test   eax,eax
   1400028c2:	je     0x1400028ce
   1400028c4:	mov    eax,0x1
   1400028c9:	jmp    0x140002ae4
   1400028ce:	mov    rax,QWORD PTR [rbp+0x10]
   1400028d2:	mov    eax,DWORD PTR [rax]
   1400028d4:	and    eax,0x20ffffff
   1400028d9:	cmp    eax,0x20474343
   1400028de:	jne    0x1400028f8
   1400028e0:	mov    rax,QWORD PTR [rbp+0x10]
   1400028e4:	mov    eax,DWORD PTR [rax+0x4]
   1400028e7:	and    eax,0x1
   1400028ea:	test   eax,eax
   1400028ec:	jne    0x1400028f8
   1400028ee:	mov    eax,0x0
   1400028f3:	jmp    0x140002ae4
   1400028f8:	mov    rax,QWORD PTR [rbp+0x10]
   1400028fc:	mov    eax,DWORD PTR [rax]
   1400028fe:	cmp    eax,0xc0000096
   140002903:	je     0x140002a1b
   140002909:	cmp    eax,0xc0000096
   14000290e:	ja     0x140002ad7
   140002914:	cmp    eax,0xc0000095
   140002919:	ja     0x140002ad7
   14000291f:	cmp    eax,0xc0000094
   140002924:	jae    0x140002a76
   14000292a:	cmp    eax,0xc0000093
   14000292f:	je     0x140002a6f
   140002935:	cmp    eax,0xc0000093
   14000293a:	ja     0x140002ad7
   140002940:	cmp    eax,0xc0000092
   140002945:	je     0x140002ace
   14000294b:	cmp    eax,0xc0000092
   140002950:	ja     0x140002ad7
   140002956:	cmp    eax,0xc0000091
   14000295b:	ja     0x140002ad7
   140002961:	cmp    eax,0xc000008d
   140002966:	jae    0x140002a6f
   14000296c:	cmp    eax,0xc000008c
   140002971:	je     0x140002ace
   140002977:	cmp    eax,0xc000008c
   14000297c:	ja     0x140002ad7
   140002982:	cmp    eax,0xc000001d
   140002987:	je     0x140002a1b
   14000298d:	cmp    eax,0xc000001d
   140002992:	ja     0x140002ad7
   140002998:	cmp    eax,0xc0000008
   14000299d:	je     0x140002ace
   1400029a3:	cmp    eax,0xc0000008
   1400029a8:	ja     0x140002ad7
   1400029ae:	cmp    eax,0x80000002
   1400029b3:	je     0x140002ace
   1400029b9:	cmp    eax,0xc0000005
   1400029be:	jne    0x140002ad7
   1400029c4:	mov    edx,0x0
   1400029c9:	mov    ecx,0xb
   1400029ce:	call   0x140003818
   1400029d3:	mov    QWORD PTR [rbp-0x10],rax
   1400029d7:	cmp    QWORD PTR [rbp-0x10],0x1
   1400029dc:	jne    0x1400029f9
   1400029de:	mov    edx,0x1
   1400029e3:	mov    ecx,0xb
   1400029e8:	call   0x140003818
   1400029ed:	mov    DWORD PTR [rbp-0x4],0x0
   1400029f4:	jmp    0x140002ada
   1400029f9:	cmp    QWORD PTR [rbp-0x10],0x0
   1400029fe:	je     0x140002ada
   140002a04:	mov    rax,QWORD PTR [rbp-0x10]
   140002a08:	mov    ecx,0xb
   140002a0d:	call   rax
   140002a0f:	mov    DWORD PTR [rbp-0x4],0x0
   140002a16:	jmp    0x140002ada
   140002a1b:	mov    edx,0x0
   140002a20:	mov    ecx,0x4
   140002a25:	call   0x140003818
   140002a2a:	mov    QWORD PTR [rbp-0x10],rax
   140002a2e:	cmp    QWORD PTR [rbp-0x10],0x1
   140002a33:	jne    0x140002a50
   140002a35:	mov    edx,0x1
   140002a3a:	mov    ecx,0x4
   140002a3f:	call   0x140003818
   140002a44:	mov    DWORD PTR [rbp-0x4],0x0
   140002a4b:	jmp    0x140002add
   140002a50:	cmp    QWORD PTR [rbp-0x10],0x0
   140002a55:	je     0x140002add
   140002a5b:	mov    rax,QWORD PTR [rbp-0x10]
   140002a5f:	mov    ecx,0x4
   140002a64:	call   rax
   140002a66:	mov    DWORD PTR [rbp-0x4],0x0
   140002a6d:	jmp    0x140002add
   140002a6f:	mov    DWORD PTR [rbp-0x8],0x1
   140002a76:	mov    edx,0x0
   140002a7b:	mov    ecx,0x8
   140002a80:	call   0x140003818
   140002a85:	mov    QWORD PTR [rbp-0x10],rax
   140002a89:	cmp    QWORD PTR [rbp-0x10],0x1
   140002a8e:	jne    0x140002ab3
   140002a90:	mov    edx,0x1
   140002a95:	mov    ecx,0x8
   140002a9a:	call   0x140003818
   140002a9f:	cmp    DWORD PTR [rbp-0x8],0x0
   140002aa3:	je     0x140002aaa
   140002aa5:	call   0x140003050
   140002aaa:	mov    DWORD PTR [rbp-0x4],0x0
   140002ab1:	jmp    0x140002ae0
   140002ab3:	cmp    QWORD PTR [rbp-0x10],0x0
   140002ab8:	je     0x140002ae0
   140002aba:	mov    rax,QWORD PTR [rbp-0x10]
   140002abe:	mov    ecx,0x8
   140002ac3:	call   rax
   140002ac5:	mov    DWORD PTR [rbp-0x4],0x0
   140002acc:	jmp    0x140002ae0
   140002ace:	mov    DWORD PTR [rbp-0x4],0x0
   140002ad5:	jmp    0x140002ae1
   140002ad7:	nop
   140002ad8:	jmp    0x140002ae1
   140002ada:	nop
   140002adb:	jmp    0x140002ae1
   140002add:	nop
   140002ade:	jmp    0x140002ae1
   140002ae0:	nop
   140002ae1:	mov    eax,DWORD PTR [rbp-0x4]
   140002ae4:	add    rsp,0x30
   140002ae8:	pop    rbp
   140002ae9:	ret
   140002aea:	push   rbp
   140002aeb:	mov    rbp,rsp
   140002aee:	sub    rsp,0x30
   140002af2:	mov    QWORD PTR [rbp+0x10],rcx
   140002af6:	mov    DWORD PTR [rbp-0x4],0x0
   140002afd:	mov    DWORD PTR [rbp-0x8],0x0
   140002b04:	mov    rax,QWORD PTR [rbp+0x10]
   140002b08:	mov    rax,QWORD PTR [rax]
   140002b0b:	mov    eax,DWORD PTR [rax]
   140002b0d:	and    eax,0x20ffffff
   140002b12:	cmp    eax,0x20474343
   140002b17:	jne    0x140002b34
   140002b19:	mov    rax,QWORD PTR [rbp+0x10]
   140002b1d:	mov    rax,QWORD PTR [rax]
   140002b20:	mov    eax,DWORD PTR [rax+0x4]
   140002b23:	and    eax,0x1
   140002b26:	test   eax,eax
   140002b28:	jne    0x140002b34
   140002b2a:	mov    eax,0xffffffff
   140002b2f:	jmp    0x140002d48
   140002b34:	mov    rax,QWORD PTR [rbp+0x10]
   140002b38:	mov    rax,QWORD PTR [rax]
   140002b3b:	mov    eax,DWORD PTR [rax]
   140002b3d:	cmp    eax,0xc0000096
   140002b42:	je     0x140002c5a
   140002b48:	cmp    eax,0xc0000096
   140002b4d:	ja     0x140002d16
   140002b53:	cmp    eax,0xc0000095
   140002b58:	ja     0x140002d16
   140002b5e:	cmp    eax,0xc0000094
   140002b63:	jae    0x140002cb5
   140002b69:	cmp    eax,0xc0000093
   140002b6e:	je     0x140002cae
   140002b74:	cmp    eax,0xc0000093
   140002b79:	ja     0x140002d16
   140002b7f:	cmp    eax,0xc0000092
   140002b84:	je     0x140002d0d
   140002b8a:	cmp    eax,0xc0000092
   140002b8f:	ja     0x140002d16
   140002b95:	cmp    eax,0xc0000091
   140002b9a:	ja     0x140002d16
   140002ba0:	cmp    eax,0xc000008d
   140002ba5:	jae    0x140002cae
   140002bab:	cmp    eax,0xc000008c
   140002bb0:	je     0x140002d0d
   140002bb6:	cmp    eax,0xc000008c
   140002bbb:	ja     0x140002d16
   140002bc1:	cmp    eax,0xc000001d
   140002bc6:	je     0x140002c5a
   140002bcc:	cmp    eax,0xc000001d
   140002bd1:	ja     0x140002d16
   140002bd7:	cmp    eax,0xc0000008
   140002bdc:	je     0x140002d0d
   140002be2:	cmp    eax,0xc0000008
   140002be7:	ja     0x140002d16
   140002bed:	cmp    eax,0x80000002
   140002bf2:	je     0x140002d0d
   140002bf8:	cmp    eax,0xc0000005
   140002bfd:	jne    0x140002d16
   140002c03:	mov    edx,0x0
   140002c08:	mov    ecx,0xb
   140002c0d:	call   0x140003818
   140002c12:	mov    QWORD PTR [rbp-0x10],rax
   140002c16:	cmp    QWORD PTR [rbp-0x10],0x1
   140002c1b:	jne    0x140002c38
   140002c1d:	mov    edx,0x1
   140002c22:	mov    ecx,0xb
   140002c27:	call   0x140003818
   140002c2c:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002c33:	jmp    0x140002d19
   140002c38:	cmp    QWORD PTR [rbp-0x10],0x0
   140002c3d:	je     0x140002d19
   140002c43:	mov    rax,QWORD PTR [rbp-0x10]
   140002c47:	mov    ecx,0xb
   140002c4c:	call   rax
   140002c4e:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002c55:	jmp    0x140002d19
   140002c5a:	mov    edx,0x0
   140002c5f:	mov    ecx,0x4
   140002c64:	call   0x140003818
   140002c69:	mov    QWORD PTR [rbp-0x10],rax
   140002c6d:	cmp    QWORD PTR [rbp-0x10],0x1
   140002c72:	jne    0x140002c8f
   140002c74:	mov    edx,0x1
   140002c79:	mov    ecx,0x4
   140002c7e:	call   0x140003818
   140002c83:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002c8a:	jmp    0x140002d1c
   140002c8f:	cmp    QWORD PTR [rbp-0x10],0x0
   140002c94:	je     0x140002d1c
   140002c9a:	mov    rax,QWORD PTR [rbp-0x10]
   140002c9e:	mov    ecx,0x4
   140002ca3:	call   rax
   140002ca5:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002cac:	jmp    0x140002d1c
   140002cae:	mov    DWORD PTR [rbp-0x8],0x1
   140002cb5:	mov    edx,0x0
   140002cba:	mov    ecx,0x8
   140002cbf:	call   0x140003818
   140002cc4:	mov    QWORD PTR [rbp-0x10],rax
   140002cc8:	cmp    QWORD PTR [rbp-0x10],0x1
   140002ccd:	jne    0x140002cf2
   140002ccf:	mov    edx,0x1
   140002cd4:	mov    ecx,0x8
   140002cd9:	call   0x140003818
   140002cde:	cmp    DWORD PTR [rbp-0x8],0x0
   140002ce2:	je     0x140002ce9
   140002ce4:	call   0x140003050
   140002ce9:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002cf0:	jmp    0x140002d1f
   140002cf2:	cmp    QWORD PTR [rbp-0x10],0x0
   140002cf7:	je     0x140002d1f
   140002cf9:	mov    rax,QWORD PTR [rbp-0x10]
   140002cfd:	mov    ecx,0x8
   140002d02:	call   rax
   140002d04:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002d0b:	jmp    0x140002d1f
   140002d0d:	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002d14:	jmp    0x140002d20
   140002d16:	nop
   140002d17:	jmp    0x140002d20
   140002d19:	nop
   140002d1a:	jmp    0x140002d20
   140002d1c:	nop
   140002d1d:	jmp    0x140002d20
   140002d1f:	nop
   140002d20:	cmp    DWORD PTR [rbp-0x4],0x0
   140002d24:	jne    0x140002d45
   140002d26:	mov    rax,QWORD PTR [rip+0x63f3]        # 0x140009120
   140002d2d:	test   rax,rax
   140002d30:	je     0x140002d45
   140002d32:	mov    rdx,QWORD PTR [rip+0x63e7]        # 0x140009120
   140002d39:	mov    rax,QWORD PTR [rbp+0x10]
   140002d3d:	mov    rcx,rax
   140002d40:	call   rdx
   140002d42:	mov    DWORD PTR [rbp-0x4],eax
   140002d45:	mov    eax,DWORD PTR [rbp-0x4]
   140002d48:	add    rsp,0x30
   140002d4c:	pop    rbp
   140002d4d:	ret
   140002d4e:	nop
   140002d4f:	nop
   140002d50:	push   rbp
   140002d51:	mov    rbp,rsp
   140002d54:	sub    rsp,0x30
   140002d58:	mov    DWORD PTR [rbp+0x10],ecx
   140002d5b:	mov    QWORD PTR [rbp+0x18],rdx
   140002d5f:	mov    eax,DWORD PTR [rip+0x6403]        # 0x140009168
   140002d65:	test   eax,eax
   140002d67:	jne    0x140002d70
   140002d69:	mov    eax,0x0
   140002d6e:	jmp    0x140002deb
   140002d70:	mov    edx,0x18
   140002d75:	mov    ecx,0x1
   140002d7a:	call   0x140003858
   140002d7f:	mov    QWORD PTR [rbp-0x8],rax
   140002d83:	cmp    QWORD PTR [rbp-0x8],0x0
   140002d88:	jne    0x140002d91
   140002d8a:	mov    eax,0xffffffff
   140002d8f:	jmp    0x140002deb
   140002d91:	mov    rax,QWORD PTR [rbp-0x8]
   140002d95:	mov    edx,DWORD PTR [rbp+0x10]
   140002d98:	mov    DWORD PTR [rax],edx
   140002d9a:	mov    rax,QWORD PTR [rbp-0x8]
   140002d9e:	mov    rdx,QWORD PTR [rbp+0x18]
   140002da2:	mov    QWORD PTR [rax+0x8],rdx
   140002da6:	lea    rax,[rip+0x6393]        # 0x140009140
   140002dad:	mov    rcx,rax
   140002db0:	mov    rax,QWORD PTR [rip+0x7559]        # 0x14000a310
   140002db7:	call   rax
   140002db9:	mov    rdx,QWORD PTR [rip+0x63b0]        # 0x140009170
   140002dc0:	mov    rax,QWORD PTR [rbp-0x8]
   140002dc4:	mov    QWORD PTR [rax+0x10],rdx
   140002dc8:	mov    rax,QWORD PTR [rbp-0x8]
   140002dcc:	mov    QWORD PTR [rip+0x639d],rax        # 0x140009170
   140002dd3:	lea    rax,[rip+0x6366]        # 0x140009140
   140002dda:	mov    rcx,rax
   140002ddd:	mov    rax,QWORD PTR [rip+0x758c]        # 0x14000a370
   140002de4:	call   rax
   140002de6:	mov    eax,0x0
   140002deb:	add    rsp,0x30
   140002def:	pop    rbp
   140002df0:	ret
   140002df1:	push   rbp
   140002df2:	mov    rbp,rsp
   140002df5:	sub    rsp,0x30
   140002df9:	mov    DWORD PTR [rbp+0x10],ecx
   140002dfc:	mov    eax,DWORD PTR [rip+0x6366]        # 0x140009168
   140002e02:	test   eax,eax
   140002e04:	jne    0x140002e10
   140002e06:	mov    eax,0x0
   140002e0b:	jmp    0x140002eac
   140002e10:	lea    rax,[rip+0x6329]        # 0x140009140
   140002e17:	mov    rcx,rax
   140002e1a:	mov    rax,QWORD PTR [rip+0x74ef]        # 0x14000a310
   140002e21:	call   rax
   140002e23:	mov    QWORD PTR [rbp-0x8],0x0
   140002e2b:	mov    rax,QWORD PTR [rip+0x633e]        # 0x140009170
   140002e32:	mov    QWORD PTR [rbp-0x10],rax
   140002e36:	jmp    0x140002e8d
   140002e38:	mov    rax,QWORD PTR [rbp-0x10]
   140002e3c:	mov    eax,DWORD PTR [rax]
   140002e3e:	cmp    DWORD PTR [rbp+0x10],eax
   140002e41:	jne    0x140002e79
   140002e43:	cmp    QWORD PTR [rbp-0x8],0x0
   140002e48:	jne    0x140002e5b
   140002e4a:	mov    rax,QWORD PTR [rbp-0x10]
   140002e4e:	mov    rax,QWORD PTR [rax+0x10]
   140002e52:	mov    QWORD PTR [rip+0x6317],rax        # 0x140009170
   140002e59:	jmp    0x140002e6b
   140002e5b:	mov    rax,QWORD PTR [rbp-0x10]
   140002e5f:	mov    rdx,QWORD PTR [rax+0x10]
   140002e63:	mov    rax,QWORD PTR [rbp-0x8]
   140002e67:	mov    QWORD PTR [rax+0x10],rdx
   140002e6b:	mov    rax,QWORD PTR [rbp-0x10]
   140002e6f:	mov    rcx,rax
   140002e72:	call   0x140003860
   140002e77:	jmp    0x140002e94
   140002e79:	mov    rax,QWORD PTR [rbp-0x10]
   140002e7d:	mov    QWORD PTR [rbp-0x8],rax
   140002e81:	mov    rax,QWORD PTR [rbp-0x10]
   140002e85:	mov    rax,QWORD PTR [rax+0x10]
   140002e89:	mov    QWORD PTR [rbp-0x10],rax
   140002e8d:	cmp    QWORD PTR [rbp-0x10],0x0
   140002e92:	jne    0x140002e38
   140002e94:	lea    rax,[rip+0x62a5]        # 0x140009140
   140002e9b:	mov    rcx,rax
   140002e9e:	mov    rax,QWORD PTR [rip+0x74cb]        # 0x14000a370
   140002ea5:	call   rax
   140002ea7:	mov    eax,0x0
   140002eac:	add    rsp,0x30
   140002eb0:	pop    rbp
   140002eb1:	ret
   140002eb2:	push   rbp
   140002eb3:	mov    rbp,rsp
   140002eb6:	sub    rsp,0x30
   140002eba:	mov    eax,DWORD PTR [rip+0x62a8]        # 0x140009168
   140002ec0:	test   eax,eax
   140002ec2:	je     0x140002f4a
   140002ec8:	lea    rax,[rip+0x6271]        # 0x140009140
   140002ecf:	mov    rcx,rax
   140002ed2:	mov    rax,QWORD PTR [rip+0x7437]        # 0x14000a310
   140002ed9:	call   rax
   140002edb:	mov    rax,QWORD PTR [rip+0x628e]        # 0x140009170
   140002ee2:	mov    QWORD PTR [rbp-0x8],rax
   140002ee6:	jmp    0x140002f2e
   140002ee8:	mov    rax,QWORD PTR [rbp-0x8]
   140002eec:	mov    eax,DWORD PTR [rax]
   140002eee:	mov    ecx,eax
   140002ef0:	mov    rax,QWORD PTR [rip+0x74b9]        # 0x14000a3b0
   140002ef7:	call   rax
   140002ef9:	mov    QWORD PTR [rbp-0x10],rax
   140002efd:	mov    rax,QWORD PTR [rip+0x7444]        # 0x14000a348
   140002f04:	call   rax
   140002f06:	test   eax,eax
   140002f08:	jne    0x140002f22
   140002f0a:	cmp    QWORD PTR [rbp-0x10],0x0
   140002f0f:	je     0x140002f22
   140002f11:	mov    rax,QWORD PTR [rbp-0x8]
   140002f15:	mov    rdx,QWORD PTR [rax+0x8]
   140002f19:	mov    rax,QWORD PTR [rbp-0x10]
   140002f1d:	mov    rcx,rax
   140002f20:	call   rdx
   140002f22:	mov    rax,QWORD PTR [rbp-0x8]
   140002f26:	mov    rax,QWORD PTR [rax+0x10]
   140002f2a:	mov    QWORD PTR [rbp-0x8],rax
   140002f2e:	cmp    QWORD PTR [rbp-0x8],0x0
   140002f33:	jne    0x140002ee8
   140002f35:	lea    rax,[rip+0x6204]        # 0x140009140
   140002f3c:	mov    rcx,rax
   140002f3f:	mov    rax,QWORD PTR [rip+0x742a]        # 0x14000a370
   140002f46:	call   rax
   140002f48:	jmp    0x140002f4b
   140002f4a:	nop
   140002f4b:	add    rsp,0x30
   140002f4f:	pop    rbp
   140002f50:	ret
   140002f51:	push   rbp
   140002f52:	mov    rbp,rsp
   140002f55:	sub    rsp,0x30
   140002f59:	mov    QWORD PTR [rbp+0x10],rcx
   140002f5d:	mov    DWORD PTR [rbp+0x18],edx
   140002f60:	mov    QWORD PTR [rbp+0x20],r8
   140002f64:	cmp    DWORD PTR [rbp+0x18],0x3
   140002f68:	je     0x14000303a
   140002f6e:	cmp    DWORD PTR [rbp+0x18],0x3
   140002f72:	ja     0x140003042
   140002f78:	cmp    DWORD PTR [rbp+0x18],0x2
   140002f7c:	je     0x140003033
   140002f82:	cmp    DWORD PTR [rbp+0x18],0x2
   140002f86:	ja     0x140003042
   140002f8c:	cmp    DWORD PTR [rbp+0x18],0x0
   140002f90:	je     0x140002fc5
   140002f92:	cmp    DWORD PTR [rbp+0x18],0x1
   140002f96:	jne    0x140003042
   140002f9c:	mov    eax,DWORD PTR [rip+0x61c6]        # 0x140009168
   140002fa2:	test   eax,eax
   140002fa4:	jne    0x140002fb9
   140002fa6:	lea    rax,[rip+0x6193]        # 0x140009140
   140002fad:	mov    rcx,rax
   140002fb0:	mov    rax,QWORD PTR [rip+0x73b1]        # 0x14000a368
   140002fb7:	call   rax
   140002fb9:	mov    DWORD PTR [rip+0x61a5],0x1        # 0x140009168
   140002fc3:	jmp    0x140003042
   140002fc5:	call   0x140002eb2
   140002fca:	mov    eax,DWORD PTR [rip+0x6198]        # 0x140009168
   140002fd0:	cmp    eax,0x1
   140002fd3:	jne    0x140003041
   140002fd5:	mov    rax,QWORD PTR [rip+0x6194]        # 0x140009170
   140002fdc:	mov    QWORD PTR [rbp-0x8],rax
   140002fe0:	jmp    0x140003002
   140002fe2:	mov    rax,QWORD PTR [rbp-0x8]
   140002fe6:	mov    rax,QWORD PTR [rax+0x10]
   140002fea:	mov    QWORD PTR [rbp-0x10],rax
   140002fee:	mov    rax,QWORD PTR [rbp-0x8]
   140002ff2:	mov    rcx,rax
   140002ff5:	call   0x140003860
   140002ffa:	mov    rax,QWORD PTR [rbp-0x10]
   140002ffe:	mov    QWORD PTR [rbp-0x8],rax
   140003002:	cmp    QWORD PTR [rbp-0x8],0x0
   140003007:	jne    0x140002fe2
   140003009:	mov    QWORD PTR [rip+0x615c],0x0        # 0x140009170
   140003014:	mov    DWORD PTR [rip+0x614a],0x0        # 0x140009168
   14000301e:	lea    rax,[rip+0x611b]        # 0x140009140
   140003025:	mov    rcx,rax
   140003028:	mov    rax,QWORD PTR [rip+0x72d9]        # 0x14000a308
   14000302f:	call   rax
   140003031:	jmp    0x140003041
   140003033:	call   0x140003050
   140003038:	jmp    0x140003042
   14000303a:	call   0x140002eb2
   14000303f:	jmp    0x140003042
   140003041:	nop
   140003042:	mov    eax,0x1
   140003047:	add    rsp,0x30
   14000304b:	pop    rbp
   14000304c:	ret
   14000304d:	nop
   14000304e:	nop
   14000304f:	nop
   140003050:	push   rbp
   140003051:	mov    rbp,rsp
   140003054:	fninit
   140003056:	nop
   140003057:	pop    rbp
   140003058:	ret
   140003059:	nop
   14000305a:	nop
   14000305b:	nop
   14000305c:	nop
   14000305d:	nop
   14000305e:	nop
   14000305f:	nop
   140003060:	push   rbp
   140003061:	mov    rbp,rsp
   140003064:	sub    rsp,0x20
   140003068:	mov    QWORD PTR [rbp+0x10],rcx
   14000306c:	mov    rax,QWORD PTR [rbp+0x10]
   140003070:	mov    QWORD PTR [rbp-0x8],rax
   140003074:	mov    rax,QWORD PTR [rbp-0x8]
   140003078:	movzx  eax,WORD PTR [rax]
   14000307b:	cmp    ax,0x5a4d
   14000307f:	je     0x140003088
   140003081:	mov    eax,0x0
   140003086:	jmp    0x1400030d6
   140003088:	mov    rax,QWORD PTR [rbp-0x8]
   14000308c:	mov    eax,DWORD PTR [rax+0x3c]
   14000308f:	movsxd rdx,eax
   140003092:	mov    rax,QWORD PTR [rbp-0x8]
   140003096:	add    rax,rdx
   140003099:	mov    QWORD PTR [rbp-0x10],rax
   14000309d:	mov    rax,QWORD PTR [rbp-0x10]
   1400030a1:	mov    eax,DWORD PTR [rax]
   1400030a3:	cmp    eax,0x4550
   1400030a8:	je     0x1400030b1
   1400030aa:	mov    eax,0x0
   1400030af:	jmp    0x1400030d6
   1400030b1:	mov    rax,QWORD PTR [rbp-0x10]
   1400030b5:	add    rax,0x18
   1400030b9:	mov    QWORD PTR [rbp-0x18],rax
   1400030bd:	mov    rax,QWORD PTR [rbp-0x18]
   1400030c1:	movzx  eax,WORD PTR [rax]
   1400030c4:	cmp    ax,0x20b
   1400030c8:	je     0x1400030d1
   1400030ca:	mov    eax,0x0
   1400030cf:	jmp    0x1400030d6
   1400030d1:	mov    eax,0x1
   1400030d6:	add    rsp,0x20
   1400030da:	pop    rbp
   1400030db:	ret
   1400030dc:	push   rbp
   1400030dd:	mov    rbp,rsp
   1400030e0:	sub    rsp,0x20
   1400030e4:	mov    QWORD PTR [rbp+0x10],rcx
   1400030e8:	mov    QWORD PTR [rbp+0x18],rdx
   1400030ec:	mov    rax,QWORD PTR [rbp+0x10]
   1400030f0:	mov    eax,DWORD PTR [rax+0x3c]
   1400030f3:	movsxd rdx,eax
   1400030f6:	mov    rax,QWORD PTR [rbp+0x10]
   1400030fa:	add    rax,rdx
   1400030fd:	mov    QWORD PTR [rbp-0x18],rax
   140003101:	mov    DWORD PTR [rbp-0xc],0x0
   140003108:	mov    rax,QWORD PTR [rbp-0x18]
   14000310c:	movzx  eax,WORD PTR [rax+0x14]
   140003110:	movzx  edx,ax
   140003113:	mov    rax,QWORD PTR [rbp-0x18]
   140003117:	add    rax,rdx
   14000311a:	add    rax,0x18
   14000311e:	mov    QWORD PTR [rbp-0x8],rax
   140003122:	jmp    0x14000315a
   140003124:	mov    rax,QWORD PTR [rbp-0x8]
   140003128:	mov    eax,DWORD PTR [rax+0xc]
   14000312b:	mov    eax,eax
   14000312d:	cmp    QWORD PTR [rbp+0x18],rax
   140003131:	jb     0x140003151
   140003133:	mov    rax,QWORD PTR [rbp-0x8]
   140003137:	mov    edx,DWORD PTR [rax+0xc]
   14000313a:	mov    rax,QWORD PTR [rbp-0x8]
   14000313e:	mov    eax,DWORD PTR [rax+0x8]
   140003141:	add    eax,edx
   140003143:	mov    eax,eax
   140003145:	cmp    QWORD PTR [rbp+0x18],rax
   140003149:	jae    0x140003151
   14000314b:	mov    rax,QWORD PTR [rbp-0x8]
   14000314f:	jmp    0x14000316f
   140003151:	add    DWORD PTR [rbp-0xc],0x1
   140003155:	add    QWORD PTR [rbp-0x8],0x28
   14000315a:	mov    rax,QWORD PTR [rbp-0x18]
   14000315e:	movzx  eax,WORD PTR [rax+0x6]
   140003162:	movzx  eax,ax
   140003165:	cmp    DWORD PTR [rbp-0xc],eax
   140003168:	jb     0x140003124
   14000316a:	mov    eax,0x0
   14000316f:	add    rsp,0x20
   140003173:	pop    rbp
   140003174:	ret
   140003175:	push   rbp
   140003176:	mov    rbp,rsp
   140003179:	sub    rsp,0x40
   14000317d:	mov    QWORD PTR [rbp+0x10],rcx
   140003181:	mov    rax,QWORD PTR [rbp+0x10]
   140003185:	mov    rcx,rax
   140003188:	call   0x140003750
   14000318d:	cmp    rax,0x8
   140003191:	jbe    0x14000319d
   140003193:	mov    eax,0x0
   140003198:	jmp    0x140003235
   14000319d:	mov    rax,QWORD PTR [rip+0x279c]        # 0x140005940
   1400031a4:	mov    QWORD PTR [rbp-0x18],rax
   1400031a8:	mov    rax,QWORD PTR [rbp-0x18]
   1400031ac:	mov    rcx,rax
   1400031af:	call   0x140003060
   1400031b4:	test   eax,eax
   1400031b6:	jne    0x1400031bf
   1400031b8:	mov    eax,0x0
   1400031bd:	jmp    0x140003235
   1400031bf:	mov    rax,QWORD PTR [rbp-0x18]
   1400031c3:	mov    eax,DWORD PTR [rax+0x3c]
   1400031c6:	movsxd rdx,eax
   1400031c9:	mov    rax,QWORD PTR [rbp-0x18]
   1400031cd:	add    rax,rdx
   1400031d0:	mov    QWORD PTR [rbp-0x20],rax
   1400031d4:	mov    DWORD PTR [rbp-0xc],0x0
   1400031db:	mov    rax,QWORD PTR [rbp-0x20]
   1400031df:	movzx  eax,WORD PTR [rax+0x14]
   1400031e3:	movzx  edx,ax
   1400031e6:	mov    rax,QWORD PTR [rbp-0x20]
   1400031ea:	add    rax,rdx
   1400031ed:	add    rax,0x18
   1400031f1:	mov    QWORD PTR [rbp-0x8],rax
   1400031f5:	jmp    0x140003220
   1400031f7:	mov    rax,QWORD PTR [rbp-0x8]
   1400031fb:	mov    rdx,QWORD PTR [rbp+0x10]
   1400031ff:	mov    r8d,0x8
   140003205:	mov    rcx,rax
   140003208:	call   0x140003758
   14000320d:	test   eax,eax
   14000320f:	jne    0x140003217
   140003211:	mov    rax,QWORD PTR [rbp-0x8]
   140003215:	jmp    0x140003235
   140003217:	add    DWORD PTR [rbp-0xc],0x1
   14000321b:	add    QWORD PTR [rbp-0x8],0x28
   140003220:	mov    rax,QWORD PTR [rbp-0x20]
   140003224:	movzx  eax,WORD PTR [rax+0x6]
   140003228:	movzx  eax,ax
   14000322b:	cmp    DWORD PTR [rbp-0xc],eax
   14000322e:	jb     0x1400031f7
   140003230:	mov    eax,0x0
   140003235:	add    rsp,0x40
   140003239:	pop    rbp
   14000323a:	ret
   14000323b:	push   rbp
   14000323c:	mov    rbp,rsp
   14000323f:	sub    rsp,0x30
   140003243:	mov    QWORD PTR [rbp+0x10],rcx
   140003247:	mov    rax,QWORD PTR [rip+0x26f2]        # 0x140005940
   14000324e:	mov    QWORD PTR [rbp-0x8],rax
   140003252:	mov    rax,QWORD PTR [rbp-0x8]
   140003256:	mov    rcx,rax
   140003259:	call   0x140003060
   14000325e:	test   eax,eax
   140003260:	jne    0x140003269
   140003262:	mov    eax,0x0
   140003267:	jmp    0x140003285
   140003269:	mov    rax,QWORD PTR [rbp+0x10]
   14000326d:	sub    rax,QWORD PTR [rbp-0x8]
   140003271:	mov    QWORD PTR [rbp-0x10],rax
   140003275:	mov    rdx,QWORD PTR [rbp-0x10]
   140003279:	mov    rax,QWORD PTR [rbp-0x8]
   14000327d:	mov    rcx,rax
   140003280:	call   0x1400030dc
   140003285:	add    rsp,0x30
   140003289:	pop    rbp
   14000328a:	ret
   14000328b:	push   rbp
   14000328c:	mov    rbp,rsp
   14000328f:	sub    rsp,0x30
   140003293:	mov    rax,QWORD PTR [rip+0x26a6]        # 0x140005940
   14000329a:	mov    QWORD PTR [rbp-0x8],rax
   14000329e:	mov    rax,QWORD PTR [rbp-0x8]
   1400032a2:	mov    rcx,rax
   1400032a5:	call   0x140003060
   1400032aa:	test   eax,eax
   1400032ac:	jne    0x1400032b5
   1400032ae:	mov    eax,0x0
   1400032b3:	jmp    0x1400032d5
   1400032b5:	mov    rax,QWORD PTR [rbp-0x8]
   1400032b9:	mov    eax,DWORD PTR [rax+0x3c]
   1400032bc:	movsxd rdx,eax
   1400032bf:	mov    rax,QWORD PTR [rbp-0x8]
   1400032c3:	add    rax,rdx
   1400032c6:	mov    QWORD PTR [rbp-0x10],rax
   1400032ca:	mov    rax,QWORD PTR [rbp-0x10]
   1400032ce:	movzx  eax,WORD PTR [rax+0x6]
   1400032d2:	movzx  eax,ax
   1400032d5:	add    rsp,0x30
   1400032d9:	pop    rbp
   1400032da:	ret
   1400032db:	push   rbp
   1400032dc:	mov    rbp,rsp
   1400032df:	sub    rsp,0x40
   1400032e3:	mov    QWORD PTR [rbp+0x10],rcx
   1400032e7:	mov    rax,QWORD PTR [rip+0x2652]        # 0x140005940
   1400032ee:	mov    QWORD PTR [rbp-0x18],rax
   1400032f2:	mov    rax,QWORD PTR [rbp-0x18]
   1400032f6:	mov    rcx,rax
   1400032f9:	call   0x140003060
   1400032fe:	test   eax,eax
   140003300:	jne    0x140003309
   140003302:	mov    eax,0x0
   140003307:	jmp    0x140003381
   140003309:	mov    rax,QWORD PTR [rbp-0x18]
   14000330d:	mov    eax,DWORD PTR [rax+0x3c]
   140003310:	movsxd rdx,eax
   140003313:	mov    rax,QWORD PTR [rbp-0x18]
   140003317:	add    rax,rdx
   14000331a:	mov    QWORD PTR [rbp-0x20],rax
   14000331e:	mov    DWORD PTR [rbp-0xc],0x0
   140003325:	mov    rax,QWORD PTR [rbp-0x20]
   140003329:	movzx  eax,WORD PTR [rax+0x14]
   14000332d:	movzx  edx,ax
   140003330:	mov    rax,QWORD PTR [rbp-0x20]
   140003334:	add    rax,rdx
   140003337:	add    rax,0x18
   14000333b:	mov    QWORD PTR [rbp-0x8],rax
   14000333f:	jmp    0x14000336c
   140003341:	mov    rax,QWORD PTR [rbp-0x8]
   140003345:	mov    eax,DWORD PTR [rax+0x24]
   140003348:	and    eax,0x20000000
   14000334d:	test   eax,eax
   14000334f:	je     0x140003363
   140003351:	cmp    QWORD PTR [rbp+0x10],0x0
   140003356:	jne    0x14000335e
   140003358:	mov    rax,QWORD PTR [rbp-0x8]
   14000335c:	jmp    0x140003381
   14000335e:	sub    QWORD PTR [rbp+0x10],0x1
   140003363:	add    DWORD PTR [rbp-0xc],0x1
   140003367:	add    QWORD PTR [rbp-0x8],0x28
   14000336c:	mov    rax,QWORD PTR [rbp-0x20]
   140003370:	movzx  eax,WORD PTR [rax+0x6]
   140003374:	movzx  eax,ax
   140003377:	cmp    DWORD PTR [rbp-0xc],eax
   14000337a:	jb     0x140003341
   14000337c:	mov    eax,0x0
   140003381:	add    rsp,0x40
   140003385:	pop    rbp
   140003386:	ret
   140003387:	push   rbp
   140003388:	mov    rbp,rsp
   14000338b:	sub    rsp,0x30
   14000338f:	mov    rax,QWORD PTR [rip+0x25aa]        # 0x140005940
   140003396:	mov    QWORD PTR [rbp-0x8],rax
   14000339a:	mov    rax,QWORD PTR [rbp-0x8]
   14000339e:	mov    rcx,rax
   1400033a1:	call   0x140003060
   1400033a6:	test   eax,eax
   1400033a8:	jne    0x1400033b1
   1400033aa:	mov    eax,0x0
   1400033af:	jmp    0x1400033b5
   1400033b1:	mov    rax,QWORD PTR [rbp-0x8]
   1400033b5:	add    rsp,0x30
   1400033b9:	pop    rbp
   1400033ba:	ret
   1400033bb:	push   rbp
   1400033bc:	mov    rbp,rsp
   1400033bf:	sub    rsp,0x40
   1400033c3:	mov    QWORD PTR [rbp+0x10],rcx
   1400033c7:	mov    rax,QWORD PTR [rip+0x2572]        # 0x140005940
   1400033ce:	mov    QWORD PTR [rbp-0x8],rax
   1400033d2:	mov    rax,QWORD PTR [rbp-0x8]
   1400033d6:	mov    rcx,rax
   1400033d9:	call   0x140003060
   1400033de:	test   eax,eax
   1400033e0:	jne    0x1400033e9
   1400033e2:	mov    eax,0x0
   1400033e7:	jmp    0x140003426
   1400033e9:	mov    rax,QWORD PTR [rbp+0x10]
   1400033ed:	sub    rax,QWORD PTR [rbp-0x8]
   1400033f1:	mov    QWORD PTR [rbp-0x10],rax
   1400033f5:	mov    rdx,QWORD PTR [rbp-0x10]
   1400033f9:	mov    rax,QWORD PTR [rbp-0x8]
   1400033fd:	mov    rcx,rax
   140003400:	call   0x1400030dc
   140003405:	mov    QWORD PTR [rbp-0x18],rax
   140003409:	cmp    QWORD PTR [rbp-0x18],0x0
   14000340e:	jne    0x140003417
   140003410:	mov    eax,0x0
   140003415:	jmp    0x140003426
   140003417:	mov    rax,QWORD PTR [rbp-0x18]
   14000341b:	mov    eax,DWORD PTR [rax+0x24]
   14000341e:	not    eax
   140003420:	shr    eax,0x1f
   140003423:	movzx  eax,al
   140003426:	add    rsp,0x40
   14000342a:	pop    rbp
   14000342b:	ret
   14000342c:	push   rbp
   14000342d:	mov    rbp,rsp
   140003430:	sub    rsp,0x50
   140003434:	mov    DWORD PTR [rbp+0x10],ecx
   140003437:	mov    rax,QWORD PTR [rip+0x2502]        # 0x140005940
   14000343e:	mov    QWORD PTR [rbp-0x10],rax
   140003442:	mov    rax,QWORD PTR [rbp-0x10]
   140003446:	mov    rcx,rax
   140003449:	call   0x140003060
   14000344e:	test   eax,eax
   140003450:	jne    0x14000345c
   140003452:	mov    eax,0x0
   140003457:	jmp    0x140003507
   14000345c:	mov    rax,QWORD PTR [rbp-0x10]
   140003460:	mov    eax,DWORD PTR [rax+0x3c]
   140003463:	movsxd rdx,eax
   140003466:	mov    rax,QWORD PTR [rbp-0x10]
   14000346a:	add    rax,rdx
   14000346d:	mov    QWORD PTR [rbp-0x18],rax
   140003471:	mov    rax,QWORD PTR [rbp-0x18]
   140003475:	mov    eax,DWORD PTR [rax+0x90]
   14000347b:	mov    DWORD PTR [rbp-0x1c],eax
   14000347e:	cmp    DWORD PTR [rbp-0x1c],0x0
   140003482:	jne    0x14000348b
   140003484:	mov    eax,0x0
   140003489:	jmp    0x140003507
   14000348b:	mov    edx,DWORD PTR [rbp-0x1c]
   14000348e:	mov    rax,QWORD PTR [rbp-0x10]
   140003492:	mov    rcx,rax
   140003495:	call   0x1400030dc
   14000349a:	mov    QWORD PTR [rbp-0x28],rax
   14000349e:	cmp    QWORD PTR [rbp-0x28],0x0
   1400034a3:	jne    0x1400034ac
   1400034a5:	mov    eax,0x0
   1400034aa:	jmp    0x140003507
   1400034ac:	mov    edx,DWORD PTR [rbp-0x1c]
   1400034af:	mov    rax,QWORD PTR [rbp-0x10]
   1400034b3:	add    rax,rdx
   1400034b6:	mov    QWORD PTR [rbp-0x8],rax
   1400034ba:	cmp    QWORD PTR [rbp-0x8],0x0
   1400034bf:	jne    0x1400034c8
   1400034c1:	mov    eax,0x0
   1400034c6:	jmp    0x140003507
   1400034c8:	mov    rax,QWORD PTR [rbp-0x8]
   1400034cc:	mov    eax,DWORD PTR [rax+0x4]
   1400034cf:	test   eax,eax
   1400034d1:	jne    0x1400034de
   1400034d3:	mov    rax,QWORD PTR [rbp-0x8]
   1400034d7:	mov    eax,DWORD PTR [rax+0xc]
   1400034da:	test   eax,eax
   1400034dc:	je     0x140003501
   1400034de:	cmp    DWORD PTR [rbp+0x10],0x0
   1400034e2:	jg     0x1400034f6
   1400034e4:	mov    rax,QWORD PTR [rbp-0x8]
   1400034e8:	mov    eax,DWORD PTR [rax+0xc]
   1400034eb:	mov    edx,eax
   1400034ed:	mov    rax,QWORD PTR [rbp-0x10]
   1400034f1:	add    rax,rdx
   1400034f4:	jmp    0x140003507
   1400034f6:	sub    DWORD PTR [rbp+0x10],0x1
   1400034fa:	add    QWORD PTR [rbp-0x8],0x14
   1400034ff:	jmp    0x1400034c8
   140003501:	nop
   140003502:	mov    eax,0x0
   140003507:	add    rsp,0x50
   14000350b:	pop    rbp
   14000350c:	ret
   14000350d:	nop
   14000350e:	nop
   14000350f:	nop
   140003510:	push   rcx
   140003511:	push   rax
   140003512:	cmp    rax,0x1000
   140003518:	lea    rcx,[rsp+0x18]
   14000351d:	jb     0x140003538
   14000351f:	sub    rcx,0x1000
   140003526:	or     QWORD PTR [rcx],0x0
   14000352a:	sub    rax,0x1000
   140003530:	cmp    rax,0x1000
   140003536:	ja     0x14000351f
   140003538:	sub    rcx,rax
   14000353b:	or     QWORD PTR [rcx],0x0
   14000353f:	pop    rax
   140003540:	pop    rcx
   140003541:	ret
   140003542:	nop
   140003543:	nop
   140003544:	nop
   140003545:	nop
   140003546:	nop
   140003547:	nop
   140003548:	nop
   140003549:	nop
   14000354a:	nop
   14000354b:	nop
   14000354c:	nop
   14000354d:	nop
   14000354e:	nop
   14000354f:	nop
   140003550:	push   rbp
   140003551:	mov    rbp,rsp
   140003554:	sub    rsp,0x30
   140003558:	mov    QWORD PTR [rbp+0x10],rcx
   14000355c:	mov    QWORD PTR [rbp+0x18],rdx
   140003560:	mov    QWORD PTR [rbp+0x20],r8
   140003564:	call   0x140003670
   140003569:	mov    rax,QWORD PTR [rax]
   14000356c:	mov    r8,QWORD PTR [rbp+0x18]
   140003570:	mov    rdx,QWORD PTR [rbp+0x10]
   140003574:	mov    rcx,QWORD PTR [rbp+0x20]
   140003578:	mov    QWORD PTR [rsp+0x20],rcx
   14000357d:	mov    r9d,0x0
   140003583:	mov    rcx,rax
   140003586:	call   0x140003778
   14000358b:	add    rsp,0x30
   14000358f:	pop    rbp
   140003590:	ret
   140003591:	nop
   140003592:	nop
   140003593:	nop
   140003594:	nop
   140003595:	nop
   140003596:	nop
   140003597:	nop
   140003598:	nop
   140003599:	nop
   14000359a:	nop
   14000359b:	nop
   14000359c:	nop
   14000359d:	nop
   14000359e:	nop
   14000359f:	nop
   1400035a0:	push   rbp
   1400035a1:	push   rsi
   1400035a2:	push   rbx
   1400035a3:	sub    rsp,0x40
   1400035a7:	lea    rbp,[rsp+0x40]
   1400035ac:	mov    QWORD PTR [rbp+0x20],rcx
   1400035b0:	mov    QWORD PTR [rbp+0x28],rdx
   1400035b4:	mov    QWORD PTR [rbp+0x30],r8
   1400035b8:	mov    QWORD PTR [rbp+0x38],r9
   1400035bc:	lea    rax,[rbp+0x28]
   1400035c0:	mov    QWORD PTR [rbp-0x10],rax
   1400035c4:	mov    rbx,QWORD PTR [rbp-0x10]
   1400035c8:	mov    ecx,0x1
   1400035cd:	call   0x140003760
   1400035d2:	mov    rsi,rax
   1400035d5:	call   0x140003670
   1400035da:	mov    rax,QWORD PTR [rax]
   1400035dd:	mov    rdx,QWORD PTR [rbp+0x20]
   1400035e1:	mov    QWORD PTR [rsp+0x20],rbx
   1400035e6:	mov    r9d,0x0
   1400035ec:	mov    r8,rdx
   1400035ef:	mov    rdx,rsi
   1400035f2:	mov    rcx,rax
   1400035f5:	call   0x140003778
   1400035fa:	mov    DWORD PTR [rbp-0x4],eax
   1400035fd:	mov    eax,DWORD PTR [rbp-0x4]
   140003600:	add    rsp,0x40
   140003604:	pop    rbx
   140003605:	pop    rsi
   140003606:	pop    rbp
   140003607:	ret
   140003608:	nop
   140003609:	nop
   14000360a:	nop
   14000360b:	nop
   14000360c:	nop
   14000360d:	nop
   14000360e:	nop
   14000360f:	nop
   140003610:	push   rbp
   140003611:	push   rbx
   140003612:	sub    rsp,0x48
   140003616:	lea    rbp,[rsp+0x40]
   14000361b:	mov    QWORD PTR [rbp+0x20],rcx
   14000361f:	mov    QWORD PTR [rbp+0x28],rdx
   140003623:	mov    QWORD PTR [rbp+0x30],r8
   140003627:	mov    QWORD PTR [rbp+0x38],r9
   14000362b:	lea    rax,[rbp+0x30]
   14000362f:	mov    QWORD PTR [rbp-0x10],rax
   140003633:	mov    rbx,QWORD PTR [rbp-0x10]
   140003637:	call   0x140003670
   14000363c:	mov    rax,QWORD PTR [rax]
   14000363f:	mov    rcx,QWORD PTR [rbp+0x28]
   140003643:	mov    rdx,QWORD PTR [rbp+0x20]
   140003647:	mov    QWORD PTR [rsp+0x20],rbx
   14000364c:	mov    r9d,0x0
   140003652:	mov    r8,rcx
   140003655:	mov    rcx,rax
   140003658:	call   0x140003778
   14000365d:	mov    DWORD PTR [rbp-0x4],eax
   140003660:	mov    eax,DWORD PTR [rbp-0x4]
   140003663:	add    rsp,0x48
   140003667:	pop    rbx
   140003668:	pop    rbp
   140003669:	ret
   14000366a:	nop
   14000366b:	nop
   14000366c:	nop
   14000366d:	nop
   14000366e:	nop
   14000366f:	nop
   140003670:	push   rbp
   140003671:	mov    rbp,rsp
   140003674:	lea    rax,[rip+0xa05]        # 0x140004080
   14000367b:	pop    rbp
   14000367c:	ret
   14000367d:	nop
   14000367e:	nop
   14000367f:	nop
   140003680:	push   rbp
   140003681:	mov    rbp,rsp
   140003684:	mov    rax,QWORD PTR [rip+0x2305]        # 0x140005990
   14000368b:	mov    rax,QWORD PTR [rax]
   14000368e:	pop    rbp
   14000368f:	ret
   140003690:	push   rbp
   140003691:	mov    rbp,rsp
   140003694:	sub    rsp,0x20
   140003698:	mov    DWORD PTR [rbp+0x10],ecx
   14000369b:	mov    ecx,0x2
   1400036a0:	call   0x140003760
   1400036a5:	mov    rcx,rax
   1400036a8:	mov    edx,DWORD PTR [rbp+0x10]
   1400036ab:	lea    rax,[rip+0x223e]        # 0x1400058f0
   1400036b2:	mov    r8d,edx
   1400036b5:	mov    rdx,rax
   1400036b8:	call   0x140003610
   1400036bd:	mov    ecx,0xff
   1400036c2:	call   0x1400037d8
   1400036c7:	nop
   1400036c8:	nop
   1400036c9:	nop
   1400036ca:	nop
   1400036cb:	nop
   1400036cc:	nop
   1400036cd:	nop
   1400036ce:	nop
   1400036cf:	nop
   1400036d0:	push   rbp
   1400036d1:	mov    rbp,rsp
   1400036d4:	sub    rsp,0x20
   1400036d8:	mov    QWORD PTR [rbp+0x10],rcx
   1400036dc:	mov    QWORD PTR [rbp+0x18],rdx
   1400036e0:	mov    QWORD PTR [rbp+0x20],r8
   1400036e4:	mov    DWORD PTR [rbp+0x28],r9d
   1400036e8:	call   0x1400037e0
   1400036ed:	cmp    DWORD PTR [rbp+0x28],0x0
   1400036f1:	je     0x1400036fa
   1400036f3:	mov    eax,0x2
   1400036f8:	jmp    0x1400036ff
   1400036fa:	mov    eax,0x1
   1400036ff:	mov    ecx,eax
   140003701:	call   0x1400037c8
   140003706:	call   0x1400037b0
   14000370b:	mov    edx,DWORD PTR [rax]
   14000370d:	mov    rax,QWORD PTR [rbp+0x10]
   140003711:	mov    DWORD PTR [rax],edx
   140003713:	call   0x1400037b8
   140003718:	mov    rdx,QWORD PTR [rax]
   14000371b:	mov    rax,QWORD PTR [rbp+0x18]
   14000371f:	mov    QWORD PTR [rax],rdx
   140003722:	call   0x140003870
   140003727:	mov    rdx,QWORD PTR [rax]
   14000372a:	mov    rax,QWORD PTR [rbp+0x20]
   14000372e:	mov    QWORD PTR [rax],rdx
   140003731:	mov    rax,QWORD PTR [rbp+0x30]
   140003735:	mov    eax,DWORD PTR [rax]
   140003737:	mov    ecx,eax
   140003739:	call   0x140003850
   14000373e:	mov    eax,0x0
   140003743:	add    rsp,0x20
   140003747:	pop    rbp
   140003748:	ret
   140003749:	nop
   14000374a:	nop
   14000374b:	nop
   14000374c:	nop
   14000374d:	nop
   14000374e:	nop
   14000374f:	nop
   140003750:	jmp    QWORD PTR [rip+0x6dca]        # 0x14000a520
   140003756:	nop
   140003757:	nop
   140003758:	jmp    QWORD PTR [rip+0x6dca]        # 0x14000a528
   14000375e:	nop
   14000375f:	nop
   140003760:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4c8
   140003766:	nop
   140003767:	nop
   140003768:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4d0
   14000376e:	nop
   14000376f:	nop
   140003770:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4d8
   140003776:	nop
   140003777:	nop
   140003778:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4e0
   14000377e:	nop
   14000377f:	nop
   140003780:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4e8
   140003786:	nop
   140003787:	nop
   140003788:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4f0
   14000378e:	nop
   14000378f:	nop
   140003790:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a4f8
   140003796:	nop
   140003797:	nop
   140003798:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a500
   14000379e:	nop
   14000379f:	nop
   1400037a0:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a508
   1400037a6:	nop
   1400037a7:	nop
   1400037a8:	jmp    QWORD PTR [rip+0x6d62]        # 0x14000a510
   1400037ae:	nop
   1400037af:	nop
   1400037b0:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a450
   1400037b6:	nop
   1400037b7:	nop
   1400037b8:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a458
   1400037be:	nop
   1400037bf:	nop
   1400037c0:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a460
   1400037c6:	nop
   1400037c7:	nop
   1400037c8:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a468
   1400037ce:	nop
   1400037cf:	nop
   1400037d0:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a470
   1400037d6:	nop
   1400037d7:	nop
   1400037d8:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a478
   1400037de:	nop
   1400037df:	nop
   1400037e0:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a480
   1400037e6:	nop
   1400037e7:	nop
   1400037e8:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a488
   1400037ee:	nop
   1400037ef:	nop
   1400037f0:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a490
   1400037f6:	nop
   1400037f7:	nop
   1400037f8:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a498
   1400037fe:	nop
   1400037ff:	nop
   140003800:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a4a0
   140003806:	nop
   140003807:	nop
   140003808:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a4a8
   14000380e:	nop
   14000380f:	nop
   140003810:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a4b0
   140003816:	nop
   140003817:	nop
   140003818:	jmp    QWORD PTR [rip+0x6c9a]        # 0x14000a4b8
   14000381e:	nop
   14000381f:	nop
   140003820:	jmp    QWORD PTR [rip+0x6c12]        # 0x14000a438
   140003826:	nop
   140003827:	nop
   140003828:	jmp    QWORD PTR [rip+0x6c12]        # 0x14000a440
   14000382e:	nop
   14000382f:	nop
   140003830:	jmp    QWORD PTR [rip+0x6bf2]        # 0x14000a428
   140003836:	nop
   140003837:	nop
   140003838:	nop    DWORD PTR [rax+rax*1+0x0]
   140003840:	jmp    QWORD PTR [rip+0x6bd2]        # 0x14000a418
   140003846:	nop
   140003847:	nop
   140003848:	nop    DWORD PTR [rax+rax*1+0x0]
   140003850:	jmp    QWORD PTR [rip+0x6b9a]        # 0x14000a3f0
   140003856:	nop
   140003857:	nop
   140003858:	jmp    QWORD PTR [rip+0x6b9a]        # 0x14000a3f8
   14000385e:	nop
   14000385f:	nop
   140003860:	jmp    QWORD PTR [rip+0x6b9a]        # 0x14000a400
   140003866:	nop
   140003867:	nop
   140003868:	jmp    QWORD PTR [rip+0x6b9a]        # 0x14000a408
   14000386e:	nop
   14000386f:	nop
   140003870:	jmp    QWORD PTR [rip+0x6b6a]        # 0x14000a3e0
   140003876:	nop
   140003877:	nop
   140003878:	nop    DWORD PTR [rax+rax*1+0x0]
   140003880:	jmp    QWORD PTR [rip+0x6b4a]        # 0x14000a3d0
   140003886:	nop
   140003887:	nop
   140003888:	jmp    QWORD PTR [rip+0x6b3a]        # 0x14000a3c8
   14000388e:	nop
   14000388f:	nop
   140003890:	jmp    QWORD PTR [rip+0x6b2a]        # 0x14000a3c0
   140003896:	nop
   140003897:	nop
   140003898:	jmp    QWORD PTR [rip+0x6b1a]        # 0x14000a3b8
   14000389e:	nop
   14000389f:	nop
   1400038a0:	jmp    QWORD PTR [rip+0x6b0a]        # 0x14000a3b0
   1400038a6:	nop
   1400038a7:	nop
   1400038a8:	jmp    QWORD PTR [rip+0x6afa]        # 0x14000a3a8
   1400038ae:	nop
   1400038af:	nop
   1400038b0:	jmp    QWORD PTR [rip+0x6aea]        # 0x14000a3a0
   1400038b6:	nop
   1400038b7:	nop
   1400038b8:	jmp    QWORD PTR [rip+0x6ada]        # 0x14000a398
   1400038be:	nop
   1400038bf:	nop
   1400038c0:	jmp    QWORD PTR [rip+0x6aca]        # 0x14000a390
   1400038c6:	nop
   1400038c7:	nop
   1400038c8:	jmp    QWORD PTR [rip+0x6aba]        # 0x14000a388
   1400038ce:	nop
   1400038cf:	nop
   1400038d0:	jmp    QWORD PTR [rip+0x6aaa]        # 0x14000a380
   1400038d6:	nop
   1400038d7:	nop
   1400038d8:	jmp    QWORD PTR [rip+0x6a9a]        # 0x14000a378
   1400038de:	nop
   1400038df:	nop
   1400038e0:	jmp    QWORD PTR [rip+0x6a8a]        # 0x14000a370
   1400038e6:	nop
   1400038e7:	nop
   1400038e8:	jmp    QWORD PTR [rip+0x6a7a]        # 0x14000a368
   1400038ee:	nop
   1400038ef:	nop
   1400038f0:	jmp    QWORD PTR [rip+0x6a6a]        # 0x14000a360
   1400038f6:	nop
   1400038f7:	nop
   1400038f8:	jmp    QWORD PTR [rip+0x6a5a]        # 0x14000a358
   1400038fe:	nop
   1400038ff:	nop
   140003900:	jmp    QWORD PTR [rip+0x6a4a]        # 0x14000a350
   140003906:	nop
   140003907:	nop
   140003908:	jmp    QWORD PTR [rip+0x6a3a]        # 0x14000a348
   14000390e:	nop
   14000390f:	nop
   140003910:	jmp    QWORD PTR [rip+0x6a2a]        # 0x14000a340
   140003916:	nop
   140003917:	nop
   140003918:	jmp    QWORD PTR [rip+0x6a1a]        # 0x14000a338
   14000391e:	nop
   14000391f:	nop
   140003920:	jmp    QWORD PTR [rip+0x6a0a]        # 0x14000a330
   140003926:	nop
   140003927:	nop
   140003928:	jmp    QWORD PTR [rip+0x69fa]        # 0x14000a328
   14000392e:	nop
   14000392f:	nop
   140003930:	jmp    QWORD PTR [rip+0x69ea]        # 0x14000a320
   140003936:	nop
   140003937:	nop
   140003938:	jmp    QWORD PTR [rip+0x69da]        # 0x14000a318
   14000393e:	nop
   14000393f:	nop
   140003940:	jmp    QWORD PTR [rip+0x69ca]        # 0x14000a310
   140003946:	nop
   140003947:	nop
   140003948:	jmp    QWORD PTR [rip+0x69ba]        # 0x14000a308
   14000394e:	nop
   14000394f:	nop
   140003950:	jmp    QWORD PTR [rip+0x69aa]        # 0x14000a300
   140003956:	nop
   140003957:	nop
   140003958:	nop    DWORD PTR [rax+rax*1+0x0]
   140003960:	cs nop WORD PTR [rax+rax*1+0x0]
   14000396a:	cs nop WORD PTR [rax+rax*1+0x0]
   140003974:	cs nop WORD PTR [rax+rax*1+0x0]
   14000397e:	xchg   ax,ax
   140003980:	sub    rsp,0x28
   140003984:	call   0x1400019b0
   140003989:	mov    eax,DWORD PTR [rip+0x56f1]        # 0x140009080
   14000398f:	test   eax,eax
   140003991:	je     0x140003998
   140003993:	add    rsp,0x28
   140003997:	ret
   140003998:	lea    rdx,[rip+0xffffffffffffe211]        # 0x140001bb0
   14000399f:	mov    ecx,0x1
   1400039a4:	call   QWORD PTR [rip+0x6956]        # 0x14000a300
   1400039aa:	mov    DWORD PTR [rip+0x56cc],0x1        # 0x140009080
   1400039b4:	jmp    0x140003993
   1400039b6:	cs nop WORD PTR [rax+rax*1+0x0]
   1400039c0:	push   rdi
   1400039c1:	push   rsi
   1400039c2:	push   rbx
   1400039c3:	sub    rsp,0xa0
   1400039ca:	call   0x140001cf7
   1400039cf:	mov    ecx,0x3
   1400039d4:	call   QWORD PTR [rip+0x69be]        # 0x14000a398
   1400039da:	lea    rcx,[rip+0xffffffffffffe1af]        # 0x140001b90
   1400039e1:	call   QWORD PTR [rip+0x69b9]        # 0x14000a3a0
   1400039e7:	mov    eax,DWORD PTR [rip+0x5693]        # 0x140009080
   1400039ed:	test   eax,eax
   1400039ef:	je     0x140003ce8
   1400039f5:	int3
   1400039f6:	mov    ecx,0xfffffff5
   1400039fb:	call   QWORD PTR [rip+0x695f]        # 0x14000a360
   140003a01:	lea    rcx,[rip+0x167b]        # 0x140005083
   140003a08:	mov    DWORD PTR [rsp+0x70],0x0
   140003a10:	mov    rbx,rax
   140003a13:	call   QWORD PTR [rip+0x6977]        # 0x14000a390
   140003a19:	lea    rdx,[rsp+0x70]
   140003a1e:	mov    rcx,rbx
   140003a21:	call   QWORD PTR [rip+0x6911]        # 0x14000a338
   140003a27:	test   eax,eax
   140003a29:	jne    0x140003cd3
   140003a2f:	mov    ecx,0xb
   140003a34:	call   0x140001a80
   140003a39:	mov    ecx,0xa
   140003a3e:	call   0x140003798
   140003a43:	lea    rcx,[rip+0x1646]        # 0x140005090
   140003a4a:	call   0x1400037a0
   140003a4f:	lea    rcx,[rip+0x165d]        # 0x1400050b3
   140003a56:	call   0x1400035a0
   140003a5b:	mov    ecx,0xf
   140003a60:	call   0x140001a80
   140003a65:	lea    rcx,[rip+0x164f]        # 0x1400050bb
   140003a6c:	call   0x1400035a0
   140003a71:	mov    ecx,0xb
   140003a76:	call   0x140001a80
   140003a7b:	lea    rcx,[rip+0x1654]        # 0x1400050d6
   140003a82:	call   0x1400037a0
   140003a87:	lea    rcx,[rip+0x1625]        # 0x1400050b3
   140003a8e:	call   0x1400035a0
   140003a93:	mov    ecx,0x8
   140003a98:	call   0x140001a80
   140003a9d:	lea    rcx,[rip+0x1634]        # 0x1400050d8
   140003aa4:	call   0x1400035a0
   140003aa9:	mov    ecx,0xb
   140003aae:	call   0x140001a80
   140003ab3:	lea    rcx,[rip+0x161c]        # 0x1400050d6
   140003aba:	call   0x1400037a0
   140003abf:	lea    rcx,[rip+0x15ca]        # 0x140005090
   140003ac6:	call   0x1400037a0
   140003acb:	mov    ecx,0xf
   140003ad0:	call   0x140001a80
   140003ad5:	lea    rcx,[rip+0x1617]        # 0x1400050f3
   140003adc:	call   0x1400035a0
   140003ae1:	mov    rbx,QWORD PTR [rip+0x69e0]        # 0x14000a4c8
   140003ae8:	mov    ecx,0x1
   140003aed:	call   rbx
   140003aef:	mov    rcx,rax
   140003af2:	call   0x140003780
   140003af7:	pxor   xmm0,xmm0
   140003afb:	xor    ecx,ecx
   140003afd:	movaps XMMWORD PTR [rsp+0x50],xmm0
   140003b02:	movaps XMMWORD PTR [rsp+0x60],xmm0
   140003b07:	call   rbx
   140003b09:	mov    edx,0x20
   140003b0e:	lea    rcx,[rsp+0x50]
   140003b13:	mov    r8,rax
   140003b16:	call   0x140003788
   140003b1b:	test   rax,rax
   140003b1e:	je     0x140003b60
   140003b20:	lea    rcx,[rsp+0x50]
   140003b25:	call   0x140003750
   140003b2a:	test   rax,rax
   140003b2d:	je     0x140003b60
   140003b2f:	lea    rbx,[rsp+0x50]
   140003b34:	lea    rcx,[rsp+rax*1+0x4f]
   140003b39:	mov    r8d,0x400009
   140003b3f:	nop
   140003b40:	movzx  edi,BYTE PTR [rcx]
   140003b43:	lea    edx,[rdi-0xa]
   140003b46:	cmp    dl,0x16
   140003b49:	ja     0x140003b7c
   140003b4b:	bt     r8,rdx
   140003b4f:	jae    0x140003b7c
   140003b51:	mov    BYTE PTR [rcx],0x0
   140003b54:	sub    rcx,0x1
   140003b58:	sub    rax,0x1
   140003b5c:	jne    0x140003b40
   140003b5e:	xchg   ax,ax
   140003b60:	xor    ecx,ecx
   140003b62:	call   0x140001ab0
   140003b67:	call   0x140001b30
   140003b6c:	mov    eax,0x1
   140003b71:	add    rsp,0xa0
   140003b78:	pop    rbx
   140003b79:	pop    rsi
   140003b7a:	pop    rdi
   140003b7b:	ret
   140003b7c:	cmp    rax,0x10
   140003b80:	jne    0x140003b60
   140003b82:	lea    r8,[rsp+0x60]
   140003b87:	lea    rcx,[rsp+0x50]
   140003b8c:	nop    DWORD PTR [rax+0x0]
   140003b90:	movzx  eax,BYTE PTR [rcx]
   140003b93:	mov    edx,eax
   140003b95:	and    edx,0xffffffdf
   140003b98:	sub    edx,0x41
   140003b9b:	cmp    dl,0x19
   140003b9e:	jbe    0x140003ba7
   140003ba0:	sub    eax,0x30
   140003ba3:	cmp    al,0x9
   140003ba5:	ja     0x140003b60
   140003ba7:	add    rcx,0x1
   140003bab:	cmp    r8,rcx
   140003bae:	jne    0x140003b90
   140003bb0:	lea    r9,[rsp+0x58]
   140003bb5:	lea    rdx,[rsp+0x50]
   140003bba:	mov    ecx,0x811c9dc5
   140003bbf:	nop
   140003bc0:	movzx  eax,BYTE PTR [rdx]
   140003bc3:	add    rdx,0x1
   140003bc7:	xor    eax,ecx
   140003bc9:	imul   ecx,eax,0x1000193
   140003bcf:	cmp    r9,rdx
   140003bd2:	jne    0x140003bc0
   140003bd4:	cmp    eax,0x53fdd974
   140003bd9:	je     0x140003d09
   140003bdf:	xor    BYTE PTR [rip+0x42a],0x11        # 0x140004010
   140003be6:	mov    r9d,0x40
   140003bec:	mov    r8d,0x3000
   140003bf2:	mov    edx,0x3a0
   140003bf7:	xor    ecx,ecx
   140003bf9:	call   QWORD PTR [rip+0x67b9]        # 0x14000a3b8
   140003bff:	mov    rsi,rax
   140003c02:	test   rax,rax
   140003c05:	je     0x140003b60
   140003c0b:	mov    rcx,rax
   140003c0e:	mov    r8d,0x3a0
   140003c14:	lea    rdx,[rip+0x1545]        # 0x140005160
   140003c1b:	call   0x140003828
   140003c20:	lea    rcx,[rsp+0x28]
   140003c25:	mov    eax,0xffffffa7
   140003c2a:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140003c35:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140003c40:	movzx  edx,BYTE PTR [rip+0x3c9]        # 0x140004010
   140003c47:	add    rbx,0x1
   140003c4b:	add    rcx,0x1
   140003c4f:	xor    edx,eax
   140003c51:	add    eax,0xd
   140003c54:	xor    dl,BYTE PTR [rbx-0x1]
   140003c57:	mov    BYTE PTR [rcx-0x1],dl
   140003c5a:	cmp    al,0xf
   140003c5c:	jne    0x140003c40
   140003c5e:	mov    r9d,0x8
   140003c64:	lea    r8,[rsp+0x28]
   140003c69:	mov    edx,0x3a0
   140003c6e:	mov    rcx,rsi
   140003c71:	call   0x140001780
   140003c76:	call   QWORD PTR [rip+0x66c4]        # 0x14000a340
   140003c7c:	mov    r8d,0x3a0
   140003c82:	mov    rdx,rsi
   140003c85:	mov    rcx,rax
   140003c88:	call   QWORD PTR [rip+0x669a]        # 0x14000a328
   140003c8e:	movzx  edx,BYTE PTR [rip+0x37b]        # 0x140004010
   140003c95:	lea    rcx,[rsp+0x50]
   140003c9a:	call   rsi
   140003c9c:	xor    edx,edx
   140003c9e:	mov    r8d,0x8000
   140003ca4:	mov    rcx,rsi
   140003ca7:	mov    ebx,eax
   140003ca9:	call   QWORD PTR [rip+0x6711]        # 0x14000a3c0
   140003caf:	sub    ebx,0x1
   140003cb2:	je     0x140003e30
   140003cb8:	xor    ecx,ecx
   140003cba:	call   0x140001ab0
   140003cbf:	mov    ecx,0xa
   140003cc4:	call   0x140003798
   140003cc9:	call   0x140001b30
   140003cce:	jmp    0x140003b6c
   140003cd3:	mov    edx,DWORD PTR [rsp+0x70]
   140003cd7:	mov    rcx,rbx
   140003cda:	or     edx,0x4
   140003cdd:	call   QWORD PTR [rip+0x669d]        # 0x14000a380
   140003ce3:	jmp    0x140003a2f
   140003ce8:	lea    rdx,[rip+0xffffffffffffdec1]        # 0x140001bb0
   140003cef:	mov    ecx,0x1
   140003cf4:	call   QWORD PTR [rip+0x6606]        # 0x14000a300
   140003cfa:	mov    DWORD PTR [rip+0x537c],0x1        # 0x140009080
   140003d04:	jmp    0x1400039f5
   140003d09:	lea    r8,[rsp+0x50]
   140003d0e:	mov    ecx,0xa5a5c3c3
   140003d13:	lea    r10,[rip+0x17e6]        # 0x140005500
   140003d1a:	nop    DWORD PTR [rax+rax*1+0x0]
   140003d1f:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140003d2a:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140003d35:	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140003d40:	movzx  edx,BYTE PTR [r8]
   140003d44:	add    r8,0x1
   140003d48:	imul   eax,edx,0xa7
   140003d4e:	movzx  edx,BYTE PTR [r10+rdx*1]
   140003d53:	add    eax,edx
   140003d55:	xor    eax,ecx
   140003d57:	mov    ecx,eax
   140003d59:	rol    ecx,0x7
   140003d5c:	imul   ecx,ecx,0x85ebca77
   140003d62:	cmp    r9,r8
   140003d65:	jne    0x140003d40
   140003d67:	cmp    eax,0x73ac9527
   140003d6c:	jne    0x140003bdf
   140003d72:	movzx  ecx,BYTE PTR [rsp+0x50]
   140003d77:	movzx  r11d,BYTE PTR [rsp+0x51]
   140003d7d:	mov    esi,0xfb
   140003d82:	movzx  eax,BYTE PTR [rsp+0x53]
   140003d87:	movzx  edx,BYTE PTR [rsp+0x52]
   140003d8c:	movzx  r9d,BYTE PTR [rsp+0x55]
   140003d92:	movzx  r8d,BYTE PTR [rsp+0x54]
   140003d98:	imul   edx,r11d
   140003d9c:	imul   eax,ecx
   140003d9f:	add    eax,edx
   140003da1:	movzx  edx,BYTE PTR [rsp+0x56]
   140003da6:	imul   edx,r9d
   140003daa:	add    eax,edx
   140003dac:	movzx  edx,BYTE PTR [rsp+0x57]
   140003db1:	imul   edx,r8d
   140003db5:	add    eax,edx
   140003db7:	xor    edx,edx
   140003db9:	div    esi
   140003dbb:	cmp    edx,0xd1
   140003dc1:	jne    0x140003bdf
   140003dc7:	imul   eax,ecx,0x1f
   140003dca:	movzx  edx,WORD PTR [rsp+0x52]
   140003dcf:	movzx  ecx,WORD PTR [rsp+0x56]
   140003dd4:	imul   r11d,r11d,0x11
   140003dd8:	imul   r9d,r9d,0xb
   140003ddc:	add    eax,r11d
   140003ddf:	xor    eax,edx
   140003de1:	imul   edx,r8d,0xd
   140003de5:	imul   eax,eax,0x10001
   140003deb:	add    edx,r9d
   140003dee:	xor    edx,ecx
   140003df0:	add    eax,edx
   140003df2:	cmp    eax,0x58dc8bd7
   140003df7:	jne    0x140003bdf
   140003dfd:	xor    edx,edx
   140003dff:	xor    eax,eax
   140003e01:	movzx  ecx,BYTE PTR [rsp+rdx*1+0x50]
   140003e06:	imul   eax,eax,0x83
   140003e0c:	add    rdx,0x1
   140003e10:	movzx  ecx,BYTE PTR [r10+rcx*1]
   140003e15:	add    eax,ecx
   140003e17:	movzx  eax,ax
   140003e1a:	cmp    rdx,0x8
   140003e1e:	jne    0x140003e01
   140003e20:	cmp    eax,0x7583
   140003e25:	je     0x140003be6
   140003e2b:	jmp    0x140003bdf
   140003e30:	mov    ecx,0x23
   140003e35:	lea    rdi,[rsp+0x70]
   140003e3a:	lea    rsi,[rip+0x12cf]        # 0x140005110
   140003e41:	movdqa xmm0,XMMWORD PTR [rsp+0x50]
   140003e47:	rep movs BYTE PTR es:[rdi],BYTE PTR ds:[rsi]
   140003e49:	mov    r9d,0x11
   140003e4f:	lea    r8,[rsp+0x30]
   140003e54:	movzx  eax,BYTE PTR [rip+0x1b5]        # 0x140004010
   140003e5b:	mov    edx,0x23
   140003e60:	lea    rcx,[rsp+0x70]
   140003e65:	movaps XMMWORD PTR [rsp+0x30],xmm0
   140003e6a:	mov    BYTE PTR [rsp+0x40],al
   140003e6e:	call   0x140001780
   140003e73:	mov    ecx,0x1
   140003e78:	mov    BYTE PTR [rsp+0x93],0x0
   140003e80:	call   0x140001ab0
   140003e85:	mov    ecx,0xa
   140003e8a:	call   0x140001a80
   140003e8f:	lea    rdx,[rsp+0x70]
   140003e94:	lea    rcx,[rip+0x1262]        # 0x1400050fd
   140003e9b:	call   0x1400035a0
   140003ea0:	mov    ecx,0x7
   140003ea5:	call   0x140001a80
   140003eaa:	call   0x140001b30
   140003eaf:	xor    eax,eax
   140003eb1:	jmp    0x140003b71
   140003eb6:	nop
   140003eb7:	nop
   140003eb8:	nop
   140003eb9:	nop
   140003eba:	nop
   140003ebb:	nop
   140003ebc:	nop
   140003ebd:	nop
   140003ebe:	nop
   140003ebf:	nop
   140003ec0:	jmp    0x140001670
   140003ec5:	nop
   140003ec6:	nop
   140003ec7:	nop
   140003ec8:	nop
   140003ec9:	nop
   140003eca:	nop
   140003ecb:	nop
   140003ecc:	nop
   140003ecd:	nop
   140003ece:	nop
   140003ecf:	nop
