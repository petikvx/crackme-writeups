
RaMMy.exe (mémoire après décompression ASPack):     file format binary


Disassembly of section .data:

00401000 <.data>:
  401000:	6a 00                	push   0x0
  401002:	e8 0d 08 00 00       	call   0x401814
  401007:	a3 28 31 40 00       	mov    ds:0x403128,eax
  40100c:	6a 0a                	push   0xa
  40100e:	6a 00                	push   0x0
  401010:	6a 00                	push   0x0
  401012:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  401018:	e8 06 00 00 00       	call   0x401023
  40101d:	50                   	push   eax
  40101e:	e8 eb 07 00 00       	call   0x40180e
  401023:	55                   	push   ebp
  401024:	8b ec                	mov    ebp,esp
  401026:	83 c4 b0             	add    esp,0xffffffb0
  401029:	c7 45 d0 30 00 00 00 	mov    DWORD PTR [ebp-0x30],0x30
  401030:	c7 45 d4 0b 00 00 00 	mov    DWORD PTR [ebp-0x2c],0xb
  401037:	c7 45 d8 16 11 40 00 	mov    DWORD PTR [ebp-0x28],0x401116
  40103e:	c7 45 dc 00 00 00 00 	mov    DWORD PTR [ebp-0x24],0x0
  401045:	c7 45 e0 00 00 00 00 	mov    DWORD PTR [ebp-0x20],0x0
  40104c:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  401052:	8f 45 e4             	pop    DWORD PTR [ebp-0x1c]
  401055:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  40105c:	c7 45 f4 00 00 00 00 	mov    DWORD PTR [ebp-0xc],0x0
  401063:	c7 45 f8 00 30 40 00 	mov    DWORD PTR [ebp-0x8],0x403000
  40106a:	c7 45 e8 00 00 00 00 	mov    DWORD PTR [ebp-0x18],0x0
  401071:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  401074:	68 03 7f 00 00       	push   0x7f03
  401079:	6a 00                	push   0x0
  40107b:	e8 52 07 00 00       	call   0x4017d2
  401080:	89 45 ec             	mov    DWORD PTR [ebp-0x14],eax
  401083:	8d 45 d0             	lea    eax,[ebp-0x30]
  401086:	50                   	push   eax
  401087:	e8 58 07 00 00       	call   0x4017e4
  40108c:	6a 00                	push   0x0
  40108e:	e8 2d 07 00 00       	call   0x4017c0
  401093:	d1 e8                	shr    eax,1
  401095:	2d c1 00 00 00       	sub    eax,0xc1
  40109a:	50                   	push   eax
  40109b:	6a 01                	push   0x1
  40109d:	e8 1e 07 00 00       	call   0x4017c0
  4010a2:	d1 e8                	shr    eax,1
  4010a4:	83 e8 7a             	sub    eax,0x7a
  4010a7:	5b                   	pop    ebx
  4010a8:	6a 00                	push   0x0
  4010aa:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4010ad:	6a 00                	push   0x0
  4010af:	6a 00                	push   0x0
  4010b1:	68 f4 00 00 00       	push   0xf4
  4010b6:	68 83 01 00 00       	push   0x183
  4010bb:	50                   	push   eax
  4010bc:	53                   	push   ebx
  4010bd:	68 00 00 00 80       	push   0x80000000
  4010c2:	68 00 30 40 00       	push   0x403000
  4010c7:	68 00 30 40 00       	push   0x403000
  4010cc:	6a 00                	push   0x0
  4010ce:	e8 c3 06 00 00       	call   0x401796
  4010d3:	89 45 b0             	mov    DWORD PTR [ebp-0x50],eax
  4010d6:	6a 01                	push   0x1
  4010d8:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4010db:	e8 1c 07 00 00       	call   0x4017fc
  4010e0:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  4010e3:	e8 20 07 00 00       	call   0x401808
  4010e8:	6a 00                	push   0x0
  4010ea:	6a 00                	push   0x0
  4010ec:	6a 00                	push   0x0
  4010ee:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4010f1:	50                   	push   eax
  4010f2:	e8 c3 06 00 00       	call   0x4017ba
  4010f7:	85 c0                	test   eax,eax
  4010f9:	74 14                	je     0x40110f
  4010fb:	8d 45 b4             	lea    eax,[ebp-0x4c]
  4010fe:	50                   	push   eax
  4010ff:	e8 fe 06 00 00       	call   0x401802
  401104:	8d 45 b4             	lea    eax,[ebp-0x4c]
  401107:	50                   	push   eax
  401108:	e8 95 06 00 00       	call   0x4017a2
  40110d:	eb d9                	jmp    0x4010e8
  40110f:	8b 45 bc             	mov    eax,DWORD PTR [ebp-0x44]
  401112:	c9                   	leave
  401113:	c2 10 00             	ret    0x10
  401116:	55                   	push   ebp
  401117:	8b ec                	mov    ebp,esp
  401119:	83 c4 94             	add    esp,0xffffff94
  40111c:	83 7d 0c 01          	cmp    DWORD PTR [ebp+0xc],0x1
  401120:	0f 85 d4 01 00 00    	jne    0x4012fa
  401126:	68 e8 03 00 00       	push   0x3e8
  40112b:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  401131:	e8 96 06 00 00       	call   0x4017cc
  401136:	a3 2c 31 40 00       	mov    ds:0x40312c,eax
  40113b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40113e:	e8 83 06 00 00       	call   0x4017c6
  401143:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  401146:	6a 00                	push   0x0
  401148:	e8 e5 06 00 00       	call   0x401832
  40114d:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  401150:	ff 35 2c 31 40 00    	push   DWORD PTR ds:0x40312c
  401156:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  401159:	e8 f2 06 00 00       	call   0x401850
  40115e:	8d 45 a8             	lea    eax,[ebp-0x58]
  401161:	50                   	push   eax
  401162:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401165:	e8 44 06 00 00       	call   0x4017ae
  40116a:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
  40116d:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  401170:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  401173:	e8 ae 03 00 00       	call   0x401526
  401178:	6a 01                	push   0x1
  40117a:	50                   	push   eax
  40117b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40117e:	e8 73 06 00 00       	call   0x4017f6
  401183:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
  401186:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401189:	e8 5c 06 00 00       	call   0x4017ea
  40118e:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  401191:	e8 a8 06 00 00       	call   0x40183e
  401196:	6a 00                	push   0x0
  401198:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  40119e:	68 e9 03 00 00       	push   0x3e9
  4011a3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4011a6:	6a 28                	push   0x28
  4011a8:	6a 28                	push   0x28
  4011aa:	68 be 00 00 00       	push   0xbe
  4011af:	68 ad 00 00 00       	push   0xad
  4011b4:	68 00 00 00 50       	push   0x50000000
  4011b9:	68 fd 30 40 00       	push   0x4030fd
  4011be:	68 ea 30 40 00       	push   0x4030ea
  4011c3:	6a 00                	push   0x0
  4011c5:	e8 cc 05 00 00       	call   0x401796
  4011ca:	a3 30 31 40 00       	mov    ds:0x403130,eax
  4011cf:	6a 00                	push   0x0
  4011d1:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  4011d7:	68 ea 03 00 00       	push   0x3ea
  4011dc:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4011df:	6a 19                	push   0x19
  4011e1:	6a 50                	push   0x50
  4011e3:	6a 14                	push   0x14
  4011e5:	6a 0f                	push   0xf
  4011e7:	68 01 00 00 50       	push   0x50000001
  4011ec:	68 be 30 40 00       	push   0x4030be
  4011f1:	68 ea 30 40 00       	push   0x4030ea
  4011f6:	6a 00                	push   0x0
  4011f8:	e8 99 05 00 00       	call   0x401796
  4011fd:	6a 00                	push   0x0
  4011ff:	50                   	push   eax
  401200:	68 02 31 40 00       	push   0x403102
  401205:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401208:	e8 cb 05 00 00       	call   0x4017d8
  40120d:	6a 00                	push   0x0
  40120f:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  401215:	68 eb 03 00 00       	push   0x3eb
  40121a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40121d:	6a 19                	push   0x19
  40121f:	6a 50                	push   0x50
  401221:	6a 14                	push   0x14
  401223:	68 22 01 00 00       	push   0x122
  401228:	68 00 00 00 50       	push   0x50000000
  40122d:	68 b2 30 40 00       	push   0x4030b2
  401232:	68 ea 30 40 00       	push   0x4030ea
  401237:	6a 00                	push   0x0
  401239:	e8 58 05 00 00       	call   0x401796
  40123e:	33 c0                	xor    eax,eax
  401240:	6a 00                	push   0x0
  401242:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  401248:	6a 0a                	push   0xa
  40124a:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40124d:	6a 17                	push   0x17
  40124f:	68 82 00 00 00       	push   0x82
  401254:	6a 55                	push   0x55
  401256:	6a 7d                	push   0x7d
  401258:	68 80 00 80 50       	push   0x50800080
  40125d:	6a 00                	push   0x0
  40125f:	68 f1 30 40 00       	push   0x4030f1
  401264:	6a 00                	push   0x0
  401266:	e8 2b 05 00 00       	call   0x401796
  40126b:	6a 00                	push   0x0
  40126d:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  401273:	6a 0b                	push   0xb
  401275:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401278:	6a 17                	push   0x17
  40127a:	68 82 00 00 00       	push   0x82
  40127f:	68 82 00 00 00       	push   0x82
  401284:	6a 7d                	push   0x7d
  401286:	68 80 00 80 50       	push   0x50800080
  40128b:	6a 00                	push   0x0
  40128d:	68 f1 30 40 00       	push   0x4030f1
  401292:	6a 00                	push   0x0
  401294:	e8 fd 04 00 00       	call   0x401796
  401299:	6a 00                	push   0x0
  40129b:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  4012a1:	6a 00                	push   0x0
  4012a3:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4012a6:	6a 14                	push   0x14
  4012a8:	6a 46                	push   0x46
  4012aa:	6a 41                	push   0x41
  4012ac:	68 9b 00 00 00       	push   0x9b
  4012b1:	68 00 00 00 50       	push   0x50000000
  4012b6:	68 02 31 40 00       	push   0x403102
  4012bb:	68 f6 30 40 00       	push   0x4030f6
  4012c0:	6a 00                	push   0x0
  4012c2:	e8 cf 04 00 00       	call   0x401796
  4012c7:	6a 00                	push   0x0
  4012c9:	ff 35 28 31 40 00    	push   DWORD PTR ds:0x403128
  4012cf:	6a 00                	push   0x0
  4012d1:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4012d4:	6a 14                	push   0x14
  4012d6:	6a 46                	push   0x46
  4012d8:	6a 6e                	push   0x6e
  4012da:	68 9b 00 00 00       	push   0x9b
  4012df:	68 00 00 00 50       	push   0x50000000
  4012e4:	68 0f 31 40 00       	push   0x40310f
  4012e9:	68 f6 30 40 00       	push   0x4030f6
  4012ee:	6a 00                	push   0x0
  4012f0:	e8 a1 04 00 00       	call   0x401796
  4012f5:	e9 70 01 00 00       	jmp    0x40146a
  4012fa:	83 7d 0c 0f          	cmp    DWORD PTR [ebp+0xc],0xf
  4012fe:	75 6a                	jne    0x40136a
  401300:	8d 45 a8             	lea    eax,[ebp-0x58]
  401303:	50                   	push   eax
  401304:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401307:	e8 a2 04 00 00       	call   0x4017ae
  40130c:	8d 45 c0             	lea    eax,[ebp-0x40]
  40130f:	50                   	push   eax
  401310:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401313:	e8 78 04 00 00       	call   0x401790
  401318:	89 45 bc             	mov    DWORD PTR [ebp-0x44],eax
  40131b:	6a 00                	push   0x0
  40131d:	e8 10 05 00 00       	call   0x401832
  401322:	89 45 b8             	mov    DWORD PTR [ebp-0x48],eax
  401325:	ff 35 2c 31 40 00    	push   DWORD PTR ds:0x40312c
  40132b:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  40132e:	e8 1d 05 00 00       	call   0x401850
  401333:	68 20 00 cc 00       	push   0xcc0020
  401338:	6a 00                	push   0x0
  40133a:	6a 00                	push   0x0
  40133c:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  40133f:	ff 75 b4             	push   DWORD PTR [ebp-0x4c]
  401342:	ff 75 b0             	push   DWORD PTR [ebp-0x50]
  401345:	6a 00                	push   0x0
  401347:	6a 00                	push   0x0
  401349:	ff 75 bc             	push   DWORD PTR [ebp-0x44]
  40134c:	e8 d5 04 00 00       	call   0x401826
  401351:	ff 75 b8             	push   DWORD PTR [ebp-0x48]
  401354:	e8 e5 04 00 00       	call   0x40183e
  401359:	8d 45 c0             	lea    eax,[ebp-0x40]
  40135c:	50                   	push   eax
  40135d:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401360:	e8 43 04 00 00       	call   0x4017a8
  401365:	e9 00 01 00 00       	jmp    0x40146a
  40136a:	81 7d 0c 11 01 00 00 	cmp    DWORD PTR [ebp+0xc],0x111
  401371:	0f 85 b9 00 00 00    	jne    0x401430
  401377:	8b 45 10             	mov    eax,DWORD PTR [ebp+0x10]
  40137a:	66 3d eb 03          	cmp    ax,0x3eb
  40137e:	75 13                	jne    0x401393
  401380:	6a 00                	push   0x0
  401382:	6a 00                	push   0x0
  401384:	6a 02                	push   0x2
  401386:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401389:	e8 62 04 00 00       	call   0x4017f0
  40138e:	e9 d7 00 00 00       	jmp    0x40146a
  401393:	66 3d ea 03          	cmp    ax,0x3ea
  401397:	75 19                	jne    0x4013b2
  401399:	6a 40                	push   0x40
  40139b:	68 be 30 40 00       	push   0x4030be
  4013a0:	68 06 30 40 00       	push   0x403006
  4013a5:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4013a8:	e8 2b 04 00 00       	call   0x4017d8
  4013ad:	e9 b8 00 00 00       	jmp    0x40146a
  4013b2:	66 3d e9 03          	cmp    ax,0x3e9
  4013b6:	0f 85 ae 00 00 00    	jne    0x40146a
  4013bc:	e8 20 01 00 00       	call   0x4014e1
  4013c1:	33 c3                	xor    eax,ebx
  4013c3:	b8 01 00 00 00       	mov    eax,0x1
  4013c8:	b9 01 00 00 00       	mov    ecx,0x1
  4013cd:	51                   	push   ecx
  4013ce:	50                   	push   eax
  4013cf:	53                   	push   ebx
  4013d0:	e8 03 04 00 00       	call   0x4017d8
  4013d5:	6a 32                	push   0x32
  4013d7:	68 34 31 40 00       	push   0x403134
  4013dc:	6a 0a                	push   0xa
  4013de:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4013e1:	e8 ce 03 00 00       	call   0x4017b4
  4013e6:	6a 0a                	push   0xa
  4013e8:	68 3c 31 40 00       	push   0x40313c
  4013ed:	6a 0b                	push   0xb
  4013ef:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4013f2:	e8 bd 03 00 00       	call   0x4017b4
  4013f7:	e8 83 00 00 00       	call   0x40147f
  4013fc:	68 00 30 40 00       	push   0x403000
  401401:	e8 dd 01 00 00       	call   0x4015e3
  401406:	68 34 31 40 00       	push   0x403134
  40140b:	50                   	push   eax
  40140c:	e8 09 04 00 00       	call   0x40181a
  401411:	83 f8 00             	cmp    eax,0x0
  401414:	0f 84 8c 00 00 00    	je     0x4014a6
  40141a:	6a ff                	push   0xffffffff
  40141c:	68 70 f1 00 00       	push   0xf170
  401421:	68 12 01 00 00       	push   0x112
  401426:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401429:	e8 c2 03 00 00       	call   0x4017f0
  40142e:	eb 3a                	jmp    0x40146a
  401430:	83 7d 0c 02          	cmp    DWORD PTR [ebp+0xc],0x2
  401434:	75 1a                	jne    0x401450
  401436:	ff 35 2c 31 40 00    	push   DWORD PTR ds:0x40312c
  40143c:	e8 03 04 00 00       	call   0x401844
  401441:	6a 00                	push   0x0
  401443:	e8 96 03 00 00       	call   0x4017de
  401448:	33 c0                	xor    eax,eax
  40144a:	c9                   	leave
  40144b:	c2 10 00             	ret    0x10
  40144e:	eb 1a                	jmp    0x40146a
  401450:	81 7d 0c 01 02 00 00 	cmp    DWORD PTR [ebp+0xc],0x201
  401457:	75 11                	jne    0x40146a
  401459:	6a 00                	push   0x0
  40145b:	6a 02                	push   0x2
  40145d:	68 a1 00 00 00       	push   0xa1
  401462:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401465:	e8 86 03 00 00       	call   0x4017f0
  40146a:	ff 75 14             	push   DWORD PTR [ebp+0x14]
  40146d:	ff 75 10             	push   DWORD PTR [ebp+0x10]
  401470:	ff 75 0c             	push   DWORD PTR [ebp+0xc]
  401473:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401476:	e8 21 03 00 00       	call   0x40179c
  40147b:	c9                   	leave
  40147c:	c2 10 00             	ret    0x10
  40147f:	b9 fc 13 40 00       	mov    ecx,0x4013fc
  401484:	c7 01 68 34 31 40    	mov    DWORD PTR [ecx],0x40313468
  40148a:	83 c1 04             	add    ecx,0x4
  40148d:	c6 01 00             	mov    BYTE PTR [ecx],0x0
  401490:	41                   	inc    ecx
  401491:	83 c1 05             	add    ecx,0x5
  401494:	c7 01 68 3c 31 40    	mov    DWORD PTR [ecx],0x40313c68
  40149a:	83 c1 04             	add    ecx,0x4
  40149d:	c6 01 00             	mov    BYTE PTR [ecx],0x0
  4014a0:	41                   	inc    ecx
  4014a1:	e9 56 ff ff ff       	jmp    0x4013fc
  4014a6:	b8 99 13 40 00       	mov    eax,0x401399
  4014ab:	83 c0 02             	add    eax,0x2
  4014ae:	c7 00 68 1e 31 40    	mov    DWORD PTR [eax],0x40311e68
  4014b4:	83 c0 04             	add    eax,0x4
  4014b7:	c6 00 00             	mov    BYTE PTR [eax],0x0
  4014ba:	40                   	inc    eax
  4014bb:	c7 00 68 ca 30 40    	mov    DWORD PTR [eax],0x4030ca68
  4014c1:	83 c0 04             	add    eax,0x4
  4014c4:	c6 00 00             	mov    BYTE PTR [eax],0x0
  4014c7:	40                   	inc    eax
  4014c8:	6a ff                	push   0xffffffff
  4014ca:	68 70 f1 00 00       	push   0xf170
  4014cf:	68 12 01 00 00       	push   0x112
  4014d4:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  4014d7:	e8 14 03 00 00       	call   0x4017f0
  4014dc:	e9 b8 fe ff ff       	jmp    0x401399
  4014e1:	b9 c1 13 40 00       	mov    ecx,0x4013c1
  4014e6:	66 c7 01 6a 00       	mov    WORD PTR [ecx],0x6a
  4014eb:	83 c1 02             	add    ecx,0x2
  4014ee:	c7 01 68 70 f1 00    	mov    DWORD PTR [ecx],0xf17068
  4014f4:	83 c1 04             	add    ecx,0x4
  4014f7:	c6 01 00             	mov    BYTE PTR [ecx],0x0
  4014fa:	41                   	inc    ecx
  4014fb:	c7 01 68 12 01 00    	mov    DWORD PTR [ecx],0x11268
  401501:	83 c1 04             	add    ecx,0x4
  401504:	c6 01 00             	mov    BYTE PTR [ecx],0x0
  401507:	41                   	inc    ecx
  401508:	66 c7 01 ff 75       	mov    WORD PTR [ecx],0x75ff
  40150d:	83 c1 02             	add    ecx,0x2
  401510:	c6 01 08             	mov    BYTE PTR [ecx],0x8
  401513:	41                   	inc    ecx
  401514:	c7 01 e8 1b 04 00    	mov    DWORD PTR [ecx],0x41be8
  40151a:	83 c1 04             	add    ecx,0x4
  40151d:	c6 01 00             	mov    BYTE PTR [ecx],0x0
  401520:	41                   	inc    ecx
  401521:	e9 9b fe ff ff       	jmp    0x4013c1
  401526:	55                   	push   ebp
  401527:	8b ec                	mov    ebp,esp
  401529:	83 c4 e8             	add    esp,0xffffffe8
  40152c:	56                   	push   esi
  40152d:	57                   	push   edi
  40152e:	53                   	push   ebx
  40152f:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  401536:	c7 45 f8 01 00 00 00 	mov    DWORD PTR [ebp-0x8],0x1
  40153d:	c7 45 ec 00 00 00 00 	mov    DWORD PTR [ebp-0x14],0x0
  401544:	33 ff                	xor    edi,edi
  401546:	33 f6                	xor    esi,esi
  401548:	68 dc 00 00 00       	push   0xdc
  40154d:	68 96 00 00 00       	push   0x96
  401552:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401555:	e8 f0 02 00 00       	call   0x40184a
  40155a:	89 45 e8             	mov    DWORD PTR [ebp-0x18],eax
  40155d:	56                   	push   esi
  40155e:	57                   	push   edi
  40155f:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  401562:	e8 e3 02 00 00       	call   0x40184a
  401567:	3b 45 e8             	cmp    eax,DWORD PTR [ebp-0x18]
  40156a:	74 05                	je     0x401571
  40156c:	3b 7d 0c             	cmp    edi,DWORD PTR [ebp+0xc]
  40156f:	75 4b                	jne    0x4015bc
  401571:	83 7d fc 01          	cmp    DWORD PTR [ebp-0x4],0x1
  401575:	75 54                	jne    0x4015cb
  401577:	c7 45 fc 00 00 00 00 	mov    DWORD PTR [ebp-0x4],0x0
  40157e:	8b c6                	mov    eax,esi
  401580:	40                   	inc    eax
  401581:	50                   	push   eax
  401582:	57                   	push   edi
  401583:	56                   	push   esi
  401584:	53                   	push   ebx
  401585:	e8 ae 02 00 00       	call   0x401838
  40158a:	89 45 f4             	mov    DWORD PTR [ebp-0xc],eax
  40158d:	83 7d f8 01          	cmp    DWORD PTR [ebp-0x8],0x1
  401591:	75 0f                	jne    0x4015a2
  401593:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  40159a:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
  40159d:	8f 45 f0             	pop    DWORD PTR [ebp-0x10]
  4015a0:	eb 29                	jmp    0x4015cb
  4015a2:	6a 02                	push   0x2
  4015a4:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
  4015a7:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  4015aa:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  4015ad:	e8 7a 02 00 00       	call   0x40182c
  4015b2:	ff 75 f4             	push   DWORD PTR [ebp-0xc]
  4015b5:	e8 8a 02 00 00       	call   0x401844
  4015ba:	eb 0f                	jmp    0x4015cb
  4015bc:	83 7d fc 00          	cmp    DWORD PTR [ebp-0x4],0x0
  4015c0:	75 09                	jne    0x4015cb
  4015c2:	c7 45 fc 01 00 00 00 	mov    DWORD PTR [ebp-0x4],0x1
  4015c9:	8b df                	mov    ebx,edi
  4015cb:	47                   	inc    edi
  4015cc:	3b 7d 0c             	cmp    edi,DWORD PTR [ebp+0xc]
  4015cf:	76 8c                	jbe    0x40155d
  4015d1:	33 ff                	xor    edi,edi
  4015d3:	46                   	inc    esi
  4015d4:	3b 75 10             	cmp    esi,DWORD PTR [ebp+0x10]
  4015d7:	72 84                	jb     0x40155d
  4015d9:	8b 45 f0             	mov    eax,DWORD PTR [ebp-0x10]
  4015dc:	5b                   	pop    ebx
  4015dd:	5f                   	pop    edi
  4015de:	5e                   	pop    esi
  4015df:	c9                   	leave
  4015e0:	c2 0c 00             	ret    0xc
  4015e3:	55                   	push   ebp
  4015e4:	8b ec                	mov    ebp,esp
  4015e6:	83 c4 f0             	add    esp,0xfffffff0
  4015e9:	56                   	push   esi
  4015ea:	57                   	push   edi
  4015eb:	53                   	push   ebx
  4015ec:	51                   	push   ecx
  4015ed:	c7 45 f8 00 00 00 00 	mov    DWORD PTR [ebp-0x8],0x0
  4015f4:	c7 45 f0 00 00 00 00 	mov    DWORD PTR [ebp-0x10],0x0
  4015fb:	33 ff                	xor    edi,edi
  4015fd:	33 db                	xor    ebx,ebx
  4015ff:	33 f6                	xor    esi,esi
  401601:	8b 45 08             	mov    eax,DWORD PTR [ebp+0x8]
  401604:	8a 18                	mov    bl,BYTE PTR [eax]
  401606:	84 db                	test   bl,bl
  401608:	74 05                	je     0x40160f
  40160a:	03 fb                	add    edi,ebx
  40160c:	40                   	inc    eax
  40160d:	eb f5                	jmp    0x401604
  40160f:	89 7d f0             	mov    DWORD PTR [ebp-0x10],edi
  401612:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  401615:	8f 05 44 31 40 00    	pop    DWORD PTR ds:0x403144
  40161b:	ff 75 08             	push   DWORD PTR [ebp+0x8]
  40161e:	e8 fd 01 00 00       	call   0x401820
  401623:	83 f8 13             	cmp    eax,0x13
  401626:	76 0a                	jbe    0x401632
  401628:	6a 00                	push   0x0
  40162a:	8f 05 44 31 40 00    	pop    DWORD PTR ds:0x403144
  401630:	eb 07                	jmp    0x401639
  401632:	ff 35 44 31 40 00    	push   DWORD PTR ds:0x403144
  401638:	58                   	pop    eax
  401639:	e8 c4 00 00 00       	call   0x401702
  40163e:	89 45 fc             	mov    DWORD PTR [ebp-0x4],eax
  401641:	c7 05 48 31 40 00 c8 	mov    DWORD PTR ds:0x403148,0xc8
  401648:	00 00 00 
  40164b:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  40164e:	58                   	pop    eax
  40164f:	03 45 f0             	add    eax,DWORD PTR [ebp-0x10]
  401652:	ff 45 f8             	inc    DWORD PTR [ebp-0x8]
  401655:	8b 5d fc             	mov    ebx,DWORD PTR [ebp-0x4]
  401658:	39 5d f8             	cmp    DWORD PTR [ebp-0x8],ebx
  40165b:	72 f2                	jb     0x40164f
  40165d:	c1 e0 02             	shl    eax,0x2
  401660:	89 45 f0             	mov    DWORD PTR [ebp-0x10],eax
  401663:	a1 48 31 40 00       	mov    eax,ds:0x403148
  401668:	e8 95 00 00 00       	call   0x401702
  40166d:	01 45 f0             	add    DWORD PTR [ebp-0x10],eax
  401670:	33 c0                	xor    eax,eax
  401672:	ff 75 f0             	push   DWORD PTR [ebp-0x10]
  401675:	8f 05 38 31 40 00    	pop    DWORD PTR ds:0x403138
  40167b:	bb 38 31 40 00       	mov    ebx,0x403138
  401680:	b9 38 31 40 00       	mov    ecx,0x403138
  401685:	33 c0                	xor    eax,eax
  401687:	8a 03                	mov    al,BYTE PTR [ebx]
  401689:	84 c0                	test   al,al
  40168b:	74 0b                	je     0x401698
  40168d:	e8 16 00 00 00       	call   0x4016a8
  401692:	88 01                	mov    BYTE PTR [ecx],al
  401694:	43                   	inc    ebx
  401695:	41                   	inc    ecx
  401696:	eb ef                	jmp    0x401687
  401698:	83 e9 04             	sub    ecx,0x4
  40169b:	c6 01 52             	mov    BYTE PTR [ecx],0x52
  40169e:	8b c1                	mov    eax,ecx
  4016a0:	59                   	pop    ecx
  4016a1:	5b                   	pop    ebx
  4016a2:	5f                   	pop    edi
  4016a3:	5e                   	pop    esi
  4016a4:	c9                   	leave
  4016a5:	c2 04 00             	ret    0x4
  4016a8:	83 f8 30             	cmp    eax,0x30
  4016ab:	72 02                	jb     0x4016af
  4016ad:	eb 08                	jmp    0x4016b7
  4016af:	8b f8                	mov    edi,eax
  4016b1:	03 c0                	add    eax,eax
  4016b3:	03 c7                	add    eax,edi
  4016b5:	eb f1                	jmp    0x4016a8
  4016b7:	83 f8 5a             	cmp    eax,0x5a
  4016ba:	77 02                	ja     0x4016be
  4016bc:	eb 05                	jmp    0x4016c3
  4016be:	83 e8 59             	sub    eax,0x59
  4016c1:	eb e5                	jmp    0x4016a8
  4016c3:	83 f8 3a             	cmp    eax,0x3a
  4016c6:	74 20                	je     0x4016e8
  4016c8:	83 f8 3b             	cmp    eax,0x3b
  4016cb:	74 1b                	je     0x4016e8
  4016cd:	83 f8 3c             	cmp    eax,0x3c
  4016d0:	74 16                	je     0x4016e8
  4016d2:	83 f8 3d             	cmp    eax,0x3d
  4016d5:	74 11                	je     0x4016e8
  4016d7:	83 f8 3e             	cmp    eax,0x3e
  4016da:	74 0c                	je     0x4016e8
  4016dc:	83 f8 3f             	cmp    eax,0x3f
  4016df:	74 07                	je     0x4016e8
  4016e1:	83 f8 40             	cmp    eax,0x40
  4016e4:	74 02                	je     0x4016e8
  4016e6:	eb 02                	jmp    0x4016ea
  4016e8:	d1 e0                	shl    eax,1
  4016ea:	c3                   	ret
  4016eb:	33 c9                	xor    ecx,ecx
  4016ed:	83 c0 64             	add    eax,0x64
  4016f0:	41                   	inc    ecx
  4016f1:	3b c3                	cmp    eax,ebx
  4016f3:	76 f8                	jbe    0x4016ed
  4016f5:	83 e8 64             	sub    eax,0x64
  4016f8:	49                   	dec    ecx
  4016f9:	2b d8                	sub    ebx,eax
  4016fb:	8b c3                	mov    eax,ebx
  4016fd:	8b d9                	mov    ebx,ecx
  4016ff:	33 c9                	xor    ecx,ecx
  401701:	c3                   	ret
  401702:	a3 5c 31 40 00       	mov    ds:0x40315c,eax
  401707:	83 3d 5c 31 40 00 00 	cmp    DWORD PTR ds:0x40315c,0x0
  40170e:	74 79                	je     0x401789
  401710:	c7 05 58 31 40 00 00 	mov    DWORD PTR ds:0x403158,0x0
  401717:	00 00 00 
  40171a:	c7 05 4c 31 40 00 01 	mov    DWORD PTR ds:0x40314c,0x1
  401721:	00 00 00 
  401724:	c7 05 50 31 40 00 01 	mov    DWORD PTR ds:0x403150,0x1
  40172b:	00 00 00 
  40172e:	c7 05 54 31 40 00 00 	mov    DWORD PTR ds:0x403154,0x0
  401735:	00 00 00 
  401738:	a1 4c 31 40 00       	mov    eax,ds:0x40314c
  40173d:	01 05 54 31 40 00    	add    DWORD PTR ds:0x403154,eax
  401743:	a1 50 31 40 00       	mov    eax,ds:0x403150
  401748:	01 05 54 31 40 00    	add    DWORD PTR ds:0x403154,eax
  40174e:	a1 50 31 40 00       	mov    eax,ds:0x403150
  401753:	a3 4c 31 40 00       	mov    ds:0x40314c,eax
  401758:	a1 54 31 40 00       	mov    eax,ds:0x403154
  40175d:	a3 50 31 40 00       	mov    ds:0x403150,eax
  401762:	ff 05 58 31 40 00    	inc    DWORD PTR ds:0x403158
  401768:	a1 58 31 40 00       	mov    eax,ds:0x403158
  40176d:	8b 1d 5c 31 40 00    	mov    ebx,DWORD PTR ds:0x40315c
  401773:	3b c3                	cmp    eax,ebx
  401775:	75 b7                	jne    0x40172e
  401777:	a1 54 31 40 00       	mov    eax,ds:0x403154
  40177c:	3d c8 00 00 00       	cmp    eax,0xc8
  401781:	76 0b                	jbe    0x40178e
  401783:	d1 e8                	shr    eax,1
  401785:	eb f5                	jmp    0x40177c
  401787:	eb 05                	jmp    0x40178e
  401789:	b8 2c 00 00 00       	mov    eax,0x2c
  40178e:	40                   	inc    eax
  40178f:	c3                   	ret
  401790:	ff 25 80 20 40 00    	jmp    DWORD PTR ds:0x402080
  401796:	ff 25 7c 20 40 00    	jmp    DWORD PTR ds:0x40207c
  40179c:	ff 25 78 20 40 00    	jmp    DWORD PTR ds:0x402078
  4017a2:	ff 25 74 20 40 00    	jmp    DWORD PTR ds:0x402074
  4017a8:	ff 25 70 20 40 00    	jmp    DWORD PTR ds:0x402070
  4017ae:	ff 25 6c 20 40 00    	jmp    DWORD PTR ds:0x40206c
  4017b4:	ff 25 68 20 40 00    	jmp    DWORD PTR ds:0x402068
  4017ba:	ff 25 64 20 40 00    	jmp    DWORD PTR ds:0x402064
  4017c0:	ff 25 60 20 40 00    	jmp    DWORD PTR ds:0x402060
  4017c6:	ff 25 5c 20 40 00    	jmp    DWORD PTR ds:0x40205c
  4017cc:	ff 25 58 20 40 00    	jmp    DWORD PTR ds:0x402058
  4017d2:	ff 25 54 20 40 00    	jmp    DWORD PTR ds:0x402054
  4017d8:	ff 25 44 20 40 00    	jmp    DWORD PTR ds:0x402044
  4017de:	ff 25 40 20 40 00    	jmp    DWORD PTR ds:0x402040
  4017e4:	ff 25 50 20 40 00    	jmp    DWORD PTR ds:0x402050
  4017ea:	ff 25 38 20 40 00    	jmp    DWORD PTR ds:0x402038
  4017f0:	ff 25 3c 20 40 00    	jmp    DWORD PTR ds:0x40203c
  4017f6:	ff 25 84 20 40 00    	jmp    DWORD PTR ds:0x402084
  4017fc:	ff 25 88 20 40 00    	jmp    DWORD PTR ds:0x402088
  401802:	ff 25 48 20 40 00    	jmp    DWORD PTR ds:0x402048
  401808:	ff 25 4c 20 40 00    	jmp    DWORD PTR ds:0x40204c
  40180e:	ff 25 30 20 40 00    	jmp    DWORD PTR ds:0x402030
  401814:	ff 25 2c 20 40 00    	jmp    DWORD PTR ds:0x40202c
  40181a:	ff 25 28 20 40 00    	jmp    DWORD PTR ds:0x402028
  401820:	ff 25 24 20 40 00    	jmp    DWORD PTR ds:0x402024
  401826:	ff 25 1c 20 40 00    	jmp    DWORD PTR ds:0x40201c
  40182c:	ff 25 18 20 40 00    	jmp    DWORD PTR ds:0x402018
  401832:	ff 25 14 20 40 00    	jmp    DWORD PTR ds:0x402014
  401838:	ff 25 10 20 40 00    	jmp    DWORD PTR ds:0x402010
  40183e:	ff 25 0c 20 40 00    	jmp    DWORD PTR ds:0x40200c
  401844:	ff 25 08 20 40 00    	jmp    DWORD PTR ds:0x402008
  40184a:	ff 25 04 20 40 00    	jmp    DWORD PTR ds:0x402004
  401850:	ff 25 00 20 40 00    	jmp    DWORD PTR ds:0x402000
