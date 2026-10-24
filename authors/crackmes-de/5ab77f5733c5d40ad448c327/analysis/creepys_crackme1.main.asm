
/tmp/cm/Creepy`sfirstcrackme.exe:     file format pei-i386


Disassembly of section .text:

00401390 <_main>:
  401390:	55                   	push   ebp
  401391:	89 e5                	mov    ebp,esp
  401393:	83 ec 48             	sub    esp,0x48
  401396:	83 e4 f0             	and    esp,0xfffffff0
  401399:	b8 00 00 00 00       	mov    eax,0x0
  40139e:	83 c0 0f             	add    eax,0xf
  4013a1:	83 c0 0f             	add    eax,0xf
  4013a4:	c1 e8 04             	shr    eax,0x4
  4013a7:	c1 e0 04             	shl    eax,0x4
  4013aa:	89 45 d4             	mov    DWORD PTR [ebp-0x2c],eax
  4013ad:	8b 45 d4             	mov    eax,DWORD PTR [ebp-0x2c]
  4013b0:	e8 0b be 00 00       	call   40d1c0 <___chkstk>
  4013b5:	e8 46 ba 00 00       	call   40ce00 <___main>
  4013ba:	b8 00 c8 6f 46       	mov    eax,0x466fc800
  4013bf:	89 45 e4             	mov    DWORD PTR [ebp-0x1c],eax
  4013c2:	c7 44 24 04 00 00 44 	mov    DWORD PTR [esp+0x4],0x440000
  4013c9:	00 
  4013ca:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  4013d1:	e8 c2 ad 03 00       	call   43c198 <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  4013d6:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  4013dd:	00 
  4013de:	89 04 24             	mov    DWORD PTR [esp],eax
  4013e1:	e8 0a 8d 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  4013e6:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  4013ed:	00 
  4013ee:	89 04 24             	mov    DWORD PTR [esp],eax
  4013f1:	e8 fa 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  4013f6:	c7 44 24 04 5f 00 44 	mov    DWORD PTR [esp+0x4],0x44005f
  4013fd:	00 
  4013fe:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  401405:	e8 8e ad 03 00       	call   43c198 <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  40140a:	8d 45 e8             	lea    eax,[ebp-0x18]
  40140d:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401411:	c7 04 24 60 34 44 00 	mov    DWORD PTR [esp],0x443460
  401418:	e8 a3 6a 02 00       	call   427ec0 <__ZNSirsERe>
  40141d:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  401424:	00 
  401425:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  40142c:	e8 bf 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  401431:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  401438:	00 
  401439:	89 04 24             	mov    DWORD PTR [esp],eax
  40143c:	e8 af 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  401441:	db 6d e8             	fld    TBYTE PTR [ebp-0x18]
  401444:	db 2d f0 00 44 00    	fld    TBYTE PTR ds:0x4400f0
  40144a:	d9 c9                	fxch   st(1)
  40144c:	da e9                	fucompp
  40144e:	df e0                	fnstsw ax
  401450:	9e                   	sahf
  401451:	7a 02                	jp     401455 <_main+0xc5>
  401453:	74 02                	je     401457 <_main+0xc7>
  401455:	eb 7e                	jmp    4014d5 <_main+0x145>
  401457:	c7 44 24 04 78 00 44 	mov    DWORD PTR [esp+0x4],0x440078
  40145e:	00 
  40145f:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  401466:	e8 2d ad 03 00       	call   43c198 <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  40146b:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  401472:	00 
  401473:	89 04 24             	mov    DWORD PTR [esp],eax
  401476:	e8 75 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  40147b:	c7 44 24 04 98 00 44 	mov    DWORD PTR [esp+0x4],0x440098
  401482:	00 
  401483:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  40148a:	e8 09 ad 03 00       	call   43c198 <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  40148f:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  401496:	00 
  401497:	89 04 24             	mov    DWORD PTR [esp],eax
  40149a:	e8 51 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  40149f:	c7 44 24 04 78 00 44 	mov    DWORD PTR [esp+0x4],0x440078
  4014a6:	00 
  4014a7:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  4014ae:	e8 e5 ac 03 00       	call   43c198 <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  4014b3:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  4014ba:	00 
  4014bb:	89 04 24             	mov    DWORD PTR [esp],eax
  4014be:	e8 2d 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  4014c3:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  4014ca:	00 
  4014cb:	89 04 24             	mov    DWORD PTR [esp],eax
  4014ce:	e8 1d 8c 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  4014d3:	eb 34                	jmp    401509 <_main+0x179>
  4014d5:	c7 44 24 04 bc 00 44 	mov    DWORD PTR [esp+0x4],0x4400bc
  4014dc:	00 
  4014dd:	c7 04 24 c0 33 44 00 	mov    DWORD PTR [esp],0x4433c0
  4014e4:	e8 af ac 03 00       	call   43c198 <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  4014e9:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  4014f0:	00 
  4014f1:	89 04 24             	mov    DWORD PTR [esp],eax
  4014f4:	e8 f7 8b 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  4014f9:	c7 44 24 04 68 af 43 	mov    DWORD PTR [esp+0x4],0x43af68
  401500:	00 
  401501:	89 04 24             	mov    DWORD PTR [esp],eax
  401504:	e8 e7 8b 02 00       	call   42a0f0 <__ZNSolsEPFRSoS_E>
  401509:	c7 04 24 e2 00 44 00 	mov    DWORD PTR [esp],0x4400e2
  401510:	e8 9b f2 00 00       	call   4107b0 <_system>
  401515:	b8 00 00 00 00       	mov    eax,0x0
  40151a:	c9                   	leave
  40151b:	c3                   	ret
