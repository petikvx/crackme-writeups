__int64 *__fastcall sub_1403F0700(__int64 a1)
{
  __int64 *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // rdi
  __int64 v6; // rdx
  __int64 v7; // rdx
  __int64 v8; // rdx
  __int64 v9; // rax
  int v10; // r8d
  int v11; // r9d
  __int64 *v12; // rdx
  unsigned __int64 v13; // rcx
  unsigned __int64 v14; // rbx
  __int64 v15; // rsi
  __int64 v16; // rax
  __int64 v17; // r8
  __int64 v18; // rsi
  __int64 *v19; // r11
  __int64 v20; // rdi
  __int64 *v21; // r11
  __int64 v22; // r8
  __int64 *result; // rax
  __int64 v24; // [rsp+0h] [rbp-10h]
  __int64 v25; // [rsp+8h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+18h] [rbp+8h] BYREF
  __int64 *v27; // [rsp+20h] [rbp+10h]

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
    if ( v5 != &unk_1405B1698 )
      sub_14001A680(a1: &unk_1405E7330, a2: v6);
  }
  else
  {
    v6 = 0;
  }
  if ( v6 != 0 )
  {
    v27 = v1;
    v9 = sub_140072420(a1: 0);
    v12 = v27;
    v13 = v27[2];
    v14 = v27[1] + 1;
    v15 = *v27;
    if ( v13 < v14 )
    {
      v25 = v9;
      v16 = sub_140075980(a1: v13, a2: (_DWORD)v27, a3: v10, a4: v11);
      v12 = v27;
      v27[2] = v13;
      if ( dword_14069FEF0 != 0 )
      {
        v18 = *v27;
        v16 = sub_14007A240(a1: v13, a2: v27, a3: v17);
        *v19 = v16;
        v19[1] = v18;
      }
      *v12 = v16;
      v15 = v16;
      v9 = v25;
    }
    v12[1] = v14;
    v20 = 16 * (v14 - 1);
    *(_QWORD *)(v15 + v20) = &unk_1405C82B0;
    if ( dword_14069FEF0 != 0 )
    {
      v9 = sub_14007A240(a1: v13, a2: v12, a3: *(_QWORD *)(v15 + v20 + 8));
      *v21 = v9;
      v21[1] = v22;
    }
    *(_QWORD *)(v15 + v20 + 8) = v9;
    v8 = v12[1];
  }
  else
  {
    v8 = 0;
  }
  v24 = v8;
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v24;
  return result;
}