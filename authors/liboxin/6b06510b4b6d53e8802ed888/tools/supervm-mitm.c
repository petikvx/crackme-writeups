/* Meet-in-the-middle pour « easy vm v2 » (liboxin).
 *
 * Les deux VMs imposent :
 *   VM1 : h1 = 0x811c9dc5 ; pour i=0..21 : h1 = rol(((h1^k[i])*0x01000193) ^ (((h1^k[i])*0x01000193)>>13), 5)
 *         h1 == 0x9f3c8d51
 *   VM2 : h2 = 0x9e3779b9 ; pour i=21..0 : h2 = rol(((h2+k[i])*0x85ebca6b) ^ (((h2+k[i])*0x85ebca6b)>>11), 7)
 *         h2 == 0x92e28c11
 *
 * Chaque pas est bijectif en h, donc on peut avancer et reculer librement.
 * On fixe 14 des 22 octets et on laisse 8 octets libres CONTIGUS (positions
 * FREE..FREE+7) : les quatre états de bord deviennent alors des constantes
 * P0, Q0 (VM1) et R0, S0 (VM2), et il reste à résoudre
 *
 *   fwd1(P0, k[F..F+7])        == Q0        (32 bits)
 *   fwd2(R0, k[F+7..F] inv.)   == S0        (32 bits)
 *
 * d'où un MITM 4+4 octets : le côté gauche (k[F..F+3]) donne (u, v), le côté
 * droit (k[F+4..F+7]) donne (u', v'), et on cherche u==u' && v==v'.
 * La table du côté droit est filtrée sur les 4 bits bas de u' (16 passes
 * possibles, ~3 Go par passe).
 *
 * cc -O3 -march=native -fopenmp -o supervm-mitm supervm-mitm.c
 * ./supervm-mitm <passe 0..15>
 */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdint.h>
#include <omp.h>

#define P1 0x01000193u
#define P2 0x85ebca6bu
#define I1 0x359c449bu            /* P1^-1 mod 2^32 */
#define I2 0xa5cb9243u            /* P2^-1 mod 2^32 */
#define BASIS1 0x811c9dc5u
#define BASIS2 0x9e3779b9u
#define TARGET1 0x9f3c8d51u
#define TARGET2 0x92e28c11u

static inline uint32_t rol(uint32_t x, int n) { return (x << n) | (x >> (32 - n)); }
static inline uint32_t ror(uint32_t x, int n) { return (x >> n) | (x << (32 - n)); }

static inline uint32_t s1(uint32_t h, uint32_t c) { uint32_t x = (h ^ c) * P1; x ^= x >> 13; return rol(x, 5); }
static inline uint32_t u1(uint32_t h, uint32_t c) { uint32_t y = ror(h, 5); uint32_t x = y ^ (y >> 13) ^ (y >> 26); return (x * I1) ^ c; }
static inline uint32_t s2(uint32_t h, uint32_t c) { uint32_t x = (h + c) * P2; x ^= x >> 11; return rol(x, 7); }
static inline uint32_t u2(uint32_t h, uint32_t c) { uint32_t y = ror(h, 7); uint32_t x = y ^ (y >> 11) ^ (y >> 22); return (x * I2) - c; }

/* 22 octets ; les 8 positions FREE..FREE+7 sont les inconnues */
static const char BASE[23] = "aegis_vm_????????_key!";
#define FREE 9

/* Le côté droit est rangé dans un tableau indexé par u'>>4 (les 4 bits bas
 * valent la passe), une entrée par case : les cases déjà prises sont perdues,
 * ce qui coûte ~26 % des candidats mais évite tout tri. */
typedef struct { uint32_t v; uint8_t c[4]; } slot_t;

