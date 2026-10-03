/* Hex-Rays IDA MCP — xorNT.exe PE64 MSVC Debug */

/* ===== main / sub_14001A050 @ 0x14001a050 ===== */
__int64 sub_14001A050()
{
  char *v0; // rdi
  __int64 i; // rcx
  __int64 v2; // rax
  _BYTE v4[32]; // [rsp+0h] [rbp-20h] BYREF
  char v5; // [rsp+20h] [rbp+0h] BYREF
  char v6; // [rsp+24h] [rbp+4h]
  unsigned __int64 v7[4]; // [rsp+48h] [rbp+28h] BYREF
  _BYTE v8[64]; // [rsp+68h] [rbp+48h] BYREF
  _BYTE v9[256]; // [rsp+A8h] [rbp+88h] BYREF
  _BYTE v10[64]; // [rsp+1A8h] [rbp+188h] BYREF
  _BYTE *v11; // [rsp+1E8h] [rbp+1C8h]
  __int64 v12; // [rsp+1F8h] [rbp+1D8h]

  v0 = &v5;
  for ( i = 78; i != 0; --i )
  {
    *(_DWORD *)v0 = -858993460;
    v0 += 4;
  }
  sub_14001177B(&unk_140030103);
  v6 = 0;
  do
  {
    sub_1400110D2(std::cout, "Enter the key ");
    std::istream::operator>>(std::cin, v7);
  }
  while ( v7[0] > 0x17D78400 );
  do
  {
    sub_1400110D2(std::cout, "Enter the command ");
    sub_14001176C(v8);
    __wind
    {
      v2 = std::istream::operator>>(std::cin, sub_1400115C3);
      sub_140011438(v2, v8);
      if ( (unsigned __int64)sub_14001157D(v8) >= 4 && (unsigned __int64)sub_14001157D(v8) <= 0xF )
      {
        v11 = v10;
        v12 = sub_140011109(v10, v8);
        sub_140011244(v9, v12, v7[0]);
        if ( (unsigned __int8)sub_1400112F8(v9, &unk_140025A10) != 0 )
          v6 = 1;
        sub_140011163(v9);
      }
    }
    __unwind
    {
      sub_140011163(v8);
    }
    sub_140011163(v8);
  }
  while ( v6 == 0 );
  sub_1400110D2(std::cout, "\nGoood!");
  Sleep(0xBB8u);
  sub_140011636(v4, &unk_1400253D0);
  return 0;
}


/* ===== encrypt pipeline @ 0x1400192f0 ===== */
__int64 __fastcall sub_1400192F0(__int64 a1, __int64 a2, __int64 a3)
{
  char v4; // [rsp+E8h] [rbp+C8h] BYREF
  char *v5; // [rsp+128h] [rbp+108h]
  char v6; // [rsp+148h] [rbp+128h] BYREF
  char *v7; // [rsp+188h] [rbp+168h]
  _BYTE v8[64]; // [rsp+1A8h] [rbp+188h] BYREF
  _BYTE *v9; // [rsp+1E8h] [rbp+1C8h]
  int v10; // [rsp+204h] [rbp+1E4h]
  __int64 v11; // [rsp+218h] [rbp+1F8h]
  __int64 v12; // [rsp+220h] [rbp+200h]
  __int64 v13; // [rsp+228h] [rbp+208h]
  __int64 v14; // [rsp+230h] [rbp+210h]
  __int64 v15; // [rsp+238h] [rbp+218h]

  v10 = 0;
  __wind
  {
    sub_14001177B(&unk_140030103);
    v5 = &v4;
    v7 = &v6;
    v9 = v8;
    v11 = sub_140011109(v8, a2);
    v12 = sub_140011181(v7, v11, a3);
    v13 = v12;
    v14 = sub_140011730(v5, v12, a3);
    v15 = v14;
    sub_1400110E1(a1, v14, a3);
    v10 |= 1u;
  }
  __unwind
  {
    sub_140011163(a2);
  }
  sub_140011163(a2);
  return a1;
}


