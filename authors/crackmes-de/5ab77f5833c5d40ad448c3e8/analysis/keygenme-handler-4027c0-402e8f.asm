  4027c0:	55                   	push   ebp
  4027c1:	8b ec                	mov    ebp,esp
  4027c3:	83 ec 0c             	sub    esp,0xc
  4027c6:	68 76 11 40 00       	push   0x401176
  4027cb:	64 a1 00 00 00 00    	mov    eax,fs:0x0
  4027d1:	50                   	push   eax
  4027d2:	64 89 25 00 00 00 00 	mov    DWORD PTR fs:0x0,esp
  4027d9:	81 ec a4 01 00 00    	sub    esp,0x1a4
  4027df:	53                   	push   ebx
  4027e0:	56                   	push   esi
  4027e1:	57                   	push   edi
  4027e2:	89 65 f4             	mov    DWORD PTR [ebp-0xc],esp
  4027e5:	c7 45 f8 20 11 40 00 	mov    DWORD PTR [ebp-0x8],0x401120
  4027ec:	8b 5d 08             	mov    ebx,DWORD PTR [ebp+0x8]
  4027ef:	8b c3                	mov    eax,ebx
  4027f1:	83 e0 01             	and    eax,0x1
  4027f4:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  4027f7:	83 e3 fe             	and    ebx,0xfffffffe
  4027fa:	53                   	push   ebx
  4027fb:	89 5d 08             	mov    DWORD PTR [ebp+0x8],ebx
  4027fe:	8b 0b                	mov    ecx,DWORD PTR [ebx]
  402800:	ff 51 04             	call   DWORD PTR [ecx+0x4]
  402803:	8b 13                	mov    edx,DWORD PTR [ebx]
  402805:	33 f6                	xor    esi,esi
  402807:	53                   	push   ebx
  402808:	89 75 dc             	mov    DWORD PTR [ebp-0x24],esi
  40280b:	89 75 cc             	mov    DWORD PTR [ebp-0x34],esi
  40280e:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  402811:	89 75 c4             	mov    DWORD PTR [ebp-0x3c],esi
  402814:	89 75 c0             	mov    DWORD PTR [ebp-0x40],esi
  402817:	89 75 bc             	mov    DWORD PTR [ebp-0x44],esi
  40281a:	89 75 ac             	mov    DWORD PTR [ebp-0x54],esi
  40281d:	89 75 9c             	mov    DWORD PTR [ebp-0x64],esi
  402820:	89 75 8c             	mov    DWORD PTR [ebp-0x74],esi
  402823:	89 b5 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],esi
  402829:	89 b5 6c ff ff ff    	mov    DWORD PTR [ebp-0x94],esi
  40282f:	89 b5 5c ff ff ff    	mov    DWORD PTR [ebp-0xa4],esi
  402835:	89 b5 4c ff ff ff    	mov    DWORD PTR [ebp-0xb4],esi
  40283b:	89 b5 3c ff ff ff    	mov    DWORD PTR [ebp-0xc4],esi
  402841:	89 b5 2c ff ff ff    	mov    DWORD PTR [ebp-0xd4],esi
  402847:	89 b5 1c ff ff ff    	mov    DWORD PTR [ebp-0xe4],esi
  40284d:	89 b5 0c ff ff ff    	mov    DWORD PTR [ebp-0xf4],esi
  402853:	89 b5 fc fe ff ff    	mov    DWORD PTR [ebp-0x104],esi
  402859:	89 b5 ec fe ff ff    	mov    DWORD PTR [ebp-0x114],esi
  40285f:	89 b5 dc fe ff ff    	mov    DWORD PTR [ebp-0x124],esi
  402865:	89 b5 cc fe ff ff    	mov    DWORD PTR [ebp-0x134],esi
  40286b:	89 b5 bc fe ff ff    	mov    DWORD PTR [ebp-0x144],esi
  402871:	89 b5 ac fe ff ff    	mov    DWORD PTR [ebp-0x154],esi
  402877:	89 b5 9c fe ff ff    	mov    DWORD PTR [ebp-0x164],esi
  40287d:	ff 92 08 03 00 00    	call   DWORD PTR [edx+0x308]
  402883:	50                   	push   eax
  402884:	8d 45 bc             	lea    eax,[ebp-0x44]
  402887:	50                   	push   eax
  402888:	ff 15 58 10 40 00    	call   DWORD PTR ds:0x401058
  40288e:	8b f8                	mov    edi,eax
  402890:	8d 55 c8             	lea    edx,[ebp-0x38]
  402893:	52                   	push   edx
  402894:	57                   	push   edi
  402895:	8b 0f                	mov    ecx,DWORD PTR [edi]
  402897:	ff 91 a0 00 00 00    	call   DWORD PTR [ecx+0xa0]
  40289d:	3b c6                	cmp    eax,esi
  40289f:	db e2                	fnclex
  4028a1:	7d 12                	jge    0x4028b5
  4028a3:	68 a0 00 00 00       	push   0xa0
  4028a8:	68 50 23 40 00       	push   0x402350
  4028ad:	57                   	push   edi
  4028ae:	50                   	push   eax
  4028af:	ff 15 44 10 40 00    	call   DWORD PTR ds:0x401044
  4028b5:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  4028b8:	8b 3d 10 10 40 00    	mov    edi,DWORD PTR ds:0x401010
  4028be:	8d 55 ac             	lea    edx,[ebp-0x54]
  4028c1:	8d 4d cc             	lea    ecx,[ebp-0x34]
  4028c4:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  4028c7:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  4028ca:	c7 45 ac 08 00 00 00 	mov    DWORD PTR [ebp-0x54],0x8
  4028d1:	ff d7                	call   edi
  4028d3:	8d 4d bc             	lea    ecx,[ebp-0x44]
  4028d6:	ff 15 14 11 40 00    	call   DWORD PTR ds:0x401114
  4028dc:	8b 03                	mov    eax,DWORD PTR [ebx]
  4028de:	53                   	push   ebx
  4028df:	ff 90 04 03 00 00    	call   DWORD PTR [eax+0x304]
  4028e5:	8d 4d bc             	lea    ecx,[ebp-0x44]
  4028e8:	50                   	push   eax
  4028e9:	51                   	push   ecx
  4028ea:	ff 15 58 10 40 00    	call   DWORD PTR ds:0x401058
  4028f0:	8b 10                	mov    edx,DWORD PTR [eax]
  4028f2:	8d 4d c8             	lea    ecx,[ebp-0x38]
  4028f5:	51                   	push   ecx
  4028f6:	50                   	push   eax
  4028f7:	89 85 68 fe ff ff    	mov    DWORD PTR [ebp-0x198],eax
  4028fd:	ff 92 a0 00 00 00    	call   DWORD PTR [edx+0xa0]
  402903:	3b c6                	cmp    eax,esi
  402905:	db e2                	fnclex
  402907:	7d 18                	jge    0x402921
  402909:	8b 95 68 fe ff ff    	mov    edx,DWORD PTR [ebp-0x198]
  40290f:	68 a0 00 00 00       	push   0xa0
  402914:	68 50 23 40 00       	push   0x402350
  402919:	52                   	push   edx
  40291a:	50                   	push   eax
  40291b:	ff 15 44 10 40 00    	call   DWORD PTR ds:0x401044
  402921:	8b 45 c8             	mov    eax,DWORD PTR [ebp-0x38]
  402924:	8d 55 ac             	lea    edx,[ebp-0x54]
  402927:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40292a:	89 75 c8             	mov    DWORD PTR [ebp-0x38],esi
  40292d:	89 45 b4             	mov    DWORD PTR [ebp-0x4c],eax
  402930:	c7 45 ac 08 00 00 00 	mov    DWORD PTR [ebp-0x54],0x8
  402937:	ff d7                	call   edi
  402939:	8d 4d bc             	lea    ecx,[ebp-0x44]
  40293c:	ff 15 14 11 40 00    	call   DWORD PTR ds:0x401114
  402942:	8b 35 9c 10 40 00    	mov    esi,DWORD PTR ds:0x40109c
  402948:	8d 45 ac             	lea    eax,[ebp-0x54]
  40294b:	6a 55                	push   0x55
  40294d:	50                   	push   eax
  40294e:	ff d6                	call   esi
  402950:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  402953:	6a 54                	push   0x54
  402955:	51                   	push   ecx
  402956:	ff d6                	call   esi
  402958:	8d 95 7c ff ff ff    	lea    edx,[ebp-0x84]
  40295e:	6a 57                	push   0x57
  402960:	52                   	push   edx
  402961:	ff d6                	call   esi
  402963:	8b 3d ac 10 40 00    	mov    edi,DWORD PTR ds:0x4010ac
  402969:	8d 45 ac             	lea    eax,[ebp-0x54]
  40296c:	8d 4d 9c             	lea    ecx,[ebp-0x64]
  40296f:	50                   	push   eax
  402970:	8d 55 8c             	lea    edx,[ebp-0x74]
  402973:	51                   	push   ecx
  402974:	52                   	push   edx
  402975:	ff d7                	call   edi
  402977:	50                   	push   eax
  402978:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  40297e:	8d 8d 6c ff ff ff    	lea    ecx,[ebp-0x94]
  402984:	50                   	push   eax
  402985:	51                   	push   ecx
  402986:	ff d7                	call   edi
  402988:	50                   	push   eax
  402989:	ff 15 18 10 40 00    	call   DWORD PTR ds:0x401018
  40298f:	8b d0                	mov    edx,eax
  402991:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402994:	ff 15 fc 10 40 00    	call   DWORD PTR ds:0x4010fc
  40299a:	8b d0                	mov    edx,eax
  40299c:	8d 4b 38             	lea    ecx,[ebx+0x38]
  40299f:	ff 15 c8 10 40 00    	call   DWORD PTR ds:0x4010c8
  4029a5:	8d 4d c8             	lea    ecx,[ebp-0x38]
  4029a8:	ff 15 18 11 40 00    	call   DWORD PTR ds:0x401118
  4029ae:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
  4029b4:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  4029ba:	52                   	push   edx
  4029bb:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  4029be:	50                   	push   eax
  4029bf:	8d 55 9c             	lea    edx,[ebp-0x64]
  4029c2:	51                   	push   ecx
  4029c3:	8d 45 ac             	lea    eax,[ebp-0x54]
  4029c6:	52                   	push   edx
  4029c7:	50                   	push   eax
  4029c8:	6a 05                	push   0x5
  4029ca:	ff 15 1c 10 40 00    	call   DWORD PTR ds:0x40101c
  4029d0:	83 c4 18             	add    esp,0x18
  4029d3:	8d 4d ac             	lea    ecx,[ebp-0x54]
  4029d6:	6a 55                	push   0x55
  4029d8:	51                   	push   ecx
  4029d9:	ff d6                	call   esi
  4029db:	8d 55 9c             	lea    edx,[ebp-0x64]
  4029de:	6a 38                	push   0x38
  4029e0:	52                   	push   edx
  4029e1:	ff d6                	call   esi
  4029e3:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  4029e9:	6a 35                	push   0x35
  4029eb:	50                   	push   eax
  4029ec:	ff d6                	call   esi
  4029ee:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  4029f4:	6a 54                	push   0x54
  4029f6:	51                   	push   ecx
  4029f7:	ff d6                	call   esi
  4029f9:	8d 95 3c ff ff ff    	lea    edx,[ebp-0xc4]
  4029ff:	6a 38                	push   0x38
  402a01:	52                   	push   edx
  402a02:	ff d6                	call   esi
  402a04:	6a 34                	push   0x34
  402a06:	8d 85 1c ff ff ff    	lea    eax,[ebp-0xe4]
  402a0c:	50                   	push   eax
  402a0d:	ff d6                	call   esi
  402a0f:	8d 8d fc fe ff ff    	lea    ecx,[ebp-0x104]
  402a15:	6a 57                	push   0x57
  402a17:	51                   	push   ecx
  402a18:	ff d6                	call   esi
  402a1a:	8d 95 dc fe ff ff    	lea    edx,[ebp-0x124]
  402a20:	6a 38                	push   0x38
  402a22:	52                   	push   edx
  402a23:	ff d6                	call   esi
  402a25:	8d 85 bc fe ff ff    	lea    eax,[ebp-0x144]
  402a2b:	6a 37                	push   0x37
  402a2d:	50                   	push   eax
  402a2e:	ff d6                	call   esi
  402a30:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402a33:	8d 55 9c             	lea    edx,[ebp-0x64]
  402a36:	51                   	push   ecx
  402a37:	8d 45 8c             	lea    eax,[ebp-0x74]
  402a3a:	52                   	push   edx
  402a3b:	50                   	push   eax
  402a3c:	ff d7                	call   edi
  402a3e:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  402a44:	50                   	push   eax
  402a45:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
  402a4b:	51                   	push   ecx
  402a4c:	52                   	push   edx
  402a4d:	ff d7                	call   edi
  402a4f:	50                   	push   eax
  402a50:	8d 85 5c ff ff ff    	lea    eax,[ebp-0xa4]
  402a56:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  402a5c:	50                   	push   eax
  402a5d:	51                   	push   ecx
  402a5e:	ff d7                	call   edi
  402a60:	50                   	push   eax
  402a61:	8d 95 3c ff ff ff    	lea    edx,[ebp-0xc4]
  402a67:	8d 85 2c ff ff ff    	lea    eax,[ebp-0xd4]
  402a6d:	52                   	push   edx
  402a6e:	50                   	push   eax
  402a6f:	ff d7                	call   edi
  402a71:	8d 8d 1c ff ff ff    	lea    ecx,[ebp-0xe4]
  402a77:	50                   	push   eax
  402a78:	8d 95 0c ff ff ff    	lea    edx,[ebp-0xf4]
  402a7e:	51                   	push   ecx
  402a7f:	52                   	push   edx
  402a80:	ff d7                	call   edi
  402a82:	50                   	push   eax
  402a83:	8d 85 fc fe ff ff    	lea    eax,[ebp-0x104]
  402a89:	8d 8d ec fe ff ff    	lea    ecx,[ebp-0x114]
  402a8f:	50                   	push   eax
  402a90:	51                   	push   ecx
  402a91:	ff d7                	call   edi
  402a93:	50                   	push   eax
  402a94:	8d 95 dc fe ff ff    	lea    edx,[ebp-0x124]
  402a9a:	8d 85 cc fe ff ff    	lea    eax,[ebp-0x134]
  402aa0:	52                   	push   edx
  402aa1:	50                   	push   eax
  402aa2:	ff d7                	call   edi
  402aa4:	8d 8d bc fe ff ff    	lea    ecx,[ebp-0x144]
  402aaa:	50                   	push   eax
  402aab:	8d 95 ac fe ff ff    	lea    edx,[ebp-0x154]
  402ab1:	51                   	push   ecx
  402ab2:	52                   	push   edx
  402ab3:	ff d7                	call   edi
  402ab5:	50                   	push   eax
  402ab6:	ff 15 18 10 40 00    	call   DWORD PTR ds:0x401018
  402abc:	8b 35 fc 10 40 00    	mov    esi,DWORD PTR ds:0x4010fc
  402ac2:	8b d0                	mov    edx,eax
  402ac4:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402ac7:	ff d6                	call   esi
  402ac9:	8b d0                	mov    edx,eax
  402acb:	8d 4b 34             	lea    ecx,[ebx+0x34]
  402ace:	ff 15 c8 10 40 00    	call   DWORD PTR ds:0x4010c8
  402ad4:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402ad7:	ff 15 18 11 40 00    	call   DWORD PTR ds:0x401118
  402add:	8d 85 ac fe ff ff    	lea    eax,[ebp-0x154]
  402ae3:	8d 8d bc fe ff ff    	lea    ecx,[ebp-0x144]
  402ae9:	50                   	push   eax
  402aea:	8d 95 cc fe ff ff    	lea    edx,[ebp-0x134]
  402af0:	51                   	push   ecx
  402af1:	52                   	push   edx
  402af2:	8d 85 dc fe ff ff    	lea    eax,[ebp-0x124]
  402af8:	8d 8d ec fe ff ff    	lea    ecx,[ebp-0x114]
  402afe:	50                   	push   eax
  402aff:	8d 95 fc fe ff ff    	lea    edx,[ebp-0x104]
  402b05:	51                   	push   ecx
  402b06:	8d 85 0c ff ff ff    	lea    eax,[ebp-0xf4]
  402b0c:	52                   	push   edx
  402b0d:	8d 8d 1c ff ff ff    	lea    ecx,[ebp-0xe4]
  402b13:	50                   	push   eax
  402b14:	8d 95 2c ff ff ff    	lea    edx,[ebp-0xd4]
  402b1a:	51                   	push   ecx
  402b1b:	8d 85 3c ff ff ff    	lea    eax,[ebp-0xc4]
  402b21:	52                   	push   edx
  402b22:	8d 8d 4c ff ff ff    	lea    ecx,[ebp-0xb4]
  402b28:	50                   	push   eax
  402b29:	8d 95 5c ff ff ff    	lea    edx,[ebp-0xa4]
  402b2f:	51                   	push   ecx
  402b30:	8d 85 6c ff ff ff    	lea    eax,[ebp-0x94]
  402b36:	52                   	push   edx
  402b37:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  402b3d:	50                   	push   eax
  402b3e:	8d 55 8c             	lea    edx,[ebp-0x74]
  402b41:	51                   	push   ecx
  402b42:	8d 45 9c             	lea    eax,[ebp-0x64]
  402b45:	52                   	push   edx
  402b46:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402b49:	50                   	push   eax
  402b4a:	51                   	push   ecx
  402b4b:	6a 11                	push   0x11
  402b4d:	ff 15 1c 10 40 00    	call   DWORD PTR ds:0x40101c
  402b53:	8b 3d f4 10 40 00    	mov    edi,DWORD PTR ds:0x4010f4
  402b59:	83 c4 48             	add    esp,0x48
  402b5c:	8d 55 cc             	lea    edx,[ebp-0x34]
  402b5f:	8d 45 9c             	lea    eax,[ebp-0x64]
  402b62:	6a 01                	push   0x1
  402b64:	52                   	push   edx
  402b65:	50                   	push   eax
  402b66:	ff d7                	call   edi
  402b68:	8d 4d cc             	lea    ecx,[ebp-0x34]
  402b6b:	6a 02                	push   0x2
  402b6d:	8d 55 8c             	lea    edx,[ebp-0x74]
  402b70:	51                   	push   ecx
  402b71:	52                   	push   edx
  402b72:	ff d7                	call   edi
  402b74:	8b 3d a8 10 40 00    	mov    edi,DWORD PTR ds:0x4010a8
  402b7a:	8d 45 9c             	lea    eax,[ebp-0x64]
  402b7d:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402b80:	50                   	push   eax
  402b81:	51                   	push   ecx
  402b82:	ff d7                	call   edi
  402b84:	50                   	push   eax
  402b85:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  402b8b:	66 8b d0             	mov    dx,ax
  402b8e:	8d 45 8c             	lea    eax,[ebp-0x74]
  402b91:	66 6b d2 02          	imul   dx,dx,0x2
  402b95:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  402b98:	50                   	push   eax
  402b99:	0f 80 10 03 00 00    	jo     0x402eaf
  402b9f:	51                   	push   ecx
  402ba0:	66 89 95 4a fe ff ff 	mov    WORD PTR [ebp-0x1b6],dx
  402ba7:	ff d7                	call   edi
  402ba9:	50                   	push   eax
  402baa:	ff 15 2c 10 40 00    	call   DWORD PTR ds:0x40102c
  402bb0:	66 8b 95 4a fe ff ff 	mov    dx,WORD PTR [ebp-0x1b6]
  402bb7:	8b 3d 48 10 40 00    	mov    edi,DWORD PTR ds:0x401048
  402bbd:	66 0f af d0          	imul   dx,ax
  402bc1:	8d 45 cc             	lea    eax,[ebp-0x34]
  402bc4:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402bc7:	50                   	push   eax
  402bc8:	51                   	push   ecx
  402bc9:	0f 80 e0 02 00 00    	jo     0x402eaf
  402bcf:	66 89 95 a4 fe ff ff 	mov    WORD PTR [ebp-0x15c],dx
  402bd6:	c7 85 9c fe ff ff 02 	mov    DWORD PTR [ebp-0x164],0x2
  402bdd:	00 00 00 
  402be0:	ff d7                	call   edi
  402be2:	50                   	push   eax
  402be3:	8d 95 9c fe ff ff    	lea    edx,[ebp-0x164]
  402be9:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  402bef:	52                   	push   edx
  402bf0:	50                   	push   eax
  402bf1:	ff 15 e4 10 40 00    	call   DWORD PTR ds:0x4010e4
  402bf7:	50                   	push   eax
  402bf8:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  402bfe:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  402c01:	8d 55 c8             	lea    edx,[ebp-0x38]
  402c04:	51                   	push   ecx
  402c05:	52                   	push   edx
  402c06:	6a 02                	push   0x2
  402c08:	66 89 43 3c          	mov    WORD PTR [ebx+0x3c],ax
  402c0c:	ff 15 cc 10 40 00    	call   DWORD PTR ds:0x4010cc
  402c12:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  402c18:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  402c1b:	50                   	push   eax
  402c1c:	8d 55 9c             	lea    edx,[ebp-0x64]
  402c1f:	51                   	push   ecx
  402c20:	52                   	push   edx
  402c21:	6a 03                	push   0x3
  402c23:	ff 15 1c 10 40 00    	call   DWORD PTR ds:0x40101c
  402c29:	83 c4 1c             	add    esp,0x1c
  402c2c:	8d 45 cc             	lea    eax,[ebp-0x34]
  402c2f:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402c32:	c7 85 a4 fe ff ff 64 	mov    DWORD PTR [ebp-0x15c],0x64
  402c39:	00 00 00 
  402c3c:	50                   	push   eax
  402c3d:	51                   	push   ecx
  402c3e:	c7 85 9c fe ff ff 02 	mov    DWORD PTR [ebp-0x164],0x2
  402c45:	00 00 00 
  402c48:	ff d7                	call   edi
  402c4a:	50                   	push   eax
  402c4b:	8d 95 9c fe ff ff    	lea    edx,[ebp-0x164]
  402c51:	8d 45 9c             	lea    eax,[ebp-0x64]
  402c54:	52                   	push   edx
  402c55:	50                   	push   eax
  402c56:	ff 15 8c 10 40 00    	call   DWORD PTR ds:0x40108c
  402c5c:	50                   	push   eax
  402c5d:	ff 15 b0 10 40 00    	call   DWORD PTR ds:0x4010b0
  402c63:	66 8b 4b 3c          	mov    cx,WORD PTR [ebx+0x3c]
  402c67:	66 89 43 3e          	mov    WORD PTR [ebx+0x3e],ax
  402c6b:	51                   	push   ecx
  402c6c:	8d 7b 40             	lea    edi,[ebx+0x40]
  402c6f:	ff 15 04 10 40 00    	call   DWORD PTR ds:0x401004
  402c75:	8b d0                	mov    edx,eax
  402c77:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402c7a:	ff d6                	call   esi
  402c7c:	66 8b 53 3e          	mov    dx,WORD PTR [ebx+0x3e]
  402c80:	50                   	push   eax
  402c81:	52                   	push   edx
  402c82:	ff 15 04 10 40 00    	call   DWORD PTR ds:0x401004
  402c88:	8b d0                	mov    edx,eax
  402c8a:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  402c8d:	ff d6                	call   esi
  402c8f:	50                   	push   eax
  402c90:	ff 15 40 10 40 00    	call   DWORD PTR ds:0x401040
  402c96:	8b d0                	mov    edx,eax
  402c98:	8d 4d c0             	lea    ecx,[ebp-0x40]
  402c9b:	ff d6                	call   esi
  402c9d:	8b d0                	mov    edx,eax
  402c9f:	8b cf                	mov    ecx,edi
  402ca1:	ff 15 c8 10 40 00    	call   DWORD PTR ds:0x4010c8
  402ca7:	8d 45 c0             	lea    eax,[ebp-0x40]
  402caa:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  402cad:	50                   	push   eax
  402cae:	8d 55 c8             	lea    edx,[ebp-0x38]
  402cb1:	51                   	push   ecx
  402cb2:	52                   	push   edx
  402cb3:	6a 03                	push   0x3
  402cb5:	ff 15 cc 10 40 00    	call   DWORD PTR ds:0x4010cc
  402cbb:	8b 07                	mov    eax,DWORD PTR [edi]
  402cbd:	83 c4 10             	add    esp,0x10
  402cc0:	8d 4d dc             	lea    ecx,[ebp-0x24]
  402cc3:	8d 95 9c fe ff ff    	lea    edx,[ebp-0x164]
  402cc9:	51                   	push   ecx
  402cca:	52                   	push   edx
  402ccb:	89 85 a4 fe ff ff    	mov    DWORD PTR [ebp-0x15c],eax
  402cd1:	c7 85 9c fe ff ff 08 	mov    DWORD PTR [ebp-0x164],0x8008
  402cd8:	80 00 00 
  402cdb:	ff 15 78 10 40 00    	call   DWORD PTR ds:0x401078
  402ce1:	66 85 c0             	test   ax,ax
  402ce4:	0f 84 ea 00 00 00    	je     0x402dd4
  402cea:	a1 38 43 40 00       	mov    eax,ds:0x404338
  402cef:	85 c0                	test   eax,eax
  402cf1:	75 10                	jne    0x402d03
  402cf3:	68 38 43 40 00       	push   0x404338
  402cf8:	68 a0 23 40 00       	push   0x4023a0
  402cfd:	ff 15 bc 10 40 00    	call   DWORD PTR ds:0x4010bc
  402d03:	8b 35 38 43 40 00    	mov    esi,DWORD PTR ds:0x404338
  402d09:	8d 4d bc             	lea    ecx,[ebp-0x44]
  402d0c:	51                   	push   ecx
  402d0d:	56                   	push   esi
  402d0e:	8b 06                	mov    eax,DWORD PTR [esi]
  402d10:	ff 50 14             	call   DWORD PTR [eax+0x14]
  402d13:	85 c0                	test   eax,eax
  402d15:	db e2                	fnclex
  402d17:	7d 0f                	jge    0x402d28
  402d19:	6a 14                	push   0x14
  402d1b:	68 90 23 40 00       	push   0x402390
  402d20:	56                   	push   esi
  402d21:	50                   	push   eax
  402d22:	ff 15 44 10 40 00    	call   DWORD PTR ds:0x401044
  402d28:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  402d2b:	68 64 23 40 00       	push   0x402364
  402d30:	50                   	push   eax
  402d31:	8b f0                	mov    esi,eax
  402d33:	8b 10                	mov    edx,DWORD PTR [eax]
  402d35:	ff 52 64             	call   DWORD PTR [edx+0x64]
  402d38:	85 c0                	test   eax,eax
  402d3a:	db e2                	fnclex
  402d3c:	7d 0f                	jge    0x402d4d
  402d3e:	6a 64                	push   0x64
  402d40:	68 b0 23 40 00       	push   0x4023b0
  402d45:	56                   	push   esi
  402d46:	50                   	push   eax
  402d47:	ff 15 44 10 40 00    	call   DWORD PTR ds:0x401044
  402d4d:	8d 4d bc             	lea    ecx,[ebp-0x44]
  402d50:	ff 15 14 11 40 00    	call   DWORD PTR ds:0x401114
  402d56:	b9 04 00 02 80       	mov    ecx,0x80020004
  402d5b:	b8 0a 00 00 00       	mov    eax,0xa
  402d60:	89 4d 84             	mov    DWORD PTR [ebp-0x7c],ecx
  402d63:	89 4d 94             	mov    DWORD PTR [ebp-0x6c],ecx
  402d66:	89 4d a4             	mov    DWORD PTR [ebp-0x5c],ecx
  402d69:	8d 95 9c fe ff ff    	lea    edx,[ebp-0x164]
  402d6f:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402d72:	89 85 7c ff ff ff    	mov    DWORD PTR [ebp-0x84],eax
  402d78:	89 45 8c             	mov    DWORD PTR [ebp-0x74],eax
  402d7b:	89 45 9c             	mov    DWORD PTR [ebp-0x64],eax
  402d7e:	c7 85 a4 fe ff ff c4 	mov    DWORD PTR [ebp-0x15c],0x4023c4
  402d85:	23 40 00 
  402d88:	c7 85 9c fe ff ff 08 	mov    DWORD PTR [ebp-0x164],0x8
  402d8f:	00 00 00 
  402d92:	ff 15 e8 10 40 00    	call   DWORD PTR ds:0x4010e8
  402d98:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  402d9e:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  402da1:	50                   	push   eax
  402da2:	8d 55 9c             	lea    edx,[ebp-0x64]
  402da5:	51                   	push   ecx
  402da6:	52                   	push   edx
  402da7:	8d 45 ac             	lea    eax,[ebp-0x54]
  402daa:	68 00 00 08 00       	push   0x80000
  402daf:	50                   	push   eax
  402db0:	ff 15 5c 10 40 00    	call   DWORD PTR ds:0x40105c
  402db6:	8d 8d 7c ff ff ff    	lea    ecx,[ebp-0x84]
  402dbc:	8d 55 8c             	lea    edx,[ebp-0x74]
  402dbf:	51                   	push   ecx
  402dc0:	8d 45 9c             	lea    eax,[ebp-0x64]
  402dc3:	52                   	push   edx
  402dc4:	8d 4d ac             	lea    ecx,[ebp-0x54]
  402dc7:	50                   	push   eax
  402dc8:	51                   	push   ecx
  402dc9:	6a 04                	push   0x4
  402dcb:	ff 15 1c 10 40 00    	call   DWORD PTR ds:0x40101c
  402dd1:	83 c4 14             	add    esp,0x14
  402dd4:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  402ddb:	68 90 2e 40 00       	push   0x402e90
  402de0:	e9 9a 00 00 00       	jmp    0x402e7f
  402de5:	8d 55 c0             	lea    edx,[ebp-0x40]
  402de8:	8d 45 c4             	lea    eax,[ebp-0x3c]
  402deb:	52                   	push   edx
  402dec:	8d 4d c8             	lea    ecx,[ebp-0x38]
  402def:	50                   	push   eax
  402df0:	51                   	push   ecx
  402df1:	6a 03                	push   0x3
  402df3:	ff 15 cc 10 40 00    	call   DWORD PTR ds:0x4010cc
  402df9:	83 c4 10             	add    esp,0x10
  402dfc:	8d 4d bc             	lea    ecx,[ebp-0x44]
  402dff:	ff 15 14 11 40 00    	call   DWORD PTR ds:0x401114
  402e05:	8d 95 ac fe ff ff    	lea    edx,[ebp-0x154]
  402e0b:	8d 85 bc fe ff ff    	lea    eax,[ebp-0x144]
  402e11:	52                   	push   edx
  402e12:	8d 8d cc fe ff ff    	lea    ecx,[ebp-0x134]
  402e18:	50                   	push   eax
  402e19:	8d 95 dc fe ff ff    	lea    edx,[ebp-0x124]
  402e1f:	51                   	push   ecx
  402e20:	8d 85 ec fe ff ff    	lea    eax,[ebp-0x114]
  402e26:	52                   	push   edx
  402e27:	8d 8d fc fe ff ff    	lea    ecx,[ebp-0x104]
  402e2d:	50                   	push   eax
  402e2e:	8d 95 0c ff ff ff    	lea    edx,[ebp-0xf4]
  402e34:	51                   	push   ecx
  402e35:	8d 85 1c ff ff ff    	lea    eax,[ebp-0xe4]
  402e3b:	52                   	push   edx
  402e3c:	8d 8d 2c ff ff ff    	lea    ecx,[ebp-0xd4]
  402e42:	50                   	push   eax
  402e43:	8d 95 3c ff ff ff    	lea    edx,[ebp-0xc4]
  402e49:	51                   	push   ecx
  402e4a:	8d 85 4c ff ff ff    	lea    eax,[ebp-0xb4]
  402e50:	52                   	push   edx
  402e51:	8d 8d 5c ff ff ff    	lea    ecx,[ebp-0xa4]
  402e57:	50                   	push   eax
  402e58:	8d 95 6c ff ff ff    	lea    edx,[ebp-0x94]
  402e5e:	51                   	push   ecx
  402e5f:	8d 85 7c ff ff ff    	lea    eax,[ebp-0x84]
  402e65:	52                   	push   edx
  402e66:	8d 4d 8c             	lea    ecx,[ebp-0x74]
  402e69:	50                   	push   eax
  402e6a:	8d 55 9c             	lea    edx,[ebp-0x64]
  402e6d:	51                   	push   ecx
  402e6e:	8d 45 ac             	lea    eax,[ebp-0x54]
  402e71:	52                   	push   edx
  402e72:	50                   	push   eax
  402e73:	6a 11                	push   0x11
  402e75:	ff 15 1c 10 40 00    	call   DWORD PTR ds:0x40101c
  402e7b:	83 c4 48             	add    esp,0x48
  402e7e:	c3                   	ret
  402e7f:	8b 35 14 10 40 00    	mov    esi,DWORD PTR ds:0x401014
  402e85:	8d 4d dc             	lea    ecx,[ebp-0x24]
  402e88:	ff d6                	call   esi
  402e8a:	8d 4d cc             	lea    ecx,[ebp-0x34]
  402e8d:	ff d6                	call   esi
  402e8f:	c3                   	ret
