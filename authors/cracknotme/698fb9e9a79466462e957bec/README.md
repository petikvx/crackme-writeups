# CrackNotMe's MCM 3.0 REWORK

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/698fb9e9a79466462e957bec) · id `698fb9e9a79466462e957bec`

Crackme **PE32+ console** x86-64 (MSVC), **packer XOR maison** + payload.  
Auteur site : **CrackNotMe** · suite de [MCM 1.0](../6989ed7dfb46458f1ef6cee4/) / [MCM 2.0](../698d9ebd3eb49a23d3417763/).

Dossier : `authors/cracknotme/698fb9e9a79466462e957bec/` — [série auteur](../README.md) · [repo](../../../README.md).

| Fichier | Rôle |
|---|---|
| [`original/CrackMe_packed.exe`](original/CrackMe_packed.exe) | binaire d’origine (stub + payload) |
| [`analysis/CrackMe_unpacked.exe`](analysis/CrackMe_unpacked.exe) | PE dépaqueté (reproductible via unpacker) |
| [`analysis/CrackMe_forceok.exe`](analysis/CrackMe_forceok.exe) | patch expérimental checksum `0x762` (pas une soluce) |
| [`analysis/wine-denied.txt`](analysis/wine-denied.txt) | Wine : mauvais password → `DENIED` |
| [`analysis/wine-honeypot.txt`](analysis/wine-honeypot.txt) | Wine : honeypot → pas de `DENIED` (souvent hang) |
| [`tools/mcm3-unpack.py`](tools/mcm3-unpack.py) | unpacker XOR → PE |
| [`tools/mcm3-solve.py`](tools/mcm3-solve.py) | honeypot / check / unpack / sonde Wine |
| [`README.md`](README.md) | ce write-up |

## État livré

| Couche | Statut |
|---|---|
| Packer custom XOR | **fait** (unpacker + PE) |
| Texte enfoui `S3rg0M_Admin_2024` | **identifié = honeypot** (pas `ACCESS GRANTED`) |
| Vrai password (mini-VM + checksum `0x762`) | **non terminé** |

> Commentaire site (clutchy) : le « buried text » est facile à rater — c’est bien cette chaîne. Sous reverse, le chemin associé affiche (côté logique) un message du type *Nice try… honeypot*, pas le succès d’intégrité/VM. L’auteur autorise aussi le patch, mais le considère plus facile / discutable.

---

## Réponse (honeypot, pas le gate final)

| Input | Valeur |
|---|---|
| Password honeypot | **`S3rg0M_Admin_2024`** (len `0x11`) |
| VA (unpacked) | `0x14000D838` |

```bash
python3 tools/mcm3-unpack.py
# wrote analysis/CrackMe_unpacked.exe (256000 bytes, MZ OK)

python3 tools/mcm3-solve.py -q
# S3rg0M_Admin_2024

python3 tools/mcm3-solve.py --check S3rg0M_Admin_2024
# OK
# (honeypot — pas le gate d'intégrité/VM)

printf 'nope\n' | wine original/CrackMe_packed.exe
# [-] FAILED. ACCESS DENIED.

printf 'S3rg0M_Admin_2024\n' | wine original/CrackMe_packed.exe
# (souvent) pas de DENIED — hang / chemin honeypot sous Wine
```

Password **réel** (succès VM + somme `0x762`) : **à trouver** — voir §5.

---

## 1. Premier regard

```text
file original/CrackMe_packed.exe
# PE32+ executable (console) x86-64, 6 sections
```

Banner (payload) :

```text
=== MCM v3.0 ===
Enter Password:
```

Échec classique : `[-] FAILED. ACCESS DENIED.`

Hashes (packed) :  
MD5 `35fec8b1ad8856f9083a332e0d6b9259` · SHA-256 `2baf205890340e7ff50119748da85692548e8132de714ce652e8ae9270685982`.

