
easycrackme.exe:     file format pei-i386


Disassembly of section .text:

00401000 <.text>:
  401000:	sub    esp,0x1c
  401003:	mov    eax,DWORD PTR [esp+0x20]
  401007:	mov    eax,DWORD PTR [eax]
  401009:	mov    eax,DWORD PTR [eax]
  40100b:	cmp    eax,0xc0000091
  401010:	ja     401060 <.text+0x60>
  401012:	cmp    eax,0xc000008d
  401017:	jae    401079 <.text+0x79>
  401019:	cmp    eax,0xc0000005
  40101e:	jne    4010f0 <.text+0xf0>
  401024:	mov    DWORD PTR [esp+0x4],0x0
  40102c:	mov    DWORD PTR [esp],0xb
  401033:	call   403c60 <_signal>
  401038:	cmp    eax,0x1
  40103b:	je     401189 <.text+0x189>
  401041:	test   eax,eax
  401043:	jne    401130 <.text+0x130>
  401049:	lea    esi,[esi+eiz*1+0x0]
  401050:	xor    eax,eax
  401052:	add    esp,0x1c
  401055:	ret    0x4
  401058:	nop
  401059:	lea    esi,[esi+eiz*1+0x0]
  401060:	cmp    eax,0xc0000094
  401065:	je     4010b0 <.text+0xb0>
  401067:	cmp    eax,0xc0000096
  40106c:	je     4010fb <.text+0xfb>
  401072:	cmp    eax,0xc0000093
  401077:	jne    401050 <.text+0x50>
  401079:	mov    DWORD PTR [esp+0x4],0x0
  401081:	mov    DWORD PTR [esp],0x8
  401088:	call   403c60 <_signal>
  40108d:	cmp    eax,0x1
  401090:	je     401143 <.text+0x143>
  401096:	test   eax,eax
  401098:	je     401050 <.text+0x50>
  40109a:	mov    DWORD PTR [esp],0x8
  4010a1:	call   eax
  4010a3:	mov    eax,0xffffffff
  4010a8:	jmp    401052 <.text+0x52>
  4010aa:	lea    esi,[esi+0x0]
  4010b0:	mov    DWORD PTR [esp+0x4],0x0
  4010b8:	mov    DWORD PTR [esp],0x8
  4010bf:	call   403c60 <_signal>
  4010c4:	cmp    eax,0x1
  4010c7:	jne    401096 <.text+0x96>
  4010c9:	mov    DWORD PTR [esp+0x4],0x1
  4010d1:	mov    DWORD PTR [esp],0x8
  4010d8:	call   403c60 <_signal>
  4010dd:	mov    eax,0xffffffff
  4010e2:	jmp    401052 <.text+0x52>
  4010e7:	mov    esi,esi
  4010e9:	lea    edi,[edi+eiz*1+0x0]
  4010f0:	cmp    eax,0xc000001d
  4010f5:	jne    401050 <.text+0x50>
  4010fb:	mov    DWORD PTR [esp+0x4],0x0
  401103:	mov    DWORD PTR [esp],0x4
  40110a:	call   403c60 <_signal>
  40110f:	cmp    eax,0x1
  401112:	je     40116d <.text+0x16d>
  401114:	test   eax,eax
  401116:	je     401050 <.text+0x50>
  40111c:	mov    DWORD PTR [esp],0x4
  401123:	call   eax
  401125:	mov    eax,0xffffffff
  40112a:	jmp    401052 <.text+0x52>
  40112f:	nop
  401130:	mov    DWORD PTR [esp],0xb
  401137:	call   eax
  401139:	mov    eax,0xffffffff
  40113e:	jmp    401052 <.text+0x52>
  401143:	mov    DWORD PTR [esp+0x4],0x1
  40114b:	mov    DWORD PTR [esp],0x8
  401152:	call   403c60 <_signal>
  401157:	mov    DWORD PTR [esp],0x0
  40115e:	call   402250 <_fesetenv>
  401163:	mov    eax,0xffffffff
  401168:	jmp    401052 <.text+0x52>
  40116d:	mov    DWORD PTR [esp+0x4],0x1
  401175:	mov    DWORD PTR [esp],0x4
  40117c:	call   403c60 <_signal>
  401181:	or     eax,0xffffffff
  401184:	jmp    401052 <.text+0x52>
  401189:	mov    DWORD PTR [esp+0x4],0x1
  401191:	mov    DWORD PTR [esp],0xb
  401198:	call   403c60 <_signal>
  40119d:	or     eax,0xffffffff
  4011a0:	jmp    401052 <.text+0x52>
  4011a5:	lea    esi,[esi+eiz*1+0x0]
  4011a9:	lea    edi,[edi+eiz*1+0x0]
  4011b0:	push   ebp
  4011b1:	mov    ebp,esp
  4011b3:	push   ebx
  4011b4:	sub    esp,0x14
  4011b7:	mov    eax,ds:0x40516c
  4011bc:	test   eax,eax
  4011be:	je     4011dc <.text+0x1dc>
  4011c0:	mov    DWORD PTR [esp+0x8],0x0
  4011c8:	mov    DWORD PTR [esp+0x4],0x2
  4011d0:	mov    DWORD PTR [esp],0x0
  4011d7:	call   eax
  4011d9:	sub    esp,0xc
  4011dc:	mov    DWORD PTR [esp],0x401000
  4011e3:	call   403d30 <_SetUnhandledExceptionFilter@4>
  4011e8:	sub    esp,0x4
  4011eb:	call   401a40 <___cpu_features_init>
  4011f0:	mov    eax,ds:0x404008
  4011f5:	mov    DWORD PTR [esp],eax
  4011f8:	call   402250 <_fesetenv>
  4011fd:	call   4016a0 <__setargv>
  401202:	mov    eax,ds:0x407030
  401207:	test   eax,eax
  401209:	je     40124d <.text+0x24d>
  40120b:	mov    ebx,DWORD PTR ds:0x4081c4
  401211:	mov    ds:0x40400c,eax
  401216:	mov    DWORD PTR [esp+0x4],eax
  40121a:	mov    eax,DWORD PTR [ebx+0x10]
  40121d:	mov    DWORD PTR [esp],eax
  401220:	call   403cd0 <__setmode>
  401225:	mov    eax,ds:0x407030
  40122a:	mov    DWORD PTR [esp+0x4],eax
  40122e:	mov    eax,DWORD PTR [ebx+0x30]
  401231:	mov    DWORD PTR [esp],eax
  401234:	call   403cd0 <__setmode>
  401239:	mov    eax,ds:0x407030
  40123e:	mov    DWORD PTR [esp+0x4],eax
  401242:	mov    eax,DWORD PTR [ebx+0x50]
  401245:	mov    DWORD PTR [esp],eax
  401248:	call   403cd0 <__setmode>
  40124d:	call   403cf8 <___p__fmode>
  401252:	mov    edx,DWORD PTR ds:0x40400c
  401258:	mov    DWORD PTR [eax],edx
  40125a:	call   402050 <__pei386_runtime_relocator>
  40125f:	and    esp,0xfffffff0
  401262:	call   401bd0 <___main>
  401267:	call   403d00 <___p__environ>
  40126c:	mov    eax,DWORD PTR [eax]
  40126e:	mov    DWORD PTR [esp+0x8],eax
  401272:	mov    eax,ds:0x407000
  401277:	mov    DWORD PTR [esp+0x4],eax
  40127b:	mov    eax,ds:0x407004
  401280:	mov    DWORD PTR [esp],eax
  401283:	call   4015fd <_main>
  401288:	mov    ebx,eax
  40128a:	call   403cf0 <__cexit>
  40128f:	mov    DWORD PTR [esp],ebx
  401292:	call   403d98 <_ExitProcess@4>
  401297:	mov    esi,esi
  401299:	lea    edi,[edi+eiz*1+0x0]

004012a0 <__mingw32_init_mainargs>:
  4012a0:	sub    esp,0x3c
  4012a3:	lea    eax,[esp+0x2c]
  4012a7:	mov    DWORD PTR [esp+0x4],0x407000
  4012af:	mov    DWORD PTR [esp],0x407004
  4012b6:	mov    DWORD PTR [esp+0x2c],0x0
  4012be:	mov    DWORD PTR [esp+0x10],eax
  4012c2:	mov    eax,ds:0x404004
  4012c7:	and    eax,0x1
  4012ca:	mov    DWORD PTR [esp+0xc],eax
  4012ce:	lea    eax,[esp+0x28]
  4012d2:	mov    DWORD PTR [esp+0x8],eax
  4012d6:	call   403d08 <___getmainargs>
  4012db:	add    esp,0x3c
  4012de:	ret
  4012df:	nop

004012e0 <_mainCRTStartup>:
  4012e0:	sub    esp,0x1c
  4012e3:	mov    DWORD PTR [esp],0x1
  4012ea:	call   DWORD PTR ds:0x4081b0
  4012f0:	call   4011b0 <.text+0x1b0>
  4012f5:	lea    esi,[esi+eiz*1+0x0]
  4012f9:	lea    edi,[edi+eiz*1+0x0]

00401300 <_WinMainCRTStartup>:
  401300:	sub    esp,0x1c
  401303:	mov    DWORD PTR [esp],0x2
  40130a:	call   DWORD PTR ds:0x4081b0
  401310:	call   4011b0 <.text+0x1b0>
  401315:	lea    esi,[esi+eiz*1+0x0]
  401319:	lea    edi,[edi+eiz*1+0x0]

00401320 <_atexit>:
  401320:	jmp    DWORD PTR ds:0x4081dc
  401326:	lea    esi,[esi+0x0]
  401329:	lea    edi,[edi+eiz*1+0x0]

00401330 <__onexit>:
  401330:	jmp    DWORD PTR ds:0x4081cc
  401336:	nop
  401337:	nop
  401338:	nop
  401339:	nop
  40133a:	nop
  40133b:	nop
  40133c:	nop
  40133d:	nop
  40133e:	nop
  40133f:	nop

00401340 <___gcc_register_frame>:
  401340:	push   ebp
  401341:	mov    ebp,esp
  401343:	push   esi
  401344:	push   ebx
  401345:	sub    esp,0x10
  401348:	mov    DWORD PTR [esp],0x405000
  40134f:	call   403d60 <_GetModuleHandleA@4>
  401354:	sub    esp,0x4
  401357:	test   eax,eax
  401359:	je     401410 <___gcc_register_frame+0xd0>
  40135f:	mov    DWORD PTR [esp],0x405000
  401366:	mov    ebx,eax
  401368:	call   403d38 <_LoadLibraryA@4>
  40136d:	sub    esp,0x4
  401370:	mov    ds:0x40707c,eax
  401375:	mov    DWORD PTR [esp+0x4],0x405013
  40137d:	mov    DWORD PTR [esp],ebx
  401380:	call   403d58 <_GetProcAddress@8>
  401385:	sub    esp,0x8
  401388:	mov    esi,eax
  40138a:	mov    DWORD PTR [esp+0x4],0x405029
  401392:	mov    DWORD PTR [esp],ebx
  401395:	call   403d58 <_GetProcAddress@8>
  40139a:	sub    esp,0x8
  40139d:	mov    ds:0x404000,eax
  4013a2:	test   esi,esi
  4013a4:	je     4013b7 <___gcc_register_frame+0x77>
  4013a6:	mov    DWORD PTR [esp+0x4],0x407008
  4013ae:	mov    DWORD PTR [esp],0x4060b8
  4013b5:	call   esi
  4013b7:	mov    eax,ds:0x404018
  4013bc:	test   eax,eax
  4013be:	je     4013fa <___gcc_register_frame+0xba>
  4013c0:	mov    DWORD PTR [esp],0x405041
  4013c7:	call   403d60 <_GetModuleHandleA@4>
  4013cc:	sub    esp,0x4
  4013cf:	test   eax,eax
  4013d1:	mov    edx,0x0
  4013d6:	je     4013ed <___gcc_register_frame+0xad>
  4013d8:	mov    DWORD PTR [esp+0x4],0x40504f
  4013e0:	mov    DWORD PTR [esp],eax
  4013e3:	call   403d58 <_GetProcAddress@8>
  4013e8:	sub    esp,0x8
  4013eb:	mov    edx,eax
  4013ed:	test   edx,edx
  4013ef:	je     4013fa <___gcc_register_frame+0xba>
  4013f1:	mov    DWORD PTR [esp],0x404018
  4013f8:	call   edx
  4013fa:	mov    DWORD PTR [esp],0x401430
  401401:	call   401320 <_atexit>
  401406:	lea    esp,[ebp-0x8]
  401409:	pop    ebx
  40140a:	pop    esi
  40140b:	pop    ebp
  40140c:	ret
  40140d:	lea    esi,[esi+0x0]
  401410:	mov    DWORD PTR ds:0x404000,0x0
  40141a:	mov    esi,0x0
  40141f:	jmp    4013a2 <___gcc_register_frame+0x62>
  401421:	jmp    401430 <___gcc_deregister_frame>
  401423:	nop
  401424:	nop
  401425:	nop
  401426:	nop
  401427:	nop
  401428:	nop
  401429:	nop
  40142a:	nop
  40142b:	nop
  40142c:	nop
  40142d:	nop
  40142e:	nop
  40142f:	nop

00401430 <___gcc_deregister_frame>:
  401430:	push   ebp
  401431:	mov    ebp,esp
  401433:	sub    esp,0x18
  401436:	mov    eax,ds:0x404000
  40143b:	test   eax,eax
  40143d:	je     401448 <___gcc_deregister_frame+0x18>
  40143f:	mov    DWORD PTR [esp],0x4060b8
  401446:	call   eax
  401448:	mov    eax,ds:0x40707c
  40144d:	test   eax,eax
  40144f:	je     40145c <___gcc_deregister_frame+0x2c>
  401451:	mov    DWORD PTR [esp],eax
  401454:	call   403d78 <_FreeLibrary@4>
  401459:	sub    esp,0x4
  40145c:	leave
  40145d:	ret
  40145e:	nop
  40145f:	nop

00401460 <_CreatePassword>:
  401460:	push   ebp
  401461:	mov    ebp,esp
  401463:	sub    esp,0x14
  401466:	mov    eax,DWORD PTR [ebp+0x8]
  401469:	mov    BYTE PTR [ebp-0x14],al
  40146c:	movsx  eax,BYTE PTR [ebp-0x14]
  401470:	mov    DWORD PTR [ebp-0x4],eax
  401473:	movzx  eax,BYTE PTR [ebp-0x14]
  401477:	mov    ds:0x407020,al
  40147c:	mov    DWORD PTR [ebp-0x8],0x1
  401483:	jmp    40149e <_CreatePassword+0x3e>
  401485:	mov    eax,DWORD PTR [ebp-0x8]
  401488:	add    DWORD PTR [ebp-0x4],eax
  40148b:	mov    eax,DWORD PTR [ebp-0x4]
  40148e:	mov    edx,eax
  401490:	mov    eax,DWORD PTR [ebp-0x8]
  401493:	add    eax,0x407020
  401498:	mov    BYTE PTR [eax],dl
  40149a:	add    DWORD PTR [ebp-0x8],0x1
  40149e:	cmp    DWORD PTR [ebp-0x8],0x8
  4014a2:	jle    401485 <_CreatePassword+0x25>
  4014a4:	mov    BYTE PTR ds:0x407029,0x0
  4014ab:	mov    eax,0x407020
  4014b0:	leave
  4014b1:	ret

004014b2 <_idontknowwhatimdoing>:
  4014b2:	push   ebp
  4014b3:	mov    ebp,esp
  4014b5:	sub    esp,0x18
  4014b8:	call   403d48 <_IsDebuggerPresent@0>
  4014bd:	mov    DWORD PTR [esp+0x4],eax
  4014c1:	mov    DWORD PTR [esp],0x405064
  4014c8:	call   403c88 <_printf>
  4014cd:	call   403d48 <_IsDebuggerPresent@0>
  4014d2:	leave
  4014d3:	ret

004014d4 <_napiyorsunmeselaquestionmark>:
  4014d4:	push   ebp
  4014d5:	mov    ebp,esp
  4014d7:	sub    esp,0x38
  4014da:	mov    eax,DWORD PTR [ebp+0xc]
  4014dd:	mov    BYTE PTR [ebp-0x1c],al
  4014e0:	mov    eax,ds:0x40702c
  4014e5:	add    eax,0x1
  4014e8:	mov    ds:0x40702c,eax
  4014ed:	movsx  eax,BYTE PTR [ebp-0x1c]
  4014f1:	mov    DWORD PTR [esp],eax
  4014f4:	call   401460 <_CreatePassword>
  4014f9:	mov    DWORD PTR [ebp-0xc],eax
  4014fc:	mov    eax,ds:0x40702c
  401501:	mov    DWORD PTR [esp+0x8],eax
  401505:	mov    eax,DWORD PTR [ebp+0x8]
  401508:	mov    DWORD PTR [esp+0x4],eax
  40150c:	mov    DWORD PTR [esp],0x405078
  401513:	call   403c88 <_printf>
  401518:	mov    DWORD PTR [ebp-0x10],0x8
  40151f:	mov    eax,DWORD PTR [ebp-0x10]
  401522:	add    eax,0x2
  401525:	mov    DWORD PTR [ebp-0x14],eax
  401528:	mov    eax,DWORD PTR [ebp+0x8]
  40152b:	mov    DWORD PTR [esp],eax
  40152e:	call   403c48 <_strlen>
  401533:	mov    edx,eax
  401535:	mov    eax,DWORD PTR [ebp-0x14]
  401538:	sub    eax,0x1
  40153b:	cmp    edx,eax
  40153d:	je     401546 <_napiyorsunmeselaquestionmark+0x72>
  40153f:	call   401581 <_dhuasihd>
  401544:	jmp    40157e <_napiyorsunmeselaquestionmark+0xaa>
  401546:	mov    eax,DWORD PTR [ebp+0x8]
  401549:	mov    DWORD PTR [esp+0x4],eax
  40154d:	mov    eax,DWORD PTR [ebp-0xc]
  401550:	mov    DWORD PTR [esp],eax
  401553:	call   403c58 <_strcmp>
  401558:	test   eax,eax
  40155a:	je     401563 <_napiyorsunmeselaquestionmark+0x8f>
  40155c:	call   4015bf <_dsauhdas>
  401561:	jmp    40157e <_napiyorsunmeselaquestionmark+0xaa>
  401563:	mov    DWORD PTR [esp],0x4050a3
  40156a:	call   403c88 <_printf>
  40156f:	mov    DWORD PTR [esp],0x7d0
  401576:	call   403d28 <_Sleep@4>
  40157b:	sub    esp,0x4
  40157e:	nop
  40157f:	leave
  401580:	ret

00401581 <_dhuasihd>:
  401581:	push   ebp
  401582:	mov    ebp,esp
  401584:	sub    esp,0x58
  401587:	mov    DWORD PTR [esp],0x4050b7
  40158e:	call   403c80 <_puts>
  401593:	lea    eax,[ebp-0x48]
  401596:	mov    DWORD PTR [esp+0x4],eax
  40159a:	mov    DWORD PTR [esp],0x4050cc
  4015a1:	call   403c70 <_scanf>
  4015a6:	movzx  eax,BYTE PTR [ebp-0x48]
  4015aa:	movsx  eax,al
  4015ad:	mov    DWORD PTR [esp+0x4],eax
  4015b1:	lea    eax,[ebp-0x48]
  4015b4:	mov    DWORD PTR [esp],eax
  4015b7:	call   4014d4 <_napiyorsunmeselaquestionmark>
  4015bc:	nop
  4015bd:	leave
  4015be:	ret

004015bf <_dsauhdas>:
  4015bf:	push   ebp
  4015c0:	mov    ebp,esp
  4015c2:	sub    esp,0x58
  4015c5:	mov    DWORD PTR [esp],0x4050d4
  4015cc:	call   403c80 <_puts>
  4015d1:	lea    eax,[ebp-0x48]
  4015d4:	mov    DWORD PTR [esp+0x4],eax
  4015d8:	mov    DWORD PTR [esp],0x4050cc
  4015df:	call   403c70 <_scanf>
  4015e4:	movzx  eax,BYTE PTR [ebp-0x48]
  4015e8:	movsx  eax,al
  4015eb:	mov    DWORD PTR [esp+0x4],eax
  4015ef:	lea    eax,[ebp-0x48]
  4015f2:	mov    DWORD PTR [esp],eax
  4015f5:	call   4014d4 <_napiyorsunmeselaquestionmark>
  4015fa:	nop
  4015fb:	leave
  4015fc:	ret

004015fd <_main>:
  4015fd:	push   ebp
  4015fe:	mov    ebp,esp
  401600:	and    esp,0xfffffff0
  401603:	sub    esp,0x60
  401606:	call   401bd0 <___main>
  40160b:	call   4014b2 <_idontknowwhatimdoing>
  401610:	cmp    eax,0x1
  401613:	jne    40162d <_main+0x30>
  401615:	mov    DWORD PTR [esp],0x4050fe
  40161c:	call   403c88 <_printf>
  401621:	mov    DWORD PTR [esp],0x0
  401628:	call   403cb8 <_exit>
  40162d:	mov    DWORD PTR [esp],0x40510d
  401634:	call   403c88 <_printf>
  401639:	lea    eax,[esp+0x1c]
  40163d:	mov    DWORD PTR [esp+0x4],eax
  401641:	mov    DWORD PTR [esp],0x4050cc
  401648:	call   403c70 <_scanf>
  40164d:	movzx  eax,BYTE PTR [esp+0x1c]
  401652:	movsx  eax,al
  401655:	mov    DWORD PTR [esp+0x5c],eax
  401659:	cmp    DWORD PTR [esp+0x5c],0x35
  40165e:	jle    401673 <_main+0x76>
  401660:	mov    DWORD PTR [esp],0x40512c
  401667:	call   403c88 <_printf>
  40166c:	mov    eax,0x1
  401671:	jmp    401690 <_main+0x93>
  401673:	movzx  eax,BYTE PTR [esp+0x1c]
  401678:	movsx  eax,al
  40167b:	mov    DWORD PTR [esp+0x4],eax
  40167f:	lea    eax,[esp+0x1c]
  401683:	mov    DWORD PTR [esp],eax
  401686:	call   4014d4 <_napiyorsunmeselaquestionmark>
  40168b:	mov    eax,0x0
  401690:	leave
  401691:	ret
  401692:	nop
  401693:	nop
  401694:	xchg   ax,ax
  401696:	xchg   ax,ax
  401698:	xchg   ax,ax
  40169a:	xchg   ax,ax
  40169c:	xchg   ax,ax
  40169e:	xchg   ax,ax

