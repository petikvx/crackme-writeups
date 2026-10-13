  402f97:	b8 01 00 00 00       	mov    eax,0x1
  402f9c:	33 d2                	xor    edx,edx
  402f9e:	66 39 85 1c ff ff ff 	cmp    WORD PTR [ebp-0xe4],ax
  402fa5:	0f 94 c2             	sete   dl
  402fa8:	33 c9                	xor    ecx,ecx
  402faa:	f7 da                	neg    edx
  402fac:	66 39 85 24 ff ff ff 	cmp    WORD PTR [ebp-0xdc],ax
  402fb3:	0f 94 c1             	sete   cl
  402fb6:	f7 d9                	neg    ecx
  402fb8:	23 d1                	and    edx,ecx
  402fba:	33 c9                	xor    ecx,ecx
  402fbc:	66 39 8d 20 ff ff ff 	cmp    WORD PTR [ebp-0xe0],cx
  402fc3:	0f 94 c1             	sete   cl
  402fc6:	f7 d9                	neg    ecx
  402fc8:	23 d1                	and    edx,ecx
  402fca:	33 c9                	xor    ecx,ecx
  402fcc:	66 39 8d 3c ff ff ff 	cmp    WORD PTR [ebp-0xc4],cx
  402fd3:	0f 94 c1             	sete   cl
  402fd6:	f7 d9                	neg    ecx
  402fd8:	23 d1                	and    edx,ecx
  402fda:	33 c9                	xor    ecx,ecx
  402fdc:	66 39 85 38 ff ff ff 	cmp    WORD PTR [ebp-0xc8],ax
  402fe3:	0f 94 c1             	sete   cl
  402fe6:	f7 d9                	neg    ecx
  402fe8:	23 d1                	and    edx,ecx
  402fea:	33 c9                	xor    ecx,ecx
  402fec:	66 39 8d 40 ff ff ff 	cmp    WORD PTR [ebp-0xc0],cx
  402ff3:	0f 94 c1             	sete   cl
  402ff6:	f7 d9                	neg    ecx
  402ff8:	23 d1                	and    edx,ecx
  402ffa:	33 c9                	xor    ecx,ecx
  402ffc:	66 39 8d 2c ff ff ff 	cmp    WORD PTR [ebp-0xd4],cx
  403003:	0f 94 c1             	sete   cl
  403006:	f7 d9                	neg    ecx
  403008:	23 d1                	and    edx,ecx
  40300a:	33 c9                	xor    ecx,ecx
  40300c:	66 39 85 28 ff ff ff 	cmp    WORD PTR [ebp-0xd8],ax
  403013:	0f 94 c1             	sete   cl
  403016:	f7 d9                	neg    ecx
  403018:	23 d1                	and    edx,ecx
  40301a:	33 c9                	xor    ecx,ecx
  40301c:	66 39 85 34 ff ff ff 	cmp    WORD PTR [ebp-0xcc],ax
  403023:	0f 94 c1             	sete   cl
  403026:	f7 d9                	neg    ecx
  403028:	33 c0                	xor    eax,eax
  40302a:	23 d1                	and    edx,ecx
  40302c:	66 39 85 30 ff ff ff 	cmp    WORD PTR [ebp-0xd0],ax
  403033:	8d 4d c4             	lea    ecx,[ebp-0x3c]
  403036:	51                   	push   ecx
  403037:	8d 4d d0             	lea    ecx,[ebp-0x30]
  40303a:	0f 94 c0             	sete   al
  40303d:	f7 d8                	neg    eax
  40303f:	23 d0                	and    edx,eax
  403041:	8d 45 cc             	lea    eax,[ebp-0x34]
  403044:	89 95 c8 fe ff ff    	mov    DWORD PTR [ebp-0x138],edx
  40304a:	8d 55 c8             	lea    edx,[ebp-0x38]
  40304d:	52                   	push   edx
  40304e:	50                   	push   eax
  40304f:	8d 55 d4             	lea    edx,[ebp-0x2c]
  403052:	51                   	push   ecx
  403053:	8d 45 d8             	lea    eax,[ebp-0x28]
  403056:	52                   	push   edx
  403057:	8d 4d dc             	lea    ecx,[ebp-0x24]
  40305a:	50                   	push   eax
  40305b:	8d 55 e0             	lea    edx,[ebp-0x20]
  40305e:	51                   	push   ecx
  40305f:	8d 45 e4             	lea    eax,[ebp-0x1c]
  403062:	52                   	push   edx
  403063:	8d 4d e8             	lea    ecx,[ebp-0x18]
  403066:	50                   	push   eax
  403067:	51                   	push   ecx
  403068:	6a 0a                	push   0xa
  40306a:	ff 15 d0 50 40 00    	call   DWORD PTR ds:0x4050d0
  403070:	83 c4 2c             	add    esp,0x2c
  403073:	66 83 bd c8 fe ff ff 	cmp    WORD PTR [ebp-0x138],0x0
  40307a:	00 
  40307b:	0f 84 65 03 00 00    	je     0x4033e6
