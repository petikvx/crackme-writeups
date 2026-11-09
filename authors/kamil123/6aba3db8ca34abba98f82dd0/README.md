# kamil123's Needle in a Haystack

| | |
|---|---|
| **ID** | [`6aba3db8ca34abba98f82dd0`](https://crackmes.one/crackme/6aba3db8ca34abba98f82dd0) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | kamil123 |
| **Plateforme** | Windows PE32+ x86-64, console (mingw-w64, strippé) |
| **SHA-256** | `f77967154004b56b21c3ddd5bba59d570d81d7a8049c18774824daf99d556435` |

| Fichier | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine (non modifié) |
| `tools/needle-solve.py` | solveur : réimplémente les hashes, retrouve la chaîne gagnante, `--check` lance Wine |

## Réponse

**Mot de passe : `kafkaesque_99`**

```bash
python3 -I tools/needle-solve.py --check     # -q pour n'afficher que le mot de passe
```

Pas de user/login dans ce crackme (donc pas de `petik`).

## Premier regard

- `file` : PE32+ console x86-64 ; `diec` ne trouve rien de particulier (mingw, pas de packer).
- Bannière : « One of the strings inside this program is the real password. Everything is visible. »
- `strings` révèle 41 candidats consécutifs dans `.rdata` (`V1oletH4rvest`, `strawberry_fields`, `P@ssw0rd!123`, `CrackMe_Password!`, …). Ce sont des **leurres** : `CrackMe_Password!`, le plus tentant, est refusé par le binaire (`[-] Wrong password`). Il faut donc lire la vérification.

## Flow

La fonction principale est à `0x140008b80` (repérée via les `lea` vers la bannière `0x14000a000` et « Enter password » `0x14000a0c6`) :

1. Calcule une valeur cible `ebx` **au démarrage** à partir d'une table de 41 pointeurs de chaînes (`0x14000a3e8`, 0x148 octets) et de 4 dwords en `.rdata` (`0x14000a150..15c`).
2. Boucle : lit l'entrée, retire le `\n` (`strcspn`), calcule un hash 32 bits de l'entrée, le compare à `ebx` (`cmp ebx,edx` en `0x140008db9`).
3. Succès → « Correct! Access granted. You found the needle! » ; sinon on redemande.

## Comment on trouve

Ancrage : `objdump -d -M intel original/crackme.exe` puis lecture de `0x140008b80-0x140008e4d`.

**Cible** (une seule fois, avant la boucle) :

```asm
mov  edx,[0x14000a154]; xor edx,0x47f28a6c; add edx,0x56
imul edx,edx,0x80be9c3f ; mov eax,edx; shr eax,13; xor eax,edx   ; h = mix(...)
lea  rdx,[0x14000a3e8]; lea r8,[rdx+0x148]
loop: mov rcx,[rdx]; movzx ecx,byte [rcx]   ; 1er octet de chaque chaîne
      add eax,ecx; imul eax,eax,0x80be9c3f; ecx=eax>>13; eax^=ecx
lea  ebx,[rax+0x13e04bcc]; imul ebx,[0x14000a158]; xor ebx,[0x14000a150]
rol  ebx,13                          ; <- 0x140008c04, piège : facile à rater
```

→ `ebx = 0x3a516f05` (indépendant de l'entrée, déterminé statiquement).

**Hash de l'entrée** (`0x140008cb4`–`0x140008db7`), deux passes sur la chaîne :

- Passe 1 : `r9=[d15c]`, `r8=0x1505`, `ecx=0xdacc37a6` ; par octet `c` : `edx=(c^r9)*K ; r9=edx+0x22c78598 ; edx=r9+ecx ; ecx=(ecx>>7)^edx ; r8=rol((r8^ecx)-0x3ecf7383, 9)` (`K=0x80be9c3f`). Fin : `r9=((r9^r8^ecx)*[d158])`, `r9^=r9>>16`.
- Passe 2 : `eax=c0, ecx=0x982700e7, edx=0xba6c4821` ; par octet : `r10=eax+edx ; eax=(eax^ecx)*0x2080d069 ; edx=(edx>>5)^r10 ; ecx=rol(eax+0x70189490, 11) ; eax=octet suivant`. Fin : `edx=((edx^ecx)*0xb259efb3)`, résultat `edx ^ r9 ^ (edx>>13)`.
- Entrée vide : chemin séparé (`0x140008de0`), jamais égal à la cible ici (et l'EOF stdin donne « No input received »).

Ces hashes ne sont pas inversibles à la main, mais la bannière dit que le mot de passe est **dans le binaire** : on hashe donc chacune des 41 chaînes de la table avec la réimplémentation Python et on garde celle qui vaut `0x3a516f05` → `kafkaesque_99` (un seul match).

Pièges :
- Mon premier jet ne trouvait aucun candidat : j'avais oublié le `rol ebx,13` après le premier `call` d'affichage. Corrigé → match immédiat.
- Les `data16 cs nop` sont du padding d'alignement des boucles, pas de la logique.
- La table de pointeurs n'est pas dans l'ordre de `strings` (elle commence à `strawberry_fields`).

## Debug GDB / x64dbg

Aucune session de debug : reverse 100 % statique (objdump) + preuve Wine ; le MCP debugger n'a pas été utilisé.

## Vérification

```text
$ python3 -I tools/needle-solve.py --check
[+] mot de passe : kafkaesque_99
Enter password:
[+] Correct! Access granted. You found the needle!
```

Cas KO (Wine, `xvfb-run -a wine original/crackme.exe`) : `CrackMe_Password!` → `[-] Wrong password. Try again!` ; stdin vide → `[-] No input received. Bye!`.

## Notes

- Ce n'est pas la chaîne « évidente » : 40 leurres, un seul hash correct.
- Aucun patch de `original/`.
