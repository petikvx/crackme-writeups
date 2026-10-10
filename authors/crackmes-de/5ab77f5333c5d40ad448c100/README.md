# CrackMe#1 — br0ken (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5333c5d40ad448c100
- Plateforme : Windows PE32 **console** (Dev-C++ / MinGW GCC) · difficulté 1.0 · publié le 2018-03-25 (réimport crackmes.de, daté 2007 dans le ReadMe)
- Archive : `original/…` → binaire `CrackMe#1.exe`
- Usage (sous wine) : `wine "CrackMe#1.exe"` puis saisir le mot de passe, un nom (2..10 car.) et le serial

## Réponse

- **Stage 1 — mot de passe : `PaSSw0rD`**
- **Stage 2 — keygen** : `serial = Σ ord(c) − len(Name) − 1`
  - exemple : Name `petik` → **serial `535`**

## Comment on trouve

Désassemblage de `_main` (`analysis/objdump-main.txt`), binaire non chiffré.

### Stage 1

1. Le programme reconstruit une chaîne de 8 octets depuis `.rdata 0x403000` dans une variable locale : c'est la **cible**. Octets : `51 62 54 54 78 31 73 45` = `"QbTTx1sE"`.
2. `scanf("%s")` lit la saisie ; `strlen == 8` est exigé.
3. Boucle `i = 0..7` : `saisie[i] = saisie[i] + 1` (`movzx eax,[input+i] ; inc al ; mov [input+i],al`).
4. `strcmp(cible, saisie_incrémentée)` doit être nul.
5. Donc `saisie[i] = cible[i] − 1`. `"QbTTx1sE"` − 1 (par octet) = **`PaSSw0rD`**.

### Stage 2 (keygen)

1. `scanf("%s")` lit `Name` (annoncé 2..10 car.), `scanf("%d")` lit le `Serial` (entier).
2. Boucle `i = 0..strlen(Name)` (le test est `i > strlen` → **inclut l'octet nul final**) :
   `acc += Name[i] − 1` (`movsx` de l'octet, `add`, `dec`).
3. L'octet nul final ajoute `0 − 1 = −1`, d'où :
   `acc = Σ ord(Name[i]) − len(Name) − 1`.
4. `acc == Serial` (comparé en entier) → Stage 2 validé.

Le Stage 3 est juste un « console nag » à retirer (patch), hors keygen.

## Vérification

```bash
python3 tools/crackme1-solve.py petik        # -> password PaSSw0rD, serial 535
printf 'PaSSw0rD\npetik\n535\n' | xvfb-run -a wine "analysis/CrackMe#1.exe"
# -> Stage 1 completed! / Stage 2 Completed! / Stage 3 ...
```

Testé en live sous wine : les trois étapes passent.

## Fichiers

- `analysis/CrackMe#1.exe` : binaire
- `analysis/objdump-main.txt` : désassemblage de `_main`
- `tools/crackme1-solve.py` : mot de passe + keygen (`-q` = serial brut)
