
original/level1.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	48 8d 0d 91 1d 00 00 	lea    rcx,[rip+0x1d91]        # 0x140002d98
   140001007:	e9 20 12 00 00       	jmp    0x14000222c
   14000100c:	cc                   	int3
   14000100d:	cc                   	int3
   14000100e:	cc                   	int3
   14000100f:	cc                   	int3
   140001010:	40 53                	rex push rbx
   140001012:	48 83 ec 20          	sub    rsp,0x20
   140001016:	48 8b d9             	mov    rbx,rcx
   140001019:	48 8b c2             	mov    rax,rdx
   14000101c:	48 8d 0d 65 23 00 00 	lea    rcx,[rip+0x2365]        # 0x140003388
   140001023:	0f 57 c0             	xorps  xmm0,xmm0
   140001026:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000102a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000102d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001031:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001034:	ff 15 3e 21 00 00    	call   QWORD PTR [rip+0x213e]        # 0x140003178
   14000103a:	48 8b c3             	mov    rax,rbx
   14000103d:	48 83 c4 20          	add    rsp,0x20
   140001041:	5b                   	pop    rbx
   140001042:	c3                   	ret
   140001043:	cc                   	int3
   140001044:	cc                   	int3
   140001045:	cc                   	int3
   140001046:	cc                   	int3
   140001047:	cc                   	int3
   140001048:	cc                   	int3
   140001049:	cc                   	int3
   14000104a:	cc                   	int3
   14000104b:	cc                   	int3
   14000104c:	cc                   	int3
   14000104d:	cc                   	int3
   14000104e:	cc                   	int3
   14000104f:	cc                   	int3
   140001050:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   140001054:	48 8d 05 7d 23 00 00 	lea    rax,[rip+0x237d]        # 0x1400033d8
   14000105b:	48 85 d2             	test   rdx,rdx
   14000105e:	48 0f 45 c2          	cmovne rax,rdx
   140001062:	c3                   	ret
   140001063:	cc                   	int3
   140001064:	cc                   	int3
   140001065:	cc                   	int3
   140001066:	cc                   	int3
   140001067:	cc                   	int3
   140001068:	cc                   	int3
   140001069:	cc                   	int3
   14000106a:	cc                   	int3
   14000106b:	cc                   	int3
   14000106c:	cc                   	int3
   14000106d:	cc                   	int3
   14000106e:	cc                   	int3
   14000106f:	cc                   	int3
   140001070:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140001075:	57                   	push   rdi
   140001076:	48 83 ec 20          	sub    rsp,0x20
   14000107a:	48 8d 05 07 23 00 00 	lea    rax,[rip+0x2307]        # 0x140003388
   140001081:	48 8b f9             	mov    rdi,rcx
   140001084:	48 89 01             	mov    QWORD PTR [rcx],rax
   140001087:	8b da                	mov    ebx,edx
   140001089:	48 83 c1 08          	add    rcx,0x8
   14000108d:	ff 15 ed 20 00 00    	call   QWORD PTR [rip+0x20ed]        # 0x140003180
   140001093:	f6 c3 01             	test   bl,0x1
   140001096:	74 0d                	je     0x1400010a5
   140001098:	ba 18 00 00 00       	mov    edx,0x18
   14000109d:	48 8b cf             	mov    rcx,rdi
   1400010a0:	e8 b7 0c 00 00       	call   0x140001d5c
   1400010a5:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400010aa:	48 8b c7             	mov    rax,rdi
   1400010ad:	48 83 c4 20          	add    rsp,0x20
   1400010b1:	5f                   	pop    rdi
   1400010b2:	c3                   	ret
   1400010b3:	cc                   	int3
   1400010b4:	cc                   	int3
   1400010b5:	cc                   	int3
   1400010b6:	cc                   	int3
   1400010b7:	cc                   	int3
   1400010b8:	cc                   	int3
   1400010b9:	cc                   	int3
   1400010ba:	cc                   	int3
   1400010bb:	cc                   	int3
   1400010bc:	cc                   	int3
   1400010bd:	cc                   	int3
   1400010be:	cc                   	int3
   1400010bf:	cc                   	int3
   1400010c0:	48 8d 05 c1 22 00 00 	lea    rax,[rip+0x22c1]        # 0x140003388
   1400010c7:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010ca:	48 83 c1 08          	add    rcx,0x8
   1400010ce:	48 ff 25 ab 20 00 00 	rex.W jmp QWORD PTR [rip+0x20ab]        # 0x140003180
   1400010d5:	cc                   	int3
   1400010d6:	cc                   	int3
   1400010d7:	cc                   	int3
   1400010d8:	cc                   	int3
   1400010d9:	cc                   	int3
   1400010da:	cc                   	int3
   1400010db:	cc                   	int3
   1400010dc:	cc                   	int3
   1400010dd:	cc                   	int3
   1400010de:	cc                   	int3
   1400010df:	cc                   	int3
   1400010e0:	48 8d 05 09 23 00 00 	lea    rax,[rip+0x2309]        # 0x1400033f0
   1400010e7:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   1400010ee:	00 
   1400010ef:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   1400010f3:	48 8d 05 ce 22 00 00 	lea    rax,[rip+0x22ce]        # 0x1400033c8
   1400010fa:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010fd:	48 8b c1             	mov    rax,rcx
   140001100:	c3                   	ret
   140001101:	cc                   	int3
   140001102:	cc                   	int3
   140001103:	cc                   	int3
   140001104:	cc                   	int3
   140001105:	cc                   	int3
   140001106:	cc                   	int3
   140001107:	cc                   	int3
   140001108:	cc                   	int3
   140001109:	cc                   	int3
   14000110a:	cc                   	int3
   14000110b:	cc                   	int3
   14000110c:	cc                   	int3
   14000110d:	cc                   	int3
   14000110e:	cc                   	int3
   14000110f:	cc                   	int3
   140001110:	48 83 ec 48          	sub    rsp,0x48
   140001114:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001119:	e8 c2 ff ff ff       	call   0x1400010e0
   14000111e:	48 8d 15 93 30 00 00 	lea    rdx,[rip+0x3093]        # 0x1400041b8
   140001125:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000112a:	e8 63 19 00 00       	call   0x140002a92
   14000112f:	cc                   	int3
   140001130:	40 53                	rex push rbx
   140001132:	48 83 ec 20          	sub    rsp,0x20
   140001136:	48 8b d9             	mov    rbx,rcx
   140001139:	48 8b c2             	mov    rax,rdx
   14000113c:	48 8d 0d 45 22 00 00 	lea    rcx,[rip+0x2245]        # 0x140003388
   140001143:	0f 57 c0             	xorps  xmm0,xmm0
   140001146:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000114a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000114d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001151:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001154:	ff 15 1e 20 00 00    	call   QWORD PTR [rip+0x201e]        # 0x140003178
   14000115a:	48 8d 05 67 22 00 00 	lea    rax,[rip+0x2267]        # 0x1400033c8
   140001161:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001164:	48 8b c3             	mov    rax,rbx
   140001167:	48 83 c4 20          	add    rsp,0x20
   14000116b:	5b                   	pop    rbx
   14000116c:	c3                   	ret
   14000116d:	cc                   	int3
   14000116e:	cc                   	int3
   14000116f:	cc                   	int3
   140001170:	40 53                	rex push rbx
   140001172:	48 83 ec 20          	sub    rsp,0x20
   140001176:	48 8b d9             	mov    rbx,rcx
   140001179:	48 8b c2             	mov    rax,rdx
   14000117c:	48 8d 0d 05 22 00 00 	lea    rcx,[rip+0x2205]        # 0x140003388
   140001183:	0f 57 c0             	xorps  xmm0,xmm0
   140001186:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000118a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000118d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001191:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001194:	ff 15 de 1f 00 00    	call   QWORD PTR [rip+0x1fde]        # 0x140003178
   14000119a:	48 8d 05 ff 21 00 00 	lea    rax,[rip+0x21ff]        # 0x1400033a0
   1400011a1:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400011a4:	48 8b c3             	mov    rax,rbx
   1400011a7:	48 83 c4 20          	add    rsp,0x20
   1400011ab:	5b                   	pop    rbx
   1400011ac:	c3                   	ret
   1400011ad:	cc                   	int3
   1400011ae:	cc                   	int3
   1400011af:	cc                   	int3
   1400011b0:	48 83 ec 28          	sub    rsp,0x28
   1400011b4:	48 8d 0d 4d 22 00 00 	lea    rcx,[rip+0x224d]        # 0x140003408
   1400011bb:	ff 15 77 1f 00 00    	call   QWORD PTR [rip+0x1f77]        # 0x140003138
   1400011c1:	cc                   	int3
   1400011c2:	cc                   	int3
   1400011c3:	cc                   	int3
   1400011c4:	cc                   	int3
   1400011c5:	cc                   	int3
   1400011c6:	cc                   	int3
   1400011c7:	cc                   	int3
   1400011c8:	cc                   	int3
   1400011c9:	cc                   	int3
   1400011ca:	cc                   	int3
   1400011cb:	cc                   	int3
   1400011cc:	cc                   	int3
   1400011cd:	cc                   	int3
   1400011ce:	cc                   	int3
   1400011cf:	cc                   	int3
   1400011d0:	48 8d 05 41 22 00 00 	lea    rax,[rip+0x2241]        # 0x140003418
   1400011d7:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   1400011de:	00 
   1400011df:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   1400011e3:	48 8d 05 fe 22 00 00 	lea    rax,[rip+0x22fe]        # 0x1400034e8
   1400011ea:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400011ed:	48 8b c1             	mov    rax,rcx
   1400011f0:	c3                   	ret
   1400011f1:	cc                   	int3
   1400011f2:	cc                   	int3
   1400011f3:	cc                   	int3
   1400011f4:	cc                   	int3
   1400011f5:	cc                   	int3
   1400011f6:	cc                   	int3
   1400011f7:	cc                   	int3
   1400011f8:	cc                   	int3
   1400011f9:	cc                   	int3
   1400011fa:	cc                   	int3
   1400011fb:	cc                   	int3
   1400011fc:	cc                   	int3
   1400011fd:	cc                   	int3
   1400011fe:	cc                   	int3
   1400011ff:	cc                   	int3
   140001200:	48 83 ec 48          	sub    rsp,0x48
   140001204:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001209:	e8 c2 ff ff ff       	call   0x1400011d0
   14000120e:	48 8d 15 e3 2e 00 00 	lea    rdx,[rip+0x2ee3]        # 0x1400040f8
   140001215:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000121a:	e8 73 18 00 00       	call   0x140002a92
   14000121f:	cc                   	int3
   140001220:	40 53                	rex push rbx
   140001222:	48 83 ec 20          	sub    rsp,0x20
   140001226:	48 8b d9             	mov    rbx,rcx
   140001229:	48 8b c2             	mov    rax,rdx
   14000122c:	48 8d 0d 55 21 00 00 	lea    rcx,[rip+0x2155]        # 0x140003388
   140001233:	0f 57 c0             	xorps  xmm0,xmm0
   140001236:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000123a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000123d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001241:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001244:	ff 15 2e 1f 00 00    	call   QWORD PTR [rip+0x1f2e]        # 0x140003178
   14000124a:	48 8d 05 97 22 00 00 	lea    rax,[rip+0x2297]        # 0x1400034e8
   140001251:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001254:	48 8b c3             	mov    rax,rbx
   140001257:	48 83 c4 20          	add    rsp,0x20
   14000125b:	5b                   	pop    rbx
   14000125c:	c3                   	ret
   14000125d:	cc                   	int3
   14000125e:	cc                   	int3
   14000125f:	cc                   	int3
   140001260:	48 83 ec 28          	sub    rsp,0x28
   140001264:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
   140001268:	48 85 c9             	test   rcx,rcx
   14000126b:	74 20                	je     0x14000128d
   14000126d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001270:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001273:	48 85 c0             	test   rax,rax
   140001276:	74 15                	je     0x14000128d
   140001278:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14000127b:	ba 01 00 00 00       	mov    edx,0x1
   140001280:	4c 8b 01             	mov    r8,QWORD PTR [rcx]
   140001283:	48 8b c8             	mov    rcx,rax
   140001286:	48 83 c4 28          	add    rsp,0x28
   14000128a:	49 ff e0             	rex.WB jmp r8
   14000128d:	48 83 c4 28          	add    rsp,0x28
   140001291:	c3                   	ret
   140001292:	cc                   	int3
   140001293:	cc                   	int3
   140001294:	cc                   	int3
   140001295:	cc                   	int3
   140001296:	cc                   	int3
   140001297:	cc                   	int3
   140001298:	cc                   	int3
   140001299:	cc                   	int3
   14000129a:	cc                   	int3
   14000129b:	cc                   	int3
   14000129c:	cc                   	int3
   14000129d:	cc                   	int3
   14000129e:	cc                   	int3
   14000129f:	cc                   	int3
   1400012a0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400012a5:	57                   	push   rdi
   1400012a6:	48 83 ec 60          	sub    rsp,0x60
   1400012aa:	48 8b 05 8f 3d 00 00 	mov    rax,QWORD PTR [rip+0x3d8f]        # 0x140005040
   1400012b1:	48 33 c4             	xor    rax,rsp
   1400012b4:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   1400012b9:	48 8d 0d 68 21 00 00 	lea    rcx,[rip+0x2168]        # 0x140003428
   1400012c0:	ff 15 3a 1d 00 00    	call   QWORD PTR [rip+0x1d3a]        # 0x140003000
   1400012c6:	48 8d 15 73 21 00 00 	lea    rdx,[rip+0x2173]        # 0x140003440
   1400012cd:	48 8b 0d 24 1e 00 00 	mov    rcx,QWORD PTR [rip+0x1e24]        # 0x1400030f8
   1400012d4:	e8 17 03 00 00       	call   0x1400015f0
   1400012d9:	48 8b c8             	mov    rcx,rax
   1400012dc:	48 8d 15 ed 04 00 00 	lea    rdx,[rip+0x4ed]        # 0x1400017d0
   1400012e3:	ff 15 d7 1d 00 00    	call   QWORD PTR [rip+0x1dd7]        # 0x1400030c0
   1400012e9:	48 8d 15 70 21 00 00 	lea    rdx,[rip+0x2170]        # 0x140003460
   1400012f0:	48 8b 0d 01 1e 00 00 	mov    rcx,QWORD PTR [rip+0x1e01]        # 0x1400030f8
   1400012f7:	e8 f4 02 00 00       	call   0x1400015f0
   1400012fc:	48 8b c8             	mov    rcx,rax
   1400012ff:	48 8d 15 ca 04 00 00 	lea    rdx,[rip+0x4ca]        # 0x1400017d0
   140001306:	ff 15 b4 1d 00 00    	call   QWORD PTR [rip+0x1db4]        # 0x1400030c0
   14000130c:	48 8d 15 2d 21 00 00 	lea    rdx,[rip+0x212d]        # 0x140003440
   140001313:	48 8b 0d de 1d 00 00 	mov    rcx,QWORD PTR [rip+0x1dde]        # 0x1400030f8
   14000131a:	e8 d1 02 00 00       	call   0x1400015f0
   14000131f:	48 8b c8             	mov    rcx,rax
   140001322:	48 8d 15 a7 04 00 00 	lea    rdx,[rip+0x4a7]        # 0x1400017d0
   140001329:	ff 15 91 1d 00 00    	call   QWORD PTR [rip+0x1d91]        # 0x1400030c0
   14000132f:	48 8d 15 4a 21 00 00 	lea    rdx,[rip+0x214a]        # 0x140003480
   140001336:	48 8b 0d bb 1d 00 00 	mov    rcx,QWORD PTR [rip+0x1dbb]        # 0x1400030f8
   14000133d:	e8 ae 02 00 00       	call   0x1400015f0
   140001342:	0f 57 c0             	xorps  xmm0,xmm0
   140001345:	0f 11 44 24 30       	movups XMMWORD PTR [rsp+0x30],xmm0
   14000134a:	66 0f 6f 0d ae 21 00 	movdqa xmm1,XMMWORD PTR [rip+0x21ae]        # 0x140003500
   140001351:	00 
   140001352:	f3 0f 7f 4c 24 40    	movdqu XMMWORD PTR [rsp+0x40],xmm1
   140001358:	c6 44 24 30 00       	mov    BYTE PTR [rsp+0x30],0x0
   14000135d:	48 8d 54 24 30       	lea    rdx,[rsp+0x30]
   140001362:	48 8b 0d af 1d 00 00 	mov    rcx,QWORD PTR [rip+0x1daf]        # 0x140003118
   140001369:	e8 a2 04 00 00       	call   0x140001810
   14000136e:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
   140001373:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140001378:	48 83 7c 24 40 08    	cmp    QWORD PTR [rsp+0x40],0x8
   14000137e:	74 09                	je     0x140001389
   140001380:	48 8d 15 09 21 00 00 	lea    rdx,[rip+0x2109]        # 0x140003490
   140001387:	eb 67                	jmp    0x1400013f0
   140001389:	33 d2                	xor    edx,edx
   14000138b:	4c 8d 05 6e ec ff ff 	lea    r8,[rip+0xffffffffffffec6e]        # 0x140000000
   140001392:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001396:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000139d:	00 00 00 
   1400013a0:	32 c9                	xor    cl,cl
   1400013a2:	41 8b 84 90 84 14 00 	mov    eax,DWORD PTR [r8+rdx*4+0x1484]
   1400013a9:	00 
   1400013aa:	49 03 c0             	add    rax,r8
   1400013ad:	ff e0                	jmp    rax
   1400013af:	b1 41                	mov    cl,0x41
   1400013b1:	eb 12                	jmp    0x1400013c5
   1400013b3:	b1 47                	mov    cl,0x47
   1400013b5:	eb 0e                	jmp    0x1400013c5
   1400013b7:	b1 49                	mov    cl,0x49
   1400013b9:	eb 0a                	jmp    0x1400013c5
   1400013bb:	b1 54                	mov    cl,0x54
   1400013bd:	eb 06                	jmp    0x1400013c5
   1400013bf:	b1 4f                	mov    cl,0x4f
   1400013c1:	eb 02                	jmp    0x1400013c5
   1400013c3:	b1 52                	mov    cl,0x52
   1400013c5:	48 8d 44 24 30       	lea    rax,[rsp+0x30]
   1400013ca:	48 83 ff 0f          	cmp    rdi,0xf
   1400013ce:	48 0f 47 c3          	cmova  rax,rbx
   1400013d2:	38 0c 10             	cmp    BYTE PTR [rax+rdx*1],cl
   1400013d5:	75 12                	jne    0x1400013e9
   1400013d7:	48 ff c2             	inc    rdx
   1400013da:	48 83 fa 08          	cmp    rdx,0x8
   1400013de:	72 c0                	jb     0x1400013a0
   1400013e0:	48 8d 15 c9 20 00 00 	lea    rdx,[rip+0x20c9]        # 0x1400034b0
   1400013e7:	eb 07                	jmp    0x1400013f0
   1400013e9:	48 8d 15 d0 20 00 00 	lea    rdx,[rip+0x20d0]        # 0x1400034c0
   1400013f0:	48 8b 0d 01 1d 00 00 	mov    rcx,QWORD PTR [rip+0x1d01]        # 0x1400030f8
   1400013f7:	e8 f4 01 00 00       	call   0x1400015f0
   1400013fc:	48 8d 15 cd 03 00 00 	lea    rdx,[rip+0x3cd]        # 0x1400017d0
   140001403:	48 8b c8             	mov    rcx,rax
   140001406:	ff 15 b4 1c 00 00    	call   QWORD PTR [rip+0x1cb4]        # 0x1400030c0
   14000140c:	48 8d 0d 91 20 00 00 	lea    rcx,[rip+0x2091]        # 0x1400034a4
   140001413:	ff 15 6f 1e 00 00    	call   QWORD PTR [rip+0x1e6f]        # 0x140003288
   140001419:	90                   	nop
   14000141a:	48 83 ff 0f          	cmp    rdi,0xf
   14000141e:	76 47                	jbe    0x140001467
   140001420:	48 8d 57 01          	lea    rdx,[rdi+0x1]
   140001424:	48 8b c3             	mov    rax,rbx
   140001427:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14000142e:	72 2f                	jb     0x14000145f
   140001430:	48 83 c2 27          	add    rdx,0x27
   140001434:	48 8b 5b f8          	mov    rbx,QWORD PTR [rbx-0x8]
   140001438:	48 2b c3             	sub    rax,rbx
   14000143b:	48 83 e8 08          	sub    rax,0x8
   14000143f:	48 83 f8 1f          	cmp    rax,0x1f
   140001443:	76 1a                	jbe    0x14000145f
   140001445:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   14000144c:	00 00 
   14000144e:	45 33 c9             	xor    r9d,r9d
   140001451:	45 33 c0             	xor    r8d,r8d
   140001454:	33 d2                	xor    edx,edx
   140001456:	33 c9                	xor    ecx,ecx
   140001458:	ff 15 ca 1d 00 00    	call   QWORD PTR [rip+0x1dca]        # 0x140003228
   14000145e:	cc                   	int3
   14000145f:	48 8b cb             	mov    rcx,rbx
   140001462:	e8 f5 08 00 00       	call   0x140001d5c
   140001467:	33 c0                	xor    eax,eax
   140001469:	48 8b 4c 24 50       	mov    rcx,QWORD PTR [rsp+0x50]
   14000146e:	48 33 cc             	xor    rcx,rsp
   140001471:	e8 8a 08 00 00       	call   0x140001d00
   140001476:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   14000147b:	48 83 c4 60          	add    rsp,0x60
   14000147f:	5f                   	pop    rdi
   140001480:	c3                   	ret
   140001481:	0f 1f 00             	nop    DWORD PTR [rax]
   140001484:	af                   	scas   eax,DWORD PTR [rdi]
   140001485:	13 00                	adc    eax,DWORD PTR [rax]
   140001487:	00 b3 13 00 00 b7    	add    BYTE PTR [rbx-0x48ffffed],dh
   14000148d:	13 00                	adc    eax,DWORD PTR [rax]
   14000148f:	00 b3 13 00 00 af    	add    BYTE PTR [rbx-0x50ffffed],dh
   140001495:	13 00                	adc    eax,DWORD PTR [rax]
   140001497:	00 bb 13 00 00 bf    	add    BYTE PTR [rbx-0x40ffffed],bh
   14000149d:	13 00                	adc    eax,DWORD PTR [rax]
   14000149f:	00 c3                	add    bl,al
   1400014a1:	13 00                	adc    eax,DWORD PTR [rax]
   1400014a3:	00 cc                	add    ah,cl
   1400014a5:	cc                   	int3
   1400014a6:	cc                   	int3
   1400014a7:	cc                   	int3
   1400014a8:	cc                   	int3
   1400014a9:	cc                   	int3
   1400014aa:	cc                   	int3
   1400014ab:	cc                   	int3
   1400014ac:	cc                   	int3
   1400014ad:	cc                   	int3
   1400014ae:	cc                   	int3
   1400014af:	cc                   	int3
   1400014b0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400014b5:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   1400014ba:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   1400014bf:	57                   	push   rdi
   1400014c0:	48 83 ec 40          	sub    rsp,0x40
   1400014c4:	48 8b 05 75 3b 00 00 	mov    rax,QWORD PTR [rip+0x3b75]        # 0x140005040
   1400014cb:	48 33 c4             	xor    rax,rsp
   1400014ce:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1400014d3:	48 8b e9             	mov    rbp,rcx
   1400014d6:	33 d2                	xor    edx,edx
   1400014d8:	48 8d 4c 24 28       	lea    rcx,[rsp+0x28]
   1400014dd:	ff 15 0d 1c 00 00    	call   QWORD PTR [rip+0x1c0d]        # 0x1400030f0
   1400014e3:	90                   	nop
   1400014e4:	48 8b 05 95 42 00 00 	mov    rax,QWORD PTR [rip+0x4295]        # 0x140005780
   1400014eb:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400014f0:	48 8b 1d 49 1c 00 00 	mov    rbx,QWORD PTR [rip+0x1c49]        # 0x140003140
   1400014f7:	48 83 3b 00          	cmp    QWORD PTR [rbx],0x0
   1400014fb:	75 2d                	jne    0x14000152a
   1400014fd:	33 d2                	xor    edx,edx
   1400014ff:	48 8d 4c 24 30       	lea    rcx,[rsp+0x30]
   140001504:	ff 15 e6 1b 00 00    	call   QWORD PTR [rip+0x1be6]        # 0x1400030f0
   14000150a:	48 83 3b 00          	cmp    QWORD PTR [rbx],0x0
   14000150e:	75 0f                	jne    0x14000151f
   140001510:	48 8b 05 09 1c 00 00 	mov    rax,QWORD PTR [rip+0x1c09]        # 0x140003120
   140001517:	ff 00                	inc    DWORD PTR [rax]
   140001519:	48 63 00             	movsxd rax,DWORD PTR [rax]
   14000151c:	48 89 03             	mov    QWORD PTR [rbx],rax
   14000151f:	48 8d 4c 24 30       	lea    rcx,[rsp+0x30]
   140001524:	ff 15 be 1b 00 00    	call   QWORD PTR [rip+0x1bbe]        # 0x1400030e8
   14000152a:	48 8b 33             	mov    rsi,QWORD PTR [rbx]
   14000152d:	48 8b 4d 08          	mov    rcx,QWORD PTR [rbp+0x8]
   140001531:	48 8d 3c f5 00 00 00 	lea    rdi,[rsi*8+0x0]
   140001538:	00 
   140001539:	48 3b 71 18          	cmp    rsi,QWORD PTR [rcx+0x18]
   14000153d:	73 0f                	jae    0x14000154e
   14000153f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
   140001543:	48 8b 1c 07          	mov    rbx,QWORD PTR [rdi+rax*1]
   140001547:	48 85 db             	test   rbx,rbx
   14000154a:	75 68                	jne    0x1400015b4
   14000154c:	eb 02                	jmp    0x140001550
   14000154e:	33 db                	xor    ebx,ebx
   140001550:	80 79 24 00          	cmp    BYTE PTR [rcx+0x24],0x0
   140001554:	74 14                	je     0x14000156a
   140001556:	ff 15 ac 1b 00 00    	call   QWORD PTR [rip+0x1bac]        # 0x140003108
   14000155c:	48 3b 70 18          	cmp    rsi,QWORD PTR [rax+0x18]
   140001560:	73 0d                	jae    0x14000156f
   140001562:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   140001566:	48 8b 1c 07          	mov    rbx,QWORD PTR [rdi+rax*1]
   14000156a:	48 85 db             	test   rbx,rbx
   14000156d:	75 45                	jne    0x1400015b4
   14000156f:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]
   140001574:	48 85 db             	test   rbx,rbx
   140001577:	75 3b                	jne    0x1400015b4
   140001579:	48 8b d5             	mov    rdx,rbp
   14000157c:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001581:	ff 15 49 1b 00 00    	call   QWORD PTR [rip+0x1b49]        # 0x1400030d0
   140001587:	48 83 f8 ff          	cmp    rax,0xffffffffffffffff
   14000158b:	74 57                	je     0x1400015e4
   14000158d:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]
   140001592:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   140001597:	48 8b cb             	mov    rcx,rbx
   14000159a:	e8 0d 07 00 00       	call   0x140001cac
   14000159f:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400015a2:	48 8b cb             	mov    rcx,rbx
   1400015a5:	ff 50 08             	call   QWORD PTR [rax+0x8]
   1400015a8:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]
   1400015ad:	48 89 1d cc 41 00 00 	mov    QWORD PTR [rip+0x41cc],rbx        # 0x140005780
   1400015b4:	48 8d 4c 24 28       	lea    rcx,[rsp+0x28]
   1400015b9:	ff 15 29 1b 00 00    	call   QWORD PTR [rip+0x1b29]        # 0x1400030e8
   1400015bf:	48 8b c3             	mov    rax,rbx
   1400015c2:	48 8b 4c 24 38       	mov    rcx,QWORD PTR [rsp+0x38]
   1400015c7:	48 33 cc             	xor    rcx,rsp
   1400015ca:	e8 31 07 00 00       	call   0x140001d00
   1400015cf:	48 8b 5c 24 58       	mov    rbx,QWORD PTR [rsp+0x58]
   1400015d4:	48 8b 6c 24 60       	mov    rbp,QWORD PTR [rsp+0x60]
   1400015d9:	48 8b 74 24 68       	mov    rsi,QWORD PTR [rsp+0x68]
   1400015de:	48 83 c4 40          	add    rsp,0x40
   1400015e2:	5f                   	pop    rdi
   1400015e3:	c3                   	ret
   1400015e4:	e8 17 fc ff ff       	call   0x140001200
   1400015e9:	90                   	nop
   1400015ea:	cc                   	int3
   1400015eb:	cc                   	int3
   1400015ec:	cc                   	int3
   1400015ed:	cc                   	int3
   1400015ee:	cc                   	int3
   1400015ef:	cc                   	int3
   1400015f0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400015f5:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   1400015fa:	56                   	push   rsi
   1400015fb:	57                   	push   rdi
   1400015fc:	41 54                	push   r12
   1400015fe:	41 56                	push   r14
   140001600:	41 57                	push   r15
   140001602:	48 83 ec 30          	sub    rsp,0x30
   140001606:	4c 8b e2             	mov    r12,rdx
   140001609:	48 8b f1             	mov    rsi,rcx
   14000160c:	33 db                	xor    ebx,ebx
   14000160e:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   140001612:	49 c7 c6 ff ff ff ff 	mov    r14,0xffffffffffffffff
   140001619:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001620:	49 ff c6             	inc    r14
   140001623:	42 38 1c 32          	cmp    BYTE PTR [rdx+r14*1],bl
   140001627:	75 f7                	jne    0x140001620
   140001629:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000162c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001630:	48 8b 7c 31 28       	mov    rdi,QWORD PTR [rcx+rsi*1+0x28]
   140001635:	48 85 ff             	test   rdi,rdi
   140001638:	7e 0a                	jle    0x140001644
   14000163a:	49 3b fe             	cmp    rdi,r14
   14000163d:	7e 05                	jle    0x140001644
   14000163f:	49 2b fe             	sub    rdi,r14
   140001642:	eb 02                	jmp    0x140001646
   140001644:	33 ff                	xor    edi,edi
   140001646:	4c 8b fe             	mov    r15,rsi
   140001649:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000164e:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001653:	48 85 c9             	test   rcx,rcx
   140001656:	74 07                	je     0x14000165f
   140001658:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000165b:	ff 50 08             	call   QWORD PTR [rax+0x8]
   14000165e:	90                   	nop
   14000165f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001662:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001666:	48 03 ce             	add    rcx,rsi
   140001669:	ff 15 91 1a 00 00    	call   QWORD PTR [rip+0x1a91]        # 0x140003100
   14000166f:	84 c0                	test   al,al
   140001671:	75 06                	jne    0x140001679
   140001673:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   140001677:	eb 39                	jmp    0x1400016b2
   140001679:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   14000167c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001680:	48 8b 4c 31 50       	mov    rcx,QWORD PTR [rcx+rsi*1+0x50]
   140001685:	48 85 c9             	test   rcx,rcx
   140001688:	74 21                	je     0x1400016ab
   14000168a:	48 3b ce             	cmp    rcx,rsi
   14000168d:	74 1c                	je     0x1400016ab
   14000168f:	ff 15 23 1a 00 00    	call   QWORD PTR [rip+0x1a23]        # 0x1400030b8
   140001695:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001698:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000169c:	48 03 ce             	add    rcx,rsi
   14000169f:	ff 15 5b 1a 00 00    	call   QWORD PTR [rip+0x1a5b]        # 0x140003100
   1400016a5:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   1400016a9:	eb 07                	jmp    0x1400016b2
   1400016ab:	c6 44 24 28 01       	mov    BYTE PTR [rsp+0x28],0x1
   1400016b0:	b0 01                	mov    al,0x1
   1400016b2:	84 c0                	test   al,al
   1400016b4:	75 0a                	jne    0x1400016c0
   1400016b6:	bb 04 00 00 00       	mov    ebx,0x4
   1400016bb:	e9 af 00 00 00       	jmp    0x14000176f
   1400016c0:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   1400016c3:	48 63 42 04          	movsxd rax,DWORD PTR [rdx+0x4]
   1400016c7:	8b 4c 30 18          	mov    ecx,DWORD PTR [rax+rsi*1+0x18]
   1400016cb:	81 e1 c0 01 00 00    	and    ecx,0x1c0
   1400016d1:	83 f9 40             	cmp    ecx,0x40
   1400016d4:	74 29                	je     0x1400016ff
   1400016d6:	48 85 ff             	test   rdi,rdi
   1400016d9:	7e 21                	jle    0x1400016fc
   1400016db:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400016de:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400016e2:	0f b6 54 31 58       	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   1400016e7:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400016ec:	ff 15 ae 19 00 00    	call   QWORD PTR [rip+0x19ae]        # 0x1400030a0
   1400016f2:	83 f8 ff             	cmp    eax,0xffffffff
   1400016f5:	74 4f                	je     0x140001746
   1400016f7:	48 ff cf             	dec    rdi
   1400016fa:	eb da                	jmp    0x1400016d6
   1400016fc:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   1400016ff:	48 63 4a 04          	movsxd rcx,DWORD PTR [rdx+0x4]
   140001703:	4d 8b c6             	mov    r8,r14
   140001706:	49 8b d4             	mov    rdx,r12
   140001709:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   14000170e:	ff 15 94 19 00 00    	call   QWORD PTR [rip+0x1994]        # 0x1400030a8
   140001714:	49 3b c6             	cmp    rax,r14
   140001717:	75 2d                	jne    0x140001746
   140001719:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001720:	48 85 ff             	test   rdi,rdi
   140001723:	7e 2a                	jle    0x14000174f
   140001725:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001728:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000172c:	0f b6 54 31 58       	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   140001731:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001736:	ff 15 64 19 00 00    	call   QWORD PTR [rip+0x1964]        # 0x1400030a0
   14000173c:	83 f8 ff             	cmp    eax,0xffffffff
   14000173f:	74 05                	je     0x140001746
   140001741:	48 ff cf             	dec    rdi
   140001744:	eb da                	jmp    0x140001720
   140001746:	bb 04 00 00 00       	mov    ebx,0x4
   14000174b:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   14000174f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001752:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001756:	48 c7 44 31 28 00 00 	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   14000175d:	00 00 
   14000175f:	eb 0e                	jmp    0x14000176f
   140001761:	48 8b 74 24 60       	mov    rsi,QWORD PTR [rsp+0x60]
   140001766:	8b 5c 24 70          	mov    ebx,DWORD PTR [rsp+0x70]
   14000176a:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
   14000176f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001772:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001776:	48 03 ce             	add    rcx,rsi
   140001779:	45 33 c0             	xor    r8d,r8d
   14000177c:	8b d3                	mov    edx,ebx
   14000177e:	ff 15 5c 19 00 00    	call   QWORD PTR [rip+0x195c]        # 0x1400030e0
   140001784:	90                   	nop
   140001785:	ff 15 85 19 00 00    	call   QWORD PTR [rip+0x1985]        # 0x140003110
   14000178b:	84 c0                	test   al,al
   14000178d:	75 0a                	jne    0x140001799
   14000178f:	49 8b cf             	mov    rcx,r15
   140001792:	ff 15 90 19 00 00    	call   QWORD PTR [rip+0x1990]        # 0x140003128
   140001798:	90                   	nop
   140001799:	49 8b 07             	mov    rax,QWORD PTR [r15]
   14000179c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400017a0:	4a 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+r15*1+0x48]
   1400017a5:	48 85 c9             	test   rcx,rcx
   1400017a8:	74 07                	je     0x1400017b1
   1400017aa:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400017ad:	ff 50 10             	call   QWORD PTR [rax+0x10]
   1400017b0:	90                   	nop
   1400017b1:	48 8b c6             	mov    rax,rsi
   1400017b4:	48 8b 5c 24 68       	mov    rbx,QWORD PTR [rsp+0x68]
   1400017b9:	48 83 c4 30          	add    rsp,0x30
   1400017bd:	41 5f                	pop    r15
   1400017bf:	41 5e                	pop    r14
   1400017c1:	41 5c                	pop    r12
   1400017c3:	5f                   	pop    rdi
   1400017c4:	5e                   	pop    rsi
   1400017c5:	c3                   	ret
   1400017c6:	cc                   	int3
   1400017c7:	cc                   	int3
   1400017c8:	cc                   	int3
   1400017c9:	cc                   	int3
   1400017ca:	cc                   	int3
   1400017cb:	cc                   	int3
   1400017cc:	cc                   	int3
   1400017cd:	cc                   	int3
   1400017ce:	cc                   	int3
   1400017cf:	cc                   	int3
   1400017d0:	40 53                	rex push rbx
   1400017d2:	48 83 ec 20          	sub    rsp,0x20
   1400017d6:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400017d9:	48 8b d9             	mov    rbx,rcx
   1400017dc:	b2 0a                	mov    dl,0xa
   1400017de:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400017e2:	48 03 cb             	add    rcx,rbx
   1400017e5:	ff 15 9d 18 00 00    	call   QWORD PTR [rip+0x189d]        # 0x140003088
   1400017eb:	0f b6 d0             	movzx  edx,al
   1400017ee:	48 8b cb             	mov    rcx,rbx
   1400017f1:	ff 15 b9 18 00 00    	call   QWORD PTR [rip+0x18b9]        # 0x1400030b0
   1400017f7:	48 8b cb             	mov    rcx,rbx
   1400017fa:	ff 15 b8 18 00 00    	call   QWORD PTR [rip+0x18b8]        # 0x1400030b8
   140001800:	48 8b c3             	mov    rax,rbx
   140001803:	48 83 c4 20          	add    rsp,0x20
   140001807:	5b                   	pop    rbx
   140001808:	c3                   	ret
   140001809:	cc                   	int3
   14000180a:	cc                   	int3
   14000180b:	cc                   	int3
   14000180c:	cc                   	int3
   14000180d:	cc                   	int3
   14000180e:	cc                   	int3
   14000180f:	cc                   	int3
   140001810:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   140001815:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000181a:	57                   	push   rdi
   14000181b:	41 54                	push   r12
   14000181d:	41 55                	push   r13
   14000181f:	41 56                	push   r14
   140001821:	41 57                	push   r15
   140001823:	48 83 ec 50          	sub    rsp,0x50
   140001827:	48 8b da             	mov    rbx,rdx
   14000182a:	48 8b f9             	mov    rdi,rcx
   14000182d:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   140001832:	33 f6                	xor    esi,esi
   140001834:	89 74 24 24          	mov    DWORD PTR [rsp+0x24],esi
   140001838:	45 32 ff             	xor    r15b,r15b
   14000183b:	44 88 7c 24 20       	mov    BYTE PTR [rsp+0x20],r15b
   140001840:	4c 8b e1             	mov    r12,rcx
   140001843:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140001848:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000184b:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000184f:	4a 8b 4c 21 48       	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001854:	48 85 c9             	test   rcx,rcx
   140001857:	74 07                	je     0x140001860
   140001859:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000185c:	ff 50 08             	call   QWORD PTR [rax+0x8]
   14000185f:	90                   	nop
   140001860:	33 d2                	xor    edx,edx
   140001862:	48 8b cf             	mov    rcx,rdi
   140001865:	ff 15 c5 18 00 00    	call   QWORD PTR [rip+0x18c5]        # 0x140003130
   14000186b:	88 44 24 38          	mov    BYTE PTR [rsp+0x38],al
   14000186f:	84 c0                	test   al,al
   140001871:	0f 84 14 01 00 00    	je     0x14000198b
   140001877:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   14000187a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000187e:	48 03 cf             	add    rcx,rdi
   140001881:	48 8d 54 24 40       	lea    rdx,[rsp+0x40]
   140001886:	ff 15 3c 18 00 00    	call   QWORD PTR [rip+0x183c]        # 0x1400030c8
   14000188c:	90                   	nop
   14000188d:	48 8b c8             	mov    rcx,rax
   140001890:	e8 1b fc ff ff       	call   0x1400014b0
   140001895:	4c 8b e8             	mov    r13,rax
   140001898:	48 8b 4c 24 48       	mov    rcx,QWORD PTR [rsp+0x48]
   14000189d:	48 85 c9             	test   rcx,rcx
   1400018a0:	74 18                	je     0x1400018ba
   1400018a2:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400018a5:	ff 50 10             	call   QWORD PTR [rax+0x10]
   1400018a8:	48 8b c8             	mov    rcx,rax
   1400018ab:	48 85 c0             	test   rax,rax
   1400018ae:	74 0a                	je     0x1400018ba
   1400018b0:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400018b3:	ba 01 00 00 00       	mov    edx,0x1
   1400018b8:	ff 10                	call   QWORD PTR [rax]
   1400018ba:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   1400018c1:	00 
   1400018c2:	48 8b c3             	mov    rax,rbx
   1400018c5:	48 83 7b 18 0f       	cmp    QWORD PTR [rbx+0x18],0xf
   1400018ca:	76 03                	jbe    0x1400018cf
   1400018cc:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400018cf:	c6 00 00             	mov    BYTE PTR [rax],0x0
   1400018d2:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   1400018d5:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400018d9:	4c 8b 74 39 28       	mov    r14,QWORD PTR [rcx+rdi*1+0x28]
   1400018de:	48 b8 ff ff ff ff ff 	movabs rax,0x7fffffffffffffff
   1400018e5:	ff ff 7f 
   1400018e8:	4d 85 f6             	test   r14,r14
   1400018eb:	7e 05                	jle    0x1400018f2
   1400018ed:	4c 3b f0             	cmp    r14,rax
   1400018f0:	72 03                	jb     0x1400018f5
   1400018f2:	4c 8b f0             	mov    r14,rax
   1400018f5:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   1400018fa:	ff 15 90 17 00 00    	call   QWORD PTR [rip+0x1790]        # 0x140003090
   140001900:	4d 85 f6             	test   r14,r14
   140001903:	74 0e                	je     0x140001913
   140001905:	83 f8 ff             	cmp    eax,0xffffffff
   140001908:	75 0b                	jne    0x140001915
   14000190a:	be 01 00 00 00       	mov    esi,0x1
   14000190f:	89 74 24 24          	mov    DWORD PTR [rsp+0x24],esi
   140001913:	eb 76                	jmp    0x14000198b
   140001915:	44 0f b6 c8          	movzx  r9d,al
   140001919:	49 8b 45 18          	mov    rax,QWORD PTR [r13+0x18]
   14000191d:	42 f6 04 48 48       	test   BYTE PTR [rax+r9*2],0x48
   140001922:	75 ef                	jne    0x140001913
   140001924:	48 8b 4b 10          	mov    rcx,QWORD PTR [rbx+0x10]
   140001928:	48 8b 53 18          	mov    rdx,QWORD PTR [rbx+0x18]
   14000192c:	48 3b ca             	cmp    rcx,rdx
   14000192f:	73 1f                	jae    0x140001950
   140001931:	48 8d 41 01          	lea    rax,[rcx+0x1]
   140001935:	48 89 43 10          	mov    QWORD PTR [rbx+0x10],rax
   140001939:	48 8b c3             	mov    rax,rbx
   14000193c:	48 83 fa 0f          	cmp    rdx,0xf
   140001940:	76 03                	jbe    0x140001945
   140001942:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001945:	44 88 0c 08          	mov    BYTE PTR [rax+rcx*1],r9b
   140001949:	c6 44 08 01 00       	mov    BYTE PTR [rax+rcx*1+0x1],0x0
   14000194e:	eb 08                	jmp    0x140001958
   140001950:	48 8b cb             	mov    rcx,rbx
   140001953:	e8 d8 01 00 00       	call   0x140001b30
   140001958:	41 b7 01             	mov    r15b,0x1
   14000195b:	44 88 7c 24 20       	mov    BYTE PTR [rsp+0x20],r15b
   140001960:	49 ff ce             	dec    r14
   140001963:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001966:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000196a:	48 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+rdi*1+0x48]
   14000196f:	ff 15 23 17 00 00    	call   QWORD PTR [rip+0x1723]        # 0x140003098
   140001975:	eb 89                	jmp    0x140001900
   140001977:	8b 74 24 24          	mov    esi,DWORD PTR [rsp+0x24]
   14000197b:	44 0f b6 7c 24 20    	movzx  r15d,BYTE PTR [rsp+0x20]
   140001981:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
   140001986:	48 8b 7c 24 28       	mov    rdi,QWORD PTR [rsp+0x28]
   14000198b:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   14000198e:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001992:	48 c7 44 39 28 00 00 	mov    QWORD PTR [rcx+rdi*1+0x28],0x0
   140001999:	00 00 
   14000199b:	45 84 ff             	test   r15b,r15b
   14000199e:	75 03                	jne    0x1400019a3
   1400019a0:	83 ce 02             	or     esi,0x2
   1400019a3:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   1400019a6:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400019aa:	48 03 cf             	add    rcx,rdi
   1400019ad:	45 33 c0             	xor    r8d,r8d
   1400019b0:	8b d6                	mov    edx,esi
   1400019b2:	ff 15 28 17 00 00    	call   QWORD PTR [rip+0x1728]        # 0x1400030e0
   1400019b8:	90                   	nop
   1400019b9:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
   1400019bd:	48 63 51 04          	movsxd rdx,DWORD PTR [rcx+0x4]
   1400019c1:	4a 8b 4c 22 48       	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   1400019c6:	48 85 c9             	test   rcx,rcx
   1400019c9:	74 07                	je     0x1400019d2
   1400019cb:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   1400019ce:	ff 52 10             	call   QWORD PTR [rdx+0x10]
   1400019d1:	90                   	nop
   1400019d2:	48 8b c7             	mov    rax,rdi
   1400019d5:	4c 8d 5c 24 50       	lea    r11,[rsp+0x50]
   1400019da:	49 8b 5b 40          	mov    rbx,QWORD PTR [r11+0x40]
   1400019de:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   1400019e2:	49 8b e3             	mov    rsp,r11
   1400019e5:	41 5f                	pop    r15
   1400019e7:	41 5e                	pop    r14
   1400019e9:	41 5d                	pop    r13
   1400019eb:	41 5c                	pop    r12
   1400019ed:	5f                   	pop    rdi
   1400019ee:	c3                   	ret
   1400019ef:	cc                   	int3
   1400019f0:	40 53                	rex push rbx
   1400019f2:	48 83 ec 30          	sub    rsp,0x30
   1400019f6:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   1400019fa:	48 8b d9             	mov    rbx,rcx
   1400019fd:	48 83 fa 0f          	cmp    rdx,0xf
   140001a01:	76 2c                	jbe    0x140001a2f
   140001a03:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140001a06:	48 ff c2             	inc    rdx
   140001a09:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001a10:	72 18                	jb     0x140001a2a
   140001a12:	48 8b 41 f8          	mov    rax,QWORD PTR [rcx-0x8]
   140001a16:	48 83 c2 27          	add    rdx,0x27
   140001a1a:	48 2b c8             	sub    rcx,rax
   140001a1d:	48 83 e9 08          	sub    rcx,0x8
   140001a21:	48 83 f9 1f          	cmp    rcx,0x1f
   140001a25:	77 21                	ja     0x140001a48
   140001a27:	48 8b c8             	mov    rcx,rax
   140001a2a:	e8 2d 03 00 00       	call   0x140001d5c
   140001a2f:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   140001a36:	00 
   140001a37:	48 c7 43 18 0f 00 00 	mov    QWORD PTR [rbx+0x18],0xf
   140001a3e:	00 
   140001a3f:	c6 03 00             	mov    BYTE PTR [rbx],0x0
   140001a42:	48 83 c4 30          	add    rsp,0x30
   140001a46:	5b                   	pop    rbx
   140001a47:	c3                   	ret
   140001a48:	45 33 c9             	xor    r9d,r9d
   140001a4b:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   140001a52:	00 00 
   140001a54:	45 33 c0             	xor    r8d,r8d
   140001a57:	33 d2                	xor    edx,edx
   140001a59:	33 c9                	xor    ecx,ecx
   140001a5b:	ff 15 c7 17 00 00    	call   QWORD PTR [rip+0x17c7]        # 0x140003228
   140001a61:	cc                   	int3
   140001a62:	cc                   	int3
   140001a63:	cc                   	int3
   140001a64:	cc                   	int3
   140001a65:	cc                   	int3
   140001a66:	cc                   	int3
   140001a67:	cc                   	int3
   140001a68:	cc                   	int3
   140001a69:	cc                   	int3
   140001a6a:	cc                   	int3
   140001a6b:	cc                   	int3
   140001a6c:	cc                   	int3
   140001a6d:	cc                   	int3
   140001a6e:	cc                   	int3
   140001a6f:	cc                   	int3
   140001a70:	48 83 ec 28          	sub    rsp,0x28
   140001a74:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001a77:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001a7a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001a7e:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001a83:	48 85 c9             	test   rcx,rcx
   140001a86:	74 07                	je     0x140001a8f
   140001a88:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001a8b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001a8e:	90                   	nop
   140001a8f:	48 83 c4 28          	add    rsp,0x28
   140001a93:	c3                   	ret
   140001a94:	cc                   	int3
   140001a95:	cc                   	int3
   140001a96:	cc                   	int3
   140001a97:	cc                   	int3
   140001a98:	cc                   	int3
   140001a99:	cc                   	int3
   140001a9a:	cc                   	int3
   140001a9b:	cc                   	int3
   140001a9c:	cc                   	int3
   140001a9d:	cc                   	int3
   140001a9e:	cc                   	int3
   140001a9f:	cc                   	int3
   140001aa0:	48 83 ec 28          	sub    rsp,0x28
   140001aa4:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001aa7:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001aaa:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001aae:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001ab3:	48 85 c9             	test   rcx,rcx
   140001ab6:	74 07                	je     0x140001abf
   140001ab8:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001abb:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001abe:	90                   	nop
   140001abf:	48 83 c4 28          	add    rsp,0x28
   140001ac3:	c3                   	ret
   140001ac4:	cc                   	int3
   140001ac5:	cc                   	int3
   140001ac6:	cc                   	int3
   140001ac7:	cc                   	int3
   140001ac8:	cc                   	int3
   140001ac9:	cc                   	int3
   140001aca:	cc                   	int3
   140001acb:	cc                   	int3
   140001acc:	cc                   	int3
   140001acd:	cc                   	int3
   140001ace:	cc                   	int3
   140001acf:	cc                   	int3
   140001ad0:	40 53                	rex push rbx
   140001ad2:	48 83 ec 20          	sub    rsp,0x20
   140001ad6:	48 8b d9             	mov    rbx,rcx
   140001ad9:	ff 15 31 16 00 00    	call   QWORD PTR [rip+0x1631]        # 0x140003110
   140001adf:	84 c0                	test   al,al
   140001ae1:	75 0a                	jne    0x140001aed
   140001ae3:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140001ae6:	ff 15 3c 16 00 00    	call   QWORD PTR [rip+0x163c]        # 0x140003128
   140001aec:	90                   	nop
   140001aed:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140001af0:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001af3:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001af7:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001afc:	48 85 c9             	test   rcx,rcx
   140001aff:	74 07                	je     0x140001b08
   140001b01:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001b04:	ff 50 10             	call   QWORD PTR [rax+0x10]
   140001b07:	90                   	nop
   140001b08:	48 83 c4 20          	add    rsp,0x20
   140001b0c:	5b                   	pop    rbx
   140001b0d:	c3                   	ret
   140001b0e:	cc                   	int3
   140001b0f:	cc                   	int3
   140001b10:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140001b13:	48 85 c9             	test   rcx,rcx
   140001b16:	74 0b                	je     0x140001b23
   140001b18:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001b1b:	ba 01 00 00 00       	mov    edx,0x1
   140001b20:	48 ff 20             	rex.W jmp QWORD PTR [rax]
   140001b23:	c3                   	ret
   140001b24:	cc                   	int3
   140001b25:	cc                   	int3
   140001b26:	cc                   	int3
   140001b27:	cc                   	int3
   140001b28:	cc                   	int3
   140001b29:	cc                   	int3
   140001b2a:	cc                   	int3
   140001b2b:	cc                   	int3
   140001b2c:	cc                   	int3
   140001b2d:	cc                   	int3
   140001b2e:	cc                   	int3
   140001b2f:	cc                   	int3
   140001b30:	40 53                	rex push rbx
   140001b32:	55                   	push   rbp
   140001b33:	56                   	push   rsi
   140001b34:	41 57                	push   r15
   140001b36:	48 83 ec 38          	sub    rsp,0x38
   140001b3a:	48 8b 69 10          	mov    rbp,QWORD PTR [rcx+0x10]
   140001b3e:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   140001b45:	ff ff 7f 
   140001b48:	48 8b c3             	mov    rax,rbx
   140001b4b:	45 0f b6 f9          	movzx  r15d,r9b
   140001b4f:	48 2b c5             	sub    rax,rbp
   140001b52:	48 8b f1             	mov    rsi,rcx
   140001b55:	48 83 f8 01          	cmp    rax,0x1
   140001b59:	0f 82 39 01 00 00    	jb     0x140001c98
   140001b5f:	48 89 7c 24 68       	mov    QWORD PTR [rsp+0x68],rdi
   140001b64:	4c 89 64 24 70       	mov    QWORD PTR [rsp+0x70],r12
   140001b69:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   140001b6d:	49 8b d4             	mov    rdx,r12
   140001b70:	4c 89 74 24 30       	mov    QWORD PTR [rsp+0x30],r14
   140001b75:	4c 8b 71 18          	mov    r14,QWORD PTR [rcx+0x18]
   140001b79:	48 83 ca 0f          	or     rdx,0xf
   140001b7d:	48 3b d3             	cmp    rdx,rbx
   140001b80:	77 44                	ja     0x140001bc6
   140001b82:	49 8b ce             	mov    rcx,r14
   140001b85:	48 8b c3             	mov    rax,rbx
   140001b88:	48 d1 e9             	shr    rcx,1
   140001b8b:	48 2b c1             	sub    rax,rcx
   140001b8e:	4c 3b f0             	cmp    r14,rax
   140001b91:	77 33                	ja     0x140001bc6
   140001b93:	49 8d 04 0e          	lea    rax,[r14+rcx*1]
   140001b97:	48 8b da             	mov    rbx,rdx
   140001b9a:	48 3b d0             	cmp    rdx,rax
   140001b9d:	48 0f 42 d8          	cmovb  rbx,rax
   140001ba1:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   140001ba5:	48 85 c9             	test   rcx,rcx
   140001ba8:	75 04                	jne    0x140001bae
   140001baa:	33 ff                	xor    edi,edi
   140001bac:	eb 49                	jmp    0x140001bf7
   140001bae:	48 81 f9 00 10 00 00 	cmp    rcx,0x1000
   140001bb5:	72 38                	jb     0x140001bef
   140001bb7:	48 8d 41 27          	lea    rax,[rcx+0x27]
   140001bbb:	48 3b c1             	cmp    rax,rcx
   140001bbe:	0f 86 da 00 00 00    	jbe    0x140001c9e
   140001bc4:	eb 0e                	jmp    0x140001bd4
   140001bc6:	48 b8 00 00 00 00 00 	movabs rax,0x8000000000000000
   140001bcd:	00 00 80 
   140001bd0:	48 83 c0 27          	add    rax,0x27
   140001bd4:	48 8b c8             	mov    rcx,rax
   140001bd7:	e8 44 01 00 00       	call   0x140001d20
   140001bdc:	48 85 c0             	test   rax,rax
   140001bdf:	74 6d                	je     0x140001c4e
   140001be1:	48 8d 78 27          	lea    rdi,[rax+0x27]
   140001be5:	48 83 e7 e0          	and    rdi,0xffffffffffffffe0
   140001be9:	48 89 47 f8          	mov    QWORD PTR [rdi-0x8],rax
   140001bed:	eb 08                	jmp    0x140001bf7
   140001bef:	e8 2c 01 00 00       	call   0x140001d20
   140001bf4:	48 8b f8             	mov    rdi,rax
   140001bf7:	4c 89 66 10          	mov    QWORD PTR [rsi+0x10],r12
   140001bfb:	4c 8b c5             	mov    r8,rbp
   140001bfe:	48 89 5e 18          	mov    QWORD PTR [rsi+0x18],rbx
   140001c02:	48 8b cf             	mov    rcx,rdi
   140001c05:	49 83 fe 0f          	cmp    r14,0xf
   140001c09:	76 5d                	jbe    0x140001c68
   140001c0b:	48 8b 1e             	mov    rbx,QWORD PTR [rsi]
   140001c0e:	48 8b d3             	mov    rdx,rbx
   140001c11:	e8 11 10 00 00       	call   0x140002c27
   140001c16:	49 8d 56 01          	lea    rdx,[r14+0x1]
   140001c1a:	44 88 3c 2f          	mov    BYTE PTR [rdi+rbp*1],r15b
   140001c1e:	c6 44 2f 01 00       	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001c23:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001c2a:	72 18                	jb     0x140001c44
   140001c2c:	48 8b 43 f8          	mov    rax,QWORD PTR [rbx-0x8]
   140001c30:	48 83 c2 27          	add    rdx,0x27
   140001c34:	48 2b d8             	sub    rbx,rax
   140001c37:	48 83 eb 08          	sub    rbx,0x8
   140001c3b:	48 83 fb 1f          	cmp    rbx,0x1f
   140001c3f:	77 0d                	ja     0x140001c4e
   140001c41:	48 8b d8             	mov    rbx,rax
   140001c44:	48 8b cb             	mov    rcx,rbx
   140001c47:	e8 10 01 00 00       	call   0x140001d5c
   140001c4c:	eb 2b                	jmp    0x140001c79
   140001c4e:	45 33 c9             	xor    r9d,r9d
   140001c51:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   140001c58:	00 00 
   140001c5a:	45 33 c0             	xor    r8d,r8d
   140001c5d:	33 d2                	xor    edx,edx
   140001c5f:	33 c9                	xor    ecx,ecx
   140001c61:	ff 15 c1 15 00 00    	call   QWORD PTR [rip+0x15c1]        # 0x140003228
   140001c67:	cc                   	int3
   140001c68:	48 8b d6             	mov    rdx,rsi
   140001c6b:	e8 b7 0f 00 00       	call   0x140002c27
   140001c70:	44 88 3c 2f          	mov    BYTE PTR [rdi+rbp*1],r15b
   140001c74:	c6 44 2f 01 00       	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001c79:	48 89 3e             	mov    QWORD PTR [rsi],rdi
   140001c7c:	48 8b c6             	mov    rax,rsi
   140001c7f:	4c 8b 64 24 70       	mov    r12,QWORD PTR [rsp+0x70]
   140001c84:	48 8b 7c 24 68       	mov    rdi,QWORD PTR [rsp+0x68]
   140001c89:	4c 8b 74 24 30       	mov    r14,QWORD PTR [rsp+0x30]
   140001c8e:	48 83 c4 38          	add    rsp,0x38
   140001c92:	41 5f                	pop    r15
   140001c94:	5e                   	pop    rsi
   140001c95:	5d                   	pop    rbp
   140001c96:	5b                   	pop    rbx
   140001c97:	c3                   	ret
   140001c98:	e8 13 f5 ff ff       	call   0x1400011b0
   140001c9d:	cc                   	int3
   140001c9e:	e8 6d f4 ff ff       	call   0x140001110
   140001ca3:	cc                   	int3
   140001ca4:	ff 25 3e 14 00 00    	jmp    QWORD PTR [rip+0x143e]        # 0x1400030e8
   140001caa:	cc                   	int3
   140001cab:	cc                   	int3
   140001cac:	40 53                	rex push rbx
   140001cae:	48 83 ec 20          	sub    rsp,0x20
   140001cb2:	48 8b d9             	mov    rbx,rcx
   140001cb5:	b9 10 00 00 00       	mov    ecx,0x10
   140001cba:	ff 15 08 15 00 00    	call   QWORD PTR [rip+0x1508]        # 0x1400031c8
   140001cc0:	48 8b d0             	mov    rdx,rax
   140001cc3:	48 85 c0             	test   rax,rax
   140001cc6:	74 1b                	je     0x140001ce3
   140001cc8:	48 8b 05 b1 34 00 00 	mov    rax,QWORD PTR [rip+0x34b1]        # 0x140005180
   140001ccf:	48 89 02             	mov    QWORD PTR [rdx],rax
   140001cd2:	48 89 5a 08          	mov    QWORD PTR [rdx+0x8],rbx
   140001cd6:	48 89 15 a3 34 00 00 	mov    QWORD PTR [rip+0x34a3],rdx        # 0x140005180
   140001cdd:	48 83 c4 20          	add    rsp,0x20
   140001ce1:	5b                   	pop    rbx
   140001ce2:	c3                   	ret
   140001ce3:	e8 01 00 00 00       	call   0x140001ce9
   140001ce8:	cc                   	int3
   140001ce9:	ff 25 e9 13 00 00    	jmp    QWORD PTR [rip+0x13e9]        # 0x1400030d8
   140001cef:	cc                   	int3
   140001cf0:	cc                   	int3
   140001cf1:	cc                   	int3
   140001cf2:	cc                   	int3
   140001cf3:	cc                   	int3
   140001cf4:	cc                   	int3
   140001cf5:	cc                   	int3
   140001cf6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140001cfd:	00 00 00 
   140001d00:	48 3b 0d 39 33 00 00 	cmp    rcx,QWORD PTR [rip+0x3339]        # 0x140005040
   140001d07:	75 10                	jne    0x140001d19
   140001d09:	48 c1 c1 10          	rol    rcx,0x10
   140001d0d:	66 f7 c1 ff ff       	test   cx,0xffff
   140001d12:	75 01                	jne    0x140001d15
   140001d14:	c3                   	ret
   140001d15:	48 c1 c9 10          	ror    rcx,0x10
   140001d19:	e9 5e 05 00 00       	jmp    0x14000227c
   140001d1e:	cc                   	int3
   140001d1f:	cc                   	int3
   140001d20:	40 53                	rex push rbx
   140001d22:	48 83 ec 20          	sub    rsp,0x20
   140001d26:	48 8b d9             	mov    rbx,rcx
   140001d29:	eb 0f                	jmp    0x140001d3a
   140001d2b:	48 8b cb             	mov    rcx,rbx
   140001d2e:	e8 83 0d 00 00       	call   0x140002ab6
   140001d33:	85 c0                	test   eax,eax
   140001d35:	74 13                	je     0x140001d4a
   140001d37:	48 8b cb             	mov    rcx,rbx
   140001d3a:	e8 71 0d 00 00       	call   0x140002ab0
   140001d3f:	48 85 c0             	test   rax,rax
   140001d42:	74 e7                	je     0x140001d2b
   140001d44:	48 83 c4 20          	add    rsp,0x20
   140001d48:	5b                   	pop    rbx
   140001d49:	c3                   	ret
   140001d4a:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
   140001d4e:	74 06                	je     0x140001d56
   140001d50:	e8 93 06 00 00       	call   0x1400023e8
   140001d55:	cc                   	int3
   140001d56:	e8 b5 f3 ff ff       	call   0x140001110
   140001d5b:	cc                   	int3
   140001d5c:	e9 a7 06 00 00       	jmp    0x140002408
   140001d61:	cc                   	int3
   140001d62:	cc                   	int3
   140001d63:	cc                   	int3
   140001d64:	40 53                	rex push rbx
   140001d66:	48 83 ec 20          	sub    rsp,0x20
   140001d6a:	48 8d 05 e7 15 00 00 	lea    rax,[rip+0x15e7]        # 0x140003358
   140001d71:	48 8b d9             	mov    rbx,rcx
   140001d74:	48 89 01             	mov    QWORD PTR [rcx],rax
   140001d77:	f6 c2 01             	test   dl,0x1
   140001d7a:	74 0a                	je     0x140001d86
   140001d7c:	ba 18 00 00 00       	mov    edx,0x18
   140001d81:	e8 d6 ff ff ff       	call   0x140001d5c
   140001d86:	48 8b c3             	mov    rax,rbx
   140001d89:	48 83 c4 20          	add    rsp,0x20
   140001d8d:	5b                   	pop    rbx
   140001d8e:	c3                   	ret
   140001d8f:	cc                   	int3
   140001d90:	40 53                	rex push rbx
   140001d92:	48 83 ec 20          	sub    rsp,0x20
   140001d96:	b9 01 00 00 00       	mov    ecx,0x1
   140001d9b:	e8 22 0d 00 00       	call   0x140002ac2
   140001da0:	e8 27 07 00 00       	call   0x1400024cc
   140001da5:	8b c8                	mov    ecx,eax
   140001da7:	e8 4c 0d 00 00       	call   0x140002af8
   140001dac:	e8 0f 07 00 00       	call   0x1400024c0
   140001db1:	8b d8                	mov    ebx,eax
   140001db3:	e8 70 0d 00 00       	call   0x140002b28
   140001db8:	b9 01 00 00 00       	mov    ecx,0x1
   140001dbd:	89 18                	mov    DWORD PTR [rax],ebx
   140001dbf:	e8 b8 02 00 00       	call   0x14000207c
   140001dc4:	84 c0                	test   al,al
   140001dc6:	74 73                	je     0x140001e3b
   140001dc8:	e8 8b 09 00 00       	call   0x140002758
   140001dcd:	48 8d 0d c0 09 00 00 	lea    rcx,[rip+0x9c0]        # 0x140002794
   140001dd4:	e8 53 04 00 00       	call   0x14000222c
   140001dd9:	e8 e6 06 00 00       	call   0x1400024c4
   140001dde:	8b c8                	mov    ecx,eax
   140001de0:	e8 e9 0c 00 00       	call   0x140002ace
   140001de5:	85 c0                	test   eax,eax
   140001de7:	75 52                	jne    0x140001e3b
   140001de9:	e8 e6 06 00 00       	call   0x1400024d4
   140001dee:	e8 21 07 00 00       	call   0x140002514
   140001df3:	85 c0                	test   eax,eax
   140001df5:	74 0c                	je     0x140001e03
   140001df7:	48 8d 0d c2 06 00 00 	lea    rcx,[rip+0x6c2]        # 0x1400024c0
   140001dfe:	e8 c5 0c 00 00       	call   0x140002ac8
   140001e03:	e8 3c 04 00 00       	call   0x140002244
   140001e08:	e8 37 04 00 00       	call   0x140002244
   140001e0d:	e8 ae 06 00 00       	call   0x1400024c0
   140001e12:	8b c8                	mov    ecx,eax
   140001e14:	e8 03 0d 00 00       	call   0x140002b1c
   140001e19:	e8 c6 06 00 00       	call   0x1400024e4
   140001e1e:	84 c0                	test   al,al
   140001e20:	74 05                	je     0x140001e27
   140001e22:	e8 ad 0c 00 00       	call   0x140002ad4
   140001e27:	e8 94 06 00 00       	call   0x1400024c0
   140001e2c:	e8 57 08 00 00       	call   0x140002688
   140001e31:	85 c0                	test   eax,eax
   140001e33:	75 06                	jne    0x140001e3b
   140001e35:	48 83 c4 20          	add    rsp,0x20
   140001e39:	5b                   	pop    rbx
   140001e3a:	c3                   	ret
   140001e3b:	b9 07 00 00 00       	mov    ecx,0x7
   140001e40:	e8 f7 06 00 00       	call   0x14000253c
   140001e45:	cc                   	int3
   140001e46:	cc                   	int3
   140001e47:	cc                   	int3
   140001e48:	48 83 ec 28          	sub    rsp,0x28
   140001e4c:	e8 a7 06 00 00       	call   0x1400024f8
   140001e51:	33 c0                	xor    eax,eax
   140001e53:	48 83 c4 28          	add    rsp,0x28
   140001e57:	c3                   	ret
   140001e58:	48 83 ec 28          	sub    rsp,0x28
   140001e5c:	e8 83 08 00 00       	call   0x1400026e4
   140001e61:	e8 5a 06 00 00       	call   0x1400024c0
   140001e66:	8b c8                	mov    ecx,eax
   140001e68:	48 83 c4 28          	add    rsp,0x28
   140001e6c:	e9 b1 0c 00 00       	jmp    0x140002b22
   140001e71:	cc                   	int3
   140001e72:	cc                   	int3
   140001e73:	cc                   	int3
   140001e74:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140001e79:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   140001e7e:	57                   	push   rdi
   140001e7f:	48 83 ec 30          	sub    rsp,0x30
   140001e83:	b9 01 00 00 00       	mov    ecx,0x1
   140001e88:	e8 b3 01 00 00       	call   0x140002040
   140001e8d:	84 c0                	test   al,al
   140001e8f:	0f 84 36 01 00 00    	je     0x140001fcb
   140001e95:	40 32 f6             	xor    sil,sil
   140001e98:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140001e9d:	e8 62 01 00 00       	call   0x140002004
   140001ea2:	8a d8                	mov    bl,al
   140001ea4:	8b 0d e6 32 00 00    	mov    ecx,DWORD PTR [rip+0x32e6]        # 0x140005190
   140001eaa:	83 f9 01             	cmp    ecx,0x1
   140001ead:	0f 84 23 01 00 00    	je     0x140001fd6
   140001eb3:	85 c9                	test   ecx,ecx
   140001eb5:	75 4a                	jne    0x140001f01
   140001eb7:	c7 05 cf 32 00 00 01 	mov    DWORD PTR [rip+0x32cf],0x1        # 0x140005190
   140001ebe:	00 00 00 
   140001ec1:	48 8d 15 60 14 00 00 	lea    rdx,[rip+0x1460]        # 0x140003328
   140001ec8:	48 8d 0d 41 14 00 00 	lea    rcx,[rip+0x1441]        # 0x140003310
   140001ecf:	e8 12 0c 00 00       	call   0x140002ae6
   140001ed4:	85 c0                	test   eax,eax
   140001ed6:	74 0a                	je     0x140001ee2
   140001ed8:	b8 ff 00 00 00       	mov    eax,0xff
   140001edd:	e9 d9 00 00 00       	jmp    0x140001fbb
   140001ee2:	48 8d 15 1f 14 00 00 	lea    rdx,[rip+0x141f]        # 0x140003308
   140001ee9:	48 8d 0d 00 14 00 00 	lea    rcx,[rip+0x1400]        # 0x1400032f0
   140001ef0:	e8 eb 0b 00 00       	call   0x140002ae0
   140001ef5:	c7 05 91 32 00 00 02 	mov    DWORD PTR [rip+0x3291],0x2        # 0x140005190
   140001efc:	00 00 00 
   140001eff:	eb 08                	jmp    0x140001f09
   140001f01:	40 b6 01             	mov    sil,0x1
   140001f04:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140001f09:	8a cb                	mov    cl,bl
   140001f0b:	e8 90 02 00 00       	call   0x1400021a0
   140001f10:	e8 0b 06 00 00       	call   0x140002520
   140001f15:	48 8b d8             	mov    rbx,rax
   140001f18:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140001f1c:	74 1e                	je     0x140001f3c
   140001f1e:	48 8b c8             	mov    rcx,rax
   140001f21:	e8 e2 01 00 00       	call   0x140002108
   140001f26:	84 c0                	test   al,al
   140001f28:	74 12                	je     0x140001f3c
   140001f2a:	45 33 c0             	xor    r8d,r8d
   140001f2d:	41 8d 50 02          	lea    edx,[r8+0x2]
   140001f31:	33 c9                	xor    ecx,ecx
   140001f33:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001f36:	ff 15 8c 13 00 00    	call   QWORD PTR [rip+0x138c]        # 0x1400032c8
   140001f3c:	e8 e7 05 00 00       	call   0x140002528
   140001f41:	48 8b d8             	mov    rbx,rax
   140001f44:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140001f48:	74 14                	je     0x140001f5e
   140001f4a:	48 8b c8             	mov    rcx,rax
   140001f4d:	e8 b6 01 00 00       	call   0x140002108
   140001f52:	84 c0                	test   al,al
   140001f54:	74 08                	je     0x140001f5e
   140001f56:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140001f59:	e8 b8 0b 00 00       	call   0x140002b16
   140001f5e:	e8 77 0b 00 00       	call   0x140002ada
   140001f63:	48 8b f8             	mov    rdi,rax
   140001f66:	e8 99 0b 00 00       	call   0x140002b04
   140001f6b:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   140001f6e:	e8 8b 0b 00 00       	call   0x140002afe
   140001f73:	4c 8b c7             	mov    r8,rdi
   140001f76:	48 8b d3             	mov    rdx,rbx
   140001f79:	8b 08                	mov    ecx,DWORD PTR [rax]
   140001f7b:	e8 20 f3 ff ff       	call   0x1400012a0
   140001f80:	8b d8                	mov    ebx,eax
   140001f82:	e8 09 07 00 00       	call   0x140002690
   140001f87:	84 c0                	test   al,al
   140001f89:	74 55                	je     0x140001fe0
   140001f8b:	40 84 f6             	test   sil,sil
   140001f8e:	75 05                	jne    0x140001f95
   140001f90:	e8 75 0b 00 00       	call   0x140002b0a
   140001f95:	33 d2                	xor    edx,edx
   140001f97:	b1 01                	mov    cl,0x1
   140001f99:	e8 26 02 00 00       	call   0x1400021c4
   140001f9e:	8b c3                	mov    eax,ebx
   140001fa0:	eb 19                	jmp    0x140001fbb
   140001fa2:	8b d8                	mov    ebx,eax
   140001fa4:	e8 e7 06 00 00       	call   0x140002690
   140001fa9:	84 c0                	test   al,al
   140001fab:	74 3b                	je     0x140001fe8
   140001fad:	80 7c 24 20 00       	cmp    BYTE PTR [rsp+0x20],0x0
   140001fb2:	75 05                	jne    0x140001fb9
   140001fb4:	e8 57 0b 00 00       	call   0x140002b10
   140001fb9:	8b c3                	mov    eax,ebx
   140001fbb:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   140001fc0:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   140001fc5:	48 83 c4 30          	add    rsp,0x30
   140001fc9:	5f                   	pop    rdi
   140001fca:	c3                   	ret
   140001fcb:	b9 07 00 00 00       	mov    ecx,0x7
   140001fd0:	e8 67 05 00 00       	call   0x14000253c
   140001fd5:	90                   	nop
   140001fd6:	b9 07 00 00 00       	mov    ecx,0x7
   140001fdb:	e8 5c 05 00 00       	call   0x14000253c
   140001fe0:	8b cb                	mov    ecx,ebx
   140001fe2:	e8 05 0b 00 00       	call   0x140002aec
   140001fe7:	90                   	nop
   140001fe8:	8b cb                	mov    ecx,ebx
   140001fea:	e8 03 0b 00 00       	call   0x140002af2
   140001fef:	90                   	nop
   140001ff0:	48 83 ec 28          	sub    rsp,0x28
   140001ff4:	e8 17 04 00 00       	call   0x140002410
   140001ff9:	48 83 c4 28          	add    rsp,0x28
   140001ffd:	e9 72 fe ff ff       	jmp    0x140001e74
   140002002:	cc                   	int3
   140002003:	cc                   	int3
   140002004:	48 83 ec 28          	sub    rsp,0x28
   140002008:	e8 5b 0a 00 00       	call   0x140002a68
   14000200d:	85 c0                	test   eax,eax
   14000200f:	74 21                	je     0x140002032
   140002011:	65 48 8b 04 25 30 00 	mov    rax,QWORD PTR gs:0x30
   140002018:	00 00 
   14000201a:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   14000201e:	eb 05                	jmp    0x140002025
   140002020:	48 3b c8             	cmp    rcx,rax
   140002023:	74 14                	je     0x140002039
   140002025:	33 c0                	xor    eax,eax
   140002027:	f0 48 0f b1 0d 68 31 	lock cmpxchg QWORD PTR [rip+0x3168],rcx        # 0x140005198
   14000202e:	00 00 
   140002030:	75 ee                	jne    0x140002020
   140002032:	32 c0                	xor    al,al
   140002034:	48 83 c4 28          	add    rsp,0x28
   140002038:	c3                   	ret
   140002039:	b0 01                	mov    al,0x1
   14000203b:	eb f7                	jmp    0x140002034
   14000203d:	cc                   	int3
   14000203e:	cc                   	int3
   14000203f:	cc                   	int3
   140002040:	48 83 ec 28          	sub    rsp,0x28
   140002044:	85 c9                	test   ecx,ecx
   140002046:	75 07                	jne    0x14000204f
   140002048:	c6 05 51 31 00 00 01 	mov    BYTE PTR [rip+0x3151],0x1        # 0x1400051a0
   14000204f:	e8 7c 07 00 00       	call   0x1400027d0
   140002054:	e8 8b 04 00 00       	call   0x1400024e4
   140002059:	84 c0                	test   al,al
   14000205b:	75 04                	jne    0x140002061
   14000205d:	32 c0                	xor    al,al
   14000205f:	eb 14                	jmp    0x140002075
   140002061:	e8 7e 04 00 00       	call   0x1400024e4
   140002066:	84 c0                	test   al,al
   140002068:	75 09                	jne    0x140002073
   14000206a:	33 c9                	xor    ecx,ecx
   14000206c:	e8 73 04 00 00       	call   0x1400024e4
   140002071:	eb ea                	jmp    0x14000205d
   140002073:	b0 01                	mov    al,0x1
   140002075:	48 83 c4 28          	add    rsp,0x28
   140002079:	c3                   	ret
   14000207a:	cc                   	int3
   14000207b:	cc                   	int3
   14000207c:	40 53                	rex push rbx
   14000207e:	48 83 ec 20          	sub    rsp,0x20
   140002082:	80 3d 18 31 00 00 00 	cmp    BYTE PTR [rip+0x3118],0x0        # 0x1400051a1
   140002089:	8b d9                	mov    ebx,ecx
   14000208b:	75 67                	jne    0x1400020f4
   14000208d:	83 f9 01             	cmp    ecx,0x1
   140002090:	77 6a                	ja     0x1400020fc
   140002092:	e8 d1 09 00 00       	call   0x140002a68
   140002097:	85 c0                	test   eax,eax
   140002099:	74 28                	je     0x1400020c3
   14000209b:	85 db                	test   ebx,ebx
   14000209d:	75 24                	jne    0x1400020c3
   14000209f:	48 8d 0d 02 31 00 00 	lea    rcx,[rip+0x3102]        # 0x1400051a8
   1400020a6:	e8 83 0a 00 00       	call   0x140002b2e
   1400020ab:	85 c0                	test   eax,eax
   1400020ad:	75 10                	jne    0x1400020bf
   1400020af:	48 8d 0d 0a 31 00 00 	lea    rcx,[rip+0x310a]        # 0x1400051c0
   1400020b6:	e8 73 0a 00 00       	call   0x140002b2e
   1400020bb:	85 c0                	test   eax,eax
   1400020bd:	74 2e                	je     0x1400020ed
   1400020bf:	32 c0                	xor    al,al
   1400020c1:	eb 33                	jmp    0x1400020f6
   1400020c3:	66 0f 6f 05 95 12 00 	movdqa xmm0,XMMWORD PTR [rip+0x1295]        # 0x140003360
   1400020ca:	00 
   1400020cb:	48 83 c8 ff          	or     rax,0xffffffffffffffff
   1400020cf:	f3 0f 7f 05 d1 30 00 	movdqu XMMWORD PTR [rip+0x30d1],xmm0        # 0x1400051a8
   1400020d6:	00 
   1400020d7:	48 89 05 da 30 00 00 	mov    QWORD PTR [rip+0x30da],rax        # 0x1400051b8
   1400020de:	f3 0f 7f 05 da 30 00 	movdqu XMMWORD PTR [rip+0x30da],xmm0        # 0x1400051c0
   1400020e5:	00 
   1400020e6:	48 89 05 e3 30 00 00 	mov    QWORD PTR [rip+0x30e3],rax        # 0x1400051d0
   1400020ed:	c6 05 ad 30 00 00 01 	mov    BYTE PTR [rip+0x30ad],0x1        # 0x1400051a1
   1400020f4:	b0 01                	mov    al,0x1
   1400020f6:	48 83 c4 20          	add    rsp,0x20
   1400020fa:	5b                   	pop    rbx
   1400020fb:	c3                   	ret
   1400020fc:	b9 05 00 00 00       	mov    ecx,0x5
   140002101:	e8 36 04 00 00       	call   0x14000253c
   140002106:	cc                   	int3
   140002107:	cc                   	int3
   140002108:	48 83 ec 18          	sub    rsp,0x18
   14000210c:	4c 8b c1             	mov    r8,rcx
   14000210f:	b8 4d 5a 00 00       	mov    eax,0x5a4d
   140002114:	66 39 05 e5 de ff ff 	cmp    WORD PTR [rip+0xffffffffffffdee5],ax        # 0x140000000
   14000211b:	75 78                	jne    0x140002195
   14000211d:	48 63 0d 18 df ff ff 	movsxd rcx,DWORD PTR [rip+0xffffffffffffdf18]        # 0x14000003c
   140002124:	48 8d 15 d5 de ff ff 	lea    rdx,[rip+0xffffffffffffded5]        # 0x140000000
   14000212b:	48 03 ca             	add    rcx,rdx
   14000212e:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   140002134:	75 5f                	jne    0x140002195
   140002136:	b8 0b 02 00 00       	mov    eax,0x20b
   14000213b:	66 39 41 18          	cmp    WORD PTR [rcx+0x18],ax
   14000213f:	75 54                	jne    0x140002195
   140002141:	4c 2b c2             	sub    r8,rdx
   140002144:	0f b7 51 14          	movzx  edx,WORD PTR [rcx+0x14]
   140002148:	48 83 c2 18          	add    rdx,0x18
   14000214c:	48 03 d1             	add    rdx,rcx
   14000214f:	0f b7 41 06          	movzx  eax,WORD PTR [rcx+0x6]
   140002153:	48 8d 0c 80          	lea    rcx,[rax+rax*4]
   140002157:	4c 8d 0c ca          	lea    r9,[rdx+rcx*8]
   14000215b:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
   14000215f:	49 3b d1             	cmp    rdx,r9
   140002162:	74 18                	je     0x14000217c
   140002164:	8b 4a 0c             	mov    ecx,DWORD PTR [rdx+0xc]
   140002167:	4c 3b c1             	cmp    r8,rcx
   14000216a:	72 0a                	jb     0x140002176
   14000216c:	8b 42 08             	mov    eax,DWORD PTR [rdx+0x8]
   14000216f:	03 c1                	add    eax,ecx
   140002171:	4c 3b c0             	cmp    r8,rax
   140002174:	72 08                	jb     0x14000217e
   140002176:	48 83 c2 28          	add    rdx,0x28
   14000217a:	eb df                	jmp    0x14000215b
   14000217c:	33 d2                	xor    edx,edx
   14000217e:	48 85 d2             	test   rdx,rdx
   140002181:	75 04                	jne    0x140002187
   140002183:	32 c0                	xor    al,al
   140002185:	eb 14                	jmp    0x14000219b
   140002187:	83 7a 24 00          	cmp    DWORD PTR [rdx+0x24],0x0
   14000218b:	7d 04                	jge    0x140002191
   14000218d:	32 c0                	xor    al,al
   14000218f:	eb 0a                	jmp    0x14000219b
   140002191:	b0 01                	mov    al,0x1
   140002193:	eb 06                	jmp    0x14000219b
   140002195:	32 c0                	xor    al,al
   140002197:	eb 02                	jmp    0x14000219b
   140002199:	32 c0                	xor    al,al
   14000219b:	48 83 c4 18          	add    rsp,0x18
   14000219f:	c3                   	ret
   1400021a0:	40 53                	rex push rbx
   1400021a2:	48 83 ec 20          	sub    rsp,0x20
   1400021a6:	8a d9                	mov    bl,cl
   1400021a8:	e8 bb 08 00 00       	call   0x140002a68
   1400021ad:	33 d2                	xor    edx,edx
   1400021af:	85 c0                	test   eax,eax
   1400021b1:	74 0b                	je     0x1400021be
   1400021b3:	84 db                	test   bl,bl
   1400021b5:	75 07                	jne    0x1400021be
   1400021b7:	48 87 15 da 2f 00 00 	xchg   QWORD PTR [rip+0x2fda],rdx        # 0x140005198
   1400021be:	48 83 c4 20          	add    rsp,0x20
   1400021c2:	5b                   	pop    rbx
   1400021c3:	c3                   	ret
   1400021c4:	40 53                	rex push rbx
   1400021c6:	48 83 ec 20          	sub    rsp,0x20
   1400021ca:	80 3d cf 2f 00 00 00 	cmp    BYTE PTR [rip+0x2fcf],0x0        # 0x1400051a0
   1400021d1:	8a d9                	mov    bl,cl
   1400021d3:	74 04                	je     0x1400021d9
   1400021d5:	84 d2                	test   dl,dl
   1400021d7:	75 0c                	jne    0x1400021e5
   1400021d9:	e8 06 03 00 00       	call   0x1400024e4
   1400021de:	8a cb                	mov    cl,bl
   1400021e0:	e8 ff 02 00 00       	call   0x1400024e4
   1400021e5:	b0 01                	mov    al,0x1
   1400021e7:	48 83 c4 20          	add    rsp,0x20
   1400021eb:	5b                   	pop    rbx
   1400021ec:	c3                   	ret
   1400021ed:	cc                   	int3
   1400021ee:	cc                   	int3
   1400021ef:	cc                   	int3
   1400021f0:	40 53                	rex push rbx
   1400021f2:	48 83 ec 20          	sub    rsp,0x20
   1400021f6:	48 83 3d aa 2f 00 00 	cmp    QWORD PTR [rip+0x2faa],0xffffffffffffffff        # 0x1400051a8
   1400021fd:	ff 
   1400021fe:	48 8b d9             	mov    rbx,rcx
   140002201:	75 07                	jne    0x14000220a
   140002203:	e8 32 09 00 00       	call   0x140002b3a
   140002208:	eb 0f                	jmp    0x140002219
   14000220a:	48 8b d3             	mov    rdx,rbx
   14000220d:	48 8d 0d 94 2f 00 00 	lea    rcx,[rip+0x2f94]        # 0x1400051a8
   140002214:	e8 1b 09 00 00       	call   0x140002b34
   140002219:	33 d2                	xor    edx,edx
   14000221b:	85 c0                	test   eax,eax
   14000221d:	48 0f 44 d3          	cmove  rdx,rbx
   140002221:	48 8b c2             	mov    rax,rdx
   140002224:	48 83 c4 20          	add    rsp,0x20
   140002228:	5b                   	pop    rbx
   140002229:	c3                   	ret
   14000222a:	cc                   	int3
   14000222b:	cc                   	int3
   14000222c:	48 83 ec 28          	sub    rsp,0x28
   140002230:	e8 bb ff ff ff       	call   0x1400021f0
   140002235:	48 f7 d8             	neg    rax
   140002238:	1b c0                	sbb    eax,eax
   14000223a:	f7 d8                	neg    eax
   14000223c:	ff c8                	dec    eax
   14000223e:	48 83 c4 28          	add    rsp,0x28
   140002242:	c3                   	ret
   140002243:	cc                   	int3
   140002244:	c2 00 00             	ret    0x0
   140002247:	cc                   	int3
   140002248:	40 53                	rex push rbx
   14000224a:	48 83 ec 20          	sub    rsp,0x20
   14000224e:	48 8b d9             	mov    rbx,rcx
   140002251:	33 c9                	xor    ecx,ecx
   140002253:	ff 15 c7 0d 00 00    	call   QWORD PTR [rip+0xdc7]        # 0x140003020
   140002259:	48 8b cb             	mov    rcx,rbx
   14000225c:	ff 15 b6 0d 00 00    	call   QWORD PTR [rip+0xdb6]        # 0x140003018
   140002262:	ff 15 c0 0d 00 00    	call   QWORD PTR [rip+0xdc0]        # 0x140003028
   140002268:	48 8b c8             	mov    rcx,rax
   14000226b:	ba 09 04 00 c0       	mov    edx,0xc0000409
   140002270:	48 83 c4 20          	add    rsp,0x20
   140002274:	5b                   	pop    rbx
   140002275:	48 ff 25 b4 0d 00 00 	rex.W jmp QWORD PTR [rip+0xdb4]        # 0x140003030
   14000227c:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   140002281:	48 83 ec 38          	sub    rsp,0x38
   140002285:	b9 17 00 00 00       	mov    ecx,0x17
   14000228a:	ff 15 a8 0d 00 00    	call   QWORD PTR [rip+0xda8]        # 0x140003038
   140002290:	85 c0                	test   eax,eax
   140002292:	74 07                	je     0x14000229b
   140002294:	b9 02 00 00 00       	mov    ecx,0x2
   140002299:	cd 29                	int    0x29
   14000229b:	48 8d 0d de 2f 00 00 	lea    rcx,[rip+0x2fde]        # 0x140005280
   1400022a2:	e8 a9 00 00 00       	call   0x140002350
   1400022a7:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   1400022ac:	48 89 05 c5 30 00 00 	mov    QWORD PTR [rip+0x30c5],rax        # 0x140005378
   1400022b3:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   1400022b8:	48 83 c0 08          	add    rax,0x8
   1400022bc:	48 89 05 55 30 00 00 	mov    QWORD PTR [rip+0x3055],rax        # 0x140005318
   1400022c3:	48 8b 05 ae 30 00 00 	mov    rax,QWORD PTR [rip+0x30ae]        # 0x140005378
   1400022ca:	48 89 05 1f 2f 00 00 	mov    QWORD PTR [rip+0x2f1f],rax        # 0x1400051f0
   1400022d1:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   1400022d6:	48 89 05 23 30 00 00 	mov    QWORD PTR [rip+0x3023],rax        # 0x140005300
   1400022dd:	c7 05 f9 2e 00 00 09 	mov    DWORD PTR [rip+0x2ef9],0xc0000409        # 0x1400051e0
   1400022e4:	04 00 c0 
   1400022e7:	c7 05 f3 2e 00 00 01 	mov    DWORD PTR [rip+0x2ef3],0x1        # 0x1400051e4
   1400022ee:	00 00 00 
   1400022f1:	c7 05 fd 2e 00 00 01 	mov    DWORD PTR [rip+0x2efd],0x1        # 0x1400051f8
   1400022f8:	00 00 00 
   1400022fb:	b8 08 00 00 00       	mov    eax,0x8
   140002300:	48 6b c0 00          	imul   rax,rax,0x0
   140002304:	48 8d 0d f5 2e 00 00 	lea    rcx,[rip+0x2ef5]        # 0x140005200
   14000230b:	48 c7 04 01 02 00 00 	mov    QWORD PTR [rcx+rax*1],0x2
   140002312:	00 
   140002313:	b8 08 00 00 00       	mov    eax,0x8
   140002318:	48 6b c0 00          	imul   rax,rax,0x0
   14000231c:	48 8b 0d 1d 2d 00 00 	mov    rcx,QWORD PTR [rip+0x2d1d]        # 0x140005040
   140002323:	48 89 4c 04 20       	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140002328:	b8 08 00 00 00       	mov    eax,0x8
   14000232d:	48 6b c0 01          	imul   rax,rax,0x1
   140002331:	48 8b 0d 48 2d 00 00 	mov    rcx,QWORD PTR [rip+0x2d48]        # 0x140005080
   140002338:	48 89 4c 04 20       	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   14000233d:	48 8d 0d 2c 10 00 00 	lea    rcx,[rip+0x102c]        # 0x140003370
   140002344:	e8 ff fe ff ff       	call   0x140002248
   140002349:	90                   	nop
   14000234a:	48 83 c4 38          	add    rsp,0x38
   14000234e:	c3                   	ret
   14000234f:	cc                   	int3
   140002350:	40 53                	rex push rbx
   140002352:	56                   	push   rsi
   140002353:	57                   	push   rdi
   140002354:	48 83 ec 40          	sub    rsp,0x40
   140002358:	48 8b d9             	mov    rbx,rcx
   14000235b:	ff 15 17 0d 00 00    	call   QWORD PTR [rip+0xd17]        # 0x140003078
   140002361:	48 8b b3 f8 00 00 00 	mov    rsi,QWORD PTR [rbx+0xf8]
   140002368:	33 ff                	xor    edi,edi
   14000236a:	45 33 c0             	xor    r8d,r8d
   14000236d:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   140002372:	48 8b ce             	mov    rcx,rsi
   140002375:	ff 15 8d 0c 00 00    	call   QWORD PTR [rip+0xc8d]        # 0x140003008
   14000237b:	48 85 c0             	test   rax,rax
   14000237e:	74 3c                	je     0x1400023bc
   140002380:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140002385:	48 8d 4c 24 68       	lea    rcx,[rsp+0x68]
   14000238a:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   140002391:	00 00 
   140002393:	4c 8b c8             	mov    r9,rax
   140002396:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   14000239b:	4c 8b c6             	mov    r8,rsi
   14000239e:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   1400023a3:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   1400023a8:	33 c9                	xor    ecx,ecx
   1400023aa:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   1400023af:	ff 15 5b 0c 00 00    	call   QWORD PTR [rip+0xc5b]        # 0x140003010
   1400023b5:	ff c7                	inc    edi
   1400023b7:	83 ff 02             	cmp    edi,0x2
   1400023ba:	7c ae                	jl     0x14000236a
   1400023bc:	48 83 c4 40          	add    rsp,0x40
   1400023c0:	5f                   	pop    rdi
   1400023c1:	5e                   	pop    rsi
   1400023c2:	5b                   	pop    rbx
   1400023c3:	c3                   	ret
   1400023c4:	48 8d 05 e5 0f 00 00 	lea    rax,[rip+0xfe5]        # 0x1400033b0
   1400023cb:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   1400023d2:	00 
   1400023d3:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   1400023d7:	48 8d 05 c2 0f 00 00 	lea    rax,[rip+0xfc2]        # 0x1400033a0
   1400023de:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400023e1:	48 8b c1             	mov    rax,rcx
   1400023e4:	c3                   	ret
   1400023e5:	cc                   	int3
   1400023e6:	cc                   	int3
   1400023e7:	cc                   	int3
   1400023e8:	48 83 ec 48          	sub    rsp,0x48
   1400023ec:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   1400023f1:	e8 ce ff ff ff       	call   0x1400023c4
   1400023f6:	48 8d 15 8b 1c 00 00 	lea    rdx,[rip+0x1c8b]        # 0x140004088
   1400023fd:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140002402:	e8 8b 06 00 00       	call   0x140002a92
   140002407:	cc                   	int3
   140002408:	e9 9d 06 00 00       	jmp    0x140002aaa
   14000240d:	cc                   	int3
   14000240e:	cc                   	int3
   14000240f:	cc                   	int3
   140002410:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   140002415:	55                   	push   rbp
   140002416:	48 8b ec             	mov    rbp,rsp
   140002419:	48 83 ec 30          	sub    rsp,0x30
   14000241d:	48 8b 05 1c 2c 00 00 	mov    rax,QWORD PTR [rip+0x2c1c]        # 0x140005040
   140002424:	48 bb 32 a2 df 2d 99 	movabs rbx,0x2b992ddfa232
   14000242b:	2b 00 00 
   14000242e:	48 3b c3             	cmp    rax,rbx
   140002431:	75 77                	jne    0x1400024aa
   140002433:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   140002437:	48 c7 45 10 00 00 00 	mov    QWORD PTR [rbp+0x10],0x0
   14000243e:	00 
   14000243f:	ff 15 13 0c 00 00    	call   QWORD PTR [rip+0xc13]        # 0x140003058
   140002445:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002449:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000244d:	ff 15 fd 0b 00 00    	call   QWORD PTR [rip+0xbfd]        # 0x140003050
   140002453:	8b c0                	mov    eax,eax
   140002455:	48 31 45 f0          	xor    QWORD PTR [rbp-0x10],rax
   140002459:	ff 15 e9 0b 00 00    	call   QWORD PTR [rip+0xbe9]        # 0x140003048
   14000245f:	8b c0                	mov    eax,eax
   140002461:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   140002465:	48 31 45 f0          	xor    QWORD PTR [rbp-0x10],rax
   140002469:	ff 15 d1 0b 00 00    	call   QWORD PTR [rip+0xbd1]        # 0x140003040
   14000246f:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140002472:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140002476:	48 c1 e0 20          	shl    rax,0x20
   14000247a:	48 33 45 18          	xor    rax,QWORD PTR [rbp+0x18]
   14000247e:	48 33 45 f0          	xor    rax,QWORD PTR [rbp-0x10]
   140002482:	48 33 c1             	xor    rax,rcx
   140002485:	48 b9 ff ff ff ff ff 	movabs rcx,0xffffffffffff
   14000248c:	ff 00 00 
   14000248f:	48 23 c1             	and    rax,rcx
   140002492:	48 b9 33 a2 df 2d 99 	movabs rcx,0x2b992ddfa233
   140002499:	2b 00 00 
   14000249c:	48 3b c3             	cmp    rax,rbx
   14000249f:	48 0f 44 c1          	cmove  rax,rcx
   1400024a3:	48 89 05 96 2b 00 00 	mov    QWORD PTR [rip+0x2b96],rax        # 0x140005040
   1400024aa:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
   1400024af:	48 f7 d0             	not    rax
   1400024b2:	48 89 05 c7 2b 00 00 	mov    QWORD PTR [rip+0x2bc7],rax        # 0x140005080
   1400024b9:	48 83 c4 30          	add    rsp,0x30
   1400024bd:	5d                   	pop    rbp
   1400024be:	c3                   	ret
   1400024bf:	cc                   	int3
   1400024c0:	33 c0                	xor    eax,eax
   1400024c2:	c3                   	ret
   1400024c3:	cc                   	int3
   1400024c4:	b8 01 00 00 00       	mov    eax,0x1
   1400024c9:	c3                   	ret
   1400024ca:	cc                   	int3
   1400024cb:	cc                   	int3
   1400024cc:	b8 00 40 00 00       	mov    eax,0x4000
   1400024d1:	c3                   	ret
   1400024d2:	cc                   	int3
   1400024d3:	cc                   	int3
   1400024d4:	48 8d 0d 75 32 00 00 	lea    rcx,[rip+0x3275]        # 0x140005750
   1400024db:	48 ff 25 7e 0b 00 00 	rex.W jmp QWORD PTR [rip+0xb7e]        # 0x140003060
   1400024e2:	cc                   	int3
   1400024e3:	cc                   	int3
   1400024e4:	b0 01                	mov    al,0x1
   1400024e6:	c3                   	ret
   1400024e7:	cc                   	int3
   1400024e8:	48 8d 05 71 32 00 00 	lea    rax,[rip+0x3271]        # 0x140005760
   1400024ef:	c3                   	ret
   1400024f0:	48 8d 05 71 32 00 00 	lea    rax,[rip+0x3271]        # 0x140005768
   1400024f7:	c3                   	ret
   1400024f8:	48 83 ec 28          	sub    rsp,0x28
   1400024fc:	e8 e7 ff ff ff       	call   0x1400024e8
   140002501:	48 83 08 24          	or     QWORD PTR [rax],0x24
   140002505:	e8 e6 ff ff ff       	call   0x1400024f0
   14000250a:	48 83 08 02          	or     QWORD PTR [rax],0x2
   14000250e:	48 83 c4 28          	add    rsp,0x28
   140002512:	c3                   	ret
   140002513:	cc                   	int3
   140002514:	33 c0                	xor    eax,eax
   140002516:	39 05 6c 2b 00 00    	cmp    DWORD PTR [rip+0x2b6c],eax        # 0x140005088
   14000251c:	0f 94 c0             	sete   al
   14000251f:	c3                   	ret
   140002520:	48 8d 05 69 32 00 00 	lea    rax,[rip+0x3269]        # 0x140005790
   140002527:	c3                   	ret
   140002528:	48 8d 05 59 32 00 00 	lea    rax,[rip+0x3259]        # 0x140005788
   14000252f:	c3                   	ret
   140002530:	c7 05 36 32 00 00 00 	mov    DWORD PTR [rip+0x3236],0x0        # 0x140005770
   140002537:	00 00 00 
   14000253a:	c3                   	ret
   14000253b:	cc                   	int3
   14000253c:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002541:	55                   	push   rbp
   140002542:	48 8d ac 24 40 fb ff 	lea    rbp,[rsp-0x4c0]
   140002549:	ff 
   14000254a:	48 81 ec c0 05 00 00 	sub    rsp,0x5c0
   140002551:	8b d9                	mov    ebx,ecx
   140002553:	b9 17 00 00 00       	mov    ecx,0x17
   140002558:	ff 15 da 0a 00 00    	call   QWORD PTR [rip+0xada]        # 0x140003038
   14000255e:	85 c0                	test   eax,eax
   140002560:	74 04                	je     0x140002566
   140002562:	8b cb                	mov    ecx,ebx
   140002564:	cd 29                	int    0x29
   140002566:	b9 03 00 00 00       	mov    ecx,0x3
   14000256b:	e8 c0 ff ff ff       	call   0x140002530
   140002570:	33 d2                	xor    edx,edx
   140002572:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140002576:	41 b8 d0 04 00 00    	mov    r8d,0x4d0
   14000257c:	e8 23 05 00 00       	call   0x140002aa4
   140002581:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140002585:	ff 15 ed 0a 00 00    	call   QWORD PTR [rip+0xaed]        # 0x140003078
   14000258b:	48 8b 9d e8 00 00 00 	mov    rbx,QWORD PTR [rbp+0xe8]
   140002592:	48 8d 95 d8 04 00 00 	lea    rdx,[rbp+0x4d8]
   140002599:	48 8b cb             	mov    rcx,rbx
   14000259c:	45 33 c0             	xor    r8d,r8d
   14000259f:	ff 15 63 0a 00 00    	call   QWORD PTR [rip+0xa63]        # 0x140003008
   1400025a5:	48 85 c0             	test   rax,rax
   1400025a8:	74 3f                	je     0x1400025e9
   1400025aa:	48 8b 95 d8 04 00 00 	mov    rdx,QWORD PTR [rbp+0x4d8]
   1400025b1:	48 8d 8d e0 04 00 00 	lea    rcx,[rbp+0x4e0]
   1400025b8:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   1400025bf:	00 00 
   1400025c1:	4c 8b c8             	mov    r9,rax
   1400025c4:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   1400025c9:	4c 8b c3             	mov    r8,rbx
   1400025cc:	48 8d 8d e8 04 00 00 	lea    rcx,[rbp+0x4e8]
   1400025d3:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   1400025d8:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1400025dc:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   1400025e1:	33 c9                	xor    ecx,ecx
   1400025e3:	ff 15 27 0a 00 00    	call   QWORD PTR [rip+0xa27]        # 0x140003010
   1400025e9:	48 8b 85 c8 04 00 00 	mov    rax,QWORD PTR [rbp+0x4c8]
   1400025f0:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
   1400025f5:	48 89 85 e8 00 00 00 	mov    QWORD PTR [rbp+0xe8],rax
   1400025fc:	33 d2                	xor    edx,edx
   1400025fe:	48 8d 85 c8 04 00 00 	lea    rax,[rbp+0x4c8]
   140002605:	41 b8 98 00 00 00    	mov    r8d,0x98
   14000260b:	48 83 c0 08          	add    rax,0x8
   14000260f:	48 89 85 88 00 00 00 	mov    QWORD PTR [rbp+0x88],rax
   140002616:	e8 89 04 00 00       	call   0x140002aa4
   14000261b:	48 8b 85 c8 04 00 00 	mov    rax,QWORD PTR [rbp+0x4c8]
   140002622:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   140002627:	c7 44 24 50 15 00 00 	mov    DWORD PTR [rsp+0x50],0x40000015
   14000262e:	40 
   14000262f:	c7 44 24 54 01 00 00 	mov    DWORD PTR [rsp+0x54],0x1
   140002636:	00 
   140002637:	ff 15 2b 0a 00 00    	call   QWORD PTR [rip+0xa2b]        # 0x140003068
   14000263d:	8b d8                	mov    ebx,eax
   14000263f:	33 c9                	xor    ecx,ecx
   140002641:	48 8d 44 24 50       	lea    rax,[rsp+0x50]
   140002646:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   14000264b:	48 8d 45 f0          	lea    rax,[rbp-0x10]
   14000264f:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140002654:	ff 15 c6 09 00 00    	call   QWORD PTR [rip+0x9c6]        # 0x140003020
   14000265a:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   14000265f:	ff 15 b3 09 00 00    	call   QWORD PTR [rip+0x9b3]        # 0x140003018
   140002665:	85 c0                	test   eax,eax
   140002667:	75 0d                	jne    0x140002676
   140002669:	83 fb 01             	cmp    ebx,0x1
   14000266c:	74 08                	je     0x140002676
   14000266e:	8d 48 03             	lea    ecx,[rax+0x3]
   140002671:	e8 ba fe ff ff       	call   0x140002530
   140002676:	48 8b 9c 24 d0 05 00 	mov    rbx,QWORD PTR [rsp+0x5d0]
   14000267d:	00 
   14000267e:	48 81 c4 c0 05 00 00 	add    rsp,0x5c0
   140002685:	5d                   	pop    rbp
   140002686:	c3                   	ret
   140002687:	cc                   	int3
   140002688:	e9 33 fe ff ff       	jmp    0x1400024c0
   14000268d:	cc                   	int3
   14000268e:	cc                   	int3
   14000268f:	cc                   	int3
   140002690:	48 83 ec 28          	sub    rsp,0x28
   140002694:	33 c9                	xor    ecx,ecx
   140002696:	ff 15 d4 09 00 00    	call   QWORD PTR [rip+0x9d4]        # 0x140003070
   14000269c:	48 85 c0             	test   rax,rax
   14000269f:	74 3a                	je     0x1400026db
   1400026a1:	b9 4d 5a 00 00       	mov    ecx,0x5a4d
   1400026a6:	66 39 08             	cmp    WORD PTR [rax],cx
   1400026a9:	75 30                	jne    0x1400026db
   1400026ab:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   1400026af:	81 3c 01 50 45 00 00 	cmp    DWORD PTR [rcx+rax*1],0x4550
   1400026b6:	75 23                	jne    0x1400026db
   1400026b8:	ba 0b 02 00 00       	mov    edx,0x20b
   1400026bd:	66 39 54 01 18       	cmp    WORD PTR [rcx+rax*1+0x18],dx
   1400026c2:	75 17                	jne    0x1400026db
   1400026c4:	83 bc 01 84 00 00 00 	cmp    DWORD PTR [rcx+rax*1+0x84],0xe
   1400026cb:	0e 
   1400026cc:	76 0d                	jbe    0x1400026db
   1400026ce:	83 bc 01 f8 00 00 00 	cmp    DWORD PTR [rcx+rax*1+0xf8],0x0
   1400026d5:	00 
   1400026d6:	0f 95 c0             	setne  al
   1400026d9:	eb 02                	jmp    0x1400026dd
   1400026db:	32 c0                	xor    al,al
   1400026dd:	48 83 c4 28          	add    rsp,0x28
   1400026e1:	c3                   	ret
   1400026e2:	cc                   	int3
   1400026e3:	cc                   	int3
   1400026e4:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 0x1400026f4
   1400026eb:	48 ff 25 2e 09 00 00 	rex.W jmp QWORD PTR [rip+0x92e]        # 0x140003020
   1400026f2:	cc                   	int3
   1400026f3:	cc                   	int3
   1400026f4:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400026f9:	57                   	push   rdi
   1400026fa:	48 83 ec 20          	sub    rsp,0x20
   1400026fe:	48 8b 19             	mov    rbx,QWORD PTR [rcx]
   140002701:	48 8b f9             	mov    rdi,rcx
   140002704:	81 3b 63 73 6d e0    	cmp    DWORD PTR [rbx],0xe06d7363
   14000270a:	75 24                	jne    0x140002730
   14000270c:	83 7b 18 04          	cmp    DWORD PTR [rbx+0x18],0x4
   140002710:	75 1e                	jne    0x140002730
   140002712:	8b 53 20             	mov    edx,DWORD PTR [rbx+0x20]
   140002715:	81 fa 20 05 93 19    	cmp    edx,0x19930520
   14000271b:	74 20                	je     0x14000273d
   14000271d:	8d 82 df fa 6c e6    	lea    eax,[rdx-0x19930521]
   140002723:	83 f8 01             	cmp    eax,0x1
   140002726:	76 15                	jbe    0x14000273d
   140002728:	81 fa 00 40 99 01    	cmp    edx,0x1994000
   14000272e:	74 0d                	je     0x14000273d
   140002730:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002735:	33 c0                	xor    eax,eax
   140002737:	48 83 c4 20          	add    rsp,0x20
   14000273b:	5f                   	pop    rdi
   14000273c:	c3                   	ret
   14000273d:	e8 56 03 00 00       	call   0x140002a98
   140002742:	48 89 18             	mov    QWORD PTR [rax],rbx
   140002745:	48 8b 5f 08          	mov    rbx,QWORD PTR [rdi+0x8]
   140002749:	e8 50 03 00 00       	call   0x140002a9e
   14000274e:	48 89 18             	mov    QWORD PTR [rax],rbx
   140002751:	e8 ea 03 00 00       	call   0x140002b40
   140002756:	cc                   	int3
   140002757:	cc                   	int3
   140002758:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   14000275d:	57                   	push   rdi
   14000275e:	48 83 ec 20          	sub    rsp,0x20
   140002762:	48 8d 1d 07 16 00 00 	lea    rbx,[rip+0x1607]        # 0x140003d70
   140002769:	48 8d 3d 00 16 00 00 	lea    rdi,[rip+0x1600]        # 0x140003d70
   140002770:	eb 12                	jmp    0x140002784
   140002772:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002775:	48 85 c0             	test   rax,rax
   140002778:	74 06                	je     0x140002780
   14000277a:	ff 15 48 0b 00 00    	call   QWORD PTR [rip+0xb48]        # 0x1400032c8
   140002780:	48 83 c3 08          	add    rbx,0x8
   140002784:	48 3b df             	cmp    rbx,rdi
   140002787:	72 e9                	jb     0x140002772
   140002789:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000278e:	48 83 c4 20          	add    rsp,0x20
   140002792:	5f                   	pop    rdi
   140002793:	c3                   	ret
   140002794:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002799:	57                   	push   rdi
   14000279a:	48 83 ec 20          	sub    rsp,0x20
   14000279e:	48 8d 1d db 15 00 00 	lea    rbx,[rip+0x15db]        # 0x140003d80
   1400027a5:	48 8d 3d d4 15 00 00 	lea    rdi,[rip+0x15d4]        # 0x140003d80
   1400027ac:	eb 12                	jmp    0x1400027c0
   1400027ae:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400027b1:	48 85 c0             	test   rax,rax
   1400027b4:	74 06                	je     0x1400027bc
   1400027b6:	ff 15 0c 0b 00 00    	call   QWORD PTR [rip+0xb0c]        # 0x1400032c8
   1400027bc:	48 83 c3 08          	add    rbx,0x8
   1400027c0:	48 3b df             	cmp    rbx,rdi
   1400027c3:	72 e9                	jb     0x1400027ae
   1400027c5:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400027ca:	48 83 c4 20          	add    rsp,0x20
   1400027ce:	5f                   	pop    rdi
   1400027cf:	c3                   	ret
   1400027d0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400027d5:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   1400027da:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   1400027df:	57                   	push   rdi
   1400027e0:	48 83 ec 10          	sub    rsp,0x10
   1400027e4:	33 c0                	xor    eax,eax
   1400027e6:	33 c9                	xor    ecx,ecx
   1400027e8:	0f a2                	cpuid
   1400027ea:	81 f1 6e 74 65 6c    	xor    ecx,0x6c65746e
   1400027f0:	81 f2 69 6e 65 49    	xor    edx,0x49656e69
   1400027f6:	0b d1                	or     edx,ecx
   1400027f8:	8b e8                	mov    ebp,eax
   1400027fa:	b8 01 00 00 00       	mov    eax,0x1
   1400027ff:	81 f3 47 65 6e 75    	xor    ebx,0x756e6547
   140002805:	0b d3                	or     edx,ebx
   140002807:	8d 48 ff             	lea    ecx,[rax-0x1]
   14000280a:	0f a2                	cpuid
   14000280c:	8b f9                	mov    edi,ecx
   14000280e:	75 5e                	jne    0x14000286e
   140002810:	25 f0 3f ff 0f       	and    eax,0xfff3ff0
   140002815:	48 c7 05 80 28 00 00 	mov    QWORD PTR [rip+0x2880],0x8000        # 0x1400050a0
   14000281c:	00 80 00 00 
   140002820:	48 c7 05 7d 28 00 00 	mov    QWORD PTR [rip+0x287d],0xffffffffffffffff        # 0x1400050a8
   140002827:	ff ff ff ff 
   14000282b:	3d c0 06 01 00       	cmp    eax,0x106c0
   140002830:	74 28                	je     0x14000285a
   140002832:	3d 60 06 02 00       	cmp    eax,0x20660
   140002837:	74 21                	je     0x14000285a
   140002839:	3d 70 06 02 00       	cmp    eax,0x20670
   14000283e:	74 1a                	je     0x14000285a
   140002840:	05 b0 f9 fc ff       	add    eax,0xfffcf9b0
   140002845:	83 f8 20             	cmp    eax,0x20
   140002848:	77 24                	ja     0x14000286e
   14000284a:	48 b9 01 00 01 00 01 	movabs rcx,0x100010001
   140002851:	00 00 00 
   140002854:	48 0f a3 c1          	bt     rcx,rax
   140002858:	73 14                	jae    0x14000286e
   14000285a:	44 8b 05 17 2f 00 00 	mov    r8d,DWORD PTR [rip+0x2f17]        # 0x140005778
   140002861:	41 83 c8 01          	or     r8d,0x1
   140002865:	44 89 05 0c 2f 00 00 	mov    DWORD PTR [rip+0x2f0c],r8d        # 0x140005778
   14000286c:	eb 07                	jmp    0x140002875
   14000286e:	44 8b 05 03 2f 00 00 	mov    r8d,DWORD PTR [rip+0x2f03]        # 0x140005778
   140002875:	45 33 c9             	xor    r9d,r9d
   140002878:	41 8b f1             	mov    esi,r9d
   14000287b:	45 8b d1             	mov    r10d,r9d
   14000287e:	45 8b d9             	mov    r11d,r9d
   140002881:	83 fd 07             	cmp    ebp,0x7
   140002884:	7c 40                	jl     0x1400028c6
   140002886:	41 8d 41 07          	lea    eax,[r9+0x7]
   14000288a:	33 c9                	xor    ecx,ecx
   14000288c:	0f a2                	cpuid
   14000288e:	8b f2                	mov    esi,edx
   140002890:	44 8b cb             	mov    r9d,ebx
   140002893:	0f ba e3 09          	bt     ebx,0x9
   140002897:	73 0b                	jae    0x1400028a4
   140002899:	41 83 c8 02          	or     r8d,0x2
   14000289d:	44 89 05 d4 2e 00 00 	mov    DWORD PTR [rip+0x2ed4],r8d        # 0x140005778
   1400028a4:	83 f8 01             	cmp    eax,0x1
   1400028a7:	7c 0d                	jl     0x1400028b6
   1400028a9:	b8 07 00 00 00       	mov    eax,0x7
   1400028ae:	8d 48 fa             	lea    ecx,[rax-0x6]
   1400028b1:	0f a2                	cpuid
   1400028b3:	44 8b d2             	mov    r10d,edx
   1400028b6:	b8 24 00 00 00       	mov    eax,0x24
   1400028bb:	3b e8                	cmp    ebp,eax
   1400028bd:	7c 07                	jl     0x1400028c6
   1400028bf:	33 c9                	xor    ecx,ecx
   1400028c1:	0f a2                	cpuid
   1400028c3:	44 8b db             	mov    r11d,ebx
   1400028c6:	48 8b 05 c3 27 00 00 	mov    rax,QWORD PTR [rip+0x27c3]        # 0x140005090
   1400028cd:	48 83 e0 fe          	and    rax,0xfffffffffffffffe
   1400028d1:	c7 05 bd 27 00 00 01 	mov    DWORD PTR [rip+0x27bd],0x1        # 0x140005098
   1400028d8:	00 00 00 
   1400028db:	c7 05 b7 27 00 00 02 	mov    DWORD PTR [rip+0x27b7],0x2        # 0x14000509c
   1400028e2:	00 00 00 
   1400028e5:	48 89 05 a4 27 00 00 	mov    QWORD PTR [rip+0x27a4],rax        # 0x140005090
   1400028ec:	0f ba e7 14          	bt     edi,0x14
   1400028f0:	73 1f                	jae    0x140002911
   1400028f2:	48 83 e0 ef          	and    rax,0xffffffffffffffef
   1400028f6:	c7 05 98 27 00 00 02 	mov    DWORD PTR [rip+0x2798],0x2        # 0x140005098
   1400028fd:	00 00 00 
   140002900:	48 89 05 89 27 00 00 	mov    QWORD PTR [rip+0x2789],rax        # 0x140005090
   140002907:	c7 05 8b 27 00 00 06 	mov    DWORD PTR [rip+0x278b],0x6        # 0x14000509c
   14000290e:	00 00 00 
   140002911:	0f ba e7 1b          	bt     edi,0x1b
   140002915:	0f 83 33 01 00 00    	jae    0x140002a4e
   14000291b:	33 c9                	xor    ecx,ecx
   14000291d:	0f 01 d0             	xgetbv
   140002920:	48 c1 e2 20          	shl    rdx,0x20
   140002924:	48 0b d0             	or     rdx,rax
   140002927:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   14000292c:	0f ba e7 1c          	bt     edi,0x1c
   140002930:	0f 83 fc 00 00 00    	jae    0x140002a32
   140002936:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   14000293b:	24 06                	and    al,0x6
   14000293d:	3c 06                	cmp    al,0x6
   14000293f:	0f 85 ed 00 00 00    	jne    0x140002a32
   140002945:	8b 05 51 27 00 00    	mov    eax,DWORD PTR [rip+0x2751]        # 0x14000509c
   14000294b:	b2 e0                	mov    dl,0xe0
   14000294d:	83 c8 08             	or     eax,0x8
   140002950:	c7 05 3e 27 00 00 03 	mov    DWORD PTR [rip+0x273e],0x3        # 0x140005098
   140002957:	00 00 00 
   14000295a:	89 05 3c 27 00 00    	mov    DWORD PTR [rip+0x273c],eax        # 0x14000509c
   140002960:	41 f6 c1 20          	test   r9b,0x20
   140002964:	74 62                	je     0x1400029c8
   140002966:	83 c8 20             	or     eax,0x20
   140002969:	c7 05 25 27 00 00 05 	mov    DWORD PTR [rip+0x2725],0x5        # 0x140005098
   140002970:	00 00 00 
   140002973:	89 05 23 27 00 00    	mov    DWORD PTR [rip+0x2723],eax        # 0x14000509c
   140002979:	b9 00 00 03 d0       	mov    ecx,0xd0030000
   14000297e:	48 8b 05 0b 27 00 00 	mov    rax,QWORD PTR [rip+0x270b]        # 0x140005090
   140002985:	44 23 c9             	and    r9d,ecx
   140002988:	48 83 e0 fd          	and    rax,0xfffffffffffffffd
   14000298c:	48 89 05 fd 26 00 00 	mov    QWORD PTR [rip+0x26fd],rax        # 0x140005090
   140002993:	44 3b c9             	cmp    r9d,ecx
   140002996:	75 37                	jne    0x1400029cf
   140002998:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   14000299d:	22 c2                	and    al,dl
   14000299f:	3a c2                	cmp    al,dl
   1400029a1:	75 25                	jne    0x1400029c8
   1400029a3:	48 8b 05 e6 26 00 00 	mov    rax,QWORD PTR [rip+0x26e6]        # 0x140005090
   1400029aa:	83 0d eb 26 00 00 40 	or     DWORD PTR [rip+0x26eb],0x40        # 0x14000509c
   1400029b1:	48 83 e0 db          	and    rax,0xffffffffffffffdb
   1400029b5:	c7 05 d9 26 00 00 06 	mov    DWORD PTR [rip+0x26d9],0x6        # 0x140005098
   1400029bc:	00 00 00 
   1400029bf:	48 89 05 ca 26 00 00 	mov    QWORD PTR [rip+0x26ca],rax        # 0x140005090
   1400029c6:	eb 07                	jmp    0x1400029cf
   1400029c8:	48 8b 05 c1 26 00 00 	mov    rax,QWORD PTR [rip+0x26c1]        # 0x140005090
   1400029cf:	0f ba e6 17          	bt     esi,0x17
   1400029d3:	73 0c                	jae    0x1400029e1
   1400029d5:	48 0f ba f0 18       	btr    rax,0x18
   1400029da:	48 89 05 af 26 00 00 	mov    QWORD PTR [rip+0x26af],rax        # 0x140005090
   1400029e1:	41 0f ba e2 13       	bt     r10d,0x13
   1400029e6:	73 4a                	jae    0x140002a32
   1400029e8:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   1400029ed:	22 c2                	and    al,dl
   1400029ef:	3a c2                	cmp    al,dl
   1400029f1:	75 3f                	jne    0x140002a32
   1400029f3:	41 8b cb             	mov    ecx,r11d
   1400029f6:	41 8b c3             	mov    eax,r11d
   1400029f9:	48 c1 e9 10          	shr    rcx,0x10
   1400029fd:	25 ff 00 04 00       	and    eax,0x400ff
   140002a02:	83 e1 06             	and    ecx,0x6
   140002a05:	89 05 69 2d 00 00    	mov    DWORD PTR [rip+0x2d69],eax        # 0x140005774
   140002a0b:	48 81 c9 29 00 00 01 	or     rcx,0x1000029
   140002a12:	48 f7 d1             	not    rcx
   140002a15:	48 23 0d 74 26 00 00 	and    rcx,QWORD PTR [rip+0x2674]        # 0x140005090
   140002a1c:	48 89 0d 6d 26 00 00 	mov    QWORD PTR [rip+0x266d],rcx        # 0x140005090
   140002a23:	3c 01                	cmp    al,0x1
   140002a25:	76 0b                	jbe    0x140002a32
   140002a27:	48 83 e1 bf          	and    rcx,0xffffffffffffffbf
   140002a2b:	48 89 0d 5e 26 00 00 	mov    QWORD PTR [rip+0x265e],rcx        # 0x140005090
   140002a32:	41 0f ba e2 15       	bt     r10d,0x15
   140002a37:	73 15                	jae    0x140002a4e
   140002a39:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   140002a3e:	48 0f ba e0 13       	bt     rax,0x13
   140002a43:	73 09                	jae    0x140002a4e
   140002a45:	48 0f ba 35 42 26 00 	btr    QWORD PTR [rip+0x2642],0x7        # 0x140005090
   140002a4c:	00 07 
   140002a4e:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
   140002a53:	33 c0                	xor    eax,eax
   140002a55:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
   140002a5a:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   140002a5f:	48 83 c4 10          	add    rsp,0x10
   140002a63:	5f                   	pop    rdi
   140002a64:	c3                   	ret
   140002a65:	cc                   	int3
   140002a66:	cc                   	int3
   140002a67:	cc                   	int3
   140002a68:	33 c0                	xor    eax,eax
   140002a6a:	39 05 40 26 00 00    	cmp    DWORD PTR [rip+0x2640],eax        # 0x1400050b0
   140002a70:	0f 95 c0             	setne  al
   140002a73:	c3                   	ret
   140002a74:	cc                   	int3
   140002a75:	cc                   	int3
   140002a76:	cc                   	int3
   140002a77:	cc                   	int3
   140002a78:	cc                   	int3
   140002a79:	cc                   	int3
   140002a7a:	cc                   	int3
   140002a7b:	cc                   	int3
   140002a7c:	cc                   	int3
   140002a7d:	cc                   	int3
   140002a7e:	cc                   	int3
   140002a7f:	cc                   	int3
   140002a80:	ff 25 1a 07 00 00    	jmp    QWORD PTR [rip+0x71a]        # 0x1400031a0
   140002a86:	ff 25 e4 06 00 00    	jmp    QWORD PTR [rip+0x6e4]        # 0x140003170
   140002a8c:	ff 25 fe 06 00 00    	jmp    QWORD PTR [rip+0x6fe]        # 0x140003190
   140002a92:	ff 25 d0 06 00 00    	jmp    QWORD PTR [rip+0x6d0]        # 0x140003168
   140002a98:	ff 25 c2 06 00 00    	jmp    QWORD PTR [rip+0x6c2]        # 0x140003160
   140002a9e:	ff 25 b4 06 00 00    	jmp    QWORD PTR [rip+0x6b4]        # 0x140003158
   140002aa4:	ff 25 a6 06 00 00    	jmp    QWORD PTR [rip+0x6a6]        # 0x140003150
   140002aaa:	ff 25 00 07 00 00    	jmp    QWORD PTR [rip+0x700]        # 0x1400031b0
   140002ab0:	ff 25 12 07 00 00    	jmp    QWORD PTR [rip+0x712]        # 0x1400031c8
   140002ab6:	ff 25 fc 06 00 00    	jmp    QWORD PTR [rip+0x6fc]        # 0x1400031b8
   140002abc:	ff 25 ae 07 00 00    	jmp    QWORD PTR [rip+0x7ae]        # 0x140003270
   140002ac2:	ff 25 a0 07 00 00    	jmp    QWORD PTR [rip+0x7a0]        # 0x140003268
   140002ac8:	ff 25 1a 07 00 00    	jmp    QWORD PTR [rip+0x71a]        # 0x1400031e8
   140002ace:	ff 25 84 07 00 00    	jmp    QWORD PTR [rip+0x784]        # 0x140003258
   140002ad4:	ff 25 76 07 00 00    	jmp    QWORD PTR [rip+0x776]        # 0x140003250
   140002ada:	ff 25 68 07 00 00    	jmp    QWORD PTR [rip+0x768]        # 0x140003248
   140002ae0:	ff 25 5a 07 00 00    	jmp    QWORD PTR [rip+0x75a]        # 0x140003240
   140002ae6:	ff 25 4c 07 00 00    	jmp    QWORD PTR [rip+0x74c]        # 0x140003238
   140002aec:	ff 25 3e 07 00 00    	jmp    QWORD PTR [rip+0x73e]        # 0x140003230
   140002af2:	ff 25 98 07 00 00    	jmp    QWORD PTR [rip+0x798]        # 0x140003290
   140002af8:	ff 25 a2 07 00 00    	jmp    QWORD PTR [rip+0x7a2]        # 0x1400032a0
   140002afe:	ff 25 0c 07 00 00    	jmp    QWORD PTR [rip+0x70c]        # 0x140003210
   140002b04:	ff 25 16 07 00 00    	jmp    QWORD PTR [rip+0x716]        # 0x140003220
   140002b0a:	ff 25 70 07 00 00    	jmp    QWORD PTR [rip+0x770]        # 0x140003280
   140002b10:	ff 25 62 07 00 00    	jmp    QWORD PTR [rip+0x762]        # 0x140003278
   140002b16:	ff 25 44 07 00 00    	jmp    QWORD PTR [rip+0x744]        # 0x140003260
   140002b1c:	ff 25 b6 06 00 00    	jmp    QWORD PTR [rip+0x6b6]        # 0x1400031d8
   140002b22:	ff 25 98 06 00 00    	jmp    QWORD PTR [rip+0x698]        # 0x1400031c0
   140002b28:	ff 25 7a 07 00 00    	jmp    QWORD PTR [rip+0x77a]        # 0x1400032a8
   140002b2e:	ff 25 e4 06 00 00    	jmp    QWORD PTR [rip+0x6e4]        # 0x140003218
   140002b34:	ff 25 be 06 00 00    	jmp    QWORD PTR [rip+0x6be]        # 0x1400031f8
   140002b3a:	ff 25 c0 06 00 00    	jmp    QWORD PTR [rip+0x6c0]        # 0x140003200
   140002b40:	ff 25 c2 06 00 00    	jmp    QWORD PTR [rip+0x6c2]        # 0x140003208
   140002b46:	cc                   	int3
   140002b47:	cc                   	int3
   140002b48:	40 53                	rex push rbx
   140002b4a:	45 8b 18             	mov    r11d,DWORD PTR [r8]
   140002b4d:	48 8b da             	mov    rbx,rdx
   140002b50:	41 83 e3 f8          	and    r11d,0xfffffff8
   140002b54:	4c 8b c9             	mov    r9,rcx
   140002b57:	41 f6 00 04          	test   BYTE PTR [r8],0x4
   140002b5b:	4c 8b d1             	mov    r10,rcx
   140002b5e:	74 13                	je     0x140002b73
   140002b60:	41 8b 40 08          	mov    eax,DWORD PTR [r8+0x8]
   140002b64:	4d 63 50 04          	movsxd r10,DWORD PTR [r8+0x4]
   140002b68:	f7 d8                	neg    eax
   140002b6a:	4c 03 d1             	add    r10,rcx
   140002b6d:	48 63 c8             	movsxd rcx,eax
   140002b70:	4c 23 d1             	and    r10,rcx
   140002b73:	49 63 c3             	movsxd rax,r11d
   140002b76:	4a 8b 14 10          	mov    rdx,QWORD PTR [rax+r10*1]
   140002b7a:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
   140002b7e:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
   140002b81:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140002b85:	f6 44 01 03 0f       	test   BYTE PTR [rcx+rax*1+0x3],0xf
   140002b8a:	74 10                	je     0x140002b9c
   140002b8c:	0f b6 44 01 03       	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140002b91:	b9 f0 ff ff ff       	mov    ecx,0xfffffff0
   140002b96:	48 23 c1             	and    rax,rcx
   140002b99:	4c 03 c8             	add    r9,rax
   140002b9c:	4c 33 ca             	xor    r9,rdx
   140002b9f:	49 8b c9             	mov    rcx,r9
   140002ba2:	5b                   	pop    rbx
   140002ba3:	e9 58 f1 ff ff       	jmp    0x140001d00
   140002ba8:	48 8b c4             	mov    rax,rsp
   140002bab:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
   140002baf:	48 89 68 10          	mov    QWORD PTR [rax+0x10],rbp
   140002bb3:	48 89 70 18          	mov    QWORD PTR [rax+0x18],rsi
   140002bb7:	48 89 78 20          	mov    QWORD PTR [rax+0x20],rdi
   140002bbb:	41 56                	push   r14
   140002bbd:	48 83 ec 20          	sub    rsp,0x20
   140002bc1:	49 8b 59 38          	mov    rbx,QWORD PTR [r9+0x38]
   140002bc5:	48 8b f2             	mov    rsi,rdx
   140002bc8:	4d 8b f0             	mov    r14,r8
   140002bcb:	48 8b e9             	mov    rbp,rcx
   140002bce:	49 8b d1             	mov    rdx,r9
   140002bd1:	48 8b ce             	mov    rcx,rsi
   140002bd4:	49 8b f9             	mov    rdi,r9
   140002bd7:	4c 8d 43 04          	lea    r8,[rbx+0x4]
   140002bdb:	e8 68 ff ff ff       	call   0x140002b48
   140002be0:	8b 45 04             	mov    eax,DWORD PTR [rbp+0x4]
   140002be3:	24 66                	and    al,0x66
   140002be5:	f6 d8                	neg    al
   140002be7:	b8 01 00 00 00       	mov    eax,0x1
   140002bec:	45 1b c9             	sbb    r9d,r9d
   140002bef:	41 f7 d9             	neg    r9d
   140002bf2:	44 03 c8             	add    r9d,eax
   140002bf5:	44 85 4b 04          	test   DWORD PTR [rbx+0x4],r9d
   140002bf9:	74 11                	je     0x140002c0c
   140002bfb:	4c 8b cf             	mov    r9,rdi
   140002bfe:	4d 8b c6             	mov    r8,r14
   140002c01:	48 8b d6             	mov    rdx,rsi
   140002c04:	48 8b cd             	mov    rcx,rbp
   140002c07:	e8 74 fe ff ff       	call   0x140002a80
   140002c0c:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002c11:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
   140002c16:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140002c1b:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
   140002c20:	48 83 c4 20          	add    rsp,0x20
   140002c24:	41 5e                	pop    r14
   140002c26:	c3                   	ret
   140002c27:	ff 25 5b 05 00 00    	jmp    QWORD PTR [rip+0x55b]        # 0x140003188
   140002c2d:	cc                   	int3
   140002c2e:	cc                   	int3
   140002c2f:	cc                   	int3
   140002c30:	cc                   	int3
   140002c31:	cc                   	int3
   140002c32:	cc                   	int3
   140002c33:	cc                   	int3
   140002c34:	cc                   	int3
   140002c35:	cc                   	int3
   140002c36:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140002c3d:	00 00 00 
   140002c40:	ff e0                	jmp    rax
   140002c42:	cc                   	int3
   140002c43:	cc                   	int3
   140002c44:	cc                   	int3
   140002c45:	cc                   	int3
   140002c46:	cc                   	int3
   140002c47:	cc                   	int3
   140002c48:	cc                   	int3
   140002c49:	cc                   	int3
   140002c4a:	cc                   	int3
   140002c4b:	cc                   	int3
   140002c4c:	cc                   	int3
   140002c4d:	cc                   	int3
   140002c4e:	cc                   	int3
   140002c4f:	cc                   	int3
   140002c50:	cc                   	int3
   140002c51:	cc                   	int3
   140002c52:	cc                   	int3
   140002c53:	cc                   	int3
   140002c54:	cc                   	int3
   140002c55:	cc                   	int3
   140002c56:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140002c5d:	00 00 00 
   140002c60:	ff 25 62 06 00 00    	jmp    QWORD PTR [rip+0x662]        # 0x1400032c8
   140002c66:	cc                   	int3
   140002c67:	cc                   	int3
   140002c68:	cc                   	int3
   140002c69:	cc                   	int3
   140002c6a:	cc                   	int3
   140002c6b:	cc                   	int3
   140002c6c:	cc                   	int3
   140002c6d:	cc                   	int3
   140002c6e:	cc                   	int3
   140002c6f:	cc                   	int3
   140002c70:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140002c77:	e9 74 ed ff ff       	jmp    0x1400019f0
   140002c7c:	cc                   	int3
   140002c7d:	cc                   	int3
   140002c7e:	cc                   	int3
   140002c7f:	cc                   	int3
   140002c80:	48 8d 8a 28 00 00 00 	lea    rcx,[rdx+0x28]
   140002c87:	48 ff 25 5a 04 00 00 	rex.W jmp QWORD PTR [rip+0x45a]        # 0x1400030e8
   140002c8e:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140002c95:	e9 76 ee ff ff       	jmp    0x140001b10
   140002c9a:	cc                   	int3
   140002c9b:	cc                   	int3
   140002c9c:	cc                   	int3
   140002c9d:	cc                   	int3
   140002c9e:	cc                   	int3
   140002c9f:	cc                   	int3
   140002ca0:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   140002ca7:	e9 f4 ed ff ff       	jmp    0x140001aa0
   140002cac:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   140002cb3:	e9 18 ee ff ff       	jmp    0x140001ad0
   140002cb8:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   140002cbd:	55                   	push   rbp
   140002cbe:	48 83 ec 20          	sub    rsp,0x20
   140002cc2:	48 8b ea             	mov    rbp,rdx
   140002cc5:	48 8b 55 60          	mov    rdx,QWORD PTR [rbp+0x60]
   140002cc9:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140002ccc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140002cd0:	48 03 ca             	add    rcx,rdx
   140002cd3:	41 b0 01             	mov    r8b,0x1
   140002cd6:	ba 04 00 00 00       	mov    edx,0x4
   140002cdb:	ff 15 ff 03 00 00    	call   QWORD PTR [rip+0x3ff]        # 0x1400030e0
   140002ce1:	90                   	nop
   140002ce2:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140002ce9:	00 00 00 
   140002cec:	48 83 c4 20          	add    rsp,0x20
   140002cf0:	5d                   	pop    rbp
   140002cf1:	c3                   	ret
   140002cf2:	cc                   	int3
   140002cf3:	cc                   	int3
   140002cf4:	cc                   	int3
   140002cf5:	cc                   	int3
   140002cf6:	cc                   	int3
   140002cf7:	cc                   	int3
   140002cf8:	cc                   	int3
   140002cf9:	cc                   	int3
   140002cfa:	cc                   	int3
   140002cfb:	cc                   	int3
   140002cfc:	cc                   	int3
   140002cfd:	cc                   	int3
   140002cfe:	cc                   	int3
   140002cff:	cc                   	int3
   140002d00:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140002d07:	e9 94 ed ff ff       	jmp    0x140001aa0
   140002d0c:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140002d13:	e9 58 ed ff ff       	jmp    0x140001a70
   140002d18:	48 8d 8a 40 00 00 00 	lea    rcx,[rdx+0x40]
   140002d1f:	e9 3c e5 ff ff       	jmp    0x140001260
   140002d24:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   140002d29:	55                   	push   rbp
   140002d2a:	48 83 ec 20          	sub    rsp,0x20
   140002d2e:	48 8b ea             	mov    rbp,rdx
   140002d31:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140002d35:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140002d38:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140002d3c:	48 03 ca             	add    rcx,rdx
   140002d3f:	41 b0 01             	mov    r8b,0x1
   140002d42:	ba 04 00 00 00       	mov    edx,0x4
   140002d47:	ff 15 93 03 00 00    	call   QWORD PTR [rip+0x393]        # 0x1400030e0
   140002d4d:	90                   	nop
   140002d4e:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140002d55:	00 00 00 
   140002d58:	48 83 c4 20          	add    rsp,0x20
   140002d5c:	5d                   	pop    rbp
   140002d5d:	c3                   	ret
   140002d5e:	cc                   	int3
   140002d5f:	40 55                	rex push rbp
   140002d61:	48 83 ec 20          	sub    rsp,0x20
   140002d65:	48 8b ea             	mov    rbp,rdx
   140002d68:	48 8b d1             	mov    rdx,rcx
   140002d6b:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140002d6e:	8b 09                	mov    ecx,DWORD PTR [rcx]
   140002d70:	e8 47 fd ff ff       	call   0x140002abc
   140002d75:	90                   	nop
   140002d76:	48 83 c4 20          	add    rsp,0x20
   140002d7a:	5d                   	pop    rbp
   140002d7b:	c3                   	ret
   140002d7c:	cc                   	int3
   140002d7d:	40 55                	rex push rbp
   140002d7f:	48 8b ea             	mov    rbp,rdx
   140002d82:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140002d85:	33 c9                	xor    ecx,ecx
   140002d87:	81 38 05 00 00 c0    	cmp    DWORD PTR [rax],0xc0000005
   140002d8d:	0f 94 c1             	sete   cl
   140002d90:	8b c1                	mov    eax,ecx
   140002d92:	5d                   	pop    rbp
   140002d93:	c3                   	ret
   140002d94:	cc                   	int3
   140002d95:	cc                   	int3
   140002d96:	cc                   	int3
   140002d97:	cc                   	int3
   140002d98:	40 53                	rex push rbx
   140002d9a:	48 83 ec 20          	sub    rsp,0x20
   140002d9e:	eb 3d                	jmp    0x140002ddd
   140002da0:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002da3:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140002da7:	48 89 05 d2 23 00 00 	mov    QWORD PTR [rip+0x23d2],rax        # 0x140005180
   140002dae:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140002db1:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   140002db5:	ff 15 0d 05 00 00    	call   QWORD PTR [rip+0x50d]        # 0x1400032c8
   140002dbb:	48 8b c8             	mov    rcx,rax
   140002dbe:	48 85 c0             	test   rax,rax
   140002dc1:	74 11                	je     0x140002dd4
   140002dc3:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140002dc6:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140002dc9:	ba 01 00 00 00       	mov    edx,0x1
   140002dce:	ff 15 f4 04 00 00    	call   QWORD PTR [rip+0x4f4]        # 0x1400032c8
   140002dd4:	48 8b cb             	mov    rcx,rbx
   140002dd7:	ff 15 d3 03 00 00    	call   QWORD PTR [rip+0x3d3]        # 0x1400031b0
   140002ddd:	48 8b 1d 9c 23 00 00 	mov    rbx,QWORD PTR [rip+0x239c]        # 0x140005180
   140002de4:	48 85 db             	test   rbx,rbx
   140002de7:	75 b7                	jne    0x140002da0
   140002de9:	48 83 c4 20          	add    rsp,0x20
   140002ded:	5b                   	pop    rbx
   140002dee:	c3                   	ret