004016a0 <__setargv>:
  4016a0:	push   ebp
  4016a1:	mov    ebp,esp
  4016a3:	push   edi
  4016a4:	push   esi
  4016a5:	push   ebx
  4016a6:	sub    esp,0x4c
  4016a9:	test   BYTE PTR ds:0x404004,0x2
  4016b0:	je     4019a0 <__setargv+0x300>
  4016b6:	call   403d70 <_GetCommandLineA@0>
  4016bb:	mov    DWORD PTR [ebp-0x3c],esp
  4016be:	mov    DWORD PTR [esp],eax
  4016c1:	mov    esi,eax
  4016c3:	call   403c48 <_strlen>
  4016c8:	lea    eax,[eax+eax*1+0x11]
  4016cc:	shr    eax,0x4
  4016cf:	shl    eax,0x4
  4016d2:	call   402220 <___chkstk_ms>
  4016d7:	sub    esp,eax
  4016d9:	mov    DWORD PTR [ebp-0x1c],0x0
  4016e0:	mov    DWORD PTR [ebp-0x2c],0x0
  4016e7:	lea    eax,[esp+0x10]
  4016eb:	mov    DWORD PTR [ebp-0x30],0x0
  4016f2:	mov    edx,eax
  4016f4:	mov    DWORD PTR [ebp-0x34],eax
  4016f7:	mov    eax,ds:0x404004
  4016fc:	and    eax,0x4400
  401701:	or     eax,0x10
  401704:	mov    DWORD PTR [ebp-0x38],eax
  401707:	xor    eax,eax
  401709:	lea    esi,[esi+eiz*1+0x0]
  401710:	add    esi,0x1
  401713:	movsx  ecx,BYTE PTR [esi-0x1]
  401717:	test   ecx,ecx
  401719:	mov    ebx,ecx
  40171b:	je     401790 <__setargv+0xf0>
  40171d:	cmp    bl,0x3f
  401720:	je     4018b3 <__setargv+0x213>
  401726:	jg     4017e0 <__setargv+0x140>
  40172c:	cmp    bl,0x27
  40172f:	je     4018e5 <__setargv+0x245>
  401735:	cmp    bl,0x2a
  401738:	je     4018b3 <__setargv+0x213>
  40173e:	cmp    bl,0x22
  401741:	jne    401850 <__setargv+0x1b0>
  401747:	mov    ecx,eax
  401749:	sar    ecx,1
  40174b:	je     401a2a <__setargv+0x38a>
  401751:	add    ecx,edx
  401753:	add    edx,0x1
  401756:	mov    BYTE PTR [edx-0x1],0x5c
  40175a:	cmp    edx,ecx
  40175c:	jne    401753 <__setargv+0xb3>
  40175e:	cmp    DWORD PTR [ebp-0x2c],0x27
  401762:	je     401931 <__setargv+0x291>
  401768:	test   al,0x1
  40176a:	jne    401931 <__setargv+0x291>
  401770:	add    esi,0x1
  401773:	mov    edx,ecx
  401775:	xor    DWORD PTR [ebp-0x2c],0x22
  401779:	movsx  ecx,BYTE PTR [esi-0x1]
  40177d:	xor    eax,eax
  40177f:	mov    DWORD PTR [ebp-0x30],0x1
  401786:	test   ecx,ecx
  401788:	mov    ebx,ecx
  40178a:	jne    40171d <__setargv+0x7d>
  40178c:	lea    esi,[esi+eiz*1+0x0]
  401790:	test   eax,eax
  401792:	je     401a31 <__setargv+0x391>
  401798:	add    eax,edx
  40179a:	lea    esi,[esi+0x0]
  4017a0:	add    edx,0x1
  4017a3:	mov    BYTE PTR [edx-0x1],0x5c
  4017a7:	cmp    edx,eax
  4017a9:	jne    4017a0 <__setargv+0x100>
  4017ab:	cmp    DWORD PTR [ebp-0x34],eax
  4017ae:	jb     401972 <__setargv+0x2d2>
  4017b4:	mov    edx,DWORD PTR [ebp-0x30]
  4017b7:	test   edx,edx
  4017b9:	jne    401972 <__setargv+0x2d2>
  4017bf:	mov    eax,DWORD PTR [ebp-0x24]
  4017c2:	mov    ds:0x407004,eax
  4017c7:	mov    eax,DWORD PTR [ebp-0x20]
  4017ca:	mov    ds:0x407000,eax
  4017cf:	mov    esp,DWORD PTR [ebp-0x3c]
  4017d2:	lea    esp,[ebp-0xc]
  4017d5:	pop    ebx
  4017d6:	pop    esi
  4017d7:	pop    edi
  4017d8:	pop    ebp
  4017d9:	ret
  4017da:	lea    esi,[esi+0x0]
  4017e0:	cmp    bl,0x5c
  4017e3:	je     4018d3 <__setargv+0x233>
  4017e9:	cmp    bl,0x7f
  4017ec:	je     4018b3 <__setargv+0x213>
  4017f2:	cmp    bl,0x5b
  4017f5:	jne    401850 <__setargv+0x1b0>
  4017f7:	test   BYTE PTR ds:0x404004,0x20
  4017fe:	jne    4018b3 <__setargv+0x213>
  401804:	test   eax,eax
  401806:	lea    edi,[eax-0x1]
  401809:	mov    ecx,0x1
  40180e:	je     401842 <__setargv+0x1a2>
  401810:	lea    edi,[edx+edi*1+0x1]
  401814:	mov    eax,edx
  401816:	lea    esi,[esi+0x0]
  401819:	lea    edi,[edi+eiz*1+0x0]
  401820:	add    eax,0x1
  401823:	mov    BYTE PTR [eax-0x1],0x5c
  401827:	cmp    eax,edi
  401829:	jne    401820 <__setargv+0x180>
  40182b:	test   cl,cl
  40182d:	jne    401840 <__setargv+0x1a0>
  40182f:	lea    edx,[eax+0x1]
  401832:	mov    BYTE PTR [eax],bl
  401834:	xor    eax,eax
  401836:	jmp    401710 <__setargv+0x70>
  40183b:	nop
  40183c:	lea    esi,[esi+eiz*1+0x0]
  401840:	mov    edx,eax
  401842:	lea    eax,[edx+0x1]
  401845:	mov    BYTE PTR [edx],0x7f
  401848:	jmp    40182f <__setargv+0x18f>
  40184a:	lea    esi,[esi+0x0]
  401850:	test   eax,eax
  401852:	lea    edi,[edx+eax*1]
  401855:	je     401a23 <__setargv+0x383>
  40185b:	nop
  40185c:	lea    esi,[esi+eiz*1+0x0]
  401860:	add    edx,0x1
  401863:	mov    BYTE PTR [edx-0x1],0x5c
  401867:	cmp    edx,edi
  401869:	jne    401860 <__setargv+0x1c0>
  40186b:	mov    eax,DWORD PTR [ebp-0x2c]
  40186e:	test   eax,eax
  401870:	jne    4018a7 <__setargv+0x207>
  401872:	mov    eax,ds:0x4081a4
  401877:	cmp    DWORD PTR [eax],0x1
  40187a:	je     401945 <__setargv+0x2a5>
  401880:	mov    DWORD PTR [esp+0x4],0x40
  401888:	mov    DWORD PTR [esp],ecx
  40188b:	mov    DWORD PTR [ebp-0x40],ecx
  40188e:	call   403cd8 <__isctype>
  401893:	test   eax,eax
  401895:	jne    401956 <__setargv+0x2b6>
  40189b:	mov    ecx,DWORD PTR [ebp-0x40]
  40189e:	cmp    ecx,0x9
  4018a1:	je     401956 <__setargv+0x2b6>
  4018a7:	lea    edx,[edi+0x1]
  4018aa:	mov    BYTE PTR [edi],bl
  4018ac:	xor    eax,eax
  4018ae:	jmp    401710 <__setargv+0x70>
  4018b3:	test   eax,eax
  4018b5:	lea    edi,[eax-0x1]
  4018b8:	je     401a0c <__setargv+0x36c>
  4018be:	mov    eax,DWORD PTR [ebp-0x2c]
  4018c1:	cmp    ecx,0x7f
  4018c4:	sete   cl
  4018c7:	test   eax,eax
  4018c9:	setne  al
  4018cc:	or     ecx,eax
  4018ce:	jmp    401810 <__setargv+0x170>
  4018d3:	cmp    DWORD PTR [ebp-0x2c],0x27
  4018d7:	je     4019c1 <__setargv+0x321>
  4018dd:	add    eax,0x1
  4018e0:	jmp    401710 <__setargv+0x70>
  4018e5:	test   BYTE PTR ds:0x404004,0x10
  4018ec:	je     401850 <__setargv+0x1b0>
  4018f2:	mov    ecx,eax
  4018f4:	sar    ecx,1
  4018f6:	je     401a38 <__setargv+0x398>
  4018fc:	add    ecx,edx
  4018fe:	xchg   ax,ax
  401900:	add    edx,0x1
  401903:	mov    BYTE PTR [edx-0x1],0x5c
  401907:	cmp    edx,ecx
  401909:	jne    401900 <__setargv+0x260>
  40190b:	cmp    DWORD PTR [ebp-0x2c],0x22
  40190f:	je     4019ad <__setargv+0x30d>
  401915:	test   al,0x1
  401917:	jne    4019ad <__setargv+0x30d>
  40191d:	xor    DWORD PTR [ebp-0x2c],0x27
  401921:	mov    edx,ecx
  401923:	xor    eax,eax
  401925:	mov    DWORD PTR [ebp-0x30],0x1
  40192c:	jmp    401710 <__setargv+0x70>
  401931:	lea    edx,[ecx+0x1]
  401934:	mov    BYTE PTR [ecx],0x22
  401937:	xor    eax,eax
  401939:	mov    DWORD PTR [ebp-0x30],0x1
  401940:	jmp    401710 <__setargv+0x70>
  401945:	mov    eax,ds:0x4081d0
  40194a:	mov    eax,DWORD PTR [eax]
  40194c:	test   BYTE PTR [eax+ecx*2],0x40
  401950:	je     40189e <__setargv+0x1fe>
  401956:	cmp    DWORD PTR [ebp-0x34],edi
  401959:	jb     4019d0 <__setargv+0x330>
  40195b:	mov    eax,DWORD PTR [ebp-0x30]
  40195e:	test   eax,eax
  401960:	jne    4019d0 <__setargv+0x330>
  401962:	mov    edx,edi
  401964:	xor    eax,eax
  401966:	mov    DWORD PTR [ebp-0x30],0x0
  40196d:	jmp    401710 <__setargv+0x70>
  401972:	mov    BYTE PTR [eax],0x0
  401975:	lea    eax,[ebp-0x28]
  401978:	mov    DWORD PTR [esp+0x8],0x0
  401980:	mov    DWORD PTR [esp+0xc],eax
  401984:	mov    eax,DWORD PTR [ebp-0x38]
  401987:	mov    DWORD PTR [esp+0x4],eax
  40198b:	mov    eax,DWORD PTR [ebp-0x34]
  40198e:	mov    DWORD PTR [esp],eax
  401991:	call   4031f0 <___mingw_glob>
  401996:	jmp    4017bf <__setargv+0x11f>
  40199b:	nop
  40199c:	lea    esi,[esi+eiz*1+0x0]
  4019a0:	call   4012a0 <__mingw32_init_mainargs>
  4019a5:	lea    esp,[ebp-0xc]
  4019a8:	pop    ebx
  4019a9:	pop    esi
  4019aa:	pop    edi
  4019ab:	pop    ebp
  4019ac:	ret
  4019ad:	lea    edx,[ecx+0x1]
  4019b0:	mov    BYTE PTR [ecx],0x27
  4019b3:	xor    eax,eax
  4019b5:	mov    DWORD PTR [ebp-0x30],0x1
  4019bc:	jmp    401710 <__setargv+0x70>
  4019c1:	mov    BYTE PTR [edx],0x5c
  4019c4:	add    edx,0x1
  4019c7:	jmp    401710 <__setargv+0x70>
  4019cc:	lea    esi,[esi+eiz*1+0x0]
  4019d0:	lea    eax,[ebp-0x28]
  4019d3:	mov    BYTE PTR [edi],0x0
  4019d6:	mov    DWORD PTR [esp+0x8],0x0
  4019de:	mov    DWORD PTR [esp+0xc],eax
  4019e2:	mov    ebx,DWORD PTR [ebp-0x38]
  4019e5:	mov    DWORD PTR [esp+0x4],ebx
  4019e9:	mov    edi,DWORD PTR [ebp-0x34]
  4019ec:	mov    DWORD PTR [esp],edi
  4019ef:	call   4031f0 <___mingw_glob>
  4019f4:	mov    eax,ebx
  4019f6:	mov    edx,edi
  4019f8:	mov    DWORD PTR [ebp-0x30],0x0
  4019ff:	or     eax,0x1
  401a02:	mov    DWORD PTR [ebp-0x38],eax
  401a05:	xor    eax,eax
  401a07:	jmp    401710 <__setargv+0x70>
  401a0c:	mov    eax,DWORD PTR [ebp-0x2c]
  401a0f:	test   eax,eax
  401a11:	setne  al
  401a14:	cmp    ecx,0x7f
  401a17:	sete   cl
  401a1a:	or     ecx,eax
  401a1c:	mov    eax,edx
  401a1e:	jmp    40182b <__setargv+0x18b>
  401a23:	mov    edi,edx
  401a25:	jmp    40186b <__setargv+0x1cb>
  401a2a:	mov    ecx,edx
  401a2c:	jmp    40175e <__setargv+0xbe>
  401a31:	mov    eax,edx
  401a33:	jmp    4017ab <__setargv+0x10b>
  401a38:	mov    ecx,edx
  401a3a:	jmp    40190b <__setargv+0x26b>
  401a3f:	nop

00401a40 <___cpu_features_init>:
  401a40:	pushf
  401a41:	pushf
  401a42:	pop    eax
  401a43:	mov    edx,eax
  401a45:	xor    eax,0x200000
  401a4a:	push   eax
  401a4b:	popf
  401a4c:	pushf
  401a4d:	pop    eax
  401a4e:	popf
  401a4f:	xor    eax,edx
  401a51:	test   eax,0x200000
  401a56:	je     401b45 <___cpu_features_init+0x105>
  401a5c:	push   ebx
  401a5d:	xor    eax,eax
  401a5f:	cpuid
  401a61:	test   eax,eax
  401a63:	je     401b44 <___cpu_features_init+0x104>
  401a69:	mov    eax,0x1
  401a6e:	cpuid
  401a70:	xor    eax,eax
  401a72:	test   dh,0x1
  401a75:	je     401a7a <___cpu_features_init+0x3a>
  401a77:	or     eax,0x1
  401a7a:	test   ch,0x20
  401a7d:	je     401a84 <___cpu_features_init+0x44>
  401a7f:	or     eax,0x80
  401a84:	test   dh,0x80
  401a87:	je     401a8c <___cpu_features_init+0x4c>
  401a89:	or     eax,0x2
  401a8c:	test   edx,0x800000
  401a92:	je     401a97 <___cpu_features_init+0x57>
  401a94:	or     eax,0x4
  401a97:	test   edx,0x1000000
  401a9d:	je     401b0c <___cpu_features_init+0xcc>
  401a9f:	or     eax,0x8
  401aa2:	push   ebp
  401aa3:	mov    ebp,esp
  401aa5:	sub    esp,0x200
  401aab:	and    esp,0xfffffff0
  401aae:	fxsave [esp]
  401ab2:	mov    ebx,DWORD PTR [esp+0xc8]
  401ab9:	xor    DWORD PTR [esp+0xc8],0x13c0de
  401ac4:	fxrstor [esp]
  401ac8:	mov    DWORD PTR [esp+0xc8],ebx
  401acf:	fxsave [esp]
  401ad3:	xchg   DWORD PTR [esp+0xc8],ebx
  401ada:	fxrstor [esp]
  401ade:	xor    ebx,DWORD PTR [esp+0xc8]
  401ae5:	leave
  401ae6:	cmp    ebx,0x13c0de
  401aec:	jne    401b0c <___cpu_features_init+0xcc>
  401aee:	test   edx,0x2000000
  401af4:	je     401af9 <___cpu_features_init+0xb9>
  401af6:	or     eax,0x10
  401af9:	test   edx,0x4000000
  401aff:	je     401b04 <___cpu_features_init+0xc4>
  401b01:	or     eax,0x20
  401b04:	test   cl,0x1
  401b07:	je     401b0c <___cpu_features_init+0xcc>
  401b09:	or     eax,0x40
  401b0c:	mov    ds:0x407034,eax
  401b11:	mov    eax,0x80000000
  401b16:	cpuid
  401b18:	cmp    eax,0x80000000
  401b1d:	jbe    401b44 <___cpu_features_init+0x104>
  401b1f:	mov    eax,0x80000001
  401b24:	cpuid
  401b26:	xor    eax,eax
  401b28:	test   edx,edx
  401b2a:	jns    401b31 <___cpu_features_init+0xf1>
  401b2c:	mov    eax,0x100
  401b31:	test   edx,0x40000000
  401b37:	je     401b3e <___cpu_features_init+0xfe>
  401b39:	or     eax,0x200
  401b3e:	or     DWORD PTR ds:0x407034,eax
  401b44:	pop    ebx
  401b45:	repz ret
  401b47:	nop
  401b48:	nop
  401b49:	nop
  401b4a:	nop
  401b4b:	nop
  401b4c:	nop
  401b4d:	nop
  401b4e:	nop
  401b4f:	nop

00401b50 <___do_global_dtors>:
  401b50:	mov    eax,ds:0x404010
  401b55:	mov    eax,DWORD PTR [eax]
  401b57:	test   eax,eax
  401b59:	je     401b7a <___do_global_dtors+0x2a>
  401b5b:	sub    esp,0xc
  401b5e:	xchg   ax,ax
  401b60:	call   eax
  401b62:	mov    eax,ds:0x404010
  401b67:	lea    edx,[eax+0x4]
  401b6a:	mov    eax,DWORD PTR [eax+0x4]
  401b6d:	mov    DWORD PTR ds:0x404010,edx
  401b73:	test   eax,eax
  401b75:	jne    401b60 <___do_global_dtors+0x10>
  401b77:	add    esp,0xc
  401b7a:	repz ret
  401b7c:	lea    esi,[esi+eiz*1+0x0]

00401b80 <___do_global_ctors>:
  401b80:	push   ebx
  401b81:	sub    esp,0x18
  401b84:	mov    ebx,DWORD PTR ds:0x403dd0
  401b8a:	cmp    ebx,0xffffffff
  401b8d:	je     401bb0 <___do_global_ctors+0x30>
  401b8f:	test   ebx,ebx
  401b91:	je     401b9f <___do_global_ctors+0x1f>
  401b93:	call   DWORD PTR [ebx*4+0x403dd0]
  401b9a:	sub    ebx,0x1
  401b9d:	jne    401b93 <___do_global_ctors+0x13>
  401b9f:	mov    DWORD PTR [esp],0x401b50
  401ba6:	call   401320 <_atexit>
  401bab:	add    esp,0x18
  401bae:	pop    ebx
  401baf:	ret
  401bb0:	xor    ebx,ebx
  401bb2:	jmp    401bb6 <___do_global_ctors+0x36>
  401bb4:	mov    ebx,eax
  401bb6:	lea    eax,[ebx+0x1]
  401bb9:	mov    edx,DWORD PTR [eax*4+0x403dd0]
  401bc0:	test   edx,edx
  401bc2:	jne    401bb4 <___do_global_ctors+0x34>
  401bc4:	jmp    401b8f <___do_global_ctors+0xf>
  401bc6:	lea    esi,[esi+0x0]
  401bc9:	lea    edi,[edi+eiz*1+0x0]

00401bd0 <___main>:
  401bd0:	mov    eax,ds:0x407038
  401bd5:	test   eax,eax
  401bd7:	je     401be0 <___main+0x10>
  401bd9:	repz ret
  401bdb:	nop
  401bdc:	lea    esi,[esi+eiz*1+0x0]
  401be0:	mov    DWORD PTR ds:0x407038,0x1
  401bea:	jmp    401b80 <___do_global_ctors>
  401bec:	nop
  401bed:	nop
  401bee:	nop
  401bef:	nop

00401bf0 <.text>:
  401bf0:	sub    esp,0x1c
  401bf3:	mov    eax,DWORD PTR [esp+0x24]
  401bf7:	cmp    eax,0x3
  401bfa:	je     401c10 <.text+0x20>
  401bfc:	test   eax,eax
  401bfe:	je     401c10 <.text+0x20>
  401c00:	mov    eax,0x1
  401c05:	add    esp,0x1c
  401c08:	ret    0xc
  401c0b:	nop
  401c0c:	lea    esi,[esi+eiz*1+0x0]
  401c10:	mov    edx,DWORD PTR [esp+0x28]
  401c14:	mov    DWORD PTR [esp+0x4],eax
  401c18:	mov    eax,DWORD PTR [esp+0x20]
  401c1c:	mov    DWORD PTR [esp+0x8],edx
  401c20:	mov    DWORD PTR [esp],eax
  401c23:	call   401e70 <___mingw_TLScallback>
  401c28:	mov    eax,0x1
  401c2d:	add    esp,0x1c
  401c30:	ret    0xc
  401c33:	lea    esi,[esi+0x0]
  401c39:	lea    edi,[edi+eiz*1+0x0]

00401c40 <___dyn_tls_init@12>:
  401c40:	push   esi
  401c41:	push   ebx
  401c42:	sub    esp,0x14
  401c45:	cmp    DWORD PTR ds:0x407074,0x2
  401c4c:	mov    eax,DWORD PTR [esp+0x24]
  401c50:	je     401c5c <___dyn_tls_init@12+0x1c>
  401c52:	mov    DWORD PTR ds:0x407074,0x2
  401c5c:	cmp    eax,0x2
  401c5f:	je     401c73 <___dyn_tls_init@12+0x33>
  401c61:	cmp    eax,0x1
  401c64:	je     401ca5 <___dyn_tls_init@12+0x65>
  401c66:	add    esp,0x14
  401c69:	mov    eax,0x1
  401c6e:	pop    ebx
  401c6f:	pop    esi
  401c70:	ret    0xc
  401c73:	mov    esi,0x409014
  401c78:	sub    esi,0x409014
  401c7e:	cmp    esi,0x3
  401c81:	jle    401c66 <___dyn_tls_init@12+0x26>
  401c83:	xor    ebx,ebx
  401c85:	mov    eax,DWORD PTR [ebx+0x409014]
  401c8b:	test   eax,eax
  401c8d:	je     401c91 <___dyn_tls_init@12+0x51>
  401c8f:	call   eax
  401c91:	add    ebx,0x4
  401c94:	cmp    esi,ebx
  401c96:	jne    401c85 <___dyn_tls_init@12+0x45>
  401c98:	add    esp,0x14
  401c9b:	mov    eax,0x1
  401ca0:	pop    ebx
  401ca1:	pop    esi
  401ca2:	ret    0xc
  401ca5:	mov    eax,DWORD PTR [esp+0x28]
  401ca9:	mov    DWORD PTR [esp+0x4],0x1
  401cb1:	mov    DWORD PTR [esp+0x8],eax
  401cb5:	mov    eax,DWORD PTR [esp+0x20]
  401cb9:	mov    DWORD PTR [esp],eax
  401cbc:	call   401e70 <___mingw_TLScallback>
  401cc1:	jmp    401c66 <___dyn_tls_init@12+0x26>
  401cc3:	lea    esi,[esi+0x0]
  401cc9:	lea    edi,[edi+eiz*1+0x0]

