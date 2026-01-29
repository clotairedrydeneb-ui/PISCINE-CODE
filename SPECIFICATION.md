# Spécifications du projet Z80 Pong

## Jeu d'instructions minimal
- NOP, HALT
- LD r,n, LD (nn),A, LD A,(nn)
- JP nn, JR e
- INC r, DEC r
- ADD A,r, SUB r, CP n

## Format binaire (Z81B)
- Magic: "Z81B"
- LoadAddr: 0x2000
- EntryPoint: 0x2000
- CodeSize: taille du code

## Mémoire
- 0x0000-0x1FFF : Réservé
- 0x2000-0x7FFF : Code
- 0x8000-0x87FF : Écran (32x24)
- 0x8800-0x88FF : Variables jeu

## Variables du jeu
- P1Y, P2Y : positions raquettes
- BALLX, BALLY : position balle
- VX, VY : vitesse
- S1, S2 : scores
