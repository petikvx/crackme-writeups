
level2.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	sub    rsp,0x28
   140001004:	mov    ecx,0x7
   140001009:	mov    DWORD PTR [rsp+0x30],0x3f2c3f28
   140001011:	mov    WORD PTR [rsp+0x34],0x2928
   140001018:	mov    BYTE PTR [rsp+0x36],0x3f
   14000101d:	call   0x140001cb0
   140001022:	mov    ecx,DWORD PTR [rsp+0x30]
   140001026:	mov    QWORD PTR [rip+0x41eb],rax        # 0x140005218
   14000102d:	lea    rdx,[rax+0x7]
   140001031:	mov    QWORD PTR [rip+0x41f0],rdx        # 0x140005228
   140001038:	mov    DWORD PTR [rax],ecx
   14000103a:	movzx  ecx,WORD PTR [rsp+0x34]
   14000103f:	mov    WORD PTR [rax+0x4],cx
   140001043:	movzx  ecx,BYTE PTR [rsp+0x36]
   140001048:	mov    BYTE PTR [rax+0x6],cl
   14000104b:	lea    rcx,[rip+0x1cbe]        # 0x140002d10
   140001052:	mov    QWORD PTR [rip+0x41c7],rdx        # 0x140005220
   140001059:	add    rsp,0x28
   14000105d:	jmp    0x140001f30
   140001062:	int3
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
   140001070:	lea    rcx,[rip+0x1d09]        # 0x140002d80
   140001077:	jmp    0x140001f30
   14000107c:	int3
   14000107d:	int3
   14000107e:	int3
   14000107f:	int3
   140001080:	rex push rbx
   140001082:	sub    rsp,0x20
   140001086:	mov    rbx,rcx
   140001089:	mov    rax,rdx
   14000108c:	lea    rcx,[rip+0x2295]        # 0x140003328
   140001093:	xorps  xmm0,xmm0
   140001096:	lea    rdx,[rbx+0x8]
   14000109a:	mov    QWORD PTR [rbx],rcx
   14000109d:	lea    rcx,[rax+0x8]
   1400010a1:	movups XMMWORD PTR [rdx],xmm0
   1400010a4:	call   QWORD PTR [rip+0x205e]        # 0x140003108
   1400010aa:	mov    rax,rbx
   1400010ad:	add    rsp,0x20
   1400010b1:	pop    rbx
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
   1400010c0:	mov    rdx,QWORD PTR [rcx+0x8]
   1400010c4:	lea    rax,[rip+0x22ad]        # 0x140003378
   1400010cb:	test   rdx,rdx
   1400010ce:	cmovne rax,rdx
   1400010d2:	ret
   1400010d3:	int3
   1400010d4:	int3
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
   1400010e0:	mov    QWORD PTR [rsp+0x8],rbx
   1400010e5:	push   rdi
   1400010e6:	sub    rsp,0x20
   1400010ea:	lea    rax,[rip+0x2237]        # 0x140003328
   1400010f1:	mov    rdi,rcx
   1400010f4:	mov    QWORD PTR [rcx],rax
   1400010f7:	mov    ebx,edx
   1400010f9:	add    rcx,0x8
   1400010fd:	call   QWORD PTR [rip+0x1ffd]        # 0x140003100
   140001103:	test   bl,0x1
   140001106:	je     0x140001115
   140001108:	mov    edx,0x18
   14000110d:	mov    rcx,rdi
   140001110:	call   0x140001f80
   140001115:	mov    rbx,QWORD PTR [rsp+0x30]
   14000111a:	mov    rax,rdi
   14000111d:	add    rsp,0x20
   140001121:	pop    rdi
   140001122:	ret
   140001123:	int3
   140001124:	int3
   140001125:	int3
   140001126:	int3
   140001127:	int3
   140001128:	int3
   140001129:	int3
   14000112a:	int3
   14000112b:	int3
   14000112c:	int3
   14000112d:	int3
   14000112e:	int3
   14000112f:	int3
   140001130:	lea    rax,[rip+0x21f1]        # 0x140003328
   140001137:	mov    QWORD PTR [rcx],rax
   14000113a:	add    rcx,0x8
   14000113e:	rex.W jmp QWORD PTR [rip+0x1fbb]        # 0x140003100
   140001145:	int3
   140001146:	int3
   140001147:	int3
   140001148:	int3
   140001149:	int3
   14000114a:	int3
   14000114b:	int3
   14000114c:	int3
   14000114d:	int3
   14000114e:	int3
   14000114f:	int3
   140001150:	lea    rax,[rip+0x2239]        # 0x140003390
   140001157:	mov    QWORD PTR [rcx+0x10],0x0
   14000115f:	mov    QWORD PTR [rcx+0x8],rax
   140001163:	lea    rax,[rip+0x21fe]        # 0x140003368
   14000116a:	mov    QWORD PTR [rcx],rax
   14000116d:	mov    rax,rcx
   140001170:	ret
   140001171:	int3
   140001172:	int3
   140001173:	int3
   140001174:	int3
   140001175:	int3
   140001176:	int3
   140001177:	int3
   140001178:	int3
   140001179:	int3
   14000117a:	int3
   14000117b:	int3
   14000117c:	int3
   14000117d:	int3
   14000117e:	int3
   14000117f:	int3
   140001180:	sub    rsp,0x48
   140001184:	lea    rcx,[rsp+0x20]
   140001189:	call   0x140001150
   14000118e:	lea    rdx,[rip+0x2f9b]        # 0x140004130
   140001195:	lea    rcx,[rsp+0x20]
   14000119a:	call   0x1400028a2
   14000119f:	int3
   1400011a0:	rex push rbx
   1400011a2:	sub    rsp,0x20
   1400011a6:	mov    rbx,rcx
   1400011a9:	mov    rax,rdx
   1400011ac:	lea    rcx,[rip+0x2175]        # 0x140003328
   1400011b3:	xorps  xmm0,xmm0
   1400011b6:	lea    rdx,[rbx+0x8]
   1400011ba:	mov    QWORD PTR [rbx],rcx
   1400011bd:	lea    rcx,[rax+0x8]
   1400011c1:	movups XMMWORD PTR [rdx],xmm0
   1400011c4:	call   QWORD PTR [rip+0x1f3e]        # 0x140003108
   1400011ca:	lea    rax,[rip+0x2197]        # 0x140003368
   1400011d1:	mov    QWORD PTR [rbx],rax
   1400011d4:	mov    rax,rbx
   1400011d7:	add    rsp,0x20
   1400011db:	pop    rbx
   1400011dc:	ret
   1400011dd:	int3
   1400011de:	int3
   1400011df:	int3
   1400011e0:	rex push rbx
   1400011e2:	sub    rsp,0x20
   1400011e6:	mov    rbx,rcx
   1400011e9:	mov    rax,rdx
   1400011ec:	lea    rcx,[rip+0x2135]        # 0x140003328
   1400011f3:	xorps  xmm0,xmm0
   1400011f6:	lea    rdx,[rbx+0x8]
   1400011fa:	mov    QWORD PTR [rbx],rcx
   1400011fd:	lea    rcx,[rax+0x8]
   140001201:	movups XMMWORD PTR [rdx],xmm0
   140001204:	call   QWORD PTR [rip+0x1efe]        # 0x140003108
   14000120a:	lea    rax,[rip+0x212f]        # 0x140003340
   140001211:	mov    QWORD PTR [rbx],rax
   140001214:	mov    rax,rbx
   140001217:	add    rsp,0x20
   14000121b:	pop    rbx
   14000121c:	ret
   14000121d:	int3
   14000121e:	int3
   14000121f:	int3
   140001220:	sub    rsp,0x28
   140001224:	lea    rcx,[rip+0x217d]        # 0x1400033a8
   14000122b:	call   QWORD PTR [rip+0x1e0f]        # 0x140003040
   140001231:	int3
   140001232:	int3
   140001233:	int3
   140001234:	int3
   140001235:	int3
   140001236:	int3
   140001237:	int3
   140001238:	int3
   140001239:	int3
   14000123a:	int3
   14000123b:	int3
   14000123c:	int3
   14000123d:	int3
   14000123e:	int3
   14000123f:	int3
   140001240:	lea    rax,[rip+0x2171]        # 0x1400033b8
   140001247:	mov    QWORD PTR [rcx+0x10],0x0
   14000124f:	mov    QWORD PTR [rcx+0x8],rax
   140001253:	lea    rax,[rip+0x224e]        # 0x1400034a8
   14000125a:	mov    QWORD PTR [rcx],rax
   14000125d:	mov    rax,rcx
   140001260:	ret
   140001261:	int3
   140001262:	int3
   140001263:	int3
   140001264:	int3
   140001265:	int3
   140001266:	int3
   140001267:	int3
   140001268:	int3
   140001269:	int3
   14000126a:	int3
   14000126b:	int3
   14000126c:	int3
   14000126d:	int3
   14000126e:	int3
   14000126f:	int3
   140001270:	sub    rsp,0x48
   140001274:	lea    rcx,[rsp+0x20]
   140001279:	call   0x140001240
   14000127e:	lea    rdx,[rip+0x2deb]        # 0x140004070
   140001285:	lea    rcx,[rsp+0x20]
   14000128a:	call   0x1400028a2
   14000128f:	int3
   140001290:	rex push rbx
   140001292:	sub    rsp,0x20
   140001296:	mov    rbx,rcx
   140001299:	mov    rax,rdx
   14000129c:	lea    rcx,[rip+0x2085]        # 0x140003328
   1400012a3:	xorps  xmm0,xmm0
   1400012a6:	lea    rdx,[rbx+0x8]
   1400012aa:	mov    QWORD PTR [rbx],rcx
   1400012ad:	lea    rcx,[rax+0x8]
   1400012b1:	movups XMMWORD PTR [rdx],xmm0
   1400012b4:	call   QWORD PTR [rip+0x1e4e]        # 0x140003108
   1400012ba:	lea    rax,[rip+0x21e7]        # 0x1400034a8
   1400012c1:	mov    QWORD PTR [rbx],rax
   1400012c4:	mov    rax,rbx
   1400012c7:	add    rsp,0x20
   1400012cb:	pop    rbx
   1400012cc:	ret
   1400012cd:	int3
   1400012ce:	int3
   1400012cf:	int3
   1400012d0:	sub    rsp,0x28
   1400012d4:	mov    rcx,QWORD PTR [rcx+0x8]
   1400012d8:	test   rcx,rcx
   1400012db:	je     0x1400012fa
   1400012dd:	mov    rax,QWORD PTR [rcx]
   1400012e0:	call   QWORD PTR [rax+0x10]
   1400012e3:	test   rax,rax
   1400012e6:	je     0x1400012fa
   1400012e8:	mov    r8,QWORD PTR [rax]
   1400012eb:	mov    edx,0x1
   1400012f0:	mov    rcx,rax
   1400012f3:	add    rsp,0x28
   1400012f7:	rex.WB jmp QWORD PTR [r8]
   1400012fa:	add    rsp,0x28
   1400012fe:	ret
   1400012ff:	int3
   140001300:	mov    QWORD PTR [rsp+0x8],rbx
   140001305:	push   rdi
   140001306:	sub    rsp,0x50
   14000130a:	mov    rax,QWORD PTR [rip+0x3d2f]        # 0x140005040
   140001311:	xor    rax,rsp
   140001314:	mov    QWORD PTR [rsp+0x40],rax
   140001319:	xorps  xmm0,xmm0
   14000131c:	movups XMMWORD PTR [rsp+0x20],xmm0
   140001321:	mov    QWORD PTR [rsp+0x30],0x0
   14000132a:	mov    QWORD PTR [rsp+0x38],0xf
   140001333:	mov    BYTE PTR [rsp+0x20],0x0
   140001338:	lea    rdx,[rip+0x2089]        # 0x1400033c8
   14000133f:	mov    rcx,QWORD PTR [rip+0x1d8a]        # 0x1400030d0
   140001346:	call   0x1400015c0
   14000134b:	lea    rdx,[rip+0x2096]        # 0x1400033e8
   140001352:	mov    rcx,QWORD PTR [rip+0x1d77]        # 0x1400030d0
   140001359:	call   0x1400015c0
   14000135e:	lea    rdx,[rip+0x20a3]        # 0x140003408
   140001365:	mov    rcx,QWORD PTR [rip+0x1d64]        # 0x1400030d0
   14000136c:	call   0x1400015c0
   140001371:	lea    rdx,[rip+0x20b0]        # 0x140003428
   140001378:	mov    rcx,QWORD PTR [rip+0x1d51]        # 0x1400030d0
   14000137f:	call   0x1400015c0
   140001384:	lea    rdx,[rsp+0x20]
   140001389:	mov    rcx,QWORD PTR [rip+0x1d30]        # 0x1400030c0
   140001390:	call   0x140001790
   140001395:	mov    rax,QWORD PTR [rip+0x3e84]        # 0x140005220
   14000139c:	mov    r8,QWORD PTR [rip+0x3e75]        # 0x140005218
   1400013a3:	sub    rax,r8
   1400013a6:	mov    rdi,QWORD PTR [rsp+0x38]
   1400013ab:	mov    rbx,QWORD PTR [rsp+0x20]
   1400013b0:	mov    rdx,QWORD PTR [rsp+0x30]
   1400013b5:	cmp    rdx,rax
   1400013b8:	jne    0x1400013ec
   1400013ba:	xor    eax,eax
   1400013bc:	test   rdx,rdx
   1400013bf:	je     0x1400013e3
   1400013c1:	lea    rcx,[rsp+0x20]
   1400013c6:	cmp    rdi,0xf
   1400013ca:	cmova  rcx,rbx
   1400013ce:	movzx  ecx,BYTE PTR [rcx+rax*1]
   1400013d2:	xor    cl,0x5a
   1400013d5:	cmp    cl,BYTE PTR [r8+rax*1]
   1400013d9:	jne    0x1400013ec
   1400013db:	inc    rax
   1400013de:	cmp    rax,rdx
   1400013e1:	jb     0x1400013c1
   1400013e3:	lea    rdx,[rip+0x2056]        # 0x140003440
   1400013ea:	jmp    0x1400013f3
   1400013ec:	lea    rdx,[rip+0x2075]        # 0x140003468
   1400013f3:	mov    rcx,QWORD PTR [rip+0x1cd6]        # 0x1400030d0
   1400013fa:	call   0x1400015c0
   1400013ff:	lea    rdx,[rip+0x2082]        # 0x140003488
   140001406:	mov    rcx,QWORD PTR [rip+0x1cc3]        # 0x1400030d0
   14000140d:	call   0x1400015c0
   140001412:	mov    edx,0x1
   140001417:	mov    r8d,0xffffffff
   14000141d:	mov    rcx,QWORD PTR [rip+0x1c9c]        # 0x1400030c0
   140001424:	call   QWORD PTR [rip+0x1c66]        # 0x140003090
   14000142a:	mov    rcx,QWORD PTR [rip+0x1c8f]        # 0x1400030c0
   140001431:	call   QWORD PTR [rip+0x1c51]        # 0x140003088
   140001437:	nop
   140001438:	cmp    rdi,0xf
   14000143c:	jbe    0x14000146b
   14000143e:	lea    rdx,[rdi+0x1]
   140001442:	cmp    rdx,0x1000
   140001449:	jb     0x140001463
   14000144b:	mov    rax,QWORD PTR [rbx-0x8]
   14000144f:	sub    rbx,rax
   140001452:	sub    rbx,0x8
   140001456:	cmp    rbx,0x1f
   14000145a:	ja     0x140001485
   14000145c:	add    rdx,0x27
   140001460:	mov    rbx,rax
   140001463:	mov    rcx,rbx
   140001466:	call   0x140001f80
   14000146b:	xor    eax,eax
   14000146d:	mov    rcx,QWORD PTR [rsp+0x40]
   140001472:	xor    rcx,rsp
   140001475:	call   0x140001c90
   14000147a:	mov    rbx,QWORD PTR [rsp+0x60]
   14000147f:	add    rsp,0x50
   140001483:	pop    rdi
   140001484:	ret
   140001485:	mov    ecx,0x5
   14000148a:	int    0x29
   14000148c:	int3
   14000148d:	int3
   14000148e:	int3
   14000148f:	int3
   140001490:	rex push rbx
   140001492:	push   rbp
   140001493:	push   rsi
   140001494:	push   rdi
   140001495:	sub    rsp,0x48
   140001499:	mov    rax,QWORD PTR [rip+0x3ba0]        # 0x140005040
   1400014a0:	xor    rax,rsp
   1400014a3:	mov    QWORD PTR [rsp+0x38],rax
   1400014a8:	mov    rbp,rcx
   1400014ab:	xor    edx,edx
   1400014ad:	lea    rcx,[rsp+0x28]
   1400014b2:	call   QWORD PTR [rip+0x1c28]        # 0x1400030e0
   1400014b8:	nop
   1400014b9:	mov    rax,QWORD PTR [rip+0x3d50]        # 0x140005210
   1400014c0:	mov    QWORD PTR [rsp+0x20],rax
   1400014c5:	mov    rbx,QWORD PTR [rip+0x1bac]        # 0x140003078
   1400014cc:	cmp    QWORD PTR [rbx],0x0
   1400014d0:	jne    0x1400014ff
   1400014d2:	xor    edx,edx
   1400014d4:	lea    rcx,[rsp+0x30]
   1400014d9:	call   QWORD PTR [rip+0x1c01]        # 0x1400030e0
   1400014df:	cmp    QWORD PTR [rbx],0x0
   1400014e3:	jne    0x1400014f4
   1400014e5:	mov    rax,QWORD PTR [rip+0x1bcc]        # 0x1400030b8
   1400014ec:	inc    DWORD PTR [rax]
   1400014ee:	movsxd rax,DWORD PTR [rax]
   1400014f1:	mov    QWORD PTR [rbx],rax
   1400014f4:	lea    rcx,[rsp+0x30]
   1400014f9:	call   QWORD PTR [rip+0x1bf1]        # 0x1400030f0
   1400014ff:	mov    rsi,QWORD PTR [rbx]
   140001502:	mov    rcx,QWORD PTR [rbp+0x8]
   140001506:	lea    rdi,[rsi*8+0x0]
   14000150e:	cmp    rsi,QWORD PTR [rcx+0x18]
   140001512:	jae    0x140001523
   140001514:	mov    rax,QWORD PTR [rcx+0x10]
   140001518:	mov    rbx,QWORD PTR [rdi+rax*1]
   14000151c:	test   rbx,rbx
   14000151f:	jne    0x140001589
   140001521:	jmp    0x140001525
   140001523:	xor    ebx,ebx
   140001525:	cmp    BYTE PTR [rcx+0x24],0x0
   140001529:	je     0x14000153f
   14000152b:	call   QWORD PTR [rip+0x1b97]        # 0x1400030c8
   140001531:	cmp    rsi,QWORD PTR [rax+0x18]
   140001535:	jae    0x140001544
   140001537:	mov    rax,QWORD PTR [rax+0x10]
   14000153b:	mov    rbx,QWORD PTR [rdi+rax*1]
   14000153f:	test   rbx,rbx
   140001542:	jne    0x140001589
   140001544:	mov    rbx,QWORD PTR [rsp+0x20]
   140001549:	test   rbx,rbx
   14000154c:	jne    0x140001589
   14000154e:	mov    rdx,rbp
   140001551:	lea    rcx,[rsp+0x20]
   140001556:	call   QWORD PTR [rip+0x1b4c]        # 0x1400030a8
   14000155c:	cmp    rax,0xffffffffffffffff
   140001560:	je     0x1400015ad
   140001562:	mov    rbx,QWORD PTR [rsp+0x20]
   140001567:	mov    QWORD PTR [rsp+0x30],rbx
   14000156c:	mov    rcx,rbx
   14000156f:	call   0x140001c30
   140001574:	mov    rax,QWORD PTR [rbx]
   140001577:	mov    rcx,rbx
   14000157a:	call   QWORD PTR [rax+0x8]
   14000157d:	mov    rbx,QWORD PTR [rsp+0x20]
   140001582:	mov    QWORD PTR [rip+0x3c87],rbx        # 0x140005210
   140001589:	lea    rcx,[rsp+0x28]
   14000158e:	call   QWORD PTR [rip+0x1b5c]        # 0x1400030f0
   140001594:	mov    rax,rbx
   140001597:	mov    rcx,QWORD PTR [rsp+0x38]
   14000159c:	xor    rcx,rsp
   14000159f:	call   0x140001c90
   1400015a4:	add    rsp,0x48
   1400015a8:	pop    rdi
   1400015a9:	pop    rsi
   1400015aa:	pop    rbp
   1400015ab:	pop    rbx
   1400015ac:	ret
   1400015ad:	call   0x140001270
   1400015b2:	nop
   1400015b3:	int3
   1400015b4:	int3
   1400015b5:	int3
   1400015b6:	int3
   1400015b7:	int3
   1400015b8:	int3
   1400015b9:	int3
   1400015ba:	int3
   1400015bb:	int3
   1400015bc:	int3
   1400015bd:	int3
   1400015be:	int3
   1400015bf:	int3
   1400015c0:	mov    QWORD PTR [rsp+0x10],rbx
   1400015c5:	mov    QWORD PTR [rsp+0x8],rcx
   1400015ca:	push   rsi
   1400015cb:	push   rdi
   1400015cc:	push   r12
   1400015ce:	push   r14
   1400015d0:	push   r15
   1400015d2:	sub    rsp,0x30
   1400015d6:	mov    r12,rdx
   1400015d9:	mov    rdi,rcx
   1400015dc:	xor    ebx,ebx
   1400015de:	mov    DWORD PTR [rsp+0x70],ebx
   1400015e2:	mov    rcx,rdx
   1400015e5:	call   0x140002b8e
   1400015ea:	mov    r15,rax
   1400015ed:	mov    r8,QWORD PTR [rdi]
   1400015f0:	movsxd rcx,DWORD PTR [r8+0x4]
   1400015f4:	mov    rsi,QWORD PTR [rcx+rdi*1+0x28]
   1400015f9:	test   rsi,rsi
   1400015fc:	jle    0x140001608
   1400015fe:	cmp    rsi,rax
   140001601:	jle    0x140001608
   140001603:	sub    rsi,rax
   140001606:	jmp    0x14000160a
   140001608:	xor    esi,esi
   14000160a:	mov    r14,rdi
   14000160d:	mov    QWORD PTR [rsp+0x20],rdi
   140001612:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001617:	test   rcx,rcx
   14000161a:	je     0x140001623
   14000161c:	mov    rax,QWORD PTR [rcx]
   14000161f:	call   QWORD PTR [rax+0x8]
   140001622:	nop
   140001623:	mov    rax,QWORD PTR [rdi]
   140001626:	movsxd rcx,DWORD PTR [rax+0x4]
   14000162a:	add    rcx,rdi
   14000162d:	call   QWORD PTR [rip+0x1a6d]        # 0x1400030a0
   140001633:	test   al,al
   140001635:	jne    0x14000163d
   140001637:	mov    BYTE PTR [rsp+0x28],al
   14000163b:	jmp    0x140001676
   14000163d:	mov    rax,QWORD PTR [rdi]
   140001640:	movsxd rcx,DWORD PTR [rax+0x4]
   140001644:	mov    rcx,QWORD PTR [rcx+rdi*1+0x50]
   140001649:	test   rcx,rcx
   14000164c:	je     0x14000166f
   14000164e:	cmp    rcx,rdi
   140001651:	je     0x14000166f
   140001653:	call   QWORD PTR [rip+0x19ff]        # 0x140003058
   140001659:	mov    rax,QWORD PTR [rdi]
   14000165c:	movsxd rcx,DWORD PTR [rax+0x4]
   140001660:	add    rcx,rdi
   140001663:	call   QWORD PTR [rip+0x1a37]        # 0x1400030a0
   140001669:	mov    BYTE PTR [rsp+0x28],al
   14000166d:	jmp    0x140001676
   14000166f:	mov    BYTE PTR [rsp+0x28],0x1
   140001674:	mov    al,0x1
   140001676:	test   al,al
   140001678:	jne    0x140001684
   14000167a:	mov    ebx,0x4
   14000167f:	jmp    0x14000172f
   140001684:	mov    rdx,QWORD PTR [rdi]
   140001687:	movsxd rax,DWORD PTR [rdx+0x4]
   14000168b:	mov    ecx,DWORD PTR [rax+rdi*1+0x18]
   14000168f:	and    ecx,0x1c0
   140001695:	cmp    ecx,0x40
   140001698:	je     0x1400016c6
   14000169a:	nop    WORD PTR [rax+rax*1+0x0]
   1400016a0:	mov    rdx,QWORD PTR [rdi]
   1400016a3:	test   rsi,rsi
   1400016a6:	jle    0x1400016c6
   1400016a8:	movsxd rcx,DWORD PTR [rdx+0x4]
   1400016ac:	movzx  edx,BYTE PTR [rcx+rdi*1+0x58]
   1400016b1:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400016b6:	call   QWORD PTR [rip+0x1a2c]        # 0x1400030e8
   1400016bc:	cmp    eax,0xffffffff
   1400016bf:	je     0x140001706
   1400016c1:	dec    rsi
   1400016c4:	jmp    0x1400016a0
   1400016c6:	movsxd rcx,DWORD PTR [rdx+0x4]
   1400016ca:	mov    r8,r15
   1400016cd:	mov    rdx,r12
   1400016d0:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400016d5:	call   QWORD PTR [rip+0x19a5]        # 0x140003080
   1400016db:	cmp    rax,r15
   1400016de:	jne    0x140001706
   1400016e0:	test   rsi,rsi
   1400016e3:	jle    0x14000170f
   1400016e5:	mov    rax,QWORD PTR [rdi]
   1400016e8:	movsxd rcx,DWORD PTR [rax+0x4]
   1400016ec:	movzx  edx,BYTE PTR [rcx+rdi*1+0x58]
   1400016f1:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400016f6:	call   QWORD PTR [rip+0x19ec]        # 0x1400030e8
   1400016fc:	cmp    eax,0xffffffff
   1400016ff:	je     0x140001706
   140001701:	dec    rsi
   140001704:	jmp    0x1400016e0
   140001706:	mov    ebx,0x4
   14000170b:	mov    DWORD PTR [rsp+0x70],ebx
   14000170f:	mov    rax,QWORD PTR [rdi]
   140001712:	movsxd rcx,DWORD PTR [rax+0x4]
   140001716:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   14000171f:	jmp    0x14000172f
   140001721:	mov    rdi,QWORD PTR [rsp+0x60]
   140001726:	mov    ebx,DWORD PTR [rsp+0x70]
   14000172a:	mov    r14,QWORD PTR [rsp+0x20]
   14000172f:	mov    rax,QWORD PTR [rdi]
   140001732:	movsxd rcx,DWORD PTR [rax+0x4]
   140001736:	add    rcx,rdi
   140001739:	xor    r8d,r8d
   14000173c:	mov    edx,ebx
   14000173e:	call   QWORD PTR [rip+0x191c]        # 0x140003060
   140001744:	nop
   140001745:	call   QWORD PTR [rip+0x198d]        # 0x1400030d8
   14000174b:	test   eax,eax
   14000174d:	jne    0x140001759
   14000174f:	mov    rcx,r14
   140001752:	call   QWORD PTR [rip+0x18f8]        # 0x140003050
   140001758:	nop
   140001759:	mov    rax,QWORD PTR [r14]
   14000175c:	movsxd rcx,DWORD PTR [rax+0x4]
   140001760:	mov    rcx,QWORD PTR [rcx+r14*1+0x48]
   140001765:	test   rcx,rcx
   140001768:	je     0x140001771
   14000176a:	mov    rax,QWORD PTR [rcx]
   14000176d:	call   QWORD PTR [rax+0x10]
   140001770:	nop
   140001771:	mov    rax,rdi
   140001774:	mov    rbx,QWORD PTR [rsp+0x68]
   140001779:	add    rsp,0x30
   14000177d:	pop    r15
   14000177f:	pop    r14
   140001781:	pop    r12
   140001783:	pop    rdi
   140001784:	pop    rsi
   140001785:	ret
   140001786:	int3
   140001787:	int3
   140001788:	int3
   140001789:	int3
   14000178a:	int3
   14000178b:	int3
   14000178c:	int3
   14000178d:	int3
   14000178e:	int3
   14000178f:	int3
   140001790:	mov    QWORD PTR [rsp+0x18],rbx
   140001795:	mov    QWORD PTR [rsp+0x20],rsi
   14000179a:	push   rdi
   14000179b:	push   r12
   14000179d:	push   r13
   14000179f:	push   r14
   1400017a1:	push   r15
   1400017a3:	sub    rsp,0x50
   1400017a7:	mov    rbx,rdx
   1400017aa:	mov    rdi,rcx
   1400017ad:	mov    QWORD PTR [rsp+0x28],rcx
   1400017b2:	xor    esi,esi
   1400017b4:	mov    DWORD PTR [rsp+0x24],esi
   1400017b8:	xor    r15b,r15b
   1400017bb:	mov    BYTE PTR [rsp+0x20],r15b
   1400017c0:	mov    r12,rcx
   1400017c3:	mov    QWORD PTR [rsp+0x30],rcx
   1400017c8:	mov    rax,QWORD PTR [rcx]
   1400017cb:	movsxd rcx,DWORD PTR [rax+0x4]
   1400017cf:	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   1400017d4:	test   rcx,rcx
   1400017d7:	je     0x1400017e0
   1400017d9:	mov    rax,QWORD PTR [rcx]
   1400017dc:	call   QWORD PTR [rax+0x8]
   1400017df:	nop
   1400017e0:	xor    edx,edx
   1400017e2:	mov    rcx,rdi
   1400017e5:	call   QWORD PTR [rip+0x185d]        # 0x140003048
   1400017eb:	mov    BYTE PTR [rsp+0x38],al
   1400017ef:	test   al,al
   1400017f1:	je     0x14000191e
   1400017f7:	mov    rax,QWORD PTR [rdi]
   1400017fa:	movsxd rcx,DWORD PTR [rax+0x4]
   1400017fe:	add    rcx,rdi
   140001801:	lea    rdx,[rsp+0x40]
   140001806:	call   QWORD PTR [rip+0x188c]        # 0x140003098
   14000180c:	nop
   14000180d:	mov    rcx,rax
   140001810:	call   0x140001490
   140001815:	mov    r13,rax
   140001818:	mov    rcx,QWORD PTR [rsp+0x48]
   14000181d:	test   rcx,rcx
   140001820:	je     0x14000183a
   140001822:	mov    rax,QWORD PTR [rcx]
   140001825:	call   QWORD PTR [rax+0x10]
   140001828:	mov    rcx,rax
   14000182b:	test   rax,rax
   14000182e:	je     0x14000183a
   140001830:	mov    rax,QWORD PTR [rax]
   140001833:	mov    edx,0x1
   140001838:	call   QWORD PTR [rax]
   14000183a:	mov    QWORD PTR [rbx+0x10],0x0
   140001842:	cmp    QWORD PTR [rbx+0x18],0xf
   140001847:	jbe    0x14000184e
   140001849:	mov    rax,QWORD PTR [rbx]
   14000184c:	jmp    0x140001851
   14000184e:	mov    rax,rbx
   140001851:	mov    BYTE PTR [rax],0x0
   140001854:	mov    rax,QWORD PTR [rdi]
   140001857:	movsxd rcx,DWORD PTR [rax+0x4]
   14000185b:	mov    r14,QWORD PTR [rdi+rcx*1+0x28]
   140001860:	movabs rax,0x7fffffffffffffff
   14000186a:	test   r14,r14
   14000186d:	jle    0x140001874
   14000186f:	cmp    r14,rax
   140001872:	jb     0x140001877
   140001874:	mov    r14,rax
   140001877:	mov    rcx,QWORD PTR [rdi+rcx*1+0x48]
   14000187c:	call   QWORD PTR [rip+0x17e6]        # 0x140003068
   140001882:	test   r14,r14
   140001885:	je     0x140001895
   140001887:	cmp    eax,0xffffffff
   14000188a:	jne    0x14000189a
   14000188c:	mov    esi,0x1
   140001891:	mov    DWORD PTR [rsp+0x24],esi
   140001895:	jmp    0x14000191e
   14000189a:	movzx  r9d,al
   14000189e:	mov    rax,QWORD PTR [r13+0x18]
   1400018a2:	test   BYTE PTR [rax+r9*2],0x48
   1400018a7:	jne    0x140001895
   1400018a9:	mov    rcx,QWORD PTR [rbx+0x10]
   1400018ad:	mov    rdx,QWORD PTR [rbx+0x18]
   1400018b1:	cmp    rcx,rdx
   1400018b4:	jae    0x1400018e0
   1400018b6:	lea    rax,[rcx+0x1]
   1400018ba:	mov    QWORD PTR [rbx+0x10],rax
   1400018be:	cmp    rdx,0xf
   1400018c2:	jbe    0x1400018d2
   1400018c4:	mov    rax,QWORD PTR [rbx]
   1400018c7:	mov    BYTE PTR [rax+rcx*1],r9b
   1400018cb:	mov    BYTE PTR [rax+rcx*1+0x1],0x0
   1400018d0:	jmp    0x1400018e8
   1400018d2:	mov    rax,rbx
   1400018d5:	mov    BYTE PTR [rbx+rcx*1],r9b
   1400018d9:	mov    BYTE PTR [rbx+rcx*1+0x1],0x0
   1400018de:	jmp    0x1400018e8
   1400018e0:	mov    rcx,rbx
   1400018e3:	call   0x140001ac0
   1400018e8:	mov    r15b,0x1
   1400018eb:	mov    BYTE PTR [rsp+0x20],r15b
   1400018f0:	dec    r14
   1400018f3:	mov    rax,QWORD PTR [rdi]
   1400018f6:	movsxd rcx,DWORD PTR [rax+0x4]
   1400018fa:	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400018ff:	call   QWORD PTR [rip+0x176b]        # 0x140003070
   140001905:	jmp    0x140001882
   14000190a:	mov    esi,DWORD PTR [rsp+0x24]
   14000190e:	movzx  r15d,BYTE PTR [rsp+0x20]
   140001914:	mov    r12,QWORD PTR [rsp+0x30]
   140001919:	mov    rdi,QWORD PTR [rsp+0x28]
   14000191e:	mov    rax,QWORD PTR [rdi]
   140001921:	movsxd rcx,DWORD PTR [rax+0x4]
   140001925:	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   14000192e:	test   r15b,r15b
   140001931:	jne    0x140001936
   140001933:	or     esi,0x2
   140001936:	mov    rax,QWORD PTR [rdi]
   140001939:	movsxd rcx,DWORD PTR [rax+0x4]
   14000193d:	add    rcx,rdi
   140001940:	xor    r8d,r8d
   140001943:	mov    edx,esi
   140001945:	call   QWORD PTR [rip+0x1715]        # 0x140003060
   14000194b:	nop
   14000194c:	mov    rcx,QWORD PTR [r12]
   140001950:	movsxd rdx,DWORD PTR [rcx+0x4]
   140001954:	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   140001959:	test   rcx,rcx
   14000195c:	je     0x140001965
   14000195e:	mov    rdx,QWORD PTR [rcx]
   140001961:	call   QWORD PTR [rdx+0x10]
   140001964:	nop
   140001965:	mov    rax,rdi
   140001968:	lea    r11,[rsp+0x50]
   14000196d:	mov    rbx,QWORD PTR [r11+0x40]
   140001971:	mov    rsi,QWORD PTR [r11+0x48]
   140001975:	mov    rsp,r11
   140001978:	pop    r15
   14000197a:	pop    r14
   14000197c:	pop    r13
   14000197e:	pop    r12
   140001980:	pop    rdi
   140001981:	ret
   140001982:	int3
   140001983:	int3
   140001984:	int3
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
   140001990:	rex push rbx
   140001992:	sub    rsp,0x20
   140001996:	mov    rbx,rcx
   140001999:	mov    rcx,QWORD PTR [rcx+0x18]
   14000199d:	cmp    rcx,0xf
   1400019a1:	jbe    0x1400019dc
   1400019a3:	mov    rax,QWORD PTR [rbx]
   1400019a6:	lea    rdx,[rcx+0x1]
   1400019aa:	cmp    rdx,0x1000
   1400019b1:	jb     0x1400019d1
   1400019b3:	mov    r8,QWORD PTR [rax-0x8]
   1400019b7:	sub    rax,r8
   1400019ba:	sub    rax,0x8
   1400019be:	cmp    rax,0x1f
   1400019c2:	ja     0x1400019ca
   1400019c4:	lea    rdx,[rcx+0x28]
   1400019c8:	jmp    0x1400019d4
   1400019ca:	mov    ecx,0x5
   1400019cf:	int    0x29
   1400019d1:	mov    r8,rax
   1400019d4:	mov    rcx,r8
   1400019d7:	call   0x140001f80
   1400019dc:	mov    QWORD PTR [rbx+0x10],0x0
   1400019e4:	mov    QWORD PTR [rbx+0x18],0xf
   1400019ec:	mov    BYTE PTR [rbx],0x0
   1400019ef:	add    rsp,0x20
   1400019f3:	pop    rbx
   1400019f4:	ret
   1400019f5:	int3
   1400019f6:	int3
   1400019f7:	int3
   1400019f8:	int3
   1400019f9:	int3
   1400019fa:	int3
   1400019fb:	int3
   1400019fc:	int3
   1400019fd:	int3
   1400019fe:	int3
   1400019ff:	int3
   140001a00:	sub    rsp,0x28
   140001a04:	mov    rdx,QWORD PTR [rcx]
   140001a07:	mov    rax,QWORD PTR [rdx]
   140001a0a:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a0e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a13:	test   rcx,rcx
   140001a16:	je     0x140001a1f
   140001a18:	mov    rax,QWORD PTR [rcx]
   140001a1b:	call   QWORD PTR [rax+0x10]
   140001a1e:	nop
   140001a1f:	add    rsp,0x28
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
   140001a30:	sub    rsp,0x28
   140001a34:	mov    rdx,QWORD PTR [rcx]
   140001a37:	mov    rax,QWORD PTR [rdx]
   140001a3a:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a3e:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a43:	test   rcx,rcx
   140001a46:	je     0x140001a4f
   140001a48:	mov    rax,QWORD PTR [rcx]
   140001a4b:	call   QWORD PTR [rax+0x10]
   140001a4e:	nop
   140001a4f:	add    rsp,0x28
   140001a53:	ret
   140001a54:	int3
   140001a55:	int3
   140001a56:	int3
   140001a57:	int3
   140001a58:	int3
   140001a59:	int3
   140001a5a:	int3
   140001a5b:	int3
   140001a5c:	int3
   140001a5d:	int3
   140001a5e:	int3
   140001a5f:	int3
   140001a60:	rex push rbx
   140001a62:	sub    rsp,0x20
   140001a66:	mov    rbx,rcx
   140001a69:	call   QWORD PTR [rip+0x1669]        # 0x1400030d8
   140001a6f:	test   eax,eax
   140001a71:	jne    0x140001a7d
   140001a73:	mov    rcx,QWORD PTR [rbx]
   140001a76:	call   QWORD PTR [rip+0x15d4]        # 0x140003050
   140001a7c:	nop
   140001a7d:	mov    rdx,QWORD PTR [rbx]
   140001a80:	mov    rax,QWORD PTR [rdx]
   140001a83:	movsxd rcx,DWORD PTR [rax+0x4]
   140001a87:	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a8c:	test   rcx,rcx
   140001a8f:	je     0x140001a98
   140001a91:	mov    rax,QWORD PTR [rcx]
   140001a94:	call   QWORD PTR [rax+0x10]
   140001a97:	nop
   140001a98:	add    rsp,0x20
   140001a9c:	pop    rbx
   140001a9d:	ret
   140001a9e:	int3
   140001a9f:	int3
   140001aa0:	mov    rcx,QWORD PTR [rcx]
   140001aa3:	test   rcx,rcx
   140001aa6:	je     0x140001ab3
   140001aa8:	mov    rax,QWORD PTR [rcx]
   140001aab:	mov    edx,0x1
   140001ab0:	rex.W jmp QWORD PTR [rax]
   140001ab3:	ret
   140001ab4:	int3
   140001ab5:	int3
   140001ab6:	int3
   140001ab7:	int3
   140001ab8:	int3
   140001ab9:	int3
   140001aba:	int3
   140001abb:	int3
   140001abc:	int3
   140001abd:	int3
   140001abe:	int3
   140001abf:	int3
   140001ac0:	rex push rbp
   140001ac2:	push   rsi
   140001ac3:	push   rdi
   140001ac4:	push   r12
   140001ac6:	sub    rsp,0x28
   140001aca:	mov    rbp,QWORD PTR [rcx+0x10]
   140001ace:	movabs rdi,0x7fffffffffffffff
   140001ad8:	mov    rax,rdi
   140001adb:	movzx  r12d,r9b
   140001adf:	sub    rax,rbp
   140001ae2:	mov    rsi,rcx
   140001ae5:	cmp    rax,0x1
   140001ae9:	jb     0x140001c18
   140001aef:	mov    QWORD PTR [rsp+0x58],rbx
   140001af4:	mov    QWORD PTR [rsp+0x60],r14
   140001af9:	mov    r14,QWORD PTR [rcx+0x18]
   140001afd:	mov    QWORD PTR [rsp+0x20],r15
   140001b02:	lea    r15,[rbp+0x1]
   140001b06:	mov    rcx,r15
   140001b09:	or     rcx,0xf
   140001b0d:	cmp    rcx,rdi
   140001b10:	ja     0x140001b55
   140001b12:	mov    rdx,r14
   140001b15:	mov    rax,rdi
   140001b18:	shr    rdx,1
   140001b1b:	sub    rax,rdx
   140001b1e:	cmp    r14,rax
   140001b21:	ja     0x140001b55
   140001b23:	lea    rax,[rdx+r14*1]
   140001b27:	mov    rdi,rcx
   140001b2a:	cmp    rcx,rax
   140001b2d:	cmovb  rdi,rax
   140001b31:	lea    rax,[rdi+0x1]
   140001b35:	test   rax,rax
   140001b38:	jne    0x140001b3e
   140001b3a:	xor    ebx,ebx
   140001b3c:	jmp    0x140001b86
   140001b3e:	cmp    rax,0x1000
   140001b44:	jb     0x140001b7b
   140001b46:	lea    rcx,[rax+0x27]
   140001b4a:	cmp    rcx,rax
   140001b4d:	jbe    0x140001c1e
   140001b53:	jmp    0x140001b63
   140001b55:	movabs rcx,0x8000000000000000
   140001b5f:	add    rcx,0x27
   140001b63:	call   0x140001cb0
   140001b68:	test   rax,rax
   140001b6b:	je     0x140001bd7
   140001b6d:	lea    rbx,[rax+0x27]
   140001b71:	and    rbx,0xffffffffffffffe0
   140001b75:	mov    QWORD PTR [rbx-0x8],rax
   140001b79:	jmp    0x140001b86
   140001b7b:	mov    rcx,rax
   140001b7e:	call   0x140001cb0
   140001b83:	mov    rbx,rax
   140001b86:	mov    QWORD PTR [rsi+0x10],r15
   140001b8a:	mov    r8,rbp
   140001b8d:	mov    QWORD PTR [rsi+0x18],rdi
   140001b91:	mov    rcx,rbx
   140001b94:	cmp    r14,0xf
   140001b98:	jbe    0x140001be8
   140001b9a:	mov    rdi,QWORD PTR [rsi]
   140001b9d:	mov    rdx,rdi
   140001ba0:	call   0x140002b88
   140001ba5:	lea    rdx,[r14+0x1]
   140001ba9:	mov    BYTE PTR [rbx+rbp*1],r12b
   140001bad:	mov    BYTE PTR [rbx+rbp*1+0x1],0x0
   140001bb2:	cmp    rdx,0x1000
   140001bb9:	jb     0x140001bde
   140001bbb:	mov    rcx,QWORD PTR [rdi-0x8]
   140001bbf:	sub    rdi,rcx
   140001bc2:	sub    rdi,0x8
   140001bc6:	cmp    rdi,0x1f
   140001bca:	ja     0x140001bd7
   140001bcc:	lea    rdx,[r14+0x28]
   140001bd0:	call   0x140001f80
   140001bd5:	jmp    0x140001bf9
   140001bd7:	mov    ecx,0x5
   140001bdc:	int    0x29
   140001bde:	mov    rcx,rdi
   140001be1:	call   0x140001f80
   140001be6:	jmp    0x140001bf9
   140001be8:	mov    rdx,rsi
   140001beb:	call   0x140002b88
   140001bf0:	mov    BYTE PTR [rbx+rbp*1],r12b
   140001bf4:	mov    BYTE PTR [rbx+rbp*1+0x1],0x0
   140001bf9:	mov    QWORD PTR [rsi],rbx
   140001bfc:	mov    rax,rsi
   140001bff:	mov    r14,QWORD PTR [rsp+0x60]
   140001c04:	mov    rbx,QWORD PTR [rsp+0x58]
   140001c09:	mov    r15,QWORD PTR [rsp+0x20]
   140001c0e:	add    rsp,0x28
   140001c12:	pop    r12
   140001c14:	pop    rdi
   140001c15:	pop    rsi
   140001c16:	pop    rbp
   140001c17:	ret
   140001c18:	call   0x140001220
   140001c1d:	int3
   140001c1e:	call   0x140001180
   140001c23:	int3
   140001c24:	jmp    QWORD PTR [rip+0x14c6]        # 0x1400030f0
   140001c2a:	int3
   140001c2b:	int3
   140001c2c:	int3
   140001c2d:	int3
   140001c2e:	int3
   140001c2f:	int3
   140001c30:	rex push rbx
   140001c32:	sub    rsp,0x20
   140001c36:	mov    rbx,rcx
   140001c39:	mov    ecx,0x10
   140001c3e:	call   QWORD PTR [rip+0x151c]        # 0x140003160
   140001c44:	mov    rdx,rax
   140001c47:	test   rax,rax
   140001c4a:	je     0x140001c67
   140001c4c:	mov    rax,QWORD PTR [rip+0x352d]        # 0x140005180
   140001c53:	mov    QWORD PTR [rdx],rax
   140001c56:	mov    QWORD PTR [rdx+0x8],rbx
   140001c5a:	mov    QWORD PTR [rip+0x351f],rdx        # 0x140005180
   140001c61:	add    rsp,0x20
   140001c65:	pop    rbx
   140001c66:	ret
   140001c67:	call   0x140001c6d
   140001c6c:	int3
   140001c6d:	jmp    QWORD PTR [rip+0x143d]        # 0x1400030b0
   140001c73:	int3
   140001c74:	int3
   140001c75:	int3
   140001c76:	int3
   140001c77:	int3
   140001c78:	int3
   140001c79:	int3
   140001c7a:	int3
   140001c7b:	int3
   140001c7c:	int3
   140001c7d:	int3
   140001c7e:	int3
   140001c7f:	int3
   140001c80:	int3
   140001c81:	int3
   140001c82:	int3
   140001c83:	int3
   140001c84:	int3
   140001c85:	int3
   140001c86:	data16 nop WORD PTR [rax+rax*1+0x0]
   140001c90:	cmp    rcx,QWORD PTR [rip+0x33a9]        # 0x140005040
   140001c97:	jne    0x140001ca9
   140001c99:	rol    rcx,0x10
   140001c9d:	test   cx,0xffff
   140001ca2:	jne    0x140001ca5
   140001ca4:	ret
   140001ca5:	ror    rcx,0x10
   140001ca9:	jmp    0x140002260
   140001cae:	int3
   140001caf:	int3
   140001cb0:	rex push rbx
   140001cb2:	sub    rsp,0x20
   140001cb6:	mov    rbx,rcx
   140001cb9:	call   0x1400028ba
   140001cbe:	test   rax,rax
   140001cc1:	jne    0x140001cdc
   140001cc3:	mov    rcx,rbx
   140001cc6:	call   0x1400028c0
   140001ccb:	test   eax,eax
   140001ccd:	je     0x140001ce2
   140001ccf:	mov    rcx,rbx
   140001cd2:	call   0x1400028ba
   140001cd7:	test   rax,rax
   140001cda:	je     0x140001cc3
   140001cdc:	add    rsp,0x20
   140001ce0:	pop    rbx
   140001ce1:	ret
   140001ce2:	cmp    rbx,0xffffffffffffffff
   140001ce6:	je     0x140001cee
   140001ce8:	call   0x1400022a0
   140001ced:	int3
   140001cee:	call   0x140001180
   140001cf3:	int3
   140001cf4:	int3
   140001cf5:	int3
   140001cf6:	int3
   140001cf7:	int3
   140001cf8:	int3
   140001cf9:	int3
   140001cfa:	int3
   140001cfb:	int3
   140001cfc:	int3
   140001cfd:	int3
   140001cfe:	int3
   140001cff:	int3
   140001d00:	sub    rsp,0x28
   140001d04:	call   0x140002580
   140001d09:	test   eax,eax
   140001d0b:	je     0x140001d39
   140001d0d:	mov    rax,QWORD PTR gs:0x30
   140001d16:	mov    rcx,QWORD PTR [rax+0x8]
   140001d1a:	xor    eax,eax
   140001d1c:	lock cmpxchg QWORD PTR [rip+0x3473],rcx        # 0x140005198
   140001d25:	je     0x140001d39
   140001d27:	cmp    rcx,rax
   140001d2a:	je     0x140001d40
   140001d2c:	xor    eax,eax
   140001d2e:	lock cmpxchg QWORD PTR [rip+0x3461],rcx        # 0x140005198
   140001d37:	jne    0x140001d27
   140001d39:	xor    al,al
   140001d3b:	add    rsp,0x28
   140001d3f:	ret
   140001d40:	mov    al,0x1
   140001d42:	add    rsp,0x28
   140001d46:	ret
   140001d47:	int3
   140001d48:	int3
   140001d49:	int3
   140001d4a:	int3
   140001d4b:	int3
   140001d4c:	int3
   140001d4d:	int3
   140001d4e:	int3
   140001d4f:	int3
   140001d50:	sub    rsp,0x28
   140001d54:	test   ecx,ecx
   140001d56:	jne    0x140001d5f
   140001d58:	mov    BYTE PTR [rip+0x3441],0x1        # 0x1400051a0
   140001d5f:	call   0x1400022c0
   140001d64:	call   0x140002770
   140001d69:	test   al,al
   140001d6b:	je     0x140001d7d
   140001d6d:	call   0x140002770
   140001d72:	test   al,al
   140001d74:	jne    0x140001d84
   140001d76:	xor    ecx,ecx
   140001d78:	call   0x140002770
   140001d7d:	xor    al,al
   140001d7f:	add    rsp,0x28
   140001d83:	ret
   140001d84:	mov    al,0x1
   140001d86:	add    rsp,0x28
   140001d8a:	ret
   140001d8b:	int3
   140001d8c:	int3
   140001d8d:	int3
   140001d8e:	int3
   140001d8f:	int3
   140001d90:	rex push rbx
   140001d92:	sub    rsp,0x20
   140001d96:	cmp    BYTE PTR [rip+0x3404],0x0        # 0x1400051a1
   140001d9d:	mov    ebx,ecx
   140001d9f:	jne    0x140001e10
   140001da1:	cmp    ecx,0x1
   140001da4:	ja     0x140001e18
   140001da6:	call   0x140002580
   140001dab:	test   eax,eax
   140001dad:	je     0x140001ddb
   140001daf:	test   ebx,ebx
   140001db1:	jne    0x140001ddb
   140001db3:	lea    rcx,[rip+0x33ee]        # 0x1400051a8
   140001dba:	call   0x1400028d2
   140001dbf:	test   eax,eax
   140001dc1:	jne    0x140001dd3
   140001dc3:	lea    rcx,[rip+0x33f6]        # 0x1400051c0
   140001dca:	call   0x1400028d2
   140001dcf:	test   eax,eax
   140001dd1:	je     0x140001e09
   140001dd3:	xor    al,al
   140001dd5:	add    rsp,0x20
   140001dd9:	pop    rbx
   140001dda:	ret
   140001ddb:	movdqa xmm0,XMMWORD PTR [rip+0x151d]        # 0x140003300
   140001de3:	movdqu XMMWORD PTR [rip+0x33bd],xmm0        # 0x1400051a8
   140001deb:	mov    QWORD PTR [rip+0x33c2],0xffffffffffffffff        # 0x1400051b8
   140001df6:	movdqu XMMWORD PTR [rip+0x33c2],xmm0        # 0x1400051c0
   140001dfe:	mov    QWORD PTR [rip+0x33c7],0xffffffffffffffff        # 0x1400051d0
   140001e09:	mov    BYTE PTR [rip+0x3391],0x1        # 0x1400051a1
   140001e10:	mov    al,0x1
   140001e12:	add    rsp,0x20
   140001e16:	pop    rbx
   140001e17:	ret
   140001e18:	mov    ecx,0x5
   140001e1d:	call   0x140002590
   140001e22:	int3
   140001e23:	int3
   140001e24:	int3
   140001e25:	int3
   140001e26:	int3
   140001e27:	int3
   140001e28:	int3
   140001e29:	int3
   140001e2a:	int3
   140001e2b:	int3
   140001e2c:	int3
   140001e2d:	int3
   140001e2e:	int3
   140001e2f:	int3
   140001e30:	sub    rsp,0x18
   140001e34:	mov    r8,rcx
   140001e37:	mov    eax,0x5a4d
   140001e3c:	cmp    WORD PTR [rip+0xffffffffffffe1bd],ax        # 0x140000000
   140001e43:	jne    0x140001eb6
   140001e45:	movsxd rcx,DWORD PTR [rip+0xffffffffffffe1f0]        # 0x14000003c
   140001e4c:	lea    rdx,[rip+0xffffffffffffe1ad]        # 0x140000000
   140001e53:	add    rcx,rdx
   140001e56:	cmp    DWORD PTR [rcx],0x4550
   140001e5c:	jne    0x140001eb6
   140001e5e:	mov    eax,0x20b
   140001e63:	cmp    WORD PTR [rcx+0x18],ax
   140001e67:	jne    0x140001eb6
   140001e69:	sub    r8,rdx
   140001e6c:	movzx  eax,WORD PTR [rcx+0x14]
   140001e70:	add    rax,0x18
   140001e74:	add    rax,rcx
   140001e77:	movzx  ecx,WORD PTR [rcx+0x6]
   140001e7b:	lea    rdx,[rcx+rcx*4]
   140001e7f:	lea    r9,[rax+rdx*8]
   140001e83:	mov    QWORD PTR [rsp],rax
   140001e87:	cmp    rax,r9
   140001e8a:	je     0x140001eb2
   140001e8c:	mov    edx,DWORD PTR [rax+0xc]
   140001e8f:	cmp    r8,rdx
   140001e92:	jb     0x140001eac
   140001e94:	mov    ecx,DWORD PTR [rax+0x8]
   140001e97:	add    ecx,edx
   140001e99:	cmp    r8,rcx
   140001e9c:	jae    0x140001eac
   140001e9e:	cmp    DWORD PTR [rax+0x24],0x0
   140001ea2:	jge    0x140001ea8
   140001ea4:	xor    al,al
   140001ea6:	jmp    0x140001ebc
   140001ea8:	mov    al,0x1
   140001eaa:	jmp    0x140001ebc
   140001eac:	add    rax,0x28
   140001eb0:	jmp    0x140001e83
   140001eb2:	xor    al,al
   140001eb4:	jmp    0x140001ebc
   140001eb6:	xor    al,al
   140001eb8:	jmp    0x140001ebc
   140001eba:	xor    al,al
   140001ebc:	add    rsp,0x18
   140001ec0:	ret
   140001ec1:	int3
   140001ec2:	int3
   140001ec3:	int3
   140001ec4:	int3
   140001ec5:	int3
   140001ec6:	int3
   140001ec7:	int3
   140001ec8:	int3
   140001ec9:	int3
   140001eca:	int3
   140001ecb:	int3
   140001ecc:	int3
   140001ecd:	int3
   140001ece:	int3
   140001ecf:	int3
   140001ed0:	rex push rbx
   140001ed2:	sub    rsp,0x20
   140001ed6:	movzx  ebx,cl
   140001ed9:	call   0x140002580
   140001ede:	test   eax,eax
   140001ee0:	je     0x140001eef
   140001ee2:	test   bl,bl
   140001ee4:	jne    0x140001eef
   140001ee6:	xor    eax,eax
   140001ee8:	xchg   QWORD PTR [rip+0x32a9],rax        # 0x140005198
   140001eef:	add    rsp,0x20
   140001ef3:	pop    rbx
   140001ef4:	ret
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
   140001f00:	rex push rbx
   140001f02:	sub    rsp,0x20
   140001f06:	cmp    BYTE PTR [rip+0x3293],0x0        # 0x1400051a0
   140001f0d:	movzx  ebx,cl
   140001f10:	je     0x140001f16
   140001f12:	test   dl,dl
   140001f14:	jne    0x140001f23
   140001f16:	call   0x140002770
   140001f1b:	movzx  ecx,bl
   140001f1e:	call   0x140002770
   140001f23:	mov    al,0x1
   140001f25:	add    rsp,0x20
   140001f29:	pop    rbx
   140001f2a:	ret
   140001f2b:	int3
   140001f2c:	int3
   140001f2d:	int3
   140001f2e:	int3
   140001f2f:	int3
   140001f30:	rex push rbx
   140001f32:	sub    rsp,0x20
   140001f36:	cmp    QWORD PTR [rip+0x326a],0xffffffffffffffff        # 0x1400051a8
   140001f3e:	mov    rbx,rcx
   140001f41:	jne    0x140001f4a
   140001f43:	call   0x1400028de
   140001f48:	jmp    0x140001f59
   140001f4a:	mov    rdx,rbx
   140001f4d:	lea    rcx,[rip+0x3254]        # 0x1400051a8
   140001f54:	call   0x1400028d8
   140001f59:	xor    edx,edx
   140001f5b:	test   eax,eax
   140001f5d:	cmove  rdx,rbx
   140001f61:	neg    rdx
   140001f64:	sbb    eax,eax
   140001f66:	neg    eax
   140001f68:	dec    eax
   140001f6a:	add    rsp,0x20
   140001f6e:	pop    rbx
   140001f6f:	ret
   140001f70:	jmp    0x1400028b4
   140001f75:	int3
   140001f76:	int3
   140001f77:	int3
   140001f78:	int3
   140001f79:	int3
   140001f7a:	int3
   140001f7b:	int3
   140001f7c:	int3
   140001f7d:	int3
   140001f7e:	int3
   140001f7f:	int3
   140001f80:	jmp    0x140001f70
   140001f85:	int3
   140001f86:	int3
   140001f87:	int3
   140001f88:	int3
   140001f89:	int3
   140001f8a:	int3
   140001f8b:	int3
   140001f8c:	int3
   140001f8d:	int3
   140001f8e:	int3
   140001f8f:	int3
   140001f90:	rex push rbx
   140001f92:	sub    rsp,0x20
   140001f96:	lea    rax,[rip+0x137b]        # 0x140003318
   140001f9d:	mov    rbx,rcx
   140001fa0:	mov    QWORD PTR [rcx],rax
   140001fa3:	test   dl,0x1
   140001fa6:	je     0x140001fb2
   140001fa8:	mov    edx,0x18
   140001fad:	call   0x140001f80
   140001fb2:	mov    rax,rbx
   140001fb5:	add    rsp,0x20
   140001fb9:	pop    rbx
   140001fba:	ret
   140001fbb:	int3
   140001fbc:	int3
   140001fbd:	int3
   140001fbe:	int3
   140001fbf:	int3
   140001fc0:	rex push rbx
   140001fc2:	sub    rsp,0x20
   140001fc6:	mov    ecx,0x1
   140001fcb:	call   0x1400028f0
   140001fd0:	call   0x140002750
   140001fd5:	mov    ecx,eax
   140001fd7:	call   0x14000291a
   140001fdc:	call   0x1400025b0
   140001fe1:	mov    ebx,eax
   140001fe3:	call   0x140002944
   140001fe8:	mov    ecx,0x1
   140001fed:	mov    DWORD PTR [rax],ebx
   140001fef:	call   0x140001d90
   140001ff4:	test   al,al
   140001ff6:	je     0x14000206b
   140001ff8:	call   0x1400027f0
   140001ffd:	lea    rcx,[rip+0x83c]        # 0x140002840
   140002004:	call   0x140001f30
   140002009:	call   0x140002570
   14000200e:	mov    ecx,eax
   140002010:	call   0x1400028c6
   140002015:	test   eax,eax
   140002017:	jne    0x14000206b
   140002019:	call   0x140002760
   14000201e:	call   0x1400027c0
   140002023:	test   eax,eax
   140002025:	je     0x140002033
   140002027:	lea    rcx,[rip+0x582]        # 0x1400025b0
   14000202e:	call   0x1400028f6
   140002033:	call   0x140002250
   140002038:	call   0x140002250
   14000203d:	call   0x1400025b0
   140002042:	mov    ecx,eax
   140002044:	call   0x140002938
   140002049:	call   0x140002770
   14000204e:	test   al,al
   140002050:	je     0x140002057
   140002052:	call   0x1400028cc
   140002057:	call   0x1400025b0
   14000205c:	call   0x1400025a0
   140002061:	test   eax,eax
   140002063:	jne    0x14000206b
   140002065:	add    rsp,0x20
   140002069:	pop    rbx
   14000206a:	ret
   14000206b:	mov    ecx,0x7
   140002070:	call   0x140002590
   140002075:	int3
   140002076:	int3
   140002077:	int3
   140002078:	int3
   140002079:	int3
   14000207a:	int3
   14000207b:	int3
   14000207c:	int3
   14000207d:	int3
   14000207e:	int3
   14000207f:	int3
   140002080:	sub    rsp,0x28
   140002084:	call   0x1400027a0
   140002089:	xor    eax,eax
   14000208b:	add    rsp,0x28
   14000208f:	ret
   140002090:	sub    rsp,0x28
   140002094:	call   0x140002620
   140002099:	call   0x1400025b0
   14000209e:	mov    ecx,eax
   1400020a0:	add    rsp,0x28
   1400020a4:	jmp    0x14000293e
   1400020a9:	int3
   1400020aa:	int3
   1400020ab:	int3
   1400020ac:	int3
   1400020ad:	int3
   1400020ae:	int3
   1400020af:	int3
   1400020b0:	mov    QWORD PTR [rsp+0x8],rbx
   1400020b5:	mov    QWORD PTR [rsp+0x10],rsi
   1400020ba:	push   rdi
   1400020bb:	sub    rsp,0x30
   1400020bf:	mov    ecx,0x1
   1400020c4:	call   0x140001d50
   1400020c9:	test   al,al
   1400020cb:	je     0x14000220a
   1400020d1:	xor    sil,sil
   1400020d4:	mov    BYTE PTR [rsp+0x20],sil
   1400020d9:	call   0x140001d00
   1400020de:	movzx  ebx,al
   1400020e1:	mov    ecx,DWORD PTR [rip+0x30a9]        # 0x140005190
   1400020e7:	cmp    ecx,0x1
   1400020ea:	je     0x140002215
   1400020f0:	test   ecx,ecx
   1400020f2:	jne    0x14000213e
   1400020f4:	mov    DWORD PTR [rip+0x3092],0x1        # 0x140005190
   1400020fe:	lea    rdx,[rip+0x11d3]        # 0x1400032d8
   140002105:	lea    rcx,[rip+0x11b4]        # 0x1400032c0
   14000210c:	call   0x140002908
   140002111:	test   eax,eax
   140002113:	je     0x14000211f
   140002115:	mov    eax,0xff
   14000211a:	jmp    0x1400021fa
   14000211f:	lea    rdx,[rip+0x1192]        # 0x1400032b8
   140002126:	lea    rcx,[rip+0x116b]        # 0x140003298
   14000212d:	call   0x140002902
   140002132:	mov    DWORD PTR [rip+0x3054],0x2        # 0x140005190
   14000213c:	jmp    0x140002146
   14000213e:	mov    sil,0x1
   140002141:	mov    BYTE PTR [rsp+0x20],sil
   140002146:	movzx  ecx,bl
   140002149:	call   0x140001ed0
   14000214e:	call   0x1400027d0
   140002153:	mov    rbx,rax
   140002156:	cmp    QWORD PTR [rax],0x0
   14000215a:	je     0x14000217b
   14000215c:	mov    rcx,rax
   14000215f:	call   0x140001e30
   140002164:	test   al,al
   140002166:	je     0x14000217b
   140002168:	xor    r8d,r8d
   14000216b:	mov    edx,0x2
   140002170:	xor    ecx,ecx
   140002172:	mov    rax,QWORD PTR [rbx]
   140002175:	call   QWORD PTR [rip+0x10f5]        # 0x140003270
   14000217b:	call   0x1400027e0
   140002180:	mov    rbx,rax
   140002183:	cmp    QWORD PTR [rax],0x0
   140002187:	je     0x14000219d
   140002189:	mov    rcx,rax
   14000218c:	call   0x140001e30
   140002191:	test   al,al
   140002193:	je     0x14000219d
   140002195:	mov    rcx,QWORD PTR [rbx]
   140002198:	call   0x140002932
   14000219d:	call   0x1400028fc
   1400021a2:	mov    rdi,rax
   1400021a5:	call   0x140002926
   1400021aa:	mov    rbx,QWORD PTR [rax]
   1400021ad:	call   0x140002920
   1400021b2:	mov    r8,rdi
   1400021b5:	mov    rdx,rbx
   1400021b8:	mov    ecx,DWORD PTR [rax]
   1400021ba:	call   0x140001300
   1400021bf:	mov    ebx,eax
   1400021c1:	call   0x1400025c0
   1400021c6:	test   al,al
   1400021c8:	je     0x14000221f
   1400021ca:	test   sil,sil
   1400021cd:	jne    0x1400021d4
   1400021cf:	call   0x1400028e4
   1400021d4:	xor    edx,edx
   1400021d6:	mov    cl,0x1
   1400021d8:	call   0x140001f00
   1400021dd:	mov    eax,ebx
   1400021df:	jmp    0x1400021fa
   1400021e1:	mov    ebx,eax
   1400021e3:	call   0x1400025c0
   1400021e8:	test   al,al
   1400021ea:	je     0x140002227
   1400021ec:	cmp    BYTE PTR [rsp+0x20],0x0
   1400021f1:	jne    0x1400021f8
   1400021f3:	call   0x14000292c
   1400021f8:	mov    eax,ebx
   1400021fa:	mov    rbx,QWORD PTR [rsp+0x40]
   1400021ff:	mov    rsi,QWORD PTR [rsp+0x48]
   140002204:	add    rsp,0x30
   140002208:	pop    rdi
   140002209:	ret
   14000220a:	mov    ecx,0x7
   14000220f:	call   0x140002590
   140002214:	nop
   140002215:	mov    ecx,0x7
   14000221a:	call   0x140002590
   14000221f:	mov    ecx,ebx
   140002221:	call   0x14000290e
   140002226:	nop
   140002227:	mov    ecx,ebx
   140002229:	call   0x140002914
   14000222e:	nop
   14000222f:	int3
   140002230:	sub    rsp,0x28
   140002234:	call   0x140002690
   140002239:	add    rsp,0x28
   14000223d:	jmp    0x1400020b0
   140002242:	int3
   140002243:	int3
   140002244:	int3
   140002245:	int3
   140002246:	int3
   140002247:	int3
   140002248:	int3
   140002249:	int3
   14000224a:	int3
   14000224b:	int3
   14000224c:	int3
   14000224d:	int3
   14000224e:	int3
   14000224f:	int3
   140002250:	ret    0x0
   140002253:	int3
   140002254:	int3
   140002255:	int3
   140002256:	int3
   140002257:	int3
   140002258:	int3
   140002259:	int3
   14000225a:	int3
   14000225b:	int3
   14000225c:	int3
   14000225d:	int3
   14000225e:	int3
   14000225f:	int3
   140002260:	mov    ecx,0x2
   140002265:	int    0x29
   140002267:	ret
   140002268:	int3
   140002269:	int3
   14000226a:	int3
   14000226b:	int3
   14000226c:	int3
   14000226d:	int3
   14000226e:	int3
   14000226f:	int3
   140002270:	lea    rax,[rip+0x10d9]        # 0x140003350
   140002277:	mov    QWORD PTR [rcx+0x10],0x0
   14000227f:	mov    QWORD PTR [rcx+0x8],rax
   140002283:	lea    rax,[rip+0x10b6]        # 0x140003340
   14000228a:	mov    QWORD PTR [rcx],rax
   14000228d:	mov    rax,rcx
   140002290:	ret
   140002291:	int3
   140002292:	int3
   140002293:	int3
   140002294:	int3
   140002295:	int3
   140002296:	int3
   140002297:	int3
   140002298:	int3
   140002299:	int3
   14000229a:	int3
   14000229b:	int3
   14000229c:	int3
   14000229d:	int3
   14000229e:	int3
   14000229f:	int3
   1400022a0:	sub    rsp,0x48
   1400022a4:	lea    rcx,[rsp+0x20]
   1400022a9:	call   0x140002270
   1400022ae:	lea    rdx,[rip+0x1d4b]        # 0x140004000
   1400022b5:	lea    rcx,[rsp+0x20]
   1400022ba:	call   0x1400028a2
   1400022bf:	int3
   1400022c0:	rex push rsi
   1400022c2:	push   rdi
   1400022c3:	push   r14
   1400022c5:	sub    rsp,0x10
   1400022c9:	xor    ecx,ecx
   1400022cb:	mov    QWORD PTR [rsp+0x38],rbx
   1400022d0:	xor    eax,eax
   1400022d2:	cpuid
   1400022d4:	xor    ecx,0x6c65746e
   1400022da:	xor    edx,0x49656e69
   1400022e0:	or     edx,ecx
   1400022e2:	xor    ebx,0x756e6547
   1400022e8:	mov    r11d,eax
   1400022eb:	or     edx,ebx
   1400022ed:	mov    eax,0x1
   1400022f2:	mov    ecx,0x0
   1400022f7:	cpuid
   1400022f9:	mov    edi,ecx
   1400022fb:	jne    0x14000235b
   1400022fd:	and    eax,0xfff3ff0
   140002302:	mov    QWORD PTR [rip+0x2d83],0x8000        # 0x140005090
   14000230d:	mov    QWORD PTR [rip+0x2d80],0xffffffffffffffff        # 0x140005098
   140002318:	cmp    eax,0x106c0
   14000231d:	je     0x140002347
   14000231f:	cmp    eax,0x20660
   140002324:	je     0x140002347
   140002326:	cmp    eax,0x20670
   14000232b:	je     0x140002347
   14000232d:	add    eax,0xfffcf9b0
   140002332:	cmp    eax,0x20
   140002335:	ja     0x14000235b
   140002337:	movabs rcx,0x100010001
   140002341:	bt     rcx,rax
   140002345:	jae    0x14000235b
   140002347:	mov    r8d,DWORD PTR [rip+0x2e8a]        # 0x1400051d8
   14000234e:	or     r8d,0x1
   140002352:	mov    DWORD PTR [rip+0x2e7f],r8d        # 0x1400051d8
   140002359:	jmp    0x140002362
   14000235b:	mov    r8d,DWORD PTR [rip+0x2e76]        # 0x1400051d8
   140002362:	xor    r10d,r10d
   140002365:	mov    QWORD PTR [rsp+0x40],rbp
   14000236a:	xor    r14d,r14d
   14000236d:	xor    esi,esi
   14000236f:	cmp    r11d,0x7
   140002373:	jl     0x1400023cd
   140002375:	xor    ecx,ecx
   140002377:	mov    eax,0x7
   14000237c:	cpuid
   14000237e:	mov    ebp,edx
   140002380:	mov    r9d,ebx
   140002383:	bt     ebx,0x9
   140002387:	jae    0x140002394
   140002389:	or     r8d,0x2
   14000238d:	mov    DWORD PTR [rip+0x2e44],r8d        # 0x1400051d8
   140002394:	cmp    eax,0x1
   140002397:	jl     0x1400023a8
   140002399:	mov    eax,0x7
   14000239e:	mov    ecx,0x1
   1400023a3:	cpuid
   1400023a5:	mov    r10d,edx
   1400023a8:	cmp    r11d,0x24
   1400023ac:	jl     0x1400023ba
   1400023ae:	mov    eax,0x24
   1400023b3:	xor    ecx,ecx
   1400023b5:	cpuid
   1400023b7:	mov    r14d,ebx
   1400023ba:	cmp    r11d,0x29
   1400023be:	jl     0x1400023d2
   1400023c0:	mov    eax,0x29
   1400023c5:	xor    ecx,ecx
   1400023c7:	cpuid
   1400023c9:	mov    esi,ebx
   1400023cb:	jmp    0x1400023d2
   1400023cd:	xor    r9d,r9d
   1400023d0:	xor    ebp,ebp
   1400023d2:	mov    rax,QWORD PTR [rip+0x2cc7]        # 0x1400050a0
   1400023d9:	mov    rbx,QWORD PTR [rsp+0x38]
   1400023de:	and    rax,0xfffffffffffffffe
   1400023e2:	mov    DWORD PTR [rip+0x2c9c],0x1        # 0x140005088
   1400023ec:	mov    DWORD PTR [rip+0x2c96],0x2        # 0x14000508c
   1400023f6:	mov    QWORD PTR [rip+0x2ca3],rax        # 0x1400050a0
   1400023fd:	bt     edi,0x14
   140002401:	jae    0x140002422
   140002403:	and    rax,0xffffffffffffffef
   140002407:	mov    DWORD PTR [rip+0x2c77],0x2        # 0x140005088
   140002411:	mov    QWORD PTR [rip+0x2c88],rax        # 0x1400050a0
   140002418:	mov    DWORD PTR [rip+0x2c6a],0x6        # 0x14000508c
   140002422:	bt     edi,0x1b
   140002426:	jae    0x140002558
   14000242c:	xor    ecx,ecx
   14000242e:	xgetbv
   140002431:	shl    rdx,0x20
   140002435:	or     rdx,rax
   140002438:	mov    QWORD PTR [rsp+0x30],rdx
   14000243d:	bt     edi,0x1c
   140002441:	jae    0x140002534
   140002447:	mov    rax,QWORD PTR [rsp+0x30]
   14000244c:	and    al,0x6
   14000244e:	cmp    al,0x6
   140002450:	jne    0x140002534
   140002456:	mov    eax,DWORD PTR [rip+0x2c30]        # 0x14000508c
   14000245c:	or     eax,0x8
   14000245f:	mov    DWORD PTR [rip+0x2c1f],0x3        # 0x140005088
   140002469:	mov    DWORD PTR [rip+0x2c1d],eax        # 0x14000508c
   14000246f:	test   r9b,0x20
   140002473:	je     0x1400024da
   140002475:	or     eax,0x20
   140002478:	mov    DWORD PTR [rip+0x2c06],0x5        # 0x140005088
   140002482:	mov    DWORD PTR [rip+0x2c04],eax        # 0x14000508c
   140002488:	and    r9d,0xd0030000
   14000248f:	mov    rax,QWORD PTR [rip+0x2c0a]        # 0x1400050a0
   140002496:	and    rax,0xfffffffffffffffd
   14000249a:	mov    QWORD PTR [rip+0x2bff],rax        # 0x1400050a0
   1400024a1:	cmp    r9d,0xd0030000
   1400024a8:	jne    0x1400024e1
   1400024aa:	mov    rax,QWORD PTR [rsp+0x30]
   1400024af:	and    al,0xe0
   1400024b1:	cmp    al,0xe0
   1400024b3:	jne    0x1400024da
   1400024b5:	mov    rax,QWORD PTR [rip+0x2be4]        # 0x1400050a0
   1400024bc:	or     DWORD PTR [rip+0x2bc9],0x40        # 0x14000508c
   1400024c3:	and    rax,0xffffffffffffffdb
   1400024c7:	mov    DWORD PTR [rip+0x2bb7],0x6        # 0x140005088
   1400024d1:	mov    QWORD PTR [rip+0x2bc8],rax        # 0x1400050a0
   1400024d8:	jmp    0x1400024e1
   1400024da:	mov    rax,QWORD PTR [rip+0x2bbf]        # 0x1400050a0
   1400024e1:	bt     ebp,0x17
   1400024e5:	jae    0x1400024f3
   1400024e7:	btr    rax,0x18
   1400024ec:	mov    QWORD PTR [rip+0x2bad],rax        # 0x1400050a0
   1400024f3:	bt     r10d,0x13
   1400024f8:	jae    0x140002534
   1400024fa:	mov    rax,QWORD PTR [rsp+0x30]
   1400024ff:	and    al,0xe0
   140002501:	cmp    al,0xe0
   140002503:	jne    0x140002534
   140002505:	mov    rcx,QWORD PTR [rip+0x2b94]        # 0x1400050a0
   14000250c:	and    rcx,0xfffffffffeffffd0
   140002513:	movzx  eax,r14b
   140002517:	mov    DWORD PTR [rip+0x2cbf],eax        # 0x1400051dc
   14000251d:	mov    QWORD PTR [rip+0x2b7c],rcx        # 0x1400050a0
   140002524:	cmp    eax,0x1
   140002527:	jbe    0x140002534
   140002529:	and    rcx,0xffffffffffffffbf
   14000252d:	mov    QWORD PTR [rip+0x2b6c],rcx        # 0x1400050a0
   140002534:	bt     r10d,0x15
   140002539:	jae    0x140002558
   14000253b:	test   sil,0x1
   14000253f:	je     0x140002558
   140002541:	mov    rax,QWORD PTR [rsp+0x30]
   140002546:	bt     rax,0x13
   14000254b:	jae    0x140002558
   14000254d:	and    QWORD PTR [rip+0x2b48],0xffffffffffffff7f        # 0x1400050a0
   140002558:	mov    rbp,QWORD PTR [rsp+0x40]
   14000255d:	xor    eax,eax
   14000255f:	add    rsp,0x10
   140002563:	pop    r14
   140002565:	pop    rdi
   140002566:	pop    rsi
   140002567:	ret
   140002568:	int3
   140002569:	int3
   14000256a:	int3
   14000256b:	int3
   14000256c:	int3
   14000256d:	int3
   14000256e:	int3
   14000256f:	int3
   140002570:	mov    eax,0x1
   140002575:	ret
   140002576:	int3
   140002577:	int3
   140002578:	int3
   140002579:	int3
   14000257a:	int3
   14000257b:	int3
   14000257c:	int3
   14000257d:	int3
   14000257e:	int3
   14000257f:	int3
   140002580:	xor    eax,eax
   140002582:	cmp    DWORD PTR [rip+0x2b28],eax        # 0x1400050b0
   140002588:	setne  al
   14000258b:	ret
   14000258c:	int3
   14000258d:	int3
   14000258e:	int3
   14000258f:	int3
   140002590:	mov    ecx,ecx
   140002592:	int    0x29
   140002594:	ret
   140002595:	int3
   140002596:	int3
   140002597:	int3
   140002598:	int3
   140002599:	int3
   14000259a:	int3
   14000259b:	int3
   14000259c:	int3
   14000259d:	int3
   14000259e:	int3
   14000259f:	int3
   1400025a0:	jmp    0x1400025b0
   1400025a5:	int3
   1400025a6:	int3
   1400025a7:	int3
   1400025a8:	int3
   1400025a9:	int3
   1400025aa:	int3
   1400025ab:	int3
   1400025ac:	int3
   1400025ad:	int3
   1400025ae:	int3
   1400025af:	int3
   1400025b0:	xor    eax,eax
   1400025b2:	ret
   1400025b3:	int3
   1400025b4:	int3
   1400025b5:	int3
   1400025b6:	int3
   1400025b7:	int3
   1400025b8:	int3
   1400025b9:	int3
   1400025ba:	int3
   1400025bb:	int3
   1400025bc:	int3
   1400025bd:	int3
   1400025be:	int3
   1400025bf:	int3
   1400025c0:	sub    rsp,0x28
   1400025c4:	xor    ecx,ecx
   1400025c6:	call   QWORD PTR [rip+0xa5c]        # 0x140003028
   1400025cc:	test   rax,rax
   1400025cf:	je     0x14000260e
   1400025d1:	mov    ecx,0x5a4d
   1400025d6:	cmp    WORD PTR [rax],cx
   1400025d9:	jne    0x14000260e
   1400025db:	movsxd rcx,DWORD PTR [rax+0x3c]
   1400025df:	cmp    DWORD PTR [rcx+rax*1],0x4550
   1400025e6:	jne    0x14000260e
   1400025e8:	mov    edx,0x20b
   1400025ed:	cmp    WORD PTR [rcx+rax*1+0x18],dx
   1400025f2:	jne    0x14000260e
   1400025f4:	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   1400025fc:	jbe    0x14000260e
   1400025fe:	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   140002606:	setne  al
   140002609:	add    rsp,0x28
   14000260d:	ret
   14000260e:	xor    al,al
   140002610:	add    rsp,0x28
   140002614:	ret
   140002615:	int3
   140002616:	int3
   140002617:	int3
   140002618:	int3
   140002619:	int3
   14000261a:	int3
   14000261b:	int3
   14000261c:	int3
   14000261d:	int3
   14000261e:	int3
   14000261f:	int3
   140002620:	lea    rcx,[rip+0x9]        # 0x140002630
   140002627:	rex.W jmp QWORD PTR [rip+0xa02]        # 0x140003030
   14000262e:	int3
   14000262f:	int3
   140002630:	mov    QWORD PTR [rsp+0x8],rbx
   140002635:	push   rdi
   140002636:	sub    rsp,0x20
   14000263a:	mov    rbx,QWORD PTR [rcx]
   14000263d:	mov    rdi,rcx
   140002640:	cmp    DWORD PTR [rbx],0xe06d7363
   140002646:	jne    0x140002664
   140002648:	cmp    DWORD PTR [rbx+0x18],0x4
   14000264c:	jne    0x140002664
   14000264e:	mov    edx,DWORD PTR [rbx+0x20]
   140002651:	lea    eax,[rdx-0x19930520]
   140002657:	cmp    eax,0x2
   14000265a:	jbe    0x140002671
   14000265c:	cmp    edx,0x1994000
   140002662:	je     0x140002671
   140002664:	mov    rbx,QWORD PTR [rsp+0x30]
   140002669:	xor    eax,eax
   14000266b:	add    rsp,0x20
   14000266f:	pop    rdi
   140002670:	ret
   140002671:	call   0x1400028a8
   140002676:	mov    QWORD PTR [rax],rbx
   140002679:	mov    rbx,QWORD PTR [rdi+0x8]
   14000267d:	call   0x1400028ae
   140002682:	mov    QWORD PTR [rax],rbx
   140002685:	call   0x14000294a
   14000268a:	int3
   14000268b:	int3
   14000268c:	int3
   14000268d:	int3
   14000268e:	int3
   14000268f:	int3
   140002690:	rex push rbx
   140002692:	sub    rsp,0x30
   140002696:	mov    rax,QWORD PTR [rip+0x29a3]        # 0x140005040
   14000269d:	movabs rbx,0x2b992ddfa232
   1400026a7:	cmp    rax,rbx
   1400026aa:	je     0x1400026bc
   1400026ac:	not    rax
   1400026af:	mov    QWORD PTR [rip+0x29ca],rax        # 0x140005080
   1400026b6:	add    rsp,0x30
   1400026ba:	pop    rbx
   1400026bb:	ret
   1400026bc:	lea    rcx,[rsp+0x40]
   1400026c1:	mov    QWORD PTR [rsp+0x40],0x0
   1400026ca:	call   QWORD PTR [rip+0x938]        # 0x140003008
   1400026d0:	mov    rax,QWORD PTR [rsp+0x40]
   1400026d5:	mov    QWORD PTR [rsp+0x20],rax
   1400026da:	call   QWORD PTR [rip+0x930]        # 0x140003010
   1400026e0:	mov    eax,eax
   1400026e2:	xor    QWORD PTR [rsp+0x20],rax
   1400026e7:	call   QWORD PTR [rip+0x92b]        # 0x140003018
   1400026ed:	mov    eax,eax
   1400026ef:	lea    rcx,[rsp+0x48]
   1400026f4:	xor    QWORD PTR [rsp+0x20],rax
   1400026f9:	call   QWORD PTR [rip+0x921]        # 0x140003020
   1400026ff:	mov    rax,QWORD PTR [rsp+0x48]
   140002704:	mov    ecx,eax
   140002706:	shl    rcx,0x20
   14000270a:	xor    rcx,rax
   14000270d:	lea    rax,[rsp+0x20]
   140002712:	xor    rcx,QWORD PTR [rsp+0x20]
   140002717:	xor    rcx,rax
   14000271a:	movabs rax,0xffffffffffff
   140002724:	and    rcx,rax
   140002727:	movabs rax,0x2b992ddfa233
   140002731:	cmp    rcx,rbx
   140002734:	cmove  rcx,rax
   140002738:	mov    QWORD PTR [rip+0x2901],rcx        # 0x140005040
   14000273f:	not    rcx
   140002742:	mov    QWORD PTR [rip+0x2937],rcx        # 0x140005080
   140002749:	add    rsp,0x30
   14000274d:	pop    rbx
   14000274e:	ret
   14000274f:	int3
   140002750:	mov    eax,0x4000
   140002755:	ret
   140002756:	int3
   140002757:	int3
   140002758:	int3
   140002759:	int3
   14000275a:	int3
   14000275b:	int3
   14000275c:	int3
   14000275d:	int3
   14000275e:	int3
   14000275f:	int3
   140002760:	lea    rcx,[rip+0x2a89]        # 0x1400051f0
   140002767:	rex.W jmp QWORD PTR [rip+0x892]        # 0x140003000
   14000276e:	int3
   14000276f:	int3
   140002770:	mov    al,0x1
   140002772:	ret
   140002773:	int3
   140002774:	int3
   140002775:	int3
   140002776:	int3
   140002777:	int3
   140002778:	int3
   140002779:	int3
   14000277a:	int3
   14000277b:	int3
   14000277c:	int3
   14000277d:	int3
   14000277e:	int3
   14000277f:	int3
   140002780:	lea    rax,[rip+0x2a79]        # 0x140005200
   140002787:	ret
   140002788:	int3
   140002789:	int3
   14000278a:	int3
   14000278b:	int3
   14000278c:	int3
   14000278d:	int3
   14000278e:	int3
   14000278f:	int3
   140002790:	lea    rax,[rip+0x2a71]        # 0x140005208
   140002797:	ret
   140002798:	int3
   140002799:	int3
   14000279a:	int3
   14000279b:	int3
   14000279c:	int3
   14000279d:	int3
   14000279e:	int3
   14000279f:	int3
   1400027a0:	sub    rsp,0x28
   1400027a4:	call   0x140002780
   1400027a9:	or     QWORD PTR [rax],0x24
   1400027ad:	call   0x140002790
   1400027b2:	or     QWORD PTR [rax],0x2
   1400027b6:	add    rsp,0x28
   1400027ba:	ret
   1400027bb:	int3
   1400027bc:	int3
   1400027bd:	int3
   1400027be:	int3
   1400027bf:	int3
   1400027c0:	xor    eax,eax
   1400027c2:	cmp    DWORD PTR [rip+0x28e0],eax        # 0x1400050a8
   1400027c8:	sete   al
   1400027cb:	ret
   1400027cc:	int3
   1400027cd:	int3
   1400027ce:	int3
   1400027cf:	int3
   1400027d0:	lea    rax,[rip+0x2a61]        # 0x140005238
   1400027d7:	ret
   1400027d8:	int3
   1400027d9:	int3
   1400027da:	int3
   1400027db:	int3
   1400027dc:	int3
   1400027dd:	int3
   1400027de:	int3
   1400027df:	int3
   1400027e0:	lea    rax,[rip+0x2a49]        # 0x140005230
   1400027e7:	ret
   1400027e8:	int3
   1400027e9:	int3
   1400027ea:	int3
   1400027eb:	int3
   1400027ec:	int3
   1400027ed:	int3
   1400027ee:	int3
   1400027ef:	int3
   1400027f0:	mov    QWORD PTR [rsp+0x8],rbx
   1400027f5:	push   rdi
   1400027f6:	sub    rsp,0x20
   1400027fa:	lea    rbx,[rip+0x14f7]        # 0x140003cf8
   140002801:	lea    rdi,[rip+0x14f0]        # 0x140003cf8
   140002808:	cmp    rbx,rdi
   14000280b:	jae    0x140002827
   14000280d:	nop    DWORD PTR [rax]
   140002810:	mov    rax,QWORD PTR [rbx]
   140002813:	test   rax,rax
   140002816:	je     0x14000281e
   140002818:	call   QWORD PTR [rip+0xa52]        # 0x140003270
   14000281e:	add    rbx,0x8
   140002822:	cmp    rbx,rdi
   140002825:	jb     0x140002810
   140002827:	mov    rbx,QWORD PTR [rsp+0x30]
   14000282c:	add    rsp,0x20
   140002830:	pop    rdi
   140002831:	ret
   140002832:	int3
   140002833:	int3
   140002834:	int3
   140002835:	int3
   140002836:	int3
   140002837:	int3
   140002838:	int3
   140002839:	int3
   14000283a:	int3
   14000283b:	int3
   14000283c:	int3
   14000283d:	int3
   14000283e:	int3
   14000283f:	int3
   140002840:	mov    QWORD PTR [rsp+0x8],rbx
   140002845:	push   rdi
   140002846:	sub    rsp,0x20
   14000284a:	lea    rbx,[rip+0x14b7]        # 0x140003d08
   140002851:	lea    rdi,[rip+0x14b0]        # 0x140003d08
   140002858:	cmp    rbx,rdi
   14000285b:	jae    0x140002877
   14000285d:	nop    DWORD PTR [rax]
   140002860:	mov    rax,QWORD PTR [rbx]
   140002863:	test   rax,rax
   140002866:	je     0x14000286e
   140002868:	call   QWORD PTR [rip+0xa02]        # 0x140003270
   14000286e:	add    rbx,0x8
   140002872:	cmp    rbx,rdi
   140002875:	jb     0x140002860
   140002877:	mov    rbx,QWORD PTR [rsp+0x30]
   14000287c:	add    rsp,0x20
   140002880:	pop    rdi
   140002881:	ret
   140002882:	int3
   140002883:	int3
   140002884:	int3
   140002885:	int3
   140002886:	int3
   140002887:	int3
   140002888:	int3
   140002889:	int3
   14000288a:	int3
   14000288b:	int3
   14000288c:	int3
   14000288d:	int3
   14000288e:	int3
   14000288f:	int3
   140002890:	jmp    QWORD PTR [rip+0x8b2]        # 0x140003148
   140002896:	jmp    QWORD PTR [rip+0x874]        # 0x140003110
   14000289c:	jmp    QWORD PTR [rip+0x876]        # 0x140003118
   1400028a2:	jmp    QWORD PTR [rip+0x888]        # 0x140003130
   1400028a8:	jmp    QWORD PTR [rip+0x87a]        # 0x140003128
   1400028ae:	jmp    QWORD PTR [rip+0x884]        # 0x140003138
   1400028b4:	jmp    QWORD PTR [rip+0x89e]        # 0x140003158
   1400028ba:	jmp    QWORD PTR [rip+0x8a0]        # 0x140003160
   1400028c0:	jmp    QWORD PTR [rip+0x8a2]        # 0x140003168
   1400028c6:	jmp    QWORD PTR [rip+0x90c]        # 0x1400031d8
   1400028cc:	jmp    QWORD PTR [rip+0x92e]        # 0x140003200
   1400028d2:	jmp    QWORD PTR [rip+0x950]        # 0x140003228
   1400028d8:	jmp    QWORD PTR [rip+0x912]        # 0x1400031f0
   1400028de:	jmp    QWORD PTR [rip+0x93c]        # 0x140003220
   1400028e4:	jmp    QWORD PTR [rip+0x92e]        # 0x140003218
   1400028ea:	jmp    QWORD PTR [rip+0x920]        # 0x140003210
   1400028f0:	jmp    QWORD PTR [rip+0x8da]        # 0x1400031d0
   1400028f6:	jmp    QWORD PTR [rip+0x894]        # 0x140003190
   1400028fc:	jmp    QWORD PTR [rip+0x8e6]        # 0x1400031e8
   140002902:	jmp    QWORD PTR [rip+0x8c0]        # 0x1400031c8
   140002908:	jmp    QWORD PTR [rip+0x8b2]        # 0x1400031c0
   14000290e:	jmp    QWORD PTR [rip+0x8e4]        # 0x1400031f8
   140002914:	jmp    QWORD PTR [rip+0x886]        # 0x1400031a0
   14000291a:	jmp    QWORD PTR [rip+0x920]        # 0x140003240
   140002920:	jmp    QWORD PTR [rip+0x882]        # 0x1400031a8
   140002926:	jmp    QWORD PTR [rip+0x884]        # 0x1400031b0
   14000292c:	jmp    QWORD PTR [rip+0x886]        # 0x1400031b8
   140002932:	jmp    QWORD PTR [rip+0x8d0]        # 0x140003208
   140002938:	jmp    QWORD PTR [rip+0x842]        # 0x140003180
   14000293e:	jmp    QWORD PTR [rip+0x82c]        # 0x140003170
   140002944:	jmp    QWORD PTR [rip+0x8ee]        # 0x140003238
   14000294a:	jmp    QWORD PTR [rip+0x890]        # 0x1400031e0
   140002950:	mov    QWORD PTR [rsp+0x18],rsi
   140002955:	push   rdi
   140002956:	sub    rsp,0x20
   14000295a:	movsxd rsi,DWORD PTR [r8]
   14000295d:	mov    rdi,rcx
   140002960:	test   sil,0x4
   140002964:	je     0x14000297b
   140002966:	mov    eax,DWORD PTR [r8+0x8]
   14000296a:	movsxd r10,DWORD PTR [r8+0x4]
   14000296e:	neg    eax
   140002970:	movsxd r8,eax
   140002973:	add    r10,rcx
   140002976:	and    r10,r8
   140002979:	jmp    0x14000297e
   14000297b:	mov    r10,rdi
   14000297e:	mov    rax,QWORD PTR [rdx+0x10]
   140002982:	mov    QWORD PTR [rsp+0x30],rbx
   140002987:	mov    QWORD PTR [rsp+0x38],rbp
   14000298c:	mov    r8d,DWORD PTR [rax+0x8]
   140002990:	add    r8,QWORD PTR [rdx+0x8]
   140002994:	movzx  eax,BYTE PTR [r8]
   140002998:	movzx  ecx,BYTE PTR [r8+0x3]
   14000299d:	and    al,0x7
   14000299f:	cmp    al,0x3
   1400029a1:	jae    0x1400029b0
   1400029a3:	test   cl,0xf
   1400029a6:	je     0x1400029bb
   1400029a8:	mov    r9d,ecx
   1400029ab:	jmp    0x140002aad
   1400029b0:	mov    r11d,ecx
   1400029b3:	mov    edx,ecx
   1400029b5:	and    r11d,0x1f
   1400029b9:	jne    0x1400029c3
   1400029bb:	xor    r9d,r9d
   1400029be:	jmp    0x140002ab1
   1400029c3:	add    r8,0x4
   1400029c7:	mov    eax,r11d
   1400029ca:	xor    r9d,r9d
   1400029cd:	shr    edx,0x5
   1400029d0:	add    r8,rax
   1400029d3:	mov    ecx,r9d
   1400029d6:	test   edx,edx
   1400029d8:	je     0x1400029fc
   1400029da:	nop    WORD PTR [rax+rax*1+0x0]
   1400029e0:	movzx  eax,BYTE PTR [r8]
   1400029e4:	add    r8,0x3
   1400029e8:	shr    eax,0x3
   1400029eb:	test   eax,eax
   1400029ed:	je     0x1400029f6
   1400029ef:	add    r8,0x3
   1400029f3:	add    r8,rax
   1400029f6:	inc    ecx
   1400029f8:	cmp    ecx,edx
   1400029fa:	jb     0x1400029e0
   1400029fc:	mov    ebx,r9d
   1400029ff:	test   r11d,r11d
   140002a02:	je     0x140002ab1
   140002a08:	lea    rbp,[rip+0xffffffffffffd5f1]        # 0x140000000
   140002a0f:	nop
   140002a10:	movzx  eax,BYTE PTR [r8]
   140002a14:	movzx  edx,al
   140002a17:	cmp    al,0x3
   140002a19:	jbe    0x140002a34
   140002a1b:	and    dl,0xf
   140002a1e:	lea    ecx,[rdx-0x8]
   140002a21:	cmp    cl,0x2
   140002a24:	jbe    0x140002a34
   140002a26:	movzx  edx,al
   140002a29:	and    dl,0x7
   140002a2c:	lea    ecx,[rdx-0x4]
   140002a2f:	cmp    cl,0x3
   140002a32:	ja     0x140002a58
   140002a34:	test   dl,dl
   140002a36:	je     0x140002aa8
   140002a38:	cmp    al,0x3
   140002a3a:	jbe    0x140002a67
   140002a3c:	movzx  edx,al
   140002a3f:	and    dl,0xf
   140002a42:	lea    ecx,[rdx-0x8]
   140002a45:	cmp    cl,0x2
   140002a48:	jbe    0x140002a60
   140002a4a:	movzx  edx,al
   140002a4d:	and    dl,0x7
   140002a50:	lea    ecx,[rdx-0x4]
   140002a53:	cmp    cl,0x3
   140002a56:	jbe    0x140002a60
   140002a58:	and    al,0x3f
   140002a5a:	cmp    al,0x20
   140002a5c:	jne    0x140002ad9
   140002a5e:	jmp    0x140002a67
   140002a60:	movzx  eax,dl
   140002a63:	cmp    al,0x20
   140002a65:	ja     0x140002ad9
   140002a67:	movzx  eax,al
   140002a6a:	movzx  eax,BYTE PTR [rax+rbp*1+0x2af4]
   140002a72:	mov    ecx,DWORD PTR [rbp+rax*4+0x2ae0]
   140002a79:	add    rcx,rbp
   140002a7c:	jmp    rcx
   140002a7e:	mov    eax,0x1
   140002a83:	jmp    0x140002a98
   140002a85:	mov    eax,0x2
   140002a8a:	jmp    0x140002a98
   140002a8c:	mov    eax,0x3
   140002a91:	jmp    0x140002a98
   140002a93:	mov    eax,0x5
   140002a98:	add    r8,rax
   140002a9b:	inc    ebx
   140002a9d:	cmp    ebx,r11d
   140002aa0:	jb     0x140002a10
   140002aa6:	jmp    0x140002ab1
   140002aa8:	movzx  r9d,BYTE PTR [r8+0x1]
   140002aad:	and    r9,0xfffffffffffffff0
   140002ab1:	lea    rcx,[r9+rdi*1]
   140002ab5:	mov    rax,rsi
   140002ab8:	and    rax,0xfffffffffffffff8
   140002abc:	xor    rcx,QWORD PTR [rax+r10*1]
   140002ac0:	mov    rbp,QWORD PTR [rsp+0x38]
   140002ac5:	mov    rbx,QWORD PTR [rsp+0x30]
   140002aca:	mov    rsi,QWORD PTR [rsp+0x40]
   140002acf:	add    rsp,0x20
   140002ad3:	pop    rdi
   140002ad4:	jmp    0x140001c90
   140002ad9:	call   0x140002260
   140002ade:	int3
   140002adf:	nop
   140002ae0:	test   DWORD PTR [rdx],ebp
   140002ae2:	add    BYTE PTR [rax],al
   140002ae4:	xchg   ebx,eax
   140002ae5:	sub    al,BYTE PTR [rax]
   140002ae7:	add    BYTE PTR [rdx+rbp*1+0x2a7e0000],cl
   140002aee:	add    BYTE PTR [rax],al
   140002af0:	fldcw  WORD PTR [rdx]
   140002af2:	add    BYTE PTR [rax],al
   140002af4:	add    BYTE PTR [rcx],al
   140002af6:	add    al,BYTE PTR [rax]
   140002af8:	add    eax,DWORD PTR [rcx]
   140002afa:	add    al,BYTE PTR [rbx]
   140002afc:	add    eax,DWORD PTR [rcx]
   140002afe:	add    al,BYTE PTR [rsp+rax*1]
   140002b01:	add    al,0x4
   140002b03:	add    al,0x4
   140002b05:	add    al,0x4
   140002b07:	add    al,0x4
   140002b09:	add    al,0x4
   140002b0b:	add    al,0x4
   140002b0d:	add    al,0x4
   140002b0f:	add    al,0x4
   140002b11:	add    al,0x4
   140002b13:	add    al,0x0
   140002b15:	int3
   140002b16:	int3
   140002b17:	int3
   140002b18:	int3
   140002b19:	int3
   140002b1a:	int3
   140002b1b:	int3
   140002b1c:	int3
   140002b1d:	int3
   140002b1e:	int3
   140002b1f:	int3
   140002b20:	rex push rbx
   140002b22:	push   rbp
   140002b23:	push   rsi
   140002b24:	push   rdi
   140002b25:	push   r14
   140002b27:	sub    rsp,0x20
   140002b2b:	mov    rbx,QWORD PTR [r9+0x38]
   140002b2f:	mov    rsi,rdx
   140002b32:	mov    r14,r8
   140002b35:	mov    rbp,rcx
   140002b38:	mov    rdx,r9
   140002b3b:	mov    rcx,rsi
   140002b3e:	mov    rdi,r9
   140002b41:	lea    r8,[rbx+0x4]
   140002b45:	call   0x140002950
   140002b4a:	test   BYTE PTR [rbp+0x4],0x66
   140002b4e:	mov    eax,0x0
   140002b53:	setne  al
   140002b56:	inc    eax
   140002b58:	test   DWORD PTR [rbx+0x4],eax
   140002b5b:	je     0x140002b78
   140002b5d:	mov    r9,rdi
   140002b60:	mov    r8,r14
   140002b63:	mov    rdx,rsi
   140002b66:	mov    rcx,rbp
   140002b69:	add    rsp,0x20
   140002b6d:	pop    r14
   140002b6f:	pop    rdi
   140002b70:	pop    rsi
   140002b71:	pop    rbp
   140002b72:	pop    rbx
   140002b73:	jmp    0x140002890
   140002b78:	mov    eax,0x1
   140002b7d:	add    rsp,0x20
   140002b81:	pop    r14
   140002b83:	pop    rdi
   140002b84:	pop    rsi
   140002b85:	pop    rbp
   140002b86:	pop    rbx
   140002b87:	ret
   140002b88:	jmp    QWORD PTR [rip+0x592]        # 0x140003120
   140002b8e:	jmp    QWORD PTR [rip+0x6bc]        # 0x140003250
   140002b94:	int3
   140002b95:	int3
   140002b96:	int3
   140002b97:	int3
   140002b98:	int3
   140002b99:	int3
   140002b9a:	int3
   140002b9b:	int3
   140002b9c:	int3
   140002b9d:	int3
   140002b9e:	int3
   140002b9f:	int3
   140002ba0:	int3
   140002ba1:	int3
   140002ba2:	int3
   140002ba3:	int3
   140002ba4:	int3
   140002ba5:	int3
   140002ba6:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002bb0:	jmp    rax
   140002bb2:	int3
   140002bb3:	int3
   140002bb4:	int3
   140002bb5:	int3
   140002bb6:	int3
   140002bb7:	int3
   140002bb8:	int3
   140002bb9:	int3
   140002bba:	int3
   140002bbb:	int3
   140002bbc:	int3
   140002bbd:	int3
   140002bbe:	int3
   140002bbf:	int3
   140002bc0:	int3
   140002bc1:	int3
   140002bc2:	int3
   140002bc3:	int3
   140002bc4:	int3
   140002bc5:	int3
   140002bc6:	data16 nop WORD PTR [rax+rax*1+0x0]
   140002bd0:	jmp    QWORD PTR [rip+0x69a]        # 0x140003270
   140002bd6:	int3
   140002bd7:	int3
   140002bd8:	int3
   140002bd9:	int3
   140002bda:	int3
   140002bdb:	int3
   140002bdc:	int3
   140002bdd:	int3
   140002bde:	int3
   140002bdf:	int3
   140002be0:	lea    rcx,[rdx+0x20]
   140002be7:	jmp    0x140001990
   140002bec:	int3
   140002bed:	int3
   140002bee:	int3
   140002bef:	int3
   140002bf0:	lea    rcx,[rdx+0x28]
   140002bf7:	rex.W jmp QWORD PTR [rip+0x4f2]        # 0x1400030f0
   140002bfe:	lea    rcx,[rdx+0x30]
   140002c05:	jmp    0x140001aa0
   140002c0a:	int3
   140002c0b:	int3
   140002c0c:	int3
   140002c0d:	int3
   140002c0e:	int3
   140002c0f:	int3
   140002c10:	lea    rcx,[rdx+0x20]
   140002c17:	jmp    0x140001a30
   140002c1c:	lea    rcx,[rdx+0x20]
   140002c23:	jmp    0x140001a60
   140002c28:	mov    QWORD PTR [rsp+0x10],rdx
   140002c2d:	push   rbp
   140002c2e:	sub    rsp,0x20
   140002c32:	mov    rbp,rdx
   140002c35:	mov    rdx,QWORD PTR [rbp+0x60]
   140002c39:	mov    rax,QWORD PTR [rdx]
   140002c3c:	movsxd rcx,DWORD PTR [rax+0x4]
   140002c40:	add    rcx,rdx
   140002c43:	mov    r8b,0x1
   140002c46:	mov    edx,0x4
   140002c4b:	call   QWORD PTR [rip+0x40f]        # 0x140003060
   140002c51:	nop
   140002c52:	movabs rax,0x0
   140002c5c:	add    rsp,0x20
   140002c60:	pop    rbp
   140002c61:	ret
   140002c62:	int3
   140002c63:	int3
   140002c64:	int3
   140002c65:	int3
   140002c66:	int3
   140002c67:	int3
   140002c68:	int3
   140002c69:	int3
   140002c6a:	int3
   140002c6b:	int3
   140002c6c:	int3
   140002c6d:	int3
   140002c6e:	int3
   140002c6f:	int3
   140002c70:	lea    rcx,[rdx+0x30]
   140002c77:	jmp    0x140001a30
   140002c7c:	lea    rcx,[rdx+0x30]
   140002c83:	jmp    0x140001a00
   140002c88:	lea    rcx,[rdx+0x40]
   140002c8f:	jmp    0x1400012d0
   140002c94:	mov    QWORD PTR [rsp+0x10],rdx
   140002c99:	push   rbp
   140002c9a:	sub    rsp,0x20
   140002c9e:	mov    rbp,rdx
   140002ca1:	mov    rdx,QWORD PTR [rbp+0x28]
   140002ca5:	mov    rax,QWORD PTR [rdx]
   140002ca8:	movsxd rcx,DWORD PTR [rax+0x4]
   140002cac:	add    rcx,rdx
   140002caf:	mov    r8b,0x1
   140002cb2:	mov    edx,0x4
   140002cb7:	call   QWORD PTR [rip+0x3a3]        # 0x140003060
   140002cbd:	nop
   140002cbe:	movabs rax,0x0
   140002cc8:	add    rsp,0x20
   140002ccc:	pop    rbp
   140002ccd:	ret
   140002cce:	int3
   140002ccf:	int3
   140002cd0:	rex push rbp
   140002cd2:	mov    rbp,rdx
   140002cd5:	mov    rax,QWORD PTR [rcx]
   140002cd8:	xor    ecx,ecx
   140002cda:	cmp    DWORD PTR [rax],0xc0000005
   140002ce0:	sete   cl
   140002ce3:	mov    eax,ecx
   140002ce5:	pop    rbp
   140002ce6:	ret
   140002ce7:	int3
   140002ce8:	int3
   140002ce9:	int3
   140002cea:	int3
   140002ceb:	int3
   140002cec:	int3
   140002ced:	int3
   140002cee:	int3
   140002cef:	int3
   140002cf0:	rex push rbp
   140002cf2:	sub    rsp,0x20
   140002cf6:	mov    rbp,rdx
   140002cf9:	mov    rdx,rcx
   140002cfc:	mov    rcx,QWORD PTR [rcx]
   140002cff:	mov    ecx,DWORD PTR [rcx]
   140002d01:	call   0x1400028ea
   140002d06:	nop
   140002d07:	add    rsp,0x20
   140002d0b:	pop    rbp
   140002d0c:	ret
   140002d0d:	int3
   140002d0e:	int3
   140002d0f:	int3
   140002d10:	sub    rsp,0x28
   140002d14:	mov    rax,QWORD PTR [rip+0x24fd]        # 0x140005218
   140002d1b:	test   rax,rax
   140002d1e:	je     0x140002d6f
   140002d20:	mov    rdx,QWORD PTR [rip+0x2501]        # 0x140005228
   140002d27:	sub    rdx,rax
   140002d2a:	cmp    rdx,0x1000
   140002d31:	jb     0x140002d51
   140002d33:	mov    rcx,QWORD PTR [rax-0x8]
   140002d37:	sub    rax,rcx
   140002d3a:	sub    rax,0x8
   140002d3e:	cmp    rax,0x1f
   140002d42:	ja     0x140002d4a
   140002d44:	add    rdx,0x27
   140002d48:	jmp    0x140002d54
   140002d4a:	mov    ecx,0x5
   140002d4f:	int    0x29
   140002d51:	mov    rcx,rax
   140002d54:	call   0x140001f80
   140002d59:	xorps  xmm0,xmm0
   140002d5c:	mov    QWORD PTR [rip+0x24c1],0x0        # 0x140005228
   140002d67:	movdqu XMMWORD PTR [rip+0x24a9],xmm0        # 0x140005218
   140002d6f:	add    rsp,0x28
   140002d73:	ret
   140002d74:	int3
   140002d75:	int3
   140002d76:	int3
   140002d77:	int3
   140002d78:	int3
   140002d79:	int3
   140002d7a:	int3
   140002d7b:	int3
   140002d7c:	int3
   140002d7d:	int3
   140002d7e:	int3
   140002d7f:	int3
   140002d80:	rex push rbx
   140002d82:	sub    rsp,0x20
   140002d86:	mov    rbx,QWORD PTR [rip+0x23f3]        # 0x140005180
   140002d8d:	test   rbx,rbx
   140002d90:	je     0x140002ddb
   140002d92:	mov    rax,QWORD PTR [rbx]
   140002d95:	mov    rcx,QWORD PTR [rbx+0x8]
   140002d99:	mov    QWORD PTR [rip+0x23e0],rax        # 0x140005180
   140002da0:	mov    rax,QWORD PTR [rcx]
   140002da3:	mov    rax,QWORD PTR [rax+0x10]
   140002da7:	call   QWORD PTR [rip+0x4c3]        # 0x140003270
   140002dad:	mov    rcx,rax
   140002db0:	test   rax,rax
   140002db3:	je     0x140002dc6
   140002db5:	mov    rdx,QWORD PTR [rax]
   140002db8:	mov    rax,QWORD PTR [rdx]
   140002dbb:	mov    edx,0x1
   140002dc0:	call   QWORD PTR [rip+0x4aa]        # 0x140003270
   140002dc6:	mov    rcx,rbx
   140002dc9:	call   QWORD PTR [rip+0x389]        # 0x140003158
   140002dcf:	mov    rbx,QWORD PTR [rip+0x23aa]        # 0x140005180
   140002dd6:	test   rbx,rbx
   140002dd9:	jne    0x140002d92
   140002ddb:	add    rsp,0x20
   140002ddf:	pop    rbx
   140002de0:	ret
