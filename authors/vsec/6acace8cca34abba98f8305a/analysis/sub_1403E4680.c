__int64 __fastcall sub_1403E4680()
{
  unsigned __int64 v0; // rax
  __int64 v1; // rbx
  __int64 v2; // rdi
  __int64 v3; // r14
  __int128 v4; // xmm15
  __int64 v5; // rax
  __int64 v6; // rcx
  __int64 v7; // r8
  __int64 v8; // rsi
  __int64 v9; // rdx
  _QWORD *v10; // r11
  __int64 v11; // rax
  __int64 v12; // rax
  __int64 v13; // rax
  _OWORD *v14; // r12
  _OWORD *v15; // r13
  int i; // r15d
  unsigned __int64 v17; // r13
  __int64 v18; // rax
  __int64 v19; // r12
  __int64 v20; // rax
  __int64 v21; // rax
  unsigned __int64 v22; // rcx
  int v23; // edx
  __int64 v24; // r9
  __int64 v25; // rbx
  bool v26; // cc
  unsigned __int64 v27; // rbx
  __int64 v28; // rax
  __int64 v29; // r8
  __int64 v30; // rbx
  unsigned __int64 v31; // r9
  unsigned __int64 v32; // rsi
  unsigned __int64 v33; // rcx
  __int64 v34; // rax
  __int64 v35; // rdi
  unsigned __int64 v36; // rdx
  unsigned __int64 v37; // r12
  __int64 v38; // r11
  unsigned __int64 v39; // rdx
  unsigned __int64 v40; // rbx
  unsigned __int64 v41; // rdx
  __int64 v42; // r9
  unsigned __int64 v43; // rcx
  __int64 v44; // rbx
  __int64 v45; // rsi
  __int64 v46; // r12
  unsigned __int64 v47; // rdx
  __int64 v48; // rcx
  __int64 v49; // rsi
  unsigned __int64 v50; // rcx
  __int64 v51; // rsi
  unsigned __int64 v52; // rcx
  __int64 v53; // rsi
  __int64 v54; // rax
  __int64 v55; // rax
  unsigned __int64 v56; // rcx
  __int64 v57; // rsi
  __int64 v58; // rdx
  unsigned __int64 v59; // rcx
  unsigned __int64 v60; // rsi
  unsigned __int64 v61; // rsi
  unsigned __int64 v62; // rcx
  unsigned __int64 v63; // rcx
  __int64 v64; // rdi
  __int64 v65; // rcx
  unsigned __int64 v66; // rcx
  unsigned __int64 v67; // rcx
  double v68; // xmm0_8
  unsigned __int64 v69; // rcx
  double v70; // xmm1_8
  unsigned __int64 v71; // rcx
  double v72; // r9
  unsigned __int64 v73; // rcx
  unsigned __int64 v74; // rdx
  unsigned __int64 v75; // rdx
  unsigned __int64 v76; // rdx
  unsigned __int64 v77; // rdx
  unsigned __int64 v78; // rdx
  unsigned __int64 v79; // rdx
  unsigned __int64 v80; // rdx
  unsigned __int64 v81; // rdx
  unsigned __int64 v82; // rdx
  unsigned __int64 v83; // rdx
  unsigned __int64 v84; // rcx
  unsigned __int64 v85; // rdx
  unsigned __int64 v86; // rsi
  unsigned __int64 v87; // rdx
  unsigned __int64 v88; // rsi
  unsigned __int64 v89; // rdx
  unsigned __int64 v90; // rsi
  unsigned __int64 v91; // rdx
  unsigned __int64 v92; // rsi
  unsigned __int64 v93; // rdx
  unsigned __int64 v94; // rsi
  unsigned __int64 v95; // rdx
  unsigned __int64 v96; // rsi
  unsigned __int64 v97; // rcx
  unsigned __int64 v98; // rcx
  unsigned __int64 v99; // r11
  unsigned __int64 v100; // rcx
  __int64 v101; // r12
  __int64 v102; // r8
  __int64 v103; // rcx
  unsigned __int64 v104; // r13
  __int64 v105; // rax
  __int64 v106; // rbx
  unsigned __int64 v107; // rcx
  _OWORD *v108; // rsi
  void *v109; // r9
  unsigned __int64 v110; // r12
  __int64 (__fastcall *v111)(void *); // rsi
  unsigned __int64 v112; // rbx
  __int64 v113; // rax
  int v114; // edx
  int v115; // r9d
  unsigned __int64 v116; // r8
  unsigned __int64 v117; // rcx
  __int64 v118; // rdx
  unsigned __int64 v119; // rbx
  unsigned __int64 v120; // rcx
  unsigned __int64 v121; // r9
  __int64 v122; // r8
  unsigned __int64 v123; // rdi
  __int64 v124; // r10
  unsigned __int64 v125; // rbx
  __int64 v126; // rax
  unsigned __int64 v127; // rcx
  unsigned __int64 v128; // rcx
  __int64 v129; // rax
  __int64 v130; // xmm0_8
  unsigned __int64 v131; // rax
  unsigned __int64 v132; // rbx
  unsigned __int64 v133; // rbx
  unsigned __int64 v134; // rbx
  unsigned __int64 v135; // rbx
  __int64 v136; // rsi
  __int64 v137; // rax
  __int64 v138; // rsi
  __int64 v139; // rax
  __int64 v140; // rsi
  __int64 v141; // rsi
  unsigned __int64 v142; // rsi
  unsigned __int64 v143; // rsi
  unsigned __int64 v144; // rsi
  unsigned __int64 v145; // rcx
  __int64 v146; // rcx
  __int64 v147; // rcx
  unsigned __int64 v148; // rcx
  unsigned __int64 v149; // rcx
  unsigned __int64 v150; // rcx
  double v151; // r9
  unsigned __int64 v152; // rdx
  unsigned __int64 v153; // rdx
  unsigned __int64 v154; // rdx
  unsigned __int64 v155; // rdx
  unsigned __int64 v156; // rdx
  unsigned __int64 v157; // rdx
  unsigned __int64 v158; // rdx
  unsigned __int64 v159; // rdx
  unsigned __int64 v160; // rdx
  unsigned __int64 v161; // rdx
  unsigned __int64 v162; // rdx
  unsigned __int64 v163; // rdx
  unsigned __int64 v164; // rdx
  unsigned __int64 v165; // rdx
  unsigned __int64 v166; // rdx
  unsigned __int64 v167; // rdx
  unsigned __int64 v168; // rsi
  unsigned __int64 v169; // rdx
  unsigned __int64 v170; // rsi
  unsigned __int64 v171; // rdx
  unsigned __int64 v172; // rsi
  unsigned __int64 v173; // rdx
  unsigned __int64 v174; // rsi
  unsigned __int64 v175; // rdx
  unsigned __int64 v176; // rsi
  unsigned __int64 v177; // rdx
  unsigned __int64 v178; // rsi
  unsigned __int64 v179; // rdx
  unsigned __int64 v180; // rsi
  unsigned __int64 v181; // rdx
  unsigned __int64 v182; // rsi
  unsigned __int64 v183; // rdx
  unsigned __int64 v184; // rsi
  unsigned __int64 v185; // rdx
  unsigned __int64 v186; // rsi
  unsigned __int64 v187; // rdx
  unsigned __int64 v188; // rsi
  __int64 v189; // rax
  unsigned __int64 v190; // rdi
  unsigned __int64 v191; // r11
  unsigned __int64 v192; // rcx
  __int64 v193; // r12
  __int64 v194; // r8
  unsigned __int64 v195; // r13
  __int64 v196; // rax
  __int64 v197; // rbx
  unsigned __int64 v198; // rcx
  _OWORD *v199; // rsi
  unsigned __int64 v200; // r11
  unsigned __int64 v201; // rcx
  __int64 v202; // r12
  __int64 v203; // r8
  unsigned __int64 v204; // r13
  __int64 v205; // rax
  __int64 v206; // rbx
  unsigned __int64 v207; // rcx
  _OWORD *v208; // rsi
  __int64 v209; // rax
  void *v210; // r9
  unsigned __int64 v211; // r12
  __int64 (__fastcall *v212)(void *); // rsi
  unsigned __int64 v213; // rbx
  __int64 v214; // rax
  int v215; // edx
  int v216; // r9d
  unsigned __int64 v217; // r8
  unsigned __int64 v218; // rcx
  __int64 v219; // rdx
  unsigned __int64 v220; // rbx
  void *v221; // r9
  unsigned __int64 v222; // r12
  __int64 (__fastcall *v223)(void *); // rsi
  __int64 v224; // rax
  int v225; // edx
  int v226; // r9d
  unsigned __int64 v227; // rbx
  unsigned __int64 v228; // rcx
  unsigned __int64 v229; // r9
  __int64 v230; // r8
  unsigned __int64 v231; // rdi
  __int64 v232; // r10
  unsigned __int64 v233; // rbx
  __int64 v234; // rax
  unsigned __int64 v235; // rcx
  unsigned __int64 v236; // rcx
  __int64 v237; // rax
  unsigned __int64 v238; // rcx
  __int64 v239; // r8
  __int64 v240; // rax
  unsigned __int64 v241; // rdx
  unsigned __int64 v242; // rsi
  unsigned __int64 v243; // rcx
  unsigned __int64 v245; // rdi
  __int64 v246; // rax
  unsigned __int64 v247; // rbx
  unsigned __int64 v248; // rcx
  unsigned __int64 v249; // rcx
  __int64 v250; // r8
  __int64 v251; // rax
  unsigned __int64 v252; // rdx
  unsigned __int64 v253; // rsi
  unsigned __int64 v254; // rcx
  unsigned __int64 v255; // rdi
  __int64 v256; // rax
  unsigned __int64 v257; // rbx
  unsigned __int64 v258; // rcx
  unsigned __int8 v259; // [rsp+1h] [rbp-379h]
  _BYTE v260[56]; // [rsp+2h] [rbp-378h] BYREF
  char v261; // [rsp+3Ah] [rbp-340h] BYREF
  unsigned __int64 v262; // [rsp+102h] [rbp-278h]
  unsigned __int64 v263; // [rsp+10Ah] [rbp-270h]
  unsigned __int64 v264; // [rsp+112h] [rbp-268h]
  unsigned __int64 v265; // [rsp+11Ah] [rbp-260h]
  unsigned __int64 v266; // [rsp+122h] [rbp-258h]
  __int64 v267; // [rsp+12Ah] [rbp-250h]
  unsigned __int64 v268; // [rsp+132h] [rbp-248h]
  unsigned __int64 v269; // [rsp+13Ah] [rbp-240h]
  __int64 v270; // [rsp+142h] [rbp-238h]
  unsigned __int64 v271; // [rsp+14Ah] [rbp-230h]
  unsigned __int64 v272; // [rsp+152h] [rbp-228h]
  double v273; // [rsp+15Ah] [rbp-220h]
  double v274; // [rsp+162h] [rbp-218h]
  unsigned __int64 v275; // [rsp+16Ah] [rbp-210h]
  unsigned __int64 v276; // [rsp+172h] [rbp-208h]
  __int64 v277; // [rsp+17Ah] [rbp-200h]
  unsigned __int64 v278; // [rsp+182h] [rbp-1F8h]
  unsigned __int64 v279; // [rsp+18Ah] [rbp-1F0h]
  unsigned __int64 v280; // [rsp+192h] [rbp-1E8h]
  unsigned __int64 v281; // [rsp+19Ah] [rbp-1E0h]
  unsigned __int64 v282; // [rsp+1A2h] [rbp-1D8h]
  __int64 v283; // [rsp+1AAh] [rbp-1D0h]
  __int64 v284; // [rsp+1B2h] [rbp-1C8h]
  __int64 v285; // [rsp+1BAh] [rbp-1C0h]
  __int64 v286; // [rsp+1C2h] [rbp-1B8h]
  unsigned __int64 v287; // [rsp+1CAh] [rbp-1B0h]
  unsigned __int64 v288; // [rsp+1D2h] [rbp-1A8h]
  void *v289; // [rsp+1DAh] [rbp-1A0h]
  void *v290; // [rsp+1E2h] [rbp-198h]
  unsigned __int64 v291; // [rsp+1EAh] [rbp-190h]
  __int64 v292; // [rsp+1F2h] [rbp-188h]
  unsigned __int64 v293; // [rsp+1FAh] [rbp-180h]
  __int64 v294; // [rsp+202h] [rbp-178h]
  __int64 v295; // [rsp+20Ah] [rbp-170h]
  unsigned __int64 v296; // [rsp+212h] [rbp-168h]
  __int64 v297; // [rsp+21Ah] [rbp-160h]
  unsigned __int64 v298; // [rsp+222h] [rbp-158h]
  unsigned __int64 v299; // [rsp+22Ah] [rbp-150h]
  __int64 v300; // [rsp+232h] [rbp-148h]
  unsigned __int64 v301; // [rsp+23Ah] [rbp-140h]
  unsigned __int64 v302; // [rsp+242h] [rbp-138h]
  __int64 v303; // [rsp+24Ah] [rbp-130h]
  __int64 v304; // [rsp+252h] [rbp-128h]
  __int64 v305; // [rsp+25Ah] [rbp-120h]
  _QWORD *v306; // [rsp+262h] [rbp-118h]
  _UNKNOWN **v307; // [rsp+26Ah] [rbp-110h]
  __int64 v308; // [rsp+272h] [rbp-108h]
  __int64 v309; // [rsp+27Ah] [rbp-100h]
  __int64 v310; // [rsp+282h] [rbp-F8h]
  _QWORD *v311; // [rsp+28Ah] [rbp-F0h]
  __int64 v312; // [rsp+292h] [rbp-E8h]
  _UNKNOWN **v313; // [rsp+29Ah] [rbp-E0h]
  __int64 v314; // [rsp+2A2h] [rbp-D8h]
  __int64 v315; // [rsp+2AAh] [rbp-D0h]
  __int64 v316; // [rsp+2B2h] [rbp-C8h]
  unsigned __int64 v317; // [rsp+2BAh] [rbp-C0h]
  unsigned __int64 v318; // [rsp+2C2h] [rbp-B8h]
  _BYTE *v319; // [rsp+2CAh] [rbp-B0h]
  _UNKNOWN **v320; // [rsp+2D2h] [rbp-A8h]
  __int64 v321; // [rsp+2DAh] [rbp-A0h]
  __int64 v322; // [rsp+2E2h] [rbp-98h]
  __int64 v323; // [rsp+2EAh] [rbp-90h]
  __int64 v324; // [rsp+2F2h] [rbp-88h]
  __int64 v325; // [rsp+2FAh] [rbp-80h]
  __int128 v326; // [rsp+302h] [rbp-78h] BYREF
  _QWORD v327[3]; // [rsp+312h] [rbp-68h]
  __int128 v328; // [rsp+32Ah] [rbp-50h] BYREF
  _QWORD v329[3]; // [rsp+33Ah] [rbp-40h]
  __int128 v330; // [rsp+352h] [rbp-28h] BYREF
  _QWORD v331[3]; // [rsp+362h] [rbp-18h]
  unsigned __int64 v332; // [rsp+38Ah] [rbp+10h]

  if ( (unsigned __int64)&v261 <= *(_QWORD *)(v3 + 16) )
    sub_1400787A0();
  v332 = v0;
  if ( v1 == 0 )
  {
    v5 = sub_14001F280(a1: 1);
    *(_OWORD *)(v5 + 8) = v4;
    if ( dword_14069FEF0 != 0 )
    {
      v8 = *(_QWORD *)(v5 + 24);
      v5 = sub_14007A240(a1: v6, a2: *(_QWORD *)v5, a3: v7);
      *v10 = v9;
      v10[1] = v8;
    }
    *(_QWORD *)v5 = 0;
    *(_QWORD *)(v5 + 24) = 0;
    v1 = v5;
  }
  v325 = v1;
  v11 = sub_1400758A0(a1: 32);
  if ( v332 >= qword_14063E518 )
    ((void (__noreturn *)(void))sub_14007A5E0)();
  v324 = v11;
  v12 = sub_140059C20(a1: v2);
  if ( v332 >= qword_14063E518 )
    goto LABEL_968;
  v323 = v12;
  v268 = *((_QWORD *)off_14063E510 + v332);
  v307 = off_14063E4D0;
  v266 = qword_14063E4D8;
  v267 = qword_14063E4E0;
  v277 = qword_14061C570;
  sub_1403E4420();
  v13 = qword_140658E28;
  v279 = qword_140658E28;
  v312 = qword_140658E20;
  v280 = qword_14063E558;
  v313 = off_14063E550;
  v311 = off_14063E510;
  v278 = qword_14063E518;
  v265 = qword_14063E538;
  v306 = off_14063E530;
  v320 = off_14063E4F0;
  v293 = qword_14063E4F8;
  v14 = v260;
  v15 = &unk_1406A0780;
  for ( i = 4; i != 0; --i )
  {
    *v14 = *v15;
    v14[1] = v15[1];
    v14[2] = v15[2];
    v14[3] = v15[3];
    v15 += 4;
    v14 += 4;
  }
  if ( qword_14061C590 != 0 )
  {
    if ( qword_14061C590 == sub_1403EBBE0(a1: v267) )
    {
      v13 = v279;
      goto LABEL_13;
    }
    ((void (__fastcall *)(__int64))*off_140644528[8])(a1: 4294967253LL);
    sub_140072380();
    sub_140074180();
LABEL_968:
    ((void (__noreturn *)(void))sub_14007A5E0)();
  }
LABEL_13:
  v17 = v332;
  if ( v332 >= qword_14063E4B8 )
    ((void (__noreturn *)(void))sub_14007A5E0)();
  if ( *((_QWORD *)off_14063E4B0 + v332) != 0 )
  {
    if ( v332 >= v266 )
      ((void (__noreturn *)(void))sub_14007A5E0)();
    v18 = sub_1403EBDC0(a1: v307[3 * v332 + 2]);
    if ( v332 < qword_14063E4B8 )
    {
      if ( *((_QWORD *)off_14063E4B0 + v332) == v18 )
      {
        v13 = v279;
        v17 = v332;
        goto LABEL_19;
      }
      ((void (__fastcall *)(_QWORD))*off_140644528[12])(a1: *((unsigned int *)off_140644550 + 1));
      sub_140072380();
      sub_140074180();
    }
    ((void (__noreturn *)(void))sub_14007A5E0)();
  }
LABEL_19:
  v275 = 0;
  v310 = v324;
  v276 = 32;
  v309 = 0;
  v270 = 0;
  v271 = 0;
  v308 = v323;
  v295 = v13;
  v269 = v268;
  v19 = 0;
  while ( 2 )
  {
    v272 = v19;
    v291 = v17;
    v20 = sub_1403EBBA0();
    if ( v291 >= v266 )
      sub_14007A5E0(a1: v20 ^ ((_BYTE)v20 * ((_BYTE)v20 + 1)) & 1);
    v292 = v20 ^ ((_BYTE)v20 * ((_BYTE)v20 + 1)) & 1;
    v302 = 3 * v291;
    v289 = v307[3 * v291 + 1];
    v319 = v307[3 * v291];
    v290 = v307[3 * v291 + 2];
    sub_1403EBBA0();
    v21 = sub_1403EBBA0();
    v22 = v272;
    v23 = (int)v289;
    if ( v272 >= (unsigned __int64)v289 )
LABEL_961:
      sub_14007A5E0(a1: v22);
    v24 = (unsigned __int8)v260[(unsigned __int8)(v21 ^ v319[v272] ^ BYTE1(v21) ^ BYTE2(v21))];
    if ( (unsigned __int8)v24 > 7u )
    {
      if ( (unsigned __int8)(v24 - 45) <= 6u || (_BYTE)v24 == 55 )
      {
LABEL_30:
        v25 = 9;
        goto LABEL_32;
      }
    }
    else if ( (_BYTE)v24 != 0 && ((unsigned __int8)v24 <= 2u || (unsigned __int8)v24 >= 6u) )
    {
      goto LABEL_30;
    }
    v25 = 1;
LABEL_32:
    if ( v25 > 1 )
    {
      v259 = v260[(unsigned __int8)(v21 ^ v319[v272] ^ BYTE1(v21) ^ BYTE2(v21))];
      v283 = sub_1403EBBA0();
      v27 = sub_1403EC060() ^ v283;
      v26 = v259 <= 7u;
      v24 = v259;
      v22 = v272;
    }
    else
    {
      v26 = (unsigned __int8)v24 <= 7u;
      v27 = 0;
    }
    if ( v26 )
    {
      if ( (_BYTE)v24 == 0 || (unsigned __int8)v24 > 2u && (unsigned __int8)v24 < 6u )
        goto LABEL_43;
    }
    else if ( (unsigned __int8)(v24 - 45) > 6u && (_BYTE)v24 != 55 )
    {
LABEL_43:
      v28 = 1;
      goto LABEL_44;
    }
    v28 = 9;
LABEL_44:
    v29 = v28 + v22;
    if ( ((((unsigned int)v22 ^ (unsigned int)v277) * (((unsigned int)v22 ^ (unsigned int)v277) + 1)) & 1) != 0 )
      v29 = 0;
    v294 = v29;
    v301 = v27;
    switch ( v24 )
    {
      case 0LL:
      case 55LL:
      case 57LL:
      case 58LL:
      case 144LL:
      case 145LL:
      case 148LL:
      case 149LL:
        v30 = v270;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 1LL:
        v39 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_285;
        v34 = v310;
        goto LABEL_286;
      case 2LL:
        v39 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_285;
        v34 = v310;
        goto LABEL_286;
      case 3LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_290;
      case 4LL:
        v40 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: v22);
        v41 = v275 + 1;
        v34 = v310;
        v42 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v33 = v276;
        if ( v276 < v275 + 1 )
        {
          v300 = *(_QWORD *)(v310 + 8 * v275 - 8);
          v34 = sub_140075980(a1: v276, a2: v41, a3: v29, a4: v42);
          v29 = v294;
          v42 = v300;
          v41 = v40 + 1;
        }
        goto LABEL_59;
      case 5LL:
        v43 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        v44 = v310;
        v45 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_300;
      case 6LL:
        v36 = v268;
        if ( v27 >= v268 )
          sub_14007A5E0(a1: v22);
        v31 = v275 + 1;
        v38 = v308;
        v46 = *(_QWORD *)(v308 + 8 * v27);
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_308;
        v34 = v310;
        goto LABEL_309;
      case 7LL:
        v47 = v275 - 1;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        v48 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v27 >= v268 )
          sub_14007A5E0(a1: v48);
        goto LABEL_69;
      case 8LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = (*(_QWORD *)(v310 + 8 * v275 - 8) ^ *(_QWORD *)(v310 + 8 * v275 - 16))
            + 2LL * (*(_QWORD *)(v310 + 8 * v275 - 8) & *(_QWORD *)(v310 + 8 * v275 - 16));
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_378;
      case 9LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 16) - *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_375;
      case 10LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = *(_QWORD *)(v310 + 8 * v275 - 8) * *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_378;
      case 11LL:
        v52 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v53 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v54 = *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v53 == 0 )
          sub_1400458A0();
        if ( v53 == -1 )
          v55 = -v54;
        else
          v55 = v54 / v53;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_358;
      case 12LL:
        v56 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v57 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v57 == 0 )
          sub_1400458A0();
        if ( v57 == -1 )
          v58 = 0;
        else
          v58 = *(_QWORD *)(v310 + 8 * v275 - 16) % v57;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_366;
      case 13LL:
        v59 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_94;
      case 14LL:
        v52 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v60 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v60 == 0 )
          sub_1400458A0();
        v55 = *(_QWORD *)(v310 + 8 * v275 - 16) / v60;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_358;
      case 15LL:
        v56 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v61 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v61 == 0 )
          sub_1400458A0();
        v58 = *(_QWORD *)(v310 + 8 * v275 - 16) % v61;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_366;
      case 16LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 8) & *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_375;
      case 17LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 8) | *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_375;
      case 18LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = ~(*(_QWORD *)(v310 + 8 * v275 - 8) & *(_QWORD *)(v310 + 8 * v275 - 16))
            & (*(_QWORD *)(v310 + 8 * v275 - 8) | *(_QWORD *)(v310 + 8 * v275 - 16));
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_378;
      case 19LL:
        v62 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_113;
      case 20LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v63 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v31 = v275 - 1;
        v64 = -(__int64)(v63 < 0x40) & (*(_QWORD *)(v310 + 8 * v275 - 16) << v63);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v63);
        goto LABEL_395;
      case 21LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v31 = v275 - 1;
        v65 = -(__int64)(*(_QWORD *)(v310 + 8 * v275 - 8) >= 0x40u) | *(_QWORD *)(v310 + 8 * v275 - 8);
        v64 = *(__int64 *)(v310 + 8 * v275 - 16) >> v65;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v65);
        goto LABEL_395;
      case 22LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v66 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v31 = v275 - 1;
        v64 = -(__int64)(v66 < 0x40) & (*(_QWORD *)(v310 + 8 * v275 - 16) >> v66);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v66);
        goto LABEL_395;
      case 23LL:
        v67 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v68 = *(double *)(v310 + 8 * v275 - 8) + *(double *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_413;
      case 24LL:
        v69 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v70 = *(double *)(v310 + 8 * v275 - 16) - *(double *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_407;
      case 25LL:
        v67 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v68 = *(double *)(v310 + 8 * v275 - 8) * *(double *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_413;
      case 26LL:
        v71 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v72 = *(double *)(v310 + 8 * v275 - 16);
        v274 = *(double *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        *(double *)(v310 + 8 * v275 - 16) = v72 / v274;
        v30 = v270;
        v31 = v71 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 27LL:
        v73 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_420;
      case 28LL:
        v74 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v74 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        else
        {
          if ( v31 <= v74 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        goto LABEL_511;
      case 29LL:
        v75 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v75 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v75 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 30LL:
        v76 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) <= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v76 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v76 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 31LL:
        v77 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) < *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v77 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v77 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 32LL:
        v78 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) >= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v78 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v78 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 33LL:
        v79 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) > *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v79 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v79 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 34LL:
        v80 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) <= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v80 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v80 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 35LL:
        v81 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) < *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v81 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v81 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 36LL:
        v82 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) >= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v82 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v82 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 37LL:
        v83 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) > *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v83 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v83 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 38LL:
        v84 = v275;
        v85 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v86 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) == *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v86 <= v85 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        else
        {
          if ( v86 <= v85 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        goto LABEL_578;
      case 39LL:
        v84 = v275;
        v87 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v88 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) == *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v88 <= v87 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v88 <= v87 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 40LL:
        v84 = v275;
        v89 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v90 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) <= *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v90 <= v89 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v90 <= v89 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 41LL:
        v84 = v275;
        v91 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v92 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) < *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v92 <= v91 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v92 <= v91 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 42LL:
        v84 = v275;
        v93 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v94 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 16) <= *(double *)(v310 + 8 * v275 - 8) )
        {
          if ( v94 <= v93 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v94 <= v93 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 43LL:
        v84 = v275;
        v95 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v96 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 16) < *(double *)(v310 + 8 * v275 - 8) )
        {
          if ( v96 <= v95 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v96 <= v95 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 44LL:
        v97 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_582;
      case 45LL:
        v98 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_586;
      case 46LL:
      case 131LL:
      case 132LL:
        v30 = v270;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v29 = v301;
        goto LABEL_20;
      case 47LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) != 0 )
          v27 = v29;
        goto LABEL_599;
      case 48LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == 0 )
          v27 = v29;
        goto LABEL_599;
      case 49LL:
        if ( v27 >= v265 )
          sub_14007A5E0(a1: v22);
        v99 = v306[v27];
        v100 = v275;
        v101 = v275 - v99;
        if ( v275 < v99 )
          sub_14007A5E0(a1: v275);
        v275 -= v99;
        *(_QWORD *)&v330 = v291;
        *((_QWORD *)&v330 + 1) = v308;
        v331[0] = v268;
        v331[1] = v269;
        v331[2] = v29;
        v102 = v270 + 1;
        v103 = v100 - v101;
        v286 = v103;
        v316 = v310 + (((__int64)(v101 - v276) >> 63) & (8 * v101));
        v104 = v271;
        if ( v271 < v270 + 1 )
        {
          v106 = v270 + 1;
          v105 = sub_140075980(a1: v271, a2: v265, a3: v102, a4: (_DWORD)v306);
          v102 = v106;
          v104 = v107;
          v103 = v286;
          v27 = v301;
        }
        else
        {
          v105 = v309;
        }
        v322 = v105;
        v270 = v102;
        v271 = v104;
        v108 = (_OWORD *)(v105 + 40 * v102 - 40);
        if ( dword_14069FEF0 != 0 )
        {
          v321 = v105 + 40 * v102 - 40;
          sub_1400220A0(a1: &v330);
          v103 = v286;
          v27 = v301;
          v108 = (_OWORD *)v321;
        }
        *v108 = v330;
        qmemcpy(v108 + 1, v331, 24);
        if ( v27 >= v278 )
          sub_14007A5E0(a1: v103);
        goto LABEL_617;
      case 50LL:
        if ( v27 >= v280 )
          sub_14007A5E0(a1: v22);
        v109 = v313[3 * v27 + 1];
        if ( v275 < (unsigned __int64)v109 )
          sub_14007A5E0(a1: v275);
        v110 = v310 + (((__int64)(v275 - (_QWORD)v109 - v276) >> 63) & (8 * (v275 - (_QWORD)v109)));
        if ( v27 >= v279 )
          sub_14007A5E0(a1: v109);
        v302 = v275 - (_QWORD)v109;
        v111 = **(__int64 (__fastcall ***)(void *))(v312 + 8 * v27);
        v112 = v310 + (((__int64)(v275 - (_QWORD)v109 - v276) >> 63) & (8 * (v275 - (_QWORD)v109)));
        v113 = v111(a1: v109);
        v116 = v110 + v302;
        v117 = v276;
        if ( v276 < v110 + v302 )
        {
          v264 = v110;
          v305 = v113;
          v119 = v110 + v302;
          v118 = sub_140075980(a1: v276, a2: v114, a3: v116, a4: v115);
          v116 = v119;
          v112 = v264;
        }
        else
        {
          v118 = v310;
        }
        goto LABEL_260;
      case 51LL:
        if ( v270 == 0 )
        {
          if ( v275 < v27 )
            sub_14007A5E0(a1: v275);
          v238 = v27;
          v239 = ((__int64)(v275 - v27 - v276) >> 63) & (8 * (v275 - v27));
          if ( v27 != 0 )
          {
            v302 = v27;
            v322 = v310 + v239;
            v240 = sub_140075980(a1: 0, a2: v310, a3: v239, a4: v24);
            v241 = v27;
            v242 = v243;
            v238 = v302;
          }
          else
          {
            v240 = 0;
            v241 = 0;
            v242 = 0;
          }
          v322 = v240;
          v302 = v241;
          v299 = v242;
          sub_14007A980(a1: 8 * v238);
          return v322;
        }
        v120 = v275;
        if ( v275 < v27 )
          sub_14007A5E0(a1: v275);
        v121 = v276;
        v302 = *(_QWORD *)(v309 + 40 * v270 - 40);
        v322 = *(_QWORD *)(v309 + 40 * v270 - 32);
        v299 = *(_QWORD *)(v309 + 40 * v270 - 24);
        v298 = *(_QWORD *)(v309 + 40 * v270 - 16);
        v122 = *(_QWORD *)(v309 + 40 * v270 - 8);
        v297 = v122;
        v123 = v27;
        v124 = v310;
        if ( v275 > v276 )
        {
          v296 = v275 - v27;
          v288 = v27;
          v318 = v310 + (((__int64)(v275 - v27 - v276) >> 63) & (8 * (v275 - v27)));
          v125 = v275;
          v126 = sub_140075980(a1: v276, a2: v270, a3: v122, a4: v276);
          v123 = v288;
          v124 = v126;
          v121 = v127;
          v120 = v125;
        }
        v276 = v121;
        v310 = v124;
        v275 = v120;
        sub_14007A980(a1: 8 * v123);
        v30 = v270 - 1;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v302;
        v34 = v310;
        v35 = v309;
        v36 = v299;
        v37 = v298;
        v38 = v322;
        v29 = v297;
        goto LABEL_20;
      case 52LL:
        v128 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        --v275;
        v282 = *(_QWORD *)(v310 + 8 * v128 - 8);
        v300 = sub_1403EBBA0();
        v129 = sub_1403EBBA0();
        if ( v291 >= v293 )
          sub_14007A5E0(a1: v291);
        if ( (unsigned __int64)v320[v302 + 1] <= v282 )
          sub_14007A5E0(a1: v291);
        v29 = v129 ^ qword_14061C580 ^ *((_QWORD *)v320[v302] + v282) ^ qword_14061C578 ^ v300;
        v30 = v270;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 53LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275 - 2);
        v302 = v275 - 2;
        v299 = v275 - 1;
        sub_1403EC100();
        v131 = v299;
        if ( v299 <= v302 )
          sub_14007A5E0(a1: v302);
        goto LABEL_272;
      case 54LL:
        v132 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_275;
        v34 = v310;
        goto LABEL_276;
      case 56LL:
        v245 = v275;
        if ( v275 != 0 )
        {
          v247 = v275;
          v246 = sub_140075980(a1: 0, a2: v23, a3: v29, a4: v24);
          v245 = v275;
        }
        else
        {
          v246 = 0;
          v247 = 0;
          v248 = 0;
        }
        v322 = v246;
        v302 = v247;
        v299 = v248;
        sub_14007A980(a1: 8 * v245);
        return v322;
      case 59LL:
        v39 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_285;
        v34 = v310;
        goto LABEL_286;
      case 60LL:
        v39 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_285;
        v34 = v310;
        goto LABEL_286;
      case 61LL:
        v39 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
        {
LABEL_285:
          v133 = v275 + 1;
          v34 = sub_140075980(a1: v276, a2: v39, a3: v29, a4: v24);
          v29 = v294;
          v39 = v133;
          v27 = v301;
        }
        else
        {
          v34 = v310;
        }
