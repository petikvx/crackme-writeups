
easiest.exe:     file format pei-x86-64


Disassembly of section .text:

0000000140001000 <__mingw_invalidParameterHandler>:
   140001000:	c3                   	ret

0000000140001001 <__tmainCRTStartup>:
   140001001:	41 57                	push   r15
   140001003:	41 56                	push   r14
   140001005:	41 55                	push   r13
   140001007:	41 54                	push   r12
   140001009:	55                   	push   rbp
   14000100a:	57                   	push   rdi
   14000100b:	56                   	push   rsi
   14000100c:	53                   	push   rbx
   14000100d:	48 83 ec 48          	sub    rsp,0x48
   140001011:	b8 30 00 00 00       	mov    eax,0x30
   140001016:	65 67 48 8b 00       	mov    rax,QWORD PTR gs:[eax]
   14000101b:	48 8b 58 08          	mov    rbx,QWORD PTR [rax+0x8]
   14000101f:	48 8b 3d 3a 02 01 00 	mov    rdi,QWORD PTR [rip+0x1023a]        # 140011260 <__imp_Sleep>
   140001026:	48 8b 35 03 ba 00 00 	mov    rsi,QWORD PTR [rip+0xba03]        # 14000ca30 <.refptr.__native_startup_lock>
   14000102d:	31 c0                	xor    eax,eax
   14000102f:	f0 48 0f b1 1e       	lock cmpxchg QWORD PTR [rsi],rbx
   140001034:	48 85 c0             	test   rax,rax
   140001037:	74 0e                	je     140001047 <__tmainCRTStartup+0x46>
   140001039:	48 39 c3             	cmp    rbx,rax
   14000103c:	74 0d                	je     14000104b <__tmainCRTStartup+0x4a>
   14000103e:	b9 e8 03 00 00       	mov    ecx,0x3e8
   140001043:	ff d7                	call   rdi
   140001045:	eb df                	jmp    140001026 <__tmainCRTStartup+0x25>
   140001047:	31 ed                	xor    ebp,ebp
   140001049:	eb 05                	jmp    140001050 <__tmainCRTStartup+0x4f>
   14000104b:	bd 01 00 00 00       	mov    ebp,0x1
   140001050:	48 8b 3d e9 b9 00 00 	mov    rdi,QWORD PTR [rip+0xb9e9]        # 14000ca40 <.refptr.__native_startup_state>
   140001057:	b9 1f 00 00 00       	mov    ecx,0x1f
   14000105c:	8b 07                	mov    eax,DWORD PTR [rdi]
   14000105e:	ff c8                	dec    eax
   140001060:	0f 84 0a 01 00 00    	je     140001170 <__tmainCRTStartup+0x16f>
   140001066:	8b 07                	mov    eax,DWORD PTR [rdi]
   140001068:	85 c0                	test   eax,eax
   14000106a:	0f 85 2d 02 00 00    	jne    14000129d <__tmainCRTStartup+0x29c>
   140001070:	c7 07 01 00 00 00    	mov    DWORD PTR [rdi],0x1
   140001076:	e8 f4 06 00 00       	call   14000176f <_pei386_runtime_relocator>
   14000107b:	48 8d 0d 9e 09 00 00 	lea    rcx,[rip+0x99e]        # 140001a20 <_gnu_exception_handler>
   140001082:	ff 15 d0 01 01 00    	call   QWORD PTR [rip+0x101d0]        # 140011258 <__imp_SetUnhandledExceptionFilter>
   140001088:	48 8b 15 91 b9 00 00 	mov    rdx,QWORD PTR [rip+0xb991]        # 14000ca20 <.refptr.__mingw_oldexcpt_handler>
   14000108f:	48 8d 0d 6a ff ff ff 	lea    rcx,[rip+0xffffffffffffff6a]        # 140001000 <__mingw_invalidParameterHandler>
   140001096:	48 89 02             	mov    QWORD PTR [rdx],rax
   140001099:	e8 3a 9a 00 00       	call   14000aad8 <_set_invalid_parameter_handler>
   14000109e:	e8 cd 0c 00 00       	call   140001d70 <_fpreset>
   1400010a3:	48 8b 05 46 b9 00 00 	mov    rax,QWORD PTR [rip+0xb946]        # 14000c9f0 <.refptr.__mingw_initltsdrot_force>
   1400010aa:	48 8b 0d 8f b8 00 00 	mov    rcx,QWORD PTR [rip+0xb88f]        # 14000c940 <.refptr.__ImageBase>
   1400010b1:	31 d2                	xor    edx,edx
   1400010b3:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400010b9:	48 8b 05 40 b9 00 00 	mov    rax,QWORD PTR [rip+0xb940]        # 14000ca00 <.refptr.__mingw_initltsdyn_force>
   1400010c0:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400010c6:	48 8b 05 43 b9 00 00 	mov    rax,QWORD PTR [rip+0xb943]        # 14000ca10 <.refptr.__mingw_initltssuo_force>
   1400010cd:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   1400010d3:	66 81 39 4d 5a       	cmp    WORD PTR [rcx],0x5a4d
   1400010d8:	75 47                	jne    140001121 <__tmainCRTStartup+0x120>
   1400010da:	48 63 41 3c          	movsxd rax,DWORD PTR [rcx+0x3c]
   1400010de:	48 01 c8             	add    rax,rcx
   1400010e1:	81 38 50 45 00 00    	cmp    DWORD PTR [rax],0x4550
   1400010e7:	75 38                	jne    140001121 <__tmainCRTStartup+0x120>
   1400010e9:	8b 48 18             	mov    ecx,DWORD PTR [rax+0x18]
   1400010ec:	66 81 f9 0b 01       	cmp    cx,0x10b
   1400010f1:	74 09                	je     1400010fc <__tmainCRTStartup+0xfb>
   1400010f3:	66 81 f9 0b 02       	cmp    cx,0x20b
   1400010f8:	74 11                	je     14000110b <__tmainCRTStartup+0x10a>
   1400010fa:	eb 25                	jmp    140001121 <__tmainCRTStartup+0x120>
   1400010fc:	83 78 74 0e          	cmp    DWORD PTR [rax+0x74],0xe
   140001100:	76 1f                	jbe    140001121 <__tmainCRTStartup+0x120>
   140001102:	83 b8 e8 00 00 00 00 	cmp    DWORD PTR [rax+0xe8],0x0
   140001109:	eb 10                	jmp    14000111b <__tmainCRTStartup+0x11a>
   14000110b:	83 b8 84 00 00 00 0e 	cmp    DWORD PTR [rax+0x84],0xe
   140001112:	76 0d                	jbe    140001121 <__tmainCRTStartup+0x120>
   140001114:	83 b8 f8 00 00 00 00 	cmp    DWORD PTR [rax+0xf8],0x0
   14000111b:	0f 95 c2             	setne  dl
   14000111e:	0f b6 d2             	movzx  edx,dl
   140001121:	48 8b 05 b8 b8 00 00 	mov    rax,QWORD PTR [rip+0xb8b8]        # 14000c9e0 <.refptr.__mingw_app_type>
   140001128:	89 15 da ee 00 00    	mov    DWORD PTR [rip+0xeeda],edx        # 140010008 <managedapp>
   14000112e:	b9 02 00 00 00       	mov    ecx,0x2
   140001133:	83 38 00             	cmp    DWORD PTR [rax],0x0
   140001136:	75 05                	jne    14000113d <__tmainCRTStartup+0x13c>
   140001138:	b9 01 00 00 00       	mov    ecx,0x1
   14000113d:	e8 06 9a 00 00       	call   14000ab48 <__set_app_type>
   140001142:	e8 99 98 00 00       	call   14000a9e0 <__p__fmode>
   140001147:	48 8b 15 82 b9 00 00 	mov    rdx,QWORD PTR [rip+0xb982]        # 14000cad0 <.refptr._fmode>
   14000114e:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001150:	89 10                	mov    DWORD PTR [rax],edx
   140001152:	e8 99 98 00 00       	call   14000a9f0 <__p__commode>
   140001157:	48 8b 15 52 b9 00 00 	mov    rdx,QWORD PTR [rip+0xb952]        # 14000cab0 <.refptr._commode>
   14000115e:	8b 12                	mov    edx,DWORD PTR [rdx]
   140001160:	89 10                	mov    DWORD PTR [rax],edx
   140001162:	e8 29 03 00 00       	call   140001490 <_setargv>
   140001167:	85 c0                	test   eax,eax
   140001169:	79 0a                	jns    140001175 <__tmainCRTStartup+0x174>
   14000116b:	b9 08 00 00 00       	mov    ecx,0x8
   140001170:	e8 e3 99 00 00       	call   14000ab58 <_amsg_exit>
   140001175:	48 8b 05 a4 b7 00 00 	mov    rax,QWORD PTR [rip+0xb7a4]        # 14000c920 <.refptr._MINGW_INSTALL_DEBUG_MATHERR>
   14000117c:	83 38 01             	cmp    DWORD PTR [rax],0x1
   14000117f:	75 0c                	jne    14000118d <__tmainCRTStartup+0x18c>
   140001181:	48 8d 0d 88 03 00 00 	lea    rcx,[rip+0x388]        # 140001510 <_matherr>
   140001188:	e8 84 08 00 00       	call   140001a11 <__mingw_setusermatherr>
   14000118d:	48 8b 05 fc b7 00 00 	mov    rax,QWORD PTR [rip+0xb7fc]        # 14000c990 <.refptr.__globallocalestatus>
   140001194:	83 38 ff             	cmp    DWORD PTR [rax],0xffffffff
   140001197:	75 0a                	jne    1400011a3 <__tmainCRTStartup+0x1a2>
   140001199:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   14000119e:	e8 4d 99 00 00       	call   14000aaf0 <_configthreadlocale>
   1400011a3:	48 8b 15 f6 b8 00 00 	mov    rdx,QWORD PTR [rip+0xb8f6]        # 14000caa0 <.refptr.__xi_z>
   1400011aa:	48 8b 0d df b8 00 00 	mov    rcx,QWORD PTR [rip+0xb8df]        # 14000ca90 <.refptr.__xi_a>
   1400011b1:	e8 fa 97 00 00       	call   14000a9b0 <_initterm_e>
   1400011b6:	85 c0                	test   eax,eax
   1400011b8:	0f 85 57 01 00 00    	jne    140001315 <__tmainCRTStartup+0x314>
   1400011be:	48 8b 05 3b b9 00 00 	mov    rax,QWORD PTR [rip+0xb93b]        # 14000cb00 <.refptr._newmode>
   1400011c5:	4c 8d 05 44 ee 00 00 	lea    r8,[rip+0xee44]        # 140010010 <envp>
   1400011cc:	48 8d 15 45 ee 00 00 	lea    rdx,[rip+0xee45]        # 140010018 <argv>
   1400011d3:	48 8d 0d 46 ee 00 00 	lea    rcx,[rip+0xee46]        # 140010020 <argc>
   1400011da:	8b 00                	mov    eax,DWORD PTR [rax]
   1400011dc:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   1400011e0:	48 8d 44 24 3c       	lea    rax,[rsp+0x3c]
   1400011e5:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400011ea:	48 8b 05 cf b8 00 00 	mov    rax,QWORD PTR [rip+0xb8cf]        # 14000cac0 <.refptr._dowildcard>
   1400011f1:	44 8b 08             	mov    r9d,DWORD PTR [rax]
   1400011f4:	e8 3f 99 00 00       	call   14000ab38 <__getmainargs>
   1400011f9:	85 c0                	test   eax,eax
   1400011fb:	0f 88 6a ff ff ff    	js     14000116b <__tmainCRTStartup+0x16a>
   140001201:	44 8b 25 18 ee 00 00 	mov    r12d,DWORD PTR [rip+0xee18]        # 140010020 <argc>
   140001208:	41 8d 4c 24 01       	lea    ecx,[r12+0x1]
   14000120d:	48 63 c9             	movsxd rcx,ecx
   140001210:	48 c1 e1 03          	shl    rcx,0x3
   140001214:	e8 d7 99 00 00       	call   14000abf0 <malloc>
   140001219:	49 89 c7             	mov    r15,rax
   14000121c:	48 85 c0             	test   rax,rax
   14000121f:	0f 84 46 ff ff ff    	je     14000116b <__tmainCRTStartup+0x16a>
   140001225:	48 8b 35 ec ed 00 00 	mov    rsi,QWORD PTR [rip+0xedec]        # 140010018 <argv>
   14000122c:	49 89 c5             	mov    r13,rax
   14000122f:	31 db                	xor    ebx,ebx
   140001231:	41 39 dc             	cmp    r12d,ebx
   140001234:	7e 3a                	jle    140001270 <__tmainCRTStartup+0x26f>
   140001236:	48 8b 0c de          	mov    rcx,QWORD PTR [rsi+rbx*8]
   14000123a:	e8 e1 99 00 00       	call   14000ac20 <strlen>
   14000123f:	4c 8d 70 01          	lea    r14,[rax+0x1]
   140001243:	4c 89 f1             	mov    rcx,r14
   140001246:	e8 a5 99 00 00       	call   14000abf0 <malloc>
   14000124b:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   14000124f:	48 85 c0             	test   rax,rax
   140001252:	0f 84 13 ff ff ff    	je     14000116b <__tmainCRTStartup+0x16a>
   140001258:	48 8b 14 de          	mov    rdx,QWORD PTR [rsi+rbx*8]
   14000125c:	4d 89 f0             	mov    r8,r14
   14000125f:	48 89 c1             	mov    rcx,rax
   140001262:	49 83 c5 08          	add    r13,0x8
   140001266:	48 ff c3             	inc    rbx
   140001269:	e8 8a 99 00 00       	call   14000abf8 <memcpy>
   14000126e:	eb c1                	jmp    140001231 <__tmainCRTStartup+0x230>
   140001270:	31 c0                	xor    eax,eax
   140001272:	48 8b 15 07 b8 00 00 	mov    rdx,QWORD PTR [rip+0xb807]        # 14000ca80 <.refptr.__xc_z>
   140001279:	48 8b 0d f0 b7 00 00 	mov    rcx,QWORD PTR [rip+0xb7f0]        # 14000ca70 <.refptr.__xc_a>
   140001280:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   140001284:	4c 89 3d 8d ed 00 00 	mov    QWORD PTR [rip+0xed8d],r15        # 140010018 <argv>
   14000128b:	e8 e8 98 00 00       	call   14000ab78 <_initterm>
   140001290:	e8 d7 01 00 00       	call   14000146c <__main>
   140001295:	c7 07 02 00 00 00    	mov    DWORD PTR [rdi],0x2
   14000129b:	eb 0a                	jmp    1400012a7 <__tmainCRTStartup+0x2a6>
   14000129d:	c7 05 5d ed 00 00 01 	mov    DWORD PTR [rip+0xed5d],0x1        # 140010004 <has_cctor>
   1400012a4:	00 00 00 
   1400012a7:	85 ed                	test   ebp,ebp
   1400012a9:	75 0c                	jne    1400012b7 <__tmainCRTStartup+0x2b6>
   1400012ab:	48 8b 35 7e b7 00 00 	mov    rsi,QWORD PTR [rip+0xb77e]        # 14000ca30 <.refptr.__native_startup_lock>
   1400012b2:	31 c0                	xor    eax,eax
   1400012b4:	48 87 06             	xchg   QWORD PTR [rsi],rax
   1400012b7:	48 8b 05 c2 b6 00 00 	mov    rax,QWORD PTR [rip+0xb6c2]        # 14000c980 <.refptr.__dyn_tls_init_callback>
   1400012be:	48 8b 00             	mov    rax,QWORD PTR [rax]
   1400012c1:	48 85 c0             	test   rax,rax
   1400012c4:	74 0c                	je     1400012d2 <__tmainCRTStartup+0x2d1>
   1400012c6:	45 31 c0             	xor    r8d,r8d
   1400012c9:	ba 02 00 00 00       	mov    edx,0x2
   1400012ce:	31 c9                	xor    ecx,ecx
   1400012d0:	ff d0                	call   rax
   1400012d2:	e8 29 97 00 00       	call   14000aa00 <__p___initenv>
   1400012d7:	4c 8b 05 32 ed 00 00 	mov    r8,QWORD PTR [rip+0xed32]        # 140010010 <envp>
   1400012de:	8b 0d 3c ed 00 00    	mov    ecx,DWORD PTR [rip+0xed3c]        # 140010020 <argc>
   1400012e4:	4c 89 00             	mov    QWORD PTR [rax],r8
   1400012e7:	48 8b 15 2a ed 00 00 	mov    rdx,QWORD PTR [rip+0xed2a]        # 140010018 <argv>
   1400012ee:	e8 8d 00 00 00       	call   140001380 <main>
   1400012f3:	83 3d 0e ed 00 00 00 	cmp    DWORD PTR [rip+0xed0e],0x0        # 140010008 <managedapp>
   1400012fa:	89 c3                	mov    ebx,eax
   1400012fc:	75 07                	jne    140001305 <__tmainCRTStartup+0x304>
   1400012fe:	89 c1                	mov    ecx,eax
   140001300:	e8 a3 98 00 00       	call   14000aba8 <exit>
   140001305:	83 3d f8 ec 00 00 00 	cmp    DWORD PTR [rip+0xecf8],0x0        # 140010004 <has_cctor>
   14000130c:	75 0c                	jne    14000131a <__tmainCRTStartup+0x319>
   14000130e:	e8 4d 98 00 00       	call   14000ab60 <_cexit>
   140001313:	eb 05                	jmp    14000131a <__tmainCRTStartup+0x319>
   140001315:	bb ff 00 00 00       	mov    ebx,0xff
   14000131a:	89 d8                	mov    eax,ebx
   14000131c:	48 83 c4 48          	add    rsp,0x48
   140001320:	5b                   	pop    rbx
   140001321:	5e                   	pop    rsi
   140001322:	5f                   	pop    rdi
   140001323:	5d                   	pop    rbp
   140001324:	41 5c                	pop    r12
   140001326:	41 5d                	pop    r13
   140001328:	41 5e                	pop    r14
   14000132a:	41 5f                	pop    r15
   14000132c:	c3                   	ret

000000014000132d <WinMainCRTStartup>:
   14000132d:	48 83 ec 28          	sub    rsp,0x28

0000000140001331 <.l_startw>:
   140001331:	48 8b 05 a8 b6 00 00 	mov    rax,QWORD PTR [rip+0xb6a8]        # 14000c9e0 <.refptr.__mingw_app_type>
   140001338:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000133e:	e8 be fc ff ff       	call   140001001 <__tmainCRTStartup>
   140001343:	90                   	nop

0000000140001344 <.l_endw>:
   140001344:	90                   	nop
   140001345:	48 83 c4 28          	add    rsp,0x28
   140001349:	c3                   	ret

000000014000134a <mainCRTStartup>:
   14000134a:	48 83 ec 28          	sub    rsp,0x28

000000014000134e <.l_start>:
   14000134e:	48 8b 05 8b b6 00 00 	mov    rax,QWORD PTR [rip+0xb68b]        # 14000c9e0 <.refptr.__mingw_app_type>
   140001355:	31 d2                	xor    edx,edx
   140001357:	89 10                	mov    DWORD PTR [rax],edx
   140001359:	e8 a3 fc ff ff       	call   140001001 <__tmainCRTStartup>
   14000135e:	90                   	nop

000000014000135f <.l_end>:
   14000135f:	90                   	nop
   140001360:	48 83 c4 28          	add    rsp,0x28
   140001364:	c3                   	ret

0000000140001365 <atexit>:
   140001365:	e9 2e 98 00 00       	jmp    14000ab98 <_crt_atexit>
   14000136a:	90                   	nop
   14000136b:	90                   	nop
   14000136c:	90                   	nop
   14000136d:	90                   	nop
   14000136e:	90                   	nop
   14000136f:	90                   	nop

0000000140001370 <__gcc_register_frame>:
   140001370:	48 8d 0d 05 00 00 00 	lea    rcx,[rip+0x5]        # 14000137c <__gcc_deregister_frame>
   140001377:	e9 e9 ff ff ff       	jmp    140001365 <atexit>

000000014000137c <__gcc_deregister_frame>:
   14000137c:	c3                   	ret
   14000137d:	90                   	nop
   14000137e:	90                   	nop
   14000137f:	90                   	nop

0000000140001380 <main>:
   140001380:	55                   	push   rbp
   140001381:	48 89 e5             	mov    rbp,rsp
   140001384:	48 83 ec 30          	sub    rsp,0x30
   140001388:	e8 df 00 00 00       	call   14000146c <__main>
   14000138d:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [rbp-0x4],0x0
   140001394:	48 8d 05 65 ac 00 00 	lea    rax,[rip+0xac65]        # 14000c000 <.rdata>
   14000139b:	48 89 c1             	mov    rcx,rax
   14000139e:	e8 6d 0c 00 00       	call   140002010 <__mingw_printf>
   1400013a3:	48 8d 45 fc          	lea    rax,[rbp-0x4]
   1400013a7:	48 8d 0d 5e ac 00 00 	lea    rcx,[rip+0xac5e]        # 14000c00c <.rdata+0xc>
   1400013ae:	48 89 c2             	mov    rdx,rax
   1400013b1:	e8 da 0c 00 00       	call   140002090 <__mingw_scanf>
   1400013b6:	8b 45 fc             	mov    eax,DWORD PTR [rbp-0x4]
   1400013b9:	3d 79 21 00 00       	cmp    eax,0x2179
   1400013be:	75 11                	jne    1400013d1 <main+0x51>
   1400013c0:	48 8d 05 48 ac 00 00 	lea    rax,[rip+0xac48]        # 14000c00f <.rdata+0xf>
   1400013c7:	48 89 c1             	mov    rcx,rax
   1400013ca:	e8 41 0c 00 00       	call   140002010 <__mingw_printf>
   1400013cf:	eb 0f                	jmp    1400013e0 <main+0x60>
   1400013d1:	48 8d 05 4b ac 00 00 	lea    rax,[rip+0xac4b]        # 14000c023 <.rdata+0x23>
   1400013d8:	48 89 c1             	mov    rcx,rax
   1400013db:	e8 30 0c 00 00       	call   140002010 <__mingw_printf>
   1400013e0:	48 8b 05 11 ff 00 00 	mov    rax,QWORD PTR [rip+0xff11]        # 1400112f8 <__imp__getch>
   1400013e7:	ff d0                	call   rax
   1400013e9:	b8 00 00 00 00       	mov    eax,0x0
   1400013ee:	48 83 c4 30          	add    rsp,0x30
   1400013f2:	5d                   	pop    rbp
   1400013f3:	c3                   	ret
   1400013f4:	90                   	nop
   1400013f5:	90                   	nop
   1400013f6:	90                   	nop
   1400013f7:	90                   	nop
   1400013f8:	90                   	nop
   1400013f9:	90                   	nop
   1400013fa:	90                   	nop
   1400013fb:	90                   	nop
   1400013fc:	90                   	nop
   1400013fd:	90                   	nop
   1400013fe:	90                   	nop
   1400013ff:	90                   	nop

0000000140001400 <__do_global_dtors>:
   140001400:	48 83 ec 28          	sub    rsp,0x28
   140001404:	48 8b 05 f5 9b 00 00 	mov    rax,QWORD PTR [rip+0x9bf5]        # 14000b000 <__data_start__>
   14000140b:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000140e:	48 85 c0             	test   rax,rax
   140001411:	74 0c                	je     14000141f <__do_global_dtors+0x1f>
   140001413:	ff d0                	call   rax
   140001415:	48 83 05 e3 9b 00 00 	add    QWORD PTR [rip+0x9be3],0x8        # 14000b000 <__data_start__>
   14000141c:	08 
   14000141d:	eb e5                	jmp    140001404 <__do_global_dtors+0x4>
   14000141f:	48 83 c4 28          	add    rsp,0x28
   140001423:	c3                   	ret

0000000140001424 <__do_global_ctors>:
   140001424:	56                   	push   rsi
   140001425:	53                   	push   rbx
   140001426:	48 83 ec 28          	sub    rsp,0x28
   14000142a:	48 8b 1d ff b4 00 00 	mov    rbx,QWORD PTR [rip+0xb4ff]        # 14000c930 <.refptr.__CTOR_LIST__>
   140001431:	8b 03                	mov    eax,DWORD PTR [rbx]
   140001433:	83 f8 ff             	cmp    eax,0xffffffff
   140001436:	75 11                	jne    140001449 <__do_global_ctors+0x25>
   140001438:	31 d2                	xor    edx,edx
   14000143a:	8d 4a 01             	lea    ecx,[rdx+0x1]
   14000143d:	89 d0                	mov    eax,edx
   14000143f:	48 89 ca             	mov    rdx,rcx
   140001442:	48 83 3c cb 00       	cmp    QWORD PTR [rbx+rcx*8],0x0
   140001447:	75 f1                	jne    14000143a <__do_global_ctors+0x16>
   140001449:	48 8d 34 c3          	lea    rsi,[rbx+rax*8]
   14000144d:	48 39 de             	cmp    rsi,rbx
   140001450:	74 08                	je     14000145a <__do_global_ctors+0x36>
   140001452:	ff 16                	call   QWORD PTR [rsi]
   140001454:	48 83 ee 08          	sub    rsi,0x8
   140001458:	eb f3                	jmp    14000144d <__do_global_ctors+0x29>
   14000145a:	48 8d 0d 9f ff ff ff 	lea    rcx,[rip+0xffffffffffffff9f]        # 140001400 <__do_global_dtors>
   140001461:	48 83 c4 28          	add    rsp,0x28
   140001465:	5b                   	pop    rbx
   140001466:	5e                   	pop    rsi
   140001467:	e9 f9 fe ff ff       	jmp    140001365 <atexit>

000000014000146c <__main>:
   14000146c:	83 3d bd eb 00 00 00 	cmp    DWORD PTR [rip+0xebbd],0x0        # 140010030 <initialized>
   140001473:	75 0c                	jne    140001481 <__main+0x15>
   140001475:	c7 05 b1 eb 00 00 01 	mov    DWORD PTR [rip+0xebb1],0x1        # 140010030 <initialized>
   14000147c:	00 00 00 
   14000147f:	eb a3                	jmp    140001424 <__do_global_ctors>
   140001481:	c3                   	ret
   140001482:	90                   	nop
   140001483:	90                   	nop
   140001484:	90                   	nop
   140001485:	90                   	nop
   140001486:	90                   	nop
   140001487:	90                   	nop
   140001488:	90                   	nop
   140001489:	90                   	nop
   14000148a:	90                   	nop
   14000148b:	90                   	nop
   14000148c:	90                   	nop
   14000148d:	90                   	nop
   14000148e:	90                   	nop
   14000148f:	90                   	nop

0000000140001490 <_setargv>:
   140001490:	31 c0                	xor    eax,eax
   140001492:	c3                   	ret
   140001493:	90                   	nop
   140001494:	90                   	nop
   140001495:	90                   	nop
   140001496:	90                   	nop
   140001497:	90                   	nop
   140001498:	90                   	nop
   140001499:	90                   	nop
   14000149a:	90                   	nop
   14000149b:	90                   	nop
   14000149c:	90                   	nop
   14000149d:	90                   	nop
   14000149e:	90                   	nop
   14000149f:	90                   	nop

00000001400014a0 <__dyn_tls_dtor>:
   1400014a0:	83 fa 03             	cmp    edx,0x3
   1400014a3:	74 04                	je     1400014a9 <__dyn_tls_dtor+0x9>
   1400014a5:	85 d2                	test   edx,edx
   1400014a7:	75 05                	jne    1400014ae <__dyn_tls_dtor+0xe>
   1400014a9:	e9 00 08 00 00       	jmp    140001cae <__mingw_TLScallback>
   1400014ae:	c3                   	ret

00000001400014af <__dyn_tls_init>:
   1400014af:	56                   	push   rsi
   1400014b0:	53                   	push   rbx
   1400014b1:	48 83 ec 28          	sub    rsp,0x28
   1400014b5:	48 8b 05 54 b4 00 00 	mov    rax,QWORD PTR [rip+0xb454]        # 14000c910 <.refptr._CRT_MT>
   1400014bc:	83 38 02             	cmp    DWORD PTR [rax],0x2
   1400014bf:	74 06                	je     1400014c7 <__dyn_tls_init+0x18>
   1400014c1:	c7 00 02 00 00 00    	mov    DWORD PTR [rax],0x2
   1400014c7:	83 fa 02             	cmp    edx,0x2
   1400014ca:	74 10                	je     1400014dc <__dyn_tls_init+0x2d>
   1400014cc:	83 fa 01             	cmp    edx,0x1
   1400014cf:	75 2e                	jne    1400014ff <__dyn_tls_init+0x50>
   1400014d1:	48 83 c4 28          	add    rsp,0x28
   1400014d5:	5b                   	pop    rbx
   1400014d6:	5e                   	pop    rsi
   1400014d7:	e9 d2 07 00 00       	jmp    140001cae <__mingw_TLScallback>
   1400014dc:	48 8d 1d 9d bd 00 00 	lea    rbx,[rip+0xbd9d]        # 14000d280 <__xd_z>
   1400014e3:	48 8d 35 96 bd 00 00 	lea    rsi,[rip+0xbd96]        # 14000d280 <__xd_z>
   1400014ea:	48 39 f3             	cmp    rbx,rsi
   1400014ed:	74 10                	je     1400014ff <__dyn_tls_init+0x50>
   1400014ef:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   1400014f2:	48 85 c0             	test   rax,rax
   1400014f5:	74 02                	je     1400014f9 <__dyn_tls_init+0x4a>
   1400014f7:	ff d0                	call   rax
   1400014f9:	48 83 c3 08          	add    rbx,0x8
   1400014fd:	eb eb                	jmp    1400014ea <__dyn_tls_init+0x3b>
   1400014ff:	48 83 c4 28          	add    rsp,0x28
   140001503:	5b                   	pop    rbx
   140001504:	5e                   	pop    rsi
   140001505:	c3                   	ret

0000000140001506 <__tlregdtor>:
   140001506:	31 c0                	xor    eax,eax
   140001508:	c3                   	ret
   140001509:	90                   	nop
   14000150a:	90                   	nop
   14000150b:	90                   	nop
   14000150c:	90                   	nop
   14000150d:	90                   	nop
   14000150e:	90                   	nop
   14000150f:	90                   	nop

0000000140001510 <_matherr>:
   140001510:	41 54                	push   r12
   140001512:	55                   	push   rbp
   140001513:	57                   	push   rdi
   140001514:	56                   	push   rsi
   140001515:	53                   	push   rbx
   140001516:	48 83 ec 40          	sub    rsp,0x40
   14000151a:	48 8d 1d 58 ac 00 00 	lea    rbx,[rip+0xac58]        # 14000c179 <.rdata+0xd9>
   140001521:	8b 01                	mov    eax,DWORD PTR [rcx]
   140001523:	ff c8                	dec    eax
   140001525:	83 f8 05             	cmp    eax,0x5
   140001528:	77 44                	ja     14000156e <_matherr+0x5e>
   14000152a:	48 8d 15 83 ac 00 00 	lea    rdx,[rip+0xac83]        # 14000c1b4 <.rdata+0x114>
   140001531:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140001535:	48 01 d0             	add    rax,rdx
   140001538:	ff e0                	jmp    rax
   14000153a:	48 8d 1d 5f ab 00 00 	lea    rbx,[rip+0xab5f]        # 14000c0a0 <.rdata>
   140001541:	eb 2b                	jmp    14000156e <_matherr+0x5e>
   140001543:	48 8d 1d 91 ab 00 00 	lea    rbx,[rip+0xab91]        # 14000c0db <.rdata+0x3b>
   14000154a:	eb 22                	jmp    14000156e <_matherr+0x5e>
   14000154c:	48 8d 1d a8 ab 00 00 	lea    rbx,[rip+0xaba8]        # 14000c0fb <.rdata+0x5b>
   140001553:	eb 19                	jmp    14000156e <_matherr+0x5e>
   140001555:	48 8d 1d c4 ab 00 00 	lea    rbx,[rip+0xabc4]        # 14000c120 <.rdata+0x80>
   14000155c:	eb 10                	jmp    14000156e <_matherr+0x5e>
   14000155e:	48 8d 1d de ab 00 00 	lea    rbx,[rip+0xabde]        # 14000c143 <.rdata+0xa3>
   140001565:	eb 07                	jmp    14000156e <_matherr+0x5e>
   140001567:	48 8d 1d 51 ab 00 00 	lea    rbx,[rip+0xab51]        # 14000c0bf <.rdata+0x1f>
   14000156e:	4c 8b 61 20          	mov    r12,QWORD PTR [rcx+0x20]
   140001572:	48 8b 69 18          	mov    rbp,QWORD PTR [rcx+0x18]
   140001576:	48 8b 79 10          	mov    rdi,QWORD PTR [rcx+0x10]
   14000157a:	48 8b 71 08          	mov    rsi,QWORD PTR [rcx+0x8]
   14000157e:	b9 02 00 00 00       	mov    ecx,0x2
   140001583:	e8 78 95 00 00       	call   14000ab00 <__acrt_iob_func>
   140001588:	4c 89 64 24 30       	mov    QWORD PTR [rsp+0x30],r12
   14000158d:	49 89 d8             	mov    r8,rbx
   140001590:	48 8d 15 f0 ab 00 00 	lea    rdx,[rip+0xabf0]        # 14000c187 <.rdata+0xe7>
   140001597:	48 89 6c 24 28       	mov    QWORD PTR [rsp+0x28],rbp
   14000159c:	49 89 f1             	mov    r9,rsi
   14000159f:	48 89 c1             	mov    rcx,rax
   1400015a2:	48 89 7c 24 20       	mov    QWORD PTR [rsp+0x20],rdi
   1400015a7:	e8 04 96 00 00       	call   14000abb0 <fprintf>
   1400015ac:	31 c0                	xor    eax,eax
   1400015ae:	48 83 c4 40          	add    rsp,0x40
   1400015b2:	5b                   	pop    rbx
   1400015b3:	5e                   	pop    rsi
   1400015b4:	5f                   	pop    rdi
   1400015b5:	5d                   	pop    rbp
   1400015b6:	41 5c                	pop    r12
   1400015b8:	c3                   	ret
   1400015b9:	90                   	nop
   1400015ba:	90                   	nop
   1400015bb:	90                   	nop
   1400015bc:	90                   	nop
   1400015bd:	90                   	nop
   1400015be:	90                   	nop
   1400015bf:	90                   	nop

00000001400015c0 <__report_error>:
   1400015c0:	56                   	push   rsi
   1400015c1:	53                   	push   rbx
   1400015c2:	48 83 ec 38          	sub    rsp,0x38
   1400015c6:	48 89 cb             	mov    rbx,rcx
   1400015c9:	48 8d 44 24 58       	lea    rax,[rsp+0x58]
   1400015ce:	b9 02 00 00 00       	mov    ecx,0x2
   1400015d3:	4c 89 44 24 60       	mov    QWORD PTR [rsp+0x60],r8
   1400015d8:	4c 89 4c 24 68       	mov    QWORD PTR [rsp+0x68],r9
   1400015dd:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   1400015e2:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1400015e7:	e8 14 95 00 00       	call   14000ab00 <__acrt_iob_func>
   1400015ec:	48 8d 15 dd ab 00 00 	lea    rdx,[rip+0xabdd]        # 14000c1d0 <.rdata>
   1400015f3:	48 89 c1             	mov    rcx,rax
   1400015f6:	e8 b5 95 00 00       	call   14000abb0 <fprintf>
   1400015fb:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   140001600:	b9 02 00 00 00       	mov    ecx,0x2
   140001605:	e8 f6 94 00 00       	call   14000ab00 <__acrt_iob_func>
   14000160a:	48 89 da             	mov    rdx,rbx
   14000160d:	49 89 f0             	mov    r8,rsi
   140001610:	48 89 c1             	mov    rcx,rax
   140001613:	e8 38 96 00 00       	call   14000ac50 <vfprintf>
   140001618:	e8 73 95 00 00       	call   14000ab90 <abort>
   14000161d:	90                   	nop

000000014000161e <__write_memory.part.0>:
   14000161e:	41 54                	push   r12
   140001620:	55                   	push   rbp
   140001621:	57                   	push   rdi
   140001622:	56                   	push   rsi
   140001623:	53                   	push   rbx
   140001624:	48 83 ec 50          	sub    rsp,0x50
   140001628:	48 8b 05 79 ea 00 00 	mov    rax,QWORD PTR [rip+0xea79]        # 1400100a8 <the_secs>
   14000162f:	31 db                	xor    ebx,ebx
   140001631:	48 83 c0 18          	add    rax,0x18
   140001635:	48 89 ce             	mov    rsi,rcx
   140001638:	8b 0d 66 ea 00 00    	mov    ecx,DWORD PTR [rip+0xea66]        # 1400100a4 <maxSections>
   14000163e:	48 89 d7             	mov    rdi,rdx
   140001641:	4c 89 c5             	mov    rbp,r8
   140001644:	39 cb                	cmp    ebx,ecx
   140001646:	7d 24                	jge    14000166c <__write_memory.part.0+0x4e>
   140001648:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14000164b:	48 39 d6             	cmp    rsi,rdx
   14000164e:	72 14                	jb     140001664 <__write_memory.part.0+0x46>
   140001650:	4c 8b 40 08          	mov    r8,QWORD PTR [rax+0x8]
   140001654:	45 8b 40 08          	mov    r8d,DWORD PTR [r8+0x8]
   140001658:	4c 01 c2             	add    rdx,r8
   14000165b:	48 39 d6             	cmp    rsi,rdx
   14000165e:	0f 82 f3 00 00 00    	jb     140001757 <__write_memory.part.0+0x139>
   140001664:	ff c3                	inc    ebx
   140001666:	48 83 c0 28          	add    rax,0x28
   14000166a:	eb d8                	jmp    140001644 <__write_memory.part.0+0x26>
   14000166c:	48 89 f1             	mov    rcx,rsi
   14000166f:	e8 dd 07 00 00       	call   140001e51 <__mingw_GetSectionForAddress>
   140001674:	49 89 c4             	mov    r12,rax
   140001677:	48 85 c0             	test   rax,rax
   14000167a:	75 0f                	jne    14000168b <__write_memory.part.0+0x6d>
   14000167c:	48 89 f2             	mov    rdx,rsi
   14000167f:	48 8d 0d 66 ab 00 00 	lea    rcx,[rip+0xab66]        # 14000c1ec <.rdata+0x1c>
   140001686:	e8 35 ff ff ff       	call   1400015c0 <__report_error>
   14000168b:	48 63 db             	movsxd rbx,ebx
   14000168e:	48 8b 05 13 ea 00 00 	mov    rax,QWORD PTR [rip+0xea13]        # 1400100a8 <the_secs>
   140001695:	31 d2                	xor    edx,edx
   140001697:	48 6b db 28          	imul   rbx,rbx,0x28
   14000169b:	48 01 d8             	add    rax,rbx
   14000169e:	89 10                	mov    DWORD PTR [rax],edx
   1400016a0:	4c 89 60 20          	mov    QWORD PTR [rax+0x20],r12
   1400016a4:	e8 57 08 00 00       	call   140001f00 <_GetPEImageBase>
   1400016a9:	41 8b 54 24 0c       	mov    edx,DWORD PTR [r12+0xc]
   1400016ae:	41 b8 30 00 00 00    	mov    r8d,0x30
   1400016b4:	48 8d 0c 10          	lea    rcx,[rax+rdx*1]
   1400016b8:	48 8b 05 e9 e9 00 00 	mov    rax,QWORD PTR [rip+0xe9e9]        # 1400100a8 <the_secs>
   1400016bf:	48 8d 54 24 20       	lea    rdx,[rsp+0x20]
   1400016c4:	48 89 4c 18 18       	mov    QWORD PTR [rax+rbx*1+0x18],rcx
   1400016c9:	ff 15 a9 fb 00 00    	call   QWORD PTR [rip+0xfba9]        # 140011278 <__imp_VirtualQuery>
   1400016cf:	48 85 c0             	test   rax,rax
   1400016d2:	75 1d                	jne    1400016f1 <__write_memory.part.0+0xd3>
   1400016d4:	48 8b 05 cd e9 00 00 	mov    rax,QWORD PTR [rip+0xe9cd]        # 1400100a8 <the_secs>
   1400016db:	41 8b 54 24 08       	mov    edx,DWORD PTR [r12+0x8]
   1400016e0:	48 8d 0d 25 ab 00 00 	lea    rcx,[rip+0xab25]        # 14000c20c <.rdata+0x3c>
   1400016e7:	4c 8b 44 18 18       	mov    r8,QWORD PTR [rax+rbx*1+0x18]
   1400016ec:	e8 cf fe ff ff       	call   1400015c0 <__report_error>
   1400016f1:	8b 44 24 44          	mov    eax,DWORD PTR [rsp+0x44]
   1400016f5:	8d 50 fc             	lea    edx,[rax-0x4]
   1400016f8:	83 e2 fb             	and    edx,0xfffffffb
   1400016fb:	74 54                	je     140001751 <__write_memory.part.0+0x133>
   1400016fd:	8d 50 c0             	lea    edx,[rax-0x40]
   140001700:	83 e2 bf             	and    edx,0xffffffbf
   140001703:	74 4c                	je     140001751 <__write_memory.part.0+0x133>
   140001705:	83 f8 02             	cmp    eax,0x2
   140001708:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   14000170d:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140001712:	41 b8 40 00 00 00    	mov    r8d,0x40
   140001718:	b8 04 00 00 00       	mov    eax,0x4
   14000171d:	44 0f 44 c0          	cmove  r8d,eax
   140001721:	48 03 1d 80 e9 00 00 	add    rbx,QWORD PTR [rip+0xe980]        # 1400100a8 <the_secs>
   140001728:	48 89 4b 08          	mov    QWORD PTR [rbx+0x8],rcx
   14000172c:	49 89 d9             	mov    r9,rbx
   14000172f:	48 89 53 10          	mov    QWORD PTR [rbx+0x10],rdx
   140001733:	ff 15 37 fb 00 00    	call   QWORD PTR [rip+0xfb37]        # 140011270 <__imp_VirtualProtect>
   140001739:	85 c0                	test   eax,eax
   14000173b:	75 14                	jne    140001751 <__write_memory.part.0+0x133>
   14000173d:	ff 15 ed fa 00 00    	call   QWORD PTR [rip+0xfaed]        # 140011230 <__imp_GetLastError>
   140001743:	48 8d 0d f3 aa 00 00 	lea    rcx,[rip+0xaaf3]        # 14000c23d <.rdata+0x6d>
   14000174a:	89 c2                	mov    edx,eax
   14000174c:	e8 6f fe ff ff       	call   1400015c0 <__report_error>
   140001751:	ff 05 4d e9 00 00    	inc    DWORD PTR [rip+0xe94d]        # 1400100a4 <maxSections>
   140001757:	49 89 e8             	mov    r8,rbp
   14000175a:	48 89 fa             	mov    rdx,rdi
   14000175d:	48 89 f1             	mov    rcx,rsi
   140001760:	48 83 c4 50          	add    rsp,0x50
   140001764:	5b                   	pop    rbx
   140001765:	5e                   	pop    rsi
   140001766:	5f                   	pop    rdi
   140001767:	5d                   	pop    rbp
   140001768:	41 5c                	pop    r12
   14000176a:	e9 89 94 00 00       	jmp    14000abf8 <memcpy>

000000014000176f <_pei386_runtime_relocator>:
   14000176f:	55                   	push   rbp
   140001770:	41 55                	push   r13
   140001772:	41 54                	push   r12
   140001774:	57                   	push   rdi
   140001775:	56                   	push   rsi
   140001776:	53                   	push   rbx
   140001777:	48 83 ec 48          	sub    rsp,0x48
   14000177b:	48 8d 6c 24 40       	lea    rbp,[rsp+0x40]
   140001780:	83 3d 19 e9 00 00 00 	cmp    DWORD PTR [rip+0xe919],0x0        # 1400100a0 <was_init.0>
   140001787:	0f 85 30 02 00 00    	jne    1400019bd <_pei386_runtime_relocator+0x24e>
   14000178d:	c7 05 09 e9 00 00 01 	mov    DWORD PTR [rip+0xe909],0x1        # 1400100a0 <was_init.0>
   140001794:	00 00 00 
   140001797:	e8 e8 06 00 00       	call   140001e84 <__mingw_GetSectionCount>
   14000179c:	48 98                	cdqe
   14000179e:	48 6b c0 28          	imul   rax,rax,0x28
   1400017a2:	48 83 c0 0f          	add    rax,0xf
   1400017a6:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   1400017aa:	e8 21 08 00 00       	call   140001fd0 <___chkstk_ms>
   1400017af:	48 8b 35 9a b1 00 00 	mov    rsi,QWORD PTR [rip+0xb19a]        # 14000c950 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST_END__>
   1400017b6:	31 d2                	xor    edx,edx
   1400017b8:	48 29 c4             	sub    rsp,rax
   1400017bb:	89 15 e3 e8 00 00    	mov    DWORD PTR [rip+0xe8e3],edx        # 1400100a4 <maxSections>
   1400017c1:	48 89 f2             	mov    rdx,rsi
   1400017c4:	48 8d 44 24 30       	lea    rax,[rsp+0x30]
   1400017c9:	48 89 05 d8 e8 00 00 	mov    QWORD PTR [rip+0xe8d8],rax        # 1400100a8 <the_secs>
   1400017d0:	48 8b 05 89 b1 00 00 	mov    rax,QWORD PTR [rip+0xb189]        # 14000c960 <.refptr.__RUNTIME_PSEUDO_RELOC_LIST__>
   1400017d7:	48 29 c2             	sub    rdx,rax
   1400017da:	48 83 fa 07          	cmp    rdx,0x7
   1400017de:	0f 8e a5 01 00 00    	jle    140001989 <_pei386_runtime_relocator+0x21a>
   1400017e4:	48 89 c3             	mov    rbx,rax
   1400017e7:	48 83 fa 0b          	cmp    rdx,0xb
   1400017eb:	7e 18                	jle    140001805 <_pei386_runtime_relocator+0x96>
   1400017ed:	83 38 00             	cmp    DWORD PTR [rax],0x0
   1400017f0:	75 13                	jne    140001805 <_pei386_runtime_relocator+0x96>
   1400017f2:	83 78 04 00          	cmp    DWORD PTR [rax+0x4],0x0
   1400017f6:	75 0d                	jne    140001805 <_pei386_runtime_relocator+0x96>
   1400017f8:	48 83 c3 0c          	add    rbx,0xc
   1400017fc:	83 78 08 00          	cmp    DWORD PTR [rax+0x8],0x0
   140001800:	74 03                	je     140001805 <_pei386_runtime_relocator+0x96>
   140001802:	48 89 c3             	mov    rbx,rax
   140001805:	83 3b 00             	cmp    DWORD PTR [rbx],0x0
   140001808:	75 06                	jne    140001810 <_pei386_runtime_relocator+0xa1>
   14000180a:	83 7b 04 00          	cmp    DWORD PTR [rbx+0x4],0x0
   14000180e:	74 2f                	je     14000183f <_pei386_runtime_relocator+0xd0>
   140001810:	48 39 f3             	cmp    rbx,rsi
   140001813:	0f 83 70 01 00 00    	jae    140001989 <_pei386_runtime_relocator+0x21a>
   140001819:	8b 4b 04             	mov    ecx,DWORD PTR [rbx+0x4]
   14000181c:	8b 03                	mov    eax,DWORD PTR [rbx]
   14000181e:	41 b8 04 00 00 00    	mov    r8d,0x4
   140001824:	48 8d 55 f8          	lea    rdx,[rbp-0x8]
   140001828:	48 03 0d 11 b1 00 00 	add    rcx,QWORD PTR [rip+0xb111]        # 14000c940 <.refptr.__ImageBase>
   14000182f:	48 83 c3 08          	add    rbx,0x8
   140001833:	03 01                	add    eax,DWORD PTR [rcx]
   140001835:	89 45 f8             	mov    DWORD PTR [rbp-0x8],eax
   140001838:	e8 e1 fd ff ff       	call   14000161e <__write_memory.part.0>
   14000183d:	eb d1                	jmp    140001810 <_pei386_runtime_relocator+0xa1>
   14000183f:	8b 53 08             	mov    edx,DWORD PTR [rbx+0x8]
   140001842:	48 83 c3 0c          	add    rbx,0xc
   140001846:	83 fa 01             	cmp    edx,0x1
   140001849:	75 13                	jne    14000185e <_pei386_runtime_relocator+0xef>
   14000184b:	48 8b 3d ee b0 00 00 	mov    rdi,QWORD PTR [rip+0xb0ee]        # 14000c940 <.refptr.__ImageBase>
   140001852:	49 bc 00 00 00 00 ff 	movabs r12,0xffffffff00000000
   140001859:	ff ff ff 
   14000185c:	eb 58                	jmp    1400018b6 <_pei386_runtime_relocator+0x147>
   14000185e:	48 8d 0d ff a9 00 00 	lea    rcx,[rip+0xa9ff]        # 14000c264 <.rdata+0x94>
   140001865:	e9 82 00 00 00       	jmp    1400018ec <_pei386_runtime_relocator+0x17d>
   14000186a:	41 0f b6 02          	movzx  eax,BYTE PTR [r10]
   14000186e:	84 c0                	test   al,al
   140001870:	79 06                	jns    140001878 <_pei386_runtime_relocator+0x109>
   140001872:	48 0d 00 ff ff ff    	or     rax,0xffffffffffffff00
   140001878:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   14000187a:	48 01 f9             	add    rcx,rdi
   14000187d:	4c 8b 09             	mov    r9,QWORD PTR [rcx]
   140001880:	48 29 c8             	sub    rax,rcx
   140001883:	4c 01 c8             	add    rax,r9
   140001886:	41 80 e0 c0          	and    r8b,0xc0
   14000188a:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   14000188e:	0f 84 95 00 00 00    	je     140001929 <_pei386_runtime_relocator+0x1ba>
   140001894:	83 fa 20             	cmp    edx,0x20
   140001897:	41 b8 04 00 00 00    	mov    r8d,0x4
   14000189d:	48 8d 45 f8          	lea    rax,[rbp-0x8]
   1400018a1:	0f 85 bc 00 00 00    	jne    140001963 <_pei386_runtime_relocator+0x1f4>
   1400018a7:	48 89 c2             	mov    rdx,rax
   1400018aa:	4c 89 d1             	mov    rcx,r10
   1400018ad:	48 83 c3 0c          	add    rbx,0xc
   1400018b1:	e8 68 fd ff ff       	call   14000161e <__write_memory.part.0>
   1400018b6:	48 39 f3             	cmp    rbx,rsi
   1400018b9:	0f 83 ca 00 00 00    	jae    140001989 <_pei386_runtime_relocator+0x21a>
   1400018bf:	44 8b 43 08          	mov    r8d,DWORD PTR [rbx+0x8]
   1400018c3:	44 8b 53 04          	mov    r10d,DWORD PTR [rbx+0x4]
   1400018c7:	41 0f b6 d0          	movzx  edx,r8b
   1400018cb:	49 01 fa             	add    r10,rdi
   1400018ce:	83 fa 20             	cmp    edx,0x20
   1400018d1:	74 43                	je     140001916 <_pei386_runtime_relocator+0x1a7>
   1400018d3:	77 1c                	ja     1400018f1 <_pei386_runtime_relocator+0x182>
   1400018d5:	83 fa 08             	cmp    edx,0x8
   1400018d8:	74 90                	je     14000186a <_pei386_runtime_relocator+0xfb>
   1400018da:	83 fa 10             	cmp    edx,0x10
   1400018dd:	74 1f                	je     1400018fe <_pei386_runtime_relocator+0x18f>
   1400018df:	31 c0                	xor    eax,eax
   1400018e1:	48 8d 0d ae a9 00 00 	lea    rcx,[rip+0xa9ae]        # 14000c296 <.rdata+0xc6>
   1400018e8:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   1400018ec:	e8 cf fc ff ff       	call   1400015c0 <__report_error>
   1400018f1:	83 fa 40             	cmp    edx,0x40
   1400018f4:	75 e9                	jne    1400018df <_pei386_runtime_relocator+0x170>
   1400018f6:	49 8b 02             	mov    rax,QWORD PTR [r10]
   1400018f9:	e9 7a ff ff ff       	jmp    140001878 <_pei386_runtime_relocator+0x109>
   1400018fe:	41 0f b7 02          	movzx  eax,WORD PTR [r10]
   140001902:	66 85 c0             	test   ax,ax
   140001905:	0f 89 6d ff ff ff    	jns    140001878 <_pei386_runtime_relocator+0x109>
   14000190b:	48 0d 00 00 ff ff    	or     rax,0xffffffffffff0000
   140001911:	e9 62 ff ff ff       	jmp    140001878 <_pei386_runtime_relocator+0x109>
   140001916:	41 8b 02             	mov    eax,DWORD PTR [r10]
   140001919:	85 c0                	test   eax,eax
   14000191b:	0f 89 57 ff ff ff    	jns    140001878 <_pei386_runtime_relocator+0x109>
   140001921:	4c 09 e0             	or     rax,r12
   140001924:	e9 4f ff ff ff       	jmp    140001878 <_pei386_runtime_relocator+0x109>
   140001929:	8d 4a ff             	lea    ecx,[rdx-0x1]
   14000192c:	49 c7 c3 ff ff ff ff 	mov    r11,0xffffffffffffffff
   140001933:	49 d3 e3             	shl    r11,cl
   140001936:	4c 39 d8             	cmp    rax,r11
   140001939:	7c 14                	jl     14000194f <_pei386_runtime_relocator+0x1e0>
   14000193b:	41 b8 01 00 00 00    	mov    r8d,0x1
   140001941:	89 d1                	mov    ecx,edx
   140001943:	49 d3 e0             	shl    r8,cl
   140001946:	4c 39 c0             	cmp    rax,r8
   140001949:	0f 8c 45 ff ff ff    	jl     140001894 <_pei386_runtime_relocator+0x125>
   14000194f:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140001954:	4d 89 d0             	mov    r8,r10
   140001957:	48 8d 0d 62 a9 00 00 	lea    rcx,[rip+0xa962]        # 14000c2c0 <.rdata+0xf0>
   14000195e:	e8 5d fc ff ff       	call   1400015c0 <__report_error>
   140001963:	41 b8 08 00 00 00    	mov    r8d,0x8
   140001969:	0f 87 38 ff ff ff    	ja     1400018a7 <_pei386_runtime_relocator+0x138>
   14000196f:	41 b8 01 00 00 00    	mov    r8d,0x1
   140001975:	83 fa 08             	cmp    edx,0x8
   140001978:	0f 84 29 ff ff ff    	je     1400018a7 <_pei386_runtime_relocator+0x138>
   14000197e:	41 b8 02 00 00 00    	mov    r8d,0x2
   140001984:	e9 1e ff ff ff       	jmp    1400018a7 <_pei386_runtime_relocator+0x138>
   140001989:	31 db                	xor    ebx,ebx
   14000198b:	39 1d 13 e7 00 00    	cmp    DWORD PTR [rip+0xe713],ebx        # 1400100a4 <maxSections>
   140001991:	7e 2a                	jle    1400019bd <_pei386_runtime_relocator+0x24e>
   140001993:	48 6b c3 28          	imul   rax,rbx,0x28
   140001997:	48 03 05 0a e7 00 00 	add    rax,QWORD PTR [rip+0xe70a]        # 1400100a8 <the_secs>
   14000199e:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   1400019a1:	45 85 c0             	test   r8d,r8d
   1400019a4:	74 12                	je     1400019b8 <_pei386_runtime_relocator+0x249>
   1400019a6:	48 8b 50 10          	mov    rdx,QWORD PTR [rax+0x10]
   1400019aa:	48 8b 48 08          	mov    rcx,QWORD PTR [rax+0x8]
   1400019ae:	4c 8d 4d f8          	lea    r9,[rbp-0x8]
   1400019b2:	ff 15 b8 f8 00 00    	call   QWORD PTR [rip+0xf8b8]        # 140011270 <__imp_VirtualProtect>
   1400019b8:	48 ff c3             	inc    rbx
   1400019bb:	eb ce                	jmp    14000198b <_pei386_runtime_relocator+0x21c>
   1400019bd:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   1400019c1:	5b                   	pop    rbx
   1400019c2:	5e                   	pop    rsi
   1400019c3:	5f                   	pop    rdi
   1400019c4:	41 5c                	pop    r12
   1400019c6:	41 5d                	pop    r13
   1400019c8:	5d                   	pop    rbp
   1400019c9:	c3                   	ret
   1400019ca:	90                   	nop
   1400019cb:	90                   	nop
   1400019cc:	90                   	nop
   1400019cd:	90                   	nop
   1400019ce:	90                   	nop
   1400019cf:	90                   	nop

00000001400019d0 <__mingw_raise_matherr>:
   1400019d0:	48 83 ec 58          	sub    rsp,0x58
   1400019d4:	48 8b 05 d5 e6 00 00 	mov    rax,QWORD PTR [rip+0xe6d5]        # 1400100b0 <stUserMathErr>
   1400019db:	48 85 c0             	test   rax,rax
   1400019de:	74 2c                	je     140001a0c <__mingw_raise_matherr+0x3c>
   1400019e0:	f2 0f 10 84 24 80 00 	movsd  xmm0,QWORD PTR [rsp+0x80]
   1400019e7:	00 00 
   1400019e9:	89 4c 24 28          	mov    DWORD PTR [rsp+0x28],ecx
   1400019ed:	48 8d 4c 24 28       	lea    rcx,[rsp+0x28]
   1400019f2:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
   1400019f7:	f2 0f 11 54 24 38    	movsd  QWORD PTR [rsp+0x38],xmm2
   1400019fd:	f2 0f 11 5c 24 40    	movsd  QWORD PTR [rsp+0x40],xmm3
   140001a03:	f2 0f 11 44 24 48    	movsd  QWORD PTR [rsp+0x48],xmm0
   140001a09:	ff d0                	call   rax
   140001a0b:	90                   	nop
   140001a0c:	48 83 c4 58          	add    rsp,0x58
   140001a10:	c3                   	ret

0000000140001a11 <__mingw_setusermatherr>:
   140001a11:	48 89 0d 98 e6 00 00 	mov    QWORD PTR [rip+0xe698],rcx        # 1400100b0 <stUserMathErr>
   140001a18:	e9 33 91 00 00       	jmp    14000ab50 <__setusermatherr>
   140001a1d:	90                   	nop
   140001a1e:	90                   	nop
   140001a1f:	90                   	nop

0000000140001a20 <_gnu_exception_handler>:
   140001a20:	56                   	push   rsi
   140001a21:	53                   	push   rbx
   140001a22:	48 83 ec 28          	sub    rsp,0x28
   140001a26:	48 8b 11             	mov    rdx,QWORD PTR [rcx]
   140001a29:	8b 02                	mov    eax,DWORD PTR [rdx]
   140001a2b:	48 89 cb             	mov    rbx,rcx
   140001a2e:	89 c1                	mov    ecx,eax
   140001a30:	81 e1 ff ff ff 20    	and    ecx,0x20ffffff
   140001a36:	81 f9 43 43 47 20    	cmp    ecx,0x20474343
   140001a3c:	75 06                	jne    140001a44 <_gnu_exception_handler+0x24>
   140001a3e:	f6 42 04 01          	test   BYTE PTR [rdx+0x4],0x1
   140001a42:	74 4d                	je     140001a91 <_gnu_exception_handler+0x71>
   140001a44:	3d 96 00 00 c0       	cmp    eax,0xc0000096
   140001a49:	0f 87 fa 00 00 00    	ja     140001b49 <_gnu_exception_handler+0x129>
   140001a4f:	3d 8b 00 00 c0       	cmp    eax,0xc000008b
   140001a54:	77 16                	ja     140001a6c <_gnu_exception_handler+0x4c>
   140001a56:	3d 05 00 00 c0       	cmp    eax,0xc0000005
   140001a5b:	74 4a                	je     140001aa7 <_gnu_exception_handler+0x87>
   140001a5d:	77 2b                	ja     140001a8a <_gnu_exception_handler+0x6a>
   140001a5f:	3d 02 00 00 80       	cmp    eax,0x80000002
   140001a64:	0f 85 df 00 00 00    	jne    140001b49 <_gnu_exception_handler+0x129>
   140001a6a:	eb 25                	jmp    140001a91 <_gnu_exception_handler+0x71>
   140001a6c:	05 73 ff ff 3f       	add    eax,0x3fffff73
   140001a71:	83 f8 09             	cmp    eax,0x9
   140001a74:	77 1b                	ja     140001a91 <_gnu_exception_handler+0x71>
   140001a76:	48 8d 15 a3 a8 00 00 	lea    rdx,[rip+0xa8a3]        # 14000c320 <.rdata>
   140001a7d:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   140001a81:	48 01 d0             	add    rax,rdx
   140001a84:	ff e0                	jmp    rax
   140001a86:	31 f6                	xor    esi,esi
   140001a88:	eb 7b                	jmp    140001b05 <_gnu_exception_handler+0xe5>
   140001a8a:	3d 08 00 00 c0       	cmp    eax,0xc0000008
   140001a8f:	75 0a                	jne    140001a9b <_gnu_exception_handler+0x7b>
   140001a91:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140001a96:	e9 c8 00 00 00       	jmp    140001b63 <_gnu_exception_handler+0x143>
   140001a9b:	3d 1d 00 00 c0       	cmp    eax,0xc000001d
   140001aa0:	74 2f                	je     140001ad1 <_gnu_exception_handler+0xb1>
   140001aa2:	e9 a2 00 00 00       	jmp    140001b49 <_gnu_exception_handler+0x129>
   140001aa7:	31 d2                	xor    edx,edx
   140001aa9:	b9 0b 00 00 00       	mov    ecx,0xb
   140001aae:	e8 5d 91 00 00       	call   14000ac10 <signal>
   140001ab3:	48 83 f8 01          	cmp    rax,0x1
   140001ab7:	75 0c                	jne    140001ac5 <_gnu_exception_handler+0xa5>
   140001ab9:	ba 01 00 00 00       	mov    edx,0x1
   140001abe:	b9 0b 00 00 00       	mov    ecx,0xb
   140001ac3:	eb 28                	jmp    140001aed <_gnu_exception_handler+0xcd>
   140001ac5:	b9 0b 00 00 00       	mov    ecx,0xb
   140001aca:	48 85 c0             	test   rax,rax
   140001acd:	74 7a                	je     140001b49 <_gnu_exception_handler+0x129>
   140001acf:	eb 71                	jmp    140001b42 <_gnu_exception_handler+0x122>
   140001ad1:	31 d2                	xor    edx,edx
   140001ad3:	b9 04 00 00 00       	mov    ecx,0x4
   140001ad8:	e8 33 91 00 00       	call   14000ac10 <signal>
   140001add:	48 83 f8 01          	cmp    rax,0x1
   140001ae1:	75 11                	jne    140001af4 <_gnu_exception_handler+0xd4>
   140001ae3:	ba 01 00 00 00       	mov    edx,0x1
   140001ae8:	b9 04 00 00 00       	mov    ecx,0x4
   140001aed:	e8 1e 91 00 00       	call   14000ac10 <signal>
   140001af2:	eb 9d                	jmp    140001a91 <_gnu_exception_handler+0x71>
   140001af4:	b9 04 00 00 00       	mov    ecx,0x4
   140001af9:	48 85 c0             	test   rax,rax
   140001afc:	74 4b                	je     140001b49 <_gnu_exception_handler+0x129>
   140001afe:	eb 42                	jmp    140001b42 <_gnu_exception_handler+0x122>
   140001b00:	be 01 00 00 00       	mov    esi,0x1
   140001b05:	31 d2                	xor    edx,edx
   140001b07:	b9 08 00 00 00       	mov    ecx,0x8
   140001b0c:	e8 ff 90 00 00       	call   14000ac10 <signal>
   140001b11:	48 83 f8 01          	cmp    rax,0x1
   140001b15:	75 21                	jne    140001b38 <_gnu_exception_handler+0x118>
   140001b17:	ba 01 00 00 00       	mov    edx,0x1
   140001b1c:	b9 08 00 00 00       	mov    ecx,0x8
   140001b21:	e8 ea 90 00 00       	call   14000ac10 <signal>
   140001b26:	85 f6                	test   esi,esi
   140001b28:	0f 84 63 ff ff ff    	je     140001a91 <_gnu_exception_handler+0x71>
   140001b2e:	e8 3d 02 00 00       	call   140001d70 <_fpreset>
   140001b33:	e9 59 ff ff ff       	jmp    140001a91 <_gnu_exception_handler+0x71>
   140001b38:	48 85 c0             	test   rax,rax
   140001b3b:	74 0c                	je     140001b49 <_gnu_exception_handler+0x129>
   140001b3d:	b9 08 00 00 00       	mov    ecx,0x8
   140001b42:	ff d0                	call   rax
   140001b44:	e9 48 ff ff ff       	jmp    140001a91 <_gnu_exception_handler+0x71>
   140001b49:	48 8b 05 80 e5 00 00 	mov    rax,QWORD PTR [rip+0xe580]        # 1400100d0 <__mingw_oldexcpt_handler>
   140001b50:	48 85 c0             	test   rax,rax
   140001b53:	74 0c                	je     140001b61 <_gnu_exception_handler+0x141>
   140001b55:	48 89 d9             	mov    rcx,rbx
   140001b58:	48 83 c4 28          	add    rsp,0x28
   140001b5c:	5b                   	pop    rbx
   140001b5d:	5e                   	pop    rsi
   140001b5e:	48 ff e0             	rex.W jmp rax
   140001b61:	31 c0                	xor    eax,eax
   140001b63:	48 83 c4 28          	add    rsp,0x28
   140001b67:	5b                   	pop    rbx
   140001b68:	5e                   	pop    rsi
   140001b69:	c3                   	ret
   140001b6a:	90                   	nop
   140001b6b:	90                   	nop
   140001b6c:	90                   	nop
   140001b6d:	90                   	nop
   140001b6e:	90                   	nop
   140001b6f:	90                   	nop

0000000140001b70 <__mingwthr_run_key_dtors.part.0>:
   140001b70:	56                   	push   rsi
   140001b71:	53                   	push   rbx
   140001b72:	48 83 ec 28          	sub    rsp,0x28
   140001b76:	48 8d 0d 83 e5 00 00 	lea    rcx,[rip+0xe583]        # 140010100 <__mingwthr_cs>
   140001b7d:	ff 15 a5 f6 00 00    	call   QWORD PTR [rip+0xf6a5]        # 140011228 <__imp_EnterCriticalSection>
   140001b83:	48 8b 1d 56 e5 00 00 	mov    rbx,QWORD PTR [rip+0xe556]        # 1400100e0 <key_dtor_list>
   140001b8a:	48 85 db             	test   rbx,rbx
   140001b8d:	74 29                	je     140001bb8 <__mingwthr_run_key_dtors.part.0+0x48>
   140001b8f:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140001b91:	ff 15 d1 f6 00 00    	call   QWORD PTR [rip+0xf6d1]        # 140011268 <__imp_TlsGetValue>
   140001b97:	48 89 c6             	mov    rsi,rax
   140001b9a:	ff 15 90 f6 00 00    	call   QWORD PTR [rip+0xf690]        # 140011230 <__imp_GetLastError>
   140001ba0:	48 85 f6             	test   rsi,rsi
   140001ba3:	74 0d                	je     140001bb2 <__mingwthr_run_key_dtors.part.0+0x42>
   140001ba5:	85 c0                	test   eax,eax
   140001ba7:	75 09                	jne    140001bb2 <__mingwthr_run_key_dtors.part.0+0x42>
   140001ba9:	48 8b 43 08          	mov    rax,QWORD PTR [rbx+0x8]
   140001bad:	48 89 f1             	mov    rcx,rsi
   140001bb0:	ff d0                	call   rax
   140001bb2:	48 8b 5b 10          	mov    rbx,QWORD PTR [rbx+0x10]
   140001bb6:	eb d2                	jmp    140001b8a <__mingwthr_run_key_dtors.part.0+0x1a>
   140001bb8:	48 8d 0d 41 e5 00 00 	lea    rcx,[rip+0xe541]        # 140010100 <__mingwthr_cs>
   140001bbf:	48 83 c4 28          	add    rsp,0x28
   140001bc3:	5b                   	pop    rbx
   140001bc4:	5e                   	pop    rsi
   140001bc5:	48 ff 25 7c f6 00 00 	rex.W jmp QWORD PTR [rip+0xf67c]        # 140011248 <__imp_LeaveCriticalSection>

0000000140001bcc <___w64_mingwthr_add_key_dtor>:
   140001bcc:	57                   	push   rdi
   140001bcd:	56                   	push   rsi
   140001bce:	53                   	push   rbx
   140001bcf:	48 83 ec 20          	sub    rsp,0x20
   140001bd3:	8b 05 0f e5 00 00    	mov    eax,DWORD PTR [rip+0xe50f]        # 1400100e8 <__mingwthr_cs_init>
   140001bd9:	89 cf                	mov    edi,ecx
   140001bdb:	48 89 d6             	mov    rsi,rdx
   140001bde:	85 c0                	test   eax,eax
   140001be0:	74 4e                	je     140001c30 <___w64_mingwthr_add_key_dtor+0x64>
   140001be2:	ba 18 00 00 00       	mov    edx,0x18
   140001be7:	b9 01 00 00 00       	mov    ecx,0x1
   140001bec:	e8 af 8f 00 00       	call   14000aba0 <calloc>
   140001bf1:	48 89 c3             	mov    rbx,rax
   140001bf4:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140001bf9:	48 85 db             	test   rbx,rbx
   140001bfc:	74 34                	je     140001c32 <___w64_mingwthr_add_key_dtor+0x66>
   140001bfe:	48 8d 0d fb e4 00 00 	lea    rcx,[rip+0xe4fb]        # 140010100 <__mingwthr_cs>
   140001c05:	89 3b                	mov    DWORD PTR [rbx],edi
   140001c07:	48 89 73 08          	mov    QWORD PTR [rbx+0x8],rsi
   140001c0b:	ff 15 17 f6 00 00    	call   QWORD PTR [rip+0xf617]        # 140011228 <__imp_EnterCriticalSection>
   140001c11:	48 8b 05 c8 e4 00 00 	mov    rax,QWORD PTR [rip+0xe4c8]        # 1400100e0 <key_dtor_list>
   140001c18:	48 8d 0d e1 e4 00 00 	lea    rcx,[rip+0xe4e1]        # 140010100 <__mingwthr_cs>
   140001c1f:	48 89 1d ba e4 00 00 	mov    QWORD PTR [rip+0xe4ba],rbx        # 1400100e0 <key_dtor_list>
   140001c26:	48 89 43 10          	mov    QWORD PTR [rbx+0x10],rax
   140001c2a:	ff 15 18 f6 00 00    	call   QWORD PTR [rip+0xf618]        # 140011248 <__imp_LeaveCriticalSection>
   140001c30:	31 c0                	xor    eax,eax
   140001c32:	48 83 c4 20          	add    rsp,0x20
   140001c36:	5b                   	pop    rbx
   140001c37:	5e                   	pop    rsi
   140001c38:	5f                   	pop    rdi
   140001c39:	c3                   	ret

0000000140001c3a <___w64_mingwthr_remove_key_dtor>:
   140001c3a:	53                   	push   rbx
   140001c3b:	48 83 ec 20          	sub    rsp,0x20
   140001c3f:	8b 05 a3 e4 00 00    	mov    eax,DWORD PTR [rip+0xe4a3]        # 1400100e8 <__mingwthr_cs_init>
   140001c45:	89 cb                	mov    ebx,ecx
   140001c47:	85 c0                	test   eax,eax
   140001c49:	74 5b                	je     140001ca6 <___w64_mingwthr_remove_key_dtor+0x6c>
   140001c4b:	48 8d 0d ae e4 00 00 	lea    rcx,[rip+0xe4ae]        # 140010100 <__mingwthr_cs>
   140001c52:	ff 15 d0 f5 00 00    	call   QWORD PTR [rip+0xf5d0]        # 140011228 <__imp_EnterCriticalSection>
   140001c58:	48 8b 0d 81 e4 00 00 	mov    rcx,QWORD PTR [rip+0xe481]        # 1400100e0 <key_dtor_list>
   140001c5f:	31 c0                	xor    eax,eax
   140001c61:	48 85 c9             	test   rcx,rcx
   140001c64:	74 33                	je     140001c99 <___w64_mingwthr_remove_key_dtor+0x5f>
   140001c66:	8b 11                	mov    edx,DWORD PTR [rcx]
   140001c68:	39 da                	cmp    edx,ebx
   140001c6a:	75 21                	jne    140001c8d <___w64_mingwthr_remove_key_dtor+0x53>
   140001c6c:	48 85 c0             	test   rax,rax
   140001c6f:	75 0d                	jne    140001c7e <___w64_mingwthr_remove_key_dtor+0x44>
   140001c71:	48 8b 41 10          	mov    rax,QWORD PTR [rcx+0x10]
   140001c75:	48 89 05 64 e4 00 00 	mov    QWORD PTR [rip+0xe464],rax        # 1400100e0 <key_dtor_list>
   140001c7c:	eb 08                	jmp    140001c86 <___w64_mingwthr_remove_key_dtor+0x4c>
   140001c7e:	48 8b 51 10          	mov    rdx,QWORD PTR [rcx+0x10]
   140001c82:	48 89 50 10          	mov    QWORD PTR [rax+0x10],rdx
   140001c86:	e8 35 8f 00 00       	call   14000abc0 <free>
   140001c8b:	eb 0c                	jmp    140001c99 <___w64_mingwthr_remove_key_dtor+0x5f>
   140001c8d:	48 8b 51 10          	mov    rdx,QWORD PTR [rcx+0x10]
   140001c91:	48 89 c8             	mov    rax,rcx
   140001c94:	48 89 d1             	mov    rcx,rdx
   140001c97:	eb c8                	jmp    140001c61 <___w64_mingwthr_remove_key_dtor+0x27>
   140001c99:	48 8d 0d 60 e4 00 00 	lea    rcx,[rip+0xe460]        # 140010100 <__mingwthr_cs>
   140001ca0:	ff 15 a2 f5 00 00    	call   QWORD PTR [rip+0xf5a2]        # 140011248 <__imp_LeaveCriticalSection>
   140001ca6:	31 c0                	xor    eax,eax
   140001ca8:	48 83 c4 20          	add    rsp,0x20
   140001cac:	5b                   	pop    rbx
   140001cad:	c3                   	ret

0000000140001cae <__mingw_TLScallback>:
   140001cae:	53                   	push   rbx
   140001caf:	48 83 ec 20          	sub    rsp,0x20
   140001cb3:	83 fa 02             	cmp    edx,0x2
   140001cb6:	0f 84 8c 00 00 00    	je     140001d48 <__mingw_TLScallback+0x9a>
   140001cbc:	77 06                	ja     140001cc4 <__mingw_TLScallback+0x16>
   140001cbe:	85 d2                	test   edx,edx
   140001cc0:	75 10                	jne    140001cd2 <__mingw_TLScallback+0x24>
   140001cc2:	eb 31                	jmp    140001cf5 <__mingw_TLScallback+0x47>
   140001cc4:	83 fa 03             	cmp    edx,0x3
   140001cc7:	0f 84 82 00 00 00    	je     140001d4f <__mingw_TLScallback+0xa1>
   140001ccd:	e9 8c 00 00 00       	jmp    140001d5e <__mingw_TLScallback+0xb0>
   140001cd2:	8b 05 10 e4 00 00    	mov    eax,DWORD PTR [rip+0xe410]        # 1400100e8 <__mingwthr_cs_init>
   140001cd8:	85 c0                	test   eax,eax
   140001cda:	75 0d                	jne    140001ce9 <__mingw_TLScallback+0x3b>
   140001cdc:	48 8d 0d 1d e4 00 00 	lea    rcx,[rip+0xe41d]        # 140010100 <__mingwthr_cs>
   140001ce3:	ff 15 4f f5 00 00    	call   QWORD PTR [rip+0xf54f]        # 140011238 <__imp_InitializeCriticalSection>
   140001ce9:	c7 05 f5 e3 00 00 01 	mov    DWORD PTR [rip+0xe3f5],0x1        # 1400100e8 <__mingwthr_cs_init>
   140001cf0:	00 00 00 
   140001cf3:	eb 69                	jmp    140001d5e <__mingw_TLScallback+0xb0>
   140001cf5:	8b 05 ed e3 00 00    	mov    eax,DWORD PTR [rip+0xe3ed]        # 1400100e8 <__mingwthr_cs_init>
   140001cfb:	85 c0                	test   eax,eax
   140001cfd:	74 05                	je     140001d04 <__mingw_TLScallback+0x56>
   140001cff:	e8 6c fe ff ff       	call   140001b70 <__mingwthr_run_key_dtors.part.0>
   140001d04:	8b 05 de e3 00 00    	mov    eax,DWORD PTR [rip+0xe3de]        # 1400100e8 <__mingwthr_cs_init>
   140001d0a:	ff c8                	dec    eax
   140001d0c:	75 50                	jne    140001d5e <__mingw_TLScallback+0xb0>
   140001d0e:	48 8b 0d cb e3 00 00 	mov    rcx,QWORD PTR [rip+0xe3cb]        # 1400100e0 <key_dtor_list>
   140001d15:	48 85 c9             	test   rcx,rcx
   140001d18:	74 0e                	je     140001d28 <__mingw_TLScallback+0x7a>
   140001d1a:	48 8b 59 10          	mov    rbx,QWORD PTR [rcx+0x10]
   140001d1e:	e8 9d 8e 00 00       	call   14000abc0 <free>
   140001d23:	48 89 d9             	mov    rcx,rbx
   140001d26:	eb ed                	jmp    140001d15 <__mingw_TLScallback+0x67>
   140001d28:	31 c0                	xor    eax,eax
   140001d2a:	31 d2                	xor    edx,edx
   140001d2c:	48 8d 0d cd e3 00 00 	lea    rcx,[rip+0xe3cd]        # 140010100 <__mingwthr_cs>
   140001d33:	48 89 05 a6 e3 00 00 	mov    QWORD PTR [rip+0xe3a6],rax        # 1400100e0 <key_dtor_list>
   140001d3a:	89 15 a8 e3 00 00    	mov    DWORD PTR [rip+0xe3a8],edx        # 1400100e8 <__mingwthr_cs_init>
   140001d40:	ff 15 da f4 00 00    	call   QWORD PTR [rip+0xf4da]        # 140011220 <__IAT_start__>
   140001d46:	eb 16                	jmp    140001d5e <__mingw_TLScallback+0xb0>
   140001d48:	e8 23 00 00 00       	call   140001d70 <_fpreset>
   140001d4d:	eb 0f                	jmp    140001d5e <__mingw_TLScallback+0xb0>
   140001d4f:	8b 05 93 e3 00 00    	mov    eax,DWORD PTR [rip+0xe393]        # 1400100e8 <__mingwthr_cs_init>
   140001d55:	85 c0                	test   eax,eax
   140001d57:	74 05                	je     140001d5e <__mingw_TLScallback+0xb0>
   140001d59:	e8 12 fe ff ff       	call   140001b70 <__mingwthr_run_key_dtors.part.0>
   140001d5e:	b8 01 00 00 00       	mov    eax,0x1
   140001d63:	48 83 c4 20          	add    rsp,0x20
   140001d67:	5b                   	pop    rbx
   140001d68:	c3                   	ret
   140001d69:	90                   	nop
   140001d6a:	90                   	nop
   140001d6b:	90                   	nop
   140001d6c:	90                   	nop
   140001d6d:	90                   	nop
   140001d6e:	90                   	nop
   140001d6f:	90                   	nop

0000000140001d70 <_fpreset>:
   140001d70:	db e3                	fninit
   140001d72:	c3                   	ret
   140001d73:	90                   	nop
   140001d74:	90                   	nop
   140001d75:	90                   	nop
   140001d76:	90                   	nop
   140001d77:	90                   	nop
   140001d78:	90                   	nop
   140001d79:	90                   	nop
   140001d7a:	90                   	nop
   140001d7b:	90                   	nop
   140001d7c:	90                   	nop
   140001d7d:	90                   	nop
   140001d7e:	90                   	nop
   140001d7f:	90                   	nop

0000000140001d80 <_ValidateImageBase>:
   140001d80:	31 c0                	xor    eax,eax
   140001d82:	66 81 39 4d 5a       	cmp    WORD PTR [rcx],0x5a4d
   140001d87:	75 1a                	jne    140001da3 <_ValidateImageBase+0x23>
   140001d89:	48 63 51 3c          	movsxd rdx,DWORD PTR [rcx+0x3c]
   140001d8d:	48 01 d1             	add    rcx,rdx
   140001d90:	81 39 50 45 00 00    	cmp    DWORD PTR [rcx],0x4550
   140001d96:	75 0b                	jne    140001da3 <_ValidateImageBase+0x23>
   140001d98:	31 c0                	xor    eax,eax
   140001d9a:	66 81 79 18 0b 02    	cmp    WORD PTR [rcx+0x18],0x20b
   140001da0:	0f 94 c0             	sete   al
   140001da3:	c3                   	ret

0000000140001da4 <_FindPESection>:
   140001da4:	45 31 c0             	xor    r8d,r8d
   140001da7:	48 63 41 3c          	movsxd rax,DWORD PTR [rcx+0x3c]
   140001dab:	48 01 c1             	add    rcx,rax
   140001dae:	0f b7 41 14          	movzx  eax,WORD PTR [rcx+0x14]
   140001db2:	44 0f b7 49 06       	movzx  r9d,WORD PTR [rcx+0x6]
   140001db7:	48 8d 44 01 18       	lea    rax,[rcx+rax*1+0x18]
   140001dbc:	45 39 c8             	cmp    r8d,r9d
   140001dbf:	73 1d                	jae    140001dde <_FindPESection+0x3a>
   140001dc1:	44 8b 50 0c          	mov    r10d,DWORD PTR [rax+0xc]
   140001dc5:	4c 89 d1             	mov    rcx,r10
   140001dc8:	4c 39 d2             	cmp    rdx,r10
   140001dcb:	72 08                	jb     140001dd5 <_FindPESection+0x31>
   140001dcd:	03 48 08             	add    ecx,DWORD PTR [rax+0x8]
   140001dd0:	48 39 ca             	cmp    rdx,rcx
   140001dd3:	72 0b                	jb     140001de0 <_FindPESection+0x3c>
   140001dd5:	41 ff c0             	inc    r8d
   140001dd8:	48 83 c0 28          	add    rax,0x28
   140001ddc:	eb de                	jmp    140001dbc <_FindPESection+0x18>
   140001dde:	31 c0                	xor    eax,eax
   140001de0:	c3                   	ret

0000000140001de1 <_FindPESectionByName>:
   140001de1:	55                   	push   rbp
   140001de2:	57                   	push   rdi
   140001de3:	56                   	push   rsi
   140001de4:	53                   	push   rbx
   140001de5:	48 83 ec 28          	sub    rsp,0x28
   140001de9:	48 89 cf             	mov    rdi,rcx
   140001dec:	e8 2f 8e 00 00       	call   14000ac20 <strlen>
   140001df1:	48 83 f8 08          	cmp    rax,0x8
   140001df5:	76 04                	jbe    140001dfb <_FindPESectionByName+0x1a>
   140001df7:	31 db                	xor    ebx,ebx
   140001df9:	eb 4a                	jmp    140001e45 <_FindPESectionByName+0x64>
   140001dfb:	4c 8b 05 3e ab 00 00 	mov    r8,QWORD PTR [rip+0xab3e]        # 14000c940 <.refptr.__ImageBase>
   140001e02:	4c 89 c1             	mov    rcx,r8
   140001e05:	e8 76 ff ff ff       	call   140001d80 <_ValidateImageBase>
   140001e0a:	85 c0                	test   eax,eax
   140001e0c:	74 e9                	je     140001df7 <_FindPESectionByName+0x16>
   140001e0e:	49 63 70 3c          	movsxd rsi,DWORD PTR [r8+0x3c]
   140001e12:	31 ed                	xor    ebp,ebp
   140001e14:	4c 01 c6             	add    rsi,r8
   140001e17:	0f b7 46 14          	movzx  eax,WORD PTR [rsi+0x14]
   140001e1b:	48 8d 5c 06 18       	lea    rbx,[rsi+rax*1+0x18]
   140001e20:	0f b7 46 06          	movzx  eax,WORD PTR [rsi+0x6]
   140001e24:	39 c5                	cmp    ebp,eax
   140001e26:	73 cf                	jae    140001df7 <_FindPESectionByName+0x16>
   140001e28:	41 b8 08 00 00 00    	mov    r8d,0x8
   140001e2e:	48 89 fa             	mov    rdx,rdi
   140001e31:	48 89 d9             	mov    rcx,rbx
   140001e34:	e8 ef 8d 00 00       	call   14000ac28 <strncmp>
   140001e39:	85 c0                	test   eax,eax
   140001e3b:	74 08                	je     140001e45 <_FindPESectionByName+0x64>
   140001e3d:	ff c5                	inc    ebp
   140001e3f:	48 83 c3 28          	add    rbx,0x28
   140001e43:	eb db                	jmp    140001e20 <_FindPESectionByName+0x3f>
   140001e45:	48 89 d8             	mov    rax,rbx
   140001e48:	48 83 c4 28          	add    rsp,0x28
   140001e4c:	5b                   	pop    rbx
   140001e4d:	5e                   	pop    rsi
   140001e4e:	5f                   	pop    rdi
   140001e4f:	5d                   	pop    rbp
   140001e50:	c3                   	ret

0000000140001e51 <__mingw_GetSectionForAddress>:
   140001e51:	48 83 ec 28          	sub    rsp,0x28
   140001e55:	4c 8b 05 e4 aa 00 00 	mov    r8,QWORD PTR [rip+0xaae4]        # 14000c940 <.refptr.__ImageBase>
   140001e5c:	49 89 c9             	mov    r9,rcx
   140001e5f:	4c 89 c1             	mov    rcx,r8
   140001e62:	e8 19 ff ff ff       	call   140001d80 <_ValidateImageBase>
   140001e67:	85 c0                	test   eax,eax
   140001e69:	74 12                	je     140001e7d <__mingw_GetSectionForAddress+0x2c>
   140001e6b:	4c 89 ca             	mov    rdx,r9
   140001e6e:	4c 89 c1             	mov    rcx,r8
   140001e71:	4c 29 c2             	sub    rdx,r8
   140001e74:	48 83 c4 28          	add    rsp,0x28
   140001e78:	e9 27 ff ff ff       	jmp    140001da4 <_FindPESection>
   140001e7d:	31 c0                	xor    eax,eax
   140001e7f:	48 83 c4 28          	add    rsp,0x28
   140001e83:	c3                   	ret

0000000140001e84 <__mingw_GetSectionCount>:
   140001e84:	48 83 ec 28          	sub    rsp,0x28
   140001e88:	4c 8b 05 b1 aa 00 00 	mov    r8,QWORD PTR [rip+0xaab1]        # 14000c940 <.refptr.__ImageBase>
   140001e8f:	4c 89 c1             	mov    rcx,r8
   140001e92:	e8 e9 fe ff ff       	call   140001d80 <_ValidateImageBase>
   140001e97:	85 c0                	test   eax,eax
   140001e99:	74 0a                	je     140001ea5 <__mingw_GetSectionCount+0x21>
   140001e9b:	49 63 40 3c          	movsxd rax,DWORD PTR [r8+0x3c]
   140001e9f:	42 0f b7 44 00 06    	movzx  eax,WORD PTR [rax+r8*1+0x6]
   140001ea5:	48 83 c4 28          	add    rsp,0x28
   140001ea9:	c3                   	ret

0000000140001eaa <_FindPESectionExec>:
   140001eaa:	48 83 ec 28          	sub    rsp,0x28
   140001eae:	4c 8b 0d 8b aa 00 00 	mov    r9,QWORD PTR [rip+0xaa8b]        # 14000c940 <.refptr.__ImageBase>
   140001eb5:	49 89 c8             	mov    r8,rcx
   140001eb8:	4c 89 c9             	mov    rcx,r9
   140001ebb:	e8 c0 fe ff ff       	call   140001d80 <_ValidateImageBase>
   140001ec0:	85 c0                	test   eax,eax
   140001ec2:	b8 00 00 00 00       	mov    eax,0x0
   140001ec7:	74 32                	je     140001efb <_FindPESectionExec+0x51>
   140001ec9:	49 63 51 3c          	movsxd rdx,DWORD PTR [r9+0x3c]
   140001ecd:	4c 01 ca             	add    rdx,r9
   140001ed0:	0f b7 42 14          	movzx  eax,WORD PTR [rdx+0x14]
   140001ed4:	0f b7 4a 06          	movzx  ecx,WORD PTR [rdx+0x6]
   140001ed8:	48 8d 44 02 18       	lea    rax,[rdx+rax*1+0x18]
   140001edd:	31 d2                	xor    edx,edx
   140001edf:	39 ca                	cmp    edx,ecx
   140001ee1:	73 16                	jae    140001ef9 <_FindPESectionExec+0x4f>
   140001ee3:	f6 40 27 20          	test   BYTE PTR [rax+0x27],0x20
   140001ee7:	74 08                	je     140001ef1 <_FindPESectionExec+0x47>
   140001ee9:	4d 85 c0             	test   r8,r8
   140001eec:	74 0d                	je     140001efb <_FindPESectionExec+0x51>
   140001eee:	49 ff c8             	dec    r8
   140001ef1:	ff c2                	inc    edx
   140001ef3:	48 83 c0 28          	add    rax,0x28
   140001ef7:	eb e6                	jmp    140001edf <_FindPESectionExec+0x35>
   140001ef9:	31 c0                	xor    eax,eax
   140001efb:	48 83 c4 28          	add    rsp,0x28
   140001eff:	c3                   	ret

0000000140001f00 <_GetPEImageBase>:
   140001f00:	48 83 ec 28          	sub    rsp,0x28
   140001f04:	4c 8b 05 35 aa 00 00 	mov    r8,QWORD PTR [rip+0xaa35]        # 14000c940 <.refptr.__ImageBase>
   140001f0b:	4c 89 c1             	mov    rcx,r8
   140001f0e:	e8 6d fe ff ff       	call   140001d80 <_ValidateImageBase>
   140001f13:	85 c0                	test   eax,eax
   140001f15:	b8 00 00 00 00       	mov    eax,0x0
   140001f1a:	49 0f 45 c0          	cmovne rax,r8
   140001f1e:	48 83 c4 28          	add    rsp,0x28
   140001f22:	c3                   	ret

0000000140001f23 <_IsNonwritableInCurrentImage>:
   140001f23:	48 83 ec 28          	sub    rsp,0x28
   140001f27:	4c 8b 05 12 aa 00 00 	mov    r8,QWORD PTR [rip+0xaa12]        # 14000c940 <.refptr.__ImageBase>
   140001f2e:	49 89 c9             	mov    r9,rcx
   140001f31:	4c 89 c1             	mov    rcx,r8
   140001f34:	e8 47 fe ff ff       	call   140001d80 <_ValidateImageBase>
   140001f39:	85 c0                	test   eax,eax
   140001f3b:	74 20                	je     140001f5d <_IsNonwritableInCurrentImage+0x3a>
   140001f3d:	4c 89 ca             	mov    rdx,r9
   140001f40:	4c 89 c1             	mov    rcx,r8
   140001f43:	4c 29 c2             	sub    rdx,r8
   140001f46:	e8 59 fe ff ff       	call   140001da4 <_FindPESection>
   140001f4b:	48 89 c2             	mov    rdx,rax
   140001f4e:	31 c0                	xor    eax,eax
   140001f50:	48 85 d2             	test   rdx,rdx
   140001f53:	74 08                	je     140001f5d <_IsNonwritableInCurrentImage+0x3a>
   140001f55:	8b 42 24             	mov    eax,DWORD PTR [rdx+0x24]
   140001f58:	f7 d0                	not    eax
   140001f5a:	c1 e8 1f             	shr    eax,0x1f
   140001f5d:	48 83 c4 28          	add    rsp,0x28
   140001f61:	c3                   	ret

0000000140001f62 <__mingw_enum_import_library_names>:
   140001f62:	53                   	push   rbx
   140001f63:	48 83 ec 20          	sub    rsp,0x20
   140001f67:	4c 8b 1d d2 a9 00 00 	mov    r11,QWORD PTR [rip+0xa9d2]        # 14000c940 <.refptr.__ImageBase>
   140001f6e:	89 cb                	mov    ebx,ecx
   140001f70:	4c 89 d9             	mov    rcx,r11
   140001f73:	e8 08 fe ff ff       	call   140001d80 <_ValidateImageBase>
   140001f78:	85 c0                	test   eax,eax
   140001f7a:	b8 00 00 00 00       	mov    eax,0x0
   140001f7f:	74 45                	je     140001fc6 <__mingw_enum_import_library_names+0x64>
   140001f81:	49 63 43 3c          	movsxd rax,DWORD PTR [r11+0x3c]
   140001f85:	42 8b 94 18 90 00 00 	mov    edx,DWORD PTR [rax+r11*1+0x90]
   140001f8c:	00 
   140001f8d:	31 c0                	xor    eax,eax
   140001f8f:	85 d2                	test   edx,edx
   140001f91:	74 33                	je     140001fc6 <__mingw_enum_import_library_names+0x64>
   140001f93:	4c 89 d9             	mov    rcx,r11
   140001f96:	e8 09 fe ff ff       	call   140001da4 <_FindPESection>
   140001f9b:	48 85 c0             	test   rax,rax
   140001f9e:	74 26                	je     140001fc6 <__mingw_enum_import_library_names+0x64>
   140001fa0:	4a 8d 04 1a          	lea    rax,[rdx+r11*1]
   140001fa4:	83 78 04 00          	cmp    DWORD PTR [rax+0x4],0x0
   140001fa8:	75 06                	jne    140001fb0 <__mingw_enum_import_library_names+0x4e>
   140001faa:	83 78 0c 00          	cmp    DWORD PTR [rax+0xc],0x0
   140001fae:	74 14                	je     140001fc4 <__mingw_enum_import_library_names+0x62>
   140001fb0:	85 db                	test   ebx,ebx
   140001fb2:	7f 08                	jg     140001fbc <__mingw_enum_import_library_names+0x5a>
   140001fb4:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140001fb7:	4c 01 d8             	add    rax,r11
   140001fba:	eb 0a                	jmp    140001fc6 <__mingw_enum_import_library_names+0x64>
   140001fbc:	ff cb                	dec    ebx
   140001fbe:	48 83 c0 14          	add    rax,0x14
   140001fc2:	eb e0                	jmp    140001fa4 <__mingw_enum_import_library_names+0x42>
   140001fc4:	31 c0                	xor    eax,eax
   140001fc6:	48 83 c4 20          	add    rsp,0x20
   140001fca:	5b                   	pop    rbx
   140001fcb:	c3                   	ret
   140001fcc:	90                   	nop
   140001fcd:	90                   	nop
   140001fce:	90                   	nop
   140001fcf:	90                   	nop

0000000140001fd0 <___chkstk_ms>:
   140001fd0:	51                   	push   rcx
   140001fd1:	50                   	push   rax
   140001fd2:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140001fd8:	48 8d 4c 24 18       	lea    rcx,[rsp+0x18]
   140001fdd:	72 19                	jb     140001ff8 <___chkstk_ms+0x28>
   140001fdf:	48 81 e9 00 10 00 00 	sub    rcx,0x1000
   140001fe6:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140001fea:	48 2d 00 10 00 00    	sub    rax,0x1000
   140001ff0:	48 3d 00 10 00 00    	cmp    rax,0x1000
   140001ff6:	77 e7                	ja     140001fdf <___chkstk_ms+0xf>
   140001ff8:	48 29 c1             	sub    rcx,rax
   140001ffb:	48 83 09 00          	or     QWORD PTR [rcx],0x0
   140001fff:	58                   	pop    rax
   140002000:	59                   	pop    rcx
   140002001:	c3                   	ret
   140002002:	90                   	nop
   140002003:	90                   	nop
   140002004:	90                   	nop
   140002005:	90                   	nop
   140002006:	90                   	nop
   140002007:	90                   	nop
   140002008:	90                   	nop
   140002009:	90                   	nop
   14000200a:	90                   	nop
   14000200b:	90                   	nop
   14000200c:	90                   	nop
   14000200d:	90                   	nop
   14000200e:	90                   	nop
   14000200f:	90                   	nop

0000000140002010 <__mingw_printf>:
   140002010:	56                   	push   rsi
   140002011:	53                   	push   rbx
   140002012:	48 83 ec 48          	sub    rsp,0x48
   140002016:	48 89 cb             	mov    rbx,rcx
   140002019:	48 8d 44 24 68       	lea    rax,[rsp+0x68]
   14000201e:	b9 01 00 00 00       	mov    ecx,0x1
   140002023:	48 89 54 24 68       	mov    QWORD PTR [rsp+0x68],rdx
   140002028:	4c 89 44 24 70       	mov    QWORD PTR [rsp+0x70],r8
   14000202d:	4c 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],r9
   140002032:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140002037:	e8 c4 8a 00 00       	call   14000ab00 <__acrt_iob_func>
   14000203c:	48 89 c1             	mov    rcx,rax
   14000203f:	e8 cc 89 00 00       	call   14000aa10 <_lock_file>
   140002044:	48 8b 74 24 38       	mov    rsi,QWORD PTR [rsp+0x38]
   140002049:	b9 01 00 00 00       	mov    ecx,0x1
   14000204e:	e8 ad 8a 00 00       	call   14000ab00 <__acrt_iob_func>
   140002053:	49 89 d9             	mov    r9,rbx
   140002056:	45 31 c0             	xor    r8d,r8d
   140002059:	b9 00 60 00 00       	mov    ecx,0x6000
   14000205e:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   140002063:	48 89 c2             	mov    rdx,rax
   140002066:	e8 9d 38 00 00       	call   140005908 <__mingw_pformat>
   14000206b:	b9 01 00 00 00       	mov    ecx,0x1
   140002070:	89 c3                	mov    ebx,eax
   140002072:	e8 89 8a 00 00       	call   14000ab00 <__acrt_iob_func>
   140002077:	48 89 c1             	mov    rcx,rax
   14000207a:	e8 f3 89 00 00       	call   14000aa72 <_unlock_file>
   14000207f:	89 d8                	mov    eax,ebx
   140002081:	48 83 c4 48          	add    rsp,0x48
   140002085:	5b                   	pop    rbx
   140002086:	5e                   	pop    rsi
   140002087:	c3                   	ret
   140002088:	90                   	nop
   140002089:	90                   	nop
   14000208a:	90                   	nop
   14000208b:	90                   	nop
   14000208c:	90                   	nop
   14000208d:	90                   	nop
   14000208e:	90                   	nop
   14000208f:	90                   	nop

0000000140002090 <__mingw_scanf>:
   140002090:	56                   	push   rsi
   140002091:	53                   	push   rbx
   140002092:	48 83 ec 38          	sub    rsp,0x38
   140002096:	48 89 cb             	mov    rbx,rcx
   140002099:	48 8d 74 24 58       	lea    rsi,[rsp+0x58]
   14000209e:	31 c9                	xor    ecx,ecx
   1400020a0:	48 89 54 24 58       	mov    QWORD PTR [rsp+0x58],rdx
   1400020a5:	4c 89 44 24 60       	mov    QWORD PTR [rsp+0x60],r8
   1400020aa:	4c 89 4c 24 68       	mov    QWORD PTR [rsp+0x68],r9
   1400020af:	48 89 74 24 28       	mov    QWORD PTR [rsp+0x28],rsi
   1400020b4:	e8 47 8a 00 00       	call   14000ab00 <__acrt_iob_func>
   1400020b9:	49 89 f0             	mov    r8,rsi
   1400020bc:	48 89 da             	mov    rdx,rbx
   1400020bf:	48 89 c1             	mov    rcx,rax
   1400020c2:	e8 39 00 00 00       	call   140002100 <__mingw_vfscanf>
   1400020c7:	48 83 c4 38          	add    rsp,0x38
   1400020cb:	5b                   	pop    rbx
   1400020cc:	5e                   	pop    rsi
   1400020cd:	c3                   	ret

00000001400020ce <__mingw_vscanf>:
   1400020ce:	56                   	push   rsi
   1400020cf:	53                   	push   rbx
   1400020d0:	48 83 ec 28          	sub    rsp,0x28
   1400020d4:	48 89 cb             	mov    rbx,rcx
   1400020d7:	31 c9                	xor    ecx,ecx
   1400020d9:	48 89 d6             	mov    rsi,rdx
   1400020dc:	e8 1f 8a 00 00       	call   14000ab00 <__acrt_iob_func>
   1400020e1:	49 89 f0             	mov    r8,rsi
   1400020e4:	48 89 da             	mov    rdx,rbx
   1400020e7:	48 89 c1             	mov    rcx,rax
   1400020ea:	48 83 c4 28          	add    rsp,0x28
   1400020ee:	5b                   	pop    rbx
   1400020ef:	5e                   	pop    rsi
   1400020f0:	e9 0b 00 00 00       	jmp    140002100 <__mingw_vfscanf>
   1400020f5:	90                   	nop
   1400020f6:	90                   	nop
   1400020f7:	90                   	nop
   1400020f8:	90                   	nop
   1400020f9:	90                   	nop
   1400020fa:	90                   	nop
   1400020fb:	90                   	nop
   1400020fc:	90                   	nop
   1400020fd:	90                   	nop
   1400020fe:	90                   	nop
   1400020ff:	90                   	nop

0000000140002100 <__mingw_vfscanf>:
   140002100:	57                   	push   rdi
   140002101:	b8 40 10 00 00       	mov    eax,0x1040
   140002106:	e8 c5 fe ff ff       	call   140001fd0 <___chkstk_ms>
   14000210b:	48 29 c4             	sub    rsp,rax
   14000210e:	31 c0                	xor    eax,eax
   140002110:	49 89 c9             	mov    r9,rcx
   140002113:	48 8d 7c 24 28       	lea    rdi,[rsp+0x28]
   140002118:	b9 06 04 00 00       	mov    ecx,0x406
   14000211d:	f3 ab                	rep stos DWORD PTR es:[rdi],eax
   14000211f:	48 8d 4c 24 28       	lea    rcx,[rsp+0x28]
   140002124:	4c 89 4c 24 28       	mov    QWORD PTR [rsp+0x28],r9
   140002129:	e8 87 02 00 00       	call   1400023b5 <__mingw_sformat>
   14000212e:	48 81 c4 40 10 00 00 	add    rsp,0x1040
   140002135:	5f                   	pop    rdi
   140002136:	c3                   	ret
   140002137:	90                   	nop
   140002138:	90                   	nop
   140002139:	90                   	nop
   14000213a:	90                   	nop
   14000213b:	90                   	nop
   14000213c:	90                   	nop
   14000213d:	90                   	nop
   14000213e:	90                   	nop
   14000213f:	90                   	nop

0000000140002140 <resize_gcollect>:
   140002140:	53                   	push   rbx
   140002141:	48 83 ec 20          	sub    rsp,0x20
   140002145:	48 89 cb             	mov    rbx,rcx
   140002148:	48 85 c9             	test   rcx,rcx
   14000214b:	74 06                	je     140002153 <resize_gcollect+0x13>
   14000214d:	48 83 39 1f          	cmp    QWORD PTR [rcx],0x1f
   140002151:	76 16                	jbe    140002169 <resize_gcollect+0x29>
   140002153:	b9 10 01 00 00       	mov    ecx,0x110
   140002158:	e8 93 8a 00 00       	call   14000abf0 <malloc>
   14000215d:	31 d2                	xor    edx,edx
   14000215f:	48 89 10             	mov    QWORD PTR [rax],rdx
   140002162:	48 89 58 08          	mov    QWORD PTR [rax+0x8],rbx
   140002166:	48 89 c3             	mov    rbx,rax
   140002169:	48 89 d8             	mov    rax,rbx
   14000216c:	48 83 c4 20          	add    rsp,0x20
   140002170:	5b                   	pop    rbx
   140002171:	c3                   	ret

0000000140002172 <optimize_alloc>:
   140002172:	53                   	push   rbx
   140002173:	48 83 ec 20          	sub    rsp,0x20
   140002177:	48 89 cb             	mov    rbx,rcx
   14000217a:	48 85 c9             	test   rcx,rcx
   14000217d:	74 1d                	je     14000219c <optimize_alloc+0x2a>
   14000217f:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   140002182:	48 85 c9             	test   rcx,rcx
   140002185:	74 15                	je     14000219c <optimize_alloc+0x2a>
   140002187:	48 29 ca             	sub    rdx,rcx
   14000218a:	4c 39 c2             	cmp    rdx,r8
   14000218d:	74 0d                	je     14000219c <optimize_alloc+0x2a>
   14000218f:	e8 74 8a 00 00       	call   14000ac08 <realloc>
   140002194:	48 85 c0             	test   rax,rax
   140002197:	74 03                	je     14000219c <optimize_alloc+0x2a>
   140002199:	48 89 03             	mov    QWORD PTR [rbx],rax
   14000219c:	48 83 c4 20          	add    rsp,0x20
   1400021a0:	5b                   	pop    rbx
   1400021a1:	c3                   	ret

00000001400021a2 <release_ptrs>:
   1400021a2:	57                   	push   rdi
   1400021a3:	56                   	push   rsi
   1400021a4:	53                   	push   rbx
   1400021a5:	48 83 ec 20          	sub    rsp,0x20
   1400021a9:	48 89 cf             	mov    rdi,rcx
   1400021ac:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   1400021af:	48 89 d3             	mov    rbx,rdx
   1400021b2:	e8 09 8a 00 00       	call   14000abc0 <free>
   1400021b7:	31 c9                	xor    ecx,ecx
   1400021b9:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   1400021bc:	48 8b 1f             	mov    rbx,QWORD PTR [rdi]
   1400021bf:	48 85 db             	test   rbx,rbx
   1400021c2:	74 3e                	je     140002202 <release_ptrs+0x60>
   1400021c4:	31 f6                	xor    esi,esi
   1400021c6:	48 3b 33             	cmp    rsi,QWORD PTR [rbx]
   1400021c9:	73 1c                	jae    1400021e7 <release_ptrs+0x45>
   1400021cb:	48 8b 44 f3 10       	mov    rax,QWORD PTR [rbx+rsi*8+0x10]
   1400021d0:	48 8b 08             	mov    rcx,QWORD PTR [rax]
   1400021d3:	e8 e8 89 00 00       	call   14000abc0 <free>
   1400021d8:	48 8b 44 f3 10       	mov    rax,QWORD PTR [rbx+rsi*8+0x10]
   1400021dd:	31 d2                	xor    edx,edx
   1400021df:	48 ff c6             	inc    rsi
   1400021e2:	48 89 10             	mov    QWORD PTR [rax],rdx
   1400021e5:	eb df                	jmp    1400021c6 <release_ptrs+0x24>
   1400021e7:	48 8b 73 08          	mov    rsi,QWORD PTR [rbx+0x8]
   1400021eb:	48 89 d9             	mov    rcx,rbx
   1400021ee:	e8 cd 89 00 00       	call   14000abc0 <free>
   1400021f3:	48 85 f6             	test   rsi,rsi
   1400021f6:	74 05                	je     1400021fd <release_ptrs+0x5b>
   1400021f8:	48 89 f3             	mov    rbx,rsi
   1400021fb:	eb c7                	jmp    1400021c4 <release_ptrs+0x22>
   1400021fd:	31 c0                	xor    eax,eax
   1400021ff:	48 89 07             	mov    QWORD PTR [rdi],rax
   140002202:	48 83 c4 20          	add    rsp,0x20
   140002206:	5b                   	pop    rbx
   140002207:	5e                   	pop    rsi
   140002208:	5f                   	pop    rdi
   140002209:	c3                   	ret

000000014000220a <resize_wbuf>:
   14000220a:	57                   	push   rdi
   14000220b:	56                   	push   rsi
   14000220c:	53                   	push   rbx
   14000220d:	48 83 ec 20          	sub    rsp,0x20
   140002211:	48 8b 1a             	mov    rbx,QWORD PTR [rdx]
   140002214:	48 89 d7             	mov    rdi,rdx
   140002217:	4c 89 c6             	mov    rsi,r8
   14000221a:	48 39 cb             	cmp    rbx,rcx
   14000221d:	75 45                	jne    140002264 <resize_wbuf+0x5a>
   14000221f:	48 01 db             	add    rbx,rbx
   140002222:	b8 00 01 00 00       	mov    eax,0x100
   140002227:	48 39 c3             	cmp    rbx,rax
   14000222a:	48 0f 42 d8          	cmovb  rbx,rax
   14000222e:	4d 85 c0             	test   r8,r8
   140002231:	75 0f                	jne    140002242 <resize_wbuf+0x38>
   140002233:	48 89 d9             	mov    rcx,rbx
   140002236:	e8 b5 89 00 00       	call   14000abf0 <malloc>
   14000223b:	48 85 c0             	test   rax,rax
   14000223e:	75 1e                	jne    14000225e <resize_wbuf+0x54>
   140002240:	eb 18                	jmp    14000225a <resize_wbuf+0x50>
   140002242:	48 89 da             	mov    rdx,rbx
   140002245:	4c 89 c1             	mov    rcx,r8
   140002248:	e8 bb 89 00 00       	call   14000ac08 <realloc>
   14000224d:	48 85 c0             	test   rax,rax
   140002250:	75 0c                	jne    14000225e <resize_wbuf+0x54>
   140002252:	48 89 f1             	mov    rcx,rsi
   140002255:	e8 66 89 00 00       	call   14000abc0 <free>
   14000225a:	31 f6                	xor    esi,esi
   14000225c:	eb 06                	jmp    140002264 <resize_wbuf+0x5a>
   14000225e:	48 89 1f             	mov    QWORD PTR [rdi],rbx
   140002261:	48 89 c6             	mov    rsi,rax
   140002264:	48 89 f0             	mov    rax,rsi
   140002267:	48 83 c4 20          	add    rsp,0x20
   14000226b:	5b                   	pop    rbx
   14000226c:	5e                   	pop    rsi
   14000226d:	5f                   	pop    rdi
   14000226e:	c3                   	ret

000000014000226f <cleanup_return>:
   14000226f:	41 54                	push   r12
   140002271:	55                   	push   rbp
   140002272:	57                   	push   rdi
   140002273:	56                   	push   rsi
   140002274:	53                   	push   rbx
   140002275:	48 83 ec 20          	sub    rsp,0x20
   140002279:	89 cd                	mov    ebp,ecx
   14000227b:	48 89 d7             	mov    rdi,rdx
   14000227e:	4c 89 c6             	mov    rsi,r8
   140002281:	4c 89 cb             	mov    rbx,r9
   140002284:	83 f9 ff             	cmp    ecx,0xffffffff
   140002287:	75 0d                	jne    140002296 <cleanup_return+0x27>
   140002289:	4c 89 ca             	mov    rdx,r9
   14000228c:	48 89 f9             	mov    rcx,rdi
   14000228f:	e8 0e ff ff ff       	call   1400021a2 <release_ptrs>
   140002294:	eb 3a                	jmp    1400022d0 <cleanup_return+0x61>
   140002296:	48 8b 0a             	mov    rcx,QWORD PTR [rdx]
   140002299:	48 85 c9             	test   rcx,rcx
   14000229c:	74 0e                	je     1400022ac <cleanup_return+0x3d>
   14000229e:	4c 8b 61 08          	mov    r12,QWORD PTR [rcx+0x8]
   1400022a2:	e8 19 89 00 00       	call   14000abc0 <free>
   1400022a7:	4c 89 e1             	mov    rcx,r12
   1400022aa:	eb ed                	jmp    140002299 <cleanup_return+0x2a>
   1400022ac:	31 c9                	xor    ecx,ecx
   1400022ae:	48 89 0f             	mov    QWORD PTR [rdi],rcx
   1400022b1:	48 85 f6             	test   rsi,rsi
   1400022b4:	74 0d                	je     1400022c3 <cleanup_return+0x54>
   1400022b6:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   1400022b9:	e8 02 89 00 00       	call   14000abc0 <free>
   1400022be:	31 d2                	xor    edx,edx
   1400022c0:	48 89 16             	mov    QWORD PTR [rsi],rdx
   1400022c3:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   1400022c6:	e8 f5 88 00 00       	call   14000abc0 <free>
   1400022cb:	31 c0                	xor    eax,eax
   1400022cd:	48 89 03             	mov    QWORD PTR [rbx],rax
   1400022d0:	89 e8                	mov    eax,ebp
   1400022d2:	48 83 c4 20          	add    rsp,0x20
   1400022d6:	5b                   	pop    rbx
   1400022d7:	5e                   	pop    rsi
   1400022d8:	5f                   	pop    rdi
   1400022d9:	5d                   	pop    rbp
   1400022da:	41 5c                	pop    r12
   1400022dc:	c3                   	ret

00000001400022dd <get_va_nth>:
   1400022dd:	45 31 c0             	xor    r8d,r8d
   1400022e0:	89 d0                	mov    eax,edx
   1400022e2:	ff c8                	dec    eax
   1400022e4:	74 05                	je     1400022eb <get_va_nth+0xe>
   1400022e6:	41 b0 01             	mov    r8b,0x1
   1400022e9:	eb f7                	jmp    1400022e2 <get_va_nth+0x5>
   1400022eb:	8d 42 ff             	lea    eax,[rdx-0x1]
   1400022ee:	45 84 c0             	test   r8b,r8b
   1400022f1:	48 8d 04 c1          	lea    rax,[rcx+rax*8]
   1400022f5:	48 0f 45 c8          	cmovne rcx,rax
   1400022f9:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   1400022fc:	c3                   	ret

00000001400022fd <in_ch>:
   1400022fd:	56                   	push   rsi
   1400022fe:	53                   	push   rbx
   1400022ff:	48 83 ec 28          	sub    rsp,0x28
   140002303:	8b 81 0c 10 00 00    	mov    eax,DWORD PTR [rcx+0x100c]
   140002309:	48 89 cb             	mov    rbx,rcx
   14000230c:	48 89 d6             	mov    rsi,rdx
   14000230f:	85 c0                	test   eax,eax
   140002311:	74 10                	je     140002323 <in_ch+0x26>
   140002313:	ff c8                	dec    eax
   140002315:	89 81 0c 10 00 00    	mov    DWORD PTR [rcx+0x100c],eax
   14000231b:	48 98                	cdqe
   14000231d:	8b 44 81 08          	mov    eax,DWORD PTR [rcx+rax*4+0x8]
   140002321:	eb 3f                	jmp    140002362 <in_ch+0x65>
   140002323:	f6 81 10 10 00 00 01 	test   BYTE PTR [rcx+0x1010],0x1
   14000232a:	75 2f                	jne    14000235b <in_ch+0x5e>
   14000232c:	48 8b 09             	mov    rcx,QWORD PTR [rcx]
   14000232f:	f6 83 08 10 00 00 01 	test   BYTE PTR [rbx+0x1008],0x1
   140002336:	74 12                	je     14000234a <in_ch+0x4d>
   140002338:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
   14000233b:	85 c0                	test   eax,eax
   14000233d:	74 15                	je     140002354 <in_ch+0x57>
   14000233f:	48 ff c1             	inc    rcx
   140002342:	48 ff 02             	inc    QWORD PTR [rdx]
   140002345:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   140002348:	eb 1b                	jmp    140002365 <in_ch+0x68>
   14000234a:	e8 79 88 00 00       	call   14000abc8 <getc>
   14000234f:	83 f8 ff             	cmp    eax,0xffffffff
   140002352:	75 0e                	jne    140002362 <in_ch+0x65>
   140002354:	80 8b 10 10 00 00 01 	or     BYTE PTR [rbx+0x1010],0x1
   14000235b:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140002360:	eb 03                	jmp    140002365 <in_ch+0x68>
   140002362:	48 ff 06             	inc    QWORD PTR [rsi]
   140002365:	48 83 c4 28          	add    rsp,0x28
   140002369:	5b                   	pop    rbx
   14000236a:	5e                   	pop    rsi
   14000236b:	c3                   	ret

000000014000236c <back_ch>:
   14000236c:	53                   	push   rbx
   14000236d:	48 83 ec 20          	sub    rsp,0x20
   140002371:	41 83 e1 01          	and    r9d,0x1
   140002375:	4c 89 c3             	mov    rbx,r8
   140002378:	75 05                	jne    14000237f <back_ch+0x13>
   14000237a:	83 f9 ff             	cmp    ecx,0xffffffff
   14000237d:	74 30                	je     1400023af <back_ch+0x43>
   14000237f:	f6 82 08 10 00 00 01 	test   BYTE PTR [rdx+0x1008],0x1
   140002386:	75 0d                	jne    140002395 <back_ch+0x29>
   140002388:	48 8b 12             	mov    rdx,QWORD PTR [rdx]
   14000238b:	e8 b8 88 00 00       	call   14000ac48 <ungetc>
   140002390:	48 ff 0b             	dec    QWORD PTR [rbx]
   140002393:	eb 1a                	jmp    1400023af <back_ch+0x43>
   140002395:	4c 63 82 0c 10 00 00 	movsxd r8,DWORD PTR [rdx+0x100c]
   14000239c:	48 ff 0b             	dec    QWORD PTR [rbx]
   14000239f:	4c 89 c0             	mov    rax,r8
   1400023a2:	42 89 4c 82 08       	mov    DWORD PTR [rdx+r8*4+0x8],ecx
   1400023a7:	ff c0                	inc    eax
   1400023a9:	89 82 0c 10 00 00    	mov    DWORD PTR [rdx+0x100c],eax
   1400023af:	48 83 c4 20          	add    rsp,0x20
   1400023b3:	5b                   	pop    rbx
   1400023b4:	c3                   	ret

00000001400023b5 <__mingw_sformat>:
   1400023b5:	41 57                	push   r15
   1400023b7:	41 56                	push   r14
   1400023b9:	41 55                	push   r13
   1400023bb:	41 54                	push   r12
   1400023bd:	55                   	push   rbp
   1400023be:	57                   	push   rdi
   1400023bf:	56                   	push   rsi
   1400023c0:	53                   	push   rbx
   1400023c1:	48 81 ec 08 01 00 00 	sub    rsp,0x108
   1400023c8:	45 31 db             	xor    r11d,r11d
   1400023cb:	48 89 8c 24 50 01 00 	mov    QWORD PTR [rsp+0x150],rcx
   1400023d2:	00 
   1400023d3:	49 89 d4             	mov    r12,rdx
   1400023d6:	4c 89 84 24 60 01 00 	mov    QWORD PTR [rsp+0x160],r8
   1400023dd:	00 
   1400023de:	4c 89 9c 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],r11
   1400023e5:	00 
   1400023e6:	4c 89 9c 24 d0 00 00 	mov    QWORD PTR [rsp+0xd0],r11
   1400023ed:	00 
   1400023ee:	4c 89 9c 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],r11
   1400023f5:	00 
   1400023f6:	4c 89 9c 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],r11
   1400023fd:	00 
   1400023fe:	4c 89 9c 24 f0 00 00 	mov    QWORD PTR [rsp+0xf0],r11
   140002405:	00 
   140002406:	48 85 c9             	test   rcx,rcx
   140002409:	74 0b                	je     140002416 <__mingw_sformat+0x61>
   14000240b:	48 83 39 00          	cmp    QWORD PTR [rcx],0x0
   14000240f:	74 05                	je     140002416 <__mingw_sformat+0x61>
   140002411:	48 85 d2             	test   rdx,rdx
   140002414:	75 0d                	jne    140002423 <__mingw_sformat+0x6e>
   140002416:	e8 4d 87 00 00       	call   14000ab68 <_errno>
   14000241b:	c7 00 16 00 00 00    	mov    DWORD PTR [rax],0x16
   140002421:	eb 44                	jmp    140002467 <__mingw_sformat+0xb2>
   140002423:	e8 c0 87 00 00       	call   14000abe8 <localeconv>
   140002428:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000242b:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
   140002430:	e8 b3 87 00 00       	call   14000abe8 <localeconv>
   140002435:	48 8b 40 08          	mov    rax,QWORD PTR [rax+0x8]
   140002439:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   14000243e:	48 85 c0             	test   rax,rax
   140002441:	74 2e                	je     140002471 <__mingw_sformat+0xbc>
   140002443:	80 38 00             	cmp    BYTE PTR [rax],0x0
   140002446:	75 29                	jne    140002471 <__mingw_sformat+0xbc>
   140002448:	45 31 c9             	xor    r9d,r9d
   14000244b:	4c 89 4c 24 60       	mov    QWORD PTR [rsp+0x60],r9
   140002450:	eb 1f                	jmp    140002471 <__mingw_sformat+0xbc>
   140002452:	48 8d 94 24 e0 00 00 	lea    rdx,[rsp+0xe0]
   140002459:	00 
   14000245a:	48 8d 8c 24 c8 00 00 	lea    rcx,[rsp+0xc8]
   140002461:	00 
   140002462:	e8 3b fd ff ff       	call   1400021a2 <release_ptrs>
   140002467:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000246c:	e9 aa 23 00 00       	jmp    14000481b <__mingw_sformat+0x2466>
   140002471:	31 d2                	xor    edx,edx
   140002473:	45 31 c0             	xor    r8d,r8d
   140002476:	31 c9                	xor    ecx,ecx
   140002478:	4c 8b b4 24 60 01 00 	mov    r14,QWORD PTR [rsp+0x160]
   14000247f:	00 
   140002480:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   140002487:	00 
   140002488:	89 54 24 40          	mov    DWORD PTR [rsp+0x40],edx
   14000248c:	31 db                	xor    ebx,ebx
   14000248e:	31 f6                	xor    esi,esi
   140002490:	89 54 24 50          	mov    DWORD PTR [rsp+0x50],edx
   140002494:	45 31 ff             	xor    r15d,r15d
   140002497:	48 89 4c 24 38       	mov    QWORD PTR [rsp+0x38],rcx
   14000249c:	4c 89 44 24 30       	mov    QWORD PTR [rsp+0x30],r8
   1400024a1:	4c 89 44 24 28       	mov    QWORD PTR [rsp+0x28],r8
   1400024a6:	48 89 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],rax
   1400024ad:	00 
   1400024ae:	41 80 3c 24 00       	cmp    BYTE PTR [r12],0x0
   1400024b3:	0f 84 b4 22 00 00    	je     14000476d <__mingw_sformat+0x23b8>
   1400024b9:	0f 89 8a 00 00 00    	jns    140002549 <__mingw_sformat+0x194>
   1400024bf:	4c 89 e1             	mov    rcx,r12
   1400024c2:	e8 59 87 00 00       	call   14000ac20 <strlen>
   1400024c7:	4c 8d 84 24 f0 00 00 	lea    r8,[rsp+0xf0]
   1400024ce:	00 
   1400024cf:	4c 89 e1             	mov    rcx,r12
   1400024d2:	48 89 c2             	mov    rdx,rax
   1400024d5:	e8 78 84 00 00       	call   14000a952 <mbrlen>
   1400024da:	85 c0                	test   eax,eax
   1400024dc:	7e 6b                	jle    140002549 <__mingw_sformat+0x194>
   1400024de:	4c 89 64 24 48       	mov    QWORD PTR [rsp+0x48],r12
   1400024e3:	8b 7c 24 48          	mov    edi,DWORD PTR [rsp+0x48]
   1400024e7:	4c 8d a4 24 d0 00 00 	lea    r12,[rsp+0xd0]
   1400024ee:	00 
   1400024ef:	01 c7                	add    edi,eax
   1400024f1:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400024f8:	00 
   1400024f9:	4c 89 e2             	mov    rdx,r12
   1400024fc:	e8 fc fd ff ff       	call   1400022fd <in_ch>
   140002501:	89 c3                	mov    ebx,eax
   140002503:	83 f8 ff             	cmp    eax,0xffffffff
   140002506:	74 0c                	je     140002514 <__mingw_sformat+0x15f>
   140002508:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   14000250d:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   140002510:	39 c3                	cmp    ebx,eax
   140002512:	74 1d                	je     140002531 <__mingw_sformat+0x17c>
   140002514:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   14000251b:	00 
   14000251c:	41 b9 01 00 00 00    	mov    r9d,0x1
   140002522:	4d 89 e0             	mov    r8,r12
   140002525:	89 d9                	mov    ecx,ebx
   140002527:	e8 40 fe ff ff       	call   14000236c <back_ch>
   14000252c:	e9 db 02 00 00       	jmp    14000280c <__mingw_sformat+0x457>
   140002531:	48 ff 44 24 48       	inc    QWORD PTR [rsp+0x48]
   140002536:	3b 7c 24 48          	cmp    edi,DWORD PTR [rsp+0x48]
   14000253a:	75 b5                	jne    1400024f1 <__mingw_sformat+0x13c>
   14000253c:	8b 44 24 50          	mov    eax,DWORD PTR [rsp+0x50]
   140002540:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   140002544:	e9 12 22 00 00       	jmp    14000475b <__mingw_sformat+0x23a6>
   140002549:	41 0f b6 3c 24       	movzx  edi,BYTE PTR [r12]
   14000254e:	49 8d 44 24 01       	lea    rax,[r12+0x1]
   140002553:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140002558:	40 80 ff 25          	cmp    dil,0x25
   14000255c:	0f 84 8b 00 00 00    	je     1400025ed <__mingw_sformat+0x238>
   140002562:	89 f9                	mov    ecx,edi
   140002564:	e8 6f 86 00 00       	call   14000abd8 <isspace>
   140002569:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   14000256d:	85 c0                	test   eax,eax
   14000256f:	0f 85 de 21 00 00    	jne    140004753 <__mingw_sformat+0x239e>
   140002575:	48 8b 94 24 90 00 00 	mov    rdx,QWORD PTR [rsp+0x90]
   14000257c:	00 
   14000257d:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002584:	00 
   140002585:	e8 73 fd ff ff       	call   1400022fd <in_ch>
   14000258a:	89 c3                	mov    ebx,eax
   14000258c:	83 f8 ff             	cmp    eax,0xffffffff
   14000258f:	0f 84 2e 20 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   140002595:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   14000259a:	74 39                	je     1400025d5 <__mingw_sformat+0x220>
   14000259c:	89 c1                	mov    ecx,eax
   14000259e:	e8 35 86 00 00       	call   14000abd8 <isspace>
   1400025a3:	85 c0                	test   eax,eax
   1400025a5:	74 2e                	je     1400025d5 <__mingw_sformat+0x220>
   1400025a7:	48 8d ac 24 d0 00 00 	lea    rbp,[rsp+0xd0]
   1400025ae:	00 
   1400025af:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400025b6:	00 
   1400025b7:	48 89 ea             	mov    rdx,rbp
   1400025ba:	e8 3e fd ff ff       	call   1400022fd <in_ch>
   1400025bf:	89 c3                	mov    ebx,eax
   1400025c1:	83 f8 ff             	cmp    eax,0xffffffff
   1400025c4:	0f 84 f9 1f 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   1400025ca:	89 c1                	mov    ecx,eax
   1400025cc:	e8 07 86 00 00       	call   14000abd8 <isspace>
   1400025d1:	85 c0                	test   eax,eax
   1400025d3:	75 da                	jne    1400025af <__mingw_sformat+0x1fa>
   1400025d5:	39 df                	cmp    edi,ebx
   1400025d7:	0f 84 7e 21 00 00    	je     14000475b <__mingw_sformat+0x23a6>
   1400025dd:	4c 8b 84 24 90 00 00 	mov    r8,QWORD PTR [rsp+0x90]
   1400025e4:	00 
   1400025e5:	45 31 c9             	xor    r9d,r9d
   1400025e8:	e9 b4 21 00 00       	jmp    1400047a1 <__mingw_sformat+0x23ec>
   1400025ed:	41 0f b6 4c 24 01    	movzx  ecx,BYTE PTR [r12+0x1]
   1400025f3:	e8 d8 85 00 00       	call   14000abd0 <isdigit>
   1400025f8:	85 c0                	test   eax,eax
   1400025fa:	74 33                	je     14000262f <__mingw_sformat+0x27a>
   1400025fc:	41 0f b6 44 24 01    	movzx  eax,BYTE PTR [r12+0x1]
   140002602:	49 8d 7c 24 02       	lea    rdi,[r12+0x2]
   140002607:	83 e8 30             	sub    eax,0x30
   14000260a:	0f b6 0f             	movzx  ecx,BYTE PTR [rdi]
   14000260d:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   140002611:	e8 ba 85 00 00       	call   14000abd0 <isdigit>
   140002616:	85 c0                	test   eax,eax
   140002618:	0f b6 07             	movzx  eax,BYTE PTR [rdi]
   14000261b:	74 0e                	je     14000262b <__mingw_sformat+0x276>
   14000261d:	6b 54 24 20 0a       	imul   edx,DWORD PTR [rsp+0x20],0xa
   140002622:	48 ff c7             	inc    rdi
   140002625:	8d 44 02 d0          	lea    eax,[rdx+rax*1-0x30]
   140002629:	eb df                	jmp    14000260a <__mingw_sformat+0x255>
   14000262b:	3c 24                	cmp    al,0x24
   14000262d:	74 0a                	je     140002639 <__mingw_sformat+0x284>
   14000262f:	45 31 d2             	xor    r10d,r10d
   140002632:	44 89 54 24 20       	mov    DWORD PTR [rsp+0x20],r10d
   140002637:	eb 09                	jmp    140002642 <__mingw_sformat+0x28d>
   140002639:	48 8d 47 01          	lea    rax,[rdi+0x1]
   14000263d:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140002642:	48 8b 6c 24 48       	mov    rbp,QWORD PTR [rsp+0x48]
   140002647:	45 31 ed             	xor    r13d,r13d
   14000264a:	8a 45 00             	mov    al,BYTE PTR [rbp+0x0]
   14000264d:	3c 2a                	cmp    al,0x2a
   14000264f:	75 06                	jne    140002657 <__mingw_sformat+0x2a2>
   140002651:	41 80 cd 80          	or     r13b,0x80
   140002655:	eb 44                	jmp    14000269b <__mingw_sformat+0x2e6>
   140002657:	3c 27                	cmp    al,0x27
   140002659:	75 11                	jne    14000266c <__mingw_sformat+0x2b7>
   14000265b:	48 83 7c 24 60 00    	cmp    QWORD PTR [rsp+0x60],0x0
   140002661:	74 38                	je     14000269b <__mingw_sformat+0x2e6>
   140002663:	41 81 cd 00 01 00 00 	or     r13d,0x100
   14000266a:	eb 2f                	jmp    14000269b <__mingw_sformat+0x2e6>
   14000266c:	3c 49                	cmp    al,0x49
   14000266e:	75 30                	jne    1400026a0 <__mingw_sformat+0x2eb>
   140002670:	8a 45 01             	mov    al,BYTE PTR [rbp+0x1]
   140002673:	3c 36                	cmp    al,0x36
   140002675:	75 0c                	jne    140002683 <__mingw_sformat+0x2ce>
   140002677:	80 7d 02 34          	cmp    BYTE PTR [rbp+0x2],0x34
   14000267b:	75 1a                	jne    140002697 <__mingw_sformat+0x2e2>
   14000267d:	41 83 cd 0c          	or     r13d,0xc
   140002681:	eb 0e                	jmp    140002691 <__mingw_sformat+0x2dc>
   140002683:	3c 33                	cmp    al,0x33
   140002685:	75 10                	jne    140002697 <__mingw_sformat+0x2e2>
   140002687:	80 7d 02 32          	cmp    BYTE PTR [rbp+0x2],0x32
   14000268b:	75 0a                	jne    140002697 <__mingw_sformat+0x2e2>
   14000268d:	41 83 cd 04          	or     r13d,0x4
   140002691:	48 83 c5 02          	add    rbp,0x2
   140002695:	eb 04                	jmp    14000269b <__mingw_sformat+0x2e6>
   140002697:	41 83 cd 0c          	or     r13d,0xc
   14000269b:	48 ff c5             	inc    rbp
   14000269e:	eb aa                	jmp    14000264a <__mingw_sformat+0x295>
   1400026a0:	31 ff                	xor    edi,edi
   1400026a2:	0f b6 4d 00          	movzx  ecx,BYTE PTR [rbp+0x0]
   1400026a6:	e8 25 85 00 00       	call   14000abd0 <isdigit>
   1400026ab:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   1400026af:	0f b6 45 00          	movzx  eax,BYTE PTR [rbp+0x0]
   1400026b3:	83 7c 24 44 00       	cmp    DWORD PTR [rsp+0x44],0x0
   1400026b8:	74 0c                	je     1400026c6 <__mingw_sformat+0x311>
   1400026ba:	6b ff 0a             	imul   edi,edi,0xa
   1400026bd:	48 ff c5             	inc    rbp
   1400026c0:	8d 7c 07 d0          	lea    edi,[rdi+rax*1-0x30]
   1400026c4:	eb dc                	jmp    1400026a2 <__mingw_sformat+0x2ed>
   1400026c6:	85 ff                	test   edi,edi
   1400026c8:	ba ff ff ff ff       	mov    edx,0xffffffff
   1400026cd:	0f 44 fa             	cmove  edi,edx
   1400026d0:	3c 7a                	cmp    al,0x7a
   1400026d2:	0f 8f b0 00 00 00    	jg     140002788 <__mingw_sformat+0x3d3>
   1400026d8:	3c 67                	cmp    al,0x67
   1400026da:	7f 15                	jg     1400026f1 <__mingw_sformat+0x33c>
   1400026dc:	3c 4c                	cmp    al,0x4c
   1400026de:	74 59                	je     140002739 <__mingw_sformat+0x384>
   1400026e0:	3c 61                	cmp    al,0x61
   1400026e2:	74 5e                	je     140002742 <__mingw_sformat+0x38d>
   1400026e4:	84 c0                	test   al,al
   1400026e6:	0f 84 c4 20 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   1400026ec:	e9 97 00 00 00       	jmp    140002788 <__mingw_sformat+0x3d3>
   1400026f1:	83 e8 68             	sub    eax,0x68
   1400026f4:	3c 12                	cmp    al,0x12
   1400026f6:	0f 87 8c 00 00 00    	ja     140002788 <__mingw_sformat+0x3d3>
   1400026fc:	48 8d 15 61 9c 00 00 	lea    rdx,[rip+0x9c61]        # 14000c364 <.rdata+0x14>
   140002703:	0f b6 c0             	movzx  eax,al
   140002706:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   14000270a:	48 01 d0             	add    rax,rdx
   14000270d:	ff e0                	jmp    rax
   14000270f:	80 7d 01 68          	cmp    BYTE PTR [rbp+0x1],0x68
   140002713:	74 09                	je     14000271e <__mingw_sformat+0x369>
   140002715:	48 ff c5             	inc    rbp
   140002718:	41 83 cd 02          	or     r13d,0x2
   14000271c:	eb 6a                	jmp    140002788 <__mingw_sformat+0x3d3>
   14000271e:	41 83 cd 01          	or     r13d,0x1
   140002722:	eb 51                	jmp    140002775 <__mingw_sformat+0x3c0>
   140002724:	80 7d 01 6c          	cmp    BYTE PTR [rbp+0x1],0x6c
   140002728:	74 09                	je     140002733 <__mingw_sformat+0x37e>
   14000272a:	48 ff c5             	inc    rbp
   14000272d:	41 83 cd 04          	or     r13d,0x4
   140002731:	eb 55                	jmp    140002788 <__mingw_sformat+0x3d3>
   140002733:	41 83 cd 0c          	or     r13d,0xc
   140002737:	eb 3c                	jmp    140002775 <__mingw_sformat+0x3c0>
   140002739:	48 ff c5             	inc    rbp
   14000273c:	41 83 cd 0c          	or     r13d,0xc
   140002740:	eb 46                	jmp    140002788 <__mingw_sformat+0x3d3>
   140002742:	8a 45 01             	mov    al,BYTE PTR [rbp+0x1]
   140002745:	89 c2                	mov    edx,eax
   140002747:	83 e2 f7             	and    edx,0xfffffff7
   14000274a:	80 fa 53             	cmp    dl,0x53
   14000274d:	74 04                	je     140002753 <__mingw_sformat+0x39e>
   14000274f:	3c 73                	cmp    al,0x73
   140002751:	75 35                	jne    140002788 <__mingw_sformat+0x3d3>
   140002753:	48 ff c5             	inc    rbp
   140002756:	41 81 cd 00 02 00 00 	or     r13d,0x200
   14000275d:	eb 29                	jmp    140002788 <__mingw_sformat+0x3d3>
   14000275f:	80 7d 01 6c          	cmp    BYTE PTR [rbp+0x1],0x6c
   140002763:	74 09                	je     14000276e <__mingw_sformat+0x3b9>
   140002765:	41 81 cd 00 04 00 00 	or     r13d,0x400
   14000276c:	eb 17                	jmp    140002785 <__mingw_sformat+0x3d0>
   14000276e:	41 81 cd 04 04 00 00 	or     r13d,0x404
   140002775:	48 83 c5 02          	add    rbp,0x2
   140002779:	eb 0d                	jmp    140002788 <__mingw_sformat+0x3d3>
   14000277b:	41 83 cd 0c          	or     r13d,0xc
   14000277f:	eb 04                	jmp    140002785 <__mingw_sformat+0x3d0>
   140002781:	41 83 cd 08          	or     r13d,0x8
   140002785:	48 ff c5             	inc    rbp
   140002788:	44 8a 65 00          	mov    r12b,BYTE PTR [rbp+0x0]
   14000278c:	45 84 e4             	test   r12b,r12b
   14000278f:	0f 84 1b 20 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140002795:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   14000279a:	75 1d                	jne    1400027b9 <__mingw_sformat+0x404>
   14000279c:	41 8d 44 24 bd       	lea    eax,[r12-0x43]
   1400027a1:	3c 2b                	cmp    al,0x2b
   1400027a3:	77 14                	ja     1400027b9 <__mingw_sformat+0x404>
   1400027a5:	48 ba fe ff ff fe fe 	movabs rdx,0xfffff7fefefffffe
   1400027ac:	f7 ff ff 
   1400027af:	48 0f a3 c2          	bt     rdx,rax
   1400027b3:	0f 83 94 00 00 00    	jae    14000284d <__mingw_sformat+0x498>
   1400027b9:	e8 aa 83 00 00       	call   14000ab68 <_errno>
   1400027be:	8b 00                	mov    eax,DWORD PTR [rax]
   1400027c0:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   1400027c4:	e8 9f 83 00 00       	call   14000ab68 <_errno>
   1400027c9:	45 31 c9             	xor    r9d,r9d
   1400027cc:	44 89 08             	mov    DWORD PTR [rax],r9d
   1400027cf:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   1400027d6:	00 
   1400027d7:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   1400027dc:	ff c3                	inc    ebx
   1400027de:	75 11                	jne    1400027f1 <__mingw_sformat+0x43c>
   1400027e0:	e8 83 83 00 00       	call   14000ab68 <_errno>
   1400027e5:	83 38 04             	cmp    DWORD PTR [rax],0x4
   1400027e8:	74 22                	je     14000280c <__mingw_sformat+0x457>
   1400027ea:	bb ff ff ff ff       	mov    ebx,0xffffffff
   1400027ef:	eb 2c                	jmp    14000281d <__mingw_sformat+0x468>
   1400027f1:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   1400027f6:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400027fd:	00 
   1400027fe:	e8 fa fa ff ff       	call   1400022fd <in_ch>
   140002803:	89 c3                	mov    ebx,eax
   140002805:	83 f8 ff             	cmp    eax,0xffffffff
   140002808:	75 13                	jne    14000281d <__mingw_sformat+0x468>
   14000280a:	eb d4                	jmp    1400027e0 <__mingw_sformat+0x42b>
   14000280c:	45 85 ff             	test   r15d,r15d
   14000280f:	b8 ff ff ff ff       	mov    eax,0xffffffff
   140002814:	44 0f 44 f8          	cmove  r15d,eax
   140002818:	e9 93 1f 00 00       	jmp    1400047b0 <__mingw_sformat+0x23fb>
   14000281d:	89 d9                	mov    ecx,ebx
   14000281f:	e8 b4 83 00 00       	call   14000abd8 <isspace>
   140002824:	85 c0                	test   eax,eax
   140002826:	75 b4                	jne    1400027dc <__mingw_sformat+0x427>
   140002828:	e8 3b 83 00 00       	call   14000ab68 <_errno>
   14000282d:	8b 4c 24 48          	mov    ecx,DWORD PTR [rsp+0x48]
   140002831:	45 31 c9             	xor    r9d,r9d
   140002834:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   14000283b:	00 
   14000283c:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   140002843:	00 
   140002844:	89 08                	mov    DWORD PTR [rax],ecx
   140002846:	89 d9                	mov    ecx,ebx
   140002848:	e8 1f fb ff ff       	call   14000236c <back_ch>
   14000284d:	48 8d 45 01          	lea    rax,[rbp+0x1]
   140002851:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140002856:	41 80 fc 63          	cmp    r12b,0x63
   14000285a:	74 08                	je     140002864 <__mingw_sformat+0x4af>
   14000285c:	41 80 fc 73          	cmp    r12b,0x73
   140002860:	74 14                	je     140002876 <__mingw_sformat+0x4c1>
   140002862:	eb 24                	jmp    140002888 <__mingw_sformat+0x4d3>
   140002864:	41 f7 c5 04 00 00 00 	test   r13d,0x4
   14000286b:	0f 85 9f 03 00 00    	jne    140002c10 <__mingw_sformat+0x85b>
   140002871:	e9 bb 01 00 00       	jmp    140002a31 <__mingw_sformat+0x67c>
   140002876:	41 f7 c5 04 00 00 00 	test   r13d,0x4
   14000287d:	0f 85 0a 08 00 00    	jne    14000308d <__mingw_sformat+0xcd8>
   140002883:	e9 fb 05 00 00       	jmp    140002e83 <__mingw_sformat+0xace>
   140002888:	41 80 fc 67          	cmp    r12b,0x67
   14000288c:	7f 59                	jg     1400028e7 <__mingw_sformat+0x532>
   14000288e:	41 80 fc 52          	cmp    r12b,0x52
   140002892:	7f 21                	jg     1400028b5 <__mingw_sformat+0x500>
   140002894:	41 80 fc 43          	cmp    r12b,0x43
   140002898:	0f 84 72 03 00 00    	je     140002c10 <__mingw_sformat+0x85b>
   14000289e:	7f 35                	jg     1400028d5 <__mingw_sformat+0x520>
   1400028a0:	41 80 fc 25          	cmp    r12b,0x25
   1400028a4:	74 75                	je     14000291b <__mingw_sformat+0x566>
   1400028a6:	41 80 fc 41          	cmp    r12b,0x41
   1400028aa:	0f 85 00 1f 00 00    	jne    1400047b0 <__mingw_sformat+0x23fb>
   1400028b0:	e9 6a 0f 00 00       	jmp    14000381f <__mingw_sformat+0x146a>
   1400028b5:	41 8d 44 24 ad       	lea    eax,[r12-0x53]
   1400028ba:	3c 14                	cmp    al,0x14
   1400028bc:	0f 87 ee 1e 00 00    	ja     1400047b0 <__mingw_sformat+0x23fb>
   1400028c2:	48 8d 15 e7 9a 00 00 	lea    rdx,[rip+0x9ae7]        # 14000c3b0 <.rdata+0x60>
   1400028c9:	0f b6 c0             	movzx  eax,al
   1400028cc:	48 63 04 82          	movsxd rax,DWORD PTR [rdx+rax*4]
   1400028d0:	48 01 d0             	add    rax,rdx
   1400028d3:	ff e0                	jmp    rax
   1400028d5:	41 8d 44 24 bb       	lea    eax,[r12-0x45]
   1400028da:	3c 02                	cmp    al,0x2
   1400028dc:	0f 87 ce 1e 00 00    	ja     1400047b0 <__mingw_sformat+0x23fb>
   1400028e2:	e9 38 0f 00 00       	jmp    14000381f <__mingw_sformat+0x146a>
   1400028e7:	41 8d 4c 24 97       	lea    ecx,[r12-0x69]
   1400028ec:	80 f9 0f             	cmp    cl,0xf
   1400028ef:	0f 87 bb 1e 00 00    	ja     1400047b0 <__mingw_sformat+0x23fb>
   1400028f5:	b8 01 00 00 00       	mov    eax,0x1
   1400028fa:	48 d3 e0             	shl    rax,cl
   1400028fd:	a9 c1 90 00 00       	test   eax,0x90c1
   140002902:	0f 85 d2 09 00 00    	jne    1400032da <__mingw_sformat+0xf25>
   140002908:	80 f9 0a             	cmp    cl,0xa
   14000290b:	0f 84 72 05 00 00    	je     140002e83 <__mingw_sformat+0xace>
   140002911:	80 f9 05             	cmp    cl,0x5
   140002914:	74 39                	je     14000294f <__mingw_sformat+0x59a>
   140002916:	e9 95 1e 00 00       	jmp    1400047b0 <__mingw_sformat+0x23fb>
   14000291b:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002922:	00 
   140002923:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   14000292a:	00 
   14000292b:	e8 cd f9 ff ff       	call   1400022fd <in_ch>
   140002930:	89 c3                	mov    ebx,eax
   140002932:	83 f8 ff             	cmp    eax,0xffffffff
   140002935:	0f 84 88 1c 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   14000293b:	83 f8 25             	cmp    eax,0x25
   14000293e:	0f 84 17 1e 00 00    	je     14000475b <__mingw_sformat+0x23a6>
   140002944:	41 b9 01 00 00 00    	mov    r9d,0x1
   14000294a:	e9 4a 1e 00 00       	jmp    140004799 <__mingw_sformat+0x23e4>
   14000294f:	41 f6 c5 80          	test   r13b,0x80
   140002953:	0f 85 02 1e 00 00    	jne    14000475b <__mingw_sformat+0x23a6>
   140002959:	44 89 e8             	mov    eax,r13d
   14000295c:	4c 8b 8c 24 d0 00 00 	mov    r9,QWORD PTR [rsp+0xd0]
   140002963:	00 
   140002964:	83 e0 08             	and    eax,0x8
   140002967:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   14000296b:	74 26                	je     140002993 <__mingw_sformat+0x5de>
   14000296d:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002972:	74 13                	je     140002987 <__mingw_sformat+0x5d2>
   140002974:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002978:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   14000297f:	00 
   140002980:	e8 58 f9 ff ff       	call   1400022dd <get_va_nth>
   140002985:	eb 07                	jmp    14000298e <__mingw_sformat+0x5d9>
   140002987:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14000298a:	49 83 c6 08          	add    r14,0x8
   14000298e:	4c 89 08             	mov    QWORD PTR [rax],r9
   140002991:	eb 68                	jmp    1400029fb <__mingw_sformat+0x646>
   140002993:	41 f7 c5 04 00 00 00 	test   r13d,0x4
   14000299a:	75 6c                	jne    140002a08 <__mingw_sformat+0x653>
   14000299c:	41 f7 c5 02 00 00 00 	test   r13d,0x2
   1400029a3:	74 27                	je     1400029cc <__mingw_sformat+0x617>
   1400029a5:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   1400029aa:	74 13                	je     1400029bf <__mingw_sformat+0x60a>
   1400029ac:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   1400029b0:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400029b7:	00 
   1400029b8:	e8 20 f9 ff ff       	call   1400022dd <get_va_nth>
   1400029bd:	eb 07                	jmp    1400029c6 <__mingw_sformat+0x611>
   1400029bf:	49 8b 06             	mov    rax,QWORD PTR [r14]
   1400029c2:	49 83 c6 08          	add    r14,0x8
   1400029c6:	66 44 89 08          	mov    WORD PTR [rax],r9w
   1400029ca:	eb 2f                	jmp    1400029fb <__mingw_sformat+0x646>
   1400029cc:	41 83 e5 01          	and    r13d,0x1
   1400029d0:	44 89 6c 24 44       	mov    DWORD PTR [rsp+0x44],r13d
   1400029d5:	74 31                	je     140002a08 <__mingw_sformat+0x653>
   1400029d7:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   1400029dc:	74 13                	je     1400029f1 <__mingw_sformat+0x63c>
   1400029de:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   1400029e2:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400029e9:	00 
   1400029ea:	e8 ee f8 ff ff       	call   1400022dd <get_va_nth>
   1400029ef:	eb 07                	jmp    1400029f8 <__mingw_sformat+0x643>
   1400029f1:	49 8b 06             	mov    rax,QWORD PTR [r14]
   1400029f4:	49 83 c6 08          	add    r14,0x8
   1400029f8:	44 88 08             	mov    BYTE PTR [rax],r9b
   1400029fb:	45 31 c0             	xor    r8d,r8d
   1400029fe:	44 89 44 24 44       	mov    DWORD PTR [rsp+0x44],r8d
   140002a03:	e9 53 1d 00 00       	jmp    14000475b <__mingw_sformat+0x23a6>
   140002a08:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002a0d:	74 13                	je     140002a22 <__mingw_sformat+0x66d>
   140002a0f:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002a13:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002a1a:	00 
   140002a1b:	e8 bd f8 ff ff       	call   1400022dd <get_va_nth>
   140002a20:	eb 07                	jmp    140002a29 <__mingw_sformat+0x674>
   140002a22:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140002a25:	49 83 c6 08          	add    r14,0x8
   140002a29:	44 89 08             	mov    DWORD PTR [rax],r9d
   140002a2c:	e9 2a 1d 00 00       	jmp    14000475b <__mingw_sformat+0x23a6>
   140002a31:	83 ff ff             	cmp    edi,0xffffffff
   140002a34:	b8 01 00 00 00       	mov    eax,0x1
   140002a39:	44 89 ed             	mov    ebp,r13d
   140002a3c:	0f 44 f8             	cmove  edi,eax
   140002a3f:	81 e5 80 00 00 00    	and    ebp,0x80
   140002a45:	0f 85 be 00 00 00    	jne    140002b09 <__mingw_sformat+0x754>
   140002a4b:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   140002a52:	74 7e                	je     140002ad2 <__mingw_sformat+0x71d>
   140002a54:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002a59:	74 16                	je     140002a71 <__mingw_sformat+0x6bc>
   140002a5b:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002a5f:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002a66:	00 
   140002a67:	e8 71 f8 ff ff       	call   1400022dd <get_va_nth>
   140002a6c:	48 89 c6             	mov    rsi,rax
   140002a6f:	eb 07                	jmp    140002a78 <__mingw_sformat+0x6c3>
   140002a71:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   140002a74:	49 83 c6 08          	add    r14,0x8
   140002a78:	48 85 f6             	test   rsi,rsi
   140002a7b:	0f 84 36 17 00 00    	je     1400041b7 <__mingw_sformat+0x1e02>
   140002a81:	bb 00 04 00 00       	mov    ebx,0x400
   140002a86:	39 df                	cmp    edi,ebx
   140002a88:	0f 4e df             	cmovle ebx,edi
   140002a8b:	48 63 db             	movsxd rbx,ebx
   140002a8e:	48 89 d9             	mov    rcx,rbx
   140002a91:	e8 5a 81 00 00       	call   14000abf0 <malloc>
   140002a96:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140002a9b:	48 89 06             	mov    QWORD PTR [rsi],rax
   140002a9e:	48 85 c0             	test   rax,rax
   140002aa1:	0f 84 3f 17 00 00    	je     1400041e6 <__mingw_sformat+0x1e31>
   140002aa7:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140002aae:	00 
   140002aaf:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
   140002ab4:	e8 87 f6 ff ff       	call   140002140 <resize_gcollect>
   140002ab9:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140002abc:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140002ac3:	00 
   140002ac4:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
   140002ac8:	48 89 08             	mov    QWORD PTR [rax],rcx
   140002acb:	48 89 74 d0 10       	mov    QWORD PTR [rax+rdx*8+0x10],rsi
   140002ad0:	eb 37                	jmp    140002b09 <__mingw_sformat+0x754>
   140002ad2:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002ad7:	74 18                	je     140002af1 <__mingw_sformat+0x73c>
   140002ad9:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002add:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002ae4:	00 
   140002ae5:	e8 f3 f7 ff ff       	call   1400022dd <get_va_nth>
   140002aea:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140002aef:	eb 0c                	jmp    140002afd <__mingw_sformat+0x748>
   140002af1:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140002af4:	49 83 c6 08          	add    r14,0x8
   140002af8:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140002afd:	48 83 7c 24 30 00    	cmp    QWORD PTR [rsp+0x30],0x0
   140002b03:	0f 84 a7 1c 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140002b09:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002b10:	00 
   140002b11:	4c 8d a4 24 d0 00 00 	lea    r12,[rsp+0xd0]
   140002b18:	00 
   140002b19:	4c 89 e2             	mov    rdx,r12
   140002b1c:	e8 dc f7 ff ff       	call   1400022fd <in_ch>
   140002b21:	89 c3                	mov    ebx,eax
   140002b23:	83 f8 ff             	cmp    eax,0xffffffff
   140002b26:	0f 84 97 1a 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   140002b2c:	85 ed                	test   ebp,ebp
   140002b2e:	0f 85 d1 00 00 00    	jne    140002c05 <__mingw_sformat+0x850>
   140002b34:	48 63 ff             	movsxd rdi,edi
   140002b37:	41 81 e5 00 06 00 00 	and    r13d,0x600
   140002b3e:	45 85 ed             	test   r13d,r13d
   140002b41:	74 69                	je     140002bac <__mingw_sformat+0x7f7>
   140002b43:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002b48:	48 03 06             	add    rax,QWORD PTR [rsi]
   140002b4b:	48 39 44 24 30       	cmp    QWORD PTR [rsp+0x30],rax
   140002b50:	75 5a                	jne    140002bac <__mingw_sformat+0x7f7>
   140002b52:	8d 6f ff             	lea    ebp,[rdi-0x1]
   140002b55:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002b5a:	48 39 7c 24 28       	cmp    QWORD PTR [rsp+0x28],rdi
   140002b5f:	48 63 ed             	movsxd rbp,ebp
   140002b62:	48 0f 4c 6c 24 28    	cmovl  rbp,QWORD PTR [rsp+0x28]
   140002b68:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140002b6c:	48 01 c5             	add    rbp,rax
   140002b6f:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140002b72:	48 89 ea             	mov    rdx,rbp
   140002b75:	4c 89 44 24 20       	mov    QWORD PTR [rsp+0x20],r8
   140002b7a:	e8 89 80 00 00       	call   14000ac08 <realloc>
   140002b7f:	48 85 c0             	test   rax,rax
   140002b82:	75 13                	jne    140002b97 <__mingw_sformat+0x7e2>
   140002b84:	4c 8b 44 24 20       	mov    r8,QWORD PTR [rsp+0x20]
   140002b89:	49 39 e8             	cmp    r8,rbp
   140002b8c:	0f 83 c0 f8 ff ff    	jae    140002452 <__mingw_sformat+0x9d>
   140002b92:	4c 89 c5             	mov    rbp,r8
   140002b95:	eb d8                	jmp    140002b6f <__mingw_sformat+0x7ba>
   140002b97:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140002b9c:	48 89 06             	mov    QWORD PTR [rsi],rax
   140002b9f:	48 89 6c 24 28       	mov    QWORD PTR [rsp+0x28],rbp
   140002ba4:	48 01 c1             	add    rcx,rax
   140002ba7:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140002bac:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140002bb1:	88 18                	mov    BYTE PTR [rax],bl
   140002bb3:	48 8d 68 01          	lea    rbp,[rax+0x1]
   140002bb7:	8d 47 ff             	lea    eax,[rdi-0x1]
   140002bba:	85 c0                	test   eax,eax
   140002bbc:	0f 8e 34 1c 00 00    	jle    1400047f6 <__mingw_sformat+0x2441>
   140002bc2:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002bc9:	00 
   140002bca:	4c 89 e2             	mov    rdx,r12
   140002bcd:	48 ff cf             	dec    rdi
   140002bd0:	e8 28 f7 ff ff       	call   1400022fd <in_ch>
   140002bd5:	89 c3                	mov    ebx,eax
   140002bd7:	83 f8 ff             	cmp    eax,0xffffffff
   140002bda:	0f 84 16 1c 00 00    	je     1400047f6 <__mingw_sformat+0x2441>
   140002be0:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
   140002be5:	e9 54 ff ff ff       	jmp    140002b3e <__mingw_sformat+0x789>
   140002bea:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002bf1:	00 
   140002bf2:	4c 89 e2             	mov    rdx,r12
   140002bf5:	e8 03 f7 ff ff       	call   1400022fd <in_ch>
   140002bfa:	89 c3                	mov    ebx,eax
   140002bfc:	83 f8 ff             	cmp    eax,0xffffffff
   140002bff:	0f 84 56 1b 00 00    	je     14000475b <__mingw_sformat+0x23a6>
   140002c05:	ff cf                	dec    edi
   140002c07:	85 ff                	test   edi,edi
   140002c09:	7f df                	jg     140002bea <__mingw_sformat+0x835>
   140002c0b:	e9 4b 1b 00 00       	jmp    14000475b <__mingw_sformat+0x23a6>
   140002c10:	83 ff ff             	cmp    edi,0xffffffff
   140002c13:	b8 01 00 00 00       	mov    eax,0x1
   140002c18:	0f 44 f8             	cmove  edi,eax
   140002c1b:	44 89 e8             	mov    eax,r13d
   140002c1e:	25 80 00 00 00       	and    eax,0x80
   140002c23:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   140002c27:	0f 85 bf 00 00 00    	jne    140002cec <__mingw_sformat+0x937>
   140002c2d:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   140002c34:	74 7f                	je     140002cb5 <__mingw_sformat+0x900>
   140002c36:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002c3b:	74 16                	je     140002c53 <__mingw_sformat+0x89e>
   140002c3d:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002c41:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002c48:	00 
   140002c49:	e8 8f f6 ff ff       	call   1400022dd <get_va_nth>
   140002c4e:	48 89 c6             	mov    rsi,rax
   140002c51:	eb 07                	jmp    140002c5a <__mingw_sformat+0x8a5>
   140002c53:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   140002c56:	49 83 c6 08          	add    r14,0x8
   140002c5a:	48 85 f6             	test   rsi,rsi
   140002c5d:	0f 84 54 15 00 00    	je     1400041b7 <__mingw_sformat+0x1e02>
   140002c63:	bb 00 04 00 00       	mov    ebx,0x400
   140002c68:	39 df                	cmp    edi,ebx
   140002c6a:	0f 4e df             	cmovle ebx,edi
   140002c6d:	48 63 db             	movsxd rbx,ebx
   140002c70:	48 8d 0c 1b          	lea    rcx,[rbx+rbx*1]
   140002c74:	e8 77 7f 00 00       	call   14000abf0 <malloc>
   140002c79:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140002c7e:	48 89 06             	mov    QWORD PTR [rsi],rax
   140002c81:	48 85 c0             	test   rax,rax
   140002c84:	0f 84 5c 15 00 00    	je     1400041e6 <__mingw_sformat+0x1e31>
   140002c8a:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140002c91:	00 
   140002c92:	48 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],rbx
   140002c97:	e8 a4 f4 ff ff       	call   140002140 <resize_gcollect>
   140002c9c:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140002c9f:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140002ca6:	00 
   140002ca7:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
   140002cab:	48 89 08             	mov    QWORD PTR [rax],rcx
   140002cae:	48 89 74 d0 10       	mov    QWORD PTR [rax+rdx*8+0x10],rsi
   140002cb3:	eb 37                	jmp    140002cec <__mingw_sformat+0x937>
   140002cb5:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002cba:	74 18                	je     140002cd4 <__mingw_sformat+0x91f>
   140002cbc:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002cc0:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002cc7:	00 
   140002cc8:	e8 10 f6 ff ff       	call   1400022dd <get_va_nth>
   140002ccd:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140002cd2:	eb 0c                	jmp    140002ce0 <__mingw_sformat+0x92b>
   140002cd4:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140002cd7:	49 83 c6 08          	add    r14,0x8
   140002cdb:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140002ce0:	48 83 7c 24 38 00    	cmp    QWORD PTR [rsp+0x38],0x0
   140002ce6:	0f 84 c4 1a 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140002cec:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   140002cf3:	00 
   140002cf4:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002cfb:	00 
   140002cfc:	48 89 c2             	mov    rdx,rax
   140002cff:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140002d04:	e8 f4 f5 ff ff       	call   1400022fd <in_ch>
   140002d09:	89 c3                	mov    ebx,eax
   140002d0b:	83 f8 ff             	cmp    eax,0xffffffff
   140002d0e:	0f 84 af 18 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   140002d14:	8b 44 24 50          	mov    eax,DWORD PTR [rsp+0x50]
   140002d18:	31 c9                	xor    ecx,ecx
   140002d1a:	48 63 ff             	movsxd rdi,edi
   140002d1d:	48 89 8c 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],rcx
   140002d24:	00 
   140002d25:	c1 e8 07             	shr    eax,0x7
   140002d28:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140002d2c:	88 9c 24 c3 00 00 00 	mov    BYTE PTR [rsp+0xc3],bl
   140002d33:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140002d38:	75 76                	jne    140002db0 <__mingw_sformat+0x9fb>
   140002d3a:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   140002d41:	74 6d                	je     140002db0 <__mingw_sformat+0x9fb>
   140002d43:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002d48:	4c 8d 24 00          	lea    r12,[rax+rax*1]
   140002d4c:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140002d4f:	4c 01 e0             	add    rax,r12
   140002d52:	48 39 44 24 38       	cmp    QWORD PTR [rsp+0x38],rax
   140002d57:	75 57                	jne    140002db0 <__mingw_sformat+0x9fb>
   140002d59:	8d 6f ff             	lea    ebp,[rdi-0x1]
   140002d5c:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002d61:	48 39 7c 24 28       	cmp    QWORD PTR [rsp+0x28],rdi
   140002d66:	48 63 ed             	movsxd rbp,ebp
   140002d69:	48 0f 4e 6c 24 28    	cmovle rbp,QWORD PTR [rsp+0x28]
   140002d6f:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140002d73:	48 01 c5             	add    rbp,rax
   140002d76:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140002d79:	48 8d 54 2d 00       	lea    rdx,[rbp+rbp*1+0x0]
   140002d7e:	4c 89 44 24 28       	mov    QWORD PTR [rsp+0x28],r8
   140002d83:	e8 80 7e 00 00       	call   14000ac08 <realloc>
   140002d88:	48 85 c0             	test   rax,rax
   140002d8b:	75 13                	jne    140002da0 <__mingw_sformat+0x9eb>
   140002d8d:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   140002d92:	49 39 e8             	cmp    r8,rbp
   140002d95:	0f 83 b7 f6 ff ff    	jae    140002452 <__mingw_sformat+0x9d>
   140002d9b:	4c 89 c5             	mov    rbp,r8
   140002d9e:	eb d6                	jmp    140002d76 <__mingw_sformat+0x9c1>
   140002da0:	48 89 06             	mov    QWORD PTR [rsi],rax
   140002da3:	4c 01 e0             	add    rax,r12
   140002da6:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140002dab:	48 89 6c 24 28       	mov    QWORD PTR [rsp+0x28],rbp
   140002db0:	8a 44 24 78          	mov    al,BYTE PTR [rsp+0x78]
   140002db4:	bd 00 00 00 00       	mov    ebp,0x0
   140002db9:	34 01                	xor    al,0x1
   140002dbb:	48 8d 84 24 c3 00 00 	lea    rax,[rsp+0xc3]
   140002dc2:	00 
   140002dc3:	48 0f 45 6c 24 38    	cmovne rbp,QWORD PTR [rsp+0x38]
   140002dc9:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   140002dd0:	00 
   140002dd1:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   140002dd8:	00 
   140002dd9:	4c 8d 8c 24 f8 00 00 	lea    r9,[rsp+0xf8]
   140002de0:	00 
   140002de1:	41 b8 01 00 00 00    	mov    r8d,0x1
   140002de7:	48 89 e9             	mov    rcx,rbp
   140002dea:	e8 2f 7a 00 00       	call   14000a81e <mbrtowc>
   140002def:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
   140002df3:	75 26                	jne    140002e1b <__mingw_sformat+0xa66>
   140002df5:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
   140002dfa:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002e01:	00 
   140002e02:	e8 f6 f4 ff ff       	call   1400022fd <in_ch>
   140002e07:	89 c3                	mov    ebx,eax
   140002e09:	83 f8 ff             	cmp    eax,0xffffffff
   140002e0c:	0f 84 27 17 00 00    	je     140004539 <__mingw_sformat+0x2184>
   140002e12:	88 84 24 c3 00 00 00 	mov    BYTE PTR [rsp+0xc3],al
   140002e19:	eb b6                	jmp    140002dd1 <__mingw_sformat+0xa1c>
   140002e1b:	48 ff c8             	dec    rax
   140002e1e:	0f 85 15 17 00 00    	jne    140004539 <__mingw_sformat+0x2184>
   140002e24:	8d 47 ff             	lea    eax,[rdi-0x1]
   140002e27:	48 83 44 24 38 02    	add    QWORD PTR [rsp+0x38],0x2
   140002e2d:	85 c0                	test   eax,eax
   140002e2f:	7e 23                	jle    140002e54 <__mingw_sformat+0xa9f>
   140002e31:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002e38:	00 
   140002e39:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140002e40:	00 
   140002e41:	48 ff cf             	dec    rdi
   140002e44:	e8 b4 f4 ff ff       	call   1400022fd <in_ch>
   140002e49:	89 c3                	mov    ebx,eax
   140002e4b:	83 f8 ff             	cmp    eax,0xffffffff
   140002e4e:	0f 85 d8 fe ff ff    	jne    140002d2c <__mingw_sformat+0x977>
   140002e54:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140002e59:	0f 85 fc 18 00 00    	jne    14000475b <__mingw_sformat+0x23a6>
   140002e5f:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002e64:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140002e69:	48 89 f1             	mov    rcx,rsi
   140002e6c:	41 ff c7             	inc    r15d
   140002e6f:	4c 8d 04 00          	lea    r8,[rax+rax*1]
   140002e73:	e8 fa f2 ff ff       	call   140002172 <optimize_alloc>
   140002e78:	31 d2                	xor    edx,edx
   140002e7a:	89 54 24 44          	mov    DWORD PTR [rsp+0x44],edx
   140002e7e:	e9 91 19 00 00       	jmp    140004814 <__mingw_sformat+0x245f>
   140002e83:	45 89 ec             	mov    r12d,r13d
   140002e86:	41 81 e4 80 00 00 00 	and    r12d,0x80
   140002e8d:	0f 85 b7 00 00 00    	jne    140002f4a <__mingw_sformat+0xb95>
   140002e93:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   140002e9a:	74 77                	je     140002f13 <__mingw_sformat+0xb5e>
   140002e9c:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002ea1:	74 16                	je     140002eb9 <__mingw_sformat+0xb04>
   140002ea3:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002ea7:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002eae:	00 
   140002eaf:	e8 29 f4 ff ff       	call   1400022dd <get_va_nth>
   140002eb4:	48 89 c6             	mov    rsi,rax
   140002eb7:	eb 07                	jmp    140002ec0 <__mingw_sformat+0xb0b>
   140002eb9:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   140002ebc:	49 83 c6 08          	add    r14,0x8
   140002ec0:	48 85 f6             	test   rsi,rsi
   140002ec3:	0f 84 ee 12 00 00    	je     1400041b7 <__mingw_sformat+0x1e02>
   140002ec9:	b9 64 00 00 00       	mov    ecx,0x64
   140002ece:	e8 1d 7d 00 00       	call   14000abf0 <malloc>
   140002ed3:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140002ed8:	48 89 06             	mov    QWORD PTR [rsi],rax
   140002edb:	48 85 c0             	test   rax,rax
   140002ede:	0f 84 02 13 00 00    	je     1400041e6 <__mingw_sformat+0x1e31>
   140002ee4:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140002eeb:	00 
   140002eec:	e8 4f f2 ff ff       	call   140002140 <resize_gcollect>
   140002ef1:	48 c7 44 24 28 64 00 	mov    QWORD PTR [rsp+0x28],0x64
   140002ef8:	00 00 
   140002efa:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140002efd:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140002f04:	00 
   140002f05:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
   140002f09:	48 89 08             	mov    QWORD PTR [rax],rcx
   140002f0c:	48 89 74 d0 10       	mov    QWORD PTR [rax+rdx*8+0x10],rsi
   140002f11:	eb 37                	jmp    140002f4a <__mingw_sformat+0xb95>
   140002f13:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002f18:	74 18                	je     140002f32 <__mingw_sformat+0xb7d>
   140002f1a:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140002f1e:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140002f25:	00 
   140002f26:	e8 b2 f3 ff ff       	call   1400022dd <get_va_nth>
   140002f2b:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140002f30:	eb 0c                	jmp    140002f3e <__mingw_sformat+0xb89>
   140002f32:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140002f35:	49 83 c6 08          	add    r14,0x8
   140002f39:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140002f3e:	48 83 7c 24 30 00    	cmp    QWORD PTR [rsp+0x30],0x0
   140002f44:	0f 84 66 18 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140002f4a:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140002f51:	00 
   140002f52:	48 8d ac 24 d0 00 00 	lea    rbp,[rsp+0xd0]
   140002f59:	00 
   140002f5a:	48 89 ea             	mov    rdx,rbp
   140002f5d:	e8 9b f3 ff ff       	call   1400022fd <in_ch>
   140002f62:	89 c3                	mov    ebx,eax
   140002f64:	83 f8 ff             	cmp    eax,0xffffffff
   140002f67:	0f 84 56 16 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   140002f6d:	44 89 e8             	mov    eax,r13d
   140002f70:	25 00 06 00 00       	and    eax,0x600
   140002f75:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   140002f79:	89 d9                	mov    ecx,ebx
   140002f7b:	e8 58 7c 00 00       	call   14000abd8 <isspace>
   140002f80:	85 c0                	test   eax,eax
   140002f82:	74 22                	je     140002fa6 <__mingw_sformat+0xbf1>
   140002f84:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140002f8b:	00 
   140002f8c:	41 b9 01 00 00 00    	mov    r9d,0x1
   140002f92:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   140002f99:	00 
   140002f9a:	89 d9                	mov    ecx,ebx
   140002f9c:	e8 cb f3 ff ff       	call   14000236c <back_ch>
   140002fa1:	e9 b4 00 00 00       	jmp    14000305a <__mingw_sformat+0xca5>
   140002fa6:	45 85 e4             	test   r12d,r12d
   140002fa9:	0f 85 88 00 00 00    	jne    140003037 <__mingw_sformat+0xc82>
   140002faf:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140002fb4:	88 18                	mov    BYTE PTR [rax],bl
   140002fb6:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140002fbb:	74 6d                	je     14000302a <__mingw_sformat+0xc75>
   140002fbd:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140002fc2:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002fc7:	48 03 06             	add    rax,QWORD PTR [rsi]
   140002fca:	48 ff c1             	inc    rcx
   140002fcd:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140002fd2:	48 39 c1             	cmp    rcx,rax
   140002fd5:	75 60                	jne    140003037 <__mingw_sformat+0xc82>
   140002fd7:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140002fdc:	48 8d 14 00          	lea    rdx,[rax+rax*1]
   140002fe0:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140002fe4:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140002fe7:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
   140002fec:	4c 89 44 24 50       	mov    QWORD PTR [rsp+0x50],r8
   140002ff1:	e8 12 7c 00 00       	call   14000ac08 <realloc>
   140002ff6:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   140002ffb:	48 85 c0             	test   rax,rax
   140002ffe:	75 13                	jne    140003013 <__mingw_sformat+0xc5e>
   140003000:	4c 8b 44 24 50       	mov    r8,QWORD PTR [rsp+0x50]
   140003005:	49 39 d0             	cmp    r8,rdx
   140003008:	0f 83 b3 16 00 00    	jae    1400046c1 <__mingw_sformat+0x230c>
   14000300e:	4c 89 c2             	mov    rdx,r8
   140003011:	eb d1                	jmp    140002fe4 <__mingw_sformat+0xc2f>
   140003013:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   140003018:	48 89 06             	mov    QWORD PTR [rsi],rax
   14000301b:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   140003020:	48 01 c1             	add    rcx,rax
   140003023:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140003028:	eb 0d                	jmp    140003037 <__mingw_sformat+0xc82>
   14000302a:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   14000302f:	48 ff c0             	inc    rax
   140003032:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140003037:	85 ff                	test   edi,edi
   140003039:	7e 04                	jle    14000303f <__mingw_sformat+0xc8a>
   14000303b:	ff cf                	dec    edi
   14000303d:	74 1b                	je     14000305a <__mingw_sformat+0xca5>
   14000303f:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003046:	00 
   140003047:	48 89 ea             	mov    rdx,rbp
   14000304a:	e8 ae f2 ff ff       	call   1400022fd <in_ch>
   14000304f:	89 c3                	mov    ebx,eax
   140003051:	83 f8 ff             	cmp    eax,0xffffffff
   140003054:	0f 85 1f ff ff ff    	jne    140002f79 <__mingw_sformat+0xbc4>
   14000305a:	45 85 e4             	test   r12d,r12d
   14000305d:	0f 85 f8 16 00 00    	jne    14000475b <__mingw_sformat+0x23a6>
   140003063:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140003068:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   14000306d:	48 89 f1             	mov    rcx,rsi
   140003070:	41 ff c7             	inc    r15d
   140003073:	c6 00 00             	mov    BYTE PTR [rax],0x0
   140003076:	48 8d 78 01          	lea    rdi,[rax+0x1]
   14000307a:	48 89 fa             	mov    rdx,rdi
   14000307d:	e8 f0 f0 ff ff       	call   140002172 <optimize_alloc>
   140003082:	31 c0                	xor    eax,eax
   140003084:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   140003088:	e9 bc 16 00 00       	jmp    140004749 <__mingw_sformat+0x2394>
   14000308d:	44 89 e8             	mov    eax,r13d
   140003090:	25 80 00 00 00       	and    eax,0x80
   140003095:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   140003099:	0f 85 b7 00 00 00    	jne    140003156 <__mingw_sformat+0xda1>
   14000309f:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   1400030a6:	74 77                	je     14000311f <__mingw_sformat+0xd6a>
   1400030a8:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   1400030ad:	74 16                	je     1400030c5 <__mingw_sformat+0xd10>
   1400030af:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   1400030b3:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400030ba:	00 
   1400030bb:	e8 1d f2 ff ff       	call   1400022dd <get_va_nth>
   1400030c0:	48 89 c6             	mov    rsi,rax
   1400030c3:	eb 07                	jmp    1400030cc <__mingw_sformat+0xd17>
   1400030c5:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   1400030c8:	49 83 c6 08          	add    r14,0x8
   1400030cc:	48 85 f6             	test   rsi,rsi
   1400030cf:	0f 84 e2 10 00 00    	je     1400041b7 <__mingw_sformat+0x1e02>
   1400030d5:	b9 c8 00 00 00       	mov    ecx,0xc8
   1400030da:	e8 11 7b 00 00       	call   14000abf0 <malloc>
   1400030df:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1400030e4:	48 89 06             	mov    QWORD PTR [rsi],rax
   1400030e7:	48 85 c0             	test   rax,rax
   1400030ea:	0f 84 f6 10 00 00    	je     1400041e6 <__mingw_sformat+0x1e31>
   1400030f0:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   1400030f7:	00 
   1400030f8:	e8 43 f0 ff ff       	call   140002140 <resize_gcollect>
   1400030fd:	48 c7 44 24 28 64 00 	mov    QWORD PTR [rsp+0x28],0x64
   140003104:	00 00 
   140003106:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140003109:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140003110:	00 
   140003111:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
   140003115:	48 89 08             	mov    QWORD PTR [rax],rcx
   140003118:	48 89 74 d0 10       	mov    QWORD PTR [rax+rdx*8+0x10],rsi
   14000311d:	eb 37                	jmp    140003156 <__mingw_sformat+0xda1>
   14000311f:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140003124:	74 18                	je     14000313e <__mingw_sformat+0xd89>
   140003126:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   14000312a:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140003131:	00 
   140003132:	e8 a6 f1 ff ff       	call   1400022dd <get_va_nth>
   140003137:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   14000313c:	eb 0c                	jmp    14000314a <__mingw_sformat+0xd95>
   14000313e:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140003141:	49 83 c6 08          	add    r14,0x8
   140003145:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   14000314a:	48 83 7c 24 38 00    	cmp    QWORD PTR [rsp+0x38],0x0
   140003150:	0f 84 5a 16 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003156:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   14000315d:	00 
   14000315e:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003165:	00 
   140003166:	48 89 c2             	mov    rdx,rax
   140003169:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000316e:	e8 8a f1 ff ff       	call   1400022fd <in_ch>
   140003173:	89 c3                	mov    ebx,eax
   140003175:	83 f8 ff             	cmp    eax,0xffffffff
   140003178:	0f 84 45 14 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   14000317e:	31 c0                	xor    eax,eax
   140003180:	48 89 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],rax
   140003187:	00 
   140003188:	8b 44 24 50          	mov    eax,DWORD PTR [rsp+0x50]
   14000318c:	c1 e8 07             	shr    eax,0x7
   14000318f:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140003193:	89 d9                	mov    ecx,ebx
   140003195:	e8 3e 7a 00 00       	call   14000abd8 <isspace>
   14000319a:	85 c0                	test   eax,eax
   14000319c:	74 22                	je     1400031c0 <__mingw_sformat+0xe0b>
   14000319e:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400031a5:	00 
   1400031a6:	41 b9 01 00 00 00    	mov    r9d,0x1
   1400031ac:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   1400031b3:	00 
   1400031b4:	89 d9                	mov    ecx,ebx
   1400031b6:	e8 b1 f1 ff ff       	call   14000236c <back_ch>
   1400031bb:	e9 10 01 00 00       	jmp    1400032d0 <__mingw_sformat+0xf1b>
   1400031c0:	8a 4c 24 78          	mov    cl,BYTE PTR [rsp+0x78]
   1400031c4:	bd 00 00 00 00       	mov    ebp,0x0
   1400031c9:	89 d8                	mov    eax,ebx
   1400031cb:	80 f1 01             	xor    cl,0x1
   1400031ce:	48 8d 8c 24 c3 00 00 	lea    rcx,[rsp+0xc3]
   1400031d5:	00 
   1400031d6:	48 0f 45 6c 24 38    	cmovne rbp,QWORD PTR [rsp+0x38]
   1400031dc:	48 89 8c 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rcx
   1400031e3:	00 
   1400031e4:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400031ea:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   1400031f1:	00 
   1400031f2:	48 89 e9             	mov    rcx,rbp
   1400031f5:	4c 8d 8c 24 f8 00 00 	lea    r9,[rsp+0xf8]
   1400031fc:	00 
   1400031fd:	88 84 24 c3 00 00 00 	mov    BYTE PTR [rsp+0xc3],al
   140003204:	e8 15 76 00 00       	call   14000a81e <mbrtowc>
   140003209:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
   14000320d:	75 1e                	jne    14000322d <__mingw_sformat+0xe78>
   14000320f:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
   140003214:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   14000321b:	00 
   14000321c:	e8 dc f0 ff ff       	call   1400022fd <in_ch>
   140003221:	89 c3                	mov    ebx,eax
   140003223:	83 f8 ff             	cmp    eax,0xffffffff
   140003226:	75 bc                	jne    1400031e4 <__mingw_sformat+0xe2f>
   140003228:	e9 0c 13 00 00       	jmp    140004539 <__mingw_sformat+0x2184>
   14000322d:	48 ff c8             	dec    rax
   140003230:	0f 85 03 13 00 00    	jne    140004539 <__mingw_sformat+0x2184>
   140003236:	48 83 44 24 38 02    	add    QWORD PTR [rsp+0x38],0x2
   14000323c:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140003241:	75 65                	jne    1400032a8 <__mingw_sformat+0xef3>
   140003243:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   14000324a:	74 5c                	je     1400032a8 <__mingw_sformat+0xef3>
   14000324c:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140003251:	4c 8d 24 00          	lea    r12,[rax+rax*1]
   140003255:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140003258:	4c 01 e0             	add    rax,r12
   14000325b:	48 39 44 24 38       	cmp    QWORD PTR [rsp+0x38],rax
   140003260:	75 46                	jne    1400032a8 <__mingw_sformat+0xef3>
   140003262:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140003267:	4c 89 e5             	mov    rbp,r12
   14000326a:	4c 8d 40 01          	lea    r8,[rax+0x1]
   14000326e:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140003271:	48 8d 54 2d 00       	lea    rdx,[rbp+rbp*1+0x0]
   140003276:	4c 89 44 24 38       	mov    QWORD PTR [rsp+0x38],r8
   14000327b:	e8 88 79 00 00       	call   14000ac08 <realloc>
   140003280:	48 85 c0             	test   rax,rax
   140003283:	75 13                	jne    140003298 <__mingw_sformat+0xee3>
   140003285:	4c 8b 44 24 38       	mov    r8,QWORD PTR [rsp+0x38]
   14000328a:	49 39 e8             	cmp    r8,rbp
   14000328d:	0f 83 44 12 00 00    	jae    1400044d7 <__mingw_sformat+0x2122>
   140003293:	4c 89 c5             	mov    rbp,r8
   140003296:	eb d6                	jmp    14000326e <__mingw_sformat+0xeb9>
   140003298:	48 89 06             	mov    QWORD PTR [rsi],rax
   14000329b:	4c 01 e0             	add    rax,r12
   14000329e:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1400032a3:	48 89 6c 24 28       	mov    QWORD PTR [rsp+0x28],rbp
   1400032a8:	85 ff                	test   edi,edi
   1400032aa:	7e 04                	jle    1400032b0 <__mingw_sformat+0xefb>
   1400032ac:	ff cf                	dec    edi
   1400032ae:	74 20                	je     1400032d0 <__mingw_sformat+0xf1b>
   1400032b0:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400032b7:	00 
   1400032b8:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   1400032bf:	00 
   1400032c0:	e8 38 f0 ff ff       	call   1400022fd <in_ch>
   1400032c5:	89 c3                	mov    ebx,eax
   1400032c7:	83 f8 ff             	cmp    eax,0xffffffff
   1400032ca:	0f 85 c3 fe ff ff    	jne    140003193 <__mingw_sformat+0xdde>
   1400032d0:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   1400032d5:	e9 85 12 00 00       	jmp    14000455f <__mingw_sformat+0x21aa>
   1400032da:	41 80 fc 6f          	cmp    r12b,0x6f
   1400032de:	75 2a                	jne    14000330a <__mingw_sformat+0xf55>
   1400032e0:	c7 44 24 40 08 00 00 	mov    DWORD PTR [rsp+0x40],0x8
   1400032e7:	00 
   1400032e8:	eb 46                	jmp    140003330 <__mingw_sformat+0xf7b>
   1400032ea:	41 80 fc 64          	cmp    r12b,0x64
   1400032ee:	74 14                	je     140003304 <__mingw_sformat+0xf4f>
   1400032f0:	41 80 fc 58          	cmp    r12b,0x58
   1400032f4:	b8 10 00 00 00       	mov    eax,0x10
   1400032f9:	0f 45 44 24 40       	cmovne eax,DWORD PTR [rsp+0x40]
   1400032fe:	89 44 24 40          	mov    DWORD PTR [rsp+0x40],eax
   140003302:	eb 2c                	jmp    140003330 <__mingw_sformat+0xf7b>
   140003304:	41 83 cd 10          	or     r13d,0x10
   140003308:	eb 0c                	jmp    140003316 <__mingw_sformat+0xf61>
   14000330a:	7e 14                	jle    140003320 <__mingw_sformat+0xf6b>
   14000330c:	41 80 fc 75          	cmp    r12b,0x75
   140003310:	0f 85 b7 14 00 00    	jne    1400047cd <__mingw_sformat+0x2418>
   140003316:	c7 44 24 40 0a 00 00 	mov    DWORD PTR [rsp+0x40],0xa
   14000331d:	00 
   14000331e:	eb 10                	jmp    140003330 <__mingw_sformat+0xf7b>
   140003320:	41 80 fc 69          	cmp    r12b,0x69
   140003324:	75 ca                	jne    1400032f0 <__mingw_sformat+0xf3b>
   140003326:	31 c0                	xor    eax,eax
   140003328:	41 83 cd 10          	or     r13d,0x10
   14000332c:	89 44 24 40          	mov    DWORD PTR [rsp+0x40],eax
   140003330:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003337:	00 
   140003338:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   14000333f:	00 
   140003340:	e8 b8 ef ff ff       	call   1400022fd <in_ch>
   140003345:	89 c3                	mov    ebx,eax
   140003347:	83 f8 ff             	cmp    eax,0xffffffff
   14000334a:	0f 84 73 12 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   140003350:	8d 40 d5             	lea    eax,[rax-0x2b]
   140003353:	45 31 e4             	xor    r12d,r12d
   140003356:	83 e0 fd             	and    eax,0xfffffffd
   140003359:	75 44                	jne    14000339f <__mingw_sformat+0xfea>
   14000335b:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003362:	00 
   140003363:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   14000336a:	00 
   14000336b:	31 c9                	xor    ecx,ecx
   14000336d:	e8 98 ee ff ff       	call   14000220a <resize_wbuf>
   140003372:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003379:	00 
   14000337a:	88 18                	mov    BYTE PTR [rax],bl
   14000337c:	85 ff                	test   edi,edi
   14000337e:	7e 02                	jle    140003382 <__mingw_sformat+0xfcd>
   140003380:	ff cf                	dec    edi
   140003382:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003389:	00 
   14000338a:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003391:	00 
   140003392:	41 bc 01 00 00 00    	mov    r12d,0x1
   140003398:	e8 60 ef ff ff       	call   1400022fd <in_ch>
   14000339d:	89 c3                	mov    ebx,eax
   14000339f:	85 ff                	test   edi,edi
   1400033a1:	0f 84 a6 00 00 00    	je     14000344d <__mingw_sformat+0x1098>
   1400033a7:	83 fb 30             	cmp    ebx,0x30
   1400033aa:	0f 85 9d 00 00 00    	jne    14000344d <__mingw_sformat+0x1098>
   1400033b0:	85 ff                	test   edi,edi
   1400033b2:	7e 02                	jle    1400033b6 <__mingw_sformat+0x1001>
   1400033b4:	ff cf                	dec    edi
   1400033b6:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   1400033bd:	00 
   1400033be:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   1400033c5:	00 
   1400033c6:	4c 89 e1             	mov    rcx,r12
   1400033c9:	49 8d 6c 24 01       	lea    rbp,[r12+0x1]
   1400033ce:	e8 37 ee ff ff       	call   14000220a <resize_wbuf>
   1400033d3:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400033da:	00 
   1400033db:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   1400033e2:	00 
   1400033e3:	42 c6 04 20 30       	mov    BYTE PTR [rax+r12*1],0x30
   1400033e8:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   1400033ef:	00 
   1400033f0:	e8 08 ef ff ff       	call   1400022fd <in_ch>
   1400033f5:	89 c3                	mov    ebx,eax
   1400033f7:	85 ff                	test   edi,edi
   1400033f9:	74 3d                	je     140003438 <__mingw_sformat+0x1083>
   1400033fb:	89 c1                	mov    ecx,eax
   1400033fd:	e8 3e 78 00 00       	call   14000ac40 <tolower>
   140003402:	83 f8 78             	cmp    eax,0x78
   140003405:	75 31                	jne    140003438 <__mingw_sformat+0x1083>
   140003407:	f7 44 24 40 ef ff ff 	test   DWORD PTR [rsp+0x40],0xffffffef
   14000340e:	ff 
   14000340f:	75 4e                	jne    14000345f <__mingw_sformat+0x10aa>
   140003411:	85 ff                	test   edi,edi
   140003413:	7e 02                	jle    140003417 <__mingw_sformat+0x1062>
   140003415:	ff cf                	dec    edi
   140003417:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   14000341e:	00 
   14000341f:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003426:	00 
   140003427:	e8 d1 ee ff ff       	call   1400022fd <in_ch>
   14000342c:	c7 44 24 40 10 00 00 	mov    DWORD PTR [rsp+0x40],0x10
   140003433:	00 
   140003434:	89 c3                	mov    ebx,eax
   140003436:	eb 27                	jmp    14000345f <__mingw_sformat+0x10aa>
   140003438:	83 7c 24 40 00       	cmp    DWORD PTR [rsp+0x40],0x0
   14000343d:	b8 08 00 00 00       	mov    eax,0x8
   140003442:	0f 45 44 24 40       	cmovne eax,DWORD PTR [rsp+0x40]
   140003447:	89 44 24 40          	mov    DWORD PTR [rsp+0x40],eax
   14000344b:	eb 12                	jmp    14000345f <__mingw_sformat+0x10aa>
   14000344d:	4c 89 e5             	mov    rbp,r12
   140003450:	83 7c 24 40 00       	cmp    DWORD PTR [rsp+0x40],0x0
   140003455:	75 08                	jne    14000345f <__mingw_sformat+0x10aa>
   140003457:	c7 44 24 40 0a 00 00 	mov    DWORD PTR [rsp+0x40],0xa
   14000345e:	00 
   14000345f:	44 89 e8             	mov    eax,r13d
   140003462:	25 00 01 00 00       	and    eax,0x100
   140003467:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   14000346b:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   140003472:	00 
   140003473:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   140003478:	83 fb ff             	cmp    ebx,0xffffffff
   14000347b:	0f 84 5e 01 00 00    	je     1400035df <__mingw_sformat+0x122a>
   140003481:	85 ff                	test   edi,edi
   140003483:	0f 84 56 01 00 00    	je     1400035df <__mingw_sformat+0x122a>
   140003489:	89 d9                	mov    ecx,ebx
   14000348b:	83 7c 24 40 10       	cmp    DWORD PTR [rsp+0x40],0x10
   140003490:	75 12                	jne    1400034a4 <__mingw_sformat+0x10ef>
   140003492:	e8 49 77 00 00       	call   14000abe0 <isxdigit>
   140003497:	85 c0                	test   eax,eax
   140003499:	0f 85 f7 00 00 00    	jne    140003596 <__mingw_sformat+0x11e1>
   14000349f:	e9 3b 01 00 00       	jmp    1400035df <__mingw_sformat+0x122a>
   1400034a4:	e8 27 77 00 00       	call   14000abd0 <isdigit>
   1400034a9:	85 c0                	test   eax,eax
   1400034ab:	74 0d                	je     1400034ba <__mingw_sformat+0x1105>
   1400034ad:	8d 43 d1             	lea    eax,[rbx-0x2f]
   1400034b0:	3b 44 24 40          	cmp    eax,DWORD PTR [rsp+0x40]
   1400034b4:	0f 8e dc 00 00 00    	jle    140003596 <__mingw_sformat+0x11e1>
   1400034ba:	83 7c 24 40 0a       	cmp    DWORD PTR [rsp+0x40],0xa
   1400034bf:	0f 85 1a 01 00 00    	jne    1400035df <__mingw_sformat+0x122a>
   1400034c5:	83 7c 24 78 00       	cmp    DWORD PTR [rsp+0x78],0x0
   1400034ca:	0f 84 0f 01 00 00    	je     1400035df <__mingw_sformat+0x122a>
   1400034d0:	85 ff                	test   edi,edi
   1400034d2:	41 bc ff ff ff 7f    	mov    r12d,0x7fffffff
   1400034d8:	4c 8b 54 24 60       	mov    r10,QWORD PTR [rsp+0x60]
   1400034dd:	44 0f 4f e7          	cmovg  r12d,edi
   1400034e1:	41 0f b6 02          	movzx  eax,BYTE PTR [r10]
   1400034e5:	39 d8                	cmp    eax,ebx
   1400034e7:	75 3c                	jne    140003525 <__mingw_sformat+0x1170>
   1400034e9:	49 ff c2             	inc    r10
   1400034ec:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
   1400034f0:	74 33                	je     140003525 <__mingw_sformat+0x1170>
   1400034f2:	45 85 e4             	test   r12d,r12d
   1400034f5:	74 2e                	je     140003525 <__mingw_sformat+0x1170>
   1400034f7:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   1400034fc:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003503:	00 
   140003504:	4c 89 94 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r10
   14000350b:	00 
   14000350c:	e8 ec ed ff ff       	call   1400022fd <in_ch>
   140003511:	4c 8b 94 24 80 00 00 	mov    r10,QWORD PTR [rsp+0x80]
   140003518:	00 
   140003519:	83 f8 ff             	cmp    eax,0xffffffff
   14000351c:	89 c3                	mov    ebx,eax
   14000351e:	74 05                	je     140003525 <__mingw_sformat+0x1170>
   140003520:	41 ff cc             	dec    r12d
   140003523:	eb bc                	jmp    1400034e1 <__mingw_sformat+0x112c>
   140003525:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
   140003529:	74 62                	je     14000358d <__mingw_sformat+0x11d8>
   14000352b:	4c 39 54 24 60       	cmp    QWORD PTR [rsp+0x60],r10
   140003530:	0f 83 a9 00 00 00    	jae    1400035df <__mingw_sformat+0x122a>
   140003536:	4c 89 54 24 50       	mov    QWORD PTR [rsp+0x50],r10
   14000353b:	45 31 c9             	xor    r9d,r9d
   14000353e:	89 d9                	mov    ecx,ebx
   140003540:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140003547:	00 
   140003548:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   14000354f:	00 
   140003550:	e8 17 ee ff ff       	call   14000236c <back_ch>
   140003555:	4c 8b 54 24 50       	mov    r10,QWORD PTR [rsp+0x50]
   14000355a:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
   14000355f:	49 ff ca             	dec    r10
   140003562:	49 39 c2             	cmp    r10,rax
   140003565:	74 21                	je     140003588 <__mingw_sformat+0x11d3>
   140003567:	4c 89 54 24 50       	mov    QWORD PTR [rsp+0x50],r10
   14000356c:	41 0f b6 0a          	movzx  ecx,BYTE PTR [r10]
   140003570:	41 b9 01 00 00 00    	mov    r9d,0x1
   140003576:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   14000357d:	00 
   14000357e:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140003585:	00 
   140003586:	eb c8                	jmp    140003550 <__mingw_sformat+0x119b>
   140003588:	0f b6 18             	movzx  ebx,BYTE PTR [rax]
   14000358b:	eb 52                	jmp    1400035df <__mingw_sformat+0x122a>
   14000358d:	85 ff                	test   edi,edi
   14000358f:	41 0f 4f fc          	cmovg  edi,r12d
   140003593:	48 ff cd             	dec    rbp
   140003596:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   14000359d:	00 
   14000359e:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   1400035a5:	00 
   1400035a6:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   1400035aa:	48 89 e9             	mov    rcx,rbp
   1400035ad:	e8 58 ec ff ff       	call   14000220a <resize_wbuf>
   1400035b2:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   1400035b9:	00 
   1400035ba:	88 1c 28             	mov    BYTE PTR [rax+rbp*1],bl
   1400035bd:	85 ff                	test   edi,edi
   1400035bf:	7e 02                	jle    1400035c3 <__mingw_sformat+0x120e>
   1400035c1:	ff cf                	dec    edi
   1400035c3:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   1400035c8:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400035cf:	00 
   1400035d0:	4c 89 e5             	mov    rbp,r12
   1400035d3:	e8 25 ed ff ff       	call   1400022fd <in_ch>
   1400035d8:	89 c3                	mov    ebx,eax
   1400035da:	e9 99 fe ff ff       	jmp    140003478 <__mingw_sformat+0x10c3>
   1400035df:	48 85 ed             	test   rbp,rbp
   1400035e2:	74 24                	je     140003608 <__mingw_sformat+0x1253>
   1400035e4:	48 83 fd 01          	cmp    rbp,0x1
   1400035e8:	0f 85 ae 00 00 00    	jne    14000369c <__mingw_sformat+0x12e7>
   1400035ee:	48 8b 84 24 e0 00 00 	mov    rax,QWORD PTR [rsp+0xe0]
   1400035f5:	00 
   1400035f6:	8a 00                	mov    al,BYTE PTR [rax]
   1400035f8:	83 e8 2b             	sub    eax,0x2b
   1400035fb:	a8 fd                	test   al,0xfd
   1400035fd:	0f 85 99 00 00 00    	jne    14000369c <__mingw_sformat+0x12e7>
   140003603:	e9 8e 11 00 00       	jmp    140004796 <__mingw_sformat+0x23e1>
   140003608:	41 f7 c5 20 00 00 00 	test   r13d,0x20
   14000360f:	0f 84 81 11 00 00    	je     140004796 <__mingw_sformat+0x23e1>
   140003615:	89 d9                	mov    ecx,ebx
   140003617:	e8 24 76 00 00       	call   14000ac40 <tolower>
   14000361c:	3c 28                	cmp    al,0x28
   14000361e:	0f 85 72 11 00 00    	jne    140004796 <__mingw_sformat+0x23e1>
   140003624:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   14000362b:	00 
   14000362c:	4c 8d 25 1e 8d 00 00 	lea    r12,[rip+0x8d1e]        # 14000c351 <.rdata+0x1>
   140003633:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   140003638:	48 8b 54 24 50       	mov    rdx,QWORD PTR [rsp+0x50]
   14000363d:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003644:	00 
   140003645:	e8 b3 ec ff ff       	call   1400022fd <in_ch>
   14000364a:	89 c3                	mov    ebx,eax
   14000364c:	83 f8 ff             	cmp    eax,0xffffffff
   14000364f:	0f 84 41 11 00 00    	je     140004796 <__mingw_sformat+0x23e1>
   140003655:	42 8a 7c 25 00       	mov    dil,BYTE PTR [rbp+r12*1+0x0]
   14000365a:	89 c1                	mov    ecx,eax
   14000365c:	e8 df 75 00 00       	call   14000ac40 <tolower>
   140003661:	40 38 c7             	cmp    dil,al
   140003664:	0f 85 2c 11 00 00    	jne    140004796 <__mingw_sformat+0x23e1>
   14000366a:	48 ff c5             	inc    rbp
   14000366d:	48 83 fd 04          	cmp    rbp,0x4
   140003671:	75 c5                	jne    140003638 <__mingw_sformat+0x1283>
   140003673:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   14000367a:	00 
   14000367b:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   140003682:	00 
   140003683:	31 c9                	xor    ecx,ecx
   140003685:	bd 01 00 00 00       	mov    ebp,0x1
   14000368a:	e8 7b eb ff ff       	call   14000220a <resize_wbuf>
   14000368f:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003696:	00 
   140003697:	c6 00 30             	mov    BYTE PTR [rax],0x30
   14000369a:	eb 1a                	jmp    1400036b6 <__mingw_sformat+0x1301>
   14000369c:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400036a3:	00 
   1400036a4:	45 31 c9             	xor    r9d,r9d
   1400036a7:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   1400036ae:	00 
   1400036af:	89 d9                	mov    ecx,ebx
   1400036b1:	e8 b6 ec ff ff       	call   14000236c <back_ch>
   1400036b6:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   1400036bd:	00 
   1400036be:	48 89 e9             	mov    rcx,rbp
   1400036c1:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   1400036c8:	00 
   1400036c9:	45 89 ec             	mov    r12d,r13d
   1400036cc:	e8 39 eb ff ff       	call   14000220a <resize_wbuf>
   1400036d1:	44 8b 44 24 40       	mov    r8d,DWORD PTR [rsp+0x40]
   1400036d6:	48 8d 94 24 e8 00 00 	lea    rdx,[rsp+0xe8]
   1400036dd:	00 
   1400036de:	c6 04 28 00          	mov    BYTE PTR [rax+rbp*1],0x0
   1400036e2:	44 89 ed             	mov    ebp,r13d
   1400036e5:	48 89 c7             	mov    rdi,rax
   1400036e8:	48 89 c1             	mov    rcx,rax
   1400036eb:	83 e5 10             	and    ebp,0x10
   1400036ee:	41 83 e4 08          	and    r12d,0x8
   1400036f2:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   1400036f9:	00 
   1400036fa:	74 17                	je     140003713 <__mingw_sformat+0x135e>
   1400036fc:	85 ed                	test   ebp,ebp
   1400036fe:	74 07                	je     140003707 <__mingw_sformat+0x1352>
   140003700:	e8 63 75 00 00       	call   14000ac68 <strtoll>
   140003705:	eb 05                	jmp    14000370c <__mingw_sformat+0x1357>
   140003707:	e8 54 75 00 00       	call   14000ac60 <strtoull>
   14000370c:	48 89 44 24 68       	mov    QWORD PTR [rsp+0x68],rax
   140003711:	eb 28                	jmp    14000373b <__mingw_sformat+0x1386>
   140003713:	85 ed                	test   ebp,ebp
   140003715:	74 07                	je     14000371e <__mingw_sformat+0x1369>
   140003717:	e8 14 75 00 00       	call   14000ac30 <strtol>
   14000371c:	eb 05                	jmp    140003723 <__mingw_sformat+0x136e>
   14000371e:	e8 15 75 00 00       	call   14000ac38 <strtoul>
   140003723:	ba ff ff ff ff       	mov    edx,0xffffffff
   140003728:	89 c0                	mov    eax,eax
   14000372a:	48 c1 e2 20          	shl    rdx,0x20
   14000372e:	48 23 54 24 68       	and    rdx,QWORD PTR [rsp+0x68]
   140003733:	48 09 c2             	or     rdx,rax
   140003736:	48 89 54 24 68       	mov    QWORD PTR [rsp+0x68],rdx
   14000373b:	48 3b bc 24 e8 00 00 	cmp    rdi,QWORD PTR [rsp+0xe8]
   140003742:	00 
   140003743:	0f 84 67 10 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003749:	41 f6 c5 80          	test   r13b,0x80
   14000374d:	0f 85 08 10 00 00    	jne    14000475b <__mingw_sformat+0x23a6>
   140003753:	45 85 e4             	test   r12d,r12d
   140003756:	74 2e                	je     140003786 <__mingw_sformat+0x13d1>
   140003758:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   14000375d:	74 13                	je     140003772 <__mingw_sformat+0x13bd>
   14000375f:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140003763:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   14000376a:	00 
   14000376b:	e8 6d eb ff ff       	call   1400022dd <get_va_nth>
   140003770:	eb 07                	jmp    140003779 <__mingw_sformat+0x13c4>
   140003772:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140003775:	49 83 c6 08          	add    r14,0x8
   140003779:	48 8b 7c 24 68       	mov    rdi,QWORD PTR [rsp+0x68]
   14000377e:	48 89 38             	mov    QWORD PTR [rax],rdi
   140003781:	e9 44 09 00 00       	jmp    1400040ca <__mingw_sformat+0x1d15>
   140003786:	44 8b 4c 24 68       	mov    r9d,DWORD PTR [rsp+0x68]
   14000378b:	41 f7 c5 04 00 00 00 	test   r13d,0x4
   140003792:	75 62                	jne    1400037f6 <__mingw_sformat+0x1441>
   140003794:	41 f7 c5 02 00 00 00 	test   r13d,0x2
   14000379b:	74 2a                	je     1400037c7 <__mingw_sformat+0x1412>
   14000379d:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   1400037a2:	74 13                	je     1400037b7 <__mingw_sformat+0x1402>
   1400037a4:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   1400037a8:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400037af:	00 
   1400037b0:	e8 28 eb ff ff       	call   1400022dd <get_va_nth>
   1400037b5:	eb 07                	jmp    1400037be <__mingw_sformat+0x1409>
   1400037b7:	49 8b 06             	mov    rax,QWORD PTR [r14]
   1400037ba:	49 83 c6 08          	add    r14,0x8
   1400037be:	66 44 89 08          	mov    WORD PTR [rax],r9w
   1400037c2:	e9 03 09 00 00       	jmp    1400040ca <__mingw_sformat+0x1d15>
   1400037c7:	41 83 e5 01          	and    r13d,0x1
   1400037cb:	74 29                	je     1400037f6 <__mingw_sformat+0x1441>
   1400037cd:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   1400037d2:	74 13                	je     1400037e7 <__mingw_sformat+0x1432>
   1400037d4:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   1400037d8:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400037df:	00 
   1400037e0:	e8 f8 ea ff ff       	call   1400022dd <get_va_nth>
   1400037e5:	eb 07                	jmp    1400037ee <__mingw_sformat+0x1439>
   1400037e7:	49 8b 06             	mov    rax,QWORD PTR [r14]
   1400037ea:	49 83 c6 08          	add    r14,0x8
   1400037ee:	44 88 08             	mov    BYTE PTR [rax],r9b
   1400037f1:	e9 d4 08 00 00       	jmp    1400040ca <__mingw_sformat+0x1d15>
   1400037f6:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   1400037fb:	74 13                	je     140003810 <__mingw_sformat+0x145b>
   1400037fd:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140003801:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140003808:	00 
   140003809:	e8 cf ea ff ff       	call   1400022dd <get_va_nth>
   14000380e:	eb 07                	jmp    140003817 <__mingw_sformat+0x1462>
   140003810:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140003813:	49 83 c6 08          	add    r14,0x8
   140003817:	44 89 08             	mov    DWORD PTR [rax],r9d
   14000381a:	e9 ab 08 00 00       	jmp    1400040ca <__mingw_sformat+0x1d15>
   14000381f:	85 ff                	test   edi,edi
   140003821:	7e 02                	jle    140003825 <__mingw_sformat+0x1470>
   140003823:	ff cf                	dec    edi
   140003825:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   14000382c:	00 
   14000382d:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003834:	00 
   140003835:	e8 c3 ea ff ff       	call   1400022fd <in_ch>
   14000383a:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   14000383e:	83 f8 ff             	cmp    eax,0xffffffff
   140003841:	75 11                	jne    140003854 <__mingw_sformat+0x149f>
   140003843:	45 85 ff             	test   r15d,r15d
   140003846:	44 0f 44 f8          	cmove  r15d,eax
   14000384a:	44 89 7c 24 50       	mov    DWORD PTR [rsp+0x50],r15d
   14000384f:	e9 5c 0f 00 00       	jmp    1400047b0 <__mingw_sformat+0x23fb>
   140003854:	8b 44 24 50          	mov    eax,DWORD PTR [rsp+0x50]
   140003858:	83 e8 2b             	sub    eax,0x2b
   14000385b:	83 e0 fd             	and    eax,0xfffffffd
   14000385e:	75 30                	jne    140003890 <__mingw_sformat+0x14db>
   140003860:	85 ff                	test   edi,edi
   140003862:	0f 84 48 0f 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003868:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   14000386f:	00 
   140003870:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003877:	00 
   140003878:	e8 80 ea ff ff       	call   1400022fd <in_ch>
   14000387d:	89 c3                	mov    ebx,eax
   14000387f:	83 f8 ff             	cmp    eax,0xffffffff
   140003882:	0f 84 28 0f 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003888:	85 ff                	test   edi,edi
   14000388a:	7e 08                	jle    140003894 <__mingw_sformat+0x14df>
   14000388c:	ff cf                	dec    edi
   14000388e:	eb 04                	jmp    140003894 <__mingw_sformat+0x14df>
   140003890:	8b 5c 24 50          	mov    ebx,DWORD PTR [rsp+0x50]
   140003894:	89 d9                	mov    ecx,ebx
   140003896:	e8 a5 73 00 00       	call   14000ac40 <tolower>
   14000389b:	83 f8 6e             	cmp    eax,0x6e
   14000389e:	0f 85 bc 00 00 00    	jne    140003960 <__mingw_sformat+0x15ab>
   1400038a4:	48 8d 84 24 d8 00 00 	lea    rax,[rsp+0xd8]
   1400038ab:	00 
   1400038ac:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   1400038b3:	00 
   1400038b4:	31 c9                	xor    ecx,ecx
   1400038b6:	bd 01 00 00 00       	mov    ebp,0x1
   1400038bb:	48 89 c2             	mov    rdx,rax
   1400038be:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   1400038c3:	e8 42 e9 ff ff       	call   14000220a <resize_wbuf>
   1400038c8:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   1400038cf:	00 
   1400038d0:	88 18                	mov    BYTE PTR [rax],bl
   1400038d2:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   1400038d9:	00 
   1400038da:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   1400038e1:	00 
   1400038e2:	85 ff                	test   edi,edi
   1400038e4:	0f 84 c6 0e 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   1400038ea:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   1400038f1:	00 
   1400038f2:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400038f9:	00 
   1400038fa:	e8 fe e9 ff ff       	call   1400022fd <in_ch>
   1400038ff:	89 c3                	mov    ebx,eax
   140003901:	83 f8 ff             	cmp    eax,0xffffffff
   140003904:	0f 84 a6 0e 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   14000390a:	89 c1                	mov    ecx,eax
   14000390c:	e8 2f 73 00 00       	call   14000ac40 <tolower>
   140003911:	89 c2                	mov    edx,eax
   140003913:	48 8d 05 3c 8a 00 00 	lea    rax,[rip+0x8a3c]        # 14000c356 <.rdata+0x6>
   14000391a:	0f be 04 28          	movsx  eax,BYTE PTR [rax+rbp*1]
   14000391e:	39 c2                	cmp    edx,eax
   140003920:	0f 85 8a 0e 00 00    	jne    1400047b0 <__mingw_sformat+0x23fb>
   140003926:	85 ff                	test   edi,edi
   140003928:	7e 02                	jle    14000392c <__mingw_sformat+0x1577>
   14000392a:	ff cf                	dec    edi
   14000392c:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003933:	00 
   140003934:	48 8b 54 24 78       	mov    rdx,QWORD PTR [rsp+0x78]
   140003939:	48 89 e9             	mov    rcx,rbp
   14000393c:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   140003940:	e8 c5 e8 ff ff       	call   14000220a <resize_wbuf>
   140003945:	88 1c 28             	mov    BYTE PTR [rax+rbp*1],bl
   140003948:	bd 02 00 00 00       	mov    ebp,0x2
   14000394d:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003954:	00 
   140003955:	49 83 fc 03          	cmp    r12,0x3
   140003959:	75 87                	jne    1400038e2 <__mingw_sformat+0x152d>
   14000395b:	e9 de 05 00 00       	jmp    140003f3e <__mingw_sformat+0x1b89>
   140003960:	89 d9                	mov    ecx,ebx
   140003962:	e8 d9 72 00 00       	call   14000ac40 <tolower>
   140003967:	83 f8 69             	cmp    eax,0x69
   14000396a:	0f 85 ef 01 00 00    	jne    140003b5f <__mingw_sformat+0x17aa>
   140003970:	48 8d 84 24 d8 00 00 	lea    rax,[rsp+0xd8]
   140003977:	00 
   140003978:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   14000397f:	00 
   140003980:	31 c9                	xor    ecx,ecx
   140003982:	bd 01 00 00 00       	mov    ebp,0x1
   140003987:	48 89 c2             	mov    rdx,rax
   14000398a:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   14000398f:	e8 76 e8 ff ff       	call   14000220a <resize_wbuf>
   140003994:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   14000399b:	00 
   14000399c:	88 18                	mov    BYTE PTR [rax],bl
   14000399e:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   1400039a5:	00 
   1400039a6:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   1400039ad:	00 
   1400039ae:	85 ff                	test   edi,edi
   1400039b0:	0f 84 fa 0d 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   1400039b6:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   1400039bd:	00 
   1400039be:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400039c5:	00 
   1400039c6:	e8 32 e9 ff ff       	call   1400022fd <in_ch>
   1400039cb:	89 c3                	mov    ebx,eax
   1400039cd:	83 f8 ff             	cmp    eax,0xffffffff
   1400039d0:	0f 84 da 0d 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   1400039d6:	89 c1                	mov    ecx,eax
   1400039d8:	e8 63 72 00 00       	call   14000ac40 <tolower>
   1400039dd:	89 c2                	mov    edx,eax
   1400039df:	48 8d 05 74 89 00 00 	lea    rax,[rip+0x8974]        # 14000c35a <.rdata+0xa>
   1400039e6:	0f be 04 28          	movsx  eax,BYTE PTR [rax+rbp*1]
   1400039ea:	39 c2                	cmp    edx,eax
   1400039ec:	0f 85 be 0d 00 00    	jne    1400047b0 <__mingw_sformat+0x23fb>
   1400039f2:	85 ff                	test   edi,edi
   1400039f4:	7e 02                	jle    1400039f8 <__mingw_sformat+0x1643>
   1400039f6:	ff cf                	dec    edi
   1400039f8:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   1400039ff:	00 
   140003a00:	48 8b 54 24 78       	mov    rdx,QWORD PTR [rsp+0x78]
   140003a05:	48 89 e9             	mov    rcx,rbp
   140003a08:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   140003a0c:	e8 f9 e7 ff ff       	call   14000220a <resize_wbuf>
   140003a11:	88 1c 28             	mov    BYTE PTR [rax+rbp*1],bl
   140003a14:	bd 02 00 00 00       	mov    ebp,0x2
   140003a19:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003a20:	00 
   140003a21:	49 83 fc 03          	cmp    r12,0x3
   140003a25:	75 87                	jne    1400039ae <__mingw_sformat+0x15f9>
   140003a27:	85 ff                	test   edi,edi
   140003a29:	0f 84 0f 05 00 00    	je     140003f3e <__mingw_sformat+0x1b89>
   140003a2f:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003a36:	00 
   140003a37:	48 8d ac 24 d0 00 00 	lea    rbp,[rsp+0xd0]
   140003a3e:	00 
   140003a3f:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   140003a44:	48 89 ea             	mov    rdx,rbp
   140003a47:	e8 b1 e8 ff ff       	call   1400022fd <in_ch>
   140003a4c:	89 c3                	mov    ebx,eax
   140003a4e:	83 f8 ff             	cmp    eax,0xffffffff
   140003a51:	0f 84 e7 04 00 00    	je     140003f3e <__mingw_sformat+0x1b89>
   140003a57:	89 c1                	mov    ecx,eax
   140003a59:	e8 e2 71 00 00       	call   14000ac40 <tolower>
   140003a5e:	4c 8b 44 24 78       	mov    r8,QWORD PTR [rsp+0x78]
   140003a63:	83 f8 69             	cmp    eax,0x69
   140003a66:	0f 85 d9 00 00 00    	jne    140003b45 <__mingw_sformat+0x1790>
   140003a6c:	85 ff                	test   edi,edi
   140003a6e:	7e 02                	jle    140003a72 <__mingw_sformat+0x16bd>
   140003a70:	ff cf                	dec    edi
   140003a72:	48 8d 84 24 d8 00 00 	lea    rax,[rsp+0xd8]
   140003a79:	00 
   140003a7a:	b9 03 00 00 00       	mov    ecx,0x3
   140003a7f:	bd 04 00 00 00       	mov    ebp,0x4
   140003a84:	48 89 c2             	mov    rdx,rax
   140003a87:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   140003a8e:	00 
   140003a8f:	e8 76 e7 ff ff       	call   14000220a <resize_wbuf>
   140003a94:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003a9b:	00 
   140003a9c:	88 58 03             	mov    BYTE PTR [rax+0x3],bl
   140003a9f:	31 c0                	xor    eax,eax
   140003aa1:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   140003aa6:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   140003aad:	00 
   140003aae:	48 89 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],rax
   140003ab5:	00 
   140003ab6:	85 ff                	test   edi,edi
   140003ab8:	0f 84 f2 0c 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003abe:	48 8b 94 24 88 00 00 	mov    rdx,QWORD PTR [rsp+0x88]
   140003ac5:	00 
   140003ac6:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003acd:	00 
   140003ace:	e8 2a e8 ff ff       	call   1400022fd <in_ch>
   140003ad3:	89 c3                	mov    ebx,eax
   140003ad5:	83 f8 ff             	cmp    eax,0xffffffff
   140003ad8:	0f 84 d2 0c 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003ade:	89 c1                	mov    ecx,eax
   140003ae0:	e8 5b 71 00 00       	call   14000ac40 <tolower>
   140003ae5:	48 8b 4c 24 78       	mov    rcx,QWORD PTR [rsp+0x78]
   140003aea:	89 c2                	mov    edx,eax
   140003aec:	48 8d 05 6c 88 00 00 	lea    rax,[rip+0x886c]        # 14000c35f <.rdata+0xf>
   140003af3:	0f be 04 01          	movsx  eax,BYTE PTR [rcx+rax*1]
   140003af7:	39 c2                	cmp    edx,eax
   140003af9:	0f 85 b1 0c 00 00    	jne    1400047b0 <__mingw_sformat+0x23fb>
   140003aff:	85 ff                	test   edi,edi
   140003b01:	7e 02                	jle    140003b05 <__mingw_sformat+0x1750>
   140003b03:	ff cf                	dec    edi
   140003b05:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003b0c:	00 
   140003b0d:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   140003b14:	00 
   140003b15:	48 89 e9             	mov    rcx,rbp
   140003b18:	4c 8d 65 01          	lea    r12,[rbp+0x1]
   140003b1c:	e8 e9 e6 ff ff       	call   14000220a <resize_wbuf>
   140003b21:	48 ff 44 24 78       	inc    QWORD PTR [rsp+0x78]
   140003b26:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003b2d:	00 
   140003b2e:	88 1c 28             	mov    BYTE PTR [rax+rbp*1],bl
   140003b31:	48 83 7c 24 78 04    	cmp    QWORD PTR [rsp+0x78],0x4
   140003b37:	0f 84 01 04 00 00    	je     140003f3e <__mingw_sformat+0x1b89>
   140003b3d:	4c 89 e5             	mov    rbp,r12
   140003b40:	e9 71 ff ff ff       	jmp    140003ab6 <__mingw_sformat+0x1701>
   140003b45:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140003b4c:	00 
   140003b4d:	45 31 c9             	xor    r9d,r9d
   140003b50:	49 89 e8             	mov    r8,rbp
   140003b53:	89 d9                	mov    ecx,ebx
   140003b55:	e8 12 e8 ff ff       	call   14000236c <back_ch>
   140003b5a:	e9 df 03 00 00       	jmp    140003f3e <__mingw_sformat+0x1b89>
   140003b5f:	85 ff                	test   edi,edi
   140003b61:	0f 84 bb 00 00 00    	je     140003c22 <__mingw_sformat+0x186d>
   140003b67:	83 fb 30             	cmp    ebx,0x30
   140003b6a:	0f 85 b2 00 00 00    	jne    140003c22 <__mingw_sformat+0x186d>
   140003b70:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003b77:	00 
   140003b78:	31 c9                	xor    ecx,ecx
   140003b7a:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   140003b81:	00 
   140003b82:	e8 83 e6 ff ff       	call   14000220a <resize_wbuf>
   140003b87:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003b8e:	00 
   140003b8f:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003b96:	00 
   140003b97:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140003b9a:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003ba1:	00 
   140003ba2:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   140003ba7:	e8 51 e7 ff ff       	call   1400022fd <in_ch>
   140003bac:	85 ff                	test   edi,edi
   140003bae:	4c 8b 44 24 78       	mov    r8,QWORD PTR [rsp+0x78]
   140003bb3:	89 c3                	mov    ebx,eax
   140003bb5:	7e 0d                	jle    140003bc4 <__mingw_sformat+0x180f>
   140003bb7:	40 b5 65             	mov    bpl,0x65
   140003bba:	41 bc 01 00 00 00    	mov    r12d,0x1
   140003bc0:	ff cf                	dec    edi
   140003bc2:	74 7a                	je     140003c3e <__mingw_sformat+0x1889>
   140003bc4:	89 d9                	mov    ecx,ebx
   140003bc6:	4c 89 44 24 78       	mov    QWORD PTR [rsp+0x78],r8
   140003bcb:	e8 70 70 00 00       	call   14000ac40 <tolower>
   140003bd0:	4c 8b 44 24 78       	mov    r8,QWORD PTR [rsp+0x78]
   140003bd5:	83 f8 78             	cmp    eax,0x78
   140003bd8:	75 50                	jne    140003c2a <__mingw_sformat+0x1875>
   140003bda:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   140003be1:	00 
   140003be2:	b9 01 00 00 00       	mov    ecx,0x1
   140003be7:	e8 1e e6 ff ff       	call   14000220a <resize_wbuf>
   140003bec:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003bf3:	00 
   140003bf4:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003bfb:	00 
   140003bfc:	88 58 01             	mov    BYTE PTR [rax+0x1],bl
   140003bff:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003c06:	00 
   140003c07:	44 89 e8             	mov    eax,r13d
   140003c0a:	80 e4 fe             	and    ah,0xfe
   140003c0d:	83 c8 40             	or     eax,0x40
   140003c10:	41 89 c5             	mov    r13d,eax
   140003c13:	e8 e5 e6 ff ff       	call   1400022fd <in_ch>
   140003c18:	89 c3                	mov    ebx,eax
   140003c1a:	85 ff                	test   edi,edi
   140003c1c:	7e 17                	jle    140003c35 <__mingw_sformat+0x1880>
   140003c1e:	ff cf                	dec    edi
   140003c20:	eb 13                	jmp    140003c35 <__mingw_sformat+0x1880>
   140003c22:	40 b5 65             	mov    bpl,0x65
   140003c25:	45 31 e4             	xor    r12d,r12d
   140003c28:	eb 14                	jmp    140003c3e <__mingw_sformat+0x1889>
   140003c2a:	40 b5 65             	mov    bpl,0x65
   140003c2d:	41 bc 01 00 00 00    	mov    r12d,0x1
   140003c33:	eb 09                	jmp    140003c3e <__mingw_sformat+0x1889>
   140003c35:	40 b5 70             	mov    bpl,0x70
   140003c38:	41 bc 02 00 00 00    	mov    r12d,0x2
   140003c3e:	48 8d 84 24 d8 00 00 	lea    rax,[rsp+0xd8]
   140003c45:	00 
   140003c46:	c6 84 24 80 00 00 00 	mov    BYTE PTR [rsp+0x80],0x0
   140003c4d:	00 
   140003c4e:	c6 44 24 78 00       	mov    BYTE PTR [rsp+0x78],0x0
   140003c53:	48 89 84 24 88 00 00 	mov    QWORD PTR [rsp+0x88],rax
   140003c5a:	00 
   140003c5b:	89 d9                	mov    ecx,ebx
   140003c5d:	e8 6e 6f 00 00       	call   14000abd0 <isdigit>
   140003c62:	85 c0                	test   eax,eax
   140003c64:	74 2c                	je     140003c92 <__mingw_sformat+0x18dd>
   140003c66:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003c6d:	00 
   140003c6e:	48 8b 94 24 88 00 00 	mov    rdx,QWORD PTR [rsp+0x88]
   140003c75:	00 
   140003c76:	4c 89 e1             	mov    rcx,r12
   140003c79:	e8 8c e5 ff ff       	call   14000220a <resize_wbuf>
   140003c7e:	42 88 1c 20          	mov    BYTE PTR [rax+r12*1],bl
   140003c82:	49 ff c4             	inc    r12
   140003c85:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003c8c:	00 
   140003c8d:	e9 61 02 00 00       	jmp    140003ef3 <__mingw_sformat+0x1b3e>
   140003c92:	80 bc 24 80 00 00 00 	cmp    BYTE PTR [rsp+0x80],0x0
   140003c99:	00 
   140003c9a:	74 11                	je     140003cad <__mingw_sformat+0x18f8>
   140003c9c:	48 8b 84 24 e0 00 00 	mov    rax,QWORD PTR [rsp+0xe0]
   140003ca3:	00 
   140003ca4:	42 38 6c 20 ff       	cmp    BYTE PTR [rax+r12*1-0x1],bpl
   140003ca9:	75 67                	jne    140003d12 <__mingw_sformat+0x195d>
   140003cab:	eb 16                	jmp    140003cc3 <__mingw_sformat+0x190e>
   140003cad:	41 f7 c5 40 00 00 00 	test   r13d,0x40
   140003cb4:	74 17                	je     140003ccd <__mingw_sformat+0x1918>
   140003cb6:	89 d9                	mov    ecx,ebx
   140003cb8:	e8 23 6f 00 00       	call   14000abe0 <isxdigit>
   140003cbd:	85 c0                	test   eax,eax
   140003cbf:	75 a5                	jne    140003c66 <__mingw_sformat+0x18b1>
   140003cc1:	eb 0a                	jmp    140003ccd <__mingw_sformat+0x1918>
   140003cc3:	8d 43 d5             	lea    eax,[rbx-0x2b]
   140003cc6:	83 e0 fd             	and    eax,0xfffffffd
   140003cc9:	74 9b                	je     140003c66 <__mingw_sformat+0x18b1>
   140003ccb:	eb 45                	jmp    140003d12 <__mingw_sformat+0x195d>
   140003ccd:	4d 85 e4             	test   r12,r12
   140003cd0:	74 40                	je     140003d12 <__mingw_sformat+0x195d>
   140003cd2:	89 d9                	mov    ecx,ebx
   140003cd4:	e8 67 6f 00 00       	call   14000ac40 <tolower>
   140003cd9:	40 38 c5             	cmp    bpl,al
   140003cdc:	75 34                	jne    140003d12 <__mingw_sformat+0x195d>
   140003cde:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003ce5:	00 
   140003ce6:	4c 89 e1             	mov    rcx,r12
   140003ce9:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   140003cf0:	00 
   140003cf1:	e8 14 e5 ff ff       	call   14000220a <resize_wbuf>
   140003cf6:	c6 84 24 80 00 00 00 	mov    BYTE PTR [rsp+0x80],0x1
   140003cfd:	01 
   140003cfe:	42 88 2c 20          	mov    BYTE PTR [rax+r12*1],bpl
   140003d02:	49 ff c4             	inc    r12
   140003d05:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003d0c:	00 
   140003d0d:	e9 dc 01 00 00       	jmp    140003eee <__mingw_sformat+0x1b39>
   140003d12:	85 ff                	test   edi,edi
   140003d14:	41 b9 ff ff ff 7f    	mov    r9d,0x7fffffff
   140003d1a:	4c 8b 5c 24 70       	mov    r11,QWORD PTR [rsp+0x70]
   140003d1f:	44 0f 4f cf          	cmovg  r9d,edi
   140003d23:	80 7c 24 78 00       	cmp    BYTE PTR [rsp+0x78],0x0
   140003d28:	75 67                	jne    140003d91 <__mingw_sformat+0x19dc>
   140003d2a:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   140003d31:	00 
   140003d32:	48 89 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],rax
   140003d39:	00 
   140003d3a:	41 0f b6 03          	movzx  eax,BYTE PTR [r11]
   140003d3e:	39 d8                	cmp    eax,ebx
   140003d40:	75 4f                	jne    140003d91 <__mingw_sformat+0x19dc>
   140003d42:	49 ff c3             	inc    r11
   140003d45:	41 80 3b 00          	cmp    BYTE PTR [r11],0x0
   140003d49:	74 46                	je     140003d91 <__mingw_sformat+0x19dc>
   140003d4b:	45 85 c9             	test   r9d,r9d
   140003d4e:	74 41                	je     140003d91 <__mingw_sformat+0x19dc>
   140003d50:	48 8b 94 24 98 00 00 	mov    rdx,QWORD PTR [rsp+0x98]
   140003d57:	00 
   140003d58:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003d5f:	00 
   140003d60:	44 89 8c 24 a8 00 00 	mov    DWORD PTR [rsp+0xa8],r9d
   140003d67:	00 
   140003d68:	4c 89 9c 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],r11
   140003d6f:	00 
   140003d70:	e8 88 e5 ff ff       	call   1400022fd <in_ch>
   140003d75:	4c 8b 9c 24 a0 00 00 	mov    r11,QWORD PTR [rsp+0xa0]
   140003d7c:	00 
   140003d7d:	44 8b 8c 24 a8 00 00 	mov    r9d,DWORD PTR [rsp+0xa8]
   140003d84:	00 
   140003d85:	83 f8 ff             	cmp    eax,0xffffffff
   140003d88:	89 c3                	mov    ebx,eax
   140003d8a:	74 05                	je     140003d91 <__mingw_sformat+0x19dc>
   140003d8c:	41 ff c9             	dec    r9d
   140003d8f:	eb a9                	jmp    140003d3a <__mingw_sformat+0x1985>
   140003d91:	41 80 3b 00          	cmp    BYTE PTR [r11],0x0
   140003d95:	75 78                	jne    140003e0f <__mingw_sformat+0x1a5a>
   140003d97:	4c 8b 54 24 70       	mov    r10,QWORD PTR [rsp+0x70]
   140003d9c:	4d 29 d4             	sub    r12,r10
   140003d9f:	4c 89 64 24 78       	mov    QWORD PTR [rsp+0x78],r12
   140003da4:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
   140003da9:	4d 8d 24 02          	lea    r12,[r10+rax*1]
   140003dad:	41 80 3a 00          	cmp    BYTE PTR [r10],0x0
   140003db1:	74 4c                	je     140003dff <__mingw_sformat+0x1a4a>
   140003db3:	48 8b 94 24 88 00 00 	mov    rdx,QWORD PTR [rsp+0x88]
   140003dba:	00 
   140003dbb:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003dc2:	00 
   140003dc3:	4c 89 e1             	mov    rcx,r12
   140003dc6:	44 89 8c 24 a0 00 00 	mov    DWORD PTR [rsp+0xa0],r9d
   140003dcd:	00 
   140003dce:	4c 89 94 24 98 00 00 	mov    QWORD PTR [rsp+0x98],r10
   140003dd5:	00 
   140003dd6:	e8 2f e4 ff ff       	call   14000220a <resize_wbuf>
   140003ddb:	4c 8b 94 24 98 00 00 	mov    r10,QWORD PTR [rsp+0x98]
   140003de2:	00 
   140003de3:	44 8b 8c 24 a0 00 00 	mov    r9d,DWORD PTR [rsp+0xa0]
   140003dea:	00 
   140003deb:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003df2:	00 
   140003df3:	41 8a 12             	mov    dl,BYTE PTR [r10]
   140003df6:	49 ff c2             	inc    r10
   140003df9:	42 88 14 20          	mov    BYTE PTR [rax+r12*1],dl
   140003dfd:	eb a5                	jmp    140003da4 <__mingw_sformat+0x19ef>
   140003dff:	85 ff                	test   edi,edi
   140003e01:	0f 8e e7 00 00 00    	jle    140003eee <__mingw_sformat+0x1b39>
   140003e07:	44 89 cf             	mov    edi,r9d
   140003e0a:	e9 df 00 00 00       	jmp    140003eee <__mingw_sformat+0x1b39>
   140003e0f:	4c 8b 44 24 60       	mov    r8,QWORD PTR [rsp+0x60]
   140003e14:	80 7c 24 78 00       	cmp    BYTE PTR [rsp+0x78],0x0
   140003e19:	0f 85 a0 00 00 00    	jne    140003ebf <__mingw_sformat+0x1b0a>
   140003e1f:	41 0f ba e5 08       	bt     r13d,0x8
   140003e24:	0f 83 95 00 00 00    	jae    140003ebf <__mingw_sformat+0x1b0a>
   140003e2a:	4c 89 d8             	mov    rax,r11
   140003e2d:	48 2b 44 24 70       	sub    rax,QWORD PTR [rsp+0x70]
   140003e32:	4c 89 c2             	mov    rdx,r8
   140003e35:	48 2b 54 24 60       	sub    rdx,QWORD PTR [rsp+0x60]
   140003e3a:	48 39 c2             	cmp    rdx,rax
   140003e3d:	7d 12                	jge    140003e51 <__mingw_sformat+0x1a9c>
   140003e3f:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140003e44:	8a 0c 11             	mov    cl,BYTE PTR [rcx+rdx*1]
   140003e47:	41 38 08             	cmp    BYTE PTR [r8],cl
   140003e4a:	75 73                	jne    140003ebf <__mingw_sformat+0x1b0a>
   140003e4c:	49 ff c0             	inc    r8
   140003e4f:	eb e1                	jmp    140003e32 <__mingw_sformat+0x1a7d>
   140003e51:	75 6c                	jne    140003ebf <__mingw_sformat+0x1b0a>
   140003e53:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   140003e5a:	00 
   140003e5b:	48 89 84 24 98 00 00 	mov    QWORD PTR [rsp+0x98],rax
   140003e62:	00 
   140003e63:	41 0f b6 00          	movzx  eax,BYTE PTR [r8]
   140003e67:	39 d8                	cmp    eax,ebx
   140003e69:	75 59                	jne    140003ec4 <__mingw_sformat+0x1b0f>
   140003e6b:	45 85 c9             	test   r9d,r9d
   140003e6e:	78 54                	js     140003ec4 <__mingw_sformat+0x1b0f>
   140003e70:	49 ff c0             	inc    r8
   140003e73:	41 80 38 00          	cmp    BYTE PTR [r8],0x0
   140003e77:	74 4b                	je     140003ec4 <__mingw_sformat+0x1b0f>
   140003e79:	45 85 c9             	test   r9d,r9d
   140003e7c:	74 46                	je     140003ec4 <__mingw_sformat+0x1b0f>
   140003e7e:	48 8b 94 24 98 00 00 	mov    rdx,QWORD PTR [rsp+0x98]
   140003e85:	00 
   140003e86:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003e8d:	00 
   140003e8e:	4c 89 84 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],r8
   140003e95:	00 
   140003e96:	44 89 8c 24 a0 00 00 	mov    DWORD PTR [rsp+0xa0],r9d
   140003e9d:	00 
   140003e9e:	e8 5a e4 ff ff       	call   1400022fd <in_ch>
   140003ea3:	44 8b 8c 24 a0 00 00 	mov    r9d,DWORD PTR [rsp+0xa0]
   140003eaa:	00 
   140003eab:	4c 8b 84 24 a8 00 00 	mov    r8,QWORD PTR [rsp+0xa8]
   140003eb2:	00 
   140003eb3:	83 f8 ff             	cmp    eax,0xffffffff
   140003eb6:	89 c3                	mov    ebx,eax
   140003eb8:	74 0a                	je     140003ec4 <__mingw_sformat+0x1b0f>
   140003eba:	41 ff c9             	dec    r9d
   140003ebd:	eb a4                	jmp    140003e63 <__mingw_sformat+0x1aae>
   140003ebf:	4d 85 c0             	test   r8,r8
   140003ec2:	74 0e                	je     140003ed2 <__mingw_sformat+0x1b1d>
   140003ec4:	41 80 38 00          	cmp    BYTE PTR [r8],0x0
   140003ec8:	75 08                	jne    140003ed2 <__mingw_sformat+0x1b1d>
   140003eca:	85 ff                	test   edi,edi
   140003ecc:	41 0f 4f f9          	cmovg  edi,r9d
   140003ed0:	eb 21                	jmp    140003ef3 <__mingw_sformat+0x1b3e>
   140003ed2:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140003ed9:	00 
   140003eda:	45 31 c9             	xor    r9d,r9d
   140003edd:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   140003ee4:	00 
   140003ee5:	89 d9                	mov    ecx,ebx
   140003ee7:	e8 80 e4 ff ff       	call   14000236c <back_ch>
   140003eec:	eb 34                	jmp    140003f22 <__mingw_sformat+0x1b6d>
   140003eee:	c6 44 24 78 01       	mov    BYTE PTR [rsp+0x78],0x1
   140003ef3:	85 ff                	test   edi,edi
   140003ef5:	74 2b                	je     140003f22 <__mingw_sformat+0x1b6d>
   140003ef7:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140003efe:	00 
   140003eff:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140003f06:	00 
   140003f07:	e8 f1 e3 ff ff       	call   1400022fd <in_ch>
   140003f0c:	89 c3                	mov    ebx,eax
   140003f0e:	83 f8 ff             	cmp    eax,0xffffffff
   140003f11:	74 0f                	je     140003f22 <__mingw_sformat+0x1b6d>
   140003f13:	85 ff                	test   edi,edi
   140003f15:	0f 8e 40 fd ff ff    	jle    140003c5b <__mingw_sformat+0x18a6>
   140003f1b:	ff cf                	dec    edi
   140003f1d:	e9 39 fd ff ff       	jmp    140003c5b <__mingw_sformat+0x18a6>
   140003f22:	4d 85 e4             	test   r12,r12
   140003f25:	0f 84 85 08 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003f2b:	41 f7 c5 40 00 00 00 	test   r13d,0x40
   140003f32:	74 0a                	je     140003f3e <__mingw_sformat+0x1b89>
   140003f34:	49 83 fc 02          	cmp    r12,0x2
   140003f38:	0f 84 72 08 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140003f3e:	4c 8b 84 24 e0 00 00 	mov    r8,QWORD PTR [rsp+0xe0]
   140003f45:	00 
   140003f46:	48 8d 94 24 d8 00 00 	lea    rdx,[rsp+0xd8]
   140003f4d:	00 
   140003f4e:	4c 89 e1             	mov    rcx,r12
   140003f51:	44 89 ed             	mov    ebp,r13d
   140003f54:	81 e5 80 00 00 00    	and    ebp,0x80
   140003f5a:	e8 ab e2 ff ff       	call   14000220a <resize_wbuf>
   140003f5f:	41 f7 c5 08 00 00 00 	test   r13d,0x8
   140003f66:	4c 8d 84 24 e8 00 00 	lea    r8,[rsp+0xe8]
   140003f6d:	00 
   140003f6e:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   140003f75:	00 
   140003f76:	48 89 c7             	mov    rdi,rax
   140003f79:	42 c6 04 20 00       	mov    BYTE PTR [rax+r12*1],0x0
   140003f7e:	74 66                	je     140003fe6 <__mingw_sformat+0x1c31>
   140003f80:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   140003f87:	00 
   140003f88:	48 89 c2             	mov    rdx,rax
   140003f8b:	e8 20 09 00 00       	call   1400048b0 <__mingw_strtold>
   140003f90:	db ac 24 b0 00 00 00 	fld    TBYTE PTR [rsp+0xb0]
   140003f97:	85 ed                	test   ebp,ebp
   140003f99:	0f 85 07 01 00 00    	jne    1400040a6 <__mingw_sformat+0x1cf1>
   140003f9f:	48 3b bc 24 e8 00 00 	cmp    rdi,QWORD PTR [rsp+0xe8]
   140003fa6:	00 
   140003fa7:	0f 84 fd 00 00 00    	je     1400040aa <__mingw_sformat+0x1cf5>
   140003fad:	83 7c 24 50 2d       	cmp    DWORD PTR [rsp+0x50],0x2d
   140003fb2:	75 02                	jne    140003fb6 <__mingw_sformat+0x1c01>
   140003fb4:	d9 e0                	fchs
   140003fb6:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140003fbb:	74 1b                	je     140003fd8 <__mingw_sformat+0x1c23>
   140003fbd:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140003fc1:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140003fc8:	00 
   140003fc9:	db 7c 24 50          	fstp   TBYTE PTR [rsp+0x50]
   140003fcd:	e8 0b e3 ff ff       	call   1400022dd <get_va_nth>
   140003fd2:	db 6c 24 50          	fld    TBYTE PTR [rsp+0x50]
   140003fd6:	eb 07                	jmp    140003fdf <__mingw_sformat+0x1c2a>
   140003fd8:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140003fdb:	49 83 c6 08          	add    r14,0x8
   140003fdf:	db 38                	fstp   TBYTE PTR [rax]
   140003fe1:	e9 ce 00 00 00       	jmp    1400040b4 <__mingw_sformat+0x1cff>
   140003fe6:	41 83 e5 04          	and    r13d,0x4
   140003fea:	74 6c                	je     140004058 <__mingw_sformat+0x1ca3>
   140003fec:	48 8d 8c 24 b0 00 00 	lea    rcx,[rsp+0xb0]
   140003ff3:	00 
   140003ff4:	48 89 c2             	mov    rdx,rax
   140003ff7:	e8 b4 08 00 00       	call   1400048b0 <__mingw_strtold>
   140003ffc:	db ac 24 b0 00 00 00 	fld    TBYTE PTR [rsp+0xb0]
   140004003:	85 ed                	test   ebp,ebp
   140004005:	0f 85 a3 00 00 00    	jne    1400040ae <__mingw_sformat+0x1cf9>
   14000400b:	48 3b bc 24 e8 00 00 	cmp    rdi,QWORD PTR [rsp+0xe8]
   140004012:	00 
   140004013:	0f 84 99 00 00 00    	je     1400040b2 <__mingw_sformat+0x1cfd>
   140004019:	dd 5c 24 78          	fstp   QWORD PTR [rsp+0x78]
   14000401d:	f2 0f 10 44 24 78    	movsd  xmm0,QWORD PTR [rsp+0x78]
   140004023:	83 7c 24 50 2d       	cmp    DWORD PTR [rsp+0x50],0x2d
   140004028:	75 07                	jne    140004031 <__mingw_sformat+0x1c7c>
   14000402a:	0f 57 05 df 83 00 00 	xorps  xmm0,XMMWORD PTR [rip+0x83df]        # 14000c410 <.rdata+0xc0>
   140004031:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140004036:	74 13                	je     14000404b <__mingw_sformat+0x1c96>
   140004038:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   14000403c:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140004043:	00 
   140004044:	e8 94 e2 ff ff       	call   1400022dd <get_va_nth>
   140004049:	eb 07                	jmp    140004052 <__mingw_sformat+0x1c9d>
   14000404b:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14000404e:	49 83 c6 08          	add    r14,0x8
   140004052:	f2 0f 11 00          	movsd  QWORD PTR [rax],xmm0
   140004056:	eb 5c                	jmp    1400040b4 <__mingw_sformat+0x1cff>
   140004058:	4c 89 c2             	mov    rdx,r8
   14000405b:	48 89 c1             	mov    rcx,rax
   14000405e:	e8 cd 07 00 00       	call   140004830 <__mingw_strtof>
   140004063:	85 ed                	test   ebp,ebp
   140004065:	75 4d                	jne    1400040b4 <__mingw_sformat+0x1cff>
   140004067:	48 3b bc 24 e8 00 00 	cmp    rdi,QWORD PTR [rsp+0xe8]
   14000406e:	00 
   14000406f:	74 43                	je     1400040b4 <__mingw_sformat+0x1cff>
   140004071:	83 7c 24 50 2d       	cmp    DWORD PTR [rsp+0x50],0x2d
   140004076:	75 07                	jne    14000407f <__mingw_sformat+0x1cca>
   140004078:	0f 57 05 a1 83 00 00 	xorps  xmm0,XMMWORD PTR [rip+0x83a1]        # 14000c420 <.rdata+0xd0>
   14000407f:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140004084:	74 13                	je     140004099 <__mingw_sformat+0x1ce4>
   140004086:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   14000408a:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140004091:	00 
   140004092:	e8 46 e2 ff ff       	call   1400022dd <get_va_nth>
   140004097:	eb 07                	jmp    1400040a0 <__mingw_sformat+0x1ceb>
   140004099:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14000409c:	49 83 c6 08          	add    r14,0x8
   1400040a0:	f3 0f 11 00          	movss  DWORD PTR [rax],xmm0
   1400040a4:	eb 0e                	jmp    1400040b4 <__mingw_sformat+0x1cff>
   1400040a6:	dd d8                	fstp   st(0)
   1400040a8:	eb 0a                	jmp    1400040b4 <__mingw_sformat+0x1cff>
   1400040aa:	dd d8                	fstp   st(0)
   1400040ac:	eb 06                	jmp    1400040b4 <__mingw_sformat+0x1cff>
   1400040ae:	dd d8                	fstp   st(0)
   1400040b0:	eb 02                	jmp    1400040b4 <__mingw_sformat+0x1cff>
   1400040b2:	dd d8                	fstp   st(0)
   1400040b4:	48 3b bc 24 e8 00 00 	cmp    rdi,QWORD PTR [rsp+0xe8]
   1400040bb:	00 
   1400040bc:	0f 84 ee 06 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   1400040c2:	85 ed                	test   ebp,ebp
   1400040c4:	0f 85 91 06 00 00    	jne    14000475b <__mingw_sformat+0x23a6>
   1400040ca:	41 ff c7             	inc    r15d
   1400040cd:	e9 29 e9 ff ff       	jmp    1400029fb <__mingw_sformat+0x646>
   1400040d2:	45 89 ec             	mov    r12d,r13d
   1400040d5:	44 89 e8             	mov    eax,r13d
   1400040d8:	41 81 e4 80 00 00 00 	and    r12d,0x80
   1400040df:	83 e0 04             	and    eax,0x4
   1400040e2:	89 84 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],eax
   1400040e9:	0f 84 89 00 00 00    	je     140004178 <__mingw_sformat+0x1dc3>
   1400040ef:	45 85 e4             	test   r12d,r12d
   1400040f2:	0f 85 69 01 00 00    	jne    140004261 <__mingw_sformat+0x1eac>
   1400040f8:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   1400040ff:	74 41                	je     140004142 <__mingw_sformat+0x1d8d>
   140004101:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140004106:	74 16                	je     14000411e <__mingw_sformat+0x1d69>
   140004108:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   14000410c:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140004113:	00 
   140004114:	e8 c4 e1 ff ff       	call   1400022dd <get_va_nth>
   140004119:	48 89 c6             	mov    rsi,rax
   14000411c:	eb 07                	jmp    140004125 <__mingw_sformat+0x1d70>
   14000411e:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   140004121:	49 83 c6 08          	add    r14,0x8
   140004125:	48 85 f6             	test   rsi,rsi
   140004128:	0f 84 89 00 00 00    	je     1400041b7 <__mingw_sformat+0x1e02>
   14000412e:	b9 c8 00 00 00       	mov    ecx,0xc8
   140004133:	e8 b8 6a 00 00       	call   14000abf0 <malloc>
   140004138:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   14000413d:	e9 9c 00 00 00       	jmp    1400041de <__mingw_sformat+0x1e29>
   140004142:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140004147:	74 18                	je     140004161 <__mingw_sformat+0x1dac>
   140004149:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   14000414d:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140004154:	00 
   140004155:	e8 83 e1 ff ff       	call   1400022dd <get_va_nth>
   14000415a:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   14000415f:	eb 0c                	jmp    14000416d <__mingw_sformat+0x1db8>
   140004161:	49 8b 06             	mov    rax,QWORD PTR [r14]
   140004164:	49 83 c6 08          	add    r14,0x8
   140004168:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   14000416d:	48 83 7c 24 38 00    	cmp    QWORD PTR [rsp+0x38],0x0
   140004173:	e9 e3 00 00 00       	jmp    14000425b <__mingw_sformat+0x1ea6>
   140004178:	45 85 e4             	test   r12d,r12d
   14000417b:	0f 85 e0 00 00 00    	jne    140004261 <__mingw_sformat+0x1eac>
   140004181:	41 f7 c5 00 06 00 00 	test   r13d,0x600
   140004188:	0f 84 9c 00 00 00    	je     14000422a <__mingw_sformat+0x1e75>
   14000418e:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   140004193:	74 16                	je     1400041ab <__mingw_sformat+0x1df6>
   140004195:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140004199:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400041a0:	00 
   1400041a1:	e8 37 e1 ff ff       	call   1400022dd <get_va_nth>
   1400041a6:	48 89 c6             	mov    rsi,rax
   1400041a9:	eb 07                	jmp    1400041b2 <__mingw_sformat+0x1dfd>
   1400041ab:	49 8b 36             	mov    rsi,QWORD PTR [r14]
   1400041ae:	49 83 c6 08          	add    r14,0x8
   1400041b2:	48 85 f6             	test   rsi,rsi
   1400041b5:	75 18                	jne    1400041cf <__mingw_sformat+0x1e1a>
   1400041b7:	48 8d 94 24 c8 00 00 	lea    rdx,[rsp+0xc8]
   1400041be:	00 
   1400041bf:	4c 8d 8c 24 e0 00 00 	lea    r9,[rsp+0xe0]
   1400041c6:	00 
   1400041c7:	45 31 c0             	xor    r8d,r8d
   1400041ca:	e9 f4 05 00 00       	jmp    1400047c3 <__mingw_sformat+0x240e>
   1400041cf:	b9 64 00 00 00       	mov    ecx,0x64
   1400041d4:	e8 17 6a 00 00       	call   14000abf0 <malloc>
   1400041d9:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1400041de:	48 89 06             	mov    QWORD PTR [rsi],rax
   1400041e1:	48 85 c0             	test   rax,rax
   1400041e4:	75 15                	jne    1400041fb <__mingw_sformat+0x1e46>
   1400041e6:	41 81 e5 00 04 00 00 	and    r13d,0x400
   1400041ed:	b8 ff ff ff ff       	mov    eax,0xffffffff
   1400041f2:	44 0f 45 f8          	cmovne r15d,eax
   1400041f6:	e9 b5 05 00 00       	jmp    1400047b0 <__mingw_sformat+0x23fb>
   1400041fb:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140004202:	00 
   140004203:	e8 38 df ff ff       	call   140002140 <resize_gcollect>
   140004208:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   14000420b:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140004212:	00 
   140004213:	48 8d 4a 01          	lea    rcx,[rdx+0x1]
   140004217:	48 89 08             	mov    QWORD PTR [rax],rcx
   14000421a:	48 89 74 d0 10       	mov    QWORD PTR [rax+rdx*8+0x10],rsi
   14000421f:	48 c7 44 24 28 64 00 	mov    QWORD PTR [rsp+0x28],0x64
   140004226:	00 00 
   140004228:	eb 37                	jmp    140004261 <__mingw_sformat+0x1eac>
   14000422a:	83 7c 24 20 00       	cmp    DWORD PTR [rsp+0x20],0x0
   14000422f:	74 18                	je     140004249 <__mingw_sformat+0x1e94>
   140004231:	8b 54 24 20          	mov    edx,DWORD PTR [rsp+0x20]
   140004235:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   14000423c:	00 
   14000423d:	e8 9b e0 ff ff       	call   1400022dd <get_va_nth>
   140004242:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140004247:	eb 0c                	jmp    140004255 <__mingw_sformat+0x1ea0>
   140004249:	49 8b 06             	mov    rax,QWORD PTR [r14]
   14000424c:	49 83 c6 08          	add    r14,0x8
   140004250:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140004255:	48 83 7c 24 30 00    	cmp    QWORD PTR [rsp+0x30],0x0
   14000425b:	0f 84 4f 05 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   140004261:	8a 5d 01             	mov    bl,BYTE PTR [rbp+0x1]
   140004264:	80 fb 5e             	cmp    bl,0x5e
   140004267:	75 09                	jne    140004272 <__mingw_sformat+0x1ebd>
   140004269:	48 8d 45 02          	lea    rax,[rbp+0x2]
   14000426d:	48 89 44 24 48       	mov    QWORD PTR [rsp+0x48],rax
   140004272:	85 ff                	test   edi,edi
   140004274:	b8 ff ff ff 7f       	mov    eax,0x7fffffff
   140004279:	0f 48 f8             	cmovs  edi,eax
   14000427c:	48 81 bc 24 d8 00 00 	cmp    QWORD PTR [rsp+0xd8],0xff
   140004283:	00 ff 00 00 00 
   140004288:	77 30                	ja     1400042ba <__mingw_sformat+0x1f05>
   14000428a:	48 8b 8c 24 e0 00 00 	mov    rcx,QWORD PTR [rsp+0xe0]
   140004291:	00 
   140004292:	48 c7 84 24 d8 00 00 	mov    QWORD PTR [rsp+0xd8],0x100
   140004299:	00 00 01 00 00 
   14000429e:	48 85 c9             	test   rcx,rcx
   1400042a1:	74 05                	je     1400042a8 <__mingw_sformat+0x1ef3>
   1400042a3:	e8 18 69 00 00       	call   14000abc0 <free>
   1400042a8:	b9 00 01 00 00       	mov    ecx,0x100
   1400042ad:	e8 3e 69 00 00       	call   14000abf0 <malloc>
   1400042b2:	48 89 84 24 e0 00 00 	mov    QWORD PTR [rsp+0xe0],rax
   1400042b9:	00 
   1400042ba:	48 8b ac 24 e0 00 00 	mov    rbp,QWORD PTR [rsp+0xe0]
   1400042c1:	00 
   1400042c2:	41 b8 00 01 00 00    	mov    r8d,0x100
   1400042c8:	31 d2                	xor    edx,edx
   1400042ca:	48 89 e9             	mov    rcx,rbp
   1400042cd:	e8 2e 69 00 00       	call   14000ac00 <memset>
   1400042d2:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   1400042d7:	48 0f be 00          	movsx  rax,BYTE PTR [rax]
   1400042db:	3c 5d                	cmp    al,0x5d
   1400042dd:	74 04                	je     1400042e3 <__mingw_sformat+0x1f2e>
   1400042df:	3c 2d                	cmp    al,0x2d
   1400042e1:	75 0a                	jne    1400042ed <__mingw_sformat+0x1f38>
   1400042e3:	48 ff 44 24 48       	inc    QWORD PTR [rsp+0x48]
   1400042e8:	c6 44 05 00 01       	mov    BYTE PTR [rbp+rax*1+0x0],0x1
   1400042ed:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   1400042f2:	0f b6 00             	movzx  eax,BYTE PTR [rax]
   1400042f5:	84 c0                	test   al,al
   1400042f7:	0f 84 b3 04 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   1400042fd:	48 ff 44 24 48       	inc    QWORD PTR [rsp+0x48]
   140004302:	3c 5d                	cmp    al,0x5d
   140004304:	74 35                	je     14000433b <__mingw_sformat+0x1f86>
   140004306:	3c 2d                	cmp    al,0x2d
   140004308:	75 de                	jne    1400042e8 <__mingw_sformat+0x1f33>
   14000430a:	48 8b 4c 24 48       	mov    rcx,QWORD PTR [rsp+0x48]
   14000430f:	8a 09                	mov    cl,BYTE PTR [rcx]
   140004311:	84 c9                	test   cl,cl
   140004313:	74 d3                	je     1400042e8 <__mingw_sformat+0x1f33>
   140004315:	80 f9 5d             	cmp    cl,0x5d
   140004318:	74 ce                	je     1400042e8 <__mingw_sformat+0x1f33>
   14000431a:	48 8b 54 24 48       	mov    rdx,QWORD PTR [rsp+0x48]
   14000431f:	8a 52 fe             	mov    dl,BYTE PTR [rdx-0x2]
   140004322:	38 d1                	cmp    cl,dl
   140004324:	72 c2                	jb     1400042e8 <__mingw_sformat+0x1f33>
   140004326:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   14000432b:	3a 10                	cmp    dl,BYTE PTR [rax]
   14000432d:	73 be                	jae    1400042ed <__mingw_sformat+0x1f38>
   14000432f:	0f b6 c2             	movzx  eax,dl
   140004332:	ff c2                	inc    edx
   140004334:	c6 44 05 00 01       	mov    BYTE PTR [rbp+rax*1+0x0],0x1
   140004339:	eb eb                	jmp    140004326 <__mingw_sformat+0x1f71>
   14000433b:	48 8b 84 24 d0 00 00 	mov    rax,QWORD PTR [rsp+0xd0]
   140004342:	00 
   140004343:	80 fb 5e             	cmp    bl,0x5e
   140004346:	0f 94 44 24 78       	sete   BYTE PTR [rsp+0x78]
   14000434b:	83 bc 24 80 00 00 00 	cmp    DWORD PTR [rsp+0x80],0x0
   140004352:	00 
   140004353:	48 89 44 24 50       	mov    QWORD PTR [rsp+0x50],rax
   140004358:	48 8d 84 24 d0 00 00 	lea    rax,[rsp+0xd0]
   14000435f:	00 
   140004360:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140004365:	0f 84 31 02 00 00    	je     14000459c <__mingw_sformat+0x21e7>
   14000436b:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   140004372:	00 
   140004373:	48 89 c2             	mov    rdx,rax
   140004376:	e8 82 df ff ff       	call   1400022fd <in_ch>
   14000437b:	89 c3                	mov    ebx,eax
   14000437d:	83 f8 ff             	cmp    eax,0xffffffff
   140004380:	0f 84 3d 02 00 00    	je     1400045c3 <__mingw_sformat+0x220e>
   140004386:	31 c0                	xor    eax,eax
   140004388:	45 31 d2             	xor    r10d,r10d
   14000438b:	48 89 84 24 f8 00 00 	mov    QWORD PTR [rsp+0xf8],rax
   140004392:	00 
   140004393:	48 8d 84 24 f8 00 00 	lea    rax,[rsp+0xf8]
   14000439a:	00 
   14000439b:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400043a0:	48 8d 84 24 c3 00 00 	lea    rax,[rsp+0xc3]
   1400043a7:	00 
   1400043a8:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   1400043af:	00 
   1400043b0:	44 89 e8             	mov    eax,r13d
   1400043b3:	25 00 06 00 00       	and    eax,0x600
   1400043b8:	89 84 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],eax
   1400043bf:	48 63 c3             	movsxd rax,ebx
   1400043c2:	8a 4c 24 78          	mov    cl,BYTE PTR [rsp+0x78]
   1400043c6:	38 4c 05 00          	cmp    BYTE PTR [rbp+rax*1+0x0],cl
   1400043ca:	75 2c                	jne    1400043f8 <__mingw_sformat+0x2043>
   1400043cc:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400043d3:	00 
   1400043d4:	41 b9 01 00 00 00    	mov    r9d,0x1
   1400043da:	89 d9                	mov    ecx,ebx
   1400043dc:	4c 89 54 24 20       	mov    QWORD PTR [rsp+0x20],r10
   1400043e1:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   1400043e8:	00 
   1400043e9:	e8 7e df ff ff       	call   14000236c <back_ch>
   1400043ee:	4c 8b 54 24 20       	mov    r10,QWORD PTR [rsp+0x20]
   1400043f3:	e9 3c 01 00 00       	jmp    140004534 <__mingw_sformat+0x217f>
   1400043f8:	45 85 e4             	test   r12d,r12d
   1400043fb:	0f 85 fd 00 00 00    	jne    1400044fe <__mingw_sformat+0x2149>
   140004401:	4c 8b 4c 24 20       	mov    r9,QWORD PTR [rsp+0x20]
   140004406:	48 8b 94 24 80 00 00 	mov    rdx,QWORD PTR [rsp+0x80]
   14000440d:	00 
   14000440e:	41 b8 01 00 00 00    	mov    r8d,0x1
   140004414:	4c 89 94 24 98 00 00 	mov    QWORD PTR [rsp+0x98],r10
   14000441b:	00 
   14000441c:	48 8b 4c 24 38       	mov    rcx,QWORD PTR [rsp+0x38]
   140004421:	88 9c 24 c3 00 00 00 	mov    BYTE PTR [rsp+0xc3],bl
   140004428:	e8 f1 63 00 00       	call   14000a81e <mbrtowc>
   14000442d:	4c 8b 94 24 98 00 00 	mov    r10,QWORD PTR [rsp+0x98]
   140004434:	00 
   140004435:	48 83 f8 fe          	cmp    rax,0xfffffffffffffffe
   140004439:	75 08                	jne    140004443 <__mingw_sformat+0x208e>
   14000443b:	49 ff c2             	inc    r10
   14000443e:	e9 c1 00 00 00       	jmp    140004504 <__mingw_sformat+0x214f>
   140004443:	48 83 44 24 38 02    	add    QWORD PTR [rsp+0x38],0x2
   140004449:	83 bc 24 88 00 00 00 	cmp    DWORD PTR [rsp+0x88],0x0
   140004450:	00 
   140004451:	0f 84 a4 00 00 00    	je     1400044fb <__mingw_sformat+0x2146>
   140004457:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   14000445c:	45 31 d2             	xor    r10d,r10d
   14000445f:	4c 8d 0c 00          	lea    r9,[rax+rax*1]
   140004463:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140004466:	4c 01 c8             	add    rax,r9
   140004469:	48 39 44 24 38       	cmp    QWORD PTR [rsp+0x38],rax
   14000446e:	0f 85 8a 00 00 00    	jne    1400044fe <__mingw_sformat+0x2149>
   140004474:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140004479:	4d 89 c8             	mov    r8,r9
   14000447c:	4c 8d 50 01          	lea    r10,[rax+0x1]
   140004480:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140004483:	4b 8d 14 00          	lea    rdx,[r8+r8*1]
   140004487:	4c 89 8c 24 98 00 00 	mov    QWORD PTR [rsp+0x98],r9
   14000448e:	00 
   14000448f:	4c 89 44 24 38       	mov    QWORD PTR [rsp+0x38],r8
   140004494:	4c 89 94 24 a0 00 00 	mov    QWORD PTR [rsp+0xa0],r10
   14000449b:	00 
   14000449c:	e8 67 67 00 00       	call   14000ac08 <realloc>
   1400044a1:	4c 8b 44 24 38       	mov    r8,QWORD PTR [rsp+0x38]
   1400044a6:	4c 8b 8c 24 98 00 00 	mov    r9,QWORD PTR [rsp+0x98]
   1400044ad:	00 
   1400044ae:	48 85 c0             	test   rax,rax
   1400044b1:	75 12                	jne    1400044c5 <__mingw_sformat+0x2110>
   1400044b3:	4c 8b 94 24 a0 00 00 	mov    r10,QWORD PTR [rsp+0xa0]
   1400044ba:	00 
   1400044bb:	4d 39 c2             	cmp    r10,r8
   1400044be:	73 17                	jae    1400044d7 <__mingw_sformat+0x2122>
   1400044c0:	4d 89 d0             	mov    r8,r10
   1400044c3:	eb bb                	jmp    140004480 <__mingw_sformat+0x20cb>
   1400044c5:	48 89 06             	mov    QWORD PTR [rsi],rax
   1400044c8:	4c 01 c8             	add    rax,r9
   1400044cb:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1400044d0:	4c 89 44 24 28       	mov    QWORD PTR [rsp+0x28],r8
   1400044d5:	eb 24                	jmp    1400044fb <__mingw_sformat+0x2146>
   1400044d7:	41 0f ba e5 0a       	bt     r13d,0xa
   1400044dc:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   1400044e1:	0f 82 f9 01 00 00    	jb     1400046e0 <__mingw_sformat+0x232b>
   1400044e7:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400044ea:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   1400044ef:	66 c7 44 70 fe 00 00 	mov    WORD PTR [rax+rsi*2-0x2],0x0
   1400044f6:	e9 df 01 00 00       	jmp    1400046da <__mingw_sformat+0x2325>
   1400044fb:	45 31 d2             	xor    r10d,r10d
   1400044fe:	ff cf                	dec    edi
   140004500:	85 ff                	test   edi,edi
   140004502:	7e 30                	jle    140004534 <__mingw_sformat+0x217f>
   140004504:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   14000450b:	00 
   14000450c:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140004513:	00 
   140004514:	4c 89 94 24 98 00 00 	mov    QWORD PTR [rsp+0x98],r10
   14000451b:	00 
   14000451c:	e8 dc dd ff ff       	call   1400022fd <in_ch>
   140004521:	4c 8b 94 24 98 00 00 	mov    r10,QWORD PTR [rsp+0x98]
   140004528:	00 
   140004529:	83 f8 ff             	cmp    eax,0xffffffff
   14000452c:	89 c3                	mov    ebx,eax
   14000452e:	0f 85 8b fe ff ff    	jne    1400043bf <__mingw_sformat+0x200a>
   140004534:	4d 85 d2             	test   r10,r10
   140004537:	74 10                	je     140004549 <__mingw_sformat+0x2194>
   140004539:	e8 2a 66 00 00       	call   14000ab68 <_errno>
   14000453e:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   140004544:	e9 67 02 00 00       	jmp    1400047b0 <__mingw_sformat+0x23fb>
   140004549:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   14000454e:	48 39 84 24 d0 00 00 	cmp    QWORD PTR [rsp+0xd0],rax
   140004555:	00 
   140004556:	0f 84 54 02 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   14000455c:	45 85 e4             	test   r12d,r12d
   14000455f:	0f 85 f6 01 00 00    	jne    14000475b <__mingw_sformat+0x23a6>
   140004565:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   14000456a:	48 89 f1             	mov    rcx,rsi
   14000456d:	41 ff c7             	inc    r15d
   140004570:	48 8d 78 02          	lea    rdi,[rax+0x2]
   140004574:	66 c7 00 00 00       	mov    WORD PTR [rax],0x0
   140004579:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   14000457e:	48 89 fa             	mov    rdx,rdi
   140004581:	4c 8d 04 00          	lea    r8,[rax+rax*1]
   140004585:	e8 e8 db ff ff       	call   140002172 <optimize_alloc>
   14000458a:	45 31 db             	xor    r11d,r11d
   14000458d:	48 89 7c 24 38       	mov    QWORD PTR [rsp+0x38],rdi
   140004592:	44 89 5c 24 44       	mov    DWORD PTR [rsp+0x44],r11d
   140004597:	e9 78 02 00 00       	jmp    140004814 <__mingw_sformat+0x245f>
   14000459c:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
   1400045a1:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400045a8:	00 
   1400045a9:	e8 4f dd ff ff       	call   1400022fd <in_ch>
   1400045ae:	89 c3                	mov    ebx,eax
   1400045b0:	83 f8 ff             	cmp    eax,0xffffffff
   1400045b3:	74 0e                	je     1400045c3 <__mingw_sformat+0x220e>
   1400045b5:	44 89 e8             	mov    eax,r13d
   1400045b8:	25 00 06 00 00       	and    eax,0x600
   1400045bd:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   1400045c1:	eb 4b                	jmp    14000460e <__mingw_sformat+0x2259>
   1400045c3:	45 85 ff             	test   r15d,r15d
   1400045c6:	48 8d 94 24 c8 00 00 	lea    rdx,[rsp+0xc8]
   1400045cd:	00 
   1400045ce:	4c 8d 8c 24 e0 00 00 	lea    r9,[rsp+0xe0]
   1400045d5:	00 
   1400045d6:	49 89 f0             	mov    r8,rsi
   1400045d9:	41 0f 45 df          	cmovne ebx,r15d
   1400045dd:	89 d9                	mov    ecx,ebx
   1400045df:	e9 e2 01 00 00       	jmp    1400047c6 <__mingw_sformat+0x2411>
   1400045e4:	45 85 e4             	test   r12d,r12d
   1400045e7:	74 54                	je     14000463d <__mingw_sformat+0x2288>
   1400045e9:	ff cf                	dec    edi
   1400045eb:	0f 84 19 01 00 00    	je     14000470a <__mingw_sformat+0x2355>
   1400045f1:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
   1400045f6:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   1400045fd:	00 
   1400045fe:	e8 fa dc ff ff       	call   1400022fd <in_ch>
   140004603:	89 c3                	mov    ebx,eax
   140004605:	83 f8 ff             	cmp    eax,0xffffffff
   140004608:	0f 84 fc 00 00 00    	je     14000470a <__mingw_sformat+0x2355>
   14000460e:	48 63 c3             	movsxd rax,ebx
   140004611:	8a 4c 24 78          	mov    cl,BYTE PTR [rsp+0x78]
   140004615:	38 4c 05 00          	cmp    BYTE PTR [rbp+rax*1+0x0],cl
   140004619:	75 c9                	jne    1400045e4 <__mingw_sformat+0x222f>
   14000461b:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140004622:	00 
   140004623:	41 b9 01 00 00 00    	mov    r9d,0x1
   140004629:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   140004630:	00 
   140004631:	89 d9                	mov    ecx,ebx
   140004633:	e8 34 dd ff ff       	call   14000236c <back_ch>
   140004638:	e9 cd 00 00 00       	jmp    14000470a <__mingw_sformat+0x2355>
   14000463d:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   140004642:	88 18                	mov    BYTE PTR [rax],bl
   140004644:	83 7c 24 44 00       	cmp    DWORD PTR [rsp+0x44],0x0
   140004649:	0f 84 a9 00 00 00    	je     1400046f8 <__mingw_sformat+0x2343>
   14000464f:	48 8b 4c 24 30       	mov    rcx,QWORD PTR [rsp+0x30]
   140004654:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140004659:	48 03 06             	add    rax,QWORD PTR [rsi]
   14000465c:	48 ff c1             	inc    rcx
   14000465f:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   140004664:	48 39 c1             	cmp    rcx,rax
   140004667:	75 80                	jne    1400045e9 <__mingw_sformat+0x2234>
   140004669:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   14000466e:	48 8d 14 00          	lea    rdx,[rax+rax*1]
   140004672:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140004676:	48 8b 0e             	mov    rcx,QWORD PTR [rsi]
   140004679:	48 89 54 24 30       	mov    QWORD PTR [rsp+0x30],rdx
   14000467e:	4c 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],r8
   140004685:	00 
   140004686:	e8 7d 65 00 00       	call   14000ac08 <realloc>
   14000468b:	48 8b 54 24 30       	mov    rdx,QWORD PTR [rsp+0x30]
   140004690:	48 85 c0             	test   rax,rax
   140004693:	75 12                	jne    1400046a7 <__mingw_sformat+0x22f2>
   140004695:	4c 8b 84 24 80 00 00 	mov    r8,QWORD PTR [rsp+0x80]
   14000469c:	00 
   14000469d:	49 39 d0             	cmp    r8,rdx
   1400046a0:	73 1f                	jae    1400046c1 <__mingw_sformat+0x230c>
   1400046a2:	4c 89 c2             	mov    rdx,r8
   1400046a5:	eb cf                	jmp    140004676 <__mingw_sformat+0x22c1>
   1400046a7:	48 8b 4c 24 28       	mov    rcx,QWORD PTR [rsp+0x28]
   1400046ac:	48 89 06             	mov    QWORD PTR [rsi],rax
   1400046af:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   1400046b4:	48 01 c1             	add    rcx,rax
   1400046b7:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   1400046bc:	e9 28 ff ff ff       	jmp    1400045e9 <__mingw_sformat+0x2234>
   1400046c1:	41 0f ba e5 0a       	bt     r13d,0xa
   1400046c6:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   1400046cb:	72 13                	jb     1400046e0 <__mingw_sformat+0x232b>
   1400046cd:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   1400046d0:	48 8b 74 24 28       	mov    rsi,QWORD PTR [rsp+0x28]
   1400046d5:	c6 44 30 ff 00       	mov    BYTE PTR [rax+rsi*1-0x1],0x0
   1400046da:	41 8d 4f 01          	lea    ecx,[r15+0x1]
   1400046de:	31 f6                	xor    esi,esi
   1400046e0:	48 8d 94 24 c8 00 00 	lea    rdx,[rsp+0xc8]
   1400046e7:	00 
   1400046e8:	4c 8d 8c 24 e0 00 00 	lea    r9,[rsp+0xe0]
   1400046ef:	00 
   1400046f0:	49 89 f0             	mov    r8,rsi
   1400046f3:	e9 ce 00 00 00       	jmp    1400047c6 <__mingw_sformat+0x2411>
   1400046f8:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   1400046fd:	48 ff c0             	inc    rax
   140004700:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   140004705:	e9 df fe ff ff       	jmp    1400045e9 <__mingw_sformat+0x2234>
   14000470a:	48 8b 44 24 50       	mov    rax,QWORD PTR [rsp+0x50]
   14000470f:	48 39 84 24 d0 00 00 	cmp    QWORD PTR [rsp+0xd0],rax
   140004716:	00 
   140004717:	0f 84 93 00 00 00    	je     1400047b0 <__mingw_sformat+0x23fb>
   14000471d:	45 31 d2             	xor    r10d,r10d
   140004720:	44 89 54 24 44       	mov    DWORD PTR [rsp+0x44],r10d
   140004725:	45 85 e4             	test   r12d,r12d
   140004728:	75 31                	jne    14000475b <__mingw_sformat+0x23a6>
   14000472a:	48 8b 44 24 30       	mov    rax,QWORD PTR [rsp+0x30]
   14000472f:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   140004734:	48 89 f1             	mov    rcx,rsi
   140004737:	41 ff c7             	inc    r15d
   14000473a:	c6 00 00             	mov    BYTE PTR [rax],0x0
   14000473d:	48 8d 78 01          	lea    rdi,[rax+0x1]
   140004741:	48 89 fa             	mov    rdx,rdi
   140004744:	e8 29 da ff ff       	call   140002172 <optimize_alloc>
   140004749:	48 89 7c 24 30       	mov    QWORD PTR [rsp+0x30],rdi
   14000474e:	e9 c1 00 00 00       	jmp    140004814 <__mingw_sformat+0x245f>
   140004753:	c7 44 24 44 01 00 00 	mov    DWORD PTR [rsp+0x44],0x1
   14000475a:	00 
   14000475b:	8b 44 24 44          	mov    eax,DWORD PTR [rsp+0x44]
   14000475f:	4c 8b 64 24 48       	mov    r12,QWORD PTR [rsp+0x48]
   140004764:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   140004768:	e9 41 dd ff ff       	jmp    1400024ae <__mingw_sformat+0xf9>
   14000476d:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140004772:	74 3c                	je     1400047b0 <__mingw_sformat+0x23fb>
   140004774:	48 8b 8c 24 50 01 00 	mov    rcx,QWORD PTR [rsp+0x150]
   14000477b:	00 
   14000477c:	48 8d 94 24 d0 00 00 	lea    rdx,[rsp+0xd0]
   140004783:	00 
   140004784:	e8 74 db ff ff       	call   1400022fd <in_ch>
   140004789:	89 c1                	mov    ecx,eax
   14000478b:	89 c3                	mov    ebx,eax
   14000478d:	e8 46 64 00 00       	call   14000abd8 <isspace>
   140004792:	85 c0                	test   eax,eax
   140004794:	75 de                	jne    140004774 <__mingw_sformat+0x23bf>
   140004796:	45 31 c9             	xor    r9d,r9d
   140004799:	4c 8d 84 24 d0 00 00 	lea    r8,[rsp+0xd0]
   1400047a0:	00 
   1400047a1:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400047a8:	00 
   1400047a9:	89 d9                	mov    ecx,ebx
   1400047ab:	e8 bc db ff ff       	call   14000236c <back_ch>
   1400047b0:	48 8d 94 24 c8 00 00 	lea    rdx,[rsp+0xc8]
   1400047b7:	00 
   1400047b8:	4c 8d 8c 24 e0 00 00 	lea    r9,[rsp+0xe0]
   1400047bf:	00 
   1400047c0:	49 89 f0             	mov    r8,rsi
   1400047c3:	44 89 f9             	mov    ecx,r15d
   1400047c6:	e8 a4 da ff ff       	call   14000226f <cleanup_return>
   1400047cb:	eb 4e                	jmp    14000481b <__mingw_sformat+0x2466>
   1400047cd:	41 80 fc 78          	cmp    r12b,0x78
   1400047d1:	74 16                	je     1400047e9 <__mingw_sformat+0x2434>
   1400047d3:	41 80 fc 70          	cmp    r12b,0x70
   1400047d7:	0f 85 53 eb ff ff    	jne    140003330 <__mingw_sformat+0xf7b>
   1400047dd:	44 89 e8             	mov    eax,r13d
   1400047e0:	83 e0 f1             	and    eax,0xfffffff1
   1400047e3:	83 c8 2c             	or     eax,0x2c
   1400047e6:	41 89 c5             	mov    r13d,eax
   1400047e9:	c7 44 24 40 10 00 00 	mov    DWORD PTR [rsp+0x40],0x10
   1400047f0:	00 
   1400047f1:	e9 3a eb ff ff       	jmp    140003330 <__mingw_sformat+0xf7b>
   1400047f6:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   1400047fb:	48 89 ea             	mov    rdx,rbp
   1400047fe:	48 89 f1             	mov    rcx,rsi
   140004801:	41 ff c7             	inc    r15d
   140004804:	e8 69 d9 ff ff       	call   140002172 <optimize_alloc>
   140004809:	31 c0                	xor    eax,eax
   14000480b:	48 89 6c 24 30       	mov    QWORD PTR [rsp+0x30],rbp
   140004810:	89 44 24 44          	mov    DWORD PTR [rsp+0x44],eax
   140004814:	31 f6                	xor    esi,esi
   140004816:	e9 40 ff ff ff       	jmp    14000475b <__mingw_sformat+0x23a6>
   14000481b:	48 81 c4 08 01 00 00 	add    rsp,0x108
   140004822:	5b                   	pop    rbx
   140004823:	5e                   	pop    rsi
   140004824:	5f                   	pop    rdi
   140004825:	5d                   	pop    rbp
   140004826:	41 5c                	pop    r12
   140004828:	41 5d                	pop    r13
   14000482a:	41 5e                	pop    r14
   14000482c:	41 5f                	pop    r15
   14000482e:	c3                   	ret
   14000482f:	90                   	nop

0000000140004830 <__mingw_strtof>:
   140004830:	48 83 ec 48          	sub    rsp,0x48
   140004834:	4c 8d 05 15 68 00 00 	lea    r8,[rip+0x6815]        # 14000b050 <fpi0.0>
   14000483b:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   140004840:	4c 8d 4c 24 3c       	lea    r9,[rsp+0x3c]
   140004845:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000484a:	e8 88 3a 00 00       	call   1400082d7 <__strtodg>
   14000484f:	89 c2                	mov    edx,eax
   140004851:	89 c1                	mov    ecx,eax
   140004853:	31 c0                	xor    eax,eax
   140004855:	83 e2 07             	and    edx,0x7
   140004858:	ff ca                	dec    edx
   14000485a:	83 fa 04             	cmp    edx,0x4
   14000485d:	77 3c                	ja     14000489b <__mingw_strtof+0x6b>
   14000485f:	4c 8d 05 ca 7b 00 00 	lea    r8,[rip+0x7bca]        # 14000c430 <.rdata>
   140004866:	49 63 04 90          	movsxd rax,DWORD PTR [r8+rdx*4]
   14000486a:	4c 01 c0             	add    rax,r8
   14000486d:	ff e0                	jmp    rax
   14000486f:	8b 44 24 3c          	mov    eax,DWORD PTR [rsp+0x3c]
   140004873:	8b 54 24 38          	mov    edx,DWORD PTR [rsp+0x38]
   140004877:	05 96 00 00 00       	add    eax,0x96
   14000487c:	81 e2 ff ff 7f 00    	and    edx,0x7fffff
   140004882:	c1 e0 17             	shl    eax,0x17
   140004885:	09 d0                	or     eax,edx
   140004887:	eb 12                	jmp    14000489b <__mingw_strtof+0x6b>
   140004889:	8b 44 24 38          	mov    eax,DWORD PTR [rsp+0x38]
   14000488d:	eb 0c                	jmp    14000489b <__mingw_strtof+0x6b>
   14000488f:	b8 00 00 c0 7f       	mov    eax,0x7fc00000
   140004894:	eb 05                	jmp    14000489b <__mingw_strtof+0x6b>
   140004896:	b8 00 00 80 7f       	mov    eax,0x7f800000
   14000489b:	80 e1 08             	and    cl,0x8
   14000489e:	74 05                	je     1400048a5 <__mingw_strtof+0x75>
   1400048a0:	0d 00 00 00 80       	or     eax,0x80000000
   1400048a5:	66 0f 6e c0          	movd   xmm0,eax
   1400048a9:	48 83 c4 48          	add    rsp,0x48
   1400048ad:	c3                   	ret
   1400048ae:	90                   	nop
   1400048af:	90                   	nop

00000001400048b0 <__mingw_strtold>:
   1400048b0:	53                   	push   rbx
   1400048b1:	48 83 ec 50          	sub    rsp,0x50
   1400048b5:	31 c0                	xor    eax,eax
   1400048b7:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   1400048bc:	48 8d 44 24 38       	lea    rax,[rsp+0x38]
   1400048c1:	48 89 cb             	mov    rbx,rcx
   1400048c4:	48 89 d1             	mov    rcx,rdx
   1400048c7:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   1400048cc:	4c 89 c2             	mov    rdx,r8
   1400048cf:	45 31 c0             	xor    r8d,r8d
   1400048d2:	4c 8d 4c 24 34       	lea    r9,[rsp+0x34]
   1400048d7:	44 89 44 24 48       	mov    DWORD PTR [rsp+0x48],r8d
   1400048dc:	4c 8d 05 8d 67 00 00 	lea    r8,[rip+0x678d]        # 14000b070 <fpi0.0>
   1400048e3:	e8 ef 39 00 00       	call   1400082d7 <__strtodg>
   1400048e8:	89 c2                	mov    edx,eax
   1400048ea:	83 e0 07             	and    eax,0x7
   1400048ed:	ff c8                	dec    eax
   1400048ef:	83 f8 04             	cmp    eax,0x4
   1400048f2:	77 4b                	ja     14000493f <__mingw_strtold+0x8f>
   1400048f4:	48 8d 0d 55 7b 00 00 	lea    rcx,[rip+0x7b55]        # 14000c450 <.rdata>
   1400048fb:	48 63 04 81          	movsxd rax,DWORD PTR [rcx+rax*4]
   1400048ff:	48 01 c8             	add    rax,rcx
   140004902:	ff e0                	jmp    rax
   140004904:	8b 44 24 34          	mov    eax,DWORD PTR [rsp+0x34]
   140004908:	66 05 3e 40          	add    ax,0x403e
   14000490c:	66 89 44 24 48       	mov    WORD PTR [rsp+0x48],ax
   140004911:	48 8b 44 24 38       	mov    rax,QWORD PTR [rsp+0x38]
   140004916:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   14000491b:	eb 22                	jmp    14000493f <__mingw_strtold+0x8f>
   14000491d:	c7 44 24 46 00 80 ff 	mov    DWORD PTR [rsp+0x46],0x7fff8000
   140004924:	7f 
   140004925:	eb 18                	jmp    14000493f <__mingw_strtold+0x8f>
   140004927:	48 8b 05 d2 7f 00 00 	mov    rax,QWORD PTR [rip+0x7fd2]        # 14000c900 <.refptr.NanDflt_ldus_D2A>
   14000492e:	66 8b 48 08          	mov    cx,WORD PTR [rax+0x8]
   140004932:	48 8b 00             	mov    rax,QWORD PTR [rax]
   140004935:	66 89 4c 24 48       	mov    WORD PTR [rsp+0x48],cx
   14000493a:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   14000493f:	80 e2 08             	and    dl,0x8
   140004942:	74 07                	je     14000494b <__mingw_strtold+0x9b>
   140004944:	66 81 4c 24 48 00 80 	or     WORD PTR [rsp+0x48],0x8000
   14000494b:	db 6c 24 40          	fld    TBYTE PTR [rsp+0x40]
   14000494f:	48 89 d8             	mov    rax,rbx
   140004952:	db 3b                	fstp   TBYTE PTR [rbx]
   140004954:	48 83 c4 50          	add    rsp,0x50
   140004958:	5b                   	pop    rbx
   140004959:	c3                   	ret
   14000495a:	90                   	nop
   14000495b:	90                   	nop
   14000495c:	90                   	nop
   14000495d:	90                   	nop
   14000495e:	90                   	nop
   14000495f:	90                   	nop

0000000140004960 <__pformat_cvt>:
   140004960:	53                   	push   rbx
   140004961:	48 83 c4 80          	add    rsp,0xffffffffffffff80
   140004965:	db 2a                	fld    TBYTE PTR [rdx]
   140004967:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   14000496b:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   140004970:	41 89 cb             	mov    r11d,ecx
   140004973:	41 89 c2             	mov    r10d,eax
   140004976:	66 41 81 e2 ff 7f    	and    r10w,0x7fff
   14000497c:	75 18                	jne    140004996 <__pformat_cvt+0x36>
   14000497e:	48 8b 54 24 40       	mov    rdx,QWORD PTR [rsp+0x40]
   140004983:	31 c9                	xor    ecx,ecx
   140004985:	48 89 d3             	mov    rbx,rdx
   140004988:	48 c1 eb 20          	shr    rbx,0x20
   14000498c:	09 da                	or     edx,ebx
   14000498e:	74 50                	je     1400049e0 <__pformat_cvt+0x80>
   140004990:	85 db                	test   ebx,ebx
   140004992:	78 31                	js     1400049c5 <__pformat_cvt+0x65>
   140004994:	eb 40                	jmp    1400049d6 <__pformat_cvt+0x76>
   140004996:	66 41 81 fa ff 7f    	cmp    r10w,0x7fff
   14000499c:	75 27                	jne    1400049c5 <__pformat_cvt+0x65>
   14000499e:	48 8b 4c 24 40       	mov    rcx,QWORD PTR [rsp+0x40]
   1400049a3:	48 89 ca             	mov    rdx,rcx
   1400049a6:	48 c1 ea 20          	shr    rdx,0x20
   1400049aa:	81 e2 ff ff ff 7f    	and    edx,0x7fffffff
   1400049b0:	09 ca                	or     edx,ecx
   1400049b2:	b9 04 00 00 00       	mov    ecx,0x4
   1400049b7:	83 fa 01             	cmp    edx,0x1
   1400049ba:	19 d2                	sbb    edx,edx
   1400049bc:	c1 ea 1f             	shr    edx,0x1f
   1400049bf:	29 d1                	sub    ecx,edx
   1400049c1:	31 d2                	xor    edx,edx
   1400049c3:	eb 1b                	jmp    1400049e0 <__pformat_cvt+0x80>
   1400049c5:	66 41 81 ea 3e 40    	sub    r10w,0x403e
   1400049cb:	b9 01 00 00 00       	mov    ecx,0x1
   1400049d0:	41 0f bf d2          	movsx  edx,r10w
   1400049d4:	eb 0a                	jmp    1400049e0 <__pformat_cvt+0x80>
   1400049d6:	b9 02 00 00 00       	mov    ecx,0x2
   1400049db:	ba c3 bf ff ff       	mov    edx,0xffffbfc3
   1400049e0:	89 4c 24 5c          	mov    DWORD PTR [rsp+0x5c],ecx
   1400049e4:	db 6c 24 40          	fld    TBYTE PTR [rsp+0x40]
   1400049e8:	25 00 80 00 00       	and    eax,0x8000
   1400049ed:	83 f9 04             	cmp    ecx,0x4
   1400049f0:	b9 00 00 00 00       	mov    ecx,0x0
   1400049f5:	0f 44 c1             	cmove  eax,ecx
   1400049f8:	48 8b 8c 24 b0 00 00 	mov    rcx,QWORD PTR [rsp+0xb0]
   1400049ff:	00 
   140004a00:	db 7c 24 70          	fstp   TBYTE PTR [rsp+0x70]
   140004a04:	0f 28 44 24 70       	movaps xmm0,XMMWORD PTR [rsp+0x70]
   140004a09:	89 01                	mov    DWORD PTR [rcx],eax
   140004a0b:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   140004a10:	48 8d 0d 79 66 00 00 	lea    rcx,[rip+0x6679]        # 14000b090 <fpi.0>
   140004a17:	4c 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],r9
   140004a1c:	4c 8d 4c 24 5c       	lea    r9,[rsp+0x5c]
   140004a21:	44 89 44 24 28       	mov    DWORD PTR [rsp+0x28],r8d
   140004a26:	4c 8d 44 24 60       	lea    r8,[rsp+0x60]
   140004a2b:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   140004a30:	44 89 5c 24 20       	mov    DWORD PTR [rsp+0x20],r11d
   140004a35:	0f 29 44 24 60       	movaps XMMWORD PTR [rsp+0x60],xmm0
   140004a3a:	e8 31 18 00 00       	call   140006270 <__gdtoa>
   140004a3f:	48 83 ec 80          	sub    rsp,0xffffffffffffff80
   140004a43:	5b                   	pop    rbx
   140004a44:	c3                   	ret

0000000140004a45 <__pformat_putc>:
   140004a45:	53                   	push   rbx
   140004a46:	48 83 ec 20          	sub    rsp,0x20
   140004a4a:	8b 42 08             	mov    eax,DWORD PTR [rdx+0x8]
   140004a4d:	0f ba e0 0e          	bt     eax,0xe
   140004a51:	48 89 d3             	mov    rbx,rdx
   140004a54:	72 08                	jb     140004a5e <__pformat_putc+0x19>
   140004a56:	8b 52 24             	mov    edx,DWORD PTR [rdx+0x24]
   140004a59:	39 53 28             	cmp    DWORD PTR [rbx+0x28],edx
   140004a5c:	7e 17                	jle    140004a75 <__pformat_putc+0x30>
   140004a5e:	0f ba e0 0d          	bt     eax,0xd
   140004a62:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140004a65:	73 07                	jae    140004a6e <__pformat_putc+0x29>
   140004a67:	e8 4c 61 00 00       	call   14000abb8 <fputc>
   140004a6c:	eb 07                	jmp    140004a75 <__pformat_putc+0x30>
   140004a6e:	48 63 43 24          	movsxd rax,DWORD PTR [rbx+0x24]
   140004a72:	88 0c 02             	mov    BYTE PTR [rdx+rax*1],cl
   140004a75:	ff 43 24             	inc    DWORD PTR [rbx+0x24]
   140004a78:	48 83 c4 20          	add    rsp,0x20
   140004a7c:	5b                   	pop    rbx
   140004a7d:	c3                   	ret

0000000140004a7e <__pformat_wputchars>:
   140004a7e:	41 57                	push   r15
   140004a80:	41 56                	push   r14
   140004a82:	41 55                	push   r13
   140004a84:	41 54                	push   r12
   140004a86:	55                   	push   rbp
   140004a87:	57                   	push   rdi
   140004a88:	56                   	push   rsi
   140004a89:	53                   	push   rbx
   140004a8a:	48 83 ec 48          	sub    rsp,0x48
   140004a8e:	4c 89 c3             	mov    rbx,r8
   140004a91:	48 89 cd             	mov    rbp,rcx
   140004a94:	4c 8d 44 24 28       	lea    r8,[rsp+0x28]
   140004a99:	89 d6                	mov    esi,edx
   140004a9b:	48 8d 4c 24 30       	lea    rcx,[rsp+0x30]
   140004aa0:	31 d2                	xor    edx,edx
   140004aa2:	e8 32 5b 00 00       	call   14000a5d9 <wcrtomb>
   140004aa7:	8b 43 10             	mov    eax,DWORD PTR [rbx+0x10]
   140004aaa:	85 c0                	test   eax,eax
   140004aac:	78 05                	js     140004ab3 <__pformat_wputchars+0x35>
   140004aae:	39 c6                	cmp    esi,eax
   140004ab0:	0f 4f f0             	cmovg  esi,eax
   140004ab3:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004ab6:	39 f0                	cmp    eax,esi
   140004ab8:	7f 09                	jg     140004ac3 <__pformat_wputchars+0x45>
   140004aba:	c7 43 0c ff ff ff ff 	mov    DWORD PTR [rbx+0xc],0xffffffff
   140004ac1:	eb 27                	jmp    140004aea <__pformat_wputchars+0x6c>
   140004ac3:	29 f0                	sub    eax,esi
   140004ac5:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   140004ac8:	f6 43 09 04          	test   BYTE PTR [rbx+0x9],0x4
   140004acc:	75 1c                	jne    140004aea <__pformat_wputchars+0x6c>
   140004ace:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004ad1:	8d 50 ff             	lea    edx,[rax-0x1]
   140004ad4:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004ad7:	85 c0                	test   eax,eax
   140004ad9:	74 0f                	je     140004aea <__pformat_wputchars+0x6c>
   140004adb:	48 89 da             	mov    rdx,rbx
   140004ade:	b9 20 00 00 00       	mov    ecx,0x20
   140004ae3:	e8 5d ff ff ff       	call   140004a45 <__pformat_putc>
   140004ae8:	eb e4                	jmp    140004ace <__pformat_wputchars+0x50>
   140004aea:	45 31 ff             	xor    r15d,r15d
   140004aed:	89 f0                	mov    eax,esi
   140004aef:	44 29 f8             	sub    eax,r15d
   140004af2:	85 c0                	test   eax,eax
   140004af4:	7e 3a                	jle    140004b30 <__pformat_wputchars+0xb2>
   140004af6:	42 0f b7 54 7d 00    	movzx  edx,WORD PTR [rbp+r15*2+0x0]
   140004afc:	4c 8d 44 24 28       	lea    r8,[rsp+0x28]
   140004b01:	48 8d 4c 24 30       	lea    rcx,[rsp+0x30]
   140004b06:	e8 ce 5a 00 00       	call   14000a5d9 <wcrtomb>
   140004b0b:	85 c0                	test   eax,eax
   140004b0d:	7e 21                	jle    140004b30 <__pformat_wputchars+0xb2>
   140004b0f:	41 89 c6             	mov    r14d,eax
   140004b12:	31 ff                	xor    edi,edi
   140004b14:	49 39 fe             	cmp    r14,rdi
   140004b17:	74 12                	je     140004b2b <__pformat_wputchars+0xad>
   140004b19:	0f be 4c 3c 30       	movsx  ecx,BYTE PTR [rsp+rdi*1+0x30]
   140004b1e:	48 89 da             	mov    rdx,rbx
   140004b21:	48 ff c7             	inc    rdi
   140004b24:	e8 1c ff ff ff       	call   140004a45 <__pformat_putc>
   140004b29:	eb e9                	jmp    140004b14 <__pformat_wputchars+0x96>
   140004b2b:	49 ff c7             	inc    r15
   140004b2e:	eb bd                	jmp    140004aed <__pformat_wputchars+0x6f>
   140004b30:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004b33:	8d 50 ff             	lea    edx,[rax-0x1]
   140004b36:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004b39:	85 c0                	test   eax,eax
   140004b3b:	7e 0f                	jle    140004b4c <__pformat_wputchars+0xce>
   140004b3d:	48 89 da             	mov    rdx,rbx
   140004b40:	b9 20 00 00 00       	mov    ecx,0x20
   140004b45:	e8 fb fe ff ff       	call   140004a45 <__pformat_putc>
   140004b4a:	eb e4                	jmp    140004b30 <__pformat_wputchars+0xb2>
   140004b4c:	48 83 c4 48          	add    rsp,0x48
   140004b50:	5b                   	pop    rbx
   140004b51:	5e                   	pop    rsi
   140004b52:	5f                   	pop    rdi
   140004b53:	5d                   	pop    rbp
   140004b54:	41 5c                	pop    r12
   140004b56:	41 5d                	pop    r13
   140004b58:	41 5e                	pop    r14
   140004b5a:	41 5f                	pop    r15
   140004b5c:	c3                   	ret

0000000140004b5d <__pformat_putchars>:
   140004b5d:	55                   	push   rbp
   140004b5e:	57                   	push   rdi
   140004b5f:	56                   	push   rsi
   140004b60:	53                   	push   rbx
   140004b61:	48 83 ec 28          	sub    rsp,0x28
   140004b65:	41 8b 40 10          	mov    eax,DWORD PTR [r8+0x10]
   140004b69:	48 89 cd             	mov    rbp,rcx
   140004b6c:	89 d6                	mov    esi,edx
   140004b6e:	4c 89 c3             	mov    rbx,r8
   140004b71:	85 c0                	test   eax,eax
   140004b73:	78 06                	js     140004b7b <__pformat_putchars+0x1e>
   140004b75:	39 c6                	cmp    esi,eax
   140004b77:	48 0f 4f f0          	cmovg  rsi,rax
   140004b7b:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004b7e:	39 f0                	cmp    eax,esi
   140004b80:	7f 09                	jg     140004b8b <__pformat_putchars+0x2e>
   140004b82:	c7 43 0c ff ff ff ff 	mov    DWORD PTR [rbx+0xc],0xffffffff
   140004b89:	eb 0b                	jmp    140004b96 <__pformat_putchars+0x39>
   140004b8b:	29 f0                	sub    eax,esi
   140004b8d:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   140004b90:	f6 43 09 04          	test   BYTE PTR [rbx+0x9],0x4
   140004b94:	74 04                	je     140004b9a <__pformat_putchars+0x3d>
   140004b96:	31 ff                	xor    edi,edi
   140004b98:	eb 1c                	jmp    140004bb6 <__pformat_putchars+0x59>
   140004b9a:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004b9d:	8d 50 ff             	lea    edx,[rax-0x1]
   140004ba0:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004ba3:	85 c0                	test   eax,eax
   140004ba5:	74 ef                	je     140004b96 <__pformat_putchars+0x39>
   140004ba7:	48 89 da             	mov    rdx,rbx
   140004baa:	b9 20 00 00 00       	mov    ecx,0x20
   140004baf:	e8 91 fe ff ff       	call   140004a45 <__pformat_putc>
   140004bb4:	eb e4                	jmp    140004b9a <__pformat_putchars+0x3d>
   140004bb6:	48 39 fe             	cmp    rsi,rdi
   140004bb9:	74 12                	je     140004bcd <__pformat_putchars+0x70>
   140004bbb:	0f be 4c 3d 00       	movsx  ecx,BYTE PTR [rbp+rdi*1+0x0]
   140004bc0:	48 89 da             	mov    rdx,rbx
   140004bc3:	48 ff c7             	inc    rdi
   140004bc6:	e8 7a fe ff ff       	call   140004a45 <__pformat_putc>
   140004bcb:	eb e9                	jmp    140004bb6 <__pformat_putchars+0x59>
   140004bcd:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004bd0:	8d 50 ff             	lea    edx,[rax-0x1]
   140004bd3:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004bd6:	85 c0                	test   eax,eax
   140004bd8:	7e 0f                	jle    140004be9 <__pformat_putchars+0x8c>
   140004bda:	48 89 da             	mov    rdx,rbx
   140004bdd:	b9 20 00 00 00       	mov    ecx,0x20
   140004be2:	e8 5e fe ff ff       	call   140004a45 <__pformat_putc>
   140004be7:	eb e4                	jmp    140004bcd <__pformat_putchars+0x70>
   140004be9:	48 83 c4 28          	add    rsp,0x28
   140004bed:	5b                   	pop    rbx
   140004bee:	5e                   	pop    rsi
   140004bef:	5f                   	pop    rdi
   140004bf0:	5d                   	pop    rbp
   140004bf1:	c3                   	ret

0000000140004bf2 <__pformat_puts>:
   140004bf2:	56                   	push   rsi
   140004bf3:	53                   	push   rbx
   140004bf4:	48 83 ec 28          	sub    rsp,0x28
   140004bf8:	48 89 cb             	mov    rbx,rcx
   140004bfb:	48 89 d6             	mov    rsi,rdx
   140004bfe:	48 85 c9             	test   rcx,rcx
   140004c01:	75 07                	jne    140004c0a <__pformat_puts+0x18>
   140004c03:	48 8d 1d 66 78 00 00 	lea    rbx,[rip+0x7866]        # 14000c470 <.rdata>
   140004c0a:	48 63 56 10          	movsxd rdx,DWORD PTR [rsi+0x10]
   140004c0e:	48 89 d9             	mov    rcx,rbx
   140004c11:	85 d2                	test   edx,edx
   140004c13:	78 07                	js     140004c1c <__pformat_puts+0x2a>
   140004c15:	e8 c6 5a 00 00       	call   14000a6e0 <strnlen>
   140004c1a:	eb 05                	jmp    140004c21 <__pformat_puts+0x2f>
   140004c1c:	e8 ff 5f 00 00       	call   14000ac20 <strlen>
   140004c21:	49 89 f0             	mov    r8,rsi
   140004c24:	89 c2                	mov    edx,eax
   140004c26:	48 89 d9             	mov    rcx,rbx
   140004c29:	48 83 c4 28          	add    rsp,0x28
   140004c2d:	5b                   	pop    rbx
   140004c2e:	5e                   	pop    rsi
   140004c2f:	e9 29 ff ff ff       	jmp    140004b5d <__pformat_putchars>

0000000140004c34 <__pformat_emit_inf_or_nan>:
   140004c34:	48 83 ec 38          	sub    rsp,0x38
   140004c38:	b0 2d                	mov    al,0x2d
   140004c3a:	85 c9                	test   ecx,ecx
   140004c3c:	41 c7 40 10 ff ff ff 	mov    DWORD PTR [r8+0x10],0xffffffff
   140004c43:	ff 
   140004c44:	41 8b 48 08          	mov    ecx,DWORD PTR [r8+0x8]
   140004c48:	75 08                	jne    140004c52 <__pformat_emit_inf_or_nan+0x1e>
   140004c4a:	0f ba e1 08          	bt     ecx,0x8
   140004c4e:	73 16                	jae    140004c66 <__pformat_emit_inf_or_nan+0x32>
   140004c50:	b0 2b                	mov    al,0x2b
   140004c52:	88 44 24 2c          	mov    BYTE PTR [rsp+0x2c],al
   140004c56:	48 8d 44 24 2d       	lea    rax,[rsp+0x2d]
   140004c5b:	41 89 ca             	mov    r10d,ecx
   140004c5e:	31 c9                	xor    ecx,ecx
   140004c60:	41 83 e2 20          	and    r10d,0x20
   140004c64:	eb 0e                	jmp    140004c74 <__pformat_emit_inf_or_nan+0x40>
   140004c66:	48 8d 44 24 2c       	lea    rax,[rsp+0x2c]
   140004c6b:	f6 c1 40             	test   cl,0x40
   140004c6e:	74 eb                	je     140004c5b <__pformat_emit_inf_or_nan+0x27>
   140004c70:	b0 20                	mov    al,0x20
   140004c72:	eb de                	jmp    140004c52 <__pformat_emit_inf_or_nan+0x1e>
   140004c74:	44 8a 0c 0a          	mov    r9b,BYTE PTR [rdx+rcx*1]
   140004c78:	41 83 e1 df          	and    r9d,0xffffffdf
   140004c7c:	45 09 d1             	or     r9d,r10d
   140004c7f:	44 88 0c 08          	mov    BYTE PTR [rax+rcx*1],r9b
   140004c83:	48 ff c1             	inc    rcx
   140004c86:	48 83 f9 03          	cmp    rcx,0x3
   140004c8a:	75 e8                	jne    140004c74 <__pformat_emit_inf_or_nan+0x40>
   140004c8c:	48 8d 50 03          	lea    rdx,[rax+0x3]
   140004c90:	48 8d 4c 24 2c       	lea    rcx,[rsp+0x2c]
   140004c95:	29 ca                	sub    edx,ecx
   140004c97:	e8 c1 fe ff ff       	call   140004b5d <__pformat_putchars>
   140004c9c:	90                   	nop
   140004c9d:	48 83 c4 38          	add    rsp,0x38
   140004ca1:	c3                   	ret

0000000140004ca2 <__pformat_emit_radix_point>:
   140004ca2:	55                   	push   rbp
   140004ca3:	41 55                	push   r13
   140004ca5:	41 54                	push   r12
   140004ca7:	57                   	push   rdi
   140004ca8:	56                   	push   rsi
   140004ca9:	53                   	push   rbx
   140004caa:	48 83 ec 38          	sub    rsp,0x38
   140004cae:	48 8d 6c 24 30       	lea    rbp,[rsp+0x30]
   140004cb3:	48 89 cb             	mov    rbx,rcx
   140004cb6:	83 79 14 fd          	cmp    DWORD PTR [rcx+0x14],0xfffffffd
   140004cba:	75 30                	jne    140004cec <__pformat_emit_radix_point+0x4a>
   140004cbc:	31 d2                	xor    edx,edx
   140004cbe:	48 89 55 f8          	mov    QWORD PTR [rbp-0x8],rdx
   140004cc2:	e8 21 5f 00 00       	call   14000abe8 <localeconv>
   140004cc7:	48 8d 4d f6          	lea    rcx,[rbp-0xa]
   140004ccb:	4c 8d 4d f8          	lea    r9,[rbp-0x8]
   140004ccf:	41 b8 10 00 00 00    	mov    r8d,0x10
   140004cd5:	48 8b 10             	mov    rdx,QWORD PTR [rax]
   140004cd8:	e8 41 5b 00 00       	call   14000a81e <mbrtowc>
   140004cdd:	85 c0                	test   eax,eax
   140004cdf:	7e 08                	jle    140004ce9 <__pformat_emit_radix_point+0x47>
   140004ce1:	66 8b 55 f6          	mov    dx,WORD PTR [rbp-0xa]
   140004ce5:	66 89 53 18          	mov    WORD PTR [rbx+0x18],dx
   140004ce9:	89 43 14             	mov    DWORD PTR [rbx+0x14],eax
   140004cec:	0f b7 53 18          	movzx  edx,WORD PTR [rbx+0x18]
   140004cf0:	66 85 d2             	test   dx,dx
   140004cf3:	74 61                	je     140004d56 <__pformat_emit_radix_point+0xb4>
   140004cf5:	48 63 43 14          	movsxd rax,DWORD PTR [rbx+0x14]
   140004cf9:	48 89 e7             	mov    rdi,rsp
   140004cfc:	48 83 c0 0f          	add    rax,0xf
   140004d00:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   140004d04:	e8 c7 d2 ff ff       	call   140001fd0 <___chkstk_ms>
   140004d09:	48 29 c4             	sub    rsp,rax
   140004d0c:	4c 8d 45 f8          	lea    r8,[rbp-0x8]
   140004d10:	31 c0                	xor    eax,eax
   140004d12:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
   140004d17:	48 89 45 f8          	mov    QWORD PTR [rbp-0x8],rax
   140004d1b:	4c 89 e9             	mov    rcx,r13
   140004d1e:	e8 b6 58 00 00       	call   14000a5d9 <wcrtomb>
   140004d23:	85 c0                	test   eax,eax
   140004d25:	7e 1d                	jle    140004d44 <__pformat_emit_radix_point+0xa2>
   140004d27:	41 89 c4             	mov    r12d,eax
   140004d2a:	31 f6                	xor    esi,esi
   140004d2c:	49 39 f4             	cmp    r12,rsi
   140004d2f:	74 20                	je     140004d51 <__pformat_emit_radix_point+0xaf>
   140004d31:	41 0f be 4c 35 00    	movsx  ecx,BYTE PTR [r13+rsi*1+0x0]
   140004d37:	48 89 da             	mov    rdx,rbx
   140004d3a:	48 ff c6             	inc    rsi
   140004d3d:	e8 03 fd ff ff       	call   140004a45 <__pformat_putc>
   140004d42:	eb e8                	jmp    140004d2c <__pformat_emit_radix_point+0x8a>
   140004d44:	48 89 da             	mov    rdx,rbx
   140004d47:	b9 2e 00 00 00       	mov    ecx,0x2e
   140004d4c:	e8 f4 fc ff ff       	call   140004a45 <__pformat_putc>
   140004d51:	48 89 fc             	mov    rsp,rdi
   140004d54:	eb 0e                	jmp    140004d64 <__pformat_emit_radix_point+0xc2>
   140004d56:	48 89 da             	mov    rdx,rbx
   140004d59:	b9 2e 00 00 00       	mov    ecx,0x2e
   140004d5e:	e8 e2 fc ff ff       	call   140004a45 <__pformat_putc>
   140004d63:	90                   	nop
   140004d64:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   140004d68:	5b                   	pop    rbx
   140004d69:	5e                   	pop    rsi
   140004d6a:	5f                   	pop    rdi
   140004d6b:	41 5c                	pop    r12
   140004d6d:	41 5d                	pop    r13
   140004d6f:	5d                   	pop    rbp
   140004d70:	c3                   	ret

0000000140004d71 <__pformat_emit_float>:
   140004d71:	55                   	push   rbp
   140004d72:	57                   	push   rdi
   140004d73:	56                   	push   rsi
   140004d74:	53                   	push   rbx
   140004d75:	48 83 ec 28          	sub    rsp,0x28
   140004d79:	41 8b 41 0c          	mov    eax,DWORD PTR [r9+0xc]
   140004d7d:	89 cd                	mov    ebp,ecx
   140004d7f:	48 89 d7             	mov    rdi,rdx
   140004d82:	44 89 c6             	mov    esi,r8d
   140004d85:	4c 89 cb             	mov    rbx,r9
   140004d88:	45 85 c0             	test   r8d,r8d
   140004d8b:	7e 0a                	jle    140004d97 <__pformat_emit_float+0x26>
   140004d8d:	41 39 c0             	cmp    r8d,eax
   140004d90:	7f 20                	jg     140004db2 <__pformat_emit_float+0x41>
   140004d92:	44 29 c0             	sub    eax,r8d
   140004d95:	eb 14                	jmp    140004dab <__pformat_emit_float+0x3a>
   140004d97:	85 c0                	test   eax,eax
   140004d99:	7e 04                	jle    140004d9f <__pformat_emit_float+0x2e>
   140004d9b:	ff c8                	dec    eax
   140004d9d:	eb 0c                	jmp    140004dab <__pformat_emit_float+0x3a>
   140004d9f:	74 0a                	je     140004dab <__pformat_emit_float+0x3a>
   140004da1:	41 c7 41 0c ff ff ff 	mov    DWORD PTR [r9+0xc],0xffffffff
   140004da8:	ff 
   140004da9:	eb 2a                	jmp    140004dd5 <__pformat_emit_float+0x64>
   140004dab:	8b 53 10             	mov    edx,DWORD PTR [rbx+0x10]
   140004dae:	39 c2                	cmp    edx,eax
   140004db0:	7c 09                	jl     140004dbb <__pformat_emit_float+0x4a>
   140004db2:	c7 43 0c ff ff ff ff 	mov    DWORD PTR [rbx+0xc],0xffffffff
   140004db9:	eb 16                	jmp    140004dd1 <__pformat_emit_float+0x60>
   140004dbb:	29 d0                	sub    eax,edx
   140004dbd:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   140004dc0:	83 7b 10 00          	cmp    DWORD PTR [rbx+0x10],0x0
   140004dc4:	7f 06                	jg     140004dcc <__pformat_emit_float+0x5b>
   140004dc6:	f6 43 09 08          	test   BYTE PTR [rbx+0x9],0x8
   140004dca:	74 05                	je     140004dd1 <__pformat_emit_float+0x60>
   140004dcc:	ff c8                	dec    eax
   140004dce:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   140004dd1:	85 f6                	test   esi,esi
   140004dd3:	7f 09                	jg     140004dde <__pformat_emit_float+0x6d>
   140004dd5:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004dd8:	85 c0                	test   eax,eax
   140004dda:	7f 30                	jg     140004e0c <__pformat_emit_float+0x9b>
   140004ddc:	eb 40                	jmp    140004e1e <__pformat_emit_float+0xad>
   140004dde:	f6 43 09 10          	test   BYTE PTR [rbx+0x9],0x10
   140004de2:	74 f1                	je     140004dd5 <__pformat_emit_float+0x64>
   140004de4:	66 83 7b 20 00       	cmp    WORD PTR [rbx+0x20],0x0
   140004de9:	74 ea                	je     140004dd5 <__pformat_emit_float+0x64>
   140004deb:	8d 46 02             	lea    eax,[rsi+0x2]
   140004dee:	b9 03 00 00 00       	mov    ecx,0x3
   140004df3:	99                   	cdq
   140004df4:	f7 f9                	idiv   ecx
   140004df6:	ff c8                	dec    eax
   140004df8:	85 c0                	test   eax,eax
   140004dfa:	74 d9                	je     140004dd5 <__pformat_emit_float+0x64>
   140004dfc:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   140004dff:	85 d2                	test   edx,edx
   140004e01:	7e d2                	jle    140004dd5 <__pformat_emit_float+0x64>
   140004e03:	ff ca                	dec    edx
   140004e05:	ff c8                	dec    eax
   140004e07:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004e0a:	eb ec                	jmp    140004df8 <__pformat_emit_float+0x87>
   140004e0c:	85 ed                	test   ebp,ebp
   140004e0e:	75 1c                	jne    140004e2c <__pformat_emit_float+0xbb>
   140004e10:	66 f7 43 08 c0 01    	test   WORD PTR [rbx+0x8],0x1c0
   140004e16:	75 14                	jne    140004e2c <__pformat_emit_float+0xbb>
   140004e18:	f6 43 09 06          	test   BYTE PTR [rbx+0x9],0x6
   140004e1c:	74 17                	je     140004e35 <__pformat_emit_float+0xc4>
   140004e1e:	85 ed                	test   ebp,ebp
   140004e20:	74 2f                	je     140004e51 <__pformat_emit_float+0xe0>
   140004e22:	48 89 da             	mov    rdx,rbx
   140004e25:	b9 2d 00 00 00       	mov    ecx,0x2d
   140004e2a:	eb 44                	jmp    140004e70 <__pformat_emit_float+0xff>
   140004e2c:	ff c8                	dec    eax
   140004e2e:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   140004e31:	75 e5                	jne    140004e18 <__pformat_emit_float+0xa7>
   140004e33:	eb e9                	jmp    140004e1e <__pformat_emit_float+0xad>
   140004e35:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004e38:	8d 50 ff             	lea    edx,[rax-0x1]
   140004e3b:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004e3e:	85 c0                	test   eax,eax
   140004e40:	7e dc                	jle    140004e1e <__pformat_emit_float+0xad>
   140004e42:	48 89 da             	mov    rdx,rbx
   140004e45:	b9 20 00 00 00       	mov    ecx,0x20
   140004e4a:	e8 f6 fb ff ff       	call   140004a45 <__pformat_putc>
   140004e4f:	eb e4                	jmp    140004e35 <__pformat_emit_float+0xc4>
   140004e51:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   140004e54:	0f ba e0 08          	bt     eax,0x8
   140004e58:	73 0a                	jae    140004e64 <__pformat_emit_float+0xf3>
   140004e5a:	48 89 da             	mov    rdx,rbx
   140004e5d:	b9 2b 00 00 00       	mov    ecx,0x2b
   140004e62:	eb 0c                	jmp    140004e70 <__pformat_emit_float+0xff>
   140004e64:	a8 40                	test   al,0x40
   140004e66:	74 0d                	je     140004e75 <__pformat_emit_float+0x104>
   140004e68:	48 89 da             	mov    rdx,rbx
   140004e6b:	b9 20 00 00 00       	mov    ecx,0x20
   140004e70:	e8 d0 fb ff ff       	call   140004a45 <__pformat_putc>
   140004e75:	83 7b 0c 00          	cmp    DWORD PTR [rbx+0xc],0x0
   140004e79:	7f 0b                	jg     140004e86 <__pformat_emit_float+0x115>
   140004e7b:	bd 03 00 00 00       	mov    ebp,0x3
   140004e80:	85 f6                	test   esi,esi
   140004e82:	7f 3f                	jg     140004ec3 <__pformat_emit_float+0x152>
   140004e84:	eb 73                	jmp    140004ef9 <__pformat_emit_float+0x188>
   140004e86:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   140004e89:	25 00 06 00 00       	and    eax,0x600
   140004e8e:	3d 00 02 00 00       	cmp    eax,0x200
   140004e93:	75 e6                	jne    140004e7b <__pformat_emit_float+0x10a>
   140004e95:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004e98:	8d 50 ff             	lea    edx,[rax-0x1]
   140004e9b:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004e9e:	85 c0                	test   eax,eax
   140004ea0:	7e d9                	jle    140004e7b <__pformat_emit_float+0x10a>
   140004ea2:	48 89 da             	mov    rdx,rbx
   140004ea5:	b9 30 00 00 00       	mov    ecx,0x30
   140004eaa:	e8 96 fb ff ff       	call   140004a45 <__pformat_putc>
   140004eaf:	eb e4                	jmp    140004e95 <__pformat_emit_float+0x124>
   140004eb1:	48 89 da             	mov    rdx,rbx
   140004eb4:	e8 8c fb ff ff       	call   140004a45 <__pformat_putc>
   140004eb9:	ff ce                	dec    esi
   140004ebb:	74 49                	je     140004f06 <__pformat_emit_float+0x195>
   140004ebd:	f6 43 09 10          	test   BYTE PTR [rbx+0x9],0x10
   140004ec1:	75 13                	jne    140004ed6 <__pformat_emit_float+0x165>
   140004ec3:	8a 07                	mov    al,BYTE PTR [rdi]
   140004ec5:	b9 30 00 00 00       	mov    ecx,0x30
   140004eca:	84 c0                	test   al,al
   140004ecc:	74 e3                	je     140004eb1 <__pformat_emit_float+0x140>
   140004ece:	48 ff c7             	inc    rdi
   140004ed1:	0f be c8             	movsx  ecx,al
   140004ed4:	eb db                	jmp    140004eb1 <__pformat_emit_float+0x140>
   140004ed6:	66 83 7b 20 00       	cmp    WORD PTR [rbx+0x20],0x0
   140004edb:	74 e6                	je     140004ec3 <__pformat_emit_float+0x152>
   140004edd:	89 f0                	mov    eax,esi
   140004edf:	99                   	cdq
   140004ee0:	f7 fd                	idiv   ebp
   140004ee2:	85 d2                	test   edx,edx
   140004ee4:	75 dd                	jne    140004ec3 <__pformat_emit_float+0x152>
   140004ee6:	48 8d 4b 20          	lea    rcx,[rbx+0x20]
   140004eea:	49 89 d8             	mov    r8,rbx
   140004eed:	ba 01 00 00 00       	mov    edx,0x1
   140004ef2:	e8 87 fb ff ff       	call   140004a7e <__pformat_wputchars>
   140004ef7:	eb ca                	jmp    140004ec3 <__pformat_emit_float+0x152>
   140004ef9:	48 89 da             	mov    rdx,rbx
   140004efc:	b9 30 00 00 00       	mov    ecx,0x30
   140004f01:	e8 3f fb ff ff       	call   140004a45 <__pformat_putc>
   140004f06:	83 7b 10 00          	cmp    DWORD PTR [rbx+0x10],0x0
   140004f0a:	7f 06                	jg     140004f12 <__pformat_emit_float+0x1a1>
   140004f0c:	f6 43 09 08          	test   BYTE PTR [rbx+0x9],0x8
   140004f10:	74 08                	je     140004f1a <__pformat_emit_float+0x1a9>
   140004f12:	48 89 d9             	mov    rcx,rbx
   140004f15:	e8 88 fd ff ff       	call   140004ca2 <__pformat_emit_radix_point>
   140004f1a:	85 f6                	test   esi,esi
   140004f1c:	74 2f                	je     140004f4d <__pformat_emit_float+0x1dc>
   140004f1e:	01 73 10             	add    DWORD PTR [rbx+0x10],esi
   140004f21:	48 89 da             	mov    rdx,rbx
   140004f24:	b9 30 00 00 00       	mov    ecx,0x30
   140004f29:	e8 17 fb ff ff       	call   140004a45 <__pformat_putc>
   140004f2e:	ff c6                	inc    esi
   140004f30:	75 ef                	jne    140004f21 <__pformat_emit_float+0x1b0>
   140004f32:	eb 19                	jmp    140004f4d <__pformat_emit_float+0x1dc>
   140004f34:	8a 07                	mov    al,BYTE PTR [rdi]
   140004f36:	b9 30 00 00 00       	mov    ecx,0x30
   140004f3b:	84 c0                	test   al,al
   140004f3d:	74 06                	je     140004f45 <__pformat_emit_float+0x1d4>
   140004f3f:	48 ff c7             	inc    rdi
   140004f42:	0f be c8             	movsx  ecx,al
   140004f45:	48 89 da             	mov    rdx,rbx
   140004f48:	e8 f8 fa ff ff       	call   140004a45 <__pformat_putc>
   140004f4d:	8b 43 10             	mov    eax,DWORD PTR [rbx+0x10]
   140004f50:	8d 50 ff             	lea    edx,[rax-0x1]
   140004f53:	89 53 10             	mov    DWORD PTR [rbx+0x10],edx
   140004f56:	85 c0                	test   eax,eax
   140004f58:	7f da                	jg     140004f34 <__pformat_emit_float+0x1c3>
   140004f5a:	48 83 c4 28          	add    rsp,0x28
   140004f5e:	5b                   	pop    rbx
   140004f5f:	5e                   	pop    rsi
   140004f60:	5f                   	pop    rdi
   140004f61:	5d                   	pop    rbp
   140004f62:	c3                   	ret

0000000140004f63 <__pformat_float>:
   140004f63:	56                   	push   rsi
   140004f64:	53                   	push   rbx
   140004f65:	48 83 ec 58          	sub    rsp,0x58
   140004f69:	44 8b 42 10          	mov    r8d,DWORD PTR [rdx+0x10]
   140004f6d:	db 29                	fld    TBYTE PTR [rcx]
   140004f6f:	48 89 d3             	mov    rbx,rdx
   140004f72:	45 85 c0             	test   r8d,r8d
   140004f75:	79 0d                	jns    140004f84 <__pformat_float+0x21>
   140004f77:	c7 42 10 06 00 00 00 	mov    DWORD PTR [rdx+0x10],0x6
   140004f7e:	41 b8 06 00 00 00    	mov    r8d,0x6
   140004f84:	48 8d 44 24 48       	lea    rax,[rsp+0x48]
   140004f89:	b9 03 00 00 00       	mov    ecx,0x3
   140004f8e:	48 8d 54 24 30       	lea    rdx,[rsp+0x30]
   140004f93:	db 7c 24 30          	fstp   TBYTE PTR [rsp+0x30]
   140004f97:	4c 8d 4c 24 4c       	lea    r9,[rsp+0x4c]
   140004f9c:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140004fa1:	e8 ba f9 ff ff       	call   140004960 <__pformat_cvt>
   140004fa6:	44 8b 44 24 4c       	mov    r8d,DWORD PTR [rsp+0x4c]
   140004fab:	8b 4c 24 48          	mov    ecx,DWORD PTR [rsp+0x48]
   140004faf:	48 89 c6             	mov    rsi,rax
   140004fb2:	41 81 f8 00 80 ff ff 	cmp    r8d,0xffff8000
   140004fb9:	75 0d                	jne    140004fc8 <__pformat_float+0x65>
   140004fbb:	49 89 d8             	mov    r8,rbx
   140004fbe:	48 89 c2             	mov    rdx,rax
   140004fc1:	e8 6e fc ff ff       	call   140004c34 <__pformat_emit_inf_or_nan>
   140004fc6:	eb 27                	jmp    140004fef <__pformat_float+0x8c>
   140004fc8:	49 89 d9             	mov    r9,rbx
   140004fcb:	48 89 c2             	mov    rdx,rax
   140004fce:	e8 9e fd ff ff       	call   140004d71 <__pformat_emit_float>
   140004fd3:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140004fd6:	8d 50 ff             	lea    edx,[rax-0x1]
   140004fd9:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140004fdc:	85 c0                	test   eax,eax
   140004fde:	7e 0f                	jle    140004fef <__pformat_float+0x8c>
   140004fe0:	48 89 da             	mov    rdx,rbx
   140004fe3:	b9 20 00 00 00       	mov    ecx,0x20
   140004fe8:	e8 58 fa ff ff       	call   140004a45 <__pformat_putc>
   140004fed:	eb e4                	jmp    140004fd3 <__pformat_float+0x70>
   140004fef:	48 89 f1             	mov    rcx,rsi
   140004ff2:	e8 14 11 00 00       	call   14000610b <__freedtoa>
   140004ff7:	90                   	nop
   140004ff8:	48 83 c4 58          	add    rsp,0x58
   140004ffc:	5b                   	pop    rbx
   140004ffd:	5e                   	pop    rsi
   140004ffe:	c3                   	ret

0000000140004fff <__pformat_xint.isra.0>:
   140004fff:	55                   	push   rbp
   140005000:	41 56                	push   r14
   140005002:	41 55                	push   r13
   140005004:	41 54                	push   r12
   140005006:	57                   	push   rdi
   140005007:	56                   	push   rsi
   140005008:	53                   	push   rbx
   140005009:	48 83 ec 20          	sub    rsp,0x20
   14000500d:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
   140005012:	bb 03 00 00 00       	mov    ebx,0x3
   140005017:	83 f9 6f             	cmp    ecx,0x6f
   14000501a:	41 89 c9             	mov    r9d,ecx
   14000501d:	b9 04 00 00 00       	mov    ecx,0x4
   140005022:	4c 89 c7             	mov    rdi,r8
   140005025:	0f 44 cb             	cmove  ecx,ebx
   140005028:	49 89 d2             	mov    r10,rdx
   14000502b:	31 d2                	xor    edx,edx
   14000502d:	44 8b 5f 10          	mov    r11d,DWORD PTR [rdi+0x10]
   140005031:	44 8b 67 08          	mov    r12d,DWORD PTR [rdi+0x8]
   140005035:	4c 63 c1             	movsxd r8,ecx
   140005038:	49 8d 40 3f          	lea    rax,[r8+0x3f]
   14000503c:	49 f7 f0             	div    r8
   14000503f:	31 d2                	xor    edx,edx
   140005041:	45 85 db             	test   r11d,r11d
   140005044:	41 0f 49 d3          	cmovns edx,r11d
   140005048:	41 0f ba e4 0c       	bt     r12d,0xc
   14000504d:	44 8d 44 02 02       	lea    r8d,[rdx+rax*1+0x2]
   140005052:	73 10                	jae    140005064 <__pformat_xint.isra.0+0x65>
   140005054:	66 83 7f 20 00       	cmp    WORD PTR [rdi+0x20],0x0
   140005059:	74 09                	je     140005064 <__pformat_xint.isra.0+0x65>
   14000505b:	44 89 c0             	mov    eax,r8d
   14000505e:	99                   	cdq
   14000505f:	f7 fb                	idiv   ebx
   140005061:	41 01 c0             	add    r8d,eax
   140005064:	48 63 77 0c          	movsxd rsi,DWORD PTR [rdi+0xc]
   140005068:	49 63 c0             	movsxd rax,r8d
   14000506b:	44 39 c6             	cmp    esi,r8d
   14000506e:	48 0f 4d c6          	cmovge rax,rsi
   140005072:	48 83 c0 0f          	add    rax,0xf
   140005076:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   14000507a:	e8 51 cf ff ff       	call   140001fd0 <___chkstk_ms>
   14000507f:	ba 0f 00 00 00       	mov    edx,0xf
   140005084:	48 29 c4             	sub    rsp,rax
   140005087:	45 89 c8             	mov    r8d,r9d
   14000508a:	41 83 f9 6f          	cmp    r9d,0x6f
   14000508e:	b8 07 00 00 00       	mov    eax,0x7
   140005093:	4c 8d 6c 24 20       	lea    r13,[rsp+0x20]
   140005098:	0f 44 d0             	cmove  edx,eax
   14000509b:	41 83 e0 20          	and    r8d,0x20
   14000509f:	4c 89 eb             	mov    rbx,r13
   1400050a2:	4d 85 d2             	test   r10,r10
   1400050a5:	74 22                	je     1400050c9 <__pformat_xint.isra.0+0xca>
   1400050a7:	44 89 d0             	mov    eax,r10d
   1400050aa:	48 ff c3             	inc    rbx
   1400050ad:	21 d0                	and    eax,edx
   1400050af:	44 8d 70 30          	lea    r14d,[rax+0x30]
   1400050b3:	83 c0 37             	add    eax,0x37
   1400050b6:	44 09 c0             	or     eax,r8d
   1400050b9:	41 80 fe 39          	cmp    r14b,0x39
   1400050bd:	41 0f 46 c6          	cmovbe eax,r14d
   1400050c1:	49 d3 ea             	shr    r10,cl
   1400050c4:	88 43 ff             	mov    BYTE PTR [rbx-0x1],al
   1400050c7:	eb d9                	jmp    1400050a2 <__pformat_xint.isra.0+0xa3>
   1400050c9:	49 39 dd             	cmp    r13,rbx
   1400050cc:	75 0b                	jne    1400050d9 <__pformat_xint.isra.0+0xda>
   1400050ce:	41 81 e4 ff f7 ff ff 	and    r12d,0xfffff7ff
   1400050d5:	44 89 67 08          	mov    DWORD PTR [rdi+0x8],r12d
   1400050d9:	45 85 db             	test   r11d,r11d
   1400050dc:	7e 24                	jle    140005102 <__pformat_xint.isra.0+0x103>
   1400050de:	48 89 da             	mov    rdx,rbx
   1400050e1:	44 89 d8             	mov    eax,r11d
   1400050e4:	4c 29 ea             	sub    rdx,r13
   1400050e7:	29 d0                	sub    eax,edx
   1400050e9:	85 c0                	test   eax,eax
   1400050eb:	7e 15                	jle    140005102 <__pformat_xint.isra.0+0x103>
   1400050ed:	89 c2                	mov    edx,eax
   1400050ef:	31 c0                	xor    eax,eax
   1400050f1:	c6 04 03 30          	mov    BYTE PTR [rbx+rax*1],0x30
   1400050f5:	48 ff c0             	inc    rax
   1400050f8:	48 39 d0             	cmp    rax,rdx
   1400050fb:	75 f4                	jne    1400050f1 <__pformat_xint.isra.0+0xf2>
   1400050fd:	48 01 c3             	add    rbx,rax
   140005100:	eb 12                	jmp    140005114 <__pformat_xint.isra.0+0x115>
   140005102:	41 83 f9 6f          	cmp    r9d,0x6f
   140005106:	75 0c                	jne    140005114 <__pformat_xint.isra.0+0x115>
   140005108:	f6 47 09 08          	test   BYTE PTR [rdi+0x9],0x8
   14000510c:	74 06                	je     140005114 <__pformat_xint.isra.0+0x115>
   14000510e:	c6 03 30             	mov    BYTE PTR [rbx],0x30
   140005111:	48 ff c3             	inc    rbx
   140005114:	49 39 dd             	cmp    r13,rbx
   140005117:	75 0b                	jne    140005124 <__pformat_xint.isra.0+0x125>
   140005119:	45 85 db             	test   r11d,r11d
   14000511c:	74 06                	je     140005124 <__pformat_xint.isra.0+0x125>
   14000511e:	c6 03 30             	mov    BYTE PTR [rbx],0x30
   140005121:	48 ff c3             	inc    rbx
   140005124:	48 89 d8             	mov    rax,rbx
   140005127:	4c 29 e8             	sub    rax,r13
   14000512a:	39 f0                	cmp    eax,esi
   14000512c:	7c 09                	jl     140005137 <__pformat_xint.isra.0+0x138>
   14000512e:	c7 47 0c ff ff ff ff 	mov    DWORD PTR [rdi+0xc],0xffffffff
   140005135:	eb 43                	jmp    14000517a <__pformat_xint.isra.0+0x17b>
   140005137:	29 c6                	sub    esi,eax
   140005139:	8b 47 08             	mov    eax,DWORD PTR [rdi+0x8]
   14000513c:	89 77 0c             	mov    DWORD PTR [rdi+0xc],esi
   14000513f:	41 83 f9 6f          	cmp    r9d,0x6f
   140005143:	74 0d                	je     140005152 <__pformat_xint.isra.0+0x153>
   140005145:	0f ba e0 0b          	bt     eax,0xb
   140005149:	73 07                	jae    140005152 <__pformat_xint.isra.0+0x153>
   14000514b:	83 ee 02             	sub    esi,0x2
   14000514e:	85 f6                	test   esi,esi
   140005150:	7e 33                	jle    140005185 <__pformat_xint.isra.0+0x186>
   140005152:	45 85 db             	test   r11d,r11d
   140005155:	0f 89 8a 00 00 00    	jns    1400051e5 <__pformat_xint.isra.0+0x1e6>
   14000515b:	25 00 06 00 00       	and    eax,0x600
   140005160:	3d 00 02 00 00       	cmp    eax,0x200
   140005165:	75 7e                	jne    1400051e5 <__pformat_xint.isra.0+0x1e6>
   140005167:	48 63 f6             	movsxd rsi,esi
   14000516a:	42 c6 04 13 30       	mov    BYTE PTR [rbx+r10*1],0x30
   14000516f:	49 ff c2             	inc    r10
   140005172:	49 39 f2             	cmp    r10,rsi
   140005175:	75 f3                	jne    14000516a <__pformat_xint.isra.0+0x16b>
   140005177:	4c 01 d3             	add    rbx,r10
   14000517a:	be ff ff ff ff       	mov    esi,0xffffffff
   14000517f:	41 83 f9 6f          	cmp    r9d,0x6f
   140005183:	74 35                	je     1400051ba <__pformat_xint.isra.0+0x1bb>
   140005185:	f6 47 09 08          	test   BYTE PTR [rdi+0x9],0x8
   140005189:	74 0b                	je     140005196 <__pformat_xint.isra.0+0x197>
   14000518b:	44 88 0b             	mov    BYTE PTR [rbx],r9b
   14000518e:	48 83 c3 02          	add    rbx,0x2
   140005192:	c6 43 ff 30          	mov    BYTE PTR [rbx-0x1],0x30
   140005196:	85 f6                	test   esi,esi
   140005198:	7e 20                	jle    1400051ba <__pformat_xint.isra.0+0x1bb>
   14000519a:	f6 47 09 04          	test   BYTE PTR [rdi+0x9],0x4
   14000519e:	75 1a                	jne    1400051ba <__pformat_xint.isra.0+0x1bb>
   1400051a0:	85 f6                	test   esi,esi
   1400051a2:	74 11                	je     1400051b5 <__pformat_xint.isra.0+0x1b6>
   1400051a4:	48 89 fa             	mov    rdx,rdi
   1400051a7:	b9 20 00 00 00       	mov    ecx,0x20
   1400051ac:	ff ce                	dec    esi
   1400051ae:	e8 92 f8 ff ff       	call   140004a45 <__pformat_putc>
   1400051b3:	eb eb                	jmp    1400051a0 <__pformat_xint.isra.0+0x1a1>
   1400051b5:	be ff ff ff ff       	mov    esi,0xffffffff
   1400051ba:	49 39 dd             	cmp    r13,rbx
   1400051bd:	73 11                	jae    1400051d0 <__pformat_xint.isra.0+0x1d1>
   1400051bf:	0f be 4b ff          	movsx  ecx,BYTE PTR [rbx-0x1]
   1400051c3:	48 89 fa             	mov    rdx,rdi
   1400051c6:	48 ff cb             	dec    rbx
   1400051c9:	e8 77 f8 ff ff       	call   140004a45 <__pformat_putc>
   1400051ce:	eb ea                	jmp    1400051ba <__pformat_xint.isra.0+0x1bb>
   1400051d0:	85 f6                	test   esi,esi
   1400051d2:	7e 19                	jle    1400051ed <__pformat_xint.isra.0+0x1ee>
   1400051d4:	48 89 fa             	mov    rdx,rdi
   1400051d7:	b9 20 00 00 00       	mov    ecx,0x20
   1400051dc:	ff ce                	dec    esi
   1400051de:	e8 62 f8 ff ff       	call   140004a45 <__pformat_putc>
   1400051e3:	eb eb                	jmp    1400051d0 <__pformat_xint.isra.0+0x1d1>
   1400051e5:	41 83 f9 6f          	cmp    r9d,0x6f
   1400051e9:	75 9a                	jne    140005185 <__pformat_xint.isra.0+0x186>
   1400051eb:	eb ad                	jmp    14000519a <__pformat_xint.isra.0+0x19b>
   1400051ed:	48 89 ec             	mov    rsp,rbp
   1400051f0:	5b                   	pop    rbx
   1400051f1:	5e                   	pop    rsi
   1400051f2:	5f                   	pop    rdi
   1400051f3:	41 5c                	pop    r12
   1400051f5:	41 5d                	pop    r13
   1400051f7:	41 5e                	pop    r14
   1400051f9:	5d                   	pop    rbp
   1400051fa:	c3                   	ret

00000001400051fb <__pformat_int.isra.0>:
   1400051fb:	55                   	push   rbp
   1400051fc:	57                   	push   rdi
   1400051fd:	56                   	push   rsi
   1400051fe:	53                   	push   rbx
   1400051ff:	48 83 ec 28          	sub    rsp,0x28
   140005203:	48 8d 6c 24 20       	lea    rbp,[rsp+0x20]
   140005208:	44 8b 4a 10          	mov    r9d,DWORD PTR [rdx+0x10]
   14000520c:	44 8b 5a 08          	mov    r11d,DWORD PTR [rdx+0x8]
   140005210:	49 89 c8             	mov    r8,rcx
   140005213:	31 c9                	xor    ecx,ecx
   140005215:	45 85 c9             	test   r9d,r9d
   140005218:	48 89 d6             	mov    rsi,rdx
   14000521b:	41 0f 49 c9          	cmovns ecx,r9d
   14000521f:	83 c1 17             	add    ecx,0x17
   140005222:	41 0f ba e3 0c       	bt     r11d,0xc
   140005227:	73 15                	jae    14000523e <__pformat_int.isra.0+0x43>
   140005229:	66 83 7a 20 00       	cmp    WORD PTR [rdx+0x20],0x0
   14000522e:	74 0e                	je     14000523e <__pformat_int.isra.0+0x43>
   140005230:	89 c8                	mov    eax,ecx
   140005232:	41 ba 03 00 00 00    	mov    r10d,0x3
   140005238:	99                   	cdq
   140005239:	41 f7 fa             	idiv   r10d
   14000523c:	01 c1                	add    ecx,eax
   14000523e:	44 8b 56 0c          	mov    r10d,DWORD PTR [rsi+0xc]
   140005242:	41 39 ca             	cmp    r10d,ecx
   140005245:	41 0f 4d ca          	cmovge ecx,r10d
   140005249:	48 63 c9             	movsxd rcx,ecx
   14000524c:	48 8d 41 0f          	lea    rax,[rcx+0xf]
   140005250:	48 83 e0 f0          	and    rax,0xfffffffffffffff0
   140005254:	e8 77 cd ff ff       	call   140001fd0 <___chkstk_ms>
   140005259:	48 29 c4             	sub    rsp,rax
   14000525c:	48 8d 7c 24 20       	lea    rdi,[rsp+0x20]
   140005261:	41 f6 c3 80          	test   r11b,0x80
   140005265:	74 08                	je     14000526f <__pformat_int.isra.0+0x74>
   140005267:	4d 85 c0             	test   r8,r8
   14000526a:	79 13                	jns    14000527f <__pformat_int.isra.0+0x84>
   14000526c:	49 f7 d8             	neg    r8
   14000526f:	48 89 fb             	mov    rbx,rdi
   140005272:	b9 04 00 00 00       	mov    ecx,0x4
   140005277:	41 bb 0a 00 00 00    	mov    r11d,0xa
   14000527d:	eb 23                	jmp    1400052a2 <__pformat_int.isra.0+0xa7>
   14000527f:	41 80 e3 7f          	and    r11b,0x7f
   140005283:	44 89 5e 08          	mov    DWORD PTR [rsi+0x8],r11d
   140005287:	eb e6                	jmp    14000526f <__pformat_int.isra.0+0x74>
   140005289:	48 39 df             	cmp    rdi,rbx
   14000528c:	75 1e                	jne    1400052ac <__pformat_int.isra.0+0xb1>
   14000528e:	4c 89 c0             	mov    rax,r8
   140005291:	31 d2                	xor    edx,edx
   140005293:	48 ff c3             	inc    rbx
   140005296:	49 f7 f3             	div    r11
   140005299:	83 c2 30             	add    edx,0x30
   14000529c:	49 89 c0             	mov    r8,rax
   14000529f:	88 53 ff             	mov    BYTE PTR [rbx-0x1],dl
   1400052a2:	4c 89 c2             	mov    rdx,r8
   1400052a5:	4d 85 c0             	test   r8,r8
   1400052a8:	75 df                	jne    140005289 <__pformat_int.isra.0+0x8e>
   1400052aa:	eb 26                	jmp    1400052d2 <__pformat_int.isra.0+0xd7>
   1400052ac:	f6 46 09 10          	test   BYTE PTR [rsi+0x9],0x10
   1400052b0:	74 dc                	je     14000528e <__pformat_int.isra.0+0x93>
   1400052b2:	66 83 7e 20 00       	cmp    WORD PTR [rsi+0x20],0x0
   1400052b7:	74 d5                	je     14000528e <__pformat_int.isra.0+0x93>
   1400052b9:	48 89 d8             	mov    rax,rbx
   1400052bc:	48 29 f8             	sub    rax,rdi
   1400052bf:	48 99                	cqo
   1400052c1:	48 f7 f9             	idiv   rcx
   1400052c4:	48 83 fa 03          	cmp    rdx,0x3
   1400052c8:	75 c4                	jne    14000528e <__pformat_int.isra.0+0x93>
   1400052ca:	c6 03 2c             	mov    BYTE PTR [rbx],0x2c
   1400052cd:	48 ff c3             	inc    rbx
   1400052d0:	eb bc                	jmp    14000528e <__pformat_int.isra.0+0x93>
   1400052d2:	45 85 c9             	test   r9d,r9d
   1400052d5:	7e 20                	jle    1400052f7 <__pformat_int.isra.0+0xfc>
   1400052d7:	48 89 d9             	mov    rcx,rbx
   1400052da:	44 89 c8             	mov    eax,r9d
   1400052dd:	48 29 f9             	sub    rcx,rdi
   1400052e0:	29 c8                	sub    eax,ecx
   1400052e2:	85 c0                	test   eax,eax
   1400052e4:	7e 11                	jle    1400052f7 <__pformat_int.isra.0+0xfc>
   1400052e6:	31 c9                	xor    ecx,ecx
   1400052e8:	c6 04 0b 30          	mov    BYTE PTR [rbx+rcx*1],0x30
   1400052ec:	48 ff c1             	inc    rcx
   1400052ef:	48 39 c8             	cmp    rax,rcx
   1400052f2:	75 f4                	jne    1400052e8 <__pformat_int.isra.0+0xed>
   1400052f4:	48 01 c3             	add    rbx,rax
   1400052f7:	48 39 df             	cmp    rdi,rbx
   1400052fa:	75 0b                	jne    140005307 <__pformat_int.isra.0+0x10c>
   1400052fc:	45 85 c9             	test   r9d,r9d
   1400052ff:	74 06                	je     140005307 <__pformat_int.isra.0+0x10c>
   140005301:	c6 03 30             	mov    BYTE PTR [rbx],0x30
   140005304:	48 ff c3             	inc    rbx
   140005307:	45 85 d2             	test   r10d,r10d
   14000530a:	0f 8e 84 00 00 00    	jle    140005394 <__pformat_int.isra.0+0x199>
   140005310:	48 89 d9             	mov    rcx,rbx
   140005313:	8b 46 08             	mov    eax,DWORD PTR [rsi+0x8]
   140005316:	48 29 f9             	sub    rcx,rdi
   140005319:	41 29 ca             	sub    r10d,ecx
   14000531c:	44 89 56 0c          	mov    DWORD PTR [rsi+0xc],r10d
   140005320:	45 85 d2             	test   r10d,r10d
   140005323:	7e 6f                	jle    140005394 <__pformat_int.isra.0+0x199>
   140005325:	a9 c0 01 00 00       	test   eax,0x1c0
   14000532a:	74 07                	je     140005333 <__pformat_int.isra.0+0x138>
   14000532c:	41 ff ca             	dec    r10d
   14000532f:	44 89 56 0c          	mov    DWORD PTR [rsi+0xc],r10d
   140005333:	45 85 c9             	test   r9d,r9d
   140005336:	79 3a                	jns    140005372 <__pformat_int.isra.0+0x177>
   140005338:	89 c1                	mov    ecx,eax
   14000533a:	81 e1 00 06 00 00    	and    ecx,0x600
   140005340:	81 f9 00 02 00 00    	cmp    ecx,0x200
   140005346:	75 2a                	jne    140005372 <__pformat_int.isra.0+0x177>
   140005348:	8b 46 0c             	mov    eax,DWORD PTR [rsi+0xc]
   14000534b:	89 c1                	mov    ecx,eax
   14000534d:	29 d1                	sub    ecx,edx
   14000534f:	85 c9                	test   ecx,ecx
   140005351:	7e 09                	jle    14000535c <__pformat_int.isra.0+0x161>
   140005353:	c6 04 13 30          	mov    BYTE PTR [rbx+rdx*1],0x30
   140005357:	48 ff c2             	inc    rdx
   14000535a:	eb ef                	jmp    14000534b <__pformat_int.isra.0+0x150>
   14000535c:	31 d2                	xor    edx,edx
   14000535e:	85 c0                	test   eax,eax
   140005360:	0f 49 d0             	cmovns edx,eax
   140005363:	ff c8                	dec    eax
   140005365:	48 63 ca             	movsxd rcx,edx
   140005368:	29 d0                	sub    eax,edx
   14000536a:	89 46 0c             	mov    DWORD PTR [rsi+0xc],eax
   14000536d:	48 01 cb             	add    rbx,rcx
   140005370:	eb 22                	jmp    140005394 <__pformat_int.isra.0+0x199>
   140005372:	0f ba e0 0a          	bt     eax,0xa
   140005376:	72 1c                	jb     140005394 <__pformat_int.isra.0+0x199>
   140005378:	8b 46 0c             	mov    eax,DWORD PTR [rsi+0xc]
   14000537b:	8d 50 ff             	lea    edx,[rax-0x1]
   14000537e:	89 56 0c             	mov    DWORD PTR [rsi+0xc],edx
   140005381:	85 c0                	test   eax,eax
   140005383:	7e 0f                	jle    140005394 <__pformat_int.isra.0+0x199>
   140005385:	48 89 f2             	mov    rdx,rsi
   140005388:	b9 20 00 00 00       	mov    ecx,0x20
   14000538d:	e8 b3 f6 ff ff       	call   140004a45 <__pformat_putc>
   140005392:	eb e4                	jmp    140005378 <__pformat_int.isra.0+0x17d>
   140005394:	8b 46 08             	mov    eax,DWORD PTR [rsi+0x8]
   140005397:	a8 80                	test   al,0x80
   140005399:	74 05                	je     1400053a0 <__pformat_int.isra.0+0x1a5>
   14000539b:	c6 03 2d             	mov    BYTE PTR [rbx],0x2d
   14000539e:	eb 12                	jmp    1400053b2 <__pformat_int.isra.0+0x1b7>
   1400053a0:	0f ba e0 08          	bt     eax,0x8
   1400053a4:	73 05                	jae    1400053ab <__pformat_int.isra.0+0x1b0>
   1400053a6:	c6 03 2b             	mov    BYTE PTR [rbx],0x2b
   1400053a9:	eb 07                	jmp    1400053b2 <__pformat_int.isra.0+0x1b7>
   1400053ab:	a8 40                	test   al,0x40
   1400053ad:	74 06                	je     1400053b5 <__pformat_int.isra.0+0x1ba>
   1400053af:	c6 03 20             	mov    BYTE PTR [rbx],0x20
   1400053b2:	48 ff c3             	inc    rbx
   1400053b5:	48 39 df             	cmp    rdi,rbx
   1400053b8:	73 11                	jae    1400053cb <__pformat_int.isra.0+0x1d0>
   1400053ba:	0f be 4b ff          	movsx  ecx,BYTE PTR [rbx-0x1]
   1400053be:	48 89 f2             	mov    rdx,rsi
   1400053c1:	48 ff cb             	dec    rbx
   1400053c4:	e8 7c f6 ff ff       	call   140004a45 <__pformat_putc>
   1400053c9:	eb ea                	jmp    1400053b5 <__pformat_int.isra.0+0x1ba>
   1400053cb:	8b 46 0c             	mov    eax,DWORD PTR [rsi+0xc]
   1400053ce:	8d 50 ff             	lea    edx,[rax-0x1]
   1400053d1:	89 56 0c             	mov    DWORD PTR [rsi+0xc],edx
   1400053d4:	85 c0                	test   eax,eax
   1400053d6:	7e 0f                	jle    1400053e7 <__pformat_int.isra.0+0x1ec>
   1400053d8:	48 89 f2             	mov    rdx,rsi
   1400053db:	b9 20 00 00 00       	mov    ecx,0x20
   1400053e0:	e8 60 f6 ff ff       	call   140004a45 <__pformat_putc>
   1400053e5:	eb e4                	jmp    1400053cb <__pformat_int.isra.0+0x1d0>
   1400053e7:	48 8d 65 08          	lea    rsp,[rbp+0x8]
   1400053eb:	5b                   	pop    rbx
   1400053ec:	5e                   	pop    rsi
   1400053ed:	5f                   	pop    rdi
   1400053ee:	5d                   	pop    rbp
   1400053ef:	c3                   	ret

00000001400053f0 <__pformat_emit_xfloat.isra.0>:
   1400053f0:	41 55                	push   r13
   1400053f2:	41 54                	push   r12
   1400053f4:	55                   	push   rbp
   1400053f5:	57                   	push   rdi
   1400053f6:	56                   	push   rsi
   1400053f7:	53                   	push   rbx
   1400053f8:	48 83 ec 48          	sub    rsp,0x48
   1400053fc:	48 89 c8             	mov    rax,rcx
   1400053ff:	4c 89 c3             	mov    rbx,r8
   140005402:	48 85 c9             	test   rcx,rcx
   140005405:	75 07                	jne    14000540e <__pformat_emit_xfloat.isra.0+0x1e>
   140005407:	31 ff                	xor    edi,edi
   140005409:	66 85 d2             	test   dx,dx
   14000540c:	74 03                	je     140005411 <__pformat_emit_xfloat.isra.0+0x21>
   14000540e:	8d 7a fd             	lea    edi,[rdx-0x3]
   140005411:	44 8b 43 10          	mov    r8d,DWORD PTR [rbx+0x10]
   140005415:	41 83 f8 0e          	cmp    r8d,0xe
   140005419:	77 35                	ja     140005450 <__pformat_emit_xfloat.isra.0+0x60>
   14000541b:	b9 0e 00 00 00       	mov    ecx,0xe
   140005420:	ba 04 00 00 00       	mov    edx,0x4
   140005425:	48 d1 e8             	shr    rax,1
   140005428:	44 29 c1             	sub    ecx,r8d
   14000542b:	c1 e1 02             	shl    ecx,0x2
   14000542e:	48 d3 e2             	shl    rdx,cl
   140005431:	48 01 d0             	add    rax,rdx
   140005434:	78 05                	js     14000543b <__pformat_emit_xfloat.isra.0+0x4b>
   140005436:	48 01 c0             	add    rax,rax
   140005439:	eb 07                	jmp    140005442 <__pformat_emit_xfloat.isra.0+0x52>
   14000543b:	83 c7 04             	add    edi,0x4
   14000543e:	48 c1 e8 03          	shr    rax,0x3
   140005442:	b9 0f 00 00 00       	mov    ecx,0xf
   140005447:	44 29 c1             	sub    ecx,r8d
   14000544a:	c1 e1 02             	shl    ecx,0x2
   14000544d:	48 d3 e8             	shr    rax,cl
   140005450:	48 85 c0             	test   rax,rax
   140005453:	75 09                	jne    14000545e <__pformat_emit_xfloat.isra.0+0x6e>
   140005455:	45 85 c0             	test   r8d,r8d
   140005458:	0f 8e 90 00 00 00    	jle    1400054ee <__pformat_emit_xfloat.isra.0+0xfe>
   14000545e:	41 8d 48 01          	lea    ecx,[r8+0x1]
   140005462:	41 83 f8 0f          	cmp    r8d,0xf
   140005466:	ba 10 00 00 00       	mov    edx,0x10
   14000546b:	48 8d 74 24 28       	lea    rsi,[rsp+0x28]
   140005470:	0f 43 ca             	cmovae ecx,edx
   140005473:	49 89 f1             	mov    r9,rsi
   140005476:	89 c2                	mov    edx,eax
   140005478:	83 e2 0f             	and    edx,0xf
   14000547b:	83 f9 01             	cmp    ecx,0x1
   14000547e:	75 19                	jne    140005499 <__pformat_emit_xfloat.isra.0+0xa9>
   140005480:	49 39 f1             	cmp    r9,rsi
   140005483:	72 0c                	jb     140005491 <__pformat_emit_xfloat.isra.0+0xa1>
   140005485:	f6 43 09 08          	test   BYTE PTR [rbx+0x9],0x8
   140005489:	75 06                	jne    140005491 <__pformat_emit_xfloat.isra.0+0xa1>
   14000548b:	83 7b 10 00          	cmp    DWORD PTR [rbx+0x10],0x0
   14000548f:	7e 29                	jle    1400054ba <__pformat_emit_xfloat.isra.0+0xca>
   140005491:	c6 06 2e             	mov    BYTE PTR [rsi],0x2e
   140005494:	48 ff c6             	inc    rsi
   140005497:	eb 10                	jmp    1400054a9 <__pformat_emit_xfloat.isra.0+0xb9>
   140005499:	44 8b 43 10          	mov    r8d,DWORD PTR [rbx+0x10]
   14000549d:	45 85 c0             	test   r8d,r8d
   1400054a0:	7e 07                	jle    1400054a9 <__pformat_emit_xfloat.isra.0+0xb9>
   1400054a2:	41 ff c8             	dec    r8d
   1400054a5:	44 89 43 10          	mov    DWORD PTR [rbx+0x10],r8d
   1400054a9:	85 d2                	test   edx,edx
   1400054ab:	75 11                	jne    1400054be <__pformat_emit_xfloat.isra.0+0xce>
   1400054ad:	49 39 f1             	cmp    r9,rsi
   1400054b0:	72 21                	jb     1400054d3 <__pformat_emit_xfloat.isra.0+0xe3>
   1400054b2:	83 7b 10 00          	cmp    DWORD PTR [rbx+0x10],0x0
   1400054b6:	79 1b                	jns    1400054d3 <__pformat_emit_xfloat.isra.0+0xe3>
   1400054b8:	eb 21                	jmp    1400054db <__pformat_emit_xfloat.isra.0+0xeb>
   1400054ba:	85 d2                	test   edx,edx
   1400054bc:	74 f4                	je     1400054b2 <__pformat_emit_xfloat.isra.0+0xc2>
   1400054be:	83 fa 09             	cmp    edx,0x9
   1400054c1:	76 10                	jbe    1400054d3 <__pformat_emit_xfloat.isra.0+0xe3>
   1400054c3:	44 8a 43 08          	mov    r8b,BYTE PTR [rbx+0x8]
   1400054c7:	83 c2 37             	add    edx,0x37
   1400054ca:	41 83 e0 20          	and    r8d,0x20
   1400054ce:	44 09 c2             	or     edx,r8d
   1400054d1:	eb 03                	jmp    1400054d6 <__pformat_emit_xfloat.isra.0+0xe6>
   1400054d3:	83 c2 30             	add    edx,0x30
   1400054d6:	88 16                	mov    BYTE PTR [rsi],dl
   1400054d8:	48 ff c6             	inc    rsi
   1400054db:	48 c1 e8 04          	shr    rax,0x4
   1400054df:	ff c9                	dec    ecx
   1400054e1:	75 93                	jne    140005476 <__pformat_emit_xfloat.isra.0+0x86>
   1400054e3:	4c 39 ce             	cmp    rsi,r9
   1400054e6:	75 22                	jne    14000550a <__pformat_emit_xfloat.isra.0+0x11a>
   1400054e8:	83 7b 10 00          	cmp    DWORD PTR [rbx+0x10],0x0
   1400054ec:	7f 0b                	jg     1400054f9 <__pformat_emit_xfloat.isra.0+0x109>
   1400054ee:	48 8d 44 24 28       	lea    rax,[rsp+0x28]
   1400054f3:	f6 43 09 08          	test   BYTE PTR [rbx+0x9],0x8
   1400054f7:	74 0a                	je     140005503 <__pformat_emit_xfloat.isra.0+0x113>
   1400054f9:	c6 44 24 28 2e       	mov    BYTE PTR [rsp+0x28],0x2e
   1400054fe:	48 8d 44 24 29       	lea    rax,[rsp+0x29]
   140005503:	c6 00 30             	mov    BYTE PTR [rax],0x30
   140005506:	48 8d 70 01          	lea    rsi,[rax+0x1]
   14000550a:	8b 4b 0c             	mov    ecx,DWORD PTR [rbx+0xc]
   14000550d:	bd 02 00 00 00       	mov    ebp,0x2
   140005512:	85 c9                	test   ecx,ecx
   140005514:	0f 8e 8e 00 00 00    	jle    1400055a8 <__pformat_emit_xfloat.isra.0+0x1b8>
   14000551a:	48 8d 44 24 28       	lea    rax,[rsp+0x28]
   14000551f:	49 89 f0             	mov    r8,rsi
   140005522:	44 8b 4b 10          	mov    r9d,DWORD PTR [rbx+0x10]
   140005526:	49 29 c0             	sub    r8,rax
   140005529:	0f bf c7             	movsx  eax,di
   14000552c:	44 89 c2             	mov    edx,r8d
   14000552f:	45 85 c9             	test   r9d,r9d
   140005532:	7e 04                	jle    140005538 <__pformat_emit_xfloat.isra.0+0x148>
   140005534:	43 8d 14 01          	lea    edx,[r9+r8*1]
   140005538:	44 8b 4b 08          	mov    r9d,DWORD PTR [rbx+0x8]
   14000553c:	41 bb 0a 00 00 00    	mov    r11d,0xa
   140005542:	45 89 c8             	mov    r8d,r9d
   140005545:	41 81 e0 c0 01 00 00 	and    r8d,0x1c0
   14000554c:	41 83 f8 01          	cmp    r8d,0x1
   140005550:	45 19 c0             	sbb    r8d,r8d
   140005553:	46 8d 54 02 06       	lea    r10d,[rdx+r8*1+0x6]
   140005558:	45 89 d0             	mov    r8d,r10d
   14000555b:	99                   	cdq
   14000555c:	41 f7 fb             	idiv   r11d
   14000555f:	85 c0                	test   eax,eax
   140005561:	74 05                	je     140005568 <__pformat_emit_xfloat.isra.0+0x178>
   140005563:	41 ff c0             	inc    r8d
   140005566:	eb f3                	jmp    14000555b <__pformat_emit_xfloat.isra.0+0x16b>
   140005568:	44 89 c5             	mov    ebp,r8d
   14000556b:	44 29 d5             	sub    ebp,r10d
   14000556e:	83 c5 02             	add    ebp,0x2
   140005571:	44 39 c1             	cmp    ecx,r8d
   140005574:	7e 2b                	jle    1400055a1 <__pformat_emit_xfloat.isra.0+0x1b1>
   140005576:	44 29 c1             	sub    ecx,r8d
   140005579:	41 81 e1 00 06 00 00 	and    r9d,0x600
   140005580:	89 4b 0c             	mov    DWORD PTR [rbx+0xc],ecx
   140005583:	75 23                	jne    1400055a8 <__pformat_emit_xfloat.isra.0+0x1b8>
   140005585:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140005588:	8d 50 ff             	lea    edx,[rax-0x1]
   14000558b:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   14000558e:	85 c0                	test   eax,eax
   140005590:	7e 16                	jle    1400055a8 <__pformat_emit_xfloat.isra.0+0x1b8>
   140005592:	48 89 da             	mov    rdx,rbx
   140005595:	b9 20 00 00 00       	mov    ecx,0x20
   14000559a:	e8 a6 f4 ff ff       	call   140004a45 <__pformat_putc>
   14000559f:	eb e4                	jmp    140005585 <__pformat_emit_xfloat.isra.0+0x195>
   1400055a1:	c7 43 0c ff ff ff ff 	mov    DWORD PTR [rbx+0xc],0xffffffff
   1400055a8:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   1400055ab:	a8 80                	test   al,0x80
   1400055ad:	74 0a                	je     1400055b9 <__pformat_emit_xfloat.isra.0+0x1c9>
   1400055af:	48 89 da             	mov    rdx,rbx
   1400055b2:	b9 2d 00 00 00       	mov    ecx,0x2d
   1400055b7:	eb 1c                	jmp    1400055d5 <__pformat_emit_xfloat.isra.0+0x1e5>
   1400055b9:	0f ba e0 08          	bt     eax,0x8
   1400055bd:	73 0a                	jae    1400055c9 <__pformat_emit_xfloat.isra.0+0x1d9>
   1400055bf:	48 89 da             	mov    rdx,rbx
   1400055c2:	b9 2b 00 00 00       	mov    ecx,0x2b
   1400055c7:	eb 0c                	jmp    1400055d5 <__pformat_emit_xfloat.isra.0+0x1e5>
   1400055c9:	a8 40                	test   al,0x40
   1400055cb:	74 0d                	je     1400055da <__pformat_emit_xfloat.isra.0+0x1ea>
   1400055cd:	48 89 da             	mov    rdx,rbx
   1400055d0:	b9 20 00 00 00       	mov    ecx,0x20
   1400055d5:	e8 6b f4 ff ff       	call   140004a45 <__pformat_putc>
   1400055da:	48 89 da             	mov    rdx,rbx
   1400055dd:	b9 30 00 00 00       	mov    ecx,0x30
   1400055e2:	e8 5e f4 ff ff       	call   140004a45 <__pformat_putc>
   1400055e7:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   1400055ea:	48 89 da             	mov    rdx,rbx
   1400055ed:	83 e1 20             	and    ecx,0x20
   1400055f0:	83 c9 58             	or     ecx,0x58
   1400055f3:	e8 4d f4 ff ff       	call   140004a45 <__pformat_putc>
   1400055f8:	83 7b 0c 00          	cmp    DWORD PTR [rbx+0xc],0x0
   1400055fc:	7f 07                	jg     140005605 <__pformat_emit_xfloat.isra.0+0x215>
   1400055fe:	4c 8d 64 24 28       	lea    r12,[rsp+0x28]
   140005603:	eb 36                	jmp    14000563b <__pformat_emit_xfloat.isra.0+0x24b>
   140005605:	f6 43 09 02          	test   BYTE PTR [rbx+0x9],0x2
   140005609:	74 f3                	je     1400055fe <__pformat_emit_xfloat.isra.0+0x20e>
   14000560b:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   14000560e:	8d 50 ff             	lea    edx,[rax-0x1]
   140005611:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   140005614:	85 c0                	test   eax,eax
   140005616:	7e e6                	jle    1400055fe <__pformat_emit_xfloat.isra.0+0x20e>
   140005618:	48 89 da             	mov    rdx,rbx
   14000561b:	b9 30 00 00 00       	mov    ecx,0x30
   140005620:	e8 20 f4 ff ff       	call   140004a45 <__pformat_putc>
   140005625:	eb e4                	jmp    14000560b <__pformat_emit_xfloat.isra.0+0x21b>
   140005627:	0f be 4e ff          	movsx  ecx,BYTE PTR [rsi-0x1]
   14000562b:	48 ff ce             	dec    rsi
   14000562e:	83 f9 2e             	cmp    ecx,0x2e
   140005631:	75 0f                	jne    140005642 <__pformat_emit_xfloat.isra.0+0x252>
   140005633:	48 89 d9             	mov    rcx,rbx
   140005636:	e8 67 f6 ff ff       	call   140004ca2 <__pformat_emit_radix_point>
   14000563b:	49 39 f4             	cmp    r12,rsi
   14000563e:	72 e7                	jb     140005627 <__pformat_emit_xfloat.isra.0+0x237>
   140005640:	eb 30                	jmp    140005672 <__pformat_emit_xfloat.isra.0+0x282>
   140005642:	83 f9 2c             	cmp    ecx,0x2c
   140005645:	75 21                	jne    140005668 <__pformat_emit_xfloat.isra.0+0x278>
   140005647:	8b 43 20             	mov    eax,DWORD PTR [rbx+0x20]
   14000564a:	66 89 44 24 26       	mov    WORD PTR [rsp+0x26],ax
   14000564f:	66 85 c0             	test   ax,ax
   140005652:	74 e7                	je     14000563b <__pformat_emit_xfloat.isra.0+0x24b>
   140005654:	49 89 d8             	mov    r8,rbx
   140005657:	ba 01 00 00 00       	mov    edx,0x1
   14000565c:	48 8d 4c 24 26       	lea    rcx,[rsp+0x26]
   140005661:	e8 18 f4 ff ff       	call   140004a7e <__pformat_wputchars>
   140005666:	eb d3                	jmp    14000563b <__pformat_emit_xfloat.isra.0+0x24b>
   140005668:	48 89 da             	mov    rdx,rbx
   14000566b:	e8 d5 f3 ff ff       	call   140004a45 <__pformat_putc>
   140005670:	eb c9                	jmp    14000563b <__pformat_emit_xfloat.isra.0+0x24b>
   140005672:	8b 43 10             	mov    eax,DWORD PTR [rbx+0x10]
   140005675:	8d 50 ff             	lea    edx,[rax-0x1]
   140005678:	89 53 10             	mov    DWORD PTR [rbx+0x10],edx
   14000567b:	85 c0                	test   eax,eax
   14000567d:	7e 0f                	jle    14000568e <__pformat_emit_xfloat.isra.0+0x29e>
   14000567f:	48 89 da             	mov    rdx,rbx
   140005682:	b9 30 00 00 00       	mov    ecx,0x30
   140005687:	e8 b9 f3 ff ff       	call   140004a45 <__pformat_putc>
   14000568c:	eb e4                	jmp    140005672 <__pformat_emit_xfloat.isra.0+0x282>
   14000568e:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   140005691:	48 89 da             	mov    rdx,rbx
   140005694:	0f bf ed             	movsx  ebp,bp
   140005697:	83 e1 20             	and    ecx,0x20
   14000569a:	83 c9 50             	or     ecx,0x50
   14000569d:	e8 a3 f3 ff ff       	call   140004a45 <__pformat_putc>
   1400056a2:	01 6b 0c             	add    DWORD PTR [rbx+0xc],ebp
   1400056a5:	48 0f bf cf          	movsx  rcx,di
   1400056a9:	48 89 da             	mov    rdx,rbx
   1400056ac:	81 4b 08 c0 01 00 00 	or     DWORD PTR [rbx+0x8],0x1c0
   1400056b3:	48 83 c4 48          	add    rsp,0x48
   1400056b7:	5b                   	pop    rbx
   1400056b8:	5e                   	pop    rsi
   1400056b9:	5f                   	pop    rdi
   1400056ba:	5d                   	pop    rbp
   1400056bb:	41 5c                	pop    r12
   1400056bd:	41 5d                	pop    r13
   1400056bf:	e9 37 fb ff ff       	jmp    1400051fb <__pformat_int.isra.0>

00000001400056c4 <__pformat_emit_efloat>:
   1400056c4:	57                   	push   rdi
   1400056c5:	56                   	push   rsi
   1400056c6:	53                   	push   rbx
   1400056c7:	48 83 ec 20          	sub    rsp,0x20
   1400056cb:	41 8d 40 ff          	lea    eax,[r8-0x1]
   1400056cf:	41 89 ca             	mov    r10d,ecx
   1400056d2:	49 89 d3             	mov    r11,rdx
   1400056d5:	4c 89 cb             	mov    rbx,r9
   1400056d8:	48 63 f0             	movsxd rsi,eax
   1400056db:	b9 01 00 00 00       	mov    ecx,0x1
   1400056e0:	41 b8 0a 00 00 00    	mov    r8d,0xa
   1400056e6:	99                   	cdq
   1400056e7:	41 f7 f8             	idiv   r8d
   1400056ea:	85 c0                	test   eax,eax
   1400056ec:	74 04                	je     1400056f2 <__pformat_emit_efloat+0x2e>
   1400056ee:	ff c1                	inc    ecx
   1400056f0:	eb f4                	jmp    1400056e6 <__pformat_emit_efloat+0x22>
   1400056f2:	8b 43 2c             	mov    eax,DWORD PTR [rbx+0x2c]
   1400056f5:	83 f8 ff             	cmp    eax,0xffffffff
   1400056f8:	75 0c                	jne    140005706 <__pformat_emit_efloat+0x42>
   1400056fa:	c7 43 2c 02 00 00 00 	mov    DWORD PTR [rbx+0x2c],0x2
   140005701:	b8 02 00 00 00       	mov    eax,0x2
   140005706:	39 c1                	cmp    ecx,eax
   140005708:	49 89 d9             	mov    r9,rbx
   14000570b:	41 b8 01 00 00 00    	mov    r8d,0x1
   140005711:	0f 4d c1             	cmovge eax,ecx
   140005714:	8b 4b 0c             	mov    ecx,DWORD PTR [rbx+0xc]
   140005717:	8d 50 02             	lea    edx,[rax+0x2]
   14000571a:	89 c7                	mov    edi,eax
   14000571c:	89 c8                	mov    eax,ecx
   14000571e:	29 d0                	sub    eax,edx
   140005720:	39 d1                	cmp    ecx,edx
   140005722:	ba ff ff ff ff       	mov    edx,0xffffffff
   140005727:	44 89 d1             	mov    ecx,r10d
   14000572a:	0f 4e c2             	cmovle eax,edx
   14000572d:	4c 89 da             	mov    rdx,r11
   140005730:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   140005733:	e8 39 f6 ff ff       	call   140004d71 <__pformat_emit_float>
   140005738:	8b 4b 08             	mov    ecx,DWORD PTR [rbx+0x8]
   14000573b:	8b 43 2c             	mov    eax,DWORD PTR [rbx+0x2c]
   14000573e:	48 89 da             	mov    rdx,rbx
   140005741:	89 43 10             	mov    DWORD PTR [rbx+0x10],eax
   140005744:	89 c8                	mov    eax,ecx
   140005746:	83 e1 20             	and    ecx,0x20
   140005749:	0d c0 01 00 00       	or     eax,0x1c0
   14000574e:	83 c9 45             	or     ecx,0x45
   140005751:	89 43 08             	mov    DWORD PTR [rbx+0x8],eax
   140005754:	e8 ec f2 ff ff       	call   140004a45 <__pformat_putc>
   140005759:	8d 47 01             	lea    eax,[rdi+0x1]
   14000575c:	01 43 0c             	add    DWORD PTR [rbx+0xc],eax
   14000575f:	48 89 da             	mov    rdx,rbx
   140005762:	48 89 f1             	mov    rcx,rsi
   140005765:	48 83 c4 20          	add    rsp,0x20
   140005769:	5b                   	pop    rbx
   14000576a:	5e                   	pop    rsi
   14000576b:	5f                   	pop    rdi
   14000576c:	e9 8a fa ff ff       	jmp    1400051fb <__pformat_int.isra.0>

0000000140005771 <__pformat_efloat>:
   140005771:	56                   	push   rsi
   140005772:	53                   	push   rbx
   140005773:	48 83 ec 58          	sub    rsp,0x58
   140005777:	8b 42 10             	mov    eax,DWORD PTR [rdx+0x10]
   14000577a:	db 29                	fld    TBYTE PTR [rcx]
   14000577c:	48 89 d3             	mov    rbx,rdx
   14000577f:	85 c0                	test   eax,eax
   140005781:	79 0c                	jns    14000578f <__pformat_efloat+0x1e>
   140005783:	c7 42 10 06 00 00 00 	mov    DWORD PTR [rdx+0x10],0x6
   14000578a:	b8 06 00 00 00       	mov    eax,0x6
   14000578f:	48 8d 4c 24 48       	lea    rcx,[rsp+0x48]
   140005794:	44 8d 40 01          	lea    r8d,[rax+0x1]
   140005798:	db 7c 24 30          	fstp   TBYTE PTR [rsp+0x30]
   14000579c:	48 8d 54 24 30       	lea    rdx,[rsp+0x30]
   1400057a1:	4c 8d 4c 24 4c       	lea    r9,[rsp+0x4c]
   1400057a6:	48 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],rcx
   1400057ab:	b9 02 00 00 00       	mov    ecx,0x2
   1400057b0:	e8 ab f1 ff ff       	call   140004960 <__pformat_cvt>
   1400057b5:	44 8b 44 24 4c       	mov    r8d,DWORD PTR [rsp+0x4c]
   1400057ba:	8b 4c 24 48          	mov    ecx,DWORD PTR [rsp+0x48]
   1400057be:	48 89 c6             	mov    rsi,rax
   1400057c1:	41 81 f8 00 80 ff ff 	cmp    r8d,0xffff8000
   1400057c8:	75 0d                	jne    1400057d7 <__pformat_efloat+0x66>
   1400057ca:	49 89 d8             	mov    r8,rbx
   1400057cd:	48 89 c2             	mov    rdx,rax
   1400057d0:	e8 5f f4 ff ff       	call   140004c34 <__pformat_emit_inf_or_nan>
   1400057d5:	eb 0b                	jmp    1400057e2 <__pformat_efloat+0x71>
   1400057d7:	49 89 d9             	mov    r9,rbx
   1400057da:	48 89 c2             	mov    rdx,rax
   1400057dd:	e8 e2 fe ff ff       	call   1400056c4 <__pformat_emit_efloat>
   1400057e2:	48 89 f1             	mov    rcx,rsi
   1400057e5:	e8 21 09 00 00       	call   14000610b <__freedtoa>
   1400057ea:	90                   	nop
   1400057eb:	48 83 c4 58          	add    rsp,0x58
   1400057ef:	5b                   	pop    rbx
   1400057f0:	5e                   	pop    rsi
   1400057f1:	c3                   	ret

00000001400057f2 <__pformat_gfloat>:
   1400057f2:	57                   	push   rdi
   1400057f3:	56                   	push   rsi
   1400057f4:	53                   	push   rbx
   1400057f5:	48 83 ec 50          	sub    rsp,0x50
   1400057f9:	db 29                	fld    TBYTE PTR [rcx]
   1400057fb:	48 89 d3             	mov    rbx,rdx
   1400057fe:	83 7a 10 00          	cmp    DWORD PTR [rdx+0x10],0x0
   140005802:	79 09                	jns    14000580d <__pformat_gfloat+0x1b>
   140005804:	c7 42 10 06 00 00 00 	mov    DWORD PTR [rdx+0x10],0x6
   14000580b:	eb 09                	jmp    140005816 <__pformat_gfloat+0x24>
   14000580d:	75 07                	jne    140005816 <__pformat_gfloat+0x24>
   14000580f:	c7 42 10 01 00 00 00 	mov    DWORD PTR [rdx+0x10],0x1
   140005816:	48 8d 44 24 48       	lea    rax,[rsp+0x48]
   14000581b:	48 8d 54 24 30       	lea    rdx,[rsp+0x30]
   140005820:	b9 02 00 00 00       	mov    ecx,0x2
   140005825:	db 7c 24 30          	fstp   TBYTE PTR [rsp+0x30]
   140005829:	4c 8d 4c 24 4c       	lea    r9,[rsp+0x4c]
   14000582e:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005833:	44 8b 43 10          	mov    r8d,DWORD PTR [rbx+0x10]
   140005837:	e8 24 f1 ff ff       	call   140004960 <__pformat_cvt>
   14000583c:	44 8b 44 24 4c       	mov    r8d,DWORD PTR [rsp+0x4c]
   140005841:	8b 7c 24 48          	mov    edi,DWORD PTR [rsp+0x48]
   140005845:	48 89 c6             	mov    rsi,rax
   140005848:	41 81 f8 00 80 ff ff 	cmp    r8d,0xffff8000
   14000584f:	75 12                	jne    140005863 <__pformat_gfloat+0x71>
   140005851:	49 89 d8             	mov    r8,rbx
   140005854:	48 89 c2             	mov    rdx,rax
   140005857:	89 f9                	mov    ecx,edi
   140005859:	e8 d6 f3 ff ff       	call   140004c34 <__pformat_emit_inf_or_nan>
   14000585e:	e9 94 00 00 00       	jmp    1400058f7 <__pformat_gfloat+0x105>
   140005863:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   140005866:	25 00 08 00 00       	and    eax,0x800
   14000586b:	41 83 f8 fd          	cmp    r8d,0xfffffffd
   14000586f:	7c 5e                	jl     1400058cf <__pformat_gfloat+0xdd>
   140005871:	8b 53 10             	mov    edx,DWORD PTR [rbx+0x10]
   140005874:	41 39 d0             	cmp    r8d,edx
   140005877:	7f 56                	jg     1400058cf <__pformat_gfloat+0xdd>
   140005879:	85 c0                	test   eax,eax
   14000587b:	74 08                	je     140005885 <__pformat_gfloat+0x93>
   14000587d:	44 29 c2             	sub    edx,r8d
   140005880:	89 53 10             	mov    DWORD PTR [rbx+0x10],edx
   140005883:	eb 21                	jmp    1400058a6 <__pformat_gfloat+0xb4>
   140005885:	48 89 f1             	mov    rcx,rsi
   140005888:	e8 93 53 00 00       	call   14000ac20 <strlen>
   14000588d:	44 8b 44 24 4c       	mov    r8d,DWORD PTR [rsp+0x4c]
   140005892:	44 29 c0             	sub    eax,r8d
   140005895:	89 43 10             	mov    DWORD PTR [rbx+0x10],eax
   140005898:	79 0c                	jns    1400058a6 <__pformat_gfloat+0xb4>
   14000589a:	8b 53 0c             	mov    edx,DWORD PTR [rbx+0xc]
   14000589d:	85 d2                	test   edx,edx
   14000589f:	7e 05                	jle    1400058a6 <__pformat_gfloat+0xb4>
   1400058a1:	01 d0                	add    eax,edx
   1400058a3:	89 43 0c             	mov    DWORD PTR [rbx+0xc],eax
   1400058a6:	49 89 d9             	mov    r9,rbx
   1400058a9:	48 89 f2             	mov    rdx,rsi
   1400058ac:	89 f9                	mov    ecx,edi
   1400058ae:	e8 be f4 ff ff       	call   140004d71 <__pformat_emit_float>
   1400058b3:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   1400058b6:	8d 50 ff             	lea    edx,[rax-0x1]
   1400058b9:	89 53 0c             	mov    DWORD PTR [rbx+0xc],edx
   1400058bc:	85 c0                	test   eax,eax
   1400058be:	7e 37                	jle    1400058f7 <__pformat_gfloat+0x105>
   1400058c0:	48 89 da             	mov    rdx,rbx
   1400058c3:	b9 20 00 00 00       	mov    ecx,0x20
   1400058c8:	e8 78 f1 ff ff       	call   140004a45 <__pformat_putc>
   1400058cd:	eb e4                	jmp    1400058b3 <__pformat_gfloat+0xc1>
   1400058cf:	85 c0                	test   eax,eax
   1400058d1:	74 05                	je     1400058d8 <__pformat_gfloat+0xe6>
   1400058d3:	8b 43 10             	mov    eax,DWORD PTR [rbx+0x10]
   1400058d6:	eb 08                	jmp    1400058e0 <__pformat_gfloat+0xee>
   1400058d8:	48 89 f1             	mov    rcx,rsi
   1400058db:	e8 40 53 00 00       	call   14000ac20 <strlen>
   1400058e0:	ff c8                	dec    eax
   1400058e2:	44 8b 44 24 4c       	mov    r8d,DWORD PTR [rsp+0x4c]
   1400058e7:	49 89 d9             	mov    r9,rbx
   1400058ea:	48 89 f2             	mov    rdx,rsi
   1400058ed:	89 43 10             	mov    DWORD PTR [rbx+0x10],eax
   1400058f0:	89 f9                	mov    ecx,edi
   1400058f2:	e8 cd fd ff ff       	call   1400056c4 <__pformat_emit_efloat>
   1400058f7:	48 89 f1             	mov    rcx,rsi
   1400058fa:	e8 0c 08 00 00       	call   14000610b <__freedtoa>
   1400058ff:	90                   	nop
   140005900:	48 83 c4 50          	add    rsp,0x50
   140005904:	5b                   	pop    rbx
   140005905:	5e                   	pop    rsi
   140005906:	5f                   	pop    rdi
   140005907:	c3                   	ret

0000000140005908 <__mingw_pformat>:
   140005908:	41 57                	push   r15
   14000590a:	41 56                	push   r14
   14000590c:	41 55                	push   r13
   14000590e:	41 54                	push   r12
   140005910:	55                   	push   rbp
   140005911:	57                   	push   rdi
   140005912:	56                   	push   rsi
   140005913:	53                   	push   rbx
   140005914:	48 81 ec a8 00 00 00 	sub    rsp,0xa8
   14000591b:	4c 8d 2d 6e 6b 00 00 	lea    r13,[rip+0x6b6e]        # 14000c490 <.rdata+0x20>
   140005922:	48 8b 9c 24 10 01 00 	mov    rbx,QWORD PTR [rsp+0x110]
   140005929:	00 
   14000592a:	89 cf                	mov    edi,ecx
   14000592c:	44 89 c6             	mov    esi,r8d
   14000592f:	4c 89 8c 24 08 01 00 	mov    QWORD PTR [rsp+0x108],r9
   140005936:	00 
   140005937:	48 89 d5             	mov    rbp,rdx
   14000593a:	e8 29 52 00 00       	call   14000ab68 <_errno>
   14000593f:	81 e7 00 60 00 00    	and    edi,0x6000
   140005945:	31 c9                	xor    ecx,ecx
   140005947:	45 31 c0             	xor    r8d,r8d
   14000594a:	8b 00                	mov    eax,DWORD PTR [rax]
   14000594c:	48 89 6c 24 70       	mov    QWORD PTR [rsp+0x70],rbp
   140005951:	89 7c 24 78          	mov    DWORD PTR [rsp+0x78],edi
   140005955:	4c 8b 8c 24 08 01 00 	mov    r9,QWORD PTR [rsp+0x108]
   14000595c:	00 
   14000595d:	89 44 24 34          	mov    DWORD PTR [rsp+0x34],eax
   140005961:	48 b8 ff ff ff ff fd 	movabs rax,0xfffffffdffffffff
   140005968:	ff ff ff 
   14000596b:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   140005972:	00 
   140005973:	48 8d 44 24 70       	lea    rax,[rsp+0x70]
   140005978:	c7 44 24 7c ff ff ff 	mov    DWORD PTR [rsp+0x7c],0xffffffff
   14000597f:	ff 
   140005980:	66 c7 84 24 88 00 00 	mov    WORD PTR [rsp+0x88],0x0
   140005987:	00 00 00 
   14000598a:	89 8c 24 8c 00 00 00 	mov    DWORD PTR [rsp+0x8c],ecx
   140005991:	66 c7 84 24 90 00 00 	mov    WORD PTR [rsp+0x90],0x0
   140005998:	00 00 00 
   14000599b:	44 89 84 24 94 00 00 	mov    DWORD PTR [rsp+0x94],r8d
   1400059a2:	00 
   1400059a3:	89 b4 24 98 00 00 00 	mov    DWORD PTR [rsp+0x98],esi
   1400059aa:	c7 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],0xffffffff
   1400059b1:	ff ff ff ff 
   1400059b5:	48 89 44 24 38       	mov    QWORD PTR [rsp+0x38],rax
   1400059ba:	41 0f be 09          	movsx  ecx,BYTE PTR [r9]
   1400059be:	85 c9                	test   ecx,ecx
   1400059c0:	0f 84 ba 06 00 00    	je     140006080 <__mingw_pformat+0x778>
   1400059c6:	4d 8d 61 01          	lea    r12,[r9+0x1]
   1400059ca:	83 f9 25             	cmp    ecx,0x25
   1400059cd:	0f 85 9b 06 00 00    	jne    14000606e <__mingw_pformat+0x766>
   1400059d3:	89 7c 24 78          	mov    DWORD PTR [rsp+0x78],edi
   1400059d7:	4d 89 e1             	mov    r9,r12
   1400059da:	4c 8d 7c 24 7c       	lea    r15,[rsp+0x7c]
   1400059df:	45 31 f6             	xor    r14d,r14d
   1400059e2:	48 c7 44 24 7c ff ff 	mov    QWORD PTR [rsp+0x7c],0xffffffffffffffff
   1400059e9:	ff ff 
   1400059eb:	31 f6                	xor    esi,esi
   1400059ed:	41 8a 11             	mov    dl,BYTE PTR [r9]
   1400059f0:	84 d2                	test   dl,dl
   1400059f2:	74 c6                	je     1400059ba <__mingw_pformat+0xb2>
   1400059f4:	8d 4a e0             	lea    ecx,[rdx-0x20]
   1400059f7:	49 8d 69 01          	lea    rbp,[r9+0x1]
   1400059fb:	0f be c2             	movsx  eax,dl
   1400059fe:	80 f9 5a             	cmp    cl,0x5a
   140005a01:	0f 87 de 05 00 00    	ja     140005fe5 <__mingw_pformat+0x6dd>
   140005a07:	0f b6 c9             	movzx  ecx,cl
   140005a0a:	49 63 4c 8d 00       	movsxd rcx,DWORD PTR [r13+rcx*4+0x0]
   140005a0f:	4c 01 e9             	add    rcx,r13
   140005a12:	ff e1                	jmp    rcx
   140005a14:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005a19:	b9 25 00 00 00       	mov    ecx,0x25
   140005a1e:	e8 22 f0 ff ff       	call   140004a45 <__pformat_putc>
   140005a23:	e9 3e 06 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005a28:	41 be 02 00 00 00    	mov    r14d,0x2
   140005a2e:	45 8d 56 fe          	lea    r10d,[r14-0x2]
   140005a32:	8b 03                	mov    eax,DWORD PTR [rbx]
   140005a34:	48 83 c3 08          	add    rbx,0x8
   140005a38:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
   140005a3d:	41 83 fa 01          	cmp    r10d,0x1
   140005a41:	48 8d 4c 24 60       	lea    rcx,[rsp+0x60]
   140005a46:	c7 84 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],0xffffffff
   140005a4d:	ff ff ff ff 
   140005a51:	77 14                	ja     140005a67 <__mingw_pformat+0x15f>
   140005a53:	ba 01 00 00 00       	mov    edx,0x1
   140005a58:	66 89 44 24 60       	mov    WORD PTR [rsp+0x60],ax
   140005a5d:	e8 1c f0 ff ff       	call   140004a7e <__pformat_wputchars>
   140005a62:	e9 ff 05 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005a67:	ba 01 00 00 00       	mov    edx,0x1
   140005a6c:	88 44 24 60          	mov    BYTE PTR [rsp+0x60],al
   140005a70:	e8 e8 f0 ff ff       	call   140004b5d <__pformat_putchars>
   140005a75:	e9 ec 05 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005a7a:	45 8d 56 fe          	lea    r10d,[r14-0x2]
   140005a7e:	41 83 fa 01          	cmp    r10d,0x1
   140005a82:	77 42                	ja     140005ac6 <__mingw_pformat+0x1be>
   140005a84:	48 8d 73 08          	lea    rsi,[rbx+0x8]
   140005a88:	48 8b 1b             	mov    rbx,QWORD PTR [rbx]
   140005a8b:	48 85 db             	test   rbx,rbx
   140005a8e:	75 07                	jne    140005a97 <__mingw_pformat+0x18f>
   140005a90:	48 8d 1d e1 69 00 00 	lea    rbx,[rip+0x69e1]        # 14000c478 <.rdata+0x8>
   140005a97:	48 63 94 24 80 00 00 	movsxd rdx,DWORD PTR [rsp+0x80]
   140005a9e:	00 
   140005a9f:	48 89 d9             	mov    rcx,rbx
   140005aa2:	85 d2                	test   edx,edx
   140005aa4:	78 07                	js     140005aad <__mingw_pformat+0x1a5>
   140005aa6:	e8 95 4a 00 00       	call   14000a540 <wcsnlen>
   140005aab:	eb 05                	jmp    140005ab2 <__mingw_pformat+0x1aa>
   140005aad:	e8 a6 51 00 00       	call   14000ac58 <wcslen>
   140005ab2:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
   140005ab7:	89 c2                	mov    edx,eax
   140005ab9:	48 89 d9             	mov    rcx,rbx
   140005abc:	e8 bd ef ff ff       	call   140004a7e <__pformat_wputchars>
   140005ac1:	e9 c0 00 00 00       	jmp    140005b86 <__mingw_pformat+0x27e>
   140005ac6:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140005ac9:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005ace:	48 83 c3 08          	add    rbx,0x8
   140005ad2:	eb 11                	jmp    140005ae5 <__mingw_pformat+0x1dd>
   140005ad4:	8b 4c 24 34          	mov    ecx,DWORD PTR [rsp+0x34]
   140005ad8:	e8 3b 51 00 00       	call   14000ac18 <strerror>
   140005add:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005ae2:	48 89 c1             	mov    rcx,rax
   140005ae5:	e8 08 f1 ff ff       	call   140004bf2 <__pformat_puts>
   140005aea:	e9 77 05 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005aef:	81 64 24 78 ff fe ff 	and    DWORD PTR [rsp+0x78],0xfffffeff
   140005af6:	ff 
   140005af7:	48 8d 73 08          	lea    rsi,[rbx+0x8]
   140005afb:	41 83 fe 03          	cmp    r14d,0x3
   140005aff:	75 05                	jne    140005b06 <__mingw_pformat+0x1fe>
   140005b01:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140005b04:	eb 25                	jmp    140005b2b <__mingw_pformat+0x223>
   140005b06:	41 83 fe 02          	cmp    r14d,0x2
   140005b0a:	75 04                	jne    140005b10 <__mingw_pformat+0x208>
   140005b0c:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140005b0e:	eb 1b                	jmp    140005b2b <__mingw_pformat+0x223>
   140005b10:	8b 0b                	mov    ecx,DWORD PTR [rbx]
   140005b12:	41 83 fe 01          	cmp    r14d,0x1
   140005b16:	75 05                	jne    140005b1d <__mingw_pformat+0x215>
   140005b18:	0f b7 c9             	movzx  ecx,cx
   140005b1b:	eb 0e                	jmp    140005b2b <__mingw_pformat+0x223>
   140005b1d:	41 89 c8             	mov    r8d,ecx
   140005b20:	41 83 fe 05          	cmp    r14d,0x5
   140005b24:	0f b6 c9             	movzx  ecx,cl
   140005b27:	49 0f 45 c8          	cmovne rcx,r8
   140005b2b:	80 fa 75             	cmp    dl,0x75
   140005b2e:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
   140005b33:	75 05                	jne    140005b3a <__mingw_pformat+0x232>
   140005b35:	4c 89 c2             	mov    rdx,r8
   140005b38:	eb 47                	jmp    140005b81 <__mingw_pformat+0x279>
   140005b3a:	48 89 ca             	mov    rdx,rcx
   140005b3d:	89 c1                	mov    ecx,eax
   140005b3f:	e8 bb f4 ff ff       	call   140004fff <__pformat_xint.isra.0>
   140005b44:	eb 40                	jmp    140005b86 <__mingw_pformat+0x27e>
   140005b46:	81 4c 24 78 80 00 00 	or     DWORD PTR [rsp+0x78],0x80
   140005b4d:	00 
   140005b4e:	48 8d 73 08          	lea    rsi,[rbx+0x8]
   140005b52:	41 83 fe 03          	cmp    r14d,0x3
   140005b56:	75 05                	jne    140005b5d <__mingw_pformat+0x255>
   140005b58:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   140005b5b:	eb 1f                	jmp    140005b7c <__mingw_pformat+0x274>
   140005b5d:	48 63 0b             	movsxd rcx,DWORD PTR [rbx]
   140005b60:	41 83 fe 02          	cmp    r14d,0x2
   140005b64:	74 16                	je     140005b7c <__mingw_pformat+0x274>
   140005b66:	41 83 fe 01          	cmp    r14d,0x1
   140005b6a:	75 06                	jne    140005b72 <__mingw_pformat+0x26a>
   140005b6c:	48 0f bf c9          	movsx  rcx,cx
   140005b70:	eb 0a                	jmp    140005b7c <__mingw_pformat+0x274>
   140005b72:	41 83 fe 05          	cmp    r14d,0x5
   140005b76:	75 04                	jne    140005b7c <__mingw_pformat+0x274>
   140005b78:	48 0f be c9          	movsx  rcx,cl
   140005b7c:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005b81:	e8 75 f6 ff ff       	call   1400051fb <__pformat_int.isra.0>
   140005b86:	48 89 f3             	mov    rbx,rsi
   140005b89:	e9 d8 04 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005b8e:	85 f6                	test   esi,esi
   140005b90:	75 1a                	jne    140005bac <__mingw_pformat+0x2a4>
   140005b92:	39 7c 24 78          	cmp    DWORD PTR [rsp+0x78],edi
   140005b96:	75 14                	jne    140005bac <__mingw_pformat+0x2a4>
   140005b98:	c7 84 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],0x10
   140005b9f:	10 00 00 00 
   140005ba3:	89 f8                	mov    eax,edi
   140005ba5:	80 cc 02             	or     ah,0x2
   140005ba8:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   140005bac:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140005baf:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
   140005bb4:	b9 78 00 00 00       	mov    ecx,0x78
   140005bb9:	48 83 c3 08          	add    rbx,0x8
   140005bbd:	e8 3d f4 ff ff       	call   140004fff <__pformat_xint.isra.0>
   140005bc2:	e9 9f 04 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005bc7:	83 4c 24 78 20       	or     DWORD PTR [rsp+0x78],0x20
   140005bcc:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140005bcf:	48 83 c3 08          	add    rbx,0x8
   140005bd3:	f6 44 24 78 04       	test   BYTE PTR [rsp+0x78],0x4
   140005bd8:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005bdd:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   140005be2:	74 08                	je     140005bec <__mingw_pformat+0x2e4>
   140005be4:	db 28                	fld    TBYTE PTR [rax]
   140005be6:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   140005bea:	eb 0d                	jmp    140005bf9 <__mingw_pformat+0x2f1>
   140005bec:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005bf1:	dd 44 24 20          	fld    QWORD PTR [rsp+0x20]
   140005bf5:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   140005bf9:	e8 73 fb ff ff       	call   140005771 <__pformat_efloat>
   140005bfe:	e9 63 04 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005c03:	83 4c 24 78 20       	or     DWORD PTR [rsp+0x78],0x20
   140005c08:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140005c0b:	48 83 c3 08          	add    rbx,0x8
   140005c0f:	f6 44 24 78 04       	test   BYTE PTR [rsp+0x78],0x4
   140005c14:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005c19:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   140005c1e:	74 08                	je     140005c28 <__mingw_pformat+0x320>
   140005c20:	db 28                	fld    TBYTE PTR [rax]
   140005c22:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   140005c26:	eb 0d                	jmp    140005c35 <__mingw_pformat+0x32d>
   140005c28:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005c2d:	dd 44 24 20          	fld    QWORD PTR [rsp+0x20]
   140005c31:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   140005c35:	e8 29 f3 ff ff       	call   140004f63 <__pformat_float>
   140005c3a:	e9 27 04 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005c3f:	83 4c 24 78 20       	or     DWORD PTR [rsp+0x78],0x20
   140005c44:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140005c47:	48 83 c3 08          	add    rbx,0x8
   140005c4b:	f6 44 24 78 04       	test   BYTE PTR [rsp+0x78],0x4
   140005c50:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140005c55:	48 8d 4c 24 40       	lea    rcx,[rsp+0x40]
   140005c5a:	74 08                	je     140005c64 <__mingw_pformat+0x35c>
   140005c5c:	db 28                	fld    TBYTE PTR [rax]
   140005c5e:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   140005c62:	eb 0d                	jmp    140005c71 <__mingw_pformat+0x369>
   140005c64:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005c69:	dd 44 24 20          	fld    QWORD PTR [rsp+0x20]
   140005c6d:	db 7c 24 40          	fstp   TBYTE PTR [rsp+0x40]
   140005c71:	e8 7c fb ff ff       	call   1400057f2 <__pformat_gfloat>
   140005c76:	e9 eb 03 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005c7b:	83 4c 24 78 20       	or     DWORD PTR [rsp+0x78],0x20
   140005c80:	44 8b 4c 24 78       	mov    r9d,DWORD PTR [rsp+0x78]
   140005c85:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   140005c88:	48 83 c3 08          	add    rbx,0x8
   140005c8c:	4c 8d 44 24 70       	lea    r8,[rsp+0x70]
   140005c91:	41 f7 c1 04 00 00 00 	test   r9d,0x4
   140005c98:	0f 84 88 00 00 00    	je     140005d26 <__mingw_pformat+0x41e>
   140005c9e:	db 28                	fld    TBYTE PTR [rax]
   140005ca0:	db 7c 24 20          	fstp   TBYTE PTR [rsp+0x20]
   140005ca4:	48 8b 4c 24 20       	mov    rcx,QWORD PTR [rsp+0x20]
   140005ca9:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
   140005cae:	48 89 c8             	mov    rax,rcx
   140005cb1:	44 0f bf da          	movsx  r11d,dx
   140005cb5:	48 c1 e8 20          	shr    rax,0x20
   140005cb9:	43 8d 34 1b          	lea    esi,[r11+r11*1]
   140005cbd:	25 ff ff ff 7f       	and    eax,0x7fffffff
   140005cc2:	0f b7 f6             	movzx  esi,si
   140005cc5:	09 c8                	or     eax,ecx
   140005cc7:	41 89 c2             	mov    r10d,eax
   140005cca:	41 f7 da             	neg    r10d
   140005ccd:	41 09 c2             	or     r10d,eax
   140005cd0:	41 c1 ea 1f          	shr    r10d,0x1f
   140005cd4:	41 09 f2             	or     r10d,esi
   140005cd7:	be fe ff 00 00       	mov    esi,0xfffe
   140005cdc:	44 29 d6             	sub    esi,r10d
   140005cdf:	c1 ee 10             	shr    esi,0x10
   140005ce2:	75 6a                	jne    140005d4e <__mingw_pformat+0x446>
   140005ce4:	66 85 d2             	test   dx,dx
   140005ce7:	79 09                	jns    140005cf2 <__mingw_pformat+0x3ea>
   140005ce9:	41 80 c9 80          	or     r9b,0x80
   140005ced:	44 89 4c 24 78       	mov    DWORD PTR [rsp+0x78],r9d
   140005cf2:	66 81 e2 ff 7f       	and    dx,0x7fff
   140005cf7:	74 13                	je     140005d0c <__mingw_pformat+0x404>
   140005cf9:	66 81 fa ff 7f       	cmp    dx,0x7fff
   140005cfe:	75 1c                	jne    140005d1c <__mingw_pformat+0x414>
   140005d00:	85 c0                	test   eax,eax
   140005d02:	75 18                	jne    140005d1c <__mingw_pformat+0x414>
   140005d04:	44 89 d9             	mov    ecx,r11d
   140005d07:	e9 99 00 00 00       	jmp    140005da5 <__mingw_pformat+0x49d>
   140005d0c:	48 85 c9             	test   rcx,rcx
   140005d0f:	b8 02 c0 ff ff       	mov    eax,0xffffc002
   140005d14:	0f 45 d0             	cmovne edx,eax
   140005d17:	e9 e4 00 00 00       	jmp    140005e00 <__mingw_pformat+0x4f8>
   140005d1c:	66 81 ea ff 3f       	sub    dx,0x3fff
   140005d21:	e9 da 00 00 00       	jmp    140005e00 <__mingw_pformat+0x4f8>
   140005d26:	48 89 c1             	mov    rcx,rax
   140005d29:	89 c2                	mov    edx,eax
   140005d2b:	48 c1 e9 20          	shr    rcx,0x20
   140005d2f:	f7 da                	neg    edx
   140005d31:	41 89 ca             	mov    r10d,ecx
   140005d34:	09 c2                	or     edx,eax
   140005d36:	41 81 e2 ff ff ff 7f 	and    r10d,0x7fffffff
   140005d3d:	c1 ea 1f             	shr    edx,0x1f
   140005d40:	44 09 d2             	or     edx,r10d
   140005d43:	41 ba 00 00 f0 7f    	mov    r10d,0x7ff00000
   140005d49:	41 39 d2             	cmp    r10d,edx
   140005d4c:	79 0b                	jns    140005d59 <__mingw_pformat+0x451>
   140005d4e:	48 8d 15 31 67 00 00 	lea    rdx,[rip+0x6731]        # 14000c486 <.rdata+0x16>
   140005d55:	31 c9                	xor    ecx,ecx
   140005d57:	eb 59                	jmp    140005db2 <__mingw_pformat+0x4aa>
   140005d59:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   140005d5e:	dd 44 24 20          	fld    QWORD PTR [rsp+0x20]
   140005d62:	db 7c 24 20          	fstp   TBYTE PTR [rsp+0x20]
   140005d66:	48 8b 54 24 28       	mov    rdx,QWORD PTR [rsp+0x28]
   140005d6b:	66 85 d2             	test   dx,dx
   140005d6e:	79 09                	jns    140005d79 <__mingw_pformat+0x471>
   140005d70:	41 80 c9 80          	or     r9b,0x80
   140005d74:	44 89 4c 24 78       	mov    DWORD PTR [rsp+0x78],r9d
   140005d79:	41 89 c9             	mov    r9d,ecx
   140005d7c:	81 e1 00 00 f0 7f    	and    ecx,0x7ff00000
   140005d82:	41 81 e1 ff ff 0f 00 	and    r9d,0xfffff
   140005d89:	81 f9 00 00 f0 7f    	cmp    ecx,0x7ff00000
   140005d8f:	41 0f 95 c2          	setne  r10b
   140005d93:	41 09 c1             	or     r9d,eax
   140005d96:	0f 95 c0             	setne  al
   140005d99:	41 08 c2             	or     r10b,al
   140005d9c:	75 1e                	jne    140005dbc <__mingw_pformat+0x4b4>
   140005d9e:	41 09 c9             	or     r9d,ecx
   140005da1:	74 19                	je     140005dbc <__mingw_pformat+0x4b4>
   140005da3:	89 d1                	mov    ecx,edx
   140005da5:	81 e1 00 80 00 00    	and    ecx,0x8000
   140005dab:	48 8d 15 d8 66 00 00 	lea    rdx,[rip+0x66d8]        # 14000c48a <.rdata+0x1a>
   140005db2:	e8 7d ee ff ff       	call   140004c34 <__pformat_emit_inf_or_nan>
   140005db7:	e9 aa 02 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005dbc:	48 8b 44 24 20       	mov    rax,QWORD PTR [rsp+0x20]
   140005dc1:	66 81 e2 ff 7f       	and    dx,0x7fff
   140005dc6:	74 1f                	je     140005de7 <__mingw_pformat+0x4df>
   140005dc8:	66 81 fa 00 3c       	cmp    dx,0x3c00
   140005dcd:	7f 13                	jg     140005de2 <__mingw_pformat+0x4da>
   140005dcf:	44 0f bf ca          	movsx  r9d,dx
   140005dd3:	b9 01 3c 00 00       	mov    ecx,0x3c01
   140005dd8:	44 29 c9             	sub    ecx,r9d
   140005ddb:	48 d3 e8             	shr    rax,cl
   140005dde:	01 ca                	add    edx,ecx
   140005de0:	eb 12                	jmp    140005df4 <__mingw_pformat+0x4ec>
   140005de2:	66 85 d2             	test   dx,dx
   140005de5:	75 0d                	jne    140005df4 <__mingw_pformat+0x4ec>
   140005de7:	48 85 c0             	test   rax,rax
   140005dea:	b9 05 fc ff ff       	mov    ecx,0xfffffc05
   140005def:	0f 45 d1             	cmovne edx,ecx
   140005df2:	eb 05                	jmp    140005df9 <__mingw_pformat+0x4f1>
   140005df4:	66 81 ea fc 3f       	sub    dx,0x3ffc
   140005df9:	48 c1 e8 03          	shr    rax,0x3
   140005dfd:	48 89 c1             	mov    rcx,rax
   140005e00:	e8 eb f5 ff ff       	call   1400053f0 <__pformat_emit_xfloat.isra.0>
   140005e05:	e9 5c 02 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005e0a:	48 8b 13             	mov    rdx,QWORD PTR [rbx]
   140005e0d:	48 63 84 24 94 00 00 	movsxd rax,DWORD PTR [rsp+0x94]
   140005e14:	00 
   140005e15:	48 83 c3 08          	add    rbx,0x8
   140005e19:	41 83 fe 05          	cmp    r14d,0x5
   140005e1d:	75 07                	jne    140005e26 <__mingw_pformat+0x51e>
   140005e1f:	88 02                	mov    BYTE PTR [rdx],al
   140005e21:	e9 40 02 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005e26:	41 83 fe 01          	cmp    r14d,0x1
   140005e2a:	75 08                	jne    140005e34 <__mingw_pformat+0x52c>
   140005e2c:	66 89 02             	mov    WORD PTR [rdx],ax
   140005e2f:	e9 32 02 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005e34:	41 83 fe 02          	cmp    r14d,0x2
   140005e38:	74 0e                	je     140005e48 <__mingw_pformat+0x540>
   140005e3a:	41 83 fe 03          	cmp    r14d,0x3
   140005e3e:	75 08                	jne    140005e48 <__mingw_pformat+0x540>
   140005e40:	48 89 02             	mov    QWORD PTR [rdx],rax
   140005e43:	e9 1e 02 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005e48:	89 02                	mov    DWORD PTR [rdx],eax
   140005e4a:	e9 17 02 00 00       	jmp    140006066 <__mingw_pformat+0x75e>
   140005e4f:	41 be 01 00 00 00    	mov    r14d,0x1
   140005e55:	41 80 79 01 68       	cmp    BYTE PTR [r9+0x1],0x68
   140005e5a:	0f 85 e4 01 00 00    	jne    140006044 <__mingw_pformat+0x73c>
   140005e60:	49 8d 69 02          	lea    rbp,[r9+0x2]
   140005e64:	41 be 05 00 00 00    	mov    r14d,0x5
   140005e6a:	e9 d5 01 00 00       	jmp    140006044 <__mingw_pformat+0x73c>
   140005e6f:	41 8a 41 01          	mov    al,BYTE PTR [r9+0x1]
   140005e73:	3c 36                	cmp    al,0x36
   140005e75:	75 14                	jne    140005e8b <__mingw_pformat+0x583>
   140005e77:	41 80 79 02 34       	cmp    BYTE PTR [r9+0x2],0x34
   140005e7c:	0f 85 bc 01 00 00    	jne    14000603e <__mingw_pformat+0x736>
   140005e82:	49 8d 69 03          	lea    rbp,[r9+0x3]
   140005e86:	e9 b3 01 00 00       	jmp    14000603e <__mingw_pformat+0x736>
   140005e8b:	3c 33                	cmp    al,0x33
   140005e8d:	0f 85 ab 01 00 00    	jne    14000603e <__mingw_pformat+0x736>
   140005e93:	41 80 79 02 32       	cmp    BYTE PTR [r9+0x2],0x32
   140005e98:	0f 85 a0 01 00 00    	jne    14000603e <__mingw_pformat+0x736>
   140005e9e:	49 8d 69 03          	lea    rbp,[r9+0x3]
   140005ea2:	e9 a4 01 00 00       	jmp    14000604b <__mingw_pformat+0x743>
   140005ea7:	41 80 79 01 6c       	cmp    BYTE PTR [r9+0x1],0x6c
   140005eac:	0f 85 99 01 00 00    	jne    14000604b <__mingw_pformat+0x743>
   140005eb2:	49 8d 69 02          	lea    rbp,[r9+0x2]
   140005eb6:	e9 83 01 00 00       	jmp    14000603e <__mingw_pformat+0x736>
   140005ebb:	83 4c 24 78 04       	or     DWORD PTR [rsp+0x78],0x4
   140005ec0:	e9 7f 01 00 00       	jmp    140006044 <__mingw_pformat+0x73c>
   140005ec5:	83 fe 01             	cmp    esi,0x1
   140005ec8:	0f 87 76 01 00 00    	ja     140006044 <__mingw_pformat+0x73c>
   140005ece:	31 d2                	xor    edx,edx
   140005ed0:	4c 8d bc 24 80 00 00 	lea    r15,[rsp+0x80]
   140005ed7:	00 
   140005ed8:	89 94 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],edx
   140005edf:	eb 4c                	jmp    140005f2d <__mingw_pformat+0x625>
   140005ee1:	4d 85 ff             	test   r15,r15
   140005ee4:	0f 84 5a 01 00 00    	je     140006044 <__mingw_pformat+0x73c>
   140005eea:	f7 c6 fd ff ff ff    	test   esi,0xfffffffd
   140005ef0:	0f 85 5d 01 00 00    	jne    140006053 <__mingw_pformat+0x74b>
   140005ef6:	8b 13                	mov    edx,DWORD PTR [rbx]
   140005ef8:	48 8d 43 08          	lea    rax,[rbx+0x8]
   140005efc:	41 89 17             	mov    DWORD PTR [r15],edx
   140005eff:	85 d2                	test   edx,edx
   140005f01:	0f 89 51 01 00 00    	jns    140006058 <__mingw_pformat+0x750>
   140005f07:	85 f6                	test   esi,esi
   140005f09:	75 11                	jne    140005f1c <__mingw_pformat+0x614>
   140005f0b:	81 4c 24 78 00 04 00 	or     DWORD PTR [rsp+0x78],0x400
   140005f12:	00 
   140005f13:	f7 5c 24 7c          	neg    DWORD PTR [rsp+0x7c]
   140005f17:	e9 3c 01 00 00       	jmp    140006058 <__mingw_pformat+0x750>
   140005f1c:	c7 84 24 80 00 00 00 	mov    DWORD PTR [rsp+0x80],0xffffffff
   140005f23:	ff ff ff ff 
   140005f27:	48 89 c3             	mov    rbx,rax
   140005f2a:	45 31 ff             	xor    r15d,r15d
   140005f2d:	be 02 00 00 00       	mov    esi,0x2
   140005f32:	e9 27 01 00 00       	jmp    14000605e <__mingw_pformat+0x756>
   140005f37:	85 f6                	test   esi,esi
   140005f39:	0f 85 1f 01 00 00    	jne    14000605e <__mingw_pformat+0x756>
   140005f3f:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   140005f43:	80 cc 08             	or     ah,0x8
   140005f46:	e9 ed 00 00 00       	jmp    140006038 <__mingw_pformat+0x730>
   140005f4b:	85 f6                	test   esi,esi
   140005f4d:	0f 85 0b 01 00 00    	jne    14000605e <__mingw_pformat+0x756>
   140005f53:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   140005f57:	80 cc 01             	or     ah,0x1
   140005f5a:	e9 d9 00 00 00       	jmp    140006038 <__mingw_pformat+0x730>
   140005f5f:	85 f6                	test   esi,esi
   140005f61:	0f 85 f7 00 00 00    	jne    14000605e <__mingw_pformat+0x756>
   140005f67:	8b 44 24 78          	mov    eax,DWORD PTR [rsp+0x78]
   140005f6b:	80 cc 04             	or     ah,0x4
   140005f6e:	e9 c5 00 00 00       	jmp    140006038 <__mingw_pformat+0x730>
   140005f73:	85 f6                	test   esi,esi
   140005f75:	0f 85 e3 00 00 00    	jne    14000605e <__mingw_pformat+0x756>
   140005f7b:	31 c0                	xor    eax,eax
   140005f7d:	81 4c 24 78 00 10 00 	or     DWORD PTR [rsp+0x78],0x1000
   140005f84:	00 
   140005f85:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   140005f8a:	e8 59 4c 00 00       	call   14000abe8 <localeconv>
   140005f8f:	48 8d 4c 24 5e       	lea    rcx,[rsp+0x5e]
   140005f94:	4c 8d 4c 24 60       	lea    r9,[rsp+0x60]
   140005f99:	41 b8 10 00 00 00    	mov    r8d,0x10
   140005f9f:	48 8b 50 08          	mov    rdx,QWORD PTR [rax+0x8]
   140005fa3:	e8 76 48 00 00       	call   14000a81e <mbrtowc>
   140005fa8:	85 c0                	test   eax,eax
   140005faa:	7e 0d                	jle    140005fb9 <__mingw_pformat+0x6b1>
   140005fac:	66 8b 54 24 5e       	mov    dx,WORD PTR [rsp+0x5e]
   140005fb1:	66 89 94 24 90 00 00 	mov    WORD PTR [rsp+0x90],dx
   140005fb8:	00 
   140005fb9:	89 84 24 8c 00 00 00 	mov    DWORD PTR [rsp+0x8c],eax
   140005fc0:	e9 99 00 00 00       	jmp    14000605e <__mingw_pformat+0x756>
   140005fc5:	85 f6                	test   esi,esi
   140005fc7:	0f 85 91 00 00 00    	jne    14000605e <__mingw_pformat+0x756>
   140005fcd:	83 4c 24 78 40       	or     DWORD PTR [rsp+0x78],0x40
   140005fd2:	e9 87 00 00 00       	jmp    14000605e <__mingw_pformat+0x756>
   140005fd7:	85 f6                	test   esi,esi
   140005fd9:	75 0a                	jne    140005fe5 <__mingw_pformat+0x6dd>
   140005fdb:	81 4c 24 78 00 02 00 	or     DWORD PTR [rsp+0x78],0x200
   140005fe2:	00 
   140005fe3:	eb 79                	jmp    14000605e <__mingw_pformat+0x756>
   140005fe5:	83 ea 30             	sub    edx,0x30
   140005fe8:	80 fa 09             	cmp    dl,0x9
   140005feb:	77 37                	ja     140006024 <__mingw_pformat+0x71c>
   140005fed:	83 fe 04             	cmp    esi,0x4
   140005ff0:	74 32                	je     140006024 <__mingw_pformat+0x71c>
   140005ff2:	85 f6                	test   esi,esi
   140005ff4:	74 0d                	je     140006003 <__mingw_pformat+0x6fb>
   140005ff6:	83 fe 02             	cmp    esi,0x2
   140005ff9:	ba 03 00 00 00       	mov    edx,0x3
   140005ffe:	0f 44 f2             	cmove  esi,edx
   140006001:	eb 05                	jmp    140006008 <__mingw_pformat+0x700>
   140006003:	be 01 00 00 00       	mov    esi,0x1
   140006008:	4d 85 ff             	test   r15,r15
   14000600b:	74 51                	je     14000605e <__mingw_pformat+0x756>
   14000600d:	41 8b 17             	mov    edx,DWORD PTR [r15]
   140006010:	6b ca 0a             	imul   ecx,edx,0xa
   140006013:	8d 4c 08 d0          	lea    ecx,[rax+rcx*1-0x30]
   140006017:	83 e8 30             	sub    eax,0x30
   14000601a:	85 d2                	test   edx,edx
   14000601c:	0f 49 c1             	cmovns eax,ecx
   14000601f:	41 89 07             	mov    DWORD PTR [r15],eax
   140006022:	eb 3a                	jmp    14000605e <__mingw_pformat+0x756>
   140006024:	48 8d 54 24 70       	lea    rdx,[rsp+0x70]
   140006029:	b9 25 00 00 00       	mov    ecx,0x25
   14000602e:	4c 89 e5             	mov    rbp,r12
   140006031:	e8 0f ea ff ff       	call   140004a45 <__pformat_putc>
   140006036:	eb 2e                	jmp    140006066 <__mingw_pformat+0x75e>
   140006038:	89 44 24 78          	mov    DWORD PTR [rsp+0x78],eax
   14000603c:	eb 20                	jmp    14000605e <__mingw_pformat+0x756>
   14000603e:	41 be 03 00 00 00    	mov    r14d,0x3
   140006044:	be 04 00 00 00       	mov    esi,0x4
   140006049:	eb 13                	jmp    14000605e <__mingw_pformat+0x756>
   14000604b:	41 be 02 00 00 00    	mov    r14d,0x2
   140006051:	eb f1                	jmp    140006044 <__mingw_pformat+0x73c>
   140006053:	45 31 ff             	xor    r15d,r15d
   140006056:	eb ec                	jmp    140006044 <__mingw_pformat+0x73c>
   140006058:	48 89 c3             	mov    rbx,rax
   14000605b:	45 31 ff             	xor    r15d,r15d
   14000605e:	49 89 e9             	mov    r9,rbp
   140006061:	e9 87 f9 ff ff       	jmp    1400059ed <__mingw_pformat+0xe5>
   140006066:	49 89 e9             	mov    r9,rbp
   140006069:	e9 4c f9 ff ff       	jmp    1400059ba <__mingw_pformat+0xb2>
   14000606e:	48 8b 54 24 38       	mov    rdx,QWORD PTR [rsp+0x38]
   140006073:	e8 cd e9 ff ff       	call   140004a45 <__pformat_putc>
   140006078:	4d 89 e1             	mov    r9,r12
   14000607b:	e9 3a f9 ff ff       	jmp    1400059ba <__mingw_pformat+0xb2>
   140006080:	8b 84 24 94 00 00 00 	mov    eax,DWORD PTR [rsp+0x94]
   140006087:	48 81 c4 a8 00 00 00 	add    rsp,0xa8
   14000608e:	5b                   	pop    rbx
   14000608f:	5e                   	pop    rsi
   140006090:	5f                   	pop    rdi
   140006091:	5d                   	pop    rbp
   140006092:	41 5c                	pop    r12
   140006094:	41 5d                	pop    r13
   140006096:	41 5e                	pop    r14
   140006098:	41 5f                	pop    r15
   14000609a:	c3                   	ret
   14000609b:	90                   	nop
   14000609c:	90                   	nop
   14000609d:	90                   	nop
   14000609e:	90                   	nop
   14000609f:	90                   	nop

00000001400060a0 <__rv_alloc_D2A>:
   1400060a0:	53                   	push   rbx
   1400060a1:	48 83 ec 20          	sub    rsp,0x20
   1400060a5:	31 db                	xor    ebx,ebx
   1400060a7:	b8 04 00 00 00       	mov    eax,0x4
   1400060ac:	8d 50 17             	lea    edx,[rax+0x17]
   1400060af:	39 ca                	cmp    edx,ecx
   1400060b1:	7d 06                	jge    1400060b9 <__rv_alloc_D2A+0x19>
   1400060b3:	ff c3                	inc    ebx
   1400060b5:	01 c0                	add    eax,eax
   1400060b7:	eb f3                	jmp    1400060ac <__rv_alloc_D2A+0xc>
   1400060b9:	89 d9                	mov    ecx,ebx
   1400060bb:	e8 23 16 00 00       	call   1400076e3 <__Balloc_D2A>
   1400060c0:	89 18                	mov    DWORD PTR [rax],ebx
   1400060c2:	48 83 c0 04          	add    rax,0x4
   1400060c6:	48 83 c4 20          	add    rsp,0x20
   1400060ca:	5b                   	pop    rbx
   1400060cb:	c3                   	ret

00000001400060cc <__nrv_alloc_D2A>:
   1400060cc:	56                   	push   rsi
   1400060cd:	53                   	push   rbx
   1400060ce:	48 83 ec 28          	sub    rsp,0x28
   1400060d2:	48 89 ce             	mov    rsi,rcx
   1400060d5:	44 89 c1             	mov    ecx,r8d
   1400060d8:	48 89 d3             	mov    rbx,rdx
   1400060db:	e8 c0 ff ff ff       	call   1400060a0 <__rv_alloc_D2A>
   1400060e0:	48 89 c2             	mov    rdx,rax
   1400060e3:	31 c0                	xor    eax,eax
   1400060e5:	8a 0c 06             	mov    cl,BYTE PTR [rsi+rax*1]
   1400060e8:	49 89 c0             	mov    r8,rax
   1400060eb:	88 0c 02             	mov    BYTE PTR [rdx+rax*1],cl
   1400060ee:	48 ff c0             	inc    rax
   1400060f1:	84 c9                	test   cl,cl
   1400060f3:	75 f0                	jne    1400060e5 <__nrv_alloc_D2A+0x19>
   1400060f5:	48 85 db             	test   rbx,rbx
   1400060f8:	74 07                	je     140006101 <__nrv_alloc_D2A+0x35>
   1400060fa:	4a 8d 04 02          	lea    rax,[rdx+r8*1]
   1400060fe:	48 89 03             	mov    QWORD PTR [rbx],rax
   140006101:	48 89 d0             	mov    rax,rdx
   140006104:	48 83 c4 28          	add    rsp,0x28
   140006108:	5b                   	pop    rbx
   140006109:	5e                   	pop    rsi
   14000610a:	c3                   	ret

000000014000610b <__freedtoa>:
   14000610b:	ba 01 00 00 00       	mov    edx,0x1
   140006110:	48 89 c8             	mov    rax,rcx
   140006113:	8b 49 fc             	mov    ecx,DWORD PTR [rcx-0x4]
   140006116:	d3 e2                	shl    edx,cl
   140006118:	89 48 04             	mov    DWORD PTR [rax+0x4],ecx
   14000611b:	48 8d 48 fc          	lea    rcx,[rax-0x4]
   14000611f:	89 50 08             	mov    DWORD PTR [rax+0x8],edx
   140006122:	e9 72 16 00 00       	jmp    140007799 <__Bfree_D2A>

0000000140006127 <__quorem_D2A>:
   140006127:	41 57                	push   r15
   140006129:	41 56                	push   r14
   14000612b:	41 55                	push   r13
   14000612d:	41 54                	push   r12
   14000612f:	55                   	push   rbp
   140006130:	57                   	push   rdi
   140006131:	56                   	push   rsi
   140006132:	53                   	push   rbx
   140006133:	48 83 ec 38          	sub    rsp,0x38
   140006137:	31 c0                	xor    eax,eax
   140006139:	8b 5a 14             	mov    ebx,DWORD PTR [rdx+0x14]
   14000613c:	48 89 ce             	mov    rsi,rcx
   14000613f:	49 89 d1             	mov    r9,rdx
   140006142:	39 59 14             	cmp    DWORD PTR [rcx+0x14],ebx
   140006145:	0f 8c 05 01 00 00    	jl     140006250 <__quorem_D2A+0x129>
   14000614b:	ff cb                	dec    ebx
   14000614d:	48 8d 6a 18          	lea    rbp,[rdx+0x18]
   140006151:	48 8d 7e 18          	lea    rdi,[rsi+0x18]
   140006155:	31 d2                	xor    edx,edx
   140006157:	48 63 cb             	movsxd rcx,ebx
   14000615a:	48 c1 e1 02          	shl    rcx,0x2
   14000615e:	4c 8d 6c 0d 00       	lea    r13,[rbp+rcx*1+0x0]
   140006163:	48 01 f9             	add    rcx,rdi
   140006166:	41 8b 45 00          	mov    eax,DWORD PTR [r13+0x0]
   14000616a:	44 8b 11             	mov    r10d,DWORD PTR [rcx]
   14000616d:	44 8d 40 01          	lea    r8d,[rax+0x1]
   140006171:	44 89 d0             	mov    eax,r10d
   140006174:	41 f7 f0             	div    r8d
   140006177:	41 89 c6             	mov    r14d,eax
   14000617a:	41 89 c4             	mov    r12d,eax
   14000617d:	45 39 c2             	cmp    r10d,r8d
   140006180:	72 6a                	jb     1400061ec <__quorem_D2A+0xc5>
   140006182:	44 89 f2             	mov    edx,r14d
   140006185:	48 89 e8             	mov    rax,rbp
   140006188:	49 89 fa             	mov    r10,rdi
   14000618b:	45 31 ff             	xor    r15d,r15d
   14000618e:	48 89 54 24 28       	mov    QWORD PTR [rsp+0x28],rdx
   140006193:	45 31 db             	xor    r11d,r11d
   140006196:	8b 10                	mov    edx,DWORD PTR [rax]
   140006198:	48 0f af 54 24 28    	imul   rdx,QWORD PTR [rsp+0x28]
   14000619e:	48 83 c0 04          	add    rax,0x4
   1400061a2:	49 83 c2 04          	add    r10,0x4
   1400061a6:	45 8b 42 fc          	mov    r8d,DWORD PTR [r10-0x4]
   1400061aa:	4c 01 fa             	add    rdx,r15
   1400061ad:	49 89 d7             	mov    r15,rdx
   1400061b0:	89 d2                	mov    edx,edx
   1400061b2:	49 29 d0             	sub    r8,rdx
   1400061b5:	49 c1 ef 20          	shr    r15,0x20
   1400061b9:	4d 29 d8             	sub    r8,r11
   1400061bc:	4d 89 c3             	mov    r11,r8
   1400061bf:	45 89 42 fc          	mov    DWORD PTR [r10-0x4],r8d
   1400061c3:	49 c1 eb 20          	shr    r11,0x20
   1400061c7:	41 83 e3 01          	and    r11d,0x1
   1400061cb:	49 39 c5             	cmp    r13,rax
   1400061ce:	73 c6                	jae    140006196 <__quorem_D2A+0x6f>
   1400061d0:	83 39 00             	cmp    DWORD PTR [rcx],0x0
   1400061d3:	75 17                	jne    1400061ec <__quorem_D2A+0xc5>
   1400061d5:	48 83 e9 04          	sub    rcx,0x4
   1400061d9:	48 39 cf             	cmp    rdi,rcx
   1400061dc:	72 05                	jb     1400061e3 <__quorem_D2A+0xbc>
   1400061de:	89 5e 14             	mov    DWORD PTR [rsi+0x14],ebx
   1400061e1:	eb 09                	jmp    1400061ec <__quorem_D2A+0xc5>
   1400061e3:	83 39 00             	cmp    DWORD PTR [rcx],0x0
   1400061e6:	75 f6                	jne    1400061de <__quorem_D2A+0xb7>
   1400061e8:	ff cb                	dec    ebx
   1400061ea:	eb e9                	jmp    1400061d5 <__quorem_D2A+0xae>
   1400061ec:	4c 89 ca             	mov    rdx,r9
   1400061ef:	48 89 f1             	mov    rcx,rsi
   1400061f2:	e8 d9 19 00 00       	call   140007bd0 <__cmp_D2A>
   1400061f7:	85 c0                	test   eax,eax
   1400061f9:	78 52                	js     14000624d <__quorem_D2A+0x126>
   1400061fb:	45 8d 66 01          	lea    r12d,[r14+0x1]
   1400061ff:	48 89 fa             	mov    rdx,rdi
   140006202:	31 c9                	xor    ecx,ecx
   140006204:	8b 02                	mov    eax,DWORD PTR [rdx]
   140006206:	44 8b 45 00          	mov    r8d,DWORD PTR [rbp+0x0]
   14000620a:	48 83 c5 04          	add    rbp,0x4
   14000620e:	48 83 c2 04          	add    rdx,0x4
   140006212:	4c 29 c0             	sub    rax,r8
   140006215:	48 29 c8             	sub    rax,rcx
   140006218:	48 89 c1             	mov    rcx,rax
   14000621b:	89 42 fc             	mov    DWORD PTR [rdx-0x4],eax
   14000621e:	48 c1 e9 20          	shr    rcx,0x20
   140006222:	83 e1 01             	and    ecx,0x1
   140006225:	49 39 ed             	cmp    r13,rbp
   140006228:	73 da                	jae    140006204 <__quorem_D2A+0xdd>
   14000622a:	48 63 c3             	movsxd rax,ebx
   14000622d:	48 8d 04 87          	lea    rax,[rdi+rax*4]
   140006231:	83 38 00             	cmp    DWORD PTR [rax],0x0
   140006234:	75 17                	jne    14000624d <__quorem_D2A+0x126>
   140006236:	48 83 e8 04          	sub    rax,0x4
   14000623a:	48 39 c7             	cmp    rdi,rax
   14000623d:	72 05                	jb     140006244 <__quorem_D2A+0x11d>
   14000623f:	89 5e 14             	mov    DWORD PTR [rsi+0x14],ebx
   140006242:	eb 09                	jmp    14000624d <__quorem_D2A+0x126>
   140006244:	83 38 00             	cmp    DWORD PTR [rax],0x0
   140006247:	75 f6                	jne    14000623f <__quorem_D2A+0x118>
   140006249:	ff cb                	dec    ebx
   14000624b:	eb e9                	jmp    140006236 <__quorem_D2A+0x10f>
   14000624d:	44 89 e0             	mov    eax,r12d
   140006250:	48 83 c4 38          	add    rsp,0x38
   140006254:	5b                   	pop    rbx
   140006255:	5e                   	pop    rsi
   140006256:	5f                   	pop    rdi
   140006257:	5d                   	pop    rbp
   140006258:	41 5c                	pop    r12
   14000625a:	41 5d                	pop    r13
   14000625c:	41 5e                	pop    r14
   14000625e:	41 5f                	pop    r15
   140006260:	c3                   	ret
   140006261:	90                   	nop
   140006262:	90                   	nop
   140006263:	90                   	nop
   140006264:	90                   	nop
   140006265:	90                   	nop
   140006266:	90                   	nop
   140006267:	90                   	nop
   140006268:	90                   	nop
   140006269:	90                   	nop
   14000626a:	90                   	nop
   14000626b:	90                   	nop
   14000626c:	90                   	nop
   14000626d:	90                   	nop
   14000626e:	90                   	nop
   14000626f:	90                   	nop

0000000140006270 <__gdtoa>:
   140006270:	41 57                	push   r15
   140006272:	41 56                	push   r14
   140006274:	41 55                	push   r13
   140006276:	41 54                	push   r12
   140006278:	55                   	push   rbp
   140006279:	57                   	push   rdi
   14000627a:	56                   	push   rsi
   14000627b:	53                   	push   rbx
   14000627c:	48 81 ec b8 00 00 00 	sub    rsp,0xb8
   140006283:	0f 29 b4 24 a0 00 00 	movaps XMMWORD PTR [rsp+0xa0],xmm6
   14000628a:	00 
   14000628b:	8b 84 24 20 01 00 00 	mov    eax,DWORD PTR [rsp+0x120]
   140006292:	45 8b 31             	mov    r14d,DWORD PTR [r9]
   140006295:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   140006299:	8b 84 24 28 01 00 00 	mov    eax,DWORD PTR [rsp+0x128]
   1400062a0:	48 89 4c 24 60       	mov    QWORD PTR [rsp+0x60],rcx
   1400062a5:	89 44 24 40          	mov    DWORD PTR [rsp+0x40],eax
   1400062a9:	48 8b 84 24 30 01 00 	mov    rax,QWORD PTR [rsp+0x130]
   1400062b0:	00 
   1400062b1:	89 94 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],edx
   1400062b8:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
   1400062bd:	48 8b 84 24 38 01 00 	mov    rax,QWORD PTR [rsp+0x138]
   1400062c4:	00 
   1400062c5:	4c 89 44 24 48       	mov    QWORD PTR [rsp+0x48],r8
   1400062ca:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   1400062cf:	44 89 f0             	mov    eax,r14d
   1400062d2:	83 e0 cf             	and    eax,0xffffffcf
   1400062d5:	4c 89 4c 24 78       	mov    QWORD PTR [rsp+0x78],r9
   1400062da:	41 89 01             	mov    DWORD PTR [r9],eax
   1400062dd:	44 89 f0             	mov    eax,r14d
   1400062e0:	83 e0 07             	and    eax,0x7
   1400062e3:	83 f8 03             	cmp    eax,0x3
   1400062e6:	74 2d                	je     140006315 <__gdtoa+0xa5>
   1400062e8:	44 89 f7             	mov    edi,r14d
   1400062eb:	83 e7 04             	and    edi,0x4
   1400062ee:	75 13                	jne    140006303 <__gdtoa+0x93>
   1400062f0:	85 c0                	test   eax,eax
   1400062f2:	0f 84 5a 01 00 00    	je     140006452 <__gdtoa+0x1e2>
   1400062f8:	8b 31                	mov    esi,DWORD PTR [rcx]
   1400062fa:	b8 20 00 00 00       	mov    eax,0x20
   1400062ff:	31 c9                	xor    ecx,ecx
   140006301:	eb 6e                	jmp    140006371 <__gdtoa+0x101>
   140006303:	83 f8 04             	cmp    eax,0x4
   140006306:	74 2c                	je     140006334 <__gdtoa+0xc4>
   140006308:	45 31 db             	xor    r11d,r11d
   14000630b:	4c 89 5c 24 28       	mov    QWORD PTR [rsp+0x28],r11
   140006310:	e9 e2 0e 00 00       	jmp    1400071f7 <__gdtoa+0xf87>
   140006315:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   14000631a:	48 8b 54 24 58       	mov    rdx,QWORD PTR [rsp+0x58]
   14000631f:	41 b8 08 00 00 00    	mov    r8d,0x8
   140006325:	48 8d 0d d4 62 00 00 	lea    rcx,[rip+0x62d4]        # 14000c600 <.rdata>
   14000632c:	c7 00 00 80 ff ff    	mov    DWORD PTR [rax],0xffff8000
   140006332:	eb 1d                	jmp    140006351 <__gdtoa+0xe1>
   140006334:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140006339:	48 8b 54 24 58       	mov    rdx,QWORD PTR [rsp+0x58]
   14000633e:	41 b8 03 00 00 00    	mov    r8d,0x3
   140006344:	48 8d 0d be 62 00 00 	lea    rcx,[rip+0x62be]        # 14000c609 <.rdata+0x9>
   14000634b:	c7 00 00 80 ff ff    	mov    DWORD PTR [rax],0xffff8000
   140006351:	0f 28 b4 24 a0 00 00 	movaps xmm6,XMMWORD PTR [rsp+0xa0]
   140006358:	00 
   140006359:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
   140006360:	5b                   	pop    rbx
   140006361:	5e                   	pop    rsi
   140006362:	5f                   	pop    rdi
   140006363:	5d                   	pop    rbp
   140006364:	41 5c                	pop    r12
   140006366:	41 5d                	pop    r13
   140006368:	41 5e                	pop    r14
   14000636a:	41 5f                	pop    r15
   14000636c:	e9 5b fd ff ff       	jmp    1400060cc <__nrv_alloc_D2A>
   140006371:	39 c6                	cmp    esi,eax
   140006373:	7e 06                	jle    14000637b <__gdtoa+0x10b>
   140006375:	01 c0                	add    eax,eax
   140006377:	ff c1                	inc    ecx
   140006379:	eb f6                	jmp    140006371 <__gdtoa+0x101>
   14000637b:	e8 63 13 00 00       	call   1400076e3 <__Balloc_D2A>
   140006380:	48 8b 4c 24 48       	mov    rcx,QWORD PTR [rsp+0x48]
   140006385:	31 d2                	xor    edx,edx
   140006387:	48 89 c3             	mov    rbx,rax
   14000638a:	8d 46 ff             	lea    eax,[rsi-0x1]
   14000638d:	c1 f8 05             	sar    eax,0x5
   140006390:	48 98                	cdqe
   140006392:	48 c1 e0 02          	shl    rax,0x2
   140006396:	48 01 c1             	add    rcx,rax
   140006399:	4c 8b 5c 24 48       	mov    r11,QWORD PTR [rsp+0x48]
   14000639e:	45 8b 04 13          	mov    r8d,DWORD PTR [r11+rdx*1]
   1400063a2:	44 89 44 13 18       	mov    DWORD PTR [rbx+rdx*1+0x18],r8d
   1400063a7:	48 83 c2 04          	add    rdx,0x4
   1400063ab:	4d 8d 04 13          	lea    r8,[r11+rdx*1]
   1400063af:	4c 39 c1             	cmp    rcx,r8
   1400063b2:	73 e5                	jae    140006399 <__gdtoa+0x129>
   1400063b4:	49 8d 53 01          	lea    rdx,[r11+0x1]
   1400063b8:	48 ff c1             	inc    rcx
   1400063bb:	48 39 d1             	cmp    rcx,rdx
   1400063be:	ba 00 00 00 00       	mov    edx,0x0
   1400063c3:	48 0f 42 c2          	cmovb  rax,rdx
   1400063c7:	48 83 c0 04          	add    rax,0x4
   1400063cb:	48 c1 f8 02          	sar    rax,0x2
   1400063cf:	41 89 c4             	mov    r12d,eax
   1400063d2:	48 8d 14 83          	lea    rdx,[rbx+rax*4]
   1400063d6:	44 89 e0             	mov    eax,r12d
   1400063d9:	41 ff cc             	dec    r12d
   1400063dc:	83 7a 14 00          	cmp    DWORD PTR [rdx+0x14],0x0
   1400063e0:	75 12                	jne    1400063f4 <__gdtoa+0x184>
   1400063e2:	48 83 ea 04          	sub    rdx,0x4
   1400063e6:	45 85 e4             	test   r12d,r12d
   1400063e9:	75 eb                	jne    1400063d6 <__gdtoa+0x166>
   1400063eb:	45 31 d2             	xor    r10d,r10d
   1400063ee:	44 89 53 14          	mov    DWORD PTR [rbx+0x14],r10d
   1400063f2:	eb 16                	jmp    14000640a <__gdtoa+0x19a>
   1400063f4:	49 63 d4             	movsxd rdx,r12d
   1400063f7:	89 43 14             	mov    DWORD PTR [rbx+0x14],eax
   1400063fa:	c1 e0 05             	shl    eax,0x5
   1400063fd:	0f bd 54 93 18       	bsr    edx,DWORD PTR [rbx+rdx*4+0x18]
   140006402:	83 f2 1f             	xor    edx,0x1f
   140006405:	29 d0                	sub    eax,edx
   140006407:	41 89 c4             	mov    r12d,eax
   14000640a:	48 89 d9             	mov    rcx,rbx
   14000640d:	e8 9a 11 00 00       	call   1400075ac <__trailz_D2A>
   140006412:	44 8b 9c 24 88 00 00 	mov    r11d,DWORD PTR [rsp+0x88]
   140006419:	00 
   14000641a:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   140006421:	85 c0                	test   eax,eax
   140006423:	74 1f                	je     140006444 <__gdtoa+0x1d4>
   140006425:	89 c2                	mov    edx,eax
   140006427:	48 89 d9             	mov    rcx,rbx
   14000642a:	e8 91 10 00 00       	call   1400074c0 <__rshift_D2A>
   14000642f:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [rsp+0x9c]
   140006436:	8b 8c 24 88 00 00 00 	mov    ecx,DWORD PTR [rsp+0x88]
   14000643d:	41 29 c4             	sub    r12d,eax
   140006440:	44 8d 1c 08          	lea    r11d,[rax+rcx*1]
   140006444:	83 7b 14 00          	cmp    DWORD PTR [rbx+0x14],0x0
   140006448:	75 34                	jne    14000647e <__gdtoa+0x20e>
   14000644a:	48 89 d9             	mov    rcx,rbx
   14000644d:	e8 47 13 00 00       	call   140007799 <__Bfree_D2A>
   140006452:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   140006457:	48 8b 54 24 58       	mov    rdx,QWORD PTR [rsp+0x58]
   14000645c:	41 b8 01 00 00 00    	mov    r8d,0x1
   140006462:	48 8d 0d a4 61 00 00 	lea    rcx,[rip+0x61a4]        # 14000c60d <.rdata+0xd>
   140006469:	c7 00 01 00 00 00    	mov    DWORD PTR [rax],0x1
   14000646f:	e8 58 fc ff ff       	call   1400060cc <__nrv_alloc_D2A>
   140006474:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   140006479:	e9 79 0d 00 00       	jmp    1400071f7 <__gdtoa+0xf87>
   14000647e:	48 8d 94 24 9c 00 00 	lea    rdx,[rsp+0x9c]
   140006485:	00 
   140006486:	48 89 d9             	mov    rcx,rbx
   140006489:	44 89 5c 24 28       	mov    DWORD PTR [rsp+0x28],r11d
   14000648e:	e8 bb 18 00 00       	call   140007d4e <__b2d_D2A>
   140006493:	44 8b 5c 24 28       	mov    r11d,DWORD PTR [rsp+0x28]
   140006498:	66 48 0f 7e c1       	movq   rcx,xmm0
   14000649d:	66 41 0f 7e c1       	movd   r9d,xmm0
   1400064a2:	48 c1 e9 20          	shr    rcx,0x20
   1400064a6:	43 8d 04 23          	lea    eax,[r11+r12*1]
   1400064aa:	81 e1 ff ff 0f 00    	and    ecx,0xfffff
   1400064b0:	8d 50 ff             	lea    edx,[rax-0x1]
   1400064b3:	81 c9 00 00 f0 3f    	or     ecx,0x3ff00000
   1400064b9:	f2 0f 2a ca          	cvtsi2sd xmm1,edx
   1400064bd:	f2 0f 59 0d 63 61 00 	mulsd  xmm1,QWORD PTR [rip+0x6163]        # 14000c628 <.rdata+0x28>
   1400064c4:	00 
   1400064c5:	49 89 c8             	mov    r8,rcx
   1400064c8:	49 c1 e0 20          	shl    r8,0x20
   1400064cc:	4d 09 c1             	or     r9,r8
   1400064cf:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400064d5:	41 29 c0             	sub    r8d,eax
   1400064d8:	66 49 0f 6e c1       	movq   xmm0,r9
   1400064dd:	85 d2                	test   edx,edx
   1400064df:	f2 0f 5c 05 29 61 00 	subsd  xmm0,QWORD PTR [rip+0x6129]        # 14000c610 <.rdata+0x10>
   1400064e6:	00 
   1400064e7:	f2 0f 59 05 29 61 00 	mulsd  xmm0,QWORD PTR [rip+0x6129]        # 14000c618 <.rdata+0x18>
   1400064ee:	00 
   1400064ef:	44 0f 49 c2          	cmovns r8d,edx
   1400064f3:	f2 0f 58 05 25 61 00 	addsd  xmm0,QWORD PTR [rip+0x6125]        # 14000c620 <.rdata+0x20>
   1400064fa:	00 
   1400064fb:	41 81 e8 35 04 00 00 	sub    r8d,0x435
   140006502:	f2 0f 58 c1          	addsd  xmm0,xmm1
   140006506:	45 85 c0             	test   r8d,r8d
   140006509:	7e 11                	jle    14000651c <__gdtoa+0x2ac>
   14000650b:	f2 41 0f 2a c8       	cvtsi2sd xmm1,r8d
   140006510:	f2 0f 59 0d 18 61 00 	mulsd  xmm1,QWORD PTR [rip+0x6118]        # 14000c630 <.rdata+0x30>
   140006517:	00 
   140006518:	f2 0f 58 c1          	addsd  xmm0,xmm1
   14000651c:	0f 57 c9             	xorps  xmm1,xmm1
   14000651f:	f2 44 0f 2c f8       	cvttsd2si r15d,xmm0
   140006524:	66 0f 2f c8          	comisd xmm1,xmm0
   140006528:	76 10                	jbe    14000653a <__gdtoa+0x2ca>
   14000652a:	f2 41 0f 2a cf       	cvtsi2sd xmm1,r15d
   14000652f:	66 0f 2e c8          	ucomisd xmm1,xmm0
   140006533:	7a 02                	jp     140006537 <__gdtoa+0x2c7>
   140006535:	74 03                	je     14000653a <__gdtoa+0x2ca>
   140006537:	41 ff cf             	dec    r15d
   14000653a:	41 89 d2             	mov    r10d,edx
   14000653d:	45 89 c9             	mov    r9d,r9d
   140006540:	c7 44 24 6c 01 00 00 	mov    DWORD PTR [rsp+0x6c],0x1
   140006547:	00 
   140006548:	41 c1 e2 14          	shl    r10d,0x14
   14000654c:	44 01 d1             	add    ecx,r10d
   14000654f:	89 c9                	mov    ecx,ecx
   140006551:	48 c1 e1 20          	shl    rcx,0x20
   140006555:	49 09 c9             	or     r9,rcx
   140006558:	66 49 0f 6e f1       	movq   xmm6,r9
   14000655d:	41 83 ff 16          	cmp    r15d,0x16
   140006561:	77 21                	ja     140006584 <__gdtoa+0x314>
   140006563:	4c 8b 0d e6 64 00 00 	mov    r9,QWORD PTR [rip+0x64e6]        # 14000ca50 <.refptr.__tens_D2A>
   14000656a:	49 63 cf             	movsxd rcx,r15d
   14000656d:	f2 41 0f 10 04 c9    	movsd  xmm0,QWORD PTR [r9+rcx*8]
   140006573:	66 0f 2f c6          	comisd xmm0,xmm6
   140006577:	76 03                	jbe    14000657c <__gdtoa+0x30c>
   140006579:	41 ff cf             	dec    r15d
   14000657c:	45 31 c9             	xor    r9d,r9d
   14000657f:	44 89 4c 24 6c       	mov    DWORD PTR [rsp+0x6c],r9d
   140006584:	44 89 e1             	mov    ecx,r12d
   140006587:	45 31 c0             	xor    r8d,r8d
   14000658a:	29 d1                	sub    ecx,edx
   14000658c:	44 89 44 24 34       	mov    DWORD PTR [rsp+0x34],r8d
   140006591:	89 ca                	mov    edx,ecx
   140006593:	ff ca                	dec    edx
   140006595:	89 54 24 68          	mov    DWORD PTR [rsp+0x68],edx
   140006599:	79 11                	jns    1400065ac <__gdtoa+0x33c>
   14000659b:	ba 01 00 00 00       	mov    edx,0x1
   1400065a0:	29 ca                	sub    edx,ecx
   1400065a2:	31 c9                	xor    ecx,ecx
   1400065a4:	89 54 24 34          	mov    DWORD PTR [rsp+0x34],edx
   1400065a8:	89 4c 24 68          	mov    DWORD PTR [rsp+0x68],ecx
   1400065ac:	45 85 ff             	test   r15d,r15d
   1400065af:	78 0e                	js     1400065bf <__gdtoa+0x34f>
   1400065b1:	44 01 7c 24 68       	add    DWORD PTR [rsp+0x68],r15d
   1400065b6:	31 ed                	xor    ebp,ebp
   1400065b8:	44 89 7c 24 50       	mov    DWORD PTR [rsp+0x50],r15d
   1400065bd:	eb 10                	jmp    1400065cf <__gdtoa+0x35f>
   1400065bf:	31 d2                	xor    edx,edx
   1400065c1:	44 29 7c 24 34       	sub    DWORD PTR [rsp+0x34],r15d
   1400065c6:	44 89 fd             	mov    ebp,r15d
   1400065c9:	89 54 24 50          	mov    DWORD PTR [rsp+0x50],edx
   1400065cd:	f7 dd                	neg    ebp
   1400065cf:	83 7c 24 20 09       	cmp    DWORD PTR [rsp+0x20],0x9
   1400065d4:	77 11                	ja     1400065e7 <__gdtoa+0x377>
   1400065d6:	83 7c 24 20 05       	cmp    DWORD PTR [rsp+0x20],0x5
   1400065db:	7e 12                	jle    1400065ef <__gdtoa+0x37f>
   1400065dd:	83 6c 24 20 04       	sub    DWORD PTR [rsp+0x20],0x4
   1400065e2:	45 31 ed             	xor    r13d,r13d
   1400065e5:	eb 16                	jmp    1400065fd <__gdtoa+0x38d>
   1400065e7:	45 31 ed             	xor    r13d,r13d
   1400065ea:	44 89 6c 24 20       	mov    DWORD PTR [rsp+0x20],r13d
   1400065ef:	05 fd 03 00 00       	add    eax,0x3fd
   1400065f4:	3d f7 07 00 00       	cmp    eax,0x7f7
   1400065f9:	41 0f 96 c5          	setbe  r13b
   1400065fd:	83 7c 24 20 04       	cmp    DWORD PTR [rsp+0x20],0x4
   140006602:	74 52                	je     140006656 <__gdtoa+0x3e6>
   140006604:	83 7c 24 20 05       	cmp    DWORD PTR [rsp+0x20],0x5
   140006609:	74 71                	je     14000667c <__gdtoa+0x40c>
   14000660b:	83 7c 24 20 02       	cmp    DWORD PTR [rsp+0x20],0x2
   140006610:	c7 44 24 38 00 00 00 	mov    DWORD PTR [rsp+0x38],0x0
   140006617:	00 
   140006618:	74 44                	je     14000665e <__gdtoa+0x3ee>
   14000661a:	83 7c 24 20 03       	cmp    DWORD PTR [rsp+0x20],0x3
   14000661f:	74 63                	je     140006684 <__gdtoa+0x414>
   140006621:	f2 0f 2a c6          	cvtsi2sd xmm0,esi
   140006625:	f2 0f 59 05 0b 60 00 	mulsd  xmm0,QWORD PTR [rip+0x600b]        # 14000c638 <.rdata+0x38>
   14000662c:	00 
   14000662d:	45 31 d2             	xor    r10d,r10d
   140006630:	c7 44 24 38 01 00 00 	mov    DWORD PTR [rsp+0x38],0x1
   140006637:	00 
   140006638:	44 89 54 24 40       	mov    DWORD PTR [rsp+0x40],r10d
   14000663d:	41 b9 ff ff ff ff    	mov    r9d,0xffffffff
   140006643:	c7 44 24 3c ff ff ff 	mov    DWORD PTR [rsp+0x3c],0xffffffff
   14000664a:	ff 
   14000664b:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
   14000664f:	83 c1 03             	add    ecx,0x3
   140006652:	89 c8                	mov    eax,ecx
   140006654:	eb 54                	jmp    1400066aa <__gdtoa+0x43a>
   140006656:	c7 44 24 38 01 00 00 	mov    DWORD PTR [rsp+0x38],0x1
   14000665d:	00 
   14000665e:	83 7c 24 40 00       	cmp    DWORD PTR [rsp+0x40],0x0
   140006663:	b9 01 00 00 00       	mov    ecx,0x1
   140006668:	0f 4f 4c 24 40       	cmovg  ecx,DWORD PTR [rsp+0x40]
   14000666d:	89 4c 24 3c          	mov    DWORD PTR [rsp+0x3c],ecx
   140006671:	89 c8                	mov    eax,ecx
   140006673:	41 89 c9             	mov    r9d,ecx
   140006676:	89 4c 24 40          	mov    DWORD PTR [rsp+0x40],ecx
   14000667a:	eb 2e                	jmp    1400066aa <__gdtoa+0x43a>
   14000667c:	c7 44 24 38 01 00 00 	mov    DWORD PTR [rsp+0x38],0x1
   140006683:	00 
   140006684:	8b 44 24 40          	mov    eax,DWORD PTR [rsp+0x40]
   140006688:	44 01 f8             	add    eax,r15d
   14000668b:	44 8d 48 01          	lea    r9d,[rax+0x1]
   14000668f:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   140006693:	45 85 c9             	test   r9d,r9d
   140006696:	7e 08                	jle    1400066a0 <__gdtoa+0x430>
   140006698:	44 89 c8             	mov    eax,r9d
   14000669b:	44 89 c9             	mov    ecx,r9d
   14000669e:	eb 0a                	jmp    1400066aa <__gdtoa+0x43a>
   1400066a0:	b8 01 00 00 00       	mov    eax,0x1
   1400066a5:	b9 01 00 00 00       	mov    ecx,0x1
   1400066aa:	44 89 9c 24 8c 00 00 	mov    DWORD PTR [rsp+0x8c],r11d
   1400066b1:	00 
   1400066b2:	44 89 8c 24 80 00 00 	mov    DWORD PTR [rsp+0x80],r9d
   1400066b9:	00 
   1400066ba:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   1400066c1:	e8 da f9 ff ff       	call   1400060a0 <__rv_alloc_D2A>
   1400066c6:	45 31 c9             	xor    r9d,r9d
   1400066c9:	83 7c 24 20 01       	cmp    DWORD PTR [rsp+0x20],0x1
   1400066ce:	44 8b 9c 24 8c 00 00 	mov    r11d,DWORD PTR [rsp+0x8c]
   1400066d5:	00 
   1400066d6:	44 89 4c 24 30       	mov    DWORD PTR [rsp+0x30],r9d
   1400066db:	44 8b 8c 24 80 00 00 	mov    r9d,DWORD PTR [rsp+0x80]
   1400066e2:	00 
   1400066e3:	48 89 44 24 28       	mov    QWORD PTR [rsp+0x28],rax
   1400066e8:	7e 31                	jle    14000671b <__gdtoa+0x4ab>
   1400066ea:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
   1400066ef:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400066f2:	ff c8                	dec    eax
   1400066f4:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
   1400066f8:	74 21                	je     14000671b <__gdtoa+0x4ab>
   1400066fa:	b8 02 00 00 00       	mov    eax,0x2
   1400066ff:	0f 49 44 24 30       	cmovns eax,DWORD PTR [rsp+0x30]
   140006704:	41 83 e6 08          	and    r14d,0x8
   140006708:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
   14000670c:	74 0d                	je     14000671b <__gdtoa+0x4ab>
   14000670e:	b8 03 00 00 00       	mov    eax,0x3
   140006713:	2b 44 24 30          	sub    eax,DWORD PTR [rsp+0x30]
   140006717:	89 44 24 30          	mov    DWORD PTR [rsp+0x30],eax
   14000671b:	41 83 f9 0e          	cmp    r9d,0xe
   14000671f:	0f 87 e3 01 00 00    	ja     140006908 <__gdtoa+0x698>
   140006725:	45 84 ed             	test   r13b,r13b
   140006728:	0f 84 da 01 00 00    	je     140006908 <__gdtoa+0x698>
   14000672e:	44 8b 6c 24 30       	mov    r13d,DWORD PTR [rsp+0x30]
   140006733:	45 09 fd             	or     r13d,r15d
   140006736:	0f 85 cc 01 00 00    	jne    140006908 <__gdtoa+0x698>
   14000673c:	45 31 c0             	xor    r8d,r8d
   14000673f:	0f 28 c6             	movaps xmm0,xmm6
   140006742:	44 89 84 24 9c 00 00 	mov    DWORD PTR [rsp+0x9c],r8d
   140006749:	00 
   14000674a:	83 7c 24 6c 00       	cmp    DWORD PTR [rsp+0x6c],0x0
   14000674f:	74 37                	je     140006788 <__gdtoa+0x518>
   140006751:	f2 0f 10 0d e7 5e 00 	movsd  xmm1,QWORD PTR [rip+0x5ee7]        # 14000c640 <.rdata+0x40>
   140006758:	00 
   140006759:	66 0f 2f ce          	comisd xmm1,xmm6
   14000675d:	76 29                	jbe    140006788 <__gdtoa+0x518>
   14000675f:	45 85 c9             	test   r9d,r9d
   140006762:	74 29                	je     14000678d <__gdtoa+0x51d>
   140006764:	83 7c 24 3c 00       	cmp    DWORD PTR [rsp+0x3c],0x0
   140006769:	0f 8e 99 01 00 00    	jle    140006908 <__gdtoa+0x698>
   14000676f:	8b 54 24 3c          	mov    edx,DWORD PTR [rsp+0x3c]
   140006773:	41 bd ff ff ff ff    	mov    r13d,0xffffffff
   140006779:	b8 03 00 00 00       	mov    eax,0x3
   14000677e:	f2 0f 59 05 c2 5e 00 	mulsd  xmm0,QWORD PTR [rip+0x5ec2]        # 14000c648 <.rdata+0x48>
   140006785:	00 
   140006786:	eb 0c                	jmp    140006794 <__gdtoa+0x524>
   140006788:	44 89 ca             	mov    edx,r9d
   14000678b:	eb 02                	jmp    14000678f <__gdtoa+0x51f>
   14000678d:	31 d2                	xor    edx,edx
   14000678f:	b8 02 00 00 00       	mov    eax,0x2
   140006794:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
   140006798:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   14000679c:	f2 0f 58 0d ac 5e 00 	addsd  xmm1,QWORD PTR [rip+0x5eac]        # 14000c650 <.rdata+0x50>
   1400067a3:	00 
   1400067a4:	66 48 0f 7e c9       	movq   rcx,xmm1
   1400067a9:	66 0f 7e c8          	movd   eax,xmm1
   1400067ad:	48 c1 e9 20          	shr    rcx,0x20
   1400067b1:	81 e9 00 00 40 03    	sub    ecx,0x3400000
   1400067b7:	48 c1 e1 20          	shl    rcx,0x20
   1400067bb:	48 09 c8             	or     rax,rcx
   1400067be:	66 48 0f 6e c8       	movq   xmm1,rax
   1400067c3:	85 d2                	test   edx,edx
   1400067c5:	75 28                	jne    1400067ef <__gdtoa+0x57f>
   1400067c7:	f2 0f 5c 05 89 5e 00 	subsd  xmm0,QWORD PTR [rip+0x5e89]        # 14000c658 <.rdata+0x58>
   1400067ce:	00 
   1400067cf:	66 0f 2f c1          	comisd xmm0,xmm1
   1400067d3:	0f 87 95 05 00 00    	ja     140006d6e <__gdtoa+0xafe>
   1400067d9:	0f 57 0d 80 5e 00 00 	xorps  xmm1,XMMWORD PTR [rip+0x5e80]        # 14000c660 <.rdata+0x60>
   1400067e0:	66 0f 2f c8          	comisd xmm1,xmm0
   1400067e4:	0f 87 65 01 00 00    	ja     14000694f <__gdtoa+0x6df>
   1400067ea:	e9 19 01 00 00       	jmp    140006908 <__gdtoa+0x698>
   1400067ef:	4c 8b 15 5a 62 00 00 	mov    r10,QWORD PTR [rip+0x625a]        # 14000ca50 <.refptr.__tens_D2A>
   1400067f6:	8d 4a ff             	lea    ecx,[rdx-0x1]
   1400067f9:	48 63 c9             	movsxd rcx,ecx
   1400067fc:	f2 41 0f 10 1c ca    	movsd  xmm3,QWORD PTR [r10+rcx*8]
   140006802:	83 7c 24 38 00       	cmp    DWORD PTR [rsp+0x38],0x0
   140006807:	74 75                	je     14000687e <__gdtoa+0x60e>
   140006809:	f2 0f 10 15 5f 5e 00 	movsd  xmm2,QWORD PTR [rip+0x5e5f]        # 14000c670 <.rdata+0x70>
   140006810:	00 
   140006811:	4c 8b 74 24 28       	mov    r14,QWORD PTR [rsp+0x28]
   140006816:	f2 0f 5e d3          	divsd  xmm2,xmm3
   14000681a:	f2 0f 5c d1          	subsd  xmm2,xmm1
   14000681e:	f2 0f 10 0d 22 5e 00 	movsd  xmm1,QWORD PTR [rip+0x5e22]        # 14000c648 <.rdata+0x48>
   140006825:	00 
   140006826:	f2 0f 2c c0          	cvttsd2si eax,xmm0
   14000682a:	49 ff c6             	inc    r14
   14000682d:	f2 0f 2a e0          	cvtsi2sd xmm4,eax
   140006831:	83 c0 30             	add    eax,0x30
   140006834:	41 88 46 ff          	mov    BYTE PTR [r14-0x1],al
   140006838:	f2 0f 5c c4          	subsd  xmm0,xmm4
   14000683c:	66 0f 2f d0          	comisd xmm2,xmm0
   140006840:	0f 87 9d 00 00 00    	ja     1400068e3 <__gdtoa+0x673>
   140006846:	f2 0f 10 25 f2 5d 00 	movsd  xmm4,QWORD PTR [rip+0x5df2]        # 14000c640 <.rdata+0x40>
   14000684d:	00 
   14000684e:	f2 0f 5c e0          	subsd  xmm4,xmm0
   140006852:	66 0f 2f d4          	comisd xmm2,xmm4
   140006856:	0f 87 92 01 00 00    	ja     1400069ee <__gdtoa+0x77e>
   14000685c:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [rsp+0x9c]
   140006863:	ff c0                	inc    eax
   140006865:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   14000686c:	39 d0                	cmp    eax,edx
   14000686e:	0f 8d 94 00 00 00    	jge    140006908 <__gdtoa+0x698>
   140006874:	f2 0f 59 d1          	mulsd  xmm2,xmm1
   140006878:	f2 0f 59 c1          	mulsd  xmm0,xmm1
   14000687c:	eb a8                	jmp    140006826 <__gdtoa+0x5b6>
   14000687e:	f2 0f 59 cb          	mulsd  xmm1,xmm3
   140006882:	4c 8b 74 24 28       	mov    r14,QWORD PTR [rsp+0x28]
   140006887:	b9 01 00 00 00       	mov    ecx,0x1
   14000688c:	f2 0f 10 15 b4 5d 00 	movsd  xmm2,QWORD PTR [rip+0x5db4]        # 14000c648 <.rdata+0x48>
   140006893:	00 
   140006894:	89 8c 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],ecx
   14000689b:	f2 0f 2c c8          	cvttsd2si ecx,xmm0
   14000689f:	85 c9                	test   ecx,ecx
   1400068a1:	74 08                	je     1400068ab <__gdtoa+0x63b>
   1400068a3:	f2 0f 2a d9          	cvtsi2sd xmm3,ecx
   1400068a7:	f2 0f 5c c3          	subsd  xmm0,xmm3
   1400068ab:	83 c1 30             	add    ecx,0x30
   1400068ae:	49 ff c6             	inc    r14
   1400068b1:	41 88 4e ff          	mov    BYTE PTR [r14-0x1],cl
   1400068b5:	8b 8c 24 9c 00 00 00 	mov    ecx,DWORD PTR [rsp+0x9c]
   1400068bc:	39 d1                	cmp    ecx,edx
   1400068be:	75 40                	jne    140006900 <__gdtoa+0x690>
   1400068c0:	f2 0f 10 15 a8 5d 00 	movsd  xmm2,QWORD PTR [rip+0x5da8]        # 14000c670 <.rdata+0x70>
   1400068c7:	00 
   1400068c8:	0f 28 d9             	movaps xmm3,xmm1
   1400068cb:	f2 0f 58 da          	addsd  xmm3,xmm2
   1400068cf:	66 0f 2f c3          	comisd xmm0,xmm3
   1400068d3:	0f 87 15 01 00 00    	ja     1400069ee <__gdtoa+0x77e>
   1400068d9:	f2 0f 5c d1          	subsd  xmm2,xmm1
   1400068dd:	66 0f 2f d0          	comisd xmm2,xmm0
   1400068e1:	76 25                	jbe    140006908 <__gdtoa+0x698>
   1400068e3:	0f 57 c9             	xorps  xmm1,xmm1
   1400068e6:	31 ff                	xor    edi,edi
   1400068e8:	b8 01 00 00 00       	mov    eax,0x1
   1400068ed:	66 0f 2e c1          	ucomisd xmm0,xmm1
   1400068f1:	40 0f 9a c7          	setp   dil
   1400068f5:	0f 45 f8             	cmovne edi,eax
   1400068f8:	c1 e7 04             	shl    edi,0x4
   1400068fb:	e9 96 08 00 00       	jmp    140007196 <__gdtoa+0xf26>
   140006900:	f2 0f 59 c2          	mulsd  xmm0,xmm2
   140006904:	ff c1                	inc    ecx
   140006906:	eb 8c                	jmp    140006894 <__gdtoa+0x624>
   140006908:	45 85 db             	test   r11d,r11d
   14000690b:	0f 88 1d 01 00 00    	js     140006a2e <__gdtoa+0x7be>
   140006911:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
   140006916:	44 39 78 14          	cmp    DWORD PTR [rax+0x14],r15d
   14000691a:	0f 8c 0e 01 00 00    	jl     140006a2e <__gdtoa+0x7be>
   140006920:	48 8b 15 29 61 00 00 	mov    rdx,QWORD PTR [rip+0x6129]        # 14000ca50 <.refptr.__tens_D2A>
   140006927:	49 63 c7             	movsxd rax,r15d
   14000692a:	f2 0f 10 04 c2       	movsd  xmm0,QWORD PTR [rdx+rax*8]
   14000692f:	83 7c 24 40 00       	cmp    DWORD PTR [rsp+0x40],0x0
   140006934:	79 22                	jns    140006958 <__gdtoa+0x6e8>
   140006936:	45 85 c9             	test   r9d,r9d
   140006939:	7f 1d                	jg     140006958 <__gdtoa+0x6e8>
   14000693b:	75 12                	jne    14000694f <__gdtoa+0x6df>
   14000693d:	f2 0f 59 05 13 5d 00 	mulsd  xmm0,QWORD PTR [rip+0x5d13]        # 14000c658 <.rdata+0x58>
   140006944:	00 
   140006945:	66 0f 2f c6          	comisd xmm0,xmm6
   140006949:	0f 82 1c 04 00 00    	jb     140006d6b <__gdtoa+0xafb>
   14000694f:	31 ed                	xor    ebp,ebp
   140006951:	31 f6                	xor    esi,esi
   140006953:	e9 f9 03 00 00       	jmp    140006d51 <__gdtoa+0xae1>
   140006958:	4c 8b 74 24 28       	mov    r14,QWORD PTR [rsp+0x28]
   14000695d:	f2 0f 10 15 e3 5c 00 	movsd  xmm2,QWORD PTR [rip+0x5ce3]        # 14000c648 <.rdata+0x48>
   140006964:	00 
   140006965:	0f 57 db             	xorps  xmm3,xmm3
   140006968:	c7 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],0x1
   14000696f:	01 00 00 00 
   140006973:	0f 28 ce             	movaps xmm1,xmm6
   140006976:	49 ff c6             	inc    r14
   140006979:	f2 0f 5e c8          	divsd  xmm1,xmm0
   14000697d:	f2 0f 2c c1          	cvttsd2si eax,xmm1
   140006981:	f2 0f 2a c8          	cvtsi2sd xmm1,eax
   140006985:	8d 50 30             	lea    edx,[rax+0x30]
   140006988:	41 88 56 ff          	mov    BYTE PTR [r14-0x1],dl
   14000698c:	f2 0f 59 c8          	mulsd  xmm1,xmm0
   140006990:	f2 0f 5c f1          	subsd  xmm6,xmm1
   140006994:	66 0f 2e f3          	ucomisd xmm6,xmm3
   140006998:	7a 06                	jp     1400069a0 <__gdtoa+0x730>
   14000699a:	0f 84 21 08 00 00    	je     1400071c1 <__gdtoa+0xf51>
   1400069a0:	8b 94 24 9c 00 00 00 	mov    edx,DWORD PTR [rsp+0x9c]
   1400069a7:	44 39 ca             	cmp    edx,r9d
   1400069aa:	75 70                	jne    140006a1c <__gdtoa+0x7ac>
   1400069ac:	83 7c 24 30 00       	cmp    DWORD PTR [rsp+0x30],0x0
   1400069b1:	74 12                	je     1400069c5 <__gdtoa+0x755>
   1400069b3:	bf 10 00 00 00       	mov    edi,0x10
   1400069b8:	83 7c 24 30 01       	cmp    DWORD PTR [rsp+0x30],0x1
   1400069bd:	0f 85 fe 07 00 00    	jne    1400071c1 <__gdtoa+0xf51>
   1400069c3:	eb 2c                	jmp    1400069f1 <__gdtoa+0x781>
   1400069c5:	f2 0f 58 f6          	addsd  xmm6,xmm6
   1400069c9:	66 0f 2f f0          	comisd xmm6,xmm0
   1400069cd:	77 22                	ja     1400069f1 <__gdtoa+0x781>
   1400069cf:	66 0f 2e f0          	ucomisd xmm6,xmm0
   1400069d3:	bf 10 00 00 00       	mov    edi,0x10
   1400069d8:	0f 8a e3 07 00 00    	jp     1400071c1 <__gdtoa+0xf51>
   1400069de:	0f 85 dd 07 00 00    	jne    1400071c1 <__gdtoa+0xf51>
   1400069e4:	a8 01                	test   al,0x1
   1400069e6:	0f 84 d5 07 00 00    	je     1400071c1 <__gdtoa+0xf51>
   1400069ec:	eb 03                	jmp    1400069f1 <__gdtoa+0x781>
   1400069ee:	45 89 ef             	mov    r15d,r13d
   1400069f1:	4c 89 f0             	mov    rax,r14
   1400069f4:	49 89 c6             	mov    r14,rax
   1400069f7:	8a 50 ff             	mov    dl,BYTE PTR [rax-0x1]
   1400069fa:	48 ff c8             	dec    rax
   1400069fd:	80 fa 39             	cmp    dl,0x39
   140006a00:	75 0c                	jne    140006a0e <__gdtoa+0x79e>
   140006a02:	48 39 44 24 28       	cmp    QWORD PTR [rsp+0x28],rax
   140006a07:	75 eb                	jne    1400069f4 <__gdtoa+0x784>
   140006a09:	41 ff c7             	inc    r15d
   140006a0c:	b2 30                	mov    dl,0x30
   140006a0e:	ff c2                	inc    edx
   140006a10:	bf 20 00 00 00       	mov    edi,0x20
   140006a15:	88 10                	mov    BYTE PTR [rax],dl
   140006a17:	e9 a5 07 00 00       	jmp    1400071c1 <__gdtoa+0xf51>
   140006a1c:	f2 0f 59 f2          	mulsd  xmm6,xmm2
   140006a20:	ff c2                	inc    edx
   140006a22:	89 94 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],edx
   140006a29:	e9 45 ff ff ff       	jmp    140006973 <__gdtoa+0x703>
   140006a2e:	83 7c 24 38 00       	cmp    DWORD PTR [rsp+0x38],0x0
   140006a33:	0f 84 d8 00 00 00    	je     140006b11 <__gdtoa+0x8a1>
   140006a39:	44 29 e6             	sub    esi,r12d
   140006a3c:	45 89 da             	mov    r10d,r11d
   140006a3f:	89 f2                	mov    edx,esi
   140006a41:	8d 46 01             	lea    eax,[rsi+0x1]
   140006a44:	48 8b 74 24 60       	mov    rsi,QWORD PTR [rsp+0x60]
   140006a49:	41 29 d2             	sub    r10d,edx
   140006a4c:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   140006a53:	8b 4e 04             	mov    ecx,DWORD PTR [rsi+0x4]
   140006a56:	41 39 ca             	cmp    r10d,ecx
   140006a59:	7d 34                	jge    140006a8f <__gdtoa+0x81f>
   140006a5b:	8b 44 24 20          	mov    eax,DWORD PTR [rsp+0x20]
   140006a5f:	83 e8 03             	sub    eax,0x3
   140006a62:	83 e0 fd             	and    eax,0xfffffffd
   140006a65:	75 0a                	jne    140006a71 <__gdtoa+0x801>
   140006a67:	41 8d 51 ff          	lea    edx,[r9-0x1]
   140006a6b:	39 d5                	cmp    ebp,edx
   140006a6d:	7d 2c                	jge    140006a9b <__gdtoa+0x82b>
   140006a6f:	eb 47                	jmp    140006ab8 <__gdtoa+0x848>
   140006a71:	44 89 d8             	mov    eax,r11d
   140006a74:	29 c8                	sub    eax,ecx
   140006a76:	ff c0                	inc    eax
   140006a78:	45 85 c9             	test   r9d,r9d
   140006a7b:	0f 9f c1             	setg   cl
   140006a7e:	44 39 c8             	cmp    eax,r9d
   140006a81:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   140006a88:	0f 9f c2             	setg   dl
   140006a8b:	84 d1                	test   cl,dl
   140006a8d:	74 07                	je     140006a96 <__gdtoa+0x826>
   140006a8f:	83 7c 24 20 01       	cmp    DWORD PTR [rsp+0x20],0x1
   140006a94:	7f d1                	jg     140006a67 <__gdtoa+0x7f7>
   140006a96:	41 89 ed             	mov    r13d,ebp
   140006a99:	eb 16                	jmp    140006ab1 <__gdtoa+0x841>
   140006a9b:	41 89 ed             	mov    r13d,ebp
   140006a9e:	41 29 d5             	sub    r13d,edx
   140006aa1:	45 85 c9             	test   r9d,r9d
   140006aa4:	78 31                	js     140006ad7 <__gdtoa+0x867>
   140006aa6:	44 89 8c 24 9c 00 00 	mov    DWORD PTR [rsp+0x9c],r9d
   140006aad:	00 
   140006aae:	44 89 c8             	mov    eax,r9d
   140006ab1:	44 8b 74 24 34       	mov    r14d,DWORD PTR [rsp+0x34]
   140006ab6:	eb 32                	jmp    140006aea <__gdtoa+0x87a>
   140006ab8:	89 d0                	mov    eax,edx
   140006aba:	44 89 8c 24 9c 00 00 	mov    DWORD PTR [rsp+0x9c],r9d
   140006ac1:	00 
   140006ac2:	44 8b 74 24 34       	mov    r14d,DWORD PTR [rsp+0x34]
   140006ac7:	45 31 ed             	xor    r13d,r13d
   140006aca:	29 e8                	sub    eax,ebp
   140006acc:	89 d5                	mov    ebp,edx
   140006ace:	01 44 24 50          	add    DWORD PTR [rsp+0x50],eax
   140006ad2:	44 89 c8             	mov    eax,r9d
   140006ad5:	eb 13                	jmp    140006aea <__gdtoa+0x87a>
   140006ad7:	31 c9                	xor    ecx,ecx
   140006ad9:	44 8b 74 24 34       	mov    r14d,DWORD PTR [rsp+0x34]
   140006ade:	31 c0                	xor    eax,eax
   140006ae0:	89 8c 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],ecx
   140006ae7:	45 29 ce             	sub    r14d,r9d
   140006aea:	b9 01 00 00 00       	mov    ecx,0x1
   140006aef:	44 89 8c 24 80 00 00 	mov    DWORD PTR [rsp+0x80],r9d
   140006af6:	00 
   140006af7:	01 44 24 34          	add    DWORD PTR [rsp+0x34],eax
   140006afb:	01 44 24 68          	add    DWORD PTR [rsp+0x68],eax
   140006aff:	e8 73 0d 00 00       	call   140007877 <__i2b_D2A>
   140006b04:	44 8b 8c 24 80 00 00 	mov    r9d,DWORD PTR [rsp+0x80]
   140006b0b:	00 
   140006b0c:	48 89 c6             	mov    rsi,rax
   140006b0f:	eb 0a                	jmp    140006b1b <__gdtoa+0x8ab>
   140006b11:	44 8b 74 24 34       	mov    r14d,DWORD PTR [rsp+0x34]
   140006b16:	41 89 ed             	mov    r13d,ebp
   140006b19:	31 f6                	xor    esi,esi
   140006b1b:	45 85 f6             	test   r14d,r14d
   140006b1e:	74 24                	je     140006b44 <__gdtoa+0x8d4>
   140006b20:	83 7c 24 68 00       	cmp    DWORD PTR [rsp+0x68],0x0
   140006b25:	7e 1d                	jle    140006b44 <__gdtoa+0x8d4>
   140006b27:	8b 44 24 68          	mov    eax,DWORD PTR [rsp+0x68]
   140006b2b:	41 39 c6             	cmp    r14d,eax
   140006b2e:	41 0f 4e c6          	cmovle eax,r14d
   140006b32:	29 44 24 34          	sub    DWORD PTR [rsp+0x34],eax
   140006b36:	29 44 24 68          	sub    DWORD PTR [rsp+0x68],eax
   140006b3a:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   140006b41:	41 29 c6             	sub    r14d,eax
   140006b44:	85 ed                	test   ebp,ebp
   140006b46:	0f 84 84 00 00 00    	je     140006bd0 <__gdtoa+0x960>
   140006b4c:	83 7c 24 38 00       	cmp    DWORD PTR [rsp+0x38],0x0
   140006b51:	74 60                	je     140006bb3 <__gdtoa+0x943>
   140006b53:	48 89 d8             	mov    rax,rbx
   140006b56:	45 85 ed             	test   r13d,r13d
   140006b59:	74 49                	je     140006ba4 <__gdtoa+0x934>
   140006b5b:	48 89 f1             	mov    rcx,rsi
   140006b5e:	44 89 ea             	mov    edx,r13d
   140006b61:	44 89 8c 24 8c 00 00 	mov    DWORD PTR [rsp+0x8c],r9d
   140006b68:	00 
   140006b69:	e8 4a 0e 00 00       	call   1400079b8 <__pow5mult_D2A>
   140006b6e:	48 89 da             	mov    rdx,rbx
   140006b71:	48 89 c1             	mov    rcx,rax
   140006b74:	48 89 c6             	mov    rsi,rax
   140006b77:	e8 21 0d 00 00       	call   14000789d <__mult_D2A>
   140006b7c:	48 89 d9             	mov    rcx,rbx
   140006b7f:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   140006b86:	00 
   140006b87:	e8 0d 0c 00 00       	call   140007799 <__Bfree_D2A>
   140006b8c:	48 8b 84 24 80 00 00 	mov    rax,QWORD PTR [rsp+0x80]
   140006b93:	00 
   140006b94:	44 29 ed             	sub    ebp,r13d
   140006b97:	44 8b 8c 24 8c 00 00 	mov    r9d,DWORD PTR [rsp+0x8c]
   140006b9e:	00 
   140006b9f:	48 89 c3             	mov    rbx,rax
   140006ba2:	74 2c                	je     140006bd0 <__gdtoa+0x960>
   140006ba4:	44 89 8c 24 80 00 00 	mov    DWORD PTR [rsp+0x80],r9d
   140006bab:	00 
   140006bac:	89 ea                	mov    edx,ebp
   140006bae:	48 89 c1             	mov    rcx,rax
   140006bb1:	eb 0d                	jmp    140006bc0 <__gdtoa+0x950>
   140006bb3:	44 89 8c 24 80 00 00 	mov    DWORD PTR [rsp+0x80],r9d
   140006bba:	00 
   140006bbb:	89 ea                	mov    edx,ebp
   140006bbd:	48 89 d9             	mov    rcx,rbx
   140006bc0:	e8 f3 0d 00 00       	call   1400079b8 <__pow5mult_D2A>
   140006bc5:	44 8b 8c 24 80 00 00 	mov    r9d,DWORD PTR [rsp+0x80]
   140006bcc:	00 
   140006bcd:	48 89 c3             	mov    rbx,rax
   140006bd0:	b9 01 00 00 00       	mov    ecx,0x1
   140006bd5:	44 89 8c 24 80 00 00 	mov    DWORD PTR [rsp+0x80],r9d
   140006bdc:	00 
   140006bdd:	e8 95 0c 00 00       	call   140007877 <__i2b_D2A>
   140006be2:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140006be7:	44 8b 8c 24 80 00 00 	mov    r9d,DWORD PTR [rsp+0x80]
   140006bee:	00 
   140006bef:	48 89 c5             	mov    rbp,rax
   140006bf2:	74 17                	je     140006c0b <__gdtoa+0x99b>
   140006bf4:	8b 54 24 50          	mov    edx,DWORD PTR [rsp+0x50]
   140006bf8:	48 89 c1             	mov    rcx,rax
   140006bfb:	e8 b8 0d 00 00       	call   1400079b8 <__pow5mult_D2A>
   140006c00:	44 8b 8c 24 80 00 00 	mov    r9d,DWORD PTR [rsp+0x80]
   140006c07:	00 
   140006c08:	48 89 c5             	mov    rbp,rax
   140006c0b:	83 7c 24 20 01       	cmp    DWORD PTR [rsp+0x20],0x1
   140006c10:	7f 30                	jg     140006c42 <__gdtoa+0x9d2>
   140006c12:	41 ff cc             	dec    r12d
   140006c15:	75 2b                	jne    140006c42 <__gdtoa+0x9d2>
   140006c17:	48 8b 44 24 60       	mov    rax,QWORD PTR [rsp+0x60]
   140006c1c:	31 d2                	xor    edx,edx
   140006c1e:	89 54 24 60          	mov    DWORD PTR [rsp+0x60],edx
   140006c22:	8b 40 04             	mov    eax,DWORD PTR [rax+0x4]
   140006c25:	ff c0                	inc    eax
   140006c27:	3b 84 24 88 00 00 00 	cmp    eax,DWORD PTR [rsp+0x88]
   140006c2e:	7d 18                	jge    140006c48 <__gdtoa+0x9d8>
   140006c30:	ff 44 24 34          	inc    DWORD PTR [rsp+0x34]
   140006c34:	ff 44 24 68          	inc    DWORD PTR [rsp+0x68]
   140006c38:	c7 44 24 60 01 00 00 	mov    DWORD PTR [rsp+0x60],0x1
   140006c3f:	00 
   140006c40:	eb 06                	jmp    140006c48 <__gdtoa+0x9d8>
   140006c42:	31 c0                	xor    eax,eax
   140006c44:	89 44 24 60          	mov    DWORD PTR [rsp+0x60],eax
   140006c48:	41 bc 1f 00 00 00    	mov    r12d,0x1f
   140006c4e:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140006c53:	74 11                	je     140006c66 <__gdtoa+0x9f6>
   140006c55:	8b 45 14             	mov    eax,DWORD PTR [rbp+0x14]
   140006c58:	ff c8                	dec    eax
   140006c5a:	48 98                	cdqe
   140006c5c:	44 0f bd 64 85 18    	bsr    r12d,DWORD PTR [rbp+rax*4+0x18]
   140006c62:	41 83 f4 1f          	xor    r12d,0x1f
   140006c66:	44 2b 64 24 68       	sub    r12d,DWORD PTR [rsp+0x68]
   140006c6b:	8b 54 24 34          	mov    edx,DWORD PTR [rsp+0x34]
   140006c6f:	41 83 ec 04          	sub    r12d,0x4
   140006c73:	41 83 e4 1f          	and    r12d,0x1f
   140006c77:	44 01 e2             	add    edx,r12d
   140006c7a:	44 89 a4 24 9c 00 00 	mov    DWORD PTR [rsp+0x9c],r12d
   140006c81:	00 
   140006c82:	85 d2                	test   edx,edx
   140006c84:	7e 15                	jle    140006c9b <__gdtoa+0xa2b>
   140006c86:	48 89 d9             	mov    rcx,rbx
   140006c89:	44 89 4c 24 34       	mov    DWORD PTR [rsp+0x34],r9d
   140006c8e:	e8 32 0e 00 00       	call   140007ac5 <__lshift_D2A>
   140006c93:	44 8b 4c 24 34       	mov    r9d,DWORD PTR [rsp+0x34]
   140006c98:	48 89 c3             	mov    rbx,rax
   140006c9b:	8b 54 24 68          	mov    edx,DWORD PTR [rsp+0x68]
   140006c9f:	03 94 24 9c 00 00 00 	add    edx,DWORD PTR [rsp+0x9c]
   140006ca6:	85 d2                	test   edx,edx
   140006ca8:	7e 15                	jle    140006cbf <__gdtoa+0xa4f>
   140006caa:	48 89 e9             	mov    rcx,rbp
   140006cad:	44 89 4c 24 34       	mov    DWORD PTR [rsp+0x34],r9d
   140006cb2:	e8 0e 0e 00 00       	call   140007ac5 <__lshift_D2A>
   140006cb7:	44 8b 4c 24 34       	mov    r9d,DWORD PTR [rsp+0x34]
   140006cbc:	48 89 c5             	mov    rbp,rax
   140006cbf:	83 7c 24 6c 00       	cmp    DWORD PTR [rsp+0x6c],0x0
   140006cc4:	74 19                	je     140006cdf <__gdtoa+0xa6f>
   140006cc6:	48 89 ea             	mov    rdx,rbp
   140006cc9:	48 89 d9             	mov    rcx,rbx
   140006ccc:	44 89 4c 24 34       	mov    DWORD PTR [rsp+0x34],r9d
   140006cd1:	e8 fa 0e 00 00       	call   140007bd0 <__cmp_D2A>
   140006cd6:	44 8b 4c 24 34       	mov    r9d,DWORD PTR [rsp+0x34]
   140006cdb:	85 c0                	test   eax,eax
   140006cdd:	78 0a                	js     140006ce9 <__gdtoa+0xa79>
   140006cdf:	44 89 4c 24 3c       	mov    DWORD PTR [rsp+0x3c],r9d
   140006ce4:	45 89 fd             	mov    r13d,r15d
   140006ce7:	eb 31                	jmp    140006d1a <__gdtoa+0xaaa>
   140006ce9:	48 89 d9             	mov    rcx,rbx
   140006cec:	45 31 c0             	xor    r8d,r8d
   140006cef:	45 8d 6f ff          	lea    r13d,[r15-0x1]
   140006cf3:	ba 0a 00 00 00       	mov    edx,0xa
   140006cf8:	e8 e8 0a 00 00       	call   1400077e5 <__multadd_D2A>
   140006cfd:	48 89 c3             	mov    rbx,rax
   140006d00:	83 7c 24 38 00       	cmp    DWORD PTR [rsp+0x38],0x0
   140006d05:	74 13                	je     140006d1a <__gdtoa+0xaaa>
   140006d07:	48 89 f1             	mov    rcx,rsi
   140006d0a:	45 31 c0             	xor    r8d,r8d
   140006d0d:	ba 0a 00 00 00       	mov    edx,0xa
   140006d12:	e8 ce 0a 00 00       	call   1400077e5 <__multadd_D2A>
   140006d17:	48 89 c6             	mov    rsi,rax
   140006d1a:	83 7c 24 3c 00       	cmp    DWORD PTR [rsp+0x3c],0x0
   140006d1f:	7f 68                	jg     140006d89 <__gdtoa+0xb19>
   140006d21:	83 7c 24 20 02       	cmp    DWORD PTR [rsp+0x20],0x2
   140006d26:	7e 61                	jle    140006d89 <__gdtoa+0xb19>
   140006d28:	83 7c 24 3c 00       	cmp    DWORD PTR [rsp+0x3c],0x0
   140006d2d:	75 22                	jne    140006d51 <__gdtoa+0xae1>
   140006d2f:	48 89 e9             	mov    rcx,rbp
   140006d32:	45 31 c0             	xor    r8d,r8d
   140006d35:	ba 05 00 00 00       	mov    edx,0x5
   140006d3a:	e8 a6 0a 00 00       	call   1400077e5 <__multadd_D2A>
   140006d3f:	48 89 d9             	mov    rcx,rbx
   140006d42:	48 89 c2             	mov    rdx,rax
   140006d45:	48 89 c5             	mov    rbp,rax
   140006d48:	e8 83 0e 00 00       	call   140007bd0 <__cmp_D2A>
   140006d4d:	85 c0                	test   eax,eax
   140006d4f:	7f 21                	jg     140006d72 <__gdtoa+0xb02>
   140006d51:	44 8b 6c 24 40       	mov    r13d,DWORD PTR [rsp+0x40]
   140006d56:	4c 8b 74 24 28       	mov    r14,QWORD PTR [rsp+0x28]
   140006d5b:	45 31 e4             	xor    r12d,r12d
   140006d5e:	bf 10 00 00 00       	mov    edi,0x10
   140006d63:	41 f7 d5             	not    r13d
   140006d66:	e9 1e 04 00 00       	jmp    140007189 <__gdtoa+0xf19>
   140006d6b:	45 89 fd             	mov    r13d,r15d
   140006d6e:	31 ed                	xor    ebp,ebp
   140006d70:	31 f6                	xor    esi,esi
   140006d72:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   140006d77:	41 ff c5             	inc    r13d
   140006d7a:	45 31 e4             	xor    r12d,r12d
   140006d7d:	c6 00 31             	mov    BYTE PTR [rax],0x31
   140006d80:	4c 8d 70 01          	lea    r14,[rax+0x1]
   140006d84:	e9 a3 02 00 00       	jmp    14000702c <__gdtoa+0xdbc>
   140006d89:	83 7c 24 38 00       	cmp    DWORD PTR [rsp+0x38],0x0
   140006d8e:	0f 84 14 03 00 00    	je     1400070a8 <__gdtoa+0xe38>
   140006d94:	43 8d 14 34          	lea    edx,[r12+r14*1]
   140006d98:	85 d2                	test   edx,edx
   140006d9a:	7e 0b                	jle    140006da7 <__gdtoa+0xb37>
   140006d9c:	48 89 f1             	mov    rcx,rsi
   140006d9f:	e8 21 0d 00 00       	call   140007ac5 <__lshift_D2A>
   140006da4:	48 89 c6             	mov    rsi,rax
   140006da7:	48 89 f0             	mov    rax,rsi
   140006daa:	83 7c 24 60 00       	cmp    DWORD PTR [rsp+0x60],0x0
   140006daf:	74 32                	je     140006de3 <__gdtoa+0xb73>
   140006db1:	8b 4e 08             	mov    ecx,DWORD PTR [rsi+0x8]
   140006db4:	e8 2a 09 00 00       	call   1400076e3 <__Balloc_D2A>
   140006db9:	48 8d 56 10          	lea    rdx,[rsi+0x10]
   140006dbd:	49 89 c4             	mov    r12,rax
   140006dc0:	48 63 46 14          	movsxd rax,DWORD PTR [rsi+0x14]
   140006dc4:	49 8d 4c 24 10       	lea    rcx,[r12+0x10]
   140006dc9:	4c 8d 04 85 08 00 00 	lea    r8,[rax*4+0x8]
   140006dd0:	00 
   140006dd1:	e8 22 3e 00 00       	call   14000abf8 <memcpy>
   140006dd6:	ba 01 00 00 00       	mov    edx,0x1
   140006ddb:	4c 89 e1             	mov    rcx,r12
   140006dde:	e8 e2 0c 00 00       	call   140007ac5 <__lshift_D2A>
   140006de3:	83 7c 24 30 02       	cmp    DWORD PTR [rsp+0x30],0x2
   140006de8:	8b 54 24 38          	mov    edx,DWORD PTR [rsp+0x38]
   140006dec:	49 89 f4             	mov    r12,rsi
   140006def:	48 89 c6             	mov    rsi,rax
   140006df2:	4c 8b 4c 24 28       	mov    r9,QWORD PTR [rsp+0x28]
   140006df7:	0f 95 44 24 68       	setne  BYTE PTR [rsp+0x68]
   140006dfc:	89 94 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],edx
   140006e03:	48 89 d9             	mov    rcx,rbx
   140006e06:	48 89 ea             	mov    rdx,rbp
   140006e09:	4c 89 4c 24 40       	mov    QWORD PTR [rsp+0x40],r9
   140006e0e:	e8 14 f3 ff ff       	call   140006127 <__quorem_D2A>
   140006e13:	4c 89 e2             	mov    rdx,r12
   140006e16:	48 89 d9             	mov    rcx,rbx
   140006e19:	89 44 24 34          	mov    DWORD PTR [rsp+0x34],eax
   140006e1d:	44 8d 78 30          	lea    r15d,[rax+0x30]
   140006e21:	e8 aa 0d 00 00       	call   140007bd0 <__cmp_D2A>
   140006e26:	48 89 f2             	mov    rdx,rsi
   140006e29:	48 89 e9             	mov    rcx,rbp
   140006e2c:	41 89 c6             	mov    r14d,eax
   140006e2f:	e8 e0 0d 00 00       	call   140007c14 <__diff_D2A>
   140006e34:	8b 54 24 38          	mov    edx,DWORD PTR [rsp+0x38]
   140006e38:	4c 8b 4c 24 40       	mov    r9,QWORD PTR [rsp+0x40]
   140006e3d:	83 78 10 00          	cmp    DWORD PTR [rax+0x10],0x0
   140006e41:	49 89 c2             	mov    r10,rax
   140006e44:	75 21                	jne    140006e67 <__gdtoa+0xbf7>
   140006e46:	48 89 c2             	mov    rdx,rax
   140006e49:	48 89 d9             	mov    rcx,rbx
   140006e4c:	4c 89 4c 24 50       	mov    QWORD PTR [rsp+0x50],r9
   140006e51:	48 89 44 24 40       	mov    QWORD PTR [rsp+0x40],rax
   140006e56:	e8 75 0d 00 00       	call   140007bd0 <__cmp_D2A>
   140006e5b:	4c 8b 4c 24 50       	mov    r9,QWORD PTR [rsp+0x50]
   140006e60:	4c 8b 54 24 40       	mov    r10,QWORD PTR [rsp+0x40]
   140006e65:	89 c2                	mov    edx,eax
   140006e67:	4c 89 d1             	mov    rcx,r10
   140006e6a:	4c 89 4c 24 50       	mov    QWORD PTR [rsp+0x50],r9
   140006e6f:	89 54 24 40          	mov    DWORD PTR [rsp+0x40],edx
   140006e73:	e8 21 09 00 00       	call   140007799 <__Bfree_D2A>
   140006e78:	8b 44 24 20          	mov    eax,DWORD PTR [rsp+0x20]
   140006e7c:	8b 54 24 40          	mov    edx,DWORD PTR [rsp+0x40]
   140006e80:	4c 8b 4c 24 50       	mov    r9,QWORD PTR [rsp+0x50]
   140006e85:	09 d0                	or     eax,edx
   140006e87:	75 52                	jne    140006edb <__gdtoa+0xc6b>
   140006e89:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   140006e8e:	8b 00                	mov    eax,DWORD PTR [rax]
   140006e90:	89 44 24 40          	mov    DWORD PTR [rsp+0x40],eax
   140006e94:	83 e0 01             	and    eax,0x1
   140006e97:	0b 44 24 30          	or     eax,DWORD PTR [rsp+0x30]
   140006e9b:	75 3e                	jne    140006edb <__gdtoa+0xc6b>
   140006e9d:	41 83 ff 39          	cmp    r15d,0x39
   140006ea1:	0f 84 71 01 00 00    	je     140007018 <__gdtoa+0xda8>
   140006ea7:	45 85 f6             	test   r14d,r14d
   140006eaa:	7f 21                	jg     140006ecd <__gdtoa+0xc5d>
   140006eac:	bf 10 00 00 00       	mov    edi,0x10
   140006eb1:	83 7b 14 01          	cmp    DWORD PTR [rbx+0x14],0x1
   140006eb5:	0f 8f 3c 01 00 00    	jg     140006ff7 <__gdtoa+0xd87>
   140006ebb:	31 ff                	xor    edi,edi
   140006ebd:	83 7b 18 00          	cmp    DWORD PTR [rbx+0x18],0x0
   140006ec1:	40 0f 95 c7          	setne  dil
   140006ec5:	c1 e7 04             	shl    edi,0x4
   140006ec8:	e9 2a 01 00 00       	jmp    140006ff7 <__gdtoa+0xd87>
   140006ecd:	44 8b 7c 24 34       	mov    r15d,DWORD PTR [rsp+0x34]
   140006ed2:	41 83 c7 31          	add    r15d,0x31
   140006ed6:	e9 b8 00 00 00       	jmp    140006f93 <__gdtoa+0xd23>
   140006edb:	45 85 f6             	test   r14d,r14d
   140006ede:	78 19                	js     140006ef9 <__gdtoa+0xc89>
   140006ee0:	44 0b 74 24 20       	or     r14d,DWORD PTR [rsp+0x20]
   140006ee5:	0f 85 18 01 00 00    	jne    140007003 <__gdtoa+0xd93>
   140006eeb:	48 8b 44 24 48       	mov    rax,QWORD PTR [rsp+0x48]
   140006ef0:	f6 00 01             	test   BYTE PTR [rax],0x1
   140006ef3:	0f 85 0a 01 00 00    	jne    140007003 <__gdtoa+0xd93>
   140006ef9:	83 7c 24 30 00       	cmp    DWORD PTR [rsp+0x30],0x0
   140006efe:	0f 84 96 00 00 00    	je     140006f9a <__gdtoa+0xd2a>
   140006f04:	83 7b 14 01          	cmp    DWORD PTR [rbx+0x14],0x1
   140006f08:	7f 0a                	jg     140006f14 <__gdtoa+0xca4>
   140006f0a:	83 7b 18 00          	cmp    DWORD PTR [rbx+0x18],0x0
   140006f0e:	0f 84 86 00 00 00    	je     140006f9a <__gdtoa+0xd2a>
   140006f14:	83 7c 24 30 02       	cmp    DWORD PTR [rsp+0x30],0x2
   140006f19:	0f 84 d3 00 00 00    	je     140006ff2 <__gdtoa+0xd82>
   140006f1f:	48 89 f2             	mov    rdx,rsi
   140006f22:	48 89 e9             	mov    rcx,rbp
   140006f25:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   140006f2a:	e8 a1 0c 00 00       	call   140007bd0 <__cmp_D2A>
   140006f2f:	4c 8b 4c 24 20       	mov    r9,QWORD PTR [rsp+0x20]
   140006f34:	85 c0                	test   eax,eax
   140006f36:	7e 4e                	jle    140006f86 <__gdtoa+0xd16>
   140006f38:	45 88 39             	mov    BYTE PTR [r9],r15b
   140006f3b:	45 31 c0             	xor    r8d,r8d
   140006f3e:	49 ff c1             	inc    r9
   140006f41:	48 89 f1             	mov    rcx,rsi
   140006f44:	ba 0a 00 00 00       	mov    edx,0xa
   140006f49:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   140006f4e:	e8 92 08 00 00       	call   1400077e5 <__multadd_D2A>
   140006f53:	49 39 f4             	cmp    r12,rsi
   140006f56:	48 89 d9             	mov    rcx,rbx
   140006f59:	ba 0a 00 00 00       	mov    edx,0xa
   140006f5e:	4c 0f 44 e0          	cmove  r12,rax
   140006f62:	45 31 c0             	xor    r8d,r8d
   140006f65:	48 89 c6             	mov    rsi,rax
   140006f68:	e8 78 08 00 00       	call   1400077e5 <__multadd_D2A>
   140006f6d:	48 89 ea             	mov    rdx,rbp
   140006f70:	48 89 c1             	mov    rcx,rax
   140006f73:	48 89 c3             	mov    rbx,rax
   140006f76:	e8 ac f1 ff ff       	call   140006127 <__quorem_D2A>
   140006f7b:	4c 8b 4c 24 20       	mov    r9,QWORD PTR [rsp+0x20]
   140006f80:	44 8d 78 30          	lea    r15d,[rax+0x30]
   140006f84:	eb 99                	jmp    140006f1f <__gdtoa+0xcaf>
   140006f86:	41 83 ff 39          	cmp    r15d,0x39
   140006f8a:	0f 84 88 00 00 00    	je     140007018 <__gdtoa+0xda8>
   140006f90:	41 ff c7             	inc    r15d
   140006f93:	bf 20 00 00 00       	mov    edi,0x20
   140006f98:	eb 5d                	jmp    140006ff7 <__gdtoa+0xd87>
   140006f9a:	85 d2                	test   edx,edx
   140006f9c:	7e 48                	jle    140006fe6 <__gdtoa+0xd76>
   140006f9e:	48 89 d9             	mov    rcx,rbx
   140006fa1:	ba 01 00 00 00       	mov    edx,0x1
   140006fa6:	4c 89 4c 24 20       	mov    QWORD PTR [rsp+0x20],r9
   140006fab:	e8 15 0b 00 00       	call   140007ac5 <__lshift_D2A>
   140006fb0:	48 89 ea             	mov    rdx,rbp
   140006fb3:	48 89 c1             	mov    rcx,rax
   140006fb6:	48 89 c3             	mov    rbx,rax
   140006fb9:	e8 12 0c 00 00       	call   140007bd0 <__cmp_D2A>
   140006fbe:	4c 8b 4c 24 20       	mov    r9,QWORD PTR [rsp+0x20]
   140006fc3:	85 c0                	test   eax,eax
   140006fc5:	7f 0b                	jg     140006fd2 <__gdtoa+0xd62>
   140006fc7:	75 18                	jne    140006fe1 <__gdtoa+0xd71>
   140006fc9:	41 f7 c7 01 00 00 00 	test   r15d,0x1
   140006fd0:	74 0f                	je     140006fe1 <__gdtoa+0xd71>
   140006fd2:	41 83 ff 39          	cmp    r15d,0x39
   140006fd6:	74 40                	je     140007018 <__gdtoa+0xda8>
   140006fd8:	44 8b 7c 24 34       	mov    r15d,DWORD PTR [rsp+0x34]
   140006fdd:	41 83 c7 31          	add    r15d,0x31
   140006fe1:	bf 20 00 00 00       	mov    edi,0x20
   140006fe6:	83 7b 14 01          	cmp    DWORD PTR [rbx+0x14],0x1
   140006fea:	7f 06                	jg     140006ff2 <__gdtoa+0xd82>
   140006fec:	83 7b 18 00          	cmp    DWORD PTR [rbx+0x18],0x0
   140006ff0:	74 05                	je     140006ff7 <__gdtoa+0xd87>
   140006ff2:	bf 10 00 00 00       	mov    edi,0x10
   140006ff7:	45 88 39             	mov    BYTE PTR [r9],r15b
   140006ffa:	4d 8d 71 01          	lea    r14,[r9+0x1]
   140006ffe:	e9 86 01 00 00       	jmp    140007189 <__gdtoa+0xf19>
   140007003:	4d 8d 71 01          	lea    r14,[r9+0x1]
   140007007:	85 d2                	test   edx,edx
   140007009:	7e 2b                	jle    140007036 <__gdtoa+0xdc6>
   14000700b:	80 7c 24 68 00       	cmp    BYTE PTR [rsp+0x68],0x0
   140007010:	74 24                	je     140007036 <__gdtoa+0xdc6>
   140007012:	41 83 ff 39          	cmp    r15d,0x39
   140007016:	75 0d                	jne    140007025 <__gdtoa+0xdb5>
   140007018:	41 c6 01 39          	mov    BYTE PTR [r9],0x39
   14000701c:	4d 8d 71 01          	lea    r14,[r9+0x1]
   140007020:	e9 19 01 00 00       	jmp    14000713e <__gdtoa+0xece>
   140007025:	45 8d 47 01          	lea    r8d,[r15+0x1]
   140007029:	45 88 01             	mov    BYTE PTR [r9],r8b
   14000702c:	bf 20 00 00 00       	mov    edi,0x20
   140007031:	e9 53 01 00 00       	jmp    140007189 <__gdtoa+0xf19>
   140007036:	45 88 7e ff          	mov    BYTE PTR [r14-0x1],r15b
   14000703a:	8b 44 24 3c          	mov    eax,DWORD PTR [rsp+0x3c]
   14000703e:	39 84 24 9c 00 00 00 	cmp    DWORD PTR [rsp+0x9c],eax
   140007045:	0f 84 b2 00 00 00    	je     1400070fd <__gdtoa+0xe8d>
   14000704b:	48 89 d9             	mov    rcx,rbx
   14000704e:	45 31 c0             	xor    r8d,r8d
   140007051:	ba 0a 00 00 00       	mov    edx,0xa
   140007056:	e8 8a 07 00 00       	call   1400077e5 <__multadd_D2A>
   14000705b:	45 31 c0             	xor    r8d,r8d
   14000705e:	ba 0a 00 00 00       	mov    edx,0xa
   140007063:	4c 89 e1             	mov    rcx,r12
   140007066:	48 89 c3             	mov    rbx,rax
   140007069:	49 39 f4             	cmp    r12,rsi
   14000706c:	75 0d                	jne    14000707b <__gdtoa+0xe0b>
   14000706e:	e8 72 07 00 00       	call   1400077e5 <__multadd_D2A>
   140007073:	49 89 c4             	mov    r12,rax
   140007076:	48 89 c6             	mov    rsi,rax
   140007079:	eb 1b                	jmp    140007096 <__gdtoa+0xe26>
   14000707b:	e8 65 07 00 00       	call   1400077e5 <__multadd_D2A>
   140007080:	48 89 f1             	mov    rcx,rsi
   140007083:	45 31 c0             	xor    r8d,r8d
   140007086:	ba 0a 00 00 00       	mov    edx,0xa
   14000708b:	49 89 c4             	mov    r12,rax
   14000708e:	e8 52 07 00 00       	call   1400077e5 <__multadd_D2A>
   140007093:	48 89 c6             	mov    rsi,rax
   140007096:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [rsp+0x9c]
   14000709d:	4d 89 f1             	mov    r9,r14
   1400070a0:	8d 50 01             	lea    edx,[rax+0x1]
   1400070a3:	e9 54 fd ff ff       	jmp    140006dfc <__gdtoa+0xb8c>
   1400070a8:	4c 8b 74 24 28       	mov    r14,QWORD PTR [rsp+0x28]
   1400070ad:	b8 01 00 00 00       	mov    eax,0x1
   1400070b2:	48 89 ea             	mov    rdx,rbp
   1400070b5:	48 89 d9             	mov    rcx,rbx
   1400070b8:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   1400070bf:	49 ff c6             	inc    r14
   1400070c2:	e8 60 f0 ff ff       	call   140006127 <__quorem_D2A>
   1400070c7:	44 8d 78 30          	lea    r15d,[rax+0x30]
   1400070cb:	8b 44 24 3c          	mov    eax,DWORD PTR [rsp+0x3c]
   1400070cf:	45 88 7e ff          	mov    BYTE PTR [r14-0x1],r15b
   1400070d3:	39 84 24 9c 00 00 00 	cmp    DWORD PTR [rsp+0x9c],eax
   1400070da:	7d 1e                	jge    1400070fa <__gdtoa+0xe8a>
   1400070dc:	48 89 d9             	mov    rcx,rbx
   1400070df:	45 31 c0             	xor    r8d,r8d
   1400070e2:	ba 0a 00 00 00       	mov    edx,0xa
   1400070e7:	e8 f9 06 00 00       	call   1400077e5 <__multadd_D2A>
   1400070ec:	48 89 c3             	mov    rbx,rax
   1400070ef:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [rsp+0x9c]
   1400070f6:	ff c0                	inc    eax
   1400070f8:	eb b8                	jmp    1400070b2 <__gdtoa+0xe42>
   1400070fa:	45 31 e4             	xor    r12d,r12d
   1400070fd:	83 7c 24 30 00       	cmp    DWORD PTR [rsp+0x30],0x0
   140007102:	74 13                	je     140007117 <__gdtoa+0xea7>
   140007104:	83 7c 24 30 02       	cmp    DWORD PTR [rsp+0x30],0x2
   140007109:	74 66                	je     140007171 <__gdtoa+0xf01>
   14000710b:	83 7b 14 01          	cmp    DWORD PTR [rbx+0x14],0x1
   14000710f:	7f 2d                	jg     14000713e <__gdtoa+0xece>
   140007111:	83 7b 18 00          	cmp    DWORD PTR [rbx+0x18],0x0
   140007115:	eb 25                	jmp    14000713c <__gdtoa+0xecc>
   140007117:	48 89 d9             	mov    rcx,rbx
   14000711a:	ba 01 00 00 00       	mov    edx,0x1
   14000711f:	e8 a1 09 00 00       	call   140007ac5 <__lshift_D2A>
   140007124:	48 89 ea             	mov    rdx,rbp
   140007127:	48 89 c1             	mov    rcx,rax
   14000712a:	48 89 c3             	mov    rbx,rax
   14000712d:	e8 9e 0a 00 00       	call   140007bd0 <__cmp_D2A>
   140007132:	85 c0                	test   eax,eax
   140007134:	7f 08                	jg     14000713e <__gdtoa+0xece>
   140007136:	75 39                	jne    140007171 <__gdtoa+0xf01>
   140007138:	41 83 e7 01          	and    r15d,0x1
   14000713c:	74 33                	je     140007171 <__gdtoa+0xf01>
   14000713e:	4c 89 f0             	mov    rax,r14
   140007141:	49 89 c6             	mov    r14,rax
   140007144:	48 8d 40 ff          	lea    rax,[rax-0x1]
   140007148:	41 8a 56 ff          	mov    dl,BYTE PTR [r14-0x1]
   14000714c:	80 fa 39             	cmp    dl,0x39
   14000714f:	75 17                	jne    140007168 <__gdtoa+0xef8>
   140007151:	48 39 44 24 28       	cmp    QWORD PTR [rsp+0x28],rax
   140007156:	75 e9                	jne    140007141 <__gdtoa+0xed1>
   140007158:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   14000715d:	41 ff c5             	inc    r13d
   140007160:	c6 00 31             	mov    BYTE PTR [rax],0x31
   140007163:	e9 c4 fe ff ff       	jmp    14000702c <__gdtoa+0xdbc>
   140007168:	ff c2                	inc    edx
   14000716a:	88 10                	mov    BYTE PTR [rax],dl
   14000716c:	e9 bb fe ff ff       	jmp    14000702c <__gdtoa+0xdbc>
   140007171:	bf 10 00 00 00       	mov    edi,0x10
   140007176:	83 7b 14 01          	cmp    DWORD PTR [rbx+0x14],0x1
   14000717a:	7f 0d                	jg     140007189 <__gdtoa+0xf19>
   14000717c:	31 ff                	xor    edi,edi
   14000717e:	83 7b 18 00          	cmp    DWORD PTR [rbx+0x18],0x0
   140007182:	40 0f 95 c7          	setne  dil
   140007186:	c1 e7 04             	shl    edi,0x4
   140007189:	48 89 e9             	mov    rcx,rbp
   14000718c:	e8 08 06 00 00       	call   140007799 <__Bfree_D2A>
   140007191:	48 85 f6             	test   rsi,rsi
   140007194:	75 05                	jne    14000719b <__gdtoa+0xf2b>
   140007196:	45 89 ef             	mov    r15d,r13d
   140007199:	eb 26                	jmp    1400071c1 <__gdtoa+0xf51>
   14000719b:	4d 85 e4             	test   r12,r12
   14000719e:	74 0d                	je     1400071ad <__gdtoa+0xf3d>
   1400071a0:	49 39 f4             	cmp    r12,rsi
   1400071a3:	74 08                	je     1400071ad <__gdtoa+0xf3d>
   1400071a5:	4c 89 e1             	mov    rcx,r12
   1400071a8:	e8 ec 05 00 00       	call   140007799 <__Bfree_D2A>
   1400071ad:	48 89 f1             	mov    rcx,rsi
   1400071b0:	e8 e4 05 00 00       	call   140007799 <__Bfree_D2A>
   1400071b5:	eb df                	jmp    140007196 <__gdtoa+0xf26>
   1400071b7:	41 80 7e ff 30       	cmp    BYTE PTR [r14-0x1],0x30
   1400071bc:	75 0a                	jne    1400071c8 <__gdtoa+0xf58>
   1400071be:	49 ff ce             	dec    r14
   1400071c1:	4c 39 74 24 28       	cmp    QWORD PTR [rsp+0x28],r14
   1400071c6:	72 ef                	jb     1400071b7 <__gdtoa+0xf47>
   1400071c8:	48 89 d9             	mov    rcx,rbx
   1400071cb:	e8 c9 05 00 00       	call   140007799 <__Bfree_D2A>
   1400071d0:	48 8b 44 24 70       	mov    rax,QWORD PTR [rsp+0x70]
   1400071d5:	45 8d 47 01          	lea    r8d,[r15+0x1]
   1400071d9:	41 c6 06 00          	mov    BYTE PTR [r14],0x0
   1400071dd:	44 89 00             	mov    DWORD PTR [rax],r8d
   1400071e0:	48 83 7c 24 58 00    	cmp    QWORD PTR [rsp+0x58],0x0
   1400071e6:	74 08                	je     1400071f0 <__gdtoa+0xf80>
   1400071e8:	48 8b 44 24 58       	mov    rax,QWORD PTR [rsp+0x58]
   1400071ed:	4c 89 30             	mov    QWORD PTR [rax],r14
   1400071f0:	48 8b 44 24 78       	mov    rax,QWORD PTR [rsp+0x78]
   1400071f5:	09 38                	or     DWORD PTR [rax],edi
   1400071f7:	48 8b 44 24 28       	mov    rax,QWORD PTR [rsp+0x28]
   1400071fc:	0f 28 b4 24 a0 00 00 	movaps xmm6,XMMWORD PTR [rsp+0xa0]
   140007203:	00 
   140007204:	48 81 c4 b8 00 00 00 	add    rsp,0xb8
   14000720b:	5b                   	pop    rbx
   14000720c:	5e                   	pop    rsi
   14000720d:	5f                   	pop    rdi
   14000720e:	5d                   	pop    rbp
   14000720f:	41 5c                	pop    r12
   140007211:	41 5d                	pop    r13
   140007213:	41 5e                	pop    r14
   140007215:	41 5f                	pop    r15
   140007217:	c3                   	ret
   140007218:	90                   	nop
   140007219:	90                   	nop
   14000721a:	90                   	nop
   14000721b:	90                   	nop
   14000721c:	90                   	nop
   14000721d:	90                   	nop
   14000721e:	90                   	nop
   14000721f:	90                   	nop

0000000140007220 <__g__fmt>:
   140007220:	41 55                	push   r13
   140007222:	41 54                	push   r12
   140007224:	55                   	push   rbp
   140007225:	57                   	push   rdi
   140007226:	56                   	push   rsi
   140007227:	53                   	push   rbx
   140007228:	48 83 ec 28          	sub    rsp,0x28
   14000722c:	4c 8b ac 24 88 00 00 	mov    r13,QWORD PTR [rsp+0x88]
   140007233:	00 
   140007234:	48 89 d7             	mov    rdi,rdx
   140007237:	4c 89 c5             	mov    rbp,r8
   14000723a:	48 89 cb             	mov    rbx,rcx
   14000723d:	44 89 ce             	mov    esi,r9d
   140007240:	e8 a3 39 00 00       	call   14000abe8 <localeconv>
   140007245:	4c 8b 20             	mov    r12,QWORD PTR [rax]
   140007248:	4c 89 e1             	mov    rcx,r12
   14000724b:	e8 d0 39 00 00       	call   14000ac20 <strlen>
   140007250:	49 89 e8             	mov    r8,rbp
   140007253:	49 29 f8             	sub    r8,rdi
   140007256:	49 8d 44 00 06       	lea    rax,[r8+rax*1+0x6]
   14000725b:	49 39 c5             	cmp    r13,rax
   14000725e:	73 07                	jae    140007267 <__g__fmt+0x47>
   140007260:	31 db                	xor    ebx,ebx
   140007262:	e9 77 01 00 00       	jmp    1400073de <__g__fmt+0x1be>
   140007267:	4a 8d 4c 2b ff       	lea    rcx,[rbx+r13*1-0x1]
   14000726c:	83 bc 24 80 00 00 00 	cmp    DWORD PTR [rsp+0x80],0x0
   140007273:	00 
   140007274:	74 06                	je     14000727c <__g__fmt+0x5c>
   140007276:	c6 03 2d             	mov    BYTE PTR [rbx],0x2d
   140007279:	48 ff c3             	inc    rbx
   14000727c:	83 fe fd             	cmp    esi,0xfffffffd
   14000727f:	7c 10                	jl     140007291 <__g__fmt+0x71>
   140007281:	4c 63 ce             	movsxd r9,esi
   140007284:	49 8d 40 05          	lea    rax,[r8+0x5]
   140007288:	49 39 c1             	cmp    r9,rax
   14000728b:	0f 8e 96 00 00 00    	jle    140007327 <__g__fmt+0x107>
   140007291:	8a 07                	mov    al,BYTE PTR [rdi]
   140007293:	48 8d 53 01          	lea    rdx,[rbx+0x1]
   140007297:	88 03                	mov    BYTE PTR [rbx],al
   140007299:	80 7f 01 00          	cmp    BYTE PTR [rdi+0x1],0x0
   14000729d:	74 2b                	je     1400072ca <__g__fmt+0xaa>
   14000729f:	41 8a 04 24          	mov    al,BYTE PTR [r12]
   1400072a3:	88 02                	mov    BYTE PTR [rdx],al
   1400072a5:	84 c0                	test   al,al
   1400072a7:	74 08                	je     1400072b1 <__g__fmt+0x91>
   1400072a9:	49 ff c4             	inc    r12
   1400072ac:	48 ff c2             	inc    rdx
   1400072af:	eb ee                	jmp    14000729f <__g__fmt+0x7f>
   1400072b1:	31 c0                	xor    eax,eax
   1400072b3:	44 8a 44 07 01       	mov    r8b,BYTE PTR [rdi+rax*1+0x1]
   1400072b8:	49 89 c1             	mov    r9,rax
   1400072bb:	44 88 04 02          	mov    BYTE PTR [rdx+rax*1],r8b
   1400072bf:	48 ff c0             	inc    rax
   1400072c2:	45 84 c0             	test   r8b,r8b
   1400072c5:	75 ec                	jne    1400072b3 <__g__fmt+0x93>
   1400072c7:	4c 01 ca             	add    rdx,r9
   1400072ca:	89 f0                	mov    eax,esi
   1400072cc:	c6 02 65             	mov    BYTE PTR [rdx],0x65
   1400072cf:	48 8d 5a 02          	lea    rbx,[rdx+0x2]
   1400072d3:	41 b0 2b             	mov    r8b,0x2b
   1400072d6:	ff c8                	dec    eax
   1400072d8:	79 0a                	jns    1400072e4 <__g__fmt+0xc4>
   1400072da:	b8 01 00 00 00       	mov    eax,0x1
   1400072df:	41 b0 2d             	mov    r8b,0x2d
   1400072e2:	29 f0                	sub    eax,esi
   1400072e4:	44 88 42 01          	mov    BYTE PTR [rdx+0x1],r8b
   1400072e8:	41 b9 0a 00 00 00    	mov    r9d,0xa
   1400072ee:	41 b8 02 00 00 00    	mov    r8d,0x2
   1400072f4:	41 6b d1 0a          	imul   edx,r9d,0xa
   1400072f8:	39 c2                	cmp    edx,eax
   1400072fa:	7f 21                	jg     14000731d <__g__fmt+0xfd>
   1400072fc:	41 ff c0             	inc    r8d
   1400072ff:	41 89 d1             	mov    r9d,edx
   140007302:	eb f0                	jmp    1400072f4 <__g__fmt+0xd4>
   140007304:	99                   	cdq
   140007305:	48 ff c3             	inc    rbx
   140007308:	41 f7 f9             	idiv   r9d
   14000730b:	83 c0 30             	add    eax,0x30
   14000730e:	88 43 ff             	mov    BYTE PTR [rbx-0x1],al
   140007311:	41 ff c8             	dec    r8d
   140007314:	0f 84 c1 00 00 00    	je     1400073db <__g__fmt+0x1bb>
   14000731a:	6b c2 0a             	imul   eax,edx,0xa
   14000731d:	48 39 cb             	cmp    rbx,rcx
   140007320:	72 e2                	jb     140007304 <__g__fmt+0xe4>
   140007322:	e9 39 ff ff ff       	jmp    140007260 <__g__fmt+0x40>
   140007327:	48 89 f8             	mov    rax,rdi
   14000732a:	85 f6                	test   esi,esi
   14000732c:	7f 5d                	jg     14000738b <__g__fmt+0x16b>
   14000732e:	31 d2                	xor    edx,edx
   140007330:	45 8a 14 14          	mov    r10b,BYTE PTR [r12+rdx*1]
   140007334:	48 89 d0             	mov    rax,rdx
   140007337:	44 88 14 13          	mov    BYTE PTR [rbx+rdx*1],r10b
   14000733b:	48 ff c2             	inc    rdx
   14000733e:	45 84 d2             	test   r10b,r10b
   140007341:	75 ed                	jne    140007330 <__g__fmt+0x110>
   140007343:	48 01 d8             	add    rax,rbx
   140007346:	4d 29 c8             	sub    r8,r9
   140007349:	31 d2                	xor    edx,edx
   14000734b:	49 01 c0             	add    r8,rax
   14000734e:	4c 39 c1             	cmp    rcx,r8
   140007351:	0f 82 09 ff ff ff    	jb     140007260 <__g__fmt+0x40>
   140007357:	89 f1                	mov    ecx,esi
   140007359:	01 d1                	add    ecx,edx
   14000735b:	74 09                	je     140007366 <__g__fmt+0x146>
   14000735d:	c6 04 10 30          	mov    BYTE PTR [rax+rdx*1],0x30
   140007361:	48 ff c2             	inc    rdx
   140007364:	eb f1                	jmp    140007357 <__g__fmt+0x137>
   140007366:	89 f3                	mov    ebx,esi
   140007368:	48 89 fa             	mov    rdx,rdi
   14000736b:	f7 db                	neg    ebx
   14000736d:	48 01 c3             	add    rbx,rax
   140007370:	48 29 da             	sub    rdx,rbx
   140007373:	8a 04 13             	mov    al,BYTE PTR [rbx+rdx*1]
   140007376:	88 03                	mov    BYTE PTR [rbx],al
   140007378:	84 c0                	test   al,al
   14000737a:	74 62                	je     1400073de <__g__fmt+0x1be>
   14000737c:	48 ff c3             	inc    rbx
   14000737f:	eb f2                	jmp    140007373 <__g__fmt+0x153>
   140007381:	48 ff c0             	inc    rax
   140007384:	48 ff c3             	inc    rbx
   140007387:	ff ce                	dec    esi
   140007389:	74 0a                	je     140007395 <__g__fmt+0x175>
   14000738b:	8a 10                	mov    dl,BYTE PTR [rax]
   14000738d:	88 13                	mov    BYTE PTR [rbx],dl
   14000738f:	84 d2                	test   dl,dl
   140007391:	75 ee                	jne    140007381 <__g__fmt+0x161>
   140007393:	eb 17                	jmp    1400073ac <__g__fmt+0x18c>
   140007395:	80 38 00             	cmp    BYTE PTR [rax],0x0
   140007398:	74 f1                	je     14000738b <__g__fmt+0x16b>
   14000739a:	41 8a 14 24          	mov    dl,BYTE PTR [r12]
   14000739e:	49 ff c4             	inc    r12
   1400073a1:	88 13                	mov    BYTE PTR [rbx],dl
   1400073a3:	84 d2                	test   dl,dl
   1400073a5:	74 e4                	je     14000738b <__g__fmt+0x16b>
   1400073a7:	48 ff c3             	inc    rbx
   1400073aa:	eb ee                	jmp    14000739a <__g__fmt+0x17a>
   1400073ac:	48 63 c6             	movsxd rax,esi
   1400073af:	48 01 d8             	add    rax,rbx
   1400073b2:	48 39 c1             	cmp    rcx,rax
   1400073b5:	0f 82 a5 fe ff ff    	jb     140007260 <__g__fmt+0x40>
   1400073bb:	31 c0                	xor    eax,eax
   1400073bd:	89 f2                	mov    edx,esi
   1400073bf:	29 c2                	sub    edx,eax
   1400073c1:	85 d2                	test   edx,edx
   1400073c3:	7e 09                	jle    1400073ce <__g__fmt+0x1ae>
   1400073c5:	c6 04 03 30          	mov    BYTE PTR [rbx+rax*1],0x30
   1400073c9:	48 ff c0             	inc    rax
   1400073cc:	eb ef                	jmp    1400073bd <__g__fmt+0x19d>
   1400073ce:	31 c0                	xor    eax,eax
   1400073d0:	85 f6                	test   esi,esi
   1400073d2:	0f 49 c6             	cmovns eax,esi
   1400073d5:	4c 63 c8             	movsxd r9,eax
   1400073d8:	4c 01 cb             	add    rbx,r9
   1400073db:	c6 03 00             	mov    BYTE PTR [rbx],0x0
   1400073de:	48 89 f9             	mov    rcx,rdi
   1400073e1:	e8 25 ed ff ff       	call   14000610b <__freedtoa>
   1400073e6:	48 89 d8             	mov    rax,rbx
   1400073e9:	48 83 c4 28          	add    rsp,0x28
   1400073ed:	5b                   	pop    rbx
   1400073ee:	5e                   	pop    rsi
   1400073ef:	5f                   	pop    rdi
   1400073f0:	5d                   	pop    rbp
   1400073f1:	41 5c                	pop    r12
   1400073f3:	41 5d                	pop    r13
   1400073f5:	c3                   	ret

00000001400073f6 <__add_nanbits_D2A>:
   1400073f6:	55                   	push   rbp
   1400073f7:	57                   	push   rdi
   1400073f8:	56                   	push   rsi
   1400073f9:	53                   	push   rbx
   1400073fa:	49 63 c1             	movsxd rax,r9d
   1400073fd:	4d 8d 54 80 fc       	lea    r10,[r8+rax*4-0x4]
   140007402:	45 8b 1a             	mov    r11d,DWORD PTR [r10]
   140007405:	41 ff c9             	dec    r9d
   140007408:	45 85 db             	test   r11d,r11d
   14000740b:	75 0e                	jne    14000741b <__add_nanbits_D2A+0x25>
   14000740d:	49 83 ea 04          	sub    r10,0x4
   140007411:	45 85 c9             	test   r9d,r9d
   140007414:	75 ec                	jne    140007402 <__add_nanbits_D2A+0xc>
   140007416:	e9 97 00 00 00       	jmp    1400074b2 <__add_nanbits_D2A+0xbc>
   14000741b:	42 8d 04 cd 03 00 00 	lea    eax,[r9*8+0x3]
   140007422:	00 
   140007423:	48 98                	cdqe
   140007425:	48 89 c3             	mov    rbx,rax
   140007428:	48 ff c0             	inc    rax
   14000742b:	41 c1 eb 04          	shr    r11d,0x4
   14000742f:	75 f4                	jne    140007425 <__add_nanbits_D2A+0x2f>
   140007431:	48 39 c2             	cmp    rdx,rax
   140007434:	72 7c                	jb     1400074b2 <__add_nanbits_D2A+0xbc>
   140007436:	48 01 c8             	add    rax,rcx
   140007439:	31 d2                	xor    edx,edx
   14000743b:	48 8d 3d 3e 52 00 00 	lea    rdi,[rip+0x523e]        # 14000c680 <Hexdig.0>
   140007442:	48 01 d9             	add    rcx,rbx
   140007445:	c6 40 ff 00          	mov    BYTE PTR [rax-0x1],0x0
   140007449:	48 8d 58 fe          	lea    rbx,[rax-0x2]
   14000744d:	c6 40 fe 29          	mov    BYTE PTR [rax-0x2],0x29
   140007451:	41 39 d1             	cmp    r9d,edx
   140007454:	7e 2a                	jle    140007480 <__add_nanbits_D2A+0x8a>
   140007456:	41 8b 34 90          	mov    esi,DWORD PTR [r8+rdx*4]
   14000745a:	45 31 db             	xor    r11d,r11d
   14000745d:	89 f5                	mov    ebp,esi
   14000745f:	c1 ee 04             	shr    esi,0x4
   140007462:	83 e5 0f             	and    ebp,0xf
   140007465:	40 8a 2c 2f          	mov    bpl,BYTE PTR [rdi+rbp*1]
   140007469:	42 88 6c 1b ff       	mov    BYTE PTR [rbx+r11*1-0x1],bpl
   14000746e:	49 ff cb             	dec    r11
   140007471:	49 83 fb f8          	cmp    r11,0xfffffffffffffff8
   140007475:	75 e6                	jne    14000745d <__add_nanbits_D2A+0x67>
   140007477:	48 83 eb 08          	sub    rbx,0x8
   14000747b:	48 ff c2             	inc    rdx
   14000747e:	eb d1                	jmp    140007451 <__add_nanbits_D2A+0x5b>
   140007480:	31 d2                	xor    edx,edx
   140007482:	45 85 c9             	test   r9d,r9d
   140007485:	44 0f 48 ca          	cmovs  r9d,edx
   140007489:	41 8b 12             	mov    edx,DWORD PTR [r10]
   14000748c:	4d 63 c9             	movsxd r9,r9d
   14000748f:	4d 6b c9 f8          	imul   r9,r9,0xfffffffffffffff8
   140007493:	4a 8d 44 08 fe       	lea    rax,[rax+r9*1-0x2]
   140007498:	41 89 d0             	mov    r8d,edx
   14000749b:	48 ff c8             	dec    rax
   14000749e:	41 83 e0 0f          	and    r8d,0xf
   1400074a2:	c1 ea 04             	shr    edx,0x4
   1400074a5:	46 8a 04 07          	mov    r8b,BYTE PTR [rdi+r8*1]
   1400074a9:	44 88 00             	mov    BYTE PTR [rax],r8b
   1400074ac:	75 ea                	jne    140007498 <__add_nanbits_D2A+0xa2>
   1400074ae:	c6 40 ff 28          	mov    BYTE PTR [rax-0x1],0x28
   1400074b2:	48 89 c8             	mov    rax,rcx
   1400074b5:	5b                   	pop    rbx
   1400074b6:	5e                   	pop    rsi
   1400074b7:	5f                   	pop    rdi
   1400074b8:	5d                   	pop    rbp
   1400074b9:	c3                   	ret
   1400074ba:	90                   	nop
   1400074bb:	90                   	nop
   1400074bc:	90                   	nop
   1400074bd:	90                   	nop
   1400074be:	90                   	nop
   1400074bf:	90                   	nop

00000001400074c0 <__rshift_D2A>:
   1400074c0:	41 56                	push   r14
   1400074c2:	41 54                	push   r12
   1400074c4:	55                   	push   rbp
   1400074c5:	57                   	push   rdi
   1400074c6:	56                   	push   rsi
   1400074c7:	53                   	push   rbx
   1400074c8:	4c 8d 59 18          	lea    r11,[rcx+0x18]
   1400074cc:	49 89 ca             	mov    r10,rcx
   1400074cf:	89 d3                	mov    ebx,edx
   1400074d1:	8b 49 14             	mov    ecx,DWORD PTR [rcx+0x14]
   1400074d4:	c1 fb 05             	sar    ebx,0x5
   1400074d7:	4c 89 d8             	mov    rax,r11
   1400074da:	39 d9                	cmp    ecx,ebx
   1400074dc:	0f 8e ac 00 00 00    	jle    14000758e <__rshift_D2A+0xce>
   1400074e2:	48 63 c1             	movsxd rax,ecx
   1400074e5:	48 63 db             	movsxd rbx,ebx
   1400074e8:	49 8d 34 83          	lea    rsi,[r11+rax*4]
   1400074ec:	4d 8d 04 9b          	lea    r8,[r11+rbx*4]
   1400074f0:	83 e2 1f             	and    edx,0x1f
   1400074f3:	74 68                	je     14000755d <__rshift_D2A+0x9d>
   1400074f5:	45 8b 08             	mov    r9d,DWORD PTR [r8]
   1400074f8:	41 bc 20 00 00 00    	mov    r12d,0x20
   1400074fe:	89 d1                	mov    ecx,edx
   140007500:	49 8d 78 04          	lea    rdi,[r8+0x4]
   140007504:	41 29 d4             	sub    r12d,edx
   140007507:	4c 89 dd             	mov    rbp,r11
   14000750a:	41 d3 e9             	shr    r9d,cl
   14000750d:	48 39 f7             	cmp    rdi,rsi
   140007510:	73 23                	jae    140007535 <__rshift_D2A+0x75>
   140007512:	44 8b 37             	mov    r14d,DWORD PTR [rdi]
   140007515:	44 89 e1             	mov    ecx,r12d
   140007518:	48 83 c5 04          	add    rbp,0x4
   14000751c:	48 83 c7 04          	add    rdi,0x4
   140007520:	41 d3 e6             	shl    r14d,cl
   140007523:	89 d1                	mov    ecx,edx
   140007525:	45 09 f1             	or     r9d,r14d
   140007528:	44 89 4d fc          	mov    DWORD PTR [rbp-0x4],r9d
   14000752c:	44 8b 4f fc          	mov    r9d,DWORD PTR [rdi-0x4]
   140007530:	41 d3 e9             	shr    r9d,cl
   140007533:	eb d8                	jmp    14000750d <__rshift_D2A+0x4d>
   140007535:	48 29 d8             	sub    rax,rbx
   140007538:	49 ff c0             	inc    r8
   14000753b:	31 d2                	xor    edx,edx
   14000753d:	48 8d 04 85 fc ff ff 	lea    rax,[rax*4-0x4]
   140007544:	ff 
   140007545:	4c 39 c6             	cmp    rsi,r8
   140007548:	48 0f 42 c2          	cmovb  rax,rdx
   14000754c:	4c 01 d8             	add    rax,r11
   14000754f:	44 89 08             	mov    DWORD PTR [rax],r9d
   140007552:	45 85 c9             	test   r9d,r9d
   140007555:	74 37                	je     14000758e <__rshift_D2A+0xce>
   140007557:	48 83 c0 04          	add    rax,0x4
   14000755b:	eb 31                	jmp    14000758e <__rshift_D2A+0xce>
   14000755d:	31 d2                	xor    edx,edx
   14000755f:	49 8d 0c 10          	lea    rcx,[r8+rdx*1]
   140007563:	48 39 f1             	cmp    rcx,rsi
   140007566:	73 0f                	jae    140007577 <__rshift_D2A+0xb7>
   140007568:	41 8b 0c 10          	mov    ecx,DWORD PTR [r8+rdx*1]
   14000756c:	41 89 4c 12 18       	mov    DWORD PTR [r10+rdx*1+0x18],ecx
   140007571:	48 83 c2 04          	add    rdx,0x4
   140007575:	eb e8                	jmp    14000755f <__rshift_D2A+0x9f>
   140007577:	48 29 d8             	sub    rax,rbx
   14000757a:	49 83 e8 03          	sub    r8,0x3
   14000757e:	31 d2                	xor    edx,edx
   140007580:	48 c1 e0 02          	shl    rax,0x2
   140007584:	4c 39 c6             	cmp    rsi,r8
   140007587:	48 0f 42 c2          	cmovb  rax,rdx
   14000758b:	4c 01 d8             	add    rax,r11
   14000758e:	4c 29 d8             	sub    rax,r11
   140007591:	48 c1 f8 02          	sar    rax,0x2
   140007595:	41 89 42 14          	mov    DWORD PTR [r10+0x14],eax
   140007599:	85 c0                	test   eax,eax
   14000759b:	75 06                	jne    1400075a3 <__rshift_D2A+0xe3>
   14000759d:	31 c0                	xor    eax,eax
   14000759f:	41 89 42 18          	mov    DWORD PTR [r10+0x18],eax
   1400075a3:	5b                   	pop    rbx
   1400075a4:	5e                   	pop    rsi
   1400075a5:	5f                   	pop    rdi
   1400075a6:	5d                   	pop    rbp
   1400075a7:	41 5c                	pop    r12
   1400075a9:	41 5e                	pop    r14
   1400075ab:	c3                   	ret

00000001400075ac <__trailz_D2A>:
   1400075ac:	48 63 51 14          	movsxd rdx,DWORD PTR [rcx+0x14]
   1400075b0:	48 8d 41 18          	lea    rax,[rcx+0x18]
   1400075b4:	48 8d 0c 90          	lea    rcx,[rax+rdx*4]
   1400075b8:	31 d2                	xor    edx,edx
   1400075ba:	48 39 c8             	cmp    rax,rcx
   1400075bd:	73 13                	jae    1400075d2 <__trailz_D2A+0x26>
   1400075bf:	83 38 00             	cmp    DWORD PTR [rax],0x0
   1400075c2:	75 09                	jne    1400075cd <__trailz_D2A+0x21>
   1400075c4:	83 c2 20             	add    edx,0x20
   1400075c7:	48 83 c0 04          	add    rax,0x4
   1400075cb:	eb ed                	jmp    1400075ba <__trailz_D2A+0xe>
   1400075cd:	0f bc 00             	bsf    eax,DWORD PTR [rax]
   1400075d0:	01 c2                	add    edx,eax
   1400075d2:	89 d0                	mov    eax,edx
   1400075d4:	c3                   	ret
   1400075d5:	90                   	nop
   1400075d6:	90                   	nop
   1400075d7:	90                   	nop
   1400075d8:	90                   	nop
   1400075d9:	90                   	nop
   1400075da:	90                   	nop
   1400075db:	90                   	nop
   1400075dc:	90                   	nop
   1400075dd:	90                   	nop
   1400075de:	90                   	nop
   1400075df:	90                   	nop

00000001400075e0 <dtoa_lock>:
   1400075e0:	56                   	push   rsi
   1400075e1:	53                   	push   rbx
   1400075e2:	48 83 ec 28          	sub    rsp,0x28
   1400075e6:	8b 05 04 95 00 00    	mov    eax,DWORD PTR [rip+0x9504]        # 140010af0 <dtoa_CS_init>
   1400075ec:	89 cb                	mov    ebx,ecx
   1400075ee:	83 f8 02             	cmp    eax,0x2
   1400075f1:	75 1e                	jne    140007611 <dtoa_lock+0x31>
   1400075f3:	48 f7 db             	neg    rbx
   1400075f6:	48 8d 05 03 95 00 00 	lea    rax,[rip+0x9503]        # 140010b00 <dtoa_CritSec>
   1400075fd:	83 e3 28             	and    ebx,0x28
   140007600:	48 8d 0c 03          	lea    rcx,[rbx+rax*1]
   140007604:	48 83 c4 28          	add    rsp,0x28
   140007608:	5b                   	pop    rbx
   140007609:	5e                   	pop    rsi
   14000760a:	48 ff 25 17 9c 00 00 	rex.W jmp QWORD PTR [rip+0x9c17]        # 140011228 <__imp_EnterCriticalSection>
   140007611:	85 c0                	test   eax,eax
   140007613:	75 45                	jne    14000765a <dtoa_lock+0x7a>
   140007615:	b8 01 00 00 00       	mov    eax,0x1
   14000761a:	87 05 d0 94 00 00    	xchg   DWORD PTR [rip+0x94d0],eax        # 140010af0 <dtoa_CS_init>
   140007620:	85 c0                	test   eax,eax
   140007622:	75 27                	jne    14000764b <dtoa_lock+0x6b>
   140007624:	48 8b 35 0d 9c 00 00 	mov    rsi,QWORD PTR [rip+0x9c0d]        # 140011238 <__imp_InitializeCriticalSection>
   14000762b:	48 8d 0d ce 94 00 00 	lea    rcx,[rip+0x94ce]        # 140010b00 <dtoa_CritSec>
   140007632:	ff d6                	call   rsi
   140007634:	48 8d 0d ed 94 00 00 	lea    rcx,[rip+0x94ed]        # 140010b28 <dtoa_CritSec+0x28>
   14000763b:	ff d6                	call   rsi
   14000763d:	48 8d 0d 62 00 00 00 	lea    rcx,[rip+0x62]        # 1400076a6 <dtoa_lock_cleanup>
   140007644:	e8 1c 9d ff ff       	call   140001365 <atexit>
   140007649:	eb 05                	jmp    140007650 <dtoa_lock+0x70>
   14000764b:	83 f8 02             	cmp    eax,0x2
   14000764e:	75 0a                	jne    14000765a <dtoa_lock+0x7a>
   140007650:	c7 05 96 94 00 00 02 	mov    DWORD PTR [rip+0x9496],0x2        # 140010af0 <dtoa_CS_init>
   140007657:	00 00 00 
   14000765a:	48 8b 35 ff 9b 00 00 	mov    rsi,QWORD PTR [rip+0x9bff]        # 140011260 <__imp_Sleep>
   140007661:	8b 05 89 94 00 00    	mov    eax,DWORD PTR [rip+0x9489]        # 140010af0 <dtoa_CS_init>
   140007667:	83 f8 01             	cmp    eax,0x1
   14000766a:	75 09                	jne    140007675 <dtoa_lock+0x95>
   14000766c:	b9 01 00 00 00       	mov    ecx,0x1
   140007671:	ff d6                	call   rsi
   140007673:	eb ec                	jmp    140007661 <dtoa_lock+0x81>
   140007675:	83 f8 02             	cmp    eax,0x2
   140007678:	0f 84 75 ff ff ff    	je     1400075f3 <dtoa_lock+0x13>
   14000767e:	48 83 c4 28          	add    rsp,0x28
   140007682:	5b                   	pop    rbx
   140007683:	5e                   	pop    rsi
   140007684:	c3                   	ret

0000000140007685 <dtoa_unlock>:
   140007685:	83 3d 64 94 00 00 02 	cmp    DWORD PTR [rip+0x9464],0x2        # 140010af0 <dtoa_CS_init>
   14000768c:	75 17                	jne    1400076a5 <dtoa_unlock+0x20>
   14000768e:	48 f7 d9             	neg    rcx
   140007691:	48 8d 05 68 94 00 00 	lea    rax,[rip+0x9468]        # 140010b00 <dtoa_CritSec>
   140007698:	83 e1 28             	and    ecx,0x28
   14000769b:	48 01 c1             	add    rcx,rax
   14000769e:	48 ff 25 a3 9b 00 00 	rex.W jmp QWORD PTR [rip+0x9ba3]        # 140011248 <__imp_LeaveCriticalSection>
   1400076a5:	c3                   	ret

00000001400076a6 <dtoa_lock_cleanup>:
   1400076a6:	53                   	push   rbx
   1400076a7:	48 83 ec 20          	sub    rsp,0x20
   1400076ab:	b8 03 00 00 00       	mov    eax,0x3
   1400076b0:	87 05 3a 94 00 00    	xchg   DWORD PTR [rip+0x943a],eax        # 140010af0 <dtoa_CS_init>
   1400076b6:	83 f8 02             	cmp    eax,0x2
   1400076b9:	75 22                	jne    1400076dd <dtoa_lock_cleanup+0x37>
   1400076bb:	48 8b 1d 5e 9b 00 00 	mov    rbx,QWORD PTR [rip+0x9b5e]        # 140011220 <__IAT_start__>
   1400076c2:	48 8d 0d 37 94 00 00 	lea    rcx,[rip+0x9437]        # 140010b00 <dtoa_CritSec>
   1400076c9:	ff d3                	call   rbx
   1400076cb:	48 8d 0d 56 94 00 00 	lea    rcx,[rip+0x9456]        # 140010b28 <dtoa_CritSec+0x28>
   1400076d2:	48 89 d8             	mov    rax,rbx
   1400076d5:	48 83 c4 20          	add    rsp,0x20
   1400076d9:	5b                   	pop    rbx
   1400076da:	48 ff e0             	rex.W jmp rax
   1400076dd:	48 83 c4 20          	add    rsp,0x20
   1400076e1:	5b                   	pop    rbx
   1400076e2:	c3                   	ret

00000001400076e3 <__Balloc_D2A>:
   1400076e3:	57                   	push   rdi
   1400076e4:	56                   	push   rsi
   1400076e5:	53                   	push   rbx
   1400076e6:	48 83 ec 20          	sub    rsp,0x20
   1400076ea:	89 ce                	mov    esi,ecx
   1400076ec:	31 c9                	xor    ecx,ecx
   1400076ee:	e8 ed fe ff ff       	call   1400075e0 <dtoa_lock>
   1400076f3:	83 fe 09             	cmp    esi,0x9
   1400076f6:	7f 1c                	jg     140007714 <__Balloc_D2A+0x31>
   1400076f8:	48 8d 05 a1 93 00 00 	lea    rax,[rip+0x93a1]        # 140010aa0 <freelist>
   1400076ff:	48 63 d6             	movsxd rdx,esi
   140007702:	48 8b 1c d0          	mov    rbx,QWORD PTR [rax+rdx*8]
   140007706:	48 85 db             	test   rbx,rbx
   140007709:	74 09                	je     140007714 <__Balloc_D2A+0x31>
   14000770b:	48 8b 0b             	mov    rcx,QWORD PTR [rbx]
   14000770e:	48 89 0c d0          	mov    QWORD PTR [rax+rdx*8],rcx
   140007712:	eb 6d                	jmp    140007781 <__Balloc_D2A+0x9e>
   140007714:	89 f1                	mov    ecx,esi
   140007716:	bf 01 00 00 00       	mov    edi,0x1
   14000771b:	d3 e7                	shl    edi,cl
   14000771d:	b9 ff ff ff ff       	mov    ecx,0xffffffff
   140007722:	8d 47 ff             	lea    eax,[rdi-0x1]
   140007725:	48 c1 e1 03          	shl    rcx,0x3
   140007729:	48 98                	cdqe
   14000772b:	48 8d 14 85 27 00 00 	lea    rdx,[rax*4+0x27]
   140007732:	00 
   140007733:	48 21 d1             	and    rcx,rdx
   140007736:	83 fe 09             	cmp    esi,0x9
   140007739:	7f 33                	jg     14000776e <__Balloc_D2A+0x8b>
   14000773b:	48 8b 1d 1e 3a 00 00 	mov    rbx,QWORD PTR [rip+0x3a1e]        # 14000b160 <pmem_next>
   140007742:	4c 8d 05 57 8a 00 00 	lea    r8,[rip+0x8a57]        # 1400101a0 <private_mem>
   140007749:	48 c1 ea 03          	shr    rdx,0x3
   14000774d:	48 89 d8             	mov    rax,rbx
   140007750:	4c 29 c0             	sub    rax,r8
   140007753:	48 c1 f8 03          	sar    rax,0x3
   140007757:	48 01 d0             	add    rax,rdx
   14000775a:	48 3d 20 01 00 00    	cmp    rax,0x120
   140007760:	77 0c                	ja     14000776e <__Balloc_D2A+0x8b>
   140007762:	48 01 d9             	add    rcx,rbx
   140007765:	48 89 0d f4 39 00 00 	mov    QWORD PTR [rip+0x39f4],rcx        # 14000b160 <pmem_next>
   14000776c:	eb 0d                	jmp    14000777b <__Balloc_D2A+0x98>
   14000776e:	e8 7d 34 00 00       	call   14000abf0 <malloc>
   140007773:	48 89 c3             	mov    rbx,rax
   140007776:	48 85 c0             	test   rax,rax
   140007779:	74 13                	je     14000778e <__Balloc_D2A+0xab>
   14000777b:	89 73 08             	mov    DWORD PTR [rbx+0x8],esi
   14000777e:	89 7b 0c             	mov    DWORD PTR [rbx+0xc],edi
   140007781:	31 c9                	xor    ecx,ecx
   140007783:	e8 fd fe ff ff       	call   140007685 <dtoa_unlock>
   140007788:	31 c0                	xor    eax,eax
   14000778a:	48 89 43 10          	mov    QWORD PTR [rbx+0x10],rax
   14000778e:	48 89 d8             	mov    rax,rbx
   140007791:	48 83 c4 20          	add    rsp,0x20
   140007795:	5b                   	pop    rbx
   140007796:	5e                   	pop    rsi
   140007797:	5f                   	pop    rdi
   140007798:	c3                   	ret

0000000140007799 <__Bfree_D2A>:
   140007799:	53                   	push   rbx
   14000779a:	48 83 ec 20          	sub    rsp,0x20
   14000779e:	48 89 cb             	mov    rbx,rcx
   1400077a1:	48 85 c9             	test   rcx,rcx
   1400077a4:	74 39                	je     1400077df <__Bfree_D2A+0x46>
   1400077a6:	83 79 08 09          	cmp    DWORD PTR [rcx+0x8],0x9
   1400077aa:	7e 0a                	jle    1400077b6 <__Bfree_D2A+0x1d>
   1400077ac:	48 83 c4 20          	add    rsp,0x20
   1400077b0:	5b                   	pop    rbx
   1400077b1:	e9 0a 34 00 00       	jmp    14000abc0 <free>
   1400077b6:	31 c9                	xor    ecx,ecx
   1400077b8:	e8 23 fe ff ff       	call   1400075e0 <dtoa_lock>
   1400077bd:	48 63 53 08          	movsxd rdx,DWORD PTR [rbx+0x8]
   1400077c1:	48 8d 05 d8 92 00 00 	lea    rax,[rip+0x92d8]        # 140010aa0 <freelist>
   1400077c8:	48 8b 0c d0          	mov    rcx,QWORD PTR [rax+rdx*8]
   1400077cc:	48 89 1c d0          	mov    QWORD PTR [rax+rdx*8],rbx
   1400077d0:	48 89 0b             	mov    QWORD PTR [rbx],rcx
   1400077d3:	31 c9                	xor    ecx,ecx
   1400077d5:	48 83 c4 20          	add    rsp,0x20
   1400077d9:	5b                   	pop    rbx
   1400077da:	e9 a6 fe ff ff       	jmp    140007685 <dtoa_unlock>
   1400077df:	48 83 c4 20          	add    rsp,0x20
   1400077e3:	5b                   	pop    rbx
   1400077e4:	c3                   	ret

00000001400077e5 <__multadd_D2A>:
   1400077e5:	55                   	push   rbp
   1400077e6:	57                   	push   rdi
   1400077e7:	56                   	push   rsi
   1400077e8:	53                   	push   rbx
   1400077e9:	48 83 ec 28          	sub    rsp,0x28
   1400077ed:	8b 79 14             	mov    edi,DWORD PTR [rcx+0x14]
   1400077f0:	48 89 cb             	mov    rbx,rcx
   1400077f3:	49 63 e8             	movsxd rbp,r8d
   1400077f6:	31 c9                	xor    ecx,ecx
   1400077f8:	48 63 d2             	movsxd rdx,edx
   1400077fb:	8b 44 8b 18          	mov    eax,DWORD PTR [rbx+rcx*4+0x18]
   1400077ff:	48 0f af c2          	imul   rax,rdx
   140007803:	48 01 e8             	add    rax,rbp
   140007806:	89 44 8b 18          	mov    DWORD PTR [rbx+rcx*4+0x18],eax
   14000780a:	48 89 c5             	mov    rbp,rax
   14000780d:	48 ff c1             	inc    rcx
   140007810:	48 c1 ed 20          	shr    rbp,0x20
   140007814:	39 cf                	cmp    edi,ecx
   140007816:	7f e3                	jg     1400077fb <__multadd_D2A+0x16>
   140007818:	48 89 de             	mov    rsi,rbx
   14000781b:	48 85 ed             	test   rbp,rbp
   14000781e:	74 4b                	je     14000786b <__multadd_D2A+0x86>
   140007820:	39 7b 0c             	cmp    DWORD PTR [rbx+0xc],edi
   140007823:	7f 37                	jg     14000785c <__multadd_D2A+0x77>
   140007825:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   140007828:	8d 48 01             	lea    ecx,[rax+0x1]
   14000782b:	e8 b3 fe ff ff       	call   1400076e3 <__Balloc_D2A>
   140007830:	48 89 c6             	mov    rsi,rax
   140007833:	48 85 c0             	test   rax,rax
   140007836:	74 33                	je     14000786b <__multadd_D2A+0x86>
   140007838:	48 63 43 14          	movsxd rax,DWORD PTR [rbx+0x14]
   14000783c:	48 8d 53 10          	lea    rdx,[rbx+0x10]
   140007840:	48 8d 4e 10          	lea    rcx,[rsi+0x10]
   140007844:	4c 8d 04 85 08 00 00 	lea    r8,[rax*4+0x8]
   14000784b:	00 
   14000784c:	e8 a7 33 00 00       	call   14000abf8 <memcpy>
   140007851:	48 89 d9             	mov    rcx,rbx
   140007854:	48 89 f3             	mov    rbx,rsi
   140007857:	e8 3d ff ff ff       	call   140007799 <__Bfree_D2A>
   14000785c:	48 63 c7             	movsxd rax,edi
   14000785f:	ff c7                	inc    edi
   140007861:	48 89 de             	mov    rsi,rbx
   140007864:	89 6c 83 18          	mov    DWORD PTR [rbx+rax*4+0x18],ebp
   140007868:	89 7b 14             	mov    DWORD PTR [rbx+0x14],edi
   14000786b:	48 89 f0             	mov    rax,rsi
   14000786e:	48 83 c4 28          	add    rsp,0x28
   140007872:	5b                   	pop    rbx
   140007873:	5e                   	pop    rsi
   140007874:	5f                   	pop    rdi
   140007875:	5d                   	pop    rbp
   140007876:	c3                   	ret

0000000140007877 <__i2b_D2A>:
   140007877:	53                   	push   rbx
   140007878:	48 83 ec 20          	sub    rsp,0x20
   14000787c:	89 cb                	mov    ebx,ecx
   14000787e:	b9 01 00 00 00       	mov    ecx,0x1
   140007883:	e8 5b fe ff ff       	call   1400076e3 <__Balloc_D2A>
   140007888:	48 85 c0             	test   rax,rax
   14000788b:	74 0a                	je     140007897 <__i2b_D2A+0x20>
   14000788d:	89 58 18             	mov    DWORD PTR [rax+0x18],ebx
   140007890:	c7 40 14 01 00 00 00 	mov    DWORD PTR [rax+0x14],0x1
   140007897:	48 83 c4 20          	add    rsp,0x20
   14000789b:	5b                   	pop    rbx
   14000789c:	c3                   	ret

000000014000789d <__mult_D2A>:
   14000789d:	41 57                	push   r15
   14000789f:	41 56                	push   r14
   1400078a1:	41 55                	push   r13
   1400078a3:	41 54                	push   r12
   1400078a5:	55                   	push   rbp
   1400078a6:	57                   	push   rdi
   1400078a7:	56                   	push   rsi
   1400078a8:	53                   	push   rbx
   1400078a9:	48 83 ec 38          	sub    rsp,0x38
   1400078ad:	48 63 69 14          	movsxd rbp,DWORD PTR [rcx+0x14]
   1400078b1:	48 63 7a 14          	movsxd rdi,DWORD PTR [rdx+0x14]
   1400078b5:	49 89 cc             	mov    r12,rcx
   1400078b8:	48 89 d6             	mov    rsi,rdx
   1400078bb:	39 fd                	cmp    ebp,edi
   1400078bd:	7c 0b                	jl     1400078ca <__mult_D2A+0x2d>
   1400078bf:	89 f8                	mov    eax,edi
   1400078c1:	4c 87 e6             	xchg   rsi,r12
   1400078c4:	48 63 fd             	movsxd rdi,ebp
   1400078c7:	48 63 e8             	movsxd rbp,eax
   1400078ca:	8b 4e 08             	mov    ecx,DWORD PTR [rsi+0x8]
   1400078cd:	8d 1c 2f             	lea    ebx,[rdi+rbp*1]
   1400078d0:	39 5e 0c             	cmp    DWORD PTR [rsi+0xc],ebx
   1400078d3:	7d 02                	jge    1400078d7 <__mult_D2A+0x3a>
   1400078d5:	ff c1                	inc    ecx
   1400078d7:	e8 07 fe ff ff       	call   1400076e3 <__Balloc_D2A>
   1400078dc:	49 89 c0             	mov    r8,rax
   1400078df:	48 85 c0             	test   rax,rax
   1400078e2:	0f 84 bc 00 00 00    	je     1400079a4 <__mult_D2A+0x107>
   1400078e8:	48 8d 48 18          	lea    rcx,[rax+0x18]
   1400078ec:	48 63 c3             	movsxd rax,ebx
   1400078ef:	4c 8d 0c 81          	lea    r9,[rcx+rax*4]
   1400078f3:	48 89 c8             	mov    rax,rcx
   1400078f6:	4c 39 c8             	cmp    rax,r9
   1400078f9:	73 0b                	jae    140007906 <__mult_D2A+0x69>
   1400078fb:	31 d2                	xor    edx,edx
   1400078fd:	48 83 c0 04          	add    rax,0x4
   140007901:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   140007904:	eb f0                	jmp    1400078f6 <__mult_D2A+0x59>
   140007906:	4c 8d 6e 18          	lea    r13,[rsi+0x18]
   14000790a:	48 8d 56 19          	lea    rdx,[rsi+0x19]
   14000790e:	49 8d 7c bd 00       	lea    rdi,[r13+rdi*4+0x0]
   140007913:	49 8d 44 24 18       	lea    rax,[r12+0x18]
   140007918:	48 39 d7             	cmp    rdi,rdx
   14000791b:	48 89 fa             	mov    rdx,rdi
   14000791e:	4c 8d 34 a8          	lea    r14,[rax+rbp*4]
   140007922:	0f 93 44 24 2f       	setae  BYTE PTR [rsp+0x2f]
   140007927:	48 29 f2             	sub    rdx,rsi
   14000792a:	48 8d 6a e7          	lea    rbp,[rdx-0x19]
   14000792e:	48 c1 ed 02          	shr    rbp,0x2
   140007932:	4c 39 f0             	cmp    rax,r14
   140007935:	73 65                	jae    14000799c <__mult_D2A+0xff>
   140007937:	8b 30                	mov    esi,DWORD PTR [rax]
   140007939:	48 83 c0 04          	add    rax,0x4
   14000793d:	85 f6                	test   esi,esi
   14000793f:	74 49                	je     14000798a <__mult_D2A+0xed>
   140007941:	49 89 cb             	mov    r11,rcx
   140007944:	4d 89 ea             	mov    r10,r13
   140007947:	45 31 e4             	xor    r12d,r12d
   14000794a:	41 8b 12             	mov    edx,DWORD PTR [r10]
   14000794d:	45 8b 3b             	mov    r15d,DWORD PTR [r11]
   140007950:	49 83 c2 04          	add    r10,0x4
   140007954:	49 83 c3 04          	add    r11,0x4
   140007958:	48 0f af d6          	imul   rdx,rsi
   14000795c:	4c 01 fa             	add    rdx,r15
   14000795f:	4c 01 e2             	add    rdx,r12
   140007962:	49 89 d4             	mov    r12,rdx
   140007965:	41 89 53 fc          	mov    DWORD PTR [r11-0x4],edx
   140007969:	49 c1 ec 20          	shr    r12,0x20
   14000796d:	49 39 fa             	cmp    r10,rdi
   140007970:	72 d8                	jb     14000794a <__mult_D2A+0xad>
   140007972:	31 f6                	xor    esi,esi
   140007974:	48 8d 14 ad 00 00 00 	lea    rdx,[rbp*4+0x0]
   14000797b:	00 
   14000797c:	80 7c 24 2f 00       	cmp    BYTE PTR [rsp+0x2f],0x0
   140007981:	48 0f 44 d6          	cmove  rdx,rsi
   140007985:	44 89 64 11 04       	mov    DWORD PTR [rcx+rdx*1+0x4],r12d
   14000798a:	48 83 c1 04          	add    rcx,0x4
   14000798e:	eb a2                	jmp    140007932 <__mult_D2A+0x95>
   140007990:	49 83 e9 04          	sub    r9,0x4
   140007994:	41 83 39 00          	cmp    DWORD PTR [r9],0x0
   140007998:	75 06                	jne    1400079a0 <__mult_D2A+0x103>
   14000799a:	ff cb                	dec    ebx
   14000799c:	85 db                	test   ebx,ebx
   14000799e:	7f f0                	jg     140007990 <__mult_D2A+0xf3>
   1400079a0:	41 89 58 14          	mov    DWORD PTR [r8+0x14],ebx
   1400079a4:	4c 89 c0             	mov    rax,r8
   1400079a7:	48 83 c4 38          	add    rsp,0x38
   1400079ab:	5b                   	pop    rbx
   1400079ac:	5e                   	pop    rsi
   1400079ad:	5f                   	pop    rdi
   1400079ae:	5d                   	pop    rbp
   1400079af:	41 5c                	pop    r12
   1400079b1:	41 5d                	pop    r13
   1400079b3:	41 5e                	pop    r14
   1400079b5:	41 5f                	pop    r15
   1400079b7:	c3                   	ret

00000001400079b8 <__pow5mult_D2A>:
   1400079b8:	55                   	push   rbp
   1400079b9:	57                   	push   rdi
   1400079ba:	56                   	push   rsi
   1400079bb:	53                   	push   rbx
   1400079bc:	48 83 ec 28          	sub    rsp,0x28
   1400079c0:	89 d0                	mov    eax,edx
   1400079c2:	48 89 cb             	mov    rbx,rcx
   1400079c5:	89 d7                	mov    edi,edx
   1400079c7:	83 e0 03             	and    eax,0x3
   1400079ca:	74 1e                	je     1400079ea <__pow5mult_D2A+0x32>
   1400079cc:	ff c8                	dec    eax
   1400079ce:	48 8d 15 0b 4d 00 00 	lea    rdx,[rip+0x4d0b]        # 14000c6e0 <p05.0>
   1400079d5:	45 31 c0             	xor    r8d,r8d
   1400079d8:	48 98                	cdqe
   1400079da:	8b 14 82             	mov    edx,DWORD PTR [rdx+rax*4]
   1400079dd:	e8 03 fe ff ff       	call   1400077e5 <__multadd_D2A>
   1400079e2:	48 89 c3             	mov    rbx,rax
   1400079e5:	48 85 c0             	test   rax,rax
   1400079e8:	74 44                	je     140007a2e <__pow5mult_D2A+0x76>
   1400079ea:	c1 ff 02             	sar    edi,0x2
   1400079ed:	0f 84 c6 00 00 00    	je     140007ab9 <__pow5mult_D2A+0x101>
   1400079f3:	48 8b 35 86 87 00 00 	mov    rsi,QWORD PTR [rip+0x8786]        # 140010180 <p5s>
   1400079fa:	48 85 f6             	test   rsi,rsi
   1400079fd:	75 71                	jne    140007a70 <__pow5mult_D2A+0xb8>
   1400079ff:	b9 01 00 00 00       	mov    ecx,0x1
   140007a04:	e8 d7 fb ff ff       	call   1400075e0 <dtoa_lock>
   140007a09:	48 8b 35 70 87 00 00 	mov    rsi,QWORD PTR [rip+0x8770]        # 140010180 <p5s>
   140007a10:	48 85 f6             	test   rsi,rsi
   140007a13:	75 25                	jne    140007a3a <__pow5mult_D2A+0x82>
   140007a15:	b9 71 02 00 00       	mov    ecx,0x271
   140007a1a:	e8 58 fe ff ff       	call   140007877 <__i2b_D2A>
   140007a1f:	48 89 05 5a 87 00 00 	mov    QWORD PTR [rip+0x875a],rax        # 140010180 <p5s>
   140007a26:	48 89 c6             	mov    rsi,rax
   140007a29:	48 85 c0             	test   rax,rax
   140007a2c:	75 07                	jne    140007a35 <__pow5mult_D2A+0x7d>
   140007a2e:	31 db                	xor    ebx,ebx
   140007a30:	e9 84 00 00 00       	jmp    140007ab9 <__pow5mult_D2A+0x101>
   140007a35:	31 d2                	xor    edx,edx
   140007a37:	48 89 10             	mov    QWORD PTR [rax],rdx
   140007a3a:	b9 01 00 00 00       	mov    ecx,0x1
   140007a3f:	e8 41 fc ff ff       	call   140007685 <dtoa_unlock>
   140007a44:	eb 2a                	jmp    140007a70 <__pow5mult_D2A+0xb8>
   140007a46:	48 89 d9             	mov    rcx,rbx
   140007a49:	48 89 f2             	mov    rdx,rsi
   140007a4c:	e8 4c fe ff ff       	call   14000789d <__mult_D2A>
   140007a51:	48 89 c3             	mov    rbx,rax
   140007a54:	48 85 c0             	test   rax,rax
   140007a57:	74 d5                	je     140007a2e <__pow5mult_D2A+0x76>
   140007a59:	48 89 e9             	mov    rcx,rbp
   140007a5c:	e8 38 fd ff ff       	call   140007799 <__Bfree_D2A>
   140007a61:	d1 ff                	sar    edi,1
   140007a63:	74 54                	je     140007ab9 <__pow5mult_D2A+0x101>
   140007a65:	48 8b 2e             	mov    rbp,QWORD PTR [rsi]
   140007a68:	48 85 ed             	test   rbp,rbp
   140007a6b:	74 12                	je     140007a7f <__pow5mult_D2A+0xc7>
   140007a6d:	48 89 ee             	mov    rsi,rbp
   140007a70:	48 89 dd             	mov    rbp,rbx
   140007a73:	f7 c7 01 00 00 00    	test   edi,0x1
   140007a79:	75 cb                	jne    140007a46 <__pow5mult_D2A+0x8e>
   140007a7b:	d1 ff                	sar    edi,1
   140007a7d:	eb e6                	jmp    140007a65 <__pow5mult_D2A+0xad>
   140007a7f:	b9 01 00 00 00       	mov    ecx,0x1
   140007a84:	e8 57 fb ff ff       	call   1400075e0 <dtoa_lock>
   140007a89:	48 8b 2e             	mov    rbp,QWORD PTR [rsi]
   140007a8c:	48 85 ed             	test   rbp,rbp
   140007a8f:	75 1c                	jne    140007aad <__pow5mult_D2A+0xf5>
   140007a91:	48 89 f2             	mov    rdx,rsi
   140007a94:	48 89 f1             	mov    rcx,rsi
   140007a97:	e8 01 fe ff ff       	call   14000789d <__mult_D2A>
   140007a9c:	48 89 06             	mov    QWORD PTR [rsi],rax
   140007a9f:	48 89 c5             	mov    rbp,rax
   140007aa2:	48 85 c0             	test   rax,rax
   140007aa5:	74 87                	je     140007a2e <__pow5mult_D2A+0x76>
   140007aa7:	31 c0                	xor    eax,eax
   140007aa9:	48 89 45 00          	mov    QWORD PTR [rbp+0x0],rax
   140007aad:	b9 01 00 00 00       	mov    ecx,0x1
   140007ab2:	e8 ce fb ff ff       	call   140007685 <dtoa_unlock>
   140007ab7:	eb b4                	jmp    140007a6d <__pow5mult_D2A+0xb5>
   140007ab9:	48 89 d8             	mov    rax,rbx
   140007abc:	48 83 c4 28          	add    rsp,0x28
   140007ac0:	5b                   	pop    rbx
   140007ac1:	5e                   	pop    rsi
   140007ac2:	5f                   	pop    rdi
   140007ac3:	5d                   	pop    rbp
   140007ac4:	c3                   	ret

0000000140007ac5 <__lshift_D2A>:
   140007ac5:	41 56                	push   r14
   140007ac7:	41 55                	push   r13
   140007ac9:	41 54                	push   r12
   140007acb:	55                   	push   rbp
   140007acc:	57                   	push   rdi
   140007acd:	56                   	push   rsi
   140007ace:	53                   	push   rbx
   140007acf:	48 83 ec 20          	sub    rsp,0x20
   140007ad3:	48 89 cb             	mov    rbx,rcx
   140007ad6:	89 d7                	mov    edi,edx
   140007ad8:	8b 49 08             	mov    ecx,DWORD PTR [rcx+0x8]
   140007adb:	89 d6                	mov    esi,edx
   140007add:	44 8b 6b 14          	mov    r13d,DWORD PTR [rbx+0x14]
   140007ae1:	c1 ff 05             	sar    edi,0x5
   140007ae4:	8b 43 0c             	mov    eax,DWORD PTR [rbx+0xc]
   140007ae7:	41 01 fd             	add    r13d,edi
   140007aea:	45 8d 65 01          	lea    r12d,[r13+0x1]
   140007aee:	44 39 e0             	cmp    eax,r12d
   140007af1:	7d 06                	jge    140007af9 <__lshift_D2A+0x34>
   140007af3:	ff c1                	inc    ecx
   140007af5:	01 c0                	add    eax,eax
   140007af7:	eb f5                	jmp    140007aee <__lshift_D2A+0x29>
   140007af9:	e8 e5 fb ff ff       	call   1400076e3 <__Balloc_D2A>
   140007afe:	48 89 c5             	mov    rbp,rax
   140007b01:	31 c0                	xor    eax,eax
   140007b03:	48 85 ed             	test   rbp,rbp
   140007b06:	0f 84 b2 00 00 00    	je     140007bbe <__lshift_D2A+0xf9>
   140007b0c:	39 c7                	cmp    edi,eax
   140007b0e:	7e 0b                	jle    140007b1b <__lshift_D2A+0x56>
   140007b10:	31 d2                	xor    edx,edx
   140007b12:	89 54 85 18          	mov    DWORD PTR [rbp+rax*4+0x18],edx
   140007b16:	48 ff c0             	inc    rax
   140007b19:	eb f1                	jmp    140007b0c <__lshift_D2A+0x47>
   140007b1b:	31 c0                	xor    eax,eax
   140007b1d:	85 ff                	test   edi,edi
   140007b1f:	48 63 4b 14          	movsxd rcx,DWORD PTR [rbx+0x14]
   140007b23:	0f 48 f8             	cmovs  edi,eax
   140007b26:	48 8d 43 18          	lea    rax,[rbx+0x18]
   140007b2a:	4c 8d 14 88          	lea    r10,[rax+rcx*4]
   140007b2e:	48 63 ff             	movsxd rdi,edi
   140007b31:	4c 8d 5c bd 18       	lea    r11,[rbp+rdi*4+0x18]
   140007b36:	4c 89 da             	mov    rdx,r11
   140007b39:	83 e6 1f             	and    esi,0x1f
   140007b3c:	74 5b                	je     140007b99 <__lshift_D2A+0xd4>
   140007b3e:	bf 20 00 00 00       	mov    edi,0x20
   140007b43:	45 31 c0             	xor    r8d,r8d
   140007b46:	29 f7                	sub    edi,esi
   140007b48:	44 8b 08             	mov    r9d,DWORD PTR [rax]
   140007b4b:	89 f1                	mov    ecx,esi
   140007b4d:	49 89 d6             	mov    r14,rdx
   140007b50:	48 83 c0 04          	add    rax,0x4
   140007b54:	48 83 c2 04          	add    rdx,0x4
   140007b58:	41 d3 e1             	shl    r9d,cl
   140007b5b:	89 f9                	mov    ecx,edi
   140007b5d:	45 09 c8             	or     r8d,r9d
   140007b60:	45 89 06             	mov    DWORD PTR [r14],r8d
   140007b63:	44 8b 40 fc          	mov    r8d,DWORD PTR [rax-0x4]
   140007b67:	41 d3 e8             	shr    r8d,cl
   140007b6a:	4c 39 d0             	cmp    rax,r10
   140007b6d:	72 d9                	jb     140007b48 <__lshift_D2A+0x83>
   140007b6f:	4c 89 d0             	mov    rax,r10
   140007b72:	48 8d 53 19          	lea    rdx,[rbx+0x19]
   140007b76:	48 29 d8             	sub    rax,rbx
   140007b79:	48 83 e8 19          	sub    rax,0x19
   140007b7d:	48 83 e0 fc          	and    rax,0xfffffffffffffffc
   140007b81:	49 39 d2             	cmp    r10,rdx
   140007b84:	ba 00 00 00 00       	mov    edx,0x0
   140007b89:	48 0f 42 c2          	cmovb  rax,rdx
   140007b8d:	45 89 44 03 04       	mov    DWORD PTR [r11+rax*1+0x4],r8d
   140007b92:	45 85 c0             	test   r8d,r8d
   140007b95:	75 1b                	jne    140007bb2 <__lshift_D2A+0xed>
   140007b97:	eb 16                	jmp    140007baf <__lshift_D2A+0xea>
   140007b99:	44 8b 00             	mov    r8d,DWORD PTR [rax]
   140007b9c:	48 89 d1             	mov    rcx,rdx
   140007b9f:	48 83 c0 04          	add    rax,0x4
   140007ba3:	48 83 c2 04          	add    rdx,0x4
   140007ba7:	44 89 01             	mov    DWORD PTR [rcx],r8d
   140007baa:	4c 39 d0             	cmp    rax,r10
   140007bad:	72 ea                	jb     140007b99 <__lshift_D2A+0xd4>
   140007baf:	45 89 ec             	mov    r12d,r13d
   140007bb2:	44 89 65 14          	mov    DWORD PTR [rbp+0x14],r12d
   140007bb6:	48 89 d9             	mov    rcx,rbx
   140007bb9:	e8 db fb ff ff       	call   140007799 <__Bfree_D2A>
   140007bbe:	48 89 e8             	mov    rax,rbp
   140007bc1:	48 83 c4 20          	add    rsp,0x20
   140007bc5:	5b                   	pop    rbx
   140007bc6:	5e                   	pop    rsi
   140007bc7:	5f                   	pop    rdi
   140007bc8:	5d                   	pop    rbp
   140007bc9:	41 5c                	pop    r12
   140007bcb:	41 5d                	pop    r13
   140007bcd:	41 5e                	pop    r14
   140007bcf:	c3                   	ret

0000000140007bd0 <__cmp_D2A>:
   140007bd0:	48 63 42 14          	movsxd rax,DWORD PTR [rdx+0x14]
   140007bd4:	49 89 d1             	mov    r9,rdx
   140007bd7:	8b 51 14             	mov    edx,DWORD PTR [rcx+0x14]
   140007bda:	29 c2                	sub    edx,eax
   140007bdc:	75 33                	jne    140007c11 <__cmp_D2A+0x41>
   140007bde:	48 c1 e0 02          	shl    rax,0x2
   140007be2:	48 83 c1 18          	add    rcx,0x18
   140007be6:	4c 8d 04 01          	lea    r8,[rcx+rax*1]
   140007bea:	4d 8d 54 01 18       	lea    r10,[r9+rax*1+0x18]
   140007bef:	31 c0                	xor    eax,eax
   140007bf1:	45 8b 5c 02 fc       	mov    r11d,DWORD PTR [r10+rax*1-0x4]
   140007bf6:	45 39 5c 00 fc       	cmp    DWORD PTR [r8+rax*1-0x4],r11d
   140007bfb:	74 07                	je     140007c04 <__cmp_D2A+0x34>
   140007bfd:	19 d2                	sbb    edx,edx
   140007bff:	83 ca 01             	or     edx,0x1
   140007c02:	eb 0d                	jmp    140007c11 <__cmp_D2A+0x41>
   140007c04:	48 83 e8 04          	sub    rax,0x4
   140007c08:	4d 8d 0c 00          	lea    r9,[r8+rax*1]
   140007c0c:	4c 39 c9             	cmp    rcx,r9
   140007c0f:	72 e0                	jb     140007bf1 <__cmp_D2A+0x21>
   140007c11:	89 d0                	mov    eax,edx
   140007c13:	c3                   	ret

0000000140007c14 <__diff_D2A>:
   140007c14:	41 55                	push   r13
   140007c16:	41 54                	push   r12
   140007c18:	55                   	push   rbp
   140007c19:	57                   	push   rdi
   140007c1a:	56                   	push   rsi
   140007c1b:	53                   	push   rbx
   140007c1c:	48 83 ec 28          	sub    rsp,0x28
   140007c20:	48 89 cb             	mov    rbx,rcx
   140007c23:	48 89 d6             	mov    rsi,rdx
   140007c26:	e8 a5 ff ff ff       	call   140007bd0 <__cmp_D2A>
   140007c2b:	85 c0                	test   eax,eax
   140007c2d:	75 1d                	jne    140007c4c <__diff_D2A+0x38>
   140007c2f:	31 c9                	xor    ecx,ecx
   140007c31:	e8 ad fa ff ff       	call   1400076e3 <__Balloc_D2A>
   140007c36:	48 85 c0             	test   rax,rax
   140007c39:	0f 84 02 01 00 00    	je     140007d41 <__diff_D2A+0x12d>
   140007c3f:	48 c7 40 14 01 00 00 	mov    QWORD PTR [rax+0x14],0x1
   140007c46:	00 
   140007c47:	e9 f5 00 00 00       	jmp    140007d41 <__diff_D2A+0x12d>
   140007c4c:	48 89 f5             	mov    rbp,rsi
   140007c4f:	48 0f 48 f3          	cmovs  rsi,rbx
   140007c53:	48 0f 49 eb          	cmovns rbp,rbx
   140007c57:	0f 98 c3             	sets   bl
   140007c5a:	0f b6 db             	movzx  ebx,bl
   140007c5d:	8b 4d 08             	mov    ecx,DWORD PTR [rbp+0x8]
   140007c60:	e8 7e fa ff ff       	call   1400076e3 <__Balloc_D2A>
   140007c65:	48 85 c0             	test   rax,rax
   140007c68:	0f 84 d3 00 00 00    	je     140007d41 <__diff_D2A+0x12d>
   140007c6e:	48 63 55 14          	movsxd rdx,DWORD PTR [rbp+0x14]
   140007c72:	89 58 10             	mov    DWORD PTR [rax+0x10],ebx
   140007c75:	48 8d 5d 18          	lea    rbx,[rbp+0x18]
   140007c79:	48 8d 4e 18          	lea    rcx,[rsi+0x18]
   140007c7d:	4c 8d 58 18          	lea    r11,[rax+0x18]
   140007c81:	45 31 e4             	xor    r12d,r12d
   140007c84:	45 31 d2             	xor    r10d,r10d
   140007c87:	49 89 d0             	mov    r8,rdx
   140007c8a:	4c 8d 0c 93          	lea    r9,[rbx+rdx*4]
   140007c8e:	48 63 56 14          	movsxd rdx,DWORD PTR [rsi+0x14]
   140007c92:	48 8d 3c 91          	lea    rdi,[rcx+rdx*4]
   140007c96:	42 8b 54 25 18       	mov    edx,DWORD PTR [rbp+r12*1+0x18]
   140007c9b:	44 8b 29             	mov    r13d,DWORD PTR [rcx]
   140007c9e:	48 83 c1 04          	add    rcx,0x4
   140007ca2:	4c 29 ea             	sub    rdx,r13
   140007ca5:	4c 29 d2             	sub    rdx,r10
   140007ca8:	49 89 d2             	mov    r10,rdx
   140007cab:	42 89 54 20 18       	mov    DWORD PTR [rax+r12*1+0x18],edx
   140007cb0:	49 83 c4 04          	add    r12,0x4
   140007cb4:	49 c1 ea 20          	shr    r10,0x20
   140007cb8:	41 83 e2 01          	and    r10d,0x1
   140007cbc:	48 39 f9             	cmp    rcx,rdi
   140007cbf:	72 d5                	jb     140007c96 <__diff_D2A+0x82>
   140007cc1:	48 89 fa             	mov    rdx,rdi
   140007cc4:	48 8d 4e 19          	lea    rcx,[rsi+0x19]
   140007cc8:	48 29 f2             	sub    rdx,rsi
   140007ccb:	48 83 ea 19          	sub    rdx,0x19
   140007ccf:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
   140007cd3:	48 39 cf             	cmp    rdi,rcx
   140007cd6:	b9 00 00 00 00       	mov    ecx,0x0
   140007cdb:	48 0f 42 d1          	cmovb  rdx,rcx
   140007cdf:	48 8d 0c 13          	lea    rcx,[rbx+rdx*1]
   140007ce3:	49 8d 74 13 04       	lea    rsi,[r11+rdx*1+0x4]
   140007ce8:	49 29 db             	sub    r11,rbx
   140007ceb:	48 8d 79 04          	lea    rdi,[rcx+0x4]
   140007cef:	48 89 fa             	mov    rdx,rdi
   140007cf2:	4c 39 ca             	cmp    rdx,r9
   140007cf5:	73 1b                	jae    140007d12 <__diff_D2A+0xfe>
   140007cf7:	8b 1a                	mov    ebx,DWORD PTR [rdx]
   140007cf9:	48 83 c2 04          	add    rdx,0x4
   140007cfd:	4c 29 d3             	sub    rbx,r10
   140007d00:	49 89 da             	mov    r10,rbx
   140007d03:	42 89 5c 1a fc       	mov    DWORD PTR [rdx+r11*1-0x4],ebx
   140007d08:	49 c1 ea 20          	shr    r10,0x20
   140007d0c:	41 83 e2 01          	and    r10d,0x1
   140007d10:	eb e0                	jmp    140007cf2 <__diff_D2A+0xde>
   140007d12:	49 8d 51 03          	lea    rdx,[r9+0x3]
   140007d16:	48 ff c1             	inc    rcx
   140007d19:	48 29 fa             	sub    rdx,rdi
   140007d1c:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
   140007d20:	49 39 c9             	cmp    r9,rcx
   140007d23:	b9 00 00 00 00       	mov    ecx,0x0
   140007d28:	48 0f 42 d1          	cmovb  rdx,rcx
   140007d2c:	48 01 f2             	add    rdx,rsi
   140007d2f:	48 83 ea 04          	sub    rdx,0x4
   140007d33:	83 3a 00             	cmp    DWORD PTR [rdx],0x0
   140007d36:	75 05                	jne    140007d3d <__diff_D2A+0x129>
   140007d38:	41 ff c8             	dec    r8d
   140007d3b:	eb f2                	jmp    140007d2f <__diff_D2A+0x11b>
   140007d3d:	44 89 40 14          	mov    DWORD PTR [rax+0x14],r8d
   140007d41:	48 83 c4 28          	add    rsp,0x28
   140007d45:	5b                   	pop    rbx
   140007d46:	5e                   	pop    rsi
   140007d47:	5f                   	pop    rdi
   140007d48:	5d                   	pop    rbp
   140007d49:	41 5c                	pop    r12
   140007d4b:	41 5d                	pop    r13
   140007d4d:	c3                   	ret

0000000140007d4e <__b2d_D2A>:
   140007d4e:	57                   	push   rdi
   140007d4f:	56                   	push   rsi
   140007d50:	53                   	push   rbx
   140007d51:	48 63 41 14          	movsxd rax,DWORD PTR [rcx+0x14]
   140007d55:	48 8d 59 18          	lea    rbx,[rcx+0x18]
   140007d59:	49 89 d0             	mov    r8,rdx
   140007d5c:	48 8d 3c 83          	lea    rdi,[rbx+rax*4]
   140007d60:	b8 20 00 00 00       	mov    eax,0x20
   140007d65:	8b 77 fc             	mov    esi,DWORD PTR [rdi-0x4]
   140007d68:	4c 8d 4f fc          	lea    r9,[rdi-0x4]
   140007d6c:	0f bd d6             	bsr    edx,esi
   140007d6f:	83 f2 1f             	xor    edx,0x1f
   140007d72:	29 d0                	sub    eax,edx
   140007d74:	41 89 00             	mov    DWORD PTR [r8],eax
   140007d77:	83 fa 0a             	cmp    edx,0xa
   140007d7a:	7f 2f                	jg     140007dab <__b2d_D2A+0x5d>
   140007d7c:	41 bb 0b 00 00 00    	mov    r11d,0xb
   140007d82:	89 f0                	mov    eax,esi
   140007d84:	45 31 d2             	xor    r10d,r10d
   140007d87:	41 29 d3             	sub    r11d,edx
   140007d8a:	44 89 d9             	mov    ecx,r11d
   140007d8d:	d3 e8                	shr    eax,cl
   140007d8f:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   140007d94:	48 c1 e0 20          	shl    rax,0x20
   140007d98:	4c 39 cb             	cmp    rbx,r9
   140007d9b:	73 04                	jae    140007da1 <__b2d_D2A+0x53>
   140007d9d:	44 8b 57 f8          	mov    r10d,DWORD PTR [rdi-0x8]
   140007da1:	8d 4a 15             	lea    ecx,[rdx+0x15]
   140007da4:	d3 e6                	shl    esi,cl
   140007da6:	41 89 f0             	mov    r8d,esi
   140007da9:	eb 48                	jmp    140007df3 <__b2d_D2A+0xa5>
   140007dab:	45 31 c0             	xor    r8d,r8d
   140007dae:	4c 39 cb             	cmp    rbx,r9
   140007db1:	73 08                	jae    140007dbb <__b2d_D2A+0x6d>
   140007db3:	44 8b 47 f8          	mov    r8d,DWORD PTR [rdi-0x8]
   140007db7:	4c 8d 4f f8          	lea    r9,[rdi-0x8]
   140007dbb:	83 ea 0b             	sub    edx,0xb
   140007dbe:	74 3e                	je     140007dfe <__b2d_D2A+0xb0>
   140007dc0:	41 bb 20 00 00 00    	mov    r11d,0x20
   140007dc6:	89 d1                	mov    ecx,edx
   140007dc8:	89 f0                	mov    eax,esi
   140007dca:	44 89 c7             	mov    edi,r8d
   140007dcd:	41 29 d3             	sub    r11d,edx
   140007dd0:	d3 e0                	shl    eax,cl
   140007dd2:	45 31 d2             	xor    r10d,r10d
   140007dd5:	44 89 d9             	mov    ecx,r11d
   140007dd8:	d3 ef                	shr    edi,cl
   140007dda:	09 f8                	or     eax,edi
   140007ddc:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   140007de1:	48 c1 e0 20          	shl    rax,0x20
   140007de5:	4c 39 cb             	cmp    rbx,r9
   140007de8:	73 04                	jae    140007dee <__b2d_D2A+0xa0>
   140007dea:	45 8b 51 fc          	mov    r10d,DWORD PTR [r9-0x4]
   140007dee:	89 d1                	mov    ecx,edx
   140007df0:	41 d3 e0             	shl    r8d,cl
   140007df3:	44 89 d9             	mov    ecx,r11d
   140007df6:	41 d3 ea             	shr    r10d,cl
   140007df9:	45 09 d0             	or     r8d,r10d
   140007dfc:	eb 0b                	jmp    140007e09 <__b2d_D2A+0xbb>
   140007dfe:	89 f0                	mov    eax,esi
   140007e00:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   140007e05:	48 c1 e0 20          	shl    rax,0x20
   140007e09:	4c 09 c0             	or     rax,r8
   140007e0c:	66 48 0f 6e c0       	movq   xmm0,rax
   140007e11:	5b                   	pop    rbx
   140007e12:	5e                   	pop    rsi
   140007e13:	5f                   	pop    rdi
   140007e14:	c3                   	ret

0000000140007e15 <__d2b_D2A>:
   140007e15:	57                   	push   rdi
   140007e16:	56                   	push   rsi
   140007e17:	53                   	push   rbx
   140007e18:	48 83 ec 20          	sub    rsp,0x20
   140007e1c:	b9 01 00 00 00       	mov    ecx,0x1
   140007e21:	66 48 0f 7e c3       	movq   rbx,xmm0
   140007e26:	48 89 d7             	mov    rdi,rdx
   140007e29:	4c 89 c6             	mov    rsi,r8
   140007e2c:	e8 b2 f8 ff ff       	call   1400076e3 <__Balloc_D2A>
   140007e31:	49 89 c2             	mov    r10,rax
   140007e34:	48 85 c0             	test   rax,rax
   140007e37:	0f 84 9f 00 00 00    	je     140007edc <__d2b_D2A+0xc7>
   140007e3d:	49 89 d8             	mov    r8,rbx
   140007e40:	49 c1 e8 20          	shr    r8,0x20
   140007e44:	45 89 c1             	mov    r9d,r8d
   140007e47:	41 c1 e8 14          	shr    r8d,0x14
   140007e4b:	41 81 e1 ff ff 0f 00 	and    r9d,0xfffff
   140007e52:	41 81 e0 ff 07 00 00 	and    r8d,0x7ff
   140007e59:	74 07                	je     140007e62 <__d2b_D2A+0x4d>
   140007e5b:	41 81 c9 00 00 10 00 	or     r9d,0x100000
   140007e62:	48 89 da             	mov    rdx,rbx
   140007e65:	85 db                	test   ebx,ebx
   140007e67:	74 2c                	je     140007e95 <__d2b_D2A+0x80>
   140007e69:	0f bc c3             	bsf    eax,ebx
   140007e6c:	89 c1                	mov    ecx,eax
   140007e6e:	d3 ea                	shr    edx,cl
   140007e70:	85 c0                	test   eax,eax
   140007e72:	74 0e                	je     140007e82 <__d2b_D2A+0x6d>
   140007e74:	f7 d9                	neg    ecx
   140007e76:	44 89 cb             	mov    ebx,r9d
   140007e79:	d3 e3                	shl    ebx,cl
   140007e7b:	89 c1                	mov    ecx,eax
   140007e7d:	09 da                	or     edx,ebx
   140007e7f:	41 d3 e9             	shr    r9d,cl
   140007e82:	41 83 f9 01          	cmp    r9d,0x1
   140007e86:	41 89 52 18          	mov    DWORD PTR [r10+0x18],edx
   140007e8a:	19 d2                	sbb    edx,edx
   140007e8c:	45 89 4a 1c          	mov    DWORD PTR [r10+0x1c],r9d
   140007e90:	83 c2 02             	add    edx,0x2
   140007e93:	eb 13                	jmp    140007ea8 <__d2b_D2A+0x93>
   140007e95:	41 0f bc c9          	bsf    ecx,r9d
   140007e99:	ba 01 00 00 00       	mov    edx,0x1
   140007e9e:	41 d3 e9             	shr    r9d,cl
   140007ea1:	8d 41 20             	lea    eax,[rcx+0x20]
   140007ea4:	45 89 4a 18          	mov    DWORD PTR [r10+0x18],r9d
   140007ea8:	41 89 52 14          	mov    DWORD PTR [r10+0x14],edx
   140007eac:	45 85 c0             	test   r8d,r8d
   140007eaf:	74 11                	je     140007ec2 <__d2b_D2A+0xad>
   140007eb1:	41 8d 94 00 cd fb ff 	lea    edx,[r8+rax*1-0x433]
   140007eb8:	ff 
   140007eb9:	89 17                	mov    DWORD PTR [rdi],edx
   140007ebb:	ba 35 00 00 00       	mov    edx,0x35
   140007ec0:	eb 16                	jmp    140007ed8 <__d2b_D2A+0xc3>
   140007ec2:	2d 32 04 00 00       	sub    eax,0x432
   140007ec7:	89 07                	mov    DWORD PTR [rdi],eax
   140007ec9:	48 63 c2             	movsxd rax,edx
   140007ecc:	c1 e2 05             	shl    edx,0x5
   140007ecf:	41 0f bd 44 82 14    	bsr    eax,DWORD PTR [r10+rax*4+0x14]
   140007ed5:	83 f0 1f             	xor    eax,0x1f
   140007ed8:	29 c2                	sub    edx,eax
   140007eda:	89 16                	mov    DWORD PTR [rsi],edx
   140007edc:	4c 89 d0             	mov    rax,r10
   140007edf:	48 83 c4 20          	add    rsp,0x20
   140007ee3:	5b                   	pop    rbx
   140007ee4:	5e                   	pop    rsi
   140007ee5:	5f                   	pop    rdi
   140007ee6:	c3                   	ret

0000000140007ee7 <__strcp_D2A>:
   140007ee7:	31 c0                	xor    eax,eax
   140007ee9:	44 8a 04 02          	mov    r8b,BYTE PTR [rdx+rax*1]
   140007eed:	49 89 c1             	mov    r9,rax
   140007ef0:	44 88 04 01          	mov    BYTE PTR [rcx+rax*1],r8b
   140007ef4:	48 ff c0             	inc    rax
   140007ef7:	45 84 c0             	test   r8b,r8b
   140007efa:	75 ed                	jne    140007ee9 <__strcp_D2A+0x2>
   140007efc:	4a 8d 04 09          	lea    rax,[rcx+r9*1]
   140007f00:	c3                   	ret
   140007f01:	90                   	nop
   140007f02:	90                   	nop
   140007f03:	90                   	nop
   140007f04:	90                   	nop
   140007f05:	90                   	nop
   140007f06:	90                   	nop
   140007f07:	90                   	nop
   140007f08:	90                   	nop
   140007f09:	90                   	nop
   140007f0a:	90                   	nop
   140007f0b:	90                   	nop
   140007f0c:	90                   	nop
   140007f0d:	90                   	nop
   140007f0e:	90                   	nop
   140007f0f:	90                   	nop

0000000140007f10 <__increment_D2A>:
   140007f10:	56                   	push   rsi
   140007f11:	53                   	push   rbx
   140007f12:	48 83 ec 28          	sub    rsp,0x28
   140007f16:	48 63 51 14          	movsxd rdx,DWORD PTR [rcx+0x14]
   140007f1a:	48 8d 41 18          	lea    rax,[rcx+0x18]
   140007f1e:	48 89 cb             	mov    rbx,rcx
   140007f21:	48 89 d1             	mov    rcx,rdx
   140007f24:	4c 8d 04 90          	lea    r8,[rax+rdx*4]
   140007f28:	8b 10                	mov    edx,DWORD PTR [rax]
   140007f2a:	83 fa ff             	cmp    edx,0xffffffff
   140007f2d:	74 06                	je     140007f35 <__increment_D2A+0x25>
   140007f2f:	ff c2                	inc    edx
   140007f31:	89 10                	mov    DWORD PTR [rax],edx
   140007f33:	eb 57                	jmp    140007f8c <__increment_D2A+0x7c>
   140007f35:	48 83 c0 04          	add    rax,0x4
   140007f39:	31 d2                	xor    edx,edx
   140007f3b:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   140007f3e:	4c 39 c0             	cmp    rax,r8
   140007f41:	72 e5                	jb     140007f28 <__increment_D2A+0x18>
   140007f43:	3b 4b 0c             	cmp    ecx,DWORD PTR [rbx+0xc]
   140007f46:	7c 32                	jl     140007f7a <__increment_D2A+0x6a>
   140007f48:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   140007f4b:	8d 48 01             	lea    ecx,[rax+0x1]
   140007f4e:	e8 90 f7 ff ff       	call   1400076e3 <__Balloc_D2A>
   140007f53:	48 8d 53 10          	lea    rdx,[rbx+0x10]
   140007f57:	48 89 c6             	mov    rsi,rax
   140007f5a:	48 63 43 14          	movsxd rax,DWORD PTR [rbx+0x14]
   140007f5e:	48 8d 4e 10          	lea    rcx,[rsi+0x10]
   140007f62:	4c 8d 04 85 08 00 00 	lea    r8,[rax*4+0x8]
   140007f69:	00 
   140007f6a:	e8 89 2c 00 00       	call   14000abf8 <memcpy>
   140007f6f:	48 89 d9             	mov    rcx,rbx
   140007f72:	48 89 f3             	mov    rbx,rsi
   140007f75:	e8 1f f8 ff ff       	call   140007799 <__Bfree_D2A>
   140007f7a:	48 63 43 14          	movsxd rax,DWORD PTR [rbx+0x14]
   140007f7e:	8d 50 01             	lea    edx,[rax+0x1]
   140007f81:	89 53 14             	mov    DWORD PTR [rbx+0x14],edx
   140007f84:	c7 44 83 18 01 00 00 	mov    DWORD PTR [rbx+rax*4+0x18],0x1
   140007f8b:	00 
   140007f8c:	48 89 d8             	mov    rax,rbx
   140007f8f:	48 83 c4 28          	add    rsp,0x28
   140007f93:	5b                   	pop    rbx
   140007f94:	5e                   	pop    rsi
   140007f95:	c3                   	ret

0000000140007f96 <rvOK.constprop.0.isra.0>:
   140007f96:	41 57                	push   r15
   140007f98:	41 56                	push   r14
   140007f9a:	41 55                	push   r13
   140007f9c:	41 54                	push   r12
   140007f9e:	55                   	push   rbp
   140007f9f:	57                   	push   rdi
   140007fa0:	56                   	push   rsi
   140007fa1:	53                   	push   rbx
   140007fa2:	48 83 ec 48          	sub    rsp,0x48
   140007fa6:	8b bc 24 b0 00 00 00 	mov    edi,DWORD PTR [rsp+0xb0]
   140007fad:	8b b4 24 b8 00 00 00 	mov    esi,DWORD PTR [rsp+0xb8]
   140007fb4:	4c 8b ac 24 c0 00 00 	mov    r13,QWORD PTR [rsp+0xc0]
   140007fbb:	00 
   140007fbc:	49 89 d4             	mov    r12,rdx
   140007fbf:	4d 89 c7             	mov    r15,r8
   140007fc2:	48 8d 54 24 3c       	lea    rdx,[rsp+0x3c]
   140007fc7:	4c 89 8c 24 a8 00 00 	mov    QWORD PTR [rsp+0xa8],r9
   140007fce:	00 
   140007fcf:	4c 8d 44 24 38       	lea    r8,[rsp+0x38]
   140007fd4:	e8 3c fe ff ff       	call   140007e15 <__d2b_D2A>
   140007fd9:	41 8b 2c 24          	mov    ebp,DWORD PTR [r12]
   140007fdd:	48 89 c3             	mov    rbx,rax
   140007fe0:	8b 44 24 38          	mov    eax,DWORD PTR [rsp+0x38]
   140007fe4:	89 c2                	mov    edx,eax
   140007fe6:	29 ea                	sub    edx,ebp
   140007fe8:	01 54 24 3c          	add    DWORD PTR [rsp+0x3c],edx
   140007fec:	89 54 24 38          	mov    DWORD PTR [rsp+0x38],edx
   140007ff0:	85 d2                	test   edx,edx
   140007ff2:	7f 24                	jg     140008018 <rvOK.constprop.0.isra.0+0x82>
   140007ff4:	85 ff                	test   edi,edi
   140007ff6:	0f 84 12 02 00 00    	je     14000820e <rvOK.constprop.0.isra.0+0x278>
   140007ffc:	85 d2                	test   edx,edx
   140007ffe:	0f 84 fe 00 00 00    	je     140008102 <rvOK.constprop.0.isra.0+0x16c>
   140008004:	89 ea                	mov    edx,ebp
   140008006:	48 89 d9             	mov    rcx,rbx
   140008009:	29 c2                	sub    edx,eax
   14000800b:	e8 b5 fa ff ff       	call   140007ac5 <__lshift_D2A>
   140008010:	48 89 c3             	mov    rbx,rax
   140008013:	e9 ea 00 00 00       	jmp    140008102 <rvOK.constprop.0.isra.0+0x16c>
   140008018:	83 fd 35             	cmp    ebp,0x35
   14000801b:	75 17                	jne    140008034 <rvOK.constprop.0.isra.0+0x9e>
   14000801d:	85 ff                	test   edi,edi
   14000801f:	0f 84 e9 01 00 00    	je     14000820e <rvOK.constprop.0.isra.0+0x278>
   140008025:	41 83 7c 24 0c 01    	cmp    DWORD PTR [r12+0xc],0x1
   14000802b:	74 46                	je     140008073 <rvOK.constprop.0.isra.0+0xdd>
   14000802d:	31 ff                	xor    edi,edi
   14000802f:	e9 da 01 00 00       	jmp    14000820e <rvOK.constprop.0.isra.0+0x278>
   140008034:	83 fe 01             	cmp    esi,0x1
   140008037:	74 3a                	je     140008073 <rvOK.constprop.0.isra.0+0xdd>
   140008039:	83 fe 02             	cmp    esi,0x2
   14000803c:	74 3a                	je     140008078 <rvOK.constprop.0.isra.0+0xe2>
   14000803e:	89 d1                	mov    ecx,edx
   140008040:	ff c9                	dec    ecx
   140008042:	75 18                	jne    14000805c <rvOK.constprop.0.isra.0+0xc6>
   140008044:	85 ff                	test   edi,edi
   140008046:	0f 84 c2 01 00 00    	je     14000820e <rvOK.constprop.0.isra.0+0x278>
   14000804c:	44 8a 43 18          	mov    r8b,BYTE PTR [rbx+0x18]
   140008050:	41 d0 e8             	shr    r8b,1
   140008053:	45 89 c6             	mov    r14d,r8d
   140008056:	41 83 e6 01          	and    r14d,0x1
   14000805a:	eb 22                	jmp    14000807e <rvOK.constprop.0.isra.0+0xe8>
   14000805c:	89 c8                	mov    eax,ecx
   14000805e:	45 31 f6             	xor    r14d,r14d
   140008061:	c1 f8 05             	sar    eax,0x5
   140008064:	48 98                	cdqe
   140008066:	8b 44 83 18          	mov    eax,DWORD PTR [rbx+rax*4+0x18]
   14000806a:	0f a3 c8             	bt     eax,ecx
   14000806d:	41 0f 92 c6          	setb   r14b
   140008071:	eb 0b                	jmp    14000807e <rvOK.constprop.0.isra.0+0xe8>
   140008073:	45 31 f6             	xor    r14d,r14d
   140008076:	eb 06                	jmp    14000807e <rvOK.constprop.0.isra.0+0xe8>
   140008078:	41 be 01 00 00 00    	mov    r14d,0x1
   14000807e:	48 89 d9             	mov    rcx,rbx
   140008081:	e8 63 24 00 00       	call   14000a4e9 <__any_on_D2A>
   140008086:	8b 54 24 38          	mov    edx,DWORD PTR [rsp+0x38]
   14000808a:	48 89 d9             	mov    rcx,rbx
   14000808d:	89 c6                	mov    esi,eax
   14000808f:	e8 2c f4 ff ff       	call   1400074c0 <__rshift_D2A>
   140008094:	45 85 f6             	test   r14d,r14d
   140008097:	75 12                	jne    1400080ab <rvOK.constprop.0.isra.0+0x115>
   140008099:	45 31 c9             	xor    r9d,r9d
   14000809c:	85 f6                	test   esi,esi
   14000809e:	41 0f 95 c1          	setne  r9b
   1400080a2:	41 c1 e1 04          	shl    r9d,0x4
   1400080a6:	45 89 ce             	mov    r14d,r9d
   1400080a9:	eb 5c                	jmp    140008107 <rvOK.constprop.0.isra.0+0x171>
   1400080ab:	48 89 d9             	mov    rcx,rbx
   1400080ae:	e8 5d fe ff ff       	call   140007f10 <__increment_D2A>
   1400080b3:	89 ea                	mov    edx,ebp
   1400080b5:	48 89 c3             	mov    rbx,rax
   1400080b8:	83 e2 1f             	and    edx,0x1f
   1400080bb:	74 09                	je     1400080c6 <rvOK.constprop.0.isra.0+0x130>
   1400080bd:	b8 20 00 00 00       	mov    eax,0x20
   1400080c2:	29 d0                	sub    eax,edx
   1400080c4:	89 c2                	mov    edx,eax
   1400080c6:	8b 43 14             	mov    eax,DWORD PTR [rbx+0x14]
   1400080c9:	41 be 20 00 00 00    	mov    r14d,0x20
   1400080cf:	ff c8                	dec    eax
   1400080d1:	48 98                	cdqe
   1400080d3:	0f bd 44 83 18       	bsr    eax,DWORD PTR [rbx+rax*4+0x18]
   1400080d8:	83 f0 1f             	xor    eax,0x1f
   1400080db:	39 d0                	cmp    eax,edx
   1400080dd:	74 28                	je     140008107 <rvOK.constprop.0.isra.0+0x171>
   1400080df:	85 f6                	test   esi,esi
   1400080e1:	75 06                	jne    1400080e9 <rvOK.constprop.0.isra.0+0x153>
   1400080e3:	8b 73 18             	mov    esi,DWORD PTR [rbx+0x18]
   1400080e6:	83 e6 01             	and    esi,0x1
   1400080e9:	ba 01 00 00 00       	mov    edx,0x1
   1400080ee:	48 89 d9             	mov    rcx,rbx
   1400080f1:	41 be 20 00 00 00    	mov    r14d,0x20
   1400080f7:	e8 c4 f3 ff ff       	call   1400074c0 <__rshift_D2A>
   1400080fc:	ff 44 24 3c          	inc    DWORD PTR [rsp+0x3c]
   140008100:	eb 05                	jmp    140008107 <rvOK.constprop.0.isra.0+0x171>
   140008102:	31 f6                	xor    esi,esi
   140008104:	45 31 f6             	xor    r14d,r14d
   140008107:	41 8b 44 24 04       	mov    eax,DWORD PTR [r12+0x4]
   14000810c:	8b 54 24 3c          	mov    edx,DWORD PTR [rsp+0x3c]
   140008110:	39 d0                	cmp    eax,edx
   140008112:	0f 8e aa 00 00 00    	jle    1400081c2 <rvOK.constprop.0.isra.0+0x22c>
   140008118:	41 89 c0             	mov    r8d,eax
   14000811b:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   14000811f:	41 29 d0             	sub    r8d,edx
   140008122:	44 39 c5             	cmp    ebp,r8d
   140008125:	7c 08                	jl     14000812f <rvOK.constprop.0.isra.0+0x199>
   140008127:	41 83 7c 24 10 00    	cmp    DWORD PTR [r12+0x10],0x0
   14000812d:	74 12                	je     140008141 <rvOK.constprop.0.isra.0+0x1ab>
   14000812f:	31 d2                	xor    edx,edx
   140008131:	89 53 14             	mov    DWORD PTR [rbx+0x14],edx
   140008134:	41 c7 45 00 50 00 00 	mov    DWORD PTR [r13+0x0],0x50
   14000813b:	00 
   14000813c:	e9 a8 00 00 00       	jmp    1400081e9 <rvOK.constprop.0.isra.0+0x253>
   140008141:	45 8d 60 ff          	lea    r12d,[r8-0x1]
   140008145:	41 83 f8 01          	cmp    r8d,0x1
   140008149:	74 1b                	je     140008166 <rvOK.constprop.0.isra.0+0x1d0>
   14000814b:	85 f6                	test   esi,esi
   14000814d:	75 17                	jne    140008166 <rvOK.constprop.0.isra.0+0x1d0>
   14000814f:	44 89 e2             	mov    edx,r12d
   140008152:	48 89 d9             	mov    rcx,rbx
   140008155:	44 89 44 24 2c       	mov    DWORD PTR [rsp+0x2c],r8d
   14000815a:	e8 8a 23 00 00       	call   14000a4e9 <__any_on_D2A>
   14000815f:	44 8b 44 24 2c       	mov    r8d,DWORD PTR [rsp+0x2c]
   140008164:	89 c6                	mov    esi,eax
   140008166:	89 f8                	mov    eax,edi
   140008168:	bf 00 00 00 00       	mov    edi,0x0
   14000816d:	09 f0                	or     eax,esi
   14000816f:	0f 84 99 00 00 00    	je     14000820e <rvOK.constprop.0.isra.0+0x278>
   140008175:	44 89 e0             	mov    eax,r12d
   140008178:	44 89 e1             	mov    ecx,r12d
   14000817b:	bf 01 00 00 00       	mov    edi,0x1
   140008180:	44 89 c2             	mov    edx,r8d
   140008183:	c1 f8 05             	sar    eax,0x5
   140008186:	d3 e7                	shl    edi,cl
   140008188:	48 89 d9             	mov    rcx,rbx
   14000818b:	48 98                	cdqe
   14000818d:	23 7c 83 18          	and    edi,DWORD PTR [rbx+rax*4+0x18]
   140008191:	e8 2a f3 ff ff       	call   1400074c0 <__rshift_D2A>
   140008196:	41 c7 45 00 02 00 00 	mov    DWORD PTR [r13+0x0],0x2
   14000819d:	00 
   14000819e:	85 ff                	test   edi,edi
   1400081a0:	74 13                	je     1400081b5 <rvOK.constprop.0.isra.0+0x21f>
   1400081a2:	48 89 d9             	mov    rcx,rbx
   1400081a5:	41 be 60 00 00 00    	mov    r14d,0x60
   1400081ab:	e8 60 fd ff ff       	call   140007f10 <__increment_D2A>
   1400081b0:	48 89 c3             	mov    rbx,rax
   1400081b3:	eb 37                	jmp    1400081ec <rvOK.constprop.0.isra.0+0x256>
   1400081b5:	85 f6                	test   esi,esi
   1400081b7:	b8 50 00 00 00       	mov    eax,0x50
   1400081bc:	44 0f 45 f0          	cmovne r14d,eax
   1400081c0:	eb 2a                	jmp    1400081ec <rvOK.constprop.0.isra.0+0x256>
   1400081c2:	41 8b 44 24 08       	mov    eax,DWORD PTR [r12+0x8]
   1400081c7:	39 c2                	cmp    edx,eax
   1400081c9:	7e 21                	jle    1400081ec <rvOK.constprop.0.isra.0+0x256>
   1400081cb:	41 c7 45 00 a3 00 00 	mov    DWORD PTR [r13+0x0],0xa3
   1400081d2:	00 
   1400081d3:	ff c0                	inc    eax
   1400081d5:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   1400081d9:	e8 8a 29 00 00       	call   14000ab68 <_errno>
   1400081de:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
   1400081e4:	31 c0                	xor    eax,eax
   1400081e6:	89 43 14             	mov    DWORD PTR [rbx+0x14],eax
   1400081e9:	45 31 f6             	xor    r14d,r14d
   1400081ec:	8b 44 24 3c          	mov    eax,DWORD PTR [rsp+0x3c]
   1400081f0:	49 89 d8             	mov    r8,rbx
   1400081f3:	89 ea                	mov    edx,ebp
   1400081f5:	bf 01 00 00 00       	mov    edi,0x1
   1400081fa:	48 8b 8c 24 a8 00 00 	mov    rcx,QWORD PTR [rsp+0xa8]
   140008201:	00 
   140008202:	41 89 07             	mov    DWORD PTR [r15],eax
   140008205:	e8 81 22 00 00       	call   14000a48b <__copybits_D2A>
   14000820a:	45 09 75 00          	or     DWORD PTR [r13+0x0],r14d
   14000820e:	48 89 d9             	mov    rcx,rbx
   140008211:	e8 83 f5 ff ff       	call   140007799 <__Bfree_D2A>
   140008216:	89 f8                	mov    eax,edi
   140008218:	48 83 c4 48          	add    rsp,0x48
   14000821c:	5b                   	pop    rbx
   14000821d:	5e                   	pop    rsi
   14000821e:	5f                   	pop    rdi
   14000821f:	5d                   	pop    rbp
   140008220:	41 5c                	pop    r12
   140008222:	41 5d                	pop    r13
   140008224:	41 5e                	pop    r14
   140008226:	41 5f                	pop    r15
   140008228:	c3                   	ret

0000000140008229 <__decrement_D2A>:
   140008229:	48 63 51 14          	movsxd rdx,DWORD PTR [rcx+0x14]
   14000822d:	48 8d 41 18          	lea    rax,[rcx+0x18]
   140008231:	48 8d 0c 90          	lea    rcx,[rax+rdx*4]
   140008235:	8b 10                	mov    edx,DWORD PTR [rax]
   140008237:	85 d2                	test   edx,edx
   140008239:	74 06                	je     140008241 <__decrement_D2A+0x18>
   14000823b:	ff ca                	dec    edx
   14000823d:	89 10                	mov    DWORD PTR [rax],edx
   14000823f:	eb 10                	jmp    140008251 <__decrement_D2A+0x28>
   140008241:	48 83 c0 04          	add    rax,0x4
   140008245:	c7 40 fc ff ff ff ff 	mov    DWORD PTR [rax-0x4],0xffffffff
   14000824c:	48 39 c8             	cmp    rax,rcx
   14000824f:	72 e4                	jb     140008235 <__decrement_D2A+0xc>
   140008251:	c3                   	ret

0000000140008252 <__set_ones_D2A>:
   140008252:	56                   	push   rsi
   140008253:	53                   	push   rbx
   140008254:	48 83 ec 28          	sub    rsp,0x28
   140008258:	8d 72 1f             	lea    esi,[rdx+0x1f]
   14000825b:	48 89 c8             	mov    rax,rcx
   14000825e:	89 d3                	mov    ebx,edx
   140008260:	c1 fe 05             	sar    esi,0x5
   140008263:	39 71 08             	cmp    DWORD PTR [rcx+0x8],esi
   140008266:	7d 0c                	jge    140008274 <__set_ones_D2A+0x22>
   140008268:	e8 2c f5 ff ff       	call   140007799 <__Bfree_D2A>
   14000826d:	89 f1                	mov    ecx,esi
   14000826f:	e8 6f f4 ff ff       	call   1400076e3 <__Balloc_D2A>
   140008274:	89 da                	mov    edx,ebx
   140008276:	83 e3 1f             	and    ebx,0x1f
   140008279:	4c 8d 40 18          	lea    r8,[rax+0x18]
   14000827d:	c1 fa 05             	sar    edx,0x5
   140008280:	83 fb 01             	cmp    ebx,0x1
   140008283:	83 da ff             	sbb    edx,0xffffffff
   140008286:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   140008289:	48 63 d2             	movsxd rdx,edx
   14000828c:	49 8d 0c 90          	lea    rcx,[r8+rdx*4]
   140008290:	4c 89 c2             	mov    rdx,r8
   140008293:	48 39 ca             	cmp    rdx,rcx
   140008296:	73 0d                	jae    1400082a5 <__set_ones_D2A+0x53>
   140008298:	48 83 c2 04          	add    rdx,0x4
   14000829c:	c7 42 fc ff ff ff ff 	mov    DWORD PTR [rdx-0x4],0xffffffff
   1400082a3:	eb ee                	jmp    140008293 <__set_ones_D2A+0x41>
   1400082a5:	85 db                	test   ebx,ebx
   1400082a7:	74 27                	je     1400082d0 <__set_ones_D2A+0x7e>
   1400082a9:	48 89 ca             	mov    rdx,rcx
   1400082ac:	4c 8d 48 15          	lea    r9,[rax+0x15]
   1400082b0:	48 29 c2             	sub    rdx,rax
   1400082b3:	48 83 ea 15          	sub    rdx,0x15
   1400082b7:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
   1400082bb:	4c 39 c9             	cmp    rcx,r9
   1400082be:	b9 00 00 00 00       	mov    ecx,0x0
   1400082c3:	48 0f 42 d1          	cmovb  rdx,rcx
   1400082c7:	f7 db                	neg    ebx
   1400082c9:	89 d9                	mov    ecx,ebx
   1400082cb:	41 d3 6c 10 fc       	shr    DWORD PTR [r8+rdx*1-0x4],cl
   1400082d0:	48 83 c4 28          	add    rsp,0x28
   1400082d4:	5b                   	pop    rbx
   1400082d5:	5e                   	pop    rsi
   1400082d6:	c3                   	ret

00000001400082d7 <__strtodg>:
   1400082d7:	41 57                	push   r15
   1400082d9:	41 56                	push   r14
   1400082db:	41 55                	push   r13
   1400082dd:	41 54                	push   r12
   1400082df:	55                   	push   rbp
   1400082e0:	57                   	push   rdi
   1400082e1:	56                   	push   rsi
   1400082e2:	53                   	push   rbx
   1400082e3:	48 81 ec f8 00 00 00 	sub    rsp,0xf8
   1400082ea:	0f 29 b4 24 d0 00 00 	movaps XMMWORD PTR [rsp+0xd0],xmm6
   1400082f1:	00 
   1400082f2:	0f 29 bc 24 e0 00 00 	movaps XMMWORD PTR [rsp+0xe0],xmm7
   1400082f9:	00 
   1400082fa:	45 31 ff             	xor    r15d,r15d
   1400082fd:	48 89 cf             	mov    rdi,rcx
   140008300:	48 89 94 24 48 01 00 	mov    QWORD PTR [rsp+0x148],rdx
   140008307:	00 
   140008308:	4c 89 84 24 50 01 00 	mov    QWORD PTR [rsp+0x150],r8
   14000830f:	00 
   140008310:	4c 89 8c 24 58 01 00 	mov    QWORD PTR [rsp+0x158],r9
   140008317:	00 
   140008318:	e8 cb 28 00 00       	call   14000abe8 <localeconv>
   14000831d:	48 8b 18             	mov    rbx,QWORD PTR [rax]
   140008320:	48 89 d9             	mov    rcx,rbx
   140008323:	e8 f8 28 00 00       	call   14000ac20 <strlen>
   140008328:	44 89 bc 24 b4 00 00 	mov    DWORD PTR [rsp+0xb4],r15d
   14000832f:	00 
   140008330:	48 89 f9             	mov    rcx,rdi
   140008333:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
   140008338:	31 c0                	xor    eax,eax
   14000833a:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140008341:	00 
   140008342:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140008349:	00 
   14000834a:	44 8b 38             	mov    r15d,DWORD PTR [rax]
   14000834d:	48 89 8c 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rcx
   140008354:	00 
   140008355:	8a 11                	mov    dl,BYTE PTR [rcx]
   140008357:	48 89 4c 24 60       	mov    QWORD PTR [rsp+0x60],rcx
   14000835c:	80 fa 2b             	cmp    dl,0x2b
   14000835f:	74 33                	je     140008394 <__strtodg+0xbd>
   140008361:	7f 22                	jg     140008385 <__strtodg+0xae>
   140008363:	80 fa 0d             	cmp    dl,0xd
   140008366:	7f 0b                	jg     140008373 <__strtodg+0x9c>
   140008368:	80 fa 08             	cmp    dl,0x8
   14000836b:	7f 52                	jg     1400083bf <__strtodg+0xe8>
   14000836d:	84 d2                	test   dl,dl
   14000836f:	74 3e                	je     1400083af <__strtodg+0xd8>
   140008371:	eb 05                	jmp    140008378 <__strtodg+0xa1>
   140008373:	80 fa 20             	cmp    dl,0x20
   140008376:	74 47                	je     1400083bf <__strtodg+0xe8>
   140008378:	45 31 f6             	xor    r14d,r14d
   14000837b:	44 89 74 24 50       	mov    DWORD PTR [rsp+0x50],r14d
   140008380:	e9 ca 00 00 00       	jmp    14000844f <__strtodg+0x178>
   140008385:	80 fa 2d             	cmp    dl,0x2d
   140008388:	75 3a                	jne    1400083c4 <__strtodg+0xed>
   14000838a:	c7 44 24 50 01 00 00 	mov    DWORD PTR [rsp+0x50],0x1
   140008391:	00 
   140008392:	eb 08                	jmp    14000839c <__strtodg+0xc5>
   140008394:	45 31 ed             	xor    r13d,r13d
   140008397:	44 89 6c 24 50       	mov    DWORD PTR [rsp+0x50],r13d
   14000839c:	48 8d 41 01          	lea    rax,[rcx+0x1]
   1400083a0:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   1400083a7:	00 
   1400083a8:	8a 51 01             	mov    dl,BYTE PTR [rcx+0x1]
   1400083ab:	84 d2                	test   dl,dl
   1400083ad:	75 20                	jne    1400083cf <__strtodg+0xf8>
   1400083af:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x6
   1400083b6:	06 00 00 00 
   1400083ba:	e9 8d 14 00 00       	jmp    14000984c <__strtodg+0x1575>
   1400083bf:	48 ff c1             	inc    rcx
   1400083c2:	eb 89                	jmp    14000834d <__strtodg+0x76>
   1400083c4:	45 31 e4             	xor    r12d,r12d
   1400083c7:	48 89 c8             	mov    rax,rcx
   1400083ca:	44 89 64 24 50       	mov    DWORD PTR [rsp+0x50],r12d
   1400083cf:	80 fa 30             	cmp    dl,0x30
   1400083d2:	75 76                	jne    14000844a <__strtodg+0x173>
   1400083d4:	8a 50 01             	mov    dl,BYTE PTR [rax+0x1]
   1400083d7:	48 ff c0             	inc    rax
   1400083da:	83 e2 df             	and    edx,0xffffffdf
   1400083dd:	80 fa 58             	cmp    dl,0x58
   1400083e0:	75 42                	jne    140008424 <__strtodg+0x14d>
   1400083e2:	8b 44 24 50          	mov    eax,DWORD PTR [rsp+0x50]
   1400083e6:	4c 8b 84 24 58 01 00 	mov    r8,QWORD PTR [rsp+0x158]
   1400083ed:	00 
   1400083ee:	48 8d 8c 24 c0 00 00 	lea    rcx,[rsp+0xc0]
   1400083f5:	00 
   1400083f6:	4c 8d 8c 24 c8 00 00 	lea    r9,[rsp+0xc8]
   1400083fd:	00 
   1400083fe:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   140008405:	00 
   140008406:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14000840a:	e8 f1 15 00 00       	call   140009a00 <__gethex_D2A>
   14000840f:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   140008416:	83 f8 06             	cmp    eax,0x6
   140008419:	0f 85 d4 13 00 00    	jne    1400097f3 <__strtodg+0x151c>
   14000841f:	e9 28 14 00 00       	jmp    14000984c <__strtodg+0x1575>
   140008424:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   140008429:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   140008430:	00 
   140008431:	8a 10                	mov    dl,BYTE PTR [rax]
   140008433:	48 ff c0             	inc    rax
   140008436:	80 fa 30             	cmp    dl,0x30
   140008439:	74 e9                	je     140008424 <__strtodg+0x14d>
   14000843b:	41 ba 01 00 00 00    	mov    r10d,0x1
   140008441:	84 d2                	test   dl,dl
   140008443:	75 0d                	jne    140008452 <__strtodg+0x17b>
   140008445:	e9 a9 13 00 00       	jmp    1400097f3 <__strtodg+0x151c>
   14000844a:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   14000844f:	45 31 d2             	xor    r10d,r10d
   140008452:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140008459:	00 
   14000845a:	31 ed                	xor    ebp,ebp
   14000845c:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140008461:	31 c9                	xor    ecx,ecx
   140008463:	89 6c 24 58          	mov    DWORD PTR [rsp+0x58],ebp
   140008467:	31 ed                	xor    ebp,ebp
   140008469:	8b 40 10             	mov    eax,DWORD PTR [rax+0x10]
   14000846c:	89 84 24 90 00 00 00 	mov    DWORD PTR [rsp+0x90],eax
   140008473:	0f be 02             	movsx  eax,BYTE PTR [rdx]
   140008476:	44 8d 40 d0          	lea    r8d,[rax-0x30]
   14000847a:	41 83 f8 09          	cmp    r8d,0x9
   14000847e:	77 2d                	ja     1400084ad <__strtodg+0x1d6>
   140008480:	83 fd 08             	cmp    ebp,0x8
   140008483:	7f 0e                	jg     140008493 <__strtodg+0x1bc>
   140008485:	6b 44 24 58 0a       	imul   eax,DWORD PTR [rsp+0x58],0xa
   14000848a:	44 01 c0             	add    eax,r8d
   14000848d:	89 44 24 58          	mov    DWORD PTR [rsp+0x58],eax
   140008491:	eb 0b                	jmp    14000849e <__strtodg+0x1c7>
   140008493:	83 fd 0f             	cmp    ebp,0xf
   140008496:	7f 06                	jg     14000849e <__strtodg+0x1c7>
   140008498:	6b c9 0a             	imul   ecx,ecx,0xa
   14000849b:	44 01 c1             	add    ecx,r8d
   14000849e:	48 ff c2             	inc    rdx
   1400084a1:	ff c5                	inc    ebp
   1400084a3:	48 89 94 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdx
   1400084aa:	00 
   1400084ab:	eb c6                	jmp    140008473 <__strtodg+0x19c>
   1400084ad:	3a 03                	cmp    al,BYTE PTR [rbx]
   1400084af:	0f 85 22 01 00 00    	jne    1400085d7 <__strtodg+0x300>
   1400084b5:	41 b8 01 00 00 00    	mov    r8d,0x1
   1400084bb:	46 8a 0c 03          	mov    r9b,BYTE PTR [rbx+r8*1]
   1400084bf:	45 84 c9             	test   r9b,r9b
   1400084c2:	74 0f                	je     1400084d3 <__strtodg+0x1fc>
   1400084c4:	49 ff c0             	inc    r8
   1400084c7:	46 38 4c 02 ff       	cmp    BYTE PTR [rdx+r8*1-0x1],r9b
   1400084cc:	74 ed                	je     1400084bb <__strtodg+0x1e4>
   1400084ce:	e9 04 01 00 00       	jmp    1400085d7 <__strtodg+0x300>
   1400084d3:	4c 01 c2             	add    rdx,r8
   1400084d6:	48 89 94 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdx
   1400084dd:	00 
   1400084de:	0f be 02             	movsx  eax,BYTE PTR [rdx]
   1400084e1:	85 ed                	test   ebp,ebp
   1400084e3:	74 0d                	je     1400084f2 <__strtodg+0x21b>
   1400084e5:	41 89 ec             	mov    r12d,ebp
   1400084e8:	31 d2                	xor    edx,edx
   1400084ea:	45 31 f6             	xor    r14d,r14d
   1400084ed:	e9 d5 00 00 00       	jmp    1400085c7 <__strtodg+0x2f0>
   1400084f2:	31 d2                	xor    edx,edx
   1400084f4:	83 f8 30             	cmp    eax,0x30
   1400084f7:	75 1c                	jne    140008515 <__strtodg+0x23e>
   1400084f9:	48 8b 84 24 c0 00 00 	mov    rax,QWORD PTR [rsp+0xc0]
   140008500:	00 
   140008501:	ff c2                	inc    edx
   140008503:	4c 8d 40 01          	lea    r8,[rax+0x1]
   140008507:	4c 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],r8
   14000850e:	00 
   14000850f:	0f be 40 01          	movsx  eax,BYTE PTR [rax+0x1]
   140008513:	eb df                	jmp    1400084f4 <__strtodg+0x21d>
   140008515:	44 8d 40 cf          	lea    r8d,[rax-0x31]
   140008519:	41 83 f8 08          	cmp    r8d,0x8
   14000851d:	0f 87 c0 00 00 00    	ja     1400085e3 <__strtodg+0x30c>
   140008523:	48 8b b4 24 c0 00 00 	mov    rsi,QWORD PTR [rsp+0xc0]
   14000852a:	00 
   14000852b:	41 89 d6             	mov    r14d,edx
   14000852e:	45 31 e4             	xor    r12d,r12d
   140008531:	31 d2                	xor    edx,edx
   140008533:	48 89 74 24 60       	mov    QWORD PTR [rsp+0x60],rsi
   140008538:	44 8d 42 01          	lea    r8d,[rdx+0x1]
   14000853c:	83 e8 30             	sub    eax,0x30
   14000853f:	74 6b                	je     1400085ac <__strtodg+0x2d5>
   140008541:	45 01 c6             	add    r14d,r8d
   140008544:	44 89 e3             	mov    ebx,r12d
   140008547:	45 89 e1             	mov    r9d,r12d
   14000854a:	44 8d 5b 01          	lea    r11d,[rbx+0x1]
   14000854e:	44 89 de             	mov    esi,r11d
   140008551:	44 29 e6             	sub    esi,r12d
   140008554:	41 39 f0             	cmp    r8d,esi
   140008557:	7e 1e                	jle    140008577 <__strtodg+0x2a0>
   140008559:	83 fb 08             	cmp    ebx,0x8
   14000855c:	7f 0b                	jg     140008569 <__strtodg+0x292>
   14000855e:	6b 74 24 58 0a       	imul   esi,DWORD PTR [rsp+0x58],0xa
   140008563:	89 74 24 58          	mov    DWORD PTR [rsp+0x58],esi
   140008567:	eb 09                	jmp    140008572 <__strtodg+0x29b>
   140008569:	41 83 fb 10          	cmp    r11d,0x10
   14000856d:	7f 03                	jg     140008572 <__strtodg+0x29b>
   14000856f:	6b c9 0a             	imul   ecx,ecx,0xa
   140008572:	44 89 db             	mov    ebx,r11d
   140008575:	eb d3                	jmp    14000854a <__strtodg+0x273>
   140008577:	45 31 c0             	xor    r8d,r8d
   14000857a:	85 d2                	test   edx,edx
   14000857c:	44 0f 49 c2          	cmovns r8d,edx
   140008580:	45 01 c1             	add    r9d,r8d
   140008583:	47 8d 64 04 01       	lea    r12d,[r12+r8*1+0x1]
   140008588:	41 83 f9 08          	cmp    r9d,0x8
   14000858c:	7f 10                	jg     14000859e <__strtodg+0x2c7>
   14000858e:	6b 54 24 58 0a       	imul   edx,DWORD PTR [rsp+0x58],0xa
   140008593:	45 31 c0             	xor    r8d,r8d
   140008596:	01 d0                	add    eax,edx
   140008598:	89 44 24 58          	mov    DWORD PTR [rsp+0x58],eax
   14000859c:	eb 0e                	jmp    1400085ac <__strtodg+0x2d5>
   14000859e:	45 31 c0             	xor    r8d,r8d
   1400085a1:	41 83 f9 0f          	cmp    r9d,0xf
   1400085a5:	7f 05                	jg     1400085ac <__strtodg+0x2d5>
   1400085a7:	6b c9 0a             	imul   ecx,ecx,0xa
   1400085aa:	01 c1                	add    ecx,eax
   1400085ac:	48 8b 84 24 c0 00 00 	mov    rax,QWORD PTR [rsp+0xc0]
   1400085b3:	00 
   1400085b4:	48 8d 50 01          	lea    rdx,[rax+0x1]
   1400085b8:	48 89 94 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdx
   1400085bf:	00 
   1400085c0:	0f be 40 01          	movsx  eax,BYTE PTR [rax+0x1]
   1400085c4:	44 89 c2             	mov    edx,r8d
   1400085c7:	44 8d 40 d0          	lea    r8d,[rax-0x30]
   1400085cb:	41 83 f8 09          	cmp    r8d,0x9
   1400085cf:	0f 86 63 ff ff ff    	jbe    140008538 <__strtodg+0x261>
   1400085d5:	eb 12                	jmp    1400085e9 <__strtodg+0x312>
   1400085d7:	41 89 ec             	mov    r12d,ebp
   1400085da:	31 d2                	xor    edx,edx
   1400085dc:	45 31 f6             	xor    r14d,r14d
   1400085df:	31 f6                	xor    esi,esi
   1400085e1:	eb 0b                	jmp    1400085ee <__strtodg+0x317>
   1400085e3:	45 31 f6             	xor    r14d,r14d
   1400085e6:	45 31 e4             	xor    r12d,r12d
   1400085e9:	be 01 00 00 00       	mov    esi,0x1
   1400085ee:	41 89 c0             	mov    r8d,eax
   1400085f1:	41 83 e0 df          	and    r8d,0xffffffdf
   1400085f5:	41 83 f8 45          	cmp    r8d,0x45
   1400085f9:	0f 85 e7 00 00 00    	jne    1400086e6 <__strtodg+0x40f>
   1400085ff:	44 89 e0             	mov    eax,r12d
   140008602:	09 d0                	or     eax,edx
   140008604:	44 09 d0             	or     eax,r10d
   140008607:	0f 84 dc 01 00 00    	je     1400087e9 <__strtodg+0x512>
   14000860d:	48 8b bc 24 c0 00 00 	mov    rdi,QWORD PTR [rsp+0xc0]
   140008614:	00 
   140008615:	48 8d 47 01          	lea    rax,[rdi+0x1]
   140008619:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   140008620:	00 
   140008621:	0f be 47 01          	movsx  eax,BYTE PTR [rdi+0x1]
   140008625:	3c 2b                	cmp    al,0x2b
   140008627:	74 0f                	je     140008638 <__strtodg+0x361>
   140008629:	45 31 db             	xor    r11d,r11d
   14000862c:	3c 2d                	cmp    al,0x2d
   14000862e:	75 1b                	jne    14000864b <__strtodg+0x374>
   140008630:	41 bb 01 00 00 00    	mov    r11d,0x1
   140008636:	eb 03                	jmp    14000863b <__strtodg+0x364>
   140008638:	45 31 db             	xor    r11d,r11d
   14000863b:	48 8d 47 02          	lea    rax,[rdi+0x2]
   14000863f:	48 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rax
   140008646:	00 
   140008647:	0f be 47 02          	movsx  eax,BYTE PTR [rdi+0x2]
   14000864b:	44 8d 40 d0          	lea    r8d,[rax-0x30]
   14000864f:	41 83 f8 09          	cmp    r8d,0x9
   140008653:	0f 87 85 00 00 00    	ja     1400086de <__strtodg+0x407>
   140008659:	83 f8 30             	cmp    eax,0x30
   14000865c:	75 1a                	jne    140008678 <__strtodg+0x3a1>
   14000865e:	48 8b 84 24 c0 00 00 	mov    rax,QWORD PTR [rsp+0xc0]
   140008665:	00 
   140008666:	4c 8d 40 01          	lea    r8,[rax+0x1]
   14000866a:	4c 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],r8
   140008671:	00 
   140008672:	0f be 40 01          	movsx  eax,BYTE PTR [rax+0x1]
   140008676:	eb e1                	jmp    140008659 <__strtodg+0x382>
   140008678:	44 8d 40 cf          	lea    r8d,[rax-0x31]
   14000867c:	31 db                	xor    ebx,ebx
   14000867e:	41 83 f8 08          	cmp    r8d,0x8
   140008682:	77 64                	ja     1400086e8 <__strtodg+0x411>
   140008684:	48 8b 9c 24 c0 00 00 	mov    rbx,QWORD PTR [rsp+0xc0]
   14000868b:	00 
   14000868c:	44 8d 48 d0          	lea    r9d,[rax-0x30]
   140008690:	4c 8d 43 01          	lea    r8,[rbx+0x1]
   140008694:	4c 89 84 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],r8
   14000869b:	00 
   14000869c:	41 0f be 00          	movsx  eax,BYTE PTR [r8]
   1400086a0:	44 8d 68 d0          	lea    r13d,[rax-0x30]
   1400086a4:	41 83 fd 09          	cmp    r13d,0x9
   1400086a8:	77 0e                	ja     1400086b8 <__strtodg+0x3e1>
   1400086aa:	45 6b c9 0a          	imul   r9d,r9d,0xa
   1400086ae:	49 ff c0             	inc    r8
   1400086b1:	46 8d 4c 08 d0       	lea    r9d,[rax+r9*1-0x30]
   1400086b6:	eb dc                	jmp    140008694 <__strtodg+0x3bd>
   1400086b8:	49 29 d8             	sub    r8,rbx
   1400086bb:	bb 1f 4e 00 00       	mov    ebx,0x4e1f
   1400086c0:	41 39 d9             	cmp    r9d,ebx
   1400086c3:	41 0f 4e d9          	cmovle ebx,r9d
   1400086c7:	49 83 f8 09          	cmp    r8,0x9
   1400086cb:	41 b8 1f 4e 00 00    	mov    r8d,0x4e1f
   1400086d1:	41 0f 4d d8          	cmovge ebx,r8d
   1400086d5:	45 85 db             	test   r11d,r11d
   1400086d8:	74 0e                	je     1400086e8 <__strtodg+0x411>
   1400086da:	f7 db                	neg    ebx
   1400086dc:	eb 0a                	jmp    1400086e8 <__strtodg+0x411>
   1400086de:	48 89 bc 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdi
   1400086e5:	00 
   1400086e6:	31 db                	xor    ebx,ebx
   1400086e8:	45 85 e4             	test   r12d,r12d
   1400086eb:	0f 85 10 01 00 00    	jne    140008801 <__strtodg+0x52a>
   1400086f1:	44 09 d2             	or     edx,r10d
   1400086f4:	0f 85 f9 10 00 00    	jne    1400097f3 <__strtodg+0x151c>
   1400086fa:	85 f6                	test   esi,esi
   1400086fc:	0f 85 e7 00 00 00    	jne    1400087e9 <__strtodg+0x512>
   140008702:	83 f8 69             	cmp    eax,0x69
   140008705:	74 16                	je     14000871d <__strtodg+0x446>
   140008707:	7f 0a                	jg     140008713 <__strtodg+0x43c>
   140008709:	83 f8 49             	cmp    eax,0x49
   14000870c:	74 0f                	je     14000871d <__strtodg+0x446>
   14000870e:	83 f8 4e             	cmp    eax,0x4e
   140008711:	eb 03                	jmp    140008716 <__strtodg+0x43f>
   140008713:	83 f8 6e             	cmp    eax,0x6e
   140008716:	74 59                	je     140008771 <__strtodg+0x49a>
   140008718:	e9 cc 00 00 00       	jmp    1400087e9 <__strtodg+0x512>
   14000871d:	48 8d 15 1c 41 00 00 	lea    rdx,[rip+0x411c]        # 14000c840 <.rdata>
   140008724:	48 8d 8c 24 c0 00 00 	lea    rcx,[rsp+0xc0]
   14000872b:	00 
   14000872c:	e8 24 1d 00 00       	call   14000a455 <__match_D2A>
   140008731:	85 c0                	test   eax,eax
   140008733:	0f 84 b0 00 00 00    	je     1400087e9 <__strtodg+0x512>
   140008739:	48 8d 15 03 41 00 00 	lea    rdx,[rip+0x4103]        # 14000c843 <.rdata+0x3>
   140008740:	48 8d 8c 24 c0 00 00 	lea    rcx,[rsp+0xc0]
   140008747:	00 
   140008748:	48 ff 8c 24 c0 00 00 	dec    QWORD PTR [rsp+0xc0]
   14000874f:	00 
   140008750:	e8 00 1d 00 00       	call   14000a455 <__match_D2A>
   140008755:	85 c0                	test   eax,eax
   140008757:	75 08                	jne    140008761 <__strtodg+0x48a>
   140008759:	48 ff 84 24 c0 00 00 	inc    QWORD PTR [rsp+0xc0]
   140008760:	00 
   140008761:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x3
   140008768:	03 00 00 00 
   14000876c:	e9 a9 0f 00 00       	jmp    14000971a <__strtodg+0x1443>
   140008771:	48 8d 15 d1 40 00 00 	lea    rdx,[rip+0x40d1]        # 14000c849 <.rdata+0x9>
   140008778:	48 8d 8c 24 c0 00 00 	lea    rcx,[rsp+0xc0]
   14000877f:	00 
   140008780:	e8 d0 1c 00 00       	call   14000a455 <__match_D2A>
   140008785:	85 c0                	test   eax,eax
   140008787:	74 60                	je     1400087e9 <__strtodg+0x512>
   140008789:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140008790:	00 
   140008791:	48 8b bc 24 58 01 00 	mov    rdi,QWORD PTR [rsp+0x158]
   140008798:	00 
   140008799:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x4
   1400087a0:	04 00 00 00 
   1400087a4:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   1400087a7:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   1400087ab:	ff c0                	inc    eax
   1400087ad:	89 07                	mov    DWORD PTR [rdi],eax
   1400087af:	48 8b 84 24 c0 00 00 	mov    rax,QWORD PTR [rsp+0xc0]
   1400087b6:	00 
   1400087b7:	80 38 28             	cmp    BYTE PTR [rax],0x28
   1400087ba:	0f 85 5a 0f 00 00    	jne    14000971a <__strtodg+0x1443>
   1400087c0:	4c 8b 84 24 60 01 00 	mov    r8,QWORD PTR [rsp+0x160]
   1400087c7:	00 
   1400087c8:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400087cf:	00 
   1400087d0:	48 8d 8c 24 c0 00 00 	lea    rcx,[rsp+0xc0]
   1400087d7:	00 
   1400087d8:	e8 f2 18 00 00       	call   14000a0cf <__hexnan_D2A>
   1400087dd:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   1400087e4:	e9 31 0f 00 00       	jmp    14000971a <__strtodg+0x1443>
   1400087e9:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x6
   1400087f0:	06 00 00 00 
   1400087f4:	48 89 bc 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdi
   1400087fb:	00 
   1400087fc:	e9 f2 0f 00 00       	jmp    1400097f3 <__strtodg+0x151c>
   140008801:	89 d8                	mov    eax,ebx
   140008803:	8b 74 24 50          	mov    esi,DWORD PTR [rsp+0x50]
   140008807:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x1
   14000880e:	01 00 00 00 
   140008812:	44 29 f0             	sub    eax,r14d
   140008815:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   140008819:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140008820:	00 
   140008821:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   140008824:	89 44 24 4c          	mov    DWORD PTR [rsp+0x4c],eax
   140008828:	83 e0 03             	and    eax,0x3
   14000882b:	89 c7                	mov    edi,eax
   14000882d:	29 f7                	sub    edi,esi
   14000882f:	89 7c 24 54          	mov    DWORD PTR [rsp+0x54],edi
   140008833:	83 f8 02             	cmp    eax,0x2
   140008836:	74 18                	je     140008850 <__strtodg+0x579>
   140008838:	8d 7e 01             	lea    edi,[rsi+0x1]
   14000883b:	89 7c 24 54          	mov    DWORD PTR [rsp+0x54],edi
   14000883f:	83 f8 03             	cmp    eax,0x3
   140008842:	74 0c                	je     140008850 <__strtodg+0x579>
   140008844:	85 c0                	test   eax,eax
   140008846:	0f 94 c0             	sete   al
   140008849:	0f b6 c0             	movzx  eax,al
   14000884c:	89 44 24 54          	mov    DWORD PTR [rsp+0x54],eax
   140008850:	8b 44 24 58          	mov    eax,DWORD PTR [rsp+0x58]
   140008854:	85 ed                	test   ebp,ebp
   140008856:	be 11 00 00 00       	mov    esi,0x11
   14000885b:	41 0f 44 ec          	cmove  ebp,r12d
   14000885f:	41 39 f4             	cmp    r12d,esi
   140008862:	f2 48 0f 2a c0       	cvtsi2sd xmm0,rax
   140008867:	41 0f 4e f4          	cmovle esi,r12d
   14000886b:	0f 28 f0             	movaps xmm6,xmm0
   14000886e:	41 83 fc 09          	cmp    r12d,0x9
   140008872:	7e 1a                	jle    14000888e <__strtodg+0x5b7>
   140008874:	48 8b 15 d5 41 00 00 	mov    rdx,QWORD PTR [rip+0x41d5]        # 14000ca50 <.refptr.__tens_D2A>
   14000887b:	f2 48 0f 2a f1       	cvtsi2sd xmm6,rcx
   140008880:	8d 46 f7             	lea    eax,[rsi-0x9]
   140008883:	48 98                	cdqe
   140008885:	f2 0f 59 04 c2       	mulsd  xmm0,QWORD PTR [rdx+rax*8]
   14000888a:	f2 0f 58 f0          	addsd  xmm6,xmm0
   14000888e:	41 83 ff 35          	cmp    r15d,0x35
   140008892:	0f 8f 79 01 00 00    	jg     140008a11 <__strtodg+0x73a>
   140008898:	41 83 fc 0f          	cmp    r12d,0xf
   14000889c:	0f 8f 6f 01 00 00    	jg     140008a11 <__strtodg+0x73a>
   1400088a2:	83 7c 24 48 00       	cmp    DWORD PTR [rsp+0x48],0x0
   1400088a7:	75 3d                	jne    1400088e6 <__strtodg+0x60f>
   1400088a9:	48 8d 84 24 b4 00 00 	lea    rax,[rsp+0xb4]
   1400088b0:	00 
   1400088b1:	c7 44 24 20 01 00 00 	mov    DWORD PTR [rsp+0x20],0x1
   1400088b8:	00 
   1400088b9:	4c 8b 8c 24 60 01 00 	mov    r9,QWORD PTR [rsp+0x160]
   1400088c0:	00 
   1400088c1:	0f 28 c6             	movaps xmm0,xmm6
   1400088c4:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1400088c9:	8b 44 24 54          	mov    eax,DWORD PTR [rsp+0x54]
   1400088cd:	4c 8b 84 24 58 01 00 	mov    r8,QWORD PTR [rsp+0x158]
   1400088d4:	00 
   1400088d5:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400088dc:	00 
   1400088dd:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   1400088e1:	e9 fa 00 00 00       	jmp    1400089e0 <__strtodg+0x709>
   1400088e6:	0f 8e 04 01 00 00    	jle    1400089f0 <__strtodg+0x719>
   1400088ec:	83 7c 24 48 16       	cmp    DWORD PTR [rsp+0x48],0x16
   1400088f1:	7f 7a                	jg     14000896d <__strtodg+0x696>
   1400088f3:	66 0f 7e f0          	movd   eax,xmm6
   1400088f7:	b9 35 00 00 00       	mov    ecx,0x35
   1400088fc:	41 b8 15 00 00 00    	mov    r8d,0x15
   140008902:	48 63 54 24 48       	movsxd rdx,DWORD PTR [rsp+0x48]
   140008907:	0f bc c0             	bsf    eax,eax
   14000890a:	8b 7c 24 54          	mov    edi,DWORD PTR [rsp+0x54]
   14000890e:	29 c1                	sub    ecx,eax
   140008910:	66 48 0f 7e f0       	movq   rax,xmm6
   140008915:	48 c1 e8 20          	shr    rax,0x20
   140008919:	89 7c 24 28          	mov    DWORD PTR [rsp+0x28],edi
   14000891d:	0d 00 00 10 00       	or     eax,0x100000
   140008922:	0f bc c0             	bsf    eax,eax
   140008925:	41 29 c0             	sub    r8d,eax
   140008928:	66 0f 7e f0          	movd   eax,xmm6
   14000892c:	85 c0                	test   eax,eax
   14000892e:	89 c8                	mov    eax,ecx
   140008930:	48 8b 0d 19 41 00 00 	mov    rcx,QWORD PTR [rip+0x4119]        # 14000ca50 <.refptr.__tens_D2A>
   140008937:	41 0f 44 c0          	cmove  eax,r8d
   14000893b:	f2 0f 10 04 d1       	movsd  xmm0,QWORD PTR [rcx+rdx*8]
   140008940:	48 8d 8c 24 b4 00 00 	lea    rcx,[rsp+0xb4]
   140008947:	00 
   140008948:	48 89 4c 24 30       	mov    QWORD PTR [rsp+0x30],rcx
   14000894d:	48 8d 0d 0c 3f 00 00 	lea    rcx,[rip+0x3f0c]        # 14000c860 <fivesbits>
   140008954:	f2 0f 59 c6          	mulsd  xmm0,xmm6
   140008958:	03 04 91             	add    eax,DWORD PTR [rcx+rdx*4]
   14000895b:	83 f8 35             	cmp    eax,0x35
   14000895e:	0f 9e c0             	setle  al
   140008961:	0f b6 c0             	movzx  eax,al
   140008964:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   140008968:	0f 28 f0             	movaps xmm6,xmm0
   14000896b:	eb 5b                	jmp    1400089c8 <__strtodg+0x6f1>
   14000896d:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   140008971:	b8 25 00 00 00       	mov    eax,0x25
   140008976:	44 29 e0             	sub    eax,r12d
   140008979:	89 d7                	mov    edi,edx
   14000897b:	39 d0                	cmp    eax,edx
   14000897d:	0f 8c 92 00 00 00    	jl     140008a15 <__strtodg+0x73e>
   140008983:	b8 0f 00 00 00       	mov    eax,0xf
   140008988:	48 8b 0d c1 40 00 00 	mov    rcx,QWORD PTR [rip+0x40c1]        # 14000ca50 <.refptr.__tens_D2A>
   14000898f:	44 29 e0             	sub    eax,r12d
   140008992:	48 63 d0             	movsxd rdx,eax
   140008995:	f2 0f 59 34 d1       	mulsd  xmm6,QWORD PTR [rcx+rdx*8]
   14000899a:	89 fa                	mov    edx,edi
   14000899c:	29 c2                	sub    edx,eax
   14000899e:	48 63 c2             	movsxd rax,edx
   1400089a1:	f2 0f 10 04 c1       	movsd  xmm0,QWORD PTR [rcx+rax*8]
   1400089a6:	f2 0f 59 c6          	mulsd  xmm0,xmm6
   1400089aa:	48 8d 84 24 b4 00 00 	lea    rax,[rsp+0xb4]
   1400089b1:	00 
   1400089b2:	31 ff                	xor    edi,edi
   1400089b4:	0f 28 f0             	movaps xmm6,xmm0
   1400089b7:	48 89 44 24 30       	mov    QWORD PTR [rsp+0x30],rax
   1400089bc:	8b 44 24 54          	mov    eax,DWORD PTR [rsp+0x54]
   1400089c0:	89 7c 24 20          	mov    DWORD PTR [rsp+0x20],edi
   1400089c4:	89 44 24 28          	mov    DWORD PTR [rsp+0x28],eax
   1400089c8:	4c 8b 8c 24 60 01 00 	mov    r9,QWORD PTR [rsp+0x160]
   1400089cf:	00 
   1400089d0:	4c 8b 84 24 58 01 00 	mov    r8,QWORD PTR [rsp+0x158]
   1400089d7:	00 
   1400089d8:	48 8b 94 24 50 01 00 	mov    rdx,QWORD PTR [rsp+0x150]
   1400089df:	00 
   1400089e0:	e8 b1 f5 ff ff       	call   140007f96 <rvOK.constprop.0.isra.0>
   1400089e5:	31 d2                	xor    edx,edx
   1400089e7:	85 c0                	test   eax,eax
   1400089e9:	74 2a                	je     140008a15 <__strtodg+0x73e>
   1400089eb:	e9 03 0e 00 00       	jmp    1400097f3 <__strtodg+0x151c>
   1400089f0:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   1400089f4:	83 fa ea             	cmp    edx,0xffffffea
   1400089f7:	7c 1c                	jl     140008a15 <__strtodg+0x73e>
   1400089f9:	44 89 f0             	mov    eax,r14d
   1400089fc:	48 8b 15 4d 40 00 00 	mov    rdx,QWORD PTR [rip+0x404d]        # 14000ca50 <.refptr.__tens_D2A>
   140008a03:	0f 28 c6             	movaps xmm0,xmm6
   140008a06:	29 d8                	sub    eax,ebx
   140008a08:	48 98                	cdqe
   140008a0a:	f2 0f 5e 04 c2       	divsd  xmm0,QWORD PTR [rdx+rax*8]
   140008a0f:	eb 99                	jmp    1400089aa <__strtodg+0x6d3>
   140008a11:	8b 54 24 48          	mov    edx,DWORD PTR [rsp+0x48]
   140008a15:	44 89 e0             	mov    eax,r12d
   140008a18:	29 f0                	sub    eax,esi
   140008a1a:	01 d0                	add    eax,edx
   140008a1c:	85 c0                	test   eax,eax
   140008a1e:	0f 8e b7 00 00 00    	jle    140008adb <__strtodg+0x804>
   140008a24:	89 c1                	mov    ecx,eax
   140008a26:	83 e1 f0             	and    ecx,0xfffffff0
   140008a29:	a8 0f                	test   al,0xf
   140008a2b:	75 11                	jne    140008a3e <__strtodg+0x767>
   140008a2d:	c1 f9 04             	sar    ecx,0x4
   140008a30:	48 8b 15 39 3f 00 00 	mov    rdx,QWORD PTR [rip+0x3f39]        # 14000c970 <.refptr.__bigtens_D2A>
   140008a37:	31 f6                	xor    esi,esi
   140008a39:	41 89 c9             	mov    r9d,ecx
   140008a3c:	eb 1a                	jmp    140008a58 <__strtodg+0x781>
   140008a3e:	48 8b 15 0b 40 00 00 	mov    rdx,QWORD PTR [rip+0x400b]        # 14000ca50 <.refptr.__tens_D2A>
   140008a45:	83 e0 0f             	and    eax,0xf
   140008a48:	f2 0f 59 34 c2       	mulsd  xmm6,QWORD PTR [rdx+rax*8]
   140008a4d:	85 c9                	test   ecx,ecx
   140008a4f:	75 dc                	jne    140008a2d <__strtodg+0x756>
   140008a51:	31 f6                	xor    esi,esi
   140008a53:	e9 3d 01 00 00       	jmp    140008b95 <__strtodg+0x8be>
   140008a58:	66 49 0f 7e f0       	movq   r8,xmm6
   140008a5d:	49 c1 e8 20          	shr    r8,0x20
   140008a61:	44 89 c0             	mov    eax,r8d
   140008a64:	41 c1 e8 14          	shr    r8d,0x14
   140008a68:	25 ff ff 0f 80       	and    eax,0x800fffff
   140008a6d:	41 81 e0 ff 07 00 00 	and    r8d,0x7ff
   140008a74:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   140008a79:	42 8d b4 06 01 fc ff 	lea    esi,[rsi+r8*1-0x3ff]
   140008a80:	ff 
   140008a81:	41 83 f9 0f          	cmp    r9d,0xf
   140008a85:	7e 1c                	jle    140008aa3 <__strtodg+0x7cc>
   140008a87:	66 41 0f 7e f0       	movd   r8d,xmm6
   140008a8c:	48 c1 e0 20          	shl    rax,0x20
   140008a90:	41 83 e9 10          	sub    r9d,0x10
   140008a94:	49 09 c0             	or     r8,rax
   140008a97:	66 49 0f 6e f0       	movq   xmm6,r8
   140008a9c:	f2 0f 59 72 20       	mulsd  xmm6,QWORD PTR [rdx+0x20]
   140008aa1:	eb b5                	jmp    140008a58 <__strtodg+0x781>
   140008aa3:	41 89 c8             	mov    r8d,ecx
   140008aa6:	48 c1 e0 20          	shl    rax,0x20
   140008aaa:	41 c1 e8 04          	shr    r8d,0x4
   140008aae:	45 6b c0 f0          	imul   r8d,r8d,0xfffffff0
   140008ab2:	44 01 c1             	add    ecx,r8d
   140008ab5:	66 41 0f 7e f0       	movd   r8d,xmm6
   140008aba:	49 09 c0             	or     r8,rax
   140008abd:	66 49 0f 6e f0       	movq   xmm6,r8
   140008ac2:	85 c9                	test   ecx,ecx
   140008ac4:	0f 84 cb 00 00 00    	je     140008b95 <__strtodg+0x8be>
   140008aca:	f6 c1 01             	test   cl,0x1
   140008acd:	74 04                	je     140008ad3 <__strtodg+0x7fc>
   140008acf:	f2 0f 59 32          	mulsd  xmm6,QWORD PTR [rdx]
   140008ad3:	d1 f9                	sar    ecx,1
   140008ad5:	48 83 c2 08          	add    rdx,0x8
   140008ad9:	eb e7                	jmp    140008ac2 <__strtodg+0x7eb>
   140008adb:	0f 84 70 ff ff ff    	je     140008a51 <__strtodg+0x77a>
   140008ae1:	f7 d8                	neg    eax
   140008ae3:	89 c1                	mov    ecx,eax
   140008ae5:	83 e1 f0             	and    ecx,0xfffffff0
   140008ae8:	a8 0f                	test   al,0xf
   140008aea:	75 11                	jne    140008afd <__strtodg+0x826>
   140008aec:	c1 f9 04             	sar    ecx,0x4
   140008aef:	48 8b 15 6a 3f 00 00 	mov    rdx,QWORD PTR [rip+0x3f6a]        # 14000ca60 <.refptr.__tinytens_D2A>
   140008af6:	31 f6                	xor    esi,esi
   140008af8:	41 89 c9             	mov    r9d,ecx
   140008afb:	eb 19                	jmp    140008b16 <__strtodg+0x83f>
   140008afd:	48 8b 15 4c 3f 00 00 	mov    rdx,QWORD PTR [rip+0x3f4c]        # 14000ca50 <.refptr.__tens_D2A>
   140008b04:	83 e0 0f             	and    eax,0xf
   140008b07:	f2 0f 5e 34 c2       	divsd  xmm6,QWORD PTR [rdx+rax*8]
   140008b0c:	85 c9                	test   ecx,ecx
   140008b0e:	0f 84 3d ff ff ff    	je     140008a51 <__strtodg+0x77a>
   140008b14:	eb d6                	jmp    140008aec <__strtodg+0x815>
   140008b16:	66 49 0f 7e f0       	movq   r8,xmm6
   140008b1b:	49 c1 e8 20          	shr    r8,0x20
   140008b1f:	44 89 c0             	mov    eax,r8d
   140008b22:	41 c1 e8 14          	shr    r8d,0x14
   140008b26:	25 ff ff 0f 80       	and    eax,0x800fffff
   140008b2b:	41 81 e0 ff 07 00 00 	and    r8d,0x7ff
   140008b32:	0d 00 00 f0 3f       	or     eax,0x3ff00000
   140008b37:	42 8d b4 06 01 fc ff 	lea    esi,[rsi+r8*1-0x3ff]
   140008b3e:	ff 
   140008b3f:	41 83 f9 0f          	cmp    r9d,0xf
   140008b43:	7e 1c                	jle    140008b61 <__strtodg+0x88a>
   140008b45:	66 41 0f 7e f0       	movd   r8d,xmm6
   140008b4a:	48 c1 e0 20          	shl    rax,0x20
   140008b4e:	41 83 e9 10          	sub    r9d,0x10
   140008b52:	49 09 c0             	or     r8,rax
   140008b55:	66 49 0f 6e f0       	movq   xmm6,r8
   140008b5a:	f2 0f 59 72 20       	mulsd  xmm6,QWORD PTR [rdx+0x20]
   140008b5f:	eb b5                	jmp    140008b16 <__strtodg+0x83f>
   140008b61:	41 89 c8             	mov    r8d,ecx
   140008b64:	48 c1 e0 20          	shl    rax,0x20
   140008b68:	41 c1 e8 04          	shr    r8d,0x4
   140008b6c:	45 6b c0 f0          	imul   r8d,r8d,0xfffffff0
   140008b70:	44 01 c1             	add    ecx,r8d
   140008b73:	66 41 0f 7e f0       	movd   r8d,xmm6
   140008b78:	49 09 c0             	or     r8,rax
   140008b7b:	66 49 0f 6e f0       	movq   xmm6,r8
   140008b80:	85 c9                	test   ecx,ecx
   140008b82:	74 11                	je     140008b95 <__strtodg+0x8be>
   140008b84:	f6 c1 01             	test   cl,0x1
   140008b87:	74 04                	je     140008b8d <__strtodg+0x8b6>
   140008b89:	f2 0f 59 32          	mulsd  xmm6,QWORD PTR [rdx]
   140008b8d:	d1 f9                	sar    ecx,1
   140008b8f:	48 83 c2 08          	add    rdx,0x8
   140008b93:	eb eb                	jmp    140008b80 <__strtodg+0x8a9>
   140008b95:	48 8d 94 24 bc 00 00 	lea    rdx,[rsp+0xbc]
   140008b9c:	00 
   140008b9d:	4c 8d 84 24 b8 00 00 	lea    r8,[rsp+0xb8]
   140008ba4:	00 
   140008ba5:	0f 28 c6             	movaps xmm0,xmm6
   140008ba8:	e8 68 f2 ff ff       	call   140007e15 <__d2b_D2A>
   140008bad:	8b 94 24 b8 00 00 00 	mov    edx,DWORD PTR [rsp+0xb8]
   140008bb4:	03 b4 24 bc 00 00 00 	add    esi,DWORD PTR [rsp+0xbc]
   140008bbb:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140008bc2:	00 
   140008bc3:	89 d7                	mov    edi,edx
   140008bc5:	89 b4 24 bc 00 00 00 	mov    DWORD PTR [rsp+0xbc],esi
   140008bcc:	44 29 ff             	sub    edi,r15d
   140008bcf:	85 ff                	test   edi,edi
   140008bd1:	7e 25                	jle    140008bf8 <__strtodg+0x921>
   140008bd3:	89 fa                	mov    edx,edi
   140008bd5:	48 89 c1             	mov    rcx,rax
   140008bd8:	e8 e3 e8 ff ff       	call   1400074c0 <__rshift_D2A>
   140008bdd:	03 bc 24 bc 00 00 00 	add    edi,DWORD PTR [rsp+0xbc]
   140008be4:	44 89 bc 24 b8 00 00 	mov    DWORD PTR [rsp+0xb8],r15d
   140008beb:	00 
   140008bec:	44 89 fa             	mov    edx,r15d
   140008bef:	89 bc 24 bc 00 00 00 	mov    DWORD PTR [rsp+0xbc],edi
   140008bf6:	89 fe                	mov    esi,edi
   140008bf8:	8d 04 16             	lea    eax,[rsi+rdx*1]
   140008bfb:	44 29 f8             	sub    eax,r15d
   140008bfe:	89 44 24 4c          	mov    DWORD PTR [rsp+0x4c],eax
   140008c02:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140008c09:	00 
   140008c0a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140008c0d:	89 44 24 68          	mov    DWORD PTR [rsp+0x68],eax
   140008c11:	ff c0                	inc    eax
   140008c13:	3b 44 24 4c          	cmp    eax,DWORD PTR [rsp+0x4c]
   140008c17:	0f 8c 74 0a 00 00    	jl     140009691 <__strtodg+0x13ba>
   140008c1d:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140008c24:	00 
   140008c25:	8b 78 04             	mov    edi,DWORD PTR [rax+0x4]
   140008c28:	39 7c 24 4c          	cmp    DWORD PTR [rsp+0x4c],edi
   140008c2c:	0f 8d b5 00 00 00    	jge    140008ce7 <__strtodg+0xa10>
   140008c32:	41 89 f5             	mov    r13d,esi
   140008c35:	41 29 fd             	sub    r13d,edi
   140008c38:	45 85 ed             	test   r13d,r13d
   140008c3b:	7e 22                	jle    140008c5f <__strtodg+0x988>
   140008c3d:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140008c44:	00 
   140008c45:	44 89 ea             	mov    edx,r13d
   140008c48:	e8 78 ee ff ff       	call   140007ac5 <__lshift_D2A>
   140008c4d:	44 01 ac 24 b8 00 00 	add    DWORD PTR [rsp+0xb8],r13d
   140008c54:	00 
   140008c55:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140008c5c:	00 
   140008c5d:	eb 6b                	jmp    140008cca <__strtodg+0x9f3>
   140008c5f:	74 69                	je     140008cca <__strtodg+0x9f3>
   140008c61:	41 01 d5             	add    r13d,edx
   140008c64:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140008c6b:	00 
   140008c6c:	44 89 ac 24 b8 00 00 	mov    DWORD PTR [rsp+0xb8],r13d
   140008c73:	00 
   140008c74:	45 85 ed             	test   r13d,r13d
   140008c77:	7f 48                	jg     140008cc1 <__strtodg+0x9ea>
   140008c79:	41 ff c5             	inc    r13d
   140008c7c:	7d 28                	jge    140008ca6 <__strtodg+0x9cf>
   140008c7e:	48 8b 84 24 c8 00 00 	mov    rax,QWORD PTR [rsp+0xc8]
   140008c85:	00 
   140008c86:	31 db                	xor    ebx,ebx
   140008c88:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x50
   140008c8f:	50 00 00 00 
   140008c93:	48 89 58 14          	mov    QWORD PTR [rax+0x14],rbx
   140008c97:	48 8b 84 24 58 01 00 	mov    rax,QWORD PTR [rsp+0x158]
   140008c9e:	00 
   140008c9f:	89 38                	mov    DWORD PTR [rax],edi
   140008ca1:	e9 ee 0a 00 00       	jmp    140009794 <__strtodg+0x14bd>
   140008ca6:	48 b8 01 00 00 00 01 	movabs rax,0x100000001
   140008cad:	00 00 00 
   140008cb0:	c7 84 24 b8 00 00 00 	mov    DWORD PTR [rsp+0xb8],0x1
   140008cb7:	01 00 00 00 
   140008cbb:	48 89 41 14          	mov    QWORD PTR [rcx+0x14],rax
   140008cbf:	eb 09                	jmp    140008cca <__strtodg+0x9f3>
   140008cc1:	89 fa                	mov    edx,edi
   140008cc3:	29 f2                	sub    edx,esi
   140008cc5:	e8 f6 e7 ff ff       	call   1400074c0 <__rshift_D2A>
   140008cca:	89 bc 24 bc 00 00 00 	mov    DWORD PTR [rsp+0xbc],edi
   140008cd1:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [rsp+0x90],0x0
   140008cd8:	00 
   140008cd9:	74 10                	je     140008ceb <__strtodg+0xa14>
   140008cdb:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
   140008cdf:	ff c0                	inc    eax
   140008ce1:	39 f8                	cmp    eax,edi
   140008ce3:	7d 06                	jge    140008ceb <__strtodg+0xa14>
   140008ce5:	eb 97                	jmp    140008c7e <__strtodg+0x9a7>
   140008ce7:	31 f6                	xor    esi,esi
   140008ce9:	eb 09                	jmp    140008cf4 <__strtodg+0xa1d>
   140008ceb:	89 7c 24 4c          	mov    DWORD PTR [rsp+0x4c],edi
   140008cef:	be 01 00 00 00       	mov    esi,0x1
   140008cf4:	8b 44 24 70          	mov    eax,DWORD PTR [rsp+0x70]
   140008cf8:	44 8b 4c 24 58       	mov    r9d,DWORD PTR [rsp+0x58]
   140008cfd:	45 89 e0             	mov    r8d,r12d
   140008d00:	89 ea                	mov    edx,ebp
   140008d02:	48 8b 4c 24 60       	mov    rcx,QWORD PTR [rsp+0x60]
   140008d07:	41 29 de             	sub    r14d,ebx
   140008d0a:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   140008d0e:	e8 ed 15 00 00       	call   14000a300 <__s2b_D2A>
   140008d13:	48 89 84 24 80 00 00 	mov    QWORD PTR [rsp+0x80],rax
   140008d1a:	00 
   140008d1b:	31 c0                	xor    eax,eax
   140008d1d:	83 7c 24 48 00       	cmp    DWORD PTR [rsp+0x48],0x0
   140008d22:	41 0f 48 c6          	cmovs  eax,r14d
   140008d26:	89 84 24 88 00 00 00 	mov    DWORD PTR [rsp+0x88],eax
   140008d2d:	b8 00 00 00 00       	mov    eax,0x0
   140008d32:	0f 49 44 24 48       	cmovns eax,DWORD PTR [rsp+0x48]
   140008d37:	83 7c 24 54 00       	cmp    DWORD PTR [rsp+0x54],0x0
   140008d3c:	89 84 24 94 00 00 00 	mov    DWORD PTR [rsp+0x94],eax
   140008d43:	0f 95 84 24 9b 00 00 	setne  BYTE PTR [rsp+0x9b]
   140008d4a:	00 
   140008d4b:	31 db                	xor    ebx,ebx
   140008d4d:	48 8b 84 24 80 00 00 	mov    rax,QWORD PTR [rsp+0x80]
   140008d54:	00 
   140008d55:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
   140008d58:	e8 86 e9 ff ff       	call   1400076e3 <__Balloc_D2A>
   140008d5d:	48 8b 8c 24 80 00 00 	mov    rcx,QWORD PTR [rsp+0x80]
   140008d64:	00 
   140008d65:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
   140008d6a:	48 8b 84 24 80 00 00 	mov    rax,QWORD PTR [rsp+0x80]
   140008d71:	00 
   140008d72:	48 8d 51 10          	lea    rdx,[rcx+0x10]
   140008d76:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140008d7b:	48 63 40 14          	movsxd rax,DWORD PTR [rax+0x14]
   140008d7f:	48 83 c1 10          	add    rcx,0x10
   140008d83:	4c 8d 04 85 08 00 00 	lea    r8,[rax*4+0x8]
   140008d8a:	00 
   140008d8b:	e8 68 1e 00 00       	call   14000abf8 <memcpy>
   140008d90:	48 8b 84 24 c8 00 00 	mov    rax,QWORD PTR [rsp+0xc8]
   140008d97:	00 
   140008d98:	8b 48 08             	mov    ecx,DWORD PTR [rax+0x8]
   140008d9b:	e8 43 e9 ff ff       	call   1400076e3 <__Balloc_D2A>
   140008da0:	48 8b 94 24 c8 00 00 	mov    rdx,QWORD PTR [rsp+0xc8]
   140008da7:	00 
   140008da8:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   140008dad:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   140008db2:	48 63 42 14          	movsxd rax,DWORD PTR [rdx+0x14]
   140008db6:	48 83 c2 10          	add    rdx,0x10
   140008dba:	48 83 c1 10          	add    rcx,0x10
   140008dbe:	4c 8d 04 85 08 00 00 	lea    r8,[rax*4+0x8]
   140008dc5:	00 
   140008dc6:	e8 2d 1e 00 00       	call   14000abf8 <memcpy>
   140008dcb:	8b 94 24 bc 00 00 00 	mov    edx,DWORD PTR [rsp+0xbc]
   140008dd2:	b9 01 00 00 00       	mov    ecx,0x1
   140008dd7:	44 8b b4 24 b8 00 00 	mov    r14d,DWORD PTR [rsp+0xb8]
   140008dde:	00 
   140008ddf:	8d 2c 1a             	lea    ebp,[rdx+rbx*1]
   140008de2:	45 89 f4             	mov    r12d,r14d
   140008de5:	89 54 24 68          	mov    DWORD PTR [rsp+0x68],edx
   140008de9:	e8 89 ea ff ff       	call   140007877 <__i2b_D2A>
   140008dee:	41 29 dc             	sub    r12d,ebx
   140008df1:	85 ed                	test   ebp,ebp
   140008df3:	8b 54 24 68          	mov    edx,DWORD PTR [rsp+0x68]
   140008df7:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   140008dfc:	78 11                	js     140008e0f <__strtodg+0xb38>
   140008dfe:	44 8b ac 24 94 00 00 	mov    r13d,DWORD PTR [rsp+0x94]
   140008e05:	00 
   140008e06:	03 ac 24 88 00 00 00 	add    ebp,DWORD PTR [rsp+0x88]
   140008e0d:	eb 12                	jmp    140008e21 <__strtodg+0xb4a>
   140008e0f:	44 8b ac 24 94 00 00 	mov    r13d,DWORD PTR [rsp+0x94]
   140008e16:	00 
   140008e17:	41 29 ed             	sub    r13d,ebp
   140008e1a:	8b ac 24 88 00 00 00 	mov    ebp,DWORD PTR [rsp+0x88]
   140008e21:	41 01 d6             	add    r14d,edx
   140008e24:	41 8d 47 01          	lea    eax,[r15+0x1]
   140008e28:	45 29 fe             	sub    r14d,r15d
   140008e2b:	44 29 e0             	sub    eax,r12d
   140008e2e:	44 39 f7             	cmp    edi,r14d
   140008e31:	7e 06                	jle    140008e39 <__strtodg+0xb62>
   140008e33:	41 29 fe             	sub    r14d,edi
   140008e36:	44 01 f0             	add    eax,r14d
   140008e39:	44 8d 74 05 00       	lea    r14d,[rbp+rax*1+0x0]
   140008e3e:	41 01 c5             	add    r13d,eax
   140008e41:	45 39 ee             	cmp    r14d,r13d
   140008e44:	44 89 e8             	mov    eax,r13d
   140008e47:	41 0f 4e c6          	cmovle eax,r14d
   140008e4b:	39 e8                	cmp    eax,ebp
   140008e4d:	0f 4f c5             	cmovg  eax,ebp
   140008e50:	85 c0                	test   eax,eax
   140008e52:	7e 08                	jle    140008e5c <__strtodg+0xb85>
   140008e54:	41 29 c6             	sub    r14d,eax
   140008e57:	41 29 c5             	sub    r13d,eax
   140008e5a:	29 c5                	sub    ebp,eax
   140008e5c:	83 bc 24 88 00 00 00 	cmp    DWORD PTR [rsp+0x88],0x0
   140008e63:	00 
   140008e64:	7e 3c                	jle    140008ea2 <__strtodg+0xbcb>
   140008e66:	8b 94 24 88 00 00 00 	mov    edx,DWORD PTR [rsp+0x88]
   140008e6d:	48 8b 4c 24 60       	mov    rcx,QWORD PTR [rsp+0x60]
   140008e72:	e8 41 eb ff ff       	call   1400079b8 <__pow5mult_D2A>
   140008e77:	48 8b 54 24 58       	mov    rdx,QWORD PTR [rsp+0x58]
   140008e7c:	48 89 c1             	mov    rcx,rax
   140008e7f:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   140008e84:	e8 14 ea ff ff       	call   14000789d <__mult_D2A>
   140008e89:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   140008e8e:	48 89 44 24 68       	mov    QWORD PTR [rsp+0x68],rax
   140008e93:	e8 01 e9 ff ff       	call   140007799 <__Bfree_D2A>
   140008e98:	48 8b 44 24 68       	mov    rax,QWORD PTR [rsp+0x68]
   140008e9d:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   140008ea2:	44 89 f2             	mov    edx,r14d
   140008ea5:	29 da                	sub    edx,ebx
   140008ea7:	85 d2                	test   edx,edx
   140008ea9:	7e 11                	jle    140008ebc <__strtodg+0xbe5>
   140008eab:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   140008eb0:	e8 10 ec ff ff       	call   140007ac5 <__lshift_D2A>
   140008eb5:	48 89 44 24 58       	mov    QWORD PTR [rsp+0x58],rax
   140008eba:	eb 11                	jmp    140008ecd <__strtodg+0xbf6>
   140008ebc:	74 0f                	je     140008ecd <__strtodg+0xbf6>
   140008ebe:	44 29 f3             	sub    ebx,r14d
   140008ec1:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   140008ec6:	89 da                	mov    edx,ebx
   140008ec8:	e8 f3 e5 ff ff       	call   1400074c0 <__rshift_D2A>
   140008ecd:	83 7c 24 48 00       	cmp    DWORD PTR [rsp+0x48],0x0
   140008ed2:	7e 16                	jle    140008eea <__strtodg+0xc13>
   140008ed4:	8b 94 24 94 00 00 00 	mov    edx,DWORD PTR [rsp+0x94]
   140008edb:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140008ee0:	e8 d3 ea ff ff       	call   1400079b8 <__pow5mult_D2A>
   140008ee5:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
   140008eea:	45 85 ed             	test   r13d,r13d
   140008eed:	7e 12                	jle    140008f01 <__strtodg+0xc2a>
   140008eef:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140008ef4:	44 89 ea             	mov    edx,r13d
   140008ef7:	e8 c9 eb ff ff       	call   140007ac5 <__lshift_D2A>
   140008efc:	48 89 44 24 70       	mov    QWORD PTR [rsp+0x70],rax
   140008f01:	85 ed                	test   ebp,ebp
   140008f03:	7e 11                	jle    140008f16 <__strtodg+0xc3f>
   140008f05:	48 8b 4c 24 60       	mov    rcx,QWORD PTR [rsp+0x60]
   140008f0a:	89 ea                	mov    edx,ebp
   140008f0c:	e8 b4 eb ff ff       	call   140007ac5 <__lshift_D2A>
   140008f11:	48 89 44 24 60       	mov    QWORD PTR [rsp+0x60],rax
   140008f16:	48 8b 54 24 70       	mov    rdx,QWORD PTR [rsp+0x70]
   140008f1b:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   140008f20:	e8 ef ec ff ff       	call   140007c14 <__diff_D2A>
   140008f25:	49 89 c5             	mov    r13,rax
   140008f28:	83 78 14 01          	cmp    DWORD PTR [rax+0x14],0x1
   140008f2c:	7f 0a                	jg     140008f38 <__strtodg+0xc61>
   140008f2e:	83 78 18 00          	cmp    DWORD PTR [rax+0x18],0x0
   140008f32:	0f 84 bd 06 00 00    	je     1400095f5 <__strtodg+0x131e>
   140008f38:	45 31 db             	xor    r11d,r11d
   140008f3b:	41 8b 5d 10          	mov    ebx,DWORD PTR [r13+0x10]
   140008f3f:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140008f44:	4c 89 e9             	mov    rcx,r13
   140008f47:	45 89 5d 10          	mov    DWORD PTR [r13+0x10],r11d
   140008f4b:	e8 80 ec ff ff       	call   140007bd0 <__cmp_D2A>
   140008f50:	85 c0                	test   eax,eax
   140008f52:	0f 8f dd 00 00 00    	jg     140009035 <__strtodg+0xd5e>
   140008f58:	80 bc 24 9b 00 00 00 	cmp    BYTE PTR [rsp+0x9b],0x0
   140008f5f:	00 
   140008f60:	0f 84 cf 00 00 00    	je     140009035 <__strtodg+0xd5e>
   140008f66:	8b 44 24 54          	mov    eax,DWORD PTR [rsp+0x54]
   140008f6a:	83 e0 01             	and    eax,0x1
   140008f6d:	39 d8                	cmp    eax,ebx
   140008f6f:	0f 84 a6 00 00 00    	je     14000901b <__strtodg+0xd44>
   140008f75:	85 db                	test   ebx,ebx
   140008f77:	74 25                	je     140008f9e <__strtodg+0xcc7>
   140008f79:	f2 0f 10 3d 3f 39 00 	movsd  xmm7,QWORD PTR [rip+0x393f]        # 14000c8c0 <fivesbits+0x60>
   140008f80:	00 
   140008f81:	31 c3                	xor    ebx,eax
   140008f83:	31 ed                	xor    ebp,ebp
   140008f85:	41 be 20 00 00 00    	mov    r14d,0x20
   140008f8b:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x21
   140008f92:	21 00 00 00 
   140008f96:	0f 28 f7             	movaps xmm6,xmm7
   140008f99:	e9 c6 03 00 00       	jmp    140009364 <__strtodg+0x108d>
   140008f9e:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x11
   140008fa5:	11 00 00 00 
   140008fa9:	39 7c 24 4c          	cmp    DWORD PTR [rsp+0x4c],edi
   140008fad:	74 62                	je     140009011 <__strtodg+0xd3a>
   140008faf:	4c 8b 84 24 c8 00 00 	mov    r8,QWORD PTR [rsp+0xc8]
   140008fb6:	00 
   140008fb7:	44 89 f8             	mov    eax,r15d
   140008fba:	49 8d 50 18          	lea    rdx,[r8+0x18]
   140008fbe:	83 f8 1f             	cmp    eax,0x1f
   140008fc1:	7e 11                	jle    140008fd4 <__strtodg+0xcfd>
   140008fc3:	48 83 c2 04          	add    rdx,0x4
   140008fc7:	83 7a fc 00          	cmp    DWORD PTR [rdx-0x4],0x0
   140008fcb:	75 44                	jne    140009011 <__strtodg+0xd3a>
   140008fcd:	ff c3                	inc    ebx
   140008fcf:	83 e8 20             	sub    eax,0x20
   140008fd2:	eb ea                	jmp    140008fbe <__strtodg+0xce7>
   140008fd4:	83 f8 01             	cmp    eax,0x1
   140008fd7:	7f 20                	jg     140008ff9 <__strtodg+0xd22>
   140008fd9:	8b 44 24 4c          	mov    eax,DWORD PTR [rsp+0x4c]
   140008fdd:	44 89 bc 24 b8 00 00 	mov    DWORD PTR [rsp+0xb8],r15d
   140008fe4:	00 
   140008fe5:	44 89 fa             	mov    edx,r15d
   140008fe8:	4c 89 c1             	mov    rcx,r8
   140008feb:	ff c8                	dec    eax
   140008fed:	89 84 24 bc 00 00 00 	mov    DWORD PTR [rsp+0xbc],eax
   140008ff4:	e9 b9 01 00 00       	jmp    1400091b2 <__strtodg+0xedb>
   140008ff9:	48 63 db             	movsxd rbx,ebx
   140008ffc:	ff c8                	dec    eax
   140008ffe:	41 8b 54 98 18       	mov    edx,DWORD PTR [r8+rbx*4+0x18]
   140009003:	0f bc ca             	bsf    ecx,edx
   140009006:	d3 ea                	shr    edx,cl
   140009008:	41 89 54 98 18       	mov    DWORD PTR [r8+rbx*4+0x18],edx
   14000900d:	39 c8                	cmp    eax,ecx
   14000900f:	7e c8                	jle    140008fd9 <__strtodg+0xd02>
   140009011:	bb 01 00 00 00       	mov    ebx,0x1
   140009016:	e9 63 02 00 00       	jmp    14000927e <__strtodg+0xfa7>
   14000901b:	83 f8 01             	cmp    eax,0x1
   14000901e:	19 c0                	sbb    eax,eax
   140009020:	83 e0 10             	and    eax,0x10
   140009023:	83 c0 10             	add    eax,0x10
   140009026:	83 c8 01             	or     eax,0x1
   140009029:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   140009030:	e9 c0 05 00 00       	jmp    1400095f5 <__strtodg+0x131e>
   140009035:	85 c0                	test   eax,eax
   140009037:	79 70                	jns    1400090a9 <__strtodg+0xdd2>
   140009039:	83 fb 01             	cmp    ebx,0x1
   14000903c:	19 c0                	sbb    eax,eax
   14000903e:	83 e0 10             	and    eax,0x10
   140009041:	83 c0 11             	add    eax,0x11
   140009044:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   14000904b:	85 db                	test   ebx,ebx
   14000904d:	0f 85 a2 05 00 00    	jne    1400095f5 <__strtodg+0x131e>
   140009053:	41 ff cc             	dec    r12d
   140009056:	0f 8f 99 05 00 00    	jg     1400095f5 <__strtodg+0x131e>
   14000905c:	39 7c 24 4c          	cmp    DWORD PTR [rsp+0x4c],edi
   140009060:	0f 84 8f 05 00 00    	je     1400095f5 <__strtodg+0x131e>
   140009066:	f7 c6 01 00 00 00    	test   esi,0x1
   14000906c:	0f 85 83 05 00 00    	jne    1400095f5 <__strtodg+0x131e>
   140009072:	4c 89 e9             	mov    rcx,r13
   140009075:	ba 01 00 00 00       	mov    edx,0x1
   14000907a:	31 f6                	xor    esi,esi
   14000907c:	e8 44 ea ff ff       	call   140007ac5 <__lshift_D2A>
   140009081:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140009086:	48 89 c1             	mov    rcx,rax
   140009089:	49 89 c5             	mov    r13,rax
   14000908c:	e8 3f eb ff ff       	call   140007bd0 <__cmp_D2A>
   140009091:	85 c0                	test   eax,eax
   140009093:	0f 8e 60 05 00 00    	jle    1400095f9 <__strtodg+0x1322>
   140009099:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x11
   1400090a0:	11 00 00 00 
   1400090a4:	e9 ee 00 00 00       	jmp    140009197 <__strtodg+0xec0>
   1400090a9:	0f 85 ac 01 00 00    	jne    14000925b <__strtodg+0xf84>
   1400090af:	85 db                	test   ebx,ebx
   1400090b1:	0f 84 8d 00 00 00    	je     140009144 <__strtodg+0xe6d>
   1400090b7:	85 f6                	test   esi,esi
   1400090b9:	0f 84 05 01 00 00    	je     1400091c4 <__strtodg+0xeed>
   1400090bf:	8b 8c 24 b8 00 00 00 	mov    ecx,DWORD PTR [rsp+0xb8]
   1400090c6:	4c 8b 84 24 c8 00 00 	mov    r8,QWORD PTR [rsp+0xc8]
   1400090cd:	00 
   1400090ce:	89 ca                	mov    edx,ecx
   1400090d0:	49 8d 40 18          	lea    rax,[r8+0x18]
   1400090d4:	c1 fa 05             	sar    edx,0x5
   1400090d7:	48 63 d2             	movsxd rdx,edx
   1400090da:	48 8d 14 90          	lea    rdx,[rax+rdx*4]
   1400090de:	48 39 d0             	cmp    rax,rdx
   1400090e1:	73 0f                	jae    1400090f2 <__strtodg+0xe1b>
   1400090e3:	48 83 c0 04          	add    rax,0x4
   1400090e7:	83 78 fc ff          	cmp    DWORD PTR [rax-0x4],0xffffffff
   1400090eb:	74 f1                	je     1400090de <__strtodg+0xe07>
   1400090ed:	e9 d2 00 00 00       	jmp    1400091c4 <__strtodg+0xeed>
   1400090f2:	83 e1 1f             	and    ecx,0x1f
   1400090f5:	74 16                	je     14000910d <__strtodg+0xe36>
   1400090f7:	ba ff ff ff ff       	mov    edx,0xffffffff
   1400090fc:	d3 e2                	shl    edx,cl
   1400090fe:	0b 10                	or     edx,DWORD PTR [rax]
   140009100:	b8 11 00 00 00       	mov    eax,0x11
   140009105:	ff c2                	inc    edx
   140009107:	0f 85 bc 00 00 00    	jne    1400091c9 <__strtodg+0xef2>
   14000910d:	48 b8 01 00 00 00 01 	movabs rax,0x100000001
   140009114:	00 00 00 
   140009117:	31 f6                	xor    esi,esi
   140009119:	c7 84 24 b8 00 00 00 	mov    DWORD PTR [rsp+0xb8],0x1
   140009120:	01 00 00 00 
   140009124:	49 89 40 14          	mov    QWORD PTR [r8+0x14],rax
   140009128:	41 8d 44 3f ff       	lea    eax,[r15+rdi*1-0x1]
   14000912d:	89 84 24 bc 00 00 00 	mov    DWORD PTR [rsp+0xbc],eax
   140009134:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x21
   14000913b:	21 00 00 00 
   14000913f:	e9 b5 04 00 00       	jmp    1400095f9 <__strtodg+0x1322>
   140009144:	b8 21 00 00 00       	mov    eax,0x21
   140009149:	41 83 fc 01          	cmp    r12d,0x1
   14000914d:	75 7a                	jne    1400091c9 <__strtodg+0xef2>
   14000914f:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x1
   140009156:	01 00 00 00 
   14000915a:	39 7c 24 4c          	cmp    DWORD PTR [rsp+0x4c],edi
   14000915e:	75 37                	jne    140009197 <__strtodg+0xec0>
   140009160:	48 8b 84 24 c8 00 00 	mov    rax,QWORD PTR [rsp+0xc8]
   140009167:	00 
   140009168:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x21
   14000916f:	21 00 00 00 
   140009173:	83 78 14 01          	cmp    DWORD PTR [rax+0x14],0x1
   140009177:	0f 85 78 04 00 00    	jne    1400095f5 <__strtodg+0x131e>
   14000917d:	83 78 18 01          	cmp    DWORD PTR [rax+0x18],0x1
   140009181:	0f 85 6e 04 00 00    	jne    1400095f5 <__strtodg+0x131e>
   140009187:	c7 84 24 90 00 00 00 	mov    DWORD PTR [rsp+0x90],0x1
   14000918e:	01 00 00 00 
   140009192:	e9 5e 04 00 00       	jmp    1400095f5 <__strtodg+0x131e>
   140009197:	44 29 bc 24 bc 00 00 	sub    DWORD PTR [rsp+0xbc],r15d
   14000919e:	00 
   14000919f:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   1400091a6:	00 
   1400091a7:	44 89 fa             	mov    edx,r15d
   1400091aa:	44 89 bc 24 b8 00 00 	mov    DWORD PTR [rsp+0xb8],r15d
   1400091b1:	00 
   1400091b2:	e8 9b f0 ff ff       	call   140008252 <__set_ones_D2A>
   1400091b7:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   1400091be:	00 
   1400091bf:	e9 31 04 00 00       	jmp    1400095f5 <__strtodg+0x131e>
   1400091c4:	b8 11 00 00 00       	mov    eax,0x11
   1400091c9:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   1400091d0:	45 39 e7             	cmp    r15d,r12d
   1400091d3:	7e 0c                	jle    1400091e1 <__strtodg+0xf0a>
   1400091d5:	f7 c6 01 00 00 00    	test   esi,0x1
   1400091db:	0f 84 18 04 00 00    	je     1400095f9 <__strtodg+0x1322>
   1400091e1:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   1400091e8:	00 
   1400091e9:	f6 41 18 01          	test   BYTE PTR [rcx+0x18],0x1
   1400091ed:	0f 84 02 04 00 00    	je     1400095f5 <__strtodg+0x131e>
   1400091f3:	85 db                	test   ebx,ebx
   1400091f5:	74 4a                	je     140009241 <__strtodg+0xf6a>
   1400091f7:	e8 14 ed ff ff       	call   140007f10 <__increment_D2A>
   1400091fc:	8b 94 24 b8 00 00 00 	mov    edx,DWORD PTR [rsp+0xb8]
   140009203:	48 89 c1             	mov    rcx,rax
   140009206:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   14000920d:	00 
   14000920e:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   140009211:	ff c8                	dec    eax
   140009213:	48 98                	cdqe
   140009215:	0f bd 44 81 18       	bsr    eax,DWORD PTR [rcx+rax*4+0x18]
   14000921a:	89 d1                	mov    ecx,edx
   14000921c:	f7 d9                	neg    ecx
   14000921e:	83 e1 1f             	and    ecx,0x1f
   140009221:	83 f0 1f             	xor    eax,0x1f
   140009224:	39 c1                	cmp    ecx,eax
   140009226:	74 09                	je     140009231 <__strtodg+0xf5a>
   140009228:	ff c2                	inc    edx
   14000922a:	89 94 24 b8 00 00 00 	mov    DWORD PTR [rsp+0xb8],edx
   140009231:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x21
   140009238:	21 00 00 00 
   14000923c:	e9 b4 03 00 00       	jmp    1400095f5 <__strtodg+0x131e>
   140009241:	41 ff cc             	dec    r12d
   140009244:	74 52                	je     140009298 <__strtodg+0xfc1>
   140009246:	e8 de ef ff ff       	call   140008229 <__decrement_D2A>
   14000924b:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x11
   140009252:	11 00 00 00 
   140009256:	e9 9a 03 00 00       	jmp    1400095f5 <__strtodg+0x131e>
   14000925b:	48 8b 54 24 60       	mov    rdx,QWORD PTR [rsp+0x60]
   140009260:	4c 89 e9             	mov    rcx,r13
   140009263:	e8 61 11 00 00       	call   14000a3c9 <__ratio_D2A>
   140009268:	f2 0f 10 15 58 36 00 	movsd  xmm2,QWORD PTR [rip+0x3658]        # 14000c8c8 <fivesbits+0x68>
   14000926f:	00 
   140009270:	66 0f 2f d0          	comisd xmm2,xmm0
   140009274:	72 48                	jb     1400092be <__strtodg+0xfe7>
   140009276:	85 db                	test   ebx,ebx
   140009278:	0f 85 d1 00 00 00    	jne    14000934f <__strtodg+0x1078>
   14000927e:	41 ff cc             	dec    r12d
   140009281:	0f 8f e7 00 00 00    	jg     14000936e <__strtodg+0x1097>
   140009287:	f7 c6 01 00 00 00    	test   esi,0x1
   14000928d:	0f 84 db 00 00 00    	je     14000936e <__strtodg+0x1097>
   140009293:	be 01 00 00 00       	mov    esi,0x1
   140009298:	48 8b 84 24 c8 00 00 	mov    rax,QWORD PTR [rsp+0xc8]
   14000929f:	00 
   1400092a0:	45 31 d2             	xor    r10d,r10d
   1400092a3:	89 bc 24 bc 00 00 00 	mov    DWORD PTR [rsp+0xbc],edi
   1400092aa:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x50
   1400092b1:	50 00 00 00 
   1400092b5:	44 89 50 14          	mov    DWORD PTR [rax+0x14],r10d
   1400092b9:	e9 37 03 00 00       	jmp    1400095f5 <__strtodg+0x131e>
   1400092be:	f2 0f 59 05 0a 36 00 	mulsd  xmm0,QWORD PTR [rip+0x360a]        # 14000c8d0 <fivesbits+0x70>
   1400092c5:	00 
   1400092c6:	0f 28 f0             	movaps xmm6,xmm0
   1400092c9:	85 db                	test   ebx,ebx
   1400092cb:	75 10                	jne    1400092dd <__strtodg+0x1006>
   1400092cd:	c7 44 24 68 01 00 00 	mov    DWORD PTR [rsp+0x68],0x1
   1400092d4:	00 
   1400092d5:	41 be 20 00 00 00    	mov    r14d,0x20
   1400092db:	eb 0e                	jmp    1400092eb <__strtodg+0x1014>
   1400092dd:	45 31 c9             	xor    r9d,r9d
   1400092e0:	41 be 10 00 00 00    	mov    r14d,0x10
   1400092e6:	44 89 4c 24 68       	mov    DWORD PTR [rsp+0x68],r9d
   1400092eb:	f2 0f 10 05 e5 35 00 	movsd  xmm0,QWORD PTR [rip+0x35e5]        # 14000c8d8 <fivesbits+0x78>
   1400092f2:	00 
   1400092f3:	66 0f 2f c6          	comisd xmm0,xmm6
   1400092f7:	0f 86 8e 00 00 00    	jbe    14000938b <__strtodg+0x10b4>
   1400092fd:	f2 0f 2c ee          	cvttsd2si ebp,xmm6
   140009301:	f2 0f 2a c5          	cvtsi2sd xmm0,ebp
   140009305:	f2 0f 5c f0          	subsd  xmm6,xmm0
   140009309:	83 7c 24 54 01       	cmp    DWORD PTR [rsp+0x54],0x1
   14000930e:	74 13                	je     140009323 <__strtodg+0x104c>
   140009310:	83 7c 24 54 02       	cmp    DWORD PTR [rsp+0x54],0x2
   140009315:	74 15                	je     14000932c <__strtodg+0x1055>
   140009317:	66 0f 2f 35 b1 35 00 	comisd xmm6,QWORD PTR [rip+0x35b1]        # 14000c8d0 <fivesbits+0x70>
   14000931e:	00 
   14000931f:	72 28                	jb     140009349 <__strtodg+0x1072>
   140009321:	eb 19                	jmp    14000933c <__strtodg+0x1065>
   140009323:	83 7c 24 68 00       	cmp    DWORD PTR [rsp+0x68],0x0
   140009328:	74 1f                	je     140009349 <__strtodg+0x1072>
   14000932a:	eb 07                	jmp    140009333 <__strtodg+0x105c>
   14000932c:	83 7c 24 68 00       	cmp    DWORD PTR [rsp+0x68],0x0
   140009331:	75 16                	jne    140009349 <__strtodg+0x1072>
   140009333:	0f 57 c0             	xorps  xmm0,xmm0
   140009336:	66 0f 2f f0          	comisd xmm6,xmm0
   14000933a:	76 0d                	jbe    140009349 <__strtodg+0x1072>
   14000933c:	b8 30 00 00 00       	mov    eax,0x30
   140009341:	ff c5                	inc    ebp
   140009343:	44 29 f0             	sub    eax,r14d
   140009346:	41 89 c6             	mov    r14d,eax
   140009349:	f2 0f 2a fd          	cvtsi2sd xmm7,ebp
   14000934d:	eb 41                	jmp    140009390 <__strtodg+0x10b9>
   14000934f:	f2 0f 10 3d 69 35 00 	movsd  xmm7,QWORD PTR [rip+0x3569]        # 14000c8c0 <fivesbits+0x60>
   140009356:	00 
   140009357:	31 ed                	xor    ebp,ebp
   140009359:	41 be 20 00 00 00    	mov    r14d,0x20
   14000935f:	31 db                	xor    ebx,ebx
   140009361:	0f 28 f7             	movaps xmm6,xmm7
   140009364:	45 31 c0             	xor    r8d,r8d
   140009367:	44 89 44 24 68       	mov    DWORD PTR [rsp+0x68],r8d
   14000936c:	eb 24                	jmp    140009392 <__strtodg+0x10bb>
   14000936e:	f2 0f 10 3d 4a 35 00 	movsd  xmm7,QWORD PTR [rip+0x354a]        # 14000c8c0 <fivesbits+0x60>
   140009375:	00 
   140009376:	c7 44 24 68 01 00 00 	mov    DWORD PTR [rsp+0x68],0x1
   14000937d:	00 
   14000937e:	31 ed                	xor    ebp,ebp
   140009380:	41 be 10 00 00 00    	mov    r14d,0x10
   140009386:	0f 28 f7             	movaps xmm6,xmm7
   140009389:	eb 07                	jmp    140009392 <__strtodg+0x10bb>
   14000938b:	0f 28 fe             	movaps xmm7,xmm6
   14000938e:	31 ed                	xor    ebp,ebp
   140009390:	31 db                	xor    ebx,ebx
   140009392:	8b 84 24 bc 00 00 00 	mov    eax,DWORD PTR [rsp+0xbc]
   140009399:	89 84 24 9c 00 00 00 	mov    DWORD PTR [rsp+0x9c],eax
   1400093a0:	8b 84 24 b8 00 00 00 	mov    eax,DWORD PTR [rsp+0xb8]
   1400093a7:	89 84 24 8c 00 00 00 	mov    DWORD PTR [rsp+0x8c],eax
   1400093ae:	f7 c6 01 00 00 00    	test   esi,0x1
   1400093b4:	75 33                	jne    1400093e9 <__strtodg+0x1112>
   1400093b6:	44 39 f8             	cmp    eax,r15d
   1400093b9:	7d 2e                	jge    1400093e9 <__strtodg+0x1112>
   1400093bb:	45 89 fc             	mov    r12d,r15d
   1400093be:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   1400093c5:	00 
   1400093c6:	41 29 c4             	sub    r12d,eax
   1400093c9:	44 89 e2             	mov    edx,r12d
   1400093cc:	e8 f4 e6 ff ff       	call   140007ac5 <__lshift_D2A>
   1400093d1:	44 29 a4 24 bc 00 00 	sub    DWORD PTR [rsp+0xbc],r12d
   1400093d8:	00 
   1400093d9:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   1400093e0:	00 
   1400093e1:	44 89 bc 24 b8 00 00 	mov    DWORD PTR [rsp+0xb8],r15d
   1400093e8:	00 
   1400093e9:	48 8d 94 24 ac 00 00 	lea    rdx,[rsp+0xac]
   1400093f0:	00 
   1400093f1:	4c 8d 84 24 b0 00 00 	lea    r8,[rsp+0xb0]
   1400093f8:	00 
   1400093f9:	0f 28 c7             	movaps xmm0,xmm7
   1400093fc:	e8 14 ea ff ff       	call   140007e15 <__d2b_D2A>
   140009401:	8b 94 24 ac 00 00 00 	mov    edx,DWORD PTR [rsp+0xac]
   140009408:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   14000940d:	85 d2                	test   edx,edx
   14000940f:	79 0c                	jns    14000941d <__strtodg+0x1146>
   140009411:	f7 da                	neg    edx
   140009413:	48 89 c1             	mov    rcx,rax
   140009416:	e8 a5 e0 ff ff       	call   1400074c0 <__rshift_D2A>
   14000941b:	eb 11                	jmp    14000942e <__strtodg+0x1157>
   14000941d:	74 0f                	je     14000942e <__strtodg+0x1157>
   14000941f:	48 8b 4c 24 78       	mov    rcx,QWORD PTR [rsp+0x78]
   140009424:	e8 9c e6 ff ff       	call   140007ac5 <__lshift_D2A>
   140009429:	48 89 44 24 78       	mov    QWORD PTR [rsp+0x78],rax
   14000942e:	4c 8b a4 24 c8 00 00 	mov    r12,QWORD PTR [rsp+0xc8]
   140009435:	00 
   140009436:	48 8b 54 24 78       	mov    rdx,QWORD PTR [rsp+0x78]
   14000943b:	4c 89 e1             	mov    rcx,r12
   14000943e:	83 7c 24 68 00       	cmp    DWORD PTR [rsp+0x68],0x0
   140009443:	74 7c                	je     1400094c1 <__strtodg+0x11ea>
   140009445:	e8 ca e7 ff ff       	call   140007c14 <__diff_D2A>
   14000944a:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140009451:	00 
   140009452:	48 89 c1             	mov    rcx,rax
   140009455:	85 f6                	test   esi,esi
   140009457:	0f 85 d1 00 00 00    	jne    14000952e <__strtodg+0x1257>
   14000945d:	41 8b 44 24 14       	mov    eax,DWORD PTR [r12+0x14]
   140009462:	ff c8                	dec    eax
   140009464:	39 41 14             	cmp    DWORD PTR [rcx+0x14],eax
   140009467:	7e 1f                	jle    140009488 <__strtodg+0x11b1>
   140009469:	48 98                	cdqe
   14000946b:	48 83 c0 04          	add    rax,0x4
   14000946f:	0f bd 54 81 08       	bsr    edx,DWORD PTR [rcx+rax*4+0x8]
   140009474:	83 f2 1f             	xor    edx,0x1f
   140009477:	41 0f bd 44 84 08    	bsr    eax,DWORD PTR [r12+rax*4+0x8]
   14000947d:	83 f0 1f             	xor    eax,0x1f
   140009480:	39 c2                	cmp    edx,eax
   140009482:	0f 8e a6 00 00 00    	jle    14000952e <__strtodg+0x1257>
   140009488:	39 7c 24 4c          	cmp    DWORD PTR [rsp+0x4c],edi
   14000948c:	75 10                	jne    14000949e <__strtodg+0x11c7>
   14000948e:	ff 8c 24 b8 00 00 00 	dec    DWORD PTR [rsp+0xb8]
   140009495:	8b 74 24 68          	mov    esi,DWORD PTR [rsp+0x68]
   140009499:	e9 90 00 00 00       	jmp    14000952e <__strtodg+0x1257>
   14000949e:	ba 01 00 00 00       	mov    edx,0x1
   1400094a3:	31 ed                	xor    ebp,ebp
   1400094a5:	31 db                	xor    ebx,ebx
   1400094a7:	e8 19 e6 ff ff       	call   140007ac5 <__lshift_D2A>
   1400094ac:	ff 8c 24 bc 00 00 00 	dec    DWORD PTR [rsp+0xbc]
   1400094b3:	ff 4c 24 4c          	dec    DWORD PTR [rsp+0x4c]
   1400094b7:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   1400094be:	00 
   1400094bf:	eb 6d                	jmp    14000952e <__strtodg+0x1257>
   1400094c1:	e8 da 03 00 00       	call   1400098a0 <__sum_D2A>
   1400094c6:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   1400094cd:	00 
   1400094ce:	48 89 c1             	mov    rcx,rax
   1400094d1:	8b 40 14             	mov    eax,DWORD PTR [rax+0x14]
   1400094d4:	ff c8                	dec    eax
   1400094d6:	41 39 44 24 14       	cmp    DWORD PTR [r12+0x14],eax
   1400094db:	7e 1b                	jle    1400094f8 <__strtodg+0x1221>
   1400094dd:	48 98                	cdqe
   1400094df:	48 83 c0 04          	add    rax,0x4
   1400094e3:	0f bd 54 81 08       	bsr    edx,DWORD PTR [rcx+rax*4+0x8]
   1400094e8:	83 f2 1f             	xor    edx,0x1f
   1400094eb:	41 0f bd 44 84 08    	bsr    eax,DWORD PTR [r12+rax*4+0x8]
   1400094f1:	83 f0 1f             	xor    eax,0x1f
   1400094f4:	39 d0                	cmp    eax,edx
   1400094f6:	7e 36                	jle    14000952e <__strtodg+0x1257>
   1400094f8:	85 f6                	test   esi,esi
   1400094fa:	74 1b                	je     140009517 <__strtodg+0x1240>
   1400094fc:	8b 84 24 b8 00 00 00 	mov    eax,DWORD PTR [rsp+0xb8]
   140009503:	31 f6                	xor    esi,esi
   140009505:	ff c0                	inc    eax
   140009507:	44 39 f8             	cmp    eax,r15d
   14000950a:	89 84 24 b8 00 00 00 	mov    DWORD PTR [rsp+0xb8],eax
   140009511:	40 0f 95 c6          	setne  sil
   140009515:	eb 17                	jmp    14000952e <__strtodg+0x1257>
   140009517:	ba 01 00 00 00       	mov    edx,0x1
   14000951c:	31 ed                	xor    ebp,ebp
   14000951e:	e8 9d df ff ff       	call   1400074c0 <__rshift_D2A>
   140009523:	ff 84 24 bc 00 00 00 	inc    DWORD PTR [rsp+0xbc]
   14000952a:	ff 44 24 4c          	inc    DWORD PTR [rsp+0x4c]
   14000952e:	48 8b 4c 24 78       	mov    rcx,QWORD PTR [rsp+0x78]
   140009533:	e8 61 e2 ff ff       	call   140007799 <__Bfree_D2A>
   140009538:	4c 89 e1             	mov    rcx,r12
   14000953b:	e8 59 e2 ff ff       	call   140007799 <__Bfree_D2A>
   140009540:	85 db                	test   ebx,ebx
   140009542:	0f 85 ad 00 00 00    	jne    1400095f5 <__strtodg+0x131e>
   140009548:	8b 94 24 b8 00 00 00 	mov    edx,DWORD PTR [rsp+0xb8]
   14000954f:	8b 84 24 9c 00 00 00 	mov    eax,DWORD PTR [rsp+0x9c]
   140009556:	03 94 24 bc 00 00 00 	add    edx,DWORD PTR [rsp+0xbc]
   14000955d:	03 84 24 8c 00 00 00 	add    eax,DWORD PTR [rsp+0x8c]
   140009564:	39 c2                	cmp    edx,eax
   140009566:	75 4f                	jne    1400095b7 <__strtodg+0x12e0>
   140009568:	85 ed                	test   ebp,ebp
   14000956a:	74 4b                	je     1400095b7 <__strtodg+0x12e0>
   14000956c:	f2 0f 59 3d 6c 33 00 	mulsd  xmm7,QWORD PTR [rip+0x336c]        # 14000c8e0 <fivesbits+0x80>
   140009573:	00 
   140009574:	0f 28 c6             	movaps xmm0,xmm6
   140009577:	f2 0f 5c 05 51 33 00 	subsd  xmm0,QWORD PTR [rip+0x3351]        # 14000c8d0 <fivesbits+0x70>
   14000957e:	00 
   14000957f:	0f 28 cf             	movaps xmm1,xmm7
   140009582:	0f 57 0d 67 33 00 00 	xorps  xmm1,XMMWORD PTR [rip+0x3367]        # 14000c8f0 <fivesbits+0x90>
   140009589:	66 0f 2f c8          	comisd xmm1,xmm0
   14000958d:	76 06                	jbe    140009595 <__strtodg+0x12be>
   14000958f:	66 0f 2f f7          	comisd xmm6,xmm7
   140009593:	eb 16                	jmp    1400095ab <__strtodg+0x12d4>
   140009595:	66 0f 2f c7          	comisd xmm0,xmm7
   140009599:	76 1c                	jbe    1400095b7 <__strtodg+0x12e0>
   14000959b:	f2 0f 10 05 1d 33 00 	movsd  xmm0,QWORD PTR [rip+0x331d]        # 14000c8c0 <fivesbits+0x60>
   1400095a2:	00 
   1400095a3:	f2 0f 5c c7          	subsd  xmm0,xmm7
   1400095a7:	66 0f 2f c6          	comisd xmm0,xmm6
   1400095ab:	76 0a                	jbe    1400095b7 <__strtodg+0x12e0>
   1400095ad:	44 09 b4 24 b4 00 00 	or     DWORD PTR [rsp+0xb4],r14d
   1400095b4:	00 
   1400095b5:	eb 3e                	jmp    1400095f5 <__strtodg+0x131e>
   1400095b7:	85 f6                	test   esi,esi
   1400095b9:	75 0f                	jne    1400095ca <__strtodg+0x12f3>
   1400095bb:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   1400095c2:	00 
   1400095c3:	e8 e4 df ff ff       	call   1400075ac <__trailz_D2A>
   1400095c8:	89 c3                	mov    ebx,eax
   1400095ca:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   1400095cf:	e8 c5 e1 ff ff       	call   140007799 <__Bfree_D2A>
   1400095d4:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   1400095d9:	e8 bb e1 ff ff       	call   140007799 <__Bfree_D2A>
   1400095de:	48 8b 4c 24 60       	mov    rcx,QWORD PTR [rsp+0x60]
   1400095e3:	e8 b1 e1 ff ff       	call   140007799 <__Bfree_D2A>
   1400095e8:	4c 89 e9             	mov    rcx,r13
   1400095eb:	e8 a9 e1 ff ff       	call   140007799 <__Bfree_D2A>
   1400095f0:	e9 58 f7 ff ff       	jmp    140008d4d <__strtodg+0xa76>
   1400095f5:	85 f6                	test   esi,esi
   1400095f7:	75 3a                	jne    140009633 <__strtodg+0x135c>
   1400095f9:	8b 94 24 b8 00 00 00 	mov    edx,DWORD PTR [rsp+0xb8]
   140009600:	44 89 fb             	mov    ebx,r15d
   140009603:	29 d3                	sub    ebx,edx
   140009605:	85 db                	test   ebx,ebx
   140009607:	74 2a                	je     140009633 <__strtodg+0x135c>
   140009609:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140009610:	00 
   140009611:	7e 11                	jle    140009624 <__strtodg+0x134d>
   140009613:	89 da                	mov    edx,ebx
   140009615:	e8 ab e4 ff ff       	call   140007ac5 <__lshift_D2A>
   14000961a:	48 89 84 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rax
   140009621:	00 
   140009622:	eb 08                	jmp    14000962c <__strtodg+0x1355>
   140009624:	44 29 fa             	sub    edx,r15d
   140009627:	e8 94 de ff ff       	call   1400074c0 <__rshift_D2A>
   14000962c:	29 9c 24 bc 00 00 00 	sub    DWORD PTR [rsp+0xbc],ebx
   140009633:	8b 84 24 bc 00 00 00 	mov    eax,DWORD PTR [rsp+0xbc]
   14000963a:	48 8b bc 24 58 01 00 	mov    rdi,QWORD PTR [rsp+0x158]
   140009641:	00 
   140009642:	48 8b 4c 24 58       	mov    rcx,QWORD PTR [rsp+0x58]
   140009647:	89 07                	mov    DWORD PTR [rdi],eax
   140009649:	e8 4b e1 ff ff       	call   140007799 <__Bfree_D2A>
   14000964e:	48 8b 4c 24 70       	mov    rcx,QWORD PTR [rsp+0x70]
   140009653:	e8 41 e1 ff ff       	call   140007799 <__Bfree_D2A>
   140009658:	48 8b 4c 24 60       	mov    rcx,QWORD PTR [rsp+0x60]
   14000965d:	e8 37 e1 ff ff       	call   140007799 <__Bfree_D2A>
   140009662:	48 8b 8c 24 80 00 00 	mov    rcx,QWORD PTR [rsp+0x80]
   140009669:	00 
   14000966a:	e8 2a e1 ff ff       	call   140007799 <__Bfree_D2A>
   14000966f:	4c 89 e9             	mov    rcx,r13
   140009672:	e8 22 e1 ff ff       	call   140007799 <__Bfree_D2A>
   140009677:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   14000967e:	00 
   14000967f:	8b bc 24 bc 00 00 00 	mov    edi,DWORD PTR [rsp+0xbc]
   140009686:	39 78 08             	cmp    DWORD PTR [rax+0x8],edi
   140009689:	0f 8d 01 01 00 00    	jge    140009790 <__strtodg+0x14b9>
   14000968f:	eb 02                	jmp    140009693 <__strtodg+0x13bc>
   140009691:	31 f6                	xor    esi,esi
   140009693:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   14000969a:	00 
   14000969b:	e8 f9 e0 ff ff       	call   140007799 <__Bfree_D2A>
   1400096a0:	31 c9                	xor    ecx,ecx
   1400096a2:	48 89 8c 24 c8 00 00 	mov    QWORD PTR [rsp+0xc8],rcx
   1400096a9:	00 
   1400096aa:	e8 b9 14 00 00       	call   14000ab68 <_errno>
   1400096af:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
   1400096b5:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   1400096bc:	00 
   1400096bd:	8b 40 0c             	mov    eax,DWORD PTR [rax+0xc]
   1400096c0:	89 44 24 48          	mov    DWORD PTR [rsp+0x48],eax
   1400096c4:	83 e0 03             	and    eax,0x3
   1400096c7:	83 f8 02             	cmp    eax,0x2
   1400096ca:	74 09                	je     1400096d5 <__strtodg+0x13fe>
   1400096cc:	83 f8 03             	cmp    eax,0x3
   1400096cf:	74 0d                	je     1400096de <__strtodg+0x1407>
   1400096d1:	ff c8                	dec    eax
   1400096d3:	eb 05                	jmp    1400096da <__strtodg+0x1403>
   1400096d5:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   1400096da:	75 57                	jne    140009733 <__strtodg+0x145c>
   1400096dc:	eb 07                	jmp    1400096e5 <__strtodg+0x140e>
   1400096de:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   1400096e3:	74 4e                	je     140009733 <__strtodg+0x145c>
   1400096e5:	44 89 f8             	mov    eax,r15d
   1400096e8:	45 89 f8             	mov    r8d,r15d
   1400096eb:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   1400096f2:	00 
   1400096f3:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0xa3
   1400096fa:	a3 00 00 00 
   1400096fe:	83 e0 1f             	and    eax,0x1f
   140009701:	41 c1 f8 05          	sar    r8d,0x5
   140009705:	83 f8 01             	cmp    eax,0x1
   140009708:	41 83 d8 ff          	sbb    r8d,0xffffffff
   14000970c:	31 d2                	xor    edx,edx
   14000970e:	4d 63 c0             	movsxd r8,r8d
   140009711:	49 c1 e0 02          	shl    r8,0x2
   140009715:	e8 e6 14 00 00       	call   14000ac00 <memset>
   14000971a:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   140009721:	00 
   140009722:	48 8b bc 24 58 01 00 	mov    rdi,QWORD PTR [rsp+0x158]
   140009729:	00 
   14000972a:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   14000972d:	ff c0                	inc    eax
   14000972f:	89 07                	mov    DWORD PTR [rdi],eax
   140009731:	eb 5d                	jmp    140009790 <__strtodg+0x14b9>
   140009733:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   14000973a:	00 
   14000973b:	48 8b bc 24 58 01 00 	mov    rdi,QWORD PTR [rsp+0x158]
   140009742:	00 
   140009743:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x11
   14000974a:	11 00 00 00 
   14000974e:	8b 40 08             	mov    eax,DWORD PTR [rax+0x8]
   140009751:	89 07                	mov    DWORD PTR [rdi],eax
   140009753:	48 8b 84 24 50 01 00 	mov    rax,QWORD PTR [rsp+0x150]
   14000975a:	00 
   14000975b:	48 8b bc 24 60 01 00 	mov    rdi,QWORD PTR [rsp+0x160]
   140009762:	00 
   140009763:	8b 08                	mov    ecx,DWORD PTR [rax]
   140009765:	8d 41 1f             	lea    eax,[rcx+0x1f]
   140009768:	c1 f8 05             	sar    eax,0x5
   14000976b:	48 98                	cdqe
   14000976d:	48 8d 14 87          	lea    rdx,[rdi+rax*4]
   140009771:	48 89 f8             	mov    rax,rdi
   140009774:	48 39 d0             	cmp    rax,rdx
   140009777:	73 0d                	jae    140009786 <__strtodg+0x14af>
   140009779:	48 83 c0 04          	add    rax,0x4
   14000977d:	c7 40 fc ff ff ff ff 	mov    DWORD PTR [rax-0x4],0xffffffff
   140009784:	eb ee                	jmp    140009774 <__strtodg+0x149d>
   140009786:	83 e1 1f             	and    ecx,0x1f
   140009789:	74 05                	je     140009790 <__strtodg+0x14b9>
   14000978b:	f7 d9                	neg    ecx
   14000978d:	d3 6a fc             	shr    DWORD PTR [rdx-0x4],cl
   140009790:	85 f6                	test   esi,esi
   140009792:	74 5f                	je     1400097f3 <__strtodg+0x151c>
   140009794:	48 8b 84 24 c8 00 00 	mov    rax,QWORD PTR [rsp+0xc8]
   14000979b:	00 
   14000979c:	83 bc 24 90 00 00 00 	cmp    DWORD PTR [rsp+0x90],0x0
   1400097a3:	00 
   1400097a4:	74 12                	je     1400097b8 <__strtodg+0x14e1>
   1400097a6:	c7 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],0x50
   1400097ad:	50 00 00 00 
   1400097b1:	31 d2                	xor    edx,edx
   1400097b3:	89 50 14             	mov    DWORD PTR [rax+0x14],edx
   1400097b6:	eb 30                	jmp    1400097e8 <__strtodg+0x1511>
   1400097b8:	83 78 14 00          	cmp    DWORD PTR [rax+0x14],0x0
   1400097bc:	8b 94 24 b4 00 00 00 	mov    edx,DWORD PTR [rsp+0xb4]
   1400097c3:	0f 9f c0             	setg   al
   1400097c6:	0f b6 c0             	movzx  eax,al
   1400097c9:	83 e2 f8             	and    edx,0xfffffff8
   1400097cc:	01 c0                	add    eax,eax
   1400097ce:	09 d0                	or     eax,edx
   1400097d0:	80 e2 30             	and    dl,0x30
   1400097d3:	75 09                	jne    1400097de <__strtodg+0x1507>
   1400097d5:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   1400097dc:	eb 15                	jmp    1400097f3 <__strtodg+0x151c>
   1400097de:	83 c8 40             	or     eax,0x40
   1400097e1:	89 84 24 b4 00 00 00 	mov    DWORD PTR [rsp+0xb4],eax
   1400097e8:	e8 7b 13 00 00       	call   14000ab68 <_errno>
   1400097ed:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
   1400097f3:	48 83 bc 24 48 01 00 	cmp    QWORD PTR [rsp+0x148],0x0
   1400097fa:	00 00 
   1400097fc:	74 13                	je     140009811 <__strtodg+0x153a>
   1400097fe:	48 8b 84 24 c0 00 00 	mov    rax,QWORD PTR [rsp+0xc0]
   140009805:	00 
   140009806:	48 8b b4 24 48 01 00 	mov    rsi,QWORD PTR [rsp+0x148]
   14000980d:	00 
   14000980e:	48 89 06             	mov    QWORD PTR [rsi],rax
   140009811:	83 7c 24 50 00       	cmp    DWORD PTR [rsp+0x50],0x0
   140009816:	74 08                	je     140009820 <__strtodg+0x1549>
   140009818:	83 8c 24 b4 00 00 00 	or     DWORD PTR [rsp+0xb4],0x8
   14000981f:	08 
   140009820:	4c 8b 84 24 c8 00 00 	mov    r8,QWORD PTR [rsp+0xc8]
   140009827:	00 
   140009828:	4d 85 c0             	test   r8,r8
   14000982b:	74 3a                	je     140009867 <__strtodg+0x1590>
   14000982d:	48 8b 8c 24 60 01 00 	mov    rcx,QWORD PTR [rsp+0x160]
   140009834:	00 
   140009835:	44 89 fa             	mov    edx,r15d
   140009838:	e8 4e 0c 00 00       	call   14000a48b <__copybits_D2A>
   14000983d:	48 8b 8c 24 c8 00 00 	mov    rcx,QWORD PTR [rsp+0xc8]
   140009844:	00 
   140009845:	e8 4f df ff ff       	call   140007799 <__Bfree_D2A>
   14000984a:	eb 1b                	jmp    140009867 <__strtodg+0x1590>
   14000984c:	31 c0                	xor    eax,eax
   14000984e:	48 89 bc 24 c0 00 00 	mov    QWORD PTR [rsp+0xc0],rdi
   140009855:	00 
   140009856:	89 44 24 50          	mov    DWORD PTR [rsp+0x50],eax
   14000985a:	48 83 bc 24 48 01 00 	cmp    QWORD PTR [rsp+0x148],0x0
   140009861:	00 00 
   140009863:	75 99                	jne    1400097fe <__strtodg+0x1527>
   140009865:	eb b9                	jmp    140009820 <__strtodg+0x1549>
   140009867:	8b 84 24 b4 00 00 00 	mov    eax,DWORD PTR [rsp+0xb4]
   14000986e:	0f 28 b4 24 d0 00 00 	movaps xmm6,XMMWORD PTR [rsp+0xd0]
   140009875:	00 
   140009876:	0f 28 bc 24 e0 00 00 	movaps xmm7,XMMWORD PTR [rsp+0xe0]
   14000987d:	00 
   14000987e:	48 81 c4 f8 00 00 00 	add    rsp,0xf8
   140009885:	5b                   	pop    rbx
   140009886:	5e                   	pop    rsi
   140009887:	5f                   	pop    rdi
   140009888:	5d                   	pop    rbp
   140009889:	41 5c                	pop    r12
   14000988b:	41 5d                	pop    r13
   14000988d:	41 5e                	pop    r14
   14000988f:	41 5f                	pop    r15
   140009891:	c3                   	ret
   140009892:	90                   	nop
   140009893:	90                   	nop
   140009894:	90                   	nop
   140009895:	90                   	nop
   140009896:	90                   	nop
   140009897:	90                   	nop
   140009898:	90                   	nop
   140009899:	90                   	nop
   14000989a:	90                   	nop
   14000989b:	90                   	nop
   14000989c:	90                   	nop
   14000989d:	90                   	nop
   14000989e:	90                   	nop
   14000989f:	90                   	nop

00000001400098a0 <__sum_D2A>:
   1400098a0:	41 57                	push   r15
   1400098a2:	41 56                	push   r14
   1400098a4:	41 55                	push   r13
   1400098a6:	41 54                	push   r12
   1400098a8:	55                   	push   rbp
   1400098a9:	57                   	push   rdi
   1400098aa:	56                   	push   rsi
   1400098ab:	53                   	push   rbx
   1400098ac:	48 83 ec 28          	sub    rsp,0x28
   1400098b0:	8b 42 14             	mov    eax,DWORD PTR [rdx+0x14]
   1400098b3:	39 41 14             	cmp    DWORD PTR [rcx+0x14],eax
   1400098b6:	48 89 cf             	mov    rdi,rcx
   1400098b9:	48 89 d6             	mov    rsi,rdx
   1400098bc:	48 0f 4c fa          	cmovl  rdi,rdx
   1400098c0:	48 0f 4c f1          	cmovl  rsi,rcx
   1400098c4:	45 31 e4             	xor    r12d,r12d
   1400098c7:	45 31 ed             	xor    r13d,r13d
   1400098ca:	8b 4f 08             	mov    ecx,DWORD PTR [rdi+0x8]
   1400098cd:	e8 11 de ff ff       	call   1400076e3 <__Balloc_D2A>
   1400098d2:	44 8b 57 14          	mov    r10d,DWORD PTR [rdi+0x14]
   1400098d6:	4c 8d 5f 18          	lea    r11,[rdi+0x18]
   1400098da:	4c 8d 40 18          	lea    r8,[rax+0x18]
   1400098de:	48 89 c3             	mov    rbx,rax
   1400098e1:	44 89 50 14          	mov    DWORD PTR [rax+0x14],r10d
   1400098e5:	48 63 46 14          	movsxd rax,DWORD PTR [rsi+0x14]
   1400098e9:	4c 89 c1             	mov    rcx,r8
   1400098ec:	48 89 c5             	mov    rbp,rax
   1400098ef:	4d 8d 0c 80          	lea    r9,[r8+rax*4]
   1400098f3:	42 8b 44 27 18       	mov    eax,DWORD PTR [rdi+r12*1+0x18]
   1400098f8:	46 8b 74 26 18       	mov    r14d,DWORD PTR [rsi+r12*1+0x18]
   1400098fd:	48 83 c1 04          	add    rcx,0x4
   140009901:	49 83 c4 04          	add    r12,0x4
   140009905:	0f b7 d0             	movzx  edx,ax
   140009908:	45 0f b7 fe          	movzx  r15d,r14w
   14000990c:	c1 e8 10             	shr    eax,0x10
   14000990f:	44 01 fa             	add    edx,r15d
   140009912:	41 c1 ee 10          	shr    r14d,0x10
   140009916:	44 01 ea             	add    edx,r13d
   140009919:	44 01 f0             	add    eax,r14d
   14000991c:	41 89 d5             	mov    r13d,edx
   14000991f:	66 89 51 fc          	mov    WORD PTR [rcx-0x4],dx
   140009923:	41 c1 ed 10          	shr    r13d,0x10
   140009927:	44 01 e8             	add    eax,r13d
   14000992a:	41 89 c5             	mov    r13d,eax
   14000992d:	66 89 41 fe          	mov    WORD PTR [rcx-0x2],ax
   140009931:	41 c1 ed 10          	shr    r13d,0x10
   140009935:	4c 39 c9             	cmp    rcx,r9
   140009938:	72 b9                	jb     1400098f3 <__sum_D2A+0x53>
   14000993a:	4c 89 c8             	mov    rax,r9
   14000993d:	48 8d 53 19          	lea    rdx,[rbx+0x19]
   140009941:	48 29 d8             	sub    rax,rbx
   140009944:	48 83 e8 19          	sub    rax,0x19
   140009948:	48 83 e0 fc          	and    rax,0xfffffffffffffffc
   14000994c:	49 39 d1             	cmp    r9,rdx
   14000994f:	ba 00 00 00 00       	mov    edx,0x0
   140009954:	48 0f 42 c2          	cmovb  rax,rdx
   140009958:	44 89 d2             	mov    edx,r10d
   14000995b:	4d 29 c3             	sub    r11,r8
   14000995e:	29 ea                	sub    edx,ebp
   140009960:	48 63 d2             	movsxd rdx,edx
   140009963:	49 8d 44 00 04       	lea    rax,[r8+rax*1+0x4]
   140009968:	4d 8d 0c 91          	lea    r9,[r9+rdx*4]
   14000996c:	4c 39 c8             	cmp    rax,r9
   14000996f:	73 2c                	jae    14000999d <__sum_D2A+0xfd>
   140009971:	46 8b 04 18          	mov    r8d,DWORD PTR [rax+r11*1]
   140009975:	48 83 c0 04          	add    rax,0x4
   140009979:	41 0f b7 d0          	movzx  edx,r8w
   14000997d:	41 c1 e8 10          	shr    r8d,0x10
   140009981:	44 01 ea             	add    edx,r13d
   140009984:	89 d1                	mov    ecx,edx
   140009986:	66 89 50 fc          	mov    WORD PTR [rax-0x4],dx
   14000998a:	c1 e9 10             	shr    ecx,0x10
   14000998d:	44 01 c1             	add    ecx,r8d
   140009990:	41 89 cd             	mov    r13d,ecx
   140009993:	66 89 48 fe          	mov    WORD PTR [rax-0x2],cx
   140009997:	41 c1 ed 10          	shr    r13d,0x10
   14000999b:	eb cf                	jmp    14000996c <__sum_D2A+0xcc>
   14000999d:	45 85 ed             	test   r13d,r13d
   1400099a0:	74 4a                	je     1400099ec <__sum_D2A+0x14c>
   1400099a2:	44 3b 53 0c          	cmp    r10d,DWORD PTR [rbx+0xc]
   1400099a6:	75 32                	jne    1400099da <__sum_D2A+0x13a>
   1400099a8:	8b 43 08             	mov    eax,DWORD PTR [rbx+0x8]
   1400099ab:	8d 48 01             	lea    ecx,[rax+0x1]
   1400099ae:	e8 30 dd ff ff       	call   1400076e3 <__Balloc_D2A>
   1400099b3:	48 8d 53 10          	lea    rdx,[rbx+0x10]
   1400099b7:	48 89 c6             	mov    rsi,rax
   1400099ba:	48 63 43 14          	movsxd rax,DWORD PTR [rbx+0x14]
   1400099be:	48 8d 4e 10          	lea    rcx,[rsi+0x10]
   1400099c2:	4c 8d 04 85 08 00 00 	lea    r8,[rax*4+0x8]
   1400099c9:	00 
   1400099ca:	e8 29 12 00 00       	call   14000abf8 <memcpy>
   1400099cf:	48 89 d9             	mov    rcx,rbx
   1400099d2:	48 89 f3             	mov    rbx,rsi
   1400099d5:	e8 bf dd ff ff       	call   140007799 <__Bfree_D2A>
   1400099da:	48 63 43 14          	movsxd rax,DWORD PTR [rbx+0x14]
   1400099de:	8d 50 01             	lea    edx,[rax+0x1]
   1400099e1:	89 53 14             	mov    DWORD PTR [rbx+0x14],edx
   1400099e4:	c7 44 83 18 01 00 00 	mov    DWORD PTR [rbx+rax*4+0x18],0x1
   1400099eb:	00 
   1400099ec:	48 89 d8             	mov    rax,rbx
   1400099ef:	48 83 c4 28          	add    rsp,0x28
   1400099f3:	5b                   	pop    rbx
   1400099f4:	5e                   	pop    rsi
   1400099f5:	5f                   	pop    rdi
   1400099f6:	5d                   	pop    rbp
   1400099f7:	41 5c                	pop    r12
   1400099f9:	41 5d                	pop    r13
   1400099fb:	41 5e                	pop    r14
   1400099fd:	41 5f                	pop    r15
   1400099ff:	c3                   	ret

0000000140009a00 <__gethex_D2A>:
   140009a00:	41 57                	push   r15
   140009a02:	41 56                	push   r14
   140009a04:	41 55                	push   r13
   140009a06:	41 54                	push   r12
   140009a08:	55                   	push   rbp
   140009a09:	57                   	push   rdi
   140009a0a:	56                   	push   rsi
   140009a0b:	53                   	push   rbx
   140009a0c:	48 83 ec 38          	sub    rsp,0x38
   140009a10:	44 8b ac 24 a0 00 00 	mov    r13d,DWORD PTR [rsp+0xa0]
   140009a17:	00 
   140009a18:	4c 89 84 24 90 00 00 	mov    QWORD PTR [rsp+0x90],r8
   140009a1f:	00 
   140009a20:	48 89 ce             	mov    rsi,rcx
   140009a23:	49 89 d4             	mov    r12,rdx
   140009a26:	4c 89 8c 24 98 00 00 	mov    QWORD PTR [rsp+0x98],r9
   140009a2d:	00 
   140009a2e:	e8 b5 11 00 00       	call   14000abe8 <localeconv>
   140009a33:	31 d2                	xor    edx,edx
   140009a35:	45 31 c9             	xor    r9d,r9d
   140009a38:	4c 8b 00             	mov    r8,QWORD PTR [rax]
   140009a3b:	48 8b 84 24 98 00 00 	mov    rax,QWORD PTR [rsp+0x98]
   140009a42:	00 
   140009a43:	48 89 10             	mov    QWORD PTR [rax],rdx
   140009a46:	48 8b 06             	mov    rax,QWORD PTR [rsi]
   140009a49:	48 8d 58 02          	lea    rbx,[rax+0x2]
   140009a4d:	8a 0b                	mov    cl,BYTE PTR [rbx]
   140009a4f:	80 f9 30             	cmp    cl,0x30
   140009a52:	75 08                	jne    140009a5c <__gethex_D2A+0x5c>
   140009a54:	41 ff c1             	inc    r9d
   140009a57:	48 ff c3             	inc    rbx
   140009a5a:	eb f1                	jmp    140009a4d <__gethex_D2A+0x4d>
   140009a5c:	4c 8b 1d 3d 2f 00 00 	mov    r11,QWORD PTR [rip+0x2f3d]        # 14000c9a0 <.refptr.__hexdig_D2A>
   140009a63:	0f b6 c1             	movzx  eax,cl
   140009a66:	48 89 da             	mov    rdx,rbx
   140009a69:	41 80 3c 03 00       	cmp    BYTE PTR [r11+rax*1],0x0
   140009a6e:	74 0a                	je     140009a7a <__gethex_D2A+0x7a>
   140009a70:	41 ff c1             	inc    r9d
   140009a73:	45 31 f6             	xor    r14d,r14d
   140009a76:	31 c0                	xor    eax,eax
   140009a78:	eb 52                	jmp    140009acc <__gethex_D2A+0xcc>
   140009a7a:	31 c0                	xor    eax,eax
   140009a7c:	41 8a 3c 00          	mov    dil,BYTE PTR [r8+rax*1]
   140009a80:	44 8a 14 03          	mov    r10b,BYTE PTR [rbx+rax*1]
   140009a84:	40 84 ff             	test   dil,dil
   140009a87:	74 0d                	je     140009a96 <__gethex_D2A+0x96>
   140009a89:	48 ff c0             	inc    rax
   140009a8c:	44 38 d7             	cmp    dil,r10b
   140009a8f:	74 eb                	je     140009a7c <__gethex_D2A+0x7c>
   140009a91:	e9 a0 00 00 00       	jmp    140009b36 <__gethex_D2A+0x136>
   140009a96:	48 01 c3             	add    rbx,rax
   140009a99:	41 0f b6 c2          	movzx  eax,r10b
   140009a9d:	41 80 3c 03 00       	cmp    BYTE PTR [r11+rax*1],0x0
   140009aa2:	0f 84 8b 00 00 00    	je     140009b33 <__gethex_D2A+0x133>
   140009aa8:	48 89 da             	mov    rdx,rbx
   140009aab:	0f b6 02             	movzx  eax,BYTE PTR [rdx]
   140009aae:	3c 30                	cmp    al,0x30
   140009ab0:	75 05                	jne    140009ab7 <__gethex_D2A+0xb7>
   140009ab2:	48 ff c2             	inc    rdx
   140009ab5:	eb f4                	jmp    140009aab <__gethex_D2A+0xab>
   140009ab7:	45 31 f6             	xor    r14d,r14d
   140009aba:	41 80 3c 03 00       	cmp    BYTE PTR [r11+rax*1],0x0
   140009abf:	41 b9 01 00 00 00    	mov    r9d,0x1
   140009ac5:	48 89 d8             	mov    rax,rbx
   140009ac8:	41 0f 94 c6          	sete   r14b
   140009acc:	48 89 d3             	mov    rbx,rdx
   140009acf:	44 0f b6 13          	movzx  r10d,BYTE PTR [rbx]
   140009ad3:	4c 89 d1             	mov    rcx,r10
   140009ad6:	43 80 3c 13 00       	cmp    BYTE PTR [r11+r10*1],0x0
   140009adb:	74 05                	je     140009ae2 <__gethex_D2A+0xe2>
   140009add:	48 ff c3             	inc    rbx
   140009ae0:	eb ed                	jmp    140009acf <__gethex_D2A+0xcf>
   140009ae2:	45 3a 10             	cmp    r10b,BYTE PTR [r8]
   140009ae5:	75 3a                	jne    140009b21 <__gethex_D2A+0x121>
   140009ae7:	48 85 c0             	test   rax,rax
   140009aea:	75 3c                	jne    140009b28 <__gethex_D2A+0x128>
   140009aec:	b8 01 00 00 00       	mov    eax,0x1
   140009af1:	45 8a 14 00          	mov    r10b,BYTE PTR [r8+rax*1]
   140009af5:	45 84 d2             	test   r10b,r10b
   140009af8:	74 0e                	je     140009b08 <__gethex_D2A+0x108>
   140009afa:	48 ff c0             	inc    rax
   140009afd:	44 3a 54 03 ff       	cmp    r10b,BYTE PTR [rbx+rax*1-0x1]
   140009b02:	74 ed                	je     140009af1 <__gethex_D2A+0xf1>
   140009b04:	31 ed                	xor    ebp,ebp
   140009b06:	eb 36                	jmp    140009b3e <__gethex_D2A+0x13e>
   140009b08:	48 01 d8             	add    rax,rbx
   140009b0b:	48 89 c3             	mov    rbx,rax
   140009b0e:	44 0f b6 13          	movzx  r10d,BYTE PTR [rbx]
   140009b12:	4c 89 d1             	mov    rcx,r10
   140009b15:	43 80 3c 13 00       	cmp    BYTE PTR [r11+r10*1],0x0
   140009b1a:	74 05                	je     140009b21 <__gethex_D2A+0x121>
   140009b1c:	48 ff c3             	inc    rbx
   140009b1f:	eb ed                	jmp    140009b0e <__gethex_D2A+0x10e>
   140009b21:	31 ed                	xor    ebp,ebp
   140009b23:	48 85 c0             	test   rax,rax
   140009b26:	74 16                	je     140009b3e <__gethex_D2A+0x13e>
   140009b28:	29 d8                	sub    eax,ebx
   140009b2a:	8d 2c 85 00 00 00 00 	lea    ebp,[rax*4+0x0]
   140009b31:	eb 0b                	jmp    140009b3e <__gethex_D2A+0x13e>
   140009b33:	44 89 d1             	mov    ecx,r10d
   140009b36:	31 ed                	xor    ebp,ebp
   140009b38:	41 be 01 00 00 00    	mov    r14d,0x1
   140009b3e:	83 e1 df             	and    ecx,0xffffffdf
   140009b41:	80 f9 50             	cmp    cl,0x50
   140009b44:	75 7b                	jne    140009bc1 <__gethex_D2A+0x1c1>
   140009b46:	8a 43 01             	mov    al,BYTE PTR [rbx+0x1]
   140009b49:	3c 2b                	cmp    al,0x2b
   140009b4b:	74 0d                	je     140009b5a <__gethex_D2A+0x15a>
   140009b4d:	3c 2d                	cmp    al,0x2d
   140009b4f:	74 0e                	je     140009b5f <__gethex_D2A+0x15f>
   140009b51:	48 8d 4b 01          	lea    rcx,[rbx+0x1]
   140009b55:	45 31 d2             	xor    r10d,r10d
   140009b58:	eb 0f                	jmp    140009b69 <__gethex_D2A+0x169>
   140009b5a:	45 31 d2             	xor    r10d,r10d
   140009b5d:	eb 06                	jmp    140009b65 <__gethex_D2A+0x165>
   140009b5f:	41 ba 01 00 00 00    	mov    r10d,0x1
   140009b65:	48 8d 4b 02          	lea    rcx,[rbx+0x2]
   140009b69:	0f b6 01             	movzx  eax,BYTE PTR [rcx]
   140009b6c:	41 0f b6 04 03       	movzx  eax,BYTE PTR [r11+rax*1]
   140009b71:	44 8d 58 ff          	lea    r11d,[rax-0x1]
   140009b75:	41 80 fb 18          	cmp    r11b,0x18
   140009b79:	77 4e                	ja     140009bc9 <__gethex_D2A+0x1c9>
   140009b7b:	83 e8 10             	sub    eax,0x10
   140009b7e:	45 31 db             	xor    r11d,r11d
   140009b81:	4c 8b 3d 18 2e 00 00 	mov    r15,QWORD PTR [rip+0x2e18]        # 14000c9a0 <.refptr.__hexdig_D2A>
   140009b88:	0f b6 79 01          	movzx  edi,BYTE PTR [rcx+0x1]
   140009b8c:	48 ff c1             	inc    rcx
   140009b8f:	41 0f b6 3c 3f       	movzx  edi,BYTE PTR [r15+rdi*1]
   140009b94:	44 8d 7f ff          	lea    r15d,[rdi-0x1]
   140009b98:	41 80 ff 18          	cmp    r15b,0x18
   140009b9c:	77 18                	ja     140009bb6 <__gethex_D2A+0x1b6>
   140009b9e:	45 31 ff             	xor    r15d,r15d
   140009ba1:	3d ff ff ff 07       	cmp    eax,0x7ffffff
   140009ba6:	41 0f 97 c7          	seta   r15b
   140009baa:	6b c0 0a             	imul   eax,eax,0xa
   140009bad:	45 09 fb             	or     r11d,r15d
   140009bb0:	8d 44 38 f0          	lea    eax,[rax+rdi*1-0x10]
   140009bb4:	eb cb                	jmp    140009b81 <__gethex_D2A+0x181>
   140009bb6:	45 85 d2             	test   r10d,r10d
   140009bb9:	74 02                	je     140009bbd <__gethex_D2A+0x1bd>
   140009bbb:	f7 d8                	neg    eax
   140009bbd:	01 c5                	add    ebp,eax
   140009bbf:	eb 0e                	jmp    140009bcf <__gethex_D2A+0x1cf>
   140009bc1:	48 89 d9             	mov    rcx,rbx
   140009bc4:	45 31 d2             	xor    r10d,r10d
   140009bc7:	eb 03                	jmp    140009bcc <__gethex_D2A+0x1cc>
   140009bc9:	48 89 d9             	mov    rcx,rbx
   140009bcc:	45 31 db             	xor    r11d,r11d
   140009bcf:	45 85 c9             	test   r9d,r9d
   140009bd2:	75 04                	jne    140009bd8 <__gethex_D2A+0x1d8>
   140009bd4:	48 8d 4a ff          	lea    rcx,[rdx-0x1]
   140009bd8:	48 89 0e             	mov    QWORD PTR [rsi],rcx
   140009bdb:	31 ff                	xor    edi,edi
   140009bdd:	45 85 f6             	test   r14d,r14d
   140009be0:	0f 85 8e 04 00 00    	jne    14000a074 <__gethex_D2A+0x674>
   140009be6:	45 85 db             	test   r11d,r11d
   140009be9:	0f 84 ea 00 00 00    	je     140009cd9 <__gethex_D2A+0x2d9>
   140009bef:	41 8b 44 24 0c       	mov    eax,DWORD PTR [r12+0xc]
   140009bf4:	45 85 d2             	test   r10d,r10d
   140009bf7:	74 40                	je     140009c39 <__gethex_D2A+0x239>
   140009bf9:	83 f8 02             	cmp    eax,0x2
   140009bfc:	74 0a                	je     140009c08 <__gethex_D2A+0x208>
   140009bfe:	83 f8 03             	cmp    eax,0x3
   140009c01:	74 10                	je     140009c13 <__gethex_D2A+0x213>
   140009c03:	e9 0b 03 00 00       	jmp    140009f13 <__gethex_D2A+0x513>
   140009c08:	45 85 ed             	test   r13d,r13d
   140009c0b:	0f 85 02 03 00 00    	jne    140009f13 <__gethex_D2A+0x513>
   140009c11:	eb 09                	jmp    140009c1c <__gethex_D2A+0x21c>
   140009c13:	45 85 ed             	test   r13d,r13d
   140009c16:	0f 84 f7 02 00 00    	je     140009f13 <__gethex_D2A+0x513>
   140009c1c:	31 c9                	xor    ecx,ecx
   140009c1e:	e8 c0 da ff ff       	call   1400076e3 <__Balloc_D2A>
   140009c23:	48 89 c6             	mov    rsi,rax
   140009c26:	48 b8 01 00 00 00 01 	movabs rax,0x100000001
   140009c2d:	00 00 00 
   140009c30:	48 89 46 14          	mov    QWORD PTR [rsi+0x14],rax
   140009c34:	e9 a3 02 00 00       	jmp    140009edc <__gethex_D2A+0x4dc>
   140009c39:	83 f8 02             	cmp    eax,0x2
   140009c3c:	74 09                	je     140009c47 <__gethex_D2A+0x247>
   140009c3e:	83 f8 03             	cmp    eax,0x3
   140009c41:	74 0f                	je     140009c52 <__gethex_D2A+0x252>
   140009c43:	ff c8                	dec    eax
   140009c45:	eb 03                	jmp    140009c4a <__gethex_D2A+0x24a>
   140009c47:	45 85 ed             	test   r13d,r13d
   140009c4a:	0f 84 ec 01 00 00    	je     140009e3c <__gethex_D2A+0x43c>
   140009c50:	eb 09                	jmp    140009c5b <__gethex_D2A+0x25b>
   140009c52:	45 85 ed             	test   r13d,r13d
   140009c55:	0f 85 e1 01 00 00    	jne    140009e3c <__gethex_D2A+0x43c>
   140009c5b:	41 8b 34 24          	mov    esi,DWORD PTR [r12]
   140009c5f:	89 f3                	mov    ebx,esi
   140009c61:	83 e6 1f             	and    esi,0x1f
   140009c64:	c1 fb 05             	sar    ebx,0x5
   140009c67:	83 fe 01             	cmp    esi,0x1
   140009c6a:	89 df                	mov    edi,ebx
   140009c6c:	83 df ff             	sbb    edi,0xffffffff
   140009c6f:	89 f8                	mov    eax,edi
   140009c71:	d1 f8                	sar    eax,1
   140009c73:	74 05                	je     140009c7a <__gethex_D2A+0x27a>
   140009c75:	41 ff c6             	inc    r14d
   140009c78:	eb f7                	jmp    140009c71 <__gethex_D2A+0x271>
   140009c7a:	44 89 f1             	mov    ecx,r14d
   140009c7d:	e8 61 da ff ff       	call   1400076e3 <__Balloc_D2A>
   140009c82:	48 8b 94 24 98 00 00 	mov    rdx,QWORD PTR [rsp+0x98]
   140009c89:	00 
   140009c8a:	48 89 02             	mov    QWORD PTR [rdx],rax
   140009c8d:	31 d2                	xor    edx,edx
   140009c8f:	89 78 14             	mov    DWORD PTR [rax+0x14],edi
   140009c92:	39 d3                	cmp    ebx,edx
   140009c94:	7e 0d                	jle    140009ca3 <__gethex_D2A+0x2a3>
   140009c96:	c7 44 90 18 ff ff ff 	mov    DWORD PTR [rax+rdx*4+0x18],0xffffffff
   140009c9d:	ff 
   140009c9e:	48 ff c2             	inc    rdx
   140009ca1:	eb ef                	jmp    140009c92 <__gethex_D2A+0x292>
   140009ca3:	39 df                	cmp    edi,ebx
   140009ca5:	7e 19                	jle    140009cc0 <__gethex_D2A+0x2c0>
   140009ca7:	31 d2                	xor    edx,edx
   140009ca9:	85 db                	test   ebx,ebx
   140009cab:	89 f1                	mov    ecx,esi
   140009cad:	0f 48 da             	cmovs  ebx,edx
   140009cb0:	f7 d9                	neg    ecx
   140009cb2:	ba ff ff ff ff       	mov    edx,0xffffffff
   140009cb7:	d3 ea                	shr    edx,cl
   140009cb9:	48 63 db             	movsxd rbx,ebx
   140009cbc:	89 54 98 18          	mov    DWORD PTR [rax+rbx*4+0x18],edx
   140009cc0:	41 8b 44 24 08       	mov    eax,DWORD PTR [r12+0x8]
   140009cc5:	48 8b b4 24 90 00 00 	mov    rsi,QWORD PTR [rsp+0x90]
   140009ccc:	00 
   140009ccd:	bf 11 00 00 00       	mov    edi,0x11
   140009cd2:	89 06                	mov    DWORD PTR [rsi],eax
   140009cd4:	e9 9b 03 00 00       	jmp    14000a074 <__gethex_D2A+0x674>
   140009cd9:	48 89 d8             	mov    rax,rbx
   140009cdc:	31 c9                	xor    ecx,ecx
   140009cde:	48 29 d0             	sub    rax,rdx
   140009ce1:	ff c8                	dec    eax
   140009ce3:	83 f8 07             	cmp    eax,0x7
   140009ce6:	7e 06                	jle    140009cee <__gethex_D2A+0x2ee>
   140009ce8:	ff c1                	inc    ecx
   140009cea:	d1 f8                	sar    eax,1
   140009cec:	eb f5                	jmp    140009ce3 <__gethex_D2A+0x2e3>
   140009cee:	4c 89 44 24 28       	mov    QWORD PTR [rsp+0x28],r8
   140009cf3:	48 89 54 24 20       	mov    QWORD PTR [rsp+0x20],rdx
   140009cf8:	e8 e6 d9 ff ff       	call   1400076e3 <__Balloc_D2A>
   140009cfd:	4c 8b 44 24 28       	mov    r8,QWORD PTR [rsp+0x28]
   140009d02:	48 8b 54 24 20       	mov    rdx,QWORD PTR [rsp+0x20]
   140009d07:	48 89 c6             	mov    rsi,rax
   140009d0a:	4c 8d 78 18          	lea    r15,[rax+0x18]
   140009d0e:	31 c0                	xor    eax,eax
   140009d10:	49 89 c2             	mov    r10,rax
   140009d13:	48 8d 40 01          	lea    rax,[rax+0x1]
   140009d17:	43 80 7c 10 01 00    	cmp    BYTE PTR [r8+r10*1+0x1],0x0
   140009d1d:	75 f1                	jne    140009d10 <__gethex_D2A+0x310>
   140009d1f:	4d 89 f9             	mov    r9,r15
   140009d22:	31 c9                	xor    ecx,ecx
   140009d24:	31 c0                	xor    eax,eax
   140009d26:	49 8d 79 04          	lea    rdi,[r9+0x4]
   140009d2a:	48 39 da             	cmp    rdx,rbx
   140009d2d:	73 48                	jae    140009d77 <__gethex_D2A+0x377>
   140009d2f:	4c 8d 5b ff          	lea    r11,[rbx-0x1]
   140009d33:	4c 89 5c 24 20       	mov    QWORD PTR [rsp+0x20],r11
   140009d38:	47 8a 1c 10          	mov    r11b,BYTE PTR [r8+r10*1]
   140009d3c:	44 38 5b ff          	cmp    BYTE PTR [rbx-0x1],r11b
   140009d40:	75 07                	jne    140009d49 <__gethex_D2A+0x349>
   140009d42:	4c 29 54 24 20       	sub    QWORD PTR [rsp+0x20],r10
   140009d47:	eb 27                	jmp    140009d70 <__gethex_D2A+0x370>
   140009d49:	83 f9 20             	cmp    ecx,0x20
   140009d4c:	75 0a                	jne    140009d58 <__gethex_D2A+0x358>
   140009d4e:	41 89 01             	mov    DWORD PTR [r9],eax
   140009d51:	31 c9                	xor    ecx,ecx
   140009d53:	49 89 f9             	mov    r9,rdi
   140009d56:	31 c0                	xor    eax,eax
   140009d58:	0f b6 5b ff          	movzx  ebx,BYTE PTR [rbx-0x1]
   140009d5c:	48 8b 3d 3d 2c 00 00 	mov    rdi,QWORD PTR [rip+0x2c3d]        # 14000c9a0 <.refptr.__hexdig_D2A>
   140009d63:	8a 1c 1f             	mov    bl,BYTE PTR [rdi+rbx*1]
   140009d66:	83 e3 0f             	and    ebx,0xf
   140009d69:	d3 e3                	shl    ebx,cl
   140009d6b:	83 c1 04             	add    ecx,0x4
   140009d6e:	09 d8                	or     eax,ebx
   140009d70:	48 8b 5c 24 20       	mov    rbx,QWORD PTR [rsp+0x20]
   140009d75:	eb af                	jmp    140009d26 <__gethex_D2A+0x326>
   140009d77:	4c 29 ff             	sub    rdi,r15
   140009d7a:	41 89 01             	mov    DWORD PTR [r9],eax
   140009d7d:	41 8b 1c 24          	mov    ebx,DWORD PTR [r12]
   140009d81:	48 89 fa             	mov    rdx,rdi
   140009d84:	48 c1 fa 02          	sar    rdx,0x2
   140009d88:	0f bd c0             	bsr    eax,eax
   140009d8b:	c1 e7 03             	shl    edi,0x3
   140009d8e:	83 f0 1f             	xor    eax,0x1f
   140009d91:	89 56 14             	mov    DWORD PTR [rsi+0x14],edx
   140009d94:	29 c7                	sub    edi,eax
   140009d96:	39 df                	cmp    edi,ebx
   140009d98:	7e 66                	jle    140009e00 <__gethex_D2A+0x400>
   140009d9a:	29 df                	sub    edi,ebx
   140009d9c:	48 89 f1             	mov    rcx,rsi
   140009d9f:	89 fa                	mov    edx,edi
   140009da1:	e8 43 07 00 00       	call   14000a4e9 <__any_on_D2A>
   140009da6:	41 89 c0             	mov    r8d,eax
   140009da9:	85 c0                	test   eax,eax
   140009dab:	74 40                	je     140009ded <__gethex_D2A+0x3ed>
   140009dad:	8d 57 ff             	lea    edx,[rdi-0x1]
   140009db0:	b8 01 00 00 00       	mov    eax,0x1
   140009db5:	41 89 d0             	mov    r8d,edx
   140009db8:	89 d1                	mov    ecx,edx
   140009dba:	41 c1 f8 05          	sar    r8d,0x5
   140009dbe:	d3 e0                	shl    eax,cl
   140009dc0:	4d 63 c0             	movsxd r8,r8d
   140009dc3:	43 23 04 87          	and    eax,DWORD PTR [r15+r8*4]
   140009dc7:	41 b8 01 00 00 00    	mov    r8d,0x1
   140009dcd:	74 1e                	je     140009ded <__gethex_D2A+0x3ed>
   140009dcf:	85 d2                	test   edx,edx
   140009dd1:	75 08                	jne    140009ddb <__gethex_D2A+0x3db>
   140009dd3:	41 b8 02 00 00 00    	mov    r8d,0x2
   140009dd9:	eb 12                	jmp    140009ded <__gethex_D2A+0x3ed>
   140009ddb:	48 89 f1             	mov    rcx,rsi
   140009dde:	e8 06 07 00 00       	call   14000a4e9 <__any_on_D2A>
   140009de3:	85 c0                	test   eax,eax
   140009de5:	74 ec                	je     140009dd3 <__gethex_D2A+0x3d3>
   140009de7:	41 b8 03 00 00 00    	mov    r8d,0x3
   140009ded:	89 fa                	mov    edx,edi
   140009def:	48 89 f1             	mov    rcx,rsi
   140009df2:	44 89 44 24 20       	mov    DWORD PTR [rsp+0x20],r8d
   140009df7:	01 fd                	add    ebp,edi
   140009df9:	e8 c2 d6 ff ff       	call   1400074c0 <__rshift_D2A>
   140009dfe:	eb 28                	jmp    140009e28 <__gethex_D2A+0x428>
   140009e00:	41 b8 00 00 00 00    	mov    r8d,0x0
   140009e06:	7d 25                	jge    140009e2d <__gethex_D2A+0x42d>
   140009e08:	41 89 df             	mov    r15d,ebx
   140009e0b:	48 89 f1             	mov    rcx,rsi
   140009e0e:	44 89 44 24 20       	mov    DWORD PTR [rsp+0x20],r8d
   140009e13:	41 29 ff             	sub    r15d,edi
   140009e16:	44 89 fa             	mov    edx,r15d
   140009e19:	44 29 fd             	sub    ebp,r15d
   140009e1c:	e8 a4 dc ff ff       	call   140007ac5 <__lshift_D2A>
   140009e21:	48 89 c6             	mov    rsi,rax
   140009e24:	4c 8d 78 18          	lea    r15,[rax+0x18]
   140009e28:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
   140009e2d:	41 39 6c 24 08       	cmp    DWORD PTR [r12+0x8],ebp
   140009e32:	7d 43                	jge    140009e77 <__gethex_D2A+0x477>
   140009e34:	48 89 f1             	mov    rcx,rsi
   140009e37:	e8 5d d9 ff ff       	call   140007799 <__Bfree_D2A>
   140009e3c:	e8 27 0d 00 00       	call   14000ab68 <_errno>
   140009e41:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
   140009e47:	41 8b 44 24 0c       	mov    eax,DWORD PTR [r12+0xc]
   140009e4c:	83 f8 02             	cmp    eax,0x2
   140009e4f:	74 13                	je     140009e64 <__gethex_D2A+0x464>
   140009e51:	83 f8 03             	cmp    eax,0x3
   140009e54:	74 04                	je     140009e5a <__gethex_D2A+0x45a>
   140009e56:	85 c0                	test   eax,eax
   140009e58:	eb 03                	jmp    140009e5d <__gethex_D2A+0x45d>
   140009e5a:	45 85 ed             	test   r13d,r13d
   140009e5d:	75 0e                	jne    140009e6d <__gethex_D2A+0x46d>
   140009e5f:	e9 f7 fd ff ff       	jmp    140009c5b <__gethex_D2A+0x25b>
   140009e64:	45 85 ed             	test   r13d,r13d
   140009e67:	0f 85 ee fd ff ff    	jne    140009c5b <__gethex_D2A+0x25b>
   140009e6d:	bf a3 00 00 00       	mov    edi,0xa3
   140009e72:	e9 fd 01 00 00       	jmp    14000a074 <__gethex_D2A+0x674>
   140009e77:	41 8b 7c 24 04       	mov    edi,DWORD PTR [r12+0x4]
   140009e7c:	39 ef                	cmp    edi,ebp
   140009e7e:	0f 8e 02 01 00 00    	jle    140009f86 <__gethex_D2A+0x586>
   140009e84:	29 ef                	sub    edi,ebp
   140009e86:	39 fb                	cmp    ebx,edi
   140009e88:	0f 8f 9a 00 00 00    	jg     140009f28 <__gethex_D2A+0x528>
   140009e8e:	41 8b 44 24 0c       	mov    eax,DWORD PTR [r12+0xc]
   140009e93:	83 f8 02             	cmp    eax,0x2
   140009e96:	74 36                	je     140009ece <__gethex_D2A+0x4ce>
   140009e98:	83 f8 03             	cmp    eax,0x3
   140009e9b:	74 38                	je     140009ed5 <__gethex_D2A+0x4d5>
   140009e9d:	ff c8                	dec    eax
   140009e9f:	75 6a                	jne    140009f0b <__gethex_D2A+0x50b>
   140009ea1:	39 fb                	cmp    ebx,edi
   140009ea3:	75 66                	jne    140009f0b <__gethex_D2A+0x50b>
   140009ea5:	83 fb 01             	cmp    ebx,0x1
   140009ea8:	74 05                	je     140009eaf <__gethex_D2A+0x4af>
   140009eaa:	45 85 c0             	test   r8d,r8d
   140009ead:	74 10                	je     140009ebf <__gethex_D2A+0x4bf>
   140009eaf:	c7 46 14 01 00 00 00 	mov    DWORD PTR [rsi+0x14],0x1
   140009eb6:	41 c7 07 01 00 00 00 	mov    DWORD PTR [r15],0x1
   140009ebd:	eb 1d                	jmp    140009edc <__gethex_D2A+0x4dc>
   140009ebf:	8d 53 ff             	lea    edx,[rbx-0x1]
   140009ec2:	48 89 f1             	mov    rcx,rsi
   140009ec5:	e8 1f 06 00 00       	call   14000a4e9 <__any_on_D2A>
   140009eca:	85 c0                	test   eax,eax
   140009ecc:	eb 0a                	jmp    140009ed8 <__gethex_D2A+0x4d8>
   140009ece:	45 85 ed             	test   r13d,r13d
   140009ed1:	75 38                	jne    140009f0b <__gethex_D2A+0x50b>
   140009ed3:	eb da                	jmp    140009eaf <__gethex_D2A+0x4af>
   140009ed5:	45 85 ed             	test   r13d,r13d
   140009ed8:	74 31                	je     140009f0b <__gethex_D2A+0x50b>
   140009eda:	eb d3                	jmp    140009eaf <__gethex_D2A+0x4af>
   140009edc:	48 8b 84 24 98 00 00 	mov    rax,QWORD PTR [rsp+0x98]
   140009ee3:	00 
   140009ee4:	bf 62 00 00 00       	mov    edi,0x62
   140009ee9:	48 89 30             	mov    QWORD PTR [rax],rsi
   140009eec:	41 8b 44 24 04       	mov    eax,DWORD PTR [r12+0x4]
   140009ef1:	48 8b b4 24 90 00 00 	mov    rsi,QWORD PTR [rsp+0x90]
   140009ef8:	00 
   140009ef9:	89 06                	mov    DWORD PTR [rsi],eax
   140009efb:	e8 68 0c 00 00       	call   14000ab68 <_errno>
   140009f00:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
   140009f06:	e9 69 01 00 00       	jmp    14000a074 <__gethex_D2A+0x674>
   140009f0b:	48 89 f1             	mov    rcx,rsi
   140009f0e:	e8 86 d8 ff ff       	call   140007799 <__Bfree_D2A>
   140009f13:	e8 50 0c 00 00       	call   14000ab68 <_errno>
   140009f18:	bf 50 00 00 00       	mov    edi,0x50
   140009f1d:	c7 00 22 00 00 00    	mov    DWORD PTR [rax],0x22
   140009f23:	e9 4c 01 00 00       	jmp    14000a074 <__gethex_D2A+0x674>
   140009f28:	8d 6f ff             	lea    ebp,[rdi-0x1]
   140009f2b:	45 85 c0             	test   r8d,r8d
   140009f2e:	75 13                	jne    140009f43 <__gethex_D2A+0x543>
   140009f30:	85 ed                	test   ebp,ebp
   140009f32:	74 15                	je     140009f49 <__gethex_D2A+0x549>
   140009f34:	89 ea                	mov    edx,ebp
   140009f36:	48 89 f1             	mov    rcx,rsi
   140009f39:	e8 ab 05 00 00       	call   14000a4e9 <__any_on_D2A>
   140009f3e:	41 89 c0             	mov    r8d,eax
   140009f41:	eb 06                	jmp    140009f49 <__gethex_D2A+0x549>
   140009f43:	41 b8 01 00 00 00    	mov    r8d,0x1
   140009f49:	89 ea                	mov    edx,ebp
   140009f4b:	b8 01 00 00 00       	mov    eax,0x1
   140009f50:	89 e9                	mov    ecx,ebp
   140009f52:	c1 fa 05             	sar    edx,0x5
   140009f55:	d3 e0                	shl    eax,cl
   140009f57:	48 63 d2             	movsxd rdx,edx
   140009f5a:	41 23 04 97          	and    eax,DWORD PTR [r15+rdx*4]
   140009f5e:	74 04                	je     140009f64 <__gethex_D2A+0x564>
   140009f60:	41 83 c8 02          	or     r8d,0x2
   140009f64:	89 fa                	mov    edx,edi
   140009f66:	48 89 f1             	mov    rcx,rsi
   140009f69:	44 89 44 24 20       	mov    DWORD PTR [rsp+0x20],r8d
   140009f6e:	29 fb                	sub    ebx,edi
   140009f70:	e8 4b d5 ff ff       	call   1400074c0 <__rshift_D2A>
   140009f75:	bf 02 00 00 00       	mov    edi,0x2
   140009f7a:	41 8b 6c 24 04       	mov    ebp,DWORD PTR [r12+0x4]
   140009f7f:	44 8b 44 24 20       	mov    r8d,DWORD PTR [rsp+0x20]
   140009f84:	eb 05                	jmp    140009f8b <__gethex_D2A+0x58b>
   140009f86:	bf 01 00 00 00       	mov    edi,0x1
   140009f8b:	45 85 c0             	test   r8d,r8d
   140009f8e:	0f 84 cb 00 00 00    	je     14000a05f <__gethex_D2A+0x65f>
   140009f94:	41 8b 44 24 0c       	mov    eax,DWORD PTR [r12+0xc]
   140009f99:	83 f8 02             	cmp    eax,0x2
   140009f9c:	74 23                	je     140009fc1 <__gethex_D2A+0x5c1>
   140009f9e:	83 f8 03             	cmp    eax,0x3
   140009fa1:	74 28                	je     140009fcb <__gethex_D2A+0x5cb>
   140009fa3:	ff c8                	dec    eax
   140009fa5:	0f 85 b1 00 00 00    	jne    14000a05c <__gethex_D2A+0x65c>
   140009fab:	41 f7 c0 02 00 00 00 	test   r8d,0x2
   140009fb2:	0f 84 a4 00 00 00    	je     14000a05c <__gethex_D2A+0x65c>
   140009fb8:	45 0b 07             	or     r8d,DWORD PTR [r15]
   140009fbb:	41 83 e0 01          	and    r8d,0x1
   140009fbf:	eb 0f                	jmp    140009fd0 <__gethex_D2A+0x5d0>
   140009fc1:	b8 01 00 00 00       	mov    eax,0x1
   140009fc6:	44 29 e8             	sub    eax,r13d
   140009fc9:	eb 03                	jmp    140009fce <__gethex_D2A+0x5ce>
   140009fcb:	44 89 e8             	mov    eax,r13d
   140009fce:	85 c0                	test   eax,eax
   140009fd0:	0f 84 86 00 00 00    	je     14000a05c <__gethex_D2A+0x65c>
   140009fd6:	48 89 f1             	mov    rcx,rsi
   140009fd9:	4c 63 7e 14          	movsxd r15,DWORD PTR [rsi+0x14]
   140009fdd:	e8 2e df ff ff       	call   140007f10 <__increment_D2A>
   140009fe2:	48 89 c6             	mov    rsi,rax
   140009fe5:	48 8d 50 18          	lea    rdx,[rax+0x18]
   140009fe9:	83 ff 02             	cmp    edi,0x2
   140009fec:	75 2b                	jne    14000a019 <__gethex_D2A+0x619>
   140009fee:	41 8b 04 24          	mov    eax,DWORD PTR [r12]
   140009ff2:	ff c8                	dec    eax
   140009ff4:	39 d8                	cmp    eax,ebx
   140009ff6:	75 5f                	jne    14000a057 <__gethex_D2A+0x657>
   140009ff8:	41 89 d8             	mov    r8d,ebx
   140009ffb:	41 b9 01 00 00 00    	mov    r9d,0x1
   14000a001:	89 d9                	mov    ecx,ebx
   14000a003:	41 c1 f8 05          	sar    r8d,0x5
   14000a007:	44 89 c8             	mov    eax,r9d
   14000a00a:	4d 63 c0             	movsxd r8,r8d
   14000a00d:	d3 e0                	shl    eax,cl
   14000a00f:	42 23 04 82          	and    eax,DWORD PTR [rdx+r8*4]
   14000a013:	41 0f 45 f9          	cmovne edi,r9d
   14000a017:	eb 3e                	jmp    14000a057 <__gethex_D2A+0x657>
   14000a019:	44 39 78 14          	cmp    DWORD PTR [rax+0x14],r15d
   14000a01d:	7f 19                	jg     14000a038 <__gethex_D2A+0x638>
   14000a01f:	83 e3 1f             	and    ebx,0x1f
   14000a022:	74 2e                	je     14000a052 <__gethex_D2A+0x652>
   14000a024:	42 0f bd 44 ba fc    	bsr    eax,DWORD PTR [rdx+r15*4-0x4]
   14000a02a:	ba 20 00 00 00       	mov    edx,0x20
   14000a02f:	29 da                	sub    edx,ebx
   14000a031:	83 f0 1f             	xor    eax,0x1f
   14000a034:	39 c2                	cmp    edx,eax
   14000a036:	7e 1a                	jle    14000a052 <__gethex_D2A+0x652>
   14000a038:	ba 01 00 00 00       	mov    edx,0x1
   14000a03d:	48 89 f1             	mov    rcx,rsi
   14000a040:	ff c5                	inc    ebp
   14000a042:	e8 79 d4 ff ff       	call   1400074c0 <__rshift_D2A>
   14000a047:	41 39 6c 24 08       	cmp    DWORD PTR [r12+0x8],ebp
   14000a04c:	0f 8c e2 fd ff ff    	jl     140009e34 <__gethex_D2A+0x434>
   14000a052:	bf 01 00 00 00       	mov    edi,0x1
   14000a057:	83 cf 20             	or     edi,0x20
   14000a05a:	eb 03                	jmp    14000a05f <__gethex_D2A+0x65f>
   14000a05c:	83 cf 10             	or     edi,0x10
   14000a05f:	48 8b 84 24 98 00 00 	mov    rax,QWORD PTR [rsp+0x98]
   14000a066:	00 
   14000a067:	48 89 30             	mov    QWORD PTR [rax],rsi
   14000a06a:	48 8b 84 24 90 00 00 	mov    rax,QWORD PTR [rsp+0x90]
   14000a071:	00 
   14000a072:	89 28                	mov    DWORD PTR [rax],ebp
   14000a074:	89 f8                	mov    eax,edi
   14000a076:	48 83 c4 38          	add    rsp,0x38
   14000a07a:	5b                   	pop    rbx
   14000a07b:	5e                   	pop    rsi
   14000a07c:	5f                   	pop    rdi
   14000a07d:	5d                   	pop    rbp
   14000a07e:	41 5c                	pop    r12
   14000a080:	41 5d                	pop    r13
   14000a082:	41 5e                	pop    r14
   14000a084:	41 5f                	pop    r15
   14000a086:	c3                   	ret
   14000a087:	90                   	nop
   14000a088:	90                   	nop
   14000a089:	90                   	nop
   14000a08a:	90                   	nop
   14000a08b:	90                   	nop
   14000a08c:	90                   	nop
   14000a08d:	90                   	nop
   14000a08e:	90                   	nop
   14000a08f:	90                   	nop

000000014000a090 <.text>:
   14000a090:	41 ba 20 00 00 00    	mov    r10d,0x20
   14000a096:	48 89 c8             	mov    rax,rcx
   14000a099:	b9 08 00 00 00       	mov    ecx,0x8
   14000a09e:	44 29 c1             	sub    ecx,r8d
   14000a0a1:	44 8d 04 8d 00 00 00 	lea    r8d,[rcx*4+0x0]
   14000a0a8:	00 
   14000a0a9:	45 29 c2             	sub    r10d,r8d
   14000a0ac:	44 8b 48 04          	mov    r9d,DWORD PTR [rax+0x4]
   14000a0b0:	44 89 d1             	mov    ecx,r10d
   14000a0b3:	45 89 cb             	mov    r11d,r9d
   14000a0b6:	41 d3 e3             	shl    r11d,cl
   14000a0b9:	44 89 c1             	mov    ecx,r8d
   14000a0bc:	44 09 18             	or     DWORD PTR [rax],r11d
   14000a0bf:	48 83 c0 04          	add    rax,0x4
   14000a0c3:	41 d3 e9             	shr    r9d,cl
   14000a0c6:	44 89 08             	mov    DWORD PTR [rax],r9d
   14000a0c9:	48 39 d0             	cmp    rax,rdx
   14000a0cc:	72 de                	jb     14000a0ac <.text+0x1c>
   14000a0ce:	c3                   	ret

000000014000a0cf <__hexnan_D2A>:
   14000a0cf:	41 57                	push   r15
   14000a0d1:	41 56                	push   r14
   14000a0d3:	41 55                	push   r13
   14000a0d5:	41 54                	push   r12
   14000a0d7:	55                   	push   rbp
   14000a0d8:	57                   	push   rdi
   14000a0d9:	56                   	push   rsi
   14000a0da:	53                   	push   rbx
   14000a0db:	48 83 ec 38          	sub    rsp,0x38
   14000a0df:	44 8b 22             	mov    r12d,DWORD PTR [rdx]
   14000a0e2:	44 89 e0             	mov    eax,r12d
   14000a0e5:	c1 f8 05             	sar    eax,0x5
   14000a0e8:	48 98                	cdqe
   14000a0ea:	49 89 cf             	mov    r15,rcx
   14000a0ed:	4c 89 c5             	mov    rbp,r8
   14000a0f0:	4d 8d 2c 80          	lea    r13,[r8+rax*4]
   14000a0f4:	41 83 e4 1f          	and    r12d,0x1f
   14000a0f8:	74 04                	je     14000a0fe <__hexnan_D2A+0x2f>
   14000a0fa:	49 83 c5 04          	add    r13,0x4
   14000a0fe:	45 31 d2             	xor    r10d,r10d
   14000a101:	49 8b 07             	mov    rax,QWORD PTR [r15]
   14000a104:	49 8d 7d fc          	lea    rdi,[r13-0x4]
   14000a108:	45 89 55 fc          	mov    DWORD PTR [r13-0x4],r10d
   14000a10c:	0f b6 48 01          	movzx  ecx,BYTE PTR [rax+0x1]
   14000a110:	85 c9                	test   ecx,ecx
   14000a112:	74 24                	je     14000a138 <__hexnan_D2A+0x69>
   14000a114:	83 f9 20             	cmp    ecx,0x20
   14000a117:	77 05                	ja     14000a11e <__hexnan_D2A+0x4f>
   14000a119:	48 ff c0             	inc    rax
   14000a11c:	eb ee                	jmp    14000a10c <__hexnan_D2A+0x3d>
   14000a11e:	80 f9 30             	cmp    cl,0x30
   14000a121:	75 15                	jne    14000a138 <__hexnan_D2A+0x69>
   14000a123:	8a 50 02             	mov    dl,BYTE PTR [rax+0x2]
   14000a126:	83 e2 df             	and    edx,0xffffffdf
   14000a129:	80 fa 58             	cmp    dl,0x58
   14000a12c:	75 0a                	jne    14000a138 <__hexnan_D2A+0x69>
   14000a12e:	80 78 03 20          	cmp    BYTE PTR [rax+0x3],0x20
   14000a132:	76 04                	jbe    14000a138 <__hexnan_D2A+0x69>
   14000a134:	48 83 c0 02          	add    rax,0x2
   14000a138:	48 89 fa             	mov    rdx,rdi
   14000a13b:	48 89 fb             	mov    rbx,rdi
   14000a13e:	45 31 c0             	xor    r8d,r8d
   14000a141:	45 31 c9             	xor    r9d,r9d
   14000a144:	45 31 f6             	xor    r14d,r14d
   14000a147:	0f b6 48 01          	movzx  ecx,BYTE PTR [rax+0x1]
   14000a14b:	85 c9                	test   ecx,ecx
   14000a14d:	0f 84 f8 00 00 00    	je     14000a24b <__hexnan_D2A+0x17c>
   14000a153:	4c 8b 1d 46 28 00 00 	mov    r11,QWORD PTR [rip+0x2846]        # 14000c9a0 <.refptr.__hexdig_D2A>
   14000a15a:	41 89 ca             	mov    r10d,ecx
   14000a15d:	48 8d 70 01          	lea    rsi,[rax+0x1]
   14000a161:	47 8a 14 13          	mov    r10b,BYTE PTR [r11+r10*1]
   14000a165:	45 84 d2             	test   r10b,r10b
   14000a168:	0f 85 a6 00 00 00    	jne    14000a214 <__hexnan_D2A+0x145>
   14000a16e:	83 f9 20             	cmp    ecx,0x20
   14000a171:	77 76                	ja     14000a1e9 <__hexnan_D2A+0x11a>
   14000a173:	45 39 ce             	cmp    r14d,r9d
   14000a176:	7e 4d                	jle    14000a1c5 <__hexnan_D2A+0xf6>
   14000a178:	48 39 d3             	cmp    rbx,rdx
   14000a17b:	73 18                	jae    14000a195 <__hexnan_D2A+0xc6>
   14000a17d:	41 83 f8 07          	cmp    r8d,0x7
   14000a181:	7f 12                	jg     14000a195 <__hexnan_D2A+0xc6>
   14000a183:	48 89 d9             	mov    rcx,rbx
   14000a186:	44 89 4c 24 2c       	mov    DWORD PTR [rsp+0x2c],r9d
   14000a18b:	e8 00 ff ff ff       	call   14000a090 <.text>
   14000a190:	44 8b 4c 24 2c       	mov    r9d,DWORD PTR [rsp+0x2c]
   14000a195:	41 b8 08 00 00 00    	mov    r8d,0x8
   14000a19b:	48 39 dd             	cmp    rbp,rbx
   14000a19e:	0f 83 9f 00 00 00    	jae    14000a243 <__hexnan_D2A+0x174>
   14000a1a4:	45 31 c9             	xor    r9d,r9d
   14000a1a7:	48 8d 53 fc          	lea    rdx,[rbx-0x4]
   14000a1ab:	45 31 c0             	xor    r8d,r8d
   14000a1ae:	44 89 4b fc          	mov    DWORD PTR [rbx-0x4],r9d
   14000a1b2:	45 89 f1             	mov    r9d,r14d
   14000a1b5:	48 89 d3             	mov    rbx,rdx
   14000a1b8:	eb 0b                	jmp    14000a1c5 <__hexnan_D2A+0xf6>
   14000a1ba:	85 c9                	test   ecx,ecx
   14000a1bc:	0f 84 23 01 00 00    	je     14000a2e5 <__hexnan_D2A+0x216>
   14000a1c2:	48 ff c6             	inc    rsi
   14000a1c5:	0f b6 4e 01          	movzx  ecx,BYTE PTR [rsi+0x1]
   14000a1c9:	80 f9 20             	cmp    cl,0x20
   14000a1cc:	76 ec                	jbe    14000a1ba <__hexnan_D2A+0xeb>
   14000a1ce:	80 f9 30             	cmp    cl,0x30
   14000a1d1:	75 70                	jne    14000a243 <__hexnan_D2A+0x174>
   14000a1d3:	8a 46 02             	mov    al,BYTE PTR [rsi+0x2]
   14000a1d6:	83 e0 df             	and    eax,0xffffffdf
   14000a1d9:	3c 58                	cmp    al,0x58
   14000a1db:	75 66                	jne    14000a243 <__hexnan_D2A+0x174>
   14000a1dd:	80 7e 03 20          	cmp    BYTE PTR [rsi+0x3],0x20
   14000a1e1:	76 60                	jbe    14000a243 <__hexnan_D2A+0x174>
   14000a1e3:	48 83 c6 02          	add    rsi,0x2
   14000a1e7:	eb 5a                	jmp    14000a243 <__hexnan_D2A+0x174>
   14000a1e9:	83 f9 29             	cmp    ecx,0x29
   14000a1ec:	75 19                	jne    14000a207 <__hexnan_D2A+0x138>
   14000a1ee:	45 85 f6             	test   r14d,r14d
   14000a1f1:	74 14                	je     14000a207 <__hexnan_D2A+0x138>
   14000a1f3:	48 83 c0 02          	add    rax,0x2
   14000a1f7:	49 89 07             	mov    QWORD PTR [r15],rax
   14000a1fa:	eb 58                	jmp    14000a254 <__hexnan_D2A+0x185>
   14000a1fc:	0f be 0e             	movsx  ecx,BYTE PTR [rsi]
   14000a1ff:	85 c9                	test   ecx,ecx
   14000a201:	0f 84 de 00 00 00    	je     14000a2e5 <__hexnan_D2A+0x216>
   14000a207:	48 ff c6             	inc    rsi
   14000a20a:	83 f9 29             	cmp    ecx,0x29
   14000a20d:	75 ed                	jne    14000a1fc <__hexnan_D2A+0x12d>
   14000a20f:	49 89 37             	mov    QWORD PTR [r15],rsi
   14000a212:	eb 37                	jmp    14000a24b <__hexnan_D2A+0x17c>
   14000a214:	41 ff c0             	inc    r8d
   14000a217:	41 ff c6             	inc    r14d
   14000a21a:	41 83 f8 08          	cmp    r8d,0x8
   14000a21e:	7e 15                	jle    14000a235 <__hexnan_D2A+0x166>
   14000a220:	48 39 dd             	cmp    rbp,rbx
   14000a223:	73 1e                	jae    14000a243 <__hexnan_D2A+0x174>
   14000a225:	45 31 c0             	xor    r8d,r8d
   14000a228:	48 83 eb 04          	sub    rbx,0x4
   14000a22c:	44 89 03             	mov    DWORD PTR [rbx],r8d
   14000a22f:	41 b8 01 00 00 00    	mov    r8d,0x1
   14000a235:	8b 03                	mov    eax,DWORD PTR [rbx]
   14000a237:	41 83 e2 0f          	and    r10d,0xf
   14000a23b:	c1 e0 04             	shl    eax,0x4
   14000a23e:	44 09 d0             	or     eax,r10d
   14000a241:	89 03                	mov    DWORD PTR [rbx],eax
   14000a243:	48 89 f0             	mov    rax,rsi
   14000a246:	e9 fc fe ff ff       	jmp    14000a147 <__hexnan_D2A+0x78>
   14000a24b:	45 85 f6             	test   r14d,r14d
   14000a24e:	0f 84 91 00 00 00    	je     14000a2e5 <__hexnan_D2A+0x216>
   14000a254:	48 39 d3             	cmp    rbx,rdx
   14000a257:	73 0e                	jae    14000a267 <__hexnan_D2A+0x198>
   14000a259:	41 83 f8 07          	cmp    r8d,0x7
   14000a25d:	7f 08                	jg     14000a267 <__hexnan_D2A+0x198>
   14000a25f:	48 89 d9             	mov    rcx,rbx
   14000a262:	e8 29 fe ff ff       	call   14000a090 <.text>
   14000a267:	48 39 dd             	cmp    rbp,rbx
   14000a26a:	73 47                	jae    14000a2b3 <__hexnan_D2A+0x1e4>
   14000a26c:	31 c0                	xor    eax,eax
   14000a26e:	8b 14 03             	mov    edx,DWORD PTR [rbx+rax*1]
   14000a271:	89 54 05 00          	mov    DWORD PTR [rbp+rax*1+0x0],edx
   14000a275:	48 83 c0 04          	add    rax,0x4
   14000a279:	48 8d 14 03          	lea    rdx,[rbx+rax*1]
   14000a27d:	48 39 d7             	cmp    rdi,rdx
   14000a280:	73 ec                	jae    14000a26e <__hexnan_D2A+0x19f>
   14000a282:	48 89 f8             	mov    rax,rdi
   14000a285:	49 83 ed 03          	sub    r13,0x3
   14000a289:	31 d2                	xor    edx,edx
   14000a28b:	48 29 d8             	sub    rax,rbx
   14000a28e:	48 ff c3             	inc    rbx
   14000a291:	48 83 e0 fc          	and    rax,0xfffffffffffffffc
   14000a295:	49 39 dd             	cmp    r13,rbx
   14000a298:	48 0f 42 c2          	cmovb  rax,rdx
   14000a29c:	48 8d 44 05 04       	lea    rax,[rbp+rax*1+0x4]
   14000a2a1:	48 89 c2             	mov    rdx,rax
   14000a2a4:	31 c9                	xor    ecx,ecx
   14000a2a6:	48 83 c0 04          	add    rax,0x4
   14000a2aa:	89 0a                	mov    DWORD PTR [rdx],ecx
   14000a2ac:	48 39 c7             	cmp    rdi,rax
   14000a2af:	73 f0                	jae    14000a2a1 <__hexnan_D2A+0x1d2>
   14000a2b1:	eb 15                	jmp    14000a2c8 <__hexnan_D2A+0x1f9>
   14000a2b3:	45 85 e4             	test   r12d,r12d
   14000a2b6:	74 10                	je     14000a2c8 <__hexnan_D2A+0x1f9>
   14000a2b8:	44 89 e1             	mov    ecx,r12d
   14000a2bb:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000a2c0:	f7 d9                	neg    ecx
   14000a2c2:	d3 e8                	shr    eax,cl
   14000a2c4:	41 21 45 fc          	and    DWORD PTR [r13-0x4],eax
   14000a2c8:	83 3f 00             	cmp    DWORD PTR [rdi],0x0
   14000a2cb:	75 0b                	jne    14000a2d8 <__hexnan_D2A+0x209>
   14000a2cd:	48 39 ef             	cmp    rdi,rbp
   14000a2d0:	75 0d                	jne    14000a2df <__hexnan_D2A+0x210>
   14000a2d2:	c7 07 01 00 00 00    	mov    DWORD PTR [rdi],0x1
   14000a2d8:	b8 05 00 00 00       	mov    eax,0x5
   14000a2dd:	eb 0b                	jmp    14000a2ea <__hexnan_D2A+0x21b>
   14000a2df:	48 83 ef 04          	sub    rdi,0x4
   14000a2e3:	eb e3                	jmp    14000a2c8 <__hexnan_D2A+0x1f9>
   14000a2e5:	b8 04 00 00 00       	mov    eax,0x4
   14000a2ea:	48 83 c4 38          	add    rsp,0x38
   14000a2ee:	5b                   	pop    rbx
   14000a2ef:	5e                   	pop    rsi
   14000a2f0:	5f                   	pop    rdi
   14000a2f1:	5d                   	pop    rbp
   14000a2f2:	41 5c                	pop    r12
   14000a2f4:	41 5d                	pop    r13
   14000a2f6:	41 5e                	pop    r14
   14000a2f8:	41 5f                	pop    r15
   14000a2fa:	c3                   	ret
   14000a2fb:	90                   	nop
   14000a2fc:	90                   	nop
   14000a2fd:	90                   	nop
   14000a2fe:	90                   	nop
   14000a2ff:	90                   	nop

000000014000a300 <__s2b_D2A>:
   14000a300:	41 56                	push   r14
   14000a302:	41 55                	push   r13
   14000a304:	41 54                	push   r12
   14000a306:	55                   	push   rbp
   14000a307:	57                   	push   rdi
   14000a308:	56                   	push   rsi
   14000a309:	53                   	push   rbx
   14000a30a:	48 83 ec 20          	sub    rsp,0x20
   14000a30e:	41 8d 40 08          	lea    eax,[r8+0x8]
   14000a312:	48 89 cb             	mov    rbx,rcx
   14000a315:	89 d6                	mov    esi,edx
   14000a317:	b9 09 00 00 00       	mov    ecx,0x9
   14000a31c:	99                   	cdq
   14000a31d:	44 89 c7             	mov    edi,r8d
   14000a320:	44 89 cd             	mov    ebp,r9d
   14000a323:	f7 f9                	idiv   ecx
   14000a325:	ba 01 00 00 00       	mov    edx,0x1
   14000a32a:	31 c9                	xor    ecx,ecx
   14000a32c:	39 c2                	cmp    edx,eax
   14000a32e:	7d 06                	jge    14000a336 <__s2b_D2A+0x36>
   14000a330:	01 d2                	add    edx,edx
   14000a332:	ff c1                	inc    ecx
   14000a334:	eb f6                	jmp    14000a32c <__s2b_D2A+0x2c>
   14000a336:	e8 a8 d3 ff ff       	call   1400076e3 <__Balloc_D2A>
   14000a33b:	4c 63 a4 24 80 00 00 	movsxd r12,DWORD PTR [rsp+0x80]
   14000a342:	00 
   14000a343:	89 68 18             	mov    DWORD PTR [rax+0x18],ebp
   14000a346:	48 89 c1             	mov    rcx,rax
   14000a349:	c7 40 14 01 00 00 00 	mov    DWORD PTR [rax+0x14],0x1
   14000a350:	83 fe 09             	cmp    esi,0x9
   14000a353:	7e 35                	jle    14000a38a <__s2b_D2A+0x8a>
   14000a355:	44 8d 6e f6          	lea    r13d,[rsi-0xa]
   14000a359:	48 8d 6b 0a          	lea    rbp,[rbx+0xa]
   14000a35d:	4e 8d 74 2b 0b       	lea    r14,[rbx+r13*1+0xb]
   14000a362:	44 0f be 45 ff       	movsx  r8d,BYTE PTR [rbp-0x1]
   14000a367:	ba 0a 00 00 00       	mov    edx,0xa
   14000a36c:	48 ff c5             	inc    rbp
   14000a36f:	41 83 e8 30          	sub    r8d,0x30
   14000a373:	e8 6d d4 ff ff       	call   1400077e5 <__multadd_D2A>
   14000a378:	48 89 c1             	mov    rcx,rax
   14000a37b:	4c 39 f5             	cmp    rbp,r14
   14000a37e:	75 e2                	jne    14000a362 <__s2b_D2A+0x62>
   14000a380:	4a 8d 5c 2b 0a       	lea    rbx,[rbx+r13*1+0xa]
   14000a385:	4c 01 e3             	add    rbx,r12
   14000a388:	eb 0a                	jmp    14000a394 <__s2b_D2A+0x94>
   14000a38a:	4a 8d 5c 23 09       	lea    rbx,[rbx+r12*1+0x9]
   14000a38f:	be 09 00 00 00       	mov    esi,0x9
   14000a394:	29 de                	sub    esi,ebx
   14000a396:	8d 04 1e             	lea    eax,[rsi+rbx*1]
   14000a399:	39 c7                	cmp    edi,eax
   14000a39b:	7e 1a                	jle    14000a3b7 <__s2b_D2A+0xb7>
   14000a39d:	44 0f be 03          	movsx  r8d,BYTE PTR [rbx]
   14000a3a1:	ba 0a 00 00 00       	mov    edx,0xa
   14000a3a6:	48 ff c3             	inc    rbx
   14000a3a9:	41 83 e8 30          	sub    r8d,0x30
   14000a3ad:	e8 33 d4 ff ff       	call   1400077e5 <__multadd_D2A>
   14000a3b2:	48 89 c1             	mov    rcx,rax
   14000a3b5:	eb df                	jmp    14000a396 <__s2b_D2A+0x96>
   14000a3b7:	48 89 c8             	mov    rax,rcx
   14000a3ba:	48 83 c4 20          	add    rsp,0x20
   14000a3be:	5b                   	pop    rbx
   14000a3bf:	5e                   	pop    rsi
   14000a3c0:	5f                   	pop    rdi
   14000a3c1:	5d                   	pop    rbp
   14000a3c2:	41 5c                	pop    r12
   14000a3c4:	41 5d                	pop    r13
   14000a3c6:	41 5e                	pop    r14
   14000a3c8:	c3                   	ret

000000014000a3c9 <__ratio_D2A>:
   14000a3c9:	57                   	push   rdi
   14000a3ca:	56                   	push   rsi
   14000a3cb:	53                   	push   rbx
   14000a3cc:	48 83 ec 30          	sub    rsp,0x30
   14000a3d0:	48 89 d6             	mov    rsi,rdx
   14000a3d3:	48 8d 54 24 28       	lea    rdx,[rsp+0x28]
   14000a3d8:	48 89 cf             	mov    rdi,rcx
   14000a3db:	e8 6e d9 ff ff       	call   140007d4e <__b2d_D2A>
   14000a3e0:	48 8d 54 24 2c       	lea    rdx,[rsp+0x2c]
   14000a3e5:	48 89 f1             	mov    rcx,rsi
   14000a3e8:	66 48 0f 7e c3       	movq   rbx,xmm0
   14000a3ed:	e8 5c d9 ff ff       	call   140007d4e <__b2d_D2A>
   14000a3f2:	8b 47 14             	mov    eax,DWORD PTR [rdi+0x14]
   14000a3f5:	2b 46 14             	sub    eax,DWORD PTR [rsi+0x14]
   14000a3f8:	c1 e0 05             	shl    eax,0x5
   14000a3fb:	03 44 24 28          	add    eax,DWORD PTR [rsp+0x28]
   14000a3ff:	66 48 0f 7e c2       	movq   rdx,xmm0
   14000a404:	2b 44 24 2c          	sub    eax,DWORD PTR [rsp+0x2c]
   14000a408:	85 c0                	test   eax,eax
   14000a40a:	7e 19                	jle    14000a425 <__ratio_D2A+0x5c>
   14000a40c:	48 89 d9             	mov    rcx,rbx
   14000a40f:	c1 e0 14             	shl    eax,0x14
   14000a412:	89 db                	mov    ebx,ebx
   14000a414:	48 c1 e9 20          	shr    rcx,0x20
   14000a418:	01 c8                	add    eax,ecx
   14000a41a:	89 c0                	mov    eax,eax
   14000a41c:	48 c1 e0 20          	shl    rax,0x20
   14000a420:	48 09 c3             	or     rbx,rax
   14000a423:	eb 1a                	jmp    14000a43f <__ratio_D2A+0x76>
   14000a425:	69 c0 00 00 f0 ff    	imul   eax,eax,0xfff00000
   14000a42b:	48 89 d1             	mov    rcx,rdx
   14000a42e:	89 d2                	mov    edx,edx
   14000a430:	48 c1 e9 20          	shr    rcx,0x20
   14000a434:	01 c8                	add    eax,ecx
   14000a436:	89 c0                	mov    eax,eax
   14000a438:	48 c1 e0 20          	shl    rax,0x20
   14000a43c:	48 09 c2             	or     rdx,rax
   14000a43f:	66 48 0f 6e c3       	movq   xmm0,rbx
   14000a444:	66 48 0f 6e ca       	movq   xmm1,rdx
   14000a449:	f2 0f 5e c1          	divsd  xmm0,xmm1
   14000a44d:	48 83 c4 30          	add    rsp,0x30
   14000a451:	5b                   	pop    rbx
   14000a452:	5e                   	pop    rsi
   14000a453:	5f                   	pop    rdi
   14000a454:	c3                   	ret

000000014000a455 <__match_D2A>:
   14000a455:	48 8b 01             	mov    rax,QWORD PTR [rcx]
   14000a458:	44 0f be 0a          	movsx  r9d,BYTE PTR [rdx]
   14000a45c:	48 ff c0             	inc    rax
   14000a45f:	45 85 c9             	test   r9d,r9d
   14000a462:	74 1e                	je     14000a482 <__match_D2A+0x2d>
   14000a464:	44 0f be 00          	movsx  r8d,BYTE PTR [rax]
   14000a468:	48 ff c2             	inc    rdx
   14000a46b:	45 8d 50 bf          	lea    r10d,[r8-0x41]
   14000a46f:	41 83 fa 19          	cmp    r10d,0x19
   14000a473:	77 04                	ja     14000a479 <__match_D2A+0x24>
   14000a475:	41 83 c0 20          	add    r8d,0x20
   14000a479:	45 39 c8             	cmp    r8d,r9d
   14000a47c:	74 da                	je     14000a458 <__match_D2A+0x3>
   14000a47e:	31 c0                	xor    eax,eax
   14000a480:	eb 08                	jmp    14000a48a <__match_D2A+0x35>
   14000a482:	48 89 01             	mov    QWORD PTR [rcx],rax
   14000a485:	b8 01 00 00 00       	mov    eax,0x1
   14000a48a:	c3                   	ret

000000014000a48b <__copybits_D2A>:
   14000a48b:	57                   	push   rdi
   14000a48c:	56                   	push   rsi
   14000a48d:	ff ca                	dec    edx
   14000a48f:	48 89 c8             	mov    rax,rcx
   14000a492:	49 8d 70 18          	lea    rsi,[r8+0x18]
   14000a496:	c1 fa 05             	sar    edx,0x5
   14000a499:	48 89 c7             	mov    rdi,rax
   14000a49c:	ff c2                	inc    edx
   14000a49e:	48 63 d2             	movsxd rdx,edx
   14000a4a1:	4c 8d 0c 91          	lea    r9,[rcx+rdx*4]
   14000a4a5:	49 63 50 14          	movsxd rdx,DWORD PTR [r8+0x14]
   14000a4a9:	48 8d 0c 96          	lea    rcx,[rsi+rdx*4]
   14000a4ad:	48 39 ce             	cmp    rsi,rcx
   14000a4b0:	73 03                	jae    14000a4b5 <__copybits_D2A+0x2a>
   14000a4b2:	a5                   	movs   DWORD PTR es:[rdi],DWORD PTR ds:[rsi]
   14000a4b3:	eb f8                	jmp    14000a4ad <__copybits_D2A+0x22>
   14000a4b5:	48 89 ca             	mov    rdx,rcx
   14000a4b8:	4c 29 c2             	sub    rdx,r8
   14000a4bb:	49 83 c0 15          	add    r8,0x15
   14000a4bf:	48 83 ea 15          	sub    rdx,0x15
   14000a4c3:	48 83 e2 fc          	and    rdx,0xfffffffffffffffc
   14000a4c7:	4c 39 c1             	cmp    rcx,r8
   14000a4ca:	b9 00 00 00 00       	mov    ecx,0x0
   14000a4cf:	48 0f 42 d1          	cmovb  rdx,rcx
   14000a4d3:	48 01 d0             	add    rax,rdx
   14000a4d6:	4c 39 c8             	cmp    rax,r9
   14000a4d9:	73 0b                	jae    14000a4e6 <__copybits_D2A+0x5b>
   14000a4db:	31 d2                	xor    edx,edx
   14000a4dd:	48 83 c0 04          	add    rax,0x4
   14000a4e1:	89 50 fc             	mov    DWORD PTR [rax-0x4],edx
   14000a4e4:	eb f0                	jmp    14000a4d6 <__copybits_D2A+0x4b>
   14000a4e6:	5e                   	pop    rsi
   14000a4e7:	5f                   	pop    rdi
   14000a4e8:	c3                   	ret

000000014000a4e9 <__any_on_D2A>:
   14000a4e9:	4c 8d 41 18          	lea    r8,[rcx+0x18]
   14000a4ed:	89 d0                	mov    eax,edx
   14000a4ef:	8b 49 14             	mov    ecx,DWORD PTR [rcx+0x14]
   14000a4f2:	c1 f8 05             	sar    eax,0x5
   14000a4f5:	39 c1                	cmp    ecx,eax
   14000a4f7:	7c 23                	jl     14000a51c <__any_on_D2A+0x33>
   14000a4f9:	7e 23                	jle    14000a51e <__any_on_D2A+0x35>
   14000a4fb:	83 e2 1f             	and    edx,0x1f
   14000a4fe:	89 d1                	mov    ecx,edx
   14000a500:	74 1c                	je     14000a51e <__any_on_D2A+0x35>
   14000a502:	48 63 d0             	movsxd rdx,eax
   14000a505:	45 8b 0c 90          	mov    r9d,DWORD PTR [r8+rdx*4]
   14000a509:	44 89 ca             	mov    edx,r9d
   14000a50c:	d3 ea                	shr    edx,cl
   14000a50e:	d3 e2                	shl    edx,cl
   14000a510:	41 39 d1             	cmp    r9d,edx
   14000a513:	ba 01 00 00 00       	mov    edx,0x1
   14000a518:	75 21                	jne    14000a53b <__any_on_D2A+0x52>
   14000a51a:	eb 02                	jmp    14000a51e <__any_on_D2A+0x35>
   14000a51c:	89 c8                	mov    eax,ecx
   14000a51e:	48 98                	cdqe
   14000a520:	49 8d 04 80          	lea    rax,[r8+rax*4]
   14000a524:	49 39 c0             	cmp    r8,rax
   14000a527:	73 10                	jae    14000a539 <__any_on_D2A+0x50>
   14000a529:	48 83 e8 04          	sub    rax,0x4
   14000a52d:	83 38 00             	cmp    DWORD PTR [rax],0x0
   14000a530:	74 f2                	je     14000a524 <__any_on_D2A+0x3b>
   14000a532:	ba 01 00 00 00       	mov    edx,0x1
   14000a537:	eb 02                	jmp    14000a53b <__any_on_D2A+0x52>
   14000a539:	31 d2                	xor    edx,edx
   14000a53b:	89 d0                	mov    eax,edx
   14000a53d:	c3                   	ret
   14000a53e:	90                   	nop
   14000a53f:	90                   	nop

000000014000a540 <wcsnlen>:
   14000a540:	31 c0                	xor    eax,eax
   14000a542:	48 39 d0             	cmp    rax,rdx
   14000a545:	74 0c                	je     14000a553 <wcsnlen+0x13>
   14000a547:	66 83 3c 41 00       	cmp    WORD PTR [rcx+rax*2],0x0
   14000a54c:	74 05                	je     14000a553 <wcsnlen+0x13>
   14000a54e:	48 ff c0             	inc    rax
   14000a551:	eb ef                	jmp    14000a542 <wcsnlen+0x2>
   14000a553:	c3                   	ret
   14000a554:	90                   	nop
   14000a555:	90                   	nop
   14000a556:	90                   	nop
   14000a557:	90                   	nop
   14000a558:	90                   	nop
   14000a559:	90                   	nop
   14000a55a:	90                   	nop
   14000a55b:	90                   	nop
   14000a55c:	90                   	nop
   14000a55d:	90                   	nop
   14000a55e:	90                   	nop
   14000a55f:	90                   	nop

000000014000a560 <__wcrtomb_cp>:
   14000a560:	48 83 ec 58          	sub    rsp,0x58
   14000a564:	48 89 c8             	mov    rax,rcx
   14000a567:	66 89 54 24 68       	mov    WORD PTR [rsp+0x68],dx
   14000a56c:	44 89 c1             	mov    ecx,r8d
   14000a56f:	45 85 c0             	test   r8d,r8d
   14000a572:	75 10                	jne    14000a584 <__wcrtomb_cp+0x24>
   14000a574:	66 81 fa ff 00       	cmp    dx,0xff
   14000a579:	77 49                	ja     14000a5c4 <__wcrtomb_cp+0x64>
   14000a57b:	88 10                	mov    BYTE PTR [rax],dl
   14000a57d:	b8 01 00 00 00       	mov    eax,0x1
   14000a582:	eb 50                	jmp    14000a5d4 <__wcrtomb_cp+0x74>
   14000a584:	31 d2                	xor    edx,edx
   14000a586:	45 31 c0             	xor    r8d,r8d
   14000a589:	44 89 4c 24 28       	mov    DWORD PTR [rsp+0x28],r9d
   14000a58e:	41 b9 01 00 00 00    	mov    r9d,0x1
   14000a594:	89 54 24 4c          	mov    DWORD PTR [rsp+0x4c],edx
   14000a598:	48 8d 54 24 4c       	lea    rdx,[rsp+0x4c]
   14000a59d:	48 89 54 24 38       	mov    QWORD PTR [rsp+0x38],rdx
   14000a5a2:	31 d2                	xor    edx,edx
   14000a5a4:	4c 89 44 24 30       	mov    QWORD PTR [rsp+0x30],r8
   14000a5a9:	4c 8d 44 24 68       	lea    r8,[rsp+0x68]
   14000a5ae:	48 89 44 24 20       	mov    QWORD PTR [rsp+0x20],rax
   14000a5b3:	ff 15 c7 6c 00 00    	call   QWORD PTR [rip+0x6cc7]        # 140011280 <__imp_WideCharToMultiByte>
   14000a5b9:	85 c0                	test   eax,eax
   14000a5bb:	74 07                	je     14000a5c4 <__wcrtomb_cp+0x64>
   14000a5bd:	83 7c 24 4c 00       	cmp    DWORD PTR [rsp+0x4c],0x0
   14000a5c2:	74 10                	je     14000a5d4 <__wcrtomb_cp+0x74>
   14000a5c4:	e8 9f 05 00 00       	call   14000ab68 <_errno>
   14000a5c9:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   14000a5cf:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000a5d4:	48 83 c4 58          	add    rsp,0x58
   14000a5d8:	c3                   	ret

000000014000a5d9 <wcrtomb>:
   14000a5d9:	57                   	push   rdi
   14000a5da:	56                   	push   rsi
   14000a5db:	53                   	push   rbx
   14000a5dc:	48 83 ec 30          	sub    rsp,0x30
   14000a5e0:	48 89 cb             	mov    rbx,rcx
   14000a5e3:	89 d6                	mov    esi,edx
   14000a5e5:	48 85 c9             	test   rcx,rcx
   14000a5e8:	75 05                	jne    14000a5ef <wcrtomb+0x16>
   14000a5ea:	48 8d 5c 24 2b       	lea    rbx,[rsp+0x2b]
   14000a5ef:	e8 3c 05 00 00       	call   14000ab30 <___mb_cur_max_func>
   14000a5f4:	89 c7                	mov    edi,eax
   14000a5f6:	e8 2d 05 00 00       	call   14000ab28 <___lc_codepage_func>
   14000a5fb:	0f b7 d6             	movzx  edx,si
   14000a5fe:	41 89 f9             	mov    r9d,edi
   14000a601:	48 89 d9             	mov    rcx,rbx
   14000a604:	41 89 c0             	mov    r8d,eax
   14000a607:	e8 54 ff ff ff       	call   14000a560 <__wcrtomb_cp>
   14000a60c:	48 98                	cdqe
   14000a60e:	48 83 c4 30          	add    rsp,0x30
   14000a612:	5b                   	pop    rbx
   14000a613:	5e                   	pop    rsi
   14000a614:	5f                   	pop    rdi
   14000a615:	c3                   	ret

000000014000a616 <wcsrtombs>:
   14000a616:	41 56                	push   r14
   14000a618:	41 55                	push   r13
   14000a61a:	41 54                	push   r12
   14000a61c:	55                   	push   rbp
   14000a61d:	57                   	push   rdi
   14000a61e:	56                   	push   rsi
   14000a61f:	53                   	push   rbx
   14000a620:	48 83 ec 30          	sub    rsp,0x30
   14000a624:	31 db                	xor    ebx,ebx
   14000a626:	49 89 d5             	mov    r13,rdx
   14000a629:	49 89 cc             	mov    r12,rcx
   14000a62c:	4d 89 c6             	mov    r14,r8
   14000a62f:	e8 f4 04 00 00       	call   14000ab28 <___lc_codepage_func>
   14000a634:	89 c7                	mov    edi,eax
   14000a636:	e8 f5 04 00 00       	call   14000ab30 <___mb_cur_max_func>
   14000a63b:	49 8b 75 00          	mov    rsi,QWORD PTR [r13+0x0]
   14000a63f:	89 c5                	mov    ebp,eax
   14000a641:	48 85 f6             	test   rsi,rsi
   14000a644:	74 7d                	je     14000a6c3 <wcsrtombs+0xad>
   14000a646:	4d 85 e4             	test   r12,r12
   14000a649:	74 53                	je     14000a69e <wcsrtombs+0x88>
   14000a64b:	4c 39 f3             	cmp    rbx,r14
   14000a64e:	73 33                	jae    14000a683 <wcsrtombs+0x6d>
   14000a650:	0f b7 16             	movzx  edx,WORD PTR [rsi]
   14000a653:	41 89 e9             	mov    r9d,ebp
   14000a656:	41 89 f8             	mov    r8d,edi
   14000a659:	4c 89 e1             	mov    rcx,r12
   14000a65c:	e8 ff fe ff ff       	call   14000a560 <__wcrtomb_cp>
   14000a661:	85 c0                	test   eax,eax
   14000a663:	7e 57                	jle    14000a6bc <wcsrtombs+0xa6>
   14000a665:	48 98                	cdqe
   14000a667:	49 01 c4             	add    r12,rax
   14000a66a:	48 01 c3             	add    rbx,rax
   14000a66d:	41 80 7c 24 ff 00    	cmp    BYTE PTR [r12-0x1],0x0
   14000a673:	75 08                	jne    14000a67d <wcsrtombs+0x67>
   14000a675:	31 c0                	xor    eax,eax
   14000a677:	49 89 45 00          	mov    QWORD PTR [r13+0x0],rax
   14000a67b:	eb 3a                	jmp    14000a6b7 <wcsrtombs+0xa1>
   14000a67d:	48 83 c6 02          	add    rsi,0x2
   14000a681:	eb c8                	jmp    14000a64b <wcsrtombs+0x35>
   14000a683:	49 89 75 00          	mov    QWORD PTR [r13+0x0],rsi
   14000a687:	eb 3a                	jmp    14000a6c3 <wcsrtombs+0xad>
   14000a689:	48 63 d0             	movsxd rdx,eax
   14000a68c:	ff c8                	dec    eax
   14000a68e:	48 98                	cdqe
   14000a690:	48 01 d3             	add    rbx,rdx
   14000a693:	80 7c 04 2b 00       	cmp    BYTE PTR [rsp+rax*1+0x2b],0x0
   14000a698:	74 1d                	je     14000a6b7 <wcsrtombs+0xa1>
   14000a69a:	48 83 c6 02          	add    rsi,0x2
   14000a69e:	0f b7 16             	movzx  edx,WORD PTR [rsi]
   14000a6a1:	41 89 e9             	mov    r9d,ebp
   14000a6a4:	41 89 f8             	mov    r8d,edi
   14000a6a7:	48 8d 4c 24 2b       	lea    rcx,[rsp+0x2b]
   14000a6ac:	e8 af fe ff ff       	call   14000a560 <__wcrtomb_cp>
   14000a6b1:	85 c0                	test   eax,eax
   14000a6b3:	7f d4                	jg     14000a689 <wcsrtombs+0x73>
   14000a6b5:	eb 05                	jmp    14000a6bc <wcsrtombs+0xa6>
   14000a6b7:	48 ff cb             	dec    rbx
   14000a6ba:	eb 07                	jmp    14000a6c3 <wcsrtombs+0xad>
   14000a6bc:	48 c7 c3 ff ff ff ff 	mov    rbx,0xffffffffffffffff
   14000a6c3:	48 89 d8             	mov    rax,rbx
   14000a6c6:	48 83 c4 30          	add    rsp,0x30
   14000a6ca:	5b                   	pop    rbx
   14000a6cb:	5e                   	pop    rsi
   14000a6cc:	5f                   	pop    rdi
   14000a6cd:	5d                   	pop    rbp
   14000a6ce:	41 5c                	pop    r12
   14000a6d0:	41 5d                	pop    r13
   14000a6d2:	41 5e                	pop    r14
   14000a6d4:	c3                   	ret
   14000a6d5:	90                   	nop
   14000a6d6:	90                   	nop
   14000a6d7:	90                   	nop
   14000a6d8:	90                   	nop
   14000a6d9:	90                   	nop
   14000a6da:	90                   	nop
   14000a6db:	90                   	nop
   14000a6dc:	90                   	nop
   14000a6dd:	90                   	nop
   14000a6de:	90                   	nop
   14000a6df:	90                   	nop

000000014000a6e0 <strnlen>:
   14000a6e0:	48 89 c8             	mov    rax,rcx
   14000a6e3:	49 89 c0             	mov    r8,rax
   14000a6e6:	49 29 c8             	sub    r8,rcx
   14000a6e9:	49 39 d0             	cmp    r8,rdx
   14000a6ec:	73 0a                	jae    14000a6f8 <strnlen+0x18>
   14000a6ee:	80 38 00             	cmp    BYTE PTR [rax],0x0
   14000a6f1:	74 05                	je     14000a6f8 <strnlen+0x18>
   14000a6f3:	48 ff c0             	inc    rax
   14000a6f6:	eb eb                	jmp    14000a6e3 <strnlen+0x3>
   14000a6f8:	4c 89 c0             	mov    rax,r8
   14000a6fb:	c3                   	ret
   14000a6fc:	90                   	nop
   14000a6fd:	90                   	nop
   14000a6fe:	90                   	nop
   14000a6ff:	90                   	nop

000000014000a700 <__mbrtowc_cp>:
   14000a700:	55                   	push   rbp
   14000a701:	57                   	push   rdi
   14000a702:	56                   	push   rsi
   14000a703:	53                   	push   rbx
   14000a704:	48 83 ec 48          	sub    rsp,0x48
   14000a708:	48 89 ce             	mov    rsi,rcx
   14000a70b:	48 89 d3             	mov    rbx,rdx
   14000a70e:	8b 8c 24 90 00 00 00 	mov    ecx,DWORD PTR [rsp+0x90]
   14000a715:	4c 89 c5             	mov    rbp,r8
   14000a718:	4c 89 cf             	mov    rdi,r9
   14000a71b:	48 85 d2             	test   rdx,rdx
   14000a71e:	74 21                	je     14000a741 <__mbrtowc_cp+0x41>
   14000a720:	4d 85 c0             	test   r8,r8
   14000a723:	0f 84 87 00 00 00    	je     14000a7b0 <__mbrtowc_cp+0xb0>
   14000a729:	31 d2                	xor    edx,edx
   14000a72b:	41 8b 01             	mov    eax,DWORD PTR [r9]
   14000a72e:	41 89 11             	mov    DWORD PTR [r9],edx
   14000a731:	0f b6 13             	movzx  edx,BYTE PTR [rbx]
   14000a734:	89 44 24 3c          	mov    DWORD PTR [rsp+0x3c],eax
   14000a738:	84 d2                	test   dl,dl
   14000a73a:	75 0c                	jne    14000a748 <__mbrtowc_cp+0x48>
   14000a73c:	66 c7 06 00 00       	mov    WORD PTR [rsi],0x0
   14000a741:	31 c0                	xor    eax,eax
   14000a743:	e9 cd 00 00 00       	jmp    14000a815 <__mbrtowc_cp+0x115>
   14000a748:	83 bc 24 98 00 00 00 	cmp    DWORD PTR [rsp+0x98],0x1
   14000a74f:	01 
   14000a750:	0f 86 b0 00 00 00    	jbe    14000a806 <__mbrtowc_cp+0x106>
   14000a756:	84 c0                	test   al,al
   14000a758:	74 35                	je     14000a78f <__mbrtowc_cp+0x8f>
   14000a75a:	88 54 24 3d          	mov    BYTE PTR [rsp+0x3d],dl
   14000a75e:	41 b9 02 00 00 00    	mov    r9d,0x2
   14000a764:	4c 8d 44 24 3c       	lea    r8,[rsp+0x3c]
   14000a769:	c7 44 24 28 01 00 00 	mov    DWORD PTR [rsp+0x28],0x1
   14000a770:	00 
   14000a771:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000a776:	ba 08 00 00 00       	mov    edx,0x8
   14000a77b:	ff 15 cf 6a 00 00    	call   QWORD PTR [rip+0x6acf]        # 140011250 <__imp_MultiByteToWideChar>
   14000a781:	85 c0                	test   eax,eax
   14000a783:	74 6f                	je     14000a7f4 <__mbrtowc_cp+0xf4>
   14000a785:	b8 02 00 00 00       	mov    eax,0x2
   14000a78a:	e9 86 00 00 00       	jmp    14000a815 <__mbrtowc_cp+0x115>
   14000a78f:	89 8c 24 90 00 00 00 	mov    DWORD PTR [rsp+0x90],ecx
   14000a796:	ff 15 a4 6a 00 00    	call   QWORD PTR [rip+0x6aa4]        # 140011240 <__imp_IsDBCSLeadByteEx>
   14000a79c:	8b 8c 24 90 00 00 00 	mov    ecx,DWORD PTR [rsp+0x90]
   14000a7a3:	85 c0                	test   eax,eax
   14000a7a5:	74 5f                	je     14000a806 <__mbrtowc_cp+0x106>
   14000a7a7:	48 ff cd             	dec    rbp
   14000a7aa:	75 0b                	jne    14000a7b7 <__mbrtowc_cp+0xb7>
   14000a7ac:	8a 03                	mov    al,BYTE PTR [rbx]
   14000a7ae:	88 07                	mov    BYTE PTR [rdi],al
   14000a7b0:	b8 fe ff ff ff       	mov    eax,0xfffffffe
   14000a7b5:	eb 5e                	jmp    14000a815 <__mbrtowc_cp+0x115>
   14000a7b7:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000a7bc:	41 b9 02 00 00 00    	mov    r9d,0x2
   14000a7c2:	49 89 d8             	mov    r8,rbx
   14000a7c5:	c7 44 24 28 01 00 00 	mov    DWORD PTR [rsp+0x28],0x1
   14000a7cc:	00 
   14000a7cd:	eb a7                	jmp    14000a776 <__mbrtowc_cp+0x76>
   14000a7cf:	c7 44 24 28 01 00 00 	mov    DWORD PTR [rsp+0x28],0x1
   14000a7d6:	00 
   14000a7d7:	41 b9 01 00 00 00    	mov    r9d,0x1
   14000a7dd:	49 89 d8             	mov    r8,rbx
   14000a7e0:	ba 08 00 00 00       	mov    edx,0x8
   14000a7e5:	48 89 74 24 20       	mov    QWORD PTR [rsp+0x20],rsi
   14000a7ea:	ff 15 60 6a 00 00    	call   QWORD PTR [rip+0x6a60]        # 140011250 <__imp_MultiByteToWideChar>
   14000a7f0:	85 c0                	test   eax,eax
   14000a7f2:	75 1c                	jne    14000a810 <__mbrtowc_cp+0x110>
   14000a7f4:	e8 6f 03 00 00       	call   14000ab68 <_errno>
   14000a7f9:	c7 00 2a 00 00 00    	mov    DWORD PTR [rax],0x2a
   14000a7ff:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000a804:	eb 0f                	jmp    14000a815 <__mbrtowc_cp+0x115>
   14000a806:	85 c9                	test   ecx,ecx
   14000a808:	75 c5                	jne    14000a7cf <__mbrtowc_cp+0xcf>
   14000a80a:	0f b6 03             	movzx  eax,BYTE PTR [rbx]
   14000a80d:	66 89 06             	mov    WORD PTR [rsi],ax
   14000a810:	b8 01 00 00 00       	mov    eax,0x1
   14000a815:	48 83 c4 48          	add    rsp,0x48
   14000a819:	5b                   	pop    rbx
   14000a81a:	5e                   	pop    rsi
   14000a81b:	5f                   	pop    rdi
   14000a81c:	5d                   	pop    rbp
   14000a81d:	c3                   	ret

000000014000a81e <mbrtowc>:
   14000a81e:	41 54                	push   r12
   14000a820:	55                   	push   rbp
   14000a821:	57                   	push   rdi
   14000a822:	56                   	push   rsi
   14000a823:	53                   	push   rbx
   14000a824:	48 83 ec 40          	sub    rsp,0x40
   14000a828:	66 c7 44 24 3e 00 00 	mov    WORD PTR [rsp+0x3e],0x0
   14000a82f:	48 89 cb             	mov    rbx,rcx
   14000a832:	48 89 d7             	mov    rdi,rdx
   14000a835:	4c 89 c5             	mov    rbp,r8
   14000a838:	4c 89 ce             	mov    rsi,r9
   14000a83b:	48 85 c9             	test   rcx,rcx
   14000a83e:	75 05                	jne    14000a845 <mbrtowc+0x27>
   14000a840:	48 8d 5c 24 3e       	lea    rbx,[rsp+0x3e]
   14000a845:	e8 e6 02 00 00       	call   14000ab30 <___mb_cur_max_func>
   14000a84a:	41 89 c4             	mov    r12d,eax
   14000a84d:	e8 d6 02 00 00       	call   14000ab28 <___lc_codepage_func>
   14000a852:	48 85 f6             	test   rsi,rsi
   14000a855:	75 07                	jne    14000a85e <mbrtowc+0x40>
   14000a857:	48 8d 35 0a 63 00 00 	lea    rsi,[rip+0x630a]        # 140010b68 <internal_mbstate.2>
   14000a85e:	44 89 64 24 28       	mov    DWORD PTR [rsp+0x28],r12d
   14000a863:	49 89 f1             	mov    r9,rsi
   14000a866:	49 89 e8             	mov    r8,rbp
   14000a869:	48 89 fa             	mov    rdx,rdi
   14000a86c:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14000a870:	48 89 d9             	mov    rcx,rbx
   14000a873:	e8 88 fe ff ff       	call   14000a700 <__mbrtowc_cp>
   14000a878:	48 98                	cdqe
   14000a87a:	48 83 c4 40          	add    rsp,0x40
   14000a87e:	5b                   	pop    rbx
   14000a87f:	5e                   	pop    rsi
   14000a880:	5f                   	pop    rdi
   14000a881:	5d                   	pop    rbp
   14000a882:	41 5c                	pop    r12
   14000a884:	c3                   	ret

000000014000a885 <mbsrtowcs>:
   14000a885:	41 56                	push   r14
   14000a887:	41 55                	push   r13
   14000a889:	41 54                	push   r12
   14000a88b:	55                   	push   rbp
   14000a88c:	57                   	push   rdi
   14000a88d:	56                   	push   rsi
   14000a88e:	53                   	push   rbx
   14000a88f:	48 83 ec 40          	sub    rsp,0x40
   14000a893:	48 89 cd             	mov    rbp,rcx
   14000a896:	48 89 d6             	mov    rsi,rdx
   14000a899:	4d 89 c4             	mov    r12,r8
   14000a89c:	4c 89 cf             	mov    rdi,r9
   14000a89f:	4d 85 c9             	test   r9,r9
   14000a8a2:	75 07                	jne    14000a8ab <mbsrtowcs+0x26>
   14000a8a4:	48 8d 3d b9 62 00 00 	lea    rdi,[rip+0x62b9]        # 140010b64 <internal_mbstate.1>
   14000a8ab:	e8 78 02 00 00       	call   14000ab28 <___lc_codepage_func>
   14000a8b0:	31 db                	xor    ebx,ebx
   14000a8b2:	41 89 c6             	mov    r14d,eax
   14000a8b5:	e8 76 02 00 00       	call   14000ab30 <___mb_cur_max_func>
   14000a8ba:	41 89 c5             	mov    r13d,eax
   14000a8bd:	48 85 f6             	test   rsi,rsi
   14000a8c0:	74 7e                	je     14000a940 <mbsrtowcs+0xbb>
   14000a8c2:	48 83 3e 00          	cmp    QWORD PTR [rsi],0x0
   14000a8c6:	74 78                	je     14000a940 <mbsrtowcs+0xbb>
   14000a8c8:	48 85 ed             	test   rbp,rbp
   14000a8cb:	74 3e                	je     14000a90b <mbsrtowcs+0x86>
   14000a8cd:	4c 39 e3             	cmp    rbx,r12
   14000a8d0:	73 6e                	jae    14000a940 <mbsrtowcs+0xbb>
   14000a8d2:	44 89 6c 24 28       	mov    DWORD PTR [rsp+0x28],r13d
   14000a8d7:	4d 89 e0             	mov    r8,r12
   14000a8da:	49 89 f9             	mov    r9,rdi
   14000a8dd:	48 89 e9             	mov    rcx,rbp
   14000a8e0:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   14000a8e5:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   14000a8e8:	49 29 d8             	sub    r8,rbx
   14000a8eb:	e8 10 fe ff ff       	call   14000a700 <__mbrtowc_cp>
   14000a8f0:	85 c0                	test   eax,eax
   14000a8f2:	7e 0e                	jle    14000a902 <mbsrtowcs+0x7d>
   14000a8f4:	48 98                	cdqe
   14000a8f6:	48 83 c5 02          	add    rbp,0x2
   14000a8fa:	48 01 06             	add    QWORD PTR [rsi],rax
   14000a8fd:	48 01 c3             	add    rbx,rax
   14000a900:	eb cb                	jmp    14000a8cd <mbsrtowcs+0x48>
   14000a902:	75 3c                	jne    14000a940 <mbsrtowcs+0xbb>
   14000a904:	31 c0                	xor    eax,eax
   14000a906:	48 89 06             	mov    QWORD PTR [rsi],rax
   14000a909:	eb 35                	jmp    14000a940 <mbsrtowcs+0xbb>
   14000a90b:	66 c7 44 24 3e 00 00 	mov    WORD PTR [rsp+0x3e],0x0
   14000a912:	48 8d 6c 24 3e       	lea    rbp,[rsp+0x3e]
   14000a917:	48 8b 16             	mov    rdx,QWORD PTR [rsi]
   14000a91a:	44 89 6c 24 28       	mov    DWORD PTR [rsp+0x28],r13d
   14000a91f:	49 89 f9             	mov    r9,rdi
   14000a922:	45 89 e8             	mov    r8d,r13d
   14000a925:	44 89 74 24 20       	mov    DWORD PTR [rsp+0x20],r14d
   14000a92a:	48 89 e9             	mov    rcx,rbp
   14000a92d:	48 01 da             	add    rdx,rbx
   14000a930:	e8 cb fd ff ff       	call   14000a700 <__mbrtowc_cp>
   14000a935:	85 c0                	test   eax,eax
   14000a937:	7e 07                	jle    14000a940 <mbsrtowcs+0xbb>
   14000a939:	48 98                	cdqe
   14000a93b:	48 01 c3             	add    rbx,rax
   14000a93e:	eb d7                	jmp    14000a917 <mbsrtowcs+0x92>
   14000a940:	48 89 d8             	mov    rax,rbx
   14000a943:	48 83 c4 40          	add    rsp,0x40
   14000a947:	5b                   	pop    rbx
   14000a948:	5e                   	pop    rsi
   14000a949:	5f                   	pop    rdi
   14000a94a:	5d                   	pop    rbp
   14000a94b:	41 5c                	pop    r12
   14000a94d:	41 5d                	pop    r13
   14000a94f:	41 5e                	pop    r14
   14000a951:	c3                   	ret

000000014000a952 <mbrlen>:
   14000a952:	55                   	push   rbp
   14000a953:	57                   	push   rdi
   14000a954:	56                   	push   rsi
   14000a955:	53                   	push   rbx
   14000a956:	48 83 ec 48          	sub    rsp,0x48
   14000a95a:	4c 89 c3             	mov    rbx,r8
   14000a95d:	66 c7 44 24 3e 00 00 	mov    WORD PTR [rsp+0x3e],0x0
   14000a964:	48 89 ce             	mov    rsi,rcx
   14000a967:	48 89 d7             	mov    rdi,rdx
   14000a96a:	e8 c1 01 00 00       	call   14000ab30 <___mb_cur_max_func>
   14000a96f:	89 c5                	mov    ebp,eax
   14000a971:	e8 b2 01 00 00       	call   14000ab28 <___lc_codepage_func>
   14000a976:	48 85 db             	test   rbx,rbx
   14000a979:	75 07                	jne    14000a982 <mbrlen+0x30>
   14000a97b:	48 8d 1d de 61 00 00 	lea    rbx,[rip+0x61de]        # 140010b60 <s_mbstate.0>
   14000a982:	89 6c 24 28          	mov    DWORD PTR [rsp+0x28],ebp
   14000a986:	48 8d 4c 24 3e       	lea    rcx,[rsp+0x3e]
   14000a98b:	49 89 d9             	mov    r9,rbx
   14000a98e:	49 89 f8             	mov    r8,rdi
   14000a991:	89 44 24 20          	mov    DWORD PTR [rsp+0x20],eax
   14000a995:	48 89 f2             	mov    rdx,rsi
   14000a998:	e8 63 fd ff ff       	call   14000a700 <__mbrtowc_cp>
   14000a99d:	48 98                	cdqe
   14000a99f:	48 83 c4 48          	add    rsp,0x48
   14000a9a3:	5b                   	pop    rbx
   14000a9a4:	5e                   	pop    rsi
   14000a9a5:	5f                   	pop    rdi
   14000a9a6:	5d                   	pop    rbp
   14000a9a7:	c3                   	ret
   14000a9a8:	90                   	nop
   14000a9a9:	90                   	nop
   14000a9aa:	90                   	nop
   14000a9ab:	90                   	nop
   14000a9ac:	90                   	nop
   14000a9ad:	90                   	nop
   14000a9ae:	90                   	nop
   14000a9af:	90                   	nop

000000014000a9b0 <_initterm_e>:
   14000a9b0:	56                   	push   rsi
   14000a9b1:	53                   	push   rbx
   14000a9b2:	48 83 ec 28          	sub    rsp,0x28
   14000a9b6:	48 89 cb             	mov    rbx,rcx
   14000a9b9:	48 89 d6             	mov    rsi,rdx
   14000a9bc:	48 39 f3             	cmp    rbx,rsi
   14000a9bf:	73 16                	jae    14000a9d7 <_initterm_e+0x27>
   14000a9c1:	48 8b 03             	mov    rax,QWORD PTR [rbx]
   14000a9c4:	48 85 c0             	test   rax,rax
   14000a9c7:	75 06                	jne    14000a9cf <_initterm_e+0x1f>
   14000a9c9:	48 83 c3 08          	add    rbx,0x8
   14000a9cd:	eb ed                	jmp    14000a9bc <_initterm_e+0xc>
   14000a9cf:	ff d0                	call   rax
   14000a9d1:	85 c0                	test   eax,eax
   14000a9d3:	74 f4                	je     14000a9c9 <_initterm_e+0x19>
   14000a9d5:	eb 02                	jmp    14000a9d9 <_initterm_e+0x29>
   14000a9d7:	31 c0                	xor    eax,eax
   14000a9d9:	48 83 c4 28          	add    rsp,0x28
   14000a9dd:	5b                   	pop    rbx
   14000a9de:	5e                   	pop    rsi
   14000a9df:	c3                   	ret

000000014000a9e0 <__p__fmode>:
   14000a9e0:	48 8b 05 e9 1f 00 00 	mov    rax,QWORD PTR [rip+0x1fe9]        # 14000c9d0 <.refptr.__imp__fmode>
   14000a9e7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000a9ea:	c3                   	ret
   14000a9eb:	90                   	nop
   14000a9ec:	90                   	nop
   14000a9ed:	90                   	nop
   14000a9ee:	90                   	nop
   14000a9ef:	90                   	nop

000000014000a9f0 <__p__commode>:
   14000a9f0:	48 8b 05 c9 1f 00 00 	mov    rax,QWORD PTR [rip+0x1fc9]        # 14000c9c0 <.refptr.__imp__commode>
   14000a9f7:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000a9fa:	c3                   	ret
   14000a9fb:	90                   	nop
   14000a9fc:	90                   	nop
   14000a9fd:	90                   	nop
   14000a9fe:	90                   	nop
   14000a9ff:	90                   	nop

000000014000aa00 <__p___initenv>:
   14000aa00:	48 8b 05 a9 1f 00 00 	mov    rax,QWORD PTR [rip+0x1fa9]        # 14000c9b0 <.refptr.__imp___initenv>
   14000aa07:	48 8b 00             	mov    rax,QWORD PTR [rax]
   14000aa0a:	c3                   	ret
   14000aa0b:	90                   	nop
   14000aa0c:	90                   	nop
   14000aa0d:	90                   	nop
   14000aa0e:	90                   	nop
   14000aa0f:	90                   	nop

000000014000aa10 <_lock_file>:
   14000aa10:	53                   	push   rbx
   14000aa11:	48 83 ec 20          	sub    rsp,0x20
   14000aa15:	48 89 cb             	mov    rbx,rcx
   14000aa18:	31 c9                	xor    ecx,ecx
   14000aa1a:	e8 e1 00 00 00       	call   14000ab00 <__acrt_iob_func>
   14000aa1f:	48 39 c3             	cmp    rbx,rax
   14000aa22:	72 3e                	jb     14000aa62 <_lock_file+0x52>
   14000aa24:	b9 13 00 00 00       	mov    ecx,0x13
   14000aa29:	e8 d2 00 00 00       	call   14000ab00 <__acrt_iob_func>
   14000aa2e:	48 39 d8             	cmp    rax,rbx
   14000aa31:	72 2f                	jb     14000aa62 <_lock_file+0x52>
   14000aa33:	31 c9                	xor    ecx,ecx
   14000aa35:	e8 c6 00 00 00       	call   14000ab00 <__acrt_iob_func>
   14000aa3a:	48 89 c2             	mov    rdx,rax
   14000aa3d:	48 89 d8             	mov    rax,rbx
   14000aa40:	48 29 d0             	sub    rax,rdx
   14000aa43:	48 c1 f8 04          	sar    rax,0x4
   14000aa47:	69 c0 ab aa aa aa    	imul   eax,eax,0xaaaaaaab
   14000aa4d:	8d 48 10             	lea    ecx,[rax+0x10]
   14000aa50:	e8 2b 01 00 00       	call   14000ab80 <_lock>
   14000aa55:	81 4b 18 00 80 00 00 	or     DWORD PTR [rbx+0x18],0x8000
   14000aa5c:	48 83 c4 20          	add    rsp,0x20
   14000aa60:	5b                   	pop    rbx
   14000aa61:	c3                   	ret
   14000aa62:	48 8d 4b 30          	lea    rcx,[rbx+0x30]
   14000aa66:	48 83 c4 20          	add    rsp,0x20
   14000aa6a:	5b                   	pop    rbx
   14000aa6b:	48 ff 25 b6 67 00 00 	rex.W jmp QWORD PTR [rip+0x67b6]        # 140011228 <__imp_EnterCriticalSection>

000000014000aa72 <_unlock_file>:
   14000aa72:	53                   	push   rbx
   14000aa73:	48 83 ec 20          	sub    rsp,0x20
   14000aa77:	48 89 cb             	mov    rbx,rcx
   14000aa7a:	31 c9                	xor    ecx,ecx
   14000aa7c:	e8 7f 00 00 00       	call   14000ab00 <__acrt_iob_func>
   14000aa81:	48 39 c3             	cmp    rbx,rax
   14000aa84:	72 37                	jb     14000aabd <_unlock_file+0x4b>
   14000aa86:	b9 13 00 00 00       	mov    ecx,0x13
   14000aa8b:	e8 70 00 00 00       	call   14000ab00 <__acrt_iob_func>
   14000aa90:	48 39 d8             	cmp    rax,rbx
   14000aa93:	72 28                	jb     14000aabd <_unlock_file+0x4b>
   14000aa95:	81 63 18 ff 7f ff ff 	and    DWORD PTR [rbx+0x18],0xffff7fff
   14000aa9c:	31 c9                	xor    ecx,ecx
   14000aa9e:	e8 5d 00 00 00       	call   14000ab00 <__acrt_iob_func>
   14000aaa3:	48 29 c3             	sub    rbx,rax
   14000aaa6:	48 c1 fb 04          	sar    rbx,0x4
   14000aaaa:	69 db ab aa aa aa    	imul   ebx,ebx,0xaaaaaaab
   14000aab0:	8d 4b 10             	lea    ecx,[rbx+0x10]
   14000aab3:	48 83 c4 20          	add    rsp,0x20
   14000aab7:	5b                   	pop    rbx
   14000aab8:	e9 cb 00 00 00       	jmp    14000ab88 <_unlock>
   14000aabd:	48 8d 4b 30          	lea    rcx,[rbx+0x30]
   14000aac1:	48 83 c4 20          	add    rsp,0x20
   14000aac5:	5b                   	pop    rbx
   14000aac6:	48 ff 25 7b 67 00 00 	rex.W jmp QWORD PTR [rip+0x677b]        # 140011248 <__imp_LeaveCriticalSection>
   14000aacd:	90                   	nop
   14000aace:	90                   	nop
   14000aacf:	90                   	nop

000000014000aad0 <_get_invalid_parameter_handler>:
   14000aad0:	48 8b 05 99 60 00 00 	mov    rax,QWORD PTR [rip+0x6099]        # 140010b70 <handler>
   14000aad7:	c3                   	ret

000000014000aad8 <_set_invalid_parameter_handler>:
   14000aad8:	48 89 c8             	mov    rax,rcx
   14000aadb:	48 87 05 8e 60 00 00 	xchg   QWORD PTR [rip+0x608e],rax        # 140010b70 <handler>
   14000aae2:	c3                   	ret
   14000aae3:	90                   	nop
   14000aae4:	90                   	nop
   14000aae5:	90                   	nop
   14000aae6:	90                   	nop
   14000aae7:	90                   	nop
   14000aae8:	90                   	nop
   14000aae9:	90                   	nop
   14000aaea:	90                   	nop
   14000aaeb:	90                   	nop
   14000aaec:	90                   	nop
   14000aaed:	90                   	nop
   14000aaee:	90                   	nop
   14000aaef:	90                   	nop

000000014000aaf0 <_configthreadlocale>:
   14000aaf0:	ba 02 00 00 00       	mov    edx,0x2
   14000aaf5:	b8 ff ff ff ff       	mov    eax,0xffffffff
   14000aafa:	ff c9                	dec    ecx
   14000aafc:	0f 45 c2             	cmovne eax,edx
   14000aaff:	c3                   	ret

000000014000ab00 <__acrt_iob_func>:
   14000ab00:	53                   	push   rbx
   14000ab01:	48 83 ec 20          	sub    rsp,0x20
   14000ab05:	89 cb                	mov    ebx,ecx
   14000ab07:	e8 34 00 00 00       	call   14000ab40 <__iob_func>
   14000ab0c:	48 6b db 30          	imul   rbx,rbx,0x30
   14000ab10:	48 01 d8             	add    rax,rbx
   14000ab13:	48 83 c4 20          	add    rsp,0x20
   14000ab17:	5b                   	pop    rbx
   14000ab18:	c3                   	ret
   14000ab19:	90                   	nop
   14000ab1a:	90                   	nop
   14000ab1b:	90                   	nop
   14000ab1c:	90                   	nop
   14000ab1d:	90                   	nop
   14000ab1e:	90                   	nop
   14000ab1f:	90                   	nop

000000014000ab20 <__C_specific_handler>:
   14000ab20:	ff 25 6a 67 00 00    	jmp    QWORD PTR [rip+0x676a]        # 140011290 <__imp___C_specific_handler>
   14000ab26:	90                   	nop
   14000ab27:	90                   	nop

000000014000ab28 <___lc_codepage_func>:
   14000ab28:	ff 25 6a 67 00 00    	jmp    QWORD PTR [rip+0x676a]        # 140011298 <__imp____lc_codepage_func>
   14000ab2e:	90                   	nop
   14000ab2f:	90                   	nop

000000014000ab30 <___mb_cur_max_func>:
   14000ab30:	ff 25 6a 67 00 00    	jmp    QWORD PTR [rip+0x676a]        # 1400112a0 <__imp____mb_cur_max_func>
   14000ab36:	90                   	nop
   14000ab37:	90                   	nop

000000014000ab38 <__getmainargs>:
   14000ab38:	ff 25 6a 67 00 00    	jmp    QWORD PTR [rip+0x676a]        # 1400112a8 <__imp___getmainargs>
   14000ab3e:	90                   	nop
   14000ab3f:	90                   	nop

000000014000ab40 <__iob_func>:
   14000ab40:	ff 25 72 67 00 00    	jmp    QWORD PTR [rip+0x6772]        # 1400112b8 <__imp___iob_func>
   14000ab46:	90                   	nop
   14000ab47:	90                   	nop

000000014000ab48 <__set_app_type>:
   14000ab48:	ff 25 72 67 00 00    	jmp    QWORD PTR [rip+0x6772]        # 1400112c0 <__imp___set_app_type>
   14000ab4e:	90                   	nop
   14000ab4f:	90                   	nop

000000014000ab50 <__setusermatherr>:
   14000ab50:	ff 25 72 67 00 00    	jmp    QWORD PTR [rip+0x6772]        # 1400112c8 <__imp___setusermatherr>
   14000ab56:	90                   	nop
   14000ab57:	90                   	nop

000000014000ab58 <_amsg_exit>:
   14000ab58:	ff 25 72 67 00 00    	jmp    QWORD PTR [rip+0x6772]        # 1400112d0 <__imp__amsg_exit>
   14000ab5e:	90                   	nop
   14000ab5f:	90                   	nop

000000014000ab60 <_cexit>:
   14000ab60:	ff 25 72 67 00 00    	jmp    QWORD PTR [rip+0x6772]        # 1400112d8 <__imp__cexit>
   14000ab66:	90                   	nop
   14000ab67:	90                   	nop

000000014000ab68 <_errno>:
   14000ab68:	ff 25 7a 67 00 00    	jmp    QWORD PTR [rip+0x677a]        # 1400112e8 <__imp__errno>
   14000ab6e:	90                   	nop
   14000ab6f:	90                   	nop

000000014000ab70 <_getch>:
   14000ab70:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400112f8 <__imp__getch>
   14000ab76:	90                   	nop
   14000ab77:	90                   	nop

000000014000ab78 <_initterm>:
   14000ab78:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011300 <__imp__initterm>
   14000ab7e:	90                   	nop
   14000ab7f:	90                   	nop

000000014000ab80 <_lock>:
   14000ab80:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011308 <__imp__lock>
   14000ab86:	90                   	nop
   14000ab87:	90                   	nop

000000014000ab88 <_unlock>:
   14000ab88:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011310 <__imp__unlock>
   14000ab8e:	90                   	nop
   14000ab8f:	90                   	nop

000000014000ab90 <abort>:
   14000ab90:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011318 <__imp_abort>
   14000ab96:	90                   	nop
   14000ab97:	90                   	nop

000000014000ab98 <_crt_atexit>:
   14000ab98:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011320 <__imp__crt_atexit>
   14000ab9e:	90                   	nop
   14000ab9f:	90                   	nop

000000014000aba0 <calloc>:
   14000aba0:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011328 <__imp_calloc>
   14000aba6:	90                   	nop
   14000aba7:	90                   	nop

000000014000aba8 <exit>:
   14000aba8:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011330 <__imp_exit>
   14000abae:	90                   	nop
   14000abaf:	90                   	nop

000000014000abb0 <fprintf>:
   14000abb0:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011338 <__imp_fprintf>
   14000abb6:	90                   	nop
   14000abb7:	90                   	nop

000000014000abb8 <fputc>:
   14000abb8:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011340 <__imp_fputc>
   14000abbe:	90                   	nop
   14000abbf:	90                   	nop

000000014000abc0 <free>:
   14000abc0:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011348 <__imp_free>
   14000abc6:	90                   	nop
   14000abc7:	90                   	nop

000000014000abc8 <getc>:
   14000abc8:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011350 <__imp_getc>
   14000abce:	90                   	nop
   14000abcf:	90                   	nop

000000014000abd0 <isdigit>:
   14000abd0:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011358 <__imp_isdigit>
   14000abd6:	90                   	nop
   14000abd7:	90                   	nop

000000014000abd8 <isspace>:
   14000abd8:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011360 <__imp_isspace>
   14000abde:	90                   	nop
   14000abdf:	90                   	nop

000000014000abe0 <isxdigit>:
   14000abe0:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011368 <__imp_isxdigit>
   14000abe6:	90                   	nop
   14000abe7:	90                   	nop

000000014000abe8 <localeconv>:
   14000abe8:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011370 <__imp_localeconv>
   14000abee:	90                   	nop
   14000abef:	90                   	nop

000000014000abf0 <malloc>:
   14000abf0:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011378 <__imp_malloc>
   14000abf6:	90                   	nop
   14000abf7:	90                   	nop

000000014000abf8 <memcpy>:
   14000abf8:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011380 <__imp_memcpy>
   14000abfe:	90                   	nop
   14000abff:	90                   	nop

000000014000ac00 <memset>:
   14000ac00:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011388 <__imp_memset>
   14000ac06:	90                   	nop
   14000ac07:	90                   	nop

000000014000ac08 <realloc>:
   14000ac08:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011390 <__imp_realloc>
   14000ac0e:	90                   	nop
   14000ac0f:	90                   	nop

000000014000ac10 <signal>:
   14000ac10:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 140011398 <__imp_signal>
   14000ac16:	90                   	nop
   14000ac17:	90                   	nop

000000014000ac18 <strerror>:
   14000ac18:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113a0 <__imp_strerror>
   14000ac1e:	90                   	nop
   14000ac1f:	90                   	nop

000000014000ac20 <strlen>:
   14000ac20:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113a8 <__imp_strlen>
   14000ac26:	90                   	nop
   14000ac27:	90                   	nop

000000014000ac28 <strncmp>:
   14000ac28:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113b0 <__imp_strncmp>
   14000ac2e:	90                   	nop
   14000ac2f:	90                   	nop

000000014000ac30 <strtol>:
   14000ac30:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113b8 <__imp_strtol>
   14000ac36:	90                   	nop
   14000ac37:	90                   	nop

000000014000ac38 <strtoul>:
   14000ac38:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113c0 <__imp_strtoul>
   14000ac3e:	90                   	nop
   14000ac3f:	90                   	nop

000000014000ac40 <tolower>:
   14000ac40:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113c8 <__imp_tolower>
   14000ac46:	90                   	nop
   14000ac47:	90                   	nop

000000014000ac48 <ungetc>:
   14000ac48:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113d0 <__imp_ungetc>
   14000ac4e:	90                   	nop
   14000ac4f:	90                   	nop

000000014000ac50 <vfprintf>:
   14000ac50:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113d8 <__imp_vfprintf>
   14000ac56:	90                   	nop
   14000ac57:	90                   	nop

000000014000ac58 <wcslen>:
   14000ac58:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113e0 <__imp_wcslen>
   14000ac5e:	90                   	nop
   14000ac5f:	90                   	nop

000000014000ac60 <strtoull>:
   14000ac60:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113e8 <__imp_strtoull>
   14000ac66:	90                   	nop
   14000ac67:	90                   	nop

000000014000ac68 <strtoll>:
   14000ac68:	ff 25 82 67 00 00    	jmp    QWORD PTR [rip+0x6782]        # 1400113f0 <__imp_strtoll>
   14000ac6e:	90                   	nop
   14000ac6f:	90                   	nop

000000014000ac70 <WideCharToMultiByte>:
   14000ac70:	ff 25 0a 66 00 00    	jmp    QWORD PTR [rip+0x660a]        # 140011280 <__imp_WideCharToMultiByte>
   14000ac76:	90                   	nop
   14000ac77:	90                   	nop

000000014000ac78 <VirtualQuery>:
   14000ac78:	ff 25 fa 65 00 00    	jmp    QWORD PTR [rip+0x65fa]        # 140011278 <__imp_VirtualQuery>
   14000ac7e:	90                   	nop
   14000ac7f:	90                   	nop

000000014000ac80 <VirtualProtect>:
   14000ac80:	ff 25 ea 65 00 00    	jmp    QWORD PTR [rip+0x65ea]        # 140011270 <__imp_VirtualProtect>
   14000ac86:	90                   	nop
   14000ac87:	90                   	nop

000000014000ac88 <TlsGetValue>:
   14000ac88:	ff 25 da 65 00 00    	jmp    QWORD PTR [rip+0x65da]        # 140011268 <__imp_TlsGetValue>
   14000ac8e:	90                   	nop
   14000ac8f:	90                   	nop

000000014000ac90 <Sleep>:
   14000ac90:	ff 25 ca 65 00 00    	jmp    QWORD PTR [rip+0x65ca]        # 140011260 <__imp_Sleep>
   14000ac96:	90                   	nop
   14000ac97:	90                   	nop

000000014000ac98 <SetUnhandledExceptionFilter>:
   14000ac98:	ff 25 ba 65 00 00    	jmp    QWORD PTR [rip+0x65ba]        # 140011258 <__imp_SetUnhandledExceptionFilter>
   14000ac9e:	90                   	nop
   14000ac9f:	90                   	nop

000000014000aca0 <MultiByteToWideChar>:
   14000aca0:	ff 25 aa 65 00 00    	jmp    QWORD PTR [rip+0x65aa]        # 140011250 <__imp_MultiByteToWideChar>
   14000aca6:	90                   	nop
   14000aca7:	90                   	nop

000000014000aca8 <LeaveCriticalSection>:
   14000aca8:	ff 25 9a 65 00 00    	jmp    QWORD PTR [rip+0x659a]        # 140011248 <__imp_LeaveCriticalSection>
   14000acae:	90                   	nop
   14000acaf:	90                   	nop

000000014000acb0 <IsDBCSLeadByteEx>:
   14000acb0:	ff 25 8a 65 00 00    	jmp    QWORD PTR [rip+0x658a]        # 140011240 <__imp_IsDBCSLeadByteEx>
   14000acb6:	90                   	nop
   14000acb7:	90                   	nop

000000014000acb8 <InitializeCriticalSection>:
   14000acb8:	ff 25 7a 65 00 00    	jmp    QWORD PTR [rip+0x657a]        # 140011238 <__imp_InitializeCriticalSection>
   14000acbe:	90                   	nop
   14000acbf:	90                   	nop

000000014000acc0 <GetLastError>:
   14000acc0:	ff 25 6a 65 00 00    	jmp    QWORD PTR [rip+0x656a]        # 140011230 <__imp_GetLastError>
   14000acc6:	90                   	nop
   14000acc7:	90                   	nop

000000014000acc8 <EnterCriticalSection>:
   14000acc8:	ff 25 5a 65 00 00    	jmp    QWORD PTR [rip+0x655a]        # 140011228 <__imp_EnterCriticalSection>
   14000acce:	90                   	nop
   14000accf:	90                   	nop

000000014000acd0 <DeleteCriticalSection>:
   14000acd0:	ff 25 4a 65 00 00    	jmp    QWORD PTR [rip+0x654a]        # 140011220 <__IAT_start__>
   14000acd6:	90                   	nop
   14000acd7:	90                   	nop
   14000acd8:	0f 1f 84 00 00 00 00 	nop    DWORD PTR [rax+rax*1+0x0]
   14000acdf:	00 

000000014000ace0 <register_frame_ctor>:
   14000ace0:	e9 8b 66 ff ff       	jmp    140001370 <__gcc_register_frame>
   14000ace5:	90                   	nop
   14000ace6:	90                   	nop
   14000ace7:	90                   	nop
   14000ace8:	90                   	nop
   14000ace9:	90                   	nop
   14000acea:	90                   	nop
   14000aceb:	90                   	nop
   14000acec:	90                   	nop
   14000aced:	90                   	nop
   14000acee:	90                   	nop
   14000acef:	90                   	nop
