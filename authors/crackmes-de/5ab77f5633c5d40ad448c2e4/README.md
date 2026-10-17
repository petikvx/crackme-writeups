# crackmes.de's keygenme_1 by ksil — KeyGenMe #1 (Ks@il / GFS)

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c2e4`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e4) |
| **Auteur (site)** | crackmes.de (auteur réel : Ks@il, GrOuP FrEeDoM SeArCh) |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 GUI, Borland Delphi 7 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip)** | `5ede8b9e5d0382265a5fb708d96bb022406df9a7fd94d46117828e4e92fbede9` |
| **SHA-256 (KeyGenMe.exe)** | `f5e21a8897a82387e6df3e592c0283560e956cc09b5bbb6221725db0b39723f4` |

## TL;DR

Il n'y a **pas de champ nom** : le serial dépend uniquement de la version de Windows.

```
serial = IntToStr(major) + IntToStr(minor) + "Ft-23g$-bx4f-@d"
```

où `major` / `minor` sont les deux octets bas de `GetVersion()`.

| Système (vu par le process) | Serial |
|---|---|
| Windows XP (5.1) | `51Ft-23g$-bx4f-@d` |
| Windows 7 (6.1) | `61Ft-23g$-bx4f-@d` |
| Windows 8 / 10 / 11, wine (6.2, pas de manifeste) | `62Ft-23g$-bx4f-@d` |

Solveur : [`tools/crackmes-de-keygenme_1-solve.py`](tools/crackmes-de-keygenme_1-solve.py).

## Origine

- Page : https://crackmes.one/crackme/5ab77f5633c5d40ad448c2e4
- Download : https://crackmes.one/download/crackme/5ab77f5633c5d40ad448c2e4
- ZIP password : `crackmes.one` (le zip contient lui-même `keygenme.zip` → `KeyGenMe.exe` + `ReadMe.txt`)

Règle du `ReadMe.txt` : « You can write KeyGen for this application ».

## Premier regard

```text
KeyGenMe.exe: PE32 executable for MS Windows 4.00 (GUI), Intel i386
diec : Linker Turbo Linker(2.25), Compiler Borland Delphi(7)
```

Le formulaire Delphi (ressource RCDATA `TKEYGENME`, DFM `TPF0`) contient :

- `Label1` « Enter Serial Number : »
- `Edit1` (TEdit) — **seul champ de saisie**
- boutons `Enter` (`OnClick = EnterClick`), `About`, `Exit`

L'adresse de `EnterClick` se lit dans la table des méthodes publiées de la classe
`TKeyGenME` (dword juste avant la shortstring `\x0aEnterClick`) : **`0x004671AC`**.

## `TKeyGenME.EnterClick` @ 0x4671AC

```asm
call  GetVersion                  ; 0x405F30 → jmp [kernel32!GetVersion]
mov   ebx, eax
and   bx, 0FFFFh
mov   eax, ebx / shr ax, 8        ; minor
call  IntToStr                    ; → s_minor  [ebp-0Ch]
mov   eax, ebx / and ax, 0FFh     ; major
call  IntToStr                    ; → s_major  [ebp-10h]
call  LStrCat3                    ; ver = s_major + s_minor   [ebp-4]
lea   ecx,[ebp-8] / mov dx,0Fh / xor eax,eax
call  DecryptStr                  ; 0x4670BC(start=0, len=15) → [ebp-8]
call  TControl.GetText(Edit1)     ; saisie [ebp-14h]
call  LStrCat3                    ; attendu = ver + DecryptStr
call  LStrCmp                     ; 0x467239
jne   Try_again                   ; 0x46723E
ShowMessage('You crack Me') / ShowMessage('Try again')
```

Ordre de la concaténation : `_LStrCat3(Dest=EAX, S1=EDX, S2=ECX)` avec EDX = chaîne du
*major* et ECX = chaîne du *minor* → `"6" + "2"` = `"62"` sous wine/Win10.

## `DecryptStr` @ 0x4670BC — « Delphi String Protect by BGSoPT. »

```c
key = "Delphi String Protect by BGSoPT.";        // 32 caractères @0x467178
for (i = start; i < start + len; i++)
    out += key[i & 31] ^ table[i];               // table @0x4696D0 (section DATA)
```

Table (15 octets) : `02 11 41 42 5B 0E 04 7E 16 0A 5D 08 4A 60 34`  
→ XOR avec `"Delphi String P"` = **`Ft-23g$-bx4f-@d`**.

La table n'est référencée que par cette routine (pas de réécriture à l'exécution) : la
partie constante du serial est donc purement statique.

## Keygen

```python
KEY = b"Delphi String Protect by BGSoPT."
TABLE = bytes.fromhex("021141425b0e047e160a5d084a6034")
def serial(major, minor):
    return f"{major}{minor}" + bytes(KEY[i % 32] ^ TABLE[i] for i in range(15)).decode()
```

```console
$ ./tools/crackmes-de-keygenme_1-solve.py
62Ft-23g$-bx4f-@d
  WinXP                        -> 51Ft-23g$-bx4f-@d
  Win7                         -> 61Ft-23g$-bx4f-@d
  Win8+ / Win10 / Win11 / wine -> 62Ft-23g$-bx4f-@d
```

Remarque : sans manifeste de compatibilité, `GetVersion()` renvoie 6.2 sur Windows 8.1/10/11.
En mode de compatibilité (ex. « Windows XP SP3 »), il faut utiliser la version simulée (`51…`).

## Vérification

`ShowMessage` de Delphi affiche un `TMessageForm` dont le texte est un `TLabel` (non
fenêtré, illisible par `GetWindowText`). Le harnais
[`tools/keygenme-dbg-harness.c`](tools/keygenme-dbg-harness.c) (mingw, lancé sous
`xvfb-run wine`) démarre donc le binaire d'origine **en tant que débogueur**, pose un `int3`
sur le `LStrCmp` (0x467239) et sur le `jne` (0x46723E), remplit `Edit1` (`WM_SETTEXT`) et
clique `Enter` (`BM_CLICK`) :

```console
$ xvfb-run -a wine keygenme-dbg-harness.exe KeyGenMe.exe '62Ft-23g$-bx4f-@d'
entered=[62Ft-23g$-bx4f-@d] expected=[62Ft-23g$-bx4f-@d]
ZF=1 -> You crack Me
$ xvfb-run -a wine keygenme-dbg-harness.exe KeyGenMe.exe 'petik'
entered=[petik] expected=[62Ft-23g$-bx4f-@d]
ZF=0 -> Try again
```

## Contenu

```
original/   keygenme.zip (téléchargé), KeyGenMe.exe + ReadMe.txt (extraits)
tools/      crackmes-de-keygenme_1-solve.py (keygen), keygenme-dbg-harness.c (vérif wine)
```

## Status

- [x] reverse
- [x] write-up
- [x] solveur