LABEL_286:
        *(_QWORD *)(v34 + 8 * v39 - 8) = v27;
        v30 = v270;
        v31 = v39;
        v32 = v271;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 62LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_290;
      case 63LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
LABEL_290:
        v30 = v270;
        v31 = v275 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 64LL:
        v134 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: v22);
        v41 = v275 + 1;
        v34 = v310;
        v42 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v33 = v276;
        if ( v276 < v275 + 1 )
        {
          v300 = *(_QWORD *)(v310 + 8 * v275 - 8);
          v34 = sub_140075980(a1: v276, a2: v41, a3: v29, a4: v42);
          v29 = v294;
          v42 = v300;
          v41 = v134 + 1;
        }
LABEL_59:
        *(_QWORD *)(v34 + 8 * v41 - 8) = v42;
        v30 = v270;
        v31 = v41;
        v32 = v271;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 65LL:
        v43 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        v44 = v310;
        v45 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_300;
      case 66LL:
        v43 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        v44 = v310;
        v45 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
LABEL_300:
        *(_QWORD *)(v310 + 8 * v275 - 8) = *(_QWORD *)(v310 + 8 * v275 - 16);
        *(_QWORD *)(v44 + 8 * v43 - 16) = v45;
        v30 = v270;
        v31 = v43;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 67LL:
        v36 = v268;
        if ( v27 >= v268 )
          sub_14007A5E0(a1: v22);
        v31 = v275 + 1;
        v38 = v308;
        v46 = *(_QWORD *)(v308 + 8 * v27);
        v33 = v276;
        if ( v276 < v275 + 1 )
          goto LABEL_308;
        v34 = v310;
        goto LABEL_309;
      case 68LL:
        v36 = v268;
        if ( v27 >= v268 )
          sub_14007A5E0(a1: v22);
        v31 = v275 + 1;
        v38 = v308;
        v46 = *(_QWORD *)(v308 + 8 * v27);
        v33 = v276;
        if ( v276 < v275 + 1 )
        {
LABEL_308:
          v300 = *(_QWORD *)(v308 + 8 * v27);
          v135 = v275 + 1;
          v34 = sub_140075980(a1: v276, a2: v268, a3: v29, a4: v31);
          v36 = v268;
          v29 = v294;
          v38 = v308;
          v46 = v300;
          v31 = v135;
        }
        else
        {
          v34 = v310;
        }
