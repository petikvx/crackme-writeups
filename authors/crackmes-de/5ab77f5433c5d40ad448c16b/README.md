# linux_crackme_v2 (CM13) — veneta//MBE (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5433c5d40ad448c16b · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, GTK 1.x, NASM 0.98.35, packé **UPX 1.24**
- Archive : `original/cm13.zip` → `cm2` ; dépaqueté : `analysis/cm2.unpacked`

## Réponse

| Champ | Valeur |
|---|---|
| **Name** | `3474fb4551f2fd67ac4211395461a23c` (32 caractères hex) |
| **Serial** | n'importe quelle chaîne de ≥ 3 caractères, p. ex. `petik` |

```bash
python3 -I tools/cm13-solve.py --check
# name  : 3474fb4551f2fd67ac4211395461a23c
# check: OK (bon=True, name altéré rejeté=True)
```

Le name est la seule contrainte réelle ; le serial est quasi libre (voir « Pièges »).

## Premier regard

```text
$ ./tools/upx-3.96 -d -o analysis/cm2.unpacked analysis/cm2     # UPX 1.24, 4870 -> 10584 octets
$ strings analysis/cm2.unpacked | grep -iE "BAD KEY|cracked|MBECrew"
BAD KEY :P BAD cracker BAD :P      cracked      MBECrew
```

GTK1 n'est plus installable ici : le binaire ne se lance pas en natif → analyse statique + **émulation du handler réel avec unicorn** (`tools/cm13-emu.py`).

## Flow

Le bouton `CrackMe` appelle le handler @`0x8048cad` :

1. `name = gtk_entry_get_text(entry_name)` ; `strlen(name)` doit valoir **0x20** (sinon « BAD KEY »).
2. `0x8048f50` convertit les 32 caractères hex en 16 octets `P` @`0x804a3f0` (8 chars → 1 dword, `rol 4`, `bswap`).
3. `serial` (≥ 3) copié en `0x804a7f0`.
4. RC4 maison (clé `"MBECrew"`, 7 octets @`0x804a210`) :
   - `0x8048e4f` = KSA, **S initial rempli de `0xf0`** (`mov [ecx*4+0x804abec],0xf0f0f0f0` ×0x40) au lieu de l'identité ;
   - `0x8048ebc` = PRGA XOR en place.
   Appliqué à `P` (16 octets), puis (KSA refait) au `serial`.
5. Boucle @`0x8048d72`, puis `memcmp` des 16 octets de `P` chiffré avec les 4 dwords @`0x804a218`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/cm2.unpacked`, adresse du handler obtenue via `gtk_signal_connect(…, "clicked", 0x8048cad)` (`push 0x8048cad` près de `0x8048c02`).

Constantes : clé `4d42454372657700` = `"MBECrew\0"` @`0x804a210`, cible `c4840bb5 a1020d97 5cb2e1c9 a49152cc` @`0x804a218`.

Le cœur du check :

```asm
8048d72: mov  al,[edx]          ; edx = 0x804a7f0 : 1er octet du serial déchiffré
8048d76: je   8048db3           ; si 0 -> edx=0x804a7f0 puis retour (boucle infinie)
8048d78: add  al,0xa
8048d7a: xor  [esi],al          ; esi = 0x804a3f0
8048d7c: loop 8048d72           ; ecx = 0x10 : NI edx NI esi ne sont incrémentés
```

Le programmeur voulait vraisemblablement `inc esi / inc edx` ; faute de quoi le **même octet** est XORé 16 fois avec la même valeur : l'effet net est nul. Il reste donc :

```
RC4_MBECrew(P) == C   <=>   P = RC4_MBECrew(C)   (RC4 est involutif)
```

d'où `name = hex(RC4(C))` avec le S initial `0xf0` (script : `rc4()` de `tools/cm13-solve.py`).

**Pièges :**
- Le KSA n'est **pas** un RC4 standard : S ne vaut pas `0..255` mais `0xf0` partout. Un RC4 de bibliothèque donne un résultat faux.
- Le premier modèle (que j'avais écrit en supposant que la boucle parcourait `S[i mod n]`) était donc faux : seule l'émulation du vrai code via unicorn (`BAD KEY` pour mon modèle) l'a révélé.
- Le serial n'importe que par `len ≥ 3` et `RC4(serial)[0] != 0` (sinon la boucle ne se termine jamais).

## Vérification

```text
$ python3 -I tools/cm13-emu.py 3474fb4551f2fd67ac4211395461a23c petik
cracked
$ python3 -I tools/cm13-emu.py 3474fb4551f2fd67ac4211395461a23d petik    # 1 nibble changé
BAD KEY
$ python3 -I tools/cm13-emu.py 3474fb4551f2fd67ac4211395461a23c ab       # serial trop court
BAD KEY
```

(sorties dans `analysis/emu.txt`). L'émulation exécute l'asm réel du handler, seuls les appels GTK sont court-circuités (`gtk_entry_get_text` renvoie nos buffers ; le message final est repéré par son pointeur : `0x804a08f` « cracked » / `0x804a071` « BAD KEY »).

## Notes

- Pas de GDB ni de preuve GUI : GTK1 absent. La preuve est l'émulation du code d'origine (unicorn).
- Le texte du message final demande au solveur d'envoyer « patch et keygen » : le crackme voulait aussi un patch (non fait ici).

## Fichiers

- `analysis/cm2` (UPX), `analysis/cm2.unpacked` (dépaqueté), `analysis/emu.txt`
- `tools/cm13-solve.py` : calcule le name · `tools/cm13-emu.py` : rejoue le handler (unicorn)
