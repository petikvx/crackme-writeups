# crackmes.de's pemem by deroko

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c403`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c403) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | deroko / ARTeam (site : crackmes.de) |
| **Plateforme** | Windows PE32 GUI (x86), packé aPLib + PE embarqué chiffré |
| **SHA-256 (zip)** | `abe329b2d18068bc6fa316b73e859915868824a96e7416a3f9bb038b2833ec75` |

Règle de l'auteur (`readme.1st.txt`) : *ne pas patcher le « good jmp »*, keygen / self-keygen / loader autorisés.

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/crackme.zip` | archive d'origine (`crackme.exe` + `readme.1st.txt`) |
| `tools/pemem-solve.py` | keygen (dépack aPLib + déchiffrement du PE interne en pur Python) ; `--check` = preuve Wine |
| `analysis/unpacked.bin` | loader dépacké (VA 0x401000) |
| `analysis/inner.exe` | PE interne déchiffré (le vrai crackme) |

## Réponse

Keygen `name → serial` (name de **plus de 4 caractères**) :

| Name | Serial |
|---|---|
| `petik` | **`72734927-77E42AE5-66ED9530`** |

```bash
python3 -I tools/pemem-solve.py --name petik        # name=petik serial=72734927-77E42AE5-66ED9530
python3 -I tools/pemem-solve.py -q                  # serial seul
python3 -I tools/pemem-solve.py --check             # preuve sous xvfb-run wine + xdotool
```

## Premier regard

```text
$ file crackme.exe     → PE32 executable (GUI), Intel i386, 2 sections (.dpe vide, dpe 0x4678)
$ objdump -x           → EP 0x40d4c5 (fin de section), imports : LoadLibraryA / GetProcAddress seulement
```

