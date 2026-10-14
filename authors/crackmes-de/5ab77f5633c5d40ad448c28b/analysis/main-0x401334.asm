00401334 <_main>:
  401334:	8d 4c 24 04          	lea    ecx,[esp+0x4]
  401338:	83 e4 f0             	and    esp,0xfffffff0
  40133b:	ff 71 fc             	push   DWORD PTR [ecx-0x4]
  40133e:	55                   	push   ebp
  40133f:	89 e5                	mov    ebp,esp
  401341:	57                   	push   edi
  401342:	56                   	push   esi
  401343:	53                   	push   ebx
  401344:	51                   	push   ecx
  401345:	81 ec 98 00 00 00    	sub    esp,0x98
  40134b:	c7 45 ac 8c 19 40 00 	mov    DWORD PTR [ebp-0x54],0x40198c
  401352:	c7 45 b0 54 b0 46 00 	mov    DWORD PTR [ebp-0x50],0x46b054
  401359:	8d 45 b4             	lea    eax,[ebp-0x4c]
  40135c:	8d 55 e8             	lea    edx,[ebp-0x18]
  40135f:	89 10                	mov    DWORD PTR [eax],edx
  401361:	ba 65 15 40 00       	mov    edx,0x401565
  401366:	89 50 04             	mov    DWORD PTR [eax+0x4],edx
  401369:	89 60 08             	mov    DWORD PTR [eax+0x8],esp
  40136c:	8d 45 94             	lea    eax,[ebp-0x6c]
  40136f:	89 04 24             	mov    DWORD PTR [esp],eax
  401372:	e8 d1 59 01 00       	call   416d48 <__Unwind_SjLj_Register>
  401377:	e8 34 54 01 00       	call   4167b0 <___main>
  40137c:	8d 45 d8             	lea    eax,[ebp-0x28]
  40137f:	c7 45 98 01 00 00 00 	mov    DWORD PTR [ebp-0x68],0x1
  401386:	89 c1                	mov    ecx,eax
  401388:	e8 53 a3 04 00       	call   44b6e0 <__ZNSsC1Ev>
  40138d:	8d 45 d4             	lea    eax,[ebp-0x2c]
  401390:	c7 45 98 02 00 00 00 	mov    DWORD PTR [ebp-0x68],0x2
  401397:	89 c1                	mov    ecx,eax
  401399:	e8 42 a3 04 00       	call   44b6e0 <__ZNSsC1Ev>
  40139e:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4013a5:	e8 76 ec 01 00       	call   420020 <_time>
  4013aa:	89 04 24             	mov    DWORD PTR [esp],eax
  4013ad:	e8 76 ec 01 00       	call   420028 <_srand>
  4013b2:	e8 79 ec 01 00       	call   420030 <_rand>
  4013b7:	b9 1a 00 00 00       	mov    ecx,0x1a
  4013bc:	99                   	cdq
  4013bd:	f7 f9                	idiv   ecx
  4013bf:	89 d0                	mov    eax,edx
  4013c1:	83 c0 61             	add    eax,0x61
  4013c4:	88 45 e7             	mov    BYTE PTR [ebp-0x19],al
  4013c7:	8d 45 d4             	lea    eax,[ebp-0x2c]
  4013ca:	c7 04 24 40 e0 46 00 	mov    DWORD PTR [esp],0x46e040
  4013d1:	c7 45 98 03 00 00 00 	mov    DWORD PTR [ebp-0x68],0x3
  4013d8:	89 c1                	mov    ecx,eax
  4013da:	e8 e9 a7 04 00       	call   44bbc8 <__ZNSsaSEPKc>
  4013df:	83 ec 04             	sub    esp,0x4
  4013e2:	c7 44 24 04 48 e0 46 	mov    DWORD PTR [esp+0x4],0x46e048
  4013e9:	00 
  4013ea:	c7 04 24 60 78 47 00 	mov    DWORD PTR [esp],0x477860
  4013f1:	e8 86 7c 06 00       	call   46907c <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  4013f6:	8d 45 d8             	lea    eax,[ebp-0x28]
  4013f9:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4013fd:	c7 04 24 00 79 47 00 	mov    DWORD PTR [esp],0x477900
  401404:	e8 d3 18 00 00       	call   402cdc <__ZStrsIcSt11char_traitsIcESaIcEERSt13basic_istreamIT_T0_ES7_RSbIS4_S5_T1_E>
  401409:	0f be 45 e7          	movsx  eax,BYTE PTR [ebp-0x19]
  40140d:	89 45 90             	mov    DWORD PTR [ebp-0x70],eax
  401410:	8d 45 e0             	lea    eax,[ebp-0x20]
  401413:	c7 44 24 08 80 e0 46 	mov    DWORD PTR [esp+0x8],0x46e080
  40141a:	00 
  40141b:	8d 55 d4             	lea    edx,[ebp-0x2c]
  40141e:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  401422:	89 04 24             	mov    DWORD PTR [esp],eax
  401425:	e8 a6 84 06 00       	call   4698d0 <__ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_PKS3_>
  40142a:	8d 45 dc             	lea    eax,[ebp-0x24]
  40142d:	8b 55 90             	mov    edx,DWORD PTR [ebp-0x70]
  401430:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  401434:	8d 55 e0             	lea    edx,[ebp-0x20]
  401437:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  40143b:	89 04 24             	mov    DWORD PTR [esp],eax
  40143e:	c7 45 98 04 00 00 00 	mov    DWORD PTR [ebp-0x68],0x4
  401445:	e8 2e 85 06 00       	call   469978 <__ZStplIcSt11char_traitsIcESaIcEESbIT_T0_T1_ERKS6_S3_>
  40144a:	8d 45 dc             	lea    eax,[ebp-0x24]
  40144d:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401451:	8d 45 d8             	lea    eax,[ebp-0x28]
  401454:	89 04 24             	mov    DWORD PTR [esp],eax
  401457:	c7 45 98 05 00 00 00 	mov    DWORD PTR [ebp-0x68],0x5
  40145e:	e8 61 7b 06 00       	call   468fc4 <__ZSteqIcEN9__gnu_cxx11__enable_ifIXsrSt9__is_charIT_E7__valueEbE6__typeERKSbIS3_St11char_traitsIS3_ESaIS3_EESC_>
  401463:	88 45 8f             	mov    BYTE PTR [ebp-0x71],al
  401466:	8d 45 dc             	lea    eax,[ebp-0x24]
  401469:	c7 45 98 04 00 00 00 	mov    DWORD PTR [ebp-0x68],0x4
  401470:	89 c1                	mov    ecx,eax
  401472:	e8 85 a6 04 00       	call   44bafc <__ZNSsD1Ev>
  401477:	8d 45 e0             	lea    eax,[ebp-0x20]
  40147a:	c7 45 98 03 00 00 00 	mov    DWORD PTR [ebp-0x68],0x3
  401481:	89 c1                	mov    ecx,eax
  401483:	e8 74 a6 04 00       	call   44bafc <__ZNSsD1Ev>
  401488:	80 7d 8f 00          	cmp    BYTE PTR [ebp-0x71],0x0
  40148c:	74 14                	je     4014a2 <_main+0x16e>
  40148e:	c7 44 24 04 87 e0 46 	mov    DWORD PTR [esp+0x4],0x46e087
  401495:	00 
  401496:	c7 04 24 60 78 47 00 	mov    DWORD PTR [esp],0x477860
  40149d:	e8 da 7b 06 00       	call   46907c <__ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc>
  4014a2:	e8 b1 98 06 00       	call   46ad58 <_getchar>
  4014a7:	e8 ac 98 06 00       	call   46ad58 <_getchar>
  4014ac:	c7 45 88 00 00 00 00 	mov    DWORD PTR [ebp-0x78],0x0
  4014b3:	8d 45 d4             	lea    eax,[ebp-0x2c]
  4014b6:	c7 45 98 02 00 00 00 	mov    DWORD PTR [ebp-0x68],0x2
  4014bd:	89 c1                	mov    ecx,eax
  4014bf:	e8 38 a6 04 00       	call   44bafc <__ZNSsD1Ev>
  4014c4:	8d 45 d8             	lea    eax,[ebp-0x28]
  4014c7:	c7 45 98 01 00 00 00 	mov    DWORD PTR [ebp-0x68],0x1
  4014ce:	89 c1                	mov    ecx,eax
  4014d0:	e8 27 a6 04 00       	call   44bafc <__ZNSsD1Ev>
  4014d5:	8b 45 88             	mov    eax,DWORD PTR [ebp-0x78]
  4014d8:	89 45 84             	mov    DWORD PTR [ebp-0x7c],eax
  4014db:	e9 aa 00 00 00       	jmp    40158a <_main+0x256>
  4014e0:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  4014e6:	8d 45 dc             	lea    eax,[ebp-0x24]
  4014e9:	c7 45 98 00 00 00 00 	mov    DWORD PTR [ebp-0x68],0x0
  4014f0:	89 c1                	mov    ecx,eax
  4014f2:	e8 05 a6 04 00       	call   44bafc <__ZNSsD1Ev>
  4014f7:	8b 95 7c ff ff ff    	mov    edx,DWORD PTR [ebp-0x84]
  4014fd:	89 55 80             	mov    DWORD PTR [ebp-0x80],edx
  401500:	eb 03                	jmp    401505 <_main+0x1d1>
  401502:	89 45 80             	mov    DWORD PTR [ebp-0x80],eax
  401505:	8d 45 e0             	lea    eax,[ebp-0x20]
  401508:	c7 45 98 00 00 00 00 	mov    DWORD PTR [ebp-0x68],0x0
  40150f:	89 c1                	mov    ecx,eax
  401511:	e8 e6 a5 04 00       	call   44bafc <__ZNSsD1Ev>
  401516:	8b 45 80             	mov    eax,DWORD PTR [ebp-0x80]
  401519:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  40151f:	eb 06                	jmp    401527 <_main+0x1f3>
  401521:	89 85 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],eax
  401527:	8d 45 d4             	lea    eax,[ebp-0x2c]
  40152a:	c7 45 98 00 00 00 00 	mov    DWORD PTR [ebp-0x68],0x0
  401531:	89 c1                	mov    ecx,eax
  401533:	e8 c4 a5 04 00       	call   44bafc <__ZNSsD1Ev>
  401538:	8b 95 78 ff ff ff    	mov    edx,DWORD PTR [ebp-0x88]
  40153e:	89 95 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],edx
  401544:	eb 06                	jmp    40154c <_main+0x218>
  401546:	89 85 74 ff ff ff    	mov    DWORD PTR [ebp-0x8c],eax
  40154c:	8d 45 d8             	lea    eax,[ebp-0x28]
  40154f:	c7 45 98 00 00 00 00 	mov    DWORD PTR [ebp-0x68],0x0
  401556:	89 c1                	mov    ecx,eax
  401558:	e8 9f a5 04 00       	call   44bafc <__ZNSsD1Ev>
  40155d:	8b 85 74 ff ff ff    	mov    eax,DWORD PTR [ebp-0x8c]
  401563:	eb 16                	jmp    40157b <_main+0x247>
  401565:	8d 6d 18             	lea    ebp,[ebp+0x18]
  401568:	8b 45 9c             	mov    eax,DWORD PTR [ebp-0x64]
  40156b:	8b 55 98             	mov    edx,DWORD PTR [ebp-0x68]
  40156e:	c1 e2 02             	shl    edx,0x2
  401571:	81 c2 94 e0 46 00    	add    edx,0x46e094
  401577:	8b 12                	mov    edx,DWORD PTR [edx]
  401579:	ff e2                	jmp    edx
  40157b:	89 04 24             	mov    DWORD PTR [esp],eax
  40157e:	c7 45 98 ff ff ff ff 	mov    DWORD PTR [ebp-0x68],0xffffffff
  401585:	e8 f2 5c 01 00       	call   41727c <__Unwind_SjLj_Resume>
  40158a:	8d 45 94             	lea    eax,[ebp-0x6c]
