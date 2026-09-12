# Reprise — alpjs custom vmp

- **ID** : [`6aa4b6d3585e8875bcbebf80`](https://crackmes.one/crackme/6aa4b6d3585e8875bcbebf80)
- **Titre** : alpjs's custom vmp crackme
- **Status** : `pending` — crypto offline **validé** (Unicorn + x64dbg) ; password **inconnu**
- **Objectif reprise** : brute GPU (ex. **H100**) ou wordlist / known-plaintext flag

---

## Ce qui est sûr

| Élément | Valeur |
|---|---|
| Binaire | PE64 console MSVC, `original/crackme.exe` |
| SHA-256 | `3d271299dcf18418b3e2be1006845a3dc8f5199bcf6ebbf2b49e44d1197075e9` |
| Prompt | UTF-16 `password :` |
| Longueur password | **1..39** octets |
| Tag attendu (C550 xor-dec) | `e6 a0 ef 22 84 73 41 65` |
| Flag bloc0 (toujours, indépendant du pwd) | UTF-16 **`Doğru! F`** (« Correct! » en turc) |
| Suite du flag | dépend du MAC / état pre-finalize → **besoin du password** |

Preuve crypto :
- Keystretch Unicorn ≡ Python/C (`ctx+320` MAC identique pour `hello world!`)
- Absorb VM + finalize → même état final que le modèle C
- Live x64dbg : MAC + pre-finalize dump matchent

---

## Prédicat (résumé)

1. **Pad** password → 40 octets (copie + `0x80` à `len`, zéros ensuite).
2. **Keystretch** 1000× : sponge ARX custom sur 16 octets (`K1`/`K2`), mélange avec `pad[16:32]` et `pad[32:40]`.
3. Contexte : `C510` xor-dec → absorb avec MAC + `pad[16:40]` + `uint64(128)` (7 blocs × 16).
4. Finalize : `state[0]^=0xD1`, `state[1]^=0x5E`, **8** rounds `K3`/`K4`.
5. Succès si `state[0:8] == TAG`.

Pour `len < 16`, `pad[16:40]` est tout zéro → chemin `check_short` (plus simple à porter GPU).

Détail algo + constantes : [`H100.md`](H100.md) · sources [`../tools/vmp_brute_mt.c`](../tools/vmp_brute_mt.c).

---

## Brutes déjà faits (CPU)

| Espace | Résultat |
|---|---|
| lowercase **len ≤ 4** | épuisé, rien |
| alnum **len ≤ 4** | épuisé, rien |
| digits (partiel) | rien |
| top 10k / top 100k | rien |
| wordlist turque maison (~900) | rien |
| lowercase **len 5** | stoppé à **~68.4 %** (`8126464/11881376`), ~10.5k/s × 8 threads, **pas de FOUND** |

Machine de test : i7-1185G7 8 threads, `tools/vmp_brute_mt` OpenMP.

**Reprise len5** (éviter de refaire 0–68 %) :

```bash
# index 0..26^5-1, ordre little-endian sur alphabet a-z
# (voir index_to_pw dans vmp_brute_mt.c)
./tools/vmp_brute_mt -l 5 -L 5 -s 8126464
```

---

## Outils locaux

```bash
cd authors/alpjs/6aa4b6d3585e8875bcbebf80
gcc -O3 -march=native -fopenmp -o tools/vmp_brute_mt tools/vmp_brute_mt.c
./tools/vmp_brute_mt 'candidate'          # OK / NO
./tools/vmp_brute_mt -l 5 -L 5            # brute a-z
./tools/vmp_brute_mt -w analysis/wordlist_tr.txt
./tools/vmp_brute_mt -a 'abcdefghijklmnopqrstuvwxyz0123456789' -l 5 -L 6
```

`tools/vmp_check.c` : version single-thread plus ancienne (même crypto).

---

## Pistes H100 / suite

1. Porter `keystretch` + `check_short` en **CUDA** (état 16 bytes, candidats indépendants) — voir [`H100.md`](H100.md).
2. Finir lowercase len5 puis len6 (`26^6 ≈ 308e6`).
3. Wordlist turque large / phrases autour de `Doğru`.
4. Known-plaintext sur blocs flag 1+ si on devine `Doğru! Flag{…}` / message turc.
5. x64dbg : patches anti-debug (PEB, window scan, INT3 loop) ; inject ReadConsoleW.

---

## Fichiers utiles

| Path | Rôle |
|---|---|
| `original/crackme.exe` | binaire |
| `original/crackme.exe.i64.c` | Hex-Rays |
| `tools/vmp_brute_mt.c` | référence CPU + brute OpenMP |
| `analysis/H100.md` | guide port GPU |
| `analysis/wordlist_tr.txt` | petites cibles TR |
