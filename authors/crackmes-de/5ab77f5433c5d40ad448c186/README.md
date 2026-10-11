# crackme_9 by fireworx

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c186`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c186) |
| **Auteur (site)** | crackmes.de (FireWorx) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Win32 GUI, Borland Delphi 4 (non packé) |
| **Difficulté** | 1.0 |
| **SHA-256** | `c5b352e9e60a48d9ad48a6300a63ee97059449b1a6be9e0197e1a29116f15b2c` (zip) |

ZIP password : `crackmes.one`. Voir [`ORIGIN.yml`](ORIGIN.yml).

## TL;DR

Keygen (pas de nom : le programme affiche un nombre `n` aléatoire dans `Edit2` au lancement) :

```
serial = ((((n / 1932) * 921) << 17) >>> 9) / 12     (entiers 32 bits, divisions signées)
n = 654321 -> 349568
```

Solveur : [`tools/crackme9-solve.py`](tools/crackme9-solve.py) (`--verify Crackme9.exe` pour comparer avec l'émulation du vrai code).

## Comment on trouve

1. `diec` : PE32 GUI, Borland Delphi 4, **pas de packer** (le crackme_9.1 de la même archive est la même chose packée ASPack). Le readme demande un keygen.
2. Table des méthodes publiées de `TForm1` : la chaîne `Button1Click` à `0x40B7E` du fichier est précédée de l'adresse `0x004417D0`.
3. Champs de `TForm1` (ordre RTTI `Edit1`, `Button1`, `Edit2`, `Label1`) : `Edit1` = `+0x2C4`, `Edit2` = `+0x2CC`.
4. Désassemblage ([`analysis/Button1Click.asm`](analysis/Button1Click.asm)) :

```asm
mov  eax,[ebx+0x2cc] ; call GetText ; call StrToInt   ; n = Edit2
mov  ecx,0x78c ; cdq ; idiv ecx                       ; n / 1932
imul eax,eax,0x399                                    ; * 921
shl  eax,0x11 ; shr eax,0x9                           ; << 17 puis >> 9 logique
mov  ecx,0xc ; cdq ; idiv ecx                         ; / 12
call IntToStr                                         ; s = serial attendu
mov  eax,[ebx+0x2c4] ; call GetText                   ; Edit1
call LStrCmp ; jne fin ; "Really nice, keygen it now"
```

5. Le `FormCreate` (juste après, `0x441894`) remplit `Edit2` avec des nombres entre `Random(600000)` et `Random(700000)` : c'est le « code machine » à saisir dans le keygen.

## Vérification

Le message de réussite n'ouvre pas de fenêtre identifiable depuis `xdotool` (pas de nouvelle fenêtre après le clic, que le serial soit bon ou faux), donc pas de vérification live concluante sous Wine. La vérification est faite par **émulation Unicorn du vrai code** de `Button1Click` (octets `0x4417FF`–`0x441820` lus dans l'exe) sur plusieurs valeurs :

```
$ python3 tools/crackme9-solve.py --verify Crackme9.exe 654321 600000 699999 123 -5000
n=654321 -> serial=349568  [unicorn: 349568] OK
n=600000 -> serial=498474  [unicorn: 498474] OK
n=699999 -> serial=122069  [unicorn: 122069] OK
n=123 -> serial=0  [unicorn: 0] OK
n=-5000 -> serial=659754  [unicorn: 659754] OK
```
