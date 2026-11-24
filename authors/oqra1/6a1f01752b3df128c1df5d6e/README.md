# oqra1's selfkey

- ORIGIN : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a1f01752b3df128c1df5d6e)
- Auteur : oqra1 · Plateforme : Linux x86-64 ELF PIE, stripé, dynamique (GCC 14.2)
- SHA-256 : `a72548568e0634d3e148eec7d3fe98f9d65476e942996054323f3096955abbbc`

| Fichier | Rôle |
|---|---|
| `original/selfkey` | binaire d'origine (non modifié) |
| `tools/selfkey-solve.py` | solveur (`-q`, `--check`, `--all`) |

## Réponse

```text
./original/selfkey a_very_strong_password507
You cracked the password
Great job!!
```

```bash
python3 -I tools/selfkey-solve.py --check
```

Pas de user/login. Il existe 256 mots de passe valides (voir plus bas) ; celui-ci est le seul tout en `[A-Za-z0-9_]`. Les autres k donnent des octets de contrôle ou de la ponctuation (ex. k=0x38 → `A\x7fVERY\x7fSTRONG…` avec 0x7f), écartés.

## Premier regard

`file` : ELF64 PIE stripé. `strings` : `usage: %s <password>`, `Wrong password`, `You cracked the password`, et dans `.rodata` un blob `yGn}jaGkljwv\x7fGhyjwv\x7fGhykkowj|-(/` qui n'a rien d'un texte clair. Imports : `strlen`, `malloc`, `strcmp`, `free`, `printf`/`puts`.

## Flow

`main` (0x10b0) : exige `argc==2`, appelle `f(argv[1])` (0x1220) qui renvoie un buffer malloc de 26 octets, puis `strcmp(argv[1], buf)` ; égalité → « You cracked the password ». Le mot de passe doit donc être égal à ce que `f` calcule **à partir de lui-même** (« selfkey »).

## Comment on trouve

Ancrage : `objdump -d -M intel original/selfkey`, fonction à 0x1220 (pas de GDB ni IDA nécessaires, code court).

```asm
1225  mov edi,0x1a ; malloc(26)
1233  movdqa xmm0,[rip+..2060]  ; 16 octets du blob
1245  movups [rax],xmm0         ; buf[0..15]
1248  movdqa xmm0,[rip+..2070]  ; 16 octets suivants
1250  movups [rax+9],xmm0       ; buf[9..24]  (écrase 9..15 : chevauchement !)
123e  mov byte [rax+0x19],0     ; buf[25]=0
1254  call strlen
1280  xor dl,[rdi] ...          ; dl = XOR de tous les octets de argv[1]  (= k)
128e  xor [rbp],dl ; boucle 12a0 : xor chaque octet de buf[0..24] avec dl
```

Piège : le second `movups` à `+9` recouvre les octets 9..15 du premier ; le blob effectif de 25 octets est `rodata[0:9]` + `rodata[16:32]`, soit `yGn}jaGkl` + `jwv\x7fGhykkowj|-(/` (cf. `blob()` dans le solveur).

Prédicat : `pw[i] == blob[i] ^ k` pour i<25 (longueur 25 obligatoire, sinon `strcmp` échoue) avec `k = XOR(pw[0..24])`.
Comme 25 est impair, `XOR(pw) = XOR(blob) ^ k`, donc la condition `XOR(pw)=k` ⇔ `XOR(blob)=0`. On vérifie que `XOR(blob)=0` : la condition est alors vraie pour **tout** k∈[0,255] → 256 solutions `pw = blob ^ k`.

Choix : k=0x18 donne `a_very_strong_password507` (blob[0]=0x79 ^ 0x18 = 0x61 = `a`). Cela s'obtient en cherchant le k qui rend tout imprimable `[A-Za-z0-9_]` (`--all` les liste).

## Vérification

```bash
$ ./original/selfkey a_very_strong_password507   # OK
You cracked the password
Great job!!
$ ./original/selfkey wrong                       # KO
Wrong password
$ ./original/selfkey                             # usage
usage: ./selfkey <password>
$ ./original/selfkey 'xFo|k`Fjmkvw~Fixjjnvk},).' # k=1, aussi accepté
```

Exécuté sur une copie `chmod +x` (le fichier d'origine n'a pas le bit exec, non modifié). `--check` du solveur : OK.

## Notes

- Ce n'est pas un hash : aucun secret, juste un point fixe d'un XOR.
- Aucune dépendance au nom d'utilisateur.
