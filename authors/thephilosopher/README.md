# thephilosopher

Auteur : [ThePhilosopher](https://crackmes.one/user/ThePhilosopher).

| # | Titre | Solution |
|---|---|---|
| 1 | [Bruteverse](634bdec633c5d4425e2cd8ee/) | `R2V2R5IN5_4S_R42LL7_F2N` |
| 2 | [The Matrix](617ec2cb33c5d4329c345422/) | `admin`/`password` → `}}}}}}}iQH` → `EEEEEEcgox` → `2022`/`2021`/`2020` |

Section **Debug GDB** : Bruteverse leurre `_start` / `.data` XOR `0xf3` ; Matrix `_start` + FIFO (scores `4` / `0x46d` / `0x3d8` / `r15=3`).
