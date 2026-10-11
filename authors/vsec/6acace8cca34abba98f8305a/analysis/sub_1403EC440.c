__int64 __fastcall sub_1403EC440()
{
  __int64 v0; // rax
  __int64 v1; // rbx
  __int64 v2; // r14
  __int128 v3; // xmm15
  __int64 v4; // rax
  __int64 v5; // rcx
  int v6; // r9d
  __int64 v7; // rdx
  _QWORD *v8; // r11
  __int64 v9; // r8
  __int64 v10; // rdx
  unsigned __int64 v11; // rcx
  unsigned __int64 v12; // rbx
  __int64 v13; // r8
  __int64 v14; // rax
  __int64 *v15; // rdx
  __int64 *v16; // r11
  __int64 v17; // r8
  __int64 v18; // r9
  __int64 v19; // r10
  _QWORD *v20; // r11
  __int64 v21; // rdx
  __int64 v22; // rbx
  unsigned __int64 *v23; // rax
  __int64 v24; // rcx
  unsigned __int64 v25; // rdx
  void *v26; // rax
  __int64 v27; // rdx
  __int64 v28; // rdx
  __int64 *v30; // [rsp+8h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+18h] [rbp+8h] BYREF
  __int64 v32; // [rsp+20h] [rbp+10h]
  __int64 v33; // [rsp+28h] [rbp+18h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v2 + 16) )
    sub_1400787A0();
  v33 = v1;
  v32 = v0;
  v4 = sub_14001F280(a1: 1);
  *(_OWORD *)(v4 + 8) = v3;
  if ( dword_14069FEF0 != 0 )
  {
    v4 = sub_14007A240(a1: v5, a2: *(_QWORD *)v4, a3: *(_QWORD *)(v4 + 24));
    *v8 = v7;
    v8[1] = v9;
  }
  v30 = (__int64 *)v4;
  *(_QWORD *)v4 = 0;
  *(_QWORD *)(v4 + 24) = 0;
  v10 = v32;
  if ( v32 != 0 )
  {
    v11 = *(_QWORD *)(v4 + 16);
    v12 = *(_QWORD *)(v4 + 8) + 1LL;
    v13 = *(_QWORD *)v4;
    if ( v11 < v12 )
    {
      v14 = sub_140075980(a1: v11, a2: v32, a3: v13, a4: v6);
      v15 = v30;
      v30[2] = v11;
      if ( dword_14069FEF0 != 0 )
      {
        v14 = sub_14007A240(a1: v11, a2: v30, a3: *v30);
        *v16 = v14;
        v16[1] = v17;
      }
      *v15 = v14;
      v10 = v32;
      v13 = v14;
      v4 = (__int64)v30;
    }
    *(_QWORD *)(v4 + 8) = v12;
    v18 = 16 * (v12 - 1);
    *(_QWORD *)(v13 + v18) = v10;
    if ( dword_14069FEF0 != 0 )
    {
      v4 = sub_14007A240(a1: v11, a2: *(_QWORD *)(v13 + v18 + 8), a3: v13);
      v19 = v33;
      *v20 = v33;
      v20[1] = v21;
    }
    else
    {
      v19 = v33;
    }
    *(_QWORD *)(v13 + v18 + 8) = v19;
  }
  v22 = v4;
  v23 = (unsigned __int64 *)sub_1403E4680();
  if ( v22 == 0 )
    sub_14007A5E0(a1: v24);
  v25 = *v23;
  if ( *v23 == 0 )
    return 0;
  if ( v30[1] >= v25 )
  {
    v28 = 16 * (v25 - 1);
    v26 = *(void **)(*v30 + v28);
    v27 = *(_QWORD *)(*v30 + v28 + 8);
  }
  else
  {
    v26 = nullptr;
    v27 = 0;
  }
  if ( v26 != &unk_1405BCA68 )
    sub_14001A680(a1: &unk_1405E7330, a2: v27);
  return v27;
}