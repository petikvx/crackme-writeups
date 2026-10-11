__int64 *__fastcall sub_1403EFD20(unsigned __int64 a1)
{
  __int64 *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // r8
  _QWORD *v6; // rdx
  __int64 v7; // rdx
  __int64 v8; // rbx
  __int64 v9; // rax
  __int64 v10; // rcx
  int v11; // r9d
  _QWORD *v12; // rdx
  __int64 *v13; // r11
  __int64 v14; // r8
  __int64 *v15; // r8
  unsigned __int64 v16; // rcx
  unsigned __int64 v17; // rbx
  __int64 v18; // rax
  __int64 v19; // r8
  __int64 *v20; // rdx
  __int64 v21; // rsi
  __int64 *v22; // r11
  __int64 v23; // rsi
  __int64 v24; // rdi
  _QWORD *v25; // r11
  __int64 *result; // rax
  __int64 v27; // [rsp+0h] [rbp-10h]
  _QWORD *v28; // [rsp+8h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+18h] [rbp+8h] BYREF
  __int64 *v30; // [rsp+20h] [rbp+10h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
    sub_1400787A0();
  if ( a1 == 0 )
    sub_14007A5E0(a1: 0);
  v4 = *v2;
  if ( *v2 != 0 )
  {
    if ( v1[1] >= v4 )
    {
      v7 = 16 * (v4 - 1);
      v5 = *(void **)(*v1 + v7);
      v6 = *(_QWORD **)(*v1 + v7 + 8);
    }
    else
    {
      v5 = nullptr;
      v6 = nullptr;
    }
    if ( v5 != &unk_1405BCA68 )
      sub_14001A680(a1: &unk_1405E7330, a2: v6);
  }
  else
  {
    v6 = nullptr;
  }
  if ( a1 <= 1 )
    sub_14007A5E0(a1);
  v30 = v1;
  v28 = v6;
  v8 = v6[2];
  v9 = sub_140372340(a1: v6[3]);
  v12 = v28;
  v28[2] = v8;
  v28[3] = v10;
  if ( dword_14069FEF0 != 0 )
  {
    v9 = sub_14007A240(a1: v10, a2: v28, a3: v28[1]);
    *v13 = v9;
    v13[1] = v14;
  }
  v12[1] = v9;
  *(_BYTE *)v12 = 0;
  v15 = v30;
  v16 = v30[2];
  v17 = v30[1] + 1;
  v18 = *v30;
  if ( v16 < v17 )
  {
    v18 = sub_140075980(a1: v16, a2: (_DWORD)v12, a3: (_DWORD)v30, a4: v11);
    v20 = v30;
    v30[2] = v16;
    if ( dword_14069FEF0 != 0 )
    {
      v21 = *v30;
      v18 = sub_14007A240(a1: v16, a2: v30, a3: v19);
      *v22 = v18;
      v22[1] = v21;
    }
    *v20 = v18;
    v15 = v20;
    v12 = v28;
  }
  v15[1] = v17;
  v23 = 16 * (v17 - 1);
  *(_QWORD *)(v18 + v23) = &unk_1405BCA68;
  if ( dword_14069FEF0 != 0 )
  {
    v24 = *(_QWORD *)(v18 + v23 + 8);
    v18 = sub_14007A240(a1: v16, a2: v12, a3: v15);
    *v25 = v12;
    v25[1] = v24;
  }
  *(_QWORD *)(v18 + v23 + 8) = v12;
  v27 = v15[1];
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v27;
  return result;
}