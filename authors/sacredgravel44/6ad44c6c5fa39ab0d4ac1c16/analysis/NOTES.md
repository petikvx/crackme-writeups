# NOTES (reverse) — sacredgravel44's matryoshka9

> État : **PAS RÉSOLU, mis de côté**. `ORIGIN.yml` reste `status: pending`.

Challenge : https://crackmes.one/crackme/6ad44c6c5fa39ab0d4ac1c16
Binaire : `original/matryoshka9_cmo.exe` (PE32+ x86-64, console, MSVC 2026,
~1.25 MB, non packé).

Prompt : `enter serial (76 chars, A-Z a-z 0-9): `. Pas de username — juste
un serial de 76 caractères alphanumériques.

## Ce qui est confirmé

`main`-like (`sub_140001030`, le seul appelant visible depuis le prompt) :

1. Lit une ligne via un wrapper C++ `cin.getline` (`sub_140004FD0` ->
   `sub_140004E5C`), max 92 octets dans un buffer brut.
2. **Assainit** par groupes de 4 octets vers un buffer de 76 octets
   (`var_C8`) : tout octet `<=0x0D` dont le bit correspondant est dans le
   masque `0x2401` (= `{0x00, 0x0A, 0x0D}` = NUL/\n/\r) déclenche un
   "troncature" (met à 0 tout le reste) — un simple nettoyage de fin de
   ligne, sans effet sur un vrai serial alphanumérique.
3. `VirtualAlloc(NULL, 0x10EBC3, MEM_COMMIT|MEM_RESERVE, PAGE_EXECUTE_READWRITE)`
   — alloue ~1.1 MB **exécutable**.
4. **Déchiffre** `byte_140017530` (1 108 931 octets, dans `.rdata`) dans ce
   buffer avec un cipher ARX maison, 31 rounds, clé/tweak par bloc de 16
   octets — un variant Speck-like. Reproduit exactement en Python,
   voir `tools/matryoshka9-solve.py` (`decrypt_layer()`), vérifié en
   relisant le prologue x64 valide (`push r15; push r14; ...; sub rsp,0x2D8`)
   du contenu déchiffré à l'offset `0x33`.
5. Appelle le code déchiffré (`buf+0x33`) avec la convention
   `(rcx=string "NOTICE: ...", rdx=&{alloc_fn_ptr, result_flag, next_key=
   0x3E75298F41D054C1, sbox_ptr=&unk_140017430 (256 octets)}, r8=self_ptr
   =buf+0x33, r9=&var_C8 (le serial assaini, 76 octets))`.
6. Après le retour, vérifie `result_flag` (écrit dans le contexte passé
   par référence) : `correct\n` / `incorrect\n`.

### La "VM" (couche décryptée) est en fait du code flatten + MBA

Le code déchiffré (1.1 MB) **n'est pas un bytecode interprété** par un
programme externe : c'est le binaire lui-même qui a été **flatten +
obfusqué en MBA** (mixed boolean-arithmetic — chaînes `xor/and/or/add/
sub/neg/shl` qui recalculent, de façon disguisée, des opérations
beaucoup plus simples) puis chiffré pour être copié/exécuté en RWX.
Dispatcher classique : `mov eax,ecx ; sub eax,N ; je case_N` répété pour
chaque état `N`.

**Fait important vérifié empiriquement** : le flot de contrôle **ne
dépend pas de la valeur du serial** — en changeant le premier caractère
du serial (26+26+10 essais), le nombre d'instructions exécutées et
l'adresse max atteinte sont **identiques** à chaque fois (`7845`
instructions, adresse max `+0x1833f`). Donc pas de "petit indice de
timing" exploitable par force brute caractère-par-caractère ; c'est un
hash/MAC sur les 76 octets en bloc, pas une suite de comparaisons avec
sortie anticipée.

