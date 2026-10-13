
original/CrackME.exe:     file format pei-i386


Disassembly of section .text:

0040145a <.text+0x45a>:
  40145a:	55                   	push   ebp
  40145b:	8b ec                	mov    ebp,esp
  40145d:	83 c4 c8             	add    esp,0xffffffc8
  401460:	89 55 c8             	mov    DWORD PTR [ebp-0x38],edx
  401463:	89 45 cc             	mov    DWORD PTR [ebp-0x34],eax
  401466:	b8 3c 13 43 00       	mov    eax,0x43133c
  40146b:	e8 84 87 02 00       	call   0x429bf4
  401470:	66 c7 45 e0 08 00    	mov    WORD PTR [ebp-0x20],0x8
  401476:	8d 45 fc             	lea    eax,[ebp-0x4]
  401479:	e8 1e 01 00 00       	call   0x40159c
  40147e:	8b d0                	mov    edx,eax
  401480:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  401483:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  401486:	8b 81 cc 01 00 00    	mov    eax,DWORD PTR [ecx+0x1cc]
  40148c:	e8 43 8f 00 00       	call   0x40a3d4
  401491:	8d 55 fc             	lea    edx,[ebp-0x4]
  401494:	52                   	push   edx
  401495:	ba 45 14 43 00       	mov    edx,0x431445
  40149a:	8d 45 f8             	lea    eax,[ebp-0x8]
  40149d:	e8 2e da 00 00       	call   0x40eed0
  4014a2:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  4014a5:	8d 55 f8             	lea    edx,[ebp-0x8]
  4014a8:	58                   	pop    eax
  4014a9:	e8 62 dd 00 00       	call   0x40f210
  4014ae:	50                   	push   eax
  4014af:	ff 4d ec             	dec    DWORD PTR [ebp-0x14]
  4014b2:	8d 45 f8             	lea    eax,[ebp-0x8]
  4014b5:	ba 02 00 00 00       	mov    edx,0x2
  4014ba:	e8 71 dc 00 00       	call   0x40f130
  4014bf:	ff 4d ec             	dec    DWORD PTR [ebp-0x14]
  4014c2:	8d 45 fc             	lea    eax,[ebp-0x4]
  4014c5:	ba 02 00 00 00       	mov    edx,0x2
  4014ca:	e8 61 dc 00 00       	call   0x40f130
  4014cf:	59                   	pop    ecx
  4014d0:	84 c9                	test   cl,cl
  4014d2:	74 6b                	je     0x40153f
  4014d4:	6a 00                	push   0x0
  4014d6:	68 58 14 43 00       	push   0x431458
  4014db:	68 4d 14 43 00       	push   0x43144d
  4014e0:	6a 00                	push   0x0
  4014e2:	e8 6f f9 02 00       	call   0x430e56
  4014e7:	66 c7 45 e0 14 00    	mov    WORD PTR [ebp-0x20],0x14
  4014ed:	ba 68 14 43 00       	mov    edx,0x431468
  4014f2:	8d 45 f4             	lea    eax,[ebp-0xc]
  4014f5:	e8 d6 d9 00 00       	call   0x40eed0
  4014fa:	ff 45 ec             	inc    DWORD PTR [ebp-0x14]
  4014fd:	8b 10                	mov    edx,DWORD PTR [eax]
  4014ff:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401502:	8b 80 dc 01 00 00    	mov    eax,DWORD PTR [eax+0x1dc]
  401508:	e8 f7 8e 00 00       	call   0x40a404
  40150d:	ff 4d ec             	dec    DWORD PTR [ebp-0x14]
  401510:	8d 45 f4             	lea    eax,[ebp-0xc]
  401513:	ba 02 00 00 00       	mov    edx,0x2
  401518:	e8 13 dc 00 00       	call   0x40f130
  40151d:	33 d2                	xor    edx,edx
  40151f:	8b 45 cc             	mov    eax,DWORD PTR [ebp-0x34]
  401522:	8b 80 c8 01 00 00    	mov    eax,DWORD PTR [eax+0x1c8]
  401528:	e8 3f 8e 00 00       	call   0x40a36c
  40152d:	33 d2                	xor    edx,edx
  40152f:	8b 4d cc             	mov    ecx,DWORD PTR [ebp-0x34]
  401532:	8b 81 cc 01 00 00    	mov    eax,DWORD PTR [ecx+0x1cc]
  401538:	e8 2f 8e 00 00       	call   0x40a36c
  40153d:	eb 13                	jmp    0x401552
  40153f:	6a 00                	push   0x0
  401541:	68 7e 14 43 00       	push   0x43147e
  401546:	68 73 14 43 00       	push   0x431473
  40154b:	6a 00                	push   0x0
  40154d:	e8 04 f9 02 00       	call   0x430e56
  401552:	8b 55 d0             	mov    edx,DWORD PTR [ebp-0x30]
  401555:	64 89 15 00 00 00 00 	mov    DWORD PTR fs:0x0,edx
  40155c:	8b e5                	mov    esp,ebp
  40155e:	5d                   	pop    ebp
  40155f:	c3                   	ret
