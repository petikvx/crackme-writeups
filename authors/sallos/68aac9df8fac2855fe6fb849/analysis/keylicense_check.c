#include <windows.h>
#include <stdio.h>
#include <string.h>

/* Mirror of sub_401409 as executed (bug: only first 4 bytes after length==19). */
static int check_buf(const unsigned char *a) {
  unsigned ebx = 2, edx = 3;
  unsigned ecx = 4;
  while (ecx--) {
    unsigned al = *a++;
    if ((al % (ebx & 0xff)) != 0) return 1;
    unsigned nb = edx;
    edx = edx + ebx;
    ebx = nb;
  }
  return 0; /* success */
}

static int check_file(const char *path) {
  HANDLE h = CreateFileA(path, GENERIC_READ, FILE_SHARE_READ, NULL, OPEN_EXISTING, FILE_ATTRIBUTE_NORMAL, NULL);
  if (h == INVALID_HANDLE_VALUE) { printf("CreateFile fail %lu path=%s\n", GetLastError(), path); return 2; }
  unsigned char buf[32]; DWORD n=0;
  SetFilePointer(h, 0, NULL, FILE_BEGIN);
  ReadFile(h, buf, 0x13, &n, NULL);
  CloseHandle(h);
  printf("read %lu bytes: ", n);
  for (DWORD i=0;i<n;i++) putchar(buf[i]>=32&&buf[i]<127?buf[i]:'.');
  putchar('\n');
  if (n != 19) return 2;
  return check_buf(buf);
}

int main(int argc, char **argv) {
  char path[MAX_PATH];
  if (argc > 1) strncpy(path, argv[1], MAX_PATH-1);
  else {
    GetModuleFileNameA(NULL, path, MAX_PATH);
    /* same dir */
    char *sl = strrchr(path, '\\');
    if (sl) strcpy(sl+1, "key.license");
  }
  printf("path=%s\n", path);
  int r = check_file(path);
  printf("file_check=%d (%s)\n", r, r==0?"OK":"FAIL");

  char name[256]={0}; ULONG ns=sizeof(name);
  HMODULE s=LoadLibraryA("secur32.dll");
  typedef BOOLEAN (WINAPI *GUEX)(int,LPSTR,PULONG);
  GUEX f=(GUEX)GetProcAddress(s,"GetUserNameExA");
  f(2, name, &ns);
  char *p=strchr(name,'\\');
  char *user=p?p+1:name;
  printf("expect_dialog_user=%s\n", user);
  return r==0?0:1;
}
