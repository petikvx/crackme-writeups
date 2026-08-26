# 23x41's DPRK Loyalty Evaluation

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/6a5995410b25d281a656896f) · id `6a5995410b25d281a656896f`

Crackme **ELF64 x86-64** dynamiquement lié, C++, **non strippé** (+ debug_info). Thème DPRK / quiz de loyauté avec **format string** et overflow dans le mode « self-criticism ».
Auteur : [23x41](https://crackmes.one/user/23x41).

Dossier : `authors/23x41/6a5995410b25d281a656896f/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`juche_loyalty_test`](original/juche_loyalty_test) | binaire d’origine |
| [`README.md`](README.md) | ce write-up |
| [`juche-solve.py`](tools/juche-solve.py) | flag + leak + overflow ret2grant |

## Réponse

| | |
|---|---|
| **Flag** | `FLAG{0x8A7_JUCHE_FORMAT_STRING_MASTERY}` |
| **Q1** | `38` |
| **Q2** | `Mount Paektu` |

```bash
python3 tools/juche-solve.py -q
python3 tools/juche-solve.py --leak    # %32$p.%33$p → Mount Pa / ektu+38
python3 tools/juche-solve.py --check   # overflow → grant (live)
```

> **Piège Q2** : `cin >> buf` coupe sur l’espace → on ne peut pas saisir `Mount Paektu` d’un bloc. Chemin live : échouer une question → overflow dans `self_criticism_mode` → `grant_party_membership`.

---

## 1. Premier regard

```text
file original/juche_loyalty_test
# ELF 64-bit LSB executable, x86-64, dynamically linked, with debug_info, not stripped

sha256: f2df11e5e1b394da5a7c66a67e58970d4c89f3622f07827464114fb85813616f
```

| Propriété | Valeur |
|---|---|
| Plateforme | Linux x86-64 |
| Langage | C++ (libstdc++) |
| PIE | non (`ET_EXEC`) |
| Canary | non |
| Anti-debug | `ptrace(0,0,0,0)` — **cosmétique** (message seulement) |

Symboles utiles :

| Symbole | VA |
|---|---|
| `grant_party_membership()` | `0x4011a6` |
| `self_criticism_mode()` | `0x401239` |
| `take_loyalty_test()` | `0x4012e4` |
| `main` | `0x40141a` |

Flag déjà en clair dans `.rodata` (`0x4020b0`) — le challenge vise le **format string / leak** (et le ret2grant en bonus).

---

## 2. Flow

```text
main
  ptrace(...)           ; si debugger → warning, continue quand même
  banner DPRK
  take_loyalty_test()
  "[LOG] Session terminated..."

take_loyalty_test
  stack : ans1="38", ans2="Mount Paektu"   (immédiats)
  Q1 → cin >> buf ; strcmp(buf, "38")
       fail → self_criticism_mode ; return
  Q2 → cin >> buf ; strcmp(buf, "Mount Paektu")
       fail → self_criticism_mode ; return
  ok  → grant_party_membership()

grant_party_membership
  victory messages + FLAG
  system("/bin/sh")

self_criticism_mode
  getline(cin, buf, 0xc8)     ; frame 0x80 seulement
  printf(buf)                 ; format string
```

---

## 3. Prédicat

### Construction des réponses (stack)

```asm
; Q1
mov  WORD PTR [rbp-0x3], 0x3833   ; "38"
mov  BYTE PTR [rbp-0x1], 0

; Q2 (deux movabs qui se chevauchent)
movabs rax, 0x615020746e756f4d    ; "Mount Pa"
mov    [rbp-0x10], rax
movabs rax, 0x75746b65615020      ; " Paektu\0"
mov    [rbp-0xb], rax             ; → "Mount Paektu"
```

### Format string

`printf(user_buf)` sans format fixe. Après un mauvais Q1, les réponses parent sont encore sur la stack :

| Slot | Valeur (LE) | ASCII |
|---|---|---|
| `%32$p` | `0x615020746e756f4d` | `Mount Pa` |
| `%33$p` | `0x38330075746b65` | `ektu\0` + `38` |

```bash
python3 tools/juche-solve.py --leak
# leak   : 0x615020746e756f4d.0x38330075746b65
# ascii  : ['Mount Pa', 'ektu.38.']
```

### Overflow → ret2grant

`getline(..., 0xc8)` dans une frame de `0x80` → `ra` à l’offset **`0x88`**.

```python
payload = b"A" * 0x88 + struct.pack("<Q", 0x4011A6)  # grant_party_membership
# stdin :  mauvaise_Q1\n + payload\n
```

Pas de PIE → adresse fixe. `system("/bin/sh")` plante ensuite (stack déjà corrompue) ; avec `stdbuf -o0` le **FLAG** est bien flushé avant.

---

## 4. Vérification

```bash
python3 tools/juche-solve.py --check
# [GLORIOUS VICTORY]
# ...
# FLAG{0x8A7_JUCHE_FORMAT_STRING_MASTERY}
# OK

python3 tools/juche-solve.py --leak
# OK
```

Q1 seul fonctionne en live (`38`). Q2 via `>>` : **FAIL** systématique (espace).

---

## 5. Notes

- Anti-debug `ptrace` : pure atmosphère, n’interrompt pas le quiz.
- Flag en clair + `grant` trivial : possible de « cheeser » via `strings` / GDB (`$eax=0` sur `strcmp`, vu sur crackmes.one).
- Le vrai exercice pédagogique = **leak format-string** des réponses stack.
- Le bug `operator>>` / espace sur Q2 est un défaut du challenge (signalé en commentaire site) ; le ret2grant contourne proprement.
- Pas de username `petik` (quiz, pas keygen).