int main(int argc, char **argv) {
    int only = argc > 1 ? atoi(argv[1]) : -1;
    const uint8_t *B = (const uint8_t *)BASE;

    /* bords constants */
    uint32_t P0 = BASIS1;
    for (int i = 0; i < FREE; i++) P0 = s1(P0, B[i]);
    uint32_t Q0 = TARGET1;
    for (int i = 21; i >= FREE + 8; i--) Q0 = u1(Q0, B[i]);
    uint32_t R0 = BASIS2;
    for (int i = 21; i >= FREE + 8; i--) R0 = s2(R0, B[i]);
    uint32_t S0 = TARGET2;
    for (int i = 0; i < FREE; i++) S0 = u2(S0, B[i]);
    fprintf(stderr, "P0=%08x Q0=%08x R0=%08x S0=%08x\n", P0, Q0, R0, S0);

    size_t cap = (size_t)1 << 28;
    slot_t *tab = calloc(cap, sizeof(slot_t));
    uint8_t *used = calloc(cap, 1);
    if (!tab || !used) { fprintf(stderr, "malloc failed\n"); return 1; }
    size_t n = 0, dropped = 0;

  for (int pass = (only < 0 ? 0 : only); pass < (only < 0 ? 16 : only + 1); pass++) {
    memset(used, 0, cap);
    n = 0; dropped = 0;

    /* côté droit : k[FREE+4..FREE+7] = d0,d1,d2,d3 (d3 le plus à droite) */
    #pragma omp parallel for schedule(dynamic) reduction(+:n,dropped)
    for (unsigned d3 = 0; d3 < 256; d3++) {
        uint32_t a3 = u1(Q0, d3), b3 = s2(R0, d3);
        for (unsigned d2 = 0; d2 < 256; d2++) {
            uint32_t a2 = u1(a3, d2), b2 = s2(b3, d2);
            for (unsigned d1 = 0; d1 < 256; d1++) {
                uint32_t a1 = u1(a2, d1), b1 = s2(b2, d1);
                for (unsigned d0 = 0; d0 < 256; d0++) {
                    uint32_t up = u1(a1, d0);
                    if ((up & 15u) != (unsigned)pass) continue;
                    uint32_t vp = s2(b1, d0);
                    size_t ix = up >> 4;
                    if (used[ix]) { dropped++; continue; }
                    used[ix] = 1;
                    tab[ix].v = vp;
                    tab[ix].c[0] = d0; tab[ix].c[1] = d1; tab[ix].c[2] = d2; tab[ix].c[3] = d3;
                    n++;
                }
            }
        }
    }
    fprintf(stderr, "table droite : %zu entrees (%zu perdues), balayage gauche...\n", n, dropped);

    /* côté gauche : k[FREE..FREE+3] = g0..g3 */
    volatile int found = 0;
    #pragma omp parallel for schedule(dynamic) shared(found)
    for (unsigned g0 = 0; g0 < 256; g0++) {
        if (found) continue;
        uint32_t x0 = s1(P0, g0), y0 = u2(S0, g0);
        for (unsigned g1 = 0; g1 < 256; g1++) {
            uint32_t x1 = s1(x0, g1), y1 = u2(y0, g1);
            for (unsigned g2 = 0; g2 < 256; g2++) {
                uint32_t x2 = s1(x1, g2), y2 = u2(y1, g2);
                for (unsigned g3 = 0; g3 < 256; g3++) {
                    uint32_t u = s1(x2, g3);
                    if ((u & 15u) != (unsigned)pass) continue;
                    uint32_t v = u2(y2, g3);
                    size_t ix = u >> 4;
                    slot_t *hit = &tab[ix];
                    if (used[ix] && hit->v == v) {
                        uint8_t k[22];
                        memcpy(k, B, 22);
                        k[FREE+0] = g0; k[FREE+1] = g1; k[FREE+2] = g2; k[FREE+3] = g3;
                        k[FREE+4] = hit->c[0]; k[FREE+5] = hit->c[1];
                        k[FREE+6] = hit->c[2]; k[FREE+7] = hit->c[3];
                        /* vérification complète */
                        uint32_t h1 = BASIS1; for (int i = 0; i < 22; i++) h1 = s1(h1, k[i]);
                        uint32_t h2 = BASIS2; for (int i = 21; i >= 0; i--) h2 = s2(h2, k[i]);
                        printf("h1=%08x h2=%08x %s\n", h1, h2,
                               (h1 == TARGET1 && h2 == TARGET2) ? "OK" : "FAUX");
                        if (h1 == TARGET1 && h2 == TARGET2) {
                            printf("KEY bytes:");
                            for (int i = 0; i < 22; i++) printf(" %02x", k[i]);
                            printf("\n");
                            fflush(stdout);
                            found = 1;
                        }
                    }
                }
            }
        }
    }
    if (found) { free(tab); free(used); return 0; }
    fprintf(stderr, "passe %d : rien\n", pass);
  }
    free(tab); free(used);
    return 2;
}
