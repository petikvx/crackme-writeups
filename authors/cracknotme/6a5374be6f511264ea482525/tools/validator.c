/*
 * CFB #9 — impostor validator.dll
 *
 * CFB9.exe charge <dir>/validator.dll (LoadLibraryExA + LOAD_WITH_ALTERED_SEARCH_PATH),
 * résout l'export VerifyLicense, puis appelle :
 *
 *   unsigned int VerifyLicense(const char *challenge, const char *license_key);
 *
 * challenge = sprintf("CHAL-%u", GetTickCount())
 * succès ssi retour == 0x1337c0de
 *
 * Aucune validation locale dans l'EXE : on remplace le garde.
 */
#include <windows.h>

#ifdef __cplusplus
extern "C" {
#endif

__declspec(dllexport) unsigned int VerifyLicense(const char *challenge,
                                                 const char *license_key) {
  (void)challenge;
  (void)license_key;
  return 0x1337c0deu;
}

BOOL WINAPI DllMain(HINSTANCE hinst, DWORD reason, LPVOID reserved) {
  (void)hinst;
  (void)reason;
  (void)reserved;
  return TRUE;
}

#ifdef __cplusplus
}
#endif
