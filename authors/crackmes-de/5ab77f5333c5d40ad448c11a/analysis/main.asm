00401290 <_main>:
  401290:	55                   	push   ebp
  401291:	89 e5                	mov    ebp,esp
  401293:	83 ec 18             	sub    esp,0x18
  401296:	83 e4 f0             	and    esp,0xfffffff0
  401299:	b8 00 00 00 00       	mov    eax,0x0
  40129e:	83 c0 0f             	add    eax,0xf
  4012a1:	83 c0 0f             	add    eax,0xf
  4012a4:	c1 e8 04             	shr    eax,0x4
  4012a7:	c1 e0 04             	shl    eax,0x4
  4012aa:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4012ad:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  4012b0:	e8 1b 05 00 00       	call   4017d0 <___chkstk>
  4012b5:	e8 b6 01 00 00       	call   401470 <___main>
  4012ba:	c7 04 24 00 30 40 00 	mov    DWORD PTR [esp],0x403000
  4012c1:	e8 2a 06 00 00       	call   4018f0 <_printf>
  4012c6:	c7 44 24 04 09 20 40 	mov    DWORD PTR [esp+0x4],0x402009
  4012cd:	00 
  4012ce:	c7 04 24 4c 30 40 00 	mov    DWORD PTR [esp],0x40304c
  4012d5:	e8 16 06 00 00       	call   4018f0 <_printf>
  4012da:	c7 04 24 80 30 40 00 	mov    DWORD PTR [esp],0x403080
  4012e1:	e8 0a 06 00 00       	call   4018f0 <_printf>
  4012e6:	c7 04 24 cf 30 40 00 	mov    DWORD PTR [esp],0x4030cf
  4012ed:	e8 fe 05 00 00       	call   4018f0 <_printf>
  4012f2:	c7 44 24 04 70 40 40 	mov    DWORD PTR [esp+0x4],0x404070
  4012f9:	00 
  4012fa:	c7 04 24 e4 30 40 00 	mov    DWORD PTR [esp],0x4030e4
  401301:	e8 da 05 00 00       	call   4018e0 <_scanf>
  401306:	c7 04 24 e7 30 40 00 	mov    DWORD PTR [esp],0x4030e7
  40130d:	e8 de 05 00 00       	call   4018f0 <_printf>
  401312:	e8 40 00 00 00       	call   401357 <_createGoodBoy>
  401317:	c7 44 24 04 60 40 40 	mov    DWORD PTR [esp+0x4],0x404060
  40131e:	00 
  40131f:	c7 04 24 70 40 40 00 	mov    DWORD PTR [esp],0x404070
  401326:	e8 a5 05 00 00       	call   4018d0 <_strcmp>
  40132b:	85 c0                	test   eax,eax
  40132d:	75 0e                	jne    40133d <_main+0xad>
  40132f:	c7 04 24 ec 30 40 00 	mov    DWORD PTR [esp],0x4030ec
  401336:	e8 b5 05 00 00       	call   4018f0 <_printf>
  40133b:	eb 0c                	jmp    401349 <_main+0xb9>
  40133d:	c7 04 24 18 31 40 00 	mov    DWORD PTR [esp],0x403118
  401344:	e8 a7 05 00 00       	call   4018f0 <_printf>
  401349:	c7 04 24 39 31 40 00 	mov    DWORD PTR [esp],0x403139
  401350:	e8 6b 05 00 00       	call   4018c0 <_system>
  401355:	c9                   	leave
  401356:	c3                   	ret

00401357 <_createGoodBoy>:
00401357 <_createGoodBoy>:
  401357:	55                   	push   ebp
  401358:	89 e5                	mov    ebp,esp
  40135a:	83 ec 04             	sub    esp,0x4
  40135d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  401364:	83 7d fc 07          	cmp    DWORD PTR [ebp-0x4],0x7
  401368:	7f 1f                	jg     401389 <_createGoodBoy+0x32>
  40136a:	8b 55 fc             	mov    edx,DWORD PTR [ebp-0x4]
  40136d:	81 c2 60 40 40 00    	add    edx,0x404060
  401373:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  401376:	05 00 20 40 00       	add    eax,0x402000
  40137b:	0f b6 00             	movzx  eax,BYTE PTR [eax]
  40137e:	fe c0                	inc    al
  401380:	88 02                	mov    BYTE PTR [edx],al
  401382:	8d 45 fc             	lea    eax,[ebp-0x4]
  401385:	ff 00                	inc    DWORD PTR [eax]
  401387:	eb db                	jmp    401364 <_createGoodBoy+0xd>
  401389:	c9                   	leave
  40138a:	c3                   	ret
