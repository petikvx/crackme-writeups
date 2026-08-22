# OckoTajny's netCrack

> **Origine** : [`ORIGIN.yml`](ORIGIN.yml) · [crackmes.one](https://crackmes.one/crackme/693017b52d267f28f69b82ae) · id `693017b52d267f28f69b82ae`

Crackme **ELF64** Linux asm (syscalls + sockets).  
Auteur site : **OckoTajny**.

| Fichier | Rôle |
|---|---|
| [`original/netcrack.zip`](original/netcrack.zip) | ZIP site |
| [`original/netCrack`](original/netCrack) | binaire |
| [`original/readme.md`](original/readme.md) | tips auteur |
| [`tools/netcrack-solve.py`](tools/netcrack-solve.py) | explication + `--demo` |
| [`analysis/ok.txt`](analysis/ok.txt) | preuve `127.0.0.1` + serveur local |

## Réponse

Le prompt *« Enter the password: »* attend une **adresse IP**, pas le mot `Platon`.

| Élément | Valeur |
|---|---|
| Input | **IP** joignable (ex. `127.0.0.1` avec serveur local) |
| Port | **3125** (`htons(0xc35)`) |
| Check | 6 derniers octets de la réponse HTTP == **`Platon`** |
| Succès | `Congrats, you've won!! :)` |

```bash
python3 tools/netcrack-solve.py --demo
# … Congrats, you've won!! :)
```

---

## Analyse

1. `getInput` → buffer `0x4031c8` (Host / `inet_addr`).
2. `getRequest` : `socket` → `connect(IP, 3125)` → `GET / HTTP/1.0` + `Host: <IP>`.
3. `checkResponse` : `repz cmps` des **6** octets `response[len-6..]` vs symbole `password` = **`Platon`**.

Le readme : *« maybe it doesnt expect a password, but something else »*.

Hashes (ZIP) : MD5 `896d1961b321a7ab4dca6a793cab89db` · SHA-256 `eeae8ee1378e314b87b6609a0cba99e42c67eb8d45db5cdc92964b587fa30ab2`.

Site : difficulty **2.2** · quality **4.0**.
