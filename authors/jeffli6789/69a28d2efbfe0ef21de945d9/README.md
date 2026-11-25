# jeffli6789 — RE CTF 2026 : `httpd` (backdoor ICMP FreeBSD / Go)

| | |
|---|---|
| **ID** | [`69a28d2efbfe0ef21de945d9`](https://crackmes.one/crackme/69a28d2efbfe0ef21de945d9) ([`ORIGIN.yml`](ORIGIN.yml)) |
| **Auteur** | jeffli6789 |
| **Plateforme** | FreeBSD 14.3 ELF64 x86-64, Go 1.17.1 + cgo (libpcap), non strippé |
| **SHA-256 (zip)** | `098d7f95f06e0ce0bb162a6aa13d0ece5b81463d10e2f5bab1e2471c277443a1` |

Énoncé (`README.md` dans le zip) : *« This file was found on an infected host. Can you figure out what it does? »*

## Fichiers

| Chemin | Rôle |
|---|---|
| `original/httpd_handout.zip` | archive d'origine (inchangée) |
| `analysis/handout/` | zip extrait (`httpd`, `README.md`) — sans valeur de preuve, copie de travail |
| `tools/httpd-solve.py` | solveur : reconstruit la clé AES depuis le paquet ICMP « magique » et déchiffre |

## Réponse

**Flag : `CMO{fUn_w1th_m4g1c_p4ck3t5}`**

```bash
python3 -I tools/httpd-solve.py        # affiche paramètres du paquet + flag
python3 -I tools/httpd-solve.py -q     # flag seul
```

Paquet déclencheur (celui d'un `ping -c1 -p c6de5fe5 -s 4` avec id `0x3713`) : Ethernet/IPv4, DF (`4000`), TTL 64, ICMP echo request, id octets `37 13`, seq 1, données `c6 de 5f e5`, checksum ICMP `0x9a27`. Clé AES = IV = `c2c5400040019a27c6de5fe53713f95c`.

## Premier regard

```bash
file httpd                    # ELF 64-bit FreeBSD 14.3, Go BuildID, not stripped
go version -m httpd           # go1.17.1, dep github.com/google/gopacket v1.1.19
go tool nm -size httpd | grep ' main\.'   # main.main, main.handler seulement
strings -n 6 httpd | grep 'Server is running'   # http://localhost:8080
```

Le `main` visible (`/home/crudd/httpd3/httpd.go`) est un décor : `main.main` lance une goroutine, enregistre `main.handler` (répond `GET` → 22 octets, sinon 405 `0x195`) et fait un `ListenAndServe(":8080")`. Rien d'intéressant. Mais `gopacket/pcap` + cgo libpcap dans un « httpd » sont louches, et `main.main` fait `runtime.newproc` sur une closure **qui n'est pas dans le package main**.

## Comment on trouve

1. **Ancrage de la goroutine.** Dans `go tool objdump -s main.main httpd` : `LEAQ …(IP), AX` (0x747e42) puis `CALL runtime.newproc`. Le funcval pointé est à `0x2b33e8` (rodata) ; son premier qword vaut `0x748080`, soit le symbole **`net/http.init`** (taille ≈ 0x6a0, anormale pour un init de net/http : fonction du malware camouflée sous un nom stdlib, d'où l'absence dans `main.*`).
2. **Lecture** : `objdump -d -M intel --start-address=0x748080 --stop-address=0x748725 httpd`.
   - `pcap.OpenLive("re0", 0x640, promisc=true, timeout=-1)` (chaîne `re0` à `0x287c8d`, longueur 3), `SetBPFFilter("icmp")` (`0x288329`, longueur 4) → sniffeur ICMP sur l'interface `re0`.
   - Boucle sur `PacketSource.Packets()`, pour chaque paquet `pkt` (octets bruts Ethernet, longueur ≥ 0x2e vérifiée) :
     ```
     cmp word  [pkt+0x26], 0x1337      ; ICMP id (octets 37 13)
     cmp word  rol8([pkt+0x10]), 0x20  ; IP total length = 32 → ICMP 8 + 4 octets de données
     cmp dword [pkt+0x2a], 0xe55fdec6  ; données = c6 de 5f e5
     cmp byte  [pkt+0x22], 8           ; ICMP type = echo request
     ```
     (offsets d'un trame Ethernet 14 + IPv4 20 : ICMP à 0x22, checksum 0x24, id 0x26, seq 0x28, data 0x2a).
3. **Clé.** Pendant ces tests, le code construit 16 octets (`makeslice` + 5 `growslice`) :

   | Clé[i:j] | Source |
   |---|---|
   | `[0:2]` | `rol16( (data[2:4]) ^ cksum , 8)` (`shr ecx,16 ; xor ebx ; rol cx,8`) |
   | `[2:6]` | `pkt[0x14:0x18]` = IP flags/frag (2), TTL, proto |
   | `[6:8]` | `pkt[0x24:0x26]` = checksum ICMP (octets du fil) |
   | `[8:12]` | `pkt[0x2a:0x2e]` = `c6 de 5f e5` |
   | `[12:14]` | `pkt[0x26:0x28]` = `37 13` |
   | `[14:16]` | `rol16( cksum ^ data[0:2] , 8)` |

   (mots lus en little-endian, comme x86.)
4. **Déchiffrement.** Un bloc de 32 octets est reconstruit à partir de 4 `movabs` (`0xc07edfb429a5f151`, `0xb34e3d248f2f3b2a`, `0x8cdd9c0bcfb0ed5a`, `0x0c64c43e9b0ee6cd`, stockés LE), puis `aes.NewCipher(key)`, `cipher.NewCBCDecrypter(block, iv=key)` (**l'IV est la même tranche de 16 octets que la clé**), `CryptBlocks`, `Fprintln(os.Stdout, "%s")` du résultat. Aucun test d'égalité : le flag est juste affiché si le paquet passe les 4 filtres.
5. **Inconnues restantes.** Le paquet « magique » n'impose pas tout : IP flags/frag (2 o), TTL, proto (=1) et checksum ICMP (lié à la seq) entrent dans la clé. Un vrai `ping` donne un checksum ICMP valide `~(0x0800+0x3713+seq+0xc6de+0x5fe5)` ; le solveur énumère frag ∈ {DF `4000`, `0000`}, TTL ∈ {64,128,255,63,32}, seq 0..65535 et s'arrête au premier plaintext 100 % ASCII imprimable. Premier hit : DF, TTL 64, seq 1 → `CMO{fUn_w1th_m4g1c_p4ck3t5}` (préfixe `CMO{` attendu, la collision fortuite est de l'ordre de 2⁻³²).

Pas de session GDB, pas de MCP IDA : analyse 100 % statique (`go tool nm/objdump`, `objdump`).

## Vérification

- `python3 -I tools/httpd-solve.py` → `frag=4000 ttl=64 seq=1 key=c2c5400040019a27c6de5fe53713f95c` / `flag: CMO{fUn_w1th_m4g1c_p4ck3t5}`.
- **Limite honnête** : le binaire d'origine est un ELF **FreeBSD** (interpréteur `/libexec/ld-elf.so.1`, capture libpcap sur `re0`, root requis) ; il ne peut pas être exécuté sur cet hôte Linux (pas de FreeBSD / `bsd-user`), et c'est de plus un échantillon présenté comme malveillant. La preuve est donc **statique** : la routine lue dans le binaire (clé, IV, ciphertext) reproduite telle quelle dans le solveur donne un flag ASCII au format attendu `CMO{…}`, ce qui vaut confirmation forte, mais elle n'a **pas** été observée en live sur le binaire.
- KO : tout paquet ICMP avec autre id / longueur / données est ignoré (`jne` retour à la boucle) ; une clé fausse (ex. TTL 65) donne un plaintext binaire non imprimable.

## Notes

- Piège principal : le code malveillant est dans `net/http.init` (nom usurpé), `main.*` est un leurre.
- Le flag dépend du paquet exact (clé dérivée de TTL/flags/checksum) : sans solveur on peut aussi le récupérer en envoyant le ping depuis un hôte FreeBSD (`ping -c1 -s4 -p c6de5fe5` avec id 0x3713 forgé, p. ex. scapy).
- Pas d'utilisateur → pas d'exemple `petik` pour ce challenge.
