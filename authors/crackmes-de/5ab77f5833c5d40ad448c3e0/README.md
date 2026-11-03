# Keygenme # 2 (starzboy) — crackmes.de

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3e0`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3e0) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | starzboy (miroir crackmes.de) |
| **Plateforme** | Windows PE32 console, MinGW/g++ (libstdc++ statique) |
| **SHA-256 du ZIP** | `fe490409163aea0a416943bad9afae881c6d83c3896bd0ab43902a978fd1b9ff` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/Keygenme_#_2.zip` | ZIP d'origine (mot de passe `crackmes.one`) : `Keygenme # 2.exe` + `[~starzboy~].nfo` |
| `tools/keygenme2-solve.py` | keygen (`--user`, `--id`, `-q`, `--check <exe>` via `xvfb-run wine`) |

## Réponse

Le crackme demande **User-Name**, **User-ID** (numérique, cf. le NFO) et **Password**.

| User-Name | User-ID | Password |
|---|---|---|
| `petik` | `12345` | **`2027602351`** |
| `Jean Dupont` | `7` | `1107947558` |

```bash
python3 tools/keygenme2-solve.py --user petik --id 12345        # -q : password seul
python3 tools/keygenme2-solve.py --user petik --id 12345 --check /chemin/vers/'Keygenme # 2.exe'
```

## Premier regard

```bash
unzip -P crackmes.one original/Keygenme_#_2.zip -d /tmp/k2      # ne pas toucher à original/
file '/tmp/k2/Keygenme # 2.exe'   # PE32 console i386
diec  '/tmp/k2/Keygenme # 2.exe'  # MinGW (pas packé)
strings -n 6 '/tmp/k2/Keygenme # 2.exe'
```

Chaînes utiles : `Enter User-Name:`, `Enter User-ID:`, `Enter Password:`, `Access Granted !`, `Access Denied !`, `Access Violation !`. Le NFO précise « User-ID comprises only of numbers ». Le reste des chaînes (`basic_string::…`, `locale::…`) est la libstdc++ liée en statique : bruit.

## Flow

`main` (0x401390) : lit le nom avec `gets` (buffer `ebp-0x108`) ; si vide → « Access Violation ». Sinon lit l'ID avec `cin >> long` (`ebp-0x124`), calcule un accumulateur sur le nom, lit le password avec `cin >> long` (`ebp-0x118`) et compare à l'accumulateur.

## Comment on trouve

**Ancrage.** Les chaînes sont dans `.rdata` (VMA = 0x440000 + offset fichier − 0x3e400), p. ex. `Access Granted` en 0x440102. Avec `objdump -d -M intel` on cherche les `mov [esp+4], 0x440102` : un seul site, `_main+0x271` (0x401603), précédé du test de succès en 0x4015fb. Le binaire n'est pas stripé du tout (symboles `_main`, `_gets`, …), donc pas besoin d'IDA.

**Le check final** :

```asm
4015f5: mov eax,[ebp-0x110]     ; acc calculé
4015fb: cmp eax,[ebp-0x118]     ; password saisi
401601: jne 40163d              ; -> Access Denied
```

**La boucle** (0x401536–0x4015a5), `i` en `ebp-0x128`, `acc` (`ebp-0x110`) initialisé à 0 en 0x4013cd :

```asm
401544: cmp  eax,[ebp-0x128]     ; i < strlen(name) (jbe sinon sortie)
40154c: lea  eax,[ebp-0x8]       ; ebp-8 + i - 0x100 = ebp-0x108+i = name[i]
40155a: movsx eax,BYTE PTR [eax] ; octet signé
401569: add  [ebp-0x10c],0x32a6c65     ; t = c + 0x032A6C65
401575: imul eax,[ebp-0x124]           ; ID*ID
40157c: add  eax,eax                   ; 2*ID²
40157e: add  eax,[ebp-0x10c]           ; + t
401584: add  eax,0x2d67a23             ; + 0x02D67A23
40159b: add  [ebp-0x110],edx           ; acc += ...
4015a3: inc  [ebp-0x128]
```

Donc, en arithmétique 32 bits :

```
password = Σ_i ( name[i] + 0x32A6C65 + 2·ID² + 0x2D67A23 )  mod 2^32
         = Σ name[i] + len·(0x600E688 + 2·ID²)
```

(0x32A6C65 + 0x2D67A23 = 0x600E688 = 100 722 312.)

**Exemple `petik` / `12345`** : Σ ASCII = 112+101+116+105+107 = 541 ; 2·12345² = 304 798 050 ; + 100 722 312 = 405 520 362 ; × 5 caractères = 2 027 601 810 ; + 541 = **2 027 602 351** (< 2³¹, donc saisi tel quel).

**Pièges.**
- `cin >> long` : le password est lu **signé** 32 bits ; si l'accumulateur dépasse 2³¹ il faut saisir la valeur négative correspondante (le solveur le fait).
- L'ID est élevé au carré en 32 bits (wrap) : pas de contrainte autre que « un entier ».
- La boucle lit l'ID *avant* le password, mais l'ID intervient dans chaque itération : le nom seul ne suffit pas.
- `movsx` : les caractères ≥ 0x80 sont sign-étendus (géré dans le solveur).

## Debug GDB

Non utilisé : reverse 100 % statique + preuve sous Wine.

## Vérification

```text
$ python3 tools/keygenme2-solve.py --user petik --id 12345 --check '/tmp/k2n/k2.exe'
User-Name : petik / User-ID : 12345 / Password : 2027602351
CHECK: OK                       # "Access Granted !"

$ python3 tools/keygenme2-solve.py --user 'Jean Dupont' --id 7 --check ...
CHECK: OK

$ printf 'petik\n12345\n1\n' | xvfb-run -a wine k2.exe
Access Denied !                 # cas KO
```

## Notes

- Aucun anti-debug ni packer ; le seul « piège » est la libstdc++ statique qui noie `strings`.
- Le NFO interdit le patching : le keygen est la seule voie visée.
