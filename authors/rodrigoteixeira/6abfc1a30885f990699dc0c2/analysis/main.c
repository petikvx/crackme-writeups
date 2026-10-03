/* Hex-Rays (IDA MCP) — main.exe PE32 MinGW GCC 6.3.0 */

int __cdecl hash(unsigned __int8 *a1, int a2)
{
  unsigned __int8 *v2; // ebx
  int i; // edx

  v2 = a1;
  for ( i = *a1; (_BYTE)i != 0; i = *v2 )
  {
    ++v2;
    a2 = i + 31 * a2;
  }
  return a2;
}

unsigned int __cdecl next(unsigned int a1)
{
  return (32 * ((((a1 << 13) ^ a1) >> 17) ^ (a1 << 13) ^ a1)) ^ (((a1 << 13) ^ a1) >> 17) ^ (a1 << 13) ^ a1;
}

int __cdecl main(int argc, const char **argv, const char **envp)
{
  unsigned __int8 *v3; // ebx
  int v4; // eax
  unsigned __int8 *v5; // ecx
  int v6; // esi
  unsigned int v7; // edx
  int v8; // edx
  unsigned __int8 *v9; // esi
  int v10; // eax
  int v11; // edx
  _BYTE v13[100]; // [esp+18h] [ebp-D4h] BYREF
  _BYTE v14[112]; // [esp+7Ch] [ebp-70h] BYREF

  v3 = v13;
  __main();
  printf("Enter username: ");
  scanf("%99s", v13);
  v4 = v13[0];
  if ( v13[0] == 0 )
  {
    printf("Enter password: ");
    scanf("%99s", v14);
    return puts("Incorrect username or password.");
  }
  v5 = v13;
  v6 = 0;
  do
  {
    ++v5;
    v6 = v4 + 31 * v6;
    v4 = *v5;
  }
  while ( (_BYTE)v4 != 0 );
  printf("Enter password: ");
  scanf("%99s", v14);
  v7 = v6 ^ (v6 << 13) ^ ((v6 ^ (unsigned int)(v6 << 13)) >> 17);
  if ( ((32 * v7) ^ v7) != 0x713FD2A6 )
    return puts("Incorrect username or password.");
  v8 = v14[0];
  if ( v14[0] == 0 )
  {
    v11 = v13[0];
    v10 = 0;
    if ( v13[0] == 0 )
      return puts("Incorrect username or password.");
    goto LABEL_9;
  }
  v9 = v14;
  v10 = 0;
  do
  {
    ++v9;
    v10 = v8 + 31 * v10;
    v8 = *v9;
  }
  while ( (_BYTE)v8 != 0 );
  v11 = v13[0];
  if ( v13[0] != 0 )
  {
    do
    {
LABEL_9:
      ++v3;
      v10 = v11 + 31 * v10;
      v11 = *v3;
    }
    while ( (_BYTE)v11 != 0 );
  }
  if ( v10 != 1134358881 )
    return puts("Incorrect username or password.");
  return printf("Logged in successfully");
}
