# hypercrackme6 by thehyper (crackmes.de)

- Origine : [ORIGIN.yml](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/5ab77f5633c5d40ad448c281)
- Auteur : TheHyper (archive crackmes.de, 2005) · plateforme : Windows PE32, **VC++ 6.0**, code chiffré en couches · difficulté 2.0
- Règles (readme.txt) : *« No patching », « Find a serial and if you are bored, try writing a keygen (very easy) »*, avec l'indice *« there is a hidden button which is used for registration »*.

| Fichier | Rôle |
|---|---|
| `original/HyperCrackMe6.zip` | archive site (mdp `crackmes.one`) → `HyperCrackMe6.exe` + `readme.txt` |
| `analysis/decrypt.py` | première couche statique (`rol8(b ^ 0x73, 3)` sur `[0x4010c5, 0x4017c8)`) |
| `analysis/emu.py` | émulation Unicorn de `WinMain` : couches successives, filtre SEH, TEB/PEB fictifs, presse-papiers simulé (`python3 analysis/emu.py SERIAL`) |
| `analysis/text-decrypted.bin`, `analysis/check-routine.txt` | `.text` déchiffré au moment de la lecture du serial + désassemblage de la routine de vérification |
| `tools/hypercrackme6-solve.py` | keygen + `--check SERIAL` |

## Réponse

Il n'y a ni fenêtre ni champ de saisie. Le « bouton caché », c'est le **presse-papiers** : au lancement, le programme lit `CF_TEXT` et le teste. Il faut donc copier le serial, puis lancer l'exe.

```text
Serial (exemple) : PETI-KPET-IKPE-eQpY-RDVV
```

```bash
python3 tools/hypercrackme6-solve.py --n 3
# PETI-KPET-IKPE-eQpY-RDVV -> b'G`Wmg`qcker!'
# PETI-KPET-IKPE-eCQt-hpRV -> b'Grv@]Tucker!'
# PETI-KPET-IKPE-eMSm-elXV -> b'G|tYPH\x7fcker!'
python3 tools/hypercrackme6-solve.py --check PETI-KPET-IKPE-eQpY-RDVV   # VALIDE
```

Un serial valide affiche une seconde MessageBox titrée « HyperCrackMe6 <TheHyper> », dont le texte est `buf` (8 octets dérivés du serial, puis `ker!`). Un serial faux ne déclenche rien après la boîte « Rulez ».

## Protections

Seuls `MessageBoxA` et `wsprintfA` sont importés de user32. Tout le reste est résolu via `GetProcAddress`, avec des noms reconstruits par `bswap` sur la pile (`SetUnhandledExceptionFilter`, `OpenClipboard`, `GetClipboardData`, `CloseClipboard`).

1. **Couches chiffrées** : `VirtualProtect(0x401000, RWX)`, puis une suite de boucles `xor al,K ; rol al,N` qui déchiffrent chacune le bloc suivant (0x73/3, 0x51/7, 0xff/5, 0xaf/5…). Chaque bloc déjà exécuté est ensuite rechiffré (`ror al,5 ; xor al,bl`, avec `bl` = octet bas de l'adresse d'API + 0xdeadbeef), ce qui rend un dump post-mortem inutilisable.
2. **Checksums de code** : pendant chaque déchiffrement, la somme des octets d'une plage de code est stockée (`[ebp-0x90]`, `[ebp-0x20]`, `[ebp-0x28]`…), puis cumulée dans `[ebp-0x24]`. Un `int3` posé dans ces zones fausse la clé finale.
3. **Anti-debug PEB** : `mov eax, fs:[0x18]` puis `[eax+0x30]` donne le PEB ; l'octet `BeingDebugged` va dans `[ebp-0xe0]`, et s'il ne vaut pas 0 le test est sauté.
4. **SEH comme saut** : `SetUnhandledExceptionFilter(0x40120e)`, puis une écriture volontairement fautive (`0x4017bb`). Le filtre réécrit `Context.Eip` à `0x40122a` (le code de vérification) et renvoie `EXCEPTION_CONTINUE_EXECUTION`. Sous débogueur, le filtre n'est jamais appelé.

`analysis/emu.py` reproduit tout cela : les API sont des stubs nommés, les accès `fs:` sont émulés à la main, et le filtre d'exception tourne sur un faux `CONTEXT` avec ESP/EBP restaurés à l'instruction fautive. Changer les adresses fictives des API (`FOFF=…`) ne change pas la clé : `K = 0xb033a146` est constant.

## Routine de vérification (`0x40128d`)

```text
BeingDebugged == 0
len(clip) == 24, clip[4] = clip[9] = clip[14] = clip[19] = '-'
g0..g4 = DWORD little-endian de clip[0:4], [5:9], [10:14], [15:19], [20:24]
seed = ((g0 % 0xffff + g1 % 0xffff + g2 % 0xffff) % 0xffff) / 0xff      ; srand(seed)
buf[0..38] = rand() % 26 + 0x20                                         ; rand MSVC (0x343fd, 0x269ec3)
*(u32*)&buf[0] ^= g3 ; *(u32*)&buf[4] ^= g4 ; *(u32*)&buf[8] = "ker!" ; buf[12] = 0
buf[0] == 'G' && buf[7] == 'c'
v = 0 ; for i in 1..6: v = (v + (buf[i] << 6)) ^ K       ; K = [ebp-0x24] = 0xb033a146
v == 0xd780  ->  MessageBoxA(0, buf, "HyperCrackMe6 <TheHyper>", 0)
```

Le keygen fixe librement les trois premiers groupes (ici `PETI-KPET-IKPE`), ce qui détermine la graine et donc les 8 premiers `rand()`. Il force ensuite `g3[0] = r0 ^ 'G'` et `g4[3] = r7 ^ 'c'`, puis tire au hasard les 6 caractères alphanumériques restants jusqu'à obtenir `v == 0xd780` (quelques milliers d'essais au plus).

## Vérification

`analysis/emu.py` exécute le vrai binaire depuis `WinMain`, avec toutes les couches, les checksums réels et le passage par le filtre SEH, en plaçant le serial dans le presse-papiers simulé :

| Presse-papiers | `[ebp-8]` en `0x401811` | Résultat |
|---|---|---|
| `PETI-KPET-IKPE-eQpY-RDVV` | `0xd780` | `MessageBoxA("G`Wmg`qcker!", "HyperCrackMe6 <TheHyper>")` → **VALIDE** |
| `PETI-KPET-IKPE-eQpY-RDVW` | — (`buf[7] ≠ 'c'`) | aucune MessageBox → INVALIDE |
| `AAAA-BBBB-CCCC-DDDD-EEEE` | — | aucune MessageBox → INVALIDE |
