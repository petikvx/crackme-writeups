
crackme1-fsg-image.bin:     file format binary


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
  401037:	e8 94 08 00 00       	call   0x4018d0
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
  401094:	e8 37 08 00 00       	call   0x4018d0
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
  4010bd:	e8 0e 08 00 00       	call   0x4018d0
  4010c2:	85 f6                	test   esi,esi
  4010c4:	74 88                	je     0x40104e
  4010c6:	e8 35 03 00 00       	call   0x401400
  4010cb:	bb ff ff ff ff       	mov    ebx,0xffffffff
  4010d0:	eb 81                	jmp    0x401053
  4010d2:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4010d9:	b9 01 00 00 00       	mov    ecx,0x1
  4010de:	bb ff ff ff ff       	mov    ebx,0xffffffff
  4010e3:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4010e7:	e8 e4 07 00 00       	call   0x4018d0
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
  401111:	e8 6a 08 00 00       	call   0x401980
  401116:	83 ec 04             	sub    esp,0x4
  401119:	e8 e2 02 00 00       	call   0x401400
  40111e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  401125:	b8 00 40 40 00       	mov    eax,0x404000
  40112a:	8d 55 f4             	lea    edx,[ebp-0xc]
  40112d:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  401131:	8b 0d 00 20 40 00    	mov    ecx,DWORD PTR ds:0x402000
  401137:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40113b:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  40113f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  401143:	c7 04 24 04 40 40 00 	mov    DWORD PTR [esp],0x404004
  40114a:	e8 b1 07 00 00       	call   0x401900
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
  401185:	e8 66 07 00 00       	call   0x4018f0
  40118a:	8b 15 04 51 40 00    	mov    edx,DWORD PTR ds:0x405104
  401190:	83 fa c0             	cmp    edx,0xffffffc0
  401193:	74 1b                	je     0x4011b0
  401195:	8b 1d 10 40 40 00    	mov    ebx,DWORD PTR ds:0x404010
  40119b:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  40119f:	8b 0d 04 51 40 00    	mov    ecx,DWORD PTR ds:0x405104
  4011a5:	8b 51 50             	mov    edx,DWORD PTR [ecx+0x50]
  4011a8:	89 14 24             	mov    DWORD PTR [esp],edx
  4011ab:	e8 40 07 00 00       	call   0x4018f0
  4011b0:	e8 2b 07 00 00       	call   0x4018e0
  4011b5:	8b 1d 10 20 40 00    	mov    ebx,DWORD PTR ds:0x402010
  4011bb:	89 18                	mov    DWORD PTR [eax],ebx
  4011bd:	e8 0e 02 00 00       	call   0x4013d0
  4011c2:	83 e4 f0             	and    esp,0xfffffff0
  4011c5:	e8 f6 06 00 00       	call   0x4018c0
  4011ca:	8b 08                	mov    ecx,DWORD PTR [eax]
  4011cc:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  4011d0:	8b 15 00 40 40 00    	mov    edx,DWORD PTR ds:0x404000
  4011d6:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4011da:	a1 04 40 40 00       	mov    eax,ds:0x404004
  4011df:	89 04 24             	mov    DWORD PTR [esp],eax
  4011e2:	e8 a9 00 00 00       	call   0x401290
  4011e7:	89 c3                	mov    ebx,eax
  4011e9:	e8 c2 06 00 00       	call   0x4018b0
  4011ee:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4011f1:	e8 9a 07 00 00       	call   0x401990
  4011f6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011fa:	8b 15 04 51 40 00    	mov    edx,DWORD PTR ds:0x405104
  401200:	8b 42 10             	mov    eax,DWORD PTR [edx+0x10]
  401203:	89 04 24             	mov    DWORD PTR [esp],eax
  401206:	e8 e5 06 00 00       	call   0x4018f0
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
  401284:	e9 47 03 00 00       	jmp    0x4015d0
  401289:	90                   	nop
  40128a:	90                   	nop
  40128b:	90                   	nop
  40128c:	90                   	nop
  40128d:	90                   	nop
  40128e:	90                   	nop
  40128f:	90                   	nop
  401290:	55                   	push   ebp
  401291:	89 e5                	mov    ebp,esp
  401293:	83 ec 18             	sub    esp,0x18
  401296:	83 e4 f0             	and    esp,0xfffffff0
  401299:	b8 00 00 00 00       	mov    eax,0x0
  40129e:	83 c0 0f             	add    eax,0xf
  4012a1:	83 c0 0f             	add    eax,0xf
  4012a4:	c1 e8 04             	shr    eax,0x4
  4012a7:	c1 e0 04             	shl    eax,0x4
  4012aa:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  4012ad:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4012b0:	e8 5b 05 00 00       	call   0x401810
  4012b5:	e8 f6 01 00 00       	call   0x4014b0
  4012ba:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012c1:	e8 5a 06 00 00       	call   0x401920
  4012c6:	8d 45 fc             	lea    eax,[ebp-0x4]
  4012c9:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4012cd:	c7 04 24 0f 30 40 00 	mov    DWORD PTR [esp],0x40300f
  4012d4:	e8 37 06 00 00       	call   0x401910
  4012d9:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012dc:	89 04 24             	mov    DWORD PTR [esp],eax
  4012df:	e8 2c 00 00 00       	call   0x401310
  4012e4:	83 f8 01             	cmp    eax,0x1
  4012e7:	75 0e                	jne    0x4012f7
  4012e9:	c7 04 24 13 30 40 00 	mov    DWORD PTR [esp],0x403013
  4012f0:	e8 2b 06 00 00       	call   0x401920
  4012f5:	eb 0c                	jmp    0x401303
  4012f7:	c7 04 24 2a 30 40 00 	mov    DWORD PTR [esp],0x40302a
  4012fe:	e8 1d 06 00 00       	call   0x401920
  401303:	e8 88 05 00 00       	call   0x401890
  401308:	b8 00 00 00 00       	mov    eax,0x0
  40130d:	c9                   	leave
  40130e:	c3                   	ret
  40130f:	90                   	nop
  401310:	55                   	push   ebp
  401311:	89 e5                	mov    ebp,esp
  401313:	53                   	push   ebx
  401314:	83 ec 44             	sub    esp,0x44
  401317:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
  40131b:	78 0b                	js     0x401328
  40131d:	81 7d 08 3f 42 0f 00 	cmp    DWORD PTR [ebp+0x8],0xf423f
  401324:	7f 02                	jg     0x401328
  401326:	eb 0c                	jmp    0x401334
  401328:	c7 04 24 41 30 40 00 	mov    DWORD PTR [esp],0x403041
  40132f:	e8 ec 05 00 00       	call   0x401920
  401334:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  40133b:	83 7d f4 05          	cmp    DWORD PTR [ebp-0xc],0x5
  40133f:	7f 4c                	jg     0x40138d
  401341:	8d 45 f8             	lea    eax,[ebp-0x8]
  401344:	03 45 f4             	add    eax,DWORD PTR [ebp-0xc]
  401347:	8d 58 e0             	lea    ebx,[eax-0x20]
  40134a:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  40134d:	b8 67 66 66 66       	mov    eax,0x66666667
  401352:	f7 e9                	imul   ecx
  401354:	c1 fa 02             	sar    edx,0x2
  401357:	89 c8                	mov    eax,ecx
  401359:	c1 f8 1f             	sar    eax,0x1f
  40135c:	29 c2                	sub    edx,eax
  40135e:	89 d0                	mov    eax,edx
  401360:	c1 e0 02             	shl    eax,0x2
  401363:	01 d0                	add    eax,edx
  401365:	01 c0                	add    eax,eax
  401367:	29 c1                	sub    ecx,eax
  401369:	89 c8                	mov    eax,ecx
  40136b:	88 03                	mov    BYTE PTR [ebx],al
  40136d:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  401370:	b8 67 66 66 66       	mov    eax,0x66666667
  401375:	f7 e9                	imul   ecx
  401377:	c1 fa 02             	sar    edx,0x2
  40137a:	89 c8                	mov    eax,ecx
  40137c:	c1 f8 1f             	sar    eax,0x1f
  40137f:	29 c2                	sub    edx,eax
  401381:	89 d0                	mov    eax,edx
  401383:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
  401386:	8d 45 f4             	lea    eax,[ebp-0xc]
  401389:	ff 00                	inc    DWORD PTR [eax]
  40138b:	eb ae                	jmp    0x40133b
  40138d:	0f be 55 d8          	movsx  edx,BYTE PTR [ebp-0x28]
  401391:	0f be 45 d9          	movsx  eax,BYTE PTR [ebp-0x27]
  401395:	01 c2                	add    edx,eax
  401397:	0f be 45 da          	movsx  eax,BYTE PTR [ebp-0x26]
  40139b:	8d 0c 02             	lea    ecx,[edx+eax*1]
  40139e:	0f be 55 db          	movsx  edx,BYTE PTR [ebp-0x25]
  4013a2:	0f be 45 dc          	movsx  eax,BYTE PTR [ebp-0x24]
  4013a6:	01 c2                	add    edx,eax
  4013a8:	0f be 45 dd          	movsx  eax,BYTE PTR [ebp-0x23]
  4013ac:	8d 04 02             	lea    eax,[edx+eax*1]
  4013af:	39 c1                	cmp    ecx,eax
  4013b1:	75 09                	jne    0x4013bc
  4013b3:	c7 45 d4 01 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x1
  4013ba:	eb 07                	jmp    0x4013c3
  4013bc:	c7 45 d4 00 00 00 00 	mov    DWORD PTR [ebp-0x2c],0x0
  4013c3:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4013c6:	83 c4 44             	add    esp,0x44
  4013c9:	5b                   	pop    ebx
  4013ca:	5d                   	pop    ebp
  4013cb:	c3                   	ret
  4013cc:	90                   	nop
  4013cd:	90                   	nop
  4013ce:	90                   	nop
  4013cf:	90                   	nop
  4013d0:	55                   	push   ebp
  4013d1:	b9 30 31 40 00       	mov    ecx,0x403130
  4013d6:	89 e5                	mov    ebp,esp
  4013d8:	eb 14                	jmp    0x4013ee
  4013da:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4013e0:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  4013e3:	8b 01                	mov    eax,DWORD PTR [ecx]
  4013e5:	83 c1 08             	add    ecx,0x8
  4013e8:	01 82 00 00 40 00    	add    DWORD PTR [edx+0x400000],eax
  4013ee:	81 f9 30 31 40 00    	cmp    ecx,0x403130
  4013f4:	72 ea                	jb     0x4013e0
  4013f6:	5d                   	pop    ebp
  4013f7:	c3                   	ret
  4013f8:	90                   	nop
  4013f9:	90                   	nop
  4013fa:	90                   	nop
  4013fb:	90                   	nop
  4013fc:	90                   	nop
  4013fd:	90                   	nop
  4013fe:	90                   	nop
  4013ff:	90                   	nop
  401400:	55                   	push   ebp
  401401:	89 e5                	mov    ebp,esp
  401403:	db e3                	fninit
  401405:	5d                   	pop    ebp
  401406:	c3                   	ret
  401407:	90                   	nop
  401408:	90                   	nop
  401409:	90                   	nop
  40140a:	90                   	nop
  40140b:	90                   	nop
  40140c:	90                   	nop
  40140d:	90                   	nop
  40140e:	90                   	nop
  40140f:	90                   	nop
  401410:	55                   	push   ebp
  401411:	89 e5                	mov    ebp,esp
  401413:	83 ec 08             	sub    esp,0x8
  401416:	a1 20 20 40 00       	mov    eax,ds:0x402020
  40141b:	8b 08                	mov    ecx,DWORD PTR [eax]
  40141d:	85 c9                	test   ecx,ecx
  40141f:	74 26                	je     0x401447
  401421:	eb 0d                	jmp    0x401430
  401423:	90                   	nop
  401424:	90                   	nop
  401425:	90                   	nop
  401426:	90                   	nop
  401427:	90                   	nop
  401428:	90                   	nop
  401429:	90                   	nop
  40142a:	90                   	nop
  40142b:	90                   	nop
  40142c:	90                   	nop
  40142d:	90                   	nop
  40142e:	90                   	nop
  40142f:	90                   	nop
  401430:	ff 10                	call   DWORD PTR [eax]
  401432:	8b 0d 20 20 40 00    	mov    ecx,DWORD PTR ds:0x402020
  401438:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  40143b:	8d 41 04             	lea    eax,[ecx+0x4]
  40143e:	a3 20 20 40 00       	mov    ds:0x402020,eax
  401443:	85 d2                	test   edx,edx
  401445:	75 e9                	jne    0x401430
  401447:	c9                   	leave
  401448:	c3                   	ret
  401449:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401450:	55                   	push   ebp
  401451:	89 e5                	mov    ebp,esp
  401453:	53                   	push   ebx
  401454:	83 ec 04             	sub    esp,0x4
  401457:	a1 e0 19 40 00       	mov    eax,ds:0x4019e0
  40145c:	83 f8 ff             	cmp    eax,0xffffffff
  40145f:	74 29                	je     0x40148a
  401461:	85 c0                	test   eax,eax
  401463:	89 c3                	mov    ebx,eax
  401465:	74 13                	je     0x40147a
  401467:	89 f6                	mov    esi,esi
  401469:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401470:	ff 14 9d e0 19 40 00 	call   DWORD PTR [ebx*4+0x4019e0]
  401477:	4b                   	dec    ebx
  401478:	75 f6                	jne    0x401470
  40147a:	c7 04 24 10 14 40 00 	mov    DWORD PTR [esp],0x401410
  401481:	e8 da fd ff ff       	call   0x401260
  401486:	5b                   	pop    ebx
  401487:	5b                   	pop    ebx
  401488:	5d                   	pop    ebp
  401489:	c3                   	ret
  40148a:	8b 0d e4 19 40 00    	mov    ecx,DWORD PTR ds:0x4019e4
  401490:	31 c0                	xor    eax,eax
  401492:	85 c9                	test   ecx,ecx
  401494:	eb 0a                	jmp    0x4014a0
  401496:	40                   	inc    eax
  401497:	8b 14 85 e4 19 40 00 	mov    edx,DWORD PTR [eax*4+0x4019e4]
  40149e:	85 d2                	test   edx,edx
  4014a0:	75 f4                	jne    0x401496
  4014a2:	eb bd                	jmp    0x401461
  4014a4:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  4014aa:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
  4014b0:	55                   	push   ebp
  4014b1:	89 e5                	mov    ebp,esp
  4014b3:	53                   	push   ebx
  4014b4:	83 ec 04             	sub    esp,0x4
  4014b7:	a1 20 40 40 00       	mov    eax,ds:0x404020
  4014bc:	85 c0                	test   eax,eax
  4014be:	75 36                	jne    0x4014f6
  4014c0:	a1 e0 19 40 00       	mov    eax,ds:0x4019e0
  4014c5:	bb 01 00 00 00       	mov    ebx,0x1
  4014ca:	89 1d 20 40 40 00    	mov    DWORD PTR ds:0x404020,ebx
  4014d0:	83 f8 ff             	cmp    eax,0xffffffff
  4014d3:	74 25                	je     0x4014fa
  4014d5:	85 c0                	test   eax,eax
  4014d7:	89 c3                	mov    ebx,eax
  4014d9:	74 0f                	je     0x4014ea
  4014db:	90                   	nop
  4014dc:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  4014e0:	ff 14 9d e0 19 40 00 	call   DWORD PTR [ebx*4+0x4019e0]
  4014e7:	4b                   	dec    ebx
  4014e8:	75 f6                	jne    0x4014e0
  4014ea:	c7 04 24 10 14 40 00 	mov    DWORD PTR [esp],0x401410
  4014f1:	e8 6a fd ff ff       	call   0x401260
  4014f6:	5b                   	pop    ebx
  4014f7:	5b                   	pop    ebx
  4014f8:	5d                   	pop    ebp
  4014f9:	c3                   	ret
  4014fa:	8b 0d e4 19 40 00    	mov    ecx,DWORD PTR ds:0x4019e4
  401500:	31 c0                	xor    eax,eax
  401502:	85 c9                	test   ecx,ecx
  401504:	eb 0a                	jmp    0x401510
  401506:	40                   	inc    eax
  401507:	8b 14 85 e4 19 40 00 	mov    edx,DWORD PTR [eax*4+0x4019e4]
  40150e:	85 d2                	test   edx,edx
  401510:	75 f4                	jne    0x401506
  401512:	eb c1                	jmp    0x4014d5
  401514:	90                   	nop
  401515:	90                   	nop
  401516:	90                   	nop
  401517:	90                   	nop
  401518:	90                   	nop
  401519:	90                   	nop
  40151a:	90                   	nop
  40151b:	90                   	nop
  40151c:	90                   	nop
  40151d:	90                   	nop
  40151e:	90                   	nop
  40151f:	90                   	nop
  401520:	55                   	push   ebp
  401521:	a1 70 40 40 00       	mov    eax,ds:0x404070
  401526:	89 e5                	mov    ebp,esp
  401528:	5d                   	pop    ebp
  401529:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  40152c:	ff e1                	jmp    ecx
  40152e:	89 f6                	mov    esi,esi
  401530:	55                   	push   ebp
  401531:	ba 42 00 00 00       	mov    edx,0x42
  401536:	89 e5                	mov    ebp,esp
  401538:	53                   	push   ebx
  401539:	0f b7 c0             	movzx  eax,ax
  40153c:	83 ec 64             	sub    esp,0x64
  40153f:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401543:	8d 55 a8             	lea    edx,[ebp-0x58]
  401546:	31 db                	xor    ebx,ebx
  401548:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  40154c:	89 04 24             	mov    DWORD PTR [esp],eax
  40154f:	ff 15 d4 50 40 00    	call   DWORD PTR ds:0x4050d4
  401555:	ba 1f 00 00 00       	mov    edx,0x1f
  40155a:	b9 01 00 00 00       	mov    ecx,0x1
  40155f:	83 ec 0c             	sub    esp,0xc
  401562:	85 c0                	test   eax,eax
  401564:	75 07                	jne    0x40156d
  401566:	eb 46                	jmp    0x4015ae
  401568:	01 c9                	add    ecx,ecx
  40156a:	4a                   	dec    edx
  40156b:	78 0e                	js     0x40157b
  40156d:	80 7c 2a a8 41       	cmp    BYTE PTR [edx+ebp*1-0x58],0x41
  401572:	75 f4                	jne    0x401568
  401574:	09 cb                	or     ebx,ecx
  401576:	01 c9                	add    ecx,ecx
  401578:	4a                   	dec    edx
  401579:	79 f2                	jns    0x40156d
  40157b:	83 3b 3c             	cmp    DWORD PTR [ebx],0x3c
  40157e:	75 07                	jne    0x401587
  401580:	89 d8                	mov    eax,ebx
  401582:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401585:	c9                   	leave
  401586:	c3                   	ret
  401587:	b9 74 30 40 00       	mov    ecx,0x403074
  40158c:	ba ea 00 00 00       	mov    edx,0xea
  401591:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  401595:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401599:	c7 04 24 a1 30 40 00 	mov    DWORD PTR [esp],0x4030a1
  4015a0:	b8 c0 30 40 00       	mov    eax,0x4030c0
  4015a5:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4015a9:	e8 92 02 00 00       	call   0x401840
  4015ae:	b8 ec 30 40 00       	mov    eax,0x4030ec
  4015b3:	bb e4 00 00 00       	mov    ebx,0xe4
  4015b8:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  4015bc:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  4015c0:	eb d7                	jmp    0x401599
  4015c2:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4015c9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  4015d0:	55                   	push   ebp
  4015d1:	89 e5                	mov    ebp,esp
  4015d3:	57                   	push   edi
  4015d4:	56                   	push   esi
  4015d5:	53                   	push   ebx
  4015d6:	81 ec cc 00 00 00    	sub    esp,0xcc
  4015dc:	8b 0d 70 40 40 00    	mov    ecx,DWORD PTR ds:0x404070
  4015e2:	85 c9                	test   ecx,ecx
  4015e4:	74 08                	je     0x4015ee
  4015e6:	8d 65 f4             	lea    esp,[ebp-0xc]
  4015e9:	5b                   	pop    ebx
  4015ea:	5e                   	pop    esi
  4015eb:	5f                   	pop    edi
  4015ec:	5d                   	pop    ebp
  4015ed:	c3                   	ret
  4015ee:	c7 45 98 41 41 41 41 	mov    DWORD PTR [ebp-0x68],0x41414141
  4015f5:	a1 50 30 40 00       	mov    eax,ds:0x403050
  4015fa:	8d 75 98             	lea    esi,[ebp-0x68]
  4015fd:	c7 45 9c 41 41 41 41 	mov    DWORD PTR [ebp-0x64],0x41414141
  401604:	c7 45 a0 41 41 41 41 	mov    DWORD PTR [ebp-0x60],0x41414141
  40160b:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40160e:	a1 54 30 40 00       	mov    eax,ds:0x403054
  401613:	c7 45 a4 41 41 41 41 	mov    DWORD PTR [ebp-0x5c],0x41414141
  40161a:	c7 45 a8 41 41 41 41 	mov    DWORD PTR [ebp-0x58],0x41414141
  401621:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  401624:	a1 58 30 40 00       	mov    eax,ds:0x403058
  401629:	c7 45 ac 41 41 41 41 	mov    DWORD PTR [ebp-0x54],0x41414141
  401630:	c7 45 b0 41 41 41 41 	mov    DWORD PTR [ebp-0x50],0x41414141
  401637:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  40163a:	a1 5c 30 40 00       	mov    eax,ds:0x40305c
  40163f:	c7 45 b4 41 41 41 41 	mov    DWORD PTR [ebp-0x4c],0x41414141
  401646:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  401649:	a1 60 30 40 00       	mov    eax,ds:0x403060
  40164e:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  401651:	a1 64 30 40 00       	mov    eax,ds:0x403064
  401656:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  401659:	a1 68 30 40 00       	mov    eax,ds:0x403068
  40165e:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  401661:	a1 6c 30 40 00       	mov    eax,ds:0x40306c
  401666:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  401669:	0f b7 05 70 30 40 00 	movzx  eax,WORD PTR ds:0x403070
  401670:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  401674:	89 34 24             	mov    DWORD PTR [esp],esi
  401677:	ff 15 d0 50 40 00    	call   DWORD PTR ds:0x4050d0
  40167d:	0f b7 c0             	movzx  eax,ax
  401680:	83 ec 04             	sub    esp,0x4
  401683:	85 c0                	test   eax,eax
  401685:	89 85 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],eax
  40168b:	0f 85 3b 01 00 00    	jne    0x4017cc
  401691:	c7 04 24 3c 00 00 00 	mov    DWORD PTR [esp],0x3c
  401698:	e8 a3 02 00 00       	call   0x401940
  40169d:	85 c0                	test   eax,eax
  40169f:	89 c3                	mov    ebx,eax
  4016a1:	0f 84 59 01 00 00    	je     0x401800
  4016a7:	fc                   	cld
  4016a8:	89 c7                	mov    edi,eax
  4016aa:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  4016b0:	b9 0f 00 00 00       	mov    ecx,0xf
  4016b5:	f3 ab                	rep stos DWORD PTR es:[edi],eax
  4016b7:	c7 43 04 50 19 40 00 	mov    DWORD PTR [ebx+0x4],0x401950
  4016be:	b9 01 00 00 00       	mov    ecx,0x1
  4016c3:	c7 43 08 20 15 40 00 	mov    DWORD PTR [ebx+0x8],0x401520
  4016ca:	a1 40 40 40 00       	mov    eax,ds:0x404040
  4016cf:	c7 03 3c 00 00 00    	mov    DWORD PTR [ebx],0x3c
  4016d5:	8b 15 44 40 40 00    	mov    edx,DWORD PTR ds:0x404044
  4016db:	c7 43 28 00 00 00 00 	mov    DWORD PTR [ebx+0x28],0x0
  4016e2:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
  4016e5:	a1 30 20 40 00       	mov    eax,ds:0x402030
  4016ea:	89 53 18             	mov    DWORD PTR [ebx+0x18],edx
  4016ed:	8b 15 34 20 40 00    	mov    edx,DWORD PTR ds:0x402034
  4016f3:	89 43 1c             	mov    DWORD PTR [ebx+0x1c],eax
  4016f6:	a1 50 40 40 00       	mov    eax,ds:0x404050
  4016fb:	89 53 20             	mov    DWORD PTR [ebx+0x20],edx
  4016fe:	c7 43 30 ff ff ff ff 	mov    DWORD PTR [ebx+0x30],0xffffffff
  401705:	89 43 2c             	mov    DWORD PTR [ebx+0x2c],eax
  401708:	8b 15 3c 20 40 00    	mov    edx,DWORD PTR ds:0x40203c
  40170e:	a1 38 20 40 00       	mov    eax,ds:0x402038
  401713:	89 53 38             	mov    DWORD PTR [ebx+0x38],edx
  401716:	ba 1f 00 00 00       	mov    edx,0x1f
  40171b:	89 43 34             	mov    DWORD PTR [ebx+0x34],eax
  40171e:	89 f6                	mov    esi,esi
  401720:	89 d8                	mov    eax,ebx
  401722:	21 c8                	and    eax,ecx
  401724:	83 f8 01             	cmp    eax,0x1
  401727:	19 c0                	sbb    eax,eax
  401729:	24 20                	and    al,0x20
  40172b:	01 c9                	add    ecx,ecx
  40172d:	04 41                	add    al,0x41
  40172f:	88 84 2a 48 ff ff ff 	mov    BYTE PTR [edx+ebp*1-0xb8],al
  401736:	4a                   	dec    edx
  401737:	79 e7                	jns    0x401720
  401739:	a1 50 30 40 00       	mov    eax,ds:0x403050
  40173e:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
  401744:	a1 54 30 40 00       	mov    eax,ds:0x403054
  401749:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
  40174f:	a1 58 30 40 00       	mov    eax,ds:0x403058
  401754:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  40175a:	a1 5c 30 40 00       	mov    eax,ds:0x40305c
  40175f:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  401765:	a1 60 30 40 00       	mov    eax,ds:0x403060
  40176a:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  401770:	a1 64 30 40 00       	mov    eax,ds:0x403064
  401775:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  40177b:	a1 68 30 40 00       	mov    eax,ds:0x403068
  401780:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
  401783:	a1 6c 30 40 00       	mov    eax,ds:0x40306c
  401788:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  40178b:	0f b7 05 70 30 40 00 	movzx  eax,WORD PTR ds:0x403070
  401792:	66 89 45 88          	mov    WORD PTR [ebp-0x78],ax
  401796:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  40179c:	89 04 24             	mov    DWORD PTR [esp],eax
  40179f:	ff 15 c8 50 40 00    	call   DWORD PTR ds:0x4050c8
  4017a5:	0f b7 f8             	movzx  edi,ax
  4017a8:	83 ec 04             	sub    esp,0x4
  4017ab:	85 ff                	test   edi,edi
  4017ad:	75 42                	jne    0x4017f1
  4017af:	31 d2                	xor    edx,edx
  4017b1:	85 d2                	test   edx,edx
  4017b3:	75 1e                	jne    0x4017d3
  4017b5:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4017b8:	e8 73 01 00 00       	call   0x401930
  4017bd:	89 34 24             	mov    DWORD PTR [esp],esi
  4017c0:	ff 15 d0 50 40 00    	call   DWORD PTR ds:0x4050d0
  4017c6:	83 ec 04             	sub    esp,0x4
  4017c9:	0f b7 c0             	movzx  eax,ax
  4017cc:	e8 5f fd ff ff       	call   0x401530
  4017d1:	89 c3                	mov    ebx,eax
  4017d3:	89 1d 70 40 40 00    	mov    DWORD PTR ds:0x404070,ebx
  4017d9:	8d 43 04             	lea    eax,[ebx+0x4]
  4017dc:	a3 60 40 40 00       	mov    ds:0x404060,eax
  4017e1:	8d 43 08             	lea    eax,[ebx+0x8]
  4017e4:	a3 80 40 40 00       	mov    ds:0x404080,eax
  4017e9:	8d 65 f4             	lea    esp,[ebp-0xc]
  4017ec:	5b                   	pop    ebx
  4017ed:	5e                   	pop    esi
  4017ee:	5f                   	pop    edi
  4017ef:	5d                   	pop    ebp
  4017f0:	c3                   	ret
  4017f1:	89 f8                	mov    eax,edi
  4017f3:	e8 38 fd ff ff       	call   0x401530
  4017f8:	39 d8                	cmp    eax,ebx
  4017fa:	89 fa                	mov    edx,edi
  4017fc:	75 b1                	jne    0x4017af
  4017fe:	eb b1                	jmp    0x4017b1
  401800:	e8 4b 01 00 00       	call   0x401950
  401805:	90                   	nop
  401806:	90                   	nop
  401807:	90                   	nop
  401808:	90                   	nop
  401809:	90                   	nop
  40180a:	90                   	nop
  40180b:	90                   	nop
  40180c:	90                   	nop
  40180d:	90                   	nop
  40180e:	90                   	nop
  40180f:	90                   	nop
  401810:	51                   	push   ecx
  401811:	89 e1                	mov    ecx,esp
  401813:	83 c1 08             	add    ecx,0x8
  401816:	3d 00 10 00 00       	cmp    eax,0x1000
  40181b:	72 10                	jb     0x40182d
  40181d:	81 e9 00 10 00 00    	sub    ecx,0x1000
  401823:	83 09 00             	or     DWORD PTR [ecx],0x0
  401826:	2d 00 10 00 00       	sub    eax,0x1000
  40182b:	eb e9                	jmp    0x401816
  40182d:	29 c1                	sub    ecx,eax
  40182f:	83 09 00             	or     DWORD PTR [ecx],0x0
  401832:	89 e0                	mov    eax,esp
  401834:	89 cc                	mov    esp,ecx
  401836:	8b 08                	mov    ecx,DWORD PTR [eax]
  401838:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  40183b:	ff e0                	jmp    eax
  40183d:	90                   	nop
  40183e:	90                   	nop
  40183f:	90                   	nop
  401840:	55                   	push   ebp
  401841:	89 e5                	mov    ebp,esp
  401843:	83 ec 18             	sub    esp,0x18
  401846:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  401849:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  40184d:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  401850:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401854:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401857:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  40185b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40185e:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401862:	a1 04 51 40 00       	mov    eax,ds:0x405104
  401867:	83 c0 40             	add    eax,0x40
  40186a:	89 04 24             	mov    DWORD PTR [esp],eax
  40186d:	e8 fe 00 00 00       	call   0x401970
  401872:	a1 04 51 40 00       	mov    eax,ds:0x405104
  401877:	83 c0 40             	add    eax,0x40
  40187a:	89 04 24             	mov    DWORD PTR [esp],eax
  40187d:	e8 de 00 00 00       	call   0x401960
  401882:	e8 c9 00 00 00       	call   0x401950
  401887:	90                   	nop
  401888:	90                   	nop
  401889:	90                   	nop
  40188a:	90                   	nop
  40188b:	90                   	nop
  40188c:	90                   	nop
  40188d:	90                   	nop
  40188e:	90                   	nop
  40188f:	90                   	nop
  401890:	ff 25 e4 50 40 00    	jmp    DWORD PTR ds:0x4050e4
  401896:	90                   	nop
  401897:	90                   	nop
	...
  4018a0:	ff 25 fc 50 40 00    	jmp    DWORD PTR ds:0x4050fc
  4018a6:	90                   	nop
  4018a7:	90                   	nop
	...
  4018b0:	ff 25 00 51 40 00    	jmp    DWORD PTR ds:0x405100
  4018b6:	90                   	nop
  4018b7:	90                   	nop
	...
  4018c0:	ff 25 f4 50 40 00    	jmp    DWORD PTR ds:0x4050f4
  4018c6:	90                   	nop
  4018c7:	90                   	nop
	...
  4018d0:	ff 25 30 51 40 00    	jmp    DWORD PTR ds:0x405130
  4018d6:	90                   	nop
  4018d7:	90                   	nop
	...
  4018e0:	ff 25 f8 50 40 00    	jmp    DWORD PTR ds:0x4050f8
  4018e6:	90                   	nop
  4018e7:	90                   	nop
	...
  4018f0:	ff 25 0c 51 40 00    	jmp    DWORD PTR ds:0x40510c
  4018f6:	90                   	nop
  4018f7:	90                   	nop
	...
  401900:	ff 25 f0 50 40 00    	jmp    DWORD PTR ds:0x4050f0
  401906:	90                   	nop
  401907:	90                   	nop
	...
  401910:	ff 25 2c 51 40 00    	jmp    DWORD PTR ds:0x40512c
  401916:	90                   	nop
  401917:	90                   	nop
	...
  401920:	ff 25 28 51 40 00    	jmp    DWORD PTR ds:0x405128
  401926:	90                   	nop
  401927:	90                   	nop
	...
  401930:	ff 25 20 51 40 00    	jmp    DWORD PTR ds:0x405120
  401936:	90                   	nop
  401937:	90                   	nop
	...
  401940:	ff 25 24 51 40 00    	jmp    DWORD PTR ds:0x405124
  401946:	90                   	nop
  401947:	90                   	nop
	...
  401950:	ff 25 10 51 40 00    	jmp    DWORD PTR ds:0x405110
  401956:	90                   	nop
  401957:	90                   	nop
	...
  401960:	ff 25 18 51 40 00    	jmp    DWORD PTR ds:0x405118
  401966:	90                   	nop
  401967:	90                   	nop
	...
  401970:	ff 25 1c 51 40 00    	jmp    DWORD PTR ds:0x40511c
  401976:	90                   	nop
  401977:	90                   	nop
	...
  401980:	ff 25 d8 50 40 00    	jmp    DWORD PTR ds:0x4050d8
  401986:	90                   	nop
  401987:	90                   	nop
	...
  401990:	ff 25 cc 50 40 00    	jmp    DWORD PTR ds:0x4050cc
  401996:	90                   	nop
  401997:	90                   	nop
	...
  4019a0:	ff 25 d4 50 40 00    	jmp    DWORD PTR ds:0x4050d4
  4019a6:	90                   	nop
  4019a7:	90                   	nop
	...
  4019b0:	ff 25 d0 50 40 00    	jmp    DWORD PTR ds:0x4050d0
  4019b6:	90                   	nop
  4019b7:	90                   	nop
	...
  4019c0:	ff 25 c8 50 40 00    	jmp    DWORD PTR ds:0x4050c8
  4019c6:	90                   	nop
  4019c7:	90                   	nop
	...
  4019d0:	55                   	push   ebp
  4019d1:	89 e5                	mov    ebp,esp
  4019d3:	5d                   	pop    ebp
  4019d4:	e9 a7 f8 ff ff       	jmp    0x401280
  4019d9:	90                   	nop
  4019da:	90                   	nop
  4019db:	90                   	nop
  4019dc:	90                   	nop
  4019dd:	90                   	nop
  4019de:	90                   	nop
  4019df:	90                   	nop
  4019e0:	ff                   	(bad)
  4019e1:	ff                   	(bad)
  4019e2:	ff                   	(bad)
  4019e3:	ff d0                	call   eax
  4019e5:	19 40 00             	sbb    DWORD PTR [eax+0x0],eax
  4019e8:	00 00                	add    BYTE PTR [eax],al
  4019ea:	00 00                	add    BYTE PTR [eax],al
  4019ec:	ff                   	(bad)
  4019ed:	ff                   	(bad)
  4019ee:	ff                   	(bad)
  4019ef:	ff 00                	inc    DWORD PTR [eax]
	...
  401ffd:	00 00                	add    BYTE PTR [eax],al
  401fff:	00 ff                	add    bh,bh
  402001:	ff                   	(bad)
  402002:	ff                   	(bad)
  402003:	ff 00                	inc    DWORD PTR [eax]
	...
  402011:	40                   	inc    eax
	...
  40201e:	00 00                	add    BYTE PTR [eax],al
  402020:	f0 19 40 00          	lock sbb DWORD PTR [eax+0x0],eax
	...
  402034:	ff                   	(bad)
  402035:	ff                   	(bad)
  402036:	ff                   	(bad)
  402037:	ff 00                	inc    DWORD PTR [eax]
  402039:	00 00                	add    BYTE PTR [eax],al
  40203b:	00 ff                	add    bh,bh
  40203d:	ff                   	(bad)
  40203e:	ff                   	(bad)
  40203f:	ff 00                	inc    DWORD PTR [eax]
	...
  402ffd:	00 00                	add    BYTE PTR [eax],al
  402fff:	00 0a                	add    BYTE PTR [edx],cl
  403001:	59                   	pop    ecx
  403002:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403003:	75 72                	jne    0x403077
  403005:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
  403008:	72 69                	jb     0x403073
  40300a:	61                   	popa
  40300b:	6c                   	ins    BYTE PTR es:[edi],dx
  40300c:	3a 20                	cmp    ah,BYTE PTR [eax]
  40300e:	00 25 6c 64 00 0a    	add    BYTE PTR ds:0xa00646c,ah
  403014:	47                   	inc    edi
  403015:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403016:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403017:	64 21 20             	and    DWORD PTR fs:[eax],esp
  40301a:	57                   	push   edi
  40301b:	72 69                	jb     0x403086
  40301d:	74 65                	je     0x403084
  40301f:	20 74 75 74          	and    BYTE PTR [ebp+esi*2+0x74],dh
  403023:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403024:	72 69                	jb     0x40308f
  403026:	61                   	popa
  403027:	6c                   	ins    BYTE PTR es:[edi],dx
  403028:	21 00                	and    DWORD PTR [eax],eax
  40302a:	0a 4e 6f             	or     cl,BYTE PTR [esi+0x6f]
  40302d:	74 20                	je     0x40304f
  40302f:	76 61                	jbe    0x403092
  403031:	6c                   	ins    BYTE PTR es:[edi],dx
  403032:	69 64 21 20 54 72 79 	imul   esp,DWORD PTR [ecx+eiz*1+0x20],0x20797254
  403039:	20 
  40303a:	61                   	popa
  40303b:	67 61                	addr16 popa
  40303d:	69 6e 21 00 0a 36 20 	imul   ebp,DWORD PTR [esi+0x21],0x20360a00
  403044:	63 68 61             	arpl   WORD PTR [eax+0x61],ebp
  403047:	72 73                	jb     0x4030bc
  403049:	2c 20                	sub    al,0x20
  40304b:	70 6c                	jo     0x4030b9
  40304d:	7a 00                	jp     0x40304f
  40304f:	00 2d 4c 49 42 47    	add    BYTE PTR ds:0x4742494c,ch
  403055:	43                   	inc    ebx
  403056:	43                   	inc    ebx
  403057:	57                   	push   edi
  403058:	33 32                	xor    esi,DWORD PTR [edx]
  40305a:	2d 45 48 2d 32       	sub    eax,0x322d4845
  40305f:	2d 53 4a 4c 4a       	sub    eax,0x4a4c4a53
  403064:	2d 47 54 48 52       	sub    eax,0x52485447
  403069:	2d 4d 49 4e 47       	sub    eax,0x474e494d
  40306e:	57                   	push   edi
  40306f:	33 32                	xor    esi,DWORD PTR [edx]
  403071:	00 00                	add    BYTE PTR [eax],al
  403073:	00 77 33             	add    BYTE PTR [edi+0x33],dh
  403076:	32 5f 73             	xor    bl,BYTE PTR [edi+0x73]
  403079:	68 61 72 65 64       	push   0x64657261
  40307e:	70 74                	jo     0x4030f4
  403080:	72 2d                	jb     0x4030af
  403082:	3e 73 69             	ds jae 0x4030ee
  403085:	7a 65                	jp     0x4030ec
  403087:	20 3d 3d 20 73 69    	and    BYTE PTR ds:0x6973203d,bh
  40308d:	7a 65                	jp     0x4030f4
  40308f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403090:	66 28 57 33          	data16 sub BYTE PTR [edi+0x33],dl
  403094:	32 5f 45             	xor    bl,BYTE PTR [edi+0x45]
  403097:	48                   	dec    eax
  403098:	5f                   	pop    edi
  403099:	53                   	push   ebx
  40309a:	48                   	dec    eax
  40309b:	41                   	inc    ecx
  40309c:	52                   	push   edx
  40309d:	45                   	inc    ebp
  40309e:	44                   	inc    esp
  40309f:	29 00                	sub    DWORD PTR [eax],eax
  4030a1:	25 73 3a 25 75       	and    eax,0x75253a73
  4030a6:	3a 20                	cmp    ah,BYTE PTR [eax]
  4030a8:	66 61                	popaw
  4030aa:	69 6c 65 64 20 61 73 	imul   ebp,DWORD PTR [ebp+eiz*2+0x64],0x73736120
  4030b1:	73 
  4030b2:	65 72 74             	gs jb  0x403129
  4030b5:	69 6f 6e 20 60 25 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73256020
  4030bc:	27                   	daa
  4030bd:	0a 00                	or     al,BYTE PTR [eax]
  4030bf:	00 2e                	add    BYTE PTR [esi],ch
  4030c1:	2e 2f                	cs das
  4030c3:	2e 2e 2f             	cs cs das
  4030c6:	67 63 63 2f          	arpl   WORD PTR [bp+di+0x2f],esp
  4030ca:	67 63 63 2f          	arpl   WORD PTR [bp+di+0x2f],esp
  4030ce:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],ebp
  4030d1:	66 69 67 2f 69 33    	imul   sp,WORD PTR [edi+0x2f],0x3369
  4030d7:	38 36                	cmp    BYTE PTR [esi],dh
  4030d9:	2f                   	das
  4030da:	77 33                	ja     0x40310f
  4030dc:	32 2d 73 68 61 72    	xor    ch,BYTE PTR ds:0x72616873
  4030e2:	65 64 2d 70 74 72 2e 	gs fs sub eax,0x2e727470
  4030e9:	63 00                	arpl   WORD PTR [eax],eax
  4030eb:	00 47 65             	add    BYTE PTR [edi+0x65],al
  4030ee:	74 41                	je     0x403131
  4030f0:	74 6f                	je     0x403161
  4030f2:	6d                   	ins    DWORD PTR es:[edi],dx
  4030f3:	4e                   	dec    esi
  4030f4:	61                   	popa
  4030f5:	6d                   	ins    DWORD PTR es:[edi],dx
  4030f6:	65 41                	gs inc ecx
  4030f8:	20 28                	and    BYTE PTR [eax],ch
  4030fa:	61                   	popa
  4030fb:	74 6f                	je     0x40316c
  4030fd:	6d                   	ins    DWORD PTR es:[edi],dx
  4030fe:	2c 20                	sub    al,0x20
  403100:	73 2c                	jae    0x40312e
  403102:	20 73 69             	and    BYTE PTR [ebx+0x69],dh
  403105:	7a 65                	jp     0x40316c
  403107:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403108:	66 28 73 29          	data16 sub BYTE PTR [ebx+0x29],dh
  40310c:	29 20                	sub    DWORD PTR [eax],esp
  40310e:	21 3d 20 30 00 00    	and    DWORD PTR ds:0x3020,edi
	...
  405000:	c8 50 40 00          	enter  0x4050,0x0
  405004:	80 52 40 00          	adc    BYTE PTR [edx+0x40],0x0
  405008:	e4 50                	in     al,0x50
  40500a:	40                   	inc    eax
  40500b:	00 94 52 40 00 f0 50 	add    BYTE PTR [edx+edx*2+0x50f00040],dl
  405012:	40                   	inc    eax
  405013:	00 e4                	add    ah,ah
  405015:	52                   	push   edx
  405016:	40                   	inc    eax
	...
  405027:	00 7c 50 00          	add    BYTE PTR [eax+edx*2+0x0],bh
	...
  4050c7:	00 39                	add    BYTE PTR [ecx],bh
  4050c9:	51                   	push   ecx
  4050ca:	40                   	inc    eax
  4050cb:	00 45 51             	add    BYTE PTR [ebp+0x51],al
  4050ce:	40                   	inc    eax
  4050cf:	00 55 51             	add    BYTE PTR [ebp+0x51],dl
  4050d2:	40                   	inc    eax
  4050d3:	00 61 51             	add    BYTE PTR [ecx+0x51],ah
  4050d6:	40                   	inc    eax
  4050d7:	00 71 51             	add    BYTE PTR [ecx+0x51],dh
  4050da:	40                   	inc    eax
  4050db:	00 ff                	add    bh,bh
  4050dd:	ff                   	(bad)
  4050de:	ff                   	(bad)
  4050df:	7f 00                	jg     0x4050e1
  4050e1:	00 00                	add    BYTE PTR [eax],al
  4050e3:	00 91 51 40 00 ff    	add    BYTE PTR [ecx-0xffbfaf],dl
  4050e9:	ff                   	(bad)
  4050ea:	ff                   	(bad)
  4050eb:	7f 00                	jg     0x4050ed
  4050ed:	00 00                	add    BYTE PTR [eax],al
  4050ef:	00 9d 51 40 00 ad    	add    BYTE PTR [ebp-0x52ffbfaf],bl
  4050f5:	51                   	push   ecx
  4050f6:	40                   	inc    eax
  4050f7:	00 bd 51 40 00 cd    	add    BYTE PTR [ebp-0x32ffbfaf],bh
  4050fd:	51                   	push   ecx
  4050fe:	40                   	inc    eax
  4050ff:	00 e1                	add    cl,ah
  405101:	51                   	push   ecx
  405102:	40                   	inc    eax
  405103:	00 ed                	add    ch,ch
  405105:	51                   	push   ecx
  405106:	40                   	inc    eax
  405107:	00 f5                	add    ch,dh
  405109:	51                   	push   ecx
  40510a:	40                   	inc    eax
  40510b:	00 01                	add    BYTE PTR [ecx],al
  40510d:	52                   	push   edx
  40510e:	40                   	inc    eax
  40510f:	00 0d 52 40 00 15    	add    BYTE PTR ds:0x15004052,cl
  405115:	52                   	push   edx
  405116:	40                   	inc    eax
  405117:	00 21                	add    BYTE PTR [ecx],ah
  405119:	52                   	push   edx
  40511a:	40                   	inc    eax
  40511b:	00 2d 52 40 00 39    	add    BYTE PTR ds:0x39004052,ch
  405121:	52                   	push   edx
  405122:	40                   	inc    eax
  405123:	00 41 52             	add    BYTE PTR [ecx+0x52],al
  405126:	40                   	inc    eax
  405127:	00 4d 52             	add    BYTE PTR [ebp+0x52],cl
  40512a:	40                   	inc    eax
  40512b:	00 59 52             	add    BYTE PTR [ecx+0x52],bl
  40512e:	40                   	inc    eax
  40512f:	00 61 52             	add    BYTE PTR [ecx+0x52],ah
  405132:	40                   	inc    eax
  405133:	00 ff                	add    bh,bh
  405135:	ff                   	(bad)
  405136:	ff                   	(bad)
  405137:	ff 00                	inc    DWORD PTR [eax]
  405139:	00 41 64             	add    BYTE PTR [ecx+0x64],al
  40513c:	64 41                	fs inc ecx
  40513e:	74 6f                	je     0x4051af
  405140:	6d                   	ins    DWORD PTR es:[edi],dx
  405141:	41                   	inc    ecx
  405142:	00 00                	add    BYTE PTR [eax],al
  405144:	00 00                	add    BYTE PTR [eax],al
  405146:	45                   	inc    ebp
  405147:	78 69                	js     0x4051b2
  405149:	74 50                	je     0x40519b
  40514b:	72 6f                	jb     0x4051bc
  40514d:	63 65 73             	arpl   WORD PTR [ebp+0x73],esp
  405150:	73 00                	jae    0x405152
  405152:	00 00                	add    BYTE PTR [eax],al
  405154:	00 00                	add    BYTE PTR [eax],al
  405156:	46                   	inc    esi
  405157:	69 6e 64 41 74 6f 6d 	imul   ebp,DWORD PTR [esi+0x64],0x6d6f7441
  40515e:	41                   	inc    ecx
  40515f:	00 00                	add    BYTE PTR [eax],al
  405161:	00 47 65             	add    BYTE PTR [edi+0x65],al
  405164:	74 41                	je     0x4051a7
  405166:	74 6f                	je     0x4051d7
  405168:	6d                   	ins    DWORD PTR es:[edi],dx
  405169:	4e                   	dec    esi
  40516a:	61                   	popa
  40516b:	6d                   	ins    DWORD PTR es:[edi],dx
  40516c:	65 41                	gs inc ecx
  40516e:	00 00                	add    BYTE PTR [eax],al
  405170:	00 00                	add    BYTE PTR [eax],al
  405172:	53                   	push   ebx
  405173:	65 74 55             	gs je  0x4051cb
  405176:	6e                   	outs   dx,BYTE PTR ds:[esi]
  405177:	68 61 6e 64 6c       	push   0x6c646e61
  40517c:	65 64 45             	gs fs inc ebp
  40517f:	78 63                	js     0x4051e4
  405181:	65 70 74             	gs jo  0x4051f8
  405184:	69 6f 6e 46 69 6c 74 	imul   ebp,DWORD PTR [edi+0x6e],0x746c6946
  40518b:	65 72 00             	gs jb  0x40518e
  40518e:	00 00                	add    BYTE PTR [eax],al
  405190:	00 00                	add    BYTE PTR [eax],al
  405192:	5f                   	pop    edi
  405193:	67 65 74 63          	addr16 gs je 0x4051fa
  405197:	68 00 00 00 00       	push   0x0
  40519c:	00 00                	add    BYTE PTR [eax],al
  40519e:	5f                   	pop    edi
  40519f:	5f                   	pop    edi
  4051a0:	67 65 74 6d          	addr16 gs je 0x405211
  4051a4:	61                   	popa
  4051a5:	69 6e 61 72 67 73 00 	imul   ebp,DWORD PTR [esi+0x61],0x736772
  4051ac:	00 00                	add    BYTE PTR [eax],al
  4051ae:	5f                   	pop    edi
  4051af:	5f                   	pop    edi
  4051b0:	70 5f                	jo     0x405211
  4051b2:	5f                   	pop    edi
  4051b3:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  4051b5:	76 69                	jbe    0x405220
  4051b7:	72 6f                	jb     0x405228
  4051b9:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4051ba:	00 00                	add    BYTE PTR [eax],al
  4051bc:	00 00                	add    BYTE PTR [eax],al
  4051be:	5f                   	pop    edi
  4051bf:	5f                   	pop    edi
  4051c0:	70 5f                	jo     0x405221
  4051c2:	5f                   	pop    edi
  4051c3:	66 6d                	ins    WORD PTR es:[edi],dx
  4051c5:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4051c6:	64 65 00 00          	fs add BYTE PTR gs:[eax],al
  4051ca:	00 00                	add    BYTE PTR [eax],al
  4051cc:	00 00                	add    BYTE PTR [eax],al
  4051ce:	5f                   	pop    edi
  4051cf:	5f                   	pop    edi
  4051d0:	73 65                	jae    0x405237
  4051d2:	74 5f                	je     0x405233
  4051d4:	61                   	popa
  4051d5:	70 70                	jo     0x405247
  4051d7:	5f                   	pop    edi
  4051d8:	74 79                	je     0x405253
  4051da:	70 65                	jo     0x405241
  4051dc:	00 00                	add    BYTE PTR [eax],al
  4051de:	00 00                	add    BYTE PTR [eax],al
  4051e0:	00 00                	add    BYTE PTR [eax],al
  4051e2:	5f                   	pop    edi
  4051e3:	63 65 78             	arpl   WORD PTR [ebp+0x78],esp
  4051e6:	69 74 00 00 00 00 00 	imul   esi,DWORD PTR [eax+eax*1+0x0],0x0
  4051ed:	00 
  4051ee:	5f                   	pop    edi
  4051ef:	69 6f 62 00 00 00 00 	imul   ebp,DWORD PTR [edi+0x62],0x0
  4051f6:	5f                   	pop    edi
  4051f7:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4051f8:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4051f9:	65 78 69             	gs js  0x405265
  4051fc:	74 00                	je     0x4051fe
  4051fe:	00 00                	add    BYTE PTR [eax],al
  405200:	00 00                	add    BYTE PTR [eax],al
  405202:	5f                   	pop    edi
  405203:	73 65                	jae    0x40526a
  405205:	74 6d                	je     0x405274
  405207:	6f                   	outs   dx,DWORD PTR ds:[esi]
  405208:	64 65 00 00          	fs add BYTE PTR gs:[eax],al
  40520c:	00 00                	add    BYTE PTR [eax],al
  40520e:	61                   	popa
  40520f:	62 6f 72             	bound  ebp,QWORD PTR [edi+0x72]
  405212:	74 00                	je     0x405214
  405214:	00 00                	add    BYTE PTR [eax],al
  405216:	61                   	popa
  405217:	74 65                	je     0x40527e
  405219:	78 69                	js     0x405284
  40521b:	74 00                	je     0x40521d
  40521d:	00 00                	add    BYTE PTR [eax],al
  40521f:	00 00                	add    BYTE PTR [eax],al
  405221:	00 66 66             	add    BYTE PTR [esi+0x66],ah
  405224:	6c                   	ins    BYTE PTR es:[edi],dx
  405225:	75 73                	jne    0x40529a
  405227:	68 00 00 00 00       	push   0x0
  40522c:	00 00                	add    BYTE PTR [eax],al
  40522e:	66 70 72             	data16 jo 0x4052a3
  405231:	69 6e 74 66 00 00 00 	imul   ebp,DWORD PTR [esi+0x74],0x66
  405238:	00 00                	add    BYTE PTR [eax],al
  40523a:	66 72 65             	data16 jb 0x4052a2
  40523d:	65 00 00             	add    BYTE PTR gs:[eax],al
  405240:	00 00                	add    BYTE PTR [eax],al
  405242:	6d                   	ins    DWORD PTR es:[edi],dx
  405243:	61                   	popa
  405244:	6c                   	ins    BYTE PTR es:[edi],dx
  405245:	6c                   	ins    BYTE PTR es:[edi],dx
  405246:	6f                   	outs   dx,DWORD PTR ds:[esi]
  405247:	63 00                	arpl   WORD PTR [eax],eax
  405249:	00 00                	add    BYTE PTR [eax],al
  40524b:	00 00                	add    BYTE PTR [eax],al
  40524d:	00 70 72             	add    BYTE PTR [eax+0x72],dh
  405250:	69 6e 74 66 00 00 00 	imul   ebp,DWORD PTR [esi+0x74],0x66
  405257:	00 00                	add    BYTE PTR [eax],al
  405259:	00 73 63             	add    BYTE PTR [ebx+0x63],dh
  40525c:	61                   	popa
  40525d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40525e:	66 00 00             	data16 add BYTE PTR [eax],al
  405261:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
  405264:	67 6e                	outs   dx,BYTE PTR ds:[si]
  405266:	61                   	popa
  405267:	6c                   	ins    BYTE PTR es:[edi],dx
  405268:	00 00                	add    BYTE PTR [eax],al
  40526a:	00 00                	add    BYTE PTR [eax],al
  40526c:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  40526f:	00 00                	add    BYTE PTR [eax],al
  405271:	50                   	push   eax
  405272:	00 00                	add    BYTE PTR [eax],al
  405274:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  405277:	00 00                	add    BYTE PTR [eax],al
  405279:	50                   	push   eax
  40527a:	00 00                	add    BYTE PTR [eax],al
  40527c:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  40527f:	00 4b 45             	add    BYTE PTR [ebx+0x45],cl
  405282:	52                   	push   edx
  405283:	4e                   	dec    esi
  405284:	45                   	inc    ebp
  405285:	4c                   	dec    esp
  405286:	33 32                	xor    esi,DWORD PTR [edx]
  405288:	2e 64 6c             	cs fs ins BYTE PTR es:[edi],dx
  40528b:	6c                   	ins    BYTE PTR es:[edi],dx
  40528c:	00 00                	add    BYTE PTR [eax],al
  40528e:	00 00                	add    BYTE PTR [eax],al
  405290:	14 50                	adc    al,0x50
  405292:	00 00                	add    BYTE PTR [eax],al
  405294:	6d                   	ins    DWORD PTR es:[edi],dx
  405295:	73 76                	jae    0x40530d
  405297:	63 72 74             	arpl   WORD PTR [edx+0x74],esi
  40529a:	2e 64 6c             	cs fs ins BYTE PTR es:[edi],dx
  40529d:	6c                   	ins    BYTE PTR es:[edi],dx
  40529e:	00 00                	add    BYTE PTR [eax],al
  4052a0:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052a3:	00 28                	add    BYTE PTR [eax],ch
  4052a5:	50                   	push   eax
  4052a6:	00 00                	add    BYTE PTR [eax],al
  4052a8:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052ab:	00 28                	add    BYTE PTR [eax],ch
  4052ad:	50                   	push   eax
  4052ae:	00 00                	add    BYTE PTR [eax],al
  4052b0:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052b3:	00 28                	add    BYTE PTR [eax],ch
  4052b5:	50                   	push   eax
  4052b6:	00 00                	add    BYTE PTR [eax],al
  4052b8:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052bb:	00 28                	add    BYTE PTR [eax],ch
  4052bd:	50                   	push   eax
  4052be:	00 00                	add    BYTE PTR [eax],al
  4052c0:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052c3:	00 28                	add    BYTE PTR [eax],ch
  4052c5:	50                   	push   eax
  4052c6:	00 00                	add    BYTE PTR [eax],al
  4052c8:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052cb:	00 28                	add    BYTE PTR [eax],ch
  4052cd:	50                   	push   eax
  4052ce:	00 00                	add    BYTE PTR [eax],al
  4052d0:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052d3:	00 28                	add    BYTE PTR [eax],ch
  4052d5:	50                   	push   eax
  4052d6:	00 00                	add    BYTE PTR [eax],al
  4052d8:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052db:	00 28                	add    BYTE PTR [eax],ch
  4052dd:	50                   	push   eax
  4052de:	00 00                	add    BYTE PTR [eax],al
  4052e0:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052e3:	00 6d 73             	add    BYTE PTR [ebp+0x73],ch
  4052e6:	76 63                	jbe    0x40534b
  4052e8:	72 74                	jb     0x40535e
  4052ea:	2e 64 6c             	cs fs ins BYTE PTR es:[edi],dx
  4052ed:	6c                   	ins    BYTE PTR es:[edi],dx
	...
