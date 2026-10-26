# crackme_false (CRACKME #1 BY V!CTOR) — vctor_

| | |
|---|---|
| **ID** | [`5ab77f5733c5d40ad448c383`](https://crackmes.one/crackme/5ab77f5733c5d40ad448c383) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur (site)** | crackmes.de (vctor_) |
| **Plateforme** | Windows PE32 GUI (MASM) + DLL cachée |
| **SHA-256 (zip)** | `8204e810de20c7b5faabf53247ea5d64f98c9f572ad7335f4924221a892afc85` |

## Fichiers

| Fichier | Rôle |
|---|---|
| `original/CRACKME1.zip` | archive d'origine (mot de passe `crackmes.one`) |
| `analysis/extracted/` | `crackme1.exe`, `info.nfo` (en réalité une **DLL**), `README.TXT` (dépaqueté du zip, hors `original/`) |
| `tools/crackme-false-solve.py` | keygen (`--name`, `-q`, `--check SERIAL`) |
| `tools/wine-live-test.sh` | preuve live : Xvfb + Wine + xdotool + captures |
| `analysis/screenshot-*.png` | captures de la preuve live |

## Réponse

Keygen nom → serial, exemple avec **`petik`** :

| Nom | Serial |
|---|---|
| `petik` | **`IJDDKLFFGG`** |

```bash
python3 tools/crackme-false-solve.py --name petik        # name='petik' serial='IJDDKLFFGG'
python3 tools/crackme-false-solve.py -q                  # IJDDKLFFGG
python3 tools/crackme-false-solve.py --check IJDDKLFFGG  # OK
```

Règle : pour chaque octet `name[i]`, `serial[2i] + serial[2i+1] ≡ name[i] + 0x23 (mod 256)`. Beaucoup de serials sont valides pour un même nom ; le solveur coupe `t = name[i]+0x23` en deux moitiés (`t//2`, `t-t//2`), ce qui reste imprimable.

## Premier regard

```bash
unzip -P crackmes.one original/CRACKME1.zip -d analysis/extracted
file analysis/extracted/*
# crackme1.exe : PE32 GUI i386 ; info.nfo : PE32 **DLL** ; README.TXT
strings -n 4 analysis/extracted/info.nfo
```

- `README.TXT` : crackme en MASM, « petit anti-debugger », « keygen, pas de patch ».
- `info.nfo` n'est pas un NFO : c'est une DLL (`CRACKME.dll`) qui exporte `CHK` (ordinal 1, RVA `0x1071`) et contient les chaînes « Congratulations, you are registered now! » / « You are not regestered yet ».
- `crackme1.exe` : dialogue (ressource `0x3e8`) avec deux edits (`0x3e9` nom, `0x3ea` serial) et les boutons *Check serial* (`0x3ed`), *About* (`0x3ee`), *Exit* (`0x3ef`). Chaînes : `\\.\NTICE` (détection SoftICE), `info.nfo`, `advaapi32.dll` (sic, avec un `a` en trop), « Your serial is valid » / « Your serial is not valid ».

## Flow

1. Clic *Check serial* → handler `0x4011f4` : `GetDlgItemTextA` nom → `0x403000`, serial → `0x403200`.
2. `IsDebuggerPresent` (`0x401412`), suivi d'octets de code « tordus » (`xor eax,ebx / and ecx,eax / …`), puis `or al,al / jne` → MessageBox « Your serial is **valid** » (icône info) ou « **not valid** » (icône erreur).
3. Si `CreateFileA("\\.\NTICE")` avait réussi à l'entrée du `WM_COMMAND` (`0x401148`), le flag `[0x4020f9]=1` saute la suite (anti-SoftICE). Sinon `0x401337` :
   - `0x401282` : `GetModuleFileNameA`, tronque les 12 derniers caractères (`crackme1.exe`), ajoute `info.nfo` → `CopyFileA` vers `<dossier>\advaapi32.dll` (`SetFileAttributesA` pour la cacher), `LoadLibraryA`.
   - `GetProcAddress(h, "CHK")` puis `CHK(0x403000 /*nom*/, 0x403200 /*serial*/)`.
4. `CHK` ne vérifie **rien** : elle mémorise juste les deux pointeurs (`[0x10003000]`, `[0x10003200]`).
5. Le vrai contrôle est dans le `DllMain` de la DLL, au `DLL_PROCESS_DETACH` (donc **à la fermeture** du crackme) → MessageBox « Congratulations » ou « not regestered ».

Le titre « false » est donc justifié : la boîte « serial is valid / not valid » de l'exe est un **leurre**, le verdict réel n'apparaît qu'à la sortie.

## Comment on trouve

**Ancrage** : `objdump -d -M intel analysis/extracted/crackme1.exe` (handler `0x4011f4`, loader `0x401282`) puis `objdump -d -M intel analysis/extracted/info.nfo` (DLL, base `0x10000000`). Aucun besoin d'IDA, les deux binaires font ~100 instructions.

`DllMain` de la DLL (`0x10001000`) — `[ebp+0xc]` = `fdwReason` :

```asm
10001003: cmp  [ebp+0xc],1      ; ATTACH -> return TRUE
10001010: cmp  [ebp+0xc],0      ; DETACH : c'est ici que ça se passe
10001016: cmp  [0x10003000],0   ; CHK jamais appelée -> rien
1000101f: mov  esi,[0x10003000] ; esi = nom
10001025: mov  edi,[0x10003200] ; edi = serial
1000102b: mov  al,[esi]         ; al = name[i]
1000102f: je   ok               ; fin du nom -> succès
10001031: add  al,0x23          ; al = name[i] + 0x23
10001033: mov  cx,[edi]         ; cl = serial[2i], ch = serial[2i+1]
10001036: add  ch,cl            ; ch = s[2i] + s[2i+1]  (mod 256)
10001038: cmp  ch,al
1000103a: je   next             ; sinon -> "You are not regestered yet"
1000103e: inc esi ; inc edi ; inc edi
```

Donc `serial[2i] + serial[2i+1] = name[i] + 0x23 (mod 256)`, et le serial est lu 2 octets par caractère du nom ; les octets au-delà de `2·len(nom)` sont ignorés.

**Assemblage, `petik`** : `p=0x70→0x93=147=73+74→'I','J'` ; `e=0x65→0x88=136=68+68→'D','D'` ; `t=0x74→0x97=151=75+76→'K','L'` ; `i=0x69→0x8c=140=70+70→'F','F'` ; `k=0x6b→0x8e=142=71+71→'G','G'` → `IJDDKLFFGG`.

**Pièges** :
- `CHK` ressemble à un check (nom exporté, boucle `or dl,dl` ébauchée) mais ne fait que stocker les pointeurs ; son `add dl,0` est un no-op.
- Le test est différé au `DLL_PROCESS_DETACH` : il faut quitter le crackme pour voir le verdict.
- Les octets après `call IsDebuggerPresent` (`0x40122d`) désassemblent en code absurde : c'est du bruit anti-debug. Sous Wine la boîte de l'exe affiche « not valid » **même avec le bon serial** — c'est le leurre, à ignorer.
- Le crackme crée `advaapi32.dll` dans son dossier : lancer sur une **copie** (le script de test le fait dans un `mktemp -d`).

## Vérification

Preuve live avec le binaire d'origine (extrait du zip) sous Wine 10 : `tools/wine-live-test.sh petik IJDDKLFFGG` — Xvfb, clic sur les edits, saisie, clic *Check serial*, fermeture de la fenêtre, capture de la dernière boîte.

| Cas | Résultat | Capture |
|---|---|---|
| `petik` / `IJDDKLFFGG` : boîte de l'exe | « Your serial is not valid » (leurre) | [`screenshot-decoy-dialog.png`](analysis/screenshot-decoy-dialog.png) |
| `petik` / `IJDDKLFFGG` : à la sortie (DLL) | **« Congratulations, you are registered now! »** (titre `CRACKME #1 BY VCTOR - REGISTERED`) | [`screenshot-ok.png`](analysis/screenshot-ok.png) |
| `petik` / `AAAAAAAAAA` : à la sortie | « You are not regestered yet » (titre `CRACKME #1 BY VCTOR`) | [`screenshot-ko.png`](analysis/screenshot-ko.png) |

## Notes

- Pas de GDB ni d'x64dbg utilisés : reverse statique (`objdump`) + preuve Wine.
- Pas de patch : `original/` intact ; le zip a été dépaqueté sous `analysis/extracted/`.
- Le serial n'est pas unique (seule la somme de chaque paire compte).
- Noms non-ASCII (> 0x7f) : le solveur travaille en latin-1, non testé en live.
