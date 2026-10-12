# rif_crackme_1 by korbut (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c1ad
- Auteur original : Dr. rED mEAT (groupe RIF), réimport crackmes.de (korbut), publié le 2018-03-25
- Plateforme : Windows PE32 GUI, MASM 6.14 — difficulté 1.0

## Réponse

Serial : **`2F13`** (comparé avec `lstrcmpiA`, donc `2f13` marche aussi). Pas de nom : le serial est fixe.

## Comment on trouve

1. `strings` : `wsprintfA`, `GetDlgItemTextA`, `lstrcmpiA`, le format `%lX` et les messages « Bravo ! C'etait pas trop dur ? » / « Think like your computer ! ». La consigne demande un « dead listing » (pas de debug).
2. `objdump -d` : la DlgProc (`0x401016`) appelle `0x401080` sur le bouton `0x6FD`. Cette routine lit le champ `0xC9` (50 car. max) dans `0x40300A`, puis :

```asm
mov ecx,6 ; xor eax,eax ; mov ebx,0x6fd
boucle: add eax,ebx ; dec ecx ; jnz boucle   ; eax = 6*0x6FD = 0x29EE
xor eax,ebx                                   ; 0x29EE ^ 0x6FD = 0x2F13
wsprintfA(0x403000, "%lX", eax)              ; "2F13"
lstrcmpiA(0x403000, saisie) == 0 -> Bravo
```

3. Donc le serial attendu est la chaîne hexadécimale `2F13` (voir `analysis/check.asm.txt`, solveur `tools/rif_crackme_1-solve.py`).

## Vérification

Le binaire est une GUI non pilotée ici : la routine de calcul (`0x40109D`–`0x4010B1`) a été **émulée avec Unicorn** sur les vrais octets de `.text`, `EAX = 0x2F13`, formaté `%lX` → `2F13`.

## Note

Le fichier contient après le code utile des octets et la chaîne `CIH v1.2 TTIT` (reste du virus CIH dans le padding) ; le point d'entrée est `0x401000`, ce code n'est pas atteint, mais prudence avant de lancer le binaire hors bac à sable.
