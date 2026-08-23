# Cauchy's KeygenMe no.1 (cauchy_htb / HTBTeam)

| | |
|---|---|
| **ID** | [`5ab77f5f33c5d40ad448c7f5`](https://crackmes.one/crackme/5ab77f5f33c5d40ad448c7f5) |
| **Auteur (site)** | crackmes.de / cauchy_htb |
| **Auteur (local)** | crackmes-de |
| **Plateforme** | Windows PE32 (GUI), packed **FSG 1.33** |
| **SHA-256 (zip)** | `2269c09e84cbc2e1148880fe1adc276c52a9ff1e9e630ceb34a9a9218c128163` |

Voir [`ORIGIN.yml`](ORIGIN.yml).

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/cauchy_km1.exe` | binaire FSG d’origine |
| `original/cauchy_km1.unpacked.exe` | dump OEP `0x401000` (unipacker) |
| `original/_u/HTBTeam.nfo` | NFO auteur |
| `tools/cauchy-km1-solve.py` | keygen |
| `analysis/notes.txt` | notes de reverse |

## Réponse

Backdoor cmdline (active les modules RSA **216 bits**) :

```text
cauchy_km1.exe -htbt!
```

| Name | Serial |
|---|---|
| **`petik`** | `CAC86F99EEC927DD65960777C1C2A563359741AD706279EC6F6CC5F34A0CF080` |

```bash
./tools/cauchy-km1-solve.py -q petik
# CAC86F99EEC927DD65960777C1C2A563359741AD706279EC6F6CC5F34A0CF080
```

### Patch 1 octet (pas un `JMP`)

NFO : *« patch ONLY 1 BYTE, and this is NOT A JUMP »* — le taunt XOR-0xFF se moque de ceux qui patchent le `Jcc` du goodboy.

Équivalent durable du backdoor (toute chaîne `-xxxxx` accepte les petits `N`) : dans l’unpacked, à **VA `0x401A0A`** (offset fichier `0x1A0A`), l’immédiat relatif du `jne` post-checksum :

```text
75 48    jne  hard_RSA1024
```

→ changer **`48` → `00`** (`jne $+2` = retombée dans le decode 216 bits). Ce n’est **pas** transformer un `Jcc` en `JMP` (`EB`).

Sans patch : lancer avec **`-htbt!`**.

## Premier regard

- FSG 1.33 ; unpacked ~110 KiB, 2 sections, OEP `0x401000`.
- Strings : `Good, your abilities ROX`, `10001`, `HTBT-4cr_`, welcome + contrainte de patch.
- Deux paires de modules XOR-0xFF :
  - **54 hex** (216 bits) @ `0x40100e` / `0x401142` — backdoor ;
  - **256 hex** (1023 bits) @ `0x401246` / `0x40139a` — leurre « factorize RSA1024 ».

## Flow

1. `GetCommandLineA` + scan `-` / `"` (`0x4019B6`).
2. Si `-XXXXX` et checksum OK → decode petits `N` ; sinon path `"` → gros `N` + taunt dans le trou RC4.
3. Check : name → RC4 custom → mix → hex → `M^e mod N1` ; serial hex → TEA ×2 + mix dword → `M2^e mod N2` ; `bigint_cmp`.
4. Success → MessageBox *Good, your abilities ROX*.

### Checksum `-XXXXX`

5 octets après `-` ; le 5ᵉ est le compteur de boucle. Cible après mix : `0x450C74A2`. Inverse → seul mot de passe imprimable : **`htbt!`**.

### RSA easy

```text
N1 = 240985366002918909296416009698659 × 283147134056496125206437154455851
N2 = 251238060053420001643239680117243 × 264091152450441115281854810400227
e  = 0x10001
```

Keygen : `C = M^e mod N1`, `M2 = C^{d2} mod N2`, puis inverse TEA / mix → serial hex.

## Vérification

```bash
./tools/cauchy-km1-solve.py petik
# name   : petik
# serial : CAC86F99EEC927DD65960777C1C2A563359741AD706279EC6F6CC5F34A0CF080
```

Self-check interne : `pow(M2, e, N2) == C`. Preuve live : Wine + `-htbt!` + name/serial ci-dessus.

## Notes

- Patcher le `jne` du MessageBox = « lame move » volontairement moqué.
- Les gros `N` 1024 bits ne sont pas factorisés ici ; le design pousse vers `-htbt!` / le patch d’offset.
- `e` ASCII `10001` parsé en base 16 → `0x10001`.
