# libertyordeaths_keygenme_3 by libertyordeath (crackmes.de / LibertyorDeath)

- **Page** : [crackmes.one](https://crackmes.one/crackme/5ab77f5433c5d40ad448c193) — publié le 2018-03-25, difficulté 2.0
- **Plateforme** : Linux ELF 32 bits (GCC 4.2.3, C++/libstdc++, strippé)
- **Protection** : « Serial with a trick or two » : le serial dépend du **nom** et du **hostname** de la machine, chaînes chiffrées, anti-debug `ptrace`.

## Solution (keygen)

```
A = boucle sur hostname[1..] : v <<= 1 à chaque tour ; à un index impair, v = hostname[i] (signé)
L = strlen(hostname)
B = c * i * L pour le DERNIER caractère c du nom d'index pair i (i = 0, 2, 4…)
serial = str(A + B) + "-" + hostname[0::2]
```

Exemple sur la box (hostname `grok-bot-vm-411329652`, L = 21) :
`A = '5'(53) << 2 = 212`, nom `petik` → `B = 'k'(107)·4·21 = 8988` → **`petik` → `9200-go-o-m41262`**.

Vérifié en natif : `petik`, `ab`, `HackSoftInternational`, `ZZZZZZZZZZZZ` → « Yay Good Job! » ; serial faux → « Nope Sorry. ». (Les exemples du keygen d'origine dépendent du hostname de l'auteur.)

## Comment on trouve

1. `strings` donne des chaînes illisibles (`^f~%Ltti%Otg&`, `6<8=2<;<;2hwfhpji`…) : chaque octet est **+5**. Décodées : `Yay Good Job!`, `Nope Sorry.`, `Input name: `, `Input serial: ` et un leurre `1738-7676-cracked`.
2. Imports parlants : `gethostname`, `ptrace`, `_IO_getc`, `sprintf`, `strncat`, `strncmp`.
3. `0x8048700` : `ptrace(PTRACE_TRACEME)` ; si < 0 (débogueur), `[0x80494ec] = 0x4b`, ce qui fait partir le programme sur une autre branche (`0x8048a18`).
4. `0x8048800` (génération) : `gethostname`, calcul de `A` (`shl [ebp-0x220],1` à chaque tour, `mov [ebp-0x220], al` aux index impairs), puis lecture du nom caractère par caractère avec `getc` jusqu'à `\n` : aux index pairs `B = c * idx * L` (`imul eax,ebx / imul eax,esi`).
5. `sprintf("%d", A+B)`, ajout de `-`, puis `strncat` des caractères pairs du hostname.
6. Le serial attendu et la saisie sont tous deux « chiffrés » +5 puis comparés par `strncmp(attendu, saisie, strlen(attendu))` (`0x804875a`).

## Debug GDB (pas à pas)

Pour « pêcher » le serial : neutraliser `ptrace` et lire les arguments de `strncmp` (`tools/crackmes-de-libertyordeaths_keygenme_3-fish.gdb`) :

```gdb
b *0x804872a          # retour de ptrace
commands
  silent
  set $eax=0          # fait croire qu'il n'y a pas de débogueur
  c
end
b *0x804875a          # call strncmp
commands
  silent
  x/s *(char**)$esp       # serial attendu (+5)
  x/s *(char**)($esp+4)   # saisie (+5)
  p *(int*)($esp+8)       # longueur comparée
  c
end
run < in.txt
```

Sortie avec `petik` : `">7552lt2t2r967;7"` → chaque octet −5 → `9200-go-o-m41262`.

## Reproduire

```bash
python3 tools/crackmes-de-libertyordeaths_keygenme_3-solve.py petik          # hostname local
python3 tools/crackmes-de-libertyordeaths_keygenme_3-solve.py petik ubuntu   # → 2802-uut
printf 'petik\n%s\n' "$(python3 tools/crackmes-de-libertyordeaths_keygenme_3-solve.py petik)" | ./Keygenme_v3
```
