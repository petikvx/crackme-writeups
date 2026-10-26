
code.bin:     file format binary


Disassembly of section .data:

00401000 <.data>:
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
  401037:	e8 14 0b 00 00       	call   0x401b50
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
  401094:	e8 b7 0a 00 00       	call   0x401b50
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
  4010bd:	e8 8e 0a 00 00       	call   0x401b50
  4010c2:	85 f6                	test   esi,esi
  4010c4:	74 88                	je     0x40104e
  4010c6:	e8 b5 05 00 00       	call   0x401680
  4010cb:	bb ff ff ff ff       	mov    ebx,0xffffffff
  4010d0:	eb 81                	jmp    0x401053
  4010d2:	c7 04 24 0b 00 00 00 	mov    DWORD PTR [esp],0xb
  4010d9:	b9 01 00 00 00       	mov    ecx,0x1
  4010de:	bb ff ff ff ff       	mov    ebx,0xffffffff
  4010e3:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  4010e7:	e8 64 0a 00 00       	call   0x401b50
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
  401111:	e8 fa 0a 00 00       	call   0x401c10
  401116:	83 ec 04             	sub    esp,0x4
  401119:	e8 62 05 00 00       	call   0x401680
  40111e:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  401125:	b8 00 40 40 00       	mov    eax,0x404000
  40112a:	8d 55 f4             	lea    edx,[ebp-0xc]
  40112d:	89 5c 24 10          	mov    DWORD PTR [esp+0x10],ebx
  401131:	8b 0d 00 20 40 00    	mov    ecx,DWORD PTR ds:0x402000
  401137:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40113b:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  40113f:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  401143:	c7 04 24 04 40 40 00 	mov    DWORD PTR [esp],0x404004
  40114a:	e8 31 0a 00 00       	call   0x401b80
  40114f:	a1 10 40 40 00       	mov    eax,ds:0x404010
  401154:	85 c0                	test   eax,eax
  401156:	74 58                	je     0x4011b0
  401158:	a3 10 20 40 00       	mov    ds:0x402010,eax
  40115d:	8b 15 08 51 40 00    	mov    edx,DWORD PTR ds:0x405108
  401163:	85 d2                	test   edx,edx
  401165:	0f 85 8b 00 00 00    	jne    0x4011f6
  40116b:	83 fa e0             	cmp    edx,0xffffffe0
  40116e:	74 20                	je     0x401190
  401170:	a1 10 40 40 00       	mov    eax,ds:0x404010
  401175:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401179:	8b 1d 08 51 40 00    	mov    ebx,DWORD PTR ds:0x405108
  40117f:	8b 4b 30             	mov    ecx,DWORD PTR [ebx+0x30]
  401182:	89 0c 24             	mov    DWORD PTR [esp],ecx
  401185:	e8 e6 09 00 00       	call   0x401b70
  40118a:	8b 15 08 51 40 00    	mov    edx,DWORD PTR ds:0x405108
  401190:	83 fa c0             	cmp    edx,0xffffffc0
  401193:	74 1b                	je     0x4011b0
  401195:	8b 1d 10 40 40 00    	mov    ebx,DWORD PTR ds:0x404010
  40119b:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  40119f:	8b 0d 08 51 40 00    	mov    ecx,DWORD PTR ds:0x405108
  4011a5:	8b 51 50             	mov    edx,DWORD PTR [ecx+0x50]
  4011a8:	89 14 24             	mov    DWORD PTR [esp],edx
  4011ab:	e8 c0 09 00 00       	call   0x401b70
  4011b0:	e8 ab 09 00 00       	call   0x401b60
  4011b5:	8b 1d 10 20 40 00    	mov    ebx,DWORD PTR ds:0x402010
  4011bb:	89 18                	mov    DWORD PTR [eax],ebx
  4011bd:	e8 8e 04 00 00       	call   0x401650
  4011c2:	83 e4 f0             	and    esp,0xfffffff0
  4011c5:	e8 76 09 00 00       	call   0x401b40
  4011ca:	8b 08                	mov    ecx,DWORD PTR [eax]
  4011cc:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  4011d0:	8b 15 00 40 40 00    	mov    edx,DWORD PTR ds:0x404000
  4011d6:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4011da:	a1 04 40 40 00       	mov    eax,ds:0x404004
  4011df:	89 04 24             	mov    DWORD PTR [esp],eax
  4011e2:	e8 a9 00 00 00       	call   0x401290
  4011e7:	89 c3                	mov    ebx,eax
  4011e9:	e8 42 09 00 00       	call   0x401b30
  4011ee:	89 1c 24             	mov    DWORD PTR [esp],ebx
  4011f1:	e8 2a 0a 00 00       	call   0x401c20
  4011f6:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4011fa:	8b 15 08 51 40 00    	mov    edx,DWORD PTR ds:0x405108
  401200:	8b 42 10             	mov    eax,DWORD PTR [edx+0x10]
  401203:	89 04 24             	mov    DWORD PTR [esp],eax
  401206:	e8 65 09 00 00       	call   0x401b70
  40120b:	8b 15 08 51 40 00    	mov    edx,DWORD PTR ds:0x405108
  401211:	e9 55 ff ff ff       	jmp    0x40116b
  401216:	8d 76 00             	lea    esi,[esi+0x0]
  401219:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401220:	55                   	push   ebp
  401221:	89 e5                	mov    ebp,esp
  401223:	83 ec 08             	sub    esp,0x8
  401226:	c7 04 24 01 00 00 00 	mov    DWORD PTR [esp],0x1
  40122d:	ff 15 00 51 40 00    	call   DWORD PTR ds:0x405100
  401233:	e8 c8 fe ff ff       	call   0x401100
  401238:	90                   	nop
  401239:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401240:	55                   	push   ebp
  401241:	89 e5                	mov    ebp,esp
  401243:	83 ec 08             	sub    esp,0x8
  401246:	c7 04 24 02 00 00 00 	mov    DWORD PTR [esp],0x2
  40124d:	ff 15 00 51 40 00    	call   DWORD PTR ds:0x405100
  401253:	e8 a8 fe ff ff       	call   0x401100
  401258:	90                   	nop
  401259:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401260:	55                   	push   ebp
  401261:	8b 0d 18 51 40 00    	mov    ecx,DWORD PTR ds:0x405118
  401267:	89 e5                	mov    ebp,esp
  401269:	5d                   	pop    ebp
  40126a:	ff e1                	jmp    ecx
  40126c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401270:	55                   	push   ebp
  401271:	8b 0d 0c 51 40 00    	mov    ecx,DWORD PTR ds:0x40510c
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
  401284:	e9 c7 05 00 00       	jmp    0x401850
  401289:	90                   	nop
  40128a:	90                   	nop
  40128b:	90                   	nop
  40128c:	90                   	nop
  40128d:	90                   	nop
  40128e:	90                   	nop
  40128f:	90                   	nop
  401290:	55                   	push   ebp
  401291:	89 e5                	mov    ebp,esp
  401293:	83 ec 58             	sub    esp,0x58
  401296:	83 e4 f0             	and    esp,0xfffffff0
  401299:	b8 00 00 00 00       	mov    eax,0x0
  40129e:	83 c0 0f             	add    eax,0xf
  4012a1:	83 c0 0f             	add    eax,0xf
  4012a4:	c1 e8 04             	shr    eax,0x4
  4012a7:	c1 e0 04             	shl    eax,0x4
  4012aa:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  4012ad:	8b 45 b4             	mov    eax,DWORD PTR [ebp-0x4c]
  4012b0:	e8 db 07 00 00       	call   0x401a90
  4012b5:	e8 76 04 00 00       	call   0x401730
  4012ba:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012c1:	e8 ea 08 00 00       	call   0x401bb0
  4012c6:	c7 04 24 18 30 40 00 	mov    DWORD PTR [esp],0x403018
  4012cd:	e8 de 08 00 00       	call   0x401bb0
  4012d2:	8d 45 fc             	lea    eax,[ebp-0x4]
  4012d5:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4012d9:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  4012e0:	e8 bb 08 00 00       	call   0x401ba0
  4012e5:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012e8:	89 04 24             	mov    DWORD PTR [esp],eax
  4012eb:	e8 7e 02 00 00       	call   0x40156e
  4012f0:	83 f8 01             	cmp    eax,0x1
  4012f3:	75 0e                	jne    0x401303
  4012f5:	c7 04 24 2d 30 40 00 	mov    DWORD PTR [esp],0x40302d
  4012fc:	e8 af 08 00 00       	call   0x401bb0
  401301:	eb 0c                	jmp    0x40130f
  401303:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  40130a:	e8 81 08 00 00       	call   0x401b90
  40130f:	c7 04 24 47 30 40 00 	mov    DWORD PTR [esp],0x403047
  401316:	e8 95 08 00 00       	call   0x401bb0
  40131b:	c7 04 24 60 30 40 00 	mov    DWORD PTR [esp],0x403060
  401322:	e8 89 08 00 00       	call   0x401bb0
  401327:	8d 45 f8             	lea    eax,[ebp-0x8]
  40132a:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40132e:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  401335:	e8 66 08 00 00       	call   0x401ba0
  40133a:	81 7d f8 9f 86 01 00 	cmp    DWORD PTR [ebp-0x8],0x1869f
  401341:	7e 0b                	jle    0x40134e
  401343:	81 7d f8 3f 42 0f 00 	cmp    DWORD PTR [ebp-0x8],0xf423f
  40134a:	7f 02                	jg     0x40134e
  40134c:	eb 0c                	jmp    0x40135a
  40134e:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  401355:	e8 36 08 00 00       	call   0x401b90
  40135a:	c7 04 24 75 30 40 00 	mov    DWORD PTR [esp],0x403075
  401361:	e8 4a 08 00 00       	call   0x401bb0
  401366:	8d 45 f4             	lea    eax,[ebp-0xc]
  401369:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40136d:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  401374:	e8 27 08 00 00       	call   0x401ba0
  401379:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  40137c:	03 45 fc             	add    eax,DWORD PTR [ebp-0x4]
  40137f:	2d 00 04 00 00       	sub    eax,0x400
  401384:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  401387:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  40138a:	3b 45 e4             	cmp    eax,DWORD PTR [ebp-0x1c]
  40138d:	75 0e                	jne    0x40139d
  40138f:	c7 04 24 89 30 40 00 	mov    DWORD PTR [esp],0x403089
  401396:	e8 15 08 00 00       	call   0x401bb0
  40139b:	eb 0c                	jmp    0x4013a9
  40139d:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4013a4:	e8 e7 07 00 00       	call   0x401b90
  4013a9:	8d 45 f0             	lea    eax,[ebp-0x10]
  4013ac:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4013b0:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  4013b7:	e8 e4 07 00 00       	call   0x401ba0
  4013bc:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4013bf:	03 45 e4             	add    eax,DWORD PTR [ebp-0x1c]
  4013c2:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  4013c5:	83 7d cc 00          	cmp    DWORD PTR [ebp-0x34],0x0
  4013c9:	79 07                	jns    0x4013d2
  4013cb:	81 45 cc ff 03 00 00 	add    DWORD PTR [ebp-0x34],0x3ff
  4013d2:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  4013d5:	c1 f8 0a             	sar    eax,0xa
  4013d8:	89 45 e0             	mov    DWORD PTR [ebp-0x20],eax
  4013db:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4013de:	3b 45 e0             	cmp    eax,DWORD PTR [ebp-0x20]
  4013e1:	75 0e                	jne    0x4013f1
  4013e3:	c7 04 24 9d 30 40 00 	mov    DWORD PTR [esp],0x40309d
  4013ea:	e8 c1 07 00 00       	call   0x401bb0
  4013ef:	eb 0c                	jmp    0x4013fd
  4013f1:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4013f8:	e8 93 07 00 00       	call   0x401b90
  4013fd:	8d 45 ec             	lea    eax,[ebp-0x14]
  401400:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401404:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  40140b:	e8 90 07 00 00       	call   0x401ba0
  401410:	8b 55 f8             	mov    edx,DWORD PTR [ebp-0x8]
  401413:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  401416:	29 d0                	sub    eax,edx
  401418:	03 45 f4             	add    eax,DWORD PTR [ebp-0xc]
  40141b:	2b 45 f0             	sub    eax,DWORD PTR [ebp-0x10]
  40141e:	89 45 dc             	mov    DWORD PTR [ebp-0x24],eax
  401421:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  401424:	3b 45 dc             	cmp    eax,DWORD PTR [ebp-0x24]
  401427:	75 0e                	jne    0x401437
  401429:	c7 04 24 b1 30 40 00 	mov    DWORD PTR [esp],0x4030b1
  401430:	e8 7b 07 00 00       	call   0x401bb0
  401435:	eb 0c                	jmp    0x401443
  401437:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  40143e:	e8 4d 07 00 00       	call   0x401b90
  401443:	8d 45 e8             	lea    eax,[ebp-0x18]
  401446:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40144a:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  401451:	e8 4a 07 00 00       	call   0x401ba0
  401456:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  401459:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  40145c:	83 7d c4 00          	cmp    DWORD PTR [ebp-0x3c],0x0
  401460:	79 07                	jns    0x401469
  401462:	81 45 c4 ff 00 00 00 	add    DWORD PTR [ebp-0x3c],0xff
  401469:	8b 55 c4             	mov    edx,DWORD PTR [ebp-0x3c]
  40146c:	c1 fa 08             	sar    edx,0x8
  40146f:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
  401472:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  401475:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  401478:	83 7d c0 00          	cmp    DWORD PTR [ebp-0x40],0x0
  40147c:	79 04                	jns    0x401482
  40147e:	83 45 c0 7f          	add    DWORD PTR [ebp-0x40],0x7f
  401482:	8b 45 c0             	mov    eax,DWORD PTR [ebp-0x40]
  401485:	c1 f8 07             	sar    eax,0x7
  401488:	8b 55 c8             	mov    edx,DWORD PTR [ebp-0x38]
  40148b:	01 c2                	add    edx,eax
  40148d:	89 55 bc             	mov    DWORD PTR [ebp-0x44],edx
  401490:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  401493:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  401496:	83 7d b8 00          	cmp    DWORD PTR [ebp-0x48],0x0
  40149a:	79 04                	jns    0x4014a0
  40149c:	83 45 b8 3f          	add    DWORD PTR [ebp-0x48],0x3f
  4014a0:	8b 45 b8             	mov    eax,DWORD PTR [ebp-0x48]
  4014a3:	c1 f8 06             	sar    eax,0x6
  4014a6:	03 45 bc             	add    eax,DWORD PTR [ebp-0x44]
  4014a9:	89 45 d8             	mov    DWORD PTR [ebp-0x28],eax
  4014ac:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  4014af:	3b 45 d8             	cmp    eax,DWORD PTR [ebp-0x28]
  4014b2:	75 0e                	jne    0x4014c2
  4014b4:	c7 04 24 c5 30 40 00 	mov    DWORD PTR [esp],0x4030c5
  4014bb:	e8 f0 06 00 00       	call   0x401bb0
  4014c0:	eb 0c                	jmp    0x4014ce
  4014c2:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4014c9:	e8 c2 06 00 00       	call   0x401b90
  4014ce:	c7 04 24 e0 30 40 00 	mov    DWORD PTR [esp],0x4030e0
  4014d5:	e8 d6 06 00 00       	call   0x401bb0
  4014da:	c7 04 24 fd 30 40 00 	mov    DWORD PTR [esp],0x4030fd
  4014e1:	e8 ca 06 00 00       	call   0x401bb0
  4014e6:	8d 45 d4             	lea    eax,[ebp-0x2c]
  4014e9:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4014ed:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  4014f4:	e8 a7 06 00 00       	call   0x401ba0
  4014f9:	81 7d d4 9f 86 01 00 	cmp    DWORD PTR [ebp-0x2c],0x1869f
  401500:	7e 0a                	jle    0x40150c
  401502:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  401505:	3b 45 f0             	cmp    eax,DWORD PTR [ebp-0x10]
  401508:	7f 02                	jg     0x40150c
  40150a:	eb 0c                	jmp    0x401518
  40150c:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  401513:	e8 78 06 00 00       	call   0x401b90
  401518:	c7 04 24 0a 31 40 00 	mov    DWORD PTR [esp],0x40310a
  40151f:	e8 8c 06 00 00       	call   0x401bb0
  401524:	8d 45 d0             	lea    eax,[ebp-0x30]
  401527:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40152b:	c7 04 24 29 30 40 00 	mov    DWORD PTR [esp],0x403029
  401532:	e8 69 06 00 00       	call   0x401ba0
  401537:	81 7d d0 3f 42 0f 00 	cmp    DWORD PTR [ebp-0x30],0xf423f
  40153e:	7e 0a                	jle    0x40154a
  401540:	8b 45 d0             	mov    eax,DWORD PTR [ebp-0x30]
  401543:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
  401546:	7f 02                	jg     0x40154a
  401548:	eb 0c                	jmp    0x401556
  40154a:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  401551:	e8 3a 06 00 00       	call   0x401b90
  401556:	c7 04 24 18 31 40 00 	mov    DWORD PTR [esp],0x403118
  40155d:	e8 4e 06 00 00       	call   0x401bb0
  401562:	e8 a9 05 00 00       	call   0x401b10
  401567:	b8 00 00 00 00       	mov    eax,0x0
  40156c:	c9                   	leave
  40156d:	c3                   	ret
  40156e:	55                   	push   ebp
  40156f:	89 e5                	mov    ebp,esp
  401571:	53                   	push   ebx
  401572:	83 ec 34             	sub    esp,0x34
  401575:	83 7d 08 00          	cmp    DWORD PTR [ebp+0x8],0x0
  401579:	78 0b                	js     0x401586
  40157b:	81 7d 08 ff e0 f5 05 	cmp    DWORD PTR [ebp+0x8],0x5f5e0ff
  401582:	7f 02                	jg     0x401586
  401584:	eb 0c                	jmp    0x401592
  401586:	c7 04 24 56 31 40 00 	mov    DWORD PTR [esp],0x403156
  40158d:	e8 1e 06 00 00       	call   0x401bb0
  401592:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  401599:	83 7d f4 07          	cmp    DWORD PTR [ebp-0xc],0x7
  40159d:	7f 4c                	jg     0x4015eb
  40159f:	8d 45 f8             	lea    eax,[ebp-0x8]
  4015a2:	03 45 f4             	add    eax,DWORD PTR [ebp-0xc]
  4015a5:	8d 58 e8             	lea    ebx,[eax-0x18]
  4015a8:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4015ab:	b8 67 66 66 66       	mov    eax,0x66666667
  4015b0:	f7 e9                	imul   ecx
  4015b2:	c1 fa 02             	sar    edx,0x2
  4015b5:	89 c8                	mov    eax,ecx
  4015b7:	c1 f8 1f             	sar    eax,0x1f
  4015ba:	29 c2                	sub    edx,eax
  4015bc:	89 d0                	mov    eax,edx
  4015be:	c1 e0 02             	shl    eax,0x2
  4015c1:	01 d0                	add    eax,edx
  4015c3:	01 c0                	add    eax,eax
  4015c5:	29 c1                	sub    ecx,eax
  4015c7:	89 c8                	mov    eax,ecx
  4015c9:	88 03                	mov    BYTE PTR [ebx],al
  4015cb:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  4015ce:	b8 67 66 66 66       	mov    eax,0x66666667
  4015d3:	f7 e9                	imul   ecx
  4015d5:	c1 fa 02             	sar    edx,0x2
  4015d8:	89 c8                	mov    eax,ecx
  4015da:	c1 f8 1f             	sar    eax,0x1f
  4015dd:	29 c2                	sub    edx,eax
  4015df:	89 d0                	mov    eax,edx
  4015e1:	89 45 08             	mov    DWORD PTR [ebp+0x8],eax
  4015e4:	8d 45 f4             	lea    eax,[ebp-0xc]
  4015e7:	ff 00                	inc    DWORD PTR [eax]
  4015e9:	eb ae                	jmp    0x401599
  4015eb:	0f be 55 e0          	movsx  edx,BYTE PTR [ebp-0x20]
  4015ef:	0f be 45 e1          	movsx  eax,BYTE PTR [ebp-0x1f]
  4015f3:	89 d1                	mov    ecx,edx
  4015f5:	0f af c8             	imul   ecx,eax
  4015f8:	0f be 55 e2          	movsx  edx,BYTE PTR [ebp-0x1e]
  4015fc:	0f be 45 e3          	movsx  eax,BYTE PTR [ebp-0x1d]
  401600:	0f af c2             	imul   eax,edx
  401603:	8d 04 01             	lea    eax,[ecx+eax*1]
  401606:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  401609:	0f be 55 e4          	movsx  edx,BYTE PTR [ebp-0x1c]
  40160d:	0f be 45 e6          	movsx  eax,BYTE PTR [ebp-0x1a]
  401611:	89 d1                	mov    ecx,edx
  401613:	0f af c8             	imul   ecx,eax
  401616:	0f be 55 e5          	movsx  edx,BYTE PTR [ebp-0x1b]
  40161a:	0f be 45 e7          	movsx  eax,BYTE PTR [ebp-0x19]
  40161e:	0f af c2             	imul   eax,edx
  401621:	8d 04 01             	lea    eax,[ecx+eax*1]
  401624:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  401627:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  40162a:	3b 45 ec             	cmp    eax,DWORD PTR [ebp-0x14]
  40162d:	75 09                	jne    0x401638
  40162f:	c7 45 dc 01 00 00 00 	mov    DWORD PTR [ebp-0x24],0x1
  401636:	eb 07                	jmp    0x40163f
  401638:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
  40163f:	8b 45 dc             	mov    eax,DWORD PTR [ebp-0x24]
  401642:	83 c4 34             	add    esp,0x34
  401645:	5b                   	pop    ebx
  401646:	5d                   	pop    ebp
  401647:	c3                   	ret
  401648:	90                   	nop
  401649:	90                   	nop
  40164a:	90                   	nop
  40164b:	90                   	nop
  40164c:	90                   	nop
  40164d:	90                   	nop
  40164e:	90                   	nop
  40164f:	90                   	nop
  401650:	55                   	push   ebp
  401651:	b9 50 32 40 00       	mov    ecx,0x403250
  401656:	89 e5                	mov    ebp,esp
  401658:	eb 14                	jmp    0x40166e
  40165a:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  401660:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  401663:	8b 01                	mov    eax,DWORD PTR [ecx]
  401665:	83 c1 08             	add    ecx,0x8
  401668:	01 82 00 00 40 00    	add    DWORD PTR [edx+0x400000],eax
  40166e:	81 f9 50 32 40 00    	cmp    ecx,0x403250
  401674:	72 ea                	jb     0x401660
  401676:	5d                   	pop    ebp
  401677:	c3                   	ret
  401678:	90                   	nop
  401679:	90                   	nop
  40167a:	90                   	nop
  40167b:	90                   	nop
  40167c:	90                   	nop
  40167d:	90                   	nop
  40167e:	90                   	nop
  40167f:	90                   	nop
  401680:	55                   	push   ebp
  401681:	89 e5                	mov    ebp,esp
  401683:	db e3                	fninit
  401685:	5d                   	pop    ebp
  401686:	c3                   	ret
  401687:	90                   	nop
  401688:	90                   	nop
  401689:	90                   	nop
  40168a:	90                   	nop
  40168b:	90                   	nop
  40168c:	90                   	nop
  40168d:	90                   	nop
  40168e:	90                   	nop
  40168f:	90                   	nop
  401690:	55                   	push   ebp
  401691:	89 e5                	mov    ebp,esp
  401693:	83 ec 08             	sub    esp,0x8
  401696:	a1 20 20 40 00       	mov    eax,ds:0x402020
  40169b:	8b 08                	mov    ecx,DWORD PTR [eax]
  40169d:	85 c9                	test   ecx,ecx
  40169f:	74 26                	je     0x4016c7
  4016a1:	eb 0d                	jmp    0x4016b0
  4016a3:	90                   	nop
  4016a4:	90                   	nop
  4016a5:	90                   	nop
  4016a6:	90                   	nop
  4016a7:	90                   	nop
  4016a8:	90                   	nop
  4016a9:	90                   	nop
  4016aa:	90                   	nop
  4016ab:	90                   	nop
  4016ac:	90                   	nop
  4016ad:	90                   	nop
  4016ae:	90                   	nop
  4016af:	90                   	nop
  4016b0:	ff 10                	call   DWORD PTR [eax]
  4016b2:	8b 0d 20 20 40 00    	mov    ecx,DWORD PTR ds:0x402020
  4016b8:	8b 51 04             	mov    edx,DWORD PTR [ecx+0x4]
  4016bb:	8d 41 04             	lea    eax,[ecx+0x4]
  4016be:	a3 20 20 40 00       	mov    ds:0x402020,eax
  4016c3:	85 d2                	test   edx,edx
  4016c5:	75 e9                	jne    0x4016b0
  4016c7:	c9                   	leave
  4016c8:	c3                   	ret
  4016c9:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  4016d0:	55                   	push   ebp
  4016d1:	89 e5                	mov    ebp,esp
  4016d3:	53                   	push   ebx
  4016d4:	83 ec 04             	sub    esp,0x4
  4016d7:	a1 70 1c 40 00       	mov    eax,ds:0x401c70
  4016dc:	83 f8 ff             	cmp    eax,0xffffffff
  4016df:	74 29                	je     0x40170a
  4016e1:	85 c0                	test   eax,eax
  4016e3:	89 c3                	mov    ebx,eax
  4016e5:	74 13                	je     0x4016fa
  4016e7:	89 f6                	mov    esi,esi
  4016e9:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  4016f0:	ff 14 9d 70 1c 40 00 	call   DWORD PTR [ebx*4+0x401c70]
  4016f7:	4b                   	dec    ebx
  4016f8:	75 f6                	jne    0x4016f0
  4016fa:	c7 04 24 90 16 40 00 	mov    DWORD PTR [esp],0x401690
  401701:	e8 5a fb ff ff       	call   0x401260
  401706:	5b                   	pop    ebx
  401707:	5b                   	pop    ebx
  401708:	5d                   	pop    ebp
  401709:	c3                   	ret
  40170a:	8b 0d 74 1c 40 00    	mov    ecx,DWORD PTR ds:0x401c74
  401710:	31 c0                	xor    eax,eax
  401712:	85 c9                	test   ecx,ecx
  401714:	eb 0a                	jmp    0x401720
  401716:	40                   	inc    eax
  401717:	8b 14 85 74 1c 40 00 	mov    edx,DWORD PTR [eax*4+0x401c74]
  40171e:	85 d2                	test   edx,edx
  401720:	75 f4                	jne    0x401716
  401722:	eb bd                	jmp    0x4016e1
  401724:	8d b6 00 00 00 00    	lea    esi,[esi+0x0]
  40172a:	8d bf 00 00 00 00    	lea    edi,[edi+0x0]
  401730:	55                   	push   ebp
  401731:	89 e5                	mov    ebp,esp
  401733:	53                   	push   ebx
  401734:	83 ec 04             	sub    esp,0x4
  401737:	a1 20 40 40 00       	mov    eax,ds:0x404020
  40173c:	85 c0                	test   eax,eax
  40173e:	75 36                	jne    0x401776
  401740:	a1 70 1c 40 00       	mov    eax,ds:0x401c70
  401745:	bb 01 00 00 00       	mov    ebx,0x1
  40174a:	89 1d 20 40 40 00    	mov    DWORD PTR ds:0x404020,ebx
  401750:	83 f8 ff             	cmp    eax,0xffffffff
  401753:	74 25                	je     0x40177a
  401755:	85 c0                	test   eax,eax
  401757:	89 c3                	mov    ebx,eax
  401759:	74 0f                	je     0x40176a
  40175b:	90                   	nop
  40175c:	8d 74 26 00          	lea    esi,[esi+eiz*1+0x0]
  401760:	ff 14 9d 70 1c 40 00 	call   DWORD PTR [ebx*4+0x401c70]
  401767:	4b                   	dec    ebx
  401768:	75 f6                	jne    0x401760
  40176a:	c7 04 24 90 16 40 00 	mov    DWORD PTR [esp],0x401690
  401771:	e8 ea fa ff ff       	call   0x401260
  401776:	5b                   	pop    ebx
  401777:	5b                   	pop    ebx
  401778:	5d                   	pop    ebp
  401779:	c3                   	ret
  40177a:	8b 0d 74 1c 40 00    	mov    ecx,DWORD PTR ds:0x401c74
  401780:	31 c0                	xor    eax,eax
  401782:	85 c9                	test   ecx,ecx
  401784:	eb 0a                	jmp    0x401790
  401786:	40                   	inc    eax
  401787:	8b 14 85 74 1c 40 00 	mov    edx,DWORD PTR [eax*4+0x401c74]
  40178e:	85 d2                	test   edx,edx
  401790:	75 f4                	jne    0x401786
  401792:	eb c1                	jmp    0x401755
  401794:	90                   	nop
  401795:	90                   	nop
  401796:	90                   	nop
  401797:	90                   	nop
  401798:	90                   	nop
  401799:	90                   	nop
  40179a:	90                   	nop
  40179b:	90                   	nop
  40179c:	90                   	nop
  40179d:	90                   	nop
  40179e:	90                   	nop
  40179f:	90                   	nop
  4017a0:	55                   	push   ebp
  4017a1:	a1 70 40 40 00       	mov    eax,ds:0x404070
  4017a6:	89 e5                	mov    ebp,esp
  4017a8:	5d                   	pop    ebp
  4017a9:	8b 48 04             	mov    ecx,DWORD PTR [eax+0x4]
  4017ac:	ff e1                	jmp    ecx
  4017ae:	89 f6                	mov    esi,esi
  4017b0:	55                   	push   ebp
  4017b1:	ba 42 00 00 00       	mov    edx,0x42
  4017b6:	89 e5                	mov    ebp,esp
  4017b8:	53                   	push   ebx
  4017b9:	0f b7 c0             	movzx  eax,ax
  4017bc:	83 ec 64             	sub    esp,0x64
  4017bf:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4017c3:	8d 55 a8             	lea    edx,[ebp-0x58]
  4017c6:	31 db                	xor    ebx,ebx
  4017c8:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  4017cc:	89 04 24             	mov    DWORD PTR [esp],eax
  4017cf:	ff 15 d8 50 40 00    	call   DWORD PTR ds:0x4050d8
  4017d5:	ba 1f 00 00 00       	mov    edx,0x1f
  4017da:	b9 01 00 00 00       	mov    ecx,0x1
  4017df:	83 ec 0c             	sub    esp,0xc
  4017e2:	85 c0                	test   eax,eax
  4017e4:	75 07                	jne    0x4017ed
  4017e6:	eb 46                	jmp    0x40182e
  4017e8:	01 c9                	add    ecx,ecx
  4017ea:	4a                   	dec    edx
  4017eb:	78 0e                	js     0x4017fb
  4017ed:	80 7c 2a a8 41       	cmp    BYTE PTR [edx+ebp*1-0x58],0x41
  4017f2:	75 f4                	jne    0x4017e8
  4017f4:	09 cb                	or     ebx,ecx
  4017f6:	01 c9                	add    ecx,ecx
  4017f8:	4a                   	dec    edx
  4017f9:	79 f2                	jns    0x4017ed
  4017fb:	83 3b 3c             	cmp    DWORD PTR [ebx],0x3c
  4017fe:	75 07                	jne    0x401807
  401800:	89 d8                	mov    eax,ebx
  401802:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401805:	c9                   	leave
  401806:	c3                   	ret
  401807:	b9 94 31 40 00       	mov    ecx,0x403194
  40180c:	ba ea 00 00 00       	mov    edx,0xea
  401811:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  401815:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401819:	c7 04 24 c1 31 40 00 	mov    DWORD PTR [esp],0x4031c1
  401820:	b8 e0 31 40 00       	mov    eax,0x4031e0
  401825:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401829:	e8 92 02 00 00       	call   0x401ac0
  40182e:	b8 0c 32 40 00       	mov    eax,0x40320c
  401833:	bb e4 00 00 00       	mov    ebx,0xe4
  401838:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40183c:	89 5c 24 08          	mov    DWORD PTR [esp+0x8],ebx
  401840:	eb d7                	jmp    0x401819
  401842:	8d b4 26 00 00 00 00 	lea    esi,[esi+eiz*1+0x0]
  401849:	8d bc 27 00 00 00 00 	lea    edi,[edi+eiz*1+0x0]
  401850:	55                   	push   ebp
  401851:	89 e5                	mov    ebp,esp
  401853:	57                   	push   edi
  401854:	56                   	push   esi
  401855:	53                   	push   ebx
  401856:	81 ec cc 00 00 00    	sub    esp,0xcc
  40185c:	8b 0d 70 40 40 00    	mov    ecx,DWORD PTR ds:0x404070
  401862:	85 c9                	test   ecx,ecx
  401864:	74 08                	je     0x40186e
  401866:	8d 65 f4             	lea    esp,[ebp-0xc]
  401869:	5b                   	pop    ebx
  40186a:	5e                   	pop    esi
  40186b:	5f                   	pop    edi
  40186c:	5d                   	pop    ebp
  40186d:	c3                   	ret
  40186e:	c7 45 98 41 41 41 41 	mov    DWORD PTR [ebp-0x68],0x41414141
  401875:	a1 70 31 40 00       	mov    eax,ds:0x403170
  40187a:	8d 75 98             	lea    esi,[ebp-0x68]
  40187d:	c7 45 9c 41 41 41 41 	mov    DWORD PTR [ebp-0x64],0x41414141
  401884:	c7 45 a0 41 41 41 41 	mov    DWORD PTR [ebp-0x60],0x41414141
  40188b:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  40188e:	a1 74 31 40 00       	mov    eax,ds:0x403174
  401893:	c7 45 a4 41 41 41 41 	mov    DWORD PTR [ebp-0x5c],0x41414141
  40189a:	c7 45 a8 41 41 41 41 	mov    DWORD PTR [ebp-0x58],0x41414141
  4018a1:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  4018a4:	a1 78 31 40 00       	mov    eax,ds:0x403178
  4018a9:	c7 45 ac 41 41 41 41 	mov    DWORD PTR [ebp-0x54],0x41414141
  4018b0:	c7 45 b0 41 41 41 41 	mov    DWORD PTR [ebp-0x50],0x41414141
  4018b7:	89 45 c0             	mov    DWORD PTR [ebp-0x40],eax
  4018ba:	a1 7c 31 40 00       	mov    eax,ds:0x40317c
  4018bf:	c7 45 b4 41 41 41 41 	mov    DWORD PTR [ebp-0x4c],0x41414141
  4018c6:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  4018c9:	a1 80 31 40 00       	mov    eax,ds:0x403180
  4018ce:	89 45 c8             	mov    DWORD PTR [ebp-0x38],eax
  4018d1:	a1 84 31 40 00       	mov    eax,ds:0x403184
  4018d6:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  4018d9:	a1 88 31 40 00       	mov    eax,ds:0x403188
  4018de:	89 45 d0             	mov    DWORD PTR [ebp-0x30],eax
  4018e1:	a1 8c 31 40 00       	mov    eax,ds:0x40318c
  4018e6:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4018e9:	0f b7 05 90 31 40 00 	movzx  eax,WORD PTR ds:0x403190
  4018f0:	66 89 45 d8          	mov    WORD PTR [ebp-0x28],ax
  4018f4:	89 34 24             	mov    DWORD PTR [esp],esi
  4018f7:	ff 15 d4 50 40 00    	call   DWORD PTR ds:0x4050d4
  4018fd:	0f b7 c0             	movzx  eax,ax
  401900:	83 ec 04             	sub    esp,0x4
  401903:	85 c0                	test   eax,eax
  401905:	89 85 44 ff ff ff    	mov    DWORD PTR [ebp-0xbc],eax
  40190b:	0f 85 3b 01 00 00    	jne    0x401a4c
  401911:	c7 04 24 3c 00 00 00 	mov    DWORD PTR [esp],0x3c
  401918:	e8 b3 02 00 00       	call   0x401bd0
  40191d:	85 c0                	test   eax,eax
  40191f:	89 c3                	mov    ebx,eax
  401921:	0f 84 59 01 00 00    	je     0x401a80
  401927:	fc                   	cld
  401928:	89 c7                	mov    edi,eax
  40192a:	8b 85 44 ff ff ff    	mov    eax,DWORD PTR [ebp-0xbc]
  401930:	b9 0f 00 00 00       	mov    ecx,0xf
  401935:	f3 ab                	rep stos DWORD PTR es:[edi],eax
  401937:	c7 43 04 e0 1b 40 00 	mov    DWORD PTR [ebx+0x4],0x401be0
  40193e:	b9 01 00 00 00       	mov    ecx,0x1
  401943:	c7 43 08 a0 17 40 00 	mov    DWORD PTR [ebx+0x8],0x4017a0
  40194a:	a1 40 40 40 00       	mov    eax,ds:0x404040
  40194f:	c7 03 3c 00 00 00    	mov    DWORD PTR [ebx],0x3c
  401955:	8b 15 44 40 40 00    	mov    edx,DWORD PTR ds:0x404044
  40195b:	c7 43 28 00 00 00 00 	mov    DWORD PTR [ebx+0x28],0x0
  401962:	89 43 14             	mov    DWORD PTR [ebx+0x14],eax
  401965:	a1 30 20 40 00       	mov    eax,ds:0x402030
  40196a:	89 53 18             	mov    DWORD PTR [ebx+0x18],edx
  40196d:	8b 15 34 20 40 00    	mov    edx,DWORD PTR ds:0x402034
  401973:	89 43 1c             	mov    DWORD PTR [ebx+0x1c],eax
  401976:	a1 50 40 40 00       	mov    eax,ds:0x404050
  40197b:	89 53 20             	mov    DWORD PTR [ebx+0x20],edx
  40197e:	c7 43 30 ff ff ff ff 	mov    DWORD PTR [ebx+0x30],0xffffffff
  401985:	89 43 2c             	mov    DWORD PTR [ebx+0x2c],eax
  401988:	8b 15 3c 20 40 00    	mov    edx,DWORD PTR ds:0x40203c
  40198e:	a1 38 20 40 00       	mov    eax,ds:0x402038
  401993:	89 53 38             	mov    DWORD PTR [ebx+0x38],edx
  401996:	ba 1f 00 00 00       	mov    edx,0x1f
  40199b:	89 43 34             	mov    DWORD PTR [ebx+0x34],eax
  40199e:	89 f6                	mov    esi,esi
  4019a0:	89 d8                	mov    eax,ebx
  4019a2:	21 c8                	and    eax,ecx
  4019a4:	83 f8 01             	cmp    eax,0x1
  4019a7:	19 c0                	sbb    eax,eax
  4019a9:	24 20                	and    al,0x20
  4019ab:	01 c9                	add    ecx,ecx
  4019ad:	04 41                	add    al,0x41
  4019af:	88 84 2a 48 ff ff ff 	mov    BYTE PTR [edx+ebp*1-0xb8],al
  4019b6:	4a                   	dec    edx
  4019b7:	79 e7                	jns    0x4019a0
  4019b9:	a1 70 31 40 00       	mov    eax,ds:0x403170
  4019be:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
  4019c4:	a1 74 31 40 00       	mov    eax,ds:0x403174
  4019c9:	89 85 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],eax
  4019cf:	a1 78 31 40 00       	mov    eax,ds:0x403178
  4019d4:	89 85 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],eax
  4019da:	a1 7c 31 40 00       	mov    eax,ds:0x40317c
  4019df:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  4019e5:	a1 80 31 40 00       	mov    eax,ds:0x403180
  4019ea:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  4019f0:	a1 84 31 40 00       	mov    eax,ds:0x403184
  4019f5:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  4019fb:	a1 88 31 40 00       	mov    eax,ds:0x403188
  401a00:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
  401a03:	a1 8c 31 40 00       	mov    eax,ds:0x40318c
  401a08:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  401a0b:	0f b7 05 90 31 40 00 	movzx  eax,WORD PTR ds:0x403190
  401a12:	66 89 45 88          	mov    WORD PTR [ebp-0x78],ax
  401a16:	8d 85 48 ff ff ff    	lea    eax,[ebp-0xb8]
  401a1c:	89 04 24             	mov    DWORD PTR [esp],eax
  401a1f:	ff 15 cc 50 40 00    	call   DWORD PTR ds:0x4050cc
  401a25:	0f b7 f8             	movzx  edi,ax
  401a28:	83 ec 04             	sub    esp,0x4
  401a2b:	85 ff                	test   edi,edi
  401a2d:	75 42                	jne    0x401a71
  401a2f:	31 d2                	xor    edx,edx
  401a31:	85 d2                	test   edx,edx
  401a33:	75 1e                	jne    0x401a53
  401a35:	89 1c 24             	mov    DWORD PTR [esp],ebx
  401a38:	e8 83 01 00 00       	call   0x401bc0
  401a3d:	89 34 24             	mov    DWORD PTR [esp],esi
  401a40:	ff 15 d4 50 40 00    	call   DWORD PTR ds:0x4050d4
  401a46:	83 ec 04             	sub    esp,0x4
  401a49:	0f b7 c0             	movzx  eax,ax
  401a4c:	e8 5f fd ff ff       	call   0x4017b0
  401a51:	89 c3                	mov    ebx,eax
  401a53:	89 1d 70 40 40 00    	mov    DWORD PTR ds:0x404070,ebx
  401a59:	8d 43 04             	lea    eax,[ebx+0x4]
  401a5c:	a3 60 40 40 00       	mov    ds:0x404060,eax
  401a61:	8d 43 08             	lea    eax,[ebx+0x8]
  401a64:	a3 80 40 40 00       	mov    ds:0x404080,eax
  401a69:	8d 65 f4             	lea    esp,[ebp-0xc]
  401a6c:	5b                   	pop    ebx
  401a6d:	5e                   	pop    esi
  401a6e:	5f                   	pop    edi
  401a6f:	5d                   	pop    ebp
  401a70:	c3                   	ret
  401a71:	89 f8                	mov    eax,edi
  401a73:	e8 38 fd ff ff       	call   0x4017b0
  401a78:	39 d8                	cmp    eax,ebx
  401a7a:	89 fa                	mov    edx,edi
  401a7c:	75 b1                	jne    0x401a2f
  401a7e:	eb b1                	jmp    0x401a31
  401a80:	e8 5b 01 00 00       	call   0x401be0
  401a85:	90                   	nop
  401a86:	90                   	nop
  401a87:	90                   	nop
  401a88:	90                   	nop
  401a89:	90                   	nop
  401a8a:	90                   	nop
  401a8b:	90                   	nop
  401a8c:	90                   	nop
  401a8d:	90                   	nop
  401a8e:	90                   	nop
  401a8f:	90                   	nop
  401a90:	51                   	push   ecx
  401a91:	89 e1                	mov    ecx,esp
  401a93:	83 c1 08             	add    ecx,0x8
  401a96:	3d 00 10 00 00       	cmp    eax,0x1000
  401a9b:	72 10                	jb     0x401aad
  401a9d:	81 e9 00 10 00 00    	sub    ecx,0x1000
  401aa3:	83 09 00             	or     DWORD PTR [ecx],0x0
  401aa6:	2d 00 10 00 00       	sub    eax,0x1000
  401aab:	eb e9                	jmp    0x401a96
  401aad:	29 c1                	sub    ecx,eax
  401aaf:	83 09 00             	or     DWORD PTR [ecx],0x0
  401ab2:	89 e0                	mov    eax,esp
  401ab4:	89 cc                	mov    esp,ecx
  401ab6:	8b 08                	mov    ecx,DWORD PTR [eax]
  401ab8:	8b 40 04             	mov    eax,DWORD PTR [eax+0x4]
  401abb:	ff e0                	jmp    eax
  401abd:	90                   	nop
  401abe:	90                   	nop
  401abf:	90                   	nop
  401ac0:	55                   	push   ebp
  401ac1:	89 e5                	mov    ebp,esp
  401ac3:	83 ec 18             	sub    esp,0x18
  401ac6:	8b 45 14             	mov    eax,DWORD PTR [ebp+0x14]
  401ac9:	89 44 24 10          	mov    DWORD PTR [esp+0x10],eax
  401acd:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  401ad0:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  401ad4:	8b 45 0c             	mov    eax,DWORD PTR [ebp+0xc]
  401ad7:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  401adb:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401ade:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401ae2:	a1 08 51 40 00       	mov    eax,ds:0x405108
  401ae7:	83 c0 40             	add    eax,0x40
  401aea:	89 04 24             	mov    DWORD PTR [esp],eax
  401aed:	e8 0e 01 00 00       	call   0x401c00
  401af2:	a1 08 51 40 00       	mov    eax,ds:0x405108
  401af7:	83 c0 40             	add    eax,0x40
  401afa:	89 04 24             	mov    DWORD PTR [esp],eax
  401afd:	e8 ee 00 00 00       	call   0x401bf0
  401b02:	e8 d9 00 00 00       	call   0x401be0
  401b07:	90                   	nop
  401b08:	90                   	nop
  401b09:	90                   	nop
  401b0a:	90                   	nop
  401b0b:	90                   	nop
  401b0c:	90                   	nop
  401b0d:	90                   	nop
  401b0e:	90                   	nop
  401b0f:	90                   	nop
  401b10:	ff 25 e8 50 40 00    	jmp    DWORD PTR ds:0x4050e8
  401b16:	90                   	nop
  401b17:	90                   	nop
	...
  401b20:	ff 25 00 51 40 00    	jmp    DWORD PTR ds:0x405100
  401b26:	90                   	nop
  401b27:	90                   	nop
	...
  401b30:	ff 25 04 51 40 00    	jmp    DWORD PTR ds:0x405104
  401b36:	90                   	nop
  401b37:	90                   	nop
	...
  401b40:	ff 25 f8 50 40 00    	jmp    DWORD PTR ds:0x4050f8
  401b46:	90                   	nop
  401b47:	90                   	nop
	...
  401b50:	ff 25 38 51 40 00    	jmp    DWORD PTR ds:0x405138
  401b56:	90                   	nop
  401b57:	90                   	nop
	...
  401b60:	ff 25 fc 50 40 00    	jmp    DWORD PTR ds:0x4050fc
  401b66:	90                   	nop
  401b67:	90                   	nop
	...
  401b70:	ff 25 10 51 40 00    	jmp    DWORD PTR ds:0x405110
  401b76:	90                   	nop
  401b77:	90                   	nop
	...
  401b80:	ff 25 f4 50 40 00    	jmp    DWORD PTR ds:0x4050f4
  401b86:	90                   	nop
  401b87:	90                   	nop
	...
  401b90:	ff 25 1c 51 40 00    	jmp    DWORD PTR ds:0x40511c
  401b96:	90                   	nop
  401b97:	90                   	nop
	...
  401ba0:	ff 25 34 51 40 00    	jmp    DWORD PTR ds:0x405134
  401ba6:	90                   	nop
  401ba7:	90                   	nop
	...
  401bb0:	ff 25 30 51 40 00    	jmp    DWORD PTR ds:0x405130
  401bb6:	90                   	nop
  401bb7:	90                   	nop
	...
  401bc0:	ff 25 28 51 40 00    	jmp    DWORD PTR ds:0x405128
  401bc6:	90                   	nop
  401bc7:	90                   	nop
	...
  401bd0:	ff 25 2c 51 40 00    	jmp    DWORD PTR ds:0x40512c
  401bd6:	90                   	nop
  401bd7:	90                   	nop
	...
  401be0:	ff 25 14 51 40 00    	jmp    DWORD PTR ds:0x405114
  401be6:	90                   	nop
  401be7:	90                   	nop
	...
  401bf0:	ff 25 20 51 40 00    	jmp    DWORD PTR ds:0x405120
  401bf6:	90                   	nop
  401bf7:	90                   	nop
	...
  401c00:	ff 25 24 51 40 00    	jmp    DWORD PTR ds:0x405124
  401c06:	90                   	nop
  401c07:	90                   	nop
	...
  401c10:	ff 25 dc 50 40 00    	jmp    DWORD PTR ds:0x4050dc
  401c16:	90                   	nop
  401c17:	90                   	nop
	...
  401c20:	ff 25 d0 50 40 00    	jmp    DWORD PTR ds:0x4050d0
  401c26:	90                   	nop
  401c27:	90                   	nop
	...
  401c30:	ff 25 d8 50 40 00    	jmp    DWORD PTR ds:0x4050d8
  401c36:	90                   	nop
  401c37:	90                   	nop
	...
  401c40:	ff 25 d4 50 40 00    	jmp    DWORD PTR ds:0x4050d4
  401c46:	90                   	nop
  401c47:	90                   	nop
	...
  401c50:	ff 25 cc 50 40 00    	jmp    DWORD PTR ds:0x4050cc
  401c56:	90                   	nop
  401c57:	90                   	nop
	...
  401c60:	55                   	push   ebp
  401c61:	89 e5                	mov    ebp,esp
  401c63:	5d                   	pop    ebp
  401c64:	e9 17 f6 ff ff       	jmp    0x401280
  401c69:	90                   	nop
  401c6a:	90                   	nop
  401c6b:	90                   	nop
  401c6c:	90                   	nop
  401c6d:	90                   	nop
  401c6e:	90                   	nop
  401c6f:	90                   	nop
  401c70:	ff                   	(bad)
  401c71:	ff                   	(bad)
  401c72:	ff                   	(bad)
  401c73:	ff 60 1c             	jmp    DWORD PTR [eax+0x1c]
  401c76:	40                   	inc    eax
  401c77:	00 00                	add    BYTE PTR [eax],al
  401c79:	00 00                	add    BYTE PTR [eax],al
  401c7b:	00 ff                	add    bh,bh
  401c7d:	ff                   	(bad)
  401c7e:	ff                   	(bad)
  401c7f:	ff 00                	inc    DWORD PTR [eax]
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
  402020:	80 1c 40 00          	sbb    BYTE PTR [eax+eax*2],0x0
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
  403001:	2e 3a 3a             	cmp    bh,BYTE PTR cs:[edx]
  403004:	20 53 54             	and    BYTE PTR [ebx+0x54],dl
  403007:	41                   	inc    ecx
  403008:	47                   	inc    edi
  403009:	45                   	inc    ebp
  40300a:	20 31                	and    BYTE PTR [ecx],dh
  40300c:	20 5b 4c             	and    BYTE PTR [ebx+0x4c],bl
  40300f:	55                   	push   ebp
  403010:	43                   	inc    ebx
  403011:	4b                   	dec    ebx
  403012:	5d                   	pop    ebp
  403013:	20 3a                	and    BYTE PTR [edx],bh
  403015:	3a 2e                	cmp    ch,BYTE PTR [esi]
  403017:	00 0a                	add    BYTE PTR [edx],cl
  403019:	0a 45 6e             	or     al,BYTE PTR [ebp+0x6e]
  40301c:	74 65                	je     0x403083
  40301e:	72 20                	jb     0x403040
  403020:	73 65                	jae    0x403087
  403022:	72 69                	jb     0x40308d
  403024:	61                   	popa
  403025:	6c                   	ins    BYTE PTR es:[edi],dx
  403026:	3a 20                	cmp    ah,BYTE PTR [eax]
  403028:	00 25 6c 64 00 0a    	add    BYTE PTR ds:0xa00646c,ah
  40302e:	47                   	inc    edi
  40302f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403030:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403031:	64 21 20             	and    DWORD PTR fs:[eax],esp
  403034:	53                   	push   ebx
  403035:	54                   	push   esp
  403036:	41                   	inc    ecx
  403037:	47                   	inc    edi
  403038:	45                   	inc    ebp
  403039:	20 31                	and    BYTE PTR [ecx],dh
  40303b:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
  40303e:	6d                   	ins    DWORD PTR es:[edi],dx
  40303f:	70 6c                	jo     0x4030ad
  403041:	65 74 65             	gs je  0x4030a9
  403044:	64 21 00             	and    DWORD PTR fs:[eax],eax
  403047:	0a 0a                	or     cl,BYTE PTR [edx]
  403049:	2e 3a 3a             	cmp    bh,BYTE PTR cs:[edx]
  40304c:	20 53 54             	and    BYTE PTR [ebx+0x54],dl
  40304f:	41                   	inc    ecx
  403050:	47                   	inc    edi
  403051:	45                   	inc    ebp
  403052:	20 32                	and    BYTE PTR [edx],dh
  403054:	20 5b 4d             	and    BYTE PTR [ebx+0x4d],bl
  403057:	41                   	inc    ecx
  403058:	54                   	push   esp
  403059:	48                   	dec    eax
  40305a:	5d                   	pop    ebp
  40305b:	20 3a                	and    BYTE PTR [edx],bh
  40305d:	3a 2e                	cmp    ch,BYTE PTR [esi]
  40305f:	00 0a                	add    BYTE PTR [edx],cl
  403061:	0a 45 6e             	or     al,BYTE PTR [ebp+0x6e]
  403064:	74 65                	je     0x4030cb
  403066:	72 20                	jb     0x403088
  403068:	31 73 74             	xor    DWORD PTR [ebx+0x74],esi
  40306b:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
  40306e:	72 69                	jb     0x4030d9
  403070:	61                   	popa
  403071:	6c                   	ins    BYTE PTR es:[edi],dx
  403072:	3a 20                	cmp    ah,BYTE PTR [eax]
  403074:	00 0a                	add    BYTE PTR [edx],cl
  403076:	45                   	inc    ebp
  403077:	6e                   	outs   dx,BYTE PTR ds:[esi]
  403078:	74 65                	je     0x4030df
  40307a:	72 20                	jb     0x40309c
  40307c:	32 6e 64             	xor    ch,BYTE PTR [esi+0x64]
  40307f:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
  403082:	72 69                	jb     0x4030ed
  403084:	61                   	popa
  403085:	6c                   	ins    BYTE PTR es:[edi],dx
  403086:	3a 20                	cmp    ah,BYTE PTR [eax]
  403088:	00 0a                	add    BYTE PTR [edx],cl
  40308a:	45                   	inc    ebp
  40308b:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40308c:	65 74 72             	gs je  0x403101
  40308f:	20 33                	and    BYTE PTR [ebx],dh
  403091:	72 64                	jb     0x4030f7
  403093:	20 73 65             	and    BYTE PTR [ebx+0x65],dh
  403096:	72 69                	jb     0x403101
  403098:	61                   	popa
  403099:	6c                   	ins    BYTE PTR es:[edi],dx
  40309a:	3a 20                	cmp    ah,BYTE PTR [eax]
  40309c:	00 0a                	add    BYTE PTR [edx],cl
  40309e:	45                   	inc    ebp
  40309f:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4030a0:	65 74 72             	gs je  0x403115
  4030a3:	20 34 74             	and    BYTE PTR [esp+esi*2],dh
  4030a6:	68 20 73 65 72       	push   0x72657320
  4030ab:	69 61 6c 3a 20 00 0a 	imul   esp,DWORD PTR [ecx+0x6c],0xa00203a
  4030b2:	45                   	inc    ebp
  4030b3:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4030b4:	65 74 72             	gs je  0x403129
  4030b7:	20 35 74 68 20 73    	and    BYTE PTR ds:0x73206874,dh
  4030bd:	65 72 69             	gs jb  0x403129
  4030c0:	61                   	popa
  4030c1:	6c                   	ins    BYTE PTR es:[edi],dx
  4030c2:	3a 20                	cmp    ah,BYTE PTR [eax]
  4030c4:	00 0a                	add    BYTE PTR [edx],cl
  4030c6:	0a 47 6f             	or     al,BYTE PTR [edi+0x6f]
  4030c9:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4030ca:	64 21 20             	and    DWORD PTR fs:[eax],esp
  4030cd:	53                   	push   ebx
  4030ce:	54                   	push   esp
  4030cf:	41                   	inc    ecx
  4030d0:	47                   	inc    edi
  4030d1:	45                   	inc    ebp
  4030d2:	20 32                	and    BYTE PTR [edx],dh
  4030d4:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
  4030d7:	6d                   	ins    DWORD PTR es:[edi],dx
  4030d8:	70 6c                	jo     0x403146
  4030da:	65 74 65             	gs je  0x403142
  4030dd:	64 21 00             	and    DWORD PTR fs:[eax],eax
  4030e0:	0a 0a                	or     cl,BYTE PTR [edx]
  4030e2:	2e 3a 3a             	cmp    bh,BYTE PTR cs:[edx]
  4030e5:	20 53 54             	and    BYTE PTR [ebx+0x54],dl
  4030e8:	41                   	inc    ecx
  4030e9:	47                   	inc    edi
  4030ea:	45                   	inc    ebp
  4030eb:	20 33                	and    BYTE PTR [ebx],dh
  4030ed:	20 5b 49             	and    BYTE PTR [ebx+0x49],bl
  4030f0:	4e                   	dec    esi
  4030f1:	54                   	push   esp
  4030f2:	45                   	inc    ebp
  4030f3:	52                   	push   edx
  4030f4:	56                   	push   esi
  4030f5:	41                   	inc    ecx
  4030f6:	4c                   	dec    esp
  4030f7:	5d                   	pop    ebp
  4030f8:	20 3a                	and    BYTE PTR [edx],bh
  4030fa:	3a 2e                	cmp    ch,BYTE PTR [esi]
  4030fc:	00 0a                	add    BYTE PTR [edx],cl
  4030fe:	0a 45 6e             	or     al,BYTE PTR [ebp+0x6e]
  403101:	74 65                	je     0x403168
  403103:	72 20                	jb     0x403125
  403105:	49                   	dec    ecx
  403106:	44                   	inc    esp
  403107:	3a 20                	cmp    ah,BYTE PTR [eax]
  403109:	00 0a                	add    BYTE PTR [edx],cl
  40310b:	45                   	inc    ebp
  40310c:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40310d:	74 65                	je     0x403174
  40310f:	72 20                	jb     0x403131
  403111:	43                   	inc    ebx
  403112:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403113:	64 65 3a 20          	fs cmp ah,BYTE PTR gs:[eax]
  403117:	00 0a                	add    BYTE PTR [edx],cl
  403119:	42                   	inc    edx
  40311a:	65 73 74             	gs jae 0x403191
  40311d:	21 20                	and    DWORD PTR [eax],esp
  40311f:	53                   	push   ebx
  403120:	54                   	push   esp
  403121:	41                   	inc    ecx
  403122:	47                   	inc    edi
  403123:	45                   	inc    ebp
  403124:	20 33                	and    BYTE PTR [ebx],dh
  403126:	20 63 6f             	and    BYTE PTR [ebx+0x6f],ah
  403129:	6d                   	ins    DWORD PTR es:[edi],dx
  40312a:	70 6c                	jo     0x403198
  40312c:	65 74 65             	gs je  0x403194
  40312f:	64 21 20             	and    DWORD PTR fs:[eax],esp
  403132:	4e                   	dec    esi
  403133:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403134:	77 20                	ja     0x403156
  403136:	77 72                	ja     0x4031aa
  403138:	69 74 65 20 74 75 74 	imul   esi,DWORD PTR [ebp+eiz*2+0x20],0x6f747574
  40313f:	6f 
  403140:	72 69                	jb     0x4031ab
  403142:	61                   	popa
  403143:	6c                   	ins    BYTE PTR es:[edi],dx
  403144:	20 61 6e             	and    BYTE PTR [ecx+0x6e],ah
  403147:	64 20 6d 61          	and    BYTE PTR fs:[ebp+0x61],ch
  40314b:	6b 65 20 6b          	imul   esp,DWORD PTR [ebp+0x20],0x6b
  40314f:	65 79 67             	gs jns 0x4031b9
  403152:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  403154:	21 00                	and    DWORD PTR [eax],eax
  403156:	0a 4d 61             	or     cl,BYTE PTR [ebp+0x61]
  403159:	79 20                	jns    0x40317b
  40315b:	62 65 20             	bound  esp,QWORD PTR [ebp+0x20]
  40315e:	63 75 70             	arpl   WORD PTR [ebp+0x70],esi
  403161:	20 6f 66             	and    BYTE PTR [edi+0x66],ch
  403164:	20 74 65 61          	and    BYTE PTR [ebp+eiz*2+0x61],dh
  403168:	2e 2e 2e 00 00       	cs cs add BYTE PTR cs:[eax],al
  40316d:	00 00                	add    BYTE PTR [eax],al
  40316f:	00 2d 4c 49 42 47    	add    BYTE PTR ds:0x4742494c,ch
  403175:	43                   	inc    ebx
  403176:	43                   	inc    ebx
  403177:	57                   	push   edi
  403178:	33 32                	xor    esi,DWORD PTR [edx]
  40317a:	2d 45 48 2d 32       	sub    eax,0x322d4845
  40317f:	2d 53 4a 4c 4a       	sub    eax,0x4a4c4a53
  403184:	2d 47 54 48 52       	sub    eax,0x52485447
  403189:	2d 4d 49 4e 47       	sub    eax,0x474e494d
  40318e:	57                   	push   edi
  40318f:	33 32                	xor    esi,DWORD PTR [edx]
  403191:	00 00                	add    BYTE PTR [eax],al
  403193:	00 77 33             	add    BYTE PTR [edi+0x33],dh
  403196:	32 5f 73             	xor    bl,BYTE PTR [edi+0x73]
  403199:	68 61 72 65 64       	push   0x64657261
  40319e:	70 74                	jo     0x403214
  4031a0:	72 2d                	jb     0x4031cf
  4031a2:	3e 73 69             	ds jae 0x40320e
  4031a5:	7a 65                	jp     0x40320c
  4031a7:	20 3d 3d 20 73 69    	and    BYTE PTR ds:0x6973203d,bh
  4031ad:	7a 65                	jp     0x403214
  4031af:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4031b0:	66 28 57 33          	data16 sub BYTE PTR [edi+0x33],dl
  4031b4:	32 5f 45             	xor    bl,BYTE PTR [edi+0x45]
  4031b7:	48                   	dec    eax
  4031b8:	5f                   	pop    edi
  4031b9:	53                   	push   ebx
  4031ba:	48                   	dec    eax
  4031bb:	41                   	inc    ecx
  4031bc:	52                   	push   edx
  4031bd:	45                   	inc    ebp
  4031be:	44                   	inc    esp
  4031bf:	29 00                	sub    DWORD PTR [eax],eax
  4031c1:	25 73 3a 25 75       	and    eax,0x75253a73
  4031c6:	3a 20                	cmp    ah,BYTE PTR [eax]
  4031c8:	66 61                	popaw
  4031ca:	69 6c 65 64 20 61 73 	imul   ebp,DWORD PTR [ebp+eiz*2+0x64],0x73736120
  4031d1:	73 
  4031d2:	65 72 74             	gs jb  0x403249
  4031d5:	69 6f 6e 20 60 25 73 	imul   ebp,DWORD PTR [edi+0x6e],0x73256020
  4031dc:	27                   	daa
  4031dd:	0a 00                	or     al,BYTE PTR [eax]
  4031df:	00 2e                	add    BYTE PTR [esi],ch
  4031e1:	2e 2f                	cs das
  4031e3:	2e 2e 2f             	cs cs das
  4031e6:	67 63 63 2f          	arpl   WORD PTR [bp+di+0x2f],esp
  4031ea:	67 63 63 2f          	arpl   WORD PTR [bp+di+0x2f],esp
  4031ee:	63 6f 6e             	arpl   WORD PTR [edi+0x6e],ebp
  4031f1:	66 69 67 2f 69 33    	imul   sp,WORD PTR [edi+0x2f],0x3369
  4031f7:	38 36                	cmp    BYTE PTR [esi],dh
  4031f9:	2f                   	das
  4031fa:	77 33                	ja     0x40322f
  4031fc:	32 2d 73 68 61 72    	xor    ch,BYTE PTR ds:0x72616873
  403202:	65 64 2d 70 74 72 2e 	gs fs sub eax,0x2e727470
  403209:	63 00                	arpl   WORD PTR [eax],eax
  40320b:	00 47 65             	add    BYTE PTR [edi+0x65],al
  40320e:	74 41                	je     0x403251
  403210:	74 6f                	je     0x403281
  403212:	6d                   	ins    DWORD PTR es:[edi],dx
  403213:	4e                   	dec    esi
  403214:	61                   	popa
  403215:	6d                   	ins    DWORD PTR es:[edi],dx
  403216:	65 41                	gs inc ecx
  403218:	20 28                	and    BYTE PTR [eax],ch
  40321a:	61                   	popa
  40321b:	74 6f                	je     0x40328c
  40321d:	6d                   	ins    DWORD PTR es:[edi],dx
  40321e:	2c 20                	sub    al,0x20
  403220:	73 2c                	jae    0x40324e
  403222:	20 73 69             	and    BYTE PTR [ebx+0x69],dh
  403225:	7a 65                	jp     0x40328c
  403227:	6f                   	outs   dx,DWORD PTR ds:[esi]
  403228:	66 28 73 29          	data16 sub BYTE PTR [ebx+0x29],dh
  40322c:	29 20                	sub    DWORD PTR [eax],esp
  40322e:	21 3d 20 30 00 00    	and    DWORD PTR ds:0x3020,edi
	...
  405000:	cc                   	int3
  405001:	50                   	push   eax
  405002:	40                   	inc    eax
  405003:	00 90 52 40 00 e8    	add    BYTE PTR [eax-0x17ffbfae],dl
  405009:	50                   	push   eax
  40500a:	40                   	inc    eax
  40500b:	00 a4 52 40 00 f4 50 	add    BYTE PTR [edx+edx*2+0x50f40040],ah
  405012:	40                   	inc    eax
  405013:	00 f8                	add    al,bh
  405015:	52                   	push   edx
  405016:	40                   	inc    eax
	...
  405027:	00 7c 50 00          	add    BYTE PTR [eax+edx*2+0x0],bh
	...
  4050cb:	00 41 51             	add    BYTE PTR [ecx+0x51],al
  4050ce:	40                   	inc    eax
  4050cf:	00 4d 51             	add    BYTE PTR [ebp+0x51],cl
  4050d2:	40                   	inc    eax
  4050d3:	00 5d 51             	add    BYTE PTR [ebp+0x51],bl
  4050d6:	40                   	inc    eax
  4050d7:	00 69 51             	add    BYTE PTR [ecx+0x51],ch
  4050da:	40                   	inc    eax
  4050db:	00 79 51             	add    BYTE PTR [ecx+0x51],bh
  4050de:	40                   	inc    eax
  4050df:	00 ff                	add    bh,bh
  4050e1:	ff                   	(bad)
  4050e2:	ff                   	(bad)
  4050e3:	7f 00                	jg     0x4050e5
  4050e5:	00 00                	add    BYTE PTR [eax],al
  4050e7:	00 99 51 40 00 ff    	add    BYTE PTR [ecx-0xffbfaf],bl
  4050ed:	ff                   	(bad)
  4050ee:	ff                   	(bad)
  4050ef:	7f 00                	jg     0x4050f1
  4050f1:	00 00                	add    BYTE PTR [eax],al
  4050f3:	00 a5 51 40 00 b5    	add    BYTE PTR [ebp-0x4affbfaf],ah
  4050f9:	51                   	push   ecx
  4050fa:	40                   	inc    eax
  4050fb:	00 c5                	add    ch,al
  4050fd:	51                   	push   ecx
  4050fe:	40                   	inc    eax
  4050ff:	00 d5                	add    ch,dl
  405101:	51                   	push   ecx
  405102:	40                   	inc    eax
  405103:	00 e9                	add    cl,ch
  405105:	51                   	push   ecx
  405106:	40                   	inc    eax
  405107:	00 f5                	add    ch,dh
  405109:	51                   	push   ecx
  40510a:	40                   	inc    eax
  40510b:	00 fd                	add    ch,bh
  40510d:	51                   	push   ecx
  40510e:	40                   	inc    eax
  40510f:	00 09                	add    BYTE PTR [ecx],cl
  405111:	52                   	push   edx
  405112:	40                   	inc    eax
  405113:	00 15 52 40 00 1d    	add    BYTE PTR ds:0x1d004052,dl
  405119:	52                   	push   edx
  40511a:	40                   	inc    eax
  40511b:	00 29                	add    BYTE PTR [ecx],ch
  40511d:	52                   	push   edx
  40511e:	40                   	inc    eax
  40511f:	00 31                	add    BYTE PTR [ecx],dh
  405121:	52                   	push   edx
  405122:	40                   	inc    eax
  405123:	00 3d 52 40 00 49    	add    BYTE PTR ds:0x49004052,bh
  405129:	52                   	push   edx
  40512a:	40                   	inc    eax
  40512b:	00 51 52             	add    BYTE PTR [ecx+0x52],dl
  40512e:	40                   	inc    eax
  40512f:	00 5d 52             	add    BYTE PTR [ebp+0x52],bl
  405132:	40                   	inc    eax
  405133:	00 69 52             	add    BYTE PTR [ecx+0x52],ch
  405136:	40                   	inc    eax
  405137:	00 71 52             	add    BYTE PTR [ecx+0x52],dh
  40513a:	40                   	inc    eax
  40513b:	00 ff                	add    bh,bh
  40513d:	ff                   	(bad)
  40513e:	ff                   	(bad)
  40513f:	ff 00                	inc    DWORD PTR [eax]
  405141:	00 41 64             	add    BYTE PTR [ecx+0x64],al
  405144:	64 41                	fs inc ecx
  405146:	74 6f                	je     0x4051b7
  405148:	6d                   	ins    DWORD PTR es:[edi],dx
  405149:	41                   	inc    ecx
  40514a:	00 00                	add    BYTE PTR [eax],al
  40514c:	00 00                	add    BYTE PTR [eax],al
  40514e:	45                   	inc    ebp
  40514f:	78 69                	js     0x4051ba
  405151:	74 50                	je     0x4051a3
  405153:	72 6f                	jb     0x4051c4
  405155:	63 65 73             	arpl   WORD PTR [ebp+0x73],esp
  405158:	73 00                	jae    0x40515a
  40515a:	00 00                	add    BYTE PTR [eax],al
  40515c:	00 00                	add    BYTE PTR [eax],al
  40515e:	46                   	inc    esi
  40515f:	69 6e 64 41 74 6f 6d 	imul   ebp,DWORD PTR [esi+0x64],0x6d6f7441
  405166:	41                   	inc    ecx
  405167:	00 00                	add    BYTE PTR [eax],al
  405169:	00 47 65             	add    BYTE PTR [edi+0x65],al
  40516c:	74 41                	je     0x4051af
  40516e:	74 6f                	je     0x4051df
  405170:	6d                   	ins    DWORD PTR es:[edi],dx
  405171:	4e                   	dec    esi
  405172:	61                   	popa
  405173:	6d                   	ins    DWORD PTR es:[edi],dx
  405174:	65 41                	gs inc ecx
  405176:	00 00                	add    BYTE PTR [eax],al
  405178:	00 00                	add    BYTE PTR [eax],al
  40517a:	53                   	push   ebx
  40517b:	65 74 55             	gs je  0x4051d3
  40517e:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40517f:	68 61 6e 64 6c       	push   0x6c646e61
  405184:	65 64 45             	gs fs inc ebp
  405187:	78 63                	js     0x4051ec
  405189:	65 70 74             	gs jo  0x405200
  40518c:	69 6f 6e 46 69 6c 74 	imul   ebp,DWORD PTR [edi+0x6e],0x746c6946
  405193:	65 72 00             	gs jb  0x405196
  405196:	00 00                	add    BYTE PTR [eax],al
  405198:	00 00                	add    BYTE PTR [eax],al
  40519a:	5f                   	pop    edi
  40519b:	67 65 74 63          	addr16 gs je 0x405202
  40519f:	68 00 00 00 00       	push   0x0
  4051a4:	00 00                	add    BYTE PTR [eax],al
  4051a6:	5f                   	pop    edi
  4051a7:	5f                   	pop    edi
  4051a8:	67 65 74 6d          	addr16 gs je 0x405219
  4051ac:	61                   	popa
  4051ad:	69 6e 61 72 67 73 00 	imul   ebp,DWORD PTR [esi+0x61],0x736772
  4051b4:	00 00                	add    BYTE PTR [eax],al
  4051b6:	5f                   	pop    edi
  4051b7:	5f                   	pop    edi
  4051b8:	70 5f                	jo     0x405219
  4051ba:	5f                   	pop    edi
  4051bb:	65 6e                	outs   dx,BYTE PTR gs:[esi]
  4051bd:	76 69                	jbe    0x405228
  4051bf:	72 6f                	jb     0x405230
  4051c1:	6e                   	outs   dx,BYTE PTR ds:[esi]
  4051c2:	00 00                	add    BYTE PTR [eax],al
  4051c4:	00 00                	add    BYTE PTR [eax],al
  4051c6:	5f                   	pop    edi
  4051c7:	5f                   	pop    edi
  4051c8:	70 5f                	jo     0x405229
  4051ca:	5f                   	pop    edi
  4051cb:	66 6d                	ins    WORD PTR es:[edi],dx
  4051cd:	6f                   	outs   dx,DWORD PTR ds:[esi]
  4051ce:	64 65 00 00          	fs add BYTE PTR gs:[eax],al
  4051d2:	00 00                	add    BYTE PTR [eax],al
  4051d4:	00 00                	add    BYTE PTR [eax],al
  4051d6:	5f                   	pop    edi
  4051d7:	5f                   	pop    edi
  4051d8:	73 65                	jae    0x40523f
  4051da:	74 5f                	je     0x40523b
  4051dc:	61                   	popa
  4051dd:	70 70                	jo     0x40524f
  4051df:	5f                   	pop    edi
  4051e0:	74 79                	je     0x40525b
  4051e2:	70 65                	jo     0x405249
  4051e4:	00 00                	add    BYTE PTR [eax],al
  4051e6:	00 00                	add    BYTE PTR [eax],al
  4051e8:	00 00                	add    BYTE PTR [eax],al
  4051ea:	5f                   	pop    edi
  4051eb:	63 65 78             	arpl   WORD PTR [ebp+0x78],esp
  4051ee:	69 74 00 00 00 00 00 	imul   esi,DWORD PTR [eax+eax*1+0x0],0x0
  4051f5:	00 
  4051f6:	5f                   	pop    edi
  4051f7:	69 6f 62 00 00 00 00 	imul   ebp,DWORD PTR [edi+0x62],0x0
  4051fe:	5f                   	pop    edi
  4051ff:	6f                   	outs   dx,DWORD PTR ds:[esi]
  405200:	6e                   	outs   dx,BYTE PTR ds:[esi]
  405201:	65 78 69             	gs js  0x40526d
  405204:	74 00                	je     0x405206
  405206:	00 00                	add    BYTE PTR [eax],al
  405208:	00 00                	add    BYTE PTR [eax],al
  40520a:	5f                   	pop    edi
  40520b:	73 65                	jae    0x405272
  40520d:	74 6d                	je     0x40527c
  40520f:	6f                   	outs   dx,DWORD PTR ds:[esi]
  405210:	64 65 00 00          	fs add BYTE PTR gs:[eax],al
  405214:	00 00                	add    BYTE PTR [eax],al
  405216:	61                   	popa
  405217:	62 6f 72             	bound  ebp,QWORD PTR [edi+0x72]
  40521a:	74 00                	je     0x40521c
  40521c:	00 00                	add    BYTE PTR [eax],al
  40521e:	61                   	popa
  40521f:	74 65                	je     0x405286
  405221:	78 69                	js     0x40528c
  405223:	74 00                	je     0x405225
  405225:	00 00                	add    BYTE PTR [eax],al
  405227:	00 00                	add    BYTE PTR [eax],al
  405229:	00 65 78             	add    BYTE PTR [ebp+0x78],ah
  40522c:	69 74 00 00 00 00 66 	imul   esi,DWORD PTR [eax+eax*1+0x0],0x66660000
  405233:	66 
  405234:	6c                   	ins    BYTE PTR es:[edi],dx
  405235:	75 73                	jne    0x4052aa
  405237:	68 00 00 00 00       	push   0x0
  40523c:	00 00                	add    BYTE PTR [eax],al
  40523e:	66 70 72             	data16 jo 0x4052b3
  405241:	69 6e 74 66 00 00 00 	imul   ebp,DWORD PTR [esi+0x74],0x66
  405248:	00 00                	add    BYTE PTR [eax],al
  40524a:	66 72 65             	data16 jb 0x4052b2
  40524d:	65 00 00             	add    BYTE PTR gs:[eax],al
  405250:	00 00                	add    BYTE PTR [eax],al
  405252:	6d                   	ins    DWORD PTR es:[edi],dx
  405253:	61                   	popa
  405254:	6c                   	ins    BYTE PTR es:[edi],dx
  405255:	6c                   	ins    BYTE PTR es:[edi],dx
  405256:	6f                   	outs   dx,DWORD PTR ds:[esi]
  405257:	63 00                	arpl   WORD PTR [eax],eax
  405259:	00 00                	add    BYTE PTR [eax],al
  40525b:	00 00                	add    BYTE PTR [eax],al
  40525d:	00 70 72             	add    BYTE PTR [eax+0x72],dh
  405260:	69 6e 74 66 00 00 00 	imul   ebp,DWORD PTR [esi+0x74],0x66
  405267:	00 00                	add    BYTE PTR [eax],al
  405269:	00 73 63             	add    BYTE PTR [ebx+0x63],dh
  40526c:	61                   	popa
  40526d:	6e                   	outs   dx,BYTE PTR ds:[esi]
  40526e:	66 00 00             	data16 add BYTE PTR [eax],al
  405271:	00 73 69             	add    BYTE PTR [ebx+0x69],dh
  405274:	67 6e                	outs   dx,BYTE PTR ds:[si]
  405276:	61                   	popa
  405277:	6c                   	ins    BYTE PTR es:[edi],dx
  405278:	00 00                	add    BYTE PTR [eax],al
  40527a:	00 00                	add    BYTE PTR [eax],al
  40527c:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  40527f:	00 00                	add    BYTE PTR [eax],al
  405281:	50                   	push   eax
  405282:	00 00                	add    BYTE PTR [eax],al
  405284:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  405287:	00 00                	add    BYTE PTR [eax],al
  405289:	50                   	push   eax
  40528a:	00 00                	add    BYTE PTR [eax],al
  40528c:	00 50 00             	add    BYTE PTR [eax+0x0],dl
  40528f:	00 4b 45             	add    BYTE PTR [ebx+0x45],cl
  405292:	52                   	push   edx
  405293:	4e                   	dec    esi
  405294:	45                   	inc    ebp
  405295:	4c                   	dec    esp
  405296:	33 32                	xor    esi,DWORD PTR [edx]
  405298:	2e 64 6c             	cs fs ins BYTE PTR es:[edi],dx
  40529b:	6c                   	ins    BYTE PTR es:[edi],dx
  40529c:	00 00                	add    BYTE PTR [eax],al
  40529e:	00 00                	add    BYTE PTR [eax],al
  4052a0:	14 50                	adc    al,0x50
  4052a2:	00 00                	add    BYTE PTR [eax],al
  4052a4:	6d                   	ins    DWORD PTR es:[edi],dx
  4052a5:	73 76                	jae    0x40531d
  4052a7:	63 72 74             	arpl   WORD PTR [edx+0x74],esi
  4052aa:	2e 64 6c             	cs fs ins BYTE PTR es:[edi],dx
  4052ad:	6c                   	ins    BYTE PTR es:[edi],dx
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
  4052e3:	00 28                	add    BYTE PTR [eax],ch
  4052e5:	50                   	push   eax
  4052e6:	00 00                	add    BYTE PTR [eax],al
  4052e8:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052eb:	00 28                	add    BYTE PTR [eax],ch
  4052ed:	50                   	push   eax
  4052ee:	00 00                	add    BYTE PTR [eax],al
  4052f0:	28 50 00             	sub    BYTE PTR [eax+0x0],dl
  4052f3:	00 28                	add    BYTE PTR [eax],ch
  4052f5:	50                   	push   eax
  4052f6:	00 00                	add    BYTE PTR [eax],al
  4052f8:	6d                   	ins    DWORD PTR es:[edi],dx
  4052f9:	73 76                	jae    0x405371
  4052fb:	63 72 74             	arpl   WORD PTR [edx+0x74],esi
  4052fe:	2e 64 6c             	cs fs ins BYTE PTR es:[edi],dx
  405301:	6c                   	ins    BYTE PTR es:[edi],dx
	...
