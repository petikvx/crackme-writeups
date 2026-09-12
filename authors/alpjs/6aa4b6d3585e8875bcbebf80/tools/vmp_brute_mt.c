/* Parallel CPU brute for alpjs custom VMP (référence pour port CUDA / H100).
 *
 * Doc : ../analysis/H100.md  ·  ../analysis/RESUME.md
 *
 *   gcc -O3 -march=native -fopenmp -o tools/vmp_brute_mt tools/vmp_brute_mt.c
 *   ./tools/vmp_brute_mt 'candidate'        # OK / NO
 *   ./tools/vmp_brute_mt -l 5 -L 5          # a-z len 5
 *   ./tools/vmp_brute_mt -l 5 -L 5 -s N     # reprendre à l’index N
 *   ./tools/vmp_brute_mt -w wordlist.txt
 *
 * Indexation a-z : pw[i] = alph[idx % 26]; idx /= 26;  (i = 0..len-1)
 * Reprise len5 CPU : -s 8126464  (~68.4 % déjà testé)
 */
#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
#include <omp.h>
#endif

static inline uint8_t rol8(uint8_t x, unsigned n) {
  n &= 7;
  return (uint8_t)((x << n) | (x >> (8 - n)));
}

static void round_60B0(uint8_t *s, const uint8_t *k1, const uint8_t *k2, int a4, int a5) {
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

static void mix_rol(uint8_t *s) {
  for (int i = 0; i < 8; i++) {
    uint8_t L = s[i], R = s[8 + i];
    uint8_t r = rol8(R, L & 7);
    s[8 + i] = r;
    s[i] = rol8(L, r & 7);
  }
}

static void rounds(uint8_t *s, const uint8_t *k1, const uint8_t *k2, int n) {
  for (int i = 0; i < n; i++) {
    round_60B0(s, k1, k2, i, 0);
    round_60B0(s, k1, k2, i, 8);
    mix_rol(s);
  }
}

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

static void keystretch(const uint8_t *pw, int len, uint8_t mac[16]) {
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
      st[i] = v78[i] ^ st[i];
    rounds(st, K1, K2, 6);
    memcpy(v7, st, 16);
  }
  memcpy(mac, v7, 16);
}