/* ===== permute (splitmix-like) @ 0x140018d10 ===== */
__int64 __fastcall sub_140018D10(__int64 a1, _BYTE *a2, unsigned __int64 a3)
{
  char *v3; // rdi
  __int64 i; // rcx
  unsigned __int64 v5; // rtt
  __int64 v6; // rax
  _BYTE v8[32]; // [rsp+0h] [rbp-20h] BYREF
  char v9; // [rsp+20h] [rbp+0h] BYREF
  unsigned __int64 v10; // [rsp+28h] [rbp+8h]
  _BYTE v11[64]; // [rsp+48h] [rbp+28h] BYREF
  unsigned __int64 v12; // [rsp+88h] [rbp+68h]
  char v13; // [rsp+A4h] [rbp+84h]
  int j; // [rsp+C4h] [rbp+A4h]
  unsigned __int64 v15; // [rsp+E8h] [rbp+C8h]
  unsigned __int64 v16; // [rsp+108h] [rbp+E8h]
  _BYTE *v17; // [rsp+1E8h] [rbp+1C8h]
  int v18; // [rsp+204h] [rbp+1E4h]
  _BYTE *v19; // [rsp+218h] [rbp+1F8h]

  v3 = &v9;
  for ( i = 86; i != 0; --i )
  {
    *(_DWORD *)v3 = -858993460;
    v3 += 4;
  }
  v18 = 0;
  __eh34_enter_wind_state(-1, 0);
  sub_14001177B(&unk_140030103);
  v10 = sub_14001157D(a2);
  if ( v10 >= 2 )
  {
    sub_140011109(v11, a2);
    __wind
    {
      v12 = a3;
      v13 = 0;
      for ( j = 0; j < 4; ++j )
      {
        v15 = v12 % v10;
        v5 = v12 / v10 - 0x61C8864680B583EBLL;
        v16 = v5 % v10;
        v12 = 0xBF58476D1CE4E5B9uLL * v5 + 1;
        if ( v15 != v5 % v10 )
        {
          v19 = (_BYTE *)sub_1400110EB(v11, v16);
          v6 = sub_1400110EB(v11, v15);
          sub_140011087(v6, v19);
          v13 = 1;
        }
      }
      if ( v13 != 0 )
        v19 = v11;
      else
        v19 = a2;
      v17 = v19;
      sub_140011109(a1, v19);
      v18 |= 1u;
    }
    __unwind
    {
      sub_140011163(v11);
    }
    sub_140011163(v11);
    if ( __eh34_unwind(0) )
    {
unwind_state_0:
      sub_140011163(a2);
      __eh34_propagate_exception_into_caller(0, -1);
    }
  }
  else
  {
    sub_14001170D(a1, a2);
    v18 |= 1u;
    if ( __eh34_unwind(0) )
      goto unwind_state_0;
  }
  __eh34_exit_wind_state(0, -1);
  sub_140011163(a2);
  sub_140011636(v8, &unk_1400251C0);
  return a1;
}