00401cd0 <___tlregdtor>:
  401cd0:	xor    eax,eax
  401cd2:	ret
  401cd3:	nop
  401cd4:	nop
  401cd5:	nop
  401cd6:	nop
  401cd7:	nop
  401cd8:	nop
  401cd9:	nop
  401cda:	nop
  401cdb:	nop
  401cdc:	nop
  401cdd:	nop
  401cde:	nop
  401cdf:	nop

00401ce0 <.text>:
  401ce0:	push   esi
  401ce1:	push   ebx
  401ce2:	sub    esp,0x14
  401ce5:	mov    DWORD PTR [esp],0x407054
  401cec:	call   403da0 <_EnterCriticalSection@4>
  401cf1:	mov    ebx,DWORD PTR ds:0x40704c
  401cf7:	sub    esp,0x4
  401cfa:	test   ebx,ebx
  401cfc:	je     401d2b <.text+0x4b>
  401cfe:	xchg   ax,ax
  401d00:	mov    eax,DWORD PTR [ebx]
  401d02:	mov    DWORD PTR [esp],eax
  401d05:	call   403d20 <_TlsGetValue@4>
  401d0a:	sub    esp,0x4
  401d0d:	mov    esi,eax
  401d0f:	call   403d68 <_GetLastError@0>
  401d14:	test   eax,eax
  401d16:	jne    401d24 <.text+0x44>
  401d18:	test   esi,esi
  401d1a:	je     401d24 <.text+0x44>
  401d1c:	mov    eax,DWORD PTR [ebx+0x4]
  401d1f:	mov    DWORD PTR [esp],esi
  401d22:	call   eax
  401d24:	mov    ebx,DWORD PTR [ebx+0x8]
  401d27:	test   ebx,ebx
  401d29:	jne    401d00 <.text+0x20>
  401d2b:	mov    DWORD PTR [esp],0x407054
  401d32:	call   403d40 <_LeaveCriticalSection@4>
  401d37:	sub    esp,0x4
  401d3a:	add    esp,0x14
  401d3d:	pop    ebx
  401d3e:	pop    esi
  401d3f:	ret

00401d40 <____w64_mingwthr_add_key_dtor>:
  401d40:	push   esi
  401d41:	push   ebx
  401d42:	xor    esi,esi
  401d44:	sub    esp,0x14
  401d47:	mov    eax,ds:0x407050
  401d4c:	test   eax,eax
  401d4e:	jne    401d60 <____w64_mingwthr_add_key_dtor+0x20>
  401d50:	add    esp,0x14
  401d53:	mov    eax,esi
  401d55:	pop    ebx
  401d56:	pop    esi
  401d57:	ret
  401d58:	nop
  401d59:	lea    esi,[esi+eiz*1+0x0]
  401d60:	mov    DWORD PTR [esp+0x4],0xc
  401d68:	mov    DWORD PTR [esp],0x1
  401d6f:	call   403cc0 <_calloc>
  401d74:	test   eax,eax
  401d76:	mov    ebx,eax
  401d78:	je     401dbb <____w64_mingwthr_add_key_dtor+0x7b>
  401d7a:	mov    eax,DWORD PTR [esp+0x20]
  401d7e:	mov    DWORD PTR [esp],0x407054
  401d85:	mov    DWORD PTR [ebx],eax
  401d87:	mov    eax,DWORD PTR [esp+0x24]
  401d8b:	mov    DWORD PTR [ebx+0x4],eax
  401d8e:	call   403da0 <_EnterCriticalSection@4>
  401d93:	mov    eax,ds:0x40704c
  401d98:	sub    esp,0x4
  401d9b:	mov    DWORD PTR ds:0x40704c,ebx
  401da1:	mov    DWORD PTR [esp],0x407054
  401da8:	mov    DWORD PTR [ebx+0x8],eax
  401dab:	call   403d40 <_LeaveCriticalSection@4>
  401db0:	sub    esp,0x4
  401db3:	mov    eax,esi
  401db5:	add    esp,0x14
  401db8:	pop    ebx
  401db9:	pop    esi
  401dba:	ret
  401dbb:	mov    esi,0xffffffff
  401dc0:	jmp    401d50 <____w64_mingwthr_add_key_dtor+0x10>
  401dc2:	lea    esi,[esi+eiz*1+0x0]
  401dc9:	lea    edi,[edi+eiz*1+0x0]

00401dd0 <____w64_mingwthr_remove_key_dtor>:
  401dd0:	push   ebx
  401dd1:	sub    esp,0x18
  401dd4:	mov    eax,ds:0x407050
  401dd9:	mov    ebx,DWORD PTR [esp+0x20]
  401ddd:	test   eax,eax
  401ddf:	jne    401df0 <____w64_mingwthr_remove_key_dtor+0x20>
  401de1:	add    esp,0x18
  401de4:	xor    eax,eax
  401de6:	pop    ebx
  401de7:	ret
  401de8:	nop
  401de9:	lea    esi,[esi+eiz*1+0x0]
  401df0:	mov    DWORD PTR [esp],0x407054
  401df7:	call   403da0 <_EnterCriticalSection@4>
  401dfc:	mov    edx,DWORD PTR ds:0x40704c
  401e02:	sub    esp,0x4
  401e05:	test   edx,edx
  401e07:	je     401e20 <____w64_mingwthr_remove_key_dtor+0x50>
  401e09:	mov    eax,DWORD PTR [edx]
  401e0b:	cmp    ebx,eax
  401e0d:	jne    401e19 <____w64_mingwthr_remove_key_dtor+0x49>
  401e0f:	jmp    401e5f <____w64_mingwthr_remove_key_dtor+0x8f>
  401e11:	mov    ecx,DWORD PTR [eax]
  401e13:	cmp    ecx,ebx
  401e15:	je     401e40 <____w64_mingwthr_remove_key_dtor+0x70>
  401e17:	mov    edx,eax
  401e19:	mov    eax,DWORD PTR [edx+0x8]
  401e1c:	test   eax,eax
  401e1e:	jne    401e11 <____w64_mingwthr_remove_key_dtor+0x41>
  401e20:	mov    DWORD PTR [esp],0x407054
  401e27:	call   403d40 <_LeaveCriticalSection@4>
  401e2c:	sub    esp,0x4
  401e2f:	add    esp,0x18
  401e32:	xor    eax,eax
  401e34:	pop    ebx
  401e35:	ret
  401e36:	lea    esi,[esi+0x0]
  401e39:	lea    edi,[edi+eiz*1+0x0]
  401e40:	mov    ecx,DWORD PTR [eax+0x8]
  401e43:	mov    DWORD PTR [edx+0x8],ecx
  401e46:	mov    DWORD PTR [esp],eax
  401e49:	call   403cb0 <_free>
  401e4e:	mov    DWORD PTR [esp],0x407054
  401e55:	call   403d40 <_LeaveCriticalSection@4>
  401e5a:	sub    esp,0x4
  401e5d:	jmp    401e2f <____w64_mingwthr_remove_key_dtor+0x5f>
  401e5f:	mov    eax,DWORD PTR [edx+0x8]
  401e62:	mov    ds:0x40704c,eax
  401e67:	mov    eax,edx
  401e69:	jmp    401e46 <____w64_mingwthr_remove_key_dtor+0x76>
  401e6b:	nop
  401e6c:	lea    esi,[esi+eiz*1+0x0]

00401e70 <___mingw_TLScallback>:
  401e70:	sub    esp,0x1c
  401e73:	mov    eax,DWORD PTR [esp+0x24]
  401e77:	cmp    eax,0x1
  401e7a:	je     401ec3 <___mingw_TLScallback+0x53>
  401e7c:	jb     401e95 <___mingw_TLScallback+0x25>
  401e7e:	cmp    eax,0x3
  401e81:	jne    401e8c <___mingw_TLScallback+0x1c>
  401e83:	mov    eax,ds:0x407050
  401e88:	test   eax,eax
  401e8a:	jne    401ef1 <___mingw_TLScallback+0x81>
  401e8c:	mov    eax,0x1
  401e91:	add    esp,0x1c
  401e94:	ret
  401e95:	mov    eax,ds:0x407050
  401e9a:	test   eax,eax
  401e9c:	jne    401f00 <___mingw_TLScallback+0x90>
  401e9e:	mov    eax,ds:0x407050
  401ea3:	cmp    eax,0x1
  401ea6:	jne    401e8c <___mingw_TLScallback+0x1c>
  401ea8:	mov    DWORD PTR [esp],0x407054
  401eaf:	mov    DWORD PTR ds:0x407050,0x0
  401eb9:	call   403da8 <_DeleteCriticalSection@4>
  401ebe:	sub    esp,0x4
  401ec1:	jmp    401e8c <___mingw_TLScallback+0x1c>
  401ec3:	mov    eax,ds:0x407050
  401ec8:	test   eax,eax
  401eca:	je     401ee0 <___mingw_TLScallback+0x70>
  401ecc:	mov    DWORD PTR ds:0x407050,0x1
  401ed6:	mov    eax,0x1
  401edb:	add    esp,0x1c
  401ede:	ret
  401edf:	nop
  401ee0:	mov    DWORD PTR [esp],0x407054
  401ee7:	call   403d50 <_InitializeCriticalSection@4>
  401eec:	sub    esp,0x4
  401eef:	jmp    401ecc <___mingw_TLScallback+0x5c>
  401ef1:	call   401ce0 <.text>
  401ef6:	jmp    401e8c <___mingw_TLScallback+0x1c>
  401ef8:	nop
  401ef9:	lea    esi,[esi+eiz*1+0x0]
  401f00:	call   401ce0 <.text>
  401f05:	jmp    401e9e <___mingw_TLScallback+0x2e>
  401f07:	nop
  401f08:	nop
  401f09:	nop
  401f0a:	nop
  401f0b:	nop
  401f0c:	nop
  401f0d:	nop
  401f0e:	nop
  401f0f:	nop

00401f10 <.text>:
  401f10:	push   esi
  401f11:	push   ebx
  401f12:	sub    esp,0x14
  401f15:	mov    eax,ds:0x4081c4
  401f1a:	mov    DWORD PTR [esp+0x8],0x17
  401f22:	mov    DWORD PTR [esp+0x4],0x1
  401f2a:	lea    esi,[esp+0x24]
  401f2e:	mov    DWORD PTR [esp],0x405170
  401f35:	lea    ebx,[eax+0x40]
  401f38:	mov    DWORD PTR [esp+0xc],ebx
  401f3c:	call   403ca8 <_fwrite>
  401f41:	mov    eax,DWORD PTR [esp+0x20]
  401f45:	mov    DWORD PTR [esp+0x8],esi
  401f49:	mov    DWORD PTR [esp],ebx
  401f4c:	mov    DWORD PTR [esp+0x4],eax
  401f50:	call   403c38 <_vfprintf>
  401f55:	call   403cc8 <_abort>
  401f5a:	lea    esi,[esi+0x0]
  401f60:	push   ebp
  401f61:	push   edi
  401f62:	mov    edi,ecx
  401f64:	push   esi
  401f65:	push   ebx
  401f66:	mov    ebx,eax
  401f68:	mov    esi,edx
  401f6a:	sub    esp,0x4c
  401f6d:	lea    eax,[esp+0x24]
  401f71:	mov    DWORD PTR [esp+0x8],0x1c
  401f79:	mov    DWORD PTR [esp],ebx
  401f7c:	mov    DWORD PTR [esp+0x4],eax
  401f80:	call   403d10 <_VirtualQuery@12>
  401f85:	sub    esp,0xc
  401f88:	test   eax,eax
  401f8a:	je     402038 <.text+0x128>
  401f90:	mov    eax,DWORD PTR [esp+0x38]
  401f94:	cmp    eax,0x40
  401f97:	je     401f9e <.text+0x8e>
  401f99:	cmp    eax,0x4
  401f9c:	jne    401fc0 <.text+0xb0>
  401f9e:	mov    DWORD PTR [esp+0x8],edi
  401fa2:	mov    DWORD PTR [esp+0x4],esi
  401fa6:	mov    DWORD PTR [esp],ebx
  401fa9:	call   403c90 <_memcpy>
  401fae:	add    esp,0x4c
  401fb1:	pop    ebx
  401fb2:	pop    esi
  401fb3:	pop    edi
  401fb4:	pop    ebp
  401fb5:	ret
  401fb6:	lea    esi,[esi+0x0]
  401fb9:	lea    edi,[edi+eiz*1+0x0]
  401fc0:	mov    eax,DWORD PTR [esp+0x30]
  401fc4:	lea    ebp,[esp+0x20]
  401fc8:	mov    DWORD PTR [esp+0x8],0x40
  401fd0:	mov    DWORD PTR [esp+0xc],ebp
  401fd4:	mov    DWORD PTR [esp+0x4],eax
  401fd8:	mov    eax,DWORD PTR [esp+0x24]
  401fdc:	mov    DWORD PTR [esp],eax
  401fdf:	call   403d18 <_VirtualProtect@16>
  401fe4:	sub    esp,0x10
  401fe7:	mov    edx,DWORD PTR [esp+0x38]
  401feb:	mov    DWORD PTR [esp+0x8],edi
  401fef:	mov    DWORD PTR [esp+0x4],esi
  401ff3:	mov    DWORD PTR [esp],ebx
  401ff6:	mov    DWORD PTR [esp+0x1c],edx
  401ffa:	call   403c90 <_memcpy>
  401fff:	mov    edx,DWORD PTR [esp+0x1c]
  402003:	cmp    edx,0x40
  402006:	je     401fae <.text+0x9e>
  402008:	cmp    edx,0x4
  40200b:	je     401fae <.text+0x9e>
  40200d:	mov    eax,DWORD PTR [esp+0x20]
  402011:	mov    DWORD PTR [esp+0xc],ebp
  402015:	mov    DWORD PTR [esp+0x8],eax
  402019:	mov    eax,DWORD PTR [esp+0x30]
  40201d:	mov    DWORD PTR [esp+0x4],eax
  402021:	mov    eax,DWORD PTR [esp+0x24]
  402025:	mov    DWORD PTR [esp],eax
  402028:	call   403d18 <_VirtualProtect@16>
  40202d:	sub    esp,0x10
  402030:	add    esp,0x4c
  402033:	pop    ebx
  402034:	pop    esi
  402035:	pop    edi
  402036:	pop    ebp
  402037:	ret
  402038:	mov    DWORD PTR [esp+0x8],ebx
  40203c:	mov    DWORD PTR [esp+0x4],0x1c
  402044:	mov    DWORD PTR [esp],0x405188
  40204b:	call   401f10 <.text>

00402050 <__pei386_runtime_relocator>:
  402050:	mov    eax,ds:0x40706c
  402055:	test   eax,eax
  402057:	je     402060 <__pei386_runtime_relocator+0x10>
  402059:	ret
  40205a:	lea    esi,[esi+0x0]
  402060:	mov    eax,0x4053d8
  402065:	mov    DWORD PTR ds:0x40706c,0x1
  40206f:	sub    eax,0x4053d8
  402074:	cmp    eax,0x7
  402077:	jle    402059 <__pei386_runtime_relocator+0x9>
  402079:	push   edi
  40207a:	push   esi
  40207b:	push   ebx
  40207c:	sub    esp,0x20
  40207f:	cmp    eax,0xb
  402082:	jle    402170 <__pei386_runtime_relocator+0x120>
  402088:	mov    esi,DWORD PTR ds:0x4053d8
  40208e:	test   esi,esi
  402090:	jne    402125 <__pei386_runtime_relocator+0xd5>
  402096:	mov    ebx,DWORD PTR ds:0x4053dc
  40209c:	test   ebx,ebx
  40209e:	jne    402125 <__pei386_runtime_relocator+0xd5>
  4020a4:	mov    ecx,DWORD PTR ds:0x4053e0
  4020aa:	mov    ebx,0x4053e4
  4020af:	test   ecx,ecx
  4020b1:	je     402175 <__pei386_runtime_relocator+0x125>
  4020b7:	mov    ebx,0x4053d8
  4020bc:	mov    eax,DWORD PTR [ebx+0x8]
  4020bf:	cmp    eax,0x1
  4020c2:	jne    40220b <__pei386_runtime_relocator+0x1bb>
  4020c8:	add    ebx,0xc
  4020cb:	cmp    ebx,0x4053d8
  4020d1:	jae    402160 <__pei386_runtime_relocator+0x110>
  4020d7:	mov    edx,DWORD PTR [ebx]
  4020d9:	mov    edi,DWORD PTR [ebx+0x4]
  4020dc:	lea    esi,[edx+0x400000]
  4020e2:	mov    ecx,DWORD PTR [edx+0x400000]
  4020e8:	movzx  edx,BYTE PTR [ebx+0x8]
  4020ec:	lea    eax,[edi+0x400000]
  4020f2:	cmp    edx,0x10
  4020f5:	je     402190 <__pei386_runtime_relocator+0x140>
  4020fb:	cmp    edx,0x20
  4020fe:	je     4021f0 <__pei386_runtime_relocator+0x1a0>
  402104:	cmp    edx,0x8
  402107:	je     4021c0 <__pei386_runtime_relocator+0x170>
  40210d:	mov    DWORD PTR [esp+0x4],edx
  402111:	mov    DWORD PTR [esp],0x4051f0
  402118:	mov    DWORD PTR [esp+0x1c],0x0
  402120:	call   401f10 <.text>
  402125:	mov    ebx,0x4053d8
  40212a:	cmp    ebx,0x4053d8
  402130:	jae    402160 <__pei386_runtime_relocator+0x110>
  402132:	mov    ecx,DWORD PTR [ebx+0x4]
  402135:	mov    edx,DWORD PTR [ebx]
  402137:	add    ebx,0x8
  40213a:	add    edx,DWORD PTR [ecx+0x400000]
  402140:	lea    eax,[ecx+0x400000]
  402146:	mov    ecx,0x4
  40214b:	mov    DWORD PTR [esp+0x1c],edx
  40214f:	lea    edx,[esp+0x1c]
  402153:	call   401f60 <.text+0x50>
  402158:	cmp    ebx,0x4053d8
  40215e:	jb     402132 <__pei386_runtime_relocator+0xe2>
  402160:	add    esp,0x20
  402163:	pop    ebx
  402164:	pop    esi
  402165:	pop    edi
  402166:	ret
  402167:	mov    esi,esi
  402169:	lea    edi,[edi+eiz*1+0x0]
  402170:	mov    ebx,0x4053d8
  402175:	mov    edx,DWORD PTR [ebx]
  402177:	test   edx,edx
  402179:	jne    40212a <__pei386_runtime_relocator+0xda>
  40217b:	mov    eax,DWORD PTR [ebx+0x4]
  40217e:	test   eax,eax
  402180:	je     4020bc <__pei386_runtime_relocator+0x6c>
  402186:	jmp    40212a <__pei386_runtime_relocator+0xda>
  402188:	nop
  402189:	lea    esi,[esi+eiz*1+0x0]
  402190:	movzx  edx,WORD PTR [edi+0x400000]
  402197:	test   dx,dx
  40219a:	jns    4021a2 <__pei386_runtime_relocator+0x152>
  40219c:	or     edx,0xffff0000
  4021a2:	sub    edx,esi
  4021a4:	add    ecx,edx
  4021a6:	lea    edx,[esp+0x1c]
  4021aa:	mov    DWORD PTR [esp+0x1c],ecx
  4021ae:	mov    ecx,0x2
  4021b3:	call   401f60 <.text+0x50>
  4021b8:	jmp    4020c8 <__pei386_runtime_relocator+0x78>
  4021bd:	lea    esi,[esi+0x0]
  4021c0:	movzx  edi,BYTE PTR [eax]
  4021c3:	mov    edx,edi
  4021c5:	test   dl,dl
  4021c7:	jns    4021cf <__pei386_runtime_relocator+0x17f>
  4021c9:	or     edi,0xffffff00
  4021cf:	sub    edi,esi
  4021d1:	lea    edx,[esp+0x1c]
  4021d5:	add    ecx,edi
  4021d7:	mov    DWORD PTR [esp+0x1c],ecx
  4021db:	mov    ecx,0x1
  4021e0:	call   401f60 <.text+0x50>
  4021e5:	jmp    4020c8 <__pei386_runtime_relocator+0x78>
  4021ea:	lea    esi,[esi+0x0]
  4021f0:	sub    ecx,esi
  4021f2:	add    ecx,DWORD PTR [eax]
  4021f4:	lea    edx,[esp+0x1c]
  4021f8:	mov    DWORD PTR [esp+0x1c],ecx
  4021fc:	mov    ecx,0x4
  402201:	call   401f60 <.text+0x50>
  402206:	jmp    4020c8 <__pei386_runtime_relocator+0x78>
  40220b:	mov    DWORD PTR [esp+0x4],eax
  40220f:	mov    DWORD PTR [esp],0x4051bc
  402216:	call   401f10 <.text>
  40221b:	nop
  40221c:	nop
  40221d:	nop
  40221e:	nop
  40221f:	nop

00402220 <___chkstk_ms>:
  402220:	push   ecx
  402221:	push   eax
  402222:	cmp    eax,0x1000
  402227:	lea    ecx,[esp+0xc]
  40222b:	jb     402242 <___chkstk_ms+0x22>
  40222d:	sub    ecx,0x1000
  402233:	or     DWORD PTR [ecx],0x0
  402236:	sub    eax,0x1000
  40223b:	cmp    eax,0x1000
  402240:	ja     40222d <___chkstk_ms+0xd>
  402242:	sub    ecx,eax
  402244:	or     DWORD PTR [ecx],0x0
  402247:	pop    eax
  402248:	pop    ecx
  402249:	ret
  40224a:	nop
  40224b:	nop

0040224c <.text>:
  40224c:	xchg   ax,ax
  40224e:	xchg   ax,ax

