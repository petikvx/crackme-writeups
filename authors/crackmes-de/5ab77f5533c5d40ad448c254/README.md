# crackmes.de — fjlj_crackme1 by fjlj

- Page : [crackmes.one/crackme/5ab77f5533c5d40ad448c254](https://crackmes.one/crackme/5ab77f5533c5d40ad448c254)
- Binaire : `original/crackme#1_FJLJ.exe` (PE32 console, MinGW, 16 475 octets), dans `original/Crackme#1_FJLJ_attempt2.zip`
- Difficulté site : 2.0 — plateforme annoncée « DOS », en réalité un PE Windows console
- Règle de l’auteur (`readmeh!.txt`) : **keygen uniquement**

## Solution

| Nom     | Serial                       |
|---------|------------------------------|
| `petik` | <code>dq`mk-DQ@MG-XETaW</code> |

```bash
python3 tools/fjlj-crackme1-solve.py petik           # dq`mk-DQ@MG-XETaW
python3 tools/fjlj-crackme1-solve.py petik --check   # Correct good job!
```

## Premier regard

`strings` ne montre presque rien : les messages sont écrits à la volée en `mov dword`
(« name? », « key? », « name to short », « name to long », « invalid name! », « Wrong »,
« Correct good job! »). L’IAT n’importe ni `printf` ni `scanf`.

Le binaire **ne tourne pas sous Wine** (aucune sortie) : il appelle des adresses
**codées en dur de Windows XP SP2** :

| Adresse      | Rôle sous XP SP2                                         |
|--------------|----------------------------------------------------------|
| `[0x77C110E8]` | entrée d’IAT de msvcrt → `GetModuleHandleA("msvcrt")` |
| `[0x77C110D0]` | entrée d’IAT de msvcrt → `GetProcAddress(h, "printf"/"scanf")` |
| `0x77C4186A` | `printf` de msvcrt                                       |
| `0x7C81CAA2` | `kernel32!ExitProcess`                                   |

## Les « tricks »

1. **Déchiffrement de .text** (`0x4012C2`) : `xor [eax], edx` de `0x401000` à `0x4011E2`
   avec `edx` qui évolue par `sbb edx, 0x3E`. Le code de démarrage CRT déjà exécuté sert de
   zone de données (noms `msvcrt`, `printf`, `scanf`, buffers du nom `0x4010B0` et du serial saisi `0x401052`).
2. Patchs d’octets (`add/sbb byte [ecx], imm`) pour finir d’écrire `"msvcrt"` (`0x40100E`)
   et `"scanf"` (`0x4011A1`).
3. La vérification du serial vit **après la fin virtuelle de `.text`** (`0x401CAD`, zone de
   remplissage du fichier), d’où l’absence de ce code dans un `objdump -d` normal
   (dump : `analysis/check-slack-0x401cad.txt`). Elle réécrit en plus un bout de code
   en `0x40102A` (appel de `scanf("%s", 0x401052)`) puis y saute.

## Algorithme (`0x401475` → `0x401550` → `0x40169A`)

1. Longueur du nom : `< 4` → « name to short », `> 15` → « name to long ».
2. Trois passes **en place** sur le buffer du nom, terminateur `\0` compris :

   ```text
   b = ((b ^ k) - s + 0x30) & 0xFF        (CF = 0 après xor, donc sbb = sub)
   passe 1 : k=0xDE s=0x7A   → le \0 devient 0x94
   passe 2 : k=0xA2 s=0xB2   → 0x94 devient 0xB4
   passe 3 : k=0xF2 s=0x8E   → 0xB4 devient 0xE8
   ```

   Chaque passe est copiée à la suite en `0x4015C3` (avec son terminateur transformé).
3. Post-traitement (`0x4015B3`) : `0x94` et `0xB4` → `'-'`, `0xE8` → `\0`, arrêt sur `0x90`.
4. `0x40169A` : chaque caractère du serial doit être dans `0x22..0x7D`, sinon « invalid name! »
   (certains noms, par ex. `Hello123`, sont donc refusés).
5. `0x401D32` : `strcmp` maison entre le serial calculé (`0x4015C3`) et la saisie (`0x401052`).

## Vérification

Comme le binaire exige XP SP2, `tools/emu.py` le rejoue sous **Unicorn** : sections chargées
depuis le fichier (y compris la zone de remplissage), pages factices à `0x77C10000`, `0x77C41000`
et `0x7C81C000`, et stubs `GetModuleHandleA` / `GetProcAddress` / `printf` / `scanf` /
`ExitProcess`. Le code auto-modifiant tourne tel quel.

```text
$ python3 tools/emu.py petik 'dq`mk-DQ@MG-XETaW'
name?
key?
Correct good job!
```

Testé aussi : `abcd` → `ursp-UNOP-I^_D`, `crackmes` → `sbuskiqc-O>UOGIQ?-_nI_W]Eo` (Correct good job!).
Un serial faux affiche « Wrong ».
