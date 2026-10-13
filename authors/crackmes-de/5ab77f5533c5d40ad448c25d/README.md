# crackmes.de's impostors_crack_me_0.5 by impostor

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c25d`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c25d) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : impostor / Mahdi Hezavehi) |
| **Plateforme** | Windows PE32 console, Borland Delphi 6–7, x86 |
| **Difficulté** | 2.0 |
| **SHA-256 (zip site)** | `1baca5d36bff34b88e6e40cfac4c21ad33a7c3237d2b19db8eb475ccb9a076b1` |
| **SHA-256 (exe)** | `5b57335980d51d2b21f6775a0a2b778e8988baccfbfb8d9943a79913888da6e0` |

Patchme (pas de serial) : le readme demande de patcher pour afficher `[*] Registered ...` **sans** réécrire le littéral `[!] Unregistered ! ...`.

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/IMPosTOR__s_Crack_me_0.5.zip` | archive crackmes.one (mdp `crackmes.one`) |
| `original/IMPosTOR CrackMe 0.5_P.exe` | PE console Delphi (extrait du zip interne) |
| `original/Read me.txt` | consignes de l’auteur |
| `tools/impostor-patch.py` | applique le patch 5 octets @ fichier `0x3629` |
| `tools/IMPosTOR_CrackMe_0.5_patched.exe` | binaire patché (preuve) |

## Réponse

**Patch** : à l’VA `0x404229`, remplacer `mov eax, 0x40446c` (`[!] Unregistered ! ...`) par `mov eax, 0x404290` (`[*] Registered ...`).

```bash
python3 tools/impostor-patch.py \
  -i "original/IMPosTOR CrackMe 0.5_P.exe" \
  -o tools/IMPosTOR_CrackMe_0.5_patched.exe
# sous Wine + PTY : affiche [*] Registered ...
```

## Premier regard

```text
$ file "original/IMPosTOR CrackMe 0.5_P.exe"
PE32 executable for MS Windows 4.00 (console), Intel i386
$ diec "original/IMPosTOR CrackMe 0.5_P.exe"
PE32 — Linker: Turbo Linker(2.25) — Compiler: Borland Delphi(6-7 or 2005)
```

Le zip site contient un second zip (`IMPosTOR__s_Crack_me_0.5.zip` → `IMPosTOR CrackMe 0.5_P.exe` + `Read me.txt`). Console Win32 colorée (`WriteConsole` / attributs), pas de packer.

## Prédicat / patch

Le « check » dans le prologue de fond d’écran :

```asm
404203: mov  al, 1
404205: test al, al
404207: jne  40421f          ; toujours pris (al = 1)
; branche « ko » @ 404209 : Writeln coloré de 0x40446c Unregistered
40421f: ; branche « ok » : Writeln coloré de EAX
404229: mov  eax, 0x40446c   ; <-- encore Unregistered (blague)
40422e: call 0x403e78        ; affichage console coloré
```

Les deux branches affichent donc `[!] Unregistered ! ...` tant qu’on ne change pas le pointeur. Le littéral `[*] Registered ...` est déjà présent @ `0x404290` (et même assigné tôt à un buffer BSS) : il suffit de rediriger le `mov eax` de la branche prise.

Le readme interdit de patcher le **contenu** de la chaîne Unregistered ; on patch uniquement l’immédiat 32 bits (5 octets `B8 6C 44 40 00` → `B8 90 42 40 00` à l’offset fichier `0x3629`).

## Preuve

Sous `xvfb-run` + Wine avec un PTY : l’original montre `[!] Unregistered ! ...` ; le binaire patché montre `[*] Registered ...`, puis `[!] Press Enter to terminate ...`.
