/* CUDA brute for alpjs custom VMP (check_short, len < 16).
 *
 * Build (toolkit in $HOME):
 *   export PATH=$HOME/cuda-13.0.1/bin:$PATH
 *   export LD_LIBRARY_PATH=$HOME/cuda-13.0.1/lib64:$LD_LIBRARY_PATH
 *   nvcc -O3 -arch=sm_90 -o tools/vmp_brute_cuda tools/vmp_brute.cu
 *
 *   ./tools/vmp_brute_cuda -l 6 -L 6
 *   ./tools/vmp_brute_cuda -l 5 -L 5 -s 0   # full a-z
 *   ./tools/vmp_brute_cuda 'hello world!'  # single check
 */
#include <cstdio>
#include <cstdint>
#include <cstring>
#include <cstdlib>
#include <cuda_runtime.h>

#define CHECK_CUDA(call)                                                       \
  do {                                                                         \
    cudaError_t err = (call);                                                  \
    if (err != cudaSuccess) {                                                  \
      fprintf(stderr, "CUDA %s:%d: %s\n", __FILE__, __LINE__,                   \
              cudaGetErrorString(err));                                        \
      exit(1);                                                                 \
    }                                                                          \
  } while (0)

__host__ __device__ static inline uint8_t rol8(uint8_t x, unsigned n) {
  n &= 7;
  return (uint8_t)((x << n) | (x >> (8 - n)));
}

__host__ __device__ static void round_60B0(uint8_t *s, const uint8_t *k1,
                                          const uint8_t *k2, int a4, int a5) {
  for (int i = 0; i < 4; i++) {
    uint8_t t = s[a5 + i];
    s[a5 + i] = s[a5 + i + 4];
    s[a5 + i + 4] = t;
  }
  uint8_t v13 = s[a5 + 2];
  uint8_t v14 = (uint8_t)(s[a5 + 7] + s[a5 + 1]);
  uint8_t v15 = rol8((uint8_t)(s[a5 + 0] + s[a5 + 1]), s[a5 + 1] & 7);
  s[a5 + 0] = k1[a4] ^ v15;
  s[a5 + 1] = rol8(v14, v13 & 7);
  uint8_t v16 = s[a5 + 3];
  uint8_t v17 = s[a5 + 4] & 7;
  uint8_t v18 = rol8((uint8_t)(v13 - v16), v16 & 7);
  uint8_t v19 = k2[a4] ^ v18;
  s[a5 + 2] = v19;
  s[a5 + 3] = k1[(a4 + 3) & 7] ^ rol8((uint8_t)(v16 + v19), v17);
}

__host__ __device__ static void mix_rol(uint8_t *s) {
  for (int i = 0; i < 8; i++) {
    uint8_t L = s[i], R = s[8 + i];
    uint8_t r = rol8(R, L & 7);
    s[8 + i] = r;
    s[i] = rol8(L, r & 7);
  }
}

__host__ __device__ static void rounds(uint8_t *s, const uint8_t *k1,
                                       const uint8_t *k2, int n) {
  for (int i = 0; i < n; i++) {
    round_60B0(s, k1, k2, i, 0);
    round_60B0(s, k1, k2, i, 8);
    mix_rol(s);
  }
}

/* Constant memory: keys + S4 + TAG */
__constant__ uint8_t d_K1[8];
__constant__ uint8_t d_K2[8];
__constant__ uint8_t d_K3[8];
__constant__ uint8_t d_K4[8];
__constant__ uint8_t d_S4[16];
__constant__ uint8_t d_TAG[8];
__constant__ char d_alph[96];
__constant__ int d_nalph;
__constant__ int d_len;

__device__ int d_found;
__device__ char d_hit[40];

