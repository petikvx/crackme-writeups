
original/crackme.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001490 <main>:
   140001490:	55                   	push   rbp
   140001491:	48 89 e5             	mov    rbp,rsp
   140001494:	48 b9 00 30 00 40 01 	movabs rcx,0x140003000
   14000149b:	00 00 00 
   14000149e:	e8 7d 14 00 00       	call   140002920 <printf>
   1400014a3:	48 b9 2d 30 00 40 01 	movabs rcx,0x14000302d
   1400014aa:	00 00 00 
   1400014ad:	48 ba 30 70 00 40 01 	movabs rdx,0x140007030
   1400014b4:	00 00 00 
   1400014b7:	e8 6c 14 00 00       	call   140002928 <scanf>
   1400014bc:	48 b9 30 70 00 40 01 	movabs rcx,0x140007030
   1400014c3:	00 00 00 
   1400014c6:	48 ba 11 30 00 40 01 	movabs rdx,0x140003011
   1400014cd:	00 00 00 
   1400014d0:	e8 6b 14 00 00       	call   140002940 <strcmp>
   1400014d5:	85 c0                	test   eax,eax
   1400014d7:	75 11                	jne    1400014ea <main.wrong>
   1400014d9:	48 b9 1a 30 00 40 01 	movabs rcx,0x14000301a
   1400014e0:	00 00 00 
   1400014e3:	e8 38 14 00 00       	call   140002920 <printf>
   1400014e8:	eb 0f                	jmp    1400014f9 <main.exit>

00000001400014ea <main.wrong>:
   1400014ea:	48 b9 23 30 00 40 01 	movabs rcx,0x140003023
   1400014f1:	00 00 00 
   1400014f4:	e8 27 14 00 00       	call   140002920 <printf>

00000001400014f9 <main.exit>:
   1400014f9:	e8 0a 14 00 00       	call   140002908 <getchar>
   1400014fe:	31 c0                	xor    eax,eax
   140001500:	5d                   	pop    rbp
   140001501:	c3                   	ret
   140001502:	66 2e 0f 1f 84 00 00 	cs nop WORD PTR [rax+rax*1+0x0]
   140001509:	00 00 00 
   14000150c:	0f 1f 40 00          	nop    DWORD PTR [rax+0x0]
