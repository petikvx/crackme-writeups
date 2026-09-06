# toasterbirb — off_by_one

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/68692100aadb6eeafb398fd3) · id `68692100aadb6eeafb398fd3`

Crackme **ELF64** NASM static/stripped. Dispatcher par **table d’adresses + 1**, prédicat sur 8 octets.  
Auteur : [toasterbirb](https://crackmes.one/user/toasterbirb).

Dossier : `authors/toasterbirb/68692100aadb6eeafb398fd3/` — [famille](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`off-by-one`](original/off-by-one) | binaire d’origine |
| [`off-by-one-solve.py`](tools/off-by-one-solve.py) | keygen + `--check` |

## Réponse

| | |
|---|---|
| Passphrase | **`DXUPWYfU`** |

```bash
python3 tools/off-by-one-solve.py -q
# DXUPWYfU

printf 'DXUPWYfU' | ./original/off-by-one
# Passphrase: Yes! You found the correct passphrase ヽ(・∀・)ﾉ

python3 tools/off-by-one-solve.py --check
```

---

## 1. Premier regard

```text
ELF 64-bit LSB executable, x86-64, statically linked, stripped
sha256: f6ce1665a3ae011f0cad79cb7cc73a3ab6c38795c74a16c777c601f1f87b04dd
```

```text
Passphrase: 
Yes! You found the correct passphrase …
The given password is unfortunately incorrect
```

---

## 2. Flow (off-by-one)

En tête de `.text`, une **table de qwords** (adresses de stubs). Au boot :

```text
r12 = ([rsp] >= 0) ? 1 : 0     # argc typiquement ≥ 1 → r12 = 1
push table[i]
[rsp] += r12                   # adresse + 1
ret                            # « call » vers stub+1
```

Chaque transition CFG saute donc **un octet trop loin** dans le stub suivant — d’où le titre. Les vrais handlers commencent juste après un octet « padding » / fin d’instruction précédente.

`read(stdin, buf@0x402000, 0x1e)` puis boucle de vérif.

---

## 3. Prédicat

Pointeur secret `r11 = 0x401069` = début de la string d’**échec** `"The given password…"`.

Pour `i = 0..7` :

```text
dl = (secret[i] % 0x40) + 0x30
accepte ⇔ input[i] == dl
```

| secret (`The give`) | %64 | +`0x30` |
|---|---|---|
| T h e [sp] g i v e | … | **`DXUPWYfU`** |

Utiliser le message d’erreur comme oracle est cohérent avec le thème « off by one » (mauvais pointeur / mauvaise string).

---

## 4. Debug GDB (pas à pas)

Static / stripped, **pas de PIE**. L’entrée n’est pas le début de `.text` : la table d’adresses occupe `0x401000`…, l’entry est `0x401030`.

### 4.1 Voir le trampoline « +1 »

```bash
gdb -q ./original/off-by-one
(gdb) starti
(gdb) x/15i $rip
```

Tu dois voir quelque chose comme :

```text
0x401030:  mov    r12, [rsp]      ; argc
0x401034:  cmp    r12, 0
0x401038:  setge  r12b           ; → 1 en run normal
0x40103c:  push   0x401000
0x401043:  add    [rsp], r12     ; adresse + 1
… pushes similaires …
0x401068:  ret                   ; « call » stub+1
```

Pour **vérifier** l’off-by-one dynamiquement :

```text
(gdb) break *0x401068
(gdb) run < /dev/null
(gdb) x/gx $rsp          # adresse empilée = table[…] + 1
(gdb) stepi              # land dans le stub décalé
(gdb) x/i $rip
```

Sans le `+1`, tu tomberais sur le **premier octet** du stub (souvent padding / fin d’insn) — d’où le titre.

### 4.2 Atterrir sur la boucle de vérif

Après les trampolines + `read` stdin → buffer `@0x402000`, le check est vers `0x4010a4` :

| Adresse | Instruction / rôle |
|---|---|
| `0x4010b1` | `mov r11, 0x401069` → pointeur « secret » = **début du message d’échec** |
| `0x4010c4` | `mov r10b, [r11]` |
| `0x4010d0` | `div rbx` avec `rbx=0x40` → reste dans `dl` |
| `0x4010d3` | `add dl, 0x30` |
| `0x4010d6` | `cmp [0x402000+rcx], dl` |
| `0x4010dc` | `jne` → fail |

Astuce GDB : `x/s 0x401069` montre `"The given password is unfortunately incorrect\n"` — le prédicat **lit** cette string.

### 4.3 Dump tour par tour (oracle live)

```bash
printf 'AAAAAAAA' > /tmp/obo-wrong.in
gdb -q ./original/off-by-one
(gdb) break *0x4010d6
(gdb) commands
> silent
> printf "i=%d expect='%c' (0x%02x) got=0x%02x\n", \
    (int)$rcx, (int)($rdx & 0xff), (unsigned)$rdx & 0xff, \
    *(unsigned char *)(0x402000 + $rcx)
> continue
> end
(gdb) run < /tmp/obo-wrong.in
```

Tu obtiens les 8 octets attendus : **`DXUPWYfU`**. Relance avec ce password :

```bash
printf 'DXUPWYfU' > /tmp/obo.in
(gdb) run < /tmp/obo.in
# chaque tour : expect == got → fin → message succès
```

### 4.4 Break succès

Le chemin OK finit vers l’impression de `"Yes! You found…"` (zone string ~`0x4010f0`). Breaker sur le `write` / après la boucle (`je 0x401129` quand `rcx==8`) pour confirmer sans spammer le terminal.

---

## 5. Vérification

```bash
printf 'DXUPWYfU' | ./original/off-by-one
# Yes! You found the correct passphrase
```

---

## 6. Notes

- Exit code peut rester `1` même en succès (syscall `exit` / registre) — se fier au message.
- Suite série : `branchless branching`, `branchless`, `jump`, `branchless-fixed`.
