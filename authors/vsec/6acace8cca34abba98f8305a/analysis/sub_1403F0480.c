__int64 *__fastcall sub_1403F0480(unsigned __int64 a1)
{
  _QWORD *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // rdi
  __int64 v6; // rdx
  __int64 v7; // rdx
  unsigned __int64 v8; // rdi
  void *v9; // rax
  __int64 *result; // rax
  __int64 v11; // [rsp+0h] [rbp-8h]
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
      sub_14001A680(a1: &unk_1405E7330, a2: v6);
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
      v9 = *(void **)(16 * (v8 - 1) + *v1);
    else
      v9 = nullptr;
    if ( v9 != &unk_1405BCA68 )
      sub_14001A680(a1: &unk_1405E7330, a2: v6);
  }
  v11 = sub_1403678E0();
  result = (__int64 *)sub_1400201A0(a1: 1);
  *result = v11;
  return result;
}