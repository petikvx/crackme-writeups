
analysis/live.bin:     file format binary


Disassembly of section .data:

0000000140001000 <.data+0x1000>:
   140001000:	c3                   	ret
   140001001:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001008:	00 00 00 00 
   14000100c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001010:	48 83 ec 28          	sub    rsp,0x28
   140001014:	48 8b 05 e5 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fe5]        # 0x140005000
   14000101b:	31 c9                	xor    ecx,ecx
   14000101d:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001023:	48 8b 05 e6 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fe6]        # 0x140005010
   14000102a:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   140001030:	48 8b 05 e9 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fe9]        # 0x140005020
   140001037:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000103d:	48 8b 05 6c 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f6c]        # 0x140004fb0
   140001044:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   140001049:	75 0f                	jne    0x14000105a
   14000104b:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   14000104f:	48 01 d0             	add    rax,rdx
   140001052:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   140001058:	74 66                	je     0x1400010c0
   14000105a:	48 8b 05 8f 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f8f]        # 0x140004ff0
   140001061:	89 0d a5 6f 00 00    	mov    DWORD PTR [rip+0x6fa5],ecx        # 0x14000800c
   140001067:	8b 00                	mov    eax,DWORD PTR [rax]
   140001069:	85 c0                	test   eax,eax
   14000106b:	74 43                	je     0x1400010b0
   14000106d:	b9 02 00 00 00       	mov    ecx,0x2
   140001072:	e8 e1 17 00 00       	call   0x140002858
   140001077:	e8 64 17 00 00       	call   0x1400027e0
   14000107c:	48 8b 15 3d 40 00 00 	mov    rdx,QWORD PTR [rip+0x403d]        # 0x1400050c0
   140001083:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001085:	89 10                	mov    DWORD PTR [rax],edx
   140001087:	e8 64 17 00 00       	call   0x1400027f0
   14000108c:	48 8b 15 0d 40 00 00 	mov    rdx,QWORD PTR [rip+0x400d]        # 0x1400050a0
   140001093:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001095:	89 10                	mov    DWORD PTR [rax],edx
   140001097:	e8 74 07 00 00       	call   0x140001810
   14000109c:	48 8b 05 bd 3e 00 00 	mov    rax,QWORD PTR [rip+0x3ebd]        # 0x140004f60
   1400010a3:	83 38 01             	cmp    DWORD PTR [rax],0x1
   1400010a6:	74 50                	je     0x1400010f8
   1400010a8:	31 c0                	xor    eax,eax
   1400010aa:	48 83 c4 28          	add    rsp,0x28
   1400010ae:	c3                   	ret
   1400010af:	90                   	nop
   1400010b0:	b9 01 00 00 00       	mov    ecx,0x1
   1400010b5:	e8 9e 17 00 00       	call   0x140002858
   1400010ba:	eb bb                	jmp    0x140001077
   1400010bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400010c0:	0f b7 50 18          	movzx  edx,WORD PTR [rax+0x18]
   1400010c4:	66 81 fa 0b 01       	cmp    dx,0x10b
   1400010c9:	74 45                	je     0x140001110
   1400010cb:	66 81 fa 0b 02       	cmp    dx,0x20b
   1400010d0:	75 88                	jne    0x14000105a
   1400010d2:	83 b8 84 00 00 00 0e 	cmp    DWORD PTR [rax+0x84],0xe
   1400010d9:	0f 86 7b ff ff ff    	jbe    0x14000105a
   1400010df:	8b 90 f8 00 00 00    	mov    edx,DWORD PTR [rax+0xf8]
   1400010e5:	31 c9                	xor    ecx,ecx
   1400010e7:	85 d2                	test   edx,edx
   1400010e9:	0f 95 c1             	setne  cl
   1400010ec:	e9 69 ff ff ff       	jmp    0x14000105a
   1400010f1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400010f8:	48 8b 0d e1 3f 00 00 	mov    rcx,QWORD PTR [rip+0x3fe1]        # 0x1400050e0
   1400010ff:	e8 7c 0e 00 00       	call   0x140001f80
   140001104:	31 c0                	xor    eax,eax
   140001106:	48 83 c4 28          	add    rsp,0x28
   14000110a:	c3                   	ret
   14000110b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001110:	83 78 74 0e          	cmp    DWORD PTR [rax+0x74],0xe
   140001114:	0f 86 40 ff ff ff    	jbe    0x14000105a
   14000111a:	44 8b 80 e8 00 00 00 	mov    r8d,DWORD PTR [rax+0xe8]
   140001121:	31 c9                	xor    ecx,ecx
   140001123:	45 85 c0             	test   r8d,r8d
   140001126:	0f 95 c1             	setne  cl
   140001129:	e9 2c ff ff ff       	jmp    0x14000105a
   14000112e:	66 90                	xchg   ax,ax
   140001130:	48 83 ec 38          	sub    rsp,0x38
   140001134:	48 8b 05 b5 3f 00 00 	mov    rax,QWORD PTR [rip+0x3fb5]        # 0x1400050f0
   14000113b:	4c 8d 05 d6 6e 00 00 	lea    r8,[rip+0x6ed6]        # 0x140008018
   140001142:	48 8d 15 d7 6e 00 00 	lea    rdx,[rip+0x6ed7]        # 0x140008020
   140001149:	48 8d 0d d8 6e 00 00 	lea    rcx,[rip+0x6ed8]        # 0x140008028
   140001150:	8b 00                	mov    eax,DWORD PTR [rax]
   140001152:	89 05 ac 6e 00 00    	mov    DWORD PTR [rip+0x6eac],eax        # 0x140008004
   140001158:	48 8b 05 51 3f 00 00 	mov    rax,QWORD PTR [rip+0x3f51]        # 0x1400050b0
   14000115f:	44 8b 08             	mov    r9d,DWORD PTR [rax]
   140001162:	48 8d 05 9b 6e 00 00 	lea    rax,[rip+0x6e9b]        # 0x140008004
   140001169:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000116e:	e8 d5 16 00 00       	call   0x140002848
   140001173:	90                   	nop
   140001174:	48 83 c4 38          	add    rsp,0x38
   140001178:	c3                   	ret
   140001179:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001180:	41 54                	push   r12
   140001182:	55                   	push   rbp
   140001183:	57                   	push   rdi
   140001184:	56                   	push   rsi
   140001185:	53                   	push   rbx
   140001186:	48 83 ec 20          	sub    rsp,0x20
   14000118a:	48 8b 1d af 3e 00 00 	mov    rbx,QWORD PTR [rip+0x3eaf]        # 0x140005040
   140001191:	31 ff                	xor    edi,edi
   140001193:	65 48 8b 04 25 30 00 	mov    rax,QWORD PTR gs:0x30
   14000119a:	00 00 
   14000119c:	48 8b 2d 11 90 00 00 	mov    rbp,QWORD PTR [rip+0x9011]        # 0x14000a1b4
   1400011a3:	48 8b 70 08          	mov    rsi,QWORD PTR [rax+0x8]
   1400011a7:	eb 17                	jmp    0x1400011c0
   1400011a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400011b0:	48 39 c6             	cmp    rsi,rax
   1400011b3:	0f 84 67 01 00 00    	je     0x140001320
   1400011b9:	b9 e8 03 00 00       	mov    ecx,0x3e8
   1400011be:	ff d5                	call   rbp
   1400011c0:	48 89 f8             	mov    rax,rdi
   1400011c3:	f0 48 0f b1 33       	lock cmpxchg QWORD PTR [rbx],rsi
   1400011c8:	48 85 c0             	test   rax,rax
   1400011cb:	75 e3                	jne    0x1400011b0
   1400011cd:	48 8b 35 7c 3e 00 00 	mov    rsi,QWORD PTR [rip+0x3e7c]        # 0x140005050
   1400011d4:	31 ff                	xor    edi,edi
   1400011d6:	8b 06                	mov    eax,DWORD PTR [rsi]
   1400011d8:	83 f8 01             	cmp    eax,0x1
   1400011db:	0f 84 56 01 00 00    	je     0x140001337
   1400011e1:	8b 06                	mov    eax,DWORD PTR [rsi]
   1400011e3:	85 c0                	test   eax,eax
   1400011e5:	0f 84 b5 01 00 00    	je     0x1400013a0
   1400011eb:	c7 05 13 6e 00 00 01 	mov    DWORD PTR [rip+0x6e13],0x1        # 0x140008008
   1400011f2:	00 00 00 
   1400011f5:	8b 06                	mov    eax,DWORD PTR [rsi]
   1400011f7:	83 f8 01             	cmp    eax,0x1
   1400011fa:	0f 84 4c 01 00 00    	je     0x14000134c
   140001200:	85 ff                	test   edi,edi
   140001202:	0f 84 65 01 00 00    	je     0x14000136d
   140001208:	48 8b 05 91 3d 00 00 	mov    rax,QWORD PTR [rip+0x3d91]        # 0x140004fa0
   14000120f:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140001212:	48 85 c0             	test   rax,rax
   140001215:	74 0c                	je     0x140001223
   140001217:	45 31 c0             	xor    r8d,r8d
   14000121a:	ba 02 00 00 00       	mov    edx,0x2
   14000121f:	31 c9                	xor    ecx,ecx
   140001221:	ff d0                	call   rax
   140001223:	e8 b8 09 00 00       	call   0x140001be0
   140001228:	48 8b 0d a1 3e 00 00 	mov    rcx,QWORD PTR [rip+0x3ea1]        # 0x1400050d0
   14000122f:	ff 15 77 8f 00 00    	call   QWORD PTR [rip+0x8f77]        # 0x14000a1ac
   140001235:	48 8b 15 f4 3d 00 00 	mov    rdx,QWORD PTR [rip+0x3df4]        # 0x140005030
   14000123c:	48 8d 0d bd fd ff ff 	lea    rcx,[rip+0xfffffffffffffdbd]        # 0x140001000
   140001243:	48 89 02             	mov    QWORD PTR [rdx],rax
   140001246:	e8 c5 15 00 00       	call   0x140002810
   14000124b:	e8 a0 07 00 00       	call   0x1400019f0
   140001250:	8b 1d d2 6d 00 00    	mov    ebx,DWORD PTR [rip+0x6dd2]        # 0x140008028
   140001256:	8d 7b 01             	lea    edi,[rbx+0x1]
   140001259:	48 63 ff             	movsxd rdi,edi
   14000125c:	48 c1 e7 03          	shl    rdi,0x3
   140001260:	48 89 f9             	mov    rcx,rdi
   140001263:	e8 60 16 00 00       	call   0x1400028c8
   140001268:	85 db                	test   ebx,ebx
   14000126a:	48 8b 2d af 6d 00 00 	mov    rbp,QWORD PTR [rip+0x6daf]        # 0x140008020
   140001271:	49 89 c4             	mov    r12,rax
   140001274:	0f 8e 46 01 00 00    	jle    0x1400013c0
   14000127a:	48 83 ef 08          	sub    rdi,0x8
   14000127e:	31 db                	xor    ebx,ebx
   140001280:	48 8b 4c 1d 00       	mov    rcx,QWORD PTR [rbp+rbx*1+0x0]
   140001285:	e8 5e 16 00 00       	call   0x1400028e8
   14000128a:	48 8d 70 01          	lea    rsi,[rax+0x1]
   14000128e:	48 89 f1             	mov    rcx,rsi
   140001291:	e8 32 16 00 00       	call   0x1400028c8
   140001296:	49 89 f0             	mov    r8,rsi
   140001299:	49 89 04 1c          	mov    QWORD PTR [r12+rbx*1],rax
   14000129d:	48 8b 54 1d 00       	mov    rdx,QWORD PTR [rbp+rbx*1+0x0]
   1400012a2:	48 89 c1             	mov    rcx,rax
   1400012a5:	48 83 c3 08          	add    rbx,0x8
   1400012a9:	e8 22 16 00 00       	call   0x1400028d0
   1400012ae:	48 39 df             	cmp    rdi,rbx
   1400012b1:	75 cd                	jne    0x140001280
   1400012b3:	4c 01 e7             	add    rdi,r12
   1400012b6:	48 c7 07 00 00 00 00 	mov    QWORD PTR [rdi],0x0
   1400012bd:	4c 89 25 5c 6d 00 00 	mov    QWORD PTR [rip+0x6d5c],r12        # 0x140008020
   1400012c4:	e8 27 05 00 00       	call   0x1400017f0
   1400012c9:	48 8b 05 f0 3c 00 00 	mov    rax,QWORD PTR [rip+0x3cf0]        # 0x140004fc0
   1400012d0:	4c 8b 05 41 6d 00 00 	mov    r8,QWORD PTR [rip+0x6d41]        # 0x140008018
   1400012d7:	8b 0d 4b 6d 00 00    	mov    ecx,DWORD PTR [rip+0x6d4b]        # 0x140008028
   1400012dd:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400012e0:	4c 89 00             	mov    QWORD PTR [rax],r8
   1400012e3:	48 8b 15 36 6d 00 00 	mov    rdx,QWORD PTR [rip+0x6d36]        # 0x140008020
   1400012ea:	e8 71 16 00 00       	call   0x140002960
   1400012ef:	8b 0d 17 6d 00 00    	mov    ecx,DWORD PTR [rip+0x6d17]        # 0x14000800c
   1400012f5:	89 05 15 6d 00 00    	mov    DWORD PTR [rip+0x6d15],eax        # 0x140008010
   1400012fb:	85 c9                	test   ecx,ecx
   1400012fd:	0f 84 c5 00 00 00    	je     0x1400013c8
   140001303:	8b 15 ff 6c 00 00    	mov    edx,DWORD PTR [rip+0x6cff]        # 0x140008008
   140001309:	85 d2                	test   edx,edx
   14000130b:	74 73                	je     0x140001380
   14000130d:	48 83 c4 20          	add    rsp,0x20
   140001311:	5b                   	pop    rbx
   140001312:	5e                   	pop    rsi
   140001313:	5f                   	pop    rdi
   140001314:	5d                   	pop    rbp
   140001315:	41 5c                	pop    r12
   140001317:	c3                   	ret
   140001318:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000131f:	00 
   140001320:	48 8b 35 29 3d 00 00 	mov    rsi,QWORD PTR [rip+0x3d29]        # 0x140005050
   140001327:	bf 01 00 00 00       	mov    edi,0x1
   14000132c:	8b 06                	mov    eax,DWORD PTR [rsi]
   14000132e:	83 f8 01             	cmp    eax,0x1
   140001331:	0f 85 aa fe ff ff    	jne    0x1400011e1
   140001337:	b9 1f 00 00 00       	mov    ecx,0x1f
   14000133c:	e8 27 15 00 00       	call   0x140002868
   140001341:	8b 06                	mov    eax,DWORD PTR [rsi]
   140001343:	83 f8 01             	cmp    eax,0x1
   140001346:	0f 85 b4 fe ff ff    	jne    0x140001200
   14000134c:	48 8b 15 1d 3d 00 00 	mov    rdx,QWORD PTR [rip+0x3d1d]        # 0x140005070
   140001353:	48 8b 0d 06 3d 00 00 	mov    rcx,QWORD PTR [rip+0x3d06]        # 0x140005060
   14000135a:	e8 19 15 00 00       	call   0x140002878
   14000135f:	85 ff                	test   edi,edi
   140001361:	c7 06 02 00 00 00    	mov    DWORD PTR [rsi],0x2
   140001367:	0f 85 9b fe ff ff    	jne    0x140001208
   14000136d:	31 c0                	xor    eax,eax
   14000136f:	48 87 03             	xchg   QWORD PTR [rbx],rax
   140001372:	e9 91 fe ff ff       	jmp    0x140001208
   140001377:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000137e:	00 00 
   140001380:	e8 eb 14 00 00       	call   0x140002870
   140001385:	8b 05 85 6c 00 00    	mov    eax,DWORD PTR [rip+0x6c85]        # 0x140008010
   14000138b:	48 83 c4 20          	add    rsp,0x20
   14000138f:	5b                   	pop    rbx
   140001390:	5e                   	pop    rsi
   140001391:	5f                   	pop    rdi
   140001392:	5d                   	pop    rbp
   140001393:	41 5c                	pop    r12
   140001395:	c3                   	ret
   140001396:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000139d:	00 00 00 
   1400013a0:	48 8b 15 e9 3c 00 00 	mov    rdx,QWORD PTR [rip+0x3ce9]        # 0x140005090
   1400013a7:	c7 06 01 00 00 00    	mov    DWORD PTR [rsi],0x1
   1400013ad:	48 8b 0d cc 3c 00 00 	mov    rcx,QWORD PTR [rip+0x3ccc]        # 0x140005080
   1400013b4:	e8 bf 14 00 00       	call   0x140002878
   1400013b9:	e9 37 fe ff ff       	jmp    0x1400011f5
   1400013be:	66 90                	xchg   ax,ax
   1400013c0:	48 89 c7             	mov    rdi,rax
   1400013c3:	e9 ee fe ff ff       	jmp    0x1400012b6
   1400013c8:	89 c1                	mov    ecx,eax
   1400013ca:	e8 c9 14 00 00       	call   0x140002898
   1400013cf:	90                   	nop
   1400013d0:	48 83 ec 28          	sub    rsp,0x28
   1400013d4:	48 8b 05 15 3c 00 00 	mov    rax,QWORD PTR [rip+0x3c15]        # 0x140004ff0
   1400013db:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400013e1:	e8 9a fd ff ff       	call   0x140001180
   1400013e6:	90                   	nop
   1400013e7:	90                   	nop
   1400013e8:	48 83 c4 28          	add    rsp,0x28
   1400013ec:	c3                   	ret
   1400013ed:	0f 1f 00             	nop    DWORD PTR [rax]
   1400013f0:	48 83 ec 28          	sub    rsp,0x28
   1400013f4:	48 8b 05 f5 3b 00 00 	mov    rax,QWORD PTR [rip+0x3bf5]        # 0x140004ff0
   1400013fb:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001401:	e8 7a fd ff ff       	call   0x140001180
   140001406:	90                   	nop
   140001407:	90                   	nop
   140001408:	48 83 c4 28          	add    rsp,0x28
   14000140c:	c3                   	ret
   14000140d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001410:	48 83 ec 28          	sub    rsp,0x28
   140001414:	e8 67 14 00 00       	call   0x140002880
   140001419:	48 83 f8 01          	cmp    rax,0x1
   14000141d:	19 c0                	sbb    eax,eax
   14000141f:	48 83 c4 28          	add    rsp,0x28
   140001423:	c3                   	ret
   140001424:	90                   	nop
   140001425:	90                   	nop
   140001426:	90                   	nop
   140001427:	90                   	nop
   140001428:	90                   	nop
   140001429:	90                   	nop
   14000142a:	90                   	nop
   14000142b:	90                   	nop
   14000142c:	90                   	nop
   14000142d:	90                   	nop
   14000142e:	90                   	nop
   14000142f:	90                   	nop
   140001430:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 0x140001440
   140001437:	e9 d4 ff ff ff       	jmp    0x140001410
   14000143c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001440:	c3                   	ret
   140001441:	90                   	nop
   140001442:	90                   	nop
   140001443:	90                   	nop
   140001444:	90                   	nop
   140001445:	90                   	nop
   140001446:	90                   	nop
   140001447:	90                   	nop
   140001448:	90                   	nop
   140001449:	90                   	nop
   14000144a:	90                   	nop
   14000144b:	90                   	nop
   14000144c:	90                   	nop
   14000144d:	90                   	nop
   14000144e:	90                   	nop
   14000144f:	90                   	nop
   140001450:	e9 db 5e 01 00       	jmp    0x140017330
   140001455:	31 c8                	xor    eax,ecx
   140001457:	69 c0 6b ca eb 85    	imul   eax,eax,0x85ebca6b
   14000145d:	89 c2                	mov    edx,eax
   14000145f:	c1 ea 0d             	shr    edx,0xd
   140001462:	31 c2                	xor    edx,eax
   140001464:	69 d2 35 ae b2 c2    	imul   edx,edx,0xc2b2ae35
   14000146a:	89 d0                	mov    eax,edx
   14000146c:	c1 e8 10             	shr    eax,0x10
   14000146f:	31 d0                	xor    eax,edx
   140001471:	c3                   	ret
   140001472:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001479:	00 00 00 00 
   14000147d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001480:	41 55                	push   r13
   140001482:	41 54                	push   r12
   140001484:	55                   	push   rbp
   140001485:	57                   	push   rdi
   140001486:	56                   	push   rsi
   140001487:	53                   	push   rbx
   140001488:	48 83 ec 48          	sub    rsp,0x48
   14000148c:	48 8d 2d 8d 36 00 00 	lea    rbp,[rip+0x368d]        # 0x140004b20
   140001493:	bf 00 09 3d 00       	mov    edi,0x3d0900
   140001498:	31 f6                	xor    esi,esi
   14000149a:	4c 8d 25 5f 2b 00 00 	lea    r12,[rip+0x2b5f]        # 0x140004000
   1400014a1:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   1400014a8:	00 00 
   1400014aa:	49 89 cd             	mov    r13,rcx
   1400014ad:	89 d3                	mov    ebx,edx
   1400014af:	48 c7 44 24 28 00 00 	mov    QWORD PTR [rsp+0x28],0x0
   1400014b6:	00 00 
   1400014b8:	48 c7 44 24 30 00 00 	mov    QWORD PTR [rsp+0x30],0x0
   1400014bf:	00 00 
   1400014c1:	48 c7 44 24 38 00 00 	mov    QWORD PTR [rsp+0x38],0x0
   1400014c8:	00 00 
   1400014ca:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400014d0:	89 d8                	mov    eax,ebx
   1400014d2:	4c 01 e8             	add    rax,r13
   1400014d5:	0f b6 50 01          	movzx  edx,BYTE PTR [rax+0x1]
   1400014d9:	8b 48 04             	mov    ecx,DWORD PTR [rax+0x4]
   1400014dc:	41 89 d0             	mov    r8d,edx
   1400014df:	0f b6 50 02          	movzx  edx,BYTE PTR [rax+0x2]
   1400014e3:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400014e6:	41 83 e0 07          	and    r8d,0x7
   1400014ea:	83 e2 07             	and    edx,0x7
   1400014ed:	80 7c 05 00 15       	cmp    BYTE PTR [rbp+rax*1+0x0],0x15
   1400014f2:	77 2c                	ja     0x140001520
   1400014f4:	0f b6 44 05 00       	movzx  eax,BYTE PTR [rbp+rax*1+0x0]
   1400014f9:	49 63 04 84          	movsxd rax,DWORD PTR [r12+rax*4]
   1400014fd:	4c 01 e0             	add    rax,r12
   140001500:	ff e0                	jmp    rax
   140001502:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001508:	40 84 f6             	test   sil,sil
   14000150b:	75 2b                	jne    0x140001538
   14000150d:	8d 5c 19 08          	lea    ebx,[rcx+rbx*1+0x8]
   140001511:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001518:	83 ef 01             	sub    edi,0x1
   14000151b:	75 b3                	jne    0x1400014d0
   14000151d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001520:	31 c0                	xor    eax,eax
   140001522:	eb 40                	jmp    0x140001564
   140001524:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001528:	44 89 c2             	mov    edx,r8d
   14000152b:	0f af 4c 94 20       	imul   ecx,DWORD PTR [rsp+rdx*4+0x20]
   140001530:	89 4c 94 20          	mov    DWORD PTR [rsp+rdx*4+0x20],ecx
   140001534:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001538:	83 c3 08             	add    ebx,0x8
   14000153b:	eb db                	jmp    0x140001518
   14000153d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001540:	44 89 c2             	mov    edx,r8d
   140001543:	01 4c 94 20          	add    DWORD PTR [rsp+rdx*4+0x20],ecx
   140001547:	eb ef                	jmp    0x140001538
   140001549:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001550:	44 89 c2             	mov    edx,r8d
   140001553:	31 4c 94 20          	xor    DWORD PTR [rsp+rdx*4+0x20],ecx
   140001557:	eb df                	jmp    0x140001538
   140001559:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001560:	8b 44 24 20          	mov    eax,DWORD PTR [rsp+0x20]
   140001564:	48 83 c4 48          	add    rsp,0x48
   140001568:	5b                   	pop    rbx
   140001569:	5e                   	pop    rsi
   14000156a:	5f                   	pop    rdi
   14000156b:	5d                   	pop    rbp
   14000156c:	41 5c                	pop    r12
   14000156e:	41 5d                	pop    r13
   140001570:	c3                   	ret
   140001571:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001578:	ba 00 10 00 00       	mov    edx,0x1000
   14000157d:	4c 89 e9             	mov    rcx,r13
   140001580:	e8 fb fe ff ff       	call   0x140001480
   140001585:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   140001589:	eb ad                	jmp    0x140001538
   14000158b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001590:	8b 4c 94 20          	mov    ecx,DWORD PTR [rsp+rdx*4+0x20]
   140001594:	e8 b7 fe ff ff       	call   0x140001450
   140001599:	44 89 c2             	mov    edx,r8d
   14000159c:	89 44 94 20          	mov    DWORD PTR [rsp+rdx*4+0x20],eax
   1400015a0:	eb 96                	jmp    0x140001538
   1400015a2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400015a8:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   1400015ac:	48 8d 15 cd 2a 00 00 	lea    rdx,[rip+0x2acd]        # 0x140004080
   1400015b3:	89 c1                	mov    ecx,eax
   1400015b5:	83 e1 0f             	and    ecx,0xf
   1400015b8:	44 8b 0c 8a          	mov    r9d,DWORD PTR [rdx+rcx*4]
   1400015bc:	69 c8 b9 79 37 9e    	imul   ecx,eax,0x9e3779b9
   1400015c2:	81 c1 7a 7a 7a 7a    	add    ecx,0x7a7a7a7a
   1400015c8:	33 0d 62 6a 00 00    	xor    ecx,DWORD PTR [rip+0x6a62]        # 0x140008030
   1400015ce:	e8 7d fe ff ff       	call   0x140001450
   1400015d3:	44 89 c2             	mov    edx,r8d
   1400015d6:	41 31 c1             	xor    r9d,eax
   1400015d9:	44 89 4c 94 20       	mov    DWORD PTR [rsp+rdx*4+0x20],r9d
   1400015de:	e9 55 ff ff ff       	jmp    0x140001538
   1400015e3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400015e8:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   1400015ec:	48 89 c1             	mov    rcx,rax
   1400015ef:	48 69 c0 c1 de 31 35 	imul   rax,rax,0x3531dec1
   1400015f6:	48 c1 e8 27          	shr    rax,0x27
   1400015fa:	69 c0 68 02 00 00    	imul   eax,eax,0x268
   140001600:	29 c1                	sub    ecx,eax
   140001602:	48 8d 05 b7 2a 00 00 	lea    rax,[rip+0x2ab7]        # 0x1400040c0
   140001609:	8b 04 88             	mov    eax,DWORD PTR [rax+rcx*4]
   14000160c:	42 89 44 84 20       	mov    DWORD PTR [rsp+r8*4+0x20],eax
   140001611:	e9 22 ff ff ff       	jmp    0x140001538
   140001616:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000161d:	00 00 00 
   140001620:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   140001624:	42 39 44 84 20       	cmp    DWORD PTR [rsp+r8*4+0x20],eax
   140001629:	40 0f 94 c6          	sete   sil
   14000162d:	e9 06 ff ff ff       	jmp    0x140001538
   140001632:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001638:	44 89 c2             	mov    edx,r8d
   14000163b:	39 4c 94 20          	cmp    DWORD PTR [rsp+rdx*4+0x20],ecx
   14000163f:	40 0f 94 c6          	sete   sil
   140001643:	e9 f0 fe ff ff       	jmp    0x140001538
   140001648:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000164f:	00 
   140001650:	44 89 c2             	mov    edx,r8d
   140001653:	d3 44 94 20          	rol    DWORD PTR [rsp+rdx*4+0x20],cl
   140001657:	e9 dc fe ff ff       	jmp    0x140001538
   14000165c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001660:	44 89 c2             	mov    edx,r8d
   140001663:	d3 6c 94 20          	shr    DWORD PTR [rsp+rdx*4+0x20],cl
   140001667:	e9 cc fe ff ff       	jmp    0x140001538
   14000166c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001670:	42 8b 44 84 20       	mov    eax,DWORD PTR [rsp+r8*4+0x20]
   140001675:	0f af 44 94 20       	imul   eax,DWORD PTR [rsp+rdx*4+0x20]
   14000167a:	42 89 44 84 20       	mov    DWORD PTR [rsp+r8*4+0x20],eax
   14000167f:	e9 b4 fe ff ff       	jmp    0x140001538
   140001684:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001688:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   14000168c:	42 01 44 84 20       	add    DWORD PTR [rsp+r8*4+0x20],eax
   140001691:	e9 a2 fe ff ff       	jmp    0x140001538
   140001696:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000169d:	00 00 00 
   1400016a0:	42 8b 44 84 20       	mov    eax,DWORD PTR [rsp+r8*4+0x20]
   1400016a5:	33 44 94 20          	xor    eax,DWORD PTR [rsp+rdx*4+0x20]
   1400016a9:	42 89 44 84 20       	mov    DWORD PTR [rsp+r8*4+0x20],eax
   1400016ae:	e9 85 fe ff ff       	jmp    0x140001538
   1400016b3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400016b8:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   1400016bc:	44 89 c2             	mov    edx,r8d
   1400016bf:	89 44 94 20          	mov    DWORD PTR [rsp+rdx*4+0x20],eax
   1400016c3:	e9 70 fe ff ff       	jmp    0x140001538
   1400016c8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400016cf:	00 
   1400016d0:	8b 4c 94 20          	mov    ecx,DWORD PTR [rsp+rdx*4+0x20]
   1400016d4:	44 89 c2             	mov    edx,r8d
   1400016d7:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   1400016db:	41 89 4c 05 00       	mov    DWORD PTR [r13+rax*1+0x0],ecx
   1400016e0:	e9 53 fe ff ff       	jmp    0x140001538
   1400016e5:	0f 1f 00             	nop    DWORD PTR [rax]
   1400016e8:	8b 44 94 20          	mov    eax,DWORD PTR [rsp+rdx*4+0x20]
   1400016ec:	41 8b 44 05 00       	mov    eax,DWORD PTR [r13+rax*1+0x0]
   1400016f1:	42 89 44 84 20       	mov    DWORD PTR [rsp+r8*4+0x20],eax
   1400016f6:	e9 3d fe ff ff       	jmp    0x140001538
   1400016fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001700:	44 89 c2             	mov    edx,r8d
   140001703:	89 4c 94 20          	mov    DWORD PTR [rsp+rdx*4+0x20],ecx
   140001707:	e9 2c fe ff ff       	jmp    0x140001538
   14000170c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001710:	e9 27 5c 01 00       	jmp    0x14001733c
   140001715:	31 c8                	xor    eax,ecx
   140001717:	69 c0 6d 3c 1b 2c    	imul   eax,eax,0x2c1b3c6d
   14000171d:	89 c2                	mov    edx,eax
   14000171f:	c1 ea 0c             	shr    edx,0xc
   140001722:	31 c2                	xor    edx,eax
   140001724:	69 d2 39 2d 7a 29    	imul   edx,edx,0x297a2d39
   14000172a:	89 d0                	mov    eax,edx
   14000172c:	c1 e8 0f             	shr    eax,0xf
   14000172f:	31 d0                	xor    eax,edx
   140001731:	c3                   	ret
   140001732:	90                   	nop
   140001733:	90                   	nop
   140001734:	90                   	nop
   140001735:	90                   	nop
   140001736:	90                   	nop
   140001737:	90                   	nop
   140001738:	90                   	nop
   140001739:	90                   	nop
   14000173a:	90                   	nop
   14000173b:	90                   	nop
   14000173c:	90                   	nop
   14000173d:	90                   	nop
   14000173e:	90                   	nop
   14000173f:	90                   	nop
   140001740:	48 83 ec 28          	sub    rsp,0x28
   140001744:	48 8b 05 b5 18 00 00 	mov    rax,QWORD PTR [rip+0x18b5]        # 0x140003000
   14000174b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000174e:	48 85 c0             	test   rax,rax
   140001751:	74 22                	je     0x140001775
   140001753:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001758:	ff d0                	call   rax
   14000175a:	48 8b 05 9f 18 00 00 	mov    rax,QWORD PTR [rip+0x189f]        # 0x140003000
   140001761:	48 8d 50 08          	lea    rdx,[rax+0x8]
   140001765:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140001769:	48 89 15 90 18 00 00 	mov    QWORD PTR [rip+0x1890],rdx        # 0x140003000
   140001770:	48 85 c0             	test   rax,rax
   140001773:	75 e3                	jne    0x140001758
   140001775:	48 83 c4 28          	add    rsp,0x28
   140001779:	c3                   	ret
   14000177a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140001780:	56                   	push   rsi
   140001781:	53                   	push   rbx
   140001782:	48 83 ec 28          	sub    rsp,0x28
   140001786:	48 8b 15 e3 37 00 00 	mov    rdx,QWORD PTR [rip+0x37e3]        # 0x140004f70
   14000178d:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   140001790:	83 f8 ff             	cmp    eax,0xffffffff
   140001793:	89 c1                	mov    ecx,eax
   140001795:	74 39                	je     0x1400017d0
   140001797:	85 c9                	test   ecx,ecx
   140001799:	74 20                	je     0x1400017bb
   14000179b:	89 c8                	mov    eax,ecx
   14000179d:	83 e9 01             	sub    ecx,0x1
   1400017a0:	48 8d 1c c2          	lea    rbx,[rdx+rax*8]
   1400017a4:	48 29 c8             	sub    rax,rcx
   1400017a7:	48 8d 74 c2 f8       	lea    rsi,[rdx+rax*8-0x8]
   1400017ac:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400017b0:	ff 13                	call   QWORD PTR [rbx]
   1400017b2:	48 83 eb 08          	sub    rbx,0x8
   1400017b6:	48 39 f3             	cmp    rbx,rsi
   1400017b9:	75 f5                	jne    0x1400017b0
   1400017bb:	48 8d 0d 7e ff ff ff 	lea    rcx,[rip+0xffffffffffffff7e]        # 0x140001740
   1400017c2:	48 83 c4 28          	add    rsp,0x28
   1400017c6:	5b                   	pop    rbx
   1400017c7:	5e                   	pop    rsi
   1400017c8:	e9 43 fc ff ff       	jmp    0x140001410
   1400017cd:	0f 1f 00             	nop    DWORD PTR [rax]
   1400017d0:	31 c0                	xor    eax,eax
   1400017d2:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400017d8:	44 8d 40 01          	lea    r8d,[rax+0x1]
   1400017dc:	89 c1                	mov    ecx,eax
   1400017de:	4a 83 3c c2 00       	cmp    QWORD PTR [rdx+r8*8],0x0
   1400017e3:	4c 89 c0             	mov    rax,r8
   1400017e6:	75 f0                	jne    0x1400017d8
   1400017e8:	eb ad                	jmp    0x140001797
   1400017ea:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   1400017f0:	8b 05 4a 68 00 00    	mov    eax,DWORD PTR [rip+0x684a]        # 0x140008040
   1400017f6:	85 c0                	test   eax,eax
   1400017f8:	74 06                	je     0x140001800
   1400017fa:	c3                   	ret
   1400017fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001800:	c7 05 36 68 00 00 01 	mov    DWORD PTR [rip+0x6836],0x1        # 0x140008040
   140001807:	00 00 00 
   14000180a:	e9 71 ff ff ff       	jmp    0x140001780
   14000180f:	90                   	nop
   140001810:	31 c0                	xor    eax,eax
   140001812:	c3                   	ret
   140001813:	90                   	nop
   140001814:	90                   	nop
   140001815:	90                   	nop
   140001816:	90                   	nop
   140001817:	90                   	nop
   140001818:	90                   	nop
   140001819:	90                   	nop
   14000181a:	90                   	nop
   14000181b:	90                   	nop
   14000181c:	90                   	nop
   14000181d:	90                   	nop
   14000181e:	90                   	nop
   14000181f:	90                   	nop
   140001820:	48 83 ec 28          	sub    rsp,0x28
   140001824:	83 fa 03             	cmp    edx,0x3
   140001827:	74 17                	je     0x140001840
   140001829:	85 d2                	test   edx,edx
   14000182b:	74 13                	je     0x140001840
   14000182d:	b8 01 00 00 00       	mov    eax,0x1
   140001832:	48 83 c4 28          	add    rsp,0x28
   140001836:	c3                   	ret
   140001837:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000183e:	00 00 
   140001840:	e8 5b 0a 00 00       	call   0x1400022a0
   140001845:	b8 01 00 00 00       	mov    eax,0x1
   14000184a:	48 83 c4 28          	add    rsp,0x28
   14000184e:	c3                   	ret
   14000184f:	90                   	nop
   140001850:	56                   	push   rsi
   140001851:	53                   	push   rbx
   140001852:	48 83 ec 28          	sub    rsp,0x28
   140001856:	48 8b 05 f3 36 00 00 	mov    rax,QWORD PTR [rip+0x36f3]        # 0x140004f50
   14000185d:	83 38 02             	cmp    DWORD PTR [rax],0x2
   140001860:	74 06                	je     0x140001868
   140001862:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   140001868:	83 fa 02             	cmp    edx,0x2
   14000186b:	74 13                	je     0x140001880
   14000186d:	83 fa 01             	cmp    edx,0x1
   140001870:	74 4e                	je     0x1400018c0
   140001872:	b8 01 00 00 00       	mov    eax,0x1
   140001877:	48 83 c4 28          	add    rsp,0x28
   14000187b:	5b                   	pop    rbx
   14000187c:	5e                   	pop    rsi
   14000187d:	c3                   	ret
   14000187e:	66 90                	xchg   ax,ax
   140001880:	48 8d 1d d1 97 00 00 	lea    rbx,[rip+0x97d1]        # 0x14000b058
   140001887:	48 8d 35 ca 97 00 00 	lea    rsi,[rip+0x97ca]        # 0x14000b058
   14000188e:	48 39 de             	cmp    rsi,rbx
   140001891:	74 df                	je     0x140001872
   140001893:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001898:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   14000189b:	48 85 c0             	test   rax,rax
   14000189e:	74 02                	je     0x1400018a2
   1400018a0:	ff d0                	call   rax
   1400018a2:	48 83 c3 08          	add    rbx,0x8
   1400018a6:	48 39 de             	cmp    rsi,rbx
   1400018a9:	75 ed                	jne    0x140001898
   1400018ab:	b8 01 00 00 00       	mov    eax,0x1
   1400018b0:	48 83 c4 28          	add    rsp,0x28
   1400018b4:	5b                   	pop    rbx
   1400018b5:	5e                   	pop    rsi
   1400018b6:	c3                   	ret
   1400018b7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400018be:	00 00 
   1400018c0:	e8 db 09 00 00       	call   0x1400022a0
   1400018c5:	b8 01 00 00 00       	mov    eax,0x1
   1400018ca:	48 83 c4 28          	add    rsp,0x28
   1400018ce:	5b                   	pop    rbx
   1400018cf:	5e                   	pop    rsi
   1400018d0:	c3                   	ret
   1400018d1:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400018d8:	00 00 00 00 
   1400018dc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400018e0:	31 c0                	xor    eax,eax
   1400018e2:	c3                   	ret
   1400018e3:	90                   	nop
   1400018e4:	90                   	nop
   1400018e5:	90                   	nop
   1400018e6:	90                   	nop
   1400018e7:	90                   	nop
   1400018e8:	90                   	nop
   1400018e9:	90                   	nop
   1400018ea:	90                   	nop
   1400018eb:	90                   	nop
   1400018ec:	90                   	nop
   1400018ed:	90                   	nop
   1400018ee:	90                   	nop
   1400018ef:	90                   	nop
   1400018f0:	56                   	push   rsi
   1400018f1:	53                   	push   rbx
   1400018f2:	48 83 ec 78          	sub    rsp,0x78
   1400018f6:	0f 29 74 24 40       	movaps XMMWORD PTR [rsp+0x40],xmm6
   1400018fb:	0f 29 7c 24 50       	movaps XMMWORD PTR [rsp+0x50],xmm7
   140001900:	44 0f 29 44 24 60    	movaps XMMWORD PTR [rsp+0x60],xmm8
   140001906:	83 39 06             	cmp    DWORD PTR [rcx],0x6
   140001909:	0f 87 cd 00 00 00    	ja     0x1400019dc
   14000190f:	8b 01                	mov    eax,DWORD PTR [rcx]
   140001911:	48 8d 15 8c 34 00 00 	lea    rdx,[rip+0x348c]        # 0x140004da4
   140001918:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   14000191c:	48 01 d0             	add    rax,rdx
   14000191f:	ff e0                	jmp    rax
   140001921:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001928:	48 8d 1d 70 33 00 00 	lea    rbx,[rip+0x3370]        # 0x140004c9f
   14000192f:	48 8b 71 08          	mov    rsi,QWORD PTR [rcx+0x8]
   140001933:	f2 44 0f 10 41 20    	movsd  xmm8,QWORD PTR [rcx+0x20]
   140001939:	f2 0f 10 79 18       	movsd  xmm7,QWORD PTR [rcx+0x18]
   14000193e:	f2 0f 10 71 10       	movsd  xmm6,QWORD PTR [rcx+0x10]
   140001943:	b9 02 00 00 00       	mov    ecx,0x2
   140001948:	e8 d3 0e 00 00       	call   0x140002820
   14000194d:	f2 44 0f 11 44 24 30 	movsd  QWORD PTR [rsp+0x30],xmm8
   140001954:	49 89 f1             	mov    r9,rsi
   140001957:	49 89 d8             	mov    r8,rbx
   14000195a:	f2 0f 11 7c 24 28    	movsd  QWORD PTR [rsp+0x28],xmm7
   140001960:	48 89 c1             	mov    rcx,rax
   140001963:	f2 0f 11 74 24 20    	movsd  QWORD PTR [rsp+0x20],xmm6
   140001969:	48 8d 15 08 34 00 00 	lea    rdx,[rip+0x3408]        # 0x140004d78
   140001970:	e8 3b 0f 00 00       	call   0x1400028b0
   140001975:	90                   	nop
   140001976:	0f 28 74 24 40       	movaps xmm6,XMMWORD PTR [rsp+0x40]
   14000197b:	31 c0                	xor    eax,eax
   14000197d:	0f 28 7c 24 50       	movaps xmm7,XMMWORD PTR [rsp+0x50]
   140001982:	44 0f 28 44 24 60    	movaps xmm8,XMMWORD PTR [rsp+0x60]
   140001988:	48 83 c4 78          	add    rsp,0x78
   14000198c:	5b                   	pop    rbx
   14000198d:	5e                   	pop    rsi
   14000198e:	c3                   	ret
   14000198f:	90                   	nop
   140001990:	48 8d 1d e9 32 00 00 	lea    rbx,[rip+0x32e9]        # 0x140004c80
   140001997:	eb 96                	jmp    0x14000192f
   140001999:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400019a0:	48 8d 1d 39 33 00 00 	lea    rbx,[rip+0x3339]        # 0x140004ce0
   1400019a7:	eb 86                	jmp    0x14000192f
   1400019a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400019b0:	48 8d 1d 09 33 00 00 	lea    rbx,[rip+0x3309]        # 0x140004cc0
   1400019b7:	e9 73 ff ff ff       	jmp    0x14000192f
   1400019bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400019c0:	48 8d 1d 69 33 00 00 	lea    rbx,[rip+0x3369]        # 0x140004d30
   1400019c7:	e9 63 ff ff ff       	jmp    0x14000192f
   1400019cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400019d0:	48 8d 1d 31 33 00 00 	lea    rbx,[rip+0x3331]        # 0x140004d08
   1400019d7:	e9 53 ff ff ff       	jmp    0x14000192f
   1400019dc:	48 8d 1d 83 33 00 00 	lea    rbx,[rip+0x3383]        # 0x140004d66
   1400019e3:	e9 47 ff ff ff       	jmp    0x14000192f
   1400019e8:	90                   	nop
   1400019e9:	90                   	nop
   1400019ea:	90                   	nop
   1400019eb:	90                   	nop
   1400019ec:	90                   	nop
   1400019ed:	90                   	nop
   1400019ee:	90                   	nop
   1400019ef:	90                   	nop
   1400019f0:	db e3                	fninit
   1400019f2:	c3                   	ret
   1400019f3:	90                   	nop
   1400019f4:	90                   	nop
   1400019f5:	90                   	nop
   1400019f6:	90                   	nop
   1400019f7:	90                   	nop
   1400019f8:	90                   	nop
   1400019f9:	90                   	nop
   1400019fa:	90                   	nop
   1400019fb:	90                   	nop
   1400019fc:	90                   	nop
   1400019fd:	90                   	nop
   1400019fe:	90                   	nop
   1400019ff:	90                   	nop
   140001a00:	56                   	push   rsi
   140001a01:	53                   	push   rbx
   140001a02:	48 83 ec 38          	sub    rsp,0x38
   140001a06:	48 8d 44 24 58       	lea    rax,[rsp+0x58]
   140001a0b:	48 89 cb             	mov    rbx,rcx
   140001a0e:	b9 02 00 00 00       	mov    ecx,0x2
   140001a13:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   140001a18:	4c 89 44 24 60       	mov    QWORD PTR [rsp+0x60],r8
   140001a1d:	4c 89 4c 24 68       	mov    QWORD PTR [rsp+0x68],r9
   140001a22:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140001a27:	e8 f4 0d 00 00       	call   0x140002820
   140001a2c:	41 b8 1b 00 00 00    	mov    r8d,0x1b
   140001a32:	ba 01 00 00 00       	mov    edx,0x1
   140001a37:	48 8d 0d 82 33 00 00 	lea    rcx,[rip+0x3382]        # 0x140004dc0
   140001a3e:	49 89 c1             	mov    r9,rax
   140001a41:	e8 7a 0e 00 00       	call   0x1400028c0
   140001a46:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   140001a4b:	b9 02 00 00 00       	mov    ecx,0x2
   140001a50:	e8 cb 0d 00 00       	call   0x140002820
   140001a55:	48 89 da             	mov    rdx,rbx
   140001a58:	48 89 c1             	mov    rcx,rax
   140001a5b:	49 89 f0             	mov    r8,rsi
   140001a5e:	e8 95 0e 00 00       	call   0x1400028f8
   140001a63:	e8 20 0e 00 00       	call   0x140002888
   140001a68:	90                   	nop
   140001a69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001a70:	57                   	push   rdi
   140001a71:	56                   	push   rsi
   140001a72:	53                   	push   rbx
   140001a73:	48 83 ec 50          	sub    rsp,0x50
   140001a77:	48 63 35 26 66 00 00 	movsxd rsi,DWORD PTR [rip+0x6626]        # 0x1400080a4
   140001a7e:	85 f6                	test   esi,esi
   140001a80:	48 89 cb             	mov    rbx,rcx
   140001a83:	0f 8e 17 01 00 00    	jle    0x140001ba0
   140001a89:	48 8b 05 18 66 00 00 	mov    rax,QWORD PTR [rip+0x6618]        # 0x1400080a8
   140001a90:	45 31 c9             	xor    r9d,r9d
   140001a93:	48 83 c0 18          	add    rax,0x18
   140001a97:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001a9e:	00 00 
   140001aa0:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   140001aa3:	4c 39 c3             	cmp    rbx,r8
   140001aa6:	72 13                	jb     0x140001abb
   140001aa8:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   140001aac:	8b 52 08             	mov    edx,DWORD PTR [rdx+0x8]
   140001aaf:	49 01 d0             	add    r8,rdx
   140001ab2:	4c 39 c3             	cmp    rbx,r8
   140001ab5:	0f 82 8a 00 00 00    	jb     0x140001b45
   140001abb:	41 83 c1 01          	add    r9d,0x1
   140001abf:	48 83 c0 28          	add    rax,0x28
   140001ac3:	41 39 f1             	cmp    r9d,esi
   140001ac6:	75 d8                	jne    0x140001aa0
   140001ac8:	48 89 d9             	mov    rcx,rbx
   140001acb:	e8 f0 09 00 00       	call   0x1400024c0
   140001ad0:	48 85 c0             	test   rax,rax
   140001ad3:	48 89 c7             	mov    rdi,rax
   140001ad6:	0f 84 e6 00 00 00    	je     0x140001bc2
   140001adc:	48 8b 05 c5 65 00 00 	mov    rax,QWORD PTR [rip+0x65c5]        # 0x1400080a8
   140001ae3:	48 8d 1c b6          	lea    rbx,[rsi+rsi*4]
   140001ae7:	48 c1 e3 03          	shl    rbx,0x3
   140001aeb:	48 01 d8             	add    rax,rbx
   140001aee:	48 89 78 20          	mov    QWORD PTR [rax+0x20],rdi
   140001af2:	c7 00 00 00 00 00    	mov    DWORD PTR [rax],0x0
   140001af8:	e8 03 0b 00 00       	call   0x140002600
   140001afd:	8b 57 0c             	mov    edx,DWORD PTR [rdi+0xc]
   140001b00:	41 b8 30 00 00 00    	mov    r8d,0x30
   140001b06:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
   140001b0a:	48 8b 05 97 65 00 00 	mov    rax,QWORD PTR [rip+0x6597]        # 0x1400080a8
   140001b11:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   140001b16:	48 89 4c 18 18       	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   140001b1b:	ff 15 ab 86 00 00    	call   QWORD PTR [rip+0x86ab]        # 0x14000a1cc
   140001b21:	48 85 c0             	test   rax,rax
   140001b24:	0f 84 7d 00 00 00    	je     0x140001ba7
   140001b2a:	8b 44 24 44          	mov    eax,DWORD PTR [rsp+0x44]
   140001b2e:	8d 50 c0             	lea    edx,[rax-0x40]
   140001b31:	83 e2 bf             	and    edx,0xffffffbf
   140001b34:	74 08                	je     0x140001b3e
   140001b36:	8d 50 fc             	lea    edx,[rax-0x4]
   140001b39:	83 e2 fb             	and    edx,0xfffffffb
   140001b3c:	75 12                	jne    0x140001b50
   140001b3e:	83 05 5f 65 00 00 01 	add    DWORD PTR [rip+0x655f],0x1        # 0x1400080a4
   140001b45:	48 83 c4 50          	add    rsp,0x50
   140001b49:	5b                   	pop    rbx
   140001b4a:	5e                   	pop    rsi
   140001b4b:	5f                   	pop    rdi
   140001b4c:	c3                   	ret
   140001b4d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001b50:	83 f8 02             	cmp    eax,0x2
   140001b53:	41 b8 40 00 00 00    	mov    r8d,0x40
   140001b59:	b8 04 00 00 00       	mov    eax,0x4
   140001b5e:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   140001b63:	44 0f 44 c0          	cmove  r8d,eax
   140001b67:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140001b6c:	48 03 1d 35 65 00 00 	add    rbx,QWORD PTR [rip+0x6535]        # 0x1400080a8
   140001b73:	49 89 d9             	mov    r9,rbx
   140001b76:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   140001b7a:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   140001b7e:	ff 15 40 86 00 00    	call   QWORD PTR [rip+0x8640]        # 0x14000a1c4
   140001b84:	85 c0                	test   eax,eax
   140001b86:	75 b6                	jne    0x140001b3e
   140001b88:	ff 15 fe 85 00 00    	call   QWORD PTR [rip+0x85fe]        # 0x14000a18c
   140001b8e:	48 8d 0d a3 32 00 00 	lea    rcx,[rip+0x32a3]        # 0x140004e38
   140001b95:	89 c2                	mov    edx,eax
   140001b97:	e8 64 fe ff ff       	call   0x140001a00
   140001b9c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001ba0:	31 f6                	xor    esi,esi
   140001ba2:	e9 21 ff ff ff       	jmp    0x140001ac8
   140001ba7:	48 8b 05 fa 64 00 00 	mov    rax,QWORD PTR [rip+0x64fa]        # 0x1400080a8
   140001bae:	48 8d 0d 4b 32 00 00 	lea    rcx,[rip+0x324b]        # 0x140004e00
   140001bb5:	8b 57 08             	mov    edx,DWORD PTR [rdi+0x8]
   140001bb8:	4c 8b 44 18 18       	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   140001bbd:	e8 3e fe ff ff       	call   0x140001a00
   140001bc2:	48 8d 0d 17 32 00 00 	lea    rcx,[rip+0x3217]        # 0x140004de0
   140001bc9:	48 89 da             	mov    rdx,rbx
   140001bcc:	e8 2f fe ff ff       	call   0x140001a00
   140001bd1:	90                   	nop
   140001bd2:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140001bd9:	00 00 00 00 
   140001bdd:	0f 1f 00             	nop    DWORD PTR [rax]
   140001be0:	55                   	push   rbp
   140001be1:	41 57                	push   r15
   140001be3:	41 56                	push   r14
   140001be5:	41 55                	push   r13
   140001be7:	41 54                	push   r12
   140001be9:	57                   	push   rdi
   140001bea:	56                   	push   rsi
   140001beb:	53                   	push   rbx
   140001bec:	48 83 ec 48          	sub    rsp,0x48
   140001bf0:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140001bf5:	8b 3d a5 64 00 00    	mov    edi,DWORD PTR [rip+0x64a5]        # 0x1400080a0
   140001bfb:	85 ff                	test   edi,edi
   140001bfd:	74 11                	je     0x140001c10
   140001bff:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   140001c03:	5b                   	pop    rbx
   140001c04:	5e                   	pop    rsi
   140001c05:	5f                   	pop    rdi
   140001c06:	41 5c                	pop    r12
   140001c08:	41 5d                	pop    r13
   140001c0a:	41 5e                	pop    r14
   140001c0c:	41 5f                	pop    r15
   140001c0e:	5d                   	pop    rbp
   140001c0f:	c3                   	ret
   140001c10:	c7 05 86 64 00 00 01 	mov    DWORD PTR [rip+0x6486],0x1        # 0x1400080a0
   140001c17:	00 00 00 
   140001c1a:	e8 21 09 00 00       	call   0x140002540
   140001c1f:	48 98                	cdqe
   140001c21:	48 8d 04 80          	lea    rax,[rax+rax*4]
   140001c25:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140001c2c:	00 
   140001c2d:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   140001c31:	e8 6a 0b 00 00       	call   0x1400027a0
   140001c36:	4c 8b 2d 43 33 00 00 	mov    r13,QWORD PTR [rip+0x3343]        # 0x140004f80
   140001c3d:	c7 05 5d 64 00 00 00 	mov    DWORD PTR [rip+0x645d],0x0        # 0x1400080a4
   140001c44:	00 00 00 
   140001c47:	48 8b 1d 42 33 00 00 	mov    rbx,QWORD PTR [rip+0x3342]        # 0x140004f90
   140001c4e:	48 29 c4             	sub    rsp,rax
   140001c51:	48 8d 44 24 30       	lea    rax,[rsp+0x30]
   140001c56:	48 89 05 4b 64 00 00 	mov    QWORD PTR [rip+0x644b],rax        # 0x1400080a8
   140001c5d:	4c 89 e8             	mov    rax,r13
   140001c60:	48 29 d8             	sub    rax,rbx
   140001c63:	48 83 f8 07          	cmp    rax,0x7
   140001c67:	7e 96                	jle    0x140001bff
   140001c69:	48 83 f8 0b          	cmp    rax,0xb
   140001c6d:	8b 13                	mov    edx,DWORD PTR [rbx]
   140001c6f:	0f 8f 83 01 00 00    	jg     0x140001df8
   140001c75:	8b 03                	mov    eax,DWORD PTR [rbx]
   140001c77:	85 c0                	test   eax,eax
   140001c79:	0f 85 71 02 00 00    	jne    0x140001ef0
   140001c7f:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140001c82:	85 c0                	test   eax,eax
   140001c84:	0f 85 66 02 00 00    	jne    0x140001ef0
   140001c8a:	8b 53 08             	mov    edx,DWORD PTR [rbx+0x8]
   140001c8d:	83 fa 01             	cmp    edx,0x1
   140001c90:	0f 85 9c 02 00 00    	jne    0x140001f32
   140001c96:	48 83 c3 0c          	add    rbx,0xc
   140001c9a:	4c 39 eb             	cmp    rbx,r13
   140001c9d:	0f 83 5c ff ff ff    	jae    0x140001bff
   140001ca3:	4c 8b 25 06 33 00 00 	mov    r12,QWORD PTR [rip+0x3306]        # 0x140004fb0
   140001caa:	49 bf ff ff ff 7f ff 	movabs r15,0xffffffff7fffffff
   140001cb1:	ff ff ff 
   140001cb4:	eb 5d                	jmp    0x140001d13
   140001cb6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140001cbd:	00 00 00 
   140001cc0:	41 0f b6 36          	movzx  esi,BYTE PTR [r14]
   140001cc4:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001cca:	40 84 f6             	test   sil,sil
   140001ccd:	0f 89 05 02 00 00    	jns    0x140001ed8
   140001cd3:	48 81 ce 00 ff ff ff 	or     rsi,0xffffffffffffff00
   140001cda:	48 29 c6             	sub    rsi,rax
   140001cdd:	4c 01 ce             	add    rsi,r9
   140001ce0:	85 c9                	test   ecx,ecx
   140001ce2:	75 17                	jne    0x140001cfb
   140001ce4:	48 81 fe ff 00 00 00 	cmp    rsi,0xff
   140001ceb:	0f 8f 4e 01 00 00    	jg     0x140001e3f
   140001cf1:	48 83 fe 80          	cmp    rsi,0xffffffffffffff80
   140001cf5:	0f 8c 44 01 00 00    	jl     0x140001e3f
   140001cfb:	4c 89 f1             	mov    rcx,r14
   140001cfe:	e8 6d fd ff ff       	call   0x140001a70
   140001d03:	41 88 36             	mov    BYTE PTR [r14],sil
   140001d06:	48 83 c3 0c          	add    rbx,0xc
   140001d0a:	4c 39 eb             	cmp    rbx,r13
   140001d0d:	0f 83 8d 00 00 00    	jae    0x140001da0
   140001d13:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   140001d16:	8b 03                	mov    eax,DWORD PTR [rbx]
   140001d18:	44 8b 43 04          	mov    r8d,DWORD PTR [rbx+0x4]
   140001d1c:	0f b6 d1             	movzx  edx,cl
   140001d1f:	4c 01 e0             	add    rax,r12
   140001d22:	83 fa 20             	cmp    edx,0x20
   140001d25:	4c 8b 08             	mov    r9,QWORD PTR [rax]
   140001d28:	4f 8d 34 20          	lea    r14,[r8+r12*1]
   140001d2c:	0f 84 26 01 00 00    	je     0x140001e58
   140001d32:	0f 87 e8 00 00 00    	ja     0x140001e20
   140001d38:	83 fa 08             	cmp    edx,0x8
   140001d3b:	74 83                	je     0x140001cc0
   140001d3d:	83 fa 10             	cmp    edx,0x10
   140001d40:	0f 85 e0 01 00 00    	jne    0x140001f26
   140001d46:	41 0f b7 36          	movzx  esi,WORD PTR [r14]
   140001d4a:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001d50:	66 85 f6             	test   si,si
   140001d53:	0f 89 67 01 00 00    	jns    0x140001ec0
   140001d59:	48 81 ce 00 00 ff ff 	or     rsi,0xffffffffffff0000
   140001d60:	48 29 c6             	sub    rsi,rax
   140001d63:	4c 01 ce             	add    rsi,r9
   140001d66:	85 c9                	test   ecx,ecx
   140001d68:	75 1a                	jne    0x140001d84
   140001d6a:	48 81 fe 00 80 ff ff 	cmp    rsi,0xffffffffffff8000
   140001d71:	0f 8c c8 00 00 00    	jl     0x140001e3f
   140001d77:	48 81 fe ff ff 00 00 	cmp    rsi,0xffff
   140001d7e:	0f 8f bb 00 00 00    	jg     0x140001e3f
   140001d84:	4c 89 f1             	mov    rcx,r14
   140001d87:	48 83 c3 0c          	add    rbx,0xc
   140001d8b:	e8 e0 fc ff ff       	call   0x140001a70
   140001d90:	4c 39 eb             	cmp    rbx,r13
   140001d93:	66 41 89 36          	mov    WORD PTR [r14],si
   140001d97:	0f 82 76 ff ff ff    	jb     0x140001d13
   140001d9d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001da0:	8b 15 fe 62 00 00    	mov    edx,DWORD PTR [rip+0x62fe]        # 0x1400080a4
   140001da6:	85 d2                	test   edx,edx
   140001da8:	0f 8e 51 fe ff ff    	jle    0x140001bff
   140001dae:	48 8b 35 0f 84 00 00 	mov    rsi,QWORD PTR [rip+0x840f]        # 0x14000a1c4
   140001db5:	4c 8d 65 fc          	lea    r12,[rbp-0x4]
   140001db9:	31 db                	xor    ebx,ebx
   140001dbb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001dc0:	48 8b 05 e1 62 00 00 	mov    rax,QWORD PTR [rip+0x62e1]        # 0x1400080a8
   140001dc7:	48 01 d8             	add    rax,rbx
   140001dca:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   140001dcd:	45 85 c0             	test   r8d,r8d
   140001dd0:	74 0d                	je     0x140001ddf
   140001dd2:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   140001dd6:	4d 89 e1             	mov    r9,r12
   140001dd9:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   140001ddd:	ff d6                	call   rsi
   140001ddf:	83 c7 01             	add    edi,0x1
   140001de2:	48 83 c3 28          	add    rbx,0x28
   140001de6:	3b 3d b8 62 00 00    	cmp    edi,DWORD PTR [rip+0x62b8]        # 0x1400080a4
   140001dec:	7c d2                	jl     0x140001dc0
   140001dee:	e9 0c fe ff ff       	jmp    0x140001bff
   140001df3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001df8:	85 d2                	test   edx,edx
   140001dfa:	0f 85 f0 00 00 00    	jne    0x140001ef0
   140001e00:	8b 43 04             	mov    eax,DWORD PTR [rbx+0x4]
   140001e03:	89 c2                	mov    edx,eax
   140001e05:	0b 53 08             	or     edx,DWORD PTR [rbx+0x8]
   140001e08:	0f 85 74 fe ff ff    	jne    0x140001c82
   140001e0e:	48 83 c3 0c          	add    rbx,0xc
   140001e12:	e9 5e fe ff ff       	jmp    0x140001c75
   140001e17:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140001e1e:	00 00 
   140001e20:	83 fa 40             	cmp    edx,0x40
   140001e23:	0f 85 fd 00 00 00    	jne    0x140001f26
   140001e29:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   140001e2c:	48 29 c6             	sub    rsi,rax
   140001e2f:	4c 01 ce             	add    rsi,r9
   140001e32:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001e38:	75 66                	jne    0x140001ea0
   140001e3a:	48 85 f6             	test   rsi,rsi
   140001e3d:	78 61                	js     0x140001ea0
   140001e3f:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   140001e44:	48 8d 0d 7d 30 00 00 	lea    rcx,[rip+0x307d]        # 0x140004ec8
   140001e4b:	4d 89 f0             	mov    r8,r14
   140001e4e:	e8 ad fb ff ff       	call   0x140001a00
   140001e53:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001e58:	41 8b 36             	mov    esi,DWORD PTR [r14]
   140001e5b:	81 e1 c0 00 00 00    	and    ecx,0xc0
   140001e61:	85 f6                	test   esi,esi
   140001e63:	79 4b                	jns    0x140001eb0
   140001e65:	49 bb 00 00 00 00 ff 	movabs r11,0xffffffff00000000
   140001e6c:	ff ff ff 
   140001e6f:	4c 09 de             	or     rsi,r11
   140001e72:	48 29 c6             	sub    rsi,rax
   140001e75:	4c 01 ce             	add    rsi,r9
   140001e78:	85 c9                	test   ecx,ecx
   140001e7a:	75 0f                	jne    0x140001e8b
   140001e7c:	4c 39 fe             	cmp    rsi,r15
   140001e7f:	7e be                	jle    0x140001e3f
   140001e81:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140001e86:	48 39 c6             	cmp    rsi,rax
   140001e89:	7f b4                	jg     0x140001e3f
   140001e8b:	4c 89 f1             	mov    rcx,r14
   140001e8e:	e8 dd fb ff ff       	call   0x140001a70
   140001e93:	41 89 36             	mov    DWORD PTR [r14],esi
   140001e96:	e9 6b fe ff ff       	jmp    0x140001d06
   140001e9b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001ea0:	4c 89 f1             	mov    rcx,r14
   140001ea3:	e8 c8 fb ff ff       	call   0x140001a70
   140001ea8:	49 89 36             	mov    QWORD PTR [r14],rsi
   140001eab:	e9 56 fe ff ff       	jmp    0x140001d06
   140001eb0:	48 29 c6             	sub    rsi,rax
   140001eb3:	4c 01 ce             	add    rsi,r9
   140001eb6:	85 c9                	test   ecx,ecx
   140001eb8:	74 c2                	je     0x140001e7c
   140001eba:	eb cf                	jmp    0x140001e8b
   140001ebc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140001ec0:	48 29 c6             	sub    rsi,rax
   140001ec3:	4c 01 ce             	add    rsi,r9
   140001ec6:	85 c9                	test   ecx,ecx
   140001ec8:	0f 84 9c fe ff ff    	je     0x140001d6a
   140001ece:	e9 b1 fe ff ff       	jmp    0x140001d84
   140001ed3:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001ed8:	48 29 c6             	sub    rsi,rax
   140001edb:	4c 01 ce             	add    rsi,r9
   140001ede:	85 c9                	test   ecx,ecx
   140001ee0:	0f 84 fe fd ff ff    	je     0x140001ce4
   140001ee6:	e9 10 fe ff ff       	jmp    0x140001cfb
   140001eeb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140001ef0:	4c 39 eb             	cmp    rbx,r13
   140001ef3:	0f 83 06 fd ff ff    	jae    0x140001bff
   140001ef9:	4c 8b 35 b0 30 00 00 	mov    r14,QWORD PTR [rip+0x30b0]        # 0x140004fb0
   140001f00:	8b 73 04             	mov    esi,DWORD PTR [rbx+0x4]
   140001f03:	48 83 c3 08          	add    rbx,0x8
   140001f07:	44 8b 63 f8          	mov    r12d,DWORD PTR [rbx-0x8]
   140001f0b:	4c 01 f6             	add    rsi,r14
   140001f0e:	44 03 26             	add    r12d,DWORD PTR [rsi]
   140001f11:	48 89 f1             	mov    rcx,rsi
   140001f14:	e8 57 fb ff ff       	call   0x140001a70
   140001f19:	4c 39 eb             	cmp    rbx,r13
   140001f1c:	44 89 26             	mov    DWORD PTR [rsi],r12d
   140001f1f:	72 df                	jb     0x140001f00
   140001f21:	e9 7a fe ff ff       	jmp    0x140001da0
   140001f26:	48 8d 0d 6b 2f 00 00 	lea    rcx,[rip+0x2f6b]        # 0x140004e98
   140001f2d:	e8 ce fa ff ff       	call   0x140001a00
   140001f32:	48 8d 0d 27 2f 00 00 	lea    rcx,[rip+0x2f27]        # 0x140004e60
   140001f39:	e8 c2 fa ff ff       	call   0x140001a00
   140001f3e:	90                   	nop
   140001f3f:	90                   	nop
   140001f40:	48 83 ec 58          	sub    rsp,0x58
   140001f44:	48 8b 05 65 61 00 00 	mov    rax,QWORD PTR [rip+0x6165]        # 0x1400080b0
   140001f4b:	48 85 c0             	test   rax,rax
   140001f4e:	66 0f 14 d3          	unpcklpd xmm2,xmm3
   140001f52:	74 25                	je     0x140001f79
   140001f54:	f2 0f 10 84 24 80 00 	movsd  xmm0,QWORD PTR [rsp+0x80]
   140001f5b:	00 00 
   140001f5d:	89 4c 24 20          	mov    DWORD PTR [rsp+0x20],ecx
   140001f61:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001f66:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   140001f6b:	0f 29 54 24 30       	movaps XMMWORD PTR [rsp+0x30],xmm2
   140001f70:	f2 0f 11 44 24 40    	movsd  QWORD PTR [rsp+0x40],xmm0
   140001f76:	ff d0                	call   rax
   140001f78:	90                   	nop
   140001f79:	48 83 c4 58          	add    rsp,0x58
   140001f7d:	c3                   	ret
   140001f7e:	66 90                	xchg   ax,ax
   140001f80:	48 89 0d 29 61 00 00 	mov    QWORD PTR [rip+0x6129],rcx        # 0x1400080b0
   140001f87:	e9 d4 08 00 00       	jmp    0x140002860
   140001f8c:	90                   	nop
   140001f8d:	90                   	nop
   140001f8e:	90                   	nop
   140001f8f:	90                   	nop
   140001f90:	53                   	push   rbx
   140001f91:	48 83 ec 20          	sub    rsp,0x20
   140001f95:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001f98:	8b 02                	mov    eax,DWORD PTR [rdx]
   140001f9a:	48 89 cb             	mov    rbx,rcx
   140001f9d:	89 c1                	mov    ecx,eax
   140001f9f:	81 e1 ff ff ff 20    	and    ecx,0x20ffffff
   140001fa5:	81 f9 43 43 47 20    	cmp    ecx,0x20474343
   140001fab:	0f 84 9f 00 00 00    	je     0x140002050
   140001fb1:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   140001fb6:	77 77                	ja     0x14000202f
   140001fb8:	3d 8b 00 00 c0       	cmp    eax,0xc000008b
   140001fbd:	76 21                	jbe    0x140001fe0
   140001fbf:	05 73 ff ff 3f       	add    eax,0x3fffff73
   140001fc4:	83 f8 09             	cmp    eax,0x9
   140001fc7:	77 54                	ja     0x14000201d
   140001fc9:	48 8d 15 50 2f 00 00 	lea    rdx,[rip+0x2f50]        # 0x140004f20
   140001fd0:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140001fd4:	48 01 d0             	add    rax,rdx
   140001fd7:	ff e0                	jmp    rax
   140001fd9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140001fe0:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   140001fe5:	0f 84 d5 00 00 00    	je     0x1400020c0
   140001feb:	76 3b                	jbe    0x140002028
   140001fed:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   140001ff2:	74 29                	je     0x14000201d
   140001ff4:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   140001ff9:	75 34                	jne    0x14000202f
   140001ffb:	31 d2                	xor    edx,edx
   140001ffd:	b9 04 00 00 00       	mov    ecx,0x4
   140002002:	e8 d9 08 00 00       	call   0x1400028e0
   140002007:	48 83 f8 01          	cmp    rax,0x1
   14000200b:	0f 84 d6 00 00 00    	je     0x1400020e7
   140002011:	48 85 c0             	test   rax,rax
   140002014:	74 19                	je     0x14000202f
   140002016:	b9 04 00 00 00       	mov    ecx,0x4
   14000201b:	ff d0                	call   rax
   14000201d:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140002022:	48 83 c4 20          	add    rsp,0x20
   140002026:	5b                   	pop    rbx
   140002027:	c3                   	ret
   140002028:	3d 02 00 00 80       	cmp    eax,0x80000002
   14000202d:	74 ee                	je     0x14000201d
   14000202f:	48 8b 05 9a 60 00 00 	mov    rax,QWORD PTR [rip+0x609a]        # 0x1400080d0
   140002036:	48 85 c0             	test   rax,rax
   140002039:	74 25                	je     0x140002060
   14000203b:	48 89 d9             	mov    rcx,rbx
   14000203e:	48 83 c4 20          	add    rsp,0x20
   140002042:	5b                   	pop    rbx
   140002043:	48 ff e0             	rex.W jmp rax
   140002046:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000204d:	00 00 00 
   140002050:	f6 42 04 01          	test   BYTE PTR [rdx+0x4],0x1
   140002054:	0f 85 57 ff ff ff    	jne    0x140001fb1
   14000205a:	eb c1                	jmp    0x14000201d
   14000205c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002060:	31 c0                	xor    eax,eax
   140002062:	48 83 c4 20          	add    rsp,0x20
   140002066:	5b                   	pop    rbx
   140002067:	c3                   	ret
   140002068:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000206f:	00 
   140002070:	31 d2                	xor    edx,edx
   140002072:	b9 08 00 00 00       	mov    ecx,0x8
   140002077:	e8 64 08 00 00       	call   0x1400028e0
   14000207c:	48 83 f8 01          	cmp    rax,0x1
   140002080:	0f 84 89 00 00 00    	je     0x14000210f
   140002086:	48 85 c0             	test   rax,rax
   140002089:	74 a4                	je     0x14000202f
   14000208b:	b9 08 00 00 00       	mov    ecx,0x8
   140002090:	ff d0                	call   rax
   140002092:	eb 89                	jmp    0x14000201d
   140002094:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002098:	31 d2                	xor    edx,edx
   14000209a:	b9 08 00 00 00       	mov    ecx,0x8
   14000209f:	e8 3c 08 00 00       	call   0x1400028e0
   1400020a4:	48 83 f8 01          	cmp    rax,0x1
   1400020a8:	75 dc                	jne    0x140002086
   1400020aa:	ba 01 00 00 00       	mov    edx,0x1
   1400020af:	b9 08 00 00 00       	mov    ecx,0x8
   1400020b4:	e8 27 08 00 00       	call   0x1400028e0
   1400020b9:	e9 5f ff ff ff       	jmp    0x14000201d
   1400020be:	66 90                	xchg   ax,ax
   1400020c0:	31 d2                	xor    edx,edx
   1400020c2:	b9 0b 00 00 00       	mov    ecx,0xb
   1400020c7:	e8 14 08 00 00       	call   0x1400028e0
   1400020cc:	48 83 f8 01          	cmp    rax,0x1
   1400020d0:	74 29                	je     0x1400020fb
   1400020d2:	48 85 c0             	test   rax,rax
   1400020d5:	0f 84 54 ff ff ff    	je     0x14000202f
   1400020db:	b9 0b 00 00 00       	mov    ecx,0xb
   1400020e0:	ff d0                	call   rax
   1400020e2:	e9 36 ff ff ff       	jmp    0x14000201d
   1400020e7:	ba 01 00 00 00       	mov    edx,0x1
   1400020ec:	b9 04 00 00 00       	mov    ecx,0x4
   1400020f1:	e8 ea 07 00 00       	call   0x1400028e0
   1400020f6:	e9 22 ff ff ff       	jmp    0x14000201d
   1400020fb:	ba 01 00 00 00       	mov    edx,0x1
   140002100:	b9 0b 00 00 00       	mov    ecx,0xb
   140002105:	e8 d6 07 00 00       	call   0x1400028e0
   14000210a:	e9 0e ff ff ff       	jmp    0x14000201d
   14000210f:	ba 01 00 00 00       	mov    edx,0x1
   140002114:	b9 08 00 00 00       	mov    ecx,0x8
   140002119:	e8 c2 07 00 00       	call   0x1400028e0
   14000211e:	e8 cd f8 ff ff       	call   0x1400019f0
   140002123:	e9 f5 fe ff ff       	jmp    0x14000201d
   140002128:	90                   	nop
   140002129:	90                   	nop
   14000212a:	90                   	nop
   14000212b:	90                   	nop
   14000212c:	90                   	nop
   14000212d:	90                   	nop
   14000212e:	90                   	nop
   14000212f:	90                   	nop
   140002130:	41 54                	push   r12
   140002132:	55                   	push   rbp
   140002133:	57                   	push   rdi
   140002134:	56                   	push   rsi
   140002135:	53                   	push   rbx
   140002136:	48 83 ec 20          	sub    rsp,0x20
   14000213a:	4c 8d 25 bf 5f 00 00 	lea    r12,[rip+0x5fbf]        # 0x140008100
   140002141:	4c 89 e1             	mov    rcx,r12
   140002144:	ff 15 3a 80 00 00    	call   QWORD PTR [rip+0x803a]        # 0x14000a184
   14000214a:	48 8b 1d 8f 5f 00 00 	mov    rbx,QWORD PTR [rip+0x5f8f]        # 0x1400080e0
   140002151:	48 85 db             	test   rbx,rbx
   140002154:	74 36                	je     0x14000218c
   140002156:	48 8b 2d 5f 80 00 00 	mov    rbp,QWORD PTR [rip+0x805f]        # 0x14000a1bc
   14000215d:	48 8b 3d 28 80 00 00 	mov    rdi,QWORD PTR [rip+0x8028]        # 0x14000a18c
   140002164:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002168:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   14000216a:	ff d5                	call   rbp
   14000216c:	48 89 c6             	mov    rsi,rax
   14000216f:	ff d7                	call   rdi
   140002171:	85 c0                	test   eax,eax
   140002173:	75 0e                	jne    0x140002183
   140002175:	48 85 f6             	test   rsi,rsi
   140002178:	74 09                	je     0x140002183
   14000217a:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   14000217e:	48 89 f1             	mov    rcx,rsi
   140002181:	ff d0                	call   rax
   140002183:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   140002187:	48 85 db             	test   rbx,rbx
   14000218a:	75 dc                	jne    0x140002168
   14000218c:	4c 89 e1             	mov    rcx,r12
   14000218f:	48 83 c4 20          	add    rsp,0x20
   140002193:	5b                   	pop    rbx
   140002194:	5e                   	pop    rsi
   140002195:	5f                   	pop    rdi
   140002196:	5d                   	pop    rbp
   140002197:	41 5c                	pop    r12
   140002199:	48 ff 25 04 80 00 00 	rex.W jmp QWORD PTR [rip+0x8004]        # 0x14000a1a4
   1400021a0:	57                   	push   rdi
   1400021a1:	56                   	push   rsi
   1400021a2:	53                   	push   rbx
   1400021a3:	48 83 ec 20          	sub    rsp,0x20
   1400021a7:	8b 05 3b 5f 00 00    	mov    eax,DWORD PTR [rip+0x5f3b]        # 0x1400080e8
   1400021ad:	85 c0                	test   eax,eax
   1400021af:	89 cf                	mov    edi,ecx
   1400021b1:	48 89 d6             	mov    rsi,rdx
   1400021b4:	75 0a                	jne    0x1400021c0
   1400021b6:	31 c0                	xor    eax,eax
   1400021b8:	48 83 c4 20          	add    rsp,0x20
   1400021bc:	5b                   	pop    rbx
   1400021bd:	5e                   	pop    rsi
   1400021be:	5f                   	pop    rdi
   1400021bf:	c3                   	ret
   1400021c0:	ba 18 00 00 00       	mov    edx,0x18
   1400021c5:	b9 01 00 00 00       	mov    ecx,0x1
   1400021ca:	e8 c1 06 00 00       	call   0x140002890
   1400021cf:	48 85 c0             	test   rax,rax
   1400021d2:	48 89 c3             	mov    rbx,rax
   1400021d5:	74 33                	je     0x14000220a
   1400021d7:	48 89 70 08          	mov    QWORD PTR [rax+0x8],rsi
   1400021db:	48 8d 35 1e 5f 00 00 	lea    rsi,[rip+0x5f1e]        # 0x140008100
   1400021e2:	89 38                	mov    DWORD PTR [rax],edi
   1400021e4:	48 89 f1             	mov    rcx,rsi
   1400021e7:	ff 15 97 7f 00 00    	call   QWORD PTR [rip+0x7f97]        # 0x14000a184
   1400021ed:	48 8b 05 ec 5e 00 00 	mov    rax,QWORD PTR [rip+0x5eec]        # 0x1400080e0
   1400021f4:	48 89 f1             	mov    rcx,rsi
   1400021f7:	48 89 1d e2 5e 00 00 	mov    QWORD PTR [rip+0x5ee2],rbx        # 0x1400080e0
   1400021fe:	48 89 43 10          	mov    QWORD PTR [rbx+0x10],rax
   140002202:	ff 15 9c 7f 00 00    	call   QWORD PTR [rip+0x7f9c]        # 0x14000a1a4
   140002208:	eb ac                	jmp    0x1400021b6
   14000220a:	83 c8 ff             	or     eax,0xffffffff
   14000220d:	eb a9                	jmp    0x1400021b8
   14000220f:	90                   	nop
   140002210:	56                   	push   rsi
   140002211:	53                   	push   rbx
   140002212:	48 83 ec 28          	sub    rsp,0x28
   140002216:	8b 05 cc 5e 00 00    	mov    eax,DWORD PTR [rip+0x5ecc]        # 0x1400080e8
   14000221c:	85 c0                	test   eax,eax
   14000221e:	89 cb                	mov    ebx,ecx
   140002220:	75 0e                	jne    0x140002230
   140002222:	31 c0                	xor    eax,eax
   140002224:	48 83 c4 28          	add    rsp,0x28
   140002228:	5b                   	pop    rbx
   140002229:	5e                   	pop    rsi
   14000222a:	c3                   	ret
   14000222b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002230:	48 8d 35 c9 5e 00 00 	lea    rsi,[rip+0x5ec9]        # 0x140008100
   140002237:	48 89 f1             	mov    rcx,rsi
   14000223a:	ff 15 44 7f 00 00    	call   QWORD PTR [rip+0x7f44]        # 0x14000a184
   140002240:	48 8b 0d 99 5e 00 00 	mov    rcx,QWORD PTR [rip+0x5e99]        # 0x1400080e0
   140002247:	48 85 c9             	test   rcx,rcx
   14000224a:	74 27                	je     0x140002273
   14000224c:	31 d2                	xor    edx,edx
   14000224e:	eb 0b                	jmp    0x14000225b
   140002250:	48 85 c0             	test   rax,rax
   140002253:	48 89 ca             	mov    rdx,rcx
   140002256:	74 1b                	je     0x140002273
   140002258:	48 89 c1             	mov    rcx,rax
   14000225b:	8b 01                	mov    eax,DWORD PTR [rcx]
   14000225d:	39 d8                	cmp    eax,ebx
   14000225f:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
   140002263:	75 eb                	jne    0x140002250
   140002265:	48 85 d2             	test   rdx,rdx
   140002268:	74 1e                	je     0x140002288
   14000226a:	48 89 42 10          	mov    QWORD PTR [rdx+0x10],rax
   14000226e:	e8 45 06 00 00       	call   0x1400028b8
   140002273:	48 89 f1             	mov    rcx,rsi
   140002276:	ff 15 28 7f 00 00    	call   QWORD PTR [rip+0x7f28]        # 0x14000a1a4
   14000227c:	31 c0                	xor    eax,eax
   14000227e:	48 83 c4 28          	add    rsp,0x28
   140002282:	5b                   	pop    rbx
   140002283:	5e                   	pop    rsi
   140002284:	c3                   	ret
   140002285:	0f 1f 00             	nop    DWORD PTR [rax]
   140002288:	48 89 05 51 5e 00 00 	mov    QWORD PTR [rip+0x5e51],rax        # 0x1400080e0
   14000228f:	eb dd                	jmp    0x14000226e
   140002291:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   140002298:	00 00 00 00 
   14000229c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400022a0:	53                   	push   rbx
   1400022a1:	48 83 ec 20          	sub    rsp,0x20
   1400022a5:	83 fa 02             	cmp    edx,0x2
   1400022a8:	0f 84 b2 00 00 00    	je     0x140002360
   1400022ae:	77 30                	ja     0x1400022e0
   1400022b0:	85 d2                	test   edx,edx
   1400022b2:	74 4c                	je     0x140002300
   1400022b4:	8b 05 2e 5e 00 00    	mov    eax,DWORD PTR [rip+0x5e2e]        # 0x1400080e8
   1400022ba:	85 c0                	test   eax,eax
   1400022bc:	0f 84 be 00 00 00    	je     0x140002380
   1400022c2:	c7 05 1c 5e 00 00 01 	mov    DWORD PTR [rip+0x5e1c],0x1        # 0x1400080e8
   1400022c9:	00 00 00 
   1400022cc:	b8 01 00 00 00       	mov    eax,0x1
   1400022d1:	48 83 c4 20          	add    rsp,0x20
   1400022d5:	5b                   	pop    rbx
   1400022d6:	c3                   	ret
   1400022d7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400022de:	00 00 
   1400022e0:	83 fa 03             	cmp    edx,0x3
   1400022e3:	75 e7                	jne    0x1400022cc
   1400022e5:	8b 05 fd 5d 00 00    	mov    eax,DWORD PTR [rip+0x5dfd]        # 0x1400080e8
   1400022eb:	85 c0                	test   eax,eax
   1400022ed:	74 dd                	je     0x1400022cc
   1400022ef:	e8 3c fe ff ff       	call   0x140002130
   1400022f4:	eb d6                	jmp    0x1400022cc
   1400022f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400022fd:	00 00 00 
   140002300:	8b 05 e2 5d 00 00    	mov    eax,DWORD PTR [rip+0x5de2]        # 0x1400080e8
   140002306:	85 c0                	test   eax,eax
   140002308:	75 66                	jne    0x140002370
   14000230a:	8b 05 d8 5d 00 00    	mov    eax,DWORD PTR [rip+0x5dd8]        # 0x1400080e8
   140002310:	83 f8 01             	cmp    eax,0x1
   140002313:	75 b7                	jne    0x1400022cc
   140002315:	48 8b 1d c4 5d 00 00 	mov    rbx,QWORD PTR [rip+0x5dc4]        # 0x1400080e0
   14000231c:	48 85 db             	test   rbx,rbx
   14000231f:	74 18                	je     0x140002339
   140002321:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002328:	48 89 d9             	mov    rcx,rbx
   14000232b:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   14000232f:	e8 84 05 00 00       	call   0x1400028b8
   140002334:	48 85 db             	test   rbx,rbx
   140002337:	75 ef                	jne    0x140002328
   140002339:	48 8d 0d c0 5d 00 00 	lea    rcx,[rip+0x5dc0]        # 0x140008100
   140002340:	48 c7 05 95 5d 00 00 	mov    QWORD PTR [rip+0x5d95],0x0        # 0x1400080e0
   140002347:	00 00 00 00 
   14000234b:	c7 05 93 5d 00 00 00 	mov    DWORD PTR [rip+0x5d93],0x0        # 0x1400080e8
   140002352:	00 00 00 
   140002355:	ff 15 21 7e 00 00    	call   QWORD PTR [rip+0x7e21]        # 0x14000a17c
   14000235b:	e9 6c ff ff ff       	jmp    0x1400022cc
   140002360:	e8 8b f6 ff ff       	call   0x1400019f0
   140002365:	b8 01 00 00 00       	mov    eax,0x1
   14000236a:	48 83 c4 20          	add    rsp,0x20
   14000236e:	5b                   	pop    rbx
   14000236f:	c3                   	ret
   140002370:	e8 bb fd ff ff       	call   0x140002130
   140002375:	eb 93                	jmp    0x14000230a
   140002377:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000237e:	00 00 
   140002380:	48 8d 0d 79 5d 00 00 	lea    rcx,[rip+0x5d79]        # 0x140008100
   140002387:	ff 15 07 7e 00 00    	call   QWORD PTR [rip+0x7e07]        # 0x14000a194
   14000238d:	e9 30 ff ff ff       	jmp    0x1400022c2
   140002392:	90                   	nop
   140002393:	90                   	nop
   140002394:	90                   	nop
   140002395:	90                   	nop
   140002396:	90                   	nop
   140002397:	90                   	nop
   140002398:	90                   	nop
   140002399:	90                   	nop
   14000239a:	90                   	nop
   14000239b:	90                   	nop
   14000239c:	90                   	nop
   14000239d:	90                   	nop
   14000239e:	90                   	nop
   14000239f:	90                   	nop
   1400023a0:	31 c0                	xor    eax,eax
   1400023a2:	66 81 39 4d 5a       	cmp    WORD PTR [rcx],0x5a4d
   1400023a7:	75 0f                	jne    0x1400023b8
   1400023a9:	48 63 51 3c          	movsxd rdx,DWORD PTR [rcx+0x3c]
   1400023ad:	48 01 d1             	add    rcx,rdx
   1400023b0:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   1400023b6:	74 08                	je     0x1400023c0
   1400023b8:	c3                   	ret
   1400023b9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400023c0:	31 c0                	xor    eax,eax
   1400023c2:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   1400023c8:	0f 94 c0             	sete   al
   1400023cb:	c3                   	ret
   1400023cc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400023d0:	48 63 41 3c          	movsxd rax,DWORD PTR [rcx+0x3c]
   1400023d4:	48 01 c1             	add    rcx,rax
   1400023d7:	44 0f b7 41 06       	movzx  r8d,WORD PTR [rcx+0x6]
   1400023dc:	0f b7 41 14          	movzx  eax,WORD PTR [rcx+0x14]
   1400023e0:	66 45 85 c0          	test   r8w,r8w
   1400023e4:	48 8d 44 01 18       	lea    rax,[rcx+rax*1+0x18]
   1400023e9:	74 32                	je     0x14000241d
   1400023eb:	41 8d 48 ff          	lea    ecx,[r8-0x1]
   1400023ef:	48 8d 0c 89          	lea    rcx,[rcx+rcx*4]
   1400023f3:	4c 8d 4c c8 28       	lea    r9,[rax+rcx*8+0x28]
   1400023f8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400023ff:	00 
   140002400:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002404:	4c 39 c2             	cmp    rdx,r8
   140002407:	4c 89 c1             	mov    rcx,r8
   14000240a:	72 08                	jb     0x140002414
   14000240c:	03 48 08             	add    ecx,DWORD PTR [rax+0x8]
   14000240f:	48 39 ca             	cmp    rdx,rcx
   140002412:	72 0b                	jb     0x14000241f
   140002414:	48 83 c0 28          	add    rax,0x28
   140002418:	4c 39 c8             	cmp    rax,r9
   14000241b:	75 e3                	jne    0x140002400
   14000241d:	31 c0                	xor    eax,eax
   14000241f:	c3                   	ret
   140002420:	57                   	push   rdi
   140002421:	56                   	push   rsi
   140002422:	53                   	push   rbx
   140002423:	48 83 ec 20          	sub    rsp,0x20
   140002427:	48 89 ce             	mov    rsi,rcx
   14000242a:	e8 b9 04 00 00       	call   0x1400028e8
   14000242f:	48 83 f8 08          	cmp    rax,0x8
   140002433:	77 7b                	ja     0x1400024b0
   140002435:	48 8b 15 74 2b 00 00 	mov    rdx,QWORD PTR [rip+0x2b74]        # 0x140004fb0
   14000243c:	31 db                	xor    ebx,ebx
   14000243e:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   140002443:	75 59                	jne    0x14000249e
   140002445:	48 63 42 3c          	movsxd rax,DWORD PTR [rdx+0x3c]
   140002449:	48 01 d0             	add    rax,rdx
   14000244c:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   140002452:	75 4a                	jne    0x14000249e
   140002454:	66 81 78 18 0b 02    	cmp    WORD PTR [rax+0x18],0x20b
   14000245a:	75 42                	jne    0x14000249e
   14000245c:	0f b7 50 14          	movzx  edx,WORD PTR [rax+0x14]
   140002460:	48 8d 5c 10 18       	lea    rbx,[rax+rdx*1+0x18]
   140002465:	0f b7 50 06          	movzx  edx,WORD PTR [rax+0x6]
   140002469:	66 85 d2             	test   dx,dx
   14000246c:	74 42                	je     0x1400024b0
   14000246e:	8d 42 ff             	lea    eax,[rdx-0x1]
   140002471:	48 8d 04 80          	lea    rax,[rax+rax*4]
   140002475:	48 8d 7c c3 28       	lea    rdi,[rbx+rax*8+0x28]
   14000247a:	eb 0d                	jmp    0x140002489
   14000247c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002480:	48 83 c3 28          	add    rbx,0x28
   140002484:	48 39 fb             	cmp    rbx,rdi
   140002487:	74 27                	je     0x1400024b0
   140002489:	41 b8 08 00 00 00    	mov    r8d,0x8
   14000248f:	48 89 f2             	mov    rdx,rsi
   140002492:	48 89 d9             	mov    rcx,rbx
   140002495:	e8 56 04 00 00       	call   0x1400028f0
   14000249a:	85 c0                	test   eax,eax
   14000249c:	75 e2                	jne    0x140002480
   14000249e:	48 89 d8             	mov    rax,rbx
   1400024a1:	48 83 c4 20          	add    rsp,0x20
   1400024a5:	5b                   	pop    rbx
   1400024a6:	5e                   	pop    rsi
   1400024a7:	5f                   	pop    rdi
   1400024a8:	c3                   	ret
   1400024a9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400024b0:	31 db                	xor    ebx,ebx
   1400024b2:	48 89 d8             	mov    rax,rbx
   1400024b5:	48 83 c4 20          	add    rsp,0x20
   1400024b9:	5b                   	pop    rbx
   1400024ba:	5e                   	pop    rsi
   1400024bb:	5f                   	pop    rdi
   1400024bc:	c3                   	ret
   1400024bd:	0f 1f 00             	nop    DWORD PTR [rax]
   1400024c0:	48 8b 15 e9 2a 00 00 	mov    rdx,QWORD PTR [rip+0x2ae9]        # 0x140004fb0
   1400024c7:	31 c0                	xor    eax,eax
   1400024c9:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   1400024ce:	75 10                	jne    0x1400024e0
   1400024d0:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   1400024d4:	49 01 d0             	add    r8,rdx
   1400024d7:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   1400024de:	74 08                	je     0x1400024e8
   1400024e0:	c3                   	ret
   1400024e1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400024e8:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   1400024ef:	75 ef                	jne    0x1400024e0
   1400024f1:	41 0f b7 40 14       	movzx  eax,WORD PTR [r8+0x14]
   1400024f6:	48 29 d1             	sub    rcx,rdx
   1400024f9:	49 8d 44 00 18       	lea    rax,[r8+rax*1+0x18]
   1400024fe:	45 0f b7 40 06       	movzx  r8d,WORD PTR [r8+0x6]
   140002503:	66 45 85 c0          	test   r8w,r8w
   140002507:	74 34                	je     0x14000253d
   140002509:	41 8d 50 ff          	lea    edx,[r8-0x1]
   14000250d:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   140002511:	4c 8d 4c d0 28       	lea    r9,[rax+rdx*8+0x28]
   140002516:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000251d:	00 00 00 
   140002520:	44 8b 40 0c          	mov    r8d,DWORD PTR [rax+0xc]
   140002524:	4c 39 c1             	cmp    rcx,r8
   140002527:	4c 89 c2             	mov    rdx,r8
   14000252a:	72 08                	jb     0x140002534
   14000252c:	03 50 08             	add    edx,DWORD PTR [rax+0x8]
   14000252f:	48 39 d1             	cmp    rcx,rdx
   140002532:	72 ac                	jb     0x1400024e0
   140002534:	48 83 c0 28          	add    rax,0x28
   140002538:	4c 39 c8             	cmp    rax,r9
   14000253b:	75 e3                	jne    0x140002520
   14000253d:	31 c0                	xor    eax,eax
   14000253f:	c3                   	ret
   140002540:	48 8b 05 69 2a 00 00 	mov    rax,QWORD PTR [rip+0x2a69]        # 0x140004fb0
   140002547:	31 c9                	xor    ecx,ecx
   140002549:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000254e:	75 0f                	jne    0x14000255f
   140002550:	48 63 50 3c          	movsxd rdx,DWORD PTR [rax+0x3c]
   140002554:	48 01 d0             	add    rax,rdx
   140002557:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   14000255d:	74 09                	je     0x140002568
   14000255f:	89 c8                	mov    eax,ecx
   140002561:	c3                   	ret
   140002562:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140002568:	66 81 78 18 0b 02    	cmp    WORD PTR [rax+0x18],0x20b
   14000256e:	75 ef                	jne    0x14000255f
   140002570:	0f b7 48 06          	movzx  ecx,WORD PTR [rax+0x6]
   140002574:	89 c8                	mov    eax,ecx
   140002576:	c3                   	ret
   140002577:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000257e:	00 00 
   140002580:	4c 8b 05 29 2a 00 00 	mov    r8,QWORD PTR [rip+0x2a29]        # 0x140004fb0
   140002587:	31 c0                	xor    eax,eax
   140002589:	66 41 81 38 4d 5a    	cmp    WORD PTR [r8],0x5a4d
   14000258f:	75 0f                	jne    0x1400025a0
   140002591:	49 63 50 3c          	movsxd rdx,DWORD PTR [r8+0x3c]
   140002595:	4c 01 c2             	add    rdx,r8
   140002598:	81 3a 50 45 00 00    	cmp    DWORD PTR [rdx],0x4550
   14000259e:	74 08                	je     0x1400025a8
   1400025a0:	c3                   	ret
   1400025a1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400025a8:	66 81 7a 18 0b 02    	cmp    WORD PTR [rdx+0x18],0x20b
   1400025ae:	75 f0                	jne    0x1400025a0
   1400025b0:	44 0f b7 42 06       	movzx  r8d,WORD PTR [rdx+0x6]
   1400025b5:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   1400025b9:	66 45 85 c0          	test   r8w,r8w
   1400025bd:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   1400025c2:	74 2c                	je     0x1400025f0
   1400025c4:	41 8d 50 ff          	lea    edx,[r8-0x1]
   1400025c8:	48 8d 14 92          	lea    rdx,[rdx+rdx*4]
   1400025cc:	48 8d 54 d0 28       	lea    rdx,[rax+rdx*8+0x28]
   1400025d1:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400025d8:	f6 40 27 20          	test   BYTE PTR [rax+0x27],0x20
   1400025dc:	74 09                	je     0x1400025e7
   1400025de:	48 85 c9             	test   rcx,rcx
   1400025e1:	74 bd                	je     0x1400025a0
   1400025e3:	48 83 e9 01          	sub    rcx,0x1
   1400025e7:	48 83 c0 28          	add    rax,0x28
   1400025eb:	48 39 d0             	cmp    rax,rdx
   1400025ee:	75 e8                	jne    0x1400025d8
   1400025f0:	31 c0                	xor    eax,eax
   1400025f2:	c3                   	ret
   1400025f3:	66 66 2e 0f 1f 84 00 	data16 cs nop WORD PTR [rax+rax*1+0x0]
   1400025fa:	00 00 00 00 
   1400025fe:	66 90                	xchg   ax,ax
   140002600:	48 8b 05 a9 29 00 00 	mov    rax,QWORD PTR [rip+0x29a9]        # 0x140004fb0
   140002607:	31 d2                	xor    edx,edx
   140002609:	66 81 38 4d 5a       	cmp    WORD PTR [rax],0x5a4d
   14000260e:	75 0f                	jne    0x14000261f
   140002610:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   140002614:	48 01 c1             	add    rcx,rax
   140002617:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   14000261d:	74 09                	je     0x140002628
   14000261f:	48 89 d0             	mov    rax,rdx
   140002622:	c3                   	ret
   140002623:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002628:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   14000262e:	48 0f 44 d0          	cmove  rdx,rax
   140002632:	48 89 d0             	mov    rax,rdx
   140002635:	c3                   	ret
   140002636:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000263d:	00 00 00 
   140002640:	48 8b 15 69 29 00 00 	mov    rdx,QWORD PTR [rip+0x2969]        # 0x140004fb0
   140002647:	31 c0                	xor    eax,eax
   140002649:	66 81 3a 4d 5a       	cmp    WORD PTR [rdx],0x5a4d
   14000264e:	75 10                	jne    0x140002660
   140002650:	4c 63 42 3c          	movsxd r8,DWORD PTR [rdx+0x3c]
   140002654:	49 01 d0             	add    r8,rdx
   140002657:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   14000265e:	74 08                	je     0x140002668
   140002660:	c3                   	ret
   140002661:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002668:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   14000266f:	75 ef                	jne    0x140002660
   140002671:	45 0f b7 48 06       	movzx  r9d,WORD PTR [r8+0x6]
   140002676:	48 29 d1             	sub    rcx,rdx
   140002679:	41 0f b7 50 14       	movzx  edx,WORD PTR [r8+0x14]
   14000267e:	66 45 85 c9          	test   r9w,r9w
   140002682:	49 8d 54 10 18       	lea    rdx,[r8+rdx*1+0x18]
   140002687:	74 d7                	je     0x140002660
   140002689:	41 8d 41 ff          	lea    eax,[r9-0x1]
   14000268d:	48 8d 04 80          	lea    rax,[rax+rax*4]
   140002691:	4c 8d 4c c2 28       	lea    r9,[rdx+rax*8+0x28]
   140002696:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000269d:	00 00 00 
   1400026a0:	44 8b 42 0c          	mov    r8d,DWORD PTR [rdx+0xc]
   1400026a4:	4c 39 c1             	cmp    rcx,r8
   1400026a7:	4c 89 c0             	mov    rax,r8
   1400026aa:	72 08                	jb     0x1400026b4
   1400026ac:	03 42 08             	add    eax,DWORD PTR [rdx+0x8]
   1400026af:	48 39 c1             	cmp    rcx,rax
   1400026b2:	72 0c                	jb     0x1400026c0
   1400026b4:	48 83 c2 28          	add    rdx,0x28
   1400026b8:	49 39 d1             	cmp    r9,rdx
   1400026bb:	75 e3                	jne    0x1400026a0
   1400026bd:	31 c0                	xor    eax,eax
   1400026bf:	c3                   	ret
   1400026c0:	8b 42 24             	mov    eax,DWORD PTR [rdx+0x24]
   1400026c3:	f7 d0                	not    eax
   1400026c5:	c1 e8 1f             	shr    eax,0x1f
   1400026c8:	c3                   	ret
   1400026c9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400026d0:	4c 8b 1d d9 28 00 00 	mov    r11,QWORD PTR [rip+0x28d9]        # 0x140004fb0
   1400026d7:	45 31 c9             	xor    r9d,r9d
   1400026da:	66 41 81 3b 4d 5a    	cmp    WORD PTR [r11],0x5a4d
   1400026e0:	75 10                	jne    0x1400026f2
   1400026e2:	4d 63 43 3c          	movsxd r8,DWORD PTR [r11+0x3c]
   1400026e6:	4d 01 d8             	add    r8,r11
   1400026e9:	41 81 38 50 45 00 00 	cmp    DWORD PTR [r8],0x4550
   1400026f0:	74 0e                	je     0x140002700
   1400026f2:	4c 89 c8             	mov    rax,r9
   1400026f5:	c3                   	ret
   1400026f6:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   1400026fd:	00 00 00 
   140002700:	66 41 81 78 18 0b 02 	cmp    WORD PTR [r8+0x18],0x20b
   140002707:	75 e9                	jne    0x1400026f2
   140002709:	41 8b 80 90 00 00 00 	mov    eax,DWORD PTR [r8+0x90]
   140002710:	85 c0                	test   eax,eax
   140002712:	74 de                	je     0x1400026f2
   140002714:	45 0f b7 50 06       	movzx  r10d,WORD PTR [r8+0x6]
   140002719:	41 0f b7 50 14       	movzx  edx,WORD PTR [r8+0x14]
   14000271e:	66 45 85 d2          	test   r10w,r10w
   140002722:	49 8d 54 10 18       	lea    rdx,[r8+rdx*1+0x18]
   140002727:	74 c9                	je     0x1400026f2
   140002729:	45 8d 42 ff          	lea    r8d,[r10-0x1]
   14000272d:	4f 8d 04 80          	lea    r8,[r8+r8*4]
   140002731:	4e 8d 54 c2 28       	lea    r10,[rdx+r8*8+0x28]
   140002736:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   14000273d:	00 00 00 
   140002740:	44 8b 4a 0c          	mov    r9d,DWORD PTR [rdx+0xc]
   140002744:	4c 39 c8             	cmp    rax,r9
   140002747:	4d 89 c8             	mov    r8,r9
   14000274a:	72 09                	jb     0x140002755
   14000274c:	44 03 42 08          	add    r8d,DWORD PTR [rdx+0x8]
   140002750:	4c 39 c0             	cmp    rax,r8
   140002753:	72 13                	jb     0x140002768
   140002755:	48 83 c2 28          	add    rdx,0x28
   140002759:	4c 39 d2             	cmp    rdx,r10
   14000275c:	75 e2                	jne    0x140002740
   14000275e:	45 31 c9             	xor    r9d,r9d
   140002761:	4c 89 c8             	mov    rax,r9
   140002764:	c3                   	ret
   140002765:	0f 1f 00             	nop    DWORD PTR [rax]
   140002768:	4c 01 d8             	add    rax,r11
   14000276b:	eb 0a                	jmp    0x140002777
   14000276d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002770:	83 e9 01             	sub    ecx,0x1
   140002773:	48 83 c0 14          	add    rax,0x14
   140002777:	44 8b 40 04          	mov    r8d,DWORD PTR [rax+0x4]
   14000277b:	45 85 c0             	test   r8d,r8d
   14000277e:	75 07                	jne    0x140002787
   140002780:	8b 50 0c             	mov    edx,DWORD PTR [rax+0xc]
   140002783:	85 d2                	test   edx,edx
   140002785:	74 d7                	je     0x14000275e
   140002787:	85 c9                	test   ecx,ecx
   140002789:	7f e5                	jg     0x140002770
   14000278b:	44 8b 48 0c          	mov    r9d,DWORD PTR [rax+0xc]
   14000278f:	4d 01 d9             	add    r9,r11
   140002792:	4c 89 c8             	mov    rax,r9
   140002795:	c3                   	ret
   140002796:	90                   	nop
   140002797:	90                   	nop
   140002798:	90                   	nop
   140002799:	90                   	nop
   14000279a:	90                   	nop
   14000279b:	90                   	nop
   14000279c:	90                   	nop
   14000279d:	90                   	nop
   14000279e:	90                   	nop
   14000279f:	90                   	nop
   1400027a0:	51                   	push   rcx
   1400027a1:	50                   	push   rax
   1400027a2:	48 3d 00 10 00 00    	cmp    rax,0x1000
   1400027a8:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   1400027ad:	72 19                	jb     0x1400027c8
   1400027af:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   1400027b6:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   1400027ba:	48 2d 00 10 00 00    	sub    rax,0x1000
   1400027c0:	48 3d 00 10 00 00    	cmp    rax,0x1000
   1400027c6:	77 e7                	ja     0x1400027af
   1400027c8:	48 29 c1             	sub    rcx,rax
   1400027cb:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   1400027cf:	58                   	pop    rax
   1400027d0:	59                   	pop    rcx
   1400027d1:	c3                   	ret
   1400027d2:	90                   	nop
   1400027d3:	90                   	nop
   1400027d4:	90                   	nop
   1400027d5:	90                   	nop
   1400027d6:	90                   	nop
   1400027d7:	90                   	nop
   1400027d8:	90                   	nop
   1400027d9:	90                   	nop
   1400027da:	90                   	nop
   1400027db:	90                   	nop
   1400027dc:	90                   	nop
   1400027dd:	90                   	nop
   1400027de:	90                   	nop
   1400027df:	90                   	nop
   1400027e0:	48 8b 05 f9 27 00 00 	mov    rax,QWORD PTR [rip+0x27f9]        # 0x140004fe0
   1400027e7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400027ea:	c3                   	ret
   1400027eb:	90                   	nop
   1400027ec:	90                   	nop
   1400027ed:	90                   	nop
   1400027ee:	90                   	nop
   1400027ef:	90                   	nop
   1400027f0:	48 8b 05 d9 27 00 00 	mov    rax,QWORD PTR [rip+0x27d9]        # 0x140004fd0
   1400027f7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400027fa:	c3                   	ret
   1400027fb:	90                   	nop
   1400027fc:	90                   	nop
   1400027fd:	90                   	nop
   1400027fe:	90                   	nop
   1400027ff:	90                   	nop
   140002800:	48 8b 05 69 59 00 00 	mov    rax,QWORD PTR [rip+0x5969]        # 0x140008170
   140002807:	c3                   	ret
   140002808:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000280f:	00 
   140002810:	48 89 c8             	mov    rax,rcx
   140002813:	48 87 05 56 59 00 00 	xchg   QWORD PTR [rip+0x5956],rax        # 0x140008170
   14000281a:	c3                   	ret
   14000281b:	90                   	nop
   14000281c:	90                   	nop
   14000281d:	90                   	nop
   14000281e:	90                   	nop
   14000281f:	90                   	nop
   140002820:	53                   	push   rbx
   140002821:	48 83 ec 20          	sub    rsp,0x20
   140002825:	89 cb                	mov    ebx,ecx
   140002827:	e8 24 00 00 00       	call   0x140002850
   14000282c:	89 d9                	mov    ecx,ebx
   14000282e:	48 8d 14 49          	lea    rdx,[rcx+rcx*2]
   140002832:	48 c1 e2 04          	shl    rdx,0x4
   140002836:	48 01 d0             	add    rax,rdx
   140002839:	48 83 c4 20          	add    rsp,0x20
   14000283d:	5b                   	pop    rbx
   14000283e:	c3                   	ret
   14000283f:	90                   	nop
   140002840:	ff 25 96 79 00 00    	jmp    QWORD PTR [rip+0x7996]        # 0x14000a1dc
   140002846:	90                   	nop
   140002847:	90                   	nop
   140002848:	ff 25 96 79 00 00    	jmp    QWORD PTR [rip+0x7996]        # 0x14000a1e4
   14000284e:	90                   	nop
   14000284f:	90                   	nop
   140002850:	ff 25 9e 79 00 00    	jmp    QWORD PTR [rip+0x799e]        # 0x14000a1f4
   140002856:	90                   	nop
   140002857:	90                   	nop
   140002858:	ff 25 9e 79 00 00    	jmp    QWORD PTR [rip+0x799e]        # 0x14000a1fc
   14000285e:	90                   	nop
   14000285f:	90                   	nop
   140002860:	ff 25 9e 79 00 00    	jmp    QWORD PTR [rip+0x799e]        # 0x14000a204
   140002866:	90                   	nop
   140002867:	90                   	nop
   140002868:	ff 25 9e 79 00 00    	jmp    QWORD PTR [rip+0x799e]        # 0x14000a20c
   14000286e:	90                   	nop
   14000286f:	90                   	nop
   140002870:	ff 25 9e 79 00 00    	jmp    QWORD PTR [rip+0x799e]        # 0x14000a214
   140002876:	90                   	nop
   140002877:	90                   	nop
   140002878:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a22c
   14000287e:	90                   	nop
   14000287f:	90                   	nop
   140002880:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a234
   140002886:	90                   	nop
   140002887:	90                   	nop
   140002888:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a23c
   14000288e:	90                   	nop
   14000288f:	90                   	nop
   140002890:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a244
   140002896:	90                   	nop
   140002897:	90                   	nop
   140002898:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a24c
   14000289e:	90                   	nop
   14000289f:	90                   	nop
   1400028a0:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a254
   1400028a6:	90                   	nop
   1400028a7:	90                   	nop
   1400028a8:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a25c
   1400028ae:	90                   	nop
   1400028af:	90                   	nop
   1400028b0:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a264
   1400028b6:	90                   	nop
   1400028b7:	90                   	nop
   1400028b8:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a26c
   1400028be:	90                   	nop
   1400028bf:	90                   	nop
   1400028c0:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a274
   1400028c6:	90                   	nop
   1400028c7:	90                   	nop
   1400028c8:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a27c
   1400028ce:	90                   	nop
   1400028cf:	90                   	nop
   1400028d0:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a284
   1400028d6:	90                   	nop
   1400028d7:	90                   	nop
   1400028d8:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a28c
   1400028de:	90                   	nop
   1400028df:	90                   	nop
   1400028e0:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a294
   1400028e6:	90                   	nop
   1400028e7:	90                   	nop
   1400028e8:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a29c
   1400028ee:	90                   	nop
   1400028ef:	90                   	nop
   1400028f0:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a2a4
   1400028f6:	90                   	nop
   1400028f7:	90                   	nop
   1400028f8:	ff 25 ae 79 00 00    	jmp    QWORD PTR [rip+0x79ae]        # 0x14000a2ac
   1400028fe:	90                   	nop
   1400028ff:	90                   	nop
   140002900:	ff 25 c6 78 00 00    	jmp    QWORD PTR [rip+0x78c6]        # 0x14000a1cc
   140002906:	90                   	nop
   140002907:	90                   	nop
   140002908:	ff 25 b6 78 00 00    	jmp    QWORD PTR [rip+0x78b6]        # 0x14000a1c4
   14000290e:	90                   	nop
   14000290f:	90                   	nop
   140002910:	ff 25 a6 78 00 00    	jmp    QWORD PTR [rip+0x78a6]        # 0x14000a1bc
   140002916:	90                   	nop
   140002917:	90                   	nop
   140002918:	ff 25 96 78 00 00    	jmp    QWORD PTR [rip+0x7896]        # 0x14000a1b4
   14000291e:	90                   	nop
   14000291f:	90                   	nop
   140002920:	ff 25 86 78 00 00    	jmp    QWORD PTR [rip+0x7886]        # 0x14000a1ac
   140002926:	90                   	nop
   140002927:	90                   	nop
   140002928:	ff 25 76 78 00 00    	jmp    QWORD PTR [rip+0x7876]        # 0x14000a1a4
   14000292e:	90                   	nop
   14000292f:	90                   	nop
   140002930:	ff 25 66 78 00 00    	jmp    QWORD PTR [rip+0x7866]        # 0x14000a19c
   140002936:	90                   	nop
   140002937:	90                   	nop
   140002938:	ff 25 56 78 00 00    	jmp    QWORD PTR [rip+0x7856]        # 0x14000a194
   14000293e:	90                   	nop
   14000293f:	90                   	nop
   140002940:	ff 25 46 78 00 00    	jmp    QWORD PTR [rip+0x7846]        # 0x14000a18c
   140002946:	90                   	nop
   140002947:	90                   	nop
   140002948:	ff 25 36 78 00 00    	jmp    QWORD PTR [rip+0x7836]        # 0x14000a184
   14000294e:	90                   	nop
   14000294f:	90                   	nop
   140002950:	ff 25 26 78 00 00    	jmp    QWORD PTR [rip+0x7826]        # 0x14000a17c
   140002956:	90                   	nop
   140002957:	90                   	nop
   140002958:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000295f:	00 
   140002960:	57                   	push   rdi
   140002961:	56                   	push   rsi
   140002962:	53                   	push   rbx
   140002963:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
   14000296a:	e8 81 ee ff ff       	call   0x1400017f0
   14000296f:	ff 15 27 78 00 00    	call   QWORD PTR [rip+0x7827]        # 0x14000a19c
   140002975:	85 c0                	test   eax,eax
   140002977:	89 c3                	mov    ebx,eax
   140002979:	0f 85 8d 00 00 00    	jne    0x140002a0c
   14000297f:	48 8b 35 fa 06 00 00 	mov    rsi,QWORD PTR [rip+0x6fa]        # 0x140003080
   140002986:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
   14000298b:	b9 01 00 00 00       	mov    ecx,0x1
   140002990:	ff d6                	call   rsi
   140002992:	41 b8 0c 00 00 00    	mov    r8d,0xc
   140002998:	ba 01 00 00 00       	mov    edx,0x1
   14000299d:	48 8d 0d bb 16 00 00 	lea    rcx,[rip+0x16bb]        # 0x14000405f
   1400029a4:	49 89 c1             	mov    r9,rax
   1400029a7:	e8 14 ff ff ff       	call   0x1400028c0
   1400029ac:	b9 01 00 00 00       	mov    ecx,0x1
   1400029b1:	ff d6                	call   rsi
   1400029b3:	48 89 c1             	mov    rcx,rax
   1400029b6:	e8 e5 fe ff ff       	call   0x1400028a0
   1400029bb:	89 d8                	mov    eax,ebx
   1400029bd:	b9 28 00 00 00       	mov    ecx,0x28
   1400029c2:	f3 ab                	rep stos DWORD PTR [rdi],eax
   1400029c4:	ff d6                	call   rsi
   1400029c6:	48 8d 74 24 20       	lea    rsi,[rsp+0x20]
   1400029cb:	ba a0 00 00 00       	mov    edx,0xa0
   1400029d0:	49 89 c0             	mov    r8,rax
   1400029d3:	48 89 f1             	mov    rcx,rsi
   1400029d6:	e8 cd fe ff ff       	call   0x1400028a8
   1400029db:	48 85 c0             	test   rax,rax
   1400029de:	74 38                	je     0x140002a18
   1400029e0:	48 89 f1             	mov    rcx,rsi
   1400029e3:	e8 00 ff ff ff       	call   0x1400028e8
   1400029e8:	48 85 c0             	test   rax,rax
   1400029eb:	48 89 c2             	mov    rdx,rax
   1400029ee:	74 1c                	je     0x140002a0c
   1400029f0:	48 89 d1             	mov    rcx,rdx
   1400029f3:	48 83 ea 01          	sub    rdx,0x1
   1400029f7:	0f b6 04 16          	movzx  eax,BYTE PTR [rsi+rdx*1]
   1400029fb:	3c 0d                	cmp    al,0xd
   1400029fd:	74 04                	je     0x140002a03
   1400029ff:	3c 0a                	cmp    al,0xa
   140002a01:	75 27                	jne    0x140002a2a
   140002a03:	48 85 d2             	test   rdx,rdx
   140002a06:	c6 04 16 00          	mov    BYTE PTR [rsi+rdx*1],0x0
   140002a0a:	75 e4                	jne    0x1400029f0
   140002a0c:	48 8d 0d 45 16 00 00 	lea    rcx,[rip+0x1645]        # 0x140004058
   140002a13:	e8 c0 fe ff ff       	call   0x1400028d8
   140002a18:	bb 01 00 00 00       	mov    ebx,0x1
   140002a1d:	89 d8                	mov    eax,ebx
   140002a1f:	48 81 c4 c0 00 00 00 	add    rsp,0xc0
   140002a26:	5b                   	pop    rbx
   140002a27:	5e                   	pop    rsi
   140002a28:	5f                   	pop    rdi
   140002a29:	c3                   	ret
   140002a2a:	48 83 f9 40          	cmp    rcx,0x40
   140002a2e:	75 dc                	jne    0x140002a0c
   140002a30:	b9 ee ff c0 00       	mov    ecx,0xc0ffee
   140002a35:	e8 16 ea ff ff       	call   0x140001450
   140002a3a:	ba 00 00 01 00       	mov    edx,0x10000
   140002a3f:	b9 01 00 00 00       	mov    ecx,0x1
   140002a44:	89 c7                	mov    edi,eax
   140002a46:	89 05 e4 55 00 00    	mov    DWORD PTR [rip+0x55e4],eax        # 0x140008030
   140002a4c:	e8 3f fe ff ff       	call   0x140002890
   140002a51:	48 85 c0             	test   rax,rax
   140002a54:	49 89 c3             	mov    r11,rax
   140002a57:	74 bf                	je     0x140002a18
   140002a59:	4c 8d 15 00 20 00 00 	lea    r10,[rip+0x2000]        # 0x140004a60
   140002a60:	49 89 c1             	mov    r9,rax
   140002a63:	41 b8 11 11 11 11    	mov    r8d,0x11111111
   140002a69:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140002a70:	89 f9                	mov    ecx,edi
   140002a72:	49 83 c2 04          	add    r10,0x4
   140002a76:	49 83 c1 04          	add    r9,0x4
   140002a7a:	44 31 c1             	xor    ecx,r8d
   140002a7d:	41 81 e8 47 86 c8 61 	sub    r8d,0x61c88647
   140002a84:	e8 c7 e9 ff ff       	call   0x140001450
   140002a89:	41 33 42 fc          	xor    eax,DWORD PTR [r10-0x4]
   140002a8d:	41 89 41 fc          	mov    DWORD PTR [r9-0x4],eax
   140002a91:	41 81 f8 c1 e3 77 bb 	cmp    r8d,0xbb77e3c1
   140002a98:	75 d6                	jne    0x140002a70
   140002a9a:	45 31 c0             	xor    r8d,r8d
   140002a9d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002aa0:	46 8b 0c 86          	mov    r9d,DWORD PTR [rsi+r8*4]
   140002aa4:	44 89 c1             	mov    ecx,r8d
   140002aa7:	e8 64 ec ff ff       	call   0x140001710
   140002aac:	44 31 c8             	xor    eax,r9d
   140002aaf:	43 89 84 83 00 08 00 	mov    DWORD PTR [r11+r8*4+0x800],eax
   140002ab6:	00 
   140002ab7:	49 83 c0 01          	add    r8,0x1
   140002abb:	49 83 f8 10          	cmp    r8,0x10
   140002abf:	75 df                	jne    0x140002aa0
   140002ac1:	31 d2                	xor    edx,edx
   140002ac3:	4c 89 d9             	mov    rcx,r11
   140002ac6:	e8 b5 e9 ff ff       	call   0x140001480
   140002acb:	4c 89 d9             	mov    rcx,r11
   140002ace:	89 c6                	mov    esi,eax
   140002ad0:	e8 e3 fd ff ff       	call   0x1400028b8
   140002ad5:	83 ee 01             	sub    esi,0x1
   140002ad8:	0f 85 2e ff ff ff    	jne    0x140002a0c
   140002ade:	48 8d 0d 87 15 00 00 	lea    rcx,[rip+0x1587]        # 0x14000406c
   140002ae5:	e8 ee fd ff ff       	call   0x1400028d8
   140002aea:	e9 2e ff ff ff       	jmp    0x140002a1d
   140002aef:	90                   	nop
   140002af0:	e9 3b e9 ff ff       	jmp    0x140001430
   140002af5:	90                   	nop
   140002af6:	90                   	nop
   140002af7:	90                   	nop
   140002af8:	90                   	nop
   140002af9:	90                   	nop
   140002afa:	90                   	nop
   140002afb:	90                   	nop
   140002afc:	90                   	nop
   140002afd:	90                   	nop
   140002afe:	90                   	nop
   140002aff:	90                   	nop
   140002b00:	ff                   	(bad)
   140002b01:	ff                   	(bad)
   140002b02:	ff                   	(bad)
   140002b03:	ff                   	(bad)
   140002b04:	ff                   	(bad)
   140002b05:	ff                   	(bad)
   140002b06:	ff                   	(bad)
   140002b07:	ff f0                	push   rax
   140002b09:	2a 00                	sub    al,BYTE PTR [rax]
   140002b0b:	40 01 00             	rex add DWORD PTR [rax],eax
	...
   140002b16:	00 00                	add    BYTE PTR [rax],al
   140002b18:	ff                   	(bad)
   140002b19:	ff                   	(bad)
   140002b1a:	ff                   	(bad)
   140002b1b:	ff                   	(bad)
   140002b1c:	ff                   	(bad)
   140002b1d:	ff                   	(bad)
   140002b1e:	ff                   	(bad)
   140002b1f:	ff 00                	inc    DWORD PTR [rax]
	...
   140002ffd:	00 00                	add    BYTE PTR [rax],al
   140002fff:	00 20                	add    BYTE PTR [rax],ah
   140003001:	2b 00                	sub    eax,DWORD PTR [rax]
   140003003:	40 01 00             	rex add DWORD PTR [rax],eax
	...
   14000300e:	00 00                	add    BYTE PTR [rax],al
   140003010:	ff                   	(bad)
   140003011:	ff                   	(bad)
   140003012:	ff                   	(bad)
   140003013:	ff                   	(bad)
   140003014:	ff                   	(bad)
   140003015:	ff                   	(bad)
   140003016:	ff                   	(bad)
   140003017:	ff 00                	inc    DWORD PTR [rax]
   140003019:	00 00                	add    BYTE PTR [rax],al
   14000301b:	00 00                	add    BYTE PTR [rax],al
   14000301d:	00 00                	add    BYTE PTR [rax],al
   14000301f:	00 ff                	add    bh,bh
   140003021:	ff                   	(bad)
   140003022:	ff                   	(bad)
   140003023:	ff 00                	inc    DWORD PTR [rax]
	...
   14000302d:	00 00                	add    BYTE PTR [rax],al
   14000302f:	00 02                	add    BYTE PTR [rdx],al
	...
   14000303d:	00 00                	add    BYTE PTR [rax],al
   14000303f:	00 ff                	add    bh,bh
   140003041:	ff                   	(bad)
   140003042:	ff                   	(bad)
   140003043:	ff 00                	inc    DWORD PTR [rax]
	...
   14000304d:	00 00                	add    BYTE PTR [rax],al
   14000304f:	00 e0                	add    al,ah
   140003051:	27                   	(bad)
   140003052:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   14000305d:	00 00                	add    BYTE PTR [rax],al
   14000305f:	00 f0                	add    al,dh
   140003061:	27                   	(bad)
   140003062:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140003071:	28 00                	sub    BYTE PTR [rax],al
   140003073:	40 01 00             	rex add DWORD PTR [rax],eax
   140003076:	00 00                	add    BYTE PTR [rax],al
   140003078:	10 28                	adc    BYTE PTR [rax],ch
   14000307a:	00 40 01             	add    BYTE PTR [rax+0x1],al
   14000307d:	00 00                	add    BYTE PTR [rax],al
   14000307f:	00 20                	add    BYTE PTR [rax],ah
   140003081:	28 00                	sub    BYTE PTR [rax],al
   140003083:	40 01 00             	rex add DWORD PTR [rax],eax
	...
   140003ffe:	00 00                	add    BYTE PTR [rax],al
   140004000:	00 d7                	add    bh,dl
   140004002:	ff                   	(bad)
   140004003:	ff                   	jmp    (bad)
   140004004:	e8 d6 ff ff d0       	call   0x111003fdf
   140004009:	d6                   	udb
   14000400a:	ff                   	(bad)
   14000400b:	ff                   	(bad)
   14000400c:	b8 d6 ff ff a0       	mov    eax,0xa0ffffd6
   140004011:	d6                   	udb
   140004012:	ff                   	(bad)
   140004013:	ff 88 d6 ff ff 70    	dec    DWORD PTR [rax+0x70ffffd6]
   140004019:	d6                   	udb
   14000401a:	ff                   	(bad)
   14000401b:	ff 60 d6             	jmp    QWORD PTR [rax-0x2a]
   14000401e:	ff                   	(bad)
   14000401f:	ff 50 d6             	call   QWORD PTR [rax-0x2a]
   140004022:	ff                   	(bad)
   140004023:	ff                   	(bad)
   140004024:	38 d6                	cmp    dh,dl
   140004026:	ff                   	(bad)
   140004027:	ff 20                	jmp    QWORD PTR [rax]
   140004029:	d6                   	udb
   14000402a:	ff                   	(bad)
   14000402b:	ff 08                	dec    DWORD PTR [rax]
   14000402d:	d5 ff ff 0d d5 ff ff 	{rex2 0xff} ud0 r25,QWORD PTR [rip+0xffffffffe8ffffd5]        # 0x12900400a
   140004034:	e8 
   140004035:	d5 ff ff a8 d5 ff ff 	{rex2 0xff} ud0 r29,QWORD PTR [r24-0x6f00002b]
   14000403c:	90 
   14000403d:	d5 ff ff 78 d5       	{rex2 0xff} ud0 r31,QWORD PTR [r24-0x2b]
   140004042:	ff                   	(bad)
   140004043:	ff 60 d5             	jmp    QWORD PTR [rax-0x2b]
   140004046:	ff                   	(bad)
   140004047:	ff 20                	jmp    QWORD PTR [rax]
   140004049:	d5 ff ff 50 d5       	{rex2 0xff} ud0 r26,QWORD PTR [r24-0x2b]
   14000404e:	ff                   	(bad)
   14000404f:	ff 40 d5             	inc    DWORD PTR [rax-0x2b]
   140004052:	ff                   	(bad)
   140004053:	ff 28                	jmp    FWORD PTR [rax]
   140004055:	d5 ff ff 57 72       	{rex2 0xff} ud0 r26,QWORD PTR [r31+0x72]
   14000405a:	6f                   	outs   dx,DWORD PTR [rsi]
   14000405b:	6e                   	outs   dx,BYTE PTR [rsi]
   14000405c:	67 2e 00 69 6e       	cs add BYTE PTR [ecx+0x6e],ch
   140004061:	70 75                	jo     0x1400040d8
   140004063:	74 20                	je     0x140004085
   140004065:	66 6c                	data16 ins BYTE PTR [rdi],dx
   140004067:	61                   	(bad)
   140004068:	67 3a 20             	cmp    ah,BYTE PTR [eax]
   14000406b:	00 43 6f             	add    BYTE PTR [rbx+0x6f],al
   14000406e:	72 72                	jb     0x1400040e2
   140004070:	65 63 74 21 00       	movsxd esi,DWORD PTR gs:[rcx+riz*1+0x0]
	...
   14000407d:	00 00                	add    BYTE PTR [rax],al
   14000407f:	00 d7                	add    bh,dl
   140004081:	0c 47                	or     al,0x47
   140004083:	ea                   	(bad)
   140004084:	77 82                	ja     0x140004008
   140004086:	40                   	rex
   140004087:	45 3a 6f 49          	cmp    r13b,BYTE PTR [r15+0x49]
   14000408b:	3f                   	(bad)
   14000408c:	26 45 83 37 76       	es rex.RB xor DWORD PTR [r15],0x76
   140004091:	74 9b                	je     0x14000402e
   140004093:	1e                   	(bad)
   140004094:	57                   	push   rdi
   140004095:	2f                   	(bad)
   140004096:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140004097:	59                   	pop    rcx
   140004098:	da fd                	(bad)
   14000409a:	46 2c 1e             	rex.RX sub al,0x1e
   14000409d:	4e 7a 56             	rex.WRX jp 0x1400040f6
   1400040a0:	1c 0e                	sbb    al,0xe
   1400040a2:	9f                   	lahf
   1400040a3:	d8 cc                	fmul   st,st(4)
   1400040a5:	ef                   	out    dx,eax
   1400040a6:	ab                   	stos   DWORD PTR [rdi],eax
   1400040a7:	00 42 1f             	add    BYTE PTR [rdx+0x1f],al
   1400040aa:	c3                   	ret
   1400040ab:	a8 32                	test   al,0x32
   1400040ad:	5f                   	pop    rdi
   1400040ae:	c9                   	leave
   1400040af:	ff f7                	push   rdi
   1400040b1:	a5                   	movs   DWORD PTR [rdi],DWORD PTR [rsi]
   1400040b2:	c3                   	ret
   1400040b3:	74 8d                	je     0x140004042
   1400040b5:	9c                   	pushf
   1400040b6:	0d 8b 96 21 5f       	or     eax,0x5f21968b
   1400040bb:	b5 85                	mov    ch,0x85
   1400040bd:	a0 4c ac 2c 29 a9 9a 	movabs al,ds:0x59199aa9292cac4c
   1400040c4:	19 59 
   1400040c6:	56                   	push   rsi
   1400040c7:	3f                   	(bad)
   1400040c8:	bb f4 2b 8e f6       	mov    ebx,0xf68e2bf4
   1400040cd:	d7                   	xlat   BYTE PTR [rbx]
   1400040ce:	03 04 9d dc 76 7f 80 	add    eax,DWORD PTR [rbx*4-0x7f808924]
   1400040d5:	92                   	xchg   edx,eax
   1400040d6:	69 0b 77 b8 dc 0a    	imul   ecx,DWORD PTR [rbx],0xadcb877
   1400040dc:	4a 89 1f             	rex.WX mov QWORD PTR [rdi],rbx
   1400040df:	da cf                	fcmove st,st(7)
   1400040e1:	e8 a2 dc 01 0b       	call   0x14b021d88
   1400040e6:	72 8e                	jb     0x140004076
   1400040e8:	f7 ea                	imul   edx
   1400040ea:	6c                   	ins    BYTE PTR [rdi],dx
   1400040eb:	3c 6b                	cmp    al,0x6b
   1400040ed:	56                   	push   rsi
   1400040ee:	ca a1 92             	retf   0x92a1
   1400040f1:	5f                   	pop    rdi
   1400040f2:	d2 ae 6b 2f d5 e5    	shr    BYTE PTR [rsi-0x1a2ad095],cl
   1400040f8:	6e                   	outs   dx,BYTE PTR [rsi]
   1400040f9:	af                   	scas   eax,DWORD PTR [rdi]
   1400040fa:	58                   	pop    rax
   1400040fb:	32 60 a2             	xor    ah,BYTE PTR [rax-0x5e]
   1400040fe:	33 65 23             	xor    esp,DWORD PTR [rbp+0x23]
   140004101:	a0 49 6f 40 de 86 c1 	movabs al,ds:0xbd59c186de406f49
   140004108:	59 bd 
   14000410a:	d1 83 36 9b c1 d0    	rol    DWORD PTR [rbx-0x2f3e64ca],1
   140004110:	54                   	push   rsp
   140004111:	73 7c                	jae    0x14000418f
   140004113:	08 40 88             	or     BYTE PTR [rax-0x78],al
   140004116:	f0 21 73 eb          	lock and DWORD PTR [rbx-0x15],esi
   14000411a:	e8 ce 9a 42 c2       	call   0x10242dbed
   14000411f:	e6 b5                	out    0xb5,al
   140004121:	2b 1b                	sub    ebx,DWORD PTR [rbx]
   140004123:	12 45 09             	adc    al,BYTE PTR [rbp+0x9]
   140004126:	9c                   	pushf
   140004127:	3e 03 56 7d          	ds add edx,DWORD PTR [rsi+0x7d]
   14000412b:	66 6f                	outs   dx,WORD PTR [rsi]
   14000412d:	79 a2                	jns    0x1400040d1
   14000412f:	c1 10 e5             	rcl    DWORD PTR [rax],0xe5
   140004132:	05 16 61 f4 c5       	add    eax,0xc5f46116
   140004137:	02 16                	add    dl,BYTE PTR [rsi]
   140004139:	ec                   	in     al,dx
   14000413a:	87 39                	xchg   DWORD PTR [rcx],edi
   14000413c:	76 d0                	jbe    0x14000410e
   14000413e:	7d 91                	jge    0x1400040d1
   140004140:	ef                   	out    dx,eax
   140004141:	fc                   	cld
   140004142:	4e 34 8a             	rex.WRX xor al,0x8a
   140004145:	0a 44 a1 19          	or     al,BYTE PTR [rcx+riz*4+0x19]
   140004149:	24 03                	and    al,0x3
   14000414b:	45                   	rex.RB
   14000414c:	3e 60                	ds (bad)
   14000414e:	91                   	xchg   ecx,eax
   14000414f:	c1 46 53 1e          	rol    DWORD PTR [rsi+0x53],0x1e
   140004153:	c4                   	(bad)
   140004154:	9c                   	pushf
   140004155:	a9 bb 34 dc cf       	test   eax,0xcfdc34bb
   14000415a:	7c 36                	jl     0x140004192
   14000415c:	d9 d0                	fnop
   14000415e:	72 16                	jb     0x140004176
   140004160:	bb a0 6d e2 51       	mov    ebx,0x51e26da0
   140004165:	4d 59                	rex.WRB pop r9
   140004167:	98                   	cwde
   140004168:	3b 34 ce             	cmp    esi,DWORD PTR [rsi+rcx*8]
   14000416b:	6b c2 23             	imul   eax,edx,0x23
   14000416e:	bd 1d 92 71 22       	mov    ebp,0x2271921d
   140004173:	bf b2 5c 40 2f       	mov    edi,0x2f405cb2
   140004178:	1b e5                	sbb    esp,ebp
   14000417a:	44 52                	rex.R push rdx
   14000417c:	6e                   	outs   dx,BYTE PTR [rsi]
   14000417d:	4a 8a 25 a9 2b 44 20 	rex.WX mov spl,BYTE PTR [rip+0x20442ba9]        # 0x160446d2d
   140004184:	c3                   	ret
   140004185:	b8 d7 8f 71 2e       	mov    eax,0x2e718fd7
   14000418a:	a0 30 cb f7 25 c0 70 	movabs al,ds:0x9a2b70c025f7cb30
   140004191:	2b 9a 
   140004193:	49 fb                	rex.WB sti
   140004195:	46 2b 2d bb 26 64 1d 	rex.RX sub r13d,DWORD PTR [rip+0x1d6426bb]        # 0x15d646857
   14000419c:	61                   	(bad)
   14000419d:	e7 f8                	out    0xf8,eax
   14000419f:	44 98                	rex.R cwde
   1400041a1:	a2 b5 8c 2a d1 46 c8 	movabs ds:0x7163c846d12a8cb5,al
   1400041a8:	63 71 
   1400041aa:	40 6e                	rex outs dx,BYTE PTR [rsi]
   1400041ac:	c4                   	(bad)
   1400041ad:	d8 15 1b 0f bd 2a    	fcom   DWORD PTR [rip+0x2abd0f1b]        # 0x16abd50ce
   1400041b3:	38 6d 42             	cmp    BYTE PTR [rbp+0x42],ch
   1400041b6:	fa                   	cli
   1400041b7:	1e                   	(bad)
   1400041b8:	35 32 5c a7 54       	xor    eax,0x54a75c32
   1400041bd:	72 4a                	jb     0x140004209
   1400041bf:	d9 37                	fnstenv [rdi]
   1400041c1:	bd 37 2e 44 e6       	mov    ebp,0xe6442e37
   1400041c6:	31 09                	xor    DWORD PTR [rcx],ecx
   1400041c8:	d6                   	udb
   1400041c9:	54                   	push   rsp
   1400041ca:	fb                   	sti
   1400041cb:	47 af                	rex.RXB scas eax,DWORD PTR [rdi]
   1400041cd:	94                   	xchg   esp,eax
   1400041ce:	0b 9b 18 f5 bc 4b    	or     ebx,DWORD PTR [rbx+0x4bbcf518]
   1400041d4:	7d 3f                	jge    0x140004215
   1400041d6:	b7 79                	mov    bh,0x79
   1400041d8:	4d cf                	rex.WRB iretq
   1400041da:	18 2f                	sbb    BYTE PTR [rdi],ch
   1400041dc:	e1 76                	loope  0x140004254
   1400041de:	94                   	xchg   esp,eax
   1400041df:	67 26 a1 73 6c d8 63 	addr32 es mov eax,ds:0x63d86c73
   1400041e6:	61                   	(bad)
   1400041e7:	25 90 fb 22 44       	and    eax,0x4422fb90
   1400041ec:	c9                   	leave
   1400041ed:	f6 2a                	imul   BYTE PTR [rdx]
   1400041ef:	51                   	push   rcx
   1400041f0:	6c                   	ins    BYTE PTR [rdi],dx
   1400041f1:	69 77 94 c4 70 9e 5d 	imul   esi,DWORD PTR [rdi-0x6c],0x5d9e70c4
   1400041f8:	c1 db 27             	rcr    ebx,0x27
   1400041fb:	c6 81 81 a7 35 26 a8 	mov    BYTE PTR [rcx+0x2635a781],0xa8
   140004202:	5f                   	pop    rdi
   140004203:	26 6e                	es outs dx,BYTE PTR [rsi]
   140004205:	14 eb                	adc    al,0xeb
   140004207:	fc                   	cld
   140004208:	8d                   	lea    eax,(bad)
   140004209:	c2 83 b7             	ret    0xb783
   14000420c:	0d 42 9d 7c f4       	or     eax,0xf47c9d42
   140004211:	38 da                	cmp    dl,bl
   140004213:	4f bb af b1 a6 ca 18 	rex.WRXB movabs r11,0xaebf4a18caa6b1af
   14000421a:	4a bf ae 
   14000421d:	a2 95 89 bf 8d a6 1b 	movabs ds:0xf9db1ba68dbf8995,al
   140004224:	db f9 
   140004226:	37                   	(bad)
   140004227:	73 76                	jae    0x14000429f
   140004229:	cc                   	int3
   14000422a:	62 aa 6c 58 64       	(bad)
   14000422f:	84 31                	test   BYTE PTR [rcx],dh
   140004231:	db 2c 03             	fld    TBYTE PTR [rbx+rax*1]
   140004234:	91                   	xchg   ecx,eax
   140004235:	e3 9d                	jrcxz  0x1400041d4
   140004237:	ac                   	lods   al,BYTE PTR [rsi]
   140004238:	bb cf 3f 72 3d       	mov    ebx,0x3d723fcf
   14000423d:	38 53 e0             	cmp    BYTE PTR [rbx-0x20],dl
   140004240:	5a                   	pop    rdx
   140004241:	6c                   	ins    BYTE PTR [rdi],dx
   140004242:	22 b2 dc 8e 26 c5    	and    dh,BYTE PTR [rdx-0x3ad97124]
   140004248:	39 09                	cmp    DWORD PTR [rcx],ecx
   14000424a:	fb                   	sti
   14000424b:	77 e0                	ja     0x14000422d
   14000424d:	f5                   	cmc
   14000424e:	1d a8 41 23 3a       	sbb    eax,0x3a2341a8
   140004253:	dd 2f                	(bad) [rdi]
   140004255:	6d                   	ins    DWORD PTR [rdi],dx
   140004256:	03 f6                	add    esi,esi
   140004258:	d4                   	(bad)
   140004259:	bc 44 63 a3 f7       	mov    esp,0xf7a36344
   14000425e:	18 99 33 99 af bf    	sbb    BYTE PTR [rcx-0x405066cd],bl
   140004264:	bb 59 42 72 3a       	mov    ebx,0x3a724259
   140004269:	83 48 3e 5c          	or     DWORD PTR [rax+0x3e],0x5c
   14000426d:	68 4e c3 3d 1e       	push   0x1e3dc34e
   140004272:	19 e6                	sbb    esi,esp
   140004274:	25 b0 f0 59 78       	and    eax,0x7859f0b0
   140004279:	e7 28                	out    0x28,eax
   14000427b:	f9                   	stc
   14000427c:	c6                   	(bad)
   14000427d:	cb                   	retf
   14000427e:	03 28                	add    ebp,DWORD PTR [rax]
   140004280:	03 e6                	add    esp,esi
   140004282:	67 83 94 e0 85 fd 7c 	adc    DWORD PTR [eax+eiz*8+0x5d7cfd85],0x6b
   140004289:	5d 6b 
   14000428b:	a6                   	cmps   BYTE PTR [rsi],BYTE PTR [rdi]
   14000428c:	1a f5                	sbb    dh,ch
   14000428e:	49 24 45             	rex.WB and al,0x45
   140004291:	3e 23 b0 91 12 2b b1 	ds and esi,DWORD PTR [rax-0x4ed4ed6f]
   140004298:	d2 2e                	shr    BYTE PTR [rsi],cl
   14000429a:	e7 66                	out    0x66,eax
   14000429c:	fa                   	cli
   14000429d:	82                   	(bad)
   14000429e:	75 1f                	jne    0x1400042bf
   1400042a0:	85 b9 04 34 5c 53    	test   DWORD PTR [rcx+0x535c3404],edi
   1400042a6:	b2 6f                	mov    dl,0x6f
   1400042a8:	c3                   	ret
   1400042a9:	84 cc                	test   ah,cl
   1400042ab:	4e 93                	rex.WRX xchg rbx,rax
   1400042ad:	d6                   	udb
   1400042ae:	a5                   	movs   DWORD PTR [rdi],DWORD PTR [rsi]
   1400042af:	74 ae                	je     0x14000425f
   1400042b1:	df c9                	(bad)
   1400042b3:	30 fe                	xor    dh,bh
   1400042b5:	2b 22                	sub    esp,DWORD PTR [rdx]
   1400042b7:	f6 1f                	neg    BYTE PTR [rdi]
   1400042b9:	6f                   	outs   dx,DWORD PTR [rsi]
   1400042ba:	19 2d 8f 8a 5a 35    	sbb    DWORD PTR [rip+0x355a8a8f],ebp        # 0x1755acd4f
   1400042c0:	2c a8                	sub    al,0xa8
   1400042c2:	34 3e                	xor    al,0x3e
   1400042c4:	9f                   	lahf
   1400042c5:	c2 c9 01             	ret    0x1c9
   1400042c8:	2a bd c8 ce 2f d8    	sub    bh,BYTE PTR [rbp-0x27d03138]
   1400042ce:	d1 01                	rol    DWORD PTR [rcx],1
   1400042d0:	e1 b7                	loope  0x140004289
   1400042d2:	36 e8 61 05 c5 f3    	ss call 0x133c54839
   1400042d8:	1c de                	sbb    al,0xde
   1400042da:	0f 29 75 80          	movaps XMMWORD PTR [rbp-0x80],xmm6
   1400042de:	ee                   	out    dx,al
   1400042df:	d9 77 12             	fnstenv [rdi+0x12]
   1400042e2:	ae                   	scas   al,BYTE PTR [rdi]
   1400042e3:	fc                   	cld
   1400042e4:	2f                   	(bad)
   1400042e5:	74 0a                	je     0x1400042f1
   1400042e7:	73 25                	jae    0x14000430e
   1400042e9:	c7                   	(bad)
   1400042ea:	e2 95                	loop   0x140004281
   1400042ec:	29 d3                	sub    ebx,edx
   1400042ee:	12 3e                	adc    bh,BYTE PTR [rsi]
   1400042f0:	64 c9                	fs leave
   1400042f2:	6c                   	ins    BYTE PTR [rdi],dx
   1400042f3:	aa                   	stos   BYTE PTR [rdi],al
   1400042f4:	c8 bd 42 d0          	enter  0x42bd,0xd0
   1400042f8:	15 9c 9c 35 68       	adc    eax,0x68359c9c
   1400042fd:	ae                   	scas   al,BYTE PTR [rdi]
   1400042fe:	4c                   	rex.WR
   1400042ff:	66 65 7a 94          	data16 gs jp 0x140004297
   140004303:	c0 de 32             	rcr    dh,0x32
   140004306:	79 68                	jns    0x140004370
   140004308:	6e                   	outs   dx,BYTE PTR [rsi]
   140004309:	65 82                	gs (bad)
   14000430b:	54                   	push   rsp
   14000430c:	9a                   	(bad)
   14000430d:	7c 33                	jl     0x140004342
   14000430f:	cb                   	retf
   140004310:	4c 7f 99             	rex.WR jg 0x1400042ac
   140004313:	79 70                	jns    0x140004385
   140004315:	39 5f 31             	cmp    DWORD PTR [rdi+0x31],ebx
   140004318:	b3 36                	mov    bl,0x36
   14000431a:	77 33                	ja     0x14000434f
   14000431c:	e2 2e                	loop   0x14000434c
   14000431e:	0e                   	(bad)
   14000431f:	1c 36                	sbb    al,0x36
   140004321:	23 56 58             	and    edx,DWORD PTR [rsi+0x58]
   140004324:	9f                   	lahf
   140004325:	cd fc                	int    0xfc
   140004327:	55                   	push   rbp
   140004328:	85 83 22 35 b7 70    	test   DWORD PTR [rbx+0x70b73522],eax
   14000432e:	91                   	xchg   ecx,eax
   14000432f:	6e                   	outs   dx,BYTE PTR [rsi]
   140004330:	84 9d 15 e2 78 80    	test   BYTE PTR [rbp-0x7f871deb],bl
   140004336:	f9                   	stc
   140004337:	65 ab                	gs stos DWORD PTR [rdi],eax
   140004339:	d5 5d a4             	(bad)
   14000433c:	d0 b3 c7 0f d2 34    	shl    BYTE PTR [rbx+0x34d20fc7],1
   140004342:	c4                   	(bad)
   140004343:	3c 83                	cmp    al,0x83
   140004345:	cf                   	iret
   140004346:	fa                   	cli
   140004347:	f5                   	cmc
   140004348:	8c 36                	mov    WORD PTR [rsi],?
   14000434a:	a6                   	cmps   BYTE PTR [rsi],BYTE PTR [rdi]
   14000434b:	6b 3f d7             	imul   edi,DWORD PTR [rdi],0xffffffd7
   14000434e:	71 68                	jno    0x1400043b8
   140004350:	6c                   	ins    BYTE PTR [rdi],dx
   140004351:	59                   	pop    rcx
   140004352:	66 2c 77             	data16 sub al,0x77
   140004355:	21 15 1d 18 13 06    	and    DWORD PTR [rip+0x613181d],edx        # 0x146135b78
   14000435b:	7a 03                	jp     0x140004360
   14000435d:	5c                   	pop    rsp
   14000435e:	85 a4 0a 0d 28 ce 88 	test   DWORD PTR [rdx+rcx*1-0x7731d7f3],esp
   140004365:	84 27                	test   BYTE PTR [rdi],ah
   140004367:	fd                   	std
   140004368:	7f 2b                	jg     0x140004395
   14000436a:	65 e4 eb             	gs in  al,0xeb
   14000436d:	6b 36 22             	imul   esi,DWORD PTR [rsi],0x22
   140004370:	e0 3a                	loopne 0x1400043ac
   140004372:	da 39                	fidivr DWORD PTR [rcx]
   140004374:	0f 28 03             	movaps xmm0,XMMWORD PTR [rbx]
   140004377:	ab                   	stos   DWORD PTR [rdi],eax
   140004378:	08 94 6c 24 0d 6e ef 	or     BYTE PTR [rsp+rbp*2-0x1091f2dc],dl
   14000437f:	d4                   	(bad)
   140004380:	84 59 3f             	test   BYTE PTR [rcx+0x3f],bl
   140004383:	73 ae                	jae    0x140004333
   140004385:	ef                   	out    dx,eax
   140004386:	3f                   	(bad)
   140004387:	7d ab                	jge    0x140004334
   140004389:	97                   	xchg   edi,eax
   14000438a:	0e                   	(bad)
   14000438b:	04 8e                	add    al,0x8e
   14000438d:	79 81                	jns    0x140004310
   14000438f:	b2 27                	mov    dl,0x27
   140004391:	26 a5                	es movs DWORD PTR [rdi],DWORD PTR [rsi]
   140004393:	e5 75                	in     eax,0x75
   140004395:	ac                   	lods   al,BYTE PTR [rsi]
   140004396:	75 d5                	jne    0x14000436d
   140004398:	fe 4b 0a             	dec    BYTE PTR [rbx+0xa]
   14000439b:	1c a6                	sbb    al,0xa6
   14000439d:	39 df                	cmp    edi,ebx
   14000439f:	bb 80 48 e2 fc       	mov    ebx,0xfce24880
   1400043a4:	94                   	xchg   esp,eax
   1400043a5:	b2 09                	mov    dl,0x9
   1400043a7:	6a 18                	push   0x18
   1400043a9:	82                   	(bad)
   1400043aa:	63 a2 54 4b f2 a9    	movsxd esp,DWORD PTR [rdx-0x560db4ac]
   1400043b0:	d0 b0 64 a2 da 84    	shl    BYTE PTR [rax-0x7b255d9c],1
   1400043b6:	26 55                	es push rbp
   1400043b8:	d0 f7                	shl    bh,1
   1400043ba:	03 82 e0 96 16 2d    	add    eax,DWORD PTR [rdx+0x2d1696e0]
   1400043c0:	a5                   	movs   DWORD PTR [rdi],DWORD PTR [rsi]
   1400043c1:	b4 64                	mov    ah,0x64
   1400043c3:	db 86 d0 84 cc c5    	fild   DWORD PTR [rsi-0x3a337b30]
   1400043c9:	41 a4                	rex.B movs BYTE PTR [rdi],BYTE PTR [rsi]
   1400043cb:	55                   	push   rbp
   1400043cc:	f7 8b eb 36 3c c2 ee 	test   DWORD PTR [rbx-0x3dc3c915],0xb4ed20ee
   1400043d3:	20 ed b4 
   1400043d6:	e2 67                	loop   0x14000443f
   1400043d8:	fc                   	cld
   1400043d9:	25 0a 3a 2f 2f       	and    eax,0x2f2f3a0a
   1400043de:	c6                   	(bad)
   1400043df:	27                   	(bad)
   1400043e0:	42 f5                	rex.X cmc
   1400043e2:	f3 43 eb 79          	repz rex.XB jmp 0x14000445f
   1400043e6:	67 55                	addr32 push rbp
   1400043e8:	23 b2 83 8e 54 5e    	and    esi,DWORD PTR [rdx+0x5e548e83]
   1400043ee:	99                   	cdq
   1400043ef:	02 80 94 68 e4 9b    	add    al,BYTE PTR [rax-0x641b976c]
   1400043f5:	d8 65 0c             	fsub   DWORD PTR [rbp+0xc]
   1400043f8:	78 10                	js     0x14000440a
   1400043fa:	7f c0                	jg     0x1400043bc
   1400043fc:	8d a9 e2 39 fa 0e    	lea    ebp,[rcx+0xefa39e2]
   140004402:	53                   	push   rbx
   140004403:	f8                   	clc
   140004404:	4a                   	rex.WX
   140004405:	4f f8                	rex.WRXB clc
   140004407:	cf                   	iret
   140004408:	1c 92                	sbb    al,0x92
   14000440a:	a8 45                	test   al,0x45
   14000440c:	8c 86 af ad c1 5e    	mov    WORD PTR [rsi+0x5ec1adaf],es
   140004412:	22 aa 6e f6 c6 d9    	and    ch,BYTE PTR [rdx-0x26390992]
   140004418:	22 7c fa 0e          	and    bh,BYTE PTR [rdx+rdi*8+0xe]
   14000441c:	a8 5a                	test   al,0x5a
   14000441e:	5b                   	pop    rbx
   14000441f:	12 c7                	adc    al,bh
   140004421:	4a 85 0b             	rex.WX test QWORD PTR [rbx],rcx
   140004424:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140004425:	d7                   	xlat   BYTE PTR [rbx]
   140004426:	68 90 0c d2 24       	push   0x24d20c90
   14000442b:	2a a7 6b c4 fb 73    	sub    ah,BYTE PTR [rdi+0x73fbc46b]
   140004431:	74 e6                	je     0x140004419
   140004433:	b3 3b                	mov    bl,0x3b
   140004435:	43 ee                	rex.XB out dx,al
   140004437:	46 cb                	rex.RX retf
   140004439:	d9 06                	fld    DWORD PTR [rsi]
   14000443b:	af                   	scas   eax,DWORD PTR [rdi]
   14000443c:	c4                   	(bad)
   14000443d:	cb                   	retf
   14000443e:	af                   	scas   eax,DWORD PTR [rdi]
   14000443f:	7e 93                	jle    0x1400043d4
   140004441:	66 54                	push   sp
   140004443:	34 ba                	xor    al,0xba
   140004445:	6e                   	outs   dx,BYTE PTR [rsi]
   140004446:	20 40 f3             	and    BYTE PTR [rax-0xd],al
   140004449:	ec                   	in     al,dx
   14000444a:	62 0b 4f fa d7       	(bad)
   14000444f:	fe 4f f5             	dec    BYTE PTR [rdi-0xb]
   140004452:	28 cc                	sub    ah,cl
   140004454:	94                   	xchg   esp,eax
   140004455:	18 bd 08 c0 ca 3b    	sbb    BYTE PTR [rbp+0x3bcac008],bh
   14000445b:	32 0b                	xor    cl,BYTE PTR [rbx]
   14000445d:	d4                   	(bad)
   14000445e:	37                   	(bad)
   14000445f:	d2 93 f1 60 8f b2    	rcl    BYTE PTR [rbx-0x4d709f0f],cl
   140004465:	88 31                	mov    BYTE PTR [rcx],dh
   140004467:	8f                   	(bad)
   140004468:	11 f2                	adc    edx,esi
   14000446a:	5d                   	pop    rbp
   14000446b:	35 f6 15 0c 7c       	xor    eax,0x7c0c15f6
   140004470:	ae                   	scas   al,BYTE PTR [rdi]
   140004471:	54                   	push   rsp
   140004472:	d4                   	(bad)
   140004473:	8a ed                	mov    ch,ch
   140004475:	49 8f                	rex.WB (bad)
   140004477:	d2 bf 2b fe f7 47    	sar    BYTE PTR [rdi+0x47f7fe2b],cl
   14000447d:	cc                   	int3
   14000447e:	64 3b e3             	fs cmp esp,ebx
   140004481:	05 34 ea fb 46       	add    eax,0x46fbea34
   140004486:	59                   	pop    rcx
   140004487:	82                   	(bad)
   140004488:	43                   	rex.XB
   140004489:	67 59                	addr32 pop rcx
   14000448b:	1d 40 2a f0 4e       	sbb    eax,0x4ef02a40
   140004490:	dc e0                	fsubr  st(0),st
   140004492:	73 c7                	jae    0x14000445b
   140004494:	5a                   	pop    rdx
   140004495:	0f fe 5e cc          	paddd  mm3,QWORD PTR [rsi-0x34]
   140004499:	52                   	push   rdx
   14000449a:	47 16                	rex.RXB (bad)
   14000449c:	01 82 38 c8 ed 3d    	add    DWORD PTR [rdx+0x3dedc838],eax
   1400044a2:	54                   	push   rsp
   1400044a3:	21 0d df f9 61 b1    	and    DWORD PTR [rip+0xffffffffb161f9df],ecx        # 0xf1623e88
   1400044a9:	59                   	pop    rcx
   1400044aa:	ab                   	stos   DWORD PTR [rdi],eax
   1400044ab:	92                   	xchg   edx,eax
   1400044ac:	4b 91                	rex.WXB xchg r9,rax
   1400044ae:	04 cd                	add    al,0xcd
   1400044b0:	27                   	(bad)
   1400044b1:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   1400044b2:	b8 5b 87 73 b8       	mov    eax,0xb873875b
   1400044b7:	82                   	(bad)
   1400044b8:	57                   	push   rdi
   1400044b9:	5b                   	pop    rbx
   1400044ba:	74 b7                	je     0x140004473
   1400044bc:	1c 5b                	sbb    al,0x5b
   1400044be:	25 a2 33 bc 3a       	and    eax,0x3abc33a2
   1400044c3:	f3 14 4d             	repz adc al,0x4d
   1400044c6:	1e                   	(bad)
   1400044c7:	15 89 9d 25 dc       	adc    eax,0xdc259d89
   1400044cc:	65 4d 9e             	gs rex.WRB sahf
   1400044cf:	d0 15 67 18 63 e7    	rcl    BYTE PTR [rip+0xffffffffe7631867],1        # 0x127635d3c
   1400044d5:	4c e3 9c             	rex.WR jrcxz 0x140004474
   1400044d8:	da 67 ab             	fisub  DWORD PTR [rdi-0x55]
   1400044db:	40 39 4f 1c          	rex cmp DWORD PTR [rdi+0x1c],ecx
   1400044df:	29 78 92             	sub    DWORD PTR [rax-0x6e],edi
   1400044e2:	2e d8 c2             	cs fadd st,st(2)
   1400044e5:	83 4a c4 c1          	or     DWORD PTR [rdx-0x3c],0xffffffc1
   1400044e9:	2c 0c                	sub    al,0xc
   1400044eb:	87 9b f3 3e fb 61    	xchg   DWORD PTR [rbx+0x61fb3ef3],ebx
   1400044f1:	f4                   	hlt
   1400044f2:	d3 43 bd             	rol    DWORD PTR [rbx-0x43],cl
   1400044f5:	c0 50 31 1f          	rcl    BYTE PTR [rax+0x31],0x1f
   1400044f9:	14 f3                	adc    al,0xf3
   1400044fb:	30 d9                	xor    cl,bl
   1400044fd:	d2 30                	shl    BYTE PTR [rax],cl
   1400044ff:	21 7b d1             	and    DWORD PTR [rbx-0x2f],edi
   140004502:	e7 7c                	out    0x7c,eax
   140004504:	18 8b 72 87 84 74    	sbb    BYTE PTR [rbx+0x74848772],cl
   14000450a:	c0 ef 44             	shr    bh,0x44
   14000450d:	bc c2 7f 8c 28       	mov    esp,0x288c7fc2
   140004512:	7d cd                	jge    0x1400044e1
   140004514:	33 78 56             	xor    edi,DWORD PTR [rax+0x56]
   140004517:	76 4c                	jbe    0x140004565
   140004519:	17                   	(bad)
   14000451a:	26 e0 bb             	es loopne 0x1400044d8
   14000451d:	de d5                	(bad)
   14000451f:	e1 4f                	loope  0x140004570
   140004521:	74 5f                	je     0x140004582
   140004523:	1c 39                	sbb    al,0x39
   140004525:	ac                   	lods   al,BYTE PTR [rsi]
   140004526:	02 14 f5 5b 8b 82 11 	add    dl,BYTE PTR [rsi*8+0x11828b5b]
   14000452d:	5f                   	pop    rdi
   14000452e:	ba 51 94 26 17       	mov    edx,0x17269451
   140004533:	b3 b4                	mov    bl,0xb4
   140004535:	8a 3e                	mov    bh,BYTE PTR [rsi]
   140004537:	0b 3a                	or     edi,DWORD PTR [rdx]
   140004539:	99                   	cdq
   14000453a:	68 db 11 25 93       	push   0xffffffff932511db
   14000453f:	ae                   	scas   al,BYTE PTR [rdi]
   140004540:	a3 78 9c fb 57 e9 14 	movabs ds:0xdff714e957fb9c78,eax
   140004547:	f7 df 
   140004549:	ba 55 d7 28 e2       	mov    edx,0xe228d755
   14000454e:	7a 80                	jp     0x1400044d0
   140004550:	d2 2f                	shr    BYTE PTR [rdi],cl
   140004552:	39 c8                	cmp    eax,ecx
   140004554:	5d                   	pop    rbp
   140004555:	1a b8 f1 67 e1 c5    	sbb    bh,BYTE PTR [rax-0x3a1e980f]
   14000455b:	f8                   	clc
   14000455c:	59                   	pop    rcx
   14000455d:	33 14 44             	xor    edx,DWORD PTR [rsp+rax*2]
   140004560:	8a 9e f6 d6 3c bd    	mov    bl,BYTE PTR [rsi-0x42c3290a]
   140004566:	91                   	xchg   ecx,eax
   140004567:	98                   	cwde
   140004568:	20 bf e6 87 56 61    	and    BYTE PTR [rdi+0x615687e6],bh
   14000456e:	cd 1c                	int    0x1c
   140004570:	05 02 28 6f d1       	add    eax,0xd16f2802
   140004575:	36 b5 eb             	ss mov ch,0xeb
   140004578:	fd                   	std
   140004579:	c1 1e 21             	rcr    DWORD PTR [rsi],0x21
   14000457c:	07                   	(bad)
   14000457d:	ad                   	lods   eax,DWORD PTR [rsi]
   14000457e:	09 88 5b ad 02 4f    	or     DWORD PTR [rax+0x4f02ad5b],ecx
   140004584:	36 10 75 26          	ss adc BYTE PTR [rbp+0x26],dh
   140004588:	2a dc                	sub    bl,ah
   14000458a:	bb 77 ae fa 34       	mov    ebx,0x34faae77
   14000458f:	03 56 19             	add    edx,DWORD PTR [rsi+0x19]
   140004592:	b7 ce                	mov    bh,0xce
   140004594:	85 0b                	test   DWORD PTR [rbx],ecx
   140004596:	b5 1e                	mov    ch,0x1e
   140004598:	08 c5                	or     ch,al
   14000459a:	da 5a a9             	ficomp DWORD PTR [rdx-0x57]
   14000459d:	29 5b dd             	sub    DWORD PTR [rbx-0x23],ebx
   1400045a0:	96                   	xchg   esi,eax
   1400045a1:	08 74 8e cf          	or     BYTE PTR [rsi+rcx*4-0x31],dh
   1400045a5:	c5 8d 0b             	(bad)
   1400045a8:	03 cf                	add    ecx,edi
   1400045aa:	5f                   	pop    rdi
   1400045ab:	d1 c7                	rol    edi,1
   1400045ad:	24 38                	and    al,0x38
   1400045af:	a8 df                	test   al,0xdf
   1400045b1:	9a                   	(bad)
   1400045b2:	ce                   	(bad)
   1400045b3:	b7 54                	mov    bh,0x54
   1400045b5:	46 8b 4e 71          	rex.RX mov r9d,DWORD PTR [rsi+0x71]
   1400045b9:	66 10 80 54 10 7e 7e 	data16 adc BYTE PTR [rax+0x7e7e1054],al
   1400045c0:	19 81 0e 73 f3 5e    	sbb    DWORD PTR [rcx+0x5ef3730e],eax
   1400045c6:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   1400045c7:	14 c1                	adc    al,0xc1
   1400045c9:	4b e0 ce             	rex.WXB loopne 0x14000459a
   1400045cc:	4e 83 c7 4b          	rex.WRX add rdi,0x4b
   1400045d0:	03 d6                	add    edx,esi
   1400045d2:	f8                   	clc
   1400045d3:	af                   	scas   eax,DWORD PTR [rdi]
   1400045d4:	d3 ed                	shr    ebp,cl
   1400045d6:	92                   	xchg   edx,eax
   1400045d7:	4c 7f 0d             	rex.WR jg 0x1400045e7
   1400045da:	aa                   	stos   BYTE PTR [rdi],al
   1400045db:	d5 31 f6 9e 32 f9 60 	{rex2 0x31} neg BYTE PTR [r30-0x7d9f06ce]
   1400045e2:	82 
   1400045e3:	d0 86 83 11 83 57    	rol    BYTE PTR [rsi+0x57831183],1
   1400045e9:	e9 ea 0a 94 cd       	jmp    0x10d9450d8
   1400045ee:	5f                   	pop    rdi
   1400045ef:	ef                   	out    dx,eax
   1400045f0:	df c1                	ffreep st(1)
   1400045f2:	8c 61 1f             	mov    WORD PTR [rcx+0x1f],fs
   1400045f5:	ba 46 70 d6 c5       	mov    edx,0xc5d67046
   1400045fa:	45 05 f5 ef 64 57    	rex.RB add eax,0x5764eff5
   140004600:	b4 47                	mov    ah,0x47
   140004602:	b3 cf                	mov    bl,0xcf
   140004604:	44 fd                	rex.R std
   140004606:	15 d7 84 fc f5       	adc    eax,0xf5fc84d7
   14000460b:	ec                   	in     al,dx
   14000460c:	fb                   	sti
   14000460d:	6e                   	outs   dx,BYTE PTR [rsi]
   14000460e:	82                   	(bad)
   14000460f:	82                   	(bad)
   140004610:	e7 68                	out    0x68,eax
   140004612:	f9                   	stc
   140004613:	8c 86 6c 70 47 c5    	mov    WORD PTR [rsi-0x3ab88f94],es
   140004619:	44 eb 30             	rex.R jmp 0x14000464c
   14000461c:	0d 8b 10 cc 82       	or     eax,0x82cc108b
   140004621:	e8 b4 57 d0 c8       	call   0x108d09dda
   140004626:	e5 85                	in     eax,0x85
   140004628:	6a 45                	push   0x45
   14000462a:	be 6b ed 1b cd       	mov    esi,0xcd1bed6b
   14000462f:	8e 50 56             	mov    ss,WORD PTR [rax+0x56]
   140004632:	f5                   	cmc
   140004633:	6f                   	outs   dx,DWORD PTR [rsi]
   140004634:	b2 e6                	mov    dl,0xe6
   140004636:	f5                   	cmc
   140004637:	11 d1                	adc    ecx,edx
   140004639:	d8 01                	fadd   DWORD PTR [rcx]
   14000463b:	86 b8 21 da 82 18    	xchg   BYTE PTR [rax+0x1882da21],bh
   140004641:	86 9c 6d 5f 77 4d 8f 	xchg   BYTE PTR [rbp+rbp*2-0x70b288a1],bl
   140004648:	ef                   	out    dx,eax
   140004649:	1e                   	(bad)
   14000464a:	a2 f8 a4 42 aa 3f 03 	movabs ds:0x6ae033faa42a4f8,al
   140004651:	ae 06 
   140004653:	dc 8b bf ec 60 c4    	fmul   QWORD PTR [rbx-0x3b9f1341]
   140004659:	51                   	push   rcx
   14000465a:	18 8e 75 35 c6 72    	sbb    BYTE PTR [rsi+0x72c63575],cl
   140004660:	1d 5b c8 34 5f       	sbb    eax,0x5f34c85b
   140004665:	51                   	push   rcx
   140004666:	42 19 82 62 4e 36 89 	rex.X sbb DWORD PTR [rdx-0x76c9b19e],eax
   14000466d:	ab                   	stos   DWORD PTR [rdi],eax
   14000466e:	f0 d0 f0             	lock shl al,1
   140004671:	e7 0f                	out    0xf,eax
   140004673:	d9 35 90 eb 86 0e    	fnstenv [rip+0xe86eb90]        # 0x14e873209
   140004679:	f8                   	clc
   14000467a:	93                   	xchg   ebx,eax
   14000467b:	8f                   	(bad)
   14000467c:	ed                   	in     eax,dx
   14000467d:	f3 64 a6             	repz cmps BYTE PTR fs:[rsi],BYTE PTR [rdi]
   140004680:	56                   	push   rsi
   140004681:	2e 68 b5 5d 40 11    	cs push 0x11405db5
   140004687:	db 72 d5             	(bad) [rdx-0x2b]
   14000468a:	28 08                	sub    BYTE PTR [rax],cl
   14000468c:	28 92 6a de 34 53    	sub    BYTE PTR [rdx+0x5334de6a],dl
   140004692:	73 fb                	jae    0x14000468f
   140004694:	d9 71 35             	fnstenv [rcx+0x35]
   140004697:	09 4b a4             	or     DWORD PTR [rbx-0x5c],ecx
   14000469a:	99                   	cdq
   14000469b:	1b b6 f7 7b 18 bc    	sbb    esi,DWORD PTR [rsi-0x43e78409]
   1400046a1:	3c 7f                	cmp    al,0x7f
   1400046a3:	82                   	(bad)
   1400046a4:	fb                   	sti
   1400046a5:	c6                   	(bad)
   1400046a6:	58                   	pop    rax
   1400046a7:	4c f7 d6             	rex.WR not rsi
   1400046aa:	bc f5 62 40 9c       	mov    esp,0x9c4062f5
   1400046af:	ca 27 f2             	retf   0xf227
   1400046b2:	60                   	(bad)
   1400046b3:	cd d3                	int    0xd3
   1400046b5:	88 a1 c3 5e 66 d9    	mov    BYTE PTR [rcx-0x2699a13d],ah
   1400046bb:	95                   	xchg   ebp,eax
   1400046bc:	79 44                	jns    0x140004702
   1400046be:	0c f5                	or     al,0xf5
   1400046c0:	0b 12                	or     edx,DWORD PTR [rdx]
   1400046c2:	2c 6a                	sub    al,0x6a
   1400046c4:	70 ad                	jo     0x140004673
   1400046c6:	89 65 c2             	mov    DWORD PTR [rbp-0x3e],esp
   1400046c9:	d8 44 85 92          	fadd   DWORD PTR [rbp+rax*4-0x6e]
   1400046cd:	fd                   	std
   1400046ce:	a3 0c 66 1b 50 4b bd 	movabs ds:0x6b18bd4b501b660c,eax
   1400046d5:	18 6b 
   1400046d7:	4c dc ad d6 12 12 74 	rex.WR fsubr QWORD PTR [rbp+0x741212d6]
   1400046de:	07                   	(bad)
   1400046df:	ce                   	(bad)
   1400046e0:	5a                   	pop    rdx
   1400046e1:	39 f8                	cmp    eax,edi
   1400046e3:	5d                   	pop    rbp
   1400046e4:	a6                   	cmps   BYTE PTR [rsi],BYTE PTR [rdi]
   1400046e5:	bd 95 59 bf e6       	mov    ebp,0xe6bf5995
   1400046ea:	8d                   	lea    esp,(bad)
   1400046eb:	e4 4a                	in     al,0x4a
   1400046ed:	3d b3 b6 3a ba       	cmp    eax,0xba3ab6b3
   1400046f2:	45 01 b9 38 8b 23 cd 	add    DWORD PTR [r9-0x32dc74c8],r15d
   1400046f9:	d7                   	xlat   BYTE PTR [rbx]
   1400046fa:	df 27                	fbld   TBYTE PTR [rdi]
   1400046fc:	70 4a                	jo     0x140004748
   1400046fe:	51                   	push   rcx
   1400046ff:	9b                   	fwait
   140004700:	e8 c2 83 ed 89       	call   0xc9edcac7
   140004705:	71 a7                	jno    0x1400046ae
   140004707:	f0 56                	lock push rsi
   140004709:	87 6d 1d             	xchg   DWORD PTR [rbp+0x1d],ebp
   14000470c:	ca 6f 3c             	retf   0x3c6f
   14000470f:	84 de                	test   dh,bl
   140004711:	af                   	scas   eax,DWORD PTR [rdi]
   140004712:	e1 62                	loope  0x140004776
   140004714:	d1 66 4a             	shl    DWORD PTR [rsi+0x4a],1
   140004717:	ed                   	in     eax,dx
   140004718:	5c                   	pop    rsp
   140004719:	f5                   	cmc
   14000471a:	30 85 49 c7 96 b2    	xor    BYTE PTR [rbp-0x4d6938b7],al
   140004720:	58                   	pop    rax
   140004721:	07                   	(bad)
   140004722:	74 2a                	je     0x14000474e
   140004724:	f4                   	hlt
   140004725:	f3 6b df 1b          	repz imul ebx,edi,0x1b
   140004729:	3b 47 aa             	cmp    eax,DWORD PTR [rdi-0x56]
   14000472c:	ae                   	scas   al,BYTE PTR [rdi]
   14000472d:	85 2b                	test   DWORD PTR [rbx],ebp
   14000472f:	e4 f5                	in     al,0xf5
   140004731:	72 5f                	jb     0x140004792
   140004733:	2c fa                	sub    al,0xfa
   140004735:	16                   	(bad)
   140004736:	44 d7                	rex.R xlat BYTE PTR [rbx]
   140004738:	8e fe                	mov    ?,esi
   14000473a:	a0 84 a9 3c 1c 7e 0b 	movabs al,ds:0x69630b7e1c3ca984
   140004741:	63 69 
   140004743:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140004744:	41 99                	rex.B cdq
   140004746:	27                   	(bad)
   140004747:	b4 b9                	mov    ah,0xb9
   140004749:	8a b3 ad ab 92 e4    	mov    dh,BYTE PTR [rbx-0x1b6d5453]
   14000474f:	f1                   	int1
   140004750:	9f                   	lahf
   140004751:	a0 bd 35 90 3d 4e 31 	movabs al,ds:0xedb0314e3d9035bd
   140004758:	b0 ed 
   14000475a:	e0 27                	loopne 0x140004783
   14000475c:	9f                   	lahf
   14000475d:	68 9f 0a d3 b7       	push   0xffffffffb7d30a9f
   140004762:	d0 9b 34 15 54 d0    	rcr    BYTE PTR [rbx-0x2fabeacc],1
   140004768:	5f                   	pop    rdi
   140004769:	91                   	xchg   ecx,eax
   14000476a:	9f                   	lahf
   14000476b:	88 a3 10 4e 87 38    	mov    BYTE PTR [rbx+0x38874e10],ah
   140004771:	72 18                	jb     0x14000478b
   140004773:	9f                   	lahf
   140004774:	2f                   	(bad)
   140004775:	25 9a 3d cc 66       	and    eax,0x66cc3d9a
   14000477a:	41 ee                	rex.B out dx,al
   14000477c:	9b                   	fwait
   14000477d:	12 fa                	adc    bh,dl
   14000477f:	8b 4a 39             	mov    ecx,DWORD PTR [rdx+0x39]
   140004782:	46                   	rex.RX
   140004783:	46                   	rex.RX
   140004784:	66 a3 00 de e7 9d 08 	movabs ds:0x1c860e089de7de00,ax
   14000478b:	0e 86 1c 
   14000478e:	42 a7                	rex.X cmps DWORD PTR [rsi],DWORD PTR [rdi]
   140004790:	5d                   	pop    rbp
   140004791:	62 34 36 39 27       	(bad)
   140004796:	b0 37                	mov    al,0x37
   140004798:	56                   	push   rsi
   140004799:	a1 44 a9 bb 1e 1f 03 	movabs eax,ds:0x60a9031f1ebba944
   1400047a0:	a9 60 
   1400047a2:	23 91 7b 13 e2 0c    	and    edx,DWORD PTR [rcx+0xce2137b]
   1400047a8:	c4                   	(bad)
   1400047a9:	a6                   	cmps   BYTE PTR [rsi],BYTE PTR [rdi]
   1400047aa:	5d                   	pop    rbp
   1400047ab:	ec                   	in     al,dx
   1400047ac:	78 1b                	js     0x1400047c9
   1400047ae:	98                   	cwde
   1400047af:	d4                   	(bad)
   1400047b0:	4a c2 c0 5e          	rex.WX ret 0x5ec0
   1400047b4:	93                   	xchg   ebx,eax
   1400047b5:	64 1c 13             	fs sbb al,0x13
   1400047b8:	0a 94 81 e3 3d a4 1d 	or     dl,BYTE PTR [rcx+rax*4+0x1da43de3]
   1400047bf:	89 51 b8             	mov    DWORD PTR [rcx-0x48],edx
   1400047c2:	ca ed 02             	retf   0x2ed
   1400047c5:	85 56 f3             	test   DWORD PTR [rsi-0xd],edx
   1400047c8:	7a df                	jp     0x1400047a9
   1400047ca:	ec                   	in     al,dx
   1400047cb:	68 0c 0f aa 91       	push   0xffffffff91aa0f0c
   1400047d0:	c2 99 87             	ret    0x8799
   1400047d3:	6c                   	ins    BYTE PTR [rdi],dx
   1400047d4:	fa                   	cli
   1400047d5:	c2 cf 23             	ret    0x23cf
   1400047d8:	01 bb 7d 22 b7 72    	add    DWORD PTR [rbx+0x72b7227d],edi
   1400047de:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   1400047df:	67 75 bb             	addr32 jne 0x14000479d
   1400047e2:	af                   	scas   eax,DWORD PTR [rdi]
   1400047e3:	62 ad 6e 55 f1       	(bad)
   1400047e8:	4a cf                	rex.WX iretq
   1400047ea:	83 a3 a0 fa fa 58 0b 	and    DWORD PTR [rbx+0x58fafaa0],0xb
   1400047f1:	73 ed                	jae    0x1400047e0
   1400047f3:	ab                   	stos   DWORD PTR [rdi],eax
   1400047f4:	7e 80                	jle    0x140004776
   1400047f6:	cc                   	int3
   1400047f7:	fa                   	cli
   1400047f8:	64 d8 71 ac          	fdiv   DWORD PTR fs:[rcx-0x54]
   1400047fc:	33 96 ff 1f ea 5d    	xor    edx,DWORD PTR [rsi+0x5dea1fff]
   140004802:	dc 5e c4             	fcomp  QWORD PTR [rsi-0x3c]
   140004805:	8c 7c 3a 94          	mov    WORD PTR [rdx+rdi*1-0x6c],?
   140004809:	d3 bf ae bc d5 9b    	sar    DWORD PTR [rdi-0x642a4352],cl
   14000480f:	3d 95 9a 6c 3c       	cmp    eax,0x3c6c9a95
   140004814:	88 f1                	mov    cl,dh
   140004816:	82                   	(bad)
   140004817:	21 92 9b c4 49 7b    	and    DWORD PTR [rdx+0x7b49c49b],edx
   14000481d:	92                   	xchg   edx,eax
   14000481e:	a7                   	cmps   DWORD PTR [rsi],DWORD PTR [rdi]
   14000481f:	8c 2c f6             	mov    WORD PTR [rsi+rsi*8],gs
   140004822:	6c                   	ins    BYTE PTR [rdi],dx
   140004823:	49                   	rex.WB
   140004824:	2e 79 3f             	cs jns 0x140004866
   140004827:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140004828:	d5 cc 82             	(bad)
   14000482b:	c4                   	(bad)
   14000482c:	1f                   	(bad)
   14000482d:	0a 6d a6             	or     ch,BYTE PTR [rbp-0x5a]
   140004830:	b0 ae                	mov    al,0xae
   140004832:	c7                   	(bad)
   140004833:	b0 75                	mov    al,0x75
   140004835:	81 76 2f d4 03 91 f6 	xor    DWORD PTR [rsi+0x2f],0xf69103d4
   14000483c:	2b c4                	sub    eax,esp
   14000483e:	07                   	(bad)
   14000483f:	d8 a2 47 ae be 67    	fsub   DWORD PTR [rdx+0x67beae47]
   140004845:	72 d7                	jb     0x14000481e
   140004847:	35 f5 d7 9b 39       	xor    eax,0x399bd7f5
   14000484c:	07                   	(bad)
   14000484d:	b5 68                	mov    ch,0x68
   14000484f:	b5 b7                	mov    ch,0xb7
   140004851:	18 ff                	sbb    bh,bh
   140004853:	fb                   	sti
   140004854:	a7                   	cmps   DWORD PTR [rsi],DWORD PTR [rdi]
   140004855:	9d                   	popf
   140004856:	14 62                	adc    al,0x62
   140004858:	96                   	xchg   esi,eax
   140004859:	4b b8 15 49 71 af e0 	rex.WXB movabs r8,0xddbb0be0af714915
   140004860:	0b bb dd 
   140004863:	26 cc                	es int3
   140004865:	0e                   	(bad)
   140004866:	77 8b                	ja     0x1400047f3
   140004868:	72 26                	jb     0x140004890
   14000486a:	d0 db                	rcr    bl,1
   14000486c:	35 40 a6 32 75       	xor    eax,0x7532a640
   140004871:	4d ac                	rex.WRB lods al,BYTE PTR [rsi]
   140004873:	ae                   	scas   al,BYTE PTR [rdi]
   140004874:	39 7f 7a             	cmp    DWORD PTR [rdi+0x7a],edi
   140004877:	01 15 3a 56 62 a4    	add    DWORD PTR [rip+0xffffffffa462563a],edx        # 0xe4629eb7
   14000487d:	90                   	nop
   14000487e:	e4 0a                	in     al,0xa
   140004880:	f3 17                	repz (bad)
   140004882:	07                   	(bad)
   140004883:	54                   	push   rsp
   140004884:	0e                   	(bad)
   140004885:	b6 45                	mov    dh,0x45
   140004887:	2c 64                	sub    al,0x64
   140004889:	24 3f                	and    al,0x3f
   14000488b:	c5 a7 40             	(bad)
   14000488e:	4f 86 f8             	rex.WRXB xchg r8b,r15b
   140004891:	1f                   	(bad)
   140004892:	2e d5 a8 67 a0 d8 3b 	cs {rex2 0xa8} packuswb mm4,QWORD PTR [rax-0x58f0c428]
   140004899:	0f a7 
   14000489b:	27                   	(bad)
   14000489c:	90                   	nop
   14000489d:	bf 8e d1 8d ac       	mov    edi,0xac8dd18e
   1400048a2:	5b                   	pop    rbx
   1400048a3:	df 87 4f 19 06 96    	fild   WORD PTR [rdi-0x69f9e6b1]
   1400048a9:	b3 28                	mov    bl,0x28
   1400048ab:	07                   	(bad)
   1400048ac:	a0 6b 26 48 c6 e5 58 	movabs al,ds:0x635158e5c648266b
   1400048b3:	51 63 
   1400048b5:	0e                   	(bad)
   1400048b6:	21 f0                	and    eax,esi
   1400048b8:	13 34 97             	adc    esi,DWORD PTR [rdi+rdx*4]
   1400048bb:	cd 30                	int    0x30
   1400048bd:	b2 ca                	mov    dl,0xca
   1400048bf:	9d                   	popf
   1400048c0:	d7                   	xlat   BYTE PTR [rbx]
   1400048c1:	c6                   	(bad)
   1400048c2:	5f                   	pop    rdi
   1400048c3:	15 f8 c7 1c d2       	adc    eax,0xd21cc7f8
   1400048c8:	54                   	push   rsp
   1400048c9:	8c 2a                	mov    WORD PTR [rdx],gs
   1400048cb:	3f                   	(bad)
   1400048cc:	da b3 75 b4 a1 2e    	fidiv  DWORD PTR [rbx+0x2ea1b475]
   1400048d2:	b3 a0                	mov    bl,0xa0
   1400048d4:	72 bf                	jb     0x140004895
   1400048d6:	04 16                	add    al,0x16
   1400048d8:	4c f9                	rex.WR stc
   1400048da:	ac                   	lods   al,BYTE PTR [rsi]
   1400048db:	2d ab d8 2c 46       	sub    eax,0x462cd8ab
   1400048e0:	7f 6f                	jg     0x140004951
   1400048e2:	0c e1                	or     al,0xe1
   1400048e4:	99                   	cdq
   1400048e5:	12 59 4d             	adc    bl,BYTE PTR [rcx+0x4d]
   1400048e8:	5d                   	pop    rbp
   1400048e9:	bc 90 cd 6f 2e       	mov    esp,0x2e6fcd90
   1400048ee:	89 f4                	mov    esp,esi
   1400048f0:	2f                   	(bad)
   1400048f1:	a8 47                	test   al,0x47
   1400048f3:	c2 79 17             	ret    0x1779
   1400048f6:	2f                   	(bad)
   1400048f7:	c7 b8 7e a0 30       	xbegin (bad),0x170a0c7b4
   1400048fc:	cf                   	iret
   1400048fd:	f1                   	int1
   1400048fe:	74 b4                	je     0x1400048b4
   140004900:	52                   	push   rdx
   140004901:	82                   	(bad)
   140004902:	cc                   	int3
   140004903:	b1 79                	mov    cl,0x79
   140004905:	ce                   	(bad)
   140004906:	6c                   	ins    BYTE PTR [rdi],dx
   140004907:	b8 17 4f 58 40       	mov    eax,0x40584f17
   14000490c:	f3 bc e4 e4 31 07    	repz mov esp,0x731e4e4
   140004912:	5a                   	pop    rdx
   140004913:	b5 22                	mov    ch,0x22
   140004915:	af                   	scas   eax,DWORD PTR [rdi]
   140004916:	25 5d 9e 61 90       	and    eax,0x90619e5d
   14000491b:	f0 d6                	lock udb
   14000491d:	5d                   	pop    rbp
   14000491e:	63 b3 07 dd 07 80    	movsxd esi,DWORD PTR [rbx-0x7ff822f9]
   140004924:	3b 65 b2             	cmp    esp,DWORD PTR [rbp-0x4e]
   140004927:	ce                   	(bad)
   140004928:	ef                   	out    dx,eax
   140004929:	f9                   	stc
   14000492a:	44 ad                	rex.R lods eax,DWORD PTR [rsi]
   14000492c:	91                   	xchg   ecx,eax
   14000492d:	3a 01                	cmp    al,BYTE PTR [rcx]
   14000492f:	e5 a9                	in     eax,0xa9
   140004931:	02 73 e3             	add    dh,BYTE PTR [rbx-0x1d]
   140004934:	0d 92 c4 1f ed       	or     eax,0xed1fc492
   140004939:	d9 e9                	fldl2t
   14000493b:	3b e5                	cmp    esp,ebp
   14000493d:	38 69 f4             	cmp    BYTE PTR [rcx-0xc],ch
   140004940:	19 df                	sbb    edi,ebx
   140004942:	1d 25 c1 07 e6       	sbb    eax,0xe607c125
   140004947:	2b 35 8b 31 03 e9    	sub    esi,DWORD PTR [rip+0xffffffffe903318b]        # 0x129037ad8
   14000494d:	80 a8 95 da 57 93 38 	sub    BYTE PTR [rax-0x6ca8256b],0x38
   140004954:	70 4e                	jo     0x1400049a4
   140004956:	58                   	pop    rax
   140004957:	a1 58 13 5a 2e 83 ba 	movabs eax,ds:0xd6b7ba832e5a1358
   14000495e:	b7 d6 
   140004960:	37                   	(bad)
   140004961:	66 d6                	data16 udb
   140004963:	3f                   	(bad)
   140004964:	52                   	push   rdx
   140004965:	d9 b9 31 76 52 bd    	fnstcw WORD PTR [rcx-0x42ad89cf]
   14000496b:	7c d4                	jl     0x140004941
   14000496d:	e3 70                	jrcxz  0x1400049df
   14000496f:	a2 e0 0a 2d 0c b2 73 	movabs ds:0x81a573b20c2d0ae0,al
   140004976:	a5 81 
   140004978:	6a 15                	push   0x15
   14000497a:	0b b9 71 52 a5 5e    	or     edi,DWORD PTR [rcx+0x5ea55271]
   140004980:	cd 6c                	int    0x6c
   140004982:	27                   	(bad)
   140004983:	89 aa b1 50 20 5a    	mov    DWORD PTR [rdx+0x5a2050b1],ebp
   140004989:	ae                   	scas   al,BYTE PTR [rdi]
   14000498a:	bf e3 54 53 0a       	mov    edi,0xa5354e3
   14000498f:	a3 8d fb f4 41 62 80 	movabs ds:0x1a66806241f4fb8d,eax
   140004996:	66 1a 
   140004998:	75 1e                	jne    0x1400049b8
   14000499a:	5c                   	pop    rsp
   14000499b:	cb                   	retf
   14000499c:	8b 48 2d             	mov    ecx,DWORD PTR [rax+0x2d]
   14000499f:	95                   	xchg   ebp,eax
   1400049a0:	f4                   	hlt
   1400049a1:	22 a1 6a bc 4e b9    	and    ah,BYTE PTR [rcx-0x46b14396]
   1400049a7:	93                   	xchg   ebx,eax
   1400049a8:	20 18                	and    BYTE PTR [rax],bl
   1400049aa:	a7                   	cmps   DWORD PTR [rsi],DWORD PTR [rdi]
   1400049ab:	ac                   	lods   al,BYTE PTR [rsi]
   1400049ac:	df a6 b4 2a 12 78    	fbld   TBYTE PTR [rsi+0x78122ab4]
   1400049b2:	0d 98 fe 48 2a       	or     eax,0x2a48fe98
   1400049b7:	96                   	xchg   esi,eax
   1400049b8:	62 1d ba 7e 92       	(bad)
   1400049bd:	0b 00                	or     eax,DWORD PTR [rax]
   1400049bf:	25 13 4b f5 be       	and    eax,0xbef54b13
   1400049c4:	dd ce                	(bad)
   1400049c6:	10 6b 30             	adc    BYTE PTR [rbx+0x30],ch
   1400049c9:	71 f8                	jno    0x1400049c3
   1400049cb:	86 48 7f             	xchg   BYTE PTR [rax+0x7f],cl
   1400049ce:	d0 e9                	shr    cl,1
   1400049d0:	a5                   	movs   DWORD PTR [rdi],DWORD PTR [rsi]
   1400049d1:	81 cd 87 a2 83 b4    	or     ebp,0xb483a287
   1400049d7:	5e                   	pop    rsi
   1400049d8:	b6 2d                	mov    dh,0x2d
   1400049da:	ae                   	scas   al,BYTE PTR [rdi]
   1400049db:	5d                   	pop    rbp
   1400049dc:	0d 4e 9d c2 75       	or     eax,0x75c29d4e
   1400049e1:	c5 22 bf             	(bad)
   1400049e4:	f4                   	hlt
   1400049e5:	f0 e5 aa             	lock in eax,0xaa
   1400049e8:	87 b8 e0 a8 63 2a    	xchg   DWORD PTR [rax+0x2a63a8e0],edi
   1400049ee:	c2 d8 dd             	ret    0xddd8
   1400049f1:	31 90 2a b0 6e 00    	xor    DWORD PTR [rax+0x6eb02a],edx
   1400049f7:	73 50                	jae    0x140004a49
   1400049f9:	68 cf f6 99 62       	push   0x6299f6cf
   1400049fe:	29 12                	sub    DWORD PTR [rdx],edx
   140004a00:	e9 d4 fd fb 94       	jmp    0xd4fc47d9
   140004a05:	90                   	nop
   140004a06:	d4                   	(bad)
   140004a07:	a8 6d                	test   al,0x6d
   140004a09:	1a 99 a4 77 e5 48    	sbb    bl,BYTE PTR [rcx+0x48e577a4]
   140004a0f:	d3 89 95 36 e1 bf    	ror    DWORD PTR [rcx-0x401ec96b],cl
   140004a15:	0d f5 7a 51 61       	or     eax,0x61517af5
   140004a1a:	e7 80                	out    0x80,eax
   140004a1c:	d0 3b                	sar    BYTE PTR [rbx],1
   140004a1e:	91                   	xchg   ecx,eax
   140004a1f:	13 47 49             	adc    eax,DWORD PTR [rdi+0x49]
   140004a22:	23 45 80             	and    eax,DWORD PTR [rbp-0x80]
   140004a25:	91                   	xchg   ecx,eax
   140004a26:	53                   	push   rbx
   140004a27:	c7                   	(bad)
   140004a28:	9f                   	lahf
   140004a29:	78 d8                	js     0x140004a03
   140004a2b:	7d 8a                	jge    0x1400049b7
   140004a2d:	cb                   	retf
   140004a2e:	a4                   	movs   BYTE PTR [rdi],BYTE PTR [rsi]
   140004a2f:	d8 ff                	fdivr  st,st(7)
   140004a31:	f5                   	cmc
   140004a32:	cd 72                	int    0x72
   140004a34:	85 6e 2a             	test   DWORD PTR [rsi+0x2a],ebp
   140004a37:	a5                   	movs   DWORD PTR [rdi],DWORD PTR [rsi]
   140004a38:	1f                   	(bad)
   140004a39:	c1 ab 2d 3a 3e e2 74 	shr    DWORD PTR [rbx-0x1dc1c5d3],0x74
   140004a40:	6f                   	outs   dx,DWORD PTR [rsi]
   140004a41:	5e                   	pop    rsi
   140004a42:	34 f2                	xor    al,0xf2
   140004a44:	d2 10                	rcl    BYTE PTR [rax],cl
   140004a46:	45 7d 40             	rex.RB jge 0x140004a89
   140004a49:	a2 bf ce 66 aa 2c 25 	movabs ds:0x2ad2252caa66cebf,al
   140004a50:	d2 2a 
   140004a52:	f4                   	hlt
   140004a53:	ae                   	scas   al,BYTE PTR [rdi]
   140004a54:	46 34 9f             	rex.RX xor al,0x9f
   140004a57:	15 3b 5d 57 05       	adc    eax,0x5575d3b
   140004a5c:	cc                   	int3
   140004a5d:	ba 2b 2b 36 a2       	mov    edx,0xa2362b2b
   140004a62:	8b 50 78             	mov    edx,DWORD PTR [rax+0x78]
   140004a65:	06                   	(bad)
   140004a66:	ec                   	in     al,dx
   140004a67:	2c b8                	sub    al,0xb8
   140004a69:	41 19 29             	sbb    DWORD PTR [r9],ebp
   140004a6c:	da ce                	fcmove st,st(6)
   140004a6e:	01 e9                	add    ecx,ebp
   140004a70:	c9                   	leave
   140004a71:	0b 45 62             	or     eax,DWORD PTR [rbp+0x62]
   140004a74:	83 79 26 57          	cmp    DWORD PTR [rcx+0x26],0x57
   140004a78:	f4                   	hlt
   140004a79:	1e                   	(bad)
   140004a7a:	d5 ba 79 12          	{rex2 0xba} vmwrite rdx,QWORD PTR [r18]
   140004a7e:	3d 40 a1 5d f4       	cmp    eax,0xf45da140
   140004a83:	4d d2 9a c7 5a bf c4 	rex.WRB rcr BYTE PTR [r10-0x3b40a539],cl
   140004a8a:	3f                   	(bad)
   140004a8b:	c9                   	leave
   140004a8c:	cc                   	int3
   140004a8d:	ed                   	in     eax,dx
   140004a8e:	ba 91 23 58 20       	mov    edx,0x20582391
   140004a93:	0e                   	(bad)
   140004a94:	e4 4a                	in     al,0x4a
   140004a96:	7e cf                	jle    0x140004a67
   140004a98:	6a ea                	push   0xffffffffffffffea
   140004a9a:	6b 6b e9 9e          	imul   ebp,DWORD PTR [rbx-0x17],0xffffff9e
   140004a9e:	c0 9f 89 74 e3 de 17 	rcr    BYTE PTR [rdi-0x211c8b77],0x17
   140004aa5:	53                   	push   rbx
   140004aa6:	9d                   	popf
   140004aa7:	05 94 29 5c 68       	add    eax,0x685c2994
   140004aac:	6e                   	outs   dx,BYTE PTR [rsi]
   140004aad:	2c d3                	sub    al,0xd3
   140004aaf:	63 0b                	movsxd ecx,DWORD PTR [rbx]
   140004ab1:	a2 4a 73 3d 75 cf 39 	movabs ds:0xef7639cf753d734a,al
   140004ab8:	76 ef 
   140004aba:	c5 57 0b             	(bad)
   140004abd:	00 4c 96 b5          	add    BYTE PTR [rsi+rdx*4-0x4b],cl
   140004ac1:	62 52 1c bd f8       	(bad)
   140004ac6:	db 2c 98             	fld    TBYTE PTR [rax+rbx*4]
   140004ac9:	55                   	push   rbp
   140004aca:	b8 ba 31 db b0       	mov    eax,0xb0db31ba
   140004acf:	3e 4c b1 b3          	ds rex.WR mov cl,0xb3
   140004ad3:	65 56                	gs push rsi
   140004ad5:	69 3c 4a b2 e8 34 91 	imul   edi,DWORD PTR [rdx+rcx*2],0x9134e8b2
   140004adc:	b8 01 ec 0b 76       	mov    eax,0x760bec01
   140004ae1:	d5 40 f1             	{rex2 0x40} int1
   140004ae4:	b1 37                	mov    cl,0x37
   140004ae6:	51                   	push   rcx
   140004ae7:	26 51                	es push rcx
   140004ae9:	00 c5                	add    ch,al
   140004aeb:	93                   	xchg   ebx,eax
   140004aec:	30 3e                	xor    BYTE PTR [rsi],bh
   140004aee:	8a 46 5b             	mov    al,BYTE PTR [rsi+0x5b]
   140004af1:	4e 9a                	rex.WRX (bad)
   140004af3:	0c 19                	or     al,0x19
   140004af5:	32 69 3d             	xor    ch,BYTE PTR [rcx+0x3d]
   140004af8:	72 33                	jb     0x140004b2d
   140004afa:	78 81                	js     0x140004a7d
   140004afc:	90                   	nop
   140004afd:	04 8e                	add    al,0x8e
   140004aff:	65 a8 23             	gs test al,0x23
   140004b02:	37                   	(bad)
   140004b03:	ab                   	stos   DWORD PTR [rdi],eax
   140004b04:	b7 ab                	mov    bh,0xab
   140004b06:	1e                   	(bad)
   140004b07:	2d f8 ca db 9e       	sub    eax,0x9edbcaf8
   140004b0c:	e9 2e a1 c9 8f       	jmp    0xcfc9ec3f
   140004b11:	8a 98 42 41 2d e4    	mov    bl,BYTE PTR [rax-0x1bd2bebe]
   140004b17:	da 37                	fidiv  DWORD PTR [rdi]
   140004b19:	5d                   	pop    rbp
   140004b1a:	7c dc                	jl     0x140004af8
   140004b1c:	09 08                	or     DWORD PTR [rax],ecx
   140004b1e:	cc                   	int3
   140004b1f:	cd 00                	int    0x0
   140004b21:	00 00                	add    BYTE PTR [rax],al
   140004b23:	00 00                	add    BYTE PTR [rax],al
   140004b25:	00 0b                	add    BYTE PTR [rbx],cl
   140004b27:	0a 00                	or     al,BYTE PTR [rax]
   140004b29:	00 0e                	add    BYTE PTR [rsi],cl
	...
   140004b4b:	00 00                	add    BYTE PTR [rax],al
   140004b4d:	11 00                	adc    DWORD PTR [rax],eax
	...
   140004b57:	00 00                	add    BYTE PTR [rax],al
   140004b59:	00 04 00             	add    BYTE PTR [rax+rax*1],al
   140004b5c:	00 00                	add    BYTE PTR [rax],al
   140004b5e:	15 00 00 00 00       	adc    eax,0x0
	...
   140004b6b:	00 00                	add    BYTE PTR [rax],al
   140004b6d:	10 00                	adc    BYTE PTR [rax],al
   140004b6f:	00 00                	add    BYTE PTR [rax],al
   140004b71:	00 00                	add    BYTE PTR [rax],al
   140004b73:	00 05 00 00 00 00    	add    BYTE PTR [rip+0x0],al        # 0x140004b79
   140004b79:	06                   	(bad)
   140004b7a:	00 00                	add    BYTE PTR [rax],al
   140004b7c:	00 00                	add    BYTE PTR [rax],al
   140004b7e:	03 00                	add    eax,DWORD PTR [rax]
   140004b80:	00 00                	add    BYTE PTR [rax],al
   140004b82:	00 00                	add    BYTE PTR [rax],al
   140004b84:	0d 00 00 00 00       	or     eax,0x0
	...
   140004b95:	00 00                	add    BYTE PTR [rax],al
   140004b97:	00 07                	add    BYTE PTR [rdi],al
   140004b99:	12 00                	adc    al,BYTE PTR [rax]
	...
   140004baf:	00 00                	add    BYTE PTR [rax],al
   140004bb1:	0c 00                	or     al,0x0
   140004bb3:	00 00                	add    BYTE PTR [rax],al
   140004bb5:	14 00                	adc    al,0x0
   140004bb7:	00 01                	add    BYTE PTR [rcx],al
	...
   140004bc5:	08 00                	or     BYTE PTR [rax],al
	...
   140004bef:	00 00                	add    BYTE PTR [rax],al
   140004bf1:	02 00                	add    al,BYTE PTR [rax]
	...
   140004bfb:	00 09                	add    BYTE PTR [rcx],cl
   140004bfd:	00 00                	add    BYTE PTR [rax],al
   140004bff:	00 00                	add    BYTE PTR [rax],al
   140004c01:	13 00                	adc    eax,DWORD PTR [rax]
	...
   140004c17:	00 00                	add    BYTE PTR [rax],al
   140004c19:	00 0f                	add    BYTE PTR [rdi],cl
   140004c1b:	00 00                	add    BYTE PTR [rax],al
   140004c1d:	00 00                	add    BYTE PTR [rax],al
   140004c1f:	00 50 18             	add    BYTE PTR [rax+0x18],dl
   140004c22:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140004c41:	c0 00 40             	rol    BYTE PTR [rax],0x40
   140004c44:	01 00                	add    DWORD PTR [rax],eax
   140004c46:	00 00                	add    BYTE PTR [rax],al
   140004c48:	08 c0                	or     al,al
   140004c4a:	00 40 01             	add    BYTE PTR [rax+0x1],al
   140004c4d:	00 00                	add    BYTE PTR [rax],al
   140004c4f:	00 7c 80 00          	add    BYTE PTR [rax+rax*4+0x0],bh
   140004c53:	40 01 00             	rex add DWORD PTR [rax],eax
   140004c56:	00 00                	add    BYTE PTR [rax],al
   140004c58:	38 b0 00 40 01 00    	cmp    BYTE PTR [rax+0x14000],dh
	...
   140004c7e:	00 00                	add    BYTE PTR [rax],al
   140004c80:	41 72 67             	rex.B jb 0x140004cea
   140004c83:	75 6d                	jne    0x140004cf2
   140004c85:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
   140004c87:	74 20                	je     0x140004ca9
   140004c89:	64 6f                	outs   dx,DWORD PTR fs:[rsi]
   140004c8b:	6d                   	ins    DWORD PTR [rdi],dx
   140004c8c:	61                   	(bad)
   140004c8d:	69 6e 20 65 72 72 6f 	imul   ebp,DWORD PTR [rsi+0x20],0x6f727265
   140004c94:	72 20                	jb     0x140004cb6
   140004c96:	28 44 4f 4d          	sub    BYTE PTR [rdi+rcx*2+0x4d],al
   140004c9a:	41                   	rex.B
   140004c9b:	49                   	rex.WB
   140004c9c:	4e 29 00             	rex.WRX sub QWORD PTR [rax],r8
   140004c9f:	41 72 67             	rex.B jb 0x140004d09
   140004ca2:	75 6d                	jne    0x140004d11
   140004ca4:	65 6e                	outs   dx,BYTE PTR gs:[rsi]
   140004ca6:	74 20                	je     0x140004cc8
   140004ca8:	73 69                	jae    0x140004d13
   140004caa:	6e                   	outs   dx,BYTE PTR [rsi]
   140004cab:	67 75 6c             	addr32 jne 0x140004d1a
   140004cae:	61                   	(bad)
   140004caf:	72 69                	jb     0x140004d1a
   140004cb1:	74 79                	je     0x140004d2c
   140004cb3:	20 28                	and    BYTE PTR [rax],ch
   140004cb5:	53                   	push   rbx
   140004cb6:	49                   	rex.WB
   140004cb7:	47                   	rex.RXB
   140004cb8:	4e 29 00             	rex.WRX sub QWORD PTR [rax],r8
   140004cbb:	00 00                	add    BYTE PTR [rax],al
   140004cbd:	00 00                	add    BYTE PTR [rax],al
   140004cbf:	00 4f 76             	add    BYTE PTR [rdi+0x76],cl
   140004cc2:	65 72 66             	gs jb  0x140004d2b
   140004cc5:	6c                   	ins    BYTE PTR [rdi],dx
   140004cc6:	6f                   	outs   dx,DWORD PTR [rsi]
   140004cc7:	77 20                	ja     0x140004ce9
   140004cc9:	72 61                	jb     0x140004d2c
   140004ccb:	6e                   	outs   dx,BYTE PTR [rsi]
   140004ccc:	67 65 20 65 72       	and    BYTE PTR gs:[ebp+0x72],ah
   140004cd1:	72 6f                	jb     0x140004d42
   140004cd3:	72 20                	jb     0x140004cf5
   140004cd5:	28 4f 56             	sub    BYTE PTR [rdi+0x56],cl
   140004cd8:	45 52                	rex.RB push r10
   140004cda:	46                   	rex.RX
   140004cdb:	4c                   	rex.WR
   140004cdc:	4f 57                	rex.WRXB push r15
   140004cde:	29 00                	sub    DWORD PTR [rax],eax
   140004ce0:	50                   	push   rax
   140004ce1:	61                   	(bad)
   140004ce2:	72 74                	jb     0x140004d58
   140004ce4:	69 61 6c 20 6c 6f 73 	imul   esp,DWORD PTR [rcx+0x6c],0x736f6c20
   140004ceb:	73 20                	jae    0x140004d0d
   140004ced:	6f                   	outs   dx,DWORD PTR [rsi]
   140004cee:	66 20 73 69          	data16 and BYTE PTR [rbx+0x69],dh
   140004cf2:	67 6e                	outs   dx,BYTE PTR [esi]
   140004cf4:	69 66 69 63 61 6e 63 	imul   esp,DWORD PTR [rsi+0x69],0x636e6163
   140004cfb:	65 20 28             	and    BYTE PTR gs:[rax],ch
   140004cfe:	50                   	push   rax
   140004cff:	4c                   	rex.WR
   140004d00:	4f 53                	rex.WRXB push r11
   140004d02:	53                   	push   rbx
   140004d03:	29 00                	sub    DWORD PTR [rax],eax
   140004d05:	00 00                	add    BYTE PTR [rax],al
   140004d07:	00 54 6f 74          	add    BYTE PTR [rdi+rbp*2+0x74],dl
   140004d0b:	61                   	(bad)
   140004d0c:	6c                   	ins    BYTE PTR [rdi],dx
   140004d0d:	20 6c 6f 73          	and    BYTE PTR [rdi+rbp*2+0x73],ch
   140004d11:	73 20                	jae    0x140004d33
   140004d13:	6f                   	outs   dx,DWORD PTR [rsi]
   140004d14:	66 20 73 69          	data16 and BYTE PTR [rbx+0x69],dh
   140004d18:	67 6e                	outs   dx,BYTE PTR [esi]
   140004d1a:	69 66 69 63 61 6e 63 	imul   esp,DWORD PTR [rsi+0x69],0x636e6163
   140004d21:	65 20 28             	and    BYTE PTR gs:[rax],ch
   140004d24:	54                   	push   rsp
   140004d25:	4c                   	rex.WR
   140004d26:	4f 53                	rex.WRXB push r11
   140004d28:	53                   	push   rbx
   140004d29:	29 00                	sub    DWORD PTR [rax],eax
   140004d2b:	00 00                	add    BYTE PTR [rax],al
   140004d2d:	00 00                	add    BYTE PTR [rax],al
   140004d2f:	00 54 68 65          	add    BYTE PTR [rax+rbp*2+0x65],dl
   140004d33:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
   140004d36:	73 75                	jae    0x140004dad
   140004d38:	6c                   	ins    BYTE PTR [rdi],dx
   140004d39:	74 20                	je     0x140004d5b
   140004d3b:	69 73 20 74 6f 6f 20 	imul   esi,DWORD PTR [rbx+0x20],0x206f6f74
   140004d42:	73 6d                	jae    0x140004db1
   140004d44:	61                   	(bad)
   140004d45:	6c                   	ins    BYTE PTR [rdi],dx
   140004d46:	6c                   	ins    BYTE PTR [rdi],dx
   140004d47:	20 74 6f 20          	and    BYTE PTR [rdi+rbp*2+0x20],dh
   140004d4b:	62 65 20 72 65       	(bad)
   140004d50:	70 72                	jo     0x140004dc4
   140004d52:	65 73 65             	gs jae 0x140004dba
   140004d55:	6e                   	outs   dx,BYTE PTR [rsi]
   140004d56:	74 65                	je     0x140004dbd
   140004d58:	64 20 28             	and    BYTE PTR fs:[rax],ch
   140004d5b:	55                   	push   rbp
   140004d5c:	4e                   	rex.WRX
   140004d5d:	44                   	rex.R
   140004d5e:	45 52                	rex.RB push r10
   140004d60:	46                   	rex.RX
   140004d61:	4c                   	rex.WR
   140004d62:	4f 57                	rex.WRXB push r15
   140004d64:	29 00                	sub    DWORD PTR [rax],eax
   140004d66:	55                   	push   rbp
   140004d67:	6e                   	outs   dx,BYTE PTR [rsi]
   140004d68:	6b 6e 6f 77          	imul   ebp,DWORD PTR [rsi+0x6f],0x77
   140004d6c:	6e                   	outs   dx,BYTE PTR [rsi]
   140004d6d:	20 65 72             	and    BYTE PTR [rbp+0x72],ah
   140004d70:	72 6f                	jb     0x140004de1
   140004d72:	72 00                	jb     0x140004d74
   140004d74:	00 00                	add    BYTE PTR [rax],al
   140004d76:	00 00                	add    BYTE PTR [rax],al
   140004d78:	5f                   	pop    rdi
   140004d79:	6d                   	ins    DWORD PTR [rdi],dx
   140004d7a:	61                   	(bad)
   140004d7b:	74 68                	je     0x140004de5
   140004d7d:	65 72 72             	gs jb  0x140004df2
   140004d80:	28 29                	sub    BYTE PTR [rcx],ch
   140004d82:	3a 20                	cmp    ah,BYTE PTR [rax]
   140004d84:	25 73 20 69 6e       	and    eax,0x6e692073
   140004d89:	20 25 73 28 25 67    	and    BYTE PTR [rip+0x67252873],ah        # 0x1a7257602
   140004d8f:	2c 20                	sub    al,0x20
   140004d91:	25 67 29 20 20       	and    eax,0x20202967
   140004d96:	28 72 65             	sub    BYTE PTR [rdx+0x65],dh
   140004d99:	74 76                	je     0x140004e11
   140004d9b:	61                   	(bad)
   140004d9c:	6c                   	ins    BYTE PTR [rdi],dx
   140004d9d:	3d 25 67 29 0a       	cmp    eax,0xa296725
   140004da2:	00 00                	add    BYTE PTR [rax],al
   140004da4:	38 cc                	cmp    ah,cl
   140004da6:	ff                   	(bad)
   140004da7:	ff                   	jmp    (bad)
   140004da8:	ec                   	in     al,dx
   140004da9:	cb                   	retf
   140004daa:	ff                   	(bad)
   140004dab:	ff 84 cb ff ff 0c cc 	inc    DWORD PTR [rbx+rcx*8-0x33f30001]
   140004db2:	ff                   	(bad)
   140004db3:	ff 1c cc             	call   FWORD PTR [rsp+rcx*8]
   140004db6:	ff                   	(bad)
   140004db7:	ff 2c cc             	jmp    FWORD PTR [rsp+rcx*8]
   140004dba:	ff                   	(bad)
   140004dbb:	ff                   	(bad)
   140004dbc:	fc                   	cld
   140004dbd:	cb                   	retf
   140004dbe:	ff                   	(bad)
   140004dbf:	ff 4d 69             	dec    DWORD PTR [rbp+0x69]
   140004dc2:	6e                   	outs   dx,BYTE PTR [rsi]
   140004dc3:	67 77 2d             	addr32 ja 0x140004df3
   140004dc6:	77 36                	ja     0x140004dfe
   140004dc8:	34 20                	xor    al,0x20
   140004dca:	72 75                	jb     0x140004e41
   140004dcc:	6e                   	outs   dx,BYTE PTR [rsi]
   140004dcd:	74 69                	je     0x140004e38
   140004dcf:	6d                   	ins    DWORD PTR [rdi],dx
   140004dd0:	65 20 66 61          	and    BYTE PTR gs:[rsi+0x61],ah
   140004dd4:	69 6c 75 72 65 3a 0a 	imul   ebp,DWORD PTR [rbp+rsi*2+0x72],0xa3a65
   140004ddb:	00 
   140004ddc:	00 00                	add    BYTE PTR [rax],al
   140004dde:	00 00                	add    BYTE PTR [rax],al
   140004de0:	41                   	rex.B
   140004de1:	64 64 72 65          	fs fs jb 0x140004e4a
   140004de5:	73 73                	jae    0x140004e5a
   140004de7:	20 25 70 20 68 61    	and    BYTE PTR [rip+0x61682070],ah        # 0x1a1686e5d
   140004ded:	73 20                	jae    0x140004e0f
   140004def:	6e                   	outs   dx,BYTE PTR [rsi]
   140004df0:	6f                   	outs   dx,DWORD PTR [rsi]
   140004df1:	20 69 6d             	and    BYTE PTR [rcx+0x6d],ch
   140004df4:	61                   	(bad)
   140004df5:	67 65 2d 73 65 63 74 	addr32 gs sub eax,0x74636573
   140004dfc:	69 6f 6e 00 20 20 56 	imul   ebp,DWORD PTR [rdi+0x6e],0x56202000
   140004e03:	69 72 74 75 61 6c 51 	imul   esi,DWORD PTR [rdx+0x74],0x516c6175
   140004e0a:	75 65                	jne    0x140004e71
   140004e0c:	72 79                	jb     0x140004e87
   140004e0e:	20 66 61             	and    BYTE PTR [rsi+0x61],ah
   140004e11:	69 6c 65 64 20 66 6f 	imul   ebp,DWORD PTR [rbp+riz*2+0x64],0x726f6620
   140004e18:	72 
   140004e19:	20 25 64 20 62 79    	and    BYTE PTR [rip+0x79622064],ah        # 0x1b9626e83
   140004e1f:	74 65                	je     0x140004e86
   140004e21:	73 20                	jae    0x140004e43
   140004e23:	61                   	(bad)
   140004e24:	74 20                	je     0x140004e46
   140004e26:	61                   	(bad)
   140004e27:	64 64 72 65          	fs fs jb 0x140004e90
   140004e2b:	73 73                	jae    0x140004ea0
   140004e2d:	20 25 70 00 00 00    	and    BYTE PTR [rip+0x70],ah        # 0x140004ea3
   140004e33:	00 00                	add    BYTE PTR [rax],al
   140004e35:	00 00                	add    BYTE PTR [rax],al
   140004e37:	00 20                	add    BYTE PTR [rax],ah
   140004e39:	20 56 69             	and    BYTE PTR [rsi+0x69],dl
   140004e3c:	72 74                	jb     0x140004eb2
   140004e3e:	75 61                	jne    0x140004ea1
   140004e40:	6c                   	ins    BYTE PTR [rdi],dx
   140004e41:	50                   	push   rax
   140004e42:	72 6f                	jb     0x140004eb3
   140004e44:	74 65                	je     0x140004eab
   140004e46:	63 74 20 66          	movsxd esi,DWORD PTR [rax+riz*1+0x66]
   140004e4a:	61                   	(bad)
   140004e4b:	69 6c 65 64 20 77 69 	imul   ebp,DWORD PTR [rbp+riz*2+0x64],0x74697720
   140004e52:	74 
   140004e53:	68 20 63 6f 64       	push   0x646f6320
   140004e58:	65 20 30             	and    BYTE PTR gs:[rax],dh
   140004e5b:	78 25                	js     0x140004e82
   140004e5d:	78 00                	js     0x140004e5f
   140004e5f:	00 20                	add    BYTE PTR [rax],ah
   140004e61:	20 55 6e             	and    BYTE PTR [rbp+0x6e],dl
   140004e64:	6b 6e 6f 77          	imul   ebp,DWORD PTR [rsi+0x6f],0x77
   140004e68:	6e                   	outs   dx,BYTE PTR [rsi]
   140004e69:	20 70 73             	and    BYTE PTR [rax+0x73],dh
   140004e6c:	65 75 64             	gs jne 0x140004ed3
   140004e6f:	6f                   	outs   dx,DWORD PTR [rsi]
   140004e70:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
   140004e73:	6c                   	ins    BYTE PTR [rdi],dx
   140004e74:	6f                   	outs   dx,DWORD PTR [rsi]
   140004e75:	63 61 74             	movsxd esp,DWORD PTR [rcx+0x74]
   140004e78:	69 6f 6e 20 70 72 6f 	imul   ebp,DWORD PTR [rdi+0x6e],0x6f727020
   140004e7f:	74 6f                	je     0x140004ef0
   140004e81:	63 6f 6c             	movsxd ebp,DWORD PTR [rdi+0x6c]
   140004e84:	20 76 65             	and    BYTE PTR [rsi+0x65],dh
   140004e87:	72 73                	jb     0x140004efc
   140004e89:	69 6f 6e 20 25 64 2e 	imul   ebp,DWORD PTR [rdi+0x6e],0x2e642520
   140004e90:	0a 00                	or     al,BYTE PTR [rax]
   140004e92:	00 00                	add    BYTE PTR [rax],al
   140004e94:	00 00                	add    BYTE PTR [rax],al
   140004e96:	00 00                	add    BYTE PTR [rax],al
   140004e98:	20 20                	and    BYTE PTR [rax],ah
   140004e9a:	55                   	push   rbp
   140004e9b:	6e                   	outs   dx,BYTE PTR [rsi]
   140004e9c:	6b 6e 6f 77          	imul   ebp,DWORD PTR [rsi+0x6f],0x77
   140004ea0:	6e                   	outs   dx,BYTE PTR [rsi]
   140004ea1:	20 70 73             	and    BYTE PTR [rax+0x73],dh
   140004ea4:	65 75 64             	gs jne 0x140004f0b
   140004ea7:	6f                   	outs   dx,DWORD PTR [rsi]
   140004ea8:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
   140004eab:	6c                   	ins    BYTE PTR [rdi],dx
   140004eac:	6f                   	outs   dx,DWORD PTR [rsi]
   140004ead:	63 61 74             	movsxd esp,DWORD PTR [rcx+0x74]
   140004eb0:	69 6f 6e 20 62 69 74 	imul   ebp,DWORD PTR [rdi+0x6e],0x74696220
   140004eb7:	20 73 69             	and    BYTE PTR [rbx+0x69],dh
   140004eba:	7a 65                	jp     0x140004f21
   140004ebc:	20 25 64 2e 0a 00    	and    BYTE PTR [rip+0xa2e64],ah        # 0x1400a7d26
   140004ec2:	00 00                	add    BYTE PTR [rax],al
   140004ec4:	00 00                	add    BYTE PTR [rax],al
   140004ec6:	00 00                	add    BYTE PTR [rax],al
   140004ec8:	25 64 20 62 69       	and    eax,0x69622064
   140004ecd:	74 20                	je     0x140004eef
   140004ecf:	70 73                	jo     0x140004f44
   140004ed1:	65 75 64             	gs jne 0x140004f38
   140004ed4:	6f                   	outs   dx,DWORD PTR [rsi]
   140004ed5:	20 72 65             	and    BYTE PTR [rdx+0x65],dh
   140004ed8:	6c                   	ins    BYTE PTR [rdi],dx
   140004ed9:	6f                   	outs   dx,DWORD PTR [rsi]
   140004eda:	63 61 74             	movsxd esp,DWORD PTR [rcx+0x74]
   140004edd:	69 6f 6e 20 61 74 20 	imul   ebp,DWORD PTR [rdi+0x6e],0x20746120
   140004ee4:	25 70 20 6f 75       	and    eax,0x756f2070
   140004ee9:	74 20                	je     0x140004f0b
   140004eeb:	6f                   	outs   dx,DWORD PTR [rsi]
   140004eec:	66 20 72 61          	data16 and BYTE PTR [rdx+0x61],dh
   140004ef0:	6e                   	outs   dx,BYTE PTR [rsi]
   140004ef1:	67 65 2c 20          	addr32 gs sub al,0x20
   140004ef5:	74 61                	je     0x140004f58
   140004ef7:	72 67                	jb     0x140004f60
   140004ef9:	65 74 69             	gs je  0x140004f65
   140004efc:	6e                   	outs   dx,BYTE PTR [rsi]
   140004efd:	67 20 25 70 2c 20 79 	and    BYTE PTR [eip+0x79202c70],ah        # 0x1b9207b74
   140004f04:	69 65 6c 64 69 6e 67 	imul   esp,DWORD PTR [rbp+0x6c],0x676e6964
   140004f0b:	20 74 68 65          	and    BYTE PTR [rax+rbp*2+0x65],dh
   140004f0f:	20 76 61             	and    BYTE PTR [rsi+0x61],dh
   140004f12:	6c                   	ins    BYTE PTR [rdi],dx
   140004f13:	75 65                	jne    0x140004f7a
   140004f15:	20 25 70 2e 0a 00    	and    BYTE PTR [rip+0xa2e70],ah        # 0x1400a7d8b
   140004f1b:	00 00                	add    BYTE PTR [rax],al
   140004f1d:	00 00                	add    BYTE PTR [rax],al
   140004f1f:	00 50 d1             	add    BYTE PTR [rax-0x2f],dl
   140004f22:	ff                   	(bad)
   140004f23:	ff 50 d1             	call   QWORD PTR [rax-0x2f]
   140004f26:	ff                   	(bad)
   140004f27:	ff 50 d1             	call   QWORD PTR [rax-0x2f]
   140004f2a:	ff                   	(bad)
   140004f2b:	ff 50 d1             	call   QWORD PTR [rax-0x2f]
   140004f2e:	ff                   	(bad)
   140004f2f:	ff 50 d1             	call   QWORD PTR [rax-0x2f]
   140004f32:	ff                   	(bad)
   140004f33:	ff                   	(bad)
   140004f34:	fd                   	std
   140004f35:	d0 ff                	sar    bh,1
   140004f37:	ff 50 d1             	call   QWORD PTR [rax-0x2f]
   140004f3a:	ff                   	(bad)
   140004f3b:	ff                   	(bad)
   140004f3c:	78 d1                	js     0x140004f0f
   140004f3e:	ff                   	(bad)
   140004f3f:	ff                   	(bad)
   140004f40:	fd                   	std
   140004f41:	d0 ff                	sar    bh,1
   140004f43:	ff                   	call   (bad)
   140004f44:	db d0                	fcmovnbe st,st(0)
   140004f46:	ff                   	(bad)
   140004f47:	ff 00                	inc    DWORD PTR [rax]
   140004f49:	00 00                	add    BYTE PTR [rax],al
   140004f4b:	00 00                	add    BYTE PTR [rax],al
   140004f4d:	00 00                	add    BYTE PTR [rax],al
   140004f4f:	00 30                	add    BYTE PTR [rax],dh
   140004f51:	30 00                	xor    BYTE PTR [rax],al
   140004f53:	40 01 00             	rex add DWORD PTR [rax],eax
	...
   140004f5e:	00 00                	add    BYTE PTR [rax],al
   140004f60:	40 30 00             	rex xor BYTE PTR [rax],al
   140004f63:	40 01 00             	rex add DWORD PTR [rax],eax
	...
   140004f6e:	00 00                	add    BYTE PTR [rax],al
   140004f70:	00 2b                	add    BYTE PTR [rbx],ch
   140004f72:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140004f7d:	00 00                	add    BYTE PTR [rax],al
   140004f7f:	00 50 51             	add    BYTE PTR [rax+0x51],dl
   140004f82:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140004f8d:	00 00                	add    BYTE PTR [rax],al
   140004f8f:	00 50 51             	add    BYTE PTR [rax+0x51],dl
   140004f92:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140004f9d:	00 00                	add    BYTE PTR [rax],al
   140004f9f:	00 20                	add    BYTE PTR [rax],ah
   140004fa1:	4c 00 40 01          	rex.WR add BYTE PTR [rax+0x1],r8b
	...
   140004fb1:	00 00                	add    BYTE PTR [rax],al
   140004fb3:	40 01 00             	rex add DWORD PTR [rax],eax
	...
   140004fbe:	00 00                	add    BYTE PTR [rax],al
   140004fc0:	ec                   	in     al,dx
   140004fc1:	a1 00 40 01 00 00 00 	movabs eax,ds:0x14000
   140004fc8:	00 00 
   140004fca:	00 00                	add    BYTE PTR [rax],al
   140004fcc:	00 00                	add    BYTE PTR [rax],al
   140004fce:	00 00                	add    BYTE PTR [rax],al
   140004fd0:	1c a2                	sbb    al,0xa2
   140004fd2:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140004fdd:	00 00                	add    BYTE PTR [rax],al
   140004fdf:	00 24 a2             	add    BYTE PTR [rdx+riz*4],ah
   140004fe2:	00 40 01             	add    BYTE PTR [rax+0x1],al
	...
   140004fed:	00 00                	add    BYTE PTR [rax],al
   140004fef:	00 90 80 00 40 01    	add    BYTE PTR [rax+0x1400080],dl
	...
