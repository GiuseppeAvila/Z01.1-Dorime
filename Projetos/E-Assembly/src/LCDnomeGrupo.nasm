; Arquivo: LCDnomeGrupo.nasm
; Curso: Elementos de Sistemas
; Criado por: Rafael Corsi
; Data: 28/3/2018
;
; Escreva no LCD o nome do grupo

; Salvando 20 na RAM[1]. Este valor é específico pois a cada 20 valores no índice da RAM no LCD pula-se uma linha.
leaw $20, %A
movw %A, %D
leaw $R1, %A
movw %D, (%A)

; Estipulando a RAM do LCD a ser desenhada e salvando ela na RAMS, valor calculado através de pixel graphics
leaw $18631, %A 
movw %A, %D
leaw $R11, %A
movw %D, (%A)

leaw $18632, %A 
movw %A, %D
leaw $R12, %A
movw %D, (%A)

leaw $18633, %A 
movw %A, %D
leaw $R13, %A
movw %D, (%A)

leaw $18634, %A 
movw %A, %D
leaw $R14, %A
movw %D, (%A)

leaw $18635, %A 
movw %A, %D
leaw $R15, %A
movw %D, (%A)

leaw $18636, %A 
movw %A, %D
leaw $R16, %A
movw %D, (%A)

; Desenhando D, Topo
leaw $65534, %A
movw %A, %D
leaw $R11, %A
movw (%A), %A
movw %D, (%A)

leaw $R11, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R11, %A
movw %D, (%A)

leaw $14, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; Desenhando D, Meio
DRAW_D:
leaw $16386, %A
movw %A, %D
leaw $R11, %A
movw (%A), %A
movw %D, (%A)

leaw $R11, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R11, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_D.
leaw $DRAW_D, %A
jne
nop

; Desenhando D, Base
leaw $65534, %A
movw %A, %D
leaw $R11, %A
movw (%A), %A
movw %D, (%A)


; Desenhando O, Topo
leaw $16380, %A
movw %A, %D
leaw $R12, %A
movw (%A), %A
movw %D, (%A)

leaw $R12, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R12, %A
movw %D, (%A)

leaw $14, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; Desenhando O, Meio
DRAW_O:
leaw $16386, %A
movw %A, %D
leaw $R12, %A
movw (%A), %A
movw %D, (%A)

leaw $R12, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R12, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_O.
leaw $DRAW_O, %A
jne
nop

; Desenhando O, Base
leaw $16380, %A
movw %A, %D
leaw $R12, %A
movw (%A), %A
movw %D, (%A)

; Desenhando R, Topo
leaw $32764, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $7, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; Desenhando R, Meio
DRAW_R1:
leaw $16386, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_R1.
leaw $DRAW_R1, %A
jne
nop

; Desenhando R, Base
leaw $32764, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $16416, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $2, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

DRAW_R2:
leaw $16416, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_R2.
leaw $DRAW_R2, %A
jne
nop

leaw $16400, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $2, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

DRAW_R3:
leaw $16392, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)

leaw $R13, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R13, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_R3.
leaw $DRAW_R3, %A
jne
nop

leaw $16388, %A
movw %A, %D
leaw $R13, %A
movw (%A), %A
movw %D, (%A)


; Desenhando I, Topo
leaw $16380, %A
movw %A, %D
leaw $R14, %A
movw (%A), %A
movw %D, (%A)

leaw $R14, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R14, %A
movw %D, (%A)

leaw $14, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; Desenhando I, Meio
DRAW_I:
leaw $256, %A
movw %A, %D
leaw $R14, %A
movw (%A), %A
movw %D, (%A)

leaw $R14, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R14, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_I.
leaw $DRAW_I, %A
jne
nop

; Desenhando I, Base
leaw $16380, %A
movw %A, %D
leaw $R14, %A
movw (%A), %A
movw %D, (%A)

leaw $R14, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R14, %A
movw %D, (%A)

; Desenhando M, Topo
leaw $16380, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

leaw $20490, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

leaw $18450, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

leaw $17442, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

leaw $16962, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

leaw $16770, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

leaw $10, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; Desenhando M, Base
DRAW_M:
leaw $16386, %A
movw %A, %D
leaw $R15, %A
movw (%A), %A
movw %D, (%A)

leaw $R15, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R15, %A
movw %D, (%A)

; Se ainda há linhas a serem desenhadas, pule para DRAW_M.
leaw $DRAW_M, %A
jne
nop

; Desenhando E, Topo
leaw $16380, %A
movw %A, %D
leaw $R16, %A
movw (%A), %A
movw %D, (%A)

leaw $R16, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R16, %A
movw %D, (%A)

leaw $7, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

; Desenhando E, Meio
DRAW_E1:
leaw $16384, %A
movw %A, %D
leaw $R16, %A
movw (%A), %A
movw %D, (%A)

leaw $R16, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R16, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_E1.
leaw $DRAW_E1, %A
jne
nop

leaw $32704, %A
movw %A, %D
leaw $R16, %A
movw (%A), %A
movw %D, (%A)

leaw $R16, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R16, %A
movw %D, (%A)

leaw $6, %A
movw %A, %D
leaw $R2, %A
movw %D, (%A)

DRAW_E2:
leaw $16384, %A
movw %A, %D
leaw $R16, %A
movw (%A), %A
movw %D, (%A)

leaw $R16, %A
movw (%A), %D
leaw $R1, %A
addw %D, (%A), %D
leaw $R16, %A
movw %D, (%A)

leaw $R2, %A
movw (%A), %D
decw %D
movw %D, (%A)
leaw $R2, %A
movw (%A), %D

; Se ainda há linhas a serem desenhadas, pule para DRAW_E2.
leaw $DRAW_E2, %A
jne
nop

; Desenhando E, Base
leaw $16380, %A
movw %A, %D
leaw $R16, %A
movw (%A), %A
movw %D, (%A)
