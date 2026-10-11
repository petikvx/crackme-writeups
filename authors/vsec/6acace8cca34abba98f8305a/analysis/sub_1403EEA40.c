__int64 __fastcall sub_1403EEA40(__int64 a1, _QWORD *a2)
{
  char v2; // al
  __int64 v3; // r14
  _BYTE *v4; // r8
  __int64 *v5; // r9
  unsigned __int64 v6; // rcx
  unsigned __int64 v7; // rbx
  __int64 v8; // rdx
  __int64 v9; // r11
  char v10; // r10
  __int64 v11; // rax
  __int64 v12; // r8
  __int64 *v13; // rdx
  __int64 v14; // rcx
  __int64 *v15; // r11
  __int64 v16; // rcx
  char v18; // [rsp+1h] [rbp-19h]
  __int64 *v19; // [rsp+2h] [rbp-18h]
  _BYTE *v20; // [rsp+Ah] [rbp-10h]
  __int64 v21; // [rsp+12h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+22h] [rbp+8h] BYREF
  char v23; // [rsp+2Ah] [rbp+10h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
    sub_140078720();
  v4 = (_BYTE *)a2[2];
  v5 = (__int64 *)a2[1];
  v6 = v5[2];
  v7 = v5[1] + 1;
  v8 = a2[3];
  v9 = *v5;
  v10 = v2 + *v4;
  if ( v6 < v7 )
  {
    v23 = v2;
    v19 = v5;
    v20 = v4;
    v21 = v8;
    v18 = v2 + *v4;
    v11 = sub_140075980(a1: v6, a2: v8, a3: (_DWORD)v4, a4: (_DWORD)v5);
    v13 = v19;
    v19[2] = v14;
    if ( dword_14069FEF0 != 0 )
    {
      v11 = sub_14007A240(a1: *v19, a2: v19, a3: v12);
      *v15 = v11;
      v15[1] = v16;
    }
    *v13 = v11;
    v4 = v20;
    v5 = v13;
    v10 = v18;
    v9 = v11;
    v2 = v23;
    v8 = v21;
  }
  v5[1] = v7;
  *(_BYTE *)(v7 + v9 - 1) = v10;
  *v4 += v2;
  return *(_QWORD *)v8;
}