401000: push ebp
401001: mov ebp, esp
401003: sub esp, 8
401006: mov dword ptr [esp], 1
40100d: call dword ptr [0x40616c]
401013: call 0x401080
401018: mov esp, ebp
40101a: xor eax, eax
40101c: pop ebp
40101d: ret 
40101e: mov esi, esi
401020: push ebp
401021: mov ebp, esp
401023: sub esp, 8
401026: mov dword ptr [esp], 2
40102d: call dword ptr [0x40616c]
401033: call 0x401080
401038: mov esp, ebp
40103a: xor eax, eax
40103c: pop ebp
40103d: ret 
40103e: mov esi, esi
401040: push ebp
401041: mov ebp, esp
401043: sub esp, 8
401046: mov edx, dword ptr [ebp + 8]
401049: mov dword ptr [esp], edx
40104c: call dword ptr [0x40618c]
401052: mov esp, ebp
401054: pop ebp
401055: ret 
401056: lea esi, [esi]
401059: lea edi, [edi]
401060: push ebp
401061: mov ebp, esp
401063: sub esp, 8
401066: mov edx, dword ptr [ebp + 8]
401069: mov dword ptr [esp], edx
40106c: call dword ptr [0x40617c]
401072: mov esp, ebp
401074: pop ebp
401075: ret 
401076: lea esi, [esi]
401079: lea edi, [edi]
401080: push ebp
401081: mov ebp, esp
401083: push ebx
401084: sub esp, 0x24
401087: mov dword ptr [esp], 0x4011a0
40108e: call 0x402940
401093: sub esp, 4
401096: call 0x4022f0
40109b: mov dword ptr [esp], 0x403000
4010a2: mov edx, dword ptr [0x403010]
4010a8: lea ecx, [ebp - 8]
4010ab: mov dword ptr [ebp - 8], 0
4010b2: mov dword ptr [esp + 0x10], ecx
4010b6: mov dword ptr [esp + 0xc], edx
4010ba: lea edx, [ebp - 0xc]
4010bd: mov dword ptr [esp + 8], edx
4010c1: mov dword ptr [esp + 4], 0x403004
4010c9: call 0x402810
4010ce: mov eax, dword ptr [0x405000]
4010d3: test eax, eax
4010d5: je 0x40114d
4010d7: mov dword ptr [0x403020], eax
4010dc: mov eax, dword ptr [0x406178]
4010e1: test eax, eax
4010e3: je 0x401104
4010e5: mov dword ptr [esp], eax
4010e8: call 0x4027f0
4010ed: mov ebx, dword ptr [0x405000]
4010f3: mov dword ptr [esp], eax
4010f6: mov dword ptr [esp + 4], ebx
4010fa: call 0x402800
4010ff: mov eax, dword ptr [0x406178]
401104: cmp eax, -0x20
401107: je 0x40112b
401109: add eax, 0x20
40110c: mov dword ptr [esp], eax
40110f: call 0x4027f0
401114: mov ecx, dword ptr [0x405000]
40111a: mov dword ptr [esp], eax
40111d: mov dword ptr [esp + 4], ecx
401121: call 0x402800
401126: mov eax, dword ptr [0x406178]
40112b: cmp eax, -0x40
40112e: je 0x40114d
401130: add eax, 0x40
401133: mov dword ptr [esp], eax
401136: call 0x4027f0
40113b: mov ebx, dword ptr [0x405000]
401141: mov dword ptr [esp], eax
401144: mov dword ptr [esp + 4], ebx
401148: call 0x402800
40114d: call 0x4027e0
401152: mov ecx, dword ptr [0x403020]
401158: mov dword ptr [eax], ecx
40115a: call 0x4022c0
40115f: call 0x4027c0
401164: mov edx, dword ptr [0x403000]
40116a: mov ebx, dword ptr [eax]
40116c: mov ecx, dword ptr [0x403004]
401172: mov dword ptr [esp], edx
401175: mov dword ptr [esp + 8], ebx
401179: mov dword ptr [esp + 4], ecx
40117d: call 0x4012b0
401182: mov ebx, eax
401184: call 0x4027b0
401189: mov dword ptr [esp], ebx
40118c: call 0x402950
401191: jmp 0x4011a0
401193: nop 
401194: nop 
401195: nop 
401196: nop 
401197: nop 
401198: nop 
401199: nop 
40119a: nop 
40119b: nop 
40119c: nop 
40119d: nop 
40119e: nop 
40119f: nop 
4011a0: push ebp
4011a1: mov ebp, esp
4011a3: sub esp, 0x18
4011a6: mov dword ptr [ebp - 8], ebx
4011a9: mov ecx, dword ptr [ebp + 8]
4011ac: xor ebx, ebx
4011ae: mov dword ptr [ebp - 4], esi
4011b1: xor esi, esi
4011b3: mov edx, dword ptr [ecx]
4011b5: mov eax, dword ptr [edx]
4011b7: cmp eax, 0xc0000091
4011bc: ja 0x401280
4011c2: cmp eax, 0xc000008d
4011c7: jae 0x401230
4011c9: cmp eax, 0xc0000005
4011ce: je 0x4011de
4011d0: mov eax, ebx
4011d2: mov esi, dword ptr [ebp - 4]
4011d5: mov ebx, dword ptr [ebp - 8]
4011d8: mov esp, ebp
4011da: pop ebp
4011db: ret 4
4011de: mov dword ptr [esp + 4], 0
4011e6: mov dword ptr [esp], 0xb
4011ed: call 0x4027d0
4011f2: cmp eax, 1
4011f5: je 0x401219
4011f7: test eax, eax
4011f9: je 0x4011d0
4011fb: mov dword ptr [esp], 0xb
401202: lea esi, [esi]
401209: lea edi, [edi]
401210: call eax
401212: mov ebx, 0xffffffff
401217: jmp 0x4011d0
401219: mov dword ptr [esp + 4], 1
401221: mov dword ptr [esp], 0xb
401228: call 0x4027d0
40122d: jmp 0x401212
40122f: nop 
401230: mov esi, 1
401235: mov dword ptr [esp + 4], 0
40123d: mov dword ptr [esp], 8
401244: call 0x4027d0
401249: cmp eax, 1
40124c: je 0x40125f
40124e: test eax, eax
401250: je 0x4011d0
401256: mov dword ptr [esp], 8
40125d: jmp 0x401210
40125f: mov dword ptr [esp + 4], 1
401267: mov dword ptr [esp], 8
40126e: call 0x4027d0
401273: test esi, esi
401275: je 0x401212
401277: call 0x4022f0
40127c: jmp 0x401212
40127e: mov esi, esi
401280: cmp eax, 0xc0000093
401285: je 0x401230
401287: cmp eax, 0xc0000094
40128c: je 0x401235
40128e: jmp 0x4011d0
401293: nop 
401294: nop 
401295: nop 
401296: nop 
401297: nop 
401298: nop 
401299: nop 
40129a: nop 
40129b: nop 
40129c: nop 
40129d: nop 
40129e: nop 
40129f: nop 
4012a0: push ebp
4012a1: mov ebp, esp
4012a3: pop ebp
4012a4: jmp 0x4024c0
4012a9: nop 
4012aa: nop 
4012ab: nop 
4012ac: nop 
4012ad: nop 
4012ae: nop 
4012af: nop 
4012b0: push ebp
4012b1: mov ebp, esp
4012b3: sub esp, 0x4c8
4012b9: and esp, 0xfffffff0
4012bc: mov eax, 0
4012c1: add eax, 0xf
4012c4: add eax, 0xf
4012c7: shr eax, 4
4012ca: shl eax, 4
4012cd: mov dword ptr [ebp - 0x49c], eax
4012d3: mov eax, dword ptr [ebp - 0x49c]
4012d9: call 0x402700
4012de: call 0x4023a0
4012e3: mov eax, dword ptr [0x404000]
4012e8: mov dword ptr [ebp - 0x78], eax
4012eb: mov eax, dword ptr [0x404004]
4012f0: mov dword ptr [ebp - 0x74], eax
4012f3: mov eax, dword ptr [0x404008]
4012f8: mov dword ptr [ebp - 0x70], eax
4012fb: lea edx, [ebp - 0x6c]
4012fe: mov eax, 0x58
401303: mov dword ptr [esp + 8], eax
401307: mov dword ptr [esp + 4], 0
40130f: mov dword ptr [esp], edx
401312: call 0x402850
401317: mov dword ptr [esp], 0x404064
40131e: call 0x4028d0
401323: mov dword ptr [esp], 0x404088
40132a: call 0x4028d0
40132f: mov dword ptr [esp], 0x4040a4
401336: call 0x4028d0
40133b: mov dword ptr [esp], 0x4040e7
401342: call 0x4028d0
401347: lea eax, [ebp - 0xe8]
40134d: mov dword ptr [esp], eax
401350: call 0x4028c0
401355: mov dword ptr [ebp - 0x17c], 0
40135f: lea eax, [ebp - 0xe8]
401365: mov dword ptr [esp], eax
401368: call 0x4028b0
40136d: cmp dword ptr [ebp - 0x17c], eax
401373: jae 0x4013e5
401375: lea eax, [ebp - 8]
401378: add eax, dword ptr [ebp - 0x17c]
40137e: sub eax, 0xe0
401383: movsx eax, byte ptr [eax]
401386: mov dword ptr [esp], eax
401389: call 0x4028a0
40138e: test eax, eax
401390: jne 0x4013b1
401392: lea eax, [ebp - 8]
401395: add eax, dword ptr [ebp - 0x17c]
40139b: sub eax, 0xe0
4013a0: movsx eax, byte ptr [eax]
4013a3: mov dword ptr [esp], eax
4013a6: call 0x402890
4013ab: test eax, eax
4013ad: jne 0x4013b1
4013af: jmp 0x4013d8
4013b1: mov dword ptr [esp], 0x4040ed
4013b8: call 0x4028d0
4013bd: mov dword ptr [esp], 0x404108
4013c4: call 0x402880
4013c9: mov dword ptr [ebp - 0x48c], 0
4013d3: jmp 0x401a0d
4013d8: lea eax, [ebp - 0x17c]
4013de: inc dword ptr [eax]
4013e0: jmp 0x40135f
4013e5: lea eax, [ebp - 0xe8]
4013eb: mov dword ptr [esp], eax
4013ee: call 0x4028b0
4013f3: cmp eax, 4
4013f6: jbe 0x40132f
4013fc: lea eax, [ebp - 0xe8]
401402: mov dword ptr [esp], eax
401405: call 0x4028b0
40140a: cmp eax, 0xf
40140d: ja 0x40132f
401413: mov byte ptr [ebp - 0x172], 0x73
40141a: mov byte ptr [ebp - 0x16c], 0x65
401421: mov byte ptr [ebp - 0x178], 0x6d
401428: mov byte ptr [ebp - 0x177], 0x6f
40142f: mov byte ptr [ebp - 0x176], 0x76
401436: mov dword ptr [ebp - 0x17c], 0
401440: mov dword ptr [ebp - 0x494], 0
40144a: mov dword ptr [ebp - 0x180], 0x64
401454: mov dword ptr [ebp - 0x184], 1
40145e: mov dword ptr [ebp - 0x1ac], 7
401468: mov dword ptr [ebp - 0x1a8], 7
401472: mov dword ptr [ebp - 0x1a4], 7
40147c: mov dword ptr [ebp - 0x1a0], 7
401486: mov dword ptr [ebp - 0x19c], 7
401490: mov dword ptr [ebp - 0x198], 7
40149a: mov dword ptr [ebp - 0x194], 7
4014a4: mov dword ptr [ebp - 0x190], 7
4014ae: mov dword ptr [ebp - 0x18c], 7
4014b8: mov dword ptr [ebp - 0x188], 7
4014c2: mov dword ptr [ebp - 0x490], 0
4014cc: cmp dword ptr [ebp - 0x490], 0x64
4014d3: jne 0x4014d7
4014d5: jmp 0x4014df
4014d7: inc dword ptr [ebp - 0x490]
4014dd: jmp 0x4014cc
4014df: mov dword ptr [ebp - 0x490], 0xffffffff
4014e9: lea eax, [ebp - 0x168]
4014ef: mov dword ptr [esp], eax
4014f2: call 0x4028b0
4014f7: mov dword ptr [ebp - 0x17c], eax
4014fd: lea eax, [ebp - 0x17c]
401503: inc dword ptr [eax]
401505: lea eax, [ebp - 8]
401508: add eax, dword ptr [ebp - 0x17c]
40150e: sub eax, 0x160
401513: mov byte ptr [eax], 0x7a
401516: lea eax, [ebp - 8]
401519: add eax, dword ptr [ebp - 0x17c]
40151f: sub eax, 0x15f
401524: mov byte ptr [eax], 0x69
401527: mov byte ptr [ebp - 0x160], 0x64
40152e: cmp dword ptr [ebp - 0x17c], 0xa
401535: jle 0x401541
401537: mov dword ptr [ebp - 0x490], 0x68
401541: cmp dword ptr [ebp - 0x494], 0x29a
40154b: jg 0x4016d0
401551: cmp byte ptr [ebp - 0x163], 0x73
401558: jne 0x401566
40155a: mov dword ptr [ebp - 0x490], 0
401564: jmp 0x401570
401566: mov dword ptr [ebp - 0x490], 0xffffffe0
401570: cmp byte ptr [ebp - 0x167], 0x65
401577: jne 0x401585
401579: mov dword ptr [ebp - 0x18c], 0
401583: jmp 0x401594
401585: mov eax, dword ptr [ebp - 0x490]
40158b: sub eax, 2
40158e: mov dword ptr [ebp - 0x18c], eax
401594: cmp byte ptr [ebp - 0x168], 0x72
40159b: jne 0x4015a9
40159d: mov dword ptr [ebp - 0x190], 0
4015a7: jmp 0x4015b8
4015a9: mov eax, dword ptr [ebp - 0x490]
4015af: add eax, 2
4015b2: mov dword ptr [ebp - 0x190], eax
4015b8: cmp byte ptr [ebp - 0x161], 0x69
4015bf: jne 0x4015cd
4015c1: mov dword ptr [ebp - 0x194], 0
4015cb: jmp 0x4015dc
4015cd: mov eax, dword ptr [ebp - 0x490]
4015d3: add eax, 0xc
4015d6: mov dword ptr [ebp - 0x194], eax
4015dc: cmp byte ptr [ebp - 0x166], 0x61
4015e3: jne 0x4015f1
4015e5: mov dword ptr [ebp - 0x198], 0
4015ef: jmp 0x401608
4015f1: mov eax, dword ptr [ebp - 0x490]
4015f7: shl eax, 3
4015fa: sub eax, dword ptr [ebp - 0x490]
401600: add eax, eax
401602: mov dword ptr [ebp - 0x198], eax
401608: cmp byte ptr [ebp - 0x164], 0x6c
40160f: jne 0x40161d
401611: mov dword ptr [ebp - 0x19c], 0
40161b: jmp 0x40162c
40161d: mov eax, dword ptr [ebp - 0x490]
401623: sub eax, 2
401626: mov dword ptr [ebp - 0x19c], eax
40162c: cmp byte ptr [ebp - 0x160], 0x32
401633: jne 0x401641
401635: mov dword ptr [ebp - 0x1a0], 0
40163f: jmp 0x401652
401641: mov eax, dword ptr [ebp - 0x490]
401647: sub eax, 0x56ce
40164c: mov dword ptr [ebp - 0x1a0], eax
401652: cmp byte ptr [ebp - 0x165], 0x30
401659: jne 0x401667
40165b: mov dword ptr [ebp - 0x1a4], 0
401665: jmp 0x401676
401667: mov eax, dword ptr [ebp - 0x490]
40166d: sub eax, 3
401670: mov dword ptr [ebp - 0x1a4], eax
401676: cmp byte ptr [ebp - 0x162], 0x30
40167d: jne 0x40168b
40167f: mov dword ptr [ebp - 0x1a8], 0
401689: jmp 0x4016a0
40168b: mov eax, dword ptr [ebp - 0x490]
401691: shl eax, 3
401694: add eax, dword ptr [ebp - 0x490]
40169a: mov dword ptr [ebp - 0x1a8], eax
4016a0: cmp byte ptr [ebp - 0x15f], 0x38
4016a7: jne 0x4016b5
4016a9: mov dword ptr [ebp - 0x1ac], 0
4016b3: jmp 0x4016c4
4016b5: mov eax, dword ptr [ebp - 0x490]
4016bb: sub eax, 5
4016be: mov dword ptr [ebp - 0x1ac], eax
4016c4: add dword ptr [ebp - 0x494], 0x19
4016cb: jmp 0x401541
4016d0: lea eax, [ebp - 0x78]
4016d3: mov dword ptr [esp], eax
4016d6: call 0x401a16
4016db: mov dword ptr [ebp - 0xec], eax
4016e1: mov dword ptr [esp], 0x40410e
4016e8: call 0x401a16
4016ed: mov dword ptr [ebp - 0xec], eax
4016f3: mov dword ptr [esp], 0x404117
4016fa: call 0x401a16
4016ff: mov dword ptr [ebp - 0xec], eax
401705: mov dword ptr [ebp - 0x180], 0
40170f: cmp dword ptr [ebp - 0x180], 0xb
401716: jg 0x401722
401718: lea eax, [ebp - 0x180]
40171e: inc dword ptr [eax]
401720: jmp 0x40170f
401722: mov eax, dword ptr [ebp - 0x490]
401728: test eax, eax
40172a: jne 0x40178f
40172c: cmp dword ptr [ebp - 0x490], 0
401733: jne 0x40178f
401735: cmp dword ptr [ebp - 0x188], 0
40173c: jne 0x40178f
40173e: cmp dword ptr [ebp - 0x18c], 0
401745: jne 0x40178f
401747: cmp dword ptr [ebp - 0x190], 0
40174e: jne 0x40178f
401750: cmp dword ptr [ebp - 0x194], 0
401757: jne 0x40178f
401759: cmp dword ptr [ebp - 0x198], 0
401760: jne 0x40178f
401762: cmp dword ptr [ebp - 0x19c], 0
401769: jne 0x40178f
40176b: cmp dword ptr [ebp - 0x1a0], 0
401772: jne 0x40178f
401774: cmp dword ptr [ebp - 0x1a4], 0
40177b: jne 0x40178f
40177d: cmp dword ptr [ebp - 0x1a8], 0
401784: jne 0x40178f
401786: cmp dword ptr [ebp - 0x1ac], 0
40178d: jne 0x40178f
40178f: fldz 
401791: fstp qword ptr [ebp - 0x1b8]
401797: lea eax, [ebp - 0xe8]
40179d: mov dword ptr [esp], eax
4017a0: call 0x4028b0
4017a5: movsx ax, byte ptr [eax + ebp - 0xec]
4017ae: push ax
4017b0: fild word ptr [esp]
4017b3: lea esp, [esp + 2]
4017b7: fstp qword ptr [esp]
4017ba: call 0x4028e0
4017bf: fstp qword ptr [ebp - 0x1b8]
4017c5: mov dword ptr [ebp - 0x1bc], 0
4017cf: lea eax, [ebp - 0x1c4]
4017d5: mov dword ptr [esp + 0x10], eax
4017d9: lea eax, [ebp - 0x1c0]
4017df: mov dword ptr [esp + 0xc], eax
4017e3: mov dword ptr [esp + 8], 5
4017eb: fld qword ptr [ebp - 0x1b8]
4017f1: fstp qword ptr [esp]
4017f4: call 0x402790
4017f9: mov dword ptr [ebp - 0x1bc], eax
4017ff: lea eax, [ebp - 0xe8]
401805: mov dword ptr [esp], eax
401808: call 0x4028b0
40180d: mov dword ptr [ebp - 0x23c], eax
401813: cmp dword ptr [ebp - 0x23c], 9
40181a: jle 0x401826
40181c: mov dword ptr [ebp - 0x23c], 9
401826: mov dword ptr [ebp - 0x240], 0
401830: mov eax, dword ptr [ebp - 0x1bc]
401836: movsx edx, byte ptr [eax]
401839: mov eax, dword ptr [ebp - 0x1bc]
40183f: inc eax
401840: movsx eax, byte ptr [eax]
401843: add edx, eax
401845: mov eax, dword ptr [ebp - 0x1bc]
40184b: add eax, 2
40184e: movsx eax, byte ptr [eax]
401851: add edx, eax
401853: mov eax, dword ptr [ebp - 0x1bc]
401859: add eax, 3
40185c: movsx eax, byte ptr [eax]
40185f: add edx, eax
401861: mov eax, dword ptr [ebp - 0x1bc]
401867: add eax, 4
40186a: movsx eax, byte ptr [eax]
40186d: lea eax, [edx + eax]
401870: mov dword ptr [ebp - 0x240], eax
401876: mov eax, dword ptr [ebp - 0x240]
40187c: imul eax, eax, 0xb4
401882: mov dword ptr [ebp - 0x240], eax
401888: mov dword ptr [ebp - 0x244], 0
401892: mov edx, dword ptr [ebp - 0x240]
401898: mov eax, edx
40189a: add eax, eax
40189c: add eax, edx
40189e: shl eax, 2
4018a1: add eax, 0x10c
4018a6: mov dword ptr [ebp - 0x244], eax
4018ac: mov dword ptr [ebp - 0x2bc], 0
4018b6: cmp dword ptr [ebp - 0x2bc], 4
4018bd: jg 0x4018e9
4018bf: lea eax, [ebp - 8]
4018c2: add eax, dword ptr [ebp - 0x2bc]
4018c8: lea edx, [eax - 0x2b0]
4018ce: mov eax, dword ptr [ebp - 0x1bc]
4018d4: add eax, dword ptr [ebp - 0x2bc]
4018da: movzx eax, byte ptr [eax]
4018dd: mov byte ptr [edx], al
4018df: lea eax, [ebp - 0x2bc]
4018e5: inc dword ptr [eax]
4018e7: jmp 0x4018b6
4018e9: mov dword ptr [esp + 8], 0xa
4018f1: lea eax, [ebp - 0x338]
4018f7: mov dword ptr [esp + 4], eax
4018fb: mov eax, dword ptr [ebp - 0x240]
401901: mov dword ptr [esp], eax
401904: call 0x402780
401909: mov dword ptr [esp + 8], 0xa
401911: lea eax, [ebp - 0x3a8]
401917: mov dword ptr [esp + 4], eax
40191b: mov eax, dword ptr [ebp - 0x244]
401921: mov dword ptr [esp], eax
401924: call 0x402780
401929: mov eax, dword ptr [ebp - 0x1bc]
40192f: mov dword ptr [esp + 4], eax
401933: lea eax, [ebp - 0x418]
401939: mov dword ptr [esp], eax
40193c: call 0x402870
401941: lea eax, [ebp - 0x338]
401947: mov dword ptr [esp + 4], eax
40194b: lea eax, [ebp - 0x418]
401951: mov dword ptr [esp], eax
401954: call 0x402870
401959: lea eax, [ebp - 0x3a8]
40195f: mov dword ptr [esp + 4], eax
401963: lea eax, [ebp - 0x418]
401969: mov dword ptr [esp], eax
40196c: call 0x402870
401971: mov dword ptr [esp], 0x404120
401978: call 0x4028d0
40197d: mov dword ptr [esp], 0x4040e7
401984: call 0x4028d0
401989: lea eax, [ebp - 0x488]
40198f: mov dword ptr [esp], eax
401992: call 0x4028c0
401997: lea eax, [ebp - 0x488]
40199d: lea edx, [ebp - 0x418]
4019a3: mov dword ptr [esp + 4], eax
4019a7: mov dword ptr [esp], edx
4019aa: call 0x402860
4019af: test eax, eax
4019b1: jne 0x4019bd
4019b3: mov dword ptr [ebp - 0x184], 0
4019bd: mov eax, dword ptr [ebp - 0x184]
4019c3: test eax, eax
4019c5: je 0x4019c9
4019c7: jmp 0x4019d7
4019c9: mov dword ptr [esp], 0x40414c
4019d0: call 0x4028d0
4019d5: jmp 0x4019eb
4019d7: mov dword ptr [esp + 4], 7
4019df: mov dword ptr [esp], 0x40416f
4019e6: call 0x4028d0
4019eb: mov dword ptr [esp], 0x404189
4019f2: call 0x4028d0
4019f7: mov dword ptr [esp], 0x404108
4019fe: call 0x402880
401a03: mov dword ptr [ebp - 0x48c], 0
401a0d: mov eax, dword ptr [ebp - 0x48c]
401a13: leave 
401a14: ret 
401a15: nop 
401a16: push ebp
401a17: mov ebp, esp
401a19: push ebx
401a1a: mov eax, 0x1664
401a1f: call 0x402700
401a24: mov dword ptr [ebp - 0xfbc], 0x3e8
401a2e: mov dword ptr [ebp - 0xfc4], 0
401a38: mov dword ptr [ebp - 0xfd0], 0
401a42: mov eax, dword ptr [ebp + 8]
401a45: mov dword ptr [esp], eax
401a48: call 0x4028b0
401a4d: mov dword ptr [ebp - 0x12b4], eax
401a53: cmp dword ptr [ebp - 0x12b4], 0
401a5a: jle 0x401a6a
401a5c: cmp dword ptr [ebp - 0x12b4], 0x104
401a66: jg 0x401a6a
401a68: jmp 0x401a79
401a6a: mov dword ptr [ebp - 0x164c], 0x278
401a74: jmp 0x4022aa
401a79: mov dword ptr [ebp - 0x12b8], 0
401a83: mov eax, dword ptr [ebp - 0x12b8]
401a89: cmp eax, dword ptr [ebp - 0x12b4]
401a8f: jge 0x401ac0
401a91: lea eax, [ebp - 8]
401a94: add eax, dword ptr [ebp - 0x12b8]
401a9a: lea ebx, [eax - 0x11f0]
401aa0: mov eax, dword ptr [ebp + 8]
401aa3: add eax, dword ptr [ebp - 0x12b8]
401aa9: movsx eax, byte ptr [eax]
401aac: mov dword ptr [esp], eax
401aaf: call 0x402840
401ab4: mov byte ptr [ebx], al
401ab6: lea eax, [ebp - 0x12b8]
401abc: inc dword ptr [eax]
401abe: jmp 0x401a83
401ac0: lea eax, [ebp - 8]
401ac3: add eax, dword ptr [ebp - 0x12b4]
401ac9: sub eax, 0x11f0
401ace: mov byte ptr [eax], 0
401ad1: mov dword ptr [ebp - 0x12a8], 0x94
401adb: lea eax, [ebp - 0x12a8]
401ae1: mov dword ptr [esp], eax
401ae4: call 0x402960
401ae9: sub esp, 4
401aec: mov dword ptr [ebp - 0xc], eax
401aef: cmp dword ptr [ebp - 0xc], 0
401af3: jne 0x401b04
401af5: mov dword ptr [ebp - 0x164c], 0x25e
401aff: jmp 0x4022aa
401b04: cmp dword ptr [ebp - 0x1298], 2
401b0b: je 0x401b25
401b0d: cmp dword ptr [ebp - 0x1298], 1
401b14: je 0x401b25
401b16: mov dword ptr [ebp - 0x164c], 0x25f
401b20: jmp 0x4022aa
401b25: cmp dword ptr [ebp - 0x1298], 2
401b2c: jne 0x401e50
401b32: mov dword ptr [esp], 0x40418c
401b39: call 0x402970
401b3e: sub esp, 4
401b41: mov dword ptr [ebp - 0x12ac], eax
401b47: cmp dword ptr [ebp - 0x12ac], 0
401b4e: jne 0x401b5f
401b50: mov dword ptr [ebp - 0x164c], 0x25d
401b5a: jmp 0x4022aa
401b5f: mov dword ptr [esp + 4], 0x404196
401b67: mov eax, dword ptr [ebp - 0x12ac]
401b6d: mov dword ptr [esp], eax
401b70: call 0x402980
401b75: sub esp, 8
401b78: mov dword ptr [ebp - 0x162c], eax
401b7e: mov dword ptr [esp + 4], 0x4041a4
401b86: mov eax, dword ptr [ebp - 0x12ac]
401b8c: mov dword ptr [esp], eax
401b8f: call 0x402980
401b94: sub esp, 8
401b97: mov dword ptr [ebp - 0x1630], eax
401b9d: mov dword ptr [esp + 4], 0x4041b7
401ba5: mov eax, dword ptr [ebp - 0x12ac]
401bab: mov dword ptr [esp], eax
401bae: call 0x402980
401bb3: sub esp, 8
401bb6: mov dword ptr [ebp - 0x1634], eax
401bbc: cmp dword ptr [ebp - 0x162c], 0
401bc3: je 0x401bd7
401bc5: cmp dword ptr [ebp - 0x1630], 0
401bcc: je 0x401bd7
401bce: cmp dword ptr [ebp - 0x1634], 0
401bd5: jne 0x401bf7
401bd7: mov eax, dword ptr [ebp - 0x12ac]
401bdd: mov dword ptr [esp], eax
401be0: call 0x402990
401be5: sub esp, 4
401be8: mov dword ptr [ebp - 0x164c], 0x2bc
401bf2: jmp 0x4022aa
401bf7: lea eax, [ebp - 0xfc8]
401bfd: mov dword ptr [esp + 8], eax
401c01: mov eax, dword ptr [ebp - 0xfbc]
401c07: mov dword ptr [esp + 4], eax
401c0b: lea eax, [ebp - 0xfb8]
401c11: mov dword ptr [esp], eax
401c14: mov eax, dword ptr [ebp - 0x162c]
401c1a: call eax
401c1c: sub esp, 0xc
401c1f: mov dword ptr [ebp - 0xc], eax
401c22: cmp dword ptr [ebp - 0xc], 0
401c26: jne 0x401c48
401c28: mov eax, dword ptr [ebp - 0x12ac]
401c2e: mov dword ptr [esp], eax
401c31: call 0x402990
401c36: sub esp, 4
401c39: mov dword ptr [ebp - 0x164c], 0x2bd
401c43: jmp 0x4022aa
401c48: mov eax, dword ptr [ebp - 0xfc8]
401c4e: shr eax, 2
401c51: mov dword ptr [ebp - 0xfc0], eax
401c57: mov dword ptr [ebp - 0xfcc], 0
401c61: mov eax, dword ptr [ebp - 0xfcc]
401c67: cmp eax, dword ptr [ebp - 0xfc0]
401c6d: jae 0x401e50
401c73: mov dword ptr [esp + 4], 0x4041ca
401c7b: lea eax, [ebp - 0x10e8]
401c81: mov dword ptr [esp], eax
401c84: call 0x402830
401c89: mov eax, dword ptr [ebp - 0xfcc]
401c8f: mov eax, dword ptr [ebp + eax*4 - 0xfb8]
401c96: mov dword ptr [esp + 8], eax
401c9a: mov dword ptr [esp + 4], 0
401ca2: mov dword ptr [esp], 0x410
401ca9: call 0x4029a0
401cae: sub esp, 0xc
401cb1: mov dword ptr [ebp - 0x11fc], eax
401cb7: cmp dword ptr [ebp - 0x11fc], 0
401cbe: je 0x401d2a
401cc0: lea eax, [ebp - 0xfc8]
401cc6: mov dword ptr [esp + 0xc], eax
401cca: mov dword ptr [esp + 8], 4
401cd2: lea eax, [ebp - 0x12bc]
401cd8: mov dword ptr [esp + 4], eax
401cdc: mov eax, dword ptr [ebp - 0x11fc]
401ce2: mov dword ptr [esp], eax
401ce5: mov eax, dword ptr [ebp - 0x1630]
401ceb: call eax
401ced: sub esp, 0x10
401cf0: test eax, eax
401cf2: je 0x401d2a
401cf4: mov dword ptr [esp + 0xc], 0x104
401cfc: lea eax, [ebp - 0x10e8]
401d02: mov dword ptr [esp + 8], eax
401d06: mov eax, dword ptr [ebp - 0x12bc]
401d0c: mov dword ptr [esp + 4], eax
401d10: mov eax, dword ptr [ebp - 0x11fc]
401d16: mov dword ptr [esp], eax
401d19: mov eax, dword ptr [ebp - 0x1634]
401d1f: call eax
401d21: sub esp, 0x10
401d24: mov dword ptr [ebp - 0x12b0], eax
401d2a: mov eax, dword ptr [ebp - 0x11fc]
401d30: mov dword ptr [esp], eax
401d33: call 0x4029b0
401d38: sub esp, 4
401d3b: lea ebx, [ebp - 0x11f8]
401d41: lea eax, [ebp - 0x10e8]
401d47: mov dword ptr [esp], eax
401d4a: call 0x402820
401d4f: mov dword ptr [esp + 4], ebx
401d53: mov dword ptr [esp], eax
401d56: call 0x402860
401d5b: test eax, eax
401d5d: jne 0x401e43
401d63: mov dword ptr [ebp - 0xfd0], 1
401d6d: mov eax, dword ptr [ebp - 0xfcc]
401d73: mov eax, dword ptr [ebp + eax*4 - 0xfb8]
401d7a: mov dword ptr [esp + 8], eax
401d7e: mov dword ptr [esp + 4], 0
401d86: mov dword ptr [esp], 1
401d8d: call 0x4029a0
401d92: sub esp, 0xc
401d95: mov dword ptr [ebp - 0x11fc], eax
401d9b: cmp dword ptr [ebp - 0x11fc], 0
401da2: je 0x401e23
401da4: mov dword ptr [esp + 4], 0
401dac: mov eax, dword ptr [ebp - 0x11fc]
401db2: mov dword ptr [esp], eax
401db5: call 0x4029c0
401dba: sub esp, 8
401dbd: test eax, eax
401dbf: je 0x401df2
401dc1: mov eax, dword ptr [ebp - 0x11fc]
401dc7: mov dword ptr [esp], eax
401dca: call 0x4029b0
401dcf: sub esp, 4
401dd2: mov eax, dword ptr [ebp - 0x12ac]
401dd8: mov dword ptr [esp], eax
401ddb: call 0x402990
401de0: sub esp, 4
401de3: mov dword ptr [ebp - 0x164c], 0
401ded: jmp 0x4022aa
401df2: mov eax, dword ptr [ebp - 0x11fc]
401df8: mov dword ptr [esp], eax
401dfb: call 0x4029b0
401e00: sub esp, 4
401e03: mov eax, dword ptr [ebp - 0x12ac]
401e09: mov dword ptr [esp], eax
401e0c: call 0x402990
401e11: sub esp, 4
401e14: mov dword ptr [ebp - 0x164c], 0x25a
401e1e: jmp 0x4022aa
401e23: mov eax, dword ptr [ebp - 0x12ac]
401e29: mov dword ptr [esp], eax
401e2c: call 0x402990
401e31: sub esp, 4
401e34: mov dword ptr [ebp - 0x164c], 0x25c
401e3e: jmp 0x4022aa
401e43: lea eax, [ebp - 0xfcc]
401e49: inc dword ptr [eax]
401e4b: jmp 0x401c61
401e50: cmp dword ptr [ebp - 0x1298], 1
401e57: jne 0x402269
401e5d: mov dword ptr [esp], 0x4041d2
401e64: call 0x402970
401e69: sub esp, 4
401e6c: mov dword ptr [ebp - 0x12ac], eax
401e72: cmp dword ptr [ebp - 0x12ac], 0
401e79: jne 0x401e8a
401e7b: mov dword ptr [ebp - 0x164c], 0x2be
401e85: jmp 0x4022aa
401e8a: mov dword ptr [esp + 4], 0x4041df
401e92: mov eax, dword ptr [ebp - 0x12ac]
401e98: mov dword ptr [esp], eax
401e9b: call 0x402980
401ea0: sub esp, 8
401ea3: mov dword ptr [ebp - 0x1638], eax
401ea9: mov dword ptr [esp + 4], 0x4041f8
401eb1: mov eax, dword ptr [ebp - 0x12ac]
401eb7: mov dword ptr [esp], eax
401eba: call 0x402980
401ebf: sub esp, 8
401ec2: mov dword ptr [ebp - 0x163c], eax
401ec8: mov dword ptr [esp + 4], 0x404207
401ed0: mov eax, dword ptr [ebp - 0x12ac]
401ed6: mov dword ptr [esp], eax
401ed9: call 0x402980
401ede: sub esp, 8
401ee1: mov dword ptr [ebp - 0x1640], eax
401ee7: mov dword ptr [esp + 4], 0x404215
401eef: mov eax, dword ptr [ebp - 0x12ac]
401ef5: mov dword ptr [esp], eax
401ef8: call 0x402980
401efd: sub esp, 8
401f00: mov dword ptr [ebp - 0x1644], eax
401f06: mov dword ptr [esp + 4], 0x404223
401f0e: mov eax, dword ptr [ebp - 0x12ac]
401f14: mov dword ptr [esp], eax
401f17: call 0x402980
401f1c: sub esp, 8
401f1f: mov dword ptr [ebp - 0x1648], eax
401f25: cmp dword ptr [ebp - 0x1640], 0
401f2c: je 0x401f52
401f2e: cmp dword ptr [ebp - 0x163c], 0
401f35: je 0x401f52
401f37: cmp dword ptr [ebp - 0x1648], 0
401f3e: je 0x401f52
401f40: cmp dword ptr [ebp - 0x1644], 0
401f47: je 0x401f52
401f49: cmp dword ptr [ebp - 0x1638], 0
401f50: jne 0x401f72
401f52: mov eax, dword ptr [ebp - 0x12ac]
401f58: mov dword ptr [esp], eax
401f5b: call 0x402990
401f60: sub esp, 4
401f63: mov dword ptr [ebp - 0x164c], 0x2bf
401f6d: jmp 0x4022aa
401f72: mov dword ptr [esp + 4], 0
401f7a: mov dword ptr [esp], 2
401f81: mov eax, dword ptr [ebp - 0x1638]
401f87: call eax
401f89: sub esp, 8
401f8c: mov dword ptr [ebp - 0x1200], eax
401f92: cmp dword ptr [ebp - 0x1200], -1
401f99: jne 0x401fbb
401f9b: mov eax, dword ptr [ebp - 0x12ac]
401fa1: mov dword ptr [esp], eax
401fa4: call 0x402990
401fa9: sub esp, 4
401fac: mov dword ptr [ebp - 0x164c], 0x2c0
401fb6: jmp 0x4022aa
401fbb: mov dword ptr [ebp - 0x13f8], 0x128
401fc5: lea eax, [ebp - 0x13f8]
401fcb: mov dword ptr [esp + 4], eax
401fcf: mov eax, dword ptr [ebp - 0x1200]
401fd5: mov dword ptr [esp], eax
401fd8: mov eax, dword ptr [ebp - 0x163c]
401fde: call eax
401fe0: sub esp, 8
401fe3: mov dword ptr [ebp - 0xc], eax
401fe6: cmp dword ptr [ebp - 0xc], 0
401fea: je 0x402258
401ff0: mov eax, dword ptr [ebp - 0x13f0]
401ff6: mov dword ptr [esp + 4], eax
401ffa: mov dword ptr [esp], 8
402001: mov eax, dword ptr [ebp - 0x1638]
402007: call eax
402009: sub esp, 8
40200c: mov dword ptr [ebp - 0x1204], eax
402012: cmp dword ptr [ebp - 0x1204], -1
402019: jne 0x40204c
40201b: mov eax, dword ptr [ebp - 0x1200]
402021: mov dword ptr [esp], eax
402024: call 0x4029b0
402029: sub esp, 4
40202c: mov eax, dword ptr [ebp - 0x12ac]
402032: mov dword ptr [esp], eax
402035: call 0x402990
40203a: sub esp, 4
40203d: mov dword ptr [ebp - 0x164c], 0x2c0
402047: jmp 0x4022aa
40204c: mov dword ptr [ebp - 0x1628], 0x224
402056: lea eax, [ebp - 0x1628]
40205c: mov dword ptr [esp + 4], eax
402060: mov eax, dword ptr [ebp - 0x1204]
402066: mov dword ptr [esp], eax
402069: mov eax, dword ptr [ebp - 0x1644]
40206f: call eax
402071: sub esp, 8
402074: mov dword ptr [ebp - 0x10], eax
402077: cmp dword ptr [ebp - 0x10], 0
40207b: je 0x402217
402081: lea edx, [ebp - 0x11f8]
402087: lea eax, [ebp - 0x1628]
40208d: add eax, 0x20
402090: mov dword ptr [esp + 4], edx
402094: mov dword ptr [esp], eax
402097: call 0x402860
40209c: test eax, eax
40209e: jne 0x4021e7
4020a4: mov dword ptr [ebp - 0xfd0], 1
4020ae: mov eax, dword ptr [ebp - 0x13f0]
4020b4: mov dword ptr [esp + 8], eax
4020b8: mov dword ptr [esp + 4], 0
4020c0: mov dword ptr [esp], 1
4020c7: call 0x4029a0
4020cc: sub esp, 0xc
4020cf: mov dword ptr [ebp - 0x11fc], eax
4020d5: cmp dword ptr [ebp - 0x11fc], 0
4020dc: je 0x4021a5
4020e2: mov dword ptr [esp + 4], 0
4020ea: mov eax, dword ptr [ebp - 0x11fc]
4020f0: mov dword ptr [esp], eax
4020f3: call 0x4029c0
4020f8: sub esp, 8
4020fb: test eax, eax
4020fd: je 0x402152
4020ff: mov eax, dword ptr [ebp - 0x1204]
402105: mov dword ptr [esp], eax
402108: call 0x4029b0
40210d: sub esp, 4
402110: mov eax, dword ptr [ebp - 0x1200]
402116: mov dword ptr [esp], eax
402119: call 0x4029b0
40211e: sub esp, 4
402121: mov eax, dword ptr [ebp - 0x11fc]
402127: mov dword ptr [esp], eax
40212a: call 0x4029b0
40212f: sub esp, 4
402132: mov eax, dword ptr [ebp - 0x12ac]
402138: mov dword ptr [esp], eax
40213b: call 0x402990
402140: sub esp, 4
402143: mov dword ptr [ebp - 0x164c], 0
40214d: jmp 0x4022aa
402152: mov eax, dword ptr [ebp - 0x1204]
402158: mov dword ptr [esp], eax
40215b: call 0x4029b0
402160: sub esp, 4
402163: mov eax, dword ptr [ebp - 0x1200]
402169: mov dword ptr [esp], eax
40216c: call 0x4029b0
402171: sub esp, 4
402174: mov eax, dword ptr [ebp - 0x11fc]
40217a: mov dword ptr [esp], eax
40217d: call 0x4029b0
402182: sub esp, 4
402185: mov eax, dword ptr [ebp - 0x12ac]
40218b: mov dword ptr [esp], eax
40218e: call 0x402990
402193: sub esp, 4
402196: mov dword ptr [ebp - 0x164c], 0x25a
4021a0: jmp 0x4022aa
4021a5: mov eax, dword ptr [ebp - 0x1204]
4021ab: mov dword ptr [esp], eax
4021ae: call 0x4029b0
4021b3: sub esp, 4
4021b6: mov eax, dword ptr [ebp - 0x1200]
4021bc: mov dword ptr [esp], eax
4021bf: call 0x4029b0
4021c4: sub esp, 4
4021c7: mov eax, dword ptr [ebp - 0x12ac]
4021cd: mov dword ptr [esp], eax
4021d0: call 0x402990
4021d5: sub esp, 4
4021d8: mov dword ptr [ebp - 0x164c], 0x25c
4021e2: jmp 0x4022aa
4021e7: mov dword ptr [ebp - 0x1628], 0x224
4021f1: lea eax, [ebp - 0x1628]
4021f7: mov dword ptr [esp + 4], eax
4021fb: mov eax, dword ptr [ebp - 0x1204]
402201: mov dword ptr [esp], eax
402204: mov eax, dword ptr [ebp - 0x1648]
40220a: call eax
40220c: sub esp, 8
40220f: mov dword ptr [ebp - 0x10], eax
402212: jmp 0x402077
402217: mov eax, dword ptr [ebp - 0x1204]
40221d: mov dword ptr [esp], eax
402220: call 0x4029b0
402225: sub esp, 4
402228: mov dword ptr [ebp - 0x13f8], 0x128
402232: lea eax, [ebp - 0x13f8]
402238: mov dword ptr [esp + 4], eax
40223c: mov eax, dword ptr [ebp - 0x1200]
402242: mov dword ptr [esp], eax
402245: mov eax, dword ptr [ebp - 0x1640]
40224b: call eax
40224d: sub esp, 8
402250: mov dword ptr [ebp - 0xc], eax
402253: jmp 0x401fe6
402258: mov eax, dword ptr [ebp - 0x1200]
40225e: mov dword ptr [esp], eax
402261: call 0x4029b0
402266: sub esp, 4
402269: cmp dword ptr [ebp - 0xfd0], 0
402270: jne 0x40228f
402272: mov eax, dword ptr [ebp - 0x12ac]
402278: mov dword ptr [esp], eax
40227b: call 0x402990
402280: sub esp, 4
402283: mov dword ptr [ebp - 0x164c], 0x25b
40228d: jmp 0x4022aa
40228f: mov eax, dword ptr [ebp - 0x12ac]
402295: mov dword ptr [esp], eax
402298: call 0x402990
40229d: sub esp, 4
4022a0: mov dword ptr [ebp - 0x164c], 0
4022aa: mov eax, dword ptr [ebp - 0x164c]
4022b0: mov ebx, dword ptr [ebp - 4]
4022b3: leave 
4022b4: ret 
4022b5: nop 
4022b6: nop 
4022b7: nop 
4022b8: nop 
4022b9: nop 
4022ba: nop 
4022bb: nop 
4022bc: nop 
4022bd: nop 
4022be: nop 
4022bf: nop 
4022c0: push ebp
4022c1: mov ecx, 0x404310
4022c6: mov ebp, esp
4022c8: jmp 0x4022de
4022ca: lea esi, [esi]
4022d0: mov edx, dword ptr [ecx + 4]
4022d3: mov eax, dword ptr [ecx]
4022d5: add ecx, 8
4022d8: add dword ptr [edx + 0x400000], eax
4022de: cmp ecx, 0x404310
4022e4: jb 0x4022d0
4022e6: pop ebp
4022e7: ret 
4022e8: nop 
4022e9: nop 
4022ea: nop 
4022eb: nop 
4022ec: nop 
4022ed: nop 
4022ee: nop 
4022ef: nop 
4022f0: push ebp
4022f1: mov ebp, esp
4022f3: fninit 
4022f5: pop ebp
4022f6: ret 
4022f7: nop 
4022f8: nop 
4022f9: nop 
4022fa: nop 
4022fb: nop 
4022fc: nop 
4022fd: nop 
4022fe: nop 
4022ff: nop 
402300: push ebp
402301: mov ebp, esp
402303: sub esp, 8
402306: mov eax, dword ptr [0x403030]
40230b: mov ecx, dword ptr [eax]
40230d: test ecx, ecx
40230f: je 0x402337
402311: jmp 0x402320
402313: nop 
402314: nop 
402315: nop 
402316: nop 
402317: nop 
402318: nop 
402319: nop 
40231a: nop 
40231b: nop 
40231c: nop 
40231d: nop 
40231e: nop 
40231f: nop 
402320: call dword ptr [eax]
402322: mov ecx, dword ptr [0x403030]
402328: mov edx, dword ptr [ecx + 4]
40232b: lea eax, [ecx + 4]
40232e: mov dword ptr [0x403030], eax
402333: test edx, edx
402335: jne 0x402320
402337: leave 
402338: ret 
402339: lea esi, [esi]
402340: push ebp
402341: mov ebp, esp
402343: push ebx
402344: sub esp, 4
402347: mov eax, dword ptr [0x402a10]
40234c: cmp eax, -1
40234f: je 0x40237a
402351: test eax, eax
402353: mov ebx, eax
402355: je 0x40236a
402357: mov esi, esi
402359: lea edi, [edi]
402360: call dword ptr [ebx*4 + 0x402a10]
402367: dec ebx
402368: jne 0x402360
40236a: mov dword ptr [esp], 0x402300
402371: call 0x401040
402376: pop ebx
402377: pop ebx
402378: pop ebp
402379: ret 
40237a: mov ecx, dword ptr [0x402a14]
402380: xor eax, eax
402382: test ecx, ecx
402384: jmp 0x402390
402386: inc eax
402387: mov edx, dword ptr [eax*4 + 0x402a14]
40238e: test edx, edx
402390: jne 0x402386
402392: jmp 0x402351
402394: lea esi, [esi]
40239a: lea edi, [edi]
4023a0: push ebp
4023a1: mov ebp, esp
4023a3: push ebx
4023a4: sub esp, 4
4023a7: mov eax, dword ptr [0x405010]
4023ac: test eax, eax
4023ae: jne 0x4023e6
4023b0: mov eax, dword ptr [0x402a10]
4023b5: mov ebx, 1
4023ba: mov dword ptr [0x405010], ebx
4023c0: cmp eax, -1
4023c3: je 0x4023ea
4023c5: test eax, eax
4023c7: mov ebx, eax
4023c9: je 0x4023da
4023cb: nop 
4023cc: lea esi, [esi]
4023d0: call dword ptr [ebx*4 + 0x402a10]
4023d7: dec ebx
4023d8: jne 0x4023d0
4023da: mov dword ptr [esp], 0x402300
4023e1: call 0x401040
4023e6: pop ebx
4023e7: pop ebx
4023e8: pop ebp
4023e9: ret 
4023ea: mov ecx, dword ptr [0x402a14]
4023f0: xor eax, eax
4023f2: test ecx, ecx
4023f4: jmp 0x402400
4023f6: inc eax
4023f7: mov edx, dword ptr [eax*4 + 0x402a14]
4023fe: test edx, edx
402400: jne 0x4023f6
402402: jmp 0x4023c5
402404: nop 
402405: nop 
402406: nop 
402407: nop 
402408: nop 
402409: nop 
40240a: nop 
40240b: nop 
40240c: nop 
40240d: nop 
40240e: nop 
40240f: nop 
402410: push ebp
402411: mov eax, dword ptr [0x405060]
402416: mov ebp, esp
402418: pop ebp
402419: mov ecx, dword ptr [eax + 4]
40241c: jmp ecx
40241e: mov esi, esi
402420: push ebp
402421: mov edx, 0x42
402426: mov ebp, esp
402428: push ebx
402429: movzx eax, ax
40242c: sub esp, 0x64
40242f: mov dword ptr [esp + 8], edx
402433: lea edx, [ebp - 0x58]
402436: xor ebx, ebx
402438: mov dword ptr [esp + 4], edx
40243c: mov dword ptr [esp], eax
40243f: call dword ptr [0x40612c]
402445: mov edx, 0x1f
40244a: mov ecx, 1
40244f: sub esp, 0xc
402452: test eax, eax
402454: jne 0x40245d
402456: jmp 0x40249e
402458: add ecx, ecx
40245a: dec edx
40245b: js 0x40246b
40245d: cmp byte ptr [edx + ebp - 0x58], 0x41
402462: jne 0x402458
402464: or ebx, ecx
402466: add ecx, ecx
402468: dec edx
402469: jns 0x40245d
40246b: cmp dword ptr [ebx], 0x3c
40246e: jne 0x402477
402470: mov eax, ebx
402472: mov ebx, dword ptr [ebp - 4]
402475: leave 
402476: ret 
402477: mov ecx, 0x404254
40247c: mov edx, 0xea
402481: mov dword ptr [esp + 0xc], ecx
402485: mov dword ptr [esp + 8], edx
402489: mov dword ptr [esp], 0x404281
402490: mov eax, 0x4042a0
402495: mov dword ptr [esp + 4], eax
402499: call 0x402730
40249e: mov eax, 0x4042cc
4024a3: mov ebx, 0xe4
4024a8: mov dword ptr [esp + 0xc], eax
4024ac: mov dword ptr [esp + 8], ebx
4024b0: jmp 0x402489
4024b2: lea esi, [esi]
4024b9: lea edi, [edi]
4024c0: push ebp
4024c1: mov ebp, esp
4024c3: push edi
4024c4: push esi
4024c5: push ebx
4024c6: sub esp, 0xcc
4024cc: mov ecx, dword ptr [0x405060]
4024d2: test ecx, ecx
4024d4: je 0x4024de
4024d6: lea esp, [ebp - 0xc]
4024d9: pop ebx
4024da: pop esi
4024db: pop edi
4024dc: pop ebp
4024dd: ret 
4024de: mov dword ptr [ebp - 0x68], 0x41414141
4024e5: mov eax, dword ptr [0x404230]
4024ea: lea esi, [ebp - 0x68]
4024ed: mov dword ptr [ebp - 0x64], 0x41414141
4024f4: mov dword ptr [ebp - 0x60], 0x41414141
4024fb: mov dword ptr [ebp - 0x48], eax
4024fe: mov eax, dword ptr [0x404234]
402503: mov dword ptr [ebp - 0x5c], 0x41414141
40250a: mov dword ptr [ebp - 0x58], 0x41414141
402511: mov dword ptr [ebp - 0x44], eax
402514: mov eax, dword ptr [0x404238]
402519: mov dword ptr [ebp - 0x54], 0x41414141
402520: mov dword ptr [ebp - 0x50], 0x41414141
402527: mov dword ptr [ebp - 0x40], eax
40252a: mov eax, dword ptr [0x40423c]
40252f: mov dword ptr [ebp - 0x4c], 0x41414141
402536: mov dword ptr [ebp - 0x3c], eax
402539: mov eax, dword ptr [0x404240]
40253e: mov dword ptr [ebp - 0x38], eax
402541: mov eax, dword ptr [0x404244]
402546: mov dword ptr [ebp - 0x34], eax
402549: mov eax, dword ptr [0x404248]
40254e: mov dword ptr [ebp - 0x30], eax
402551: mov eax, dword ptr [0x40424c]
402556: mov dword ptr [ebp - 0x2c], eax
402559: movzx eax, word ptr [0x404250]
402560: mov word ptr [ebp - 0x28], ax
402564: mov dword ptr [esp], esi
402567: call dword ptr [0x406124]
40256d: movzx eax, ax
402570: sub esp, 4
402573: test eax, eax
402575: mov dword ptr [ebp - 0xbc], eax
40257b: jne 0x4026bc
402581: mov dword ptr [esp], 0x3c
402588: call 0x402900
40258d: test eax, eax
40258f: mov ebx, eax
402591: je 0x4026f0
402597: cld 
402598: mov edi, eax
40259a: mov eax, dword ptr [ebp - 0xbc]
4025a0: mov ecx, 0xf
4025a5: rep stosd dword ptr es:[edi], eax
4025a7: mov dword ptr [ebx + 4], 0x402910
4025ae: mov ecx, 1
4025b3: mov dword ptr [ebx + 8], 0x402410
4025ba: mov eax, dword ptr [0x405030]
4025bf: mov dword ptr [ebx], 0x3c
4025c5: mov edx, dword ptr [0x405034]
4025cb: mov dword ptr [ebx + 0x28], 0
4025d2: mov dword ptr [ebx + 0x14], eax
4025d5: mov eax, dword ptr [0x403040]
4025da: mov dword ptr [ebx + 0x18], edx
4025dd: mov edx, dword ptr [0x403044]
4025e3: mov dword ptr [ebx + 0x1c], eax
4025e6: mov eax, dword ptr [0x405040]
4025eb: mov dword ptr [ebx + 0x20], edx
4025ee: mov dword ptr [ebx + 0x30], 0xffffffff
4025f5: mov dword ptr [ebx + 0x2c], eax
4025f8: mov edx, dword ptr [0x40304c]
4025fe: mov eax, dword ptr [0x403048]
402603: mov dword ptr [ebx + 0x38], edx
402606: mov edx, 0x1f
40260b: mov dword ptr [ebx + 0x34], eax
40260e: mov esi, esi
402610: mov eax, ebx
402612: and eax, ecx
402614: cmp eax, 1
402617: sbb eax, eax
402619: and al, 0x20
40261b: add ecx, ecx
40261d: add al, 0x41
40261f: mov byte ptr [edx + ebp - 0xb8], al
402626: dec edx
402627: jns 0x402610
402629: mov eax, dword ptr [0x404230]
40262e: mov dword ptr [ebp - 0x98], eax
402634: mov eax, dword ptr [0x404234]
402639: mov dword ptr [ebp - 0x94], eax
40263f: mov eax, dword ptr [0x404238]
402644: mov dword ptr [ebp - 0x90], eax
40264a: mov eax, dword ptr [0x40423c]
40264f: mov dword ptr [ebp - 0x8c], eax
402655: mov eax, dword ptr [0x404240]
40265a: mov dword ptr [ebp - 0x88], eax
402660: mov eax, dword ptr [0x404244]
402665: mov dword ptr [ebp - 0x84], eax
40266b: mov eax, dword ptr [0x404248]
402670: mov dword ptr [ebp - 0x80], eax
402673: mov eax, dword ptr [0x40424c]
402678: mov dword ptr [ebp - 0x7c], eax
40267b: movzx eax, word ptr [0x404250]
402682: mov word ptr [ebp - 0x78], ax
402686: lea eax, [ebp - 0xb8]
40268c: mov dword ptr [esp], eax
40268f: call dword ptr [0x406118]
402695: movzx edi, ax
402698: sub esp, 4
40269b: test edi, edi
40269d: jne 0x4026e1
40269f: xor edx, edx
4026a1: test edx, edx
4026a3: jne 0x4026c3
4026a5: mov dword ptr [esp], ebx
4026a8: call 0x4028f0
4026ad: mov dword ptr [esp], esi
4026b0: call dword ptr [0x406124]
4026b6: sub esp, 4
4026b9: movzx eax, ax
4026bc: call 0x402420
4026c1: mov ebx, eax
4026c3: mov dword ptr [0x405060], ebx
4026c9: lea eax, [ebx + 4]
4026cc: mov dword ptr [0x405050], eax
4026d1: lea eax, [ebx + 8]
4026d4: mov dword ptr [0x405070], eax
4026d9: lea esp, [ebp - 0xc]
4026dc: pop ebx
4026dd: pop esi
4026de: pop edi
4026df: pop ebp
4026e0: ret 
4026e1: mov eax, edi
4026e3: call 0x402420
4026e8: cmp eax, ebx
4026ea: mov edx, edi
4026ec: jne 0x40269f
4026ee: jmp 0x4026a1
4026f0: call 0x402910
4026f5: nop 
4026f6: nop 
4026f7: nop 
4026f8: nop 
4026f9: nop 
4026fa: nop 
4026fb: nop 
4026fc: nop 
4026fd: nop 
4026fe: nop 
4026ff: nop 
402700: push ecx
402701: mov ecx, esp
402703: add ecx, 8
402706: cmp eax, 0x1000
40270b: jb 0x40271d
40270d: sub ecx, 0x1000
402713: or dword ptr [ecx], 0
402716: sub eax, 0x1000
40271b: jmp 0x402706
40271d: sub ecx, eax
40271f: or dword ptr [ecx], 0
402722: mov eax, esp
402724: mov esp, ecx
402726: mov ecx, dword ptr [eax]
402728: mov eax, dword ptr [eax + 4]
40272b: jmp eax
40272d: nop 
40272e: nop 
40272f: nop 
402730: push ebp
402731: mov ebp, esp
402733: sub esp, 0x18
402736: mov eax, dword ptr [ebp + 0x14]
402739: mov dword ptr [esp + 0x10], eax
40273d: mov eax, dword ptr [ebp + 0x10]
402740: mov dword ptr [esp + 0xc], eax
402744: mov eax, dword ptr [ebp + 0xc]
402747: mov dword ptr [esp + 8], eax
40274b: mov eax, dword ptr [ebp + 8]
40274e: mov dword ptr [esp + 4], eax
402752: mov eax, dword ptr [0x406178]
402757: add eax, 0x40
40275a: mov dword ptr [esp], eax
40275d: call 0x402930
402762: mov eax, dword ptr [0x406178]
402767: add eax, 0x40
40276a: mov dword ptr [esp], eax
40276d: call 0x402920
402772: call 0x402910
402777: nop 
402778: nop 
402779: nop 
40277a: nop 
40277b: nop 
40277c: nop 
40277d: nop 
40277e: nop 
40277f: nop 
402780: jmp dword ptr [0x406154]
402786: nop 
402787: nop 
402788: add byte ptr [eax], al
40278a: add byte ptr [eax], al
40278c: add byte ptr [eax], al
40278e: add byte ptr [eax], al
402790: jmp dword ptr [0x406150]
402796: nop 
402797: nop 
402798: add byte ptr [eax], al
40279a: add byte ptr [eax], al
40279c: add byte ptr [eax], al
40279e: add byte ptr [eax], al
4027a0: jmp dword ptr [0x40616c]
4027a6: nop 
4027a7: nop 
4027a8: add byte ptr [eax], al
4027aa: add byte ptr [eax], al
4027ac: add byte ptr [eax], al
4027ae: add byte ptr [eax], al
4027b0: jmp dword ptr [0x406170]
4027b6: nop 
4027b7: nop 
4027b8: add byte ptr [eax], al
4027ba: add byte ptr [eax], al
4027bc: add byte ptr [eax], al
4027be: add byte ptr [eax], al
4027c0: jmp dword ptr [0x406164]
4027c6: nop 
4027c7: nop 
4027c8: add byte ptr [eax], al
4027ca: add byte ptr [eax], al
4027cc: add byte ptr [eax], al
4027ce: add byte ptr [eax], al
4027d0: jmp dword ptr [0x4061b8]
4027d6: nop 
4027d7: nop 
4027d8: add byte ptr [eax], al
4027da: add byte ptr [eax], al
4027dc: add byte ptr [eax], al
4027de: add byte ptr [eax], al
4027e0: jmp dword ptr [0x406168]
4027e6: nop 
4027e7: nop 
4027e8: add byte ptr [eax], al
4027ea: add byte ptr [eax], al
4027ec: add byte ptr [eax], al
4027ee: add byte ptr [eax], al
4027f0: jmp dword ptr [0x406174]
4027f6: nop 
4027f7: nop 
4027f8: add byte ptr [eax], al
4027fa: add byte ptr [eax], al
4027fc: add byte ptr [eax], al
4027fe: add byte ptr [eax], al
402800: jmp dword ptr [0x406180]
402806: nop 
402807: nop 
402808: add byte ptr [eax], al
40280a: add byte ptr [eax], al
40280c: add byte ptr [eax], al
40280e: add byte ptr [eax], al
402810: jmp dword ptr [0x406160]
402816: nop 
402817: nop 
402818: add byte ptr [eax], al
40281a: add byte ptr [eax], al
40281c: add byte ptr [eax], al
40281e: add byte ptr [eax], al
402820: jmp dword ptr [0x406184]
402826: nop 
402827: nop 
402828: add byte ptr [eax], al
40282a: add byte ptr [eax], al
40282c: add byte ptr [eax], al
40282e: add byte ptr [eax], al
402830: jmp dword ptr [0x4061c4]
402836: nop 
402837: nop 
402838: add byte ptr [eax], al
40283a: add byte ptr [eax], al
40283c: add byte ptr [eax], al
40283e: add byte ptr [eax], al
402840: jmp dword ptr [0x4061d0]
402846: nop 
402847: nop 
402848: add byte ptr [eax], al
40284a: add byte ptr [eax], al
40284c: add byte ptr [eax], al
40284e: add byte ptr [eax], al
402850: jmp dword ptr [0x4061b0]
402856: nop 
402857: nop 
402858: add byte ptr [eax], al
40285a: add byte ptr [eax], al
40285c: add byte ptr [eax], al
40285e: add byte ptr [eax], al
402860: jmp dword ptr [0x4061c0]
402866: nop 
402867: nop 
402868: add byte ptr [eax], al
40286a: add byte ptr [eax], al
40286c: add byte ptr [eax], al
40286e: add byte ptr [eax], al
402870: jmp dword ptr [0x4061bc]
402876: nop 
402877: nop 
402878: add byte ptr [eax], al
40287a: add byte ptr [eax], al
40287c: add byte ptr [eax], al
40287e: add byte ptr [eax], al
402880: jmp dword ptr [0x4061cc]
402886: nop 
402887: nop 
402888: add byte ptr [eax], al
40288a: add byte ptr [eax], al
40288c: add byte ptr [eax], al
40288e: add byte ptr [eax], al
402890: jmp dword ptr [0x4061a8]
402896: nop 
402897: nop 
402898: add byte ptr [eax], al
40289a: add byte ptr [eax], al
40289c: add byte ptr [eax], al
40289e: add byte ptr [eax], al
4028a0: jmp dword ptr [0x4061a4]
4028a6: nop 
4028a7: nop 
4028a8: add byte ptr [eax], al
4028aa: add byte ptr [eax], al
4028ac: add byte ptr [eax], al
4028ae: add byte ptr [eax], al
4028b0: jmp dword ptr [0x4061c8]
4028b6: nop 
4028b7: nop 
4028b8: add byte ptr [eax], al
4028ba: add byte ptr [eax], al
4028bc: add byte ptr [eax], al
4028be: add byte ptr [eax], al
4028c0: jmp dword ptr [0x4061a0]
4028c6: nop 
4028c7: nop 
4028c8: add byte ptr [eax], al
4028ca: add byte ptr [eax], al
4028cc: add byte ptr [eax], al
4028ce: add byte ptr [eax], al
4028d0: jmp dword ptr [0x4061b4]
4028d6: nop 
4028d7: nop 
4028d8: add byte ptr [eax], al
4028da: add byte ptr [eax], al
4028dc: add byte ptr [eax], al
4028de: add byte ptr [eax], al
4028e0: jmp dword ptr [0x406190]
4028e6: nop 
4028e7: nop 
4028e8: add byte ptr [eax], al
4028ea: add byte ptr [eax], al
4028ec: add byte ptr [eax], al
4028ee: add byte ptr [eax], al
4028f0: jmp dword ptr [0x40619c]
4028f6: nop 
4028f7: nop 
4028f8: add byte ptr [eax], al
4028fa: add byte ptr [eax], al
4028fc: add byte ptr [eax], al
4028fe: add byte ptr [eax], al
402900: jmp dword ptr [0x4061ac]
402906: nop 
402907: nop 
402908: add byte ptr [eax], al
40290a: add byte ptr [eax], al
40290c: add byte ptr [eax], al
40290e: add byte ptr [eax], al
402910: jmp dword ptr [0x406188]
402916: nop 
402917: nop 
402918: add byte ptr [eax], al
40291a: add byte ptr [eax], al
40291c: add byte ptr [eax], al
40291e: add byte ptr [eax], al
402920: jmp dword ptr [0x406194]
402926: nop 
402927: nop 
402928: add byte ptr [eax], al
40292a: add byte ptr [eax], al
40292c: add byte ptr [eax], al
40292e: add byte ptr [eax], al
402930: jmp dword ptr [0x406198]
402936: nop 
402937: nop 
402938: add byte ptr [eax], al
40293a: add byte ptr [eax], al
40293c: add byte ptr [eax], al
40293e: add byte ptr [eax], al
402940: jmp dword ptr [0x406140]
402946: nop 
402947: nop 
402948: add byte ptr [eax], al
40294a: add byte ptr [eax], al
40294c: add byte ptr [eax], al
40294e: add byte ptr [eax], al
402950: jmp dword ptr [0x406120]
402956: nop 
402957: nop 
402958: add byte ptr [eax], al
40295a: add byte ptr [eax], al
40295c: add byte ptr [eax], al
40295e: add byte ptr [eax], al
402960: jmp dword ptr [0x406134]
402966: nop 
402967: nop 
402968: add byte ptr [eax], al
40296a: add byte ptr [eax], al
40296c: add byte ptr [eax], al
40296e: add byte ptr [eax], al
402970: jmp dword ptr [0x406138]
402976: nop 
402977: nop 
402978: add byte ptr [eax], al
40297a: add byte ptr [eax], al
40297c: add byte ptr [eax], al
40297e: add byte ptr [eax], al
402980: jmp dword ptr [0x406130]
402986: nop 
402987: nop 
402988: add byte ptr [eax], al
40298a: add byte ptr [eax], al
40298c: add byte ptr [eax], al
40298e: add byte ptr [eax], al
402990: jmp dword ptr [0x406128]
402996: nop 
402997: nop 
402998: add byte ptr [eax], al
40299a: add byte ptr [eax], al
40299c: add byte ptr [eax], al
40299e: add byte ptr [eax], al
4029a0: jmp dword ptr [0x40613c]
4029a6: nop 
4029a7: nop 
4029a8: add byte ptr [eax], al
4029aa: add byte ptr [eax], al
4029ac: add byte ptr [eax], al
4029ae: add byte ptr [eax], al
4029b0: jmp dword ptr [0x40611c]
4029b6: nop 
4029b7: nop 
4029b8: add byte ptr [eax], al
4029ba: add byte ptr [eax], al
4029bc: add byte ptr [eax], al
4029be: add byte ptr [eax], al
4029c0: jmp dword ptr [0x406144]
4029c6: nop 
4029c7: nop 
4029c8: add byte ptr [eax], al
4029ca: add byte ptr [eax], al
4029cc: add byte ptr [eax], al
4029ce: add byte ptr [eax], al
4029d0: jmp dword ptr [0x40612c]
4029d6: nop 
4029d7: nop 
4029d8: add byte ptr [eax], al
4029da: add byte ptr [eax], al
4029dc: add byte ptr [eax], al
4029de: add byte ptr [eax], al
4029e0: jmp dword ptr [0x406124]
4029e6: nop 
4029e7: nop 
4029e8: add byte ptr [eax], al
4029ea: add byte ptr [eax], al
4029ec: add byte ptr [eax], al
4029ee: add byte ptr [eax], al
4029f0: jmp dword ptr [0x406118]
4029f6: nop 
4029f7: nop 
4029f8: add byte ptr [eax], al
4029fa: add byte ptr [eax], al
4029fc: add byte ptr [eax], al
4029fe: add byte ptr [eax], al
402a00: push ebp
402a01: mov ebp, esp
402a03: pop ebp
402a04: jmp 0x4012a0
402a09: nop 
402a0a: nop 
402a0b: nop 
402a0c: nop 
402a0d: nop 
402a0e: nop 
402a0f: nop 