__device__ static int check_short_dev(const uint8_t *pw, int len) {
  uint8_t full[40];
#pragma unroll
  for (int i = 0; i < 40; i++)
    full[i] = 0;
  for (int i = 0; i < len; i++)
    full[i] = pw[i];
  if (len < 40)
    full[len] = 0x80;

  uint8_t v8[16], v81[16], v82[8], v7[16];
#pragma unroll
  for (int i = 0; i < 16; i++) {
    v8[i] = full[i];
    v81[i] = full[16 + i];
    v7[i] = 0;
  }
#pragma unroll
  for (int i = 0; i < 8; i++)
    v82[i] = full[32 + i];

  for (int it = 0; it < 1000; it++) {
    uint8_t st[16];
#pragma unroll
    for (int i = 0; i < 16; i++)
      st[i] = v8[i] ^ v7[i];
    rounds(st, d_K1, d_K2, 6);
#pragma unroll
    for (int i = 0; i < 16; i++)
      st[i] ^= v81[i];
    rounds(st, d_K1, d_K2, 6);
    uint8_t v78[16];
#pragma unroll
    for (int i = 0; i < 8; i++)
      v78[i] = v82[i];
#pragma unroll
    for (int i = 8; i < 16; i++)
      v78[i] = 0;
#pragma unroll
    for (int i = 0; i < 16; i++)
      st[i] ^= v78[i];
    rounds(st, d_K1, d_K2, 6);
#pragma unroll
    for (int i = 0; i < 16; i++)
      v7[i] = st[i];
  }

  uint8_t st[16];
#pragma unroll
  for (int i = 0; i < 16; i++)
    st[i] = d_S4[i] ^ v7[i];
  rounds(st, d_K1, d_K2, 6);
  rounds(st, d_K1, d_K2, 6); /* zero block for len<16 */
  uint8_t blk6[16];
#pragma unroll
  for (int i = 0; i < 16; i++)
    blk6[i] = 0;
  blk6[8] = 0x80;
#pragma unroll
  for (int i = 0; i < 16; i++)
    st[i] ^= blk6[i];
  rounds(st, d_K1, d_K2, 6);
  st[0] ^= 0xD1;
  st[1] ^= 0x5E;
  rounds(st, d_K3, d_K4, 8);
#pragma unroll
  for (int i = 0; i < 8; i++)
    if (st[i] != d_TAG[i])
      return 0;
  return 1;
}

__global__ void brute_kernel(uint64_t start, uint64_t count) {
  uint64_t tid = blockIdx.x * (uint64_t)blockDim.x + threadIdx.x;
  if (tid >= count || d_found)
    return;
  uint64_t idx = start + tid;
  int n = d_nalph;
  int len = d_len;
  uint8_t pw[40];
  uint64_t x = idx;
  for (int i = 0; i < len; i++) {
    pw[i] = (uint8_t)d_alph[x % (uint64_t)n];
    x /= (uint64_t)n;
  }
  if (!check_short_dev(pw, len))
    return;
  if (atomicCAS(&d_found, 0, 1) == 0) {
    for (int i = 0; i < len; i++)
      d_hit[i] = (char)pw[i];
    d_hit[len] = 0;
  }
}

/* Host mirrors */
static const uint8_t K1[8] = {0x6c, 0x9f, 0x1a, 0xb7, 0x35, 0xe3, 0x48, 0x7d};
static const uint8_t K2[8] = {0x51, 0x13, 0x2b, 0xc7, 0x8e, 0xb2, 0x4f, 0x63};
static const uint8_t K3[8] = {0xc9, 0x3b, 0xbd, 0x11, 0x94, 0x43, 0xeb, 0xdf};
static const uint8_t K4[8] = {0x8d, 0x4f, 0x67, 0x03, 0xca, 0xee, 0x8b, 0x9f};
static uint8_t C510[64], TAG[8], S4[16];

static void xor_dec(uint8_t *d, const uint8_t *s, int n) {
  for (int i = 0; i < n; i++)
    d[i] = s[i] ^ ((0x6d + 0x13 * i) & 0xff);
}

static void precompute(void) {
  memset(S4, 0, 16);
  for (int b = 0; b < 64; b += 16) {
    for (int i = 0; i < 16; i++)
      S4[i] ^= C510[b + i];
    rounds(S4, K1, K2, 6);
  }
}

