
RSAme_v3.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <.text>:
   140001000:	48 8d 05 69 de 00 00 	lea    rax,[rip+0xde69]        # 0x14000ee70
   140001007:	c3                   	ret
   140001008:	cc                   	int3
   140001009:	cc                   	int3
   14000100a:	cc                   	int3
   14000100b:	cc                   	int3
   14000100c:	cc                   	int3
   14000100d:	cc                   	int3
   14000100e:	cc                   	int3
   14000100f:	cc                   	int3
   140001010:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   140001015:	4c 89 44 24 18       	mov    QWORD PTR [rsp+0x18],r8
   14000101a:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   14000101f:	53                   	push   rbx
   140001020:	56                   	push   rsi
   140001021:	57                   	push   rdi
   140001022:	48 83 ec 30          	sub    rsp,0x30
   140001026:	48 8b da             	mov    rbx,rdx
   140001029:	48 8d 74 24 60       	lea    rsi,[rsp+0x60]
   14000102e:	48 8b f9             	mov    rdi,rcx
   140001031:	e8 ca ff ff ff       	call   0x140001000
   140001036:	4c 8b cb             	mov    r9,rbx
   140001039:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
   14000103e:	48 c7 c3 ff ff ff ff 	mov    rbx,0xffffffffffffffff
   140001045:	48 c7 44 24 20 00 00 	mov    QWORD PTR [rsp+0x20],0x0
   14000104c:	00 00 
   14000104e:	4c 8b c3             	mov    r8,rbx
   140001051:	48 8b d7             	mov    rdx,rdi
   140001054:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140001057:	48 83 c9 01          	or     rcx,0x1
   14000105b:	ff 15 f7 91 00 00    	call   QWORD PTR [rip+0x91f7]        # 0x14000a258
   140001061:	85 c0                	test   eax,eax
   140001063:	0f 48 c3             	cmovs  eax,ebx
   140001066:	48 83 c4 30          	add    rsp,0x30
   14000106a:	5f                   	pop    rdi
   14000106b:	5e                   	pop    rsi
   14000106c:	5b                   	pop    rbx
   14000106d:	c3                   	ret
   14000106e:	cc                   	int3
   14000106f:	cc                   	int3
   140001070:	40 53                	rex push rbx
   140001072:	48 83 ec 20          	sub    rsp,0x20
   140001076:	48 8b d9             	mov    rbx,rcx
   140001079:	48 8b c2             	mov    rax,rdx
   14000107c:	48 8d 0d bd a3 00 00 	lea    rcx,[rip+0xa3bd]        # 0x14000b440
   140001083:	0f 57 c0             	xorps  xmm0,xmm0
   140001086:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   14000108a:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   14000108d:	48 8d 48 08          	lea    rcx,[rax+0x8]
   140001091:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   140001094:	ff 15 96 90 00 00    	call   QWORD PTR [rip+0x9096]        # 0x14000a130
   14000109a:	48 8b c3             	mov    rax,rbx
   14000109d:	48 83 c4 20          	add    rsp,0x20
   1400010a1:	5b                   	pop    rbx
   1400010a2:	c3                   	ret
   1400010a3:	cc                   	int3
   1400010a4:	cc                   	int3
   1400010a5:	cc                   	int3
   1400010a6:	cc                   	int3
   1400010a7:	cc                   	int3
   1400010a8:	cc                   	int3
   1400010a9:	cc                   	int3
   1400010aa:	cc                   	int3
   1400010ab:	cc                   	int3
   1400010ac:	cc                   	int3
   1400010ad:	cc                   	int3
   1400010ae:	cc                   	int3
   1400010af:	cc                   	int3
   1400010b0:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   1400010b4:	48 8d 05 e5 a3 00 00 	lea    rax,[rip+0xa3e5]        # 0x14000b4a0
   1400010bb:	48 85 d2             	test   rdx,rdx
   1400010be:	48 0f 45 c2          	cmovne rax,rdx
   1400010c2:	c3                   	ret
   1400010c3:	cc                   	int3
   1400010c4:	cc                   	int3
   1400010c5:	cc                   	int3
   1400010c6:	cc                   	int3
   1400010c7:	cc                   	int3
   1400010c8:	cc                   	int3
   1400010c9:	cc                   	int3
   1400010ca:	cc                   	int3
   1400010cb:	cc                   	int3
   1400010cc:	cc                   	int3
   1400010cd:	cc                   	int3
   1400010ce:	cc                   	int3
   1400010cf:	cc                   	int3
   1400010d0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400010d5:	57                   	push   rdi
   1400010d6:	48 83 ec 20          	sub    rsp,0x20
   1400010da:	48 8d 05 5f a3 00 00 	lea    rax,[rip+0xa35f]        # 0x14000b440
   1400010e1:	48 8b f9             	mov    rdi,rcx
   1400010e4:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400010e7:	8b da                	mov    ebx,edx
   1400010e9:	48 83 c1 08          	add    rcx,0x8
   1400010ed:	ff 15 4d 90 00 00    	call   QWORD PTR [rip+0x904d]        # 0x14000a140
   1400010f3:	f6 c3 01             	test   bl,0x1
   1400010f6:	74 0d                	je     0x140001105
   1400010f8:	ba 18 00 00 00       	mov    edx,0x18
   1400010fd:	48 8b cf             	mov    rcx,rdi
   140001100:	e8 d3 79 00 00       	call   0x140008ad8
   140001105:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000110a:	48 8b c7             	mov    rax,rdi
   14000110d:	48 83 c4 20          	add    rsp,0x20
   140001111:	5f                   	pop    rdi
   140001112:	c3                   	ret
   140001113:	cc                   	int3
   140001114:	cc                   	int3
   140001115:	cc                   	int3
   140001116:	cc                   	int3
   140001117:	cc                   	int3
   140001118:	cc                   	int3
   140001119:	cc                   	int3
   14000111a:	cc                   	int3
   14000111b:	cc                   	int3
   14000111c:	cc                   	int3
   14000111d:	cc                   	int3
   14000111e:	cc                   	int3
   14000111f:	cc                   	int3
   140001120:	48 8d 05 19 a3 00 00 	lea    rax,[rip+0xa319]        # 0x14000b440
   140001127:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000112a:	48 83 c1 08          	add    rcx,0x8
   14000112e:	48 ff 25 0b 90 00 00 	rex.W jmp QWORD PTR [rip+0x900b]        # 0x14000a140
   140001135:	cc                   	int3
   140001136:	cc                   	int3
   140001137:	cc                   	int3
   140001138:	cc                   	int3
   140001139:	cc                   	int3
   14000113a:	cc                   	int3
   14000113b:	cc                   	int3
   14000113c:	cc                   	int3
   14000113d:	cc                   	int3
   14000113e:	cc                   	int3
   14000113f:	cc                   	int3
   140001140:	48 8d 05 71 a3 00 00 	lea    rax,[rip+0xa371]        # 0x14000b4b8
   140001147:	48 c7 41 10 00 00 00 	mov    QWORD PTR [rcx+0x10],0x0
   14000114e:	00 
   14000114f:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   140001153:	48 8d 05 26 a3 00 00 	lea    rax,[rip+0xa326]        # 0x14000b480
   14000115a:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000115d:	48 8b c1             	mov    rax,rcx
   140001160:	c3                   	ret
   140001161:	cc                   	int3
   140001162:	cc                   	int3
   140001163:	cc                   	int3
   140001164:	cc                   	int3
   140001165:	cc                   	int3
   140001166:	cc                   	int3
   140001167:	cc                   	int3
   140001168:	cc                   	int3
   140001169:	cc                   	int3
   14000116a:	cc                   	int3
   14000116b:	cc                   	int3
   14000116c:	cc                   	int3
   14000116d:	cc                   	int3
   14000116e:	cc                   	int3
   14000116f:	cc                   	int3
   140001170:	48 83 ec 48          	sub    rsp,0x48
   140001174:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140001179:	e8 c2 ff ff ff       	call   0x140001140
   14000117e:	48 8d 15 fb b7 00 00 	lea    rdx,[rip+0xb7fb]        # 0x14000c980
   140001185:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   14000118a:	e8 89 84 00 00       	call   0x140009618
   14000118f:	cc                   	int3
   140001190:	40 53                	rex push rbx
   140001192:	48 83 ec 20          	sub    rsp,0x20
   140001196:	48 8b d9             	mov    rbx,rcx
   140001199:	48 8b c2             	mov    rax,rdx
   14000119c:	48 8d 0d 9d a2 00 00 	lea    rcx,[rip+0xa29d]        # 0x14000b440
   1400011a3:	0f 57 c0             	xorps  xmm0,xmm0
   1400011a6:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   1400011aa:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   1400011ad:	48 8d 48 08          	lea    rcx,[rax+0x8]
   1400011b1:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   1400011b4:	ff 15 76 8f 00 00    	call   QWORD PTR [rip+0x8f76]        # 0x14000a130
   1400011ba:	48 8d 05 bf a2 00 00 	lea    rax,[rip+0xa2bf]        # 0x14000b480
   1400011c1:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400011c4:	48 8b c3             	mov    rax,rbx
   1400011c7:	48 83 c4 20          	add    rsp,0x20
   1400011cb:	5b                   	pop    rbx
   1400011cc:	c3                   	ret
   1400011cd:	cc                   	int3
   1400011ce:	cc                   	int3
   1400011cf:	cc                   	int3
   1400011d0:	40 53                	rex push rbx
   1400011d2:	48 83 ec 20          	sub    rsp,0x20
   1400011d6:	48 8b d9             	mov    rbx,rcx
   1400011d9:	48 8b c2             	mov    rax,rdx
   1400011dc:	48 8d 0d 5d a2 00 00 	lea    rcx,[rip+0xa25d]        # 0x14000b440
   1400011e3:	0f 57 c0             	xorps  xmm0,xmm0
   1400011e6:	48 8d 53 08          	lea    rdx,[rbx+0x8]
   1400011ea:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   1400011ed:	48 8d 48 08          	lea    rcx,[rax+0x8]
   1400011f1:	0f 11 02             	movups XMMWORD PTR [rdx],xmm0
   1400011f4:	ff 15 36 8f 00 00    	call   QWORD PTR [rip+0x8f36]        # 0x14000a130
   1400011fa:	48 8d 05 57 a2 00 00 	lea    rax,[rip+0xa257]        # 0x14000b458
   140001201:	48 89 03             	mov    QWORD PTR [rbx],rax
   140001204:	48 8b c3             	mov    rax,rbx
   140001207:	48 83 c4 20          	add    rsp,0x20
   14000120b:	5b                   	pop    rbx
   14000120c:	c3                   	ret
   14000120d:	cc                   	int3
   14000120e:	cc                   	int3
   14000120f:	cc                   	int3
   140001210:	48 83 ec 28          	sub    rsp,0x28
   140001214:	48 8d 0d b5 a2 00 00 	lea    rcx,[rip+0xa2b5]        # 0x14000b4d0
   14000121b:	ff 15 bf 8e 00 00    	call   QWORD PTR [rip+0x8ebf]        # 0x14000a0e0
   140001221:	cc                   	int3
   140001222:	cc                   	int3
   140001223:	cc                   	int3
   140001224:	cc                   	int3
   140001225:	cc                   	int3
   140001226:	cc                   	int3
   140001227:	cc                   	int3
   140001228:	cc                   	int3
   140001229:	cc                   	int3
   14000122a:	cc                   	int3
   14000122b:	cc                   	int3
   14000122c:	cc                   	int3
   14000122d:	cc                   	int3
   14000122e:	cc                   	int3
   14000122f:	cc                   	int3
   140001230:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140001235:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   14000123a:	48 89 7c 24 18       	mov    QWORD PTR [rsp+0x18],rdi
   14000123f:	55                   	push   rbp
   140001240:	41 54                	push   r12
   140001242:	41 55                	push   r13
   140001244:	41 56                	push   r14
   140001246:	41 57                	push   r15
   140001248:	48 8d ac 24 c0 fd ff 	lea    rbp,[rsp-0x240]
   14000124f:	ff 
   140001250:	48 81 ec 40 03 00 00 	sub    rsp,0x340
   140001257:	48 8b 05 42 d5 00 00 	mov    rax,QWORD PTR [rip+0xd542]        # 0x14000e7a0
   14000125e:	48 33 c4             	xor    rax,rsp
   140001261:	48 89 85 30 02 00 00 	mov    QWORD PTR [rbp+0x230],rax
   140001268:	41 be 10 00 00 00    	mov    r14d,0x10
   14000126e:	41 8b d6             	mov    edx,r14d
   140001271:	b9 f4 01 00 00       	mov    ecx,0x1f4
   140001276:	e8 c5 17 00 00       	call   0x140002a40
   14000127b:	48 8b d8             	mov    rbx,rax
   14000127e:	33 c9                	xor    ecx,ecx
   140001280:	e8 2b 27 00 00       	call   0x1400039b0
   140001285:	48 8b f8             	mov    rdi,rax
   140001288:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   14000128d:	33 c9                	xor    ecx,ecx
   14000128f:	e8 1c 27 00 00       	call   0x1400039b0
   140001294:	48 8b f0             	mov    rsi,rax
   140001297:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   14000129c:	33 c9                	xor    ecx,ecx
   14000129e:	e8 0d 27 00 00       	call   0x1400039b0
   1400012a3:	4c 8b e0             	mov    r12,rax
   1400012a6:	33 c9                	xor    ecx,ecx
   1400012a8:	e8 03 27 00 00       	call   0x1400039b0
   1400012ad:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400012b2:	44 89 b3 dc 02 00 00 	mov    DWORD PTR [rbx+0x2dc],r14d
   1400012b9:	0f 10 05 20 a2 00 00 	movups xmm0,XMMWORD PTR [rip+0xa220]        # 0x14000b4e0
   1400012c0:	0f 11 45 d8          	movups XMMWORD PTR [rbp-0x28],xmm0
   1400012c4:	0f 10 0d 25 a2 00 00 	movups xmm1,XMMWORD PTR [rip+0xa225]        # 0x14000b4f0
   1400012cb:	0f 11 4d e8          	movups XMMWORD PTR [rbp-0x18],xmm1
   1400012cf:	0f b6 0d 2a a2 00 00 	movzx  ecx,BYTE PTR [rip+0xa22a]        # 0x14000b500
   1400012d6:	88 4d f8             	mov    BYTE PTR [rbp-0x8],cl
   1400012d9:	8b 0d 25 a2 00 00    	mov    ecx,DWORD PTR [rip+0xa225]        # 0x14000b504
   1400012df:	89 4d c0             	mov    DWORD PTR [rbp-0x40],ecx
   1400012e2:	0f b7 0d 1f a2 00 00 	movzx  ecx,WORD PTR [rip+0xa21f]        # 0x14000b508
   1400012e9:	66 89 4d c4          	mov    WORD PTR [rbp-0x3c],cx
   1400012ed:	48 8d 55 d8          	lea    rdx,[rbp-0x28]
   1400012f1:	48 8b cf             	mov    rcx,rdi
   1400012f4:	e8 87 35 00 00       	call   0x140004880
   1400012f9:	48 8d 55 c0          	lea    rdx,[rbp-0x40]
   1400012fd:	48 8b ce             	mov    rcx,rsi
   140001300:	e8 7b 35 00 00       	call   0x140004880
   140001305:	48 8d 15 00 a2 00 00 	lea    rdx,[rip+0xa200]        # 0x14000b50c
   14000130c:	48 8b 0d 8d 8d 00 00 	mov    rcx,QWORD PTR [rip+0x8d8d]        # 0x14000a0a0
   140001313:	e8 a8 03 00 00       	call   0x1400016c0
   140001318:	33 c0                	xor    eax,eax
   14000131a:	48 89 45 a0          	mov    QWORD PTR [rbp-0x60],rax
   14000131e:	48 89 45 b0          	mov    QWORD PTR [rbp-0x50],rax
   140001322:	48 c7 45 b8 0f 00 00 	mov    QWORD PTR [rbp-0x48],0xf
   140001329:	00 
   14000132a:	88 45 a0             	mov    BYTE PTR [rbp-0x60],al
   14000132d:	48 8b 1d b4 8d 00 00 	mov    rbx,QWORD PTR [rip+0x8db4]        # 0x14000a0e8
   140001334:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140001337:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000133b:	48 03 cb             	add    rcx,rbx
   14000133e:	b2 0a                	mov    dl,0xa
   140001340:	ff 15 3a 8d 00 00    	call   QWORD PTR [rip+0x8d3a]        # 0x14000a080
   140001346:	44 0f b6 c0          	movzx  r8d,al
   14000134a:	48 8d 55 a0          	lea    rdx,[rbp-0x60]
   14000134e:	48 8b cb             	mov    rcx,rbx
   140001351:	e8 9a 06 00 00       	call   0x1400019f0
   140001356:	c7 44 24 40 01 23 45 	mov    DWORD PTR [rsp+0x40],0x67452301
   14000135d:	67 
   14000135e:	c7 44 24 44 89 ab cd 	mov    DWORD PTR [rsp+0x44],0xefcdab89
   140001365:	ef 
   140001366:	c7 44 24 48 fe dc ba 	mov    DWORD PTR [rsp+0x48],0x98badcfe
   14000136d:	98 
   14000136e:	c7 44 24 4c 76 54 32 	mov    DWORD PTR [rsp+0x4c],0x10325476
   140001375:	10 
   140001376:	48 8d 5d a0          	lea    rbx,[rbp-0x60]
   14000137a:	4c 8b 7d a0          	mov    r15,QWORD PTR [rbp-0x60]
   14000137e:	4c 8b 6d b8          	mov    r13,QWORD PTR [rbp-0x48]
   140001382:	4d 3b ee             	cmp    r13,r14
   140001385:	49 0f 43 df          	cmovae rbx,r15
   140001389:	8b 75 b0             	mov    esi,DWORD PTR [rbp-0x50]
   14000138c:	8d 04 f5 00 00 00 00 	lea    eax,[rsi*8+0x0]
   140001393:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   140001397:	8b c6                	mov    eax,esi
   140001399:	c1 e8 1d             	shr    eax,0x1d
   14000139c:	89 44 24 54          	mov    DWORD PTR [rsp+0x54],eax
   1400013a0:	83 fe 40             	cmp    esi,0x40
   1400013a3:	72 49                	jb     0x1400013ee
   1400013a5:	8b fe                	mov    edi,esi
   1400013a7:	48 c1 ef 06          	shr    rdi,0x6
   1400013ab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   1400013b0:	0f 10 03             	movups xmm0,XMMWORD PTR [rbx]
   1400013b3:	0f 11 44 24 58       	movups XMMWORD PTR [rsp+0x58],xmm0
   1400013b8:	0f 10 4b 10          	movups xmm1,XMMWORD PTR [rbx+0x10]
   1400013bc:	0f 11 4c 24 68       	movups XMMWORD PTR [rsp+0x68],xmm1
   1400013c1:	0f 10 43 20          	movups xmm0,XMMWORD PTR [rbx+0x20]
   1400013c5:	0f 11 44 24 78       	movups XMMWORD PTR [rsp+0x78],xmm0
   1400013ca:	0f 10 4b 30          	movups xmm1,XMMWORD PTR [rbx+0x30]
   1400013ce:	0f 11 4d 88          	movups XMMWORD PTR [rbp-0x78],xmm1
   1400013d2:	48 8d 54 24 58       	lea    rdx,[rsp+0x58]
   1400013d7:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   1400013dc:	e8 af 07 00 00       	call   0x140001b90
   1400013e1:	48 83 c3 40          	add    rbx,0x40
   1400013e5:	83 c6 c0             	add    esi,0xffffffc0
   1400013e8:	48 83 ef 01          	sub    rdi,0x1
   1400013ec:	75 c2                	jne    0x1400013b0
   1400013ee:	44 8b c6             	mov    r8d,esi
   1400013f1:	48 8b d3             	mov    rdx,rbx
   1400013f4:	48 8d 4c 24 58       	lea    rcx,[rsp+0x58]
   1400013f9:	e8 61 83 00 00       	call   0x14000975f
   1400013fe:	8b 54 24 50          	mov    edx,DWORD PTR [rsp+0x50]
   140001402:	c1 ea 03             	shr    edx,0x3
   140001405:	83 e2 3f             	and    edx,0x3f
   140001408:	8b c2                	mov    eax,edx
   14000140a:	48 8d 4c 24 58       	lea    rcx,[rsp+0x58]
   14000140f:	48 03 c8             	add    rcx,rax
   140001412:	c6 01 80             	mov    BYTE PTR [rcx],0x80
   140001415:	48 ff c1             	inc    rcx
   140001418:	b8 3f 00 00 00       	mov    eax,0x3f
   14000141d:	2b c2                	sub    eax,edx
   14000141f:	33 d2                	xor    edx,edx
   140001421:	83 f8 08             	cmp    eax,0x8
   140001424:	73 31                	jae    0x140001457
   140001426:	44 8b c0             	mov    r8d,eax
   140001429:	e8 de 81 00 00       	call   0x14000960c
   14000142e:	48 8d 54 24 58       	lea    rdx,[rsp+0x58]
   140001433:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   140001438:	e8 53 07 00 00       	call   0x140001b90
   14000143d:	0f 57 c0             	xorps  xmm0,xmm0
   140001440:	33 c0                	xor    eax,eax
   140001442:	0f 11 44 24 58       	movups XMMWORD PTR [rsp+0x58],xmm0
   140001447:	0f 11 44 24 68       	movups XMMWORD PTR [rsp+0x68],xmm0
   14000144c:	0f 11 44 24 78       	movups XMMWORD PTR [rsp+0x78],xmm0
   140001451:	48 89 45 88          	mov    QWORD PTR [rbp-0x78],rax
   140001455:	eb 0b                	jmp    0x140001462
   140001457:	83 c0 f8             	add    eax,0xfffffff8
   14000145a:	44 8b c0             	mov    r8d,eax
   14000145d:	e8 aa 81 00 00       	call   0x14000960c
   140001462:	8b 44 24 50          	mov    eax,DWORD PTR [rsp+0x50]
   140001466:	89 45 90             	mov    DWORD PTR [rbp-0x70],eax
   140001469:	8b 44 24 54          	mov    eax,DWORD PTR [rsp+0x54]
   14000146d:	89 45 94             	mov    DWORD PTR [rbp-0x6c],eax
   140001470:	48 8d 54 24 58       	lea    rdx,[rsp+0x58]
   140001475:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   14000147a:	e8 11 07 00 00       	call   0x140001b90
   14000147f:	0f 28 44 24 40       	movaps xmm0,XMMWORD PTR [rsp+0x40]
   140001484:	0f 11 45 c8          	movups XMMWORD PTR [rbp-0x38],xmm0
   140001488:	33 c0                	xor    eax,eax
   14000148a:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   14000148f:	48 8d 5d c8          	lea    rbx,[rbp-0x38]
   140001493:	48 8d 7d 00          	lea    rdi,[rbp+0x0]
   140001497:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000149e:	00 00 
   1400014a0:	44 0f b6 03          	movzx  r8d,BYTE PTR [rbx]
   1400014a4:	48 8d 15 69 a0 00 00 	lea    rdx,[rip+0xa069]        # 0x14000b514
   1400014ab:	48 8b cf             	mov    rcx,rdi
   1400014ae:	e8 5d fb ff ff       	call   0x140001010
   1400014b3:	48 83 c7 02          	add    rdi,0x2
   1400014b7:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
   1400014bb:	49 83 ee 01          	sub    r14,0x1
   1400014bf:	75 df                	jne    0x1400014a0
   1400014c1:	44 88 75 20          	mov    BYTE PTR [rbp+0x20],r14b
   1400014c5:	48 8d 55 00          	lea    rdx,[rbp+0x0]
   1400014c9:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   1400014ce:	e8 ad 33 00 00       	call   0x140004880
   1400014d3:	48 8d 15 46 a0 00 00 	lea    rdx,[rip+0xa046]        # 0x14000b520
   1400014da:	48 8b 0d bf 8b 00 00 	mov    rcx,QWORD PTR [rip+0x8bbf]        # 0x14000a0a0
   1400014e1:	e8 da 01 00 00       	call   0x1400016c0
   1400014e6:	41 b8 00 02 00 00    	mov    r8d,0x200
   1400014ec:	48 8d 55 30          	lea    rdx,[rbp+0x30]
   1400014f0:	48 8b 0d f1 8b 00 00 	mov    rcx,QWORD PTR [rip+0x8bf1]        # 0x14000a0e8
   1400014f7:	ff 15 8b 8b 00 00    	call   QWORD PTR [rip+0x8b8b]        # 0x14000a088
   1400014fd:	48 8d 55 30          	lea    rdx,[rbp+0x30]
   140001501:	49 8b cc             	mov    rcx,r12
   140001504:	e8 77 33 00 00       	call   0x140004880
   140001509:	4d 8b cc             	mov    r9,r12
   14000150c:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   140001511:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   140001516:	49 8b cc             	mov    rcx,r12
   140001519:	e8 52 3d 00 00       	call   0x140005270
   14000151e:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
   140001523:	49 8b cc             	mov    rcx,r12
   140001526:	e8 a5 29 00 00       	call   0x140003ed0
   14000152b:	48 8b 0d 6e 8b 00 00 	mov    rcx,QWORD PTR [rip+0x8b6e]        # 0x14000a0a0
   140001532:	85 c0                	test   eax,eax
   140001534:	48 8d 15 fd 9f 00 00 	lea    rdx,[rip+0x9ffd]        # 0x14000b538
   14000153b:	74 07                	je     0x140001544
   14000153d:	48 8d 15 0c a0 00 00 	lea    rdx,[rip+0xa00c]        # 0x14000b550
   140001544:	e8 77 01 00 00       	call   0x1400016c0
   140001549:	90                   	nop
   14000154a:	49 83 fd 10          	cmp    r13,0x10
   14000154e:	72 34                	jb     0x140001584
   140001550:	49 8d 55 01          	lea    rdx,[r13+0x1]
   140001554:	49 8b c7             	mov    rax,r15
   140001557:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   14000155e:	72 1c                	jb     0x14000157c
   140001560:	48 83 c2 27          	add    rdx,0x27
   140001564:	4d 8b 7f f8          	mov    r15,QWORD PTR [r15-0x8]
   140001568:	49 2b c7             	sub    rax,r15
   14000156b:	48 83 c0 f8          	add    rax,0xfffffffffffffff8
   14000156f:	48 83 f8 1f          	cmp    rax,0x1f
   140001573:	76 07                	jbe    0x14000157c
   140001575:	ff 15 bd 8c 00 00    	call   QWORD PTR [rip+0x8cbd]        # 0x14000a238
   14000157b:	cc                   	int3
   14000157c:	49 8b cf             	mov    rcx,r15
   14000157f:	e8 54 75 00 00       	call   0x140008ad8
   140001584:	33 c0                	xor    eax,eax
   140001586:	48 8b 8d 30 02 00 00 	mov    rcx,QWORD PTR [rbp+0x230]
   14000158d:	48 33 cc             	xor    rcx,rsp
   140001590:	e8 6b 73 00 00       	call   0x140008900
   140001595:	4c 8d 9c 24 40 03 00 	lea    r11,[rsp+0x340]
   14000159c:	00 
   14000159d:	49 8b 5b 30          	mov    rbx,QWORD PTR [r11+0x30]
   1400015a1:	49 8b 73 38          	mov    rsi,QWORD PTR [r11+0x38]
   1400015a5:	49 8b 7b 40          	mov    rdi,QWORD PTR [r11+0x40]
   1400015a9:	49 8b e3             	mov    rsp,r11
   1400015ac:	41 5f                	pop    r15
   1400015ae:	41 5e                	pop    r14
   1400015b0:	41 5d                	pop    r13
   1400015b2:	41 5c                	pop    r12
   1400015b4:	5d                   	pop    rbp
   1400015b5:	c3                   	ret
   1400015b6:	cc                   	int3
   1400015b7:	cc                   	int3
   1400015b8:	cc                   	int3
   1400015b9:	cc                   	int3
   1400015ba:	cc                   	int3
   1400015bb:	cc                   	int3
   1400015bc:	cc                   	int3
   1400015bd:	cc                   	int3
   1400015be:	cc                   	int3
   1400015bf:	cc                   	int3
   1400015c0:	40 53                	rex push rbx
   1400015c2:	48 83 ec 20          	sub    rsp,0x20
   1400015c6:	48 8b 51 18          	mov    rdx,QWORD PTR [rcx+0x18]
   1400015ca:	48 8b d9             	mov    rbx,rcx
   1400015cd:	48 83 fa 10          	cmp    rdx,0x10
   1400015d1:	72 2c                	jb     0x1400015ff
   1400015d3:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   1400015d6:	48 ff c2             	inc    rdx
   1400015d9:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   1400015e0:	72 18                	jb     0x1400015fa
   1400015e2:	4c 8b 41 f8          	mov    r8,QWORD PTR [rcx-0x8]
   1400015e6:	48 83 c2 27          	add    rdx,0x27
   1400015ea:	49 2b c8             	sub    rcx,r8
   1400015ed:	48 8d 41 f8          	lea    rax,[rcx-0x8]
   1400015f1:	48 83 f8 1f          	cmp    rax,0x1f
   1400015f5:	77 21                	ja     0x140001618
   1400015f7:	49 8b c8             	mov    rcx,r8
   1400015fa:	e8 d9 74 00 00       	call   0x140008ad8
   1400015ff:	48 c7 43 10 00 00 00 	mov    QWORD PTR [rbx+0x10],0x0
   140001606:	00 
   140001607:	48 c7 43 18 0f 00 00 	mov    QWORD PTR [rbx+0x18],0xf
   14000160e:	00 
   14000160f:	c6 03 00             	mov    BYTE PTR [rbx],0x0
   140001612:	48 83 c4 20          	add    rsp,0x20
   140001616:	5b                   	pop    rbx
   140001617:	c3                   	ret
   140001618:	ff 15 1a 8c 00 00    	call   QWORD PTR [rip+0x8c1a]        # 0x14000a238
   14000161e:	cc                   	int3
   14000161f:	cc                   	int3
   140001620:	48 83 ec 28          	sub    rsp,0x28
   140001624:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001627:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14000162a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000162e:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001633:	48 85 c9             	test   rcx,rcx
   140001636:	74 07                	je     0x14000163f
   140001638:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000163b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   14000163e:	90                   	nop
   14000163f:	48 83 c4 28          	add    rsp,0x28
   140001643:	c3                   	ret
   140001644:	cc                   	int3
   140001645:	cc                   	int3
   140001646:	cc                   	int3
   140001647:	cc                   	int3
   140001648:	cc                   	int3
   140001649:	cc                   	int3
   14000164a:	cc                   	int3
   14000164b:	cc                   	int3
   14000164c:	cc                   	int3
   14000164d:	cc                   	int3
   14000164e:	cc                   	int3
   14000164f:	cc                   	int3
   140001650:	48 83 ec 28          	sub    rsp,0x28
   140001654:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001657:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14000165a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000165e:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   140001663:	48 85 c9             	test   rcx,rcx
   140001666:	74 07                	je     0x14000166f
   140001668:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000166b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   14000166e:	90                   	nop
   14000166f:	48 83 c4 28          	add    rsp,0x28
   140001673:	c3                   	ret
   140001674:	cc                   	int3
   140001675:	cc                   	int3
   140001676:	cc                   	int3
   140001677:	cc                   	int3
   140001678:	cc                   	int3
   140001679:	cc                   	int3
   14000167a:	cc                   	int3
   14000167b:	cc                   	int3
   14000167c:	cc                   	int3
   14000167d:	cc                   	int3
   14000167e:	cc                   	int3
   14000167f:	cc                   	int3
   140001680:	40 53                	rex push rbx
   140001682:	48 83 ec 20          	sub    rsp,0x20
   140001686:	48 8b d9             	mov    rbx,rcx
   140001689:	ff 15 61 8a 00 00    	call   QWORD PTR [rip+0x8a61]        # 0x14000a0f0
   14000168f:	84 c0                	test   al,al
   140001691:	75 0a                	jne    0x14000169d
   140001693:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140001696:	ff 15 34 8a 00 00    	call   QWORD PTR [rip+0x8a34]        # 0x14000a0d0
   14000169c:	90                   	nop
   14000169d:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   1400016a0:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   1400016a3:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400016a7:	48 8b 4c 11 48       	mov    rcx,QWORD PTR [rcx+rdx*1+0x48]
   1400016ac:	48 85 c9             	test   rcx,rcx
   1400016af:	74 07                	je     0x1400016b8
   1400016b1:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400016b4:	ff 50 10             	call   QWORD PTR [rax+0x10]
   1400016b7:	90                   	nop
   1400016b8:	48 83 c4 20          	add    rsp,0x20
   1400016bc:	5b                   	pop    rbx
   1400016bd:	c3                   	ret
   1400016be:	cc                   	int3
   1400016bf:	cc                   	int3
   1400016c0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400016c5:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   1400016ca:	56                   	push   rsi
   1400016cb:	57                   	push   rdi
   1400016cc:	41 54                	push   r12
   1400016ce:	41 56                	push   r14
   1400016d0:	41 57                	push   r15
   1400016d2:	48 83 ec 30          	sub    rsp,0x30
   1400016d6:	4c 8b e2             	mov    r12,rdx
   1400016d9:	48 8b f1             	mov    rsi,rcx
   1400016dc:	33 db                	xor    ebx,ebx
   1400016de:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   1400016e2:	49 c7 c6 ff ff ff ff 	mov    r14,0xffffffffffffffff
   1400016e9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400016f0:	49 ff c6             	inc    r14
   1400016f3:	42 38 1c 32          	cmp    BYTE PTR [rdx+r14*1],bl
   1400016f7:	75 f7                	jne    0x1400016f0
   1400016f9:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400016fc:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001700:	48 8b 7c 31 28       	mov    rdi,QWORD PTR [rcx+rsi*1+0x28]
   140001705:	48 85 ff             	test   rdi,rdi
   140001708:	7e 0a                	jle    0x140001714
   14000170a:	49 3b fe             	cmp    rdi,r14
   14000170d:	7e 05                	jle    0x140001714
   14000170f:	49 2b fe             	sub    rdi,r14
   140001712:	eb 02                	jmp    0x140001716
   140001714:	33 ff                	xor    edi,edi
   140001716:	4c 8b fe             	mov    r15,rsi
   140001719:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000171e:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001723:	48 85 c9             	test   rcx,rcx
   140001726:	74 07                	je     0x14000172f
   140001728:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000172b:	ff 50 08             	call   QWORD PTR [rax+0x8]
   14000172e:	90                   	nop
   14000172f:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140001732:	48 63 41 04          	movsxd rax,DWORD PTR [rcx+0x4]
   140001736:	83 7c 30 10 00       	cmp    DWORD PTR [rax+rsi*1+0x10],0x0
   14000173b:	74 04                	je     0x140001741
   14000173d:	32 c0                	xor    al,al
   14000173f:	eb 2b                	jmp    0x14000176c
   140001741:	48 8b 44 30 50       	mov    rax,QWORD PTR [rax+rsi*1+0x50]
   140001746:	48 85 c0             	test   rax,rax
   140001749:	74 1f                	je     0x14000176a
   14000174b:	48 3b c6             	cmp    rax,rsi
   14000174e:	74 1a                	je     0x14000176a
   140001750:	48 8b c8             	mov    rcx,rax
   140001753:	ff 15 6f 89 00 00    	call   QWORD PTR [rip+0x896f]        # 0x14000a0c8
   140001759:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   14000175c:	48 63 41 04          	movsxd rax,DWORD PTR [rcx+0x4]
   140001760:	83 7c 30 10 00       	cmp    DWORD PTR [rax+rsi*1+0x10],0x0
   140001765:	0f 94 c0             	sete   al
   140001768:	eb 02                	jmp    0x14000176c
   14000176a:	b0 01                	mov    al,0x1
   14000176c:	88 44 24 28          	mov    BYTE PTR [rsp+0x28],al
   140001770:	84 c0                	test   al,al
   140001772:	75 0a                	jne    0x14000177e
   140001774:	bb 04 00 00 00       	mov    ebx,0x4
   140001779:	e9 af 00 00 00       	jmp    0x14000182d
   14000177e:	48 63 41 04          	movsxd rax,DWORD PTR [rcx+0x4]
   140001782:	8b 4c 30 18          	mov    ecx,DWORD PTR [rax+rsi*1+0x18]
   140001786:	81 e1 c0 01 00 00    	and    ecx,0x1c0
   14000178c:	83 f9 40             	cmp    ecx,0x40
   14000178f:	74 2b                	je     0x1400017bc
   140001791:	48 85 ff             	test   rdi,rdi
   140001794:	7e 26                	jle    0x1400017bc
   140001796:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001799:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000179d:	0f b6 54 31 58       	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   1400017a2:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400017a7:	ff 15 13 89 00 00    	call   QWORD PTR [rip+0x8913]        # 0x14000a0c0
   1400017ad:	83 f8 ff             	cmp    eax,0xffffffff
   1400017b0:	75 05                	jne    0x1400017b7
   1400017b2:	8d 58 05             	lea    ebx,[rax+0x5]
   1400017b5:	eb 52                	jmp    0x140001809
   1400017b7:	48 ff cf             	dec    rdi
   1400017ba:	eb d5                	jmp    0x140001791
   1400017bc:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400017bf:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400017c3:	4d 8b c6             	mov    r8,r14
   1400017c6:	49 8b d4             	mov    rdx,r12
   1400017c9:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400017ce:	ff 15 04 89 00 00    	call   QWORD PTR [rip+0x8904]        # 0x14000a0d8
   1400017d4:	49 3b c6             	cmp    rax,r14
   1400017d7:	75 2d                	jne    0x140001806
   1400017d9:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   1400017e0:	48 85 ff             	test   rdi,rdi
   1400017e3:	7e 28                	jle    0x14000180d
   1400017e5:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400017e8:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400017ec:	0f b6 54 31 58       	movzx  edx,BYTE PTR [rcx+rsi*1+0x58]
   1400017f1:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   1400017f6:	ff 15 c4 88 00 00    	call   QWORD PTR [rip+0x88c4]        # 0x14000a0c0
   1400017fc:	83 f8 ff             	cmp    eax,0xffffffff
   1400017ff:	74 05                	je     0x140001806
   140001801:	48 ff cf             	dec    rdi
   140001804:	eb da                	jmp    0x1400017e0
   140001806:	83 cb 04             	or     ebx,0x4
   140001809:	89 5c 24 70          	mov    DWORD PTR [rsp+0x70],ebx
   14000180d:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001810:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001814:	48 c7 44 31 28 00 00 	mov    QWORD PTR [rcx+rsi*1+0x28],0x0
   14000181b:	00 00 
   14000181d:	eb 0e                	jmp    0x14000182d
   14000181f:	48 8b 74 24 60       	mov    rsi,QWORD PTR [rsp+0x60]
   140001824:	8b 5c 24 70          	mov    ebx,DWORD PTR [rsp+0x70]
   140001828:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
   14000182d:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001830:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001834:	48 03 ce             	add    rcx,rsi
   140001837:	45 33 c0             	xor    r8d,r8d
   14000183a:	8b d3                	mov    edx,ebx
   14000183c:	ff 15 4e 88 00 00    	call   QWORD PTR [rip+0x884e]        # 0x14000a090
   140001842:	90                   	nop
   140001843:	ff 15 a7 88 00 00    	call   QWORD PTR [rip+0x88a7]        # 0x14000a0f0
   140001849:	84 c0                	test   al,al
   14000184b:	75 0a                	jne    0x140001857
   14000184d:	49 8b cf             	mov    rcx,r15
   140001850:	ff 15 7a 88 00 00    	call   QWORD PTR [rip+0x887a]        # 0x14000a0d0
   140001856:	90                   	nop
   140001857:	49 8b 07             	mov    rax,QWORD PTR [r15]
   14000185a:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   14000185e:	4a 8b 4c 39 48       	mov    rcx,QWORD PTR [rcx+r15*1+0x48]
   140001863:	48 85 c9             	test   rcx,rcx
   140001866:	74 07                	je     0x14000186f
   140001868:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000186b:	ff 50 10             	call   QWORD PTR [rax+0x10]
   14000186e:	90                   	nop
   14000186f:	48 8b c6             	mov    rax,rsi
   140001872:	48 8b 5c 24 68       	mov    rbx,QWORD PTR [rsp+0x68]
   140001877:	48 83 c4 30          	add    rsp,0x30
   14000187b:	41 5f                	pop    r15
   14000187d:	41 5e                	pop    r14
   14000187f:	41 5c                	pop    r12
   140001881:	5f                   	pop    rdi
   140001882:	5e                   	pop    rsi
   140001883:	c3                   	ret
   140001884:	cc                   	int3
   140001885:	cc                   	int3
   140001886:	cc                   	int3
   140001887:	cc                   	int3
   140001888:	cc                   	int3
   140001889:	cc                   	int3
   14000188a:	cc                   	int3
   14000188b:	cc                   	int3
   14000188c:	cc                   	int3
   14000188d:	cc                   	int3
   14000188e:	cc                   	int3
   14000188f:	cc                   	int3
   140001890:	40 53                	rex push rbx
   140001892:	55                   	push   rbp
   140001893:	56                   	push   rsi
   140001894:	41 57                	push   r15
   140001896:	48 83 ec 28          	sub    rsp,0x28
   14000189a:	48 8b 69 10          	mov    rbp,QWORD PTR [rcx+0x10]
   14000189e:	48 bb ff ff ff ff ff 	movabs rbx,0x7fffffffffffffff
   1400018a5:	ff ff 7f 
   1400018a8:	48 8b c3             	mov    rax,rbx
   1400018ab:	45 0f b6 f9          	movzx  r15d,r9b
   1400018af:	48 2b c5             	sub    rax,rbp
   1400018b2:	48 8b f1             	mov    rsi,rcx
   1400018b5:	48 83 f8 01          	cmp    rax,0x1
   1400018b9:	0f 82 2a 01 00 00    	jb     0x1400019e9
   1400018bf:	4c 89 64 24 60       	mov    QWORD PTR [rsp+0x60],r12
   1400018c4:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   1400018c8:	49 8b d4             	mov    rdx,r12
   1400018cb:	4c 89 74 24 20       	mov    QWORD PTR [rsp+0x20],r14
   1400018d0:	4c 8b 71 18          	mov    r14,QWORD PTR [rcx+0x18]
   1400018d4:	48 83 ca 0f          	or     rdx,0xf
   1400018d8:	48 3b d3             	cmp    rdx,rbx
   1400018db:	77 1f                	ja     0x1400018fc
   1400018dd:	49 8b ce             	mov    rcx,r14
   1400018e0:	48 8b c3             	mov    rax,rbx
   1400018e3:	48 d1 e9             	shr    rcx,1
   1400018e6:	48 2b c1             	sub    rax,rcx
   1400018e9:	4c 3b f0             	cmp    r14,rax
   1400018ec:	77 0e                	ja     0x1400018fc
   1400018ee:	4a 8d 04 31          	lea    rax,[rcx+r14*1]
   1400018f2:	48 8b da             	mov    rbx,rdx
   1400018f5:	48 3b d0             	cmp    rdx,rax
   1400018f8:	48 0f 42 d8          	cmovb  rbx,rax
   1400018fc:	48 8b cb             	mov    rcx,rbx
   1400018ff:	48 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],rdi
   140001904:	48 83 c1 01          	add    rcx,0x1
   140001908:	48 c7 c0 ff ff ff ff 	mov    rax,0xffffffffffffffff
   14000190f:	48 0f 42 c8          	cmovb  rcx,rax
   140001913:	48 81 f9 00 10 00 00 	cmp    rcx,0x1000
   14000191a:	72 28                	jb     0x140001944
   14000191c:	48 8d 41 27          	lea    rax,[rcx+0x27]
   140001920:	48 3b c1             	cmp    rax,rcx
   140001923:	0f 86 ba 00 00 00    	jbe    0x1400019e3
   140001929:	48 8b c8             	mov    rcx,rax
   14000192c:	e8 6b 71 00 00       	call   0x140008a9c
   140001931:	48 85 c0             	test   rax,rax
   140001934:	74 76                	je     0x1400019ac
   140001936:	48 8d 78 27          	lea    rdi,[rax+0x27]
   14000193a:	48 83 e7 e0          	and    rdi,0xffffffffffffffe0
   14000193e:	48 89 47 f8          	mov    QWORD PTR [rdi-0x8],rax
   140001942:	eb 11                	jmp    0x140001955
   140001944:	48 85 c9             	test   rcx,rcx
   140001947:	74 0a                	je     0x140001953
   140001949:	e8 4e 71 00 00       	call   0x140008a9c
   14000194e:	48 8b f8             	mov    rdi,rax
   140001951:	eb 02                	jmp    0x140001955
   140001953:	33 ff                	xor    edi,edi
   140001955:	4c 89 66 10          	mov    QWORD PTR [rsi+0x10],r12
   140001959:	4c 8b c5             	mov    r8,rbp
   14000195c:	48 89 5e 18          	mov    QWORD PTR [rsi+0x18],rbx
   140001960:	48 8b cf             	mov    rcx,rdi
   140001963:	49 83 fe 10          	cmp    r14,0x10
   140001967:	72 4a                	jb     0x1400019b3
   140001969:	48 8b 1e             	mov    rbx,QWORD PTR [rsi]
   14000196c:	48 8b d3             	mov    rdx,rbx
   14000196f:	e8 eb 7d 00 00       	call   0x14000975f
   140001974:	49 8d 56 01          	lea    rdx,[r14+0x1]
   140001978:	44 88 3c 2f          	mov    BYTE PTR [rdi+rbp*1],r15b
   14000197c:	c6 44 2f 01 00       	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   140001981:	48 81 fa 00 10 00 00 	cmp    rdx,0x1000
   140001988:	72 18                	jb     0x1400019a2
   14000198a:	48 8b 4b f8          	mov    rcx,QWORD PTR [rbx-0x8]
   14000198e:	48 83 c2 27          	add    rdx,0x27
   140001992:	48 2b d9             	sub    rbx,rcx
   140001995:	48 8d 43 f8          	lea    rax,[rbx-0x8]
   140001999:	48 83 f8 1f          	cmp    rax,0x1f
   14000199d:	77 0d                	ja     0x1400019ac
   14000199f:	48 8b d9             	mov    rbx,rcx
   1400019a2:	48 8b cb             	mov    rcx,rbx
   1400019a5:	e8 2e 71 00 00       	call   0x140008ad8
   1400019aa:	eb 18                	jmp    0x1400019c4
   1400019ac:	ff 15 86 88 00 00    	call   QWORD PTR [rip+0x8886]        # 0x14000a238
   1400019b2:	cc                   	int3
   1400019b3:	48 8b d6             	mov    rdx,rsi
   1400019b6:	e8 a4 7d 00 00       	call   0x14000975f
   1400019bb:	44 88 3c 2f          	mov    BYTE PTR [rdi+rbp*1],r15b
   1400019bf:	c6 44 2f 01 00       	mov    BYTE PTR [rdi+rbp*1+0x1],0x0
   1400019c4:	48 89 3e             	mov    QWORD PTR [rsi],rdi
   1400019c7:	48 8b c6             	mov    rax,rsi
   1400019ca:	48 8b 7c 24 58       	mov    rdi,QWORD PTR [rsp+0x58]
   1400019cf:	4c 8b 64 24 60       	mov    r12,QWORD PTR [rsp+0x60]
   1400019d4:	4c 8b 74 24 20       	mov    r14,QWORD PTR [rsp+0x20]
   1400019d9:	48 83 c4 28          	add    rsp,0x28
   1400019dd:	41 5f                	pop    r15
   1400019df:	5e                   	pop    rsi
   1400019e0:	5d                   	pop    rbp
   1400019e1:	5b                   	pop    rbx
   1400019e2:	c3                   	ret
   1400019e3:	e8 88 f7 ff ff       	call   0x140001170
   1400019e8:	cc                   	int3
   1400019e9:	e8 22 f8 ff ff       	call   0x140001210
   1400019ee:	cc                   	int3
   1400019ef:	cc                   	int3
   1400019f0:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   1400019f5:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   1400019fa:	57                   	push   rdi
   1400019fb:	41 54                	push   r12
   1400019fd:	41 55                	push   r13
   1400019ff:	41 56                	push   r14
   140001a01:	41 57                	push   r15
   140001a03:	48 83 ec 40          	sub    rsp,0x40
   140001a07:	45 0f b6 f8          	movzx  r15d,r8b
   140001a0b:	48 8b fa             	mov    rdi,rdx
   140001a0e:	48 8b f1             	mov    rsi,rcx
   140001a11:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   140001a16:	33 db                	xor    ebx,ebx
   140001a18:	89 5c 24 24          	mov    DWORD PTR [rsp+0x24],ebx
   140001a1c:	45 32 f6             	xor    r14b,r14b
   140001a1f:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001a24:	4c 8b e1             	mov    r12,rcx
   140001a27:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140001a2c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001a2f:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001a33:	4a 8b 4c 21 48       	mov    rcx,QWORD PTR [rcx+r12*1+0x48]
   140001a38:	48 85 c9             	test   rcx,rcx
   140001a3b:	74 07                	je     0x140001a44
   140001a3d:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140001a40:	ff 50 08             	call   QWORD PTR [rax+0x8]
   140001a43:	90                   	nop
   140001a44:	b2 01                	mov    dl,0x1
   140001a46:	48 8b ce             	mov    rcx,rsi
   140001a49:	ff 15 69 86 00 00    	call   QWORD PTR [rip+0x8669]        # 0x14000a0b8
   140001a4f:	88 44 24 38          	mov    BYTE PTR [rsp+0x38],al
   140001a53:	84 c0                	test   al,al
   140001a55:	0f 84 e1 00 00 00    	je     0x140001b3c
   140001a5b:	48 89 5f 10          	mov    QWORD PTR [rdi+0x10],rbx
   140001a5f:	48 8b c7             	mov    rax,rdi
   140001a62:	48 83 7f 18 10       	cmp    QWORD PTR [rdi+0x18],0x10
   140001a67:	72 03                	jb     0x140001a6c
   140001a69:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001a6c:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140001a6f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001a72:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001a76:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001a7b:	ff 15 27 86 00 00    	call   QWORD PTR [rip+0x8627]        # 0x14000a0a8
   140001a81:	8b d0                	mov    edx,eax
   140001a83:	49 bd ff ff ff ff ff 	movabs r13,0x7fffffffffffffff
   140001a8a:	ff ff 7f 
   140001a8d:	0f 1f 00             	nop    DWORD PTR [rax]
   140001a90:	83 fa ff             	cmp    edx,0xffffffff
   140001a93:	75 05                	jne    0x140001a9a
   140001a95:	8d 5a 02             	lea    ebx,[rdx+0x2]
   140001a98:	eb 2f                	jmp    0x140001ac9
   140001a9a:	41 3b d7             	cmp    edx,r15d
   140001a9d:	75 1c                	jne    0x140001abb
   140001a9f:	41 b6 01             	mov    r14b,0x1
   140001aa2:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001aa7:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001aaa:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001aae:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001ab3:	ff 15 f7 85 00 00    	call   QWORD PTR [rip+0x85f7]        # 0x14000a0b0
   140001ab9:	eb 12                	jmp    0x140001acd
   140001abb:	48 8b 4f 10          	mov    rcx,QWORD PTR [rdi+0x10]
   140001abf:	49 3b cd             	cmp    rcx,r13
   140001ac2:	72 0b                	jb     0x140001acf
   140001ac4:	bb 02 00 00 00       	mov    ebx,0x2
   140001ac9:	89 5c 24 24          	mov    DWORD PTR [rsp+0x24],ebx
   140001acd:	eb 68                	jmp    0x140001b37
   140001acf:	4c 8b 47 18          	mov    r8,QWORD PTR [rdi+0x18]
   140001ad3:	49 3b c8             	cmp    rcx,r8
   140001ad6:	73 1e                	jae    0x140001af6
   140001ad8:	48 8d 41 01          	lea    rax,[rcx+0x1]
   140001adc:	48 89 47 10          	mov    QWORD PTR [rdi+0x10],rax
   140001ae0:	48 8b c7             	mov    rax,rdi
   140001ae3:	49 83 f8 10          	cmp    r8,0x10
   140001ae7:	72 03                	jb     0x140001aec
   140001ae9:	48 8b 07             	mov    rax,QWORD PTR [rdi]
   140001aec:	88 14 08             	mov    BYTE PTR [rax+rcx*1],dl
   140001aef:	c6 44 08 01 00       	mov    BYTE PTR [rax+rcx*1+0x1],0x0
   140001af4:	eb 0c                	jmp    0x140001b02
   140001af6:	44 0f b6 ca          	movzx  r9d,dl
   140001afa:	48 8b cf             	mov    rcx,rdi
   140001afd:	e8 8e fd ff ff       	call   0x140001890
   140001b02:	41 b6 01             	mov    r14b,0x1
   140001b05:	44 88 74 24 20       	mov    BYTE PTR [rsp+0x20],r14b
   140001b0a:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001b0d:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001b11:	48 8b 4c 31 48       	mov    rcx,QWORD PTR [rcx+rsi*1+0x48]
   140001b16:	ff 15 7c 85 00 00    	call   QWORD PTR [rip+0x857c]        # 0x14000a098
   140001b1c:	8b d0                	mov    edx,eax
   140001b1e:	e9 6d ff ff ff       	jmp    0x140001a90
   140001b23:	8b 5c 24 24          	mov    ebx,DWORD PTR [rsp+0x24]
   140001b27:	44 0f b6 74 24 20    	movzx  r14d,BYTE PTR [rsp+0x20]
   140001b2d:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
   140001b32:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   140001b37:	45 84 f6             	test   r14b,r14b
   140001b3a:	75 03                	jne    0x140001b3f
   140001b3c:	83 cb 02             	or     ebx,0x2
   140001b3f:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140001b42:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140001b46:	48 03 ce             	add    rcx,rsi
   140001b49:	45 33 c0             	xor    r8d,r8d
   140001b4c:	8b d3                	mov    edx,ebx
   140001b4e:	ff 15 3c 85 00 00    	call   QWORD PTR [rip+0x853c]        # 0x14000a090
   140001b54:	90                   	nop
   140001b55:	49 8b 0c 24          	mov    rcx,QWORD PTR [r12]
   140001b59:	48 63 51 04          	movsxd rdx,DWORD PTR [rcx+0x4]
   140001b5d:	4a 8b 4c 22 48       	mov    rcx,QWORD PTR [rdx+r12*1+0x48]
   140001b62:	48 85 c9             	test   rcx,rcx
   140001b65:	74 07                	je     0x140001b6e
   140001b67:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001b6a:	ff 52 10             	call   QWORD PTR [rdx+0x10]
   140001b6d:	90                   	nop
   140001b6e:	48 8b c6             	mov    rax,rsi
   140001b71:	4c 8d 5c 24 40       	lea    r11,[rsp+0x40]
   140001b76:	49 8b 5b 40          	mov    rbx,QWORD PTR [r11+0x40]
   140001b7a:	49 8b 73 48          	mov    rsi,QWORD PTR [r11+0x48]
   140001b7e:	49 8b e3             	mov    rsp,r11
   140001b81:	41 5f                	pop    r15
   140001b83:	41 5e                	pop    r14
   140001b85:	41 5d                	pop    r13
   140001b87:	41 5c                	pop    r12
   140001b89:	5f                   	pop    rdi
   140001b8a:	c3                   	ret
   140001b8b:	cc                   	int3
   140001b8c:	cc                   	int3
   140001b8d:	cc                   	int3
   140001b8e:	cc                   	int3
   140001b8f:	cc                   	int3
   140001b90:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   140001b95:	53                   	push   rbx
   140001b96:	55                   	push   rbp
   140001b97:	56                   	push   rsi
   140001b98:	57                   	push   rdi
   140001b99:	41 54                	push   r12
   140001b9b:	41 55                	push   r13
   140001b9d:	41 56                	push   r14
   140001b9f:	41 57                	push   r15
   140001ba1:	48 83 ec 28          	sub    rsp,0x28
   140001ba5:	44 8b 51 04          	mov    r10d,DWORD PTR [rcx+0x4]
   140001ba9:	48 8b da             	mov    rbx,rdx
   140001bac:	44 8b 49 08          	mov    r9d,DWORD PTR [rcx+0x8]
   140001bb0:	44 8b 41 0c          	mov    r8d,DWORD PTR [rcx+0xc]
   140001bb4:	41 8b c0             	mov    eax,r8d
   140001bb7:	8b 11                	mov    edx,DWORD PTR [rcx]
   140001bb9:	41 33 c1             	xor    eax,r9d
   140001bbc:	41 23 c2             	and    eax,r10d
   140001bbf:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140001bc1:	41 33 c0             	xor    eax,r8d
   140001bc4:	44 8b 63 14          	mov    r12d,DWORD PTR [rbx+0x14]
   140001bc8:	03 c1                	add    eax,ecx
   140001bca:	89 4c 24 78          	mov    DWORD PTR [rsp+0x78],ecx
   140001bce:	8d 8a 78 a4 6a d7    	lea    ecx,[rdx-0x28955b88]
   140001bd4:	8b 53 04             	mov    edx,DWORD PTR [rbx+0x4]
   140001bd7:	03 c8                	add    ecx,eax
   140001bd9:	89 94 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],edx
   140001be0:	c1 c1 07             	rol    ecx,0x7
   140001be3:	41 8b c1             	mov    eax,r9d
   140001be6:	41 33 c2             	xor    eax,r10d
   140001be9:	41 03 ca             	add    ecx,r10d
   140001bec:	23 c1                	and    eax,ecx
   140001bee:	41 33 c1             	xor    eax,r9d
   140001bf1:	03 c2                	add    eax,edx
   140001bf3:	41 8d 90 56 b7 c7 e8 	lea    edx,[r8-0x173848aa]
   140001bfa:	44 8b 43 08          	mov    r8d,DWORD PTR [rbx+0x8]
   140001bfe:	03 d0                	add    edx,eax
   140001c00:	c1 c2 0c             	rol    edx,0xc
   140001c03:	41 8b c2             	mov    eax,r10d
   140001c06:	33 c1                	xor    eax,ecx
   140001c08:	44 89 44 24 0c       	mov    DWORD PTR [rsp+0xc],r8d
   140001c0d:	03 d1                	add    edx,ecx
   140001c0f:	23 c2                	and    eax,edx
   140001c11:	41 33 c2             	xor    eax,r10d
   140001c14:	41 03 c0             	add    eax,r8d
   140001c17:	45 8d 81 db 70 20 24 	lea    r8d,[r9+0x242070db]
   140001c1e:	44 8b 4b 0c          	mov    r9d,DWORD PTR [rbx+0xc]
   140001c22:	44 03 c0             	add    r8d,eax
   140001c25:	8b c2                	mov    eax,edx
   140001c27:	44 89 8c 24 80 00 00 	mov    DWORD PTR [rsp+0x80],r9d
   140001c2e:	00 
   140001c2f:	33 c1                	xor    eax,ecx
   140001c31:	41 c1 c8 0f          	ror    r8d,0xf
   140001c35:	44 03 c2             	add    r8d,edx
   140001c38:	41 23 c0             	and    eax,r8d
   140001c3b:	33 c1                	xor    eax,ecx
   140001c3d:	41 03 c1             	add    eax,r9d
   140001c40:	45 8d 8a ee ce bd c1 	lea    r9d,[r10-0x3e423112]
   140001c47:	44 8b 53 10          	mov    r10d,DWORD PTR [rbx+0x10]
   140001c4b:	44 03 c8             	add    r9d,eax
   140001c4e:	8b c2                	mov    eax,edx
   140001c50:	44 89 54 24 04       	mov    DWORD PTR [rsp+0x4],r10d
   140001c55:	41 33 c0             	xor    eax,r8d
   140001c58:	41 c1 c9 0a          	ror    r9d,0xa
   140001c5c:	45 03 c8             	add    r9d,r8d
   140001c5f:	41 23 c1             	and    eax,r9d
   140001c62:	33 c2                	xor    eax,edx
   140001c64:	41 03 c2             	add    eax,r10d
   140001c67:	44 8d 91 af 0f 7c f5 	lea    r10d,[rcx-0xa83f051]
   140001c6e:	44 03 d0             	add    r10d,eax
   140001c71:	8d 8a 2a c6 87 47    	lea    ecx,[rdx+0x4787c62a]
   140001c77:	8b 53 18             	mov    edx,DWORD PTR [rbx+0x18]
   140001c7a:	41 8b c0             	mov    eax,r8d
   140001c7d:	41 33 c1             	xor    eax,r9d
   140001c80:	89 14 24             	mov    DWORD PTR [rsp],edx
   140001c83:	41 c1 c2 07          	rol    r10d,0x7
   140001c87:	45 03 d1             	add    r10d,r9d
   140001c8a:	41 23 c2             	and    eax,r10d
   140001c8d:	41 33 c0             	xor    eax,r8d
   140001c90:	41 03 c4             	add    eax,r12d
   140001c93:	03 c8                	add    ecx,eax
   140001c95:	41 8b c1             	mov    eax,r9d
   140001c98:	41 33 c2             	xor    eax,r10d
   140001c9b:	c1 c1 0c             	rol    ecx,0xc
   140001c9e:	41 03 ca             	add    ecx,r10d
   140001ca1:	23 c1                	and    eax,ecx
   140001ca3:	41 33 c1             	xor    eax,r9d
   140001ca6:	03 c2                	add    eax,edx
   140001ca8:	41 8d 90 13 46 30 a8 	lea    edx,[r8-0x57cfb9ed]
   140001caf:	03 d0                	add    edx,eax
   140001cb1:	c1 ca 0f             	ror    edx,0xf
   140001cb4:	03 d1                	add    edx,ecx
   140001cb6:	8b 6b 1c             	mov    ebp,DWORD PTR [rbx+0x1c]
   140001cb9:	45 8d 81 01 95 46 fd 	lea    r8d,[r9-0x2b96aff]
   140001cc0:	44 8b 6b 20          	mov    r13d,DWORD PTR [rbx+0x20]
   140001cc4:	45 8d 8a d8 98 80 69 	lea    r9d,[r10+0x698098d8]
   140001ccb:	44 8b 73 28          	mov    r14d,DWORD PTR [rbx+0x28]
   140001ccf:	8b c1                	mov    eax,ecx
   140001cd1:	41 33 c2             	xor    eax,r10d
   140001cd4:	8b 73 30             	mov    esi,DWORD PTR [rbx+0x30]
   140001cd7:	23 c2                	and    eax,edx
   140001cd9:	44 8b 7b 34          	mov    r15d,DWORD PTR [rbx+0x34]
   140001cdd:	41 33 c2             	xor    eax,r10d
   140001ce0:	8b 7b 38             	mov    edi,DWORD PTR [rbx+0x38]
   140001ce3:	44 8b 53 24          	mov    r10d,DWORD PTR [rbx+0x24]
   140001ce7:	03 c5                	add    eax,ebp
   140001ce9:	44 03 c0             	add    r8d,eax
   140001cec:	44 89 54 24 10       	mov    DWORD PTR [rsp+0x10],r10d
   140001cf1:	41 c1 c8 0a          	ror    r8d,0xa
   140001cf5:	8b c1                	mov    eax,ecx
   140001cf7:	33 c2                	xor    eax,edx
   140001cf9:	44 03 c2             	add    r8d,edx
   140001cfc:	41 23 c0             	and    eax,r8d
   140001cff:	33 c1                	xor    eax,ecx
   140001d01:	41 03 c5             	add    eax,r13d
   140001d04:	44 03 c8             	add    r9d,eax
   140001d07:	45 8d 98 be d7 5c 89 	lea    r11d,[r8-0x76a32842]
   140001d0e:	8b c2                	mov    eax,edx
   140001d10:	41 c1 c1 07          	rol    r9d,0x7
   140001d14:	41 33 c0             	xor    eax,r8d
   140001d17:	45 03 c8             	add    r9d,r8d
   140001d1a:	41 23 c1             	and    eax,r9d
   140001d1d:	33 c2                	xor    eax,edx
   140001d1f:	41 03 c2             	add    eax,r10d
   140001d22:	44 8d 91 af f7 44 8b 	lea    r10d,[rcx-0x74bb0851]
   140001d29:	44 03 d0             	add    r10d,eax
   140001d2c:	8d 8a b1 5b ff ff    	lea    ecx,[rdx-0xa44f]
   140001d32:	8b 53 2c             	mov    edx,DWORD PTR [rbx+0x2c]
   140001d35:	41 8b c0             	mov    eax,r8d
   140001d38:	41 33 c1             	xor    eax,r9d
   140001d3b:	89 54 24 08          	mov    DWORD PTR [rsp+0x8],edx
   140001d3f:	41 c1 c2 0c          	rol    r10d,0xc
   140001d43:	45 03 d1             	add    r10d,r9d
   140001d46:	41 23 c2             	and    eax,r10d
   140001d49:	41 33 c0             	xor    eax,r8d
   140001d4c:	41 03 c6             	add    eax,r14d
   140001d4f:	03 c8                	add    ecx,eax
   140001d51:	41 8b c2             	mov    eax,r10d
   140001d54:	41 33 c1             	xor    eax,r9d
   140001d57:	c1 c9 0f             	ror    ecx,0xf
   140001d5a:	41 03 ca             	add    ecx,r10d
   140001d5d:	23 c1                	and    eax,ecx
   140001d5f:	44 8b c1             	mov    r8d,ecx
   140001d62:	41 33 c1             	xor    eax,r9d
   140001d65:	03 c2                	add    eax,edx
   140001d67:	41 8d 91 22 11 90 6b 	lea    edx,[r9+0x6b901122]
   140001d6e:	44 03 d8             	add    r11d,eax
   140001d71:	44 8d 89 8e 43 79 a6 	lea    r9d,[rcx-0x5986bc72]
   140001d78:	41 c1 cb 0a          	ror    r11d,0xa
   140001d7c:	41 8b c2             	mov    eax,r10d
   140001d7f:	33 c1                	xor    eax,ecx
   140001d81:	44 03 d9             	add    r11d,ecx
   140001d84:	41 23 c3             	and    eax,r11d
   140001d87:	45 33 c3             	xor    r8d,r11d
   140001d8a:	41 33 c2             	xor    eax,r10d
   140001d8d:	03 c6                	add    eax,esi
   140001d8f:	03 d0                	add    edx,eax
   140001d91:	41 8b c3             	mov    eax,r11d
   140001d94:	c1 c2 07             	rol    edx,0x7
   140001d97:	41 03 d3             	add    edx,r11d
   140001d9a:	44 23 c2             	and    r8d,edx
   140001d9d:	33 c2                	xor    eax,edx
   140001d9f:	44 33 c1             	xor    r8d,ecx
   140001da2:	41 81 c0 93 71 98 fd 	add    r8d,0xfd987193
   140001da9:	45 03 c7             	add    r8d,r15d
   140001dac:	45 03 c2             	add    r8d,r10d
   140001daf:	41 c1 c0 0c          	rol    r8d,0xc
   140001db3:	44 03 c2             	add    r8d,edx
   140001db6:	41 23 c0             	and    eax,r8d
   140001db9:	41 33 c3             	xor    eax,r11d
   140001dbc:	03 c7                	add    eax,edi
   140001dbe:	44 03 c8             	add    r9d,eax
   140001dc1:	41 c1 c9 0f          	ror    r9d,0xf
   140001dc5:	8b 5b 3c             	mov    ebx,DWORD PTR [rbx+0x3c]
   140001dc8:	45 03 c8             	add    r9d,r8d
   140001dcb:	41 8b c8             	mov    ecx,r8d
   140001dce:	41 8b c1             	mov    eax,r9d
   140001dd1:	33 ca                	xor    ecx,edx
   140001dd3:	41 23 c9             	and    ecx,r9d
   140001dd6:	33 ca                	xor    ecx,edx
   140001dd8:	81 c1 21 08 b4 49    	add    ecx,0x49b40821
   140001dde:	03 cb                	add    ecx,ebx
   140001de0:	41 03 cb             	add    ecx,r11d
   140001de3:	c1 c9 0a             	ror    ecx,0xa
   140001de6:	41 03 c9             	add    ecx,r9d
   140001de9:	33 c1                	xor    eax,ecx
   140001deb:	41 23 c0             	and    eax,r8d
   140001dee:	41 33 c1             	xor    eax,r9d
   140001df1:	05 62 25 1e f6       	add    eax,0xf61e2562
   140001df6:	44 8d 91 aa c7 b6 e9 	lea    r10d,[rcx-0x16493856]
   140001dfd:	03 84 24 88 00 00 00 	add    eax,DWORD PTR [rsp+0x88]
   140001e04:	03 d0                	add    edx,eax
   140001e06:	8b c1                	mov    eax,ecx
   140001e08:	c1 c2 05             	rol    edx,0x5
   140001e0b:	03 d1                	add    edx,ecx
   140001e0d:	33 c2                	xor    eax,edx
   140001e0f:	41 23 c1             	and    eax,r9d
   140001e12:	33 c1                	xor    eax,ecx
   140001e14:	05 40 b3 40 c0       	add    eax,0xc040b340
   140001e19:	03 04 24             	add    eax,DWORD PTR [rsp]
   140001e1c:	44 03 c0             	add    r8d,eax
   140001e1f:	41 c1 c0 09          	rol    r8d,0x9
   140001e23:	44 03 c2             	add    r8d,edx
   140001e26:	41 8b c0             	mov    eax,r8d
   140001e29:	33 c2                	xor    eax,edx
   140001e2b:	23 c1                	and    eax,ecx
   140001e2d:	8d 8a 5d 10 2f d6    	lea    ecx,[rdx-0x29d0efa3]
   140001e33:	33 c2                	xor    eax,edx
   140001e35:	05 51 5a 5e 26       	add    eax,0x265e5a51
   140001e3a:	03 44 24 08          	add    eax,DWORD PTR [rsp+0x8]
   140001e3e:	44 03 c8             	add    r9d,eax
   140001e41:	41 8b c0             	mov    eax,r8d
   140001e44:	41 c1 c1 0e          	rol    r9d,0xe
   140001e48:	45 03 c8             	add    r9d,r8d
   140001e4b:	41 33 c1             	xor    eax,r9d
   140001e4e:	23 c2                	and    eax,edx
   140001e50:	41 8d 90 53 14 44 02 	lea    edx,[r8+0x2441453]
   140001e57:	41 33 c0             	xor    eax,r8d
   140001e5a:	03 44 24 78          	add    eax,DWORD PTR [rsp+0x78]
   140001e5e:	44 03 d0             	add    r10d,eax
   140001e61:	41 8b c1             	mov    eax,r9d
   140001e64:	41 c1 ca 0c          	ror    r10d,0xc
   140001e68:	45 03 d1             	add    r10d,r9d
   140001e6b:	41 33 c2             	xor    eax,r10d
   140001e6e:	41 23 c0             	and    eax,r8d
   140001e71:	45 8d 81 81 e6 a1 d8 	lea    r8d,[r9-0x275e197f]
   140001e78:	41 33 c1             	xor    eax,r9d
   140001e7b:	41 03 c4             	add    eax,r12d
   140001e7e:	03 c8                	add    ecx,eax
   140001e80:	41 8b c2             	mov    eax,r10d
   140001e83:	c1 c1 05             	rol    ecx,0x5
   140001e86:	41 03 ca             	add    ecx,r10d
   140001e89:	33 c1                	xor    eax,ecx
   140001e8b:	41 23 c1             	and    eax,r9d
   140001e8e:	45 8d 8a c8 fb d3 e7 	lea    r9d,[r10-0x182c0438]
   140001e95:	41 33 c2             	xor    eax,r10d
   140001e98:	41 03 c6             	add    eax,r14d
   140001e9b:	03 d0                	add    edx,eax
   140001e9d:	c1 c2 09             	rol    edx,0x9
   140001ea0:	03 d1                	add    edx,ecx
   140001ea2:	8b c2                	mov    eax,edx
   140001ea4:	33 c1                	xor    eax,ecx
   140001ea6:	41 23 c2             	and    eax,r10d
   140001ea9:	33 c1                	xor    eax,ecx
   140001eab:	03 c3                	add    eax,ebx
   140001ead:	44 03 c0             	add    r8d,eax
   140001eb0:	8b c2                	mov    eax,edx
   140001eb2:	41 c1 c0 0e          	rol    r8d,0xe
   140001eb6:	44 03 c2             	add    r8d,edx
   140001eb9:	41 33 c0             	xor    eax,r8d
   140001ebc:	23 c1                	and    eax,ecx
   140001ebe:	33 c2                	xor    eax,edx
   140001ec0:	03 44 24 04          	add    eax,DWORD PTR [rsp+0x4]
   140001ec4:	44 03 c8             	add    r9d,eax
   140001ec7:	44 8d 91 e6 cd e1 21 	lea    r10d,[rcx+0x21e1cde6]
   140001ece:	41 c1 c9 0c          	ror    r9d,0xc
   140001ed2:	45 03 c8             	add    r9d,r8d
   140001ed5:	8d 8a d6 07 37 c3    	lea    ecx,[rdx-0x3cc8f82a]
   140001edb:	41 8b c0             	mov    eax,r8d
   140001ede:	41 33 c1             	xor    eax,r9d
   140001ee1:	23 c2                	and    eax,edx
   140001ee3:	41 8d 90 87 0d d5 f4 	lea    edx,[r8-0xb2af279]
   140001eea:	41 33 c0             	xor    eax,r8d
   140001eed:	45 8d 99 ed 14 5a 45 	lea    r11d,[r9+0x455a14ed]
   140001ef4:	03 44 24 10          	add    eax,DWORD PTR [rsp+0x10]
   140001ef8:	44 03 d0             	add    r10d,eax
   140001efb:	41 8b c1             	mov    eax,r9d
   140001efe:	41 c1 c2 05          	rol    r10d,0x5
   140001f02:	45 03 d1             	add    r10d,r9d
   140001f05:	41 33 c2             	xor    eax,r10d
   140001f08:	41 23 c0             	and    eax,r8d
   140001f0b:	41 33 c1             	xor    eax,r9d
   140001f0e:	03 c7                	add    eax,edi
   140001f10:	45 8d 82 05 e9 e3 a9 	lea    r8d,[r10-0x561c16fb]
   140001f17:	03 c8                	add    ecx,eax
   140001f19:	c1 c1 09             	rol    ecx,0x9
   140001f1c:	41 03 ca             	add    ecx,r10d
   140001f1f:	8b c1                	mov    eax,ecx
   140001f21:	41 33 c2             	xor    eax,r10d
   140001f24:	41 23 c1             	and    eax,r9d
   140001f27:	41 33 c2             	xor    eax,r10d
   140001f2a:	44 8d 89 f8 a3 ef fc 	lea    r9d,[rcx-0x3105c08]
   140001f31:	03 84 24 80 00 00 00 	add    eax,DWORD PTR [rsp+0x80]
   140001f38:	03 d0                	add    edx,eax
   140001f3a:	8b c1                	mov    eax,ecx
   140001f3c:	c1 c2 0e             	rol    edx,0xe
   140001f3f:	03 d1                	add    edx,ecx
   140001f41:	33 c2                	xor    eax,edx
   140001f43:	41 23 c2             	and    eax,r10d
   140001f46:	33 c1                	xor    eax,ecx
   140001f48:	41 03 c5             	add    eax,r13d
   140001f4b:	44 8d 92 d9 02 6f 67 	lea    r10d,[rdx+0x676f02d9]
   140001f52:	44 03 d8             	add    r11d,eax
   140001f55:	8b c2                	mov    eax,edx
   140001f57:	41 c1 cb 0c          	ror    r11d,0xc
   140001f5b:	44 03 da             	add    r11d,edx
   140001f5e:	41 33 c3             	xor    eax,r11d
   140001f61:	23 c1                	and    eax,ecx
   140001f63:	33 c2                	xor    eax,edx
   140001f65:	41 03 c7             	add    eax,r15d
   140001f68:	44 03 c0             	add    r8d,eax
   140001f6b:	41 8b c3             	mov    eax,r11d
   140001f6e:	41 c1 c0 05          	rol    r8d,0x5
   140001f72:	45 03 c3             	add    r8d,r11d
   140001f75:	41 33 c0             	xor    eax,r8d
   140001f78:	23 c2                	and    eax,edx
   140001f7a:	41 8d 93 8a 4c 2a 8d 	lea    edx,[r11-0x72d5b376]
   140001f81:	41 33 c3             	xor    eax,r11d
   140001f84:	03 44 24 0c          	add    eax,DWORD PTR [rsp+0xc]
   140001f88:	44 03 c8             	add    r9d,eax
   140001f8b:	41 c1 c1 09          	rol    r9d,0x9
   140001f8f:	45 03 c8             	add    r9d,r8d
   140001f92:	41 8b c1             	mov    eax,r9d
   140001f95:	41 8b c9             	mov    ecx,r9d
   140001f98:	41 33 c0             	xor    eax,r8d
   140001f9b:	41 23 c3             	and    eax,r11d
   140001f9e:	41 33 c0             	xor    eax,r8d
   140001fa1:	03 c5                	add    eax,ebp
   140001fa3:	44 03 d0             	add    r10d,eax
   140001fa6:	41 c1 c2 0e          	rol    r10d,0xe
   140001faa:	45 03 d1             	add    r10d,r9d
   140001fad:	41 33 ca             	xor    ecx,r10d
   140001fb0:	8b c1                	mov    eax,ecx
   140001fb2:	41 23 c0             	and    eax,r8d
   140001fb5:	41 33 c1             	xor    eax,r9d
   140001fb8:	03 c6                	add    eax,esi
   140001fba:	03 d0                	add    edx,eax
   140001fbc:	c1 ca 0c             	ror    edx,0xc
   140001fbf:	41 03 d2             	add    edx,r10d
   140001fc2:	33 ca                	xor    ecx,edx
   140001fc4:	81 c1 42 39 fa ff    	add    ecx,0xfffa3942
   140001fca:	41 03 cc             	add    ecx,r12d
   140001fcd:	44 03 c1             	add    r8d,ecx
   140001fd0:	41 c1 c0 04          	rol    r8d,0x4
   140001fd4:	44 03 c2             	add    r8d,edx
   140001fd7:	41 8b c2             	mov    eax,r10d
   140001fda:	44 8d 9a 0c 38 e5 fd 	lea    r11d,[rdx-0x21ac7f4]
   140001fe1:	33 c2                	xor    eax,edx
   140001fe3:	41 33 c0             	xor    eax,r8d
   140001fe6:	05 81 f6 71 87       	add    eax,0x8771f681
   140001feb:	41 03 c5             	add    eax,r13d
   140001fee:	44 03 c8             	add    r9d,eax
   140001ff1:	41 c1 c1 0b          	rol    r9d,0xb
   140001ff5:	45 03 c8             	add    r9d,r8d
   140001ff8:	41 8b c1             	mov    eax,r9d
   140001ffb:	41 8b c9             	mov    ecx,r9d
   140001ffe:	33 c2                	xor    eax,edx
   140002000:	41 8d 90 44 ea be a4 	lea    edx,[r8-0x5b4115bc]
   140002007:	41 33 c0             	xor    eax,r8d
   14000200a:	05 22 61 9d 6d       	add    eax,0x6d9d6122
   14000200f:	03 44 24 08          	add    eax,DWORD PTR [rsp+0x8]
   140002013:	44 03 d0             	add    r10d,eax
   140002016:	41 c1 c2 10          	rol    r10d,0x10
   14000201a:	45 03 d1             	add    r10d,r9d
   14000201d:	41 33 ca             	xor    ecx,r10d
   140002020:	8b c1                	mov    eax,ecx
   140002022:	41 33 c0             	xor    eax,r8d
   140002025:	45 8d 81 a9 cf de 4b 	lea    r8d,[r9+0x4bdecfa9]
   14000202c:	03 c7                	add    eax,edi
   14000202e:	45 8d 8a 60 4b bb f6 	lea    r9d,[r10-0x944b4a0]
   140002035:	44 03 d8             	add    r11d,eax
   140002038:	41 8b c2             	mov    eax,r10d
   14000203b:	41 c1 cb 09          	ror    r11d,0x9
   14000203f:	45 03 da             	add    r11d,r10d
   140002042:	41 33 c3             	xor    eax,r11d
   140002045:	41 33 cb             	xor    ecx,r11d
   140002048:	03 8c 24 88 00 00 00 	add    ecx,DWORD PTR [rsp+0x88]
   14000204f:	03 d1                	add    edx,ecx
   140002051:	45 8d 93 70 bc bf be 	lea    r10d,[r11-0x41404390]
   140002058:	c1 c2 04             	rol    edx,0x4
   14000205b:	41 03 d3             	add    edx,r11d
   14000205e:	33 c2                	xor    eax,edx
   140002060:	03 44 24 04          	add    eax,DWORD PTR [rsp+0x4]
   140002064:	44 03 c0             	add    r8d,eax
   140002067:	41 c1 c0 0b          	rol    r8d,0xb
   14000206b:	44 03 c2             	add    r8d,edx
   14000206e:	41 8b c0             	mov    eax,r8d
   140002071:	41 8b c8             	mov    ecx,r8d
   140002074:	41 33 c3             	xor    eax,r11d
   140002077:	44 8d 9a c6 7e 9b 28 	lea    r11d,[rdx+0x289b7ec6]
   14000207e:	33 c2                	xor    eax,edx
   140002080:	03 c5                	add    eax,ebp
   140002082:	44 03 c8             	add    r9d,eax
   140002085:	41 c1 c1 10          	rol    r9d,0x10
   140002089:	45 03 c8             	add    r9d,r8d
   14000208c:	41 33 c9             	xor    ecx,r9d
   14000208f:	8b c1                	mov    eax,ecx
   140002091:	33 c2                	xor    eax,edx
   140002093:	41 03 c6             	add    eax,r14d
   140002096:	44 03 d0             	add    r10d,eax
   140002099:	41 8b c1             	mov    eax,r9d
   14000209c:	41 c1 ca 09          	ror    r10d,0x9
   1400020a0:	45 03 d1             	add    r10d,r9d
   1400020a3:	41 33 c2             	xor    eax,r10d
   1400020a6:	41 33 ca             	xor    ecx,r10d
   1400020a9:	41 03 cf             	add    ecx,r15d
   1400020ac:	44 03 d9             	add    r11d,ecx
   1400020af:	41 c1 c3 04          	rol    r11d,0x4
   1400020b3:	45 03 da             	add    r11d,r10d
   1400020b6:	41 33 c3             	xor    eax,r11d
   1400020b9:	05 fa 27 a1 ea       	add    eax,0xeaa127fa
   1400020be:	03 44 24 78          	add    eax,DWORD PTR [rsp+0x78]
   1400020c2:	44 03 c0             	add    r8d,eax
   1400020c5:	41 c1 c0 0b          	rol    r8d,0xb
   1400020c9:	45 03 c3             	add    r8d,r11d
   1400020cc:	41 8b c0             	mov    eax,r8d
   1400020cf:	41 8b c8             	mov    ecx,r8d
   1400020d2:	41 33 c2             	xor    eax,r10d
   1400020d5:	41 33 c3             	xor    eax,r11d
   1400020d8:	05 85 30 ef d4       	add    eax,0xd4ef3085
   1400020dd:	03 84 24 80 00 00 00 	add    eax,DWORD PTR [rsp+0x80]
   1400020e4:	44 03 c8             	add    r9d,eax
   1400020e7:	41 c1 c1 10          	rol    r9d,0x10
   1400020eb:	45 03 c8             	add    r9d,r8d
   1400020ee:	41 33 c9             	xor    ecx,r9d
   1400020f1:	8b c1                	mov    eax,ecx
   1400020f3:	41 33 c3             	xor    eax,r11d
   1400020f6:	41 8d 92 05 1d 88 04 	lea    edx,[r10+0x4881d05]
   1400020fd:	03 04 24             	add    eax,DWORD PTR [rsp]
   140002100:	03 d0                	add    edx,eax
   140002102:	41 8b c1             	mov    eax,r9d
   140002105:	c1 ca 09             	ror    edx,0x9
   140002108:	41 03 d1             	add    edx,r9d
   14000210b:	33 c2                	xor    eax,edx
   14000210d:	33 ca                	xor    ecx,edx
   14000210f:	03 4c 24 10          	add    ecx,DWORD PTR [rsp+0x10]
   140002113:	44 8d 91 39 d0 d4 d9 	lea    r10d,[rcx-0x262b2fc7]
   14000211a:	41 8d 88 e5 99 db e6 	lea    ecx,[r8-0x1924661b]
   140002121:	45 03 d3             	add    r10d,r11d
   140002124:	45 8d 81 f8 7c a2 1f 	lea    r8d,[r9+0x1fa27cf8]
   14000212b:	41 c1 c2 04          	rol    r10d,0x4
   14000212f:	44 03 d2             	add    r10d,edx
   140002132:	44 8d 8a 65 56 ac c4 	lea    r9d,[rdx-0x3b53a99b]
   140002139:	41 33 c2             	xor    eax,r10d
   14000213c:	03 c6                	add    eax,esi
   14000213e:	03 c8                	add    ecx,eax
   140002140:	c1 c1 0b             	rol    ecx,0xb
   140002143:	41 03 ca             	add    ecx,r10d
   140002146:	8b c1                	mov    eax,ecx
   140002148:	33 c2                	xor    eax,edx
   14000214a:	41 8d 92 44 22 29 f4 	lea    edx,[r10-0xbd6ddbc]
   140002151:	41 33 c2             	xor    eax,r10d
   140002154:	03 c3                	add    eax,ebx
   140002156:	44 03 c0             	add    r8d,eax
   140002159:	8b c1                	mov    eax,ecx
   14000215b:	41 c1 c0 10          	rol    r8d,0x10
   14000215f:	44 03 c1             	add    r8d,ecx
   140002162:	41 33 c0             	xor    eax,r8d
   140002165:	41 33 c2             	xor    eax,r10d
   140002168:	44 8d 91 97 ff 2a 43 	lea    r10d,[rcx+0x432aff97]
   14000216f:	03 44 24 0c          	add    eax,DWORD PTR [rsp+0xc]
   140002173:	44 03 c8             	add    r9d,eax
   140002176:	8b c1                	mov    eax,ecx
   140002178:	f7 d0                	not    eax
   14000217a:	41 c1 c9 09          	ror    r9d,0x9
   14000217e:	45 03 c8             	add    r9d,r8d
   140002181:	41 8d 88 a7 23 94 ab 	lea    ecx,[r8-0x546bdc59]
   140002188:	41 0b c1             	or     eax,r9d
   14000218b:	41 33 c0             	xor    eax,r8d
   14000218e:	03 44 24 78          	add    eax,DWORD PTR [rsp+0x78]
   140002192:	03 d0                	add    edx,eax
   140002194:	41 8b c0             	mov    eax,r8d
   140002197:	f7 d0                	not    eax
   140002199:	c1 c2 06             	rol    edx,0x6
   14000219c:	41 03 d1             	add    edx,r9d
   14000219f:	45 8d 81 39 a0 93 fc 	lea    r8d,[r9-0x36c5fc7]
   1400021a6:	0b c2                	or     eax,edx
   1400021a8:	41 33 c1             	xor    eax,r9d
   1400021ab:	03 c5                	add    eax,ebp
   1400021ad:	44 03 d0             	add    r10d,eax
   1400021b0:	41 8b c1             	mov    eax,r9d
   1400021b3:	f7 d0                	not    eax
   1400021b5:	41 c1 c2 0a          	rol    r10d,0xa
   1400021b9:	44 03 d2             	add    r10d,edx
   1400021bc:	44 8d 8a c3 59 5b 65 	lea    r9d,[rdx+0x655b59c3]
   1400021c3:	41 0b c2             	or     eax,r10d
   1400021c6:	33 c2                	xor    eax,edx
   1400021c8:	03 c7                	add    eax,edi
   1400021ca:	03 c8                	add    ecx,eax
   1400021cc:	8b c2                	mov    eax,edx
   1400021ce:	f7 d0                	not    eax
   1400021d0:	c1 c1 0f             	rol    ecx,0xf
   1400021d3:	41 03 ca             	add    ecx,r10d
   1400021d6:	0b c1                	or     eax,ecx
   1400021d8:	41 33 c2             	xor    eax,r10d
   1400021db:	41 03 c4             	add    eax,r12d
   1400021de:	44 03 c0             	add    r8d,eax
   1400021e1:	41 8b c2             	mov    eax,r10d
   1400021e4:	f7 d0                	not    eax
   1400021e6:	41 c1 c8 0b          	ror    r8d,0xb
   1400021ea:	44 03 c1             	add    r8d,ecx
   1400021ed:	41 0b c0             	or     eax,r8d
   1400021f0:	33 c1                	xor    eax,ecx
   1400021f2:	03 c6                	add    eax,esi
   1400021f4:	44 03 c8             	add    r9d,eax
   1400021f7:	41 c1 c1 06          	rol    r9d,0x6
   1400021fb:	45 03 c8             	add    r9d,r8d
   1400021fe:	41 8d 92 92 cc 0c 8f 	lea    edx,[r10-0x70f3336e]
   140002205:	8b c1                	mov    eax,ecx
   140002207:	f7 d0                	not    eax
   140002209:	44 8d 91 7d f4 ef ff 	lea    r10d,[rcx-0x100b83]
   140002210:	41 0b c1             	or     eax,r9d
   140002213:	41 8d 88 d1 5d 84 85 	lea    ecx,[r8-0x7a7ba22f]
   14000221a:	41 33 c0             	xor    eax,r8d
   14000221d:	03 84 24 80 00 00 00 	add    eax,DWORD PTR [rsp+0x80]
   140002224:	03 d0                	add    edx,eax
   140002226:	41 8b c0             	mov    eax,r8d
   140002229:	f7 d0                	not    eax
   14000222b:	c1 c2 0a             	rol    edx,0xa
   14000222e:	41 03 d1             	add    edx,r9d
   140002231:	45 8d 81 4f 7e a8 6f 	lea    r8d,[r9+0x6fa87e4f]
   140002238:	0b c2                	or     eax,edx
   14000223a:	41 33 c1             	xor    eax,r9d
   14000223d:	41 03 c6             	add    eax,r14d
   140002240:	44 03 d0             	add    r10d,eax
   140002243:	41 8b c1             	mov    eax,r9d
   140002246:	f7 d0                	not    eax
   140002248:	41 c1 c2 0f          	rol    r10d,0xf
   14000224c:	44 03 d2             	add    r10d,edx
   14000224f:	41 0b c2             	or     eax,r10d
   140002252:	45 8b ca             	mov    r9d,r10d
   140002255:	33 c2                	xor    eax,edx
   140002257:	41 f7 d1             	not    r9d
   14000225a:	03 84 24 88 00 00 00 	add    eax,DWORD PTR [rsp+0x88]
   140002261:	03 c8                	add    ecx,eax
   140002263:	45 8d 9a 14 43 01 a3 	lea    r11d,[r10-0x5cfebcec]
   14000226a:	8b c2                	mov    eax,edx
   14000226c:	c1 c9 0b             	ror    ecx,0xb
   14000226f:	f7 d0                	not    eax
   140002271:	41 03 ca             	add    ecx,r10d
   140002274:	0b c1                	or     eax,ecx
   140002276:	41 33 c2             	xor    eax,r10d
   140002279:	41 03 c5             	add    eax,r13d
   14000227c:	44 03 c0             	add    r8d,eax
   14000227f:	44 8d 91 a1 11 08 4e 	lea    r10d,[rcx+0x4e0811a1]
   140002286:	41 c1 c0 06          	rol    r8d,0x6
   14000228a:	8b c1                	mov    eax,ecx
   14000228c:	f7 d0                	not    eax
   14000228e:	44 03 c1             	add    r8d,ecx
   140002291:	45 0b c8             	or     r9d,r8d
   140002294:	44 33 c9             	xor    r9d,ecx
   140002297:	41 81 c1 e0 e6 2c fe 	add    r9d,0xfe2ce6e0
   14000229e:	44 03 cb             	add    r9d,ebx
   1400022a1:	44 03 ca             	add    r9d,edx
   1400022a4:	41 c1 c1 0a          	rol    r9d,0xa
   1400022a8:	45 03 c8             	add    r9d,r8d
   1400022ab:	41 0b c1             	or     eax,r9d
   1400022ae:	41 33 c0             	xor    eax,r8d
   1400022b1:	03 04 24             	add    eax,DWORD PTR [rsp]
   1400022b4:	44 03 d8             	add    r11d,eax
   1400022b7:	41 8d 91 35 f2 3a bd 	lea    edx,[r9-0x42c50dcb]
   1400022be:	41 8b c0             	mov    eax,r8d
   1400022c1:	41 c1 c3 0f          	rol    r11d,0xf
   1400022c5:	f7 d0                	not    eax
   1400022c7:	45 03 d9             	add    r11d,r9d
   1400022ca:	41 0b c3             	or     eax,r11d
   1400022cd:	41 33 c1             	xor    eax,r9d
   1400022d0:	41 03 c7             	add    eax,r15d
   1400022d3:	44 03 d0             	add    r10d,eax
   1400022d6:	41 8b c1             	mov    eax,r9d
   1400022d9:	f7 d0                	not    eax
   1400022db:	41 c1 ca 0b          	ror    r10d,0xb
   1400022df:	45 03 d3             	add    r10d,r11d
   1400022e2:	41 0b c2             	or     eax,r10d
   1400022e5:	41 33 c3             	xor    eax,r11d
   1400022e8:	05 82 7e 53 f7       	add    eax,0xf7537e82
   1400022ed:	03 44 24 04          	add    eax,DWORD PTR [rsp+0x4]
   1400022f1:	44 03 c0             	add    r8d,eax
   1400022f4:	41 8b c3             	mov    eax,r11d
   1400022f7:	f7 d0                	not    eax
   1400022f9:	41 c1 c0 06          	rol    r8d,0x6
   1400022fd:	45 03 c2             	add    r8d,r10d
   140002300:	41 0b c0             	or     eax,r8d
   140002303:	41 33 c2             	xor    eax,r10d
   140002306:	03 44 24 08          	add    eax,DWORD PTR [rsp+0x8]
   14000230a:	03 d0                	add    edx,eax
   14000230c:	c1 c2 0a             	rol    edx,0xa
   14000230f:	41 03 d0             	add    edx,r8d
   140002312:	4c 8b 4c 24 70       	mov    r9,QWORD PTR [rsp+0x70]
   140002317:	41 8d 82 91 d3 86 eb 	lea    eax,[r10-0x14792c6f]
   14000231e:	41 8b ca             	mov    ecx,r10d
   140002321:	f7 d1                	not    ecx
   140002323:	0b ca                	or     ecx,edx
   140002325:	45 01 01             	add    DWORD PTR [r9],r8d
   140002328:	41 33 c8             	xor    ecx,r8d
   14000232b:	81 c1 bb d2 d7 2a    	add    ecx,0x2ad7d2bb
   140002331:	41 f7 d0             	not    r8d
   140002334:	03 4c 24 0c          	add    ecx,DWORD PTR [rsp+0xc]
   140002338:	41 03 cb             	add    ecx,r11d
   14000233b:	c1 c1 0f             	rol    ecx,0xf
   14000233e:	03 ca                	add    ecx,edx
   140002340:	41 01 49 08          	add    DWORD PTR [r9+0x8],ecx
   140002344:	44 0b c1             	or     r8d,ecx
   140002347:	44 33 c2             	xor    r8d,edx
   14000234a:	44 03 44 24 10       	add    r8d,DWORD PTR [rsp+0x10]
   14000234f:	41 03 c0             	add    eax,r8d
   140002352:	c1 c8 0b             	ror    eax,0xb
   140002355:	41 03 41 04          	add    eax,DWORD PTR [r9+0x4]
   140002359:	03 c1                	add    eax,ecx
   14000235b:	41 01 51 0c          	add    DWORD PTR [r9+0xc],edx
   14000235f:	41 89 41 04          	mov    DWORD PTR [r9+0x4],eax
   140002363:	48 83 c4 28          	add    rsp,0x28
   140002367:	41 5f                	pop    r15
   140002369:	41 5e                	pop    r14
   14000236b:	41 5d                	pop    r13
   14000236d:	41 5c                	pop    r12
   14000236f:	5f                   	pop    rdi
   140002370:	5e                   	pop    rsi
   140002371:	5d                   	pop    rbp
   140002372:	5b                   	pop    rbx
   140002373:	c3                   	ret
   140002374:	cc                   	int3
   140002375:	cc                   	int3
   140002376:	cc                   	int3
   140002377:	cc                   	int3
   140002378:	cc                   	int3
   140002379:	cc                   	int3
   14000237a:	cc                   	int3
   14000237b:	cc                   	int3
   14000237c:	cc                   	int3
   14000237d:	cc                   	int3
   14000237e:	cc                   	int3
   14000237f:	cc                   	int3
   140002380:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140002385:	57                   	push   rdi
   140002386:	48 83 ec 20          	sub    rsp,0x20
   14000238a:	48 8b fa             	mov    rdi,rdx
   14000238d:	85 c9                	test   ecx,ecx
   14000238f:	75 3c                	jne    0x1400023cd
   140002391:	48 85 d2             	test   rdx,rdx
   140002394:	0f 84 e7 00 00 00    	je     0x140002481
   14000239a:	8b 02                	mov    eax,DWORD PTR [rdx]
   14000239c:	0f ba f0 1f          	btr    eax,0x1f
   1400023a0:	8b d0                	mov    edx,eax
   1400023a2:	0f b7 c0             	movzx  eax,ax
   1400023a5:	c1 ea 10             	shr    edx,0x10
   1400023a8:	03 d0                	add    edx,eax
   1400023aa:	74 12                	je     0x1400023be
   1400023ac:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   1400023b0:	44 8b c2             	mov    r8d,edx
   1400023b3:	33 d2                	xor    edx,edx
   1400023b5:	49 c1 e0 03          	shl    r8,0x3
   1400023b9:	e8 4e 72 00 00       	call   0x14000960c
   1400023be:	33 db                	xor    ebx,ebx
   1400023c0:	89 1f                	mov    DWORD PTR [rdi],ebx
   1400023c2:	48 8b 5c 24 48       	mov    rbx,QWORD PTR [rsp+0x48]
   1400023c7:	48 83 c4 20          	add    rsp,0x20
   1400023cb:	5f                   	pop    rdi
   1400023cc:	c3                   	ret
   1400023cd:	8b 02                	mov    eax,DWORD PTR [rdx]
   1400023cf:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
   1400023d4:	8b e9                	mov    ebp,ecx
   1400023d6:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
   1400023db:	8b f1                	mov    esi,ecx
   1400023dd:	c1 fd 1f             	sar    ebp,0x1f
   1400023e0:	f7 de                	neg    esi
   1400023e2:	81 e5 00 00 00 80    	and    ebp,0x80000000
   1400023e8:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   1400023ed:	85 c9                	test   ecx,ecx
   1400023ef:	0f 49 f1             	cmovns esi,ecx
   1400023f2:	33 db                	xor    ebx,ebx
   1400023f4:	48 85 ff             	test   rdi,rdi
   1400023f7:	74 24                	je     0x14000241d
   1400023f9:	0f ba f0 1f          	btr    eax,0x1f
   1400023fd:	8b d0                	mov    edx,eax
   1400023ff:	0f b7 c0             	movzx  eax,ax
   140002402:	c1 ea 10             	shr    edx,0x10
   140002405:	03 d0                	add    edx,eax
   140002407:	74 12                	je     0x14000241b
   140002409:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   14000240d:	44 8b c2             	mov    r8d,edx
   140002410:	33 d2                	xor    edx,edx
   140002412:	49 c1 e0 03          	shl    r8,0x3
   140002416:	e8 f1 71 00 00       	call   0x14000960c
   14000241b:	89 1f                	mov    DWORD PTR [rdi],ebx
   14000241d:	48 8b 05 5c c4 00 00 	mov    rax,QWORD PTR [rip+0xc45c]        # 0x14000e880
   140002424:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140002427:	48 85 c9             	test   rcx,rcx
   14000242a:	75 10                	jne    0x14000243c
   14000242c:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   140002430:	bb 01 00 00 00       	mov    ebx,0x1
   140002435:	8b ce                	mov    ecx,esi
   140002437:	48 89 08             	mov    QWORD PTR [rax],rcx
   14000243a:	eb 32                	jmp    0x14000246e
   14000243c:	4c 8b cb             	mov    r9,rbx
   14000243f:	90                   	nop
   140002440:	33 d2                	xor    edx,edx
   140002442:	8b c6                	mov    eax,esi
   140002444:	48 f7 f1             	div    rcx
   140002447:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   14000244b:	4d 8d 49 08          	lea    r9,[r9+0x8]
   14000244f:	8b c6                	mov    eax,esi
   140002451:	ff c3                	inc    ebx
   140002453:	49 89 54 09 f8       	mov    QWORD PTR [r9+rcx*1-0x8],rdx
   140002458:	33 d2                	xor    edx,edx
   14000245a:	48 8b 0d 1f c4 00 00 	mov    rcx,QWORD PTR [rip+0xc41f]        # 0x14000e880
   140002461:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140002464:	48 f7 f1             	div    rcx
   140002467:	48 8b f0             	mov    rsi,rax
   14000246a:	85 c0                	test   eax,eax
   14000246c:	75 d2                	jne    0x140002440
   14000246e:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   140002473:	0b eb                	or     ebp,ebx
   140002475:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   14000247a:	89 2f                	mov    DWORD PTR [rdi],ebp
   14000247c:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
   140002481:	48 8b 5c 24 48       	mov    rbx,QWORD PTR [rsp+0x48]
   140002486:	48 83 c4 20          	add    rsp,0x20
   14000248a:	5f                   	pop    rdi
   14000248b:	c3                   	ret
   14000248c:	cc                   	int3
   14000248d:	cc                   	int3
   14000248e:	cc                   	int3
   14000248f:	cc                   	int3
   140002490:	48 3b ca             	cmp    rcx,rdx
   140002493:	0f 84 e9 00 00 00    	je     0x140002582
   140002499:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000249e:	41 57                	push   r15
   1400024a0:	48 83 ec 20          	sub    rsp,0x20
   1400024a4:	48 8b f2             	mov    rsi,rdx
   1400024a7:	4c 8b f9             	mov    r15,rcx
   1400024aa:	48 85 d2             	test   rdx,rdx
   1400024ad:	0f 84 c4 00 00 00    	je     0x140002577
   1400024b3:	8b 02                	mov    eax,DWORD PTR [rdx]
   1400024b5:	0f ba f0 1f          	btr    eax,0x1f
   1400024b9:	48 85 c9             	test   rcx,rcx
   1400024bc:	75 2e                	jne    0x1400024ec
   1400024be:	8b d0                	mov    edx,eax
   1400024c0:	0f b7 c0             	movzx  eax,ax
   1400024c3:	c1 ea 10             	shr    edx,0x10
   1400024c6:	03 d0                	add    edx,eax
   1400024c8:	74 12                	je     0x1400024dc
   1400024ca:	48 8b 4e 08          	mov    rcx,QWORD PTR [rsi+0x8]
   1400024ce:	44 8b c2             	mov    r8d,edx
   1400024d1:	33 d2                	xor    edx,edx
   1400024d3:	49 c1 e0 03          	shl    r8,0x3
   1400024d7:	e8 30 71 00 00       	call   0x14000960c
   1400024dc:	33 c9                	xor    ecx,ecx
   1400024de:	89 0e                	mov    DWORD PTR [rsi],ecx
   1400024e0:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   1400024e5:	48 83 c4 20          	add    rsp,0x20
   1400024e9:	41 5f                	pop    r15
   1400024eb:	c3                   	ret
   1400024ec:	44 8b c0             	mov    r8d,eax
   1400024ef:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   1400024f4:	48 8b 5e 08          	mov    rbx,QWORD PTR [rsi+0x8]
   1400024f8:	0f b7 c0             	movzx  eax,ax
   1400024fb:	41 c1 e8 10          	shr    r8d,0x10
   1400024ff:	44 03 c0             	add    r8d,eax
   140002502:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140002507:	8b 01                	mov    eax,DWORD PTR [rcx]
   140002509:	0f ba f0 1f          	btr    eax,0x1f
   14000250d:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140002512:	4c 8b 71 08          	mov    r14,QWORD PTR [rcx+0x8]
   140002516:	8b d0                	mov    edx,eax
   140002518:	c1 ea 10             	shr    edx,0x10
   14000251b:	0f b7 c0             	movzx  eax,ax
   14000251e:	03 d0                	add    edx,eax
   140002520:	8b fa                	mov    edi,edx
   140002522:	41 3b d0             	cmp    edx,r8d
   140002525:	73 12                	jae    0x140002539
   140002527:	4c 2b c7             	sub    r8,rdi
   14000252a:	48 8d 0c d3          	lea    rcx,[rbx+rdx*8]
   14000252e:	49 c1 e0 03          	shl    r8,0x3
   140002532:	33 d2                	xor    edx,edx
   140002534:	e8 d3 70 00 00       	call   0x14000960c
   140002539:	48 85 ff             	test   rdi,rdi
   14000253c:	74 25                	je     0x140002563
   14000253e:	33 c9                	xor    ecx,ecx
   140002540:	4c 2b f3             	sub    r14,rbx
   140002543:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002547:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000254e:	00 00 
   140002550:	49 8b 04 1e          	mov    rax,QWORD PTR [r14+rbx*1]
   140002554:	48 ff c1             	inc    rcx
   140002557:	48 89 03             	mov    QWORD PTR [rbx],rax
   14000255a:	48 8d 5b 08          	lea    rbx,[rbx+0x8]
   14000255e:	48 3b cf             	cmp    rcx,rdi
   140002561:	7c ed                	jl     0x140002550
   140002563:	41 8b 07             	mov    eax,DWORD PTR [r15]
   140002566:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   14000256b:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   140002570:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002575:	89 06                	mov    DWORD PTR [rsi],eax
   140002577:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   14000257c:	48 83 c4 20          	add    rsp,0x20
   140002580:	41 5f                	pop    r15
   140002582:	c3                   	ret
   140002583:	cc                   	int3
   140002584:	cc                   	int3
   140002585:	cc                   	int3
   140002586:	cc                   	int3
   140002587:	cc                   	int3
   140002588:	cc                   	int3
   140002589:	cc                   	int3
   14000258a:	cc                   	int3
   14000258b:	cc                   	int3
   14000258c:	cc                   	int3
   14000258d:	cc                   	int3
   14000258e:	cc                   	int3
   14000258f:	cc                   	int3
   140002590:	83 39 00             	cmp    DWORD PTR [rcx],0x0
   140002593:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140002598:	ba 01 00 00 00       	mov    edx,0x1
   14000259d:	0f 4d c2             	cmovge eax,edx
   1400025a0:	c3                   	ret
   1400025a1:	cc                   	int3
   1400025a2:	cc                   	int3
   1400025a3:	cc                   	int3
   1400025a4:	cc                   	int3
   1400025a5:	cc                   	int3
   1400025a6:	cc                   	int3
   1400025a7:	cc                   	int3
   1400025a8:	cc                   	int3
   1400025a9:	cc                   	int3
   1400025aa:	cc                   	int3
   1400025ab:	cc                   	int3
   1400025ac:	cc                   	int3
   1400025ad:	cc                   	int3
   1400025ae:	cc                   	int3
   1400025af:	cc                   	int3
   1400025b0:	40 56                	rex push rsi
   1400025b2:	41 54                	push   r12
   1400025b4:	41 57                	push   r15
   1400025b6:	48 83 ec 20          	sub    rsp,0x20
   1400025ba:	48 8b 05 bf c2 00 00 	mov    rax,QWORD PTR [rip+0xc2bf]        # 0x14000e880
   1400025c1:	49 8b f0             	mov    rsi,r8
   1400025c4:	4c 8b fa             	mov    r15,rdx
   1400025c7:	4c 8b e1             	mov    r12,rcx
   1400025ca:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400025d1:	0f 85 15 03 00 00    	jne    0x1400028ec
   1400025d7:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   1400025da:	4c 8b 0d 9f c2 00 00 	mov    r9,QWORD PTR [rip+0xc29f]        # 0x14000e880
   1400025e1:	48 89 5c 24 40       	mov    QWORD PTR [rsp+0x40],rbx
   1400025e6:	48 89 7c 24 50       	mov    QWORD PTR [rsp+0x50],rdi
   1400025eb:	49 63 41 2c          	movsxd rax,DWORD PTR [r9+0x2c]
   1400025ef:	83 f8 18             	cmp    eax,0x18
   1400025f2:	7d 26                	jge    0x14000261a
   1400025f4:	41 c7 44 81 30 1f 00 	mov    DWORD PTR [r9+rax*4+0x30],0x1f
   1400025fb:	00 00 
   1400025fd:	4c 8b 0d 7c c2 00 00 	mov    r9,QWORD PTR [rip+0xc27c]        # 0x14000e880
   140002604:	41 83 b9 08 03 00 00 	cmp    DWORD PTR [r9+0x308],0x0
   14000260b:	00 
   14000260c:	74 0c                	je     0x14000261a
   14000260e:	e8 ed 1c 00 00       	call   0x140004300
   140002613:	4c 8b 0d 66 c2 00 00 	mov    r9,QWORD PTR [rip+0xc266]        # 0x14000e880
   14000261a:	41 8b 1f             	mov    ebx,DWORD PTR [r15]
   14000261d:	33 ff                	xor    edi,edi
   14000261f:	48 89 6c 24 48       	mov    QWORD PTR [rsp+0x48],rbp
   140002624:	4c 89 74 24 58       	mov    QWORD PTR [rsp+0x58],r14
   140002629:	81 e3 ff ff ff 7f    	and    ebx,0x7fffffff
   14000262f:	0f 85 e4 00 00 00    	jne    0x140002719
   140002635:	41 39 b9 ec 02 00 00 	cmp    DWORD PTR [r9+0x2ec],edi
   14000263c:	74 17                	je     0x140002655
   14000263e:	41 c7 81 f0 02 00 00 	mov    DWORD PTR [r9+0x2f0],0xd
   140002645:	0d 00 00 00 
   140002649:	4c 8b 0d 30 c2 00 00 	mov    r9,QWORD PTR [rip+0xc230]        # 0x14000e880
   140002650:	e9 d4 00 00 00       	jmp    0x140002729
   140002655:	48 8d 0d 7c 89 00 00 	lea    rcx,[rip+0x897c]        # 0x14000afd8
   14000265c:	e8 3f 15 00 00       	call   0x140003ba0
   140002661:	48 8b 0d 18 c2 00 00 	mov    rcx,QWORD PTR [rip+0xc218]        # 0x14000e880
   140002668:	48 8d 3d 91 b9 00 00 	lea    rdi,[rip+0xb991]        # 0x14000e000
   14000266f:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140002673:	83 f8 18             	cmp    eax,0x18
   140002676:	7d 0b                	jge    0x140002683
   140002678:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   14000267d:	48 8b 0c cf          	mov    rcx,QWORD PTR [rdi+rcx*8]
   140002681:	eb 07                	jmp    0x14000268a
   140002683:	48 8d 0d 6a 89 00 00 	lea    rcx,[rip+0x896a]        # 0x14000aff4
   14000268a:	e8 11 15 00 00       	call   0x140003ba0
   14000268f:	b9 01 00 00 00       	mov    ecx,0x1
   140002694:	e8 91 6f 00 00       	call   0x14000962a
   140002699:	48 8b d0             	mov    rdx,rax
   14000269c:	b9 0a 00 00 00       	mov    ecx,0xa
   1400026a1:	e8 8a 6f 00 00       	call   0x140009630
   1400026a6:	48 8b 05 d3 c1 00 00 	mov    rax,QWORD PTR [rip+0xc1d3]        # 0x14000e880
   1400026ad:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   1400026b0:	83 e9 01             	sub    ecx,0x1
   1400026b3:	48 63 d9             	movsxd rbx,ecx
   1400026b6:	0f 88 4b 03 00 00    	js     0x140002a07
   1400026bc:	48 8d 34 9d 30 00 00 	lea    rsi,[rbx*4+0x30]
   1400026c3:	00 
   1400026c4:	48 8d 0d 2d 89 00 00 	lea    rcx,[rip+0x892d]        # 0x14000aff8
   1400026cb:	e8 d0 14 00 00       	call   0x140003ba0
   1400026d0:	48 83 fb 18          	cmp    rbx,0x18
   1400026d4:	73 11                	jae    0x1400026e7
   1400026d6:	48 8b 05 a3 c1 00 00 	mov    rax,QWORD PTR [rip+0xc1a3]        # 0x14000e880
   1400026dd:	48 63 0c 06          	movsxd rcx,DWORD PTR [rsi+rax*1]
   1400026e1:	48 8b 0c cf          	mov    rcx,QWORD PTR [rdi+rcx*8]
   1400026e5:	eb 07                	jmp    0x1400026ee
   1400026e7:	48 8d 0d 06 89 00 00 	lea    rcx,[rip+0x8906]        # 0x14000aff4
   1400026ee:	e8 ad 14 00 00       	call   0x140003ba0
   1400026f3:	b9 01 00 00 00       	mov    ecx,0x1
   1400026f8:	e8 2d 6f 00 00       	call   0x14000962a
   1400026fd:	48 8b d0             	mov    rdx,rax
   140002700:	b9 0a 00 00 00       	mov    ecx,0xa
   140002705:	e8 26 6f 00 00       	call   0x140009630
   14000270a:	48 83 ee 04          	sub    rsi,0x4
   14000270e:	48 83 eb 01          	sub    rbx,0x1
   140002712:	79 b0                	jns    0x1400026c4
   140002714:	e9 ee 02 00 00       	jmp    0x140002a07
   140002719:	83 fb 01             	cmp    ebx,0x1
   14000271c:	75 0b                	jne    0x140002729
   14000271e:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   140002722:	48 83 38 01          	cmp    QWORD PTR [rax],0x1
   140002726:	0f 44 df             	cmove  ebx,edi
   140002729:	49 3b f7             	cmp    rsi,r15
   14000272c:	75 11                	jne    0x14000273f
   14000272e:	b9 07 00 00 00       	mov    ecx,0x7
   140002733:	e8 b8 14 00 00       	call   0x140003bf0
   140002738:	4c 8b 0d 41 c1 00 00 	mov    r9,QWORD PTR [rip+0xc141]        # 0x14000e880
   14000273f:	41 f7 04 24 00 00 ff 	test   DWORD PTR [r12],0x7fff0000
   140002746:	7f 
   140002747:	75 09                	jne    0x140002752
   140002749:	41 f7 07 00 00 ff 7f 	test   DWORD PTR [r15],0x7fff0000
   140002750:	74 1f                	je     0x140002771
   140002752:	41 39 b9 ec 02 00 00 	cmp    DWORD PTR [r9+0x2ec],edi
   140002759:	0f 84 d9 01 00 00    	je     0x140002938
   14000275f:	41 c7 81 f0 02 00 00 	mov    DWORD PTR [r9+0x2f0],0xc
   140002766:	0c 00 00 00 
   14000276a:	4c 8b 0d 0f c1 00 00 	mov    r9,QWORD PTR [rip+0xc10f]        # 0x14000e880
   140002771:	41 8b 2c 24          	mov    ebp,DWORD PTR [r12]
   140002775:	44 8b f5             	mov    r14d,ebp
   140002778:	41 0f ba f6 1f       	btr    r14d,0x1f
   14000277d:	41 83 fe 01          	cmp    r14d,0x1
   140002781:	75 0d                	jne    0x140002790
   140002783:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   140002788:	48 83 38 01          	cmp    QWORD PTR [rax],0x1
   14000278c:	44 0f 44 f7          	cmove  r14d,edi
   140002790:	41 8b 41 28          	mov    eax,DWORD PTR [r9+0x28]
   140002794:	41 8d 0c 1e          	lea    ecx,[r14+rbx*1]
   140002798:	3b c8                	cmp    ecx,eax
   14000279a:	7e 2a                	jle    0x1400027c6
   14000279c:	41 39 b9 90 00 00 00 	cmp    DWORD PTR [r9+0x90],edi
   1400027a3:	75 06                	jne    0x1400027ab
   1400027a5:	03 c0                	add    eax,eax
   1400027a7:	3b c8                	cmp    ecx,eax
   1400027a9:	7e 1b                	jle    0x1400027c6
   1400027ab:	41 39 b9 ec 02 00 00 	cmp    DWORD PTR [r9+0x2ec],edi
   1400027b2:	74 28                	je     0x1400027dc
   1400027b4:	41 c7 81 f0 02 00 00 	mov    DWORD PTR [r9+0x2f0],0xd
   1400027bb:	0d 00 00 00 
   1400027bf:	4c 8b 0d ba c0 00 00 	mov    r9,QWORD PTR [rip+0xc0ba]        # 0x14000e880
   1400027c6:	41 39 b9 f0 02 00 00 	cmp    DWORD PTR [r9+0x2f0],edi
   1400027cd:	0f 84 d3 00 00 00    	je     0x1400028a6
   1400027d3:	41 ff 49 2c          	dec    DWORD PTR [r9+0x2c]
   1400027d7:	e9 fc 00 00 00       	jmp    0x1400028d8
   1400027dc:	48 8d 0d f5 87 00 00 	lea    rcx,[rip+0x87f5]        # 0x14000afd8
   1400027e3:	e8 b8 13 00 00       	call   0x140003ba0
   1400027e8:	48 8b 0d 91 c0 00 00 	mov    rcx,QWORD PTR [rip+0xc091]        # 0x14000e880
   1400027ef:	48 8d 3d 0a b8 00 00 	lea    rdi,[rip+0xb80a]        # 0x14000e000
   1400027f6:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1400027fa:	83 f8 18             	cmp    eax,0x18
   1400027fd:	7d 0b                	jge    0x14000280a
   1400027ff:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   140002804:	48 8b 0c cf          	mov    rcx,QWORD PTR [rdi+rcx*8]
   140002808:	eb 07                	jmp    0x140002811
   14000280a:	48 8d 0d e3 87 00 00 	lea    rcx,[rip+0x87e3]        # 0x14000aff4
   140002811:	e8 8a 13 00 00       	call   0x140003ba0
   140002816:	b9 01 00 00 00       	mov    ecx,0x1
   14000281b:	e8 0a 6e 00 00       	call   0x14000962a
   140002820:	48 8b d0             	mov    rdx,rax
   140002823:	b9 0a 00 00 00       	mov    ecx,0xa
   140002828:	e8 03 6e 00 00       	call   0x140009630
   14000282d:	48 8b 05 4c c0 00 00 	mov    rax,QWORD PTR [rip+0xc04c]        # 0x14000e880
   140002834:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   140002837:	83 e9 01             	sub    ecx,0x1
   14000283a:	48 63 d9             	movsxd rbx,ecx
   14000283d:	0f 88 c4 01 00 00    	js     0x140002a07
   140002843:	48 8d 34 9d 30 00 00 	lea    rsi,[rbx*4+0x30]
   14000284a:	00 
   14000284b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140002850:	48 8d 0d a1 87 00 00 	lea    rcx,[rip+0x87a1]        # 0x14000aff8
   140002857:	e8 44 13 00 00       	call   0x140003ba0
   14000285c:	48 83 fb 18          	cmp    rbx,0x18
   140002860:	73 11                	jae    0x140002873
   140002862:	48 8b 05 17 c0 00 00 	mov    rax,QWORD PTR [rip+0xc017]        # 0x14000e880
   140002869:	48 63 0c 06          	movsxd rcx,DWORD PTR [rsi+rax*1]
   14000286d:	48 8b 0c cf          	mov    rcx,QWORD PTR [rdi+rcx*8]
   140002871:	eb 07                	jmp    0x14000287a
   140002873:	48 8d 0d 7a 87 00 00 	lea    rcx,[rip+0x877a]        # 0x14000aff4
   14000287a:	e8 21 13 00 00       	call   0x140003ba0
   14000287f:	b9 01 00 00 00       	mov    ecx,0x1
   140002884:	e8 a1 6d 00 00       	call   0x14000962a
   140002889:	48 8b d0             	mov    rdx,rax
   14000288c:	b9 0a 00 00 00       	mov    ecx,0xa
   140002891:	e8 9a 6d 00 00       	call   0x140009630
   140002896:	48 83 ee 04          	sub    rsi,0x4
   14000289a:	48 83 eb 01          	sub    rbx,0x1
   14000289e:	0f 88 63 01 00 00    	js     0x140002a07
   1400028a4:	eb aa                	jmp    0x140002850
   1400028a6:	48 8b d6             	mov    rdx,rsi
   1400028a9:	49 8b cc             	mov    rcx,r12
   1400028ac:	e8 df fb ff ff       	call   0x140002490
   1400028b1:	41 39 3c 24          	cmp    DWORD PTR [r12],edi
   1400028b5:	74 17                	je     0x1400028ce
   1400028b7:	41 33 2f             	xor    ebp,DWORD PTR [r15]
   1400028ba:	81 e5 00 00 00 80    	and    ebp,0x80000000
   1400028c0:	85 db                	test   ebx,ebx
   1400028c2:	75 32                	jne    0x1400028f6
   1400028c4:	8b 06                	mov    eax,DWORD PTR [rsi]
   1400028c6:	85 c0                	test   eax,eax
   1400028c8:	74 04                	je     0x1400028ce
   1400028ca:	0b c5                	or     eax,ebp
   1400028cc:	89 06                	mov    DWORD PTR [rsi],eax
   1400028ce:	48 8b 05 ab bf 00 00 	mov    rax,QWORD PTR [rip+0xbfab]        # 0x14000e880
   1400028d5:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400028d8:	48 8b 6c 24 48       	mov    rbp,QWORD PTR [rsp+0x48]
   1400028dd:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   1400028e2:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   1400028e7:	48 8b 7c 24 50       	mov    rdi,QWORD PTR [rsp+0x50]
   1400028ec:	48 83 c4 20          	add    rsp,0x20
   1400028f0:	41 5f                	pop    r15
   1400028f2:	41 5c                	pop    r12
   1400028f4:	5e                   	pop    rsi
   1400028f5:	c3                   	ret
   1400028f6:	44 8b c3             	mov    r8d,ebx
   1400028f9:	85 db                	test   ebx,ebx
   1400028fb:	74 2f                	je     0x14000292c
   1400028fd:	4e 8d 0c f5 00 00 00 	lea    r9,[r14*8+0x0]
   140002904:	00 
   140002905:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14000290c:	00 00 00 00 
   140002910:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   140002914:	49 8d 14 f9          	lea    rdx,[r9+rdi*8]
   140002918:	48 8b 4e 08          	mov    rcx,QWORD PTR [rsi+0x8]
   14000291c:	48 8b 04 f8          	mov    rax,QWORD PTR [rax+rdi*8]
   140002920:	48 ff c7             	inc    rdi
   140002923:	48 89 04 0a          	mov    QWORD PTR [rdx+rcx*1],rax
   140002927:	49 3b f8             	cmp    rdi,r8
   14000292a:	7c e4                	jl     0x140002910
   14000292c:	c1 e3 10             	shl    ebx,0x10
   14000292f:	41 03 de             	add    ebx,r14d
   140002932:	0b dd                	or     ebx,ebp
   140002934:	89 1e                	mov    DWORD PTR [rsi],ebx
   140002936:	eb 96                	jmp    0x1400028ce
   140002938:	48 8d 0d 99 86 00 00 	lea    rcx,[rip+0x8699]        # 0x14000afd8
   14000293f:	e8 5c 12 00 00       	call   0x140003ba0
   140002944:	48 8b 0d 35 bf 00 00 	mov    rcx,QWORD PTR [rip+0xbf35]        # 0x14000e880
   14000294b:	48 8d 3d ae b6 00 00 	lea    rdi,[rip+0xb6ae]        # 0x14000e000
   140002952:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140002956:	83 f8 18             	cmp    eax,0x18
   140002959:	7d 0b                	jge    0x140002966
   14000295b:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   140002960:	48 8b 0c cf          	mov    rcx,QWORD PTR [rdi+rcx*8]
   140002964:	eb 07                	jmp    0x14000296d
   140002966:	48 8d 0d 87 86 00 00 	lea    rcx,[rip+0x8687]        # 0x14000aff4
   14000296d:	e8 2e 12 00 00       	call   0x140003ba0
   140002972:	b9 01 00 00 00       	mov    ecx,0x1
   140002977:	e8 ae 6c 00 00       	call   0x14000962a
   14000297c:	48 8b d0             	mov    rdx,rax
   14000297f:	b9 0a 00 00 00       	mov    ecx,0xa
   140002984:	e8 a7 6c 00 00       	call   0x140009630
   140002989:	48 8b 05 f0 be 00 00 	mov    rax,QWORD PTR [rip+0xbef0]        # 0x14000e880
   140002990:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   140002993:	83 e9 01             	sub    ecx,0x1
   140002996:	48 63 d9             	movsxd rbx,ecx
   140002999:	78 58                	js     0x1400029f3
   14000299b:	48 8d 34 9d 30 00 00 	lea    rsi,[rbx*4+0x30]
   1400029a2:	00 
   1400029a3:	48 8d 0d 4e 86 00 00 	lea    rcx,[rip+0x864e]        # 0x14000aff8
   1400029aa:	e8 f1 11 00 00       	call   0x140003ba0
   1400029af:	48 83 fb 18          	cmp    rbx,0x18
   1400029b3:	73 11                	jae    0x1400029c6
   1400029b5:	48 8b 05 c4 be 00 00 	mov    rax,QWORD PTR [rip+0xbec4]        # 0x14000e880
   1400029bc:	48 63 0c 06          	movsxd rcx,DWORD PTR [rsi+rax*1]
   1400029c0:	48 8b 0c cf          	mov    rcx,QWORD PTR [rdi+rcx*8]
   1400029c4:	eb 07                	jmp    0x1400029cd
   1400029c6:	48 8d 0d 27 86 00 00 	lea    rcx,[rip+0x8627]        # 0x14000aff4
   1400029cd:	e8 ce 11 00 00       	call   0x140003ba0
   1400029d2:	b9 01 00 00 00       	mov    ecx,0x1
   1400029d7:	e8 4e 6c 00 00       	call   0x14000962a
   1400029dc:	48 8b d0             	mov    rdx,rax
   1400029df:	b9 0a 00 00 00       	mov    ecx,0xa
   1400029e4:	e8 47 6c 00 00       	call   0x140009630
   1400029e9:	48 83 ee 04          	sub    rsi,0x4
   1400029ed:	48 83 eb 01          	sub    rbx,0x1
   1400029f1:	79 b0                	jns    0x1400029a3
   1400029f3:	48 8d 0d 6e 87 00 00 	lea    rcx,[rip+0x876e]        # 0x14000b168
   1400029fa:	e8 a1 11 00 00       	call   0x140003ba0
   1400029ff:	33 c9                	xor    ecx,ecx
   140002a01:	e8 30 6c 00 00       	call   0x140009636
   140002a06:	cc                   	int3
   140002a07:	48 8d 0d 8a 87 00 00 	lea    rcx,[rip+0x878a]        # 0x14000b198
   140002a0e:	e8 8d 11 00 00       	call   0x140003ba0
   140002a13:	33 c9                	xor    ecx,ecx
   140002a15:	e8 1c 6c 00 00       	call   0x140009636
   140002a1a:	cc                   	int3
   140002a1b:	cc                   	int3
   140002a1c:	cc                   	int3
   140002a1d:	cc                   	int3
   140002a1e:	cc                   	int3
   140002a1f:	cc                   	int3
   140002a20:	8b 02                	mov    eax,DWORD PTR [rdx]
   140002a22:	85 c0                	test   eax,eax
   140002a24:	74 11                	je     0x140002a37
   140002a26:	85 c9                	test   ecx,ecx
   140002a28:	79 07                	jns    0x140002a31
   140002a2a:	0f ba e8 1f          	bts    eax,0x1f
   140002a2e:	89 02                	mov    DWORD PTR [rdx],eax
   140002a30:	c3                   	ret
   140002a31:	0f ba f0 1f          	btr    eax,0x1f
   140002a35:	89 02                	mov    DWORD PTR [rdx],eax
   140002a37:	c3                   	ret
   140002a38:	cc                   	int3
   140002a39:	cc                   	int3
   140002a3a:	cc                   	int3
   140002a3b:	cc                   	int3
   140002a3c:	cc                   	int3
   140002a3d:	cc                   	int3
   140002a3e:	cc                   	int3
   140002a3f:	cc                   	int3
   140002a40:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140002a45:	57                   	push   rdi
   140002a46:	48 83 ec 20          	sub    rsp,0x20
   140002a4a:	48 8b da             	mov    rbx,rdx
   140002a4d:	8b f9                	mov    edi,ecx
   140002a4f:	e8 5c 2b 00 00       	call   0x1400055b0
   140002a54:	4c 8b c3             	mov    r8,rbx
   140002a57:	48 89 05 22 be 00 00 	mov    QWORD PTR [rip+0xbe22],rax        # 0x14000e880
   140002a5e:	8b d7                	mov    edx,edi
   140002a60:	48 8b c8             	mov    rcx,rax
   140002a63:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140002a68:	48 83 c4 20          	add    rsp,0x20
   140002a6c:	5f                   	pop    rdi
   140002a6d:	e9 0e 00 00 00       	jmp    0x140002a80
   140002a72:	cc                   	int3
   140002a73:	cc                   	int3
   140002a74:	cc                   	int3
   140002a75:	cc                   	int3
   140002a76:	cc                   	int3
   140002a77:	cc                   	int3
   140002a78:	cc                   	int3
   140002a79:	cc                   	int3
   140002a7a:	cc                   	int3
   140002a7b:	cc                   	int3
   140002a7c:	cc                   	int3
   140002a7d:	cc                   	int3
   140002a7e:	cc                   	int3
   140002a7f:	cc                   	int3
   140002a80:	40 53                	rex push rbx
   140002a82:	48 83 ec 20          	sub    rsp,0x20
   140002a86:	44 8b da             	mov    r11d,edx
   140002a89:	48 8b d9             	mov    rbx,rcx
   140002a8c:	48 85 c9             	test   rcx,rcx
   140002a8f:	75 08                	jne    0x140002a99
   140002a91:	33 c0                	xor    eax,eax
   140002a93:	48 83 c4 20          	add    rsp,0x20
   140002a97:	5b                   	pop    rbx
   140002a98:	c3                   	ret
   140002a99:	48 89 74 24 30       	mov    QWORD PTR [rsp+0x30],rsi
   140002a9e:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140002aa3:	33 ff                	xor    edi,edi
   140002aa5:	48 c7 41 2c 01 00 00 	mov    QWORD PTR [rcx+0x2c],0x1
   140002aac:	00 
   140002aad:	c7 41 34 1d 00 00 00 	mov    DWORD PTR [rcx+0x34],0x1d
   140002ab4:	89 b9 ec 02 00 00    	mov    DWORD PTR [rcx+0x2ec],edi
   140002aba:	8d 77 01             	lea    esi,[rdi+0x1]
   140002abd:	89 b9 94 01 00 00    	mov    DWORD PTR [rcx+0x194],edi
   140002ac3:	89 b9 9c 01 00 00    	mov    DWORD PTR [rcx+0x19c],edi
   140002ac9:	89 b9 d8 01 00 00    	mov    DWORD PTR [rcx+0x1d8],edi
   140002acf:	48 89 79 20          	mov    QWORD PTR [rcx+0x20],rdi
   140002ad3:	48 89 b9 38 02 00 00 	mov    QWORD PTR [rcx+0x238],rdi
   140002ada:	89 b9 40 02 00 00    	mov    DWORD PTR [rcx+0x240],edi
   140002ae0:	89 b9 88 01 00 00    	mov    DWORD PTR [rcx+0x188],edi
   140002ae6:	89 b9 78 01 00 00    	mov    DWORD PTR [rcx+0x178],edi
   140002aec:	4c 3b c6             	cmp    r8,rsi
   140002aef:	0f 84 82 0e 00 00    	je     0x140003977
   140002af5:	48 b8 00 00 00 00 00 	movabs rax,0x8000000000000000
   140002afc:	00 00 80 
   140002aff:	4c 3b c0             	cmp    r8,rax
   140002b02:	0f 87 6f 0e 00 00    	ja     0x140003977
   140002b08:	41 b9 40 00 00 00    	mov    r9d,0x40
   140002b0e:	41 8b c9             	mov    ecx,r9d
   140002b11:	d1 e9                	shr    ecx,1
   140002b13:	48 8b c6             	mov    rax,rsi
   140002b16:	48 d3 e0             	shl    rax,cl
   140002b19:	49 3b c0             	cmp    rax,r8
   140002b1c:	0f 84 7b 00 00 00    	je     0x140002b9d
   140002b22:	72 09                	jb     0x140002b2d
   140002b24:	40 84 ce             	test   sil,cl
   140002b27:	75 04                	jne    0x140002b2d
   140002b29:	3b ce                	cmp    ecx,esi
   140002b2b:	77 e4                	ja     0x140002b11
   140002b2d:	48 8b 05 4c bd 00 00 	mov    rax,QWORD PTR [rip+0xbd4c]        # 0x14000e880
   140002b34:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
   140002b38:	48 8b 05 41 bd 00 00 	mov    rax,QWORD PTR [rip+0xbd41]        # 0x14000e880
   140002b3f:	89 70 10             	mov    DWORD PTR [rax+0x10],esi
   140002b42:	48 8b 05 37 bd 00 00 	mov    rax,QWORD PTR [rip+0xbd37]        # 0x14000e880
   140002b49:	4c 89 00             	mov    QWORD PTR [rax],r8
   140002b4c:	4d 85 c0             	test   r8,r8
   140002b4f:	74 72                	je     0x140002bc3
   140002b51:	33 d2                	xor    edx,edx
   140002b53:	48 b8 00 00 00 00 00 	movabs rax,0x8000000000000000
   140002b5a:	00 00 80 
   140002b5d:	49 f7 f0             	div    r8
   140002b60:	4c 8b d0             	mov    r10,rax
   140002b63:	49 3b c0             	cmp    rax,r8
   140002b66:	72 5b                	jb     0x140002bc3
   140002b68:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140002b6f:	00 
   140002b70:	33 d2                	xor    edx,edx
   140002b72:	49 8b c2             	mov    rax,r10
   140002b75:	49 f7 f0             	div    r8
   140002b78:	49 8b c8             	mov    rcx,r8
   140002b7b:	4c 8b d0             	mov    r10,rax
   140002b7e:	48 8b 05 fb bc 00 00 	mov    rax,QWORD PTR [rip+0xbcfb]        # 0x14000e880
   140002b85:	48 0f af 08          	imul   rcx,QWORD PTR [rax]
   140002b89:	48 89 08             	mov    QWORD PTR [rax],rcx
   140002b8c:	48 8b 05 ed bc 00 00 	mov    rax,QWORD PTR [rip+0xbced]        # 0x14000e880
   140002b93:	ff 40 10             	inc    DWORD PTR [rax+0x10]
   140002b96:	4d 3b d0             	cmp    r10,r8
   140002b99:	73 d5                	jae    0x140002b70
   140002b9b:	eb 26                	jmp    0x140002bc3
   140002b9d:	48 8b 05 dc bc 00 00 	mov    rax,QWORD PTR [rip+0xbcdc]        # 0x14000e880
   140002ba4:	33 d2                	xor    edx,edx
   140002ba6:	4c 89 40 08          	mov    QWORD PTR [rax+0x8],r8
   140002baa:	41 8b c1             	mov    eax,r9d
   140002bad:	f7 f1                	div    ecx
   140002baf:	48 8b 0d ca bc 00 00 	mov    rcx,QWORD PTR [rip+0xbcca]        # 0x14000e880
   140002bb6:	89 41 10             	mov    DWORD PTR [rcx+0x10],eax
   140002bb9:	48 8b 05 c0 bc 00 00 	mov    rax,QWORD PTR [rip+0xbcc0]        # 0x14000e880
   140002bc0:	48 89 38             	mov    QWORD PTR [rax],rdi
   140002bc3:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140002bc6:	89 7b 14             	mov    DWORD PTR [rbx+0x14],edi
   140002bc9:	48 89 73 18          	mov    QWORD PTR [rbx+0x18],rsi
   140002bcd:	48 85 c0             	test   rax,rax
   140002bd0:	75 06                	jne    0x140002bd8
   140002bd2:	48 89 7b 18          	mov    QWORD PTR [rbx+0x18],rdi
   140002bd6:	eb 2a                	jmp    0x140002c02
   140002bd8:	44 8b cf             	mov    r9d,edi
   140002bdb:	48 3b c6             	cmp    rax,rsi
   140002bde:	76 26                	jbe    0x140002c06
   140002be0:	48 8b ce             	mov    rcx,rsi
   140002be3:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140002be7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140002bee:	00 00 
   140002bf0:	48 d1 e8             	shr    rax,1
   140002bf3:	48 03 c9             	add    rcx,rcx
   140002bf6:	41 ff c1             	inc    r9d
   140002bf9:	48 3b c6             	cmp    rax,rsi
   140002bfc:	77 f2                	ja     0x140002bf0
   140002bfe:	48 89 4b 18          	mov    QWORD PTR [rbx+0x18],rcx
   140002c02:	44 89 4b 14          	mov    DWORD PTR [rbx+0x14],r9d
   140002c06:	45 85 db             	test   r11d,r11d
   140002c09:	7e 0d                	jle    0x140002c18
   140002c0b:	41 8d 43 ff          	lea    eax,[r11-0x1]
   140002c0f:	99                   	cdq
   140002c10:	f7 7b 10             	idiv   DWORD PTR [rbx+0x10]
   140002c13:	8d 48 01             	lea    ecx,[rax+0x1]
   140002c16:	eb 10                	jmp    0x140002c28
   140002c18:	42 8d 04 dd 01 00 00 	lea    eax,[r11*8+0x1]
   140002c1f:	00 
   140002c20:	8b ce                	mov    ecx,esi
   140002c22:	99                   	cdq
   140002c23:	41 f7 f9             	idiv   r9d
   140002c26:	2b c8                	sub    ecx,eax
   140002c28:	48 63 c1             	movsxd rax,ecx
   140002c2b:	48 3b c6             	cmp    rax,rsi
   140002c2e:	48 0f 42 c6          	cmovb  rax,rsi
   140002c32:	8d 48 01             	lea    ecx,[rax+0x1]
   140002c35:	89 4b 28             	mov    DWORD PTR [rbx+0x28],ecx
   140002c38:	89 8b 20 03 00 00    	mov    DWORD PTR [rbx+0x320],ecx
   140002c3e:	89 8b 24 03 00 00    	mov    DWORD PTR [rbx+0x324],ecx
   140002c44:	83 f9 02             	cmp    ecx,0x2
   140002c47:	7e 29                	jle    0x140002c72
   140002c49:	b8 34 00 00 00       	mov    eax,0x34
   140002c4e:	99                   	cdq
   140002c4f:	41 f7 f9             	idiv   r9d
   140002c52:	44 8b c0             	mov    r8d,eax
   140002c55:	41 3b c8             	cmp    ecx,r8d
   140002c58:	7e 24                	jle    0x140002c7e
   140002c5a:	8d 41 01             	lea    eax,[rcx+0x1]
   140002c5d:	99                   	cdq
   140002c5e:	2b c2                	sub    eax,edx
   140002c60:	d1 f8                	sar    eax,1
   140002c62:	89 83 24 03 00 00    	mov    DWORD PTR [rbx+0x324],eax
   140002c68:	8b c8                	mov    ecx,eax
   140002c6a:	83 f8 02             	cmp    eax,0x2
   140002c6d:	7f e6                	jg     0x140002c55
   140002c6f:	83 f8 02             	cmp    eax,0x2
   140002c72:	7d 0a                	jge    0x140002c7e
   140002c74:	c7 83 24 03 00 00 02 	mov    DWORD PTR [rbx+0x324],0x2
   140002c7b:	00 00 00 
   140002c7e:	8b d6                	mov    edx,esi
   140002c80:	89 b3 90 00 00 00    	mov    DWORD PTR [rbx+0x90],esi
   140002c86:	b9 01 04 00 00       	mov    ecx,0x401
   140002c8b:	c7 83 fc 02 00 00 0a 	mov    DWORD PTR [rbx+0x2fc],0xa
   140002c92:	00 00 00 
   140002c95:	89 bb f0 02 00 00    	mov    DWORD PTR [rbx+0x2f0],edi
   140002c9b:	48 c7 83 f4 02 00 00 	mov    QWORD PTR [rbx+0x2f4],0x6
   140002ca2:	06 00 00 00 
   140002ca6:	89 b3 6c 01 00 00    	mov    DWORD PTR [rbx+0x16c],esi
   140002cac:	48 89 b3 00 03 00 00 	mov    QWORD PTR [rbx+0x300],rsi
   140002cb3:	89 bb 08 03 00 00    	mov    DWORD PTR [rbx+0x308],edi
   140002cb9:	c7 83 e8 02 00 00 00 	mov    DWORD PTR [rbx+0x2e8],0x400
   140002cc0:	04 00 00 
   140002cc3:	48 89 bb 10 03 00 00 	mov    QWORD PTR [rbx+0x310],rdi
   140002cca:	e8 81 28 00 00       	call   0x140005550
   140002ccf:	48 89 83 18 03 00 00 	mov    QWORD PTR [rbx+0x318],rax
   140002cd6:	40 88 38             	mov    BYTE PTR [rax],dil
   140002cd9:	c7 83 b0 00 00 00 55 	mov    DWORD PTR [rbx+0xb0],0x55555555
   140002ce0:	55 55 55 
   140002ce3:	c7 83 b4 00 00 00 78 	mov    DWORD PTR [rbx+0xb4],0x12345678
   140002cea:	56 34 12 
   140002ced:	48 89 bb ac 03 00 00 	mov    QWORD PTR [rbx+0x3ac],rdi
   140002cf4:	89 bb a8 03 00 00    	mov    DWORD PTR [rbx+0x3a8],edi
   140002cfa:	48 89 bb b4 03 00 00 	mov    QWORD PTR [rbx+0x3b4],rdi
   140002d01:	c7 83 b8 00 00 00 be 	mov    DWORD PTR [rbx+0xb8],0x7b0369be
   140002d08:	69 03 7b 
   140002d0b:	c7 83 bc 00 00 00 27 	mov    DWORD PTR [rbx+0xbc],0xa0b17e27
   140002d12:	7e b1 a0 
   140002d15:	c7 83 c0 00 00 00 d6 	mov    DWORD PTR [rbx+0xc0],0x2f2ea5d6
   140002d1c:	a5 2e 2f 
   140002d1f:	c7 83 c4 00 00 00 ee 	mov    DWORD PTR [rbx+0xc4],0xe359e1ee
   140002d26:	e1 59 e3 
   140002d29:	c7 83 c8 00 00 00 b5 	mov    DWORD PTR [rbx+0xc8],0x260245b5
   140002d30:	45 02 26 
   140002d33:	c7 83 cc 00 00 00 94 	mov    DWORD PTR [rbx+0xcc],0x1cd5e594
   140002d3a:	e5 d5 1c 
   140002d3d:	c7 83 d0 00 00 00 3a 	mov    DWORD PTR [rbx+0xd0],0x5651e93a
   140002d44:	e9 51 56 
   140002d47:	c7 83 d4 00 00 00 bf 	mov    DWORD PTR [rbx+0xd4],0x86a18cbf
   140002d4e:	8c a1 86 
   140002d51:	c7 83 d8 00 00 00 ea 	mov    DWORD PTR [rbx+0xd8],0xf06d33ea
   140002d58:	33 6d f0 
   140002d5b:	c7 83 dc 00 00 00 9a 	mov    DWORD PTR [rbx+0xdc],0x8a887e9a
   140002d62:	7e 88 8a 
   140002d65:	c7 83 e0 00 00 00 75 	mov    DWORD PTR [rbx+0xe0],0x8e6f7075
   140002d6c:	70 6f 8e 
   140002d6f:	c7 83 e4 00 00 00 00 	mov    DWORD PTR [rbx+0xe4],0x2c71ad00
   140002d76:	ad 71 2c 
   140002d79:	c7 83 e8 00 00 00 66 	mov    DWORD PTR [rbx+0xe8],0xce5adb66
   140002d80:	db 5a ce 
   140002d83:	c7 83 ec 00 00 00 57 	mov    DWORD PTR [rbx+0xec],0xe464657
   140002d8a:	46 46 0e 
   140002d8d:	c7 83 f0 00 00 00 ae 	mov    DWORD PTR [rbx+0xf0],0xf01adfae
   140002d94:	df 1a f0 
   140002d97:	c7 83 f4 00 00 00 f6 	mov    DWORD PTR [rbx+0xf4],0x11dae3f6
   140002d9e:	e3 da 11 
   140002da1:	c7 83 f8 00 00 00 95 	mov    DWORD PTR [rbx+0xf8],0x156f8195
   140002da8:	81 6f 15 
   140002dab:	c7 83 fc 00 00 00 7c 	mov    DWORD PTR [rbx+0xfc],0x3ac4237c
   140002db2:	23 c4 3a 
   140002db5:	c7 83 00 01 00 00 02 	mov    DWORD PTR [rbx+0x100],0x63ad6302
   140002dbc:	63 ad 63 
   140002dbf:	c7 83 04 01 00 00 6f 	mov    DWORD PTR [rbx+0x104],0xb1eb446f
   140002dc6:	44 eb b1 
   140002dc9:	c7 83 08 01 00 00 62 	mov    DWORD PTR [rbx+0x108],0x29126562
   140002dd0:	65 12 29 
   140002dd3:	c7 83 0c 01 00 00 c2 	mov    DWORD PTR [rbx+0x10c],0xee7767c2
   140002dda:	67 77 ee 
   140002ddd:	c7 83 10 01 00 00 15 	mov    DWORD PTR [rbx+0x110],0x2b038b15
   140002de4:	8b 03 2b 
   140002de7:	c7 83 14 01 00 00 c8 	mov    DWORD PTR [rbx+0x114],0x2cf4b0c8
   140002dee:	b0 f4 2c 
   140002df1:	c7 83 18 01 00 00 ce 	mov    DWORD PTR [rbx+0x118],0x6b71f9ce
   140002df8:	f9 71 6b 
   140002dfb:	c7 83 1c 01 00 00 87 	mov    DWORD PTR [rbx+0x11c],0xabe06887
   140002e02:	68 e0 ab 
   140002e05:	c7 83 20 01 00 00 46 	mov    DWORD PTR [rbx+0x120],0x2acc2046
   140002e0c:	20 cc 2a 
   140002e0f:	c7 83 24 01 00 00 be 	mov    DWORD PTR [rbx+0x124],0xea2646be
   140002e16:	46 26 ea 
   140002e19:	c7 83 28 01 00 00 f5 	mov    DWORD PTR [rbx+0x128],0x286c24f5
   140002e20:	24 6c 28 
   140002e23:	c7 83 2c 01 00 00 a4 	mov    DWORD PTR [rbx+0x12c],0x260c29a4
   140002e2a:	29 0c 26 
   140002e2d:	c7 83 30 01 00 00 8a 	mov    DWORD PTR [rbx+0x130],0x61f20c8a
   140002e34:	0c f2 61 
   140002e37:	c7 83 34 01 00 00 1f 	mov    DWORD PTR [rbx+0x134],0x9b77f41f
   140002e3e:	f4 77 9b 
   140002e41:	c7 83 38 01 00 00 9a 	mov    DWORD PTR [rbx+0x138],0x10e3be9a
   140002e48:	be e3 10 
   140002e4b:	c7 83 3c 01 00 00 aa 	mov    DWORD PTR [rbx+0x13c],0xbfd570aa
   140002e52:	70 d5 bf 
   140002e55:	c7 83 40 01 00 00 35 	mov    DWORD PTR [rbx+0x140],0xe432ed35
   140002e5c:	ed 32 e4 
   140002e5f:	8b 43 28             	mov    eax,DWORD PTR [rbx+0x28]
   140002e62:	48 c7 83 44 01 00 00 	mov    QWORD PTR [rbx+0x144],0x25
   140002e69:	25 00 00 00 
   140002e6d:	8d 0c 45 01 00 00 00 	lea    ecx,[rax*2+0x1]
   140002e74:	0f b7 c1             	movzx  eax,cx
   140002e77:	3b c8                	cmp    ecx,eax
   140002e79:	89 4b 28             	mov    DWORD PTR [rbx+0x28],ecx
   140002e7c:	48 8b 05 fd b9 00 00 	mov    rax,QWORD PTR [rip+0xb9fd]        # 0x14000e880
   140002e83:	0f 84 e9 00 00 00    	je     0x140002f72
   140002e89:	39 b8 ec 02 00 00    	cmp    DWORD PTR [rax+0x2ec],edi
   140002e8f:	74 1c                	je     0x140002ead
   140002e91:	c7 80 f0 02 00 00 0e 	mov    DWORD PTR [rax+0x2f0],0xe
   140002e98:	00 00 00 
   140002e9b:	8b 43 28             	mov    eax,DWORD PTR [rbx+0x28]
   140002e9e:	ff c8                	dec    eax
   140002ea0:	99                   	cdq
   140002ea1:	2b c2                	sub    eax,edx
   140002ea3:	d1 f8                	sar    eax,1
   140002ea5:	89 43 28             	mov    DWORD PTR [rbx+0x28],eax
   140002ea8:	e9 d4 0a 00 00       	jmp    0x140003981
   140002ead:	48 8d 0d 24 81 00 00 	lea    rcx,[rip+0x8124]        # 0x14000afd8
   140002eb4:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140002eb9:	e8 e2 0c 00 00       	call   0x140003ba0
   140002ebe:	48 8b 0d bb b9 00 00 	mov    rcx,QWORD PTR [rip+0xb9bb]        # 0x14000e880
   140002ec5:	4c 8d 35 34 b1 00 00 	lea    r14,[rip+0xb134]        # 0x14000e000
   140002ecc:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140002ed0:	83 f8 18             	cmp    eax,0x18
   140002ed3:	7d 0b                	jge    0x140002ee0
   140002ed5:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   140002eda:	49 8b 0c ce          	mov    rcx,QWORD PTR [r14+rcx*8]
   140002ede:	eb 07                	jmp    0x140002ee7
   140002ee0:	48 8d 0d 0d 81 00 00 	lea    rcx,[rip+0x810d]        # 0x14000aff4
   140002ee7:	e8 b4 0c 00 00       	call   0x140003ba0
   140002eec:	8b ce                	mov    ecx,esi
   140002eee:	e8 37 67 00 00       	call   0x14000962a
   140002ef3:	48 8b d0             	mov    rdx,rax
   140002ef6:	b9 0a 00 00 00       	mov    ecx,0xa
   140002efb:	e8 30 67 00 00       	call   0x140009630
   140002f00:	48 8b 05 79 b9 00 00 	mov    rax,QWORD PTR [rip+0xb979]        # 0x14000e880
   140002f07:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   140002f0a:	2b ce                	sub    ecx,esi
   140002f0c:	48 63 d9             	movsxd rbx,ecx
   140002f0f:	0f 88 82 0a 00 00    	js     0x140003997
   140002f15:	48 8d 3c 9d 30 00 00 	lea    rdi,[rbx*4+0x30]
   140002f1c:	00 
   140002f1d:	0f 1f 00             	nop    DWORD PTR [rax]
   140002f20:	48 8d 0d d1 80 00 00 	lea    rcx,[rip+0x80d1]        # 0x14000aff8
   140002f27:	e8 74 0c 00 00       	call   0x140003ba0
   140002f2c:	48 83 fb 18          	cmp    rbx,0x18
   140002f30:	73 11                	jae    0x140002f43
   140002f32:	48 8b 05 47 b9 00 00 	mov    rax,QWORD PTR [rip+0xb947]        # 0x14000e880
   140002f39:	48 63 0c 07          	movsxd rcx,DWORD PTR [rdi+rax*1]
   140002f3d:	49 8b 0c ce          	mov    rcx,QWORD PTR [r14+rcx*8]
   140002f41:	eb 07                	jmp    0x140002f4a
   140002f43:	48 8d 0d aa 80 00 00 	lea    rcx,[rip+0x80aa]        # 0x14000aff4
   140002f4a:	e8 51 0c 00 00       	call   0x140003ba0
   140002f4f:	8b ce                	mov    ecx,esi
   140002f51:	e8 d4 66 00 00       	call   0x14000962a
   140002f56:	48 8b d0             	mov    rdx,rax
   140002f59:	b9 0a 00 00 00       	mov    ecx,0xa
   140002f5e:	e8 cd 66 00 00       	call   0x140009630
   140002f63:	48 83 ef 04          	sub    rdi,0x4
   140002f67:	48 2b de             	sub    rbx,rsi
   140002f6a:	0f 88 27 0a 00 00    	js     0x140003997
   140002f70:	eb ae                	jmp    0x140002f20
   140002f72:	8b 40 28             	mov    eax,DWORD PTR [rax+0x28]
   140002f75:	8b d6                	mov    edx,esi
   140002f77:	ff c0                	inc    eax
   140002f79:	48 98                	cdqe
   140002f7b:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140002f82:	00 
   140002f83:	48 c1 e8 02          	shr    rax,0x2
   140002f87:	6b c8 70             	imul   ecx,eax,0x70
   140002f8a:	83 c1 74             	add    ecx,0x74
   140002f8d:	e8 be 25 00 00       	call   0x140005550
   140002f92:	48 89 83 a0 03 00 00 	mov    QWORD PTR [rbx+0x3a0],rax
   140002f99:	4c 8b d0             	mov    r10,rax
   140002f9c:	8b 43 28             	mov    eax,DWORD PTR [rbx+0x28]
   140002f9f:	41 b9 04 00 00 00    	mov    r9d,0x4
   140002fa5:	ff c8                	dec    eax
   140002fa7:	89 bb 84 01 00 00    	mov    DWORD PTR [rbx+0x184],edi
   140002fad:	99                   	cdq
   140002fae:	48 89 bb 94 00 00 00 	mov    QWORD PTR [rbx+0x94],rdi
   140002fb5:	2b c2                	sub    eax,edx
   140002fb7:	89 b3 9c 00 00 00    	mov    DWORD PTR [rbx+0x9c],esi
   140002fbd:	d1 f8                	sar    eax,1
   140002fbf:	89 43 28             	mov    DWORD PTR [rbx+0x28],eax
   140002fc2:	48 8b 05 b7 b8 00 00 	mov    rax,QWORD PTR [rip+0xb8b7]        # 0x14000e880
   140002fc9:	39 b8 f0 02 00 00    	cmp    DWORD PTR [rax+0x2f0],edi
   140002fcf:	74 05                	je     0x140002fd6
   140002fd1:	4c 8b c7             	mov    r8,rdi
   140002fd4:	eb 2c                	jmp    0x140003002
   140002fd6:	41 8b ca             	mov    ecx,r10d
   140002fd9:	41 8b c1             	mov    eax,r9d
   140002fdc:	83 e1 03             	and    ecx,0x3
   140002fdf:	2b c1                	sub    eax,ecx
   140002fe1:	85 c9                	test   ecx,ecx
   140002fe3:	0f 44 c7             	cmove  eax,edi
   140002fe6:	4c 63 c0             	movsxd r8,eax
   140002fe9:	4d 03 c2             	add    r8,r10
   140002fec:	49 8d 40 08          	lea    rax,[r8+0x8]
   140002ff0:	83 e0 07             	and    eax,0x7
   140002ff3:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140002ff7:	48 2b c8             	sub    rcx,rax
   140002ffa:	48 83 c1 10          	add    rcx,0x10
   140002ffe:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003002:	4c 89 83 48 02 00 00 	mov    QWORD PTR [rbx+0x248],r8
   140003009:	4c 8b 15 70 b8 00 00 	mov    r10,QWORD PTR [rip+0xb870]        # 0x14000e880
   140003010:	41 39 ba f0 02 00 00 	cmp    DWORD PTR [r10+0x2f0],edi
   140003017:	74 05                	je     0x14000301e
   140003019:	4c 8b c7             	mov    r8,rdi
   14000301c:	eb 4f                	jmp    0x14000306d
   14000301e:	4c 8b 83 a0 03 00 00 	mov    r8,QWORD PTR [rbx+0x3a0]
   140003025:	41 8b c1             	mov    eax,r9d
   140003028:	41 8b c8             	mov    ecx,r8d
   14000302b:	83 e1 03             	and    ecx,0x3
   14000302e:	2b c1                	sub    eax,ecx
   140003030:	85 c9                	test   ecx,ecx
   140003032:	0f 44 c7             	cmove  eax,edi
   140003035:	48 63 d0             	movsxd rdx,eax
   140003038:	41 8b 42 28          	mov    eax,DWORD PTR [r10+0x28]
   14000303c:	ff c0                	inc    eax
   14000303e:	48 98                	cdqe
   140003040:	48 8d 0c c5 0f 00 00 	lea    rcx,[rax*8+0xf]
   140003047:	00 
   140003048:	48 c1 e9 02          	shr    rcx,0x2
   14000304c:	49 8d 04 10          	lea    rax,[r8+rdx*1]
   140003050:	48 ff c1             	inc    rcx
   140003053:	4c 8d 04 c8          	lea    r8,[rax+rcx*8]
   140003057:	49 8d 40 08          	lea    rax,[r8+0x8]
   14000305b:	83 e0 07             	and    eax,0x7
   14000305e:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003062:	48 2b c8             	sub    rcx,rax
   140003065:	48 83 c1 10          	add    rcx,0x10
   140003069:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   14000306d:	4c 89 83 50 02 00 00 	mov    QWORD PTR [rbx+0x250],r8
   140003074:	4c 8b 15 05 b8 00 00 	mov    r10,QWORD PTR [rip+0xb805]        # 0x14000e880
   14000307b:	41 39 ba f0 02 00 00 	cmp    DWORD PTR [r10+0x2f0],edi
   140003082:	74 05                	je     0x140003089
   140003084:	4c 8b c7             	mov    r8,rdi
   140003087:	eb 53                	jmp    0x1400030dc
   140003089:	4c 8b 83 a0 03 00 00 	mov    r8,QWORD PTR [rbx+0x3a0]
   140003090:	41 8b c1             	mov    eax,r9d
   140003093:	41 8b c8             	mov    ecx,r8d
   140003096:	83 e1 03             	and    ecx,0x3
   140003099:	2b c1                	sub    eax,ecx
   14000309b:	85 c9                	test   ecx,ecx
   14000309d:	0f 44 c7             	cmove  eax,edi
   1400030a0:	48 63 d0             	movsxd rdx,eax
   1400030a3:	41 8b 42 28          	mov    eax,DWORD PTR [r10+0x28]
   1400030a7:	ff c0                	inc    eax
   1400030a9:	48 98                	cdqe
   1400030ab:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400030b2:	00 
   1400030b3:	48 c1 e8 02          	shr    rax,0x2
   1400030b7:	48 ff c0             	inc    rax
   1400030ba:	48 8d 0c 40          	lea    rcx,[rax+rax*2]
   1400030be:	49 8d 04 10          	lea    rax,[r8+rdx*1]
   1400030c2:	4c 8d 04 88          	lea    r8,[rax+rcx*4]
   1400030c6:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400030ca:	83 e0 07             	and    eax,0x7
   1400030cd:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400030d1:	48 2b c8             	sub    rcx,rax
   1400030d4:	48 83 c1 10          	add    rcx,0x10
   1400030d8:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   1400030dc:	4c 89 83 58 02 00 00 	mov    QWORD PTR [rbx+0x258],r8
   1400030e3:	4c 8b 05 96 b7 00 00 	mov    r8,QWORD PTR [rip+0xb796]        # 0x14000e880
   1400030ea:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   1400030f1:	74 05                	je     0x1400030f8
   1400030f3:	4c 8b c7             	mov    r8,rdi
   1400030f6:	eb 51                	jmp    0x140003149
   1400030f8:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   1400030ff:	41 8b c1             	mov    eax,r9d
   140003102:	8b ca                	mov    ecx,edx
   140003104:	83 e1 03             	and    ecx,0x3
   140003107:	2b c1                	sub    eax,ecx
   140003109:	85 c9                	test   ecx,ecx
   14000310b:	0f 44 c7             	cmove  eax,edi
   14000310e:	48 63 c8             	movsxd rcx,eax
   140003111:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003115:	ff c0                	inc    eax
   140003117:	48 98                	cdqe
   140003119:	4c 8d 04 c5 0f 00 00 	lea    r8,[rax*8+0xf]
   140003120:	00 
   140003121:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003125:	49 c1 e8 02          	shr    r8,0x2
   140003129:	49 ff c0             	inc    r8
   14000312c:	49 c1 e0 04          	shl    r8,0x4
   140003130:	4c 03 c0             	add    r8,rax
   140003133:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003137:	83 e0 07             	and    eax,0x7
   14000313a:	49 8d 48 08          	lea    rcx,[r8+0x8]
   14000313e:	48 2b c8             	sub    rcx,rax
   140003141:	48 83 c1 10          	add    rcx,0x10
   140003145:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003149:	4c 89 83 60 02 00 00 	mov    QWORD PTR [rbx+0x260],r8
   140003150:	4c 8b 15 29 b7 00 00 	mov    r10,QWORD PTR [rip+0xb729]        # 0x14000e880
   140003157:	41 39 ba f0 02 00 00 	cmp    DWORD PTR [r10+0x2f0],edi
   14000315e:	74 05                	je     0x140003165
   140003160:	4c 8b c7             	mov    r8,rdi
   140003163:	eb 53                	jmp    0x1400031b8
   140003165:	4c 8b 83 a0 03 00 00 	mov    r8,QWORD PTR [rbx+0x3a0]
   14000316c:	41 8b c1             	mov    eax,r9d
   14000316f:	41 8b c8             	mov    ecx,r8d
   140003172:	83 e1 03             	and    ecx,0x3
   140003175:	2b c1                	sub    eax,ecx
   140003177:	85 c9                	test   ecx,ecx
   140003179:	0f 44 c7             	cmove  eax,edi
   14000317c:	48 63 d0             	movsxd rdx,eax
   14000317f:	41 8b 42 28          	mov    eax,DWORD PTR [r10+0x28]
   140003183:	ff c0                	inc    eax
   140003185:	48 98                	cdqe
   140003187:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   14000318e:	00 
   14000318f:	48 c1 e8 02          	shr    rax,0x2
   140003193:	48 ff c0             	inc    rax
   140003196:	48 8d 0c 80          	lea    rcx,[rax+rax*4]
   14000319a:	49 8d 04 10          	lea    rax,[r8+rdx*1]
   14000319e:	4c 8d 04 88          	lea    r8,[rax+rcx*4]
   1400031a2:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400031a6:	83 e0 07             	and    eax,0x7
   1400031a9:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400031ad:	48 2b c8             	sub    rcx,rax
   1400031b0:	48 83 c1 10          	add    rcx,0x10
   1400031b4:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   1400031b8:	4c 89 83 68 02 00 00 	mov    QWORD PTR [rbx+0x268],r8
   1400031bf:	4c 8b 15 ba b6 00 00 	mov    r10,QWORD PTR [rip+0xb6ba]        # 0x14000e880
   1400031c6:	41 39 ba f0 02 00 00 	cmp    DWORD PTR [r10+0x2f0],edi
   1400031cd:	74 05                	je     0x1400031d4
   1400031cf:	4c 8b c7             	mov    r8,rdi
   1400031d2:	eb 53                	jmp    0x140003227
   1400031d4:	4c 8b 83 a0 03 00 00 	mov    r8,QWORD PTR [rbx+0x3a0]
   1400031db:	41 8b c1             	mov    eax,r9d
   1400031de:	41 8b c8             	mov    ecx,r8d
   1400031e1:	83 e1 03             	and    ecx,0x3
   1400031e4:	2b c1                	sub    eax,ecx
   1400031e6:	85 c9                	test   ecx,ecx
   1400031e8:	0f 44 c7             	cmove  eax,edi
   1400031eb:	48 63 d0             	movsxd rdx,eax
   1400031ee:	41 8b 42 28          	mov    eax,DWORD PTR [r10+0x28]
   1400031f2:	ff c0                	inc    eax
   1400031f4:	48 98                	cdqe
   1400031f6:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400031fd:	00 
   1400031fe:	48 c1 e8 02          	shr    rax,0x2
   140003202:	48 ff c0             	inc    rax
   140003205:	48 8d 0c 40          	lea    rcx,[rax+rax*2]
   140003209:	49 8d 04 10          	lea    rax,[r8+rdx*1]
   14000320d:	4c 8d 04 c8          	lea    r8,[rax+rcx*8]
   140003211:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003215:	83 e0 07             	and    eax,0x7
   140003218:	49 8d 48 08          	lea    rcx,[r8+0x8]
   14000321c:	48 2b c8             	sub    rcx,rax
   14000321f:	48 83 c1 10          	add    rcx,0x10
   140003223:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003227:	4c 89 83 70 02 00 00 	mov    QWORD PTR [rbx+0x270],r8
   14000322e:	4c 8b 05 4b b6 00 00 	mov    r8,QWORD PTR [rip+0xb64b]        # 0x14000e880
   140003235:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   14000323c:	74 05                	je     0x140003243
   14000323e:	4c 8b c7             	mov    r8,rdi
   140003241:	eb 51                	jmp    0x140003294
   140003243:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   14000324a:	41 8b c1             	mov    eax,r9d
   14000324d:	8b ca                	mov    ecx,edx
   14000324f:	83 e1 03             	and    ecx,0x3
   140003252:	2b c1                	sub    eax,ecx
   140003254:	85 c9                	test   ecx,ecx
   140003256:	0f 44 c7             	cmove  eax,edi
   140003259:	48 63 c8             	movsxd rcx,eax
   14000325c:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003260:	ff c0                	inc    eax
   140003262:	48 98                	cdqe
   140003264:	4c 8d 04 c5 0f 00 00 	lea    r8,[rax*8+0xf]
   14000326b:	00 
   14000326c:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003270:	49 c1 e8 02          	shr    r8,0x2
   140003274:	49 ff c0             	inc    r8
   140003277:	49 c1 e0 05          	shl    r8,0x5
   14000327b:	4c 03 c0             	add    r8,rax
   14000327e:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003282:	83 e0 07             	and    eax,0x7
   140003285:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003289:	48 2b c8             	sub    rcx,rax
   14000328c:	48 83 c1 10          	add    rcx,0x10
   140003290:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003294:	4c 89 83 78 02 00 00 	mov    QWORD PTR [rbx+0x278],r8
   14000329b:	4c 8b 15 de b5 00 00 	mov    r10,QWORD PTR [rip+0xb5de]        # 0x14000e880
   1400032a2:	41 39 ba f0 02 00 00 	cmp    DWORD PTR [r10+0x2f0],edi
   1400032a9:	74 05                	je     0x1400032b0
   1400032ab:	4c 8b c7             	mov    r8,rdi
   1400032ae:	eb 53                	jmp    0x140003303
   1400032b0:	4c 8b 83 a0 03 00 00 	mov    r8,QWORD PTR [rbx+0x3a0]
   1400032b7:	41 8b c1             	mov    eax,r9d
   1400032ba:	41 8b c8             	mov    ecx,r8d
   1400032bd:	83 e1 03             	and    ecx,0x3
   1400032c0:	2b c1                	sub    eax,ecx
   1400032c2:	85 c9                	test   ecx,ecx
   1400032c4:	0f 44 c7             	cmove  eax,edi
   1400032c7:	48 63 d0             	movsxd rdx,eax
   1400032ca:	41 8b 42 28          	mov    eax,DWORD PTR [r10+0x28]
   1400032ce:	ff c0                	inc    eax
   1400032d0:	48 98                	cdqe
   1400032d2:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400032d9:	00 
   1400032da:	48 c1 e8 02          	shr    rax,0x2
   1400032de:	48 ff c0             	inc    rax
   1400032e1:	48 8d 0c 80          	lea    rcx,[rax+rax*4]
   1400032e5:	49 8d 04 10          	lea    rax,[r8+rdx*1]
   1400032e9:	4c 8d 04 c8          	lea    r8,[rax+rcx*8]
   1400032ed:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400032f1:	83 e0 07             	and    eax,0x7
   1400032f4:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400032f8:	48 2b c8             	sub    rcx,rax
   1400032fb:	48 83 c1 10          	add    rcx,0x10
   1400032ff:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003303:	4c 89 83 80 02 00 00 	mov    QWORD PTR [rbx+0x280],r8
   14000330a:	4c 8b 05 6f b5 00 00 	mov    r8,QWORD PTR [rip+0xb56f]        # 0x14000e880
   140003311:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003318:	74 05                	je     0x14000331f
   14000331a:	4c 8b c7             	mov    r8,rdi
   14000331d:	eb 55                	jmp    0x140003374
   14000331f:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003326:	41 8b c1             	mov    eax,r9d
   140003329:	8b ca                	mov    ecx,edx
   14000332b:	83 e1 03             	and    ecx,0x3
   14000332e:	2b c1                	sub    eax,ecx
   140003330:	85 c9                	test   ecx,ecx
   140003332:	0f 44 c7             	cmove  eax,edi
   140003335:	48 63 c8             	movsxd rcx,eax
   140003338:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   14000333c:	ff c0                	inc    eax
   14000333e:	48 98                	cdqe
   140003340:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003347:	00 
   140003348:	48 c1 e8 02          	shr    rax,0x2
   14000334c:	48 ff c0             	inc    rax
   14000334f:	4c 8d 04 40          	lea    r8,[rax+rax*2]
   140003353:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003357:	49 c1 e0 04          	shl    r8,0x4
   14000335b:	4c 03 c0             	add    r8,rax
   14000335e:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003362:	83 e0 07             	and    eax,0x7
   140003365:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003369:	48 2b c8             	sub    rcx,rax
   14000336c:	48 83 c1 10          	add    rcx,0x10
   140003370:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003374:	4c 89 83 88 02 00 00 	mov    QWORD PTR [rbx+0x288],r8
   14000337b:	4c 8b 05 fe b4 00 00 	mov    r8,QWORD PTR [rip+0xb4fe]        # 0x14000e880
   140003382:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003389:	74 05                	je     0x140003390
   14000338b:	4c 8b c7             	mov    r8,rdi
   14000338e:	eb 51                	jmp    0x1400033e1
   140003390:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003397:	41 8b c1             	mov    eax,r9d
   14000339a:	8b ca                	mov    ecx,edx
   14000339c:	83 e1 03             	and    ecx,0x3
   14000339f:	2b c1                	sub    eax,ecx
   1400033a1:	85 c9                	test   ecx,ecx
   1400033a3:	0f 44 c7             	cmove  eax,edi
   1400033a6:	48 63 c8             	movsxd rcx,eax
   1400033a9:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   1400033ad:	ff c0                	inc    eax
   1400033af:	48 98                	cdqe
   1400033b1:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400033b8:	00 
   1400033b9:	48 c1 e8 02          	shr    rax,0x2
   1400033bd:	48 ff c0             	inc    rax
   1400033c0:	4c 6b c0 34          	imul   r8,rax,0x34
   1400033c4:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   1400033c8:	4c 03 c0             	add    r8,rax
   1400033cb:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400033cf:	83 e0 07             	and    eax,0x7
   1400033d2:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400033d6:	48 2b c8             	sub    rcx,rax
   1400033d9:	48 83 c1 10          	add    rcx,0x10
   1400033dd:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   1400033e1:	4c 89 83 90 02 00 00 	mov    QWORD PTR [rbx+0x290],r8
   1400033e8:	4c 8b 05 91 b4 00 00 	mov    r8,QWORD PTR [rip+0xb491]        # 0x14000e880
   1400033ef:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   1400033f6:	74 05                	je     0x1400033fd
   1400033f8:	4c 8b c7             	mov    r8,rdi
   1400033fb:	eb 51                	jmp    0x14000344e
   1400033fd:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003404:	41 8b c1             	mov    eax,r9d
   140003407:	8b ca                	mov    ecx,edx
   140003409:	83 e1 03             	and    ecx,0x3
   14000340c:	2b c1                	sub    eax,ecx
   14000340e:	85 c9                	test   ecx,ecx
   140003410:	0f 44 c7             	cmove  eax,edi
   140003413:	48 63 c8             	movsxd rcx,eax
   140003416:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   14000341a:	ff c0                	inc    eax
   14000341c:	48 98                	cdqe
   14000341e:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003425:	00 
   140003426:	48 c1 e8 02          	shr    rax,0x2
   14000342a:	48 ff c0             	inc    rax
   14000342d:	4c 6b c0 38          	imul   r8,rax,0x38
   140003431:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003435:	4c 03 c0             	add    r8,rax
   140003438:	49 8d 40 08          	lea    rax,[r8+0x8]
   14000343c:	83 e0 07             	and    eax,0x7
   14000343f:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003443:	48 2b c8             	sub    rcx,rax
   140003446:	48 83 c1 10          	add    rcx,0x10
   14000344a:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   14000344e:	4c 89 83 98 02 00 00 	mov    QWORD PTR [rbx+0x298],r8
   140003455:	4c 8b 05 24 b4 00 00 	mov    r8,QWORD PTR [rip+0xb424]        # 0x14000e880
   14000345c:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003463:	74 05                	je     0x14000346a
   140003465:	4c 8b c7             	mov    r8,rdi
   140003468:	eb 51                	jmp    0x1400034bb
   14000346a:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003471:	41 8b c1             	mov    eax,r9d
   140003474:	8b ca                	mov    ecx,edx
   140003476:	83 e1 03             	and    ecx,0x3
   140003479:	2b c1                	sub    eax,ecx
   14000347b:	85 c9                	test   ecx,ecx
   14000347d:	0f 44 c7             	cmove  eax,edi
   140003480:	48 63 c8             	movsxd rcx,eax
   140003483:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003487:	ff c0                	inc    eax
   140003489:	48 98                	cdqe
   14000348b:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003492:	00 
   140003493:	48 c1 e8 02          	shr    rax,0x2
   140003497:	48 ff c0             	inc    rax
   14000349a:	4c 6b c0 3c          	imul   r8,rax,0x3c
   14000349e:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   1400034a2:	4c 03 c0             	add    r8,rax
   1400034a5:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400034a9:	83 e0 07             	and    eax,0x7
   1400034ac:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400034b0:	48 2b c8             	sub    rcx,rax
   1400034b3:	48 83 c1 10          	add    rcx,0x10
   1400034b7:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   1400034bb:	4c 89 83 a0 02 00 00 	mov    QWORD PTR [rbx+0x2a0],r8
   1400034c2:	4c 8b 05 b7 b3 00 00 	mov    r8,QWORD PTR [rip+0xb3b7]        # 0x14000e880
   1400034c9:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   1400034d0:	74 05                	je     0x1400034d7
   1400034d2:	4c 8b c7             	mov    r8,rdi
   1400034d5:	eb 51                	jmp    0x140003528
   1400034d7:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   1400034de:	41 8b c1             	mov    eax,r9d
   1400034e1:	8b ca                	mov    ecx,edx
   1400034e3:	83 e1 03             	and    ecx,0x3
   1400034e6:	2b c1                	sub    eax,ecx
   1400034e8:	85 c9                	test   ecx,ecx
   1400034ea:	0f 44 c7             	cmove  eax,edi
   1400034ed:	48 63 c8             	movsxd rcx,eax
   1400034f0:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   1400034f4:	ff c0                	inc    eax
   1400034f6:	48 98                	cdqe
   1400034f8:	4c 8d 04 c5 0f 00 00 	lea    r8,[rax*8+0xf]
   1400034ff:	00 
   140003500:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003504:	49 c1 e8 02          	shr    r8,0x2
   140003508:	49 ff c0             	inc    r8
   14000350b:	49 c1 e0 06          	shl    r8,0x6
   14000350f:	4c 03 c0             	add    r8,rax
   140003512:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003516:	83 e0 07             	and    eax,0x7
   140003519:	49 8d 48 08          	lea    rcx,[r8+0x8]
   14000351d:	48 2b c8             	sub    rcx,rax
   140003520:	48 83 c1 10          	add    rcx,0x10
   140003524:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003528:	4c 89 83 a8 02 00 00 	mov    QWORD PTR [rbx+0x2a8],r8
   14000352f:	4c 8b 05 4a b3 00 00 	mov    r8,QWORD PTR [rip+0xb34a]        # 0x14000e880
   140003536:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   14000353d:	74 05                	je     0x140003544
   14000353f:	4c 8b c7             	mov    r8,rdi
   140003542:	eb 51                	jmp    0x140003595
   140003544:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   14000354b:	41 8b c1             	mov    eax,r9d
   14000354e:	8b ca                	mov    ecx,edx
   140003550:	83 e1 03             	and    ecx,0x3
   140003553:	2b c1                	sub    eax,ecx
   140003555:	85 c9                	test   ecx,ecx
   140003557:	0f 44 c7             	cmove  eax,edi
   14000355a:	48 63 c8             	movsxd rcx,eax
   14000355d:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003561:	ff c0                	inc    eax
   140003563:	48 98                	cdqe
   140003565:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   14000356c:	00 
   14000356d:	48 c1 e8 02          	shr    rax,0x2
   140003571:	48 ff c0             	inc    rax
   140003574:	4c 6b c0 44          	imul   r8,rax,0x44
   140003578:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   14000357c:	4c 03 c0             	add    r8,rax
   14000357f:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003583:	83 e0 07             	and    eax,0x7
   140003586:	49 8d 48 08          	lea    rcx,[r8+0x8]
   14000358a:	48 2b c8             	sub    rcx,rax
   14000358d:	48 83 c1 10          	add    rcx,0x10
   140003591:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003595:	4c 89 83 b0 02 00 00 	mov    QWORD PTR [rbx+0x2b0],r8
   14000359c:	4c 8b 15 dd b2 00 00 	mov    r10,QWORD PTR [rip+0xb2dd]        # 0x14000e880
   1400035a3:	41 39 ba f0 02 00 00 	cmp    DWORD PTR [r10+0x2f0],edi
   1400035aa:	74 05                	je     0x1400035b1
   1400035ac:	4c 8b c7             	mov    r8,rdi
   1400035af:	eb 53                	jmp    0x140003604
   1400035b1:	4c 8b 83 a0 03 00 00 	mov    r8,QWORD PTR [rbx+0x3a0]
   1400035b8:	41 8b c1             	mov    eax,r9d
   1400035bb:	41 8b c8             	mov    ecx,r8d
   1400035be:	83 e1 03             	and    ecx,0x3
   1400035c1:	2b c1                	sub    eax,ecx
   1400035c3:	85 c9                	test   ecx,ecx
   1400035c5:	0f 44 c7             	cmove  eax,edi
   1400035c8:	48 63 d0             	movsxd rdx,eax
   1400035cb:	41 8b 42 28          	mov    eax,DWORD PTR [r10+0x28]
   1400035cf:	ff c0                	inc    eax
   1400035d1:	48 98                	cdqe
   1400035d3:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400035da:	00 
   1400035db:	48 c1 e8 02          	shr    rax,0x2
   1400035df:	48 ff c0             	inc    rax
   1400035e2:	48 8d 0c c0          	lea    rcx,[rax+rax*8]
   1400035e6:	49 8d 04 10          	lea    rax,[r8+rdx*1]
   1400035ea:	4c 8d 04 c8          	lea    r8,[rax+rcx*8]
   1400035ee:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400035f2:	83 e0 07             	and    eax,0x7
   1400035f5:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400035f9:	48 2b c8             	sub    rcx,rax
   1400035fc:	48 83 c1 10          	add    rcx,0x10
   140003600:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003604:	4c 89 83 b8 02 00 00 	mov    QWORD PTR [rbx+0x2b8],r8
   14000360b:	4c 8b 05 6e b2 00 00 	mov    r8,QWORD PTR [rip+0xb26e]        # 0x14000e880
   140003612:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003619:	74 05                	je     0x140003620
   14000361b:	4c 8b c7             	mov    r8,rdi
   14000361e:	eb 51                	jmp    0x140003671
   140003620:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003627:	41 8b c1             	mov    eax,r9d
   14000362a:	8b ca                	mov    ecx,edx
   14000362c:	83 e1 03             	and    ecx,0x3
   14000362f:	2b c1                	sub    eax,ecx
   140003631:	85 c9                	test   ecx,ecx
   140003633:	0f 44 c7             	cmove  eax,edi
   140003636:	48 63 c8             	movsxd rcx,eax
   140003639:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   14000363d:	ff c0                	inc    eax
   14000363f:	48 98                	cdqe
   140003641:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003648:	00 
   140003649:	48 c1 e8 02          	shr    rax,0x2
   14000364d:	48 ff c0             	inc    rax
   140003650:	4c 6b c0 4c          	imul   r8,rax,0x4c
   140003654:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003658:	4c 03 c0             	add    r8,rax
   14000365b:	49 8d 40 08          	lea    rax,[r8+0x8]
   14000365f:	83 e0 07             	and    eax,0x7
   140003662:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003666:	48 2b c8             	sub    rcx,rax
   140003669:	48 83 c1 10          	add    rcx,0x10
   14000366d:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003671:	4c 89 83 c0 02 00 00 	mov    QWORD PTR [rbx+0x2c0],r8
   140003678:	4c 8b 05 01 b2 00 00 	mov    r8,QWORD PTR [rip+0xb201]        # 0x14000e880
   14000367f:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003686:	74 05                	je     0x14000368d
   140003688:	4c 8b c7             	mov    r8,rdi
   14000368b:	eb 55                	jmp    0x1400036e2
   14000368d:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003694:	41 8b c1             	mov    eax,r9d
   140003697:	8b ca                	mov    ecx,edx
   140003699:	83 e1 03             	and    ecx,0x3
   14000369c:	2b c1                	sub    eax,ecx
   14000369e:	85 c9                	test   ecx,ecx
   1400036a0:	0f 44 c7             	cmove  eax,edi
   1400036a3:	48 63 c8             	movsxd rcx,eax
   1400036a6:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   1400036aa:	ff c0                	inc    eax
   1400036ac:	48 98                	cdqe
   1400036ae:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400036b5:	00 
   1400036b6:	48 c1 e8 02          	shr    rax,0x2
   1400036ba:	48 ff c0             	inc    rax
   1400036bd:	4c 8d 04 80          	lea    r8,[rax+rax*4]
   1400036c1:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   1400036c5:	49 c1 e0 04          	shl    r8,0x4
   1400036c9:	4c 03 c0             	add    r8,rax
   1400036cc:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400036d0:	83 e0 07             	and    eax,0x7
   1400036d3:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400036d7:	48 2b c8             	sub    rcx,rax
   1400036da:	48 83 c1 10          	add    rcx,0x10
   1400036de:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   1400036e2:	4c 89 83 c8 02 00 00 	mov    QWORD PTR [rbx+0x2c8],r8
   1400036e9:	4c 8b 05 90 b1 00 00 	mov    r8,QWORD PTR [rip+0xb190]        # 0x14000e880
   1400036f0:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   1400036f7:	74 05                	je     0x1400036fe
   1400036f9:	4c 8b c7             	mov    r8,rdi
   1400036fc:	eb 51                	jmp    0x14000374f
   1400036fe:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003705:	41 8b c1             	mov    eax,r9d
   140003708:	8b ca                	mov    ecx,edx
   14000370a:	83 e1 03             	and    ecx,0x3
   14000370d:	2b c1                	sub    eax,ecx
   14000370f:	85 c9                	test   ecx,ecx
   140003711:	0f 44 c7             	cmove  eax,edi
   140003714:	48 63 c8             	movsxd rcx,eax
   140003717:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   14000371b:	ff c0                	inc    eax
   14000371d:	48 98                	cdqe
   14000371f:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003726:	00 
   140003727:	48 c1 e8 02          	shr    rax,0x2
   14000372b:	48 ff c0             	inc    rax
   14000372e:	4c 6b c0 54          	imul   r8,rax,0x54
   140003732:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003736:	4c 03 c0             	add    r8,rax
   140003739:	49 8d 40 08          	lea    rax,[r8+0x8]
   14000373d:	83 e0 07             	and    eax,0x7
   140003740:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003744:	48 2b c8             	sub    rcx,rax
   140003747:	48 83 c1 10          	add    rcx,0x10
   14000374b:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   14000374f:	4c 89 83 58 01 00 00 	mov    QWORD PTR [rbx+0x158],r8
   140003756:	4c 8b 05 23 b1 00 00 	mov    r8,QWORD PTR [rip+0xb123]        # 0x14000e880
   14000375d:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003764:	74 05                	je     0x14000376b
   140003766:	4c 8b c7             	mov    r8,rdi
   140003769:	eb 51                	jmp    0x1400037bc
   14000376b:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003772:	41 8b c1             	mov    eax,r9d
   140003775:	8b ca                	mov    ecx,edx
   140003777:	83 e1 03             	and    ecx,0x3
   14000377a:	2b c1                	sub    eax,ecx
   14000377c:	85 c9                	test   ecx,ecx
   14000377e:	0f 44 c7             	cmove  eax,edi
   140003781:	48 63 c8             	movsxd rcx,eax
   140003784:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003788:	ff c0                	inc    eax
   14000378a:	48 98                	cdqe
   14000378c:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003793:	00 
   140003794:	48 c1 e8 02          	shr    rax,0x2
   140003798:	48 ff c0             	inc    rax
   14000379b:	4c 6b c0 58          	imul   r8,rax,0x58
   14000379f:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   1400037a3:	4c 03 c0             	add    r8,rax
   1400037a6:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400037aa:	83 e0 07             	and    eax,0x7
   1400037ad:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400037b1:	48 2b c8             	sub    rcx,rax
   1400037b4:	48 83 c1 10          	add    rcx,0x10
   1400037b8:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   1400037bc:	4c 89 83 60 01 00 00 	mov    QWORD PTR [rbx+0x160],r8
   1400037c3:	4c 8b 05 b6 b0 00 00 	mov    r8,QWORD PTR [rip+0xb0b6]        # 0x14000e880
   1400037ca:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   1400037d1:	74 05                	je     0x1400037d8
   1400037d3:	4c 8b c7             	mov    r8,rdi
   1400037d6:	eb 55                	jmp    0x14000382d
   1400037d8:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   1400037df:	41 8b c1             	mov    eax,r9d
   1400037e2:	8b ca                	mov    ecx,edx
   1400037e4:	83 e1 03             	and    ecx,0x3
   1400037e7:	2b c1                	sub    eax,ecx
   1400037e9:	85 c9                	test   ecx,ecx
   1400037eb:	0f 44 c7             	cmove  eax,edi
   1400037ee:	48 63 c8             	movsxd rcx,eax
   1400037f1:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   1400037f5:	ff c0                	inc    eax
   1400037f7:	48 98                	cdqe
   1400037f9:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003800:	00 
   140003801:	48 c1 e8 02          	shr    rax,0x2
   140003805:	48 ff c0             	inc    rax
   140003808:	4c 8d 04 40          	lea    r8,[rax+rax*2]
   14000380c:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003810:	49 c1 e0 05          	shl    r8,0x5
   140003814:	4c 03 c0             	add    r8,rax
   140003817:	49 8d 40 08          	lea    rax,[r8+0x8]
   14000381b:	83 e0 07             	and    eax,0x7
   14000381e:	49 8d 48 08          	lea    rcx,[r8+0x8]
   140003822:	48 2b c8             	sub    rcx,rax
   140003825:	48 83 c1 10          	add    rcx,0x10
   140003829:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   14000382d:	4c 89 83 d8 02 00 00 	mov    QWORD PTR [rbx+0x2d8],r8
   140003834:	4c 8b 05 45 b0 00 00 	mov    r8,QWORD PTR [rip+0xb045]        # 0x14000e880
   14000383b:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   140003842:	74 05                	je     0x140003849
   140003844:	4c 8b c7             	mov    r8,rdi
   140003847:	eb 51                	jmp    0x14000389a
   140003849:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003850:	41 8b c1             	mov    eax,r9d
   140003853:	8b ca                	mov    ecx,edx
   140003855:	83 e1 03             	and    ecx,0x3
   140003858:	2b c1                	sub    eax,ecx
   14000385a:	85 c9                	test   ecx,ecx
   14000385c:	0f 44 c7             	cmove  eax,edi
   14000385f:	48 63 c8             	movsxd rcx,eax
   140003862:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003866:	ff c0                	inc    eax
   140003868:	48 98                	cdqe
   14000386a:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003871:	00 
   140003872:	48 c1 e8 02          	shr    rax,0x2
   140003876:	48 ff c0             	inc    rax
   140003879:	4c 6b c0 64          	imul   r8,rax,0x64
   14000387d:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003881:	4c 03 c0             	add    r8,rax
   140003884:	49 8d 40 08          	lea    rax,[r8+0x8]
   140003888:	83 e0 07             	and    eax,0x7
   14000388b:	49 8d 48 08          	lea    rcx,[r8+0x8]
   14000388f:	48 2b c8             	sub    rcx,rax
   140003892:	48 83 c1 10          	add    rcx,0x10
   140003896:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   14000389a:	4c 89 83 e0 02 00 00 	mov    QWORD PTR [rbx+0x2e0],r8
   1400038a1:	4c 8b 05 d8 af 00 00 	mov    r8,QWORD PTR [rip+0xafd8]        # 0x14000e880
   1400038a8:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   1400038af:	74 05                	je     0x1400038b6
   1400038b1:	4c 8b c7             	mov    r8,rdi
   1400038b4:	eb 51                	jmp    0x140003907
   1400038b6:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   1400038bd:	41 8b c1             	mov    eax,r9d
   1400038c0:	8b ca                	mov    ecx,edx
   1400038c2:	83 e1 03             	and    ecx,0x3
   1400038c5:	2b c1                	sub    eax,ecx
   1400038c7:	85 c9                	test   ecx,ecx
   1400038c9:	0f 44 c7             	cmove  eax,edi
   1400038cc:	48 63 c8             	movsxd rcx,eax
   1400038cf:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   1400038d3:	ff c0                	inc    eax
   1400038d5:	48 98                	cdqe
   1400038d7:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   1400038de:	00 
   1400038df:	48 c1 e8 02          	shr    rax,0x2
   1400038e3:	48 ff c0             	inc    rax
   1400038e6:	4c 6b c0 68          	imul   r8,rax,0x68
   1400038ea:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   1400038ee:	4c 03 c0             	add    r8,rax
   1400038f1:	49 8d 40 08          	lea    rax,[r8+0x8]
   1400038f5:	83 e0 07             	and    eax,0x7
   1400038f8:	49 8d 48 08          	lea    rcx,[r8+0x8]
   1400038fc:	48 2b c8             	sub    rcx,rax
   1400038ff:	48 83 c1 10          	add    rcx,0x10
   140003903:	49 89 48 08          	mov    QWORD PTR [r8+0x8],rcx
   140003907:	4c 89 83 d0 02 00 00 	mov    QWORD PTR [rbx+0x2d0],r8
   14000390e:	4c 8b 05 6b af 00 00 	mov    r8,QWORD PTR [rip+0xaf6b]        # 0x14000e880
   140003915:	41 39 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],edi
   14000391c:	75 50                	jne    0x14000396e
   14000391e:	48 8b 93 a0 03 00 00 	mov    rdx,QWORD PTR [rbx+0x3a0]
   140003925:	8b c2                	mov    eax,edx
   140003927:	83 e0 03             	and    eax,0x3
   14000392a:	44 2b c8             	sub    r9d,eax
   14000392d:	85 c0                	test   eax,eax
   14000392f:	41 8b 40 28          	mov    eax,DWORD PTR [r8+0x28]
   140003933:	44 0f 44 cf          	cmove  r9d,edi
   140003937:	ff c0                	inc    eax
   140003939:	48 98                	cdqe
   14000393b:	49 63 c9             	movsxd rcx,r9d
   14000393e:	48 8d 04 c5 0f 00 00 	lea    rax,[rax*8+0xf]
   140003945:	00 
   140003946:	48 c1 e8 02          	shr    rax,0x2
   14000394a:	48 ff c0             	inc    rax
   14000394d:	48 6b f8 6c          	imul   rdi,rax,0x6c
   140003951:	48 8d 04 0a          	lea    rax,[rdx+rcx*1]
   140003955:	48 03 f8             	add    rdi,rax
   140003958:	48 8d 47 08          	lea    rax,[rdi+0x8]
   14000395c:	83 e0 07             	and    eax,0x7
   14000395f:	48 8d 4f 08          	lea    rcx,[rdi+0x8]
   140003963:	48 2b c8             	sub    rcx,rax
   140003966:	48 83 c1 10          	add    rcx,0x10
   14000396a:	48 89 4f 08          	mov    QWORD PTR [rdi+0x8],rcx
   14000396e:	48 89 bb 98 03 00 00 	mov    QWORD PTR [rbx+0x398],rdi
   140003975:	eb 0a                	jmp    0x140003981
   140003977:	b9 06 00 00 00       	mov    ecx,0x6
   14000397c:	e8 6f 02 00 00       	call   0x140003bf0
   140003981:	ff 4b 2c             	dec    DWORD PTR [rbx+0x2c]
   140003984:	48 8b c3             	mov    rax,rbx
   140003987:	48 8b 74 24 30       	mov    rsi,QWORD PTR [rsp+0x30]
   14000398c:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   140003991:	48 83 c4 20          	add    rsp,0x20
   140003995:	5b                   	pop    rbx
   140003996:	c3                   	ret
   140003997:	48 8d 0d 0a 78 00 00 	lea    rcx,[rip+0x780a]        # 0x14000b1a8
   14000399e:	e8 fd 01 00 00       	call   0x140003ba0
   1400039a3:	33 c9                	xor    ecx,ecx
   1400039a5:	e8 8c 5c 00 00       	call   0x140009636
   1400039aa:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   1400039af:	cc                   	int3
   1400039b0:	40 57                	rex push rdi
   1400039b2:	48 83 ec 20          	sub    rsp,0x20
   1400039b6:	48 8b 05 c3 ae 00 00 	mov    rax,QWORD PTR [rip+0xaec3]        # 0x14000e880
   1400039bd:	8b f9                	mov    edi,ecx
   1400039bf:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400039c6:	74 08                	je     0x1400039d0
   1400039c8:	33 c0                	xor    eax,eax
   1400039ca:	48 83 c4 20          	add    rsp,0x20
   1400039ce:	5f                   	pop    rdi
   1400039cf:	c3                   	ret
   1400039d0:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   1400039d3:	48 8b 0d a6 ae 00 00 	mov    rcx,QWORD PTR [rip+0xaea6]        # 0x14000e880
   1400039da:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1400039de:	83 f8 18             	cmp    eax,0x18
   1400039e1:	7d 24                	jge    0x140003a07
   1400039e3:	c7 44 81 30 17 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x17
   1400039ea:	00 
   1400039eb:	48 8b 0d 8e ae 00 00 	mov    rcx,QWORD PTR [rip+0xae8e]        # 0x14000e880
   1400039f2:	83 b9 08 03 00 00 00 	cmp    DWORD PTR [rcx+0x308],0x0
   1400039f9:	74 0c                	je     0x140003a07
   1400039fb:	e8 00 09 00 00       	call   0x140004300
   140003a00:	48 8b 0d 79 ae 00 00 	mov    rcx,QWORD PTR [rip+0xae79]        # 0x14000e880
   140003a07:	83 b9 9c 00 00 00 00 	cmp    DWORD PTR [rcx+0x9c],0x0
   140003a0e:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   140003a13:	0f 85 f9 00 00 00    	jne    0x140003b12
   140003a19:	83 b9 ec 02 00 00 00 	cmp    DWORD PTR [rcx+0x2ec],0x0
   140003a20:	74 21                	je     0x140003a43
   140003a22:	c7 81 f0 02 00 00 12 	mov    DWORD PTR [rcx+0x2f0],0x12
   140003a29:	00 00 00 
   140003a2c:	48 8b 05 4d ae 00 00 	mov    rax,QWORD PTR [rip+0xae4d]        # 0x14000e880
   140003a33:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140003a38:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140003a3b:	33 c0                	xor    eax,eax
   140003a3d:	48 83 c4 20          	add    rsp,0x20
   140003a41:	5f                   	pop    rdi
   140003a42:	c3                   	ret
   140003a43:	48 8d 0d 8e 75 00 00 	lea    rcx,[rip+0x758e]        # 0x14000afd8
   140003a4a:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
   140003a4f:	e8 4c 01 00 00       	call   0x140003ba0
   140003a54:	48 8b 0d 25 ae 00 00 	mov    rcx,QWORD PTR [rip+0xae25]        # 0x14000e880
   140003a5b:	48 8d 35 9e a5 00 00 	lea    rsi,[rip+0xa59e]        # 0x14000e000
   140003a62:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140003a66:	83 f8 18             	cmp    eax,0x18
   140003a69:	7d 0b                	jge    0x140003a76
   140003a6b:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   140003a70:	48 8b 0c ce          	mov    rcx,QWORD PTR [rsi+rcx*8]
   140003a74:	eb 07                	jmp    0x140003a7d
   140003a76:	48 8d 0d 77 75 00 00 	lea    rcx,[rip+0x7577]        # 0x14000aff4
   140003a7d:	e8 1e 01 00 00       	call   0x140003ba0
   140003a82:	b9 01 00 00 00       	mov    ecx,0x1
   140003a87:	e8 9e 5b 00 00       	call   0x14000962a
   140003a8c:	48 8b d0             	mov    rdx,rax
   140003a8f:	b9 0a 00 00 00       	mov    ecx,0xa
   140003a94:	e8 97 5b 00 00       	call   0x140009630
   140003a99:	48 8b 05 e0 ad 00 00 	mov    rax,QWORD PTR [rip+0xade0]        # 0x14000e880
   140003aa0:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   140003aa3:	83 e9 01             	sub    ecx,0x1
   140003aa6:	48 63 d9             	movsxd rbx,ecx
   140003aa9:	0f 88 cc 00 00 00    	js     0x140003b7b
   140003aaf:	48 8d 3c 9d 30 00 00 	lea    rdi,[rbx*4+0x30]
   140003ab6:	00 
   140003ab7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140003abe:	00 00 
   140003ac0:	48 8d 0d 31 75 00 00 	lea    rcx,[rip+0x7531]        # 0x14000aff8
   140003ac7:	e8 d4 00 00 00       	call   0x140003ba0
   140003acc:	48 83 fb 18          	cmp    rbx,0x18
   140003ad0:	73 11                	jae    0x140003ae3
   140003ad2:	48 8b 05 a7 ad 00 00 	mov    rax,QWORD PTR [rip+0xada7]        # 0x14000e880
   140003ad9:	48 63 0c 07          	movsxd rcx,DWORD PTR [rdi+rax*1]
   140003add:	48 8b 0c ce          	mov    rcx,QWORD PTR [rsi+rcx*8]
   140003ae1:	eb 07                	jmp    0x140003aea
   140003ae3:	48 8d 0d 0a 75 00 00 	lea    rcx,[rip+0x750a]        # 0x14000aff4
   140003aea:	e8 b1 00 00 00       	call   0x140003ba0
   140003aef:	b9 01 00 00 00       	mov    ecx,0x1
   140003af4:	e8 31 5b 00 00       	call   0x14000962a
   140003af9:	48 8b d0             	mov    rdx,rax
   140003afc:	b9 0a 00 00 00       	mov    ecx,0xa
   140003b01:	e8 2a 5b 00 00       	call   0x140009630
   140003b06:	48 83 ef 04          	sub    rdi,0x4
   140003b0a:	48 83 eb 01          	sub    rbx,0x1
   140003b0e:	78 6b                	js     0x140003b7b
   140003b10:	eb ae                	jmp    0x140003ac0
   140003b12:	48 63 41 28          	movsxd rax,DWORD PTR [rcx+0x28]
   140003b16:	ba 01 00 00 00       	mov    edx,0x1
   140003b1b:	48 8d 04 c5 17 00 00 	lea    rax,[rax*8+0x17]
   140003b22:	00 
   140003b23:	48 c1 e8 02          	shr    rax,0x2
   140003b27:	8d 0c 85 04 00 00 00 	lea    ecx,[rax*4+0x4]
   140003b2e:	e8 1d 1a 00 00       	call   0x140005550
   140003b33:	48 8b d8             	mov    rbx,rax
   140003b36:	48 85 c0             	test   rax,rax
   140003b39:	0f 84 ed fe ff ff    	je     0x140003a2c
   140003b3f:	48 83 c0 08          	add    rax,0x8
   140003b43:	48 8d 4b 08          	lea    rcx,[rbx+0x8]
   140003b47:	83 e0 07             	and    eax,0x7
   140003b4a:	48 2b c8             	sub    rcx,rax
   140003b4d:	48 83 c1 10          	add    rcx,0x10
   140003b51:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   140003b55:	85 ff                	test   edi,edi
   140003b57:	74 0a                	je     0x140003b63
   140003b59:	48 8b d3             	mov    rdx,rbx
   140003b5c:	8b cf                	mov    ecx,edi
   140003b5e:	e8 1d e8 ff ff       	call   0x140002380
   140003b63:	48 8b 05 16 ad 00 00 	mov    rax,QWORD PTR [rip+0xad16]        # 0x14000e880
   140003b6a:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140003b6d:	48 8b c3             	mov    rax,rbx
   140003b70:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140003b75:	48 83 c4 20          	add    rsp,0x20
   140003b79:	5f                   	pop    rdi
   140003b7a:	c3                   	ret
   140003b7b:	48 8d 0d 9e 76 00 00 	lea    rcx,[rip+0x769e]        # 0x14000b220
   140003b82:	e8 19 00 00 00       	call   0x140003ba0
   140003b87:	33 c9                	xor    ecx,ecx
   140003b89:	e8 a8 5a 00 00       	call   0x140009636
   140003b8e:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   140003b93:	cc                   	int3
   140003b94:	cc                   	int3
   140003b95:	cc                   	int3
   140003b96:	cc                   	int3
   140003b97:	cc                   	int3
   140003b98:	cc                   	int3
   140003b99:	cc                   	int3
   140003b9a:	cc                   	int3
   140003b9b:	cc                   	int3
   140003b9c:	cc                   	int3
   140003b9d:	cc                   	int3
   140003b9e:	cc                   	int3
   140003b9f:	cc                   	int3
   140003ba0:	40 53                	rex push rbx
   140003ba2:	48 83 ec 20          	sub    rsp,0x20
   140003ba6:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
   140003ba9:	48 8b d9             	mov    rbx,rcx
   140003bac:	84 c0                	test   al,al
   140003bae:	74 38                	je     0x140003be8
   140003bb0:	48 89 7c 24 30       	mov    QWORD PTR [rsp+0x30],rdi
   140003bb5:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140003bbc:	00 00 00 00 
   140003bc0:	b9 01 00 00 00       	mov    ecx,0x1
   140003bc5:	0f be f8             	movsx  edi,al
   140003bc8:	e8 5d 5a 00 00       	call   0x14000962a
   140003bcd:	48 8b d0             	mov    rdx,rax
   140003bd0:	8b cf                	mov    ecx,edi
   140003bd2:	e8 59 5a 00 00       	call   0x140009630
   140003bd7:	0f b6 43 01          	movzx  eax,BYTE PTR [rbx+0x1]
   140003bdb:	48 8d 5b 01          	lea    rbx,[rbx+0x1]
   140003bdf:	84 c0                	test   al,al
   140003be1:	75 dd                	jne    0x140003bc0
   140003be3:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
   140003be8:	48 83 c4 20          	add    rsp,0x20
   140003bec:	5b                   	pop    rbx
   140003bed:	c3                   	ret
   140003bee:	cc                   	int3
   140003bef:	cc                   	int3
   140003bf0:	40 56                	rex push rsi
   140003bf2:	48 83 ec 20          	sub    rsp,0x20
   140003bf6:	48 8b 05 83 ac 00 00 	mov    rax,QWORD PTR [rip+0xac83]        # 0x14000e880
   140003bfd:	8b f1                	mov    esi,ecx
   140003bff:	83 b8 ec 02 00 00 00 	cmp    DWORD PTR [rax+0x2ec],0x0
   140003c06:	74 0c                	je     0x140003c14
   140003c08:	89 88 f0 02 00 00    	mov    DWORD PTR [rax+0x2f0],ecx
   140003c0e:	48 83 c4 20          	add    rsp,0x20
   140003c12:	5e                   	pop    rsi
   140003c13:	c3                   	ret
   140003c14:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   140003c19:	48 8d 0d b8 73 00 00 	lea    rcx,[rip+0x73b8]        # 0x14000afd8
   140003c20:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140003c25:	e8 76 ff ff ff       	call   0x140003ba0
   140003c2a:	48 8b 0d 4f ac 00 00 	mov    rcx,QWORD PTR [rip+0xac4f]        # 0x14000e880
   140003c31:	4c 8d 35 c8 c3 ff ff 	lea    r14,[rip+0xffffffffffffc3c8]        # 0x140000000
   140003c38:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140003c3c:	83 f8 18             	cmp    eax,0x18
   140003c3f:	7d 0f                	jge    0x140003c50
   140003c41:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   140003c46:	49 8b 8c ce 00 e0 00 	mov    rcx,QWORD PTR [r14+rcx*8+0xe000]
   140003c4d:	00 
   140003c4e:	eb 07                	jmp    0x140003c57
   140003c50:	48 8d 0d 9d 73 00 00 	lea    rcx,[rip+0x739d]        # 0x14000aff4
   140003c57:	e8 44 ff ff ff       	call   0x140003ba0
   140003c5c:	b9 01 00 00 00       	mov    ecx,0x1
   140003c61:	e8 c4 59 00 00       	call   0x14000962a
   140003c66:	48 8b d0             	mov    rdx,rax
   140003c69:	b9 0a 00 00 00       	mov    ecx,0xa
   140003c6e:	e8 bd 59 00 00       	call   0x140009630
   140003c73:	48 8b 05 06 ac 00 00 	mov    rax,QWORD PTR [rip+0xac06]        # 0x14000e880
   140003c7a:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   140003c7d:	83 e9 01             	sub    ecx,0x1
   140003c80:	48 63 d9             	movsxd rbx,ecx
   140003c83:	78 66                	js     0x140003ceb
   140003c85:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140003c8a:	48 8d 3c 9d 30 00 00 	lea    rdi,[rbx*4+0x30]
   140003c91:	00 
   140003c92:	48 8d 0d 5f 73 00 00 	lea    rcx,[rip+0x735f]        # 0x14000aff8
   140003c99:	e8 02 ff ff ff       	call   0x140003ba0
   140003c9e:	48 83 fb 18          	cmp    rbx,0x18
   140003ca2:	73 15                	jae    0x140003cb9
   140003ca4:	48 8b 05 d5 ab 00 00 	mov    rax,QWORD PTR [rip+0xabd5]        # 0x14000e880
   140003cab:	48 63 0c 07          	movsxd rcx,DWORD PTR [rdi+rax*1]
   140003caf:	49 8b 8c ce 00 e0 00 	mov    rcx,QWORD PTR [r14+rcx*8+0xe000]
   140003cb6:	00 
   140003cb7:	eb 07                	jmp    0x140003cc0
   140003cb9:	48 8d 0d 34 73 00 00 	lea    rcx,[rip+0x7334]        # 0x14000aff4
   140003cc0:	e8 db fe ff ff       	call   0x140003ba0
   140003cc5:	b9 01 00 00 00       	mov    ecx,0x1
   140003cca:	e8 5b 59 00 00       	call   0x14000962a
   140003ccf:	48 8b d0             	mov    rdx,rax
   140003cd2:	b9 0a 00 00 00       	mov    ecx,0xa
   140003cd7:	e8 54 59 00 00       	call   0x140009630
   140003cdc:	48 83 ef 04          	sub    rdi,0x4
   140003ce0:	48 83 eb 01          	sub    rbx,0x1
   140003ce4:	79 ac                	jns    0x140003c92
   140003ce6:	48 8b 7c 24 38       	mov    rdi,QWORD PTR [rsp+0x38]
   140003ceb:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140003cf0:	8d 46 ff             	lea    eax,[rsi-0x1]
   140003cf3:	83 f8 1c             	cmp    eax,0x1c
   140003cf6:	0f 87 41 01 00 00    	ja     0x140003e3d
   140003cfc:	48 98                	cdqe
   140003cfe:	41 8b 8c 86 58 3e 00 	mov    ecx,DWORD PTR [r14+rax*4+0x3e58]
   140003d05:	00 
   140003d06:	49 03 ce             	add    rcx,r14
   140003d09:	ff e1                	jmp    rcx
   140003d0b:	48 8d 0d 06 73 00 00 	lea    rcx,[rip+0x7306]        # 0x14000b018
   140003d12:	e9 2d 01 00 00       	jmp    0x140003e44
   140003d17:	48 8d 0d 22 73 00 00 	lea    rcx,[rip+0x7322]        # 0x14000b040
   140003d1e:	e9 21 01 00 00       	jmp    0x140003e44
   140003d23:	48 8d 0d 36 73 00 00 	lea    rcx,[rip+0x7336]        # 0x14000b060
   140003d2a:	e9 15 01 00 00       	jmp    0x140003e44
   140003d2f:	48 8d 0d 4a 73 00 00 	lea    rcx,[rip+0x734a]        # 0x14000b080
   140003d36:	e9 09 01 00 00       	jmp    0x140003e44
   140003d3b:	48 8d 0d 5e 73 00 00 	lea    rcx,[rip+0x735e]        # 0x14000b0a0
   140003d42:	e9 fd 00 00 00       	jmp    0x140003e44
   140003d47:	48 8d 0d 6a 73 00 00 	lea    rcx,[rip+0x736a]        # 0x14000b0b8
   140003d4e:	e9 f1 00 00 00       	jmp    0x140003e44
   140003d53:	48 8d 0d 76 73 00 00 	lea    rcx,[rip+0x7376]        # 0x14000b0d0
   140003d5a:	e9 e5 00 00 00       	jmp    0x140003e44
   140003d5f:	48 8d 0d 8a 73 00 00 	lea    rcx,[rip+0x738a]        # 0x14000b0f0
   140003d66:	e9 d9 00 00 00       	jmp    0x140003e44
   140003d6b:	48 8d 0d 8e 73 00 00 	lea    rcx,[rip+0x738e]        # 0x14000b100
   140003d72:	e9 cd 00 00 00       	jmp    0x140003e44
   140003d77:	48 8d 0d a2 73 00 00 	lea    rcx,[rip+0x73a2]        # 0x14000b120
   140003d7e:	e9 c1 00 00 00       	jmp    0x140003e44
   140003d83:	48 8d 0d be 73 00 00 	lea    rcx,[rip+0x73be]        # 0x14000b148
   140003d8a:	e9 b5 00 00 00       	jmp    0x140003e44
   140003d8f:	48 8d 0d d2 73 00 00 	lea    rcx,[rip+0x73d2]        # 0x14000b168
   140003d96:	e9 a9 00 00 00       	jmp    0x140003e44
   140003d9b:	48 8d 0d f6 73 00 00 	lea    rcx,[rip+0x73f6]        # 0x14000b198
   140003da2:	e9 9d 00 00 00       	jmp    0x140003e44
   140003da7:	48 8d 0d fa 73 00 00 	lea    rcx,[rip+0x73fa]        # 0x14000b1a8
   140003dae:	e9 91 00 00 00       	jmp    0x140003e44
   140003db3:	48 8d 0d 06 74 00 00 	lea    rcx,[rip+0x7406]        # 0x14000b1c0
   140003dba:	e9 85 00 00 00       	jmp    0x140003e44
   140003dbf:	48 8d 0d 1a 74 00 00 	lea    rcx,[rip+0x741a]        # 0x14000b1e0
   140003dc6:	eb 7c                	jmp    0x140003e44
   140003dc8:	48 8d 0d 39 74 00 00 	lea    rcx,[rip+0x7439]        # 0x14000b208
   140003dcf:	eb 73                	jmp    0x140003e44
   140003dd1:	48 8d 0d 48 74 00 00 	lea    rcx,[rip+0x7448]        # 0x14000b220
   140003dd8:	eb 6a                	jmp    0x140003e44
   140003dda:	48 8d 0d 6f 74 00 00 	lea    rcx,[rip+0x746f]        # 0x14000b250
   140003de1:	eb 61                	jmp    0x140003e44
   140003de3:	48 8d 0d 7e 74 00 00 	lea    rcx,[rip+0x747e]        # 0x14000b268
   140003dea:	eb 58                	jmp    0x140003e44
   140003dec:	48 8d 0d 8d 74 00 00 	lea    rcx,[rip+0x748d]        # 0x14000b280
   140003df3:	eb 4f                	jmp    0x140003e44
   140003df5:	48 8d 0d 9c 74 00 00 	lea    rcx,[rip+0x749c]        # 0x14000b298
   140003dfc:	eb 46                	jmp    0x140003e44
   140003dfe:	48 8d 0d bb 74 00 00 	lea    rcx,[rip+0x74bb]        # 0x14000b2c0
   140003e05:	eb 3d                	jmp    0x140003e44
   140003e07:	48 8d 0d ea 74 00 00 	lea    rcx,[rip+0x74ea]        # 0x14000b2f8
   140003e0e:	eb 34                	jmp    0x140003e44
   140003e10:	48 8d 0d 09 75 00 00 	lea    rcx,[rip+0x7509]        # 0x14000b320
   140003e17:	eb 2b                	jmp    0x140003e44
   140003e19:	48 8d 0d 30 75 00 00 	lea    rcx,[rip+0x7530]        # 0x14000b350
   140003e20:	eb 22                	jmp    0x140003e44
   140003e22:	48 8d 0d 67 75 00 00 	lea    rcx,[rip+0x7567]        # 0x14000b390
   140003e29:	eb 19                	jmp    0x140003e44
   140003e2b:	48 8d 0d 7e 75 00 00 	lea    rcx,[rip+0x757e]        # 0x14000b3b0
   140003e32:	eb 10                	jmp    0x140003e44
   140003e34:	48 8d 0d 8d 75 00 00 	lea    rcx,[rip+0x758d]        # 0x14000b3c8
   140003e3b:	eb 07                	jmp    0x140003e44
   140003e3d:	48 8d 0d bc 75 00 00 	lea    rcx,[rip+0x75bc]        # 0x14000b400
   140003e44:	e8 57 fd ff ff       	call   0x140003ba0
   140003e49:	33 c9                	xor    ecx,ecx
   140003e4b:	e8 e6 57 00 00       	call   0x140009636
   140003e50:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   140003e55:	0f 1f 00             	nop    DWORD PTR [rax]
   140003e58:	0b 3d 00 00 17 3d    	or     edi,DWORD PTR [rip+0x3d170000]        # 0x17d173e5e
   140003e5e:	00 00                	add    BYTE PTR [rax],al
   140003e60:	23 3d 00 00 2f 3d    	and    edi,DWORD PTR [rip+0x3d2f0000]        # 0x17d2f3e66
   140003e66:	00 00                	add    BYTE PTR [rax],al
   140003e68:	3b 3d 00 00 47 3d    	cmp    edi,DWORD PTR [rip+0x3d470000]        # 0x17d473e6e
   140003e6e:	00 00                	add    BYTE PTR [rax],al
   140003e70:	53                   	push   rbx
   140003e71:	3d 00 00 5f 3d       	cmp    eax,0x3d5f0000
   140003e76:	00 00                	add    BYTE PTR [rax],al
   140003e78:	6b 3d 00 00 77 3d 00 	imul   edi,DWORD PTR [rip+0x3d770000],0x0        # 0x17d773e7f
   140003e7f:	00 83 3d 00 00 8f    	add    BYTE PTR [rbx-0x70ffffc3],al
   140003e85:	3d 00 00 9b 3d       	cmp    eax,0x3d9b0000
   140003e8a:	00 00                	add    BYTE PTR [rax],al
   140003e8c:	a7                   	cmps   DWORD PTR ds:[rsi],DWORD PTR es:[rdi]
   140003e8d:	3d 00 00 b3 3d       	cmp    eax,0x3db30000
   140003e92:	00 00                	add    BYTE PTR [rax],al
   140003e94:	bf 3d 00 00 c8       	mov    edi,0xc800003d
   140003e99:	3d 00 00 d1 3d       	cmp    eax,0x3dd10000
   140003e9e:	00 00                	add    BYTE PTR [rax],al
   140003ea0:	da 3d 00 00 e3 3d    	fidivr DWORD PTR [rip+0x3de30000]        # 0x17de33ea6
   140003ea6:	00 00                	add    BYTE PTR [rax],al
   140003ea8:	ec                   	in     al,dx
   140003ea9:	3d 00 00 f5 3d       	cmp    eax,0x3df50000
   140003eae:	00 00                	add    BYTE PTR [rax],al
   140003eb0:	fe                   	(bad)
   140003eb1:	3d 00 00 07 3e       	cmp    eax,0x3e070000
   140003eb6:	00 00                	add    BYTE PTR [rax],al
   140003eb8:	10 3e                	adc    BYTE PTR [rsi],bh
   140003eba:	00 00                	add    BYTE PTR [rax],al
   140003ebc:	19 3e                	sbb    DWORD PTR [rsi],edi
   140003ebe:	00 00                	add    BYTE PTR [rax],al
   140003ec0:	22 3e                	and    bh,BYTE PTR [rsi]
   140003ec2:	00 00                	add    BYTE PTR [rax],al
   140003ec4:	2b 3e                	sub    edi,DWORD PTR [rsi]
   140003ec6:	00 00                	add    BYTE PTR [rax],al
   140003ec8:	34 3e                	xor    al,0x3e
   140003eca:	00 00                	add    BYTE PTR [rax],al
   140003ecc:	cc                   	int3
   140003ecd:	cc                   	int3
   140003ece:	cc                   	int3
   140003ecf:	cc                   	int3
   140003ed0:	48 3b ca             	cmp    rcx,rdx
   140003ed3:	74 73                	je     0x140003f48
   140003ed5:	44 8b 09             	mov    r9d,DWORD PTR [rcx]
   140003ed8:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140003edd:	44 8b 1a             	mov    r11d,DWORD PTR [rdx]
   140003ee0:	45 8b c1             	mov    r8d,r9d
   140003ee3:	41 81 e0 00 00 00 80 	and    r8d,0x80000000
   140003eea:	41 ba 01 00 00 00    	mov    r10d,0x1
   140003ef0:	44 0f 45 d0          	cmovne r10d,eax
   140003ef4:	41 8b c3             	mov    eax,r11d
   140003ef7:	25 00 00 00 80       	and    eax,0x80000000
   140003efc:	44 3b c0             	cmp    r8d,eax
   140003eff:	75 4d                	jne    0x140003f4e
   140003f01:	41 0f ba f1 1f       	btr    r9d,0x1f
   140003f06:	41 0f ba f3 1f       	btr    r11d,0x1f
   140003f0b:	45 3b cb             	cmp    r9d,r11d
   140003f0e:	77 3e                	ja     0x140003f4e
   140003f10:	72 39                	jb     0x140003f4b
   140003f12:	45 85 c9             	test   r9d,r9d
   140003f15:	74 31                	je     0x140003f48
   140003f17:	4c 8b 41 08          	mov    r8,QWORD PTR [rcx+0x8]
   140003f1b:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   140003f1f:	4c 2b c1             	sub    r8,rcx
   140003f22:	4a 8d 14 c9          	lea    rdx,[rcx+r9*8]
   140003f26:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140003f2d:	00 00 00 
   140003f30:	49 8b 44 10 f8       	mov    rax,QWORD PTR [r8+rdx*1-0x8]
   140003f35:	48 8d 52 f8          	lea    rdx,[rdx-0x8]
   140003f39:	41 ff c9             	dec    r9d
   140003f3c:	48 3b 02             	cmp    rax,QWORD PTR [rdx]
   140003f3f:	77 0d                	ja     0x140003f4e
   140003f41:	72 08                	jb     0x140003f4b
   140003f43:	45 85 c9             	test   r9d,r9d
   140003f46:	7f e8                	jg     0x140003f30
   140003f48:	33 c0                	xor    eax,eax
   140003f4a:	c3                   	ret
   140003f4b:	41 f7 da             	neg    r10d
   140003f4e:	41 8b c2             	mov    eax,r10d
   140003f51:	c3                   	ret
   140003f52:	cc                   	int3
   140003f53:	cc                   	int3
   140003f54:	cc                   	int3
   140003f55:	cc                   	int3
   140003f56:	cc                   	int3
   140003f57:	cc                   	int3
   140003f58:	cc                   	int3
   140003f59:	cc                   	int3
   140003f5a:	cc                   	int3
   140003f5b:	cc                   	int3
   140003f5c:	cc                   	int3
   140003f5d:	cc                   	int3
   140003f5e:	cc                   	int3
   140003f5f:	cc                   	int3
   140003f60:	8b 01                	mov    eax,DWORD PTR [rcx]
   140003f62:	44 8b d0             	mov    r10d,eax
   140003f65:	41 81 e2 00 00 00 80 	and    r10d,0x80000000
   140003f6c:	25 ff ff ff 7f       	and    eax,0x7fffffff
   140003f71:	76 23                	jbe    0x140003f96
   140003f73:	4c 8b 49 08          	mov    r9,QWORD PTR [rcx+0x8]
   140003f77:	49 83 c1 f8          	add    r9,0xfffffffffffffff8
   140003f7b:	44 8b c0             	mov    r8d,eax
   140003f7e:	4d 8d 0c c1          	lea    r9,[r9+rax*8]
   140003f82:	49 83 39 00          	cmp    QWORD PTR [r9],0x0
   140003f86:	75 0e                	jne    0x140003f96
   140003f88:	ff c8                	dec    eax
   140003f8a:	49 ff c8             	dec    r8
   140003f8d:	49 83 e9 08          	sub    r9,0x8
   140003f91:	4d 85 c0             	test   r8,r8
   140003f94:	7f ec                	jg     0x140003f82
   140003f96:	89 01                	mov    DWORD PTR [rcx],eax
   140003f98:	85 c0                	test   eax,eax
   140003f9a:	7e 05                	jle    0x140003fa1
   140003f9c:	41 0b c2             	or     eax,r10d
   140003f9f:	89 01                	mov    DWORD PTR [rcx],eax
   140003fa1:	c3                   	ret
   140003fa2:	cc                   	int3
   140003fa3:	cc                   	int3
   140003fa4:	cc                   	int3
   140003fa5:	cc                   	int3
   140003fa6:	cc                   	int3
   140003fa7:	cc                   	int3
   140003fa8:	cc                   	int3
   140003fa9:	cc                   	int3
   140003faa:	cc                   	int3
   140003fab:	cc                   	int3
   140003fac:	cc                   	int3
   140003fad:	cc                   	int3
   140003fae:	cc                   	int3
   140003faf:	cc                   	int3
   140003fb0:	f7 01 00 00 ff 7f    	test   DWORD PTR [rcx],0x7fff0000
   140003fb6:	b8 00 00 00 00       	mov    eax,0x0
   140003fbb:	0f 95 c0             	setne  al
   140003fbe:	c3                   	ret
   140003fbf:	cc                   	int3
   140003fc0:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   140003fc5:	55                   	push   rbp
   140003fc6:	56                   	push   rsi
   140003fc7:	41 57                	push   r15
   140003fc9:	48 83 ec 20          	sub    rsp,0x20
   140003fcd:	48 8b 05 ac a8 00 00 	mov    rax,QWORD PTR [rip+0xa8ac]        # 0x14000e880
   140003fd4:	49 8b d8             	mov    rbx,r8
   140003fd7:	4d 8b 78 08          	mov    r15,QWORD PTR [r8+0x8]
   140003fdb:	48 8b e9             	mov    rbp,rcx
   140003fde:	48 63 f2             	movsxd rsi,edx
   140003fe1:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140003fe8:	0f 85 e9 02 00 00    	jne    0x1400042d7
   140003fee:	48 89 7c 24 40       	mov    QWORD PTR [rsp+0x40],rdi
   140003ff3:	48 3b cb             	cmp    rcx,rbx
   140003ff6:	0f 84 a8 00 00 00    	je     0x1400040a4
   140003ffc:	41 8b 00             	mov    eax,DWORD PTR [r8]
   140003fff:	0f ba f0 1f          	btr    eax,0x1f
   140004003:	48 85 c9             	test   rcx,rcx
   140004006:	75 28                	jne    0x140004030
   140004008:	8b d0                	mov    edx,eax
   14000400a:	0f b7 c0             	movzx  eax,ax
   14000400d:	c1 ea 10             	shr    edx,0x10
   140004010:	03 d0                	add    edx,eax
   140004012:	74 11                	je     0x140004025
   140004014:	44 8b c2             	mov    r8d,edx
   140004017:	49 8b cf             	mov    rcx,r15
   14000401a:	49 c1 e0 03          	shl    r8,0x3
   14000401e:	33 d2                	xor    edx,edx
   140004020:	e8 e7 55 00 00       	call   0x14000960c
   140004025:	c7 03 00 00 00 00    	mov    DWORD PTR [rbx],0x0
   14000402b:	e9 a2 02 00 00       	jmp    0x1400042d2
   140004030:	44 8b c0             	mov    r8d,eax
   140004033:	4c 89 74 24 48       	mov    QWORD PTR [rsp+0x48],r14
   140004038:	4c 8b 71 08          	mov    r14,QWORD PTR [rcx+0x8]
   14000403c:	0f b7 c0             	movzx  eax,ax
   14000403f:	41 c1 e8 10          	shr    r8d,0x10
   140004043:	44 03 c0             	add    r8d,eax
   140004046:	8b 01                	mov    eax,DWORD PTR [rcx]
   140004048:	0f ba f0 1f          	btr    eax,0x1f
   14000404c:	8b d0                	mov    edx,eax
   14000404e:	0f b7 c0             	movzx  eax,ax
   140004051:	c1 ea 10             	shr    edx,0x10
   140004054:	03 d0                	add    edx,eax
   140004056:	8b fa                	mov    edi,edx
   140004058:	41 3b d0             	cmp    edx,r8d
   14000405b:	73 12                	jae    0x14000406f
   14000405d:	4c 2b c7             	sub    r8,rdi
   140004060:	49 8d 0c d7          	lea    rcx,[r15+rdx*8]
   140004064:	49 c1 e0 03          	shl    r8,0x3
   140004068:	33 d2                	xor    edx,edx
   14000406a:	e8 9d 55 00 00       	call   0x14000960c
   14000406f:	48 85 ff             	test   rdi,rdi
   140004072:	74 1f                	je     0x140004093
   140004074:	33 d2                	xor    edx,edx
   140004076:	49 8b cf             	mov    rcx,r15
   140004079:	4d 2b f7             	sub    r14,r15
   14000407c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140004080:	49 8b 04 0e          	mov    rax,QWORD PTR [r14+rcx*1]
   140004084:	48 ff c2             	inc    rdx
   140004087:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000408a:	48 8d 49 08          	lea    rcx,[rcx+0x8]
   14000408e:	48 3b d7             	cmp    rdx,rdi
   140004091:	7c ed                	jl     0x140004080
   140004093:	8b 45 00             	mov    eax,DWORD PTR [rbp+0x0]
   140004096:	4c 8b 74 24 48       	mov    r14,QWORD PTR [rsp+0x48]
   14000409b:	89 03                	mov    DWORD PTR [rbx],eax
   14000409d:	48 8b 05 dc a7 00 00 	mov    rax,QWORD PTR [rip+0xa7dc]        # 0x14000e880
   1400040a4:	83 3b 00             	cmp    DWORD PTR [rbx],0x0
   1400040a7:	0f 84 25 02 00 00    	je     0x1400042d2
   1400040ad:	85 f6                	test   esi,esi
   1400040af:	0f 84 1d 02 00 00    	je     0x1400042d2
   1400040b5:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   1400040b8:	48 8b 0d c1 a7 00 00 	mov    rcx,QWORD PTR [rip+0xa7c1]        # 0x14000e880
   1400040bf:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1400040c3:	83 f8 18             	cmp    eax,0x18
   1400040c6:	7d 24                	jge    0x1400040ec
   1400040c8:	c7 44 81 30 21 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x21
   1400040cf:	00 
   1400040d0:	48 8b 0d a9 a7 00 00 	mov    rcx,QWORD PTR [rip+0xa7a9]        # 0x14000e880
   1400040d7:	83 b9 08 03 00 00 00 	cmp    DWORD PTR [rcx+0x308],0x0
   1400040de:	74 0c                	je     0x1400040ec
   1400040e0:	e8 1b 02 00 00       	call   0x140004300
   1400040e5:	48 8b 0d 94 a7 00 00 	mov    rcx,QWORD PTR [rip+0xa794]        # 0x14000e880
   1400040ec:	f7 03 00 00 ff 7f    	test   DWORD PTR [rbx],0x7fff0000
   1400040f2:	74 1a                	je     0x14000410e
   1400040f4:	83 b9 ec 02 00 00 00 	cmp    DWORD PTR [rcx+0x2ec],0x0
   1400040fb:	74 53                	je     0x140004150
   1400040fd:	c7 81 f0 02 00 00 0c 	mov    DWORD PTR [rcx+0x2f0],0xc
   140004104:	00 00 00 
   140004107:	48 8b 0d 72 a7 00 00 	mov    rcx,QWORD PTR [rip+0xa772]        # 0x14000e880
   14000410e:	8b 03                	mov    eax,DWORD PTR [rbx]
   140004110:	8b e8                	mov    ebp,eax
   140004112:	0f ba f0 1f          	btr    eax,0x1f
   140004116:	81 e5 00 00 00 80    	and    ebp,0x80000000
   14000411c:	8d 3c 30             	lea    edi,[rax+rsi*1]
   14000411f:	85 ff                	test   edi,edi
   140004121:	0f 8f ef 00 00 00    	jg     0x140004216
   140004127:	8b d0                	mov    edx,eax
   140004129:	0f b7 c0             	movzx  eax,ax
   14000412c:	c1 ea 10             	shr    edx,0x10
   14000412f:	03 d0                	add    edx,eax
   140004131:	74 12                	je     0x140004145
   140004133:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140004137:	44 8b c2             	mov    r8d,edx
   14000413a:	33 d2                	xor    edx,edx
   14000413c:	49 c1 e0 03          	shl    r8,0x3
   140004140:	e8 c7 54 00 00       	call   0x14000960c
   140004145:	c7 03 00 00 00 00    	mov    DWORD PTR [rbx],0x0
   14000414b:	e9 78 01 00 00       	jmp    0x1400042c8
   140004150:	48 8d 0d 81 6e 00 00 	lea    rcx,[rip+0x6e81]        # 0x14000afd8
   140004157:	e8 44 fa ff ff       	call   0x140003ba0
   14000415c:	48 8b 0d 1d a7 00 00 	mov    rcx,QWORD PTR [rip+0xa71d]        # 0x14000e880
   140004163:	48 8d 35 96 9e 00 00 	lea    rsi,[rip+0x9e96]        # 0x14000e000
   14000416a:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   14000416e:	83 f8 18             	cmp    eax,0x18
   140004171:	7d 0b                	jge    0x14000417e
   140004173:	48 63 4c 81 30       	movsxd rcx,DWORD PTR [rcx+rax*4+0x30]
   140004178:	48 8b 0c ce          	mov    rcx,QWORD PTR [rsi+rcx*8]
   14000417c:	eb 07                	jmp    0x140004185
   14000417e:	48 8d 0d 6f 6e 00 00 	lea    rcx,[rip+0x6e6f]        # 0x14000aff4
   140004185:	e8 16 fa ff ff       	call   0x140003ba0
   14000418a:	b9 01 00 00 00       	mov    ecx,0x1
   14000418f:	e8 96 54 00 00       	call   0x14000962a
   140004194:	48 8b d0             	mov    rdx,rax
   140004197:	b9 0a 00 00 00       	mov    ecx,0xa
   14000419c:	e8 8f 54 00 00       	call   0x140009630
   1400041a1:	48 8b 05 d8 a6 00 00 	mov    rax,QWORD PTR [rip+0xa6d8]        # 0x14000e880
   1400041a8:	8b 48 2c             	mov    ecx,DWORD PTR [rax+0x2c]
   1400041ab:	83 e9 01             	sub    ecx,0x1
   1400041ae:	48 63 d9             	movsxd rbx,ecx
   1400041b1:	0f 88 2e 01 00 00    	js     0x1400042e5
   1400041b7:	48 8d 3c 9d 30 00 00 	lea    rdi,[rbx*4+0x30]
   1400041be:	00 
   1400041bf:	90                   	nop
   1400041c0:	48 8d 0d 31 6e 00 00 	lea    rcx,[rip+0x6e31]        # 0x14000aff8
   1400041c7:	e8 d4 f9 ff ff       	call   0x140003ba0
   1400041cc:	48 83 fb 18          	cmp    rbx,0x18
   1400041d0:	73 11                	jae    0x1400041e3
   1400041d2:	48 8b 05 a7 a6 00 00 	mov    rax,QWORD PTR [rip+0xa6a7]        # 0x14000e880
   1400041d9:	48 63 0c 07          	movsxd rcx,DWORD PTR [rdi+rax*1]
   1400041dd:	48 8b 0c ce          	mov    rcx,QWORD PTR [rsi+rcx*8]
   1400041e1:	eb 07                	jmp    0x1400041ea
   1400041e3:	48 8d 0d 0a 6e 00 00 	lea    rcx,[rip+0x6e0a]        # 0x14000aff4
   1400041ea:	e8 b1 f9 ff ff       	call   0x140003ba0
   1400041ef:	b9 01 00 00 00       	mov    ecx,0x1
   1400041f4:	e8 31 54 00 00       	call   0x14000962a
   1400041f9:	48 8b d0             	mov    rdx,rax
   1400041fc:	b9 0a 00 00 00       	mov    ecx,0xa
   140004201:	e8 2a 54 00 00       	call   0x140009630
   140004206:	48 83 ef 04          	sub    rdi,0x4
   14000420a:	48 83 eb 01          	sub    rbx,0x1
   14000420e:	0f 88 d1 00 00 00    	js     0x1400042e5
   140004214:	eb aa                	jmp    0x1400041c0
   140004216:	3b 79 28             	cmp    edi,DWORD PTR [rcx+0x28]
   140004219:	7e 1a                	jle    0x140004235
   14000421b:	83 b9 90 00 00 00 00 	cmp    DWORD PTR [rcx+0x90],0x0
   140004222:	74 11                	je     0x140004235
   140004224:	b9 03 00 00 00       	mov    ecx,0x3
   140004229:	e8 c2 f9 ff ff       	call   0x140003bf0
   14000422e:	48 8b 0d 4b a6 00 00 	mov    rcx,QWORD PTR [rip+0xa64b]        # 0x14000e880
   140004235:	83 b9 f0 02 00 00 00 	cmp    DWORD PTR [rcx+0x2f0],0x0
   14000423c:	74 08                	je     0x140004246
   14000423e:	ff 49 2c             	dec    DWORD PTR [rcx+0x2c]
   140004241:	e9 8c 00 00 00       	jmp    0x1400042d2
   140004246:	85 f6                	test   esi,esi
   140004248:	7e 3c                	jle    0x140004286
   14000424a:	8d 47 ff             	lea    eax,[rdi-0x1]
   14000424d:	4c 8b c6             	mov    r8,rsi
   140004250:	4c 63 c8             	movsxd r9,eax
   140004253:	4c 3b ce             	cmp    r9,rsi
   140004256:	7c 29                	jl     0x140004281
   140004258:	4b 8d 14 cf          	lea    rdx,[r15+r9*8]
   14000425c:	48 8b c6             	mov    rax,rsi
   14000425f:	48 f7 d8             	neg    rax
   140004262:	4c 2b ce             	sub    r9,rsi
   140004265:	49 ff c1             	inc    r9
   140004268:	4c 8d 14 c5 00 00 00 	lea    r10,[rax*8+0x0]
   14000426f:	00 
   140004270:	49 8b 04 12          	mov    rax,QWORD PTR [r10+rdx*1]
   140004274:	48 89 02             	mov    QWORD PTR [rdx],rax
   140004277:	48 8d 52 f8          	lea    rdx,[rdx-0x8]
   14000427b:	49 83 e9 01          	sub    r9,0x1
   14000427f:	75 ef                	jne    0x140004270
   140004281:	49 8b cf             	mov    rcx,r15
   140004284:	eb 33                	jmp    0x1400042b9
   140004286:	f7 de                	neg    esi
   140004288:	4c 63 cf             	movsxd r9,edi
   14000428b:	4c 63 c6             	movsxd r8,esi
   14000428e:	85 ff                	test   edi,edi
   140004290:	7e 1f                	jle    0x1400042b1
   140004292:	49 8b cf             	mov    rcx,r15
   140004295:	49 8b d1             	mov    rdx,r9
   140004298:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000429f:	00 
   1400042a0:	4a 8b 04 c1          	mov    rax,QWORD PTR [rcx+r8*8]
   1400042a4:	48 89 01             	mov    QWORD PTR [rcx],rax
   1400042a7:	48 8d 49 08          	lea    rcx,[rcx+0x8]
   1400042ab:	48 83 ea 01          	sub    rdx,0x1
   1400042af:	75 ef                	jne    0x1400042a0
   1400042b1:	85 f6                	test   esi,esi
   1400042b3:	7e 0f                	jle    0x1400042c4
   1400042b5:	4b 8d 0c cf          	lea    rcx,[r15+r9*8]
   1400042b9:	49 c1 e0 03          	shl    r8,0x3
   1400042bd:	33 d2                	xor    edx,edx
   1400042bf:	e8 48 53 00 00       	call   0x14000960c
   1400042c4:	0b fd                	or     edi,ebp
   1400042c6:	89 3b                	mov    DWORD PTR [rbx],edi
   1400042c8:	48 8b 05 b1 a5 00 00 	mov    rax,QWORD PTR [rip+0xa5b1]        # 0x14000e880
   1400042cf:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400042d2:	48 8b 7c 24 40       	mov    rdi,QWORD PTR [rsp+0x40]
   1400042d7:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
   1400042dc:	48 83 c4 20          	add    rsp,0x20
   1400042e0:	41 5f                	pop    r15
   1400042e2:	5e                   	pop    rsi
   1400042e3:	5d                   	pop    rbp
   1400042e4:	c3                   	ret
   1400042e5:	48 8d 0d 7c 6e 00 00 	lea    rcx,[rip+0x6e7c]        # 0x14000b168
   1400042ec:	e8 af f8 ff ff       	call   0x140003ba0
   1400042f1:	33 c9                	xor    ecx,ecx
   1400042f3:	e8 3e 53 00 00       	call   0x140009636
   1400042f8:	cc                   	int3
   1400042f9:	cc                   	int3
   1400042fa:	cc                   	int3
   1400042fb:	cc                   	int3
   1400042fc:	cc                   	int3
   1400042fd:	cc                   	int3
   1400042fe:	cc                   	int3
   1400042ff:	cc                   	int3
   140004300:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140004305:	57                   	push   rdi
   140004306:	48 83 ec 20          	sub    rsp,0x20
   14000430a:	48 8b 05 6f a5 00 00 	mov    rax,QWORD PTR [rip+0xa56f]        # 0x14000e880
   140004311:	33 db                	xor    ebx,ebx
   140004313:	39 58 2c             	cmp    DWORD PTR [rax+0x2c],ebx
   140004316:	7e 2d                	jle    0x140004345
   140004318:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000431f:	00 
   140004320:	b9 01 00 00 00       	mov    ecx,0x1
   140004325:	e8 00 53 00 00       	call   0x14000962a
   14000432a:	48 8b d0             	mov    rdx,rax
   14000432d:	b9 2d 00 00 00       	mov    ecx,0x2d
   140004332:	e8 f9 52 00 00       	call   0x140009630
   140004337:	48 8b 05 42 a5 00 00 	mov    rax,QWORD PTR [rip+0xa542]        # 0x14000e880
   14000433e:	ff c3                	inc    ebx
   140004340:	3b 58 2c             	cmp    ebx,DWORD PTR [rax+0x2c]
   140004343:	7c db                	jl     0x140004320
   140004345:	b9 01 00 00 00       	mov    ecx,0x1
   14000434a:	e8 db 52 00 00       	call   0x14000962a
   14000434f:	48 8b d0             	mov    rdx,rax
   140004352:	b9 3e 00 00 00       	mov    ecx,0x3e
   140004357:	e8 d4 52 00 00       	call   0x140009630
   14000435c:	48 8b 0d 1d a5 00 00 	mov    rcx,QWORD PTR [rip+0xa51d]        # 0x14000e880
   140004363:	48 8d 3d 96 9c 00 00 	lea    rdi,[rip+0x9c96]        # 0x14000e000
   14000436a:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   14000436e:	48 63 54 81 30       	movsxd rdx,DWORD PTR [rcx+rax*4+0x30]
   140004373:	48 8b 3c d7          	mov    rdi,QWORD PTR [rdi+rdx*8]
   140004377:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   14000437a:	84 c0                	test   al,al
   14000437c:	74 25                	je     0x1400043a3
   14000437e:	66 90                	xchg   ax,ax
   140004380:	b9 01 00 00 00       	mov    ecx,0x1
   140004385:	0f be d8             	movsx  ebx,al
   140004388:	e8 9d 52 00 00       	call   0x14000962a
   14000438d:	48 8b d0             	mov    rdx,rax
   140004390:	8b cb                	mov    ecx,ebx
   140004392:	e8 99 52 00 00       	call   0x140009630
   140004397:	0f b6 47 01          	movzx  eax,BYTE PTR [rdi+0x1]
   14000439b:	48 8d 7f 01          	lea    rdi,[rdi+0x1]
   14000439f:	84 c0                	test   al,al
   1400043a1:	75 dd                	jne    0x140004380
   1400043a3:	b9 01 00 00 00       	mov    ecx,0x1
   1400043a8:	e8 7d 52 00 00       	call   0x14000962a
   1400043ad:	48 8b d0             	mov    rdx,rax
   1400043b0:	b9 0a 00 00 00       	mov    ecx,0xa
   1400043b5:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400043ba:	48 83 c4 20          	add    rsp,0x20
   1400043be:	5f                   	pop    rdi
   1400043bf:	e9 6c 52 00 00       	jmp    0x140009630
   1400043c4:	cc                   	int3
   1400043c5:	cc                   	int3
   1400043c6:	cc                   	int3
   1400043c7:	cc                   	int3
   1400043c8:	cc                   	int3
   1400043c9:	cc                   	int3
   1400043ca:	cc                   	int3
   1400043cb:	cc                   	int3
   1400043cc:	cc                   	int3
   1400043cd:	cc                   	int3
   1400043ce:	cc                   	int3
   1400043cf:	cc                   	int3
   1400043d0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400043d5:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   1400043da:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   1400043df:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   1400043e4:	41 56                	push   r14
   1400043e6:	8b 74 24 30          	mov    esi,DWORD PTR [rsp+0x30]
   1400043ea:	8b da                	mov    ebx,edx
   1400043ec:	41 c7 00 01 00 00 00 	mov    DWORD PTR [r8],0x1
   1400043f3:	48 8b e9             	mov    rbp,rcx
   1400043f6:	41 c7 01 00 00 00 00 	mov    DWORD PTR [r9],0x0
   1400043fd:	49 8b f8             	mov    rdi,r8
   140004400:	48 8b 05 79 a4 00 00 	mov    rax,QWORD PTR [rip+0xa479]        # 0x14000e880
   140004407:	41 b8 01 00 00 00    	mov    r8d,0x1
   14000440d:	4d 8b f1             	mov    r14,r9
   140004410:	44 8b 50 14          	mov    r10d,DWORD PTR [rax+0x14]
   140004414:	8b c2                	mov    eax,edx
   140004416:	99                   	cdq
   140004417:	41 f7 fa             	idiv   r10d
   14000441a:	8b c3                	mov    eax,ebx
   14000441c:	8b ca                	mov    ecx,edx
   14000441e:	99                   	cdq
   14000441f:	41 f7 fa             	idiv   r10d
   140004422:	49 d3 e0             	shl    r8,cl
   140004425:	48 63 c8             	movsxd rcx,eax
   140004428:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
   14000442c:	4c 85 04 c8          	test   QWORD PTR [rax+rcx*8],r8
   140004430:	0f 86 bb 00 00 00    	jbe    0x1400044f1
   140004436:	8b c3                	mov    eax,ebx
   140004438:	2b c6                	sub    eax,esi
   14000443a:	83 c0 01             	add    eax,0x1
   14000443d:	79 03                	jns    0x140004442
   14000443f:	8d 73 01             	lea    esi,[rbx+0x1]
   140004442:	44 8d 5b ff          	lea    r11d,[rbx-0x1]
   140004446:	ba 01 00 00 00       	mov    edx,0x1
   14000444b:	2b de                	sub    ebx,esi
   14000444d:	44 3b db             	cmp    r11d,ebx
   140004450:	0f 8e 97 00 00 00    	jle    0x1400044ed
   140004456:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000445d:	00 00 00 
   140004460:	8b 37                	mov    esi,DWORD PTR [rdi]
   140004462:	44 8d 14 12          	lea    r10d,[rdx+rdx*1]
   140004466:	ff c6                	inc    esi
   140004468:	41 b9 01 00 00 00    	mov    r9d,0x1
   14000446e:	89 37                	mov    DWORD PTR [rdi],esi
   140004470:	48 8b 05 09 a4 00 00 	mov    rax,QWORD PTR [rip+0xa409]        # 0x14000e880
   140004477:	44 8b 40 14          	mov    r8d,DWORD PTR [rax+0x14]
   14000447b:	41 8b c3             	mov    eax,r11d
   14000447e:	99                   	cdq
   14000447f:	41 f7 f8             	idiv   r8d
   140004482:	41 8b c3             	mov    eax,r11d
   140004485:	8b ca                	mov    ecx,edx
   140004487:	99                   	cdq
   140004488:	41 f7 f8             	idiv   r8d
   14000448b:	49 d3 e1             	shl    r9,cl
   14000448e:	41 8d 52 01          	lea    edx,[r10+0x1]
   140004492:	48 63 c8             	movsxd rcx,eax
   140004495:	48 8b 45 08          	mov    rax,QWORD PTR [rbp+0x8]
   140004499:	4c 85 0c c8          	test   QWORD PTR [rax+rcx*8],r9
   14000449d:	41 0f 46 d2          	cmovbe edx,r10d
   1400044a1:	8b c2                	mov    eax,edx
   1400044a3:	25 03 00 00 80       	and    eax,0x80000003
   1400044a8:	7d 07                	jge    0x1400044b1
   1400044aa:	ff c8                	dec    eax
   1400044ac:	83 c8 fc             	or     eax,0xfffffffc
   1400044af:	ff c0                	inc    eax
   1400044b1:	85 c0                	test   eax,eax
   1400044b3:	74 0a                	je     0x1400044bf
   1400044b5:	41 ff cb             	dec    r11d
   1400044b8:	44 3b db             	cmp    r11d,ebx
   1400044bb:	7f a3                	jg     0x140004460
   1400044bd:	eb 17                	jmp    0x1400044d6
   1400044bf:	8b c2                	mov    eax,edx
   1400044c1:	8d 4e fe             	lea    ecx,[rsi-0x2]
   1400044c4:	99                   	cdq
   1400044c5:	89 0f                	mov    DWORD PTR [rdi],ecx
   1400044c7:	83 e2 03             	and    edx,0x3
   1400044ca:	41 c7 06 02 00 00 00 	mov    DWORD PTR [r14],0x2
   1400044d1:	03 d0                	add    edx,eax
   1400044d3:	c1 fa 02             	sar    edx,0x2
   1400044d6:	f6 c2 01             	test   dl,0x1
   1400044d9:	75 12                	jne    0x1400044ed
   1400044db:	8b c2                	mov    eax,edx
   1400044dd:	41 c7 06 01 00 00 00 	mov    DWORD PTR [r14],0x1
   1400044e4:	99                   	cdq
   1400044e5:	2b c2                	sub    eax,edx
   1400044e7:	d1 f8                	sar    eax,1
   1400044e9:	ff 0f                	dec    DWORD PTR [rdi]
   1400044eb:	8b d0                	mov    edx,eax
   1400044ed:	8b c2                	mov    eax,edx
   1400044ef:	eb 02                	jmp    0x1400044f3
   1400044f1:	33 c0                	xor    eax,eax
   1400044f3:	48 8b 5c 24 10       	mov    rbx,QWORD PTR [rsp+0x10]
   1400044f8:	48 8b 6c 24 18       	mov    rbp,QWORD PTR [rsp+0x18]
   1400044fd:	48 8b 74 24 20       	mov    rsi,QWORD PTR [rsp+0x20]
   140004502:	48 8b 7c 24 28       	mov    rdi,QWORD PTR [rsp+0x28]
   140004507:	41 5e                	pop    r14
   140004509:	c3                   	ret
   14000450a:	cc                   	int3
   14000450b:	cc                   	int3
   14000450c:	cc                   	int3
   14000450d:	cc                   	int3
   14000450e:	cc                   	int3
   14000450f:	cc                   	int3
   140004510:	40 57                	rex push rdi
   140004512:	48 83 ec 20          	sub    rsp,0x20
   140004516:	4c 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],r15
   14000451b:	4c 8b f9             	mov    r15,rcx
   14000451e:	48 8b fa             	mov    rdi,rdx
   140004521:	48 3b ca             	cmp    rcx,rdx
   140004524:	0f 84 bd 00 00 00    	je     0x1400045e7
   14000452a:	48 85 d2             	test   rdx,rdx
   14000452d:	0f 84 b4 00 00 00    	je     0x1400045e7
   140004533:	8b 02                	mov    eax,DWORD PTR [rdx]
   140004535:	0f ba f0 1f          	btr    eax,0x1f
   140004539:	48 85 c9             	test   rcx,rcx
   14000453c:	75 27                	jne    0x140004565
   14000453e:	8b d0                	mov    edx,eax
   140004540:	0f b7 c0             	movzx  eax,ax
   140004543:	c1 ea 10             	shr    edx,0x10
   140004546:	03 d0                	add    edx,eax
   140004548:	74 12                	je     0x14000455c
   14000454a:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   14000454e:	44 8b c2             	mov    r8d,edx
   140004551:	33 d2                	xor    edx,edx
   140004553:	49 c1 e0 03          	shl    r8,0x3
   140004557:	e8 b0 50 00 00       	call   0x14000960c
   14000455c:	33 c9                	xor    ecx,ecx
   14000455e:	89 0f                	mov    DWORD PTR [rdi],ecx
   140004560:	e9 82 00 00 00       	jmp    0x1400045e7
   140004565:	44 8b c0             	mov    r8d,eax
   140004568:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   14000456d:	48 8b 5f 08          	mov    rbx,QWORD PTR [rdi+0x8]
   140004571:	0f b7 c0             	movzx  eax,ax
   140004574:	41 c1 e8 10          	shr    r8d,0x10
   140004578:	44 03 c0             	add    r8d,eax
   14000457b:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
   140004580:	8b 01                	mov    eax,DWORD PTR [rcx]
   140004582:	0f ba f0 1f          	btr    eax,0x1f
   140004586:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   14000458b:	4c 8b 71 08          	mov    r14,QWORD PTR [rcx+0x8]
   14000458f:	8b d0                	mov    edx,eax
   140004591:	c1 ea 10             	shr    edx,0x10
   140004594:	0f b7 c0             	movzx  eax,ax
   140004597:	03 d0                	add    edx,eax
   140004599:	8b f2                	mov    esi,edx
   14000459b:	41 3b d0             	cmp    edx,r8d
   14000459e:	73 12                	jae    0x1400045b2
   1400045a0:	4c 2b c6             	sub    r8,rsi
   1400045a3:	48 8d 0c d3          	lea    rcx,[rbx+rdx*8]
   1400045a7:	49 c1 e0 03          	shl    r8,0x3
   1400045ab:	33 d2                	xor    edx,edx
   1400045ad:	e8 5a 50 00 00       	call   0x14000960c
   1400045b2:	48 85 f6             	test   rsi,rsi
   1400045b5:	74 1c                	je     0x1400045d3
   1400045b7:	33 c9                	xor    ecx,ecx
   1400045b9:	4c 2b f3             	sub    r14,rbx
   1400045bc:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   1400045c0:	49 8b 04 1e          	mov    rax,QWORD PTR [r14+rbx*1]
   1400045c4:	48 ff c1             	inc    rcx
   1400045c7:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400045ca:	48 8d 5b 08          	lea    rbx,[rbx+0x8]
   1400045ce:	48 3b ce             	cmp    rcx,rsi
   1400045d1:	7c ed                	jl     0x1400045c0
   1400045d3:	41 8b 07             	mov    eax,DWORD PTR [r15]
   1400045d6:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   1400045db:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   1400045e0:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400045e5:	89 07                	mov    DWORD PTR [rdi],eax
   1400045e7:	8b 07                	mov    eax,DWORD PTR [rdi]
   1400045e9:	4c 8b 7c 24 48       	mov    r15,QWORD PTR [rsp+0x48]
   1400045ee:	85 c0                	test   eax,eax
   1400045f0:	74 06                	je     0x1400045f8
   1400045f2:	0f ba f8 1f          	btc    eax,0x1f
   1400045f6:	89 07                	mov    DWORD PTR [rdi],eax
   1400045f8:	48 83 c4 20          	add    rsp,0x20
   1400045fc:	5f                   	pop    rdi
   1400045fd:	c3                   	ret
   1400045fe:	cc                   	int3
   1400045ff:	cc                   	int3
   140004600:	40 53                	rex push rbx
   140004602:	57                   	push   rdi
   140004603:	41 56                	push   r14
   140004605:	48 83 ec 30          	sub    rsp,0x30
   140004609:	48 8b 05 70 a2 00 00 	mov    rax,QWORD PTR [rip+0xa270]        # 0x14000e880
   140004610:	41 8b f8             	mov    edi,r8d
   140004613:	48 8b da             	mov    rbx,rdx
   140004616:	4c 63 f1             	movsxd r14,ecx
   140004619:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140004620:	0f 85 82 01 00 00    	jne    0x1400047a8
   140004626:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140004629:	4c 8b 0d 50 a2 00 00 	mov    r9,QWORD PTR [rip+0xa250]        # 0x14000e880
   140004630:	48 89 6c 24 50       	mov    QWORD PTR [rsp+0x50],rbp
   140004635:	48 89 74 24 58       	mov    QWORD PTR [rsp+0x58],rsi
   14000463a:	4c 89 64 24 60       	mov    QWORD PTR [rsp+0x60],r12
   14000463f:	49 63 41 2c          	movsxd rax,DWORD PTR [r9+0x2c]
   140004643:	4c 89 6c 24 28       	mov    QWORD PTR [rsp+0x28],r13
   140004648:	4c 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],r15
   14000464d:	83 f8 18             	cmp    eax,0x18
   140004650:	7d 26                	jge    0x140004678
   140004652:	41 c7 44 81 30 1a 00 	mov    DWORD PTR [r9+rax*4+0x30],0x1a
   140004659:	00 00 
   14000465b:	4c 8b 0d 1e a2 00 00 	mov    r9,QWORD PTR [rip+0xa21e]        # 0x14000e880
   140004662:	41 83 b9 08 03 00 00 	cmp    DWORD PTR [r9+0x308],0x0
   140004669:	00 
   14000466a:	74 0c                	je     0x140004678
   14000466c:	e8 8f fc ff ff       	call   0x140004300
   140004671:	4c 8b 0d 08 a2 00 00 	mov    r9,QWORD PTR [rip+0xa208]        # 0x14000e880
   140004678:	41 8b 71 10          	mov    esi,DWORD PTR [r9+0x10]
   14000467c:	8d 6f ff             	lea    ebp,[rdi-0x1]
   14000467f:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140004683:	8b c5                	mov    eax,ebp
   140004685:	44 8b 23             	mov    r12d,DWORD PTR [rbx]
   140004688:	99                   	cdq
   140004689:	f7 fe                	idiv   esi
   14000468b:	45 8b fc             	mov    r15d,r12d
   14000468e:	41 0f ba f4 1f       	btr    r12d,0x1f
   140004693:	48 63 f8             	movsxd rdi,eax
   140004696:	41 81 e7 00 00 00 80 	and    r15d,0x80000000
   14000469d:	4c 8b 1c f9          	mov    r11,QWORD PTR [rcx+rdi*8]
   1400046a1:	4c 8d 2c f9          	lea    r13,[rcx+rdi*8]
   1400046a5:	49 8b cb             	mov    rcx,r11
   1400046a8:	83 fe 01             	cmp    esi,0x1
   1400046ab:	74 30                	je     0x1400046dd
   1400046ad:	8b c5                	mov    eax,ebp
   1400046af:	99                   	cdq
   1400046b0:	f7 fe                	idiv   esi
   1400046b2:	83 fa 01             	cmp    edx,0x1
   1400046b5:	7c 1a                	jl     0x1400046d1
   1400046b7:	4d 8b 51 08          	mov    r10,QWORD PTR [r9+0x8]
   1400046bb:	44 8b c2             	mov    r8d,edx
   1400046be:	66 90                	xchg   ax,ax
   1400046c0:	33 d2                	xor    edx,edx
   1400046c2:	48 8b c1             	mov    rax,rcx
   1400046c5:	49 f7 f2             	div    r10
   1400046c8:	48 8b c8             	mov    rcx,rax
   1400046cb:	49 83 e8 01          	sub    r8,0x1
   1400046cf:	75 ef                	jne    0x1400046c0
   1400046d1:	48 8b c1             	mov    rax,rcx
   1400046d4:	33 d2                	xor    edx,edx
   1400046d6:	49 f7 71 08          	div    QWORD PTR [r9+0x8]
   1400046da:	48 8b ca             	mov    rcx,rdx
   1400046dd:	8b c5                	mov    eax,ebp
   1400046df:	48 63 c9             	movsxd rcx,ecx
   1400046e2:	48 8b 6c 24 50       	mov    rbp,QWORD PTR [rsp+0x50]
   1400046e7:	99                   	cdq
   1400046e8:	f7 fe                	idiv   esi
   1400046ea:	48 8b 74 24 58       	mov    rsi,QWORD PTR [rsp+0x58]
   1400046ef:	4d 8b c6             	mov    r8,r14
   1400046f2:	83 fa 01             	cmp    edx,0x1
   1400046f5:	7c 17                	jl     0x14000470e
   1400046f7:	49 8b 41 08          	mov    rax,QWORD PTR [r9+0x8]
   1400046fb:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140004700:	48 0f af c8          	imul   rcx,rax
   140004704:	4c 0f af c0          	imul   r8,rax
   140004708:	48 83 ea 01          	sub    rdx,0x1
   14000470c:	75 f2                	jne    0x140004700
   14000470e:	41 8b 41 28          	mov    eax,DWORD PTR [r9+0x28]
   140004712:	3b f8                	cmp    edi,eax
   140004714:	7c 1c                	jl     0x140004732
   140004716:	41 83 b9 90 00 00 00 	cmp    DWORD PTR [r9+0x90],0x0
   14000471d:	00 
   14000471e:	75 06                	jne    0x140004726
   140004720:	03 c0                	add    eax,eax
   140004722:	3b f8                	cmp    edi,eax
   140004724:	7c 0c                	jl     0x140004732
   140004726:	b9 03 00 00 00       	mov    ecx,0x3
   14000472b:	e8 c0 f4 ff ff       	call   0x140003bf0
   140004730:	eb 5d                	jmp    0x14000478f
   140004732:	4c 2b d9             	sub    r11,rcx
   140004735:	4d 03 d8             	add    r11,r8
   140004738:	4d 89 5d 00          	mov    QWORD PTR [r13+0x0],r11
   14000473c:	41 3b fc             	cmp    edi,r12d
   14000473f:	7c 08                	jl     0x140004749
   140004741:	8d 47 01             	lea    eax,[rdi+0x1]
   140004744:	41 0b c7             	or     eax,r15d
   140004747:	89 03                	mov    DWORD PTR [rbx],eax
   140004749:	8b 03                	mov    eax,DWORD PTR [rbx]
   14000474b:	44 8b c8             	mov    r9d,eax
   14000474e:	41 81 e1 00 00 00 80 	and    r9d,0x80000000
   140004755:	25 ff ff ff 7f       	and    eax,0x7fffffff
   14000475a:	76 28                	jbe    0x140004784
   14000475c:	4c 8b 43 08          	mov    r8,QWORD PTR [rbx+0x8]
   140004760:	49 83 c0 f8          	add    r8,0xfffffffffffffff8
   140004764:	8b d0                	mov    edx,eax
   140004766:	4d 8d 04 c0          	lea    r8,[r8+rax*8]
   14000476a:	66 0f 1f 44 00 00    	nop    WORD PTR [rax+rax*1+0x0]
   140004770:	49 83 38 00          	cmp    QWORD PTR [r8],0x0
   140004774:	75 0e                	jne    0x140004784
   140004776:	ff c8                	dec    eax
   140004778:	48 ff ca             	dec    rdx
   14000477b:	49 83 e8 08          	sub    r8,0x8
   14000477f:	48 85 d2             	test   rdx,rdx
   140004782:	7f ec                	jg     0x140004770
   140004784:	89 03                	mov    DWORD PTR [rbx],eax
   140004786:	85 c0                	test   eax,eax
   140004788:	7e 05                	jle    0x14000478f
   14000478a:	41 0b c1             	or     eax,r9d
   14000478d:	89 03                	mov    DWORD PTR [rbx],eax
   14000478f:	48 8b 05 ea a0 00 00 	mov    rax,QWORD PTR [rip+0xa0ea]        # 0x14000e880
   140004796:	4c 8b 6c 24 28       	mov    r13,QWORD PTR [rsp+0x28]
   14000479b:	4c 8b 64 24 60       	mov    r12,QWORD PTR [rsp+0x60]
   1400047a0:	4c 8b 7c 24 20       	mov    r15,QWORD PTR [rsp+0x20]
   1400047a5:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400047a8:	48 83 c4 30          	add    rsp,0x30
   1400047ac:	41 5e                	pop    r14
   1400047ae:	5f                   	pop    rdi
   1400047af:	5b                   	pop    rbx
   1400047b0:	c3                   	ret
   1400047b1:	cc                   	int3
   1400047b2:	cc                   	int3
   1400047b3:	cc                   	int3
   1400047b4:	cc                   	int3
   1400047b5:	cc                   	int3
   1400047b6:	cc                   	int3
   1400047b7:	cc                   	int3
   1400047b8:	cc                   	int3
   1400047b9:	cc                   	int3
   1400047ba:	cc                   	int3
   1400047bb:	cc                   	int3
   1400047bc:	cc                   	int3
   1400047bd:	cc                   	int3
   1400047be:	cc                   	int3
   1400047bf:	cc                   	int3
   1400047c0:	4c 8b c2             	mov    r8,rdx
   1400047c3:	48 8b c1             	mov    rax,rcx
   1400047c6:	48 85 d2             	test   rdx,rdx
   1400047c9:	74 2b                	je     0x1400047f6
   1400047cb:	33 d2                	xor    edx,edx
   1400047cd:	49 f7 f0             	div    r8
   1400047d0:	48 8b ca             	mov    rcx,rdx
   1400047d3:	48 85 d2             	test   rdx,rdx
   1400047d6:	74 1b                	je     0x1400047f3
   1400047d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400047df:	00 
   1400047e0:	49 8b c0             	mov    rax,r8
   1400047e3:	33 d2                	xor    edx,edx
   1400047e5:	48 f7 f1             	div    rcx
   1400047e8:	4c 8b c1             	mov    r8,rcx
   1400047eb:	48 8b ca             	mov    rcx,rdx
   1400047ee:	48 85 d2             	test   rdx,rdx
   1400047f1:	75 ed                	jne    0x1400047e0
   1400047f3:	49 8b c0             	mov    rax,r8
   1400047f6:	c3                   	ret
   1400047f7:	cc                   	int3
   1400047f8:	cc                   	int3
   1400047f9:	cc                   	int3
   1400047fa:	cc                   	int3
   1400047fb:	cc                   	int3
   1400047fc:	cc                   	int3
   1400047fd:	cc                   	int3
   1400047fe:	cc                   	int3
   1400047ff:	cc                   	int3
   140004800:	48 85 c9             	test   rcx,rcx
   140004803:	74 2e                	je     0x140004833
   140004805:	8b 11                	mov    edx,DWORD PTR [rcx]
   140004807:	8b c2                	mov    eax,edx
   140004809:	25 ff ff ff 7f       	and    eax,0x7fffffff
   14000480e:	74 23                	je     0x140004833
   140004810:	83 f8 01             	cmp    eax,0x1
   140004813:	75 10                	jne    0x140004825
   140004815:	48 8b 41 08          	mov    rax,QWORD PTR [rcx+0x8]
   140004819:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   14000481c:	48 81 f9 00 00 00 40 	cmp    rcx,0x40000000
   140004823:	72 05                	jb     0x14000482a
   140004825:	b9 00 00 00 40       	mov    ecx,0x40000000
   14000482a:	85 d2                	test   edx,edx
   14000482c:	79 02                	jns    0x140004830
   14000482e:	f7 d9                	neg    ecx
   140004830:	8b c1                	mov    eax,ecx
   140004832:	c3                   	ret
   140004833:	33 c0                	xor    eax,eax
   140004835:	c3                   	ret
   140004836:	cc                   	int3
   140004837:	cc                   	int3
   140004838:	cc                   	int3
   140004839:	cc                   	int3
   14000483a:	cc                   	int3
   14000483b:	cc                   	int3
   14000483c:	cc                   	int3
   14000483d:	cc                   	int3
   14000483e:	cc                   	int3
   14000483f:	cc                   	int3
   140004840:	48 85 c9             	test   rcx,rcx
   140004843:	74 37                	je     0x14000487c
   140004845:	53                   	push   rbx
   140004846:	48 83 ec 20          	sub    rsp,0x20
   14000484a:	8b 01                	mov    eax,DWORD PTR [rcx]
   14000484c:	48 8b d9             	mov    rbx,rcx
   14000484f:	0f ba f0 1f          	btr    eax,0x1f
   140004853:	44 8b c0             	mov    r8d,eax
   140004856:	0f b7 c0             	movzx  eax,ax
   140004859:	41 c1 e8 10          	shr    r8d,0x10
   14000485d:	44 03 c0             	add    r8d,eax
   140004860:	74 0f                	je     0x140004871
   140004862:	48 8b 49 08          	mov    rcx,QWORD PTR [rcx+0x8]
   140004866:	33 d2                	xor    edx,edx
   140004868:	49 c1 e0 03          	shl    r8,0x3
   14000486c:	e8 9b 4d 00 00       	call   0x14000960c
   140004871:	c7 03 00 00 00 00    	mov    DWORD PTR [rbx],0x0
   140004877:	48 83 c4 20          	add    rsp,0x20
   14000487b:	5b                   	pop    rbx
   14000487c:	c3                   	ret
   14000487d:	cc                   	int3
   14000487e:	cc                   	int3
   14000487f:	cc                   	int3
   140004880:	40 56                	rex push rsi
   140004882:	41 57                	push   r15
   140004884:	48 83 ec 58          	sub    rsp,0x58
   140004888:	48 8b 05 f1 9f 00 00 	mov    rax,QWORD PTR [rip+0x9ff1]        # 0x14000e880
   14000488f:	48 8b f2             	mov    rsi,rdx
   140004892:	4c 8b f9             	mov    r15,rcx
   140004895:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   14000489c:	75 67                	jne    0x140004905
   14000489e:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   1400048a1:	48 8b 0d d8 9f 00 00 	mov    rcx,QWORD PTR [rip+0x9fd8]        # 0x14000e880
   1400048a8:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1400048ac:	83 f8 18             	cmp    eax,0x18
   1400048af:	7d 24                	jge    0x1400048d5
   1400048b1:	c7 44 81 30 4c 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x4c
   1400048b8:	00 
   1400048b9:	48 8b 0d c0 9f 00 00 	mov    rcx,QWORD PTR [rip+0x9fc0]        # 0x14000e880
   1400048c0:	83 b9 08 03 00 00 00 	cmp    DWORD PTR [rcx+0x308],0x0
   1400048c7:	74 0c                	je     0x1400048d5
   1400048c9:	e8 32 fa ff ff       	call   0x140004300
   1400048ce:	48 8b 0d ab 9f 00 00 	mov    rcx,QWORD PTR [rip+0x9fab]        # 0x14000e880
   1400048d5:	48 8b 41 08          	mov    rax,QWORD PTR [rcx+0x8]
   1400048d9:	48 ff c8             	dec    rax
   1400048dc:	48 3d ff 00 00 00    	cmp    rax,0xff
   1400048e2:	0f 87 2e 05 00 00    	ja     0x140004e16
   1400048e8:	83 b9 9c 00 00 00 00 	cmp    DWORD PTR [rcx+0x9c],0x0
   1400048ef:	75 1e                	jne    0x14000490f
   1400048f1:	b9 12 00 00 00       	mov    ecx,0x12
   1400048f6:	e8 f5 f2 ff ff       	call   0x140003bf0
   1400048fb:	48 8b 05 7e 9f 00 00 	mov    rax,QWORD PTR [rip+0x9f7e]        # 0x14000e880
   140004902:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140004905:	33 c0                	xor    eax,eax
   140004907:	48 83 c4 58          	add    rsp,0x58
   14000490b:	41 5f                	pop    r15
   14000490d:	5e                   	pop    rsi
   14000490e:	c3                   	ret
   14000490f:	49 8b cf             	mov    rcx,r15
   140004912:	e8 29 ff ff ff       	call   0x140004840
   140004917:	48 8b 05 62 9f 00 00 	mov    rax,QWORD PTR [rip+0x9f62]        # 0x14000e880
   14000491e:	8b 88 98 00 00 00    	mov    ecx,DWORD PTR [rax+0x98]
   140004924:	85 c9                	test   ecx,ecx
   140004926:	74 07                	je     0x14000492f
   140004928:	48 8b b0 18 03 00 00 	mov    rsi,QWORD PTR [rax+0x318]
   14000492f:	8b 90 f8 02 00 00    	mov    edx,DWORD PTR [rax+0x2f8]
   140004935:	48 89 5c 24 70       	mov    QWORD PTR [rsp+0x70],rbx
   14000493a:	48 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],rdi
   14000493f:	85 d2                	test   edx,edx
   140004941:	0f 85 a8 00 00 00    	jne    0x1400049ef
   140004947:	85 c9                	test   ecx,ecx
   140004949:	74 49                	je     0x140004994
   14000494b:	33 db                	xor    ebx,ebx
   14000494d:	48 8b fe             	mov    rdi,rsi
   140004950:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
   140004957:	e8 e0 4c 00 00       	call   0x14000963c
   14000495c:	8b c8                	mov    ecx,eax
   14000495e:	83 f8 ff             	cmp    eax,0xffffffff
   140004961:	74 23                	je     0x140004986
   140004963:	88 0f                	mov    BYTE PTR [rdi],cl
   140004965:	ff c3                	inc    ebx
   140004967:	48 8b 05 12 9f 00 00 	mov    rax,QWORD PTR [rip+0x9f12]        # 0x14000e880
   14000496e:	48 ff c7             	inc    rdi
   140004971:	3b 98 e8 02 00 00    	cmp    ebx,DWORD PTR [rax+0x2e8]
   140004977:	0f 8d 83 00 00 00    	jge    0x140004a00
   14000497d:	83 f9 0a             	cmp    ecx,0xa
   140004980:	74 04                	je     0x140004986
   140004982:	85 c9                	test   ecx,ecx
   140004984:	75 ca                	jne    0x140004950
   140004986:	48 63 c3             	movsxd rax,ebx
   140004989:	c6 04 30 00          	mov    BYTE PTR [rax+rsi*1],0x0
   14000498d:	48 8b 05 ec 9e 00 00 	mov    rax,QWORD PTR [rip+0x9eec]        # 0x14000e880
   140004994:	48 63 88 f8 02 00 00 	movsxd rcx,DWORD PTR [rax+0x2f8]
   14000499b:	0f b6 14 31          	movzx  edx,BYTE PTR [rcx+rsi*1]
   14000499f:	85 d2                	test   edx,edx
   1400049a1:	0f 84 d6 00 00 00    	je     0x140004a7d
   1400049a7:	48 83 78 08 3c       	cmp    QWORD PTR [rax+0x8],0x3c
   1400049ac:	77 09                	ja     0x1400049b7
   1400049ae:	83 fa 0a             	cmp    edx,0xa
   1400049b1:	0f 84 c6 00 00 00    	je     0x140004a7d
   1400049b7:	ff 80 f8 02 00 00    	inc    DWORD PTR [rax+0x2f8]
   1400049bd:	48 8b 05 bc 9e 00 00 	mov    rax,QWORD PTR [rip+0x9ebc]        # 0x14000e880
   1400049c4:	48 3b b0 18 03 00 00 	cmp    rsi,QWORD PTR [rax+0x318]
   1400049cb:	75 0e                	jne    0x1400049db
   1400049cd:	8b 88 e8 02 00 00    	mov    ecx,DWORD PTR [rax+0x2e8]
   1400049d3:	39 88 f8 02 00 00    	cmp    DWORD PTR [rax+0x2f8],ecx
   1400049d9:	7d 25                	jge    0x140004a00
   1400049db:	48 63 88 f8 02 00 00 	movsxd rcx,DWORD PTR [rax+0x2f8]
   1400049e2:	0f b6 14 31          	movzx  edx,BYTE PTR [rcx+rsi*1]
   1400049e6:	85 d2                	test   edx,edx
   1400049e8:	75 bd                	jne    0x1400049a7
   1400049ea:	e9 8e 00 00 00       	jmp    0x140004a7d
   1400049ef:	48 3b b0 18 03 00 00 	cmp    rsi,QWORD PTR [rax+0x318]
   1400049f6:	75 30                	jne    0x140004a28
   1400049f8:	3b 90 e8 02 00 00    	cmp    edx,DWORD PTR [rax+0x2e8]
   1400049fe:	7c 28                	jl     0x140004a28
   140004a00:	b9 11 00 00 00       	mov    ecx,0x11
   140004a05:	e8 e6 f1 ff ff       	call   0x140003bf0
   140004a0a:	48 8b 05 6f 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e6f]        # 0x14000e880
   140004a11:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140004a16:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
   140004a1b:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140004a1e:	33 c0                	xor    eax,eax
   140004a20:	48 83 c4 58          	add    rsp,0x58
   140004a24:	41 5f                	pop    r15
   140004a26:	5e                   	pop    rsi
   140004a27:	c3                   	ret
   140004a28:	85 c9                	test   ecx,ecx
   140004a2a:	74 51                	je     0x140004a7d
   140004a2c:	33 db                	xor    ebx,ebx
   140004a2e:	85 d2                	test   edx,edx
   140004a30:	7e 4b                	jle    0x140004a7d
   140004a32:	48 8b fe             	mov    rdi,rsi
   140004a35:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140004a3c:	00 00 00 00 
   140004a40:	48 8b 88 a0 00 00 00 	mov    rcx,QWORD PTR [rax+0xa0]
   140004a47:	e8 f0 4b 00 00       	call   0x14000963c
   140004a4c:	83 f8 ff             	cmp    eax,0xffffffff
   140004a4f:	74 18                	je     0x140004a69
   140004a51:	88 07                	mov    BYTE PTR [rdi],al
   140004a53:	ff c3                	inc    ebx
   140004a55:	48 8b 05 24 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e24]        # 0x14000e880
   140004a5c:	48 ff c7             	inc    rdi
   140004a5f:	3b 98 f8 02 00 00    	cmp    ebx,DWORD PTR [rax+0x2f8]
   140004a65:	7c d9                	jl     0x140004a40
   140004a67:	eb 14                	jmp    0x140004a7d
   140004a69:	48 8b 05 10 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e10]        # 0x14000e880
   140004a70:	89 98 f8 02 00 00    	mov    DWORD PTR [rax+0x2f8],ebx
   140004a76:	48 8b 05 03 9e 00 00 	mov    rax,QWORD PTR [rip+0x9e03]        # 0x14000e880
   140004a7d:	48 63 88 f8 02 00 00 	movsxd rcx,DWORD PTR [rax+0x2f8]
   140004a84:	33 ff                	xor    edi,edi
   140004a86:	48 89 6c 24 50       	mov    QWORD PTR [rsp+0x50],rbp
   140004a8b:	45 33 c0             	xor    r8d,r8d
   140004a8e:	33 ed                	xor    ebp,ebp
   140004a90:	4c 89 64 24 40       	mov    QWORD PTR [rsp+0x40],r12
   140004a95:	4c 89 74 24 30       	mov    QWORD PTR [rsp+0x30],r14
   140004a9a:	bb 01 00 00 00       	mov    ebx,0x1
   140004a9f:	89 5c 24 20          	mov    DWORD PTR [rsp+0x20],ebx
   140004aa3:	89 bc 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],edi
   140004aaa:	85 c9                	test   ecx,ecx
   140004aac:	7e 65                	jle    0x140004b13
   140004aae:	48 83 78 08 3c       	cmp    QWORD PTR [rax+0x8],0x3c
   140004ab3:	77 5e                	ja     0x140004b13
   140004ab5:	80 7c 31 ff 2f       	cmp    BYTE PTR [rcx+rsi*1-0x1],0x2f
   140004aba:	8d 51 ff             	lea    edx,[rcx-0x1]
   140004abd:	75 0d                	jne    0x140004acc
   140004abf:	89 90 f8 02 00 00    	mov    DWORD PTR [rax+0x2f8],edx
   140004ac5:	48 8b 05 b4 9d 00 00 	mov    rax,QWORD PTR [rip+0x9db4]        # 0x14000e880
   140004acc:	80 3e 20             	cmp    BYTE PTR [rsi],0x20
   140004acf:	75 0f                	jne    0x140004ae0
   140004ad1:	48 8b ce             	mov    rcx,rsi
   140004ad4:	41 ff c0             	inc    r8d
   140004ad7:	48 8d 49 01          	lea    rcx,[rcx+0x1]
   140004adb:	80 39 20             	cmp    BYTE PTR [rcx],0x20
   140004ade:	74 f4                	je     0x140004ad4
   140004ae0:	49 63 c8             	movsxd rcx,r8d
   140004ae3:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140004ae9:	0f b6 14 31          	movzx  edx,BYTE PTR [rcx+rsi*1]
   140004aed:	41 8d 48 01          	lea    ecx,[r8+0x1]
   140004af1:	80 fa 2d             	cmp    dl,0x2d
   140004af4:	41 0f 45 c8          	cmovne ecx,r8d
   140004af8:	44 0f 45 cb          	cmovne r9d,ebx
   140004afc:	4c 63 c1             	movsxd r8,ecx
   140004aff:	44 89 4c 24 20       	mov    DWORD PTR [rsp+0x20],r9d
   140004b04:	41 80 3c 30 2b       	cmp    BYTE PTR [r8+rsi*1],0x2b
   140004b09:	75 08                	jne    0x140004b13
   140004b0b:	41 ff c0             	inc    r8d
   140004b0e:	44 89 4c 24 20       	mov    DWORD PTR [rsp+0x20],r9d
   140004b13:	8b 88 f8 02 00 00    	mov    ecx,DWORD PTR [rax+0x2f8]
   140004b19:	45 33 f6             	xor    r14d,r14d
   140004b1c:	ff c9                	dec    ecx
   140004b1e:	4d 63 c0             	movsxd r8,r8d
   140004b21:	4c 63 e1             	movsxd r12,ecx
   140004b24:	8b d3                	mov    edx,ebx
   140004b26:	4c 89 6c 24 38       	mov    QWORD PTR [rsp+0x38],r13
   140004b2b:	89 9c 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],ebx
   140004b32:	4c 89 44 24 28       	mov    QWORD PTR [rsp+0x28],r8
   140004b37:	4d 3b e0             	cmp    r12,r8
   140004b3a:	0f 8c 38 02 00 00    	jl     0x140004d78
   140004b40:	44 8b ac 24 80 00 00 	mov    r13d,DWORD PTR [rsp+0x80]
   140004b47:	00 
   140004b48:	49 8b c8             	mov    rcx,r8
   140004b4b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140004b50:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   140004b54:	41 0f b6 3c 34       	movzx  edi,BYTE PTR [r12+rsi*1]
   140004b59:	49 83 f8 3c          	cmp    r8,0x3c
   140004b5d:	0f 86 b8 00 00 00    	jbe    0x140004c1b
   140004b63:	49 83 f8 40          	cmp    r8,0x40
   140004b67:	75 4b                	jne    0x140004bb4
   140004b69:	8d 57 50             	lea    edx,[rdi+0x50]
   140004b6c:	83 fa 70             	cmp    edx,0x70
   140004b6f:	0f 86 c9 01 00 00    	jbe    0x140004d3e
   140004b75:	8d 8a 6f ff ff ff    	lea    ecx,[rdx-0x91]
   140004b7b:	83 f9 19             	cmp    ecx,0x19
   140004b7e:	8d ba 6f ff ff ff    	lea    edi,[rdx-0x91]
   140004b84:	0f 47 fa             	cmova  edi,edx
   140004b87:	8d 8f 4f ff ff ff    	lea    ecx,[rdi-0xb1]
   140004b8d:	83 f9 19             	cmp    ecx,0x19
   140004b90:	77 06                	ja     0x140004b98
   140004b92:	81 c7 69 ff ff ff    	add    edi,0xffffff69
   140004b98:	8d 4f 80             	lea    ecx,[rdi-0x80]
   140004b9b:	83 f9 09             	cmp    ecx,0x9
   140004b9e:	77 03                	ja     0x140004ba3
   140004ba0:	83 ef 4c             	sub    edi,0x4c
   140004ba3:	83 ff 7b             	cmp    edi,0x7b
   140004ba6:	75 57                	jne    0x140004bff
   140004ba8:	bf 3e 00 00 00       	mov    edi,0x3e
   140004bad:	8b 94 24 80 00 00 00 	mov    edx,DWORD PTR [rsp+0x80]
   140004bb4:	48 63 cf             	movsxd rcx,edi
   140004bb7:	49 3b c8             	cmp    rcx,r8
   140004bba:	0f 83 3e 02 00 00    	jae    0x140004dfe
   140004bc0:	41 83 fe 02          	cmp    r14d,0x2
   140004bc4:	0f 8f 34 02 00 00    	jg     0x140004dfe
   140004bca:	45 85 f6             	test   r14d,r14d
   140004bcd:	0f 84 20 01 00 00    	je     0x140004cf3
   140004bd3:	85 d2                	test   edx,edx
   140004bd5:	0f 84 18 01 00 00    	je     0x140004cf3
   140004bdb:	43 8d 0c 36          	lea    ecx,[r14+r14*1]
   140004bdf:	44 8b ef             	mov    r13d,edi
   140004be2:	8b bc 24 88 00 00 00 	mov    edi,DWORD PTR [rsp+0x88]
   140004be9:	41 d3 fd             	sar    r13d,cl
   140004bec:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140004bf1:	33 d2                	xor    edx,edx
   140004bf3:	89 94 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],edx
   140004bfa:	e9 4d 01 00 00       	jmp    0x140004d4c
   140004bff:	83 ff 7f             	cmp    edi,0x7f
   140004c02:	75 07                	jne    0x140004c0b
   140004c04:	bf 3f 00 00 00       	mov    edi,0x3f
   140004c09:	eb a2                	jmp    0x140004bad
   140004c0b:	81 ff 8d 00 00 00    	cmp    edi,0x8d
   140004c11:	75 9a                	jne    0x140004bad
   140004c13:	41 ff c6             	inc    r14d
   140004c16:	e9 1e 01 00 00       	jmp    0x140004d39
   140004c1b:	83 bc 24 88 00 00 00 	cmp    DWORD PTR [rsp+0x88],0x0
   140004c22:	00 
   140004c23:	75 7c                	jne    0x140004ca1
   140004c25:	83 ff 2f             	cmp    edi,0x2f
   140004c28:	75 33                	jne    0x140004c5d
   140004c2a:	48 8b 90 48 02 00 00 	mov    rdx,QWORD PTR [rax+0x248]
   140004c31:	49 8b cf             	mov    rcx,r15
   140004c34:	8b fb                	mov    edi,ebx
   140004c36:	89 9c 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],ebx
   140004c3d:	e8 4e d8 ff ff       	call   0x140002490
   140004c42:	49 8b cf             	mov    rcx,r15
   140004c45:	e8 f6 fb ff ff       	call   0x140004840
   140004c4a:	48 8b 05 2f 9c 00 00 	mov    rax,QWORD PTR [rip+0x9c2f]        # 0x14000e880
   140004c51:	33 ed                	xor    ebp,ebp
   140004c53:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140004c58:	e9 e8 00 00 00       	jmp    0x140004d45
   140004c5d:	83 ff 2e             	cmp    edi,0x2e
   140004c60:	75 3f                	jne    0x140004ca1
   140004c62:	48 8b 88 48 02 00 00 	mov    rcx,QWORD PTR [rax+0x248]
   140004c69:	8b fb                	mov    edi,ebx
   140004c6b:	89 9c 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],ebx
   140004c72:	e8 c9 fb ff ff       	call   0x140004840
   140004c77:	48 8b 15 02 9c 00 00 	mov    rdx,QWORD PTR [rip+0x9c02]        # 0x14000e880
   140004c7e:	44 8d 45 01          	lea    r8d,[rbp+0x1]
   140004c82:	8b cb                	mov    ecx,ebx
   140004c84:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   140004c8b:	e8 70 f9 ff ff       	call   0x140004600
   140004c90:	48 8b 05 e9 9b 00 00 	mov    rax,QWORD PTR [rip+0x9be9]        # 0x14000e880
   140004c97:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140004c9c:	e9 a4 00 00 00       	jmp    0x140004d45
   140004ca1:	8d 4f d0             	lea    ecx,[rdi-0x30]
   140004ca4:	8d 57 50             	lea    edx,[rdi+0x50]
   140004ca7:	83 c7 d0             	add    edi,0xffffffd0
   140004caa:	83 f9 09             	cmp    ecx,0x9
   140004cad:	0f 47 fa             	cmova  edi,edx
   140004cb0:	8d 8f 6f ff ff ff    	lea    ecx,[rdi-0x91]
   140004cb6:	83 f9 19             	cmp    ecx,0x19
   140004cb9:	77 06                	ja     0x140004cc1
   140004cbb:	81 c7 79 ff ff ff    	add    edi,0xffffff79
   140004cc1:	8d 8f 4f ff ff ff    	lea    ecx,[rdi-0xb1]
   140004cc7:	83 f9 19             	cmp    ecx,0x19
   140004cca:	0f 87 dd fe ff ff    	ja     0x140004bad
   140004cd0:	8b 94 24 80 00 00 00 	mov    edx,DWORD PTR [rsp+0x80]
   140004cd7:	49 83 f8 10          	cmp    r8,0x10
   140004cdb:	77 0b                	ja     0x140004ce8
   140004cdd:	81 ef a7 00 00 00    	sub    edi,0xa7
   140004ce3:	e9 cc fe ff ff       	jmp    0x140004bb4
   140004ce8:	81 ef 8d 00 00 00    	sub    edi,0x8d
   140004cee:	e9 c1 fe ff ff       	jmp    0x140004bb4
   140004cf3:	ff c5                	inc    ebp
   140004cf5:	49 8b d7             	mov    rdx,r15
   140004cf8:	44 8b c5             	mov    r8d,ebp
   140004cfb:	45 85 f6             	test   r14d,r14d
   140004cfe:	74 2b                	je     0x140004d2b
   140004d00:	b9 06 00 00 00       	mov    ecx,0x6
   140004d05:	43 8d 1c 36          	lea    ebx,[r14+r14*1]
   140004d09:	2b cb                	sub    ecx,ebx
   140004d0b:	8b c7                	mov    eax,edi
   140004d0d:	d3 e0                	shl    eax,cl
   140004d0f:	41 0b c5             	or     eax,r13d
   140004d12:	83 e0 3f             	and    eax,0x3f
   140004d15:	8b c8                	mov    ecx,eax
   140004d17:	e8 e4 f8 ff ff       	call   0x140004600
   140004d1c:	8b cb                	mov    ecx,ebx
   140004d1e:	44 8b ef             	mov    r13d,edi
   140004d21:	41 d3 fd             	sar    r13d,cl
   140004d24:	bb 01 00 00 00       	mov    ebx,0x1
   140004d29:	eb 07                	jmp    0x140004d32
   140004d2b:	8b cf                	mov    ecx,edi
   140004d2d:	e8 ce f8 ff ff       	call   0x140004600
   140004d32:	48 8b 05 47 9b 00 00 	mov    rax,QWORD PTR [rip+0x9b47]        # 0x14000e880
   140004d39:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140004d3e:	8b bc 24 88 00 00 00 	mov    edi,DWORD PTR [rsp+0x88]
   140004d45:	8b 94 24 80 00 00 00 	mov    edx,DWORD PTR [rsp+0x80]
   140004d4c:	49 ff cc             	dec    r12
   140004d4f:	4c 3b e1             	cmp    r12,rcx
   140004d52:	0f 8d f8 fd ff ff    	jge    0x140004b50
   140004d58:	45 85 f6             	test   r14d,r14d
   140004d5b:	74 1b                	je     0x140004d78
   140004d5d:	45 85 ed             	test   r13d,r13d
   140004d60:	7e 16                	jle    0x140004d78
   140004d62:	44 8d 45 01          	lea    r8d,[rbp+0x1]
   140004d66:	49 8b d7             	mov    rdx,r15
   140004d69:	41 8b cd             	mov    ecx,r13d
   140004d6c:	e8 8f f8 ff ff       	call   0x140004600
   140004d71:	48 8b 05 08 9b 00 00 	mov    rax,QWORD PTR [rip+0x9b08]        # 0x14000e880
   140004d78:	8b 98 f8 02 00 00    	mov    ebx,DWORD PTR [rax+0x2f8]
   140004d7e:	49 8b d7             	mov    rdx,r15
   140004d81:	8b 4c 24 20          	mov    ecx,DWORD PTR [rsp+0x20]
   140004d85:	c7 80 f8 02 00 00 00 	mov    DWORD PTR [rax+0x2f8],0x0
   140004d8c:	00 00 00 
   140004d8f:	e8 8c dc ff ff       	call   0x140002a20
   140004d94:	49 8b cf             	mov    rcx,r15
   140004d97:	e8 c4 f1 ff ff       	call   0x140003f60
   140004d9c:	48 8b 0d dd 9a 00 00 	mov    rcx,QWORD PTR [rip+0x9add]        # 0x14000e880
   140004da3:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   140004daa:	e8 b1 f1 ff ff       	call   0x140003f60
   140004daf:	85 ff                	test   edi,edi
   140004db1:	74 19                	je     0x140004dcc
   140004db3:	48 8b 15 c6 9a 00 00 	mov    rdx,QWORD PTR [rip+0x9ac6]        # 0x14000e880
   140004dba:	4d 8b c7             	mov    r8,r15
   140004dbd:	49 8b cf             	mov    rcx,r15
   140004dc0:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   140004dc7:	e8 e4 d7 ff ff       	call   0x1400025b0
   140004dcc:	48 8b 0d ad 9a 00 00 	mov    rcx,QWORD PTR [rip+0x9aad]        # 0x14000e880
   140004dd3:	8b c3                	mov    eax,ebx
   140004dd5:	ff 49 2c             	dec    DWORD PTR [rcx+0x2c]
   140004dd8:	4c 8b 6c 24 38       	mov    r13,QWORD PTR [rsp+0x38]
   140004ddd:	4c 8b 64 24 40       	mov    r12,QWORD PTR [rsp+0x40]
   140004de2:	48 8b 6c 24 50       	mov    rbp,QWORD PTR [rsp+0x50]
   140004de7:	4c 8b 74 24 30       	mov    r14,QWORD PTR [rsp+0x30]
   140004dec:	48 8b 5c 24 70       	mov    rbx,QWORD PTR [rsp+0x70]
   140004df1:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
   140004df6:	48 83 c4 58          	add    rsp,0x58
   140004dfa:	41 5f                	pop    r15
   140004dfc:	5e                   	pop    rsi
   140004dfd:	c3                   	ret
   140004dfe:	b9 05 00 00 00       	mov    ecx,0x5
   140004e03:	e8 e8 ed ff ff       	call   0x140003bf0
   140004e08:	48 8b 05 71 9a 00 00 	mov    rax,QWORD PTR [rip+0x9a71]        # 0x14000e880
   140004e0f:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140004e12:	33 c0                	xor    eax,eax
   140004e14:	eb c2                	jmp    0x140004dd8
   140004e16:	b9 01 00 00 00       	mov    ecx,0x1
   140004e1b:	e9 d6 fa ff ff       	jmp    0x1400048f6
   140004e20:	40 55                	rex push rbp
   140004e22:	53                   	push   rbx
   140004e23:	57                   	push   rdi
   140004e24:	48 8d 6c 24 b9       	lea    rbp,[rsp-0x47]
   140004e29:	48 81 ec e0 00 00 00 	sub    rsp,0xe0
   140004e30:	48 8b 05 69 99 00 00 	mov    rax,QWORD PTR [rip+0x9969]        # 0x14000e7a0
   140004e37:	48 33 c4             	xor    rax,rsp
   140004e3a:	48 89 45 27          	mov    QWORD PTR [rbp+0x27],rax
   140004e3e:	48 8b c2             	mov    rax,rdx
   140004e41:	49 8b d8             	mov    rbx,r8
   140004e44:	48 8b 15 35 9a 00 00 	mov    rdx,QWORD PTR [rip+0x9a35]        # 0x14000e880
   140004e4b:	48 8b f9             	mov    rdi,rcx
   140004e4e:	83 ba f0 02 00 00 00 	cmp    DWORD PTR [rdx+0x2f0],0x0
   140004e55:	0f 85 62 03 00 00    	jne    0x1400051bd
   140004e5b:	48 8b 92 50 02 00 00 	mov    rdx,QWORD PTR [rdx+0x250]
   140004e62:	48 8b c8             	mov    rcx,rax
   140004e65:	e8 26 d6 ff ff       	call   0x140002490
   140004e6a:	48 8b 15 0f 9a 00 00 	mov    rdx,QWORD PTR [rip+0x9a0f]        # 0x14000e880
   140004e71:	48 8b cf             	mov    rcx,rdi
   140004e74:	48 8b 92 60 02 00 00 	mov    rdx,QWORD PTR [rdx+0x260]
   140004e7b:	e8 10 d6 ff ff       	call   0x140002490
   140004e80:	48 8b 05 f9 99 00 00 	mov    rax,QWORD PTR [rip+0x99f9]        # 0x14000e880
   140004e87:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140004e8a:	48 8b 15 ef 99 00 00 	mov    rdx,QWORD PTR [rip+0x99ef]        # 0x14000e880
   140004e91:	48 63 42 2c          	movsxd rax,DWORD PTR [rdx+0x2c]
   140004e95:	83 f8 18             	cmp    eax,0x18
   140004e98:	7d 1d                	jge    0x140004eb7
   140004e9a:	c7 44 82 30 54 00 00 	mov    DWORD PTR [rdx+rax*4+0x30],0x54
   140004ea1:	00 
   140004ea2:	48 8b 05 d7 99 00 00 	mov    rax,QWORD PTR [rip+0x99d7]        # 0x14000e880
   140004ea9:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   140004eb0:	74 05                	je     0x140004eb7
   140004eb2:	e8 49 f4 ff ff       	call   0x140004300
   140004eb7:	48 8b cb             	mov    rcx,rbx
   140004eba:	e8 81 f9 ff ff       	call   0x140004840
   140004ebf:	48 8b cf             	mov    rcx,rdi
   140004ec2:	e8 39 f9 ff ff       	call   0x140004800
   140004ec7:	48 8b 0d b2 99 00 00 	mov    rcx,QWORD PTR [rip+0x99b2]        # 0x14000e880
   140004ece:	85 c0                	test   eax,eax
   140004ed0:	75 32                	jne    0x140004f04
   140004ed2:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140004ed9:	e8 22 f9 ff ff       	call   0x140004800
   140004ede:	85 c0                	test   eax,eax
   140004ee0:	75 16                	jne    0x140004ef8
   140004ee2:	48 8b 0d 97 99 00 00 	mov    rcx,QWORD PTR [rip+0x9997]        # 0x14000e880
   140004ee9:	48 8b d3             	mov    rdx,rbx
   140004eec:	48 8b 89 d0 02 00 00 	mov    rcx,QWORD PTR [rcx+0x2d0]
   140004ef3:	e8 98 d5 ff ff       	call   0x140002490
   140004ef8:	48 8b 05 81 99 00 00 	mov    rax,QWORD PTR [rip+0x9981]        # 0x14000e880
   140004eff:	e9 b6 02 00 00       	jmp    0x1400051ba
   140004f04:	48 8b 89 d0 02 00 00 	mov    rcx,QWORD PTR [rcx+0x2d0]
   140004f0b:	48 8b d3             	mov    rdx,rbx
   140004f0e:	e8 7d d5 ff ff       	call   0x140002490
   140004f13:	48 8b 0d 66 99 00 00 	mov    rcx,QWORD PTR [rip+0x9966]        # 0x14000e880
   140004f1a:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140004f21:	e8 da f8 ff ff       	call   0x140004800
   140004f26:	85 c0                	test   eax,eax
   140004f28:	74 ce                	je     0x140004ef8
   140004f2a:	48 8b 0d 4f 99 00 00 	mov    rcx,QWORD PTR [rip+0x994f]        # 0x14000e880
   140004f31:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140004f38:	e8 c3 f8 ff ff       	call   0x140004800
   140004f3d:	85 c0                	test   eax,eax
   140004f3f:	79 0a                	jns    0x140004f4b
   140004f41:	b9 0a 00 00 00       	mov    ecx,0xa
   140004f46:	e8 a5 ec ff ff       	call   0x140003bf0
   140004f4b:	4c 8b 05 2e 99 00 00 	mov    r8,QWORD PTR [rip+0x992e]        # 0x14000e880
   140004f52:	41 83 b8 f0 02 00 00 	cmp    DWORD PTR [r8+0x2f0],0x0
   140004f59:	00 
   140004f5a:	74 09                	je     0x140004f65
   140004f5c:	41 ff 48 2c          	dec    DWORD PTR [r8+0x2c]
   140004f60:	e9 58 02 00 00       	jmp    0x1400051bd
   140004f65:	49 8b 40 18          	mov    rax,QWORD PTR [r8+0x18]
   140004f69:	49 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [r8+0x260]
   140004f70:	48 89 b4 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],rsi
   140004f77:	00 
   140004f78:	4c 89 b4 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],r14
   140004f7f:	00 
   140004f80:	49 39 00             	cmp    QWORD PTR [r8],rax
   140004f83:	0f 85 4b 02 00 00    	jne    0x1400051d4
   140004f89:	49 8b 80 68 02 00 00 	mov    rax,QWORD PTR [r8+0x268]
   140004f90:	0f 57 c0             	xorps  xmm0,xmm0
   140004f93:	48 89 45 af          	mov    QWORD PTR [rbp-0x51],rax
   140004f97:	48 8b d1             	mov    rdx,rcx
   140004f9a:	49 8b 80 70 02 00 00 	mov    rax,QWORD PTR [r8+0x270]
   140004fa1:	48 89 45 b7          	mov    QWORD PTR [rbp-0x49],rax
   140004fa5:	49 8b 80 b8 02 00 00 	mov    rax,QWORD PTR [r8+0x2b8]
   140004fac:	48 89 45 bf          	mov    QWORD PTR [rbp-0x41],rax
   140004fb0:	49 8b 80 78 02 00 00 	mov    rax,QWORD PTR [r8+0x278]
   140004fb7:	48 89 45 cf          	mov    QWORD PTR [rbp-0x31],rax
   140004fbb:	49 8b 80 c0 02 00 00 	mov    rax,QWORD PTR [r8+0x2c0]
   140004fc2:	48 89 45 d7          	mov    QWORD PTR [rbp-0x29],rax
   140004fc6:	49 8b 80 88 02 00 00 	mov    rax,QWORD PTR [r8+0x288]
   140004fcd:	48 89 45 df          	mov    QWORD PTR [rbp-0x21],rax
   140004fd1:	49 8b 80 90 02 00 00 	mov    rax,QWORD PTR [r8+0x290]
   140004fd8:	48 89 45 f7          	mov    QWORD PTR [rbp-0x9],rax
   140004fdc:	49 8b 80 98 02 00 00 	mov    rax,QWORD PTR [r8+0x298]
   140004fe3:	48 89 45 ff          	mov    QWORD PTR [rbp-0x1],rax
   140004fe7:	49 8b 80 a0 02 00 00 	mov    rax,QWORD PTR [r8+0x2a0]
   140004fee:	48 89 45 0f          	mov    QWORD PTR [rbp+0xf],rax
   140004ff2:	49 8b 80 a8 02 00 00 	mov    rax,QWORD PTR [r8+0x2a8]
   140004ff9:	48 89 45 17          	mov    QWORD PTR [rbp+0x17],rax
   140004ffd:	49 8b 80 b0 02 00 00 	mov    rax,QWORD PTR [r8+0x2b0]
   140005004:	4d 8b 80 58 02 00 00 	mov    r8,QWORD PTR [r8+0x258]
   14000500b:	48 89 45 1f          	mov    QWORD PTR [rbp+0x1f],rax
   14000500f:	48 89 4d a7          	mov    QWORD PTR [rbp-0x59],rcx
   140005013:	48 c7 45 c7 00 00 00 	mov    QWORD PTR [rbp-0x39],0x0
   14000501a:	00 
   14000501b:	66 0f 7f 45 e7       	movdqa XMMWORD PTR [rbp-0x19],xmm0
   140005020:	48 c7 45 07 00 00 00 	mov    QWORD PTR [rbp+0x7],0x0
   140005027:	00 
   140005028:	e8 a3 25 00 00       	call   0x1400075d0
   14000502d:	33 c9                	xor    ecx,ecx
   14000502f:	90                   	nop
   140005030:	48 8d 79 01          	lea    rdi,[rcx+0x1]
   140005034:	be 01 00 00 00       	mov    esi,0x1
   140005039:	48 83 7c fd a7 00    	cmp    QWORD PTR [rbp+rdi*8-0x59],0x0
   14000503f:	75 0d                	jne    0x14000504e
   140005041:	48 ff c7             	inc    rdi
   140005044:	ff c6                	inc    esi
   140005046:	48 83 7c fd a7 00    	cmp    QWORD PTR [rbp+rdi*8-0x59],0x0
   14000504c:	74 f3                	je     0x140005041
   14000504e:	4c 8b 74 fd a7       	mov    r14,QWORD PTR [rbp+rdi*8-0x59]
   140005053:	48 8b 4c cd a7       	mov    rcx,QWORD PTR [rbp+rcx*8-0x59]
   140005058:	49 8b d6             	mov    rdx,r14
   14000505b:	e8 30 d4 ff ff       	call   0x140002490
   140005060:	85 f6                	test   esi,esi
   140005062:	7e 2b                	jle    0x14000508f
   140005064:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140005068:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000506f:	00 
   140005070:	48 8b 15 09 98 00 00 	mov    rdx,QWORD PTR [rip+0x9809]        # 0x14000e880
   140005077:	4d 8b c6             	mov    r8,r14
   14000507a:	49 8b ce             	mov    rcx,r14
   14000507d:	48 8b 92 58 02 00 00 	mov    rdx,QWORD PTR [rdx+0x258]
   140005084:	e8 47 25 00 00       	call   0x1400075d0
   140005089:	48 83 ee 01          	sub    rsi,0x1
   14000508d:	75 e1                	jne    0x140005070
   14000508f:	48 8b cf             	mov    rcx,rdi
   140005092:	48 83 ff 0f          	cmp    rdi,0xf
   140005096:	7c 98                	jl     0x140005030
   140005098:	48 8b 0d e1 97 00 00 	mov    rcx,QWORD PTR [rip+0x97e1]        # 0x14000e880
   14000509f:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   1400050a6:	e8 45 22 00 00       	call   0x1400072f0
   1400050ab:	48 8b 0d ce 97 00 00 	mov    rcx,QWORD PTR [rip+0x97ce]        # 0x14000e880
   1400050b2:	48 8b d3             	mov    rdx,rbx
   1400050b5:	44 8b f0             	mov    r14d,eax
   1400050b8:	48 8b 89 60 02 00 00 	mov    rcx,QWORD PTR [rcx+0x260]
   1400050bf:	e8 cc d3 ff ff       	call   0x140002490
   1400050c4:	41 83 fe 01          	cmp    r14d,0x1
   1400050c8:	0f 8e d5 00 00 00    	jle    0x1400051a3
   1400050ce:	41 83 c6 fe          	add    r14d,0xfffffffe
   1400050d2:	0f 88 cb 00 00 00    	js     0x1400051a3
   1400050d8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   1400050df:	00 
   1400050e0:	48 8b 0d 99 97 00 00 	mov    rcx,QWORD PTR [rip+0x9799]        # 0x14000e880
   1400050e7:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   1400050eb:	48 85 c0             	test   rax,rax
   1400050ee:	74 09                	je     0x1400050f9
   1400050f0:	ff d0                	call   rax
   1400050f2:	48 8b 0d 87 97 00 00 	mov    rcx,QWORD PTR [rip+0x9787]        # 0x14000e880
   1400050f9:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140005100:	4c 8d 4d 9b          	lea    r9,[rbp-0x65]
   140005104:	4c 8d 45 97          	lea    r8,[rbp-0x69]
   140005108:	c7 44 24 20 05 00 00 	mov    DWORD PTR [rsp+0x20],0x5
   14000510f:	00 
   140005110:	41 8b d6             	mov    edx,r14d
   140005113:	e8 b8 f2 ff ff       	call   0x1400043d0
   140005118:	8b 4d 97             	mov    ecx,DWORD PTR [rbp-0x69]
   14000511b:	33 ff                	xor    edi,edi
   14000511d:	8b f0                	mov    esi,eax
   14000511f:	85 c9                	test   ecx,ecx
   140005121:	7e 24                	jle    0x140005147
   140005123:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140005127:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000512e:	00 00 
   140005130:	4c 8b c3             	mov    r8,rbx
   140005133:	48 8b d3             	mov    rdx,rbx
   140005136:	48 8b cb             	mov    rcx,rbx
   140005139:	e8 92 24 00 00       	call   0x1400075d0
   14000513e:	8b 4d 97             	mov    ecx,DWORD PTR [rbp-0x69]
   140005141:	ff c7                	inc    edi
   140005143:	3b f9                	cmp    edi,ecx
   140005145:	7c e9                	jl     0x140005130
   140005147:	85 f6                	test   esi,esi
   140005149:	7e 1c                	jle    0x140005167
   14000514b:	79 02                	jns    0x14000514f
   14000514d:	ff c6                	inc    esi
   14000514f:	d1 fe                	sar    esi,1
   140005151:	4c 8b c3             	mov    r8,rbx
   140005154:	48 63 d6             	movsxd rdx,esi
   140005157:	48 8b cb             	mov    rcx,rbx
   14000515a:	48 8b 54 d5 a7       	mov    rdx,QWORD PTR [rbp+rdx*8-0x59]
   14000515f:	e8 6c 24 00 00       	call   0x1400075d0
   140005164:	8b 4d 97             	mov    ecx,DWORD PTR [rbp-0x69]
   140005167:	8b 45 9b             	mov    eax,DWORD PTR [rbp-0x65]
   14000516a:	44 2b f1             	sub    r14d,ecx
   14000516d:	85 c0                	test   eax,eax
   14000516f:	74 29                	je     0x14000519a
   140005171:	33 ff                	xor    edi,edi
   140005173:	85 c0                	test   eax,eax
   140005175:	7e 20                	jle    0x140005197
   140005177:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000517e:	00 00 
   140005180:	4c 8b c3             	mov    r8,rbx
   140005183:	48 8b d3             	mov    rdx,rbx
   140005186:	48 8b cb             	mov    rcx,rbx
   140005189:	e8 42 24 00 00       	call   0x1400075d0
   14000518e:	8b 45 9b             	mov    eax,DWORD PTR [rbp-0x65]
   140005191:	ff c7                	inc    edi
   140005193:	3b f8                	cmp    edi,eax
   140005195:	7c e9                	jl     0x140005180
   140005197:	44 2b f0             	sub    r14d,eax
   14000519a:	45 85 f6             	test   r14d,r14d
   14000519d:	0f 89 3d ff ff ff    	jns    0x1400050e0
   1400051a3:	48 8b 05 d6 96 00 00 	mov    rax,QWORD PTR [rip+0x96d6]        # 0x14000e880
   1400051aa:	4c 8b b4 24 d0 00 00 	mov    r14,QWORD PTR [rsp+0xd0]
   1400051b1:	00 
   1400051b2:	48 8b b4 24 d8 00 00 	mov    rsi,QWORD PTR [rsp+0xd8]
   1400051b9:	00 
   1400051ba:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400051bd:	48 8b 4d 27          	mov    rcx,QWORD PTR [rbp+0x27]
   1400051c1:	48 33 cc             	xor    rcx,rsp
   1400051c4:	e8 37 37 00 00       	call   0x140008900
   1400051c9:	48 81 c4 e0 00 00 00 	add    rsp,0xe0
   1400051d0:	5f                   	pop    rdi
   1400051d1:	5b                   	pop    rbx
   1400051d2:	5d                   	pop    rbp
   1400051d3:	c3                   	ret
   1400051d4:	49 8b 90 58 02 00 00 	mov    rdx,QWORD PTR [r8+0x258]
   1400051db:	e8 b0 d2 ff ff       	call   0x140002490
   1400051e0:	48 8b 0d 99 96 00 00 	mov    rcx,QWORD PTR [rip+0x9699]        # 0x14000e880
   1400051e7:	48 8b 41 20          	mov    rax,QWORD PTR [rcx+0x20]
   1400051eb:	48 85 c0             	test   rax,rax
   1400051ee:	74 09                	je     0x1400051f9
   1400051f0:	ff d0                	call   rax
   1400051f2:	48 8b 0d 87 96 00 00 	mov    rcx,QWORD PTR [rip+0x9687]        # 0x14000e880
   1400051f9:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140005200:	ba 02 00 00 00       	mov    edx,0x2
   140005205:	4c 8b c1             	mov    r8,rcx
   140005208:	e8 c3 18 00 00       	call   0x140006ad0
   14000520d:	85 c0                	test   eax,eax
   14000520f:	74 19                	je     0x14000522a
   140005211:	48 8b 15 68 96 00 00 	mov    rdx,QWORD PTR [rip+0x9668]        # 0x14000e880
   140005218:	4c 8b c3             	mov    r8,rbx
   14000521b:	48 8b cb             	mov    rcx,rbx
   14000521e:	48 8b 92 58 02 00 00 	mov    rdx,QWORD PTR [rdx+0x258]
   140005225:	e8 a6 23 00 00       	call   0x1400075d0
   14000522a:	48 8b 05 4f 96 00 00 	mov    rax,QWORD PTR [rip+0x964f]        # 0x14000e880
   140005231:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140005238:	0f 85 6c ff ff ff    	jne    0x1400051aa
   14000523e:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
   140005245:	e8 b6 f5 ff ff       	call   0x140004800
   14000524a:	85 c0                	test   eax,eax
   14000524c:	0f 84 51 ff ff ff    	je     0x1400051a3
   140005252:	48 8b 05 27 96 00 00 	mov    rax,QWORD PTR [rip+0x9627]        # 0x14000e880
   140005259:	48 8b 88 58 02 00 00 	mov    rcx,QWORD PTR [rax+0x258]
   140005260:	4c 8b c1             	mov    r8,rcx
   140005263:	48 8b d1             	mov    rdx,rcx
   140005266:	e8 65 23 00 00       	call   0x1400075d0
   14000526b:	e9 70 ff ff ff       	jmp    0x1400051e0
   140005270:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140005275:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   14000527a:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   14000527f:	41 56                	push   r14
   140005281:	48 83 ec 30          	sub    rsp,0x30
   140005285:	48 8b 05 f4 95 00 00 	mov    rax,QWORD PTR [rip+0x95f4]        # 0x14000e880
   14000528c:	49 8b f9             	mov    rdi,r9
   14000528f:	49 8b d8             	mov    rbx,r8
   140005292:	48 8b ea             	mov    rbp,rdx
   140005295:	4c 8b f1             	mov    r14,rcx
   140005298:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   14000529f:	0f 85 cf 00 00 00    	jne    0x140005374
   1400052a5:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   1400052a8:	4c 8b 05 d1 95 00 00 	mov    r8,QWORD PTR [rip+0x95d1]        # 0x14000e880
   1400052af:	48 89 74 24 40       	mov    QWORD PTR [rsp+0x40],rsi
   1400052b4:	49 63 40 2c          	movsxd rax,DWORD PTR [r8+0x2c]
   1400052b8:	83 f8 18             	cmp    eax,0x18
   1400052bb:	7d 26                	jge    0x1400052e3
   1400052bd:	41 c7 44 80 30 12 00 	mov    DWORD PTR [r8+rax*4+0x30],0x12
   1400052c4:	00 00 
   1400052c6:	4c 8b 05 b3 95 00 00 	mov    r8,QWORD PTR [rip+0x95b3]        # 0x14000e880
   1400052cd:	41 83 b8 08 03 00 00 	cmp    DWORD PTR [r8+0x308],0x0
   1400052d4:	00 
   1400052d5:	74 0c                	je     0x1400052e3
   1400052d7:	e8 24 f0 ff ff       	call   0x140004300
   1400052dc:	4c 8b 05 9d 95 00 00 	mov    r8,QWORD PTR [rip+0x959d]        # 0x14000e880
   1400052e3:	49 8b 40 18          	mov    rax,QWORD PTR [r8+0x18]
   1400052e7:	be 01 00 00 00       	mov    esi,0x1
   1400052ec:	48 8b cb             	mov    rcx,rbx
   1400052ef:	49 39 00             	cmp    QWORD PTR [r8],rax
   1400052f2:	0f 84 92 00 00 00    	je     0x14000538a
   1400052f8:	e8 03 f5 ff ff       	call   0x140004800
   1400052fd:	83 f8 02             	cmp    eax,0x2
   140005300:	7c 1b                	jl     0x14000531d
   140005302:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140005306:	48 8b 15 73 95 00 00 	mov    rdx,QWORD PTR [rip+0x9573]        # 0x14000e880
   14000530d:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140005310:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   140005313:	e8 a8 f4 ff ff       	call   0x1400047c0
   140005318:	48 3b c6             	cmp    rax,rsi
   14000531b:	74 02                	je     0x14000531f
   14000531d:	33 f6                	xor    esi,esi
   14000531f:	85 f6                	test   esi,esi
   140005321:	74 75                	je     0x140005398
   140005323:	48 8b cb             	mov    rcx,rbx
   140005326:	e8 d5 23 00 00       	call   0x140007700
   14000532b:	48 8b 15 4e 95 00 00 	mov    rdx,QWORD PTR [rip+0x954e]        # 0x14000e880
   140005332:	49 8b ce             	mov    rcx,r14
   140005335:	48 8b 92 60 02 00 00 	mov    rdx,QWORD PTR [rdx+0x260]
   14000533c:	e8 2f 21 00 00       	call   0x140007470
   140005341:	48 8b 0d 38 95 00 00 	mov    rcx,QWORD PTR [rip+0x9538]        # 0x14000e880
   140005348:	4c 8b c7             	mov    r8,rdi
   14000534b:	48 8b d5             	mov    rdx,rbp
   14000534e:	48 8b 89 60 02 00 00 	mov    rcx,QWORD PTR [rcx+0x260]
   140005355:	e8 c6 fa ff ff       	call   0x140004e20
   14000535a:	48 8b d7             	mov    rdx,rdi
   14000535d:	48 8b cf             	mov    rcx,rdi
   140005360:	e8 2b 27 00 00       	call   0x140007a90
   140005365:	48 8b 05 14 95 00 00 	mov    rax,QWORD PTR [rip+0x9514]        # 0x14000e880
   14000536c:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   14000536f:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140005374:	48 8b 5c 24 48       	mov    rbx,QWORD PTR [rsp+0x48]
   140005379:	48 8b 6c 24 50       	mov    rbp,QWORD PTR [rsp+0x50]
   14000537e:	48 8b 7c 24 58       	mov    rdi,QWORD PTR [rsp+0x58]
   140005383:	48 83 c4 30          	add    rsp,0x30
   140005387:	41 5e                	pop    r14
   140005389:	c3                   	ret
   14000538a:	ba 02 00 00 00       	mov    edx,0x2
   14000538f:	e8 1c 19 00 00       	call   0x140006cb0
   140005394:	85 c0                	test   eax,eax
   140005396:	74 8b                	je     0x140005323
   140005398:	48 8b 15 e1 94 00 00 	mov    rdx,QWORD PTR [rip+0x94e1]        # 0x14000e880
   14000539f:	48 8b cd             	mov    rcx,rbp
   1400053a2:	48 8b 92 50 02 00 00 	mov    rdx,QWORD PTR [rdx+0x250]
   1400053a9:	e8 e2 d0 ff ff       	call   0x140002490
   1400053ae:	48 8b 15 cb 94 00 00 	mov    rdx,QWORD PTR [rip+0x94cb]        # 0x14000e880
   1400053b5:	49 8b ce             	mov    rcx,r14
   1400053b8:	48 8b 92 60 02 00 00 	mov    rdx,QWORD PTR [rdx+0x260]
   1400053bf:	e8 cc d0 ff ff       	call   0x140002490
   1400053c4:	48 8b cf             	mov    rcx,rdi
   1400053c7:	e8 74 f4 ff ff       	call   0x140004840
   1400053cc:	48 8b 0d ad 94 00 00 	mov    rcx,QWORD PTR [rip+0x94ad]        # 0x14000e880
   1400053d3:	48 8b 89 60 02 00 00 	mov    rcx,QWORD PTR [rcx+0x260]
   1400053da:	e8 21 f4 ff ff       	call   0x140004800
   1400053df:	85 c0                	test   eax,eax
   1400053e1:	74 82                	je     0x140005365
   1400053e3:	48 8b d7             	mov    rdx,rdi
   1400053e6:	b9 01 00 00 00       	mov    ecx,0x1
   1400053eb:	e8 90 cf ff ff       	call   0x140002380
   1400053f0:	48 8b 0d 89 94 00 00 	mov    rcx,QWORD PTR [rip+0x9489]        # 0x14000e880
   1400053f7:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   1400053fe:	e8 fd f3 ff ff       	call   0x140004800
   140005403:	85 c0                	test   eax,eax
   140005405:	0f 84 5a ff ff ff    	je     0x140005365
   14000540b:	48 8b 0d 6e 94 00 00 	mov    rcx,QWORD PTR [rip+0x946e]        # 0x14000e880
   140005412:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140005419:	e8 e2 f3 ff ff       	call   0x140004800
   14000541e:	85 c0                	test   eax,eax
   140005420:	79 0a                	jns    0x14000542c
   140005422:	b9 0a 00 00 00       	mov    ecx,0xa
   140005427:	e8 c4 e7 ff ff       	call   0x140003bf0
   14000542c:	48 3b fb             	cmp    rdi,rbx
   14000542f:	75 0a                	jne    0x14000543b
   140005431:	b9 07 00 00 00       	mov    ecx,0x7
   140005436:	e8 b5 e7 ff ff       	call   0x140003bf0
   14000543b:	48 8b 05 3e 94 00 00 	mov    rax,QWORD PTR [rip+0x943e]        # 0x14000e880
   140005442:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140005449:	0f 85 1d ff ff ff    	jne    0x14000536c
   14000544f:	48 8b d3             	mov    rdx,rbx
   140005452:	48 8b cb             	mov    rcx,rbx
   140005455:	e8 26 12 00 00       	call   0x140006680
   14000545a:	48 8b 0d 1f 94 00 00 	mov    rcx,QWORD PTR [rip+0x941f]        # 0x14000e880
   140005461:	4c 8b c3             	mov    r8,rbx
   140005464:	48 8b d3             	mov    rdx,rbx
   140005467:	48 8b f0             	mov    rsi,rax
   14000546a:	48 8b 89 60 02 00 00 	mov    rcx,QWORD PTR [rcx+0x260]
   140005471:	e8 4a 01 00 00       	call   0x1400055c0
   140005476:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000547d:	00 00 00 
   140005480:	48 8b 0d f9 93 00 00 	mov    rcx,QWORD PTR [rip+0x93f9]        # 0x14000e880
   140005487:	48 8b 51 20          	mov    rdx,QWORD PTR [rcx+0x20]
   14000548b:	48 85 d2             	test   rdx,rdx
   14000548e:	74 09                	je     0x140005499
   140005490:	ff d2                	call   rdx
   140005492:	48 8b 0d e7 93 00 00 	mov    rcx,QWORD PTR [rip+0x93e7]        # 0x14000e880
   140005499:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   1400054a0:	ba 02 00 00 00       	mov    edx,0x2
   1400054a5:	4c 8b c1             	mov    r8,rcx
   1400054a8:	e8 23 16 00 00       	call   0x140006ad0
   1400054ad:	85 c0                	test   eax,eax
   1400054af:	74 26                	je     0x1400054d7
   1400054b1:	48 8b 05 c8 93 00 00 	mov    rax,QWORD PTR [rip+0x93c8]        # 0x14000e880
   1400054b8:	4c 8b cb             	mov    r9,rbx
   1400054bb:	48 89 7c 24 28       	mov    QWORD PTR [rsp+0x28],rdi
   1400054c0:	48 8b cf             	mov    rcx,rdi
   1400054c3:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   1400054c8:	48 8b 90 60 02 00 00 	mov    rdx,QWORD PTR [rax+0x260]
   1400054cf:	4c 8b c2             	mov    r8,rdx
   1400054d2:	e8 89 0a 00 00       	call   0x140005f60
   1400054d7:	48 8b 05 a2 93 00 00 	mov    rax,QWORD PTR [rip+0x93a2]        # 0x14000e880
   1400054de:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400054e5:	75 3b                	jne    0x140005522
   1400054e7:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
   1400054ee:	e8 0d f3 ff ff       	call   0x140004800
   1400054f3:	85 c0                	test   eax,eax
   1400054f5:	48 8b 05 84 93 00 00 	mov    rax,QWORD PTR [rip+0x9384]        # 0x14000e880
   1400054fc:	74 24                	je     0x140005522
   1400054fe:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
   140005505:	4c 8b cb             	mov    r9,rbx
   140005508:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   14000550d:	4c 8b c1             	mov    r8,rcx
   140005510:	48 8b d1             	mov    rdx,rcx
   140005513:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140005518:	e8 43 0a 00 00       	call   0x140005f60
   14000551d:	e9 5e ff ff ff       	jmp    0x140005480
   140005522:	48 83 fe 01          	cmp    rsi,0x1
   140005526:	0f 84 40 fe ff ff    	je     0x14000536c
   14000552c:	4c 8b c3             	mov    r8,rbx
   14000552f:	48 8b d6             	mov    rdx,rsi
   140005532:	48 8b cb             	mov    rcx,rbx
   140005535:	e8 a6 13 00 00       	call   0x1400068e0
   14000553a:	4c 8b c3             	mov    r8,rbx
   14000553d:	48 8b d3             	mov    rdx,rbx
   140005540:	48 8b cf             	mov    rcx,rdi
   140005543:	e8 78 00 00 00       	call   0x1400055c0
   140005548:	e9 18 fe ff ff       	jmp    0x140005365
   14000554d:	cc                   	int3
   14000554e:	cc                   	int3
   14000554f:	cc                   	int3
   140005550:	48 83 ec 28          	sub    rsp,0x28
   140005554:	48 8b 05 25 93 00 00 	mov    rax,QWORD PTR [rip+0x9325]        # 0x14000e880
   14000555b:	48 85 c0             	test   rax,rax
   14000555e:	75 0f                	jne    0x14000556f
   140005560:	48 63 d2             	movsxd rdx,edx
   140005563:	48 63 c9             	movsxd rcx,ecx
   140005566:	48 83 c4 28          	add    rsp,0x28
   14000556a:	e9 d3 40 00 00       	jmp    0x140009642
   14000556f:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140005576:	74 07                	je     0x14000557f
   140005578:	33 c0                	xor    eax,eax
   14000557a:	48 83 c4 28          	add    rsp,0x28
   14000557e:	c3                   	ret
   14000557f:	48 63 d2             	movsxd rdx,edx
   140005582:	48 63 c9             	movsxd rcx,ecx
   140005585:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   14000558a:	e8 b3 40 00 00       	call   0x140009642
   14000558f:	48 8b d8             	mov    rbx,rax
   140005592:	48 85 c0             	test   rax,rax
   140005595:	75 08                	jne    0x14000559f
   140005597:	8d 48 08             	lea    ecx,[rax+0x8]
   14000559a:	e8 51 e6 ff ff       	call   0x140003bf0
   14000559f:	48 8b c3             	mov    rax,rbx
   1400055a2:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]
   1400055a7:	48 83 c4 28          	add    rsp,0x28
   1400055ab:	c3                   	ret
   1400055ac:	cc                   	int3
   1400055ad:	cc                   	int3
   1400055ae:	cc                   	int3
   1400055af:	cc                   	int3
   1400055b0:	ba c0 03 00 00       	mov    edx,0x3c0
   1400055b5:	b9 01 00 00 00       	mov    ecx,0x1
   1400055ba:	e9 83 40 00 00       	jmp    0x140009642
   1400055bf:	cc                   	int3
   1400055c0:	4c 8b dc             	mov    r11,rsp
   1400055c3:	4d 89 43 18          	mov    QWORD PTR [r11+0x18],r8
   1400055c7:	49 89 53 10          	mov    QWORD PTR [r11+0x10],rdx
   1400055cb:	49 89 4b 08          	mov    QWORD PTR [r11+0x8],rcx
   1400055cf:	41 54                	push   r12
   1400055d1:	41 56                	push   r14
   1400055d3:	41 57                	push   r15
   1400055d5:	48 81 ec c0 00 00 00 	sub    rsp,0xc0
   1400055dc:	48 8b 05 9d 92 00 00 	mov    rax,QWORD PTR [rip+0x929d]        # 0x14000e880
   1400055e3:	4d 8b f0             	mov    r14,r8
   1400055e6:	4c 8b fa             	mov    r15,rdx
   1400055e9:	4c 8b e1             	mov    r12,rcx
   1400055ec:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400055f3:	0f 85 50 09 00 00    	jne    0x140005f49
   1400055f9:	49 89 7b c8          	mov    QWORD PTR [r11-0x38],rdi
   1400055fd:	48 8b b8 48 02 00 00 	mov    rdi,QWORD PTR [rax+0x248]
   140005604:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140005607:	48 8b 15 72 92 00 00 	mov    rdx,QWORD PTR [rip+0x9272]        # 0x14000e880
   14000560e:	48 63 42 2c          	movsxd rax,DWORD PTR [rdx+0x2c]
   140005612:	83 f8 18             	cmp    eax,0x18
   140005615:	7d 1d                	jge    0x140005634
   140005617:	c7 44 82 30 06 00 00 	mov    DWORD PTR [rdx+rax*4+0x30],0x6
   14000561e:	00 
   14000561f:	48 8b 05 5a 92 00 00 	mov    rax,QWORD PTR [rip+0x925a]        # 0x14000e880
   140005626:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   14000562d:	74 05                	je     0x140005634
   14000562f:	e8 cc ec ff ff       	call   0x140004300
   140005634:	4d 3b e7             	cmp    r12,r15
   140005637:	75 0a                	jne    0x140005643
   140005639:	b9 07 00 00 00       	mov    ecx,0x7
   14000563e:	e8 ad e5 ff ff       	call   0x140003bf0
   140005643:	49 8b cc             	mov    rcx,r12
   140005646:	e8 65 e9 ff ff       	call   0x140003fb0
   14000564b:	85 c0                	test   eax,eax
   14000564d:	75 0c                	jne    0x14000565b
   14000564f:	49 8b cf             	mov    rcx,r15
   140005652:	e8 59 e9 ff ff       	call   0x140003fb0
   140005657:	85 c0                	test   eax,eax
   140005659:	74 0a                	je     0x140005665
   14000565b:	b9 0c 00 00 00       	mov    ecx,0xc
   140005660:	e8 8b e5 ff ff       	call   0x140003bf0
   140005665:	41 83 3f 00          	cmp    DWORD PTR [r15],0x0
   140005669:	75 0a                	jne    0x140005675
   14000566b:	b9 02 00 00 00       	mov    ecx,0x2
   140005670:	e8 7b e5 ff ff       	call   0x140003bf0
   140005675:	48 8b 05 04 92 00 00 	mov    rax,QWORD PTR [rip+0x9204]        # 0x14000e880
   14000567c:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140005683:	0f 85 b5 08 00 00    	jne    0x140005f3e
   140005689:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   14000568d:	48 8b d7             	mov    rdx,rdi
   140005690:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   140005693:	48 89 ac 24 b0 00 00 	mov    QWORD PTR [rsp+0xb0],rbp
   14000569a:	00 
   14000569b:	81 e1 00 00 00 80    	and    ecx,0x80000000
   1400056a1:	8b e8                	mov    ebp,eax
   1400056a3:	89 4c 24 4c          	mov    DWORD PTR [rsp+0x4c],ecx
   1400056a7:	0f ba f0 1f          	btr    eax,0x1f
   1400056ab:	48 89 b4 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],rsi
   1400056b2:	00 
   1400056b3:	41 89 04 24          	mov    DWORD PTR [r12],eax
   1400056b7:	81 e5 00 00 00 80    	and    ebp,0x80000000
   1400056bd:	33 cd                	xor    ecx,ebp
   1400056bf:	4c 89 ac 24 98 00 00 	mov    QWORD PTR [rsp+0x98],r13
   1400056c6:	00 
   1400056c7:	45 8b 2f             	mov    r13d,DWORD PTR [r15]
   1400056ca:	41 0f ba f5 1f       	btr    r13d,0x1f
   1400056cf:	89 4c 24 48          	mov    DWORD PTR [rsp+0x48],ecx
   1400056d3:	45 89 2f             	mov    DWORD PTR [r15],r13d
   1400056d6:	49 8b cc             	mov    rcx,r12
   1400056d9:	49 63 34 24          	movsxd rsi,DWORD PTR [r12]
   1400056dd:	89 6c 24 70          	mov    DWORD PTR [rsp+0x70],ebp
   1400056e1:	44 89 6c 24 50       	mov    DWORD PTR [rsp+0x50],r13d
   1400056e6:	e8 a5 cd ff ff       	call   0x140002490
   1400056eb:	48 8b 0d 8e 91 00 00 	mov    rcx,QWORD PTR [rip+0x918e]        # 0x14000e880
   1400056f2:	8b 07                	mov    eax,DWORD PTR [rdi]
   1400056f4:	89 84 24 f8 00 00 00 	mov    DWORD PTR [rsp+0xf8],eax
   1400056fb:	83 b9 90 00 00 00 00 	cmp    DWORD PTR [rcx+0x90],0x0
   140005702:	74 19                	je     0x14000571d
   140005704:	41 2b c5             	sub    eax,r13d
   140005707:	ff c0                	inc    eax
   140005709:	3b 41 28             	cmp    eax,DWORD PTR [rcx+0x28]
   14000570c:	7e 0f                	jle    0x14000571d
   14000570e:	b9 03 00 00 00       	mov    ecx,0x3
   140005713:	e8 d8 e4 ff ff       	call   0x140003bf0
   140005718:	e9 02 08 00 00       	jmp    0x140005f1f
   14000571d:	48 89 9c 24 b8 00 00 	mov    QWORD PTR [rsp+0xb8],rbx
   140005724:	00 
   140005725:	33 db                	xor    ebx,ebx
   140005727:	41 3b f5             	cmp    esi,r13d
   14000572a:	75 76                	jne    0x1400057a2
   14000572c:	4c 8b 57 08          	mov    r10,QWORD PTR [rdi+0x8]
   140005730:	83 fe 01             	cmp    esi,0x1
   140005733:	75 24                	jne    0x140005759
   140005735:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
   140005739:	33 d2                	xor    edx,edx
   14000573b:	49 8b 02             	mov    rax,QWORD PTR [r10]
   14000573e:	48 f7 31             	div    QWORD PTR [rcx]
   140005741:	33 d2                	xor    edx,edx
   140005743:	48 8b d8             	mov    rbx,rax
   140005746:	49 8b 02             	mov    rax,QWORD PTR [r10]
   140005749:	48 f7 31             	div    QWORD PTR [rcx]
   14000574c:	48 8b cf             	mov    rcx,rdi
   14000574f:	49 89 12             	mov    QWORD PTR [r10],rdx
   140005752:	e8 09 e8 ff ff       	call   0x140003f60
   140005757:	eb 49                	jmp    0x1400057a2
   140005759:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   14000575d:	48 8d 14 f5 f8 ff ff 	lea    rdx,[rsi*8-0x8]
   140005764:	ff 
   140005765:	4a 8b 0c 12          	mov    rcx,QWORD PTR [rdx+r10*1]
   140005769:	48 c1 e9 02          	shr    rcx,0x2
   14000576d:	48 3b 0c 02          	cmp    rcx,QWORD PTR [rdx+rax*1]
   140005771:	73 2f                	jae    0x1400057a2
   140005773:	49 8b d7             	mov    rdx,r15
   140005776:	48 8b cf             	mov    rcx,rdi
   140005779:	e8 52 e7 ff ff       	call   0x140003ed0
   14000577e:	85 c0                	test   eax,eax
   140005780:	78 20                	js     0x1400057a2
   140005782:	4c 8b c7             	mov    r8,rdi
   140005785:	49 8b d7             	mov    rdx,r15
   140005788:	48 8b cf             	mov    rcx,rdi
   14000578b:	e8 30 18 00 00       	call   0x140006fc0
   140005790:	49 8b d7             	mov    rdx,r15
   140005793:	48 8b cf             	mov    rcx,rdi
   140005796:	48 ff c3             	inc    rbx
   140005799:	e8 32 e7 ff ff       	call   0x140003ed0
   14000579e:	85 c0                	test   eax,eax
   1400057a0:	79 e0                	jns    0x140005782
   1400057a2:	49 8b d7             	mov    rdx,r15
   1400057a5:	48 8b cf             	mov    rcx,rdi
   1400057a8:	e8 23 e7 ff ff       	call   0x140003ed0
   1400057ad:	85 c0                	test   eax,eax
   1400057af:	79 4d                	jns    0x1400057fe
   1400057b1:	4d 3b e6             	cmp    r12,r14
   1400057b4:	74 19                	je     0x1400057cf
   1400057b6:	49 8b d4             	mov    rdx,r12
   1400057b9:	48 8b cf             	mov    rcx,rdi
   1400057bc:	e8 cf cc ff ff       	call   0x140002490
   1400057c1:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   1400057c5:	85 c0                	test   eax,eax
   1400057c7:	74 06                	je     0x1400057cf
   1400057c9:	0b c5                	or     eax,ebp
   1400057cb:	41 89 04 24          	mov    DWORD PTR [r12],eax
   1400057cf:	4d 3b fe             	cmp    r15,r14
   1400057d2:	74 1e                	je     0x1400057f2
   1400057d4:	49 8b ce             	mov    rcx,r14
   1400057d7:	e8 64 f0 ff ff       	call   0x140004840
   1400057dc:	49 8b 46 08          	mov    rax,QWORD PTR [r14+0x8]
   1400057e0:	48 89 18             	mov    QWORD PTR [rax],rbx
   1400057e3:	48 85 db             	test   rbx,rbx
   1400057e6:	74 0a                	je     0x1400057f2
   1400057e8:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   1400057ec:	83 ca 01             	or     edx,0x1
   1400057ef:	41 89 16             	mov    DWORD PTR [r14],edx
   1400057f2:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
   1400057f6:	41 09 07             	or     DWORD PTR [r15],eax
   1400057f9:	e9 19 07 00 00       	jmp    0x140005f17
   1400057fe:	41 83 fd 01          	cmp    r13d,0x1
   140005802:	75 63                	jne    0x140005867
   140005804:	49 8b 57 08          	mov    rdx,QWORD PTR [r15+0x8]
   140005808:	4c 8b c7             	mov    r8,rdi
   14000580b:	48 8b cf             	mov    rcx,rdi
   14000580e:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   140005811:	e8 ca 10 00 00       	call   0x1400068e0
   140005816:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   14000581b:	4d 3b fe             	cmp    r15,r14
   14000581e:	74 12                	je     0x140005832
   140005820:	49 8b d6             	mov    rdx,r14
   140005823:	48 8b cf             	mov    rcx,rdi
   140005826:	e8 65 cc ff ff       	call   0x140002490
   14000582b:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   14000582f:	41 09 16             	or     DWORD PTR [r14],edx
   140005832:	4d 3b e6             	cmp    r12,r14
   140005835:	74 24                	je     0x14000585b
   140005837:	49 8b cc             	mov    rcx,r12
   14000583a:	e8 01 f0 ff ff       	call   0x140004840
   14000583f:	49 8b 4c 24 08       	mov    rcx,QWORD PTR [r12+0x8]
   140005844:	48 8b 44 24 58       	mov    rax,QWORD PTR [rsp+0x58]
   140005849:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000584c:	48 83 7c 24 58 00    	cmp    QWORD PTR [rsp+0x58],0x0
   140005852:	76 07                	jbe    0x14000585b
   140005854:	83 cd 01             	or     ebp,0x1
   140005857:	41 89 2c 24          	mov    DWORD PTR [r12],ebp
   14000585b:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
   14000585f:	41 09 07             	or     DWORD PTR [r15],eax
   140005862:	e9 b0 06 00 00       	jmp    0x140005f17
   140005867:	4d 3b fe             	cmp    r15,r14
   14000586a:	74 08                	je     0x140005874
   14000586c:	49 8b ce             	mov    rcx,r14
   14000586f:	e8 cc ef ff ff       	call   0x140004840
   140005874:	48 8b 05 05 90 00 00 	mov    rax,QWORD PTR [rip+0x9005]        # 0x14000e880
   14000587b:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   14000587e:	48 8b 0d fb 8f 00 00 	mov    rcx,QWORD PTR [rip+0x8ffb]        # 0x14000e880
   140005885:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140005889:	83 f8 18             	cmp    eax,0x18
   14000588c:	7d 1d                	jge    0x1400058ab
   14000588e:	c7 44 81 30 04 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x4
   140005895:	00 
   140005896:	48 8b 05 e3 8f 00 00 	mov    rax,QWORD PTR [rip+0x8fe3]        # 0x14000e880
   14000589d:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   1400058a4:	74 05                	je     0x1400058ab
   1400058a6:	e8 55 ea ff ff       	call   0x140004300
   1400058ab:	48 8b 05 ce 8f 00 00 	mov    rax,QWORD PTR [rip+0x8fce]        # 0x14000e880
   1400058b2:	41 ba 01 00 00 00    	mov    r10d,0x1
   1400058b8:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   1400058bb:	0f ba f1 1f          	btr    ecx,0x1f
   1400058bf:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   1400058c2:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   1400058c6:	48 8d 0c c8          	lea    rcx,[rax+rcx*8]
   1400058ca:	4d 85 c0             	test   r8,r8
   1400058cd:	75 2d                	jne    0x1400058fc
   1400058cf:	4c 8b 41 f8          	mov    r8,QWORD PTR [rcx-0x8]
   1400058d3:	4d 03 c2             	add    r8,r10
   1400058d6:	4c 89 44 24 40       	mov    QWORD PTR [rsp+0x40],r8
   1400058db:	75 0a                	jne    0x1400058e7
   1400058dd:	41 8b f2             	mov    esi,r10d
   1400058e0:	4c 89 54 24 68       	mov    QWORD PTR [rsp+0x68],r10
   1400058e5:	eb 3f                	jmp    0x140005926
   1400058e7:	4c 8d 4c 24 40       	lea    r9,[rsp+0x40]
   1400058ec:	33 d2                	xor    edx,edx
   1400058ee:	49 8b ca             	mov    rcx,r10
   1400058f1:	e8 4a 26 00 00       	call   0x140007f40
   1400058f6:	48 83 f8 01          	cmp    rax,0x1
   1400058fa:	eb 12                	jmp    0x14000590e
   1400058fc:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   140005900:	33 d2                	xor    edx,edx
   140005902:	48 ff c1             	inc    rcx
   140005905:	49 8b c0             	mov    rax,r8
   140005908:	48 f7 f1             	div    rcx
   14000590b:	49 3b c2             	cmp    rax,r10
   14000590e:	48 89 44 24 68       	mov    QWORD PTR [rsp+0x68],rax
   140005913:	48 8b f0             	mov    rsi,rax
   140005916:	74 0e                	je     0x140005926
   140005918:	4d 8b c7             	mov    r8,r15
   14000591b:	48 8b d0             	mov    rdx,rax
   14000591e:	49 8b cf             	mov    rcx,r15
   140005921:	e8 3a 0e 00 00       	call   0x140006760
   140005926:	48 8b 05 53 8f 00 00 	mov    rax,QWORD PTR [rip+0x8f53]        # 0x14000e880
   14000592d:	41 8b ed             	mov    ebp,r13d
   140005930:	48 89 6c 24 60       	mov    QWORD PTR [rsp+0x60],rbp
   140005935:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140005938:	48 8b 05 41 8f 00 00 	mov    rax,QWORD PTR [rip+0x8f41]        # 0x14000e880
   14000593f:	8b 88 90 00 00 00    	mov    ecx,DWORD PTR [rax+0x90]
   140005945:	c7 80 90 00 00 00 00 	mov    DWORD PTR [rax+0x90],0x0
   14000594c:	00 00 00 
   14000594f:	48 8b 05 2a 8f 00 00 	mov    rax,QWORD PTR [rip+0x8f2a]        # 0x14000e880
   140005956:	89 4c 24 74          	mov    DWORD PTR [rsp+0x74],ecx
   14000595a:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   14000595e:	0f 85 a2 02 00 00    	jne    0x140005c06
   140005964:	48 83 fe 01          	cmp    rsi,0x1
   140005968:	74 0e                	je     0x140005978
   14000596a:	4c 8b c7             	mov    r8,rdi
   14000596d:	48 8b d6             	mov    rdx,rsi
   140005970:	48 8b cf             	mov    rcx,rdi
   140005973:	e8 e8 0d 00 00       	call   0x140006760
   140005978:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   14000597c:	41 8b cd             	mov    ecx,r13d
   14000597f:	48 ff c9             	dec    rcx
   140005982:	48 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],rcx
   140005987:	4e 8b 54 e8 f0       	mov    r10,QWORD PTR [rax+r13*8-0x10]
   14000598c:	4c 89 54 24 40       	mov    QWORD PTR [rsp+0x40],r10
   140005991:	48 8b 1c c8          	mov    rbx,QWORD PTR [rax+rcx*8]
   140005995:	8b 84 24 f8 00 00 00 	mov    eax,DWORD PTR [rsp+0xf8]
   14000599c:	44 8d 68 ff          	lea    r13d,[rax-0x1]
   1400059a0:	4d 63 e5             	movsxd r12,r13d
   1400059a3:	44 89 6c 24 30       	mov    DWORD PTR [rsp+0x30],r13d
   1400059a8:	4c 3b e1             	cmp    r12,rcx
   1400059ab:	0f 8c 15 05 00 00    	jl     0x140005ec6
   1400059b1:	44 89 6c 24 34       	mov    DWORD PTR [rsp+0x34],r13d
   1400059b6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   1400059bd:	00 00 00 
   1400059c0:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   1400059c4:	33 f6                	xor    esi,esi
   1400059c6:	4a 8b 4c e0 08       	mov    rcx,QWORD PTR [rax+r12*8+0x8]
   1400059cb:	4a 8b 14 e0          	mov    rdx,QWORD PTR [rax+r12*8]
   1400059cf:	48 3b cb             	cmp    rcx,rbx
   1400059d2:	75 18                	jne    0x1400059ec
   1400059d4:	4c 8d 04 1a          	lea    r8,[rdx+rbx*1]
   1400059d8:	4c 3b c3             	cmp    r8,rbx
   1400059db:	4c 89 44 24 38       	mov    QWORD PTR [rsp+0x38],r8
   1400059e0:	4c 8d 4e ff          	lea    r9,[rsi-0x1]
   1400059e4:	40 0f 92 c6          	setb   sil
   1400059e8:	72 58                	jb     0x140005a42
   1400059ea:	eb 24                	jmp    0x140005a10
   1400059ec:	4c 8d 4c 24 38       	lea    r9,[rsp+0x38]
   1400059f1:	4c 8b c3             	mov    r8,rbx
   1400059f4:	e8 47 25 00 00       	call   0x140007f40
   1400059f9:	4c 8b 44 24 38       	mov    r8,QWORD PTR [rsp+0x38]
   1400059fe:	4c 8b c8             	mov    r9,rax
   140005a01:	4c 8b 54 24 40       	mov    r10,QWORD PTR [rsp+0x40]
   140005a06:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140005a0d:	00 00 00 
   140005a10:	49 8b c1             	mov    rax,r9
   140005a13:	49 f7 e2             	mul    r10
   140005a16:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   140005a1b:	49 3b d0             	cmp    rdx,r8
   140005a1e:	72 22                	jb     0x140005a42
   140005a20:	75 0b                	jne    0x140005a2d
   140005a22:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   140005a26:	4a 3b 44 e1 f8       	cmp    rax,QWORD PTR [rcx+r12*8-0x8]
   140005a2b:	76 15                	jbe    0x140005a42
   140005a2d:	4c 03 c3             	add    r8,rbx
   140005a30:	49 ff c9             	dec    r9
   140005a33:	4c 89 44 24 38       	mov    QWORD PTR [rsp+0x38],r8
   140005a38:	4c 3b c3             	cmp    r8,rbx
   140005a3b:	72 05                	jb     0x140005a42
   140005a3d:	48 85 f6             	test   rsi,rsi
   140005a40:	74 ce                	je     0x140005a10
   140005a42:	4d 8b f4             	mov    r14,r12
   140005a45:	4c 2b f5             	sub    r14,rbp
   140005a48:	4d 85 c9             	test   r9,r9
   140005a4b:	0f 84 f1 00 00 00    	je     0x140005b42
   140005a51:	45 33 d2             	xor    r10d,r10d
   140005a54:	4e 8d 1c f5 08 00 00 	lea    r11,[r14*8+0x8]
   140005a5b:	00 
   140005a5c:	48 85 ed             	test   rbp,rbp
   140005a5f:	74 5f                	je     0x140005ac0
   140005a61:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
   140005a68:	4c 8b ed             	mov    r13,rbp
   140005a6b:	49 2b f6             	sub    rsi,r14
   140005a6e:	49 8b eb             	mov    rbp,r11
   140005a71:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   140005a75:	48 03 c5             	add    rax,rbp
   140005a78:	48 8b 04 f0          	mov    rax,QWORD PTR [rax+rsi*8]
   140005a7c:	49 f7 e1             	mul    r9
   140005a7f:	4e 8d 04 10          	lea    r8,[rax+r10*1]
   140005a83:	4d 3b c2             	cmp    r8,r10
   140005a86:	4c 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r8
   140005a8d:	00 
   140005a8e:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   140005a92:	48 83 d2 00          	adc    rdx,0x0
   140005a96:	48 8b 04 29          	mov    rax,QWORD PTR [rcx+rbp*1]
   140005a9a:	49 3b c0             	cmp    rax,r8
   140005a9d:	4c 8d 52 01          	lea    r10,[rdx+0x1]
   140005aa1:	4c 0f 43 d2          	cmovae r10,rdx
   140005aa5:	49 2b c0             	sub    rax,r8
   140005aa8:	48 89 04 29          	mov    QWORD PTR [rcx+rbp*1],rax
   140005aac:	48 83 c5 08          	add    rbp,0x8
   140005ab0:	49 83 ed 01          	sub    r13,0x1
   140005ab4:	75 bb                	jne    0x140005a71
   140005ab6:	48 8b 6c 24 60       	mov    rbp,QWORD PTR [rsp+0x60]
   140005abb:	44 8b 6c 24 30       	mov    r13d,DWORD PTR [rsp+0x30]
   140005ac0:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   140005ac4:	4a 8d 0c e0          	lea    rcx,[rax+r12*8]
   140005ac8:	4a 8b 44 e0 08       	mov    rax,QWORD PTR [rax+r12*8+0x8]
   140005acd:	49 3b c2             	cmp    rax,r10
   140005ad0:	73 64                	jae    0x140005b36
   140005ad2:	45 33 d2             	xor    r10d,r10d
   140005ad5:	48 c7 41 08 00 00 00 	mov    QWORD PTR [rcx+0x8],0x0
   140005adc:	00 
   140005add:	48 85 ed             	test   rbp,rbp
   140005ae0:	74 4f                	je     0x140005b31
   140005ae2:	48 c7 c6 ff ff ff ff 	mov    rsi,0xffffffffffffffff
   140005ae9:	45 8d 6a 01          	lea    r13d,[r10+0x1]
   140005aed:	49 2b f6             	sub    rsi,r14
   140005af0:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
   140005af4:	33 c0                	xor    eax,eax
   140005af6:	4c 8b 47 08          	mov    r8,QWORD PTR [rdi+0x8]
   140005afa:	49 03 cb             	add    rcx,r11
   140005afd:	48 8b 14 f1          	mov    rdx,QWORD PTR [rcx+rsi*8]
   140005b01:	4b 8b 0c 18          	mov    rcx,QWORD PTR [r8+r11*1]
   140005b05:	48 03 ca             	add    rcx,rdx
   140005b08:	49 03 ca             	add    rcx,r10
   140005b0b:	48 3b ca             	cmp    rcx,rdx
   140005b0e:	4b 89 0c 18          	mov    QWORD PTR [r8+r11*1],rcx
   140005b12:	49 0f 46 c2          	cmovbe rax,r10
   140005b16:	4c 8b d0             	mov    r10,rax
   140005b19:	4d 0f 42 d5          	cmovb  r10,r13
   140005b1d:	49 83 c3 08          	add    r11,0x8
   140005b21:	48 83 ed 01          	sub    rbp,0x1
   140005b25:	75 c9                	jne    0x140005af0
   140005b27:	48 8b 6c 24 60       	mov    rbp,QWORD PTR [rsp+0x60]
   140005b2c:	44 8b 6c 24 30       	mov    r13d,DWORD PTR [rsp+0x30]
   140005b31:	49 ff c9             	dec    r9
   140005b34:	eb 07                	jmp    0x140005b3d
   140005b36:	49 2b c2             	sub    rax,r10
   140005b39:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   140005b3d:	4c 8b 54 24 40       	mov    r10,QWORD PTR [rsp+0x40]
   140005b42:	44 8b 44 24 34       	mov    r8d,DWORD PTR [rsp+0x34]
   140005b47:	45 3b e8             	cmp    r13d,r8d
   140005b4a:	75 1f                	jne    0x140005b6b
   140005b4c:	4d 85 c9             	test   r9,r9
   140005b4f:	75 1a                	jne    0x140005b6b
   140005b51:	8b 84 24 f8 00 00 00 	mov    eax,DWORD PTR [rsp+0xf8]
   140005b58:	ff c8                	dec    eax
   140005b5a:	41 ff c8             	dec    r8d
   140005b5d:	89 84 24 f8 00 00 00 	mov    DWORD PTR [rsp+0xf8],eax
   140005b64:	44 89 44 24 34       	mov    DWORD PTR [rsp+0x34],r8d
   140005b69:	eb 1d                	jmp    0x140005b88
   140005b6b:	48 8b 84 24 f0 00 00 	mov    rax,QWORD PTR [rsp+0xf0]
   140005b72:	00 
   140005b73:	4c 3b f8             	cmp    r15,rax
   140005b76:	74 09                	je     0x140005b81
   140005b78:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140005b7c:	4e 89 4c f0 08       	mov    QWORD PTR [rax+r14*8+0x8],r9
   140005b81:	8b 84 24 f8 00 00 00 	mov    eax,DWORD PTR [rsp+0xf8]
   140005b88:	41 ff cd             	dec    r13d
   140005b8b:	49 ff cc             	dec    r12
   140005b8e:	44 89 6c 24 30       	mov    DWORD PTR [rsp+0x30],r13d
   140005b93:	4c 3b 64 24 78       	cmp    r12,QWORD PTR [rsp+0x78]
   140005b98:	0f 8d 22 fe ff ff    	jge    0x1400059c0
   140005b9e:	4c 8b a4 24 e0 00 00 	mov    r12,QWORD PTR [rsp+0xe0]
   140005ba5:	00 
   140005ba6:	48 8b 74 24 68       	mov    rsi,QWORD PTR [rsp+0x68]
   140005bab:	48 8b 9c 24 f0 00 00 	mov    rbx,QWORD PTR [rsp+0xf0]
   140005bb2:	00 
   140005bb3:	8b 4c 24 50          	mov    ecx,DWORD PTR [rsp+0x50]
   140005bb7:	4c 3b fb             	cmp    r15,rbx
   140005bba:	74 0a                	je     0x140005bc6
   140005bbc:	2b c1                	sub    eax,ecx
   140005bbe:	ff c0                	inc    eax
   140005bc0:	0b 44 24 48          	or     eax,DWORD PTR [rsp+0x48]
   140005bc4:	89 03                	mov    DWORD PTR [rbx],eax
   140005bc6:	89 0f                	mov    DWORD PTR [rdi],ecx
   140005bc8:	49 8b cf             	mov    rcx,r15
   140005bcb:	e8 90 e3 ff ff       	call   0x140003f60
   140005bd0:	48 8b cb             	mov    rcx,rbx
   140005bd3:	e8 88 e3 ff ff       	call   0x140003f60
   140005bd8:	4c 3b e3             	cmp    r12,rbx
   140005bdb:	0f 84 0a 03 00 00    	je     0x140005eeb
   140005be1:	48 8b cf             	mov    rcx,rdi
   140005be4:	e8 77 e3 ff ff       	call   0x140003f60
   140005be9:	48 8b cf             	mov    rcx,rdi
   140005bec:	48 83 fe 01          	cmp    rsi,0x1
   140005bf0:	0f 84 dd 02 00 00    	je     0x140005ed3
   140005bf6:	4d 8b c4             	mov    r8,r12
   140005bf9:	48 8b d6             	mov    rdx,rsi
   140005bfc:	e8 df 0c 00 00       	call   0x1400068e0
   140005c01:	e9 d5 02 00 00       	jmp    0x140005edb
   140005c06:	48 83 fe 01          	cmp    rsi,0x1
   140005c0a:	74 0e                	je     0x140005c1a
   140005c0c:	4c 8b c7             	mov    r8,rdi
   140005c0f:	48 8b d6             	mov    rdx,rsi
   140005c12:	48 8b cf             	mov    rcx,rdi
   140005c15:	e8 46 0b 00 00       	call   0x140006760
   140005c1a:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   140005c1e:	41 8b f5             	mov    esi,r13d
   140005c21:	48 ff ce             	dec    rsi
   140005c24:	48 89 74 24 40       	mov    QWORD PTR [rsp+0x40],rsi
   140005c29:	48 8b 4c e8 f0       	mov    rcx,QWORD PTR [rax+rbp*8-0x10]
   140005c2e:	48 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],rcx
   140005c33:	4c 8b 2c f0          	mov    r13,QWORD PTR [rax+rsi*8]
   140005c37:	8b 84 24 f8 00 00 00 	mov    eax,DWORD PTR [rsp+0xf8]
   140005c3e:	4c 89 ac 24 88 00 00 	mov    QWORD PTR [rsp+0x88],r13
   140005c45:	00 
   140005c46:	8d 50 ff             	lea    edx,[rax-0x1]
   140005c49:	48 63 ea             	movsxd rbp,edx
   140005c4c:	89 54 24 30          	mov    DWORD PTR [rsp+0x30],edx
   140005c50:	48 3b ee             	cmp    rbp,rsi
   140005c53:	0f 8c 4d ff ff ff    	jl     0x140005ba6
   140005c59:	89 54 24 34          	mov    DWORD PTR [rsp+0x34],edx
   140005c5d:	0f 1f 00             	nop    DWORD PTR [rax]
   140005c60:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   140005c64:	48 8b 4c e8 08       	mov    rcx,QWORD PTR [rax+rbp*8+0x8]
   140005c69:	4c 8d 04 e8          	lea    r8,[rax+rbp*8]
   140005c6d:	49 3b cd             	cmp    rcx,r13
   140005c70:	75 1a                	jne    0x140005c8c
   140005c72:	49 8b 10             	mov    rdx,QWORD PTR [r8]
   140005c75:	48 8b 05 04 8c 00 00 	mov    rax,QWORD PTR [rip+0x8c04]        # 0x14000e880
   140005c7c:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   140005c7f:	48 ff cb             	dec    rbx
   140005c82:	49 03 d5             	add    rdx,r13
   140005c85:	48 89 54 24 38       	mov    QWORD PTR [rsp+0x38],rdx
   140005c8a:	eb 27                	jmp    0x140005cb3
   140005c8c:	48 8b 15 ed 8b 00 00 	mov    rdx,QWORD PTR [rip+0x8bed]        # 0x14000e880
   140005c93:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   140005c98:	4d 8b 00             	mov    r8,QWORD PTR [r8]
   140005c9b:	4d 8b cd             	mov    r9,r13
   140005c9e:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005ca3:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   140005ca6:	e8 35 21 00 00       	call   0x140007de0
   140005cab:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140005cb0:	48 8b d8             	mov    rbx,rax
   140005cb3:	48 8b 0d c6 8b 00 00 	mov    rcx,QWORD PTR [rip+0x8bc6]        # 0x14000e880
   140005cba:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140005cbd:	48 3b d0             	cmp    rdx,rax
   140005cc0:	73 67                	jae    0x140005d29
   140005cc2:	4c 8b 7c 24 78       	mov    r15,QWORD PTR [rsp+0x78]
   140005cc7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140005cce:	00 00 
   140005cd0:	48 8d 4c 24 58       	lea    rcx,[rsp+0x58]
   140005cd5:	4c 8b c8             	mov    r9,rax
   140005cd8:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   140005cdd:	45 33 c0             	xor    r8d,r8d
   140005ce0:	49 8b cf             	mov    rcx,r15
   140005ce3:	48 8b d3             	mov    rdx,rbx
   140005ce6:	e8 f5 20 00 00       	call   0x140007de0
   140005ceb:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140005cf0:	48 3b c2             	cmp    rax,rdx
   140005cf3:	72 2c                	jb     0x140005d21
   140005cf5:	75 10                	jne    0x140005d07
   140005cf7:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   140005cfb:	48 8b 4c e8 f8       	mov    rcx,QWORD PTR [rax+rbp*8-0x8]
   140005d00:	48 39 4c 24 58       	cmp    QWORD PTR [rsp+0x58],rcx
   140005d05:	76 1a                	jbe    0x140005d21
   140005d07:	48 8b 05 72 8b 00 00 	mov    rax,QWORD PTR [rip+0x8b72]        # 0x14000e880
   140005d0e:	49 03 d5             	add    rdx,r13
   140005d11:	48 89 54 24 38       	mov    QWORD PTR [rsp+0x38],rdx
   140005d16:	48 ff cb             	dec    rbx
   140005d19:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140005d1c:	48 3b d0             	cmp    rdx,rax
   140005d1f:	72 af                	jb     0x140005cd0
   140005d21:	4c 8b bc 24 e8 00 00 	mov    r15,QWORD PTR [rsp+0xe8]
   140005d28:	00 
   140005d29:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140005d2e:	4c 8b e5             	mov    r12,rbp
   140005d31:	4c 2b e2             	sub    r12,rdx
   140005d34:	49 ff c4             	inc    r12
   140005d37:	48 85 db             	test   rbx,rbx
   140005d3a:	0f 84 2e 01 00 00    	je     0x140005e6e
   140005d40:	45 33 c0             	xor    r8d,r8d
   140005d43:	4e 8d 34 e5 00 00 00 	lea    r14,[r12*8+0x0]
   140005d4a:	00 
   140005d4b:	33 f6                	xor    esi,esi
   140005d4d:	48 85 d2             	test   rdx,rdx
   140005d50:	0f 84 7e 00 00 00    	je     0x140005dd4
   140005d56:	4c 8b ea             	mov    r13,rdx
   140005d59:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140005d60:	49 8b 57 08          	mov    rdx,QWORD PTR [r15+0x8]
   140005d64:	48 8d 84 24 80 00 00 	lea    rax,[rsp+0x80]
   140005d6b:	00 
   140005d6c:	4c 8b 0d 0d 8b 00 00 	mov    r9,QWORD PTR [rip+0x8b0d]        # 0x14000e880
   140005d73:	48 8b cb             	mov    rcx,rbx
   140005d76:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005d7b:	48 8b 14 f2          	mov    rdx,QWORD PTR [rdx+rsi*8]
   140005d7f:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   140005d82:	e8 59 20 00 00       	call   0x140007de0
   140005d87:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   140005d8b:	4c 8b c0             	mov    r8,rax
   140005d8e:	4c 8b 8c 24 80 00 00 	mov    r9,QWORD PTR [rsp+0x80]
   140005d95:	00 
   140005d96:	49 8d 04 34          	lea    rax,[r12+rsi*1]
   140005d9a:	48 8d 14 c1          	lea    rdx,[rcx+rax*8]
   140005d9e:	48 8b 04 c1          	mov    rax,QWORD PTR [rcx+rax*8]
   140005da2:	48 8d 0c f1          	lea    rcx,[rcx+rsi*8]
   140005da6:	49 2b c1             	sub    rax,r9
   140005da9:	4e 39 0c 31          	cmp    QWORD PTR [rcx+r14*1],r9
   140005dad:	73 0d                	jae    0x140005dbc
   140005daf:	48 8b 0d ca 8a 00 00 	mov    rcx,QWORD PTR [rip+0x8aca]        # 0x14000e880
   140005db6:	49 ff c0             	inc    r8
   140005db9:	48 03 01             	add    rax,QWORD PTR [rcx]
   140005dbc:	48 ff c6             	inc    rsi
   140005dbf:	48 89 02             	mov    QWORD PTR [rdx],rax
   140005dc2:	49 3b f5             	cmp    rsi,r13
   140005dc5:	7c 99                	jl     0x140005d60
   140005dc7:	4c 8b ac 24 88 00 00 	mov    r13,QWORD PTR [rsp+0x88]
   140005dce:	00 
   140005dcf:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140005dd4:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   140005dd8:	48 8d 0c e8          	lea    rcx,[rax+rbp*8]
   140005ddc:	48 8b 44 e8 08       	mov    rax,QWORD PTR [rax+rbp*8+0x8]
   140005de1:	49 3b c0             	cmp    rax,r8
   140005de4:	73 74                	jae    0x140005e5a
   140005de6:	45 33 d2             	xor    r10d,r10d
   140005de9:	48 c7 41 08 00 00 00 	mov    QWORD PTR [rcx+0x8],0x0
   140005df0:	00 
   140005df1:	48 85 d2             	test   rdx,rdx
   140005df4:	74 5f                	je     0x140005e55
   140005df6:	49 8b c4             	mov    rax,r12
   140005df9:	4c 8b da             	mov    r11,rdx
   140005dfc:	48 f7 d8             	neg    rax
   140005dff:	48 8d 34 c5 00 00 00 	lea    rsi,[rax*8+0x0]
   140005e06:	00 
   140005e07:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   140005e0e:	00 00 
   140005e10:	48 8b 05 69 8a 00 00 	mov    rax,QWORD PTR [rip+0x8a69]        # 0x14000e880
   140005e17:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
   140005e1b:	4c 8b 4f 08          	mov    r9,QWORD PTR [rdi+0x8]
   140005e1f:	49 03 ce             	add    rcx,r14
   140005e22:	4c 8b 04 31          	mov    r8,QWORD PTR [rcx+rsi*1]
   140005e26:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   140005e29:	4d 03 c2             	add    r8,r10
   140005e2c:	4f 03 04 31          	add    r8,QWORD PTR [r9+r14*1]
   140005e30:	49 8b c0             	mov    rax,r8
   140005e33:	48 2b c1             	sub    rax,rcx
   140005e36:	4c 3b c1             	cmp    r8,rcx
   140005e39:	49 0f 42 c0          	cmovb  rax,r8
   140005e3d:	45 33 d2             	xor    r10d,r10d
   140005e40:	4b 89 04 31          	mov    QWORD PTR [r9+r14*1],rax
   140005e44:	49 83 c6 08          	add    r14,0x8
   140005e48:	4c 3b c1             	cmp    r8,rcx
   140005e4b:	41 0f 93 c2          	setae  r10b
   140005e4f:	49 83 eb 01          	sub    r11,0x1
   140005e53:	75 bb                	jne    0x140005e10
   140005e55:	48 ff cb             	dec    rbx
   140005e58:	eb 07                	jmp    0x140005e61
   140005e5a:	49 2b c0             	sub    rax,r8
   140005e5d:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   140005e61:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140005e66:	4c 8b b4 24 f0 00 00 	mov    r14,QWORD PTR [rsp+0xf0]
   140005e6d:	00 
   140005e6e:	8b 54 24 30          	mov    edx,DWORD PTR [rsp+0x30]
   140005e72:	44 8b 4c 24 34       	mov    r9d,DWORD PTR [rsp+0x34]
   140005e77:	41 3b d1             	cmp    edx,r9d
   140005e7a:	75 1f                	jne    0x140005e9b
   140005e7c:	48 85 db             	test   rbx,rbx
   140005e7f:	75 1a                	jne    0x140005e9b
   140005e81:	8b 84 24 f8 00 00 00 	mov    eax,DWORD PTR [rsp+0xf8]
   140005e88:	ff c8                	dec    eax
   140005e8a:	41 ff c9             	dec    r9d
   140005e8d:	89 84 24 f8 00 00 00 	mov    DWORD PTR [rsp+0xf8],eax
   140005e94:	44 89 4c 24 34       	mov    DWORD PTR [rsp+0x34],r9d
   140005e99:	eb 14                	jmp    0x140005eaf
   140005e9b:	4d 3b fe             	cmp    r15,r14
   140005e9e:	74 08                	je     0x140005ea8
   140005ea0:	49 8b 46 08          	mov    rax,QWORD PTR [r14+0x8]
   140005ea4:	4a 89 1c e0          	mov    QWORD PTR [rax+r12*8],rbx
   140005ea8:	8b 84 24 f8 00 00 00 	mov    eax,DWORD PTR [rsp+0xf8]
   140005eaf:	ff ca                	dec    edx
   140005eb1:	48 ff cd             	dec    rbp
   140005eb4:	89 54 24 30          	mov    DWORD PTR [rsp+0x30],edx
   140005eb8:	48 3b ee             	cmp    rbp,rsi
   140005ebb:	0f 8d 9f fd ff ff    	jge    0x140005c60
   140005ec1:	e9 d8 fc ff ff       	jmp    0x140005b9e
   140005ec6:	4c 8b a4 24 e0 00 00 	mov    r12,QWORD PTR [rsp+0xe0]
   140005ecd:	00 
   140005ece:	e9 d8 fc ff ff       	jmp    0x140005bab
   140005ed3:	49 8b d4             	mov    rdx,r12
   140005ed6:	e8 b5 c5 ff ff       	call   0x140002490
   140005edb:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   140005edf:	85 c0                	test   eax,eax
   140005ee1:	74 08                	je     0x140005eeb
   140005ee3:	0b 44 24 70          	or     eax,DWORD PTR [rsp+0x70]
   140005ee7:	41 89 04 24          	mov    DWORD PTR [r12],eax
   140005eeb:	48 83 fe 01          	cmp    rsi,0x1
   140005eef:	74 0e                	je     0x140005eff
   140005ef1:	4d 8b c7             	mov    r8,r15
   140005ef4:	48 8b d6             	mov    rdx,rsi
   140005ef7:	49 8b cf             	mov    rcx,r15
   140005efa:	e8 e1 09 00 00       	call   0x1400068e0
   140005eff:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
   140005f03:	41 09 07             	or     DWORD PTR [r15],eax
   140005f06:	48 8b 05 73 89 00 00 	mov    rax,QWORD PTR [rip+0x8973]        # 0x14000e880
   140005f0d:	8b 4c 24 74          	mov    ecx,DWORD PTR [rsp+0x74]
   140005f11:	89 88 90 00 00 00    	mov    DWORD PTR [rax+0x90],ecx
   140005f17:	48 8b 9c 24 b8 00 00 	mov    rbx,QWORD PTR [rsp+0xb8]
   140005f1e:	00 
   140005f1f:	48 8b 05 5a 89 00 00 	mov    rax,QWORD PTR [rip+0x895a]        # 0x14000e880
   140005f26:	48 8b b4 24 a8 00 00 	mov    rsi,QWORD PTR [rsp+0xa8]
   140005f2d:	00 
   140005f2e:	48 8b ac 24 b0 00 00 	mov    rbp,QWORD PTR [rsp+0xb0]
   140005f35:	00 
   140005f36:	4c 8b ac 24 98 00 00 	mov    r13,QWORD PTR [rsp+0x98]
   140005f3d:	00 
   140005f3e:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140005f41:	48 8b bc 24 a0 00 00 	mov    rdi,QWORD PTR [rsp+0xa0]
   140005f48:	00 
   140005f49:	48 81 c4 c0 00 00 00 	add    rsp,0xc0
   140005f50:	41 5f                	pop    r15
   140005f52:	41 5e                	pop    r14
   140005f54:	41 5c                	pop    r12
   140005f56:	c3                   	ret
   140005f57:	cc                   	int3
   140005f58:	cc                   	int3
   140005f59:	cc                   	int3
   140005f5a:	cc                   	int3
   140005f5b:	cc                   	int3
   140005f5c:	cc                   	int3
   140005f5d:	cc                   	int3
   140005f5e:	cc                   	int3
   140005f5f:	cc                   	int3
   140005f60:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140005f65:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   140005f6a:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   140005f6f:	41 57                	push   r15
   140005f71:	48 83 ec 20          	sub    rsp,0x20
   140005f75:	48 8b 05 04 89 00 00 	mov    rax,QWORD PTR [rip+0x8904]        # 0x14000e880
   140005f7c:	49 8b f1             	mov    rsi,r9
   140005f7f:	49 8b d8             	mov    rbx,r8
   140005f82:	48 8b ea             	mov    rbp,rdx
   140005f85:	4c 8b f9             	mov    r15,rcx
   140005f88:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140005f8f:	0f 85 fc 00 00 00    	jne    0x140006091
   140005f95:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140005f98:	4c 8b 15 e1 88 00 00 	mov    r10,QWORD PTR [rip+0x88e1]        # 0x14000e880
   140005f9f:	49 63 42 2c          	movsxd rax,DWORD PTR [r10+0x2c]
   140005fa3:	83 f8 18             	cmp    eax,0x18
   140005fa6:	7d 26                	jge    0x140005fce
   140005fa8:	41 c7 44 82 30 18 00 	mov    DWORD PTR [r10+rax*4+0x30],0x18
   140005faf:	00 00 
   140005fb1:	4c 8b 15 c8 88 00 00 	mov    r10,QWORD PTR [rip+0x88c8]        # 0x14000e880
   140005fb8:	41 83 ba 08 03 00 00 	cmp    DWORD PTR [r10+0x308],0x0
   140005fbf:	00 
   140005fc0:	74 0c                	je     0x140005fce
   140005fc2:	e8 39 e3 ff ff       	call   0x140004300
   140005fc7:	4c 8b 15 b2 88 00 00 	mov    r10,QWORD PTR [rip+0x88b2]        # 0x14000e880
   140005fce:	48 3b 74 24 58       	cmp    rsi,QWORD PTR [rsp+0x58]
   140005fd3:	75 0f                	jne    0x140005fe4
   140005fd5:	b9 07 00 00 00       	mov    ecx,0x7
   140005fda:	e8 11 dc ff ff       	call   0x140003bf0
   140005fdf:	e9 a3 00 00 00       	jmp    0x140006087
   140005fe4:	4c 89 74 24 30       	mov    QWORD PTR [rsp+0x30],r14
   140005fe9:	48 8b d5             	mov    rdx,rbp
   140005fec:	45 8b b2 90 00 00 00 	mov    r14d,DWORD PTR [r10+0x90]
   140005ff3:	49 8b cf             	mov    rcx,r15
   140005ff6:	41 c7 82 90 00 00 00 	mov    DWORD PTR [r10+0x90],0x0
   140005ffd:	00 00 00 00 
   140006001:	4c 8b 05 78 88 00 00 	mov    r8,QWORD PTR [rip+0x8878]        # 0x14000e880
   140006008:	4d 8b 80 48 02 00 00 	mov    r8,QWORD PTR [r8+0x248]
   14000600f:	e8 9c 00 00 00       	call   0x1400060b0
   140006014:	4c 3b fb             	cmp    r15,rbx
   140006017:	74 1e                	je     0x140006037
   140006019:	48 3b eb             	cmp    rbp,rbx
   14000601c:	74 19                	je     0x140006037
   14000601e:	48 8b 05 5b 88 00 00 	mov    rax,QWORD PTR [rip+0x885b]        # 0x14000e880
   140006025:	48 8b d3             	mov    rdx,rbx
   140006028:	48 8b 88 48 02 00 00 	mov    rcx,QWORD PTR [rax+0x248]
   14000602f:	4c 8b c1             	mov    r8,rcx
   140006032:	e8 99 0c 00 00       	call   0x140006cd0
   140006037:	48 8b 0d 42 88 00 00 	mov    rcx,QWORD PTR [rip+0x8842]        # 0x14000e880
   14000603e:	48 8b d6             	mov    rdx,rsi
   140006041:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
   140006046:	4c 8b c3             	mov    r8,rbx
   140006049:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   140006050:	e8 6b f5 ff ff       	call   0x1400055c0
   140006055:	48 3b 5c 24 58       	cmp    rbx,QWORD PTR [rsp+0x58]
   14000605a:	74 18                	je     0x140006074
   14000605c:	48 8b 0d 1d 88 00 00 	mov    rcx,QWORD PTR [rip+0x881d]        # 0x14000e880
   140006063:	48 8b 54 24 58       	mov    rdx,QWORD PTR [rsp+0x58]
   140006068:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   14000606f:	e8 1c c4 ff ff       	call   0x140002490
   140006074:	48 8b 05 05 88 00 00 	mov    rax,QWORD PTR [rip+0x8805]        # 0x14000e880
   14000607b:	44 89 b0 90 00 00 00 	mov    DWORD PTR [rax+0x90],r14d
   140006082:	4c 8b 74 24 30       	mov    r14,QWORD PTR [rsp+0x30]
   140006087:	48 8b 05 f2 87 00 00 	mov    rax,QWORD PTR [rip+0x87f2]        # 0x14000e880
   14000608e:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006091:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
   140006096:	48 8b 6c 24 40       	mov    rbp,QWORD PTR [rsp+0x40]
   14000609b:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   1400060a0:	48 83 c4 20          	add    rsp,0x20
   1400060a4:	41 5f                	pop    r15
   1400060a6:	c3                   	ret
   1400060a7:	cc                   	int3
   1400060a8:	cc                   	int3
   1400060a9:	cc                   	int3
   1400060aa:	cc                   	int3
   1400060ab:	cc                   	int3
   1400060ac:	cc                   	int3
   1400060ad:	cc                   	int3
   1400060ae:	cc                   	int3
   1400060af:	cc                   	int3
   1400060b0:	4c 89 44 24 18       	mov    QWORD PTR [rsp+0x18],r8
   1400060b5:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   1400060ba:	57                   	push   rdi
   1400060bb:	41 54                	push   r12
   1400060bd:	48 83 ec 78          	sub    rsp,0x78
   1400060c1:	48 8b 05 b8 87 00 00 	mov    rax,QWORD PTR [rip+0x87b8]        # 0x14000e880
   1400060c8:	48 8b fa             	mov    rdi,rdx
   1400060cb:	4c 8b e1             	mov    r12,rcx
   1400060ce:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400060d5:	0f 85 02 01 00 00    	jne    0x1400061dd
   1400060db:	83 3a 00             	cmp    DWORD PTR [rdx],0x0
   1400060de:	0f 84 8b 05 00 00    	je     0x14000666f
   1400060e4:	83 39 00             	cmp    DWORD PTR [rcx],0x0
   1400060e7:	0f 84 82 05 00 00    	je     0x14000666f
   1400060ed:	48 89 9c 24 90 00 00 	mov    QWORD PTR [rsp+0x90],rbx
   1400060f4:	00 
   1400060f5:	48 8b 98 70 02 00 00 	mov    rbx,QWORD PTR [rax+0x270]
   1400060fc:	48 3b cb             	cmp    rcx,rbx
   1400060ff:	74 0a                	je     0x14000610b
   140006101:	48 3b d3             	cmp    rdx,rbx
   140006104:	74 05                	je     0x14000610b
   140006106:	4c 3b c3             	cmp    r8,rbx
   140006109:	74 07                	je     0x140006112
   14000610b:	48 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [rax+0x248]
   140006112:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140006115:	48 8b 0d 64 87 00 00 	mov    rcx,QWORD PTR [rip+0x8764]        # 0x14000e880
   14000611c:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140006120:	83 f8 18             	cmp    eax,0x18
   140006123:	7d 1d                	jge    0x140006142
   140006125:	c7 44 81 30 05 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x5
   14000612c:	00 
   14000612d:	48 8b 05 4c 87 00 00 	mov    rax,QWORD PTR [rip+0x874c]        # 0x14000e880
   140006134:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   14000613b:	74 05                	je     0x140006142
   14000613d:	e8 be e1 ff ff       	call   0x140004300
   140006142:	49 8b cc             	mov    rcx,r12
   140006145:	e8 66 de ff ff       	call   0x140003fb0
   14000614a:	85 c0                	test   eax,eax
   14000614c:	0f 85 f9 04 00 00    	jne    0x14000664b
   140006152:	48 8b cf             	mov    rcx,rdi
   140006155:	e8 56 de ff ff       	call   0x140003fb0
   14000615a:	85 c0                	test   eax,eax
   14000615c:	0f 85 e9 04 00 00    	jne    0x14000664b
   140006162:	48 89 74 24 68       	mov    QWORD PTR [rsp+0x68],rsi
   140006167:	48 8b cb             	mov    rcx,rbx
   14000616a:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   14000616e:	4c 89 74 24 58       	mov    QWORD PTR [rsp+0x58],r14
   140006173:	44 8b 37             	mov    r14d,DWORD PTR [rdi]
   140006176:	41 8b c6             	mov    eax,r14d
   140006179:	33 c6                	xor    eax,esi
   14000617b:	41 0f ba f6 1f       	btr    r14d,0x1f
   140006180:	25 00 00 00 80       	and    eax,0x80000000
   140006185:	44 89 74 24 38       	mov    DWORD PTR [rsp+0x38],r14d
   14000618a:	0f ba f6 1f          	btr    esi,0x1f
   14000618e:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   140006192:	89 b4 24 a8 00 00 00 	mov    DWORD PTR [rsp+0xa8],esi
   140006199:	e8 a2 e6 ff ff       	call   0x140004840
   14000619e:	48 8b 0d db 86 00 00 	mov    rcx,QWORD PTR [rip+0x86db]        # 0x14000e880
   1400061a5:	83 b9 90 00 00 00 00 	cmp    DWORD PTR [rcx+0x90],0x0
   1400061ac:	74 37                	je     0x1400061e5
   1400061ae:	41 8d 04 36          	lea    eax,[r14+rsi*1]
   1400061b2:	3b 41 28             	cmp    eax,DWORD PTR [rcx+0x28]
   1400061b5:	7e 2e                	jle    0x1400061e5
   1400061b7:	b9 03 00 00 00       	mov    ecx,0x3
   1400061bc:	e8 2f da ff ff       	call   0x140003bf0
   1400061c1:	48 8b 05 b8 86 00 00 	mov    rax,QWORD PTR [rip+0x86b8]        # 0x14000e880
   1400061c8:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400061cb:	48 8b 74 24 68       	mov    rsi,QWORD PTR [rsp+0x68]
   1400061d0:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   1400061d5:	48 8b 9c 24 90 00 00 	mov    rbx,QWORD PTR [rsp+0x90]
   1400061dc:	00 
   1400061dd:	48 83 c4 78          	add    rsp,0x78
   1400061e1:	41 5c                	pop    r12
   1400061e3:	5f                   	pop    rdi
   1400061e4:	c3                   	ret
   1400061e5:	48 8b 05 94 86 00 00 	mov    rax,QWORD PTR [rip+0x8694]        # 0x14000e880
   1400061ec:	48 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],rbp
   1400061f1:	4c 89 6c 24 60       	mov    QWORD PTR [rsp+0x60],r13
   1400061f6:	8b ee                	mov    ebp,esi
   1400061f8:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   1400061fc:	4c 89 7c 24 50       	mov    QWORD PTR [rsp+0x50],r15
   140006201:	48 89 6c 24 40       	mov    QWORD PTR [rsp+0x40],rbp
   140006206:	45 8b ee             	mov    r13d,r14d
   140006209:	0f 85 d1 01 00 00    	jne    0x1400063e0
   14000620f:	4c 3b e7             	cmp    r12,rdi
   140006212:	0f 85 2f 01 00 00    	jne    0x140006347
   140006218:	83 fe 05             	cmp    esi,0x5
   14000621b:	0f 86 26 01 00 00    	jbe    0x140006347
   140006221:	4c 8d 76 ff          	lea    r14,[rsi-0x1]
   140006225:	4d 85 f6             	test   r14,r14
   140006228:	0f 8e 95 00 00 00    	jle    0x1400062c3
   14000622e:	33 ff                	xor    edi,edi
   140006230:	41 bf 01 00 00 00    	mov    r15d,0x1
   140006236:	45 33 db             	xor    r11d,r11d
   140006239:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140006240:	45 33 c0             	xor    r8d,r8d
   140006243:	49 8b f7             	mov    rsi,r15
   140006246:	4c 3b fd             	cmp    r15,rbp
   140006249:	7d 55                	jge    0x1400062a0
   14000624b:	4d 8b cf             	mov    r9,r15
   14000624e:	4c 8b d5             	mov    r10,rbp
   140006251:	49 c1 e1 04          	shl    r9,0x4
   140006255:	49 83 e9 08          	sub    r9,0x8
   140006259:	4d 2b d7             	sub    r10,r15
   14000625c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140006260:	49 8b 4c 24 08       	mov    rcx,QWORD PTR [r12+0x8]
   140006265:	4d 8d 49 08          	lea    r9,[r9+0x8]
   140006269:	48 8d 04 39          	lea    rax,[rcx+rdi*1]
   14000626d:	4a 8b 44 08 f8       	mov    rax,QWORD PTR [rax+r9*1-0x8]
   140006272:	4a f7 24 19          	mul    QWORD PTR [rcx+r11*1]
   140006276:	49 03 c0             	add    rax,r8
   140006279:	49 3b c0             	cmp    rax,r8
   14000627c:	4c 8b c2             	mov    r8,rdx
   14000627f:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   140006283:	49 83 d0 00          	adc    r8,0x0
   140006287:	4a 03 44 0a f8       	add    rax,QWORD PTR [rdx+r9*1-0x8]
   14000628c:	4a 3b 44 0a f8       	cmp    rax,QWORD PTR [rdx+r9*1-0x8]
   140006291:	4a 89 44 0a f8       	mov    QWORD PTR [rdx+r9*1-0x8],rax
   140006296:	49 83 d0 00          	adc    r8,0x0
   14000629a:	49 83 ea 01          	sub    r10,0x1
   14000629e:	75 c0                	jne    0x140006260
   1400062a0:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   1400062a4:	49 8d 0c eb          	lea    rcx,[r11+rbp*8]
   1400062a8:	49 83 c3 08          	add    r11,0x8
   1400062ac:	48 83 ef 08          	sub    rdi,0x8
   1400062b0:	49 ff c7             	inc    r15
   1400062b3:	4c 89 04 01          	mov    QWORD PTR [rcx+rax*1],r8
   1400062b7:	49 3b f6             	cmp    rsi,r14
   1400062ba:	7c 84                	jl     0x140006240
   1400062bc:	8b b4 24 a8 00 00 00 	mov    esi,DWORD PTR [rsp+0xa8]
   1400062c3:	8d 04 75 ff ff ff ff 	lea    eax,[rsi*2-0x1]
   1400062ca:	4c 8b c3             	mov    r8,rbx
   1400062cd:	48 8b d3             	mov    rdx,rbx
   1400062d0:	89 03                	mov    DWORD PTR [rbx],eax
   1400062d2:	48 8b cb             	mov    rcx,rbx
   1400062d5:	e8 86 0a 00 00       	call   0x140006d60
   1400062da:	45 33 d2             	xor    r10d,r10d
   1400062dd:	48 85 ed             	test   rbp,rbp
   1400062e0:	0f 84 23 03 00 00    	je     0x140006609
   1400062e6:	4c 8b 5b 08          	mov    r11,QWORD PTR [rbx+0x8]
   1400062ea:	45 33 c9             	xor    r9d,r9d
   1400062ed:	45 33 c0             	xor    r8d,r8d
   1400062f0:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   1400062f5:	4a 8b 0c c8          	mov    rcx,QWORD PTR [rax+r9*8]
   1400062f9:	48 8b c1             	mov    rax,rcx
   1400062fc:	48 f7 e1             	mul    rcx
   1400062ff:	49 03 c2             	add    rax,r10
   140006302:	49 3b c2             	cmp    rax,r10
   140006305:	48 83 d2 00          	adc    rdx,0x0
   140006309:	4b 03 04 03          	add    rax,QWORD PTR [r11+r8*1]
   14000630d:	4b 3b 04 03          	cmp    rax,QWORD PTR [r11+r8*1]
   140006311:	4b 89 04 03          	mov    QWORD PTR [r11+r8*1],rax
   140006315:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140006319:	48 83 d2 00          	adc    rdx,0x0
   14000631d:	45 33 d2             	xor    r10d,r10d
   140006320:	49 ff c1             	inc    r9
   140006323:	49 01 54 00 08       	add    QWORD PTR [r8+rax*1+0x8],rdx
   140006328:	4c 8b 5b 08          	mov    r11,QWORD PTR [rbx+0x8]
   14000632c:	4b 39 54 03 08       	cmp    QWORD PTR [r11+r8*1+0x8],rdx
   140006331:	4b 8d 04 03          	lea    rax,[r11+r8*1]
   140006335:	4d 8d 40 10          	lea    r8,[r8+0x10]
   140006339:	41 0f 92 c2          	setb   r10b
   14000633d:	4c 3b cd             	cmp    r9,rbp
   140006340:	7c ae                	jl     0x1400062f0
   140006342:	e9 c2 02 00 00       	jmp    0x140006609
   140006347:	85 f6                	test   esi,esi
   140006349:	0f 84 ba 02 00 00    	je     0x140006609
   14000634f:	45 33 d2             	xor    r10d,r10d
   140006352:	33 f6                	xor    esi,esi
   140006354:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140006358:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000635f:	00 
   140006360:	45 33 c0             	xor    r8d,r8d
   140006363:	4e 8d 0c d5 00 00 00 	lea    r9,[r10*8+0x0]
   14000636a:	00 
   14000636b:	4d 85 ed             	test   r13,r13
   14000636e:	74 53                	je     0x1400063c3
   140006370:	4d 8b d9             	mov    r11,r9
   140006373:	4d 8b f5             	mov    r14,r13
   140006376:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000637d:	00 00 00 
   140006380:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   140006384:	4a 8d 14 1e          	lea    rdx,[rsi+r11*1]
   140006388:	49 8b 4c 24 08       	mov    rcx,QWORD PTR [r12+0x8]
   14000638d:	4d 8d 5b 08          	lea    r11,[r11+0x8]
   140006391:	48 8b 04 02          	mov    rax,QWORD PTR [rdx+rax*1]
   140006395:	4a f7 24 09          	mul    QWORD PTR [rcx+r9*1]
   140006399:	49 03 c0             	add    rax,r8
   14000639c:	49 3b c0             	cmp    rax,r8
   14000639f:	4c 8b c2             	mov    r8,rdx
   1400063a2:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   1400063a6:	49 83 d0 00          	adc    r8,0x0
   1400063aa:	4a 03 44 1a f8       	add    rax,QWORD PTR [rdx+r11*1-0x8]
   1400063af:	4a 3b 44 1a f8       	cmp    rax,QWORD PTR [rdx+r11*1-0x8]
   1400063b4:	4a 89 44 1a f8       	mov    QWORD PTR [rdx+r11*1-0x8],rax
   1400063b9:	49 83 d0 00          	adc    r8,0x0
   1400063bd:	49 83 ee 01          	sub    r14,0x1
   1400063c1:	75 bd                	jne    0x140006380
   1400063c3:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   1400063c7:	4b 8d 0c e9          	lea    rcx,[r9+r13*8]
   1400063cb:	49 ff c2             	inc    r10
   1400063ce:	48 83 ee 08          	sub    rsi,0x8
   1400063d2:	4c 89 04 01          	mov    QWORD PTR [rcx+rax*1],r8
   1400063d6:	4c 3b d5             	cmp    r10,rbp
   1400063d9:	7c 85                	jl     0x140006360
   1400063db:	e9 22 02 00 00       	jmp    0x140006602
   1400063e0:	4c 3b e7             	cmp    r12,rdi
   1400063e3:	0f 85 6d 01 00 00    	jne    0x140006556
   1400063e9:	83 fe 05             	cmp    esi,0x5
   1400063ec:	0f 86 64 01 00 00    	jbe    0x140006556
   1400063f2:	45 33 c0             	xor    r8d,r8d
   1400063f5:	48 8d 46 ff          	lea    rax,[rsi-0x1]
   1400063f9:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   1400063fe:	45 8d 78 01          	lea    r15d,[r8+0x1]
   140006402:	48 85 c0             	test   rax,rax
   140006405:	0f 8e ab 00 00 00    	jle    0x1400064b6
   14000640b:	41 8b c7             	mov    eax,r15d
   14000640e:	45 33 f6             	xor    r14d,r14d
   140006411:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140006416:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000641d:	00 00 00 
   140006420:	33 d2                	xor    edx,edx
   140006422:	45 8d 68 01          	lea    r13d,[r8+0x1]
   140006426:	48 8b f8             	mov    rdi,rax
   140006429:	48 3b c5             	cmp    rax,rbp
   14000642c:	7d 56                	jge    0x140006484
   14000642e:	43 8d 34 28          	lea    esi,[r8+r13*1]
   140006432:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140006436:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000643d:	00 00 00 
   140006440:	4c 8b 43 08          	mov    r8,QWORD PTR [rbx+0x8]
   140006444:	49 8b 4c 24 08       	mov    rcx,QWORD PTR [r12+0x8]
   140006449:	48 63 c6             	movsxd rax,esi
   14000644c:	4d 8d 0c c0          	lea    r9,[r8+rax*8]
   140006450:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   140006455:	49 8d 04 f8          	lea    rax,[r8+rdi*8]
   140006459:	4c 8b 0d 20 84 00 00 	mov    r9,QWORD PTR [rip+0x8420]        # 0x14000e880
   140006460:	4e 8b 04 30          	mov    r8,QWORD PTR [rax+r14*1]
   140006464:	4c 03 c2             	add    r8,rdx
   140006467:	48 8b 14 f9          	mov    rdx,QWORD PTR [rcx+rdi*8]
   14000646b:	49 8b 0c 0e          	mov    rcx,QWORD PTR [r14+rcx*1]
   14000646f:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   140006472:	e8 69 19 00 00       	call   0x140007de0
   140006477:	ff c6                	inc    esi
   140006479:	48 ff c7             	inc    rdi
   14000647c:	48 8b d0             	mov    rdx,rax
   14000647f:	48 3b fd             	cmp    rdi,rbp
   140006482:	7c bc                	jl     0x140006440
   140006484:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140006488:	49 8d 0c ee          	lea    rcx,[r14+rbp*8]
   14000648c:	49 83 c6 08          	add    r14,0x8
   140006490:	45 8b c5             	mov    r8d,r13d
   140006493:	48 89 14 01          	mov    QWORD PTR [rcx+rax*1],rdx
   140006497:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   14000649c:	48 ff c0             	inc    rax
   14000649f:	4c 29 7c 24 40       	sub    QWORD PTR [rsp+0x40],r15
   1400064a4:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1400064a9:	0f 85 71 ff ff ff    	jne    0x140006420
   1400064af:	8b b4 24 a8 00 00 00 	mov    esi,DWORD PTR [rsp+0xa8]
   1400064b6:	8d 04 75 ff ff ff ff 	lea    eax,[rsi*2-0x1]
   1400064bd:	4c 8b c3             	mov    r8,rbx
   1400064c0:	48 8b d3             	mov    rdx,rbx
   1400064c3:	89 03                	mov    DWORD PTR [rbx],eax
   1400064c5:	48 8b cb             	mov    rcx,rbx
   1400064c8:	e8 93 08 00 00       	call   0x140006d60
   1400064cd:	45 33 c9             	xor    r9d,r9d
   1400064d0:	48 85 ed             	test   rbp,rbp
   1400064d3:	0f 84 30 01 00 00    	je     0x140006609
   1400064d9:	33 ff                	xor    edi,edi
   1400064db:	33 f6                	xor    esi,esi
   1400064dd:	45 33 f6             	xor    r14d,r14d
   1400064e0:	49 8b 44 24 08       	mov    rax,QWORD PTR [r12+0x8]
   1400064e5:	4c 8b 43 08          	mov    r8,QWORD PTR [rbx+0x8]
   1400064e9:	48 8b 0c f8          	mov    rcx,QWORD PTR [rax+rdi*8]
   1400064ed:	49 63 c6             	movsxd rax,r14d
   1400064f0:	49 8d 14 c0          	lea    rdx,[r8+rax*8]
   1400064f4:	4d 8b 04 30          	mov    r8,QWORD PTR [r8+rsi*1]
   1400064f8:	4d 03 c1             	add    r8,r9
   1400064fb:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140006500:	4c 8b 0d 79 83 00 00 	mov    r9,QWORD PTR [rip+0x8379]        # 0x14000e880
   140006507:	48 8b d1             	mov    rdx,rcx
   14000650a:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   14000650d:	e8 ce 18 00 00       	call   0x140007de0
   140006512:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140006516:	45 33 c9             	xor    r9d,r9d
   140006519:	48 01 44 0e 08       	add    QWORD PTR [rsi+rcx*1+0x8],rax
   14000651e:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   140006522:	48 8b 05 57 83 00 00 	mov    rax,QWORD PTR [rip+0x8357]        # 0x14000e880
   140006529:	48 8b 4c 32 08       	mov    rcx,QWORD PTR [rdx+rsi*1+0x8]
   14000652e:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   140006531:	49 3b c8             	cmp    rcx,r8
   140006534:	72 0b                	jb     0x140006541
   140006536:	49 2b c8             	sub    rcx,r8
   140006539:	4d 8b cf             	mov    r9,r15
   14000653c:	48 89 4c 32 08       	mov    QWORD PTR [rdx+rsi*1+0x8],rcx
   140006541:	41 83 c6 02          	add    r14d,0x2
   140006545:	48 ff c7             	inc    rdi
   140006548:	48 83 c6 10          	add    rsi,0x10
   14000654c:	48 3b fd             	cmp    rdi,rbp
   14000654f:	7c 8f                	jl     0x1400064e0
   140006551:	e9 ac 00 00 00       	jmp    0x140006602
   140006556:	33 c0                	xor    eax,eax
   140006558:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
   14000655c:	85 f6                	test   esi,esi
   14000655e:	0f 84 a5 00 00 00    	je     0x140006609
   140006564:	45 33 f6             	xor    r14d,r14d
   140006567:	33 d2                	xor    edx,edx
   140006569:	33 ff                	xor    edi,edi
   14000656b:	4d 85 ed             	test   r13,r13
   14000656e:	74 68                	je     0x1400065d8
   140006570:	48 8b ac 24 98 00 00 	mov    rbp,QWORD PTR [rsp+0x98]
   140006577:	00 
   140006578:	44 8b f8             	mov    r15d,eax
   14000657b:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140006580:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140006584:	4a 8d 34 f5 00 00 00 	lea    rsi,[r14*8+0x0]
   14000658b:	00 
   14000658c:	49 63 c7             	movsxd rax,r15d
   14000658f:	4c 8d 0c c1          	lea    r9,[rcx+rax*8]
   140006593:	48 8d 04 31          	lea    rax,[rcx+rsi*1]
   140006597:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   14000659c:	4c 8b 04 f8          	mov    r8,QWORD PTR [rax+rdi*8]
   1400065a0:	49 8b 4c 24 08       	mov    rcx,QWORD PTR [r12+0x8]
   1400065a5:	4c 03 c2             	add    r8,rdx
   1400065a8:	48 8b 55 08          	mov    rdx,QWORD PTR [rbp+0x8]
   1400065ac:	4c 8b 0d cd 82 00 00 	mov    r9,QWORD PTR [rip+0x82cd]        # 0x14000e880
   1400065b3:	48 8b 0c 0e          	mov    rcx,QWORD PTR [rsi+rcx*1]
   1400065b7:	48 8b 14 fa          	mov    rdx,QWORD PTR [rdx+rdi*8]
   1400065bb:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   1400065be:	e8 1d 18 00 00       	call   0x140007de0
   1400065c3:	41 ff c7             	inc    r15d
   1400065c6:	48 ff c7             	inc    rdi
   1400065c9:	48 8b d0             	mov    rdx,rax
   1400065cc:	49 3b fd             	cmp    rdi,r13
   1400065cf:	7c af                	jl     0x140006580
   1400065d1:	48 8b 6c 24 40       	mov    rbp,QWORD PTR [rsp+0x40]
   1400065d6:	eb 08                	jmp    0x1400065e0
   1400065d8:	4a 8d 34 f5 00 00 00 	lea    rsi,[r14*8+0x0]
   1400065df:	00 
   1400065e0:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   1400065e4:	4a 8d 0c ee          	lea    rcx,[rsi+r13*8]
   1400065e8:	49 ff c6             	inc    r14
   1400065eb:	48 89 14 01          	mov    QWORD PTR [rcx+rax*1],rdx
   1400065ef:	8b 44 24 30          	mov    eax,DWORD PTR [rsp+0x30]
   1400065f3:	ff c0                	inc    eax
   1400065f5:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
   1400065f9:	4c 3b f5             	cmp    r14,rbp
   1400065fc:	0f 8c 65 ff ff ff    	jl     0x140006567
   140006602:	8b b4 24 a8 00 00 00 	mov    esi,DWORD PTR [rsp+0xa8]
   140006609:	8b 44 24 38          	mov    eax,DWORD PTR [rsp+0x38]
   14000660d:	48 8b cb             	mov    rcx,rbx
   140006610:	03 c6                	add    eax,esi
   140006612:	0b 44 24 3c          	or     eax,DWORD PTR [rsp+0x3c]
   140006616:	89 03                	mov    DWORD PTR [rbx],eax
   140006618:	e8 43 d9 ff ff       	call   0x140003f60
   14000661d:	48 8b 94 24 a0 00 00 	mov    rdx,QWORD PTR [rsp+0xa0]
   140006624:	00 
   140006625:	48 8b cb             	mov    rcx,rbx
   140006628:	e8 63 be ff ff       	call   0x140002490
   14000662d:	48 8b 05 4c 82 00 00 	mov    rax,QWORD PTR [rip+0x824c]        # 0x14000e880
   140006634:	4c 8b 7c 24 50       	mov    r15,QWORD PTR [rsp+0x50]
   140006639:	4c 8b 6c 24 60       	mov    r13,QWORD PTR [rsp+0x60]
   14000663e:	48 8b 6c 24 70       	mov    rbp,QWORD PTR [rsp+0x70]
   140006643:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006646:	e9 80 fb ff ff       	jmp    0x1400061cb
   14000664b:	b9 0c 00 00 00       	mov    ecx,0xc
   140006650:	e8 9b d5 ff ff       	call   0x140003bf0
   140006655:	48 8b 05 24 82 00 00 	mov    rax,QWORD PTR [rip+0x8224]        # 0x14000e880
   14000665c:	48 8b 9c 24 90 00 00 	mov    rbx,QWORD PTR [rsp+0x90]
   140006663:	00 
   140006664:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006667:	48 83 c4 78          	add    rsp,0x78
   14000666b:	41 5c                	pop    r12
   14000666d:	5f                   	pop    rdi
   14000666e:	c3                   	ret
   14000666f:	49 8b c8             	mov    rcx,r8
   140006672:	48 83 c4 78          	add    rsp,0x78
   140006676:	41 5c                	pop    r12
   140006678:	5f                   	pop    rdi
   140006679:	e9 c2 e1 ff ff       	jmp    0x140004840
   14000667e:	cc                   	int3
   14000667f:	cc                   	int3
   140006680:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140006685:	57                   	push   rdi
   140006686:	48 83 ec 20          	sub    rsp,0x20
   14000668a:	48 8b 05 ef 81 00 00 	mov    rax,QWORD PTR [rip+0x81ef]        # 0x14000e880
   140006691:	48 8b f9             	mov    rdi,rcx
   140006694:	48 8b da             	mov    rbx,rdx
   140006697:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   14000669a:	48 8b 0d df 81 00 00 	mov    rcx,QWORD PTR [rip+0x81df]        # 0x14000e880
   1400066a1:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1400066a5:	83 f8 18             	cmp    eax,0x18
   1400066a8:	7d 1d                	jge    0x1400066c7
   1400066aa:	c7 44 81 30 04 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x4
   1400066b1:	00 
   1400066b2:	48 8b 05 c7 81 00 00 	mov    rax,QWORD PTR [rip+0x81c7]        # 0x14000e880
   1400066b9:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   1400066c0:	74 05                	je     0x1400066c7
   1400066c2:	e8 39 dc ff ff       	call   0x140004300
   1400066c7:	48 3b fb             	cmp    rdi,rbx
   1400066ca:	74 0b                	je     0x1400066d7
   1400066cc:	48 8b d3             	mov    rdx,rbx
   1400066cf:	48 8b cf             	mov    rcx,rdi
   1400066d2:	e8 b9 bd ff ff       	call   0x140002490
   1400066d7:	48 8b 05 a2 81 00 00 	mov    rax,QWORD PTR [rip+0x81a2]        # 0x14000e880
   1400066de:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   1400066e0:	0f ba f1 1f          	btr    ecx,0x1f
   1400066e4:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   1400066e7:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   1400066eb:	48 8d 0c c8          	lea    rcx,[rax+rcx*8]
   1400066ef:	4d 85 c0             	test   r8,r8
   1400066f2:	75 27                	jne    0x14000671b
   1400066f4:	4c 8b 41 f8          	mov    r8,QWORD PTR [rcx-0x8]
   1400066f8:	49 83 c0 01          	add    r8,0x1
   1400066fc:	4c 89 44 24 30       	mov    QWORD PTR [rsp+0x30],r8
   140006701:	75 07                	jne    0x14000670a
   140006703:	bf 01 00 00 00       	mov    edi,0x1
   140006708:	eb 37                	jmp    0x140006741
   14000670a:	33 d2                	xor    edx,edx
   14000670c:	4c 8d 4c 24 30       	lea    r9,[rsp+0x30]
   140006711:	8d 4a 01             	lea    ecx,[rdx+0x1]
   140006714:	e8 27 18 00 00       	call   0x140007f40
   140006719:	eb 0f                	jmp    0x14000672a
   14000671b:	48 8b 49 f8          	mov    rcx,QWORD PTR [rcx-0x8]
   14000671f:	33 d2                	xor    edx,edx
   140006721:	48 ff c1             	inc    rcx
   140006724:	49 8b c0             	mov    rax,r8
   140006727:	48 f7 f1             	div    rcx
   14000672a:	48 8b f8             	mov    rdi,rax
   14000672d:	48 83 f8 01          	cmp    rax,0x1
   140006731:	74 0e                	je     0x140006741
   140006733:	4c 8b c3             	mov    r8,rbx
   140006736:	48 8b d0             	mov    rdx,rax
   140006739:	48 8b cb             	mov    rcx,rbx
   14000673c:	e8 1f 00 00 00       	call   0x140006760
   140006741:	48 8b 05 38 81 00 00 	mov    rax,QWORD PTR [rip+0x8138]        # 0x14000e880
   140006748:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
   14000674d:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006750:	48 8b c7             	mov    rax,rdi
   140006753:	48 83 c4 20          	add    rsp,0x20
   140006757:	5f                   	pop    rdi
   140006758:	c3                   	ret
   140006759:	cc                   	int3
   14000675a:	cc                   	int3
   14000675b:	cc                   	int3
   14000675c:	cc                   	int3
   14000675d:	cc                   	int3
   14000675e:	cc                   	int3
   14000675f:	cc                   	int3
   140006760:	40 57                	rex push rdi
   140006762:	41 56                	push   r14
   140006764:	41 57                	push   r15
   140006766:	48 83 ec 40          	sub    rsp,0x40
   14000676a:	49 8b f8             	mov    rdi,r8
   14000676d:	4c 8b f2             	mov    r14,rdx
   140006770:	4c 8b f9             	mov    r15,rcx
   140006773:	49 3b c8             	cmp    rcx,r8
   140006776:	0f 84 c0 00 00 00    	je     0x14000683c
   14000677c:	49 8b c8             	mov    rcx,r8
   14000677f:	e8 bc e0 ff ff       	call   0x140004840
   140006784:	4d 85 f6             	test   r14,r14
   140006787:	0f 84 41 01 00 00    	je     0x1400068ce
   14000678d:	41 8b 07             	mov    eax,DWORD PTR [r15]
   140006790:	4c 8b 0d e9 80 00 00 	mov    r9,QWORD PTR [rip+0x80e9]        # 0x14000e880
   140006797:	48 89 5c 24 68       	mov    QWORD PTR [rsp+0x68],rbx
   14000679c:	33 db                	xor    ebx,ebx
   14000679e:	48 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],rbp
   1400067a3:	44 8b c3             	mov    r8d,ebx
   1400067a6:	48 89 74 24 38       	mov    QWORD PTR [rsp+0x38],rsi
   1400067ab:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
   1400067b0:	44 8b e0             	mov    r12d,eax
   1400067b3:	0f ba f0 1f          	btr    eax,0x1f
   1400067b7:	41 81 e4 00 00 00 80 	and    r12d,0x80000000
   1400067be:	8b e8                	mov    ebp,eax
   1400067c0:	49 39 19             	cmp    QWORD PTR [r9],rbx
   1400067c3:	0f 85 8d 00 00 00    	jne    0x140006856
   1400067c9:	85 c0                	test   eax,eax
   1400067cb:	74 59                	je     0x140006826
   1400067cd:	4c 8b 4f 08          	mov    r9,QWORD PTR [rdi+0x8]
   1400067d1:	49 8b 47 08          	mov    rax,QWORD PTR [r15+0x8]
   1400067d5:	48 8b 0c d8          	mov    rcx,QWORD PTR [rax+rbx*8]
   1400067d9:	49 8b c6             	mov    rax,r14
   1400067dc:	48 f7 e1             	mul    rcx
   1400067df:	49 89 04 d9          	mov    QWORD PTR [r9+rbx*8],rax
   1400067e3:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   1400067e7:	4c 01 04 d8          	add    QWORD PTR [rax+rbx*8],r8
   1400067eb:	4c 8b 4f 08          	mov    r9,QWORD PTR [rdi+0x8]
   1400067ef:	4d 39 04 d9          	cmp    QWORD PTR [r9+rbx*8],r8
   1400067f3:	4c 8b c2             	mov    r8,rdx
   1400067f6:	49 83 d0 00          	adc    r8,0x0
   1400067fa:	48 ff c3             	inc    rbx
   1400067fd:	48 3b dd             	cmp    rbx,rbp
   140006800:	7c cf                	jl     0x1400067d1
   140006802:	4d 85 c0             	test   r8,r8
   140006805:	74 1f                	je     0x140006826
   140006807:	48 8b 05 72 80 00 00 	mov    rax,QWORD PTR [rip+0x8072]        # 0x14000e880
   14000680e:	3b 68 28             	cmp    ebp,DWORD PTR [rax+0x28]
   140006811:	7c 0d                	jl     0x140006820
   140006813:	83 b8 90 00 00 00 00 	cmp    DWORD PTR [rax+0x90],0x0
   14000681a:	0f 85 90 00 00 00    	jne    0x1400068b0
   140006820:	4d 89 04 e9          	mov    QWORD PTR [r9+rbp*8],r8
   140006824:	ff c5                	inc    ebp
   140006826:	89 2f                	mov    DWORD PTR [rdi],ebp
   140006828:	8b 07                	mov    eax,DWORD PTR [rdi]
   14000682a:	85 c0                	test   eax,eax
   14000682c:	0f 84 88 00 00 00    	je     0x1400068ba
   140006832:	41 0b c4             	or     eax,r12d
   140006835:	89 07                	mov    DWORD PTR [rdi],eax
   140006837:	e9 7e 00 00 00       	jmp    0x1400068ba
   14000683c:	4d 85 f6             	test   r14,r14
   14000683f:	0f 85 48 ff ff ff    	jne    0x14000678d
   140006845:	48 8b cf             	mov    rcx,rdi
   140006848:	48 83 c4 40          	add    rsp,0x40
   14000684c:	41 5f                	pop    r15
   14000684e:	41 5e                	pop    r14
   140006850:	5f                   	pop    rdi
   140006851:	e9 ea df ff ff       	jmp    0x140004840
   140006856:	48 8b f3             	mov    rsi,rbx
   140006859:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140006860:	48 3b f5             	cmp    rsi,rbp
   140006863:	7c 05                	jl     0x14000686a
   140006865:	4d 85 c0             	test   r8,r8
   140006868:	74 be                	je     0x140006828
   14000686a:	41 3b 59 28          	cmp    ebx,DWORD PTR [r9+0x28]
   14000686e:	7e 0a                	jle    0x14000687a
   140006870:	41 83 b9 90 00 00 00 	cmp    DWORD PTR [r9+0x90],0x0
   140006877:	00 
   140006878:	75 36                	jne    0x1400068b0
   14000687a:	48 8b 47 08          	mov    rax,QWORD PTR [rdi+0x8]
   14000687e:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   140006881:	48 63 cb             	movsxd rcx,ebx
   140006884:	48 8d 14 c8          	lea    rdx,[rax+rcx*8]
   140006888:	49 8b 4f 08          	mov    rcx,QWORD PTR [r15+0x8]
   14000688c:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140006891:	49 8b d6             	mov    rdx,r14
   140006894:	48 8b 0c f1          	mov    rcx,QWORD PTR [rcx+rsi*8]
   140006898:	e8 43 15 00 00       	call   0x140007de0
   14000689d:	ff c3                	inc    ebx
   14000689f:	4c 8b c0             	mov    r8,rax
   1400068a2:	89 1f                	mov    DWORD PTR [rdi],ebx
   1400068a4:	48 ff c6             	inc    rsi
   1400068a7:	4c 8b 0d d2 7f 00 00 	mov    r9,QWORD PTR [rip+0x7fd2]        # 0x14000e880
   1400068ae:	eb b0                	jmp    0x140006860
   1400068b0:	b9 03 00 00 00       	mov    ecx,0x3
   1400068b5:	e8 36 d3 ff ff       	call   0x140003bf0
   1400068ba:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   1400068bf:	48 8b 6c 24 70       	mov    rbp,QWORD PTR [rsp+0x70]
   1400068c4:	48 8b 5c 24 68       	mov    rbx,QWORD PTR [rsp+0x68]
   1400068c9:	4c 8b 64 24 30       	mov    r12,QWORD PTR [rsp+0x30]
   1400068ce:	48 83 c4 40          	add    rsp,0x40
   1400068d2:	41 5f                	pop    r15
   1400068d4:	41 5e                	pop    r14
   1400068d6:	5f                   	pop    rdi
   1400068d7:	c3                   	ret
   1400068d8:	cc                   	int3
   1400068d9:	cc                   	int3
   1400068da:	cc                   	int3
   1400068db:	cc                   	int3
   1400068dc:	cc                   	int3
   1400068dd:	cc                   	int3
   1400068de:	cc                   	int3
   1400068df:	cc                   	int3
   1400068e0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   1400068e5:	48 89 6c 24 18       	mov    QWORD PTR [rsp+0x18],rbp
   1400068ea:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   1400068ef:	57                   	push   rdi
   1400068f0:	48 83 ec 30          	sub    rsp,0x30
   1400068f4:	8b 19                	mov    ebx,DWORD PTR [rcx]
   1400068f6:	49 8b f8             	mov    rdi,r8
   1400068f9:	0f ba f3 1f          	btr    ebx,0x1f
   1400068fd:	48 c7 44 24 40 00 00 	mov    QWORD PTR [rsp+0x40],0x0
   140006904:	00 00 
   140006906:	48 8b ea             	mov    rbp,rdx
   140006909:	48 8b f1             	mov    rsi,rcx
   14000690c:	49 3b c8             	cmp    rcx,r8
   14000690f:	74 08                	je     0x140006919
   140006911:	49 8b c8             	mov    rcx,r8
   140006914:	e8 27 df ff ff       	call   0x140004840
   140006919:	48 83 eb 01          	sub    rbx,0x1
   14000691d:	48 8b 15 5c 7f 00 00 	mov    rdx,QWORD PTR [rip+0x7f5c]        # 0x14000e880
   140006924:	78 32                	js     0x140006958
   140006926:	48 83 3a 00          	cmp    QWORD PTR [rdx],0x0
   14000692a:	75 54                	jne    0x140006980
   14000692c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140006930:	48 8b 56 08          	mov    rdx,QWORD PTR [rsi+0x8]
   140006934:	4c 8d 4c 24 40       	lea    r9,[rsp+0x40]
   140006939:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
   14000693e:	4c 8b c5             	mov    r8,rbp
   140006941:	48 8b 14 da          	mov    rdx,QWORD PTR [rdx+rbx*8]
   140006945:	e8 f6 15 00 00       	call   0x140007f40
   14000694a:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   14000694e:	48 89 04 d9          	mov    QWORD PTR [rcx+rbx*8],rax
   140006952:	48 83 eb 01          	sub    rbx,0x1
   140006956:	79 d8                	jns    0x140006930
   140006958:	8b 06                	mov    eax,DWORD PTR [rsi]
   14000695a:	48 8b cf             	mov    rcx,rdi
   14000695d:	89 07                	mov    DWORD PTR [rdi],eax
   14000695f:	e8 fc d5 ff ff       	call   0x140003f60
   140006964:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   140006969:	48 8b 5c 24 48       	mov    rbx,QWORD PTR [rsp+0x48]
   14000696e:	48 8b 6c 24 50       	mov    rbp,QWORD PTR [rsp+0x50]
   140006973:	48 8b 74 24 58       	mov    rsi,QWORD PTR [rsp+0x58]
   140006978:	48 83 c4 30          	add    rsp,0x30
   14000697c:	5f                   	pop    rdi
   14000697d:	c3                   	ret
   14000697e:	66 90                	xchg   ax,ax
   140006980:	4c 8b 46 08          	mov    r8,QWORD PTR [rsi+0x8]
   140006984:	48 8d 44 24 40       	lea    rax,[rsp+0x40]
   140006989:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14000698c:	4c 8b cd             	mov    r9,rbp
   14000698f:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
   140006994:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140006999:	4d 8b 04 d8          	mov    r8,QWORD PTR [r8+rbx*8]
   14000699d:	e8 3e 14 00 00       	call   0x140007de0
   1400069a2:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   1400069a6:	48 89 04 d9          	mov    QWORD PTR [rcx+rbx*8],rax
   1400069aa:	48 83 eb 01          	sub    rbx,0x1
   1400069ae:	78 a8                	js     0x140006958
   1400069b0:	48 8b 15 c9 7e 00 00 	mov    rdx,QWORD PTR [rip+0x7ec9]        # 0x14000e880
   1400069b7:	eb c7                	jmp    0x140006980
   1400069b9:	cc                   	int3
   1400069ba:	cc                   	int3
   1400069bb:	cc                   	int3
   1400069bc:	cc                   	int3
   1400069bd:	cc                   	int3
   1400069be:	cc                   	int3
   1400069bf:	cc                   	int3
   1400069c0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400069c5:	57                   	push   rdi
   1400069c6:	48 83 ec 20          	sub    rsp,0x20
   1400069ca:	48 8b 05 af 7e 00 00 	mov    rax,QWORD PTR [rip+0x7eaf]        # 0x14000e880
   1400069d1:	8b fa                	mov    edi,edx
   1400069d3:	48 8b d9             	mov    rbx,rcx
   1400069d6:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400069dd:	0f 85 d6 00 00 00    	jne    0x140006ab9
   1400069e3:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   1400069e6:	48 8b 15 93 7e 00 00 	mov    rdx,QWORD PTR [rip+0x7e93]        # 0x14000e880
   1400069ed:	48 63 42 2c          	movsxd rax,DWORD PTR [rdx+0x2c]
   1400069f1:	83 f8 18             	cmp    eax,0x18
   1400069f4:	7d 24                	jge    0x140006a1a
   1400069f6:	c7 44 82 30 58 00 00 	mov    DWORD PTR [rdx+rax*4+0x30],0x58
   1400069fd:	00 
   1400069fe:	48 8b 15 7b 7e 00 00 	mov    rdx,QWORD PTR [rip+0x7e7b]        # 0x14000e880
   140006a05:	83 ba 08 03 00 00 00 	cmp    DWORD PTR [rdx+0x308],0x0
   140006a0c:	74 0c                	je     0x140006a1a
   140006a0e:	e8 ed d8 ff ff       	call   0x140004300
   140006a13:	48 8b 15 66 7e 00 00 	mov    rdx,QWORD PTR [rip+0x7e66]        # 0x14000e880
   140006a1a:	44 8b 03             	mov    r8d,DWORD PTR [rbx]
   140006a1d:	83 ff 02             	cmp    edi,0x2
   140006a20:	75 30                	jne    0x140006a52
   140006a22:	f6 02 01             	test   BYTE PTR [rdx],0x1
   140006a25:	75 56                	jne    0x140006a7d
   140006a27:	ff 4a 2c             	dec    DWORD PTR [rdx+0x2c]
   140006a2a:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140006a2e:	f6 00 01             	test   BYTE PTR [rax],0x1
   140006a31:	0f 84 82 00 00 00    	je     0x140006ab9
   140006a37:	45 85 c0             	test   r8d,r8d
   140006a3a:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140006a3f:	b9 01 00 00 00       	mov    ecx,0x1
   140006a44:	0f 49 c1             	cmovns eax,ecx
   140006a47:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140006a4c:	48 83 c4 20          	add    rsp,0x20
   140006a50:	5f                   	pop    rdi
   140006a51:	c3                   	ret
   140006a52:	83 ff 08             	cmp    edi,0x8
   140006a55:	75 26                	jne    0x140006a7d
   140006a57:	f6 02 07             	test   BYTE PTR [rdx],0x7
   140006a5a:	75 21                	jne    0x140006a7d
   140006a5c:	ff 4a 2c             	dec    DWORD PTR [rdx+0x2c]
   140006a5f:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140006a63:	8b 08                	mov    ecx,DWORD PTR [rax]
   140006a65:	83 e1 07             	and    ecx,0x7
   140006a68:	8b c1                	mov    eax,ecx
   140006a6a:	f7 d8                	neg    eax
   140006a6c:	45 85 c0             	test   r8d,r8d
   140006a6f:	0f 49 c1             	cmovns eax,ecx
   140006a72:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140006a77:	48 83 c4 20          	add    rsp,0x20
   140006a7b:	5f                   	pop    rdi
   140006a7c:	c3                   	ret
   140006a7d:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   140006a84:	48 8b cb             	mov    rcx,rbx
   140006a87:	e8 04 ba ff ff       	call   0x140002490
   140006a8c:	48 8b 05 ed 7d 00 00 	mov    rax,QWORD PTR [rip+0x7ded]        # 0x14000e880
   140006a93:	8b d7                	mov    edx,edi
   140006a95:	48 8b 88 48 02 00 00 	mov    rcx,QWORD PTR [rax+0x248]
   140006a9c:	4c 8b c1             	mov    r8,rcx
   140006a9f:	e8 2c 00 00 00       	call   0x140006ad0
   140006aa4:	48 8b 0d d5 7d 00 00 	mov    rcx,QWORD PTR [rip+0x7dd5]        # 0x14000e880
   140006aab:	ff 49 2c             	dec    DWORD PTR [rcx+0x2c]
   140006aae:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140006ab3:	48 83 c4 20          	add    rsp,0x20
   140006ab7:	5f                   	pop    rdi
   140006ab8:	c3                   	ret
   140006ab9:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140006abe:	33 c0                	xor    eax,eax
   140006ac0:	48 83 c4 20          	add    rsp,0x20
   140006ac4:	5f                   	pop    rdi
   140006ac5:	c3                   	ret
   140006ac6:	cc                   	int3
   140006ac7:	cc                   	int3
   140006ac8:	cc                   	int3
   140006ac9:	cc                   	int3
   140006aca:	cc                   	int3
   140006acb:	cc                   	int3
   140006acc:	cc                   	int3
   140006acd:	cc                   	int3
   140006ace:	cc                   	int3
   140006acf:	cc                   	int3
   140006ad0:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140006ad5:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   140006ada:	57                   	push   rdi
   140006adb:	48 83 ec 20          	sub    rsp,0x20
   140006adf:	48 8b 05 9a 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d9a]        # 0x14000e880
   140006ae6:	49 8b d8             	mov    rbx,r8
   140006ae9:	48 63 fa             	movsxd rdi,edx
   140006aec:	48 8b f1             	mov    rsi,rcx
   140006aef:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140006af6:	75 65                	jne    0x140006b5d
   140006af8:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140006afb:	48 8b 0d 7e 7d 00 00 	mov    rcx,QWORD PTR [rip+0x7d7e]        # 0x14000e880
   140006b02:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140006b06:	83 f8 18             	cmp    eax,0x18
   140006b09:	7d 1d                	jge    0x140006b28
   140006b0b:	c7 44 81 30 0a 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0xa
   140006b12:	00 
   140006b13:	48 8b 05 66 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d66]        # 0x14000e880
   140006b1a:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   140006b21:	74 05                	je     0x140006b28
   140006b23:	e8 d8 d7 ff ff       	call   0x140004300
   140006b28:	48 8b ce             	mov    rcx,rsi
   140006b2b:	e8 80 d4 ff ff       	call   0x140003fb0
   140006b30:	85 c0                	test   eax,eax
   140006b32:	74 0a                	je     0x140006b3e
   140006b34:	b9 0c 00 00 00       	mov    ecx,0xc
   140006b39:	e8 b2 d0 ff ff       	call   0x140003bf0
   140006b3e:	85 ff                	test   edi,edi
   140006b40:	75 08                	jne    0x140006b4a
   140006b42:	8d 4f 02             	lea    ecx,[rdi+0x2]
   140006b45:	e8 a6 d0 ff ff       	call   0x140003bf0
   140006b4a:	48 8b 05 2f 7d 00 00 	mov    rax,QWORD PTR [rip+0x7d2f]        # 0x14000e880
   140006b51:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140006b58:	74 15                	je     0x140006b6f
   140006b5a:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006b5d:	33 c0                	xor    eax,eax
   140006b5f:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
   140006b64:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140006b69:	48 83 c4 20          	add    rsp,0x20
   140006b6d:	5f                   	pop    rdi
   140006b6e:	c3                   	ret
   140006b6f:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
   140006b74:	8b 2e                	mov    ebp,DWORD PTR [rsi]
   140006b76:	85 ed                	test   ebp,ebp
   140006b78:	75 19                	jne    0x140006b93
   140006b7a:	48 8b cb             	mov    rcx,rbx
   140006b7d:	e8 be dc ff ff       	call   0x140004840
   140006b82:	48 8b 05 f7 7c 00 00 	mov    rax,QWORD PTR [rip+0x7cf7]        # 0x14000e880
   140006b89:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006b8c:	33 c0                	xor    eax,eax
   140006b8e:	e9 05 01 00 00       	jmp    0x140006c98
   140006b93:	83 ff 01             	cmp    edi,0x1
   140006b96:	75 1c                	jne    0x140006bb4
   140006b98:	48 8b d3             	mov    rdx,rbx
   140006b9b:	48 8b ce             	mov    rcx,rsi
   140006b9e:	e8 ed b8 ff ff       	call   0x140002490
   140006ba3:	48 8b 05 d6 7c 00 00 	mov    rax,QWORD PTR [rip+0x7cd6]        # 0x14000e880
   140006baa:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006bad:	33 c0                	xor    eax,eax
   140006baf:	e9 e4 00 00 00       	jmp    0x140006c98
   140006bb4:	83 ff 02             	cmp    edi,0x2
   140006bb7:	0f 85 94 00 00 00    	jne    0x140006c51
   140006bbd:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140006bc1:	0f 85 af 00 00 00    	jne    0x140006c76
   140006bc7:	48 8b d3             	mov    rdx,rbx
   140006bca:	48 8b ce             	mov    rcx,rsi
   140006bcd:	e8 be b8 ff ff       	call   0x140002490
   140006bd2:	44 8b 03             	mov    r8d,DWORD PTR [rbx]
   140006bd5:	45 33 c9             	xor    r9d,r9d
   140006bd8:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140006bdc:	41 0f ba f0 1f       	btr    r8d,0x1f
   140006be1:	8b 38                	mov    edi,DWORD PTR [rax]
   140006be3:	48 d1 28             	shr    QWORD PTR [rax],1
   140006be6:	83 e7 01             	and    edi,0x1
   140006be9:	49 83 e8 01          	sub    r8,0x1
   140006bed:	74 38                	je     0x140006c27
   140006bef:	41 8b d1             	mov    edx,r9d
   140006bf2:	41 8b c9             	mov    ecx,r9d
   140006bf5:	45 8b c8             	mov    r9d,r8d
   140006bf8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   140006bff:	00 
   140006c00:	48 03 4b 08          	add    rcx,QWORD PTR [rbx+0x8]
   140006c04:	48 ff c2             	inc    rdx
   140006c07:	48 8b 41 08          	mov    rax,QWORD PTR [rcx+0x8]
   140006c0b:	48 c1 e0 3f          	shl    rax,0x3f
   140006c0f:	48 09 01             	or     QWORD PTR [rcx],rax
   140006c12:	48 8d 0c d5 00 00 00 	lea    rcx,[rdx*8+0x0]
   140006c19:	00 
   140006c1a:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140006c1e:	48 d1 2c 08          	shr    QWORD PTR [rax+rcx*1],1
   140006c22:	49 3b d0             	cmp    rdx,r8
   140006c25:	75 d9                	jne    0x140006c00
   140006c27:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140006c2b:	49 63 d1             	movsxd rdx,r9d
   140006c2e:	48 83 3c d1 00       	cmp    QWORD PTR [rcx+rdx*8],0x0
   140006c33:	75 08                	jne    0x140006c3d
   140006c35:	48 8b cb             	mov    rcx,rbx
   140006c38:	e8 23 d3 ff ff       	call   0x140003f60
   140006c3d:	48 8b 0d 3c 7c 00 00 	mov    rcx,QWORD PTR [rip+0x7c3c]        # 0x14000e880
   140006c44:	ff 49 2c             	dec    DWORD PTR [rcx+0x2c]
   140006c47:	85 ed                	test   ebp,ebp
   140006c49:	79 02                	jns    0x140006c4d
   140006c4b:	f7 df                	neg    edi
   140006c4d:	8b c7                	mov    eax,edi
   140006c4f:	eb 47                	jmp    0x140006c98
   140006c51:	85 ff                	test   edi,edi
   140006c53:	79 21                	jns    0x140006c76
   140006c55:	f7 df                	neg    edi
   140006c57:	4c 8b c3             	mov    r8,rbx
   140006c5a:	48 63 d7             	movsxd rdx,edi
   140006c5d:	48 8b ce             	mov    rcx,rsi
   140006c60:	e8 7b fc ff ff       	call   0x1400068e0
   140006c65:	48 8b c8             	mov    rcx,rax
   140006c68:	8b 03                	mov    eax,DWORD PTR [rbx]
   140006c6a:	85 c0                	test   eax,eax
   140006c6c:	74 18                	je     0x140006c86
   140006c6e:	0f ba f8 1f          	btc    eax,0x1f
   140006c72:	89 03                	mov    DWORD PTR [rbx],eax
   140006c74:	eb 10                	jmp    0x140006c86
   140006c76:	48 8b d7             	mov    rdx,rdi
   140006c79:	4c 8b c3             	mov    r8,rbx
   140006c7c:	48 8b ce             	mov    rcx,rsi
   140006c7f:	e8 5c fc ff ff       	call   0x1400068e0
   140006c84:	8b c8                	mov    ecx,eax
   140006c86:	48 8b 05 f3 7b 00 00 	mov    rax,QWORD PTR [rip+0x7bf3]        # 0x14000e880
   140006c8d:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006c90:	85 ed                	test   ebp,ebp
   140006c92:	79 02                	jns    0x140006c96
   140006c94:	f7 d9                	neg    ecx
   140006c96:	8b c1                	mov    eax,ecx
   140006c98:	48 8b 6c 24 30       	mov    rbp,QWORD PTR [rsp+0x30]
   140006c9d:	48 8b 5c 24 38       	mov    rbx,QWORD PTR [rsp+0x38]
   140006ca2:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140006ca7:	48 83 c4 20          	add    rsp,0x20
   140006cab:	5f                   	pop    rdi
   140006cac:	c3                   	ret
   140006cad:	cc                   	int3
   140006cae:	cc                   	int3
   140006caf:	cc                   	int3
   140006cb0:	48 83 ec 28          	sub    rsp,0x28
   140006cb4:	e8 07 fd ff ff       	call   0x1400069c0
   140006cb9:	33 c9                	xor    ecx,ecx
   140006cbb:	85 c0                	test   eax,eax
   140006cbd:	0f 94 c1             	sete   cl
   140006cc0:	8b c1                	mov    eax,ecx
   140006cc2:	48 83 c4 28          	add    rsp,0x28
   140006cc6:	c3                   	ret
   140006cc7:	cc                   	int3
   140006cc8:	cc                   	int3
   140006cc9:	cc                   	int3
   140006cca:	cc                   	int3
   140006ccb:	cc                   	int3
   140006ccc:	cc                   	int3
   140006ccd:	cc                   	int3
   140006cce:	cc                   	int3
   140006ccf:	cc                   	int3
   140006cd0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140006cd5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   140006cda:	57                   	push   rdi
   140006cdb:	48 83 ec 20          	sub    rsp,0x20
   140006cdf:	48 8b 05 9a 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b9a]        # 0x14000e880
   140006ce6:	49 8b d8             	mov    rbx,r8
   140006ce9:	48 8b fa             	mov    rdi,rdx
   140006cec:	48 8b f1             	mov    rsi,rcx
   140006cef:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140006cf6:	75 4e                	jne    0x140006d46
   140006cf8:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140006cfb:	4c 8b 0d 7e 7b 00 00 	mov    r9,QWORD PTR [rip+0x7b7e]        # 0x14000e880
   140006d02:	49 63 41 2c          	movsxd rax,DWORD PTR [r9+0x2c]
   140006d06:	83 f8 18             	cmp    eax,0x18
   140006d09:	7d 1e                	jge    0x140006d29
   140006d0b:	41 c7 44 81 30 1b 00 	mov    DWORD PTR [r9+rax*4+0x30],0x1b
   140006d12:	00 00 
   140006d14:	48 8b 05 65 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b65]        # 0x14000e880
   140006d1b:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   140006d22:	74 05                	je     0x140006d29
   140006d24:	e8 d7 d5 ff ff       	call   0x140004300
   140006d29:	4c 8b cb             	mov    r9,rbx
   140006d2c:	4c 8b c7             	mov    r8,rdi
   140006d2f:	ba 01 00 00 00       	mov    edx,0x1
   140006d34:	48 8b ce             	mov    rcx,rsi
   140006d37:	e8 a4 03 00 00       	call   0x1400070e0
   140006d3c:	48 8b 05 3d 7b 00 00 	mov    rax,QWORD PTR [rip+0x7b3d]        # 0x14000e880
   140006d43:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140006d46:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140006d4b:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   140006d50:	48 83 c4 20          	add    rsp,0x20
   140006d54:	5f                   	pop    rdi
   140006d55:	c3                   	ret
   140006d56:	cc                   	int3
   140006d57:	cc                   	int3
   140006d58:	cc                   	int3
   140006d59:	cc                   	int3
   140006d5a:	cc                   	int3
   140006d5b:	cc                   	int3
   140006d5c:	cc                   	int3
   140006d5d:	cc                   	int3
   140006d5e:	cc                   	int3
   140006d5f:	cc                   	int3
   140006d60:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140006d65:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   140006d6a:	57                   	push   rdi
   140006d6b:	41 54                	push   r12
   140006d6d:	41 55                	push   r13
   140006d6f:	41 56                	push   r14
   140006d71:	41 57                	push   r15
   140006d73:	48 83 ec 20          	sub    rsp,0x20
   140006d77:	8b 01                	mov    eax,DWORD PTR [rcx]
   140006d79:	4d 8b f8             	mov    r15,r8
   140006d7c:	44 8b 0a             	mov    r9d,DWORD PTR [rdx]
   140006d7f:	48 8b f2             	mov    rsi,rdx
   140006d82:	4c 8b f1             	mov    r14,rcx
   140006d85:	44 3b c8             	cmp    r9d,eax
   140006d88:	7e 1c                	jle    0x140006da6
   140006d8a:	41 8b d9             	mov    ebx,r9d
   140006d8d:	8b f8                	mov    edi,eax
   140006d8f:	49 3b c8             	cmp    rcx,r8
   140006d92:	74 0d                	je     0x140006da1
   140006d94:	49 8b d0             	mov    rdx,r8
   140006d97:	48 8b ce             	mov    rcx,rsi
   140006d9a:	e8 f1 b6 ff ff       	call   0x140002490
   140006d9f:	eb 1b                	jmp    0x140006dbc
   140006da1:	41 8b f9             	mov    edi,r9d
   140006da4:	eb 16                	jmp    0x140006dbc
   140006da6:	8b d8                	mov    ebx,eax
   140006da8:	41 8b f9             	mov    edi,r9d
   140006dab:	49 3b f7             	cmp    rsi,r15
   140006dae:	74 0a                	je     0x140006dba
   140006db0:	49 8b d7             	mov    rdx,r15
   140006db3:	e8 d8 b6 ff ff       	call   0x140002490
   140006db8:	eb 02                	jmp    0x140006dbc
   140006dba:	8b f8                	mov    edi,eax
   140006dbc:	4d 8b 6f 08          	mov    r13,QWORD PTR [r15+0x8]
   140006dc0:	33 c0                	xor    eax,eax
   140006dc2:	41 89 1f             	mov    DWORD PTR [r15],ebx
   140006dc5:	4c 8b 0d b4 7a 00 00 	mov    r9,QWORD PTR [rip+0x7ab4]        # 0x14000e880
   140006dcc:	4d 8b 76 08          	mov    r14,QWORD PTR [r14+0x8]
   140006dd0:	4c 8b 56 08          	mov    r10,QWORD PTR [rsi+0x8]
   140006dd4:	41 3b 59 28          	cmp    ebx,DWORD PTR [r9+0x28]
   140006dd8:	7c 09                	jl     0x140006de3
   140006dda:	41 39 81 90 00 00 00 	cmp    DWORD PTR [r9+0x90],eax
   140006de1:	75 0d                	jne    0x140006df0
   140006de3:	8d 4b 01             	lea    ecx,[rbx+0x1]
   140006de6:	41 89 0f             	mov    DWORD PTR [r15],ecx
   140006de9:	4c 8b 0d 90 7a 00 00 	mov    r9,QWORD PTR [rip+0x7a90]        # 0x14000e880
   140006df0:	4c 63 e3             	movsxd r12,ebx
   140006df3:	4d 2b d6             	sub    r10,r14
   140006df6:	33 db                	xor    ebx,ebx
   140006df8:	4c 63 df             	movsxd r11,edi
   140006dfb:	49 39 01             	cmp    QWORD PTR [r9],rax
   140006dfe:	0f 85 da 00 00 00    	jne    0x140006ede
   140006e04:	8d 73 01             	lea    esi,[rbx+0x1]
   140006e07:	85 ff                	test   edi,edi
   140006e09:	7e 40                	jle    0x140006e4b
   140006e0b:	4d 8b cd             	mov    r9,r13
   140006e0e:	49 8b d6             	mov    rdx,r14
   140006e11:	4d 2b ce             	sub    r9,r14
   140006e14:	8b df                	mov    ebx,edi
   140006e16:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140006e1d:	00 00 00 
   140006e20:	49 8b 0c 12          	mov    rcx,QWORD PTR [r10+rdx*1]
   140006e24:	48 03 0a             	add    rcx,QWORD PTR [rdx]
   140006e27:	48 03 c8             	add    rcx,rax
   140006e2a:	48 3b 0a             	cmp    rcx,QWORD PTR [rdx]
   140006e2d:	76 04                	jbe    0x140006e33
   140006e2f:	33 c0                	xor    eax,eax
   140006e31:	eb 04                	jmp    0x140006e37
   140006e33:	48 0f 42 c6          	cmovb  rax,rsi
   140006e37:	49 89 0c 11          	mov    QWORD PTR [r9+rdx*1],rcx
   140006e3b:	48 83 c2 08          	add    rdx,0x8
   140006e3f:	4c 2b de             	sub    r11,rsi
   140006e42:	75 dc                	jne    0x140006e20
   140006e44:	4c 8b 0d 35 7a 00 00 	mov    r9,QWORD PTR [rip+0x7a35]        # 0x14000e880
   140006e4b:	4c 63 c3             	movsxd r8,ebx
   140006e4e:	4d 3b c4             	cmp    r8,r12
   140006e51:	7d 42                	jge    0x140006e95
   140006e53:	4d 8b dd             	mov    r11,r13
   140006e56:	4b 8d 14 c6          	lea    rdx,[r14+r8*8]
   140006e5a:	4d 2b de             	sub    r11,r14
   140006e5d:	0f 1f 00             	nop    DWORD PTR [rax]
   140006e60:	48 85 c0             	test   rax,rax
   140006e63:	74 29                	je     0x140006e8e
   140006e65:	4a 8b 0c 12          	mov    rcx,QWORD PTR [rdx+r10*1]
   140006e69:	48 03 0a             	add    rcx,QWORD PTR [rdx]
   140006e6c:	48 03 c8             	add    rcx,rax
   140006e6f:	48 3b 0a             	cmp    rcx,QWORD PTR [rdx]
   140006e72:	76 04                	jbe    0x140006e78
   140006e74:	33 c0                	xor    eax,eax
   140006e76:	eb 04                	jmp    0x140006e7c
   140006e78:	48 0f 42 c6          	cmovb  rax,rsi
   140006e7c:	4a 89 0c 1a          	mov    QWORD PTR [rdx+r11*1],rcx
   140006e80:	ff c3                	inc    ebx
   140006e82:	48 83 c2 08          	add    rdx,0x8
   140006e86:	49 ff c0             	inc    r8
   140006e89:	4d 3b c4             	cmp    r8,r12
   140006e8c:	7c d2                	jl     0x140006e60
   140006e8e:	4c 8b 0d eb 79 00 00 	mov    r9,QWORD PTR [rip+0x79eb]        # 0x14000e880
   140006e95:	48 85 c0             	test   rax,rax
   140006e98:	74 1c                	je     0x140006eb6
   140006e9a:	41 83 b9 90 00 00 00 	cmp    DWORD PTR [r9+0x90],0x0
   140006ea1:	00 
   140006ea2:	74 0a                	je     0x140006eae
   140006ea4:	41 3b 59 28          	cmp    ebx,DWORD PTR [r9+0x28]
   140006ea8:	0f 8d f8 00 00 00    	jge    0x140006fa6
   140006eae:	48 63 cb             	movsxd rcx,ebx
   140006eb1:	49 89 44 cd 00       	mov    QWORD PTR [r13+rcx*8+0x0],rax
   140006eb6:	41 8b 0f             	mov    ecx,DWORD PTR [r15]
   140006eb9:	ff c9                	dec    ecx
   140006ebb:	49 83 7c cd 00 00    	cmp    QWORD PTR [r13+rcx*8+0x0],0x0
   140006ec1:	75 03                	jne    0x140006ec6
   140006ec3:	41 89 0f             	mov    DWORD PTR [r15],ecx
   140006ec6:	48 8b 5c 24 58       	mov    rbx,QWORD PTR [rsp+0x58]
   140006ecb:	48 8b 74 24 60       	mov    rsi,QWORD PTR [rsp+0x60]
   140006ed0:	48 83 c4 20          	add    rsp,0x20
   140006ed4:	41 5f                	pop    r15
   140006ed6:	41 5e                	pop    r14
   140006ed8:	41 5d                	pop    r13
   140006eda:	41 5c                	pop    r12
   140006edc:	5f                   	pop    rdi
   140006edd:	c3                   	ret
   140006ede:	85 ff                	test   edi,edi
   140006ee0:	7e 4d                	jle    0x140006f2f
   140006ee2:	48 89 6c 24 50       	mov    QWORD PTR [rsp+0x50],rbp
   140006ee7:	49 8b f6             	mov    rsi,r14
   140006eea:	49 8b ed             	mov    rbp,r13
   140006eed:	8b df                	mov    ebx,edi
   140006eef:	49 2b ee             	sub    rbp,r14
   140006ef2:	49 8b 11             	mov    rdx,QWORD PTR [r9]
   140006ef5:	4e 8b 04 16          	mov    r8,QWORD PTR [rsi+r10*1]
   140006ef9:	4c 03 06             	add    r8,QWORD PTR [rsi]
   140006efc:	48 8d 76 08          	lea    rsi,[rsi+0x8]
   140006f00:	4c 03 c0             	add    r8,rax
   140006f03:	33 c0                	xor    eax,eax
   140006f05:	4c 3b c2             	cmp    r8,rdx
   140006f08:	49 8b c8             	mov    rcx,r8
   140006f0b:	0f 93 c0             	setae  al
   140006f0e:	48 2b ca             	sub    rcx,rdx
   140006f11:	4c 3b c2             	cmp    r8,rdx
   140006f14:	49 0f 42 c8          	cmovb  rcx,r8
   140006f18:	48 89 4c 2e f8       	mov    QWORD PTR [rsi+rbp*1-0x8],rcx
   140006f1d:	4c 8b 0d 5c 79 00 00 	mov    r9,QWORD PTR [rip+0x795c]        # 0x14000e880
   140006f24:	49 83 eb 01          	sub    r11,0x1
   140006f28:	75 c8                	jne    0x140006ef2
   140006f2a:	48 8b 6c 24 50       	mov    rbp,QWORD PTR [rsp+0x50]
   140006f2f:	4c 63 db             	movsxd r11,ebx
   140006f32:	4d 3b dc             	cmp    r11,r12
   140006f35:	7d 4e                	jge    0x140006f85
   140006f37:	49 8b fd             	mov    rdi,r13
   140006f3a:	4f 8d 04 de          	lea    r8,[r14+r11*8]
   140006f3e:	49 2b fe             	sub    rdi,r14
   140006f41:	48 85 c0             	test   rax,rax
   140006f44:	0f 84 6c ff ff ff    	je     0x140006eb6
   140006f4a:	49 8b 09             	mov    rcx,QWORD PTR [r9]
   140006f4d:	4b 8b 14 10          	mov    rdx,QWORD PTR [r8+r10*1]
   140006f51:	49 03 10             	add    rdx,QWORD PTR [r8]
   140006f54:	48 03 d0             	add    rdx,rax
   140006f57:	48 8b c2             	mov    rax,rdx
   140006f5a:	48 2b c1             	sub    rax,rcx
   140006f5d:	48 3b d1             	cmp    rdx,rcx
   140006f60:	48 0f 42 c2          	cmovb  rax,rdx
   140006f64:	ff c3                	inc    ebx
   140006f66:	49 89 04 38          	mov    QWORD PTR [r8+rdi*1],rax
   140006f6a:	49 ff c3             	inc    r11
   140006f6d:	4c 8b 0d 0c 79 00 00 	mov    r9,QWORD PTR [rip+0x790c]        # 0x14000e880
   140006f74:	33 c0                	xor    eax,eax
   140006f76:	49 83 c0 08          	add    r8,0x8
   140006f7a:	48 3b d1             	cmp    rdx,rcx
   140006f7d:	0f 93 c0             	setae  al
   140006f80:	4d 3b dc             	cmp    r11,r12
   140006f83:	7c bc                	jl     0x140006f41
   140006f85:	48 85 c0             	test   rax,rax
   140006f88:	0f 84 28 ff ff ff    	je     0x140006eb6
   140006f8e:	41 83 b9 90 00 00 00 	cmp    DWORD PTR [r9+0x90],0x0
   140006f95:	00 
   140006f96:	0f 84 12 ff ff ff    	je     0x140006eae
   140006f9c:	41 3b 59 28          	cmp    ebx,DWORD PTR [r9+0x28]
   140006fa0:	0f 8c 08 ff ff ff    	jl     0x140006eae
   140006fa6:	b9 03 00 00 00       	mov    ecx,0x3
   140006fab:	e8 40 cc ff ff       	call   0x140003bf0
   140006fb0:	e9 11 ff ff ff       	jmp    0x140006ec6
   140006fb5:	cc                   	int3
   140006fb6:	cc                   	int3
   140006fb7:	cc                   	int3
   140006fb8:	cc                   	int3
   140006fb9:	cc                   	int3
   140006fba:	cc                   	int3
   140006fbb:	cc                   	int3
   140006fbc:	cc                   	int3
   140006fbd:	cc                   	int3
   140006fbe:	cc                   	int3
   140006fbf:	cc                   	int3
   140006fc0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140006fc5:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   140006fca:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   140006fcf:	57                   	push   rdi
   140006fd0:	41 56                	push   r14
   140006fd2:	41 57                	push   r15
   140006fd4:	48 83 ec 20          	sub    rsp,0x20
   140006fd8:	48 63 19             	movsxd rbx,DWORD PTR [rcx]
   140006fdb:	4d 8b f8             	mov    r15,r8
   140006fde:	8b 32                	mov    esi,DWORD PTR [rdx]
   140006fe0:	48 8b fa             	mov    rdi,rdx
   140006fe3:	4c 8b f1             	mov    r14,rcx
   140006fe6:	3b f3                	cmp    esi,ebx
   140006fe8:	0f 8f cf 00 00 00    	jg     0x1400070bd
   140006fee:	49 3b d0             	cmp    rdx,r8
   140006ff1:	74 0a                	je     0x140006ffd
   140006ff3:	49 8b d0             	mov    rdx,r8
   140006ff6:	e8 95 b4 ff ff       	call   0x140002490
   140006ffb:	eb 02                	jmp    0x140006fff
   140006ffd:	8b f3                	mov    esi,ebx
   140006fff:	41 89 1f             	mov    DWORD PTR [r15],ebx
   140007002:	33 c0                	xor    eax,eax
   140007004:	49 8b 56 08          	mov    rdx,QWORD PTR [r14+0x8]
   140007008:	45 33 c0             	xor    r8d,r8d
   14000700b:	48 8b 6f 08          	mov    rbp,QWORD PTR [rdi+0x8]
   14000700f:	4c 8b 1d 6a 78 00 00 	mov    r11,QWORD PTR [rip+0x786a]        # 0x14000e880
   140007016:	48 2b ea             	sub    rbp,rdx
   140007019:	4d 8b 77 08          	mov    r14,QWORD PTR [r15+0x8]
   14000701d:	4c 2b f2             	sub    r14,rdx
   140007020:	48 63 fe             	movsxd rdi,esi
   140007023:	49 39 03             	cmp    QWORD PTR [r11],rax
   140007026:	75 48                	jne    0x140007070
   140007028:	44 8d 50 01          	lea    r10d,[rax+0x1]
   14000702c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140007030:	4c 3b c7             	cmp    r8,rdi
   140007033:	7c 05                	jl     0x14000703a
   140007035:	48 85 c0             	test   rax,rax
   140007038:	74 79                	je     0x1400070b3
   14000703a:	4c 3b c3             	cmp    r8,rbx
   14000703d:	7f 7e                	jg     0x1400070bd
   14000703f:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   140007042:	48 2b 0c 2a          	sub    rcx,QWORD PTR [rdx+rbp*1]
   140007046:	48 2b c8             	sub    rcx,rax
   140007049:	48 3b 0a             	cmp    rcx,QWORD PTR [rdx]
   14000704c:	73 0f                	jae    0x14000705d
   14000704e:	33 c0                	xor    eax,eax
   140007050:	49 89 0c 16          	mov    QWORD PTR [r14+rdx*1],rcx
   140007054:	49 ff c0             	inc    r8
   140007057:	48 83 c2 08          	add    rdx,0x8
   14000705b:	eb d3                	jmp    0x140007030
   14000705d:	49 0f 47 c2          	cmova  rax,r10
   140007061:	49 89 0c 16          	mov    QWORD PTR [r14+rdx*1],rcx
   140007065:	49 ff c0             	inc    r8
   140007068:	48 83 c2 08          	add    rdx,0x8
   14000706c:	eb c2                	jmp    0x140007030
   14000706e:	66 90                	xchg   ax,ax
   140007070:	4c 3b c7             	cmp    r8,rdi
   140007073:	7c 05                	jl     0x14000707a
   140007075:	48 85 c0             	test   rax,rax
   140007078:	74 39                	je     0x1400070b3
   14000707a:	4c 3b c3             	cmp    r8,rbx
   14000707d:	7f 3e                	jg     0x1400070bd
   14000707f:	4c 8b 12             	mov    r10,QWORD PTR [rdx]
   140007082:	4c 8b 0c 2a          	mov    r9,QWORD PTR [rdx+rbp*1]
   140007086:	49 8b ca             	mov    rcx,r10
   140007089:	4c 03 c8             	add    r9,rax
   14000708c:	49 2b c9             	sub    rcx,r9
   14000708f:	4d 3b d1             	cmp    r10,r9
   140007092:	73 03                	jae    0x140007097
   140007094:	49 03 0b             	add    rcx,QWORD PTR [r11]
   140007097:	49 89 0c 16          	mov    QWORD PTR [r14+rdx*1],rcx
   14000709b:	33 c0                	xor    eax,eax
   14000709d:	4c 8b 1d dc 77 00 00 	mov    r11,QWORD PTR [rip+0x77dc]        # 0x14000e880
   1400070a4:	48 83 c2 08          	add    rdx,0x8
   1400070a8:	49 ff c0             	inc    r8
   1400070ab:	4d 3b d1             	cmp    r10,r9
   1400070ae:	0f 92 c0             	setb   al
   1400070b1:	eb bd                	jmp    0x140007070
   1400070b3:	49 8b cf             	mov    rcx,r15
   1400070b6:	e8 a5 ce ff ff       	call   0x140003f60
   1400070bb:	eb 0a                	jmp    0x1400070c7
   1400070bd:	b9 04 00 00 00       	mov    ecx,0x4
   1400070c2:	e8 29 cb ff ff       	call   0x140003bf0
   1400070c7:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   1400070cc:	48 8b 6c 24 48       	mov    rbp,QWORD PTR [rsp+0x48]
   1400070d1:	48 8b 74 24 50       	mov    rsi,QWORD PTR [rsp+0x50]
   1400070d6:	48 83 c4 20          	add    rsp,0x20
   1400070da:	41 5f                	pop    r15
   1400070dc:	41 5e                	pop    r14
   1400070de:	5f                   	pop    rdi
   1400070df:	c3                   	ret
   1400070e0:	48 89 5c 24 18       	mov    QWORD PTR [rsp+0x18],rbx
   1400070e5:	55                   	push   rbp
   1400070e6:	56                   	push   rsi
   1400070e7:	57                   	push   rdi
   1400070e8:	48 83 ec 20          	sub    rsp,0x20
   1400070ec:	49 8b e9             	mov    rbp,r9
   1400070ef:	49 8b d8             	mov    rbx,r8
   1400070f2:	8b f2                	mov    esi,edx
   1400070f4:	48 8b f9             	mov    rdi,rcx
   1400070f7:	e8 b4 ce ff ff       	call   0x140003fb0
   1400070fc:	85 c0                	test   eax,eax
   1400070fe:	0f 85 3a 01 00 00    	jne    0x14000723e
   140007104:	48 8b cb             	mov    rcx,rbx
   140007107:	e8 a4 ce ff ff       	call   0x140003fb0
   14000710c:	85 c0                	test   eax,eax
   14000710e:	0f 85 2a 01 00 00    	jne    0x14000723e
   140007114:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140007119:	48 8b cf             	mov    rcx,rdi
   14000711c:	4c 89 7c 24 48       	mov    QWORD PTR [rsp+0x48],r15
   140007121:	e8 6a b4 ff ff       	call   0x140002590
   140007126:	48 8b cb             	mov    rcx,rbx
   140007129:	44 8b f8             	mov    r15d,eax
   14000712c:	e8 5f b4 ff ff       	call   0x140002590
   140007131:	81 27 ff ff ff 7f    	and    DWORD PTR [rdi],0x7fffffff
   140007137:	48 8b d3             	mov    rdx,rbx
   14000713a:	81 23 ff ff ff 7f    	and    DWORD PTR [rbx],0x7fffffff
   140007140:	48 8b cf             	mov    rcx,rdi
   140007143:	44 8b f0             	mov    r14d,eax
   140007146:	e8 85 cd ff ff       	call   0x140003ed0
   14000714b:	44 8b c0             	mov    r8d,eax
   14000714e:	41 8b c6             	mov    eax,r14d
   140007151:	0f af c6             	imul   eax,esi
   140007154:	ff c0                	inc    eax
   140007156:	99                   	cdq
   140007157:	2b c2                	sub    eax,edx
   140007159:	41 8d 57 01          	lea    edx,[r15+0x1]
   14000715d:	d1 f8                	sar    eax,1
   14000715f:	03 d0                	add    edx,eax
   140007161:	74 7d                	je     0x1400071e0
   140007163:	83 ea 01             	sub    edx,0x1
   140007166:	74 4d                	je     0x1400071b5
   140007168:	83 ea 01             	sub    edx,0x1
   14000716b:	74 2e                	je     0x14000719b
   14000716d:	83 fa 01             	cmp    edx,0x1
   140007170:	0f 85 8c 00 00 00    	jne    0x140007202
   140007176:	45 85 c0             	test   r8d,r8d
   140007179:	78 10                	js     0x14000718b
   14000717b:	48 8b cf             	mov    rcx,rdi
   14000717e:	48 8b d3             	mov    rdx,rbx
   140007181:	4c 8b c5             	mov    r8,rbp
   140007184:	e8 d7 fb ff ff       	call   0x140006d60
   140007189:	eb 77                	jmp    0x140007202
   14000718b:	48 8b cb             	mov    rcx,rbx
   14000718e:	48 8b d7             	mov    rdx,rdi
   140007191:	4c 8b c5             	mov    r8,rbp
   140007194:	e8 c7 fb ff ff       	call   0x140006d60
   140007199:	eb 67                	jmp    0x140007202
   14000719b:	45 85 c0             	test   r8d,r8d
   14000719e:	78 0d                	js     0x1400071ad
   1400071a0:	be 01 00 00 00       	mov    esi,0x1
   1400071a5:	48 8b cf             	mov    rcx,rdi
   1400071a8:	48 8b d3             	mov    rdx,rbx
   1400071ab:	eb 25                	jmp    0x1400071d2
   1400071ad:	48 8b cb             	mov    rcx,rbx
   1400071b0:	48 8b d7             	mov    rdx,rdi
   1400071b3:	eb 18                	jmp    0x1400071cd
   1400071b5:	45 85 c0             	test   r8d,r8d
   1400071b8:	7f 0d                	jg     0x1400071c7
   1400071ba:	be 01 00 00 00       	mov    esi,0x1
   1400071bf:	48 8b cb             	mov    rcx,rbx
   1400071c2:	48 8b d7             	mov    rdx,rdi
   1400071c5:	eb 0b                	jmp    0x1400071d2
   1400071c7:	48 8b cf             	mov    rcx,rdi
   1400071ca:	48 8b d3             	mov    rdx,rbx
   1400071cd:	be ff ff ff ff       	mov    esi,0xffffffff
   1400071d2:	4c 8b c5             	mov    r8,rbp
   1400071d5:	e8 e6 fd ff ff       	call   0x140006fc0
   1400071da:	85 f6                	test   esi,esi
   1400071dc:	79 24                	jns    0x140007202
   1400071de:	eb 1b                	jmp    0x1400071fb
   1400071e0:	45 85 c0             	test   r8d,r8d
   1400071e3:	78 08                	js     0x1400071ed
   1400071e5:	48 8b cf             	mov    rcx,rdi
   1400071e8:	48 8b d3             	mov    rdx,rbx
   1400071eb:	eb 06                	jmp    0x1400071f3
   1400071ed:	48 8b cb             	mov    rcx,rbx
   1400071f0:	48 8b d7             	mov    rdx,rdi
   1400071f3:	4c 8b c5             	mov    r8,rbp
   1400071f6:	e8 65 fb ff ff       	call   0x140006d60
   1400071fb:	81 75 00 00 00 00 80 	xor    DWORD PTR [rbp+0x0],0x80000000
   140007202:	48 3b fd             	cmp    rdi,rbp
   140007205:	74 0b                	je     0x140007212
   140007207:	45 85 ff             	test   r15d,r15d
   14000720a:	79 06                	jns    0x140007212
   14000720c:	81 37 00 00 00 80    	xor    DWORD PTR [rdi],0x80000000
   140007212:	4c 8b 7c 24 48       	mov    r15,QWORD PTR [rsp+0x48]
   140007217:	48 3b dd             	cmp    rbx,rbp
   14000721a:	74 10                	je     0x14000722c
   14000721c:	48 3b df             	cmp    rbx,rdi
   14000721f:	74 0b                	je     0x14000722c
   140007221:	45 85 f6             	test   r14d,r14d
   140007224:	79 06                	jns    0x14000722c
   140007226:	81 33 00 00 00 80    	xor    DWORD PTR [rbx],0x80000000
   14000722c:	4c 8b 74 24 40       	mov    r14,QWORD PTR [rsp+0x40]
   140007231:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
   140007236:	48 83 c4 20          	add    rsp,0x20
   14000723a:	5f                   	pop    rdi
   14000723b:	5e                   	pop    rsi
   14000723c:	5d                   	pop    rbp
   14000723d:	c3                   	ret
   14000723e:	b9 0c 00 00 00       	mov    ecx,0xc
   140007243:	48 8b 5c 24 50       	mov    rbx,QWORD PTR [rsp+0x50]
   140007248:	48 83 c4 20          	add    rsp,0x20
   14000724c:	5f                   	pop    rdi
   14000724d:	5e                   	pop    rsi
   14000724e:	5d                   	pop    rbp
   14000724f:	e9 9c c9 ff ff       	jmp    0x140003bf0
   140007254:	cc                   	int3
   140007255:	cc                   	int3
   140007256:	cc                   	int3
   140007257:	cc                   	int3
   140007258:	cc                   	int3
   140007259:	cc                   	int3
   14000725a:	cc                   	int3
   14000725b:	cc                   	int3
   14000725c:	cc                   	int3
   14000725d:	cc                   	int3
   14000725e:	cc                   	int3
   14000725f:	cc                   	int3
   140007260:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140007265:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   14000726a:	57                   	push   rdi
   14000726b:	48 83 ec 20          	sub    rsp,0x20
   14000726f:	48 8b 05 0a 76 00 00 	mov    rax,QWORD PTR [rip+0x760a]        # 0x14000e880
   140007276:	49 8b d8             	mov    rbx,r8
   140007279:	48 8b fa             	mov    rdi,rdx
   14000727c:	48 8b f1             	mov    rsi,rcx
   14000727f:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140007286:	75 4e                	jne    0x1400072d6
   140007288:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   14000728b:	4c 8b 0d ee 75 00 00 	mov    r9,QWORD PTR [rip+0x75ee]        # 0x14000e880
   140007292:	49 63 41 2c          	movsxd rax,DWORD PTR [r9+0x2c]
   140007296:	83 f8 18             	cmp    eax,0x18
   140007299:	7d 1e                	jge    0x1400072b9
   14000729b:	41 c7 44 81 30 1c 00 	mov    DWORD PTR [r9+rax*4+0x30],0x1c
   1400072a2:	00 00 
   1400072a4:	48 8b 05 d5 75 00 00 	mov    rax,QWORD PTR [rip+0x75d5]        # 0x14000e880
   1400072ab:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   1400072b2:	74 05                	je     0x1400072b9
   1400072b4:	e8 47 d0 ff ff       	call   0x140004300
   1400072b9:	4c 8b cb             	mov    r9,rbx
   1400072bc:	4c 8b c7             	mov    r8,rdi
   1400072bf:	ba ff ff ff ff       	mov    edx,0xffffffff
   1400072c4:	48 8b ce             	mov    rcx,rsi
   1400072c7:	e8 14 fe ff ff       	call   0x1400070e0
   1400072cc:	48 8b 05 ad 75 00 00 	mov    rax,QWORD PTR [rip+0x75ad]        # 0x14000e880
   1400072d3:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400072d6:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400072db:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   1400072e0:	48 83 c4 20          	add    rsp,0x20
   1400072e4:	5f                   	pop    rdi
   1400072e5:	c3                   	ret
   1400072e6:	cc                   	int3
   1400072e7:	cc                   	int3
   1400072e8:	cc                   	int3
   1400072e9:	cc                   	int3
   1400072ea:	cc                   	int3
   1400072eb:	cc                   	int3
   1400072ec:	cc                   	int3
   1400072ed:	cc                   	int3
   1400072ee:	cc                   	int3
   1400072ef:	cc                   	int3
   1400072f0:	40 57                	rex push rdi
   1400072f2:	48 83 ec 20          	sub    rsp,0x20
   1400072f6:	48 8b 05 83 75 00 00 	mov    rax,QWORD PTR [rip+0x7583]        # 0x14000e880
   1400072fd:	48 8b f9             	mov    rdi,rcx
   140007300:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140007307:	0f 85 54 01 00 00    	jne    0x140007461
   14000730d:	e8 ee d4 ff ff       	call   0x140004800
   140007312:	85 c0                	test   eax,eax
   140007314:	0f 84 47 01 00 00    	je     0x140007461
   14000731a:	48 8b 05 5f 75 00 00 	mov    rax,QWORD PTR [rip+0x755f]        # 0x14000e880
   140007321:	48 89 5c 24 30       	mov    QWORD PTR [rsp+0x30],rbx
   140007326:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140007329:	48 8b 05 50 75 00 00 	mov    rax,QWORD PTR [rip+0x7550]        # 0x14000e880
   140007330:	48 63 48 2c          	movsxd rcx,DWORD PTR [rax+0x2c]
   140007334:	83 f9 18             	cmp    ecx,0x18
   140007337:	7d 24                	jge    0x14000735d
   140007339:	c7 44 88 30 31 00 00 	mov    DWORD PTR [rax+rcx*4+0x30],0x31
   140007340:	00 
   140007341:	48 8b 05 38 75 00 00 	mov    rax,QWORD PTR [rip+0x7538]        # 0x14000e880
   140007348:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   14000734f:	74 0c                	je     0x14000735d
   140007351:	e8 aa cf ff ff       	call   0x140004300
   140007356:	48 8b 05 23 75 00 00 	mov    rax,QWORD PTR [rip+0x7523]        # 0x14000e880
   14000735d:	48 8b 48 18          	mov    rcx,QWORD PTR [rax+0x18]
   140007361:	48 39 08             	cmp    QWORD PTR [rax],rcx
   140007364:	75 45                	jne    0x1400073ab
   140007366:	8b 0f                	mov    ecx,DWORD PTR [rdi]
   140007368:	0f ba f1 1f          	btr    ecx,0x1f
   14000736c:	8b d1                	mov    edx,ecx
   14000736e:	8d 59 ff             	lea    ebx,[rcx-0x1]
   140007371:	48 8b 4f 08          	mov    rcx,QWORD PTR [rdi+0x8]
   140007375:	0f af 58 14          	imul   ebx,DWORD PTR [rax+0x14]
   140007379:	4c 8b 44 d1 f8       	mov    r8,QWORD PTR [rcx+rdx*8-0x8]
   14000737e:	49 83 f8 01          	cmp    r8,0x1
   140007382:	0f 82 c9 00 00 00    	jb     0x140007451
   140007388:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000738f:	00 
   140007390:	ff c3                	inc    ebx
   140007392:	49 d1 e8             	shr    r8,1
   140007395:	49 83 f8 01          	cmp    r8,0x1
   140007399:	73 f5                	jae    0x140007390
   14000739b:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   14000739e:	8b c3                	mov    eax,ebx
   1400073a0:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400073a5:	48 83 c4 20          	add    rsp,0x20
   1400073a9:	5f                   	pop    rdi
   1400073aa:	c3                   	ret
   1400073ab:	48 8b 90 48 02 00 00 	mov    rdx,QWORD PTR [rax+0x248]
   1400073b2:	48 8b cf             	mov    rcx,rdi
   1400073b5:	e8 d6 b0 ff ff       	call   0x140002490
   1400073ba:	48 8b 15 bf 74 00 00 	mov    rdx,QWORD PTR [rip+0x74bf]        # 0x14000e880
   1400073c1:	b9 01 00 00 00       	mov    ecx,0x1
   1400073c6:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   1400073cd:	e8 4e b6 ff ff       	call   0x140002a20
   1400073d2:	48 8b 05 a7 74 00 00 	mov    rax,QWORD PTR [rip+0x74a7]        # 0x14000e880
   1400073d9:	33 db                	xor    ebx,ebx
   1400073db:	48 8b 88 48 02 00 00 	mov    rcx,QWORD PTR [rax+0x248]
   1400073e2:	83 39 01             	cmp    DWORD PTR [rcx],0x1
   1400073e5:	76 2b                	jbe    0x140007412
   1400073e7:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   1400073ee:	00 00 
   1400073f0:	48 8b 50 18          	mov    rdx,QWORD PTR [rax+0x18]
   1400073f4:	4c 8b c1             	mov    r8,rcx
   1400073f7:	e8 e4 f4 ff ff       	call   0x1400068e0
   1400073fc:	48 8b 05 7d 74 00 00 	mov    rax,QWORD PTR [rip+0x747d]        # 0x14000e880
   140007403:	48 8b 88 48 02 00 00 	mov    rcx,QWORD PTR [rax+0x248]
   14000740a:	03 58 14             	add    ebx,DWORD PTR [rax+0x14]
   14000740d:	83 39 01             	cmp    DWORD PTR [rcx],0x1
   140007410:	77 de                	ja     0x1400073f0
   140007412:	48 8b 90 48 02 00 00 	mov    rdx,QWORD PTR [rax+0x248]
   140007419:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   14000741d:	48 83 39 01          	cmp    QWORD PTR [rcx],0x1
   140007421:	72 2e                	jb     0x140007451
   140007423:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140007427:	66 0f 1f 84 00 00 00 	nop    WORD PTR [rax+rax*1+0x0]
   14000742e:	00 00 
   140007430:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   140007434:	ff c3                	inc    ebx
   140007436:	48 d1 29             	shr    QWORD PTR [rcx],1
   140007439:	48 8b 05 40 74 00 00 	mov    rax,QWORD PTR [rip+0x7440]        # 0x14000e880
   140007440:	48 8b 90 48 02 00 00 	mov    rdx,QWORD PTR [rax+0x248]
   140007447:	48 8b 4a 08          	mov    rcx,QWORD PTR [rdx+0x8]
   14000744b:	48 83 39 01          	cmp    QWORD PTR [rcx],0x1
   14000744f:	73 df                	jae    0x140007430
   140007451:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140007454:	8b c3                	mov    eax,ebx
   140007456:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000745b:	48 83 c4 20          	add    rsp,0x20
   14000745f:	5f                   	pop    rdi
   140007460:	c3                   	ret
   140007461:	33 c0                	xor    eax,eax
   140007463:	48 83 c4 20          	add    rsp,0x20
   140007467:	5f                   	pop    rdi
   140007468:	c3                   	ret
   140007469:	cc                   	int3
   14000746a:	cc                   	int3
   14000746b:	cc                   	int3
   14000746c:	cc                   	int3
   14000746d:	cc                   	int3
   14000746e:	cc                   	int3
   14000746f:	cc                   	int3
   140007470:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140007475:	57                   	push   rdi
   140007476:	48 83 ec 20          	sub    rsp,0x20
   14000747a:	48 8b 05 ff 73 00 00 	mov    rax,QWORD PTR [rip+0x73ff]        # 0x14000e880
   140007481:	48 8b da             	mov    rbx,rdx
   140007484:	48 8b f9             	mov    rdi,rcx
   140007487:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   14000748e:	0f 85 24 01 00 00    	jne    0x1400075b8
   140007494:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140007497:	48 8b 0d e2 73 00 00 	mov    rcx,QWORD PTR [rip+0x73e2]        # 0x14000e880
   14000749e:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   1400074a2:	83 f8 18             	cmp    eax,0x18
   1400074a5:	7d 24                	jge    0x1400074cb
   1400074a7:	c7 44 81 30 51 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x51
   1400074ae:	00 
   1400074af:	48 8b 0d ca 73 00 00 	mov    rcx,QWORD PTR [rip+0x73ca]        # 0x14000e880
   1400074b6:	83 b9 08 03 00 00 00 	cmp    DWORD PTR [rcx+0x308],0x0
   1400074bd:	74 0c                	je     0x1400074cb
   1400074bf:	e8 3c ce ff ff       	call   0x140004300
   1400074c4:	48 8b 0d b5 73 00 00 	mov    rcx,QWORD PTR [rip+0x73b5]        # 0x14000e880
   1400074cb:	48 8b 89 58 01 00 00 	mov    rcx,QWORD PTR [rcx+0x158]
   1400074d2:	e8 29 d3 ff ff       	call   0x140004800
   1400074d7:	85 c0                	test   eax,eax
   1400074d9:	75 0d                	jne    0x1400074e8
   1400074db:	8d 48 14             	lea    ecx,[rax+0x14]
   1400074de:	e8 0d c7 ff ff       	call   0x140003bf0
   1400074e3:	e9 c6 00 00 00       	jmp    0x1400075ae
   1400074e8:	48 8b d3             	mov    rdx,rbx
   1400074eb:	48 8b cf             	mov    rcx,rdi
   1400074ee:	e8 9d af ff ff       	call   0x140002490
   1400074f3:	48 8b 05 86 73 00 00 	mov    rax,QWORD PTR [rip+0x7386]        # 0x14000e880
   1400074fa:	48 8b cb             	mov    rcx,rbx
   1400074fd:	48 8b 90 58 01 00 00 	mov    rdx,QWORD PTR [rax+0x158]
   140007504:	4c 8b c2             	mov    r8,rdx
   140007507:	e8 b4 e0 ff ff       	call   0x1400055c0
   14000750c:	48 8b cb             	mov    rcx,rbx
   14000750f:	e8 ec d2 ff ff       	call   0x140004800
   140007514:	85 c0                	test   eax,eax
   140007516:	79 19                	jns    0x140007531
   140007518:	48 8b 15 61 73 00 00 	mov    rdx,QWORD PTR [rip+0x7361]        # 0x14000e880
   14000751f:	4c 8b c3             	mov    r8,rbx
   140007522:	48 8b cb             	mov    rcx,rbx
   140007525:	48 8b 92 58 01 00 00 	mov    rdx,QWORD PTR [rdx+0x158]
   14000752c:	e8 9f f7 ff ff       	call   0x140006cd0
   140007531:	48 8b 05 48 73 00 00 	mov    rax,QWORD PTR [rip+0x7348]        # 0x14000e880
   140007538:	83 b8 6c 01 00 00 00 	cmp    DWORD PTR [rax+0x16c],0x0
   14000753f:	74 74                	je     0x1400075b5
   140007541:	c7 80 90 00 00 00 00 	mov    DWORD PTR [rax+0x90],0x0
   140007548:	00 00 00 
   14000754b:	48 8b cb             	mov    rcx,rbx
   14000754e:	4c 8b 05 2b 73 00 00 	mov    r8,QWORD PTR [rip+0x732b]        # 0x14000e880
   140007555:	49 8b 80 58 01 00 00 	mov    rax,QWORD PTR [r8+0x158]
   14000755c:	4d 8b 80 48 02 00 00 	mov    r8,QWORD PTR [r8+0x248]
   140007563:	8b 10                	mov    edx,DWORD PTR [rax]
   140007565:	e8 56 ca ff ff       	call   0x140003fc0
   14000756a:	48 8b 0d 0f 73 00 00 	mov    rcx,QWORD PTR [rip+0x730f]        # 0x14000e880
   140007571:	48 8b 91 58 01 00 00 	mov    rdx,QWORD PTR [rcx+0x158]
   140007578:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   14000757f:	4c 8b c2             	mov    r8,rdx
   140007582:	e8 39 e0 ff ff       	call   0x1400055c0
   140007587:	48 8b 05 f2 72 00 00 	mov    rax,QWORD PTR [rip+0x72f2]        # 0x14000e880
   14000758e:	48 8b d3             	mov    rdx,rbx
   140007591:	c7 80 90 00 00 00 01 	mov    DWORD PTR [rax+0x90],0x1
   140007598:	00 00 00 
   14000759b:	48 8b 0d de 72 00 00 	mov    rcx,QWORD PTR [rip+0x72de]        # 0x14000e880
   1400075a2:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   1400075a9:	e8 e2 ae ff ff       	call   0x140002490
   1400075ae:	48 8b 05 cb 72 00 00 	mov    rax,QWORD PTR [rip+0x72cb]        # 0x14000e880
   1400075b5:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400075b8:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400075bd:	48 83 c4 20          	add    rsp,0x20
   1400075c1:	5f                   	pop    rdi
   1400075c2:	c3                   	ret
   1400075c3:	cc                   	int3
   1400075c4:	cc                   	int3
   1400075c5:	cc                   	int3
   1400075c6:	cc                   	int3
   1400075c7:	cc                   	int3
   1400075c8:	cc                   	int3
   1400075c9:	cc                   	int3
   1400075ca:	cc                   	int3
   1400075cb:	cc                   	int3
   1400075cc:	cc                   	int3
   1400075cd:	cc                   	int3
   1400075ce:	cc                   	int3
   1400075cf:	cc                   	int3
   1400075d0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400075d5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   1400075da:	57                   	push   rdi
   1400075db:	48 83 ec 20          	sub    rsp,0x20
   1400075df:	49 8b f0             	mov    rsi,r8
   1400075e2:	48 8b da             	mov    rbx,rdx
   1400075e5:	48 8b f9             	mov    rdi,rcx
   1400075e8:	48 85 c9             	test   rcx,rcx
   1400075eb:	74 05                	je     0x1400075f2
   1400075ed:	83 39 00             	cmp    DWORD PTR [rcx],0x0
   1400075f0:	75 09                	jne    0x1400075fb
   1400075f2:	48 3b fe             	cmp    rdi,rsi
   1400075f5:	0f 84 ee 00 00 00    	je     0x1400076e9
   1400075fb:	48 85 db             	test   rbx,rbx
   1400075fe:	74 05                	je     0x140007605
   140007600:	83 3a 00             	cmp    DWORD PTR [rdx],0x0
   140007603:	75 12                	jne    0x140007617
   140007605:	48 3b de             	cmp    rbx,rsi
   140007608:	0f 84 db 00 00 00    	je     0x1400076e9
   14000760e:	48 85 db             	test   rbx,rbx
   140007611:	0f 84 ca 00 00 00    	je     0x1400076e1
   140007617:	48 85 ff             	test   rdi,rdi
   14000761a:	0f 84 c1 00 00 00    	je     0x1400076e1
   140007620:	83 39 00             	cmp    DWORD PTR [rcx],0x0
   140007623:	0f 84 b8 00 00 00    	je     0x1400076e1
   140007629:	83 3a 00             	cmp    DWORD PTR [rdx],0x0
   14000762c:	0f 84 af 00 00 00    	je     0x1400076e1
   140007632:	48 8b 05 47 72 00 00 	mov    rax,QWORD PTR [rip+0x7247]        # 0x14000e880
   140007639:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140007640:	0f 85 a3 00 00 00    	jne    0x1400076e9
   140007646:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140007649:	48 8b 0d 30 72 00 00 	mov    rcx,QWORD PTR [rip+0x7230]        # 0x14000e880
   140007650:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140007654:	83 f8 18             	cmp    eax,0x18
   140007657:	7d 24                	jge    0x14000767d
   140007659:	c7 44 81 30 53 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x53
   140007660:	00 
   140007661:	48 8b 0d 18 72 00 00 	mov    rcx,QWORD PTR [rip+0x7218]        # 0x14000e880
   140007668:	83 b9 08 03 00 00 00 	cmp    DWORD PTR [rcx+0x308],0x0
   14000766f:	74 0c                	je     0x14000767d
   140007671:	e8 8a cc ff ff       	call   0x140004300
   140007676:	48 8b 0d 03 72 00 00 	mov    rcx,QWORD PTR [rip+0x7203]        # 0x14000e880
   14000767d:	c7 81 90 00 00 00 00 	mov    DWORD PTR [rcx+0x90],0x0
   140007684:	00 00 00 
   140007687:	48 8b d3             	mov    rdx,rbx
   14000768a:	4c 8b 05 ef 71 00 00 	mov    r8,QWORD PTR [rip+0x71ef]        # 0x14000e880
   140007691:	48 8b cf             	mov    rcx,rdi
   140007694:	4d 8b 80 48 02 00 00 	mov    r8,QWORD PTR [r8+0x248]
   14000769b:	e8 10 ea ff ff       	call   0x1400060b0
   1400076a0:	48 8b 0d d9 71 00 00 	mov    rcx,QWORD PTR [rip+0x71d9]        # 0x14000e880
   1400076a7:	48 8b d6             	mov    rdx,rsi
   1400076aa:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   1400076b1:	e8 da 03 00 00       	call   0x140007a90
   1400076b6:	48 8b 05 c3 71 00 00 	mov    rax,QWORD PTR [rip+0x71c3]        # 0x14000e880
   1400076bd:	c7 80 90 00 00 00 01 	mov    DWORD PTR [rax+0x90],0x1
   1400076c4:	00 00 00 
   1400076c7:	48 8b 05 b2 71 00 00 	mov    rax,QWORD PTR [rip+0x71b2]        # 0x14000e880
   1400076ce:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400076d1:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400076d6:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   1400076db:	48 83 c4 20          	add    rsp,0x20
   1400076df:	5f                   	pop    rdi
   1400076e0:	c3                   	ret
   1400076e1:	48 8b ce             	mov    rcx,rsi
   1400076e4:	e8 57 d1 ff ff       	call   0x140004840
   1400076e9:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400076ee:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   1400076f3:	48 83 c4 20          	add    rsp,0x20
   1400076f7:	5f                   	pop    rdi
   1400076f8:	c3                   	ret
   1400076f9:	cc                   	int3
   1400076fa:	cc                   	int3
   1400076fb:	cc                   	int3
   1400076fc:	cc                   	int3
   1400076fd:	cc                   	int3
   1400076fe:	cc                   	int3
   1400076ff:	cc                   	int3
   140007700:	40 53                	rex push rbx
   140007702:	48 83 ec 20          	sub    rsp,0x20
   140007706:	48 8b d9             	mov    rbx,rcx
   140007709:	48 8b 0d 70 71 00 00 	mov    rcx,QWORD PTR [rip+0x7170]        # 0x14000e880
   140007710:	83 b9 f0 02 00 00 00 	cmp    DWORD PTR [rcx+0x2f0],0x0
   140007717:	0f 85 96 00 00 00    	jne    0x1400077b3
   14000771d:	48 8b 89 58 01 00 00 	mov    rcx,QWORD PTR [rcx+0x158]
   140007724:	e8 d7 d0 ff ff       	call   0x140004800
   140007729:	85 c0                	test   eax,eax
   14000772b:	74 2e                	je     0x14000775b
   14000772d:	48 8b 15 4c 71 00 00 	mov    rdx,QWORD PTR [rip+0x714c]        # 0x14000e880
   140007734:	48 8b cb             	mov    rcx,rbx
   140007737:	48 8b 92 58 01 00 00 	mov    rdx,QWORD PTR [rdx+0x158]
   14000773e:	e8 8d c7 ff ff       	call   0x140003ed0
   140007743:	85 c0                	test   eax,eax
   140007745:	75 14                	jne    0x14000775b
   140007747:	48 8b 05 32 71 00 00 	mov    rax,QWORD PTR [rip+0x7132]        # 0x14000e880
   14000774e:	48 8b 80 50 01 00 00 	mov    rax,QWORD PTR [rax+0x150]
   140007755:	48 83 c4 20          	add    rsp,0x20
   140007759:	5b                   	pop    rbx
   14000775a:	c3                   	ret
   14000775b:	48 8b 05 1e 71 00 00 	mov    rax,QWORD PTR [rip+0x711e]        # 0x14000e880
   140007762:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140007765:	48 8b 0d 14 71 00 00 	mov    rcx,QWORD PTR [rip+0x7114]        # 0x14000e880
   14000776c:	48 63 41 2c          	movsxd rax,DWORD PTR [rcx+0x2c]
   140007770:	83 f8 18             	cmp    eax,0x18
   140007773:	7d 1d                	jge    0x140007792
   140007775:	c7 44 81 30 50 00 00 	mov    DWORD PTR [rcx+rax*4+0x30],0x50
   14000777c:	00 
   14000777d:	48 8b 05 fc 70 00 00 	mov    rax,QWORD PTR [rip+0x70fc]        # 0x14000e880
   140007784:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   14000778b:	74 05                	je     0x140007792
   14000778d:	e8 6e cb ff ff       	call   0x140004300
   140007792:	48 8b cb             	mov    rcx,rbx
   140007795:	e8 66 d0 ff ff       	call   0x140004800
   14000779a:	83 f8 02             	cmp    eax,0x2
   14000779d:	7f 1c                	jg     0x1400077bb
   14000779f:	b9 13 00 00 00       	mov    ecx,0x13
   1400077a4:	e8 47 c4 ff ff       	call   0x140003bf0
   1400077a9:	48 8b 05 d0 70 00 00 	mov    rax,QWORD PTR [rip+0x70d0]        # 0x14000e880
   1400077b0:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400077b3:	33 c0                	xor    eax,eax
   1400077b5:	48 83 c4 20          	add    rsp,0x20
   1400077b9:	5b                   	pop    rbx
   1400077ba:	c3                   	ret
   1400077bb:	48 8b 0d be 70 00 00 	mov    rcx,QWORD PTR [rip+0x70be]        # 0x14000e880
   1400077c2:	48 89 7c 24 30       	mov    QWORD PTR [rsp+0x30],rdi
   1400077c7:	48 8b 89 78 02 00 00 	mov    rcx,QWORD PTR [rcx+0x278]
   1400077ce:	e8 6d d0 ff ff       	call   0x140004840
   1400077d3:	48 8b 0d a6 70 00 00 	mov    rcx,QWORD PTR [rip+0x70a6]        # 0x14000e880
   1400077da:	48 8b 89 c0 02 00 00 	mov    rcx,QWORD PTR [rcx+0x2c0]
   1400077e1:	e8 5a d0 ff ff       	call   0x140004840
   1400077e6:	ba 08 00 00 00       	mov    edx,0x8
   1400077eb:	48 8b cb             	mov    rcx,rbx
   1400077ee:	e8 cd f1 ff ff       	call   0x1400069c0
   1400077f3:	48 8b 0d 86 70 00 00 	mov    rcx,QWORD PTR [rip+0x7086]        # 0x14000e880
   1400077fa:	33 ff                	xor    edi,edi
   1400077fc:	89 81 b4 03 00 00    	mov    DWORD PTR [rcx+0x3b4],eax
   140007802:	83 f8 07             	cmp    eax,0x7
   140007805:	77 48                	ja     0x14000784f
   140007807:	48 8d 15 f2 87 ff ff 	lea    rdx,[rip+0xffffffffffff87f2]        # 0x140000000
   14000780e:	48 98                	cdqe
   140007810:	8b 8c 82 64 7a 00 00 	mov    ecx,DWORD PTR [rdx+rax*4+0x7a64]
   140007817:	48 03 ca             	add    rcx,rdx
   14000781a:	ff e1                	jmp    rcx
   14000781c:	48 8b 05 5d 70 00 00 	mov    rax,QWORD PTR [rip+0x705d]        # 0x14000e880
   140007823:	89 b8 ac 03 00 00    	mov    DWORD PTR [rax+0x3ac],edi
   140007829:	eb 24                	jmp    0x14000784f
   14000782b:	48 8b 05 4e 70 00 00 	mov    rax,QWORD PTR [rip+0x704e]        # 0x14000e880
   140007832:	c7 80 ac 03 00 00 fe 	mov    DWORD PTR [rax+0x3ac],0xfffffffe
   140007839:	ff ff ff 
   14000783c:	eb 11                	jmp    0x14000784f
   14000783e:	48 8b 05 3b 70 00 00 	mov    rax,QWORD PTR [rip+0x703b]        # 0x14000e880
   140007845:	c7 80 ac 03 00 00 ff 	mov    DWORD PTR [rax+0x3ac],0xffffffff
   14000784c:	ff ff ff 
   14000784f:	ba 09 00 00 00       	mov    edx,0x9
   140007854:	48 8b cb             	mov    rcx,rbx
   140007857:	e8 64 f1 ff ff       	call   0x1400069c0
   14000785c:	48 8b 0d 1d 70 00 00 	mov    rcx,QWORD PTR [rip+0x701d]        # 0x14000e880
   140007863:	89 81 b8 03 00 00    	mov    DWORD PTR [rcx+0x3b8],eax
   140007869:	48 8b 05 10 70 00 00 	mov    rax,QWORD PTR [rip+0x7010]        # 0x14000e880
   140007870:	89 b8 bc 03 00 00    	mov    DWORD PTR [rax+0x3bc],edi
   140007876:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140007878:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   14000787c:	ff c9                	dec    ecx
   14000787e:	48 8b 14 c8          	mov    rdx,QWORD PTR [rax+rcx*8]
   140007882:	48 c1 ea 3c          	shr    rdx,0x3c
   140007886:	80 fa 05             	cmp    dl,0x5
   140007889:	73 11                	jae    0x14000789c
   14000788b:	48 8b 05 ee 6f 00 00 	mov    rax,QWORD PTR [rip+0x6fee]        # 0x14000e880
   140007892:	c7 80 bc 03 00 00 01 	mov    DWORD PTR [rax+0x3bc],0x1
   140007899:	00 00 00 
   14000789c:	48 8b 05 dd 6f 00 00 	mov    rax,QWORD PTR [rip+0x6fdd]        # 0x14000e880
   1400078a3:	b9 01 00 00 00       	mov    ecx,0x1
   1400078a8:	c7 80 6c 01 00 00 01 	mov    DWORD PTR [rax+0x16c],0x1
   1400078af:	00 00 00 
   1400078b2:	48 8b 15 c7 6f 00 00 	mov    rdx,QWORD PTR [rip+0x6fc7]        # 0x14000e880
   1400078b9:	48 8b 92 d0 02 00 00 	mov    rdx,QWORD PTR [rdx+0x2d0]
   1400078c0:	e8 bb aa ff ff       	call   0x140002380
   1400078c5:	48 8b 05 b4 6f 00 00 	mov    rax,QWORD PTR [rip+0x6fb4]        # 0x14000e880
   1400078cc:	39 b8 6c 01 00 00    	cmp    DWORD PTR [rax+0x16c],edi
   1400078d2:	75 34                	jne    0x140007908
   1400078d4:	48 8b 90 58 01 00 00 	mov    rdx,QWORD PTR [rax+0x158]
   1400078db:	48 8b cb             	mov    rcx,rbx
   1400078de:	e8 ad ab ff ff       	call   0x140002490
   1400078e3:	48 8b 05 96 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f96]        # 0x14000e880
   1400078ea:	48 89 b8 50 01 00 00 	mov    QWORD PTR [rax+0x150],rdi
   1400078f1:	48 8b 05 88 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f88]        # 0x14000e880
   1400078f8:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
   1400078fd:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140007900:	33 c0                	xor    eax,eax
   140007902:	48 83 c4 20          	add    rsp,0x20
   140007906:	5b                   	pop    rbx
   140007907:	c3                   	ret
   140007908:	48 8b 80 78 02 00 00 	mov    rax,QWORD PTR [rax+0x278]
   14000790f:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   140007915:	48 8b 05 64 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f64]        # 0x14000e880
   14000791c:	48 8b 88 78 02 00 00 	mov    rcx,QWORD PTR [rax+0x278]
   140007923:	48 8b 41 08          	mov    rax,QWORD PTR [rcx+0x8]
   140007927:	48 89 38             	mov    QWORD PTR [rax],rdi
   14000792a:	48 8b 05 4f 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f4f]        # 0x14000e880
   140007931:	48 8b 88 78 02 00 00 	mov    rcx,QWORD PTR [rax+0x278]
   140007938:	48 8b 41 08          	mov    rax,QWORD PTR [rcx+0x8]
   14000793c:	48 c7 40 08 01 00 00 	mov    QWORD PTR [rax+0x8],0x1
   140007943:	00 
   140007944:	48 8b 05 35 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f35]        # 0x14000e880
   14000794b:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
   140007952:	c7 01 01 00 00 00    	mov    DWORD PTR [rcx],0x1
   140007958:	48 8b 05 21 6f 00 00 	mov    rax,QWORD PTR [rip+0x6f21]        # 0x14000e880
   14000795f:	4c 8b 43 08          	mov    r8,QWORD PTR [rbx+0x8]
   140007963:	48 8b 88 c0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2c0]
   14000796a:	49 8b 00             	mov    rax,QWORD PTR [r8]
   14000796d:	48 8b 51 08          	mov    rdx,QWORD PTR [rcx+0x8]
   140007971:	48 89 02             	mov    QWORD PTR [rdx],rax
   140007974:	48 8b 0d 05 6f 00 00 	mov    rcx,QWORD PTR [rip+0x6f05]        # 0x14000e880
   14000797b:	4c 8b 81 b8 02 00 00 	mov    r8,QWORD PTR [rcx+0x2b8]
   140007982:	48 8b 91 78 02 00 00 	mov    rdx,QWORD PTR [rcx+0x278]
   140007989:	48 8b 89 c0 02 00 00 	mov    rcx,QWORD PTR [rcx+0x2c0]
   140007990:	e8 ab 06 00 00       	call   0x140008040
   140007995:	83 f8 01             	cmp    eax,0x1
   140007998:	74 21                	je     0x1400079bb
   14000799a:	b9 13 00 00 00       	mov    ecx,0x13
   14000799f:	e8 4c c2 ff ff       	call   0x140003bf0
   1400079a4:	48 8b 05 d5 6e 00 00 	mov    rax,QWORD PTR [rip+0x6ed5]        # 0x14000e880
   1400079ab:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
   1400079b0:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400079b3:	33 c0                	xor    eax,eax
   1400079b5:	48 83 c4 20          	add    rsp,0x20
   1400079b9:	5b                   	pop    rbx
   1400079ba:	c3                   	ret
   1400079bb:	48 8b 15 be 6e 00 00 	mov    rdx,QWORD PTR [rip+0x6ebe]        # 0x14000e880
   1400079c2:	48 8b 82 b8 02 00 00 	mov    rax,QWORD PTR [rdx+0x2b8]
   1400079c9:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   1400079cd:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   1400079d0:	48 2b 01             	sub    rax,QWORD PTR [rcx]
   1400079d3:	48 8b cb             	mov    rcx,rbx
   1400079d6:	48 89 82 50 01 00 00 	mov    QWORD PTR [rdx+0x150],rax
   1400079dd:	48 8b 15 9c 6e 00 00 	mov    rdx,QWORD PTR [rip+0x6e9c]        # 0x14000e880
   1400079e4:	48 8b 92 58 01 00 00 	mov    rdx,QWORD PTR [rdx+0x158]
   1400079eb:	e8 a0 aa ff ff       	call   0x140002490
   1400079f0:	48 8b 05 89 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e89]        # 0x14000e880
   1400079f7:	89 b8 90 00 00 00    	mov    DWORD PTR [rax+0x90],edi
   1400079fd:	4c 8b 05 7c 6e 00 00 	mov    r8,QWORD PTR [rip+0x6e7c]        # 0x14000e880
   140007a04:	49 8b 88 58 01 00 00 	mov    rcx,QWORD PTR [r8+0x158]
   140007a0b:	4d 8b 80 60 01 00 00 	mov    r8,QWORD PTR [r8+0x160]
   140007a12:	8b 11                	mov    edx,DWORD PTR [rcx]
   140007a14:	e8 a7 c5 ff ff       	call   0x140003fc0
   140007a19:	48 8b 05 60 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e60]        # 0x14000e880
   140007a20:	c7 80 90 00 00 00 01 	mov    DWORD PTR [rax+0x90],0x1
   140007a27:	00 00 00 
   140007a2a:	48 8b 05 4f 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e4f]        # 0x14000e880
   140007a31:	48 8b 88 d0 02 00 00 	mov    rcx,QWORD PTR [rax+0x2d0]
   140007a38:	48 8b d1             	mov    rdx,rcx
   140007a3b:	e8 30 fa ff ff       	call   0x140007470
   140007a40:	48 8b 05 39 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e39]        # 0x14000e880
   140007a47:	48 8b 7c 24 30       	mov    rdi,QWORD PTR [rsp+0x30]
   140007a4c:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140007a4f:	48 8b 05 2a 6e 00 00 	mov    rax,QWORD PTR [rip+0x6e2a]        # 0x14000e880
   140007a56:	48 8b 80 50 01 00 00 	mov    rax,QWORD PTR [rax+0x150]
   140007a5d:	48 83 c4 20          	add    rsp,0x20
   140007a61:	5b                   	pop    rbx
   140007a62:	c3                   	ret
   140007a63:	90                   	nop
   140007a64:	1c 78                	sbb    al,0x78
   140007a66:	00 00                	add    BYTE PTR [rax],al
   140007a68:	1c 78                	sbb    al,0x78
   140007a6a:	00 00                	add    BYTE PTR [rax],al
   140007a6c:	1c 78                	sbb    al,0x78
   140007a6e:	00 00                	add    BYTE PTR [rax],al
   140007a70:	3e 78 00             	ds js  0x140007a73
   140007a73:	00 1c 78             	add    BYTE PTR [rax+rdi*2],bl
   140007a76:	00 00                	add    BYTE PTR [rax],al
   140007a78:	2b 78 00             	sub    edi,DWORD PTR [rax+0x0]
   140007a7b:	00 1c 78             	add    BYTE PTR [rax+rdi*2],bl
   140007a7e:	00 00                	add    BYTE PTR [rax],al
   140007a80:	3e 78 00             	ds js  0x140007a83
   140007a83:	00 cc                	add    ah,cl
   140007a85:	cc                   	int3
   140007a86:	cc                   	int3
   140007a87:	cc                   	int3
   140007a88:	cc                   	int3
   140007a89:	cc                   	int3
   140007a8a:	cc                   	int3
   140007a8b:	cc                   	int3
   140007a8c:	cc                   	int3
   140007a8d:	cc                   	int3
   140007a8e:	cc                   	int3
   140007a8f:	cc                   	int3
   140007a90:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   140007a95:	56                   	push   rsi
   140007a96:	57                   	push   rdi
   140007a97:	48 83 ec 78          	sub    rsp,0x78
   140007a9b:	48 8b 05 de 6d 00 00 	mov    rax,QWORD PTR [rip+0x6dde]        # 0x14000e880
   140007aa2:	48 8b f2             	mov    rsi,rdx
   140007aa5:	48 8b f9             	mov    rdi,rcx
   140007aa8:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   140007aaf:	0f 85 22 03 00 00    	jne    0x140007dd7
   140007ab5:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140007ab8:	4c 8b 05 c1 6d 00 00 	mov    r8,QWORD PTR [rip+0x6dc1]        # 0x14000e880
   140007abf:	48 89 9c 24 90 00 00 	mov    QWORD PTR [rsp+0x90],rbx
   140007ac6:	00 
   140007ac7:	4c 89 6c 24 60       	mov    QWORD PTR [rsp+0x60],r13
   140007acc:	49 63 40 2c          	movsxd rax,DWORD PTR [r8+0x2c]
   140007ad0:	83 f8 18             	cmp    eax,0x18
   140007ad3:	7d 26                	jge    0x140007afb
   140007ad5:	41 c7 44 80 30 52 00 	mov    DWORD PTR [r8+rax*4+0x30],0x52
   140007adc:	00 00 
   140007ade:	4c 8b 05 9b 6d 00 00 	mov    r8,QWORD PTR [rip+0x6d9b]        # 0x14000e880
   140007ae5:	41 83 b8 08 03 00 00 	cmp    DWORD PTR [r8+0x308],0x0
   140007aec:	00 
   140007aed:	74 0c                	je     0x140007afb
   140007aef:	e8 0c c8 ff ff       	call   0x140004300
   140007af4:	4c 8b 05 85 6d 00 00 	mov    r8,QWORD PTR [rip+0x6d85]        # 0x14000e880
   140007afb:	49 8b 98 48 02 00 00 	mov    rbx,QWORD PTR [r8+0x248]
   140007b02:	48 8b cf             	mov    rcx,rdi
   140007b05:	49 8b 80 50 01 00 00 	mov    rax,QWORD PTR [r8+0x150]
   140007b0c:	48 8b d3             	mov    rdx,rbx
   140007b0f:	4d 8b a8 58 01 00 00 	mov    r13,QWORD PTR [r8+0x158]
   140007b16:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140007b1b:	e8 70 a9 ff ff       	call   0x140002490
   140007b20:	4c 8b 05 59 6d 00 00 	mov    r8,QWORD PTR [rip+0x6d59]        # 0x14000e880
   140007b27:	41 83 b8 6c 01 00 00 	cmp    DWORD PTR [r8+0x16c],0x0
   140007b2e:	00 
   140007b2f:	75 13                	jne    0x140007b44
   140007b31:	4d 8b c5             	mov    r8,r13
   140007b34:	49 8b d5             	mov    rdx,r13
   140007b37:	48 8b cb             	mov    rcx,rbx
   140007b3a:	e8 81 da ff ff       	call   0x1400055c0
   140007b3f:	e9 71 02 00 00       	jmp    0x140007db5
   140007b44:	49 63 55 00          	movsxd rdx,DWORD PTR [r13+0x0]
   140007b48:	48 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],rbp
   140007b4d:	4c 89 64 24 68       	mov    QWORD PTR [rsp+0x68],r12
   140007b52:	4c 89 74 24 58       	mov    QWORD PTR [rsp+0x58],r14
   140007b57:	4c 8b f2             	mov    r14,rdx
   140007b5a:	4c 89 7c 24 50       	mov    QWORD PTR [rsp+0x50],r15
   140007b5f:	45 33 ff             	xor    r15d,r15d
   140007b62:	4d 39 38             	cmp    QWORD PTR [r8],r15
   140007b65:	0f 85 dd 00 00 00    	jne    0x140007c48
   140007b6b:	85 d2                	test   edx,edx
   140007b6d:	0f 8e e7 01 00 00    	jle    0x140007d5a
   140007b73:	33 ff                	xor    edi,edi
   140007b75:	4c 8d 14 d5 00 00 00 	lea    r10,[rdx*8+0x0]
   140007b7c:	00 
   140007b7d:	48 8b c2             	mov    rax,rdx
   140007b80:	48 8b f2             	mov    rsi,rdx
   140007b83:	48 f7 d8             	neg    rax
   140007b86:	8d 6f 01             	lea    ebp,[rdi+0x1]
   140007b89:	4c 8d 24 c5 00 00 00 	lea    r12,[rax*8+0x0]
   140007b90:	00 
   140007b91:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140007b95:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   140007b9c:	00 00 00 00 
   140007ba0:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140007ba4:	4f 8d 0c 14          	lea    r9,[r12+r10*1]
   140007ba8:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140007bad:	4d 8b de             	mov    r11,r14
   140007bb0:	49 0f af 14 01       	imul   rdx,QWORD PTR [r9+rax*1]
   140007bb5:	45 33 c0             	xor    r8d,r8d
   140007bb8:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
   140007bbd:	0f 1f 00             	nop    DWORD PTR [rax]
   140007bc0:	49 8b 45 08          	mov    rax,QWORD PTR [r13+0x8]
   140007bc4:	4a 8d 0c 0f          	lea    rcx,[rdi+r9*1]
   140007bc8:	4d 8d 49 08          	lea    r9,[r9+0x8]
   140007bcc:	48 8b 04 01          	mov    rax,QWORD PTR [rcx+rax*1]
   140007bd0:	48 f7 e2             	mul    rdx
   140007bd3:	49 03 c0             	add    rax,r8
   140007bd6:	49 3b c0             	cmp    rax,r8
   140007bd9:	4c 8b c2             	mov    r8,rdx
   140007bdc:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   140007be0:	49 83 d0 00          	adc    r8,0x0
   140007be4:	4a 03 44 0a f8       	add    rax,QWORD PTR [rdx+r9*1-0x8]
   140007be9:	4a 3b 44 0a f8       	cmp    rax,QWORD PTR [rdx+r9*1-0x8]
   140007bee:	4a 89 44 0a f8       	mov    QWORD PTR [rdx+r9*1-0x8],rax
   140007bf3:	49 83 d0 00          	adc    r8,0x0
   140007bf7:	4c 2b dd             	sub    r11,rbp
   140007bfa:	74 07                	je     0x140007c03
   140007bfc:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   140007c01:	eb bd                	jmp    0x140007bc0
   140007c03:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140007c07:	4d 01 3c 02          	add    QWORD PTR [r10+rax*1],r15
   140007c0b:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140007c0f:	4a 8b 14 11          	mov    rdx,QWORD PTR [rcx+r10*1]
   140007c13:	4a 8d 04 02          	lea    rax,[rdx+r8*1]
   140007c17:	4a 89 04 11          	mov    QWORD PTR [rcx+r10*1],rax
   140007c1b:	33 c0                	xor    eax,eax
   140007c1d:	49 3b d7             	cmp    rdx,r15
   140007c20:	0f 92 c0             	setb   al
   140007c23:	4c 8b f8             	mov    r15,rax
   140007c26:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140007c2a:	4d 39 04 02          	cmp    QWORD PTR [r10+rax*1],r8
   140007c2e:	4c 0f 42 fd          	cmovb  r15,rbp
   140007c32:	49 83 c2 08          	add    r10,0x8
   140007c36:	48 83 ef 08          	sub    rdi,0x8
   140007c3a:	48 2b f5             	sub    rsi,rbp
   140007c3d:	0f 85 5d ff ff ff    	jne    0x140007ba0
   140007c43:	e9 07 01 00 00       	jmp    0x140007d4f
   140007c48:	33 f6                	xor    esi,esi
   140007c4a:	89 b4 24 a0 00 00 00 	mov    DWORD PTR [rsp+0xa0],esi
   140007c51:	85 d2                	test   edx,edx
   140007c53:	0f 8e f9 00 00 00    	jle    0x140007d52
   140007c59:	49 8b c6             	mov    rax,r14
   140007c5c:	4c 89 74 24 40       	mov    QWORD PTR [rsp+0x40],r14
   140007c61:	48 f7 d8             	neg    rax
   140007c64:	48 8d 2c d5 00 00 00 	lea    rbp,[rdx*8+0x0]
   140007c6b:	00 
   140007c6c:	48 8d 04 c5 00 00 00 	lea    rax,[rax*8+0x0]
   140007c73:	00 
   140007c74:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140007c79:	0f 1f 80 00 00 00 00 	nop    DWORD PTR [rax+0x0]
   140007c80:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140007c84:	4c 8d 24 28          	lea    r12,[rax+rbp*1]
   140007c88:	4d 8b 08             	mov    r9,QWORD PTR [r8]
   140007c8b:	48 8d 44 24 30       	lea    rax,[rsp+0x30]
   140007c90:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140007c95:	45 33 c0             	xor    r8d,r8d
   140007c98:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140007c9d:	4a 8b 0c 21          	mov    rcx,QWORD PTR [rcx+r12*1]
   140007ca1:	e8 3a 01 00 00       	call   0x140007de0
   140007ca6:	45 33 c0             	xor    r8d,r8d
   140007ca9:	33 ff                	xor    edi,edi
   140007cab:	0f 1f 44 00 00       	nop    DWORD PTR [rax+rax*1+0x0]
   140007cb0:	48 8b 53 08          	mov    rdx,QWORD PTR [rbx+0x8]
   140007cb4:	49 8b 4d 08          	mov    rcx,QWORD PTR [r13+0x8]
   140007cb8:	48 63 c6             	movsxd rax,esi
   140007cbb:	48 8b 0c f9          	mov    rcx,QWORD PTR [rcx+rdi*8]
   140007cbf:	4c 8d 0c c2          	lea    r9,[rdx+rax*8]
   140007cc3:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   140007cc8:	48 8d 04 fa          	lea    rax,[rdx+rdi*8]
   140007ccc:	4c 8b 0d ad 6b 00 00 	mov    r9,QWORD PTR [rip+0x6bad]        # 0x14000e880
   140007cd3:	4e 03 04 20          	add    r8,QWORD PTR [rax+r12*1]
   140007cd7:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   140007cdc:	4d 8b 09             	mov    r9,QWORD PTR [r9]
   140007cdf:	e8 fc 00 00 00       	call   0x140007de0
   140007ce4:	ff c6                	inc    esi
   140007ce6:	48 ff c7             	inc    rdi
   140007ce9:	4c 8b c0             	mov    r8,rax
   140007cec:	49 3b fe             	cmp    rdi,r14
   140007cef:	7c bf                	jl     0x140007cb0
   140007cf1:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140007cf5:	49 03 c7             	add    rax,r15
   140007cf8:	45 33 ff             	xor    r15d,r15d
   140007cfb:	48 01 04 29          	add    QWORD PTR [rcx+rbp*1],rax
   140007cff:	48 8b 4b 08          	mov    rcx,QWORD PTR [rbx+0x8]
   140007d03:	4c 8b 05 76 6b 00 00 	mov    r8,QWORD PTR [rip+0x6b76]        # 0x14000e880
   140007d0a:	48 8b 04 29          	mov    rax,QWORD PTR [rcx+rbp*1]
   140007d0e:	49 8b 10             	mov    rdx,QWORD PTR [r8]
   140007d11:	48 3b c2             	cmp    rax,rdx
   140007d14:	72 14                	jb     0x140007d2a
   140007d16:	48 2b c2             	sub    rax,rdx
   140007d19:	41 bf 01 00 00 00    	mov    r15d,0x1
   140007d1f:	48 89 04 29          	mov    QWORD PTR [rcx+rbp*1],rax
   140007d23:	4c 8b 05 56 6b 00 00 	mov    r8,QWORD PTR [rip+0x6b56]        # 0x14000e880
   140007d2a:	8b b4 24 a0 00 00 00 	mov    esi,DWORD PTR [rsp+0xa0]
   140007d31:	48 83 c5 08          	add    rbp,0x8
   140007d35:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   140007d3a:	ff c6                	inc    esi
   140007d3c:	48 83 6c 24 40 01    	sub    QWORD PTR [rsp+0x40],0x1
   140007d42:	89 b4 24 a0 00 00 00 	mov    DWORD PTR [rsp+0xa0],esi
   140007d49:	0f 85 31 ff ff ff    	jne    0x140007c80
   140007d4f:	41 8b d6             	mov    edx,r14d
   140007d52:	48 8b b4 24 98 00 00 	mov    rsi,QWORD PTR [rsp+0x98]
   140007d59:	00 
   140007d5a:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140007d5e:	44 8d 04 12          	lea    r8d,[rdx+rdx*1]
   140007d62:	49 63 c8             	movsxd rcx,r8d
   140007d65:	f7 da                	neg    edx
   140007d67:	4c 89 3c c8          	mov    QWORD PTR [rax+rcx*8],r15
   140007d6b:	41 8d 40 01          	lea    eax,[r8+0x1]
   140007d6f:	4c 8b c3             	mov    r8,rbx
   140007d72:	89 03                	mov    DWORD PTR [rbx],eax
   140007d74:	48 8b cb             	mov    rcx,rbx
   140007d77:	e8 44 c2 ff ff       	call   0x140003fc0
   140007d7c:	48 8b cb             	mov    rcx,rbx
   140007d7f:	e8 dc c1 ff ff       	call   0x140003f60
   140007d84:	49 8b d5             	mov    rdx,r13
   140007d87:	48 8b cb             	mov    rcx,rbx
   140007d8a:	e8 41 c1 ff ff       	call   0x140003ed0
   140007d8f:	4c 8b 7c 24 50       	mov    r15,QWORD PTR [rsp+0x50]
   140007d94:	4c 8b 74 24 58       	mov    r14,QWORD PTR [rsp+0x58]
   140007d99:	4c 8b 64 24 68       	mov    r12,QWORD PTR [rsp+0x68]
   140007d9e:	48 8b 6c 24 70       	mov    rbp,QWORD PTR [rsp+0x70]
   140007da3:	85 c0                	test   eax,eax
   140007da5:	78 0e                	js     0x140007db5
   140007da7:	4c 8b c3             	mov    r8,rbx
   140007daa:	49 8b d5             	mov    rdx,r13
   140007dad:	48 8b cb             	mov    rcx,rbx
   140007db0:	e8 0b f2 ff ff       	call   0x140006fc0
   140007db5:	48 8b d6             	mov    rdx,rsi
   140007db8:	48 8b cb             	mov    rcx,rbx
   140007dbb:	e8 d0 a6 ff ff       	call   0x140002490
   140007dc0:	48 8b 05 b9 6a 00 00 	mov    rax,QWORD PTR [rip+0x6ab9]        # 0x14000e880
   140007dc7:	48 8b 9c 24 90 00 00 	mov    rbx,QWORD PTR [rsp+0x90]
   140007dce:	00 
   140007dcf:	4c 8b 6c 24 60       	mov    r13,QWORD PTR [rsp+0x60]
   140007dd4:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   140007dd7:	48 83 c4 78          	add    rsp,0x78
   140007ddb:	5f                   	pop    rdi
   140007ddc:	5e                   	pop    rsi
   140007ddd:	c3                   	ret
   140007dde:	cc                   	int3
   140007ddf:	cc                   	int3
   140007de0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140007de5:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   140007dea:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   140007def:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140007df4:	4d 8b d8             	mov    r11,r8
   140007df7:	49 8b f9             	mov    rdi,r9
   140007dfa:	45 33 c0             	xor    r8d,r8d
   140007dfd:	48 8b f2             	mov    rsi,rdx
   140007e00:	4d 8b d1             	mov    r10,r9
   140007e03:	48 8b d9             	mov    rbx,rcx
   140007e06:	41 8b d0             	mov    edx,r8d
   140007e09:	48 2b f9             	sub    rdi,rcx
   140007e0c:	41 8d 68 10          	lea    ebp,[r8+0x10]
   140007e10:	4d 85 db             	test   r11,r11
   140007e13:	4c 8d 0c 12          	lea    r9,[rdx+rdx*1]
   140007e17:	49 8d 41 01          	lea    rax,[r9+0x1]
   140007e1b:	49 0f 49 c1          	cmovns rax,r9
   140007e1f:	4d 03 db             	add    r11,r11
   140007e22:	4d 03 c0             	add    r8,r8
   140007e25:	48 85 f6             	test   rsi,rsi
   140007e28:	79 10                	jns    0x140007e3a
   140007e2a:	49 3b c2             	cmp    rax,r10
   140007e2d:	72 08                	jb     0x140007e37
   140007e2f:	48 2b c7             	sub    rax,rdi
   140007e32:	49 ff c0             	inc    r8
   140007e35:	eb 03                	jmp    0x140007e3a
   140007e37:	48 03 c3             	add    rax,rbx
   140007e3a:	48 8b c8             	mov    rcx,rax
   140007e3d:	49 2b ca             	sub    rcx,r10
   140007e40:	49 3b c2             	cmp    rax,r10
   140007e43:	48 0f 42 c8          	cmovb  rcx,rax
   140007e47:	48 03 c9             	add    rcx,rcx
   140007e4a:	4d 85 db             	test   r11,r11
   140007e4d:	48 8d 51 01          	lea    rdx,[rcx+0x1]
   140007e51:	48 0f 49 d1          	cmovns rdx,rcx
   140007e55:	4d 03 db             	add    r11,r11
   140007e58:	49 3b c2             	cmp    rax,r10
   140007e5b:	49 8d 48 01          	lea    rcx,[r8+0x1]
   140007e5f:	49 0f 42 c8          	cmovb  rcx,r8
   140007e63:	48 03 c9             	add    rcx,rcx
   140007e66:	48 03 f6             	add    rsi,rsi
   140007e69:	79 10                	jns    0x140007e7b
   140007e6b:	49 3b d2             	cmp    rdx,r10
   140007e6e:	72 08                	jb     0x140007e78
   140007e70:	48 2b d7             	sub    rdx,rdi
   140007e73:	48 ff c1             	inc    rcx
   140007e76:	eb 03                	jmp    0x140007e7b
   140007e78:	48 03 d3             	add    rdx,rbx
   140007e7b:	48 8b c2             	mov    rax,rdx
   140007e7e:	49 2b c2             	sub    rax,r10
   140007e81:	49 3b d2             	cmp    rdx,r10
   140007e84:	48 0f 42 c2          	cmovb  rax,rdx
   140007e88:	48 03 c0             	add    rax,rax
   140007e8b:	4d 85 db             	test   r11,r11
   140007e8e:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140007e92:	4c 0f 49 c0          	cmovns r8,rax
   140007e96:	4d 03 db             	add    r11,r11
   140007e99:	49 3b d2             	cmp    rdx,r10
   140007e9c:	48 8d 41 01          	lea    rax,[rcx+0x1]
   140007ea0:	48 0f 42 c1          	cmovb  rax,rcx
   140007ea4:	48 03 f6             	add    rsi,rsi
   140007ea7:	48 8d 14 00          	lea    rdx,[rax+rax*1]
   140007eab:	79 10                	jns    0x140007ebd
   140007ead:	4d 3b c2             	cmp    r8,r10
   140007eb0:	72 08                	jb     0x140007eba
   140007eb2:	4c 2b c7             	sub    r8,rdi
   140007eb5:	48 ff c2             	inc    rdx
   140007eb8:	eb 03                	jmp    0x140007ebd
   140007eba:	4c 03 c3             	add    r8,rbx
   140007ebd:	49 8b c0             	mov    rax,r8
   140007ec0:	49 2b c2             	sub    rax,r10
   140007ec3:	4d 3b c2             	cmp    r8,r10
   140007ec6:	49 0f 42 c0          	cmovb  rax,r8
   140007eca:	48 03 c0             	add    rax,rax
   140007ecd:	4d 85 db             	test   r11,r11
   140007ed0:	48 8d 48 01          	lea    rcx,[rax+0x1]
   140007ed4:	48 0f 49 c8          	cmovns rcx,rax
   140007ed8:	4d 03 db             	add    r11,r11
   140007edb:	4d 3b c2             	cmp    r8,r10
   140007ede:	48 8d 42 01          	lea    rax,[rdx+0x1]
   140007ee2:	48 0f 42 c2          	cmovb  rax,rdx
   140007ee6:	48 03 c0             	add    rax,rax
   140007ee9:	48 03 f6             	add    rsi,rsi
   140007eec:	79 10                	jns    0x140007efe
   140007eee:	49 3b ca             	cmp    rcx,r10
   140007ef1:	72 08                	jb     0x140007efb
   140007ef3:	48 2b cf             	sub    rcx,rdi
   140007ef6:	48 ff c0             	inc    rax
   140007ef9:	eb 03                	jmp    0x140007efe
   140007efb:	48 03 cb             	add    rcx,rbx
   140007efe:	48 8b d1             	mov    rdx,rcx
   140007f01:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140007f05:	49 2b d2             	sub    rdx,r10
   140007f08:	49 3b ca             	cmp    rcx,r10
   140007f0b:	48 0f 42 d1          	cmovb  rdx,rcx
   140007f0f:	4c 0f 42 c0          	cmovb  r8,rax
   140007f13:	48 03 f6             	add    rsi,rsi
   140007f16:	ff cd                	dec    ebp
   140007f18:	85 ed                	test   ebp,ebp
   140007f1a:	0f 8f f0 fe ff ff    	jg     0x140007e10
   140007f20:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140007f25:	49 8b c0             	mov    rax,r8
   140007f28:	48 8b 5c 24 08       	mov    rbx,QWORD PTR [rsp+0x8]
   140007f2d:	48 8b 6c 24 10       	mov    rbp,QWORD PTR [rsp+0x10]
   140007f32:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
   140007f37:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
   140007f3c:	48 89 11             	mov    QWORD PTR [rcx],rdx
   140007f3f:	c3                   	ret
   140007f40:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140007f45:	48 89 6c 24 10       	mov    QWORD PTR [rsp+0x10],rbp
   140007f4a:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   140007f4f:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   140007f54:	33 c0                	xor    eax,eax
   140007f56:	49 8b f8             	mov    rdi,r8
   140007f59:	48 8b f2             	mov    rsi,rdx
   140007f5c:	4c 8b d9             	mov    r11,rcx
   140007f5f:	8d 68 10             	lea    ebp,[rax+0x10]
   140007f62:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
   140007f66:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   140007f6d:	00 00 00 
   140007f70:	4f 8d 14 1b          	lea    r10,[r11+r11*1]
   140007f74:	48 85 f6             	test   rsi,rsi
   140007f77:	49 8d 5a 01          	lea    rbx,[r10+0x1]
   140007f7b:	49 0f 49 da          	cmovns rbx,r10
   140007f7f:	48 03 f6             	add    rsi,rsi
   140007f82:	48 03 c0             	add    rax,rax
   140007f85:	49 c1 eb 3f          	shr    r11,0x3f
   140007f89:	45 84 db             	test   r11b,r11b
   140007f8c:	75 05                	jne    0x140007f93
   140007f8e:	48 3b df             	cmp    rbx,rdi
   140007f91:	72 06                	jb     0x140007f99
   140007f93:	48 2b df             	sub    rbx,rdi
   140007f96:	48 ff c0             	inc    rax
   140007f99:	48 8d 0c 1b          	lea    rcx,[rbx+rbx*1]
   140007f9d:	48 85 f6             	test   rsi,rsi
   140007fa0:	48 8d 51 01          	lea    rdx,[rcx+0x1]
   140007fa4:	48 0f 49 d1          	cmovns rdx,rcx
   140007fa8:	48 03 f6             	add    rsi,rsi
   140007fab:	48 03 c0             	add    rax,rax
   140007fae:	48 c1 eb 3f          	shr    rbx,0x3f
   140007fb2:	84 db                	test   bl,bl
   140007fb4:	75 05                	jne    0x140007fbb
   140007fb6:	48 3b d7             	cmp    rdx,rdi
   140007fb9:	72 06                	jb     0x140007fc1
   140007fbb:	48 2b d7             	sub    rdx,rdi
   140007fbe:	48 ff c0             	inc    rax
   140007fc1:	48 8d 0c 12          	lea    rcx,[rdx+rdx*1]
   140007fc5:	48 85 f6             	test   rsi,rsi
   140007fc8:	4c 8d 41 01          	lea    r8,[rcx+0x1]
   140007fcc:	4c 0f 49 c1          	cmovns r8,rcx
   140007fd0:	48 03 f6             	add    rsi,rsi
   140007fd3:	48 03 c0             	add    rax,rax
   140007fd6:	48 c1 ea 3f          	shr    rdx,0x3f
   140007fda:	84 d2                	test   dl,dl
   140007fdc:	75 05                	jne    0x140007fe3
   140007fde:	4c 3b c7             	cmp    r8,rdi
   140007fe1:	72 06                	jb     0x140007fe9
   140007fe3:	4c 2b c7             	sub    r8,rdi
   140007fe6:	48 ff c0             	inc    rax
   140007fe9:	4b 8d 0c 00          	lea    rcx,[r8+r8*1]
   140007fed:	48 85 f6             	test   rsi,rsi
   140007ff0:	4c 8d 59 01          	lea    r11,[rcx+0x1]
   140007ff4:	4c 0f 49 d9          	cmovns r11,rcx
   140007ff8:	48 03 f6             	add    rsi,rsi
   140007ffb:	48 03 c0             	add    rax,rax
   140007ffe:	49 c1 e8 3f          	shr    r8,0x3f
   140008002:	45 84 c0             	test   r8b,r8b
   140008005:	75 05                	jne    0x14000800c
   140008007:	4c 3b df             	cmp    r11,rdi
   14000800a:	72 06                	jb     0x140008012
   14000800c:	4c 2b df             	sub    r11,rdi
   14000800f:	48 ff c0             	inc    rax
   140008012:	ff cd                	dec    ebp
   140008014:	85 ed                	test   ebp,ebp
   140008016:	0f 8f 54 ff ff ff    	jg     0x140007f70
   14000801c:	48 8b 5c 24 08       	mov    rbx,QWORD PTR [rsp+0x8]
   140008021:	48 8b 6c 24 10       	mov    rbp,QWORD PTR [rsp+0x10]
   140008026:	48 8b 74 24 18       	mov    rsi,QWORD PTR [rsp+0x18]
   14000802b:	48 8b 7c 24 20       	mov    rdi,QWORD PTR [rsp+0x20]
   140008030:	4d 89 19             	mov    QWORD PTR [r9],r11
   140008033:	c3                   	ret
   140008034:	cc                   	int3
   140008035:	cc                   	int3
   140008036:	cc                   	int3
   140008037:	cc                   	int3
   140008038:	cc                   	int3
   140008039:	cc                   	int3
   14000803a:	cc                   	int3
   14000803b:	cc                   	int3
   14000803c:	cc                   	int3
   14000803d:	cc                   	int3
   14000803e:	cc                   	int3
   14000803f:	cc                   	int3
   140008040:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140008045:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   14000804a:	57                   	push   rdi
   14000804b:	48 83 ec 30          	sub    rsp,0x30
   14000804f:	48 8b 05 2a 68 00 00 	mov    rax,QWORD PTR [rip+0x682a]        # 0x14000e880
   140008056:	49 8b d8             	mov    rbx,r8
   140008059:	48 8b fa             	mov    rdi,rdx
   14000805c:	48 8b f1             	mov    rsi,rcx
   14000805f:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140008062:	4c 8b 0d 17 68 00 00 	mov    r9,QWORD PTR [rip+0x6817]        # 0x14000e880
   140008069:	49 63 41 2c          	movsxd rax,DWORD PTR [r9+0x2c]
   14000806d:	83 f8 18             	cmp    eax,0x18
   140008070:	7d 1e                	jge    0x140008090
   140008072:	41 c7 44 81 30 d5 00 	mov    DWORD PTR [r9+rax*4+0x30],0xd5
   140008079:	00 00 
   14000807b:	48 8b 05 fe 67 00 00 	mov    rax,QWORD PTR [rip+0x67fe]        # 0x14000e880
   140008082:	83 b8 08 03 00 00 00 	cmp    DWORD PTR [rax+0x308],0x0
   140008089:	74 05                	je     0x140008090
   14000808b:	e8 70 c2 ff ff       	call   0x140004300
   140008090:	4c 8b cb             	mov    r9,rbx
   140008093:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140008098:	4c 8b c3             	mov    r8,rbx
   14000809b:	48 8b d7             	mov    rdx,rdi
   14000809e:	48 8b ce             	mov    rcx,rsi
   1400080a1:	e8 1a 00 00 00       	call   0x1400080c0
   1400080a6:	48 8b 0d d3 67 00 00 	mov    rcx,QWORD PTR [rip+0x67d3]        # 0x14000e880
   1400080ad:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   1400080b2:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   1400080b7:	ff 49 2c             	dec    DWORD PTR [rcx+0x2c]
   1400080ba:	48 83 c4 30          	add    rsp,0x30
   1400080be:	5f                   	pop    rdi
   1400080bf:	c3                   	ret
   1400080c0:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   1400080c5:	4c 89 44 24 18       	mov    QWORD PTR [rsp+0x18],r8
   1400080ca:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   1400080cf:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   1400080d4:	53                   	push   rbx
   1400080d5:	56                   	push   rsi
   1400080d6:	57                   	push   rdi
   1400080d7:	41 54                	push   r12
   1400080d9:	41 55                	push   r13
   1400080db:	48 83 ec 70          	sub    rsp,0x70
   1400080df:	48 8b 05 9a 67 00 00 	mov    rax,QWORD PTR [rip+0x679a]        # 0x14000e880
   1400080e6:	4d 8b e9             	mov    r13,r9
   1400080e9:	49 8b d8             	mov    rbx,r8
   1400080ec:	48 8b fa             	mov    rdi,rdx
   1400080ef:	48 8b f1             	mov    rsi,rcx
   1400080f2:	41 bc 01 00 00 00    	mov    r12d,0x1
   1400080f8:	83 b8 f0 02 00 00 00 	cmp    DWORD PTR [rax+0x2f0],0x0
   1400080ff:	74 0e                	je     0x14000810f
   140008101:	33 c0                	xor    eax,eax
   140008103:	48 83 c4 70          	add    rsp,0x70
   140008107:	41 5d                	pop    r13
   140008109:	41 5c                	pop    r12
   14000810b:	5f                   	pop    rdi
   14000810c:	5e                   	pop    rsi
   14000810d:	5b                   	pop    rbx
   14000810e:	c3                   	ret
   14000810f:	ff 40 2c             	inc    DWORD PTR [rax+0x2c]
   140008112:	48 8b 15 67 67 00 00 	mov    rdx,QWORD PTR [rip+0x6767]        # 0x14000e880
   140008119:	48 89 6c 24 68       	mov    QWORD PTR [rsp+0x68],rbp
   14000811e:	4c 89 74 24 60       	mov    QWORD PTR [rsp+0x60],r14
   140008123:	4c 89 7c 24 58       	mov    QWORD PTR [rsp+0x58],r15
   140008128:	48 63 42 2c          	movsxd rax,DWORD PTR [rdx+0x2c]
   14000812c:	83 f8 18             	cmp    eax,0x18
   14000812f:	7d 24                	jge    0x140008155
   140008131:	c7 44 82 30 1e 00 00 	mov    DWORD PTR [rdx+rax*4+0x30],0x1e
   140008138:	00 
   140008139:	48 8b 15 40 67 00 00 	mov    rdx,QWORD PTR [rip+0x6740]        # 0x14000e880
   140008140:	83 ba 08 03 00 00 00 	cmp    DWORD PTR [rdx+0x308],0x0
   140008147:	74 0c                	je     0x140008155
   140008149:	e8 b2 c1 ff ff       	call   0x140004300
   14000814e:	48 8b 15 2b 67 00 00 	mov    rdx,QWORD PTR [rip+0x672b]        # 0x14000e880
   140008155:	48 8b 92 50 02 00 00 	mov    rdx,QWORD PTR [rdx+0x250]
   14000815c:	48 8b ce             	mov    rcx,rsi
   14000815f:	e8 2c a3 ff ff       	call   0x140002490
   140008164:	48 8b 15 15 67 00 00 	mov    rdx,QWORD PTR [rip+0x6715]        # 0x14000e880
   14000816b:	48 8b cf             	mov    rcx,rdi
   14000816e:	48 8b 92 58 02 00 00 	mov    rdx,QWORD PTR [rdx+0x258]
   140008175:	e8 16 a3 ff ff       	call   0x140002490
   14000817a:	48 8b 0d ff 66 00 00 	mov    rcx,QWORD PTR [rip+0x66ff]        # 0x14000e880
   140008181:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140008188:	e8 03 a4 ff ff       	call   0x140002590
   14000818d:	48 8b 15 ec 66 00 00 	mov    rdx,QWORD PTR [rip+0x66ec]        # 0x14000e880
   140008194:	41 8b cc             	mov    ecx,r12d
   140008197:	89 44 24 34          	mov    DWORD PTR [rsp+0x34],eax
   14000819b:	48 8b 92 50 02 00 00 	mov    rdx,QWORD PTR [rdx+0x250]
   1400081a2:	e8 79 a8 ff ff       	call   0x140002a20
   1400081a7:	48 8b 15 d2 66 00 00 	mov    rdx,QWORD PTR [rip+0x66d2]        # 0x14000e880
   1400081ae:	41 8b cc             	mov    ecx,r12d
   1400081b1:	48 8b 92 58 02 00 00 	mov    rdx,QWORD PTR [rdx+0x258]
   1400081b8:	e8 63 a8 ff ff       	call   0x140002a20
   1400081bd:	48 8b 15 bc 66 00 00 	mov    rdx,QWORD PTR [rip+0x66bc]        # 0x14000e880
   1400081c4:	41 8b cc             	mov    ecx,r12d
   1400081c7:	48 8b 92 60 02 00 00 	mov    rdx,QWORD PTR [rdx+0x260]
   1400081ce:	e8 ad a1 ff ff       	call   0x140002380
   1400081d3:	48 8b 0d a6 66 00 00 	mov    rcx,QWORD PTR [rip+0x66a6]        # 0x14000e880
   1400081da:	48 8b 89 68 02 00 00 	mov    rcx,QWORD PTR [rcx+0x268]
   1400081e1:	e8 5a c6 ff ff       	call   0x140004840
   1400081e6:	48 8b 0d 93 66 00 00 	mov    rcx,QWORD PTR [rip+0x6693]        # 0x14000e880
   1400081ed:	33 ff                	xor    edi,edi
   1400081ef:	c7 44 24 30 00 00 00 	mov    DWORD PTR [rsp+0x30],0x0
   1400081f6:	00 
   1400081f7:	33 ed                	xor    ebp,ebp
   1400081f9:	33 f6                	xor    esi,esi
   1400081fb:	45 33 ff             	xor    r15d,r15d
   1400081fe:	45 33 f6             	xor    r14d,r14d
   140008201:	48 8b 89 58 02 00 00 	mov    rcx,QWORD PTR [rcx+0x258]
   140008208:	e8 f3 c5 ff ff       	call   0x140004800
   14000820d:	85 c0                	test   eax,eax
   14000820f:	0f 84 77 04 00 00    	je     0x14000868c
   140008215:	66 66 66 0f 1f 84 00 	data16 data16 nop WORD PTR [rax+rax*1+0x0]
   14000821c:	00 00 00 00 
   140008220:	48 8b 0d 59 66 00 00 	mov    rcx,QWORD PTR [rip+0x6659]        # 0x14000e880
   140008227:	4c 8b 81 70 02 00 00 	mov    r8,QWORD PTR [rcx+0x270]
   14000822e:	48 85 f6             	test   rsi,rsi
   140008231:	0f 85 ad 00 00 00    	jne    0x1400082e4
   140008237:	48 8b 91 58 02 00 00 	mov    rdx,QWORD PTR [rcx+0x258]
   14000823e:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   140008245:	e8 76 d3 ff ff       	call   0x1400055c0
   14000824a:	48 8b 0d 2f 66 00 00 	mov    rcx,QWORD PTR [rip+0x662f]        # 0x14000e880
   140008251:	48 8b 81 58 02 00 00 	mov    rax,QWORD PTR [rcx+0x258]
   140008258:	48 8b 91 50 02 00 00 	mov    rdx,QWORD PTR [rcx+0x250]
   14000825f:	48 89 81 50 02 00 00 	mov    QWORD PTR [rcx+0x250],rax
   140008266:	48 8b 05 13 66 00 00 	mov    rax,QWORD PTR [rip+0x6613]        # 0x14000e880
   14000826d:	48 89 90 58 02 00 00 	mov    QWORD PTR [rax+0x258],rdx
   140008274:	48 8b 0d 05 66 00 00 	mov    rcx,QWORD PTR [rip+0x6605]        # 0x14000e880
   14000827b:	4c 8b 81 48 02 00 00 	mov    r8,QWORD PTR [rcx+0x248]
   140008282:	48 8b 91 70 02 00 00 	mov    rdx,QWORD PTR [rcx+0x270]
   140008289:	48 8b 89 68 02 00 00 	mov    rcx,QWORD PTR [rcx+0x268]
   140008290:	e8 1b de ff ff       	call   0x1400060b0
   140008295:	48 8b 15 e4 65 00 00 	mov    rdx,QWORD PTR [rip+0x65e4]        # 0x14000e880
   14000829c:	48 8b 8a 60 02 00 00 	mov    rcx,QWORD PTR [rdx+0x260]
   1400082a3:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   1400082aa:	4c 8b c1             	mov    r8,rcx
   1400082ad:	e8 1e ea ff ff       	call   0x140006cd0
   1400082b2:	48 8b 0d c7 65 00 00 	mov    rcx,QWORD PTR [rip+0x65c7]        # 0x14000e880
   1400082b9:	41 ff c6             	inc    r14d
   1400082bc:	48 8b 81 68 02 00 00 	mov    rax,QWORD PTR [rcx+0x268]
   1400082c3:	48 8b 91 60 02 00 00 	mov    rdx,QWORD PTR [rcx+0x260]
   1400082ca:	48 89 81 60 02 00 00 	mov    QWORD PTR [rcx+0x260],rax
   1400082d1:	48 8b 05 a8 65 00 00 	mov    rax,QWORD PTR [rip+0x65a8]        # 0x14000e880
   1400082d8:	48 89 90 68 02 00 00 	mov    QWORD PTR [rax+0x268],rdx
   1400082df:	e9 9b 01 00 00       	jmp    0x14000847f
   1400082e4:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   1400082eb:	48 8b d5             	mov    rdx,rbp
   1400082ee:	e8 6d e4 ff ff       	call   0x140006760
   1400082f3:	48 8b 05 86 65 00 00 	mov    rax,QWORD PTR [rip+0x6586]        # 0x14000e880
   1400082fa:	49 8b d7             	mov    rdx,r15
   1400082fd:	48 8b 88 50 02 00 00 	mov    rcx,QWORD PTR [rax+0x250]
   140008304:	4c 8b c1             	mov    r8,rcx
   140008307:	e8 54 e4 ff ff       	call   0x140006760
   14000830c:	48 8b 0d 6d 65 00 00 	mov    rcx,QWORD PTR [rip+0x656d]        # 0x14000e880
   140008313:	48 8b d6             	mov    rdx,rsi
   140008316:	4c 8b 81 48 02 00 00 	mov    r8,QWORD PTR [rcx+0x248]
   14000831d:	48 8b 89 58 02 00 00 	mov    rcx,QWORD PTR [rcx+0x258]
   140008324:	e8 37 e4 ff ff       	call   0x140006760
   140008329:	48 8b 05 50 65 00 00 	mov    rax,QWORD PTR [rip+0x6550]        # 0x14000e880
   140008330:	48 8b d7             	mov    rdx,rdi
   140008333:	48 8b 88 58 02 00 00 	mov    rcx,QWORD PTR [rax+0x258]
   14000833a:	4c 8b c1             	mov    r8,rcx
   14000833d:	e8 1e e4 ff ff       	call   0x140006760
   140008342:	45 85 e4             	test   r12d,r12d
   140008345:	75 37                	jne    0x14000837e
   140008347:	48 8b 0d 32 65 00 00 	mov    rcx,QWORD PTR [rip+0x6532]        # 0x14000e880
   14000834e:	48 8b 91 50 02 00 00 	mov    rdx,QWORD PTR [rcx+0x250]
   140008355:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   14000835c:	4c 8b c2             	mov    r8,rdx
   14000835f:	e8 5c ec ff ff       	call   0x140006fc0
   140008364:	48 8b 05 15 65 00 00 	mov    rax,QWORD PTR [rip+0x6515]        # 0x14000e880
   14000836b:	48 8b 90 58 02 00 00 	mov    rdx,QWORD PTR [rax+0x258]
   140008372:	48 8b 88 70 02 00 00 	mov    rcx,QWORD PTR [rax+0x270]
   140008379:	4c 8b c2             	mov    r8,rdx
   14000837c:	eb 35                	jmp    0x1400083b3
   14000837e:	48 8b 15 fb 64 00 00 	mov    rdx,QWORD PTR [rip+0x64fb]        # 0x14000e880
   140008385:	48 8b 8a 50 02 00 00 	mov    rcx,QWORD PTR [rdx+0x250]
   14000838c:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   140008393:	4c 8b c1             	mov    r8,rcx
   140008396:	e8 25 ec ff ff       	call   0x140006fc0
   14000839b:	48 8b 05 de 64 00 00 	mov    rax,QWORD PTR [rip+0x64de]        # 0x14000e880
   1400083a2:	48 8b 88 58 02 00 00 	mov    rcx,QWORD PTR [rax+0x258]
   1400083a9:	48 8b 90 70 02 00 00 	mov    rdx,QWORD PTR [rax+0x270]
   1400083b0:	4c 8b c1             	mov    r8,rcx
   1400083b3:	e8 08 ec ff ff       	call   0x140006fc0
   1400083b8:	48 8b 0d c1 64 00 00 	mov    rcx,QWORD PTR [rip+0x64c1]        # 0x14000e880
   1400083bf:	48 8b d5             	mov    rdx,rbp
   1400083c2:	4c 8b 81 70 02 00 00 	mov    r8,QWORD PTR [rcx+0x270]
   1400083c9:	48 8b 89 60 02 00 00 	mov    rcx,QWORD PTR [rcx+0x260]
   1400083d0:	e8 8b e3 ff ff       	call   0x140006760
   1400083d5:	48 8b 05 a4 64 00 00 	mov    rax,QWORD PTR [rip+0x64a4]        # 0x14000e880
   1400083dc:	49 8b d7             	mov    rdx,r15
   1400083df:	48 8b 88 60 02 00 00 	mov    rcx,QWORD PTR [rax+0x260]
   1400083e6:	4c 8b c1             	mov    r8,rcx
   1400083e9:	e8 72 e3 ff ff       	call   0x140006760
   1400083ee:	48 8b 0d 8b 64 00 00 	mov    rcx,QWORD PTR [rip+0x648b]        # 0x14000e880
   1400083f5:	48 8b d6             	mov    rdx,rsi
   1400083f8:	4c 8b 81 48 02 00 00 	mov    r8,QWORD PTR [rcx+0x248]
   1400083ff:	48 8b 89 68 02 00 00 	mov    rcx,QWORD PTR [rcx+0x268]
   140008406:	e8 55 e3 ff ff       	call   0x140006760
   14000840b:	48 8b 05 6e 64 00 00 	mov    rax,QWORD PTR [rip+0x646e]        # 0x14000e880
   140008412:	48 8b d7             	mov    rdx,rdi
   140008415:	48 8b 88 68 02 00 00 	mov    rcx,QWORD PTR [rax+0x268]
   14000841c:	4c 8b c1             	mov    r8,rcx
   14000841f:	e8 3c e3 ff ff       	call   0x140006760
   140008424:	4d 85 ff             	test   r15,r15
   140008427:	75 1c                	jne    0x140008445
   140008429:	48 8b 0d 50 64 00 00 	mov    rcx,QWORD PTR [rip+0x6450]        # 0x14000e880
   140008430:	48 8b 91 60 02 00 00 	mov    rdx,QWORD PTR [rcx+0x260]
   140008437:	48 8b 89 48 02 00 00 	mov    rcx,QWORD PTR [rcx+0x248]
   14000843e:	e8 4d a0 ff ff       	call   0x140002490
   140008443:	eb 1d                	jmp    0x140008462
   140008445:	48 8b 15 34 64 00 00 	mov    rdx,QWORD PTR [rip+0x6434]        # 0x14000e880
   14000844c:	48 8b 8a 60 02 00 00 	mov    rcx,QWORD PTR [rdx+0x260]
   140008453:	48 8b 92 48 02 00 00 	mov    rdx,QWORD PTR [rdx+0x248]
   14000845a:	4c 8b c1             	mov    r8,rcx
   14000845d:	e8 fe e8 ff ff       	call   0x140006d60
   140008462:	48 8b 15 17 64 00 00 	mov    rdx,QWORD PTR [rip+0x6417]        # 0x14000e880
   140008469:	48 8b 8a 68 02 00 00 	mov    rcx,QWORD PTR [rdx+0x268]
   140008470:	48 8b 92 70 02 00 00 	mov    rdx,QWORD PTR [rdx+0x270]
   140008477:	4c 8b c1             	mov    r8,rcx
   14000847a:	e8 e1 e8 ff ff       	call   0x140006d60
   14000847f:	48 8b 0d fa 63 00 00 	mov    rcx,QWORD PTR [rip+0x63fa]        # 0x14000e880
   140008486:	83 b9 f0 02 00 00 00 	cmp    DWORD PTR [rcx+0x2f0],0x0
   14000848d:	0f 85 2a 03 00 00    	jne    0x1400087bd
   140008493:	48 8b 89 58 02 00 00 	mov    rcx,QWORD PTR [rcx+0x258]
   14000849a:	e8 61 c3 ff ff       	call   0x140004800
   14000849f:	85 c0                	test   eax,eax
   1400084a1:	0f 84 d5 01 00 00    	je     0x14000867c
   1400084a7:	4c 8b 05 d2 63 00 00 	mov    r8,QWORD PTR [rip+0x63d2]        # 0x14000e880
   1400084ae:	49 8b 80 50 02 00 00 	mov    rax,QWORD PTR [r8+0x250]
   1400084b5:	48 63 10             	movsxd rdx,DWORD PTR [rax]
   1400084b8:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   1400084bc:	83 fa 01             	cmp    edx,0x1
   1400084bf:	75 1a                	jne    0x1400084db
   1400084c1:	49 8b 80 58 02 00 00 	mov    rax,QWORD PTR [r8+0x258]
   1400084c8:	48 8b 19             	mov    rbx,QWORD PTR [rcx]
   1400084cb:	89 54 24 30          	mov    DWORD PTR [rsp+0x30],edx
   1400084cf:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   1400084d3:	4c 8b 01             	mov    r8,QWORD PTR [rcx]
   1400084d6:	e9 c6 00 00 00       	jmp    0x1400085a1
   1400084db:	48 8b 5c d1 f8       	mov    rbx,QWORD PTR [rcx+rdx*8-0x8]
   1400084e0:	48 8b f2             	mov    rsi,rdx
   1400084e3:	49 8b 10             	mov    rdx,QWORD PTR [r8]
   1400084e6:	48 8d 7b 01          	lea    rdi,[rbx+0x1]
   1400084ea:	48 85 d2             	test   rdx,rdx
   1400084ed:	75 5d                	jne    0x14000854c
   1400084ef:	48 85 ff             	test   rdi,rdi
   1400084f2:	75 15                	jne    0x140008509
   1400084f4:	49 8b 80 58 02 00 00 	mov    rax,QWORD PTR [r8+0x258]
   1400084fb:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   1400084ff:	4c 8b 44 f1 f8       	mov    r8,QWORD PTR [rcx+rsi*8-0x8]
   140008504:	e9 94 00 00 00       	jmp    0x14000859d
   140008509:	48 8b 54 f1 f0       	mov    rdx,QWORD PTR [rcx+rsi*8-0x10]
   14000850e:	4c 8d 4c 24 38       	lea    r9,[rsp+0x38]
   140008513:	48 8b cb             	mov    rcx,rbx
   140008516:	4c 8b c7             	mov    r8,rdi
   140008519:	e8 22 fa ff ff       	call   0x140007f40
   14000851e:	4c 8b 0d 5b 63 00 00 	mov    r9,QWORD PTR [rip+0x635b]        # 0x14000e880
   140008525:	4c 8b c7             	mov    r8,rdi
   140008528:	48 8b d8             	mov    rbx,rax
   14000852b:	4d 8b 91 58 02 00 00 	mov    r10,QWORD PTR [r9+0x258]
   140008532:	4c 8d 4c 24 38       	lea    r9,[rsp+0x38]
   140008537:	49 8b 4a 08          	mov    rcx,QWORD PTR [r10+0x8]
   14000853b:	48 8b 54 f1 f0       	mov    rdx,QWORD PTR [rcx+rsi*8-0x10]
   140008540:	48 8b 4c f1 f8       	mov    rcx,QWORD PTR [rcx+rsi*8-0x8]
   140008545:	e8 f6 f9 ff ff       	call   0x140007f40
   14000854a:	eb 4e                	jmp    0x14000859a
   14000854c:	4c 8b 44 f1 f0       	mov    r8,QWORD PTR [rcx+rsi*8-0x10]
   140008551:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   140008556:	48 8b cb             	mov    rcx,rbx
   140008559:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000855e:	4c 8b cf             	mov    r9,rdi
   140008561:	e8 7a f8 ff ff       	call   0x140007de0
   140008566:	48 8b 15 13 63 00 00 	mov    rdx,QWORD PTR [rip+0x6313]        # 0x14000e880
   14000856d:	48 8b d8             	mov    rbx,rax
   140008570:	4c 8b cf             	mov    r9,rdi
   140008573:	48 8b 82 58 02 00 00 	mov    rax,QWORD PTR [rdx+0x258]
   14000857a:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14000857d:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   140008581:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   140008586:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000858b:	4c 8b 44 f1 f0       	mov    r8,QWORD PTR [rcx+rsi*8-0x10]
   140008590:	48 8b 4c f1 f8       	mov    rcx,QWORD PTR [rcx+rsi*8-0x8]
   140008595:	e8 46 f8 ff ff       	call   0x140007de0
   14000859a:	4c 8b c0             	mov    r8,rax
   14000859d:	8b 54 24 30          	mov    edx,DWORD PTR [rsp+0x30]
   1400085a1:	41 bc 01 00 00 00    	mov    r12d,0x1
   1400085a7:	33 f6                	xor    esi,esi
   1400085a9:	33 ed                	xor    ebp,ebp
   1400085ab:	45 8b fc             	mov    r15d,r12d
   1400085ae:	41 8b fc             	mov    edi,r12d
   1400085b1:	4d 8b d8             	mov    r11,r8
   1400085b4:	4d 8b e8             	mov    r13,r8
   1400085b7:	4c 8b cf             	mov    r9,rdi
   1400085ba:	85 d2                	test   edx,edx
   1400085bc:	0f 84 d6 00 00 00    	je     0x140008698
   1400085c2:	4d 85 c0             	test   r8,r8
   1400085c5:	0f 84 83 00 00 00    	je     0x14000864e
   1400085cb:	48 8b c3             	mov    rax,rbx
   1400085ce:	49 2b c0             	sub    rax,r8
   1400085d1:	49 3b c0             	cmp    rax,r8
   1400085d4:	73 08                	jae    0x1400085de
   1400085d6:	4c 8b c0             	mov    r8,rax
   1400085d9:	e9 bd 01 00 00       	jmp    0x14000879b
   1400085de:	49 2b c0             	sub    rax,r8
   1400085e1:	49 3b c0             	cmp    rax,r8
   1400085e4:	73 54                	jae    0x14000863a
   1400085e6:	b9 02 00 00 00       	mov    ecx,0x2
   1400085eb:	33 d2                	xor    edx,edx
   1400085ed:	48 b8 00 00 00 00 00 	movabs rax,0x8000000000000000
   1400085f4:	00 00 80 
   1400085f7:	48 2b c6             	sub    rax,rsi
   1400085fa:	48 f7 f7             	div    rdi
   1400085fd:	48 3b c8             	cmp    rcx,rax
   140008600:	73 4c                	jae    0x14000864e
   140008602:	48 8b c1             	mov    rax,rcx
   140008605:	49 0f af c0          	imul   rax,r8
   140008609:	48 0f af f9          	imul   rdi,rcx
   14000860d:	4c 8b c3             	mov    r8,rbx
   140008610:	4c 2b c0             	sub    r8,rax
   140008613:	48 03 fe             	add    rdi,rsi
   140008616:	48 0f af cd          	imul   rcx,rbp
   14000861a:	8b 54 24 30          	mov    edx,DWORD PTR [rsp+0x30]
   14000861e:	4a 8d 04 39          	lea    rax,[rcx+r15*1]
   140008622:	41 ff c6             	inc    r14d
   140008625:	4c 8b fd             	mov    r15,rbp
   140008628:	41 83 f4 01          	xor    r12d,0x1
   14000862c:	48 8b e8             	mov    rbp,rax
   14000862f:	49 8b f1             	mov    rsi,r9
   140008632:	49 8b dd             	mov    rbx,r13
   140008635:	e9 77 ff ff ff       	jmp    0x1400085b1
   14000863a:	33 d2                	xor    edx,edx
   14000863c:	48 8b c3             	mov    rax,rbx
   14000863f:	49 f7 f0             	div    r8
   140008642:	48 8b c8             	mov    rcx,rax
   140008645:	48 85 c0             	test   rax,rax
   140008648:	0f 85 3d 01 00 00    	jne    0x14000878b
   14000864e:	41 81 e6 01 00 00 80 	and    r14d,0x80000001
   140008655:	7d 0a                	jge    0x140008661
   140008657:	41 ff ce             	dec    r14d
   14000865a:	41 83 ce fe          	or     r14d,0xfffffffe
   14000865e:	41 ff c6             	inc    r14d
   140008661:	48 8b 0d 18 62 00 00 	mov    rcx,QWORD PTR [rip+0x6218]        # 0x14000e880
   140008668:	48 8b 89 58 02 00 00 	mov    rcx,QWORD PTR [rcx+0x258]
   14000866f:	e8 8c c1 ff ff       	call   0x140004800
   140008674:	85 c0                	test   eax,eax
   140008676:	0f 85 a4 fb ff ff    	jne    0x140008220
   14000867c:	4c 8b ac 24 b8 00 00 	mov    r13,QWORD PTR [rsp+0xb8]
   140008683:	00 
   140008684:	48 8b 9c 24 b0 00 00 	mov    rbx,QWORD PTR [rsp+0xb0]
   14000868b:	00 
   14000868c:	48 8b 0d ed 61 00 00 	mov    rcx,QWORD PTR [rip+0x61ed]        # 0x14000e880
   140008693:	e9 35 01 00 00       	jmp    0x1400087cd
   140008698:	45 85 e4             	test   r12d,r12d
   14000869b:	74 61                	je     0x1400086fe
   14000869d:	49 8b c8             	mov    rcx,r8
   1400086a0:	48 2b cd             	sub    rcx,rbp
   1400086a3:	74 a9                	je     0x14000864e
   1400086a5:	4d 8d 0c 38          	lea    r9,[r8+rdi*1]
   1400086a9:	4d 85 c9             	test   r9,r9
   1400086ac:	74 a0                	je     0x14000864e
   1400086ae:	4e 8d 14 3b          	lea    r10,[rbx+r15*1]
   1400086b2:	49 8b c2             	mov    rax,r10
   1400086b5:	48 2b c1             	sub    rax,rcx
   1400086b8:	48 3b c1             	cmp    rax,rcx
   1400086bb:	73 10                	jae    0x1400086cd
   1400086bd:	4c 8b d3             	mov    r10,rbx
   1400086c0:	b9 01 00 00 00       	mov    ecx,0x1
   1400086c5:	4c 2b d6             	sub    r10,rsi
   1400086c8:	e9 89 00 00 00       	jmp    0x140008756
   1400086cd:	48 2b c1             	sub    rax,rcx
   1400086d0:	48 3b c1             	cmp    rax,rcx
   1400086d3:	73 0d                	jae    0x1400086e2
   1400086d5:	4c 8b d3             	mov    r10,rbx
   1400086d8:	b9 02 00 00 00       	mov    ecx,0x2
   1400086dd:	4c 2b d6             	sub    r10,rsi
   1400086e0:	eb 74                	jmp    0x140008756
   1400086e2:	33 d2                	xor    edx,edx
   1400086e4:	49 8b c2             	mov    rax,r10
   1400086e7:	48 f7 f1             	div    rcx
   1400086ea:	48 8b c8             	mov    rcx,rax
   1400086ed:	48 85 c0             	test   rax,rax
   1400086f0:	0f 84 58 ff ff ff    	je     0x14000864e
   1400086f6:	4c 8b d3             	mov    r10,rbx
   1400086f9:	4c 2b d6             	sub    r10,rsi
   1400086fc:	eb 58                	jmp    0x140008756
   1400086fe:	49 8d 0c 28          	lea    rcx,[r8+rbp*1]
   140008702:	48 85 c9             	test   rcx,rcx
   140008705:	0f 84 43 ff ff ff    	je     0x14000864e
   14000870b:	4d 8b c8             	mov    r9,r8
   14000870e:	4c 2b cf             	sub    r9,rdi
   140008711:	0f 84 37 ff ff ff    	je     0x14000864e
   140008717:	4c 8b d3             	mov    r10,rbx
   14000871a:	4d 2b d7             	sub    r10,r15
   14000871d:	49 8b c2             	mov    rax,r10
   140008720:	48 2b c1             	sub    rax,rcx
   140008723:	48 3b c1             	cmp    rax,rcx
   140008726:	73 07                	jae    0x14000872f
   140008728:	b9 01 00 00 00       	mov    ecx,0x1
   14000872d:	eb 23                	jmp    0x140008752
   14000872f:	48 2b c1             	sub    rax,rcx
   140008732:	48 3b c1             	cmp    rax,rcx
   140008735:	73 07                	jae    0x14000873e
   140008737:	b9 02 00 00 00       	mov    ecx,0x2
   14000873c:	eb 14                	jmp    0x140008752
   14000873e:	33 d2                	xor    edx,edx
   140008740:	49 8b c2             	mov    rax,r10
   140008743:	48 f7 f1             	div    rcx
   140008746:	48 8b c8             	mov    rcx,rax
   140008749:	48 85 c0             	test   rax,rax
   14000874c:	0f 84 fc fe ff ff    	je     0x14000864e
   140008752:	4c 8d 14 33          	lea    r10,[rbx+rsi*1]
   140008756:	49 8b c2             	mov    rax,r10
   140008759:	49 2b c1             	sub    rax,r9
   14000875c:	49 3b c1             	cmp    rax,r9
   14000875f:	73 07                	jae    0x140008768
   140008761:	b8 01 00 00 00       	mov    eax,0x1
   140008766:	eb 17                	jmp    0x14000877f
   140008768:	49 2b c1             	sub    rax,r9
   14000876b:	49 3b c1             	cmp    rax,r9
   14000876e:	73 07                	jae    0x140008777
   140008770:	b8 02 00 00 00       	mov    eax,0x2
   140008775:	eb 08                	jmp    0x14000877f
   140008777:	49 8b c2             	mov    rax,r10
   14000877a:	33 d2                	xor    edx,edx
   14000877c:	49 f7 f1             	div    r9
   14000877f:	48 3b c8             	cmp    rcx,rax
   140008782:	0f 85 c6 fe ff ff    	jne    0x14000864e
   140008788:	4c 8b cf             	mov    r9,rdi
   14000878b:	48 83 f9 01          	cmp    rcx,0x1
   14000878f:	0f 85 56 fe ff ff    	jne    0x1400085eb
   140008795:	4c 8b c3             	mov    r8,rbx
   140008798:	4d 2b c3             	sub    r8,r11
   14000879b:	48 8d 04 37          	lea    rax,[rdi+rsi*1]
   14000879f:	48 b9 00 00 00 00 00 	movabs rcx,0x8000000000000000
   1400087a6:	00 00 80 
   1400087a9:	48 3b c1             	cmp    rax,rcx
   1400087ac:	0f 83 9c fe ff ff    	jae    0x14000864e
   1400087b2:	48 8b f8             	mov    rdi,rax
   1400087b5:	48 8b cd             	mov    rcx,rbp
   1400087b8:	e9 5d fe ff ff       	jmp    0x14000861a
   1400087bd:	48 8b 9c 24 b0 00 00 	mov    rbx,QWORD PTR [rsp+0xb0]
   1400087c4:	00 
   1400087c5:	4c 8b ac 24 b8 00 00 	mov    r13,QWORD PTR [rsp+0xb8]
   1400087cc:	00 
   1400087cd:	83 7c 24 34 ff       	cmp    DWORD PTR [rsp+0x34],0xffffffff
   1400087d2:	4c 8b 7c 24 58       	mov    r15,QWORD PTR [rsp+0x58]
   1400087d7:	48 8b 6c 24 68       	mov    rbp,QWORD PTR [rsp+0x68]
   1400087dc:	75 03                	jne    0x1400087e1
   1400087de:	41 ff c6             	inc    r14d
   1400087e1:	41 81 e6 01 00 00 80 	and    r14d,0x80000001
   1400087e8:	7d 0a                	jge    0x1400087f4
   1400087ea:	41 ff ce             	dec    r14d
   1400087ed:	41 83 ce fe          	or     r14d,0xfffffffe
   1400087f1:	41 ff c6             	inc    r14d
   1400087f4:	48 8b bc 24 a8 00 00 	mov    rdi,QWORD PTR [rsp+0xa8]
   1400087fb:	00 
   1400087fc:	41 83 fe 01          	cmp    r14d,0x1
   140008800:	4c 8b 74 24 60       	mov    r14,QWORD PTR [rsp+0x60]
   140008805:	75 19                	jne    0x140008820
   140008807:	48 8b 91 60 02 00 00 	mov    rdx,QWORD PTR [rcx+0x260]
   14000880e:	48 8b cf             	mov    rcx,rdi
   140008811:	4c 8b c2             	mov    r8,rdx
   140008814:	e8 47 ea ff ff       	call   0x140007260
   140008819:	48 8b 0d 60 60 00 00 	mov    rcx,QWORD PTR [rip+0x6060]        # 0x14000e880
   140008820:	49 3b dd             	cmp    rbx,r13
   140008823:	74 66                	je     0x14000888b
   140008825:	48 8b 91 58 02 00 00 	mov    rdx,QWORD PTR [rcx+0x258]
   14000882c:	48 8b 8c 24 a0 00 00 	mov    rcx,QWORD PTR [rsp+0xa0]
   140008833:	00 
   140008834:	e8 d7 bc ff ff       	call   0x140004510
   140008839:	48 8b 0d 40 60 00 00 	mov    rcx,QWORD PTR [rip+0x6040]        # 0x14000e880
   140008840:	4c 8b cf             	mov    r9,rdi
   140008843:	48 8b 81 68 02 00 00 	mov    rax,QWORD PTR [rcx+0x268]
   14000884a:	4c 8b 81 50 02 00 00 	mov    r8,QWORD PTR [rcx+0x250]
   140008851:	48 8b 91 60 02 00 00 	mov    rdx,QWORD PTR [rcx+0x260]
   140008858:	48 8b 89 58 02 00 00 	mov    rcx,QWORD PTR [rcx+0x258]
   14000885f:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140008864:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140008869:	e8 f2 d6 ff ff       	call   0x140005f60
   14000886e:	48 8b 0d 0b 60 00 00 	mov    rcx,QWORD PTR [rip+0x600b]        # 0x14000e880
   140008875:	49 8b d5             	mov    rdx,r13
   140008878:	48 8b 89 68 02 00 00 	mov    rcx,QWORD PTR [rcx+0x268]
   14000887f:	e8 0c 9c ff ff       	call   0x140002490
   140008884:	48 8b 0d f5 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5ff5]        # 0x14000e880
   14000888b:	48 8b 89 60 02 00 00 	mov    rcx,QWORD PTR [rcx+0x260]
   140008892:	48 8b d3             	mov    rdx,rbx
   140008895:	e8 f6 9b ff ff       	call   0x140002490
   14000889a:	48 8b 94 24 c0 00 00 	mov    rdx,QWORD PTR [rsp+0xc0]
   1400088a1:	00 
   1400088a2:	48 3b d3             	cmp    rdx,rbx
   1400088a5:	74 18                	je     0x1400088bf
   1400088a7:	49 3b d5             	cmp    rdx,r13
   1400088aa:	74 13                	je     0x1400088bf
   1400088ac:	48 8b 0d cd 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5fcd]        # 0x14000e880
   1400088b3:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   1400088ba:	e8 d1 9b ff ff       	call   0x140002490
   1400088bf:	48 8b 05 ba 5f 00 00 	mov    rax,QWORD PTR [rip+0x5fba]        # 0x14000e880
   1400088c6:	ff 48 2c             	dec    DWORD PTR [rax+0x2c]
   1400088c9:	48 8b 0d b0 5f 00 00 	mov    rcx,QWORD PTR [rip+0x5fb0]        # 0x14000e880
   1400088d0:	48 8b 89 50 02 00 00 	mov    rcx,QWORD PTR [rcx+0x250]
   1400088d7:	e8 24 bf ff ff       	call   0x140004800
   1400088dc:	48 83 c4 70          	add    rsp,0x70
   1400088e0:	41 5d                	pop    r13
   1400088e2:	41 5c                	pop    r12
   1400088e4:	5f                   	pop    rdi
   1400088e5:	5e                   	pop    rsi
   1400088e6:	5b                   	pop    rbx
   1400088e7:	c3                   	ret
   1400088e8:	cc                   	int3
   1400088e9:	cc                   	int3
   1400088ea:	cc                   	int3
   1400088eb:	cc                   	int3
   1400088ec:	cc                   	int3
   1400088ed:	cc                   	int3
   1400088ee:	cc                   	int3
   1400088ef:	cc                   	int3
   1400088f0:	cc                   	int3
   1400088f1:	cc                   	int3
   1400088f2:	cc                   	int3
   1400088f3:	cc                   	int3
   1400088f4:	cc                   	int3
   1400088f5:	cc                   	int3
   1400088f6:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   1400088fd:	00 00 00 
   140008900:	48 3b 0d 99 5e 00 00 	cmp    rcx,QWORD PTR [rip+0x5e99]        # 0x14000e7a0
   140008907:	75 10                	jne    0x140008919
   140008909:	48 c1 c1 10          	rol    rcx,0x10
   14000890d:	66 f7 c1 ff ff       	test   cx,0xffff
   140008912:	75 01                	jne    0x140008915
   140008914:	c3                   	ret
   140008915:	48 c1 c9 10          	ror    rcx,0x10
   140008919:	e9 36 00 00 00       	jmp    0x140008954
   14000891e:	cc                   	int3
   14000891f:	cc                   	int3
   140008920:	40 53                	rex push rbx
   140008922:	48 83 ec 20          	sub    rsp,0x20
   140008926:	48 8b d9             	mov    rbx,rcx
   140008929:	33 c9                	xor    ecx,ecx
   14000892b:	ff 15 1f 17 00 00    	call   QWORD PTR [rip+0x171f]        # 0x14000a050
   140008931:	48 8b cb             	mov    rcx,rbx
   140008934:	ff 15 1e 17 00 00    	call   QWORD PTR [rip+0x171e]        # 0x14000a058
   14000893a:	ff 15 08 17 00 00    	call   QWORD PTR [rip+0x1708]        # 0x14000a048
   140008940:	48 8b c8             	mov    rcx,rax
   140008943:	ba 09 04 00 c0       	mov    edx,0xc0000409
   140008948:	48 83 c4 20          	add    rsp,0x20
   14000894c:	5b                   	pop    rbx
   14000894d:	48 ff 25 ec 16 00 00 	rex.W jmp QWORD PTR [rip+0x16ec]        # 0x14000a040
   140008954:	48 89 4c 24 08       	mov    QWORD PTR [rsp+0x8],rcx
   140008959:	48 83 ec 38          	sub    rsp,0x38
   14000895d:	b9 17 00 00 00       	mov    ecx,0x17
   140008962:	ff 15 d0 16 00 00    	call   QWORD PTR [rip+0x16d0]        # 0x14000a038
   140008968:	85 c0                	test   eax,eax
   14000896a:	74 07                	je     0x140008973
   14000896c:	b9 02 00 00 00       	mov    ecx,0x2
   140008971:	cd 29                	int    0x29
   140008973:	48 8d 0d b6 5f 00 00 	lea    rcx,[rip+0x5fb6]        # 0x14000e930
   14000897a:	e8 a9 00 00 00       	call   0x140008a28
   14000897f:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   140008984:	48 89 05 9d 60 00 00 	mov    QWORD PTR [rip+0x609d],rax        # 0x14000ea28
   14000898b:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   140008990:	48 83 c0 08          	add    rax,0x8
   140008994:	48 89 05 2d 60 00 00 	mov    QWORD PTR [rip+0x602d],rax        # 0x14000e9c8
   14000899b:	48 8b 05 86 60 00 00 	mov    rax,QWORD PTR [rip+0x6086]        # 0x14000ea28
   1400089a2:	48 89 05 f7 5e 00 00 	mov    QWORD PTR [rip+0x5ef7],rax        # 0x14000e8a0
   1400089a9:	48 8b 44 24 40       	mov    rax,QWORD PTR [rsp+0x40]
   1400089ae:	48 89 05 fb 5f 00 00 	mov    QWORD PTR [rip+0x5ffb],rax        # 0x14000e9b0
   1400089b5:	c7 05 d1 5e 00 00 09 	mov    DWORD PTR [rip+0x5ed1],0xc0000409        # 0x14000e890
   1400089bc:	04 00 c0 
   1400089bf:	c7 05 cb 5e 00 00 01 	mov    DWORD PTR [rip+0x5ecb],0x1        # 0x14000e894
   1400089c6:	00 00 00 
   1400089c9:	c7 05 d5 5e 00 00 01 	mov    DWORD PTR [rip+0x5ed5],0x1        # 0x14000e8a8
   1400089d0:	00 00 00 
   1400089d3:	b8 08 00 00 00       	mov    eax,0x8
   1400089d8:	48 6b c0 00          	imul   rax,rax,0x0
   1400089dc:	48 8d 0d cd 5e 00 00 	lea    rcx,[rip+0x5ecd]        # 0x14000e8b0
   1400089e3:	48 c7 04 01 02 00 00 	mov    QWORD PTR [rcx+rax*1],0x2
   1400089ea:	00 
   1400089eb:	b8 08 00 00 00       	mov    eax,0x8
   1400089f0:	48 6b c0 00          	imul   rax,rax,0x0
   1400089f4:	48 8b 0d a5 5d 00 00 	mov    rcx,QWORD PTR [rip+0x5da5]        # 0x14000e7a0
   1400089fb:	48 89 4c 04 20       	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140008a00:	b8 08 00 00 00       	mov    eax,0x8
   140008a05:	48 6b c0 01          	imul   rax,rax,0x1
   140008a09:	48 8b 0d 98 5d 00 00 	mov    rcx,QWORD PTR [rip+0x5d98]        # 0x14000e7a8
   140008a10:	48 89 4c 04 20       	mov    QWORD PTR [rsp+rax*1+0x20],rcx
   140008a15:	48 8d 0d fc 29 00 00 	lea    rcx,[rip+0x29fc]        # 0x14000b418
   140008a1c:	e8 ff fe ff ff       	call   0x140008920
   140008a21:	48 83 c4 38          	add    rsp,0x38
   140008a25:	c3                   	ret
   140008a26:	cc                   	int3
   140008a27:	cc                   	int3
   140008a28:	40 53                	rex push rbx
   140008a2a:	56                   	push   rsi
   140008a2b:	57                   	push   rdi
   140008a2c:	48 83 ec 40          	sub    rsp,0x40
   140008a30:	48 8b d9             	mov    rbx,rcx
   140008a33:	ff 15 c7 15 00 00    	call   QWORD PTR [rip+0x15c7]        # 0x14000a000
   140008a39:	48 8b b3 f8 00 00 00 	mov    rsi,QWORD PTR [rbx+0xf8]
   140008a40:	33 ff                	xor    edi,edi
   140008a42:	45 33 c0             	xor    r8d,r8d
   140008a45:	48 8d 54 24 60       	lea    rdx,[rsp+0x60]
   140008a4a:	48 8b ce             	mov    rcx,rsi
   140008a4d:	ff 15 15 16 00 00    	call   QWORD PTR [rip+0x1615]        # 0x14000a068
   140008a53:	48 85 c0             	test   rax,rax
   140008a56:	74 39                	je     0x140008a91
   140008a58:	48 83 64 24 38 00    	and    QWORD PTR [rsp+0x38],0x0
   140008a5e:	48 8d 4c 24 68       	lea    rcx,[rsp+0x68]
   140008a63:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140008a68:	4c 8b c8             	mov    r9,rax
   140008a6b:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140008a70:	4c 8b c6             	mov    r8,rsi
   140008a73:	48 8d 4c 24 70       	lea    rcx,[rsp+0x70]
   140008a78:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   140008a7d:	33 c9                	xor    ecx,ecx
   140008a7f:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140008a84:	ff 15 d6 15 00 00    	call   QWORD PTR [rip+0x15d6]        # 0x14000a060
   140008a8a:	ff c7                	inc    edi
   140008a8c:	83 ff 02             	cmp    edi,0x2
   140008a8f:	7c b1                	jl     0x140008a42
   140008a91:	48 83 c4 40          	add    rsp,0x40
   140008a95:	5f                   	pop    rdi
   140008a96:	5e                   	pop    rsi
   140008a97:	5b                   	pop    rbx
   140008a98:	c3                   	ret
   140008a99:	cc                   	int3
   140008a9a:	cc                   	int3
   140008a9b:	cc                   	int3
   140008a9c:	40 53                	rex push rbx
   140008a9e:	48 83 ec 20          	sub    rsp,0x20
   140008aa2:	48 8b d9             	mov    rbx,rcx
   140008aa5:	eb 0f                	jmp    0x140008ab6
   140008aa7:	48 8b cb             	mov    rcx,rbx
   140008aaa:	e8 9f 0b 00 00       	call   0x14000964e
   140008aaf:	85 c0                	test   eax,eax
   140008ab1:	74 13                	je     0x140008ac6
   140008ab3:	48 8b cb             	mov    rcx,rbx
   140008ab6:	e8 99 0b 00 00       	call   0x140009654
   140008abb:	48 85 c0             	test   rax,rax
   140008abe:	74 e7                	je     0x140008aa7
   140008ac0:	48 83 c4 20          	add    rsp,0x20
   140008ac4:	5b                   	pop    rbx
   140008ac5:	c3                   	ret
   140008ac6:	48 83 fb ff          	cmp    rbx,0xffffffffffffffff
   140008aca:	74 06                	je     0x140008ad2
   140008acc:	e8 4b 03 00 00       	call   0x140008e1c
   140008ad1:	cc                   	int3
   140008ad2:	e8 99 86 ff ff       	call   0x140001170
   140008ad7:	cc                   	int3
   140008ad8:	e9 5f 03 00 00       	jmp    0x140008e3c
   140008add:	cc                   	int3
   140008ade:	cc                   	int3
   140008adf:	cc                   	int3
   140008ae0:	40 53                	rex push rbx
   140008ae2:	48 83 ec 20          	sub    rsp,0x20
   140008ae6:	48 8d 05 43 29 00 00 	lea    rax,[rip+0x2943]        # 0x14000b430
   140008aed:	48 8b d9             	mov    rbx,rcx
   140008af0:	48 89 01             	mov    QWORD PTR [rcx],rax
   140008af3:	f6 c2 01             	test   dl,0x1
   140008af6:	74 0a                	je     0x140008b02
   140008af8:	ba 18 00 00 00       	mov    edx,0x18
   140008afd:	e8 d6 ff ff ff       	call   0x140008ad8
   140008b02:	48 8b c3             	mov    rax,rbx
   140008b05:	48 83 c4 20          	add    rsp,0x20
   140008b09:	5b                   	pop    rbx
   140008b0a:	c3                   	ret
   140008b0b:	cc                   	int3
   140008b0c:	40 53                	rex push rbx
   140008b0e:	48 83 ec 20          	sub    rsp,0x20
   140008b12:	b9 01 00 00 00       	mov    ecx,0x1
   140008b17:	e8 44 0b 00 00       	call   0x140009660
   140008b1c:	e8 2b 06 00 00       	call   0x14000914c
   140008b21:	8b c8                	mov    ecx,eax
   140008b23:	e8 68 0b 00 00       	call   0x140009690
   140008b28:	e8 13 06 00 00       	call   0x140009140
   140008b2d:	8b d8                	mov    ebx,eax
   140008b2f:	e8 8c 0b 00 00       	call   0x1400096c0
   140008b34:	b9 01 00 00 00       	mov    ecx,0x1
   140008b39:	89 18                	mov    DWORD PTR [rax],ebx
   140008b3b:	e8 8c 03 00 00       	call   0x140008ecc
   140008b40:	84 c0                	test   al,al
   140008b42:	74 73                	je     0x140008bb7
   140008b44:	e8 7f 08 00 00       	call   0x1400093c8
   140008b49:	48 8d 0d b4 08 00 00 	lea    rcx,[rip+0x8b4]        # 0x140009404
   140008b50:	e8 27 05 00 00       	call   0x14000907c
   140008b55:	e8 ea 05 00 00       	call   0x140009144
   140008b5a:	8b c8                	mov    ecx,eax
   140008b5c:	e8 0b 0b 00 00       	call   0x14000966c
   140008b61:	85 c0                	test   eax,eax
   140008b63:	75 52                	jne    0x140008bb7
   140008b65:	e8 ea 05 00 00       	call   0x140009154
   140008b6a:	e8 21 06 00 00       	call   0x140009190
   140008b6f:	85 c0                	test   eax,eax
   140008b71:	74 0c                	je     0x140008b7f
   140008b73:	48 8d 0d c6 05 00 00 	lea    rcx,[rip+0x5c6]        # 0x140009140
   140008b7a:	e8 e7 0a 00 00       	call   0x140009666
   140008b7f:	e8 e4 05 00 00       	call   0x140009168
   140008b84:	e8 df 05 00 00       	call   0x140009168
   140008b89:	e8 b2 05 00 00       	call   0x140009140
   140008b8e:	8b c8                	mov    ecx,eax
   140008b90:	e8 1f 0b 00 00       	call   0x1400096b4
   140008b95:	e8 ca 05 00 00       	call   0x140009164
   140008b9a:	84 c0                	test   al,al
   140008b9c:	74 05                	je     0x140008ba3
   140008b9e:	e8 cf 0a 00 00       	call   0x140009672
   140008ba3:	e8 98 05 00 00       	call   0x140009140
   140008ba8:	e8 53 07 00 00       	call   0x140009300
   140008bad:	85 c0                	test   eax,eax
   140008baf:	75 06                	jne    0x140008bb7
   140008bb1:	48 83 c4 20          	add    rsp,0x20
   140008bb5:	5b                   	pop    rbx
   140008bb6:	c3                   	ret
   140008bb7:	b9 07 00 00 00       	mov    ecx,0x7
   140008bbc:	e8 f3 05 00 00       	call   0x1400091b4
   140008bc1:	cc                   	int3
   140008bc2:	cc                   	int3
   140008bc3:	cc                   	int3
   140008bc4:	48 83 ec 28          	sub    rsp,0x28
   140008bc8:	e8 a7 05 00 00       	call   0x140009174
   140008bcd:	33 c0                	xor    eax,eax
   140008bcf:	48 83 c4 28          	add    rsp,0x28
   140008bd3:	c3                   	ret
   140008bd4:	48 83 ec 28          	sub    rsp,0x28
   140008bd8:	e8 7f 07 00 00       	call   0x14000935c
   140008bdd:	e8 5e 05 00 00       	call   0x140009140
   140008be2:	8b c8                	mov    ecx,eax
   140008be4:	48 83 c4 28          	add    rsp,0x28
   140008be8:	e9 cd 0a 00 00       	jmp    0x1400096ba
   140008bed:	cc                   	int3
   140008bee:	cc                   	int3
   140008bef:	cc                   	int3
   140008bf0:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140008bf5:	48 89 74 24 10       	mov    QWORD PTR [rsp+0x10],rsi
   140008bfa:	57                   	push   rdi
   140008bfb:	48 83 ec 30          	sub    rsp,0x30
   140008bff:	b9 01 00 00 00       	mov    ecx,0x1
   140008c04:	e8 77 02 00 00       	call   0x140008e80
   140008c09:	84 c0                	test   al,al
   140008c0b:	0f 84 36 01 00 00    	je     0x140008d47
   140008c11:	40 32 f6             	xor    sil,sil
   140008c14:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140008c19:	e8 26 02 00 00       	call   0x140008e44
   140008c1e:	8a d8                	mov    bl,al
   140008c20:	8b 0d da 61 00 00    	mov    ecx,DWORD PTR [rip+0x61da]        # 0x14000ee00
   140008c26:	83 f9 01             	cmp    ecx,0x1
   140008c29:	0f 84 23 01 00 00    	je     0x140008d52
   140008c2f:	85 c9                	test   ecx,ecx
   140008c31:	75 4a                	jne    0x140008c7d
   140008c33:	c7 05 c3 61 00 00 01 	mov    DWORD PTR [rip+0x61c3],0x1        # 0x14000ee00
   140008c3a:	00 00 00 
   140008c3d:	48 8d 15 ac 16 00 00 	lea    rdx,[rip+0x16ac]        # 0x14000a2f0
   140008c44:	48 8d 0d 8d 16 00 00 	lea    rcx,[rip+0x168d]        # 0x14000a2d8
   140008c4b:	e8 34 0a 00 00       	call   0x140009684
   140008c50:	85 c0                	test   eax,eax
   140008c52:	74 0a                	je     0x140008c5e
   140008c54:	b8 ff 00 00 00       	mov    eax,0xff
   140008c59:	e9 d9 00 00 00       	jmp    0x140008d37
   140008c5e:	48 8d 15 6b 16 00 00 	lea    rdx,[rip+0x166b]        # 0x14000a2d0
   140008c65:	48 8d 0d 54 16 00 00 	lea    rcx,[rip+0x1654]        # 0x14000a2c0
   140008c6c:	e8 0d 0a 00 00       	call   0x14000967e
   140008c71:	c7 05 85 61 00 00 02 	mov    DWORD PTR [rip+0x6185],0x2        # 0x14000ee00
   140008c78:	00 00 00 
   140008c7b:	eb 08                	jmp    0x140008c85
   140008c7d:	40 b6 01             	mov    sil,0x1
   140008c80:	40 88 74 24 20       	mov    BYTE PTR [rsp+0x20],sil
   140008c85:	8a cb                	mov    cl,bl
   140008c87:	e8 64 03 00 00       	call   0x140008ff0
   140008c8c:	e8 0b 05 00 00       	call   0x14000919c
   140008c91:	48 8b d8             	mov    rbx,rax
   140008c94:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140008c98:	74 1e                	je     0x140008cb8
   140008c9a:	48 8b c8             	mov    rcx,rax
   140008c9d:	e8 b6 02 00 00       	call   0x140008f58
   140008ca2:	84 c0                	test   al,al
   140008ca4:	74 12                	je     0x140008cb8
   140008ca6:	45 33 c0             	xor    r8d,r8d
   140008ca9:	41 8d 50 02          	lea    edx,[r8+0x2]
   140008cad:	33 c9                	xor    ecx,ecx
   140008caf:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140008cb2:	ff 15 e0 15 00 00    	call   QWORD PTR [rip+0x15e0]        # 0x14000a298
   140008cb8:	e8 e7 04 00 00       	call   0x1400091a4
   140008cbd:	48 8b d8             	mov    rbx,rax
   140008cc0:	48 83 38 00          	cmp    QWORD PTR [rax],0x0
   140008cc4:	74 14                	je     0x140008cda
   140008cc6:	48 8b c8             	mov    rcx,rax
   140008cc9:	e8 8a 02 00 00       	call   0x140008f58
   140008cce:	84 c0                	test   al,al
   140008cd0:	74 08                	je     0x140008cda
   140008cd2:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140008cd5:	e8 d4 09 00 00       	call   0x1400096ae
   140008cda:	e8 99 09 00 00       	call   0x140009678
   140008cdf:	48 8b f8             	mov    rdi,rax
   140008ce2:	e8 b5 09 00 00       	call   0x14000969c
   140008ce7:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   140008cea:	e8 a7 09 00 00       	call   0x140009696
   140008cef:	4c 8b c7             	mov    r8,rdi
   140008cf2:	48 8b d3             	mov    rdx,rbx
   140008cf5:	8b 08                	mov    ecx,DWORD PTR [rax]
   140008cf7:	e8 34 85 ff ff       	call   0x140001230
   140008cfc:	8b d8                	mov    ebx,eax
   140008cfe:	e8 05 06 00 00       	call   0x140009308
   140008d03:	84 c0                	test   al,al
   140008d05:	74 55                	je     0x140008d5c
   140008d07:	40 84 f6             	test   sil,sil
   140008d0a:	75 05                	jne    0x140008d11
   140008d0c:	e8 91 09 00 00       	call   0x1400096a2
   140008d11:	33 d2                	xor    edx,edx
   140008d13:	b1 01                	mov    cl,0x1
   140008d15:	e8 fa 02 00 00       	call   0x140009014
   140008d1a:	8b c3                	mov    eax,ebx
   140008d1c:	eb 19                	jmp    0x140008d37
   140008d1e:	8b d8                	mov    ebx,eax
   140008d20:	e8 e3 05 00 00       	call   0x140009308
   140008d25:	84 c0                	test   al,al
   140008d27:	74 3b                	je     0x140008d64
   140008d29:	80 7c 24 20 00       	cmp    BYTE PTR [rsp+0x20],0x0
   140008d2e:	75 05                	jne    0x140008d35
   140008d30:	e8 73 09 00 00       	call   0x1400096a8
   140008d35:	8b c3                	mov    eax,ebx
   140008d37:	48 8b 5c 24 40       	mov    rbx,QWORD PTR [rsp+0x40]
   140008d3c:	48 8b 74 24 48       	mov    rsi,QWORD PTR [rsp+0x48]
   140008d41:	48 83 c4 30          	add    rsp,0x30
   140008d45:	5f                   	pop    rdi
   140008d46:	c3                   	ret
   140008d47:	b9 07 00 00 00       	mov    ecx,0x7
   140008d4c:	e8 63 04 00 00       	call   0x1400091b4
   140008d51:	90                   	nop
   140008d52:	b9 07 00 00 00       	mov    ecx,0x7
   140008d57:	e8 58 04 00 00       	call   0x1400091b4
   140008d5c:	8b cb                	mov    ecx,ebx
   140008d5e:	e8 d3 08 00 00       	call   0x140009636
   140008d63:	90                   	nop
   140008d64:	8b cb                	mov    ecx,ebx
   140008d66:	e8 1f 09 00 00       	call   0x14000968a
   140008d6b:	90                   	nop
   140008d6c:	48 83 ec 28          	sub    rsp,0x28
   140008d70:	e8 1f 03 00 00       	call   0x140009094
   140008d75:	48 83 c4 28          	add    rsp,0x28
   140008d79:	e9 72 fe ff ff       	jmp    0x140008bf0
   140008d7e:	cc                   	int3
   140008d7f:	cc                   	int3
   140008d80:	48 83 ec 28          	sub    rsp,0x28
   140008d84:	4d 8b 41 38          	mov    r8,QWORD PTR [r9+0x38]
   140008d88:	48 8b ca             	mov    rcx,rdx
   140008d8b:	49 8b d1             	mov    rdx,r9
   140008d8e:	e8 0d 00 00 00       	call   0x140008da0
   140008d93:	b8 01 00 00 00       	mov    eax,0x1
   140008d98:	48 83 c4 28          	add    rsp,0x28
   140008d9c:	c3                   	ret
   140008d9d:	cc                   	int3
   140008d9e:	cc                   	int3
   140008d9f:	cc                   	int3
   140008da0:	40 53                	rex push rbx
   140008da2:	45 8b 18             	mov    r11d,DWORD PTR [r8]
   140008da5:	48 8b da             	mov    rbx,rdx
   140008da8:	41 83 e3 f8          	and    r11d,0xfffffff8
   140008dac:	4c 8b c9             	mov    r9,rcx
   140008daf:	41 f6 00 04          	test   BYTE PTR [r8],0x4
   140008db3:	4c 8b d1             	mov    r10,rcx
   140008db6:	74 13                	je     0x140008dcb
   140008db8:	41 8b 40 08          	mov    eax,DWORD PTR [r8+0x8]
   140008dbc:	4d 63 50 04          	movsxd r10,DWORD PTR [r8+0x4]
   140008dc0:	f7 d8                	neg    eax
   140008dc2:	4c 03 d1             	add    r10,rcx
   140008dc5:	48 63 c8             	movsxd rcx,eax
   140008dc8:	4c 23 d1             	and    r10,rcx
   140008dcb:	49 63 c3             	movsxd rax,r11d
   140008dce:	4a 8b 14 10          	mov    rdx,QWORD PTR [rax+r10*1]
   140008dd2:	48 8b 43 10          	mov    rax,QWORD PTR [rbx+0x10]
   140008dd6:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
   140008dd9:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140008ddd:	f6 44 01 03 0f       	test   BYTE PTR [rcx+rax*1+0x3],0xf
   140008de2:	74 0b                	je     0x140008def
   140008de4:	0f b6 44 01 03       	movzx  eax,BYTE PTR [rcx+rax*1+0x3]
   140008de9:	83 e0 f0             	and    eax,0xfffffff0
   140008dec:	4c 03 c8             	add    r9,rax
   140008def:	4c 33 ca             	xor    r9,rdx
   140008df2:	49 8b c9             	mov    rcx,r9
   140008df5:	5b                   	pop    rbx
   140008df6:	e9 05 fb ff ff       	jmp    0x140008900
   140008dfb:	cc                   	int3
   140008dfc:	48 83 61 10 00       	and    QWORD PTR [rcx+0x10],0x0
   140008e01:	48 8d 05 60 26 00 00 	lea    rax,[rip+0x2660]        # 0x14000b468
   140008e08:	48 89 41 08          	mov    QWORD PTR [rcx+0x8],rax
   140008e0c:	48 8d 05 45 26 00 00 	lea    rax,[rip+0x2645]        # 0x14000b458
   140008e13:	48 89 01             	mov    QWORD PTR [rcx],rax
   140008e16:	48 8b c1             	mov    rax,rcx
   140008e19:	c3                   	ret
   140008e1a:	cc                   	int3
   140008e1b:	cc                   	int3
   140008e1c:	48 83 ec 48          	sub    rsp,0x48
   140008e20:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140008e25:	e8 d2 ff ff ff       	call   0x140008dfc
   140008e2a:	48 8d 15 7f 3a 00 00 	lea    rdx,[rip+0x3a7f]        # 0x14000c8b0
   140008e31:	48 8d 4c 24 20       	lea    rcx,[rsp+0x20]
   140008e36:	e8 dd 07 00 00       	call   0x140009618
   140008e3b:	cc                   	int3
   140008e3c:	e9 07 08 00 00       	jmp    0x140009648
   140008e41:	cc                   	int3
   140008e42:	cc                   	int3
   140008e43:	cc                   	int3
   140008e44:	48 83 ec 28          	sub    rsp,0x28
   140008e48:	e8 9f 07 00 00       	call   0x1400095ec
   140008e4d:	85 c0                	test   eax,eax
   140008e4f:	74 21                	je     0x140008e72
   140008e51:	65 48 8b 04 25 30 00 	mov    rax,QWORD PTR gs:0x30
   140008e58:	00 00 
   140008e5a:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   140008e5e:	eb 05                	jmp    0x140008e65
   140008e60:	48 3b c8             	cmp    rcx,rax
   140008e63:	74 14                	je     0x140008e79
   140008e65:	33 c0                	xor    eax,eax
   140008e67:	f0 48 0f b1 0d 98 5f 	lock cmpxchg QWORD PTR [rip+0x5f98],rcx        # 0x14000ee08
   140008e6e:	00 00 
   140008e70:	75 ee                	jne    0x140008e60
   140008e72:	32 c0                	xor    al,al
   140008e74:	48 83 c4 28          	add    rsp,0x28
   140008e78:	c3                   	ret
   140008e79:	b0 01                	mov    al,0x1
   140008e7b:	eb f7                	jmp    0x140008e74
   140008e7d:	cc                   	int3
   140008e7e:	cc                   	int3
   140008e7f:	cc                   	int3
   140008e80:	40 53                	rex push rbx
   140008e82:	48 83 ec 20          	sub    rsp,0x20
   140008e86:	0f b6 05 83 5f 00 00 	movzx  eax,BYTE PTR [rip+0x5f83]        # 0x14000ee10
   140008e8d:	85 c9                	test   ecx,ecx
   140008e8f:	bb 01 00 00 00       	mov    ebx,0x1
   140008e94:	0f 44 c3             	cmove  eax,ebx
   140008e97:	88 05 73 5f 00 00    	mov    BYTE PTR [rip+0x5f73],al        # 0x14000ee10
   140008e9d:	e8 9e 05 00 00       	call   0x140009440
   140008ea2:	e8 bd 02 00 00       	call   0x140009164
   140008ea7:	84 c0                	test   al,al
   140008ea9:	75 04                	jne    0x140008eaf
   140008eab:	32 c0                	xor    al,al
   140008ead:	eb 14                	jmp    0x140008ec3
   140008eaf:	e8 b0 02 00 00       	call   0x140009164
   140008eb4:	84 c0                	test   al,al
   140008eb6:	75 09                	jne    0x140008ec1
   140008eb8:	33 c9                	xor    ecx,ecx
   140008eba:	e8 a5 02 00 00       	call   0x140009164
   140008ebf:	eb ea                	jmp    0x140008eab
   140008ec1:	8a c3                	mov    al,bl
   140008ec3:	48 83 c4 20          	add    rsp,0x20
   140008ec7:	5b                   	pop    rbx
   140008ec8:	c3                   	ret
   140008ec9:	cc                   	int3
   140008eca:	cc                   	int3
   140008ecb:	cc                   	int3
   140008ecc:	40 53                	rex push rbx
   140008ece:	48 83 ec 20          	sub    rsp,0x20
   140008ed2:	80 3d 38 5f 00 00 00 	cmp    BYTE PTR [rip+0x5f38],0x0        # 0x14000ee11
   140008ed9:	8b d9                	mov    ebx,ecx
   140008edb:	75 67                	jne    0x140008f44
   140008edd:	83 f9 01             	cmp    ecx,0x1
   140008ee0:	77 6a                	ja     0x140008f4c
   140008ee2:	e8 05 07 00 00       	call   0x1400095ec
   140008ee7:	85 c0                	test   eax,eax
   140008ee9:	74 28                	je     0x140008f13
   140008eeb:	85 db                	test   ebx,ebx
   140008eed:	75 24                	jne    0x140008f13
   140008eef:	48 8d 0d 22 5f 00 00 	lea    rcx,[rip+0x5f22]        # 0x14000ee18
   140008ef6:	e8 cb 07 00 00       	call   0x1400096c6
   140008efb:	85 c0                	test   eax,eax
   140008efd:	75 10                	jne    0x140008f0f
   140008eff:	48 8d 0d 2a 5f 00 00 	lea    rcx,[rip+0x5f2a]        # 0x14000ee30
   140008f06:	e8 bb 07 00 00       	call   0x1400096c6
   140008f0b:	85 c0                	test   eax,eax
   140008f0d:	74 2e                	je     0x140008f3d
   140008f0f:	32 c0                	xor    al,al
   140008f11:	eb 33                	jmp    0x140008f46
   140008f13:	66 0f 6f 05 75 25 00 	movdqa xmm0,XMMWORD PTR [rip+0x2575]        # 0x14000b490
   140008f1a:	00 
   140008f1b:	48 83 c8 ff          	or     rax,0xffffffffffffffff
   140008f1f:	f3 0f 7f 05 f1 5e 00 	movdqu XMMWORD PTR [rip+0x5ef1],xmm0        # 0x14000ee18
   140008f26:	00 
   140008f27:	48 89 05 fa 5e 00 00 	mov    QWORD PTR [rip+0x5efa],rax        # 0x14000ee28
   140008f2e:	f3 0f 7f 05 fa 5e 00 	movdqu XMMWORD PTR [rip+0x5efa],xmm0        # 0x14000ee30
   140008f35:	00 
   140008f36:	48 89 05 03 5f 00 00 	mov    QWORD PTR [rip+0x5f03],rax        # 0x14000ee40
   140008f3d:	c6 05 cd 5e 00 00 01 	mov    BYTE PTR [rip+0x5ecd],0x1        # 0x14000ee11
   140008f44:	b0 01                	mov    al,0x1
   140008f46:	48 83 c4 20          	add    rsp,0x20
   140008f4a:	5b                   	pop    rbx
   140008f4b:	c3                   	ret
   140008f4c:	b9 05 00 00 00       	mov    ecx,0x5
   140008f51:	e8 5e 02 00 00       	call   0x1400091b4
   140008f56:	cc                   	int3
   140008f57:	cc                   	int3
   140008f58:	48 83 ec 18          	sub    rsp,0x18
   140008f5c:	4c 8b c1             	mov    r8,rcx
   140008f5f:	b8 4d 5a 00 00       	mov    eax,0x5a4d
   140008f64:	66 39 05 95 70 ff ff 	cmp    WORD PTR [rip+0xffffffffffff7095],ax        # 0x140000000
   140008f6b:	75 78                	jne    0x140008fe5
   140008f6d:	48 63 0d c8 70 ff ff 	movsxd rcx,DWORD PTR [rip+0xffffffffffff70c8]        # 0x14000003c
   140008f74:	48 8d 15 85 70 ff ff 	lea    rdx,[rip+0xffffffffffff7085]        # 0x140000000
   140008f7b:	48 03 ca             	add    rcx,rdx
   140008f7e:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   140008f84:	75 5f                	jne    0x140008fe5
   140008f86:	b8 0b 02 00 00       	mov    eax,0x20b
   140008f8b:	66 39 41 18          	cmp    WORD PTR [rcx+0x18],ax
   140008f8f:	75 54                	jne    0x140008fe5
   140008f91:	4c 2b c2             	sub    r8,rdx
   140008f94:	0f b7 41 14          	movzx  eax,WORD PTR [rcx+0x14]
   140008f98:	48 8d 51 18          	lea    rdx,[rcx+0x18]
   140008f9c:	48 03 d0             	add    rdx,rax
   140008f9f:	0f b7 41 06          	movzx  eax,WORD PTR [rcx+0x6]
   140008fa3:	48 8d 0c 80          	lea    rcx,[rax+rax*4]
   140008fa7:	4c 8d 0c ca          	lea    r9,[rdx+rcx*8]
   140008fab:	48 89 14 24          	mov    QWORD PTR [rsp],rdx
   140008faf:	49 3b d1             	cmp    rdx,r9
   140008fb2:	74 18                	je     0x140008fcc
   140008fb4:	8b 4a 0c             	mov    ecx,DWORD PTR [rdx+0xc]
   140008fb7:	4c 3b c1             	cmp    r8,rcx
   140008fba:	72 0a                	jb     0x140008fc6
   140008fbc:	8b 42 08             	mov    eax,DWORD PTR [rdx+0x8]
   140008fbf:	03 c1                	add    eax,ecx
   140008fc1:	4c 3b c0             	cmp    r8,rax
   140008fc4:	72 08                	jb     0x140008fce
   140008fc6:	48 83 c2 28          	add    rdx,0x28
   140008fca:	eb df                	jmp    0x140008fab
   140008fcc:	33 d2                	xor    edx,edx
   140008fce:	48 85 d2             	test   rdx,rdx
   140008fd1:	75 04                	jne    0x140008fd7
   140008fd3:	32 c0                	xor    al,al
   140008fd5:	eb 14                	jmp    0x140008feb
   140008fd7:	83 7a 24 00          	cmp    DWORD PTR [rdx+0x24],0x0
   140008fdb:	7d 04                	jge    0x140008fe1
   140008fdd:	32 c0                	xor    al,al
   140008fdf:	eb 0a                	jmp    0x140008feb
   140008fe1:	b0 01                	mov    al,0x1
   140008fe3:	eb 06                	jmp    0x140008feb
   140008fe5:	32 c0                	xor    al,al
   140008fe7:	eb 02                	jmp    0x140008feb
   140008fe9:	32 c0                	xor    al,al
   140008feb:	48 83 c4 18          	add    rsp,0x18
   140008fef:	c3                   	ret
   140008ff0:	40 53                	rex push rbx
   140008ff2:	48 83 ec 20          	sub    rsp,0x20
   140008ff6:	8a d9                	mov    bl,cl
   140008ff8:	e8 ef 05 00 00       	call   0x1400095ec
   140008ffd:	33 d2                	xor    edx,edx
   140008fff:	85 c0                	test   eax,eax
   140009001:	74 0b                	je     0x14000900e
   140009003:	84 db                	test   bl,bl
   140009005:	75 07                	jne    0x14000900e
   140009007:	48 87 15 fa 5d 00 00 	xchg   QWORD PTR [rip+0x5dfa],rdx        # 0x14000ee08
   14000900e:	48 83 c4 20          	add    rsp,0x20
   140009012:	5b                   	pop    rbx
   140009013:	c3                   	ret
   140009014:	40 53                	rex push rbx
   140009016:	48 83 ec 20          	sub    rsp,0x20
   14000901a:	80 3d ef 5d 00 00 00 	cmp    BYTE PTR [rip+0x5def],0x0        # 0x14000ee10
   140009021:	8a d9                	mov    bl,cl
   140009023:	74 04                	je     0x140009029
   140009025:	84 d2                	test   dl,dl
   140009027:	75 0c                	jne    0x140009035
   140009029:	e8 36 01 00 00       	call   0x140009164
   14000902e:	8a cb                	mov    cl,bl
   140009030:	e8 2f 01 00 00       	call   0x140009164
   140009035:	b0 01                	mov    al,0x1
   140009037:	48 83 c4 20          	add    rsp,0x20
   14000903b:	5b                   	pop    rbx
   14000903c:	c3                   	ret
   14000903d:	cc                   	int3
   14000903e:	cc                   	int3
   14000903f:	cc                   	int3
   140009040:	40 53                	rex push rbx
   140009042:	48 83 ec 20          	sub    rsp,0x20
   140009046:	48 83 3d ca 5d 00 00 	cmp    QWORD PTR [rip+0x5dca],0xffffffffffffffff        # 0x14000ee18
   14000904d:	ff 
   14000904e:	48 8b d9             	mov    rbx,rcx
   140009051:	75 07                	jne    0x14000905a
   140009053:	e8 7a 06 00 00       	call   0x1400096d2
   140009058:	eb 0f                	jmp    0x140009069
   14000905a:	48 8b d3             	mov    rdx,rbx
   14000905d:	48 8d 0d b4 5d 00 00 	lea    rcx,[rip+0x5db4]        # 0x14000ee18
   140009064:	e8 63 06 00 00       	call   0x1400096cc
   140009069:	33 d2                	xor    edx,edx
   14000906b:	85 c0                	test   eax,eax
   14000906d:	48 0f 44 d3          	cmove  rdx,rbx
   140009071:	48 8b c2             	mov    rax,rdx
   140009074:	48 83 c4 20          	add    rsp,0x20
   140009078:	5b                   	pop    rbx
   140009079:	c3                   	ret
   14000907a:	cc                   	int3
   14000907b:	cc                   	int3
   14000907c:	48 83 ec 28          	sub    rsp,0x28
   140009080:	e8 bb ff ff ff       	call   0x140009040
   140009085:	48 f7 d8             	neg    rax
   140009088:	1b c0                	sbb    eax,eax
   14000908a:	f7 d8                	neg    eax
   14000908c:	ff c8                	dec    eax
   14000908e:	48 83 c4 28          	add    rsp,0x28
   140009092:	c3                   	ret
   140009093:	cc                   	int3
   140009094:	48 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],rbx
   140009099:	55                   	push   rbp
   14000909a:	48 8b ec             	mov    rbp,rsp
   14000909d:	48 83 ec 20          	sub    rsp,0x20
   1400090a1:	48 8b 05 f8 56 00 00 	mov    rax,QWORD PTR [rip+0x56f8]        # 0x14000e7a0
   1400090a8:	48 bb 32 a2 df 2d 99 	movabs rbx,0x2b992ddfa232
   1400090af:	2b 00 00 
   1400090b2:	48 3b c3             	cmp    rax,rbx
   1400090b5:	75 74                	jne    0x14000912b
   1400090b7:	48 83 65 18 00       	and    QWORD PTR [rbp+0x18],0x0
   1400090bc:	48 8d 4d 18          	lea    rcx,[rbp+0x18]
   1400090c0:	ff 15 42 0f 00 00    	call   QWORD PTR [rip+0xf42]        # 0x14000a008
   1400090c6:	48 8b 45 18          	mov    rax,QWORD PTR [rbp+0x18]
   1400090ca:	48 89 45 10          	mov    QWORD PTR [rbp+0x10],rax
   1400090ce:	ff 15 9c 0f 00 00    	call   QWORD PTR [rip+0xf9c]        # 0x14000a070
   1400090d4:	8b c0                	mov    eax,eax
   1400090d6:	48 31 45 10          	xor    QWORD PTR [rbp+0x10],rax
   1400090da:	ff 15 48 0f 00 00    	call   QWORD PTR [rip+0xf48]        # 0x14000a028
   1400090e0:	8b c0                	mov    eax,eax
   1400090e2:	48 8d 4d 20          	lea    rcx,[rbp+0x20]
   1400090e6:	48 31 45 10          	xor    QWORD PTR [rbp+0x10],rax
   1400090ea:	ff 15 40 0f 00 00    	call   QWORD PTR [rip+0xf40]        # 0x14000a030
   1400090f0:	8b 45 20             	mov    eax,DWORD PTR [rbp+0x20]
   1400090f3:	48 8d 4d 10          	lea    rcx,[rbp+0x10]
   1400090f7:	48 c1 e0 20          	shl    rax,0x20
   1400090fb:	48 33 45 20          	xor    rax,QWORD PTR [rbp+0x20]
   1400090ff:	48 33 45 10          	xor    rax,QWORD PTR [rbp+0x10]
   140009103:	48 33 c1             	xor    rax,rcx
   140009106:	48 b9 ff ff ff ff ff 	movabs rcx,0xffffffffffff
   14000910d:	ff 00 00 
   140009110:	48 23 c1             	and    rax,rcx
   140009113:	48 b9 33 a2 df 2d 99 	movabs rcx,0x2b992ddfa233
   14000911a:	2b 00 00 
   14000911d:	48 3b c3             	cmp    rax,rbx
   140009120:	48 0f 44 c1          	cmove  rax,rcx
   140009124:	48 89 05 75 56 00 00 	mov    QWORD PTR [rip+0x5675],rax        # 0x14000e7a0
   14000912b:	48 8b 5c 24 48       	mov    rbx,QWORD PTR [rsp+0x48]
   140009130:	48 f7 d0             	not    rax
   140009133:	48 89 05 6e 56 00 00 	mov    QWORD PTR [rip+0x566e],rax        # 0x14000e7a8
   14000913a:	48 83 c4 20          	add    rsp,0x20
   14000913e:	5d                   	pop    rbp
   14000913f:	c3                   	ret
   140009140:	33 c0                	xor    eax,eax
   140009142:	c3                   	ret
   140009143:	cc                   	int3
   140009144:	b8 01 00 00 00       	mov    eax,0x1
   140009149:	c3                   	ret
   14000914a:	cc                   	int3
   14000914b:	cc                   	int3
   14000914c:	b8 00 40 00 00       	mov    eax,0x4000
   140009151:	c3                   	ret
   140009152:	cc                   	int3
   140009153:	cc                   	int3
   140009154:	48 8d 0d f5 5c 00 00 	lea    rcx,[rip+0x5cf5]        # 0x14000ee50
   14000915b:	48 ff 25 ae 0e 00 00 	rex.W jmp QWORD PTR [rip+0xeae]        # 0x14000a010
   140009162:	cc                   	int3
   140009163:	cc                   	int3
   140009164:	b0 01                	mov    al,0x1
   140009166:	c3                   	ret
   140009167:	cc                   	int3
   140009168:	c2 00 00             	ret    0x0
   14000916b:	cc                   	int3
   14000916c:	48 8d 05 ed 5c 00 00 	lea    rax,[rip+0x5ced]        # 0x14000ee60
   140009173:	c3                   	ret
   140009174:	48 83 ec 28          	sub    rsp,0x28
   140009178:	e8 83 7e ff ff       	call   0x140001000
   14000917d:	48 83 08 24          	or     QWORD PTR [rax],0x24
   140009181:	e8 e6 ff ff ff       	call   0x14000916c
   140009186:	48 83 08 02          	or     QWORD PTR [rax],0x2
   14000918a:	48 83 c4 28          	add    rsp,0x28
   14000918e:	c3                   	ret
   14000918f:	cc                   	int3
   140009190:	33 c0                	xor    eax,eax
   140009192:	39 05 1c 56 00 00    	cmp    DWORD PTR [rip+0x561c],eax        # 0x14000e7b4
   140009198:	0f 94 c0             	sete   al
   14000919b:	c3                   	ret
   14000919c:	48 8d 05 dd 5c 00 00 	lea    rax,[rip+0x5cdd]        # 0x14000ee80
   1400091a3:	c3                   	ret
   1400091a4:	48 8d 05 cd 5c 00 00 	lea    rax,[rip+0x5ccd]        # 0x14000ee78
   1400091ab:	c3                   	ret
   1400091ac:	83 25 b5 5c 00 00 00 	and    DWORD PTR [rip+0x5cb5],0x0        # 0x14000ee68
   1400091b3:	c3                   	ret
   1400091b4:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400091b9:	55                   	push   rbp
   1400091ba:	48 8d ac 24 40 fb ff 	lea    rbp,[rsp-0x4c0]
   1400091c1:	ff 
   1400091c2:	48 81 ec c0 05 00 00 	sub    rsp,0x5c0
   1400091c9:	8b d9                	mov    ebx,ecx
   1400091cb:	b9 17 00 00 00       	mov    ecx,0x17
   1400091d0:	ff 15 62 0e 00 00    	call   QWORD PTR [rip+0xe62]        # 0x14000a038
   1400091d6:	85 c0                	test   eax,eax
   1400091d8:	74 04                	je     0x1400091de
   1400091da:	8b cb                	mov    ecx,ebx
   1400091dc:	cd 29                	int    0x29
   1400091de:	b9 03 00 00 00       	mov    ecx,0x3
   1400091e3:	e8 c4 ff ff ff       	call   0x1400091ac
   1400091e8:	33 d2                	xor    edx,edx
   1400091ea:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1400091ee:	41 b8 d0 04 00 00    	mov    r8d,0x4d0
   1400091f4:	e8 13 04 00 00       	call   0x14000960c
   1400091f9:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   1400091fd:	ff 15 fd 0d 00 00    	call   QWORD PTR [rip+0xdfd]        # 0x14000a000
   140009203:	48 8b 9d e8 00 00 00 	mov    rbx,QWORD PTR [rbp+0xe8]
   14000920a:	48 8d 95 d8 04 00 00 	lea    rdx,[rbp+0x4d8]
   140009211:	48 8b cb             	mov    rcx,rbx
   140009214:	45 33 c0             	xor    r8d,r8d
   140009217:	ff 15 4b 0e 00 00    	call   QWORD PTR [rip+0xe4b]        # 0x14000a068
   14000921d:	48 85 c0             	test   rax,rax
   140009220:	74 3c                	je     0x14000925e
   140009222:	48 83 64 24 38 00    	and    QWORD PTR [rsp+0x38],0x0
   140009228:	48 8d 8d e0 04 00 00 	lea    rcx,[rbp+0x4e0]
   14000922f:	48 8b 95 d8 04 00 00 	mov    rdx,QWORD PTR [rbp+0x4d8]
   140009236:	4c 8b c8             	mov    r9,rax
   140009239:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   14000923e:	4c 8b c3             	mov    r8,rbx
   140009241:	48 8d 8d e8 04 00 00 	lea    rcx,[rbp+0x4e8]
   140009248:	48 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],rcx
   14000924d:	48 8d 4d f0          	lea    rcx,[rbp-0x10]
   140009251:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   140009256:	33 c9                	xor    ecx,ecx
   140009258:	ff 15 02 0e 00 00    	call   QWORD PTR [rip+0xe02]        # 0x14000a060
   14000925e:	48 8b 85 c8 04 00 00 	mov    rax,QWORD PTR [rbp+0x4c8]
   140009265:	48 8d 4c 24 50       	lea    rcx,[rsp+0x50]
   14000926a:	48 89 85 e8 00 00 00 	mov    QWORD PTR [rbp+0xe8],rax
   140009271:	33 d2                	xor    edx,edx
   140009273:	48 8d 85 c8 04 00 00 	lea    rax,[rbp+0x4c8]
   14000927a:	41 b8 98 00 00 00    	mov    r8d,0x98
   140009280:	48 83 c0 08          	add    rax,0x8
   140009284:	48 89 85 88 00 00 00 	mov    QWORD PTR [rbp+0x88],rax
   14000928b:	e8 7c 03 00 00       	call   0x14000960c
   140009290:	48 8b 85 c8 04 00 00 	mov    rax,QWORD PTR [rbp+0x4c8]
   140009297:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   14000929c:	c7 44 24 50 15 00 00 	mov    DWORD PTR [rsp+0x50],0x40000015
   1400092a3:	40 
   1400092a4:	c7 44 24 54 01 00 00 	mov    DWORD PTR [rsp+0x54],0x1
   1400092ab:	00 
   1400092ac:	ff 15 66 0d 00 00    	call   QWORD PTR [rip+0xd66]        # 0x14000a018
   1400092b2:	83 f8 01             	cmp    eax,0x1
   1400092b5:	48 8d 44 24 50       	lea    rax,[rsp+0x50]
   1400092ba:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   1400092bf:	48 8d 45 f0          	lea    rax,[rbp-0x10]
   1400092c3:	0f 94 c3             	sete   bl
   1400092c6:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   1400092cb:	33 c9                	xor    ecx,ecx
   1400092cd:	ff 15 7d 0d 00 00    	call   QWORD PTR [rip+0xd7d]        # 0x14000a050
   1400092d3:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   1400092d8:	ff 15 7a 0d 00 00    	call   QWORD PTR [rip+0xd7a]        # 0x14000a058
   1400092de:	85 c0                	test   eax,eax
   1400092e0:	75 0c                	jne    0x1400092ee
   1400092e2:	84 db                	test   bl,bl
   1400092e4:	75 08                	jne    0x1400092ee
   1400092e6:	8d 48 03             	lea    ecx,[rax+0x3]
   1400092e9:	e8 be fe ff ff       	call   0x1400091ac
   1400092ee:	48 8b 9c 24 d0 05 00 	mov    rbx,QWORD PTR [rsp+0x5d0]
   1400092f5:	00 
   1400092f6:	48 81 c4 c0 05 00 00 	add    rsp,0x5c0
   1400092fd:	5d                   	pop    rbp
   1400092fe:	c3                   	ret
   1400092ff:	cc                   	int3
   140009300:	e9 3b fe ff ff       	jmp    0x140009140
   140009305:	cc                   	int3
   140009306:	cc                   	int3
   140009307:	cc                   	int3
   140009308:	48 83 ec 28          	sub    rsp,0x28
   14000930c:	33 c9                	xor    ecx,ecx
   14000930e:	ff 15 0c 0d 00 00    	call   QWORD PTR [rip+0xd0c]        # 0x14000a020
   140009314:	48 85 c0             	test   rax,rax
   140009317:	74 39                	je     0x140009352
   140009319:	b9 4d 5a 00 00       	mov    ecx,0x5a4d
   14000931e:	66 39 08             	cmp    WORD PTR [rax],cx
   140009321:	75 2f                	jne    0x140009352
   140009323:	48 63 48 3c          	movsxd rcx,DWORD PTR [rax+0x3c]
   140009327:	48 03 c8             	add    rcx,rax
   14000932a:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   140009330:	75 20                	jne    0x140009352
   140009332:	b8 0b 02 00 00       	mov    eax,0x20b
   140009337:	66 39 41 18          	cmp    WORD PTR [rcx+0x18],ax
   14000933b:	75 15                	jne    0x140009352
   14000933d:	83 b9 84 00 00 00 0e 	cmp    DWORD PTR [rcx+0x84],0xe
   140009344:	76 0c                	jbe    0x140009352
   140009346:	83 b9 f8 00 00 00 00 	cmp    DWORD PTR [rcx+0xf8],0x0
   14000934d:	0f 95 c0             	setne  al
   140009350:	eb 02                	jmp    0x140009354
   140009352:	32 c0                	xor    al,al
   140009354:	48 83 c4 28          	add    rsp,0x28
   140009358:	c3                   	ret
   140009359:	cc                   	int3
   14000935a:	cc                   	int3
   14000935b:	cc                   	int3
   14000935c:	48 8d 0d 09 00 00 00 	lea    rcx,[rip+0x9]        # 0x14000936c
   140009363:	48 ff 25 e6 0c 00 00 	rex.W jmp QWORD PTR [rip+0xce6]        # 0x14000a050
   14000936a:	cc                   	int3
   14000936b:	cc                   	int3
   14000936c:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140009371:	57                   	push   rdi
   140009372:	48 83 ec 20          	sub    rsp,0x20
   140009376:	48 8b 19             	mov    rbx,QWORD PTR [rcx]
   140009379:	48 8b f9             	mov    rdi,rcx
   14000937c:	81 3b 63 73 6d e0    	cmp    DWORD PTR [rbx],0xe06d7363
   140009382:	75 1c                	jne    0x1400093a0
   140009384:	83 7b 18 04          	cmp    DWORD PTR [rbx+0x18],0x4
   140009388:	75 16                	jne    0x1400093a0
   14000938a:	8b 53 20             	mov    edx,DWORD PTR [rbx+0x20]
   14000938d:	8d 82 e0 fa 6c e6    	lea    eax,[rdx-0x19930520]
   140009393:	83 f8 02             	cmp    eax,0x2
   140009396:	76 15                	jbe    0x1400093ad
   140009398:	81 fa 00 40 99 01    	cmp    edx,0x1994000
   14000939e:	74 0d                	je     0x1400093ad
   1400093a0:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400093a5:	33 c0                	xor    eax,eax
   1400093a7:	48 83 c4 20          	add    rsp,0x20
   1400093ab:	5f                   	pop    rdi
   1400093ac:	c3                   	ret
   1400093ad:	e8 6c 02 00 00       	call   0x14000961e
   1400093b2:	48 89 18             	mov    QWORD PTR [rax],rbx
   1400093b5:	48 8b 5f 08          	mov    rbx,QWORD PTR [rdi+0x8]
   1400093b9:	e8 66 02 00 00       	call   0x140009624
   1400093be:	48 89 18             	mov    QWORD PTR [rax],rbx
   1400093c1:	e8 12 03 00 00       	call   0x1400096d8
   1400093c6:	cc                   	int3
   1400093c7:	cc                   	int3
   1400093c8:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   1400093cd:	57                   	push   rdi
   1400093ce:	48 83 ec 20          	sub    rsp,0x20
   1400093d2:	48 8d 1d 5f 29 00 00 	lea    rbx,[rip+0x295f]        # 0x14000bd38
   1400093d9:	48 8d 3d 58 29 00 00 	lea    rdi,[rip+0x2958]        # 0x14000bd38
   1400093e0:	eb 12                	jmp    0x1400093f4
   1400093e2:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400093e5:	48 85 c0             	test   rax,rax
   1400093e8:	74 06                	je     0x1400093f0
   1400093ea:	ff 15 a8 0e 00 00    	call   QWORD PTR [rip+0xea8]        # 0x14000a298
   1400093f0:	48 83 c3 08          	add    rbx,0x8
   1400093f4:	48 3b df             	cmp    rbx,rdi
   1400093f7:	72 e9                	jb     0x1400093e2
   1400093f9:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   1400093fe:	48 83 c4 20          	add    rsp,0x20
   140009402:	5f                   	pop    rdi
   140009403:	c3                   	ret
   140009404:	48 89 5c 24 08       	mov    QWORD PTR [rsp+0x8],rbx
   140009409:	57                   	push   rdi
   14000940a:	48 83 ec 20          	sub    rsp,0x20
   14000940e:	48 8d 1d 33 29 00 00 	lea    rbx,[rip+0x2933]        # 0x14000bd48
   140009415:	48 8d 3d 2c 29 00 00 	lea    rdi,[rip+0x292c]        # 0x14000bd48
   14000941c:	eb 12                	jmp    0x140009430
   14000941e:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140009421:	48 85 c0             	test   rax,rax
   140009424:	74 06                	je     0x14000942c
   140009426:	ff 15 6c 0e 00 00    	call   QWORD PTR [rip+0xe6c]        # 0x14000a298
   14000942c:	48 83 c3 08          	add    rbx,0x8
   140009430:	48 3b df             	cmp    rbx,rdi
   140009433:	72 e9                	jb     0x14000941e
   140009435:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   14000943a:	48 83 c4 20          	add    rsp,0x20
   14000943e:	5f                   	pop    rdi
   14000943f:	c3                   	ret
   140009440:	48 89 5c 24 10       	mov    QWORD PTR [rsp+0x10],rbx
   140009445:	48 89 74 24 18       	mov    QWORD PTR [rsp+0x18],rsi
   14000944a:	57                   	push   rdi
   14000944b:	48 83 ec 10          	sub    rsp,0x10
   14000944f:	33 c0                	xor    eax,eax
   140009451:	33 c9                	xor    ecx,ecx
   140009453:	0f a2                	cpuid
   140009455:	44 8b c1             	mov    r8d,ecx
   140009458:	45 33 db             	xor    r11d,r11d
   14000945b:	44 8b d2             	mov    r10d,edx
   14000945e:	41 81 f0 6e 74 65 6c 	xor    r8d,0x6c65746e
   140009465:	41 81 f2 69 6e 65 49 	xor    r10d,0x49656e69
   14000946c:	44 8b cb             	mov    r9d,ebx
   14000946f:	8b f0                	mov    esi,eax
   140009471:	33 c9                	xor    ecx,ecx
   140009473:	41 8d 43 01          	lea    eax,[r11+0x1]
   140009477:	45 0b d0             	or     r10d,r8d
   14000947a:	0f a2                	cpuid
   14000947c:	41 81 f1 47 65 6e 75 	xor    r9d,0x756e6547
   140009483:	89 04 24             	mov    DWORD PTR [rsp],eax
   140009486:	45 0b d1             	or     r10d,r9d
   140009489:	89 5c 24 04          	mov    DWORD PTR [rsp+0x4],ebx
   14000948d:	8b f9                	mov    edi,ecx
   14000948f:	89 4c 24 08          	mov    DWORD PTR [rsp+0x8],ecx
   140009493:	89 54 24 0c          	mov    DWORD PTR [rsp+0xc],edx
   140009497:	75 5b                	jne    0x1400094f4
   140009499:	48 83 0d 27 53 00 00 	or     QWORD PTR [rip+0x5327],0xffffffffffffffff        # 0x14000e7c8
   1400094a0:	ff 
   1400094a1:	25 f0 3f ff 0f       	and    eax,0xfff3ff0
   1400094a6:	48 c7 05 0f 53 00 00 	mov    QWORD PTR [rip+0x530f],0x8000        # 0x14000e7c0
   1400094ad:	00 80 00 00 
   1400094b1:	3d c0 06 01 00       	cmp    eax,0x106c0
   1400094b6:	74 28                	je     0x1400094e0
   1400094b8:	3d 60 06 02 00       	cmp    eax,0x20660
   1400094bd:	74 21                	je     0x1400094e0
   1400094bf:	3d 70 06 02 00       	cmp    eax,0x20670
   1400094c4:	74 1a                	je     0x1400094e0
   1400094c6:	05 b0 f9 fc ff       	add    eax,0xfffcf9b0
   1400094cb:	83 f8 20             	cmp    eax,0x20
   1400094ce:	77 24                	ja     0x1400094f4
   1400094d0:	48 b9 01 00 01 00 01 	movabs rcx,0x100010001
   1400094d7:	00 00 00 
   1400094da:	48 0f a3 c1          	bt     rcx,rax
   1400094de:	73 14                	jae    0x1400094f4
   1400094e0:	44 8b 05 85 59 00 00 	mov    r8d,DWORD PTR [rip+0x5985]        # 0x14000ee6c
   1400094e7:	41 83 c8 01          	or     r8d,0x1
   1400094eb:	44 89 05 7a 59 00 00 	mov    DWORD PTR [rip+0x597a],r8d        # 0x14000ee6c
   1400094f2:	eb 07                	jmp    0x1400094fb
   1400094f4:	44 8b 05 71 59 00 00 	mov    r8d,DWORD PTR [rip+0x5971]        # 0x14000ee6c
   1400094fb:	b8 07 00 00 00       	mov    eax,0x7
   140009500:	44 8d 48 fb          	lea    r9d,[rax-0x5]
   140009504:	3b f0                	cmp    esi,eax
   140009506:	7c 26                	jl     0x14000952e
   140009508:	33 c9                	xor    ecx,ecx
   14000950a:	0f a2                	cpuid
   14000950c:	89 04 24             	mov    DWORD PTR [rsp],eax
   14000950f:	44 8b db             	mov    r11d,ebx
   140009512:	89 5c 24 04          	mov    DWORD PTR [rsp+0x4],ebx
   140009516:	89 4c 24 08          	mov    DWORD PTR [rsp+0x8],ecx
   14000951a:	89 54 24 0c          	mov    DWORD PTR [rsp+0xc],edx
   14000951e:	0f ba e3 09          	bt     ebx,0x9
   140009522:	73 0a                	jae    0x14000952e
   140009524:	45 0b c1             	or     r8d,r9d
   140009527:	44 89 05 3e 59 00 00 	mov    DWORD PTR [rip+0x593e],r8d        # 0x14000ee6c
   14000952e:	c7 05 80 52 00 00 01 	mov    DWORD PTR [rip+0x5280],0x1        # 0x14000e7b8
   140009535:	00 00 00 
   140009538:	44 89 0d 7d 52 00 00 	mov    DWORD PTR [rip+0x527d],r9d        # 0x14000e7bc
   14000953f:	0f ba e7 14          	bt     edi,0x14
   140009543:	0f 83 91 00 00 00    	jae    0x1400095da
   140009549:	44 89 0d 68 52 00 00 	mov    DWORD PTR [rip+0x5268],r9d        # 0x14000e7b8
   140009550:	bb 06 00 00 00       	mov    ebx,0x6
   140009555:	89 1d 61 52 00 00    	mov    DWORD PTR [rip+0x5261],ebx        # 0x14000e7bc
   14000955b:	0f ba e7 1b          	bt     edi,0x1b
   14000955f:	73 79                	jae    0x1400095da
   140009561:	0f ba e7 1c          	bt     edi,0x1c
   140009565:	73 73                	jae    0x1400095da
   140009567:	33 c9                	xor    ecx,ecx
   140009569:	0f 01 d0             	xgetbv
   14000956c:	48 c1 e2 20          	shl    rdx,0x20
   140009570:	48 0b d0             	or     rdx,rax
   140009573:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140009578:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   14000957d:	22 c3                	and    al,bl
   14000957f:	3a c3                	cmp    al,bl
   140009581:	75 57                	jne    0x1400095da
   140009583:	8b 05 33 52 00 00    	mov    eax,DWORD PTR [rip+0x5233]        # 0x14000e7bc
   140009589:	83 c8 08             	or     eax,0x8
   14000958c:	c7 05 22 52 00 00 03 	mov    DWORD PTR [rip+0x5222],0x3        # 0x14000e7b8
   140009593:	00 00 00 
   140009596:	89 05 20 52 00 00    	mov    DWORD PTR [rip+0x5220],eax        # 0x14000e7bc
   14000959c:	41 f6 c3 20          	test   r11b,0x20
   1400095a0:	74 38                	je     0x1400095da
   1400095a2:	83 c8 20             	or     eax,0x20
   1400095a5:	c7 05 09 52 00 00 05 	mov    DWORD PTR [rip+0x5209],0x5        # 0x14000e7b8
   1400095ac:	00 00 00 
   1400095af:	89 05 07 52 00 00    	mov    DWORD PTR [rip+0x5207],eax        # 0x14000e7bc
   1400095b5:	b8 00 00 03 d0       	mov    eax,0xd0030000
   1400095ba:	44 23 d8             	and    r11d,eax
   1400095bd:	44 3b d8             	cmp    r11d,eax
   1400095c0:	75 18                	jne    0x1400095da
   1400095c2:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   1400095c7:	24 e0                	and    al,0xe0
   1400095c9:	3c e0                	cmp    al,0xe0
   1400095cb:	75 0d                	jne    0x1400095da
   1400095cd:	83 0d e8 51 00 00 40 	or     DWORD PTR [rip+0x51e8],0x40        # 0x14000e7bc
   1400095d4:	89 1d de 51 00 00    	mov    DWORD PTR [rip+0x51de],ebx        # 0x14000e7b8
   1400095da:	48 8b 5c 24 28       	mov    rbx,QWORD PTR [rsp+0x28]
   1400095df:	33 c0                	xor    eax,eax
   1400095e1:	48 8b 74 24 30       	mov    rsi,QWORD PTR [rsp+0x30]
   1400095e6:	48 83 c4 10          	add    rsp,0x10
   1400095ea:	5f                   	pop    rdi
   1400095eb:	c3                   	ret
   1400095ec:	33 c0                	xor    eax,eax
   1400095ee:	39 05 dc 51 00 00    	cmp    DWORD PTR [rip+0x51dc],eax        # 0x14000e7d0
   1400095f4:	0f 95 c0             	setne  al
   1400095f7:	c3                   	ret
   1400095f8:	cc                   	int3
   1400095f9:	cc                   	int3
   1400095fa:	cc                   	int3
   1400095fb:	cc                   	int3
   1400095fc:	cc                   	int3
   1400095fd:	cc                   	int3
   1400095fe:	cc                   	int3
   1400095ff:	cc                   	int3
   140009600:	ff 25 4a 0b 00 00    	jmp    QWORD PTR [rip+0xb4a]        # 0x14000a150
   140009606:	ff 25 1c 0b 00 00    	jmp    QWORD PTR [rip+0xb1c]        # 0x14000a128
   14000960c:	ff 25 06 0b 00 00    	jmp    QWORD PTR [rip+0xb06]        # 0x14000a118
   140009612:	ff 25 f8 0a 00 00    	jmp    QWORD PTR [rip+0xaf8]        # 0x14000a110
   140009618:	ff 25 ea 0a 00 00    	jmp    QWORD PTR [rip+0xaea]        # 0x14000a108
   14000961e:	ff 25 dc 0a 00 00    	jmp    QWORD PTR [rip+0xadc]        # 0x14000a100
   140009624:	ff 25 0e 0b 00 00    	jmp    QWORD PTR [rip+0xb0e]        # 0x14000a138
   14000962a:	ff 25 30 0c 00 00    	jmp    QWORD PTR [rip+0xc30]        # 0x14000a260
   140009630:	ff 25 42 0c 00 00    	jmp    QWORD PTR [rip+0xc42]        # 0x14000a278
   140009636:	ff 25 04 0c 00 00    	jmp    QWORD PTR [rip+0xc04]        # 0x14000a240
   14000963c:	ff 25 0e 0c 00 00    	jmp    QWORD PTR [rip+0xc0e]        # 0x14000a250
   140009642:	ff 25 30 0b 00 00    	jmp    QWORD PTR [rip+0xb30]        # 0x14000a178
   140009648:	ff 25 1a 0b 00 00    	jmp    QWORD PTR [rip+0xb1a]        # 0x14000a168
   14000964e:	ff 25 1c 0b 00 00    	jmp    QWORD PTR [rip+0xb1c]        # 0x14000a170
   140009654:	ff 25 06 0b 00 00    	jmp    QWORD PTR [rip+0xb06]        # 0x14000a160
   14000965a:	ff 25 80 0b 00 00    	jmp    QWORD PTR [rip+0xb80]        # 0x14000a1e0
   140009660:	ff 25 b2 0b 00 00    	jmp    QWORD PTR [rip+0xbb2]        # 0x14000a218
   140009666:	ff 25 34 0b 00 00    	jmp    QWORD PTR [rip+0xb34]        # 0x14000a1a0
   14000966c:	ff 25 96 0b 00 00    	jmp    QWORD PTR [rip+0xb96]        # 0x14000a208
   140009672:	ff 25 88 0b 00 00    	jmp    QWORD PTR [rip+0xb88]        # 0x14000a200
   140009678:	ff 25 b2 0b 00 00    	jmp    QWORD PTR [rip+0xbb2]        # 0x14000a230
   14000967e:	ff 25 a4 0b 00 00    	jmp    QWORD PTR [rip+0xba4]        # 0x14000a228
   140009684:	ff 25 96 0b 00 00    	jmp    QWORD PTR [rip+0xb96]        # 0x14000a220
   14000968a:	ff 25 48 0b 00 00    	jmp    QWORD PTR [rip+0xb48]        # 0x14000a1d8
   140009690:	ff 25 da 0b 00 00    	jmp    QWORD PTR [rip+0xbda]        # 0x14000a270
   140009696:	ff 25 5c 0b 00 00    	jmp    QWORD PTR [rip+0xb5c]        # 0x14000a1f8
   14000969c:	ff 25 4e 0b 00 00    	jmp    QWORD PTR [rip+0xb4e]        # 0x14000a1f0
   1400096a2:	ff 25 18 0b 00 00    	jmp    QWORD PTR [rip+0xb18]        # 0x14000a1c0
   1400096a8:	ff 25 62 0b 00 00    	jmp    QWORD PTR [rip+0xb62]        # 0x14000a210
   1400096ae:	ff 25 34 0b 00 00    	jmp    QWORD PTR [rip+0xb34]        # 0x14000a1e8
   1400096b4:	ff 25 d6 0a 00 00    	jmp    QWORD PTR [rip+0xad6]        # 0x14000a190
   1400096ba:	ff 25 c0 0a 00 00    	jmp    QWORD PTR [rip+0xac0]        # 0x14000a180
   1400096c0:	ff 25 a2 0b 00 00    	jmp    QWORD PTR [rip+0xba2]        # 0x14000a268
   1400096c6:	ff 25 e4 0a 00 00    	jmp    QWORD PTR [rip+0xae4]        # 0x14000a1b0
   1400096cc:	ff 25 e6 0a 00 00    	jmp    QWORD PTR [rip+0xae6]        # 0x14000a1b8
   1400096d2:	ff 25 f0 0a 00 00    	jmp    QWORD PTR [rip+0xaf0]        # 0x14000a1c8
   1400096d8:	ff 25 f2 0a 00 00    	jmp    QWORD PTR [rip+0xaf2]        # 0x14000a1d0
   1400096de:	cc                   	int3
   1400096df:	cc                   	int3
   1400096e0:	48 8b c4             	mov    rax,rsp
   1400096e3:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
   1400096e7:	48 89 68 10          	mov    QWORD PTR [rax+0x10],rbp
   1400096eb:	48 89 70 18          	mov    QWORD PTR [rax+0x18],rsi
   1400096ef:	48 89 78 20          	mov    QWORD PTR [rax+0x20],rdi
   1400096f3:	41 56                	push   r14
   1400096f5:	48 83 ec 20          	sub    rsp,0x20
   1400096f9:	49 8b 59 38          	mov    rbx,QWORD PTR [r9+0x38]
   1400096fd:	48 8b f2             	mov    rsi,rdx
   140009700:	4d 8b f0             	mov    r14,r8
   140009703:	48 8b e9             	mov    rbp,rcx
   140009706:	49 8b d1             	mov    rdx,r9
   140009709:	48 8b ce             	mov    rcx,rsi
   14000970c:	49 8b f9             	mov    rdi,r9
   14000970f:	4c 8d 43 04          	lea    r8,[rbx+0x4]
   140009713:	e8 88 f6 ff ff       	call   0x140008da0
   140009718:	8b 45 04             	mov    eax,DWORD PTR [rbp+0x4]
   14000971b:	24 66                	and    al,0x66
   14000971d:	f6 d8                	neg    al
   14000971f:	b8 01 00 00 00       	mov    eax,0x1
   140009724:	45 1b c0             	sbb    r8d,r8d
   140009727:	41 f7 d8             	neg    r8d
   14000972a:	44 03 c0             	add    r8d,eax
   14000972d:	44 85 43 04          	test   DWORD PTR [rbx+0x4],r8d
   140009731:	74 11                	je     0x140009744
   140009733:	4c 8b cf             	mov    r9,rdi
   140009736:	4d 8b c6             	mov    r8,r14
   140009739:	48 8b d6             	mov    rdx,rsi
   14000973c:	48 8b cd             	mov    rcx,rbp
   14000973f:	e8 bc fe ff ff       	call   0x140009600
   140009744:	48 8b 5c 24 30       	mov    rbx,QWORD PTR [rsp+0x30]
   140009749:	48 8b 6c 24 38       	mov    rbp,QWORD PTR [rsp+0x38]
   14000974e:	48 8b 74 24 40       	mov    rsi,QWORD PTR [rsp+0x40]
   140009753:	48 8b 7c 24 48       	mov    rdi,QWORD PTR [rsp+0x48]
   140009758:	48 83 c4 20          	add    rsp,0x20
   14000975c:	41 5e                	pop    r14
   14000975e:	c3                   	ret
   14000975f:	ff 25 bb 09 00 00    	jmp    QWORD PTR [rip+0x9bb]        # 0x14000a120
   140009765:	cc                   	int3
   140009766:	cc                   	int3
   140009767:	cc                   	int3
   140009768:	cc                   	int3
   140009769:	cc                   	int3
   14000976a:	cc                   	int3
   14000976b:	cc                   	int3
   14000976c:	cc                   	int3
   14000976d:	cc                   	int3
   14000976e:	cc                   	int3
   14000976f:	cc                   	int3
   140009770:	cc                   	int3
   140009771:	cc                   	int3
   140009772:	cc                   	int3
   140009773:	cc                   	int3
   140009774:	cc                   	int3
   140009775:	cc                   	int3
   140009776:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000977d:	00 00 00 
   140009780:	ff e0                	jmp    rax
   140009782:	cc                   	int3
   140009783:	cc                   	int3
   140009784:	cc                   	int3
   140009785:	cc                   	int3
   140009786:	cc                   	int3
   140009787:	cc                   	int3
   140009788:	cc                   	int3
   140009789:	cc                   	int3
   14000978a:	cc                   	int3
   14000978b:	cc                   	int3
   14000978c:	cc                   	int3
   14000978d:	cc                   	int3
   14000978e:	cc                   	int3
   14000978f:	cc                   	int3
   140009790:	cc                   	int3
   140009791:	cc                   	int3
   140009792:	cc                   	int3
   140009793:	cc                   	int3
   140009794:	cc                   	int3
   140009795:	cc                   	int3
   140009796:	66 66 0f 1f 84 00 00 	data16 nop WORD PTR [rax+rax*1+0x0]
   14000979d:	00 00 00 
   1400097a0:	ff 25 f2 0a 00 00    	jmp    QWORD PTR [rip+0xaf2]        # 0x14000a298
   1400097a6:	cc                   	int3
   1400097a7:	cc                   	int3
   1400097a8:	cc                   	int3
   1400097a9:	cc                   	int3
   1400097aa:	cc                   	int3
   1400097ab:	cc                   	int3
   1400097ac:	cc                   	int3
   1400097ad:	cc                   	int3
   1400097ae:	cc                   	int3
   1400097af:	cc                   	int3
   1400097b0:	48 8d 8a a0 00 00 00 	lea    rcx,[rdx+0xa0]
   1400097b7:	e9 04 7e ff ff       	jmp    0x1400015c0
   1400097bc:	cc                   	int3
   1400097bd:	cc                   	int3
   1400097be:	cc                   	int3
   1400097bf:	cc                   	int3
   1400097c0:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   1400097c7:	e9 84 7e ff ff       	jmp    0x140001650
   1400097cc:	48 8d 8a 20 00 00 00 	lea    rcx,[rdx+0x20]
   1400097d3:	e9 a8 7e ff ff       	jmp    0x140001680
   1400097d8:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   1400097dd:	55                   	push   rbp
   1400097de:	48 83 ec 20          	sub    rsp,0x20
   1400097e2:	48 8b ea             	mov    rbp,rdx
   1400097e5:	48 8b 55 60          	mov    rdx,QWORD PTR [rbp+0x60]
   1400097e9:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   1400097ec:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   1400097f0:	48 03 ca             	add    rcx,rdx
   1400097f3:	41 b0 01             	mov    r8b,0x1
   1400097f6:	ba 04 00 00 00       	mov    edx,0x4
   1400097fb:	ff 15 8f 08 00 00    	call   QWORD PTR [rip+0x88f]        # 0x14000a090
   140009801:	90                   	nop
   140009802:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140009809:	00 00 00 
   14000980c:	48 83 c4 20          	add    rsp,0x20
   140009810:	5d                   	pop    rbp
   140009811:	c3                   	ret
   140009812:	cc                   	int3
   140009813:	cc                   	int3
   140009814:	cc                   	int3
   140009815:	cc                   	int3
   140009816:	cc                   	int3
   140009817:	cc                   	int3
   140009818:	cc                   	int3
   140009819:	cc                   	int3
   14000981a:	cc                   	int3
   14000981b:	cc                   	int3
   14000981c:	cc                   	int3
   14000981d:	cc                   	int3
   14000981e:	cc                   	int3
   14000981f:	cc                   	int3
   140009820:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140009827:	e9 24 7e ff ff       	jmp    0x140001650
   14000982c:	48 8d 8a 30 00 00 00 	lea    rcx,[rdx+0x30]
   140009833:	e9 e8 7d ff ff       	jmp    0x140001620
   140009838:	48 89 54 24 10       	mov    QWORD PTR [rsp+0x10],rdx
   14000983d:	55                   	push   rbp
   14000983e:	48 83 ec 20          	sub    rsp,0x20
   140009842:	48 8b ea             	mov    rbp,rdx
   140009845:	48 8b 55 28          	mov    rdx,QWORD PTR [rbp+0x28]
   140009849:	48 8b 02             	mov    rax,QWORD PTR [rdx]
   14000984c:	48 63 48 04          	movsxd rcx,DWORD PTR [rax+0x4]
   140009850:	48 03 ca             	add    rcx,rdx
   140009853:	41 b0 01             	mov    r8b,0x1
   140009856:	ba 04 00 00 00       	mov    edx,0x4
   14000985b:	ff 15 2f 08 00 00    	call   QWORD PTR [rip+0x82f]        # 0x14000a090
   140009861:	90                   	nop
   140009862:	48 b8 00 00 00 00 00 	movabs rax,0x0
   140009869:	00 00 00 
   14000986c:	48 83 c4 20          	add    rsp,0x20
   140009870:	5d                   	pop    rbp
   140009871:	c3                   	ret
   140009872:	cc                   	int3
   140009873:	40 55                	rex push rbp
   140009875:	48 83 ec 20          	sub    rsp,0x20
   140009879:	48 8b ea             	mov    rbp,rdx
   14000987c:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000987f:	48 8b d1             	mov    rdx,rcx
   140009882:	8b 08                	mov    ecx,DWORD PTR [rax]
   140009884:	e8 d1 fd ff ff       	call   0x14000965a
   140009889:	90                   	nop
   14000988a:	48 83 c4 20          	add    rsp,0x20
   14000988e:	5d                   	pop    rbp
   14000988f:	c3                   	ret
   140009890:	cc                   	int3
   140009891:	40 55                	rex push rbp
   140009893:	48 8b ea             	mov    rbp,rdx
   140009896:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   140009899:	33 c9                	xor    ecx,ecx
   14000989b:	81 38 05 00 00 c0    	cmp    DWORD PTR [rax],0xc0000005
   1400098a1:	0f 94 c1             	sete   cl
   1400098a4:	8b c1                	mov    eax,ecx
   1400098a6:	5d                   	pop    rbp
   1400098a7:	c3                   	ret
   1400098a8:	cc                   	int3
