void __fastcall sub_1403E4420()
{
  __int64 v0; // r14
  _QWORD *v1; // rax
  __int64 v2; // rbx
  __int64 v3; // rsi
  __int64 v4; // rdi
  _QWORD *v5; // rax
  __int64 v6; // rcx
  _QWORD *v7; // r11
  __int64 v8; // rdx
  __int64 v9; // r8
  __int64 v10; // r9
  __int64 v11; // r10
  __int64 v12; // rbx
  __int64 v13; // rsi
  __int64 v14; // rdi
  _QWORD *v15; // rax
  __int64 v16; // rcx
  _QWORD *v17; // r11
  __int64 v18; // rdx
  __int64 v19; // r8
  __int64 v20; // r9
  __int64 v21; // r10
  __int64 v22; // rbx
  __int64 v23; // rsi
  __int64 v24; // rdi
  __int64 v25; // rdx
  _QWORD *v26; // r11
  __int64 v27; // r8
  __int64 v28; // r9
  __int64 v29; // rcx
  _UNKNOWN *retaddr; // [rsp+8h] [rbp+8h] BYREF

  if ( (unsigned __int64)&retaddr <= *(_QWORD *)(v0 + 16) )
    sub_1400787A0();
  if ( qword_140658E20 == 0 )
  {
    v1 = (_QWORD *)sub_14001E200();
    if ( dword_14069FEF0 != 0 )
    {
      v2 = v1[2];
      v3 = v1[3];
      v4 = v1[4];
      v5 = (_QWORD *)sub_14007A300(a1: *v1, a2: v1[1], a3: v1[5], a4: v1[6]);
      *v7 = v6;
      v7[1] = v8;
      v7[2] = v2;
      v7[3] = v3;
      v7[4] = v4;
      v7[5] = v9;
      v7[6] = v10;
      v7[7] = v11;
      v12 = v5[10];
      v13 = v5[11];
      v14 = v5[12];
      v15 = (_QWORD *)sub_14007A300(a1: v5[8], a2: v5[9], a3: v5[13], a4: v5[14]);
      *v17 = v16;
      v17[1] = v18;
      v17[2] = v12;
      v17[3] = v13;
      v17[4] = v14;
      v17[5] = v19;
      v17[6] = v20;
      v17[7] = v21;
      v22 = v15[17];
      v23 = v15[18];
      v24 = v15[19];
      v1 = (_QWORD *)sub_14007A300(a1: qword_140658E20, a2: v15[16], a3: v15[20], a4: v15[21]);
      *v26 = v25;
      v26[1] = v22;
      v26[2] = v23;
      v26[3] = v24;
      v26[4] = v27;
      v26[5] = v28;
      v26[6] = v1;
      v26[7] = v29;
    }
    *v1 = off_140614E38;
    v1[1] = off_140614E90;
    v1[2] = off_140614EB0;
    v1[3] = off_140614EB8;
    v1[4] = off_140614EC0;
    v1[5] = off_140614EC8;
    v1[6] = off_140614ED0;
    v1[7] = off_140614ED8;
    v1[8] = off_140614EE0;
    v1[9] = off_140614E40;
    v1[10] = off_140614E48;
    v1[11] = off_140614E50;
    v1[12] = off_140614E58;
    v1[13] = off_140614E60;
    v1[14] = off_140614E68;
    v1[15] = off_140614E70;
    v1[16] = off_140614E78;
    v1[17] = off_140614E80;
    v1[18] = off_140614E88;
    v1[19] = off_140614E98;
    v1[20] = off_140614EA0;
    v1[21] = off_140614EA8;
    qword_140658E28 = 22;
    qword_140658E30 = 22;
    qword_140658E20 = (__int64)v1;
  }
}