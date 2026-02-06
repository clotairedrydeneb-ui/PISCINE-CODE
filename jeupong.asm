 ============================================
; PONG Z80 - Semaine 2 : Squelette de base
; Développeur Jeu (Dev C)
; ============================================

        ORG 2000h           ; Le code commence à l'adresse 2000h

; ============================================
; SECTION DES DONNÉES (variables)
; ============================================

        ; On réserve de l'espace pour nos variables
        ; Adresse 0x8800 et suivantes
        ORG 8800h

P1Y:    DB 12      ; Position Y raquette gauche (0-23)
P2Y:    DB 12      ; Position Y raquette droite
BALLX:  DB 16      ; Position X balle (0-31)
BALLY:  DB 12      ; Position Y balle (0-23)
VX:     DB 1       ; Vitesse X : -1=gauche, +1=droite
VY:     DB 1       ; Vitesse Y : -1=haut, 0, +1=bas
SCORE1: DB 0       ; Score joueur 1
SCORE2: DB 0       ; Score joueur 2

; ============================================
; SECTION DU CODE
; ============================================

        ORG 2000h           ; On retourne à l'adresse du code

; -------------------------------------------------
; POINT D'ENTRÉE DU PROGRAMME
; -------------------------------------------------
START:
        ; Initialisation des variables
        CALL INIT_VARIABLES

        ; Boucle principale du jeu
MAIN_LOOP:
        ; TODO Semaine 3-4 : Lire clavier
        ; TODO Semaine 5 : Déplacer balle
        ; TODO Semaine 6 : Collisions
        ; TODO Semaine 6 : Dessiner écran

        ; Petite temporisation (vide pour l'instant)
        CALL DELAY

        ; Recommencer la boucle
        JP MAIN_LOOP

; -------------------------------------------------
; SOUS-ROUTINES
; -------------------------------------------------

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

; Temporisation simple (vide pour l'instant)
DELAY:
        ; TODO Semaine 4 : Implémenter une vraie temporisation
        RET

; -------------------------------------------------
; DONNÉES CONSTANTES
; -------------------------------------------------

; Caractères pour l'affichage (à définir plus tard)
CHAR_RAQUETTE:  DB 'I'
CHAR_BALLE:     DB 'O'
CHAR_VIDE:      DB ' '
CHAR_MUR:       DB '-'

; -------------------------------------------------
; FIN DU PROGRAMME
; -------------------------------------------------
        END START           ; Point d'entrée = START
