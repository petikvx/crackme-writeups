unsigned __int64 __fastcall sub_1403EBDC0(__int64 a1)
{
  __int64 v1; // rax
  unsigned __int64 v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  unsigned __int64 i; // rsi
  unsigned __int64 v6; // rdx
  unsigned __int64 v7; // r8
  unsigned __int64 v8; // r9
  unsigned __int64 v9; // r9
  unsigned __int64 v10; // r10
  unsigned __int64 v11; // r9
  __int64 v12; // r10
  __int64 v13; // r12
  unsigned __int64 v14; // r15
  unsigned __int64 v15; // rbx
  __int64 v16; // rcx
  unsigned __int64 v17; // r13
  unsigned __int64 v18; // r9
  _UNKNOWN *retaddr; // [rsp+10h] [rbp+8h] BYREF
  __int64 v21; // [rsp+28h] [rbp+20h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
    sub_1400787A0();
  v21 = a1;
  v4 = qword_14061C598;
  for ( i = 0; (__int64)v2 > (__int64)i; i += v13 )
  {
    v7 = qword_14061C588 ^ qword_14061C570 ^ (0x9E3779B97F4A7C15uLL * i) ^ (i << 17);
    v8 = ((0xBF58476D1CE4E5B9uLL * ((v7 >> 30) ^ v7)) >> 27) ^ (0xBF58476D1CE4E5B9uLL * ((v7 >> 30) ^ v7));
    v9 = 0xBF58476D1CE4E5B9uLL
       * (((0x94D049BB133111EBuLL * v8) >> 31)
        ^ (0x94D049BB133111EBuLL * v8)
        ^ ((((0x94D049BB133111EBuLL * v8) >> 31) ^ (0x94D049BB133111EBuLL * v8)) >> 30));
    v10 = ((0x94D049BB133111EBuLL * ((v9 >> 27) ^ v9)) >> 31) ^ (0x94D049BB133111EBuLL * ((v9 >> 27) ^ v9));
    if ( v2 <= i )
      sub_14007A5E0(a1);
    v11 = ((0x94D049BB133111EBuLL * ((v9 >> 27) ^ v9)) >> 31) ^ (0x94D049BB133111EBuLL * ((v9 >> 27) ^ v9));
    v12 = byte_1406A0780[(unsigned __int8)(v10 ^ *(_BYTE *)(v1 + i) ^ BYTE1(v10) ^ BYTE2(v10))];
    if ( (unsigned __int8)v12 > 7u )
    {
      if ( (unsigned __int8)(v12 - 45) <= 6u || (_BYTE)v12 == 55 )
      {
LABEL_13:
        v13 = 9;
        goto LABEL_15;
      }
    }
    else if ( (_BYTE)v12 != 0 && ((unsigned __int8)v12 <= 2u || (unsigned __int8)v12 >= 6u) )
    {
      goto LABEL_13;
    }
    v13 = 1;
LABEL_15:
    if ( v13 <= 1 )
    {
      v18 = 0;
    }
    else
    {
      v14 = v2;
      v15 = v2 - i - 1;
      v16 = (__int64)(1 - (a1 - i)) >> 63;
      if ( v15 == 0 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 1 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 2 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 3 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 4 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 5 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 6 )
        sub_14007A5E0(a1: v16);
      if ( v15 <= 7 )
        sub_14007A5E0(a1: v16);
      v17 = 0x94D049BB133111EBuLL
          * (((0xBF58476D1CE4E5B9uLL * (v11 ^ ((v11 ^ 0xD6E8FEB86659FD93uLL) >> 30) ^ 0xD6E8FEB86659FD93uLL)) >> 27)
           ^ (0xBF58476D1CE4E5B9uLL * (v11 ^ ((v11 ^ 0xD6E8FEB86659FD93uLL) >> 30) ^ 0xD6E8FEB86659FD93uLL)));
      v18 = *(_QWORD *)(v1 + (v16 & (i + 1))) ^ v17 ^ (v17 >> 31);
      a1 = v21;
      v2 = v14;
    }
    v6 = 0xBF58476D1CE4E5B9uLL * (((i ^ v18 ^ v12 ^ v4) >> 30) ^ i ^ v18 ^ v12 ^ v4);
    v4 = ((0x94D049BB133111EBuLL * ((v6 >> 27) ^ v6)) >> 31) ^ (0x94D049BB133111EBuLL * ((v6 >> 27) ^ v6));
  }
  return v4;
}