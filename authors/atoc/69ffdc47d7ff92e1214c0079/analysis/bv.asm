
extracted/bvessel.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	55                   	push   rbp
   140001001:	48 89 e5             	mov    rbp,rsp
   140001004:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001008:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   14000100c:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001010:	44 89 4d 28          	mov    DWORD PTR [rbp+0x28],r9d
   140001014:	90                   	nop
   140001015:	5d                   	pop    rbp
   140001016:	c3                   	ret
   140001017:	55                   	push   rbp
   140001018:	48 89 e5             	mov    rbp,rsp
   14000101b:	48 83 ec 30          	sub    rsp,0x30
   14000101f:	c7 45 fc ff 00 00 00 	mov    DWORD PTR [rbp-0x4],0xff
   140001026:	48 8b 05 b3 a7 00 00 	mov    rax,QWORD PTR [rip+0xa7b3]        # 0x14000b7e0
   14000102d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001033:	e8 3d 00 00 00       	call   0x140001075
   140001038:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000103b:	90                   	nop
   14000103c:	90                   	nop
   14000103d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001040:	48 83 c4 30          	add    rsp,0x30
   140001044:	5d                   	pop    rbp
   140001045:	c3                   	ret
   140001046:	55                   	push   rbp
   140001047:	48 89 e5             	mov    rbp,rsp
   14000104a:	48 83 ec 30          	sub    rsp,0x30
   14000104e:	c7 45 fc ff 00 00 00 	mov    DWORD PTR [rbp-0x4],0xff
   140001055:	48 8b 05 84 a7 00 00 	mov    rax,QWORD PTR [rip+0xa784]        # 0x14000b7e0
   14000105c:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001062:	e8 0e 00 00 00       	call   0x140001075
   140001067:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000106a:	90                   	nop
   14000106b:	90                   	nop
   14000106c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000106f:	48 83 c4 30          	add    rsp,0x30
   140001073:	5d                   	pop    rbp
   140001074:	c3                   	ret
   140001075:	55                   	push   rbp
   140001076:	48 89 e5             	mov    rbp,rsp
   140001079:	48 81 ec 90 00 00 00 	sub    rsp,0x90
   140001080:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
   140001087:	00 
   140001088:	c7 45 e0 30 00 00 00 	mov    DWORD PTR [rbp-0x20],0x30
   14000108f:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
   140001092:	65 67 48 8b 00       	mov    rax,QWORD PTR gs:[eax]
   140001097:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   14000109b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14000109f:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   1400010a3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400010a7:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   1400010ae:	c7 45 e4 00 00 00 00 	mov    DWORD PTR [rbp-0x1c],0x0
   1400010b5:	eb 21                	jmp    0x1400010d8
   1400010b7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400010bb:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   1400010bf:	75 09                	jne    0x1400010ca
   1400010c1:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
   1400010c8:	eb 45                	jmp    0x14000110f
   1400010ca:	b9 e8 03 00 00       	mov    ecx,0x3e8
   1400010cf:	48 8b 05 b2 01 01 00 	mov    rax,QWORD PTR [rip+0x101b2]        # 0x140011288
   1400010d6:	ff d0                	call   rax
   1400010d8:	48 8b 05 51 a7 00 00 	mov    rax,QWORD PTR [rip+0xa751]        # 0x14000b830
   1400010df:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400010e3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400010e7:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   1400010eb:	48 c7 45 c0 00 00 00 	mov    QWORD PTR [rbp-0x40],0x0
   1400010f2:	00 
   1400010f3:	48 8b 4d c8          	mov    rcx,QWORD PTR [rbp-0x38]
   1400010f7:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   1400010fb:	48 8b 55 d0          	mov    rdx,QWORD PTR [rbp-0x30]
   1400010ff:	f0 48 0f b1 0a       	lock cmpxchg QWORD PTR [rdx],rcx
   140001104:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140001108:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   14000110d:	75 a8                	jne    0x1400010b7
   14000110f:	48 8b 05 2a a7 00 00 	mov    rax,QWORD PTR [rip+0xa72a]        # 0x14000b840
   140001116:	8b 00                	mov    eax,DWORD PTR [rax]
   140001118:	83 f8 01             	cmp    eax,0x1
   14000111b:	75 0a                	jne    0x140001127
   14000111d:	b9 1f 00 00 00       	mov    ecx,0x1f
   140001122:	e8 61 85 00 00       	call   0x140009688
   140001127:	48 8b 05 12 a7 00 00 	mov    rax,QWORD PTR [rip+0xa712]        # 0x14000b840
   14000112e:	8b 00                	mov    eax,DWORD PTR [rax]
   140001130:	85 c0                	test   eax,eax
   140001132:	0f 85 a8 01 00 00    	jne    0x1400012e0
   140001138:	48 8b 05 01 a7 00 00 	mov    rax,QWORD PTR [rip+0xa701]        # 0x14000b840
   14000113f:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001145:	e8 66 12 00 00       	call   0x1400023b0
   14000114a:	48 8b 05 7f a7 00 00 	mov    rax,QWORD PTR [rip+0xa77f]        # 0x14000b8d0
   140001151:	48 89 c1             	mov    rcx,rax
   140001154:	48 8b 05 25 01 01 00 	mov    rax,QWORD PTR [rip+0x10125]        # 0x140011280
   14000115b:	ff d0                	call   rax
   14000115d:	48 8b 15 bc a6 00 00 	mov    rdx,QWORD PTR [rip+0xa6bc]        # 0x14000b820
   140001164:	48 89 02             	mov    QWORD PTR [rdx],rax
   140001167:	48 8d 05 92 fe ff ff 	lea    rax,[rip+0xfffffffffffffe92]        # 0x140001000
   14000116e:	48 89 c1             	mov    rcx,rax
   140001171:	e8 4a 84 00 00       	call   0x1400095c0
   140001176:	e8 05 19 00 00       	call   0x140002a80
   14000117b:	e8 18 02 00 00       	call   0x140001398
   140001180:	89 05 92 ee 00 00    	mov    DWORD PTR [rip+0xee92],eax        # 0x140010018
   140001186:	48 8b 05 53 a6 00 00 	mov    rax,QWORD PTR [rip+0xa653]        # 0x14000b7e0
   14000118d:	8b 00                	mov    eax,DWORD PTR [rax]
   14000118f:	85 c0                	test   eax,eax
   140001191:	74 0c                	je     0x14000119f
   140001193:	b9 02 00 00 00       	mov    ecx,0x2
   140001198:	e8 db 84 00 00       	call   0x140009678
   14000119d:	eb 0a                	jmp    0x1400011a9
   14000119f:	b9 01 00 00 00       	mov    ecx,0x1
   1400011a4:	e8 cf 84 00 00       	call   0x140009678
   1400011a9:	e8 c2 82 00 00       	call   0x140009470
   1400011ae:	48 8b 15 0b a7 00 00 	mov    rdx,QWORD PTR [rip+0xa70b]        # 0x14000b8c0
   1400011b5:	8b 12                	mov    edx,DWORD PTR [rdx]
   1400011b7:	89 10                	mov    DWORD PTR [rax],edx
   1400011b9:	e8 c2 82 00 00       	call   0x140009480
   1400011be:	48 8b 15 db a6 00 00 	mov    rdx,QWORD PTR [rip+0xa6db]        # 0x14000b8a0
   1400011c5:	8b 12                	mov    edx,DWORD PTR [rdx]
   1400011c7:	89 10                	mov    DWORD PTR [rax],edx
   1400011c9:	e8 c2 07 00 00       	call   0x140001990
   1400011ce:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   1400011d1:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   1400011d5:	79 0a                	jns    0x1400011e1
   1400011d7:	b9 08 00 00 00       	mov    ecx,0x8
   1400011dc:	e8 a7 84 00 00       	call   0x140009688
   1400011e1:	48 8b 05 48 a5 00 00 	mov    rax,QWORD PTR [rip+0xa548]        # 0x14000b730
   1400011e8:	8b 00                	mov    eax,DWORD PTR [rax]
   1400011ea:	83 f8 01             	cmp    eax,0x1
   1400011ed:	75 0f                	jne    0x1400011fe
   1400011ef:	48 8b 05 ea a6 00 00 	mov    rax,QWORD PTR [rip+0xa6ea]        # 0x14000b8e0
   1400011f6:	48 89 c1             	mov    rcx,rax
   1400011f9:	e8 cc 12 00 00       	call   0x1400024ca
   1400011fe:	48 8b 05 9b a5 00 00 	mov    rax,QWORD PTR [rip+0xa59b]        # 0x14000b7a0
   140001205:	8b 00                	mov    eax,DWORD PTR [rax]
   140001207:	83 f8 ff             	cmp    eax,0xffffffff
   14000120a:	75 0a                	jne    0x140001216
   14000120c:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   140001211:	e8 ea 83 00 00       	call   0x140009600
   140001216:	48 8b 15 73 a6 00 00 	mov    rdx,QWORD PTR [rip+0xa673]        # 0x14000b890
   14000121d:	48 8b 05 5c a6 00 00 	mov    rax,QWORD PTR [rip+0xa65c]        # 0x14000b880
   140001224:	48 89 c1             	mov    rcx,rax
   140001227:	e8 e4 81 00 00       	call   0x140009410
   14000122c:	85 c0                	test   eax,eax
   14000122e:	74 0a                	je     0x14000123a
   140001230:	b8 ff 00 00 00       	mov    eax,0xff
   140001235:	e9 55 01 00 00       	jmp    0x14000138f
   14000123a:	48 8b 05 af a6 00 00 	mov    rax,QWORD PTR [rip+0xa6af]        # 0x14000b8f0
   140001241:	8b 00                	mov    eax,DWORD PTR [rax]
   140001243:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
   140001246:	48 8b 05 63 a6 00 00 	mov    rax,QWORD PTR [rip+0xa663]        # 0x14000b8b0
   14000124d:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   140001250:	4c 8d 15 b9 ed 00 00 	lea    r10,[rip+0xedb9]        # 0x140010010
   140001257:	48 8d 15 aa ed 00 00 	lea    rdx,[rip+0xedaa]        # 0x140010008
   14000125e:	48 8d 05 9f ed 00 00 	lea    rax,[rip+0xed9f]        # 0x140010004
   140001265:	48 8d 4d ac          	lea    rcx,[rbp-0x54]
   140001269:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   14000126e:	45 89 c1             	mov    r9d,r8d
   140001271:	4d 89 d0             	mov    r8,r10
   140001274:	48 89 c1             	mov    rcx,rax
   140001277:	e8 ec 83 00 00       	call   0x140009668
   14000127c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   14000127f:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   140001283:	79 0a                	jns    0x14000128f
   140001285:	b9 08 00 00 00       	mov    ecx,0x8
   14000128a:	e8 f9 83 00 00       	call   0x140009688
   14000128f:	8b 05 6f ed 00 00    	mov    eax,DWORD PTR [rip+0xed6f]        # 0x140010004
   140001295:	48 8d 15 6c ed 00 00 	lea    rdx,[rip+0xed6c]        # 0x140010008
   14000129c:	89 c1                	mov    ecx,eax
   14000129e:	e8 f9 01 00 00       	call   0x14000149c
   1400012a3:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   1400012a6:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   1400012aa:	74 0a                	je     0x1400012b6
   1400012ac:	b9 08 00 00 00       	mov    ecx,0x8
   1400012b1:	e8 d2 83 00 00       	call   0x140009688
   1400012b6:	48 8b 15 b3 a5 00 00 	mov    rdx,QWORD PTR [rip+0xa5b3]        # 0x14000b870
   1400012bd:	48 8b 05 9c a5 00 00 	mov    rax,QWORD PTR [rip+0xa59c]        # 0x14000b860
   1400012c4:	48 89 c1             	mov    rcx,rax
   1400012c7:	e8 d4 83 00 00       	call   0x1400096a0
   1400012cc:	e8 96 06 00 00       	call   0x140001967
   1400012d1:	48 8b 05 68 a5 00 00 	mov    rax,QWORD PTR [rip+0xa568]        # 0x14000b840
   1400012d8:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   1400012de:	eb 0a                	jmp    0x1400012ea
   1400012e0:	c7 05 32 ed 00 00 01 	mov    DWORD PTR [rip+0xed32],0x1        # 0x14001001c
   1400012e7:	00 00 00 
   1400012ea:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400012ee:	75 1e                	jne    0x14000130e
   1400012f0:	48 8b 05 39 a5 00 00 	mov    rax,QWORD PTR [rip+0xa539]        # 0x14000b830
   1400012f7:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400012fb:	48 c7 45 b0 00 00 00 	mov    QWORD PTR [rbp-0x50],0x0
   140001302:	00 
   140001303:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
   140001307:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000130b:	48 87 10             	xchg   QWORD PTR [rax],rdx
   14000130e:	48 8b 05 7b a4 00 00 	mov    rax,QWORD PTR [rip+0xa47b]        # 0x14000b790
   140001315:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001318:	48 85 c0             	test   rax,rax
   14000131b:	74 1c                	je     0x140001339
   14000131d:	48 8b 05 6c a4 00 00 	mov    rax,QWORD PTR [rip+0xa46c]        # 0x14000b790
   140001324:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001327:	41 b8 00 00 00 00    	mov    r8d,0x0
   14000132d:	ba 02 00 00 00       	mov    edx,0x2
   140001332:	b9 00 00 00 00       	mov    ecx,0x0
   140001337:	ff d0                	call   rax
   140001339:	e8 52 81 00 00       	call   0x140009490
   14000133e:	48 8b 15 cb ec 00 00 	mov    rdx,QWORD PTR [rip+0xeccb]        # 0x140010010
   140001345:	48 89 10             	mov    QWORD PTR [rax],rdx
   140001348:	48 8b 0d c1 ec 00 00 	mov    rcx,QWORD PTR [rip+0xecc1]        # 0x140010010
   14000134f:	48 8b 15 b2 ec 00 00 	mov    rdx,QWORD PTR [rip+0xecb2]        # 0x140010008
   140001356:	8b 05 a8 ec 00 00    	mov    eax,DWORD PTR [rip+0xeca8]        # 0x140010004
   14000135c:	49 89 c8             	mov    r8,rcx
   14000135f:	89 c1                	mov    ecx,eax
   140001361:	e8 ba 84 00 00       	call   0x140009820
   140001366:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140001369:	8b 05 a9 ec 00 00    	mov    eax,DWORD PTR [rip+0xeca9]        # 0x140010018
   14000136f:	85 c0                	test   eax,eax
   140001371:	75 0a                	jne    0x14000137d
   140001373:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001376:	89 c1                	mov    ecx,eax
   140001378:	e8 5b 83 00 00       	call   0x1400096d8
   14000137d:	8b 05 99 ec 00 00    	mov    eax,DWORD PTR [rip+0xec99]        # 0x14001001c
   140001383:	85 c0                	test   eax,eax
   140001385:	75 05                	jne    0x14000138c
   140001387:	e8 04 83 00 00       	call   0x140009690
   14000138c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   14000138f:	48 81 c4 90 00 00 00 	add    rsp,0x90
   140001396:	5d                   	pop    rbp
   140001397:	c3                   	ret
   140001398:	55                   	push   rbp
   140001399:	48 89 e5             	mov    rbp,rsp
   14000139c:	48 83 ec 20          	sub    rsp,0x20
   1400013a0:	48 8b 05 49 a4 00 00 	mov    rax,QWORD PTR [rip+0xa449]        # 0x14000b7f0
   1400013a7:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400013ad:	48 8b 05 4c a4 00 00 	mov    rax,QWORD PTR [rip+0xa44c]        # 0x14000b800
   1400013b4:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400013ba:	48 8b 05 4f a4 00 00 	mov    rax,QWORD PTR [rip+0xa44f]        # 0x14000b810
   1400013c1:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400013c7:	48 8b 05 82 a3 00 00 	mov    rax,QWORD PTR [rip+0xa382]        # 0x14000b750
   1400013ce:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400013d2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400013d6:	0f b7 00             	movzx  eax,WORD PTR [rax]
   1400013d9:	66 3d 4d 5a          	cmp    ax,0x5a4d
   1400013dd:	74 0a                	je     0x1400013e9
   1400013df:	b8 00 00 00 00       	mov    eax,0x0
   1400013e4:	e9 ad 00 00 00       	jmp    0x140001496
   1400013e9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400013ed:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   1400013f0:	48 63 d0             	movsxd rdx,eax
   1400013f3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400013f7:	48 01 d0             	add    rax,rdx
   1400013fa:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400013fe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001402:	8b 00                	mov    eax,DWORD PTR [rax]
   140001404:	3d 50 45 00 00       	cmp    eax,0x4550
   140001409:	74 0a                	je     0x140001415
   14000140b:	b8 00 00 00 00       	mov    eax,0x0
   140001410:	e9 81 00 00 00       	jmp    0x140001496
   140001415:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001419:	48 83 c0 18          	add    rax,0x18
   14000141d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140001421:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001425:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140001428:	0f b7 c0             	movzx  eax,ax
   14000142b:	3d 0b 01 00 00       	cmp    eax,0x10b
   140001430:	74 09                	je     0x14000143b
   140001432:	3d 0b 02 00 00       	cmp    eax,0x20b
   140001437:	74 29                	je     0x140001462
   140001439:	eb 56                	jmp    0x140001491
   14000143b:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   14000143f:	8b 40 5c             	mov    eax,DWORD PTR [rax+0x5c]
   140001442:	83 f8 0e             	cmp    eax,0xe
   140001445:	77 07                	ja     0x14000144e
   140001447:	b8 00 00 00 00       	mov    eax,0x0
   14000144c:	eb 48                	jmp    0x140001496
   14000144e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001452:	8b 80 d0 00 00 00    	mov    eax,DWORD PTR [rax+0xd0]
   140001458:	85 c0                	test   eax,eax
   14000145a:	0f 95 c0             	setne  al
   14000145d:	0f b6 c0             	movzx  eax,al
   140001460:	eb 34                	jmp    0x140001496
   140001462:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140001466:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   14000146a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000146e:	8b 40 6c             	mov    eax,DWORD PTR [rax+0x6c]
   140001471:	83 f8 0e             	cmp    eax,0xe
   140001474:	77 07                	ja     0x14000147d
   140001476:	b8 00 00 00 00       	mov    eax,0x0
   14000147b:	eb 19                	jmp    0x140001496
   14000147d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140001481:	8b 80 e0 00 00 00    	mov    eax,DWORD PTR [rax+0xe0]
   140001487:	85 c0                	test   eax,eax
   140001489:	0f 95 c0             	setne  al
   14000148c:	0f b6 c0             	movzx  eax,al
   14000148f:	eb 05                	jmp    0x140001496
   140001491:	b8 00 00 00 00       	mov    eax,0x0
   140001496:	48 83 c4 20          	add    rsp,0x20
   14000149a:	5d                   	pop    rbp
   14000149b:	c3                   	ret
   14000149c:	55                   	push   rbp
   14000149d:	53                   	push   rbx
   14000149e:	48 83 ec 48          	sub    rsp,0x48
   1400014a2:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   1400014a7:	89 4d 20             	mov    DWORD PTR [rbp+0x20],ecx
   1400014aa:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   1400014ae:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   1400014b1:	83 c0 01             	add    eax,0x1
   1400014b4:	48 98                	cdqe
   1400014b6:	48 c1 e0 03          	shl    rax,0x3
   1400014ba:	48 89 c1             	mov    rcx,rax
   1400014bd:	e8 5e 82 00 00       	call   0x140009720
   1400014c2:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400014c6:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400014cb:	75 0a                	jne    0x1400014d7
   1400014cd:	b8 01 00 00 00       	mov    eax,0x1
   1400014d2:	e9 fd 00 00 00       	jmp    0x1400015d4
   1400014d7:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400014db:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400014de:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400014e2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   1400014e9:	e9 af 00 00 00       	jmp    0x14000159d
   1400014ee:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400014f1:	48 98                	cdqe
   1400014f3:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   1400014fa:	00 
   1400014fb:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400014ff:	48 01 d0             	add    rax,rdx
   140001502:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001505:	48 89 c1             	mov    rcx,rax
   140001508:	e8 5b 82 00 00       	call   0x140009768
   14000150d:	48 83 c0 01          	add    rax,0x1
   140001511:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140001515:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001518:	48 98                	cdqe
   14000151a:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140001521:	00 
   140001522:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001526:	48 8d 1c 02          	lea    rbx,[rdx+rax*1]
   14000152a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000152e:	48 89 c1             	mov    rcx,rax
   140001531:	e8 ea 81 00 00       	call   0x140009720
   140001536:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001539:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000153c:	48 98                	cdqe
   14000153e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140001545:	00 
   140001546:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000154a:	48 01 d0             	add    rax,rdx
   14000154d:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001550:	48 85 c0             	test   rax,rax
   140001553:	75 07                	jne    0x14000155c
   140001555:	b8 01 00 00 00       	mov    eax,0x1
   14000155a:	eb 78                	jmp    0x1400015d4
   14000155c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000155f:	48 98                	cdqe
   140001561:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140001568:	00 
   140001569:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   14000156d:	48 01 d0             	add    rax,rdx
   140001570:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140001573:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001576:	48 98                	cdqe
   140001578:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   14000157f:	00 
   140001580:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001584:	48 01 c8             	add    rax,rcx
   140001587:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000158a:	48 8b 4d e0          	mov    rcx,QWORD PTR [rbp-0x20]
   14000158e:	49 89 c8             	mov    r8,rcx
   140001591:	48 89 c1             	mov    rcx,rax
   140001594:	e8 97 81 00 00       	call   0x140009730
   140001599:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   14000159d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400015a0:	3b 45 20             	cmp    eax,DWORD PTR [rbp+0x20]
   1400015a3:	0f 8c 45 ff ff ff    	jl     0x1400014ee
   1400015a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400015ac:	48 98                	cdqe
   1400015ae:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   1400015b5:	00 
   1400015b6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400015ba:	48 01 d0             	add    rax,rdx
   1400015bd:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   1400015c4:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400015c8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   1400015cc:	48 89 10             	mov    QWORD PTR [rax],rdx
   1400015cf:	b8 00 00 00 00       	mov    eax,0x0
   1400015d4:	48 83 c4 48          	add    rsp,0x48
   1400015d8:	5b                   	pop    rbx
   1400015d9:	5d                   	pop    rbp
   1400015da:	c3                   	ret
   1400015db:	55                   	push   rbp
   1400015dc:	48 89 e5             	mov    rbp,rsp
   1400015df:	48 83 ec 20          	sub    rsp,0x20
   1400015e3:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400015e7:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400015eb:	48 89 c1             	mov    rcx,rax
   1400015ee:	e8 cd 80 00 00       	call   0x1400096c0
   1400015f3:	48 83 c4 20          	add    rsp,0x20
   1400015f7:	5d                   	pop    rbp
   1400015f8:	c3                   	ret
   1400015f9:	90                   	nop
   1400015fa:	90                   	nop
   1400015fb:	90                   	nop
   1400015fc:	90                   	nop
   1400015fd:	90                   	nop
   1400015fe:	90                   	nop
   1400015ff:	90                   	nop
   140001600:	c3                   	ret
   140001601:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001605:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000160c:	00 00 00 00 
   140001610:	31 c0                	xor    eax,eax
   140001612:	c3                   	ret
   140001613:	66 90                	xchg   ax,ax
   140001615:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   14000161c:	00 00 00 00 
   140001620:	55                   	push   rbp
   140001621:	53                   	push   rbx
   140001622:	48 83 ec 38          	sub    rsp,0x38
   140001626:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   14000162b:	48 8d 0d ce 99 00 00 	lea    rcx,[rip+0x99ce]        # 0x14000b000
   140001632:	ff 15 10 fc 00 00    	call   QWORD PTR [rip+0xfc10]        # 0x140011248
   140001638:	48 89 c3             	mov    rbx,rax
   14000163b:	48 85 c0             	test   rax,rax
   14000163e:	74 70                	je     0x1400016b0
   140001640:	48 8d 0d b9 99 00 00 	lea    rcx,[rip+0x99b9]        # 0x14000b000
   140001647:	ff 15 23 fc 00 00    	call   QWORD PTR [rip+0xfc23]        # 0x140011270
   14000164d:	4c 8b 0d fc fb 00 00 	mov    r9,QWORD PTR [rip+0xfbfc]        # 0x140011250
   140001654:	48 8d 15 b8 99 00 00 	lea    rdx,[rip+0x99b8]        # 0x14000b013
   14000165b:	48 89 d9             	mov    rcx,rbx
   14000165e:	48 89 05 bb e9 00 00 	mov    QWORD PTR [rip+0xe9bb],rax        # 0x140010020
   140001665:	4c 89 4d f0          	mov    QWORD PTR [rbp-0x10],r9
   140001669:	41 ff d1             	call   r9
   14000166c:	48 8d 15 b6 99 00 00 	lea    rdx,[rip+0x99b6]        # 0x14000b029
   140001673:	48 89 d9             	mov    rcx,rbx
   140001676:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000167a:	ff 55 f0             	call   QWORD PTR [rbp-0x10]
   14000167d:	4c 8b 45 f8          	mov    r8,QWORD PTR [rbp-0x8]
   140001681:	48 89 05 78 89 00 00 	mov    QWORD PTR [rip+0x8978],rax        # 0x14000a000
   140001688:	4d 85 c0             	test   r8,r8
   14000168b:	74 11                	je     0x14000169e
   14000168d:	48 8d 15 ac e9 00 00 	lea    rdx,[rip+0xe9ac]        # 0x140010040
   140001694:	48 8d 0d 65 b9 00 00 	lea    rcx,[rip+0xb965]        # 0x14000d000
   14000169b:	41 ff d0             	call   r8
   14000169e:	48 8d 0d 2b 00 00 00 	lea    rcx,[rip+0x2b]        # 0x1400016d0
   1400016a5:	48 83 c4 38          	add    rsp,0x38
   1400016a9:	5b                   	pop    rbx
   1400016aa:	5d                   	pop    rbp
   1400016ab:	e9 2b ff ff ff       	jmp    0x1400015db
   1400016b0:	48 8d 05 59 ff ff ff 	lea    rax,[rip+0xffffffffffffff59]        # 0x140001610
   1400016b7:	4c 8d 05 42 ff ff ff 	lea    r8,[rip+0xffffffffffffff42]        # 0x140001600
   1400016be:	48 89 05 3b 89 00 00 	mov    QWORD PTR [rip+0x893b],rax        # 0x14000a000
   1400016c5:	eb c6                	jmp    0x14000168d
   1400016c7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400016ce:	00 00 
   1400016d0:	55                   	push   rbp
   1400016d1:	48 89 e5             	mov    rbp,rsp
   1400016d4:	48 83 ec 20          	sub    rsp,0x20
   1400016d8:	48 8b 05 21 89 00 00 	mov    rax,QWORD PTR [rip+0x8921]        # 0x14000a000
   1400016df:	48 85 c0             	test   rax,rax
   1400016e2:	74 09                	je     0x1400016ed
   1400016e4:	48 8d 0d 15 b9 00 00 	lea    rcx,[rip+0xb915]        # 0x14000d000
   1400016eb:	ff d0                	call   rax
   1400016ed:	48 8b 0d 2c e9 00 00 	mov    rcx,QWORD PTR [rip+0xe92c]        # 0x140010020
   1400016f4:	48 85 c9             	test   rcx,rcx
   1400016f7:	74 0f                	je     0x140001708
   1400016f9:	48 83 c4 20          	add    rsp,0x20
   1400016fd:	5d                   	pop    rbp
   1400016fe:	48 ff 25 33 fb 00 00 	rex.W jmp QWORD PTR [rip+0xfb33]        # 0x140011238
   140001705:	0f 1f 00             	nop    DWORD PTR [rax]
   140001708:	48 83 c4 20          	add    rsp,0x20
   14000170c:	5d                   	pop    rbp
   14000170d:	c3                   	ret
   14000170e:	90                   	nop
   14000170f:	90                   	nop
   140001710:	48 83 ec 28          	sub    rsp,0x28
   140001714:	49 89 c8             	mov    r8,rcx
   140001717:	66 85 d2             	test   dx,dx
   14000171a:	79 08                	jns    0x140001724
   14000171c:	89 d0                	mov    eax,edx
   14000171e:	66 25 ff 7f          	and    ax,0x7fff
   140001722:	eb 22                	jmp    0x140001746
   140001724:	0f b7 ca             	movzx  ecx,dx
   140001727:	31 c0                	xor    eax,eax
   140001729:	41 3b 88 f8 f7 07 00 	cmp    ecx,DWORD PTR [r8+0x7f7f8]
   140001730:	7d 14                	jge    0x140001746
   140001732:	0f b7 d2             	movzx  edx,dx
   140001735:	48 69 d2 10 10 00 00 	imul   rdx,rdx,0x1010
   14000173c:	49 8d 4c 10 08       	lea    rcx,[r8+rdx*1+0x8]
   140001741:	e8 82 7f 00 00       	call   0x1400096c8
   140001746:	48 83 c4 28          	add    rsp,0x28
   14000174a:	c3                   	ret
   14000174b:	41 55                	push   r13
   14000174d:	41 54                	push   r12
   14000174f:	55                   	push   rbp
   140001750:	57                   	push   rdi
   140001751:	56                   	push   rsi
   140001752:	53                   	push   rbx
   140001753:	48 83 ec 28          	sub    rsp,0x28
   140001757:	0f b7 5a 08          	movzx  ebx,WORD PTR [rdx+0x8]
   14000175b:	48 89 ce             	mov    rsi,rcx
   14000175e:	48 89 d5             	mov    rbp,rdx
   140001761:	45 89 c5             	mov    r13d,r8d
   140001764:	66 85 db             	test   bx,bx
   140001767:	78 79                	js     0x1400017e2
   140001769:	0f b7 fb             	movzx  edi,bx
   14000176c:	0f b7 d3             	movzx  edx,bx
   14000176f:	48 69 c7 10 10 00 00 	imul   rax,rdi,0x1010
   140001776:	80 bc 01 10 10 00 00 	cmp    BYTE PTR [rcx+rax*1+0x1010],0x0
   14000177d:	00 
   14000177e:	75 62                	jne    0x1400017e2
   140001780:	e8 8b ff ff ff       	call   0x140001710
   140001785:	0f b7 55 06          	movzx  edx,WORD PTR [rbp+0x6]
   140001789:	48 89 f1             	mov    rcx,rsi
   14000178c:	41 89 c4             	mov    r12d,eax
   14000178f:	e8 7c ff ff ff       	call   0x140001710
   140001794:	41 ff cd             	dec    r13d
   140001797:	45 8d 0c 04          	lea    r9d,[r12+rax*1]
   14000179b:	75 13                	jne    0x1400017b0
   14000179d:	45 89 e1             	mov    r9d,r12d
   1400017a0:	41 29 c1             	sub    r9d,eax
   1400017a3:	66 44 39 e0          	cmp    ax,r12w
   1400017a7:	b8 00 00 00 00       	mov    eax,0x0
   1400017ac:	44 0f 43 c8          	cmovae r9d,eax
   1400017b0:	48 69 db 10 10 00 00 	imul   rbx,rbx,0x1010
   1400017b7:	45 0f b7 c9          	movzx  r9d,r9w
   1400017bb:	ba 00 10 00 00       	mov    edx,0x1000
   1400017c0:	48 69 ff 10 10 00 00 	imul   rdi,rdi,0x1010
   1400017c7:	4c 8d 05 92 98 00 00 	lea    r8,[rip+0x9892]        # 0x14000b060
   1400017ce:	48 8d 4c 1e 08       	lea    rcx,[rsi+rbx*1+0x8]
   1400017d3:	e8 98 44 00 00       	call   0x140005c70
   1400017d8:	48 98                	cdqe
   1400017da:	48 89 84 3e 08 10 00 	mov    QWORD PTR [rsi+rdi*1+0x1008],rax
   1400017e1:	00 
   1400017e2:	48 83 c4 28          	add    rsp,0x28
   1400017e6:	5b                   	pop    rbx
   1400017e7:	5e                   	pop    rsi
   1400017e8:	5f                   	pop    rdi
   1400017e9:	5d                   	pop    rbp
   1400017ea:	41 5c                	pop    r12
   1400017ec:	41 5d                	pop    r13
   1400017ee:	c3                   	ret
   1400017ef:	41 54                	push   r12
   1400017f1:	55                   	push   rbp
   1400017f2:	57                   	push   rdi
   1400017f3:	56                   	push   rsi
   1400017f4:	53                   	push   rbx
   1400017f5:	48 83 ec 20          	sub    rsp,0x20
   1400017f9:	48 89 d5             	mov    rbp,rdx
   1400017fc:	0f b7 52 06          	movzx  edx,WORD PTR [rdx+0x6]
   140001800:	44 89 c7             	mov    edi,r8d
   140001803:	48 89 cb             	mov    rbx,rcx
   140001806:	e8 05 ff ff ff       	call   0x140001710
   14000180b:	0f b7 55 08          	movzx  edx,WORD PTR [rbp+0x8]
   14000180f:	48 89 d9             	mov    rcx,rbx
   140001812:	44 0f b7 e0          	movzx  r12d,ax
   140001816:	e8 f5 fe ff ff       	call   0x140001710
   14000181b:	0f b7 55 0a          	movzx  edx,WORD PTR [rbp+0xa]
   14000181f:	48 89 d9             	mov    rcx,rbx
   140001822:	89 c6                	mov    esi,eax
   140001824:	e8 e7 fe ff ff       	call   0x140001710
   140001829:	44 8d 47 ff          	lea    r8d,[rdi-0x1]
   14000182d:	41 83 f8 05          	cmp    r8d,0x5
   140001831:	77 1e                	ja     0x140001851
   140001833:	48 8d 0d 2a 98 00 00 	lea    rcx,[rip+0x982a]        # 0x14000b064
   14000183a:	4a 63 14 81          	movsxd rdx,DWORD PTR [rcx+r8*4]
   14000183e:	48 01 ca             	add    rdx,rcx
   140001841:	ff e2                	jmp    rdx
   140001843:	c7 45 18 01 00 00 00 	mov    DWORD PTR [rbp+0x18],0x1
   14000184a:	eb 31                	jmp    0x14000187d
   14000184c:	66 39 f0             	cmp    ax,si
   14000184f:	eb 03                	jmp    0x140001854
   140001851:	66 39 c6             	cmp    si,ax
   140001854:	0f 92 c0             	setb   al
   140001857:	eb 0b                	jmp    0x140001864
   140001859:	66 39 c6             	cmp    si,ax
   14000185c:	eb 03                	jmp    0x140001861
   14000185e:	66 39 f0             	cmp    ax,si
   140001861:	0f 93 c0             	setae  al
   140001864:	0f b6 c0             	movzx  eax,al
   140001867:	85 c0                	test   eax,eax
   140001869:	75 12                	jne    0x14000187d
   14000186b:	eb 2c                	jmp    0x140001899
   14000186d:	66 39 c6             	cmp    si,ax
   140001870:	0f 94 c0             	sete   al
   140001873:	eb ef                	jmp    0x140001864
   140001875:	66 39 c6             	cmp    si,ax
   140001878:	0f 95 c0             	setne  al
   14000187b:	eb e7                	jmp    0x140001864
   14000187d:	4c 3b a3 08 f8 07 00 	cmp    r12,QWORD PTR [rbx+0x7f808]
   140001884:	73 09                	jae    0x14000188f
   140001886:	4c 89 a3 10 f8 07 00 	mov    QWORD PTR [rbx+0x7f810],r12
   14000188d:	eb 0a                	jmp    0x140001899
   14000188f:	c7 83 18 f8 07 00 01 	mov    DWORD PTR [rbx+0x7f818],0x1
   140001896:	00 00 00 
   140001899:	48 83 c4 20          	add    rsp,0x20
   14000189d:	5b                   	pop    rbx
   14000189e:	5e                   	pop    rsi
   14000189f:	5f                   	pop    rdi
   1400018a0:	5d                   	pop    rbp
   1400018a1:	41 5c                	pop    r12
   1400018a3:	c3                   	ret
   1400018a4:	90                   	nop
   1400018a5:	90                   	nop
   1400018a6:	90                   	nop
   1400018a7:	90                   	nop
   1400018a8:	90                   	nop
   1400018a9:	90                   	nop
   1400018aa:	90                   	nop
   1400018ab:	90                   	nop
   1400018ac:	90                   	nop
   1400018ad:	90                   	nop
   1400018ae:	90                   	nop
   1400018af:	90                   	nop
   1400018b0:	55                   	push   rbp
   1400018b1:	48 89 e5             	mov    rbp,rsp
   1400018b4:	48 83 ec 20          	sub    rsp,0x20
   1400018b8:	eb 1e                	jmp    0x1400018d8
   1400018ba:	48 8b 05 4f 87 00 00 	mov    rax,QWORD PTR [rip+0x874f]        # 0x14000a010
   1400018c1:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400018c4:	ff d0                	call   rax
   1400018c6:	48 8b 05 43 87 00 00 	mov    rax,QWORD PTR [rip+0x8743]        # 0x14000a010
   1400018cd:	48 83 c0 08          	add    rax,0x8
   1400018d1:	48 89 05 38 87 00 00 	mov    QWORD PTR [rip+0x8738],rax        # 0x14000a010
   1400018d8:	48 8b 05 31 87 00 00 	mov    rax,QWORD PTR [rip+0x8731]        # 0x14000a010
   1400018df:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400018e2:	48 85 c0             	test   rax,rax
   1400018e5:	75 d3                	jne    0x1400018ba
   1400018e7:	90                   	nop
   1400018e8:	90                   	nop
   1400018e9:	48 83 c4 20          	add    rsp,0x20
   1400018ed:	5d                   	pop    rbp
   1400018ee:	c3                   	ret
   1400018ef:	55                   	push   rbp
   1400018f0:	48 89 e5             	mov    rbp,rsp
   1400018f3:	48 83 ec 30          	sub    rsp,0x30
   1400018f7:	48 8b 05 42 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e42]        # 0x14000b740
   1400018fe:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001901:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140001904:	83 7d fc ff          	cmp    DWORD PTR [rbp-0x4],0xffffffff
   140001908:	75 25                	jne    0x14000192f
   14000190a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001911:	eb 04                	jmp    0x140001917
   140001913:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001917:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000191a:	8d 50 01             	lea    edx,[rax+0x1]
   14000191d:	48 8b 05 1c 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e1c]        # 0x14000b740
   140001924:	89 d2                	mov    edx,edx
   140001926:	48 8b 04 d0          	mov    rax,QWORD PTR [rax+rdx*8]
   14000192a:	48 85 c0             	test   rax,rax
   14000192d:	75 e4                	jne    0x140001913
   14000192f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001932:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140001935:	eb 14                	jmp    0x14000194b
   140001937:	48 8b 05 02 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e02]        # 0x14000b740
   14000193e:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   140001941:	48 8b 04 d0          	mov    rax,QWORD PTR [rax+rdx*8]
   140001945:	ff d0                	call   rax
   140001947:	83 6d f8 01          	sub    DWORD PTR [rbp-0x8],0x1
   14000194b:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   14000194f:	75 e6                	jne    0x140001937
   140001951:	48 8d 05 58 ff ff ff 	lea    rax,[rip+0xffffffffffffff58]        # 0x1400018b0
   140001958:	48 89 c1             	mov    rcx,rax
   14000195b:	e8 7b fc ff ff       	call   0x1400015db
   140001960:	90                   	nop
   140001961:	48 83 c4 30          	add    rsp,0x30
   140001965:	5d                   	pop    rbp
   140001966:	c3                   	ret
   140001967:	55                   	push   rbp
   140001968:	48 89 e5             	mov    rbp,rsp
   14000196b:	48 83 ec 20          	sub    rsp,0x20
   14000196f:	8b 05 0b e7 00 00    	mov    eax,DWORD PTR [rip+0xe70b]        # 0x140010080
   140001975:	85 c0                	test   eax,eax
   140001977:	75 0f                	jne    0x140001988
   140001979:	c7 05 fd e6 00 00 01 	mov    DWORD PTR [rip+0xe6fd],0x1        # 0x140010080
   140001980:	00 00 00 
   140001983:	e8 67 ff ff ff       	call   0x1400018ef
   140001988:	90                   	nop
   140001989:	48 83 c4 20          	add    rsp,0x20
   14000198d:	5d                   	pop    rbp
   14000198e:	c3                   	ret
   14000198f:	90                   	nop
   140001990:	55                   	push   rbp
   140001991:	48 89 e5             	mov    rbp,rsp
   140001994:	b8 00 00 00 00       	mov    eax,0x0
   140001999:	5d                   	pop    rbp
   14000199a:	c3                   	ret
   14000199b:	90                   	nop
   14000199c:	90                   	nop
   14000199d:	90                   	nop
   14000199e:	90                   	nop
   14000199f:	90                   	nop
   1400019a0:	55                   	push   rbp
   1400019a1:	48 89 e5             	mov    rbp,rsp
   1400019a4:	48 83 ec 30          	sub    rsp,0x30
   1400019a8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400019ac:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400019af:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   1400019b3:	48 8b 05 66 9d 00 00 	mov    rax,QWORD PTR [rip+0x9d66]        # 0x14000b720
   1400019ba:	8b 00                	mov    eax,DWORD PTR [rax]
   1400019bc:	83 f8 02             	cmp    eax,0x2
   1400019bf:	74 0d                	je     0x1400019ce
   1400019c1:	48 8b 05 58 9d 00 00 	mov    rax,QWORD PTR [rip+0x9d58]        # 0x14000b720
   1400019c8:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   1400019ce:	83 7d 18 02          	cmp    DWORD PTR [rbp+0x18],0x2
   1400019d2:	74 1e                	je     0x1400019f2
   1400019d4:	83 7d 18 01          	cmp    DWORD PTR [rbp+0x18],0x1
   1400019d8:	75 5b                	jne    0x140001a35
   1400019da:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   1400019de:	8b 55 18             	mov    edx,DWORD PTR [rbp+0x18]
   1400019e1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400019e5:	49 89 c8             	mov    r8,rcx
   1400019e8:	48 89 c1             	mov    rcx,rax
   1400019eb:	e8 91 0f 00 00       	call   0x140002981
   1400019f0:	eb 43                	jmp    0x140001a35
   1400019f2:	48 8d 05 5f af 00 00 	lea    rax,[rip+0xaf5f]        # 0x14000c958
   1400019f9:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400019fd:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
   140001a02:	eb 22                	jmp    0x140001a26
   140001a04:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140001a08:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140001a0c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001a10:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001a13:	48 85 c0             	test   rax,rax
   140001a16:	74 09                	je     0x140001a21
   140001a18:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001a1c:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001a1f:	ff d0                	call   rax
   140001a21:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
   140001a26:	48 8d 05 33 af 00 00 	lea    rax,[rip+0xaf33]        # 0x14000c960
   140001a2d:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
   140001a31:	75 d1                	jne    0x140001a04
   140001a33:	eb 01                	jmp    0x140001a36
   140001a35:	90                   	nop
   140001a36:	48 83 c4 30          	add    rsp,0x30
   140001a3a:	5d                   	pop    rbp
   140001a3b:	c3                   	ret
   140001a3c:	55                   	push   rbp
   140001a3d:	48 89 e5             	mov    rbp,rsp
   140001a40:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001a44:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   140001a49:	75 07                	jne    0x140001a52
   140001a4b:	b8 00 00 00 00       	mov    eax,0x0
   140001a50:	eb 05                	jmp    0x140001a57
   140001a52:	b8 00 00 00 00       	mov    eax,0x0
   140001a57:	5d                   	pop    rbp
   140001a58:	c3                   	ret
   140001a59:	55                   	push   rbp
   140001a5a:	48 89 e5             	mov    rbp,rsp
   140001a5d:	48 83 ec 20          	sub    rsp,0x20
   140001a61:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001a65:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140001a68:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001a6c:	83 7d 18 03          	cmp    DWORD PTR [rbp+0x18],0x3
   140001a70:	74 06                	je     0x140001a78
   140001a72:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   140001a76:	75 18                	jne    0x140001a90
   140001a78:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   140001a7c:	8b 55 18             	mov    edx,DWORD PTR [rbp+0x18]
   140001a7f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001a83:	49 89 c8             	mov    r8,rcx
   140001a86:	48 89 c1             	mov    rcx,rax
   140001a89:	e8 f3 0e 00 00       	call   0x140002981
   140001a8e:	eb 01                	jmp    0x140001a91
   140001a90:	90                   	nop
   140001a91:	48 83 c4 20          	add    rsp,0x20
   140001a95:	5d                   	pop    rbp
   140001a96:	c3                   	ret
   140001a97:	90                   	nop
   140001a98:	90                   	nop
   140001a99:	90                   	nop
   140001a9a:	90                   	nop
   140001a9b:	90                   	nop
   140001a9c:	90                   	nop
   140001a9d:	90                   	nop
   140001a9e:	90                   	nop
   140001a9f:	90                   	nop
   140001aa0:	55                   	push   rbp
   140001aa1:	53                   	push   rbx
   140001aa2:	48 81 ec 88 00 00 00 	sub    rsp,0x88
   140001aa9:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   140001aae:	0f 29 75 00          	movaps XMMWORD PTR [rbp+0x0],xmm6
   140001ab2:	0f 29 7d 10          	movaps XMMWORD PTR [rbp+0x10],xmm7
   140001ab6:	44 0f 29 45 20       	movaps XMMWORD PTR [rbp+0x20],xmm8
   140001abb:	48 89 4d 50          	mov    QWORD PTR [rbp+0x50],rcx
   140001abf:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001ac3:	8b 00                	mov    eax,DWORD PTR [rax]
   140001ac5:	83 f8 06             	cmp    eax,0x6
   140001ac8:	74 56                	je     0x140001b20
   140001aca:	83 f8 06             	cmp    eax,0x6
   140001acd:	7f 78                	jg     0x140001b47
   140001acf:	83 f8 05             	cmp    eax,0x5
   140001ad2:	74 59                	je     0x140001b2d
   140001ad4:	83 f8 05             	cmp    eax,0x5
   140001ad7:	7f 6e                	jg     0x140001b47
   140001ad9:	83 f8 04             	cmp    eax,0x4
   140001adc:	74 5c                	je     0x140001b3a
   140001ade:	83 f8 04             	cmp    eax,0x4
   140001ae1:	7f 64                	jg     0x140001b47
   140001ae3:	83 f8 03             	cmp    eax,0x3
   140001ae6:	74 2b                	je     0x140001b13
   140001ae8:	83 f8 03             	cmp    eax,0x3
   140001aeb:	7f 5a                	jg     0x140001b47
   140001aed:	83 f8 01             	cmp    eax,0x1
   140001af0:	74 07                	je     0x140001af9
   140001af2:	83 f8 02             	cmp    eax,0x2
   140001af5:	74 0f                	je     0x140001b06
   140001af7:	eb 4e                	jmp    0x140001b47
   140001af9:	48 8d 05 a0 97 00 00 	lea    rax,[rip+0x97a0]        # 0x14000b2a0
   140001b00:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b04:	eb 4d                	jmp    0x140001b53
   140001b06:	48 8d 05 b2 97 00 00 	lea    rax,[rip+0x97b2]        # 0x14000b2bf
   140001b0d:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b11:	eb 40                	jmp    0x140001b53
   140001b13:	48 8d 05 c6 97 00 00 	lea    rax,[rip+0x97c6]        # 0x14000b2e0
   140001b1a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b1e:	eb 33                	jmp    0x140001b53
   140001b20:	48 8d 05 d9 97 00 00 	lea    rax,[rip+0x97d9]        # 0x14000b300
   140001b27:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b2b:	eb 26                	jmp    0x140001b53
   140001b2d:	48 8d 05 f4 97 00 00 	lea    rax,[rip+0x97f4]        # 0x14000b328
   140001b34:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b38:	eb 19                	jmp    0x140001b53
   140001b3a:	48 8d 05 0f 98 00 00 	lea    rax,[rip+0x980f]        # 0x14000b350
   140001b41:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b45:	eb 0c                	jmp    0x140001b53
   140001b47:	48 8d 05 38 98 00 00 	lea    rax,[rip+0x9838]        # 0x14000b386
   140001b4e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001b52:	90                   	nop
   140001b53:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001b57:	f2 44 0f 10 40 20    	movsd  xmm8,QWORD PTR [rax+0x20]
   140001b5d:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001b61:	f2 0f 10 78 18       	movsd  xmm7,QWORD PTR [rax+0x18]
   140001b66:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001b6a:	f2 0f 10 70 10       	movsd  xmm6,QWORD PTR [rax+0x10]
   140001b6f:	48 8b 45 50          	mov    rax,QWORD PTR [rbp+0x50]
   140001b73:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
   140001b77:	b9 02 00 00 00       	mov    ecx,0x2
   140001b7c:	e8 9f 7a 00 00       	call   0x140009620
   140001b81:	48 89 c1             	mov    rcx,rax
   140001b84:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140001b88:	48 8d 05 09 98 00 00 	lea    rax,[rip+0x9809]        # 0x14000b398
   140001b8f:	f2 44 0f 11 44 24 30 	movsd  QWORD PTR [rsp+0x30],xmm8
   140001b96:	f2 0f 11 7c 24 28    	movsd  QWORD PTR [rsp+0x28],xmm7
   140001b9c:	f2 0f 11 74 24 20    	movsd  QWORD PTR [rsp+0x20],xmm6
   140001ba2:	49 89 d9             	mov    r9,rbx
   140001ba5:	49 89 d0             	mov    r8,rdx
   140001ba8:	48 89 c2             	mov    rdx,rax
   140001bab:	e8 48 7b 00 00       	call   0x1400096f8
   140001bb0:	b8 00 00 00 00       	mov    eax,0x0
   140001bb5:	0f 28 75 00          	movaps xmm6,XMMWORD PTR [rbp+0x0]
   140001bb9:	0f 28 7d 10          	movaps xmm7,XMMWORD PTR [rbp+0x10]
   140001bbd:	44 0f 28 45 20       	movaps xmm8,XMMWORD PTR [rbp+0x20]
   140001bc2:	48 81 c4 88 00 00 00 	add    rsp,0x88
   140001bc9:	5b                   	pop    rbx
   140001bca:	5d                   	pop    rbp
   140001bcb:	c3                   	ret
   140001bcc:	90                   	nop
   140001bcd:	90                   	nop
   140001bce:	90                   	nop
   140001bcf:	90                   	nop
   140001bd0:	55                   	push   rbp
   140001bd1:	53                   	push   rbx
   140001bd2:	48 83 ec 38          	sub    rsp,0x38
   140001bd6:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140001bdb:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140001bdf:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140001be3:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140001be7:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140001beb:	48 8d 45 28          	lea    rax,[rbp+0x28]
   140001bef:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140001bf3:	b9 02 00 00 00       	mov    ecx,0x2
   140001bf8:	e8 23 7a 00 00       	call   0x140009620
   140001bfd:	48 89 c1             	mov    rcx,rax
   140001c00:	48 8d 05 c9 97 00 00 	lea    rax,[rip+0x97c9]        # 0x14000b3d0
   140001c07:	48 89 c2             	mov    rdx,rax
   140001c0a:	e8 e9 7a 00 00       	call   0x1400096f8
   140001c0f:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
   140001c13:	b9 02 00 00 00       	mov    ecx,0x2
   140001c18:	e8 03 7a 00 00       	call   0x140009620
   140001c1d:	48 89 c1             	mov    rcx,rax
   140001c20:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140001c24:	49 89 d8             	mov    r8,rbx
   140001c27:	48 89 c2             	mov    rdx,rax
   140001c2a:	e8 49 7b 00 00       	call   0x140009778
   140001c2f:	e8 84 7a 00 00       	call   0x1400096b8
   140001c34:	90                   	nop
   140001c35:	55                   	push   rbp
   140001c36:	48 89 e5             	mov    rbp,rsp
   140001c39:	48 83 ec 60          	sub    rsp,0x60
   140001c3d:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001c41:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001c48:	e9 82 00 00 00       	jmp    0x140001ccf
   140001c4d:	48 8b 0d 8c e4 00 00 	mov    rcx,QWORD PTR [rip+0xe48c]        # 0x1400100e0
   140001c54:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001c57:	48 63 d0             	movsxd rdx,eax
   140001c5a:	48 89 d0             	mov    rax,rdx
   140001c5d:	48 c1 e0 02          	shl    rax,0x2
   140001c61:	48 01 d0             	add    rax,rdx
   140001c64:	48 c1 e0 03          	shl    rax,0x3
   140001c68:	48 01 c8             	add    rax,rcx
   140001c6b:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   140001c6f:	48 39 45 10          	cmp    QWORD PTR [rbp+0x10],rax
   140001c73:	72 56                	jb     0x140001ccb
   140001c75:	48 8b 0d 64 e4 00 00 	mov    rcx,QWORD PTR [rip+0xe464]        # 0x1400100e0
   140001c7c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001c7f:	48 63 d0             	movsxd rdx,eax
   140001c82:	48 89 d0             	mov    rax,rdx
   140001c85:	48 c1 e0 02          	shl    rax,0x2
   140001c89:	48 01 d0             	add    rax,rdx
   140001c8c:	48 c1 e0 03          	shl    rax,0x3
   140001c90:	48 01 c8             	add    rax,rcx
   140001c93:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   140001c97:	4c 8b 05 42 e4 00 00 	mov    r8,QWORD PTR [rip+0xe442]        # 0x1400100e0
   140001c9e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001ca1:	48 63 d0             	movsxd rdx,eax
   140001ca4:	48 89 d0             	mov    rax,rdx
   140001ca7:	48 c1 e0 02          	shl    rax,0x2
   140001cab:	48 01 d0             	add    rax,rdx
   140001cae:	48 c1 e0 03          	shl    rax,0x3
   140001cb2:	4c 01 c0             	add    rax,r8
   140001cb5:	48 8b 40 20          	mov    rax,QWORD PTR [rax+0x20]
   140001cb9:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140001cbc:	89 c0                	mov    eax,eax
   140001cbe:	48 01 c8             	add    rax,rcx
   140001cc1:	48 39 45 10          	cmp    QWORD PTR [rbp+0x10],rax
   140001cc5:	0f 82 41 02 00 00    	jb     0x140001f0c
   140001ccb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001ccf:	8b 05 13 e4 00 00    	mov    eax,DWORD PTR [rip+0xe413]        # 0x1400100e8
   140001cd5:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   140001cd8:	0f 8c 6f ff ff ff    	jl     0x140001c4d
   140001cde:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001ce2:	48 89 c1             	mov    rcx,rax
   140001ce5:	e8 81 0f 00 00       	call   0x140002c6b
   140001cea:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140001cee:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140001cf3:	75 13                	jne    0x140001d08
   140001cf5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140001cf9:	48 8d 0d f0 96 00 00 	lea    rcx,[rip+0x96f0]        # 0x14000b3f0
   140001d00:	48 89 c2             	mov    rdx,rax
   140001d03:	e8 c8 fe ff ff       	call   0x140001bd0
   140001d08:	48 8b 0d d1 e3 00 00 	mov    rcx,QWORD PTR [rip+0xe3d1]        # 0x1400100e0
   140001d0f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001d12:	48 63 d0             	movsxd rdx,eax
   140001d15:	48 89 d0             	mov    rax,rdx
   140001d18:	48 c1 e0 02          	shl    rax,0x2
   140001d1c:	48 01 d0             	add    rax,rdx
   140001d1f:	48 c1 e0 03          	shl    rax,0x3
   140001d23:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
   140001d27:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001d2b:	48 89 42 20          	mov    QWORD PTR [rdx+0x20],rax
   140001d2f:	48 8b 0d aa e3 00 00 	mov    rcx,QWORD PTR [rip+0xe3aa]        # 0x1400100e0
   140001d36:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001d39:	48 63 d0             	movsxd rdx,eax
   140001d3c:	48 89 d0             	mov    rax,rdx
   140001d3f:	48 c1 e0 02          	shl    rax,0x2
   140001d43:	48 01 d0             	add    rax,rdx
   140001d46:	48 c1 e0 03          	shl    rax,0x3
   140001d4a:	48 01 c8             	add    rax,rcx
   140001d4d:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001d53:	e8 5f 10 00 00       	call   0x140002db7
   140001d58:	48 89 c1             	mov    rcx,rax
   140001d5b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001d5f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140001d62:	41 89 c1             	mov    r9d,eax
   140001d65:	4c 8b 05 74 e3 00 00 	mov    r8,QWORD PTR [rip+0xe374]        # 0x1400100e0
   140001d6c:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001d6f:	48 63 d0             	movsxd rdx,eax
   140001d72:	48 89 d0             	mov    rax,rdx
   140001d75:	48 c1 e0 02          	shl    rax,0x2
   140001d79:	48 01 d0             	add    rax,rdx
   140001d7c:	48 c1 e0 03          	shl    rax,0x3
   140001d80:	4c 01 c0             	add    rax,r8
   140001d83:	4a 8d 14 09          	lea    rdx,[rcx+r9*1]
   140001d87:	48 89 50 18          	mov    QWORD PTR [rax+0x18],rdx
   140001d8b:	48 8b 0d 4e e3 00 00 	mov    rcx,QWORD PTR [rip+0xe34e]        # 0x1400100e0
   140001d92:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001d95:	48 63 d0             	movsxd rdx,eax
   140001d98:	48 89 d0             	mov    rax,rdx
   140001d9b:	48 c1 e0 02          	shl    rax,0x2
   140001d9f:	48 01 d0             	add    rax,rdx
   140001da2:	48 c1 e0 03          	shl    rax,0x3
   140001da6:	48 01 c8             	add    rax,rcx
   140001da9:	48 8b 40 18          	mov    rax,QWORD PTR [rax+0x18]
   140001dad:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140001db1:	41 b8 30 00 00 00    	mov    r8d,0x30
   140001db7:	48 89 c1             	mov    rcx,rax
   140001dba:	48 8b 05 df f4 00 00 	mov    rax,QWORD PTR [rip+0xf4df]        # 0x1400112a0
   140001dc1:	ff d0                	call   rax
   140001dc3:	48 85 c0             	test   rax,rax
   140001dc6:	75 3f                	jne    0x140001e07
   140001dc8:	48 8b 0d 11 e3 00 00 	mov    rcx,QWORD PTR [rip+0xe311]        # 0x1400100e0
   140001dcf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001dd2:	48 63 d0             	movsxd rdx,eax
   140001dd5:	48 89 d0             	mov    rax,rdx
   140001dd8:	48 c1 e0 02          	shl    rax,0x2
   140001ddc:	48 01 d0             	add    rax,rdx
   140001ddf:	48 c1 e0 03          	shl    rax,0x3
   140001de3:	48 01 c8             	add    rax,rcx
   140001de6:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   140001dea:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140001dee:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140001df1:	89 c1                	mov    ecx,eax
   140001df3:	48 8d 05 16 96 00 00 	lea    rax,[rip+0x9616]        # 0x14000b410
   140001dfa:	49 89 d0             	mov    r8,rdx
   140001dfd:	89 ca                	mov    edx,ecx
   140001dff:	48 89 c1             	mov    rcx,rax
   140001e02:	e8 c9 fd ff ff       	call   0x140001bd0
   140001e07:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001e0a:	83 f8 40             	cmp    eax,0x40
   140001e0d:	0f 84 e8 00 00 00    	je     0x140001efb
   140001e13:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001e16:	83 f8 04             	cmp    eax,0x4
   140001e19:	0f 84 dc 00 00 00    	je     0x140001efb
   140001e1f:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001e22:	3d 80 00 00 00       	cmp    eax,0x80
   140001e27:	0f 84 ce 00 00 00    	je     0x140001efb
   140001e2d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001e30:	83 f8 08             	cmp    eax,0x8
   140001e33:	0f 84 c2 00 00 00    	je     0x140001efb
   140001e39:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140001e3c:	83 f8 02             	cmp    eax,0x2
   140001e3f:	75 09                	jne    0x140001e4a
   140001e41:	c7 45 f8 04 00 00 00 	mov    DWORD PTR [rbp-0x8],0x4
   140001e48:	eb 07                	jmp    0x140001e51
   140001e4a:	c7 45 f8 40 00 00 00 	mov    DWORD PTR [rbp-0x8],0x40
   140001e51:	48 8b 0d 88 e2 00 00 	mov    rcx,QWORD PTR [rip+0xe288]        # 0x1400100e0
   140001e58:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001e5b:	48 63 d0             	movsxd rdx,eax
   140001e5e:	48 89 d0             	mov    rax,rdx
   140001e61:	48 c1 e0 02          	shl    rax,0x2
   140001e65:	48 01 d0             	add    rax,rdx
   140001e68:	48 c1 e0 03          	shl    rax,0x3
   140001e6c:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
   140001e70:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   140001e74:	48 89 42 08          	mov    QWORD PTR [rdx+0x8],rax
   140001e78:	48 8b 0d 61 e2 00 00 	mov    rcx,QWORD PTR [rip+0xe261]        # 0x1400100e0
   140001e7f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001e82:	48 63 d0             	movsxd rdx,eax
   140001e85:	48 89 d0             	mov    rax,rdx
   140001e88:	48 c1 e0 02          	shl    rax,0x2
   140001e8c:	48 01 d0             	add    rax,rdx
   140001e8f:	48 c1 e0 03          	shl    rax,0x3
   140001e93:	48 8d 14 01          	lea    rdx,[rcx+rax*1]
   140001e97:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140001e9b:	48 89 42 10          	mov    QWORD PTR [rdx+0x10],rax
   140001e9f:	48 8b 0d 3a e2 00 00 	mov    rcx,QWORD PTR [rip+0xe23a]        # 0x1400100e0
   140001ea6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001ea9:	48 63 d0             	movsxd rdx,eax
   140001eac:	48 89 d0             	mov    rax,rdx
   140001eaf:	48 c1 e0 02          	shl    rax,0x2
   140001eb3:	48 01 d0             	add    rax,rdx
   140001eb6:	48 c1 e0 03          	shl    rax,0x3
   140001eba:	48 01 c8             	add    rax,rcx
   140001ebd:	49 89 c0             	mov    r8,rax
   140001ec0:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
   140001ec4:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   140001ec8:	8b 4d f8             	mov    ecx,DWORD PTR [rbp-0x8]
   140001ecb:	4d 89 c1             	mov    r9,r8
   140001ece:	41 89 c8             	mov    r8d,ecx
   140001ed1:	48 89 c1             	mov    rcx,rax
   140001ed4:	48 8b 05 bd f3 00 00 	mov    rax,QWORD PTR [rip+0xf3bd]        # 0x140011298
   140001edb:	ff d0                	call   rax
   140001edd:	85 c0                	test   eax,eax
   140001edf:	75 1a                	jne    0x140001efb
   140001ee1:	48 8b 05 58 f3 00 00 	mov    rax,QWORD PTR [rip+0xf358]        # 0x140011240
   140001ee8:	ff d0                	call   rax
   140001eea:	89 c2                	mov    edx,eax
   140001eec:	48 8d 05 55 95 00 00 	lea    rax,[rip+0x9555]        # 0x14000b448
   140001ef3:	48 89 c1             	mov    rcx,rax
   140001ef6:	e8 d5 fc ff ff       	call   0x140001bd0
   140001efb:	8b 05 e7 e1 00 00    	mov    eax,DWORD PTR [rip+0xe1e7]        # 0x1400100e8
   140001f01:	83 c0 01             	add    eax,0x1
   140001f04:	89 05 de e1 00 00    	mov    DWORD PTR [rip+0xe1de],eax        # 0x1400100e8
   140001f0a:	eb 01                	jmp    0x140001f0d
   140001f0c:	90                   	nop
   140001f0d:	48 83 c4 60          	add    rsp,0x60
   140001f11:	5d                   	pop    rbp
   140001f12:	c3                   	ret
   140001f13:	55                   	push   rbp
   140001f14:	48 89 e5             	mov    rbp,rsp
   140001f17:	48 83 ec 30          	sub    rsp,0x30
   140001f1b:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001f22:	e9 ad 00 00 00       	jmp    0x140001fd4
   140001f27:	48 8b 0d b2 e1 00 00 	mov    rcx,QWORD PTR [rip+0xe1b2]        # 0x1400100e0
   140001f2e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001f31:	48 63 d0             	movsxd rdx,eax
   140001f34:	48 89 d0             	mov    rax,rdx
   140001f37:	48 c1 e0 02          	shl    rax,0x2
   140001f3b:	48 01 d0             	add    rax,rdx
   140001f3e:	48 c1 e0 03          	shl    rax,0x3
   140001f42:	48 01 c8             	add    rax,rcx
   140001f45:	8b 00                	mov    eax,DWORD PTR [rax]
   140001f47:	85 c0                	test   eax,eax
   140001f49:	0f 84 80 00 00 00    	je     0x140001fcf
   140001f4f:	48 8b 0d 8a e1 00 00 	mov    rcx,QWORD PTR [rip+0xe18a]        # 0x1400100e0
   140001f56:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001f59:	48 63 d0             	movsxd rdx,eax
   140001f5c:	48 89 d0             	mov    rax,rdx
   140001f5f:	48 c1 e0 02          	shl    rax,0x2
   140001f63:	48 01 d0             	add    rax,rdx
   140001f66:	48 c1 e0 03          	shl    rax,0x3
   140001f6a:	48 01 c8             	add    rax,rcx
   140001f6d:	44 8b 10             	mov    r10d,DWORD PTR [rax]
   140001f70:	48 8b 0d 69 e1 00 00 	mov    rcx,QWORD PTR [rip+0xe169]        # 0x1400100e0
   140001f77:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001f7a:	48 63 d0             	movsxd rdx,eax
   140001f7d:	48 89 d0             	mov    rax,rdx
   140001f80:	48 c1 e0 02          	shl    rax,0x2
   140001f84:	48 01 d0             	add    rax,rdx
   140001f87:	48 c1 e0 03          	shl    rax,0x3
   140001f8b:	48 01 c8             	add    rax,rcx
   140001f8e:	48 8b 48 10          	mov    rcx,QWORD PTR [rax+0x10]
   140001f92:	4c 8b 05 47 e1 00 00 	mov    r8,QWORD PTR [rip+0xe147]        # 0x1400100e0
   140001f99:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140001f9c:	48 63 d0             	movsxd rdx,eax
   140001f9f:	48 89 d0             	mov    rax,rdx
   140001fa2:	48 c1 e0 02          	shl    rax,0x2
   140001fa6:	48 01 d0             	add    rax,rdx
   140001fa9:	48 c1 e0 03          	shl    rax,0x3
   140001fad:	4c 01 c0             	add    rax,r8
   140001fb0:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140001fb4:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140001fb8:	49 89 d1             	mov    r9,rdx
   140001fbb:	45 89 d0             	mov    r8d,r10d
   140001fbe:	48 89 ca             	mov    rdx,rcx
   140001fc1:	48 89 c1             	mov    rcx,rax
   140001fc4:	48 8b 05 cd f2 00 00 	mov    rax,QWORD PTR [rip+0xf2cd]        # 0x140011298
   140001fcb:	ff d0                	call   rax
   140001fcd:	eb 01                	jmp    0x140001fd0
   140001fcf:	90                   	nop
   140001fd0:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140001fd4:	8b 05 0e e1 00 00    	mov    eax,DWORD PTR [rip+0xe10e]        # 0x1400100e8
   140001fda:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   140001fdd:	0f 8c 44 ff ff ff    	jl     0x140001f27
   140001fe3:	90                   	nop
   140001fe4:	90                   	nop
   140001fe5:	48 83 c4 30          	add    rsp,0x30
   140001fe9:	5d                   	pop    rbp
   140001fea:	c3                   	ret
   140001feb:	55                   	push   rbp
   140001fec:	48 89 e5             	mov    rbp,rsp
   140001fef:	48 83 ec 20          	sub    rsp,0x20
   140001ff3:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140001ff7:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140001ffb:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140001fff:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
   140002004:	74 25                	je     0x14000202b
   140002006:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000200a:	48 89 c1             	mov    rcx,rax
   14000200d:	e8 23 fc ff ff       	call   0x140001c35
   140002012:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   140002016:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   14000201a:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000201e:	49 89 c8             	mov    r8,rcx
   140002021:	48 89 c1             	mov    rcx,rax
   140002024:	e8 07 77 00 00       	call   0x140009730
   140002029:	eb 01                	jmp    0x14000202c
   14000202b:	90                   	nop
   14000202c:	48 83 c4 20          	add    rsp,0x20
   140002030:	5d                   	pop    rbp
   140002031:	c3                   	ret
   140002032:	55                   	push   rbp
   140002033:	48 89 e5             	mov    rbp,rsp
   140002036:	48 83 c4 80          	add    rsp,0xffffffffffffff80
   14000203a:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000203e:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140002042:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140002046:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000204a:	48 2b 45 10          	sub    rax,QWORD PTR [rbp+0x10]
   14000204e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002052:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002056:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000205a:	48 83 7d e0 07       	cmp    QWORD PTR [rbp-0x20],0x7
   14000205f:	0f 8e 44 03 00 00    	jle    0x1400023a9
   140002065:	48 83 7d e0 0b       	cmp    QWORD PTR [rbp-0x20],0xb
   14000206a:	7e 25                	jle    0x140002091
   14000206c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002070:	8b 00                	mov    eax,DWORD PTR [rax]
   140002072:	85 c0                	test   eax,eax
   140002074:	75 1b                	jne    0x140002091
   140002076:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000207a:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   14000207d:	85 c0                	test   eax,eax
   14000207f:	75 10                	jne    0x140002091
   140002081:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002085:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002088:	85 c0                	test   eax,eax
   14000208a:	75 05                	jne    0x140002091
   14000208c:	48 83 45 f8 0c       	add    QWORD PTR [rbp-0x8],0xc
   140002091:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002095:	8b 00                	mov    eax,DWORD PTR [rax]
   140002097:	85 c0                	test   eax,eax
   140002099:	75 0b                	jne    0x1400020a6
   14000209b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000209f:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   1400020a2:	85 c0                	test   eax,eax
   1400020a4:	74 59                	je     0x1400020ff
   1400020a6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400020aa:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400020ae:	eb 40                	jmp    0x1400020f0
   1400020b0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400020b4:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   1400020b7:	89 c2                	mov    edx,eax
   1400020b9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400020bd:	48 01 d0             	add    rax,rdx
   1400020c0:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   1400020c4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400020c8:	8b 10                	mov    edx,DWORD PTR [rax]
   1400020ca:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400020ce:	8b 00                	mov    eax,DWORD PTR [rax]
   1400020d0:	01 d0                	add    eax,edx
   1400020d2:	89 45 b4             	mov    DWORD PTR [rbp-0x4c],eax
   1400020d5:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400020d9:	48 8d 55 b4          	lea    rdx,[rbp-0x4c]
   1400020dd:	41 b8 04 00 00 00    	mov    r8d,0x4
   1400020e3:	48 89 c1             	mov    rcx,rax
   1400020e6:	e8 00 ff ff ff       	call   0x140001feb
   1400020eb:	48 83 45 e8 08       	add    QWORD PTR [rbp-0x18],0x8
   1400020f0:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400020f4:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   1400020f8:	72 b6                	jb     0x1400020b0
   1400020fa:	e9 ab 02 00 00       	jmp    0x1400023aa
   1400020ff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002103:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002106:	83 f8 01             	cmp    eax,0x1
   140002109:	74 18                	je     0x140002123
   14000210b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000210f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002112:	89 c2                	mov    edx,eax
   140002114:	48 8d 05 55 93 00 00 	lea    rax,[rip+0x9355]        # 0x14000b470
   14000211b:	48 89 c1             	mov    rcx,rax
   14000211e:	e8 ad fa ff ff       	call   0x140001bd0
   140002123:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002127:	48 83 c0 0c          	add    rax,0xc
   14000212b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000212f:	e9 65 02 00 00       	jmp    0x140002399
   140002134:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002138:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   14000213b:	89 c2                	mov    edx,eax
   14000213d:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002141:	48 01 d0             	add    rax,rdx
   140002144:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002148:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000214c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000214e:	89 c2                	mov    edx,eax
   140002150:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002154:	48 01 d0             	add    rax,rdx
   140002157:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   14000215b:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14000215f:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002162:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140002166:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000216a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000216d:	0f b6 c0             	movzx  eax,al
   140002170:	83 f8 40             	cmp    eax,0x40
   140002173:	0f 84 b6 00 00 00    	je     0x14000222f
   140002179:	83 f8 40             	cmp    eax,0x40
   14000217c:	0f 87 ba 00 00 00    	ja     0x14000223c
   140002182:	83 f8 20             	cmp    eax,0x20
   140002185:	74 77                	je     0x1400021fe
   140002187:	83 f8 20             	cmp    eax,0x20
   14000218a:	0f 87 ac 00 00 00    	ja     0x14000223c
   140002190:	83 f8 08             	cmp    eax,0x8
   140002193:	74 0a                	je     0x14000219f
   140002195:	83 f8 10             	cmp    eax,0x10
   140002198:	74 38                	je     0x1400021d2
   14000219a:	e9 9d 00 00 00       	jmp    0x14000223c
   14000219f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400021a3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400021a6:	0f b6 c0             	movzx  eax,al
   1400021a9:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021ad:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   1400021b1:	25 80 00 00 00       	and    eax,0x80
   1400021b6:	48 85 c0             	test   rax,rax
   1400021b9:	0f 84 9d 00 00 00    	je     0x14000225c
   1400021bf:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   1400021c3:	48 0d 00 ff ff ff    	or     rax,0xffffffffffffff00
   1400021c9:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021cd:	e9 8a 00 00 00       	jmp    0x14000225c
   1400021d2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400021d6:	0f b7 00             	movzx  eax,WORD PTR [rax]
   1400021d9:	0f b7 c0             	movzx  eax,ax
   1400021dc:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021e0:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   1400021e4:	25 00 80 00 00       	and    eax,0x8000
   1400021e9:	48 85 c0             	test   rax,rax
   1400021ec:	74 71                	je     0x14000225f
   1400021ee:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   1400021f2:	48 0d 00 00 ff ff    	or     rax,0xffffffffffff0000
   1400021f8:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   1400021fc:	eb 61                	jmp    0x14000225f
   1400021fe:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002202:	8b 00                	mov    eax,DWORD PTR [rax]
   140002204:	89 c0                	mov    eax,eax
   140002206:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000220a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000220e:	25 00 00 00 80       	and    eax,0x80000000
   140002213:	48 85 c0             	test   rax,rax
   140002216:	74 4a                	je     0x140002262
   140002218:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000221c:	48 ba 00 00 00 00 ff 	movabs rdx,0xffffffff00000000
   140002223:	ff ff ff 
   140002226:	48 09 d0             	or     rax,rdx
   140002229:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000222d:	eb 33                	jmp    0x140002262
   14000222f:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002233:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002236:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000223a:	eb 27                	jmp    0x140002263
   14000223c:	48 c7 45 b8 00 00 00 	mov    QWORD PTR [rbp-0x48],0x0
   140002243:	00 
   140002244:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002248:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000224b:	0f b6 c0             	movzx  eax,al
   14000224e:	48 8d 0d 53 92 00 00 	lea    rcx,[rip+0x9253]        # 0x14000b4a8
   140002255:	89 c2                	mov    edx,eax
   140002257:	e8 74 f9 ff ff       	call   0x140001bd0
   14000225c:	90                   	nop
   14000225d:	eb 04                	jmp    0x140002263
   14000225f:	90                   	nop
   140002260:	eb 01                	jmp    0x140002263
   140002262:	90                   	nop
   140002263:	48 8b 4d b8          	mov    rcx,QWORD PTR [rbp-0x48]
   140002267:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000226b:	8b 00                	mov    eax,DWORD PTR [rax]
   14000226d:	89 c2                	mov    edx,eax
   14000226f:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002273:	48 01 c2             	add    rdx,rax
   140002276:	48 89 c8             	mov    rax,rcx
   140002279:	48 29 d0             	sub    rax,rdx
   14000227c:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140002280:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
   140002284:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140002288:	48 01 d0             	add    rax,rdx
   14000228b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000228f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002293:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002296:	25 ff 00 00 00       	and    eax,0xff
   14000229b:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   14000229e:	83 7d d4 3f          	cmp    DWORD PTR [rbp-0x2c],0x3f
   1400022a2:	77 67                	ja     0x14000230b
   1400022a4:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   1400022a7:	ba 01 00 00 00       	mov    edx,0x1
   1400022ac:	89 c1                	mov    ecx,eax
   1400022ae:	48 d3 e2             	shl    rdx,cl
   1400022b1:	48 89 d0             	mov    rax,rdx
   1400022b4:	48 83 e8 01          	sub    rax,0x1
   1400022b8:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   1400022bc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   1400022bf:	83 e8 01             	sub    eax,0x1
   1400022c2:	48 c7 c2 ff ff ff ff 	mov    rdx,0xffffffffffffffff
   1400022c9:	89 c1                	mov    ecx,eax
   1400022cb:	48 d3 e2             	shl    rdx,cl
   1400022ce:	48 89 d0             	mov    rax,rdx
   1400022d1:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   1400022d5:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   1400022d9:	48 39 45 c8          	cmp    QWORD PTR [rbp-0x38],rax
   1400022dd:	7c 0a                	jl     0x1400022e9
   1400022df:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   1400022e3:	48 39 45 c0          	cmp    QWORD PTR [rbp-0x40],rax
   1400022e7:	7e 22                	jle    0x14000230b
   1400022e9:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
   1400022ed:	4c 8b 4d d8          	mov    r9,QWORD PTR [rbp-0x28]
   1400022f1:	4c 8b 45 e0          	mov    r8,QWORD PTR [rbp-0x20]
   1400022f5:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   1400022f8:	48 8d 0d d9 91 00 00 	lea    rcx,[rip+0x91d9]        # 0x14000b4d8
   1400022ff:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140002304:	89 c2                	mov    edx,eax
   140002306:	e8 c5 f8 ff ff       	call   0x140001bd0
   14000230b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000230f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002312:	0f b6 c0             	movzx  eax,al
   140002315:	83 f8 40             	cmp    eax,0x40
   140002318:	74 63                	je     0x14000237d
   14000231a:	83 f8 40             	cmp    eax,0x40
   14000231d:	77 75                	ja     0x140002394
   14000231f:	83 f8 20             	cmp    eax,0x20
   140002322:	74 41                	je     0x140002365
   140002324:	83 f8 20             	cmp    eax,0x20
   140002327:	77 6b                	ja     0x140002394
   140002329:	83 f8 08             	cmp    eax,0x8
   14000232c:	74 07                	je     0x140002335
   14000232e:	83 f8 10             	cmp    eax,0x10
   140002331:	74 1a                	je     0x14000234d
   140002333:	eb 5f                	jmp    0x140002394
   140002335:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002339:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   14000233d:	41 b8 01 00 00 00    	mov    r8d,0x1
   140002343:	48 89 c1             	mov    rcx,rax
   140002346:	e8 a0 fc ff ff       	call   0x140001feb
   14000234b:	eb 47                	jmp    0x140002394
   14000234d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002351:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   140002355:	41 b8 02 00 00 00    	mov    r8d,0x2
   14000235b:	48 89 c1             	mov    rcx,rax
   14000235e:	e8 88 fc ff ff       	call   0x140001feb
   140002363:	eb 2f                	jmp    0x140002394
   140002365:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002369:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   14000236d:	41 b8 04 00 00 00    	mov    r8d,0x4
   140002373:	48 89 c1             	mov    rcx,rax
   140002376:	e8 70 fc ff ff       	call   0x140001feb
   14000237b:	eb 17                	jmp    0x140002394
   14000237d:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002381:	48 8d 55 b8          	lea    rdx,[rbp-0x48]
   140002385:	41 b8 08 00 00 00    	mov    r8d,0x8
   14000238b:	48 89 c1             	mov    rcx,rax
   14000238e:	e8 58 fc ff ff       	call   0x140001feb
   140002393:	90                   	nop
   140002394:	48 83 45 f0 0c       	add    QWORD PTR [rbp-0x10],0xc
   140002399:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000239d:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   1400023a1:	0f 82 8d fd ff ff    	jb     0x140002134
   1400023a7:	eb 01                	jmp    0x1400023aa
   1400023a9:	90                   	nop
   1400023aa:	48 83 ec 80          	sub    rsp,0xffffffffffffff80
   1400023ae:	5d                   	pop    rbp
   1400023af:	c3                   	ret
   1400023b0:	55                   	push   rbp
   1400023b1:	48 89 e5             	mov    rbp,rsp
   1400023b4:	48 83 ec 30          	sub    rsp,0x30
   1400023b8:	8b 05 2e dd 00 00    	mov    eax,DWORD PTR [rip+0xdd2e]        # 0x1400100ec
   1400023be:	85 c0                	test   eax,eax
   1400023c0:	0f 85 88 00 00 00    	jne    0x14000244e
   1400023c6:	8b 05 20 dd 00 00    	mov    eax,DWORD PTR [rip+0xdd20]        # 0x1400100ec
   1400023cc:	83 c0 01             	add    eax,0x1
   1400023cf:	89 05 17 dd 00 00    	mov    DWORD PTR [rip+0xdd17],eax        # 0x1400100ec
   1400023d5:	e8 e1 08 00 00       	call   0x140002cbb
   1400023da:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400023dd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400023e0:	48 63 d0             	movsxd rdx,eax
   1400023e3:	48 89 d0             	mov    rax,rdx
   1400023e6:	48 c1 e0 02          	shl    rax,0x2
   1400023ea:	48 01 d0             	add    rax,rdx
   1400023ed:	48 c1 e0 03          	shl    rax,0x3
   1400023f1:	48 83 c0 0f          	add    rax,0xf
   1400023f5:	48 c1 e8 04          	shr    rax,0x4
   1400023f9:	48 c1 e0 04          	shl    rax,0x4
   1400023fd:	e8 3e 0b 00 00       	call   0x140002f40
   140002402:	48 29 c4             	sub    rsp,rax
   140002405:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   14000240a:	48 83 c0 0f          	add    rax,0xf
   14000240e:	48 c1 e8 04          	shr    rax,0x4
   140002412:	48 c1 e0 04          	shl    rax,0x4
   140002416:	48 89 05 c3 dc 00 00 	mov    QWORD PTR [rip+0xdcc3],rax        # 0x1400100e0
   14000241d:	c7 05 c1 dc 00 00 00 	mov    DWORD PTR [rip+0xdcc1],0x0        # 0x1400100e8
   140002424:	00 00 00 
   140002427:	48 8b 0d 22 93 00 00 	mov    rcx,QWORD PTR [rip+0x9322]        # 0x14000b750
   14000242e:	48 8b 15 2b 93 00 00 	mov    rdx,QWORD PTR [rip+0x932b]        # 0x14000b760
   140002435:	48 8b 05 34 93 00 00 	mov    rax,QWORD PTR [rip+0x9334]        # 0x14000b770
   14000243c:	49 89 c8             	mov    r8,rcx
   14000243f:	48 89 c1             	mov    rcx,rax
   140002442:	e8 eb fb ff ff       	call   0x140002032
   140002447:	e8 c7 fa ff ff       	call   0x140001f13
   14000244c:	eb 01                	jmp    0x14000244f
   14000244e:	90                   	nop
   14000244f:	48 89 ec             	mov    rsp,rbp
   140002452:	5d                   	pop    rbp
   140002453:	c3                   	ret
   140002454:	90                   	nop
   140002455:	90                   	nop
   140002456:	90                   	nop
   140002457:	90                   	nop
   140002458:	90                   	nop
   140002459:	90                   	nop
   14000245a:	90                   	nop
   14000245b:	90                   	nop
   14000245c:	90                   	nop
   14000245d:	90                   	nop
   14000245e:	90                   	nop
   14000245f:	90                   	nop
   140002460:	55                   	push   rbp
   140002461:	48 89 e5             	mov    rbp,rsp
   140002464:	48 83 ec 50          	sub    rsp,0x50
   140002468:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000246b:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   14000246f:	f2 0f 11 55 20       	movsd  QWORD PTR [rbp+0x20],xmm2
   140002474:	f2 0f 11 5d 28       	movsd  QWORD PTR [rbp+0x28],xmm3
   140002479:	48 8b 05 70 dc 00 00 	mov    rax,QWORD PTR [rip+0xdc70]        # 0x1400100f0
   140002480:	48 85 c0             	test   rax,rax
   140002483:	74 3e                	je     0x1400024c3
   140002485:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140002488:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   14000248b:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000248f:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140002493:	f2 0f 10 45 20       	movsd  xmm0,QWORD PTR [rbp+0x20]
   140002498:	f2 0f 11 45 e0       	movsd  QWORD PTR [rbp-0x20],xmm0
   14000249d:	f2 0f 10 45 28       	movsd  xmm0,QWORD PTR [rbp+0x28]
   1400024a2:	f2 0f 11 45 e8       	movsd  QWORD PTR [rbp-0x18],xmm0
   1400024a7:	f2 0f 10 45 30       	movsd  xmm0,QWORD PTR [rbp+0x30]
   1400024ac:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
   1400024b1:	48 8b 15 38 dc 00 00 	mov    rdx,QWORD PTR [rip+0xdc38]        # 0x1400100f0
   1400024b8:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   1400024bc:	48 89 c1             	mov    rcx,rax
   1400024bf:	ff d2                	call   rdx
   1400024c1:	eb 01                	jmp    0x1400024c4
   1400024c3:	90                   	nop
   1400024c4:	48 83 c4 50          	add    rsp,0x50
   1400024c8:	5d                   	pop    rbp
   1400024c9:	c3                   	ret
   1400024ca:	55                   	push   rbp
   1400024cb:	48 89 e5             	mov    rbp,rsp
   1400024ce:	48 83 ec 20          	sub    rsp,0x20
   1400024d2:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400024d6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400024da:	48 89 05 0f dc 00 00 	mov    QWORD PTR [rip+0xdc0f],rax        # 0x1400100f0
   1400024e1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400024e5:	48 89 c1             	mov    rcx,rax
   1400024e8:	e8 93 71 00 00       	call   0x140009680
   1400024ed:	90                   	nop
   1400024ee:	48 83 c4 20          	add    rsp,0x20
   1400024f2:	5d                   	pop    rbp
   1400024f3:	c3                   	ret
   1400024f4:	90                   	nop
   1400024f5:	90                   	nop
   1400024f6:	90                   	nop
   1400024f7:	90                   	nop
   1400024f8:	90                   	nop
   1400024f9:	90                   	nop
   1400024fa:	90                   	nop
   1400024fb:	90                   	nop
   1400024fc:	90                   	nop
   1400024fd:	90                   	nop
   1400024fe:	90                   	nop
   1400024ff:	90                   	nop
   140002500:	55                   	push   rbp
   140002501:	48 89 e5             	mov    rbp,rsp
   140002504:	48 83 ec 30          	sub    rsp,0x30
   140002508:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000250c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140002513:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   14000251a:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000251e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002521:	8b 00                	mov    eax,DWORD PTR [rax]
   140002523:	25 ff ff ff 20       	and    eax,0x20ffffff
   140002528:	3d 43 43 47 20       	cmp    eax,0x20474343
   14000252d:	75 1b                	jne    0x14000254a
   14000252f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002533:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002536:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140002539:	83 e0 01             	and    eax,0x1
   14000253c:	85 c0                	test   eax,eax
   14000253e:	75 0a                	jne    0x14000254a
   140002540:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140002545:	e9 2a 02 00 00       	jmp    0x140002774
   14000254a:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000254e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140002551:	8b 00                	mov    eax,DWORD PTR [rax]
   140002553:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   140002558:	0f 84 28 01 00 00    	je     0x140002686
   14000255e:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   140002563:	0f 87 d9 01 00 00    	ja     0x140002742
   140002569:	3d 95 00 00 c0       	cmp    eax,0xc0000095
   14000256e:	0f 84 c5 01 00 00    	je     0x140002739
   140002574:	3d 95 00 00 c0       	cmp    eax,0xc0000095
   140002579:	0f 87 c3 01 00 00    	ja     0x140002742
   14000257f:	3d 94 00 00 c0       	cmp    eax,0xc0000094
   140002584:	0f 84 57 01 00 00    	je     0x1400026e1
   14000258a:	3d 94 00 00 c0       	cmp    eax,0xc0000094
   14000258f:	0f 87 ad 01 00 00    	ja     0x140002742
   140002595:	3d 93 00 00 c0       	cmp    eax,0xc0000093
   14000259a:	0f 84 3a 01 00 00    	je     0x1400026da
   1400025a0:	3d 93 00 00 c0       	cmp    eax,0xc0000093
   1400025a5:	0f 87 97 01 00 00    	ja     0x140002742
   1400025ab:	3d 92 00 00 c0       	cmp    eax,0xc0000092
   1400025b0:	0f 84 83 01 00 00    	je     0x140002739
   1400025b6:	3d 92 00 00 c0       	cmp    eax,0xc0000092
   1400025bb:	0f 87 81 01 00 00    	ja     0x140002742
   1400025c1:	3d 91 00 00 c0       	cmp    eax,0xc0000091
   1400025c6:	0f 87 76 01 00 00    	ja     0x140002742
   1400025cc:	3d 8d 00 00 c0       	cmp    eax,0xc000008d
   1400025d1:	0f 83 03 01 00 00    	jae    0x1400026da
   1400025d7:	3d 8c 00 00 c0       	cmp    eax,0xc000008c
   1400025dc:	0f 84 57 01 00 00    	je     0x140002739
   1400025e2:	3d 8c 00 00 c0       	cmp    eax,0xc000008c
   1400025e7:	0f 87 55 01 00 00    	ja     0x140002742
   1400025ed:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   1400025f2:	0f 84 8e 00 00 00    	je     0x140002686
   1400025f8:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   1400025fd:	0f 87 3f 01 00 00    	ja     0x140002742
   140002603:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   140002608:	0f 84 2b 01 00 00    	je     0x140002739
   14000260e:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   140002613:	0f 87 29 01 00 00    	ja     0x140002742
   140002619:	3d 02 00 00 80       	cmp    eax,0x80000002
   14000261e:	0f 84 15 01 00 00    	je     0x140002739
   140002624:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   140002629:	0f 85 13 01 00 00    	jne    0x140002742
   14000262f:	ba 00 00 00 00       	mov    edx,0x0
   140002634:	b9 0b 00 00 00       	mov    ecx,0xb
   140002639:	e8 0a 71 00 00       	call   0x140009748
   14000263e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002642:	48 83 7d f0 01       	cmp    QWORD PTR [rbp-0x10],0x1
   140002647:	75 1b                	jne    0x140002664
   140002649:	ba 01 00 00 00       	mov    edx,0x1
   14000264e:	b9 0b 00 00 00       	mov    ecx,0xb
   140002653:	e8 f0 70 00 00       	call   0x140009748
   140002658:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   14000265f:	e9 e1 00 00 00       	jmp    0x140002745
   140002664:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140002669:	0f 84 d6 00 00 00    	je     0x140002745
   14000266f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002673:	b9 0b 00 00 00       	mov    ecx,0xb
   140002678:	ff d0                	call   rax
   14000267a:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002681:	e9 bf 00 00 00       	jmp    0x140002745
   140002686:	ba 00 00 00 00       	mov    edx,0x0
   14000268b:	b9 04 00 00 00       	mov    ecx,0x4
   140002690:	e8 b3 70 00 00       	call   0x140009748
   140002695:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002699:	48 83 7d f0 01       	cmp    QWORD PTR [rbp-0x10],0x1
   14000269e:	75 1b                	jne    0x1400026bb
   1400026a0:	ba 01 00 00 00       	mov    edx,0x1
   1400026a5:	b9 04 00 00 00       	mov    ecx,0x4
   1400026aa:	e8 99 70 00 00       	call   0x140009748
   1400026af:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   1400026b6:	e9 8d 00 00 00       	jmp    0x140002748
   1400026bb:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400026c0:	0f 84 82 00 00 00    	je     0x140002748
   1400026c6:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400026ca:	b9 04 00 00 00       	mov    ecx,0x4
   1400026cf:	ff d0                	call   rax
   1400026d1:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   1400026d8:	eb 6e                	jmp    0x140002748
   1400026da:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
   1400026e1:	ba 00 00 00 00       	mov    edx,0x0
   1400026e6:	b9 08 00 00 00       	mov    ecx,0x8
   1400026eb:	e8 58 70 00 00       	call   0x140009748
   1400026f0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400026f4:	48 83 7d f0 01       	cmp    QWORD PTR [rbp-0x10],0x1
   1400026f9:	75 23                	jne    0x14000271e
   1400026fb:	ba 01 00 00 00       	mov    edx,0x1
   140002700:	b9 08 00 00 00       	mov    ecx,0x8
   140002705:	e8 3e 70 00 00       	call   0x140009748
   14000270a:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   14000270e:	74 05                	je     0x140002715
   140002710:	e8 6b 03 00 00       	call   0x140002a80
   140002715:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   14000271c:	eb 2d                	jmp    0x14000274b
   14000271e:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140002723:	74 26                	je     0x14000274b
   140002725:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002729:	b9 08 00 00 00       	mov    ecx,0x8
   14000272e:	ff d0                	call   rax
   140002730:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002737:	eb 12                	jmp    0x14000274b
   140002739:	c7 45 fc ff ff ff ff 	mov    DWORD PTR [rbp-0x4],0xffffffff
   140002740:	eb 0a                	jmp    0x14000274c
   140002742:	90                   	nop
   140002743:	eb 07                	jmp    0x14000274c
   140002745:	90                   	nop
   140002746:	eb 04                	jmp    0x14000274c
   140002748:	90                   	nop
   140002749:	eb 01                	jmp    0x14000274c
   14000274b:	90                   	nop
   14000274c:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140002750:	75 1f                	jne    0x140002771
   140002752:	48 8b 05 b7 d9 00 00 	mov    rax,QWORD PTR [rip+0xd9b7]        # 0x140010110
   140002759:	48 85 c0             	test   rax,rax
   14000275c:	74 13                	je     0x140002771
   14000275e:	48 8b 15 ab d9 00 00 	mov    rdx,QWORD PTR [rip+0xd9ab]        # 0x140010110
   140002765:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002769:	48 89 c1             	mov    rcx,rax
   14000276c:	ff d2                	call   rdx
   14000276e:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140002771:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140002774:	48 83 c4 30          	add    rsp,0x30
   140002778:	5d                   	pop    rbp
   140002779:	c3                   	ret
   14000277a:	90                   	nop
   14000277b:	90                   	nop
   14000277c:	90                   	nop
   14000277d:	90                   	nop
   14000277e:	90                   	nop
   14000277f:	90                   	nop
   140002780:	55                   	push   rbp
   140002781:	48 89 e5             	mov    rbp,rsp
   140002784:	48 83 ec 30          	sub    rsp,0x30
   140002788:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000278b:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   14000278f:	8b 05 b3 d9 00 00    	mov    eax,DWORD PTR [rip+0xd9b3]        # 0x140010148
   140002795:	85 c0                	test   eax,eax
   140002797:	75 07                	jne    0x1400027a0
   140002799:	b8 00 00 00 00       	mov    eax,0x0
   14000279e:	eb 7b                	jmp    0x14000281b
   1400027a0:	ba 18 00 00 00       	mov    edx,0x18
   1400027a5:	b9 01 00 00 00       	mov    ecx,0x1
   1400027aa:	e8 21 6f 00 00       	call   0x1400096d0
   1400027af:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400027b3:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   1400027b8:	75 07                	jne    0x1400027c1
   1400027ba:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400027bf:	eb 5a                	jmp    0x14000281b
   1400027c1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400027c5:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   1400027c8:	89 10                	mov    DWORD PTR [rax],edx
   1400027ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400027ce:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400027d2:	48 89 50 08          	mov    QWORD PTR [rax+0x8],rdx
   1400027d6:	48 8d 05 43 d9 00 00 	lea    rax,[rip+0xd943]        # 0x140010120
   1400027dd:	48 89 c1             	mov    rcx,rax
   1400027e0:	48 8b 05 49 ea 00 00 	mov    rax,QWORD PTR [rip+0xea49]        # 0x140011230
   1400027e7:	ff d0                	call   rax
   1400027e9:	48 8b 15 60 d9 00 00 	mov    rdx,QWORD PTR [rip+0xd960]        # 0x140010150
   1400027f0:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400027f4:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   1400027f8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400027fc:	48 89 05 4d d9 00 00 	mov    QWORD PTR [rip+0xd94d],rax        # 0x140010150
   140002803:	48 8d 05 16 d9 00 00 	lea    rax,[rip+0xd916]        # 0x140010120
   14000280a:	48 89 c1             	mov    rcx,rax
   14000280d:	48 8b 05 54 ea 00 00 	mov    rax,QWORD PTR [rip+0xea54]        # 0x140011268
   140002814:	ff d0                	call   rax
   140002816:	b8 00 00 00 00       	mov    eax,0x0
   14000281b:	48 83 c4 30          	add    rsp,0x30
   14000281f:	5d                   	pop    rbp
   140002820:	c3                   	ret
   140002821:	55                   	push   rbp
   140002822:	48 89 e5             	mov    rbp,rsp
   140002825:	48 83 ec 30          	sub    rsp,0x30
   140002829:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000282c:	8b 05 16 d9 00 00    	mov    eax,DWORD PTR [rip+0xd916]        # 0x140010148
   140002832:	85 c0                	test   eax,eax
   140002834:	75 0a                	jne    0x140002840
   140002836:	b8 00 00 00 00       	mov    eax,0x0
   14000283b:	e9 9c 00 00 00       	jmp    0x1400028dc
   140002840:	48 8d 05 d9 d8 00 00 	lea    rax,[rip+0xd8d9]        # 0x140010120
   140002847:	48 89 c1             	mov    rcx,rax
   14000284a:	48 8b 05 df e9 00 00 	mov    rax,QWORD PTR [rip+0xe9df]        # 0x140011230
   140002851:	ff d0                	call   rax
   140002853:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
   14000285a:	00 
   14000285b:	48 8b 05 ee d8 00 00 	mov    rax,QWORD PTR [rip+0xd8ee]        # 0x140010150
   140002862:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002866:	eb 55                	jmp    0x1400028bd
   140002868:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000286c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000286e:	39 45 10             	cmp    DWORD PTR [rbp+0x10],eax
   140002871:	75 36                	jne    0x1400028a9
   140002873:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002878:	75 11                	jne    0x14000288b
   14000287a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000287e:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   140002882:	48 89 05 c7 d8 00 00 	mov    QWORD PTR [rip+0xd8c7],rax        # 0x140010150
   140002889:	eb 10                	jmp    0x14000289b
   14000288b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000288f:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   140002893:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002897:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   14000289b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000289f:	48 89 c1             	mov    rcx,rax
   1400028a2:	e8 69 6e 00 00       	call   0x140009710
   1400028a7:	eb 1b                	jmp    0x1400028c4
   1400028a9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400028ad:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400028b1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400028b5:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   1400028b9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400028bd:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400028c2:	75 a4                	jne    0x140002868
   1400028c4:	48 8d 05 55 d8 00 00 	lea    rax,[rip+0xd855]        # 0x140010120
   1400028cb:	48 89 c1             	mov    rcx,rax
   1400028ce:	48 8b 05 93 e9 00 00 	mov    rax,QWORD PTR [rip+0xe993]        # 0x140011268
   1400028d5:	ff d0                	call   rax
   1400028d7:	b8 00 00 00 00       	mov    eax,0x0
   1400028dc:	48 83 c4 30          	add    rsp,0x30
   1400028e0:	5d                   	pop    rbp
   1400028e1:	c3                   	ret
   1400028e2:	55                   	push   rbp
   1400028e3:	48 89 e5             	mov    rbp,rsp
   1400028e6:	48 83 ec 30          	sub    rsp,0x30
   1400028ea:	8b 05 58 d8 00 00    	mov    eax,DWORD PTR [rip+0xd858]        # 0x140010148
   1400028f0:	85 c0                	test   eax,eax
   1400028f2:	0f 84 82 00 00 00    	je     0x14000297a
   1400028f8:	48 8d 05 21 d8 00 00 	lea    rax,[rip+0xd821]        # 0x140010120
   1400028ff:	48 89 c1             	mov    rcx,rax
   140002902:	48 8b 05 27 e9 00 00 	mov    rax,QWORD PTR [rip+0xe927]        # 0x140011230
   140002909:	ff d0                	call   rax
   14000290b:	48 8b 05 3e d8 00 00 	mov    rax,QWORD PTR [rip+0xd83e]        # 0x140010150
   140002912:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002916:	eb 46                	jmp    0x14000295e
   140002918:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000291c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000291e:	89 c1                	mov    ecx,eax
   140002920:	48 8b 05 69 e9 00 00 	mov    rax,QWORD PTR [rip+0xe969]        # 0x140011290
   140002927:	ff d0                	call   rax
   140002929:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000292d:	48 8b 05 0c e9 00 00 	mov    rax,QWORD PTR [rip+0xe90c]        # 0x140011240
   140002934:	ff d0                	call   rax
   140002936:	85 c0                	test   eax,eax
   140002938:	75 18                	jne    0x140002952
   14000293a:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   14000293f:	74 11                	je     0x140002952
   140002941:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002945:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   140002949:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000294d:	48 89 c1             	mov    rcx,rax
   140002950:	ff d2                	call   rdx
   140002952:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002956:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   14000295a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000295e:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002963:	75 b3                	jne    0x140002918
   140002965:	48 8d 05 b4 d7 00 00 	lea    rax,[rip+0xd7b4]        # 0x140010120
   14000296c:	48 89 c1             	mov    rcx,rax
   14000296f:	48 8b 05 f2 e8 00 00 	mov    rax,QWORD PTR [rip+0xe8f2]        # 0x140011268
   140002976:	ff d0                	call   rax
   140002978:	eb 01                	jmp    0x14000297b
   14000297a:	90                   	nop
   14000297b:	48 83 c4 30          	add    rsp,0x30
   14000297f:	5d                   	pop    rbp
   140002980:	c3                   	ret
   140002981:	55                   	push   rbp
   140002982:	48 89 e5             	mov    rbp,rsp
   140002985:	48 83 ec 30          	sub    rsp,0x30
   140002989:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000298d:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140002990:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140002994:	83 7d 18 03          	cmp    DWORD PTR [rbp+0x18],0x3
   140002998:	0f 84 cc 00 00 00    	je     0x140002a6a
   14000299e:	83 7d 18 03          	cmp    DWORD PTR [rbp+0x18],0x3
   1400029a2:	0f 87 ca 00 00 00    	ja     0x140002a72
   1400029a8:	83 7d 18 02          	cmp    DWORD PTR [rbp+0x18],0x2
   1400029ac:	0f 84 b1 00 00 00    	je     0x140002a63
   1400029b2:	83 7d 18 02          	cmp    DWORD PTR [rbp+0x18],0x2
   1400029b6:	0f 87 b6 00 00 00    	ja     0x140002a72
   1400029bc:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   1400029c0:	74 33                	je     0x1400029f5
   1400029c2:	83 7d 18 01          	cmp    DWORD PTR [rbp+0x18],0x1
   1400029c6:	0f 85 a6 00 00 00    	jne    0x140002a72
   1400029cc:	8b 05 76 d7 00 00    	mov    eax,DWORD PTR [rip+0xd776]        # 0x140010148
   1400029d2:	85 c0                	test   eax,eax
   1400029d4:	75 13                	jne    0x1400029e9
   1400029d6:	48 8d 05 43 d7 00 00 	lea    rax,[rip+0xd743]        # 0x140010120
   1400029dd:	48 89 c1             	mov    rcx,rax
   1400029e0:	48 8b 05 71 e8 00 00 	mov    rax,QWORD PTR [rip+0xe871]        # 0x140011258
   1400029e7:	ff d0                	call   rax
   1400029e9:	c7 05 55 d7 00 00 01 	mov    DWORD PTR [rip+0xd755],0x1        # 0x140010148
   1400029f0:	00 00 00 
   1400029f3:	eb 7d                	jmp    0x140002a72
   1400029f5:	e8 e8 fe ff ff       	call   0x1400028e2
   1400029fa:	8b 05 48 d7 00 00    	mov    eax,DWORD PTR [rip+0xd748]        # 0x140010148
   140002a00:	83 f8 01             	cmp    eax,0x1
   140002a03:	75 6c                	jne    0x140002a71
   140002a05:	48 8b 05 44 d7 00 00 	mov    rax,QWORD PTR [rip+0xd744]        # 0x140010150
   140002a0c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002a10:	eb 20                	jmp    0x140002a32
   140002a12:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002a16:	48 8b 40 10          	mov    rax,QWORD PTR [rax+0x10]
   140002a1a:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002a1e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002a22:	48 89 c1             	mov    rcx,rax
   140002a25:	e8 e6 6c 00 00       	call   0x140009710
   140002a2a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002a2e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002a32:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002a37:	75 d9                	jne    0x140002a12
   140002a39:	48 c7 05 0c d7 00 00 	mov    QWORD PTR [rip+0xd70c],0x0        # 0x140010150
   140002a40:	00 00 00 00 
   140002a44:	c7 05 fa d6 00 00 00 	mov    DWORD PTR [rip+0xd6fa],0x0        # 0x140010148
   140002a4b:	00 00 00 
   140002a4e:	48 8d 05 cb d6 00 00 	lea    rax,[rip+0xd6cb]        # 0x140010120
   140002a55:	48 89 c1             	mov    rcx,rax
   140002a58:	48 8b 05 c9 e7 00 00 	mov    rax,QWORD PTR [rip+0xe7c9]        # 0x140011228
   140002a5f:	ff d0                	call   rax
   140002a61:	eb 0e                	jmp    0x140002a71
   140002a63:	e8 18 00 00 00       	call   0x140002a80
   140002a68:	eb 08                	jmp    0x140002a72
   140002a6a:	e8 73 fe ff ff       	call   0x1400028e2
   140002a6f:	eb 01                	jmp    0x140002a72
   140002a71:	90                   	nop
   140002a72:	b8 01 00 00 00       	mov    eax,0x1
   140002a77:	48 83 c4 30          	add    rsp,0x30
   140002a7b:	5d                   	pop    rbp
   140002a7c:	c3                   	ret
   140002a7d:	90                   	nop
   140002a7e:	90                   	nop
   140002a7f:	90                   	nop
   140002a80:	55                   	push   rbp
   140002a81:	48 89 e5             	mov    rbp,rsp
   140002a84:	db e3                	fninit
   140002a86:	90                   	nop
   140002a87:	5d                   	pop    rbp
   140002a88:	c3                   	ret
   140002a89:	90                   	nop
   140002a8a:	90                   	nop
   140002a8b:	90                   	nop
   140002a8c:	90                   	nop
   140002a8d:	90                   	nop
   140002a8e:	90                   	nop
   140002a8f:	90                   	nop
   140002a90:	55                   	push   rbp
   140002a91:	48 89 e5             	mov    rbp,rsp
   140002a94:	48 83 ec 20          	sub    rsp,0x20
   140002a98:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002a9c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002aa0:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002aa4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002aa8:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140002aab:	66 3d 4d 5a          	cmp    ax,0x5a4d
   140002aaf:	74 07                	je     0x140002ab8
   140002ab1:	b8 00 00 00 00       	mov    eax,0x0
   140002ab6:	eb 4e                	jmp    0x140002b06
   140002ab8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002abc:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002abf:	48 63 d0             	movsxd rdx,eax
   140002ac2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002ac6:	48 01 d0             	add    rax,rdx
   140002ac9:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002acd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002ad1:	8b 00                	mov    eax,DWORD PTR [rax]
   140002ad3:	3d 50 45 00 00       	cmp    eax,0x4550
   140002ad8:	74 07                	je     0x140002ae1
   140002ada:	b8 00 00 00 00       	mov    eax,0x0
   140002adf:	eb 25                	jmp    0x140002b06
   140002ae1:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002ae5:	48 83 c0 18          	add    rax,0x18
   140002ae9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002aed:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002af1:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140002af4:	66 3d 0b 02          	cmp    ax,0x20b
   140002af8:	74 07                	je     0x140002b01
   140002afa:	b8 00 00 00 00       	mov    eax,0x0
   140002aff:	eb 05                	jmp    0x140002b06
   140002b01:	b8 01 00 00 00       	mov    eax,0x1
   140002b06:	48 83 c4 20          	add    rsp,0x20
   140002b0a:	5d                   	pop    rbp
   140002b0b:	c3                   	ret
   140002b0c:	55                   	push   rbp
   140002b0d:	48 89 e5             	mov    rbp,rsp
   140002b10:	48 83 ec 20          	sub    rsp,0x20
   140002b14:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002b18:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140002b1c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002b20:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002b23:	48 63 d0             	movsxd rdx,eax
   140002b26:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002b2a:	48 01 d0             	add    rax,rdx
   140002b2d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002b31:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140002b38:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002b3c:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
   140002b40:	0f b7 d0             	movzx  edx,ax
   140002b43:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002b47:	48 01 d0             	add    rax,rdx
   140002b4a:	48 83 c0 18          	add    rax,0x18
   140002b4e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002b52:	eb 36                	jmp    0x140002b8a
   140002b54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b58:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140002b5b:	89 c0                	mov    eax,eax
   140002b5d:	48 39 45 18          	cmp    QWORD PTR [rbp+0x18],rax
   140002b61:	72 1e                	jb     0x140002b81
   140002b63:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b67:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140002b6a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b6e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140002b71:	01 d0                	add    eax,edx
   140002b73:	89 c0                	mov    eax,eax
   140002b75:	48 39 45 18          	cmp    QWORD PTR [rbp+0x18],rax
   140002b79:	73 06                	jae    0x140002b81
   140002b7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002b7f:	eb 1e                	jmp    0x140002b9f
   140002b81:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140002b85:	48 83 45 f8 28       	add    QWORD PTR [rbp-0x8],0x28
   140002b8a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002b8e:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002b92:	0f b7 c0             	movzx  eax,ax
   140002b95:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140002b98:	72 ba                	jb     0x140002b54
   140002b9a:	b8 00 00 00 00       	mov    eax,0x0
   140002b9f:	48 83 c4 20          	add    rsp,0x20
   140002ba3:	5d                   	pop    rbp
   140002ba4:	c3                   	ret
   140002ba5:	55                   	push   rbp
   140002ba6:	48 89 e5             	mov    rbp,rsp
   140002ba9:	48 83 ec 40          	sub    rsp,0x40
   140002bad:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002bb1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002bb5:	48 89 c1             	mov    rcx,rax
   140002bb8:	e8 ab 6b 00 00       	call   0x140009768
   140002bbd:	48 83 f8 08          	cmp    rax,0x8
   140002bc1:	76 0a                	jbe    0x140002bcd
   140002bc3:	b8 00 00 00 00       	mov    eax,0x0
   140002bc8:	e9 98 00 00 00       	jmp    0x140002c65
   140002bcd:	48 8b 05 7c 8b 00 00 	mov    rax,QWORD PTR [rip+0x8b7c]        # 0x14000b750
   140002bd4:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002bd8:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002bdc:	48 89 c1             	mov    rcx,rax
   140002bdf:	e8 ac fe ff ff       	call   0x140002a90
   140002be4:	85 c0                	test   eax,eax
   140002be6:	75 07                	jne    0x140002bef
   140002be8:	b8 00 00 00 00       	mov    eax,0x0
   140002bed:	eb 76                	jmp    0x140002c65
   140002bef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002bf3:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002bf6:	48 63 d0             	movsxd rdx,eax
   140002bf9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002bfd:	48 01 d0             	add    rax,rdx
   140002c00:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002c04:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140002c0b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002c0f:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
   140002c13:	0f b7 d0             	movzx  edx,ax
   140002c16:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002c1a:	48 01 d0             	add    rax,rdx
   140002c1d:	48 83 c0 18          	add    rax,0x18
   140002c21:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002c25:	eb 29                	jmp    0x140002c50
   140002c27:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002c2b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140002c2f:	41 b8 08 00 00 00    	mov    r8d,0x8
   140002c35:	48 89 c1             	mov    rcx,rax
   140002c38:	e8 33 6b 00 00       	call   0x140009770
   140002c3d:	85 c0                	test   eax,eax
   140002c3f:	75 06                	jne    0x140002c47
   140002c41:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002c45:	eb 1e                	jmp    0x140002c65
   140002c47:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140002c4b:	48 83 45 f8 28       	add    QWORD PTR [rbp-0x8],0x28
   140002c50:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002c54:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002c58:	0f b7 c0             	movzx  eax,ax
   140002c5b:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140002c5e:	72 c7                	jb     0x140002c27
   140002c60:	b8 00 00 00 00       	mov    eax,0x0
   140002c65:	48 83 c4 40          	add    rsp,0x40
   140002c69:	5d                   	pop    rbp
   140002c6a:	c3                   	ret
   140002c6b:	55                   	push   rbp
   140002c6c:	48 89 e5             	mov    rbp,rsp
   140002c6f:	48 83 ec 30          	sub    rsp,0x30
   140002c73:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002c77:	48 8b 05 d2 8a 00 00 	mov    rax,QWORD PTR [rip+0x8ad2]        # 0x14000b750
   140002c7e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002c82:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002c86:	48 89 c1             	mov    rcx,rax
   140002c89:	e8 02 fe ff ff       	call   0x140002a90
   140002c8e:	85 c0                	test   eax,eax
   140002c90:	75 07                	jne    0x140002c99
   140002c92:	b8 00 00 00 00       	mov    eax,0x0
   140002c97:	eb 1c                	jmp    0x140002cb5
   140002c99:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002c9d:	48 2b 45 f8          	sub    rax,QWORD PTR [rbp-0x8]
   140002ca1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002ca5:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140002ca9:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002cad:	48 89 c1             	mov    rcx,rax
   140002cb0:	e8 57 fe ff ff       	call   0x140002b0c
   140002cb5:	48 83 c4 30          	add    rsp,0x30
   140002cb9:	5d                   	pop    rbp
   140002cba:	c3                   	ret
   140002cbb:	55                   	push   rbp
   140002cbc:	48 89 e5             	mov    rbp,rsp
   140002cbf:	48 83 ec 30          	sub    rsp,0x30
   140002cc3:	48 8b 05 86 8a 00 00 	mov    rax,QWORD PTR [rip+0x8a86]        # 0x14000b750
   140002cca:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002cce:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002cd2:	48 89 c1             	mov    rcx,rax
   140002cd5:	e8 b6 fd ff ff       	call   0x140002a90
   140002cda:	85 c0                	test   eax,eax
   140002cdc:	75 07                	jne    0x140002ce5
   140002cde:	b8 00 00 00 00       	mov    eax,0x0
   140002ce3:	eb 20                	jmp    0x140002d05
   140002ce5:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002ce9:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002cec:	48 63 d0             	movsxd rdx,eax
   140002cef:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002cf3:	48 01 d0             	add    rax,rdx
   140002cf6:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002cfa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002cfe:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002d02:	0f b7 c0             	movzx  eax,ax
   140002d05:	48 83 c4 30          	add    rsp,0x30
   140002d09:	5d                   	pop    rbp
   140002d0a:	c3                   	ret
   140002d0b:	55                   	push   rbp
   140002d0c:	48 89 e5             	mov    rbp,rsp
   140002d0f:	48 83 ec 40          	sub    rsp,0x40
   140002d13:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002d17:	48 8b 05 32 8a 00 00 	mov    rax,QWORD PTR [rip+0x8a32]        # 0x14000b750
   140002d1e:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002d22:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002d26:	48 89 c1             	mov    rcx,rax
   140002d29:	e8 62 fd ff ff       	call   0x140002a90
   140002d2e:	85 c0                	test   eax,eax
   140002d30:	75 07                	jne    0x140002d39
   140002d32:	b8 00 00 00 00       	mov    eax,0x0
   140002d37:	eb 78                	jmp    0x140002db1
   140002d39:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002d3d:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002d40:	48 63 d0             	movsxd rdx,eax
   140002d43:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002d47:	48 01 d0             	add    rax,rdx
   140002d4a:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140002d4e:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140002d55:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002d59:	0f b7 40 14          	movzx  eax,WORD PTR [rax+0x14]
   140002d5d:	0f b7 d0             	movzx  edx,ax
   140002d60:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002d64:	48 01 d0             	add    rax,rdx
   140002d67:	48 83 c0 18          	add    rax,0x18
   140002d6b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002d6f:	eb 2b                	jmp    0x140002d9c
   140002d71:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002d75:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   140002d78:	25 00 00 00 20       	and    eax,0x20000000
   140002d7d:	85 c0                	test   eax,eax
   140002d7f:	74 12                	je     0x140002d93
   140002d81:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   140002d86:	75 06                	jne    0x140002d8e
   140002d88:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002d8c:	eb 23                	jmp    0x140002db1
   140002d8e:	48 83 6d 10 01       	sub    QWORD PTR [rbp+0x10],0x1
   140002d93:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140002d97:	48 83 45 f8 28       	add    QWORD PTR [rbp-0x8],0x28
   140002d9c:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140002da0:	0f b7 40 06          	movzx  eax,WORD PTR [rax+0x6]
   140002da4:	0f b7 c0             	movzx  eax,ax
   140002da7:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140002daa:	72 c5                	jb     0x140002d71
   140002dac:	b8 00 00 00 00       	mov    eax,0x0
   140002db1:	48 83 c4 40          	add    rsp,0x40
   140002db5:	5d                   	pop    rbp
   140002db6:	c3                   	ret
   140002db7:	55                   	push   rbp
   140002db8:	48 89 e5             	mov    rbp,rsp
   140002dbb:	48 83 ec 30          	sub    rsp,0x30
   140002dbf:	48 8b 05 8a 89 00 00 	mov    rax,QWORD PTR [rip+0x898a]        # 0x14000b750
   140002dc6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002dca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002dce:	48 89 c1             	mov    rcx,rax
   140002dd1:	e8 ba fc ff ff       	call   0x140002a90
   140002dd6:	85 c0                	test   eax,eax
   140002dd8:	75 07                	jne    0x140002de1
   140002dda:	b8 00 00 00 00       	mov    eax,0x0
   140002ddf:	eb 04                	jmp    0x140002de5
   140002de1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002de5:	48 83 c4 30          	add    rsp,0x30
   140002de9:	5d                   	pop    rbp
   140002dea:	c3                   	ret
   140002deb:	55                   	push   rbp
   140002dec:	48 89 e5             	mov    rbp,rsp
   140002def:	48 83 ec 40          	sub    rsp,0x40
   140002df3:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140002df7:	48 8b 05 52 89 00 00 	mov    rax,QWORD PTR [rip+0x8952]        # 0x14000b750
   140002dfe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002e02:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002e06:	48 89 c1             	mov    rcx,rax
   140002e09:	e8 82 fc ff ff       	call   0x140002a90
   140002e0e:	85 c0                	test   eax,eax
   140002e10:	75 07                	jne    0x140002e19
   140002e12:	b8 00 00 00 00       	mov    eax,0x0
   140002e17:	eb 3d                	jmp    0x140002e56
   140002e19:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140002e1d:	48 2b 45 f8          	sub    rax,QWORD PTR [rbp-0x8]
   140002e21:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002e25:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140002e29:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002e2d:	48 89 c1             	mov    rcx,rax
   140002e30:	e8 d7 fc ff ff       	call   0x140002b0c
   140002e35:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002e39:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
   140002e3e:	75 07                	jne    0x140002e47
   140002e40:	b8 00 00 00 00       	mov    eax,0x0
   140002e45:	eb 0f                	jmp    0x140002e56
   140002e47:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002e4b:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   140002e4e:	f7 d0                	not    eax
   140002e50:	c1 e8 1f             	shr    eax,0x1f
   140002e53:	0f b6 c0             	movzx  eax,al
   140002e56:	48 83 c4 40          	add    rsp,0x40
   140002e5a:	5d                   	pop    rbp
   140002e5b:	c3                   	ret
   140002e5c:	55                   	push   rbp
   140002e5d:	48 89 e5             	mov    rbp,rsp
   140002e60:	48 83 ec 50          	sub    rsp,0x50
   140002e64:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140002e67:	48 8b 05 e2 88 00 00 	mov    rax,QWORD PTR [rip+0x88e2]        # 0x14000b750
   140002e6e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140002e72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002e76:	48 89 c1             	mov    rcx,rax
   140002e79:	e8 12 fc ff ff       	call   0x140002a90
   140002e7e:	85 c0                	test   eax,eax
   140002e80:	75 0a                	jne    0x140002e8c
   140002e82:	b8 00 00 00 00       	mov    eax,0x0
   140002e87:	e9 ab 00 00 00       	jmp    0x140002f37
   140002e8c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002e90:	8b 40 3c             	mov    eax,DWORD PTR [rax+0x3c]
   140002e93:	48 63 d0             	movsxd rdx,eax
   140002e96:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002e9a:	48 01 d0             	add    rax,rdx
   140002e9d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140002ea1:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140002ea5:	8b 80 90 00 00 00    	mov    eax,DWORD PTR [rax+0x90]
   140002eab:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140002eae:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   140002eb2:	75 07                	jne    0x140002ebb
   140002eb4:	b8 00 00 00 00       	mov    eax,0x0
   140002eb9:	eb 7c                	jmp    0x140002f37
   140002ebb:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
   140002ebe:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002ec2:	48 89 c1             	mov    rcx,rax
   140002ec5:	e8 42 fc ff ff       	call   0x140002b0c
   140002eca:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140002ece:	48 83 7d d8 00       	cmp    QWORD PTR [rbp-0x28],0x0
   140002ed3:	75 07                	jne    0x140002edc
   140002ed5:	b8 00 00 00 00       	mov    eax,0x0
   140002eda:	eb 5b                	jmp    0x140002f37
   140002edc:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
   140002edf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002ee3:	48 01 d0             	add    rax,rdx
   140002ee6:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002eea:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140002eef:	75 07                	jne    0x140002ef8
   140002ef1:	b8 00 00 00 00       	mov    eax,0x0
   140002ef6:	eb 3f                	jmp    0x140002f37
   140002ef8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002efc:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140002eff:	85 c0                	test   eax,eax
   140002f01:	75 0b                	jne    0x140002f0e
   140002f03:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002f07:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140002f0a:	85 c0                	test   eax,eax
   140002f0c:	74 23                	je     0x140002f31
   140002f0e:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
   140002f12:	7f 12                	jg     0x140002f26
   140002f14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140002f18:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140002f1b:	89 c2                	mov    edx,eax
   140002f1d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140002f21:	48 01 d0             	add    rax,rdx
   140002f24:	eb 11                	jmp    0x140002f37
   140002f26:	83 6d 10 01          	sub    DWORD PTR [rbp+0x10],0x1
   140002f2a:	48 83 45 f8 14       	add    QWORD PTR [rbp-0x8],0x14
   140002f2f:	eb c7                	jmp    0x140002ef8
   140002f31:	90                   	nop
   140002f32:	b8 00 00 00 00       	mov    eax,0x0
   140002f37:	48 83 c4 50          	add    rsp,0x50
   140002f3b:	5d                   	pop    rbp
   140002f3c:	c3                   	ret
   140002f3d:	90                   	nop
   140002f3e:	90                   	nop
   140002f3f:	90                   	nop
   140002f40:	51                   	push   rcx
   140002f41:	50                   	push   rax
   140002f42:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002f48:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   140002f4d:	72 19                	jb     0x140002f68
   140002f4f:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   140002f56:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002f5a:	48 2d 00 10 00 00    	sub    rax,0x1000
   140002f60:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140002f66:	77 e7                	ja     0x140002f4f
   140002f68:	48 29 c1             	sub    rcx,rax
   140002f6b:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140002f6f:	58                   	pop    rax
   140002f70:	59                   	pop    rcx
   140002f71:	c3                   	ret
   140002f72:	90                   	nop
   140002f73:	90                   	nop
   140002f74:	90                   	nop
   140002f75:	90                   	nop
   140002f76:	90                   	nop
   140002f77:	90                   	nop
   140002f78:	90                   	nop
   140002f79:	90                   	nop
   140002f7a:	90                   	nop
   140002f7b:	90                   	nop
   140002f7c:	90                   	nop
   140002f7d:	90                   	nop
   140002f7e:	90                   	nop
   140002f7f:	90                   	nop
   140002f80:	55                   	push   rbp
   140002f81:	53                   	push   rbx
   140002f82:	48 83 ec 48          	sub    rsp,0x48
   140002f86:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140002f8b:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140002f8f:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140002f93:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140002f97:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140002f9b:	48 8d 45 30          	lea    rax,[rbp+0x30]
   140002f9f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140002fa3:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002fa7:	48 89 c1             	mov    rcx,rax
   140002faa:	e8 f1 64 00 00       	call   0x1400094a0
   140002faf:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140002fb3:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   140002fb7:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002fbb:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140002fc0:	49 89 c9             	mov    r9,rcx
   140002fc3:	41 b8 00 00 00 00    	mov    r8d,0x0
   140002fc9:	48 89 c2             	mov    rdx,rax
   140002fcc:	b9 00 60 00 00       	mov    ecx,0x6000
   140002fd1:	e8 95 1f 00 00       	call   0x140004f6b
   140002fd6:	89 c3                	mov    ebx,eax
   140002fd8:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140002fdc:	48 89 c1             	mov    rcx,rax
   140002fdf:	e8 46 65 00 00       	call   0x14000952a
   140002fe4:	89 d8                	mov    eax,ebx
   140002fe6:	48 83 c4 48          	add    rsp,0x48
   140002fea:	5b                   	pop    rbx
   140002feb:	5d                   	pop    rbp
   140002fec:	c3                   	ret
   140002fed:	90                   	nop
   140002fee:	90                   	nop
   140002fef:	90                   	nop
   140002ff0:	55                   	push   rbp
   140002ff1:	48 89 e5             	mov    rbp,rsp
   140002ff4:	48 83 ec 20          	sub    rsp,0x20
   140002ff8:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140002ffb:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140002fff:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003003:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003006:	25 00 40 00 00       	and    eax,0x4000
   14000300b:	85 c0                	test   eax,eax
   14000300d:	75 12                	jne    0x140003021
   14000300f:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003013:	8b 50 28             	mov    edx,DWORD PTR [rax+0x28]
   140003016:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000301a:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   14000301d:	39 c2                	cmp    edx,eax
   14000301f:	7e 3b                	jle    0x14000305c
   140003021:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003025:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003028:	25 00 20 00 00       	and    eax,0x2000
   14000302d:	85 c0                	test   eax,eax
   14000302f:	74 13                	je     0x140003044
   140003031:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003035:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140003038:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   14000303b:	89 c1                	mov    ecx,eax
   14000303d:	e8 be 66 00 00       	call   0x140009700
   140003042:	eb 18                	jmp    0x14000305c
   140003044:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003048:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14000304b:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000304f:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   140003052:	48 98                	cdqe
   140003054:	48 01 d0             	add    rax,rdx
   140003057:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   14000305a:	88 10                	mov    BYTE PTR [rax],dl
   14000305c:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003060:	8b 40 24             	mov    eax,DWORD PTR [rax+0x24]
   140003063:	8d 50 01             	lea    edx,[rax+0x1]
   140003066:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000306a:	89 50 24             	mov    DWORD PTR [rax+0x24],edx
   14000306d:	90                   	nop
   14000306e:	48 83 c4 20          	add    rsp,0x20
   140003072:	5d                   	pop    rbp
   140003073:	c3                   	ret
   140003074:	55                   	push   rbp
   140003075:	48 89 e5             	mov    rbp,rsp
   140003078:	48 83 ec 20          	sub    rsp,0x20
   14000307c:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140003080:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140003083:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140003087:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000308b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000308e:	85 c0                	test   eax,eax
   140003090:	78 16                	js     0x1400030a8
   140003092:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003096:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003099:	39 45 18             	cmp    DWORD PTR [rbp+0x18],eax
   14000309c:	7e 0a                	jle    0x1400030a8
   14000309e:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030a2:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400030a5:	89 45 18             	mov    DWORD PTR [rbp+0x18],eax
   1400030a8:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030ac:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400030af:	39 45 18             	cmp    DWORD PTR [rbp+0x18],eax
   1400030b2:	7d 15                	jge    0x1400030c9
   1400030b4:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030b8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400030bb:	2b 45 18             	sub    eax,DWORD PTR [rbp+0x18]
   1400030be:	89 c2                	mov    edx,eax
   1400030c0:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030c4:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   1400030c7:	eb 0b                	jmp    0x1400030d4
   1400030c9:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030cd:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   1400030d4:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030d8:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400030db:	85 c0                	test   eax,eax
   1400030dd:	7e 57                	jle    0x140003136
   1400030df:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030e3:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400030e6:	25 00 04 00 00       	and    eax,0x400
   1400030eb:	85 c0                	test   eax,eax
   1400030ed:	75 47                	jne    0x140003136
   1400030ef:	eb 11                	jmp    0x140003102
   1400030f1:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400030f5:	48 89 c2             	mov    rdx,rax
   1400030f8:	b9 20 00 00 00       	mov    ecx,0x20
   1400030fd:	e8 ee fe ff ff       	call   0x140002ff0
   140003102:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003106:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003109:	8d 48 ff             	lea    ecx,[rax-0x1]
   14000310c:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140003110:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140003113:	85 c0                	test   eax,eax
   140003115:	75 da                	jne    0x1400030f1
   140003117:	eb 1d                	jmp    0x140003136
   140003119:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000311d:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003121:	48 89 55 10          	mov    QWORD PTR [rbp+0x10],rdx
   140003125:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140003128:	0f be c0             	movsx  eax,al
   14000312b:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   14000312f:	89 c1                	mov    ecx,eax
   140003131:	e8 ba fe ff ff       	call   0x140002ff0
   140003136:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140003139:	8d 50 ff             	lea    edx,[rax-0x1]
   14000313c:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   14000313f:	85 c0                	test   eax,eax
   140003141:	75 d6                	jne    0x140003119
   140003143:	eb 11                	jmp    0x140003156
   140003145:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003149:	48 89 c2             	mov    rdx,rax
   14000314c:	b9 20 00 00 00       	mov    ecx,0x20
   140003151:	e8 9a fe ff ff       	call   0x140002ff0
   140003156:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000315a:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000315d:	8d 48 ff             	lea    ecx,[rax-0x1]
   140003160:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140003164:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140003167:	85 c0                	test   eax,eax
   140003169:	7f da                	jg     0x140003145
   14000316b:	90                   	nop
   14000316c:	90                   	nop
   14000316d:	48 83 c4 20          	add    rsp,0x20
   140003171:	5d                   	pop    rbp
   140003172:	c3                   	ret
   140003173:	55                   	push   rbp
   140003174:	48 89 e5             	mov    rbp,rsp
   140003177:	48 83 ec 20          	sub    rsp,0x20
   14000317b:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000317f:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003183:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   140003188:	75 0b                	jne    0x140003195
   14000318a:	48 8d 05 9f 83 00 00 	lea    rax,[rip+0x839f]        # 0x14000b530
   140003191:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140003195:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003199:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000319c:	85 c0                	test   eax,eax
   14000319e:	78 2f                	js     0x1400031cf
   1400031a0:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400031a4:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400031a7:	48 63 d0             	movsxd rdx,eax
   1400031aa:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400031ae:	48 89 c1             	mov    rcx,rax
   1400031b1:	e8 ea 5d 00 00       	call   0x140008fa0
   1400031b6:	89 c1                	mov    ecx,eax
   1400031b8:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400031bc:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400031c0:	49 89 d0             	mov    r8,rdx
   1400031c3:	89 ca                	mov    edx,ecx
   1400031c5:	48 89 c1             	mov    rcx,rax
   1400031c8:	e8 a7 fe ff ff       	call   0x140003074
   1400031cd:	eb 23                	jmp    0x1400031f2
   1400031cf:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400031d3:	48 89 c1             	mov    rcx,rax
   1400031d6:	e8 8d 65 00 00       	call   0x140009768
   1400031db:	89 c1                	mov    ecx,eax
   1400031dd:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400031e1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400031e5:	49 89 d0             	mov    r8,rdx
   1400031e8:	89 ca                	mov    edx,ecx
   1400031ea:	48 89 c1             	mov    rcx,rax
   1400031ed:	e8 82 fe ff ff       	call   0x140003074
   1400031f2:	90                   	nop
   1400031f3:	48 83 c4 20          	add    rsp,0x20
   1400031f7:	5d                   	pop    rbp
   1400031f8:	c3                   	ret
   1400031f9:	55                   	push   rbp
   1400031fa:	48 89 e5             	mov    rbp,rsp
   1400031fd:	48 83 ec 50          	sub    rsp,0x50
   140003201:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140003205:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140003208:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   14000320c:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   140003210:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140003214:	49 89 d0             	mov    r8,rdx
   140003217:	ba 00 00 00 00       	mov    edx,0x0
   14000321c:	48 89 c1             	mov    rcx,rax
   14000321f:	e8 ac 5b 00 00       	call   0x140008dd0
   140003224:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003227:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000322b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000322e:	85 c0                	test   eax,eax
   140003230:	78 16                	js     0x140003248
   140003232:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003236:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003239:	39 45 18             	cmp    DWORD PTR [rbp+0x18],eax
   14000323c:	7e 0a                	jle    0x140003248
   14000323e:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003242:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003245:	89 45 18             	mov    DWORD PTR [rbp+0x18],eax
   140003248:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000324c:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000324f:	39 45 18             	cmp    DWORD PTR [rbp+0x18],eax
   140003252:	7d 15                	jge    0x140003269
   140003254:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003258:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000325b:	2b 45 18             	sub    eax,DWORD PTR [rbp+0x18]
   14000325e:	89 c2                	mov    edx,eax
   140003260:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003264:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140003267:	eb 0b                	jmp    0x140003274
   140003269:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000326d:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   140003274:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003278:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000327b:	85 c0                	test   eax,eax
   14000327d:	7e 6e                	jle    0x1400032ed
   14000327f:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003283:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003286:	25 00 04 00 00       	and    eax,0x400
   14000328b:	85 c0                	test   eax,eax
   14000328d:	75 5e                	jne    0x1400032ed
   14000328f:	eb 11                	jmp    0x1400032a2
   140003291:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003295:	48 89 c2             	mov    rdx,rax
   140003298:	b9 20 00 00 00       	mov    ecx,0x20
   14000329d:	e8 4e fd ff ff       	call   0x140002ff0
   1400032a2:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400032a6:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400032a9:	8d 48 ff             	lea    ecx,[rax-0x1]
   1400032ac:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   1400032b0:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   1400032b3:	85 c0                	test   eax,eax
   1400032b5:	75 da                	jne    0x140003291
   1400032b7:	eb 34                	jmp    0x1400032ed
   1400032b9:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   1400032bd:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400032c1:	eb 1d                	jmp    0x1400032e0
   1400032c3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400032c7:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400032cb:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   1400032cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400032d2:	0f be c0             	movsx  eax,al
   1400032d5:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   1400032d9:	89 c1                	mov    ecx,eax
   1400032db:	e8 10 fd ff ff       	call   0x140002ff0
   1400032e0:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400032e3:	8d 50 ff             	lea    edx,[rax-0x1]
   1400032e6:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   1400032e9:	85 c0                	test   eax,eax
   1400032eb:	7f d6                	jg     0x1400032c3
   1400032ed:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   1400032f0:	8d 50 ff             	lea    edx,[rax-0x1]
   1400032f3:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400032f6:	85 c0                	test   eax,eax
   1400032f8:	7e 41                	jle    0x14000333b
   1400032fa:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400032fe:	48 8d 50 02          	lea    rdx,[rax+0x2]
   140003302:	48 89 55 10          	mov    QWORD PTR [rbp+0x10],rdx
   140003306:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140003309:	0f b7 d0             	movzx  edx,ax
   14000330c:	48 8d 4d d8          	lea    rcx,[rbp-0x28]
   140003310:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140003314:	49 89 c8             	mov    r8,rcx
   140003317:	48 89 c1             	mov    rcx,rax
   14000331a:	e8 b1 5a 00 00       	call   0x140008dd0
   14000331f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003322:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140003326:	7f 91                	jg     0x1400032b9
   140003328:	eb 11                	jmp    0x14000333b
   14000332a:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000332e:	48 89 c2             	mov    rdx,rax
   140003331:	b9 20 00 00 00       	mov    ecx,0x20
   140003336:	e8 b5 fc ff ff       	call   0x140002ff0
   14000333b:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000333f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003342:	8d 48 ff             	lea    ecx,[rax-0x1]
   140003345:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140003349:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   14000334c:	85 c0                	test   eax,eax
   14000334e:	7f da                	jg     0x14000332a
   140003350:	90                   	nop
   140003351:	90                   	nop
   140003352:	48 83 c4 50          	add    rsp,0x50
   140003356:	5d                   	pop    rbp
   140003357:	c3                   	ret
   140003358:	55                   	push   rbp
   140003359:	48 89 e5             	mov    rbp,rsp
   14000335c:	48 83 ec 20          	sub    rsp,0x20
   140003360:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140003364:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003368:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   14000336d:	75 0b                	jne    0x14000337a
   14000336f:	48 8d 05 c2 81 00 00 	lea    rax,[rip+0x81c2]        # 0x14000b538
   140003376:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   14000337a:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000337e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003381:	85 c0                	test   eax,eax
   140003383:	78 2f                	js     0x1400033b4
   140003385:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003389:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000338c:	48 63 d0             	movsxd rdx,eax
   14000338f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140003393:	48 89 c1             	mov    rcx,rax
   140003396:	e8 25 59 00 00       	call   0x140008cc0
   14000339b:	89 c1                	mov    ecx,eax
   14000339d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400033a1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400033a5:	49 89 d0             	mov    r8,rdx
   1400033a8:	89 ca                	mov    edx,ecx
   1400033aa:	48 89 c1             	mov    rcx,rax
   1400033ad:	e8 47 fe ff ff       	call   0x1400031f9
   1400033b2:	eb 23                	jmp    0x1400033d7
   1400033b4:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400033b8:	48 89 c1             	mov    rcx,rax
   1400033bb:	e8 c0 63 00 00       	call   0x140009780
   1400033c0:	89 c1                	mov    ecx,eax
   1400033c2:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400033c6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400033ca:	49 89 d0             	mov    r8,rdx
   1400033cd:	89 ca                	mov    edx,ecx
   1400033cf:	48 89 c1             	mov    rcx,rax
   1400033d2:	e8 22 fe ff ff       	call   0x1400031f9
   1400033d7:	90                   	nop
   1400033d8:	48 83 c4 20          	add    rsp,0x20
   1400033dc:	5d                   	pop    rbp
   1400033dd:	c3                   	ret
   1400033de:	55                   	push   rbp
   1400033df:	48 89 e5             	mov    rbp,rsp
   1400033e2:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   1400033e5:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400033e8:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   1400033ec:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   1400033ef:	83 e8 01             	sub    eax,0x1
   1400033f2:	48 98                	cdqe
   1400033f4:	48 83 c0 40          	add    rax,0x40
   1400033f8:	8b 55 18             	mov    edx,DWORD PTR [rbp+0x18]
   1400033fb:	48 63 ca             	movsxd rcx,edx
   1400033fe:	ba 00 00 00 00       	mov    edx,0x0
   140003403:	48 f7 f1             	div    rcx
   140003406:	89 c2                	mov    edx,eax
   140003408:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   14000340b:	01 d0                	add    eax,edx
   14000340d:	89 45 18             	mov    DWORD PTR [rbp+0x18],eax
   140003410:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003414:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003417:	ba 00 00 00 00       	mov    edx,0x0
   14000341c:	85 c0                	test   eax,eax
   14000341e:	0f 48 c2             	cmovs  eax,edx
   140003421:	01 45 18             	add    DWORD PTR [rbp+0x18],eax
   140003424:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003428:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000342b:	25 00 10 00 00       	and    eax,0x1000
   140003430:	85 c0                	test   eax,eax
   140003432:	74 29                	je     0x14000345d
   140003434:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003438:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
   14000343c:	66 85 c0             	test   ax,ax
   14000343f:	74 1c                	je     0x14000345d
   140003441:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140003444:	48 63 d0             	movsxd rdx,eax
   140003447:	48 69 d2 56 55 55 55 	imul   rdx,rdx,0x55555556
   14000344e:	48 89 d1             	mov    rcx,rdx
   140003451:	48 c1 e9 20          	shr    rcx,0x20
   140003455:	99                   	cdq
   140003456:	89 c8                	mov    eax,ecx
   140003458:	29 d0                	sub    eax,edx
   14000345a:	01 45 18             	add    DWORD PTR [rbp+0x18],eax
   14000345d:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003461:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140003464:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140003467:	39 c2                	cmp    edx,eax
   140003469:	0f 4d c2             	cmovge eax,edx
   14000346c:	5d                   	pop    rbp
   14000346d:	c3                   	ret
   14000346e:	55                   	push   rbp
   14000346f:	53                   	push   rbx
   140003470:	48 83 ec 58          	sub    rsp,0x58
   140003474:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   140003479:	48 89 cb             	mov    rbx,rcx
   14000347c:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   14000347f:	48 8b 5b 08          	mov    rbx,QWORD PTR [rbx+0x8]
   140003483:	48 89 4d d0          	mov    QWORD PTR [rbp-0x30],rcx
   140003487:	48 89 5d d8          	mov    QWORD PTR [rbp-0x28],rbx
   14000348b:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   14000348f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003493:	49 89 c0             	mov    r8,rax
   140003496:	ba 03 00 00 00       	mov    edx,0x3
   14000349b:	b9 01 00 00 00       	mov    ecx,0x1
   1400034a0:	e8 39 ff ff ff       	call   0x1400033de
   1400034a5:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
   1400034a8:	48 c7 45 e8 00 00 00 	mov    QWORD PTR [rbp-0x18],0x0
   1400034af:	00 
   1400034b0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400034b3:	48 98                	cdqe
   1400034b5:	48 83 c0 0f          	add    rax,0xf
   1400034b9:	48 c1 e8 04          	shr    rax,0x4
   1400034bd:	48 c1 e0 04          	shl    rax,0x4
   1400034c1:	e8 7a fa ff ff       	call   0x140002f40
   1400034c6:	48 29 c4             	sub    rsp,rax
   1400034c9:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   1400034ce:	48 83 c0 0f          	add    rax,0xf
   1400034d2:	48 c1 e8 04          	shr    rax,0x4
   1400034d6:	48 c1 e0 04          	shl    rax,0x4
   1400034da:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400034de:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400034e2:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400034e6:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400034ea:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400034ed:	25 80 00 00 00       	and    eax,0x80
   1400034f2:	85 c0                	test   eax,eax
   1400034f4:	0f 84 ea 00 00 00    	je     0x1400035e4
   1400034fa:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400034fe:	48 85 c0             	test   rax,rax
   140003501:	79 10                	jns    0x140003513
   140003503:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140003507:	48 f7 d8             	neg    rax
   14000350a:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   14000350e:	e9 d1 00 00 00       	jmp    0x1400035e4
   140003513:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003517:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000351a:	24 7f                	and    al,0x7f
   14000351c:	89 c2                	mov    edx,eax
   14000351e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003522:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140003525:	e9 ba 00 00 00       	jmp    0x1400035e4
   14000352a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000352e:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   140003532:	74 54                	je     0x140003588
   140003534:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003538:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000353b:	25 00 10 00 00       	and    eax,0x1000
   140003540:	85 c0                	test   eax,eax
   140003542:	74 44                	je     0x140003588
   140003544:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003548:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
   14000354c:	66 85 c0             	test   ax,ax
   14000354f:	74 37                	je     0x140003588
   140003551:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140003555:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
   140003559:	48 89 c2             	mov    rdx,rax
   14000355c:	48 89 d0             	mov    rax,rdx
   14000355f:	48 c1 f8 3f          	sar    rax,0x3f
   140003563:	48 c1 e8 3e          	shr    rax,0x3e
   140003567:	48 01 c2             	add    rdx,rax
   14000356a:	83 e2 03             	and    edx,0x3
   14000356d:	48 29 c2             	sub    rdx,rax
   140003570:	48 89 d0             	mov    rax,rdx
   140003573:	48 83 f8 03          	cmp    rax,0x3
   140003577:	75 0f                	jne    0x140003588
   140003579:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000357d:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003581:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140003585:	c6 00 2c             	mov    BYTE PTR [rax],0x2c
   140003588:	48 8b 4d d0          	mov    rcx,QWORD PTR [rbp-0x30]
   14000358c:	48 ba cd cc cc cc cc 	movabs rdx,0xcccccccccccccccd
   140003593:	cc cc cc 
   140003596:	48 89 c8             	mov    rax,rcx
   140003599:	48 f7 e2             	mul    rdx
   14000359c:	48 c1 ea 03          	shr    rdx,0x3
   1400035a0:	48 89 d0             	mov    rax,rdx
   1400035a3:	48 c1 e0 02          	shl    rax,0x2
   1400035a7:	48 01 d0             	add    rax,rdx
   1400035aa:	48 01 c0             	add    rax,rax
   1400035ad:	48 29 c1             	sub    rcx,rax
   1400035b0:	48 89 ca             	mov    rdx,rcx
   1400035b3:	89 d0                	mov    eax,edx
   1400035b5:	8d 48 30             	lea    ecx,[rax+0x30]
   1400035b8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400035bc:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400035c0:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   1400035c4:	89 ca                	mov    edx,ecx
   1400035c6:	88 10                	mov    BYTE PTR [rax],dl
   1400035c8:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400035cc:	48 ba cd cc cc cc cc 	movabs rdx,0xcccccccccccccccd
   1400035d3:	cc cc cc 
   1400035d6:	48 f7 e2             	mul    rdx
   1400035d9:	48 89 d0             	mov    rax,rdx
   1400035dc:	48 c1 e8 03          	shr    rax,0x3
   1400035e0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400035e4:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400035e8:	48 85 c0             	test   rax,rax
   1400035eb:	0f 85 39 ff ff ff    	jne    0x14000352a
   1400035f1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400035f5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400035f8:	85 c0                	test   eax,eax
   1400035fa:	7e 3e                	jle    0x14000363a
   1400035fc:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003600:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003603:	89 c1                	mov    ecx,eax
   140003605:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140003609:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
   14000360d:	89 c2                	mov    edx,eax
   14000360f:	89 c8                	mov    eax,ecx
   140003611:	29 d0                	sub    eax,edx
   140003613:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
   140003616:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
   14000361a:	7e 1e                	jle    0x14000363a
   14000361c:	eb 0f                	jmp    0x14000362d
   14000361e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140003622:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003626:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   14000362a:	c6 00 30             	mov    BYTE PTR [rax],0x30
   14000362d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   140003630:	8d 50 ff             	lea    edx,[rax-0x1]
   140003633:	89 55 f4             	mov    DWORD PTR [rbp-0xc],edx
   140003636:	85 c0                	test   eax,eax
   140003638:	7f e4                	jg     0x14000361e
   14000363a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000363e:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   140003642:	75 1a                	jne    0x14000365e
   140003644:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003648:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000364b:	85 c0                	test   eax,eax
   14000364d:	74 0f                	je     0x14000365e
   14000364f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140003653:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003657:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   14000365b:	c6 00 30             	mov    BYTE PTR [rax],0x30
   14000365e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003662:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003665:	85 c0                	test   eax,eax
   140003667:	0f 8e ce 00 00 00    	jle    0x14000373b
   14000366d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003671:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003674:	89 c1                	mov    ecx,eax
   140003676:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000367a:	48 2b 45 e8          	sub    rax,QWORD PTR [rbp-0x18]
   14000367e:	89 c2                	mov    edx,eax
   140003680:	89 c8                	mov    eax,ecx
   140003682:	29 d0                	sub    eax,edx
   140003684:	89 c2                	mov    edx,eax
   140003686:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000368a:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   14000368d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003691:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003694:	85 c0                	test   eax,eax
   140003696:	0f 8e 9f 00 00 00    	jle    0x14000373b
   14000369c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400036a0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400036a3:	25 c0 01 00 00       	and    eax,0x1c0
   1400036a8:	85 c0                	test   eax,eax
   1400036aa:	74 11                	je     0x1400036bd
   1400036ac:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400036b0:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400036b3:	8d 50 ff             	lea    edx,[rax-0x1]
   1400036b6:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400036ba:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   1400036bd:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400036c1:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400036c4:	85 c0                	test   eax,eax
   1400036c6:	79 3b                	jns    0x140003703
   1400036c8:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400036cc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400036cf:	25 00 06 00 00       	and    eax,0x600
   1400036d4:	3d 00 02 00 00       	cmp    eax,0x200
   1400036d9:	75 28                	jne    0x140003703
   1400036db:	eb 0f                	jmp    0x1400036ec
   1400036dd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400036e1:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400036e5:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   1400036e9:	c6 00 30             	mov    BYTE PTR [rax],0x30
   1400036ec:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400036f0:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400036f3:	8d 48 ff             	lea    ecx,[rax-0x1]
   1400036f6:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400036fa:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   1400036fd:	85 c0                	test   eax,eax
   1400036ff:	7f dc                	jg     0x1400036dd
   140003701:	eb 38                	jmp    0x14000373b
   140003703:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003707:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000370a:	25 00 04 00 00       	and    eax,0x400
   14000370f:	85 c0                	test   eax,eax
   140003711:	75 28                	jne    0x14000373b
   140003713:	eb 11                	jmp    0x140003726
   140003715:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003719:	48 89 c2             	mov    rdx,rax
   14000371c:	b9 20 00 00 00       	mov    ecx,0x20
   140003721:	e8 ca f8 ff ff       	call   0x140002ff0
   140003726:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000372a:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000372d:	8d 48 ff             	lea    ecx,[rax-0x1]
   140003730:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140003734:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140003737:	85 c0                	test   eax,eax
   140003739:	7f da                	jg     0x140003715
   14000373b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000373f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003742:	25 80 00 00 00       	and    eax,0x80
   140003747:	85 c0                	test   eax,eax
   140003749:	74 11                	je     0x14000375c
   14000374b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000374f:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003753:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140003757:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
   14000375a:	eb 5a                	jmp    0x1400037b6
   14000375c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003760:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003763:	25 00 01 00 00       	and    eax,0x100
   140003768:	85 c0                	test   eax,eax
   14000376a:	74 11                	je     0x14000377d
   14000376c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140003770:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003774:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140003778:	c6 00 2b             	mov    BYTE PTR [rax],0x2b
   14000377b:	eb 39                	jmp    0x1400037b6
   14000377d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003781:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003784:	83 e0 40             	and    eax,0x40
   140003787:	85 c0                	test   eax,eax
   140003789:	74 2b                	je     0x1400037b6
   14000378b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000378f:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003793:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140003797:	c6 00 20             	mov    BYTE PTR [rax],0x20
   14000379a:	eb 1a                	jmp    0x1400037b6
   14000379c:	48 83 6d f8 01       	sub    QWORD PTR [rbp-0x8],0x1
   1400037a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400037a5:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400037a8:	0f be c0             	movsx  eax,al
   1400037ab:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400037af:	89 c1                	mov    ecx,eax
   1400037b1:	e8 3a f8 ff ff       	call   0x140002ff0
   1400037b6:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400037ba:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
   1400037be:	72 dc                	jb     0x14000379c
   1400037c0:	eb 11                	jmp    0x1400037d3
   1400037c2:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400037c6:	48 89 c2             	mov    rdx,rax
   1400037c9:	b9 20 00 00 00       	mov    ecx,0x20
   1400037ce:	e8 1d f8 ff ff       	call   0x140002ff0
   1400037d3:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400037d7:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400037da:	8d 48 ff             	lea    ecx,[rax-0x1]
   1400037dd:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400037e1:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   1400037e4:	85 c0                	test   eax,eax
   1400037e6:	7f da                	jg     0x1400037c2
   1400037e8:	90                   	nop
   1400037e9:	90                   	nop
   1400037ea:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   1400037ee:	5b                   	pop    rbx
   1400037ef:	5d                   	pop    rbp
   1400037f0:	c3                   	ret
   1400037f1:	55                   	push   rbp
   1400037f2:	53                   	push   rbx
   1400037f3:	48 83 ec 68          	sub    rsp,0x68
   1400037f7:	48 8d 6c 24 60       	lea    rbp,[rsp+0x60]
   1400037fc:	89 4d 20             	mov    DWORD PTR [rbp+0x20],ecx
   1400037ff:	48 89 d3             	mov    rbx,rdx
   140003802:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140003805:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   140003809:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   14000380d:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
   140003811:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140003815:	83 7d 20 6f          	cmp    DWORD PTR [rbp+0x20],0x6f
   140003819:	75 09                	jne    0x140003824
   14000381b:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   140003822:	eb 07                	jmp    0x14000382b
   140003824:	c7 45 f8 04 00 00 00 	mov    DWORD PTR [rbp-0x8],0x4
   14000382b:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
   14000382f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140003832:	49 89 d0             	mov    r8,rdx
   140003835:	89 c2                	mov    edx,eax
   140003837:	b9 02 00 00 00       	mov    ecx,0x2
   14000383c:	e8 9d fb ff ff       	call   0x1400033de
   140003841:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140003844:	48 c7 45 e0 00 00 00 	mov    QWORD PTR [rbp-0x20],0x0
   14000384b:	00 
   14000384c:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   14000384f:	48 98                	cdqe
   140003851:	48 83 c0 0f          	add    rax,0xf
   140003855:	48 c1 e8 04          	shr    rax,0x4
   140003859:	48 c1 e0 04          	shl    rax,0x4
   14000385d:	e8 de f6 ff ff       	call   0x140002f40
   140003862:	48 29 c4             	sub    rsp,rax
   140003865:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   14000386a:	48 83 c0 0f          	add    rax,0xf
   14000386e:	48 c1 e8 04          	shr    rax,0x4
   140003872:	48 c1 e0 04          	shl    rax,0x4
   140003876:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   14000387a:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000387e:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140003882:	83 7d 20 6f          	cmp    DWORD PTR [rbp+0x20],0x6f
   140003886:	75 09                	jne    0x140003891
   140003888:	c7 45 ec 07 00 00 00 	mov    DWORD PTR [rbp-0x14],0x7
   14000388f:	eb 67                	jmp    0x1400038f8
   140003891:	c7 45 ec 0f 00 00 00 	mov    DWORD PTR [rbp-0x14],0xf
   140003898:	eb 5e                	jmp    0x1400038f8
   14000389a:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   14000389e:	89 c2                	mov    edx,eax
   1400038a0:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   1400038a3:	21 d0                	and    eax,edx
   1400038a5:	8d 48 30             	lea    ecx,[rax+0x30]
   1400038a8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400038ac:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400038b0:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   1400038b4:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   1400038b8:	89 ca                	mov    edx,ecx
   1400038ba:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400038be:	88 10                	mov    BYTE PTR [rax],dl
   1400038c0:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400038c4:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400038c7:	3c 39                	cmp    al,0x39
   1400038c9:	7e 1a                	jle    0x1400038e5
   1400038cb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400038cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400038d2:	83 c0 07             	add    eax,0x7
   1400038d5:	89 c2                	mov    edx,eax
   1400038d7:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   1400038da:	83 e0 20             	and    eax,0x20
   1400038dd:	09 c2                	or     edx,eax
   1400038df:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400038e3:	88 10                	mov    BYTE PTR [rax],dl
   1400038e5:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
   1400038e9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   1400038ec:	89 c1                	mov    ecx,eax
   1400038ee:	48 d3 ea             	shr    rdx,cl
   1400038f1:	48 89 d0             	mov    rax,rdx
   1400038f4:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   1400038f8:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   1400038fc:	48 85 c0             	test   rax,rax
   1400038ff:	75 99                	jne    0x14000389a
   140003901:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003905:	48 3b 45 e0          	cmp    rax,QWORD PTR [rbp-0x20]
   140003909:	75 13                	jne    0x14000391e
   14000390b:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000390f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003912:	80 e4 f7             	and    ah,0xf7
   140003915:	89 c2                	mov    edx,eax
   140003917:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000391b:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   14000391e:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003922:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003925:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003928:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   14000392c:	7e 3a                	jle    0x140003968
   14000392e:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   140003931:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003935:	48 2b 45 e0          	sub    rax,QWORD PTR [rbp-0x20]
   140003939:	89 c1                	mov    ecx,eax
   14000393b:	89 d0                	mov    eax,edx
   14000393d:	29 c8                	sub    eax,ecx
   14000393f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003942:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140003946:	7e 20                	jle    0x140003968
   140003948:	eb 0f                	jmp    0x140003959
   14000394a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000394e:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003952:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003956:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140003959:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000395c:	8d 50 ff             	lea    edx,[rax-0x1]
   14000395f:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   140003962:	85 c0                	test   eax,eax
   140003964:	7f e4                	jg     0x14000394a
   140003966:	eb 25                	jmp    0x14000398d
   140003968:	83 7d 20 6f          	cmp    DWORD PTR [rbp+0x20],0x6f
   14000396c:	75 1f                	jne    0x14000398d
   14000396e:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003972:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003975:	25 00 08 00 00       	and    eax,0x800
   14000397a:	85 c0                	test   eax,eax
   14000397c:	74 0f                	je     0x14000398d
   14000397e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003982:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003986:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   14000398a:	c6 00 30             	mov    BYTE PTR [rax],0x30
   14000398d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003991:	48 3b 45 e0          	cmp    rax,QWORD PTR [rbp-0x20]
   140003995:	75 1a                	jne    0x1400039b1
   140003997:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000399b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000399e:	85 c0                	test   eax,eax
   1400039a0:	74 0f                	je     0x1400039b1
   1400039a2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400039a6:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400039aa:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   1400039ae:	c6 00 30             	mov    BYTE PTR [rax],0x30
   1400039b1:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400039b5:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400039b8:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   1400039bc:	48 2b 55 e0          	sub    rdx,QWORD PTR [rbp-0x20]
   1400039c0:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   1400039c3:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   1400039c6:	7d 15                	jge    0x1400039dd
   1400039c8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400039cc:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400039cf:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
   1400039d2:	89 c2                	mov    edx,eax
   1400039d4:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400039d8:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   1400039db:	eb 0b                	jmp    0x1400039e8
   1400039dd:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400039e1:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   1400039e8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400039ec:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400039ef:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400039f2:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400039f6:	7e 1a                	jle    0x140003a12
   1400039f8:	83 7d 20 6f          	cmp    DWORD PTR [rbp+0x20],0x6f
   1400039fc:	74 14                	je     0x140003a12
   1400039fe:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003a02:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003a05:	25 00 08 00 00       	and    eax,0x800
   140003a0a:	85 c0                	test   eax,eax
   140003a0c:	74 04                	je     0x140003a12
   140003a0e:	83 6d fc 02          	sub    DWORD PTR [rbp-0x4],0x2
   140003a12:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140003a16:	7e 3c                	jle    0x140003a54
   140003a18:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003a1c:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140003a1f:	85 c0                	test   eax,eax
   140003a21:	79 31                	jns    0x140003a54
   140003a23:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003a27:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003a2a:	25 00 06 00 00       	and    eax,0x600
   140003a2f:	3d 00 02 00 00       	cmp    eax,0x200
   140003a34:	75 1e                	jne    0x140003a54
   140003a36:	eb 0f                	jmp    0x140003a47
   140003a38:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003a3c:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003a40:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003a44:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140003a47:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003a4a:	8d 50 ff             	lea    edx,[rax-0x1]
   140003a4d:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   140003a50:	85 c0                	test   eax,eax
   140003a52:	7f e4                	jg     0x140003a38
   140003a54:	83 7d 20 6f          	cmp    DWORD PTR [rbp+0x20],0x6f
   140003a58:	74 30                	je     0x140003a8a
   140003a5a:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003a5e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003a61:	25 00 08 00 00       	and    eax,0x800
   140003a66:	85 c0                	test   eax,eax
   140003a68:	74 20                	je     0x140003a8a
   140003a6a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003a6e:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003a72:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003a76:	8b 55 20             	mov    edx,DWORD PTR [rbp+0x20]
   140003a79:	88 10                	mov    BYTE PTR [rax],dl
   140003a7b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003a7f:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003a83:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003a87:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140003a8a:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140003a8e:	7e 4c                	jle    0x140003adc
   140003a90:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003a94:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003a97:	25 00 04 00 00       	and    eax,0x400
   140003a9c:	85 c0                	test   eax,eax
   140003a9e:	75 3c                	jne    0x140003adc
   140003aa0:	eb 11                	jmp    0x140003ab3
   140003aa2:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003aa6:	48 89 c2             	mov    rdx,rax
   140003aa9:	b9 20 00 00 00       	mov    ecx,0x20
   140003aae:	e8 3d f5 ff ff       	call   0x140002ff0
   140003ab3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003ab6:	8d 50 ff             	lea    edx,[rax-0x1]
   140003ab9:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   140003abc:	85 c0                	test   eax,eax
   140003abe:	7f e2                	jg     0x140003aa2
   140003ac0:	eb 1a                	jmp    0x140003adc
   140003ac2:	48 83 6d f0 01       	sub    QWORD PTR [rbp-0x10],0x1
   140003ac7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003acb:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140003ace:	0f be c0             	movsx  eax,al
   140003ad1:	48 8b 55 30          	mov    rdx,QWORD PTR [rbp+0x30]
   140003ad5:	89 c1                	mov    ecx,eax
   140003ad7:	e8 14 f5 ff ff       	call   0x140002ff0
   140003adc:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003ae0:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
   140003ae4:	72 dc                	jb     0x140003ac2
   140003ae6:	eb 11                	jmp    0x140003af9
   140003ae8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140003aec:	48 89 c2             	mov    rdx,rax
   140003aef:	b9 20 00 00 00       	mov    ecx,0x20
   140003af4:	e8 f7 f4 ff ff       	call   0x140002ff0
   140003af9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003afc:	8d 50 ff             	lea    edx,[rax-0x1]
   140003aff:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   140003b02:	85 c0                	test   eax,eax
   140003b04:	7f e2                	jg     0x140003ae8
   140003b06:	90                   	nop
   140003b07:	90                   	nop
   140003b08:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   140003b0c:	5b                   	pop    rbx
   140003b0d:	5d                   	pop    rbp
   140003b0e:	c3                   	ret
   140003b0f:	55                   	push   rbp
   140003b10:	53                   	push   rbx
   140003b11:	48 83 ec 28          	sub    rsp,0x28
   140003b15:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
   140003b1a:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140003b1e:	48 89 d3             	mov    rbx,rdx
   140003b21:	db 2b                	fld    TBYTE PTR [rbx]
   140003b23:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   140003b26:	db 6d e0             	fld    TBYTE PTR [rbp-0x20]
   140003b29:	db 7d f0             	fstp   TBYTE PTR [rbp-0x10]
   140003b2c:	48 8b 4d 20          	mov    rcx,QWORD PTR [rbp+0x20]
   140003b30:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003b34:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140003b38:	48 89 01             	mov    QWORD PTR [rcx],rax
   140003b3b:	48 89 51 08          	mov    QWORD PTR [rcx+0x8],rdx
   140003b3f:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003b43:	48 83 c4 28          	add    rsp,0x28
   140003b47:	5b                   	pop    rbx
   140003b48:	5d                   	pop    rbp
   140003b49:	c3                   	ret
   140003b4a:	55                   	push   rbp
   140003b4b:	53                   	push   rbx
   140003b4c:	48 81 ec 88 00 00 00 	sub    rsp,0x88
   140003b53:	48 8d ac 24 80 00 00 	lea    rbp,[rsp+0x80]
   140003b5a:	00 
   140003b5b:	89 4d 20             	mov    DWORD PTR [rbp+0x20],ecx
   140003b5e:	48 89 d3             	mov    rbx,rdx
   140003b61:	db 2b                	fld    TBYTE PTR [rbx]
   140003b63:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140003b66:	44 89 45 30          	mov    DWORD PTR [rbp+0x30],r8d
   140003b6a:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140003b6e:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140003b75:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140003b79:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140003b7c:	db 7d c0             	fstp   TBYTE PTR [rbp-0x40]
   140003b7f:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140003b83:	48 89 c1             	mov    rcx,rax
   140003b86:	e8 84 ff ff ff       	call   0x140003b0f
   140003b8b:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140003b8e:	db 7d c0             	fstp   TBYTE PTR [rbp-0x40]
   140003b91:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140003b95:	48 89 c1             	mov    rcx,rax
   140003b98:	e8 c3 4f 00 00       	call   0x140008b60
   140003b9d:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140003ba0:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140003ba3:	25 00 01 00 00       	and    eax,0x100
   140003ba8:	85 c0                	test   eax,eax
   140003baa:	74 1d                	je     0x140003bc9
   140003bac:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140003baf:	25 00 04 00 00       	and    eax,0x400
   140003bb4:	85 c0                	test   eax,eax
   140003bb6:	74 07                	je     0x140003bbf
   140003bb8:	b8 03 00 00 00       	mov    eax,0x3
   140003bbd:	eb 05                	jmp    0x140003bc4
   140003bbf:	b8 04 00 00 00       	mov    eax,0x4
   140003bc4:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140003bc7:	eb 4a                	jmp    0x140003c13
   140003bc9:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140003bcc:	25 00 04 00 00       	and    eax,0x400
   140003bd1:	85 c0                	test   eax,eax
   140003bd3:	74 37                	je     0x140003c0c
   140003bd5:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140003bd8:	25 00 40 00 00       	and    eax,0x4000
   140003bdd:	85 c0                	test   eax,eax
   140003bdf:	74 10                	je     0x140003bf1
   140003be1:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
   140003be8:	c7 45 fc c3 bf ff ff 	mov    DWORD PTR [rbp-0x4],0xffffbfc3
   140003bef:	eb 22                	jmp    0x140003c13
   140003bf1:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
   140003bf8:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140003bfc:	98                   	cwde
   140003bfd:	25 ff 7f 00 00       	and    eax,0x7fff
   140003c02:	2d 3e 40 00 00       	sub    eax,0x403e
   140003c07:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003c0a:	eb 07                	jmp    0x140003c13
   140003c0c:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   140003c13:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140003c16:	83 f8 04             	cmp    eax,0x4
   140003c19:	74 0e                	je     0x140003c29
   140003c1b:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140003c1f:	98                   	cwde
   140003c20:	25 00 80 00 00       	and    eax,0x8000
   140003c25:	89 c2                	mov    edx,eax
   140003c27:	eb 05                	jmp    0x140003c2e
   140003c29:	ba 00 00 00 00       	mov    edx,0x0
   140003c2e:	48 8b 45 40          	mov    rax,QWORD PTR [rbp+0x40]
   140003c32:	89 10                	mov    DWORD PTR [rax],edx
   140003c34:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003c37:	4c 8d 4d f8          	lea    r9,[rbp-0x8]
   140003c3b:	4c 8d 45 e0          	lea    r8,[rbp-0x20]
   140003c3f:	48 8d 0d 2a 64 00 00 	lea    rcx,[rip+0x642a]        # 0x14000a070
   140003c46:	48 8d 55 f0          	lea    rdx,[rbp-0x10]
   140003c4a:	48 89 54 24 38       	mov    QWORD PTR [rsp+0x38],rdx
   140003c4f:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
   140003c53:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
   140003c58:	8b 55 30             	mov    edx,DWORD PTR [rbp+0x30]
   140003c5b:	89 54 24 28          	mov    DWORD PTR [rsp+0x28],edx
   140003c5f:	8b 55 20             	mov    edx,DWORD PTR [rbp+0x20]
   140003c62:	89 54 24 20          	mov    DWORD PTR [rsp+0x20],edx
   140003c66:	89 c2                	mov    edx,eax
   140003c68:	e8 bd 25 00 00       	call   0x14000622a
   140003c6d:	48 81 c4 88 00 00 00 	add    rsp,0x88
   140003c74:	5b                   	pop    rbx
   140003c75:	5d                   	pop    rbp
   140003c76:	c3                   	ret
   140003c77:	55                   	push   rbp
   140003c78:	53                   	push   rbx
   140003c79:	48 83 ec 58          	sub    rsp,0x58
   140003c7d:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   140003c82:	48 89 cb             	mov    rbx,rcx
   140003c85:	db 2b                	fld    TBYTE PTR [rbx]
   140003c87:	db 7d f0             	fstp   TBYTE PTR [rbp-0x10]
   140003c8a:	89 55 28             	mov    DWORD PTR [rbp+0x28],edx
   140003c8d:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140003c91:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140003c95:	db 6d f0             	fld    TBYTE PTR [rbp-0x10]
   140003c98:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   140003c9b:	4c 8b 45 30          	mov    r8,QWORD PTR [rbp+0x30]
   140003c9f:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   140003ca2:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140003ca6:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
   140003caa:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140003caf:	4d 89 c1             	mov    r9,r8
   140003cb2:	41 89 c8             	mov    r8d,ecx
   140003cb5:	48 89 c2             	mov    rdx,rax
   140003cb8:	b9 02 00 00 00       	mov    ecx,0x2
   140003cbd:	e8 88 fe ff ff       	call   0x140003b4a
   140003cc2:	48 83 c4 58          	add    rsp,0x58
   140003cc6:	5b                   	pop    rbx
   140003cc7:	5d                   	pop    rbp
   140003cc8:	c3                   	ret
   140003cc9:	55                   	push   rbp
   140003cca:	53                   	push   rbx
   140003ccb:	48 83 ec 58          	sub    rsp,0x58
   140003ccf:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   140003cd4:	48 89 cb             	mov    rbx,rcx
   140003cd7:	db 2b                	fld    TBYTE PTR [rbx]
   140003cd9:	db 7d f0             	fstp   TBYTE PTR [rbp-0x10]
   140003cdc:	89 55 28             	mov    DWORD PTR [rbp+0x28],edx
   140003cdf:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140003ce3:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140003ce7:	db 6d f0             	fld    TBYTE PTR [rbp-0x10]
   140003cea:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   140003ced:	4c 8b 45 30          	mov    r8,QWORD PTR [rbp+0x30]
   140003cf1:	8b 4d 28             	mov    ecx,DWORD PTR [rbp+0x28]
   140003cf4:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140003cf8:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
   140003cfc:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140003d01:	4d 89 c1             	mov    r9,r8
   140003d04:	41 89 c8             	mov    r8d,ecx
   140003d07:	48 89 c2             	mov    rdx,rax
   140003d0a:	b9 03 00 00 00       	mov    ecx,0x3
   140003d0f:	e8 36 fe ff ff       	call   0x140003b4a
   140003d14:	48 83 c4 58          	add    rsp,0x58
   140003d18:	5b                   	pop    rbx
   140003d19:	5d                   	pop    rbp
   140003d1a:	c3                   	ret
   140003d1b:	55                   	push   rbp
   140003d1c:	53                   	push   rbx
   140003d1d:	48 83 ec 68          	sub    rsp,0x68
   140003d21:	48 8d 6c 24 60       	lea    rbp,[rsp+0x60]
   140003d26:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140003d2a:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003d2e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140003d31:	83 f8 fd             	cmp    eax,0xfffffffd
   140003d34:	75 48                	jne    0x140003d7e
   140003d36:	48 c7 45 cc 00 00 00 	mov    QWORD PTR [rbp-0x34],0x0
   140003d3d:	00 
   140003d3e:	e8 d5 59 00 00       	call   0x140009718
   140003d43:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140003d46:	48 8d 4d cc          	lea    rcx,[rbp-0x34]
   140003d4a:	48 8d 45 d6          	lea    rax,[rbp-0x2a]
   140003d4e:	49 89 c9             	mov    r9,rcx
   140003d51:	41 b8 10 00 00 00    	mov    r8d,0x10
   140003d57:	48 89 c1             	mov    rcx,rax
   140003d5a:	e8 5f 54 00 00       	call   0x1400091be
   140003d5f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   140003d62:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
   140003d66:	7e 0c                	jle    0x140003d74
   140003d68:	0f b7 55 d6          	movzx  edx,WORD PTR [rbp-0x2a]
   140003d6c:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003d70:	66 89 50 18          	mov    WORD PTR [rax+0x18],dx
   140003d74:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003d78:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
   140003d7b:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140003d7e:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003d82:	0f b7 40 18          	movzx  eax,WORD PTR [rax+0x18]
   140003d86:	66 85 c0             	test   ax,ax
   140003d89:	0f 84 b8 00 00 00    	je     0x140003e47
   140003d8f:	48 89 e0             	mov    rax,rsp
   140003d92:	48 89 c3             	mov    rbx,rax
   140003d95:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003d99:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140003d9c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003d9f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003da2:	48 63 d0             	movsxd rdx,eax
   140003da5:	48 83 ea 01          	sub    rdx,0x1
   140003da9:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
   140003dad:	48 98                	cdqe
   140003daf:	48 83 c0 0f          	add    rax,0xf
   140003db3:	48 c1 e8 04          	shr    rax,0x4
   140003db7:	48 c1 e0 04          	shl    rax,0x4
   140003dbb:	e8 80 f1 ff ff       	call   0x140002f40
   140003dc0:	48 29 c4             	sub    rsp,rax
   140003dc3:	48 8d 44 24 20       	lea    rax,[rsp+0x20]
   140003dc8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140003dcc:	48 c7 45 c4 00 00 00 	mov    QWORD PTR [rbp-0x3c],0x0
   140003dd3:	00 
   140003dd4:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003dd8:	0f b7 40 18          	movzx  eax,WORD PTR [rax+0x18]
   140003ddc:	0f b7 d0             	movzx  edx,ax
   140003ddf:	48 8d 4d c4          	lea    rcx,[rbp-0x3c]
   140003de3:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140003de7:	49 89 c8             	mov    r8,rcx
   140003dea:	48 89 c1             	mov    rcx,rax
   140003ded:	e8 de 4f 00 00       	call   0x140008dd0
   140003df2:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140003df5:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140003df9:	7e 36                	jle    0x140003e31
   140003dfb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140003dff:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140003e03:	eb 1d                	jmp    0x140003e22
   140003e05:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003e09:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003e0d:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003e11:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140003e14:	0f be c0             	movsx  eax,al
   140003e17:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140003e1b:	89 c1                	mov    ecx,eax
   140003e1d:	e8 ce f1 ff ff       	call   0x140002ff0
   140003e22:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140003e25:	8d 50 ff             	lea    edx,[rax-0x1]
   140003e28:	89 55 fc             	mov    DWORD PTR [rbp-0x4],edx
   140003e2b:	85 c0                	test   eax,eax
   140003e2d:	7f d6                	jg     0x140003e05
   140003e2f:	eb 11                	jmp    0x140003e42
   140003e31:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003e35:	48 89 c2             	mov    rdx,rax
   140003e38:	b9 2e 00 00 00       	mov    ecx,0x2e
   140003e3d:	e8 ae f1 ff ff       	call   0x140002ff0
   140003e42:	48 89 dc             	mov    rsp,rbx
   140003e45:	eb 11                	jmp    0x140003e58
   140003e47:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003e4b:	48 89 c2             	mov    rdx,rax
   140003e4e:	b9 2e 00 00 00       	mov    ecx,0x2e
   140003e53:	e8 98 f1 ff ff       	call   0x140002ff0
   140003e58:	90                   	nop
   140003e59:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   140003e5d:	5b                   	pop    rbx
   140003e5e:	5d                   	pop    rbp
   140003e5f:	c3                   	ret
   140003e60:	55                   	push   rbp
   140003e61:	48 89 e5             	mov    rbp,rsp
   140003e64:	48 83 ec 30          	sub    rsp,0x30
   140003e68:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140003e6b:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003e6f:	83 7d 10 2e          	cmp    DWORD PTR [rbp+0x10],0x2e
   140003e73:	75 0e                	jne    0x140003e83
   140003e75:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003e79:	48 89 c1             	mov    rcx,rax
   140003e7c:	e8 9a fe ff ff       	call   0x140003d1b
   140003e81:	eb 43                	jmp    0x140003ec6
   140003e83:	83 7d 10 2c          	cmp    DWORD PTR [rbp+0x10],0x2c
   140003e87:	75 2f                	jne    0x140003eb8
   140003e89:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003e8d:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
   140003e91:	66 89 45 fe          	mov    WORD PTR [rbp-0x2],ax
   140003e95:	0f b7 45 fe          	movzx  eax,WORD PTR [rbp-0x2]
   140003e99:	66 85 c0             	test   ax,ax
   140003e9c:	74 28                	je     0x140003ec6
   140003e9e:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140003ea2:	48 8d 45 fe          	lea    rax,[rbp-0x2]
   140003ea6:	49 89 d0             	mov    r8,rdx
   140003ea9:	ba 01 00 00 00       	mov    edx,0x1
   140003eae:	48 89 c1             	mov    rcx,rax
   140003eb1:	e8 43 f3 ff ff       	call   0x1400031f9
   140003eb6:	eb 0e                	jmp    0x140003ec6
   140003eb8:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140003ebc:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140003ebf:	89 c1                	mov    ecx,eax
   140003ec1:	e8 2a f1 ff ff       	call   0x140002ff0
   140003ec6:	90                   	nop
   140003ec7:	48 83 c4 30          	add    rsp,0x30
   140003ecb:	5d                   	pop    rbp
   140003ecc:	c3                   	ret
   140003ecd:	55                   	push   rbp
   140003ece:	48 89 e5             	mov    rbp,rsp
   140003ed1:	48 83 ec 40          	sub    rsp,0x40
   140003ed5:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140003ed8:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003edc:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140003ee0:	48 8d 45 ec          	lea    rax,[rbp-0x14]
   140003ee4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140003ee8:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003eec:	c7 40 10 ff ff ff ff 	mov    DWORD PTR [rax+0x10],0xffffffff
   140003ef3:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
   140003ef7:	74 11                	je     0x140003f0a
   140003ef9:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003efd:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003f01:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003f05:	c6 00 2d             	mov    BYTE PTR [rax],0x2d
   140003f08:	eb 3e                	jmp    0x140003f48
   140003f0a:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003f0e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003f11:	25 00 01 00 00       	and    eax,0x100
   140003f16:	85 c0                	test   eax,eax
   140003f18:	74 11                	je     0x140003f2b
   140003f1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003f1e:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003f22:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003f26:	c6 00 2b             	mov    BYTE PTR [rax],0x2b
   140003f29:	eb 1d                	jmp    0x140003f48
   140003f2b:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003f2f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003f32:	83 e0 40             	and    eax,0x40
   140003f35:	85 c0                	test   eax,eax
   140003f37:	74 0f                	je     0x140003f48
   140003f39:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003f3d:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003f41:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003f45:	c6 00 20             	mov    BYTE PTR [rax],0x20
   140003f48:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
   140003f4f:	eb 38                	jmp    0x140003f89
   140003f51:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140003f55:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003f59:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003f5d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140003f60:	83 e0 df             	and    eax,0xffffffdf
   140003f63:	41 89 c0             	mov    r8d,eax
   140003f66:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140003f6a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140003f6d:	83 e0 20             	and    eax,0x20
   140003f70:	89 c1                	mov    ecx,eax
   140003f72:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140003f76:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140003f7a:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140003f7e:	44 89 c2             	mov    edx,r8d
   140003f81:	09 ca                	or     edx,ecx
   140003f83:	88 10                	mov    BYTE PTR [rax],dl
   140003f85:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
   140003f89:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140003f8d:	7f c2                	jg     0x140003f51
   140003f8f:	48 8d 45 ec          	lea    rax,[rbp-0x14]
   140003f93:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140003f97:	48 29 c2             	sub    rdx,rax
   140003f9a:	89 d1                	mov    ecx,edx
   140003f9c:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140003fa0:	48 8d 45 ec          	lea    rax,[rbp-0x14]
   140003fa4:	49 89 d0             	mov    r8,rdx
   140003fa7:	89 ca                	mov    edx,ecx
   140003fa9:	48 89 c1             	mov    rcx,rax
   140003fac:	e8 c3 f0 ff ff       	call   0x140003074
   140003fb1:	90                   	nop
   140003fb2:	48 83 c4 40          	add    rsp,0x40
   140003fb6:	5d                   	pop    rbp
   140003fb7:	c3                   	ret
   140003fb8:	55                   	push   rbp
   140003fb9:	48 89 e5             	mov    rbp,rsp
   140003fbc:	48 83 ec 30          	sub    rsp,0x30
   140003fc0:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140003fc3:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140003fc7:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140003fcb:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   140003fcf:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   140003fd3:	7e 2e                	jle    0x140004003
   140003fd5:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003fd9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003fdc:	39 45 20             	cmp    DWORD PTR [rbp+0x20],eax
   140003fdf:	7f 15                	jg     0x140003ff6
   140003fe1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003fe5:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140003fe8:	2b 45 20             	sub    eax,DWORD PTR [rbp+0x20]
   140003feb:	89 c2                	mov    edx,eax
   140003fed:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003ff1:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140003ff4:	eb 29                	jmp    0x14000401f
   140003ff6:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140003ffa:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   140004001:	eb 1c                	jmp    0x14000401f
   140004003:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004007:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000400a:	85 c0                	test   eax,eax
   14000400c:	7e 11                	jle    0x14000401f
   14000400e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004012:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004015:	8d 50 ff             	lea    edx,[rax-0x1]
   140004018:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000401c:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   14000401f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004023:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004026:	85 c0                	test   eax,eax
   140004028:	78 2b                	js     0x140004055
   14000402a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000402e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140004031:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004035:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004038:	39 c2                	cmp    edx,eax
   14000403a:	7e 19                	jle    0x140004055
   14000403c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004040:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140004043:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004047:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000404a:	29 c2                	sub    edx,eax
   14000404c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004050:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004053:	eb 0b                	jmp    0x140004060
   140004055:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004059:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   140004060:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004064:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004067:	85 c0                	test   eax,eax
   140004069:	7e 2c                	jle    0x140004097
   14000406b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000406f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004072:	85 c0                	test   eax,eax
   140004074:	7f 10                	jg     0x140004086
   140004076:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000407a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000407d:	25 00 08 00 00       	and    eax,0x800
   140004082:	85 c0                	test   eax,eax
   140004084:	74 11                	je     0x140004097
   140004086:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000408a:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000408d:	8d 50 ff             	lea    edx,[rax-0x1]
   140004090:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004094:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004097:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   14000409b:	7e 64                	jle    0x140004101
   14000409d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400040a1:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400040a4:	25 00 10 00 00       	and    eax,0x1000
   1400040a9:	85 c0                	test   eax,eax
   1400040ab:	74 54                	je     0x140004101
   1400040ad:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400040b1:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
   1400040b5:	66 85 c0             	test   ax,ax
   1400040b8:	74 47                	je     0x140004101
   1400040ba:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   1400040bd:	83 c0 02             	add    eax,0x2
   1400040c0:	48 63 d0             	movsxd rdx,eax
   1400040c3:	48 69 d2 56 55 55 55 	imul   rdx,rdx,0x55555556
   1400040ca:	48 c1 ea 20          	shr    rdx,0x20
   1400040ce:	c1 f8 1f             	sar    eax,0x1f
   1400040d1:	29 c2                	sub    edx,eax
   1400040d3:	8d 42 ff             	lea    eax,[rdx-0x1]
   1400040d6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400040d9:	eb 15                	jmp    0x1400040f0
   1400040db:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
   1400040df:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400040e3:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400040e6:	8d 50 ff             	lea    edx,[rax-0x1]
   1400040e9:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400040ed:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   1400040f0:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400040f4:	7e 0b                	jle    0x140004101
   1400040f6:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400040fa:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400040fd:	85 c0                	test   eax,eax
   1400040ff:	7f da                	jg     0x1400040db
   140004101:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004105:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004108:	85 c0                	test   eax,eax
   14000410a:	7e 27                	jle    0x140004133
   14000410c:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
   140004110:	75 10                	jne    0x140004122
   140004112:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004116:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004119:	25 c0 01 00 00       	and    eax,0x1c0
   14000411e:	85 c0                	test   eax,eax
   140004120:	74 11                	je     0x140004133
   140004122:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004126:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004129:	8d 50 ff             	lea    edx,[rax-0x1]
   14000412c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004130:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004133:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004137:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000413a:	85 c0                	test   eax,eax
   14000413c:	7e 38                	jle    0x140004176
   14000413e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004142:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004145:	25 00 06 00 00       	and    eax,0x600
   14000414a:	85 c0                	test   eax,eax
   14000414c:	75 28                	jne    0x140004176
   14000414e:	eb 11                	jmp    0x140004161
   140004150:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004154:	48 89 c2             	mov    rdx,rax
   140004157:	b9 20 00 00 00       	mov    ecx,0x20
   14000415c:	e8 8f ee ff ff       	call   0x140002ff0
   140004161:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004165:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004168:	8d 48 ff             	lea    ecx,[rax-0x1]
   14000416b:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   14000416f:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140004172:	85 c0                	test   eax,eax
   140004174:	7f da                	jg     0x140004150
   140004176:	83 7d 10 00          	cmp    DWORD PTR [rbp+0x10],0x0
   14000417a:	74 13                	je     0x14000418f
   14000417c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004180:	48 89 c2             	mov    rdx,rax
   140004183:	b9 2d 00 00 00       	mov    ecx,0x2d
   140004188:	e8 63 ee ff ff       	call   0x140002ff0
   14000418d:	eb 42                	jmp    0x1400041d1
   14000418f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004193:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004196:	25 00 01 00 00       	and    eax,0x100
   14000419b:	85 c0                	test   eax,eax
   14000419d:	74 13                	je     0x1400041b2
   14000419f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400041a3:	48 89 c2             	mov    rdx,rax
   1400041a6:	b9 2b 00 00 00       	mov    ecx,0x2b
   1400041ab:	e8 40 ee ff ff       	call   0x140002ff0
   1400041b0:	eb 1f                	jmp    0x1400041d1
   1400041b2:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400041b6:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400041b9:	83 e0 40             	and    eax,0x40
   1400041bc:	85 c0                	test   eax,eax
   1400041be:	74 11                	je     0x1400041d1
   1400041c0:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400041c4:	48 89 c2             	mov    rdx,rax
   1400041c7:	b9 20 00 00 00       	mov    ecx,0x20
   1400041cc:	e8 1f ee ff ff       	call   0x140002ff0
   1400041d1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400041d5:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400041d8:	85 c0                	test   eax,eax
   1400041da:	7e 3b                	jle    0x140004217
   1400041dc:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400041e0:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400041e3:	25 00 06 00 00       	and    eax,0x600
   1400041e8:	3d 00 02 00 00       	cmp    eax,0x200
   1400041ed:	75 28                	jne    0x140004217
   1400041ef:	eb 11                	jmp    0x140004202
   1400041f1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400041f5:	48 89 c2             	mov    rdx,rax
   1400041f8:	b9 30 00 00 00       	mov    ecx,0x30
   1400041fd:	e8 ee ed ff ff       	call   0x140002ff0
   140004202:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004206:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004209:	8d 48 ff             	lea    ecx,[rax-0x1]
   14000420c:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004210:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140004213:	85 c0                	test   eax,eax
   140004215:	7f da                	jg     0x1400041f1
   140004217:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   14000421b:	0f 8e a7 00 00 00    	jle    0x1400042c8
   140004221:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140004225:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140004228:	84 c0                	test   al,al
   14000422a:	74 14                	je     0x140004240
   14000422c:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140004230:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140004234:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140004238:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   14000423b:	0f be c0             	movsx  eax,al
   14000423e:	eb 05                	jmp    0x140004245
   140004240:	b8 30 00 00 00       	mov    eax,0x30
   140004245:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004249:	89 c1                	mov    ecx,eax
   14000424b:	e8 a0 ed ff ff       	call   0x140002ff0
   140004250:	83 6d 20 01          	sub    DWORD PTR [rbp+0x20],0x1
   140004254:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   140004258:	74 62                	je     0x1400042bc
   14000425a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000425e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004261:	25 00 10 00 00       	and    eax,0x1000
   140004266:	85 c0                	test   eax,eax
   140004268:	74 52                	je     0x1400042bc
   14000426a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000426e:	0f b7 40 20          	movzx  eax,WORD PTR [rax+0x20]
   140004272:	66 85 c0             	test   ax,ax
   140004275:	74 45                	je     0x1400042bc
   140004277:	8b 4d 20             	mov    ecx,DWORD PTR [rbp+0x20]
   14000427a:	48 63 c1             	movsxd rax,ecx
   14000427d:	48 69 c0 56 55 55 55 	imul   rax,rax,0x55555556
   140004284:	48 c1 e8 20          	shr    rax,0x20
   140004288:	48 89 c2             	mov    rdx,rax
   14000428b:	89 c8                	mov    eax,ecx
   14000428d:	c1 f8 1f             	sar    eax,0x1f
   140004290:	29 c2                	sub    edx,eax
   140004292:	89 d0                	mov    eax,edx
   140004294:	01 c0                	add    eax,eax
   140004296:	01 d0                	add    eax,edx
   140004298:	29 c1                	sub    ecx,eax
   14000429a:	89 ca                	mov    edx,ecx
   14000429c:	85 d2                	test   edx,edx
   14000429e:	75 1c                	jne    0x1400042bc
   1400042a0:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400042a4:	48 83 c0 20          	add    rax,0x20
   1400042a8:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400042ac:	49 89 d0             	mov    r8,rdx
   1400042af:	ba 01 00 00 00       	mov    edx,0x1
   1400042b4:	48 89 c1             	mov    rcx,rax
   1400042b7:	e8 3d ef ff ff       	call   0x1400031f9
   1400042bc:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   1400042c0:	0f 8f 5b ff ff ff    	jg     0x140004221
   1400042c6:	eb 11                	jmp    0x1400042d9
   1400042c8:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400042cc:	48 89 c2             	mov    rdx,rax
   1400042cf:	b9 30 00 00 00       	mov    ecx,0x30
   1400042d4:	e8 17 ed ff ff       	call   0x140002ff0
   1400042d9:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400042dd:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400042e0:	85 c0                	test   eax,eax
   1400042e2:	7f 10                	jg     0x1400042f4
   1400042e4:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400042e8:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400042eb:	25 00 08 00 00       	and    eax,0x800
   1400042f0:	85 c0                	test   eax,eax
   1400042f2:	74 0c                	je     0x140004300
   1400042f4:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400042f8:	48 89 c1             	mov    rcx,rax
   1400042fb:	e8 1b fa ff ff       	call   0x140003d1b
   140004300:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   140004304:	79 5f                	jns    0x140004365
   140004306:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000430a:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   14000430d:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   140004310:	01 c2                	add    edx,eax
   140004312:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004316:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   140004319:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000431d:	48 89 c2             	mov    rdx,rax
   140004320:	b9 30 00 00 00       	mov    ecx,0x30
   140004325:	e8 c6 ec ff ff       	call   0x140002ff0
   14000432a:	83 45 20 01          	add    DWORD PTR [rbp+0x20],0x1
   14000432e:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   140004332:	78 e5                	js     0x140004319
   140004334:	eb 2f                	jmp    0x140004365
   140004336:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000433a:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   14000433d:	84 c0                	test   al,al
   14000433f:	74 14                	je     0x140004355
   140004341:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140004345:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140004349:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   14000434d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140004350:	0f be c0             	movsx  eax,al
   140004353:	eb 05                	jmp    0x14000435a
   140004355:	b8 30 00 00 00       	mov    eax,0x30
   14000435a:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   14000435e:	89 c1                	mov    ecx,eax
   140004360:	e8 8b ec ff ff       	call   0x140002ff0
   140004365:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004369:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000436c:	8d 48 ff             	lea    ecx,[rax-0x1]
   14000436f:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004373:	89 4a 10             	mov    DWORD PTR [rdx+0x10],ecx
   140004376:	85 c0                	test   eax,eax
   140004378:	7f bc                	jg     0x140004336
   14000437a:	90                   	nop
   14000437b:	90                   	nop
   14000437c:	48 83 c4 30          	add    rsp,0x30
   140004380:	5d                   	pop    rbp
   140004381:	c3                   	ret
   140004382:	55                   	push   rbp
   140004383:	48 89 e5             	mov    rbp,rsp
   140004386:	48 83 ec 50          	sub    rsp,0x50
   14000438a:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000438d:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140004391:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140004395:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   140004399:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
   1400043a0:	83 6d 20 01          	sub    DWORD PTR [rbp+0x20],0x1
   1400043a4:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   1400043a7:	48 98                	cdqe
   1400043a9:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   1400043ad:	eb 04                	jmp    0x1400043b3
   1400043af:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   1400043b3:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   1400043b6:	48 63 d0             	movsxd rdx,eax
   1400043b9:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
   1400043c0:	48 c1 ea 20          	shr    rdx,0x20
   1400043c4:	89 d1                	mov    ecx,edx
   1400043c6:	c1 f9 02             	sar    ecx,0x2
   1400043c9:	99                   	cdq
   1400043ca:	89 c8                	mov    eax,ecx
   1400043cc:	29 d0                	sub    eax,edx
   1400043ce:	89 45 20             	mov    DWORD PTR [rbp+0x20],eax
   1400043d1:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   1400043d5:	75 d8                	jne    0x1400043af
   1400043d7:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400043db:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
   1400043de:	83 f8 ff             	cmp    eax,0xffffffff
   1400043e1:	75 0b                	jne    0x1400043ee
   1400043e3:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400043e7:	c7 40 2c 02 00 00 00 	mov    DWORD PTR [rax+0x2c],0x2
   1400043ee:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400043f2:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
   1400043f5:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   1400043f8:	7d 0a                	jge    0x140004404
   1400043fa:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400043fe:	8b 40 2c             	mov    eax,DWORD PTR [rax+0x2c]
   140004401:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140004404:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004408:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000440b:	83 45 fc 02          	add    DWORD PTR [rbp-0x4],0x2
   14000440f:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   140004412:	7d 15                	jge    0x140004429
   140004414:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004418:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000441b:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
   14000441e:	89 c2                	mov    edx,eax
   140004420:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004424:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004427:	eb 0b                	jmp    0x140004434
   140004429:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000442d:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   140004434:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   140004438:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   14000443c:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   14000443f:	49 89 c9             	mov    r9,rcx
   140004442:	41 b8 01 00 00 00    	mov    r8d,0x1
   140004448:	89 c1                	mov    ecx,eax
   14000444a:	e8 69 fb ff ff       	call   0x140003fb8
   14000444f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004453:	8b 50 2c             	mov    edx,DWORD PTR [rax+0x2c]
   140004456:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000445a:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   14000445d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004461:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004464:	0d c0 01 00 00       	or     eax,0x1c0
   140004469:	89 c2                	mov    edx,eax
   14000446b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000446f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140004472:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004476:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004479:	83 e0 20             	and    eax,0x20
   14000447c:	83 c8 45             	or     eax,0x45
   14000447f:	89 c1                	mov    ecx,eax
   140004481:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004485:	48 89 c2             	mov    rdx,rax
   140004488:	e8 63 eb ff ff       	call   0x140002ff0
   14000448d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004491:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004494:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   140004497:	83 ea 01             	sub    edx,0x1
   14000449a:	01 c2                	add    edx,eax
   14000449c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400044a0:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   1400044a3:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400044a7:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   1400044ab:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400044af:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
   1400044b3:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400044b7:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   1400044bb:	48 89 c1             	mov    rcx,rax
   1400044be:	e8 ab ef ff ff       	call   0x14000346e
   1400044c3:	90                   	nop
   1400044c4:	48 83 c4 50          	add    rsp,0x50
   1400044c8:	5d                   	pop    rbp
   1400044c9:	c3                   	ret
   1400044ca:	55                   	push   rbp
   1400044cb:	53                   	push   rbx
   1400044cc:	48 83 ec 58          	sub    rsp,0x58
   1400044d0:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   1400044d5:	48 89 cb             	mov    rbx,rcx
   1400044d8:	db 2b                	fld    TBYTE PTR [rbx]
   1400044da:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   1400044dd:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   1400044e1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400044e5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400044e8:	85 c0                	test   eax,eax
   1400044ea:	79 0b                	jns    0x1400044f7
   1400044ec:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400044f0:	c7 40 10 06 00 00 00 	mov    DWORD PTR [rax+0x10],0x6
   1400044f7:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400044fb:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   1400044fe:	db 6d e0             	fld    TBYTE PTR [rbp-0x20]
   140004501:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140004504:	4c 8d 45 f4          	lea    r8,[rbp-0xc]
   140004508:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   14000450c:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   140004510:	4d 89 c1             	mov    r9,r8
   140004513:	49 89 c8             	mov    r8,rcx
   140004516:	48 89 c1             	mov    rcx,rax
   140004519:	e8 ab f7 ff ff       	call   0x140003cc9
   14000451e:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140004522:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   140004525:	3d 00 80 ff ff       	cmp    eax,0xffff8000
   14000452a:	75 17                	jne    0x140004543
   14000452c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   14000452f:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   140004533:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140004537:	49 89 c8             	mov    r8,rcx
   14000453a:	89 c1                	mov    ecx,eax
   14000453c:	e8 8c f9 ff ff       	call   0x140003ecd
   140004541:	eb 43                	jmp    0x140004586
   140004543:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
   140004546:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   140004549:	4c 8b 45 28          	mov    r8,QWORD PTR [rbp+0x28]
   14000454d:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140004551:	4d 89 c1             	mov    r9,r8
   140004554:	41 89 c8             	mov    r8d,ecx
   140004557:	89 c1                	mov    ecx,eax
   140004559:	e8 5a fa ff ff       	call   0x140003fb8
   14000455e:	eb 11                	jmp    0x140004571
   140004560:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004564:	48 89 c2             	mov    rdx,rax
   140004567:	b9 20 00 00 00       	mov    ecx,0x20
   14000456c:	e8 7f ea ff ff       	call   0x140002ff0
   140004571:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004575:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004578:	8d 48 ff             	lea    ecx,[rax-0x1]
   14000457b:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   14000457f:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140004582:	85 c0                	test   eax,eax
   140004584:	7f da                	jg     0x140004560
   140004586:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000458a:	48 89 c1             	mov    rcx,rax
   14000458d:	e8 8d 18 00 00       	call   0x140005e1f
   140004592:	90                   	nop
   140004593:	48 83 c4 58          	add    rsp,0x58
   140004597:	5b                   	pop    rbx
   140004598:	5d                   	pop    rbp
   140004599:	c3                   	ret
   14000459a:	55                   	push   rbp
   14000459b:	53                   	push   rbx
   14000459c:	48 83 ec 58          	sub    rsp,0x58
   1400045a0:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   1400045a5:	48 89 cb             	mov    rbx,rcx
   1400045a8:	db 2b                	fld    TBYTE PTR [rbx]
   1400045aa:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   1400045ad:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   1400045b1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400045b5:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400045b8:	85 c0                	test   eax,eax
   1400045ba:	79 0b                	jns    0x1400045c7
   1400045bc:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400045c0:	c7 40 10 06 00 00 00 	mov    DWORD PTR [rax+0x10],0x6
   1400045c7:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400045cb:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400045ce:	8d 50 01             	lea    edx,[rax+0x1]
   1400045d1:	db 6d e0             	fld    TBYTE PTR [rbp-0x20]
   1400045d4:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   1400045d7:	4c 8d 45 f4          	lea    r8,[rbp-0xc]
   1400045db:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1400045df:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   1400045e3:	4d 89 c1             	mov    r9,r8
   1400045e6:	49 89 c8             	mov    r8,rcx
   1400045e9:	48 89 c1             	mov    rcx,rax
   1400045ec:	e8 86 f6 ff ff       	call   0x140003c77
   1400045f1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400045f5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400045f8:	3d 00 80 ff ff       	cmp    eax,0xffff8000
   1400045fd:	75 17                	jne    0x140004616
   1400045ff:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   140004602:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   140004606:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   14000460a:	49 89 c8             	mov    r8,rcx
   14000460d:	89 c1                	mov    ecx,eax
   14000460f:	e8 b9 f8 ff ff       	call   0x140003ecd
   140004614:	eb 1b                	jmp    0x140004631
   140004616:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
   140004619:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   14000461c:	4c 8b 45 28          	mov    r8,QWORD PTR [rbp+0x28]
   140004620:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140004624:	4d 89 c1             	mov    r9,r8
   140004627:	41 89 c8             	mov    r8d,ecx
   14000462a:	89 c1                	mov    ecx,eax
   14000462c:	e8 51 fd ff ff       	call   0x140004382
   140004631:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140004635:	48 89 c1             	mov    rcx,rax
   140004638:	e8 e2 17 00 00       	call   0x140005e1f
   14000463d:	90                   	nop
   14000463e:	48 83 c4 58          	add    rsp,0x58
   140004642:	5b                   	pop    rbx
   140004643:	5d                   	pop    rbp
   140004644:	c3                   	ret
   140004645:	55                   	push   rbp
   140004646:	53                   	push   rbx
   140004647:	48 83 ec 58          	sub    rsp,0x58
   14000464b:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   140004650:	48 89 cb             	mov    rbx,rcx
   140004653:	db 2b                	fld    TBYTE PTR [rbx]
   140004655:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   140004658:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   14000465c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004660:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004663:	85 c0                	test   eax,eax
   140004665:	79 0d                	jns    0x140004674
   140004667:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000466b:	c7 40 10 06 00 00 00 	mov    DWORD PTR [rax+0x10],0x6
   140004672:	eb 16                	jmp    0x14000468a
   140004674:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004678:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000467b:	85 c0                	test   eax,eax
   14000467d:	75 0b                	jne    0x14000468a
   14000467f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004683:	c7 40 10 01 00 00 00 	mov    DWORD PTR [rax+0x10],0x1
   14000468a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000468e:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   140004691:	db 6d e0             	fld    TBYTE PTR [rbp-0x20]
   140004694:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140004697:	4c 8d 45 f4          	lea    r8,[rbp-0xc]
   14000469b:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   14000469f:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   1400046a3:	4d 89 c1             	mov    r9,r8
   1400046a6:	49 89 c8             	mov    r8,rcx
   1400046a9:	48 89 c1             	mov    rcx,rax
   1400046ac:	e8 c6 f5 ff ff       	call   0x140003c77
   1400046b1:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400046b5:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400046b8:	3d 00 80 ff ff       	cmp    eax,0xffff8000
   1400046bd:	75 1a                	jne    0x1400046d9
   1400046bf:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   1400046c2:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   1400046c6:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   1400046ca:	49 89 c8             	mov    r8,rcx
   1400046cd:	89 c1                	mov    ecx,eax
   1400046cf:	e8 f9 f7 ff ff       	call   0x140003ecd
   1400046d4:	e9 2b 01 00 00       	jmp    0x140004804
   1400046d9:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400046dc:	83 f8 fd             	cmp    eax,0xfffffffd
   1400046df:	0f 8c c9 00 00 00    	jl     0x1400047ae
   1400046e5:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400046e9:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   1400046ec:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400046ef:	39 c2                	cmp    edx,eax
   1400046f1:	0f 8c b7 00 00 00    	jl     0x1400047ae
   1400046f7:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400046fb:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400046fe:	25 00 08 00 00       	and    eax,0x800
   140004703:	85 c0                	test   eax,eax
   140004705:	74 15                	je     0x14000471c
   140004707:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000470b:	8b 50 10             	mov    edx,DWORD PTR [rax+0x10]
   14000470e:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   140004711:	29 c2                	sub    edx,eax
   140004713:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004717:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   14000471a:	eb 4d                	jmp    0x140004769
   14000471c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140004720:	48 89 c1             	mov    rcx,rax
   140004723:	e8 40 50 00 00       	call   0x140009768
   140004728:	89 c1                	mov    ecx,eax
   14000472a:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   14000472d:	89 c2                	mov    edx,eax
   14000472f:	89 c8                	mov    eax,ecx
   140004731:	29 d0                	sub    eax,edx
   140004733:	89 c2                	mov    edx,eax
   140004735:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004739:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   14000473c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004740:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004743:	85 c0                	test   eax,eax
   140004745:	79 22                	jns    0x140004769
   140004747:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000474b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000474e:	85 c0                	test   eax,eax
   140004750:	7e 17                	jle    0x140004769
   140004752:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004756:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140004759:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000475d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004760:	01 c2                	add    edx,eax
   140004762:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004766:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004769:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
   14000476c:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   14000476f:	4c 8b 45 28          	mov    r8,QWORD PTR [rbp+0x28]
   140004773:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140004777:	4d 89 c1             	mov    r9,r8
   14000477a:	41 89 c8             	mov    r8d,ecx
   14000477d:	89 c1                	mov    ecx,eax
   14000477f:	e8 34 f8 ff ff       	call   0x140003fb8
   140004784:	eb 11                	jmp    0x140004797
   140004786:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000478a:	48 89 c2             	mov    rdx,rax
   14000478d:	b9 20 00 00 00       	mov    ecx,0x20
   140004792:	e8 59 e8 ff ff       	call   0x140002ff0
   140004797:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000479b:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000479e:	8d 48 ff             	lea    ecx,[rax-0x1]
   1400047a1:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   1400047a5:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   1400047a8:	85 c0                	test   eax,eax
   1400047aa:	7f da                	jg     0x140004786
   1400047ac:	eb 56                	jmp    0x140004804
   1400047ae:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400047b2:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400047b5:	25 00 08 00 00       	and    eax,0x800
   1400047ba:	85 c0                	test   eax,eax
   1400047bc:	74 13                	je     0x1400047d1
   1400047be:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400047c2:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400047c5:	8d 50 ff             	lea    edx,[rax-0x1]
   1400047c8:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400047cc:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   1400047cf:	eb 18                	jmp    0x1400047e9
   1400047d1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400047d5:	48 89 c1             	mov    rcx,rax
   1400047d8:	e8 8b 4f 00 00       	call   0x140009768
   1400047dd:	83 e8 01             	sub    eax,0x1
   1400047e0:	89 c2                	mov    edx,eax
   1400047e2:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400047e6:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   1400047e9:	8b 4d f0             	mov    ecx,DWORD PTR [rbp-0x10]
   1400047ec:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   1400047ef:	4c 8b 45 28          	mov    r8,QWORD PTR [rbp+0x28]
   1400047f3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   1400047f7:	4d 89 c1             	mov    r9,r8
   1400047fa:	41 89 c8             	mov    r8d,ecx
   1400047fd:	89 c1                	mov    ecx,eax
   1400047ff:	e8 7e fb ff ff       	call   0x140004382
   140004804:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140004808:	48 89 c1             	mov    rcx,rax
   14000480b:	e8 0f 16 00 00       	call   0x140005e1f
   140004810:	90                   	nop
   140004811:	48 83 c4 58          	add    rsp,0x58
   140004815:	5b                   	pop    rbx
   140004816:	5d                   	pop    rbp
   140004817:	c3                   	ret
   140004818:	55                   	push   rbp
   140004819:	53                   	push   rbx
   14000481a:	48 81 ec 88 00 00 00 	sub    rsp,0x88
   140004821:	48 8d ac 24 80 00 00 	lea    rbp,[rsp+0x80]
   140004828:	00 
   140004829:	48 89 cb             	mov    rbx,rcx
   14000482c:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140004830:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004834:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140004838:	66 c7 45 f6 02 00    	mov    WORD PTR [rbp-0xa],0x2
   14000483e:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140004841:	48 85 c0             	test   rax,rax
   140004844:	75 09                	jne    0x14000484f
   140004846:	0f b7 43 08          	movzx  eax,WORD PTR [rbx+0x8]
   14000484a:	66 85 c0             	test   ax,ax
   14000484d:	74 0b                	je     0x14000485a
   14000484f:	0f b7 43 08          	movzx  eax,WORD PTR [rbx+0x8]
   140004853:	83 e8 03             	sub    eax,0x3
   140004856:	66 89 43 08          	mov    WORD PTR [rbx+0x8],ax
   14000485a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000485e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004861:	85 c0                	test   eax,eax
   140004863:	0f 88 90 00 00 00    	js     0x1400048f9
   140004869:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000486d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004870:	83 f8 0e             	cmp    eax,0xe
   140004873:	0f 8f 80 00 00 00    	jg     0x1400048f9
   140004879:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   14000487c:	48 d1 e8             	shr    rax,1
   14000487f:	48 89 03             	mov    QWORD PTR [rbx],rax
   140004882:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140004885:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004889:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000488c:	b9 0e 00 00 00       	mov    ecx,0xe
   140004891:	29 c1                	sub    ecx,eax
   140004893:	8d 04 8d 00 00 00 00 	lea    eax,[rcx*4+0x0]
   14000489a:	41 b8 04 00 00 00    	mov    r8d,0x4
   1400048a0:	89 c1                	mov    ecx,eax
   1400048a2:	49 d3 e0             	shl    r8,cl
   1400048a5:	4c 89 c0             	mov    rax,r8
   1400048a8:	48 01 d0             	add    rax,rdx
   1400048ab:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400048ae:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400048b1:	48 85 c0             	test   rax,rax
   1400048b4:	78 0b                	js     0x1400048c1
   1400048b6:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400048b9:	48 01 c0             	add    rax,rax
   1400048bc:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400048bf:	eb 15                	jmp    0x1400048d6
   1400048c1:	0f b7 43 08          	movzx  eax,WORD PTR [rbx+0x8]
   1400048c5:	83 c0 04             	add    eax,0x4
   1400048c8:	66 89 43 08          	mov    WORD PTR [rbx+0x8],ax
   1400048cc:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400048cf:	48 c1 e8 03          	shr    rax,0x3
   1400048d3:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400048d6:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   1400048d9:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400048dd:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400048e0:	b9 0f 00 00 00       	mov    ecx,0xf
   1400048e5:	29 c1                	sub    ecx,eax
   1400048e7:	8d 04 8d 00 00 00 00 	lea    eax,[rcx*4+0x0]
   1400048ee:	89 c1                	mov    ecx,eax
   1400048f0:	48 d3 ea             	shr    rdx,cl
   1400048f3:	48 89 d0             	mov    rax,rdx
   1400048f6:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400048f9:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400048fc:	48 85 c0             	test   rax,rax
   1400048ff:	75 0f                	jne    0x140004910
   140004901:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004905:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004908:	85 c0                	test   eax,eax
   14000490a:	0f 8e f8 00 00 00    	jle    0x140004a08
   140004910:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004914:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004917:	83 f8 0e             	cmp    eax,0xe
   14000491a:	7f 1a                	jg     0x140004936
   14000491c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004920:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004923:	85 c0                	test   eax,eax
   140004925:	78 0f                	js     0x140004936
   140004927:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000492b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000492e:	83 c0 01             	add    eax,0x1
   140004931:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
   140004934:	eb 07                	jmp    0x14000493d
   140004936:	c7 45 f0 10 00 00 00 	mov    DWORD PTR [rbp-0x10],0x10
   14000493d:	e9 bc 00 00 00       	jmp    0x1400049fe
   140004942:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140004945:	83 e0 0f             	and    eax,0xf
   140004948:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   14000494b:	83 7d f0 01          	cmp    DWORD PTR [rbp-0x10],0x1
   14000494f:	75 36                	jne    0x140004987
   140004951:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004955:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
   140004959:	72 1b                	jb     0x140004976
   14000495b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000495f:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004962:	25 00 08 00 00       	and    eax,0x800
   140004967:	85 c0                	test   eax,eax
   140004969:	75 0b                	jne    0x140004976
   14000496b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000496f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004972:	85 c0                	test   eax,eax
   140004974:	7e 2d                	jle    0x1400049a3
   140004976:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000497a:	48 8d 50 01          	lea    rdx,[rax+0x1]
   14000497e:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140004982:	c6 00 2e             	mov    BYTE PTR [rax],0x2e
   140004985:	eb 1c                	jmp    0x1400049a3
   140004987:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000498b:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000498e:	85 c0                	test   eax,eax
   140004990:	7e 11                	jle    0x1400049a3
   140004992:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004996:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004999:	8d 50 ff             	lea    edx,[rax-0x1]
   14000499c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400049a0:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   1400049a3:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   1400049a7:	75 15                	jne    0x1400049be
   1400049a9:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   1400049ad:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
   1400049b1:	72 0b                	jb     0x1400049be
   1400049b3:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400049b7:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   1400049ba:	85 c0                	test   eax,eax
   1400049bc:	78 32                	js     0x1400049f0
   1400049be:	83 7d e4 09          	cmp    DWORD PTR [rbp-0x1c],0x9
   1400049c2:	76 16                	jbe    0x1400049da
   1400049c4:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   1400049c7:	8d 50 37             	lea    edx,[rax+0x37]
   1400049ca:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400049ce:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400049d1:	83 e0 20             	and    eax,0x20
   1400049d4:	09 d0                	or     eax,edx
   1400049d6:	89 c1                	mov    ecx,eax
   1400049d8:	eb 08                	jmp    0x1400049e2
   1400049da:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   1400049dd:	83 c0 30             	add    eax,0x30
   1400049e0:	89 c1                	mov    ecx,eax
   1400049e2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400049e6:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400049ea:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   1400049ee:	88 08                	mov    BYTE PTR [rax],cl
   1400049f0:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400049f3:	48 c1 e8 04          	shr    rax,0x4
   1400049f7:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400049fa:	83 6d f0 01          	sub    DWORD PTR [rbp-0x10],0x1
   1400049fe:	83 7d f0 00          	cmp    DWORD PTR [rbp-0x10],0x0
   140004a02:	0f 8f 3a ff ff ff    	jg     0x140004942
   140004a08:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004a0c:	48 39 45 f8          	cmp    QWORD PTR [rbp-0x8],rax
   140004a10:	75 39                	jne    0x140004a4b
   140004a12:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004a16:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004a19:	85 c0                	test   eax,eax
   140004a1b:	7f 10                	jg     0x140004a2d
   140004a1d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004a21:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004a24:	25 00 08 00 00       	and    eax,0x800
   140004a29:	85 c0                	test   eax,eax
   140004a2b:	74 0f                	je     0x140004a3c
   140004a2d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140004a31:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140004a35:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140004a39:	c6 00 2e             	mov    BYTE PTR [rax],0x2e
   140004a3c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140004a40:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140004a44:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140004a48:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140004a4b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004a4f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004a52:	85 c0                	test   eax,eax
   140004a54:	0f 8e e3 00 00 00    	jle    0x140004b3d
   140004a5a:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004a5e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140004a62:	48 29 c2             	sub    rdx,rax
   140004a65:	89 55 ec             	mov    DWORD PTR [rbp-0x14],edx
   140004a68:	0f b7 43 08          	movzx  eax,WORD PTR [rbx+0x8]
   140004a6c:	98                   	cwde
   140004a6d:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140004a70:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004a74:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004a77:	85 c0                	test   eax,eax
   140004a79:	7e 0a                	jle    0x140004a85
   140004a7b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004a7f:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004a82:	01 45 ec             	add    DWORD PTR [rbp-0x14],eax
   140004a85:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004a89:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004a8c:	25 c0 01 00 00       	and    eax,0x1c0
   140004a91:	85 c0                	test   eax,eax
   140004a93:	74 07                	je     0x140004a9c
   140004a95:	b8 06 00 00 00       	mov    eax,0x6
   140004a9a:	eb 05                	jmp    0x140004aa1
   140004a9c:	b8 05 00 00 00       	mov    eax,0x5
   140004aa1:	01 45 ec             	add    DWORD PTR [rbp-0x14],eax
   140004aa4:	eb 0f                	jmp    0x140004ab5
   140004aa6:	83 45 ec 01          	add    DWORD PTR [rbp-0x14],0x1
   140004aaa:	0f b7 45 f6          	movzx  eax,WORD PTR [rbp-0xa]
   140004aae:	83 c0 01             	add    eax,0x1
   140004ab1:	66 89 45 f6          	mov    WORD PTR [rbp-0xa],ax
   140004ab5:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140004ab8:	48 63 d0             	movsxd rdx,eax
   140004abb:	48 69 d2 67 66 66 66 	imul   rdx,rdx,0x66666667
   140004ac2:	48 c1 ea 20          	shr    rdx,0x20
   140004ac6:	89 d1                	mov    ecx,edx
   140004ac8:	c1 f9 02             	sar    ecx,0x2
   140004acb:	99                   	cdq
   140004acc:	89 c8                	mov    eax,ecx
   140004ace:	29 d0                	sub    eax,edx
   140004ad0:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140004ad3:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
   140004ad7:	75 cd                	jne    0x140004aa6
   140004ad9:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004add:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004ae0:	39 45 ec             	cmp    DWORD PTR [rbp-0x14],eax
   140004ae3:	7d 4d                	jge    0x140004b32
   140004ae5:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004ae9:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004aec:	2b 45 ec             	sub    eax,DWORD PTR [rbp-0x14]
   140004aef:	89 c2                	mov    edx,eax
   140004af1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004af5:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004af8:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004afc:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004aff:	25 00 06 00 00       	and    eax,0x600
   140004b04:	85 c0                	test   eax,eax
   140004b06:	75 35                	jne    0x140004b3d
   140004b08:	eb 11                	jmp    0x140004b1b
   140004b0a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b0e:	48 89 c2             	mov    rdx,rax
   140004b11:	b9 20 00 00 00       	mov    ecx,0x20
   140004b16:	e8 d5 e4 ff ff       	call   0x140002ff0
   140004b1b:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b1f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004b22:	8d 48 ff             	lea    ecx,[rax-0x1]
   140004b25:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004b29:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140004b2c:	85 c0                	test   eax,eax
   140004b2e:	7f da                	jg     0x140004b0a
   140004b30:	eb 0b                	jmp    0x140004b3d
   140004b32:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b36:	c7 40 0c ff ff ff ff 	mov    DWORD PTR [rax+0xc],0xffffffff
   140004b3d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b41:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004b44:	25 80 00 00 00       	and    eax,0x80
   140004b49:	85 c0                	test   eax,eax
   140004b4b:	74 13                	je     0x140004b60
   140004b4d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b51:	48 89 c2             	mov    rdx,rax
   140004b54:	b9 2d 00 00 00       	mov    ecx,0x2d
   140004b59:	e8 92 e4 ff ff       	call   0x140002ff0
   140004b5e:	eb 42                	jmp    0x140004ba2
   140004b60:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b64:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004b67:	25 00 01 00 00       	and    eax,0x100
   140004b6c:	85 c0                	test   eax,eax
   140004b6e:	74 13                	je     0x140004b83
   140004b70:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b74:	48 89 c2             	mov    rdx,rax
   140004b77:	b9 2b 00 00 00       	mov    ecx,0x2b
   140004b7c:	e8 6f e4 ff ff       	call   0x140002ff0
   140004b81:	eb 1f                	jmp    0x140004ba2
   140004b83:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b87:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004b8a:	83 e0 40             	and    eax,0x40
   140004b8d:	85 c0                	test   eax,eax
   140004b8f:	74 11                	je     0x140004ba2
   140004b91:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004b95:	48 89 c2             	mov    rdx,rax
   140004b98:	b9 20 00 00 00       	mov    ecx,0x20
   140004b9d:	e8 4e e4 ff ff       	call   0x140002ff0
   140004ba2:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004ba6:	48 89 c2             	mov    rdx,rax
   140004ba9:	b9 30 00 00 00       	mov    ecx,0x30
   140004bae:	e8 3d e4 ff ff       	call   0x140002ff0
   140004bb3:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004bb7:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004bba:	83 e0 20             	and    eax,0x20
   140004bbd:	83 c8 58             	or     eax,0x58
   140004bc0:	89 c1                	mov    ecx,eax
   140004bc2:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004bc6:	48 89 c2             	mov    rdx,rax
   140004bc9:	e8 22 e4 ff ff       	call   0x140002ff0
   140004bce:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004bd2:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004bd5:	85 c0                	test   eax,eax
   140004bd7:	7e 54                	jle    0x140004c2d
   140004bd9:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004bdd:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004be0:	25 00 02 00 00       	and    eax,0x200
   140004be5:	85 c0                	test   eax,eax
   140004be7:	74 44                	je     0x140004c2d
   140004be9:	eb 11                	jmp    0x140004bfc
   140004beb:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004bef:	48 89 c2             	mov    rdx,rax
   140004bf2:	b9 30 00 00 00       	mov    ecx,0x30
   140004bf7:	e8 f4 e3 ff ff       	call   0x140002ff0
   140004bfc:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c00:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140004c03:	8d 48 ff             	lea    ecx,[rax-0x1]
   140004c06:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004c0a:	89 4a 0c             	mov    DWORD PTR [rdx+0xc],ecx
   140004c0d:	85 c0                	test   eax,eax
   140004c0f:	7f da                	jg     0x140004beb
   140004c11:	eb 1a                	jmp    0x140004c2d
   140004c13:	48 83 6d f8 01       	sub    QWORD PTR [rbp-0x8],0x1
   140004c18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140004c1c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140004c1f:	0f be c0             	movsx  eax,al
   140004c22:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004c26:	89 c1                	mov    ecx,eax
   140004c28:	e8 33 f2 ff ff       	call   0x140003e60
   140004c2d:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004c31:	48 3b 45 f8          	cmp    rax,QWORD PTR [rbp-0x8]
   140004c35:	72 dc                	jb     0x140004c13
   140004c37:	eb 11                	jmp    0x140004c4a
   140004c39:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c3d:	48 89 c2             	mov    rdx,rax
   140004c40:	b9 30 00 00 00       	mov    ecx,0x30
   140004c45:	e8 a6 e3 ff ff       	call   0x140002ff0
   140004c4a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c4e:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140004c51:	8d 48 ff             	lea    ecx,[rax-0x1]
   140004c54:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004c58:	89 4a 10             	mov    DWORD PTR [rdx+0x10],ecx
   140004c5b:	85 c0                	test   eax,eax
   140004c5d:	7f da                	jg     0x140004c39
   140004c5f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c63:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004c66:	83 e0 20             	and    eax,0x20
   140004c69:	83 c8 50             	or     eax,0x50
   140004c6c:	89 c1                	mov    ecx,eax
   140004c6e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c72:	48 89 c2             	mov    rdx,rax
   140004c75:	e8 76 e3 ff ff       	call   0x140002ff0
   140004c7a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c7e:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140004c81:	0f bf 45 f6          	movsx  eax,WORD PTR [rbp-0xa]
   140004c85:	01 c2                	add    edx,eax
   140004c87:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c8b:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140004c8e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004c92:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004c95:	0d c0 01 00 00       	or     eax,0x1c0
   140004c9a:	89 c2                	mov    edx,eax
   140004c9c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004ca0:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140004ca3:	0f b7 43 08          	movzx  eax,WORD PTR [rbx+0x8]
   140004ca7:	66 85 c0             	test   ax,ax
   140004caa:	79 09                	jns    0x140004cb5
   140004cac:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
   140004cb3:	eb 05                	jmp    0x140004cba
   140004cb5:	b8 00 00 00 00       	mov    eax,0x0
   140004cba:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140004cbe:	0f b7 43 08          	movzx  eax,WORD PTR [rbx+0x8]
   140004cc2:	48 0f bf c0          	movsx  rax,ax
   140004cc6:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140004cca:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
   140004cce:	48 8b 55 b8          	mov    rdx,QWORD PTR [rbp-0x48]
   140004cd2:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   140004cd6:	48 89 55 a8          	mov    QWORD PTR [rbp-0x58],rdx
   140004cda:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004cde:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   140004ce2:	48 89 c1             	mov    rcx,rax
   140004ce5:	e8 84 e7 ff ff       	call   0x14000346e
   140004cea:	90                   	nop
   140004ceb:	48 81 c4 88 00 00 00 	add    rsp,0x88
   140004cf2:	5b                   	pop    rbx
   140004cf3:	5d                   	pop    rbp
   140004cf4:	c3                   	ret
   140004cf5:	55                   	push   rbp
   140004cf6:	53                   	push   rbx
   140004cf7:	48 83 ec 78          	sub    rsp,0x78
   140004cfb:	48 8d 6c 24 70       	lea    rbp,[rsp+0x70]
   140004d00:	48 89 cb             	mov    rbx,rcx
   140004d03:	db 2b                	fld    TBYTE PTR [rbx]
   140004d05:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140004d08:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140004d0c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140004d13:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140004d17:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140004d1a:	db 7d c0             	fstp   TBYTE PTR [rbp-0x40]
   140004d1d:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   140004d21:	48 89 c1             	mov    rcx,rax
   140004d24:	e8 e6 ed ff ff       	call   0x140003b0f
   140004d29:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140004d2c:	db 7d c0             	fstp   TBYTE PTR [rbp-0x40]
   140004d2f:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004d33:	48 89 c1             	mov    rcx,rax
   140004d36:	e8 15 3f 00 00       	call   0x140008c50
   140004d3b:	85 c0                	test   eax,eax
   140004d3d:	74 1d                	je     0x140004d5c
   140004d3f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140004d42:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   140004d46:	48 8d 15 f9 67 00 00 	lea    rdx,[rip+0x67f9]        # 0x14000b546
   140004d4d:	49 89 c8             	mov    r8,rcx
   140004d50:	89 c1                	mov    ecx,eax
   140004d52:	e8 76 f1 ff ff       	call   0x140003ecd
   140004d57:	e9 aa 00 00 00       	jmp    0x140004e06
   140004d5c:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004d60:	98                   	cwde
   140004d61:	25 00 80 00 00       	and    eax,0x8000
   140004d66:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140004d69:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140004d6d:	74 12                	je     0x140004d81
   140004d6f:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004d73:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004d76:	0c 80                	or     al,0x80
   140004d78:	89 c2                	mov    edx,eax
   140004d7a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140004d7e:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140004d81:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140004d84:	db 7d c0             	fstp   TBYTE PTR [rbp-0x40]
   140004d87:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004d8b:	48 89 c1             	mov    rcx,rax
   140004d8e:	e8 cd 3d 00 00       	call   0x140008b60
   140004d93:	3d 00 05 00 00       	cmp    eax,0x500
   140004d98:	75 1a                	jne    0x140004db4
   140004d9a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140004d9d:	48 8b 4d 28          	mov    rcx,QWORD PTR [rbp+0x28]
   140004da1:	48 8d 15 a2 67 00 00 	lea    rdx,[rip+0x67a2]        # 0x14000b54a
   140004da8:	49 89 c8             	mov    r8,rcx
   140004dab:	89 c1                	mov    ecx,eax
   140004dad:	e8 1b f1 ff ff       	call   0x140003ecd
   140004db2:	eb 52                	jmp    0x140004e06
   140004db4:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004db8:	66 25 ff 7f          	and    ax,0x7fff
   140004dbc:	66 89 45 e8          	mov    WORD PTR [rbp-0x18],ax
   140004dc0:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004dc4:	66 85 c0             	test   ax,ax
   140004dc7:	75 11                	jne    0x140004dda
   140004dc9:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140004dcd:	48 85 c0             	test   rax,rax
   140004dd0:	74 14                	je     0x140004de6
   140004dd2:	66 c7 45 e8 02 c0    	mov    WORD PTR [rbp-0x18],0xc002
   140004dd8:	eb 0c                	jmp    0x140004de6
   140004dda:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004dde:	66 2d ff 3f          	sub    ax,0x3fff
   140004de2:	66 89 45 e8          	mov    WORD PTR [rbp-0x18],ax
   140004de6:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140004dea:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   140004dee:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140004df2:	48 89 55 b8          	mov    QWORD PTR [rbp-0x48],rdx
   140004df6:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140004dfa:	48 8d 45 b0          	lea    rax,[rbp-0x50]
   140004dfe:	48 89 c1             	mov    rcx,rax
   140004e01:	e8 12 fa ff ff       	call   0x140004818
   140004e06:	90                   	nop
   140004e07:	48 83 c4 78          	add    rsp,0x78
   140004e0b:	5b                   	pop    rbx
   140004e0c:	5d                   	pop    rbp
   140004e0d:	c3                   	ret
   140004e0e:	55                   	push   rbp
   140004e0f:	48 89 e5             	mov    rbp,rsp
   140004e12:	48 83 ec 60          	sub    rsp,0x60
   140004e16:	f2 0f 11 45 10       	movsd  QWORD PTR [rbp+0x10],xmm0
   140004e1b:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140004e1f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140004e26:	dd 45 10             	fld    QWORD PTR [rbp+0x10]
   140004e29:	48 8d 45 e0          	lea    rax,[rbp-0x20]
   140004e2d:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140004e30:	48 8d 55 d0          	lea    rdx,[rbp-0x30]
   140004e34:	48 89 c1             	mov    rcx,rax
   140004e37:	e8 d3 ec ff ff       	call   0x140003b0f
   140004e3c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140004e40:	66 48 0f 6e c0       	movq   xmm0,rax
   140004e45:	e8 a6 3d 00 00       	call   0x140008bf0
   140004e4a:	85 c0                	test   eax,eax
   140004e4c:	74 1d                	je     0x140004e6b
   140004e4e:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140004e51:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   140004e55:	48 8d 15 ea 66 00 00 	lea    rdx,[rip+0x66ea]        # 0x14000b546
   140004e5c:	49 89 c8             	mov    r8,rcx
   140004e5f:	89 c1                	mov    ecx,eax
   140004e61:	e8 67 f0 ff ff       	call   0x140003ecd
   140004e66:	e9 f9 00 00 00       	jmp    0x140004f64
   140004e6b:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004e6f:	98                   	cwde
   140004e70:	25 00 80 00 00       	and    eax,0x8000
   140004e75:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140004e78:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140004e7c:	74 12                	je     0x140004e90
   140004e7e:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140004e82:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140004e85:	0c 80                	or     al,0x80
   140004e87:	89 c2                	mov    edx,eax
   140004e89:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140004e8d:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140004e90:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140004e94:	66 48 0f 6e c0       	movq   xmm0,rax
   140004e99:	e8 42 3c 00 00       	call   0x140008ae0
   140004e9e:	3d 00 05 00 00       	cmp    eax,0x500
   140004ea3:	75 1d                	jne    0x140004ec2
   140004ea5:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140004ea8:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   140004eac:	48 8d 15 97 66 00 00 	lea    rdx,[rip+0x6697]        # 0x14000b54a
   140004eb3:	49 89 c8             	mov    r8,rcx
   140004eb6:	89 c1                	mov    ecx,eax
   140004eb8:	e8 10 f0 ff ff       	call   0x140003ecd
   140004ebd:	e9 a2 00 00 00       	jmp    0x140004f64
   140004ec2:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004ec6:	66 25 ff 7f          	and    ax,0x7fff
   140004eca:	66 89 45 e8          	mov    WORD PTR [rbp-0x18],ax
   140004ece:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004ed2:	66 85 c0             	test   ax,ax
   140004ed5:	74 3b                	je     0x140004f12
   140004ed7:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004edb:	66 3d 00 3c          	cmp    ax,0x3c00
   140004edf:	7f 31                	jg     0x140004f12
   140004ee1:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004ee5:	98                   	cwde
   140004ee6:	ba 01 3c 00 00       	mov    edx,0x3c01
   140004eeb:	29 c2                	sub    edx,eax
   140004eed:	89 55 f8             	mov    DWORD PTR [rbp-0x8],edx
   140004ef0:	48 8b 55 e0          	mov    rdx,QWORD PTR [rbp-0x20]
   140004ef4:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140004ef7:	89 c1                	mov    ecx,eax
   140004ef9:	48 d3 ea             	shr    rdx,cl
   140004efc:	48 89 d0             	mov    rax,rdx
   140004eff:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140004f03:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004f07:	89 c2                	mov    edx,eax
   140004f09:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140004f0c:	01 d0                	add    eax,edx
   140004f0e:	66 89 45 e8          	mov    WORD PTR [rbp-0x18],ax
   140004f12:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004f16:	66 85 c0             	test   ax,ax
   140004f19:	75 11                	jne    0x140004f2c
   140004f1b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140004f1f:	48 85 c0             	test   rax,rax
   140004f22:	74 14                	je     0x140004f38
   140004f24:	66 c7 45 e8 05 fc    	mov    WORD PTR [rbp-0x18],0xfc05
   140004f2a:	eb 0c                	jmp    0x140004f38
   140004f2c:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140004f30:	66 2d fc 3f          	sub    ax,0x3ffc
   140004f34:	66 89 45 e8          	mov    WORD PTR [rbp-0x18],ax
   140004f38:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140004f3c:	48 c1 e8 03          	shr    rax,0x3
   140004f40:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140004f44:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140004f48:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   140004f4c:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   140004f50:	48 89 55 c8          	mov    QWORD PTR [rbp-0x38],rdx
   140004f54:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140004f58:	48 8d 45 c0          	lea    rax,[rbp-0x40]
   140004f5c:	48 89 c1             	mov    rcx,rax
   140004f5f:	e8 b4 f8 ff ff       	call   0x140004818
   140004f64:	90                   	nop
   140004f65:	48 83 c4 60          	add    rsp,0x60
   140004f69:	5d                   	pop    rbp
   140004f6a:	c3                   	ret
   140004f6b:	55                   	push   rbp
   140004f6c:	48 89 e5             	mov    rbp,rsp
   140004f6f:	48 81 ec d0 00 00 00 	sub    rsp,0xd0
   140004f76:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140004f79:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140004f7d:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140004f81:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   140004f85:	e8 0e 47 00 00       	call   0x140009698
   140004f8a:	8b 00                	mov    eax,DWORD PTR [rax]
   140004f8c:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   140004f8f:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140004f93:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   140004f97:	81 65 10 00 60 00 00 	and    DWORD PTR [rbp+0x10],0x6000
   140004f9e:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140004fa1:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140004fa4:	c7 45 ac ff ff ff ff 	mov    DWORD PTR [rbp-0x54],0xffffffff
   140004fab:	c7 45 b0 ff ff ff ff 	mov    DWORD PTR [rbp-0x50],0xffffffff
   140004fb2:	c7 45 b4 fd ff ff ff 	mov    DWORD PTR [rbp-0x4c],0xfffffffd
   140004fb9:	66 c7 45 b8 00 00    	mov    WORD PTR [rbp-0x48],0x0
   140004fbf:	c7 45 bc 00 00 00 00 	mov    DWORD PTR [rbp-0x44],0x0
   140004fc6:	66 c7 45 c0 00 00    	mov    WORD PTR [rbp-0x40],0x0
   140004fcc:	c7 45 c4 00 00 00 00 	mov    DWORD PTR [rbp-0x3c],0x0
   140004fd3:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   140004fd6:	89 45 c8             	mov    DWORD PTR [rbp-0x38],eax
   140004fd9:	c7 45 cc ff ff ff ff 	mov    DWORD PTR [rbp-0x34],0xffffffff
   140004fe0:	e9 d8 0b 00 00       	jmp    0x140005bbd
   140004fe5:	83 7d e8 25          	cmp    DWORD PTR [rbp-0x18],0x25
   140004fe9:	0f 85 c0 0b 00 00    	jne    0x140005baf
   140004fef:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140004ff6:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   140004ffd:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140005001:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140005005:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   140005009:	48 83 c0 0c          	add    rax,0xc
   14000500d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140005011:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140005014:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005017:	c7 45 b0 ff ff ff ff 	mov    DWORD PTR [rbp-0x50],0xffffffff
   14000501e:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140005021:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
   140005024:	e9 75 0b 00 00       	jmp    0x140005b9e
   140005029:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000502d:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140005031:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140005035:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005038:	0f be c0             	movsx  eax,al
   14000503b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   14000503e:	83 7d e8 7a          	cmp    DWORD PTR [rbp-0x18],0x7a
   140005042:	0f 84 45 09 00 00    	je     0x14000598d
   140005048:	83 7d e8 7a          	cmp    DWORD PTR [rbp-0x18],0x7a
   14000504c:	0f 8f b3 0a 00 00    	jg     0x140005b05
   140005052:	83 7d e8 78          	cmp    DWORD PTR [rbp-0x18],0x78
   140005056:	0f 84 af 03 00 00    	je     0x14000540b
   14000505c:	83 7d e8 78          	cmp    DWORD PTR [rbp-0x18],0x78
   140005060:	0f 8f 9f 0a 00 00    	jg     0x140005b05
   140005066:	83 7d e8 75          	cmp    DWORD PTR [rbp-0x18],0x75
   14000506a:	0f 84 9b 03 00 00    	je     0x14000540b
   140005070:	83 7d e8 75          	cmp    DWORD PTR [rbp-0x18],0x75
   140005074:	0f 8f 8b 0a 00 00    	jg     0x140005b05
   14000507a:	83 7d e8 74          	cmp    DWORD PTR [rbp-0x18],0x74
   14000507e:	0f 84 f6 08 00 00    	je     0x14000597a
   140005084:	83 7d e8 74          	cmp    DWORD PTR [rbp-0x18],0x74
   140005088:	0f 8f 77 0a 00 00    	jg     0x140005b05
   14000508e:	83 7d e8 73          	cmp    DWORD PTR [rbp-0x18],0x73
   140005092:	0f 84 09 03 00 00    	je     0x1400053a1
   140005098:	83 7d e8 73          	cmp    DWORD PTR [rbp-0x18],0x73
   14000509c:	0f 8f 63 0a 00 00    	jg     0x140005b05
   1400050a2:	83 7d e8 70          	cmp    DWORD PTR [rbp-0x18],0x70
   1400050a6:	0f 84 00 05 00 00    	je     0x1400055ac
   1400050ac:	83 7d e8 70          	cmp    DWORD PTR [rbp-0x18],0x70
   1400050b0:	0f 8f 4f 0a 00 00    	jg     0x140005b05
   1400050b6:	83 7d e8 6f          	cmp    DWORD PTR [rbp-0x18],0x6f
   1400050ba:	0f 84 4b 03 00 00    	je     0x14000540b
   1400050c0:	83 7d e8 6f          	cmp    DWORD PTR [rbp-0x18],0x6f
   1400050c4:	0f 8f 3b 0a 00 00    	jg     0x140005b05
   1400050ca:	83 7d e8 6e          	cmp    DWORD PTR [rbp-0x18],0x6e
   1400050ce:	0f 84 25 07 00 00    	je     0x1400057f9
   1400050d4:	83 7d e8 6e          	cmp    DWORD PTR [rbp-0x18],0x6e
   1400050d8:	0f 8f 27 0a 00 00    	jg     0x140005b05
   1400050de:	83 7d e8 6d          	cmp    DWORD PTR [rbp-0x18],0x6d
   1400050e2:	0f 84 05 03 00 00    	je     0x1400053ed
   1400050e8:	83 7d e8 6d          	cmp    DWORD PTR [rbp-0x18],0x6d
   1400050ec:	0f 8f 13 0a 00 00    	jg     0x140005b05
   1400050f2:	83 7d e8 6c          	cmp    DWORD PTR [rbp-0x18],0x6c
   1400050f6:	0f 84 3d 08 00 00    	je     0x140005939
   1400050fc:	83 7d e8 6c          	cmp    DWORD PTR [rbp-0x18],0x6c
   140005100:	0f 8f ff 09 00 00    	jg     0x140005b05
   140005106:	83 7d e8 6a          	cmp    DWORD PTR [rbp-0x18],0x6a
   14000510a:	0f 84 b3 07 00 00    	je     0x1400058c3
   140005110:	83 7d e8 6a          	cmp    DWORD PTR [rbp-0x18],0x6a
   140005114:	0f 8f eb 09 00 00    	jg     0x140005b05
   14000511a:	83 7d e8 69          	cmp    DWORD PTR [rbp-0x18],0x69
   14000511e:	0f 84 c6 03 00 00    	je     0x1400054ea
   140005124:	83 7d e8 69          	cmp    DWORD PTR [rbp-0x18],0x69
   140005128:	0f 8f d7 09 00 00    	jg     0x140005b05
   14000512e:	83 7d e8 68          	cmp    DWORD PTR [rbp-0x18],0x68
   140005132:	0f 84 5f 07 00 00    	je     0x140005897
   140005138:	83 7d e8 68          	cmp    DWORD PTR [rbp-0x18],0x68
   14000513c:	0f 8f c3 09 00 00    	jg     0x140005b05
   140005142:	83 7d e8 67          	cmp    DWORD PTR [rbp-0x18],0x67
   140005146:	0f 84 cb 05 00 00    	je     0x140005717
   14000514c:	83 7d e8 67          	cmp    DWORD PTR [rbp-0x18],0x67
   140005150:	0f 8f af 09 00 00    	jg     0x140005b05
   140005156:	83 7d e8 66          	cmp    DWORD PTR [rbp-0x18],0x66
   14000515a:	0f 84 39 05 00 00    	je     0x140005699
   140005160:	83 7d e8 66          	cmp    DWORD PTR [rbp-0x18],0x66
   140005164:	0f 8f 9b 09 00 00    	jg     0x140005b05
   14000516a:	83 7d e8 65          	cmp    DWORD PTR [rbp-0x18],0x65
   14000516e:	0f 84 a7 04 00 00    	je     0x14000561b
   140005174:	83 7d e8 65          	cmp    DWORD PTR [rbp-0x18],0x65
   140005178:	0f 8f 87 09 00 00    	jg     0x140005b05
   14000517e:	83 7d e8 64          	cmp    DWORD PTR [rbp-0x18],0x64
   140005182:	0f 84 62 03 00 00    	je     0x1400054ea
   140005188:	83 7d e8 64          	cmp    DWORD PTR [rbp-0x18],0x64
   14000518c:	0f 8f 73 09 00 00    	jg     0x140005b05
   140005192:	83 7d e8 63          	cmp    DWORD PTR [rbp-0x18],0x63
   140005196:	0f 84 8d 01 00 00    	je     0x140005329
   14000519c:	83 7d e8 63          	cmp    DWORD PTR [rbp-0x18],0x63
   1400051a0:	0f 8f 5f 09 00 00    	jg     0x140005b05
   1400051a6:	83 7d e8 61          	cmp    DWORD PTR [rbp-0x18],0x61
   1400051aa:	0f 84 e5 05 00 00    	je     0x140005795
   1400051b0:	83 7d e8 61          	cmp    DWORD PTR [rbp-0x18],0x61
   1400051b4:	0f 8f 4b 09 00 00    	jg     0x140005b05
   1400051ba:	83 7d e8 58          	cmp    DWORD PTR [rbp-0x18],0x58
   1400051be:	0f 84 47 02 00 00    	je     0x14000540b
   1400051c4:	83 7d e8 58          	cmp    DWORD PTR [rbp-0x18],0x58
   1400051c8:	0f 8f 37 09 00 00    	jg     0x140005b05
   1400051ce:	83 7d e8 53          	cmp    DWORD PTR [rbp-0x18],0x53
   1400051d2:	0f 84 c2 01 00 00    	je     0x14000539a
   1400051d8:	83 7d e8 53          	cmp    DWORD PTR [rbp-0x18],0x53
   1400051dc:	0f 8f 23 09 00 00    	jg     0x140005b05
   1400051e2:	83 7d e8 4c          	cmp    DWORD PTR [rbp-0x18],0x4c
   1400051e6:	0f 84 79 07 00 00    	je     0x140005965
   1400051ec:	83 7d e8 4c          	cmp    DWORD PTR [rbp-0x18],0x4c
   1400051f0:	0f 8f 0f 09 00 00    	jg     0x140005b05
   1400051f6:	83 7d e8 49          	cmp    DWORD PTR [rbp-0x18],0x49
   1400051fa:	0f 84 d6 06 00 00    	je     0x1400058d6
   140005200:	83 7d e8 49          	cmp    DWORD PTR [rbp-0x18],0x49
   140005204:	0f 8f fb 08 00 00    	jg     0x140005b05
   14000520a:	83 7d e8 47          	cmp    DWORD PTR [rbp-0x18],0x47
   14000520e:	0f 84 0c 05 00 00    	je     0x140005720
   140005214:	83 7d e8 47          	cmp    DWORD PTR [rbp-0x18],0x47
   140005218:	0f 8f e7 08 00 00    	jg     0x140005b05
   14000521e:	83 7d e8 46          	cmp    DWORD PTR [rbp-0x18],0x46
   140005222:	0f 84 7a 04 00 00    	je     0x1400056a2
   140005228:	83 7d e8 46          	cmp    DWORD PTR [rbp-0x18],0x46
   14000522c:	0f 8f d3 08 00 00    	jg     0x140005b05
   140005232:	83 7d e8 45          	cmp    DWORD PTR [rbp-0x18],0x45
   140005236:	0f 84 e8 03 00 00    	je     0x140005624
   14000523c:	83 7d e8 45          	cmp    DWORD PTR [rbp-0x18],0x45
   140005240:	0f 8f bf 08 00 00    	jg     0x140005b05
   140005246:	83 7d e8 43          	cmp    DWORD PTR [rbp-0x18],0x43
   14000524a:	0f 84 d2 00 00 00    	je     0x140005322
   140005250:	83 7d e8 43          	cmp    DWORD PTR [rbp-0x18],0x43
   140005254:	0f 8f ab 08 00 00    	jg     0x140005b05
   14000525a:	83 7d e8 41          	cmp    DWORD PTR [rbp-0x18],0x41
   14000525e:	0f 84 3a 05 00 00    	je     0x14000579e
   140005264:	83 7d e8 41          	cmp    DWORD PTR [rbp-0x18],0x41
   140005268:	0f 8f 97 08 00 00    	jg     0x140005b05
   14000526e:	83 7d e8 30          	cmp    DWORD PTR [rbp-0x18],0x30
   140005272:	0f 84 79 08 00 00    	je     0x140005af1
   140005278:	83 7d e8 30          	cmp    DWORD PTR [rbp-0x18],0x30
   14000527c:	0f 8f 83 08 00 00    	jg     0x140005b05
   140005282:	83 7d e8 2e          	cmp    DWORD PTR [rbp-0x18],0x2e
   140005286:	0f 84 14 07 00 00    	je     0x1400059a0
   14000528c:	83 7d e8 2e          	cmp    DWORD PTR [rbp-0x18],0x2e
   140005290:	0f 8f 6f 08 00 00    	jg     0x140005b05
   140005296:	83 7d e8 2d          	cmp    DWORD PTR [rbp-0x18],0x2d
   14000529a:	0f 84 c8 07 00 00    	je     0x140005a68
   1400052a0:	83 7d e8 2d          	cmp    DWORD PTR [rbp-0x18],0x2d
   1400052a4:	0f 8f 5b 08 00 00    	jg     0x140005b05
   1400052aa:	83 7d e8 2b          	cmp    DWORD PTR [rbp-0x18],0x2b
   1400052ae:	0f 84 9c 07 00 00    	je     0x140005a50
   1400052b4:	83 7d e8 2b          	cmp    DWORD PTR [rbp-0x18],0x2b
   1400052b8:	0f 8f 47 08 00 00    	jg     0x140005b05
   1400052be:	83 7d e8 2a          	cmp    DWORD PTR [rbp-0x18],0x2a
   1400052c2:	0f 84 09 07 00 00    	je     0x1400059d1
   1400052c8:	83 7d e8 2a          	cmp    DWORD PTR [rbp-0x18],0x2a
   1400052cc:	0f 8f 33 08 00 00    	jg     0x140005b05
   1400052d2:	83 7d e8 27          	cmp    DWORD PTR [rbp-0x18],0x27
   1400052d6:	0f 84 a4 07 00 00    	je     0x140005a80
   1400052dc:	83 7d e8 27          	cmp    DWORD PTR [rbp-0x18],0x27
   1400052e0:	0f 8f 1f 08 00 00    	jg     0x140005b05
   1400052e6:	83 7d e8 25          	cmp    DWORD PTR [rbp-0x18],0x25
   1400052ea:	74 23                	je     0x14000530f
   1400052ec:	83 7d e8 25          	cmp    DWORD PTR [rbp-0x18],0x25
   1400052f0:	0f 8f 0f 08 00 00    	jg     0x140005b05
   1400052f6:	83 7d e8 20          	cmp    DWORD PTR [rbp-0x18],0x20
   1400052fa:	0f 84 d9 07 00 00    	je     0x140005ad9
   140005300:	83 7d e8 23          	cmp    DWORD PTR [rbp-0x18],0x23
   140005304:	0f 84 2e 07 00 00    	je     0x140005a38
   14000530a:	e9 f6 07 00 00       	jmp    0x140005b05
   14000530f:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005313:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140005316:	89 c1                	mov    ecx,eax
   140005318:	e8 d3 dc ff ff       	call   0x140002ff0
   14000531d:	e9 be fc ff ff       	jmp    0x140004fe0
   140005322:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
   140005329:	c7 45 b0 ff ff ff ff 	mov    DWORD PTR [rbp-0x50],0xffffffff
   140005330:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   140005334:	74 06                	je     0x14000533c
   140005336:	83 7d f8 03          	cmp    DWORD PTR [rbp-0x8],0x3
   14000533a:	75 30                	jne    0x14000536c
   14000533c:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005340:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005344:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005348:	8b 00                	mov    eax,DWORD PTR [rax]
   14000534a:	66 89 45 8e          	mov    WORD PTR [rbp-0x72],ax
   14000534e:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005352:	48 8d 45 8e          	lea    rax,[rbp-0x72]
   140005356:	49 89 d0             	mov    r8,rdx
   140005359:	ba 01 00 00 00       	mov    edx,0x1
   14000535e:	48 89 c1             	mov    rcx,rax
   140005361:	e8 93 de ff ff       	call   0x1400031f9
   140005366:	90                   	nop
   140005367:	e9 74 fc ff ff       	jmp    0x140004fe0
   14000536c:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005370:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005374:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005378:	8b 00                	mov    eax,DWORD PTR [rax]
   14000537a:	88 45 90             	mov    BYTE PTR [rbp-0x70],al
   14000537d:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005381:	48 8d 45 90          	lea    rax,[rbp-0x70]
   140005385:	49 89 d0             	mov    r8,rdx
   140005388:	ba 01 00 00 00       	mov    edx,0x1
   14000538d:	48 89 c1             	mov    rcx,rax
   140005390:	e8 df dc ff ff       	call   0x140003074
   140005395:	e9 46 fc ff ff       	jmp    0x140004fe0
   14000539a:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
   1400053a1:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   1400053a5:	74 06                	je     0x1400053ad
   1400053a7:	83 7d f8 03          	cmp    DWORD PTR [rbp-0x8],0x3
   1400053ab:	75 20                	jne    0x1400053cd
   1400053ad:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400053b1:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400053b5:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400053b9:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400053bc:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400053c0:	48 89 c1             	mov    rcx,rax
   1400053c3:	e8 90 df ff ff       	call   0x140003358
   1400053c8:	e9 13 fc ff ff       	jmp    0x140004fe0
   1400053cd:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400053d1:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400053d5:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400053d9:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400053dc:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400053e0:	48 89 c1             	mov    rcx,rax
   1400053e3:	e8 8b dd ff ff       	call   0x140003173
   1400053e8:	e9 f3 fb ff ff       	jmp    0x140004fe0
   1400053ed:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   1400053f0:	89 c1                	mov    ecx,eax
   1400053f2:	e8 69 43 00 00       	call   0x140009760
   1400053f7:	48 89 c1             	mov    rcx,rax
   1400053fa:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   1400053fe:	48 89 c2             	mov    rdx,rax
   140005401:	e8 6d dd ff ff       	call   0x140003173
   140005406:	e9 d5 fb ff ff       	jmp    0x140004fe0
   14000540b:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   14000540e:	80 e4 fe             	and    ah,0xfe
   140005411:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005414:	83 7d f8 03          	cmp    DWORD PTR [rbp-0x8],0x3
   140005418:	75 15                	jne    0x14000542f
   14000541a:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000541e:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005422:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005426:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005429:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   14000542d:	eb 54                	jmp    0x140005483
   14000542f:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   140005433:	75 16                	jne    0x14000544b
   140005435:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005439:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000543d:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005441:	8b 00                	mov    eax,DWORD PTR [rax]
   140005443:	89 c0                	mov    eax,eax
   140005445:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   140005449:	eb 38                	jmp    0x140005483
   14000544b:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000544f:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005453:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005457:	8b 00                	mov    eax,DWORD PTR [rax]
   140005459:	89 c0                	mov    eax,eax
   14000545b:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   14000545f:	83 7d f8 01          	cmp    DWORD PTR [rbp-0x8],0x1
   140005463:	75 0d                	jne    0x140005472
   140005465:	0f b7 45 90          	movzx  eax,WORD PTR [rbp-0x70]
   140005469:	0f b7 c0             	movzx  eax,ax
   14000546c:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   140005470:	eb 11                	jmp    0x140005483
   140005472:	83 7d f8 05          	cmp    DWORD PTR [rbp-0x8],0x5
   140005476:	75 0b                	jne    0x140005483
   140005478:	0f b6 45 90          	movzx  eax,BYTE PTR [rbp-0x70]
   14000547c:	0f b6 c0             	movzx  eax,al
   14000547f:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   140005483:	83 7d e8 75          	cmp    DWORD PTR [rbp-0x18],0x75
   140005487:	75 2e                	jne    0x1400054b7
   140005489:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
   14000548d:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
   140005491:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
   140005498:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
   14000549f:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400054a3:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
   1400054aa:	48 89 c1             	mov    rcx,rax
   1400054ad:	e8 bc df ff ff       	call   0x14000346e
   1400054b2:	e9 29 fb ff ff       	jmp    0x140004fe0
   1400054b7:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
   1400054bb:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
   1400054bf:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
   1400054c6:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
   1400054cd:	48 8d 4d a0          	lea    rcx,[rbp-0x60]
   1400054d1:	48 8d 95 70 ff ff ff 	lea    rdx,[rbp-0x90]
   1400054d8:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   1400054db:	49 89 c8             	mov    r8,rcx
   1400054de:	89 c1                	mov    ecx,eax
   1400054e0:	e8 0c e3 ff ff       	call   0x1400037f1
   1400054e5:	e9 f6 fa ff ff       	jmp    0x140004fe0
   1400054ea:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   1400054ed:	0c 80                	or     al,0x80
   1400054ef:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   1400054f2:	83 7d f8 03          	cmp    DWORD PTR [rbp-0x8],0x3
   1400054f6:	75 15                	jne    0x14000550d
   1400054f8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400054fc:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005500:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005504:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005507:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   14000550b:	eb 56                	jmp    0x140005563
   14000550d:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   140005511:	75 16                	jne    0x140005529
   140005513:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005517:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000551b:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   14000551f:	8b 00                	mov    eax,DWORD PTR [rax]
   140005521:	48 98                	cdqe
   140005523:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   140005527:	eb 3a                	jmp    0x140005563
   140005529:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000552d:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005531:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005535:	8b 00                	mov    eax,DWORD PTR [rax]
   140005537:	48 98                	cdqe
   140005539:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   14000553d:	83 7d f8 01          	cmp    DWORD PTR [rbp-0x8],0x1
   140005541:	75 0e                	jne    0x140005551
   140005543:	0f b7 45 90          	movzx  eax,WORD PTR [rbp-0x70]
   140005547:	48 0f bf c0          	movsx  rax,ax
   14000554b:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   14000554f:	eb 12                	jmp    0x140005563
   140005551:	83 7d f8 05          	cmp    DWORD PTR [rbp-0x8],0x5
   140005555:	75 0c                	jne    0x140005563
   140005557:	0f b6 45 90          	movzx  eax,BYTE PTR [rbp-0x70]
   14000555b:	48 0f be c0          	movsx  rax,al
   14000555f:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   140005563:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
   140005567:	48 85 c0             	test   rax,rax
   14000556a:	79 09                	jns    0x140005575
   14000556c:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
   140005573:	eb 05                	jmp    0x14000557a
   140005575:	b8 00 00 00 00       	mov    eax,0x0
   14000557a:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
   14000557e:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
   140005582:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
   140005586:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
   14000558d:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
   140005594:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005598:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
   14000559f:	48 89 c1             	mov    rcx,rax
   1400055a2:	e8 c7 de ff ff       	call   0x14000346e
   1400055a7:	e9 34 fa ff ff       	jmp    0x140004fe0
   1400055ac:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400055b0:	75 18                	jne    0x1400055ca
   1400055b2:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   1400055b5:	39 45 10             	cmp    DWORD PTR [rbp+0x10],eax
   1400055b8:	75 10                	jne    0x1400055ca
   1400055ba:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   1400055bd:	80 cc 02             	or     ah,0x2
   1400055c0:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   1400055c3:	c7 45 b0 10 00 00 00 	mov    DWORD PTR [rbp-0x50],0x10
   1400055ca:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400055ce:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400055d2:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400055d6:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400055d9:	48 89 45 90          	mov    QWORD PTR [rbp-0x70],rax
   1400055dd:	48 c7 45 98 00 00 00 	mov    QWORD PTR [rbp-0x68],0x0
   1400055e4:	00 
   1400055e5:	48 8b 45 90          	mov    rax,QWORD PTR [rbp-0x70]
   1400055e9:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
   1400055ed:	48 89 85 70 ff ff ff 	mov    QWORD PTR [rbp-0x90],rax
   1400055f4:	48 89 95 78 ff ff ff 	mov    QWORD PTR [rbp-0x88],rdx
   1400055fb:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400055ff:	48 8d 85 70 ff ff ff 	lea    rax,[rbp-0x90]
   140005606:	49 89 d0             	mov    r8,rdx
   140005609:	48 89 c2             	mov    rdx,rax
   14000560c:	b9 78 00 00 00       	mov    ecx,0x78
   140005611:	e8 db e1 ff ff       	call   0x1400037f1
   140005616:	e9 c5 f9 ff ff       	jmp    0x140004fe0
   14000561b:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   14000561e:	83 c8 20             	or     eax,0x20
   140005621:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005624:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005627:	83 e0 04             	and    eax,0x4
   14000562a:	85 c0                	test   eax,eax
   14000562c:	74 2f                	je     0x14000565d
   14000562e:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005632:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005636:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   14000563a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000563d:	db 28                	fld    TBYTE PTR [rax]
   14000563f:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   140005645:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005649:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   140005650:	48 89 c1             	mov    rcx,rax
   140005653:	e8 42 ef ff ff       	call   0x14000459a
   140005658:	e9 83 f9 ff ff       	jmp    0x140004fe0
   14000565d:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005661:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005665:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005669:	f2 0f 10 08          	movsd  xmm1,QWORD PTR [rax]
   14000566d:	f2 0f 11 8d 58 ff ff 	movsd  QWORD PTR [rbp-0xa8],xmm1
   140005674:	ff 
   140005675:	dd 85 58 ff ff ff    	fld    QWORD PTR [rbp-0xa8]
   14000567b:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   140005681:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005685:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   14000568c:	48 89 c1             	mov    rcx,rax
   14000568f:	e8 06 ef ff ff       	call   0x14000459a
   140005694:	e9 47 f9 ff ff       	jmp    0x140004fe0
   140005699:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   14000569c:	83 c8 20             	or     eax,0x20
   14000569f:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   1400056a2:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   1400056a5:	83 e0 04             	and    eax,0x4
   1400056a8:	85 c0                	test   eax,eax
   1400056aa:	74 2f                	je     0x1400056db
   1400056ac:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400056b0:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400056b4:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400056b8:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400056bb:	db 28                	fld    TBYTE PTR [rax]
   1400056bd:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   1400056c3:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400056c7:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   1400056ce:	48 89 c1             	mov    rcx,rax
   1400056d1:	e8 f4 ed ff ff       	call   0x1400044ca
   1400056d6:	e9 05 f9 ff ff       	jmp    0x140004fe0
   1400056db:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400056df:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400056e3:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400056e7:	f2 0f 10 10          	movsd  xmm2,QWORD PTR [rax]
   1400056eb:	f2 0f 11 95 58 ff ff 	movsd  QWORD PTR [rbp-0xa8],xmm2
   1400056f2:	ff 
   1400056f3:	dd 85 58 ff ff ff    	fld    QWORD PTR [rbp-0xa8]
   1400056f9:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   1400056ff:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005703:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   14000570a:	48 89 c1             	mov    rcx,rax
   14000570d:	e8 b8 ed ff ff       	call   0x1400044ca
   140005712:	e9 c9 f8 ff ff       	jmp    0x140004fe0
   140005717:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   14000571a:	83 c8 20             	or     eax,0x20
   14000571d:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005720:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005723:	83 e0 04             	and    eax,0x4
   140005726:	85 c0                	test   eax,eax
   140005728:	74 2f                	je     0x140005759
   14000572a:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000572e:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005732:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005736:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005739:	db 28                	fld    TBYTE PTR [rax]
   14000573b:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   140005741:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005745:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   14000574c:	48 89 c1             	mov    rcx,rax
   14000574f:	e8 f1 ee ff ff       	call   0x140004645
   140005754:	e9 87 f8 ff ff       	jmp    0x140004fe0
   140005759:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000575d:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005761:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005765:	f2 0f 10 18          	movsd  xmm3,QWORD PTR [rax]
   140005769:	f2 0f 11 9d 58 ff ff 	movsd  QWORD PTR [rbp-0xa8],xmm3
   140005770:	ff 
   140005771:	dd 85 58 ff ff ff    	fld    QWORD PTR [rbp-0xa8]
   140005777:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   14000577d:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005781:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   140005788:	48 89 c1             	mov    rcx,rax
   14000578b:	e8 b5 ee ff ff       	call   0x140004645
   140005790:	e9 4b f8 ff ff       	jmp    0x140004fe0
   140005795:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005798:	83 c8 20             	or     eax,0x20
   14000579b:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   14000579e:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   1400057a1:	83 e0 04             	and    eax,0x4
   1400057a4:	85 c0                	test   eax,eax
   1400057a6:	74 2f                	je     0x1400057d7
   1400057a8:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400057ac:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400057b0:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400057b4:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400057b7:	db 28                	fld    TBYTE PTR [rax]
   1400057b9:	db bd 60 ff ff ff    	fstp   TBYTE PTR [rbp-0xa0]
   1400057bf:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400057c3:	48 8d 85 60 ff ff ff 	lea    rax,[rbp-0xa0]
   1400057ca:	48 89 c1             	mov    rcx,rax
   1400057cd:	e8 23 f5 ff ff       	call   0x140004cf5
   1400057d2:	e9 09 f8 ff ff       	jmp    0x140004fe0
   1400057d7:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400057db:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400057df:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400057e3:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400057e6:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   1400057ea:	66 48 0f 6e c0       	movq   xmm0,rax
   1400057ef:	e8 1a f6 ff ff       	call   0x140004e0e
   1400057f4:	e9 e7 f7 ff ff       	jmp    0x140004fe0
   1400057f9:	83 7d f8 05          	cmp    DWORD PTR [rbp-0x8],0x5
   1400057fd:	75 1b                	jne    0x14000581a
   1400057ff:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
   140005802:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005806:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000580a:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   14000580e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005811:	89 ca                	mov    edx,ecx
   140005813:	88 10                	mov    BYTE PTR [rax],dl
   140005815:	e9 c6 f7 ff ff       	jmp    0x140004fe0
   14000581a:	83 7d f8 01          	cmp    DWORD PTR [rbp-0x8],0x1
   14000581e:	75 1c                	jne    0x14000583c
   140005820:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
   140005823:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005827:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000582b:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   14000582f:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005832:	89 ca                	mov    edx,ecx
   140005834:	66 89 10             	mov    WORD PTR [rax],dx
   140005837:	e9 a4 f7 ff ff       	jmp    0x140004fe0
   14000583c:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   140005840:	75 19                	jne    0x14000585b
   140005842:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005846:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000584a:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   14000584e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005851:	8b 55 c4             	mov    edx,DWORD PTR [rbp-0x3c]
   140005854:	89 10                	mov    DWORD PTR [rax],edx
   140005856:	e9 85 f7 ff ff       	jmp    0x140004fe0
   14000585b:	83 7d f8 03          	cmp    DWORD PTR [rbp-0x8],0x3
   14000585f:	75 1d                	jne    0x14000587e
   140005861:	8b 4d c4             	mov    ecx,DWORD PTR [rbp-0x3c]
   140005864:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005868:	48 8d 50 08          	lea    rdx,[rax+0x8]
   14000586c:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   140005870:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005873:	48 63 d1             	movsxd rdx,ecx
   140005876:	48 89 10             	mov    QWORD PTR [rax],rdx
   140005879:	e9 62 f7 ff ff       	jmp    0x140004fe0
   14000587e:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140005882:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140005886:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   14000588a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000588d:	8b 55 c4             	mov    edx,DWORD PTR [rbp-0x3c]
   140005890:	89 10                	mov    DWORD PTR [rax],edx
   140005892:	e9 49 f7 ff ff       	jmp    0x140004fe0
   140005897:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000589b:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   14000589e:	3c 68                	cmp    al,0x68
   1400058a0:	75 0e                	jne    0x1400058b0
   1400058a2:	48 83 45 28 01       	add    QWORD PTR [rbp+0x28],0x1
   1400058a7:	c7 45 f8 05 00 00 00 	mov    DWORD PTR [rbp-0x8],0x5
   1400058ae:	eb 07                	jmp    0x1400058b7
   1400058b0:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [rbp-0x8],0x1
   1400058b7:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   1400058be:	e9 db 02 00 00       	jmp    0x140005b9e
   1400058c3:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   1400058ca:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   1400058d1:	e9 c8 02 00 00       	jmp    0x140005b9e
   1400058d6:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400058da:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400058dd:	3c 36                	cmp    al,0x36
   1400058df:	75 1d                	jne    0x1400058fe
   1400058e1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400058e5:	48 83 c0 01          	add    rax,0x1
   1400058e9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400058ec:	3c 34                	cmp    al,0x34
   1400058ee:	75 0e                	jne    0x1400058fe
   1400058f0:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   1400058f7:	48 83 45 28 02       	add    QWORD PTR [rbp+0x28],0x2
   1400058fc:	eb 2f                	jmp    0x14000592d
   1400058fe:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140005902:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005905:	3c 33                	cmp    al,0x33
   140005907:	75 1d                	jne    0x140005926
   140005909:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000590d:	48 83 c0 01          	add    rax,0x1
   140005911:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005914:	3c 32                	cmp    al,0x32
   140005916:	75 0e                	jne    0x140005926
   140005918:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
   14000591f:	48 83 45 28 02       	add    QWORD PTR [rbp+0x28],0x2
   140005924:	eb 07                	jmp    0x14000592d
   140005926:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   14000592d:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   140005934:	e9 65 02 00 00       	jmp    0x140005b9e
   140005939:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000593d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005940:	3c 6c                	cmp    al,0x6c
   140005942:	75 0e                	jne    0x140005952
   140005944:	48 83 45 28 01       	add    QWORD PTR [rbp+0x28],0x1
   140005949:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   140005950:	eb 07                	jmp    0x140005959
   140005952:	c7 45 f8 02 00 00 00 	mov    DWORD PTR [rbp-0x8],0x2
   140005959:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   140005960:	e9 39 02 00 00       	jmp    0x140005b9e
   140005965:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005968:	83 c8 04             	or     eax,0x4
   14000596b:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   14000596e:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   140005975:	e9 24 02 00 00       	jmp    0x140005b9e
   14000597a:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   140005981:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   140005988:	e9 11 02 00 00       	jmp    0x140005b9e
   14000598d:	c7 45 f8 03 00 00 00 	mov    DWORD PTR [rbp-0x8],0x3
   140005994:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   14000599b:	e9 fe 01 00 00       	jmp    0x140005b9e
   1400059a0:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
   1400059a4:	77 1f                	ja     0x1400059c5
   1400059a6:	c7 45 b0 00 00 00 00 	mov    DWORD PTR [rbp-0x50],0x0
   1400059ad:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   1400059b1:	48 83 c0 10          	add    rax,0x10
   1400059b5:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400059b9:	c7 45 fc 02 00 00 00 	mov    DWORD PTR [rbp-0x4],0x2
   1400059c0:	e9 d9 01 00 00       	jmp    0x140005b9e
   1400059c5:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   1400059cc:	e9 cd 01 00 00       	jmp    0x140005b9e
   1400059d1:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400059d6:	74 4c                	je     0x140005a24
   1400059d8:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400059dc:	74 06                	je     0x1400059e4
   1400059de:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
   1400059e2:	75 40                	jne    0x140005a24
   1400059e4:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400059e8:	48 8d 50 08          	lea    rdx,[rax+0x8]
   1400059ec:	48 89 55 30          	mov    QWORD PTR [rbp+0x30],rdx
   1400059f0:	8b 10                	mov    edx,DWORD PTR [rax]
   1400059f2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400059f6:	89 10                	mov    DWORD PTR [rax],edx
   1400059f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400059fc:	8b 00                	mov    eax,DWORD PTR [rax]
   1400059fe:	85 c0                	test   eax,eax
   140005a00:	79 29                	jns    0x140005a2b
   140005a02:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005a06:	75 13                	jne    0x140005a1b
   140005a08:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005a0b:	80 cc 04             	or     ah,0x4
   140005a0e:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005a11:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
   140005a14:	f7 d8                	neg    eax
   140005a16:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
   140005a19:	eb 10                	jmp    0x140005a2b
   140005a1b:	c7 45 b0 ff ff ff ff 	mov    DWORD PTR [rbp-0x50],0xffffffff
   140005a22:	eb 07                	jmp    0x140005a2b
   140005a24:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   140005a2b:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
   140005a32:	00 
   140005a33:	e9 66 01 00 00       	jmp    0x140005b9e
   140005a38:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005a3c:	0f 85 4f 01 00 00    	jne    0x140005b91
   140005a42:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005a45:	80 cc 08             	or     ah,0x8
   140005a48:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005a4b:	e9 41 01 00 00       	jmp    0x140005b91
   140005a50:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005a54:	0f 85 3a 01 00 00    	jne    0x140005b94
   140005a5a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005a5d:	80 cc 01             	or     ah,0x1
   140005a60:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005a63:	e9 2c 01 00 00       	jmp    0x140005b94
   140005a68:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005a6c:	0f 85 25 01 00 00    	jne    0x140005b97
   140005a72:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005a75:	80 cc 04             	or     ah,0x4
   140005a78:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005a7b:	e9 17 01 00 00       	jmp    0x140005b97
   140005a80:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005a84:	0f 85 10 01 00 00    	jne    0x140005b9a
   140005a8a:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005a8d:	80 cc 10             	or     ah,0x10
   140005a90:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005a93:	48 c7 45 84 00 00 00 	mov    QWORD PTR [rbp-0x7c],0x0
   140005a9a:	00 
   140005a9b:	e8 78 3c 00 00       	call   0x140009718
   140005aa0:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   140005aa4:	48 8d 4d 84          	lea    rcx,[rbp-0x7c]
   140005aa8:	48 8d 45 8c          	lea    rax,[rbp-0x74]
   140005aac:	49 89 c9             	mov    r9,rcx
   140005aaf:	41 b8 10 00 00 00    	mov    r8d,0x10
   140005ab5:	48 89 c1             	mov    rcx,rax
   140005ab8:	e8 01 37 00 00       	call   0x1400091be
   140005abd:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
   140005ac0:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
   140005ac4:	7e 08                	jle    0x140005ace
   140005ac6:	0f b7 45 8c          	movzx  eax,WORD PTR [rbp-0x74]
   140005aca:	66 89 45 c0          	mov    WORD PTR [rbp-0x40],ax
   140005ace:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   140005ad1:	89 45 bc             	mov    DWORD PTR [rbp-0x44],eax
   140005ad4:	e9 c1 00 00 00       	jmp    0x140005b9a
   140005ad9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005add:	0f 85 ba 00 00 00    	jne    0x140005b9d
   140005ae3:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005ae6:	83 c8 40             	or     eax,0x40
   140005ae9:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005aec:	e9 ac 00 00 00       	jmp    0x140005b9d
   140005af1:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005af5:	75 0e                	jne    0x140005b05
   140005af7:	8b 45 a8             	mov    eax,DWORD PTR [rbp-0x58]
   140005afa:	80 cc 02             	or     ah,0x2
   140005afd:	89 45 a8             	mov    DWORD PTR [rbp-0x58],eax
   140005b00:	e9 99 00 00 00       	jmp    0x140005b9e
   140005b05:	83 7d fc 03          	cmp    DWORD PTR [rbp-0x4],0x3
   140005b09:	77 68                	ja     0x140005b73
   140005b0b:	83 7d e8 39          	cmp    DWORD PTR [rbp-0x18],0x39
   140005b0f:	7f 62                	jg     0x140005b73
   140005b11:	83 7d e8 2f          	cmp    DWORD PTR [rbp-0x18],0x2f
   140005b15:	7e 5c                	jle    0x140005b73
   140005b17:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140005b1b:	75 09                	jne    0x140005b26
   140005b1d:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
   140005b24:	eb 0d                	jmp    0x140005b33
   140005b26:	83 7d fc 02          	cmp    DWORD PTR [rbp-0x4],0x2
   140005b2a:	75 07                	jne    0x140005b33
   140005b2c:	c7 45 fc 03 00 00 00 	mov    DWORD PTR [rbp-0x4],0x3
   140005b33:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140005b38:	74 64                	je     0x140005b9e
   140005b3a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005b3e:	8b 00                	mov    eax,DWORD PTR [rax]
   140005b40:	85 c0                	test   eax,eax
   140005b42:	79 0e                	jns    0x140005b52
   140005b44:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140005b47:	8d 50 d0             	lea    edx,[rax-0x30]
   140005b4a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005b4e:	89 10                	mov    DWORD PTR [rax],edx
   140005b50:	eb 4c                	jmp    0x140005b9e
   140005b52:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005b56:	8b 10                	mov    edx,DWORD PTR [rax]
   140005b58:	89 d0                	mov    eax,edx
   140005b5a:	c1 e0 02             	shl    eax,0x2
   140005b5d:	01 d0                	add    eax,edx
   140005b5f:	01 c0                	add    eax,eax
   140005b61:	89 c2                	mov    edx,eax
   140005b63:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140005b66:	01 d0                	add    eax,edx
   140005b68:	8d 50 d0             	lea    edx,[rax-0x30]
   140005b6b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005b6f:	89 10                	mov    DWORD PTR [rax],edx
   140005b71:	eb 2b                	jmp    0x140005b9e
   140005b73:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140005b77:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140005b7b:	48 8d 45 a0          	lea    rax,[rbp-0x60]
   140005b7f:	48 89 c2             	mov    rdx,rax
   140005b82:	b9 25 00 00 00       	mov    ecx,0x25
   140005b87:	e8 64 d4 ff ff       	call   0x140002ff0
   140005b8c:	e9 4f f4 ff ff       	jmp    0x140004fe0
   140005b91:	90                   	nop
   140005b92:	eb 0a                	jmp    0x140005b9e
   140005b94:	90                   	nop
   140005b95:	eb 07                	jmp    0x140005b9e
   140005b97:	90                   	nop
   140005b98:	eb 04                	jmp    0x140005b9e
   140005b9a:	90                   	nop
   140005b9b:	eb 01                	jmp    0x140005b9e
   140005b9d:	90                   	nop
   140005b9e:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140005ba2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005ba5:	84 c0                	test   al,al
   140005ba7:	0f 85 7c f4 ff ff    	jne    0x140005029
   140005bad:	eb 0e                	jmp    0x140005bbd
   140005baf:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   140005bb3:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140005bb6:	89 c1                	mov    ecx,eax
   140005bb8:	e8 33 d4 ff ff       	call   0x140002ff0
   140005bbd:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140005bc1:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140005bc5:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140005bc9:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005bcc:	0f be c0             	movsx  eax,al
   140005bcf:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140005bd2:	83 7d e8 00          	cmp    DWORD PTR [rbp-0x18],0x0
   140005bd6:	0f 85 09 f4 ff ff    	jne    0x140004fe5
   140005bdc:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
   140005bdf:	48 81 c4 d0 00 00 00 	add    rsp,0xd0
   140005be6:	5d                   	pop    rbp
   140005be7:	c3                   	ret
   140005be8:	90                   	nop
   140005be9:	90                   	nop
   140005bea:	90                   	nop
   140005beb:	90                   	nop
   140005bec:	90                   	nop
   140005bed:	90                   	nop
   140005bee:	90                   	nop
   140005bef:	90                   	nop
   140005bf0:	55                   	push   rbp
   140005bf1:	53                   	push   rbx
   140005bf2:	48 83 ec 48          	sub    rsp,0x48
   140005bf6:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140005bfb:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140005bff:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140005c03:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140005c07:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140005c0b:	48 8d 45 28          	lea    rax,[rbp+0x28]
   140005c0f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140005c13:	b9 01 00 00 00       	mov    ecx,0x1
   140005c18:	e8 03 3a 00 00       	call   0x140009620
   140005c1d:	48 89 c1             	mov    rcx,rax
   140005c20:	e8 7b 38 00 00       	call   0x1400094a0
   140005c25:	48 8b 5d f8          	mov    rbx,QWORD PTR [rbp-0x8]
   140005c29:	b9 01 00 00 00       	mov    ecx,0x1
   140005c2e:	e8 ed 39 00 00       	call   0x140009620
   140005c33:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140005c37:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140005c3c:	49 89 d1             	mov    r9,rdx
   140005c3f:	41 b8 00 00 00 00    	mov    r8d,0x0
   140005c45:	48 89 c2             	mov    rdx,rax
   140005c48:	b9 00 60 00 00       	mov    ecx,0x6000
   140005c4d:	e8 19 f3 ff ff       	call   0x140004f6b
   140005c52:	89 c3                	mov    ebx,eax
   140005c54:	b9 01 00 00 00       	mov    ecx,0x1
   140005c59:	e8 c2 39 00 00       	call   0x140009620
   140005c5e:	48 89 c1             	mov    rcx,rax
   140005c61:	e8 c4 38 00 00       	call   0x14000952a
   140005c66:	89 d8                	mov    eax,ebx
   140005c68:	48 83 c4 48          	add    rsp,0x48
   140005c6c:	5b                   	pop    rbx
   140005c6d:	5d                   	pop    rbp
   140005c6e:	c3                   	ret
   140005c6f:	90                   	nop
   140005c70:	55                   	push   rbp
   140005c71:	53                   	push   rbx
   140005c72:	48 83 ec 38          	sub    rsp,0x38
   140005c76:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140005c7b:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140005c7f:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140005c83:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140005c87:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140005c8b:	48 8d 45 38          	lea    rax,[rbp+0x38]
   140005c8f:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140005c93:	4c 8b 45 f8          	mov    r8,QWORD PTR [rbp-0x8]
   140005c97:	48 8b 4d 30          	mov    rcx,QWORD PTR [rbp+0x30]
   140005c9b:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140005c9f:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140005ca3:	4d 89 c1             	mov    r9,r8
   140005ca6:	49 89 c8             	mov    r8,rcx
   140005ca9:	48 89 c1             	mov    rcx,rax
   140005cac:	e8 0f 00 00 00       	call   0x140005cc0
   140005cb1:	89 c3                	mov    ebx,eax
   140005cb3:	89 d8                	mov    eax,ebx
   140005cb5:	48 83 c4 38          	add    rsp,0x38
   140005cb9:	5b                   	pop    rbx
   140005cba:	5d                   	pop    rbp
   140005cbb:	c3                   	ret
   140005cbc:	90                   	nop
   140005cbd:	90                   	nop
   140005cbe:	90                   	nop
   140005cbf:	90                   	nop
   140005cc0:	55                   	push   rbp
   140005cc1:	53                   	push   rbx
   140005cc2:	48 83 ec 38          	sub    rsp,0x38
   140005cc6:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140005ccb:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140005ccf:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140005cd3:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140005cd7:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   140005cdb:	48 83 7d 28 00       	cmp    QWORD PTR [rbp+0x28],0x0
   140005ce0:	75 29                	jne    0x140005d0b
   140005ce2:	48 8b 4d 30          	mov    rcx,QWORD PTR [rbp+0x30]
   140005ce6:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140005cea:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
   140005cee:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140005cf3:	49 89 c9             	mov    r9,rcx
   140005cf6:	41 b8 00 00 00 00    	mov    r8d,0x0
   140005cfc:	48 89 c2             	mov    rdx,rax
   140005cff:	b9 00 00 00 00       	mov    ecx,0x0
   140005d04:	e8 62 f2 ff ff       	call   0x140004f6b
   140005d09:	eb 47                	jmp    0x140005d52
   140005d0b:	48 83 6d 28 01       	sub    QWORD PTR [rbp+0x28],0x1
   140005d10:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140005d14:	41 89 c0             	mov    r8d,eax
   140005d17:	48 8b 4d 30          	mov    rcx,QWORD PTR [rbp+0x30]
   140005d1b:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140005d1f:	48 8b 55 38          	mov    rdx,QWORD PTR [rbp+0x38]
   140005d23:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140005d28:	49 89 c9             	mov    r9,rcx
   140005d2b:	48 89 c2             	mov    rdx,rax
   140005d2e:	b9 00 00 00 00       	mov    ecx,0x0
   140005d33:	e8 33 f2 ff ff       	call   0x140004f6b
   140005d38:	89 c3                	mov    ebx,eax
   140005d3a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140005d3e:	39 c3                	cmp    ebx,eax
   140005d40:	0f 4e c3             	cmovle eax,ebx
   140005d43:	48 63 d0             	movsxd rdx,eax
   140005d46:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140005d4a:	48 01 d0             	add    rax,rdx
   140005d4d:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140005d50:	89 d8                	mov    eax,ebx
   140005d52:	48 83 c4 38          	add    rsp,0x38
   140005d56:	5b                   	pop    rbx
   140005d57:	5d                   	pop    rbp
   140005d58:	c3                   	ret
   140005d59:	90                   	nop
   140005d5a:	90                   	nop
   140005d5b:	90                   	nop
   140005d5c:	90                   	nop
   140005d5d:	90                   	nop
   140005d5e:	90                   	nop
   140005d5f:	90                   	nop
   140005d60:	55                   	push   rbp
   140005d61:	48 89 e5             	mov    rbp,rsp
   140005d64:	48 83 ec 30          	sub    rsp,0x30
   140005d68:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140005d6b:	c7 45 fc 04 00 00 00 	mov    DWORD PTR [rbp-0x4],0x4
   140005d72:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   140005d79:	eb 07                	jmp    0x140005d82
   140005d7b:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
   140005d7f:	d1 65 fc             	shl    DWORD PTR [rbp-0x4],1
   140005d82:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140005d85:	83 c0 17             	add    eax,0x17
   140005d88:	39 45 10             	cmp    DWORD PTR [rbp+0x10],eax
   140005d8b:	7f ee                	jg     0x140005d7b
   140005d8d:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140005d90:	89 c1                	mov    ecx,eax
   140005d92:	e8 56 1e 00 00       	call   0x140007bed
   140005d97:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140005d9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005d9f:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   140005da2:	89 10                	mov    DWORD PTR [rax],edx
   140005da4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005da8:	48 83 c0 04          	add    rax,0x4
   140005dac:	48 83 c4 30          	add    rsp,0x30
   140005db0:	5d                   	pop    rbp
   140005db1:	c3                   	ret
   140005db2:	55                   	push   rbp
   140005db3:	48 89 e5             	mov    rbp,rsp
   140005db6:	48 83 ec 30          	sub    rsp,0x30
   140005dba:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140005dbe:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140005dc2:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140005dc6:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   140005dc9:	89 c1                	mov    ecx,eax
   140005dcb:	e8 90 ff ff ff       	call   0x140005d60
   140005dd0:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140005dd4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005dd8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140005ddc:	eb 05                	jmp    0x140005de3
   140005dde:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
   140005de3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005de7:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140005deb:	48 89 55 10          	mov    QWORD PTR [rbp+0x10],rdx
   140005def:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   140005df2:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005df6:	88 10                	mov    BYTE PTR [rax],dl
   140005df8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005dfc:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140005dff:	84 c0                	test   al,al
   140005e01:	75 db                	jne    0x140005dde
   140005e03:	48 83 7d 18 00       	cmp    QWORD PTR [rbp+0x18],0x0
   140005e08:	74 0b                	je     0x140005e15
   140005e0a:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140005e0e:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140005e12:	48 89 10             	mov    QWORD PTR [rax],rdx
   140005e15:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005e19:	48 83 c4 30          	add    rsp,0x30
   140005e1d:	5d                   	pop    rbp
   140005e1e:	c3                   	ret
   140005e1f:	55                   	push   rbp
   140005e20:	48 89 e5             	mov    rbp,rsp
   140005e23:	48 83 ec 30          	sub    rsp,0x30
   140005e27:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140005e2b:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005e2f:	48 83 e8 04          	sub    rax,0x4
   140005e33:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140005e37:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005e3b:	8b 10                	mov    edx,DWORD PTR [rax]
   140005e3d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005e41:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140005e44:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005e48:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140005e4b:	ba 01 00 00 00       	mov    edx,0x1
   140005e50:	89 c1                	mov    ecx,eax
   140005e52:	d3 e2                	shl    edx,cl
   140005e54:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005e58:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140005e5b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140005e5f:	48 89 c1             	mov    rcx,rax
   140005e62:	e8 c7 1e 00 00       	call   0x140007d2e
   140005e67:	90                   	nop
   140005e68:	48 83 c4 30          	add    rsp,0x30
   140005e6c:	5d                   	pop    rbp
   140005e6d:	c3                   	ret
   140005e6e:	55                   	push   rbp
   140005e6f:	48 89 e5             	mov    rbp,rsp
   140005e72:	48 83 ec 70          	sub    rsp,0x70
   140005e76:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140005e7a:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140005e7e:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140005e82:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140005e85:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140005e88:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005e8c:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140005e8f:	39 45 fc             	cmp    DWORD PTR [rbp-0x4],eax
   140005e92:	7e 0a                	jle    0x140005e9e
   140005e94:	b8 00 00 00 00       	mov    eax,0x0
   140005e99:	e9 3f 02 00 00       	jmp    0x1400060dd
   140005e9e:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140005ea2:	48 83 c0 18          	add    rax,0x18
   140005ea6:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140005eaa:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
   140005eae:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140005eb1:	48 98                	cdqe
   140005eb3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140005eba:	00 
   140005ebb:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140005ebf:	48 01 d0             	add    rax,rdx
   140005ec2:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   140005ec6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005eca:	48 83 c0 18          	add    rax,0x18
   140005ece:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140005ed2:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140005ed5:	48 98                	cdqe
   140005ed7:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140005ede:	00 
   140005edf:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005ee3:	48 01 d0             	add    rax,rdx
   140005ee6:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140005eea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140005eee:	8b 00                	mov    eax,DWORD PTR [rax]
   140005ef0:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
   140005ef4:	8b 12                	mov    edx,DWORD PTR [rdx]
   140005ef6:	8d 4a 01             	lea    ecx,[rdx+0x1]
   140005ef9:	ba 00 00 00 00       	mov    edx,0x0
   140005efe:	f7 f1                	div    ecx
   140005f00:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140005f03:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   140005f07:	0f 84 c4 00 00 00    	je     0x140005fd1
   140005f0d:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
   140005f14:	00 
   140005f15:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
   140005f1c:	00 
   140005f1d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140005f21:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140005f25:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
   140005f29:	8b 00                	mov    eax,DWORD PTR [rax]
   140005f2b:	89 c2                	mov    edx,eax
   140005f2d:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140005f30:	48 0f af d0          	imul   rdx,rax
   140005f34:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140005f38:	48 01 d0             	add    rax,rdx
   140005f3b:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140005f3f:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140005f43:	48 c1 e8 20          	shr    rax,0x20
   140005f47:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   140005f4b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005f4f:	8b 00                	mov    eax,DWORD PTR [rax]
   140005f51:	89 c1                	mov    ecx,eax
   140005f53:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140005f57:	89 c2                	mov    edx,eax
   140005f59:	48 89 c8             	mov    rax,rcx
   140005f5c:	48 29 d0             	sub    rax,rdx
   140005f5f:	48 2b 45 d0          	sub    rax,QWORD PTR [rbp-0x30]
   140005f63:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140005f67:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
   140005f6b:	48 c1 e8 20          	shr    rax,0x20
   140005f6f:	83 e0 01             	and    eax,0x1
   140005f72:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   140005f76:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140005f7a:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140005f7e:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140005f82:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
   140005f86:	89 10                	mov    DWORD PTR [rax],edx
   140005f88:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140005f8c:	48 39 45 c0          	cmp    QWORD PTR [rbp-0x40],rax
   140005f90:	73 8b                	jae    0x140005f1d
   140005f92:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140005f96:	8b 00                	mov    eax,DWORD PTR [rax]
   140005f98:	85 c0                	test   eax,eax
   140005f9a:	75 35                	jne    0x140005fd1
   140005f9c:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005fa0:	48 83 c0 18          	add    rax,0x18
   140005fa4:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140005fa8:	eb 04                	jmp    0x140005fae
   140005faa:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
   140005fae:	48 83 6d e8 04       	sub    QWORD PTR [rbp-0x18],0x4
   140005fb3:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140005fb7:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
   140005fbb:	73 0a                	jae    0x140005fc7
   140005fbd:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140005fc1:	8b 00                	mov    eax,DWORD PTR [rax]
   140005fc3:	85 c0                	test   eax,eax
   140005fc5:	74 e3                	je     0x140005faa
   140005fc7:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005fcb:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   140005fce:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140005fd1:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140005fd5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140005fd9:	48 89 c1             	mov    rcx,rax
   140005fdc:	e8 bc 24 00 00       	call   0x14000849d
   140005fe1:	85 c0                	test   eax,eax
   140005fe3:	0f 88 f1 00 00 00    	js     0x1400060da
   140005fe9:	83 45 e4 01          	add    DWORD PTR [rbp-0x1c],0x1
   140005fed:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
   140005ff4:	00 
   140005ff5:	48 c7 45 c8 00 00 00 	mov    QWORD PTR [rbp-0x38],0x0
   140005ffc:	00 
   140005ffd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140006001:	48 83 c0 18          	add    rax,0x18
   140006005:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140006009:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000600d:	48 83 c0 18          	add    rax,0x18
   140006011:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140006015:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140006019:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000601d:	48 89 55 d8          	mov    QWORD PTR [rbp-0x28],rdx
   140006021:	8b 00                	mov    eax,DWORD PTR [rax]
   140006023:	89 c2                	mov    edx,eax
   140006025:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140006029:	48 01 d0             	add    rax,rdx
   14000602c:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140006030:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140006034:	48 c1 e8 20          	shr    rax,0x20
   140006038:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14000603c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140006040:	8b 00                	mov    eax,DWORD PTR [rax]
   140006042:	89 c1                	mov    ecx,eax
   140006044:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140006048:	89 c2                	mov    edx,eax
   14000604a:	48 89 c8             	mov    rax,rcx
   14000604d:	48 29 d0             	sub    rax,rdx
   140006050:	48 2b 45 d0          	sub    rax,QWORD PTR [rbp-0x30]
   140006054:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140006058:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
   14000605c:	48 c1 e8 20          	shr    rax,0x20
   140006060:	83 e0 01             	and    eax,0x1
   140006063:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   140006067:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000606b:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000606f:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140006073:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
   140006077:	89 10                	mov    DWORD PTR [rax],edx
   140006079:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14000607d:	48 39 45 c0          	cmp    QWORD PTR [rbp-0x40],rax
   140006081:	73 92                	jae    0x140006015
   140006083:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140006087:	48 83 c0 18          	add    rax,0x18
   14000608b:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000608f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140006092:	48 98                	cdqe
   140006094:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   14000609b:	00 
   14000609c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400060a0:	48 01 d0             	add    rax,rdx
   1400060a3:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400060a7:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400060ab:	8b 00                	mov    eax,DWORD PTR [rax]
   1400060ad:	85 c0                	test   eax,eax
   1400060af:	75 29                	jne    0x1400060da
   1400060b1:	eb 04                	jmp    0x1400060b7
   1400060b3:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
   1400060b7:	48 83 6d e8 04       	sub    QWORD PTR [rbp-0x18],0x4
   1400060bc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400060c0:	48 39 45 f0          	cmp    QWORD PTR [rbp-0x10],rax
   1400060c4:	73 0a                	jae    0x1400060d0
   1400060c6:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400060ca:	8b 00                	mov    eax,DWORD PTR [rax]
   1400060cc:	85 c0                	test   eax,eax
   1400060ce:	74 e3                	je     0x1400060b3
   1400060d0:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400060d4:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   1400060d7:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   1400060da:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   1400060dd:	48 83 c4 70          	add    rsp,0x70
   1400060e1:	5d                   	pop    rbp
   1400060e2:	c3                   	ret
   1400060e3:	90                   	nop
   1400060e4:	90                   	nop
   1400060e5:	90                   	nop
   1400060e6:	90                   	nop
   1400060e7:	90                   	nop
   1400060e8:	90                   	nop
   1400060e9:	90                   	nop
   1400060ea:	90                   	nop
   1400060eb:	90                   	nop
   1400060ec:	90                   	nop
   1400060ed:	90                   	nop
   1400060ee:	90                   	nop
   1400060ef:	90                   	nop
   1400060f0:	55                   	push   rbp
   1400060f1:	48 89 e5             	mov    rbp,rsp
   1400060f4:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   1400060f7:	0f bd 45 10          	bsr    eax,DWORD PTR [rbp+0x10]
   1400060fb:	83 f0 1f             	xor    eax,0x1f
   1400060fe:	5d                   	pop    rbp
   1400060ff:	c3                   	ret
   140006100:	55                   	push   rbp
   140006101:	53                   	push   rbx
   140006102:	48 83 ec 58          	sub    rsp,0x58
   140006106:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   14000610b:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   14000610f:	89 55 28             	mov    DWORD PTR [rbp+0x28],edx
   140006112:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140006116:	c7 45 fc 20 00 00 00 	mov    DWORD PTR [rbp-0x4],0x20
   14000611d:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   140006124:	eb 07                	jmp    0x14000612d
   140006126:	d1 65 fc             	shl    DWORD PTR [rbp-0x4],1
   140006129:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
   14000612d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140006130:	3b 45 28             	cmp    eax,DWORD PTR [rbp+0x28]
   140006133:	7c f1                	jl     0x140006126
   140006135:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140006138:	89 c1                	mov    ecx,eax
   14000613a:	e8 ae 1a 00 00       	call   0x140007bed
   14000613f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140006143:	8b 45 28             	mov    eax,DWORD PTR [rbp+0x28]
   140006146:	83 e8 01             	sub    eax,0x1
   140006149:	c1 f8 05             	sar    eax,0x5
   14000614c:	48 98                	cdqe
   14000614e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140006155:	00 
   140006156:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000615a:	48 01 d0             	add    rax,rdx
   14000615d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140006161:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140006165:	48 83 c0 18          	add    rax,0x18
   140006169:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   14000616d:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140006171:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140006175:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140006179:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000617d:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140006181:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140006185:	8b 12                	mov    edx,DWORD PTR [rdx]
   140006187:	89 10                	mov    DWORD PTR [rax],edx
   140006189:	48 83 45 20 04       	add    QWORD PTR [rbp+0x20],0x4
   14000618e:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140006192:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
   140006196:	73 dd                	jae    0x140006175
   140006198:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000619c:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
   1400061a0:	48 c1 f8 02          	sar    rax,0x2
   1400061a4:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400061a7:	eb 1d                	jmp    0x1400061c6
   1400061a9:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400061ad:	75 17                	jne    0x1400061c6
   1400061af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400061b3:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
   1400061ba:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400061be:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   1400061c4:	eb 59                	jmp    0x14000621f
   1400061c6:	83 6d fc 01          	sub    DWORD PTR [rbp-0x4],0x1
   1400061ca:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400061cd:	48 98                	cdqe
   1400061cf:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   1400061d6:	00 
   1400061d7:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   1400061db:	48 01 d0             	add    rax,rdx
   1400061de:	8b 00                	mov    eax,DWORD PTR [rax]
   1400061e0:	85 c0                	test   eax,eax
   1400061e2:	74 c5                	je     0x1400061a9
   1400061e4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400061e7:	8d 50 01             	lea    edx,[rax+0x1]
   1400061ea:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400061ee:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   1400061f1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400061f4:	83 c0 01             	add    eax,0x1
   1400061f7:	c1 e0 05             	shl    eax,0x5
   1400061fa:	89 c3                	mov    ebx,eax
   1400061fc:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140006200:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   140006203:	48 63 d2             	movsxd rdx,edx
   140006206:	48 83 c2 04          	add    rdx,0x4
   14000620a:	8b 44 90 08          	mov    eax,DWORD PTR [rax+rdx*4+0x8]
   14000620e:	89 c1                	mov    ecx,eax
   140006210:	e8 db fe ff ff       	call   0x1400060f0
   140006215:	29 c3                	sub    ebx,eax
   140006217:	89 da                	mov    edx,ebx
   140006219:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   14000621d:	89 10                	mov    DWORD PTR [rax],edx
   14000621f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140006223:	48 83 c4 58          	add    rsp,0x58
   140006227:	5b                   	pop    rbx
   140006228:	5d                   	pop    rbp
   140006229:	c3                   	ret
   14000622a:	55                   	push   rbp
   14000622b:	48 81 ec 00 01 00 00 	sub    rsp,0x100
   140006232:	48 8d ac 24 80 00 00 	lea    rbp,[rsp+0x80]
   140006239:	00 
   14000623a:	48 89 8d 90 00 00 00 	mov    QWORD PTR [rbp+0x90],rcx
   140006241:	89 95 98 00 00 00    	mov    DWORD PTR [rbp+0x98],edx
   140006247:	4c 89 85 a0 00 00 00 	mov    QWORD PTR [rbp+0xa0],r8
   14000624e:	4c 89 8d a8 00 00 00 	mov    QWORD PTR [rbp+0xa8],r9
   140006255:	c7 45 64 00 00 00 00 	mov    DWORD PTR [rbp+0x64],0x0
   14000625c:	48 8b 85 a8 00 00 00 	mov    rax,QWORD PTR [rbp+0xa8]
   140006263:	8b 00                	mov    eax,DWORD PTR [rax]
   140006265:	83 e0 cf             	and    eax,0xffffffcf
   140006268:	89 c2                	mov    edx,eax
   14000626a:	48 8b 85 a8 00 00 00 	mov    rax,QWORD PTR [rbp+0xa8]
   140006271:	89 10                	mov    DWORD PTR [rax],edx
   140006273:	48 8b 85 a8 00 00 00 	mov    rax,QWORD PTR [rbp+0xa8]
   14000627a:	8b 00                	mov    eax,DWORD PTR [rax]
   14000627c:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000627f:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140006282:	83 e0 07             	and    eax,0x7
   140006285:	83 f8 04             	cmp    eax,0x4
   140006288:	0f 84 b0 00 00 00    	je     0x14000633e
   14000628e:	83 f8 04             	cmp    eax,0x4
   140006291:	0f 8f d5 00 00 00    	jg     0x14000636c
   140006297:	83 f8 03             	cmp    eax,0x3
   14000629a:	74 74                	je     0x140006310
   14000629c:	83 f8 03             	cmp    eax,0x3
   14000629f:	0f 8f c7 00 00 00    	jg     0x14000636c
   1400062a5:	85 c0                	test   eax,eax
   1400062a7:	0f 84 05 01 00 00    	je     0x1400063b2
   1400062ad:	85 c0                	test   eax,eax
   1400062af:	0f 88 b7 00 00 00    	js     0x14000636c
   1400062b5:	83 e8 01             	sub    eax,0x1
   1400062b8:	83 f8 01             	cmp    eax,0x1
   1400062bb:	0f 87 ab 00 00 00    	ja     0x14000636c
   1400062c1:	90                   	nop
   1400062c2:	48 8b 85 90 00 00 00 	mov    rax,QWORD PTR [rbp+0x90]
   1400062c9:	8b 00                	mov    eax,DWORD PTR [rax]
   1400062cb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   1400062ce:	48 8d 4d b4          	lea    rcx,[rbp-0x4c]
   1400062d2:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   1400062d5:	48 8b 85 a0 00 00 00 	mov    rax,QWORD PTR [rbp+0xa0]
   1400062dc:	49 89 c8             	mov    r8,rcx
   1400062df:	48 89 c1             	mov    rcx,rax
   1400062e2:	e8 19 fe ff ff       	call   0x140006100
   1400062e7:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   1400062eb:	8b 85 98 00 00 00    	mov    eax,DWORD PTR [rbp+0x98]
   1400062f1:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
   1400062f4:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400062f8:	48 89 c1             	mov    rcx,rax
   1400062fb:	e8 31 16 00 00       	call   0x140007931
   140006300:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006303:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006306:	85 c0                	test   eax,eax
   140006308:	0f 84 8b 00 00 00    	je     0x140006399
   14000630e:	eb 66                	jmp    0x140006376
   140006310:	48 8b 85 c0 00 00 00 	mov    rax,QWORD PTR [rbp+0xc0]
   140006317:	c7 00 00 80 ff ff    	mov    DWORD PTR [rax],0xffff8000
   14000631d:	48 8b 85 c8 00 00 00 	mov    rax,QWORD PTR [rbp+0xc8]
   140006324:	48 8d 0d 25 52 00 00 	lea    rcx,[rip+0x5225]        # 0x14000b550
   14000632b:	41 b8 08 00 00 00    	mov    r8d,0x8
   140006331:	48 89 c2             	mov    rdx,rax
   140006334:	e8 79 fa ff ff       	call   0x140005db2
   140006339:	e9 4a 14 00 00       	jmp    0x140007788
   14000633e:	48 8b 85 c0 00 00 00 	mov    rax,QWORD PTR [rbp+0xc0]
   140006345:	c7 00 00 80 ff ff    	mov    DWORD PTR [rax],0xffff8000
   14000634b:	48 8b 85 c8 00 00 00 	mov    rax,QWORD PTR [rbp+0xc8]
   140006352:	48 8d 0d 00 52 00 00 	lea    rcx,[rip+0x5200]        # 0x14000b559
   140006359:	41 b8 03 00 00 00    	mov    r8d,0x3
   14000635f:	48 89 c2             	mov    rdx,rax
   140006362:	e8 4b fa ff ff       	call   0x140005db2
   140006367:	e9 1c 14 00 00       	jmp    0x140007788
   14000636c:	b8 00 00 00 00       	mov    eax,0x0
   140006371:	e9 12 14 00 00       	jmp    0x140007788
   140006376:	8b 55 b0             	mov    edx,DWORD PTR [rbp-0x50]
   140006379:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000637d:	48 89 c1             	mov    rcx,rax
   140006380:	e8 50 14 00 00       	call   0x1400077d5
   140006385:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006388:	01 85 98 00 00 00    	add    DWORD PTR [rbp+0x98],eax
   14000638e:	8b 55 b4             	mov    edx,DWORD PTR [rbp-0x4c]
   140006391:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006394:	29 c2                	sub    edx,eax
   140006396:	89 55 b4             	mov    DWORD PTR [rbp-0x4c],edx
   140006399:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000639d:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400063a0:	85 c0                	test   eax,eax
   1400063a2:	75 3d                	jne    0x1400063e1
   1400063a4:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400063a8:	48 89 c1             	mov    rcx,rax
   1400063ab:	e8 7e 19 00 00       	call   0x140007d2e
   1400063b0:	eb 01                	jmp    0x1400063b3
   1400063b2:	90                   	nop
   1400063b3:	48 8b 85 c0 00 00 00 	mov    rax,QWORD PTR [rbp+0xc0]
   1400063ba:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400063c0:	48 8b 85 c8 00 00 00 	mov    rax,QWORD PTR [rbp+0xc8]
   1400063c7:	48 8d 0d 8f 51 00 00 	lea    rcx,[rip+0x518f]        # 0x14000b55d
   1400063ce:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400063d4:	48 89 c2             	mov    rdx,rax
   1400063d7:	e8 d6 f9 ff ff       	call   0x140005db2
   1400063dc:	e9 a7 13 00 00       	jmp    0x140007788
   1400063e1:	48 8d 55 b0          	lea    rdx,[rbp-0x50]
   1400063e5:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400063e9:	48 89 c1             	mov    rcx,rax
   1400063ec:	e8 75 23 00 00       	call   0x140008766
   1400063f1:	66 48 0f 7e c0       	movq   rax,xmm0
   1400063f6:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
   1400063fa:	8b 55 b4             	mov    edx,DWORD PTR [rbp-0x4c]
   1400063fd:	8b 85 98 00 00 00    	mov    eax,DWORD PTR [rbp+0x98]
   140006403:	01 d0                	add    eax,edx
   140006405:	83 e8 01             	sub    eax,0x1
   140006408:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   14000640b:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
   14000640e:	25 ff ff 0f 00       	and    eax,0xfffff
   140006413:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
   140006416:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
   140006419:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   14000641e:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
   140006421:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006426:	f2 0f 10 15 32 51 00 	movsd  xmm2,QWORD PTR [rip+0x5132]        # 0x14000b560
   14000642d:	00 
   14000642e:	66 0f 28 c8          	movapd xmm1,xmm0
   140006432:	f2 0f 5c ca          	subsd  xmm1,xmm2
   140006436:	f2 0f 10 05 2a 51 00 	movsd  xmm0,QWORD PTR [rip+0x512a]        # 0x14000b568
   14000643d:	00 
   14000643e:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   140006442:	f2 0f 10 05 26 51 00 	movsd  xmm0,QWORD PTR [rip+0x5126]        # 0x14000b570
   140006449:	00 
   14000644a:	f2 0f 58 c8          	addsd  xmm1,xmm0
   14000644e:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006451:	66 0f ef d2          	pxor   xmm2,xmm2
   140006455:	f2 0f 2a d0          	cvtsi2sd xmm2,eax
   140006459:	f2 0f 10 05 17 51 00 	movsd  xmm0,QWORD PTR [rip+0x5117]        # 0x14000b578
   140006460:	00 
   140006461:	f2 0f 59 c2          	mulsd  xmm0,xmm2
   140006465:	f2 0f 58 c1          	addsd  xmm0,xmm1
   140006469:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   14000646e:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006471:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   140006474:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140006478:	79 03                	jns    0x14000647d
   14000647a:	f7 5d 60             	neg    DWORD PTR [rbp+0x60]
   14000647d:	81 6d 60 35 04 00 00 	sub    DWORD PTR [rbp+0x60],0x435
   140006484:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140006488:	7e 23                	jle    0x1400064ad
   14000648a:	66 0f ef c9          	pxor   xmm1,xmm1
   14000648e:	f2 0f 2a 4d 60       	cvtsi2sd xmm1,DWORD PTR [rbp+0x60]
   140006493:	f2 0f 10 05 e5 50 00 	movsd  xmm0,QWORD PTR [rip+0x50e5]        # 0x14000b580
   14000649a:	00 
   14000649b:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   14000649f:	f2 0f 10 4d 08       	movsd  xmm1,QWORD PTR [rbp+0x8]
   1400064a4:	f2 0f 58 c1          	addsd  xmm0,xmm1
   1400064a8:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   1400064ad:	f2 0f 10 45 08       	movsd  xmm0,QWORD PTR [rbp+0x8]
   1400064b2:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   1400064b6:	89 45 58             	mov    DWORD PTR [rbp+0x58],eax
   1400064b9:	66 0f ef c0          	pxor   xmm0,xmm0
   1400064bd:	66 0f 2f 45 08       	comisd xmm0,QWORD PTR [rbp+0x8]
   1400064c2:	76 1b                	jbe    0x1400064df
   1400064c4:	66 0f ef c0          	pxor   xmm0,xmm0
   1400064c8:	f2 0f 2a 45 58       	cvtsi2sd xmm0,DWORD PTR [rbp+0x58]
   1400064cd:	66 0f 2e 45 08       	ucomisd xmm0,QWORD PTR [rbp+0x8]
   1400064d2:	7a 07                	jp     0x1400064db
   1400064d4:	66 0f 2e 45 08       	ucomisd xmm0,QWORD PTR [rbp+0x8]
   1400064d9:	74 04                	je     0x1400064df
   1400064db:	83 6d 58 01          	sub    DWORD PTR [rbp+0x58],0x1
   1400064df:	c7 45 54 01 00 00 00 	mov    DWORD PTR [rbp+0x54],0x1
   1400064e6:	8b 45 ac             	mov    eax,DWORD PTR [rbp-0x54]
   1400064e9:	8b 4d b4             	mov    ecx,DWORD PTR [rbp-0x4c]
   1400064ec:	8b 95 98 00 00 00    	mov    edx,DWORD PTR [rbp+0x98]
   1400064f2:	01 ca                	add    edx,ecx
   1400064f4:	83 ea 01             	sub    edx,0x1
   1400064f7:	c1 e2 14             	shl    edx,0x14
   1400064fa:	01 d0                	add    eax,edx
   1400064fc:	89 45 ac             	mov    DWORD PTR [rbp-0x54],eax
   1400064ff:	83 7d 58 00          	cmp    DWORD PTR [rbp+0x58],0x0
   140006503:	78 2e                	js     0x140006533
   140006505:	83 7d 58 16          	cmp    DWORD PTR [rbp+0x58],0x16
   140006509:	7f 28                	jg     0x140006533
   14000650b:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006510:	48 8b 05 39 53 00 00 	mov    rax,QWORD PTR [rip+0x5339]        # 0x14000b850
   140006517:	8b 55 58             	mov    edx,DWORD PTR [rbp+0x58]
   14000651a:	48 63 d2             	movsxd rdx,edx
   14000651d:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   140006522:	66 0f 2f c1          	comisd xmm0,xmm1
   140006526:	76 04                	jbe    0x14000652c
   140006528:	83 6d 58 01          	sub    DWORD PTR [rbp+0x58],0x1
   14000652c:	c7 45 54 00 00 00 00 	mov    DWORD PTR [rbp+0x54],0x0
   140006533:	8b 55 b4             	mov    edx,DWORD PTR [rbp-0x4c]
   140006536:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006539:	29 c2                	sub    edx,eax
   14000653b:	8d 42 ff             	lea    eax,[rdx-0x1]
   14000653e:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   140006541:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140006545:	78 0f                	js     0x140006556
   140006547:	c7 45 7c 00 00 00 00 	mov    DWORD PTR [rbp+0x7c],0x0
   14000654e:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   140006551:	89 45 40             	mov    DWORD PTR [rbp+0x40],eax
   140006554:	eb 0f                	jmp    0x140006565
   140006556:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   140006559:	f7 d8                	neg    eax
   14000655b:	89 45 7c             	mov    DWORD PTR [rbp+0x7c],eax
   14000655e:	c7 45 40 00 00 00 00 	mov    DWORD PTR [rbp+0x40],0x0
   140006565:	83 7d 58 00          	cmp    DWORD PTR [rbp+0x58],0x0
   140006569:	78 15                	js     0x140006580
   14000656b:	c7 45 78 00 00 00 00 	mov    DWORD PTR [rbp+0x78],0x0
   140006572:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   140006575:	89 45 3c             	mov    DWORD PTR [rbp+0x3c],eax
   140006578:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   14000657b:	01 45 40             	add    DWORD PTR [rbp+0x40],eax
   14000657e:	eb 15                	jmp    0x140006595
   140006580:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   140006583:	29 45 7c             	sub    DWORD PTR [rbp+0x7c],eax
   140006586:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   140006589:	f7 d8                	neg    eax
   14000658b:	89 45 78             	mov    DWORD PTR [rbp+0x78],eax
   14000658e:	c7 45 3c 00 00 00 00 	mov    DWORD PTR [rbp+0x3c],0x0
   140006595:	83 bd b0 00 00 00 00 	cmp    DWORD PTR [rbp+0xb0],0x0
   14000659c:	78 09                	js     0x1400065a7
   14000659e:	83 bd b0 00 00 00 09 	cmp    DWORD PTR [rbp+0xb0],0x9
   1400065a5:	7e 0a                	jle    0x1400065b1
   1400065a7:	c7 85 b0 00 00 00 00 	mov    DWORD PTR [rbp+0xb0],0x0
   1400065ae:	00 00 00 
   1400065b1:	c7 45 34 01 00 00 00 	mov    DWORD PTR [rbp+0x34],0x1
   1400065b8:	83 bd b0 00 00 00 05 	cmp    DWORD PTR [rbp+0xb0],0x5
   1400065bf:	7e 10                	jle    0x1400065d1
   1400065c1:	83 ad b0 00 00 00 04 	sub    DWORD PTR [rbp+0xb0],0x4
   1400065c8:	c7 45 34 00 00 00 00 	mov    DWORD PTR [rbp+0x34],0x0
   1400065cf:	eb 1b                	jmp    0x1400065ec
   1400065d1:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400065d4:	3d f9 03 00 00       	cmp    eax,0x3f9
   1400065d9:	7f 0a                	jg     0x1400065e5
   1400065db:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400065de:	3d 02 fc ff ff       	cmp    eax,0xfffffc02
   1400065e3:	7d 07                	jge    0x1400065ec
   1400065e5:	c7 45 34 00 00 00 00 	mov    DWORD PTR [rbp+0x34],0x0
   1400065ec:	c7 45 50 01 00 00 00 	mov    DWORD PTR [rbp+0x50],0x1
   1400065f3:	c7 45 68 ff ff ff ff 	mov    DWORD PTR [rbp+0x68],0xffffffff
   1400065fa:	8b 45 68             	mov    eax,DWORD PTR [rbp+0x68]
   1400065fd:	89 45 6c             	mov    DWORD PTR [rbp+0x6c],eax
   140006600:	83 bd b0 00 00 00 05 	cmp    DWORD PTR [rbp+0xb0],0x5
   140006607:	0f 84 c5 00 00 00    	je     0x1400066d2
   14000660d:	83 bd b0 00 00 00 05 	cmp    DWORD PTR [rbp+0xb0],0x5
   140006614:	0f 8f e6 00 00 00    	jg     0x140006700
   14000661a:	83 bd b0 00 00 00 04 	cmp    DWORD PTR [rbp+0xb0],0x4
   140006621:	74 7e                	je     0x1400066a1
   140006623:	83 bd b0 00 00 00 04 	cmp    DWORD PTR [rbp+0xb0],0x4
   14000662a:	0f 8f d0 00 00 00    	jg     0x140006700
   140006630:	83 bd b0 00 00 00 03 	cmp    DWORD PTR [rbp+0xb0],0x3
   140006637:	0f 84 8e 00 00 00    	je     0x1400066cb
   14000663d:	83 bd b0 00 00 00 03 	cmp    DWORD PTR [rbp+0xb0],0x3
   140006644:	0f 8f b6 00 00 00    	jg     0x140006700
   14000664a:	83 bd b0 00 00 00 01 	cmp    DWORD PTR [rbp+0xb0],0x1
   140006651:	7f 0e                	jg     0x140006661
   140006653:	83 bd b0 00 00 00 00 	cmp    DWORD PTR [rbp+0xb0],0x0
   14000665a:	79 13                	jns    0x14000666f
   14000665c:	e9 9f 00 00 00       	jmp    0x140006700
   140006661:	83 bd b0 00 00 00 02 	cmp    DWORD PTR [rbp+0xb0],0x2
   140006668:	74 30                	je     0x14000669a
   14000666a:	e9 91 00 00 00       	jmp    0x140006700
   14000666f:	66 0f ef c9          	pxor   xmm1,xmm1
   140006673:	f2 0f 2a 4d f8       	cvtsi2sd xmm1,DWORD PTR [rbp-0x8]
   140006678:	f2 0f 10 05 08 4f 00 	movsd  xmm0,QWORD PTR [rip+0x4f08]        # 0x14000b588
   14000667f:	00 
   140006680:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006684:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   140006688:	83 c0 03             	add    eax,0x3
   14000668b:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   14000668e:	c7 85 b8 00 00 00 00 	mov    DWORD PTR [rbp+0xb8],0x0
   140006695:	00 00 00 
   140006698:	eb 66                	jmp    0x140006700
   14000669a:	c7 45 50 00 00 00 00 	mov    DWORD PTR [rbp+0x50],0x0
   1400066a1:	83 bd b8 00 00 00 00 	cmp    DWORD PTR [rbp+0xb8],0x0
   1400066a8:	7f 0a                	jg     0x1400066b4
   1400066aa:	c7 85 b8 00 00 00 01 	mov    DWORD PTR [rbp+0xb8],0x1
   1400066b1:	00 00 00 
   1400066b4:	8b 85 b8 00 00 00    	mov    eax,DWORD PTR [rbp+0xb8]
   1400066ba:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   1400066bd:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400066c0:	89 45 68             	mov    DWORD PTR [rbp+0x68],eax
   1400066c3:	8b 45 68             	mov    eax,DWORD PTR [rbp+0x68]
   1400066c6:	89 45 6c             	mov    DWORD PTR [rbp+0x6c],eax
   1400066c9:	eb 35                	jmp    0x140006700
   1400066cb:	c7 45 50 00 00 00 00 	mov    DWORD PTR [rbp+0x50],0x0
   1400066d2:	8b 95 b8 00 00 00    	mov    edx,DWORD PTR [rbp+0xb8]
   1400066d8:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   1400066db:	01 d0                	add    eax,edx
   1400066dd:	83 c0 01             	add    eax,0x1
   1400066e0:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   1400066e3:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400066e6:	89 45 6c             	mov    DWORD PTR [rbp+0x6c],eax
   1400066e9:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400066ec:	83 e8 01             	sub    eax,0x1
   1400066ef:	89 45 68             	mov    DWORD PTR [rbp+0x68],eax
   1400066f2:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400066f5:	85 c0                	test   eax,eax
   1400066f7:	7f 07                	jg     0x140006700
   1400066f9:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
   140006700:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006703:	89 c1                	mov    ecx,eax
   140006705:	e8 56 f6 ff ff       	call   0x140005d60
   14000670a:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   14000670e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140006712:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
   140006716:	83 bd b0 00 00 00 01 	cmp    DWORD PTR [rbp+0xb0],0x1
   14000671d:	7f 09                	jg     0x140006728
   14000671f:	c7 45 44 00 00 00 00 	mov    DWORD PTR [rbp+0x44],0x0
   140006726:	eb 38                	jmp    0x140006760
   140006728:	48 8b 85 90 00 00 00 	mov    rax,QWORD PTR [rbp+0x90]
   14000672f:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140006732:	83 e8 01             	sub    eax,0x1
   140006735:	89 45 44             	mov    DWORD PTR [rbp+0x44],eax
   140006738:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   14000673c:	74 22                	je     0x140006760
   14000673e:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   140006742:	79 07                	jns    0x14000674b
   140006744:	c7 45 44 02 00 00 00 	mov    DWORD PTR [rbp+0x44],0x2
   14000674b:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   14000674e:	83 e0 08             	and    eax,0x8
   140006751:	85 c0                	test   eax,eax
   140006753:	74 0b                	je     0x140006760
   140006755:	b8 03 00 00 00       	mov    eax,0x3
   14000675a:	2b 45 44             	sub    eax,DWORD PTR [rbp+0x44]
   14000675d:	89 45 44             	mov    DWORD PTR [rbp+0x44],eax
   140006760:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   140006764:	0f 88 b9 04 00 00    	js     0x140006c23
   14000676a:	83 7d 6c 0e          	cmp    DWORD PTR [rbp+0x6c],0xe
   14000676e:	0f 8f af 04 00 00    	jg     0x140006c23
   140006774:	83 7d 34 00          	cmp    DWORD PTR [rbp+0x34],0x0
   140006778:	0f 84 a5 04 00 00    	je     0x140006c23
   14000677e:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   140006782:	0f 85 9b 04 00 00    	jne    0x140006c23
   140006788:	83 7d 58 00          	cmp    DWORD PTR [rbp+0x58],0x0
   14000678c:	0f 85 91 04 00 00    	jne    0x140006c23
   140006792:	c7 45 b0 00 00 00 00 	mov    DWORD PTR [rbp-0x50],0x0
   140006799:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   14000679e:	f2 0f 11 45 e0       	movsd  QWORD PTR [rbp-0x20],xmm0
   1400067a3:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   1400067a6:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
   1400067a9:	8b 45 6c             	mov    eax,DWORD PTR [rbp+0x6c]
   1400067ac:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
   1400067af:	c7 45 70 02 00 00 00 	mov    DWORD PTR [rbp+0x70],0x2
   1400067b6:	83 7d 58 00          	cmp    DWORD PTR [rbp+0x58],0x0
   1400067ba:	0f 8e 98 00 00 00    	jle    0x140006858
   1400067c0:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   1400067c3:	83 e0 0f             	and    eax,0xf
   1400067c6:	89 c2                	mov    edx,eax
   1400067c8:	48 8b 05 81 50 00 00 	mov    rax,QWORD PTR [rip+0x5081]        # 0x14000b850
   1400067cf:	48 63 d2             	movsxd rdx,edx
   1400067d2:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   1400067d7:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   1400067dc:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   1400067df:	c1 f8 04             	sar    eax,0x4
   1400067e2:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   1400067e5:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   1400067e8:	83 e0 10             	and    eax,0x10
   1400067eb:	85 c0                	test   eax,eax
   1400067ed:	74 5e                	je     0x14000684d
   1400067ef:	83 65 60 0f          	and    DWORD PTR [rbp+0x60],0xf
   1400067f3:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   1400067f8:	48 8b 05 81 4f 00 00 	mov    rax,QWORD PTR [rip+0x4f81]        # 0x14000b780
   1400067ff:	f2 0f 10 48 20       	movsd  xmm1,QWORD PTR [rax+0x20]
   140006804:	f2 0f 5e c1          	divsd  xmm0,xmm1
   140006808:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   14000680d:	83 45 70 01          	add    DWORD PTR [rbp+0x70],0x1
   140006811:	eb 3a                	jmp    0x14000684d
   140006813:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   140006816:	83 e0 01             	and    eax,0x1
   140006819:	85 c0                	test   eax,eax
   14000681b:	74 24                	je     0x140006841
   14000681d:	83 45 70 01          	add    DWORD PTR [rbp+0x70],0x1
   140006821:	8b 55 b0             	mov    edx,DWORD PTR [rbp-0x50]
   140006824:	48 8b 05 55 4f 00 00 	mov    rax,QWORD PTR [rip+0x4f55]        # 0x14000b780
   14000682b:	48 63 d2             	movsxd rdx,edx
   14000682e:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   140006833:	f2 0f 10 4d 08       	movsd  xmm1,QWORD PTR [rbp+0x8]
   140006838:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   14000683c:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   140006841:	d1 7d 60             	sar    DWORD PTR [rbp+0x60],1
   140006844:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006847:	83 c0 01             	add    eax,0x1
   14000684a:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   14000684d:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140006851:	75 c0                	jne    0x140006813
   140006853:	e9 8b 00 00 00       	jmp    0x1400068e3
   140006858:	f2 0f 10 05 30 4d 00 	movsd  xmm0,QWORD PTR [rip+0x4d30]        # 0x14000b590
   14000685f:	00 
   140006860:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   140006865:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   140006868:	f7 d8                	neg    eax
   14000686a:	89 45 5c             	mov    DWORD PTR [rbp+0x5c],eax
   14000686d:	83 7d 5c 00          	cmp    DWORD PTR [rbp+0x5c],0x0
   140006871:	74 70                	je     0x1400068e3
   140006873:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006878:	8b 45 5c             	mov    eax,DWORD PTR [rbp+0x5c]
   14000687b:	83 e0 0f             	and    eax,0xf
   14000687e:	89 c2                	mov    edx,eax
   140006880:	48 8b 05 c9 4f 00 00 	mov    rax,QWORD PTR [rip+0x4fc9]        # 0x14000b850
   140006887:	48 63 d2             	movsxd rdx,edx
   14000688a:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   14000688f:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006893:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006898:	8b 45 5c             	mov    eax,DWORD PTR [rbp+0x5c]
   14000689b:	c1 f8 04             	sar    eax,0x4
   14000689e:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   1400068a1:	eb 3a                	jmp    0x1400068dd
   1400068a3:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   1400068a6:	83 e0 01             	and    eax,0x1
   1400068a9:	85 c0                	test   eax,eax
   1400068ab:	74 24                	je     0x1400068d1
   1400068ad:	83 45 70 01          	add    DWORD PTR [rbp+0x70],0x1
   1400068b1:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   1400068b6:	8b 55 b0             	mov    edx,DWORD PTR [rbp-0x50]
   1400068b9:	48 8b 05 c0 4e 00 00 	mov    rax,QWORD PTR [rip+0x4ec0]        # 0x14000b780
   1400068c0:	48 63 d2             	movsxd rdx,edx
   1400068c3:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   1400068c8:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   1400068cc:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   1400068d1:	d1 7d 60             	sar    DWORD PTR [rbp+0x60],1
   1400068d4:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400068d7:	83 c0 01             	add    eax,0x1
   1400068da:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   1400068dd:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   1400068e1:	75 c0                	jne    0x1400068a3
   1400068e3:	83 7d 54 00          	cmp    DWORD PTR [rbp+0x54],0x0
   1400068e7:	74 47                	je     0x140006930
   1400068e9:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   1400068ee:	f2 0f 10 05 9a 4c 00 	movsd  xmm0,QWORD PTR [rip+0x4c9a]        # 0x14000b590
   1400068f5:	00 
   1400068f6:	66 0f 2f c1          	comisd xmm0,xmm1
   1400068fa:	76 34                	jbe    0x140006930
   1400068fc:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   140006900:	7e 2e                	jle    0x140006930
   140006902:	83 7d 68 00          	cmp    DWORD PTR [rbp+0x68],0x0
   140006906:	0f 8e f5 02 00 00    	jle    0x140006c01
   14000690c:	8b 45 68             	mov    eax,DWORD PTR [rbp+0x68]
   14000690f:	89 45 6c             	mov    DWORD PTR [rbp+0x6c],eax
   140006912:	83 6d 58 01          	sub    DWORD PTR [rbp+0x58],0x1
   140006916:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   14000691b:	f2 0f 10 05 75 4c 00 	movsd  xmm0,QWORD PTR [rip+0x4c75]        # 0x14000b598
   140006922:	00 
   140006923:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006927:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   14000692c:	83 45 70 01          	add    DWORD PTR [rbp+0x70],0x1
   140006930:	66 0f ef c9          	pxor   xmm1,xmm1
   140006934:	f2 0f 2a 4d 70       	cvtsi2sd xmm1,DWORD PTR [rbp+0x70]
   140006939:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   14000693e:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   140006942:	f2 0f 10 05 56 4c 00 	movsd  xmm0,QWORD PTR [rip+0x4c56]        # 0x14000b5a0
   140006949:	00 
   14000694a:	f2 0f 58 c1          	addsd  xmm0,xmm1
   14000694e:	f2 0f 11 45 a0       	movsd  QWORD PTR [rbp-0x60],xmm0
   140006953:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
   140006956:	2d 00 00 40 03       	sub    eax,0x3400000
   14000695b:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
   14000695e:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   140006962:	75 5f                	jne    0x1400069c3
   140006964:	48 c7 45 18 00 00 00 	mov    QWORD PTR [rbp+0x18],0x0
   14000696b:	00 
   14000696c:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140006970:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140006974:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006979:	f2 0f 10 0d 27 4c 00 	movsd  xmm1,QWORD PTR [rip+0x4c27]        # 0x14000b5a8
   140006980:	00 
   140006981:	f2 0f 5c c1          	subsd  xmm0,xmm1
   140006985:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   14000698a:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   14000698f:	f2 0f 10 4d a0       	movsd  xmm1,QWORD PTR [rbp-0x60]
   140006994:	66 0f 2f c1          	comisd xmm0,xmm1
   140006998:	0f 87 ac 07 00 00    	ja     0x14000714a
   14000699e:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   1400069a3:	f2 0f 10 45 a0       	movsd  xmm0,QWORD PTR [rbp-0x60]
   1400069a8:	f3 0f 7e 15 00 4c 00 	movq   xmm2,QWORD PTR [rip+0x4c00]        # 0x14000b5b0
   1400069af:	00 
   1400069b0:	66 0f 57 c2          	xorpd  xmm0,xmm2
   1400069b4:	66 0f 2f c1          	comisd xmm0,xmm1
   1400069b8:	0f 87 6e 07 00 00    	ja     0x14000712c
   1400069be:	e9 42 02 00 00       	jmp    0x140006c05
   1400069c3:	83 7d 50 00          	cmp    DWORD PTR [rbp+0x50],0x0
   1400069c7:	0f 84 22 01 00 00    	je     0x140006aef
   1400069cd:	f2 0f 10 4d 08       	movsd  xmm1,QWORD PTR [rbp+0x8]
   1400069d2:	f2 0f 10 05 e6 4b 00 	movsd  xmm0,QWORD PTR [rip+0x4be6]        # 0x14000b5c0
   1400069d9:	00 
   1400069da:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   1400069de:	8b 45 6c             	mov    eax,DWORD PTR [rbp+0x6c]
   1400069e1:	8d 50 ff             	lea    edx,[rax-0x1]
   1400069e4:	48 8b 05 65 4e 00 00 	mov    rax,QWORD PTR [rip+0x4e65]        # 0x14000b850
   1400069eb:	48 63 d2             	movsxd rdx,edx
   1400069ee:	f2 0f 10 0c d0       	movsd  xmm1,QWORD PTR [rax+rdx*8]
   1400069f3:	f2 0f 5e c1          	divsd  xmm0,xmm1
   1400069f7:	f2 0f 10 4d a0       	movsd  xmm1,QWORD PTR [rbp-0x60]
   1400069fc:	f2 0f 5c c1          	subsd  xmm0,xmm1
   140006a00:	f2 0f 11 45 a0       	movsd  QWORD PTR [rbp-0x60],xmm0
   140006a05:	c7 45 b0 00 00 00 00 	mov    DWORD PTR [rbp-0x50],0x0
   140006a0c:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006a11:	f2 0f 5e 45 08       	divsd  xmm0,QWORD PTR [rbp+0x8]
   140006a16:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   140006a1a:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   140006a1d:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006a22:	66 0f ef c9          	pxor   xmm1,xmm1
   140006a26:	f2 0f 2a 4d d4       	cvtsi2sd xmm1,DWORD PTR [rbp-0x2c]
   140006a2b:	f2 0f 59 4d 08       	mulsd  xmm1,QWORD PTR [rbp+0x8]
   140006a30:	f2 0f 5c c1          	subsd  xmm0,xmm1
   140006a34:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006a39:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140006a3c:	8d 48 30             	lea    ecx,[rax+0x30]
   140006a3f:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006a43:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140006a47:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   140006a4b:	89 ca                	mov    edx,ecx
   140006a4d:	88 10                	mov    BYTE PTR [rax],dl
   140006a4f:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006a54:	f2 0f 10 45 a0       	movsd  xmm0,QWORD PTR [rbp-0x60]
   140006a59:	66 0f 2f c1          	comisd xmm0,xmm1
   140006a5d:	76 29                	jbe    0x140006a88
   140006a5f:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006a64:	66 0f ef c9          	pxor   xmm1,xmm1
   140006a68:	66 0f 2e c1          	ucomisd xmm0,xmm1
   140006a6c:	7a 0e                	jp     0x140006a7c
   140006a6e:	66 0f ef c9          	pxor   xmm1,xmm1
   140006a72:	66 0f 2e c1          	ucomisd xmm0,xmm1
   140006a76:	0f 84 90 0c 00 00    	je     0x14000770c
   140006a7c:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   140006a83:	e9 84 0c 00 00       	jmp    0x14000770c
   140006a88:	f2 0f 10 55 a8       	movsd  xmm2,QWORD PTR [rbp-0x58]
   140006a8d:	f2 0f 10 45 08       	movsd  xmm0,QWORD PTR [rbp+0x8]
   140006a92:	66 0f 28 c8          	movapd xmm1,xmm0
   140006a96:	f2 0f 5c ca          	subsd  xmm1,xmm2
   140006a9a:	f2 0f 10 45 a0       	movsd  xmm0,QWORD PTR [rbp-0x60]
   140006a9f:	66 0f 2f c1          	comisd xmm0,xmm1
   140006aa3:	0f 87 c3 02 00 00    	ja     0x140006d6c
   140006aa9:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006aac:	83 c0 01             	add    eax,0x1
   140006aaf:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006ab2:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006ab5:	39 45 6c             	cmp    DWORD PTR [rbp+0x6c],eax
   140006ab8:	0f 8e 46 01 00 00    	jle    0x140006c04
   140006abe:	f2 0f 10 4d a0       	movsd  xmm1,QWORD PTR [rbp-0x60]
   140006ac3:	f2 0f 10 05 cd 4a 00 	movsd  xmm0,QWORD PTR [rip+0x4acd]        # 0x14000b598
   140006aca:	00 
   140006acb:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006acf:	f2 0f 11 45 a0       	movsd  QWORD PTR [rbp-0x60],xmm0
   140006ad4:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006ad9:	f2 0f 10 05 b7 4a 00 	movsd  xmm0,QWORD PTR [rip+0x4ab7]        # 0x14000b598
   140006ae0:	00 
   140006ae1:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006ae5:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006aea:	e9 1d ff ff ff       	jmp    0x140006a0c
   140006aef:	f2 0f 10 4d a0       	movsd  xmm1,QWORD PTR [rbp-0x60]
   140006af4:	8b 45 6c             	mov    eax,DWORD PTR [rbp+0x6c]
   140006af7:	8d 50 ff             	lea    edx,[rax-0x1]
   140006afa:	48 8b 05 4f 4d 00 00 	mov    rax,QWORD PTR [rip+0x4d4f]        # 0x14000b850
   140006b01:	48 63 d2             	movsxd rdx,edx
   140006b04:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   140006b09:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006b0d:	f2 0f 11 45 a0       	movsd  QWORD PTR [rbp-0x60],xmm0
   140006b12:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
   140006b19:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006b1e:	f2 0f 5e 45 08       	divsd  xmm0,QWORD PTR [rbp+0x8]
   140006b23:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   140006b27:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   140006b2a:	83 7d d4 00          	cmp    DWORD PTR [rbp-0x2c],0x0
   140006b2e:	74 1c                	je     0x140006b4c
   140006b30:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006b35:	66 0f ef c9          	pxor   xmm1,xmm1
   140006b39:	f2 0f 2a 4d d4       	cvtsi2sd xmm1,DWORD PTR [rbp-0x2c]
   140006b3e:	f2 0f 59 4d 08       	mulsd  xmm1,QWORD PTR [rbp+0x8]
   140006b43:	f2 0f 5c c1          	subsd  xmm0,xmm1
   140006b47:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006b4c:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140006b4f:	8d 48 30             	lea    ecx,[rax+0x30]
   140006b52:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006b56:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140006b5a:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   140006b5e:	89 ca                	mov    edx,ecx
   140006b60:	88 10                	mov    BYTE PTR [rax],dl
   140006b62:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006b65:	39 45 6c             	cmp    DWORD PTR [rbp+0x6c],eax
   140006b68:	75 73                	jne    0x140006bdd
   140006b6a:	f2 0f 10 4d 08       	movsd  xmm1,QWORD PTR [rbp+0x8]
   140006b6f:	f2 0f 10 05 49 4a 00 	movsd  xmm0,QWORD PTR [rip+0x4a49]        # 0x14000b5c0
   140006b76:	00 
   140006b77:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006b7b:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   140006b80:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006b85:	f2 0f 10 4d a0       	movsd  xmm1,QWORD PTR [rbp-0x60]
   140006b8a:	f2 0f 58 4d 08       	addsd  xmm1,QWORD PTR [rbp+0x8]
   140006b8f:	66 0f 2f c1          	comisd xmm0,xmm1
   140006b93:	0f 87 d6 01 00 00    	ja     0x140006d6f
   140006b99:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006b9e:	f2 0f 10 55 a0       	movsd  xmm2,QWORD PTR [rbp-0x60]
   140006ba3:	f2 0f 10 45 08       	movsd  xmm0,QWORD PTR [rbp+0x8]
   140006ba8:	f2 0f 5c c2          	subsd  xmm0,xmm2
   140006bac:	66 0f 2f c1          	comisd xmm0,xmm1
   140006bb0:	77 02                	ja     0x140006bb4
   140006bb2:	eb 51                	jmp    0x140006c05
   140006bb4:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006bb9:	66 0f ef c9          	pxor   xmm1,xmm1
   140006bbd:	66 0f 2e c1          	ucomisd xmm0,xmm1
   140006bc1:	7a 0e                	jp     0x140006bd1
   140006bc3:	66 0f ef c9          	pxor   xmm1,xmm1
   140006bc7:	66 0f 2e c1          	ucomisd xmm0,xmm1
   140006bcb:	0f 84 3e 0b 00 00    	je     0x14000770f
   140006bd1:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   140006bd8:	e9 32 0b 00 00       	jmp    0x14000770f
   140006bdd:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006be0:	83 c0 01             	add    eax,0x1
   140006be3:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006be6:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006beb:	f2 0f 10 05 a5 49 00 	movsd  xmm0,QWORD PTR [rip+0x49a5]        # 0x14000b598
   140006bf2:	00 
   140006bf3:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006bf7:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006bfc:	e9 18 ff ff ff       	jmp    0x140006b19
   140006c01:	90                   	nop
   140006c02:	eb 01                	jmp    0x140006c05
   140006c04:	90                   	nop
   140006c05:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140006c09:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
   140006c0d:	f2 0f 10 45 e0       	movsd  xmm0,QWORD PTR [rbp-0x20]
   140006c12:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006c17:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   140006c1a:	89 45 58             	mov    DWORD PTR [rbp+0x58],eax
   140006c1d:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
   140006c20:	89 45 6c             	mov    DWORD PTR [rbp+0x6c],eax
   140006c23:	83 bd 98 00 00 00 00 	cmp    DWORD PTR [rbp+0x98],0x0
   140006c2a:	0f 88 bf 01 00 00    	js     0x140006def
   140006c30:	48 8b 85 90 00 00 00 	mov    rax,QWORD PTR [rbp+0x90]
   140006c37:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140006c3a:	39 45 58             	cmp    DWORD PTR [rbp+0x58],eax
   140006c3d:	0f 8f ac 01 00 00    	jg     0x140006def
   140006c43:	48 8b 05 06 4c 00 00 	mov    rax,QWORD PTR [rip+0x4c06]        # 0x14000b850
   140006c4a:	8b 55 58             	mov    edx,DWORD PTR [rbp+0x58]
   140006c4d:	48 63 d2             	movsxd rdx,edx
   140006c50:	f2 0f 10 04 d0       	movsd  xmm0,QWORD PTR [rax+rdx*8]
   140006c55:	f2 0f 11 45 08       	movsd  QWORD PTR [rbp+0x8],xmm0
   140006c5a:	83 bd b8 00 00 00 00 	cmp    DWORD PTR [rbp+0xb8],0x0
   140006c61:	79 45                	jns    0x140006ca8
   140006c63:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   140006c67:	7f 3f                	jg     0x140006ca8
   140006c69:	48 c7 45 18 00 00 00 	mov    QWORD PTR [rbp+0x18],0x0
   140006c70:	00 
   140006c71:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140006c75:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140006c79:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   140006c7d:	0f 88 ac 04 00 00    	js     0x14000712f
   140006c83:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006c88:	f2 0f 10 55 08       	movsd  xmm2,QWORD PTR [rbp+0x8]
   140006c8d:	f2 0f 10 05 13 49 00 	movsd  xmm0,QWORD PTR [rip+0x4913]        # 0x14000b5a8
   140006c94:	00 
   140006c95:	f2 0f 59 c2          	mulsd  xmm0,xmm2
   140006c99:	66 0f 2f c1          	comisd xmm0,xmm1
   140006c9d:	0f 83 8c 04 00 00    	jae    0x14000712f
   140006ca3:	e9 a6 04 00 00       	jmp    0x14000714e
   140006ca8:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
   140006caf:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006cb4:	f2 0f 5e 45 08       	divsd  xmm0,QWORD PTR [rbp+0x8]
   140006cb9:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   140006cbd:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   140006cc0:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006cc5:	66 0f ef c9          	pxor   xmm1,xmm1
   140006cc9:	f2 0f 2a 4d d4       	cvtsi2sd xmm1,DWORD PTR [rbp-0x2c]
   140006cce:	f2 0f 59 4d 08       	mulsd  xmm1,QWORD PTR [rbp+0x8]
   140006cd3:	f2 0f 5c c1          	subsd  xmm0,xmm1
   140006cd7:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006cdc:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140006cdf:	8d 48 30             	lea    ecx,[rax+0x30]
   140006ce2:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006ce6:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140006cea:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   140006cee:	89 ca                	mov    edx,ecx
   140006cf0:	88 10                	mov    BYTE PTR [rax],dl
   140006cf2:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006cf7:	66 0f ef c9          	pxor   xmm1,xmm1
   140006cfb:	66 0f 2e c1          	ucomisd xmm0,xmm1
   140006cff:	7a 0e                	jp     0x140006d0f
   140006d01:	66 0f ef c9          	pxor   xmm1,xmm1
   140006d05:	66 0f 2e c1          	ucomisd xmm0,xmm1
   140006d09:	0f 84 da 00 00 00    	je     0x140006de9
   140006d0f:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006d12:	39 45 6c             	cmp    DWORD PTR [rbp+0x6c],eax
   140006d15:	0f 85 aa 00 00 00    	jne    0x140006dc5
   140006d1b:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   140006d1f:	74 12                	je     0x140006d33
   140006d21:	83 7d 44 01          	cmp    DWORD PTR [rbp+0x44],0x1
   140006d25:	74 4b                	je     0x140006d72
   140006d27:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   140006d2e:	e9 e0 09 00 00       	jmp    0x140007713
   140006d33:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006d38:	f2 0f 58 c0          	addsd  xmm0,xmm0
   140006d3c:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006d41:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006d46:	66 0f 2f 45 08       	comisd xmm0,QWORD PTR [rbp+0x8]
   140006d4b:	77 28                	ja     0x140006d75
   140006d4d:	f2 0f 10 45 a8       	movsd  xmm0,QWORD PTR [rbp-0x58]
   140006d52:	66 0f 2e 45 08       	ucomisd xmm0,QWORD PTR [rbp+0x8]
   140006d57:	7a 63                	jp     0x140006dbc
   140006d59:	66 0f 2e 45 08       	ucomisd xmm0,QWORD PTR [rbp+0x8]
   140006d5e:	75 5c                	jne    0x140006dbc
   140006d60:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140006d63:	83 e0 01             	and    eax,0x1
   140006d66:	85 c0                	test   eax,eax
   140006d68:	74 52                	je     0x140006dbc
   140006d6a:	eb 09                	jmp    0x140006d75
   140006d6c:	90                   	nop
   140006d6d:	eb 07                	jmp    0x140006d76
   140006d6f:	90                   	nop
   140006d70:	eb 04                	jmp    0x140006d76
   140006d72:	90                   	nop
   140006d73:	eb 01                	jmp    0x140006d76
   140006d75:	90                   	nop
   140006d76:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   140006d7d:	eb 17                	jmp    0x140006d96
   140006d7f:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006d83:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   140006d87:	75 0d                	jne    0x140006d96
   140006d89:	83 45 58 01          	add    DWORD PTR [rbp+0x58],0x1
   140006d8d:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006d91:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140006d94:	eb 10                	jmp    0x140006da6
   140006d96:	48 83 6d 00 01       	sub    QWORD PTR [rbp+0x0],0x1
   140006d9b:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006d9f:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140006da2:	3c 39                	cmp    al,0x39
   140006da4:	74 d9                	je     0x140006d7f
   140006da6:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140006daa:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140006dae:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   140006db2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   140006db5:	83 c2 01             	add    edx,0x1
   140006db8:	88 10                	mov    BYTE PTR [rax],dl
   140006dba:	eb 2e                	jmp    0x140006dea
   140006dbc:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   140006dc3:	eb 25                	jmp    0x140006dea
   140006dc5:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006dc8:	83 c0 01             	add    eax,0x1
   140006dcb:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006dce:	f2 0f 10 4d a8       	movsd  xmm1,QWORD PTR [rbp-0x58]
   140006dd3:	f2 0f 10 05 bd 47 00 	movsd  xmm0,QWORD PTR [rip+0x47bd]        # 0x14000b598
   140006dda:	00 
   140006ddb:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   140006ddf:	f2 0f 11 45 a8       	movsd  QWORD PTR [rbp-0x58],xmm0
   140006de4:	e9 c6 fe ff ff       	jmp    0x140006caf
   140006de9:	90                   	nop
   140006dea:	e9 24 09 00 00       	jmp    0x140007713
   140006def:	8b 45 7c             	mov    eax,DWORD PTR [rbp+0x7c]
   140006df2:	89 45 4c             	mov    DWORD PTR [rbp+0x4c],eax
   140006df5:	8b 45 78             	mov    eax,DWORD PTR [rbp+0x78]
   140006df8:	89 45 48             	mov    DWORD PTR [rbp+0x48],eax
   140006dfb:	48 c7 45 20 00 00 00 	mov    QWORD PTR [rbp+0x20],0x0
   140006e02:	00 
   140006e03:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140006e07:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   140006e0b:	83 7d 50 00          	cmp    DWORD PTR [rbp+0x50],0x0
   140006e0f:	0f 84 e0 00 00 00    	je     0x140006ef5
   140006e15:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
   140006e18:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   140006e1b:	29 c2                	sub    edx,eax
   140006e1d:	89 55 b0             	mov    DWORD PTR [rbp-0x50],edx
   140006e20:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006e23:	8d 50 01             	lea    edx,[rax+0x1]
   140006e26:	89 55 b0             	mov    DWORD PTR [rbp-0x50],edx
   140006e29:	8b 95 98 00 00 00    	mov    edx,DWORD PTR [rbp+0x98]
   140006e2f:	29 c2                	sub    edx,eax
   140006e31:	48 8b 85 90 00 00 00 	mov    rax,QWORD PTR [rbp+0x90]
   140006e38:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140006e3b:	39 c2                	cmp    edx,eax
   140006e3d:	7d 43                	jge    0x140006e82
   140006e3f:	83 bd b0 00 00 00 03 	cmp    DWORD PTR [rbp+0xb0],0x3
   140006e46:	74 3a                	je     0x140006e82
   140006e48:	83 bd b0 00 00 00 05 	cmp    DWORD PTR [rbp+0xb0],0x5
   140006e4f:	74 31                	je     0x140006e82
   140006e51:	48 8b 85 90 00 00 00 	mov    rax,QWORD PTR [rbp+0x90]
   140006e58:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140006e5b:	8b 95 98 00 00 00    	mov    edx,DWORD PTR [rbp+0x98]
   140006e61:	29 c2                	sub    edx,eax
   140006e63:	8d 42 01             	lea    eax,[rdx+0x1]
   140006e66:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006e69:	83 bd b0 00 00 00 01 	cmp    DWORD PTR [rbp+0xb0],0x1
   140006e70:	7e 68                	jle    0x140006eda
   140006e72:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   140006e76:	7e 62                	jle    0x140006eda
   140006e78:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006e7b:	39 45 6c             	cmp    DWORD PTR [rbp+0x6c],eax
   140006e7e:	7d 5a                	jge    0x140006eda
   140006e80:	eb 0a                	jmp    0x140006e8c
   140006e82:	83 bd b0 00 00 00 01 	cmp    DWORD PTR [rbp+0xb0],0x1
   140006e89:	7e 50                	jle    0x140006edb
   140006e8b:	90                   	nop
   140006e8c:	8b 45 6c             	mov    eax,DWORD PTR [rbp+0x6c]
   140006e8f:	83 e8 01             	sub    eax,0x1
   140006e92:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   140006e95:	8b 45 48             	mov    eax,DWORD PTR [rbp+0x48]
   140006e98:	3b 45 60             	cmp    eax,DWORD PTR [rbp+0x60]
   140006e9b:	7c 08                	jl     0x140006ea5
   140006e9d:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   140006ea0:	29 45 48             	sub    DWORD PTR [rbp+0x48],eax
   140006ea3:	eb 19                	jmp    0x140006ebe
   140006ea5:	8b 45 48             	mov    eax,DWORD PTR [rbp+0x48]
   140006ea8:	29 45 60             	sub    DWORD PTR [rbp+0x60],eax
   140006eab:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   140006eae:	01 45 3c             	add    DWORD PTR [rbp+0x3c],eax
   140006eb1:	8b 45 60             	mov    eax,DWORD PTR [rbp+0x60]
   140006eb4:	01 45 78             	add    DWORD PTR [rbp+0x78],eax
   140006eb7:	c7 45 48 00 00 00 00 	mov    DWORD PTR [rbp+0x48],0x0
   140006ebe:	8b 45 6c             	mov    eax,DWORD PTR [rbp+0x6c]
   140006ec1:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006ec4:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006ec7:	85 c0                	test   eax,eax
   140006ec9:	79 10                	jns    0x140006edb
   140006ecb:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006ece:	29 45 4c             	sub    DWORD PTR [rbp+0x4c],eax
   140006ed1:	c7 45 b0 00 00 00 00 	mov    DWORD PTR [rbp-0x50],0x0
   140006ed8:	eb 01                	jmp    0x140006edb
   140006eda:	90                   	nop
   140006edb:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006ede:	01 45 7c             	add    DWORD PTR [rbp+0x7c],eax
   140006ee1:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006ee4:	01 45 40             	add    DWORD PTR [rbp+0x40],eax
   140006ee7:	b9 01 00 00 00       	mov    ecx,0x1
   140006eec:	e8 f6 0f 00 00       	call   0x140007ee7
   140006ef1:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   140006ef5:	83 7d 4c 00          	cmp    DWORD PTR [rbp+0x4c],0x0
   140006ef9:	7e 26                	jle    0x140006f21
   140006efb:	83 7d 40 00          	cmp    DWORD PTR [rbp+0x40],0x0
   140006eff:	7e 20                	jle    0x140006f21
   140006f01:	8b 55 40             	mov    edx,DWORD PTR [rbp+0x40]
   140006f04:	8b 45 4c             	mov    eax,DWORD PTR [rbp+0x4c]
   140006f07:	39 c2                	cmp    edx,eax
   140006f09:	0f 4e c2             	cmovle eax,edx
   140006f0c:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140006f0f:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006f12:	29 45 7c             	sub    DWORD PTR [rbp+0x7c],eax
   140006f15:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006f18:	29 45 4c             	sub    DWORD PTR [rbp+0x4c],eax
   140006f1b:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140006f1e:	29 45 40             	sub    DWORD PTR [rbp+0x40],eax
   140006f21:	83 7d 78 00          	cmp    DWORD PTR [rbp+0x78],0x0
   140006f25:	7e 7e                	jle    0x140006fa5
   140006f27:	83 7d 50 00          	cmp    DWORD PTR [rbp+0x50],0x0
   140006f2b:	74 65                	je     0x140006f92
   140006f2d:	83 7d 48 00          	cmp    DWORD PTR [rbp+0x48],0x0
   140006f31:	7e 3b                	jle    0x140006f6e
   140006f33:	8b 55 48             	mov    edx,DWORD PTR [rbp+0x48]
   140006f36:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140006f3a:	48 89 c1             	mov    rcx,rax
   140006f3d:	e8 11 12 00 00       	call   0x140008153
   140006f42:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   140006f46:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140006f4a:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140006f4e:	48 89 c1             	mov    rcx,rax
   140006f51:	e8 d7 0f 00 00       	call   0x140007f2d
   140006f56:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   140006f5a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140006f5e:	48 89 c1             	mov    rcx,rax
   140006f61:	e8 c8 0d 00 00       	call   0x140007d2e
   140006f66:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140006f6a:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140006f6e:	8b 45 78             	mov    eax,DWORD PTR [rbp+0x78]
   140006f71:	2b 45 48             	sub    eax,DWORD PTR [rbp+0x48]
   140006f74:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   140006f77:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140006f7b:	74 28                	je     0x140006fa5
   140006f7d:	8b 55 60             	mov    edx,DWORD PTR [rbp+0x60]
   140006f80:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140006f84:	48 89 c1             	mov    rcx,rax
   140006f87:	e8 c7 11 00 00       	call   0x140008153
   140006f8c:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140006f90:	eb 13                	jmp    0x140006fa5
   140006f92:	8b 55 78             	mov    edx,DWORD PTR [rbp+0x78]
   140006f95:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140006f99:	48 89 c1             	mov    rcx,rax
   140006f9c:	e8 b2 11 00 00       	call   0x140008153
   140006fa1:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140006fa5:	b9 01 00 00 00       	mov    ecx,0x1
   140006faa:	e8 38 0f 00 00       	call   0x140007ee7
   140006faf:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140006fb3:	83 7d 3c 00          	cmp    DWORD PTR [rbp+0x3c],0x0
   140006fb7:	7e 13                	jle    0x140006fcc
   140006fb9:	8b 55 3c             	mov    edx,DWORD PTR [rbp+0x3c]
   140006fbc:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140006fc0:	48 89 c1             	mov    rcx,rax
   140006fc3:	e8 8b 11 00 00       	call   0x140008153
   140006fc8:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140006fcc:	c7 45 38 00 00 00 00 	mov    DWORD PTR [rbp+0x38],0x0
   140006fd3:	83 bd b0 00 00 00 01 	cmp    DWORD PTR [rbp+0xb0],0x1
   140006fda:	7f 29                	jg     0x140007005
   140006fdc:	8b 45 b4             	mov    eax,DWORD PTR [rbp-0x4c]
   140006fdf:	83 f8 01             	cmp    eax,0x1
   140006fe2:	75 21                	jne    0x140007005
   140006fe4:	48 8b 85 90 00 00 00 	mov    rax,QWORD PTR [rbp+0x90]
   140006feb:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140006fee:	83 c0 01             	add    eax,0x1
   140006ff1:	39 45 f4             	cmp    DWORD PTR [rbp-0xc],eax
   140006ff4:	7e 0f                	jle    0x140007005
   140006ff6:	83 45 7c 01          	add    DWORD PTR [rbp+0x7c],0x1
   140006ffa:	83 45 40 01          	add    DWORD PTR [rbp+0x40],0x1
   140006ffe:	c7 45 38 01 00 00 00 	mov    DWORD PTR [rbp+0x38],0x1
   140007005:	83 7d 3c 00          	cmp    DWORD PTR [rbp+0x3c],0x0
   140007009:	74 22                	je     0x14000702d
   14000700b:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000700f:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007012:	8d 50 ff             	lea    edx,[rax-0x1]
   140007015:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007019:	48 63 d2             	movsxd rdx,edx
   14000701c:	48 83 c2 04          	add    rdx,0x4
   140007020:	8b 44 90 08          	mov    eax,DWORD PTR [rax+rdx*4+0x8]
   140007024:	89 c1                	mov    ecx,eax
   140007026:	e8 c5 f0 ff ff       	call   0x1400060f0
   14000702b:	eb 05                	jmp    0x140007032
   14000702d:	b8 1f 00 00 00       	mov    eax,0x1f
   140007032:	2b 45 40             	sub    eax,DWORD PTR [rbp+0x40]
   140007035:	83 e8 04             	sub    eax,0x4
   140007038:	83 e0 1f             	and    eax,0x1f
   14000703b:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   14000703e:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140007041:	01 45 4c             	add    DWORD PTR [rbp+0x4c],eax
   140007044:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140007047:	01 45 7c             	add    DWORD PTR [rbp+0x7c],eax
   14000704a:	83 7d 7c 00          	cmp    DWORD PTR [rbp+0x7c],0x0
   14000704e:	7e 13                	jle    0x140007063
   140007050:	8b 55 7c             	mov    edx,DWORD PTR [rbp+0x7c]
   140007053:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007057:	48 89 c1             	mov    rcx,rax
   14000705a:	e8 b1 12 00 00       	call   0x140008310
   14000705f:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140007063:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140007066:	01 45 40             	add    DWORD PTR [rbp+0x40],eax
   140007069:	83 7d 40 00          	cmp    DWORD PTR [rbp+0x40],0x0
   14000706d:	7e 13                	jle    0x140007082
   14000706f:	8b 55 40             	mov    edx,DWORD PTR [rbp+0x40]
   140007072:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007076:	48 89 c1             	mov    rcx,rax
   140007079:	e8 92 12 00 00       	call   0x140008310
   14000707e:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140007082:	83 7d 54 00          	cmp    DWORD PTR [rbp+0x54],0x0
   140007086:	74 5a                	je     0x1400070e2
   140007088:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   14000708c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007090:	48 89 c1             	mov    rcx,rax
   140007093:	e8 05 14 00 00       	call   0x14000849d
   140007098:	85 c0                	test   eax,eax
   14000709a:	79 46                	jns    0x1400070e2
   14000709c:	83 6d 58 01          	sub    DWORD PTR [rbp+0x58],0x1
   1400070a0:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400070a4:	41 b8 00 00 00 00    	mov    r8d,0x0
   1400070aa:	ba 0a 00 00 00       	mov    edx,0xa
   1400070af:	48 89 c1             	mov    rcx,rax
   1400070b2:	e8 02 0d 00 00       	call   0x140007db9
   1400070b7:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   1400070bb:	83 7d 50 00          	cmp    DWORD PTR [rbp+0x50],0x0
   1400070bf:	74 1b                	je     0x1400070dc
   1400070c1:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400070c5:	41 b8 00 00 00 00    	mov    r8d,0x0
   1400070cb:	ba 0a 00 00 00       	mov    edx,0xa
   1400070d0:	48 89 c1             	mov    rcx,rax
   1400070d3:	e8 e1 0c 00 00       	call   0x140007db9
   1400070d8:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   1400070dc:	8b 45 68             	mov    eax,DWORD PTR [rbp+0x68]
   1400070df:	89 45 6c             	mov    DWORD PTR [rbp+0x6c],eax
   1400070e2:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   1400070e6:	0f 8f 81 00 00 00    	jg     0x14000716d
   1400070ec:	83 bd b0 00 00 00 02 	cmp    DWORD PTR [rbp+0xb0],0x2
   1400070f3:	7e 78                	jle    0x14000716d
   1400070f5:	83 7d 6c 00          	cmp    DWORD PTR [rbp+0x6c],0x0
   1400070f9:	78 37                	js     0x140007132
   1400070fb:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400070ff:	41 b8 00 00 00 00    	mov    r8d,0x0
   140007105:	ba 05 00 00 00       	mov    edx,0x5
   14000710a:	48 89 c1             	mov    rcx,rax
   14000710d:	e8 a7 0c 00 00       	call   0x140007db9
   140007112:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140007116:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   14000711a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000711e:	48 89 c1             	mov    rcx,rax
   140007121:	e8 77 13 00 00       	call   0x14000849d
   140007126:	85 c0                	test   eax,eax
   140007128:	7f 23                	jg     0x14000714d
   14000712a:	eb 06                	jmp    0x140007132
   14000712c:	90                   	nop
   14000712d:	eb 04                	jmp    0x140007133
   14000712f:	90                   	nop
   140007130:	eb 01                	jmp    0x140007133
   140007132:	90                   	nop
   140007133:	8b 85 b8 00 00 00    	mov    eax,DWORD PTR [rbp+0xb8]
   140007139:	f7 d0                	not    eax
   14000713b:	89 45 58             	mov    DWORD PTR [rbp+0x58],eax
   14000713e:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   140007145:	e9 84 05 00 00       	jmp    0x1400076ce
   14000714a:	90                   	nop
   14000714b:	eb 01                	jmp    0x14000714e
   14000714d:	90                   	nop
   14000714e:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   140007155:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007159:	48 8d 50 01          	lea    rdx,[rax+0x1]
   14000715d:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   140007161:	c6 00 31             	mov    BYTE PTR [rax],0x31
   140007164:	83 45 58 01          	add    DWORD PTR [rbp+0x58],0x1
   140007168:	e9 61 05 00 00       	jmp    0x1400076ce
   14000716d:	83 7d 50 00          	cmp    DWORD PTR [rbp+0x50],0x0
   140007171:	0f 84 14 04 00 00    	je     0x14000758b
   140007177:	83 7d 4c 00          	cmp    DWORD PTR [rbp+0x4c],0x0
   14000717b:	7e 13                	jle    0x140007190
   14000717d:	8b 55 4c             	mov    edx,DWORD PTR [rbp+0x4c]
   140007180:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007184:	48 89 c1             	mov    rcx,rax
   140007187:	e8 84 11 00 00       	call   0x140008310
   14000718c:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   140007190:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007194:	48 89 45 20          	mov    QWORD PTR [rbp+0x20],rax
   140007198:	83 7d 38 00          	cmp    DWORD PTR [rbp+0x38],0x0
   14000719c:	74 57                	je     0x1400071f5
   14000719e:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400071a2:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400071a5:	89 c1                	mov    ecx,eax
   1400071a7:	e8 41 0a 00 00       	call   0x140007bed
   1400071ac:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   1400071b0:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400071b4:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400071b7:	48 98                	cdqe
   1400071b9:	48 83 c0 02          	add    rax,0x2
   1400071bd:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
   1400071c4:	00 
   1400071c5:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400071c9:	48 8d 50 10          	lea    rdx,[rax+0x10]
   1400071cd:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400071d1:	48 83 c0 10          	add    rax,0x10
   1400071d5:	49 89 c8             	mov    r8,rcx
   1400071d8:	48 89 c1             	mov    rcx,rax
   1400071db:	e8 50 25 00 00       	call   0x140009730
   1400071e0:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400071e4:	ba 01 00 00 00       	mov    edx,0x1
   1400071e9:	48 89 c1             	mov    rcx,rax
   1400071ec:	e8 1f 11 00 00       	call   0x140008310
   1400071f1:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   1400071f5:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
   1400071fc:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140007200:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007204:	48 89 c1             	mov    rcx,rax
   140007207:	e8 62 ec ff ff       	call   0x140005e6e
   14000720c:	83 c0 30             	add    eax,0x30
   14000720f:	89 45 74             	mov    DWORD PTR [rbp+0x74],eax
   140007212:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   140007216:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000721a:	48 89 c1             	mov    rcx,rax
   14000721d:	e8 7b 12 00 00       	call   0x14000849d
   140007222:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   140007225:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140007229:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000722d:	48 89 c1             	mov    rcx,rax
   140007230:	e8 38 13 00 00       	call   0x14000856d
   140007235:	48 89 45 c0          	mov    QWORD PTR [rbp-0x40],rax
   140007239:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   14000723d:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   140007240:	85 c0                	test   eax,eax
   140007242:	75 15                	jne    0x140007259
   140007244:	48 8b 55 c0          	mov    rdx,QWORD PTR [rbp-0x40]
   140007248:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000724c:	48 89 c1             	mov    rcx,rax
   14000724f:	e8 49 12 00 00       	call   0x14000849d
   140007254:	89 45 5c             	mov    DWORD PTR [rbp+0x5c],eax
   140007257:	eb 07                	jmp    0x140007260
   140007259:	c7 45 5c 01 00 00 00 	mov    DWORD PTR [rbp+0x5c],0x1
   140007260:	48 8b 45 c0          	mov    rax,QWORD PTR [rbp-0x40]
   140007264:	48 89 c1             	mov    rcx,rax
   140007267:	e8 c2 0a 00 00       	call   0x140007d2e
   14000726c:	83 7d 5c 00          	cmp    DWORD PTR [rbp+0x5c],0x0
   140007270:	75 70                	jne    0x1400072e2
   140007272:	83 bd b0 00 00 00 00 	cmp    DWORD PTR [rbp+0xb0],0x0
   140007279:	75 67                	jne    0x1400072e2
   14000727b:	48 8b 85 a0 00 00 00 	mov    rax,QWORD PTR [rbp+0xa0]
   140007282:	8b 00                	mov    eax,DWORD PTR [rax]
   140007284:	83 e0 01             	and    eax,0x1
   140007287:	85 c0                	test   eax,eax
   140007289:	75 57                	jne    0x1400072e2
   14000728b:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   14000728f:	75 51                	jne    0x1400072e2
   140007291:	83 7d 74 39          	cmp    DWORD PTR [rbp+0x74],0x39
   140007295:	0f 84 01 02 00 00    	je     0x14000749c
   14000729b:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   14000729f:	7f 20                	jg     0x1400072c1
   1400072a1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400072a5:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400072a8:	83 f8 01             	cmp    eax,0x1
   1400072ab:	7f 0b                	jg     0x1400072b8
   1400072ad:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400072b1:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   1400072b4:	85 c0                	test   eax,eax
   1400072b6:	74 14                	je     0x1400072cc
   1400072b8:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   1400072bf:	eb 0b                	jmp    0x1400072cc
   1400072c1:	83 45 74 01          	add    DWORD PTR [rbp+0x74],0x1
   1400072c5:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   1400072cc:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   1400072d0:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400072d4:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   1400072d8:	8b 55 74             	mov    edx,DWORD PTR [rbp+0x74]
   1400072db:	88 10                	mov    BYTE PTR [rax],dl
   1400072dd:	e9 ec 03 00 00       	jmp    0x1400076ce
   1400072e2:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   1400072e6:	78 2b                	js     0x140007313
   1400072e8:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   1400072ec:	0f 85 96 01 00 00    	jne    0x140007488
   1400072f2:	83 bd b0 00 00 00 00 	cmp    DWORD PTR [rbp+0xb0],0x0
   1400072f9:	0f 85 89 01 00 00    	jne    0x140007488
   1400072ff:	48 8b 85 a0 00 00 00 	mov    rax,QWORD PTR [rbp+0xa0]
   140007306:	8b 00                	mov    eax,DWORD PTR [rax]
   140007308:	83 e0 01             	and    eax,0x1
   14000730b:	85 c0                	test   eax,eax
   14000730d:	0f 85 75 01 00 00    	jne    0x140007488
   140007313:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   140007317:	0f 84 db 00 00 00    	je     0x1400073f8
   14000731d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007321:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007324:	83 f8 01             	cmp    eax,0x1
   140007327:	7f 0f                	jg     0x140007338
   140007329:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000732d:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   140007330:	85 c0                	test   eax,eax
   140007332:	0f 84 c0 00 00 00    	je     0x1400073f8
   140007338:	83 7d 44 02          	cmp    DWORD PTR [rbp+0x44],0x2
   14000733c:	0f 85 83 00 00 00    	jne    0x1400073c5
   140007342:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   140007349:	e9 24 01 00 00       	jmp    0x140007472
   14000734e:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007352:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140007356:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   14000735a:	8b 55 74             	mov    edx,DWORD PTR [rbp+0x74]
   14000735d:	88 10                	mov    BYTE PTR [rax],dl
   14000735f:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007363:	41 b8 00 00 00 00    	mov    r8d,0x0
   140007369:	ba 0a 00 00 00       	mov    edx,0xa
   14000736e:	48 89 c1             	mov    rcx,rax
   140007371:	e8 43 0a 00 00       	call   0x140007db9
   140007376:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000737a:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000737e:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   140007382:	75 08                	jne    0x14000738c
   140007384:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140007388:	48 89 45 20          	mov    QWORD PTR [rbp+0x20],rax
   14000738c:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140007390:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   140007394:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007398:	41 b8 00 00 00 00    	mov    r8d,0x0
   14000739e:	ba 0a 00 00 00       	mov    edx,0xa
   1400073a3:	48 89 c1             	mov    rcx,rax
   1400073a6:	e8 0e 0a 00 00       	call   0x140007db9
   1400073ab:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   1400073af:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   1400073b3:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400073b7:	48 89 c1             	mov    rcx,rax
   1400073ba:	e8 af ea ff ff       	call   0x140005e6e
   1400073bf:	83 c0 30             	add    eax,0x30
   1400073c2:	89 45 74             	mov    DWORD PTR [rbp+0x74],eax
   1400073c5:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   1400073c9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400073cd:	48 89 c1             	mov    rcx,rax
   1400073d0:	e8 c8 10 00 00       	call   0x14000849d
   1400073d5:	85 c0                	test   eax,eax
   1400073d7:	0f 8f 71 ff ff ff    	jg     0x14000734e
   1400073dd:	8b 45 74             	mov    eax,DWORD PTR [rbp+0x74]
   1400073e0:	8d 50 01             	lea    edx,[rax+0x1]
   1400073e3:	89 55 74             	mov    DWORD PTR [rbp+0x74],edx
   1400073e6:	83 f8 39             	cmp    eax,0x39
   1400073e9:	0f 84 b0 00 00 00    	je     0x14000749f
   1400073ef:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   1400073f6:	eb 7a                	jmp    0x140007472
   1400073f8:	83 7d 5c 00          	cmp    DWORD PTR [rbp+0x5c],0x0
   1400073fc:	7e 53                	jle    0x140007451
   1400073fe:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007402:	ba 01 00 00 00       	mov    edx,0x1
   140007407:	48 89 c1             	mov    rcx,rax
   14000740a:	e8 01 0f 00 00       	call   0x140008310
   14000740f:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140007413:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140007417:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000741b:	48 89 c1             	mov    rcx,rax
   14000741e:	e8 7a 10 00 00       	call   0x14000849d
   140007423:	89 45 5c             	mov    DWORD PTR [rbp+0x5c],eax
   140007426:	83 7d 5c 00          	cmp    DWORD PTR [rbp+0x5c],0x0
   14000742a:	7f 10                	jg     0x14000743c
   14000742c:	83 7d 5c 00          	cmp    DWORD PTR [rbp+0x5c],0x0
   140007430:	75 18                	jne    0x14000744a
   140007432:	8b 45 74             	mov    eax,DWORD PTR [rbp+0x74]
   140007435:	83 e0 01             	and    eax,0x1
   140007438:	85 c0                	test   eax,eax
   14000743a:	74 0e                	je     0x14000744a
   14000743c:	8b 45 74             	mov    eax,DWORD PTR [rbp+0x74]
   14000743f:	8d 50 01             	lea    edx,[rax+0x1]
   140007442:	89 55 74             	mov    DWORD PTR [rbp+0x74],edx
   140007445:	83 f8 39             	cmp    eax,0x39
   140007448:	74 58                	je     0x1400074a2
   14000744a:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   140007451:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007455:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007458:	83 f8 01             	cmp    eax,0x1
   14000745b:	7f 0b                	jg     0x140007468
   14000745d:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007461:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   140007464:	85 c0                	test   eax,eax
   140007466:	74 09                	je     0x140007471
   140007468:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   14000746f:	eb 01                	jmp    0x140007472
   140007471:	90                   	nop
   140007472:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007476:	48 8d 50 01          	lea    rdx,[rax+0x1]
   14000747a:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   14000747e:	8b 55 74             	mov    edx,DWORD PTR [rbp+0x74]
   140007481:	88 10                	mov    BYTE PTR [rax],dl
   140007483:	e9 46 02 00 00       	jmp    0x1400076ce
   140007488:	83 7d 5c 00          	cmp    DWORD PTR [rbp+0x5c],0x0
   14000748c:	7e 52                	jle    0x1400074e0
   14000748e:	83 7d 44 02          	cmp    DWORD PTR [rbp+0x44],0x2
   140007492:	74 4c                	je     0x1400074e0
   140007494:	83 7d 74 39          	cmp    DWORD PTR [rbp+0x74],0x39
   140007498:	75 24                	jne    0x1400074be
   14000749a:	eb 07                	jmp    0x1400074a3
   14000749c:	90                   	nop
   14000749d:	eb 04                	jmp    0x1400074a3
   14000749f:	90                   	nop
   1400074a0:	eb 01                	jmp    0x1400074a3
   1400074a2:	90                   	nop
   1400074a3:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   1400074a7:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400074ab:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   1400074af:	c6 00 39             	mov    BYTE PTR [rax],0x39
   1400074b2:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   1400074b9:	e9 9d 01 00 00       	jmp    0x14000765b
   1400074be:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   1400074c5:	8b 45 74             	mov    eax,DWORD PTR [rbp+0x74]
   1400074c8:	8d 48 01             	lea    ecx,[rax+0x1]
   1400074cb:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   1400074cf:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400074d3:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   1400074d7:	89 ca                	mov    edx,ecx
   1400074d9:	88 10                	mov    BYTE PTR [rax],dl
   1400074db:	e9 ee 01 00 00       	jmp    0x1400076ce
   1400074e0:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   1400074e4:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400074e8:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   1400074ec:	8b 55 74             	mov    edx,DWORD PTR [rbp+0x74]
   1400074ef:	88 10                	mov    BYTE PTR [rax],dl
   1400074f1:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400074f4:	39 45 6c             	cmp    DWORD PTR [rbp+0x6c],eax
   1400074f7:	0f 84 ea 00 00 00    	je     0x1400075e7
   1400074fd:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007501:	41 b8 00 00 00 00    	mov    r8d,0x0
   140007507:	ba 0a 00 00 00       	mov    edx,0xa
   14000750c:	48 89 c1             	mov    rcx,rax
   14000750f:	e8 a5 08 00 00       	call   0x140007db9
   140007514:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   140007518:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000751c:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   140007520:	75 25                	jne    0x140007547
   140007522:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007526:	41 b8 00 00 00 00    	mov    r8d,0x0
   14000752c:	ba 0a 00 00 00       	mov    edx,0xa
   140007531:	48 89 c1             	mov    rcx,rax
   140007534:	e8 80 08 00 00       	call   0x140007db9
   140007539:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   14000753d:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007541:	48 89 45 20          	mov    QWORD PTR [rbp+0x20],rax
   140007545:	eb 36                	jmp    0x14000757d
   140007547:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   14000754b:	41 b8 00 00 00 00    	mov    r8d,0x0
   140007551:	ba 0a 00 00 00       	mov    edx,0xa
   140007556:	48 89 c1             	mov    rcx,rax
   140007559:	e8 5b 08 00 00       	call   0x140007db9
   14000755e:	48 89 45 20          	mov    QWORD PTR [rbp+0x20],rax
   140007562:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007566:	41 b8 00 00 00 00    	mov    r8d,0x0
   14000756c:	ba 0a 00 00 00       	mov    edx,0xa
   140007571:	48 89 c1             	mov    rcx,rax
   140007574:	e8 40 08 00 00       	call   0x140007db9
   140007579:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   14000757d:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   140007580:	83 c0 01             	add    eax,0x1
   140007583:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   140007586:	e9 71 fc ff ff       	jmp    0x1400071fc
   14000758b:	c7 45 b0 01 00 00 00 	mov    DWORD PTR [rbp-0x50],0x1
   140007592:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140007596:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000759a:	48 89 c1             	mov    rcx,rax
   14000759d:	e8 cc e8 ff ff       	call   0x140005e6e
   1400075a2:	83 c0 30             	add    eax,0x30
   1400075a5:	89 45 74             	mov    DWORD PTR [rbp+0x74],eax
   1400075a8:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   1400075ac:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400075b0:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   1400075b4:	8b 55 74             	mov    edx,DWORD PTR [rbp+0x74]
   1400075b7:	88 10                	mov    BYTE PTR [rax],dl
   1400075b9:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400075bc:	39 45 6c             	cmp    DWORD PTR [rbp+0x6c],eax
   1400075bf:	7e 29                	jle    0x1400075ea
   1400075c1:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400075c5:	41 b8 00 00 00 00    	mov    r8d,0x0
   1400075cb:	ba 0a 00 00 00       	mov    edx,0xa
   1400075d0:	48 89 c1             	mov    rcx,rax
   1400075d3:	e8 e1 07 00 00       	call   0x140007db9
   1400075d8:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   1400075dc:	8b 45 b0             	mov    eax,DWORD PTR [rbp-0x50]
   1400075df:	83 c0 01             	add    eax,0x1
   1400075e2:	89 45 b0             	mov    DWORD PTR [rbp-0x50],eax
   1400075e5:	eb ab                	jmp    0x140007592
   1400075e7:	90                   	nop
   1400075e8:	eb 01                	jmp    0x1400075eb
   1400075ea:	90                   	nop
   1400075eb:	83 7d 44 00          	cmp    DWORD PTR [rbp+0x44],0x0
   1400075ef:	74 26                	je     0x140007617
   1400075f1:	83 7d 44 02          	cmp    DWORD PTR [rbp+0x44],0x2
   1400075f5:	0f 84 ae 00 00 00    	je     0x1400076a9
   1400075fb:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400075ff:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007602:	83 f8 01             	cmp    eax,0x1
   140007605:	7f 50                	jg     0x140007657
   140007607:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000760b:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   14000760e:	85 c0                	test   eax,eax
   140007610:	75 45                	jne    0x140007657
   140007612:	e9 92 00 00 00       	jmp    0x1400076a9
   140007617:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000761b:	ba 01 00 00 00       	mov    edx,0x1
   140007620:	48 89 c1             	mov    rcx,rax
   140007623:	e8 e8 0c 00 00       	call   0x140008310
   140007628:	48 89 45 28          	mov    QWORD PTR [rbp+0x28],rax
   14000762c:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140007630:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007634:	48 89 c1             	mov    rcx,rax
   140007637:	e8 61 0e 00 00       	call   0x14000849d
   14000763c:	89 45 60             	mov    DWORD PTR [rbp+0x60],eax
   14000763f:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140007643:	7f 15                	jg     0x14000765a
   140007645:	83 7d 60 00          	cmp    DWORD PTR [rbp+0x60],0x0
   140007649:	75 61                	jne    0x1400076ac
   14000764b:	8b 45 74             	mov    eax,DWORD PTR [rbp+0x74]
   14000764e:	83 e0 01             	and    eax,0x1
   140007651:	85 c0                	test   eax,eax
   140007653:	74 57                	je     0x1400076ac
   140007655:	eb 03                	jmp    0x14000765a
   140007657:	90                   	nop
   140007658:	eb 01                	jmp    0x14000765b
   14000765a:	90                   	nop
   14000765b:	c7 45 64 20 00 00 00 	mov    DWORD PTR [rbp+0x64],0x20
   140007662:	eb 1f                	jmp    0x140007683
   140007664:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007668:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   14000766c:	75 15                	jne    0x140007683
   14000766e:	83 45 58 01          	add    DWORD PTR [rbp+0x58],0x1
   140007672:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007676:	48 8d 50 01          	lea    rdx,[rax+0x1]
   14000767a:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   14000767e:	c6 00 31             	mov    BYTE PTR [rax],0x31
   140007681:	eb 4b                	jmp    0x1400076ce
   140007683:	48 83 6d 00 01       	sub    QWORD PTR [rbp+0x0],0x1
   140007688:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   14000768c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   14000768f:	3c 39                	cmp    al,0x39
   140007691:	74 d1                	je     0x140007664
   140007693:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007697:	48 8d 50 01          	lea    rdx,[rax+0x1]
   14000769b:	48 89 55 00          	mov    QWORD PTR [rbp+0x0],rdx
   14000769f:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1400076a2:	83 c2 01             	add    edx,0x1
   1400076a5:	88 10                	mov    BYTE PTR [rax],dl
   1400076a7:	eb 25                	jmp    0x1400076ce
   1400076a9:	90                   	nop
   1400076aa:	eb 01                	jmp    0x1400076ad
   1400076ac:	90                   	nop
   1400076ad:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400076b1:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400076b4:	83 f8 01             	cmp    eax,0x1
   1400076b7:	7f 0b                	jg     0x1400076c4
   1400076b9:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400076bd:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   1400076c0:	85 c0                	test   eax,eax
   1400076c2:	74 09                	je     0x1400076cd
   1400076c4:	c7 45 64 10 00 00 00 	mov    DWORD PTR [rbp+0x64],0x10
   1400076cb:	eb 01                	jmp    0x1400076ce
   1400076cd:	90                   	nop
   1400076ce:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400076d2:	48 89 c1             	mov    rcx,rax
   1400076d5:	e8 54 06 00 00       	call   0x140007d2e
   1400076da:	48 83 7d 18 00       	cmp    QWORD PTR [rbp+0x18],0x0
   1400076df:	74 31                	je     0x140007712
   1400076e1:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
   1400076e6:	74 16                	je     0x1400076fe
   1400076e8:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400076ec:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   1400076f0:	74 0c                	je     0x1400076fe
   1400076f2:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400076f6:	48 89 c1             	mov    rcx,rax
   1400076f9:	e8 30 06 00 00       	call   0x140007d2e
   1400076fe:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007702:	48 89 c1             	mov    rcx,rax
   140007705:	e8 24 06 00 00       	call   0x140007d2e
   14000770a:	eb 0e                	jmp    0x14000771a
   14000770c:	90                   	nop
   14000770d:	eb 0b                	jmp    0x14000771a
   14000770f:	90                   	nop
   140007710:	eb 08                	jmp    0x14000771a
   140007712:	90                   	nop
   140007713:	eb 05                	jmp    0x14000771a
   140007715:	48 83 6d 00 01       	sub    QWORD PTR [rbp+0x0],0x1
   14000771a:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   14000771e:	48 39 45 e8          	cmp    QWORD PTR [rbp-0x18],rax
   140007722:	73 0f                	jae    0x140007733
   140007724:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007728:	48 83 e8 01          	sub    rax,0x1
   14000772c:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   14000772f:	3c 30                	cmp    al,0x30
   140007731:	74 e2                	je     0x140007715
   140007733:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140007737:	48 89 c1             	mov    rcx,rax
   14000773a:	e8 ef 05 00 00       	call   0x140007d2e
   14000773f:	48 8b 45 00          	mov    rax,QWORD PTR [rbp+0x0]
   140007743:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140007746:	8b 45 58             	mov    eax,DWORD PTR [rbp+0x58]
   140007749:	8d 50 01             	lea    edx,[rax+0x1]
   14000774c:	48 8b 85 c0 00 00 00 	mov    rax,QWORD PTR [rbp+0xc0]
   140007753:	89 10                	mov    DWORD PTR [rax],edx
   140007755:	48 83 bd c8 00 00 00 	cmp    QWORD PTR [rbp+0xc8],0x0
   14000775c:	00 
   14000775d:	74 0e                	je     0x14000776d
   14000775f:	48 8b 85 c8 00 00 00 	mov    rax,QWORD PTR [rbp+0xc8]
   140007766:	48 8b 55 00          	mov    rdx,QWORD PTR [rbp+0x0]
   14000776a:	48 89 10             	mov    QWORD PTR [rax],rdx
   14000776d:	48 8b 85 a8 00 00 00 	mov    rax,QWORD PTR [rbp+0xa8]
   140007774:	8b 00                	mov    eax,DWORD PTR [rax]
   140007776:	0b 45 64             	or     eax,DWORD PTR [rbp+0x64]
   140007779:	89 c2                	mov    edx,eax
   14000777b:	48 8b 85 a8 00 00 00 	mov    rax,QWORD PTR [rbp+0xa8]
   140007782:	89 10                	mov    DWORD PTR [rax],edx
   140007784:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140007788:	48 81 c4 00 01 00 00 	add    rsp,0x100
   14000778f:	5d                   	pop    rbp
   140007790:	c3                   	ret
   140007791:	90                   	nop
   140007792:	90                   	nop
   140007793:	90                   	nop
   140007794:	90                   	nop
   140007795:	90                   	nop
   140007796:	90                   	nop
   140007797:	90                   	nop
   140007798:	90                   	nop
   140007799:	90                   	nop
   14000779a:	90                   	nop
   14000779b:	90                   	nop
   14000779c:	90                   	nop
   14000779d:	90                   	nop
   14000779e:	90                   	nop
   14000779f:	90                   	nop
   1400077a0:	55                   	push   rbp
   1400077a1:	48 89 e5             	mov    rbp,rsp
   1400077a4:	48 83 ec 10          	sub    rsp,0x10
   1400077a8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400077ac:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400077b0:	8b 00                	mov    eax,DWORD PTR [rax]
   1400077b2:	f3 0f bc c0          	tzcnt  eax,eax
   1400077b6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400077b9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400077bd:	8b 10                	mov    edx,DWORD PTR [rax]
   1400077bf:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400077c2:	89 c1                	mov    ecx,eax
   1400077c4:	d3 ea                	shr    edx,cl
   1400077c6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400077ca:	89 10                	mov    DWORD PTR [rax],edx
   1400077cc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400077cf:	48 83 c4 10          	add    rsp,0x10
   1400077d3:	5d                   	pop    rbp
   1400077d4:	c3                   	ret
   1400077d5:	55                   	push   rbp
   1400077d6:	48 89 e5             	mov    rbp,rsp
   1400077d9:	48 83 ec 20          	sub    rsp,0x20
   1400077dd:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400077e1:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   1400077e4:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400077e8:	48 83 c0 18          	add    rax,0x18
   1400077ec:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400077f0:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400077f4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400077f8:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   1400077fb:	c1 f8 05             	sar    eax,0x5
   1400077fe:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140007801:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007805:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007808:	39 45 e8             	cmp    DWORD PTR [rbp-0x18],eax
   14000780b:	0f 8d e4 00 00 00    	jge    0x1400078f5
   140007811:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007815:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007818:	48 98                	cdqe
   14000781a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140007821:	00 
   140007822:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007826:	48 01 d0             	add    rax,rdx
   140007829:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   14000782d:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140007830:	48 98                	cdqe
   140007832:	48 c1 e0 02          	shl    rax,0x2
   140007836:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
   14000783a:	83 65 18 1f          	and    DWORD PTR [rbp+0x18],0x1f
   14000783e:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   140007842:	0f 84 a3 00 00 00    	je     0x1400078eb
   140007848:	b8 20 00 00 00       	mov    eax,0x20
   14000784d:	2b 45 18             	sub    eax,DWORD PTR [rbp+0x18]
   140007850:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140007853:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007857:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000785b:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   14000785f:	8b 10                	mov    edx,DWORD PTR [rax]
   140007861:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140007864:	89 c1                	mov    ecx,eax
   140007866:	d3 ea                	shr    edx,cl
   140007868:	89 d0                	mov    eax,edx
   14000786a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   14000786d:	eb 3c                	jmp    0x1400078ab
   14000786f:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007873:	8b 10                	mov    edx,DWORD PTR [rax]
   140007875:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140007878:	89 c1                	mov    ecx,eax
   14000787a:	d3 e2                	shl    edx,cl
   14000787c:	89 d1                	mov    ecx,edx
   14000787e:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007882:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140007886:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   14000788a:	0b 4d ec             	or     ecx,DWORD PTR [rbp-0x14]
   14000788d:	89 ca                	mov    edx,ecx
   14000788f:	89 10                	mov    DWORD PTR [rax],edx
   140007891:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007895:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140007899:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   14000789d:	8b 10                	mov    edx,DWORD PTR [rax]
   14000789f:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   1400078a2:	89 c1                	mov    ecx,eax
   1400078a4:	d3 ea                	shr    edx,cl
   1400078a6:	89 d0                	mov    eax,edx
   1400078a8:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   1400078ab:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400078af:	48 3b 45 e0          	cmp    rax,QWORD PTR [rbp-0x20]
   1400078b3:	72 ba                	jb     0x14000786f
   1400078b5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400078b9:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
   1400078bc:	89 10                	mov    DWORD PTR [rax],edx
   1400078be:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400078c2:	8b 00                	mov    eax,DWORD PTR [rax]
   1400078c4:	85 c0                	test   eax,eax
   1400078c6:	74 2d                	je     0x1400078f5
   1400078c8:	48 83 45 f0 04       	add    QWORD PTR [rbp-0x10],0x4
   1400078cd:	eb 26                	jmp    0x1400078f5
   1400078cf:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   1400078d3:	48 8d 42 04          	lea    rax,[rdx+0x4]
   1400078d7:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400078db:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400078df:	48 8d 48 04          	lea    rcx,[rax+0x4]
   1400078e3:	48 89 4d f0          	mov    QWORD PTR [rbp-0x10],rcx
   1400078e7:	8b 12                	mov    edx,DWORD PTR [rdx]
   1400078e9:	89 10                	mov    DWORD PTR [rax],edx
   1400078eb:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400078ef:	48 3b 45 e0          	cmp    rax,QWORD PTR [rbp-0x20]
   1400078f3:	72 da                	jb     0x1400078cf
   1400078f5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400078f9:	48 83 c0 18          	add    rax,0x18
   1400078fd:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140007901:	48 29 c2             	sub    rdx,rax
   140007904:	48 89 d0             	mov    rax,rdx
   140007907:	48 c1 f8 02          	sar    rax,0x2
   14000790b:	89 c2                	mov    edx,eax
   14000790d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007911:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140007914:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007918:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   14000791b:	85 c0                	test   eax,eax
   14000791d:	75 0b                	jne    0x14000792a
   14000791f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007923:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
   14000792a:	90                   	nop
   14000792b:	48 83 c4 20          	add    rsp,0x20
   14000792f:	5d                   	pop    rbp
   140007930:	c3                   	ret
   140007931:	55                   	push   rbp
   140007932:	48 89 e5             	mov    rbp,rsp
   140007935:	48 83 ec 40          	sub    rsp,0x40
   140007939:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000793d:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140007944:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007948:	48 83 c0 18          	add    rax,0x18
   14000794c:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140007950:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007954:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007957:	48 98                	cdqe
   140007959:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140007960:	00 
   140007961:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007965:	48 01 d0             	add    rax,rdx
   140007968:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   14000796c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140007973:	eb 09                	jmp    0x14000797e
   140007975:	83 45 f4 20          	add    DWORD PTR [rbp-0xc],0x20
   140007979:	48 83 45 f8 04       	add    QWORD PTR [rbp-0x8],0x4
   14000797e:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007982:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   140007986:	73 0a                	jae    0x140007992
   140007988:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000798c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000798e:	85 c0                	test   eax,eax
   140007990:	74 e3                	je     0x140007975
   140007992:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007996:	48 3b 45 e8          	cmp    rax,QWORD PTR [rbp-0x18]
   14000799a:	73 18                	jae    0x1400079b4
   14000799c:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400079a0:	8b 00                	mov    eax,DWORD PTR [rax]
   1400079a2:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   1400079a5:	48 8d 45 e4          	lea    rax,[rbp-0x1c]
   1400079a9:	48 89 c1             	mov    rcx,rax
   1400079ac:	e8 ef fd ff ff       	call   0x1400077a0
   1400079b1:	01 45 f4             	add    DWORD PTR [rbp-0xc],eax
   1400079b4:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   1400079b7:	48 83 c4 40          	add    rsp,0x40
   1400079bb:	5d                   	pop    rbp
   1400079bc:	c3                   	ret
   1400079bd:	90                   	nop
   1400079be:	90                   	nop
   1400079bf:	90                   	nop
   1400079c0:	55                   	push   rbp
   1400079c1:	48 89 e5             	mov    rbp,rsp
   1400079c4:	48 83 ec 40          	sub    rsp,0x40
   1400079c8:	48 8d 05 21 88 00 00 	lea    rax,[rip+0x8821]        # 0x1400101f0
   1400079cf:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400079d3:	c7 45 ec 03 00 00 00 	mov    DWORD PTR [rbp-0x14],0x3
   1400079da:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
   1400079dd:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400079e1:	87 10                	xchg   DWORD PTR [rax],edx
   1400079e3:	89 d0                	mov    eax,edx
   1400079e5:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   1400079e8:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   1400079ec:	75 3d                	jne    0x140007a2b
   1400079ee:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   1400079f5:	eb 2e                	jmp    0x140007a25
   1400079f7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400079fa:	48 63 d0             	movsxd rdx,eax
   1400079fd:	48 89 d0             	mov    rax,rdx
   140007a00:	48 c1 e0 02          	shl    rax,0x2
   140007a04:	48 01 d0             	add    rax,rdx
   140007a07:	48 c1 e0 03          	shl    rax,0x3
   140007a0b:	48 8d 15 8e 87 00 00 	lea    rdx,[rip+0x878e]        # 0x1400101a0
   140007a12:	48 01 d0             	add    rax,rdx
   140007a15:	48 89 c1             	mov    rcx,rax
   140007a18:	48 8b 05 09 98 00 00 	mov    rax,QWORD PTR [rip+0x9809]        # 0x140011228
   140007a1f:	ff d0                	call   rax
   140007a21:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140007a25:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
   140007a29:	7e cc                	jle    0x1400079f7
   140007a2b:	90                   	nop
   140007a2c:	48 83 c4 40          	add    rsp,0x40
   140007a30:	5d                   	pop    rbp
   140007a31:	c3                   	ret
   140007a32:	55                   	push   rbp
   140007a33:	48 89 e5             	mov    rbp,rsp
   140007a36:	48 83 ec 40          	sub    rsp,0x40
   140007a3a:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140007a3d:	8b 05 ad 87 00 00    	mov    eax,DWORD PTR [rip+0x87ad]        # 0x1400101f0
   140007a43:	83 f8 02             	cmp    eax,0x2
   140007a46:	75 2c                	jne    0x140007a74
   140007a48:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140007a4b:	48 89 d0             	mov    rax,rdx
   140007a4e:	48 c1 e0 02          	shl    rax,0x2
   140007a52:	48 01 d0             	add    rax,rdx
   140007a55:	48 c1 e0 03          	shl    rax,0x3
   140007a59:	48 8d 15 40 87 00 00 	lea    rdx,[rip+0x8740]        # 0x1400101a0
   140007a60:	48 01 d0             	add    rax,rdx
   140007a63:	48 89 c1             	mov    rcx,rax
   140007a66:	48 8b 05 c3 97 00 00 	mov    rax,QWORD PTR [rip+0x97c3]        # 0x140011230
   140007a6d:	ff d0                	call   rax
   140007a6f:	e9 ea 00 00 00       	jmp    0x140007b5e
   140007a74:	8b 05 76 87 00 00    	mov    eax,DWORD PTR [rip+0x8776]        # 0x1400101f0
   140007a7a:	85 c0                	test   eax,eax
   140007a7c:	0f 85 9e 00 00 00    	jne    0x140007b20
   140007a82:	48 8d 05 67 87 00 00 	lea    rax,[rip+0x8767]        # 0x1400101f0
   140007a89:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140007a8d:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [rbp-0x14],0x1
   140007a94:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
   140007a97:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007a9b:	87 10                	xchg   DWORD PTR [rax],edx
   140007a9d:	89 d0                	mov    eax,edx
   140007a9f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140007aa2:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   140007aa6:	75 58                	jne    0x140007b00
   140007aa8:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140007aaf:	eb 2e                	jmp    0x140007adf
   140007ab1:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140007ab4:	48 63 d0             	movsxd rdx,eax
   140007ab7:	48 89 d0             	mov    rax,rdx
   140007aba:	48 c1 e0 02          	shl    rax,0x2
   140007abe:	48 01 d0             	add    rax,rdx
   140007ac1:	48 c1 e0 03          	shl    rax,0x3
   140007ac5:	48 8d 15 d4 86 00 00 	lea    rdx,[rip+0x86d4]        # 0x1400101a0
   140007acc:	48 01 d0             	add    rax,rdx
   140007acf:	48 89 c1             	mov    rcx,rax
   140007ad2:	48 8b 05 7f 97 00 00 	mov    rax,QWORD PTR [rip+0x977f]        # 0x140011258
   140007ad9:	ff d0                	call   rax
   140007adb:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140007adf:	83 7d fc 01          	cmp    DWORD PTR [rbp-0x4],0x1
   140007ae3:	7e cc                	jle    0x140007ab1
   140007ae5:	48 8d 05 d4 fe ff ff 	lea    rax,[rip+0xfffffffffffffed4]        # 0x1400079c0
   140007aec:	48 89 c1             	mov    rcx,rax
   140007aef:	e8 e7 9a ff ff       	call   0x1400015db
   140007af4:	c7 05 f2 86 00 00 02 	mov    DWORD PTR [rip+0x86f2],0x2        # 0x1400101f0
   140007afb:	00 00 00 
   140007afe:	eb 20                	jmp    0x140007b20
   140007b00:	83 7d f8 02          	cmp    DWORD PTR [rbp-0x8],0x2
   140007b04:	75 1a                	jne    0x140007b20
   140007b06:	c7 05 e0 86 00 00 02 	mov    DWORD PTR [rip+0x86e0],0x2        # 0x1400101f0
   140007b0d:	00 00 00 
   140007b10:	eb 0e                	jmp    0x140007b20
   140007b12:	b9 01 00 00 00       	mov    ecx,0x1
   140007b17:	48 8b 05 6a 97 00 00 	mov    rax,QWORD PTR [rip+0x976a]        # 0x140011288
   140007b1e:	ff d0                	call   rax
   140007b20:	8b 05 ca 86 00 00    	mov    eax,DWORD PTR [rip+0x86ca]        # 0x1400101f0
   140007b26:	83 f8 01             	cmp    eax,0x1
   140007b29:	74 e7                	je     0x140007b12
   140007b2b:	8b 05 bf 86 00 00    	mov    eax,DWORD PTR [rip+0x86bf]        # 0x1400101f0
   140007b31:	83 f8 02             	cmp    eax,0x2
   140007b34:	75 28                	jne    0x140007b5e
   140007b36:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140007b39:	48 89 d0             	mov    rax,rdx
   140007b3c:	48 c1 e0 02          	shl    rax,0x2
   140007b40:	48 01 d0             	add    rax,rdx
   140007b43:	48 c1 e0 03          	shl    rax,0x3
   140007b47:	48 8d 15 52 86 00 00 	lea    rdx,[rip+0x8652]        # 0x1400101a0
   140007b4e:	48 01 d0             	add    rax,rdx
   140007b51:	48 89 c1             	mov    rcx,rax
   140007b54:	48 8b 05 d5 96 00 00 	mov    rax,QWORD PTR [rip+0x96d5]        # 0x140011230
   140007b5b:	ff d0                	call   rax
   140007b5d:	90                   	nop
   140007b5e:	48 83 c4 40          	add    rsp,0x40
   140007b62:	5d                   	pop    rbp
   140007b63:	c3                   	ret
   140007b64:	55                   	push   rbp
   140007b65:	48 89 e5             	mov    rbp,rsp
   140007b68:	48 83 ec 20          	sub    rsp,0x20
   140007b6c:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140007b6f:	8b 05 7b 86 00 00    	mov    eax,DWORD PTR [rip+0x867b]        # 0x1400101f0
   140007b75:	83 f8 02             	cmp    eax,0x2
   140007b78:	75 27                	jne    0x140007ba1
   140007b7a:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140007b7d:	48 89 d0             	mov    rax,rdx
   140007b80:	48 c1 e0 02          	shl    rax,0x2
   140007b84:	48 01 d0             	add    rax,rdx
   140007b87:	48 c1 e0 03          	shl    rax,0x3
   140007b8b:	48 8d 15 0e 86 00 00 	lea    rdx,[rip+0x860e]        # 0x1400101a0
   140007b92:	48 01 d0             	add    rax,rdx
   140007b95:	48 89 c1             	mov    rcx,rax
   140007b98:	48 8b 05 c9 96 00 00 	mov    rax,QWORD PTR [rip+0x96c9]        # 0x140011268
   140007b9f:	ff d0                	call   rax
   140007ba1:	90                   	nop
   140007ba2:	48 83 c4 20          	add    rsp,0x20
   140007ba6:	5d                   	pop    rbp
   140007ba7:	c3                   	ret
   140007ba8:	55                   	push   rbp
   140007ba9:	48 89 e5             	mov    rbp,rsp
   140007bac:	48 83 ec 10          	sub    rsp,0x10
   140007bb0:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140007bb4:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007bb8:	8b 00                	mov    eax,DWORD PTR [rax]
   140007bba:	f3 0f bc c0          	tzcnt  eax,eax
   140007bbe:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140007bc1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007bc5:	8b 10                	mov    edx,DWORD PTR [rax]
   140007bc7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140007bca:	89 c1                	mov    ecx,eax
   140007bcc:	d3 ea                	shr    edx,cl
   140007bce:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007bd2:	89 10                	mov    DWORD PTR [rax],edx
   140007bd4:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140007bd7:	48 83 c4 10          	add    rsp,0x10
   140007bdb:	5d                   	pop    rbp
   140007bdc:	c3                   	ret
   140007bdd:	55                   	push   rbp
   140007bde:	48 89 e5             	mov    rbp,rsp
   140007be1:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140007be4:	0f bd 45 10          	bsr    eax,DWORD PTR [rbp+0x10]
   140007be8:	83 f0 1f             	xor    eax,0x1f
   140007beb:	5d                   	pop    rbp
   140007bec:	c3                   	ret
   140007bed:	55                   	push   rbp
   140007bee:	48 89 e5             	mov    rbp,rsp
   140007bf1:	48 83 ec 30          	sub    rsp,0x30
   140007bf5:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140007bf8:	b9 00 00 00 00       	mov    ecx,0x0
   140007bfd:	e8 30 fe ff ff       	call   0x140007a32
   140007c02:	83 7d 10 09          	cmp    DWORD PTR [rbp+0x10],0x9
   140007c06:	7f 48                	jg     0x140007c50
   140007c08:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140007c0b:	48 98                	cdqe
   140007c0d:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140007c14:	00 
   140007c15:	48 8d 05 e4 85 00 00 	lea    rax,[rip+0x85e4]        # 0x140010200
   140007c1c:	48 8b 04 02          	mov    rax,QWORD PTR [rdx+rax*1]
   140007c20:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140007c24:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140007c29:	74 25                	je     0x140007c50
   140007c2b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007c2f:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140007c32:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140007c35:	48 63 d2             	movsxd rdx,edx
   140007c38:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
   140007c3f:	00 
   140007c40:	48 8d 15 b9 85 00 00 	lea    rdx,[rip+0x85b9]        # 0x140010200
   140007c47:	48 89 04 11          	mov    QWORD PTR [rcx+rdx*1],rax
   140007c4b:	e9 b1 00 00 00       	jmp    0x140007d01
   140007c50:	8b 45 10             	mov    eax,DWORD PTR [rbp+0x10]
   140007c53:	ba 01 00 00 00       	mov    edx,0x1
   140007c58:	89 c1                	mov    ecx,eax
   140007c5a:	d3 e2                	shl    edx,cl
   140007c5c:	89 d0                	mov    eax,edx
   140007c5e:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
   140007c61:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   140007c64:	83 e8 01             	sub    eax,0x1
   140007c67:	48 98                	cdqe
   140007c69:	48 c1 e0 02          	shl    rax,0x2
   140007c6d:	48 83 c0 27          	add    rax,0x27
   140007c71:	48 c1 e8 03          	shr    rax,0x3
   140007c75:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
   140007c78:	83 7d 10 09          	cmp    DWORD PTR [rbp+0x10],0x9
   140007c7c:	7f 4e                	jg     0x140007ccc
   140007c7e:	48 8b 15 0b 24 00 00 	mov    rdx,QWORD PTR [rip+0x240b]        # 0x14000a090
   140007c85:	48 8d 05 d4 85 00 00 	lea    rax,[rip+0x85d4]        # 0x140010260
   140007c8c:	48 29 c2             	sub    rdx,rax
   140007c8f:	48 89 d0             	mov    rax,rdx
   140007c92:	48 c1 f8 03          	sar    rax,0x3
   140007c96:	48 89 c2             	mov    rdx,rax
   140007c99:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   140007c9c:	48 01 d0             	add    rax,rdx
   140007c9f:	48 3d 20 01 00 00    	cmp    rax,0x120
   140007ca5:	77 25                	ja     0x140007ccc
   140007ca7:	48 8b 05 e2 23 00 00 	mov    rax,QWORD PTR [rip+0x23e2]        # 0x14000a090
   140007cae:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140007cb2:	48 8b 05 d7 23 00 00 	mov    rax,QWORD PTR [rip+0x23d7]        # 0x14000a090
   140007cb9:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
   140007cbc:	48 c1 e2 03          	shl    rdx,0x3
   140007cc0:	48 01 d0             	add    rax,rdx
   140007cc3:	48 89 05 c6 23 00 00 	mov    QWORD PTR [rip+0x23c6],rax        # 0x14000a090
   140007cca:	eb 21                	jmp    0x140007ced
   140007ccc:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   140007ccf:	48 c1 e0 03          	shl    rax,0x3
   140007cd3:	48 89 c1             	mov    rcx,rax
   140007cd6:	e8 45 1a 00 00       	call   0x140009720
   140007cdb:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140007cdf:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140007ce4:	75 07                	jne    0x140007ced
   140007ce6:	b8 00 00 00 00       	mov    eax,0x0
   140007ceb:	eb 3b                	jmp    0x140007d28
   140007ced:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007cf1:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140007cf4:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140007cf7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007cfb:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
   140007cfe:	89 50 0c             	mov    DWORD PTR [rax+0xc],edx
   140007d01:	b9 00 00 00 00       	mov    ecx,0x0
   140007d06:	e8 59 fe ff ff       	call   0x140007b64
   140007d0b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007d0f:	c7 40 14 00 00 00 00 	mov    DWORD PTR [rax+0x14],0x0
   140007d16:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007d1a:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   140007d1d:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007d21:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   140007d24:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007d28:	48 83 c4 30          	add    rsp,0x30
   140007d2c:	5d                   	pop    rbp
   140007d2d:	c3                   	ret
   140007d2e:	55                   	push   rbp
   140007d2f:	48 89 e5             	mov    rbp,rsp
   140007d32:	48 83 ec 20          	sub    rsp,0x20
   140007d36:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140007d3a:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   140007d3f:	74 71                	je     0x140007db2
   140007d41:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007d45:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140007d48:	83 f8 09             	cmp    eax,0x9
   140007d4b:	7e 0e                	jle    0x140007d5b
   140007d4d:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007d51:	48 89 c1             	mov    rcx,rax
   140007d54:	e8 b7 19 00 00       	call   0x140009710
   140007d59:	eb 57                	jmp    0x140007db2
   140007d5b:	b9 00 00 00 00       	mov    ecx,0x0
   140007d60:	e8 cd fc ff ff       	call   0x140007a32
   140007d65:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007d69:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140007d6c:	48 98                	cdqe
   140007d6e:	48 8d 14 c5 00 00 00 	lea    rdx,[rax*8+0x0]
   140007d75:	00 
   140007d76:	48 8d 05 83 84 00 00 	lea    rax,[rip+0x8483]        # 0x140010200
   140007d7d:	48 8b 14 02          	mov    rdx,QWORD PTR [rdx+rax*1]
   140007d81:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007d85:	48 89 10             	mov    QWORD PTR [rax],rdx
   140007d88:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007d8c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140007d8f:	48 98                	cdqe
   140007d91:	48 8d 0c c5 00 00 00 	lea    rcx,[rax*8+0x0]
   140007d98:	00 
   140007d99:	48 8d 15 60 84 00 00 	lea    rdx,[rip+0x8460]        # 0x140010200
   140007da0:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007da4:	48 89 04 11          	mov    QWORD PTR [rcx+rdx*1],rax
   140007da8:	b9 00 00 00 00       	mov    ecx,0x0
   140007dad:	e8 b2 fd ff ff       	call   0x140007b64
   140007db2:	90                   	nop
   140007db3:	48 83 c4 20          	add    rsp,0x20
   140007db7:	5d                   	pop    rbp
   140007db8:	c3                   	ret
   140007db9:	55                   	push   rbp
   140007dba:	48 89 e5             	mov    rbp,rsp
   140007dbd:	48 83 ec 50          	sub    rsp,0x50
   140007dc1:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140007dc5:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140007dc8:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140007dcc:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007dd0:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007dd3:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140007dd6:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007dda:	48 83 c0 18          	add    rax,0x18
   140007dde:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140007de2:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140007de9:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   140007dec:	48 98                	cdqe
   140007dee:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140007df2:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007df6:	8b 00                	mov    eax,DWORD PTR [rax]
   140007df8:	89 c2                	mov    edx,eax
   140007dfa:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140007dfd:	48 98                	cdqe
   140007dff:	48 0f af d0          	imul   rdx,rax
   140007e03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140007e07:	48 01 d0             	add    rax,rdx
   140007e0a:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140007e0e:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140007e12:	48 c1 e8 20          	shr    rax,0x20
   140007e16:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140007e1a:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007e1e:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140007e22:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140007e26:	48 8b 55 d8          	mov    rdx,QWORD PTR [rbp-0x28]
   140007e2a:	89 10                	mov    DWORD PTR [rax],edx
   140007e2c:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140007e30:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140007e33:	3b 45 e4             	cmp    eax,DWORD PTR [rbp-0x1c]
   140007e36:	7c ba                	jl     0x140007df2
   140007e38:	48 83 7d e8 00       	cmp    QWORD PTR [rbp-0x18],0x0
   140007e3d:	0f 84 9a 00 00 00    	je     0x140007edd
   140007e43:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007e47:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140007e4a:	39 45 e4             	cmp    DWORD PTR [rbp-0x1c],eax
   140007e4d:	7c 67                	jl     0x140007eb6
   140007e4f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007e53:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140007e56:	83 c0 01             	add    eax,0x1
   140007e59:	89 c1                	mov    ecx,eax
   140007e5b:	e8 8d fd ff ff       	call   0x140007bed
   140007e60:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   140007e64:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
   140007e69:	75 07                	jne    0x140007e72
   140007e6b:	b8 00 00 00 00       	mov    eax,0x0
   140007e70:	eb 6f                	jmp    0x140007ee1
   140007e72:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007e76:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007e79:	48 98                	cdqe
   140007e7b:	48 83 c0 02          	add    rax,0x2
   140007e7f:	48 8d 0c 85 00 00 00 	lea    rcx,[rax*4+0x0]
   140007e86:	00 
   140007e87:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007e8b:	48 8d 50 10          	lea    rdx,[rax+0x10]
   140007e8f:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140007e93:	48 83 c0 10          	add    rax,0x10
   140007e97:	49 89 c8             	mov    r8,rcx
   140007e9a:	48 89 c1             	mov    rcx,rax
   140007e9d:	e8 8e 18 00 00       	call   0x140009730
   140007ea2:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007ea6:	48 89 c1             	mov    rcx,rax
   140007ea9:	e8 80 fe ff ff       	call   0x140007d2e
   140007eae:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140007eb2:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140007eb6:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140007eb9:	8d 50 01             	lea    edx,[rax+0x1]
   140007ebc:	89 55 e4             	mov    DWORD PTR [rbp-0x1c],edx
   140007ebf:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   140007ec3:	89 d1                	mov    ecx,edx
   140007ec5:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140007ec9:	48 98                	cdqe
   140007ecb:	48 83 c0 04          	add    rax,0x4
   140007ecf:	89 4c 82 08          	mov    DWORD PTR [rdx+rax*4+0x8],ecx
   140007ed3:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007ed7:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
   140007eda:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140007edd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007ee1:	48 83 c4 50          	add    rsp,0x50
   140007ee5:	5d                   	pop    rbp
   140007ee6:	c3                   	ret
   140007ee7:	55                   	push   rbp
   140007ee8:	48 89 e5             	mov    rbp,rsp
   140007eeb:	48 83 ec 30          	sub    rsp,0x30
   140007eef:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140007ef2:	b9 01 00 00 00       	mov    ecx,0x1
   140007ef7:	e8 f1 fc ff ff       	call   0x140007bed
   140007efc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140007f00:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140007f05:	75 07                	jne    0x140007f0e
   140007f07:	b8 00 00 00 00       	mov    eax,0x0
   140007f0c:	eb 19                	jmp    0x140007f27
   140007f0e:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140007f11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007f15:	89 50 18             	mov    DWORD PTR [rax+0x18],edx
   140007f18:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007f1c:	c7 40 14 01 00 00 00 	mov    DWORD PTR [rax+0x14],0x1
   140007f23:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140007f27:	48 83 c4 30          	add    rsp,0x30
   140007f2b:	5d                   	pop    rbp
   140007f2c:	c3                   	ret
   140007f2d:	55                   	push   rbp
   140007f2e:	48 89 e5             	mov    rbp,rsp
   140007f31:	48 81 ec 90 00 00 00 	sub    rsp,0x90
   140007f38:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140007f3c:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140007f40:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007f44:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   140007f47:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007f4b:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007f4e:	39 c2                	cmp    edx,eax
   140007f50:	7d 18                	jge    0x140007f6a
   140007f52:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007f56:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   140007f5a:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007f5e:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140007f62:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140007f66:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   140007f6a:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007f6e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140007f71:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140007f74:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007f78:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007f7b:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
   140007f7e:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140007f82:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140007f85:	89 45 c0             	mov    DWORD PTR [rbp-0x40],eax
   140007f88:	8b 55 c4             	mov    edx,DWORD PTR [rbp-0x3c]
   140007f8b:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
   140007f8e:	01 d0                	add    eax,edx
   140007f90:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140007f93:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140007f97:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140007f9a:	39 45 f8             	cmp    DWORD PTR [rbp-0x8],eax
   140007f9d:	7e 04                	jle    0x140007fa3
   140007f9f:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   140007fa3:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140007fa6:	89 c1                	mov    ecx,eax
   140007fa8:	e8 40 fc ff ff       	call   0x140007bed
   140007fad:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   140007fb1:	48 83 7d c8 00       	cmp    QWORD PTR [rbp-0x38],0x0
   140007fb6:	75 0a                	jne    0x140007fc2
   140007fb8:	b8 00 00 00 00       	mov    eax,0x0
   140007fbd:	e9 88 01 00 00       	jmp    0x14000814a
   140007fc2:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140007fc6:	48 83 c0 18          	add    rax,0x18
   140007fca:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140007fce:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140007fd1:	48 98                	cdqe
   140007fd3:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140007fda:	00 
   140007fdb:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007fdf:	48 01 d0             	add    rax,rdx
   140007fe2:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   140007fe6:	eb 0f                	jmp    0x140007ff7
   140007fe8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007fec:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140007ff2:	48 83 45 f0 04       	add    QWORD PTR [rbp-0x10],0x4
   140007ff7:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140007ffb:	48 3b 45 b8          	cmp    rax,QWORD PTR [rbp-0x48]
   140007fff:	72 e7                	jb     0x140007fe8
   140008001:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008005:	48 83 c0 18          	add    rax,0x18
   140008009:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000800d:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
   140008010:	48 98                	cdqe
   140008012:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140008019:	00 
   14000801a:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   14000801e:	48 01 d0             	add    rax,rdx
   140008021:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140008025:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008029:	48 83 c0 18          	add    rax,0x18
   14000802d:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140008031:	8b 45 c0             	mov    eax,DWORD PTR [rbp-0x40]
   140008034:	48 98                	cdqe
   140008036:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   14000803d:	00 
   14000803e:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140008042:	48 01 d0             	add    rax,rdx
   140008045:	48 89 45 a8          	mov    QWORD PTR [rbp-0x58],rax
   140008049:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   14000804d:	48 83 c0 18          	add    rax,0x18
   140008051:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140008055:	e9 95 00 00 00       	jmp    0x1400080ef
   14000805a:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   14000805e:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140008062:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
   140008066:	8b 00                	mov    eax,DWORD PTR [rax]
   140008068:	89 45 a4             	mov    DWORD PTR [rbp-0x5c],eax
   14000806b:	83 7d a4 00          	cmp    DWORD PTR [rbp-0x5c],0x0
   14000806f:	74 79                	je     0x1400080ea
   140008071:	48 8b 45 b8          	mov    rax,QWORD PTR [rbp-0x48]
   140008075:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140008079:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14000807d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140008081:	48 c7 45 d0 00 00 00 	mov    QWORD PTR [rbp-0x30],0x0
   140008088:	00 
   140008089:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000808d:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140008091:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140008095:	8b 00                	mov    eax,DWORD PTR [rax]
   140008097:	89 c2                	mov    edx,eax
   140008099:	8b 45 a4             	mov    eax,DWORD PTR [rbp-0x5c]
   14000809c:	48 0f af d0          	imul   rdx,rax
   1400080a0:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400080a4:	8b 00                	mov    eax,DWORD PTR [rax]
   1400080a6:	89 c0                	mov    eax,eax
   1400080a8:	48 01 c2             	add    rdx,rax
   1400080ab:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400080af:	48 01 d0             	add    rax,rdx
   1400080b2:	48 89 45 98          	mov    QWORD PTR [rbp-0x68],rax
   1400080b6:	48 8b 45 98          	mov    rax,QWORD PTR [rbp-0x68]
   1400080ba:	48 c1 e8 20          	shr    rax,0x20
   1400080be:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400080c2:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400080c6:	48 8d 50 04          	lea    rdx,[rax+0x4]
   1400080ca:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
   1400080ce:	48 8b 55 98          	mov    rdx,QWORD PTR [rbp-0x68]
   1400080d2:	89 10                	mov    DWORD PTR [rax],edx
   1400080d4:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400080d8:	48 3b 45 b0          	cmp    rax,QWORD PTR [rbp-0x50]
   1400080dc:	72 ab                	jb     0x140008089
   1400080de:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400080e2:	89 c2                	mov    edx,eax
   1400080e4:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400080e8:	89 10                	mov    DWORD PTR [rax],edx
   1400080ea:	48 83 45 d8 04       	add    QWORD PTR [rbp-0x28],0x4
   1400080ef:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400080f3:	48 3b 45 a8          	cmp    rax,QWORD PTR [rbp-0x58]
   1400080f7:	0f 82 5d ff ff ff    	jb     0x14000805a
   1400080fd:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140008101:	48 83 c0 18          	add    rax,0x18
   140008105:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140008109:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   14000810c:	48 98                	cdqe
   14000810e:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140008115:	00 
   140008116:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   14000811a:	48 01 d0             	add    rax,rdx
   14000811d:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140008121:	eb 04                	jmp    0x140008127
   140008123:	83 6d f8 01          	sub    DWORD PTR [rbp-0x8],0x1
   140008127:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   14000812b:	7e 0f                	jle    0x14000813c
   14000812d:	48 83 6d e0 04       	sub    QWORD PTR [rbp-0x20],0x4
   140008132:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008136:	8b 00                	mov    eax,DWORD PTR [rax]
   140008138:	85 c0                	test   eax,eax
   14000813a:	74 e7                	je     0x140008123
   14000813c:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   140008140:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   140008143:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140008146:	48 8b 45 c8          	mov    rax,QWORD PTR [rbp-0x38]
   14000814a:	48 81 c4 90 00 00 00 	add    rsp,0x90
   140008151:	5d                   	pop    rbp
   140008152:	c3                   	ret
   140008153:	55                   	push   rbp
   140008154:	48 89 e5             	mov    rbp,rsp
   140008157:	48 83 ec 40          	sub    rsp,0x40
   14000815b:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000815f:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   140008162:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140008165:	83 e0 03             	and    eax,0x3
   140008168:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   14000816b:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
   14000816f:	74 41                	je     0x1400081b2
   140008171:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   140008174:	83 e8 01             	sub    eax,0x1
   140008177:	48 98                	cdqe
   140008179:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140008180:	00 
   140008181:	48 8d 05 10 1f 00 00 	lea    rax,[rip+0x1f10]        # 0x14000a098
   140008188:	8b 14 02             	mov    edx,DWORD PTR [rdx+rax*1]
   14000818b:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000818f:	41 b8 00 00 00 00    	mov    r8d,0x0
   140008195:	48 89 c1             	mov    rcx,rax
   140008198:	e8 1c fc ff ff       	call   0x140007db9
   14000819d:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   1400081a1:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   1400081a6:	75 0a                	jne    0x1400081b2
   1400081a8:	b8 00 00 00 00       	mov    eax,0x0
   1400081ad:	e9 58 01 00 00       	jmp    0x14000830a
   1400081b2:	c1 7d 18 02          	sar    DWORD PTR [rbp+0x18],0x2
   1400081b6:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   1400081ba:	75 09                	jne    0x1400081c5
   1400081bc:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400081c0:	e9 45 01 00 00       	jmp    0x14000830a
   1400081c5:	48 8b 05 94 89 00 00 	mov    rax,QWORD PTR [rip+0x8994]        # 0x140010b60
   1400081cc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400081d0:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   1400081d5:	75 5e                	jne    0x140008235
   1400081d7:	b9 01 00 00 00       	mov    ecx,0x1
   1400081dc:	e8 51 f8 ff ff       	call   0x140007a32
   1400081e1:	48 8b 05 78 89 00 00 	mov    rax,QWORD PTR [rip+0x8978]        # 0x140010b60
   1400081e8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400081ec:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   1400081f1:	75 38                	jne    0x14000822b
   1400081f3:	b9 71 02 00 00       	mov    ecx,0x271
   1400081f8:	e8 ea fc ff ff       	call   0x140007ee7
   1400081fd:	48 89 05 5c 89 00 00 	mov    QWORD PTR [rip+0x895c],rax        # 0x140010b60
   140008204:	48 8b 05 55 89 00 00 	mov    rax,QWORD PTR [rip+0x8955]        # 0x140010b60
   14000820b:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000820f:	48 83 7d f8 00       	cmp    QWORD PTR [rbp-0x8],0x0
   140008214:	75 0a                	jne    0x140008220
   140008216:	b8 00 00 00 00       	mov    eax,0x0
   14000821b:	e9 ea 00 00 00       	jmp    0x14000830a
   140008220:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008224:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   14000822b:	b9 01 00 00 00       	mov    ecx,0x1
   140008230:	e8 2f f9 ff ff       	call   0x140007b64
   140008235:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140008238:	83 e0 01             	and    eax,0x1
   14000823b:	85 c0                	test   eax,eax
   14000823d:	74 39                	je     0x140008278
   14000823f:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   140008243:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008247:	48 89 c1             	mov    rcx,rax
   14000824a:	e8 de fc ff ff       	call   0x140007f2d
   14000824f:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140008253:	48 83 7d e0 00       	cmp    QWORD PTR [rbp-0x20],0x0
   140008258:	75 0a                	jne    0x140008264
   14000825a:	b8 00 00 00 00       	mov    eax,0x0
   14000825f:	e9 a6 00 00 00       	jmp    0x14000830a
   140008264:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008268:	48 89 c1             	mov    rcx,rax
   14000826b:	e8 be fa ff ff       	call   0x140007d2e
   140008270:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008274:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   140008278:	d1 7d 18             	sar    DWORD PTR [rbp+0x18],1
   14000827b:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   14000827f:	0f 84 80 00 00 00    	je     0x140008305
   140008285:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008289:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000828c:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140008290:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140008295:	75 61                	jne    0x1400082f8
   140008297:	b9 01 00 00 00       	mov    ecx,0x1
   14000829c:	e8 91 f7 ff ff       	call   0x140007a32
   1400082a1:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400082a5:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400082a8:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400082ac:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400082b1:	75 3b                	jne    0x1400082ee
   1400082b3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   1400082b7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400082bb:	48 89 c1             	mov    rcx,rax
   1400082be:	e8 6a fc ff ff       	call   0x140007f2d
   1400082c3:	48 8b 55 f8          	mov    rdx,QWORD PTR [rbp-0x8]
   1400082c7:	48 89 02             	mov    QWORD PTR [rdx],rax
   1400082ca:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400082ce:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400082d1:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400082d5:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   1400082da:	75 07                	jne    0x1400082e3
   1400082dc:	b8 00 00 00 00       	mov    eax,0x0
   1400082e1:	eb 27                	jmp    0x14000830a
   1400082e3:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400082e7:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   1400082ee:	b9 01 00 00 00       	mov    ecx,0x1
   1400082f3:	e8 6c f8 ff ff       	call   0x140007b64
   1400082f8:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400082fc:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140008300:	e9 30 ff ff ff       	jmp    0x140008235
   140008305:	90                   	nop
   140008306:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000830a:	48 83 c4 40          	add    rsp,0x40
   14000830e:	5d                   	pop    rbp
   14000830f:	c3                   	ret
   140008310:	55                   	push   rbp
   140008311:	48 89 e5             	mov    rbp,rsp
   140008314:	48 83 ec 60          	sub    rsp,0x60
   140008318:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000831c:	89 55 18             	mov    DWORD PTR [rbp+0x18],edx
   14000831f:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   140008322:	c1 f8 05             	sar    eax,0x5
   140008325:	89 45 d8             	mov    DWORD PTR [rbp-0x28],eax
   140008328:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000832c:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000832f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008332:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008336:	8b 50 14             	mov    edx,DWORD PTR [rax+0x14]
   140008339:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
   14000833c:	01 d0                	add    eax,edx
   14000833e:	83 c0 01             	add    eax,0x1
   140008341:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
   140008344:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008348:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   14000834b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   14000834e:	eb 07                	jmp    0x140008357
   140008350:	83 45 f8 01          	add    DWORD PTR [rbp-0x8],0x1
   140008354:	d1 65 fc             	shl    DWORD PTR [rbp-0x4],1
   140008357:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   14000835a:	3b 45 fc             	cmp    eax,DWORD PTR [rbp-0x4]
   14000835d:	7f f1                	jg     0x140008350
   14000835f:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008362:	89 c1                	mov    ecx,eax
   140008364:	e8 84 f8 ff ff       	call   0x140007bed
   140008369:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   14000836d:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
   140008372:	75 0a                	jne    0x14000837e
   140008374:	b8 00 00 00 00       	mov    eax,0x0
   140008379:	e9 19 01 00 00       	jmp    0x140008497
   14000837e:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140008382:	48 83 c0 18          	add    rax,0x18
   140008386:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   14000838a:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140008391:	eb 16                	jmp    0x1400083a9
   140008393:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008397:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000839b:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
   14000839f:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   1400083a5:	83 45 fc 01          	add    DWORD PTR [rbp-0x4],0x1
   1400083a9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400083ac:	3b 45 d8             	cmp    eax,DWORD PTR [rbp-0x28]
   1400083af:	7c e2                	jl     0x140008393
   1400083b1:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400083b5:	48 83 c0 18          	add    rax,0x18
   1400083b9:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   1400083bd:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400083c1:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400083c4:	48 98                	cdqe
   1400083c6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   1400083cd:	00 
   1400083ce:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400083d2:	48 01 d0             	add    rax,rdx
   1400083d5:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   1400083d9:	83 65 18 1f          	and    DWORD PTR [rbp+0x18],0x1f
   1400083dd:	83 7d 18 00          	cmp    DWORD PTR [rbp+0x18],0x0
   1400083e1:	74 71                	je     0x140008454
   1400083e3:	b8 20 00 00 00       	mov    eax,0x20
   1400083e8:	2b 45 18             	sub    eax,DWORD PTR [rbp+0x18]
   1400083eb:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   1400083ee:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [rbp-0x24],0x0
   1400083f5:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400083f9:	8b 10                	mov    edx,DWORD PTR [rax]
   1400083fb:	8b 45 18             	mov    eax,DWORD PTR [rbp+0x18]
   1400083fe:	89 c1                	mov    ecx,eax
   140008400:	d3 e2                	shl    edx,cl
   140008402:	89 d1                	mov    ecx,edx
   140008404:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008408:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000840c:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
   140008410:	0b 4d dc             	or     ecx,DWORD PTR [rbp-0x24]
   140008413:	89 ca                	mov    edx,ecx
   140008415:	89 10                	mov    DWORD PTR [rax],edx
   140008417:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   14000841b:	48 8d 50 04          	lea    rdx,[rax+0x4]
   14000841f:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
   140008423:	8b 10                	mov    edx,DWORD PTR [rax]
   140008425:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008428:	89 c1                	mov    ecx,eax
   14000842a:	d3 ea                	shr    edx,cl
   14000842c:	89 d0                	mov    eax,edx
   14000842e:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
   140008431:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140008435:	48 3b 45 c8          	cmp    rax,QWORD PTR [rbp-0x38]
   140008439:	72 ba                	jb     0x1400083f5
   14000843b:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000843f:	8b 55 dc             	mov    edx,DWORD PTR [rbp-0x24]
   140008442:	89 10                	mov    DWORD PTR [rax],edx
   140008444:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008448:	8b 00                	mov    eax,DWORD PTR [rax]
   14000844a:	85 c0                	test   eax,eax
   14000844c:	74 2c                	je     0x14000847a
   14000844e:	83 45 f4 01          	add    DWORD PTR [rbp-0xc],0x1
   140008452:	eb 26                	jmp    0x14000847a
   140008454:	48 8b 55 e8          	mov    rdx,QWORD PTR [rbp-0x18]
   140008458:	48 8d 42 04          	lea    rax,[rdx+0x4]
   14000845c:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140008460:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008464:	48 8d 48 04          	lea    rcx,[rax+0x4]
   140008468:	48 89 4d e0          	mov    QWORD PTR [rbp-0x20],rcx
   14000846c:	8b 12                	mov    edx,DWORD PTR [rdx]
   14000846e:	89 10                	mov    DWORD PTR [rax],edx
   140008470:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140008474:	48 3b 45 c8          	cmp    rax,QWORD PTR [rbp-0x38]
   140008478:	72 da                	jb     0x140008454
   14000847a:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   14000847d:	8d 50 ff             	lea    edx,[rax-0x1]
   140008480:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140008484:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140008487:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000848b:	48 89 c1             	mov    rcx,rax
   14000848e:	e8 9b f8 ff ff       	call   0x140007d2e
   140008493:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140008497:	48 83 c4 60          	add    rsp,0x60
   14000849b:	5d                   	pop    rbp
   14000849c:	c3                   	ret
   14000849d:	55                   	push   rbp
   14000849e:	48 89 e5             	mov    rbp,rsp
   1400084a1:	48 83 ec 30          	sub    rsp,0x30
   1400084a5:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400084a9:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   1400084ad:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400084b1:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400084b4:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   1400084b7:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400084bb:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400084be:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   1400084c1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   1400084c4:	29 45 ec             	sub    DWORD PTR [rbp-0x14],eax
   1400084c7:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
   1400084cb:	74 08                	je     0x1400084d5
   1400084cd:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   1400084d0:	e9 92 00 00 00       	jmp    0x140008567
   1400084d5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400084d9:	48 83 c0 18          	add    rax,0x18
   1400084dd:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   1400084e1:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   1400084e4:	48 98                	cdqe
   1400084e6:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   1400084ed:	00 
   1400084ee:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400084f2:	48 01 d0             	add    rax,rdx
   1400084f5:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400084f9:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400084fd:	48 83 c0 18          	add    rax,0x18
   140008501:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140008505:	8b 45 e8             	mov    eax,DWORD PTR [rbp-0x18]
   140008508:	48 98                	cdqe
   14000850a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140008511:	00 
   140008512:	48 8b 45 d8          	mov    rax,QWORD PTR [rbp-0x28]
   140008516:	48 01 d0             	add    rax,rdx
   140008519:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000851d:	48 83 6d f8 04       	sub    QWORD PTR [rbp-0x8],0x4
   140008522:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008526:	8b 10                	mov    edx,DWORD PTR [rax]
   140008528:	48 83 6d f0 04       	sub    QWORD PTR [rbp-0x10],0x4
   14000852d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008531:	8b 00                	mov    eax,DWORD PTR [rax]
   140008533:	39 c2                	cmp    edx,eax
   140008535:	74 1e                	je     0x140008555
   140008537:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000853b:	8b 10                	mov    edx,DWORD PTR [rax]
   14000853d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008541:	8b 00                	mov    eax,DWORD PTR [rax]
   140008543:	39 c2                	cmp    edx,eax
   140008545:	73 07                	jae    0x14000854e
   140008547:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000854c:	eb 19                	jmp    0x140008567
   14000854e:	b8 01 00 00 00       	mov    eax,0x1
   140008553:	eb 12                	jmp    0x140008567
   140008555:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008559:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
   14000855d:	73 02                	jae    0x140008561
   14000855f:	eb bc                	jmp    0x14000851d
   140008561:	90                   	nop
   140008562:	b8 00 00 00 00       	mov    eax,0x0
   140008567:	48 83 c4 30          	add    rsp,0x30
   14000856b:	5d                   	pop    rbp
   14000856c:	c3                   	ret
   14000856d:	55                   	push   rbp
   14000856e:	48 89 e5             	mov    rbp,rsp
   140008571:	48 83 ec 70          	sub    rsp,0x70
   140008575:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008579:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   14000857d:	48 8b 55 18          	mov    rdx,QWORD PTR [rbp+0x18]
   140008581:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008585:	48 89 c1             	mov    rcx,rax
   140008588:	e8 10 ff ff ff       	call   0x14000849d
   14000858d:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008590:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140008594:	75 3e                	jne    0x1400085d4
   140008596:	b9 00 00 00 00       	mov    ecx,0x0
   14000859b:	e8 4d f6 ff ff       	call   0x140007bed
   1400085a0:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400085a4:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
   1400085a9:	75 0a                	jne    0x1400085b5
   1400085ab:	b8 00 00 00 00       	mov    eax,0x0
   1400085b0:	e9 ab 01 00 00       	jmp    0x140008760
   1400085b5:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400085b9:	c7 40 14 01 00 00 00 	mov    DWORD PTR [rax+0x14],0x1
   1400085c0:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400085c4:	c7 40 18 00 00 00 00 	mov    DWORD PTR [rax+0x18],0x0
   1400085cb:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400085cf:	e9 8c 01 00 00       	jmp    0x140008760
   1400085d4:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   1400085d8:	79 21                	jns    0x1400085fb
   1400085da:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400085de:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   1400085e2:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400085e6:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   1400085ea:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   1400085ee:	48 89 45 18          	mov    QWORD PTR [rbp+0x18],rax
   1400085f2:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [rbp-0x4],0x1
   1400085f9:	eb 07                	jmp    0x140008602
   1400085fb:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140008602:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008606:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140008609:	89 c1                	mov    ecx,eax
   14000860b:	e8 dd f5 ff ff       	call   0x140007bed
   140008610:	48 89 45 d0          	mov    QWORD PTR [rbp-0x30],rax
   140008614:	48 83 7d d0 00       	cmp    QWORD PTR [rbp-0x30],0x0
   140008619:	75 0a                	jne    0x140008625
   14000861b:	b8 00 00 00 00       	mov    eax,0x0
   140008620:	e9 3b 01 00 00       	jmp    0x140008760
   140008625:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140008629:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   14000862c:	89 50 10             	mov    DWORD PTR [rax+0x10],edx
   14000862f:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008633:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140008636:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008639:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000863d:	48 83 c0 18          	add    rax,0x18
   140008641:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140008645:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008648:	48 98                	cdqe
   14000864a:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140008651:	00 
   140008652:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008656:	48 01 d0             	add    rax,rdx
   140008659:	48 89 45 c8          	mov    QWORD PTR [rbp-0x38],rax
   14000865d:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008661:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140008664:	89 45 c4             	mov    DWORD PTR [rbp-0x3c],eax
   140008667:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000866b:	48 83 c0 18          	add    rax,0x18
   14000866f:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140008673:	8b 45 c4             	mov    eax,DWORD PTR [rbp-0x3c]
   140008676:	48 98                	cdqe
   140008678:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   14000867f:	00 
   140008680:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140008684:	48 01 d0             	add    rax,rdx
   140008687:	48 89 45 b8          	mov    QWORD PTR [rbp-0x48],rax
   14000868b:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   14000868f:	48 83 c0 18          	add    rax,0x18
   140008693:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140008697:	48 c7 45 d8 00 00 00 	mov    QWORD PTR [rbp-0x28],0x0
   14000869e:	00 
   14000869f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400086a3:	48 8d 50 04          	lea    rdx,[rax+0x4]
   1400086a7:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   1400086ab:	8b 00                	mov    eax,DWORD PTR [rax]
   1400086ad:	89 c1                	mov    ecx,eax
   1400086af:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400086b3:	48 8d 50 04          	lea    rdx,[rax+0x4]
   1400086b7:	48 89 55 e8          	mov    QWORD PTR [rbp-0x18],rdx
   1400086bb:	8b 00                	mov    eax,DWORD PTR [rax]
   1400086bd:	89 c2                	mov    edx,eax
   1400086bf:	48 89 c8             	mov    rax,rcx
   1400086c2:	48 29 d0             	sub    rax,rdx
   1400086c5:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
   1400086c9:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   1400086cd:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
   1400086d1:	48 c1 e8 20          	shr    rax,0x20
   1400086d5:	83 e0 01             	and    eax,0x1
   1400086d8:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   1400086dc:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   1400086e0:	48 8d 50 04          	lea    rdx,[rax+0x4]
   1400086e4:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
   1400086e8:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
   1400086ec:	89 10                	mov    DWORD PTR [rax],edx
   1400086ee:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400086f2:	48 3b 45 b8          	cmp    rax,QWORD PTR [rbp-0x48]
   1400086f6:	72 a7                	jb     0x14000869f
   1400086f8:	eb 39                	jmp    0x140008733
   1400086fa:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400086fe:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140008702:	48 89 55 f0          	mov    QWORD PTR [rbp-0x10],rdx
   140008706:	8b 00                	mov    eax,DWORD PTR [rax]
   140008708:	89 c0                	mov    eax,eax
   14000870a:	48 2b 45 d8          	sub    rax,QWORD PTR [rbp-0x28]
   14000870e:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140008712:	48 8b 45 b0          	mov    rax,QWORD PTR [rbp-0x50]
   140008716:	48 c1 e8 20          	shr    rax,0x20
   14000871a:	83 e0 01             	and    eax,0x1
   14000871d:	48 89 45 d8          	mov    QWORD PTR [rbp-0x28],rax
   140008721:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008725:	48 8d 50 04          	lea    rdx,[rax+0x4]
   140008729:	48 89 55 e0          	mov    QWORD PTR [rbp-0x20],rdx
   14000872d:	48 8b 55 b0          	mov    rdx,QWORD PTR [rbp-0x50]
   140008731:	89 10                	mov    DWORD PTR [rax],edx
   140008733:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008737:	48 3b 45 c8          	cmp    rax,QWORD PTR [rbp-0x38]
   14000873b:	72 bd                	jb     0x1400086fa
   14000873d:	eb 04                	jmp    0x140008743
   14000873f:	83 6d f8 01          	sub    DWORD PTR [rbp-0x8],0x1
   140008743:	48 83 6d e0 04       	sub    QWORD PTR [rbp-0x20],0x4
   140008748:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   14000874c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000874e:	85 c0                	test   eax,eax
   140008750:	74 ed                	je     0x14000873f
   140008752:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140008756:	8b 55 f8             	mov    edx,DWORD PTR [rbp-0x8]
   140008759:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   14000875c:	48 8b 45 d0          	mov    rax,QWORD PTR [rbp-0x30]
   140008760:	48 83 c4 70          	add    rsp,0x70
   140008764:	5d                   	pop    rbp
   140008765:	c3                   	ret
   140008766:	55                   	push   rbp
   140008767:	48 89 e5             	mov    rbp,rsp
   14000876a:	48 83 ec 50          	sub    rsp,0x50
   14000876e:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008772:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140008776:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000877a:	48 83 c0 18          	add    rax,0x18
   14000877e:	48 89 45 e0          	mov    QWORD PTR [rbp-0x20],rax
   140008782:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008786:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140008789:	48 98                	cdqe
   14000878b:	48 8d 14 85 00 00 00 	lea    rdx,[rax*4+0x0]
   140008792:	00 
   140008793:	48 8b 45 e0          	mov    rax,QWORD PTR [rbp-0x20]
   140008797:	48 01 d0             	add    rax,rdx
   14000879a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000879e:	48 83 6d f8 04       	sub    QWORD PTR [rbp-0x8],0x4
   1400087a3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400087a7:	8b 00                	mov    eax,DWORD PTR [rax]
   1400087a9:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
   1400087ac:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400087af:	89 c1                	mov    ecx,eax
   1400087b1:	e8 27 f4 ff ff       	call   0x140007bdd
   1400087b6:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
   1400087b9:	b8 20 00 00 00       	mov    eax,0x20
   1400087be:	2b 45 dc             	sub    eax,DWORD PTR [rbp-0x24]
   1400087c1:	89 c2                	mov    edx,eax
   1400087c3:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400087c7:	89 10                	mov    DWORD PTR [rax],edx
   1400087c9:	83 7d dc 0a          	cmp    DWORD PTR [rbp-0x24],0xa
   1400087cd:	7f 66                	jg     0x140008835
   1400087cf:	b8 0b 00 00 00       	mov    eax,0xb
   1400087d4:	2b 45 dc             	sub    eax,DWORD PTR [rbp-0x24]
   1400087d7:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
   1400087da:	89 c1                	mov    ecx,eax
   1400087dc:	d3 ea                	shr    edx,cl
   1400087de:	89 d0                	mov    eax,edx
   1400087e0:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   1400087e5:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   1400087e8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400087ec:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
   1400087f0:	73 10                	jae    0x140008802
   1400087f2:	48 83 6d f8 04       	sub    QWORD PTR [rbp-0x8],0x4
   1400087f7:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400087fb:	8b 00                	mov    eax,DWORD PTR [rax]
   1400087fd:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
   140008800:	eb 07                	jmp    0x140008809
   140008802:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [rbp-0xc],0x0
   140008809:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   14000880c:	83 c0 15             	add    eax,0x15
   14000880f:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
   140008812:	89 c1                	mov    ecx,eax
   140008814:	d3 e2                	shl    edx,cl
   140008816:	41 89 d0             	mov    r8d,edx
   140008819:	b8 0b 00 00 00       	mov    eax,0xb
   14000881e:	2b 45 dc             	sub    eax,DWORD PTR [rbp-0x24]
   140008821:	8b 55 f4             	mov    edx,DWORD PTR [rbp-0xc]
   140008824:	89 c1                	mov    ecx,eax
   140008826:	d3 ea                	shr    edx,cl
   140008828:	89 d0                	mov    eax,edx
   14000882a:	44 09 c0             	or     eax,r8d
   14000882d:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   140008830:	e9 ac 00 00 00       	jmp    0x1400088e1
   140008835:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008839:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
   14000883d:	73 10                	jae    0x14000884f
   14000883f:	48 83 6d f8 04       	sub    QWORD PTR [rbp-0x8],0x4
   140008844:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008848:	8b 00                	mov    eax,DWORD PTR [rax]
   14000884a:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   14000884d:	eb 07                	jmp    0x140008856
   14000884f:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
   140008856:	83 6d dc 0b          	sub    DWORD PTR [rbp-0x24],0xb
   14000885a:	83 7d dc 00          	cmp    DWORD PTR [rbp-0x24],0x0
   14000885e:	74 70                	je     0x1400088d0
   140008860:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   140008863:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
   140008866:	89 c1                	mov    ecx,eax
   140008868:	d3 e2                	shl    edx,cl
   14000886a:	41 89 d0             	mov    r8d,edx
   14000886d:	b8 20 00 00 00       	mov    eax,0x20
   140008872:	2b 45 dc             	sub    eax,DWORD PTR [rbp-0x24]
   140008875:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
   140008878:	89 c1                	mov    ecx,eax
   14000887a:	d3 ea                	shr    edx,cl
   14000887c:	89 d0                	mov    eax,edx
   14000887e:	44 09 c0             	or     eax,r8d
   140008881:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   140008886:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   140008889:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000888d:	48 39 45 e0          	cmp    QWORD PTR [rbp-0x20],rax
   140008891:	73 10                	jae    0x1400088a3
   140008893:	48 83 6d f8 04       	sub    QWORD PTR [rbp-0x8],0x4
   140008898:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000889c:	8b 00                	mov    eax,DWORD PTR [rax]
   14000889e:	89 45 f0             	mov    DWORD PTR [rbp-0x10],eax
   1400088a1:	eb 07                	jmp    0x1400088aa
   1400088a3:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [rbp-0x10],0x0
   1400088aa:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   1400088ad:	8b 55 ec             	mov    edx,DWORD PTR [rbp-0x14]
   1400088b0:	89 c1                	mov    ecx,eax
   1400088b2:	d3 e2                	shl    edx,cl
   1400088b4:	41 89 d0             	mov    r8d,edx
   1400088b7:	b8 20 00 00 00       	mov    eax,0x20
   1400088bc:	2b 45 dc             	sub    eax,DWORD PTR [rbp-0x24]
   1400088bf:	8b 55 f0             	mov    edx,DWORD PTR [rbp-0x10]
   1400088c2:	89 c1                	mov    ecx,eax
   1400088c4:	d3 ea                	shr    edx,cl
   1400088c6:	89 d0                	mov    eax,edx
   1400088c8:	44 09 c0             	or     eax,r8d
   1400088cb:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   1400088ce:	eb 11                	jmp    0x1400088e1
   1400088d0:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   1400088d3:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   1400088d8:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   1400088db:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   1400088de:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   1400088e1:	f2 0f 10 45 d0       	movsd  xmm0,QWORD PTR [rbp-0x30]
   1400088e6:	48 83 c4 50          	add    rsp,0x50
   1400088ea:	5d                   	pop    rbp
   1400088eb:	c3                   	ret
   1400088ec:	55                   	push   rbp
   1400088ed:	53                   	push   rbx
   1400088ee:	48 83 ec 58          	sub    rsp,0x58
   1400088f2:	48 8d 6c 24 50       	lea    rbp,[rsp+0x50]
   1400088f7:	f2 0f 11 45 20       	movsd  QWORD PTR [rbp+0x20],xmm0
   1400088fc:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   140008900:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140008904:	f2 0f 10 45 20       	movsd  xmm0,QWORD PTR [rbp+0x20]
   140008909:	f2 0f 11 45 d8       	movsd  QWORD PTR [rbp-0x28],xmm0
   14000890e:	b9 01 00 00 00       	mov    ecx,0x1
   140008913:	e8 d5 f2 ff ff       	call   0x140007bed
   140008918:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   14000891c:	48 83 7d f0 00       	cmp    QWORD PTR [rbp-0x10],0x0
   140008921:	75 0a                	jne    0x14000892d
   140008923:	b8 00 00 00 00       	mov    eax,0x0
   140008928:	e9 68 01 00 00       	jmp    0x140008a95
   14000892d:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008931:	48 83 c0 18          	add    rax,0x18
   140008935:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140008939:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   14000893c:	25 ff ff 0f 00       	and    eax,0xfffff
   140008941:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   140008944:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   140008947:	25 ff ff ff 7f       	and    eax,0x7fffffff
   14000894c:	89 45 dc             	mov    DWORD PTR [rbp-0x24],eax
   14000894f:	8b 45 dc             	mov    eax,DWORD PTR [rbp-0x24]
   140008952:	c1 e8 14             	shr    eax,0x14
   140008955:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140008958:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   14000895c:	74 0b                	je     0x140008969
   14000895e:	8b 45 d0             	mov    eax,DWORD PTR [rbp-0x30]
   140008961:	0d 00 00 10 00       	or     eax,0x100000
   140008966:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   140008969:	8b 45 d8             	mov    eax,DWORD PTR [rbp-0x28]
   14000896c:	89 45 d4             	mov    DWORD PTR [rbp-0x2c],eax
   14000896f:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   140008972:	85 c0                	test   eax,eax
   140008974:	74 7b                	je     0x1400089f1
   140008976:	48 8d 45 d4          	lea    rax,[rbp-0x2c]
   14000897a:	48 89 c1             	mov    rcx,rax
   14000897d:	e8 26 f2 ff ff       	call   0x140007ba8
   140008982:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008985:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   140008989:	74 2b                	je     0x1400089b6
   14000898b:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   14000898e:	b8 20 00 00 00       	mov    eax,0x20
   140008993:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
   140008996:	89 c1                	mov    ecx,eax
   140008998:	d3 e2                	shl    edx,cl
   14000899a:	8b 45 d4             	mov    eax,DWORD PTR [rbp-0x2c]
   14000899d:	09 c2                	or     edx,eax
   14000899f:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400089a3:	89 10                	mov    DWORD PTR [rax],edx
   1400089a5:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   1400089a8:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   1400089ab:	89 c1                	mov    ecx,eax
   1400089ad:	d3 ea                	shr    edx,cl
   1400089af:	89 d0                	mov    eax,edx
   1400089b1:	89 45 d0             	mov    DWORD PTR [rbp-0x30],eax
   1400089b4:	eb 09                	jmp    0x1400089bf
   1400089b6:	8b 55 d4             	mov    edx,DWORD PTR [rbp-0x2c]
   1400089b9:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400089bd:	89 10                	mov    DWORD PTR [rax],edx
   1400089bf:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   1400089c3:	48 83 c0 04          	add    rax,0x4
   1400089c7:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   1400089ca:	89 10                	mov    DWORD PTR [rax],edx
   1400089cc:	8b 00                	mov    eax,DWORD PTR [rax]
   1400089ce:	85 c0                	test   eax,eax
   1400089d0:	74 07                	je     0x1400089d9
   1400089d2:	ba 02 00 00 00       	mov    edx,0x2
   1400089d7:	eb 05                	jmp    0x1400089de
   1400089d9:	ba 01 00 00 00       	mov    edx,0x1
   1400089de:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400089e2:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   1400089e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400089e9:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400089ec:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   1400089ef:	eb 31                	jmp    0x140008a22
   1400089f1:	48 8d 45 d0          	lea    rax,[rbp-0x30]
   1400089f5:	48 89 c1             	mov    rcx,rax
   1400089f8:	e8 ab f1 ff ff       	call   0x140007ba8
   1400089fd:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008a00:	8b 55 d0             	mov    edx,DWORD PTR [rbp-0x30]
   140008a03:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140008a07:	89 10                	mov    DWORD PTR [rax],edx
   140008a09:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008a0d:	c7 40 14 01 00 00 00 	mov    DWORD PTR [rax+0x14],0x1
   140008a14:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008a18:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140008a1b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008a1e:	83 45 f8 20          	add    DWORD PTR [rbp-0x8],0x20
   140008a22:	83 7d e4 00          	cmp    DWORD PTR [rbp-0x1c],0x0
   140008a26:	74 26                	je     0x140008a4e
   140008a28:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140008a2b:	8d 90 cd fb ff ff    	lea    edx,[rax-0x433]
   140008a31:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008a34:	01 c2                	add    edx,eax
   140008a36:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140008a3a:	89 10                	mov    DWORD PTR [rax],edx
   140008a3c:	b8 35 00 00 00       	mov    eax,0x35
   140008a41:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
   140008a44:	89 c2                	mov    edx,eax
   140008a46:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140008a4a:	89 10                	mov    DWORD PTR [rax],edx
   140008a4c:	eb 43                	jmp    0x140008a91
   140008a4e:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140008a51:	8d 90 ce fb ff ff    	lea    edx,[rax-0x432]
   140008a57:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008a5a:	01 c2                	add    edx,eax
   140008a5c:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140008a60:	89 10                	mov    DWORD PTR [rax],edx
   140008a62:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008a65:	c1 e0 05             	shl    eax,0x5
   140008a68:	89 c3                	mov    ebx,eax
   140008a6a:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008a6d:	48 98                	cdqe
   140008a6f:	48 c1 e0 02          	shl    rax,0x2
   140008a73:	48 8d 50 fc          	lea    rdx,[rax-0x4]
   140008a77:	48 8b 45 e8          	mov    rax,QWORD PTR [rbp-0x18]
   140008a7b:	48 01 d0             	add    rax,rdx
   140008a7e:	8b 00                	mov    eax,DWORD PTR [rax]
   140008a80:	89 c1                	mov    ecx,eax
   140008a82:	e8 56 f1 ff ff       	call   0x140007bdd
   140008a87:	29 c3                	sub    ebx,eax
   140008a89:	89 da                	mov    edx,ebx
   140008a8b:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   140008a8f:	89 10                	mov    DWORD PTR [rax],edx
   140008a91:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008a95:	48 83 c4 58          	add    rsp,0x58
   140008a99:	5b                   	pop    rbx
   140008a9a:	5d                   	pop    rbp
   140008a9b:	c3                   	ret
   140008a9c:	55                   	push   rbp
   140008a9d:	48 89 e5             	mov    rbp,rsp
   140008aa0:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008aa4:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140008aa8:	eb 05                	jmp    0x140008aaf
   140008aaa:	48 83 45 10 01       	add    QWORD PTR [rbp+0x10],0x1
   140008aaf:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008ab3:	48 8d 50 01          	lea    rdx,[rax+0x1]
   140008ab7:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140008abb:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   140008abe:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008ac2:	88 10                	mov    BYTE PTR [rax],dl
   140008ac4:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008ac8:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140008acb:	84 c0                	test   al,al
   140008acd:	75 db                	jne    0x140008aaa
   140008acf:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008ad3:	5d                   	pop    rbp
   140008ad4:	c3                   	ret
   140008ad5:	90                   	nop
   140008ad6:	90                   	nop
   140008ad7:	90                   	nop
   140008ad8:	90                   	nop
   140008ad9:	90                   	nop
   140008ada:	90                   	nop
   140008adb:	90                   	nop
   140008adc:	90                   	nop
   140008add:	90                   	nop
   140008ade:	90                   	nop
   140008adf:	90                   	nop
   140008ae0:	55                   	push   rbp
   140008ae1:	48 89 e5             	mov    rbp,rsp
   140008ae4:	48 83 ec 10          	sub    rsp,0x10
   140008ae8:	f2 0f 11 45 10       	movsd  QWORD PTR [rbp+0x10],xmm0
   140008aed:	f2 0f 10 45 10       	movsd  xmm0,QWORD PTR [rbp+0x10]
   140008af2:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
   140008af7:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   140008afa:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008afd:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   140008b00:	8b 55 fc             	mov    edx,DWORD PTR [rbp-0x4]
   140008b03:	81 e2 ff ff 0f 00    	and    edx,0xfffff
   140008b09:	09 d0                	or     eax,edx
   140008b0b:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008b0e:	81 65 fc 00 00 f0 7f 	and    DWORD PTR [rbp-0x4],0x7ff00000
   140008b15:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008b18:	0b 45 f8             	or     eax,DWORD PTR [rbp-0x8]
   140008b1b:	85 c0                	test   eax,eax
   140008b1d:	75 07                	jne    0x140008b26
   140008b1f:	b8 00 40 00 00       	mov    eax,0x4000
   140008b24:	eb 2f                	jmp    0x140008b55
   140008b26:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140008b2a:	75 07                	jne    0x140008b33
   140008b2c:	b8 00 44 00 00       	mov    eax,0x4400
   140008b31:	eb 22                	jmp    0x140008b55
   140008b33:	81 7d fc 00 00 f0 7f 	cmp    DWORD PTR [rbp-0x4],0x7ff00000
   140008b3a:	75 14                	jne    0x140008b50
   140008b3c:	83 7d f8 00          	cmp    DWORD PTR [rbp-0x8],0x0
   140008b40:	74 07                	je     0x140008b49
   140008b42:	b8 00 01 00 00       	mov    eax,0x100
   140008b47:	eb 0c                	jmp    0x140008b55
   140008b49:	b8 00 05 00 00       	mov    eax,0x500
   140008b4e:	eb 05                	jmp    0x140008b55
   140008b50:	b8 00 04 00 00       	mov    eax,0x400
   140008b55:	48 83 c4 10          	add    rsp,0x10
   140008b59:	5d                   	pop    rbp
   140008b5a:	c3                   	ret
   140008b5b:	90                   	nop
   140008b5c:	90                   	nop
   140008b5d:	90                   	nop
   140008b5e:	90                   	nop
   140008b5f:	90                   	nop
   140008b60:	55                   	push   rbp
   140008b61:	53                   	push   rbx
   140008b62:	48 83 ec 38          	sub    rsp,0x38
   140008b66:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140008b6b:	48 89 cb             	mov    rbx,rcx
   140008b6e:	db 2b                	fld    TBYTE PTR [rbx]
   140008b70:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140008b73:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140008b76:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   140008b79:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140008b7d:	98                   	cwde
   140008b7e:	25 ff 7f 00 00       	and    eax,0x7fff
   140008b83:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008b86:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140008b8a:	75 25                	jne    0x140008bb1
   140008b8c:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140008b8f:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008b92:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
   140008b95:	0b 45 f8             	or     eax,DWORD PTR [rbp-0x8]
   140008b98:	85 c0                	test   eax,eax
   140008b9a:	75 07                	jne    0x140008ba3
   140008b9c:	b8 00 40 00 00       	mov    eax,0x4000
   140008ba1:	eb 3d                	jmp    0x140008be0
   140008ba3:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008ba6:	85 c0                	test   eax,eax
   140008ba8:	78 31                	js     0x140008bdb
   140008baa:	b8 00 44 00 00       	mov    eax,0x4400
   140008baf:	eb 2f                	jmp    0x140008be0
   140008bb1:	81 7d fc ff 7f 00 00 	cmp    DWORD PTR [rbp-0x4],0x7fff
   140008bb8:	75 21                	jne    0x140008bdb
   140008bba:	8b 45 e4             	mov    eax,DWORD PTR [rbp-0x1c]
   140008bbd:	25 ff ff ff 7f       	and    eax,0x7fffffff
   140008bc2:	89 c2                	mov    edx,eax
   140008bc4:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
   140008bc7:	09 d0                	or     eax,edx
   140008bc9:	85 c0                	test   eax,eax
   140008bcb:	75 07                	jne    0x140008bd4
   140008bcd:	b8 00 05 00 00       	mov    eax,0x500
   140008bd2:	eb 0c                	jmp    0x140008be0
   140008bd4:	b8 00 01 00 00       	mov    eax,0x100
   140008bd9:	eb 05                	jmp    0x140008be0
   140008bdb:	b8 00 04 00 00       	mov    eax,0x400
   140008be0:	48 83 c4 38          	add    rsp,0x38
   140008be4:	5b                   	pop    rbx
   140008be5:	5d                   	pop    rbp
   140008be6:	c3                   	ret
   140008be7:	90                   	nop
   140008be8:	90                   	nop
   140008be9:	90                   	nop
   140008bea:	90                   	nop
   140008beb:	90                   	nop
   140008bec:	90                   	nop
   140008bed:	90                   	nop
   140008bee:	90                   	nop
   140008bef:	90                   	nop
   140008bf0:	55                   	push   rbp
   140008bf1:	48 89 e5             	mov    rbp,rsp
   140008bf4:	48 83 ec 10          	sub    rsp,0x10
   140008bf8:	f2 0f 11 45 10       	movsd  QWORD PTR [rbp+0x10],xmm0
   140008bfd:	f2 0f 10 45 10       	movsd  xmm0,QWORD PTR [rbp+0x10]
   140008c02:	f2 0f 11 45 f0       	movsd  QWORD PTR [rbp-0x10],xmm0
   140008c07:	8b 45 f0             	mov    eax,DWORD PTR [rbp-0x10]
   140008c0a:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008c0d:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   140008c10:	25 ff ff ff 7f       	and    eax,0x7fffffff
   140008c15:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008c18:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008c1b:	f7 d8                	neg    eax
   140008c1d:	0b 45 fc             	or     eax,DWORD PTR [rbp-0x4]
   140008c20:	c1 e8 1f             	shr    eax,0x1f
   140008c23:	89 c2                	mov    edx,eax
   140008c25:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008c28:	09 d0                	or     eax,edx
   140008c2a:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008c2d:	b8 00 00 f0 7f       	mov    eax,0x7ff00000
   140008c32:	2b 45 f8             	sub    eax,DWORD PTR [rbp-0x8]
   140008c35:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008c38:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008c3b:	c1 f8 1f             	sar    eax,0x1f
   140008c3e:	48 83 c4 10          	add    rsp,0x10
   140008c42:	5d                   	pop    rbp
   140008c43:	c3                   	ret
   140008c44:	90                   	nop
   140008c45:	90                   	nop
   140008c46:	90                   	nop
   140008c47:	90                   	nop
   140008c48:	90                   	nop
   140008c49:	90                   	nop
   140008c4a:	90                   	nop
   140008c4b:	90                   	nop
   140008c4c:	90                   	nop
   140008c4d:	90                   	nop
   140008c4e:	90                   	nop
   140008c4f:	90                   	nop
   140008c50:	55                   	push   rbp
   140008c51:	53                   	push   rbx
   140008c52:	48 83 ec 38          	sub    rsp,0x38
   140008c56:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140008c5b:	48 89 cb             	mov    rbx,rcx
   140008c5e:	db 2b                	fld    TBYTE PTR [rbx]
   140008c60:	db 7d d0             	fstp   TBYTE PTR [rbp-0x30]
   140008c63:	db 6d d0             	fld    TBYTE PTR [rbp-0x30]
   140008c66:	db 7d e0             	fstp   TBYTE PTR [rbp-0x20]
   140008c69:	0f b7 45 e8          	movzx  eax,WORD PTR [rbp-0x18]
   140008c6d:	98                   	cwde
   140008c6e:	01 c0                	add    eax,eax
   140008c70:	25 ff ff 00 00       	and    eax,0xffff
   140008c75:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008c78:	8b 45 e0             	mov    eax,DWORD PTR [rbp-0x20]
   140008c7b:	8b 55 e4             	mov    edx,DWORD PTR [rbp-0x1c]
   140008c7e:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
   140008c84:	09 d0                	or     eax,edx
   140008c86:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140008c89:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008c8c:	f7 d8                	neg    eax
   140008c8e:	0b 45 f8             	or     eax,DWORD PTR [rbp-0x8]
   140008c91:	c1 e8 1f             	shr    eax,0x1f
   140008c94:	89 c2                	mov    edx,eax
   140008c96:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008c99:	09 d0                	or     eax,edx
   140008c9b:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008c9e:	b8 fe ff 00 00       	mov    eax,0xfffe
   140008ca3:	2b 45 fc             	sub    eax,DWORD PTR [rbp-0x4]
   140008ca6:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008ca9:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008cac:	c1 f8 10             	sar    eax,0x10
   140008caf:	48 83 c4 38          	add    rsp,0x38
   140008cb3:	5b                   	pop    rbx
   140008cb4:	5d                   	pop    rbp
   140008cb5:	c3                   	ret
   140008cb6:	90                   	nop
   140008cb7:	90                   	nop
   140008cb8:	90                   	nop
   140008cb9:	90                   	nop
   140008cba:	90                   	nop
   140008cbb:	90                   	nop
   140008cbc:	90                   	nop
   140008cbd:	90                   	nop
   140008cbe:	90                   	nop
   140008cbf:	90                   	nop
   140008cc0:	55                   	push   rbp
   140008cc1:	48 89 e5             	mov    rbp,rsp
   140008cc4:	48 83 ec 10          	sub    rsp,0x10
   140008cc8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008ccc:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140008cd0:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
   140008cd7:	00 
   140008cd8:	eb 0a                	jmp    0x140008ce4
   140008cda:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
   140008cdf:	48 83 45 10 02       	add    QWORD PTR [rbp+0x10],0x2
   140008ce4:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008ce8:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   140008cec:	73 0c                	jae    0x140008cfa
   140008cee:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008cf2:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140008cf5:	66 85 c0             	test   ax,ax
   140008cf8:	75 e0                	jne    0x140008cda
   140008cfa:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008cfe:	48 83 c4 10          	add    rsp,0x10
   140008d02:	5d                   	pop    rbp
   140008d03:	c3                   	ret
   140008d04:	90                   	nop
   140008d05:	90                   	nop
   140008d06:	90                   	nop
   140008d07:	90                   	nop
   140008d08:	90                   	nop
   140008d09:	90                   	nop
   140008d0a:	90                   	nop
   140008d0b:	90                   	nop
   140008d0c:	90                   	nop
   140008d0d:	90                   	nop
   140008d0e:	90                   	nop
   140008d0f:	90                   	nop
   140008d10:	55                   	push   rbp
   140008d11:	48 89 e5             	mov    rbp,rsp
   140008d14:	48 83 ec 50          	sub    rsp,0x50
   140008d18:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008d1c:	89 d0                	mov    eax,edx
   140008d1e:	44 89 45 20          	mov    DWORD PTR [rbp+0x20],r8d
   140008d22:	44 89 4d 28          	mov    DWORD PTR [rbp+0x28],r9d
   140008d26:	66 89 45 18          	mov    WORD PTR [rbp+0x18],ax
   140008d2a:	83 7d 20 00          	cmp    DWORD PTR [rbp+0x20],0x0
   140008d2e:	75 2f                	jne    0x140008d5f
   140008d30:	0f b7 45 18          	movzx  eax,WORD PTR [rbp+0x18]
   140008d34:	66 3d ff 00          	cmp    ax,0xff
   140008d38:	76 12                	jbe    0x140008d4c
   140008d3a:	e8 59 09 00 00       	call   0x140009698
   140008d3f:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   140008d45:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140008d4a:	eb 7e                	jmp    0x140008dca
   140008d4c:	0f b7 45 18          	movzx  eax,WORD PTR [rbp+0x18]
   140008d50:	89 c2                	mov    edx,eax
   140008d52:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008d56:	88 10                	mov    BYTE PTR [rax],dl
   140008d58:	b8 01 00 00 00       	mov    eax,0x1
   140008d5d:	eb 6b                	jmp    0x140008dca
   140008d5f:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [rbp-0x8],0x0
   140008d66:	8b 55 28             	mov    edx,DWORD PTR [rbp+0x28]
   140008d69:	4c 8d 45 18          	lea    r8,[rbp+0x18]
   140008d6d:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   140008d70:	48 8d 4d f8          	lea    rcx,[rbp-0x8]
   140008d74:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
   140008d79:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
   140008d80:	00 00 
   140008d82:	89 54 24 28          	mov    DWORD PTR [rsp+0x28],edx
   140008d86:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140008d8a:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140008d8f:	41 b9 01 00 00 00    	mov    r9d,0x1
   140008d95:	ba 00 00 00 00       	mov    edx,0x0
   140008d9a:	89 c1                	mov    ecx,eax
   140008d9c:	48 8b 05 05 85 00 00 	mov    rax,QWORD PTR [rip+0x8505]        # 0x1400112a8
   140008da3:	ff d0                	call   rax
   140008da5:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140008da8:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140008dac:	74 07                	je     0x140008db5
   140008dae:	8b 45 f8             	mov    eax,DWORD PTR [rbp-0x8]
   140008db1:	85 c0                	test   eax,eax
   140008db3:	74 12                	je     0x140008dc7
   140008db5:	e8 de 08 00 00       	call   0x140009698
   140008dba:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   140008dc0:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140008dc5:	eb 03                	jmp    0x140008dca
   140008dc7:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140008dca:	48 83 c4 50          	add    rsp,0x50
   140008dce:	5d                   	pop    rbp
   140008dcf:	c3                   	ret
   140008dd0:	55                   	push   rbp
   140008dd1:	53                   	push   rbx
   140008dd2:	48 83 ec 38          	sub    rsp,0x38
   140008dd6:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140008ddb:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   140008ddf:	89 d0                	mov    eax,edx
   140008de1:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   140008de5:	66 89 45 28          	mov    WORD PTR [rbp+0x28],ax
   140008de9:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
   140008dee:	75 0a                	jne    0x140008dfa
   140008df0:	48 8d 45 f3          	lea    rax,[rbp-0xd]
   140008df4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140008df8:	eb 08                	jmp    0x140008e02
   140008dfa:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   140008dfe:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140008e02:	e8 59 08 00 00       	call   0x140009660
   140008e07:	89 c3                	mov    ebx,eax
   140008e09:	e8 4a 08 00 00       	call   0x140009658
   140008e0e:	89 c1                	mov    ecx,eax
   140008e10:	0f b7 55 28          	movzx  edx,WORD PTR [rbp+0x28]
   140008e14:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008e18:	41 89 d9             	mov    r9d,ebx
   140008e1b:	41 89 c8             	mov    r8d,ecx
   140008e1e:	48 89 c1             	mov    rcx,rax
   140008e21:	e8 ea fe ff ff       	call   0x140008d10
   140008e26:	48 98                	cdqe
   140008e28:	48 83 c4 38          	add    rsp,0x38
   140008e2c:	5b                   	pop    rbx
   140008e2d:	5d                   	pop    rbp
   140008e2e:	c3                   	ret
   140008e2f:	55                   	push   rbp
   140008e30:	48 89 e5             	mov    rbp,rsp
   140008e33:	48 83 ec 50          	sub    rsp,0x50
   140008e37:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008e3b:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140008e3f:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140008e43:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   140008e47:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [rbp-0x14],0x0
   140008e4e:	48 c7 45 f8 00 00 00 	mov    QWORD PTR [rbp-0x8],0x0
   140008e55:	00 
   140008e56:	e8 fd 07 00 00       	call   0x140009658
   140008e5b:	89 45 e8             	mov    DWORD PTR [rbp-0x18],eax
   140008e5e:	e8 fd 07 00 00       	call   0x140009660
   140008e63:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   140008e66:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008e6a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140008e6d:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   140008e71:	48 83 7d 18 00       	cmp    QWORD PTR [rbp+0x18],0x0
   140008e76:	74 0c                	je     0x140008e84
   140008e78:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008e7c:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140008e7f:	48 85 c0             	test   rax,rax
   140008e82:	75 0a                	jne    0x140008e8e
   140008e84:	b8 00 00 00 00       	mov    eax,0x0
   140008e89:	e9 fe 00 00 00       	jmp    0x140008f8c
   140008e8e:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   140008e93:	0f 84 93 00 00 00    	je     0x140008f2c
   140008e99:	eb 76                	jmp    0x140008f11
   140008e9b:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008e9f:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140008ea2:	0f b7 d0             	movzx  edx,ax
   140008ea5:	44 8b 45 e4          	mov    r8d,DWORD PTR [rbp-0x1c]
   140008ea9:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
   140008eac:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008eb0:	45 89 c1             	mov    r9d,r8d
   140008eb3:	41 89 c8             	mov    r8d,ecx
   140008eb6:	48 89 c1             	mov    rcx,rax
   140008eb9:	e8 52 fe ff ff       	call   0x140008d10
   140008ebe:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   140008ec1:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
   140008ec5:	7f 0c                	jg     0x140008ed3
   140008ec7:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
   140008ece:	e9 b9 00 00 00       	jmp    0x140008f8c
   140008ed3:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   140008ed6:	48 98                	cdqe
   140008ed8:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
   140008edc:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   140008edf:	48 98                	cdqe
   140008ee1:	48 01 45 10          	add    QWORD PTR [rbp+0x10],rax
   140008ee5:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008ee9:	48 83 e8 01          	sub    rax,0x1
   140008eed:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140008ef0:	84 c0                	test   al,al
   140008ef2:	75 18                	jne    0x140008f0c
   140008ef4:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008ef8:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   140008eff:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008f03:	48 83 e8 01          	sub    rax,0x1
   140008f07:	e9 80 00 00 00       	jmp    0x140008f8c
   140008f0c:	48 83 45 f0 02       	add    QWORD PTR [rbp-0x10],0x2
   140008f11:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008f15:	48 3b 45 20          	cmp    rax,QWORD PTR [rbp+0x20]
   140008f19:	72 80                	jb     0x140008e9b
   140008f1b:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140008f1f:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   140008f23:	48 89 10             	mov    QWORD PTR [rax],rdx
   140008f26:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008f2a:	eb 60                	jmp    0x140008f8c
   140008f2c:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140008f30:	0f b7 00             	movzx  eax,WORD PTR [rax]
   140008f33:	0f b7 d0             	movzx  edx,ax
   140008f36:	44 8b 45 e4          	mov    r8d,DWORD PTR [rbp-0x1c]
   140008f3a:	8b 4d e8             	mov    ecx,DWORD PTR [rbp-0x18]
   140008f3d:	48 8d 45 df          	lea    rax,[rbp-0x21]
   140008f41:	45 89 c1             	mov    r9d,r8d
   140008f44:	41 89 c8             	mov    r8d,ecx
   140008f47:	48 89 c1             	mov    rcx,rax
   140008f4a:	e8 c1 fd ff ff       	call   0x140008d10
   140008f4f:	89 45 ec             	mov    DWORD PTR [rbp-0x14],eax
   140008f52:	83 7d ec 00          	cmp    DWORD PTR [rbp-0x14],0x0
   140008f56:	7f 09                	jg     0x140008f61
   140008f58:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
   140008f5f:	eb 2b                	jmp    0x140008f8c
   140008f61:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   140008f64:	48 98                	cdqe
   140008f66:	48 01 45 f8          	add    QWORD PTR [rbp-0x8],rax
   140008f6a:	8b 45 ec             	mov    eax,DWORD PTR [rbp-0x14]
   140008f6d:	83 e8 01             	sub    eax,0x1
   140008f70:	48 98                	cdqe
   140008f72:	0f b6 44 05 df       	movzx  eax,BYTE PTR [rbp+rax*1-0x21]
   140008f77:	84 c0                	test   al,al
   140008f79:	75 0a                	jne    0x140008f85
   140008f7b:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008f7f:	48 83 e8 01          	sub    rax,0x1
   140008f83:	eb 07                	jmp    0x140008f8c
   140008f85:	48 83 45 f0 02       	add    QWORD PTR [rbp-0x10],0x2
   140008f8a:	eb a0                	jmp    0x140008f2c
   140008f8c:	48 83 c4 50          	add    rsp,0x50
   140008f90:	5d                   	pop    rbp
   140008f91:	c3                   	ret
   140008f92:	90                   	nop
   140008f93:	90                   	nop
   140008f94:	90                   	nop
   140008f95:	90                   	nop
   140008f96:	90                   	nop
   140008f97:	90                   	nop
   140008f98:	90                   	nop
   140008f99:	90                   	nop
   140008f9a:	90                   	nop
   140008f9b:	90                   	nop
   140008f9c:	90                   	nop
   140008f9d:	90                   	nop
   140008f9e:	90                   	nop
   140008f9f:	90                   	nop
   140008fa0:	55                   	push   rbp
   140008fa1:	48 89 e5             	mov    rbp,rsp
   140008fa4:	48 83 ec 10          	sub    rsp,0x10
   140008fa8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008fac:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140008fb0:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140008fb4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140008fb8:	eb 05                	jmp    0x140008fbf
   140008fba:	48 83 45 f8 01       	add    QWORD PTR [rbp-0x8],0x1
   140008fbf:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008fc3:	48 2b 45 10          	sub    rax,QWORD PTR [rbp+0x10]
   140008fc7:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   140008fcb:	73 0b                	jae    0x140008fd8
   140008fcd:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008fd1:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140008fd4:	84 c0                	test   al,al
   140008fd6:	75 e2                	jne    0x140008fba
   140008fd8:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140008fdc:	48 2b 45 10          	sub    rax,QWORD PTR [rbp+0x10]
   140008fe0:	48 83 c4 10          	add    rsp,0x10
   140008fe4:	5d                   	pop    rbp
   140008fe5:	c3                   	ret
   140008fe6:	90                   	nop
   140008fe7:	90                   	nop
   140008fe8:	90                   	nop
   140008fe9:	90                   	nop
   140008fea:	90                   	nop
   140008feb:	90                   	nop
   140008fec:	90                   	nop
   140008fed:	90                   	nop
   140008fee:	90                   	nop
   140008fef:	90                   	nop
   140008ff0:	55                   	push   rbp
   140008ff1:	48 89 e5             	mov    rbp,rsp
   140008ff4:	48 83 ec 40          	sub    rsp,0x40
   140008ff8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140008ffc:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140009000:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140009004:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   140009008:	48 83 7d 18 00       	cmp    QWORD PTR [rbp+0x18],0x0
   14000900d:	75 0a                	jne    0x140009019
   14000900f:	b8 00 00 00 00       	mov    eax,0x0
   140009014:	e9 9f 01 00 00       	jmp    0x1400091b8
   140009019:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
   14000901e:	75 0a                	jne    0x14000902a
   140009020:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   140009025:	e9 8e 01 00 00       	jmp    0x1400091b8
   14000902a:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   14000902e:	8b 00                	mov    eax,DWORD PTR [rax]
   140009030:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140009033:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140009037:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   14000903d:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140009041:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140009044:	84 c0                	test   al,al
   140009046:	75 13                	jne    0x14000905b
   140009048:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000904c:	66 c7 00 00 00       	mov    WORD PTR [rax],0x0
   140009051:	b8 00 00 00 00       	mov    eax,0x0
   140009056:	e9 5d 01 00 00       	jmp    0x1400091b8
   14000905b:	83 7d 38 01          	cmp    DWORD PTR [rbp+0x38],0x1
   14000905f:	0f 86 ee 00 00 00    	jbe    0x140009153
   140009065:	0f b6 45 fc          	movzx  eax,BYTE PTR [rbp-0x4]
   140009069:	84 c0                	test   al,al
   14000906b:	74 5e                	je     0x1400090cb
   14000906d:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   140009071:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140009074:	88 45 fd             	mov    BYTE PTR [rbp-0x3],al
   140009077:	48 8d 4d fc          	lea    rcx,[rbp-0x4]
   14000907b:	8b 45 30             	mov    eax,DWORD PTR [rbp+0x30]
   14000907e:	c7 44 24 28 01 00 00 	mov    DWORD PTR [rsp+0x28],0x1
   140009085:	00 
   140009086:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   14000908a:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   14000908f:	41 b9 02 00 00 00    	mov    r9d,0x2
   140009095:	49 89 c8             	mov    r8,rcx
   140009098:	ba 08 00 00 00       	mov    edx,0x8
   14000909d:	89 c1                	mov    ecx,eax
   14000909f:	48 8b 05 d2 81 00 00 	mov    rax,QWORD PTR [rip+0x81d2]        # 0x140011278
   1400090a6:	ff d0                	call   rax
   1400090a8:	85 c0                	test   eax,eax
   1400090aa:	75 15                	jne    0x1400090c1
   1400090ac:	e8 e7 05 00 00       	call   0x140009698
   1400090b1:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   1400090b7:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400090bc:	e9 f7 00 00 00       	jmp    0x1400091b8
   1400090c1:	b8 02 00 00 00       	mov    eax,0x2
   1400090c6:	e9 ed 00 00 00       	jmp    0x1400091b8
   1400090cb:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400090cf:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400090d2:	0f b6 d0             	movzx  edx,al
   1400090d5:	8b 45 30             	mov    eax,DWORD PTR [rbp+0x30]
   1400090d8:	89 c1                	mov    ecx,eax
   1400090da:	48 8b 05 7f 81 00 00 	mov    rax,QWORD PTR [rip+0x817f]        # 0x140011260
   1400090e1:	ff d0                	call   rax
   1400090e3:	85 c0                	test   eax,eax
   1400090e5:	74 6c                	je     0x140009153
   1400090e7:	48 83 7d 20 01       	cmp    QWORD PTR [rbp+0x20],0x1
   1400090ec:	77 17                	ja     0x140009105
   1400090ee:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400090f2:	0f b6 10             	movzx  edx,BYTE PTR [rax]
   1400090f5:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   1400090f9:	88 10                	mov    BYTE PTR [rax],dl
   1400090fb:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   140009100:	e9 b3 00 00 00       	jmp    0x1400091b8
   140009105:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   140009109:	8b 45 30             	mov    eax,DWORD PTR [rbp+0x30]
   14000910c:	c7 44 24 28 01 00 00 	mov    DWORD PTR [rsp+0x28],0x1
   140009113:	00 
   140009114:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140009118:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   14000911d:	41 b9 02 00 00 00    	mov    r9d,0x2
   140009123:	49 89 c8             	mov    r8,rcx
   140009126:	ba 08 00 00 00       	mov    edx,0x8
   14000912b:	89 c1                	mov    ecx,eax
   14000912d:	48 8b 05 44 81 00 00 	mov    rax,QWORD PTR [rip+0x8144]        # 0x140011278
   140009134:	ff d0                	call   rax
   140009136:	85 c0                	test   eax,eax
   140009138:	75 12                	jne    0x14000914c
   14000913a:	e8 59 05 00 00       	call   0x140009698
   14000913f:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   140009145:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000914a:	eb 6c                	jmp    0x1400091b8
   14000914c:	b8 02 00 00 00       	mov    eax,0x2
   140009151:	eb 65                	jmp    0x1400091b8
   140009153:	83 7d 30 00          	cmp    DWORD PTR [rbp+0x30],0x0
   140009157:	75 13                	jne    0x14000916c
   140009159:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000915d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140009160:	0f b6 d0             	movzx  edx,al
   140009163:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140009167:	66 89 10             	mov    WORD PTR [rax],dx
   14000916a:	eb 47                	jmp    0x1400091b3
   14000916c:	48 8b 4d 18          	mov    rcx,QWORD PTR [rbp+0x18]
   140009170:	8b 45 30             	mov    eax,DWORD PTR [rbp+0x30]
   140009173:	c7 44 24 28 01 00 00 	mov    DWORD PTR [rsp+0x28],0x1
   14000917a:	00 
   14000917b:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   14000917f:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140009184:	41 b9 01 00 00 00    	mov    r9d,0x1
   14000918a:	49 89 c8             	mov    r8,rcx
   14000918d:	ba 08 00 00 00       	mov    edx,0x8
   140009192:	89 c1                	mov    ecx,eax
   140009194:	48 8b 05 dd 80 00 00 	mov    rax,QWORD PTR [rip+0x80dd]        # 0x140011278
   14000919b:	ff d0                	call   rax
   14000919d:	85 c0                	test   eax,eax
   14000919f:	75 12                	jne    0x1400091b3
   1400091a1:	e8 f2 04 00 00       	call   0x140009698
   1400091a6:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   1400091ac:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400091b1:	eb 05                	jmp    0x1400091b8
   1400091b3:	b8 01 00 00 00       	mov    eax,0x1
   1400091b8:	48 83 c4 40          	add    rsp,0x40
   1400091bc:	5d                   	pop    rbp
   1400091bd:	c3                   	ret
   1400091be:	55                   	push   rbp
   1400091bf:	53                   	push   rbx
   1400091c0:	48 83 ec 48          	sub    rsp,0x48
   1400091c4:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   1400091c9:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   1400091cd:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   1400091d1:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   1400091d5:	4c 89 4d 38          	mov    QWORD PTR [rbp+0x38],r9
   1400091d9:	66 c7 45 f6 00 00    	mov    WORD PTR [rbp-0xa],0x0
   1400091df:	48 83 7d 20 00       	cmp    QWORD PTR [rbp+0x20],0x0
   1400091e4:	75 0a                	jne    0x1400091f0
   1400091e6:	48 8d 45 f6          	lea    rax,[rbp-0xa]
   1400091ea:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400091ee:	eb 08                	jmp    0x1400091f8
   1400091f0:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400091f4:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400091f8:	e8 63 04 00 00       	call   0x140009660
   1400091fd:	89 c3                	mov    ebx,eax
   1400091ff:	e8 54 04 00 00       	call   0x140009658
   140009204:	41 89 c0             	mov    r8d,eax
   140009207:	48 83 7d 38 00       	cmp    QWORD PTR [rbp+0x38],0x0
   14000920c:	74 06                	je     0x140009214
   14000920e:	48 8b 45 38          	mov    rax,QWORD PTR [rbp+0x38]
   140009212:	eb 07                	jmp    0x14000921b
   140009214:	48 8d 05 65 79 00 00 	lea    rax,[rip+0x7965]        # 0x140010b80
   14000921b:	4c 8b 55 30          	mov    r10,QWORD PTR [rbp+0x30]
   14000921f:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140009223:	48 8b 4d f8          	mov    rcx,QWORD PTR [rbp-0x8]
   140009227:	89 5c 24 28          	mov    DWORD PTR [rsp+0x28],ebx
   14000922b:	44 89 44 24 20       	mov    DWORD PTR [rsp+0x20],r8d
   140009230:	49 89 c1             	mov    r9,rax
   140009233:	4d 89 d0             	mov    r8,r10
   140009236:	e8 b5 fd ff ff       	call   0x140008ff0
   14000923b:	48 98                	cdqe
   14000923d:	48 83 c4 48          	add    rsp,0x48
   140009241:	5b                   	pop    rbx
   140009242:	5d                   	pop    rbp
   140009243:	c3                   	ret
   140009244:	55                   	push   rbp
   140009245:	48 89 e5             	mov    rbp,rsp
   140009248:	48 83 ec 60          	sub    rsp,0x60
   14000924c:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140009250:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140009254:	4c 89 45 20          	mov    QWORD PTR [rbp+0x20],r8
   140009258:	4c 89 4d 28          	mov    QWORD PTR [rbp+0x28],r9
   14000925c:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140009263:	48 c7 45 f0 00 00 00 	mov    QWORD PTR [rbp-0x10],0x0
   14000926a:	00 
   14000926b:	48 83 7d 28 00       	cmp    QWORD PTR [rbp+0x28],0x0
   140009270:	74 0a                	je     0x14000927c
   140009272:	48 8b 45 28          	mov    rax,QWORD PTR [rbp+0x28]
   140009276:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   14000927a:	eb 0b                	jmp    0x140009287
   14000927c:	48 8d 05 01 79 00 00 	lea    rax,[rip+0x7901]        # 0x140010b84
   140009283:	48 89 45 e8          	mov    QWORD PTR [rbp-0x18],rax
   140009287:	e8 cc 03 00 00       	call   0x140009658
   14000928c:	89 45 e4             	mov    DWORD PTR [rbp-0x1c],eax
   14000928f:	e8 cc 03 00 00       	call   0x140009660
   140009294:	89 45 e0             	mov    DWORD PTR [rbp-0x20],eax
   140009297:	48 83 7d 18 00       	cmp    QWORD PTR [rbp+0x18],0x0
   14000929c:	74 0c                	je     0x1400092aa
   14000929e:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400092a2:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400092a5:	48 85 c0             	test   rax,rax
   1400092a8:	75 0a                	jne    0x1400092b4
   1400092aa:	b8 00 00 00 00       	mov    eax,0x0
   1400092af:	e9 df 00 00 00       	jmp    0x140009393
   1400092b4:	48 83 7d 10 00       	cmp    QWORD PTR [rbp+0x10],0x0
   1400092b9:	0f 84 86 00 00 00    	je     0x140009345
   1400092bf:	eb 24                	jmp    0x1400092e5
   1400092c1:	48 83 45 10 02       	add    QWORD PTR [rbp+0x10],0x2
   1400092c6:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400092ca:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   1400092cd:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400092d0:	48 98                	cdqe
   1400092d2:	48 01 c2             	add    rdx,rax
   1400092d5:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400092d9:	48 89 10             	mov    QWORD PTR [rax],rdx
   1400092dc:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400092df:	48 98                	cdqe
   1400092e1:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
   1400092e5:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   1400092e9:	48 3b 45 20          	cmp    rax,QWORD PTR [rbp+0x20]
   1400092ed:	73 39                	jae    0x140009328
   1400092ef:	48 8b 45 20          	mov    rax,QWORD PTR [rbp+0x20]
   1400092f3:	48 2b 45 f0          	sub    rax,QWORD PTR [rbp-0x10]
   1400092f7:	49 89 c0             	mov    r8,rax
   1400092fa:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400092fe:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140009301:	4c 8b 4d e8          	mov    r9,QWORD PTR [rbp-0x18]
   140009305:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140009309:	8b 4d e0             	mov    ecx,DWORD PTR [rbp-0x20]
   14000930c:	89 4c 24 28          	mov    DWORD PTR [rsp+0x28],ecx
   140009310:	8b 4d e4             	mov    ecx,DWORD PTR [rbp-0x1c]
   140009313:	89 4c 24 20          	mov    DWORD PTR [rsp+0x20],ecx
   140009317:	48 89 c1             	mov    rcx,rax
   14000931a:	e8 d1 fc ff ff       	call   0x140008ff0
   14000931f:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140009322:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140009326:	7f 99                	jg     0x1400092c1
   140009328:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   14000932c:	48 3b 45 20          	cmp    rax,QWORD PTR [rbp+0x20]
   140009330:	73 5d                	jae    0x14000938f
   140009332:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   140009336:	75 57                	jne    0x14000938f
   140009338:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000933c:	48 c7 00 00 00 00 00 	mov    QWORD PTR [rax],0x0
   140009343:	eb 4a                	jmp    0x14000938f
   140009345:	66 c7 45 de 00 00    	mov    WORD PTR [rbp-0x22],0x0
   14000934b:	eb 09                	jmp    0x140009356
   14000934d:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   140009350:	48 98                	cdqe
   140009352:	48 01 45 f0          	add    QWORD PTR [rbp-0x10],rax
   140009356:	44 8b 45 e0          	mov    r8d,DWORD PTR [rbp-0x20]
   14000935a:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   14000935e:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140009361:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140009365:	48 01 c2             	add    rdx,rax
   140009368:	4c 8b 4d e8          	mov    r9,QWORD PTR [rbp-0x18]
   14000936c:	48 8d 45 de          	lea    rax,[rbp-0x22]
   140009370:	8b 4d e0             	mov    ecx,DWORD PTR [rbp-0x20]
   140009373:	89 4c 24 28          	mov    DWORD PTR [rsp+0x28],ecx
   140009377:	8b 4d e4             	mov    ecx,DWORD PTR [rbp-0x1c]
   14000937a:	89 4c 24 20          	mov    DWORD PTR [rsp+0x20],ecx
   14000937e:	48 89 c1             	mov    rcx,rax
   140009381:	e8 6a fc ff ff       	call   0x140008ff0
   140009386:	89 45 fc             	mov    DWORD PTR [rbp-0x4],eax
   140009389:	83 7d fc 00          	cmp    DWORD PTR [rbp-0x4],0x0
   14000938d:	7f be                	jg     0x14000934d
   14000938f:	48 8b 45 f0          	mov    rax,QWORD PTR [rbp-0x10]
   140009393:	48 83 c4 60          	add    rsp,0x60
   140009397:	5d                   	pop    rbp
   140009398:	c3                   	ret
   140009399:	55                   	push   rbp
   14000939a:	53                   	push   rbx
   14000939b:	48 83 ec 48          	sub    rsp,0x48
   14000939f:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   1400093a4:	48 89 4d 20          	mov    QWORD PTR [rbp+0x20],rcx
   1400093a8:	48 89 55 28          	mov    QWORD PTR [rbp+0x28],rdx
   1400093ac:	4c 89 45 30          	mov    QWORD PTR [rbp+0x30],r8
   1400093b0:	66 c7 45 fe 00 00    	mov    WORD PTR [rbp-0x2],0x0
   1400093b6:	e8 a5 02 00 00       	call   0x140009660
   1400093bb:	89 c3                	mov    ebx,eax
   1400093bd:	e8 96 02 00 00       	call   0x140009658
   1400093c2:	41 89 c0             	mov    r8d,eax
   1400093c5:	48 83 7d 30 00       	cmp    QWORD PTR [rbp+0x30],0x0
   1400093ca:	74 06                	je     0x1400093d2
   1400093cc:	48 8b 45 30          	mov    rax,QWORD PTR [rbp+0x30]
   1400093d0:	eb 07                	jmp    0x1400093d9
   1400093d2:	48 8d 05 af 77 00 00 	lea    rax,[rip+0x77af]        # 0x140010b88
   1400093d9:	4c 8b 55 28          	mov    r10,QWORD PTR [rbp+0x28]
   1400093dd:	48 8b 55 20          	mov    rdx,QWORD PTR [rbp+0x20]
   1400093e1:	48 8d 4d fe          	lea    rcx,[rbp-0x2]
   1400093e5:	89 5c 24 28          	mov    DWORD PTR [rsp+0x28],ebx
   1400093e9:	44 89 44 24 20       	mov    DWORD PTR [rsp+0x20],r8d
   1400093ee:	49 89 c1             	mov    r9,rax
   1400093f1:	4d 89 d0             	mov    r8,r10
   1400093f4:	e8 f7 fb ff ff       	call   0x140008ff0
   1400093f9:	48 98                	cdqe
   1400093fb:	48 83 c4 48          	add    rsp,0x48
   1400093ff:	5b                   	pop    rbx
   140009400:	5d                   	pop    rbp
   140009401:	c3                   	ret
   140009402:	90                   	nop
   140009403:	90                   	nop
   140009404:	90                   	nop
   140009405:	90                   	nop
   140009406:	90                   	nop
   140009407:	90                   	nop
   140009408:	90                   	nop
   140009409:	90                   	nop
   14000940a:	90                   	nop
   14000940b:	90                   	nop
   14000940c:	90                   	nop
   14000940d:	90                   	nop
   14000940e:	90                   	nop
   14000940f:	90                   	nop
   140009410:	55                   	push   rbp
   140009411:	48 89 e5             	mov    rbp,rsp
   140009414:	48 83 ec 30          	sub    rsp,0x30
   140009418:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   14000941c:	48 89 55 18          	mov    QWORD PTR [rbp+0x18],rdx
   140009420:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140009424:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140009428:	eb 29                	jmp    0x140009453
   14000942a:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000942e:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140009431:	48 85 c0             	test   rax,rax
   140009434:	74 17                	je     0x14000944d
   140009436:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   14000943a:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000943d:	ff d0                	call   rax
   14000943f:	89 45 f4             	mov    DWORD PTR [rbp-0xc],eax
   140009442:	83 7d f4 00          	cmp    DWORD PTR [rbp-0xc],0x0
   140009446:	74 06                	je     0x14000944e
   140009448:	8b 45 f4             	mov    eax,DWORD PTR [rbp-0xc]
   14000944b:	eb 15                	jmp    0x140009462
   14000944d:	90                   	nop
   14000944e:	48 83 45 f8 08       	add    QWORD PTR [rbp-0x8],0x8
   140009453:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   140009457:	48 3b 45 18          	cmp    rax,QWORD PTR [rbp+0x18]
   14000945b:	72 cd                	jb     0x14000942a
   14000945d:	b8 00 00 00 00       	mov    eax,0x0
   140009462:	48 83 c4 30          	add    rsp,0x30
   140009466:	5d                   	pop    rbp
   140009467:	c3                   	ret
   140009468:	90                   	nop
   140009469:	90                   	nop
   14000946a:	90                   	nop
   14000946b:	90                   	nop
   14000946c:	90                   	nop
   14000946d:	90                   	nop
   14000946e:	90                   	nop
   14000946f:	90                   	nop
   140009470:	55                   	push   rbp
   140009471:	48 89 e5             	mov    rbp,rsp
   140009474:	48 8b 05 55 23 00 00 	mov    rax,QWORD PTR [rip+0x2355]        # 0x14000b7d0
   14000947b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000947e:	5d                   	pop    rbp
   14000947f:	c3                   	ret
   140009480:	55                   	push   rbp
   140009481:	48 89 e5             	mov    rbp,rsp
   140009484:	48 8b 05 35 23 00 00 	mov    rax,QWORD PTR [rip+0x2335]        # 0x14000b7c0
   14000948b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000948e:	5d                   	pop    rbp
   14000948f:	c3                   	ret
   140009490:	55                   	push   rbp
   140009491:	48 89 e5             	mov    rbp,rsp
   140009494:	48 8b 05 15 23 00 00 	mov    rax,QWORD PTR [rip+0x2315]        # 0x14000b7b0
   14000949b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000949e:	5d                   	pop    rbp
   14000949f:	c3                   	ret
   1400094a0:	55                   	push   rbp
   1400094a1:	48 89 e5             	mov    rbp,rsp
   1400094a4:	48 83 ec 20          	sub    rsp,0x20
   1400094a8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400094ac:	b9 00 00 00 00       	mov    ecx,0x0
   1400094b1:	e8 6a 01 00 00       	call   0x140009620
   1400094b6:	48 39 45 10          	cmp    QWORD PTR [rbp+0x10],rax
   1400094ba:	72 52                	jb     0x14000950e
   1400094bc:	b9 13 00 00 00       	mov    ecx,0x13
   1400094c1:	e8 5a 01 00 00       	call   0x140009620
   1400094c6:	48 3b 45 10          	cmp    rax,QWORD PTR [rbp+0x10]
   1400094ca:	72 42                	jb     0x14000950e
   1400094cc:	b9 00 00 00 00       	mov    ecx,0x0
   1400094d1:	e8 4a 01 00 00       	call   0x140009620
   1400094d6:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   1400094da:	48 29 c2             	sub    rdx,rax
   1400094dd:	48 c1 fa 04          	sar    rdx,0x4
   1400094e1:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
   1400094e8:	aa aa aa 
   1400094eb:	48 0f af c2          	imul   rax,rdx
   1400094ef:	83 c0 10             	add    eax,0x10
   1400094f2:	89 c1                	mov    ecx,eax
   1400094f4:	e8 af 01 00 00       	call   0x1400096a8
   1400094f9:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400094fd:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   140009500:	80 cc 80             	or     ah,0x80
   140009503:	89 c2                	mov    edx,eax
   140009505:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140009509:	89 50 18             	mov    DWORD PTR [rax+0x18],edx
   14000950c:	eb 15                	jmp    0x140009523
   14000950e:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140009512:	48 83 c0 30          	add    rax,0x30
   140009516:	48 89 c1             	mov    rcx,rax
   140009519:	48 8b 05 10 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d10]        # 0x140011230
   140009520:	ff d0                	call   rax
   140009522:	90                   	nop
   140009523:	90                   	nop
   140009524:	48 83 c4 20          	add    rsp,0x20
   140009528:	5d                   	pop    rbp
   140009529:	c3                   	ret
   14000952a:	55                   	push   rbp
   14000952b:	48 89 e5             	mov    rbp,rsp
   14000952e:	48 83 ec 20          	sub    rsp,0x20
   140009532:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   140009536:	b9 00 00 00 00       	mov    ecx,0x0
   14000953b:	e8 e0 00 00 00       	call   0x140009620
   140009540:	48 39 45 10          	cmp    QWORD PTR [rbp+0x10],rax
   140009544:	72 52                	jb     0x140009598
   140009546:	b9 13 00 00 00       	mov    ecx,0x13
   14000954b:	e8 d0 00 00 00       	call   0x140009620
   140009550:	48 3b 45 10          	cmp    rax,QWORD PTR [rbp+0x10]
   140009554:	72 42                	jb     0x140009598
   140009556:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000955a:	8b 40 18             	mov    eax,DWORD PTR [rax+0x18]
   14000955d:	80 e4 7f             	and    ah,0x7f
   140009560:	89 c2                	mov    edx,eax
   140009562:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   140009566:	89 50 18             	mov    DWORD PTR [rax+0x18],edx
   140009569:	b9 00 00 00 00       	mov    ecx,0x0
   14000956e:	e8 ad 00 00 00       	call   0x140009620
   140009573:	48 8b 55 10          	mov    rdx,QWORD PTR [rbp+0x10]
   140009577:	48 29 c2             	sub    rdx,rax
   14000957a:	48 c1 fa 04          	sar    rdx,0x4
   14000957e:	48 b8 ab aa aa aa aa 	movabs rax,0xaaaaaaaaaaaaaaab
   140009585:	aa aa aa 
   140009588:	48 0f af c2          	imul   rax,rdx
   14000958c:	83 c0 10             	add    eax,0x10
   14000958f:	89 c1                	mov    ecx,eax
   140009591:	e8 1a 01 00 00       	call   0x1400096b0
   140009596:	eb 15                	jmp    0x1400095ad
   140009598:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   14000959c:	48 83 c0 30          	add    rax,0x30
   1400095a0:	48 89 c1             	mov    rcx,rax
   1400095a3:	48 8b 05 be 7c 00 00 	mov    rax,QWORD PTR [rip+0x7cbe]        # 0x140011268
   1400095aa:	ff d0                	call   rax
   1400095ac:	90                   	nop
   1400095ad:	90                   	nop
   1400095ae:	48 83 c4 20          	add    rsp,0x20
   1400095b2:	5d                   	pop    rbp
   1400095b3:	c3                   	ret
   1400095b4:	90                   	nop
   1400095b5:	90                   	nop
   1400095b6:	90                   	nop
   1400095b7:	90                   	nop
   1400095b8:	90                   	nop
   1400095b9:	90                   	nop
   1400095ba:	90                   	nop
   1400095bb:	90                   	nop
   1400095bc:	90                   	nop
   1400095bd:	90                   	nop
   1400095be:	90                   	nop
   1400095bf:	90                   	nop
   1400095c0:	55                   	push   rbp
   1400095c1:	48 89 e5             	mov    rbp,rsp
   1400095c4:	48 83 ec 10          	sub    rsp,0x10
   1400095c8:	48 89 4d 10          	mov    QWORD PTR [rbp+0x10],rcx
   1400095cc:	48 8d 05 bd 75 00 00 	lea    rax,[rip+0x75bd]        # 0x140010b90
   1400095d3:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400095d7:	48 8b 45 10          	mov    rax,QWORD PTR [rbp+0x10]
   1400095db:	48 89 45 f0          	mov    QWORD PTR [rbp-0x10],rax
   1400095df:	48 8b 55 f0          	mov    rdx,QWORD PTR [rbp-0x10]
   1400095e3:	48 8b 45 f8          	mov    rax,QWORD PTR [rbp-0x8]
   1400095e7:	48 87 10             	xchg   QWORD PTR [rax],rdx
   1400095ea:	48 89 d0             	mov    rax,rdx
   1400095ed:	48 83 c4 10          	add    rsp,0x10
   1400095f1:	5d                   	pop    rbp
   1400095f2:	c3                   	ret
   1400095f3:	55                   	push   rbp
   1400095f4:	48 89 e5             	mov    rbp,rsp
   1400095f7:	48 8b 05 92 75 00 00 	mov    rax,QWORD PTR [rip+0x7592]        # 0x140010b90
   1400095fe:	5d                   	pop    rbp
   1400095ff:	c3                   	ret
   140009600:	55                   	push   rbp
   140009601:	48 89 e5             	mov    rbp,rsp
   140009604:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   140009607:	83 7d 10 01          	cmp    DWORD PTR [rbp+0x10],0x1
   14000960b:	75 07                	jne    0x140009614
   14000960d:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140009612:	eb 05                	jmp    0x140009619
   140009614:	b8 02 00 00 00       	mov    eax,0x2
   140009619:	5d                   	pop    rbp
   14000961a:	c3                   	ret
   14000961b:	90                   	nop
   14000961c:	90                   	nop
   14000961d:	90                   	nop
   14000961e:	90                   	nop
   14000961f:	90                   	nop
   140009620:	55                   	push   rbp
   140009621:	48 89 e5             	mov    rbp,rsp
   140009624:	48 83 ec 20          	sub    rsp,0x20
   140009628:	89 4d 10             	mov    DWORD PTR [rbp+0x10],ecx
   14000962b:	e8 40 00 00 00       	call   0x140009670
   140009630:	48 89 c1             	mov    rcx,rax
   140009633:	8b 55 10             	mov    edx,DWORD PTR [rbp+0x10]
   140009636:	48 89 d0             	mov    rax,rdx
   140009639:	48 01 c0             	add    rax,rax
   14000963c:	48 01 d0             	add    rax,rdx
   14000963f:	48 c1 e0 04          	shl    rax,0x4
   140009643:	48 01 c8             	add    rax,rcx
   140009646:	48 83 c4 20          	add    rsp,0x20
   14000964a:	5d                   	pop    rbp
   14000964b:	c3                   	ret
   14000964c:	90                   	nop
   14000964d:	90                   	nop
   14000964e:	90                   	nop
   14000964f:	90                   	nop
   140009650:	ff 25 62 7c 00 00    	jmp    QWORD PTR [rip+0x7c62]        # 0x1400112b8
   140009656:	90                   	nop
   140009657:	90                   	nop
   140009658:	ff 25 62 7c 00 00    	jmp    QWORD PTR [rip+0x7c62]        # 0x1400112c0
   14000965e:	90                   	nop
   14000965f:	90                   	nop
   140009660:	ff 25 62 7c 00 00    	jmp    QWORD PTR [rip+0x7c62]        # 0x1400112c8
   140009666:	90                   	nop
   140009667:	90                   	nop
   140009668:	ff 25 62 7c 00 00    	jmp    QWORD PTR [rip+0x7c62]        # 0x1400112d0
   14000966e:	90                   	nop
   14000966f:	90                   	nop
   140009670:	ff 25 6a 7c 00 00    	jmp    QWORD PTR [rip+0x7c6a]        # 0x1400112e0
   140009676:	90                   	nop
   140009677:	90                   	nop
   140009678:	ff 25 6a 7c 00 00    	jmp    QWORD PTR [rip+0x7c6a]        # 0x1400112e8
   14000967e:	90                   	nop
   14000967f:	90                   	nop
   140009680:	ff 25 6a 7c 00 00    	jmp    QWORD PTR [rip+0x7c6a]        # 0x1400112f0
   140009686:	90                   	nop
   140009687:	90                   	nop
   140009688:	ff 25 6a 7c 00 00    	jmp    QWORD PTR [rip+0x7c6a]        # 0x1400112f8
   14000968e:	90                   	nop
   14000968f:	90                   	nop
   140009690:	ff 25 6a 7c 00 00    	jmp    QWORD PTR [rip+0x7c6a]        # 0x140011300
   140009696:	90                   	nop
   140009697:	90                   	nop
   140009698:	ff 25 72 7c 00 00    	jmp    QWORD PTR [rip+0x7c72]        # 0x140011310
   14000969e:	90                   	nop
   14000969f:	90                   	nop
   1400096a0:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011320
   1400096a6:	90                   	nop
   1400096a7:	90                   	nop
   1400096a8:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011328
   1400096ae:	90                   	nop
   1400096af:	90                   	nop
   1400096b0:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011330
   1400096b6:	90                   	nop
   1400096b7:	90                   	nop
   1400096b8:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011338
   1400096be:	90                   	nop
   1400096bf:	90                   	nop
   1400096c0:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011340
   1400096c6:	90                   	nop
   1400096c7:	90                   	nop
   1400096c8:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011348
   1400096ce:	90                   	nop
   1400096cf:	90                   	nop
   1400096d0:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011350
   1400096d6:	90                   	nop
   1400096d7:	90                   	nop
   1400096d8:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011358
   1400096de:	90                   	nop
   1400096df:	90                   	nop
   1400096e0:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011360
   1400096e6:	90                   	nop
   1400096e7:	90                   	nop
   1400096e8:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011368
   1400096ee:	90                   	nop
   1400096ef:	90                   	nop
   1400096f0:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011370
   1400096f6:	90                   	nop
   1400096f7:	90                   	nop
   1400096f8:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011378
   1400096fe:	90                   	nop
   1400096ff:	90                   	nop
   140009700:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011380
   140009706:	90                   	nop
   140009707:	90                   	nop
   140009708:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011388
   14000970e:	90                   	nop
   14000970f:	90                   	nop
   140009710:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011390
   140009716:	90                   	nop
   140009717:	90                   	nop
   140009718:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011398
   14000971e:	90                   	nop
   14000971f:	90                   	nop
   140009720:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113a0
   140009726:	90                   	nop
   140009727:	90                   	nop
   140009728:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113a8
   14000972e:	90                   	nop
   14000972f:	90                   	nop
   140009730:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113b0
   140009736:	90                   	nop
   140009737:	90                   	nop
   140009738:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113b8
   14000973e:	90                   	nop
   14000973f:	90                   	nop
   140009740:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113c0
   140009746:	90                   	nop
   140009747:	90                   	nop
   140009748:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113c8
   14000974e:	90                   	nop
   14000974f:	90                   	nop
   140009750:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113d0
   140009756:	90                   	nop
   140009757:	90                   	nop
   140009758:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113d8
   14000975e:	90                   	nop
   14000975f:	90                   	nop
   140009760:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113e0
   140009766:	90                   	nop
   140009767:	90                   	nop
   140009768:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113e8
   14000976e:	90                   	nop
   14000976f:	90                   	nop
   140009770:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113f0
   140009776:	90                   	nop
   140009777:	90                   	nop
   140009778:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x1400113f8
   14000977e:	90                   	nop
   14000977f:	90                   	nop
   140009780:	ff 25 7a 7c 00 00    	jmp    QWORD PTR [rip+0x7c7a]        # 0x140011400
   140009786:	90                   	nop
   140009787:	90                   	nop
   140009788:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000978f:	00 
   140009790:	ff 25 12 7b 00 00    	jmp    QWORD PTR [rip+0x7b12]        # 0x1400112a8
   140009796:	90                   	nop
   140009797:	90                   	nop
   140009798:	ff 25 02 7b 00 00    	jmp    QWORD PTR [rip+0x7b02]        # 0x1400112a0
   14000979e:	90                   	nop
   14000979f:	90                   	nop
   1400097a0:	ff 25 f2 7a 00 00    	jmp    QWORD PTR [rip+0x7af2]        # 0x140011298
   1400097a6:	90                   	nop
   1400097a7:	90                   	nop
   1400097a8:	ff 25 e2 7a 00 00    	jmp    QWORD PTR [rip+0x7ae2]        # 0x140011290
   1400097ae:	90                   	nop
   1400097af:	90                   	nop
   1400097b0:	ff 25 d2 7a 00 00    	jmp    QWORD PTR [rip+0x7ad2]        # 0x140011288
   1400097b6:	90                   	nop
   1400097b7:	90                   	nop
   1400097b8:	ff 25 c2 7a 00 00    	jmp    QWORD PTR [rip+0x7ac2]        # 0x140011280
   1400097be:	90                   	nop
   1400097bf:	90                   	nop
   1400097c0:	ff 25 b2 7a 00 00    	jmp    QWORD PTR [rip+0x7ab2]        # 0x140011278
   1400097c6:	90                   	nop
   1400097c7:	90                   	nop
   1400097c8:	ff 25 a2 7a 00 00    	jmp    QWORD PTR [rip+0x7aa2]        # 0x140011270
   1400097ce:	90                   	nop
   1400097cf:	90                   	nop
   1400097d0:	ff 25 92 7a 00 00    	jmp    QWORD PTR [rip+0x7a92]        # 0x140011268
   1400097d6:	90                   	nop
   1400097d7:	90                   	nop
   1400097d8:	ff 25 82 7a 00 00    	jmp    QWORD PTR [rip+0x7a82]        # 0x140011260
   1400097de:	90                   	nop
   1400097df:	90                   	nop
   1400097e0:	ff 25 72 7a 00 00    	jmp    QWORD PTR [rip+0x7a72]        # 0x140011258
   1400097e6:	90                   	nop
   1400097e7:	90                   	nop
   1400097e8:	ff 25 62 7a 00 00    	jmp    QWORD PTR [rip+0x7a62]        # 0x140011250
   1400097ee:	90                   	nop
   1400097ef:	90                   	nop
   1400097f0:	ff 25 52 7a 00 00    	jmp    QWORD PTR [rip+0x7a52]        # 0x140011248
   1400097f6:	90                   	nop
   1400097f7:	90                   	nop
   1400097f8:	ff 25 42 7a 00 00    	jmp    QWORD PTR [rip+0x7a42]        # 0x140011240
   1400097fe:	90                   	nop
   1400097ff:	90                   	nop
   140009800:	ff 25 32 7a 00 00    	jmp    QWORD PTR [rip+0x7a32]        # 0x140011238
   140009806:	90                   	nop
   140009807:	90                   	nop
   140009808:	ff 25 22 7a 00 00    	jmp    QWORD PTR [rip+0x7a22]        # 0x140011230
   14000980e:	90                   	nop
   14000980f:	90                   	nop
   140009810:	ff 25 12 7a 00 00    	jmp    QWORD PTR [rip+0x7a12]        # 0x140011228
   140009816:	90                   	nop
   140009817:	90                   	nop
   140009818:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000981f:	00 
   140009820:	41 57                	push   r15
   140009822:	b8 68 f8 07 00       	mov    eax,0x7f868
   140009827:	41 56                	push   r14
   140009829:	41 55                	push   r13
   14000982b:	41 54                	push   r12
   14000982d:	55                   	push   rbp
   14000982e:	57                   	push   rdi
   14000982f:	56                   	push   rsi
   140009830:	53                   	push   rbx
   140009831:	e8 0a 97 ff ff       	call   0x140002f40
   140009836:	48 29 c4             	sub    rsp,rax
   140009839:	89 cb                	mov    ebx,ecx
   14000983b:	48 89 d6             	mov    rsi,rdx
   14000983e:	e8 24 81 ff ff       	call   0x140001967
   140009843:	83 fb 01             	cmp    ebx,0x1
   140009846:	0f 8e 4a 05 00 00    	jle    0x140009d96
   14000984c:	31 c0                	xor    eax,eax
   14000984e:	48 8d 7c 24 40       	lea    rdi,[rsp+0x40]
   140009853:	b9 08 fe 01 00       	mov    ecx,0x1fe08
   140009858:	83 fb 03             	cmp    ebx,0x3
   14000985b:	f3 ab                	rep stos DWORD PTR es:[rdi],eax
   14000985d:	48 8d 5c 24 40       	lea    rbx,[rsp+0x40]
   140009862:	75 1f                	jne    0x140009883
   140009864:	48 8b 4e 10          	mov    rcx,QWORD PTR [rsi+0x10]
   140009868:	48 8d 15 1c 18 00 00 	lea    rdx,[rip+0x181c]        # 0x14000b08b
   14000986f:	e8 dc fe ff ff       	call   0x140009750
   140009874:	85 c0                	test   eax,eax
   140009876:	75 0b                	jne    0x140009883
   140009878:	c7 84 24 5c f8 07 00 	mov    DWORD PTR [rsp+0x7f85c],0x1
   14000987f:	01 00 00 00 
   140009883:	48 8b 4e 08          	mov    rcx,QWORD PTR [rsi+0x8]
   140009887:	48 8d 15 05 18 00 00 	lea    rdx,[rip+0x1805]        # 0x14000b093
   14000988e:	e8 5d fe ff ff       	call   0x1400096f0
   140009893:	41 b8 04 00 00 00    	mov    r8d,0x4
   140009899:	ba 01 00 00 00       	mov    edx,0x1
   14000989e:	48 8d 4c 24 3c       	lea    rcx,[rsp+0x3c]
   1400098a3:	49 89 c1             	mov    r9,rax
   1400098a6:	48 89 c6             	mov    rsi,rax
   1400098a9:	e8 5a fe ff ff       	call   0x140009708
   1400098ae:	48 83 f8 04          	cmp    rax,0x4
   1400098b2:	75 1d                	jne    0x1400098d1
   1400098b4:	41 b8 04 00 00 00    	mov    r8d,0x4
   1400098ba:	48 8d 15 d5 17 00 00 	lea    rdx,[rip+0x17d5]        # 0x14000b096
   1400098c1:	48 8d 4c 24 3c       	lea    rcx,[rsp+0x3c]
   1400098c6:	e8 5d fe ff ff       	call   0x140009728
   1400098cb:	89 c7                	mov    edi,eax
   1400098cd:	85 c0                	test   eax,eax
   1400098cf:	74 2b                	je     0x1400098fc
   1400098d1:	b9 02 00 00 00       	mov    ecx,0x2
   1400098d6:	ff 15 44 08 00 00    	call   QWORD PTR [rip+0x844]        # 0x14000a120
   1400098dc:	4c 8d 05 b8 17 00 00 	lea    r8,[rip+0x17b8]        # 0x14000b09b
   1400098e3:	48 8d 15 bd 17 00 00 	lea    rdx,[rip+0x17bd]        # 0x14000b0a7
   1400098ea:	48 89 c1             	mov    rcx,rax
   1400098ed:	e8 8e 96 ff ff       	call   0x140002f80
   1400098f2:	b9 01 00 00 00       	mov    ecx,0x1
   1400098f7:	e8 dc fd ff ff       	call   0x1400096d8
   1400098fc:	48 89 f1             	mov    rcx,rsi
   1400098ff:	49 89 de             	mov    r14,rbx
   140009902:	45 31 ed             	xor    r13d,r13d
   140009905:	e8 de fd ff ff       	call   0x1400096e8
   14000990a:	48 89 f1             	mov    rcx,rsi
   14000990d:	88 44 24 40          	mov    BYTE PTR [rsp+0x40],al
   140009911:	e8 d2 fd ff ff       	call   0x1400096e8
   140009916:	48 89 f1             	mov    rcx,rsi
   140009919:	e8 ca fd ff ff       	call   0x1400096e8
   14000991e:	d0 e8                	shr    al,1
   140009920:	0f b6 c0             	movzx  eax,al
   140009923:	89 84 24 38 f8 07 00 	mov    DWORD PTR [rsp+0x7f838],eax
   14000992a:	44 3b ac 24 38 f8 07 	cmp    r13d,DWORD PTR [rsp+0x7f838]
   140009931:	00 
   140009932:	7d 65                	jge    0x140009999
   140009934:	45 31 ff             	xor    r15d,r15d
   140009937:	45 31 e4             	xor    r12d,r12d
   14000993a:	48 89 f1             	mov    rcx,rsi
   14000993d:	44 89 e5             	mov    ebp,r12d
   140009940:	e8 a3 fd ff ff       	call   0x1400096e8
   140009945:	83 f8 ff             	cmp    eax,0xffffffff
   140009948:	74 3c                	je     0x140009986
   14000994a:	41 83 ff 3e          	cmp    r15d,0x3e
   14000994e:	75 29                	jne    0x140009979
   140009950:	83 f8 3e             	cmp    eax,0x3e
   140009953:	75 24                	jne    0x140009979
   140009955:	49 63 c5             	movsxd rax,r13d
   140009958:	41 8d 6c 24 ff       	lea    ebp,[r12-0x1]
   14000995d:	48 69 c0 10 10 00 00 	imul   rax,rax,0x1010
   140009964:	48 63 d5             	movsxd rdx,ebp
   140009967:	48 8d 84 04 60 f8 07 	lea    rax,[rsp+rax*1+0x7f860]
   14000996e:	00 
   14000996f:	c6 84 02 e8 07 f8 ff 	mov    BYTE PTR [rdx+rax*1-0x7f818],0x0
   140009976:	00 
   140009977:	eb 0d                	jmp    0x140009986
   140009979:	49 ff c4             	inc    r12
   14000997c:	41 89 c7             	mov    r15d,eax
   14000997f:	43 88 44 26 07       	mov    BYTE PTR [r14+r12*1+0x7],al
   140009984:	eb b4                	jmp    0x14000993a
   140009986:	48 63 ed             	movsxd rbp,ebp
   140009989:	41 ff c5             	inc    r13d
   14000998c:	49 81 c6 10 10 00 00 	add    r14,0x1010
   140009993:	49 89 6e f8          	mov    QWORD PTR [r14-0x8],rbp
   140009997:	eb 91                	jmp    0x14000992a
   140009999:	b9 00 38 00 00       	mov    ecx,0x3800
   14000999e:	31 ed                	xor    ebp,ebp
   1400099a0:	41 bc 00 02 00 00    	mov    r12d,0x200
   1400099a6:	e8 75 fd ff ff       	call   0x140009720
   1400099ab:	48 89 84 24 40 f8 07 	mov    QWORD PTR [rsp+0x7f840],rax
   1400099b2:	00 
   1400099b3:	49 89 f1             	mov    r9,rsi
   1400099b6:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400099bc:	ba 02 00 00 00       	mov    edx,0x2
   1400099c1:	48 8d 4c 24 3a       	lea    rcx,[rsp+0x3a]
   1400099c6:	e8 3d fd ff ff       	call   0x140009708
   1400099cb:	48 ff c8             	dec    rax
   1400099ce:	0f 85 af 00 00 00    	jne    0x140009a83
   1400099d4:	4c 39 e5             	cmp    rbp,r12
   1400099d7:	72 1c                	jb     0x1400099f5
   1400099d9:	49 6b d4 38          	imul   rdx,r12,0x38
   1400099dd:	48 8b 8c 24 40 f8 07 	mov    rcx,QWORD PTR [rsp+0x7f840]
   1400099e4:	00 
   1400099e5:	4d 01 e4             	add    r12,r12
   1400099e8:	e8 53 fd ff ff       	call   0x140009740
   1400099ed:	48 89 84 24 40 f8 07 	mov    QWORD PTR [rsp+0x7f840],rax
   1400099f4:	00 
   1400099f5:	48 8d 0d 84 17 00 00 	lea    rcx,[rip+0x1784]        # 0x14000b180
   1400099fc:	44 0f b7 44 24 3a    	movzx  r8d,WORD PTR [rsp+0x3a]
   140009a02:	31 c0                	xor    eax,eax
   140009a04:	48 89 ca             	mov    rdx,rcx
   140009a07:	44 39 01             	cmp    DWORD PTR [rcx],r8d
   140009a0a:	75 09                	jne    0x140009a15
   140009a0c:	48 c1 e0 04          	shl    rax,0x4
   140009a10:	48 01 d0             	add    rax,rdx
   140009a13:	eb 0f                	jmp    0x140009a24
   140009a15:	48 ff c0             	inc    rax
   140009a18:	48 83 c1 10          	add    rcx,0x10
   140009a1c:	48 83 f8 0e          	cmp    rax,0xe
   140009a20:	75 e5                	jne    0x140009a07
   140009a22:	31 c0                	xor    eax,eax
   140009a24:	4c 6b fd 1c          	imul   r15,rbp,0x1c
   140009a28:	48 8b 94 24 40 f8 07 	mov    rdx,QWORD PTR [rsp+0x7f840]
   140009a2f:	00 
   140009a30:	31 c9                	xor    ecx,ecx
   140009a32:	4c 01 fa             	add    rdx,r15
   140009a35:	44 89 02             	mov    DWORD PTR [rdx],r8d
   140009a38:	48 85 c0             	test   rax,rax
   140009a3b:	74 03                	je     0x140009a40
   140009a3d:	8a 48 04             	mov    cl,BYTE PTR [rax+0x4]
   140009a40:	88 4a 04             	mov    BYTE PTR [rdx+0x4],cl
   140009a43:	45 31 f6             	xor    r14d,r14d
   140009a46:	48 8b 84 24 40 f8 07 	mov    rax,QWORD PTR [rsp+0x7f840]
   140009a4d:	00 
   140009a4e:	4c 01 f8             	add    rax,r15
   140009a51:	0f b6 50 04          	movzx  edx,BYTE PTR [rax+0x4]
   140009a55:	44 39 f2             	cmp    edx,r14d
   140009a58:	7e 21                	jle    0x140009a7b
   140009a5a:	4b 8d 14 36          	lea    rdx,[r14+r14*1]
   140009a5e:	49 89 f1             	mov    r9,rsi
   140009a61:	41 b8 01 00 00 00    	mov    r8d,0x1
   140009a67:	49 ff c6             	inc    r14
   140009a6a:	48 8d 4c 10 06       	lea    rcx,[rax+rdx*1+0x6]
   140009a6f:	ba 02 00 00 00       	mov    edx,0x2
   140009a74:	e8 8f fc ff ff       	call   0x140009708
   140009a79:	eb cb                	jmp    0x140009a46
   140009a7b:	48 ff c5             	inc    rbp
   140009a7e:	e9 30 ff ff ff       	jmp    0x1400099b3
   140009a83:	48 89 f1             	mov    rcx,rsi
   140009a86:	48 89 ac 24 48 f8 07 	mov    QWORD PTR [rsp+0x7f848],rbp
   140009a8d:	00 
   140009a8e:	4c 8d 25 5f 16 00 00 	lea    r12,[rip+0x165f]        # 0x14000b0f4
   140009a95:	e8 46 fc ff ff       	call   0x1400096e0
   140009a9a:	8b ac 24 58 f8 07 00 	mov    ebp,DWORD PTR [rsp+0x7f858]
   140009aa1:	85 ed                	test   ebp,ebp
   140009aa3:	0f 85 ec 00 00 00    	jne    0x140009b95
   140009aa9:	48 8b 94 24 50 f8 07 	mov    rdx,QWORD PTR [rsp+0x7f850]
   140009ab0:	00 
   140009ab1:	48 3b 94 24 48 f8 07 	cmp    rdx,QWORD PTR [rsp+0x7f848]
   140009ab8:	00 
   140009ab9:	0f 83 d6 00 00 00    	jae    0x140009b95
   140009abf:	48 8d 42 01          	lea    rax,[rdx+0x1]
   140009ac3:	48 6b d2 1c          	imul   rdx,rdx,0x1c
   140009ac7:	48 03 94 24 40 f8 07 	add    rdx,QWORD PTR [rsp+0x7f840]
   140009ace:	00 
   140009acf:	48 89 84 24 50 f8 07 	mov    QWORD PTR [rsp+0x7f850],rax
   140009ad6:	00 
   140009ad7:	83 7a 18 00          	cmp    DWORD PTR [rdx+0x18],0x0
   140009adb:	0f 84 93 00 00 00    	je     0x140009b74
   140009ae1:	83 bc 24 5c f8 07 00 	cmp    DWORD PTR [rsp+0x7f85c],0x0
   140009ae8:	00 
   140009ae9:	74 af                	je     0x140009a9a
   140009aeb:	8b b4 24 38 f8 07 00 	mov    esi,DWORD PTR [rsp+0x7f838]
   140009af2:	b9 02 00 00 00       	mov    ecx,0x2
   140009af7:	4c 8b 2d 22 06 00 00 	mov    r13,QWORD PTR [rip+0x622]        # 0x14000a120
   140009afe:	41 ff d5             	call   r13
   140009b01:	48 8d 15 b2 15 00 00 	lea    rdx,[rip+0x15b2]        # 0x14000b0ba
   140009b08:	41 89 f0             	mov    r8d,esi
   140009b0b:	48 89 c1             	mov    rcx,rax
   140009b0e:	48 89 de             	mov    rsi,rbx
   140009b11:	e8 6a 94 ff ff       	call   0x140002f80
   140009b16:	3b ac 24 38 f8 07 00 	cmp    ebp,DWORD PTR [rsp+0x7f838]
   140009b1d:	0f 8d 77 ff ff ff    	jge    0x140009a9a
   140009b23:	4c 8d 35 59 15 00 00 	lea    r14,[rip+0x1559]        # 0x14000b083
   140009b2a:	80 be 10 10 00 00 00 	cmp    BYTE PTR [rsi+0x1010],0x0
   140009b31:	74 07                	je     0x140009b3a
   140009b33:	4c 8d 35 42 15 00 00 	lea    r14,[rip+0x1542]        # 0x14000b07c
   140009b3a:	4c 8b be 08 10 00 00 	mov    r15,QWORD PTR [rsi+0x1008]
   140009b41:	b9 02 00 00 00       	mov    ecx,0x2
   140009b46:	41 ff d5             	call   r13
   140009b49:	4c 89 74 24 28       	mov    QWORD PTR [rsp+0x28],r14
   140009b4e:	4c 8d 4e 08          	lea    r9,[rsi+0x8]
   140009b52:	41 89 e8             	mov    r8d,ebp
   140009b55:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
   140009b5a:	48 8d 15 67 15 00 00 	lea    rdx,[rip+0x1567]        # 0x14000b0c8
   140009b61:	ff c5                	inc    ebp
   140009b63:	48 89 c1             	mov    rcx,rax
   140009b66:	48 81 c6 10 10 00 00 	add    rsi,0x1010
   140009b6d:	e8 0e 94 ff ff       	call   0x140002f80
   140009b72:	eb a2                	jmp    0x140009b16
   140009b74:	8b 02                	mov    eax,DWORD PTR [rdx]
   140009b76:	ff c8                	dec    eax
   140009b78:	83 f8 0c             	cmp    eax,0xc
   140009b7b:	0f 87 60 ff ff ff    	ja     0x140009ae1
   140009b81:	49 63 04 84          	movsxd rax,DWORD PTR [r12+rax*4]
   140009b85:	4c 01 e0             	add    rax,r12
   140009b88:	ff e0                	jmp    rax
   140009b8a:	c7 84 24 58 f8 07 00 	mov    DWORD PTR [rsp+0x7f858],0x1
   140009b91:	01 00 00 00 
   140009b95:	48 83 c3 08          	add    rbx,0x8
   140009b99:	31 f6                	xor    esi,esi
   140009b9b:	e9 c2 01 00 00       	jmp    0x140009d62
   140009ba0:	66 8b 72 06          	mov    si,WORD PTR [rdx+0x6]
   140009ba4:	89 f0                	mov    eax,esi
   140009ba6:	81 e6 ff 7f 00 00    	and    esi,0x7fff
   140009bac:	66 25 ff 7f          	and    ax,0x7fff
   140009bb0:	3b b4 24 38 f8 07 00 	cmp    esi,DWORD PTR [rsp+0x7f838]
   140009bb7:	0f 8d 24 ff ff ff    	jge    0x140009ae1
   140009bbd:	48 69 f6 10 10 00 00 	imul   rsi,rsi,0x1010
   140009bc4:	4c 8d ac 34 60 f8 07 	lea    r13,[rsp+rsi*1+0x7f860]
   140009bcb:	00 
   140009bcc:	80 bc 34 50 10 00 00 	cmp    BYTE PTR [rsp+rsi*1+0x1050],0x0
   140009bd3:	00 
   140009bd4:	0f 85 07 ff ff ff    	jne    0x140009ae1
   140009bda:	0f b7 c0             	movzx  eax,ax
   140009bdd:	48 8d 15 af 14 00 00 	lea    rdx,[rip+0x14af]        # 0x14000b093
   140009be4:	48 69 c0 10 10 00 00 	imul   rax,rax,0x1010
   140009beb:	4c 8d 7c 03 08       	lea    r15,[rbx+rax*1+0x8]
   140009bf0:	4c 89 f9             	mov    rcx,r15
   140009bf3:	e8 f8 fa ff ff       	call   0x1400096f0
   140009bf8:	49 89 c6             	mov    r14,rax
   140009bfb:	48 85 c0             	test   rax,rax
   140009bfe:	0f 84 dd fe ff ff    	je     0x140009ae1
   140009c04:	4c 89 f9             	mov    rcx,r15
   140009c07:	49 89 c1             	mov    r9,rax
   140009c0a:	41 b8 ff 0f 00 00    	mov    r8d,0xfff
   140009c10:	ba 01 00 00 00       	mov    edx,0x1
   140009c15:	e8 ee fa ff ff       	call   0x140009708
   140009c1a:	4c 89 f1             	mov    rcx,r14
   140009c1d:	c6 84 34 50 10 00 00 	mov    BYTE PTR [rsp+rsi*1+0x1050],0x1
   140009c24:	01 
   140009c25:	48 89 84 34 48 10 00 	mov    QWORD PTR [rsp+rsi*1+0x1048],rax
   140009c2c:	00 
   140009c2d:	41 c6 84 05 e8 07 f8 	mov    BYTE PTR [r13+rax*1-0x7f818],0x0
   140009c34:	ff 00 
   140009c36:	e8 a5 fa ff ff       	call   0x1400096e0
   140009c3b:	e9 a1 fe ff ff       	jmp    0x140009ae1
   140009c40:	66 8b 42 08          	mov    ax,WORD PTR [rdx+0x8]
   140009c44:	66 85 c0             	test   ax,ax
   140009c47:	0f 88 94 fe ff ff    	js     0x140009ae1
   140009c4d:	44 0f b7 e8          	movzx  r13d,ax
   140009c51:	4d 69 ed 10 10 00 00 	imul   r13,r13,0x1010
   140009c58:	42 80 bc 2c 50 10 00 	cmp    BYTE PTR [rsp+r13*1+0x1050],0x0
   140009c5f:	00 00 
   140009c61:	0f 85 7a fe ff ff    	jne    0x140009ae1
   140009c67:	0f b7 72 06          	movzx  esi,WORD PTR [rdx+0x6]
   140009c6b:	4a 8d 4c 2b 08       	lea    rcx,[rbx+r13*1+0x8]
   140009c70:	66 85 f6             	test   si,si
   140009c73:	79 1f                	jns    0x140009c94
   140009c75:	41 89 f1             	mov    r9d,esi
   140009c78:	4c 8d 05 e1 13 00 00 	lea    r8,[rip+0x13e1]        # 0x14000b060
   140009c7f:	ba 00 10 00 00       	mov    edx,0x1000
   140009c84:	41 81 e1 ff 7f 00 00 	and    r9d,0x7fff
   140009c8b:	e8 e0 bf ff ff       	call   0x140005c70
   140009c90:	48 98                	cdqe
   140009c92:	eb 23                	jmp    0x140009cb7
   140009c94:	0f b7 c6             	movzx  eax,si
   140009c97:	48 69 f6 10 10 00 00 	imul   rsi,rsi,0x1010
   140009c9e:	48 69 c0 10 10 00 00 	imul   rax,rax,0x1010
   140009ca5:	48 8d 54 03 08       	lea    rdx,[rbx+rax*1+0x8]
   140009caa:	e8 a9 fa ff ff       	call   0x140009758
   140009caf:	48 8b 84 34 48 10 00 	mov    rax,QWORD PTR [rsp+rsi*1+0x1048]
   140009cb6:	00 
   140009cb7:	4a 89 84 2c 48 10 00 	mov    QWORD PTR [rsp+r13*1+0x1048],rax
   140009cbe:	00 
   140009cbf:	e9 1d fe ff ff       	jmp    0x140009ae1
   140009cc4:	45 31 c0             	xor    r8d,r8d
   140009cc7:	eb 06                	jmp    0x140009ccf
   140009cc9:	41 b8 01 00 00 00    	mov    r8d,0x1
   140009ccf:	48 89 d9             	mov    rcx,rbx
   140009cd2:	e8 74 7a ff ff       	call   0x14000174b
   140009cd7:	e9 05 fe ff ff       	jmp    0x140009ae1
   140009cdc:	41 b8 06 00 00 00    	mov    r8d,0x6
   140009ce2:	eb 03                	jmp    0x140009ce7
   140009ce4:	45 31 c0             	xor    r8d,r8d
   140009ce7:	48 89 d9             	mov    rcx,rbx
   140009cea:	e8 00 7b ff ff       	call   0x1400017ef
   140009cef:	e9 ed fd ff ff       	jmp    0x140009ae1
   140009cf4:	41 b8 01 00 00 00    	mov    r8d,0x1
   140009cfa:	eb eb                	jmp    0x140009ce7
   140009cfc:	41 b8 03 00 00 00    	mov    r8d,0x3
   140009d02:	eb e3                	jmp    0x140009ce7
   140009d04:	41 b8 02 00 00 00    	mov    r8d,0x2
   140009d0a:	eb db                	jmp    0x140009ce7
   140009d0c:	41 b8 04 00 00 00    	mov    r8d,0x4
   140009d12:	eb d3                	jmp    0x140009ce7
   140009d14:	41 b8 05 00 00 00    	mov    r8d,0x5
   140009d1a:	eb cb                	jmp    0x140009ce7
   140009d1c:	0f b7 52 06          	movzx  edx,WORD PTR [rdx+0x6]
   140009d20:	66 85 d2             	test   dx,dx
   140009d23:	79 17                	jns    0x140009d3c
   140009d25:	81 e2 ff 7f 00 00    	and    edx,0x7fff
   140009d2b:	48 8d 0d b1 13 00 00 	lea    rcx,[rip+0x13b1]        # 0x14000b0e3
   140009d32:	e8 b9 be ff ff       	call   0x140005bf0
   140009d37:	e9 a5 fd ff ff       	jmp    0x140009ae1
   140009d3c:	0f b7 c2             	movzx  eax,dx
   140009d3f:	3b 84 24 38 f8 07 00 	cmp    eax,DWORD PTR [rsp+0x7f838]
   140009d46:	0f 8d 95 fd ff ff    	jge    0x140009ae1
   140009d4c:	48 69 d2 10 10 00 00 	imul   rdx,rdx,0x1010
   140009d53:	48 8d 4c 13 08       	lea    rcx,[rbx+rdx*1+0x8]
   140009d58:	e8 db f9 ff ff       	call   0x140009738
   140009d5d:	e9 7f fd ff ff       	jmp    0x140009ae1
   140009d62:	39 b4 24 38 f8 07 00 	cmp    DWORD PTR [rsp+0x7f838],esi
   140009d69:	7e 1c                	jle    0x140009d87
   140009d6b:	49 89 d8             	mov    r8,rbx
   140009d6e:	89 f2                	mov    edx,esi
   140009d70:	ff c6                	inc    esi
   140009d72:	48 81 c3 10 10 00 00 	add    rbx,0x1010
   140009d79:	48 8d 0d 67 13 00 00 	lea    rcx,[rip+0x1367]        # 0x14000b0e7
   140009d80:	e8 6b be ff ff       	call   0x140005bf0
   140009d85:	eb db                	jmp    0x140009d62
   140009d87:	48 8b 8c 24 40 f8 07 	mov    rcx,QWORD PTR [rsp+0x7f840]
   140009d8e:	00 
   140009d8f:	e8 7c f9 ff ff       	call   0x140009710
   140009d94:	eb 05                	jmp    0x140009d9b
   140009d96:	bf 01 00 00 00       	mov    edi,0x1
   140009d9b:	89 f8                	mov    eax,edi
   140009d9d:	48 81 c4 68 f8 07 00 	add    rsp,0x7f868
   140009da4:	5b                   	pop    rbx
   140009da5:	5e                   	pop    rsi
   140009da6:	5f                   	pop    rdi
   140009da7:	5d                   	pop    rbp
   140009da8:	41 5c                	pop    r12
   140009daa:	41 5d                	pop    r13
   140009dac:	41 5e                	pop    r14
   140009dae:	41 5f                	pop    r15
   140009db0:	c3                   	ret
   140009db1:	90                   	nop
   140009db2:	90                   	nop
   140009db3:	90                   	nop
   140009db4:	90                   	nop
   140009db5:	90                   	nop
   140009db6:	90                   	nop
   140009db7:	90                   	nop
   140009db8:	90                   	nop
   140009db9:	90                   	nop
   140009dba:	90                   	nop
   140009dbb:	90                   	nop
   140009dbc:	90                   	nop
   140009dbd:	90                   	nop
   140009dbe:	90                   	nop
   140009dbf:	90                   	nop
   140009dc0:	e9 5b 78 ff ff       	jmp    0x140001620
   140009dc5:	90                   	nop
   140009dc6:	90                   	nop
   140009dc7:	90                   	nop
   140009dc8:	90                   	nop
   140009dc9:	90                   	nop
   140009dca:	90                   	nop
   140009dcb:	90                   	nop
   140009dcc:	90                   	nop
   140009dcd:	90                   	nop
   140009dce:	90                   	nop
   140009dcf:	90                   	nop
