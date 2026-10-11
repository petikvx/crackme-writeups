# Crackme13 (FireWorx)

| | |
|---|---|
| **ID** | [`5ab77f5433c5d40ad448c17c`](https://crackmes.one/crackme/5ab77f5433c5d40ad448c17c) |
| **Auteur (site)** | crackmes.de (réimport) — auteur original **FireWorx** |
| **Plateforme** | Windows, Win32 GUI, Delphi + ASPack 1.08 |
| **Difficulté** | 1.0 |
| **SHA-256 (zip)** | voir `ORIGIN.yml` |

## Solution

Un serial valide (le nom / `Edit2` n'est pas lu) :

```
1774248000
```

(équivalent : `-2070880024`, `665169820`, `1419377832`, … — tout `IntToStr(f(ebx))` avec `2 ≤ ebx ≤ longueur du serial`.)

Le nom d'exemple `petik` n'intervient pas.

## Premier regard

- Packé ASPack ; après dump mémoire Wine (`0x400000`), les RTTI Delphi donnent `Image2Click` → `0x4554B8`, caption de succès `Very good\r\nCRACKER!`.

## Comment on trouve

1. Dump du process Wine, localisation de `Image2Click` via la table de méthodes de `TForm1`.
2. Le handler lit uniquement `Edit1` (serial). Pour `ebx` de `2` à `Length(Edit1)` :
   - `eax = (ebx<<12) + ebx²`
   - `edx = eax - 0x3021 + 0x1C44A9A4 + eax²`
   - `ecx = eax + 0x29D8 - eax·edx·0x12499`
   - `edi = ecx·eax·0x12499·0x58 + 2 ; edi ^= 0xA ; edi += ecx`
   - `IntToStr(edi)` comparé au serial (`CompareStr`).
3. Au premier match : `ShowMessage` sur le caption de `Label1` (« Very good / CRACKER! »). `Edit2` n'est jamais consulté.

## Vérification

- Réimplémentation Python de `f` ([`tools/crackme13-solve.py`](tools/crackme13-solve.py)) : `f(4) = 1774248000`, et `2 ≤ 4 ≤ 10` (longueur du serial) — condition de boucle satisfaite.
- Désassemblage du handler dumpé : [`analysis/Image2Click.asm`](analysis/Image2Click.asm).
- GUI non pilotée ici (ASPack + clic sur `Image2`) ; la vérif suit le vrai code de `Image2Click` extrait du dump.

## Fichiers

- [`tools/crackme13-solve.py`](tools/crackme13-solve.py)
- [`analysis/Image2Click.asm`](analysis/Image2Click.asm)
