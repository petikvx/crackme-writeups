# NOTES (reverse) — SoBrazen's Prometheora

> État : **PAS RÉSOLU, mis de côté**. `ORIGIN.yml` reste `status: pending`.
> Annoncé difficulté 1.6 / qualité 1.4 sur crackmes.one, mais **beaucoup plus
> profond que son étiquette ne le laisse penser** — comparable à BoxVM
> (difficulté 4.0) et RiJiN (4.5) traités dans la même session.

Challenge : https://crackmes.one/crackme/697e95cb977274421cc111e1
Binaire : `original/prometheora` (ELF64 PIE, stripped, Rust, 500 KB — taille
gonflée par la libstd statique, normal pour Rust).

## Ce qui est confirmé

Prompt affiché : *"Your mission: Find the correct key to unlock the prize.
The key is 28 characters long."* Succès → message `Congratulations! Contact
@Famigeratomo on telegram…`.

Les chaînes de panique Rust (chemins de fichiers source, conservés même
stripped car intégrés aux messages `unwrap()`/panic) révèlent une
**architecture de protection complète et volontaire**, pas du bruit de
bibliothèque standard :

```
src/main.rs
src/vm/dispatcher.rs              <- VM bytecode maison (switch 4 opcodes vus : add/sub/imul/xor)
src/obfuscation/flatten.rs        <- control-flow flattening
src/crypto/sbox.rs                <- S-box
src/crypto/obfuscated_constants.rs
src/crypto/secure_verify.rs       <- tres probablement LA fonction de verif du mot de passe
src/protection/environment.rs     <- anti-debug/anti-VM (rdtsc, cmdline, LD_AUDIT/LD_DEBUG, vmtoolsd/vboxtray/valgrind)
src/security/memory.rs
```

**Fonction d'entrée identifiée** : `sub_24910` (alias `main` applicatif, PAS
le vrai `main()` C — 1226 lignes de pseudo-code, lecture/trim de stdin assez
lisible) appelle `sub_1A5E0` (la validation) ; si non nul → `sub_23BA0`
(affiche le message de succès, @ `0x23ba0`, trouvé par xref sur la chaîne
"Congratulations…").

**`sub_1A5E0` ne décompile pas** (échec Hex-Rays) — désassemblage brut
révèle un **faux travail en boucle** : constante `9E3779B97F4A7C15` (golden
ratio / seed FxHash-like), `rdtsc` répétés, boucle `lock cmpxchg` cherchant un
minimum/maximum de timing sur des opérations arithmétiques (add/sub/imul/xor,
switch 4 cas) — correspond vraisemblablement à `protection/environment.rs`
(détection de ralentissement = débogueur/VM) mêlé à du bruit volontaire
(micro-benchmarks factices pour noyer l'analyse statique). La vraie
comparaison du mot de passe est probablement dans `crypto/secure_verify.rs`,
**pas encore localisée précisément** dans le binaire.

## Pourquoi mis de côté

Profondeur comparable aux deux autres challenges « piège » de cette session
(BoxVM difficulté 4.0, RiJiN difficulté 4.5) alors que celui-ci est annoncé
1.6 — la note officielle est trompeuse. Dérouler entièrement la VM + le sbox
+ le flattening demande une session dédiée, pas un « 3 d'affilée » parmi des
challenges difficulté 1-2.

## À faire pour reprendre

1. Localiser `secure_verify.rs` compilé (chercher par xrefs depuis `sub_1A5E0`
   ou par recherche de constantes dans `obfuscated_constants.rs`/`sbox.rs`).
2. Déterminer si `protection/environment.rs` (le bruit `rdtsc`) peut réellement
   bloquer l'exécution sous débogueur/VM (comme BoxVM) ou si c'est cosmétique.
3. Si la VM bytecode (`vm/dispatcher.rs`) encode le vrai prédicat, envisager
   `angr` (déjà installé dans l'environnement de travail, voir
   `authors/sumhex/.../tools/angr-*` pour un exemple) plutôt qu'une lecture
   manuelle du dispatcher.
4. Une fois résolu : solveur reproductible, write-up, `ORIGIN.yml` →
   `status: solved`, mise à jour des index.
