  455410:	68 01 55 45 00       	push   $0x455501
  455415:	64 ff 30             	push   %fs:(%eax)
  455418:	64 89 20             	mov    %esp,%fs:(%eax)
  45541b:	8d 55 fc             	lea    -0x4(%ebp),%edx
  45541e:	8b 83 c4 02 00 00    	mov    0x2c4(%ebx),%eax
  455424:	e8 fb e1 fc ff       	call   0x423624
  455429:	8d 55 f8             	lea    -0x8(%ebp),%edx
  45542c:	8b 83 c8 02 00 00    	mov    0x2c8(%ebx),%eax
  455432:	e8 ed e1 fc ff       	call   0x423624
  455437:	8d 45 f4             	lea    -0xc(%ebp),%eax
  45543a:	8b 4d f8             	mov    -0x8(%ebp),%ecx
  45543d:	8b 55 fc             	mov    -0x4(%ebp),%edx
  455440:	e8 6b e6 fa ff       	call   0x403ab0
  455445:	8d 55 f0             	lea    -0x10(%ebp),%edx
  455448:	8b 83 cc 02 00 00    	mov    0x2cc(%ebx),%eax
  45544e:	e8 d1 e1 fc ff       	call   0x423624
  455453:	8b 45 f0             	mov    -0x10(%ebp),%eax
  455456:	e8 45 22 fb ff       	call   0x4076a0
  45545b:	8b 45 f0             	mov    -0x10(%ebp),%eax
  45545e:	e8 01 e6 fa ff       	call   0x403a64
  455463:	8b f0                	mov    %eax,%esi
  455465:	85 f6                	test   %esi,%esi
  455467:	7e 75                	jle    0x4554de
  455469:	bf 01 00 00 00       	mov    $0x1,%edi
  45546e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  455471:	e8 ee e5 fa ff       	call   0x403a64
  455476:	50                   	push   %eax
  455477:	6b c7 7b             	imul   $0x7b,%edi,%eax
  45547a:	5a                   	pop    %edx
  45547b:	8b ca                	mov    %edx,%ecx
  45547d:	99                   	cltd
  45547e:	f7 f9                	idiv   %ecx
  455480:	c1 e0 05             	shl    $0x5,%eax
  455483:	2d 5c 11 2c 00       	sub    $0x2c115c,%eax
  455488:	05 b0 2e 87 00       	add    $0x872eb0,%eax
  45548d:	83 f0 12             	xor    $0x12,%eax
  455490:	89 45 e8             	mov    %eax,-0x18(%ebp)
  455493:	8d 55 ec             	lea    -0x14(%ebp),%edx
  455496:	8b 45 e8             	mov    -0x18(%ebp),%eax
  455499:	e8 d2 21 fb ff       	call   0x407670
  45549e:	8d 55 e4             	lea    -0x1c(%ebp),%edx
  4554a1:	8b 83 cc 02 00 00    	mov    0x2cc(%ebx),%eax
  4554a7:	e8 78 e1 fc ff       	call   0x423624
  4554ac:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  4554af:	8b 55 ec             	mov    -0x14(%ebp),%edx
  4554b2:	e8 bd e6 fa ff       	call   0x403b74
  4554b7:	75 21                	jne    0x4554da
  4554b9:	6a 00                	push   $0x0
  4554bb:	8d 55 e4             	lea    -0x1c(%ebp),%edx
  4554be:	8b 83 e8 02 00 00    	mov    0x2e8(%ebx),%eax
  4554c4:	e8 5b e1 fc ff       	call   0x423624
  4554c9:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  4554cc:	66 8b 0d 10 55 45 00 	mov    0x455510,%cx
  4554d3:	b2 02                	mov    $0x2,%dl
  4554d5:	e8 1e c2 fe ff       	call   0x4416f8
  4554da:	47                   	inc    %edi
  4554db:	4e                   	dec    %esi
  4554dc:	75 90                	jne    0x45546e
  4554de:	33 c0                	xor    %eax,%eax
  4554e0:	5a                   	pop    %edx
  4554e1:	59                   	pop    %ecx
  4554e2:	59                   	pop    %ecx
  4554e3:	64 89 10             	mov    %edx,%fs:(%eax)
  4554e6:	68 08 55 45 00       	push   $0x455508
  4554eb:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  4554ee:	e8 f5 e2 fa ff       	call   0x4037e8
  4554f3:	8d 45 ec             	lea    -0x14(%ebp),%eax
  4554f6:	ba 05 00 00 00       	mov    $0x5,%edx
  4554fb:	e8 0c e3 fa ff       	call   0x40380c
  455500:	c3                   	ret
  455501:	e9 a2 dd fa ff       	jmp    0x4032a8
  455506:	eb e3                	jmp    0x4554eb