00402250 <_fesetenv>:
  402250:	sub    esp,0x1c
  402253:	mov    eax,DWORD PTR [esp+0x20]
  402257:	mov    DWORD PTR [esp+0xc],0x1f80
  40225f:	cmp    eax,0xfffffffd
  402262:	je     402295 <_fesetenv+0x45>
  402264:	cmp    eax,0xfffffffc
  402267:	je     4022a3 <_fesetenv+0x53>
  402269:	test   eax,eax
  40226b:	je     4022b5 <_fesetenv+0x65>
  40226d:	cmp    eax,0xffffffff
  402270:	je     40229f <_fesetenv+0x4f>
  402272:	cmp    eax,0xfffffffe
  402275:	je     4022ad <_fesetenv+0x5d>
  402277:	fldenv [eax]
  402279:	movzx  eax,WORD PTR [eax+0x1c]
  40227d:	mov    DWORD PTR [esp+0xc],eax
  402281:	test   BYTE PTR ds:0x407034,0x10
  402288:	je     40228f <_fesetenv+0x3f>
  40228a:	ldmxcsr DWORD PTR [esp+0xc]
  40228f:	xor    eax,eax
  402291:	add    esp,0x1c
  402294:	ret
  402295:	mov    DWORD PTR ds:0x404014,0xffffffff
  40229f:	fninit
  4022a1:	jmp    402281 <_fesetenv+0x31>
  4022a3:	mov    DWORD PTR ds:0x404014,0xfffffffe
  4022ad:	call   DWORD PTR ds:0x4081bc
  4022b3:	jmp    402281 <_fesetenv+0x31>
  4022b5:	mov    eax,ds:0x404014
  4022ba:	jmp    40226d <_fesetenv+0x1d>
  4022bc:	nop
  4022bd:	nop
  4022be:	nop
  4022bf:	nop

