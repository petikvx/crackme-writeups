# hypercrackme by thehyper (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c27f)
- Auteur : thehyper (archive crackmes.de, 2002) · plateforme : Windows PE32 GUI, **Win32 ASM (MASM)**, packé **UPX modifié** · difficulté 1.0
- Objectif (readme.nfo) : *« Find the only serial. No patching allowed. »* — « No cryptography », « Try to follow the code ».

| Fichier | Rôle |
|---|---|
| `original/hypercrack_me.zip` | archive site (mdp `crackmes.one`) → `HyperCrackme.exe` + `readme.nfo` |
| `original/HyperCrackme.exe` | binaire (6 144 o, UPX 0.8x modifié) |
| `analysis/unupx.py` | émulation Unicorn du stub UPX jusqu'à l'OEP `0x401000`, dump de `UPX0` + IAT reconstituée |
| `analysis/upx0.bin`, `analysis/iat.json`, `analysis/disasm.txt` | code dépacké, imports résolus, désassemblage annoté |
| `tools/hypercrackme-solve.py` | calcul du serial + vérification en exécutant le vrai `WndProc` émulé |

## Réponse

```text
Serial : 1348781387
```

C'est le produit des six nombres premiers compris entre 20 et 44 (23 × 29 × 31 × 37 × 41 × 43), et la somme de ses chiffres vaut 50 (0x32).

```bash
python3 tools/hypercrackme-solve.py
# produit des premiers 23..43 = 1348781387 ; serials 31 bits (somme chiffres 50) : [1348781387]
# serial='1348781387' -> menu wID=50 messages=["Good job, send serial to 'the_hyper_world@yahoo.com!"]
# VALIDE
```

Mode d'emploi dans le programme : taper le serial, cliquer **Check** ; un menu **Register** apparaît dans la barre de menus ; cliquer dessus affiche « Good job… » et le titre passe à « Registered ».

## Dépacking

`upx -d` refuse le fichier (« CantUnpackException: file is modified/hacked/protected ») : en-têtes UPX altérés, sections `UPX0`/`UPX1`/`.rsrc`, EP `0x406600`. Plutôt que de réparer les en-têtes, `analysis/unupx.py` émule le stub avec Unicorn : `LoadLibraryA`/`GetProcAddress` sont remplacés par des adresses fictives nommées, et l'émulation s'arrête au premier saut dans `UPX0`, soit l'OEP `0x401000`. On récupère ainsi le code en clair et la table d'imports (`GetWindowTextA` en `0x40201c`, `InsertMenuItemA` en `0x402020`, `MessageBoxA` en `0x402054`, etc.).

## Analyse du WndProc (`0x401126`)

Le bouton **Check** (ID 1, `BN_CLICKED`) envoie `WM_COMMAND 0x7d00`, traité ainsi :

```asm
40121e  mov  [0x40317d], 0               ; compteur = 0
401235  call GetWindowTextA(hEdit, buf, 0x1e)
40123c  jne  ...                          ; vide -> « Fill in one or more characters… »
40125c  call atodw(buf)                   ; 0x4014fc : chaîne décimale -> N
401263  je   fin                          ; N == 0 -> rien
40126f  call digitsum(N)                  ; 0x401411 : [0x403185] = somme des chiffres
401276  mov  ebx, 0x14                    ; pour ebx = 20 .. 44
401283  idiv ebx / or edx,edx             ;   si N % ebx == 0
40128a  call isprime(ebx)                 ;   et ebx premier (0x40144b, divisions d'essai)
401293  inc  [0x40317d]                   ;   -> compteur++
4012a8  cmp  [0x40317d], 6 ; jne fin      ; il faut exactement 6 diviseurs premiers
4012b1  mov  ecx, [0x403185]
4012c1  mov  [0x403199], ecx              ; MENUITEMINFO.wID = somme des chiffres
4012d1  mov  eax, "Register"              ; dwTypeData
4012ea  call InsertMenuItemA ; DrawMenuBar
```

Puis, sur `WM_COMMAND` avec un autre ID :

```asm
4013ac  cmp  ax, 0x32         ; ID == 50 ?
4013b9  SendMessageA(hWnd, WM_COMMAND, 0x7d05, 0)   ; -> MessageBox « Good job… » + titre « Registered »
4013cb  sinon DestroyWindow(hWnd)                   ; mauvais ID : la fenêtre se ferme
```

Deux conditions donc :

1. **Divisibilité** : les nombres premiers de [20, 44] sont exactement 23, 29, 31, 37, 41 et 43. Il en faut 6, donc N doit être divisible par les six, c'est-à-dire multiple de P = 1 348 781 387.
2. **ID du menu** : la somme des chiffres de N sert d'identifiant à l'élément de menu « Register ». Seul l'ID 0x32 = 50 mène au message de réussite ; tout autre ID ferme la fenêtre (le piège du crackme : sans la bonne somme, cliquer sur « Register » détruit la fenêtre).

Les calculs (`idiv` après `cdq`) sont signés sur 32 bits. Le seul multiple positif de P qui tient sur 31 bits est P lui-même (2P = 2 697 562 774 > 2³¹ − 1), et la somme de ses chiffres vaut 1+3+4+8+7+8+1+3+8+7 = **50**. Les deux conditions sont réunies : c'est bien « the only serial ». Une valeur qui dépasse 2³¹ devient négative pour `idiv`, et la somme des restes négatifs ne peut pas faire +50.

## Vérification

`tools/hypercrackme-solve.py` dépacke le binaire en mémoire (même émulation du stub UPX), puis appelle le vrai `WndProc` à `0x401126` avec `WM_COMMAND 0x7d00`, où `GetWindowTextA` renvoie le serial testé. Il récupère le `wID` passé à `InsertMenuItemA`, renvoie `WM_COMMAND wID` comme le ferait un clic sur le menu, puis rejoue les `SendMessageA` en attente :

| Serial | wID du menu | Résultat |
|---|---|---|
| `1348781387` | 50 | MessageBox « Good job, send serial to 'the_hyper_world@yahoo.com! » → **VALIDE** |
| `1348781388` | — (pas de menu) | rien → INVALIDE |
| `2697562774` (2P) | — | dépassement signé → INVALIDE |
