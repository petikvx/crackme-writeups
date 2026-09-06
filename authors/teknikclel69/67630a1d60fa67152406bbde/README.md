# Teknikclel69 — hell

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/67630a1d60fa67152406bbde) · id `67630a1d60fa67152406bbde`

PE32+ console MinGW : 2ᵉ argument obligatoire, puis mot de passe **lettre par lettre**.  
Auteur : [Teknikclel69](https://crackmes.one/user/Teknikclel69).

| Fichier | Rôle |
|---|---|
| [`hell.exe`](original/hell.exe) | binaire |
| [`hell-solve.py`](tools/hell-solve.py) | séquence + `--check` (doc live) |

## Réponse

| | |
|---|---|
| Ligne de commande | **`hell.exe c`** (`argc == 2`, 1ʳᵉ lettre du 2ᵉ token = `c`) |
| Mot de passe (15 lignes) | **`l i c r f t s d e b a v f q r`** |

```bash
# Windows (console) :
hell.exe c
# puis Entrée après chaque lettre :
l
i
c
r
f
t
s
d
e
b
a
v
f
q
r
# → You did the thing no way!!! …
```

```bash
python3 tools/hell-solve.py -q
# licrftsdebavfqr
python3 tools/hell-solve.py --lines   # prêt à piper sous Windows natif
```

---

## 1. Premier regard

```text
PE32+ executable (console) x86-64, MinGW
sha256: caf7a3c83eb5aa11f8602688a07808cd9ee881c173c8030a467f0b80c9e928b8
```

Sans le bon argv : message leurre *Try to find the second command line argument…*

---

## 2. Flow (confirmé x64dbg)

```text
main:
  [rsp+8] / ecx == 2  sinon → message leurre
  GetCommandLineA → skip argv0 → cmp 1 octet avec 'c' @ .data "m"
  sinon → leurre
  puts(prompt password)
  phase1: walk arrière 17 pas depuis 0x…4166, scanf si byte∈[A,DEL]
           attendus: l i c r f t s d
  phase2: idem depuis BSS 0x…90b0 (chars movq r/q/f/v/a/b/e)
           attendus: e b a v f q r
  succès: printf "You did the thing no way!!! …"
```

Live x64dbg : `InitDebug hell.exe, "c"` → PEB cmdline `…hell.exe" c`, `argc=2`, entrée dans la boucle password (1ʳᵉ attente = `'l'`), chemin succès @ `main+0x1844` → chaîne *You did the thing…*.

**Note Wine** : sous Linux, `argc`/cmdline ne se comportent pas comme sur Windows natif — preuve live = Windows / x64dbg.

---

## 3. Vérification

```bash
python3 tools/hell-solve.py --check
# argv + 15 lignes + rappel BP succès
```

Sous Windows natif : `hell.exe c` + les 15 lettres.

---

## 5. Notes

- Famille : [silly](../65afe04ceef082e477ff6026/) (`chicken baguette`).
- Les `movq` init (`r q f v a b e`) et les lettres `.data` (`d s t f r c i l`) sont du « ASCII éclaté » typique NASM débutant.