004022c0 <.text>:
  4022c0:	test   eax,eax
  4022c2:	je     40234a <.text+0x8a>
  4022c8:	push   esi
  4022c9:	push   ebx
  4022ca:	mov    ebx,edx
  4022cc:	shr    ebx,0x5
  4022cf:	xor    ecx,ecx
  4022d1:	xor    ebx,0x1
  4022d4:	and    ebx,0x1
  4022d7:	mov    esi,esi
  4022d9:	lea    edi,[edi+eiz*1+0x0]
  4022e0:	movsx  edx,BYTE PTR [eax]
  4022e3:	test   edx,edx
  4022e5:	je     402310 <.text+0x50>
  4022e7:	test   bl,bl
  4022e9:	je     4022f0 <.text+0x30>
  4022eb:	cmp    edx,0x7f
  4022ee:	je     402330 <.text+0x70>
  4022f0:	add    eax,0x1
  4022f3:	test   ecx,ecx
  4022f5:	jne    402315 <.text+0x55>
  4022f7:	cmp    edx,0x2a
  4022fa:	je     402340 <.text+0x80>
  4022fc:	cmp    edx,0x3f
  4022ff:	je     402340 <.text+0x80>
  402301:	xor    ecx,ecx
  402303:	cmp    edx,0x5b
  402306:	movsx  edx,BYTE PTR [eax]
  402309:	sete   cl
  40230c:	test   edx,edx
  40230e:	jne    4022e7 <.text+0x27>
  402310:	mov    eax,edx
  402312:	pop    ebx
  402313:	pop    esi
  402314:	ret
  402315:	cmp    ecx,0x1
  402318:	jle    40231f <.text+0x5f>
  40231a:	cmp    edx,0x5d
  40231d:	je     402340 <.text+0x80>
  40231f:	cmp    edx,0x21
  402322:	setne  dl
  402325:	movzx  edx,dl
  402328:	add    ecx,edx
  40232a:	jmp    4022e0 <.text+0x20>
  40232c:	lea    esi,[esi+eiz*1+0x0]
  402330:	cmp    BYTE PTR [eax+0x1],0x0
  402334:	lea    esi,[eax+0x2]
  402337:	je     40234f <.text+0x8f>
  402339:	mov    eax,esi
  40233b:	jmp    4022f3 <.text+0x33>
  40233d:	lea    esi,[esi+0x0]
  402340:	mov    edx,0x1
  402345:	mov    eax,edx
  402347:	pop    ebx
  402348:	pop    esi
  402349:	ret
  40234a:	xor    edx,edx
  40234c:	mov    eax,edx
  40234e:	ret
  40234f:	xor    edx,edx
  402351:	jmp    402310 <.text+0x50>
  402353:	lea    esi,[esi+0x0]
  402359:	lea    edi,[edi+eiz*1+0x0]
  402360:	test   eax,eax
  402362:	je     4023c0 <.text+0x100>
  402364:	push   esi
  402365:	push   ebx
  402366:	mov    esi,eax
  402368:	sub    esp,0x14
  40236b:	mov    eax,DWORD PTR [eax+0xc]
  40236e:	lea    ebx,[eax+0x1]
  402371:	lea    eax,[ebx*4+0x0]
  402378:	mov    DWORD PTR [esp],eax
  40237b:	call   403ca0 <_malloc>
  402380:	mov    ecx,eax
  402382:	mov    DWORD PTR [esi+0x8],eax
  402385:	mov    eax,0x3
  40238a:	test   ecx,ecx
  40238c:	je     4023b0 <.text+0xf0>
  40238e:	test   ebx,ebx
  402390:	mov    edx,ebx
  402392:	mov    DWORD PTR [esi+0x4],0x0
  402399:	jle    4023ae <.text+0xee>
  40239b:	nop
  40239c:	lea    esi,[esi+eiz*1+0x0]
  4023a0:	sub    edx,0x1
  4023a3:	test   edx,edx
  4023a5:	mov    DWORD PTR [ecx+edx*4],0x0
  4023ac:	jne    4023a0 <.text+0xe0>
  4023ae:	xor    eax,eax
  4023b0:	add    esp,0x14
  4023b3:	pop    ebx
  4023b4:	pop    esi
  4023b5:	ret
  4023b6:	lea    esi,[esi+0x0]
  4023b9:	lea    edi,[edi+eiz*1+0x0]
  4023c0:	xor    eax,eax
  4023c2:	ret
  4023c3:	lea    esi,[esi+0x0]
  4023c9:	lea    edi,[edi+eiz*1+0x0]
  4023d0:	push   ebp
  4023d1:	push   edi
  4023d2:	mov    edi,eax
  4023d4:	push   esi
  4023d5:	push   ebx
  4023d6:	sub    esp,0x3c
  4023d9:	movsx  ebx,BYTE PTR [eax]
  4023dc:	mov    DWORD PTR [esp+0x1c],edx
  4023e0:	mov    DWORD PTR [esp+0x20],ecx
  4023e4:	cmp    ebx,0x5d
  4023e7:	mov    ebp,ebx
  4023e9:	je     402550 <.text+0x290>
  4023ef:	cmp    ebx,0x2d
  4023f2:	je     402550 <.text+0x290>
  4023f8:	mov    ecx,DWORD PTR [esp+0x1c]
  4023fc:	mov    eax,ecx
  4023fe:	not    eax
  402400:	mov    DWORD PTR [esp+0x28],eax
  402404:	mov    eax,0x1
  402409:	sub    eax,ecx
  40240b:	mov    DWORD PTR [esp+0x2c],eax
  40240f:	jmp    40241e <.text+0x15e>
  402411:	mov    esi,ebp
  402413:	sub    esi,DWORD PTR [esp+0x1c]
  402417:	test   esi,esi
  402419:	je     402483 <.text+0x1c3>
  40241b:	movsx  ebx,dl
  40241e:	cmp    ebx,0x5d
  402421:	lea    esi,[edi+0x1]
  402424:	je     402544 <.text+0x284>
  40242a:	cmp    ebx,0x2d
  40242d:	je     4024c0 <.text+0x200>
  402433:	test   ebx,ebx
  402435:	je     402544 <.text+0x284>
  40243b:	cmp    ebx,0x2f
  40243e:	je     402544 <.text+0x284>
  402444:	cmp    ebx,0x5c
  402447:	je     402544 <.text+0x284>
  40244d:	movzx  edx,BYTE PTR [esi]
  402450:	mov    ebp,ebx
  402452:	mov    edi,esi
  402454:	test   DWORD PTR [esp+0x20],0x4000
  40245c:	jne    402411 <.text+0x151>
  40245e:	mov    DWORD PTR [esp],ebp
  402461:	mov    BYTE PTR [esp+0x24],dl
  402465:	call   403c40 <_tolower>
  40246a:	mov    esi,eax
  40246c:	mov    eax,DWORD PTR [esp+0x1c]
  402470:	mov    DWORD PTR [esp],eax
  402473:	call   403c40 <_tolower>
  402478:	sub    esi,eax
  40247a:	movzx  edx,BYTE PTR [esp+0x24]
  40247f:	test   esi,esi
  402481:	jne    40241b <.text+0x15b>
  402483:	mov    eax,DWORD PTR [esp+0x20]
  402487:	and    eax,0x20
  40248a:	jmp    40249e <.text+0x1de>
  40248c:	lea    esi,[esi+eiz*1+0x0]
  402490:	add    edi,0x1
  402493:	test   dl,dl
  402495:	je     402544 <.text+0x284>
  40249b:	movzx  edx,BYTE PTR [edi]
  40249e:	cmp    dl,0x5d
  4024a1:	je     4025e5 <.text+0x325>
  4024a7:	cmp    dl,0x7f
  4024aa:	jne    402490 <.text+0x1d0>
  4024ac:	test   eax,eax
  4024ae:	jne    4025f0 <.text+0x330>
  4024b4:	movzx  edx,BYTE PTR [edi+0x1]
  4024b8:	add    edi,0x1
  4024bb:	jmp    402490 <.text+0x1d0>
  4024bd:	lea    esi,[esi+0x0]
  4024c0:	movzx  edx,BYTE PTR [edi+0x1]
  4024c4:	cmp    dl,0x5d
  4024c7:	je     402562 <.text+0x2a2>
  4024cd:	movsx  ebx,dl
  4024d0:	test   ebx,ebx
  4024d2:	je     402544 <.text+0x284>
  4024d4:	mov    ecx,DWORD PTR [esp+0x20]
  4024d8:	lea    esi,[edi+0x2]
  4024db:	and    ecx,0x4000
  4024e1:	cmp    ebp,ebx
  4024e3:	jge    4025f8 <.text+0x338>
  4024e9:	mov    DWORD PTR [esp+0x24],esi
  4024ed:	mov    eax,ebp
  4024ef:	mov    esi,ecx
  4024f1:	jmp    402504 <.text+0x244>
  4024f3:	mov    eax,DWORD PTR [esp+0x28]
  4024f7:	lea    edi,[eax+ebp*1]
  4024fa:	test   edi,edi
  4024fc:	je     402527 <.text+0x267>
  4024fe:	cmp    ebx,ebp
  402500:	mov    eax,ebp
  402502:	je     402570 <.text+0x2b0>
  402504:	test   esi,esi
  402506:	lea    ebp,[eax+0x1]
  402509:	jne    4024f3 <.text+0x233>
  40250b:	mov    DWORD PTR [esp],eax
  40250e:	call   403c40 <_tolower>
  402513:	mov    edi,eax
  402515:	mov    eax,DWORD PTR [esp+0x1c]
  402519:	mov    DWORD PTR [esp],eax
  40251c:	call   403c40 <_tolower>
  402521:	sub    edi,eax
  402523:	test   edi,edi
  402525:	jne    4024fe <.text+0x23e>
  402527:	mov    edx,DWORD PTR [esp+0x20]
  40252b:	mov    esi,DWORD PTR [esp+0x24]
  40252f:	and    edx,0x20
  402532:	movzx  eax,BYTE PTR [esi]
  402535:	cmp    al,0x5d
  402537:	je     40259a <.text+0x2da>
  402539:	cmp    al,0x7f
  40253b:	je     402580 <.text+0x2c0>
  40253d:	add    esi,0x1
  402540:	test   al,al
  402542:	jne    402532 <.text+0x272>
  402544:	add    esp,0x3c
  402547:	xor    eax,eax
  402549:	pop    ebx
  40254a:	pop    esi
  40254b:	pop    edi
  40254c:	pop    ebp
  40254d:	ret
  40254e:	xchg   ax,ax
  402550:	cmp    ebx,DWORD PTR [esp+0x1c]
  402554:	je     4025a5 <.text+0x2e5>
  402556:	movsx  ebx,BYTE PTR [edi+0x1]
  40255a:	add    edi,0x1
  40255d:	jmp    4023f8 <.text+0x138>
  402562:	mov    ebp,0x2d
  402567:	mov    edi,esi
  402569:	jmp    402454 <.text+0x194>
  40256e:	xchg   ax,ax
  402570:	mov    esi,DWORD PTR [esp+0x24]
  402574:	jmp    40243b <.text+0x17b>
  402579:	lea    esi,[esi+eiz*1+0x0]
  402580:	test   edx,edx
  402582:	jne    402590 <.text+0x2d0>
  402584:	movzx  eax,BYTE PTR [esi+0x1]
  402588:	add    esi,0x1
  40258b:	jmp    40253d <.text+0x27d>
  40258d:	lea    esi,[esi+0x0]
  402590:	add    esi,0x1
  402593:	movzx  eax,BYTE PTR [esi]
  402596:	cmp    al,0x5d
  402598:	jne    402539 <.text+0x279>
  40259a:	add    esp,0x3c
  40259d:	lea    eax,[esi+0x1]
  4025a0:	pop    ebx
  4025a1:	pop    esi
  4025a2:	pop    edi
  4025a3:	pop    ebp
  4025a4:	ret
  4025a5:	mov    edx,DWORD PTR [esp+0x20]
  4025a9:	add    edi,0x1
  4025ac:	and    edx,0x20
  4025af:	nop
  4025b0:	movzx  eax,BYTE PTR [edi]
  4025b3:	cmp    al,0x5d
  4025b5:	je     4025e5 <.text+0x325>
  4025b7:	cmp    al,0x7f
  4025b9:	je     4025d0 <.text+0x310>
  4025bb:	add    edi,0x1
  4025be:	test   al,al
  4025c0:	jne    4025b0 <.text+0x2f0>
  4025c2:	jmp    402544 <.text+0x284>
  4025c7:	mov    esi,esi
  4025c9:	lea    edi,[edi+eiz*1+0x0]
  4025d0:	test   edx,edx
  4025d2:	jne    4025e0 <.text+0x320>
  4025d4:	movzx  eax,BYTE PTR [edi+0x1]
  4025d8:	add    edi,0x1
  4025db:	jmp    4025bb <.text+0x2fb>
  4025dd:	lea    esi,[esi+0x0]
  4025e0:	add    edi,0x1
  4025e3:	jmp    4025b0 <.text+0x2f0>
  4025e5:	add    esp,0x3c
  4025e8:	lea    eax,[edi+0x1]
  4025eb:	pop    ebx
  4025ec:	pop    esi
  4025ed:	pop    edi
  4025ee:	pop    ebp
  4025ef:	ret
  4025f0:	add    edi,0x1
  4025f3:	jmp    40249b <.text+0x1db>
  4025f8:	jle    40243b <.text+0x17b>
  4025fe:	mov    DWORD PTR [esp+0x24],esi
  402602:	mov    esi,ecx
  402604:	jmp    402625 <.text+0x365>
  402606:	lea    esi,[esi+0x0]
  402609:	lea    edi,[edi+eiz*1+0x0]
  402610:	mov    eax,DWORD PTR [esp+0x2c]
  402614:	lea    ebp,[eax+edi*1]
  402617:	test   ebp,ebp
  402619:	je     402648 <.text+0x388>
  40261b:	cmp    ebx,edi
  40261d:	mov    ebp,edi
  40261f:	je     402570 <.text+0x2b0>
  402625:	test   esi,esi
  402627:	lea    edi,[ebp-0x1]
  40262a:	jne    402610 <.text+0x350>
  40262c:	mov    DWORD PTR [esp],ebp
  40262f:	call   403c40 <_tolower>
  402634:	mov    ebp,eax
  402636:	mov    eax,DWORD PTR [esp+0x1c]
  40263a:	mov    DWORD PTR [esp],eax
  40263d:	call   403c40 <_tolower>
  402642:	sub    ebp,eax
  402644:	test   ebp,ebp
  402646:	jne    40261b <.text+0x35b>
  402648:	mov    edx,DWORD PTR [esp+0x20]
  40264c:	mov    esi,DWORD PTR [esp+0x24]
  402650:	and    edx,0x20
  402653:	movzx  eax,BYTE PTR [esi]
  402656:	cmp    al,0x5d
  402658:	je     40259a <.text+0x2da>
  40265e:	cmp    al,0x7f
  402660:	je     402670 <.text+0x3b0>
  402662:	add    esi,0x1
  402665:	test   al,al
  402667:	jne    402653 <.text+0x393>
  402669:	jmp    402544 <.text+0x284>
  40266e:	xchg   ax,ax
  402670:	test   edx,edx
  402672:	jne    402680 <.text+0x3c0>
  402674:	movzx  eax,BYTE PTR [esi+0x1]
  402678:	add    esi,0x1
  40267b:	jmp    402662 <.text+0x3a2>
  40267d:	lea    esi,[esi+0x0]
  402680:	add    esi,0x1
  402683:	jmp    402653 <.text+0x393>
  402685:	lea    esi,[esi+eiz*1+0x0]
  402689:	lea    edi,[edi+eiz*1+0x0]
  402690:	push   ebp
  402691:	push   edi
  402692:	mov    ebp,eax
  402694:	push   esi
  402695:	push   ebx
  402696:	sub    esp,0x2c
  402699:	cmp    BYTE PTR [edx],0x2e
  40269c:	mov    DWORD PTR [esp+0x14],ecx
  4026a0:	movzx  ecx,BYTE PTR [eax]
  4026a3:	je     4027e0 <.text+0x520>
  4026a9:	mov    eax,DWORD PTR [esp+0x14]
  4026ad:	lea    edi,[edx+0x1]
  4026b0:	shr    eax,0x5
  4026b3:	xor    eax,0x1
  4026b6:	mov    DWORD PTR [esp+0x18],eax
  4026ba:	movsx  edx,cl
  4026bd:	lea    esi,[edi-0x1]
  4026c0:	lea    eax,[ebp+0x1]
  4026c3:	test   edx,edx
  4026c5:	je     402834 <.text+0x574>
  4026cb:	cmp    cl,0x3f
  4026ce:	je     4027c1 <.text+0x501>
  4026d4:	cmp    cl,0x5b
  4026d7:	je     402790 <.text+0x4d0>
  4026dd:	cmp    cl,0x2a
  4026e0:	je     402740 <.text+0x480>
  4026e2:	test   BYTE PTR [esp+0x18],0x1
  4026e7:	je     4026f2 <.text+0x432>
  4026e9:	cmp    edx,0x7f
  4026ec:	je     402820 <.text+0x560>
  4026f2:	mov    ebp,eax
  4026f4:	movsx  ebx,BYTE PTR [edi-0x1]
  4026f8:	test   bl,bl
  4026fa:	je     402886 <.text+0x5c6>
  402700:	test   DWORD PTR [esp+0x14],0x4000
  402708:	jne    4027d0 <.text+0x510>
  40270e:	mov    DWORD PTR [esp],edx
  402711:	mov    DWORD PTR [esp+0x1c],edx
  402715:	call   403c40 <_tolower>
  40271a:	mov    DWORD PTR [esp],ebx
  40271d:	mov    esi,eax
  40271f:	call   403c40 <_tolower>
  402724:	mov    edx,DWORD PTR [esp+0x1c]
  402728:	sub    esi,eax
  40272a:	test   esi,esi
  40272c:	je     4027b5 <.text+0x4f5>
  402732:	mov    eax,edx
  402734:	sub    eax,ebx
  402736:	add    esp,0x2c
  402739:	pop    ebx
  40273a:	pop    esi
  40273b:	pop    edi
  40273c:	pop    ebp
  40273d:	ret
  40273e:	xchg   ax,ax
  402740:	movzx  edx,BYTE PTR [ebp+0x1]
  402744:	mov    ebx,eax
  402746:	cmp    dl,0x2a
  402749:	jne    40275b <.text+0x49b>
  40274b:	nop
  40274c:	lea    esi,[esi+eiz*1+0x0]
  402750:	add    ebx,0x1
  402753:	movzx  edx,BYTE PTR [ebx]
  402756:	cmp    dl,0x2a
  402759:	je     402750 <.text+0x490>
  40275b:	xor    eax,eax
  40275d:	test   dl,dl
  40275f:	je     402736 <.text+0x476>
  402761:	mov    edi,DWORD PTR [esp+0x14]
  402765:	or     edi,0x10000
  40276b:	jmp    402779 <.text+0x4b9>
  40276d:	lea    esi,[esi+0x0]
  402770:	add    esi,0x1
  402773:	cmp    BYTE PTR [esi-0x1],0x0
  402777:	je     402736 <.text+0x476>
  402779:	mov    ecx,edi
  40277b:	mov    edx,esi
  40277d:	mov    eax,ebx
  40277f:	call   402690 <.text+0x3d0>
  402784:	test   eax,eax
  402786:	jne    402770 <.text+0x4b0>
  402788:	add    esp,0x2c
  40278b:	pop    ebx
  40278c:	pop    esi
  40278d:	pop    edi
  40278e:	pop    ebp
  40278f:	ret
  402790:	movsx  edx,BYTE PTR [edi-0x1]
  402794:	test   edx,edx
  402796:	je     402897 <.text+0x5d7>
  40279c:	cmp    BYTE PTR [ebp+0x1],0x21
  4027a0:	je     402802 <.text+0x542>
  4027a2:	mov    ecx,DWORD PTR [esp+0x14]
  4027a6:	call   4023d0 <.text+0x110>
  4027ab:	mov    ebp,eax
  4027ad:	test   ebp,ebp
  4027af:	je     40287c <.text+0x5bc>
  4027b5:	movzx  ecx,BYTE PTR [ebp+0x0]
  4027b9:	add    edi,0x1
  4027bc:	jmp    4026ba <.text+0x3fa>
  4027c1:	cmp    BYTE PTR [edi-0x1],0x0
  4027c5:	je     40288d <.text+0x5cd>
  4027cb:	mov    ebp,eax
  4027cd:	jmp    4027b5 <.text+0x4f5>
  4027cf:	nop
  4027d0:	mov    esi,edx
  4027d2:	sub    esi,ebx
  4027d4:	jmp    40272a <.text+0x46a>
  4027d9:	lea    esi,[esi+eiz*1+0x0]
  4027e0:	cmp    cl,0x2e
  4027e3:	je     4026a9 <.text+0x3e9>
  4027e9:	movsx  eax,cl
  4027ec:	sub    eax,0x2e
  4027ef:	test   DWORD PTR [esp+0x14],0x10000
  4027f7:	jne    4026a9 <.text+0x3e9>
  4027fd:	jmp    402736 <.text+0x476>
  402802:	lea    ebx,[ebp+0x2]
  402805:	mov    ecx,DWORD PTR [esp+0x14]
  402809:	mov    eax,ebx
  40280b:	call   4023d0 <.text+0x110>
  402810:	test   eax,eax
  402812:	je     40283e <.text+0x57e>
  402814:	mov    ebp,ebx
  402816:	jmp    4027ad <.text+0x4ed>
  402818:	nop
  402819:	lea    esi,[esi+eiz*1+0x0]
  402820:	movsx  edx,BYTE PTR [ebp+0x1]
  402824:	add    ebp,0x2
  402827:	test   edx,edx
  402829:	jne    4026f4 <.text+0x434>
  40282f:	jmp    4026f2 <.text+0x432>
  402834:	movsx  eax,BYTE PTR [esi]
  402837:	neg    eax
  402839:	jmp    402736 <.text+0x476>
  40283e:	movzx  eax,BYTE PTR [ebp+0x2]
  402842:	cmp    al,0x5d
  402844:	je     4028a1 <.text+0x5e1>
  402846:	mov    edx,DWORD PTR [esp+0x14]
  40284a:	and    edx,0x20
  40284d:	jmp    40285a <.text+0x59a>
  40284f:	nop
  402850:	add    ebx,0x1
  402853:	test   al,al
  402855:	je     40287c <.text+0x5bc>
  402857:	movzx  eax,BYTE PTR [ebx]
  40285a:	cmp    al,0x5d
  40285c:	je     402874 <.text+0x5b4>
  40285e:	cmp    al,0x7f
  402860:	jne    402850 <.text+0x590>
  402862:	test   edx,edx
  402864:	jne    40286f <.text+0x5af>
  402866:	movzx  eax,BYTE PTR [ebx+0x1]
  40286a:	add    ebx,0x1
  40286d:	jmp    402850 <.text+0x590>
  40286f:	add    ebx,0x1
  402872:	jmp    402857 <.text+0x597>
  402874:	lea    ebp,[ebx+0x1]
  402877:	jmp    4027ad <.text+0x4ed>
  40287c:	mov    eax,0x5d
  402881:	jmp    402736 <.text+0x476>
  402886:	xor    ebx,ebx
  402888:	jmp    402732 <.text+0x472>
  40288d:	mov    eax,0x3f
  402892:	jmp    402736 <.text+0x476>
  402897:	mov    eax,0x5b
  40289c:	jmp    402736 <.text+0x476>
  4028a1:	lea    ebx,[ebp+0x3]
  4028a4:	movzx  eax,BYTE PTR [ebp+0x3]
  4028a8:	jmp    402846 <.text+0x586>
  4028aa:	lea    esi,[esi+0x0]
  4028b0:	push   edi
  4028b1:	push   esi
  4028b2:	mov    esi,eax
  4028b4:	push   ebx
  4028b5:	mov    ebx,edx
  4028b7:	sub    esp,0x10
  4028ba:	mov    eax,DWORD PTR [edx+0xc]
  4028bd:	add    eax,DWORD PTR [edx+0x4]
  4028c0:	lea    eax,[eax*4+0x8]
  4028c7:	mov    DWORD PTR [esp+0x4],eax
  4028cb:	mov    eax,DWORD PTR [edx+0x8]
  4028ce:	mov    DWORD PTR [esp],eax
  4028d1:	call   403c78 <_realloc>
  4028d6:	test   eax,eax
  4028d8:	je     402900 <.text+0x640>
  4028da:	mov    ecx,DWORD PTR [ebx+0x4]
  4028dd:	mov    edx,DWORD PTR [ebx+0xc]
  4028e0:	mov    DWORD PTR [ebx+0x8],eax
  4028e3:	lea    edi,[ecx+0x1]
  4028e6:	add    ecx,edx
  4028e8:	add    edx,edi
  4028ea:	mov    DWORD PTR [ebx+0x4],edi
  4028ed:	mov    DWORD PTR [eax+ecx*4],esi
  4028f0:	mov    DWORD PTR [eax+edx*4],0x0
  4028f7:	add    esp,0x10
  4028fa:	xor    eax,eax
  4028fc:	pop    ebx
  4028fd:	pop    esi
  4028fe:	pop    edi
  4028ff:	ret
  402900:	add    esp,0x10
  402903:	mov    eax,0x1
  402908:	pop    ebx
  402909:	pop    esi
  40290a:	pop    edi
  40290b:	ret
  40290c:	lea    esi,[esi+eiz*1+0x0]
  402910:	push   esi
  402911:	push   ebx
  402912:	mov    ebx,eax
  402914:	mov    esi,edx
  402916:	sub    esp,0x14
  402919:	mov    eax,DWORD PTR [eax]
  40291b:	test   eax,eax
  40291d:	je     402924 <.text+0x664>
  40291f:	call   402910 <.text+0x650>
  402924:	mov    eax,DWORD PTR [ebx+0x8]
  402927:	test   eax,eax
  402929:	je     40292f <.text+0x66f>
  40292b:	test   esi,esi
  40292d:	jne    402950 <.text+0x690>
  40292f:	mov    eax,DWORD PTR [ebx+0x4]
  402932:	test   eax,eax
  402934:	je     40293d <.text+0x67d>
  402936:	mov    edx,esi
  402938:	call   402910 <.text+0x650>
  40293d:	mov    DWORD PTR [esp],ebx
  402940:	call   403cb0 <_free>
  402945:	add    esp,0x14
  402948:	pop    ebx
  402949:	pop    esi
  40294a:	ret
  40294b:	nop
  40294c:	lea    esi,[esi+eiz*1+0x0]
  402950:	mov    edx,esi
  402952:	call   4028b0 <.text+0x5f0>
  402957:	jmp    40292f <.text+0x66f>
  402959:	lea    esi,[esi+eiz*1+0x0]
  402960:	push   ebp
  402961:	mov    ebp,esp
  402963:	push   edi
  402964:	push   esi
  402965:	push   ebx
  402966:	mov    ebx,eax
  402968:	sub    esp,0x6c
  40296b:	mov    DWORD PTR [ebp-0x30],edx
  40296e:	and    dh,0x4
  402971:	mov    DWORD PTR [ebp-0x3c],ecx
  402974:	jne    402cd0 <.text+0xa10>
  40297a:	mov    DWORD PTR [ebp-0x58],esp
  40297d:	mov    DWORD PTR [esp],ebx
  402980:	call   403c48 <_strlen>
  402985:	lea    edx,[eax+0x1]
  402988:	add    eax,0x10
  40298b:	shr    eax,0x4
  40298e:	shl    eax,0x4
  402991:	call   402220 <___chkstk_ms>
  402996:	sub    esp,eax
  402998:	lea    eax,[esp+0xc]
  40299c:	mov    DWORD PTR [esp+0x8],edx
  4029a0:	mov    DWORD PTR [esp+0x4],ebx
  4029a4:	mov    DWORD PTR [esp],eax
  4029a7:	call   403c90 <_memcpy>
  4029ac:	mov    DWORD PTR [esp],eax
  4029af:	call   403340 <___mingw_dirname>
  4029b4:	mov    DWORD PTR [ebp-0x2c],eax
  4029b7:	mov    esi,eax
  4029b9:	lea    eax,[ebp-0x28]
  4029bc:	mov    DWORD PTR [ebp-0x1c],0x0
  4029c3:	call   402360 <.text+0xa0>
  4029c8:	test   eax,eax
  4029ca:	mov    DWORD PTR [ebp-0x34],eax
  4029cd:	jne    402cc0 <.text+0xa00>
  4029d3:	mov    edi,DWORD PTR [ebp-0x30]
  4029d6:	mov    eax,esi
  4029d8:	mov    edx,edi
  4029da:	call   4022c0 <.text>
  4029df:	test   eax,eax
  4029e1:	je     402ebe <.text+0xbfe>
  4029e7:	lea    eax,[ebp-0x28]
  4029ea:	mov    edx,edi
  4029ec:	or     dh,0x80
  4029ef:	mov    DWORD PTR [esp],eax
  4029f2:	mov    ecx,DWORD PTR [ebp-0x3c]
  4029f5:	mov    eax,esi
  4029f7:	call   402960 <.text+0x6a0>
  4029fc:	mov    DWORD PTR [ebp-0x34],eax
  4029ff:	mov    ecx,DWORD PTR [ebp-0x34]
  402a02:	test   ecx,ecx
  402a04:	jne    402cc0 <.text+0xa00>
  402a0a:	movzx  eax,BYTE PTR [ebx+0x1]
  402a0e:	cmp    al,0x2f
  402a10:	je     402a2b <.text+0x76b>
  402a12:	cmp    al,0x5c
  402a14:	je     402a2b <.text+0x76b>
  402a16:	mov    esi,DWORD PTR [ebp-0x2c]
  402a19:	mov    edi,0x40521c
  402a1e:	mov    ecx,0x2
  402a23:	repz cmps BYTE PTR ds:[esi],BYTE PTR es:[edi]
  402a25:	je     402f36 <.text+0xc76>
  402a2b:	mov    eax,DWORD PTR [ebp-0x2c]
  402a2e:	mov    DWORD PTR [esp],eax
  402a31:	call   403c48 <_strlen>
  402a36:	add    eax,ebx
  402a38:	cmp    ebx,eax
  402a3a:	jae    4031a6 <.text+0xee6>
  402a40:	movzx  ecx,BYTE PTR [eax]
  402a43:	cmp    cl,0x2f
  402a46:	mov    BYTE PTR [ebp-0x5d],cl
  402a49:	je     40319e <.text+0xede>
  402a4f:	cmp    cl,0x5c
  402a52:	jne    402a78 <.text+0x7b8>
  402a54:	jmp    40319e <.text+0xede>
  402a59:	lea    esi,[esi+eiz*1+0x0]
  402a60:	movzx  ecx,BYTE PTR [eax-0x1]
  402a64:	mov    eax,edx
  402a66:	cmp    cl,0x2f
  402a69:	je     4030da <.text+0xe1a>
  402a6f:	cmp    cl,0x5c
  402a72:	je     4030da <.text+0xe1a>
  402a78:	lea    edx,[eax-0x1]
  402a7b:	cmp    ebx,edx
  402a7d:	jne    402a60 <.text+0x7a0>
  402a7f:	movzx  eax,BYTE PTR [eax-0x1]
  402a83:	mov    DWORD PTR [ebp-0x38],edx
  402a86:	mov    BYTE PTR [ebp-0x5d],al
  402a89:	movzx  eax,BYTE PTR [ebp-0x5d]
  402a8d:	cmp    al,0x2f
  402a8f:	je     402a99 <.text+0x7d9>
  402a91:	cmp    al,0x5c
  402a93:	jne    40310b <.text+0xe4b>
  402a99:	mov    edx,DWORD PTR [ebp-0x38]
  402a9c:	movzx  esi,BYTE PTR [ebp-0x5d]
  402aa0:	jmp    402aa4 <.text+0x7e4>
  402aa2:	mov    esi,eax
  402aa4:	add    edx,0x1
  402aa7:	movzx  eax,BYTE PTR [edx]
  402aaa:	cmp    al,0x2f
  402aac:	sete   bl
  402aaf:	cmp    al,0x5c
  402ab1:	sete   cl
  402ab4:	or     bl,cl
  402ab6:	jne    402aa2 <.text+0x7e2>
  402ab8:	mov    eax,esi
  402aba:	mov    DWORD PTR [ebp-0x38],edx
  402abd:	mov    BYTE PTR [ebp-0x5d],al
  402ac0:	mov    eax,DWORD PTR [ebp-0x2c]
  402ac3:	mov    DWORD PTR [ebp-0x5c],eax
  402ac6:	mov    eax,DWORD PTR [ebp-0x20]
  402ac9:	mov    edi,DWORD PTR [ebp-0x30]
  402acc:	mov    DWORD PTR [ebp-0x34],0x2
  402ad3:	mov    DWORD PTR [ebp-0x44],eax
  402ad6:	mov    eax,DWORD PTR [eax]
  402ad8:	and    edi,0x8000
  402ade:	mov    DWORD PTR [ebp-0x2c],edi
  402ae1:	test   eax,eax
  402ae3:	je     402ffa <.text+0xd3a>
  402ae9:	mov    DWORD PTR [esp],eax
  402aec:	call   4038c0 <___mingw_opendir>
  402af1:	test   eax,eax
  402af3:	mov    edi,eax
  402af5:	je     402fb3 <.text+0xcf3>
  402afb:	mov    eax,DWORD PTR [ebp-0x5c]
  402afe:	test   eax,eax
  402b00:	je     40307a <.text+0xdba>
  402b06:	mov    eax,DWORD PTR [ebp-0x44]
  402b09:	mov    eax,DWORD PTR [eax]
  402b0b:	mov    DWORD PTR [esp],eax
  402b0e:	call   403c48 <_strlen>
  402b13:	mov    DWORD PTR [ebp-0x40],eax
  402b16:	mov    eax,DWORD PTR [ebp-0x40]
  402b19:	mov    DWORD PTR [ebp-0x48],0x0
  402b20:	add    eax,0x2
  402b23:	mov    DWORD PTR [ebp-0x54],eax
  402b26:	lea    esi,[esi+0x0]
  402b29:	lea    edi,[edi+eiz*1+0x0]
  402b30:	mov    DWORD PTR [esp],edi
  402b33:	call   403a80 <___mingw_readdir>
  402b38:	test   eax,eax
  402b3a:	mov    esi,eax
  402b3c:	je     402f53 <.text+0xc93>
  402b42:	mov    eax,DWORD PTR [ebp-0x2c]
  402b45:	test   eax,eax
  402b47:	je     402b4f <.text+0x88f>
  402b49:	cmp    DWORD PTR [esi+0x8],0x10
  402b4d:	jne    402b30 <.text+0x870>
  402b4f:	lea    ebx,[esi+0xc]
  402b52:	mov    ecx,DWORD PTR [ebp-0x30]
  402b55:	mov    eax,DWORD PTR [ebp-0x38]
  402b58:	mov    edx,ebx
  402b5a:	call   402690 <.text+0x3d0>
  402b5f:	test   eax,eax
  402b61:	jne    402b30 <.text+0x870>
  402b63:	movzx  edx,WORD PTR [esi+0x6]
  402b67:	mov    eax,DWORD PTR [ebp-0x54]
  402b6a:	mov    DWORD PTR [ebp-0x50],esp
  402b6d:	lea    eax,[edx+eax*1+0xf]
  402b71:	shr    eax,0x4
  402b74:	shl    eax,0x4
  402b77:	call   402220 <___chkstk_ms>
  402b7c:	sub    esp,eax
  402b7e:	mov    eax,DWORD PTR [ebp-0x40]
  402b81:	mov    DWORD PTR [ebp-0x4c],0x0
  402b88:	lea    esi,[esp+0xc]
  402b8c:	test   eax,eax
  402b8e:	jne    403010 <.text+0xd50>
  402b94:	mov    eax,DWORD PTR [ebp-0x4c]
  402b97:	add    edx,0x1
  402b9a:	mov    DWORD PTR [esp+0x4],ebx
  402b9e:	mov    DWORD PTR [esp+0x8],edx
  402ba2:	mov    ebx,esp
  402ba4:	add    eax,esi
  402ba6:	mov    DWORD PTR [esp],eax
  402ba9:	call   403c90 <_memcpy>
  402bae:	mov    DWORD PTR [esp],esi
  402bb1:	call   403c48 <_strlen>
  402bb6:	add    eax,0x10
  402bb9:	shr    eax,0x4
  402bbc:	shl    eax,0x4
  402bbf:	call   402220 <___chkstk_ms>
  402bc4:	sub    esp,eax
  402bc6:	mov    eax,esi
  402bc8:	lea    ecx,[esp+0xc]
  402bcc:	mov    esi,ecx
  402bce:	jmp    402bdd <.text+0x91d>
  402bd0:	add    esi,0x1
  402bd3:	add    eax,0x1
  402bd6:	test   dl,dl
  402bd8:	mov    BYTE PTR [esi-0x1],dl
  402bdb:	je     402bf9 <.text+0x939>
  402bdd:	movzx  edx,BYTE PTR [eax]
  402be0:	cmp    dl,0x7f
  402be3:	jne    402bd0 <.text+0x910>
  402be5:	movzx  edx,BYTE PTR [eax+0x1]
  402be9:	add    eax,0x1
  402bec:	add    esi,0x1
  402bef:	add    eax,0x1
  402bf2:	test   dl,dl
  402bf4:	mov    BYTE PTR [esi-0x1],dl
  402bf7:	jne    402bdd <.text+0x91d>
  402bf9:	mov    DWORD PTR [esp],ecx
  402bfc:	call   403db8 <_strdup>
  402c01:	test   eax,eax
  402c03:	mov    esi,eax
  402c05:	mov    esp,ebx
  402c07:	je     403054 <.text+0xd94>
  402c0d:	mov    ebx,DWORD PTR [ebp-0x34]
  402c10:	cmp    ebx,0x2
  402c13:	sete   al
  402c16:	movzx  eax,al
  402c19:	sub    eax,0x1
  402c1c:	and    ebx,eax
  402c1e:	mov    eax,DWORD PTR [ebp-0x30]
  402c21:	mov    DWORD PTR [ebp-0x34],ebx
  402c24:	test   al,0x40
  402c26:	jne    402fa0 <.text+0xce0>
  402c2c:	mov    ebx,DWORD PTR [ebp-0x48]
  402c2f:	test   ebx,ebx
  402c31:	je     4030e5 <.text+0xe25>
  402c37:	and    eax,0x4000
  402c3c:	mov    DWORD PTR [ebp-0x4c],edi
  402c3f:	mov    edi,eax
  402c41:	jmp    402c57 <.text+0x997>
  402c43:	call   403c50 <_strcoll>
  402c48:	test   eax,eax
  402c4a:	mov    edx,DWORD PTR [ebx]
  402c4c:	mov    ecx,DWORD PTR [ebx+0x4]
  402c4f:	jle    402c73 <.text+0x9b3>
  402c51:	test   ecx,ecx
  402c53:	je     402c79 <.text+0x9b9>
  402c55:	mov    ebx,ecx
  402c57:	mov    eax,DWORD PTR [ebx+0x8]
  402c5a:	test   edi,edi
  402c5c:	mov    DWORD PTR [esp],esi
  402c5f:	mov    DWORD PTR [esp+0x4],eax
  402c63:	jne    402c43 <.text+0x983>
  402c65:	call   403db0 <_stricoll>
  402c6a:	test   eax,eax
  402c6c:	mov    edx,DWORD PTR [ebx]
  402c6e:	mov    ecx,DWORD PTR [ebx+0x4]
  402c71:	jg     402c51 <.text+0x991>
  402c73:	mov    ecx,edx
  402c75:	test   ecx,ecx
  402c77:	jne    402c55 <.text+0x995>
  402c79:	mov    edi,DWORD PTR [ebp-0x4c]
  402c7c:	mov    DWORD PTR [ebp-0x4c],eax
  402c7f:	mov    DWORD PTR [esp],0xc
  402c86:	call   403ca0 <_malloc>
  402c8b:	test   eax,eax
  402c8d:	je     402fab <.text+0xceb>
  402c93:	mov    edx,DWORD PTR [ebp-0x4c]
  402c96:	mov    DWORD PTR [eax+0x8],esi
  402c99:	mov    DWORD PTR [eax+0x4],0x0
  402ca0:	mov    DWORD PTR [eax],0x0
  402ca6:	test   edx,edx
  402ca8:	jle    403086 <.text+0xdc6>
  402cae:	mov    DWORD PTR [ebx+0x4],eax
  402cb1:	jmp    402fab <.text+0xceb>
  402cb6:	mov    DWORD PTR [ebp-0x34],0x1
  402cbd:	lea    esi,[esi+0x0]
  402cc0:	mov    esp,DWORD PTR [ebp-0x58]
  402cc3:	mov    eax,DWORD PTR [ebp-0x34]
  402cc6:	lea    esp,[ebp-0xc]
  402cc9:	pop    ebx
  402cca:	pop    esi
  402ccb:	pop    edi
  402ccc:	pop    ebp
  402ccd:	ret
  402cce:	xchg   ax,ax
  402cd0:	mov    DWORD PTR [ebp-0x40],esp
  402cd3:	mov    DWORD PTR [esp],eax
  402cd6:	call   403c48 <_strlen>
  402cdb:	add    eax,0x10
  402cde:	shr    eax,0x4
  402ce1:	shl    eax,0x4
  402ce4:	call   402220 <___chkstk_ms>
  402ce9:	sub    esp,eax
  402ceb:	mov    esi,ebx
  402ced:	lea    eax,[esp+0xc]
  402cf1:	mov    edi,eax
  402cf3:	mov    DWORD PTR [ebp-0x38],eax
  402cf6:	movzx  eax,BYTE PTR [ebx]
  402cf9:	cmp    al,0x7f
  402cfb:	je     402d25 <.text+0xa65>
  402cfd:	cmp    al,0x7b
  402cff:	je     402d40 <.text+0xa80>
  402d01:	test   al,al
  402d03:	lea    edx,[edi+0x1]
  402d06:	lea    ecx,[esi+0x1]
  402d09:	mov    BYTE PTR [edi],al
  402d0b:	je     4031cd <.text+0xf0d>
  402d11:	cmp    al,0x7b
  402d13:	je     4031cd <.text+0xf0d>
  402d19:	movzx  eax,BYTE PTR [esi+0x1]
  402d1d:	mov    edi,edx
  402d1f:	mov    esi,ecx
  402d21:	cmp    al,0x7f
  402d23:	jne    402cfd <.text+0xa3d>
  402d25:	movzx  eax,BYTE PTR [esi+0x1]
  402d29:	mov    BYTE PTR [edi],0x7f
  402d2c:	test   al,al
  402d2e:	jne    402de0 <.text+0xb20>
  402d34:	add    edi,0x1
  402d37:	add    esi,0x1
  402d3a:	jmp    402d01 <.text+0xa41>
  402d3c:	lea    esi,[esi+eiz*1+0x0]
  402d40:	mov    DWORD PTR [ebp-0x34],edi
  402d43:	mov    edi,esi
  402d45:	mov    edx,DWORD PTR [ebp-0x34]
  402d48:	mov    ecx,0x1
  402d4d:	movzx  eax,BYTE PTR [edi+0x1]
  402d51:	cmp    al,0x7f
  402d53:	je     402d7b <.text+0xabb>
  402d55:	add    edi,0x1
  402d58:	cmp    al,0x7d
  402d5a:	je     402d65 <.text+0xaa5>
  402d5c:	cmp    al,0x2c
  402d5e:	jne    402da0 <.text+0xae0>
  402d60:	cmp    ecx,0x1
  402d63:	jne    402da0 <.text+0xae0>
  402d65:	sub    ecx,0x1
  402d68:	je     402df1 <.text+0xb31>
  402d6e:	mov    BYTE PTR [edx],al
  402d70:	movzx  eax,BYTE PTR [edi+0x1]
  402d74:	add    edx,0x1
  402d77:	cmp    al,0x7f
  402d79:	jne    402d55 <.text+0xa95>
  402d7b:	movzx  eax,BYTE PTR [edi+0x2]
  402d7f:	mov    BYTE PTR [edx],0x7f
  402d82:	lea    ebx,[edx+0x2]
  402d85:	test   al,al
  402d87:	mov    BYTE PTR [edx+0x1],al
  402d8a:	jne    402dc0 <.text+0xb00>
  402d8c:	mov    BYTE PTR [edx+0x2],0x0
  402d90:	mov    DWORD PTR [ebp-0x34],0x1
  402d97:	jmp    402eaa <.text+0xbea>
  402d9c:	lea    esi,[esi+eiz*1+0x0]
  402da0:	cmp    al,0x7b
  402da2:	je     402dd0 <.text+0xb10>
  402da4:	test   al,al
  402da6:	setne  BYTE PTR [ebp-0x2c]
  402daa:	movzx  ebx,BYTE PTR [ebp-0x2c]
  402dae:	test   bl,bl
  402db0:	lea    esi,[edx+0x1]
  402db3:	mov    BYTE PTR [edx],al
  402db5:	je     4031b4 <.text+0xef4>
  402dbb:	mov    edx,esi
  402dbd:	jmp    402d4d <.text+0xa8d>
  402dbf:	nop
  402dc0:	movzx  eax,BYTE PTR [edi+0x3]
  402dc4:	mov    edx,ebx
  402dc6:	add    edi,0x3
  402dc9:	jmp    402d58 <.text+0xa98>
  402dcb:	nop
  402dcc:	lea    esi,[esi+eiz*1+0x0]
  402dd0:	add    ecx,0x1
  402dd3:	mov    ebx,0x1
  402dd8:	mov    BYTE PTR [ebp-0x2c],0x1
  402ddc:	jmp    402dae <.text+0xaee>
  402dde:	xchg   ax,ax
  402de0:	mov    BYTE PTR [edi+0x1],al
  402de3:	add    esi,0x2
  402de6:	movzx  eax,BYTE PTR [esi]
  402de9:	add    edi,0x2
  402dec:	jmp    402cf9 <.text+0xa39>
  402df1:	cmp    al,0x2c
  402df3:	jne    402eba <.text+0xbfa>
  402df9:	mov    eax,edi
  402dfb:	mov    esi,0x1
  402e00:	movzx  ebx,BYTE PTR [eax+0x1]
  402e04:	lea    ecx,[eax+0x1]
  402e07:	cmp    bl,0x7f
  402e0a:	jne    402f2f <.text+0xc6f>
  402e10:	cmp    BYTE PTR [eax+0x2],0x0
  402e14:	jne    402e28 <.text+0xb68>
  402e16:	jmp    402ea0 <.text+0xbe0>
  402e1b:	nop
  402e1c:	lea    esi,[esi+eiz*1+0x0]
  402e20:	cmp    BYTE PTR [eax+0x1],0x0
  402e24:	je     402ea0 <.text+0xbe0>
  402e26:	mov    ecx,eax
  402e28:	movzx  ebx,BYTE PTR [ecx+0x2]
  402e2c:	lea    eax,[ecx+0x2]
  402e2f:	cmp    bl,0x7f
  402e32:	je     402e20 <.text+0xb60>
  402e34:	cmp    bl,0x7b
  402e37:	je     402eb2 <.text+0xbf2>
  402e39:	cmp    bl,0x7d
  402e3c:	jne    402e93 <.text+0xbd3>
  402e3e:	sub    esi,0x1
  402e41:	jne    402e00 <.text+0xb40>
  402e43:	lea    ecx,[eax+0x1]
  402e46:	movzx  eax,BYTE PTR [eax+0x1]
  402e4a:	jmp    402e53 <.text+0xb93>
  402e4c:	lea    esi,[esi+eiz*1+0x0]
  402e50:	movzx  eax,BYTE PTR [ecx]
  402e53:	add    edx,0x1
  402e56:	add    ecx,0x1
  402e59:	test   al,al
  402e5b:	mov    BYTE PTR [edx-0x1],al
  402e5e:	jne    402e50 <.text+0xb90>
  402e60:	mov    eax,DWORD PTR [ebp+0x8]
  402e63:	mov    DWORD PTR [esp],eax
  402e66:	mov    esi,DWORD PTR [ebp-0x30]
  402e69:	mov    ecx,DWORD PTR [ebp-0x3c]
  402e6c:	mov    eax,DWORD PTR [ebp-0x38]
  402e6f:	mov    edx,esi
  402e71:	or     esi,0x1
  402e74:	call   402960 <.text+0x6a0>
  402e79:	cmp    eax,0x1
  402e7c:	mov    DWORD PTR [ebp-0x30],esi
  402e7f:	je     402d90 <.text+0xad0>
  402e85:	cmp    BYTE PTR [edi],0x2c
  402e88:	je     402d45 <.text+0xa85>
  402e8e:	mov    DWORD PTR [ebp-0x34],eax
  402e91:	jmp    402eaa <.text+0xbea>
  402e93:	test   bl,bl
  402e95:	jne    402e00 <.text+0xb40>
  402e9b:	nop
  402e9c:	lea    esi,[esi+eiz*1+0x0]
  402ea0:	mov    BYTE PTR [edx],0x0
  402ea3:	mov    DWORD PTR [ebp-0x34],0x1
  402eaa:	mov    esp,DWORD PTR [ebp-0x40]
  402ead:	jmp    402cc3 <.text+0xa03>
  402eb2:	add    esi,0x1
  402eb5:	jmp    402e00 <.text+0xb40>
  402eba:	mov    eax,edi
  402ebc:	jmp    402e43 <.text+0xb83>
  402ebe:	mov    eax,DWORD PTR [ebp-0x2c]
  402ec1:	mov    esi,esp
  402ec3:	mov    DWORD PTR [esp],eax
  402ec6:	call   403c48 <_strlen>
  402ecb:	add    eax,0x10
  402ece:	shr    eax,0x4
  402ed1:	shl    eax,0x4
  402ed4:	call   402220 <___chkstk_ms>
  402ed9:	mov    edx,DWORD PTR [ebp-0x2c]
  402edc:	sub    esp,eax
  402ede:	lea    edi,[esp+0xc]
  402ee2:	mov    ecx,edi
  402ee4:	jmp    402efd <.text+0xc3d>
  402ee6:	lea    esi,[esi+0x0]
  402ee9:	lea    edi,[edi+eiz*1+0x0]
  402ef0:	add    ecx,0x1
  402ef3:	add    edx,0x1
  402ef6:	test   al,al
  402ef8:	mov    BYTE PTR [ecx-0x1],al
  402efb:	je     402f0d <.text+0xc4d>
  402efd:	movzx  eax,BYTE PTR [edx]
  402f00:	cmp    al,0x7f
  402f02:	jne    402ef0 <.text+0xc30>
  402f04:	movzx  eax,BYTE PTR [edx+0x1]
  402f08:	add    edx,0x1
  402f0b:	jmp    402ef0 <.text+0xc30>
  402f0d:	mov    DWORD PTR [esp],edi
  402f10:	call   403db8 <_strdup>
  402f15:	test   eax,eax
  402f17:	mov    esp,esi
  402f19:	je     402cb6 <.text+0x9f6>
  402f1f:	lea    edx,[ebp-0x28]
  402f22:	call   4028b0 <.text+0x5f0>
  402f27:	mov    DWORD PTR [ebp-0x34],eax
  402f2a:	jmp    4029ff <.text+0x73f>
  402f2f:	mov    eax,ecx
  402f31:	jmp    402e34 <.text+0xb74>
  402f36:	test   BYTE PTR [ebp-0x30],0x10
  402f3a:	jne    40311a <.text+0xe5a>
  402f40:	mov    DWORD PTR [ebp-0x38],ebx
  402f43:	mov    BYTE PTR [ebp-0x5d],0x5c
  402f47:	mov    DWORD PTR [ebp-0x5c],0x0
  402f4e:	jmp    402ac6 <.text+0x806>
  402f53:	mov    DWORD PTR [esp],edi
  402f56:	call   403ad0 <___mingw_closedir>
  402f5b:	mov    edx,DWORD PTR [ebp-0x48]
  402f5e:	test   edx,edx
  402f60:	je     402f6d <.text+0xcad>
  402f62:	mov    edx,DWORD PTR [ebp+0x8]
  402f65:	mov    eax,DWORD PTR [ebp-0x48]
  402f68:	call   402910 <.text+0x650>
  402f6d:	mov    edi,DWORD PTR [ebp-0x44]
  402f70:	lea    ebx,[edi+0x4]
  402f73:	mov    eax,DWORD PTR [ebx-0x4]
  402f76:	mov    DWORD PTR [esp],eax
  402f79:	call   403cb0 <_free>
  402f7e:	mov    eax,DWORD PTR [edi+0x4]
  402f81:	test   eax,eax
  402f83:	je     40309b <.text+0xddb>
  402f89:	cmp    DWORD PTR [ebp-0x34],0x1
  402f8d:	je     402fd6 <.text+0xd16>
  402f8f:	mov    DWORD PTR [ebp-0x44],ebx
  402f92:	jmp    402ae9 <.text+0x829>
  402f97:	mov    esi,esi
  402f99:	lea    edi,[edi+eiz*1+0x0]
  402fa0:	mov    ecx,DWORD PTR [ebp+0x8]
  402fa3:	test   ecx,ecx
  402fa5:	jne    40306b <.text+0xdab>
  402fab:	mov    esp,DWORD PTR [ebp-0x50]
  402fae:	jmp    402b30 <.text+0x870>
  402fb3:	test   BYTE PTR [ebp-0x30],0x4
  402fb7:	je     4030a6 <.text+0xde6>
  402fbd:	mov    edi,DWORD PTR [ebp-0x44]
  402fc0:	lea    ebx,[edi+0x4]
  402fc3:	mov    eax,edi
  402fc5:	mov    eax,DWORD PTR [eax]
  402fc7:	mov    DWORD PTR [esp],eax
  402fca:	call   403cb0 <_free>
  402fcf:	mov    eax,DWORD PTR [edi+0x4]
  402fd2:	test   eax,eax
  402fd4:	je     402fed <.text+0xd2d>
  402fd6:	mov    eax,DWORD PTR [ebp-0x44]
  402fd9:	mov    eax,DWORD PTR [eax+0x4]
  402fdc:	add    ebx,0x4
  402fdf:	mov    DWORD PTR [esp],eax
  402fe2:	call   403cb0 <_free>
  402fe7:	mov    eax,DWORD PTR [ebx]
  402fe9:	test   eax,eax
  402feb:	jne    402fdc <.text+0xd1c>
  402fed:	mov    eax,DWORD PTR [ebp-0x20]
  402ff0:	mov    DWORD PTR [ebp-0x34],0x1
  402ff7:	mov    DWORD PTR [ebp-0x44],eax
  402ffa:	mov    eax,DWORD PTR [ebp-0x44]
  402ffd:	mov    DWORD PTR [esp],eax
  403000:	call   403cb0 <_free>
  403005:	mov    esp,DWORD PTR [ebp-0x58]
  403008:	jmp    402cc3 <.text+0xa03>
  40300d:	lea    esi,[esi+0x0]
  403010:	mov    eax,DWORD PTR [ebp-0x44]
  403013:	mov    DWORD PTR [ebp-0x4c],edx
  403016:	mov    edx,DWORD PTR [ebp-0x40]
  403019:	mov    eax,DWORD PTR [eax]
  40301b:	mov    DWORD PTR [esp],esi
  40301e:	mov    DWORD PTR [esp+0x8],edx
  403022:	mov    DWORD PTR [esp+0x4],eax
  403026:	call   403c90 <_memcpy>
  40302b:	mov    ecx,DWORD PTR [ebp-0x40]
  40302e:	mov    edx,DWORD PTR [ebp-0x4c]
  403031:	movzx  eax,BYTE PTR [esp+ecx*1+0xb]
  403036:	cmp    al,0x2f
  403038:	je     403060 <.text+0xda0>
  40303a:	cmp    al,0x5c
  40303c:	je     403060 <.text+0xda0>
  40303e:	mov    eax,ecx
  403040:	add    eax,0x1
  403043:	mov    DWORD PTR [ebp-0x4c],eax
  403046:	mov    eax,ecx
  403048:	movzx  ecx,BYTE PTR [ebp-0x5d]
  40304c:	mov    BYTE PTR [esi+eax*1],cl
  40304f:	jmp    402b94 <.text+0x8d4>
  403054:	mov    DWORD PTR [ebp-0x34],0x3
  40305b:	jmp    402fab <.text+0xceb>
  403060:	mov    eax,DWORD PTR [ebp-0x40]
  403063:	mov    DWORD PTR [ebp-0x4c],eax
  403066:	jmp    402b94 <.text+0x8d4>
  40306b:	mov    edx,DWORD PTR [ebp+0x8]
  40306e:	mov    eax,esi
  403070:	call   4028b0 <.text+0x5f0>
  403075:	jmp    402fab <.text+0xceb>
  40307a:	mov    DWORD PTR [ebp-0x40],0x0
  403081:	jmp    402b16 <.text+0x856>
  403086:	mov    DWORD PTR [ebx],eax
  403088:	mov    ebx,DWORD PTR [ebp-0x48]
  40308b:	test   ebx,ebx
  40308d:	jne    402fab <.text+0xceb>
  403093:	mov    DWORD PTR [ebp-0x48],eax
  403096:	jmp    402fab <.text+0xceb>
  40309b:	mov    eax,DWORD PTR [ebp-0x20]
  40309e:	mov    DWORD PTR [ebp-0x44],eax
  4030a1:	jmp    402ffa <.text+0xd3a>
  4030a6:	mov    edi,DWORD PTR [ebp-0x3c]
  4030a9:	test   edi,edi
  4030ab:	je     402f6d <.text+0xcad>
  4030b1:	call   403ce8 <__errno>
  4030b6:	mov    eax,DWORD PTR [eax]
  4030b8:	mov    DWORD PTR [esp+0x4],eax
  4030bc:	mov    esi,DWORD PTR [ebp-0x44]
  4030bf:	mov    eax,DWORD PTR [esi]
  4030c1:	mov    DWORD PTR [esp],eax
  4030c4:	call   edi
  4030c6:	test   eax,eax
  4030c8:	je     402f6d <.text+0xcad>
  4030ce:	mov    eax,esi
  4030d0:	lea    ebx,[esi+0x4]
  4030d3:	mov    edi,esi
  4030d5:	jmp    402fc5 <.text+0xd05>
  4030da:	mov    DWORD PTR [ebp-0x38],edx
  4030dd:	mov    BYTE PTR [ebp-0x5d],cl
  4030e0:	jmp    402a89 <.text+0x7c9>
  4030e5:	mov    DWORD PTR [esp],0xc
  4030ec:	call   403ca0 <_malloc>
  4030f1:	test   eax,eax
  4030f3:	je     402fab <.text+0xceb>
  4030f9:	mov    DWORD PTR [eax+0x8],esi
  4030fc:	mov    DWORD PTR [eax+0x4],0x0
  403103:	mov    DWORD PTR [eax],0x0
  403109:	jmp    403093 <.text+0xdd3>
  40310b:	mov    eax,DWORD PTR [ebp-0x2c]
  40310e:	mov    BYTE PTR [ebp-0x5d],0x5c
  403112:	mov    DWORD PTR [ebp-0x5c],eax
  403115:	jmp    402ac6 <.text+0x806>
  40311a:	mov    edx,DWORD PTR [ebp-0x30]
  40311d:	mov    eax,ebx
  40311f:	call   4022c0 <.text>
  403124:	test   eax,eax
  403126:	mov    DWORD PTR [ebp-0x34],eax
  403129:	jne    402f40 <.text+0xc80>
  40312f:	mov    DWORD PTR [esp],ebx
  403132:	mov    esi,esp
  403134:	call   403c48 <_strlen>
  403139:	add    eax,0x10
  40313c:	shr    eax,0x4
  40313f:	shl    eax,0x4
  403142:	call   402220 <___chkstk_ms>
  403147:	sub    esp,eax
  403149:	lea    ecx,[esp+0xc]
  40314d:	mov    edx,ecx
  40314f:	jmp    40315e <.text+0xe9e>
  403151:	add    edx,0x1
  403154:	add    ebx,0x1
  403157:	test   al,al
  403159:	mov    BYTE PTR [edx-0x1],al
  40315c:	je     40316e <.text+0xeae>
  40315e:	movzx  eax,BYTE PTR [ebx]
  403161:	cmp    al,0x7f
  403163:	jne    403151 <.text+0xe91>
  403165:	movzx  eax,BYTE PTR [ebx+0x1]
  403169:	add    ebx,0x1
  40316c:	jmp    403151 <.text+0xe91>
  40316e:	mov    DWORD PTR [esp],ecx
  403171:	call   403db8 <_strdup>
  403176:	test   eax,eax
  403178:	mov    esp,esi
  40317a:	je     40309b <.text+0xddb>
  403180:	mov    edx,DWORD PTR [ebp+0x8]
  403183:	test   edx,edx
  403185:	je     40309b <.text+0xddb>
  40318b:	mov    edx,DWORD PTR [ebp+0x8]
  40318e:	call   4028b0 <.text+0x5f0>
  403193:	mov    eax,DWORD PTR [ebp-0x20]
  403196:	mov    DWORD PTR [ebp-0x44],eax
  403199:	jmp    402ffa <.text+0xd3a>
  40319e:	mov    DWORD PTR [ebp-0x38],eax
  4031a1:	jmp    402a89 <.text+0x7c9>
  4031a6:	movzx  ebx,BYTE PTR [eax]
  4031a9:	mov    DWORD PTR [ebp-0x38],eax
  4031ac:	mov    BYTE PTR [ebp-0x5d],bl
  4031af:	jmp    402a89 <.text+0x7c9>
  4031b4:	cmp    BYTE PTR [ebp-0x2c],0x0
  4031b8:	je     402d90 <.text+0xad0>
  4031be:	cmp    al,0x2c
  4031c0:	mov    edx,esi
  4031c2:	jne    402ea0 <.text+0xbe0>
  4031c8:	jmp    402df9 <.text+0xb39>
  4031cd:	cmp    al,0x7b
  4031cf:	je     4031d9 <.text+0xf19>
  4031d1:	mov    esp,DWORD PTR [ebp-0x40]
  4031d4:	jmp    40297a <.text+0x6ba>
  4031d9:	mov    DWORD PTR [ebp-0x34],edx
  4031dc:	mov    edi,ecx
  4031de:	jmp    402d45 <.text+0xa85>
  4031e3:	lea    esi,[esi+0x0]
  4031e9:	lea    edi,[edi+eiz*1+0x0]

