# toasterbirb's yap

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a77541805a9e80a907242fe) · id `6a77541805a9e80a907242fe`

Crackme **Linux** ELF64 — perroquet Markov (réf. Mark V. Shaney).  
Auteur site : **toasterbirb**. Difficulty **2.8** · quality **3.7**.

Dossier : `authors/toasterbirb/6a77541805a9e80a907242fe/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/yap.zip`](original/yap.zip) | archive site |
| [`analysis/extracted/yap`](analysis/extracted/yap) | ELF64 PIE |
| [`analysis/extracted/words.dat`](analysis/extracted/words.dat) | vocabulaire |
| [`analysis/extracted/data.dat`](analysis/extracted/data.dat) | transitions Markov ordre 2 |
| [`analysis/extracted/README.md`](analysis/extracted/README.md) | énoncé auteur |
| [`tools/yap-solve.py`](tools/yap-solve.py) | trouve le bigramme → flag |

## Réponse

| | |
|---|---|
| Entrée | **`Your prize:`** |
| Flag | **`flag{shaney_would_have_liked_this}`** |

```bash
# extraire si besoin
7z x -oanalysis/extracted original/yap.zip

python3 tools/yap-solve.py -q
# Your prize:

cd analysis/extracted && printf 'Your prize:\n' | ./yap
# Your prize: flag{shaney_would_have_liked_this}.

python3 tools/yap-solve.py --check
```

Le flag est aussi en clair dans `.rodata`, mais taper le flag en entrée déclenche  
`not in the mood to roleplay as a parrot` — il faut le **faire dire** par la chaîne.

---

## 1. Premier regard

ZIP imbriqué : `yap` + `words.dat` + `data.dat` + README.

```text
ELF 64-bit LSB pie, stripped
sha256 zip 4420c47f5c1ddaf46b9add156e6badc6ff66af3b0ea38a7c714b6e0d6acf1d82
```

---

## 2. Flow

1. `fgets` ligne utilisateur (max ~0x80)
2. Si ligne == flag en clair → refus « parrot »
3. Parse **deux mots** (toggle à chaque espace) ; défaut `To` / `do`
4. Charge `words.dat` (mots séparés par espaces) + `data.dat`
5. Boucle Markov : bigramme `(w0,w1)` → tire `w2` via `rand()` ; affiche ; décale
6. Stop si le mot tiré se termine par `.`

`srand(time(NULL))` — mais un bigramme peut n’avoir **qu’une** transition.

---

## 3. Prédicat / data.dat

Enregistrements :

```text
uint32 key = (idx_a << 16) | idx_b
uint32 count
uint16 next[count]   # indices dans words.dat
```

Le mot `flag{shaney_would_have_liked_this}.` (index 744) n’a **qu’un** prédécesseur :

```text
('Your', 'prize:') → [744]   # déterministe
```

---

## 4. Vérification

```bash
python3 tools/yap-solve.py --check
# … flag{shaney_would_have_liked_this}.
# OK
```

---

## 5. Notes

- ANSI `\x1b[A` / `\x1b[2K` : réécrit la ligne (illusion de « conversation »).
- Patch interdit par l’énoncé ; ici aucun patch — juste la bonne entrée.