Peu d'imports + EP en queue de section + `strings` illisibles : packer. Le stub en `0x40d4c5` est un
classique : `call/pop ebp` (delta), résolution des imports à la main, puis routine de décompression en `0x40d56e`
(bit-tag `dl=0x80`, `gamma` : c'est **aPLib**). Paramètres lus dans le bloc de données du stub
(`ebp+0x4016f8` = source `0x409000`, `ebp+0x4016fc` = destination `0x401000`, `ebp+0x4016f4` = OEP `0x401000`).

## Flow

1. Stub aPLib (`0x40d4c5`) : décompresse `dpe+0x0` (file offset 0x200, 0x4678 octets) en `0x401000`, résout ses imports, `jmp 0x401000`.
2. Loader `0x401000` : `VirtualAlloc`, **déchiffre** 0x1000 dwords à partir de `0x40126a` (PE complet), le mappe à la main
   (copie des sections, imports, relocations) et saute à son entry point.
3. PE interne : boîte de dialogue (name / serial, bouton OK) ; au clic, vérification (`0x401085`…).
   Succès → `MessageBox "solved" / "solved..."`.

## Comment on trouve le prédicat

### 1. Dépack aPLib

Je n'ai pas cherché d'unpacker : on émule la seule routine de dépack (`0x40d56e`) sous Unicorn en lui donnant
`src=0x409000`, `dst=0x401000` sur la pile (détail dans `tools/pemem-solve.py::aplib`, réimplémenté en Python pur
pour ne pas dépendre d'Unicorn) :

```python
mu.mem_write(0x409000, d[0x200:0x200+0x4678]);  # section dpe
mu.mem_write(0x108000, pack('<III', ret, 0x409000, 0x401000))
mu.emu_start(0x40d56e, ret)                     # → 0x401000.. = loader
```

`objdump -D -b binary -m i386 -M intel --adjust-vma=0x401000 analysis/unpacked.bin` montre alors le loader.

### 2. Déchiffrement du PE interne

```asm
401000: mov esi,0x40126a          ; blob chiffré
401024: mov ebx,0xdeadc0de        ; clé initiale
40102c: lods eax,[esi]            ; boucle 0x1000 dwords
40102d: xor  eax,ebx
40102f: stos [edi],eax
401033: add  ebx,0xdeadbeef       ; clé suivante
401039: rol  ebx,7
40103c: loop 0x40102c
```

Résultat : un `MZ` valide (`analysis/inner.exe`, sections `CODE/DATA/.idata/.reloc/.rsrc`, imports `DialogBoxParamA`,
`GetDlgItemTextA`, `MessageBoxA`…).  Piège : le loader efface (`mov [esi-4],edx`, edx = 0) le blob chiffré au fur et à mesure.

### 3. Prédicat (inner.exe, handler `WM_COMMAND` bouton OK, `0x401128`)

```asm
40114f: call GetDlgItemTextA(item 0, buf 0x404026, 100)   ; name
401154: cmp eax,4 / jbe fail                              ; name > 4 caractères
40116e: call GetDlgItemTextA(item 1, buf 0x40408a, 100)   ; serial
401186: call 0x401279(name,len)                           ; MD5 (IV 67452301..., constantes d76aa478...)
        rep movs 0x10 → 0x404006                          ; m[0..15] = digest
40119e: ecx=0x40408a ; [ecx+8]=0, [ecx+0x11]=0, [ecx+0x1a]=0   ; les '-' deviennent des \0 → 3 chaînes de 8
4011ad: a = hex(0x40408a)
4011bd: b = rol(hex(0x404093),7)
4011d0: c = ror(hex(0x40409c),9)
4011dd: clc / sbb ecx,ecx                                 ; ecx = 0
4011ea: ecx += (T(m[0]) ^ T(m[3])) ^ a
        ecx += (T(m[4]) ^ T(m[8])) ^ b
        ecx += (T(m[9]) ^ T(m[10])) ^ c        ; T(i) = dword [0x40216d + i]
```

- `0x402124` est un parseur hexa (`'A'..'F'` et `'a'..'f'` acceptés, 8 chiffres → dword).
- `T(i)` : `mov ebx,[eax+edi]` avec `eax` = un octet du digest et `edi = 0x40216d` → **lecture d'un dword à un offset
  octet quelconque** dans une table de 0x100+3 octets (dwords chevauchants), pas un tableau de dwords indexé.
- Le « good jmp » : après la somme, `eax = ecx; ecx = 0x20; clc` puis

```asm
40123c: jb  0x40126e        ; → échec si CF
40123e: shr eax,1           ; CF = bit sorti
401240: loop 0x40123c       ; 32 tours
```

  Le `jb` est évalué avant chaque `shr` : il teste donc les bits 0..30 de la somme (le bit 31 sort au dernier
  `shr` sans être testé). Condition de succès : **`sum & 0x7FFFFFFF == 0`**. On vise `sum == 0`.

### 4. Inversion (keygen)

Les trois termes sont indépendants et chacun contient une inconnue (a, b, c) qui s'XORe librement. On les annule :

```text
a = T(m0) ^ T(m3)               → serial[0:8]  = a
b = T(m4) ^ T(m8)               → serial[9:17] = ror(b,7)    (inverse de rol 7)
c = T(m9) ^ T(m10)              → serial[18:26]= rol(c,9)    (inverse de ror 9)
```

Exemple `petik` : `md5("petik")` → octets m0,m3,m4,m8,m9,m10 → `a=0x72734927`, `ror(b,7)=0x77E42AE5`, `rol(c,9)=0x66ED9530`
⇒ `72734927-77E42AE5-66ED9530`. (Il existe d'autres serials valides : seule la somme compte, donc a, b libres si c compense.)

## Vérification

`python3 -I tools/pemem-solve.py --check` extrait le `crackme.exe` d'origine (dans un répertoire temporaire, `original/`
n'est jamais modifié), le lance sous `xvfb-run -a wine`, tape `petik`, `Tab`, le serial, `Entrée` (xdotool) puis cherche
la fenêtre « solved » :

```text
OK petik 72734927-77E42AE5-66ED9530      # serial valide → fenêtre "solved" trouvée
                                         # serial 00000000-00000000-00000000 → aucune fenêtre "solved" (KO)
```

Le dump `analysis/inner.exe` est reproductible : `--check` ne dépend que du zip et de Wine ; le dépack et la clé
rolling sont recalculés dans le solveur (comparé octet à octet avec l'extraction Unicorn).

## Notes

- Aucun GDB ni debugger live utilisé : reverse statique + émulation Unicorn du dépack, preuve Wine.
- Pas de patch : conformément à la règle de l'auteur, le `jb` « good jmp » n'est pas touché ; le keygen satisfait le prédicat.
- Piège : les `'-'` du serial ne sont pas vérifiés, ils sont simplement écrasés par `\0` aux offsets 8 et 0x11 (le contenu
  des séparateurs est libre ; seul le format 8+1+8+1+8 compte, aucune longueur totale n'est contrôlée).
