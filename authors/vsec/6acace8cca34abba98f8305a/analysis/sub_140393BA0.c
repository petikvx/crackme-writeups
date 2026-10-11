__int64 __fastcall sub_140393BA0(int a1)
{
  __int64 v1; // rax
  __int64 v2; // rbx
  _QWORD *v3; // rdi
  unsigned __int64 v4; // rsi
  __int64 v5; // r14
  __int128 v6; // xmm15
  __int128 *v7; // rdx
  __int64 v8; // rax
  int v9; // r9d
  _QWORD *v10; // rdx
  __int64 v11; // rcx
  __int64 v12; // rbx
  __int64 v13; // rax
  int v14; // edx
  _QWORD *v15; // r8
  __int64 v16; // r9
  _QWORD *v17; // r10
  __int64 v18; // rcx
  int v19; // r9d
  _QWORD *v20; // rbx
  __int64 v21; // rax
  __int64 v22; // rcx
  __int64 v23; // rdx
  __int64 v24; // r8
  __int128 *v25; // rdi
  __int64 *v26; // r11
  __int64 v27; // r9
  __int64 v28; // r10
  __int64 v29; // rax
  __int64 v30; // rcx
  __int64 v31; // r8
  __int128 *v32; // rdi
  __int64 *v33; // r11
  __int64 v34; // r9
  __int64 v35; // r10
  __int64 v36; // rbx
  __int64 result; // rax
  __int64 v38; // rdx
  __int64 v39; // rcx
  __int64 v40; // rbx
  __int64 v41; // rax
  __int64 v42; // rcx
  __int64 v43; // rdx
  __int64 v44; // rsi
  _QWORD *v45; // r11
  __int64 v46; // r8
  __int64 v47; // [rsp-10h] [rbp-A8h]
  __int64 v48; // [rsp+0h] [rbp-98h]
  __int64 v49; // [rsp+8h] [rbp-90h]
  __int64 v50; // [rsp+10h] [rbp-88h]
  __int64 v51; // [rsp+18h] [rbp-80h]
  __int64 v52; // [rsp+20h] [rbp-78h]
  __int64 v53; // [rsp+28h] [rbp-70h]
  _QWORD *v55; // [rsp+38h] [rbp-60h]
  _QWORD *v56; // [rsp+50h] [rbp-48h] BYREF
  __int128 *v57; // [rsp+58h] [rbp-40h]
  __int64 v58; // [rsp+60h] [rbp-38h]
  _QWORD *v59; // [rsp+68h] [rbp-30h]
  __int64 v60; // [rsp+70h] [rbp-28h]
  __int64 v61; // [rsp+78h] [rbp-20h]
  __int128 v62; // [rsp+80h] [rbp-18h] BYREF
  __int64 v63; // [rsp+90h] [rbp-8h]

  if ( (unsigned __int64)&v56 <= *(_QWORD *)(v5 + 16) )
    sub_1400787A0();
  v61 = v2;
  v60 = v1;
  if ( v4 > 1 )
  {
    v7 = (__int128 *)sub_1400758A0(a1: v4);
  }
  else
  {
    v62 = v6;
    v63 = 0;
    v7 = &v62;
  }
  v57 = v7;
  v8 = sub_1402C6340();
  v51 = v8;
  v10 = v3;
  v11 = 0;
  while ( (__int64)v4 > v11 )
  {
    v50 = v11;
    v59 = v10;
    v55 = (_QWORD *)v10[1];
    v48 = *v10;
    if ( (*(unsigned __int8 (**)(void))(v8 + 168))() == 0 )
    {
      v12 = v50;
LABEL_11:
      (*(void (**)(void))(v51 + 152))();
      goto LABEL_13;
    }
    v12 = v50;
    if ( v50 < (*(__int64 (**)(void))(v51 + 240))() - 1 )
      goto LABEL_11;
    v12 = (*(__int64 (**)(void))(v51 + 240))() - 1;
    v13 = (*(__int64 (**)(void))(v51 + 152))();
    (*(void (**)(void))(v13 + 88))();
LABEL_13:
    v14 = v48;
    if ( v48 != 0 )
    {
      v15 = v55;
      if ( (_UNKNOWN *)v48 == &unk_1406133A8 )
      {
        v16 = *v55;
        v17 = (_QWORD *)v55[1];
        v18 = v55[2];
      }
      else
      {
        LODWORD(v18) = 0;
        LODWORD(v16) = 0;
        v17 = nullptr;
      }
      if ( (_UNKNOWN *)v48 == &unk_1406133A8 )
      {
        v14 = v16;
        v15 = v17;
        v19 = v18;
      }
      else
      {
        v56 = v55;
        v19 = *(unsigned __int8 *)(v48 + 23) | 0x80;
        if ( (*(_BYTE *)(v48 + 20) & 0x20) != 0 )
          v19 = *(unsigned __int8 *)(v48 + 23);
      }
      v20 = v15;
      v21 = sub_1403939A0(a1: v19, a2: v14, a3: (_DWORD)v15, a4: v19, a5: v47);
      v23 = v50;
      v24 = 3 * v50;
      v25 = v57;
      *((_QWORD *)v57 + 3 * v50 + 2) = v22;
      if ( dword_14069FEF0 != 0 )
      {
        v21 = sub_14007A280(a1: v22, a2: v50, a3: 3 * v50, a4: *((_QWORD *)v25 + 3 * v50));
        *v26 = v21;
        v26[1] = v27;
        v26[2] = (__int64)v20;
        v26[3] = v28;
      }
      *((_QWORD *)v25 + v24) = v21;
      *((_QWORD *)v25 + v24 + 1) = v20;
    }
    else
    {
      v29 = sub_1402C8600();
      v23 = v50;
      v32 = v57;
      *((_QWORD *)v57 + 3 * v50 + 2) = v30;
      if ( dword_14069FEF0 != 0 )
      {
        v29 = sub_14007A280(a1: v30, a2: v50, a3: v31, a4: *((_QWORD *)v32 + 3 * v50));
        *v33 = v29;
        v33[1] = v34;
        v33[2] = v12;
        v33[3] = v35;
      }
      *((_QWORD *)v32 + 3 * v50) = v29;
      *((_QWORD *)v32 + 3 * v50 + 1) = v12;
    }
    v9 = (_DWORD)v59 + 16;
    v11 = v23 + 1;
    v8 = v51;
    v10 = v59 + 2;
  }
  v36 = v61;
  v58 = sub_1402BB420(a1, a2: (_DWORD)v10, a3: v4, a4: v9, a5: v47);
  v52 = v36;
  result = sub_1400758A0(a1: v36);
  v61 = result;
  v38 = v58;
  v39 = 0;
  while ( v52 > v39 )
  {
    v49 = v39;
    v59 = (_QWORD *)v38;
    v40 = *(_QWORD *)(v38 + 8);
    v53 = 16 * v39;
    v41 = sub_1403297E0(a1: *(_QWORD *)(v38 + 16));
    v43 = v53;
    v44 = v61;
    *(_QWORD *)(v61 + v53) = v41;
    if ( dword_14069FEF0 != 0 )
    {
      sub_14007A240(a1: v42, a2: v53, a3: *(_QWORD *)(v44 + v53 + 8));
      *v45 = v40;
      v45[1] = v46;
    }
    *(_QWORD *)(v44 + v43 + 8) = v40;
    v38 = (__int64)(v59 + 3);
    v39 = v49 + 1;
    result = v44;
  }
  return result;
}