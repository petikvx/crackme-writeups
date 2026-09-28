# rascal999 encrypt — reprise

Résolu le 2026-09-28. Write-up : [`../README.md`](../README.md).

La recherche ±8e6 sur le préfixe `Congratulations` était le bon modèle (MT19937 FreeBASIC, `d ∈ 0..10`) mais la mauvaise boîte. Les entiers sont `756384985` et `999345234`. Un meet-in-the-middle sur tout `uint32` donne plusieurs centaines de paires compatibles avec 15 octets ; une seule déchiffre les 318 octets en anglais.
