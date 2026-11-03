# crackmes.de's de_kryptzo_12 (De-KryptZo 1 & 2) by starzboy

| | |
|---|---|
| **ID** | [`5ab77f5833c5d40ad448c3e3`](https://crackmes.one/crackme/5ab77f5833c5d40ad448c3e3) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | starzboy / iCU (site : crackmes.de) |
| **Plateforme** | Windows PE32 GUI (MASM 6.14, dialogue), x86 |
| **SHA-256 (zip)** | `cb3b74e560659398bfd180623e352f4c702c40cc17534c7653d196c5ac085443` |

L'archive d'origine contient **deux crackmes** (`De-KryptZo1.exe`, `De-KryptZo2.exe`) : le write-up traite les deux.

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/De-KryptZo[1nd2].zip` | archive d'origine (non modifiée) |
| `analysis/extracted/` | zips internes extraits (`k1/`, `k2/` : exe + `iCU.txt`) |
| `analysis/screenshot-*.png` | preuves Wine (OK et KO) |
| `tools/kryptzo-solve.py` | keygen des deux crackmes (`1` / `2`, `-q`, `--check`) |

## Réponse

| Crackme | Entrée valide | Commande |
|---|---|---|
| **#1** | Pass = **`an`** | `python3 -I tools/kryptzo-solve.py 1` |
| **#2** | Name = **`petik-1`**, Key = **`petikag`** (hash affiché `97b2cde1`) | `python3 -I tools/kryptzo-solve.py 2` |

Il n'y a pas de « nom → serial » au sens classique : le crackme #1 n'a qu'un champ ; le #2 a deux champs (`Name`, `Key`) mais les deux sont des *entrées de hash*, la validité se joue sur **un seul octet de clé** (donc plusieurs solutions, d'où `petik` comme préfixe d'exemple). Le solveur est déterministe (`-q` pour sortie brute, `--check` pour tester une saisie : `--check an`, `2 --check petik-1 petikag`).

## Premier regard

```bash
unzip -P crackmes.one original/De-KryptZo\[1nd2\].zip -d analysis/extracted   # 2 zips
# puis unzip de chacun -> k1/ k2/ (exe + iCU.txt)
diec k1/De-KryptZo1.exe     # MASM32, Microsoft Linker 5.12, pas de packer
strings -n 5 k1/De-KryptZo1.exe
```

`iCU.txt` donne le principe : *« Unless you Enter a Valid Serial … the Decryption will be wrong and the app will crash ! »*. Pas de comparaison de serial : le serial sert de **clé de déchiffrement** d'un petit bout de code. Bon serial → code déchiffré = `MessageBox("Decryption Successfull ... Good Work !")`, mauvais → octets de déchet exécutés → crash.

UI (Wine/Xvfb) : #1 = `Pass`, `Hash`, boutons *Hash It !* / *Decrypt* / *Exit* ; #2 = `Name`, `Key`, `Hash`, mêmes boutons. *Decrypt* n'est activé qu'après *Hash It !*.

## Flow

1. *Hash It !* (ID `0x3eb`) lit le(s) champ(s), calcule un hash, l'écrit en hex (`wsprintfA "%x"`) dans le champ `Hash` (ID `0x3ed`) et active *Decrypt*.
2. *Decrypt* (ID `0x3f1`) déchiffre **20 octets** (`0x14`) de code avec une clé 1 octet dérivée du texte hexadécimal, puis `jmp` dessus.

## Comment on trouve

Le dialog proc est à `0x40104c` (#1) / `0x401031` (#2), repérée par `objdump -d -M intel` : `cmp [ebp+0xc],0x110` (WM_INITDIALOG) / `0x111` (WM_COMMAND), puis `cmp eax,0x3eb` / `0x3f1` pour les boutons.

### Le code « chiffré » et le plaintext connu

#1, bouton *Decrypt* (`0x4011a1…`) : `esi = 0x401030` (blob de 20 octets `b4 4a b2 a0 7a 8a 4a b2 79 7a 8a 4a 49 bf 52 32 cf 4a 4a 4a`, désassemblé n'importe comment : c'est de la donnée) est déchiffré **vers `0x40122b`**, zone de 24 `nop`. Juste avant le `jmp 0x40122b` : `mov byte [0x40123b],0x59`. Juste au-dessus, à `0x401217`, du code mort, jamais atteint :

```
401217: 6a 00                push 0
401219: 68 56 30 40 00       push 0x403056   ; titre "[iCU]"
40121e: 68 2f 30 40 00       push 0x40302f   ; "Decryption Successfull ..."
401223: ff 75 08             push [ebp+8]
401226: e8 6d 00 00 00       call MessageBoxA@plt
```

C'est le **plaintext** : 20 octets exactement. Placé à `0x40122b` au lieu de `0x401217`, le `call` n'a plus le même déplacement relatif, d'où le patch `0x59` (`0x401298 − 0x40123f`) de l'octet 16. On connaît donc le clair (octets 0–15 + `00 00 00`), il suffit d'en déduire la clé par différence — **aucun brute-force**.

Pour #2 (blob en place à `0x4013ac`, `8d 23 8b a4 53 63 23 8b 7d 53 63 23 22 98 2b 0b 8b 23 23 23`) même principe : plaintext `6a 00 68 81 30 40 00 68 5a 30 40 00 ff 75 08 e8 ..` (titre `0x403081`, texte `0x40305a`, `call` vers `0x401414`, patch `[0x4013bc]=0x54`). Piège : `objdump` désassemble ce blob en instructions absurdes (`lea esp,[ebx]`, `arpl`…) — c'est de la donnée.

### Crackme #1

**Boucle de déchiffrement** (par octet `b` du blob, `cl` = clé) :

```
sub al,0x71 ; inc al ; add al,0x51 ; add al,0x34 ; add al,0x46
add al,cl   ; add al,0x53 ; add al,0x54 ; add al,0x20 ; sub al,0x97 ; sub al,0x71
```

Toutes les constantes s'additionnent : `plain = b + C + key`, `C = −0x71+1+0x51+0x34+0x46+0x53+0x54+0x20−0x97−0x71 (mod 256)`. Avec `plain[0] = 0x6a` et `b[0] = 0xb4` : **`key = 0x9c`** (le reste du blob est cohérent : `0x4a → 0x00`).

**Clé** : `key = hexbuf[0] + hexbuf[1]` (octets ASCII, `0x403460`, `0x403461`), où `hexbuf = "%x" % dl` et `dl` est l'octet de hash du serial :

```
dl = 0x94 ; bl = 0x64
pour chaque octet al du serial :
    cl = al ; bl ^= al ; al += bl ; al += cl ; al += 0x32 ; al ^= 0x35
    dl += al ; al -= 0xf6 ; dl += al
```

(`bl` persiste d'un tour à l'autre : c'est un état.) Il faut `hexbuf[0]+hexbuf[1] ≡ 0x9c` : par ex. `'d'(0x64) + '8'(0x38) = 0x9c` → `dl = 0xd8`. Le serial `an` donne exactement `dl = 0xd8`. Beaucoup d'autres serials conviennent ; le solveur renvoie le premier trouvé par ordre lexical.

### Crackme #2

Même structure, mais plus tordue (l'auteur : *« here i have decided to screw up ur luck »*).

**Hash It !** : `Name` (ID `0x3ea`, longueur > 3) et `Key` (ID `0x3f2`, > 3) passent chacun dans une boucle de hash (`lstrlenA` → compteur) :

- Name : `for i<len : c = (signed)buf[i+1]`, constante initiale `0x3265`, `ecx += ...`, `xor 0x56c`, `+ ...` ;
- Key  : `c = buf[i+5]`, constante `0xff85`, `sub ecx,eax`, `or ecx,0x56c`.

Les deux dépendent de `edx = 0x40308c` (l'adresse du buffer, image base fixe sans ASLR) et **ne lisent qu'à partir de l'octet 1 (Name) / 5 (Key)**. Conséquence (piège !) : les 5 premiers caractères de `Key` ne comptent pas dans le hash, et une `Key` de ≤5 caractères hashe des `\0` → **hash constant**. C'est pourquoi la clé est `petik` + queue (`ag`) : seuls les caractères d'index ≥5 comptent. Idem, le 1er caractère de `Name` est ignoré.

Combinaison (`0x401210`) : `r = h1 + h2 + (h1 ^ 0x25f65) + h1*h2`, affiché `%x`.

**Decrypt** : la chaîne hex (champ `Hash`, `n` caractères) donne la clé `[ebp-9]` :

```
bl = n ; key = 0
pour chaque caractère ch :
    al = ((ch+0x32+1) ^ 0x56) + 0x71 − 0x65 + 0x95 + 0x9c
    bl <<= 5 ; al += bl ; key += al ; key += 0x91
```

(`bl` vaut `n<<5` au 1er tour puis `0`.) Le blob est ensuite déchiffré par `plain = b + C' + cl + [ebp-9] = b + C' + 2·key`. Du plaintext connu : `2·key ≡ 0xba` ⇒ **`key ∈ {0x5d, 0xdd}`** (le `×2` perd le bit de poids fort → 2 clés). Valeur du hash pour `petik-1`/`petikag` : `97b2cde1` (8 caractères), qui donne `key = 0x5d`.

Le keygen fixe `Name = petik-1` et cherche la queue de `Key` (`petik` + 1 à 3 alphanumériques) telle que la clé tombe sur `0x5d`/`0xdd` (~1/128 d'essais). Ce n'est pas un brute-force du binaire : c'est le calcul inverse d'une contrainte à 1 octet, le champ `Hash` n'étant pas inversible directement.

## Vérification

Binaires d'origine copiés hors du dépôt, lancés sous Wine (`wine 10.0`) dans un Xvfb ; saisie / clics via `xdotool`, capture via `ffmpeg x11grab`.

| Cas | Résultat | Preuve |
|---|---|---|
| #1 `an` + *Hash It !* + *Decrypt* | MessageBox « Decryption Successfull ... Good Work ! » | [`screenshot-ok-kryptzo1.png`](analysis/screenshot-ok-kryptzo1.png) |
| #1 `ab` (KO) | « Program Error » / Wine Debugger (crash) | [`screenshot-ko-kryptzo1.png`](analysis/screenshot-ko-kryptzo1.png) |
| #2 `petik-1` / `petikag` + *Hash It !* | champ Hash = `97b2cde1` (identique au solveur) | [`screenshot-hash-kryptzo2.png`](analysis/screenshot-hash-kryptzo2.png) |
| #2 idem + *Decrypt* | MessageBox succès | [`screenshot-ok-kryptzo2.png`](analysis/screenshot-ok-kryptzo2.png) |
| #2 `petik-1` / `petikaa` (KO) | Program Error (crash) | [`screenshot-ko-kryptzo2.png`](analysis/screenshot-ko-kryptzo2.png) |

```bash
python3 -I tools/kryptzo-solve.py 1 --check an                # OK
python3 -I tools/kryptzo-solve.py 1 --check ab                # KO
python3 -I tools/kryptzo-solve.py 2 --check petik-1 petikag   # OK
python3 -I tools/kryptzo-solve.py 2 --check petik-1 petikaa   # KO
```

## Notes

- Pas de GDB ni de debugger utilisé : reverse statique (`objdump`) + émulation Python, preuve live sous Wine.
- Les deux crackmes ne comparent jamais le serial : seule la validité du code déchiffré décide (crash sinon). Les solutions ne sont donc pas uniques.
- Le crash du cas KO est celui de Wine (`Program Error`), pas forcément celui de Windows.
