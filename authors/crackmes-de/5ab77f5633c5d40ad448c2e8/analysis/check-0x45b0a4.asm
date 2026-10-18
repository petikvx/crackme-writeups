
/tmp/c2e8/un.exe:     file format pei-i386


Disassembly of section CODE:

0045b0a4 <CODE+0x5a0a4>:
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
