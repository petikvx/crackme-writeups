_QWORD *__fastcall sub_1403EF220(__int64 a1)
{
  __int64 *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // r9
  __int64 v6; // rdx
  __int64 v7; // rdx
  unsigned __int64 v8; // rcx
  unsigned __int64 v9; // rbx
  __int64 v10; // r10
  __int64 v11; // rax
  __int64 v12; // r8
  __int64 *v13; // rdx
  __int64 v14; // rsi
  __int64 *v15; // r11
  __int64 v16; // rsi
  bool v17; // zf
  __int64 v18; // rdi
  _QWORD *v19; // r11
  __int64 v20; // r8
  __int64 v21; // r9
  __int64 v22; // rdx
  _QWORD *result; // rax
  bool v24; // [rsp+1h] [rbp-19h]
  void *v25; // [rsp+2h] [rbp-18h]
  __int64 v26; // [rsp+Ah] [rbp-10h]
  __int64 v27; // [rsp+12h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+22h] [rbp+8h] BYREF
  __int64 *v29; // [rsp+2Ah] [rbp+10h]

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
      v6 = *(_QWORD *)(*v1 + v7 + 8);
    }
    else
    {
      v5 = nullptr;
      v6 = 0;
    }
    if ( v5 == nullptr )
      sub_14001A860(a1, a2: v6);
  }
  else
  {
    v5 = nullptr;
    v6 = 0;
  }
  if ( v5 != &unk_1405BCA68 )
    v6 = 0;
  if ( v6 != 0 )
  {
    v8 = v1[2];
    v9 = v1[1] + 1;
    v10 = *v1;
    if ( v8 < v9 )
    {
      v29 = v1;
      v27 = v6;
      v25 = v5;
      v11 = sub_140075980(a1: v8, a2: v6, a3: (unsigned int)&unk_1405BCA68, a4: (_DWORD)v5);
      v13 = v29;
      v29[2] = v8;
      if ( dword_14069FEF0 != 0 )
      {
        v14 = *v29;
        v11 = sub_14007A240(a1: v8, a2: v29, a3: v12);
        *v15 = v11;
        v15[1] = v14;
      }
      *v13 = v11;
      v5 = v25;
      v10 = v11;
      v1 = v13;
      v6 = v27;
    }
    v1[1] = v9;
    v16 = 16 * (v9 - 1);
    *(_QWORD *)(v10 + v16) = &unk_1405BCA68;
    if ( dword_14069FEF0 != 0 )
    {
      v18 = *(_QWORD *)(v10 + v16 + 8);
      v1 = (__int64 *)sub_14007A240(a1: v8, a2: v6, a3: &unk_1405BCA68);
      *v19 = v6;
      v19[1] = v18;
      v17 = v21 == v20;
    }
    else
    {
      v17 = v5 == &unk_1405BCA68;
    }
    *(_QWORD *)(v10 + v16 + 8) = v6;
    v22 = v1[1];
  }
  else
  {
    v17 = v5 == &unk_1405BCA68;
    v22 = 0;
  }
  v26 = v22;
  v24 = v17;
  result = (_QWORD *)sub_140020480(a1: 1);
  *result = v26;
  result[1] = v24;
  return result;
}