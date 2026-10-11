__int64 *__fastcall sub_1403F08A0(__int64 a1)
{
  __int64 *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // rdi
  __int64 v6; // rdx
  __int64 v7; // rdx
  __int64 v8; // rcx
  __int64 v9; // rdx
  __int64 v10; // rax
  int v11; // r8d
  int v12; // r9d
  __int64 *v13; // rdx
  unsigned __int64 v14; // rcx
  unsigned __int64 v15; // rbx
  __int64 v16; // rsi
  __int64 v17; // rax
  __int64 v18; // r8
  __int64 v19; // rsi
  __int64 *v20; // r11
  __int64 v21; // rdi
  __int64 *v22; // r11
  __int64 v23; // r8
  __int64 *result; // rax
  __int64 v25; // [rsp+0h] [rbp-10h]
  __int64 v26; // [rsp+8h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+18h] [rbp+8h] BYREF
  __int64 *v28; // [rsp+20h] [rbp+10h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
    sub_1400787A0();
  if ( a1 == 0 )
    sub_14007A5E0();
  v28 = v1;
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
    if ( v5 != &unk_1405C82B0 )
      sub_14001A680(a1: &unk_1405E7330, a2: v6);
    v8 = *(_QWORD *)(v6 + 16);
  }
  else
  {
    v8 = 0;
  }
  if ( sub_1403BFCE0(a1: v8) != 0 )
  {
    v10 = sub_140072420();
    v13 = v28;
    v14 = v28[2];
    v15 = v28[1] + 1;
    v16 = *v28;
    if ( v14 < v15 )
    {
      v26 = v10;
      v17 = sub_140075980(a1: v14, a2: (_DWORD)v28, a3: v11, a4: v12);
      v13 = v28;
      v28[2] = v14;
      if ( dword_14069FEF0 != 0 )
      {
        v19 = *v28;
        v17 = sub_14007A240(a1: v14, a2: v28, a3: v18);
        *v20 = v17;
        v20[1] = v19;
      }
      *v13 = v17;
      v16 = v17;
      v10 = v26;
    }
    v13[1] = v15;
    v21 = 16 * (v15 - 1);
    *(_QWORD *)(v16 + v21) = &unk_1405C82B0;
    if ( dword_14069FEF0 != 0 )
    {
      v10 = sub_14007A240(a1: v14, a2: v13, a3: *(_QWORD *)(v16 + v21 + 8));
      *v22 = v10;
      v22[1] = v23;
    }
    *(_QWORD *)(v16 + v21 + 8) = v10;
    v9 = v13[1];
  }
  else
  {
    v9 = 0;
  }
  v25 = v9;
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v25;
  return result;
}