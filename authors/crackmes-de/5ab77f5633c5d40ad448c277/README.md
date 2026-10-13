# mishka_tribute by zart (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c277)
- Auteur : zart (archive crackmes.de) · plateforme : Windows PE32 console, MSVC6 (C++) · difficulté 1.0

| Fichier | Rôle |
|---|---|
| `original/keygenme.zip` | archive d'origine (mot de passe site `crackmes.one`) |
| `original/keygenme.exe` | binaire extrait (40 960 o, sha256 `004fcfe46916b31a6cc0a550969c7bfad6901728e6e791b23194cf970badccc2`) |
| `tools/mishka_tribute-solve.py` | keygen (`--name`, `-q`, `--check`) |
| `analysis/verify.sh` | preuve Wine (pty + ALSA null + relay msvcirt) |

## Réponse

| Name | Serial |
|---|---|
| `petik` | `3649375339` |

```bash
python3 tools/mishka_tribute-solve.py            # name petik -> serial 3649375339
python3 tools/mishka_tribute-solve.py --name foo -q
python3 tools/mishka_tribute-solve.py --check 3649375339   # OK
```

## Premier regard

```text
$ file keygenme.exe
PE32 executable for MS Windows 4.00 (console), Intel i386, 4 sections
$ diec keygenme.exe
Linker: Microsoft Linker(6.00.8168) / Compiler: Microsoft Visual C/C++(12.00.9782)[C++]
```

Sections `.text`, `.code` (12 octets : deux getters qui renvoient l'adresse/la taille d'un module XM), `.rdata`, `.data`.
Strings utiles : `[KeyGenMe][v1] - [zart]`, `Name: `, `Serial: `, `You must enter a name!`,
`Serial checked out - now right a keygen.`, `Serial failed check!` et tout un player de module
*Extended Module: UnderPL Keygen #1* (MadTracker, LHS/DFS) joué via `waveOut*` (WINMM) dans un thread
→ c'est le « tribute » : un keygenme avec sa musique de keygen.

Imports clés : `_kbhit` / `_getch` (saisie caractère par caractère), `std::string::append(unsigned, char)`
(MSVCP60), `ostream << ` (MSVCIRT).

## Flow (`main` ≈ 0x4010ec)

1. Initialise le player XM (`0x401288`, 44100 Hz) ; échec → `Error upon initialization` et sortie.
2. Affiche la bannière, `Name: `.
3. Boucle `_kbhit`/`_getch` : tant que `state == 0` (saisie du nom) chaque touche est écho-ée puis
   **`name.append(count, ch)`**, `count++`. Sur `\r` : si `count == 0` → `You must enter a name!`,
   sinon `Serial: ` et `state = 1`.
4. En état 1 chaque touche est accumulée en décimal dans `ebx` ; sur `\r` : `hash(name) == ebx` ?
5. Message good/bad, arrêt de la musique (`waveOutReset/Close`), sortie.

## Comment on trouve le prédicat

Ancrage : `objdump -d -M intel` et les `push` des chaînes (`0x407028` good, `0x407010` bad) :

```asm
4011ea: push [ebp-0x18]           ; ch (touche lue)
4011fd: push [ebp-0x18]           ; arg2 = ch
401203: push [ebp-0x14]           ; arg1 = count  (index de la touche !)
401206: call std::string::append(unsigned,char)   ; name.append(count, ch)
40120c: inc  [ebp-0x14]
...
401228: lea  eax,[ebx+ebx*4]      ; serial : ebx = ebx*10 + (ch-'0')
40122b: movsx ecx,byte [ebp-0x18]
40122f: lea  ebx,[ecx+eax*2-0x30]
...
401238: lea  eax,[ebp-0x30] ; push eax ; call 0x401000   ; hash(name)
401241: cmp  eax,ebx
401244: jne  bad                  ; 0x407010 "Serial failed check!"
```

**Piège n°1** : `append(n, c)` ajoute *n copies* de `c`, et `n` est l'index de la touche.
Le 1er caractère est donc ajouté 0 fois, le 2e une fois, le 3e deux fois… Pour `petik` le buffer
réellement haché est `""+"e"+"tt"+"iii"+"kkkk" = "ettiiikkkk"`. (Un nom d'un seul caractère donne un
buffer vide → hash 0 → serial `0`.)

Hash `0x401000` (std::string MSVC6 : `+4` = pointeur, `+8` = longueur) :

```asm
401005: xor eax,eax               ; a = 0
40100f: mov edi,0x43ba            ; m = 0x43BA
401027: movsx ecx,byte [ecx]      ; c (signé)
40102a: imul eax,edi              ; a *= m
40102d: add  eax,ecx              ; a += c
40102f: imul edi,edi,0x6e6fa      ; m *= 0x6E6FA
401036: cmp esi,edx / jb          ; pour toute la longueur
```

Pseudo-code consolidé (tout mod 2^32) :

```python
buf = "".join(c * i for i, c in enumerate(name))
a, m = 0, 0x43BA
for c in buf.encode():
    a = a*m + c ; m = m*0x6E6FA
serial = str(a)        # parse décimal sur 32 bits, cmp eax,ebx
```

Exemple `petik` → `ettiiikkkk` → `a = 0xD9858B6B = 3649375339`.
Comme la saisie du serial est un `*10 + (c-'0')` sans contrôle, l'écriture non signée du hash convient
directement (pas besoin de gérer le signe).

## Vérification (Wine)

Trois obstacles pour la preuve live :

- `_kbhit`/`_getch` ignorent un stdin en pipe → lancer sous un pty (`script -qfc`) ;
- sans périphérique audio, `waveOutOpen` échoue → `Error upon initialization` ; on fournit un PCM
  ALSA `null` (`ALSA_CONFIG_PATH=/tmp/asound-null.conf`, contenu `pcm.!default { type null }`) ;
- le message final est écrit dans `cout` **sans flush** et n'apparaît pas sur la sortie Wine ;
  on lit donc l'argument de `ostream::operator<<(const char*)` appelé depuis `0x40125a` avec
  `WINEDEBUG=+relay`.

```text
$ analysis/verify.sh petik 3649375339
"\nSerial checked out - now right a keygen.\n"
$ analysis/verify.sh petik 12345
"\nSerial failed check!\n"
```

Relay complet côté OK :
`Call msvcirt.??6ostream@@QAEAAV0@PBD@Z(7b0140e0,00407028 "\nSerial checked out - now right a keygen.\n") ret=0040125a`
(code de sortie 0, musique arrêtée proprement par `waveOutReset/waveOutClose`).

## Notes

- Pas de packer ni d'anti-debug ; la difficulté est uniquement le `append(count, ch)` qui « répète »
  les lettres du nom.
- Le serial n'est pas filtré : n'importe quel caractère est accepté et compté comme `c-'0'`.
- Backspace n'est pas géré : il serait lui aussi ajouté au buffer.
