# SimbaHDD's CRACKME

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a160c2a2b3df128c1df5cc1) · id `6a160c2a2b3df128c1df5cc1`

Crackme **PE32+ console** x86-64 (**MinGW-w64** / GCC 15.2, avec debug).  
Auteur site : **SimbaHDD**.

Dossier : `authors/simbahdd/6a160c2a2b3df128c1df5cc1/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/crackme.exe`](original/crackme.exe) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`tools/simbahdd-solve.py`](tools/simbahdd-solve.py) | extrait le password du PE |
| [`tools/crackme-recon.c`](tools/crackme-recon.c) | clone C (même logique) |
| [`analysis/crackme-recon.exe`](analysis/crackme-recon.exe) | recon MinGW pour Wine |
| [`analysis/main.asm`](analysis/main.asm) | listing `main` |
| [`analysis/wine-recon-ok.txt`](analysis/wine-recon-ok.txt) | Wine recon → `CORRECT!` |
| [`analysis/wine-original-seh.txt`](analysis/wine-original-seh.txt) | crash SEH Wine sur l’original |

## Réponse

| Input | Valeur |
|---|---|
| Password | **`simba123`** |

```bash
python3 tools/simbahdd-solve.py -q
# simba123

python3 tools/simbahdd-solve.py --check simba123
# OK
```

Sous Windows natif (ou clone Wine) :

```text
Enter password: simba123
CORRECT!
```

---

## 1. Premier regard

```text
file original/crackme.exe
# PE32+ executable (console) x86-64, 19 sections (MinGW + .debug_*)
```

Strings immédiates dans `.data` :

```text
Enter password: 
simba123
CORRECT!
WRONG!
%99s
```

Hashes :  
MD5 `3f9ddcd22f9d8c72b51e5df5402f5ae0` · SHA-256 `dead29f6b77611aacf0467139236c0ddc6fb422bfa0422721003c9f19c46ca1a`.

Site : difficulty **1.3** · quality **4.0** · langage Assembler (en pratique **C + CRT MinGW** ; `main` en asm/objdump très lisible).

---

## 2. Flow / prédicat

`main` @ `0x140001490` :

```asm
; printf("Enter password: ")     ; RCX = 0x140003000
; scanf("%99s", input)           ; RCX fmt 0x14000302d, RDX buf 0x140007030 (.bss)
; strcmp(input, "simba123")      ; RDX = 0x140003011
test eax, eax
jne  main.wrong
printf("CORRECT!")
jmp  main.exit
main.wrong:
printf("WRONG!")
main.exit:
getchar
xor  eax, eax
ret
```

Aucun chiffrement : **strcmp** contre la chaîne en clair.

---

## 3. Vérification

**Statique** : password @ file off `0x2011` / VA `0x140003011`.

**Wine (original)** : plante en SEH sur Wine 9.0 (`invalid frame … 0x1400070B8` dans `.bss`) — pas de preuve console sur l’ELF/PE d’origine ici.

**Wine (recon)** — même I/O / `strcmp` :

```bash
x86_64-w64-mingw32-gcc -o analysis/crackme-recon.exe tools/crackme-recon.c
printf 'simba123\n\n' | wine analysis/crackme-recon.exe
# Enter password: CORRECT!
```

Voir [`analysis/wine-recon-ok.txt`](analysis/wine-recon-ok.txt).

---

## Notes

- Challenge intro / « strings + strcmp ».
- L’échec Wine sur l’original est un souci runtime MinGW/Wine, pas un anti-debug du crackme.
- Commentaires crackmes.one : même password `simba123` (confirmé ici par reverse).
