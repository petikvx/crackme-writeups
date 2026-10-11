char *__fastcall sub_1403EC8C0(
        unsigned __int64 a1,
        __int64 a2,
        __int64 a3,
        __int64 a4,
        int a5,
        int a6,
        int a7,
        int a8,
        int a9,
        int a10,
        int a11,
        int a12,
        int a13,
        int a14,
        int a15,
        int a16,
        int a17,
        int a18,
        int a19,
        int a20,
        int a21,
        int a22,
        int a23,
        int a24,
        int a25,
        int a26,
        int a27,
        int a28,
        int a29,
        int a30,
        int a31,
        int a32,
        int a33,
        unsigned __int64 a34,
        int a35)
{
  unsigned __int16 v35; // ax
  char v36; // bl
  int v37; // edi
  __int64 v38; // r14
  __int128 v39; // xmm15
  char *v40; // rdx
  int i; // esi
  unsigned __int64 v42; // rcx
  char v43; // si
  __int16 v44; // ax
  _OWORD *v45; // rdi
  _OWORD *v46; // r8
  int j; // r9d
  _OWORD *v48; // rax
  const wchar_t *v49; // rcx
  int k; // edx
  __int64 m; // rax
  unsigned __int64 v52; // rdx
  unsigned __int64 v53; // rbx
  __int64 v54; // rcx
  char v55; // si
  _OWORD *v56; // rax
  int n; // ecx
  __int64 ii; // rax
  char *result; // rax
  _OWORD *v60; // rcx
  int jj; // edx
  _BYTE v62[9]; // [rsp+0h] [rbp-348h] BYREF
  char v63; // [rsp+9h] [rbp-33Fh]
  char v64; // [rsp+1Dh] [rbp-32Bh]
  char v65; // [rsp+3Eh] [rbp-30Ah]
  char v66; // [rsp+5Ah] [rbp-2EEh]
  char v67; // [rsp+71h] [rbp-2D7h]
  char v68; // [rsp+80h] [rbp-2C8h] BYREF
  char v69; // [rsp+A2h] [rbp-2A6h]
  char v70; // [rsp+C5h] [rbp-283h]
  char v71; // [rsp+CCh] [rbp-27Ch]
  char v72; // [rsp+F6h] [rbp-252h]
  _WORD v73[292]; // [rsp+100h] [rbp-248h] BYREF
  char v74; // [rsp+358h] [rbp+10h] BYREF

  if ( (unsigned __int64)&v68 <= *(_QWORD *)(v38 + 16) )
  {
    LOWORD(a33) = v35;
    BYTE2(a33) = v36;
    a34 = a1;
    a35 = v37;
    sub_1400787A0();
  }
  v40 = &v74;
  for ( i = 4; i != 0; --i )
  {
    *(_OWORD *)v40 = v39;
    *((_OWORD *)v40 + 1) = v39;
    *((_OWORD *)v40 + 2) = v39;
    *((_OWORD *)v40 + 3) = v39;
    v40 += 64;
  }
  v42 = HIWORD(a1);
  v43 = v35;
  v44 = HIBYTE(v35);
  v45 = v62;
  v46 = &unk_14040F9DC;
  for ( j = 4; j != 0; --j )
  {
    *v45 = *v46;
    v45[1] = v46[1];
    v45[2] = v46[2];
    v45[3] = v46[3];
    v46 += 4;
    v45 += 4;
  }
  v62[5] = 9 - v36;
  v64 ^= v42;
  v65 ^= v36;
  v67 -= v36;
  v62[0] -= v42;
  v72 -= v43;
  v69 -= v36;
  v63 += v42;
  v71 += v44;
  v70 -= v36;
  v66 ^= v43;
  v48 = v73;
  v49 = aST;
  for ( k = 9; k != 0; --k )
  {
    *v48 = *(_OWORD *)v49;
    v48[1] = *((_OWORD *)v49 + 1);
    v48[2] = *((_OWORD *)v49 + 2);
    v48[3] = *((_OWORD *)v49 + 3);
    v49 += 32;
    v48 += 4;
  }
  *(_OWORD *)((char *)v48 - 8) = *(_OWORD *)(v49 - 4);
  for ( m = 0; m < 292; m += 2 )
  {
    v52 = (unsigned __int16)v73[m + 1];
    v53 = (unsigned __int16)v73[m];
    v54 = (unsigned int)m + ((unsigned int)v52 ^ (unsigned int)v53);
    if ( v53 >= 0x100 )
      sub_14007A5E0(a1: v54);
    v55 = v62[v53] + m + (v52 ^ v53) + 43;
    if ( v52 >= 0x100 )
      sub_14007A5E0(a1: v54);
    v62[v53] = v62[v52] + m + (v52 ^ v53) + 43;
    v62[v52] = v55;
  }
  v56 = v73;
  for ( n = 4; n != 0; --n )
  {
    *v56 = v39;
    v56[1] = v39;
    v56[2] = v39;
    v56[3] = v39;
    v56 += 4;
  }
  for ( ii = 0; ii < 256; ++ii )
    *((_BYTE *)v73 + ii) = v62[ii];
  result = &v74;
  v60 = v73;
  for ( jj = 4; jj != 0; --jj )
  {
    *(_OWORD *)result = *v60;
    *((_OWORD *)result + 1) = v60[1];
    *((_OWORD *)result + 2) = v60[2];
    *((_OWORD *)result + 3) = v60[3];
    v60 += 4;
    result += 64;
  }
  return result;
}