LABEL_309:
        *(_QWORD *)(v34 + 8 * v31 - 8) = v46;
        v30 = v270;
        v32 = v271;
        v17 = v291;
        v35 = v309;
        v37 = v269;
        goto LABEL_20;
      case 69LL:
        v47 = v275 - 1;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        v48 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v27 >= v268 )
          sub_14007A5E0(a1: v48);
LABEL_69:
        *(_QWORD *)(v308 + 8 * v27) = v48;
        v30 = v270;
        v31 = v47;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 70LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = (*(_QWORD *)(v310 + 8 * v275 - 8) ^ *(_QWORD *)(v310 + 8 * v275 - 16))
            + 2LL * (*(_QWORD *)(v310 + 8 * v275 - 8) & *(_QWORD *)(v310 + 8 * v275 - 16));
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_378;
      case 71LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 16) - *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_375;
      case 72LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = *(_QWORD *)(v310 + 8 * v275 - 8) * *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_378;
      case 73LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = *(_QWORD *)(v310 + 8 * v275 - 8) * *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_378;
      case 74LL:
        v52 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v136 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v137 = *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v136 == 0 )
          sub_1400458A0();
        if ( v136 == -1 )
          v55 = -v137;
        else
          v55 = v137 / v136;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_358;
      case 75LL:
        v52 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v138 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v139 = *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v138 == 0 )
          sub_1400458A0();
        if ( v138 == -1 )
          v55 = -v139;
        else
          v55 = v139 / v138;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_358;
      case 76LL:
        v56 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v140 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v140 == 0 )
          sub_1400458A0();
        if ( v140 == -1 )
          v58 = 0;
        else
          v58 = *(_QWORD *)(v310 + 8 * v275 - 16) % v140;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_366;
      case 77LL:
        v56 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v141 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v141 == 0 )
          sub_1400458A0();
        if ( v141 == -1 )
          v58 = 0;
        else
          v58 = *(_QWORD *)(v310 + 8 * v275 - 16) % v141;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_366;
      case 78LL:
        v59 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
