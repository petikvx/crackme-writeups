
crackme6.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	40 53                	rex push rbx
   140001002:	48 83 ec 20          	sub    rsp,0x20
   140001006:	48 8b d9             	mov    rbx,rcx
   140001009:	48 8b c2             	mov    rax,rdx
   14000100c:	48 8d 0d 15 23 00 00 	lea    rcx,[rip+0x2315]        # 0x140003328
   140001013:	0f 57 c0             	xorps  xmm0,xmm0
   140001016:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000101a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000101d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001021:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001024:	ff 15 1e 21 00 00    	call   QWORD PTR [rip+0x211e]        # 0x140003148
   14000102a:	48 8b c3             	mov    rax,rbx
   14000102d:	48 83 c4 20          	add    rsp,0x20
   140001031:	5b                   	pop    rbx
   140001032:	c3                   	ret
   140001033:	cc                   	int3
   140001034:	cc                   	int3
   140001035:	cc                   	int3
   140001036:	cc                   	int3
   140001037:	cc                   	int3
   140001038:	cc                   	int3
   140001039:	cc                   	int3
   14000103a:	cc                   	int3
   14000103b:	cc                   	int3
   14000103c:	cc                   	int3
   14000103d:	cc                   	int3
   14000103e:	cc                   	int3
   14000103f:	cc                   	int3
   140001040:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   140001044:	48 8d 05 45 23 00 00 	lea    rax,[rip+0x2345]        # 0x140003390
   14000104b:	48 85 d2             	test   rdx,rdx
   14000104e:	48 0f 45 c2          	cmovne rax,rdx
   140001052:	c3                   	ret
   140001053:	cc                   	int3
   140001054:	cc                   	int3
   140001055:	cc                   	int3
   140001056:	cc                   	int3
   140001057:	cc                   	int3
   140001058:	cc                   	int3
   140001059:	cc                   	int3
   14000105a:	cc                   	int3
   14000105b:	cc                   	int3
   14000105c:	cc                   	int3
   14000105d:	cc                   	int3
   14000105e:	cc                   	int3
   14000105f:	cc                   	int3
   140001060:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140001065:	57                   	push   rdi
   140001066:	48 83 ec 20          	sub    rsp,0x20
   14000106a:	48 8d 05 b7 22 00 00 	lea    rax,[rip+0x22b7]        # 0x140003328
   140001071:	48 8b f9             	mov    rdi,rcx
   140001074:	48 89 01             	mov    QWORD PTR [rcx],rax
   140001077:	8b da                	mov    ebx,edx
   140001079:	48 83 c1 08          	add    rcx,0x8
   14000107d:	ff 15 ad 20 00 00    	call   QWORD PTR [rip+0x20ad]        # 0x140003130
   140001083:	f6 c3 01             	test   bl,0x1
   140001086:	74 0d                	je     0x140001095
   140001088:	ba 18 00 00 00       	mov    edx,0x18
   14000108d:	48 8b cf             	mov    rcx,rdi
   140001090:	e8 97 0b 00 00       	call   0x140001c2c
   140001095:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000109a:	48 8b c7             	mov    rax,rdi
   14000109d:	48 83 c4 20          	add    rsp,0x20
   1400010a1:	5f                   	pop    rdi
   1400010a2:	c3                   	ret
   1400010a3:	cc                   	int3
   1400010a4:	cc                   	int3
   1400010a5:	cc                   	int3
   1400010a6:	cc                   	int3
   1400010a7:	cc                   	int3
   1400010a8:	cc                   	int3
   1400010a9:	cc                   	int3
   1400010aa:	cc                   	int3
   1400010ab:	cc                   	int3
   1400010ac:	cc                   	int3
   1400010ad:	cc                   	int3
   1400010ae:	cc                   	int3
   1400010af:	cc                   	int3
   1400010b0:	48 8d 05 71 22 00 00 	lea    rax,[rip+0x2271]        # 0x140003328
   1400010b7:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010ba:	48 83 c1 08          	add    rcx,0x8
   1400010be:	48 ff 25 6b 20 00 00 	rex.W jmp QWORD PTR [rip+0x206b]        # 0x140003130
   1400010c5:	cc                   	int3
   1400010c6:	cc                   	int3
   1400010c7:	cc                   	int3
   1400010c8:	cc                   	int3
   1400010c9:	cc                   	int3
   1400010ca:	cc                   	int3
   1400010cb:	cc                   	int3
   1400010cc:	cc                   	int3
   1400010cd:	cc                   	int3
   1400010ce:	cc                   	int3
   1400010cf:	cc                   	int3
   1400010d0:	48 8d 05 d1 22 00 00 	lea    rax,[rip+0x22d1]        # 0x1400033a8
   1400010d7:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   1400010de:	00 
   1400010df:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   1400010e3:	48 8d 05 7e 22 00 00 	lea    rax,[rip+0x227e]        # 0x140003368
   1400010ea:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010ed:	48 8b c1             	mov    rax,rcx
   1400010f0:	c3                   	ret
   1400010f1:	cc                   	int3
   1400010f2:	cc                   	int3
   1400010f3:	cc                   	int3
   1400010f4:	cc                   	int3
   1400010f5:	cc                   	int3
   1400010f6:	cc                   	int3
   1400010f7:	cc                   	int3
   1400010f8:	cc                   	int3
   1400010f9:	cc                   	int3
   1400010fa:	cc                   	int3
   1400010fb:	cc                   	int3
   1400010fc:	cc                   	int3
   1400010fd:	cc                   	int3
   1400010fe:	cc                   	int3
   1400010ff:	cc                   	int3
   140001100:	48 83 ec 48          	sub    rsp,0x48
   140001104:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001109:	e8 c2 ff ff ff       	call   0x1400010d0
   14000110e:	48 8d 15 43 2e 00 00 	lea    rdx,[rip+0x2e43]        # 0x140003f58
   140001115:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000111a:	e8 43 18 00 00       	call   0x140002962
   14000111f:	cc                   	int3
   140001120:	40 53                	rex push rbx
   140001122:	48 83 ec 20          	sub    rsp,0x20
   140001126:	48 8b d9             	mov    rbx,rcx
   140001129:	48 8b c2             	mov    rax,rdx
   14000112c:	48 8d 0d f5 21 00 00 	lea    rcx,[rip+0x21f5]        # 0x140003328
   140001133:	0f 57 c0             	xorps  xmm0,xmm0
   140001136:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000113a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000113d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001141:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001144:	ff 15 fe 1f 00 00    	call   QWORD PTR [rip+0x1ffe]        # 0x140003148
   14000114a:	48 8d 05 17 22 00 00 	lea    rax,[rip+0x2217]        # 0x140003368
   140001151:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001154:	48 8b c3             	mov    rax,rbx
   140001157:	48 83 c4 20          	add    rsp,0x20
   14000115b:	5b                   	pop    rbx
   14000115c:	c3                   	ret
   14000115d:	cc                   	int3
   14000115e:	cc                   	int3
   14000115f:	cc                   	int3
   140001160:	40 53                	rex push rbx
   140001162:	48 83 ec 20          	sub    rsp,0x20
   140001166:	48 8b d9             	mov    rbx,rcx
   140001169:	48 8b c2             	mov    rax,rdx
   14000116c:	48 8d 0d b5 21 00 00 	lea    rcx,[rip+0x21b5]        # 0x140003328
   140001173:	0f 57 c0             	xorps  xmm0,xmm0
   140001176:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000117a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000117d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001181:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001184:	ff 15 be 1f 00 00    	call   QWORD PTR [rip+0x1fbe]        # 0x140003148
   14000118a:	48 8d 05 af 21 00 00 	lea    rax,[rip+0x21af]        # 0x140003340
   140001191:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001194:	48 8b c3             	mov    rax,rbx
   140001197:	48 83 c4 20          	add    rsp,0x20
   14000119b:	5b                   	pop    rbx
   14000119c:	c3                   	ret
   14000119d:	cc                   	int3
   14000119e:	cc                   	int3
   14000119f:	cc                   	int3
   1400011a0:	48 83 ec 28          	sub    rsp,0x28
   1400011a4:	48 8d 0d 15 22 00 00 	lea    rcx,[rip+0x2215]        # 0x1400033c0
   1400011ab:	ff 15 2f 1f 00 00    	call   QWORD PTR [rip+0x1f2f]        # 0x1400030e0
   1400011b1:	cc                   	int3
   1400011b2:	cc                   	int3
   1400011b3:	cc                   	int3
   1400011b4:	cc                   	int3
   1400011b5:	cc                   	int3
   1400011b6:	cc                   	int3
   1400011b7:	cc                   	int3
   1400011b8:	cc                   	int3
   1400011b9:	cc                   	int3
   1400011ba:	cc                   	int3
   1400011bb:	cc                   	int3
   1400011bc:	cc                   	int3
   1400011bd:	cc                   	int3
   1400011be:	cc                   	int3
   1400011bf:	cc                   	int3
   1400011c0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400011c5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   1400011ca:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
   1400011cf:	55                   	push   rbp
   1400011d0:	41 54                	push   r12
   1400011d2:	41 55                	push   r13
   1400011d4:	41 56                	push   r14
   1400011d6:	41 57                	push   r15
   1400011d8:	48 8d 6c 24 c9       	lea    rbp,[rsp-0x37]
   1400011dd:	48 81 ec a0 00 00 00 	sub    rsp,0xa0
   1400011e4:	48 8b 05 15 3e 00 00 	mov    rax,QWORD PTR [rip+0x3e15]        # 0x140005000
   1400011eb:	48 33 c4             	xor    rax,rsp
   1400011ee:	48 89 45 2f          	mov    QWORD PTR [rbp+0x2f],rax
   1400011f2:	0f 57 c0             	xorps  xmm0,xmm0
   1400011f5:	0f 11 45 df          	movups XMMWORD PTR [rbp-0x21],xmm0
   1400011f9:	c7 45 c7 ef 86 10 b0 	mov    DWORD PTR [rbp-0x39],0xb01086ef
   140001200:	c6 45 cb 40          	mov    BYTE PTR [rbp-0x35],0x40
   140001204:	b9 05 00 00 00       	mov    ecx,0x5
   140001209:	e8 e2 09 00 00       	call   0x140001bf0
   14000120e:	48 8b f8             	mov    rdi,rax
   140001211:	48 89 45 df          	mov    QWORD PTR [rbp-0x21],rax
   140001215:	4c 8d 60 05          	lea    r12,[rax+0x5]
   140001219:	4c 89 65 ef          	mov    QWORD PTR [rbp-0x11],r12
   14000121d:	41 b8 05 00 00 00    	mov    r8d,0x5
   140001223:	48 8d 55 c7          	lea    rdx,[rbp-0x39]
   140001227:	48 8b c8             	mov    rcx,rax
   14000122a:	e8 cf 18 00 00       	call   0x140002afe
   14000122f:	4c 89 65 e7          	mov    QWORD PTR [rbp-0x19],r12
   140001233:	48 8d 15 96 21 00 00 	lea    rdx,[rip+0x2196]        # 0x1400033d0
   14000123a:	48 8b 0d 5f 1e 00 00 	mov    rcx,QWORD PTR [rip+0x1e5f]        # 0x1400030a0
   140001241:	e8 ea 02 00 00       	call   0x140001530
   140001246:	0f 57 c0             	xorps  xmm0,xmm0
   140001249:	0f 11 45 0f          	movups XMMWORD PTR [rbp+0xf],xmm0
   14000124d:	66 0f 6f 0d ab 21 00 	movdqa xmm1,XMMWORD PTR [rip+0x21ab]        # 0x140003400
   140001254:	00 
   140001255:	f3 0f 7f 4d 1f       	movdqu XMMWORD PTR [rbp+0x1f],xmm1
   14000125a:	c6 45 0f 00          	mov    BYTE PTR [rbp+0xf],0x0
   14000125e:	48 8b 1d 83 1e 00 00 	mov    rbx,QWORD PTR [rip+0x1e83]        # 0x1400030e8
   140001265:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001268:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000126c:	48 03 cb             	add    rcx,rbx
   14000126f:	b2 0a                	mov    dl,0xa
   140001271:	ff 15 11 1e 00 00    	call   QWORD PTR [rip+0x1e11]        # 0x140003088
   140001277:	44 0f b6 c0          	movzx  r8d,al
   14000127b:	48 8d 55 0f          	lea    rdx,[rbp+0xf]
   14000127f:	48 8b cb             	mov    rcx,rbx
   140001282:	e8 79 05 00 00       	call   0x140001800
   140001287:	0f 57 c0             	xorps  xmm0,xmm0
   14000128a:	0f 11 45 f7          	movups XMMWORD PTR [rbp-0x9],xmm0
   14000128e:	c7 45 cf 01 02 03 04 	mov    DWORD PTR [rbp-0x31],0x4030201
   140001295:	c7 45 d3 01 03 02 01 	mov    DWORD PTR [rbp-0x2d],0x1020301
   14000129c:	c7 45 d7 04 03 01 02 	mov    DWORD PTR [rbp-0x29],0x2010304
   1400012a3:	66 c7 45 db 04 ff    	mov    WORD PTR [rbp-0x25],0xff04
   1400012a9:	b9 0e 00 00 00       	mov    ecx,0xe
   1400012ae:	e8 3d 09 00 00       	call   0x140001bf0
   1400012b3:	48 8b d8             	mov    rbx,rax
   1400012b6:	48 89 45 f7          	mov    QWORD PTR [rbp-0x9],rax
   1400012ba:	4c 8d 78 0e          	lea    r15,[rax+0xe]
   1400012be:	4c 89 7d 07          	mov    QWORD PTR [rbp+0x7],r15
   1400012c2:	41 b8 0e 00 00 00    	mov    r8d,0xe
   1400012c8:	48 8d 55 cf          	lea    rdx,[rbp-0x31]
   1400012cc:	48 8b c8             	mov    rcx,rax
   1400012cf:	e8 2a 18 00 00       	call   0x140002afe
   1400012d4:	4c 89 7d ff          	mov    QWORD PTR [rbp-0x1],r15
   1400012d8:	b8 37 13 00 00       	mov    eax,0x1337
   1400012dd:	45 33 c9             	xor    r9d,r9d
   1400012e0:	45 33 d2             	xor    r10d,r10d
   1400012e3:	4c 8b 6d 27          	mov    r13,QWORD PTR [rbp+0x27]
   1400012e7:	4c 8b 75 0f          	mov    r14,QWORD PTR [rbp+0xf]
   1400012eb:	4c 2b fb             	sub    r15,rbx
   1400012ee:	0f 84 df 00 00 00    	je     0x1400013d3
   1400012f4:	4c 8b 5d 1f          	mov    r11,QWORD PTR [rbp+0x1f]
   1400012f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400012ff:	00 
   140001300:	46 0f b6 04 0b       	movzx  r8d,BYTE PTR [rbx+r9*1]
   140001305:	49 ff c1             	inc    r9
   140001308:	41 8b d0             	mov    edx,r8d
   14000130b:	83 ea 01             	sub    edx,0x1
   14000130e:	74 62                	je     0x140001372
   140001310:	83 ea 01             	sub    edx,0x1
   140001313:	74 58                	je     0x14000136d
   140001315:	83 ea 01             	sub    edx,0x1
   140001318:	74 4c                	je     0x140001366
   14000131a:	83 ea 01             	sub    edx,0x1
   14000131d:	74 38                	je     0x140001357
   14000131f:	81 fa fb 00 00 00    	cmp    edx,0xfb
   140001325:	0f 84 9a 00 00 00    	je     0x1400013c5
   14000132b:	44 89 45 c7          	mov    DWORD PTR [rbp-0x39],r8d
   14000132f:	8b 4d c7             	mov    ecx,DWORD PTR [rbp-0x39]
   140001332:	81 f1 ef be ad de    	xor    ecx,0xdeadbeef
   140001338:	89 4d c7             	mov    DWORD PTR [rbp-0x39],ecx
   14000133b:	8b 4d c7             	mov    ecx,DWORD PTR [rbp-0x39]
   14000133e:	81 c1 34 12 00 00    	add    ecx,0x1234
   140001344:	89 4d c7             	mov    DWORD PTR [rbp-0x39],ecx
   140001347:	8b 55 c7             	mov    edx,DWORD PTR [rbp-0x39]
   14000134a:	c1 ea 03             	shr    edx,0x3
   14000134d:	8b 4d c7             	mov    ecx,DWORD PTR [rbp-0x39]
   140001350:	33 ca                	xor    ecx,edx
   140001352:	89 4d c7             	mov    DWORD PTR [rbp-0x39],ecx
   140001355:	eb 3c                	jmp    0x140001393
   140001357:	8b c8                	mov    ecx,eax
   140001359:	81 f1 78 56 34 12    	xor    ecx,0x12345678
   14000135f:	c1 e9 02             	shr    ecx,0x2
   140001362:	03 c1                	add    eax,ecx
   140001364:	eb 2d                	jmp    0x140001393
   140001366:	35 a5 a5 a5 a5       	xor    eax,0xa5a5a5a5
   14000136b:	eb 26                	jmp    0x140001393
   14000136d:	c1 c8 1d             	ror    eax,0x1d
   140001370:	eb 21                	jmp    0x140001393
   140001372:	4d 3b d3             	cmp    r10,r11
   140001375:	73 1c                	jae    0x140001393
   140001377:	48 8d 4d 0f          	lea    rcx,[rbp+0xf]
   14000137b:	49 83 fd 0f          	cmp    r13,0xf
   14000137f:	49 0f 47 ce          	cmova  rcx,r14
   140001383:	42 0f be 0c 11       	movsx  ecx,BYTE PTR [rcx+r10*1]
   140001388:	83 f1 55             	xor    ecx,0x55
   14000138b:	6b c9 07             	imul   ecx,ecx,0x7
   14000138e:	03 c1                	add    eax,ecx
   140001390:	49 ff c2             	inc    r10
   140001393:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   140001396:	8b 4d c7             	mov    ecx,DWORD PTR [rbp-0x39]
   140001399:	81 f1 ef be ad de    	xor    ecx,0xdeadbeef
   14000139f:	89 4d c7             	mov    DWORD PTR [rbp-0x39],ecx
   1400013a2:	8b 4d c7             	mov    ecx,DWORD PTR [rbp-0x39]
   1400013a5:	81 c1 34 12 00 00    	add    ecx,0x1234
   1400013ab:	89 4d c7             	mov    DWORD PTR [rbp-0x39],ecx
   1400013ae:	8b 55 c7             	mov    edx,DWORD PTR [rbp-0x39]
   1400013b1:	c1 ea 03             	shr    edx,0x3
   1400013b4:	8b 4d c7             	mov    ecx,DWORD PTR [rbp-0x39]
   1400013b7:	33 ca                	xor    ecx,edx
   1400013b9:	89 4d c7             	mov    DWORD PTR [rbp-0x39],ecx
   1400013bc:	4d 3b cf             	cmp    r9,r15
   1400013bf:	0f 82 3b ff ff ff    	jb     0x140001300
   1400013c5:	3d 21 9b 3a 6f       	cmp    eax,0x6f3a9b21
   1400013ca:	48 8d 15 17 20 00 00 	lea    rdx,[rip+0x2017]        # 0x1400033e8
   1400013d1:	74 07                	je     0x1400013da
   1400013d3:	48 8d 15 1a 20 00 00 	lea    rdx,[rip+0x201a]        # 0x1400033f4
   1400013da:	48 8b 0d bf 1c 00 00 	mov    rcx,QWORD PTR [rip+0x1cbf]        # 0x1400030a0
   1400013e1:	e8 4a 01 00 00       	call   0x140001530
   1400013e6:	c7 45 c7 00 00 00 00 	mov    DWORD PTR [rbp-0x39],0x0
   1400013ed:	33 c9                	xor    ecx,ecx
   1400013ef:	90                   	nop
   1400013f0:	8b 45 c7             	mov    eax,DWORD PTR [rbp-0x39]
   1400013f3:	33 c1                	xor    eax,ecx
   1400013f5:	35 ad de 00 00       	xor    eax,0xdead
   1400013fa:	89 45 c7             	mov    DWORD PTR [rbp-0x39],eax
   1400013fd:	81 c1 39 05 00 00    	add    ecx,0x539
   140001403:	81 f9 44 0a 02 00    	cmp    ecx,0x20a44
   140001409:	7c e5                	jl     0x1400013f0
   14000140b:	8b 75 c7             	mov    esi,DWORD PTR [rbp-0x39]
   14000140e:	83 e6 01             	and    esi,0x1
   140001411:	48 85 db             	test   rbx,rbx
   140001414:	74 2f                	je     0x140001445
   140001416:	49 81 ff 00 10 00 00 	cmp    r15,0x1000
   14000141d:	72 1a                	jb     0x140001439
   14000141f:	41 bf 35 00 00 00    	mov    r15d,0x35
   140001425:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   140001429:	48 2b d8             	sub    rbx,rax
   14000142c:	48 83 eb 08          	sub    rbx,0x8
   140001430:	48 83 fb 1f          	cmp    rbx,0x1f
   140001434:	77 54                	ja     0x14000148a
   140001436:	48 8b d8             	mov    rbx,rax
   140001439:	49 8b d7             	mov    rdx,r15
   14000143c:	48 8b cb             	mov    rcx,rbx
   14000143f:	e8 e8 07 00 00       	call   0x140001c2c
   140001444:	90                   	nop
   140001445:	49 83 fd 0f          	cmp    r13,0xf
   140001449:	76 62                	jbe    0x1400014ad
   14000144b:	49 8d 55 01          	lea    rdx,[r13+0x1]
   14000144f:	49 8b c6             	mov    rax,r14
   140001452:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001459:	72 49                	jb     0x1400014a4
   14000145b:	48 83 c2 27          	add    rdx,0x27
   14000145f:	4d 8b 76 f8          	mov    r14,QWORD PTR [r14-0x8]
   140001463:	49 2b c6             	sub    rax,r14
   140001466:	48 83 e8 08          	sub    rax,0x8
   14000146a:	48 83 f8 1f          	cmp    rax,0x1f
   14000146e:	76 34                	jbe    0x1400014a4
   140001470:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   140001477:	00 00 
   140001479:	45 33 c9             	xor    r9d,r9d
   14000147c:	45 33 c0             	xor    r8d,r8d
   14000147f:	33 d2                	xor    edx,edx
   140001481:	33 c9                	xor    ecx,ecx
   140001483:	ff 15 57 1d 00 00    	call   QWORD PTR [rip+0x1d57]        # 0x1400031e0
   140001489:	90                   	nop
   14000148a:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   140001491:	00 00 
   140001493:	45 33 c9             	xor    r9d,r9d
   140001496:	45 33 c0             	xor    r8d,r8d
   140001499:	33 d2                	xor    edx,edx
   14000149b:	33 c9                	xor    ecx,ecx
   14000149d:	ff 15 3d 1d 00 00    	call   QWORD PTR [rip+0x1d3d]        # 0x1400031e0
   1400014a3:	90                   	nop
   1400014a4:	49 8b ce             	mov    rcx,r14
   1400014a7:	e8 80 07 00 00       	call   0x140001c2c
   1400014ac:	90                   	nop
   1400014ad:	48 85 ff             	test   rdi,rdi
   1400014b0:	74 2f                	je     0x1400014e1
   1400014b2:	4c 2b e7             	sub    r12,rdi
   1400014b5:	49 81 fc 00 10 00 00 	cmp    r12,0x1000
   1400014bc:	72 18                	jb     0x1400014d6
   1400014be:	49 83 c4 27          	add    r12,0x27
   1400014c2:	48 8b 47 f8          	mov    rax,QWORD PTR [rdi-0x8]
   1400014c6:	48 2b f8             	sub    rdi,rax
   1400014c9:	48 83 ef 08          	sub    rdi,0x8
   1400014cd:	48 83 ff 1f          	cmp    rdi,0x1f
   1400014d1:	77 3d                	ja     0x140001510
   1400014d3:	48 8b f8             	mov    rdi,rax
   1400014d6:	49 8b d4             	mov    rdx,r12
   1400014d9:	48 8b cf             	mov    rcx,rdi
   1400014dc:	e8 4b 07 00 00       	call   0x140001c2c
   1400014e1:	8b c6                	mov    eax,esi
   1400014e3:	48 8b 4d 2f          	mov    rcx,QWORD PTR [rbp+0x2f]
   1400014e7:	48 33 cc             	xor    rcx,rsp
   1400014ea:	e8 e1 06 00 00       	call   0x140001bd0
   1400014ef:	4c 8d 9c 24 a0 00 00 	lea    r11,[rsp+0xa0]
   1400014f6:	00 
   1400014f7:	49 8b 5b 30          	mov    rbx,QWORD PTR [r11+0x30]
   1400014fb:	49 8b 73 38          	mov    rsi,QWORD PTR [r11+0x38]
   1400014ff:	49 8b 7b 40          	mov    rdi,QWORD PTR [r11+0x40]
   140001503:	49 8b e3             	mov    rsp,r11
   140001506:	41 5f                	pop    r15
   140001508:	41 5e                	pop    r14
   14000150a:	41 5d                	pop    r13
   14000150c:	41 5c                	pop    r12
   14000150e:	5d                   	pop    rbp
   14000150f:	c3                   	ret
   140001510:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   140001517:	00 00 
   140001519:	45 33 c9             	xor    r9d,r9d
   14000151c:	45 33 c0             	xor    r8d,r8d
   14000151f:	33 d2                	xor    edx,edx
   140001521:	33 c9                	xor    ecx,ecx
   140001523:	ff 15 b7 1c 00 00    	call   QWORD PTR [rip+0x1cb7]        # 0x1400031e0
   140001529:	cc                   	int3
   14000152a:	cc                   	int3
   14000152b:	cc                   	int3
   14000152c:	cc                   	int3
   14000152d:	cc                   	int3
   14000152e:	cc                   	int3
   14000152f:	cc                   	int3
   140001530:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140001535:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   14000153a:	56                   	push   rsi
   14000153b:	57                   	push   rdi
   14000153c:	41 54                	push   r12
   14000153e:	41 56                	push   r14
   140001540:	41 57                	push   r15
   140001542:	48 83 ec 30          	sub    rsp,0x30
   140001546:	4c 8b e2             	mov    r12,rdx
   140001549:	48 8b f1             	mov    rsi,rcx
   14000154c:	33 db                	xor    ebx,ebx
   14000154e:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   140001552:	49 c7 c6 ff ff ff ff 	mov    r14,0xffffffffffffffff
   140001559:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001560:	49 ff c6             	inc    r14
   140001563:	42 38 1c 32          	cmp    BYTE PTR [rdx+r14*1],bl
   140001567:	75 f7                	jne    0x140001560
   140001569:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000156c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001570:	48 8b 7c 31 28       	mov    rdi,QWORD PTR [rcx+rsi*1+0x28]
   140001575:	48 85 ff             	test   rdi,rdi
   140001578:	7e 0a                	jle    0x140001584
   14000157a:	49 3b fe             	cmp    rdi,r14
   14000157d:	7e 05                	jle    0x140001584
   14000157f:	49 2b fe             	sub    rdi,r14
   140001582:	eb 02                	jmp    0x140001586
   140001584:	33 ff                	xor    edi,edi
   140001586:	4c 8b fe             	mov    r15,rsi
   140001589:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000158e:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001593:	48 85 c9             	test   rcx,rcx
   140001596:	74 07                	je     0x14000159f
   140001598:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000159b:	ff 50 08             	call   QWORD PTR [rax+0x8]
   14000159e:	90                   	nop
   14000159f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400015a2:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400015a6:	48 03 ce             	add    rcx,rsi
   1400015a9:	ff 15 e1 1a 00 00    	call   QWORD PTR [rip+0x1ae1]        # 0x140003090
   1400015af:	84 c0                	test   al,al
   1400015b1:	75 06                	jne    0x1400015b9
   1400015b3:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   1400015b7:	eb 39                	jmp    0x1400015f2
   1400015b9:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400015bc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400015c0:	48 8b 4c 31 50       	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   1400015c5:	48 85 c9             	test   rcx,rcx
   1400015c8:	74 21                	je     0x1400015eb
   1400015ca:	48 3b ce             	cmp    rcx,rsi
   1400015cd:	74 1c                	je     0x1400015eb
   1400015cf:	ff 15 d3 1a 00 00    	call   QWORD PTR [rip+0x1ad3]        # 0x1400030a8
   1400015d5:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400015d8:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400015dc:	48 03 ce             	add    rcx,rsi
   1400015df:	ff 15 ab 1a 00 00    	call   QWORD PTR [rip+0x1aab]        # 0x140003090
   1400015e5:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   1400015e9:	eb 07                	jmp    0x1400015f2
   1400015eb:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1400015f0:	b0 01                	mov    al,0x1
   1400015f2:	84 c0                	test   al,al
   1400015f4:	75 0a                	jne    0x140001600
   1400015f6:	bb 04 00 00 00       	mov    ebx,0x4
   1400015fb:	e9 af 00 00 00       	jmp    0x1400016af
   140001600:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   140001603:	48 63 42 04          	movsxd rax,DWORD PTR [rdx+0x4]
   140001607:	8b 4c 30 18          	mov    ecx,DWORD PTR [rax+rsi*1+0x18]
   14000160b:	81 e1 c0 01 00 00    	and    ecx,0x1c0
   140001611:	83 f9 40             	cmp    ecx,0x40
   140001614:	74 29                	je     0x14000163f
   140001616:	48 85 ff             	test   rdi,rdi
   140001619:	7e 21                	jle    0x14000163c
   14000161b:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   14000161e:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001622:	0f b6 54 31 58       	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001627:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   14000162c:	ff 15 a6 1a 00 00    	call   QWORD PTR [rip+0x1aa6]        # 0x1400030d8
   140001632:	83 f8 ff             	cmp    eax,0xffffffff
   140001635:	74 4f                	je     0x140001686
   140001637:	48 ff cf             	dec    rdi
   14000163a:	eb da                	jmp    0x140001616
   14000163c:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   14000163f:	48 63 4a 04          	movsxd rcx,DWORD PTR [rdx+0x4]
   140001643:	4d 8b c6             	mov    r8,r14
   140001646:	49 8b d4             	mov    rdx,r12
   140001649:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   14000164e:	ff 15 2c 1a 00 00    	call   QWORD PTR [rip+0x1a2c]        # 0x140003080
   140001654:	49 3b c6             	cmp    rax,r14
   140001657:	75 2d                	jne    0x140001686
   140001659:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001660:	48 85 ff             	test   rdi,rdi
   140001663:	7e 2a                	jle    0x14000168f
   140001665:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001668:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000166c:	0f b6 54 31 58       	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001671:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001676:	ff 15 5c 1a 00 00    	call   QWORD PTR [rip+0x1a5c]        # 0x1400030d8
   14000167c:	83 f8 ff             	cmp    eax,0xffffffff
   14000167f:	74 05                	je     0x140001686
   140001681:	48 ff cf             	dec    rdi
   140001684:	eb da                	jmp    0x140001660
   140001686:	bb 04 00 00 00       	mov    ebx,0x4
   14000168b:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   14000168f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001692:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001696:	48 c7 44 31 28 00 00 	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   14000169d:	00 00 
   14000169f:	eb 0e                	jmp    0x1400016af
   1400016a1:	48 8b 74 24 60       	mov    rsi,QWORD PTR [rsp+0x60]
   1400016a6:	8b 5c 24 70          	mov    ebx,DWORD PTR [rsp+0x70]
   1400016aa:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
   1400016af:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400016b2:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400016b6:	48 03 ce             	add    rcx,rsi
   1400016b9:	45 33 c0             	xor    r8d,r8d
   1400016bc:	8b d3                	mov    edx,ebx
   1400016be:	ff 15 d4 19 00 00    	call   QWORD PTR [rip+0x19d4]        # 0x140003098
   1400016c4:	90                   	nop
   1400016c5:	ff 15 25 1a 00 00    	call   QWORD PTR [rip+0x1a25]        # 0x1400030f0
   1400016cb:	84 c0                	test   al,al
   1400016cd:	75 0a                	jne    0x1400016d9
   1400016cf:	49 8b cf             	mov    rcx,r15
   1400016d2:	ff 15 d8 19 00 00    	call   QWORD PTR [rip+0x19d8]        # 0x1400030b0
   1400016d8:	90                   	nop
   1400016d9:	49 8b 07             	mov    rax,QWORD PTR [r15]
   1400016dc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400016e0:	4a 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+r15*1+0x48]
   1400016e5:	48 85 c9             	test   rcx,rcx
   1400016e8:	74 07                	je     0x1400016f1
   1400016ea:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400016ed:	ff 50 10             	call   QWORD PTR [rax+0x10]
   1400016f0:	90                   	nop
   1400016f1:	48 8b c6             	mov    rax,rsi
   1400016f4:	48 8b 5c 24 68       	mov    rbx,QWORD PTR [rsp+0x68]
   1400016f9:	48 83 c4 30          	add    rsp,0x30
   1400016fd:	41 5f                	pop    r15
   1400016ff:	41 5e                	pop    r14
   140001701:	41 5c                	pop    r12
   140001703:	5f                   	pop    rdi
   140001704:	5e                   	pop    rsi
   140001705:	c3                   	ret
   140001706:	cc                   	int3
   140001707:	cc                   	int3
   140001708:	cc                   	int3
   140001709:	cc                   	int3
   14000170a:	cc                   	int3
   14000170b:	cc                   	int3
   14000170c:	cc                   	int3
   14000170d:	cc                   	int3
   14000170e:	cc                   	int3
   14000170f:	cc                   	int3
   140001710:	40 53                	rex push rbx
   140001712:	48 83 ec 30          	sub    rsp,0x30
   140001716:	48 8b d9             	mov    rbx,rcx
   140001719:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   14000171c:	48 85 c9             	test   rcx,rcx
   14000171f:	74 3a                	je     0x14000175b
   140001721:	48 8b 53 10          	mov    rdx,QWORD PTR [rbx+0x10]
   140001725:	48 2b d1             	sub    rdx,rcx
   140001728:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14000172f:	72 18                	jb     0x140001749
   140001731:	48 8b 41 f8          	mov    rax,QWORD PTR [rcx-0x8]
   140001735:	48 83 c2 27          	add    rdx,0x27
   140001739:	48 2b c8             	sub    rcx,rax
   14000173c:	48 83 e9 08          	sub    rcx,0x8
   140001740:	48 83 f9 1f          	cmp    rcx,0x1f
   140001744:	77 1b                	ja     0x140001761
   140001746:	48 8b c8             	mov    rcx,rax
   140001749:	e8 de 04 00 00       	call   0x140001c2c
   14000174e:	33 c0                	xor    eax,eax
   140001750:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001753:	48 89 43 08          	mov    QWORD PTR [rbx+0x8],rax
   140001757:	48 89 43 10          	mov    QWORD PTR [rbx+0x10],rax
   14000175b:	48 83 c4 30          	add    rsp,0x30
   14000175f:	5b                   	pop    rbx
   140001760:	c3                   	ret
   140001761:	33 c0                	xor    eax,eax
   140001763:	45 33 c9             	xor    r9d,r9d
   140001766:	45 33 c0             	xor    r8d,r8d
   140001769:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000176e:	33 d2                	xor    edx,edx
   140001770:	33 c9                	xor    ecx,ecx
   140001772:	ff 15 68 1a 00 00    	call   QWORD PTR [rip+0x1a68]        # 0x1400031e0
   140001778:	cc                   	int3
   140001779:	cc                   	int3
   14000177a:	cc                   	int3
   14000177b:	cc                   	int3
   14000177c:	cc                   	int3
   14000177d:	cc                   	int3
   14000177e:	cc                   	int3
   14000177f:	cc                   	int3
   140001780:	40 53                	rex push rbx
   140001782:	48 83 ec 30          	sub    rsp,0x30
   140001786:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   14000178a:	48 8b d9             	mov    rbx,rcx
   14000178d:	48 83 fa 0f          	cmp    rdx,0xf
   140001791:	76 2c                	jbe    0x1400017bf
   140001793:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140001796:	48 ff c2             	inc    rdx
   140001799:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400017a0:	72 18                	jb     0x1400017ba
   1400017a2:	48 8b 41 f8          	mov    rax,QWORD PTR [rcx-0x8]
   1400017a6:	48 83 c2 27          	add    rdx,0x27
   1400017aa:	48 2b c8             	sub    rcx,rax
   1400017ad:	48 83 e9 08          	sub    rcx,0x8
   1400017b1:	48 83 f9 1f          	cmp    rcx,0x1f
   1400017b5:	77 21                	ja     0x1400017d8
   1400017b7:	48 8b c8             	mov    rcx,rax
   1400017ba:	e8 6d 04 00 00       	call   0x140001c2c
   1400017bf:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   1400017c6:	00 
   1400017c7:	48 c7 43 18 0f 00 00 	mov    QWORD PTR [rbx+0x18],0xf
   1400017ce:	00 
   1400017cf:	c6 03 00             	mov    BYTE PTR [rbx],0x0
   1400017d2:	48 83 c4 30          	add    rsp,0x30
   1400017d6:	5b                   	pop    rbx
   1400017d7:	c3                   	ret
   1400017d8:	45 33 c9             	xor    r9d,r9d
   1400017db:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   1400017e2:	00 00 
   1400017e4:	45 33 c0             	xor    r8d,r8d
   1400017e7:	33 d2                	xor    edx,edx
   1400017e9:	33 c9                	xor    ecx,ecx
   1400017eb:	ff 15 ef 19 00 00    	call   QWORD PTR [rip+0x19ef]        # 0x1400031e0
   1400017f1:	cc                   	int3
   1400017f2:	cc                   	int3
   1400017f3:	cc                   	int3
   1400017f4:	cc                   	int3
   1400017f5:	cc                   	int3
   1400017f6:	cc                   	int3
   1400017f7:	cc                   	int3
   1400017f8:	cc                   	int3
   1400017f9:	cc                   	int3
   1400017fa:	cc                   	int3
   1400017fb:	cc                   	int3
   1400017fc:	cc                   	int3
   1400017fd:	cc                   	int3
   1400017fe:	cc                   	int3
   1400017ff:	cc                   	int3
   140001800:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   140001805:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000180a:	57                   	push   rdi
   14000180b:	41 54                	push   r12
   14000180d:	41 55                	push   r13
   14000180f:	41 56                	push   r14
   140001811:	41 57                	push   r15
   140001813:	48 83 ec 40          	sub    rsp,0x40
   140001817:	45 0f b6 f8          	movzx  r15d,r8b
   14000181b:	48 8b f2             	mov    rsi,rdx
   14000181e:	48 8b f9             	mov    rdi,rcx
   140001821:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   140001826:	33 db                	xor    ebx,ebx
   140001828:	89 5c 24 24          	mov    DWORD PTR [rsp+0x24],ebx
   14000182c:	45 32 f6             	xor    r14b,r14b
   14000182f:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001834:	4c 8b e1             	mov    r12,rcx
   140001837:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   14000183c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000183f:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001843:	4a 8b 4c 21 48       	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001848:	48 85 c9             	test   rcx,rcx
   14000184b:	74 07                	je     0x140001854
   14000184d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001850:	ff 50 08             	call   QWORD PTR [rax+0x8]
   140001853:	90                   	nop
   140001854:	b2 01                	mov    dl,0x1
   140001856:	48 8b cf             	mov    rcx,rdi
   140001859:	ff 15 71 18 00 00    	call   QWORD PTR [rip+0x1871]        # 0x1400030d0
   14000185f:	88 44 24 38          	mov    BYTE PTR [rsp+0x38],al
   140001863:	84 c0                	test   al,al
   140001865:	0f 84 e2 00 00 00    	je     0x14000194d
   14000186b:	48 89 5e 10          	mov    QWORD PTR [rsi+0x10],rbx
   14000186f:	48 8b c6             	mov    rax,rsi
   140001872:	48 83 7e 18 0f       	cmp    QWORD PTR [rsi+0x18],0xf
   140001877:	76 03                	jbe    0x14000187c
   140001879:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   14000187c:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14000187f:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001882:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001886:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   14000188b:	ff 15 2f 18 00 00    	call   QWORD PTR [rip+0x182f]        # 0x1400030c0
   140001891:	44 8b c8             	mov    r9d,eax
   140001894:	49 bd ff ff ff ff ff 	movabs r13,0x7fffffffffffffff
   14000189b:	ff ff 7f 
   14000189e:	66 90                	xchg   ax,ax
   1400018a0:	41 83 f9 ff          	cmp    r9d,0xffffffff
   1400018a4:	75 07                	jne    0x1400018ad
   1400018a6:	bb 01 00 00 00       	mov    ebx,0x1
   1400018ab:	eb 2f                	jmp    0x1400018dc
   1400018ad:	45 3b cf             	cmp    r9d,r15d
   1400018b0:	75 1c                	jne    0x1400018ce
   1400018b2:	41 b6 01             	mov    r14b,0x1
   1400018b5:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   1400018ba:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   1400018bd:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400018c1:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400018c6:	ff 15 fc 17 00 00    	call   QWORD PTR [rip+0x17fc]        # 0x1400030c8
   1400018cc:	eb 12                	jmp    0x1400018e0
   1400018ce:	48 8b 4e 10          	mov    rcx,QWORD PTR [rsi+0x10]
   1400018d2:	49 3b cd             	cmp    rcx,r13
   1400018d5:	72 0b                	jb     0x1400018e2
   1400018d7:	bb 02 00 00 00       	mov    ebx,0x2
   1400018dc:	89 5c 24 24          	mov    DWORD PTR [rsp+0x24],ebx
   1400018e0:	eb 66                	jmp    0x140001948
   1400018e2:	48 8b 56 18          	mov    rdx,QWORD PTR [rsi+0x18]
   1400018e6:	48 3b ca             	cmp    rcx,rdx
   1400018e9:	73 1f                	jae    0x14000190a
   1400018eb:	48 8d 41 01          	lea    rax,[rcx+0x1]
   1400018ef:	48 89 46 10          	mov    QWORD PTR [rsi+0x10],rax
   1400018f3:	48 8b c6             	mov    rax,rsi
   1400018f6:	48 83 fa 0f          	cmp    rdx,0xf
   1400018fa:	76 03                	jbe    0x1400018ff
   1400018fc:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400018ff:	44 88 0c 01          	mov    BYTE PTR [rcx+rax*1],r9b
   140001903:	c6 44 01 01 00       	mov    BYTE PTR [rcx+rax*1+0x1],0x0
   140001908:	eb 08                	jmp    0x140001912
   14000190a:	48 8b ce             	mov    rcx,rsi
   14000190d:	e8 8e 00 00 00       	call   0x1400019a0
   140001912:	41 b6 01             	mov    r14b,0x1
   140001915:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   14000191a:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   14000191d:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001921:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   140001926:	ff 15 8c 17 00 00    	call   QWORD PTR [rip+0x178c]        # 0x1400030b8
   14000192c:	44 8b c8             	mov    r9d,eax
   14000192f:	e9 6c ff ff ff       	jmp    0x1400018a0
   140001934:	8b 5c 24 24          	mov    ebx,DWORD PTR [rsp+0x24]
   140001938:	44 0f b6 74 24 20    	movzx  r14d,BYTE PTR [rsp+0x20]
   14000193e:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
   140001943:	48 8b 7c 24 28       	mov    rdi,QWORD PTR [rsp+0x28]
   140001948:	45 84 f6             	test   r14b,r14b
   14000194b:	75 03                	jne    0x140001950
   14000194d:	83 cb 02             	or     ebx,0x2
   140001950:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001953:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001957:	48 03 cf             	add    rcx,rdi
   14000195a:	45 33 c0             	xor    r8d,r8d
   14000195d:	8b d3                	mov    edx,ebx
   14000195f:	ff 15 33 17 00 00    	call   QWORD PTR [rip+0x1733]        # 0x140003098
   140001965:	90                   	nop
   140001966:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
   14000196a:	48 63 51 04          	movsxd rdx,DWORD PTR [rcx+0x4]
   14000196e:	4a 8b 4c 22 48       	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   140001973:	48 85 c9             	test   rcx,rcx
   140001976:	74 07                	je     0x14000197f
   140001978:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   14000197b:	ff 52 10             	call   QWORD PTR [rdx+0x10]
   14000197e:	90                   	nop
   14000197f:	48 8b c7             	mov    rax,rdi
   140001982:	4c 8d 5c 24 40       	lea    r11,[rsp+0x40]
   140001987:	49 8b 5b 40          	mov    rbx,QWORD PTR [r11+0x40]
   14000198b:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   14000198f:	49 8b e3             	mov    rsp,r11
   140001992:	41 5f                	pop    r15
   140001994:	41 5e                	pop    r14
   140001996:	41 5d                	pop    r13
   140001998:	41 5c                	pop    r12
   14000199a:	5f                   	pop    rdi
   14000199b:	c3                   	ret
   14000199c:	cc                   	int3
   14000199d:	cc                   	int3
   14000199e:	cc                   	int3
   14000199f:	cc                   	int3
   1400019a0:	40 53                	rex push rbx
   1400019a2:	55                   	push   rbp
   1400019a3:	56                   	push   rsi
   1400019a4:	41 57                	push   r15
   1400019a6:	48 83 ec 38          	sub    rsp,0x38
   1400019aa:	48 8b 69 10          	mov    rbp,QWORD PTR [rcx+0x10]
   1400019ae:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   1400019b5:	ff ff 7f 
   1400019b8:	48 8b c3             	mov    rax,rbx
   1400019bb:	45 0f b6 f9          	movzx  r15d,r9b
   1400019bf:	48 2b c5             	sub    rax,rbp
   1400019c2:	48 8b f1             	mov    rsi,rcx
   1400019c5:	48 83 f8 01          	cmp    rax,0x1
   1400019c9:	0f 82 39 01 00 00    	jb     0x140001b08
   1400019cf:	48 89 7c 24 68       	mov    QWORD PTR [rsp+0x68],rdi
   1400019d4:	4c 89 64 24 70       	mov    QWORD PTR [rsp+0x70],r12
   1400019d9:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   1400019dd:	49 8b d4             	mov    rdx,r12
   1400019e0:	4c 89 74 24 30       	mov    QWORD PTR [rsp+0x30],r14
   1400019e5:	4c 8b 71 18          	mov    r14,QWORD PTR [rcx+0x18]
   1400019e9:	48 83 ca 0f          	or     rdx,0xf
   1400019ed:	48 3b d3             	cmp    rdx,rbx
   1400019f0:	77 44                	ja     0x140001a36
   1400019f2:	49 8b ce             	mov    rcx,r14
   1400019f5:	48 8b c3             	mov    rax,rbx
   1400019f8:	48 d1 e9             	shr    rcx,1
   1400019fb:	48 2b c1             	sub    rax,rcx
   1400019fe:	4c 3b f0             	cmp    r14,rax
   140001a01:	77 33                	ja     0x140001a36
   140001a03:	49 8d 04 0e          	lea    rax,[r14+rcx*1]
   140001a07:	48 8b da             	mov    rbx,rdx
   140001a0a:	48 3b d0             	cmp    rdx,rax
   140001a0d:	48 0f 42 d8          	cmovb  rbx,rax
   140001a11:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   140001a15:	48 85 c9             	test   rcx,rcx
   140001a18:	75 04                	jne    0x140001a1e
   140001a1a:	33 ff                	xor    edi,edi
   140001a1c:	eb 49                	jmp    0x140001a67
   140001a1e:	48 81 f9 00 10 00 00 	cmp    rcx,0x1000
   140001a25:	72 38                	jb     0x140001a5f
   140001a27:	48 8d 41 27          	lea    rax,[rcx+0x27]
   140001a2b:	48 3b c1             	cmp    rax,rcx
   140001a2e:	0f 86 da 00 00 00    	jbe    0x140001b0e
   140001a34:	eb 0e                	jmp    0x140001a44
   140001a36:	48 b8 00 00 00 00 00 	movabs rax,0x8000000000000000
   140001a3d:	00 00 80 
   140001a40:	48 83 c0 27          	add    rax,0x27
   140001a44:	48 8b c8             	mov    rcx,rax
   140001a47:	e8 a4 01 00 00       	call   0x140001bf0
   140001a4c:	48 85 c0             	test   rax,rax
   140001a4f:	74 6d                	je     0x140001abe
   140001a51:	48 8d 78 27          	lea    rdi,[rax+0x27]
   140001a55:	48 83 e7 e0          	and    rdi,0xffffffffffffffe0
   140001a59:	48 89 47 f8          	mov    QWORD PTR [rdi-0x8],rax
   140001a5d:	eb 08                	jmp    0x140001a67
   140001a5f:	e8 8c 01 00 00       	call   0x140001bf0
   140001a64:	48 8b f8             	mov    rdi,rax
   140001a67:	4c 89 66 10          	mov    QWORD PTR [rsi+0x10],r12
   140001a6b:	4c 8b c5             	mov    r8,rbp
   140001a6e:	48 89 5e 18          	mov    QWORD PTR [rsi+0x18],rbx
   140001a72:	48 8b cf             	mov    rcx,rdi
   140001a75:	49 83 fe 0f          	cmp    r14,0xf
   140001a79:	76 5d                	jbe    0x140001ad8
   140001a7b:	48 8b 1e             	mov    rbx,QWORD PTR [rsi]
   140001a7e:	48 8b d3             	mov    rdx,rbx
   140001a81:	e8 72 10 00 00       	call   0x140002af8
   140001a86:	49 8d 56 01          	lea    rdx,[r14+0x1]
   140001a8a:	44 88 3c 2f          	mov    BYTE PTR [rdi+rbp*1],r15b
   140001a8e:	c6 44 2f 01 00       	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001a93:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001a9a:	72 18                	jb     0x140001ab4
   140001a9c:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   140001aa0:	48 83 c2 27          	add    rdx,0x27
   140001aa4:	48 2b d8             	sub    rbx,rax
   140001aa7:	48 83 eb 08          	sub    rbx,0x8
   140001aab:	48 83 fb 1f          	cmp    rbx,0x1f
   140001aaf:	77 0d                	ja     0x140001abe
   140001ab1:	48 8b d8             	mov    rbx,rax
   140001ab4:	48 8b cb             	mov    rcx,rbx
   140001ab7:	e8 70 01 00 00       	call   0x140001c2c
   140001abc:	eb 2b                	jmp    0x140001ae9
   140001abe:	45 33 c9             	xor    r9d,r9d
   140001ac1:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   140001ac8:	00 00 
   140001aca:	45 33 c0             	xor    r8d,r8d
   140001acd:	33 d2                	xor    edx,edx
   140001acf:	33 c9                	xor    ecx,ecx
   140001ad1:	ff 15 09 17 00 00    	call   QWORD PTR [rip+0x1709]        # 0x1400031e0
   140001ad7:	cc                   	int3
   140001ad8:	48 8b d6             	mov    rdx,rsi
   140001adb:	e8 18 10 00 00       	call   0x140002af8
   140001ae0:	44 88 3c 2f          	mov    BYTE PTR [rdi+rbp*1],r15b
   140001ae4:	c6 44 2f 01 00       	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001ae9:	48 89 3e             	mov    QWORD PTR [rsi],rdi
   140001aec:	48 8b c6             	mov    rax,rsi
   140001aef:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   140001af4:	48 8b 7c 24 68       	mov    rdi,QWORD PTR [rsp+0x68]
   140001af9:	4c 8b 74 24 30       	mov    r14,QWORD PTR [rsp+0x30]
   140001afe:	48 83 c4 38          	add    rsp,0x38
   140001b02:	41 5f                	pop    r15
   140001b04:	5e                   	pop    rsi
   140001b05:	5d                   	pop    rbp
   140001b06:	5b                   	pop    rbx
   140001b07:	c3                   	ret
   140001b08:	e8 93 f6 ff ff       	call   0x1400011a0
   140001b0d:	cc                   	int3
   140001b0e:	e8 ed f5 ff ff       	call   0x140001100
   140001b13:	cc                   	int3
   140001b14:	cc                   	int3
   140001b15:	cc                   	int3
   140001b16:	cc                   	int3
   140001b17:	cc                   	int3
   140001b18:	cc                   	int3
   140001b19:	cc                   	int3
   140001b1a:	cc                   	int3
   140001b1b:	cc                   	int3
   140001b1c:	cc                   	int3
   140001b1d:	cc                   	int3
   140001b1e:	cc                   	int3
   140001b1f:	cc                   	int3
   140001b20:	40 53                	rex push rbx
   140001b22:	48 83 ec 20          	sub    rsp,0x20
   140001b26:	48 8b d9             	mov    rbx,rcx
   140001b29:	ff 15 c1 15 00 00    	call   QWORD PTR [rip+0x15c1]        # 0x1400030f0
   140001b2f:	84 c0                	test   al,al
   140001b31:	75 0a                	jne    0x140001b3d
   140001b33:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140001b36:	ff 15 74 15 00 00    	call   QWORD PTR [rip+0x1574]        # 0x1400030b0
   140001b3c:	90                   	nop
   140001b3d:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140001b40:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001b43:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001b47:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001b4c:	48 85 c9             	test   rcx,rcx
   140001b4f:	74 07                	je     0x140001b58
   140001b51:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001b54:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001b57:	90                   	nop
   140001b58:	48 83 c4 20          	add    rsp,0x20
   140001b5c:	5b                   	pop    rbx
   140001b5d:	c3                   	ret
   140001b5e:	cc                   	int3
   140001b5f:	cc                   	int3
   140001b60:	48 83 ec 28          	sub    rsp,0x28
   140001b64:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001b67:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001b6a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001b6e:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001b73:	48 85 c9             	test   rcx,rcx
   140001b76:	74 07                	je     0x140001b7f
   140001b78:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001b7b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001b7e:	90                   	nop
   140001b7f:	48 83 c4 28          	add    rsp,0x28
   140001b83:	c3                   	ret
   140001b84:	cc                   	int3
   140001b85:	cc                   	int3
   140001b86:	cc                   	int3
   140001b87:	cc                   	int3
   140001b88:	cc                   	int3
   140001b89:	cc                   	int3
   140001b8a:	cc                   	int3
   140001b8b:	cc                   	int3
   140001b8c:	cc                   	int3
   140001b8d:	cc                   	int3
   140001b8e:	cc                   	int3
   140001b8f:	cc                   	int3
   140001b90:	48 83 ec 28          	sub    rsp,0x28
   140001b94:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001b97:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001b9a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001b9e:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001ba3:	48 85 c9             	test   rcx,rcx
   140001ba6:	74 07                	je     0x140001baf
   140001ba8:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001bab:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001bae:	90                   	nop
   140001baf:	48 83 c4 28          	add    rsp,0x28
   140001bb3:	c3                   	ret
   140001bb4:	cc                   	int3
   140001bb5:	cc                   	int3
   140001bb6:	cc                   	int3
   140001bb7:	cc                   	int3
   140001bb8:	cc                   	int3
   140001bb9:	cc                   	int3
   140001bba:	cc                   	int3
   140001bbb:	cc                   	int3
   140001bbc:	cc                   	int3
   140001bbd:	cc                   	int3
   140001bbe:	cc                   	int3
   140001bbf:	cc                   	int3
   140001bc0:	cc                   	int3
   140001bc1:	cc                   	int3
   140001bc2:	cc                   	int3
   140001bc3:	cc                   	int3
   140001bc4:	cc                   	int3
   140001bc5:	cc                   	int3
   140001bc6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140001bcd:	00 00 00 
   140001bd0:	48 3b 0d 29 34 00 00 	cmp    rcx,QWORD PTR [rip+0x3429]        # 0x140005000
   140001bd7:	75 10                	jne    0x140001be9
   140001bd9:	48 c1 c1 10          	rol    rcx,0x10
   140001bdd:	66 f7 c1 ff ff       	test   cx,0xffff
   140001be2:	75 01                	jne    0x140001be5
   140001be4:	c3                   	ret
   140001be5:	48 c1 c9 10          	ror    rcx,0x10
   140001be9:	e9 1a 03 00 00       	jmp    0x140001f08
   140001bee:	cc                   	int3
   140001bef:	cc                   	int3
   140001bf0:	40 53                	rex push rbx
   140001bf2:	48 83 ec 20          	sub    rsp,0x20
   140001bf6:	48 8b d9             	mov    rbx,rcx
   140001bf9:	eb 0f                	jmp    0x140001c0a
   140001bfb:	48 8b cb             	mov    rcx,rbx
   140001bfe:	e8 77 0d 00 00       	call   0x14000297a
   140001c03:	85 c0                	test   eax,eax
   140001c05:	74 13                	je     0x140001c1a
   140001c07:	48 8b cb             	mov    rcx,rbx
   140001c0a:	e8 71 0d 00 00       	call   0x140002980
   140001c0f:	48 85 c0             	test   rax,rax
   140001c12:	74 e7                	je     0x140001bfb
   140001c14:	48 83 c4 20          	add    rsp,0x20
   140001c18:	5b                   	pop    rbx
   140001c19:	c3                   	ret
   140001c1a:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
   140001c1e:	74 06                	je     0x140001c26
   140001c20:	e8 4f 04 00 00       	call   0x140002074
   140001c25:	cc                   	int3
   140001c26:	e8 d5 f4 ff ff       	call   0x140001100
   140001c2b:	cc                   	int3
   140001c2c:	e9 63 04 00 00       	jmp    0x140002094
   140001c31:	cc                   	int3
   140001c32:	cc                   	int3
   140001c33:	cc                   	int3
   140001c34:	40 53                	rex push rbx
   140001c36:	48 83 ec 20          	sub    rsp,0x20
   140001c3a:	48 8d 05 c7 16 00 00 	lea    rax,[rip+0x16c7]        # 0x140003308
   140001c41:	48 8b d9             	mov    rbx,rcx
   140001c44:	48 89 01             	mov    QWORD PTR [rcx],rax
   140001c47:	f6 c2 01             	test   dl,0x1
   140001c4a:	74 0a                	je     0x140001c56
   140001c4c:	ba 18 00 00 00       	mov    edx,0x18
   140001c51:	e8 d6 ff ff ff       	call   0x140001c2c
   140001c56:	48 8b c3             	mov    rax,rbx
   140001c59:	48 83 c4 20          	add    rsp,0x20
   140001c5d:	5b                   	pop    rbx
   140001c5e:	c3                   	ret
   140001c5f:	cc                   	int3
   140001c60:	40 53                	rex push rbx
   140001c62:	48 83 ec 20          	sub    rsp,0x20
   140001c66:	b9 01 00 00 00       	mov    ecx,0x1
   140001c6b:	e8 1c 0d 00 00       	call   0x14000298c
   140001c70:	e8 23 07 00 00       	call   0x140002398
   140001c75:	8b c8                	mov    ecx,eax
   140001c77:	e8 46 0d 00 00       	call   0x1400029c2
   140001c7c:	e8 0b 07 00 00       	call   0x14000238c
   140001c81:	8b d8                	mov    ebx,eax
   140001c83:	e8 6a 0d 00 00       	call   0x1400029f2
   140001c88:	b9 01 00 00 00       	mov    ecx,0x1
   140001c8d:	89 18                	mov    DWORD PTR [rax],ebx
   140001c8f:	e8 80 04 00 00       	call   0x140002114
   140001c94:	84 c0                	test   al,al
   140001c96:	74 73                	je     0x140001d0b
   140001c98:	e8 8b 09 00 00       	call   0x140002628
   140001c9d:	48 8d 0d c0 09 00 00 	lea    rcx,[rip+0x9c0]        # 0x140002664
   140001ca4:	e8 1b 06 00 00       	call   0x1400022c4
   140001ca9:	e8 e2 06 00 00       	call   0x140002390
   140001cae:	8b c8                	mov    ecx,eax
   140001cb0:	e8 e3 0c 00 00       	call   0x140002998
   140001cb5:	85 c0                	test   eax,eax
   140001cb7:	75 52                	jne    0x140001d0b
   140001cb9:	e8 e2 06 00 00       	call   0x1400023a0
   140001cbe:	e8 21 07 00 00       	call   0x1400023e4
   140001cc3:	85 c0                	test   eax,eax
   140001cc5:	74 0c                	je     0x140001cd3
   140001cc7:	48 8d 0d be 06 00 00 	lea    rcx,[rip+0x6be]        # 0x14000238c
   140001cce:	e8 bf 0c 00 00       	call   0x140002992
   140001cd3:	e8 dc 06 00 00       	call   0x1400023b4
   140001cd8:	e8 d7 06 00 00       	call   0x1400023b4
   140001cdd:	e8 aa 06 00 00       	call   0x14000238c
   140001ce2:	8b c8                	mov    ecx,eax
   140001ce4:	e8 fd 0c 00 00       	call   0x1400029e6
   140001ce9:	e8 c2 06 00 00       	call   0x1400023b0
   140001cee:	84 c0                	test   al,al
   140001cf0:	74 05                	je     0x140001cf7
   140001cf2:	e8 a7 0c 00 00       	call   0x14000299e
   140001cf7:	e8 90 06 00 00       	call   0x14000238c
   140001cfc:	e8 57 08 00 00       	call   0x140002558
   140001d01:	85 c0                	test   eax,eax
   140001d03:	75 06                	jne    0x140001d0b
   140001d05:	48 83 c4 20          	add    rsp,0x20
   140001d09:	5b                   	pop    rbx
   140001d0a:	c3                   	ret
   140001d0b:	b9 07 00 00 00       	mov    ecx,0x7
   140001d10:	e8 f7 06 00 00       	call   0x14000240c
   140001d15:	cc                   	int3
   140001d16:	cc                   	int3
   140001d17:	cc                   	int3
   140001d18:	48 83 ec 28          	sub    rsp,0x28
   140001d1c:	e8 a7 06 00 00       	call   0x1400023c8
   140001d21:	33 c0                	xor    eax,eax
   140001d23:	48 83 c4 28          	add    rsp,0x28
   140001d27:	c3                   	ret
   140001d28:	48 83 ec 28          	sub    rsp,0x28
   140001d2c:	e8 83 08 00 00       	call   0x1400025b4
   140001d31:	e8 56 06 00 00       	call   0x14000238c
   140001d36:	8b c8                	mov    ecx,eax
   140001d38:	48 83 c4 28          	add    rsp,0x28
   140001d3c:	e9 ab 0c 00 00       	jmp    0x1400029ec
   140001d41:	cc                   	int3
   140001d42:	cc                   	int3
   140001d43:	cc                   	int3
   140001d44:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140001d49:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   140001d4e:	57                   	push   rdi
   140001d4f:	48 83 ec 30          	sub    rsp,0x30
   140001d53:	b9 01 00 00 00       	mov    ecx,0x1
   140001d58:	e8 7b 03 00 00       	call   0x1400020d8
   140001d5d:	84 c0                	test   al,al
   140001d5f:	0f 84 36 01 00 00    	je     0x140001e9b
   140001d65:	40 32 f6             	xor    sil,sil
   140001d68:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140001d6d:	e8 2a 03 00 00       	call   0x14000209c
   140001d72:	8a d8                	mov    bl,al
   140001d74:	8b 0d 16 39 00 00    	mov    ecx,DWORD PTR [rip+0x3916]        # 0x140005690
   140001d7a:	83 f9 01             	cmp    ecx,0x1
   140001d7d:	0f 84 23 01 00 00    	je     0x140001ea6
   140001d83:	85 c9                	test   ecx,ecx
   140001d85:	75 4a                	jne    0x140001dd1
   140001d87:	c7 05 ff 38 00 00 01 	mov    DWORD PTR [rip+0x38ff],0x1        # 0x140005690
   140001d8e:	00 00 00 
   140001d91:	48 8d 15 38 15 00 00 	lea    rdx,[rip+0x1538]        # 0x1400032d0
   140001d98:	48 8d 0d 19 15 00 00 	lea    rcx,[rip+0x1519]        # 0x1400032b8
   140001d9f:	e8 0c 0c 00 00       	call   0x1400029b0
   140001da4:	85 c0                	test   eax,eax
   140001da6:	74 0a                	je     0x140001db2
   140001da8:	b8 ff 00 00 00       	mov    eax,0xff
   140001dad:	e9 d9 00 00 00       	jmp    0x140001e8b
   140001db2:	48 8d 15 f7 14 00 00 	lea    rdx,[rip+0x14f7]        # 0x1400032b0
   140001db9:	48 8d 0d e0 14 00 00 	lea    rcx,[rip+0x14e0]        # 0x1400032a0
   140001dc0:	e8 e5 0b 00 00       	call   0x1400029aa
   140001dc5:	c7 05 c1 38 00 00 02 	mov    DWORD PTR [rip+0x38c1],0x2        # 0x140005690
   140001dcc:	00 00 00 
   140001dcf:	eb 08                	jmp    0x140001dd9
   140001dd1:	40 b6 01             	mov    sil,0x1
   140001dd4:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140001dd9:	8a cb                	mov    cl,bl
   140001ddb:	e8 58 04 00 00       	call   0x140002238
   140001de0:	e8 0b 06 00 00       	call   0x1400023f0
   140001de5:	48 8b d8             	mov    rbx,rax
   140001de8:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140001dec:	74 1e                	je     0x140001e0c
   140001dee:	48 8b c8             	mov    rcx,rax
   140001df1:	e8 aa 03 00 00       	call   0x1400021a0
   140001df6:	84 c0                	test   al,al
   140001df8:	74 12                	je     0x140001e0c
   140001dfa:	45 33 c0             	xor    r8d,r8d
   140001dfd:	41 8d 50 02          	lea    edx,[r8+0x2]
   140001e01:	33 c9                	xor    ecx,ecx
   140001e03:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001e06:	ff 15 6c 14 00 00    	call   QWORD PTR [rip+0x146c]        # 0x140003278
   140001e0c:	e8 e7 05 00 00       	call   0x1400023f8
   140001e11:	48 8b d8             	mov    rbx,rax
   140001e14:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140001e18:	74 14                	je     0x140001e2e
   140001e1a:	48 8b c8             	mov    rcx,rax
   140001e1d:	e8 7e 03 00 00       	call   0x1400021a0
   140001e22:	84 c0                	test   al,al
   140001e24:	74 08                	je     0x140001e2e
   140001e26:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140001e29:	e8 b2 0b 00 00       	call   0x1400029e0
   140001e2e:	e8 71 0b 00 00       	call   0x1400029a4
   140001e33:	48 8b f8             	mov    rdi,rax
   140001e36:	e8 93 0b 00 00       	call   0x1400029ce
   140001e3b:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   140001e3e:	e8 85 0b 00 00       	call   0x1400029c8
   140001e43:	4c 8b c7             	mov    r8,rdi
   140001e46:	48 8b d3             	mov    rdx,rbx
   140001e49:	8b 08                	mov    ecx,DWORD PTR [rax]
   140001e4b:	e8 70 f3 ff ff       	call   0x1400011c0
   140001e50:	8b d8                	mov    ebx,eax
   140001e52:	e8 09 07 00 00       	call   0x140002560
   140001e57:	84 c0                	test   al,al
   140001e59:	74 55                	je     0x140001eb0
   140001e5b:	40 84 f6             	test   sil,sil
   140001e5e:	75 05                	jne    0x140001e65
   140001e60:	e8 6f 0b 00 00       	call   0x1400029d4
   140001e65:	33 d2                	xor    edx,edx
   140001e67:	b1 01                	mov    cl,0x1
   140001e69:	e8 ee 03 00 00       	call   0x14000225c
   140001e6e:	8b c3                	mov    eax,ebx
   140001e70:	eb 19                	jmp    0x140001e8b
   140001e72:	8b d8                	mov    ebx,eax
   140001e74:	e8 e7 06 00 00       	call   0x140002560
   140001e79:	84 c0                	test   al,al
   140001e7b:	74 3b                	je     0x140001eb8
   140001e7d:	80 7c 24 20 00       	cmp    BYTE PTR [rsp+0x20],0x0
   140001e82:	75 05                	jne    0x140001e89
   140001e84:	e8 51 0b 00 00       	call   0x1400029da
   140001e89:	8b c3                	mov    eax,ebx
   140001e8b:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   140001e90:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   140001e95:	48 83 c4 30          	add    rsp,0x30
   140001e99:	5f                   	pop    rdi
   140001e9a:	c3                   	ret
   140001e9b:	b9 07 00 00 00       	mov    ecx,0x7
   140001ea0:	e8 67 05 00 00       	call   0x14000240c
   140001ea5:	90                   	nop
   140001ea6:	b9 07 00 00 00       	mov    ecx,0x7
   140001eab:	e8 5c 05 00 00       	call   0x14000240c
   140001eb0:	8b cb                	mov    ecx,ebx
   140001eb2:	e8 ff 0a 00 00       	call   0x1400029b6
   140001eb7:	90                   	nop
   140001eb8:	8b cb                	mov    ecx,ebx
   140001eba:	e8 fd 0a 00 00       	call   0x1400029bc
   140001ebf:	90                   	nop
   140001ec0:	48 83 ec 28          	sub    rsp,0x28
   140001ec4:	e8 13 04 00 00       	call   0x1400022dc
   140001ec9:	48 83 c4 28          	add    rsp,0x28
   140001ecd:	e9 72 fe ff ff       	jmp    0x140001d44
   140001ed2:	cc                   	int3
   140001ed3:	cc                   	int3
   140001ed4:	40 53                	rex push rbx
   140001ed6:	48 83 ec 20          	sub    rsp,0x20
   140001eda:	48 8b d9             	mov    rbx,rcx
   140001edd:	33 c9                	xor    ecx,ecx
   140001edf:	ff 15 6b 11 00 00    	call   QWORD PTR [rip+0x116b]        # 0x140003050
   140001ee5:	48 8b cb             	mov    rcx,rbx
   140001ee8:	ff 15 6a 11 00 00    	call   QWORD PTR [rip+0x116a]        # 0x140003058
   140001eee:	ff 15 54 11 00 00    	call   QWORD PTR [rip+0x1154]        # 0x140003048
   140001ef4:	48 8b c8             	mov    rcx,rax
   140001ef7:	ba 09 04 00 c0       	mov    edx,0xc0000409
   140001efc:	48 83 c4 20          	add    rsp,0x20
   140001f00:	5b                   	pop    rbx
   140001f01:	48 ff 25 38 11 00 00 	rex.W jmp QWORD PTR [rip+0x1138]        # 0x140003040
   140001f08:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   140001f0d:	48 83 ec 38          	sub    rsp,0x38
   140001f11:	b9 17 00 00 00       	mov    ecx,0x17
   140001f16:	ff 15 1c 11 00 00    	call   QWORD PTR [rip+0x111c]        # 0x140003038
   140001f1c:	85 c0                	test   eax,eax
   140001f1e:	74 07                	je     0x140001f27
   140001f20:	b9 02 00 00 00       	mov    ecx,0x2
   140001f25:	cd 29                	int    0x29
   140001f27:	48 8d 0d 92 32 00 00 	lea    rcx,[rip+0x3292]        # 0x1400051c0
   140001f2e:	e8 a9 00 00 00       	call   0x140001fdc
   140001f33:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   140001f38:	48 89 05 79 33 00 00 	mov    QWORD PTR [rip+0x3379],rax        # 0x1400052b8
   140001f3f:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   140001f44:	48 83 c0 08          	add    rax,0x8
   140001f48:	48 89 05 09 33 00 00 	mov    QWORD PTR [rip+0x3309],rax        # 0x140005258
   140001f4f:	48 8b 05 62 33 00 00 	mov    rax,QWORD PTR [rip+0x3362]        # 0x1400052b8
   140001f56:	48 89 05 d3 31 00 00 	mov    QWORD PTR [rip+0x31d3],rax        # 0x140005130
   140001f5d:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   140001f62:	48 89 05 d7 32 00 00 	mov    QWORD PTR [rip+0x32d7],rax        # 0x140005240
   140001f69:	c7 05 ad 31 00 00 09 	mov    DWORD PTR [rip+0x31ad],0xc0000409        # 0x140005120
   140001f70:	04 00 c0 
   140001f73:	c7 05 a7 31 00 00 01 	mov    DWORD PTR [rip+0x31a7],0x1        # 0x140005124
   140001f7a:	00 00 00 
   140001f7d:	c7 05 b1 31 00 00 01 	mov    DWORD PTR [rip+0x31b1],0x1        # 0x140005138
   140001f84:	00 00 00 
   140001f87:	b8 08 00 00 00       	mov    eax,0x8
   140001f8c:	48 6b c0 00          	imul   rax,rax,0x0
   140001f90:	48 8d 0d a9 31 00 00 	lea    rcx,[rip+0x31a9]        # 0x140005140
   140001f97:	48 c7 04 01 02 00 00 	mov    QWORD PTR [rcx+rax*1],0x2
   140001f9e:	00 
   140001f9f:	b8 08 00 00 00       	mov    eax,0x8
   140001fa4:	48 6b c0 00          	imul   rax,rax,0x0
   140001fa8:	48 8b 0d 51 30 00 00 	mov    rcx,QWORD PTR [rip+0x3051]        # 0x140005000
   140001faf:	48 89 4c 04 20       	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140001fb4:	b8 08 00 00 00       	mov    eax,0x8
   140001fb9:	48 6b c0 01          	imul   rax,rax,0x1
   140001fbd:	48 8b 0d 7c 30 00 00 	mov    rcx,QWORD PTR [rip+0x307c]        # 0x140005040
   140001fc4:	48 89 4c 04 20       	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140001fc9:	48 8d 0d 40 13 00 00 	lea    rcx,[rip+0x1340]        # 0x140003310
   140001fd0:	e8 ff fe ff ff       	call   0x140001ed4
   140001fd5:	90                   	nop
   140001fd6:	48 83 c4 38          	add    rsp,0x38
   140001fda:	c3                   	ret
   140001fdb:	cc                   	int3
   140001fdc:	40 53                	rex push rbx
   140001fde:	56                   	push   rsi
   140001fdf:	57                   	push   rdi
   140001fe0:	48 83 ec 40          	sub    rsp,0x40
   140001fe4:	48 8b d9             	mov    rbx,rcx
   140001fe7:	ff 15 13 10 00 00    	call   QWORD PTR [rip+0x1013]        # 0x140003000
   140001fed:	48 8b b3 f8 00 00 00 	mov    rsi,QWORD PTR [rbx+0xf8]
   140001ff4:	33 ff                	xor    edi,edi
   140001ff6:	45 33 c0             	xor    r8d,r8d
   140001ff9:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   140001ffe:	48 8b ce             	mov    rcx,rsi
   140002001:	ff 15 61 10 00 00    	call   QWORD PTR [rip+0x1061]        # 0x140003068
   140002007:	48 85 c0             	test   rax,rax
   14000200a:	74 3c                	je     0x140002048
   14000200c:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140002011:	48 8d 4c 24 68       	lea    rcx,[rsp+0x68]
   140002016:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   14000201d:	00 00 
   14000201f:	4c 8b c8             	mov    r9,rax
   140002022:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140002027:	4c 8b c6             	mov    r8,rsi
   14000202a:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   14000202f:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   140002034:	33 c9                	xor    ecx,ecx
   140002036:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   14000203b:	ff 15 1f 10 00 00    	call   QWORD PTR [rip+0x101f]        # 0x140003060
   140002041:	ff c7                	inc    edi
   140002043:	83 ff 02             	cmp    edi,0x2
   140002046:	7c ae                	jl     0x140001ff6
   140002048:	48 83 c4 40          	add    rsp,0x40
   14000204c:	5f                   	pop    rdi
   14000204d:	5e                   	pop    rsi
   14000204e:	5b                   	pop    rbx
   14000204f:	c3                   	ret
   140002050:	48 8d 05 f9 12 00 00 	lea    rax,[rip+0x12f9]        # 0x140003350
   140002057:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   14000205e:	00 
   14000205f:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   140002063:	48 8d 05 d6 12 00 00 	lea    rax,[rip+0x12d6]        # 0x140003340
   14000206a:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000206d:	48 8b c1             	mov    rax,rcx
   140002070:	c3                   	ret
   140002071:	cc                   	int3
   140002072:	cc                   	int3
   140002073:	cc                   	int3
   140002074:	48 83 ec 48          	sub    rsp,0x48
   140002078:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000207d:	e8 ce ff ff ff       	call   0x140002050
   140002082:	48 8d 15 ff 1d 00 00 	lea    rdx,[rip+0x1dff]        # 0x140003e88
   140002089:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000208e:	e8 cf 08 00 00       	call   0x140002962
   140002093:	cc                   	int3
   140002094:	e9 5f 09 00 00       	jmp    0x1400029f8
   140002099:	cc                   	int3
   14000209a:	cc                   	int3
   14000209b:	cc                   	int3
   14000209c:	48 83 ec 28          	sub    rsp,0x28
   1400020a0:	e8 93 08 00 00       	call   0x140002938
   1400020a5:	85 c0                	test   eax,eax
   1400020a7:	74 21                	je     0x1400020ca
   1400020a9:	65 48 8b 04 25 30 00 	mov    rax,QWORD PTR gs:0x30
   1400020b0:	00 00 
   1400020b2:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   1400020b6:	eb 05                	jmp    0x1400020bd
   1400020b8:	48 3b c8             	cmp    rcx,rax
   1400020bb:	74 14                	je     0x1400020d1
   1400020bd:	33 c0                	xor    eax,eax
   1400020bf:	f0 48 0f b1 0d d0 35 	lock cmpxchg QWORD PTR [rip+0x35d0],rcx        # 0x140005698
   1400020c6:	00 00 
   1400020c8:	75 ee                	jne    0x1400020b8
   1400020ca:	32 c0                	xor    al,al
   1400020cc:	48 83 c4 28          	add    rsp,0x28
   1400020d0:	c3                   	ret
   1400020d1:	b0 01                	mov    al,0x1
   1400020d3:	eb f7                	jmp    0x1400020cc
   1400020d5:	cc                   	int3
   1400020d6:	cc                   	int3
   1400020d7:	cc                   	int3
   1400020d8:	48 83 ec 28          	sub    rsp,0x28
   1400020dc:	85 c9                	test   ecx,ecx
   1400020de:	75 07                	jne    0x1400020e7
   1400020e0:	c6 05 b9 35 00 00 01 	mov    BYTE PTR [rip+0x35b9],0x1        # 0x1400056a0
   1400020e7:	e8 b4 05 00 00       	call   0x1400026a0
   1400020ec:	e8 bf 02 00 00       	call   0x1400023b0
   1400020f1:	84 c0                	test   al,al
   1400020f3:	75 04                	jne    0x1400020f9
   1400020f5:	32 c0                	xor    al,al
   1400020f7:	eb 14                	jmp    0x14000210d
   1400020f9:	e8 b2 02 00 00       	call   0x1400023b0
   1400020fe:	84 c0                	test   al,al
   140002100:	75 09                	jne    0x14000210b
   140002102:	33 c9                	xor    ecx,ecx
   140002104:	e8 a7 02 00 00       	call   0x1400023b0
   140002109:	eb ea                	jmp    0x1400020f5
   14000210b:	b0 01                	mov    al,0x1
   14000210d:	48 83 c4 28          	add    rsp,0x28
   140002111:	c3                   	ret
   140002112:	cc                   	int3
   140002113:	cc                   	int3
   140002114:	40 53                	rex push rbx
   140002116:	48 83 ec 20          	sub    rsp,0x20
   14000211a:	80 3d 80 35 00 00 00 	cmp    BYTE PTR [rip+0x3580],0x0        # 0x1400056a1
   140002121:	8b d9                	mov    ebx,ecx
   140002123:	75 67                	jne    0x14000218c
   140002125:	83 f9 01             	cmp    ecx,0x1
   140002128:	77 6a                	ja     0x140002194
   14000212a:	e8 09 08 00 00       	call   0x140002938
   14000212f:	85 c0                	test   eax,eax
   140002131:	74 28                	je     0x14000215b
   140002133:	85 db                	test   ebx,ebx
   140002135:	75 24                	jne    0x14000215b
   140002137:	48 8d 0d 6a 35 00 00 	lea    rcx,[rip+0x356a]        # 0x1400056a8
   14000213e:	e8 bb 08 00 00       	call   0x1400029fe
   140002143:	85 c0                	test   eax,eax
   140002145:	75 10                	jne    0x140002157
   140002147:	48 8d 0d 72 35 00 00 	lea    rcx,[rip+0x3572]        # 0x1400056c0
   14000214e:	e8 ab 08 00 00       	call   0x1400029fe
   140002153:	85 c0                	test   eax,eax
   140002155:	74 2e                	je     0x140002185
   140002157:	32 c0                	xor    al,al
   140002159:	eb 33                	jmp    0x14000218e
   14000215b:	66 0f 6f 05 1d 12 00 	movdqa xmm0,XMMWORD PTR [rip+0x121d]        # 0x140003380
   140002162:	00 
   140002163:	48 83 c8 ff          	or     rax,0xffffffffffffffff
   140002167:	f3 0f 7f 05 39 35 00 	movdqu XMMWORD PTR [rip+0x3539],xmm0        # 0x1400056a8
   14000216e:	00 
   14000216f:	48 89 05 42 35 00 00 	mov    QWORD PTR [rip+0x3542],rax        # 0x1400056b8
   140002176:	f3 0f 7f 05 42 35 00 	movdqu XMMWORD PTR [rip+0x3542],xmm0        # 0x1400056c0
   14000217d:	00 
   14000217e:	48 89 05 4b 35 00 00 	mov    QWORD PTR [rip+0x354b],rax        # 0x1400056d0
   140002185:	c6 05 15 35 00 00 01 	mov    BYTE PTR [rip+0x3515],0x1        # 0x1400056a1
   14000218c:	b0 01                	mov    al,0x1
   14000218e:	48 83 c4 20          	add    rsp,0x20
   140002192:	5b                   	pop    rbx
   140002193:	c3                   	ret
   140002194:	b9 05 00 00 00       	mov    ecx,0x5
   140002199:	e8 6e 02 00 00       	call   0x14000240c
   14000219e:	cc                   	int3
   14000219f:	cc                   	int3
   1400021a0:	48 83 ec 18          	sub    rsp,0x18
   1400021a4:	4c 8b c1             	mov    r8,rcx
   1400021a7:	b8 4d 5a 00 00       	mov    eax,0x5a4d
   1400021ac:	66 39 05 4d de ff ff 	cmp    WORD PTR [rip+0xffffffffffffde4d],ax        # 0x140000000
   1400021b3:	75 78                	jne    0x14000222d
   1400021b5:	48 63 0d 80 de ff ff 	movsxd rcx,DWORD PTR [rip+0xffffffffffffde80]        # 0x14000003c
   1400021bc:	48 8d 15 3d de ff ff 	lea    rdx,[rip+0xffffffffffffde3d]        # 0x140000000
   1400021c3:	48 03 ca             	add    rcx,rdx
   1400021c6:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   1400021cc:	75 5f                	jne    0x14000222d
   1400021ce:	b8 0b 02 00 00       	mov    eax,0x20b
   1400021d3:	66 39 41 18          	cmp    WORD PTR [rcx+0x18],ax
   1400021d7:	75 54                	jne    0x14000222d
   1400021d9:	4c 2b c2             	sub    r8,rdx
   1400021dc:	0f b7 51 14          	movzx  edx,WORD PTR [rcx+0x14]
   1400021e0:	48 83 c2 18          	add    rdx,0x18
   1400021e4:	48 03 d1             	add    rdx,rcx
   1400021e7:	0f b7 41 06          	movzx  eax,WORD PTR [rcx+0x6]
   1400021eb:	48 8d 0c 80          	lea    rcx,[rax+rax*4]
   1400021ef:	4c 8d 0c ca          	lea    r9,[rdx+rcx*8]
   1400021f3:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
   1400021f7:	49 3b d1             	cmp    rdx,r9
   1400021fa:	74 18                	je     0x140002214
   1400021fc:	8b 4a 0c             	mov    ecx,DWORD PTR [rdx+0xc]
   1400021ff:	4c 3b c1             	cmp    r8,rcx
   140002202:	72 0a                	jb     0x14000220e
   140002204:	8b 42 08             	mov    eax,DWORD PTR [rdx+0x8]
   140002207:	03 c1                	add    eax,ecx
   140002209:	4c 3b c0             	cmp    r8,rax
   14000220c:	72 08                	jb     0x140002216
   14000220e:	48 83 c2 28          	add    rdx,0x28
   140002212:	eb df                	jmp    0x1400021f3
   140002214:	33 d2                	xor    edx,edx
   140002216:	48 85 d2             	test   rdx,rdx
   140002219:	75 04                	jne    0x14000221f
   14000221b:	32 c0                	xor    al,al
   14000221d:	eb 14                	jmp    0x140002233
   14000221f:	83 7a 24 00          	cmp    DWORD PTR [rdx+0x24],0x0
   140002223:	7d 04                	jge    0x140002229
   140002225:	32 c0                	xor    al,al
   140002227:	eb 0a                	jmp    0x140002233
   140002229:	b0 01                	mov    al,0x1
   14000222b:	eb 06                	jmp    0x140002233
   14000222d:	32 c0                	xor    al,al
   14000222f:	eb 02                	jmp    0x140002233
   140002231:	32 c0                	xor    al,al
   140002233:	48 83 c4 18          	add    rsp,0x18
   140002237:	c3                   	ret
   140002238:	40 53                	rex push rbx
   14000223a:	48 83 ec 20          	sub    rsp,0x20
   14000223e:	8a d9                	mov    bl,cl
   140002240:	e8 f3 06 00 00       	call   0x140002938
   140002245:	33 d2                	xor    edx,edx
   140002247:	85 c0                	test   eax,eax
   140002249:	74 0b                	je     0x140002256
   14000224b:	84 db                	test   bl,bl
   14000224d:	75 07                	jne    0x140002256
   14000224f:	48 87 15 42 34 00 00 	xchg   QWORD PTR [rip+0x3442],rdx        # 0x140005698
   140002256:	48 83 c4 20          	add    rsp,0x20
   14000225a:	5b                   	pop    rbx
   14000225b:	c3                   	ret
   14000225c:	40 53                	rex push rbx
   14000225e:	48 83 ec 20          	sub    rsp,0x20
   140002262:	80 3d 37 34 00 00 00 	cmp    BYTE PTR [rip+0x3437],0x0        # 0x1400056a0
   140002269:	8a d9                	mov    bl,cl
   14000226b:	74 04                	je     0x140002271
   14000226d:	84 d2                	test   dl,dl
   14000226f:	75 0c                	jne    0x14000227d
   140002271:	e8 3a 01 00 00       	call   0x1400023b0
   140002276:	8a cb                	mov    cl,bl
   140002278:	e8 33 01 00 00       	call   0x1400023b0
   14000227d:	b0 01                	mov    al,0x1
   14000227f:	48 83 c4 20          	add    rsp,0x20
   140002283:	5b                   	pop    rbx
   140002284:	c3                   	ret
   140002285:	cc                   	int3
   140002286:	cc                   	int3
   140002287:	cc                   	int3
   140002288:	40 53                	rex push rbx
   14000228a:	48 83 ec 20          	sub    rsp,0x20
   14000228e:	48 83 3d 12 34 00 00 	cmp    QWORD PTR [rip+0x3412],0xffffffffffffffff        # 0x1400056a8
   140002295:	ff 
   140002296:	48 8b d9             	mov    rbx,rcx
   140002299:	75 07                	jne    0x1400022a2
   14000229b:	e8 6a 07 00 00       	call   0x140002a0a
   1400022a0:	eb 0f                	jmp    0x1400022b1
   1400022a2:	48 8b d3             	mov    rdx,rbx
   1400022a5:	48 8d 0d fc 33 00 00 	lea    rcx,[rip+0x33fc]        # 0x1400056a8
   1400022ac:	e8 53 07 00 00       	call   0x140002a04
   1400022b1:	33 d2                	xor    edx,edx
   1400022b3:	85 c0                	test   eax,eax
   1400022b5:	48 0f 44 d3          	cmove  rdx,rbx
   1400022b9:	48 8b c2             	mov    rax,rdx
   1400022bc:	48 83 c4 20          	add    rsp,0x20
   1400022c0:	5b                   	pop    rbx
   1400022c1:	c3                   	ret
   1400022c2:	cc                   	int3
   1400022c3:	cc                   	int3
   1400022c4:	48 83 ec 28          	sub    rsp,0x28
   1400022c8:	e8 bb ff ff ff       	call   0x140002288
   1400022cd:	48 f7 d8             	neg    rax
   1400022d0:	1b c0                	sbb    eax,eax
   1400022d2:	f7 d8                	neg    eax
   1400022d4:	ff c8                	dec    eax
   1400022d6:	48 83 c4 28          	add    rsp,0x28
   1400022da:	c3                   	ret
   1400022db:	cc                   	int3
   1400022dc:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   1400022e1:	55                   	push   rbp
   1400022e2:	48 8b ec             	mov    rbp,rsp
   1400022e5:	48 83 ec 30          	sub    rsp,0x30
   1400022e9:	48 8b 05 10 2d 00 00 	mov    rax,QWORD PTR [rip+0x2d10]        # 0x140005000
   1400022f0:	48 bb 32 a2 df 2d 99 	movabs rbx,0x2b992ddfa232
   1400022f7:	2b 00 00 
   1400022fa:	48 3b c3             	cmp    rax,rbx
   1400022fd:	75 77                	jne    0x140002376
   1400022ff:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   140002303:	48 c7 45 10 00 00 00 	mov    QWORD PTR [rbp+0x10],0x0
   14000230a:	00 
   14000230b:	ff 15 5f 0d 00 00    	call   QWORD PTR [rip+0xd5f]        # 0x140003070
   140002311:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002315:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002319:	ff 15 01 0d 00 00    	call   QWORD PTR [rip+0xd01]        # 0x140003020
   14000231f:	8b c0                	mov    eax,eax
   140002321:	48 31 45 f0          	xor    QWORD PTR [rbp-0x10],rax
   140002325:	ff 15 fd 0c 00 00    	call   QWORD PTR [rip+0xcfd]        # 0x140003028
   14000232b:	8b c0                	mov    eax,eax
   14000232d:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140002331:	48 31 45 f0          	xor    QWORD PTR [rbp-0x10],rax
   140002335:	ff 15 f5 0c 00 00    	call   QWORD PTR [rip+0xcf5]        # 0x140003030
   14000233b:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   14000233e:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140002342:	48 c1 e0 20          	shl    rax,0x20
   140002346:	48 33 45 18          	xor    rax,QWORD PTR [rbp+0x18]
   14000234a:	48 33 45 f0          	xor    rax,QWORD PTR [rbp-0x10]
   14000234e:	48 33 c1             	xor    rax,rcx
   140002351:	48 b9 ff ff ff ff ff 	movabs rcx,0xffffffffffff
   140002358:	ff 00 00 
   14000235b:	48 23 c1             	and    rax,rcx
   14000235e:	48 b9 33 a2 df 2d 99 	movabs rcx,0x2b992ddfa233
   140002365:	2b 00 00 
   140002368:	48 3b c3             	cmp    rax,rbx
   14000236b:	48 0f 44 c1          	cmove  rax,rcx
   14000236f:	48 89 05 8a 2c 00 00 	mov    QWORD PTR [rip+0x2c8a],rax        # 0x140005000
   140002376:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
   14000237b:	48 f7 d0             	not    rax
   14000237e:	48 89 05 bb 2c 00 00 	mov    QWORD PTR [rip+0x2cbb],rax        # 0x140005040
   140002385:	48 83 c4 30          	add    rsp,0x30
   140002389:	5d                   	pop    rbp
   14000238a:	c3                   	ret
   14000238b:	cc                   	int3
   14000238c:	33 c0                	xor    eax,eax
   14000238e:	c3                   	ret
   14000238f:	cc                   	int3
   140002390:	b8 01 00 00 00       	mov    eax,0x1
   140002395:	c3                   	ret
   140002396:	cc                   	int3
   140002397:	cc                   	int3
   140002398:	b8 00 40 00 00       	mov    eax,0x4000
   14000239d:	c3                   	ret
   14000239e:	cc                   	int3
   14000239f:	cc                   	int3
   1400023a0:	48 8d 0d 39 33 00 00 	lea    rcx,[rip+0x3339]        # 0x1400056e0
   1400023a7:	48 ff 25 5a 0c 00 00 	rex.W jmp QWORD PTR [rip+0xc5a]        # 0x140003008
   1400023ae:	cc                   	int3
   1400023af:	cc                   	int3
   1400023b0:	b0 01                	mov    al,0x1
   1400023b2:	c3                   	ret
   1400023b3:	cc                   	int3
   1400023b4:	c2 00 00             	ret    0x0
   1400023b7:	cc                   	int3
   1400023b8:	48 8d 05 31 33 00 00 	lea    rax,[rip+0x3331]        # 0x1400056f0
   1400023bf:	c3                   	ret
   1400023c0:	48 8d 05 31 33 00 00 	lea    rax,[rip+0x3331]        # 0x1400056f8
   1400023c7:	c3                   	ret
   1400023c8:	48 83 ec 28          	sub    rsp,0x28
   1400023cc:	e8 e7 ff ff ff       	call   0x1400023b8
   1400023d1:	48 83 08 24          	or     QWORD PTR [rax],0x24
   1400023d5:	e8 e6 ff ff ff       	call   0x1400023c0
   1400023da:	48 83 08 02          	or     QWORD PTR [rax],0x2
   1400023de:	48 83 c4 28          	add    rsp,0x28
   1400023e2:	c3                   	ret
   1400023e3:	cc                   	int3
   1400023e4:	33 c0                	xor    eax,eax
   1400023e6:	39 05 60 2c 00 00    	cmp    DWORD PTR [rip+0x2c60],eax        # 0x14000504c
   1400023ec:	0f 94 c0             	sete   al
   1400023ef:	c3                   	ret
   1400023f0:	48 8d 05 21 33 00 00 	lea    rax,[rip+0x3321]        # 0x140005718
   1400023f7:	c3                   	ret
   1400023f8:	48 8d 05 11 33 00 00 	lea    rax,[rip+0x3311]        # 0x140005710
   1400023ff:	c3                   	ret
   140002400:	c7 05 f6 32 00 00 00 	mov    DWORD PTR [rip+0x32f6],0x0        # 0x140005700
   140002407:	00 00 00 
   14000240a:	c3                   	ret
   14000240b:	cc                   	int3
   14000240c:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002411:	55                   	push   rbp
   140002412:	48 8d ac 24 40 fb ff 	lea    rbp,[rsp-0x4c0]
   140002419:	ff 
   14000241a:	48 81 ec c0 05 00 00 	sub    rsp,0x5c0
   140002421:	8b d9                	mov    ebx,ecx
   140002423:	b9 17 00 00 00       	mov    ecx,0x17
   140002428:	ff 15 0a 0c 00 00    	call   QWORD PTR [rip+0xc0a]        # 0x140003038
   14000242e:	85 c0                	test   eax,eax
   140002430:	74 04                	je     0x140002436
   140002432:	8b cb                	mov    ecx,ebx
   140002434:	cd 29                	int    0x29
   140002436:	b9 03 00 00 00       	mov    ecx,0x3
   14000243b:	e8 c0 ff ff ff       	call   0x140002400
   140002440:	33 d2                	xor    edx,edx
   140002442:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140002446:	41 b8 d0 04 00 00    	mov    r8d,0x4d0
   14000244c:	e8 23 05 00 00       	call   0x140002974
   140002451:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140002455:	ff 15 a5 0b 00 00    	call   QWORD PTR [rip+0xba5]        # 0x140003000
   14000245b:	48 8b 9d e8 00 00 00 	mov    rbx,QWORD PTR [rbp+0xe8]
   140002462:	48 8d 95 d8 04 00 00 	lea    rdx,[rbp+0x4d8]
   140002469:	48 8b cb             	mov    rcx,rbx
   14000246c:	45 33 c0             	xor    r8d,r8d
   14000246f:	ff 15 f3 0b 00 00    	call   QWORD PTR [rip+0xbf3]        # 0x140003068
   140002475:	48 85 c0             	test   rax,rax
   140002478:	74 3f                	je     0x1400024b9
   14000247a:	48 8b 95 d8 04 00 00 	mov    rdx,QWORD PTR [rbp+0x4d8]
   140002481:	48 8d 8d e0 04 00 00 	lea    rcx,[rbp+0x4e0]
   140002488:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   14000248f:	00 00 
   140002491:	4c 8b c8             	mov    r9,rax
   140002494:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140002499:	4c 8b c3             	mov    r8,rbx
   14000249c:	48 8d 8d e8 04 00 00 	lea    rcx,[rbp+0x4e8]
   1400024a3:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   1400024a8:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1400024ac:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   1400024b1:	33 c9                	xor    ecx,ecx
   1400024b3:	ff 15 a7 0b 00 00    	call   QWORD PTR [rip+0xba7]        # 0x140003060
   1400024b9:	48 8b 85 c8 04 00 00 	mov    rax,QWORD PTR [rbp+0x4c8]
   1400024c0:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
   1400024c5:	48 89 85 e8 00 00 00 	mov    QWORD PTR [rbp+0xe8],rax
   1400024cc:	33 d2                	xor    edx,edx
   1400024ce:	48 8d 85 c8 04 00 00 	lea    rax,[rbp+0x4c8]
   1400024d5:	41 b8 98 00 00 00    	mov    r8d,0x98
   1400024db:	48 83 c0 08          	add    rax,0x8
   1400024df:	48 89 85 88 00 00 00 	mov    QWORD PTR [rbp+0x88],rax
   1400024e6:	e8 89 04 00 00       	call   0x140002974
   1400024eb:	48 8b 85 c8 04 00 00 	mov    rax,QWORD PTR [rbp+0x4c8]
   1400024f2:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   1400024f7:	c7 44 24 50 15 00 00 	mov    DWORD PTR [rsp+0x50],0x40000015
   1400024fe:	40 
   1400024ff:	c7 44 24 54 01 00 00 	mov    DWORD PTR [rsp+0x54],0x1
   140002506:	00 
   140002507:	ff 15 03 0b 00 00    	call   QWORD PTR [rip+0xb03]        # 0x140003010
   14000250d:	8b d8                	mov    ebx,eax
   14000250f:	33 c9                	xor    ecx,ecx
   140002511:	48 8d 44 24 50       	lea    rax,[rsp+0x50]
   140002516:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   14000251b:	48 8d 45 f0          	lea    rax,[rbp-0x10]
   14000251f:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140002524:	ff 15 26 0b 00 00    	call   QWORD PTR [rip+0xb26]        # 0x140003050
   14000252a:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   14000252f:	ff 15 23 0b 00 00    	call   QWORD PTR [rip+0xb23]        # 0x140003058
   140002535:	85 c0                	test   eax,eax
   140002537:	75 0d                	jne    0x140002546
   140002539:	83 fb 01             	cmp    ebx,0x1
   14000253c:	74 08                	je     0x140002546
   14000253e:	8d 48 03             	lea    ecx,[rax+0x3]
   140002541:	e8 ba fe ff ff       	call   0x140002400
   140002546:	48 8b 9c 24 d0 05 00 	mov    rbx,QWORD PTR [rsp+0x5d0]
   14000254d:	00 
   14000254e:	48 81 c4 c0 05 00 00 	add    rsp,0x5c0
   140002555:	5d                   	pop    rbp
   140002556:	c3                   	ret
   140002557:	cc                   	int3
   140002558:	e9 2f fe ff ff       	jmp    0x14000238c
   14000255d:	cc                   	int3
   14000255e:	cc                   	int3
   14000255f:	cc                   	int3
   140002560:	48 83 ec 28          	sub    rsp,0x28
   140002564:	33 c9                	xor    ecx,ecx
   140002566:	ff 15 ac 0a 00 00    	call   QWORD PTR [rip+0xaac]        # 0x140003018
   14000256c:	48 85 c0             	test   rax,rax
   14000256f:	74 3a                	je     0x1400025ab
   140002571:	b9 4d 5a 00 00       	mov    ecx,0x5a4d
   140002576:	66 39 08             	cmp    WORD PTR [rax],cx
   140002579:	75 30                	jne    0x1400025ab
   14000257b:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   14000257f:	81 3c 01 50 45 00 00 	cmp    DWORD PTR [rcx+rax*1],0x4550
   140002586:	75 23                	jne    0x1400025ab
   140002588:	ba 0b 02 00 00       	mov    edx,0x20b
   14000258d:	66 39 54 01 18       	cmp    WORD PTR [rcx+rax*1+0x18],dx
   140002592:	75 17                	jne    0x1400025ab
   140002594:	83 bc 01 84 00 00 00 	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   14000259b:	0e 
   14000259c:	76 0d                	jbe    0x1400025ab
   14000259e:	83 bc 01 f8 00 00 00 	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   1400025a5:	00 
   1400025a6:	0f 95 c0             	setne  al
   1400025a9:	eb 02                	jmp    0x1400025ad
   1400025ab:	32 c0                	xor    al,al
   1400025ad:	48 83 c4 28          	add    rsp,0x28
   1400025b1:	c3                   	ret
   1400025b2:	cc                   	int3
   1400025b3:	cc                   	int3
   1400025b4:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 0x1400025c4
   1400025bb:	48 ff 25 8e 0a 00 00 	rex.W jmp QWORD PTR [rip+0xa8e]        # 0x140003050
   1400025c2:	cc                   	int3
   1400025c3:	cc                   	int3
   1400025c4:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400025c9:	57                   	push   rdi
   1400025ca:	48 83 ec 20          	sub    rsp,0x20
   1400025ce:	48 8b 19             	mov    rbx,QWORD PTR [rcx]
   1400025d1:	48 8b f9             	mov    rdi,rcx
   1400025d4:	81 3b 63 73 6d e0    	cmp    DWORD PTR [rbx],0xe06d7363
   1400025da:	75 24                	jne    0x140002600
   1400025dc:	83 7b 18 04          	cmp    DWORD PTR [rbx+0x18],0x4
   1400025e0:	75 1e                	jne    0x140002600
   1400025e2:	8b 53 20             	mov    edx,DWORD PTR [rbx+0x20]
   1400025e5:	81 fa 20 05 93 19    	cmp    edx,0x19930520
   1400025eb:	74 20                	je     0x14000260d
   1400025ed:	8d 82 df fa 6c e6    	lea    eax,[rdx-0x19930521]
   1400025f3:	83 f8 01             	cmp    eax,0x1
   1400025f6:	76 15                	jbe    0x14000260d
   1400025f8:	81 fa 00 40 99 01    	cmp    edx,0x1994000
   1400025fe:	74 0d                	je     0x14000260d
   140002600:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002605:	33 c0                	xor    eax,eax
   140002607:	48 83 c4 20          	add    rsp,0x20
   14000260b:	5f                   	pop    rdi
   14000260c:	c3                   	ret
   14000260d:	e8 56 03 00 00       	call   0x140002968
   140002612:	48 89 18             	mov    QWORD PTR [rax],rbx
   140002615:	48 8b 5f 08          	mov    rbx,QWORD PTR [rdi+0x8]
   140002619:	e8 50 03 00 00       	call   0x14000296e
   14000261e:	48 89 18             	mov    QWORD PTR [rax],rbx
   140002621:	e8 ea 03 00 00       	call   0x140002a10
   140002626:	cc                   	int3
   140002627:	cc                   	int3
   140002628:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14000262d:	57                   	push   rdi
   14000262e:	48 83 ec 20          	sub    rsp,0x20
   140002632:	48 8d 1d 57 15 00 00 	lea    rbx,[rip+0x1557]        # 0x140003b90
   140002639:	48 8d 3d 50 15 00 00 	lea    rdi,[rip+0x1550]        # 0x140003b90
   140002640:	eb 12                	jmp    0x140002654
   140002642:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002645:	48 85 c0             	test   rax,rax
   140002648:	74 06                	je     0x140002650
   14000264a:	ff 15 28 0c 00 00    	call   QWORD PTR [rip+0xc28]        # 0x140003278
   140002650:	48 83 c3 08          	add    rbx,0x8
   140002654:	48 3b df             	cmp    rbx,rdi
   140002657:	72 e9                	jb     0x140002642
   140002659:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000265e:	48 83 c4 20          	add    rsp,0x20
   140002662:	5f                   	pop    rdi
   140002663:	c3                   	ret
   140002664:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002669:	57                   	push   rdi
   14000266a:	48 83 ec 20          	sub    rsp,0x20
   14000266e:	48 8d 1d 2b 15 00 00 	lea    rbx,[rip+0x152b]        # 0x140003ba0
   140002675:	48 8d 3d 24 15 00 00 	lea    rdi,[rip+0x1524]        # 0x140003ba0
   14000267c:	eb 12                	jmp    0x140002690
   14000267e:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002681:	48 85 c0             	test   rax,rax
   140002684:	74 06                	je     0x14000268c
   140002686:	ff 15 ec 0b 00 00    	call   QWORD PTR [rip+0xbec]        # 0x140003278
   14000268c:	48 83 c3 08          	add    rbx,0x8
   140002690:	48 3b df             	cmp    rbx,rdi
   140002693:	72 e9                	jb     0x14000267e
   140002695:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000269a:	48 83 c4 20          	add    rsp,0x20
   14000269e:	5f                   	pop    rdi
   14000269f:	c3                   	ret
   1400026a0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400026a5:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   1400026aa:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   1400026af:	57                   	push   rdi
   1400026b0:	48 83 ec 10          	sub    rsp,0x10
   1400026b4:	33 c0                	xor    eax,eax
   1400026b6:	33 c9                	xor    ecx,ecx
   1400026b8:	0f a2                	cpuid
   1400026ba:	81 f1 6e 74 65 6c    	xor    ecx,0x6c65746e
   1400026c0:	81 f2 69 6e 65 49    	xor    edx,0x49656e69
   1400026c6:	0b d1                	or     edx,ecx
   1400026c8:	8b e8                	mov    ebp,eax
   1400026ca:	b8 01 00 00 00       	mov    eax,0x1
   1400026cf:	81 f3 47 65 6e 75    	xor    ebx,0x756e6547
   1400026d5:	0b d3                	or     edx,ebx
   1400026d7:	8d 48 ff             	lea    ecx,[rax-0x1]
   1400026da:	0f a2                	cpuid
   1400026dc:	8b f9                	mov    edi,ecx
   1400026de:	75 5e                	jne    0x14000273e
   1400026e0:	25 f0 3f ff 0f       	and    eax,0xfff3ff0
   1400026e5:	48 c7 05 70 29 00 00 	mov    QWORD PTR [rip+0x2970],0x8000        # 0x140005060
   1400026ec:	00 80 00 00 
   1400026f0:	48 c7 05 6d 29 00 00 	mov    QWORD PTR [rip+0x296d],0xffffffffffffffff        # 0x140005068
   1400026f7:	ff ff ff ff 
   1400026fb:	3d c0 06 01 00       	cmp    eax,0x106c0
   140002700:	74 28                	je     0x14000272a
   140002702:	3d 60 06 02 00       	cmp    eax,0x20660
   140002707:	74 21                	je     0x14000272a
   140002709:	3d 70 06 02 00       	cmp    eax,0x20670
   14000270e:	74 1a                	je     0x14000272a
   140002710:	05 b0 f9 fc ff       	add    eax,0xfffcf9b0
   140002715:	83 f8 20             	cmp    eax,0x20
   140002718:	77 24                	ja     0x14000273e
   14000271a:	48 b9 01 00 01 00 01 	movabs rcx,0x100010001
   140002721:	00 00 00 
   140002724:	48 0f a3 c1          	bt     rcx,rax
   140002728:	73 14                	jae    0x14000273e
   14000272a:	44 8b 05 d7 2f 00 00 	mov    r8d,DWORD PTR [rip+0x2fd7]        # 0x140005708
   140002731:	41 83 c8 01          	or     r8d,0x1
   140002735:	44 89 05 cc 2f 00 00 	mov    DWORD PTR [rip+0x2fcc],r8d        # 0x140005708
   14000273c:	eb 07                	jmp    0x140002745
   14000273e:	44 8b 05 c3 2f 00 00 	mov    r8d,DWORD PTR [rip+0x2fc3]        # 0x140005708
   140002745:	45 33 c9             	xor    r9d,r9d
   140002748:	41 8b f1             	mov    esi,r9d
   14000274b:	45 8b d1             	mov    r10d,r9d
   14000274e:	45 8b d9             	mov    r11d,r9d
   140002751:	83 fd 07             	cmp    ebp,0x7
   140002754:	7c 40                	jl     0x140002796
   140002756:	41 8d 41 07          	lea    eax,[r9+0x7]
   14000275a:	33 c9                	xor    ecx,ecx
   14000275c:	0f a2                	cpuid
   14000275e:	8b f2                	mov    esi,edx
   140002760:	44 8b cb             	mov    r9d,ebx
   140002763:	0f ba e3 09          	bt     ebx,0x9
   140002767:	73 0b                	jae    0x140002774
   140002769:	41 83 c8 02          	or     r8d,0x2
   14000276d:	44 89 05 94 2f 00 00 	mov    DWORD PTR [rip+0x2f94],r8d        # 0x140005708
   140002774:	83 f8 01             	cmp    eax,0x1
   140002777:	7c 0d                	jl     0x140002786
   140002779:	b8 07 00 00 00       	mov    eax,0x7
   14000277e:	8d 48 fa             	lea    ecx,[rax-0x6]
   140002781:	0f a2                	cpuid
   140002783:	44 8b d2             	mov    r10d,edx
   140002786:	b8 24 00 00 00       	mov    eax,0x24
   14000278b:	3b e8                	cmp    ebp,eax
   14000278d:	7c 07                	jl     0x140002796
   14000278f:	33 c9                	xor    ecx,ecx
   140002791:	0f a2                	cpuid
   140002793:	44 8b db             	mov    r11d,ebx
   140002796:	48 8b 05 b3 28 00 00 	mov    rax,QWORD PTR [rip+0x28b3]        # 0x140005050
   14000279d:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
   1400027a1:	c7 05 ad 28 00 00 01 	mov    DWORD PTR [rip+0x28ad],0x1        # 0x140005058
   1400027a8:	00 00 00 
   1400027ab:	c7 05 a7 28 00 00 02 	mov    DWORD PTR [rip+0x28a7],0x2        # 0x14000505c
   1400027b2:	00 00 00 
   1400027b5:	48 89 05 94 28 00 00 	mov    QWORD PTR [rip+0x2894],rax        # 0x140005050
   1400027bc:	0f ba e7 14          	bt     edi,0x14
   1400027c0:	73 1f                	jae    0x1400027e1
   1400027c2:	48 83 e0 ef          	and    rax,0xffffffffffffffef
   1400027c6:	c7 05 88 28 00 00 02 	mov    DWORD PTR [rip+0x2888],0x2        # 0x140005058
   1400027cd:	00 00 00 
   1400027d0:	48 89 05 79 28 00 00 	mov    QWORD PTR [rip+0x2879],rax        # 0x140005050
   1400027d7:	c7 05 7b 28 00 00 06 	mov    DWORD PTR [rip+0x287b],0x6        # 0x14000505c
   1400027de:	00 00 00 
   1400027e1:	0f ba e7 1b          	bt     edi,0x1b
   1400027e5:	0f 83 33 01 00 00    	jae    0x14000291e
   1400027eb:	33 c9                	xor    ecx,ecx
   1400027ed:	0f 01 d0             	xgetbv
   1400027f0:	48 c1 e2 20          	shl    rdx,0x20
   1400027f4:	48 0b d0             	or     rdx,rax
   1400027f7:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   1400027fc:	0f ba e7 1c          	bt     edi,0x1c
   140002800:	0f 83 fc 00 00 00    	jae    0x140002902
   140002806:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   14000280b:	24 06                	and    al,0x6
   14000280d:	3c 06                	cmp    al,0x6
   14000280f:	0f 85 ed 00 00 00    	jne    0x140002902
   140002815:	8b 05 41 28 00 00    	mov    eax,DWORD PTR [rip+0x2841]        # 0x14000505c
   14000281b:	b2 e0                	mov    dl,0xe0
   14000281d:	83 c8 08             	or     eax,0x8
   140002820:	c7 05 2e 28 00 00 03 	mov    DWORD PTR [rip+0x282e],0x3        # 0x140005058
   140002827:	00 00 00 
   14000282a:	89 05 2c 28 00 00    	mov    DWORD PTR [rip+0x282c],eax        # 0x14000505c
   140002830:	41 f6 c1 20          	test   r9b,0x20
   140002834:	74 62                	je     0x140002898
   140002836:	83 c8 20             	or     eax,0x20
   140002839:	c7 05 15 28 00 00 05 	mov    DWORD PTR [rip+0x2815],0x5        # 0x140005058
   140002840:	00 00 00 
   140002843:	89 05 13 28 00 00    	mov    DWORD PTR [rip+0x2813],eax        # 0x14000505c
   140002849:	b9 00 00 03 d0       	mov    ecx,0xd0030000
   14000284e:	48 8b 05 fb 27 00 00 	mov    rax,QWORD PTR [rip+0x27fb]        # 0x140005050
   140002855:	44 23 c9             	and    r9d,ecx
   140002858:	48 83 e0 fd          	and    rax,0xfffffffffffffffd
   14000285c:	48 89 05 ed 27 00 00 	mov    QWORD PTR [rip+0x27ed],rax        # 0x140005050
   140002863:	44 3b c9             	cmp    r9d,ecx
   140002866:	75 37                	jne    0x14000289f
   140002868:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   14000286d:	22 c2                	and    al,dl
   14000286f:	3a c2                	cmp    al,dl
   140002871:	75 25                	jne    0x140002898
   140002873:	48 8b 05 d6 27 00 00 	mov    rax,QWORD PTR [rip+0x27d6]        # 0x140005050
   14000287a:	83 0d db 27 00 00 40 	or     DWORD PTR [rip+0x27db],0x40        # 0x14000505c
   140002881:	48 83 e0 db          	and    rax,0xffffffffffffffdb
   140002885:	c7 05 c9 27 00 00 06 	mov    DWORD PTR [rip+0x27c9],0x6        # 0x140005058
   14000288c:	00 00 00 
   14000288f:	48 89 05 ba 27 00 00 	mov    QWORD PTR [rip+0x27ba],rax        # 0x140005050
   140002896:	eb 07                	jmp    0x14000289f
   140002898:	48 8b 05 b1 27 00 00 	mov    rax,QWORD PTR [rip+0x27b1]        # 0x140005050
   14000289f:	0f ba e6 17          	bt     esi,0x17
   1400028a3:	73 0c                	jae    0x1400028b1
   1400028a5:	48 0f ba f0 18       	btr    rax,0x18
   1400028aa:	48 89 05 9f 27 00 00 	mov    QWORD PTR [rip+0x279f],rax        # 0x140005050
   1400028b1:	41 0f ba e2 13       	bt     r10d,0x13
   1400028b6:	73 4a                	jae    0x140002902
   1400028b8:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   1400028bd:	22 c2                	and    al,dl
   1400028bf:	3a c2                	cmp    al,dl
   1400028c1:	75 3f                	jne    0x140002902
   1400028c3:	41 8b cb             	mov    ecx,r11d
   1400028c6:	41 8b c3             	mov    eax,r11d
   1400028c9:	48 c1 e9 10          	shr    rcx,0x10
   1400028cd:	25 ff 00 04 00       	and    eax,0x400ff
   1400028d2:	83 e1 06             	and    ecx,0x6
   1400028d5:	89 05 29 2e 00 00    	mov    DWORD PTR [rip+0x2e29],eax        # 0x140005704
   1400028db:	48 81 c9 29 00 00 01 	or     rcx,0x1000029
   1400028e2:	48 f7 d1             	not    rcx
   1400028e5:	48 23 0d 64 27 00 00 	and    rcx,QWORD PTR [rip+0x2764]        # 0x140005050
   1400028ec:	48 89 0d 5d 27 00 00 	mov    QWORD PTR [rip+0x275d],rcx        # 0x140005050
   1400028f3:	3c 01                	cmp    al,0x1
   1400028f5:	76 0b                	jbe    0x140002902
   1400028f7:	48 83 e1 bf          	and    rcx,0xffffffffffffffbf
   1400028fb:	48 89 0d 4e 27 00 00 	mov    QWORD PTR [rip+0x274e],rcx        # 0x140005050
   140002902:	41 0f ba e2 15       	bt     r10d,0x15
   140002907:	73 15                	jae    0x14000291e
   140002909:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   14000290e:	48 0f ba e0 13       	bt     rax,0x13
   140002913:	73 09                	jae    0x14000291e
   140002915:	48 0f ba 35 32 27 00 	btr    QWORD PTR [rip+0x2732],0x7        # 0x140005050
   14000291c:	00 07 
   14000291e:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
   140002923:	33 c0                	xor    eax,eax
   140002925:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
   14000292a:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   14000292f:	48 83 c4 10          	add    rsp,0x10
   140002933:	5f                   	pop    rdi
   140002934:	c3                   	ret
   140002935:	cc                   	int3
   140002936:	cc                   	int3
   140002937:	cc                   	int3
   140002938:	33 c0                	xor    eax,eax
   14000293a:	39 05 30 27 00 00    	cmp    DWORD PTR [rip+0x2730],eax        # 0x140005070
   140002940:	0f 95 c0             	setne  al
   140002943:	c3                   	ret
   140002944:	cc                   	int3
   140002945:	cc                   	int3
   140002946:	cc                   	int3
   140002947:	cc                   	int3
   140002948:	cc                   	int3
   140002949:	cc                   	int3
   14000294a:	cc                   	int3
   14000294b:	cc                   	int3
   14000294c:	cc                   	int3
   14000294d:	cc                   	int3
   14000294e:	cc                   	int3
   14000294f:	cc                   	int3
   140002950:	ff 25 02 08 00 00    	jmp    QWORD PTR [rip+0x802]        # 0x140003158
   140002956:	ff 25 cc 07 00 00    	jmp    QWORD PTR [rip+0x7cc]        # 0x140003128
   14000295c:	ff 25 be 07 00 00    	jmp    QWORD PTR [rip+0x7be]        # 0x140003120
   140002962:	ff 25 a8 07 00 00    	jmp    QWORD PTR [rip+0x7a8]        # 0x140003110
   140002968:	ff 25 9a 07 00 00    	jmp    QWORD PTR [rip+0x79a]        # 0x140003108
   14000296e:	ff 25 8c 07 00 00    	jmp    QWORD PTR [rip+0x78c]        # 0x140003100
   140002974:	ff 25 c6 07 00 00    	jmp    QWORD PTR [rip+0x7c6]        # 0x140003140
   14000297a:	ff 25 00 08 00 00    	jmp    QWORD PTR [rip+0x800]        # 0x140003180
   140002980:	ff 25 f2 07 00 00    	jmp    QWORD PTR [rip+0x7f2]        # 0x140003178
   140002986:	ff 25 9c 08 00 00    	jmp    QWORD PTR [rip+0x89c]        # 0x140003228
   14000298c:	ff 25 8e 08 00 00    	jmp    QWORD PTR [rip+0x88e]        # 0x140003220
   140002992:	ff 25 08 08 00 00    	jmp    QWORD PTR [rip+0x808]        # 0x1400031a0
   140002998:	ff 25 72 08 00 00    	jmp    QWORD PTR [rip+0x872]        # 0x140003210
   14000299e:	ff 25 64 08 00 00    	jmp    QWORD PTR [rip+0x864]        # 0x140003208
   1400029a4:	ff 25 56 08 00 00    	jmp    QWORD PTR [rip+0x856]        # 0x140003200
   1400029aa:	ff 25 90 08 00 00    	jmp    QWORD PTR [rip+0x890]        # 0x140003240
   1400029b0:	ff 25 42 08 00 00    	jmp    QWORD PTR [rip+0x842]        # 0x1400031f8
   1400029b6:	ff 25 34 08 00 00    	jmp    QWORD PTR [rip+0x834]        # 0x1400031f0
   1400029bc:	ff 25 26 08 00 00    	jmp    QWORD PTR [rip+0x826]        # 0x1400031e8
   1400029c2:	ff 25 90 08 00 00    	jmp    QWORD PTR [rip+0x890]        # 0x140003258
   1400029c8:	ff 25 0a 08 00 00    	jmp    QWORD PTR [rip+0x80a]        # 0x1400031d8
   1400029ce:	ff 25 fc 07 00 00    	jmp    QWORD PTR [rip+0x7fc]        # 0x1400031d0
   1400029d4:	ff 25 5e 08 00 00    	jmp    QWORD PTR [rip+0x85e]        # 0x140003238
   1400029da:	ff 25 50 08 00 00    	jmp    QWORD PTR [rip+0x850]        # 0x140003230
   1400029e0:	ff 25 32 08 00 00    	jmp    QWORD PTR [rip+0x832]        # 0x140003218
   1400029e6:	ff 25 a4 07 00 00    	jmp    QWORD PTR [rip+0x7a4]        # 0x140003190
   1400029ec:	ff 25 76 07 00 00    	jmp    QWORD PTR [rip+0x776]        # 0x140003168
   1400029f2:	ff 25 58 08 00 00    	jmp    QWORD PTR [rip+0x858]        # 0x140003250
   1400029f8:	ff 25 72 07 00 00    	jmp    QWORD PTR [rip+0x772]        # 0x140003170
   1400029fe:	ff 25 c4 07 00 00    	jmp    QWORD PTR [rip+0x7c4]        # 0x1400031c8
   140002a04:	ff 25 b6 07 00 00    	jmp    QWORD PTR [rip+0x7b6]        # 0x1400031c0
   140002a0a:	ff 25 a8 07 00 00    	jmp    QWORD PTR [rip+0x7a8]        # 0x1400031b8
   140002a10:	ff 25 9a 07 00 00    	jmp    QWORD PTR [rip+0x79a]        # 0x1400031b0
   140002a16:	cc                   	int3
   140002a17:	cc                   	int3
   140002a18:	48 8b c4             	mov    rax,rsp
   140002a1b:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
   140002a1f:	48 89 68 10          	mov    QWORD PTR [rax+0x10],rbp
   140002a23:	48 89 70 18          	mov    QWORD PTR [rax+0x18],rsi
   140002a27:	48 89 78 20          	mov    QWORD PTR [rax+0x20],rdi
   140002a2b:	41 56                	push   r14
   140002a2d:	48 83 ec 20          	sub    rsp,0x20
   140002a31:	49 8b 59 38          	mov    rbx,QWORD PTR [r9+0x38]
   140002a35:	48 8b f2             	mov    rsi,rdx
   140002a38:	4d 8b f0             	mov    r14,r8
   140002a3b:	48 8b e9             	mov    rbp,rcx
   140002a3e:	49 8b d1             	mov    rdx,r9
   140002a41:	48 8b ce             	mov    rcx,rsi
   140002a44:	49 8b f9             	mov    rdi,r9
   140002a47:	4c 8d 43 04          	lea    r8,[rbx+0x4]
   140002a4b:	e8 48 00 00 00       	call   0x140002a98
   140002a50:	8b 45 04             	mov    eax,DWORD PTR [rbp+0x4]
   140002a53:	24 66                	and    al,0x66
   140002a55:	f6 d8                	neg    al
   140002a57:	b8 01 00 00 00       	mov    eax,0x1
   140002a5c:	45 1b c9             	sbb    r9d,r9d
   140002a5f:	41 f7 d9             	neg    r9d
   140002a62:	44 03 c8             	add    r9d,eax
   140002a65:	44 85 4b 04          	test   DWORD PTR [rbx+0x4],r9d
   140002a69:	74 11                	je     0x140002a7c
   140002a6b:	4c 8b cf             	mov    r9,rdi
   140002a6e:	4d 8b c6             	mov    r8,r14
   140002a71:	48 8b d6             	mov    rdx,rsi
   140002a74:	48 8b cd             	mov    rcx,rbp
   140002a77:	e8 d4 fe ff ff       	call   0x140002950
   140002a7c:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002a81:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
   140002a86:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140002a8b:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
   140002a90:	48 83 c4 20          	add    rsp,0x20
   140002a94:	41 5e                	pop    r14
   140002a96:	c3                   	ret
   140002a97:	cc                   	int3
   140002a98:	40 53                	rex push rbx
   140002a9a:	45 8b 18             	mov    r11d,DWORD PTR [r8]
   140002a9d:	48 8b da             	mov    rbx,rdx
   140002aa0:	41 83 e3 f8          	and    r11d,0xfffffff8
   140002aa4:	4c 8b c9             	mov    r9,rcx
   140002aa7:	41 f6 00 04          	test   BYTE PTR [r8],0x4
   140002aab:	4c 8b d1             	mov    r10,rcx
   140002aae:	74 13                	je     0x140002ac3
   140002ab0:	41 8b 40 08          	mov    eax,DWORD PTR [r8+0x8]
   140002ab4:	4d 63 50 04          	movsxd r10,DWORD PTR [r8+0x4]
   140002ab8:	f7 d8                	neg    eax
   140002aba:	4c 03 d1             	add    r10,rcx
   140002abd:	48 63 c8             	movsxd rcx,eax
   140002ac0:	4c 23 d1             	and    r10,rcx
   140002ac3:	49 63 c3             	movsxd rax,r11d
   140002ac6:	4a 8b 14 10          	mov    rdx,QWORD PTR [rax+r10*1]
   140002aca:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
   140002ace:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
   140002ad1:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140002ad5:	f6 44 01 03 0f       	test   BYTE PTR [rcx+rax*1+0x3],0xf
   140002ada:	74 10                	je     0x140002aec
   140002adc:	0f b6 44 01 03       	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140002ae1:	b9 f0 ff ff ff       	mov    ecx,0xfffffff0
   140002ae6:	48 23 c1             	and    rax,rcx
   140002ae9:	4c 03 c8             	add    r9,rax
   140002aec:	4c 33 ca             	xor    r9,rdx
   140002aef:	49 8b c9             	mov    rcx,r9
   140002af2:	5b                   	pop    rbx
   140002af3:	e9 d8 f0 ff ff       	jmp    0x140001bd0
   140002af8:	ff 25 3a 06 00 00    	jmp    QWORD PTR [rip+0x63a]        # 0x140003138
   140002afe:	ff 25 14 06 00 00    	jmp    QWORD PTR [rip+0x614]        # 0x140003118
   140002b04:	cc                   	int3
   140002b05:	cc                   	int3
   140002b06:	cc                   	int3
   140002b07:	cc                   	int3
   140002b08:	cc                   	int3
   140002b09:	cc                   	int3
   140002b0a:	cc                   	int3
   140002b0b:	cc                   	int3
   140002b0c:	cc                   	int3
   140002b0d:	cc                   	int3
   140002b0e:	cc                   	int3
   140002b0f:	cc                   	int3
   140002b10:	cc                   	int3
   140002b11:	cc                   	int3
   140002b12:	cc                   	int3
   140002b13:	cc                   	int3
   140002b14:	cc                   	int3
   140002b15:	cc                   	int3
   140002b16:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140002b1d:	00 00 00 
   140002b20:	ff e0                	jmp    rax
   140002b22:	cc                   	int3
   140002b23:	cc                   	int3
   140002b24:	cc                   	int3
   140002b25:	cc                   	int3
   140002b26:	cc                   	int3
   140002b27:	cc                   	int3
   140002b28:	cc                   	int3
   140002b29:	cc                   	int3
   140002b2a:	cc                   	int3
   140002b2b:	cc                   	int3
   140002b2c:	cc                   	int3
   140002b2d:	cc                   	int3
   140002b2e:	cc                   	int3
   140002b2f:	cc                   	int3
   140002b30:	cc                   	int3
   140002b31:	cc                   	int3
   140002b32:	cc                   	int3
   140002b33:	cc                   	int3
   140002b34:	cc                   	int3
   140002b35:	cc                   	int3
   140002b36:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140002b3d:	00 00 00 
   140002b40:	ff 25 32 07 00 00    	jmp    QWORD PTR [rip+0x732]        # 0x140003278
   140002b46:	cc                   	int3
   140002b47:	cc                   	int3
   140002b48:	cc                   	int3
   140002b49:	cc                   	int3
   140002b4a:	cc                   	int3
   140002b4b:	cc                   	int3
   140002b4c:	cc                   	int3
   140002b4d:	cc                   	int3
   140002b4e:	cc                   	int3
   140002b4f:	cc                   	int3
   140002b50:	48 8d 8a 48 00 00 00 	lea    rcx,[rdx+0x48]
   140002b57:	e9 b4 eb ff ff       	jmp    0x140001710
   140002b5c:	48 8d 8a 78 00 00 00 	lea    rcx,[rdx+0x78]
   140002b63:	e9 18 ec ff ff       	jmp    0x140001780
   140002b68:	48 8d 8a 60 00 00 00 	lea    rcx,[rdx+0x60]
   140002b6f:	e9 9c eb ff ff       	jmp    0x140001710
   140002b74:	cc                   	int3
   140002b75:	cc                   	int3
   140002b76:	cc                   	int3
   140002b77:	cc                   	int3
   140002b78:	cc                   	int3
   140002b79:	cc                   	int3
   140002b7a:	cc                   	int3
   140002b7b:	cc                   	int3
   140002b7c:	cc                   	int3
   140002b7d:	cc                   	int3
   140002b7e:	cc                   	int3
   140002b7f:	cc                   	int3
   140002b80:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   140002b87:	e9 04 f0 ff ff       	jmp    0x140001b90
   140002b8c:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   140002b93:	e9 88 ef ff ff       	jmp    0x140001b20
   140002b98:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   140002b9d:	55                   	push   rbp
   140002b9e:	48 83 ec 20          	sub    rsp,0x20
   140002ba2:	48 8b ea             	mov    rbp,rdx
   140002ba5:	48 8b 55 60          	mov    rdx,QWORD PTR [rbp+0x60]
   140002ba9:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140002bac:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140002bb0:	48 03 ca             	add    rcx,rdx
   140002bb3:	41 b0 01             	mov    r8b,0x1
   140002bb6:	ba 04 00 00 00       	mov    edx,0x4
   140002bbb:	ff 15 d7 04 00 00    	call   QWORD PTR [rip+0x4d7]        # 0x140003098
   140002bc1:	90                   	nop
   140002bc2:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140002bc9:	00 00 00 
   140002bcc:	48 83 c4 20          	add    rsp,0x20
   140002bd0:	5d                   	pop    rbp
   140002bd1:	c3                   	ret
   140002bd2:	cc                   	int3
   140002bd3:	cc                   	int3
   140002bd4:	cc                   	int3
   140002bd5:	cc                   	int3
   140002bd6:	cc                   	int3
   140002bd7:	cc                   	int3
   140002bd8:	cc                   	int3
   140002bd9:	cc                   	int3
   140002bda:	cc                   	int3
   140002bdb:	cc                   	int3
   140002bdc:	cc                   	int3
   140002bdd:	cc                   	int3
   140002bde:	cc                   	int3
   140002bdf:	cc                   	int3
   140002be0:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140002be7:	e9 a4 ef ff ff       	jmp    0x140001b90
   140002bec:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140002bf3:	e9 68 ef ff ff       	jmp    0x140001b60
   140002bf8:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   140002bfd:	55                   	push   rbp
   140002bfe:	48 83 ec 20          	sub    rsp,0x20
   140002c02:	48 8b ea             	mov    rbp,rdx
   140002c05:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140002c09:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140002c0c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140002c10:	48 03 ca             	add    rcx,rdx
   140002c13:	41 b0 01             	mov    r8b,0x1
   140002c16:	ba 04 00 00 00       	mov    edx,0x4
   140002c1b:	ff 15 77 04 00 00    	call   QWORD PTR [rip+0x477]        # 0x140003098
   140002c21:	90                   	nop
   140002c22:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140002c29:	00 00 00 
   140002c2c:	48 83 c4 20          	add    rsp,0x20
   140002c30:	5d                   	pop    rbp
   140002c31:	c3                   	ret
   140002c32:	cc                   	int3
   140002c33:	40 55                	rex push rbp
   140002c35:	48 83 ec 20          	sub    rsp,0x20
   140002c39:	48 8b ea             	mov    rbp,rdx
   140002c3c:	48 8b d1             	mov    rdx,rcx
   140002c3f:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140002c42:	8b 09                	mov    ecx,DWORD PTR [rcx]
   140002c44:	e8 3d fd ff ff       	call   0x140002986
   140002c49:	90                   	nop
   140002c4a:	48 83 c4 20          	add    rsp,0x20
   140002c4e:	5d                   	pop    rbp
   140002c4f:	c3                   	ret
   140002c50:	cc                   	int3
   140002c51:	40 55                	rex push rbp
   140002c53:	48 8b ea             	mov    rbp,rdx
   140002c56:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140002c59:	33 c9                	xor    ecx,ecx
   140002c5b:	81 38 05 00 00 c0    	cmp    DWORD PTR [rax],0xc0000005
   140002c61:	0f 94 c1             	sete   cl
   140002c64:	8b c1                	mov    eax,ecx
   140002c66:	5d                   	pop    rbp
   140002c67:	c3                   	ret
   140002c68:	cc                   	int3
