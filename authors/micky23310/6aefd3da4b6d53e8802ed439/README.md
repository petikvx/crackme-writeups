# micky23310's guessme

| | |
|---|---|
| **ID** | [`6aefd3da4b6d53e8802ed439`](https://crackmes.one/crackme/6aefd3da4b6d53e8802ed439) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | micky23310 |
| **Plateforme** | Windows PE64 console, C compilé MinGW-w64 (GCC 16.2, ucrt) |
| **SHA-256** (`original/download.bin`) | `9379605ca7f376e2ba0cb574f5e24232a1b18d2f93e14bcd750f71c9837c4df9` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/download.bin` | **ZIP** (mot de passe `crackmes.one`) contenant `guessme.exe` — non modifié |
| `tools/guessme-solve.py` | solveur (lit le ZIP, rejoue le key schedule, inverse le bloc) ; `-q`, `--check` |

## Réponse

**Passphrase : `r3v3rs1ng_1s_fun`** → le programme affiche `CMO{1nv3rt_th3_8_r0unds}`.

```bash
python3 -I tools/guessme-solve.py            # détail
python3 -I tools/guessme-solve.py -q         # passphrase seule
python3 -I tools/guessme-solve.py --check guessme.exe   # wine + xvfb
```

(Pas de username : pas d'exemple `petik`.)

## Premier regard

- `file` absent ici ; `diec original/download.bin` → **ZIP**. Le « binaire » du dépôt est donc l'archive ; extraction hors du dépôt : `unzip -P crackmes.one original/download.bin -d /tmp/gm`.
- `guessme.exe` : PE64, `.text` 0x8b90, imports `CheckRemoteDebuggerPresent`, `GetTickCount64`, `NtQueryInformationProcess` (anti-debug).
- `strings` : leurre `CMO{strings_w1ll_l13_t0_y0u}`, affiché par `--hint` — **faux**. Les vraies chaînes (banner, `passphrase> `, `nope.`) sont obfusquées.
- Run : `passphrase> ` puis `nope.` ou `[+] accepted, here you go:` + flag.

## Flow

`main` (0x140009800) : décode les chaînes, lit la ligne (fgets), l'enregistre dans un contexte, puis exécute une **machine à états** : table de 7 pointeurs de fonction en `0x14000b140`, chaque état renvoie l'état suivant (6 = « nope », 7 = fin), 16 itérations max.

| État | Fonction | Rôle |
|---|---|---|
| 0 | `0x1400019d0` | longueur == 16 et charset `[A-Za-z0-9_]` (masque `0x87fffffe03ff` + test `a-z`) ; 4 u32 LE → bloc `v` ; chiffre `v` via `0x1400018b0` → ctx+0x40 |
| 1–4 | `0x140001920/50/80/9b0` | comparent chaque dword de ctx+0x40 à la cible ctx+0x50 |
| 5 | `0x140001d10` | FNV-1a(input) ^ seed → xorshift → 32 octets ^ table `0x14000b1c0` ; doit donner `CMO{`…`}` ; décode et affiche le flag |
| 6 | `0x140001c90` | affiche `nope.` |

## Comment on trouve

1. **Chaînes** : décodage `byte ^ ((i>>2)*17 + 0x37 + 0x1d*i)` (boucles `shr 2 / shl 4 / add` visibles en `0x140009880`) → banner, prompt, etc. Le flag de `--hint` est un leurre.
2. **Key schedule** `0x140001780` (graine `0x47554553`, xorshift32 `13/17/5`) remplit une structure de 0xd0 octets : `K0[4]=x%17+7` (rotations), `K1[4]=x|1` (multiplicateurs **impairs** donc inversibles), `K2[4]` (additifs), `K3[32]` (xor par tour), `key[0xb0..0xbf]`, `key[0xc0]`.
3. **Bloc** `0x1400018b0`, 8 tours : `v[i] = rol(v[i]^K3[r][i], K0[i])*K1[i] + K2[i]` puis mélange prefix-sum (`v0+=t; v1+=v0; v2+=v1; v3=v2+t`, t = ancien v3). Tout est bijectif → inversible.
4. **Cible** : dans `main` (`0x140009a18`), `pxor xmm1,[key+0xb0]` avec la constante `0x14000b1f0`, sélectionnée par un masque dépendant du résultat anti-debug `0x140001ab0` (PEB.BeingDebugged, NtGlobalFlag, ports/flags debug, test de timing). Sans debugger : `T = const(0x14000b1f0) ^ key[0xb0..0xbf]`. *Piège* : sous debugger la cible change (xor `0xa5a5a5a5` et autre branche) → aucune passphrase valable, d'où l'intérêt du solveur statique.
5. **Inversion** : `inv(T)` à rebours (tours 7→0, `K1^-1 mod 2^32`, `ror`) → 16 octets `r3v3rs1ng_1s_fun`.
6. **Contrôle étape 5** : FNV-1a (`0x811c9dc5`, `*0x1000193`) de ces 16 octets ^ key[0xc0], xorshift, ^ table → `CMO{1nv3rt_th3_8_r0unds}` + `}` en position 0x17 : le solveur le reproduit.

Analyse faite avec `objdump -d -M intel` seulement (pas d'IDA/GDB disponibles ici), donc pas de section GDB.

## Vérification

```text
$ echo r3v3rs1ng_1s_fun | xvfb-run -a wine guessme.exe
passphrase> [+] accepted, here you go:
CMO{1nv3rt_th3_8_r0unds}

$ echo r3v3rs1ng_1s_fuN | xvfb-run -a wine guessme.exe      # KO (1 caractère)
passphrase> nope.

$ xvfb-run -a wine guessme.exe --hint
hint: CMO{strings_w1ll_l13_t0_y0u}                           # leurre
```

## Notes

- Wine n'est pas détecté comme debugger (la timing check passe) ; sur machine lente (>1 s pour la boucle) la cible dérive et la passphrase serait refusée.
- Ce n'est pas un check par comparaison littérale : la passphrase se déduit uniquement par inversion.
