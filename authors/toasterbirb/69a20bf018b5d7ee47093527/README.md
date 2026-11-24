# toasterbirb's notes

| | |
|---|---|
| **ID** | [`69a20bf018b5d7ee47093527`](https://crackmes.one/crackme/69a20bf018b5d7ee47093527) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | toasterbirb |
| **Plateforme** | Linux x86-64, 2 ELF PIE strippés (C, GCC 14.2) dans un zip |
| **SHA-256 (zip)** | `94baf98587541470533d6d5e3341deffb4353bb8124ed1f36482f22f03411eb7` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/notes.zip` | archive d'origine (mot de passe zip `crackmes.one`), non modifiée |
| `analysis/extracted/` | contenu dézippé : `note_viewer`, `note_writer`, `notes/flag.note`, `notes/instructions.note` |
| `tools/notes-solve.py` | déchiffre un `.note` sans mot de passe ; `--pass` cherche un mot de passe valide |

## Réponse

Le but est de lire `notes/flag.note`.

**Flag : `flag{top_notch_military_grade_encryption}`**

```bash
python3 -I tools/notes-solve.py analysis/extracted/notes/flag.note -q
# flag{top_notch_military_grade_encryption}
python3 -I tools/notes-solve.py analysis/extracted/notes/flag.note --pass   # ~50 s
# aaaaaac8z90   (mot de passe collisionnant, accepté par note_viewer)
```

Le mot de passe d'origine n'est pas récupérable : on ne connaît que son Adler-32. `aaaaaac8z90` n'en est qu'un équivalent (collision). Le chiffrement n'a de toute façon pas besoin du mot de passe.

## Premier regard

- `note_viewer <fichier>` demande `password: `, puis affiche la note ; `note_writer <fichier>` demande `password: ` puis `note: ` et crée le fichier.
- Messages utiles : `access denied`, `the note is corrupted...`, `the note had no data to read...`.
- Les deux binaires sont strippés, pas de symboles. Le code est lisible avec `objdump -d -M intel` (~100 lignes utiles).
- Piège : la routine de longueur de chaîne en `0x1480` est obscurcie (appels récursifs, `not`/`xor`). C'est un `strlen` classique et il n'y a rien à reverser dedans.

## Flow

Fonction principale `0x1212` (viewer, `rbx` = `FILE*`) :

1. `0x11cc` : `fgets(buf, 0x20, stdin)`. **Le `\n` reste dans le buffer.**
2. `0x1480` : `strlen`.
3. `0x13a0` : `h = adler32(buf, len)`.
4. `fread(&stored, 4, 1, f)` puis `0x11c3` : `h == stored` ? Sinon `access denied`.
5. `fread` du reste (≤ 0x1000 octets) puis `0x1420` : XOR de déchiffrement, puis `printf("%s")`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn analysis/extracted/note_viewer`. Le check est dans `0x1212..0x12b9`.

**Checksum (`0x13a0`)** : les constantes `0xfff1` (= 65521) et `0x80078071` (division par réciprocité, multiplication magique) sont la signature d'Adler-32.

```asm
13b0 mov edi,1            ; a = 1
13b5 movzx eax,[r8]       ; octet
13bc add eax,edi          ; a += c
...  imul edx,edx,0xfff1  ; a %= 65521
13de add ecx,eax          ; b += a   (ecx = b, init 0)
...  imul edx,edx,0xfff1  ; b %= 65521
140b shl ecx,16 ; add eax,ecx   ; (b<<16) | a
```

**Chiffrement (`0x1420`)** : l'argument `edx` (le checksum) est recopié sur la pile en 4 octets LE, puis :

```asm
1460 mov rdx,rax ; and edx,3          ; i & 3
1466 mov ecx,eax ; add cl,[rsp+rdx-4] ; cl = i + key[i&3]
146c xor [rdi+rax],cl                 ; data[i] ^= cl
```

La clé du flux XOR est donc l'**Adler-32 lui-même**, et ce checksum est écrit **en clair** dans les 4 premiers octets du fichier (`fread(&stored,4,…)` en `0x1266`). On déchiffre sans connaître le mot de passe :

```
flag.note : cf 03 0c 1c  → key = 0x1c0c03cf
data[i] ^= (i + key[i & 3]) & 0xff   →   flag{top_notch_military_grade_encryption}
```

Le mot de passe n'est qu'une porte d'entrée dans `note_viewer` : le contenu est récupérable depuis le fichier seul.

**Mot de passe équivalent** : Adler-32 de `pass + "\n"` (le `fgets` garde le `\n`, vérifié avec `note_writer`).

- `petik\n` → `0x088a0228`, ce qui donne bien les octets `28 02 8a 08` dans le fichier écrit par `note_writer`.
- Pour `flag.note` : a = `0x03cf` donc somme des octets = 974 (dont `\n` = 10) ; b = `0x1c0c`.
- La recherche DP/mémoïsée de `notes-solve.py --pass` sur `[a-z0-9]` donne `aaaaaac8z90`.

## Vérification

Natif, binaire d'origine (dézippé depuis `original/notes.zip`) :

```text
$ echo aaaaaac8z90 | ./note_viewer notes/flag.note
password: flag{top_notch_military_grade_encryption}
$ echo petik | ./note_viewer notes/flag.note          # KO
password: access denied
```

- `note_writer` a produit les 4 octets d'en-tête attendus pour `petik` (`28 02 8a 08`), ce qui confirme que le `\n` est inclus.
- `sha256sum original/notes.zip` est inchangé.
- Pas de session GDB : le reverse est statique, plus des exécutions natives.

## Notes

- Ce n'est pas un vrai chiffrement : la clé est le hash du mot de passe, stocké dans le fichier avec le texte.
- Le même schéma s'applique à `instructions.note` (key = `0x1f2b0414`).
- `note_writer` est le même programme dans le sens inverse (même `0x1420`).
