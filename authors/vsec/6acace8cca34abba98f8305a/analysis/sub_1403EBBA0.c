unsigned __int64 __fastcall sub_1403EBBA0()
{
  unsigned __int64 v0; // rax
  unsigned __int64 v1; // rax

  v1 = 0x94D049BB133111EBuLL
     * (((0xBF58476D1CE4E5B9uLL * ((v0 >> 30) ^ v0)) >> 27) ^ (0xBF58476D1CE4E5B9uLL * ((v0 >> 30) ^ v0)));
  return (v1 >> 31) ^ v1;
}