Page site : difficulty **3.0** · quality **5.0** · labels anti-debug / string encryption / packer / anti-tamper.  
Description auteur : *simple custom packer*, anti-patch / anti-debug « primitifs », chiffrement de strings léger ; patch autorisé mais « beaucoup plus facile ».

---

## 2. Packer

Stub d’entrée ~`0x140001000` :

1. `VirtualAlloc(NULL, 0x3E800, MEM_COMMIT|RESERVE, PAGE_READWRITE)`
2. Boucle (déroulée par 5) :
   `out[i] = key[i & 0x1F] ^ payload[i]`
3. `GetTempPathA` + `wsprintfA("%swct%08X.tmp", GetCurrentProcessId() ^ 0x4A3B2C1D)`
4. Écrit le PE, `CreateProcessA`, attend, `DeleteFileA`

| Élément | VA |
|---|---|
| Clé 32 octets | `0x14004DB60` |
| Payload | `0x14000F360` (taille `0x3E800`) |
| Format temp | `0x14004DB80` → `%swct%08X.tmp` |

Clé (hex) :

```text
726fe539dee2fc3cc3605b0ec5c0f1950b812b1b264c288c2c20b2163046af39
```

Unpack offline :

```bash
python3 tools/mcm3-unpack.py -o analysis/CrackMe_unpacked.exe
# SHA-256 unpacked (reproductible) :
# 9e1397b54c973f0508b7f18f3de8cbcd9538931582fab445b08dbb0ec913e068
```

---

## 3. Honeypot

Dans le PE dépaqueté, chaîne en clair :

```text
S3rg0M_Admin_2024   ; VA 0x14000D838, longueur 17 (0x11)
```

Check (~`0x140015A12`) :

```asm
cmp  r8, 0x11                 ; longueur exacte
jne  suite_reelle
lea  rdx, [S3rg0M_Admin_2024]
call strcmp_like              ; 0x140036250
test eax, eax
jne  suite_reelle
; … chemin « Nice try, cracker. That was a honeypot. ;) »
; Sleep(0xBB8) puis sortie — pas de SUCCESS
```

Sous Wine : un mauvais password affiche clairement `DENIED` ; le honeypot **ne réaffiche souvent pas** `DENIED` (processus qui reste bloqué après le prompt) — utile comme signal, même si le message honeypot console n’apparaît pas toujours.

---

## 4. Chemin « réel » (esquisse)

Après le honeypot, le flux continue vers anti-debug / timing (`rdtsc`/`cpuid`), construction de buffers dérivés du password, puis une **mini-VM** dont le retour attendu est **1**, suivi d’un checksum sur un buffer (~28 octets utiles) :

```asm
; ~0x140016746
xor  edi, 0x762          ; edi doit valoir 0x762 avant le xor
mov  ebx, edi
neg  ebx
or   ebx, edi
not  ebx
shr  ebx, 0x1f           ; ebx := 1 ⇔ somme OK
test ebx, ebx
je   fail
```

`analysis/CrackMe_forceok.exe` remplace `xor edi,0x762` par `xor edi,edi` + NOP : le test d’égalité à `0x762` est court-circuité (outil d’analyse, **pas** une solution password).

Autres pistes notées en reverse (non abouties ici) : constantes / paires du style `0xE159D15C`, env éventuelle `_HEAP_TRACE_FLAGS`, strings UI XOR. Brute FNV/CRC naïf sur ces constantes : sans succès.

---

## 5. Suite possible

1. Emuler / dumper le bytecode VM et le prédicat exact (comme MCM 1/2).
2. Relier password → buffer checksum `0x762` sans patch.
3. Confirmer `ACCESS GRANTED` / message de succès sous Wine ou Windows natif.
4. Alors : `status: solved` + password dans ce README.

---

## Notes

- Ne **pas** confondre le texte enfoui avec le password final : c’est le piège pédagogique du challenge.
- Le packed reste l’original ; tout PE dépaqueté / patché vit dans `analysis/`.
- MCM 1.0 → `y5` ; MCM 2.0 → `Z1Y` ; MCM 3.0 → packer + honeypot documentés, VM ouverte.
