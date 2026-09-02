
authors/crackmes-de/5ab77f6633c5d40ad448cc2a/original/_u/buggers.exe:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	8b 4c 24 24          	mov    ecx,DWORD PTR [esp+0x24]
  401004:	49                   	dec    ecx
  401005:	0f b7 51 3c          	movzx  edx,WORD PTR [ecx+0x3c]
  401009:	3b 4c 0a 34          	cmp    ecx,DWORD PTR [edx+ecx*1+0x34]
  40100d:	75 f5                	jne    0x401004
  40100f:	89 0d 30 31 40 00    	mov    DWORD PTR ds:0x403130,ecx
  401015:	56                   	push   esi
  401016:	57                   	push   edi
  401017:	53                   	push   ebx
  401018:	8b f9                	mov    edi,ecx
  40101a:	03 7f 3c             	add    edi,DWORD PTR [edi+0x3c]
  40101d:	8b 7f 78             	mov    edi,DWORD PTR [edi+0x78]
  401020:	03 f9                	add    edi,ecx
  401022:	89 3d 04 31 40 00    	mov    DWORD PTR ds:0x403104,edi
  401028:	8b 47 18             	mov    eax,DWORD PTR [edi+0x18]
  40102b:	a3 00 31 40 00       	mov    ds:0x403100,eax
  401030:	8b 77 20             	mov    esi,DWORD PTR [edi+0x20]
  401033:	03 35 30 31 40 00    	add    esi,DWORD PTR ds:0x403130
  401039:	56                   	push   esi
  40103a:	5b                   	pop    ebx
  40103b:	eb 6e                	jmp    0x4010ab
  40103d:	8b 3e                	mov    edi,DWORD PTR [esi]
  40103f:	03 3d 30 31 40 00    	add    edi,DWORD PTR ds:0x403130
  401045:	68 04 30 40 00       	push   0x403004
  40104a:	57                   	push   edi
  40104b:	e8 f0 01 00 00       	call   0x401240
  401050:	0b c0                	or     eax,eax
  401052:	74 48                	je     0x40109c
  401054:	8b 3d 04 31 40 00    	mov    edi,DWORD PTR ds:0x403104
  40105a:	8b 77 24             	mov    esi,DWORD PTR [edi+0x24]
  40105d:	8b 0d 00 30 40 00    	mov    ecx,DWORD PTR ds:0x403000
  401063:	41                   	inc    ecx
  401064:	d1 e1                	shl    ecx,1
  401066:	03 f1                	add    esi,ecx
  401068:	03 35 30 31 40 00    	add    esi,DWORD PTR ds:0x403130
  40106e:	33 c0                	xor    eax,eax
  401070:	66 8b 06             	mov    ax,WORD PTR [esi]
  401073:	8b 77 1c             	mov    esi,DWORD PTR [edi+0x1c]
  401076:	03 35 30 31 40 00    	add    esi,DWORD PTR ds:0x403130
  40107c:	48                   	dec    eax
  40107d:	c1 e0 02             	shl    eax,0x2
  401080:	03 f0                	add    esi,eax
  401082:	8b 3e                	mov    edi,DWORD PTR [esi]
  401084:	03 3d 30 31 40 00    	add    edi,DWORD PTR ds:0x403130
  40108a:	89 3d 08 31 40 00    	mov    DWORD PTR ds:0x403108,edi
  401090:	a1 30 31 40 00       	mov    eax,ds:0x403130
  401095:	a3 30 31 40 00       	mov    ds:0x403130,eax
  40109a:	eb 18                	jmp    0x4010b4
  40109c:	ff 05 00 30 40 00    	inc    DWORD PTR ds:0x403000
  4010a2:	ff 0d 00 31 40 00    	dec    DWORD PTR ds:0x403100
  4010a8:	83 c6 04             	add    esi,0x4
  4010ab:	83 3d 00 31 40 00 00 	cmp    DWORD PTR ds:0x403100,0x0
  4010b2:	77 89                	ja     0x40103d
  4010b4:	68 20 30 40 00       	push   0x403020
  4010b9:	ff 35 30 31 40 00    	push   DWORD PTR ds:0x403130
  4010bf:	ff 15 08 31 40 00    	call   DWORD PTR ds:0x403108
  4010c5:	a3 0c 31 40 00       	mov    ds:0x40310c,eax
  4010ca:	68 13 30 40 00       	push   0x403013
  4010cf:	ff 35 30 31 40 00    	push   DWORD PTR ds:0x403130
  4010d5:	ff 15 08 31 40 00    	call   DWORD PTR ds:0x403108
  4010db:	8b d8                	mov    ebx,eax
  4010dd:	be a2 30 40 00       	mov    esi,0x4030a2
  4010e2:	bf 2c 31 40 00       	mov    edi,0x40312c
  4010e7:	8a 06                	mov    al,BYTE PTR [esi]
  4010e9:	0a c0                	or     al,al
  4010eb:	74 14                	je     0x401101
  4010ed:	56                   	push   esi
  4010ee:	ff d3                	call   ebx
  4010f0:	89 07                	mov    DWORD PTR [edi],eax
  4010f2:	83 c7 04             	add    edi,0x4
  4010f5:	56                   	push   esi
  4010f6:	e8 05 01 00 00       	call   0x401200
  4010fb:	8d 74 30 01          	lea    esi,[eax+esi*1+0x1]
  4010ff:	eb e6                	jmp    0x4010e7
  401101:	bf 2c 30 40 00       	mov    edi,0x40302c
  401106:	be 10 31 40 00       	mov    esi,0x403110
  40110b:	8b 07                	mov    eax,DWORD PTR [edi]
  40110d:	0b c0                	or     eax,eax
  40110f:	74 29                	je     0x40113a
  401111:	8b 08                	mov    ecx,DWORD PTR [eax]
  401113:	8b d9                	mov    ebx,ecx
  401115:	83 c7 04             	add    edi,0x4
  401118:	8a 07                	mov    al,BYTE PTR [edi]
  40111a:	0a c0                	or     al,al
  40111c:	75 03                	jne    0x401121
  40111e:	47                   	inc    edi
  40111f:	eb ea                	jmp    0x40110b
  401121:	57                   	push   edi
  401122:	53                   	push   ebx
  401123:	ff 15 08 31 40 00    	call   DWORD PTR ds:0x403108
  401129:	89 06                	mov    DWORD PTR [esi],eax
  40112b:	83 c6 04             	add    esi,0x4
  40112e:	57                   	push   edi
  40112f:	e8 cc 00 00 00       	call   0x401200
  401134:	8d 7c 38 01          	lea    edi,[eax+edi*1+0x1]
  401138:	eb de                	jmp    0x401118
  40113a:	5b                   	pop    ebx
  40113b:	5f                   	pop    edi
  40113c:	5e                   	pop    esi
  40113d:	b8 28 01 00 00       	mov    eax,0x128
  401142:	a3 34 31 40 00       	mov    ds:0x403134,eax
  401147:	6a 00                	push   0x0
  401149:	6a 02                	push   0x2
  40114b:	ff 15 10 31 40 00    	call   DWORD PTR ds:0x403110
  401151:	a3 5c 32 40 00       	mov    ds:0x40325c,eax
  401156:	68 34 31 40 00       	push   0x403134
  40115b:	50                   	push   eax
  40115c:	ff 15 18 31 40 00    	call   DWORD PTR ds:0x403118
  401162:	6a 00                	push   0x0
  401164:	68 ae 30 40 00       	push   0x4030ae
  401169:	ff 15 28 31 40 00    	call   DWORD PTR ds:0x403128
  40116f:	83 f8 00             	cmp    eax,0x0
  401172:	0b c0                	or     eax,eax
  401174:	74 04                	je     0x40117a
  401176:	7c 27                	jl     0x40119f
  401178:	eb 25                	jmp    0x40119f
  40117a:	50                   	push   eax
  40117b:	56                   	push   esi
  40117c:	57                   	push   edi
  40117d:	bf 01 00 00 00       	mov    edi,0x1
  401182:	be 2c 31 40 00       	mov    esi,0x40312c
  401187:	ff 36                	push   DWORD PTR [esi]
  401189:	ff 15 0c 31 40 00    	call   DWORD PTR ds:0x40310c
  40118f:	83 c6 04             	add    esi,0x4
  401192:	4f                   	dec    edi
  401193:	75 f2                	jne    0x401187
  401195:	5f                   	pop    edi
  401196:	5e                   	pop    esi
  401197:	58                   	pop    eax
  401198:	6a 00                	push   0x0
  40119a:	e8 57 00 00 00       	call   0x4011f6
  40119f:	68 b6 30 40 00       	push   0x4030b6
  4011a4:	68 58 31 40 00       	push   0x403158
  4011a9:	ff 15 24 31 40 00    	call   DWORD PTR ds:0x403124
  4011af:	0b c0                	or     eax,eax
  4011b1:	75 2f                	jne    0x4011e2
  4011b3:	ff 35 3c 31 40 00    	push   DWORD PTR ds:0x40313c
  4011b9:	6a 01                	push   0x1
  4011bb:	68 ff 0f 1f 00       	push   0x1f0fff
  4011c0:	ff 15 14 31 40 00    	call   DWORD PTR ds:0x403114
  4011c6:	a3 64 32 40 00       	mov    ds:0x403264,eax
  4011cb:	6a 00                	push   0x0
  4011cd:	ff 35 64 32 40 00    	push   DWORD PTR ds:0x403264
  4011d3:	ff 15 20 31 40 00    	call   DWORD PTR ds:0x403120
  4011d9:	6a 00                	push   0x0
  4011db:	e8 16 00 00 00       	call   0x4011f6
  4011e0:	eb 11                	jmp    0x4011f3
  4011e2:	68 34 31 40 00       	push   0x403134
  4011e7:	ff 35 5c 32 40 00    	push   DWORD PTR ds:0x40325c
  4011ed:	ff 15 1c 31 40 00    	call   DWORD PTR ds:0x40311c
  4011f3:	eb aa                	jmp    0x40119f
  4011f5:	cc                   	int3
  4011f6:	ff 25 00 20 40 00    	jmp    DWORD PTR ds:0x402000
  4011fc:	cc                   	int3
  4011fd:	cc                   	int3
  4011fe:	cc                   	int3
  4011ff:	cc                   	int3
  401200:	55                   	push   ebp
  401201:	8b ec                	mov    ebp,esp
  401203:	53                   	push   ebx
  401204:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401207:	8d 50 03             	lea    edx,[eax+0x3]
  40120a:	8b 18                	mov    ebx,DWORD PTR [eax]
  40120c:	83 c0 04             	add    eax,0x4
  40120f:	8d 8b ff fe fe fe    	lea    ecx,[ebx-0x1010101]
  401215:	f7 d3                	not    ebx
  401217:	23 cb                	and    ecx,ebx
  401219:	81 e1 80 80 80 80    	and    ecx,0x80808080
  40121f:	74 e9                	je     0x40120a
  401221:	f7 c1 80 80 00 00    	test   ecx,0x8080
  401227:	75 06                	jne    0x40122f
  401229:	c1 e9 10             	shr    ecx,0x10
  40122c:	83 c0 02             	add    eax,0x2
  40122f:	d0 e1                	shl    cl,1
  401231:	1b c2                	sbb    eax,edx
  401233:	5b                   	pop    ebx
  401234:	c9                   	leave
  401235:	c2 04 00             	ret    0x4
  401238:	cc                   	int3
  401239:	cc                   	int3
  40123a:	cc                   	int3
  40123b:	cc                   	int3
  40123c:	cc                   	int3
  40123d:	cc                   	int3
  40123e:	cc                   	int3
  40123f:	cc                   	int3
  401240:	55                   	push   ebp
  401241:	8b ec                	mov    ebp,esp
  401243:	56                   	push   esi
  401244:	8b 4d 08             	mov    ecx,DWORD PTR [ebp+0x8]
  401247:	8b 55 0c             	mov    edx,DWORD PTR [ebp+0xc]
  40124a:	33 f6                	xor    esi,esi
  40124c:	8a 04 0e             	mov    al,BYTE PTR [esi+ecx*1]
  40124f:	3a 04 16             	cmp    al,BYTE PTR [esi+edx*1]
  401252:	75 10                	jne    0x401264
  401254:	83 c6 01             	add    esi,0x1
  401257:	84 c0                	test   al,al
  401259:	75 f1                	jne    0x40124c
  40125b:	8d 44 0e ff          	lea    eax,[esi+ecx*1-0x1]
  40125f:	2b 45 08             	sub    eax,DWORD PTR [ebp+0x8]
  401262:	eb 02                	jmp    0x401266
  401264:	33 c0                	xor    eax,eax
  401266:	5e                   	pop    esi
  401267:	c9                   	leave
  401268:	c2 08 00             	ret    0x8
