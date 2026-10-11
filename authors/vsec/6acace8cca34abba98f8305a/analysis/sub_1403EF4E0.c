__int64 *__fastcall sub_1403EF4E0(__int64 a1)
{
  __int64 *v1; // rax
  __int64 *v2; // rbx
  __int64 v3; // r14
  __int64 v4; // rsi
  __int64 v5; // rcx
  __int64 *v6; // rdx
  __int64 *v7; // rax
  __int64 v8; // rax
  __int64 v9; // rcx
  __int64 v10; // r8
  int v11; // r9d
  __int64 *v12; // r8
  __int64 **v13; // r11
  __int64 *v14; // rdx
  __int64 *v15; // rdx
  unsigned __int64 v16; // rcx
  unsigned __int64 v17; // rbx
  __int64 v18; // r8
  __int64 v19; // rax
  __int64 v20; // r8
  __int64 v21; // rsi
  __int64 *v22; // r11
  __int64 v23; // rsi
  __int64 v24; // rdi
  __int64 *v25; // r11
  __int64 v26; // rdx
  __int64 *result; // rax
  __int64 v28; // [rsp+0h] [rbp-30h]
  __int64 v29; // [rsp+10h] [rbp-20h]
  __int64 v30; // [rsp+18h] [rbp-18h]
  __int64 v31; // [rsp+20h] [rbp-10h]
  __int64 *v32; // [rsp+28h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+38h] [rbp+8h] BYREF
  __int64 *v34; // [rsp+40h] [rbp+10h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
    sub_1400787A0();
  if ( a1 == 0 )
    sub_14007A5E0(a1: 0);
  v34 = v1;
  v30 = *v2;
  v4 = *v2;
  if ( *v2 < 0 )
    v4 = -v30;
  if ( v30 != 0 )
  {
    v7 = (__int64 *)sub_1400201A0(a1: 1);
    *v7 = v4;
    v5 = 1;
    v6 = v7;
  }
  else
  {
    v5 = 0;
    v6 = nullptr;
  }
  v32 = v6;
  v29 = v5;
  v8 = sub_14001F280(a1: 1);
  *(_BYTE *)v8 = v30 < 0;
  *(_QWORD *)(v8 + 16) = v29;
  *(_QWORD *)(v8 + 24) = v29;
  if ( dword_14069FEF0 != 0 )
  {
    v8 = sub_14007A240(a1: v9, a2: *(_QWORD *)(v8 + 8), a3: v10);
    v12 = v32;
    *v13 = v32;
    v13[1] = v14;
  }
  else
  {
    v12 = v32;
  }
  *(_QWORD *)(v8 + 8) = v12;
  if ( v8 != 0 )
  {
    v15 = v34;
    v16 = v34[2];
    v17 = v34[1] + 1;
    v18 = *v34;
    if ( v16 < v17 )
    {
      v31 = v8;
      v19 = sub_140075980(a1: v16, a2: (_DWORD)v34, a3: v18, a4: v11);
      v15 = v34;
      v34[2] = v16;
      if ( dword_14069FEF0 != 0 )
      {
        v21 = *v34;
        v19 = sub_14007A240(a1: v16, a2: v34, a3: v20);
        *v22 = v19;
        v22[1] = v21;
      }
      *v15 = v19;
      v18 = v19;
      v8 = v31;
    }
    v15[1] = v17;
    v23 = 16 * (v17 - 1);
    *(_QWORD *)(v18 + v23) = &unk_1405BCA68;
    if ( dword_14069FEF0 != 0 )
    {
      v24 = *(_QWORD *)(v18 + v23 + 8);
      v8 = sub_14007A240(a1: v16, a2: v15, a3: v18);
      *v25 = v8;
      v25[1] = v24;
    }
    *(_QWORD *)(v18 + v23 + 8) = v8;
    v26 = v15[1];
  }
  else
  {
    v26 = 0;
  }
  v28 = v26;
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v28;
  return result;
}