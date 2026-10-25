# CrackNotMe — Zero4

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6add1a434b6d53e8802ed06a)
- Auteur : CrackNotMe · Plateforme : Windows x86-64 (PE32+ console, MSVC C++)

| Fichier | Rôle |
|---|---|
| `original/Zero4.exe` | binaire d'origine (sha256 `1d4c18e7…8980`) |
| `tools/zero4-solve.py` | solveur (`-q`, `--check` = preuve Wine) |

## Réponse

```text
Zero3_is_not_malware_please_check_manually_instead_of_auto_CAPE_sandbox
```

```bash
python3 tools/zero4-solve.py -q          # affiche le mot de passe
python3 tools/zero4-solve.py --check     # + exécution sous xvfb-run wine
```

Pas de champ user/login : pas de `petik` ici (mot de passe unique, 71 caractères).

## Premier regard

`diec` : PE64, MSVC 14.50 (VS 2026), C++, aucun packer. `strings` ne montre que `Enter password:` et `[-] Wrong password!` ; le texte de succès est absent → il est chiffré dans `.rdata`.
Sous Wine, `test` donne `[-] Wrong password!`.

## Flow

`Enter password:` → `getline` → retrait d'un éventuel `\r` → longueur == `0x47` (71) → boucle de comparaison → si OK, déchiffrement de 0x2b5 octets avec le mot de passe comme clé, puis affichage ; sinon `Wrong password!`.

## Comment on trouve

**Ancrage** : `strings` donne la VA de `Enter password` (`0x1400219c0`) ; un balayage capstone des `lea reg,[rip+…]` trouve l'unique xref en `0x140003927`, dans la fonction qui commence en `0x1400038c0` (`objdump -d -M intel --start-address=0x1400038c0`). IDA (`decc`) n'était pas disponible dans l'environnement : lecture à `objdump`.

**Check** (`0x140003a1d`…`0x140003a5d`) :

```asm
cmp  rcx,0x47              ; longueur == 71
loop:
  movzx eax,dl             ; i
  imul  ecx,eax,7
  add   cl,0x5a            ; (i*7 + 0x5a) & 0xff
  xor   cl,[pw+rdx]        ; ^ pw[i]
  cmp   cl,[0x1400213e0+rdx]   ; == T1[i]
  jne   fail
```

Donc `pw[i] = T1[i] ^ ((i*7+0x5a) & 0xff)`, avec `T1` = 71 octets à `0x1400213e0` (offset fichier `0x1fc00 + 0x3e0`). Pas besoin de bruteforce : l'inversion est directe.

Exemple : `T1[0]=0x00` ; i=0 → `0x5a ^ pw[0] = T1[0]` ⇒ `pw[0]='Z'` (`0x5a`).

**Second étage** (`0x140003a94`…) : pour `i` de 0 à `0x2b4`, `out[i] = ((i-7)&0xff)*13 ^ pw[i mod 71] ^ T2[i]` avec `T2` à `0x140021430` (`i mod 71` est calculé par multiplication magique `0xcd85689039b0ad13`, `>>6`, `*0x47`). Le solveur le rejoue et retrouve le texte affiché, ce qui confirme au passage le mot de passe (le texte déchiffré est lisible uniquement avec la bonne clé).

**Pièges** : la longueur 71 est codée en dur ; la division par 71 est une réduction de force (pas un `div`) ; `strings` ne trouve aucun message de succès.

## Vérification

```text
$ python3 tools/zero4-solve.py --check      # xvfb-run -a wine original/Zero4.exe
[+] ACCESS GRANTED!
[CAPE-VM AUTO-MODERATION SIMULATOR]: ...
```

KO : mot de passe `test` → `[-] Wrong password!`.

## Notes

Le message final est une private joke sur le rejet de « Zero³ » par la sandbox CAPE. Aucune session GDB/x64dbg n'a été utilisée (reverse statique + preuve Wine).
