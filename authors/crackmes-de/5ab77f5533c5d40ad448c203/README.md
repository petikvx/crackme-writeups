# keygenme_0.72 by bswap (crackmes.de)

« KeygenMe 0.72 » de Bswap (2002), « 100% written in Masm 7.0 ». Goal : *make a keymaker* (bonus annoncé : une clé **GOLD**).

- **Page** : <https://crackmes.one/crackme/5ab77f5533c5d40ad448c203>
- **Plateforme** : Windows **PE32** GUI (MASM), packé **FSG 1.33** (site : Unspecified/other) — difficulté 2.0
- **Archive** : `original/keygenme072.zip` → `KeygenMe072.exe` + `ReadMe.txt`
- **SHA-256 zip** : `3644de1165c3ff8d2f3cc7a3f870a912ff6d717f5fb0e964350e82ee5db9faec`
- **Statut** : résolu (keymaker), vérifié **sous wine** sur le binaire original packé : « Your Key petik 0369-6903 »

## Solution

Pas de champ de saisie : la licence est lue dans le **registre** au démarrage.

```
HKEY_CURRENT_USER\Software\Keygeme072\Your Key
    "Key 1" REG_DWORD   K1 (libre)
    "Key 2" REG_DWORD   f(K1)
    "Name"  REG_SZ      nom affiché
```

`f` (boucle `0x40138f`) sur les 4 octets de K1, avec `ecx = 9`, `edx = 0` au départ :

```
pour i = 0..3 :
    eax = movsx(K1[i])
    xadd ecx, eax          ; eax = ancien ecx, ecx += K1[i]
    ecx += i
    shrd dx, ax, 4         ; dx = (dx >> 4) | ((ax & 0xF) << 12)
    dl = (dl + 1) ^ dh
    out[i] = dl
Key 2 == dword(out)  → enregistré
```

Le keymaker prend `K1` = les 4 premiers caractères du nom (au hasard, n’importe quelle valeur marche) :

```
python3 tools/keygenme072-solve.py petik --reg
Name  = petik
Key 1 = 0x69746570
Key 2 = 0xC8639391

REGEDIT4

[HKEY_CURRENT_USER\Software\Keygeme072\Your Key]
"Key 1"=dword:69746570
"Key 2"=dword:c8639391
"Name"="petik"
```

Le programme affiche alors le nom et un « code » dérivé du nom : `d[i] = (Asc(nom[i]) xor 0x1E) mod 10`
→ `petik` : `0 3 6 9` → `0369-6903` (chiffres + `'0'`, puis `bswap`/`xchg` pour la 2ᵉ moitié inversée).

### Et la clé GOLD ?

Branche `0x401402` : il faudrait en plus `dword(out) == d[0..3]`. Or `out[0]` ne dépend que de l’état initial
(`ax = 9` au premier tour) : `dx = 0x9000`, `dl = (0 + 1) ^ 0x90 = 0x91`, **toujours**. Les `d[i]` sont des restes
de division par 10 (`0..9`, ou `0xF7..0xFF` pour un caractère ≥ 0x80 à cause du `movsx`/`idiv` signé) : `0x91`
est inatteignable. Avec ce code, la branche GOLD (`"-GOLD"` écrit à `0x40331a`) est morte ; on livre la clé normale.

## Comment on trouve

1. `diec` : **FSG 1.33**. Seuls imports visibles : `LoadLibraryA` / `GetProcAddress`.
2. Unpack par émulation : `tools/unfsg-unicorn.py` mappe le PE dans Unicorn, simule `LoadLibraryA` /
   `GetProcAddress` (journal des imports reconstruits), s’arrête au premier `EIP` dans la section 1
   (**OEP = 0x401000**) et dumpe l’image → `analysis/KeygenMe072-unfsg.bin` (image mémoire brute à `0x400000`).
3. `objdump -D -b binary -m i386 --adjust-vma=0x400000` sur le dump, annoté avec la table d’imports reconstruite :
   `RegCreateKeyExA` sur `Software\Keygeme072\Your Key` (`0x401273`), trois `RegQueryValueExA`
   (`Key 1` → `0x4032e0`, `Key 2` → `0x4032e4`, `Name` → `0x4032ec`), puis la boucle `0x40138f` et
   `cmp eax, [0x40330b]` (`0x4013b1`). Tout échec → `0x4019b2` : « Not Registered » / « No Code ».
4. Boucle nom `0x4013cf` : `(movsx c xor 0x1E) idiv 10` → reste ; comparaison GOLD `0x4013fa`.

## Vérification

```
tools/verify-wine.sh petik                       # « Your Key  petik  0369-6903 »
tools/verify-wine.sh petik 0x12345678            # Key 2 faux → « Not Registered / No Code »
```

- **Live** : binaire original (packé, non patché) sous wine/Xvfb le 2026-10-12, clé écrite avec `wine reg add`,
  capture de la fenêtre : [`analysis/registered-petik.png`](analysis/registered-petik.png),
  [`analysis/not-registered.png`](analysis/not-registered.png). Le script supprime la clé de registre à la fin.
- **Émulation** : la fonction Python `f` est comparée au **vrai code** `0x401378..0x4013aa` du dump exécuté sous
  Unicorn, sur `petik` + 200 `K1` aléatoires (identique) : `python3 tools/check-f-unicorn.py`.
