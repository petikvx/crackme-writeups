__int64 __fastcall sub_1403EBBE0()
{
  _QWORD *v0; // rax
  __int64 v1; // rbx
  __int64 v2; // r14
  __int64 v3; // rcx
  __int64 i; // rdx
  _QWORD *v5; // rsi
  signed __int64 v6; // rdi
  __int64 v7; // r8
  __int64 v8; // rax
  __int64 v9; // r9
  __int64 v10; // rdx
  unsigned __int64 j; // r10
  unsigned __int64 v12; // rcx
  unsigned __int64 v13; // rcx
  unsigned __int64 v14; // r11
  __int64 v15; // r12
  unsigned __int64 v16; // rdi
  unsigned __int64 v17; // r13
  __int64 v18; // r10
  __int64 k; // rax
  unsigned __int64 v20; // rcx
  unsigned __int64 v21; // rcx
  _UNKNOWN *retaddr; // [rsp+8h] [rbp+8h] BYREF

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v2 + 16) )
    sub_1400787A0();
  v3 = qword_14061C588 ^ qword_14061C570;
  for ( i = 0; v1 > i; i = v9 + 1 )
  {
    v5 = v0;
    v6 = v0[1];
    v7 = *v0;
    v8 = v0[2];
    v9 = i;
    v10 = i << 32;
    for ( j = 0; ; j = v14 )
    {
      v14 = j + 8;
      if ( v6 < (__int64)(j + 8) )
        break;
      if ( j > v6 )
        sub_14007A5E0(a1: v3);
      v15 = v6;
      v16 = v6 - j;
      v17 = j;
      v18 = j & ((__int64)(j - v8) >> 63);
      if ( v16 == 0 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 1 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 2 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 3 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 4 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 5 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 6 )
        sub_14007A5E0(a1: v3);
      if ( v16 <= 7 )
        sub_14007A5E0(a1: v3);
      v12 = v10 ^ v17 ^ *(_QWORD *)(v7 + v18) ^ v3;
      v13 = 0x94D049BB133111EBuLL
          * (((0xBF58476D1CE4E5B9uLL * ((v12 >> 30) ^ v12)) >> 27) ^ (0xBF58476D1CE4E5B9uLL * ((v12 >> 30) ^ v12)));
      v3 = (v13 >> 31) ^ v13;
      v6 = v15;
    }
    for ( k = v6 - (v6 & 7); k < v6; ++k )
    {
      v20 = (k << 8) ^ *(unsigned __int8 *)(v7 + k) ^ (unsigned __int64)v3;
      v21 = 0x94D049BB133111EBuLL
          * (((0xBF58476D1CE4E5B9uLL * ((v20 >> 30) ^ v20)) >> 27) ^ (0xBF58476D1CE4E5B9uLL * ((v20 >> 30) ^ v20)));
      v3 = (v21 >> 31) ^ v21;
    }
    v0 = v5 + 3;
  }
  return v3;
}