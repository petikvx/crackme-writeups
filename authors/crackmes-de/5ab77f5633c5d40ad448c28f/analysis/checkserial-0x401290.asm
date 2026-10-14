00401290 <_checkserial>:
  401290:	55                   	push   ebp
  401291:	89 e5                	mov    ebp,esp
  401293:	83 ec 1c             	sub    esp,0x1c
  401296:	57                   	push   edi
  401297:	56                   	push   esi
  401298:	53                   	push   ebx
  401299:	6a 64                	push   0x64
  40129b:	68 70 30 40 00       	push   0x403070
  4012a0:	6a 65                	push   0x65
  4012a2:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4012a5:	50                   	push   eax
  4012a6:	e8 15 04 00 00       	call   4016c0 <_GetDlgItemTextA@16>
  4012ab:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4012ae:	83 f8 04             	cmp    eax,0x4
  4012b1:	7f 09                	jg     4012bc <_checkserial+0x2c>
  4012b3:	6a 30                	push   0x30
  4012b5:	68 14 12 40 00       	push   0x401214
  4012ba:	eb 20                	jmp    4012dc <_checkserial+0x4c>
  4012bc:	6a 64                	push   0x64
  4012be:	68 00 30 40 00       	push   0x403000
  4012c3:	6a 66                	push   0x66
  4012c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4012c8:	50                   	push   eax
  4012c9:	e8 f2 03 00 00       	call   4016c0 <_GetDlgItemTextA@16>
  4012ce:	89 c7                	mov    edi,eax
  4012d0:	83 ff 04             	cmp    edi,0x4
  4012d3:	7f 1f                	jg     4012f4 <_checkserial+0x64>
  4012d5:	6a 30                	push   0x30
  4012d7:	68 58 12 40 00       	push   0x401258
  4012dc:	68 34 12 40 00       	push   0x401234
  4012e1:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4012e4:	50                   	push   eax
  4012e5:	e8 de 03 00 00       	call   4016c8 <_MessageBoxA@16>
  4012ea:	31 c0                	xor    eax,eax
  4012ec:	e9 dd 00 00 00       	jmp    4013ce <_checkserial+0x13e>
  4012f1:	8d 76 00             	lea    esi,[esi+0x0]
  4012f4:	31 f6                	xor    esi,esi
  4012f6:	3b 75 fc             	cmp    esi,DWORD PTR [ebp-0x4]
  4012f9:	0f 8d b6 00 00 00    	jge    4013b5 <_checkserial+0x125>
  4012ff:	90                   	nop
  401300:	c6 45 fb 00          	mov    BYTE PTR [ebp-0x5],0x0
  401304:	8a 86 70 30 40 00    	mov    al,BYTE PTR [esi+0x403070]
  40130a:	88 45 f9             	mov    BYTE PTR [ebp-0x7],al
  40130d:	c6 45 f8 00          	mov    BYTE PTR [ebp-0x8],0x0
  401311:	0f be d8             	movsx  ebx,al
  401314:	0f b6 55 fb          	movzx  edx,BYTE PTR [ebp-0x5]
  401318:	0f b6 45 f9          	movzx  eax,BYTE PTR [ebp-0x7]
  40131c:	01 d0                	add    eax,edx
  40131e:	d1 f8                	sar    eax,1
  401320:	88 45 fa             	mov    BYTE PTR [ebp-0x6],al
  401323:	0f b6 4d fa          	movzx  ecx,BYTE PTR [ebp-0x6]
  401327:	0f af c9             	imul   ecx,ecx
  40132a:	39 d9                	cmp    ecx,ebx
  40132c:	7e 03                	jle    401331 <_checkserial+0xa1>
  40132e:	88 45 f9             	mov    BYTE PTR [ebp-0x7],al
  401331:	39 d9                	cmp    ecx,ebx
  401333:	73 03                	jae    401338 <_checkserial+0xa8>
  401335:	88 45 fb             	mov    BYTE PTR [ebp-0x5],al
  401338:	0f b6 45 fb          	movzx  eax,BYTE PTR [ebp-0x5]
  40133c:	40                   	inc    eax
  40133d:	0f b6 55 f9          	movzx  edx,BYTE PTR [ebp-0x7]
  401341:	39 d0                	cmp    eax,edx
  401343:	75 04                	jne    401349 <_checkserial+0xb9>
  401345:	c6 45 f8 02          	mov    BYTE PTR [ebp-0x8],0x2
  401349:	39 d9                	cmp    ecx,ebx
  40134b:	75 04                	jne    401351 <_checkserial+0xc1>
  40134d:	c6 45 f8 01          	mov    BYTE PTR [ebp-0x8],0x1
  401351:	80 7d f8 00          	cmp    BYTE PTR [ebp-0x8],0x0
  401355:	74 bd                	je     401314 <_checkserial+0x84>
  401357:	80 7d f8 02          	cmp    BYTE PTR [ebp-0x8],0x2
  40135b:	75 06                	jne    401363 <_checkserial+0xd3>
  40135d:	8a 45 fb             	mov    al,BYTE PTR [ebp-0x5]
  401360:	88 45 fa             	mov    BYTE PTR [ebp-0x6],al
  401363:	39 fe                	cmp    esi,edi
  401365:	74 83                	je     4012ea <_checkserial+0x5a>
  401367:	0f be 8e 00 30 40 00 	movsx  ecx,BYTE PTR [esi+0x403000]
  40136e:	0f be 96 70 30 40 00 	movsx  edx,BYTE PTR [esi+0x403070]
  401375:	0f b6 45 fa          	movzx  eax,BYTE PTR [ebp-0x6]
  401379:	0f af c0             	imul   eax,eax
  40137c:	29 c2                	sub    edx,eax
  40137e:	89 f0                	mov    eax,esi
  401380:	0f af c0             	imul   eax,eax
  401383:	8d 1c 10             	lea    ebx,[eax+edx*1]
  401386:	ba 67 66 66 66       	mov    edx,0x66666667
  40138b:	89 d0                	mov    eax,edx
  40138d:	f7 eb                	imul   ebx
  40138f:	c1 fa 02             	sar    edx,0x2
  401392:	89 d8                	mov    eax,ebx
  401394:	c1 f8 1f             	sar    eax,0x1f
  401397:	29 c2                	sub    edx,eax
  401399:	8d 04 92             	lea    eax,[edx+edx*4]
  40139c:	01 c0                	add    eax,eax
  40139e:	29 c3                	sub    ebx,eax
  4013a0:	8d 43 30             	lea    eax,[ebx+0x30]
  4013a3:	39 c1                	cmp    ecx,eax
  4013a5:	0f 85 3f ff ff ff    	jne    4012ea <_checkserial+0x5a>
  4013ab:	46                   	inc    esi
  4013ac:	3b 75 fc             	cmp    esi,DWORD PTR [ebp-0x4]
  4013af:	0f 8c 4b ff ff ff    	jl     401300 <_checkserial+0x70>
  4013b5:	39 f7                	cmp    edi,esi
  4013b7:	75 15                	jne    4013ce <_checkserial+0x13e>
  4013b9:	6a 30                	push   0x30
  4013bb:	68 69 12 40 00       	push   0x401269
  4013c0:	68 72 12 40 00       	push   0x401272
  4013c5:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  4013c8:	50                   	push   eax
  4013c9:	e8 fa 02 00 00       	call   4016c8 <_MessageBoxA@16>
  4013ce:	8d 65 d8             	lea    esp,[ebp-0x28]
  4013d1:	5b                   	pop    ebx
  4013d2:	5e                   	pop    esi
  4013d3:	5f                   	pop    edi
  4013d4:	c9                   	leave
  4013d5:	c3                   	ret
  4013d6:	89 f6                	mov    esi,esi
