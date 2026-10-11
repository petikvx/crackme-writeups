__int64 *__fastcall sub_1403F05E0(__int64 a1, __int64 a2, int a3, int a4)
{
  __int64 *v4; // rax
  __int64 v5; // r14
  unsigned __int64 v6; // rcx
  unsigned __int64 v7; // rbx
  unsigned __int64 v8; // rdx
  __int64 v9; // rax
  __int64 v10; // rcx
  __int64 v11; // r8
  __int64 *v12; // rdx
  __int64 v13; // rsi
  __int64 *v14; // r11
  __int64 v15; // rsi
  __int64 v16; // rdi
  _QWORD *v17; // r11
  __int64 *result; // rax
  __int64 v19; // [rsp+0h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+10h] [rbp+8h] BYREF
  __int64 *v21; // [rsp+18h] [rbp+10h]

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v5 + 16) )
    sub_1400787A0();
  v6 = v4[2];
  v7 = v4[1] + 1;
  v8 = *v4;
  if ( v6 < v7 )
  {
    v21 = v4;
    v9 = sub_140075980(a1: v6, a2: v8, a3, a4);
    v12 = v21;
    v21[2] = v10;
    if ( dword_14069FEF0 != 0 )
    {
      v13 = *v21;
      v9 = sub_14007A240(a1: v10, a2: v21, a3: v11);
      *v14 = v9;
      v14[1] = v13;
    }
    *v12 = v9;
    v6 = v9;
    v4 = v12;
    v8 = v6;
  }
  v4[1] = v7;
  v15 = 16 * (v7 - 1);
  *(_QWORD *)(v8 + v15) = &unk_1405B1698;
  if ( dword_14069FEF0 != 0 )
  {
    v16 = *(_QWORD *)(v8 + v15 + 8);
    v4 = (__int64 *)sub_14007A220(a1: v6, a2: v8);
    *v17 = v16;
  }
  *(_QWORD *)(v8 + v15 + 8) = &unk_14069FBE0;
  v19 = v4[1];
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v19;
  return result;
}