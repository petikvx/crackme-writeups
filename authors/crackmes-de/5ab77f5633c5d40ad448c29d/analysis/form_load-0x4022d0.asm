  402319:	89 5d e8             	mov    DWORD PTR [ebp-0x18],ebx
  40231c:	89 5d d8             	mov    DWORD PTR [ebp-0x28],ebx
  40231f:	89 5d c8             	mov    DWORD PTR [ebp-0x38],ebx
  402322:	89 5d b8             	mov    DWORD PTR [ebp-0x48],ebx
  402325:	89 5d a8             	mov    DWORD PTR [ebp-0x58],ebx
  402328:	89 5d 98             	mov    DWORD PTR [ebp-0x68],ebx
  40232b:	89 5d 88             	mov    DWORD PTR [ebp-0x78],ebx
  40232e:	89 9d 78 ff ff ff    	mov    DWORD PTR [ebp-0x88],ebx
  402334:	89 9d 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],ebx
  40233a:	89 9d 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],ebx
  402340:	89 9d 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],ebx
  402346:	89 9d 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],ebx
  40234c:	ff 15 98 10 40 00    	call   DWORD PTR ds:0x401098
  402352:	8d 45 d8             	lea    eax,[ebp-0x28]
  402355:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402358:	50                   	push   eax
  402359:	51                   	push   ecx
  40235a:	ff 15 ac 10 40 00    	call   DWORD PTR ds:0x4010ac
  402360:	8d 55 c8             	lea    edx,[ebp-0x38]
  402363:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  402369:	52                   	push   edx
  40236a:	8d 4d b8             	lea    ecx,[ebp-0x48]
  40236d:	bf 02 00 00 00       	mov    edi,0x2
  402372:	50                   	push   eax
  402373:	51                   	push   ecx
  402374:	89 bd 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],edi
  40237a:	89 bd 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edi
  402380:	89 bd 60 ff ff ff    	mov    DWORD PTR [ebp-0xa0],edi
  402386:	89 bd 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],edi
  40238c:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c   ; __vbaVarPow
  402392:	50                   	push   eax
  402393:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  402399:	8d 45 a8             	lea    eax,[ebp-0x58]
  40239c:	52                   	push   edx
  40239d:	50                   	push   eax
  40239e:	ff 15 60 10 40 00    	call   DWORD PTR ds:0x401060   ; __vbaVarMul
  4023a4:	8b d0                	mov    edx,eax
  4023a6:	8d 4e 34             	lea    ecx,[esi+0x34]
  4023a9:	ff 15 08 10 40 00    	call   DWORD PTR ds:0x401008   ; __vbaVarMove
  4023af:	8d 4d c8             	lea    ecx,[ebp-0x38]
  4023b2:	8d 55 d8             	lea    edx,[ebp-0x28]
  4023b5:	51                   	push   ecx
  4023b6:	52                   	push   edx
  4023b7:	57                   	push   edi
  4023b8:	ff 15 14 10 40 00    	call   DWORD PTR ds:0x401014   ; __vbaFreeVarList
  4023be:	83 c4 0c             	add    esp,0xc
  4023c1:	8d 46 34             	lea    eax,[esi+0x34]
  4023c4:	8d 4d d8             	lea    ecx,[ebp-0x28]
  4023c7:	c7 85 70 ff ff ff b8 	mov    DWORD PTR [ebp-0x90],0xbb8
  4023ce:	0b 00 00 
  4023d1:	50                   	push   eax
  4023d2:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  4023d8:	50                   	push   eax
  4023d9:	51                   	push   ecx
  4023da:	89 bd 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edi
  4023e0:	c7 85 60 ff ff ff dc 	mov    DWORD PTR [ebp-0xa0],0x5dc
  4023e7:	05 00 00 
  4023ea:	89 bd 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],edi
  4023f0:	ff 15 60 10 40 00    	call   DWORD PTR ds:0x401060   ; __vbaVarMul
  4023f6:	50                   	push   eax
  4023f7:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  4023fd:	8d 45 c8             	lea    eax,[ebp-0x38]
  402400:	52                   	push   edx
  402401:	50                   	push   eax
  402402:	ff 15 70 10 40 00    	call   DWORD PTR ds:0x401070   ; __vbaVarDiv
  402408:	8b d0                	mov    edx,eax
  40240a:	8d 4e 44             	lea    ecx,[esi+0x44]
  40240d:	ff 15 08 10 40 00    	call   DWORD PTR ds:0x401008   ; __vbaVarMove
  402413:	8d 46 34             	lea    eax,[esi+0x34]
  402416:	8d 4d d8             	lea    ecx,[ebp-0x28]
  402419:	50                   	push   eax
  40241a:	8d 46 44             	lea    eax,[esi+0x44]
  40241d:	50                   	push   eax
  40241e:	51                   	push   ecx
  40241f:	89 bd 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],edi
  402425:	89 bd 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edi
  40242b:	ff 15 9c 10 40 00    	call   DWORD PTR ds:0x40109c   ; __vbaVarAdd
  402431:	50                   	push   eax
  402432:	8d 95 68 ff ff ff    	lea    edx,[ebp-0x98]
  402438:	8d 45 c8             	lea    eax,[ebp-0x38]
  40243b:	52                   	push   edx
  40243c:	50                   	push   eax
  40243d:	ff 15 60 10 40 00    	call   DWORD PTR ds:0x401060   ; __vbaVarMul
  402443:	8b d0                	mov    edx,eax
  402445:	8d 4e 54             	lea    ecx,[esi+0x54]
  402448:	ff 15 08 10 40 00    	call   DWORD PTR ds:0x401008   ; __vbaVarMove
  40244e:	8d 4d d8             	lea    ecx,[ebp-0x28]
  402451:	ff 15 0c 10 40 00    	call   DWORD PTR ds:0x40100c   ; __vbaFreeVar
  402457:	8d 46 54             	lea    eax,[esi+0x54]
  40245a:	8d 8d 68 ff ff ff    	lea    ecx,[ebp-0x98]
  402460:	50                   	push   eax
  402461:	8d 55 d8             	lea    edx,[ebp-0x28]
  402464:	51                   	push   ecx
  402465:	89 bd 70 ff ff ff    	mov    DWORD PTR [ebp-0x90],edi
  40246b:	89 bd 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],edi
  402471:	52                   	push   edx
  402472:	8d 7e 64             	lea    edi,[esi+0x64]
  402475:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c   ; __vbaVarPow
  40247b:	8b d0                	mov    edx,eax
  40247d:	8b cf                	mov    ecx,edi
  40247f:	ff 15 08 10 40 00    	call   DWORD PTR ds:0x401008   ; __vbaVarMove
  402485:	b8 08 00 00 00       	mov    eax,0x8
  40248a:	8d 4d d8             	lea    ecx,[ebp-0x28]
  40248d:	89 85 68 ff ff ff    	mov    DWORD PTR [ebp-0x98],eax
  402493:	89 85 58 ff ff ff    	mov    DWORD PTR [ebp-0xa8],eax
  402499:	89 85 48 ff ff ff    	mov    DWORD PTR [ebp-0xb8],eax
  40249f:	89 85 38 ff ff ff    	mov    DWORD PTR [ebp-0xc8],eax
  4024a5:	8d 85 68 ff ff ff    	lea    eax,[ebp-0x98]
  4024ab:	c7 85 70 ff ff ff 10 	mov    DWORD PTR [ebp-0x90],0x401a10
  4024b2:	1a 40 00 
  4024b5:	50                   	push   eax
  4024b6:	57                   	push   edi
  4024b7:	8b 3d 78 10 40 00    	mov    edi,DWORD PTR ds:0x401078
  4024bd:	51                   	push   ecx
  4024be:	c7 85 60 ff ff ff 20 	mov    DWORD PTR [ebp-0xa0],0x401a20
  4024c5:	1a 40 00 
  4024c8:	c7 85 50 ff ff ff 30 	mov    DWORD PTR [ebp-0xb0],0x401a30
  4024cf:	1a 40 00 
  4024d2:	c7 85 40 ff ff ff 40 	mov    DWORD PTR [ebp-0xc0],0x401a40
  4024d9:	1a 40 00 
  4024dc:	ff d7                	call   edi
  4024de:	50                   	push   eax
  4024df:	8d 95 58 ff ff ff    	lea    edx,[ebp-0xa8]
  4024e5:	8d 45 c8             	lea    eax,[ebp-0x38]
  4024e8:	52                   	push   edx
  4024e9:	50                   	push   eax
  4024ea:	ff d7                	call   edi
  4024ec:	50                   	push   eax
  4024ed:	8d 46 34             	lea    eax,[esi+0x34]
  4024f0:	8d 4d b8             	lea    ecx,[ebp-0x48]
  4024f3:	50                   	push   eax
  4024f4:	51                   	push   ecx
  4024f5:	ff d7                	call   edi
  4024f7:	50                   	push   eax
  4024f8:	8d 95 48 ff ff ff    	lea    edx,[ebp-0xb8]
  4024fe:	8d 45 a8             	lea    eax,[ebp-0x58]
  402501:	52                   	push   edx
  402502:	50                   	push   eax
  402503:	ff d7                	call   edi
  402505:	50                   	push   eax
  402506:	8d 46 54             	lea    eax,[esi+0x54]
  402509:	8d 4d 98             	lea    ecx,[ebp-0x68]
  40250c:	50                   	push   eax
  40250d:	51                   	push   ecx
  40250e:	ff d7                	call   edi
  402510:	50                   	push   eax
  402511:	8d 95 38 ff ff ff    	lea    edx,[ebp-0xc8]
  402517:	8d 45 88             	lea    eax,[ebp-0x78]
  40251a:	52                   	push   edx
  40251b:	50                   	push   eax
  40251c:	ff d7                	call   edi
  40251e:	50                   	push   eax
  40251f:	8d 46 44             	lea    eax,[esi+0x44]