LABEL_94:
        v34 = v310;
        *(_QWORD *)(v310 + 8 * v275 - 8) = -*(_QWORD *)(v310 + 8 * v275 - 8);
        v30 = v270;
        v31 = v59;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 79LL:
        v52 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v142 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v142 == 0 )
          sub_1400458A0();
        v55 = *(_QWORD *)(v310 + 8 * v275 - 16) / v142;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
LABEL_358:
        *(_QWORD *)(v310 + 8 * v275 - 16) = v55;
        v30 = v270;
        v31 = v52 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 80LL:
        v56 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v143 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v143 == 0 )
          sub_1400458A0();
        v58 = *(_QWORD *)(v310 + 8 * v275 - 16) % v143;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_366;
      case 81LL:
        v56 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v144 = *(_QWORD *)(v310 + 8 * v275 - 8);
        if ( v144 == 0 )
          sub_1400458A0();
        v58 = *(_QWORD *)(v310 + 8 * v275 - 16) % v144;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
LABEL_366:
        *(_QWORD *)(v310 + 8 * v275 - 16) = v58;
        v30 = v270;
        v31 = v56 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 82LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 8) & *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_375;
      case 83LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 8) | *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_375;
      case 84LL:
        v50 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v51 = *(_QWORD *)(v310 + 8 * v275 - 8) | *(_QWORD *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
LABEL_375:
        *(_QWORD *)(v310 + 8 * v275 - 16) = v51;
        v30 = v270;
        v31 = v50 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 85LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        v49 = ~(*(_QWORD *)(v310 + 8 * v275 - 8) & *(_QWORD *)(v310 + 8 * v275 - 16))
            & (*(_QWORD *)(v310 + 8 * v275 - 8) | *(_QWORD *)(v310 + 8 * v275 - 16));
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
LABEL_378:
        *(_QWORD *)(v310 + 8 * v275 - 16) = v49;
        v30 = v270;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 86LL:
        v62 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
LABEL_113:
        v34 = v310;
        *(_QWORD *)(v310 + 8 * v275 - 8) = ~*(_QWORD *)(v310 + 8 * v275 - 8);
        v30 = v270;
        v31 = v62;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 87LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v145 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v31 = v275 - 1;
        v64 = -(__int64)(v145 < 0x40) & (*(_QWORD *)(v310 + 8 * v275 - 16) << v145);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v145);
        goto LABEL_395;
      case 88LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v31 = v275 - 1;
        v146 = -(__int64)(*(_QWORD *)(v310 + 8 * v275 - 8) >= 0x40u) | *(_QWORD *)(v310 + 8 * v275 - 8);
        v64 = *(__int64 *)(v310 + 8 * v275 - 16) >> v146;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v146);
        goto LABEL_395;
      case 89LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v31 = v275 - 1;
        v147 = -(__int64)(*(_QWORD *)(v310 + 8 * v275 - 8) >= 0x40u) | *(_QWORD *)(v310 + 8 * v275 - 8);
        v64 = *(__int64 *)(v310 + 8 * v275 - 16) >> v147;
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v147);
        goto LABEL_395;
      case 90LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v148 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v31 = v275 - 1;
        v64 = -(__int64)(v148 < 0x40) & (*(_QWORD *)(v310 + 8 * v275 - 16) >> v148);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v148);
        goto LABEL_395;
      case 91LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v22);
        v149 = *(_QWORD *)(v310 + 8 * v275 - 8);
        v31 = v275 - 1;
        v64 = -(__int64)(v149 < 0x40) & (*(_QWORD *)(v310 + 8 * v275 - 16) >> v149);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v149);
