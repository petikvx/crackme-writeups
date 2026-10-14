  4025e0:	55                   	push   ebp
  4025e1:	8b ec                	mov    ebp,esp
  4025e3:	83 ec 0c             	sub    esp,0xc
  4025e6:	68 06 11 40 00       	push   0x401106
  4025eb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4025f1:	50                   	push   eax
  4025f2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  4025f9:	81 ec 9c 00 00 00    	sub    esp,0x9c
  4025ff:	53                   	push   ebx
  402600:	56                   	push   esi
  402601:	57                   	push   edi
  402602:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  402605:	c7 45 f8 f0 10 40 00 	mov    DWORD PTR [ebp-0x8],0x4010f0
  40260c:	8b 75 08             	mov    esi,DWORD PTR [ebp+0x8]
  40260f:	8b c6                	mov    eax,esi
  402611:	83 e0 01             	and    eax,0x1
  402614:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  402617:	83 e6 fe             	and    esi,0xfffffffe
  40261a:	56                   	push   esi
  40261b:	89 75 08             	mov    DWORD PTR [ebp+0x8],esi
  40261e:	8b 0e                	mov    ecx,DWORD PTR [esi]
  402620:	ff 51 04             	call   DWORD PTR [ecx+0x4]
  402623:	8b 16                	mov    edx,DWORD PTR [esi]
  402625:	33 db                	xor    ebx,ebx
  402627:	56                   	push   esi
  402628:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  40262b:	89 5d e4             	mov    DWORD PTR [ebp-0x1c],ebx
  40262e:	89 5d d4             	mov    DWORD PTR [ebp-0x2c],ebx
  402631:	89 5d c4             	mov    DWORD PTR [ebp-0x3c],ebx
  402634:	89 5d b4             	mov    DWORD PTR [ebp-0x4c],ebx
  402637:	89 5d a4             	mov    DWORD PTR [ebp-0x5c],ebx
  40263a:	89 5d 94             	mov    DWORD PTR [ebp-0x6c],ebx
  40263d:	ff 92 fc 02 00 00    	call   DWORD PTR [edx+0x2fc]
  402643:	50                   	push   eax
  402644:	8d 45 e4             	lea    eax,[ebp-0x1c]
  402647:	50                   	push   eax
  402648:	ff 15 34 10 40 00    	call   DWORD PTR ds:0x401034   ; __vbaObjSet
  40264e:	8b f8                	mov    edi,eax
  402650:	8d 55 e8             	lea    edx,[ebp-0x18]
  402653:	52                   	push   edx
  402654:	57                   	push   edi
  402655:	8b 0f                	mov    ecx,DWORD PTR [edi]
  402657:	ff 91 a0 00 00 00    	call   DWORD PTR [ecx+0xa0]
  40265d:	3b c3                	cmp    eax,ebx
  40265f:	db e2                	fnclex
  402661:	7d 12                	jge    0x402675
  402663:	68 a0 00 00 00       	push   0xa0
  402668:	68 50 1a 40 00       	push   0x401a50
  40266d:	57                   	push   edi
  40266e:	50                   	push   eax
  40266f:	ff 15 24 10 40 00    	call   DWORD PTR ds:0x401024   ; __vbaHresultCheckObj
  402675:	8b 45 e8             	mov    eax,DWORD PTR [ebp-0x18]
  402678:	8b 4e 74             	mov    ecx,DWORD PTR [esi+0x74]
  40267b:	50                   	push   eax
  40267c:	51                   	push   ecx
  40267d:	ff 15 4c 10 40 00    	call   DWORD PTR ds:0x40104c   ; __vbaStrCmp
  402683:	8b f0                	mov    esi,eax
  402685:	8d 4d e8             	lea    ecx,[ebp-0x18]
  402688:	f7 de                	neg    esi
  40268a:	1b f6                	sbb    esi,esi
  40268c:	46                   	inc    esi
  40268d:	f7 de                	neg    esi
  40268f:	ff 15 bc 10 40 00    	call   DWORD PTR ds:0x4010bc   ; __vbaFreeStr
  402695:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  402698:	ff 15 c0 10 40 00    	call   DWORD PTR ds:0x4010c0   ; __vbaFreeObj
  40269e:	b9 04 00 02 80       	mov    ecx,0x80020004
  4026a3:	b8 0a 00 00 00       	mov    eax,0xa
  4026a8:	66 3b f3             	cmp    si,bx
  4026ab:	89 4d ac             	mov    DWORD PTR [ebp-0x54],ecx
  4026ae:	89 45 a4             	mov    DWORD PTR [ebp-0x5c],eax
  4026b1:	89 4d bc             	mov    DWORD PTR [ebp-0x44],ecx
  4026b4:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  4026b7:	89 4d cc             	mov    DWORD PTR [ebp-0x34],ecx
  4026ba:	89 45 c4             	mov    DWORD PTR [ebp-0x3c],eax
  4026bd:	74 43                	je     0x402702
  4026bf:	8d 55 94             	lea    edx,[ebp-0x6c]
  4026c2:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  4026c5:	c7 45 9c 64 1a 40 00 	mov    DWORD PTR [ebp-0x64],0x401a64
  4026cc:	c7 45 94 08 00 00 00 	mov    DWORD PTR [ebp-0x6c],0x8
  4026d3:	ff 15 a0 10 40 00    	call   DWORD PTR ds:0x4010a0   ; __vbaVarDup
  4026d9:	8d 55 a4             	lea    edx,[ebp-0x5c]
  4026dc:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4026df:	52                   	push   edx
  4026e0:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  4026e3:	50                   	push   eax
  4026e4:	51                   	push   ecx
  4026e5:	8d 55 d4             	lea    edx,[ebp-0x2c]
  4026e8:	53                   	push   ebx
  4026e9:	52                   	push   edx
  4026ea:	ff 15 30 10 40 00    	call   DWORD PTR ds:0x401030
  4026f0:	8d 45 a4             	lea    eax,[ebp-0x5c]
  4026f3:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  4026f6:	50                   	push   eax
  4026f7:	8d 55 c4             	lea    edx,[ebp-0x3c]
  4026fa:	51                   	push   ecx
  4026fb:	8d 45 d4             	lea    eax,[ebp-0x2c]
  4026fe:	52                   	push   edx
  4026ff:	50                   	push   eax
  402700:	eb 41                	jmp    0x402743
  402702:	8d 55 94             	lea    edx,[ebp-0x6c]
  402705:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  402708:	c7 45 9c 84 1a 40 00 	mov    DWORD PTR [ebp-0x64],0x401a84
  40270f:	c7 45 94 08 00 00 00 	mov    DWORD PTR [ebp-0x6c],0x8
  402716:	ff 15 a0 10 40 00    	call   DWORD PTR ds:0x4010a0   ; __vbaVarDup
  40271c:	8d 4d a4             	lea    ecx,[ebp-0x5c]
  40271f:	8d 55 b4             	lea    edx,[ebp-0x4c]
  402722:	51                   	push   ecx
  402723:	8d 45 c4             	lea    eax,[ebp-0x3c]
  402726:	52                   	push   edx
  402727:	50                   	push   eax
  402728:	8d 4d d4             	lea    ecx,[ebp-0x2c]
  40272b:	53                   	push   ebx
  40272c:	51                   	push   ecx
  40272d:	ff 15 30 10 40 00    	call   DWORD PTR ds:0x401030
  402733:	8d 55 a4             	lea    edx,[ebp-0x5c]
  402736:	8d 45 b4             	lea    eax,[ebp-0x4c]
  402739:	52                   	push   edx
  40273a:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  40273d:	50                   	push   eax
  40273e:	8d 55 d4             	lea    edx,[ebp-0x2c]
  402741:	51                   	push   ecx
  402742:	52                   	push   edx
  402743:	6a 04                	push   0x4
  402745:	ff 15 14 10 40 00    	call   DWORD PTR ds:0x401014   ; __vbaFreeVarList
  40274b:	83 c4 14             	add    esp,0x14
  40274e:	89 5d fc             	mov    DWORD PTR [ebp-0x4],ebx
  402751:	68 87 27 40 00       	push   0x402787
  402756:	eb 2e                	jmp    0x402786
  402758:	8d 4d e8             	lea    ecx,[ebp-0x18]
  40275b:	ff 15 bc 10 40 00    	call   DWORD PTR ds:0x4010bc   ; __vbaFreeStr
  402761:	8d 4d e4             	lea    ecx,[ebp-0x1c]
  402764:	ff 15 c0 10 40 00    	call   DWORD PTR ds:0x4010c0   ; __vbaFreeObj
  40276a:	8d 45 a4             	lea    eax,[ebp-0x5c]
  40276d:	8d 4d b4             	lea    ecx,[ebp-0x4c]
  402770:	50                   	push   eax
  402771:	8d 55 c4             	lea    edx,[ebp-0x3c]
  402774:	51                   	push   ecx
  402775:	8d 45 d4             	lea    eax,[ebp-0x2c]
  402778:	52                   	push   edx
  402779:	50                   	push   eax
  40277a:	6a 04                	push   0x4
  40277c:	ff 15 14 10 40 00    	call   DWORD PTR ds:0x401014   ; __vbaFreeVarList
  402782:	83 c4 14             	add    esp,0x14
  402785:	c3                   	ret
  402786:	c3                   	ret
  402787:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40278a:	50                   	push   eax
  40278b:	8b 08                	mov    ecx,DWORD PTR [eax]
  40278d:	ff 51 08             	call   DWORD PTR [ecx+0x8]
  402790:	8b 45 fc             	mov    eax,DWORD PTR [ebp-0x4]
  402793:	8b 4d ec             	mov    ecx,DWORD PTR [ebp-0x14]
  402796:	5f                   	pop    edi
  402797:	5e                   	pop    esi
  402798:	64 89 0d 00 00 00 00 	mov    DWORD PTR fs:0x0,ecx
  40279f:	5b                   	pop    ebx
  4027a0:	8b e5                	mov    esp,ebp
  4027a2:	5d                   	pop    ebp
  4027a3:	c2 04 00             	ret    0x4
