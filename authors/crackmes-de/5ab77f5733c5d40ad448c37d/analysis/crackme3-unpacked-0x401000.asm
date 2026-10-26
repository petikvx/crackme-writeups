
analysis/crackme3-fsg-image.bin:     file format binary


Disassembly of section .data:

00401000 <.data+0x1000>:
  401000:	55                   	push   ebp
  401001:	89 e5                	mov    ebp,esp
  401003:	83 ec 18             	sub    esp,0x18
  401006:	89 5d f8             	mov    DWORD PTR [ebp-0x8],ebx
  401009:	8b 55 08             	mov    edx,DWORD PTR [ebp+0x8]
  40100c:	31 db                	xor    ebx,ebx
  40100e:	89 75 fc             	mov    DWORD PTR [ebp-0x4],esi
  401011:	8b 02                	mov    eax,DWORD PTR [edx]
  401013:	31 f6                	xor    esi,esi
  401015:	8b 00                	mov    eax,DWORD PTR [eax]
  401017:	3d 91 00 00 c0       	cmp    eax,0xc0000091
  40101c:	77 43                	ja     0x401061
  40101e:	3d 8d 00 00 c0       	cmp    eax,0xc000008d
  401023:	72 5b                	jb     0x401080
  401025:	be 01 00 00 00       	mov    esi,0x1
  40102a:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  401031:	31 c0                	xor    eax,eax
  401033:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401037:	e8 84 09 00 00       	call   0x4019c0
  40103c:	83 f8 01             	cmp    eax,0x1
  40103f:	74 6c                	je     0x4010ad
  401041:	85 c0                	test   eax,eax
  401043:	74 2a                	je     0x40106f
  401045:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  40104c:	ff d0                	call   eax
  40104e:	bb ff ff ff ff       	mov    ebx,0xffffffff
  401053:	89 d8                	mov    eax,ebx
  401055:	8b 75 fc             	mov    esi,DWORD PTR [ebp-0x4]
  401058:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  40105b:	89 ec                	mov    esp,ebp
  40105d:	5d                   	pop    ebp
  40105e:	c2 04 00             	ret    0x4
  401061:	3d 93 00 00 c0       	cmp    eax,0xc0000093
  401066:	74 bd                	je     0x401025
  401068:	3d 94 00 00 c0       	cmp    eax,0xc0000094
  40106d:	74 bb                	je     0x40102a
  40106f:	89 d8                	mov    eax,ebx
  401071:	8b 75 fc             	mov    esi,DWORD PTR [ebp-0x4]
  401074:	8b 5d f8             	mov    ebx,DWORD PTR [ebp-0x8]
  401077:	89 ec                	mov    esp,ebp
  401079:	5d                   	pop    ebp
  40107a:	c2 04 00             	ret    0x4
  40107d:	8d 76 00             	lea    esi,[esi+0x0]
  401080:	3d 05 00 00 c0       	cmp    eax,0xc0000005
  401085:	75 e8                	jne    0x40106f
  401087:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  40108e:	31 f6                	xor    esi,esi
  401090:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  401094:	e8 27 09 00 00       	call   0x4019c0
  401099:	83 f8 01             	cmp    eax,0x1
  40109c:	74 34                	je     0x4010d2
  40109e:	85 c0                	test   eax,eax
  4010a0:	74 cd                	je     0x40106f
  4010a2:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4010a9:	ff d0                	call   eax
  4010ab:	eb a1                	jmp    0x40104e
  4010ad:	c7 04 24 08 00 00 00 	mov    DWORD PTR [esp],0x8
  4010b4:	bb 01 00 00 00       	mov    ebx,0x1
  4010b9:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  4010bd:	e8 fe 08 00 00       	call   0x4019c0
  4010c2:	85 f6                	test   esi,esi
  4010c4:	74 88                	je     0x40104e
  4010c6:	e8 25 04 00 00       	call   0x4014f0
  4010cb:	bb ff ff ff ff       	mov    ebx,0xffffffff
  4010d0:	eb 81                	jmp    0x401053
  4010d2:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4010d9:	b9 01 00 00 00       	mov    ecx,0x1
  4010de:	bb ff ff ff ff       	mov    ebx,0xffffffff
  4010e3:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4010e7:	e8 d4 08 00 00       	call   0x4019c0
  4010ec:	e9 62 ff ff ff       	jmp    0x401053
  4010f1:	eb 0d                	jmp    0x401100
  4010f3:	90                   	nop
  4010f4:	90                   	nop
  4010f5:	90                   	nop
  4010f6:	90                   	nop
  4010f7:	90                   	nop
  4010f8:	90                   	nop
  4010f9:	90                   	nop
  4010fa:	90                   	nop
  4010fb:	90                   	nop
  4010fc:	90                   	nop
  4010fd:	90                   	nop
  4010fe:	90                   	nop
  4010ff:	90                   	nop
  401100:	55                   	push   ebp
  401101:	89 e5                	mov    ebp,esp
  401103:	53                   	push   ebx
  401104:	83 ec 24             	sub    esp,0x24
  401107:	8d 5d f8             	lea    ebx,[ebp-0x8]
  40110a:	c7 04 24 00 10 40 00 	mov    DWORD PTR [esp],0x401000
  401111:	e8 5a 09 00 00       	call   0x401a70
  401116:	83 ec 04             	sub    esp,0x4
  401119:	e8 d2 03 00 00       	call   0x4014f0
  40111e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  401125:	b8 00 40 40 00       	mov    eax,0x404000
  40112a:	8d 55 f4             	lea    edx,[ebp-0xc]
  40112d:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  401131:	8b 0d 00 20 40 00    	mov    ecx,DWORD PTR ds:0x402000
  401137:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40113b:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  40113f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  401143:	c7 04 24 04 40 40 00 	mov    DWORD PTR [esp],0x404004
  40114a:	e8 a1 08 00 00       	call   0x4019f0
  40114f:	a1 10 40 40 00       	mov    eax,ds:0x404010
  401154:	85 c0                	test   eax,eax
  401156:	74 58                	je     0x4011b0
  401158:	a3 10 20 40 00       	mov    ds:0x402010,eax
  40115d:	8b 15 04 51 40 00    	mov    edx,DWORD PTR ds:0x405104
  401163:	85 d2                	test   edx,edx
  401165:	0f 85 8b 00 00 00    	jne    0x4011f6
  40116b:	83 fa e0             	cmp    edx,0xffffffe0
  40116e:	74 20                	je     0x401190
  401170:	a1 10 40 40 00       	mov    eax,ds:0x404010
  401175:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401179:	8b 1d 04 51 40 00    	mov    ebx,DWORD PTR ds:0x405104
  40117f:	8b 4b 30             	mov    ecx,DWORD PTR [ebx+0x30]
  401182:	89 0c 24             	mov    DWORD PTR [esp],ecx
  401185:	e8 56 08 00 00       	call   0x4019e0
  40118a:	8b 15 04 51 40 00    	mov    edx,DWORD PTR ds:0x405104
  401190:	83 fa c0             	cmp    edx,0xffffffc0
  401193:	74 1b                	je     0x4011b0
  401195:	8b 1d 10 40 40 00    	mov    ebx,DWORD PTR ds:0x404010
  40119b:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  40119f:	8b 0d 04 51 40 00    	mov    ecx,DWORD PTR ds:0x405104
  4011a5:	8b 51 50             	mov    edx,DWORD PTR [ecx+0x50]
  4011a8:	89 14 24             	mov    DWORD PTR [esp],edx
  4011ab:	e8 30 08 00 00       	call   0x4019e0
  4011b0:	e8 1b 08 00 00       	call   0x4019d0
  4011b5:	8b 1d 10 20 40 00    	mov    ebx,DWORD PTR ds:0x402010
  4011bb:	89 18                	mov    DWORD PTR [eax],ebx
  4011bd:	e8 fe 02 00 00       	call   0x4014c0
  4011c2:	83 e4 f0             	and    esp,0xfffffff0
  4011c5:	e8 e6 07 00 00       	call   0x4019b0
  4011ca:	8b 08                	mov    ecx,DWORD PTR [eax]
  4011cc:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  4011d0:	8b 15 00 40 40 00    	mov    edx,DWORD PTR ds:0x404000
  4011d6:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4011da:	a1 04 40 40 00       	mov    eax,ds:0x404004
  4011df:	89 04 24             	mov    DWORD PTR [esp],eax
  4011e2:	e8 a9 00 00 00       	call   0x401290
  4011e7:	89 c3                	mov    ebx,eax
  4011e9:	e8 b2 07 00 00       	call   0x4019a0
  4011ee:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4011f1:	e8 8a 08 00 00       	call   0x401a80
  4011f6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011fa:	8b 15 04 51 40 00    	mov    edx,DWORD PTR ds:0x405104
  401200:	8b 42 10             	mov    eax,DWORD PTR [edx+0x10]
  401203:	89 04 24             	mov    DWORD PTR [esp],eax
  401206:	e8 d5 07 00 00       	call   0x4019e0
  40120b:	8b 15 04 51 40 00    	mov    edx,DWORD PTR ds:0x405104
  401211:	e9 55 ff ff ff       	jmp    0x40116b
  401216:	8d 76 00             	lea    esi,[esi+0x0]
  401219:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401220:	55                   	push   ebp
  401221:	89 e5                	mov    ebp,esp
  401223:	83 ec 08             	sub    esp,0x8
  401226:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40122d:	ff 15 fc 50 40 00    	call   DWORD PTR ds:0x4050fc
  401233:	e8 c8 fe ff ff       	call   0x401100
  401238:	90                   	nop
  401239:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401240:	55                   	push   ebp
  401241:	89 e5                	mov    ebp,esp
  401243:	83 ec 08             	sub    esp,0x8
  401246:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  40124d:	ff 15 fc 50 40 00    	call   DWORD PTR ds:0x4050fc
  401253:	e8 a8 fe ff ff       	call   0x401100
  401258:	90                   	nop
  401259:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401260:	55                   	push   ebp
  401261:	8b 0d 14 51 40 00    	mov    ecx,DWORD PTR ds:0x405114
  401267:	89 e5                	mov    ebp,esp
  401269:	5d                   	pop    ebp
  40126a:	ff e1                	jmp    ecx
  40126c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401270:	55                   	push   ebp
  401271:	8b 0d 08 51 40 00    	mov    ecx,DWORD PTR ds:0x405108
  401277:	89 e5                	mov    ebp,esp
  401279:	5d                   	pop    ebp
  40127a:	ff e1                	jmp    ecx
  40127c:	90                   	nop
  40127d:	90                   	nop
  40127e:	90                   	nop
  40127f:	90                   	nop
  401280:	55                   	push   ebp
  401281:	89 e5                	mov    ebp,esp
  401283:	5d                   	pop    ebp
  401284:	e9 37 04 00 00       	jmp    0x4016c0
  401289:	90                   	nop
  40128a:	90                   	nop
  40128b:	90                   	nop
  40128c:	90                   	nop
  40128d:	90                   	nop
  40128e:	90                   	nop
  40128f:	90                   	nop
  401290:	55                   	push   ebp
  401291:	89 e5                	mov    ebp,esp
  401293:	83 ec 28             	sub    esp,0x28
  401296:	83 e4 f0             	and    esp,0xfffffff0
  401299:	b8 00 00 00 00       	mov    eax,0x0
  40129e:	83 c0 0f             	add    eax,0xf
  4012a1:	83 c0 0f             	add    eax,0xf
  4012a4:	c1 e8 04             	shr    eax,0x4
  4012a7:	c1 e0 04             	shl    eax,0x4
  4012aa:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  4012ad:	8b 45 e4             	mov    eax,DWORD PTR [ebp-0x1c]
  4012b0:	e8 4b 06 00 00       	call   0x401900
  4012b5:	e8 e6 02 00 00       	call   0x4015a0
  4012ba:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012c1:	e8 4a 07 00 00       	call   0x401a10
  4012c6:	c7 04 24 24 30 40 00 	mov    DWORD PTR [esp],0x403024
  4012cd:	e8 3e 07 00 00       	call   0x401a10
  4012d2:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012d9:	e8 32 07 00 00       	call   0x401a10
  4012de:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012e5:	e8 26 07 00 00       	call   0x401a10
  4012ea:	c7 04 24 48 30 40 00 	mov    DWORD PTR [esp],0x403048
  4012f1:	e8 1a 07 00 00       	call   0x401a10
  4012f6:	c7 04 24 6c 30 40 00 	mov    DWORD PTR [esp],0x40306c
  4012fd:	e8 0e 07 00 00       	call   0x401a10
  401302:	c7 04 24 90 30 40 00 	mov    DWORD PTR [esp],0x403090
  401309:	e8 02 07 00 00       	call   0x401a10
  40130e:	c7 04 24 b4 30 40 00 	mov    DWORD PTR [esp],0x4030b4
  401315:	e8 f6 06 00 00       	call   0x401a10
  40131a:	c7 04 24 d8 30 40 00 	mov    DWORD PTR [esp],0x4030d8
  401321:	e8 ea 06 00 00       	call   0x401a10
  401326:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  40132d:	e8 de 06 00 00       	call   0x401a10
  401332:	c7 04 24 fc 30 40 00 	mov    DWORD PTR [esp],0x4030fc
  401339:	e8 d2 06 00 00       	call   0x401a10
  40133e:	c7 04 24 20 31 40 00 	mov    DWORD PTR [esp],0x403120
  401345:	e8 c6 06 00 00       	call   0x401a10
  40134a:	c7 04 24 44 31 40 00 	mov    DWORD PTR [esp],0x403144
  401351:	e8 ba 06 00 00       	call   0x401a10
  401356:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  40135d:	e8 ae 06 00 00       	call   0x401a10
  401362:	c7 04 24 68 31 40 00 	mov    DWORD PTR [esp],0x403168
  401369:	e8 a2 06 00 00       	call   0x401a10
  40136e:	8d 45 fc             	lea    eax,[ebp-0x4]
  401371:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401375:	c7 04 24 75 31 40 00 	mov    DWORD PTR [esp],0x403175
  40137c:	e8 7f 06 00 00       	call   0x401a00
  401381:	c7 04 24 79 31 40 00 	mov    DWORD PTR [esp],0x403179
  401388:	e8 83 06 00 00       	call   0x401a10
  40138d:	8d 45 f8             	lea    eax,[ebp-0x8]
  401390:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401394:	c7 04 24 75 31 40 00 	mov    DWORD PTR [esp],0x403175
  40139b:	e8 60 06 00 00       	call   0x401a00
  4013a0:	81 7d fc 0f 27 00 00 	cmp    DWORD PTR [ebp-0x4],0x270f
  4013a7:	7e 0b                	jle    0x4013b4
  4013a9:	81 7d fc 9f 86 01 00 	cmp    DWORD PTR [ebp-0x4],0x1869f
  4013b0:	7f 02                	jg     0x4013b4
  4013b2:	eb 0c                	jmp    0x4013c0
  4013b4:	c7 04 24 89 31 40 00 	mov    DWORD PTR [esp],0x403189
  4013bb:	e8 50 06 00 00       	call   0x401a10
  4013c0:	83 7d f8 63          	cmp    DWORD PTR [ebp-0x8],0x63
  4013c4:	7e 0b                	jle    0x4013d1
  4013c6:	81 7d f8 e7 03 00 00 	cmp    DWORD PTR [ebp-0x8],0x3e7
  4013cd:	7f 02                	jg     0x4013d1
  4013cf:	eb 0c                	jmp    0x4013dd
  4013d1:	c7 04 24 9a 31 40 00 	mov    DWORD PTR [esp],0x40319a
  4013d8:	e8 33 06 00 00       	call   0x401a10
  4013dd:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4013e0:	89 c2                	mov    edx,eax
  4013e2:	0f af 55 f8          	imul   edx,DWORD PTR [ebp-0x8]
  4013e6:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4013e9:	8b 4d fc             	mov    ecx,DWORD PTR [ebp-0x4]
  4013ec:	01 c1                	add    ecx,eax
  4013ee:	89 4d e4             	mov    DWORD PTR [ebp-0x1c],ecx
  4013f1:	89 d0                	mov    eax,edx
  4013f3:	99                   	cdq
  4013f4:	f7 7d e4             	idiv   DWORD PTR [ebp-0x1c]
  4013f7:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  4013fa:	8b 4d e4             	mov    ecx,DWORD PTR [ebp-0x1c]
  4013fd:	89 4d f4             	mov    DWORD PTR [ebp-0xc],ecx