/* len < 16 → rest zeros (fast path) */
static int check_short(const uint8_t *pw, int len) {
  uint8_t mac[16], st[16];
  keystretch(pw, len, mac);
  memcpy(st, S4, 16);
  for (int i = 0; i < 16; i++)
    st[i] ^= mac[i];
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

static int check_any(const uint8_t *pw, int len) {
  if (len < 16)
    return check_short(pw, len);
  uint8_t mac[16], st[16], full[40] = {0};
  memcpy(full, pw, len);
  if (len < 40)
    full[len] = 0x80;
  keystretch(pw, len, mac);
  memcpy(st, S4, 16);
  for (int i = 0; i < 16; i++)
    st[i] ^= mac[i];
  rounds(st, K1, K2, 6);
  for (int i = 0; i < 16; i++)
    st[i] ^= full[16 + i];
  rounds(st, K1, K2, 6);
  uint8_t blk6[16];
  memset(blk6, 0, 16);
  memcpy(blk6, full + 32, 8);
  blk6[8] = 0x80;
  for (int i = 0; i < 16; i++)
    st[i] ^= blk6[i];
  rounds(st, K1, K2, 6);
  st[0] ^= 0xD1;
  st[1] ^= 0x5E;
  rounds(st, K3, K4, 8);
  return memcmp(st, TAG, 8) == 0;
}

static int load_pe(const char *path) {
  FILE *f = fopen(path, "rb");
  if (!f) {
    perror(path);
    return -1;
  }
  fseek(f, 0x3C, SEEK_SET);
  uint32_t e;
  if (fread(&e, 4, 1, f) != 1)
    return -1;
  fseek(f, e + 6, SEEK_SET);
  uint16_t nsec, optsz;
  if (fread(&nsec, 2, 1, f) != 1)
    return -1;
  fseek(f, e + 20, SEEK_SET);
  if (fread(&optsz, 2, 1, f) != 1)
    return -1;
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

static volatile int g_found = 0;
static char g_hit[64];

static void index_to_pw(uint64_t idx, int len, const char *alph, int n, char *pw) {
  for (int i = 0; i < len; i++) {
    pw[i] = alph[idx % (uint64_t)n];
    idx /= (uint64_t)n;
  }
  pw[len] = 0;
}

static int brute_len(int len, const char *alph, int n, uint64_t start_idx) {
  uint64_t total = 1;
  for (int i = 0; i < len; i++)
    total *= (uint64_t)n;
  fprintf(stderr, "[*] len=%d space=%llu start=%llu threads=%d\n", len,
          (unsigned long long)total, (unsigned long long)start_idx,
#ifdef _OPENMP
          omp_get_max_threads()
#else
          1
#endif
  );
  clock_t t0 = clock();
  volatile uint64_t progress = 0;

#pragma omp parallel
  {
    char pw[40];
#pragma omp for schedule(dynamic, 4096)
    for (int64_t i = (int64_t)start_idx; i < (int64_t)total; i++) {
      if (g_found)
        continue;
      index_to_pw((uint64_t)i, len, alph, n, pw);
      if (check_short((uint8_t *)pw, len)) {
#pragma omp critical
        {
          if (!g_found) {
            g_found = 1;
            snprintf(g_hit, sizeof g_hit, "%s", pw);
            fprintf(stderr, "\n[+] FOUND %s\n", pw);
          }
        }
      }
      uint64_t p = (uint64_t)__sync_add_and_fetch(&progress, 1);
      if ((p & 0x3FFFF) == 0) {
        double sec = (double)(clock() - t0) / CLOCKS_PER_SEC;
#ifdef _OPENMP
        /* clock() sums CPU time; wall ≈ cpu/threads */
        int th = omp_get_max_threads();
        if (th < 1)
          th = 1;
        double wall = sec / th;
#else
        double wall = sec;
#endif
        double rate = wall > 0.01 ? (double)p / wall : 0;
        fprintf(stderr, "\r    %llu/%llu (%.1f%%) ~%.0f/s  %s   ",
                (unsigned long long)p, (unsigned long long)(total - start_idx),
                100.0 * (double)(start_idx + p) / (double)total, rate, pw);
      }
    }
  }
  fprintf(stderr, "\n");
  return g_found;
}

static int brute_wordlist(const char *path) {
  FILE *f = fopen(path, "r");
  if (!f) {
    perror(path);
    return -1;
  }
  char line[256];
  long long n = 0;
  clock_t t0 = clock();
  /* load all into memory for OpenMP */
  char **words = NULL;
  int nwords = 0, cap = 0;
  while (fgets(line, sizeof line, f)) {
    size_t L = strlen(line);
    while (L && (line[L - 1] == '\n' || line[L - 1] == '\r'))
      line[--L] = 0;
    if (!L || L > 39)
      continue;
    if (nwords >= cap) {
      cap = cap ? cap * 2 : 4096;
      words = realloc(words, (size_t)cap * sizeof(char *));
    }
    words[nwords++] = strdup(line);
  }
  fclose(f);
  fprintf(stderr, "[*] wordlist %s: %d words\n", path, nwords);

#pragma omp parallel for schedule(dynamic, 64)
  for (int i = 0; i < nwords; i++) {
    if (g_found)
      continue;
    int L = (int)strlen(words[i]);
    if (check_any((uint8_t *)words[i], L)) {
#pragma omp critical
      {
        if (!g_found) {
          g_found = 1;
          snprintf(g_hit, sizeof g_hit, "%s", words[i]);
          fprintf(stderr, "\n[+] FOUND %s\n", words[i]);
        }
      }
    }
    if ((__sync_add_and_fetch(&n, 1) & 0x3FFF) == 0)
      fprintf(stderr, "\r    %lld/%d", n, nwords);
  }
  fprintf(stderr, "\n");
  for (int i = 0; i < nwords; i++)
    free(words[i]);
  free(words);
  (void)t0;
  return g_found;
}

int main(int argc, char **argv) {
  const char *exe = "original/crackme.exe";
  const char *alph = "abcdefghijklmnopqrstuvwxyz";
  const char *wordlist = NULL;
  int len_min = 1, len_max = 5;
  uint64_t start = 0;

  for (int i = 1; i < argc; i++) {
    if (!strcmp(argv[i], "-l") && i + 1 < argc)
      len_min = atoi(argv[++i]);
    else if (!strcmp(argv[i], "-L") && i + 1 < argc)
      len_max = atoi(argv[++i]);
    else if (!strcmp(argv[i], "-a") && i + 1 < argc)
      alph = argv[++i];
    else if (!strcmp(argv[i], "-w") && i + 1 < argc)
      wordlist = argv[++i];
    else if (!strcmp(argv[i], "-s") && i + 1 < argc)
      start = strtoull(argv[++i], NULL, 10);
    else if (argv[i][0] != '-') {
      if (load_pe(exe) != 0)
        return 2;
      int ok = check_any((uint8_t *)argv[i], (int)strlen(argv[i]));
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

  if (wordlist) {
    if (brute_wordlist(wordlist)) {
      printf("FOUND %s\n", g_hit);
      return 0;
    }
    puts("not found in wordlist");
    return 1;
  }

  int n = (int)strlen(alph);
  for (int len = len_min; len <= len_max; len++) {
    uint64_t st = (len == len_min) ? start : 0;
    if (brute_len(len, alph, n, st)) {
      printf("FOUND %s\n", g_hit);
      return 0;
    }
  }
  puts("not found");
  return 1;
}