004031f0 <___mingw_glob>:
  4031f0:	push   ebp
  4031f1:	mov    ebp,esp
  4031f3:	push   edi
  4031f4:	push   esi
  4031f5:	push   ebx
  4031f6:	sub    esp,0x2c
  4031f9:	mov    esi,DWORD PTR [ebp+0x14]
  4031fc:	mov    ebx,DWORD PTR [ebp+0x8]
  4031ff:	mov    edi,DWORD PTR [ebp+0xc]
  403202:	test   esi,esi
  403204:	je     40320e <___mingw_glob+0x1e>
  403206:	test   edi,0x2
  40320c:	je     403243 <___mingw_glob+0x53>
  40320e:	cmp    DWORD PTR [esi],0x40521e
  403214:	je     403223 <___mingw_glob+0x33>
  403216:	mov    eax,esi
  403218:	call   402360 <.text+0xa0>
  40321d:	mov    DWORD PTR [esi],0x40521e
  403223:	mov    DWORD PTR [esp],esi
  403226:	mov    ecx,DWORD PTR [ebp+0x10]
  403229:	mov    edx,edi
  40322b:	mov    eax,ebx
  40322d:	call   402960 <.text+0x6a0>
  403232:	cmp    eax,0x2
  403235:	mov    ecx,eax
  403237:	je     403250 <___mingw_glob+0x60>
  403239:	lea    esp,[ebp-0xc]
  40323c:	mov    eax,ecx
  40323e:	pop    ebx
  40323f:	pop    esi
  403240:	pop    edi
  403241:	pop    ebp
  403242:	ret
  403243:	mov    DWORD PTR [esi+0xc],0x0
  40324a:	jmp    40320e <___mingw_glob+0x1e>
  40324c:	lea    esi,[esi+eiz*1+0x0]
  403250:	and    edi,0x10
  403253:	je     403239 <___mingw_glob+0x49>
  403255:	mov    DWORD PTR [ebp-0x20],eax
  403258:	mov    DWORD PTR [ebp-0x1c],esp
  40325b:	mov    DWORD PTR [esp],ebx
  40325e:	call   403c48 <_strlen>
  403263:	add    eax,0x10
  403266:	shr    eax,0x4
  403269:	shl    eax,0x4
  40326c:	call   402220 <___chkstk_ms>
  403271:	mov    ecx,DWORD PTR [ebp-0x20]
  403274:	sub    esp,eax
  403276:	lea    edi,[esp+0x4]
  40327a:	mov    edx,edi
  40327c:	jmp    40328d <___mingw_glob+0x9d>
  40327e:	xchg   ax,ax
  403280:	add    edx,0x1
  403283:	add    ebx,0x1
  403286:	test   al,al
  403288:	mov    BYTE PTR [edx-0x1],al
  40328b:	je     4032a8 <___mingw_glob+0xb8>
  40328d:	movzx  eax,BYTE PTR [ebx]
  403290:	cmp    al,0x7f
  403292:	jne    403280 <___mingw_glob+0x90>
  403294:	movzx  eax,BYTE PTR [ebx+0x1]
  403298:	add    ebx,0x1
  40329b:	add    edx,0x1
  40329e:	add    ebx,0x1
  4032a1:	test   al,al
  4032a3:	mov    BYTE PTR [edx-0x1],al
  4032a6:	jne    40328d <___mingw_glob+0x9d>
  4032a8:	mov    DWORD PTR [ebp-0x20],ecx
  4032ab:	mov    DWORD PTR [esp],edi
  4032ae:	call   403db8 <_strdup>
  4032b3:	test   eax,eax
  4032b5:	mov    esp,DWORD PTR [ebp-0x1c]
  4032b8:	mov    ecx,DWORD PTR [ebp-0x20]
  4032bb:	je     403239 <___mingw_glob+0x49>
  4032c1:	mov    edx,esi
  4032c3:	mov    DWORD PTR [ebp-0x1c],ecx
  4032c6:	call   4028b0 <.text+0x5f0>
  4032cb:	mov    ecx,DWORD PTR [ebp-0x1c]
  4032ce:	jmp    403239 <___mingw_glob+0x49>
  4032d3:	lea    esi,[esi+0x0]
  4032d9:	lea    edi,[edi+eiz*1+0x0]

