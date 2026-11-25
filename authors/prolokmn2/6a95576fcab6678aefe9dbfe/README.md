# prolokmn2's FiggerC (`crackme.exe`)

| | |
|---|---|
| **ID** | [`6a95576fcab6678aefe9dbfe`](https://crackmes.one/crackme/6a95576fcab6678aefe9dbfe) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | prolokmn2 |
| **Plateforme** | Windows PE64 console (MinGW, prédicats opaques, SHA-256 embarqué, mini-VM) |
| **SHA-256** | `fab0ac37f1ef1b08988656bc4603621ea4efc73164193e07a17d68fb96f19969` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/crackme.exe` | binaire d'origine (non modifié) |
| `tools/figgerc-solve.py` | keygen (`-q`, `--t N`, `--check`) |

## Réponse

Pas de nom d'utilisateur (donc pas d'exemple `petik`) : la clé ne dépend que de l'heure, par fenêtres de 30 s. Le binaire accepte la fenêtre courante **et la précédente**.

```bash
python3 -I tools/figgerc-solve.py            # clé pour la fenêtre courante
python3 -I tools/figgerc-solve.py -q         # clé seule
python3 -I tools/figgerc-solve.py --check    # Wine : 2 clés valides + minuscules -> granted, bidon -> denied
```

Clé = `sha256("FSX::crackme::v1::9f3a-rotating" || be64(time//30))[:8]` en hexadécimal MAJUSCULE (16 caractères). Exemple : `t = 59852727` → `C945AC261A5A2276`.

## Premier regard

- `file` : PE32+ x86-64 console. `strings` : `Enter Key : `, `FSX::seal::master::32-layer::v1`, `0123456789ABCDEF`, constantes SHA-256 (`0x428a2f98…`). Les messages final sont XOR `0x5a` (`7a7a017707…` → `  [-] Access denied.` / `  [+] Access granted. welcome, cracker.`).
- Symboles MinGW conservés : `main` `0x140003180`, `sha256` `0x1400016a0`, `ks` `0x140001510`, `h_win` `0x1400014f0`, `h_lose` `0x1400014d0`, `disable` `0x140001470`.

## Flow

1. `main` dérive 32 clés de tour `g_sk` par chaînage SHA-256 : `sk[-1]=sha256("FSX::seal::master::32-layer::v1")`, `sk[i]=sha256(sk[i-1] || be32(i))`.
2. Un « programme » de 11 octets (`b7 c3 91 3c 2a 5e 08 44 02 e9 00`, `.rdata+0x20`) est contrôlé par son SHA-256 (`HPROG` à `0x1400050c0`), chiffré sur 32 tours (`rol`/`xor` avec `ks(sk[i])`) dans `g_bl`, puis re-vérifié par hash (`g_bh`) ; toute altération appelle `disable()` → `g_dis=1` → `h_lose`.
3. `fgets` + filtre : ne garde que `[0-9A-Fa-f]` (minuscules passées en majuscules), 16 caractères max, dans un buffer `[rsp+0x60]`.
4. `g_bl` est déchiffré (32 tours inverses) → bytecode de la mini-VM.
5. Pour `t = time()/30`, puis `t-1` : jeton = hex MAJ des 8 premiers octets de `sha256(SEED || be64(t))` placé en `[rsp+0x70]` ; la VM exécute le bytecode ; succès si `r11 == 0`.
6. `ebp==1` → `h_win`, sinon `h_lose` (appel via table de pointeurs indexée `2*(ebp^1)+3`).

## Comment on trouve

**Ancrage** : `objdump -d -M intel original/crackme.exe` (symboles MinGW présents, pas besoin de IDA). `main` à `0x140003180`, `time` appelé à `0x1400035d7` suivi d'un `div rcx` avec `rcx=0x1e` → fenêtre de 30 s.

**Semence** : les `movabs` à `0x1400035fa…0x14000363f` écrivent en little-endian `0x6172633a3a585346`=`FSX::cra`, `0x31763a3a656d6b63`=`ckme::v1`, `0x2d613366393a3a31`=`1::9f3a-`, `0x676e697461746f72`=`rotating` avec recouvrement (écritures aux offsets `+0x00,+0x08,+0x0f,+0x17`) → chaîne de 31 octets `FSX::crackme::v1::9f3a-rotating`. La boucle `shr r8,cl` (cl = 0x38…0) ajoute `t` en **big-endian sur 8 octets** (`0x1f0+0x1f..0x26`), total `edx=0x27=39` octets passés à `sha256`.

**Jeton** : la boucle `0x1400036dc` convertit le hash : indice pair → quartet haut, impair → quartet bas, via `HEX = "0123456789ABCDEF"`, 16 caractères (`cmp ecx,0x10`) → 8 octets de hash, hex MAJ.

**Saisie** (`0x140003340–0x1400033ae`) : `lea r8d,[rdx-0x61]; cmp r8b,5` → `a-f` : `sub edx,0x20` (majuscule) ; `0-9` et `A-F` stockés tels quels ; le reste est ignoré ; arrêt à 16. Les minuscules sont donc acceptées.

**Mini-VM** (`0x140003864…0x1400039e6`), bytecode déchiffré :

```text
00 b7        r14 = 0                      ; index
01 c3        r11 = 0                      ; accumulateur d'erreur
02 91        push jeton[r14]              ; [rsp+0x70+r14]
03 3c        push saisie[r14]             ; [rsp+0x60+r14]
04 2a        xor des deux sommets -> push
05 5e        r11 |= pop
06 08        r14++
07 44 02     si r14 <= 15 : saut en 02, sinon pc = 09
09 e9        fin : r11 == 0 -> succès (edx = 0x1d0de5a7 ^ 0x1d0de5a7 = 0)
```

Donc succès ⇔ les 16 caractères saisis sont exactement le jeton. Le résultat alimente `ebp |= 1` ; la boucle `r12=t, t-1` s'arrête quand `r12 == t-2` (`0x14000397d`), d'où deux fenêtres valides.

**Pièges** : (1) le bytecode et les clés de tour ne servent qu'à protéger le programme (intégrité par hash, `disable()`), ils n'interviennent pas dans la clé ; (2) les charabias `j0` (prédicat opaque `x*(x+1)` toujours pair) sont du bruit ; (3) le buffer stocke des caractères ASCII, pas des valeurs de quartets.

## Vérification

```text
$ python3 -I tools/figgerc-solve.py --check
t = 59852727
Key = C945AC261A5A2276  (aussi valide : t-1 -> 5FF31B8B976F4704)
[OK] 'C945AC261A5A2276' -> Enter Key :   [+] Access granted. welcome, cracker.
[OK] '5FF31B8B976F4704' -> Enter Key :   [+] Access granted. welcome, cracker.
[OK] '5ff31b8b976f4704' -> Enter Key :   [+] Access granted. welcome, cracker.
[OK] '0123456789ABCDEF' -> Enter Key :   [-] Access denied.
```

Exécuté contre `original/crackme.exe` sous `xvfb-run -a wine`. Analyse statique (objdump) + Wine ; pas de GDB, pas d'IDA.

## Notes

- Aucun nom : la clé change toutes les 30 s.
- Même famille que « Figger » / « Figger V2 » du même auteur, mais ici SHA-256 + mini-VM au lieu d'un hash maison.
