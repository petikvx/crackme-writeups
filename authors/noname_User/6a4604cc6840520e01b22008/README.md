# noname_User's It was entirely written by an obf that I found somewhere on GitHub and modified with AI.

| | |
|---|---|
| **ID** | [`6a4604cc6840520e01b22008`](https://crackmes.one/crackme/6a4604cc6840520e01b22008) |
| **Auteur (site)** | noname_User |
| **Auteur (local)** | noname_User |
| **SHA-256** | `16be28532f333d66478f0934baccbcaa0bbf0db411d2aca5f3e8d2a10ca20ffb` |

## Origine

- Page : https://crackmes.one/crackme/6a4604cc6840520e01b22008
- Download : https://crackmes.one/download/crackme/6a4604cc6840520e01b22008
- ZIP password : `crackmes.one`

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Réponse

**Il n'y a pas de serial / mot de passe** : le script ne demande aucune entrée. Le programme caché derrière l'obfuscateur *ShadowForge* est littéralement :

```python
print('hi')
```

```bash
python3 -I tools/hi-bf-solve.py --check   # désobfusque (sans exécuter) + compare avec l'exécution réelle
python3 -I tools/hi-bf-solve.py -q        # -> hi
```

## Contenu

| Fichier | Rôle |
|---|---|
| `original/hi_bf.py` | script obfusqué d'origine (non modifié) |
| `tools/hi-bf-solve.py` | désobfuscateur statique + désassembleur de la VM |

## Premier regard

`file` : Python script UTF-8, lignes très longues. Exécuté (copie jetable dans `/tmp`) : affiche seulement `hi` et rend la main, sans lire stdin. Le fichier contient `__SF_CARRIER__` (blob base85 `data:…`), `__SF_TOKENS__`, `__SF_SEED__`, deux VM (`ShadowVM`, `ShadowTrapVM`) et des fonctions d'auto-destruction (`_sf_self_destruct` écrase `__file__` en cas de tamper) — **toujours travailler sur une copie**.

## Flow

1. `_sf_decode_carrier` : `b85decode` du carrier → conteneur `SF02` (count, puis par section : sid, tag, ciphertext).
2. `_sf_build_secret` : clé maître = 8 entiers u32 (chaque entier est une somme de deux constantes, en identifiants unicode illisibles) concaténés en big-endian = 32 octets.
3. Clé de section = `sha256(master || sid_be16)` ; déchiffrement = XOR avec le flux `sha256(key || ctr_be32)` par blocs de 32 ; intégrité = `sha256(key || clair)[:16] == tag`.
4. Sections : 1 meta (version, sid du module), 2 table d'opcodes (mapping + faux opcodes à ignorer), 3 constantes, 4 noms, 5/6 module et fonctions.
5. `_sf_select_vm_lane` choisit `ShadowTrapVM` (qui abort) uniquement si `_sf_poisoned() != 0` ; sinon `ShadowVM` exécute le module.

## Comment on trouve

- **Ancrage** : lecture du fichier (`sed -n 60,400p`) ; les 400 lignes de loader sont du code clair, seul le payload est chiffré. La clé est dans le fichier même (sommes de constantes) → pas de brute force (malgré le nom `hi_bf`).
- **Décodage** : le solveur lit le fichier avec `ast` (jamais `exec`), additionne les constantes de `_sf_build_secret`, déchiffre les sections et vérifie chaque tag (`tag KO` sinon).
- **Dump de la VM** (variante qui hooke `ShadowVM._run` pour imprimer au lieu d'exécuter) :

```text
CONSTS ['hi', None]   NAMES ['print']
0 (2, [0])   LOAD_NAME print
1 (1, [0])   LOAD_CONST 'hi'
2 (6, [1])   CALL 1
3 (26, [])   POP
4 (1, [1])   LOAD_CONST None
5 (7, [])    RETURN
```

- **Pièges** : `__SF_TOKENS__`/`__SF_SEED__` sont des leurres ; les faux opcodes (section 2) doivent être filtrés ; l'auto-destruction écrase le fichier si l'intégrité échoue (on ne modifie jamais `original/`).

## Vérification

- OK : `python3 -I tools/hi-bf-solve.py --check` → `réel : ['hi'] => OK` (sortie du script d'origine exécuté sur copie temporaire = sortie reconstruite).
- Intégrité : SHA-256 de `original/hi_bf.py` inchangé (`16be2853…`).
- KO/edge : si un tag de section ne correspond pas (fichier altéré), le solveur s'arrête sur `tag KO section N` ; un opcode hors du sous-ensemble print/const est refusé explicitement.

## Notes

Pas de GDB/x64dbg/IDA. Challenge sans prédicat : le « crack » consiste à retrouver le code source protégé. Pas d'utilisateur d'exemple (aucune entrée).
