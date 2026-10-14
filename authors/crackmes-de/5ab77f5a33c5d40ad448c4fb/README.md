# kde_enableme1 — macabre (crackmes.de)

- Page : https://crackmes.one/crackme/5ab77f5a33c5d40ad448c4fb · [`ORIGIN.yml`](ORIGIN.yml)
- Plateforme : Linux ELF32 i386, **KDE 3.5.5 / Qt 3.3.7** (GUI), `libkdeui.so.4`, `libqt-mt.so.3`
- Archive : `original/kde-enableme1.tgz` → `kde-enableme1/enableme` + `Readme.txt`
- Règles de l'auteur : « Patching/hooking allowed. Level 1 » — activer le bouton **Enable Me** puis cliquer dessus

## Réponse

Il n'y a pas de clé : le bouton `RegisterBtn` est créé **désactivé** (`setEnabled(false)`). Patch (sur une copie) :

| vaddr | octets | → |
|---|---|---|
| `0x804cb5b` | `ff 50 54` (`call [eax+0x54]` = `QWidget::setEnabled(false)`) | `90 90 90` |
| `0x804cddb` | `ff 50 54` | `90 90 90` |

```bash
python3 -I tools/enableme-solve.py --check
# patch : 0x804cb5b, 0x804cddb  ff 50 54 -> 90 90 90   =>  analysis/kde-enableme1/enableme.patched
# check: OK (6 octets modifiés ; pas de KDE3 ici : preuve statique)
```

Cliquer le bouton affiche la boîte « **Good Job!!** — See that wasn't so hard. Now write a quick tutorial! ».

> Limite : KDE3/Qt3 est absent de la machine ; le binaire ne se lance pas ici. La preuve est statique (code + patch minimal).

## Premier regard

```text
$ ldd analysis/kde-enableme1/enableme | grep "not found" | head -3
libkdeui.so.4 => not found   libkdecore.so.4 => not found   libqt-mt.so.3 => not found
$ strings -n 6 analysis/kde-enableme1/enableme | grep -E "Enable|Good Job|RegisterBtn|ExitBtn"
Macabre's Lvl 1 Enable Me   VERY Simple KDE Enable ME   ExitBtn   RegisterBtn   Good Job!!
```

## Comment on trouve

**Ancrage** : `bash -ic 'decc enableme'` → `enableme.i64.c` (1086 lignes). `Form1::Form1` @`0x804cc60` crée deux `KPushButton` (`ExitBtn`, `RegisterBtn`) ; les `connect` relient `RegisterBtn.clicked()` à `register_click()` (affiche « Good Job!! ») :

```c
v10 = new KPushButton(this, "RegisterBtn");
(*(void (**)(KPushButton*, int))(vtable(v10) + 84))(v10, 0);   // vtable[+84 = 0x54] = QWidget::setEnabled(false)
```

En assembleur (deux fois, `Form1::Form1` et le constructeur généré par uic) :

```asm
804cb4d: mov  eax,[ebx]          ; vtable
804cb4f: xor  edx,edx            ; false
804cb54: mov  [esp+4],edx
804cb58: mov  [esp],ebx
804cb5b: call [eax+0x54]         ; setEnabled(false)   <- NOP ici
```

Sans cet appel le widget reste dans son état par défaut : **activé**. L'alternative (mettre `1` à la place de `xor edx,edx`) demande 5 octets (`mov edx,1`) ; neutraliser l'appel (3 octets) est plus simple.

**Pièges :**
- Deux sites identiques (`0x804cb5b` et `0x804cddb`) : copies du même constructeur (variantes du ctor généré, `Form1::Form1` / `Form1::Form1`-complet) ; on les patche toutes les deux par précaution, je n'ai pas pu exécuter le programme pour savoir laquelle est appelée.
- `QWidget::setEnabled` est virtuel (slot vtable `+0x54`), pas un appel direct : d'où l'absence de symbole dans le listing PLT.
- Le patch ne doit pas toucher l'original : `original/` intact, résultat dans `analysis/…/enableme.patched`.

## Fichiers

- `analysis/kde-enableme1/` : `enableme`, `Readme.txt`, `enableme.i64.c`, `dis.txt`, `enableme.patched` (généré)
- `tools/enableme-solve.py` : applique/valide le patch sur une copie
