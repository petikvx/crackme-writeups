# crackmes.de's therapy039s_crackme_1 by therapy

| | |
|---|---|
| **ID** | [`5ab77f5633c5d40ad448c290`](https://crackmes.one/crackme/5ab77f5633c5d40ad448c290) ([ORIGIN.yml](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (therapy) |
| **Plateforme** | DOS, `.COM` 16 bits (676 octets) |
| **Difficulté site** | 2.0 |
| **SHA-256 (zip)** | `5bd3afd855efd50551dde479972f7a68c416a56ce4c1ae8898e3906d67d3ff04` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/therapy_crackme1.zip` | archive d'origine |
| `original/CRACKME.COM`, `original/README.TXT` | contenu extrait (COM non patché, consignes auteur) |
| `tools/therapy039s-crackme1-solve.py` | keygen (`-n N` aléatoires, `--check PW`) |
| `tools/emu-com.py` | mini-émulateur COM (Unicorn 16 bits, int 21h) avec trace `-t` |
| `tools/verify-dosbox.sh` | vérification live sous DOSBox headless |
| `analysis/check-0x197.asm` | routine de vérification déchiffrée, commentée |
| `analysis/dosbox-verify.txt` | sortie DOSBox (cas OK + KO) |

## Réponse

Le mot de passe est valide s'il contient **exactement** ces caractères, dans n'importe quel ordre :

| car. | `h` | `T` | `q` | `%` | `7` | `6` | `2` |
|---|---|---|---|---|---|---|---|
| nombre | 2 | 3 | 1 | 2 | 4 | 2 | 1 |

Exemple canonique : **`hhTTTq%%7777662`** (15 caractères). Les autres caractères sont ignorés,
donc `7qM27h76T%76%hTT` marche aussi. Longueur max : 19 (buffer DOS de 0x14 octets).

```bash
python3 tools/therapy039s-crackme1-solve.py          # hhTTTq%%7777662
python3 tools/therapy039s-crackme1-solve.py -n 5     # keygen : 5 mots de passe aléatoires
./tools/verify-dosbox.sh "$(python3 tools/therapy039s-crackme1-solve.py -n 1)"
```

## Premier regard

```text
$ file CRACKME.COM
CRACKME.COM: DOS executable (COM), start instruction 0xeb07eb7d 015a03a3
$ strings -n 6 CRACKME.COM     # rien d'utile : tout est chiffré
```

Le `README.TXT` demande un **keygen** (« the keygen should work on the non-patched version »).
L'objet n'a pas de nom d'utilisateur : le « keygen » génère donc des mots de passe valides.

Le code commence par une cascade de `jmp` courts qui sautent au milieu d'instructions
(`eb 07 eb 7d …`) : désassemblage linéaire inutilisable. Une boucle de déchiffrement remet
ensuite en clair le reste du programme et les messages, puis efface l'écran
(`rep stosw` sur la mémoire vidéo, `int 10h`/AH=02 pour placer le curseur).

## Flow

1. Déchiffrement du corps du programme (junk jumps).
2. Effacement écran, affichage de la bannière (`int 21h` AH=09).
3. Lecture du mot de passe : `int 21h` AH=0Ah dans le buffer `0x234` (`[0]`=max 0x14, `[1]`=longueur, `[2..]`=texte).
4. Comptage des caractères, comparaison à une table, message OK / KO.

## Comment on trouve le prédicat

Plutôt que de dépiauter le déchiffreur à la main, on **exécute** le COM dans un mini-émulateur
Unicorn 16 bits (`tools/emu-com.py`) : chargement en `CS:0100`, `DS=ES=SS=CS`, et un hook
d'interruptions qui implémente `int 21h` AH=09 (affichage), AH=0Ah (saisie, injectée depuis la
ligne de commande) et `int 20h`/AH=4Ch (sortie). Avec `-t`, chaque instruction exécutée est
désassemblée par Capstone.

```bash
python3 tools/emu-com.py petik -t > trace.txt    # ~11 700 instructions
grep -n "int 0x21" trace.txt | tail             # dernier AH=0Ah puis l'AH=09 du message
```

Entre la lecture (`021f int 0x21`) et le message d'échec (`01f1 int 0x21`), une fois les `jmp`
parasites filtrés, on trouve toute la vérification (voir `analysis/check-0x197.asm`) :

```asm
01ad xor si, si             ; si = 0..6
01b7 mov al, [si+0x343]     ; table 0x343 = "hTq%762"
01bd mov cl, [di-1]         ; cx = longueur du texte saisi, di = texte
01c1 repne scasb            ; chercher al
01c3 je  0x1c8
01c8 inc byte [si+0x34a]    ; compteur[si]++ ...
01cc jmp 0x1c1              ; ... et on reprend le scan : on compte TOUTES les occurrences
01ce inc si / cmp si, 7 / jne 0x1af
01d4 mov di, 0x34a          ; compteurs calculés
01d7 mov si, 0x351          ; compteurs attendus
01da mov cx, 7
01de repe cmpsb
01e0 jne 0x1ec              ; -> "No, no. Try again, it`s easy!"
```

Dump de la zone de données après déchiffrement (`0x343`, 14 octets) :

```text
68 54 71 25 37 36 32 | 00 00 00 00 00 00 00 | 02 03 01 02 04 02 01
 h  T  q  %  7  6  2 | compteurs (calculés) | compteurs attendus
```

## Prédicat consolidé

```text
pour chaque c dans "hTq%762" : count(password, c) == [2,3,1,2,4,2,1][i]
1 <= len(password) <= 19
```

- Seul le **nombre** d'occurrences compte : pas l'ordre (c'est un anagramme de `hhTTTq%%7777662`).
- Les caractères hors table ne sont pas regardés : on peut en ajouter tant que la longueur reste ≤ 19.
- Comparaison sensible à la casse (`t` ≠ `T`, `H` ≠ `h`).
- Les compteurs repartent de 0 à chaque lancement (le COM est rechargé), donc pas d'effet de bord.

## Vérification

Live sous **DOSBox** (headless, `xvfb-run`, saisie redirigée depuis un fichier) :

```text
$ ./tools/verify-dosbox.sh
== OK (hhTTTq%%7777662)
Enter your password: hhTTTq%%7777662

You have entered a correct password!!!

Thanks for your efforts, you have done well!
Please, send your solutions to therapynet@hotmail.com

-=therapy=-
== KO (petik)
Enter your password: petik

No, no. Try again, it`s easy!
```

Également OK sous DOSBox : un mot de passe aléatoire du keygen (`6k7T%%7T2h7qB76Th`, avec des
caractères de remplissage). KO utile : `hhTTTq%%777662` (un `7` de moins) → « No, no ».

## Notes

- Ce n'est pas une comparaison de chaîne : `hTq%762` n'est **pas** le mot de passe, c'est la
  table des caractères comptés.
- Le chiffrement + junk jumps cassent `objdump`/`ndisasm`, mais pas une exécution émulée : la
  trace d'exécution donne directement le code en clair.
