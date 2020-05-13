; Elementos de Sistemas : 2018a
; Rafael Corsi
; Hardware : Z0.1
;
; Data :
;    - Dez 2018
; Descrição :
;    - Movimentação de dados da memoria RAM
;
; RAM[0] = RAM[1]
; RAM[1] = RAM[0]
; RAM[3] = 1

;====================================================

; -----------------------
; RAM[0] = RAM[1]
; -----------------------

leaw $R0, %A
movw (%A), %D
leaw $R4, %A
movw %D, (%A) ; <--- armazena valor de RAM[0] em RAM[4]

leaw $R1, %A
movw (%A), %D
leaw $R0, %A
movw %D, (%A)

; -----------------------
; RAM[1] = RAM[0]
; -----------------------

leaw $R4, %A ; <--- lê antigo valor de RAM[0]
movw (%A), %D ; <--- armazena em %D
leaw $R1, %A
movw %D, (%A) ; <--- e guarda em RAM[1]

; -----------------------
; RAM[3] = 1
; -----------------------

movw $1, %D
leaw $R3, %A
movw %D, (%A)