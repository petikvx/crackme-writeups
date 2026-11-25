# liboxin

Auteur local : **`liboxin`** (site : [liboxin](https://crackmes.one/user/liboxin)).

Voir [`author.yml`](author.yml) · [`catalog.yml`](catalog.yml).

## Progression

| # | Titre | ID | Plateforme | Solution |
|---|---|---|---|---|
| 1 | [unpack me v1](6af59fc52c7537120cbe8a22/) | [`6af59fc5…`](https://crackmes.one/crackme/6af59fc52c7537120cbe8a22) | Windows PE64 MSVC + protecteur « aegis » (.text chiffré), serial fixe | `N6NY-PHP1-WL48-NO51` (S-box + accumulateur, `tools/liboxin-solve.py`) |
| 2 | [my ollvm test](6af347ef4ab951a9999da55d/) | [`6af347ef…`](https://crackmes.one/crackme/6af347ef4ab951a9999da55d) | Windows PE64 MSVC + OLLVM (flattening + MBA), strings chiffrées | `123456` (strcmp contre mot de passe fixe, `tools/ollvm-test-solve.py`) |
| 3 | [hellgate1](6af00c585fa39ab0d4ac2236/) | [`6af00c58…`](https://crackmes.one/crackme/6af00c585fa39ab0d4ac2236) | Windows PE64 Rust + protecteur « aegis » + mini-VM (9 rounds inversibles) | `60ca82e9e1d419424688d241affaa094` → `CMO{9_r0und5_0f_c0ld_5t33l_0n3_d00r_0nly}` (`tools/hellgate-solve.py`) |
| 4 | [CrackMe Hard 4](6a1b1a448fab7bbca27302fc/) | [`6a1b1a44…`](https://crackmes.one/crackme/6a1b1a448fab7bbca27302fc) | Windows PE64 Rust, 8 checks ET-és (hash, poly mod p, timing) | `RUSTCM{4lG3brAic_VM_0bfusc4t3d_2026!}` (`tools/liboxin-hard4-solve.py`) |
| 5 | [easy vm v2](6b06510b4b6d53e8802ed888/) | [`6b06510b…`](https://crackmes.one/crackme/6b06510b4b6d53e8802ed888) | Windows PE64 console + protecteur « aegis » v144 (`.text` chiffré par pages) + 2 VM | **pending** — table AGIS déchiffrée (`tools/aegis-table-v144.py`), boucle XOR des pages encore dans une zone `.aegis` chiffrée |
