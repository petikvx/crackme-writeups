__int64 __fastcall sub_140396990(__int64 a1, int a2, _DWORD *a3)
{
  __int64 v4; // rsi
  _BYTE *v5; // r14
  size_t v6; // rbx
  unsigned int v7; // ecx
  _QWORD *v8; // rbx
  unsigned __int8 v9; // al
  _QWORD *v10; // rbx
  _QWORD *v11; // rax
  __int64 v12; // rcx
  size_t v13; // r8
  __int64 v15; // rbx
  __int64 v16; // rax
  __int128 v17; // xmm6
  __m128i v18; // xmm7
  __int64 v19; // rsi
  __int64 v20; // rdi
  _BYTE *v21; // rax
  size_t v22; // rbx
  __int128 v23; // xmm6
  __m128i v24; // xmm7
  __int64 v25; // r14
  _QWORD *v26; // r12
  _QWORD *v27; // r15
  size_t v28; // r13
  size_t v29; // rcx
  size_t v30; // rax
  unsigned __int64 v31; // rdi
  __int128 *v32; // rsi
  size_t v33; // rax
  void *v34; // rax
  __int64 v35; // rsi
  _QWORD *v36; // rcx
  size_t v37; // rdx
  __int64 v38; // rdi
  __int128 v39; // xmm6
  __m128i v40; // xmm7
  __int64 v41; // rcx
  __int64 v42; // rax
  __int128 v43; // xmm6
  __m128i v44; // xmm7
  __int128 *v45; // rbx
  _QWORD *v46; // r14
  _BYTE *v47; // rax
  unsigned __int64 v48; // rbx
  unsigned __int64 v49; // rsi
  size_t v50; // r8
  _QWORD *v51; // rax
  _QWORD *v52; // rcx
  __int64 v53; // rax
  __int64 *v54; // rax
  _QWORD *v55; // rdx
  unsigned __int64 v56; // r8
  __int64 *v57; // rbx
  __int64 v58; // rdx
  __int64 v59; // r8
  __int64 v60; // rax
  __int64 *v61; // rcx
  size_t Size; // [rsp+28h] [rbp-E0h] BYREF
  size_t v63; // [rsp+30h] [rbp-D8h] BYREF
  __int128 v64; // [rsp+38h] [rbp-D0h] BYREF
  __m128i v65; // [rsp+48h] [rbp-C0h]
  __int64 v66; // [rsp+58h] [rbp-B0h]
  _QWORD v67[5]; // [rsp+60h] [rbp-A8h] BYREF
  __int128 v68; // [rsp+88h] [rbp-80h]
  _QWORD *v69; // [rsp+98h] [rbp-70h]
  __int128 v70; // [rsp+A8h] [rbp-60h] BYREF
  __m128i v71; // [rsp+B8h] [rbp-50h]
  __int128 v72; // [rsp+C8h] [rbp-40h] BYREF
  __m128i si128; // [rsp+D8h] [rbp-30h]
  __int128 *v74; // [rsp+E8h] [rbp-20h]
  __int128 v75; // [rsp+F8h] [rbp-10h] BYREF
  __m128i v76; // [rsp+108h] [rbp+0h]
  __int128 v77; // [rsp+118h] [rbp+10h]
  __int128 v78; // [rsp+128h] [rbp+20h] BYREF
  __int128 v79; // [rsp+138h] [rbp+30h]
  __int128 v80; // [rsp+148h] [rbp+40h]
  __int128 v81; // [rsp+158h] [rbp+50h]
  __int128 v82; // [rsp+168h] [rbp+60h]
  __int128 v83; // [rsp+178h] [rbp+70h]
  __int128 v84; // [rsp+188h] [rbp+80h]
  __int128 v85; // [rsp+198h] [rbp+90h]

  switch ( a2 )
  {
    case 0:
      v4 = *(_QWORD *)a1;
      v5 = (_BYTE *)sub_140380840(0, 0x140000000LL, (__int64)a3);
      if ( *(_BYTE *)(v4 + 32) != 0 )
      {
        sub_1403997C0(v4);
        *(_BYTE *)(v4 + 32) = 0;
      }
      *(_QWORD *)v4 = 0;
      *(_QWORD *)(v4 + 16) = 0;
      *(_QWORD *)(v4 + 24) = 15;
      v6 = -1;
      do
        ++v6;
      while ( v5[v6] != 0 );
      sub_140399990((void **)v4, v5, v6);
      *(_BYTE *)(v4 + 32) = 1;
      return 0;
    case 1:
      v7 = 1;
      goto LABEL_110;
    case 2:
      v7 = 2;
      goto LABEL_110;
    case 3:
      v7 = 3;
      goto LABEL_110;
    case 4:
      v7 = 4;
      goto LABEL_110;
    case 5:
      v8 = *(_QWORD **)(a1 + 8);
      goto LABEL_12;
    case 6:
      v7 = 5;
      goto LABEL_110;
    case 7:
      v8 = *(_QWORD **)(a1 + 16);
LABEL_12:
      v9 = sub_14039AC30((__int64)qword_14041FB70 + *(int *)(qword_14041FB70[0] + 4), 0xAu);
      sub_14039BD20(qword_14041FB70, v8, v9);
      return 0;
    case 8:
      v10 = *(_QWORD **)a1;
      v11 = sub_1402831C0(&v72, *(_QWORD *)(a1 + 8));
      v12 = v10[2];
      if ( v10[3] >= 0x10u )
        v10 = (_QWORD *)*v10;
      v13 = v11[2];
      if ( v11[3] >= 0x10u )
        v11 = (_QWORD *)*v11;
      if ( v13 == v12 && memcmp(v11, v10, v13) == 0 )
      {
        sub_1403997C0((__int64)&v72);
        return 0;
      }
      else
      {
        sub_1403997C0((__int64)&v72);
        return 1;
      }
    case 9:
      v7 = 6;
      goto LABEL_110;
    case 10:
      v15 = *(_QWORD *)(a1 + 24);
      v16 = *(_QWORD *)(a1 + 8);
      v78 = 0;
      v79 = 0;
      v80 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      LOBYTE(v74) = 0;
      __wind
      {
        LOBYTE(v66) = 0;
        *(_QWORD *)&v70 = &v64;
        *((_QWORD *)&v70 + 1) = v16;
        v71.m128i_i64[0] = (__int64)&Size;
        v71.m128i_i64[1] = (__int64)&v72;
        v67[0] = &std::_Func_impl_no_alloc<_lambda_ccdfaf4d34222d50f03ff723c97475d1_,__int64,unsigned int,__int64 *,unsigned int>::`vftable';
        *(_OWORD *)&v67[1] = v70;
        *(__m128i *)&v67[3] = v71;
        v69 = v67;
        __wind
        {
          sub_14003F540((unsigned __int64)&v78, 16, (__int64)v67);
          v17 = v72;
          v75 = v72;
          v18 = si128;
          si128 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v72) = 0;
          if ( (_BYTE)v66 != 0 )
            sub_1403997C0((__int64)&v64);
          if ( (_BYTE)v74 != 0 )
            sub_1403997C0((__int64)&v72);
          if ( *(_BYTE *)(v15 + 32) != 0 )
            sub_1403997C0(v15);
          *(_OWORD *)v15 = v17;
          *(__m128i *)(v15 + 16) = v18;
          v76 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v75) = 0;
          *(_BYTE *)(v15 + 32) = 1;
          sub_1403997C0((__int64)&v75);
        }
        __unwind
        {
          sub_140048AB0(&v64);
        }
      }
      __unwind
      {
        sub_140048AB0(&v72);
      }
      return 0;
    case 11:
      v19 = *(_QWORD *)(a1 + 32);
      v20 = *(_QWORD *)(a1 + 16);
      v21 = (_BYTE *)sub_140380840(7u, 0x140000000LL, (__int64)a3);
      *(_QWORD *)&v75 = 0;
      v76 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
      v22 = -1;
      do
        ++v22;
      while ( v21[v22] != 0 );
      sub_140399990((void **)&v75, v21, v22);
      __eh34_enter_wind_state(-1, 2);
      v78 = 0;
      v79 = 0;
      v80 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      LOBYTE(v74) = 0;
      LOBYTE(v66) = 0;
      *(_QWORD *)&v70 = &v64;
      *((_QWORD *)&v70 + 1) = v20;
      v71.m128i_i64[0] = (__int64)&v75;
      v71.m128i_i64[1] = (__int64)&v72;
      v67[0] = &std::_Func_impl_no_alloc<_lambda_487f57e9d76fe70ab8821a563079432f_,__int64,unsigned int,__int64 *,unsigned int>::`vftable';
      *(_OWORD *)&v67[1] = v70;
      *(__m128i *)&v67[3] = v71;
      v69 = v67;
      __wind
      {
        __wind
        {
          sub_140264A60((unsigned __int64)&v78, 16, (__int64)v67);
          v23 = v72;
          v70 = v72;
          v24 = si128;
          si128 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v72) = 0;
          if ( (_BYTE)v66 != 0 )
            sub_1403997C0((__int64)&v64);
          if ( (_BYTE)v74 != 0 )
            sub_1403997C0((__int64)&v72);
          if ( *(_BYTE *)(v19 + 32) != 0 )
            sub_1403997C0(v19);
          *(_OWORD *)v19 = v23;
          *(__m128i *)(v19 + 16) = v24;
          v71 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v70) = 0;
          *(_BYTE *)(v19 + 32) = 1;
          sub_1403997C0((__int64)&v70);
          sub_1403997C0((__int64)&v75);
        }
        __unwind
        {
          sub_140048AB0(&v64);
        }
      }
      __unwind
      {
        sub_140048AB0(&v72);
      }
      goto LABEL_139;
    case 12:
      v25 = *(_QWORD *)(a1 + 40);
      v26 = *(_QWORD **)(a1 + 32);
      v27 = *(_QWORD **)(a1 + 24);
      v28 = v27[2];
      v29 = v26[2];
      Size = v29;
      if ( 0x7FFFFFFFFFFFFFFFLL - v28 < v29 )
        unknown_libname_3(v29);
      if ( v27[3] >= 0x10u )
        v27 = (_QWORD *)*v27;
      if ( v26[3] >= 0x10u )
        v26 = (_QWORD *)*v26;
      *(_QWORD *)&v70 = 0;
      v30 = v29 + v28;
      v63 = v29 + v28;
      v31 = 15;
      v32 = &v70;
      if ( v29 + v28 <= 0xF )
        goto LABEL_61;
      v31 = v30 | 0xF;
      if ( (v30 | 0xF) <= 0x7FFFFFFFFFFFFFFFLL )
      {
        if ( v31 < 0x16 )
          v31 = 22;
        if ( v31 + 1 < 0x1000 )
        {
          if ( v31 == -1 )
          {
            v32 = nullptr;
          }
          else
          {
            v32 = (__int128 *)operator new(v31 + 1);
            v30 = v63;
          }
          goto LABEL_60;
        }
        v33 = v31 + 40;
        if ( v31 + 40 < v31 + 1 )
          sub_1400014C0();
      }
      else
      {
        v31 = 0x7FFFFFFFFFFFFFFFLL;
        v33 = 0x8000000000000027uLL;
      }
      v34 = operator new(v33);
      if ( v34 == nullptr )
        invalid_parameter_noinfo_noreturn();
      v32 = (__int128 *)(((unsigned __int64)v34 + 39) & 0xFFFFFFFFFFFFFFE0uLL);
      *((_QWORD *)v32 - 1) = v34;
      v30 = v63;
LABEL_60:
      *(_QWORD *)&v70 = v32;
LABEL_61:
      v71.m128i_i64[0] = v30;
      v71.m128i_i64[1] = v31;
      memmove(v32, v27, v28);
      memmove((char *)v32 + v28, v26, Size);
      *((_BYTE *)v32 + v63) = 0;
      if ( *(_BYTE *)(v25 + 32) != 0 )
        sub_1403997C0(v25);
      *(_OWORD *)v25 = v70;
      *(__m128i *)(v25 + 16) = v71;
      v71 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
      LOBYTE(v70) = 0;
      *(_BYTE *)(v25 + 32) = 1;
      sub_1403997C0((__int64)&v70);
      return 0;
    case 13:
      v35 = *(_QWORD *)(a1 + 48);
      v36 = *(_QWORD **)(a1 + 40);
      *(_QWORD *)&v70 = 0;
      v71 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
      v37 = 24;
      if ( v36[2] < 0x18u )
        v37 = v36[2];
      if ( v36[3] >= 0x10u )
        v36 = (_QWORD *)*v36;
      sub_140399990((void **)&v70, v36, v37);
      if ( *(_BYTE *)(v35 + 32) != 0 )
        sub_1403997C0(v35);
      *(_OWORD *)v35 = v70;
      *(__m128i *)(v35 + 16) = v71;
      v71 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
      LOBYTE(v70) = 0;
      *(_BYTE *)(v35 + 32) = 1;
      sub_1403997C0((__int64)&v70);
      return 0;
    case 14:
      return *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16LL) < 0x18u;
    case 15:
      sub_140398420(*(_QWORD **)(a1 + 48), 24LL - *(_QWORD *)(*(_QWORD *)(a1 + 48) + 16LL), 0);
      return 0;
    case 16:
      v38 = *(_QWORD *)(a1 + 56);
      *(_QWORD *)&v75 = 0;
      v76 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
      sub_140399990(
        (void **)&v75,
        "6f56f79c3e348835aa3c3fc5f551d501dea5dfcdcf3a013b0e3f8292ff4954b3455024b373acad827d1fc843f19f3a9ca9907f072ef55099"
        "ceadf0798f782d09abb0a67da54ba93b",
        0x90u);
      __eh34_enter_wind_state(-1, 2);
      v78 = 0;
      v79 = 0;
      v80 = 0;
      v81 = 0;
      v82 = 0;
      v83 = 0;
      v84 = 0;
      v85 = 0;
      LOBYTE(v66) = 0;
      *(_QWORD *)&v70 = 0;
      v71 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
      *(_QWORD *)&v72 = &Size;
      *((_QWORD *)&v72 + 1) = &v75;
      si128.m128i_i64[0] = (__int64)&v63;
      si128.m128i_i64[1] = (__int64)&v70;
      v74 = &v64;
      v67[0] = &std::_Func_impl_no_alloc<_lambda_7d3d57845ab3ab26c37e3de21107c042_,__int64,unsigned int,__int64 *,unsigned int>::`vftable';
      *(_OWORD *)&v67[1] = v72;
      *(__m128i *)&v67[3] = si128;
      *(_QWORD *)&v68 = &v64;
      v69 = v67;
      __wind
      {
        __wind
        {
          sub_1400804C0((unsigned __int64)&v78, 16, (__int64)v67);
          v39 = v64;
          v72 = v64;
          v40 = v65;
          v65 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v64) = 0;
          sub_1403997C0((__int64)&v70);
          if ( (_BYTE)v66 != 0 )
            sub_1403997C0((__int64)&v64);
          if ( *(_BYTE *)(v38 + 32) != 0 )
            sub_1403997C0(v38);
          *(_OWORD *)v38 = v39;
          *(__m128i *)(v38 + 16) = v40;
          si128 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v72) = 0;
          *(_BYTE *)(v38 + 32) = 1;
          sub_1403997C0((__int64)&v72);
          sub_1403997C0((__int64)&v75);
        }
        __unwind
        {
          sub_1403984B0(&v70);
        }
      }
      __unwind
      {
        sub_140048AB0(&v64);
      }
      if ( __eh34_unwind(2) )
      {
        sub_1403984B0(&v75);
        __eh34_propagate_exception_into_caller(2, -1);
      }
LABEL_139:
      __eh34_exit_wind_state(2, -1);
      return 0;
    case 17:
      **(_DWORD **)(a1 + 64) = *a3;
      return 0;
    case 18:
      return **(int **)(a1 + 64);
    case 19:
      __wind
      {
        __wind
        {
          v41 = *(_QWORD *)(a1 + 48);
          v42 = *(_QWORD *)(a1 + 56);
          v78 = 0;
          v79 = 0;
          v80 = 0;
          v81 = 0;
          v82 = 0;
          v83 = 0;
          v84 = 0;
          v85 = 0;
          LOBYTE(v66) = 0;
          LOBYTE(v74) = 0;
          v70 = 0;
          v71.m128i_i64[0] = 0;
          *(_QWORD *)&v75 = &v72;
          *((_QWORD *)&v75 + 1) = v42;
          v76.m128i_i64[0] = (__int64)&v70;
          v76.m128i_i64[1] = v41;
          *(_QWORD *)&v77 = &Size;
          *((_QWORD *)&v77 + 1) = &v64;
          v67[0] = &std::_Func_impl_no_alloc<_lambda_1c97e720d1bf3b40e5c270f3610f04fa_,__int64,unsigned int,__int64 *,unsigned int>::`vftable';
          *(_OWORD *)&v67[1] = v75;
          *(__m128i *)&v67[3] = v76;
          v68 = v77;
          v69 = v67;
          sub_1400C0510((unsigned __int64)&v78, 16, (__int64)v67);
          v43 = v64;
          v75 = v64;
          v44 = v65;
          v76 = v65;
          v65 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
          LOBYTE(v64) = 0;
          if ( (_BYTE)v74 != 0 )
            sub_1403997C0((__int64)&v72);
          if ( (_BYTE)v66 != 0 )
            sub_1403997C0((__int64)&v64);
          v45 = *(__int128 **)(a1 + 56);
          if ( v45 != &v75 )
          {
            sub_1403997C0(*(_QWORD *)(a1 + 56));
            *v45 = v43;
            v45[1] = (__int128)v44;
            v76 = _mm_load_si128((const __m128i *)&xmmword_1403F1BF0);
            LOBYTE(v75) = 0;
          }
          sub_1403997C0((__int64)&v75);
        }
        __unwind
        {
          sub_140048AB0(&v72);
        }
      }
      __unwind
      {
        sub_140048AB0(&v64);
      }
      return 0;
    case 20:
      v46 = *(_QWORD **)(a1 + 56);
      if ( v46[2] <= 4u )
        return 0;
      v47 = (_BYTE *)sub_140380840(8u, 0x140000000LL, (__int64)a3);
      v48 = -1;
      do
        ++v48;
      while ( v47[v48] != 0 );
      v49 = 4;
      if ( v46[2] < 4u )
        v49 = v46[2];
      if ( v46[3] >= 0x10u )
        v46 = (_QWORD *)*v46;
      v50 = v49;
      if ( v48 < v49 )
        v50 = v48;
      if ( memcmp(v46, v47, v50) != 0 || v49 < v48 || v49 > v48 )
        return 0;
      v51 = *(_QWORD **)(a1 + 56);
      v52 = v51;
      if ( v51[3] >= 0x10u )
        v52 = (_QWORD *)*v51;
      return *((_BYTE *)v52 + v51[2] - 1) == 125;
    case 21:
      v7 = 9;
      goto LABEL_110;
    case 22:
      v53 = sub_140380840(0xAu, 0x140000000LL, (__int64)a3);
      v54 = sub_14039ADB0(&qword_14041F930, v53);
      v55 = *(_QWORD **)(a1 + 56);
      v56 = v55[2];
      if ( v55[3] >= 0x10u )
        v55 = (_QWORD *)*v55;
      v57 = sub_14039BFA0(v54, (__int64)v55, v56);
      v60 = sub_140380840(0xBu, v58, v59);
      v61 = v57;
      goto LABEL_111;
    case 23:
      v7 = 12;
LABEL_110:
      v60 = sub_140380840(v7, 0x140000000LL, (__int64)a3);
      v61 = &qword_14041F930;
LABEL_111:
      sub_14039ADB0(v61, v60);
      return 0;
    default:
      return 0;
  }
}