004032e0 <___mingw_globfree>:
  4032e0:	push   edi
  4032e1:	push   esi
  4032e2:	push   ebx
  4032e3:	sub    esp,0x10
  4032e6:	mov    esi,DWORD PTR [esp+0x20]
  4032ea:	cmp    DWORD PTR [esi],0x40521e
  4032f0:	je     403300 <___mingw_globfree+0x20>
  4032f2:	add    esp,0x10
  4032f5:	pop    ebx
  4032f6:	pop    esi
  4032f7:	pop    edi
  4032f8:	ret
  4032f9:	lea    esi,[esi+eiz*1+0x0]
  403300:	mov    eax,DWORD PTR [esi+0x4]
  403303:	mov    edx,DWORD PTR [esi+0xc]
  403306:	test   eax,eax
  403308:	lea    edi,[eax-0x1]
  40330b:	lea    ebx,[edx*4+0x0]
  403312:	jle    40332d <___mingw_globfree+0x4d>
  403314:	mov    eax,DWORD PTR [esi+0x8]
  403317:	sub    edi,0x1
  40331a:	mov    eax,DWORD PTR [eax+ebx*1]
  40331d:	add    ebx,0x4
  403320:	mov    DWORD PTR [esp],eax
  403323:	call   403cb0 <_free>
  403328:	cmp    edi,0xffffffff
  40332b:	jne    403314 <___mingw_globfree+0x34>
  40332d:	mov    eax,DWORD PTR [esi+0x8]
  403330:	mov    DWORD PTR [esp+0x20],eax
  403334:	add    esp,0x10
  403337:	pop    ebx
  403338:	pop    esi
  403339:	pop    edi
  40333a:	jmp    403cb0 <_free>
  40333f:	nop

00403340 <___mingw_dirname>:
  403340:	push   ebp
  403341:	mov    ebp,esp
  403343:	push   edi
  403344:	push   esi
  403345:	push   ebx
  403346:	sub    esp,0x2c
  403349:	mov    DWORD PTR [esp+0x4],0x0
  403351:	mov    DWORD PTR [esp],0x2
  403358:	call   403c68 <_setlocale>
  40335d:	test   eax,eax
  40335f:	mov    ebx,eax
  403361:	je     40336d <___mingw_dirname+0x2d>
  403363:	mov    DWORD PTR [esp],eax
  403366:	call   403db8 <_strdup>
  40336b:	mov    ebx,eax
  40336d:	mov    DWORD PTR [esp+0x4],0x405230
  403375:	mov    DWORD PTR [esp],0x2
  40337c:	call   403c68 <_setlocale>
  403381:	mov    esi,DWORD PTR [ebp+0x8]
  403384:	test   esi,esi
  403386:	je     403390 <___mingw_dirname+0x50>
  403388:	mov    eax,DWORD PTR [ebp+0x8]
  40338b:	cmp    BYTE PTR [eax],0x0
  40338e:	jne    403401 <___mingw_dirname+0xc1>
  403390:	mov    DWORD PTR [esp+0x8],0x0
  403398:	mov    DWORD PTR [esp+0x4],0x405232
  4033a0:	mov    DWORD PTR [esp],0x0
  4033a7:	call   403c30 <_wcstombs>
  4033ac:	lea    esi,[eax+0x1]
  4033af:	mov    DWORD PTR [esp+0x4],esi
  4033b3:	mov    eax,ds:0x407078
  4033b8:	mov    DWORD PTR [esp],eax
  4033bb:	call   403c78 <_realloc>
  4033c0:	mov    ds:0x407078,eax
  4033c5:	mov    DWORD PTR [esp+0x8],esi
  4033c9:	mov    DWORD PTR [esp+0x4],0x405232
  4033d1:	mov    DWORD PTR [esp],eax
  4033d4:	call   403c30 <_wcstombs>
  4033d9:	mov    DWORD PTR [esp+0x4],ebx
  4033dd:	mov    DWORD PTR [esp],0x2
  4033e4:	call   403c68 <_setlocale>
  4033e9:	mov    DWORD PTR [esp],ebx
  4033ec:	call   403cb0 <_free>
  4033f1:	mov    esi,DWORD PTR ds:0x407078
  4033f7:	lea    esp,[ebp-0xc]
  4033fa:	pop    ebx
  4033fb:	mov    eax,esi
  4033fd:	pop    esi
  4033fe:	pop    edi
  4033ff:	pop    ebp
  403400:	ret
  403401:	mov    DWORD PTR [ebp-0x24],esp
  403404:	mov    DWORD PTR [esp+0x8],0x0
  40340c:	mov    eax,DWORD PTR [ebp+0x8]
  40340f:	mov    DWORD PTR [esp],0x0
  403416:	mov    DWORD PTR [esp+0x4],eax
  40341a:	call   403c98 <_mbstowcs>
  40341f:	mov    edx,eax
  403421:	lea    eax,[eax+eax*1+0x12]
  403425:	shr    eax,0x4
  403428:	shl    eax,0x4
  40342b:	call   402220 <___chkstk_ms>
  403430:	sub    esp,eax
  403432:	mov    DWORD PTR [esp+0x8],edx
  403436:	mov    eax,DWORD PTR [ebp+0x8]
  403439:	lea    edi,[esp+0xc]
  40343d:	mov    DWORD PTR [esp],edi
  403440:	mov    DWORD PTR [esp+0x4],eax
  403444:	call   403c98 <_mbstowcs>
  403449:	xor    ecx,ecx
  40344b:	mov    DWORD PTR [ebp-0x28],eax
  40344e:	cmp    eax,0x1
  403451:	mov    WORD PTR [edi+eax*2],cx
  403455:	movzx  eax,WORD PTR [edi]
  403458:	mov    DWORD PTR [ebp-0x1c],edi
  40345b:	mov    WORD PTR [ebp-0x1e],ax
  40345f:	jbe    403480 <___mingw_dirname+0x140>
  403461:	cmp    ax,0x2f
  403465:	je     403687 <___mingw_dirname+0x347>
  40346b:	cmp    ax,0x5c
  40346f:	je     403687 <___mingw_dirname+0x347>
  403475:	cmp    WORD PTR [edi+0x2],0x3a
  40347a:	je     4036cf <___mingw_dirname+0x38f>
  403480:	movzx  eax,WORD PTR [ebp-0x1e]
  403484:	test   ax,ax
  403487:	je     40356e <___mingw_dirname+0x22e>
  40348d:	mov    ecx,DWORD PTR [ebp-0x1c]
  403490:	mov    edx,eax
  403492:	mov    esi,ecx
  403494:	jmp    4034b4 <___mingw_dirname+0x174>
  403496:	lea    esi,[esi+0x0]
  403499:	lea    edi,[edi+eiz*1+0x0]
  4034a0:	cmp    dx,0x5c
  4034a4:	mov    eax,ecx
  4034a6:	je     4034ba <___mingw_dirname+0x17a>
  4034a8:	movzx  edx,WORD PTR [eax+0x2]
  4034ac:	lea    ecx,[eax+0x2]
  4034af:	test   dx,dx
  4034b2:	je     4034ea <___mingw_dirname+0x1aa>
  4034b4:	cmp    dx,0x2f
  4034b8:	jne    4034a0 <___mingw_dirname+0x160>
  4034ba:	movzx  edx,WORD PTR [ecx]
  4034bd:	mov    eax,ecx
  4034bf:	cmp    dx,0x2f
  4034c3:	jne    4034d1 <___mingw_dirname+0x191>
  4034c5:	add    eax,0x2
  4034c8:	movzx  edx,WORD PTR [eax]
  4034cb:	cmp    dx,0x2f
  4034cf:	je     4034c5 <___mingw_dirname+0x185>
  4034d1:	cmp    dx,0x5c
  4034d5:	je     4034c5 <___mingw_dirname+0x185>
  4034d7:	test   dx,dx
  4034da:	je     4034ea <___mingw_dirname+0x1aa>
  4034dc:	movzx  edx,WORD PTR [eax+0x2]
  4034e0:	mov    esi,eax
  4034e2:	lea    ecx,[eax+0x2]
  4034e5:	test   dx,dx
  4034e8:	jne    4034b4 <___mingw_dirname+0x174>
  4034ea:	cmp    DWORD PTR [ebp-0x1c],esi
  4034ed:	jb     403580 <___mingw_dirname+0x240>
  4034f3:	movzx  eax,WORD PTR [ebp-0x1e]
  4034f7:	cmp    ax,0x2f
  4034fb:	je     4036e2 <___mingw_dirname+0x3a2>
  403501:	cmp    ax,0x5c
  403505:	je     4036e2 <___mingw_dirname+0x3a2>
  40350b:	mov    esi,DWORD PTR [ebp-0x1c]
  40350e:	mov    ecx,0x2e
  403513:	mov    eax,esi
  403515:	mov    WORD PTR [esi],cx
  403518:	add    eax,0x2
  40351b:	xor    edx,edx
  40351d:	mov    WORD PTR [eax],dx
  403520:	mov    DWORD PTR [esp+0x8],0x0
  403528:	mov    DWORD PTR [esp+0x4],edi
  40352c:	mov    DWORD PTR [esp],0x0
  403533:	call   403c30 <_wcstombs>
  403538:	lea    edx,[eax+0x1]
  40353b:	mov    DWORD PTR [esp+0x4],edx
  40353f:	mov    eax,ds:0x407078
  403544:	mov    DWORD PTR [ebp-0x1c],edx
  403547:	mov    DWORD PTR [esp],eax
  40354a:	call   403c78 <_realloc>
  40354f:	mov    edx,DWORD PTR [ebp-0x1c]
  403552:	mov    ds:0x407078,eax
  403557:	mov    esi,eax
  403559:	mov    DWORD PTR [esp+0x4],edi
  40355d:	mov    DWORD PTR [esp],eax
  403560:	mov    DWORD PTR [esp+0x8],edx
  403564:	call   403c30 <_wcstombs>
  403569:	jmp    403630 <___mingw_dirname+0x2f0>
  40356e:	mov    esp,DWORD PTR [ebp-0x24]
  403571:	jmp    403390 <___mingw_dirname+0x50>
  403576:	lea    esi,[esi+0x0]
  403579:	lea    edi,[edi+eiz*1+0x0]
  403580:	lea    eax,[esi-0x2]
  403583:	cmp    DWORD PTR [ebp-0x1c],eax
  403586:	jae    4036ed <___mingw_dirname+0x3ad>
  40358c:	movzx  edx,WORD PTR [esi-0x2]
  403590:	mov    esi,eax
  403592:	cmp    dx,0x2f
  403596:	je     403580 <___mingw_dirname+0x240>
  403598:	cmp    dx,0x5c
  40359c:	je     403580 <___mingw_dirname+0x240>
  40359e:	xor    edx,edx
  4035a0:	mov    ecx,edi
  4035a2:	mov    WORD PTR [eax+0x2],dx
  4035a6:	movzx  edx,WORD PTR [edi]
  4035a9:	cmp    dx,0x2f
  4035ad:	je     4035c0 <___mingw_dirname+0x280>
  4035af:	cmp    dx,0x5c
  4035b3:	jne    4036bd <___mingw_dirname+0x37d>
  4035b9:	lea    esi,[esi+eiz*1+0x0]
  4035c0:	add    ecx,0x2
  4035c3:	movzx  eax,WORD PTR [ecx]
  4035c6:	cmp    ax,0x2f
  4035ca:	je     4035c0 <___mingw_dirname+0x280>
  4035cc:	cmp    ax,0x5c
  4035d0:	je     4035c0 <___mingw_dirname+0x280>
  4035d2:	mov    eax,ecx
  4035d4:	sub    eax,edi
  4035d6:	cmp    eax,0x5
  4035d9:	jle    4036bd <___mingw_dirname+0x37d>
  4035df:	mov    ecx,edi
  4035e1:	mov    eax,ecx
  4035e3:	test   dx,dx
  4035e6:	je     403609 <___mingw_dirname+0x2c9>
  4035e8:	add    ecx,0x2
  4035eb:	cmp    dx,0x2f
  4035ef:	mov    WORD PTR [ecx-0x2],dx
  4035f3:	je     403657 <___mingw_dirname+0x317>
  4035f5:	cmp    WORD PTR [eax],0x5c
  4035f9:	lea    esi,[eax+0x2]
  4035fc:	je     403655 <___mingw_dirname+0x315>
  4035fe:	movzx  edx,WORD PTR [eax+0x2]
  403602:	mov    eax,esi
  403604:	test   dx,dx
  403607:	jne    4035e8 <___mingw_dirname+0x2a8>
  403609:	mov    eax,DWORD PTR [ebp-0x28]
  40360c:	xor    esi,esi
  40360e:	mov    WORD PTR [ecx],si
  403611:	mov    DWORD PTR [esp+0x4],edi
  403615:	mov    DWORD PTR [esp+0x8],eax
  403619:	mov    eax,DWORD PTR [ebp+0x8]
  40361c:	mov    DWORD PTR [esp],eax
  40361f:	call   403c30 <_wcstombs>
  403624:	cmp    eax,0xffffffff
  403627:	mov    esi,DWORD PTR [ebp+0x8]
  40362a:	je     403630 <___mingw_dirname+0x2f0>
  40362c:	mov    BYTE PTR [esi+eax*1],0x0
  403630:	mov    DWORD PTR [esp+0x4],ebx
  403634:	mov    DWORD PTR [esp],0x2
  40363b:	call   403c68 <_setlocale>
  403640:	mov    DWORD PTR [esp],ebx
  403643:	call   403cb0 <_free>
  403648:	mov    esp,DWORD PTR [ebp-0x24]
  40364b:	lea    esp,[ebp-0xc]
  40364e:	mov    eax,esi
  403650:	pop    ebx
  403651:	pop    esi
  403652:	pop    edi
  403653:	pop    ebp
  403654:	ret
  403655:	mov    eax,esi
  403657:	movzx  edx,WORD PTR [eax]
  40365a:	cmp    dx,0x5c
  40365e:	je     403670 <___mingw_dirname+0x330>
  403660:	cmp    dx,0x2f
  403664:	jne    4035e3 <___mingw_dirname+0x2a3>
  40366a:	lea    esi,[esi+0x0]
  403670:	add    eax,0x2
  403673:	movzx  edx,WORD PTR [eax]
  403676:	cmp    dx,0x2f
  40367a:	je     403670 <___mingw_dirname+0x330>
  40367c:	cmp    dx,0x5c
  403680:	je     403670 <___mingw_dirname+0x330>
  403682:	jmp    4035e3 <___mingw_dirname+0x2a3>
  403687:	movzx  eax,WORD PTR [ebp-0x1e]
  40368b:	cmp    ax,WORD PTR [edi+0x2]
  40368f:	jne    403480 <___mingw_dirname+0x140>
  403695:	cmp    WORD PTR [edi+0x4],0x0
  40369a:	jne    403480 <___mingw_dirname+0x140>
  4036a0:	mov    DWORD PTR [esp+0x4],ebx
  4036a4:	mov    DWORD PTR [esp],0x2
  4036ab:	call   403c68 <_setlocale>
  4036b0:	mov    DWORD PTR [esp],ebx
  4036b3:	call   403cb0 <_free>
  4036b8:	mov    esi,DWORD PTR [ebp+0x8]
  4036bb:	jmp    403648 <___mingw_dirname+0x308>
  4036bd:	cmp    WORD PTR [edi+0x2],dx
  4036c1:	jne    4035df <___mingw_dirname+0x29f>
  4036c7:	movzx  edx,WORD PTR [ecx]
  4036ca:	jmp    4035e1 <___mingw_dirname+0x2a1>
  4036cf:	lea    eax,[edi+0x4]
  4036d2:	mov    DWORD PTR [ebp-0x1c],eax
  4036d5:	movzx  eax,WORD PTR [edi+0x4]
  4036d9:	mov    WORD PTR [ebp-0x1e],ax
  4036dd:	jmp    403480 <___mingw_dirname+0x140>
  4036e2:	mov    eax,DWORD PTR [ebp-0x1c]
  4036e5:	add    eax,0x2
  4036e8:	jmp    40351b <___mingw_dirname+0x1db>
  4036ed:	jne    40359e <___mingw_dirname+0x25e>
  4036f3:	movzx  ecx,WORD PTR [ebp-0x1e]
  4036f7:	cmp    cx,0x2f
  4036fb:	je     403707 <___mingw_dirname+0x3c7>
  4036fd:	cmp    cx,0x5c
  403701:	jne    40359e <___mingw_dirname+0x25e>
  403707:	movzx  ecx,WORD PTR [ebp-0x1e]
  40370b:	cmp    WORD PTR [eax+0x2],cx
  40370f:	jne    40359e <___mingw_dirname+0x25e>
  403715:	movzx  edx,WORD PTR [eax+0x4]
  403719:	cmp    dx,0x2f
  40371d:	je     40359e <___mingw_dirname+0x25e>
  403723:	cmp    dx,0x5c
  403727:	je     40359e <___mingw_dirname+0x25e>
  40372d:	mov    eax,esi
  40372f:	jmp    40359e <___mingw_dirname+0x25e>
  403734:	nop
  403735:	nop
  403736:	nop
  403737:	nop
  403738:	nop
  403739:	nop
  40373a:	nop
  40373b:	nop
  40373c:	nop
  40373d:	nop
  40373e:	nop
  40373f:	nop

00403740 <.text>:
  403740:	push   esi
  403741:	push   ebx
  403742:	mov    ebx,edx
  403744:	sub    esp,0x154
  40374a:	lea    edx,[esp+0x10]
  40374e:	mov    DWORD PTR [esp],eax
  403751:	mov    DWORD PTR [esp+0x4],edx
  403755:	call   403d88 <_FindFirstFileA@8>
  40375a:	sub    esp,0x8
  40375d:	cmp    eax,0xffffffff
  403760:	mov    esi,eax
  403762:	je     4037be <.text+0x7e>
  403764:	xor    eax,eax
  403766:	lea    ecx,[ebx+0xc]
  403769:	mov    WORD PTR [ebx+0x6],ax
  40376d:	xor    eax,eax
  40376f:	jmp    403783 <.text+0x43>
  403771:	movzx  eax,WORD PTR [ebx+0x6]
  403775:	add    eax,0x1
  403778:	cmp    ax,0x104
  40377c:	mov    WORD PTR [ebx+0x6],ax
  403780:	adc    ecx,0x0
  403783:	movzx  eax,ax
  403786:	movzx  eax,BYTE PTR [esp+eax*1+0x3c]
  40378b:	test   al,al
  40378d:	mov    BYTE PTR [ecx],al
  40378f:	jne    403771 <.text+0x31>
  403791:	mov    eax,DWORD PTR [esp+0x10]
  403795:	and    al,0x58
  403797:	cmp    eax,0x10
  40379a:	jbe    4037b0 <.text+0x70>
  40379c:	mov    DWORD PTR [ebx+0x8],0x18
  4037a3:	add    esp,0x154
  4037a9:	mov    eax,esi
  4037ab:	pop    ebx
  4037ac:	pop    esi
  4037ad:	ret
  4037ae:	xchg   ax,ax
  4037b0:	mov    DWORD PTR [ebx+0x8],eax
  4037b3:	add    esp,0x154
  4037b9:	mov    eax,esi
  4037bb:	pop    ebx
  4037bc:	pop    esi
  4037bd:	ret
  4037be:	call   403ce8 <__errno>
  4037c3:	mov    ebx,eax
  4037c5:	call   403d68 <_GetLastError@0>
  4037ca:	cmp    eax,0x3
  4037cd:	mov    DWORD PTR [ebx],eax
  4037cf:	je     403802 <.text+0xc2>
  4037d1:	call   403ce8 <__errno>
  4037d6:	cmp    DWORD PTR [eax],0x10b
  4037dc:	je     4037f5 <.text+0xb5>
  4037de:	call   403ce8 <__errno>
  4037e3:	cmp    DWORD PTR [eax],0x2
  4037e6:	je     4037a3 <.text+0x63>
  4037e8:	call   403ce8 <__errno>
  4037ed:	mov    DWORD PTR [eax],0x16
  4037f3:	jmp    4037a3 <.text+0x63>
  4037f5:	call   403ce8 <__errno>
  4037fa:	mov    DWORD PTR [eax],0x14
  403800:	jmp    4037a3 <.text+0x63>
  403802:	call   403ce8 <__errno>
  403807:	mov    DWORD PTR [eax],0x2
  40380d:	jmp    4037a3 <.text+0x63>
  40380f:	nop
  403810:	push   esi
  403811:	push   ebx
  403812:	mov    ebx,edx
  403814:	sub    esp,0x154
  40381a:	lea    edx,[esp+0x10]
  40381e:	mov    DWORD PTR [esp],eax
  403821:	mov    DWORD PTR [esp+0x4],edx
  403825:	call   403d80 <_FindNextFileA@8>
  40382a:	sub    esp,0x8
  40382d:	test   eax,eax
  40382f:	mov    esi,eax
  403831:	je     403892 <.text+0x152>
  403833:	xor    eax,eax
  403835:	lea    ecx,[ebx+0xc]
  403838:	mov    WORD PTR [ebx+0x6],ax
  40383c:	xor    eax,eax
  40383e:	jmp    403852 <.text+0x112>
  403840:	movzx  eax,WORD PTR [ebx+0x6]
  403844:	add    eax,0x1
  403847:	cmp    ax,0x104
  40384b:	mov    WORD PTR [ebx+0x6],ax
  40384f:	adc    ecx,0x0
  403852:	movzx  eax,ax
  403855:	movzx  eax,BYTE PTR [esp+eax*1+0x3c]
  40385a:	test   al,al
  40385c:	mov    BYTE PTR [ecx],al
  40385e:	jne    403840 <.text+0x100>
  403860:	mov    eax,DWORD PTR [esp+0x10]
  403864:	and    al,0x58
  403866:	cmp    eax,0x10
  403869:	ja     403880 <.text+0x140>
  40386b:	mov    DWORD PTR [ebx+0x8],eax
  40386e:	add    esp,0x154
  403874:	mov    eax,esi
  403876:	pop    ebx
  403877:	pop    esi
  403878:	ret
  403879:	lea    esi,[esi+eiz*1+0x0]
  403880:	mov    DWORD PTR [ebx+0x8],0x18
  403887:	add    esp,0x154
  40388d:	mov    eax,esi
  40388f:	pop    ebx
  403890:	pop    esi
  403891:	ret
  403892:	call   403d68 <_GetLastError@0>
  403897:	cmp    eax,0x12
  40389a:	je     40386e <.text+0x12e>
  40389c:	call   403ce8 <__errno>
  4038a1:	mov    DWORD PTR [eax],0x2
  4038a7:	add    esp,0x154
  4038ad:	mov    eax,esi
  4038af:	pop    ebx
  4038b0:	pop    esi
  4038b1:	ret
  4038b2:	lea    esi,[esi+eiz*1+0x0]
  4038b9:	lea    edi,[edi+eiz*1+0x0]

