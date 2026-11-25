# prolokmn2's Figger V2

| | |
|---|---|
| **ID** | [`6a9539f948cda5a2aaa3dc49`](https://crackmes.one/crackme/6a9539f948cda5a2aaa3dc49) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | prolokmn2 |
| **Plateforme** | Windows PE64 console (MinGW, code obfusqué) |
| **SHA-256** | `c18024015506328349ffa345a61d64c3aa518daec852b1267374fcb7c9cea760` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/figger.exe` | binaire d'origine (non modifié) |
| `tools/figger-solve.py` | keygen (`-q`, `--check`, `--t N`) |

## Réponse

Aucun nom d'utilisateur : les deux clés ne dépendent que de l'heure (fenêtre de 30 s), donc pas d'exemple `petik`.

```bash
python3 -I tools/figger-solve.py          # Key A / Key B pour la fenêtre courante
python3 -I tools/figger-solve.py -q       # "A B"
python3 -I tools/figger-solve.py --check  # lance figger.exe sous Wine avec ces clés
```

Exemple (fenêtre `t = 59852360`) : `Key A = keygen(t,1)`, `Key B = keygen(t,2)` ; le solveur les calcule à la volée. Le binaire accepte la fenêtre courante **et la précédente** (`t` et `t-1`), donc lancer le solveur juste avant le crackme suffit.

## Premier regard

- `file` : PE32+ x86-64 console, MinGW (`diec` : MinGW [debug]).
- `strings` ne montre pas les messages du jeu : ils sont chiffrés (déchiffrés au démarrage, voir plus bas). Au lancement : `== FiggerV2 ==`, `window = N`, `two keys required.`, `Key A :`, `Key B :`, puis `Access granted` / `Access denied.`

## Flow

`main` (`0x140001820`) :

1. `fig_deobf_strings` (`0x1400020ce`) déchiffre les chaînes in place ;
2. `fig_is_debugged` (`0x140002077`) : `PEB.BeingDebugged | (NtGlobalFlag & 0x70)` → `exit(2)` si débogué ;
3. `t = time(NULL) / 30` (`fig_now` = `time`, divisé par `0x1e`) ;
4. affiche `window = t % 1000000` ;
5. lit `Key A`, `Key B` (`scanf(" %255s")`) ;
6. `okA = (A == str(keygen(t,1))) || (A == str(keygen(t-1,1)))`, idem `okB` avec l'indice 2 ;
7. si `okA && okB && !debugged` → « Access granted », sinon « Access denied. ».

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn original/figger.exe`, symboles MinGW conservés (`main`, `fig_fn_keygen @ 0x140001450`, `fig_i2s`, `fig_concat`, `fig_now`…). Pas de GDB ni d'IDA : lecture statique + preuve Wine.

**Pièges de lecture**

- Le code est un compilateur « pile » (`push rax / pop rcx / imul`) bourré de *prédicats opaques* : `rax=rsp; r10=rax*rax+rax; and r10,1; je/jne` suivi d'un `call` vers des adresses absurdes et d'octets poubelle. `rsp*(rsp+1)` est toujours pair, donc le saut est toujours pris et le bloc poubelle n'est jamais exécuté. Il faut **ignorer ces blocs** et redésassembler depuis la cible du saut : objdump décale parfois le décodage (en `0x1400015c9` le vrai code est `mov rax,[rbp+0x10]; push rax`, masqué par le décodage du `call` poubelle).
- Les chaînes sont chiffrées : table de `(ptr, len)` en `0x1400040a1`, octet `i` déchiffré par `d = ((s[i] ^ (0xa5 - 13*i)) ror 3) ^ (31*i + 0x5a)` (octets 8 bits). Les quatre « tags » `0x140004069..6c` sont des chaînes vides, donc la clé saisie est juste le nombre décimal (`%lld`).
- Un premier jet du keygen sans le terme `t` dans la boucle ne passait pas : c'est ce `mov rax,[rbp+0x10]` caché par le décodage poubelle.

**`fig_fn_keygen(t, idx)`** (arguments sur la pile : `[rbp+0x10]=t`, `[rbp+0x18]=idx`), arithmétique 64 bits, `%` = `idiv` (tout reste positif) :

```text
h = (0x811c9dc5 + idx*0x9e3779b1) % 0x7fffffff
g = (0x57984997 + idx*0x9e37)     % 0x7fffffed
pour i = 0..39 :
    tmp = (t + i*0x9e3779b1 + idx) % 0xfffffffb
    h   = (h*0x1000193 + tmp)      % 0x7fffffff       # FNV prime
    g   = (g*0x1003f + h%0x3d1 + i) % 0x7fffffed
    h   = (h + g*0x83 + t%(i+3))   % 0x7fffffff
retour (h*0x83 + g) % 0x7fffffff
```

`main` appelle `keygen(t,1)` pour Key A et `keygen(t,2)` pour Key B, convertit en décimal (`snprintf "%lld"`), `strcmp` avec la saisie ; en cas d'échec il réessaie avec `t-1` (`sub rax,1` avant l'appel). Le résultat final est `(okA && !debugged) && (okB && !debugged)` (les deux drapeaux combinés avec `fig_is_debugged == 0`).

## Vérification

```bash
python3 -I tools/figger-solve.py --check
# == FiggerV2 == / window = 852360 / two keys required. / Key A : / Key B : / Access granted -- FiggerV2 defeated.
printf '1\n2\n' | xvfb-run -a wine original/figger.exe   # KO : Access denied.
```

- OK : clés calculées par le solveur → `Access granted -- FiggerV2 defeated.` (binaire d'origine sous Wine + Xvfb).
- KO : `1` / `2` → `Access denied.`
- Contrôle anti-debug : copie de travail dans `/tmp` avec `fig_is_debugged` neutralisé (`xor eax,eax; ret`), jamais le fichier de `original/`. Wine ne déclenche pas le test (le `Access denied` initial venait de mon keygen, pas de l'anti-debug).

## Notes

- Les clés changent toutes les 30 s ; `window = t % 1000000` n'est affiché qu'à titre indicatif (le calcul utilise `t` complet).
- Rien à patcher : le but est le keygen.