LABEL_395:
        *(_QWORD *)(v310 + 8 * v275 - 16) = v64;
        v30 = v270;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 92LL:
        v67 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v68 = *(double *)(v310 + 8 * v275 - 8) + *(double *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_413;
      case 93LL:
        v67 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v68 = *(double *)(v310 + 8 * v275 - 8) + *(double *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_413;
      case 94LL:
        v69 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v70 = *(double *)(v310 + 8 * v275 - 16) - *(double *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_407;
      case 95LL:
        v69 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v70 = *(double *)(v310 + 8 * v275 - 16) - *(double *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
LABEL_407:
        *(double *)(v310 + 8 * v275 - 16) = v70;
        v30 = v270;
        v31 = v69 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 96LL:
        v67 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v68 = *(double *)(v310 + 8 * v275 - 8) * *(double *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        goto LABEL_413;
      case 97LL:
        v67 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v68 = *(double *)(v310 + 8 * v275 - 8) * *(double *)(v310 + 8 * v275 - 16);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
LABEL_413:
        *(double *)(v310 + 8 * v275 - 16) = v68;
        v30 = v270;
        v31 = v67 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 98LL:
        v150 = v275;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v151 = *(double *)(v310 + 8 * v275 - 16);
        v273 = *(double *)(v310 + 8 * v275 - 8);
        if ( v275 - 1 <= v275 - 2 )
          sub_14007A5E0(a1: v275);
        *(double *)(v310 + 8 * v275 - 16) = v151 / v273;
        v30 = v270;
        v31 = v150 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 99LL:
        v73 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_420;
      case 100LL:
        v73 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
LABEL_420:
        v34 = v310;
        *(_QWORD *)(v310 + 8 * v275 - 8) = _mm_xor_si128(
                                             (__m128i)0x8000000000000000uLL,
                                             (__m128i)*(unsigned __int64 *)(v310 + 8 * v275 - 8)).m128i_u64[0];
        v30 = v270;
        v31 = v73;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 101LL:
        v152 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v152 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        else
        {
          if ( v31 <= v152 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        goto LABEL_511;
      case 102LL:
        v153 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v153 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v153 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 103LL:
        v154 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v154 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v154 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 104LL:
        v155 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) <= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v155 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v155 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 105LL:
        v156 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) < *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v156 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v156 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 106LL:
        v157 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) >= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v157 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v157 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 107LL:
        v158 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) >= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v158 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v158 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 108LL:
        v159 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) > *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v159 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v159 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 109LL:
        v160 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) > *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v160 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v160 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 110LL:
        v161 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) <= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v161 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v161 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 111LL:
        v162 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) <= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v162 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v162 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 112LL:
        v163 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) < *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v163 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v163 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 113LL:
        v164 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) >= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v164 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v164 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 114LL:
        v165 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) >= *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v165 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v165 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_511;
      case 115LL:
        v166 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v31 = v275 - 1;
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) > *(_QWORD *)(v310 + 8 * v275 - 16) )
        {
          if ( v31 <= v166 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v31 <= v166 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
LABEL_511:
        v30 = v270;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 116LL:
        v84 = v275;
        v167 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v168 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) == *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v168 <= v167 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        else
        {
          if ( v168 <= v167 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        goto LABEL_578;
      case 117LL:
        v84 = v275;
        v169 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v170 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) == *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v170 <= v169 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        else
        {
          if ( v170 <= v169 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        goto LABEL_578;
      case 118LL:
        v84 = v275;
        v171 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v172 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) == *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v172 <= v171 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v172 <= v171 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 119LL:
        v84 = v275;
        v173 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v174 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) <= *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v174 <= v173 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v174 <= v173 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 120LL:
        v84 = v275;
        v175 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v176 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) <= *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v176 <= v175 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v176 <= v175 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 121LL:
        v84 = v275;
        v177 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v178 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) < *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v178 <= v177 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v178 <= v177 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 122LL:
        v84 = v275;
        v179 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v180 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 8) < *(double *)(v310 + 8 * v275 - 16) )
        {
          if ( v180 <= v179 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v180 <= v179 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 123LL:
        v84 = v275;
        v181 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v182 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 16) <= *(double *)(v310 + 8 * v275 - 8) )
        {
          if ( v182 <= v181 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v182 <= v181 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 124LL:
        v84 = v275;
        v183 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v184 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 16) <= *(double *)(v310 + 8 * v275 - 8) )
        {
          if ( v184 <= v183 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v184 <= v183 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 125LL:
        v84 = v275;
        v185 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v186 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 16) < *(double *)(v310 + 8 * v275 - 8) )
        {
          if ( v186 <= v185 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v186 <= v185 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
        goto LABEL_578;
      case 126LL:
        v84 = v275;
        v187 = v275 - 2;
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275);
        v188 = v275 - 1;
        if ( *(double *)(v310 + 8 * v275 - 16) < *(double *)(v310 + 8 * v275 - 8) )
        {
          if ( v188 <= v187 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 0;
        }
        else
        {
          if ( v188 <= v187 )
            sub_14007A5E0(a1: v275);
          *(_QWORD *)(v310 + 8 * v275 - 16) = 1;
        }
LABEL_578:
        v30 = v270;
        v31 = v84 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 127LL:
        v97 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_582;
      case 128LL:
        v97 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
LABEL_582:
        v34 = v310;
        *(_QWORD *)(v310 + 8 * v275 - 8) = 1LL - *(_QWORD *)(v310 + 8 * v275 - 8);
        v30 = v270;
        v31 = v97;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 129LL:
        v98 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        goto LABEL_586;
      case 130LL:
        v98 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
LABEL_586:
        v189 = sub_1403EC180(a1: v98, a2: off_140615028);
        v190 = v275;
        *(_QWORD *)(v310 + 8 * v275 - 8) = v189;
        v30 = v270;
        v31 = v190;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v29 = v294;
        goto LABEL_20;
      case 133LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) != 0 )
          v27 = v29;
        goto LABEL_599;
      case 134LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == 0 )
          v27 = v29;
        goto LABEL_599;
      case 135LL:
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        if ( *(_QWORD *)(v310 + 8 * v275 - 8) == 0 )
          v27 = v29;
