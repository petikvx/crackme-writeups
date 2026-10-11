_BOOL8 *__fastcall sub_1403F0300(unsigned __int64 a1)
{
  __int64 *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // r8
  __int64 v6; // rsi
  __int64 v7; // rdi
  unsigned __int64 v8; // r8
  void *v9; // rax
  __int64 v10; // r9
  __int64 v11; // r9
  __int64 v12; // r10
  bool v13; // zf
  _BOOL8 v14; // rdx
  _BOOL8 *result; // rax
  _BOOL8 v16; // [rsp+0h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+10h] [rbp+8h] BYREF

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
      v5 = *(void **)(v7 + *v1);
      v6 = *(_QWORD *)(v7 + *v1 + 8);
    }
    else
    {
      v5 = nullptr;
      v6 = 0;
    }
    if ( v5 != &unk_1405BCA68 )
      sub_14001A680(a1: &unk_1405E7330, a2: v4);
  }
  else
  {
    v6 = 0;
  }
  if ( a1 <= 1 )
    sub_14007A5E0(a1);
  v8 = v2[1];
  if ( v8 != 0 )
  {
    if ( v1[1] >= v8 )
    {
      v11 = *v1;
      v12 = 16 * (v8 - 1);
      v9 = *(void **)(v12 + *v1);
      v10 = *(_QWORD *)(v12 + v11 + 8);
    }
    else
    {
      v9 = nullptr;
      v10 = 0;
    }
    if ( v9 != &unk_1405BCA68 )
      sub_14001A680(a1: &unk_1405E7330, a2: v4);
    v13 = v4 == 0;
  }
  else
  {
    v13 = v4 == 0;
    v10 = 0;
  }
  if ( !v13 && v8 != 0 )
    v14 = v10 == v6;
  else
    v14 = v8 == v4;
  v16 = v14;
  result = (_BOOL8 *)sub_1400201A0(a1: 1);
  *result = v16;
  return result;
}