static int load_pe(const char *path) {
  FILE *f = fopen(path, "rb");
  if (!f) {
    perror(path);
    return -1;
  }
  fseek(f, 0x3C, SEEK_SET);
  uint32_t e;
  fread(&e, 4, 1, f);
  fseek(f, e + 6, SEEK_SET);
  uint16_t nsec, optsz;
  fread(&nsec, 2, 1, f);
  fseek(f, e + 20, SEEK_SET);
  fread(&optsz, 2, 1, f);
  uint32_t secoff = e + 24 + optsz, rp = 0, va = 0;
  for (int i = 0; i < nsec; i++) {
    fseek(f, secoff + i * 40 + 8, SEEK_SET);
    uint32_t vs, v, rs, r;
    fread(&vs, 4, 1, f);
    fread(&v, 4, 1, f);
    fread(&rs, 4, 1, f);
    fread(&r, 4, 1, f);
    if (v <= 0xC510 && v + vs > 0xC510) {
      rp = r;
      va = v;
    }
  }
  uint8_t raw[64];
  fseek(f, rp + (0xC510 - va), SEEK_SET);
  fread(raw, 64, 1, f);
  xor_dec(C510, raw, 64);
  fseek(f, rp + (0xC550 - va), SEEK_SET);
  fread(raw, 8, 1, f);
  xor_dec(TAG, raw, 8);
  fclose(f);
  precompute();
  return 0;
}

static void upload_consts(const char *alph, int len) {
  CHECK_CUDA(cudaMemcpyToSymbol(d_K1, K1, 8));
  CHECK_CUDA(cudaMemcpyToSymbol(d_K2, K2, 8));
  CHECK_CUDA(cudaMemcpyToSymbol(d_K3, K3, 8));
  CHECK_CUDA(cudaMemcpyToSymbol(d_K4, K4, 8));
  CHECK_CUDA(cudaMemcpyToSymbol(d_S4, S4, 16));
  CHECK_CUDA(cudaMemcpyToSymbol(d_TAG, TAG, 8));
  int n = (int)strlen(alph);
  char alphbuf[96] = {0};
  memcpy(alphbuf, alph, n);
  CHECK_CUDA(cudaMemcpyToSymbol(d_alph, alphbuf, 96));
  CHECK_CUDA(cudaMemcpyToSymbol(d_nalph, &n, sizeof(n)));
  CHECK_CUDA(cudaMemcpyToSymbol(d_len, &len, sizeof(len)));
  int zero = 0;
  CHECK_CUDA(cudaMemcpyToSymbol(d_found, &zero, sizeof(zero)));
}

static int host_check_short(const uint8_t *pw, int len) {
  /* identical to device path using host K/S4/TAG */
  uint8_t full[40] = {0};
  memcpy(full, pw, len);
  if (len < 40)
    full[len] = 0x80;
  uint8_t v8[16], v81[16], v82[8], v7[16] = {0};
  memcpy(v8, full, 16);
  memcpy(v81, full + 16, 16);
  memcpy(v82, full + 32, 8);
  for (int it = 0; it < 1000; it++) {
    uint8_t st[16];
    for (int i = 0; i < 16; i++)
      st[i] = v8[i] ^ v7[i];
    rounds(st, K1, K2, 6);
    for (int i = 0; i < 16; i++)
      st[i] ^= v81[i];
    rounds(st, K1, K2, 6);
    uint8_t v78[16] = {0};
    memcpy(v78, v82, 8);
    for (int i = 0; i < 16; i++)
      st[i] ^= v78[i];
    rounds(st, K1, K2, 6);
    memcpy(v7, st, 16);
  }
  uint8_t st[16];
  memcpy(st, S4, 16);
  for (int i = 0; i < 16; i++)
    st[i] ^= v7[i];
  rounds(st, K1, K2, 6);
  rounds(st, K1, K2, 6);
  uint8_t blk6[16] = {0};
  blk6[8] = 0x80;
  for (int i = 0; i < 16; i++)
    st[i] ^= blk6[i];
  rounds(st, K1, K2, 6);
  st[0] ^= 0xD1;
  st[1] ^= 0x5E;
  rounds(st, K3, K4, 8);
  return memcmp(st, TAG, 8) == 0;
}

