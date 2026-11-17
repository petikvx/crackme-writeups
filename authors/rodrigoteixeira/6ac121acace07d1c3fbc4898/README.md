# RodrigoTeixeira's Simulation password

| | |
|---|---|
| **ID** | [`6ac121acace07d1c3fbc4898`](https://crackmes.one/crackme/6ac121acace07d1c3fbc4898) · [`ORIGIN.yml`](ORIGIN.yml) |
| **Auteur** | RodrigoTeixeira |
| **Plateforme** | Windows PE32, console, MinGW GCC 6.3.0 |
| **SHA-256 (ZIP `original/download.bin`)** | `a9e9f094be6d8984d7f2c71476730fbe5a536ff5793ce96dba5484e9a5f1ef2a` |

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/download.bin` | ZIP d'origine (mot de passe `crackmes.one`), contient `main.exe` — non modifié |
| `analysis/main.exe` | `main.exe` extrait du ZIP (sha256 `8d17a0e0…6083`) |
| `tools/simulation-password-solve.py` | solveur (`--hex`, `-q`, `--check HEX`) |
| `tools/make-mingwex-stub.py` | génère un `libmingwex-0.dll` bidon pour lancer l'exe sous Wine |

## Réponse

Il n'y a pas de mot de passe unique « lisible » : il faut **40 octets** dont le score flottant dépasse un seuil que seul un mot quasi optimal atteint, et il faut des octets ≥ 0x80 (l'ASCII imprimable plafonne trop bas).

Mot de passe (hex, 40 octets) :

```
3fca41c623655bf8173b2a652d656bdf69ca5da43f654665b1e35a6569657e65df8fd265832a8315
```

```bash
python3 -I tools/simulation-password-solve.py --hex           # affiche l'hex + R
python3 -I tools/simulation-password-solve.py -q > pw.bin     # octets bruts, à envoyer sur stdin
```

Pas de username dans ce crackme (donc pas d'exemple `petik`).

## Premier regard

```bash
python3 -I -c "import zipfile;zipfile.ZipFile('original/download.bin').extractall('/tmp/rt',pwd=b'crackmes.one')"
diec /tmp/rt/main.exe        # PE32, MinGW GCC 6.3.0
strings -n 5 /tmp/rt/main.exe
```

`strings` montre `Enter password: ` en clair, mais les messages finaux ressemblent à du bruit :
`Qbttxpse!cjh!cf!cjh!cjh`, `Uif!qbttxpse!jt!upp!tmpx/`, … C'est du **décalage +1** : la boucle d'affichage fait `putchar(c - 1)` (`sub eax,1` avant `call putchar`). Décodé :

| Adresse | Message |
|---|---|
| `0x404094` | `Dividing by 0 is gay as crap nfl` (division par 0, jamais atteint avec des octets non nuls) |
| `0x4040b5` | `The password is too slow.` + `%f` |
| `0x4040d4` | `Congratulations, you have beaten the crackme! :)` |
| `0x40407a` | `Password big be big big` (longueur ≠ 40) |

## Flow

`_main` (`0x402160`) : `printf("Enter password: ")`, `scanf("%40s", buf)` avec `buf = esp+0x37`.

1. Scan des 40 premiers octets : si un `\0` apparaît → message « Password big be big big » (trop court).
2. Sinon, boucle sur 20 paires `(c0, c1)` en x87 (voir ci-dessous).
3. Test final `R >= seuil` → `Congratulations`, sinon `The password is too slow.` + valeur de `R`.

## Comment on trouve

**Ancrage** : `objdump -d -M intel --no-show-raw-insn main.exe`, fonction `_main` à `0x402160`, constantes lues avec `objdump -s -j .rdata`.

**Constantes** (`.rdata`) :

| VMA | Octets | Valeur float32 |
|---|---|---|
| `0x404108` | `3b800000` | 1/256 |
| `0x40410c` | `3f800000` | 1.0 |
| `0x404110` | `3dcccccd` | 0.1 |
| `0x404114` | `43e76439` | 462.78299 (seuil) |

**Boucle** (`0x4021f2`–`0x4022b9`, pas de 2 octets, 20 tours car `ebx = buf+40`), pseudo-code reconstitué en suivant la pile x87 à la main :

```c
float T = 0, A = 0, B = 0;
for (i = 0; i < 40; i += 2) {
    float x = s[i]   / 256.0f;           // fild + fmul 0x404108
    float y = s[i+1] / 256.0f;
    float m = sqrtf(x*x + y*y);          // fsqrt ; (chemin sqrtf si r2<0, jamais pris)
    if (m == 0) { puts("Dividing by 0 ..."); return; }   // 0x40231e
    float inv = 1.0f / m;                // fdivr [0x40410c]
    T += x * inv;                        // cos(theta)  -> stocké dans [esp+0x2c]
    A += 0.1f * (y * inv);               // 0.1 * sin(theta)  (vitesse)
    B += A;                              // position
}
float R = T*T + B*B;                     // 0x4022c1..0x4022c7
if (R >= 462.78299f) puts("Congratulations...");
else                 printf("The password is too slow.%f", R);
```

C'est une « simulation » : chaque paire donne un angle `θ = atan2(c1, c0)` ; seul le **rapport** `c1/c0` compte (l'échelle s'élimine dans `x/m`). `T` somme les `cos θ_j` ; `A` est une vitesse qui accumule `0.1·sin θ_j` ; `B` est une position qui accumule `A`. Le poids de `sin θ_j` dans `B` est `0.1·(20−j)`.

**Optimisation** : on veut maximiser `R = (Σ cos θ_j)² + (0.1·Σ (20−j) sin θ_j)²` (j = 0..19). Par point fixe : `θ_j = atan2(B·0.1·(20−j), T)` (gradient de la fonction convexe `R`). Le maximum continu converge vers **R = 462.78801**, soit seulement 0.005 au-dessus du seuil 462.78299. Il faut donc approcher chaque rapport idéal `c1/c0` au plus près avec des octets.

**Piège** : avec l'ASCII imprimable (0x21–0x7e) les angles sont bornés à ~[15°, 75°] et le meilleur score est **462.681 < seuil** → KO. Il faut des octets étendus (≥ 0x80, non blancs pour `scanf %s`) pour obtenir des rapports assez fins. Le solveur part de l'optimum continu, choisit la paire d'octets (1–255 hors blancs) la plus proche de chaque angle, puis polit par montée de coordonnées → **R = 462.78801 ≥ 462.78299**.

## Vérification

Pas de GDB ni de debugger : analyse 100 % statique + Wine.

**Piège Wine** : l'exe importe `libmingwex-0.dll` (`__mingw_glob`, `fesetenv`, `sqrtf`), absente → `c0000135`, code retour 53 et aucune sortie. `tools/make-mingwex-stub.py` génère un stub (hors `original/`) :

```bash
mkdir /tmp/stub && python3 -I tools/make-mingwex-stub.py /tmp/stub && cp analysis/main.exe /tmp/stub/
cd /tmp/stub && python3 -I <chemin>/tools/simulation-password-solve.py -q > /tmp/pw.bin
WINEDEBUG=-all xvfb-run -a wine main.exe < /tmp/pw.bin
```

Résultats observés :

| Entrée | Sortie |
|---|---|
| mot de passe solveur (40 octets) | `Congratulations, you have beaten the crackme! :)` ✅ |
| `A`×40 | `The password is too slow.420.499939` ❌ |
| `abc` | `Password big be big big` (trop court) ❌ |

## Notes

- Les messages sont obfusqués par `+1` ; `strings` seul ne les rend pas.
- Marge ultra mince (0.005) : le solveur doit être proche de l'optimum continu ; l'arithmétique x87 (stockage float32 de `T`) ne change pas le verdict, confirmé sous Wine.
- Tout mot dont les rapports `c1/c0` approchent ces angles passe ; la solution n'est pas unique.