/* ===== substitute @ 0x140018890 ===== */
__int64 __fastcall sub_140018890(__int64 a1, _BYTE *a2, __int16 a3)
{
  char *v3; // rdi
  __int64 i; // rcx
  char v6[32]; // [rsp+0h] [rbp-20h] BYREF
  char v7; // [rsp+20h] [rbp+0h] BYREF
  unsigned __int8 v8; // [rsp+24h] [rbp+4h]
  unsigned __int8 v9; // [rsp+44h] [rbp+24h]
  _BYTE v10[60]; // [rsp+68h] [rbp+48h] BYREF
  char v11; // [rsp+A4h] [rbp+84h]
  _BYTE *v12; // [rsp+C8h] [rbp+A8h]
  unsigned __int8 *v13; // [rsp+E8h] [rbp+C8h]
  __int64 v14; // [rsp+108h] [rbp+E8h]
  unsigned __int8 *v15; // [rsp+128h] [rbp+108h]
  _BYTE *v16; // [rsp+208h] [rbp+1E8h]
  int v17; // [rsp+224h] [rbp+204h]
  _BYTE *v18; // [rsp+238h] [rbp+218h]

  v3 = &v7;
  for ( i = 94; i != 0; --i )
  {
    *(_DWORD *)v3 = -858993460;
    v3 += 4;
  }
  v17 = 0;
  __eh34_enter_wind_state(-1, 0);
  sub_14001177B(&unk_140030103);
  if ( (unsigned __int8)sub_1400111D6(a2) != 0 )
  {
    sub_14001170D(a1, a2);
    v17 |= 1u;
    if ( __eh34_unwind(0) )
      goto unwind_state_0;
  }
  else
  {
    v8 = a3;
    v9 = HIBYTE(a3) ^ 0x5A;
    if ( (unsigned __int8)a3 == (HIBYTE(a3) ^ 0x5A) )
    {
      sub_14001170D(a1, a2);
      v17 |= 1u;
      if ( __eh34_unwind(0) )
        goto unwind_state_0;
    }
    else
    {
      sub_140011109(v10, a2);
      __wind
      {
        v11 = 0;
        v12 = v10;
        v13 = (unsigned __int8 *)sub_140011032(v10);
        v14 = sub_14001105F(v12);
        while ( v13 != (unsigned __int8 *)v14 )
        {
          v15 = v13;
          if ( *v13 == v8 )
          {
            *v15 = v9;
            v11 = 1;
          }
          ++v13;
        }
        if ( v11 != 0 )
          v18 = v10;
        else
          v18 = a2;
        v16 = v18;
        sub_140011109(a1, v18);
        v17 |= 1u;
      }
      __unwind
      {
        sub_140011163(v10);
      }
      sub_140011163(v10);
      if ( __eh34_unwind(0) )
      {
unwind_state_0:
        sub_140011163(a2);
        __eh34_propagate_exception_into_caller(0, -1);
      }
    }
  }
  __eh34_exit_wind_state(0, -1);
  sub_140011163(a2);
  sub_140011636(v6, &unk_140025240);
  return a1;
}


/* ===== xor keystream @ 0x1400191b0 ===== */
__int64 __fastcall sub_1400191B0(__int64 a1, __int64 a2, __int64 a3)
{
  unsigned __int64 i; // [rsp+28h] [rbp+8h]
  _BYTE *v5; // [rsp+118h] [rbp+F8h]

  __wind
  {
    sub_14001177B(&unk_140030103);
    for ( i = 0; i < sub_14001157D(a2); ++i )
    {
      sub_140011005(&unk_14002A508);
      a3 += sub_1400115BE(&unk_14002A508);
      v5 = (_BYTE *)sub_1400110EB(a2, i);
      *v5 ^= a3;
    }
    sub_14001170D(a1, a2);
  }
  __unwind
  {
    sub_140011163(a2);
  }
  sub_140011163(a2);
  return a1;
}


/* ===== counter++ @ 0x140018610 ===== */
__int64 __fastcall sub_140018610(_DWORD *a1)
{
  sub_14001177B(&unk_140030103);
  ++*a1;
  return sub_1400114E7(a1);
}


/* ===== counter normalize @ 0x140018b90 ===== */
__int64 __fastcall sub_140018B90(_DWORD *a1)
{
  __int64 result; // rax

  sub_14001177B(&unk_140030103);
  if ( *a1 > 3u )
  {
    *a1 = 0;
    ++a1[1];
  }
  if ( a1[1] > 3u )
  {
    a1[1] = 0;
    ++a1[2];
  }
  result = 8;
  if ( a1[2] > 3u )
  {
    a1[2] = 0;
    result = (unsigned int)(a1[1] + 1);
    a1[1] = result;
  }
  return result;
}


/* ===== counter sum @ 0x140019590 ===== */
__int64 __fastcall sub_140019590(__int64 a1)
{
  __int64 v2; // [rsp+28h] [rbp+8h]
  unsigned __int64 i; // [rsp+48h] [rbp+28h]

  sub_14001177B(&unk_140030103);
  v2 = 0;
  for ( i = 0; i < 3; ++i )
    v2 += *(unsigned int *)(a1 + 4 * i);
  return v2;
}


