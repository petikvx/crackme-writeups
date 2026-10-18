0045b064 <CODE+0x5a064>:
  45b064:	ba 01 00 00 00       	mov    edx,0x1
  45b069:	b8 88 b0 45 00       	mov    eax,0x45b088
  45b06e:	e8 b5 cb fa ff       	call   0x407c28
  45b073:	85 c0                	test   eax,eax
  45b075:	7e 06                	jle    0x45b07d
  45b077:	b8 01 00 00 00       	mov    eax,0x1
  45b07c:	c3                   	ret
  45b07d:	33 c0                	xor    eax,eax
  45b07f:	c3                   	ret
  45b080:	ff                   	(bad)
  45b081:	ff                   	(bad)
  45b082:	ff                   	(bad)
  45b083:	ff 08                	dec    DWORD PTR [eax]
  45b085:	00 00                	add    BYTE PTR [eax],al
  45b087:	00 5c 5c 2e          	add    BYTE PTR [esp+ebx*2+0x2e],bl
  45b08b:	5c                   	pop    esp
  45b08c:	53                   	push   ebx
  45b08d:	49                   	dec    ecx
  45b08e:	43                   	inc    ebx
  45b08f:	45                   	inc    ebp
  45b090:	00 00                	add    BYTE PTR [eax],al
  45b092:	00 00                	add    BYTE PTR [eax],al
  45b094:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b099:	8b 00                	mov    eax,DWORD PTR [eax]
  45b09b:	e8 d4 81 fe ff       	call   0x443274
  45b0a0:	c3                   	ret
  45b0a1:	8d 40 00             	lea    eax,[eax+0x0]
  45b0a4:	55                   	push   ebp
  45b0a5:	8b ec                	mov    ebp,esp
  45b0a7:	b9 07 00 00 00       	mov    ecx,0x7
  45b0ac:	6a 00                	push   0x0
  45b0ae:	6a 00                	push   0x0
  45b0b0:	49                   	dec    ecx
  45b0b1:	75 f9                	jne    0x45b0ac
  45b0b3:	53                   	push   ebx
  45b0b4:	56                   	push   esi
  45b0b5:	57                   	push   edi
  45b0b6:	8b d8                	mov    ebx,eax
  45b0b8:	33 c0                	xor    eax,eax
  45b0ba:	55                   	push   ebp
  45b0bb:	68 30 b3 45 00       	push   0x45b330
  45b0c0:	64 ff 30             	push   DWORD PTR fs:[eax]
  45b0c3:	64 89 20             	mov    DWORD PTR fs:[eax],esp
  45b0c6:	8d 55 e0             	lea    edx,[ebp-0x20]
  45b0c9:	8b 83 d8 02 00 00    	mov    eax,DWORD PTR [ebx+0x2d8]
  45b0cf:	e8 14 a0 fc ff       	call   0x4250e8
  45b0d4:	8b 45 e0             	mov    eax,DWORD PTR [ebp-0x20]
  45b0d7:	8d 55 fc             	lea    edx,[ebp-0x4]
  45b0da:	e8 11 ca fa ff       	call   0x407af0
  45b0df:	8d 55 dc             	lea    edx,[ebp-0x24]
  45b0e2:	8b 83 dc 02 00 00    	mov    eax,DWORD PTR [ebx+0x2dc]
  45b0e8:	e8 fb 9f fc ff       	call   0x4250e8
  45b0ed:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  45b0f0:	8d 55 f8             	lea    edx,[ebp-0x8]
  45b0f3:	e8 f8 c9 fa ff       	call   0x407af0
  45b0f8:	33 c0                	xor    eax,eax
  45b0fa:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  45b0fd:	33 c0                	xor    eax,eax
  45b0ff:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  45b102:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  45b105:	e8 4e 8c fa ff       	call   0x403d58
  45b10a:	e8 5d cd fa ff       	call   0x407e6c
  45b10f:	8b d8                	mov    ebx,eax
  45b111:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  45b114:	e8 3f 8c fa ff       	call   0x403d58
  45b119:	8b f0                	mov    esi,eax
  45b11b:	8b c6                	mov    eax,esi
  45b11d:	e8 4a cd fa ff       	call   0x407e6c
  45b122:	85 c0                	test   eax,eax
  45b124:	74 11                	je     0x45b137
  45b126:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  45b129:	e8 2a 8c fa ff       	call   0x403d58
  45b12e:	e8 39 cd fa ff       	call   0x407e6c
  45b133:	85 c0                	test   eax,eax
  45b135:	75 1d                	jne    0x45b154
  45b137:	6a 30                	push   0x30
  45b139:	b9 40 b3 45 00       	mov    ecx,0x45b340
  45b13e:	ba 58 b3 45 00       	mov    edx,0x45b358
  45b143:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b148:	8b 00                	mov    eax,DWORD PTR [eax]
  45b14a:	e8 c9 81 fe ff       	call   0x443318
  45b14f:	e9 a7 01 00 00       	jmp    0x45b2fb
  45b154:	8b c6                	mov    eax,esi
  45b156:	e8 11 cd fa ff       	call   0x407e6c
  45b15b:	83 f8 05             	cmp    eax,0x5
  45b15e:	73 1d                	jae    0x45b17d
  45b160:	6a 30                	push   0x30
  45b162:	b9 40 b3 45 00       	mov    ecx,0x45b340
  45b167:	ba 78 b3 45 00       	mov    edx,0x45b378
  45b16c:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b171:	8b 00                	mov    eax,DWORD PTR [eax]
  45b173:	e8 a0 81 fe ff       	call   0x443318
  45b178:	e9 7e 01 00 00       	jmp    0x45b2fb
  45b17d:	8b fb                	mov    edi,ebx
  45b17f:	85 ff                	test   edi,edi
  45b181:	7e 1b                	jle    0x45b19e
  45b183:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
  45b18a:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  45b18d:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
  45b190:	0f b6 44 10 ff       	movzx  eax,BYTE PTR [eax+edx*1-0x1]
  45b195:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
  45b198:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  45b19b:	4f                   	dec    edi
  45b19c:	75 ec                	jne    0x45b18a
  45b19e:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  45b1a1:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  45b1a4:	f7 6d e4             	imul   DWORD PTR [ebp-0x1c]
  45b1a7:	8b d3                	mov    edx,ebx
  45b1a9:	03 d2                	add    edx,edx
  45b1ab:	03 c2                	add    eax,edx
  45b1ad:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  45b1b0:	8d 55 f4             	lea    edx,[ebp-0xc]
  45b1b3:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  45b1b6:	e8 e9 c9 fa ff       	call   0x407ba4
  45b1bb:	8b fb                	mov    edi,ebx
  45b1bd:	85 ff                	test   edi,edi
  45b1bf:	7e 5c                	jle    0x45b21d
  45b1c1:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
  45b1c8:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  45b1cb:	8b 55 ec             	mov    edx,DWORD PTR [ebp-0x14]
  45b1ce:	0f b6 44 10 ff       	movzx  eax,BYTE PTR [eax+edx*1-0x1]
  45b1d3:	01 45 e4             	add    DWORD PTR [ebp-0x1c],eax
  45b1d6:	8d 55 f0             	lea    edx,[ebp-0x10]
  45b1d9:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  45b1dc:	e8 c3 c9 fa ff       	call   0x407ba4
  45b1e1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  45b1e4:	e8 6f 8b fa ff       	call   0x403d58
  45b1e9:	e8 7e cc fa ff       	call   0x407e6c
  45b1ee:	8b d8                	mov    ebx,eax
  45b1f0:	85 db                	test   ebx,ebx
  45b1f2:	7e 23                	jle    0x45b217
  45b1f4:	be 01 00 00 00       	mov    esi,0x1
  45b1f9:	8d 45 d8             	lea    eax,[ebp-0x28]
  45b1fc:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
  45b1ff:	8a 54 32 ff          	mov    dl,BYTE PTR [edx+esi*1-0x1]
  45b203:	e8 b4 88 fa ff       	call   0x403abc
  45b208:	8b 45 d8             	mov    eax,DWORD PTR [ebp-0x28]
  45b20b:	e8 c4 c9 fa ff       	call   0x407bd4
  45b210:	01 45 e8             	add    DWORD PTR [ebp-0x18],eax
  45b213:	46                   	inc    esi
  45b214:	4b                   	dec    ebx
  45b215:	75 e2                	jne    0x45b1f9
  45b217:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  45b21a:	4f                   	dec    edi
  45b21b:	75 ab                	jne    0x45b1c8
  45b21d:	8d 55 d4             	lea    edx,[ebp-0x2c]
  45b220:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  45b223:	e8 7c c9 fa ff       	call   0x407ba4
  45b228:	8b 55 d4             	mov    edx,DWORD PTR [ebp-0x2c]
  45b22b:	8d 45 f4             	lea    eax,[ebp-0xc]
  45b22e:	e8 69 89 fa ff       	call   0x403b9c
  45b233:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  45b236:	e8 1d 8b fa ff       	call   0x403d58
  45b23b:	e8 2c cc fa ff       	call   0x407e6c
  45b240:	8b d8                	mov    ebx,eax
  45b242:	8d 45 f0             	lea    eax,[ebp-0x10]
  45b245:	e8 ca 86 fa ff       	call   0x403914
  45b24a:	8b fb                	mov    edi,ebx
  45b24c:	4f                   	dec    edi
  45b24d:	85 ff                	test   edi,edi
  45b24f:	7e 60                	jle    0x45b2b1
  45b251:	c7 45 ec 01 00 00 00 	mov    DWORD PTR [ebp-0x14],0x1
  45b258:	8d 45 d0             	lea    eax,[ebp-0x30]
  45b25b:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  45b25e:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  45b261:	8a 54 0a ff          	mov    dl,BYTE PTR [edx+ecx*1-0x1]
  45b265:	e8 52 88 fa ff       	call   0x403abc
  45b26a:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  45b26d:	e8 62 c9 fa ff       	call   0x407bd4
  45b272:	8b d8                	mov    ebx,eax
  45b274:	83 c3 41             	add    ebx,0x41
  45b277:	8d 45 cc             	lea    eax,[ebp-0x34]
  45b27a:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  45b27d:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  45b280:	8a 14 0a             	mov    dl,BYTE PTR [edx+ecx*1]
  45b283:	e8 34 88 fa ff       	call   0x403abc
  45b288:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  45b28b:	e8 44 c9 fa ff       	call   0x407bd4
  45b290:	03 d8                	add    ebx,eax
  45b292:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
  45b295:	8d 45 c8             	lea    eax,[ebp-0x38]
  45b298:	8b 55 e4             	mov    edx,DWORD PTR [ebp-0x1c]
  45b29b:	e8 1c 88 fa ff       	call   0x403abc
  45b2a0:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  45b2a3:	8d 45 f0             	lea    eax,[ebp-0x10]
  45b2a6:	e8 f1 88 fa ff       	call   0x403b9c
  45b2ab:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  45b2ae:	4f                   	dec    edi
  45b2af:	75 a7                	jne    0x45b258
  45b2b1:	8d 45 f4             	lea    eax,[ebp-0xc]
  45b2b4:	8b 55 f0             	mov    edx,DWORD PTR [ebp-0x10]
  45b2b7:	e8 e0 88 fa ff       	call   0x403b9c
  45b2bc:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  45b2bf:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  45b2c2:	e8 dd 89 fa ff       	call   0x403ca4
  45b2c7:	74 1a                	je     0x45b2e3
  45b2c9:	6a 40                	push   0x40
  45b2cb:	b9 a4 b3 45 00       	mov    ecx,0x45b3a4
  45b2d0:	ba ac b3 45 00       	mov    edx,0x45b3ac
  45b2d5:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b2da:	8b 00                	mov    eax,DWORD PTR [eax]
  45b2dc:	e8 37 80 fe ff       	call   0x443318
  45b2e1:	eb 18                	jmp    0x45b2fb
  45b2e3:	6a 40                	push   0x40
  45b2e5:	b9 c0 b3 45 00       	mov    ecx,0x45b3c0
  45b2ea:	ba d4 b3 45 00       	mov    edx,0x45b3d4
  45b2ef:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b2f4:	8b 00                	mov    eax,DWORD PTR [eax]
  45b2f6:	e8 1d 80 fe ff       	call   0x443318
  45b2fb:	33 c0                	xor    eax,eax
  45b2fd:	5a                   	pop    edx
  45b2fe:	59                   	pop    ecx
  45b2ff:	59                   	pop    ecx
  45b300:	64 89 10             	mov    DWORD PTR fs:[eax],edx
  45b303:	68 37 b3 45 00       	push   0x45b337
  45b308:	8d 45 c8             	lea    eax,[ebp-0x38]
  45b30b:	ba 05 00 00 00       	mov    edx,0x5
  45b310:	e8 23 86 fa ff       	call   0x403938
  45b315:	8d 45 dc             	lea    eax,[ebp-0x24]
  45b318:	ba 02 00 00 00       	mov    edx,0x2
  45b31d:	e8 16 86 fa ff       	call   0x403938
  45b322:	8d 45 f0             	lea    eax,[ebp-0x10]
  45b325:	ba 04 00 00 00       	mov    edx,0x4
  45b32a:	e8 09 86 fa ff       	call   0x403938
  45b32f:	c3                   	ret
  45b330:	e9 77 80 fa ff       	jmp    0x4033ac
  45b335:	eb d1                	jmp    0x45b308
  45b337:	5f                   	pop    edi
  45b338:	5e                   	pop    esi
  45b339:	5b                   	pop    ebx
  45b33a:	8b e5                	mov    esp,ebp
  45b33c:	5d                   	pop    ebp
  45b33d:	c3                   	ret
  45b33e:	00 00                	add    BYTE PTR [eax],al
  45b340:	49                   	dec    ecx
  45b341:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b342:	66 6f                	outs   dx,WORD PTR ds:[esi]
  45b344:	72 6d                	jb     0x45b3b3
  45b346:	61                   	popa
  45b347:	63 69 6f             	arpl   WORD PTR [ecx+0x6f],ebp
  45b34a:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b34b:	20 69 6e             	and    BYTE PTR [ecx+0x6e],ch
  45b34e:	63 6f 6d             	arpl   WORD PTR [edi+0x6d],ebp
  45b351:	70 6c                	jo     0x45b3bf
  45b353:	65 74 61             	gs je  0x45b3b7
  45b356:	00 00                	add    BYTE PTR [eax],al
  45b358:	43                   	inc    ebx
  45b359:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b35a:	6d                   	ins    DWORD PTR es:[edi],dx
  45b35b:	70 6c                	jo     0x45b3c9
  45b35d:	65 74 65             	gs je  0x45b3c5
  45b360:	20 6c 6f 73          	and    BYTE PTR [edi+ebp*2+0x73],ch
  45b364:	20 64 61 74          	and    BYTE PTR [ecx+eiz*2+0x74],ah
  45b368:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b369:	73 20                	jae    0x45b38b
  45b36b:	70 6f                	jo     0x45b3dc
  45b36d:	72 20                	jb     0x45b38f
  45b36f:	66 61                	popaw
  45b371:	76 6f                	jbe    0x45b3e2
  45b373:	72 2e                	jb     0x45b3a3
  45b375:	00 00                	add    BYTE PTR [eax],al
  45b377:	00 45 6c             	add    BYTE PTR [ebp+0x6c],al
  45b37a:	20 6e 6f             	and    BYTE PTR [esi+0x6f],ch
  45b37d:	6d                   	ins    DWORD PTR es:[edi],dx
  45b37e:	62 72 65             	bound  esi,QWORD PTR [edx+0x65]
  45b381:	20 64 65 62          	and    BYTE PTR [ebp+eiz*2+0x62],ah
  45b385:	65 20 74 65 6e       	and    BYTE PTR gs:[ebp+eiz*2+0x6e],dh
  45b38a:	65 72 20             	gs jb  0x45b3ad
  45b38d:	6d                   	ins    DWORD PTR es:[edi],dx
  45b38e:	61                   	popa
  45b38f:	73 20                	jae    0x45b3b1
  45b391:	64 65 20 35 20 63 61 	fs and BYTE PTR gs:0x72616320,dh
  45b398:	72 
  45b399:	61                   	popa
  45b39a:	63 74 65 72          	arpl   WORD PTR [ebp+eiz*2+0x72],esi
  45b39e:	65 73 2e             	gs jae 0x45b3cf
  45b3a1:	00 00                	add    BYTE PTR [eax],al
  45b3a3:	00 45 72             	add    BYTE PTR [ebp+0x72],al
  45b3a6:	72 6f                	jb     0x45b417
  45b3a8:	72 00                	jb     0x45b3aa
  45b3aa:	00 00                	add    BYTE PTR [eax],al
  45b3ac:	4d                   	dec    ebp
  45b3ad:	61                   	popa
  45b3ae:	6c                   	ins    BYTE PTR es:[edi],dx
  45b3af:	2c 20                	sub    al,0x20
  45b3b1:	6d                   	ins    DWORD PTR es:[edi],dx
  45b3b2:	61                   	popa
  45b3b3:	6c                   	ins    BYTE PTR es:[edi],dx
  45b3b4:	2c 20                	sub    al,0x20
  45b3b6:	6d                   	ins    DWORD PTR es:[edi],dx
  45b3b7:	75 79                	jne    0x45b432
  45b3b9:	20 6d 61             	and    BYTE PTR [ebp+0x61],ch
  45b3bc:	6c                   	ins    BYTE PTR es:[edi],dx
  45b3bd:	2e 00 00             	add    BYTE PTR cs:[eax],al
  45b3c0:	4f                   	dec    edi
  45b3c1:	6b 2c 20 6c          	imul   ebp,DWORD PTR [eax+eiz*1],0x6c
  45b3c5:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b3c6:	20 6c 6f 67          	and    BYTE PTR [edi+ebp*2+0x67],ch
  45b3ca:	72 61                	jb     0x45b42d
  45b3cc:	73 74                	jae    0x45b442
  45b3ce:	65 21 00             	and    DWORD PTR gs:[eax],eax
  45b3d1:	00 00                	add    BYTE PTR [eax],al
  45b3d3:	00 41 6e             	add    BYTE PTR [ecx+0x6e],al
  45b3d6:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b3d7:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b3d8:	69 6d 6f 53 65 72 20 	imul   ebp,DWORD PTR [ebp+0x6f],0x20726553
  45b3df:	43                   	inc    ebx
  45b3e0:	72 61                	jb     0x45b443
  45b3e2:	63 6b 6d             	arpl   WORD PTR [ebx+0x6d],ebp
  45b3e5:	65 20 49 0d          	and    BYTE PTR gs:[ecx+0xd],cl
  45b3e9:	0a 0d 0a 42 69 65    	or     cl,BYTE PTR ds:0x6569420a
  45b3ef:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b3f0:	20 68 65             	and    BYTE PTR [eax+0x65],ch
  45b3f3:	63 68 6f             	arpl   WORD PTR [eax+0x6f],ebp
  45b3f6:	20 63 72             	and    BYTE PTR [ebx+0x72],ah
  45b3f9:	61                   	popa
  45b3fa:	63 6b 65             	arpl   WORD PTR [ebx+0x65],ebp
  45b3fd:	72 2e                	jb     0x45b42d
  45b3ff:	20 4d 61             	and    BYTE PTR [ebp+0x61],cl
  45b402:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b403:	64 61                	fs popa
  45b405:	6d                   	ins    DWORD PTR es:[edi],dx
  45b406:	65 20 75 6e          	and    BYTE PTR gs:[ebp+0x6e],dh
  45b40a:	20 74 75 74          	and    BYTE PTR [ebp+esi*2+0x74],dh
  45b40e:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b40f:	72 69                	jb     0x45b47a
  45b411:	61                   	popa
  45b412:	6c                   	ins    BYTE PTR es:[edi],dx
  45b413:	20 61 20             	and    BYTE PTR [ecx+0x20],ah
  45b416:	61                   	popa
  45b417:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b418:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b419:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b41a:	69 6d 6f 73 65 72 40 	imul   ebp,DWORD PTR [ebp+0x6f],0x40726573
  45b421:	68 6f 74 6d 61       	push   0x616d746f
  45b426:	69 6c 2e 63 6f 6d 0d 	imul   ebp,DWORD PTR [esi+ebp*1+0x63],0xa0d6d6f
  45b42d:	0a 
  45b42e:	64 65 73 63          	fs gs jae 0x45b495
  45b432:	72 69                	jb     0x45b49d
  45b434:	62 69 65             	bound  ebp,QWORD PTR [ecx+0x65]
  45b437:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b438:	64 6f                	outs   dx,DWORD PTR fs:[esi]
  45b43a:	20 70 61             	and    BYTE PTR [eax+0x61],dh
  45b43d:	73 6f                	jae    0x45b4ae
  45b43f:	20 61 20             	and    BYTE PTR [ecx+0x20],ah
  45b442:	70 61                	jo     0x45b4a5
  45b444:	73 6f                	jae    0x45b4b5
  45b446:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
  45b449:	6d                   	ins    DWORD PTR es:[edi],dx
  45b44a:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b44b:	20 6c 6f 20          	and    BYTE PTR [edi+ebp*2+0x20],ch
  45b44f:	68 69 63 69 73       	push   0x73696369
  45b454:	74 65                	je     0x45b4bb
  45b456:	20 79 20             	and    BYTE PTR [ecx+0x20],bh
  45b459:	6c                   	ins    BYTE PTR es:[edi],dx
  45b45a:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b45b:	20 70 6f             	and    BYTE PTR [eax+0x6f],dh
  45b45e:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b45f:	64 72 65             	fs jb  0x45b4c7
  45b462:	20 65 6e             	and    BYTE PTR [ebp+0x6e],ah
  45b465:	20 6c 61 20          	and    BYTE PTR [ecx+eiz*2+0x20],ch
  45b469:	70 61                	jo     0x45b4cc
  45b46b:	67 69 6e 61 2e 0d 0a 	imul   ebp,DWORD PTR [bp+0x61],0xd0a0d2e
  45b472:	0d 
  45b473:	0a 68 74             	or     ch,BYTE PTR [eax+0x74]
  45b476:	74 70                	je     0x45b4e8
  45b478:	3a 2f                	cmp    ch,BYTE PTR [edi]
  45b47a:	2f                   	das
  45b47b:	70 61                	jo     0x45b4de
  45b47d:	67 69 6e 61 2e 64 65 	imul   ebp,DWORD PTR [bp+0x61],0x2f65642e
  45b484:	2f 
  45b485:	61                   	popa
  45b486:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b487:	6f                   	outs   dx,DWORD PTR ds:[esi]
  45b488:	6e                   	outs   dx,BYTE PTR ds:[esi]
  45b489:	69 6d 6f 73 65 72 00 	imul   ebp,DWORD PTR [ebp+0x6f],0x726573
  45b490:	e8 cf fb ff ff       	call   0x45b064
  45b490:	e8 cf fb ff ff       	call   0x45b064
  45b495:	48                   	dec    eax
  45b495:	48                   	dec    eax
  45b496:	75 1d                	jne    0x45b4b5
  45b496:	75 1d                	jne    0x45b4b5
  45b498:	6a 10                	push   0x10
  45b498:	6a 10                	push   0x10
  45b49a:	b9 b8 b4 45 00       	mov    ecx,0x45b4b8
  45b49a:	b9 b8 b4 45 00       	mov    ecx,0x45b4b8
  45b49f:	ba c4 b4 45 00       	mov    edx,0x45b4c4
  45b49f:	ba c4 b4 45 00       	mov    edx,0x45b4c4
  45b4a4:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b4a4:	a1 ec d5 45 00       	mov    eax,ds:0x45d5ec
  45b4a9:	8b 00                	mov    eax,DWORD PTR [eax]
  45b4a9:	8b 00                	mov    eax,DWORD PTR [eax]
  45b4ab:	e8 68 7e fe ff       	call   0x443318
  45b4ab:	e8 68 7e fe ff       	call   0x443318
  45b4b0:	e8 27 83 fa ff       	call   0x4037dc
  45b4b0:	e8 27 83 fa ff       	call   0x4037dc
