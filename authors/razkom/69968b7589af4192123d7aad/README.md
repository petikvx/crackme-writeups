# RAZKOM's razkom_v1.1

| | |
|---|---|
| **ID** | [`69968b7589af4192123d7aad`](https://crackmes.one/crackme/69968b7589af4192123d7aad) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | RAZKOM (`razkom`) |
| **Plateforme** | Windows PE64 console (MSVC), x86-64 |
| **SHA-256 (zip)** | `c7a194427aa50e218dfbb050573d3fc704fb3256315195d54c49635cb58233ec` |
| **SHA-256 (exe)** | `cf70c86e38434036901050ee56c069e5e4d487aa7daaea087d69e4c606dc71f0` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/razkom_v1.zip` | archive d'origine (mot de passe `crackmes.one`) : `razkom_v1.1.exe`, `README.txt`, `HINT.txt` |
| `tools/razkom-solve.py` | keygen / solveur (`-q`, `--check <exe>`) |

## Réponse

**Clé : `RAR-AAA-ZAZ-KAK-OAO-MAM`** → message déchiffré, `Secret word: 'BAZOOKA'`.

```bash
python3 tools/razkom-solve.py            # clé + message
python3 tools/razkom-solve.py -q --check razkom_v1.1.exe   # relit la table depuis l'exe
```

Pas de nom d'utilisateur : la clé est unique (l'exemple `petik` ne s'applique pas).

## Premier regard

- `HINT.txt` : format `XXX-XXX-XXX-XXX-XXX-XXX`, lettres majuscules, tirets inclus. `README.txt` : « patcher ne révèle pas le message » → le message est déchiffré **avec la clé**.
- `strings` : `Enter key:`, `[+] Key accepted! Decrypting...`, `[-] Invalid key.`, pas de message en clair (blob chiffré en `.rdata`).

## Flow (`main` @ `0x140001260`)

1. `scanf`-like (`0x140001080`) lit la saisie dans `[rsp+0x20]`.
2. `strlen == 0x17` (23) et `'-'` aux offsets 3, 7, 11, 15, 19 (`cmp BYTE PTR [rsp+0x23|27|2b|2f|33], 0x2d`).
3. `call 0x1400010e0` (validateur) ; sinon « Invalid key » et boucle.
4. OK : boucle `i = 0..0x7e` : `putchar(table[i] ^ key[i % 23])`, table @ `0x140003330` (offset fichier `0x1930`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel razkom_v1.1.exe`, recherche des `cmp ...,0x2d` → `main` ; le `call 0x1400010e0` est le validateur.

Le validateur traite 6 groupes aux offsets 0, 4, 8, 12, 16, 20, avec la même forme :

```asm
movsx eax,[rbx+0]      ; c1
movsx r8d,[rbx+1]      ; c2
movsx ecx,[rbx+2]      ; c3
add   r8d,eax          ; c1+c2
mov   eax,0x4ec4ec4f   ; magic de la division par 26
imul  r8d ; sar edx,3 ; ... imul eax,edx,0x1a ; sub r8d,eax   ; (c1+c2) % 26
add   r8d,0x41         ; + 'A'
cmp   r8d,ecx          ; == c3
cmp   cl,0x52          ; et c3 == 'R'
```

Les `c3` imposés valent `R A Z K O M` (0x52, 0x41, 0x5a, 0x4b, 0x4f, 0x4d) → « RAZKOM ». Contrainte : `(c1+c2) % 26 + 'A' == c3`. Comme `130 = 5·26`, cela équivaut à `(c1'+c2') % 26 == c3'` (lettres 0..25). Donc le 1er caractère de chaque groupe est libre pour le validateur (26 clés par groupe, 26⁶ au total) : **le validateur seul ne désigne pas une clé unique**.

**Départager** : le message est `table[i] ^ key[i%23]` (les tirets font partie de la clé, donc `key[3]='-'` etc.). Seule la bonne clé donne du texte lisible. Les positions libres (0,1,4,5,8,9,12,13,16,17,20,21) se retrouvent par **plaintext connu** : un message de félicitations commence par `Congratulations!` ; on en déduit `key[i] = table[i] ^ plain[i]`. Premier essai avec un score « lettres/espaces » → clé presque bonne (`RAR-AAA-ZAZ-KAK-SWO-MAM`) mais le groupe 5 donnait `\x16` à l'index 16 : `table[16]=0x45`, `0x45 ^ 'O' = 0x0a` → c'est un `\n` (`Congratulations!\nYou solved…`), donc `key[16]='O'`, et `key[17]` doit vérifier `(O+A)%26 → 'O'` ✓ (`OAO`).

Assemblage : `RAR` `AAA` `ZAZ` `KAK` `OAO` `MAM` (vérifie : R(17)+A(0)=17→'R' ; A+A→'A' ; Z(25)+A→'Z' ; K+A→'K' ; O+A→'O' ; M+A→'M').

Piège : un score de lisibilité par position seul est trompeur (plusieurs lettres « imprimables ») ; le plaintext connu (`Congratulations!\n`) lève l'ambiguïté.

## Vérification

Preuve live, binaire d'origine (dézippé hors dépôt), Wine :

```bash
printf 'RAR-AAA-ZAZ-KAK-OAO-MAM\n\n' | xvfb-run -a wine razkom_v1.1.exe
#  [+] Key accepted! Decrypting...
#  Congratulations!
#  You solved my first crackme.
#  Please let me know what you thought of it in the comments.
#  Secret word: 'BAZOOKA'
```

Cas KO : `AAA-AAA-AAA-AAA-AAA-AAA` → `[-] Invalid key.`

## Notes

- Aucun GDB / debugger utilisé : analyse statique (`objdump`) + preuve Wine.
- Une clé qui passe le validateur mais ≠ celle-ci (ex. autre 1er caractère) afficherait un message corrompu, pas le « secret word ».
