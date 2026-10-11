_QWORD *__fastcall sub_1403F0BA0(__int64 a1)
{
  _QWORD *v1; // rbx
  __int64 v2; // r14
  _QWORD *result; // rax
  __int64 v4; // rcx
  _UNKNOWN *retaddr; // [rsp+8h] [rbp+8h] BYREF

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v2 + 16) )
    sub_1400787A0();
  result = (_QWORD *)sub_1400201A0(a1: 1);
  if ( a1 == 0 )
    sub_14007A5E0(a1: v4);
  *result = *v1;
  return result;
}