# cyclops_crackme_4.0 — cyclops (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c152
- Plateforme : Windows PE32 GUI (VC++ 6, MFC **debug** `MFC42D.DLL`), packé UPX avec sections renommées `CYC0/CYC1`
- Difficulté : 2.0 — type **keygen** (nom + e-mail → serial)

## Solution

Pour `petik` / `petik@crackmes.one` :

```
0524521618623215216116723179118871202182331161383711910413093177491854185010817282
```

Keygen : `python3 tools/crackmes-de-cyclops_crackme_4.0-solve.py petik petik@crackmes.one`

## Comment on trouve

1. **Dépacker.** `file` voit un PE mais les chaînes sont illisibles et les sections s'appellent `CYC0`, `CYC1`, avec une signature `CYC!` : c'est de l'UPX maquillé. On remet `UPX0/UPX1/UPX!` dans une copie puis `upx -d` → binaire propre (les chaînes `Insufficient data!!!`, `Dont u have a e-mail??`, `Good Cracker!!!` apparaissent).
2. **Trouver le handler.** On cherche les xrefs vers `0x4066ac` (« Insufficient data ») avec `objdump -d` : un seul handler, à `0x40177b`.
3. **Lire le handler.** Trois `GetDlgItemText` (ids `0x3e8` nom, `0x3e9` e-mail max 0x21, `0x3ea` serial). Contrôles : champs non vides, l'e-mail contient `@` et `.` (`strstr`), le serial fait au moins 32 caractères (sinon rien ne se passe).
4. **Reconnaître RC4.** Boucle 256 : `S[i]=i`, `K[i]=nom[i % len]`, puis `j=(j+S[i]+K[i]) & 0xff` + swap : c'est le KSA de RC4 avec le nom comme clé. Ensuite 32 tours de PRGA ; à chaque tour l'e-mail est d'abord étendu en place (`mail[k]=mail[k % len]`) puis `out[k] = mail[k] ^ S[(S[i]+S[j]) & 0xff]`.
5. **Formatage, avec un bug.** Le premier `sprintf("%d")` lit `out[i]` avec la variable `i` du PRGA qui vaut 32 en sortie de boucle : c'est l'octet nul posé juste après le tableau, donc le serial commence toujours par `0`. Puis `strcat` de `%d` pour `out[1..31]`. Comparaison `strcmp(serial_saisi, calculé)` → « Good Cracker!!! ».

## Vérification

Le binaire exige `MFC42D.DLL` / `MSVCRTD.dll` (runtime debug, non redistribuable, absent de wine/winetricks), donc pas de test live sous wine. À la place, `tools/crackmes-de-cyclops_crackme_4.0-emu.py` exécute **le vrai code du handler** (sections du binaire dépacké) sous Unicorn, en simulant seulement `GetDlgItemText`, `MessageBox` et les fonctions CRT (`strcmp`, `strlen`, `sprintf`…). Résultat (`analysis/emu-petik.txt`) : `Good Cracker!!!` avec le serial du keygen, et aucun message avec un serial modifié d'un chiffre. Testé aussi avec `Cyclops` / `a@b.c`.
