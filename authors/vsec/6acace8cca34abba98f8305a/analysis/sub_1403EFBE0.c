__int64 *__fastcall sub_1403EFBE0()
{
  __int64 *v0; // rax
  __int64 v1; // r14
  __int64 v2; // rax
  int v3; // r9d
  __int64 *v4; // rdx
  unsigned __int64 v5; // rcx
  unsigned __int64 v6; // rbx
  __int64 v7; // r8
  __int64 v8; // rax
  __int64 v9; // r8
  __int64 v10; // rsi
  __int64 *v11; // r11
  __int64 v12; // rsi
  __int64 v13; // rdi
  __int64 *v14; // r11
  __int64 v15; // rdx
  __int64 *result; // rax
  __int64 v17; // [rsp+0h] [rbp-10h]
  __int64 v18; // [rsp+8h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+18h] [rbp+8h] BYREF
  __int64 *v20; // [rsp+20h] [rbp+10h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v1 + 16) )
    sub_1400787A0();
  v20 = v0;
  v2 = sub_14001F280(a1: 1);
  if ( v2 != 0 )
  {
    v4 = v20;
    v5 = v20[2];
    v6 = v20[1] + 1;
    v7 = *v20;
    if ( v5 < v6 )
    {
      v18 = v2;
      v8 = sub_140075980(a1: v5, a2: (_DWORD)v20, a3: v7, a4: v3);
      v4 = v20;
      v20[2] = v5;
      if ( dword_14069FEF0 != 0 )
      {
        v10 = *v20;
        v8 = sub_14007A240(a1: v5, a2: v20, a3: v9);
        *v11 = v8;
        v11[1] = v10;
      }
      *v4 = v8;
      v7 = v8;
      v2 = v18;
    }
    v4[1] = v6;
    v12 = 16 * (v6 - 1);
    *(_QWORD *)(v7 + v12) = &unk_1405BCA68;
    if ( dword_14069FEF0 != 0 )
    {
      v13 = *(_QWORD *)(v7 + v12 + 8);
      v2 = sub_14007A240(a1: v5, a2: v4, a3: v7);
      *v14 = v2;
      v14[1] = v13;
    }
    *(_QWORD *)(v7 + v12 + 8) = v2;
    v15 = v4[1];
  }
  else
  {
    v15 = 0;
  }
  v17 = v15;
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v17;
  return result;
}