LABEL_599:
        v31 = v275 - 1;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v29 = v27;
        v30 = v270;
        goto LABEL_20;
      case 136LL:
        if ( v27 >= v265 )
          sub_14007A5E0(a1: v22);
        v191 = v306[v27];
        v192 = v275;
        v193 = v275 - v191;
        if ( v275 < v191 )
          sub_14007A5E0(a1: v275);
        v275 -= v191;
        *(_QWORD *)&v328 = v291;
        *((_QWORD *)&v328 + 1) = v308;
        v329[0] = v268;
        v329[1] = v269;
        v329[2] = v29;
        v194 = v270 + 1;
        v103 = v192 - v193;
        v285 = v103;
        v315 = v310 + (((__int64)(v193 - v276) >> 63) & (8 * v193));
        v195 = v271;
        if ( v271 < v270 + 1 )
        {
          v197 = v270 + 1;
          v196 = sub_140075980(a1: v271, a2: v265, a3: v194, a4: (_DWORD)v306);
          v194 = v197;
          v195 = v198;
          v103 = v285;
          v27 = v301;
        }
        else
        {
          v196 = v309;
        }
        v322 = v196;
        v270 = v194;
        v271 = v195;
        v199 = (_OWORD *)(v196 + 40 * v194 - 40);
        if ( dword_14069FEF0 != 0 )
        {
          v321 = v196 + 40 * v194 - 40;
          sub_1400220A0(a1: &v328);
          v103 = v285;
          v27 = v301;
          v199 = (_OWORD *)v321;
        }
        *v199 = v328;
        qmemcpy(v199 + 1, v329, 24);
        if ( v27 >= v278 )
          sub_14007A5E0(a1: v103);
        goto LABEL_617;
      case 137LL:
        if ( v27 >= v265 )
          sub_14007A5E0(a1: v22);
        v200 = v306[v27];
        v201 = v275;
        v202 = v275 - v200;
        if ( v275 < v200 )
          sub_14007A5E0(a1: v275);
        v275 -= v200;
        *(_QWORD *)&v326 = v291;
        *((_QWORD *)&v326 + 1) = v308;
        v327[0] = v268;
        v327[1] = v269;
        v327[2] = v29;
        v203 = v270 + 1;
        v103 = v201 - v202;
        v284 = v103;
        v314 = v310 + (((__int64)(v202 - v276) >> 63) & (8 * v202));
        v204 = v271;
        if ( v271 < v270 + 1 )
        {
          v206 = v270 + 1;
          v205 = sub_140075980(a1: v271, a2: v265, a3: v203, a4: (_DWORD)v306);
          v203 = v206;
          v204 = v207;
          v103 = v284;
          v27 = v301;
        }
        else
        {
          v205 = v309;
        }
        v322 = v205;
        v270 = v203;
        v271 = v204;
        v208 = (_OWORD *)(v205 + 40 * v203 - 40);
        if ( dword_14069FEF0 != 0 )
        {
          v321 = v205 + 40 * v203 - 40;
          sub_1400220A0(a1: &v326);
          v103 = v284;
          v27 = v301;
          v208 = (_OWORD *)v321;
        }
        *v208 = v326;
        qmemcpy(v208 + 1, v327, 24);
        if ( v27 >= v278 )
          sub_14007A5E0(a1: v103);
