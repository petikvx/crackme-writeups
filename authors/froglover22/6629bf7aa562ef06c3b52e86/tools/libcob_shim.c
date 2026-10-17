/* shim minimal de libcob (GnuCOBOL) : uniquement les 8 fonctions importées par crack_on_the_cob. Sert à la preuve live quand libcob.so.4 n'est pas installée. */
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <stdarg.h>
typedef struct { size_t size; unsigned char *data; const void *attr; } cob_field;
void cob_init(int argc, char **argv) { (void)argc; (void)argv; }
int  cob_module_global_enter(void **module, void **glob, int a, int b, int c) {
    (void)a;(void)b;(void)c;
    if (!*module) *module = calloc(1, 0x400);
    *glob = calloc(1, 0x400);
    return 0;
}
int  cob_check_version(const char *src, const char *pkg, int patch) { (void)src;(void)pkg;(void)patch; return 0; }
void cob_set_cancel(void *m) { (void)m; }
void cob_fatal_error(int code) { fprintf(stderr, "cob_fatal_error %d\n", code); exit(1); }
void cob_stop_run(int status) { fflush(stdout); exit(status); }
int  cob_display(int to_device, int newline, int varcnt, ...) {
    va_list ap; va_start(ap, varcnt);
    for (int i = 0; i < varcnt; i++) { cob_field *f = va_arg(ap, cob_field *); fwrite(f->data, 1, f->size, stdout); }
    va_end(ap); if (newline) putchar('\n'); return 0;
}
void cob_accept(cob_field *f) {
    char buf[1024]; if (!fgets(buf, sizeof buf, stdin)) buf[0] = 0;
    buf[strcspn(buf, "\n")] = 0;
    memset(f->data, ' ', f->size); memcpy(f->data, buf, strlen(buf) < f->size ? strlen(buf) : f->size);
}
