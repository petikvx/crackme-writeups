# ShadowLegion — VaultBreaker

| | |
|---|---|
| **ID** | [`69fba1198fab7bbca27300f2`](https://crackmes.one/crackme/69fba1198fab7bbca27300f2) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | ShadowLegion |
| **Plateforme** | Linux ELF64 PIE, non strippé, C++ / Qt6 (GUI) |
| **Difficulté** | 1.8 |
| **SHA-256** | `017028cb927b173dee8a470c4deff2b71018d93a1b42bb1a38886ba6e85dbe3c` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/VaultBreaker` | binaire (téléchargé directement, pas de ZIP) |
| `tools/vaultbreaker-solve.py` | décodage du mot de passe |
| `tools/gdb-call-checkpassword.py` | script gdb : appelle `CheckPassword` en live (preuve) |

## Réponse

```bash
python3 tools/vaultbreaker-solve.py -q
# Op3nS3same
```

| Mot de passe |
|---|
| **`Op3nS3same`** |

## Premier regard

```bash
file original/VaultBreaker
# ELF 64-bit LSB pie executable, not stripped
nm -C original/VaultBreaker | grep " T "
#   MainWindow::OnUnlockClicked()
#   MainWindow::CheckPassword(QString const&)
strings -n 6 original/VaultBreaker | grep -iE "vault|access|unlock"
```

Binaire **non strippé** : les noms C++ démanglés donnent directement la fonction de vérification, `MainWindow::CheckPassword(QString const&)` — pas besoin de chercher le prédicat à l'aveugle. Chaînes : `VAULT LOCKED`, `VAULT UNLOCKED!`, `Congratulations, you cracked it.`, `INVALID ACCESS CODE`.

## Flow

GUI Qt : un champ `QLineEdit` + bouton `[ UNLOCK ]`. Le clic appelle `MainWindow::OnUnlockClicked()`, qui lit le texte du champ et appelle `CheckPassword(text)` ; si vrai → `QMessageBox::information` avec « VAULT UNLOCKED! Congratulations, you cracked it. », sinon « INVALID ACCESS CODE ».

## Comment on trouve

**Ancrage.** MCP `ida` (headless, pas de `decc` complet nécessaire) :

```python
f = db.functions.get_by_name("_ZN10MainWindow13CheckPasswordERK7QString")
db.pseudocode.get_text(f)   # -> 0x38a0
```

**Lecture** (pseudo-C Hex-Rays, nettoyé) :

```c
bool MainWindow::CheckPassword(QString const& pw) {
    if (pw.length() != 10)
        return false;
    QByteArray decoded(10);
    for (int i = 0; i < 10; ++i)
        decoded[i] = kEncoded[i] ^ 0x5A;     // XOR fixe
    QByteArray input = pw.toUtf8();
    return input.size() == 10 && memcmp(input.data(), decoded.data(), 10) == 0;
}
```

`kEncoded` est une constante `static` de 10 octets dans `.rodata`. Toujours via le MCP `ida` :

```python
import ida_name, ida_bytes
addr = next(ea for ea, n in db.names.get_all() if n == "_ZL8kEncoded")  # 0x5818
ida_bytes.get_bytes(addr, 10).hex()   # 152a69340969293b373f
```

**Décodage.** XOR chaque octet par `0x5A` :

| i | `kEncoded[i]` | `^0x5A` | ASCII |
|---|---|---|---|
| 0 | `0x15` | `0x4F` | `O` |
| 1 | `0x2A` | `0x70` | `p` |
| 2 | `0x69` | `0x33` | `3` |
| 3 | `0x34` | `0x6E` | `n` |
| 4 | `0x09` | `0x53` | `S` |
| 5 | `0x69` | `0x33` | `3` |
| 6 | `0x29` | `0x73` | `s` |
| 7 | `0x3B` | `0x61` | `a` |
| 8 | `0x37` | `0x6D` | `m` |
| 9 | `0x3F` | `0x65` | `e` |

→ **`Op3nS3same`**.

**Pièges.**
- Le XOR est appliqué **à l'affichage dans le pseudo-code** octet par octet dans une boucle (`reallocData` à chaque itération dans le QByteArray) — bruité par la gestion mémoire Qt, mais la logique se réduit à un simple XOR constant une fois qu'on ignore les appels `QArrayData`/`_InterlockedSub` (refcounting Qt, sans effet sur le prédicat).
- La vérif de longueur (`a2+16 == 10`, offset du champ `size` d'une `QString`) est une garde **avant** le calcul — un mot de passe de longueur différente de 10 est rejeté sans même comparer.
- Binaire Qt_6.11 : voir section GDB pour le contournement nécessaire à l'exécution locale.

## Debug GDB (pas à pas)

Script complet : [`tools/gdb-call-checkpassword.py`](tools/gdb-call-checkpassword.py) (prérequis et recette de patch de version documentés en tête du fichier).

Le binaire lié à `Qt_6.11` ne démarre pas sur un système avec Qt 6.10 (`version 'Qt_6.11' not found`). Sur une **copie de travail** (hors `original/`), on réécrit la chaîne de version `Qt_6.11\0` → `Qt_6.10\0` dans `.dynstr` et le `vna_hash` ELF correspondant (même recette que pour [segfaults/Jame's Cybersecurity Company](../../segfaults/6a0c8b608fab7bbca2730221/README.md) — ce binaire a en revanche déjà un `PT_INTERP` standard `/lib64/ld-linux-x86-64.so.2`, pas besoin de le patcher).

```bash
gdb -q -batch -ex "source tools/gdb-call-checkpassword.py" ./vb_patched
```

1. `break main` + `run` (offscreen, `QT_QPA_PLATFORM=offscreen`) : base PIE lue via `info proc mappings`.
2. `CheckPassword` attend une `QString const&` ; on la construit avec la fonction du binaire lui-même, `QString::fromUtf8(QByteArrayView)` — évite de ré-implémenter l'ABI interne de `QString`. Point important découvert empiriquement : `QByteArrayView` est `{ qsizetype size; const char *data; }` dans cet ordre (l'ordre inverse fait planter l'appel avec un `std::terminate`).
3. `CheckPassword(this, &qstring)` n'utilise jamais `this` → on l'appelle avec `0`.
4. Résultat observé pour 4 candidats :

```
PROOF petik       False
PROOF Op3nS3same  True
PROOF 0123456789  False
PROOF AAAAAAAAAA  False
```

Confirme à l'exécution le prédicat lu statiquement : seul `Op3nS3same` passe.

Pièges : symbole `fromUtf8` d'abord tenté via l'adresse du symbole dynamique non résolu (`0x7370`, tout à zéro avant liaison) → utiliser l'adresse du **stub `.plt`** réel (`0x3180`) ; `QT_QPA_PLATFORM=offscreen` indispensable (pas d'affichage sur la machine de reverse).

## Vérification

```bash
python3 tools/vaultbreaker-solve.py -q
# Op3nS3same
```

GUI (sur une machine avec Qt 6.11, ou la copie patchée + `xvfb-run`) : saisir `Op3nS3same` dans le champ puis `[ UNLOCK ]` → « VAULT UNLOCKED! Congratulations, you cracked it. ». Tout autre texte (ex. longueur ≠ 10, ou 10 caractères faux) → « INVALID ACCESS CODE ».

## Notes

- Pas de patch binaire : la vérification `--check` équivalente est l'appel direct de `CheckPassword` en mémoire sous gdb (section précédente), fidèle au binaire d'origine.
- `kEncoded` + XOR fixe n'est pas un chiffrement robuste : une seule clé constante (`0x5A`) pour les 10 octets, triviale à inverser dès qu'on a le tableau encodé.