LABEL_617:
        v209 = sub_140059C20(a1: v103);
        v17 = v301;
        v30 = v270;
        v31 = v275;
        v33 = v276;
        v35 = v322;
        v36 = v311[v301];
        v37 = v36;
        v38 = v209;
        v29 = 0;
        v32 = v271;
        v34 = v310;
        goto LABEL_20;
      case 138LL:
        if ( v27 >= v280 )
          sub_14007A5E0(a1: v22);
        v210 = v313[3 * v27 + 1];
        if ( v275 < (unsigned __int64)v210 )
          sub_14007A5E0(a1: v275);
        v211 = v310 + (((__int64)(v275 - (_QWORD)v210 - v276) >> 63) & (8 * (v275 - (_QWORD)v210)));
        if ( v27 >= v279 )
          sub_14007A5E0(a1: v210);
        v302 = v275 - (_QWORD)v210;
        v212 = **(__int64 (__fastcall ***)(void *))(v312 + 8 * v27);
        v213 = v310 + (((__int64)(v275 - (_QWORD)v210 - v276) >> 63) & (8 * (v275 - (_QWORD)v210)));
        v214 = v212(a1: v210);
        v217 = v211 + v302;
        v218 = v276;
        if ( v276 < v211 + v302 )
        {
          v263 = v211;
          v304 = v214;
          v220 = v211 + v302;
          v219 = sub_140075980(a1: v276, a2: v215, a3: v217, a4: v216);
          v217 = v220;
          v213 = v263;
        }
        else
        {
          v219 = v310;
        }
        v276 = v218;
        v310 = v219;
        v275 = v217;
        sub_14007A980(a1: 8 * v213);
        v30 = v270;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v29 = v294;
        goto LABEL_20;
      case 139LL:
        if ( v27 >= v280 )
          sub_14007A5E0(a1: v22);
        v221 = v313[3 * v27 + 1];
        if ( v275 < (unsigned __int64)v221 )
          sub_14007A5E0(a1: v275);
        v222 = v310 + (((__int64)(v275 - (_QWORD)v221 - v276) >> 63) & (8 * (v275 - (_QWORD)v221)));
        if ( v27 >= v279 )
          sub_14007A5E0(a1: v221);
        v302 = v275 - (_QWORD)v221;
        v223 = **(__int64 (__fastcall ***)(void *))(v312 + 8 * v27);
        v112 = v310 + (((__int64)(v275 - (_QWORD)v221 - v276) >> 63) & (8 * (v275 - (_QWORD)v221)));
        v224 = v223(a1: v221);
        v116 = v222 + v302;
        v117 = v276;
        if ( v276 < v222 + v302 )
        {
          v303 = v224;
          v262 = v222;
          v227 = v222 + v302;
          v118 = sub_140075980(a1: v276, a2: v225, a3: v116, a4: v226);
          v116 = v227;
          v112 = v262;
        }
        else
        {
          v118 = v310;
        }
