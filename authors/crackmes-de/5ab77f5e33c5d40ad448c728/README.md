# kylix_crackme — warleyalex (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5e33c5d40ad448c728 · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **Borland Kylix** (CLX/Qt, Pascal), strippé, 531 Ko ; « simple xor scheme to hide the strings »
- Archive : `original/crackme.zip` → `crackme` + `crack.txt`

## Réponse

```
warleyalex
```

(« Enter password: » → OK → boîte « Good » / « Bad »)

```bash
python3 -I tools/kylix-solve.py --check
# password : warleyalex   (Good='Good', Bad='Bad') / check: OK
```

> Limite : le binaire ne démarre pas ici (`undefined symbol: initPAnsiStrings`, bibliothèques Kylix/CLX absentes) ; la preuve est statique (désassemblage + décodage des chaînes), pas un test GUI.

## Premier regard

```text
$ ./analysis/crackme
./crackme: symbol lookup error: ./crackme: undefined symbol: initPAnsiStrings
$ strings -n 5 analysis/crackme | grep -iE "password|TPasswordDlg|pmXor"
TPasswordDlg   Enter password:   pmXor   pmNotXor
```

Le formulaire (`TPasswordDlg`, un `TLabel` « Enter password: », un `TEdit`, deux boutons) est stocké en ressource DFM ; les chaînes « Good »/« Bad » et le mot de passe n'apparaissent pas en clair.

## Comment on trouve

**Ancrage** : recherche d'octets XOR sur le fichier : `Good`/`Bad` ressortent avec la clé `0xff` à `0x59cd4` / `0x59ce4` ; juste avant, une chaîne Pascal longue (`ff ff ff ff | 0a 00 00 00 | 88 9e 8d 93 9a 86 9e 93 9a 87`) qui donne `warleyalex` (10 octets) une fois XORée.

```text
0x59cc0 (vaddr 0x80a1cc0): 88 9e 8d 93 9a 86 9e 93 9a 87   ^ 0xff =  w a r l e y a l e x
0x59cd4 (vaddr 0x80a1cd4): b8 90 90 9b                      ^ 0xff =  G o o d
0x59ce4 (vaddr 0x80a1ce4): bd 9e 9b                         ^ 0xff =  B a d
```

Gestionnaire du bouton OK @`0x80a1be8` (`analysis/handler-dis.txt`) :

```asm
80a1bfa: eax = [ebx+0x28c] (Edit1) ; call [vmt+0x58]      ; Edit1.Text -> [ebp-4]
80a1c0c: mov eax,0x80a1cc0 ; call 0x80a1b14                ; Decode(chaîne chiffrée) -> mot de passe
80a1c25: call 0x8054d9c (LStrCmp) ; jne 0x80a1c4e          ; texte saisi == mot de passe ?
80a1c2f: eax=0x80a1cd4 ("Good") ; call Decode ; ShowMessage  ; sinon 0x80a1ce4 ("Bad")
```

et `Decode` @`0x80a1b14` : pour chaque octet `c` de la chaîne : `c ^ 0xff` (mot `[ebp-0xe] = 0xff`), concaténé dans une `AnsiString`.

**Pièges :**
- Le binaire Kylix pèse 500 Ko de RTL ; chercher `strings`/`strcmp` est inutile : la comparaison passe par `_LStrCmp` de la RTL Delphi (appel `0x8054d9c`).
- Les chaînes Pascal ont un en-tête (`refcount = -1`, `longueur`) avant les données : repérer `ff ff ff ff` + longueur donne directement le texte XORé.
- Comparaison sensible à la casse.

## Fichiers

- `analysis/crackme`, `analysis/crack.txt`, `analysis/handler-dis.txt`, `analysis/verify.txt`
- `tools/kylix-solve.py` : décode les 3 chaînes (+ `--check`)
