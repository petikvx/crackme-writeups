
/tmp/n2.bin:     file format binary


Disassembly of section .data:

00000000 <.data>:
   0:	b9 10 00 00 00       	mov    ecx,0x10
   5:	8b 35 10 30 40 00    	mov    esi,DWORD PTR ds:0x403010
   b:	8b 16                	mov    edx,DWORD PTR [esi]
   d:	33 16                	xor    edx,DWORD PTR [esi]
   f:	46                   	inc    esi
  10:	e2 fb                	loop   0xd
  12:	e8 00 00 00 00       	call   0x17
  17:	58                   	pop    eax
  18:	7d 3d                	jge    0x57
  1a:	59                   	pop    ecx
  1b:	6f                   	outs   dx,DWORD PTR ds:[esi]
  1c:	75 20                	jne    0x3e
  1e:	68 61 76 65 20       	push   0x20657661
  23:	45                   	inc    ebp
  24:	6e                   	outs   dx,BYTE PTR ds:[esi]
  25:	74 65                	je     0x8c
  27:	72 20                	jb     0x49
  29:	74 68                	je     0x93
  2b:	65 20 63 6f          	and    BYTE PTR gs:[ebx+0x6f],ah
  2f:	64 65 20 77 72       	fs and BYTE PTR gs:[edi+0x72],dh
  34:	6f                   	outs   dx,DWORD PTR ds:[esi]
  35:	6e                   	outs   dx,BYTE PTR ds:[esi]
  36:	67 59                	addr16 pop ecx
  38:	6f                   	outs   dx,DWORD PTR ds:[esi]
  39:	75 20                	jne    0x5b
  3b:	73 6f                	jae    0xac
  3d:	6c                   	ins    BYTE PTR es:[edi],dx
  3e:	76 65                	jbe    0xa5
  40:	64 20 69 74          	and    BYTE PTR fs:[ecx+0x74],ch
  44:	21 20                	and    DWORD PTR [eax],esp
  46:	57                   	push   edi
  47:	65 6c                	gs ins BYTE PTR es:[edi],dx
  49:	6c                   	ins    BYTE PTR es:[edi],dx
  4a:	20 64 6f 6e          	and    BYTE PTR [edi+ebp*2+0x6e],ah
  4e:	65 20 6d 61          	and    BYTE PTR gs:[ebp+0x61],ch
  52:	74 65                	je     0xb9
  54:	20 3a                	and    BYTE PTR [edx],bh
  56:	29 83 c0 03 bb 1d    	sub    DWORD PTR [ebx+0x1dbb03c0],eax
  5c:	00 00                	add    BYTE PTR [eax],al
  5e:	00 81 fa 32 57 3e    	add    BYTE PTR [ecx+0x3e5732fa],al
  64:	4d                   	dec    ebp
  65:	75 05                	jne    0x6c
  67:	03 c3                	add    eax,ebx
  69:	83 c3 03             	add    ebx,0x3
  6c:	6a 00                	push   0x0
  6e:	6a 00                	push   0x0
  70:	53                   	push   ebx
  71:	50                   	push   eax
  72:	ff 35 08 30 40 00    	push   DWORD PTR ds:0x403008
  78:	b8 46 13 40 00       	mov    eax,0x401346
  7d:	ff d0                	call   eax
  7f:	e8 00 00 00 00       	call   0x84
  84:	58                   	pop    eax
  85:	eb 64                	jmp    0xeb
  87:	20 20                	and    BYTE PTR [eax],ah
  89:	20 20                	and    BYTE PTR [eax],ah
  8b:	20 20                	and    BYTE PTR [eax],ah
  8d:	20 20                	and    BYTE PTR [eax],ah
  8f:	20 20                	and    BYTE PTR [eax],ah
  91:	20 20                	and    BYTE PTR [eax],ah
  93:	20 20                	and    BYTE PTR [eax],ah
  95:	20 20                	and    BYTE PTR [eax],ah
  97:	20 20                	and    BYTE PTR [eax],ah
  99:	20 20                	and    BYTE PTR [eax],ah
  9b:	20 20                	and    BYTE PTR [eax],ah
  9d:	20 20                	and    BYTE PTR [eax],ah
  9f:	20 20                	and    BYTE PTR [eax],ah
  a1:	20 20                	and    BYTE PTR [eax],ah
  a3:	20 20                	and    BYTE PTR [eax],ah
  a5:	20 20                	and    BYTE PTR [eax],ah
  a7:	20 20                	and    BYTE PTR [eax],ah
  a9:	20 20                	and    BYTE PTR [eax],ah
  ab:	20 20                	and    BYTE PTR [eax],ah
  ad:	20 20                	and    BYTE PTR [eax],ah
  af:	20 20                	and    BYTE PTR [eax],ah
  b1:	20 20                	and    BYTE PTR [eax],ah
  b3:	20 20                	and    BYTE PTR [eax],ah
  b5:	20 20                	and    BYTE PTR [eax],ah
  b7:	20 20                	and    BYTE PTR [eax],ah
  b9:	20 20                	and    BYTE PTR [eax],ah
  bb:	20 20                	and    BYTE PTR [eax],ah
  bd:	20 20                	and    BYTE PTR [eax],ah
  bf:	20 20                	and    BYTE PTR [eax],ah
  c1:	20 20                	and    BYTE PTR [eax],ah
  c3:	20 20                	and    BYTE PTR [eax],ah
  c5:	20 20                	and    BYTE PTR [eax],ah
  c7:	20 20                	and    BYTE PTR [eax],ah
  c9:	20 20                	and    BYTE PTR [eax],ah
  cb:	20 20                	and    BYTE PTR [eax],ah
  cd:	20 20                	and    BYTE PTR [eax],ah
  cf:	20 20                	and    BYTE PTR [eax],ah
  d1:	20 20                	and    BYTE PTR [eax],ah
  d3:	20 20                	and    BYTE PTR [eax],ah
  d5:	20 20                	and    BYTE PTR [eax],ah
  d7:	20 20                	and    BYTE PTR [eax],ah
  d9:	20 20                	and    BYTE PTR [eax],ah
  db:	20 20                	and    BYTE PTR [eax],ah
  dd:	20 20                	and    BYTE PTR [eax],ah
  df:	20 20                	and    BYTE PTR [eax],ah
  e1:	20 20                	and    BYTE PTR [eax],ah
  e3:	20 20                	and    BYTE PTR [eax],ah
  e5:	20 20                	and    BYTE PTR [eax],ah
  e7:	20 20                	and    BYTE PTR [eax],ah
  e9:	20 20                	and    BYTE PTR [eax],ah
  eb:	83 c0 03             	add    eax,0x3
  ee:	6a 00                	push   0x0
  f0:	6a 00                	push   0x0
  f2:	6a 64                	push   0x64
  f4:	50                   	push   eax
  f5:	ff 35 08 30 40 00    	push   DWORD PTR ds:0x403008
  fb:	b8 46 13 40 00       	mov    eax,0x401346
 100:	ff d0                	call   eax
 102:	68 88 13 00 00       	push   0x1388
 107:	b8 2e 13 40 00       	mov    eax,0x40132e
 10c:	ff d0                	call   eax
 10e:	c3                   	ret
