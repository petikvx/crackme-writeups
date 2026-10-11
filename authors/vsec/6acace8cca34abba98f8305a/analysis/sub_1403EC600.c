bool __fastcall sub_1403EC600(__int64 a1)
{
  __int64 v1; // rbx
  __int64 v2; // rdi
  __int64 v3; // rsi
  __int64 v4; // r14
  __int128 v5; // xmm15
  __int64 v6; // rax
  __int64 v7; // rcx
  int v8; // r9d
  __int64 v9; // rdx
  _QWORD *v10; // r11
  __int64 v11; // r8
  __int64 v12; // rdx
  unsigned __int64 v13; // rcx
  unsigned __int64 v14; // rbx
  __int64 v15; // r8
  __int64 v16; // rax
  __int64 *v17; // rdx
  __int64 *v18; // r11
  __int64 v19; // r8
  __int64 v20; // r9
  __int64 v21; // r10
  _QWORD *v22; // r11
  __int64 v23; // rdx
  __int64 v24; // rdx
  __int64 v25; // r8
  unsigned __int64 v26; // rcx
  unsigned __int64 v27; // rbx
  __int64 v28; // r9
  __int64 v29; // rax
  __int64 *v30; // rdx
  __int64 *v31; // r11
  __int64 v32; // r8
  __int64 v33; // r10
  __int64 v34; // r12
  _QWORD *v35; // r11
  __int64 v36; // r8
  __int64 v37; // rbx
  _QWORD *v38; // rax
  __int64 v39; // rcx
  __int64 v41; // [rsp+0h] [rbp-28h]
  __int64 *v42; // [rsp+20h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+30h] [rbp+8h] BYREF
  __int64 v44; // [rsp+40h] [rbp+18h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v4 + 16) )
    sub_1400787A0();
  v44 = v1;
  v6 = sub_14001F280(a1: 1);
  *(_OWORD *)(v6 + 8) = v5;
  if ( dword_14069FEF0 != 0 )
  {
    v6 = sub_14007A240(a1: v7, a2: *(_QWORD *)v6, a3: *(_QWORD *)(v6 + 24));
    *v10 = v9;
    v10[1] = v11;
  }
  v42 = (__int64 *)v6;
  *(_QWORD *)v6 = 0;
  *(_QWORD *)(v6 + 24) = 0;
  v12 = v1;
  if ( v1 != 0 )
  {
    v13 = *(_QWORD *)(v6 + 16);
    v14 = *(_QWORD *)(v6 + 8) + 1LL;
    v15 = *(_QWORD *)v6;
    if ( v13 < v14 )
    {
      v16 = sub_140075980(a1: v13, a2: v44, a3: v15, a4: v8);
      v17 = v42;
      v42[2] = v13;
      if ( dword_14069FEF0 != 0 )
      {
        v16 = sub_14007A240(a1: v13, a2: v42, a3: *v42);
        *v18 = v16;
        v18[1] = v19;
      }
      *v17 = v16;
      v12 = v44;
      v15 = v16;
      v6 = (__int64)v42;
    }
    *(_QWORD *)(v6 + 8) = v14;
    v20 = 16 * (v14 - 1);
    *(_QWORD *)(v15 + v20) = v12;
    if ( dword_14069FEF0 != 0 )
    {
      v6 = sub_14007A240(a1: v13, a2: *(_QWORD *)(v15 + v20 + 8), a3: v15);
      v21 = a1;
      *v22 = a1;
      v22[1] = v23;
    }
    else
    {
      v21 = a1;
    }
    *(_QWORD *)(v15 + v20 + 8) = v21;
    v24 = *(_QWORD *)(v6 + 8);
  }
  else
  {
    v24 = 0;
  }
  v25 = v2;
  if ( v2 != 0 )
  {
    v26 = *(_QWORD *)(v6 + 16);
    v27 = *(_QWORD *)(v6 + 8) + 1LL;
    v28 = *(_QWORD *)v6;
    if ( v26 < v27 )
    {
      v41 = v24;
      v29 = sub_140075980(a1: v26, a2: v24, a3: v2, a4: v28);
      v30 = v42;
      v42[2] = v26;
      if ( dword_14069FEF0 != 0 )
      {
        v29 = sub_14007A240(a1: v26, a2: v42, a3: *v42);
        *v31 = v29;
        v31[1] = v32;
      }
      *v30 = v29;
      v25 = v2;
      v28 = v29;
      v6 = (__int64)v30;
      v24 = v41;
    }
    *(_QWORD *)(v6 + 8) = v27;
    v33 = 16 * (v27 - 1);
    *(_QWORD *)(v28 + v33) = v25;
    if ( dword_14069FEF0 != 0 )
    {
      v6 = sub_14007A240(a1: v26, a2: v24, a3: *(_QWORD *)(v28 + v33 + 8));
      v34 = v3;
      *v35 = v3;
      v35[1] = v36;
    }
    else
    {
      v34 = v3;
    }
    *(_QWORD *)(v28 + v33 + 8) = v34;
  }
  v37 = v6;
  v38 = (_QWORD *)sub_1403E4680();
  if ( v37 == 0 )
    sub_14007A5E0(a1: v39);
  return *v38 != 0;
}