extern char **__environ;
extern int *__errno_location(void);
static long sys3(long n, long a, long b, long c) {
    long r; __asm__ volatile("int $0x80" : "=a"(r) : "0"(n), "b"(a), "c"(b), "d"(c) : "memory"); return r;
}
static void out(const char *s) { long n = 0; while (s[n]) n++; sys3(4, 2, (long)s, n); }
static void num(long v) { char b[16]; int i = 15; b[i] = 0; if (v < 0) { out("-"); v = -v; } do { b[--i] = '0' + v % 10; v /= 10; } while (v); out(b + i); }
int execvp(const char *f, char *const argv[]) {
    out("EXECVP "); out(f); out("\n");
    for (int i = 0; argv[i]; i++) { out("ARG<<<"); out(argv[i]); out(">>>\n"); }
    if (argv[1] && argv[2] && argv[2][0]=='e' && argv[2][1]=='x' && argv[2][2]=='e' && argv[2][3]=='c')
        return sys3(11, (long)f, (long)argv, (long)__environ);
    sys3(1, 0, 0, 0);
    return -1;
}
void perror(const char *s) { out("PERROR "); out(s); out(" errno="); num(*__errno_location()); out("\n"); }
long ptrace(int r, int p, long a, long d) { out("PTRACE req="); num(r); out(" pid="); num(p); out("\n"); long x = sys3(26, r, p, a); out(" ->"); num(x); out("\n"); return x; }
__attribute__((constructor)) static void init(void) {
    long r; __asm__ volatile("int $0x80" : "=a"(r) : "0"(172), "b"(0x59616d61), "c"(-1L), "d"(0) : "memory");
}
long time(long *t) { long v = 1260000000; if (t) *t = v; return v; }
static void hex(const unsigned char *p, long n) { const char *h = "0123456789abcdef"; char b[3]; b[2]=0; for (long i = 0; i < n && i < 40; i++) { b[0]=h[p[i]>>4]; b[1]=h[p[i]&15]; out(b); } }
int memcmp(const void *a, const void *b, unsigned long n) {
    out("MEMCMP n="); num(n); out(" A="); hex(a, n); out(" B="); hex(b, n); out("\n");
    const unsigned char *x = a, *y = b;
    for (unsigned long i = 0; i < n; i++) if (x[i] != y[i]) return x[i] - y[i];
    return 0;
}
