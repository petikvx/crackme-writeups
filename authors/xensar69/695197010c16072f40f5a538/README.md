# xEnsar69's Determinism

| | |
|---|---|
| **ID** | [`695197010c16072f40f5a538`](https://crackmes.one/crackme/695197010c16072f40f5a538) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | xEnsar69 (`xensar69`) |
| **Plateforme** | Windows PE64 console (MinGW, `gate.exe`) |
| **SHA-256** | `f6a4d7420a65189520b65a8b65262271f7c20bde54e8bf43eebab99b5b7dc6c6` |

| Fichier | Rôle |
|---|---|
| `original/gate.exe` | binaire d'origine (non modifié) |
| `tools/gate-solve.py` | keygen + `--check` (Wine/xvfb, cas OK et KO) |

## Réponse

| Nom | Mot de passe |
|---|---|
| **`petik1`** | **`petik1petik1petik1`** |

`petik` (5 car.) est **refusé** (« Your name is too short ») : le nom doit faire ≥ 6 caractères, `petik1` est donc le plus proche.

```bash
python3 -I tools/gate-solve.py            # name=petik1 / password=petik1petik1petik1
python3 -I tools/gate-solve.py -q | xvfb-run -a wine original/gate.exe
python3 -I tools/gate-solve.py --check    # OK + KO sous wine
```

Règle : `len(nom) ≥ 6` et `len(mdp) ≥ 3 × len(nom)` (mdp ≤ 94 car.). **Le contenu du mot de passe n'est pas testé.**

## Premier regard

- `file` : PE32+ console x86-64, 11 sections dont une `.wow` (0x2c0 octets, aspect aléatoire) ; `strings` ne montre aucun message du jeu → messages chiffrés.
- Lancé sous Wine : « Guardian: Welcome to an "All-Known" gate! What is your name? », puis « What is your password? », puis soit « You're one of us, welcome! », soit « I'm afraid that's wrong answer bud, keep walking. ».

## Flow

`main` utile @ `0x1400018c0` (objdump -d -M intel, appelé via `0x140001c90`/CRT) :

1. `0x140001710(0x31)` : initialise le PRNG déterministe (graine `0x31 ^ [0x140004010]`).
2. `0x140001775(a, b)` : affiche les octets `.wow[a..b)` (VA `0x140005000`) XORés avec un octet du PRNG par caractère. Le « déterminisme » : le flux PRNG avance au même rythme que l'offset dans `.wow`, donc chaque message n'est lisible que si le flux est synchrone.
3. `fgets(nom, 0x20)` ; `len = strlen` ; recherche de `\n` (`0x1400034e0` = strchr) remplacé par 0 ; `len-1 ≤ 5` → message « too short » (`.wow[0xd2..0x114)`), sortie.
4. `fgets(mdp, 0x60)` ; même traitement (longueur ≥ 6 après retrait du `\n`).
5. `0x1400017c3(nom, len)` : XOR du nom avec le PRNG sur `2*len + (rand&0x1f)` tours, retourne `n = ce nombre + 1` ; sert à consommer le flux de façon dépendante de la longueur.
6. `0x14000183e(nom, len, mdp, lenmdp)` : le vrai test.
7. Re-synchronisation du flux : `skip(0xd9 - n)` (`0x14000174e`), puis message succès/échec.

## Comment on trouve

- **Ancrage** : `objdump -d -M intel original/gate.exe`, point d'entrée `0x140001046` → CRT MinGW → `0x140001c90` → `0x1400018c0`. Aucun message en clair → regarder `.wow` et les appels à `0x140001775`.
- **Le prédicat** (`0x14000183e`), en asm :

```asm
mov edx,[rbp+0x18]      ; len(nom)
lea eax,[rdx+rdx*2]     ; add eax,eax / add eax,edx  => 3*len
cmp [rbp+0x28],eax      ; len(mdp) vs 3*len
jge boucle
xor eax,eax / jmp ret   ; trop court -> 0
boucle: ... idiv len ; sar edx,cl ; and eax,0x3f ; mov [rbp-0xd],al   ; calcul jeté
mov eax,1               ; -> 1
```

  La boucle (index `i%len`, `i/len`, `(nom[i%len] >> (i/len)) & 0x3f`) calcule des valeurs qui ne sont jamais comparées au mot de passe ni stockées ailleurs que dans une variable locale morte : un leurre. Le retour est donc 1 ssi `len(mdp) ≥ 3*len(nom)`.
- **Piège** : `fgets` garde le `\n` ; le code fait `len-1` après l'avoir remplacé, d'où `petik` (5) refusé. `strings` ne voit rien d'utile car les textes sont XORés avec le PRNG.
- **Assemblage** : `petik1` (6) → mdp ≥ 18 → `petik1` × 3 = `petik1petik1petik1`.

Aucune session GDB / x64dbg / IDA n'a servi (reverse statique `objdump` + preuve Wine) ; les rôles de `0x140003410/18/58` (PRNG next/seed/putchar) sont déduits de leur usage, le texte déchiffré n'a pas été reconstruit.

## Vérification

```text
$ printf 'petik1\npetik1petik1petik1\n' | xvfb-run -a wine original/gate.exe
Guardian: What is your password? I promise i wont tell anyone.
You: Guardian: You're one of us, welcome!        (OK, 18 car.)
$ ... mdp de 17 car.   -> I'm afraid that's wrong answer bud, keep walking.   (KO)
$ ... nom 'petik'      -> Your name is too short, are you lying to me? Get out...   (KO)
$ ... mdp de 48 car. (3×len + extra) -> welcome (OK : seuil ≥, contenu libre)
```

`tools/gate-solve.py --check` : `OK : True | KO (password-1) : True`.

## Notes

- Ce n'est **pas** un vrai check de contenu : n'importe quel mot de passe d'au moins `3×len(nom)` caractères passe.
- Limite haute : `fgets(…, 0x60)` → ≤ 94 caractères utiles ; `n = 2·len + r + 1` doit rester ≤ `0xd9` pour que le flux reste synchrone (noms courts).
