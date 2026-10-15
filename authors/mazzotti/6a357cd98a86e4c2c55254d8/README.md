# Mazzotti's Rage keygen

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a357cd98a86e4c2c55254d8) · id `6a357cd98a86e4c2c55254d8`

Crackme **ELF64 x86-64 PIE**, C++ (libstdc++), **strippé**. Transformation XOR en place (dépendant d'un octet « pivot » de la chaîne), puis double contrôle : somme de checksum **et** `std::stoi` sur le résultat.
Auteur : [Mazzotti](https://crackmes.one/user/Mazzotti). 5ᵉ et dernier épisode résolu (pour l'instant) de la famille [mazzotti](../README.md).

Dossier : `authors/mazzotti/6a357cd98a86e4c2c55254d8/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`crackme`](original/crackme) | binaire d'origine |
| [`README.md`](README.md) | ce write-up |
| [`rage-solve.py`](tools/rage-solve.py) | générateur de charge utile (recherche + inversion de la transformation) |

## Réponse

| | |
|---|---|
| **Octets à envoyer (stdin, hex)** | `2b287c7d7e7f1a7e7d` |
| Après transformation interne | `13\`\`\`\`\`:__` (stoi lit `13`, somme des octets = `732`) |

> Pas de convention `petik` applicable : l'entrée valide contient un octet non imprimable (`0x1a`), générée par recherche automatique plutôt que tapée au clavier.

```bash
python3 tools/rage-solve.py --check
python3 tools/rage-solve.py -q      # affiche les octets en hex, prêts pour xxd -r / stdin
```

---

## 1. Premier regard

```text
file original/crackme
# ELF 64-bit LSB pie executable, x86-64, dynamically linked, stripped

sha256: d2a61600ab5f02b3217696036bc84884701238a3f1214aad50819aeba90014c5
```

```text
$ echo "test" | ./original/crackme
Wrong. Sounds like a skill issue!
```

Chaîne `stoi` visible dans `.rodata` → confirme l'usage de `std::stoi` (ou `strtol` sous-jacent) sur l'entrée.

---

## 2. Flow

```text
main  (0x1260)
  cin >> s                         ; lit un mot (pas d'espace)
  ok = check(s)                    ; @ 0x14b0 — modifie s EN PLACE puis vérifie
  if ok  : "Good job :3"
  else   : "Wrong. Sounds like a skill issue!"
```

---

## 3. Comment on trouve le prédicat

### Ancrage — la transformation

`objdump -d -M intel` sur `check(string&)` à `0x14b0` :

```asm
14ca: mov    rax,QWORD PTR [rdi+0x8]     ; rax = s.size()
14ce: cmp    rax,0x7
14d2: jbe    1536                         ; size <= 7 -> faux (taille minimale 8)
14d4: mov    rdx,QWORD PTR [rdi]          ; rdx = s.data()
14d7: movzx  esi,BYTE PTR [rdx+rax*1-0x3] ; esi = v = s[size-3]  (octet ORIGINAL)
14dc: xor    BYTE PTR [rdx],sil           ; s[0] ^= v

; boucle i = 1 .. size-1
14f0: mov    rdx,QWORD PTR [rdi]
14f3: lea    ecx,[rsi+rax*1]              ; ecx = v + i   (PAS un accès mémoire : lea = addition)
14f6: add    rdx,rax
14f9: add    rax,0x1
14fd: xor    BYTE PTR [rdx],cl            ; s[i] ^= (v + i) & 0xFF
1503: cmp    rax,[rdi+0x8]
1506: jb     14f0
```

`v` est lu **avant** toute modification (donc c'est bien l'octet original à l'index `size-3`, même si cet index est lui-même réécrit ensuite par la boucle).

### Ancrage — les deux vérifications

```asm
; 1) somme signée de TOUS les octets transformés
1513: xor    ecx,ecx
1520: movsx  esi,BYTE PTR [rax]
1523: add    rax,0x1
1527: add    ecx,esi
1529: cmp    rax,rdx
152c: jne    1520
152e: cmp    ecx,0x2dc                    ; somme == 732 ?
1534: je     1558                          ; sinon -> faux

; 2) stoi() sur la chaîne transformée (strtol@plt), puis
1587: mov    edx,0x80000000
158c: add    rdx,rax
158f: shr    rdx,0x20
1593: jne    throw_out_of_range            ; valeur hors int32 -> exception
...
159d: ; division magique par 27 (imul 0x4bda12f7, sar 0x23, *3, *9)
15ba: cmp    eax,0xd                       ; valeur % 27 == 13 ?
15bd: sete   al
```

Deux contraintes indépendantes sur la **même** chaîne transformée `T` :
1. `Σ movsx(T[i]) == 0x2dc` (732) sur **tous** les octets ;
2. `std::stoi(T) % 27 == 13` — mais `stoi`/`strtol` ne lit que le **préfixe numérique** de `T` et ignore le reste (pas d'exception sur les octets non numériques après ce préfixe, contrairement à ce qu'on pourrait croire).

### Piège : la fausse contrainte « toute la chaîne doit être un nombre »

Première intuition fausse : croire que *toute* la chaîne transformée doit être composée de chiffres (pour que `stoi` l'accepte), ce qui mène à une impasse mathématique — la somme des codes ASCII de chiffres (`0x30`-`0x39`) d'une chaîne de N caractères a une parité modulo 9 forcément liée à la valeur numérique elle-même (propriété de la racine numérique en base 10), **incompatible** avec `valeur % 27 == 13` quelle que soit la longueur choisie (démonstration : `digitsum(X) mod 9` est fixé par `X mod 9 = 4` d'un côté, et par `732 - 48·N mod 9 ∈ {0,3,6}` de l'autre — jamais `4`). Cette impasse se lève dès qu'on se rappelle que `strtol`/`stoi` **n'exige pas** que toute la chaîne soit numérique : seul le préfixe compte, le reste peut être n'importe quel octet (y compris non imprimable), ce qui donne toute latitude pour ajuster la somme indépendamment de la valeur numérique.

### Assemblage de la charge utile

1. Choisir `T[0..1] = "13"` → `stoi` lit `13`, et `13 % 27 == 13` ✓.
2. `T[2]` ne doit **pas** être un chiffre (sinon `stoi` prolongerait le nombre au-delà de `13`).
3. `T[taille-3]` (l'indice « spécial ») n'est **pas libre** : il est entièrement déterminé par `v` via `T[spécial] = v XOR ((v + spécial) & 0xFF)` — on cherche `v` (0 à 255) pour satisfaire les contraintes restantes.
4. Les octets libres restants sont choisis pour amener la somme totale à exactement `732`.
5. On **inverse** la transformation (`O[0] = T[0] XOR v`, `O[i] = T[i] XOR ((v+i) & 0xFF)` pour `i ≠ spécial`, `O[spécial] = v`) pour obtenir la chaîne à **taper/envoyer** — généralement non imprimable, donc générée par script plutôt qu'au clavier.

`tools/rage-solve.py` automatise entièrement cette recherche (taille 8 à 15, recherche de `v`, répartition de la somme, inversion, vérification croisée transform(O) == T) et vérifie le résultat en exécutant le binaire.

---

## 4. Vérification

```bash
$ python3 tools/rage-solve.py --check
[+] octets a envoyer (stdin) : 2b287c7d7e7f1a7e7d
[+] apres transformation XOR : b'13````:__' (somme = 732)
----- sortie du programme -----
Good job :3
--------------------------------
CHECK: OK
```

Cas KO (chaîne de 7 caractères ou moins, rejetée avant même le calcul) :

```bash
$ echo "short" | ./original/crackme
Wrong. Sounds like a skill issue!
```

Cas KO (somme correcte mais valeur `stoi` fausse, ou l'inverse) : toute altération d'un seul octet de la charge générée fait échouer soit la somme, soit le modulo — vérifié en mutant un octet du payload trouvé et en relançant.

---

## 5. Notes

- Pas de GDB nécessaire : le désassemblage statique + une petite émulation Python de la séquence (`lea`/`xor`/multiplication magique) suffisent à extraire le prédicat exact ; vérifié directement en exécutant le binaire avec la charge calculée.
- Le « pivot » `v = s[size-3]` capturé *avant* modification est le point le plus facile à rater en lecture rapide (on pourrait croire que la boucle XOR utilise le `s[i-1]` déjà transformé, alors que c'est une constante figée dès le départ).
- `lea ecx,[rsi+rax*1]` est une **addition arithmétique** (pas un accès mémoire) : piège classique de lecture d'assembleur généré par GCC pour `v + i` sans instruction `add` dédiée.
