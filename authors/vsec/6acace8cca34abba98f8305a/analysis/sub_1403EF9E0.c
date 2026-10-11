_QWORD *__fastcall sub_1403EF9E0(__int64 a1)
{
  _QWORD *v1; // rax
  unsigned __int64 *v2; // rbx
  __int64 v3; // r14
  unsigned __int64 v4; // rdx
  void *v5; // rdi
  __int64 *v6; // rdx
  __int64 v7; // rdx
  __int64 v8; // rdx
  _QWORD *result; // rax
  __int64 v10; // [rsp+2h] [rbp-8h]
  _UNKNOWN *retaddr; // [rsp+12h] [rbp+8h] BYREF

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
      v6 = *(__int64 **)(*v1 + v7 + 8);
    }
    else
    {
      v5 = nullptr;
      v6 = nullptr;
    }
    if ( v5 == nullptr )
      sub_14001A860(a1, a2: v6);
  }
  else
  {
    v5 = nullptr;
    v6 = nullptr;
  }
  if ( v5 == &unk_1405DF210 )
    v8 = *v6;
  else
    v8 = 0;
  v10 = v8;
  result = (_QWORD *)sub_140020480(a1: 1);
  *result = v10;
  result[1] = v5 == &unk_1405DF210;
  return result;
}