// local variable allocation has failed, the output may be wrong!
__int64 __fastcall sub_1403EC180(double a1)
{
  double v1; // rax
  unsigned int v2; // ebx
  __int64 v3; // r14
  __int64 v4; // rax
  double v6; // xmm0_8
  __int64 v7; // rax
  __int64 v8; // rax
  _UNKNOWN *retaddr; // [rsp+18h] [rbp+8h] BYREF

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v3 + 16) )
LABEL_42:
    sub_1400787A0();
  if ( BYTE2(v2) <= 1u )
  {
    if ( (unsigned __int8)v2 > 1u )
    {
      if ( (unsigned __int8)v2 == 2 )
      {
        v4 = (unsigned int)(int)v1;
      }
      else if ( (unsigned __int8)v2 == 3 )
      {
        v4 = (unsigned int)(int)*(float *)&v1;
      }
      else
      {
        v4 = 0;
      }
    }
    else if ( (_BYTE)v2 != 0 )
    {
      v4 = ((-(__int64)(BYTE1(v2) < 0x40u) & (1LL << SBYTE1(v2))) - 1) & *(_QWORD *)&v1;
    }
    else
    {
      v4 = (-(__int64)(64 - (unsigned int)BYTE1(v2) < 0x40uLL) & (*(_QWORD *)&v1 << (64 - BYTE1(v2)))) >> ((unsigned __int8)-(64 - (unsigned int)BYTE1(v2) >= 0x40uLL) | (unsigned __int8)(64 - BYTE1(v2)));
    }
    if ( BYTE2(v2) != 0 )
      return (((1LL << SHIBYTE(v2)) & -(__int64)(HIBYTE(v2) < 0x40u)) - 1) & v4;
    else
      return (-(__int64)(64 - HIBYTE(v2) < 0x40uLL) & (v4 << (64 - HIBYTE(v2)))) >> ((unsigned __int8)-(64 - HIBYTE(v2) >= 0x40uLL)
                                                                                   | (unsigned __int8)(64 - HIBYTE(v2)));
  }
  if ( BYTE2(v2) == 2 )
  {
    if ( (unsigned __int8)v2 > 1u )
    {
      if ( (unsigned __int8)v2 == 2 )
      {
        v6 = v1;
      }
      else if ( (unsigned __int8)v2 == 3 )
      {
        v6 = *(float *)&v1;
      }
      else
      {
        v6 = 0.0;
      }
    }
    else if ( (_BYTE)v2 != 0 )
    {
      v7 = ((-(__int64)(BYTE1(v2) < 0x40u) & (1LL << SBYTE1(v2))) - 1) & *(_QWORD *)&v1;
      if ( v7 < 0 )
        v6 = (double)(int)(((unsigned __int64)v7 >> 1) | v7 & 1) + (double)(int)(((unsigned __int64)v7 >> 1) | v7 & 1);
      else
        v6 = (double)(int)v7;
    }
    else
    {
      v6 = (double)(int)((-(__int64)(64 - (unsigned int)BYTE1(v2) < 0x40uLL) & (*(_QWORD *)&v1 << (64 - BYTE1(v2)))) >> ((unsigned __int8)-(64 - (unsigned int)BYTE1(v2) >= 0x40uLL) | (unsigned __int8)(64 - BYTE1(v2))));
    }
    return *(_QWORD *)&v6;
  }
  if ( BYTE2(v2) != 3 )
  {
    (**((void (__fastcall ***)(__int64))off_140644550 + 1))(a1: 17070);
    sub_140072380();
    sub_140074180();
    goto LABEL_42;
  }
  if ( (unsigned __int8)v2 > 1u )
  {
    if ( (unsigned __int8)v2 == 2 )
    {
      *(float *)&a1 = v1;
    }
    else if ( (unsigned __int8)v2 == 3 )
    {
      *(__m128i *)&a1 = _mm_cvtsi32_si128(LODWORD(v1));
    }
    else
    {
      *(_OWORD *)&a1 = 0;
    }
  }
  else if ( (_BYTE)v2 != 0 )
  {
    v8 = ((-(__int64)(BYTE1(v2) < 0x40u) & (1LL << SBYTE1(v2))) - 1) & *(_QWORD *)&v1;
    *(_OWORD *)&a1 = 0;
    if ( v8 < 0 )
      *(float *)&a1 = (float)(int)(((unsigned __int64)v8 >> 1) | v8 & 1)
                    + (float)(int)(((unsigned __int64)v8 >> 1) | v8 & 1);
    else
      *(float *)&a1 = (float)(int)v8;
  }
  else
  {
    *(_OWORD *)&a1 = 0;
    *(float *)&a1 = (float)(int)((-(__int64)(64 - (unsigned int)BYTE1(v2) < 0x40uLL)
                                & (*(_QWORD *)&v1 << (64 - BYTE1(v2)))) >> ((unsigned __int8)-(64
                                                                                             - (unsigned int)BYTE1(v2) >= 0x40uLL)
                                                                          | (unsigned __int8)(64 - BYTE1(v2))));
  }
  return (unsigned int)_mm_cvtsi128_si32(*(__m128i *)&a1);
}