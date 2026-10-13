  40503f:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405042:	b8 c0 86 40 00       	mov    eax,0x4086c0
  405047:	b9 e9 03 00 00       	mov    ecx,0x3e9
  40504c:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  405050:	be 00 01 00 00       	mov    esi,0x100
  405055:	89 74 24 0c          	mov    DWORD PTR [esp+0xc],esi
  405059:	89 4c 24 04          	mov    DWORD PTR [esp+0x4],ecx
  40505d:	e8 6e 08 00 00       	call   4058d0 <_GetDlgItemTextA@16>
  405062:	a3 00 88 40 00       	mov    ds:0x408800,eax
  405067:	83 ec 10             	sub    esp,0x10
  40506a:	83 f8 03             	cmp    eax,0x3
  40506d:	0f 8e c7 00 00 00    	jle    40513a <_DialogProc@16+0x1ba>
  405073:	83 f8 20             	cmp    eax,0x20
  405076:	7e 22                	jle    40509a <_DialogProc@16+0x11a>
  405078:	b9 60 60 40 00       	mov    ecx,0x406060
  40507d:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  405081:	89 1c 24             	mov    DWORD PTR [esp],ebx
  405084:	b8 ea 03 00 00       	mov    eax,0x3ea
  405089:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  40508d:	e8 4e 08 00 00       	call   4058e0 <_SetDlgItemTextA@12>
  405092:	83 ec 0c             	sub    esp,0xc
  405095:	e9 07 ff ff ff       	jmp    404fa1 <_DialogProc@16+0x21>
  40509a:	89 1c 24             	mov    DWORD PTR [esp],ebx
  40509d:	b9 00 01 00 00       	mov    ecx,0x100
  4050a2:	ba a0 85 40 00       	mov    edx,0x4085a0
  4050a7:	89 4c 24 0c          	mov    DWORD PTR [esp+0xc],ecx
  4050ab:	be ea 03 00 00       	mov    esi,0x3ea
  4050b0:	31 db                	xor    ebx,ebx
  4050b2:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  4050b6:	89 74 24 04          	mov    DWORD PTR [esp+0x4],esi
  4050ba:	31 f6                	xor    esi,esi
  4050bc:	e8 0f 08 00 00       	call   4058d0 <_GetDlgItemTextA@16>
  4050c1:	83 ec 10             	sub    esp,0x10
  4050c4:	e8 77 e8 ff ff       	call   403940 <_snafu>
  4050c9:	e8 d2 f1 ff ff       	call   4042a0 <_fubar>
  4050ce:	e8 1d fa ff ff       	call   404af0 <_fugazi>
  4050d3:	eb 16                	jmp    4050eb <_DialogProc@16+0x16b>
  4050d5:	0f b6 8b 30 88 40 00 	movzx  ecx,BYTE PTR [ebx+0x408830]
  4050dc:	38 8b a0 84 40 00    	cmp    BYTE PTR [ebx+0x4084a0],cl
  4050e2:	0f 94 c2             	sete   dl
  4050e5:	0f b6 c2             	movzx  eax,dl
  4050e8:	01 c6                	add    esi,eax
  4050ea:	43                   	inc    ebx
  4050eb:	c7 04 24 a0 84 40 00 	mov    DWORD PTR [esp],0x4084a0
  4050f2:	e8 09 07 00 00       	call   405800 <_strlen>
  4050f7:	39 c3                	cmp    ebx,eax
  4050f9:	72 da                	jb     4050d5 <_DialogProc@16+0x155>
  4050fb:	c7 04 24 30 88 40 00 	mov    DWORD PTR [esp],0x408830
  405102:	e8 f9 06 00 00       	call   405800 <_strlen>
  405107:	39 c6                	cmp    esi,eax
  405109:	74 3d                	je     405148 <_DialogProc@16+0x1c8>
  40510b:	bb 40 00 00 00       	mov    ebx,0x40
  405110:	b9 9e 70 40 00       	mov    ecx,0x40709e
  405115:	ba 00 60 40 00       	mov    edx,0x406000
  40511a:	89 5c 24 0c          	mov    DWORD PTR [esp+0xc],ebx
  40511e:	89 4c 24 08          	mov    DWORD PTR [esp+0x8],ecx
  405122:	89 54 24 04          	mov    DWORD PTR [esp+0x4],edx
  405126:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  40512d:	e8 be 07 00 00       	call   4058f0 <_MessageBoxA@16>
  405132:	83 ec 10             	sub    esp,0x10
  405135:	e9 aa fe ff ff       	jmp    404fe4 <_DialogProc@16+0x64>
  40513a:	ba 81 60 40 00       	mov    edx,0x406081
  40513f:	89 54 24 08          	mov    DWORD PTR [esp+0x8],edx
  405143:	e9 39 ff ff ff       	jmp    405081 <_DialogProc@16+0x101>
  405148:	b8 40 00 00 00       	mov    eax,0x40
  40514d:	be a6 70 40 00       	mov    esi,0x4070a6
  405152:	bb 20 60 40 00       	mov    ebx,0x406020
  405157:	89 44 24 0c          	mov    DWORD PTR [esp+0xc],eax
  40515b:	89 74 24 08          	mov    DWORD PTR [esp+0x8],esi
  40515f:	89 5c 24 04          	mov    DWORD PTR [esp+0x4],ebx
  405163:	eb c1                	jmp    405126 <_DialogProc@16+0x1a6>
