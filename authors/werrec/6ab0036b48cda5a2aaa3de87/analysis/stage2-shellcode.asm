
analysis/stage2-shellcode.dec.bin:     file format binary


Disassembly of section .data:

0000000000000000 <.data>:
   0:	push   r13
   2:	mov    r8d,0x1
   8:	mov    r11b,0xa5
   b:	push   r12
   d:	push   rbp
   e:	push   rdi
   f:	push   rsi
  10:	push   rbx
  11:	sub    rsp,0x28
  15:	lea    r9,[rsp+0x10]
  1a:	mov    eax,r8d
  1d:	mov    r10b,BYTE PTR [rcx+r8*1-0x1]
  22:	imul   eax,r11d
  26:	xor    r10d,edx
  29:	xor    r10d,eax
  2c:	mov    BYTE PTR [rsp+r8*1+0xf],r10b
  31:	inc    r8
  34:	cmp    r8,0x11
  38:	jne    0x1a
  3a:	mov    r8,r9
  3d:	mov    rax,r9
  40:	mov    bpl,BYTE PTR [rax]
  43:	mov    bl,BYTE PTR [rax+0x1]
  46:	add    rax,0x4
  4a:	mov    dl,BYTE PTR [rax-0x2]
  4d:	mov    r10b,BYTE PTR [rax-0x1]
  51:	mov    r11d,ebp
  54:	lea    edi,[rbp+rbp*1+0x0]
  58:	lea    r12d,[rbx+rbx*1]
  5c:	mov    esi,ebp
  5e:	sar    r11b,0x7
  62:	xor    esi,edx
  64:	lea    r13d,[rdx+rdx*1]
  68:	and    r11d,0x1b
  6c:	xor    esi,r10d
  6f:	xor    edi,r11d
  72:	mov    r11d,ebx
  75:	sar    r11b,0x7
  79:	and    r11d,0x1b
  7d:	xor    r12d,r11d
  80:	mov    r11d,ebx
  83:	xor    ebx,ebp
  85:	mov    ebp,r10d
  88:	xor    r11d,edx
  8b:	xor    esi,r12d
  8e:	xor    ebp,ebx
  90:	xor    r11d,r10d
  93:	xor    r11d,edi
  96:	xor    r11d,r12d
  99:	mov    BYTE PTR [rax-0x4],r11b
  9d:	mov    r11d,edx
  a0:	xor    edx,ebx
  a2:	sar    r11b,0x7
  a6:	xor    edx,edi
  a8:	lea    rdi,[rsp+0x20]
  ad:	and    r11d,0x1b
  b1:	xor    r11d,r13d
  b4:	xor    esi,r11d
  b7:	xor    r11d,ebp
  ba:	mov    BYTE PTR [rax-0x3],sil
  be:	lea    esi,[r10+r10*1]
  c2:	sar    r10b,0x7
  c6:	and    r10d,0x1b
  ca:	xor    r10d,esi
  cd:	xor    r11d,r10d
  d0:	xor    edx,r10d
  d3:	mov    BYTE PTR [rax-0x2],r11b
  d7:	mov    BYTE PTR [rax-0x1],dl
  da:	cmp    rdi,rax
  dd:	jne    0x40
  e3:	movabs rax,0xe7000000aa
  ed:	xor    r11d,r11d
  f0:	mov    r10d,0xfb
  f6:	mov    QWORD PTR [rsp],rax
  fa:	movabs rax,0x6d00000003
 104:	mov    QWORD PTR [rsp+0x8],rax
 109:	movzx  eax,BYTE PTR [r8]
 10d:	movzx  edx,BYTE PTR [r8+0x4]
 112:	imul   eax,eax,0x1f
 115:	imul   edx,edx,0x11
 118:	add    eax,edx
 11a:	movzx  edx,BYTE PTR [r8+0xc]
 11f:	add    eax,edx
 121:	movzx  edx,BYTE PTR [r8+0x8]
 126:	imul   edx,edx,0xd
 129:	add    eax,edx
 12b:	xor    edx,edx
 12d:	div    r10d
 130:	cmp    edx,DWORD PTR [rsp+r11*4]
 134:	jne    0x18f
 136:	inc    r11
 139:	inc    r8
 13c:	cmp    r11,0x4
 140:	jne    0x109
 142:	movzx  edx,BYTE PTR [rsp+0x15]
 147:	movzx  eax,BYTE PTR [rsp+0x10]
 14c:	movzx  r8d,BYTE PTR [rsp+0x1f]
 152:	imul   eax,edx
 155:	movzx  edx,BYTE PTR [rsp+0x1a]
 15a:	imul   edx,r8d
 15e:	movzx  r8d,BYTE PTR [rsp+0x1c]
 164:	add    eax,edx
 166:	movzx  edx,BYTE PTR [rsp+0x13]
 16b:	imul   edx,r8d
 16f:	add    eax,edx
 171:	xor    edx,edx
 173:	div    r10d
 176:	cmp    edx,0x6
 179:	jne    0x18f
 17b:	mov    al,BYTE PTR [rsp+0x11]
 17f:	xor    al,BYTE PTR [rsp+0x16]
 183:	xor    al,BYTE PTR [rsp+0x1b]
 187:	xor    al,BYTE PTR [rsp+0x1e]
 18b:	cmp    al,0x80
 18d:	je     0x196
 18f:	xor    eax,eax
 191:	jmp    0x27e
 196:	xor    edx,edx
 198:	xor    eax,eax
 19a:	lea    r10,[rip+0xff]        # 0x2a0
 1a1:	movzx  r8d,BYTE PTR [r9+rdx*1]
 1a6:	imul   eax,eax,0x83
 1ac:	inc    rdx
 1af:	movzx  r8d,BYTE PTR [r10+r8*1]
 1b4:	add    eax,r8d
 1b7:	movzx  eax,ax
 1ba:	cmp    rdx,0x10
 1be:	jne    0x1a1
 1c0:	cmp    eax,0x5521
 1c5:	jne    0x18f
 1c7:	xor    edx,edx
 1c9:	mov    r8d,0x811c9dc5
 1cf:	mov    al,BYTE PTR [r9+rdx*1]
 1d3:	add    al,BYTE PTR [rcx+rdx*1]
 1d6:	inc    rdx
 1d9:	movzx  eax,al
 1dc:	xor    eax,r8d
 1df:	imul   r8d,eax,0x1000193
 1e6:	cmp    rdx,0x10
 1ea:	jne    0x1cf
 1ec:	cmp    eax,0x256ae47
 1f1:	jne    0x18f
 1f3:	movzx  eax,BYTE PTR [rcx+0xc]
 1f7:	movzx  edx,BYTE PTR [rcx+0xd]
 1fb:	imul   eax,eax,0x1f
 1fe:	imul   edx,edx,0x11
 201:	add    eax,edx
 203:	movzx  edx,WORD PTR [rcx+0xe]
 207:	xor    eax,edx
 209:	cmp    eax,0x74b7
 20e:	jne    0x18f
 214:	mov    edx,0x8
 219:	xor    eax,eax
 21b:	imul   eax,eax,0xa7
 221:	mov    r8b,BYTE PTR [rcx+rdx*1]
 225:	xor    r8b,BYTE PTR [rsp+rdx*1+0x8]
 22a:	inc    rdx
 22d:	movzx  r8d,r8b
 231:	add    eax,r8d
 234:	cmp    rdx,0x10
 238:	jne    0x21b
 23a:	cmp    eax,0x7b41e7a6
 23f:	jne    0x18f
 245:	xor    r8d,r8d
 248:	xor    eax,eax
 24a:	rol    eax,0x5
 24d:	movzx  r10d,BYTE PTR [r9+r8*1]
 252:	mov    edx,eax
 254:	mov    rax,r8
 257:	inc    r8
 25a:	neg    rax
 25d:	mov    al,BYTE PTR [rcx+rax*1+0xf]
 261:	or     eax,0x1
 264:	movzx  eax,al
 267:	imul   eax,r10d
 26b:	xor    eax,edx
 26d:	cmp    r8,0x10
 271:	jne    0x24a
 273:	cmp    eax,0x82945478
 278:	sete   al
 27b:	movzx  eax,al
 27e:	add    rsp,0x28
 282:	pop    rbx
 283:	pop    rsi
 284:	pop    rdi
 285:	pop    rbp
 286:	pop    r12
 288:	pop    r13
 28a:	ret
 28b:	nop
 28c:	nop
 28d:	nop
 28e:	nop
 28f:	nop
 290:	nop
 291:	nop
 292:	nop
 293:	nop
 294:	nop
 295:	nop
 296:	nop
 297:	nop
 298:	nop
 299:	nop
 29a:	nop
 29b:	nop
 29c:	nop
 29d:	nop
 29e:	nop
 29f:	nop
 2a0:	movsxd edi,DWORD PTR [rdi+rsi*2+0x7b]
 2a4:	repnz imul ebp,DWORD PTR [rdi-0x3b],0x30
 2a9:	add    DWORD PTR [rdi+0x2b],esp
 2ac:	(bad)
 2ad:	xlat   BYTE PTR ds:[rbx]
 2ae:	stos   DWORD PTR es:[rdi],eax
 2af:	jbe    0x27b
 2b1:	(bad)
 2b2:	leave
 2b3:	jge    0x2af
 2b5:	pop    rcx
 2b6:	rex.RXB
 2b7:	lock lods eax,DWORD PTR ds:[rsi]
 2b9:	(bad)
 2ba:	movabs ds:0x93fdb7c072a49caf,al
 2c3:	es ss (bad)
 2c6:	test   esp,0xf1e5a534
 2cc:	jno    0x2a6
 2ce:	xor    DWORD PTR [rip+0xffffffffc323c704],edx        # 0xffffffffc323c9d8
 2d4:	sbb    BYTE PTR [rsi+0x12079a05],dl
 2da:	and    dl,0xeb
 2dd:	(bad)
 2de:	mov    dl,0x75
 2e0:	or     DWORD PTR [rbx+0x6e1b1a2c],eax
 2e6:	pop    rdx
 2e7:	movabs al,ds:0x842fe329b3d63b52
 2f0:	push   rbx
 2f1:	rol    DWORD PTR [rax],1
 2f3:	in     eax,dx
 2f4:	and    ah,bh
 2f6:	mov    cl,0x5b
 2f8:	push   0xffffffffffffffcb
 2fa:	mov    esi,0x584c4a39
 2ff:	iret
 300:	shr    bh,1
 302:	stos   BYTE PTR es:[rdi],al
 303:	sti
 304:	rex.XB
 305:	xor    r8,QWORD PTR [r13+0x7f02f945]
 30c:	push   rax
 30d:	cmp    al,0x9f
 30f:	test   al,0x51
 311:	movabs ds:0xb6bcf5389d928f40,eax
 31a:	fisub  DWORD PTR [rcx]
 31c:	adc    bh,bh
 31e:	repz ror ch,cl
 321:	or     al,0x13
 323:	in     al,dx
 324:	pop    rdi
 325:	xchg   edi,eax
 326:	rex.R (bad)
 328:	(bad)
 32c:	fs pop rbp
 32e:	sbb    DWORD PTR [rbx+0x60],esi
 331:	or     DWORD PTR [rdi-0x24],0x88902a22
 338:	rex.RX out dx,al
 33a:	mov    eax,0xb5ede14
 33f:	fneni(8087 only)
 341:	xor    bh,BYTE PTR [rdx]
 343:	or     cl,BYTE PTR [rcx+0x6]
 346:	and    al,0x5c
 348:	ret    0xacd3
 34b:	(bad)
 350:	out    0xc8,eax
 352:	(bad)
 353:	ins    DWORD PTR es:[rdi],dx
 354:	lea    edx,(bad)
 355:	(bad)
 358:	ins    BYTE PTR es:[rdi],dx
 359:	push   rsi
 35a:	hlt
 35b:	(bad)
 35c:	gs jp  0x30d
 35f:	or     BYTE PTR [rdx+0x1c2e2578],bh
 365:	cmps   BYTE PTR ds:[rsi],BYTE PTR es:[rdi]
 366:	mov    ah,0xc6
 368:	call   0x4b1f784a
 36d:	mov    ebp,0x3e708a8b
 372:	mov    ch,0x66
 374:	add    rsi,rsi
 377:	(bad)
 378:	(bad)
 379:	xor    eax,0xc186b957
 37e:	sbb    eax,0x98f8e19e
 383:	adc    DWORD PTR [rcx-0x27],ebp
 386:	mov    ss,WORD PTR [rbx+rbx*4-0x311678e2]
 38d:	push   rbp
 38e:	sub    bh,bl
 390:	mov    WORD PTR [rcx-0x1940f277],fs
 396:	rex.X push 0xf2d9941
 39c:	mov    al,0x54
 39e:	.byte 0xbb
 39f:	(bad)
