/* LD_PRELOAD : rand() renvoie NCN_SEED (défaut 45) pour figer SEMILLA = rand() % 62.
   Sans en-têtes (pas de libc6-dev-i386 sur la box) : gcc -m32 -shared -fPIC -nostdlib */
char *getenv(const char *); int atoi(const char *);
int rand(void){ const char *s = getenv("NCN_SEED"); return s ? atoi(s) : 45; }
void srand(unsigned s){ (void)s; }