**Le check final est localisé** (tracé concret avec Unicorn, un seul
chemin exécuté, ~7845 instructions parmi les 1.1 MB alloués — l'essentiel
du blob est du code mort de l'obfuscation) :

```asm
movabs rax, 0x23030D333EA5FEC6   ; constante cible
mov    ecx, 1
mov    r8d, 2
cmp    rdx, rax                   ; rdx = hash calcule du serial (76 octets)
cmove  ecx, r8d                   ; ecx=2 si egal -> branche succes
```

`rdx` à ce point est le résultat de ~7800 instructions de MBA appliquées
aux 76 octets du serial (plus une table de constantes/sbox fixe). Trouver
un `serial` qui produit `rdx == 0x23030D333EA5FEC6` est le seul objectif
restant.

## Outils construits (dans `tools/` et `analysis/`)

- `tools/matryoshka9-solve.py` : reproduit le déchiffrement ARX (couche 1)
  en Python pur — fonctionne, vérifié (prologue x64 valide en sortie).
- `analysis/emu.py` : harnais **Unicorn** qui exécute `sub_140001030`
  réel (mappé à son adresse préférée `0x140000000`, aucune relocation
  nécessaire) en stubant uniquement `cin.getline`/`cout.flush`/`printf`/
  `VirtualAlloc`/le pointeur de fonction interne — tout le reste
  (assainissement, déchiffrement ARX, et le code flatten lui-même)
  s'exécute comme du vrai x86-64 émulé. **Fonctionne** : reproduit
  fidèlement `correct`/`incorrect` sans Wine ni Windows, ~0.1-0.2 s par
  essai.
- `analysis/probe.py` : confirme l'absence de signal de timing par
  caractère (voir plus haut).
- `analysis/symreplay.py` : **tentative de résolution** — rejoue la MÊME
  trace concrète (chemin unique, démontré indépendant du serial) avec
  un petit interpréteur x86-64 symbolique maison (z3), les 76 octets du
  serial étant les seules inconnues, tout le reste du contexte (pointeurs,
  table sbox, clé) étant pris en valeurs concrètes depuis le snapshot
  Unicorn au point d'entrée du code déchiffré. Construit la contrainte
  `hash(serial) == 0x23030D333EA5FEC6` + alphabet `A-Za-z0-9`, lance
  `z3.Solver().check()`.
  - `angr` (exécution symbolique "classique", forks sur chaque branche) a
    été essayé en premier et abandonné : bien trop lent sur ce volume de
    MBA (timeout à 280 s sans terminer le premier appel bloquant).
  - `symreplay.py` construit la contrainte complète en quelques secondes
    (le remplacement est purement linéaire, pas de fork), mais le
    `z3.Solver().check()` final **n'a pas convergé** en plusieurs minutes
    (mémoire croissante, pas de réponse SAT/UNSAT) — interrompu, pas de
    réponse obtenue.

## Pourquoi mis de côté

Le hash MBA sur 76 octets est TROP complexe pour que Z3 le résolve "tel
quel" dans un temps raisonnable, malgré un chemin d'exécution unique et
court (~7800 instructions). Reprendre nécessiterait probablement :

1. **Simplifier l'expression z3 avant le `check()`** : `z3.Tactic
   ('ctx-solver-simplify')`, ou bit-blasting + simplification booléenne
   (beaucoup de ces chaînes MBA sont des identités connues — ex.
   `(a|b)-(a&b)` = `a^b`, `(a&b)*2 + (a^b)` = `a+b` — qui peuvent être
   reconnues et réduites avant de soumettre à Z3).
2. **Lancer Z3 bien plus longtemps**, en vrai arrière-plan détaché (pas
   dans une session interactive), avec un budget de plusieurs heures.
3. Ou écrire un **solveur dédié MBA** (type MBA-Blast / SiMBA) pour
   réduire chaque bloc d'instructions à sa forme simple avant de
   rejouer la trace — réduirait l'expression finale à une taille que Z3
   digère en secondes plutôt qu'en ne terminant jamais.
4. Alternative : relancer le harnais Unicorn en gardant le serial
   **concret** mais en testant des millions de candidats via force brute
   distribuée n'est pas viable (76 caractères, alphabet 62 → espace
   totalement hors de portée) ; la seule voie réaliste reste l'inversion
   algébrique/symbolique du hash.

## À faire pour reprendre

1. Essayer `z3.Then(z3.Tactic('simplify'), z3.Tactic('solve-eqs'),
   z3.Tactic('smt'))` ou une simplification MBA dédiée sur l'expression
   de `rdx_at_cmp` dans `symreplay.py` avant `solver.add(...)`.
2. Relancer `symreplay.py` en arrière-plan avec un budget de plusieurs
   heures (`nohup ... &`, pas dans une session interactive courte).
3. Si résolu : `tools/matryoshka9-solve.py` à compléter avec la
   résolution du hash, preuve live sous `xvfb-run -a wine
   original/matryoshka9_cmo.exe`, write-up, `ORIGIN.yml` → `status:
   solved`, mise à jour des index.
