
/tmp/hw/m.exe:     file format pei-i386


Disassembly of section .text:

004015e5 <__Z15WindowProcedureP6HWND__jjl@16+0x71>:
  4015e5:	c7 44 24 0c 00 00 00 	mov    DWORD PTR [esp+0xc],0x0
  4015ec:	00 
  4015ed:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  4015f4:	00 
  4015f5:	c7 44 24 04 02 88 00 	mov    DWORD PTR [esp+0x4],0x8802
  4015fc:	00 
  4015fd:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401600:	89 04 24             	mov    DWORD PTR [esp],eax
  401603:	e8 58 18 00 00       	call   402e60 <_GetDlgItemInt@16>
  401608:	83 ec 10             	sub    esp,0x10
  40160b:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  40160e:	81 3d 44 61 40 00 90 	cmp    DWORD PTR ds:0x406144,0x34ea090
  401615:	a0 4e 03 
  401618:	75 37                	jne    401651 <__Z15WindowProcedureP6HWND__jjl@16+0xdd>
  40161a:	81 7d fc b8 15 00 00 	cmp    DWORD PTR [ebp-0x4],0x15b8
  401621:	75 2e                	jne    401651 <__Z15WindowProcedureP6HWND__jjl@16+0xdd>
  401623:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401626:	89 04 24             	mov    DWORD PTR [esp],eax
  401629:	e8 d2 17 00 00       	call   402e00 <_GetMenu@4>
  40162e:	83 ec 04             	sub    esp,0x4
  401631:	c7 44 24 08 00 00 00 	mov    DWORD PTR [esp+0x8],0x0
  401638:	00 
  401639:	c7 44 24 04 6d 00 00 	mov    DWORD PTR [esp+0x4],0x6d
  401640:	00 
  401641:	89 04 24             	mov    DWORD PTR [esp],eax
  401644:	e8 c7 17 00 00       	call   402e10 <_EnableMenuItem@12>
  401649:	83 ec 0c             	sub    esp,0xc
  40164c:	e9 b5 01 00 00       	jmp    401806 <__Z15WindowProcedureP6HWND__jjl@16+0x292>
  401651:	ff 05 28 60 40 00    	inc    DWORD PTR ds:0x406028
  401657:	83 3d 28 60 40 00 01 	cmp    DWORD PTR ds:0x406028,0x1
  40165e:	0f 85 a2 01 00 00    	jne    401806 <__Z15WindowProcedureP6HWND__jjl@16+0x292>
  401664:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  40166b:	e8 f0 18 00 00       	call   402f60 <_ExitProcess@4>
  401670:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  401673:	c1 e8 10             	shr    eax,0x10
  401676:	0f b7 c0             	movzx  eax,ax
  401679:	3d 00 04 00 00       	cmp    eax,0x400
  40167e:	74 05                	je     401685 <__Z15WindowProcedureP6HWND__jjl@16+0x111>
  401680:	e9 81 01 00 00       	jmp    401806 <__Z15WindowProcedureP6HWND__jjl@16+0x292>
  401685:	c7 44 24 04 02 88 00 	mov    DWORD PTR [esp+0x4],0x8802
  40168c:	00 
  40168d:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401690:	89 04 24             	mov    DWORD PTR [esp],eax
  401693:	e8 d8 17 00 00       	call   402e70 <_GetDlgItem@8>
  401698:	83 ec 08             	sub    esp,0x8
  40169b:	89 45 f8             	mov    DWORD PTR [ebp-0x8],eax
  40169e:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4016a1:	89 04 24             	mov    DWORD PTR [esp],eax
  4016a4:	e8 d7 17 00 00       	call   402e80 <_GetWindowTextLengthA@4>
  4016a9:	83 ec 04             	sub    esp,0x4
  4016ac:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  4016af:	c7 44 24 0c 04 00 00 	mov    DWORD PTR [esp+0xc],0x4
  4016b6:	00 
  4016b7:	c7 44 24 08 00 10 00 	mov    DWORD PTR [esp+0x8],0x1000
  4016be:	00 
  4016bf:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  4016c2:	40                   	inc    eax
  4016c3:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4016c7:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  4016ce:	e8 9d 18 00 00       	call   402f70 <_VirtualAlloc@16>
  4016d3:	83 ec 10             	sub    esp,0x10
  4016d6:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  4016d9:	8b 45 f4             	mov    eax,DWORD PTR [ebp-0xc]
  4016dc:	40                   	inc    eax
  4016dd:	89 44 24 08          	mov    DWORD PTR [esp+0x8],eax
  4016e1:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4016e4:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  4016e8:	8b 45 f8             	mov    eax,DWORD PTR [ebp-0x8]
  4016eb:	89 04 24             	mov    DWORD PTR [esp],eax
  4016ee:	e8 9d 17 00 00       	call   402e90 <_GetWindowTextA@12>
  4016f3:	83 ec 0c             	sub    esp,0xc
  4016f6:	83 7d f4 00          	cmp    DWORD PTR [ebp-0xc],0x0
  4016fa:	0f 8e 06 01 00 00    	jle    401806 <__Z15WindowProcedureP6HWND__jjl@16+0x292>
  401700:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  401703:	89 04 24             	mov    DWORD PTR [esp],eax
  401706:	e8 95 17 00 00       	call   402ea0 <_CharNextA@4>
  40170b:	83 ec 04             	sub    esp,0x4
  40170e:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  401711:	8d 45 ec             	lea    eax,[ebp-0x14]
  401714:	ff 08                	dec    DWORD PTR [eax]
  401716:	8b 55 f4             	mov    edx,DWORD PTR [ebp-0xc]
  401719:	8d 45 ec             	lea    eax,[ebp-0x14]
  40171c:	01 10                	add    DWORD PTR [eax],edx
  40171e:	8b 45 ec             	mov    eax,DWORD PTR [ebp-0x14]
  401721:	48                   	dec    eax
  401722:	89 44 24 04          	mov    DWORD PTR [esp+0x4],eax
  401726:	c7 04 24 40 60 40 00 	mov    DWORD PTR [esp],0x406040
  40172d:	e8 4e 18 00 00       	call   402f80 <_lstrcatA@8>
  401732:	83 ec 08             	sub    esp,0x8
  401735:	c7 04 24 40 60 40 00 	mov    DWORD PTR [esp],0x406040
  40173c:	e8 df 15 00 00       	call   402d20 <_atoi>
  401741:	a3 44 61 40 00       	mov    ds:0x406144,eax
  401746:	e9 bb 00 00 00       	jmp    401806 <__Z15WindowProcedureP6HWND__jjl@16+0x292>
  40174b:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  40174e:	89 04 24             	mov    DWORD PTR [esp],eax
  401751:	e8 5a 17 00 00       	call   402eb0 <_DestroyWindow@4>
  401756:	83 ec 04             	sub    esp,0x4
  401759:	c7 04 24 00 00 00 00 	mov    DWORD PTR [esp],0x0
  401760:	e8 fb 17 00 00       	call   402f60 <_ExitProcess@4>
