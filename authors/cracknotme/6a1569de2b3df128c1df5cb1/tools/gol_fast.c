#include <stdio.h>
#include <stdint.h>
#include <string.h>
#include <stdlib.h>
#include <time.h>
#ifdef _OPENMP
#include <omp.h>
#endif

static inline int getb(uint64_t s, int i) { return (int)((s >> i) & 1); }

static uint64_t step(uint64_t s) {
    uint64_t n = 0;
    for (int r = 0; r < 8; r++)
        for (int c = 0; c < 8; c++) {
            int cnt = 0;
            for (int dr = -1; dr <= 1; dr++)
                for (int dc = -1; dc <= 1; dc++)
                    if (dr || dc)
                        cnt += getb(s, (((r + dr) & 7) << 3) | ((c + dc) & 7));
            int alive = getb(s, (r << 3) | c);
            if (alive ? (cnt == 2 || cnt == 3) : (cnt == 3))
                n |= 1ULL << ((r << 3) | c);
        }
    return n;
}

typedef struct {
    uint64_t target;
    int8_t G[64];
    uint64_t *out;
    int nout, maxout;
    int printable_only;
    long nodes, node_limit;
} Ctx;

static int next_from(int center, int cnt) {
    return center ? (cnt == 2 || cnt == 3) : (cnt == 3);
}

static int ok_cell(Ctx *cx, int idx) {
    int r = idx >> 3, c = idx & 7, cnt = 0, center = 0;
    for (int dr = -1; dr <= 1; dr++)
        for (int dc = -1; dc <= 1; dc++) {
            int v = cx->G[(((r + dr) & 7) << 3) | ((c + dc) & 7)];
            if (v < 0) return 1;
            if (!dr && !dc) center = v;
            else cnt += v;
        }
    return next_from(center, cnt) == getb(cx->target, idx);
}

static void dpll(Ctx *cx, int pos) {
    if (cx->nout >= cx->maxout) return;
    if (cx->node_limit && ++cx->nodes > cx->node_limit) return;
    if (pos == 64) {
        uint64_t s = 0;
        for (int i = 0; i < 64; i++) if (cx->G[i]) s |= 1ULL << i;
        if (step(s) == cx->target) cx->out[cx->nout++] = s;
        return;
    }
    for (int v = 0; v <= 1; v++) {
        cx->G[pos] = (int8_t)v;
        if (cx->printable_only && (pos & 7) == 7) {
            int row = pos >> 3;
            unsigned b = 0;
            for (int c = 0; c < 8; c++) if (cx->G[(row << 3) | c]) b |= 1u << c;
            if (b < 0x20 || b > 0x7e) continue;
        }
        int ok = 1;
        int r = pos >> 3, c = pos & 7;
        for (int dr = -1; dr <= 1 && ok; dr++)
            for (int dc = -1; dc <= 1; dc++) {
                int idx = (((r + dr) & 7) << 3) | ((c + dc) & 7);
                if (!ok_cell(cx, idx)) { ok = 0; break; }
            }
        if (ok) dpll(cx, pos + 1);
    }
    cx->G[pos] = -1;
}

static int find_preds(uint64_t t, uint64_t *out, int maxout, int printable, long node_limit) {
    Ctx cx;
    cx.target = t;
    cx.out = out;
    cx.nout = 0;
    cx.maxout = maxout;
    cx.printable_only = printable;
    cx.nodes = 0;
    cx.node_limit = node_limit;
    memset(cx.G, -1, sizeof cx.G);
    dpll(&cx, 0);
    return cx.nout;
}

static int cmpu(const void *a, const void *b) {
    uint64_t x = *(const uint64_t *)a, y = *(const uint64_t *)b;
    return (x > y) - (x < y);
}

static int unique(uint64_t *a, int n) {
    if (n <= 1) return n;
    qsort(a, (size_t)n, sizeof(uint64_t), cmpu);
    int w = 1;
    for (int i = 1; i < n; i++) if (a[i] != a[w - 1]) a[w++] = a[i];
    return w;
}

int main(void) {
    unsigned char rows[8] = {0x1b, 0x13, 0x01, 0x20, 0xd0, 0x44, 0x07, 0x11};
    uint64_t final = 0;
    for (int r = 0; r < 8; r++)
        for (int c = 0; c < 8; c++)
            if ((rows[r] >> c) & 1) final |= 1ULL << ((r << 3) | c);

    const int CAP = 2000000;
    uint64_t *layer = malloc((size_t)CAP * sizeof(uint64_t));
    uint64_t *nextl = malloc((size_t)CAP * sizeof(uint64_t));
    if (!layer || !nextl) return 1;

    int nl = 1;
    layer[0] = final;
    clock_t t0 = clock();

    for (int gen = 0; gen < 3; gen++) {
        int nn = 0;
#pragma omp parallel
        {
            uint64_t local[50000];
#pragma omp for schedule(dynamic, 1)
            for (int i = 0; i < nl; i++) {
                int np = find_preds(layer[i], local, 50000, 0, 0);
#pragma omp critical
                {
                    for (int j = 0; j < np && nn < CAP; j++) nextl[nn++] = local[j];
                    if ((i & 63) == 0)
                        fprintf(stderr, "rev %d %d/%d nn=%d\r", gen + 1, i + 1, nl, nn);
                }
            }
        }
        nn = unique(nextl, nn);
        printf("\nreverse %d: %d\n", gen + 1, nn);
        fflush(stdout);
        memcpy(layer, nextl, (size_t)nn * sizeof(uint64_t));
        nl = nn;
    }

    printf("printable reverse over %d states...\n", nl);
    fflush(stdout);
    int nn = 0;
#pragma omp parallel
    {
        uint64_t local[10000];
#pragma omp for schedule(dynamic, 1)
        for (int i = 0; i < nl; i++) {
            int np = find_preds(layer[i], local, 10000, 1, 2000000);
#pragma omp critical
            {
                for (int j = 0; j < np && nn < CAP; j++) nextl[nn++] = local[j];
                if ((i & 31) == 0)
                    fprintf(stderr, "print %d/%d nn=%d\r", i + 1, nl, nn);
            }
        }
    }
    nn = unique(nextl, nn);
    printf("\nprintable solutions: %d in %.2fs\n", nn, (double)(clock() - t0) / CLOCKS_PER_SEC);

    for (int i = 0; i < nn; i++) {
        uint64_t s = nextl[i];
        uint64_t t = s;
        for (int k = 0; k < 4; k++) t = step(t);
        if (t != final) continue;
        unsigned char pwd[8];
        for (int r = 0; r < 8; r++) {
            unsigned char b = 0;
            for (int c = 0; c < 8; c++)
                if (getb(s, (r << 3) | c)) b |= 1u << c;
            pwd[r] = b;
        }
        printf("PWD: ");
        fwrite(pwd, 1, 8, stdout);
        printf(" hex=");
        for (int r = 0; r < 8; r++) printf("%02x", pwd[r]);
        printf("\n");
    }
    return 0;
}
