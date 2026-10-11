__int64 __fastcall sub_1403EEEA0(__int64 a1, _QWORD *a2)
{
  char v2; // al
  __int64 v3; // r14
  _BYTE *v4; // r8
  __int64 *v5; // r9
  unsigned __int64 v6; // rcx
  unsigned __int64 v7; // rbx
  __int64 v8; // rdx
  __int64 v9; // r11
  char v10; // r12
  char v11; // al
  __int64 v12; // rax
  __int64 v13; // r8
  __int64 *v14; // rdx
  __int64 v15; // rcx
  __int64 *v16; // r11
  __int64 v17; // rcx
  char v19; // [rsp+0h] [rbp-1Ah]
  __int64 v20; // [rsp+2h] [rbp-18h]
  __int64 *v21; // [rsp+Ah] [rbp-10h]
  _BYTE *v22; // [rsp+12h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+22h] [rbp+8h] BYREF

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
    sub_140078720();
  v4 = (_BYTE *)a2[2];
  v5 = (__int64 *)a2[1];
  v6 = v5[2];
  v7 = v5[1] + 1;
  v8 = a2[3];
  v9 = *v5;
  v10 = v2;
  v11 = v2 - *v4;
  if ( v6 < v7 )
  {
    v21 = v5;
    v22 = v4;
    v20 = v8;
    v19 = v11;
    v12 = sub_140075980(a1: v6, a2: v8, a3: (_DWORD)v4, a4: (_DWORD)v5);
    v14 = v21;
    v21[2] = v15;
    if ( dword_14069FEF0 != 0 )
    {
      v12 = sub_14007A240(a1: *v21, a2: v21, a3: v13);
      *v16 = v12;
      v16[1] = v17;
    }
    *v14 = v12;
    v4 = v22;
    v5 = v14;
    v9 = v12;
    v11 = v19;
    v8 = v20;
  }
  v5[1] = v7;
  *(_BYTE *)(v7 + v9 - 1) = v11;
  *v4 += v10;
  return *(_QWORD *)v8;
}