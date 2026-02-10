

        ORG 2000h          

P1Y:    DB 12      ; Position Y raquette gauche (0-23)
P2Y:    DB 12      ; Position Y raquette droite
BALLX:  DB 16      ; Position X balle (0-31)
BALLY:  DB 12      ; Position Y balle (0-23)
VX:     DB 1       ; Vitesse X : -1=gauche, +1=droite
VY:     DB 1       ; Vitesse Y : -1=haut, 0, +1=bas
SCORE1: DB 0       ; Score joueur 1
SCORE2: DB 0       ; Score joueur 2



        ORG 2000h           

START:
        ; Initialisation des variables
        CALL INIT_VARIABLES

        ; Boucle principale du jeu
MAIN_LOOP:


        CALL DELAY

    
        JP MAIN_LOOP



; Initialise toutes les variables
INIT_VARIABLES:
        ; Initialisation raquettes
        LD A, 12
        LD (P1Y), A
        LD (P2Y), A

        ; Initialisation balle au centre
        LD A, 16
        LD (BALLX), A
        LD A, 12
        LD (BALLY), A

        ; Vitesse initiale
        LD A, 1
        LD (VX), A
        LD (VY), A

        ; Scores à zéro
        LD A, 0
        LD (SCORE1), A
        LD (SCORE2), A

        RET


CHAR_RAQUETTE:  DB 'I'
CHAR_BALLE:     DB 'O'
CHAR_VIDE:      DB ' '
CHAR_MUR:       DB '-'


        END START          
