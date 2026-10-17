# m3hd1 — half-twins

| | |
|---|---|
| **ID** | [`5dce805c33c5d419aa0131ae`](https://crackmes.one/crackme/5dce805c33c5d419aa0131ae) |
| **Auteur** | m3hd1 |
| **Plateforme** | Linux ELF64 PIE, C, non strippé |
| **SHA-256** | `52770c081aa1f92f97c5fc32640a80ad922547224794d8197cf2c77689127e5c` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/half-twins` | binaire d'origine |
| `tools/halftwins-solve.py` | couple `(abby, gabby)` valide (`-q`, `--check`) |

## Réponse

**Gabarit, deux arguments `./half-twins <abby> <gabby>`** :

| Contrainte | Détail |
|---|---|
| Longueur | `len(abby) == len(gabby)`, **> 6**, paire |
| 1ère moitié | caractères identiques position à position |
| 2ème moitié | caractères **tous différents** position à position |

Exemple (longueur 8, moitié = 4) :

```bash
./original/half-twins abcdwxyz abcdWXYZ
python3 tools/halftwins-solve.py --check
```

## Premier regard

```bash
file original/half-twins    # ELF64 PIE, not stripped
strings -n 5 original/half-twins
```

Message final : `Abby & Gabby: yaayy!! nice job! :D`. Messages d'erreur à thème (« we're half twins you know... », « we are only HALF twins... :3 ») — le titre du challenge décrit directement la logique.

## Flow

`main(argc, argv)` enchaîne six vérifications sur `argv[1]` (Abby) et `argv[2]` (Gabby), chacune imprimant un message différent en cas d'échec.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/half-twins | awk '/<main>:/,/^$/'`.

```asm
11b0: cmp rax,0x6 ; 11b4: ja 11d8      ; PIÈGE : "ja" saute l'erreur SI len>6
                                        ; -> l'erreur s'affiche quand len<=6 : il faut len > 6 !
11e4: (meme check sur gabby)
1227: cmp strlen(abby),strlen(gabby) ; je -> continue   ; memes longueurs
125a: and eax,1 ; test ; je -> continue                  ; longueur PAIRE
129f..12ec: boucle i=0..len/2-1 : si abby[i]!=gabby[i] -> erreur "half twins you know..."
                                                          ; 1ere moitie IDENTIQUE
12ff..134c: boucle i=len/2..len-1 (le compteur N'EST PAS REINITIALISE !) :
             si abby[i]==gabby[i] -> erreur "only HALF twins...:3" et return
                                                          ; 2eme moitie TOUTE DIFFERENTE
134e: succes "yaayy!! nice job! :D"
```

Le piège principal : la seconde boucle (deuxième moitié) **réutilise le même compteur** que la première boucle sans le remettre à zéro — elle continue exactement où la première s'est arrêtée (`i = len/2`), balayant ainsi la seconde moitié de la chaîne avec la condition inverse (toute égalité y est un échec, alors que dans la première moitié toute inégalité était un échec).

### Construction de l'exemple

Longueur 8 (`> 6`, paire), moitié = 4 :
- 4 premiers caractères identiques : `abcd` / `abcd`
- 4 derniers tous différents position à position : `wxyz` / `WXYZ` (différence de casse, simple et garantie différente caractère par caractère)

## Vérification

```bash
$ ./original/half-twins abcdwxyz abcdWXYZ
Abby & Gabby: yaayy!! nice job! :D

$ ./original/half-twins ab ac
Abby: i'm older than that :(
good luck next time
```

## Notes

- Pas de GDB nécessaire : les six vérifications et leur ordre sont entièrement lisibles en asm statique, le seul piège étant la non-réinitialisation du compteur de boucle entre les deux moitiés.
- Le check de longueur `> 6` (et non `<= 6` comme on pourrait le lire vite via `ja`) est le détail qui casse le plus d'essais naïfs à la main.
