; Arquivo: LCDQuadrado.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Desenhe um quadrado no LCD

leaw $18634, %A 
movw %A, %D
leaw $R0, %A
movw %D, (%A)

leaw $20, %A
movw %A, %D
leaw $R1, %A
movw %D, (%A)

leaw $16, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

LOOP:

leaw $R0, %A
movw (%A), %A
movw $-1, (%A)

leaw $R0, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R0, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

leaw $LOOP, %A
jne
nop
