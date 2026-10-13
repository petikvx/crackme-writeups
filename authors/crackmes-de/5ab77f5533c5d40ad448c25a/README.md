# crackmes.de's xdstylas_crackme_1 by xdstyla

| | |
|---|---|
| **ID** | [`5ab77f5533c5d40ad448c25a`](https://crackmes.one/crackme/5ab77f5533c5d40ad448c25a) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur (site)** | crackmes.de (auteur réel : xdstyla) |
| **Plateforme** | Windows PE32 console, MSVC 2008 (C++ / STL) — classé « (Visual) Basic » sur le site, à tort |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | `1afb03c24a11c08ffcbf3f13a7b233915877333f38bebf7b23d38770942efc79` |
| **SHA-256 (exe)** | `ed90ba2711c144ec3b598e4fe1df6b862cfb4a1655f5e79d418b64fd3b87000a` |

## Fichiers

| Chemin | Contenu |
|---|---|
| `original/Crackme1.zip` | archive d’origine (mot de passe site `crackmes.one`) |
| `original/Crackme1.exe` | binaire (extrait du zip, non patché) |
| `original/Readme.txt` | « There's ony one right Serial. » |
| `tools/xdstylas-crackme1-solve.py` | solveur (`-q`, `--check`, `--wine`) |
| `analysis/wine-verify.txt` | transcript Wine (OK + 2 KO) |

## Réponse

**Serial : ``x{xap}p}`w{zsfu`n``** (17 caractères ; pas de nom, donc pas d’exemple `petik` — `petik` donne `Noo0O0oo!`).

```bash
./tools/xdstylas-crackme1-solve.py -q      # x{xap}p}`w{zsfu`n
./tools/xdstylas-crackme1-solve.py --wine  # Serial: Right
```

Attention au shell : le serial contient un backtick et des accolades → le passer entre **quotes simples**.

## Premier regard

```text
$ diec original/Crackme1.exe
PE32 — Linker: Microsoft Linker(9.00.30729) — Compiler: Microsoft Visual C/C++(15.00.30729)[C++] — VS2008
$ strings -t x original/Crackme1.exe | grep -A3 'Serial: '
  12ba8 Serial:
  12bb4 loludiditcongratz
  12bc8 Right
  12bd0 Noo0O0oo!
```

Malgré l’étiquette « (Visual) Basic » de crackmes.one, c’est du C++ MSVC avec `std::cin` / `std::string`, pas du VB6.
La chaîne `loludiditcongratz` saute aux yeux… et c’est le **piège** : la taper donne `Noo0O0oo!`.

## Flow

`Serial: ` → `cin >> s` → transformation → comparaison → `Right` / `Noo0O0oo!`.

## Comment on trouve le prédicat

### 1. Ancrage

Offset fichier `0x12BB4` → VA `0x4141B4` (section `.rdata`). `objdump -d -M intel` + `grep 4141b4` → une seule xref, dans la fonction `main` @ `0x402990`.

### 2. Lecture de `main` (extraits commentés)

```asm
4029a2  push 0x4141a8 ; push 0x41a590 (cout) ; call 0x4025b0   ; cout << "Serial: "
4029b6  push 0x11                                                ; longueur 17
4029bd  push 0x4141b4                                            ; "loludiditcongratz"
4029de  call 0x401d70                                            ; std::string ref(…, 17)
4029e8  push 0x41a4f4 (cin) ; call 0x4027b0                      ; cin >> s
; --- boucle sur les itérateurs de s (checks _SECURE_SCL autour : call 0x404b77 = invalid_parameter)
402adb  mov  al, [ebx]           ; c = *it
402add  xor  al, 0x14            ; c ^ 0x14
402ae9  call 0x401be0            ; t.append(1, c ^ 0x14)
402b24  inc  ebx                 ; ++it
; --- comparaison t vs ref
402b5e  call 0x401040            ; memcmp-like sur min(len)
402b68  cmp eax,0 / cmp len_t,len_ref / setne  -> égalité stricte (contenu ET longueur)
402b7b  push 0x4141c8            ; "Right"
402b82  push 0x4141d0            ; "Noo0O0oo!"
```

Tout le « bruit » entre `0x402a09` et `0x402ab6` (comparaisons `cmp ecx,0x10`, `lea eax,[esp+0x14]`) est juste l’inlining de `std::string` (SSO : buffer interne si capacité < 16) et des itérateurs checkés de VS2008 — à ignorer.

### 3. Décodage

Prédicat : `xor(s, 0x14) == "loludiditcongratz"` ⇒ `s = "loludiditcongratz" ^ 0x14` (XOR involutif) :

| clair | l | o | l | u | d | i | d | i | t | c | o | n | g | r | a | t | z |
|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|---|
| ^0x14 | x | { | x | a | p | } | p | } | ` | w | { | z | s | f | u | ` | n |

→ ``x{xap}p}`w{zsfu`n``. Tous imprimables et sans espace, donc compatibles avec `cin >>` (qui s’arrête au premier blanc).

## Vérification (Wine, console)

```text
$ printf '%s\n' 'x{xap}p}`w{zsfu`n' | wine Crackme1.exe
Serial: Right
$ printf '%s\n' 'petik' | wine Crackme1.exe
Serial: Noo0O0oo!
$ printf '%s\n' 'loludiditcongratz' | wine Crackme1.exe
Serial: Noo0O0oo!
```

(voir [`analysis/wine-verify.txt`](analysis/wine-verify.txt))

## Notes

- Ce n’est **pas** un crackme VB malgré la fiche crackmes.one.
- Piège : la chaîne en clair est la version *chiffrée* attendue après XOR, pas le serial.
- Le serial est unique (comparaison longueur + contenu), conforme au Readme.