LABEL_260:
        v310 = v118;
        v276 = v117;
        v275 = v116;
        sub_14007A980(a1: 8 * v112);
        v30 = v270;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v29 = v294;
        goto LABEL_20;
      case 140LL:
        if ( v270 != 0 )
        {
          v228 = v275;
          if ( v275 < v27 )
            sub_14007A5E0(a1: v275);
          v229 = v276;
          v302 = *(_QWORD *)(v309 + 40 * v270 - 40);
          v322 = *(_QWORD *)(v309 + 40 * v270 - 32);
          v299 = *(_QWORD *)(v309 + 40 * v270 - 24);
          v298 = *(_QWORD *)(v309 + 40 * v270 - 16);
          v230 = *(_QWORD *)(v309 + 40 * v270 - 8);
          v297 = v230;
          v231 = v27;
          v232 = v310;
          if ( v275 > v276 )
          {
            v296 = v275 - v27;
            v287 = v27;
            v317 = v310 + (((__int64)(v275 - v27 - v276) >> 63) & (8 * (v275 - v27)));
            v233 = v275;
            v234 = sub_140075980(a1: v276, a2: v270, a3: v230, a4: v276);
            v231 = v287;
            v232 = v234;
            v229 = v235;
            v228 = v233;
          }
          v310 = v232;
          v275 = v228;
          v276 = v229;
          sub_14007A980(a1: 8 * v231);
          v30 = v270 - 1;
          v31 = v275;
          v32 = v271;
          v33 = v276;
          v17 = v302;
          v34 = v310;
          v35 = v309;
          v36 = v299;
          v37 = v298;
          v38 = v322;
          v29 = v297;
LABEL_20:
          v275 = v31;
          v310 = v34;
          v276 = v33;
          v309 = v35;
          v268 = v36;
          v270 = v30;
          v271 = v32;
          v308 = v38;
          v269 = v37;
          v19 = v29;
          continue;
        }
        if ( v275 < v27 )
          sub_14007A5E0(a1: v275);
        v249 = v27;
        v250 = ((__int64)(v275 - v27 - v276) >> 63) & (8 * (v275 - v27));
        if ( v27 != 0 )
        {
          v302 = v27;
          v322 = v310 + v250;
          v251 = sub_140075980(a1: 0, a2: v310, a3: v250, a4: v24);
          v252 = v27;
          v253 = v254;
          v249 = v302;
        }
        else
        {
          v251 = 0;
          v252 = 0;
          v253 = 0;
        }
        v302 = v252;
        v299 = v253;
        v322 = v251;
        sub_14007A980(a1: 8 * v249);
        return v322;
      case 141LL:
        v236 = v275;
        if ( v275 == 0 )
          sub_14007A5E0(a1: 0);
        --v275;
        v281 = *(_QWORD *)(v310 + 8 * v236 - 8);
        v300 = sub_1403EBBA0();
        v237 = sub_1403EBBA0();
        if ( v291 >= v293 )
          sub_14007A5E0(a1: v291);
        if ( (unsigned __int64)v320[v302 + 1] <= v281 )
          sub_14007A5E0(a1: v291);
        v29 = v237 ^ qword_14061C580 ^ *((_QWORD *)v320[v302] + v281) ^ qword_14061C578 ^ v300;
        v30 = v270;
        v31 = v275;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        goto LABEL_20;
      case 142LL:
        if ( v275 < 2 )
          sub_14007A5E0(a1: v275 - 2);
        v302 = v275 - 2;
        v299 = v275 - 1;
        sub_1403EC100();
        v131 = v299;
        if ( v299 <= v302 )
          sub_14007A5E0(a1: v302);
LABEL_272:
        *(_QWORD *)(v310 + 8 * v275 - 16) = v130;
        v30 = v270;
        v31 = v131;
        v32 = v271;
        v33 = v276;
        v17 = v291;
        v34 = v310;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v29 = v294;
        goto LABEL_20;
      case 143LL:
        v132 = v275 + 1;
        v33 = v276;
        if ( v276 < v275 + 1 )
        {
LABEL_275:
          v34 = sub_140075980(a1: v276, a2: v23, a3: v29, a4: v24);
          v29 = v294;
        }
        else
        {
          v34 = v310;
        }
LABEL_276:
        *(_QWORD *)(v34 + 8 * v132 - 8) = 0;
        v31 = v132;
        v32 = v271;
        v17 = v291;
        v35 = v309;
        v36 = v268;
        v37 = v269;
        v38 = v308;
        v30 = v270;
        goto LABEL_20;
      case 146LL:
        v255 = v275;
        if ( v275 != 0 )
          goto LABEL_662;
        v256 = 0;
        v257 = 0;
        v258 = 0;
        goto LABEL_663;
      case 147LL:
        v255 = v275;
        if ( v275 != 0 )
        {
LABEL_662:
          v257 = v275;
          v256 = sub_140075980(a1: 0, a2: v23, a3: v29, a4: v24);
          v255 = v275;
        }
        else
        {
          v256 = 0;
          v257 = 0;
          v258 = 0;
        }
LABEL_663:
        v302 = v257;
        v299 = v258;
        v322 = v256;
        sub_14007A980(a1: 8 * v255);
        return v322;
      default:
        ((void (__fastcall *)(__int64))*off_140644540)(a1: 4294948763LL);
        sub_140072380();
        sub_140074180();
        goto LABEL_961;
    }
  }
}