int main(int argc, char **argv) {
  const char *exe = "original/crackme.exe";
  const char *alph = "abcdefghijklmnopqrstuvwxyz";
  int len_min = 1, len_max = 6;
  uint64_t start = 0;
  uint64_t chunk = 1ULL << 24; /* 16M candidates per launch */

  for (int i = 1; i < argc; i++) {
    if (!strcmp(argv[i], "-l") && i + 1 < argc)
      len_min = atoi(argv[++i]);
    else if (!strcmp(argv[i], "-L") && i + 1 < argc)
      len_max = atoi(argv[++i]);
    else if (!strcmp(argv[i], "-a") && i + 1 < argc)
      alph = argv[++i];
    else if (!strcmp(argv[i], "-s") && i + 1 < argc)
      start = strtoull(argv[++i], NULL, 10);
    else if (!strcmp(argv[i], "-c") && i + 1 < argc)
      chunk = strtoull(argv[++i], NULL, 10);
    else if (argv[i][0] != '-') {
      if (load_pe(exe) != 0)
        return 2;
      int ok = host_check_short((uint8_t *)argv[i], (int)strlen(argv[i]));
      printf("%s -> %s\n", argv[i], ok ? "OK" : "NO");
      return ok ? 0 : 1;
    }
  }

  if (load_pe(exe) != 0)
    return 2;
  fprintf(stderr, "tag=");
  for (int i = 0; i < 8; i++)
    fprintf(stderr, "%02x", TAG[i]);
  fprintf(stderr, "\n");

  int n = (int)strlen(alph);
  const int threads = 256;

  for (int len = len_min; len <= len_max; len++) {
    uint64_t total = 1;
    for (int i = 0; i < len; i++)
      total *= (uint64_t)n;
    uint64_t st = (len == len_min) ? start : 0;
    fprintf(stderr, "[*] GPU len=%d space=%llu start=%llu alph_n=%d\n", len,
            (unsigned long long)total, (unsigned long long)st, n);
    upload_consts(alph, len);

    cudaEvent_t ev0, ev1;
    CHECK_CUDA(cudaEventCreate(&ev0));
    CHECK_CUDA(cudaEventCreate(&ev1));
    CHECK_CUDA(cudaEventRecord(ev0));

    for (uint64_t off = st; off < total;) {
      int found = 0;
      CHECK_CUDA(cudaMemcpyFromSymbol(&found, d_found, sizeof(found)));
      if (found)
        break;
      uint64_t remain = total - off;
      uint64_t this_count = remain < chunk ? remain : chunk;
      uint64_t blocks = (this_count + threads - 1) / threads;
      brute_kernel<<<(unsigned)blocks, threads>>>(off, this_count);
      CHECK_CUDA(cudaGetLastError());
      CHECK_CUDA(cudaDeviceSynchronize());
      off += this_count;
      float ms = 0;
      CHECK_CUDA(cudaEventRecord(ev1));
      CHECK_CUDA(cudaEventSynchronize(ev1));
      CHECK_CUDA(cudaEventElapsedTime(&ms, ev0, ev1));
      double done = (double)(off - st);
      double rate = ms > 0.01 ? done / (ms / 1000.0) : 0;
      fprintf(stderr, "\r    %llu/%llu (%.2f%%) ~%.0f/s   ",
              (unsigned long long)(off - st),
              (unsigned long long)(total - st),
              100.0 * (double)off / (double)total, rate);
      fflush(stderr);
    }
    fprintf(stderr, "\n");
    int found = 0;
    CHECK_CUDA(cudaMemcpyFromSymbol(&found, d_found, sizeof(found)));
    if (found) {
      char hit[40] = {0};
      CHECK_CUDA(cudaMemcpyFromSymbol(hit, d_hit, 40));
      printf("FOUND %s\n", hit);
      return 0;
    }
  }
  puts("not found");
  return 1;
}
