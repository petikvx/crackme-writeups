// brute.cu : brute force GPU du mot de passe AegisShield (<= 8 caracteres).
// Hash identique a aegis-hash.h (valide contre le binaire : "petik" -> 47e737f71c3e513b).
//   nvcc -O3 -arch=sm_90 -o brute_gpu brute.cu
//   ./brute_gpu selftest
//   ./brute_gpu 'abcdefghijklmnopqrstuvwxyz0123456789' 1 8
//   test : ./brute_gpu 'abcdefghijklmnopqrstuvwxyz' 5 5 47e737f71c3e513b   -> doit afficher FOUND petik
#include <cstdio>
#include <cstdlib>
#include <cstring>
#include <cstdint>
typedef unsigned long long u64;
#define TARGET 0x2A8FADFD62AD902EULL
#define A 0x5851F42D4C957F2DULL
#define B 0x14057B7EF767814FULL
__host__ __device__ static inline u64 rol(u64 x, int n) { n &= 63; return n ? (x << n) | (x >> (64 - n)) : x; }
__host__ __device__ static inline u64 lcg(u64 x) { return x * A + B; }

// mot de passe tenu dans un seul qwords (n <= 8, octets LE, reste a 0)
__host__ __device__ static u64 hash1(u64 c, int n) {
  const u64 K5 = 0x13198A2E03707344ULL, K6 = 0xA4093822299F31D0ULL, K7 = 0x082EFA98EC4E6C89ULL;
  const u64 C[4] = {0x9e377900ULL, 0x9e378901ULL, 0x9e379902ULL, 0x9e37a903ULL};
  u64 s = ((0x9E3779B97F4A7C15ULL * (u64)n)) ^ 0xDDEBA5ECAFEF00DULL;
  u64 r0 = c, r1, r2, r3;
  if (!r0) { s = lcg(s); r0 = s; }
  s = lcg(s); r1 = s; s = lcg(s); r2 = s; s = lcg(s); r3 = s;
  for (int j = 0; j < 4; j++) {
    r0 ^= K5; r0 += C[j]; r0 = rol(r0, 7); r0 += K6;
    r1 = lcg(r1); r1 ^= K7; r1 *= 0x9e3779b1ULL; r1 = rol(r1, 13);
    r2 += r0; r2 = rol(r2, 17); r2 -= r1;
    r3 = lcg(r3); r3 ^= r2; r3 = rol(r3, 29); r3 *= 0x85ebca77ULL;
    r0 ^= r3;
  }
  r0 ^= r1; r0 ^= r2;
  u64 v = lcg(r0 ^ rol(r1, 32) ^ rol(r2, 16) ^ rol(r3, 48));
  v = lcg(v ^ rol(v, 17)); v = lcg(v ^ rol(v, 17));
  return v ^ rol(v, 17);
}

__constant__ char d_cs[128];
__global__ void kern(int L, int n, u64 base, u64 count, u64 target) {
  u64 i = (u64)blockIdx.x * blockDim.x + threadIdx.x;
  if (i >= count) return;
  u64 u = base + i, c = 0;
  for (int k = 0; k < n; k++) { c |= (u64)(unsigned char)d_cs[u % L] << (8 * k); u /= L; }
  if (hash1(c, n) == target) {
    char p[9] = {0}; memcpy(p, &c, 8);
    printf("FOUND %s\n", p);
  }
}

int main(int argc, char** argv) {
  if (argc >= 2 && !strcmp(argv[1], "selftest")) {
    u64 c = 0; memcpy(&c, "petik", 5);
    printf("host petik = %016llx (attendu 47e737f71c3e513b)\n", hash1(c, 5));
    return 0;
  }
  if (argc < 4) { fprintf(stderr, "usage: %s <charset> <lenmin> <lenmax> | selftest\n", argv[0]); return 1; }
  u64 target = argc >= 5 ? strtoull(argv[4], 0, 16) : TARGET;   // 4e arg : cible de test (hex)
  const char* cs = argv[1]; int L = strlen(cs), a = atoi(argv[2]), b = atoi(argv[3]);
  cudaMemcpyToSymbol(d_cs, cs, L);
  const u64 CHUNK = 1ULL << 32;
  for (int n = a; n <= b && n <= 8; n++) {
    u64 tot = 1; for (int i = 0; i < n; i++) tot *= L;
    for (u64 base = 0; base < tot; base += CHUNK) {
      u64 cnt = tot - base < CHUNK ? tot - base : CHUNK;
      kern<<<(cnt + 255) / 256, 256>>>(L, n, base, cnt, target);
      cudaError_t e = cudaGetLastError(); if (e == cudaSuccess) e = cudaDeviceSynchronize();
      if (e != cudaSuccess) { fprintf(stderr, "ERREUR CUDA: %s\n", cudaGetErrorString(e)); return 2; }
    }
    fprintf(stderr, "len %d done\n", n);
  }
  return 0;
}