004038c0 <___mingw_opendir>:
  4038c0:	push   ebp
  4038c1:	push   edi
  4038c2:	push   esi
  4038c3:	push   ebx
  4038c4:	sub    esp,0x12c
  4038ca:	mov    eax,DWORD PTR [esp+0x140]
  4038d1:	test   eax,eax
  4038d3:	je     403a5c <___mingw_opendir+0x19c>
  4038d9:	cmp    BYTE PTR [eax],0x0
  4038dc:	je     403a40 <___mingw_opendir+0x180>
  4038e2:	lea    edi,[esp+0x1c]
  4038e6:	mov    DWORD PTR [esp+0x8],0x104
  4038ee:	mov    DWORD PTR [esp+0x4],eax
  4038f2:	mov    DWORD PTR [esp],edi
  4038f5:	call   403ce0 <__fullpath>
  4038fa:	cmp    BYTE PTR [esp+0x1c],0x0
  4038ff:	mov    eax,edi
  403901:	je     403950 <___mingw_opendir+0x90>
  403903:	mov    ecx,DWORD PTR [eax]
  403905:	add    eax,0x4
  403908:	lea    edx,[ecx-0x1010101]
  40390e:	not    ecx
  403910:	and    edx,ecx
  403912:	and    edx,0x80808080
  403918:	je     403903 <___mingw_opendir+0x43>
  40391a:	test   edx,0x8080
  403920:	je     403a30 <___mingw_opendir+0x170>
  403926:	mov    ecx,edx
  403928:	add    cl,dl
  40392a:	sbb    eax,0x3
  40392d:	sub    eax,edi
  40392f:	movzx  edx,BYTE PTR [esp+eax*1+0x1b]
  403934:	cmp    dl,0x2f
  403937:	je     40397c <___mingw_opendir+0xbc>
  403939:	cmp    dl,0x5c
  40393c:	je     40397c <___mingw_opendir+0xbc>
  40393e:	mov    ecx,0x5c
  403943:	mov    WORD PTR [edi+eax*1],cx
  403947:	add    eax,0x1
  40394a:	jmp    40397c <___mingw_opendir+0xbc>
  40394c:	lea    esi,[esi+eiz*1+0x0]
  403950:	mov    ecx,DWORD PTR [eax]
  403952:	add    eax,0x4
  403955:	lea    edx,[ecx-0x1010101]
  40395b:	not    ecx
  40395d:	and    edx,ecx
  40395f:	and    edx,0x80808080
  403965:	je     403950 <___mingw_opendir+0x90>
  403967:	test   edx,0x8080
  40396d:	je     403a20 <___mingw_opendir+0x160>
  403973:	mov    ecx,edx
  403975:	add    cl,dl
  403977:	sbb    eax,0x3
  40397a:	sub    eax,edi
  40397c:	mov    edx,0x2a
  403981:	mov    ebx,edi
  403983:	mov    WORD PTR [edi+eax*1],dx
  403987:	mov    edx,DWORD PTR [ebx]
  403989:	add    ebx,0x4
  40398c:	lea    eax,[edx-0x1010101]
  403992:	not    edx
  403994:	and    eax,edx
  403996:	and    eax,0x80808080
  40399b:	je     403987 <___mingw_opendir+0xc7>
  40399d:	test   eax,0x8080
  4039a2:	jne    4039aa <___mingw_opendir+0xea>
  4039a4:	shr    eax,0x10
  4039a7:	add    ebx,0x2
  4039aa:	mov    ecx,eax
  4039ac:	add    cl,al
  4039ae:	sbb    ebx,0x3
  4039b1:	sub    ebx,edi
  4039b3:	lea    eax,[ebx+0x11c]
  4039b9:	mov    DWORD PTR [esp],eax
  4039bc:	call   403ca0 <_malloc>
  4039c1:	test   eax,eax
  4039c3:	mov    esi,eax
  4039c5:	je     403a4f <___mingw_opendir+0x18f>
  4039cb:	lea    ebp,[eax+0x118]
  4039d1:	add    ebx,0x1
  4039d4:	mov    DWORD PTR [esp+0x4],edi
  4039d8:	mov    DWORD PTR [esp+0x8],ebx
  4039dc:	mov    DWORD PTR [esp],ebp
  4039df:	call   403c90 <_memcpy>
  4039e4:	mov    edx,esi
  4039e6:	mov    eax,ebp
  4039e8:	call   403740 <.text>
  4039ed:	cmp    eax,0xffffffff
  4039f0:	mov    DWORD PTR [esi+0x110],eax
  4039f6:	je     403a6b <___mingw_opendir+0x1ab>
  4039f8:	mov    eax,0x110
  4039fd:	mov    DWORD PTR [esi+0x114],0x0
  403a07:	mov    DWORD PTR [esi],0x0
  403a0d:	mov    WORD PTR [esi+0x4],ax
  403a11:	add    esp,0x12c
  403a17:	mov    eax,esi
  403a19:	pop    ebx
  403a1a:	pop    esi
  403a1b:	pop    edi
  403a1c:	pop    ebp
  403a1d:	ret
  403a1e:	xchg   ax,ax
  403a20:	shr    edx,0x10
  403a23:	add    eax,0x2
  403a26:	jmp    403973 <___mingw_opendir+0xb3>
  403a2b:	nop
  403a2c:	lea    esi,[esi+eiz*1+0x0]
  403a30:	shr    edx,0x10
  403a33:	add    eax,0x2
  403a36:	jmp    403926 <___mingw_opendir+0x66>
  403a3b:	nop
  403a3c:	lea    esi,[esi+eiz*1+0x0]
  403a40:	call   403ce8 <__errno>
  403a45:	xor    esi,esi
  403a47:	mov    DWORD PTR [eax],0x2
  403a4d:	jmp    403a11 <___mingw_opendir+0x151>
  403a4f:	call   403ce8 <__errno>
  403a54:	mov    DWORD PTR [eax],0xc
  403a5a:	jmp    403a11 <___mingw_opendir+0x151>
  403a5c:	call   403ce8 <__errno>
  403a61:	xor    esi,esi
  403a63:	mov    DWORD PTR [eax],0x16
  403a69:	jmp    403a11 <___mingw_opendir+0x151>
  403a6b:	mov    DWORD PTR [esp],esi
  403a6e:	xor    esi,esi
  403a70:	call   403cb0 <_free>
  403a75:	jmp    403a11 <___mingw_opendir+0x151>
  403a77:	mov    esi,esi
  403a79:	lea    edi,[edi+eiz*1+0x0]

00403a80 <___mingw_readdir>:
  403a80:	push   ebx
  403a81:	sub    esp,0x8
  403a84:	mov    ebx,DWORD PTR [esp+0x10]
  403a88:	test   ebx,ebx
  403a8a:	je     403ab7 <___mingw_readdir+0x37>
  403a8c:	mov    eax,DWORD PTR [ebx+0x114]
  403a92:	lea    edx,[eax+0x1]
  403a95:	test   eax,eax
  403a97:	mov    DWORD PTR [ebx+0x114],edx
  403a9d:	jle    403ab0 <___mingw_readdir+0x30>
  403a9f:	mov    eax,DWORD PTR [ebx+0x110]
  403aa5:	mov    edx,ebx
  403aa7:	call   403810 <.text+0xd0>
  403aac:	test   eax,eax
  403aae:	je     403ab2 <___mingw_readdir+0x32>
  403ab0:	mov    eax,ebx
  403ab2:	add    esp,0x8
  403ab5:	pop    ebx
  403ab6:	ret
  403ab7:	call   403ce8 <__errno>
  403abc:	mov    DWORD PTR [eax],0x9
  403ac2:	xor    eax,eax
  403ac4:	jmp    403ab2 <___mingw_readdir+0x32>
  403ac6:	lea    esi,[esi+0x0]
  403ac9:	lea    edi,[edi+eiz*1+0x0]

00403ad0 <___mingw_closedir>:
  403ad0:	push   ebx
  403ad1:	sub    esp,0x18
  403ad4:	mov    ebx,DWORD PTR [esp+0x20]
  403ad8:	test   ebx,ebx
  403ada:	je     403b00 <___mingw_closedir+0x30>
  403adc:	mov    eax,DWORD PTR [ebx+0x110]
  403ae2:	mov    DWORD PTR [esp],eax
  403ae5:	call   403d90 <_FindClose@4>
  403aea:	sub    esp,0x4
  403aed:	test   eax,eax
  403aef:	je     403b00 <___mingw_closedir+0x30>
  403af1:	mov    DWORD PTR [esp],ebx
  403af4:	call   403cb0 <_free>
  403af9:	xor    eax,eax
  403afb:	add    esp,0x18
  403afe:	pop    ebx
  403aff:	ret
  403b00:	call   403ce8 <__errno>
  403b05:	mov    DWORD PTR [eax],0x9
  403b0b:	mov    eax,0xffffffff
  403b10:	jmp    403afb <___mingw_closedir+0x2b>
  403b12:	lea    esi,[esi+eiz*1+0x0]
  403b19:	lea    edi,[edi+eiz*1+0x0]

00403b20 <___mingw_rewinddir>:
  403b20:	push   ebx
  403b21:	sub    esp,0x18
  403b24:	mov    ebx,DWORD PTR [esp+0x20]
  403b28:	test   ebx,ebx
  403b2a:	je     403b41 <___mingw_rewinddir+0x21>
  403b2c:	mov    eax,DWORD PTR [ebx+0x110]
  403b32:	mov    DWORD PTR [esp],eax
  403b35:	call   403d90 <_FindClose@4>
  403b3a:	sub    esp,0x4
  403b3d:	test   eax,eax
  403b3f:	jne    403b51 <___mingw_rewinddir+0x31>
  403b41:	call   403ce8 <__errno>
  403b46:	mov    DWORD PTR [eax],0x9
  403b4c:	add    esp,0x18
  403b4f:	pop    ebx
  403b50:	ret
  403b51:	lea    eax,[ebx+0x118]
  403b57:	mov    edx,ebx
  403b59:	call   403740 <.text>
  403b5e:	cmp    eax,0xffffffff
  403b61:	mov    DWORD PTR [ebx+0x110],eax
  403b67:	je     403b4c <___mingw_rewinddir+0x2c>
  403b69:	mov    DWORD PTR [ebx+0x114],0x0
  403b73:	add    esp,0x18
  403b76:	pop    ebx
  403b77:	ret
  403b78:	nop
  403b79:	lea    esi,[esi+eiz*1+0x0]

00403b80 <___mingw_telldir>:
  403b80:	sub    esp,0xc
  403b83:	mov    eax,DWORD PTR [esp+0x10]
  403b87:	test   eax,eax
  403b89:	je     403b95 <___mingw_telldir+0x15>
  403b8b:	mov    eax,DWORD PTR [eax+0x114]
  403b91:	add    esp,0xc
  403b94:	ret
  403b95:	call   403ce8 <__errno>
  403b9a:	mov    DWORD PTR [eax],0x9
  403ba0:	mov    eax,0xffffffff
  403ba5:	jmp    403b91 <___mingw_telldir+0x11>
  403ba7:	mov    esi,esi
  403ba9:	lea    edi,[edi+eiz*1+0x0]

00403bb0 <___mingw_seekdir>:
  403bb0:	push   esi
  403bb1:	push   ebx
  403bb2:	sub    esp,0x14
  403bb5:	mov    esi,DWORD PTR [esp+0x24]
  403bb9:	mov    ebx,DWORD PTR [esp+0x20]
  403bbd:	test   esi,esi
  403bbf:	js     403c10 <___mingw_seekdir+0x60>
  403bc1:	mov    DWORD PTR [esp],ebx
  403bc4:	call   403b20 <___mingw_rewinddir>
  403bc9:	test   esi,esi
  403bcb:	je     403c04 <___mingw_seekdir+0x54>
  403bcd:	cmp    DWORD PTR [ebx+0x110],0xffffffff
  403bd4:	jne    403bf1 <___mingw_seekdir+0x41>
  403bd6:	jmp    403c04 <___mingw_seekdir+0x54>
  403bd8:	nop
  403bd9:	lea    esi,[esi+eiz*1+0x0]
  403be0:	mov    eax,DWORD PTR [ebx+0x110]
  403be6:	mov    edx,ebx
  403be8:	call   403810 <.text+0xd0>
  403bed:	test   eax,eax
  403bef:	je     403c04 <___mingw_seekdir+0x54>
  403bf1:	mov    eax,DWORD PTR [ebx+0x114]
  403bf7:	add    eax,0x1
  403bfa:	cmp    esi,eax
  403bfc:	mov    DWORD PTR [ebx+0x114],eax
  403c02:	jg     403be0 <___mingw_seekdir+0x30>
  403c04:	add    esp,0x14
  403c07:	pop    ebx
  403c08:	pop    esi
  403c09:	ret
  403c0a:	lea    esi,[esi+0x0]
  403c10:	call   403ce8 <__errno>
  403c15:	mov    DWORD PTR [eax],0x16
  403c1b:	add    esp,0x14
  403c1e:	pop    ebx
  403c1f:	pop    esi
  403c20:	ret
  403c21:	nop
  403c22:	nop
  403c23:	nop
  403c24:	nop
  403c25:	nop
  403c26:	nop
  403c27:	nop
  403c28:	nop
  403c29:	nop
  403c2a:	nop
  403c2b:	nop
  403c2c:	nop
  403c2d:	nop
  403c2e:	nop
  403c2f:	nop

00403c30 <_wcstombs>:
  403c30:	jmp    DWORD PTR ds:0x408228
  403c36:	nop
  403c37:	nop

00403c38 <_vfprintf>:
  403c38:	jmp    DWORD PTR ds:0x408224
  403c3e:	nop
  403c3f:	nop

00403c40 <_tolower>:
  403c40:	jmp    DWORD PTR ds:0x408220
  403c46:	nop
  403c47:	nop

00403c48 <_strlen>:
  403c48:	jmp    DWORD PTR ds:0x40821c
  403c4e:	nop
  403c4f:	nop

00403c50 <_strcoll>:
  403c50:	jmp    DWORD PTR ds:0x408218
  403c56:	nop
  403c57:	nop

00403c58 <_strcmp>:
  403c58:	jmp    DWORD PTR ds:0x408214
  403c5e:	nop
  403c5f:	nop

00403c60 <_signal>:
  403c60:	jmp    DWORD PTR ds:0x408210
  403c66:	nop
  403c67:	nop

00403c68 <_setlocale>:
  403c68:	jmp    DWORD PTR ds:0x40820c
  403c6e:	nop
  403c6f:	nop

00403c70 <_scanf>:
  403c70:	jmp    DWORD PTR ds:0x408208
  403c76:	nop
  403c77:	nop

00403c78 <_realloc>:
  403c78:	jmp    DWORD PTR ds:0x408204
  403c7e:	nop
  403c7f:	nop

00403c80 <_puts>:
  403c80:	jmp    DWORD PTR ds:0x408200
  403c86:	nop
  403c87:	nop

00403c88 <_printf>:
  403c88:	jmp    DWORD PTR ds:0x4081fc
  403c8e:	nop
  403c8f:	nop

00403c90 <_memcpy>:
  403c90:	jmp    DWORD PTR ds:0x4081f8
  403c96:	nop
  403c97:	nop

00403c98 <_mbstowcs>:
  403c98:	jmp    DWORD PTR ds:0x4081f4
  403c9e:	nop
  403c9f:	nop

00403ca0 <_malloc>:
  403ca0:	jmp    DWORD PTR ds:0x4081f0
  403ca6:	nop
  403ca7:	nop

00403ca8 <_fwrite>:
  403ca8:	jmp    DWORD PTR ds:0x4081ec
  403cae:	nop
  403caf:	nop

00403cb0 <_free>:
  403cb0:	jmp    DWORD PTR ds:0x4081e8
  403cb6:	nop
  403cb7:	nop

00403cb8 <_exit>:
  403cb8:	jmp    DWORD PTR ds:0x4081e4
  403cbe:	nop
  403cbf:	nop

00403cc0 <_calloc>:
  403cc0:	jmp    DWORD PTR ds:0x4081e0
  403cc6:	nop
  403cc7:	nop

00403cc8 <_abort>:
  403cc8:	jmp    DWORD PTR ds:0x4081d8
  403cce:	nop
  403ccf:	nop

00403cd0 <__setmode>:
  403cd0:	jmp    DWORD PTR ds:0x4081d4
  403cd6:	nop
  403cd7:	nop

00403cd8 <__isctype>:
  403cd8:	jmp    DWORD PTR ds:0x4081c8
  403cde:	nop
  403cdf:	nop

00403ce0 <__fullpath>:
  403ce0:	jmp    DWORD PTR ds:0x4081c0
  403ce6:	nop
  403ce7:	nop

00403ce8 <__errno>:
  403ce8:	jmp    DWORD PTR ds:0x4081b8
  403cee:	nop
  403cef:	nop

00403cf0 <__cexit>:
  403cf0:	jmp    DWORD PTR ds:0x4081b4
  403cf6:	nop
  403cf7:	nop

00403cf8 <___p__fmode>:
  403cf8:	jmp    DWORD PTR ds:0x4081ac
  403cfe:	nop
  403cff:	nop

00403d00 <___p__environ>:
  403d00:	jmp    DWORD PTR ds:0x4081a8
  403d06:	nop
  403d07:	nop

00403d08 <___getmainargs>:
  403d08:	jmp    DWORD PTR ds:0x4081a0
  403d0e:	nop
  403d0f:	nop

00403d10 <_VirtualQuery@12>:
  403d10:	jmp    DWORD PTR ds:0x40818c
  403d16:	nop
  403d17:	nop

00403d18 <_VirtualProtect@16>:
  403d18:	jmp    DWORD PTR ds:0x408188
  403d1e:	nop
  403d1f:	nop

00403d20 <_TlsGetValue@4>:
  403d20:	jmp    DWORD PTR ds:0x408184
  403d26:	nop
  403d27:	nop

00403d28 <_Sleep@4>:
  403d28:	jmp    DWORD PTR ds:0x408180
  403d2e:	nop
  403d2f:	nop

00403d30 <_SetUnhandledExceptionFilter@4>:
  403d30:	jmp    DWORD PTR ds:0x40817c
  403d36:	nop
  403d37:	nop

00403d38 <_LoadLibraryA@4>:
  403d38:	jmp    DWORD PTR ds:0x408178
  403d3e:	nop
  403d3f:	nop

00403d40 <_LeaveCriticalSection@4>:
  403d40:	jmp    DWORD PTR ds:0x408174
  403d46:	nop
  403d47:	nop

00403d48 <_IsDebuggerPresent@0>:
  403d48:	jmp    DWORD PTR ds:0x408170
  403d4e:	nop
  403d4f:	nop

00403d50 <_InitializeCriticalSection@4>:
  403d50:	jmp    DWORD PTR ds:0x40816c
  403d56:	nop
  403d57:	nop

00403d58 <_GetProcAddress@8>:
  403d58:	jmp    DWORD PTR ds:0x408168
  403d5e:	nop
  403d5f:	nop

00403d60 <_GetModuleHandleA@4>:
  403d60:	jmp    DWORD PTR ds:0x408164
  403d66:	nop
  403d67:	nop

00403d68 <_GetLastError@0>:
  403d68:	jmp    DWORD PTR ds:0x408160
  403d6e:	nop
  403d6f:	nop

00403d70 <_GetCommandLineA@0>:
  403d70:	jmp    DWORD PTR ds:0x40815c
  403d76:	nop
  403d77:	nop

00403d78 <_FreeLibrary@4>:
  403d78:	jmp    DWORD PTR ds:0x408158
  403d7e:	nop
  403d7f:	nop

00403d80 <_FindNextFileA@8>:
  403d80:	jmp    DWORD PTR ds:0x408154
  403d86:	nop
  403d87:	nop

00403d88 <_FindFirstFileA@8>:
  403d88:	jmp    DWORD PTR ds:0x408150
  403d8e:	nop
  403d8f:	nop

00403d90 <_FindClose@4>:
  403d90:	jmp    DWORD PTR ds:0x40814c
  403d96:	nop
  403d97:	nop

00403d98 <_ExitProcess@4>:
  403d98:	jmp    DWORD PTR ds:0x408148
  403d9e:	nop
  403d9f:	nop

00403da0 <_EnterCriticalSection@4>:
  403da0:	jmp    DWORD PTR ds:0x408144
  403da6:	nop
  403da7:	nop

00403da8 <_DeleteCriticalSection@4>:
  403da8:	jmp    DWORD PTR ds:0x408140
  403dae:	nop
  403daf:	nop

00403db0 <_stricoll>:
  403db0:	jmp    DWORD PTR ds:0x408198
  403db6:	nop
  403db7:	nop

00403db8 <_strdup>:
  403db8:	jmp    DWORD PTR ds:0x408194
  403dbe:	nop
  403dbf:	nop

00403dc0 <_register_frame_ctor>:
  403dc0:	push   ebp
  403dc1:	mov    ebp,esp
  403dc3:	pop    ebp
  403dc4:	jmp    401340 <___gcc_register_frame>
  403dc9:	nop
  403dca:	nop
  403dcb:	nop
  403dcc:	nop
  403dcd:	nop
  403dce:	nop
  403dcf:	nop

00403dd0 <__CTOR_LIST__>:
  403dd0:	(bad)
  403dd1:	(bad)
  403dd2:	(bad)
  403dd3:	.byte 0xff

00403dd4 <.ctors.65535>:
  403dd4:	sar    BYTE PTR ds:0x40,0x0
	...

00403ddc <__DTOR_LIST__>:
  403ddc:	(bad)
  403ddd:	(bad)
  403dde:	(bad)
  403ddf:	inc    DWORD PTR [eax]
  403de1:	add    BYTE PTR [eax],al
	...
